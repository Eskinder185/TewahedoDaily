-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 25 OF 32
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
  -- yaseregnin-lemebekel ("Yaseregnin Lemebekel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4116eec6-2785-4b4e-a030-8b94b43424b3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 1
አዳኜ የምልህ ብቸ ኛው መድህኔ
ተሰቅለህ ያየሁህ ለሀጥያተኛው ለኔ
እኮ ካንተ ሌላ ከቶ ወዴት አለ
ሕይወቱን ሰውቶ ሞቴን የገደለ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 2
በአመፀኞች ሽፍቶች መሃል
ንፁሁ በግ ተገኝተሃል
ያለ ስስት ሳመልክህ
እኖራለሁ በቤትህ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 3
በደምህ ገድበህ የአይኖቼን እንባ
ትናንቴን ሻርክልኝ ገነት እንድገባ
ባርነቴ ቀርቶ የኃጢተኞች ዋና
አመስጋኝ አረከኝ አስይዘህ በገና

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 4
የታረድከው ፋሲካዬ
ያን ክፉ ቀን ማለፊያ
ምዘምርህ በመንፈስ
ክብሬ እኮ ነህ ኢየሱስ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 5
የነሐሱን እባብ በእምነት ተመልክተው
እንደተፈወሱ የሙሴን ቃል ሰምተው
ወደ ተሰቀለው ይመልከት አይናችን
አማራጭ የሌለው እርሱ ነው ቤዛችን

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 6
በደለኛ አመጸኛ
ዋና ሳለሁ ወንጀለኛ
ስምህን ይዤ በዓለም ልዞር
አስታጠቅከኝ የፅድቅን ጦር

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 7
አክሊለ ሾህ ደፍተህ በሽቶች መሃል
ተሰቅለህ ያየሁህ በእንጨት መስቀል
በልቤ መቅረዝ ላይ ለዘላለም አብራ
ሰው ሆኛለሁና በማዳንህ ስራ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 8
ቅኔ ዜማ መተንፈሴ
ቀንም ማታ ማወደሴ
አምሮልኝ ነው ባንተ ሕይወቴ
ጌታ ኢየሱስ አብርሆቴ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 1
Adagne yemlh biche gnaw medhne
Teseqleh yayehuh lehet’yategnaw lene
Eko kante lela keto wedet ale
Hiywetun sewto moten yegedele

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 2
Beamets’egnoch shftoch mehal
Nits’uhu beg tegegntehal
Yale sist samelkh
Enoralehu bebeth

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 3
Bedemh gedbeh yeaynochen enba
Tinanten sharklgn genet endgeba
Barnete qerto yehat’itegnoch wana
Amesgagn arekegn asyzeh begena

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 4
Yetaredkew fasikaye
Yan kifu qen malefiya
Mizemrh bemenfes
Kibre eko neh Iyesus

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 5
Yenehesun ebab beemnet temelktew
Endetefewesu yemusen qal semtew
Wede teseqelew yimelket aynachn
Amarach’ yelelew ersu new bezachn

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 6
Bedelegna amets’egna
Wana salehu wenjelegna
Simhn yizhe bealem lizor
Astat’eqkegn yets’dqn t’or

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 7
Aklile shoh defteh beshtoch mehal
Teseqleh yayehuh beench’et mesqel
Belbe meqrez lay lezelalem abra
Sew hognalehuna bemadanh sira

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 8
Qine zema metenfese
Qenm mata mawedese
Amrolgn new bante hiywete
Geta Iyesus abrhote

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 1
አዳኜ የምልህ ብቸ ኛው መድህኔ
ተሰቅለህ ያየሁህ ለሀጥያተኛው ለኔ
እኮ ካንተ ሌላ ከቶ ወዴት አለ
ሕይወቱን ሰውቶ ሞቴን የገደለ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 2
በአመፀኞች ሽፍቶች መሃል
ንፁሁ በግ ተገኝተሃል
ያለ ስስት ሳመልክህ
እኖራለሁ በቤትህ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 3
በደምህ ገድበህ የአይኖቼን እንባ
ትናንቴን ሻርክልኝ ገነት እንድገባ
ባርነቴ ቀርቶ የኃጢተኞች ዋና
አመስጋኝ አረከኝ አስይዘህ በገና

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 4
የታረድከው ፋሲካዬ
ያን ክፉ ቀን ማለፊያ
ምዘምርህ በመንፈስ
ክብሬ እኮ ነህ ኢየሱስ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 5
የነሐሱን እባብ በእምነት ተመልክተው
እንደተፈወሱ የሙሴን ቃል ሰምተው
ወደ ተሰቀለው ይመልከት አይናችን
አማራጭ የሌለው እርሱ ነው ቤዛችን

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 6
በደለኛ አመጸኛ
ዋና ሳለሁ ወንጀለኛ
ስምህን ይዤ በዓለም ልዞር
አስታጠቅከኝ የፅድቅን ጦር

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 7
አክሊለ ሾህ ደፍተህ በሽቶች መሃል
ተሰቅለህ ያየሁህ በእንጨት መስቀል
በልቤ መቅረዝ ላይ ለዘላለም አብራ
ሰው ሆኛለሁና በማዳንህ ስራ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 8
ቅኔ ዜማ መተንፈሴ
ቀንም ማታ ማወደሴ
አምሮልኝ ነው ባንተ ሕይወቴ
ጌታ ኢየሱስ አብርሆቴ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ',
        lyrics_transliteration = 'CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 1
Adagne yemlh biche gnaw medhne
Teseqleh yayehuh lehet’yategnaw lene
Eko kante lela keto wedet ale
Hiywetun sewto moten yegedele

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 2
Beamets’egnoch shftoch mehal
Nits’uhu beg tegegntehal
Yale sist samelkh
Enoralehu bebeth

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 3
Bedemh gedbeh yeaynochen enba
Tinanten sharklgn genet endgeba
Barnete qerto yehat’itegnoch wana
Amesgagn arekegn asyzeh begena

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 4
Yetaredkew fasikaye
Yan kifu qen malefiya
Mizemrh bemenfes
Kibre eko neh Iyesus

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 5
Yenehesun ebab beemnet temelktew
Endetefewesu yemusen qal semtew
Wede teseqelew yimelket aynachn
Amarach’ yelelew ersu new bezachn

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 6
Bedelegna amets’egna
Wana salehu wenjelegna
Simhn yizhe bealem lizor
Astat’eqkegn yets’dqn t’or

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 7
Aklile shoh defteh beshtoch mehal
Teseqleh yayehuh beench’et mesqel
Belbe meqrez lay lezelalem abra
Sew hognalehuna bemadanh sira

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 8
Qine zema metenfese
Qenm mata mawedese
Amrolgn new bante hiywete
Geta Iyesus abrhote

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4116eec6-2785-4b4e-a030-8b94b43424b3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 1
አዳኜ የምልህ ብቸ ኛው መድህኔ
ተሰቅለህ ያየሁህ ለሀጥያተኛው ለኔ
እኮ ካንተ ሌላ ከቶ ወዴት አለ
ሕይወቱን ሰውቶ ሞቴን የገደለ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 2
በአመፀኞች ሽፍቶች መሃል
ንፁሁ በግ ተገኝተሃል
ያለ ስስት ሳመልክህ
እኖራለሁ በቤትህ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 3
በደምህ ገድበህ የአይኖቼን እንባ
ትናንቴን ሻርክልኝ ገነት እንድገባ
ባርነቴ ቀርቶ የኃጢተኞች ዋና
አመስጋኝ አረከኝ አስይዘህ በገና

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 4
የታረድከው ፋሲካዬ
ያን ክፉ ቀን ማለፊያ
ምዘምርህ በመንፈስ
ክብሬ እኮ ነህ ኢየሱስ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 5
የነሐሱን እባብ በእምነት ተመልክተው
እንደተፈወሱ የሙሴን ቃል ሰምተው
ወደ ተሰቀለው ይመልከት አይናችን
አማራጭ የሌለው እርሱ ነው ቤዛችን

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 6
በደለኛ አመጸኛ
ዋና ሳለሁ ወንጀለኛ
ስምህን ይዤ በዓለም ልዞር
አስታጠቅከኝ የፅድቅን ጦር

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 7
አክሊለ ሾህ ደፍተህ በሽቶች መሃል
ተሰቅለህ ያየሁህ በእንጨት መስቀል
በልቤ መቅረዝ ላይ ለዘላለም አብራ
ሰው ሆኛለሁና በማዳንህ ስራ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 8
ቅኔ ዜማ መተንፈሴ
ቀንም ማታ ማወደሴ
አምሮልኝ ነው ባንተ ሕይወቴ
ጌታ ኢየሱስ አብርሆቴ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4116eec6-2785-4b4e-a030-8b94b43424b3'::uuid, 'yaseregnin-lemebekel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyam-yemilew-sim ("Mariyam Yemilew Sim")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '46c60480-0822-4d47-a0ab-01a71df069cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 1
ዘወትር ይኖራል እየሆነኝ ክብሬ
ምክንያት ስላረገሽ ጌታ በማዳኑ
ካንቺ ጋር ተሳስሯል ልቤ ቃልኪዳኑ
ላመስግንሽ ብዬ ቃል ከአፌ ባይወጣም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 2
አለ በደም ስሬ ማርያም የሚለው ስም
ባልጸናው አእምሮ በልጅነታችን
ማርያም ጣታችን ነሽ መታረቂያችን
አሁንም ላደፈው ለጨለመው አለም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 3
የእርቅ ሰነድ ነሽ የፍቅር የሰላም
የእናትነት ፍቅርሽ እጅጉን ይደንቃል
የምህረት እጆችሽ ሁሌም ተዘርግቷል
የልቤ ናፍቆቱ አንቺ ነሽ ማርያም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 4
ያደራ እናቴ ነሽ ካንቺ አልለይም
ከፍጥረት በሚልቅ የመወደድ ግርማ
ነግሰሽ የምትኖሪ በንጉስ ከተማ
ማርያም ሰላማ ነሽ የክብሬ መገኛ

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 5
ድኅነትን ያስገኘሽ ለፍጥረት መዳኛ

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 1
Zewetr yinoral eyehonegn kibre
Miknyat silaregesh Geta bemadanu
Kanchi gar tesasrwal libe qalkidanu
Lamesgnsh biye qal keafe baywet’am

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 2
Ale bedem sire Maryam yemilew sim
Balts’enaw aemro beljnetachn
Maryam t’atachn nesh metareqiyachn
Ahunm ladefew lech’elemew alem

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 3
Yeerq sened nesh yefqr yeselam
Yeenatnet fiqrsh ejgun yidenqal
Yemhret ejochsh hulem tezergtwal
Yelbe nafqotu anchi nesh Maryam

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 4
Yadera enate nesh kanchi alleym
Keft’ret bemilq yemeweded girma
Negsesh yemtnori bengus ketema
Maryam selama nesh yekbre megegna

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 5
Dihnetn yasgegnesh left’ret medagna

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 1
ዘወትር ይኖራል እየሆነኝ ክብሬ
ምክንያት ስላረገሽ ጌታ በማዳኑ
ካንቺ ጋር ተሳስሯል ልቤ ቃልኪዳኑ
ላመስግንሽ ብዬ ቃል ከአፌ ባይወጣም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 2
አለ በደም ስሬ ማርያም የሚለው ስም
ባልጸናው አእምሮ በልጅነታችን
ማርያም ጣታችን ነሽ መታረቂያችን
አሁንም ላደፈው ለጨለመው አለም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 3
የእርቅ ሰነድ ነሽ የፍቅር የሰላም
የእናትነት ፍቅርሽ እጅጉን ይደንቃል
የምህረት እጆችሽ ሁሌም ተዘርግቷል
የልቤ ናፍቆቱ አንቺ ነሽ ማርያም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 4
ያደራ እናቴ ነሽ ካንቺ አልለይም
ከፍጥረት በሚልቅ የመወደድ ግርማ
ነግሰሽ የምትኖሪ በንጉስ ከተማ
ማርያም ሰላማ ነሽ የክብሬ መገኛ

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 5
ድኅነትን ያስገኘሽ ለፍጥረት መዳኛ

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ',
        lyrics_transliteration = 'CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 1
Zewetr yinoral eyehonegn kibre
Miknyat silaregesh Geta bemadanu
Kanchi gar tesasrwal libe qalkidanu
Lamesgnsh biye qal keafe baywet’am

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 2
Ale bedem sire Maryam yemilew sim
Balts’enaw aemro beljnetachn
Maryam t’atachn nesh metareqiyachn
Ahunm ladefew lech’elemew alem

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 3
Yeerq sened nesh yefqr yeselam
Yeenatnet fiqrsh ejgun yidenqal
Yemhret ejochsh hulem tezergtwal
Yelbe nafqotu anchi nesh Maryam

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 4
Yadera enate nesh kanchi alleym
Keft’ret bemilq yemeweded girma
Negsesh yemtnori bengus ketema
Maryam selama nesh yekbre megegna

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 5
Dihnetn yasgegnesh left’ret medagna

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre',
        updated_at = clock_timestamp()::text
    WHERE import_id = '46c60480-0822-4d47-a0ab-01a71df069cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 1
ዘወትር ይኖራል እየሆነኝ ክብሬ
ምክንያት ስላረገሽ ጌታ በማዳኑ
ካንቺ ጋር ተሳስሯል ልቤ ቃልኪዳኑ
ላመስግንሽ ብዬ ቃል ከአፌ ባይወጣም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 2
አለ በደም ስሬ ማርያም የሚለው ስም
ባልጸናው አእምሮ በልጅነታችን
ማርያም ጣታችን ነሽ መታረቂያችን
አሁንም ላደፈው ለጨለመው አለም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 3
የእርቅ ሰነድ ነሽ የፍቅር የሰላም
የእናትነት ፍቅርሽ እጅጉን ይደንቃል
የምህረት እጆችሽ ሁሌም ተዘርግቷል
የልቤ ናፍቆቱ አንቺ ነሽ ማርያም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 4
ያደራ እናቴ ነሽ ካንቺ አልለይም
ከፍጥረት በሚልቅ የመወደድ ግርማ
ነግሰሽ የምትኖሪ በንጉስ ከተማ
ማርያም ሰላማ ነሽ የክብሬ መገኛ

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 5
ድኅነትን ያስገኘሽ ለፍጥረት መዳኛ

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '46c60480-0822-4d47-a0ab-01a71df069cd'::uuid, 'mariyam-yemilew-sim', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amilake-tekilehayimanot ("Amilake Tekilehayimanot")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '49fa0736-2a88-4263-a09a-d812153312a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 1
የኢቲሳ አንበሳ የኔ አባት
ቁጣውን አብርደው ተክለሐይማኖት
ለምልጃ ተነሳ የኔ አባት
ከሰማይ ካህናት ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 2
ቤተሰብ ሆነሃል የኔ አባት
የሥላሴን መንበር ተክለሐይማኖት
ለማጠን በቅተሀል የኔ አባት
ከከርቤ ከሚአ ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 3
ከሰሊክም በልጧል የኔ አባት
የፃድቁ ፀሎት ተክለሐይማኖት
በእግዚአብሔር ፊት ሸቷል የኔ አባት
ስለቃልኪዳንህ ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 4
አምላክ ይለመናል የኔ አባት
ፀሎትህ ሲደረስ ተክለሐይማኖት
እኛን ይታረቃል የኔ አባት
ተማፅነንብሃል ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 5
ጌታ ሆይ በስሙ የኔ አባት
በጻድቁ ፀሎት ተክለሐይማኖት
በስባረ አፅሙ የኔ አባት
ኢትዮጵያን በሙሉ ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 6
አስተምሮ ሲመለስ የኔ አባት
አፅመ ርስቱ ሆነች ተክለሐይማኖት
ደብረ ሊባኖስ የኔ አባት
የጻድቁ መንፈስ ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 7
ከቅዱሳን ጋራ የኔ አባት
ከልባችን ገብተህ ተክለሐይማኖት
ብርሃንን አብራ የኔ አባት
በፀሎትህ ስቆም ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 8
ስምህን ስጠራ የኔ አባት
ነፍሴ ተደሰተች ተክለሐይማኖት
ሲርቀኝ መከራ የኔ አባት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 1
Yeitisa anbesa yene abat
Qut’awn abrdew tekleheymanot
Lemlja tenesa yene abat
Kesemay kahnat tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 2
Beteseb honehal yene abat
Yeslasen menber tekleheymanot
Lemat’en beqtehel yene abat
Kekerbe kemia Tekle Haymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 3
Keselikm belt’wal yene abat
Yets’adqu ts’elot tekleheymanot
BeEgziabher fit shetwal yene abat
Sileqalkidanh tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 4
Amlak yilemenal yene abat
Ts’eloth sideres tekleheymanot
Egnan yitareqal yene abat
Temats’nenbhal Tekle Haymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 5
Geta hoy besmu yene abat
Bets’adqu ts’elot tekleheymanot
Besbare ats’mu yene abat
Ityop’yan bemulu tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 6
Astemro simeles yene abat
Ats’me ristu honech tekleheymanot
Debre libanos yene abat
Yets’adqu menfes Tekle Haymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 7
Keqdusan gara yene abat
Kelbachn gebteh tekleheymanot
Birhann abra yene abat
Bets’eloth siqom tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 8
Simhn sit’era yene abat
Nefse tedesetech tekleheymanot
Sirqegn mekera yene abat

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 1
የኢቲሳ አንበሳ የኔ አባት
ቁጣውን አብርደው ተክለሐይማኖት
ለምልጃ ተነሳ የኔ አባት
ከሰማይ ካህናት ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 2
ቤተሰብ ሆነሃል የኔ አባት
የሥላሴን መንበር ተክለሐይማኖት
ለማጠን በቅተሀል የኔ አባት
ከከርቤ ከሚአ ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 3
ከሰሊክም በልጧል የኔ አባት
የፃድቁ ፀሎት ተክለሐይማኖት
በእግዚአብሔር ፊት ሸቷል የኔ አባት
ስለቃልኪዳንህ ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 4
አምላክ ይለመናል የኔ አባት
ፀሎትህ ሲደረስ ተክለሐይማኖት
እኛን ይታረቃል የኔ አባት
ተማፅነንብሃል ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 5
ጌታ ሆይ በስሙ የኔ አባት
በጻድቁ ፀሎት ተክለሐይማኖት
በስባረ አፅሙ የኔ አባት
ኢትዮጵያን በሙሉ ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 6
አስተምሮ ሲመለስ የኔ አባት
አፅመ ርስቱ ሆነች ተክለሐይማኖት
ደብረ ሊባኖስ የኔ አባት
የጻድቁ መንፈስ ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 7
ከቅዱሳን ጋራ የኔ አባት
ከልባችን ገብተህ ተክለሐይማኖት
ብርሃንን አብራ የኔ አባት
በፀሎትህ ስቆም ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 8
ስምህን ስጠራ የኔ አባት
ነፍሴ ተደሰተች ተክለሐይማኖት
ሲርቀኝ መከራ የኔ አባት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት',
        lyrics_transliteration = 'CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 1
Yeitisa anbesa yene abat
Qut’awn abrdew tekleheymanot
Lemlja tenesa yene abat
Kesemay kahnat tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 2
Beteseb honehal yene abat
Yeslasen menber tekleheymanot
Lemat’en beqtehel yene abat
Kekerbe kemia Tekle Haymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 3
Keselikm belt’wal yene abat
Yets’adqu ts’elot tekleheymanot
BeEgziabher fit shetwal yene abat
Sileqalkidanh tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 4
Amlak yilemenal yene abat
Ts’eloth sideres tekleheymanot
Egnan yitareqal yene abat
Temats’nenbhal Tekle Haymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 5
Geta hoy besmu yene abat
Bets’adqu ts’elot tekleheymanot
Besbare ats’mu yene abat
Ityop’yan bemulu tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 6
Astemro simeles yene abat
Ats’me ristu honech tekleheymanot
Debre libanos yene abat
Yets’adqu menfes Tekle Haymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 7
Keqdusan gara yene abat
Kelbachn gebteh tekleheymanot
Birhann abra yene abat
Bets’eloth siqom tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 8
Simhn sit’era yene abat
Nefse tedesetech tekleheymanot
Sirqegn mekera yene abat

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot',
        updated_at = clock_timestamp()::text
    WHERE import_id = '49fa0736-2a88-4263-a09a-d812153312a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 1
የኢቲሳ አንበሳ የኔ አባት
ቁጣውን አብርደው ተክለሐይማኖት
ለምልጃ ተነሳ የኔ አባት
ከሰማይ ካህናት ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 2
ቤተሰብ ሆነሃል የኔ አባት
የሥላሴን መንበር ተክለሐይማኖት
ለማጠን በቅተሀል የኔ አባት
ከከርቤ ከሚአ ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 3
ከሰሊክም በልጧል የኔ አባት
የፃድቁ ፀሎት ተክለሐይማኖት
በእግዚአብሔር ፊት ሸቷል የኔ አባት
ስለቃልኪዳንህ ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 4
አምላክ ይለመናል የኔ አባት
ፀሎትህ ሲደረስ ተክለሐይማኖት
እኛን ይታረቃል የኔ አባት
ተማፅነንብሃል ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 5
ጌታ ሆይ በስሙ የኔ አባት
በጻድቁ ፀሎት ተክለሐይማኖት
በስባረ አፅሙ የኔ አባት
ኢትዮጵያን በሙሉ ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 6
አስተምሮ ሲመለስ የኔ አባት
አፅመ ርስቱ ሆነች ተክለሐይማኖት
ደብረ ሊባኖስ የኔ አባት
የጻድቁ መንፈስ ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 7
ከቅዱሳን ጋራ የኔ አባት
ከልባችን ገብተህ ተክለሐይማኖት
ብርሃንን አብራ የኔ አባት
በፀሎትህ ስቆም ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 8
ስምህን ስጠራ የኔ አባት
ነፍሴ ተደሰተች ተክለሐይማኖት
ሲርቀኝ መከራ የኔ አባት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '49fa0736-2a88-4263-a09a-d812153312a1'::uuid, 'amilake-tekilehayimanot', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- until-my-time-comes ("Until My Time Comes")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4cd7bb3c-e9a6-4777-97ce-57cb90e456f4'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 1
My hope, my supporter please don’t abandon me
My lord, don’t leave me, preserve me from hell

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 2
Merciful, forgiving, may your mercy visit me
Preserve me from sin, may your grace rescue me
My savior, my healer, please send us peace
With your endless love, lead to me righteousness

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 3
Lord, have mercy on me
I''m troubled, give me your peace
Keep me guarded, protect me from evil
Show me the righteous trail

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 4
Although I am sinful, my sins aggravating
With your holy flesh and blood, wash from my doing
I will come to you, please shelter my soul
Let my soul rest with you, grant me salvation

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 1
My hope, my supporter please don’t abandon me
My lord, don’t leave me, preserve me from hell

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 2
Merciful, forgiving, may your mercy visit me
Preserve me from sin, may your grace rescue me
My savior, my healer, please send us peace
With your endless love, lead to me righteousness

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 3
Lord, have mercy on me
I''m troubled, give me your peace
Keep me guarded, protect me from evil
Show me the righteous trail

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 4
Although I am sinful, my sins aggravating
With your holy flesh and blood, wash from my doing
I will come to you, please shelter my soul
Let my soul rest with you, grant me salvation

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = '4cd7bb3c-e9a6-4777-97ce-57cb90e456f4'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 1
My hope, my supporter please don’t abandon me
My lord, don’t leave me, preserve me from hell

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 2
Merciful, forgiving, may your mercy visit me
Preserve me from sin, may your grace rescue me
My savior, my healer, please send us peace
With your endless love, lead to me righteousness

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 3
Lord, have mercy on me
I''m troubled, give me your peace
Keep me guarded, protect me from evil
Show me the righteous trail

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 4
Although I am sinful, my sins aggravating
With your holy flesh and blood, wash from my doing
I will come to you, please shelter my soul
Let my soul rest with you, grant me salvation

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4cd7bb3c-e9a6-4777-97ce-57cb90e456f4'::uuid, 'until-my-time-comes', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- with-my-unfitting ("With My Unfitting")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '557224e5-f43b-4cbb-894d-1fb3b175c7c0'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 1
Just thinking about her, her glory untold
The humbleness you showed is
immeasurable
You even cry for us, for the lowly people

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 2
You plea to save my soul, to relief my scares
My heart is drawn to you, Mary mother of
God
Because of this Mary, our affection is grand

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 3
We are begging you, to plead beseech for us
Your hands are stretched up to, towards our
God
To ask for forgiveness, you look up to the

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 4
lord
Seraphim Cherubim, angles blazing like fire
They couldn''t touch our God, his grace and
power

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 5
Mary embraced the lord, you kissed and
nurtured him
Oh Virgin Mary, Your love is fair and rare

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 1
Just thinking about her, her glory untold
The humbleness you showed is
immeasurable
You even cry for us, for the lowly people

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 2
You plea to save my soul, to relief my scares
My heart is drawn to you, Mary mother of
God
Because of this Mary, our affection is grand

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 3
We are begging you, to plead beseech for us
Your hands are stretched up to, towards our
God
To ask for forgiveness, you look up to the

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 4
lord
Seraphim Cherubim, angles blazing like fire
They couldn''t touch our God, his grace and
power

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 5
Mary embraced the lord, you kissed and
nurtured him
Oh Virgin Mary, Your love is fair and rare

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = '557224e5-f43b-4cbb-894d-1fb3b175c7c0'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 1
Just thinking about her, her glory untold
The humbleness you showed is
immeasurable
You even cry for us, for the lowly people

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 2
You plea to save my soul, to relief my scares
My heart is drawn to you, Mary mother of
God
Because of this Mary, our affection is grand

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 3
We are begging you, to plead beseech for us
Your hands are stretched up to, towards our
God
To ask for forgiveness, you look up to the

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 4
lord
Seraphim Cherubim, angles blazing like fire
They couldn''t touch our God, his grace and
power

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 5
Mary embraced the lord, you kissed and
nurtured him
Oh Virgin Mary, Your love is fair and rare

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '557224e5-f43b-4cbb-894d-1fb3b175c7c0'::uuid, 'with-my-unfitting', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- media-1839 ("media")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4ce7a2d7-d8c3-4057-bdc9-31ccd12b1f6f'::uuid
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
    WHERE import_id = '4ce7a2d7-d8c3-4057-bdc9-31ccd12b1f6f'::uuid
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
        '4ce7a2d7-d8c3-4057-bdc9-31ccd12b1f6f'::uuid, 'media-1839', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- silemayiger-sitotaw ("Silemayiger Sitotaw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '50cebfb6-7eaf-4bf3-a629-850ca865470c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 1
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 2
ነፋስን ገስጾ ማዕበል አቆሞ የሚያሻግር
የዓለም ፈተና ቢበዛ እርሱ መጠጊያችን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 3
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሳኤን ሰላምን ለሰጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 4
ከሲኦል እስራት ተፈተን ነጻ የወጣንበት
መስቀሉን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 1
Yihn yaderege amlakachn Egziabher yemesgen
Silemayneger sit’otaw Egziabher yemesgen

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 2
Nefasn gests’o maebel aqomo yemiyashagr
Yealem fetena bibeza ersu met’egiyachn
Silemayneger sit’otaw Egziabher yemesgen

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 3
Dagm endanmot bemotu motn yeretaln
Yemnmekabet tinsaen selamn leset’en
Silemayneger sit’otaw Egziabher yemesgen

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 4
Kesiol esrat tefeten nets’a yewet’anbet
Mesqelun leset’en leamlakachn enzemr beewnet
Silemayneger sit’otaw Egziabher yemesgen

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 1
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 2
ነፋስን ገስጾ ማዕበል አቆሞ የሚያሻግር
የዓለም ፈተና ቢበዛ እርሱ መጠጊያችን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 3
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሳኤን ሰላምን ለሰጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 4
ከሲኦል እስራት ተፈተን ነጻ የወጣንበት
መስቀሉን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን',
        lyrics_transliteration = 'CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 1
Yihn yaderege amlakachn Egziabher yemesgen
Silemayneger sit’otaw Egziabher yemesgen

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 2
Nefasn gests’o maebel aqomo yemiyashagr
Yealem fetena bibeza ersu met’egiyachn
Silemayneger sit’otaw Egziabher yemesgen

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 3
Dagm endanmot bemotu motn yeretaln
Yemnmekabet tinsaen selamn leset’en
Silemayneger sit’otaw Egziabher yemesgen

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 4
Kesiol esrat tefeten nets’a yewet’anbet
Mesqelun leset’en leamlakachn enzemr beewnet
Silemayneger sit’otaw Egziabher yemesgen

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon',
        updated_at = clock_timestamp()::text
    WHERE import_id = '50cebfb6-7eaf-4bf3-a629-850ca865470c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 1
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 2
ነፋስን ገስጾ ማዕበል አቆሞ የሚያሻግር
የዓለም ፈተና ቢበዛ እርሱ መጠጊያችን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 3
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሳኤን ሰላምን ለሰጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 4
ከሲኦል እስራት ተፈተን ነጻ የወጣንበት
መስቀሉን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '50cebfb6-7eaf-4bf3-a629-850ca865470c'::uuid, 'silemayiger-sitotaw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fikirih-marekegn ("Fikirih Marekegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5ffc7d26-af59-4188-a38d-1e0d9b1ed8bc'::uuid
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
እንደ አቅሜ አገንሃለሁ (X2)

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
ክብርህን አይተው ጠላቶች ፈሩ
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
Ende aqme agenhalehu (X2)

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
Kibrhn aytew t’elatoch feru
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
እንደ አቅሜ አገንሃለሁ (X2)

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
ክብርህን አይተው ጠላቶች ፈሩ
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
Ende aqme agenhalehu (X2)

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
Kibrhn aytew t’elatoch feru
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
    WHERE import_id = '5ffc7d26-af59-4188-a38d-1e0d9b1ed8bc'::uuid
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
እንደ አቅሜ አገንሃለሁ (X2)

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
ክብርህን አይተው ጠላቶች ፈሩ
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
        '5ffc7d26-af59-4188-a38d-1e0d9b1ed8bc'::uuid, 'fikirih-marekegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- abetu-yehonebenen-asib-egziabher ("Abetu Yehonebenen Asib Egziabher")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5a49ee32-f2ce-416f-b800-cc807258a26e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 1
ቅኔ ማህሌቱ በደም ረሰረሰ
መቅደስህ ተቃጥሎ መሰውያዉ ፈረሰ
ጮሁ ደናግላን ደም እንባ አለቀሱ
በቅድሱ ስፍራ ታርዷልና ቄሱ

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 2
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 3
ሰላም መስሎን ነበር መዉጣት መግባታችን
ለካስ በሾህ ታጥሯል ዙርያው ጎዳናችን
የፅዮን መንገዶች በዕንባ ተሞልተዋል
የሚያምሩት ግንቦችዋ በሌሊት ፈርሰዋል

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 4
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 5
የቁጣህን በትር ማን ይቋቋመዋል
የኃይልህን ጽናት ማንስ ይችለዋል
የሽማግሌው ፊት አልታፈረምና
እንዴት ቀና እንበል እንዴት እንፅናና

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 6
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 7
እንደ ዘካርያስ እንደ እግዚአብሔር ወዳጅ
ወደቁ ብዙዎች መጡና ካንተ ደጅ
ህፃን አዛዎንቱ ጎበዦቹ ሁሉ
ተሰዉ ለፍቅርህ አንክድም እያሉ

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 8
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 1
Kene Maheletu Bedem Reserese
Mekdeshe Tekatlo Mesewiaw Ferese
Chohu Denagelan Dem Enba Alekesu
Bemekdesu Sefra Tardwalena Kesu

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 2
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 3
Selam Meslon Neber Mewtat Megbatachen
Lekas Besho Tatrewal Zuriaw Godanachen
Yetsion Mengedoch Benba Temoltwal
Yemiamrut Ginbochwa Belelit Ferswal

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 4
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 5
Yekutahen Beter Man Yekwakwamewal
Yehailehen Tsinat Manis Yechelewal
Yeshemaglew Fit Altaferemena
Endet kena Enibel Endet Enetsinana

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 6
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 7
Ende Zekarias Ende Egziabher Wedaj
Wedeku Bizuoch Gebuna Kante Dej
Hitsan Azawentoch Gobezochu Hulu
Tesewu Lefiker Ankidem eyalu

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 8
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 1
ቅኔ ማህሌቱ በደም ረሰረሰ
መቅደስህ ተቃጥሎ መሰውያዉ ፈረሰ
ጮሁ ደናግላን ደም እንባ አለቀሱ
በቅድሱ ስፍራ ታርዷልና ቄሱ

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 2
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 3
ሰላም መስሎን ነበር መዉጣት መግባታችን
ለካስ በሾህ ታጥሯል ዙርያው ጎዳናችን
የፅዮን መንገዶች በዕንባ ተሞልተዋል
የሚያምሩት ግንቦችዋ በሌሊት ፈርሰዋል

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 4
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 5
የቁጣህን በትር ማን ይቋቋመዋል
የኃይልህን ጽናት ማንስ ይችለዋል
የሽማግሌው ፊት አልታፈረምና
እንዴት ቀና እንበል እንዴት እንፅናና

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 6
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 7
እንደ ዘካርያስ እንደ እግዚአብሔር ወዳጅ
ወደቁ ብዙዎች መጡና ካንተ ደጅ
ህፃን አዛዎንቱ ጎበዦቹ ሁሉ
ተሰዉ ለፍቅርህ አንክድም እያሉ

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 8
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)',
        lyrics_transliteration = 'CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 1
Kene Maheletu Bedem Reserese
Mekdeshe Tekatlo Mesewiaw Ferese
Chohu Denagelan Dem Enba Alekesu
Bemekdesu Sefra Tardwalena Kesu

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 2
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 3
Selam Meslon Neber Mewtat Megbatachen
Lekas Besho Tatrewal Zuriaw Godanachen
Yetsion Mengedoch Benba Temoltwal
Yemiamrut Ginbochwa Belelit Ferswal

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 4
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 5
Yekutahen Beter Man Yekwakwamewal
Yehailehen Tsinat Manis Yechelewal
Yeshemaglew Fit Altaferemena
Endet kena Enibel Endet Enetsinana

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 6
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 7
Ende Zekarias Ende Egziabher Wedaj
Wedeku Bizuoch Gebuna Kante Dej
Hitsan Azawentoch Gobezochu Hulu
Tesewu Lefiker Ankidem eyalu

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 8
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5a49ee32-f2ce-416f-b800-cc807258a26e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 1
ቅኔ ማህሌቱ በደም ረሰረሰ
መቅደስህ ተቃጥሎ መሰውያዉ ፈረሰ
ጮሁ ደናግላን ደም እንባ አለቀሱ
በቅድሱ ስፍራ ታርዷልና ቄሱ

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 2
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 3
ሰላም መስሎን ነበር መዉጣት መግባታችን
ለካስ በሾህ ታጥሯል ዙርያው ጎዳናችን
የፅዮን መንገዶች በዕንባ ተሞልተዋል
የሚያምሩት ግንቦችዋ በሌሊት ፈርሰዋል

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 4
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 5
የቁጣህን በትር ማን ይቋቋመዋል
የኃይልህን ጽናት ማንስ ይችለዋል
የሽማግሌው ፊት አልታፈረምና
እንዴት ቀና እንበል እንዴት እንፅናና

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 6
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 7
እንደ ዘካርያስ እንደ እግዚአብሔር ወዳጅ
ወደቁ ብዙዎች መጡና ካንተ ደጅ
ህፃን አዛዎንቱ ጎበዦቹ ሁሉ
ተሰዉ ለፍቅርህ አንክድም እያሉ

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 8
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 1
Kene Maheletu Bedem Reserese
Mekdeshe Tekatlo Mesewiaw Ferese
Chohu Denagelan Dem Enba Alekesu
Bemekdesu Sefra Tardwalena Kesu

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 2
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 3
Selam Meslon Neber Mewtat Megbatachen
Lekas Besho Tatrewal Zuriaw Godanachen
Yetsion Mengedoch Benba Temoltwal
Yemiamrut Ginbochwa Belelit Ferswal

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 4
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 5
Yekutahen Beter Man Yekwakwamewal
Yehailehen Tsinat Manis Yechelewal
Yeshemaglew Fit Altaferemena
Endet kena Enibel Endet Enetsinana

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 6
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 7
Ende Zekarias Ende Egziabher Wedaj
Wedeku Bizuoch Gebuna Kante Dej
Hitsan Azawentoch Gobezochu Hulu
Tesewu Lefiker Ankidem eyalu

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 8
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5a49ee32-f2ce-416f-b800-cc807258a26e'::uuid, 'abetu-yehonebenen-asib-egziabher', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mekifel-yemalichilew-alebign-wileta ("Mekifel Yemalichilew Alebign Wileta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '579c0afd-90b0-4b5f-b463-4c98b5c00b55'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 1
በዘመኔ ሁሉ የደገፍከኝ በእጆችህ
ጌታ ዘርዝሬ ኣልጨርሰው ውለታህ
ምስኪን ባርያ ለውለታህ ኣሁን ምን እከፍላለው
ሌላ ኣትሻም ኣንተ የኣቅሜን ይሄው ኣመሰግናሃለው

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 2
ስናቅ እንዳልነበር እኔ በሰዎች ተጥዬ
ከውድቀቴ ኣንስተህ ሰው ኣረከኝ ቸር ጌታዬ
ነብሴ ለውለታህ በምስጋና ተሞልታለች
ጥዋት ማታ ስምክን እያነሳች ታመሰግናለች

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 3
ነብሴ መሸሸግያ ኣጥታ ኣንተ ስላየሃት
ከለምለም መስክ ወስደህ ጌታ ኣሳረፍካት
የከበዳት ሸክም ቀሎ ባንተ ረፍት ኣገኘች
ይኸው በሰዎች ፊት ያንተን ክብር ትመሰክራለች

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 4
ኣይቸኩልም እግዚአብሔር ለርሱ ኣለው ጊዜ
ሲጠሩት ይሰማል ፈጣኖ ያወጣል ከትካዜ
የፅድቅንም መንገድ እያሳየ ይመራናል
ወደ ህይወት መንገድ እረኛችን ወስዶ ያሳርፈናል

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 5
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይቺው ነች ኣቅሜ ለስጦታ (2)

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 1
Bezemene hulu yedegefkegn beejochh
Geta zerzre alch’ersew wiletah
Miskin barya lewletah ahun min ekeflalew
Lela atsham ante yeaqmen yihew amesegnahalew

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 2
Sinaq endalneber ene besewoch tet’ye
Kewdqete ansteh sew arekegn cher Getaye
Nebse lewletah bemsgana temoltalech
T’wat mata simkn eyanesach tamesegnalech

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 3
Nebse mesheshegya at’ta ante silayehat
Kelemlem mesk wesdeh Geta asarefkat
Yekebedat shekm qelo bante reft agegnech
Yiኸw besewoch fit yanten kibir timesekralech

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 4
Aychekulm Egziabher lersu alew gize
Sit’erut yisemal fet’ano yawet’al ketkaze
Yets’dqnm menged eyasaye yimeranal
Wede hiywet menged eregnachn wesdo yasarfenal

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 5
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichiw nech aqme lest’ota (2)

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 1
በዘመኔ ሁሉ የደገፍከኝ በእጆችህ
ጌታ ዘርዝሬ ኣልጨርሰው ውለታህ
ምስኪን ባርያ ለውለታህ ኣሁን ምን እከፍላለው
ሌላ ኣትሻም ኣንተ የኣቅሜን ይሄው ኣመሰግናሃለው

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 2
ስናቅ እንዳልነበር እኔ በሰዎች ተጥዬ
ከውድቀቴ ኣንስተህ ሰው ኣረከኝ ቸር ጌታዬ
ነብሴ ለውለታህ በምስጋና ተሞልታለች
ጥዋት ማታ ስምክን እያነሳች ታመሰግናለች

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 3
ነብሴ መሸሸግያ ኣጥታ ኣንተ ስላየሃት
ከለምለም መስክ ወስደህ ጌታ ኣሳረፍካት
የከበዳት ሸክም ቀሎ ባንተ ረፍት ኣገኘች
ይኸው በሰዎች ፊት ያንተን ክብር ትመሰክራለች

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 4
ኣይቸኩልም እግዚአብሔር ለርሱ ኣለው ጊዜ
ሲጠሩት ይሰማል ፈጣኖ ያወጣል ከትካዜ
የፅድቅንም መንገድ እያሳየ ይመራናል
ወደ ህይወት መንገድ እረኛችን ወስዶ ያሳርፈናል

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 5
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይቺው ነች ኣቅሜ ለስጦታ (2)

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)',
        lyrics_transliteration = 'CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 1
Bezemene hulu yedegefkegn beejochh
Geta zerzre alch’ersew wiletah
Miskin barya lewletah ahun min ekeflalew
Lela atsham ante yeaqmen yihew amesegnahalew

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 2
Sinaq endalneber ene besewoch tet’ye
Kewdqete ansteh sew arekegn cher Getaye
Nebse lewletah bemsgana temoltalech
T’wat mata simkn eyanesach tamesegnalech

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 3
Nebse mesheshegya at’ta ante silayehat
Kelemlem mesk wesdeh Geta asarefkat
Yekebedat shekm qelo bante reft agegnech
Yiኸw besewoch fit yanten kibir timesekralech

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 4
Aychekulm Egziabher lersu alew gize
Sit’erut yisemal fet’ano yawet’al ketkaze
Yets’dqnm menged eyasaye yimeranal
Wede hiywet menged eregnachn wesdo yasarfenal

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 5
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichiw nech aqme lest’ota (2)

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '579c0afd-90b0-4b5f-b463-4c98b5c00b55'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 1
በዘመኔ ሁሉ የደገፍከኝ በእጆችህ
ጌታ ዘርዝሬ ኣልጨርሰው ውለታህ
ምስኪን ባርያ ለውለታህ ኣሁን ምን እከፍላለው
ሌላ ኣትሻም ኣንተ የኣቅሜን ይሄው ኣመሰግናሃለው

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 2
ስናቅ እንዳልነበር እኔ በሰዎች ተጥዬ
ከውድቀቴ ኣንስተህ ሰው ኣረከኝ ቸር ጌታዬ
ነብሴ ለውለታህ በምስጋና ተሞልታለች
ጥዋት ማታ ስምክን እያነሳች ታመሰግናለች

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 3
ነብሴ መሸሸግያ ኣጥታ ኣንተ ስላየሃት
ከለምለም መስክ ወስደህ ጌታ ኣሳረፍካት
የከበዳት ሸክም ቀሎ ባንተ ረፍት ኣገኘች
ይኸው በሰዎች ፊት ያንተን ክብር ትመሰክራለች

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 4
ኣይቸኩልም እግዚአብሔር ለርሱ ኣለው ጊዜ
ሲጠሩት ይሰማል ፈጣኖ ያወጣል ከትካዜ
የፅድቅንም መንገድ እያሳየ ይመራናል
ወደ ህይወት መንገድ እረኛችን ወስዶ ያሳርፈናል

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 5
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይቺው ነች ኣቅሜ ለስጦታ (2)

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '579c0afd-90b0-4b5f-b463-4c98b5c00b55'::uuid, 'mekifel-yemalichilew-alebign-wileta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidanishe-new ("Kidanishe New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5b39d936-1756-4f14-9493-d7e8002af03f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 1
እንደ ዶኪማስ ቤት ጉድለቴ እንዲመላ
ዘንበል ብለሽልኝ ድንግል የኔ ጥላ
የባዘነው ልቤ ይረፍ በምልጃሺ
ቅረቢ ወደኔ ድንግል ስጠራሺ

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 2
የተመለሰብሽ አዳም ወደ ክብሩ
አበው እየጠሩሽ መልካም ፍሬ አፈሩ
በታናሽ አንደበት ልጥራሽ ደጋግሜ
አንችን ማመስገን ነው የልጅነት ህልሜ

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 3
ቅደሚልኝ ከፊት ጉዞዬ እንዲቀና
ያላይቺ ጎዳናው አይገፋም እና
እጠብቅሻለው በመጠበቅያዬ
መመኪያዬ ድንግል አንቺ ነሽ ተስፋዬ

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 4
ኪዳንሽን አምኖ ባንቺ የተማፀነ
ከልጅሽ በረከት አትርፎ ዘገነ
ኪዳነምህረት የቤቴ ውበት
ልጅሽ አማኑኤል ሃይልና ጉልበት

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye

VERSE 1
Ende dokimas bet gudlete endimela
Zenbel bileshlgn Dingil yene t’la
Yebazenew libe yiref bemljashi
Qirebi wedene Dingil sit’erashi

CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye

VERSE 2
Yetemelesebsh adam wede kibru
Abew eyet’erush melkam fire aferu
Betanash andebet lit’rash degagme
Anchn mamesgen new yeljnet hilme

CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye

VERSE 3
Qidemilgn kefit guzoye endiqena
Yalaychi godanaw aygefam ena
Et’ebqshalew bemet’ebeqyaye
Memekiyaye Dingil anchi nesh tesfaye

CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye

VERSE 4
Kidanshn amno banchi yetemats’ene
Keljsh bereket atrfo zegene
Kidanemhret yebete wibet
Lijsh Amanuel haylna gulbet

CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 1
እንደ ዶኪማስ ቤት ጉድለቴ እንዲመላ
ዘንበል ብለሽልኝ ድንግል የኔ ጥላ
የባዘነው ልቤ ይረፍ በምልጃሺ
ቅረቢ ወደኔ ድንግል ስጠራሺ

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 2
የተመለሰብሽ አዳም ወደ ክብሩ
አበው እየጠሩሽ መልካም ፍሬ አፈሩ
በታናሽ አንደበት ልጥራሽ ደጋግሜ
አንችን ማመስገን ነው የልጅነት ህልሜ

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 3
ቅደሚልኝ ከፊት ጉዞዬ እንዲቀና
ያላይቺ ጎዳናው አይገፋም እና
እጠብቅሻለው በመጠበቅያዬ
መመኪያዬ ድንግል አንቺ ነሽ ተስፋዬ

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 4
ኪዳንሽን አምኖ ባንቺ የተማፀነ
ከልጅሽ በረከት አትርፎ ዘገነ
ኪዳነምህረት የቤቴ ውበት
ልጅሽ አማኑኤል ሃይልና ጉልበት

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ',
        lyrics_transliteration = 'CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye

VERSE 1
Ende dokimas bet gudlete endimela
Zenbel bileshlgn Dingil yene t’la
Yebazenew libe yiref bemljashi
Qirebi wedene Dingil sit’erashi

CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye

VERSE 2
Yetemelesebsh adam wede kibru
Abew eyet’erush melkam fire aferu
Betanash andebet lit’rash degagme
Anchn mamesgen new yeljnet hilme

CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye

VERSE 3
Qidemilgn kefit guzoye endiqena
Yalaychi godanaw aygefam ena
Et’ebqshalew bemet’ebeqyaye
Memekiyaye Dingil anchi nesh tesfaye

CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye

VERSE 4
Kidanshn amno banchi yetemats’ene
Keljsh bereket atrfo zegene
Kidanemhret yebete wibet
Lijsh Amanuel haylna gulbet

CHORUS
Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5b39d936-1756-4f14-9493-d7e8002af03f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 1
እንደ ዶኪማስ ቤት ጉድለቴ እንዲመላ
ዘንበል ብለሽልኝ ድንግል የኔ ጥላ
የባዘነው ልቤ ይረፍ በምልጃሺ
ቅረቢ ወደኔ ድንግል ስጠራሺ

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 2
የተመለሰብሽ አዳም ወደ ክብሩ
አበው እየጠሩሽ መልካም ፍሬ አፈሩ
በታናሽ አንደበት ልጥራሽ ደጋግሜ
አንችን ማመስገን ነው የልጅነት ህልሜ

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 3
ቅደሚልኝ ከፊት ጉዞዬ እንዲቀና
ያላይቺ ጎዳናው አይገፋም እና
እጠብቅሻለው በመጠበቅያዬ
መመኪያዬ ድንግል አንቺ ነሽ ተስፋዬ

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 4
ኪዳንሽን አምኖ ባንቺ የተማፀነ
ከልጅሽ በረከት አትርፎ ዘገነ
ኪዳነምህረት የቤቴ ውበት
ልጅሽ አማኑኤል ሃይልና ጉልበት

CHORUS
ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5b39d936-1756-4f14-9493-d7e8002af03f'::uuid, 'kidanishe-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beriban-ene-negn ("Beriban Ene Negn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5c45acad-41f9-42bf-a38f-2f8293f2e5e8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 1
በአንተ መታሰር እስሬ ተፈትቶ
በአንተ መጎተት ቀንበሬ ላልቶ
ነጻ የወጣሁ ኃጢአተኛ
እኔ ነኝ የዓለም ክፉ ወንጀለኛ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 2
አንተ ተጠልተህ የተወደድሁት
አንተ ተዋርደህ የተከበርኩት
በርባን እኔ ነኝ ውለታ ቢስዋ
የዋልክልኝን ሁሌ የምረሳ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 3
ዘውድ እንድቀዳጅ እሾኽ ደፍተሃል
ለነጻነቴ ተቸንክረሃል
እኔ ግን ተመለስኩ ወደ ኃጢአቴ
መች ተወኝና በርባንነቴ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 1
Beante metaser esre tefetto
Beante megotet qenbere lalto
Nets’a yewet’ahu hat’iategna
Ene negn yealem kifu wenjelegna

CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 2
Ante tet’elteh yetewededhut
Ante tewardeh yetekeberkut
Berban ene negn wileta biswa
Yewalklgnn hule yemresa

CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 3
Zewd endqedaj eshoኽ deftehal
Lenets’anete techenkrehal
Ene gin temelesku wede hat’iate
Mech tewegnna berbannete

CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 1
በአንተ መታሰር እስሬ ተፈትቶ
በአንተ መጎተት ቀንበሬ ላልቶ
ነጻ የወጣሁ ኃጢአተኛ
እኔ ነኝ የዓለም ክፉ ወንጀለኛ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 2
አንተ ተጠልተህ የተወደድሁት
አንተ ተዋርደህ የተከበርኩት
በርባን እኔ ነኝ ውለታ ቢስዋ
የዋልክልኝን ሁሌ የምረሳ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 3
ዘውድ እንድቀዳጅ እሾኽ ደፍተሃል
ለነጻነቴ ተቸንክረሃል
እኔ ግን ተመለስኩ ወደ ኃጢአቴ
መች ተወኝና በርባንነቴ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ',
        lyrics_transliteration = 'CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 1
Beante metaser esre tefetto
Beante megotet qenbere lalto
Nets’a yewet’ahu hat’iategna
Ene negn yealem kifu wenjelegna

CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 2
Ante tet’elteh yetewededhut
Ante tewardeh yetekeberkut
Berban ene negn wileta biswa
Yewalklgnn hule yemresa

CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 3
Zewd endqedaj eshoኽ deftehal
Lenets’anete techenkrehal
Ene gin temelesku wede hat’iate
Mech tewegnna berbannete

CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5c45acad-41f9-42bf-a38f-2f8293f2e5e8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 1
በአንተ መታሰር እስሬ ተፈትቶ
በአንተ መጎተት ቀንበሬ ላልቶ
ነጻ የወጣሁ ኃጢአተኛ
እኔ ነኝ የዓለም ክፉ ወንጀለኛ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 2
አንተ ተጠልተህ የተወደድሁት
አንተ ተዋርደህ የተከበርኩት
በርባን እኔ ነኝ ውለታ ቢስዋ
የዋልክልኝን ሁሌ የምረሳ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 3
ዘውድ እንድቀዳጅ እሾኽ ደፍተሃል
ለነጻነቴ ተቸንክረሃል
እኔ ግን ተመለስኩ ወደ ኃጢአቴ
መች ተወኝና በርባንነቴ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5c45acad-41f9-42bf-a38f-2f8293f2e5e8'::uuid, 'beriban-ene-negn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur ("eritrean orthodox tewahdo mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '61ffa371-2f18-4b0c-9a21-12803454cf38'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 1
ሃሌ ሃሌ ሉያ
ሃሌ ሃለ ሉያቅ
ንጉስ ጎይታ ዓለም ቅ
ገንሸል መስፍን ሰላም

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 2
መርገምና ከጥፋ
ቁስላ ክፍዉስ
ከም ሓትእ ተቆጽረ
ዕዳና ክድምስስ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 3
ግሩም መካር ሓይል
ተወልደ ኣብ ግርግም
ክእዉጅ ንሰላም
ጎይታ መድሃኔ ኣለም

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 4
ኣብ ኤፍራታ ሰሚዕናዮ
ኣብቲ ጫካ ረኺብናዮ
ናብ መሕደሪኡ ኣቲና
ኣብ ቅድሚ እግሩ ሰገድና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 5
ኣንቲ ቤተልሄም
ኣቤት ተዓዲልኪ
ከተማ መላእክት
ንራማ መሲልኪ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 6
ንዑ ደቂ ኣምላክ
ንገስግስ ናባዛ ቤት
ነጻላና ኣልዕላና
ክንዝምር ምስ ጓሶት

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 7
ኣምላክ ስጋ ክዉንን
ኣደ ድንግል ክትከዉን
ድንቅዩ መስተንክር
ንዑ እስከ ንዘምር

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 8
ቅዱሳን መላእክት
ኣንሸብሺቦምላ
ስብሃት ንእግዚኣብሄር
ኢሎም ዓለሉላ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 9
ሰብ ጥበብ ገስገሱ
ዝንኡ መጉሱ
ወርቂ ዕጣን ከርቤ
ንኽብሩ ለገሱ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 10
ትንቢት ተነግረሉ
ኣዳም ዝድሕነሉ
ሓላዊ እስራኤል
ተወሊዱ ገንሸል

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 11
ጎይታ ምስ ፈተወ
ንኽፍዉሰና
ንገብሪኤል ለኣኾ
ናብ ድንግል ኣደና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 12
ይኹነለይ በለት
እታ ንጽህቲ ኣደ
ምድሓኑ ክፍጽም
ንሱ ዉን ተወልደ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 13
ኣታ ዝኣምላክና
ክንደይ የፍቅረና
ምስ ኩሉ ሓጥያትናስ
ተወሊዱ ካባና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 1
Hale Halleluya
Hale hale luyaq
Nigus goyta alem q
Genshel mesfn selam

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 2
Mergemna ket’fa
Qusla kifwus
Kem hate teqots’re
Edana kidmss

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 3
Girum mekar hayl
Tewelde ab girgm
Kiewuj niselam
Goyta medhane alem

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 4
Ab efrata semienayo
Abti ch’aka reኺbnayo
Nab mehderiu atina
Ab qidmi egru segedna

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 5
Anti betelhem
Abet teadilki
Ketema melaekt
Nirama mesilki

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 6
Niu deqi amlak
Nigesgs nabaza bet
Nets’alana alelana
Kinzmr mis gwasot

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 7
Amlak siga kiwunn
Ade Dingil kitkewun
Dinqyu mestenkr
Niu eske nizemr

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 8
Kidusan melaekt
Anshebshibomla
Sibhat niegziabher
Ilom alelula

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 9
Seb t’beb gesgesu
Zinu megusu
Werqi et’an kerbe
Niኽbru legesu

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 10
Tinbit tenegrelu
Adam zidhnelu
Halawi esrael
Tewelidu genshel

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 11
Goyta mis fetewe
Niኽfwusena
Nigebriel leaኾ
Nab Dingil adena

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 12
Yiኹneley belet
Eta nits’hti ade
Midhanu kifts’m
Nisu wun tewelde

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 13
Ata ziamlakna
Kindey yefqrena
Mis kulu hat’yatnas
Tewelidu kabana

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 1
ሃሌ ሃሌ ሉያ
ሃሌ ሃለ ሉያቅ
ንጉስ ጎይታ ዓለም ቅ
ገንሸል መስፍን ሰላም

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 2
መርገምና ከጥፋ
ቁስላ ክፍዉስ
ከም ሓትእ ተቆጽረ
ዕዳና ክድምስስ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 3
ግሩም መካር ሓይል
ተወልደ ኣብ ግርግም
ክእዉጅ ንሰላም
ጎይታ መድሃኔ ኣለም

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 4
ኣብ ኤፍራታ ሰሚዕናዮ
ኣብቲ ጫካ ረኺብናዮ
ናብ መሕደሪኡ ኣቲና
ኣብ ቅድሚ እግሩ ሰገድና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 5
ኣንቲ ቤተልሄም
ኣቤት ተዓዲልኪ
ከተማ መላእክት
ንራማ መሲልኪ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 6
ንዑ ደቂ ኣምላክ
ንገስግስ ናባዛ ቤት
ነጻላና ኣልዕላና
ክንዝምር ምስ ጓሶት

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 7
ኣምላክ ስጋ ክዉንን
ኣደ ድንግል ክትከዉን
ድንቅዩ መስተንክር
ንዑ እስከ ንዘምር

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 8
ቅዱሳን መላእክት
ኣንሸብሺቦምላ
ስብሃት ንእግዚኣብሄር
ኢሎም ዓለሉላ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 9
ሰብ ጥበብ ገስገሱ
ዝንኡ መጉሱ
ወርቂ ዕጣን ከርቤ
ንኽብሩ ለገሱ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 10
ትንቢት ተነግረሉ
ኣዳም ዝድሕነሉ
ሓላዊ እስራኤል
ተወሊዱ ገንሸል

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 11
ጎይታ ምስ ፈተወ
ንኽፍዉሰና
ንገብሪኤል ለኣኾ
ናብ ድንግል ኣደና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 12
ይኹነለይ በለት
እታ ንጽህቲ ኣደ
ምድሓኑ ክፍጽም
ንሱ ዉን ተወልደ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 13
ኣታ ዝኣምላክና
ክንደይ የፍቅረና
ምስ ኩሉ ሓጥያትናስ
ተወሊዱ ካባና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ',
        lyrics_transliteration = 'CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 1
Hale Halleluya
Hale hale luyaq
Nigus goyta alem q
Genshel mesfn selam

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 2
Mergemna ket’fa
Qusla kifwus
Kem hate teqots’re
Edana kidmss

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 3
Girum mekar hayl
Tewelde ab girgm
Kiewuj niselam
Goyta medhane alem

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 4
Ab efrata semienayo
Abti ch’aka reኺbnayo
Nab mehderiu atina
Ab qidmi egru segedna

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 5
Anti betelhem
Abet teadilki
Ketema melaekt
Nirama mesilki

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 6
Niu deqi amlak
Nigesgs nabaza bet
Nets’alana alelana
Kinzmr mis gwasot

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 7
Amlak siga kiwunn
Ade Dingil kitkewun
Dinqyu mestenkr
Niu eske nizemr

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 8
Kidusan melaekt
Anshebshibomla
Sibhat niegziabher
Ilom alelula

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 9
Seb t’beb gesgesu
Zinu megusu
Werqi et’an kerbe
Niኽbru legesu

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 10
Tinbit tenegrelu
Adam zidhnelu
Halawi esrael
Tewelidu genshel

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 11
Goyta mis fetewe
Niኽfwusena
Nigebriel leaኾ
Nab Dingil adena

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 12
Yiኹneley belet
Eta nits’hti ade
Midhanu kifts’m
Nisu wun tewelde

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 13
Ata ziamlakna
Kindey yefqrena
Mis kulu hat’yatnas
Tewelidu kabana

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '61ffa371-2f18-4b0c-9a21-12803454cf38'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 1
ሃሌ ሃሌ ሉያ
ሃሌ ሃለ ሉያቅ
ንጉስ ጎይታ ዓለም ቅ
ገንሸል መስፍን ሰላም

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 2
መርገምና ከጥፋ
ቁስላ ክፍዉስ
ከም ሓትእ ተቆጽረ
ዕዳና ክድምስስ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 3
ግሩም መካር ሓይል
ተወልደ ኣብ ግርግም
ክእዉጅ ንሰላም
ጎይታ መድሃኔ ኣለም

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 4
ኣብ ኤፍራታ ሰሚዕናዮ
ኣብቲ ጫካ ረኺብናዮ
ናብ መሕደሪኡ ኣቲና
ኣብ ቅድሚ እግሩ ሰገድና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 5
ኣንቲ ቤተልሄም
ኣቤት ተዓዲልኪ
ከተማ መላእክት
ንራማ መሲልኪ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 6
ንዑ ደቂ ኣምላክ
ንገስግስ ናባዛ ቤት
ነጻላና ኣልዕላና
ክንዝምር ምስ ጓሶት

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 7
ኣምላክ ስጋ ክዉንን
ኣደ ድንግል ክትከዉን
ድንቅዩ መስተንክር
ንዑ እስከ ንዘምር

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 8
ቅዱሳን መላእክት
ኣንሸብሺቦምላ
ስብሃት ንእግዚኣብሄር
ኢሎም ዓለሉላ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 9
ሰብ ጥበብ ገስገሱ
ዝንኡ መጉሱ
ወርቂ ዕጣን ከርቤ
ንኽብሩ ለገሱ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 10
ትንቢት ተነግረሉ
ኣዳም ዝድሕነሉ
ሓላዊ እስራኤል
ተወሊዱ ገንሸል

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 11
ጎይታ ምስ ፈተወ
ንኽፍዉሰና
ንገብሪኤል ለኣኾ
ናብ ድንግል ኣደና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 12
ይኹነለይ በለት
እታ ንጽህቲ ኣደ
ምድሓኑ ክፍጽም
ንሱ ዉን ተወልደ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 13
ኣታ ዝኣምላክና
ክንደይ የፍቅረና
ምስ ኩሉ ሓጥያትናስ
ተወሊዱ ካባና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '61ffa371-2f18-4b0c-9a21-12803454cf38'::uuid, 'eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ayiselechegnm-by-zemarit-nardos-kasahun ("Ayiselechegnm by Zemarit Nardos kasahun")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6692919f-11a7-4424-8efd-5f10577367ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 1
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 2
አልችልም የእርሱን ፍቅር መዘርዘርና
ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 3
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም
የተከፈተ ደጃፍ ሰጥተኸኛል ከፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 4
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 1
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta
Angetun fits’um defto qena endl adrgognal
Eyeqatete moto behywet aqumognal

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 2
Alchlm yeersun fiqr mezerzerna
Mawrat
Wiletawn lemeglets’ yelegnm birtu qalat
Yante kind yemayndew terara gara yelem

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 3
Wet’chalehu ket’lqu talaq neh zelealem
Yetekefete dejaf set’teኸgnal kefite
Temesgen kiberlgn nigeslgn abate
Leyteh yet’eraኸgn yabezahlgn ts’ega

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 4
Tiztaye neh Geta simeshna sinega
Wedajna zemede biye sit’erah linur
Iyesus yeEgziabher lij lewet’egn yante

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 1
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 2
አልችልም የእርሱን ፍቅር መዘርዘርና
ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 3
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም
የተከፈተ ደጃፍ ሰጥተኸኛል ከፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 4
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው',
        lyrics_transliteration = 'CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 1
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta
Angetun fits’um defto qena endl adrgognal
Eyeqatete moto behywet aqumognal

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 2
Alchlm yeersun fiqr mezerzerna
Mawrat
Wiletawn lemeglets’ yelegnm birtu qalat
Yante kind yemayndew terara gara yelem

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 3
Wet’chalehu ket’lqu talaq neh zelealem
Yetekefete dejaf set’teኸgnal kefite
Temesgen kiberlgn nigeslgn abate
Leyteh yet’eraኸgn yabezahlgn ts’ega

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 4
Tiztaye neh Geta simeshna sinega
Wedajna zemede biye sit’erah linur
Iyesus yeEgziabher lij lewet’egn yante

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6692919f-11a7-4424-8efd-5f10577367ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 1
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 2
አልችልም የእርሱን ፍቅር መዘርዘርና
ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 3
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም
የተከፈተ ደጃፍ ሰጥተኸኛል ከፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 4
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6692919f-11a7-4424-8efd-5f10577367ec'::uuid, 'ayiselechegnm-by-zemarit-nardos-kasahun', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mekneyat-selalegn ("Mekneyat Selalegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '556e1e75-1800-4b9f-be08-ffb6a41292cc'::uuid
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
    WHERE import_id = '556e1e75-1800-4b9f-be08-ffb6a41292cc'::uuid
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
        '556e1e75-1800-4b9f-be08-ffb6a41292cc'::uuid, 'mekneyat-selalegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lbena-shtuyen-zemarit-betselot-asmare ("Lbena shtuyen Zemarit Betselot Asmare")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5642afac-0ce3-458d-889d-11189a9feb5e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 1
ያቺ ክፉ ኃጢያት የኖረች ስሰራት
እራሴን እንዳላውቅ ይዛኝ በእስራት
መልኬን እያሳየሁ ኃጢያትን ሳከማች
እንቅፋት ሆኛለሁ ለብዙ ነፍሳቶች

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 2
የሽቱው ዕቃና ልቤንም ከፍቼ
ይኸው አለቅሳለሁ ፊትህ ተደፍቼ
የፈረስኩበትን በአንተ እንድገነባ
ሽቱው ለፍቅርህ ነው ለንስሓ እንባ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 3
እየሳሳህልኝ አይኔንም እያየህ
ልጄ ሆይ ተነሺ በፍቅር እያልክ
እያዘንኩ መጥቼ መለስከኝ በደስታ
ሳትፈርድብኝ ማርከኝ ነፍሴ መንገድ ስታ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 4
ሕይወትን ሊሰጠን እውነት መጥቶልናል
አይጸየፈንም በእቅፉ ያቅፈናል
ምን ስትሰሩ ነበር ብሎ የማይካሰስ
በሰላም ግቡ ነው ቃሉ የሚፈውስ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 5
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተወጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 1
Yachi kifu hat’iyat yenorech siserat
Erasen endalawq yizagn beesrat
Melken eyasayehu hat’iyatn sakemach
Enqfat hognalehu lebzu nefsatoch

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 2
Yeshtuw eqana libenm kefche
Yiኸw aleqsalehu fith tedefche
Yefereskubetn beante endgeneba
Shtuw lefqrh new lensha enba .

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 3
Eyesasahlgn aynenm eyayeh
Lije hoy teneshi befqr eyalk
Eyazenku met’che meleskegn bedesta
Satferdbgn markegn nefse menged sita .

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 4
Hiywetn liset’en ewnet met’tolnal
Ayts’eyefenm beeqfu yaqfenal
Min sitseru neber bilo yemaykases
Beselam gibu new qalu yemifews .

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 5
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yetewega
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 1
ያቺ ክፉ ኃጢያት የኖረች ስሰራት
እራሴን እንዳላውቅ ይዛኝ በእስራት
መልኬን እያሳየሁ ኃጢያትን ሳከማች
እንቅፋት ሆኛለሁ ለብዙ ነፍሳቶች

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 2
የሽቱው ዕቃና ልቤንም ከፍቼ
ይኸው አለቅሳለሁ ፊትህ ተደፍቼ
የፈረስኩበትን በአንተ እንድገነባ
ሽቱው ለፍቅርህ ነው ለንስሓ እንባ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 3
እየሳሳህልኝ አይኔንም እያየህ
ልጄ ሆይ ተነሺ በፍቅር እያልክ
እያዘንኩ መጥቼ መለስከኝ በደስታ
ሳትፈርድብኝ ማርከኝ ነፍሴ መንገድ ስታ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 4
ሕይወትን ሊሰጠን እውነት መጥቶልናል
አይጸየፈንም በእቅፉ ያቅፈናል
ምን ስትሰሩ ነበር ብሎ የማይካሰስ
በሰላም ግቡ ነው ቃሉ የሚፈውስ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 5
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተወጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።',
        lyrics_transliteration = 'CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 1
Yachi kifu hat’iyat yenorech siserat
Erasen endalawq yizagn beesrat
Melken eyasayehu hat’iyatn sakemach
Enqfat hognalehu lebzu nefsatoch

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 2
Yeshtuw eqana libenm kefche
Yiኸw aleqsalehu fith tedefche
Yefereskubetn beante endgeneba
Shtuw lefqrh new lensha enba .

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 3
Eyesasahlgn aynenm eyayeh
Lije hoy teneshi befqr eyalk
Eyazenku met’che meleskegn bedesta
Satferdbgn markegn nefse menged sita .

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 4
Hiywetn liset’en ewnet met’tolnal
Ayts’eyefenm beeqfu yaqfenal
Min sitseru neber bilo yemaykases
Beselam gibu new qalu yemifews .

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 5
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yetewega
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5642afac-0ce3-458d-889d-11189a9feb5e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 1
ያቺ ክፉ ኃጢያት የኖረች ስሰራት
እራሴን እንዳላውቅ ይዛኝ በእስራት
መልኬን እያሳየሁ ኃጢያትን ሳከማች
እንቅፋት ሆኛለሁ ለብዙ ነፍሳቶች

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 2
የሽቱው ዕቃና ልቤንም ከፍቼ
ይኸው አለቅሳለሁ ፊትህ ተደፍቼ
የፈረስኩበትን በአንተ እንድገነባ
ሽቱው ለፍቅርህ ነው ለንስሓ እንባ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 3
እየሳሳህልኝ አይኔንም እያየህ
ልጄ ሆይ ተነሺ በፍቅር እያልክ
እያዘንኩ መጥቼ መለስከኝ በደስታ
ሳትፈርድብኝ ማርከኝ ነፍሴ መንገድ ስታ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 4
ሕይወትን ሊሰጠን እውነት መጥቶልናል
አይጸየፈንም በእቅፉ ያቅፈናል
ምን ስትሰሩ ነበር ብሎ የማይካሰስ
በሰላም ግቡ ነው ቃሉ የሚፈውስ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 5
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተወጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5642afac-0ce3-458d-889d-11189a9feb5e'::uuid, 'lbena-shtuyen-zemarit-betselot-asmare', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cherinetih-new-2633 ("Cherinetih New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '597861ee-097e-4ea2-b4a3-0859ad97fe20'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)',
        lyrics_transliteration = 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '597861ee-097e-4ea2-b4a3-0859ad97fe20'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '597861ee-097e-4ea2-b4a3-0859ad97fe20'::uuid, 'cherinetih-new-2633', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anibiche-yenegerikush ("Anibiche Yenegerikush")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9fa4340f-5084-48c6-a46f-428444234585'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 1
መች አለ ያልደረስኩበት
ከምድር ባለመድኃኒት
ባነባ መጥቼ ደጅሽ
በምልጃሽ ተጽናናሁ ልጅሽ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 2
ፀበልሽ ሰራኝ ዳግመኛ
እምነትሽ ሆነኝ መጽናኛ
ቀና አልኩኝ ከማቀርቀሬ
ታደሰ ሁሉ ነገሬ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 3
ይህን ያረገው ያመለክሽው(፪)
ጸሎቴን ሰምቷል ላመስግነው(፪)
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 4
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 1
Mech ale yaldereskubet
Kemdr balemedhanit
Baneba met’che dejsh
Bemljash tets’nanahu lijsh

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 2
Ts’ebelsh seragn dagmegna
Emnetsh honegn mets’nagna
Qena alkugn kemaqerqere
Tadese hulu negere

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 3
Yihn yaregew yamelekshw (2)
Ts’eloten semtwal lamesgnew (2)
Met’che wede dejsh
Anbche yenegerkush

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 4
Dersolgn silete semrwal
Arsema miljash redtognal

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 1
መች አለ ያልደረስኩበት
ከምድር ባለመድኃኒት
ባነባ መጥቼ ደጅሽ
በምልጃሽ ተጽናናሁ ልጅሽ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 2
ፀበልሽ ሰራኝ ዳግመኛ
እምነትሽ ሆነኝ መጽናኛ
ቀና አልኩኝ ከማቀርቀሬ
ታደሰ ሁሉ ነገሬ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 3
ይህን ያረገው ያመለክሽው(፪)
ጸሎቴን ሰምቷል ላመስግነው(፪)
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 4
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል',
        lyrics_transliteration = 'CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 1
Mech ale yaldereskubet
Kemdr balemedhanit
Baneba met’che dejsh
Bemljash tets’nanahu lijsh

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 2
Ts’ebelsh seragn dagmegna
Emnetsh honegn mets’nagna
Qena alkugn kemaqerqere
Tadese hulu negere

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 3
Yihn yaregew yamelekshw (2)
Ts’eloten semtwal lamesgnew (2)
Met’che wede dejsh
Anbche yenegerkush

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 4
Dersolgn silete semrwal
Arsema miljash redtognal

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9fa4340f-5084-48c6-a46f-428444234585'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 1
መች አለ ያልደረስኩበት
ከምድር ባለመድኃኒት
ባነባ መጥቼ ደጅሽ
በምልጃሽ ተጽናናሁ ልጅሽ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 2
ፀበልሽ ሰራኝ ዳግመኛ
እምነትሽ ሆነኝ መጽናኛ
ቀና አልኩኝ ከማቀርቀሬ
ታደሰ ሁሉ ነገሬ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 3
ይህን ያረገው ያመለክሽው(፪)
ጸሎቴን ሰምቷል ላመስግነው(፪)
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 4
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9fa4340f-5084-48c6-a46f-428444234585'::uuid, 'anibiche-yenegerikush', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sobese ("Sobese")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5713def9-dbcd-4bca-936d-ea5b68e1487d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ

VERSE 1
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ

CHORUS
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sobese yiwerdu melaekt melaekt yiwerdu aw weliqane melaekt yibel ኧኸ
Albomu dimts’ ኧኸ ኧኸ ኧኸ wealbo aser lemkyadat yiqell ruts’etomu emnefasat wiste hageru leEgziabher ityop’ya

VERSE 1
Sobese yiwerdu melaekt melaekt yiwerdu aw weliqane melaekt yibel ኧኸ
Albomu dimts’ ኧኸ ኧኸ ኧኸ wealbo aser lemkyadat yiqell ruts’etomu emnefasat wiste hageru leEgziabher ityop’ya

CHORUS
Sobese yiwerdu melaekt melaekt yiwerdu aw weliqane melaekt yibel ኧኸ
Albomu dimts’ ኧኸ ኧኸ ኧኸ wealbo aser lemkyadat yiqell ruts’etomu emnefasat wiste hageru leEgziabher ityop’ya'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ

VERSE 1
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ

CHORUS
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ',
        lyrics_transliteration = 'CHORUS
Sobese yiwerdu melaekt melaekt yiwerdu aw weliqane melaekt yibel ኧኸ
Albomu dimts’ ኧኸ ኧኸ ኧኸ wealbo aser lemkyadat yiqell ruts’etomu emnefasat wiste hageru leEgziabher ityop’ya

VERSE 1
Sobese yiwerdu melaekt melaekt yiwerdu aw weliqane melaekt yibel ኧኸ
Albomu dimts’ ኧኸ ኧኸ ኧኸ wealbo aser lemkyadat yiqell ruts’etomu emnefasat wiste hageru leEgziabher ityop’ya

CHORUS
Sobese yiwerdu melaekt melaekt yiwerdu aw weliqane melaekt yibel ኧኸ
Albomu dimts’ ኧኸ ኧኸ ኧኸ wealbo aser lemkyadat yiqell ruts’etomu emnefasat wiste hageru leEgziabher ityop’ya',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5713def9-dbcd-4bca-936d-ea5b68e1487d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ

VERSE 1
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ

CHORUS
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5713def9-dbcd-4bca-936d-ea5b68e1487d'::uuid, 'sobese', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- moytu-zenagf ("moytu zenagf")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '59331be0-16a4-47d9-beec-1d183221c8ed'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 1
> ዓስቢ ሓጢኣተይ ሞት ምስ ኮነ ፍርዱ
ምፍዳዪ ክስእን እቲ ዕዳይ ከቢዱ
ፍጹም ኣይክኣለን እቲ ቦቕባቕ ከብድኻ
በጃ ሓጢኣተይ ኣንጠብጠበ ደምካ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 2
ተቆርሰ ስጋኻ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 3
እየሱሰይ ንስኻ ጥራይ
> ንምንታይ ወዲቀ ዝብሎ የብለይን
መርትዖ ዘቅርቦ መናገፊ ዝኸውን
ንምድሓነይ ግና ንስኻ ኢኻ ምኽንያተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 4
ጽዋእ ሞት ጨሊጥካ
ዘውሓስካለይ ስፍራይ ዘስገርካያ ነፍሰይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 5
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ውርደተይ''ዪ ኔሩ ዝተዋረድካዬ
ቅንዕ ክብል ኣነ ድንን ዝበልካዬ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 6
ክሳብ ክንድዚ ድያ መራር እዛ ፍቅሪ
ሞት ዘሕረየትካ ከለኻ ፈጣሪ
ንጉስ ሰማይ ምድሪ
እናደመየ ዝሓከመ ቁስለይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 7
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ንስለይ ዝተኸፍለ ከቢድ ዋጋ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 8
ኣብ መስቀል
ካብ ልበይ ከይሃስስ ከይብሎ ውን ሸለል
ንቅዱስ መንፈስካ ጎይታ ልኣኸለይ
ክዘኻኽረኒ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 9
ክሕተም ኣብ ልበይ ክሓትሞ ኣብ ልበይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 10
እየሱሰይ ንስኻ ጥራይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 1
> asbi hat’iatey mot mis kone firdu
Mifdayi kisen eti eday kebidu
Fits’um aykalen eti boቕbaቕ kebdኻ
Beja hat’iatey ant’ebt’ebe demka

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 2
Teqorse sigaኻ
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 3
Eyesusey nisኻ t’ray
> nimntay wediqe ziblo yebleyn
Merto zeqrbo menagefi ziኸwn
Nimdhaney gina nisኻ iኻ miኽnyatey

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 4
Ts’wae mot ch’elit’ka
Zewhaskaley sifray zesgerkaya nefsey
Enademeye zihakeme qusley
Enadeኸme zeberta hayley

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 5
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray
> wirdetey''yi neru zitewaredkaye
Qine kibl ane dinn zibelkaye

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 6
Kisab kindzi diya merar eza fiqri
Mot zehreyetka keleኻ fet’ari
Nigus semay midri
Enademeye zihakeme qusley

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 7
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray
> nisley ziteኸfle kebid waga

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 8
Ab mesqel
Kab libey keyhass keyblo win shelel
Niqdus menfeska goyta liaኸley
Kizeኻኽreni

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 9
Kihtem ab libey kihatmo ab libey
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 10
Eyesusey nisኻ t’ray

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 1
> ዓስቢ ሓጢኣተይ ሞት ምስ ኮነ ፍርዱ
ምፍዳዪ ክስእን እቲ ዕዳይ ከቢዱ
ፍጹም ኣይክኣለን እቲ ቦቕባቕ ከብድኻ
በጃ ሓጢኣተይ ኣንጠብጠበ ደምካ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 2
ተቆርሰ ስጋኻ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 3
እየሱሰይ ንስኻ ጥራይ
> ንምንታይ ወዲቀ ዝብሎ የብለይን
መርትዖ ዘቅርቦ መናገፊ ዝኸውን
ንምድሓነይ ግና ንስኻ ኢኻ ምኽንያተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 4
ጽዋእ ሞት ጨሊጥካ
ዘውሓስካለይ ስፍራይ ዘስገርካያ ነፍሰይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 5
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ውርደተይ''ዪ ኔሩ ዝተዋረድካዬ
ቅንዕ ክብል ኣነ ድንን ዝበልካዬ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 6
ክሳብ ክንድዚ ድያ መራር እዛ ፍቅሪ
ሞት ዘሕረየትካ ከለኻ ፈጣሪ
ንጉስ ሰማይ ምድሪ
እናደመየ ዝሓከመ ቁስለይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 7
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ንስለይ ዝተኸፍለ ከቢድ ዋጋ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 8
ኣብ መስቀል
ካብ ልበይ ከይሃስስ ከይብሎ ውን ሸለል
ንቅዱስ መንፈስካ ጎይታ ልኣኸለይ
ክዘኻኽረኒ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 9
ክሕተም ኣብ ልበይ ክሓትሞ ኣብ ልበይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 10
እየሱሰይ ንስኻ ጥራይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ',
        lyrics_transliteration = 'CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 1
> asbi hat’iatey mot mis kone firdu
Mifdayi kisen eti eday kebidu
Fits’um aykalen eti boቕbaቕ kebdኻ
Beja hat’iatey ant’ebt’ebe demka

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 2
Teqorse sigaኻ
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 3
Eyesusey nisኻ t’ray
> nimntay wediqe ziblo yebleyn
Merto zeqrbo menagefi ziኸwn
Nimdhaney gina nisኻ iኻ miኽnyatey

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 4
Ts’wae mot ch’elit’ka
Zewhaskaley sifray zesgerkaya nefsey
Enademeye zihakeme qusley
Enadeኸme zeberta hayley

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 5
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray
> wirdetey''yi neru zitewaredkaye
Qine kibl ane dinn zibelkaye

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 6
Kisab kindzi diya merar eza fiqri
Mot zehreyetka keleኻ fet’ari
Nigus semay midri
Enademeye zihakeme qusley

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 7
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray
> nisley ziteኸfle kebid waga

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 8
Ab mesqel
Kab libey keyhass keyblo win shelel
Niqdus menfeska goyta liaኸley
Kizeኻኽreni

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 9
Kihtem ab libey kihatmo ab libey
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 10
Eyesusey nisኻ t’ray

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray',
        updated_at = clock_timestamp()::text
    WHERE import_id = '59331be0-16a4-47d9-beec-1d183221c8ed'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 1
> ዓስቢ ሓጢኣተይ ሞት ምስ ኮነ ፍርዱ
ምፍዳዪ ክስእን እቲ ዕዳይ ከቢዱ
ፍጹም ኣይክኣለን እቲ ቦቕባቕ ከብድኻ
በጃ ሓጢኣተይ ኣንጠብጠበ ደምካ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 2
ተቆርሰ ስጋኻ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 3
እየሱሰይ ንስኻ ጥራይ
> ንምንታይ ወዲቀ ዝብሎ የብለይን
መርትዖ ዘቅርቦ መናገፊ ዝኸውን
ንምድሓነይ ግና ንስኻ ኢኻ ምኽንያተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 4
ጽዋእ ሞት ጨሊጥካ
ዘውሓስካለይ ስፍራይ ዘስገርካያ ነፍሰይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 5
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ውርደተይ''ዪ ኔሩ ዝተዋረድካዬ
ቅንዕ ክብል ኣነ ድንን ዝበልካዬ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 6
ክሳብ ክንድዚ ድያ መራር እዛ ፍቅሪ
ሞት ዘሕረየትካ ከለኻ ፈጣሪ
ንጉስ ሰማይ ምድሪ
እናደመየ ዝሓከመ ቁስለይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 7
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ንስለይ ዝተኸፍለ ከቢድ ዋጋ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 8
ኣብ መስቀል
ካብ ልበይ ከይሃስስ ከይብሎ ውን ሸለል
ንቅዱስ መንፈስካ ጎይታ ልኣኸለይ
ክዘኻኽረኒ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 9
ክሕተም ኣብ ልበይ ክሓትሞ ኣብ ልበይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 10
እየሱሰይ ንስኻ ጥራይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '59331be0-16a4-47d9-beec-1d183221c8ed'::uuid, 'moytu-zenagf', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ke-dejeh-siders ("Ke Dejeh Siders")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5f98674d-4dd4-4a86-85f7-c44de14d634f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ

VERSE 1
ለኃጢያቴ ይቅርታ ካንተ እሻለሁ
ኦጌታዬ ሆይ(3) መንገድህን አሳየኝ
የአንተ መንገድ እጅግ ይከብዳል
የጽድቅህ ፈተና ማለፍ ይጠይቃል

CHORUS
ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ

VERSE 2
ኦጌታዬ ሆይ(3) ጥበቃህ ይደንቃል
ደካማ ብሆን በራሴ ባልችለውም
አንተ በኔ ካለህ ድል አደርገዋለሁ
ኦጌታዬ ሆይ(3) አሸንፈዋለሁ

CHORUS
ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kedejh siders libe yimetal
Wede maderiyah egre tenestwal
Ogetaye hoy (3) libeanten yimegnal
Hiyweten lante liset’ met’ahu

VERSE 1
Lehat’iyate yiqrta kante eshalehu
Ogetaye hoy (3) mengedhn asayegn
Yeante menged ejg yikebdal
Yets’dqh fetena malef yit’eyqal

CHORUS
Kedejh siders libe yimetal
Wede maderiyah egre tenestwal
Ogetaye hoy (3) libeanten yimegnal
Hiyweten lante liset’ met’ahu

VERSE 2
Ogetaye hoy (3) t’beqah yidenqal
Dekama bihon berase balchlewm
Ante bene kaleh dil adergewalehu
Ogetaye hoy (3) ashenfewalehu

CHORUS
Kedejh siders libe yimetal
Wede maderiyah egre tenestwal
Ogetaye hoy (3) libeanten yimegnal
Hiyweten lante liset’ met’ahu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ

VERSE 1
ለኃጢያቴ ይቅርታ ካንተ እሻለሁ
ኦጌታዬ ሆይ(3) መንገድህን አሳየኝ
የአንተ መንገድ እጅግ ይከብዳል
የጽድቅህ ፈተና ማለፍ ይጠይቃል

CHORUS
ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ

VERSE 2
ኦጌታዬ ሆይ(3) ጥበቃህ ይደንቃል
ደካማ ብሆን በራሴ ባልችለውም
አንተ በኔ ካለህ ድል አደርገዋለሁ
ኦጌታዬ ሆይ(3) አሸንፈዋለሁ

CHORUS
ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ',
        lyrics_transliteration = 'CHORUS
Kedejh siders libe yimetal
Wede maderiyah egre tenestwal
Ogetaye hoy (3) libeanten yimegnal
Hiyweten lante liset’ met’ahu

VERSE 1
Lehat’iyate yiqrta kante eshalehu
Ogetaye hoy (3) mengedhn asayegn
Yeante menged ejg yikebdal
Yets’dqh fetena malef yit’eyqal

CHORUS
Kedejh siders libe yimetal
Wede maderiyah egre tenestwal
Ogetaye hoy (3) libeanten yimegnal
Hiyweten lante liset’ met’ahu

VERSE 2
Ogetaye hoy (3) t’beqah yidenqal
Dekama bihon berase balchlewm
Ante bene kaleh dil adergewalehu
Ogetaye hoy (3) ashenfewalehu

CHORUS
Kedejh siders libe yimetal
Wede maderiyah egre tenestwal
Ogetaye hoy (3) libeanten yimegnal
Hiyweten lante liset’ met’ahu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5f98674d-4dd4-4a86-85f7-c44de14d634f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ

VERSE 1
ለኃጢያቴ ይቅርታ ካንተ እሻለሁ
ኦጌታዬ ሆይ(3) መንገድህን አሳየኝ
የአንተ መንገድ እጅግ ይከብዳል
የጽድቅህ ፈተና ማለፍ ይጠይቃል

CHORUS
ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ

VERSE 2
ኦጌታዬ ሆይ(3) ጥበቃህ ይደንቃል
ደካማ ብሆን በራሴ ባልችለውም
አንተ በኔ ካለህ ድል አደርገዋለሁ
ኦጌታዬ ሆይ(3) አሸንፈዋለሁ

CHORUS
ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5f98674d-4dd4-4a86-85f7-c44de14d634f'::uuid, 'ke-dejeh-siders', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yibelomu-iyesus ("Yibelomu Iyesus")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5b7e0036-a0ad-472e-94ea-16b9ca14cd4d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይቤሎሙ ኢየሱስ (፪) ለአይሁድ (፪)
እመኑ ብየ ወእመኑ በአቡየ
አበርህ በመስቀልየ ለእሊያየ (፪)

VERSE 1
ይቤሎሙ ኢየሱስ ለአይሁድ እመኑ ብየ (፪)
ወእመኑ በአቡየ አበርህ (፪)
በመስቀልየ (፪)

CHORUS
ይቤሎሙ ኢየሱስ (፪) ለአይሁድ (፪)
እመኑ ብየ ወእመኑ በአቡየ
አበርህ በመስቀልየ ለእሊያየ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yibelomu Iyesus (2) le’Ayhud (2)
Emenu b’ye we’emenu be’abuye
Aberih bemeskelye le’iliyaye (2)

VERSE 1
Yibelomu Iyesus le’Ayhud emenu b’ye (2)
We’emenu be’abuye aberih (2)
Bemeskelye (2)

CHORUS
Yibelomu Iyesus (2) le’Ayhud (2)
Emenu b’ye we’emenu be’abuye
Aberih bemeskelye le’iliyaye (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይቤሎሙ ኢየሱስ (፪) ለአይሁድ (፪)
እመኑ ብየ ወእመኑ በአቡየ
አበርህ በመስቀልየ ለእሊያየ (፪)

VERSE 1
ይቤሎሙ ኢየሱስ ለአይሁድ እመኑ ብየ (፪)
ወእመኑ በአቡየ አበርህ (፪)
በመስቀልየ (፪)

CHORUS
ይቤሎሙ ኢየሱስ (፪) ለአይሁድ (፪)
እመኑ ብየ ወእመኑ በአቡየ
አበርህ በመስቀልየ ለእሊያየ (፪)',
        lyrics_transliteration = 'CHORUS
Yibelomu Iyesus (2) le’Ayhud (2)
Emenu b’ye we’emenu be’abuye
Aberih bemeskelye le’iliyaye (2)

VERSE 1
Yibelomu Iyesus le’Ayhud emenu b’ye (2)
We’emenu be’abuye aberih (2)
Bemeskelye (2)

CHORUS
Yibelomu Iyesus (2) le’Ayhud (2)
Emenu b’ye we’emenu be’abuye
Aberih bemeskelye le’iliyaye (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5b7e0036-a0ad-472e-94ea-16b9ca14cd4d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይቤሎሙ ኢየሱስ (፪) ለአይሁድ (፪)
እመኑ ብየ ወእመኑ በአቡየ
አበርህ በመስቀልየ ለእሊያየ (፪)

VERSE 1
ይቤሎሙ ኢየሱስ ለአይሁድ እመኑ ብየ (፪)
ወእመኑ በአቡየ አበርህ (፪)
በመስቀልየ (፪)

CHORUS
ይቤሎሙ ኢየሱስ (፪) ለአይሁድ (፪)
እመኑ ብየ ወእመኑ በአቡየ
አበርህ በመስቀልየ ለእሊያየ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yibelomu Iyesus (2) le’Ayhud (2)
Emenu b’ye we’emenu be’abuye
Aberih bemeskelye le’iliyaye (2)

VERSE 1
Yibelomu Iyesus le’Ayhud emenu b’ye (2)
We’emenu be’abuye aberih (2)
Bemeskelye (2)

CHORUS
Yibelomu Iyesus (2) le’Ayhud (2)
Emenu b’ye we’emenu be’abuye
Aberih bemeskelye le’iliyaye (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5b7e0036-a0ad-472e-94ea-16b9ca14cd4d'::uuid, 'yibelomu-iyesus', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wemdrni-tgebr-fasika ("wemdrni tgebr fasika")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5e2e6179-3d2c-4888-b9b3-fd330424804c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3

VERSE 1
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3

CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3

VERSE 1
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3

CHORUS
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3

VERSE 1
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3

CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3',
        lyrics_transliteration = 'CHORUS
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3

VERSE 1
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3

CHORUS
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5e2e6179-3d2c-4888-b9b3-fd330424804c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3

VERSE 1
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3

CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5e2e6179-3d2c-4888-b9b3-fd330424804c'::uuid, 'wemdrni-tgebr-fasika', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- besew-letenake ("Besew Letenake")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '597c7e32-d3d1-42e5-97e7-7176316232a3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 1
እግዚአብሔር ደርሶ አለሁልህ ያለኝ ያሰው እኔ ነኝ
በተዘጋው ገብቶ በእጆቹ ዳብሶ ከሞት ያዳነኝ
የመርዶዬን ዜና በደስታ ቀይረህ ላስታጠቅከኝ ዜማ
ከመዘመር በቀር የምለው የለኝም አምላኬ ላንተማ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 2
መጠጊያ ከለላ መደገፊያ ምርኩዝ ባጣሁበት ወራት
በዕንባ ሸለቆ ጉንጮቼ ሲሞሉ አቅቶኝ መፅናናት
ገና ሳልወለድ ከዘላለም በፊት ነገሬን የሰራ
ሳቄን የመለሰ የደለደልኝ የጭንቄን ተራራ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 3
ባይተዋርነቴን በአፌ ቅኔ ሞልቶ አመስጋኝ ያረገኝ
እንደ ባለ ማዕረግ መወደድ ሳይኖረኝ የተመለከተኝ
እንደተናገረ ያለውን የሚያደርግ አደራ ማይበላ
አለልኝ የምለው እርሱ ብቻ የኔ የነፍሴ ከለላ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 4
ክፋት በበዛበት በዚህ ክፉ ዘመን የሆንከኝ ወዳጄ
ሲመሽም ሲነጋም የምዘምርልህ በደስታ ፈቅጄ
ሞቴን የማትሻ የልጅነቴ አምላክ መተማመኛዬ
እንባዬን ልታብስ በተዘጋው በኩል መጥተሃል ጌታዬ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 1
Egziabher derso alehulh yalegn yasew ene negn
Betezegaw gebto beejochu dabso kemot yadanegn
Yemerdoyen zena bedesta qeyreh lastat’eqkegn zema
Kemezemer beqer yemlew yelegnm amlake lantema

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 2
Met’egiya kelela medegefiya mirkuz bat’ahubet werat
Beenba sheleqo gunch’oche simolu aqtogn mets’nanat
Gena salweled kezelalem befit negeren yesera
Saqen yemelese yedeledelgn yech’nqen terara

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 3
Baytewarneten beafe qine molto amesgagn yaregegn
Ende bale maereg meweded saynoregn yetemeleketegn
Endetenagere yalewn yemiyaderg adera maybela
Alelgn yemlew ersu bicha yene yenefse kelela

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 4
Kifat bebezabet bezih kifu zemen yehonkegn wedaje
Simeshm sinegam yemzemrlh bedesta feqje
Moten yematsha yeljnete amlak metemamegnaye
Enbayen litabs betezegaw bekul met’tehal Getaye

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 1
እግዚአብሔር ደርሶ አለሁልህ ያለኝ ያሰው እኔ ነኝ
በተዘጋው ገብቶ በእጆቹ ዳብሶ ከሞት ያዳነኝ
የመርዶዬን ዜና በደስታ ቀይረህ ላስታጠቅከኝ ዜማ
ከመዘመር በቀር የምለው የለኝም አምላኬ ላንተማ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 2
መጠጊያ ከለላ መደገፊያ ምርኩዝ ባጣሁበት ወራት
በዕንባ ሸለቆ ጉንጮቼ ሲሞሉ አቅቶኝ መፅናናት
ገና ሳልወለድ ከዘላለም በፊት ነገሬን የሰራ
ሳቄን የመለሰ የደለደልኝ የጭንቄን ተራራ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 3
ባይተዋርነቴን በአፌ ቅኔ ሞልቶ አመስጋኝ ያረገኝ
እንደ ባለ ማዕረግ መወደድ ሳይኖረኝ የተመለከተኝ
እንደተናገረ ያለውን የሚያደርግ አደራ ማይበላ
አለልኝ የምለው እርሱ ብቻ የኔ የነፍሴ ከለላ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 4
ክፋት በበዛበት በዚህ ክፉ ዘመን የሆንከኝ ወዳጄ
ሲመሽም ሲነጋም የምዘምርልህ በደስታ ፈቅጄ
ሞቴን የማትሻ የልጅነቴ አምላክ መተማመኛዬ
እንባዬን ልታብስ በተዘጋው በኩል መጥተሃል ጌታዬ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው',
        lyrics_transliteration = 'CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 1
Egziabher derso alehulh yalegn yasew ene negn
Betezegaw gebto beejochu dabso kemot yadanegn
Yemerdoyen zena bedesta qeyreh lastat’eqkegn zema
Kemezemer beqer yemlew yelegnm amlake lantema

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 2
Met’egiya kelela medegefiya mirkuz bat’ahubet werat
Beenba sheleqo gunch’oche simolu aqtogn mets’nanat
Gena salweled kezelalem befit negeren yesera
Saqen yemelese yedeledelgn yech’nqen terara

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 3
Baytewarneten beafe qine molto amesgagn yaregegn
Ende bale maereg meweded saynoregn yetemeleketegn
Endetenagere yalewn yemiyaderg adera maybela
Alelgn yemlew ersu bicha yene yenefse kelela

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 4
Kifat bebezabet bezih kifu zemen yehonkegn wedaje
Simeshm sinegam yemzemrlh bedesta feqje
Moten yematsha yeljnete amlak metemamegnaye
Enbayen litabs betezegaw bekul met’tehal Getaye

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw',
        updated_at = clock_timestamp()::text
    WHERE import_id = '597c7e32-d3d1-42e5-97e7-7176316232a3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 1
እግዚአብሔር ደርሶ አለሁልህ ያለኝ ያሰው እኔ ነኝ
በተዘጋው ገብቶ በእጆቹ ዳብሶ ከሞት ያዳነኝ
የመርዶዬን ዜና በደስታ ቀይረህ ላስታጠቅከኝ ዜማ
ከመዘመር በቀር የምለው የለኝም አምላኬ ላንተማ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 2
መጠጊያ ከለላ መደገፊያ ምርኩዝ ባጣሁበት ወራት
በዕንባ ሸለቆ ጉንጮቼ ሲሞሉ አቅቶኝ መፅናናት
ገና ሳልወለድ ከዘላለም በፊት ነገሬን የሰራ
ሳቄን የመለሰ የደለደልኝ የጭንቄን ተራራ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 3
ባይተዋርነቴን በአፌ ቅኔ ሞልቶ አመስጋኝ ያረገኝ
እንደ ባለ ማዕረግ መወደድ ሳይኖረኝ የተመለከተኝ
እንደተናገረ ያለውን የሚያደርግ አደራ ማይበላ
አለልኝ የምለው እርሱ ብቻ የኔ የነፍሴ ከለላ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 4
ክፋት በበዛበት በዚህ ክፉ ዘመን የሆንከኝ ወዳጄ
ሲመሽም ሲነጋም የምዘምርልህ በደስታ ፈቅጄ
ሞቴን የማትሻ የልጅነቴ አምላክ መተማመኛዬ
እንባዬን ልታብስ በተዘጋው በኩል መጥተሃል ጌታዬ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '597c7e32-d3d1-42e5-97e7-7176316232a3'::uuid, 'besew-letenake', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gebire-menifes-kidus-yealem-birihan-nachew ("Gebire Menifes Kidus Yealem Birihan Nachew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5faa0106-a689-4b21-a7e4-36972352e461'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 1
መላኩ ገብርኤል መንገድ እያሳየህ
በተጋድሎ ዘመን ካንተ መች ተለየህ
እህ ይህው ለዘላለም ያበረል ስራቸው (2) ያበራል ስራቸው (2)
በእግዚአብሔር ተመረጥክ ገና በማህፀን

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 2
ገብረመንፈስ ቅዱስ ፃዲቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ አንተን ወለዱና
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 3
ተጋድሎው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዚአብሔር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አለበሰም

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 4
እህ ይህው ለዘላለም ያበራል ስራቸው ( 2) ያበራል ስራቸው (2)
ገብረ መንፈስ ቅዱስ ያበራል ተጋድሎው
ሀይልንም ያደርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 5
ከእግሮቹ ትቢያ በልተው ይጠግባሉ
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 6
ካምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ
ገብረ መንፈስ ቅዱስ ያለም ብርሐን ናቸው (2)
ይህው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 1
Melaku Gebriel menged eyasayeh
Betegadlo zemen kante mech teleyeh
Eh yihw lezelalem yaberel sirachew (2) yaberal sirachew (2)
BeEgziabher temeret’k gena bemahts’en

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 2
Gebremenfes Kidus ts’adiqu Abatachen
Yeenat abath miljana limena
Fits’amen agegne anten weleduna
Eh yihw lezelalem yaberal sirachew (2)yaberal sirachew (2)

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 3
Tegadlow dinq new ts’nsetu lidetu
BeEgziabher fit kibur new ereftu
Midrawiwn migb andach alqemesem
Besew yetesefa libsm alebesem

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 4
Eh yihw lezelalem yaberal sirachew (2) yaberal sirachew (2)
Gebre menfes Kidus yaberal tegadlow
Heylnm yadergal ts’elotna miljaw
Anabst anabrt eyeteketelu

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 5
Keegrochu tibiya beltew yit’egbalu
Eh yihw lezelalem yaberal sirachew (2)yaberal sirachew (2)
Zarem begna zemen beemnet bets’ebelu
Kehmemu alga sintochu qena alu

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 6
Kamlak yeteset’ew qalkidanu ts’nu
Bereket yadlal bemljaw lamenu
Gebre menfes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew yaberal sirachew

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 1
መላኩ ገብርኤል መንገድ እያሳየህ
በተጋድሎ ዘመን ካንተ መች ተለየህ
እህ ይህው ለዘላለም ያበረል ስራቸው (2) ያበራል ስራቸው (2)
በእግዚአብሔር ተመረጥክ ገና በማህፀን

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 2
ገብረመንፈስ ቅዱስ ፃዲቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ አንተን ወለዱና
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 3
ተጋድሎው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዚአብሔር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አለበሰም

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 4
እህ ይህው ለዘላለም ያበራል ስራቸው ( 2) ያበራል ስራቸው (2)
ገብረ መንፈስ ቅዱስ ያበራል ተጋድሎው
ሀይልንም ያደርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 5
ከእግሮቹ ትቢያ በልተው ይጠግባሉ
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 6
ካምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ
ገብረ መንፈስ ቅዱስ ያለም ብርሐን ናቸው (2)
ይህው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ',
        lyrics_transliteration = 'CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 1
Melaku Gebriel menged eyasayeh
Betegadlo zemen kante mech teleyeh
Eh yihw lezelalem yaberel sirachew (2) yaberal sirachew (2)
BeEgziabher temeret’k gena bemahts’en

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 2
Gebremenfes Kidus ts’adiqu Abatachen
Yeenat abath miljana limena
Fits’amen agegne anten weleduna
Eh yihw lezelalem yaberal sirachew (2)yaberal sirachew (2)

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 3
Tegadlow dinq new ts’nsetu lidetu
BeEgziabher fit kibur new ereftu
Midrawiwn migb andach alqemesem
Besew yetesefa libsm alebesem

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 4
Eh yihw lezelalem yaberal sirachew (2) yaberal sirachew (2)
Gebre menfes Kidus yaberal tegadlow
Heylnm yadergal ts’elotna miljaw
Anabst anabrt eyeteketelu

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 5
Keegrochu tibiya beltew yit’egbalu
Eh yihw lezelalem yaberal sirachew (2)yaberal sirachew (2)
Zarem begna zemen beemnet bets’ebelu
Kehmemu alga sintochu qena alu

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 6
Kamlak yeteset’ew qalkidanu ts’nu
Bereket yadlal bemljaw lamenu
Gebre menfes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew yaberal sirachew

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5faa0106-a689-4b21-a7e4-36972352e461'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 1
መላኩ ገብርኤል መንገድ እያሳየህ
በተጋድሎ ዘመን ካንተ መች ተለየህ
እህ ይህው ለዘላለም ያበረል ስራቸው (2) ያበራል ስራቸው (2)
በእግዚአብሔር ተመረጥክ ገና በማህፀን

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 2
ገብረመንፈስ ቅዱስ ፃዲቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ አንተን ወለዱና
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 3
ተጋድሎው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዚአብሔር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አለበሰም

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 4
እህ ይህው ለዘላለም ያበራል ስራቸው ( 2) ያበራል ስራቸው (2)
ገብረ መንፈስ ቅዱስ ያበራል ተጋድሎው
ሀይልንም ያደርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 5
ከእግሮቹ ትቢያ በልተው ይጠግባሉ
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 6
ካምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ
ገብረ መንፈስ ቅዱስ ያለም ብርሐን ናቸው (2)
ይህው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5faa0106-a689-4b21-a7e4-36972352e461'::uuid, 'gebire-menifes-kidus-yealem-birihan-nachew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eyehonikegn-anite-moges ("Eyehonikegn Anite Moges")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6165cf77-5072-4c9c-aeaf-2abbc635c722'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 1
ድል አደርጋለሁኝ ያንተን ስም ታጥቄ
በአንተ እየተደገፍኩ አላቅም ወድቄ
ታየኛለህ ዘወትር አየሳሳ በፍቅር
ሐዋርያው ዮሐንስ አባትና መምህር

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 2
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 3
ተሰማ እልልታ ደምፅ መዝሙር በድንኳኔ
ምልጃህ ኃይል አረገች ሞገስ ሆነች ለኔ
የልቤ መፅናኛ ጊዜ አይተህ ማትከዳ
ታትመህ የምትኖር በልቤ ሰሌዳ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 4
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 5
ቃላት ያንሱብኛል ለምስጋናህ ቅኔ
በምንስ አቅሜ ነው ምቀኝልህ እኔ
ወልደ ነጎድጓድ ሆይ የነፍሴ ደስታ
አቀርብልሀለሁ ከፍ ያለ እልልታ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 6
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 7
ወንጌልን መግበህ አሳደከኝ ደጅህ
ተጠብቄ ኖርኩኝ ተመግቤ ከእጅህ
የቤቴ ሰላም ነህ መሪ የህይወቴ
ፍቁረ እግዚእ ዮሐንስ ልዩ ነህ አባቴ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 8
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 1
Dil adergalehugn yanten sim tat’qe
Beante eyetedegefku alaqm wedqe
Tayegnaleh zewetr ayesasa befqr
Hewaryaw yohens abatna memhr

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 2
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 3
Tesema ellta demts’ mezmur bednkwane
Miljah hayl aregech moges honech lene
Yelbe mets’nagna gize ayteh matkeda
Tatmeh yemtnor belbe seleda

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 4
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 5
Qalat yansubgnal lemsganah qine
Bemns aqme new miqegnlh ene
Welde negodgwad hoy yenefse desta
Aqerblhelehu kef yale ellta

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 6
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 7
Wengeln megbeh asadekegn dejh
Tet’ebqe norkugn temegbe keejh
Yebete selam neh meri yehywete
Fiqure egzie yohens liyu neh abate

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 8
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 1
ድል አደርጋለሁኝ ያንተን ስም ታጥቄ
በአንተ እየተደገፍኩ አላቅም ወድቄ
ታየኛለህ ዘወትር አየሳሳ በፍቅር
ሐዋርያው ዮሐንስ አባትና መምህር

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 2
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 3
ተሰማ እልልታ ደምፅ መዝሙር በድንኳኔ
ምልጃህ ኃይል አረገች ሞገስ ሆነች ለኔ
የልቤ መፅናኛ ጊዜ አይተህ ማትከዳ
ታትመህ የምትኖር በልቤ ሰሌዳ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 4
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 5
ቃላት ያንሱብኛል ለምስጋናህ ቅኔ
በምንስ አቅሜ ነው ምቀኝልህ እኔ
ወልደ ነጎድጓድ ሆይ የነፍሴ ደስታ
አቀርብልሀለሁ ከፍ ያለ እልልታ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 6
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 7
ወንጌልን መግበህ አሳደከኝ ደጅህ
ተጠብቄ ኖርኩኝ ተመግቤ ከእጅህ
የቤቴ ሰላም ነህ መሪ የህይወቴ
ፍቁረ እግዚእ ዮሐንስ ልዩ ነህ አባቴ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 8
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ',
        lyrics_transliteration = 'CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 1
Dil adergalehugn yanten sim tat’qe
Beante eyetedegefku alaqm wedqe
Tayegnaleh zewetr ayesasa befqr
Hewaryaw yohens abatna memhr

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 2
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 3
Tesema ellta demts’ mezmur bednkwane
Miljah hayl aregech moges honech lene
Yelbe mets’nagna gize ayteh matkeda
Tatmeh yemtnor belbe seleda

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 4
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 5
Qalat yansubgnal lemsganah qine
Bemns aqme new miqegnlh ene
Welde negodgwad hoy yenefse desta
Aqerblhelehu kef yale ellta

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 6
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 7
Wengeln megbeh asadekegn dejh
Tet’ebqe norkugn temegbe keejh
Yebete selam neh meri yehywete
Fiqure egzie yohens liyu neh abate

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 8
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6165cf77-5072-4c9c-aeaf-2abbc635c722'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 1
ድል አደርጋለሁኝ ያንተን ስም ታጥቄ
በአንተ እየተደገፍኩ አላቅም ወድቄ
ታየኛለህ ዘወትር አየሳሳ በፍቅር
ሐዋርያው ዮሐንስ አባትና መምህር

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 2
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 3
ተሰማ እልልታ ደምፅ መዝሙር በድንኳኔ
ምልጃህ ኃይል አረገች ሞገስ ሆነች ለኔ
የልቤ መፅናኛ ጊዜ አይተህ ማትከዳ
ታትመህ የምትኖር በልቤ ሰሌዳ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 4
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 5
ቃላት ያንሱብኛል ለምስጋናህ ቅኔ
በምንስ አቅሜ ነው ምቀኝልህ እኔ
ወልደ ነጎድጓድ ሆይ የነፍሴ ደስታ
አቀርብልሀለሁ ከፍ ያለ እልልታ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 6
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 7
ወንጌልን መግበህ አሳደከኝ ደጅህ
ተጠብቄ ኖርኩኝ ተመግቤ ከእጅህ
የቤቴ ሰላም ነህ መሪ የህይወቴ
ፍቁረ እግዚእ ዮሐንስ ልዩ ነህ አባቴ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 8
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6165cf77-5072-4c9c-aeaf-2abbc635c722'::uuid, 'eyehonikegn-anite-moges', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dej-tenaw-koyche ("Dej T’naaw Koyche")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '63b19841-1204-4f65-aee5-2a289311e431'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 1
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የአለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባርያሽን ሰወረኝ ከአስጨናቂው ሞት

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 2
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 3
ልቤ ባንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼ ላይ አፌ ተናገረ
በማዳንሽ ስራ ባርያሽ ደስ ብሎኛል
የኃያላኑን ቀስት ልጅሽ ሰብሮልኛል

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 4
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 5
እጄ ባዶ ሲሆን ወዳጆቼ ሸሹ
በመርግም ምክራቸው ሊለያዩን ሲሹ
እርሱ የሰጠኝን እሱ ወሰድ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 6
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 7
ከአውደ ምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየቺኝ ኪዳነ ምህረት
ሀሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘውት እናቴ ባንቺ ነው

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 8
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 1
Yemekiraw zemen alefe endewaza
Anch’in tetegiche ye’aleman beza
Ye lijish chernet, ye anchim degnet
Baryashen sewareny ke’aschenaqiw mot

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 2
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 3
Libe banchi ts’ena, kef kefm ale
Bet’elatoch’e lay, afe tenagere
Bemadanesh sira, baryashen des blonyal
Yehayalanu’n qest, lijish sebrolyal

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 4
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 5
Eje bado sihon, wedajoch’e sheshu
Bemergem mikrach’ew, lileyayun sishu
Ersu yeset’egn, isu wosed alk’achew
Emebete alechign biye asafark’wachew

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 6
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 7
Be’awde mihretu hone set’rat
Zenbel bla ayechin Kidane Mihret
Hasabshen minm yelem yemimeslew
Ereft yagenyewt enate banchi new

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 8
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 1
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የአለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባርያሽን ሰወረኝ ከአስጨናቂው ሞት

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 2
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 3
ልቤ ባንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼ ላይ አፌ ተናገረ
በማዳንሽ ስራ ባርያሽ ደስ ብሎኛል
የኃያላኑን ቀስት ልጅሽ ሰብሮልኛል

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 4
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 5
እጄ ባዶ ሲሆን ወዳጆቼ ሸሹ
በመርግም ምክራቸው ሊለያዩን ሲሹ
እርሱ የሰጠኝን እሱ ወሰድ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 6
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 7
ከአውደ ምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየቺኝ ኪዳነ ምህረት
ሀሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘውት እናቴ ባንቺ ነው

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 8
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን',
        lyrics_transliteration = 'CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 1
Yemekiraw zemen alefe endewaza
Anch’in tetegiche ye’aleman beza
Ye lijish chernet, ye anchim degnet
Baryashen sewareny ke’aschenaqiw mot

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 2
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 3
Libe banchi ts’ena, kef kefm ale
Bet’elatoch’e lay, afe tenagere
Bemadanesh sira, baryashen des blonyal
Yehayalanu’n qest, lijish sebrolyal

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 4
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 5
Eje bado sihon, wedajoch’e sheshu
Bemergem mikrach’ew, lileyayun sishu
Ersu yeset’egn, isu wosed alk’achew
Emebete alechign biye asafark’wachew

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 6
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 7
Be’awde mihretu hone set’rat
Zenbel bla ayechin Kidane Mihret
Hasabshen minm yelem yemimeslew
Ereft yagenyewt enate banchi new

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 8
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '63b19841-1204-4f65-aee5-2a289311e431'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 1
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የአለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባርያሽን ሰወረኝ ከአስጨናቂው ሞት

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 2
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 3
ልቤ ባንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼ ላይ አፌ ተናገረ
በማዳንሽ ስራ ባርያሽ ደስ ብሎኛል
የኃያላኑን ቀስት ልጅሽ ሰብሮልኛል

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 4
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 5
እጄ ባዶ ሲሆን ወዳጆቼ ሸሹ
በመርግም ምክራቸው ሊለያዩን ሲሹ
እርሱ የሰጠኝን እሱ ወሰድ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 6
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 7
ከአውደ ምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየቺኝ ኪዳነ ምህረት
ሀሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘውት እናቴ ባንቺ ነው

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 8
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

CHORUS
ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 1
Yemekiraw zemen alefe endewaza
Anch’in tetegiche ye’aleman beza
Ye lijish chernet, ye anchim degnet
Baryashen sewareny ke’aschenaqiw mot

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 2
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 3
Libe banchi ts’ena, kef kefm ale
Bet’elatoch’e lay, afe tenagere
Bemadanesh sira, baryashen des blonyal
Yehayalanu’n qest, lijish sebrolyal

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 4
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 5
Eje bado sihon, wedajoch’e sheshu
Bemergem mikrach’ew, lileyayun sishu
Ersu yeset’egn, isu wosed alk’achew
Emebete alechign biye asafark’wachew

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 6
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 7
Be’awde mihretu hone set’rat
Zenbel bla ayechin Kidane Mihret
Hasabshen minm yelem yemimeslew
Ereft yagenyewt enate banchi new

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 8
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

CHORUS
Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '63b19841-1204-4f65-aee5-2a289311e431'::uuid, 'dej-tenaw-koyche', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- seregelawochih-yeesat-nachew ("Seregelawochih Yeesat Nachew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '663b4d9a-69e0-4e62-a14e-ec7ba1059987'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 1
ሳመልክህ እኖራለሁ ጠዋት ማታ ×3
በእሳት ሰረገላ ታጥሯል መንደራችን
ግያዝ ሆይ አትፍራ አለ ፈጣሪያችን
የጠላትን ምሽግ በቃሉ ይቆርጣል

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 2
ከእኛ ጋራ ያለው ከነርሱ ይበልጣል
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 3
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2
ከቴማን ተራራ ከፋራን ሲወርድ
ጠላት ይጨነቃል ከድምፁ በሞገድ

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 4
ጦረኛ አያበዛም ሞአብን ሲመታ
በአህያ መንጋጋ ሺውን ጥሏል ጌታ
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 5
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2
የጥልቁን መሰረት በንፋስ አስሮታል

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 6
ከሰማያት በላይ ዙፋኑን ዘርግቷል
ዘንባባ ይዛችሁ ግቡ ከመቅደሱ
በመስጋናው ስርአት እንድትቀደሱ
ሰረገላዎችህ የሳት ናቸው

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 7
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 8
ወደረኞቻችን ከቁጥር ቢበዙም
እንደ ቃየል ልጆች ሾትል አንመዝም
እንጀራም መግበን እንሰዳቸዋለን
በቀልና ፍርድን ለአምላካችን ትተን

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 9
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 10
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 1
Samelkh enoralehu t’ewat mata ×3
Beesat seregela tat’rwal menderachn
Giyaz hoy atfra ale fet’ariyachn
Yet’elatn mishg beqalu yiqort’al

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 2
Keegna gara yalew kenersu yibelt’al
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 3
Ante bicha Kidus heyal Geta
Samelkh enoralehu t’ewat mata ×2
Keteman terara kefaran siwerd
T’elat yich’eneqal kedmts’u bemoged

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 4
T’oregna ayabezam moabn simeta
Beahya mengaga shiwn t’lwal Geta
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 5
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta
Samelkh enoralehu t’ewat mata ×2
Yet’lqun meseret benfas asrotal

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 6
Kesemayat belay zufanun zergtwal
Zenbaba yizachhu gibu kemeqdesu
Bemesganaw sirat endtqedesu
Seregelawochh yesat nachew

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 7
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta
Samelkh enoralehu t’ewat mata ×2

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 8
Wederegnochachn kequt’r bibezum
Ende qayel lijoch shotl anmezm
Enjeram megben ensedachewalen
Beqelna firdn leamlakachn titen

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 9
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 10
Samelkh enoralehu t’ewat mata ×2

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 1
ሳመልክህ እኖራለሁ ጠዋት ማታ ×3
በእሳት ሰረገላ ታጥሯል መንደራችን
ግያዝ ሆይ አትፍራ አለ ፈጣሪያችን
የጠላትን ምሽግ በቃሉ ይቆርጣል

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 2
ከእኛ ጋራ ያለው ከነርሱ ይበልጣል
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 3
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2
ከቴማን ተራራ ከፋራን ሲወርድ
ጠላት ይጨነቃል ከድምፁ በሞገድ

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 4
ጦረኛ አያበዛም ሞአብን ሲመታ
በአህያ መንጋጋ ሺውን ጥሏል ጌታ
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 5
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2
የጥልቁን መሰረት በንፋስ አስሮታል

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 6
ከሰማያት በላይ ዙፋኑን ዘርግቷል
ዘንባባ ይዛችሁ ግቡ ከመቅደሱ
በመስጋናው ስርአት እንድትቀደሱ
ሰረገላዎችህ የሳት ናቸው

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 7
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 8
ወደረኞቻችን ከቁጥር ቢበዙም
እንደ ቃየል ልጆች ሾትል አንመዝም
እንጀራም መግበን እንሰዳቸዋለን
በቀልና ፍርድን ለአምላካችን ትተን

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 9
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 10
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ',
        lyrics_transliteration = 'CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 1
Samelkh enoralehu t’ewat mata ×3
Beesat seregela tat’rwal menderachn
Giyaz hoy atfra ale fet’ariyachn
Yet’elatn mishg beqalu yiqort’al

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 2
Keegna gara yalew kenersu yibelt’al
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 3
Ante bicha Kidus heyal Geta
Samelkh enoralehu t’ewat mata ×2
Keteman terara kefaran siwerd
T’elat yich’eneqal kedmts’u bemoged

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 4
T’oregna ayabezam moabn simeta
Beahya mengaga shiwn t’lwal Geta
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 5
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta
Samelkh enoralehu t’ewat mata ×2
Yet’lqun meseret benfas asrotal

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 6
Kesemayat belay zufanun zergtwal
Zenbaba yizachhu gibu kemeqdesu
Bemesganaw sirat endtqedesu
Seregelawochh yesat nachew

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 7
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta
Samelkh enoralehu t’ewat mata ×2

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 8
Wederegnochachn kequt’r bibezum
Ende qayel lijoch shotl anmezm
Enjeram megben ensedachewalen
Beqelna firdn leamlakachn titen

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 9
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 10
Samelkh enoralehu t’ewat mata ×2

CHORUS
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '663b4d9a-69e0-4e62-a14e-ec7ba1059987'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 1
ሳመልክህ እኖራለሁ ጠዋት ማታ ×3
በእሳት ሰረገላ ታጥሯል መንደራችን
ግያዝ ሆይ አትፍራ አለ ፈጣሪያችን
የጠላትን ምሽግ በቃሉ ይቆርጣል

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 2
ከእኛ ጋራ ያለው ከነርሱ ይበልጣል
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 3
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2
ከቴማን ተራራ ከፋራን ሲወርድ
ጠላት ይጨነቃል ከድምፁ በሞገድ

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 4
ጦረኛ አያበዛም ሞአብን ሲመታ
በአህያ መንጋጋ ሺውን ጥሏል ጌታ
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 5
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2
የጥልቁን መሰረት በንፋስ አስሮታል

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 6
ከሰማያት በላይ ዙፋኑን ዘርግቷል
ዘንባባ ይዛችሁ ግቡ ከመቅደሱ
በመስጋናው ስርአት እንድትቀደሱ
ሰረገላዎችህ የሳት ናቸው

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 7
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 8
ወደረኞቻችን ከቁጥር ቢበዙም
እንደ ቃየል ልጆች ሾትል አንመዝም
እንጀራም መግበን እንሰዳቸዋለን
በቀልና ፍርድን ለአምላካችን ትተን

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 9
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 10
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2

CHORUS
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '663b4d9a-69e0-4e62-a14e-ec7ba1059987'::uuid, 'seregelawochih-yeesat-nachew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- deacon-begna-girma ("‛ ’ Deacon Begna Girma")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '76416526-f21c-4415-b605-6fc470bb9372'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 1
ሰላሜ ባንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 2
ጨለማዬ ባንተ በራልኝ
ከሰው ትከሻ ወረድኩኝ
የምመራበት ዱላዬ
ባንተ ተጥሏል ጌታዬ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 3
አሁን በግላጭ አያለሁ
ሙሉ ሰው ባንተ ሆኛለሁ
ጨለማዬ ባንተ በራልኝ
ከሰው ትከሻ ወረድኩኝ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 4
የምመራበት ዱላዬ
ባንተ ተጥሏል ጌታዬ
አሁን በግላጭ አያለሁ
ሙሉ ሰው ባንተ ሆኛለሁ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 5
የመውገሪያው ድንጋይ ቀረልኝ
ጠላቴ በፊቴ አፈረልኝ
በፊትህ አቆምከኝ በጸጋህ
ገዝተኸኛልና በዋጋ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 6
ለውለታህማ ምን እላለሁ
ተመስገን ብዬ አልፈዋለሁ
የመውገሪያው ድንጋይ ቀረልኝ
ጠላቴ በፊቴ አፈረልኝ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 7
በፊትህ አቆምከኝ በጸጋህ
ገዝተኸኛልና በዋጋ
ለውለታህማ ምን እላለሁ
ተመስገን ብዬ አልፈዋለሁ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 8
ሰላላው እጄን አቅንተሃል
ሽባነቴንም ተርትረሃል
ደካማነቴ ተወገደ
ያ ክፉ መንፈስ ተሰደደ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 9
ታውጆልኛል ነፃነቴ
አመልክሃለሁ በሕይወቴ
ሰላላው እጄን አቅንተሃል
ሽባነቴንም ተርትረሃል

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 10
ደካማነቴ ተወገደ
ያ ክፉ መንፈስ ተሰደደ
ታውጆልኛል ነፃነቴ
አመልክሃለሁ በሕይወቴ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 11
የአይኔ ላይ ቅርፊት ወለቀ
ሸክሙም ከላዬ ወደቀ
በደማሰቆ ብርሃን መታኸኝ
የራስህ ምርጥ ዕቃ አረግከኝ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 12
ያ ከንቱ ድካሜ አለፈ
ልቤ ለፍቅርህ ተሸነፈ
የአይኔ ላይ ቅርፊት ወለቀ
ሸክሙም ከላዬ ወደቀ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 13
በደማሰቆ ብርሃን መታኸኝ
የራስህ ምርጥ ዕቃ አረግከኝ
ያ ከንቱ ድካሜ አለፈ
ልቤ ለፍቅርህ ተሸነፈ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 1
Selame bante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 2
Ch’elemaye bante beralgn
Kesew tikesha weredkugn
Yemmerabet dulaye
Bante tet’lwal Getaye

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 3
Ahun beglach’ ayalehu
Mulu sew bante hognalehu
Ch’elemaye bante beralgn
Kesew tikesha weredkugn

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 4
Yemmerabet dulaye
Bante tet’lwal Getaye
Ahun beglach’ ayalehu
Mulu sew bante hognalehu

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 5
Yemewgeriyaw dingay qerelgn
T’elate befite aferelgn
Befith aqomkegn bets’egah
Gezteኸgnalna bewaga

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 6
Lewletahma min elalehu
Temesgen biye alfewalehu
Yemewgeriyaw dingay qerelgn
T’elate befite aferelgn

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 7
Befith aqomkegn bets’egah
Gezteኸgnalna bewaga
Lewletahma min elalehu
Temesgen biye alfewalehu

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 8
Selalaw ejen aqntehal
Shbanetenm tertrehal
Dekamanete tewegede
Ya kifu menfes tesedede

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 9
Tawjolgnal nets’anete
Amelkhalehu behywete
Selalaw ejen aqntehal
Shbanetenm tertrehal

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 10
Dekamanete tewegede
Ya kifu menfes tesedede
Tawjolgnal nets’anete
Amelkhalehu behywete

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 11
Yeayne lay qirfit weleqe
Shekmum kelaye wedeqe
Bedemaseqo birhan metaኸgn
Yerash mirt’ eqa aregkegn

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 12
Ya kentu dikame alefe
Libe lefqrh teshenefe
Yeayne lay qirfit weleqe
Shekmum kelaye wedeqe

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 13
Bedemaseqo birhan metaኸgn
Yerash mirt’ eqa aregkegn
Ya kentu dikame alefe
Libe lefqrh teshenefe

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 1
ሰላሜ ባንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 2
ጨለማዬ ባንተ በራልኝ
ከሰው ትከሻ ወረድኩኝ
የምመራበት ዱላዬ
ባንተ ተጥሏል ጌታዬ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 3
አሁን በግላጭ አያለሁ
ሙሉ ሰው ባንተ ሆኛለሁ
ጨለማዬ ባንተ በራልኝ
ከሰው ትከሻ ወረድኩኝ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 4
የምመራበት ዱላዬ
ባንተ ተጥሏል ጌታዬ
አሁን በግላጭ አያለሁ
ሙሉ ሰው ባንተ ሆኛለሁ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 5
የመውገሪያው ድንጋይ ቀረልኝ
ጠላቴ በፊቴ አፈረልኝ
በፊትህ አቆምከኝ በጸጋህ
ገዝተኸኛልና በዋጋ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 6
ለውለታህማ ምን እላለሁ
ተመስገን ብዬ አልፈዋለሁ
የመውገሪያው ድንጋይ ቀረልኝ
ጠላቴ በፊቴ አፈረልኝ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 7
በፊትህ አቆምከኝ በጸጋህ
ገዝተኸኛልና በዋጋ
ለውለታህማ ምን እላለሁ
ተመስገን ብዬ አልፈዋለሁ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 8
ሰላላው እጄን አቅንተሃል
ሽባነቴንም ተርትረሃል
ደካማነቴ ተወገደ
ያ ክፉ መንፈስ ተሰደደ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 9
ታውጆልኛል ነፃነቴ
አመልክሃለሁ በሕይወቴ
ሰላላው እጄን አቅንተሃል
ሽባነቴንም ተርትረሃል

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 10
ደካማነቴ ተወገደ
ያ ክፉ መንፈስ ተሰደደ
ታውጆልኛል ነፃነቴ
አመልክሃለሁ በሕይወቴ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 11
የአይኔ ላይ ቅርፊት ወለቀ
ሸክሙም ከላዬ ወደቀ
በደማሰቆ ብርሃን መታኸኝ
የራስህ ምርጥ ዕቃ አረግከኝ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 12
ያ ከንቱ ድካሜ አለፈ
ልቤ ለፍቅርህ ተሸነፈ
የአይኔ ላይ ቅርፊት ወለቀ
ሸክሙም ከላዬ ወደቀ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 13
በደማሰቆ ብርሃን መታኸኝ
የራስህ ምርጥ ዕቃ አረግከኝ
ያ ከንቱ ድካሜ አለፈ
ልቤ ለፍቅርህ ተሸነፈ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ',
        lyrics_transliteration = 'CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 1
Selame bante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 2
Ch’elemaye bante beralgn
Kesew tikesha weredkugn
Yemmerabet dulaye
Bante tet’lwal Getaye

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 3
Ahun beglach’ ayalehu
Mulu sew bante hognalehu
Ch’elemaye bante beralgn
Kesew tikesha weredkugn

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 4
Yemmerabet dulaye
Bante tet’lwal Getaye
Ahun beglach’ ayalehu
Mulu sew bante hognalehu

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 5
Yemewgeriyaw dingay qerelgn
T’elate befite aferelgn
Befith aqomkegn bets’egah
Gezteኸgnalna bewaga

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 6
Lewletahma min elalehu
Temesgen biye alfewalehu
Yemewgeriyaw dingay qerelgn
T’elate befite aferelgn

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 7
Befith aqomkegn bets’egah
Gezteኸgnalna bewaga
Lewletahma min elalehu
Temesgen biye alfewalehu

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 8
Selalaw ejen aqntehal
Shbanetenm tertrehal
Dekamanete tewegede
Ya kifu menfes tesedede

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 9
Tawjolgnal nets’anete
Amelkhalehu behywete
Selalaw ejen aqntehal
Shbanetenm tertrehal

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 10
Dekamanete tewegede
Ya kifu menfes tesedede
Tawjolgnal nets’anete
Amelkhalehu behywete

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 11
Yeayne lay qirfit weleqe
Shekmum kelaye wedeqe
Bedemaseqo birhan metaኸgn
Yerash mirt’ eqa aregkegn

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 12
Ya kentu dikame alefe
Libe lefqrh teshenefe
Yeayne lay qirfit weleqe
Shekmum kelaye wedeqe

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 13
Bedemaseqo birhan metaኸgn
Yerash mirt’ eqa aregkegn
Ya kentu dikame alefe
Libe lefqrh teshenefe

CHORUS
Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '76416526-f21c-4415-b605-6fc470bb9372'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 1
ሰላሜ ባንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 2
ጨለማዬ ባንተ በራልኝ
ከሰው ትከሻ ወረድኩኝ
የምመራበት ዱላዬ
ባንተ ተጥሏል ጌታዬ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 3
አሁን በግላጭ አያለሁ
ሙሉ ሰው ባንተ ሆኛለሁ
ጨለማዬ ባንተ በራልኝ
ከሰው ትከሻ ወረድኩኝ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 4
የምመራበት ዱላዬ
ባንተ ተጥሏል ጌታዬ
አሁን በግላጭ አያለሁ
ሙሉ ሰው ባንተ ሆኛለሁ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 5
የመውገሪያው ድንጋይ ቀረልኝ
ጠላቴ በፊቴ አፈረልኝ
በፊትህ አቆምከኝ በጸጋህ
ገዝተኸኛልና በዋጋ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 6
ለውለታህማ ምን እላለሁ
ተመስገን ብዬ አልፈዋለሁ
የመውገሪያው ድንጋይ ቀረልኝ
ጠላቴ በፊቴ አፈረልኝ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 7
በፊትህ አቆምከኝ በጸጋህ
ገዝተኸኛልና በዋጋ
ለውለታህማ ምን እላለሁ
ተመስገን ብዬ አልፈዋለሁ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 8
ሰላላው እጄን አቅንተሃል
ሽባነቴንም ተርትረሃል
ደካማነቴ ተወገደ
ያ ክፉ መንፈስ ተሰደደ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 9
ታውጆልኛል ነፃነቴ
አመልክሃለሁ በሕይወቴ
ሰላላው እጄን አቅንተሃል
ሽባነቴንም ተርትረሃል

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 10
ደካማነቴ ተወገደ
ያ ክፉ መንፈስ ተሰደደ
ታውጆልኛል ነፃነቴ
አመልክሃለሁ በሕይወቴ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 11
የአይኔ ላይ ቅርፊት ወለቀ
ሸክሙም ከላዬ ወደቀ
በደማሰቆ ብርሃን መታኸኝ
የራስህ ምርጥ ዕቃ አረግከኝ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 12
ያ ከንቱ ድካሜ አለፈ
ልቤ ለፍቅርህ ተሸነፈ
የአይኔ ላይ ቅርፊት ወለቀ
ሸክሙም ከላዬ ወደቀ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 13
በደማሰቆ ብርሃን መታኸኝ
የራስህ ምርጥ ዕቃ አረግከኝ
ያ ከንቱ ድካሜ አለፈ
ልቤ ለፍቅርህ ተሸነፈ

CHORUS
ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '76416526-f21c-4415-b605-6fc470bb9372'::uuid, 'deacon-begna-girma', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kenitu-negn ("Kenitu Negn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5ecef425-a86f-41ba-bb43-8a8e95d8356a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 1
አምላኬ ብቻ ነው የሚያስተማምነኝ
እኔ ንጉሥ ነበርኩ በክብር ያጌጥኩኝ
ሁሉን በምድር ላይ በጥበብ ፈፀምኩኝ
የዚህ ዓለም ደስታ ምንም አላዋጣኝ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 2
በመጨረሻው ቀን በሞት ተወሰድኩኝ/2/
ከፀሐይቱ በታች አዲስ ነገር የለም
ሰዎች ይደክማሉ እስከ ዘለዓለም
ጥበቡን ፍለጋ ደክሜ ነበረ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 3
ሁሉም ከንቱ ሆኖ በመቃብር ቀረ/2/
ከእኔ አስቀድመዉ የከበሩ ሁሉ
አፈር ተጭኗቸዉ የከበሩ ሁሉ
እብደትና እዉቀት ሁሉን አወቅኳችሁ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 4
ምንም ቋሚ የለም ሁሉም ከንቱ ናቸዉ/2/
ልቤን የሰተሁት ተስፋ የጣልኩበት
አልጨበጥ ብሎኝ አለሁኝ በጭንቀት
የጥበቡም ብዛት ለትካዜ ሰተኝ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 5
እኔ በዚህ ምድር እጅግ ጐስቋላ ነኝ/2/
ልቤንም ፈተንኩት በደስታ በዛት
የዚህን አለም ለውጥ ጣውት አቀመስኩት
ሳቅም በልቤ ዉስጥ ይፍለቀለቅ ነበር

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 6
ሁሉም ከንቱ ሆነ ገብቶ ከመቃበር/2/

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 1
Amlake bicha new yemiyastemamnegn
Ene nigus neberku bekbr yaget’kugn
Hulun bemdr lay bet’beb fets’emkugn
Yezih alem desta minm alawat’agn

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 2
Bemech’ereshaw qen bemot tewesedkugn (2)
Kets’eheytu betach adis neger yelem
Sewoch yidekmalu eske zelealem
T’bebun filega dekme nebere

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 3
Hulum kentu hono bemeqabr qere (2)
Keene asqedmewu yekeberu hulu
Afer tech’nwachewu yekeberu hulu
Ebdetna ewuqet hulun aweqkwachhu

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 4
Minm qwami yelem hulum kentu nachewu (2)
Liben yesetehut tesfa yet’alkubet
Alch’ebet’ bilogn alehugn bech’nqet
Yet’bebum bizat letkaze setegn

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 5
Ene bezih midr ejg gwesqwala negn (2)
Libenm fetenkut bedesta bezat
Yezihn alem lewt’ t’awt aqemeskut
Saqm belbe wust’ yifleqeleq neber

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 6
Hulum kentu hone gebto kemeqaber (2)

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 1
አምላኬ ብቻ ነው የሚያስተማምነኝ
እኔ ንጉሥ ነበርኩ በክብር ያጌጥኩኝ
ሁሉን በምድር ላይ በጥበብ ፈፀምኩኝ
የዚህ ዓለም ደስታ ምንም አላዋጣኝ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 2
በመጨረሻው ቀን በሞት ተወሰድኩኝ/2/
ከፀሐይቱ በታች አዲስ ነገር የለም
ሰዎች ይደክማሉ እስከ ዘለዓለም
ጥበቡን ፍለጋ ደክሜ ነበረ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 3
ሁሉም ከንቱ ሆኖ በመቃብር ቀረ/2/
ከእኔ አስቀድመዉ የከበሩ ሁሉ
አፈር ተጭኗቸዉ የከበሩ ሁሉ
እብደትና እዉቀት ሁሉን አወቅኳችሁ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 4
ምንም ቋሚ የለም ሁሉም ከንቱ ናቸዉ/2/
ልቤን የሰተሁት ተስፋ የጣልኩበት
አልጨበጥ ብሎኝ አለሁኝ በጭንቀት
የጥበቡም ብዛት ለትካዜ ሰተኝ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 5
እኔ በዚህ ምድር እጅግ ጐስቋላ ነኝ/2/
ልቤንም ፈተንኩት በደስታ በዛት
የዚህን አለም ለውጥ ጣውት አቀመስኩት
ሳቅም በልቤ ዉስጥ ይፍለቀለቅ ነበር

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 6
ሁሉም ከንቱ ሆነ ገብቶ ከመቃበር/2/

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ',
        lyrics_transliteration = 'CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 1
Amlake bicha new yemiyastemamnegn
Ene nigus neberku bekbr yaget’kugn
Hulun bemdr lay bet’beb fets’emkugn
Yezih alem desta minm alawat’agn

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 2
Bemech’ereshaw qen bemot tewesedkugn (2)
Kets’eheytu betach adis neger yelem
Sewoch yidekmalu eske zelealem
T’bebun filega dekme nebere

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 3
Hulum kentu hono bemeqabr qere (2)
Keene asqedmewu yekeberu hulu
Afer tech’nwachewu yekeberu hulu
Ebdetna ewuqet hulun aweqkwachhu

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 4
Minm qwami yelem hulum kentu nachewu (2)
Liben yesetehut tesfa yet’alkubet
Alch’ebet’ bilogn alehugn bech’nqet
Yet’bebum bizat letkaze setegn

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 5
Ene bezih midr ejg gwesqwala negn (2)
Libenm fetenkut bedesta bezat
Yezihn alem lewt’ t’awt aqemeskut
Saqm belbe wust’ yifleqeleq neber

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 6
Hulum kentu hone gebto kemeqaber (2)

CHORUS
Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5ecef425-a86f-41ba-bb43-8a8e95d8356a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 1
አምላኬ ብቻ ነው የሚያስተማምነኝ
እኔ ንጉሥ ነበርኩ በክብር ያጌጥኩኝ
ሁሉን በምድር ላይ በጥበብ ፈፀምኩኝ
የዚህ ዓለም ደስታ ምንም አላዋጣኝ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 2
በመጨረሻው ቀን በሞት ተወሰድኩኝ/2/
ከፀሐይቱ በታች አዲስ ነገር የለም
ሰዎች ይደክማሉ እስከ ዘለዓለም
ጥበቡን ፍለጋ ደክሜ ነበረ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 3
ሁሉም ከንቱ ሆኖ በመቃብር ቀረ/2/
ከእኔ አስቀድመዉ የከበሩ ሁሉ
አፈር ተጭኗቸዉ የከበሩ ሁሉ
እብደትና እዉቀት ሁሉን አወቅኳችሁ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 4
ምንም ቋሚ የለም ሁሉም ከንቱ ናቸዉ/2/
ልቤን የሰተሁት ተስፋ የጣልኩበት
አልጨበጥ ብሎኝ አለሁኝ በጭንቀት
የጥበቡም ብዛት ለትካዜ ሰተኝ

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 5
እኔ በዚህ ምድር እጅግ ጐስቋላ ነኝ/2/
ልቤንም ፈተንኩት በደስታ በዛት
የዚህን አለም ለውጥ ጣውት አቀመስኩት
ሳቅም በልቤ ዉስጥ ይፍለቀለቅ ነበር

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 6
ሁሉም ከንቱ ሆነ ገብቶ ከመቃበር/2/

CHORUS
ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5ecef425-a86f-41ba-bb43-8a8e95d8356a'::uuid, 'kenitu-negn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeabewin-risit-anisetim ("Yeabewin Risit Anisetim")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '60deda86-eb8f-4739-968b-f4a04830e8a7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 1
ያ ኢይዝራኤላዊ ናቡቴ በሰማርያ
የወይኑ ፋሬ ናት የማንነቱ መለያ
አክአብ ድንበርተኛው በወይኗ ጎምጅቶ
ነቃቅሎ ሊጥላት ሊያጠፋት ሽቶ

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 2
ያቺን መልካም እርሻ ባድማ ሊያደርጋት
ሊገዛት ወደደ በጥፍ ሊለውጣት
ተኩላው ለምድ ለብሶ ገብቶ ከበረትሽ
አድብቶ ቢሰራ እንዲፈርስ ስርዓትሽ

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 3
በሃይማኖት ቆመን ድል እንነሳዋለን
በርትዕት ተዋህዶ የኖሩትን ይዘን
ጠላት ቢከፋብን ያለ በደላችን
በብዙ መከራ ቢከበብ ዙሪያችን

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 4
በእመብርሃን ምልጃ ሁሉን እናልፋለን
በእግዚአብሔር ቸርነት በርስት እንኖራለን
ዛሬም በእኛ ዘመን አክአብ ተነስቷል
ርስት ድንበራችን ቀን በቀን ይገፋል

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 5
እኛም ናቡቴ ነን ሰማዕት እንሆናለን
የተዋህዶን ርስት እናስከብራለን

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 1
Ya iyzraelawi nabute besemarya
Yeweynu fare nat yemannetu meleya
Akab dinbertegnaw beweynwa gomjto
Neqaqlo lit’lat liyat’efat shto

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 2
Yachin melkam ersha badma liyadergat
Ligezat wedede bet’f lilewt’at
Tekulaw lemd lebso gebto keberetsh
Adbto bisera endifers siratsh

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 3
Behaymanot qomen dil ennesawalen
Bertet Tewahedo yenorutn yizen
T’elat bikefabn yale bedelachn
Bebzu mekera bikebeb zuriyachn

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 4
Beemebrhan milja hulun enalfalen
BeEgziabher chernet berst ennoralen
Zarem beegna zemen akab tenestwal
Rist dinberachn qen beqen yigefal

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 5
Egnam nabute nen semaet enhonalen
Yetewahdon rist enaskebralen

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 1
ያ ኢይዝራኤላዊ ናቡቴ በሰማርያ
የወይኑ ፋሬ ናት የማንነቱ መለያ
አክአብ ድንበርተኛው በወይኗ ጎምጅቶ
ነቃቅሎ ሊጥላት ሊያጠፋት ሽቶ

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 2
ያቺን መልካም እርሻ ባድማ ሊያደርጋት
ሊገዛት ወደደ በጥፍ ሊለውጣት
ተኩላው ለምድ ለብሶ ገብቶ ከበረትሽ
አድብቶ ቢሰራ እንዲፈርስ ስርዓትሽ

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 3
በሃይማኖት ቆመን ድል እንነሳዋለን
በርትዕት ተዋህዶ የኖሩትን ይዘን
ጠላት ቢከፋብን ያለ በደላችን
በብዙ መከራ ቢከበብ ዙሪያችን

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 4
በእመብርሃን ምልጃ ሁሉን እናልፋለን
በእግዚአብሔር ቸርነት በርስት እንኖራለን
ዛሬም በእኛ ዘመን አክአብ ተነስቷል
ርስት ድንበራችን ቀን በቀን ይገፋል

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 5
እኛም ናቡቴ ነን ሰማዕት እንሆናለን
የተዋህዶን ርስት እናስከብራለን

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን',
        lyrics_transliteration = 'CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 1
Ya iyzraelawi nabute besemarya
Yeweynu fare nat yemannetu meleya
Akab dinbertegnaw beweynwa gomjto
Neqaqlo lit’lat liyat’efat shto

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 2
Yachin melkam ersha badma liyadergat
Ligezat wedede bet’f lilewt’at
Tekulaw lemd lebso gebto keberetsh
Adbto bisera endifers siratsh

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 3
Behaymanot qomen dil ennesawalen
Bertet Tewahedo yenorutn yizen
T’elat bikefabn yale bedelachn
Bebzu mekera bikebeb zuriyachn

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 4
Beemebrhan milja hulun enalfalen
BeEgziabher chernet berst ennoralen
Zarem beegna zemen akab tenestwal
Rist dinberachn qen beqen yigefal

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 5
Egnam nabute nen semaet enhonalen
Yetewahdon rist enaskebralen

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '60deda86-eb8f-4739-968b-f4a04830e8a7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 1
ያ ኢይዝራኤላዊ ናቡቴ በሰማርያ
የወይኑ ፋሬ ናት የማንነቱ መለያ
አክአብ ድንበርተኛው በወይኗ ጎምጅቶ
ነቃቅሎ ሊጥላት ሊያጠፋት ሽቶ

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 2
ያቺን መልካም እርሻ ባድማ ሊያደርጋት
ሊገዛት ወደደ በጥፍ ሊለውጣት
ተኩላው ለምድ ለብሶ ገብቶ ከበረትሽ
አድብቶ ቢሰራ እንዲፈርስ ስርዓትሽ

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 3
በሃይማኖት ቆመን ድል እንነሳዋለን
በርትዕት ተዋህዶ የኖሩትን ይዘን
ጠላት ቢከፋብን ያለ በደላችን
በብዙ መከራ ቢከበብ ዙሪያችን

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 4
በእመብርሃን ምልጃ ሁሉን እናልፋለን
በእግዚአብሔር ቸርነት በርስት እንኖራለን
ዛሬም በእኛ ዘመን አክአብ ተነስቷል
ርስት ድንበራችን ቀን በቀን ይገፋል

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 5
እኛም ናቡቴ ነን ሰማዕት እንሆናለን
የተዋህዶን ርስት እናስከብራለን

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '60deda86-eb8f-4739-968b-f4a04830e8a7'::uuid, 'yeabewin-risit-anisetim', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lamesiginih-yeene-geta ("Lamesiginih Yeene Geta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7003ec48-ebbe-441d-9bbd-73789ece1079'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 1
ከእኔ የሆነ የምሰጥህ ባይኖረኝም
ከሰጠኸኝ ያንተን መስጠት አይከብደኝም
ጥበቤ ነህ የምስጋና መሠረቴ
ዝማሬዬን ያፈሰስከው በሕይወቴ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 2
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
ባዶ እኮ ነኝ የእኔ ጌታ ምን ልቅዳልህ
በእጄ ላይ አንዳች የለኝ የምሰጥህ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 3
ላንተ ክብር የሚመጥን ሕይወት የለኝ
ዝማሬዬን በቸርነት ተቀበለኝ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 4
ከምድር ላይ ከአፈርህ ስትፈጥረኝ
ከምስጋና የተለየ ምን ሥራ አለኝ
ቀንና ሌት በመቅደስህ እቆማለሁ
አምላኬ ሆይ ሳወድስህ እኖራለሁ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 5
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
እዝራ ስጠኝ የከበረ መሰንቆህን
ዳዊት ስጠኝ የሚፈውስ በገናህን

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 6
መዝሙር ቅኔ ተምሬአለሁ ከአባቶቼ
ዘምራለሁ ባንተ ፍቅር ተነክቼ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 1
Keene yehone yemset’h baynoregnm
Keset’eኸgn yanten mest’et aykebdegnm
T’bebe neh yemsgana meserete
Zimareyen yafeseskew behywete

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 2
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)
Bado eko negn yeene Geta min liqdalh
Beeje lay andach yelegn yemset’h

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 3
Lante kibir yemimet’n hiywet yelegn
Zimareyen bechernet teqebelegn
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 4
Kemdr lay keaferh sitfet’regn
Kemsgana yeteleye min sira alegn
Qenna let bemeqdesh eqomalehu
Amlake hoy sawedsh enoralehu

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 5
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)
Ezra sit’egn yekebere mesenqohn
Dawit sit’egn yemifews begenahn

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 6
Mezmur qine temrealehu keabatoche
Zemralehu bante fiqr tenekche
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 1
ከእኔ የሆነ የምሰጥህ ባይኖረኝም
ከሰጠኸኝ ያንተን መስጠት አይከብደኝም
ጥበቤ ነህ የምስጋና መሠረቴ
ዝማሬዬን ያፈሰስከው በሕይወቴ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 2
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
ባዶ እኮ ነኝ የእኔ ጌታ ምን ልቅዳልህ
በእጄ ላይ አንዳች የለኝ የምሰጥህ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 3
ላንተ ክብር የሚመጥን ሕይወት የለኝ
ዝማሬዬን በቸርነት ተቀበለኝ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 4
ከምድር ላይ ከአፈርህ ስትፈጥረኝ
ከምስጋና የተለየ ምን ሥራ አለኝ
ቀንና ሌት በመቅደስህ እቆማለሁ
አምላኬ ሆይ ሳወድስህ እኖራለሁ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 5
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
እዝራ ስጠኝ የከበረ መሰንቆህን
ዳዊት ስጠኝ የሚፈውስ በገናህን

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 6
መዝሙር ቅኔ ተምሬአለሁ ከአባቶቼ
ዘምራለሁ ባንተ ፍቅር ተነክቼ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/',
        lyrics_transliteration = 'CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 1
Keene yehone yemset’h baynoregnm
Keset’eኸgn yanten mest’et aykebdegnm
T’bebe neh yemsgana meserete
Zimareyen yafeseskew behywete

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 2
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)
Bado eko negn yeene Geta min liqdalh
Beeje lay andach yelegn yemset’h

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 3
Lante kibir yemimet’n hiywet yelegn
Zimareyen bechernet teqebelegn
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 4
Kemdr lay keaferh sitfet’regn
Kemsgana yeteleye min sira alegn
Qenna let bemeqdesh eqomalehu
Amlake hoy sawedsh enoralehu

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 5
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)
Ezra sit’egn yekebere mesenqohn
Dawit sit’egn yemifews begenahn

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 6
Mezmur qine temrealehu keabatoche
Zemralehu bante fiqr tenekche
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7003ec48-ebbe-441d-9bbd-73789ece1079'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 1
ከእኔ የሆነ የምሰጥህ ባይኖረኝም
ከሰጠኸኝ ያንተን መስጠት አይከብደኝም
ጥበቤ ነህ የምስጋና መሠረቴ
ዝማሬዬን ያፈሰስከው በሕይወቴ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 2
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
ባዶ እኮ ነኝ የእኔ ጌታ ምን ልቅዳልህ
በእጄ ላይ አንዳች የለኝ የምሰጥህ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 3
ላንተ ክብር የሚመጥን ሕይወት የለኝ
ዝማሬዬን በቸርነት ተቀበለኝ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 4
ከምድር ላይ ከአፈርህ ስትፈጥረኝ
ከምስጋና የተለየ ምን ሥራ አለኝ
ቀንና ሌት በመቅደስህ እቆማለሁ
አምላኬ ሆይ ሳወድስህ እኖራለሁ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 5
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
እዝራ ስጠኝ የከበረ መሰንቆህን
ዳዊት ስጠኝ የሚፈውስ በገናህን

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 6
መዝሙር ቅኔ ተምሬአለሁ ከአባቶቼ
ዘምራለሁ ባንተ ፍቅር ተነክቼ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7003ec48-ebbe-441d-9bbd-73789ece1079'::uuid, 'lamesiginih-yeene-geta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eyuna-emenu-sewoch ("Eyuna Emenu Sewoch")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5d061665-9bf2-458d-94b3-dbac721c6756'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 1
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 2
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 3
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 4
መላዕክቱ ነጭ ለብሰው ፣ምስራቹን አበሰሩ

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 5
ተነስቷል እየሱስ ብለው፣ ለዓለም እንዲናገሩ(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 6
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 7
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 8
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 9
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፬)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 1
yesus bekule lelit behaylu motn dl nesl()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 2
llta lezih ygebal grgrta lezih ygebal

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 3
yemot hayl tewarl zare siolm temeseqaql()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 4
melaktu nech lebsew msrachun ebeseru

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 5
tenesl yesus blew lealem ndinageru()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 6
yuna menu swoch dngayu tefeneqaql

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 7
yesus bekule lelit behaylu motn dl nesl()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 8
llta lezih ygebal grgrta lezih ygebal

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 9
yemot hayl tewarl zare siolm temeseqaql()

CHORUS
yuna menu swoch dngayu tefeneqaql'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 1
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 2
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 3
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 4
መላዕክቱ ነጭ ለብሰው ፣ምስራቹን አበሰሩ

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 5
ተነስቷል እየሱስ ብለው፣ ለዓለም እንዲናገሩ(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 6
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 7
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 8
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 9
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፬)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል',
        lyrics_transliteration = 'CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 1
yesus bekule lelit behaylu motn dl nesl()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 2
llta lezih ygebal grgrta lezih ygebal

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 3
yemot hayl tewarl zare siolm temeseqaql()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 4
melaktu nech lebsew msrachun ebeseru

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 5
tenesl yesus blew lealem ndinageru()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 6
yuna menu swoch dngayu tefeneqaql

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 7
yesus bekule lelit behaylu motn dl nesl()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 8
llta lezih ygebal grgrta lezih ygebal

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 9
yemot hayl tewarl zare siolm temeseqaql()

CHORUS
yuna menu swoch dngayu tefeneqaql',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5d061665-9bf2-458d-94b3-dbac721c6756'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 1
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 2
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 3
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 4
መላዕክቱ ነጭ ለብሰው ፣ምስራቹን አበሰሩ

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 5
ተነስቷል እየሱስ ብለው፣ ለዓለም እንዲናገሩ(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 6
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 7
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 8
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 9
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፬)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 1
yesus bekule lelit behaylu motn dl nesl()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 2
llta lezih ygebal grgrta lezih ygebal

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 3
yemot hayl tewarl zare siolm temeseqaql()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 4
melaktu nech lebsew msrachun ebeseru

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 5
tenesl yesus blew lealem ndinageru()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 6
yuna menu swoch dngayu tefeneqaql

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 7
yesus bekule lelit behaylu motn dl nesl()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 8
llta lezih ygebal grgrta lezih ygebal

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 9
yemot hayl tewarl zare siolm temeseqaql()

CHORUS
yuna menu swoch dngayu tefeneqaql';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5d061665-9bf2-458d-94b3-dbac721c6756'::uuid, 'eyuna-emenu-sewoch', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nu-ena-bezemari-besufikad-anidarigachew ("Nu Ena ... Bezemari Besufikad Anidarigachew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5f9c873e-8e10-4667-8405-b911351756d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 1
አየ አሸተተ ከሰማያት ሆኖ
አምላክ የሚያድርበት ንጹህ ሰው ፈልጎ
ከፍጥረቱ ሁሉ አገኘ ድንግልን
ክብር ለምትሆን ዘምር ለእናታችን

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 2
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ
ሰላምታዋ ፅንስን ያዘልላልና

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 3
እንዴት ዝም እላለሁ ናትና ገናና
ማለፊያ የልቤ መዝገያ ለችግሬ
መቼ እጠግብና ለእናቴ ዘምሬ
እናቴ ማርያም ክብሬ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 4
ልስጥሽ ለስምሽ ዝማሬ
አዝ
እንቁም ለእናታችን ወገኔ ተነሳ
በፀጋ እንክበር እጃችን ይነሳ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 5
ፍቅሯን የቀመሰ መቼ ይጠግብና
ከልቡ ይዘምራል ብሩክት ናትና
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 6
አዝ
ባታመስግናት ምስጉን ናት እናቱ
እረፍት እንድታገኝ ዘምር ለንግስቱ
በምጥ ስትሰቃይ ደርሳላት በክብር

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 7
ልጅ የያዘች እናት ታየች ስትዘምር
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 8
የእመቤታችን ሁሉ ክብሯ እኮ ነው
ትውልዱ ያመስግን ለእናቱ ለጌታው
ፀጋን የተመላሽ ይበል በደስታ
እልልታው ይስማ ከብሮም ይመታ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 9
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 1
Aye ashetete kesemayat hono
Amlak yemiyadrbet nits’uh sew felgo
Keft’retu hulu agegne dingln
Kibir lemthon zemr leenatachn

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 2
Enate Maryam kibre
List’sh lesmsh zimare
CHORUS
Selamtawa ts’nsn yazellalna

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 3
Endet zim elalehu natna genana
Malefiya yelbe mezgeya lechgre
Meche et’egbna leenate zemre
Enate Maryam kibre

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 4
List’sh lesmsh zimare
CHORUS
Enqum leenatachn wegene tenesa
Bets’ega enkber ejachn yinesa

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 5
Fiqrwan yeqemese meche yit’egbna
Kelbu yizemral birukt natna
Enate Maryam kibre
List’sh lesmsh zimare

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 6
CHORUS
Batamesgnat misgun nat enatu
Ereft endtagegn zemr lengstu
Bemt’ sitseqay dersalat bekbr

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 7
Lij yeyazech enat tayech sitzemr
Enate Maryam kibre
List’sh lesmsh zimare
CHORUS

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 8
Yeemebetachn hulu kibrwa eko new
Tiwldu yamesgn leenatu legetaw
Ts’egan yetemelash yibel bedesta
Elltaw yisma kebrom yimeta

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 9
Enate Maryam kibre
List’sh lesmsh zimare
CHORUS

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 1
አየ አሸተተ ከሰማያት ሆኖ
አምላክ የሚያድርበት ንጹህ ሰው ፈልጎ
ከፍጥረቱ ሁሉ አገኘ ድንግልን
ክብር ለምትሆን ዘምር ለእናታችን

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 2
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ
ሰላምታዋ ፅንስን ያዘልላልና

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 3
እንዴት ዝም እላለሁ ናትና ገናና
ማለፊያ የልቤ መዝገያ ለችግሬ
መቼ እጠግብና ለእናቴ ዘምሬ
እናቴ ማርያም ክብሬ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 4
ልስጥሽ ለስምሽ ዝማሬ
አዝ
እንቁም ለእናታችን ወገኔ ተነሳ
በፀጋ እንክበር እጃችን ይነሳ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 5
ፍቅሯን የቀመሰ መቼ ይጠግብና
ከልቡ ይዘምራል ብሩክት ናትና
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 6
አዝ
ባታመስግናት ምስጉን ናት እናቱ
እረፍት እንድታገኝ ዘምር ለንግስቱ
በምጥ ስትሰቃይ ደርሳላት በክብር

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 7
ልጅ የያዘች እናት ታየች ስትዘምር
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 8
የእመቤታችን ሁሉ ክብሯ እኮ ነው
ትውልዱ ያመስግን ለእናቱ ለጌታው
ፀጋን የተመላሽ ይበል በደስታ
እልልታው ይስማ ከብሮም ይመታ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 9
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ',
        lyrics_transliteration = 'CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 1
Aye ashetete kesemayat hono
Amlak yemiyadrbet nits’uh sew felgo
Keft’retu hulu agegne dingln
Kibir lemthon zemr leenatachn

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 2
Enate Maryam kibre
List’sh lesmsh zimare
CHORUS
Selamtawa ts’nsn yazellalna

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 3
Endet zim elalehu natna genana
Malefiya yelbe mezgeya lechgre
Meche et’egbna leenate zemre
Enate Maryam kibre

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 4
List’sh lesmsh zimare
CHORUS
Enqum leenatachn wegene tenesa
Bets’ega enkber ejachn yinesa

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 5
Fiqrwan yeqemese meche yit’egbna
Kelbu yizemral birukt natna
Enate Maryam kibre
List’sh lesmsh zimare

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 6
CHORUS
Batamesgnat misgun nat enatu
Ereft endtagegn zemr lengstu
Bemt’ sitseqay dersalat bekbr

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 7
Lij yeyazech enat tayech sitzemr
Enate Maryam kibre
List’sh lesmsh zimare
CHORUS

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 8
Yeemebetachn hulu kibrwa eko new
Tiwldu yamesgn leenatu legetaw
Ts’egan yetemelash yibel bedesta
Elltaw yisma kebrom yimeta

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 9
Enate Maryam kibre
List’sh lesmsh zimare
CHORUS

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5f9c873e-8e10-4667-8405-b911351756d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ
አየ አሸተተ ከሰማያት ሆኖ
አምላክ የሚያድርበት ንጹህ ሰው ፈልጎ
ከፍጥረቱ ሁሉ አገኘ ድንግልን
ክብር ለምትሆን ዘምር ለእናታችን
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
ሰላምታዋ ፅንስን ያዘልላልና
እንዴት ዝም እላለሁ ናትና ገናና
ማለፊያ የልቤ መዝገያ ለችግሬ
መቼ እጠግብና ለእናቴ ዘምሬ
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
እንቁም ለእናታችን ወገኔ ተነሳ
በፀጋ እንክበር እጃችን ይነሳ
ፍቅሯን የቀመሰ መቼ ይጠግብና
ከልቡ ይዘምራል ብሩክት ናትና
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
ባታመስግናት ምስጉን ናት እናቱ
እረፍት እንድታገኝ ዘምር ለንግስቱ
በምጥ ስትሰቃይ ደርሳላት በክብር
ልጅ የያዘች እናት ታየች ስትዘምር
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
የእመቤታችን ሁሉ ክብሯ እኮ ነው
ትውልዱ ያመስግን ለእናቱ ለጌታው
ፀጋን የተመላሽ ይበል በደስታ
እልልታው ይስማ ከብሮም ይመታ
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =

VERSE 1
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ
አየ አሸተተ ከሰማያት ሆኖ
አምላክ የሚያድርበት ንጹህ ሰው ፈልጎ
ከፍጥረቱ ሁሉ አገኘ ድንግልን
ክብር ለምትሆን ዘምር ለእናታችን
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
ሰላምታዋ ፅንስን ያዘልላልና
እንዴት ዝም እላለሁ ናትና ገናና
ማለፊያ የልቤ መዝገያ ለችግሬ
መቼ እጠግብና ለእናቴ ዘምሬ
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
እንቁም ለእናታችን ወገኔ ተነሳ
በፀጋ እንክበር እጃችን ይነሳ
ፍቅሯን የቀመሰ መቼ ይጠግብና
ከልቡ ይዘምራል ብሩክት ናትና
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
ባታመስግናት ምስጉን ናት እናቱ
እረፍት እንድታገኝ ዘምር ለንግስቱ
በምጥ ስትሰቃይ ደርሳላት በክብር
ልጅ የያዘች እናት ታየች ስትዘምር
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
የእመቤታችን ሁሉ ክብሯ እኮ ነው
ትውልዱ ያመስግን ለእናቱ ለጌታው
ፀጋን የተመላሽ ይበል በደስታ
እልልታው ይስማ ከብሮም ይመታ
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ
አየ አሸተተ ከሰማያት ሆኖ
አምላክ የሚያድርበት ንጹህ ሰው ፈልጎ
ከፍጥረቱ ሁሉ አገኘ ድንግልን
ክብር ለምትሆን ዘምር ለእናታችን
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
ሰላምታዋ ፅንስን ያዘልላልና
እንዴት ዝም እላለሁ ናትና ገናና
ማለፊያ የልቤ መዝገያ ለችግሬ
መቼ እጠግብና ለእናቴ ዘምሬ
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
እንቁም ለእናታችን ወገኔ ተነሳ
በፀጋ እንክበር እጃችን ይነሳ
ፍቅሯን የቀመሰ መቼ ይጠግብና
ከልቡ ይዘምራል ብሩክት ናትና
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
ባታመስግናት ምስጉን ናት እናቱ
እረፍት እንድታገኝ ዘምር ለንግስቱ
በምጥ ስትሰቃይ ደርሳላት በክብር
ልጅ የያዘች እናት ታየች ስትዘምር
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = =
የእመቤታችን ሁሉ ክብሯ እኮ ነው
ትውልዱ ያመስግን ለእናቱ ለጌታው
ፀጋን የተመላሽ ይበል በደስታ
እልልታው ይስማ ከብሮም ይመታ
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ = = = = = ='
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5f9c873e-8e10-4667-8405-b911351756d5'::uuid, 'nu-ena-bezemari-besufikad-anidarigachew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
