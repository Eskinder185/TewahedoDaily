-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 13 OF 32
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
  -- etebegn-kosheshalehu-like-mezemeran-tewodros-yosef ("Etebegn Kosheshalehu Like Mezemeran Tewodros Yosef")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd2ef112a-7f02-4367-a5ac-1258499f9a24'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 1
ያንሁሉ ዛሬ ረሳሁ
እጠበኝ ቆሽሻለሁ (፪)
ከድንኳንህ ብታስገባኝ ሞገስ ሰተህ
የአፍኒንን የምግባር ይዤ አስቀየምኩህ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 2
ቅባ ሜሮን ያተምክበት ልጅነቴ
እንዳይጎድፍ ጠብቅልኝ ቸር አባቴ
ኃይል አኑረህ እንደ ሶምሶን በፀጉሬ
ጎልያድን አስጥለኸኝ በጠጠሬ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 3
አቅም ቢያንሰኝ በስጋ ጦር ተሸንፌ
ደጅህ መጣው የእንባ መባ በአይኔ አቅፌ
እንዳትረሳኝ በመዳፍህ ቀርፀኸኛል
እንዳተወኝ ያለመጠን ወደኸኛል

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 4
ባሰነዝር ልትቀጣኝ የሞት በትር
የትእግስትህ ሰሌዳ ነው ለኔ ክብር
ከከንፈሬ ጥበብ ፅፈህ ቅኔ ቢፈስ
በመታበይ አሳዘንኩት ያንተን መንፈስ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 5
ፍቅር ግተህ ከቅፍህ ስር ያሳደከኝ
እባክህን በበደሌ አትቅሰፈኝ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 1
Yanhulu zare resahu
Et’ebegn qoshshalehu (2)
Kednkwanh bitasgebagn moges seteh
Yeafninn yemgbar yizhe asqeyemkuh

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 2
Qiba meron yatemkbet lijnete
Endaygodf t’ebqlgn cher abate
Hayl anureh ende somson bets’egure
Golyadn ast’leኸgn bet’et’ere

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 3
Aqm biyansegn besga t’or teshenfe
Dejh met’aw yeenba meba beayne aqfe
Endatresagn bemedafh qerts’eኸgnal
Endatewegn yalemet’en wedeኸgnal

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 4
Basenezr litqet’agn yemot betr
Yetegsth seleda new lene kibir
Kekenfere t’beb ts’feh qine bifes
Bemetabey asazenkut yanten menfes

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 5
Fiqr giteh keqfh sir yasadekegn
Ebakhn bebedele atqsefegn

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 1
ያንሁሉ ዛሬ ረሳሁ
እጠበኝ ቆሽሻለሁ (፪)
ከድንኳንህ ብታስገባኝ ሞገስ ሰተህ
የአፍኒንን የምግባር ይዤ አስቀየምኩህ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 2
ቅባ ሜሮን ያተምክበት ልጅነቴ
እንዳይጎድፍ ጠብቅልኝ ቸር አባቴ
ኃይል አኑረህ እንደ ሶምሶን በፀጉሬ
ጎልያድን አስጥለኸኝ በጠጠሬ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 3
አቅም ቢያንሰኝ በስጋ ጦር ተሸንፌ
ደጅህ መጣው የእንባ መባ በአይኔ አቅፌ
እንዳትረሳኝ በመዳፍህ ቀርፀኸኛል
እንዳተወኝ ያለመጠን ወደኸኛል

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 4
ባሰነዝር ልትቀጣኝ የሞት በትር
የትእግስትህ ሰሌዳ ነው ለኔ ክብር
ከከንፈሬ ጥበብ ፅፈህ ቅኔ ቢፈስ
በመታበይ አሳዘንኩት ያንተን መንፈስ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 5
ፍቅር ግተህ ከቅፍህ ስር ያሳደከኝ
እባክህን በበደሌ አትቅሰፈኝ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ',
        lyrics_transliteration = 'CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 1
Yanhulu zare resahu
Et’ebegn qoshshalehu (2)
Kednkwanh bitasgebagn moges seteh
Yeafninn yemgbar yizhe asqeyemkuh

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 2
Qiba meron yatemkbet lijnete
Endaygodf t’ebqlgn cher abate
Hayl anureh ende somson bets’egure
Golyadn ast’leኸgn bet’et’ere

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 3
Aqm biyansegn besga t’or teshenfe
Dejh met’aw yeenba meba beayne aqfe
Endatresagn bemedafh qerts’eኸgnal
Endatewegn yalemet’en wedeኸgnal

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 4
Basenezr litqet’agn yemot betr
Yetegsth seleda new lene kibir
Kekenfere t’beb ts’feh qine bifes
Bemetabey asazenkut yanten menfes

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 5
Fiqr giteh keqfh sir yasadekegn
Ebakhn bebedele atqsefegn

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd2ef112a-7f02-4367-a5ac-1258499f9a24'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 1
ያንሁሉ ዛሬ ረሳሁ
እጠበኝ ቆሽሻለሁ (፪)
ከድንኳንህ ብታስገባኝ ሞገስ ሰተህ
የአፍኒንን የምግባር ይዤ አስቀየምኩህ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 2
ቅባ ሜሮን ያተምክበት ልጅነቴ
እንዳይጎድፍ ጠብቅልኝ ቸር አባቴ
ኃይል አኑረህ እንደ ሶምሶን በፀጉሬ
ጎልያድን አስጥለኸኝ በጠጠሬ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 3
አቅም ቢያንሰኝ በስጋ ጦር ተሸንፌ
ደጅህ መጣው የእንባ መባ በአይኔ አቅፌ
እንዳትረሳኝ በመዳፍህ ቀርፀኸኛል
እንዳተወኝ ያለመጠን ወደኸኛል

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 4
ባሰነዝር ልትቀጣኝ የሞት በትር
የትእግስትህ ሰሌዳ ነው ለኔ ክብር
ከከንፈሬ ጥበብ ፅፈህ ቅኔ ቢፈስ
በመታበይ አሳዘንኩት ያንተን መንፈስ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 5
ፍቅር ግተህ ከቅፍህ ስር ያሳደከኝ
እባክህን በበደሌ አትቅሰፈኝ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd2ef112a-7f02-4367-a5ac-1258499f9a24'::uuid, 'etebegn-kosheshalehu-like-mezemeran-tewodros-yosef', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- min-libel ("Min Libel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4af82680-7fc3-416d-8043-4f236b4f6539'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 1
በሞት ጥላ ምድር ያሳለፈኝ መርቶ
ደግሞም ዛሬ አነሣኝ በልጁ ሞት ጠርቶ
ክብሬን ለማይረባ ነገር አልለውጥም
ከአመድ ስላነሳኝ ክብሩ ለዘለዓለም

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 2
የሺሖርን ውኃ ለምን እጠጣለሁ
ፊቴን የማዞረው ምን አግኝቼበት ነው
ሁልጊዜ እየራራ ሳይዘነጋኝ ላፍታ
እኔ የዓይኑ ስስት እርሱ የኔ ርካታ

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 3
ስለምን ሆምጣጣ ፍሬ አፈራ ብለህ
እኔ አልተነቀልኩም ስለፍጹም ፍቅርህ
ቢቀላ እንዳለላ ነጣ እንደባዘቶ
የተከፋው ልቤ ሄደ ተደስቶ

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 4
ከወዜ ላይ ቀለብ ምናልባት ቢሰፍሩ
ወራቶቼ እንባን መከራን ቢያዘሩ
ልቤን ያስነከሰው ያ ቀን አለፈና
የበፍታዬን ኤፋድ ለበስኩ እንደገና

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 1
Bemot t’la midr yasalefegn merto
Degmom zare anesagn belju mot t’erto
Kibren lemayreba neger allewt’m
Keamed silanesagn kibru lezelealem

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 2
Yeshihorn wiha lemn et’et’alehu
Fiten yemazorew min aggnchebet new
Hulgize eyerara sayzenegagn lafta
Ene yeaynu sist ersu yene rikata

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 3
Silemn homt’at’a fire afera bileh
Ene alteneqelkum silefts’um fiqrh
Biqela endalela net’a endebazeto
Yetekefaw libe hede tedesto

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 4
Keweze lay qeleb minalbat bisefru
Weratoche enban mekeran biyazeru
Liben yasnekesew ya qen alefena
Yebeftayen efad lebesku endegena

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 1
በሞት ጥላ ምድር ያሳለፈኝ መርቶ
ደግሞም ዛሬ አነሣኝ በልጁ ሞት ጠርቶ
ክብሬን ለማይረባ ነገር አልለውጥም
ከአመድ ስላነሳኝ ክብሩ ለዘለዓለም

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 2
የሺሖርን ውኃ ለምን እጠጣለሁ
ፊቴን የማዞረው ምን አግኝቼበት ነው
ሁልጊዜ እየራራ ሳይዘነጋኝ ላፍታ
እኔ የዓይኑ ስስት እርሱ የኔ ርካታ

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 3
ስለምን ሆምጣጣ ፍሬ አፈራ ብለህ
እኔ አልተነቀልኩም ስለፍጹም ፍቅርህ
ቢቀላ እንዳለላ ነጣ እንደባዘቶ
የተከፋው ልቤ ሄደ ተደስቶ

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 4
ከወዜ ላይ ቀለብ ምናልባት ቢሰፍሩ
ወራቶቼ እንባን መከራን ቢያዘሩ
ልቤን ያስነከሰው ያ ቀን አለፈና
የበፍታዬን ኤፋድ ለበስኩ እንደገና

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ',
        lyrics_transliteration = 'CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 1
Bemot t’la midr yasalefegn merto
Degmom zare anesagn belju mot t’erto
Kibren lemayreba neger allewt’m
Keamed silanesagn kibru lezelealem

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 2
Yeshihorn wiha lemn et’et’alehu
Fiten yemazorew min aggnchebet new
Hulgize eyerara sayzenegagn lafta
Ene yeaynu sist ersu yene rikata

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 3
Silemn homt’at’a fire afera bileh
Ene alteneqelkum silefts’um fiqrh
Biqela endalela net’a endebazeto
Yetekefaw libe hede tedesto

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 4
Keweze lay qeleb minalbat bisefru
Weratoche enban mekeran biyazeru
Liben yasnekesew ya qen alefena
Yebeftayen efad lebesku endegena

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4af82680-7fc3-416d-8043-4f236b4f6539'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 1
በሞት ጥላ ምድር ያሳለፈኝ መርቶ
ደግሞም ዛሬ አነሣኝ በልጁ ሞት ጠርቶ
ክብሬን ለማይረባ ነገር አልለውጥም
ከአመድ ስላነሳኝ ክብሩ ለዘለዓለም

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 2
የሺሖርን ውኃ ለምን እጠጣለሁ
ፊቴን የማዞረው ምን አግኝቼበት ነው
ሁልጊዜ እየራራ ሳይዘነጋኝ ላፍታ
እኔ የዓይኑ ስስት እርሱ የኔ ርካታ

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 3
ስለምን ሆምጣጣ ፍሬ አፈራ ብለህ
እኔ አልተነቀልኩም ስለፍጹም ፍቅርህ
ቢቀላ እንዳለላ ነጣ እንደባዘቶ
የተከፋው ልቤ ሄደ ተደስቶ

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 4
ከወዜ ላይ ቀለብ ምናልባት ቢሰፍሩ
ወራቶቼ እንባን መከራን ቢያዘሩ
ልቤን ያስነከሰው ያ ቀን አለፈና
የበፍታዬን ኤፋድ ለበስኩ እንደገና

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4af82680-7fc3-416d-8043-4f236b4f6539'::uuid, 'min-libel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- simih-behulu-temesegene ("Simih Behulu Temesegene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4bcbc04e-18d8-4893-8e29-a1bee7501525'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ( ፪)

CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 2
ሰማዩ ዝናብ ደመና ቢያጣም
ፍቅርህ በእኛ ውስጥ አላቋረጠም
ቸርነትህ እንጠብቃለን
ካንተ ደጅ አምላክ (ጌታ)የት እንሔዳለን(፪)

CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 3
በምግብ እጦት ብንሰቃይም
ማህሌትህን አናቋርጥም
የመከራ ዶፍ ቢወርድብንም
እንዘምራለን ለአምላካችን ስም(፪)

CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simh behulu temesegen
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makbr gibrachn hunwal

VERSE 1
Amlak temesgen besemayat
Simh yiwedes beft’retat
Kehts’anat af misgana yiwt’a
Anten mamesgen yihun yegna et’a (2)

CHORUS
Simh behulu temesegen
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makbr gibrachn hunwal

VERSE 2
Semayu zinab demena biyat’am
Fiqrh beegna wist’ alaqwaret’em
Cherneth ent’ebqalen
Kante dej amlak (Geta)yet enhedalen (2)

CHORUS
Simh behulu temesegen
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makbr gibrachn hunwal

VERSE 3
Bemgb et’ot binseqaym
Mahlethn anaqwart’m
Yemekera dof biwerdbnm
Enzemralen leamlakachn sim (2)

CHORUS
Simh behulu temesegen
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makbr gibrachn hunwal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ( ፪)

CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 2
ሰማዩ ዝናብ ደመና ቢያጣም
ፍቅርህ በእኛ ውስጥ አላቋረጠም
ቸርነትህ እንጠብቃለን
ካንተ ደጅ አምላክ (ጌታ)የት እንሔዳለን(፪)

CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 3
በምግብ እጦት ብንሰቃይም
ማህሌትህን አናቋርጥም
የመከራ ዶፍ ቢወርድብንም
እንዘምራለን ለአምላካችን ስም(፪)

CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል',
        lyrics_transliteration = 'CHORUS
Simh behulu temesegen
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makbr gibrachn hunwal

VERSE 1
Amlak temesgen besemayat
Simh yiwedes beft’retat
Kehts’anat af misgana yiwt’a
Anten mamesgen yihun yegna et’a (2)

CHORUS
Simh behulu temesegen
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makbr gibrachn hunwal

VERSE 2
Semayu zinab demena biyat’am
Fiqrh beegna wist’ alaqwaret’em
Cherneth ent’ebqalen
Kante dej amlak (Geta)yet enhedalen (2)

CHORUS
Simh behulu temesegen
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makbr gibrachn hunwal

VERSE 3
Bemgb et’ot binseqaym
Mahlethn anaqwart’m
Yemekera dof biwerdbnm
Enzemralen leamlakachn sim (2)

CHORUS
Simh behulu temesegen
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makbr gibrachn hunwal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4bcbc04e-18d8-4893-8e29-a1bee7501525'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ( ፪)

CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 2
ሰማዩ ዝናብ ደመና ቢያጣም
ፍቅርህ በእኛ ውስጥ አላቋረጠም
ቸርነትህ እንጠብቃለን
ካንተ ደጅ አምላክ (ጌታ)የት እንሔዳለን(፪)

CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 3
በምግብ እጦት ብንሰቃይም
ማህሌትህን አናቋርጥም
የመከራ ዶፍ ቢወርድብንም
እንዘምራለን ለአምላካችን ስም(፪)

CHORUS
ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4bcbc04e-18d8-4893-8e29-a1bee7501525'::uuid, 'simih-behulu-temesegene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beza-kwilu ("Beza Kwilu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7b42d06a-6835-428f-a243-a5f254dc24fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬

CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4

VERSE 1
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4

CHORUS
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬

CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬',
        lyrics_transliteration = 'CHORUS
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4

VERSE 1
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4

CHORUS
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7b42d06a-6835-428f-a243-a5f254dc24fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬

CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7b42d06a-6835-428f-a243-a5f254dc24fe'::uuid, 'beza-kwilu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adinegn-amilake-adinegn ("Adinegn Amilake Adinegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2e6d2895-f040-4c7e-8ed2-ceb66f6a1381'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 1
ፍቅር ከሰው ልጆች ቀዝቅዞ
ትዉልዱ በበደል ተይዞ
ወዳጅ በወዳጁ ጨከነ
ወዉደዱ የሽንገላ ሆነ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 2
ሆኖበት ክብሩ በነውሩ
ተጣሰ የፍቅር ድንበሩ
ደርቦ የማይሞቀዉ ሆነ
ደስታዉ ከእጁ ላይ ተነነ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 3
ለቃልህ መታዘዝ ዘነጋ
ተክዞ መሽቶ እየነጋ
ለክፉ አሳልፎ ሰጠ
ወንድሙን በነዋይ ለወጠ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 4
ትንኝን ያጠራል ከሰው ላይ
በራሱ ምሶሶዉን ሳያያይ
ይሆናል የወንድሙ ፈራጅ
ተይዞ በእግዚአብሄር እጅ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 5
ተሰዶ ሲኖር በባእድ
ሲገባው ሁሉም ሊዋደድ
አንዱበአንዱ ላይ ይነሳል
አካሉን ቀኝ እጁን ይንቃል

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 6
ወንድሙን እህቱን ይንቃል

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 1
Fiqr kesew lijoch qezqzo
Tiwuldu bebedel teyzo
Wedaj bewedaju ch’ekene
Wewudedu yeshngela hone/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 2
Honobet kibru benewru
Tet’ase yefqr dinberu
Derbo yemaymoqewu hone
Destawu keeju lay tenene/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 3
Leqalh metazez zenega
Tekzo meshto eyenega
Lekfu asalfo set’e
Wendmun beneway lewet’e/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 4
Tingnn yat’eral kesew lay
Berasu misosowun sayayay
Yihonal yewendmu feraj
Teyzo beegziabher ej/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 5
Tesedo sinor bebaed
Sigebaw hulum liwaded
Andubeandu lay yinesal
Akalun qegn ejun yinqal

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 6
Wendmun ehtun yinqal

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 1
ፍቅር ከሰው ልጆች ቀዝቅዞ
ትዉልዱ በበደል ተይዞ
ወዳጅ በወዳጁ ጨከነ
ወዉደዱ የሽንገላ ሆነ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 2
ሆኖበት ክብሩ በነውሩ
ተጣሰ የፍቅር ድንበሩ
ደርቦ የማይሞቀዉ ሆነ
ደስታዉ ከእጁ ላይ ተነነ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 3
ለቃልህ መታዘዝ ዘነጋ
ተክዞ መሽቶ እየነጋ
ለክፉ አሳልፎ ሰጠ
ወንድሙን በነዋይ ለወጠ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 4
ትንኝን ያጠራል ከሰው ላይ
በራሱ ምሶሶዉን ሳያያይ
ይሆናል የወንድሙ ፈራጅ
ተይዞ በእግዚአብሄር እጅ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 5
ተሰዶ ሲኖር በባእድ
ሲገባው ሁሉም ሊዋደድ
አንዱበአንዱ ላይ ይነሳል
አካሉን ቀኝ እጁን ይንቃል

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 6
ወንድሙን እህቱን ይንቃል

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2',
        lyrics_transliteration = 'CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 1
Fiqr kesew lijoch qezqzo
Tiwuldu bebedel teyzo
Wedaj bewedaju ch’ekene
Wewudedu yeshngela hone/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 2
Honobet kibru benewru
Tet’ase yefqr dinberu
Derbo yemaymoqewu hone
Destawu keeju lay tenene/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 3
Leqalh metazez zenega
Tekzo meshto eyenega
Lekfu asalfo set’e
Wendmun beneway lewet’e/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 4
Tingnn yat’eral kesew lay
Berasu misosowun sayayay
Yihonal yewendmu feraj
Teyzo beegziabher ej/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 5
Tesedo sinor bebaed
Sigebaw hulum liwaded
Andubeandu lay yinesal
Akalun qegn ejun yinqal

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 6
Wendmun ehtun yinqal

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2e6d2895-f040-4c7e-8ed2-ceb66f6a1381'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 1
ፍቅር ከሰው ልጆች ቀዝቅዞ
ትዉልዱ በበደል ተይዞ
ወዳጅ በወዳጁ ጨከነ
ወዉደዱ የሽንገላ ሆነ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 2
ሆኖበት ክብሩ በነውሩ
ተጣሰ የፍቅር ድንበሩ
ደርቦ የማይሞቀዉ ሆነ
ደስታዉ ከእጁ ላይ ተነነ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 3
ለቃልህ መታዘዝ ዘነጋ
ተክዞ መሽቶ እየነጋ
ለክፉ አሳልፎ ሰጠ
ወንድሙን በነዋይ ለወጠ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 4
ትንኝን ያጠራል ከሰው ላይ
በራሱ ምሶሶዉን ሳያያይ
ይሆናል የወንድሙ ፈራጅ
ተይዞ በእግዚአብሄር እጅ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 5
ተሰዶ ሲኖር በባእድ
ሲገባው ሁሉም ሊዋደድ
አንዱበአንዱ ላይ ይነሳል
አካሉን ቀኝ እጁን ይንቃል

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 6
ወንድሙን እህቱን ይንቃል

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2e6d2895-f040-4c7e-8ed2-ceb66f6a1381'::uuid, 'adinegn-amilake-adinegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yinafkal-libe-tegegn-begena-mezmur ("Yinafkal libe Tegegn Begena mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4e669f15-5454-4d6e-8af8-251a061fdca5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 1
በፍቅርህ ስታየኝ አነባለሁኝ
በውስጤ ይፈሳል ፍቅርህ እንደዘይት
እንዴት ልርሳው ቸርነትክን ከተለወጥኩብህ
ለፍርድ አትቸኩልም በልጆችህ ላይ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 2
ልቦናዬን ማርከኸዋል ከምንም በላይ
የእኔ አይደለምና የምድር ሰውነቴ
ላገልግልህ ባሪያህ ሆኜ ቸር ነህ መዳኒቴ
አመፅን ለመስራት ስፈጥን ከመንገድ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 3
ከአጠገብ
አይሃለሁ እብደቴን ስታግድ እንደምን ወደድከኝ ምን እከፍልሃለሁ
ከሰው ምንም የማትወስድ
መሆንክን አውቃለሁ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 4
እንግዳ ነህ ለእኔ አዲስ ነህ ለቤቴ
ትልቁ ዘመዴ ለብቸኝነቴ
ዳር ሆነህ አታየኝ ሀዘን ሲገርፈኝ
ለጥያቄዎቼ ሁሉ መልስ የምትሆነኝ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 1
Befqrh sitayegn anebalehugn
Bewst’e yifesal fiqrh endezeyt
Endet lirsaw chernetkn ketelewet’kubh
Lefrd atchekulm beljochh lay

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 2
Libonayen markeኸwal kemnm belay
Yeene aydelemna yemdr sewnete
Lagelglh bariyah hogne cher neh medanite
Amets’n lemesrat sifet’n kemenged

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 3
Keat’egeb
Ayhalehu ebdeten sitagd endemn wededkegn min ekeflhalehu
Kesew minm yematwesd
Mehonkn awqalehu

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 4
Engda neh leene adis neh lebete
Tilqu zemede lebchegnnete
Dar honeh atayegn hezen sigerfegn
Let’yaqewoche hulu mels yemthonegn

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 1
በፍቅርህ ስታየኝ አነባለሁኝ
በውስጤ ይፈሳል ፍቅርህ እንደዘይት
እንዴት ልርሳው ቸርነትክን ከተለወጥኩብህ
ለፍርድ አትቸኩልም በልጆችህ ላይ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 2
ልቦናዬን ማርከኸዋል ከምንም በላይ
የእኔ አይደለምና የምድር ሰውነቴ
ላገልግልህ ባሪያህ ሆኜ ቸር ነህ መዳኒቴ
አመፅን ለመስራት ስፈጥን ከመንገድ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 3
ከአጠገብ
አይሃለሁ እብደቴን ስታግድ እንደምን ወደድከኝ ምን እከፍልሃለሁ
ከሰው ምንም የማትወስድ
መሆንክን አውቃለሁ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 4
እንግዳ ነህ ለእኔ አዲስ ነህ ለቤቴ
ትልቁ ዘመዴ ለብቸኝነቴ
ዳር ሆነህ አታየኝ ሀዘን ሲገርፈኝ
ለጥያቄዎቼ ሁሉ መልስ የምትሆነኝ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ',
        lyrics_transliteration = 'CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 1
Befqrh sitayegn anebalehugn
Bewst’e yifesal fiqrh endezeyt
Endet lirsaw chernetkn ketelewet’kubh
Lefrd atchekulm beljochh lay

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 2
Libonayen markeኸwal kemnm belay
Yeene aydelemna yemdr sewnete
Lagelglh bariyah hogne cher neh medanite
Amets’n lemesrat sifet’n kemenged

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 3
Keat’egeb
Ayhalehu ebdeten sitagd endemn wededkegn min ekeflhalehu
Kesew minm yematwesd
Mehonkn awqalehu

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 4
Engda neh leene adis neh lebete
Tilqu zemede lebchegnnete
Dar honeh atayegn hezen sigerfegn
Let’yaqewoche hulu mels yemthonegn

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4e669f15-5454-4d6e-8af8-251a061fdca5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 1
በፍቅርህ ስታየኝ አነባለሁኝ
በውስጤ ይፈሳል ፍቅርህ እንደዘይት
እንዴት ልርሳው ቸርነትክን ከተለወጥኩብህ
ለፍርድ አትቸኩልም በልጆችህ ላይ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 2
ልቦናዬን ማርከኸዋል ከምንም በላይ
የእኔ አይደለምና የምድር ሰውነቴ
ላገልግልህ ባሪያህ ሆኜ ቸር ነህ መዳኒቴ
አመፅን ለመስራት ስፈጥን ከመንገድ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 3
ከአጠገብ
አይሃለሁ እብደቴን ስታግድ እንደምን ወደድከኝ ምን እከፍልሃለሁ
ከሰው ምንም የማትወስድ
መሆንክን አውቃለሁ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 4
እንግዳ ነህ ለእኔ አዲስ ነህ ለቤቴ
ትልቁ ዘመዴ ለብቸኝነቴ
ዳር ሆነህ አታየኝ ሀዘን ሲገርፈኝ
ለጥያቄዎቼ ሁሉ መልስ የምትሆነኝ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4e669f15-5454-4d6e-8af8-251a061fdca5'::uuid, 'yinafkal-libe-tegegn-begena-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- maetebe-tirigum-new ("Maetebe Tirigum New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '940feea0-a4e3-4032-a776-4849eb3f9e26'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 1
የማይበጠስ ነው በእምነት የታሰረ፣
በአምላኬ ፍቅር በደም የከበረ
አንገቴ ላይ ያለው በልቤም ውስጥ ጠልቋል፣
ማሀይተቤን ሊያስበጥስ ከቶ ማን ይችላል(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 2
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀተቤ ትርጉም ነው የክርስትናየ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 3
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)
መከራ መሆኑ የተቀደሰ ነው
ዳግመኛ ስወለድ ካህኑ ያሰረው

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 4
የእምነቴ ማህተብ አርማየ ነው እና፣
ይኖራል በአንገቴ እንደ መቅረዝ ፋና(2)
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 5
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 6
ጠላት ይፈራዋል የነብሴ መንገሻ፣
የሰማይ መንገዴ ድልድይ መዳረሻ ፣
ማሀይተቤን እያየ አይችልም ሊፀና፣
በመስቀሉ አፍሮ ተቀጥቅጧል እና (2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 7
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀይተቤ ትርጉም ነው ለክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 8
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 1
Yemaybet’es new beemnet yetasere,
Beamlake fiqr bedem yekebere
Angete lay yalew belbem wist’ t’elqwal,
Maheyteben liyasbet’s keto man yichlal (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 2
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)
Mehetebe tirgum new yekrstnaye,
Teketelegn bilo yeset’egn getaye

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 3
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)
Mekera mehonu yeteqedese new
Dagmegna siweled kahnu yaserew

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 4
Yeemnete mahteb armaye new ena,
Yinoral beangete ende meqrez fana (2)
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 5
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 6
T’elat yiferawal yenebse mengesha,
Yesemay mengede dildy medaresha ,
Maheyteben eyaye aychlm lits’ena,
Bemesqelu afro teqet’qt’wal ena (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 7
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)
Meheytebe tirgum new lekrstnaye ,
Teketelegn bilo yeset’egn getaye

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 8
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 1
የማይበጠስ ነው በእምነት የታሰረ፣
በአምላኬ ፍቅር በደም የከበረ
አንገቴ ላይ ያለው በልቤም ውስጥ ጠልቋል፣
ማሀይተቤን ሊያስበጥስ ከቶ ማን ይችላል(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 2
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀተቤ ትርጉም ነው የክርስትናየ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 3
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)
መከራ መሆኑ የተቀደሰ ነው
ዳግመኛ ስወለድ ካህኑ ያሰረው

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 4
የእምነቴ ማህተብ አርማየ ነው እና፣
ይኖራል በአንገቴ እንደ መቅረዝ ፋና(2)
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 5
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 6
ጠላት ይፈራዋል የነብሴ መንገሻ፣
የሰማይ መንገዴ ድልድይ መዳረሻ ፣
ማሀይተቤን እያየ አይችልም ሊፀና፣
በመስቀሉ አፍሮ ተቀጥቅጧል እና (2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 7
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀይተቤ ትርጉም ነው ለክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 8
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)',
        lyrics_transliteration = 'CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 1
Yemaybet’es new beemnet yetasere,
Beamlake fiqr bedem yekebere
Angete lay yalew belbem wist’ t’elqwal,
Maheyteben liyasbet’s keto man yichlal (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 2
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)
Mehetebe tirgum new yekrstnaye,
Teketelegn bilo yeset’egn getaye

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 3
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)
Mekera mehonu yeteqedese new
Dagmegna siweled kahnu yaserew

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 4
Yeemnete mahteb armaye new ena,
Yinoral beangete ende meqrez fana (2)
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 5
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 6
T’elat yiferawal yenebse mengesha,
Yesemay mengede dildy medaresha ,
Maheyteben eyaye aychlm lits’ena,
Bemesqelu afro teqet’qt’wal ena (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 7
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)
Meheytebe tirgum new lekrstnaye ,
Teketelegn bilo yeset’egn getaye

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 8
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '940feea0-a4e3-4032-a776-4849eb3f9e26'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 1
የማይበጠስ ነው በእምነት የታሰረ፣
በአምላኬ ፍቅር በደም የከበረ
አንገቴ ላይ ያለው በልቤም ውስጥ ጠልቋል፣
ማሀይተቤን ሊያስበጥስ ከቶ ማን ይችላል(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 2
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀተቤ ትርጉም ነው የክርስትናየ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 3
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)
መከራ መሆኑ የተቀደሰ ነው
ዳግመኛ ስወለድ ካህኑ ያሰረው

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 4
የእምነቴ ማህተብ አርማየ ነው እና፣
ይኖራል በአንገቴ እንደ መቅረዝ ፋና(2)
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 5
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 6
ጠላት ይፈራዋል የነብሴ መንገሻ፣
የሰማይ መንገዴ ድልድይ መዳረሻ ፣
ማሀይተቤን እያየ አይችልም ሊፀና፣
በመስቀሉ አፍሮ ተቀጥቅጧል እና (2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 7
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀይተቤ ትርጉም ነው ለክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 8
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '940feea0-a4e3-4032-a776-4849eb3f9e26'::uuid, 'maetebe-tirigum-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- agetinibet-simihin ("Agetinibet Simihin")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd34ece15-50f3-4e95-a789-58475afc8ba8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 1
ተዋህዶ የአዳምን ስጋ
አማኑኤል ሆነ ከኛ ጋ
በግርግም በቤተልሔም
ተወልዶ ሆነልን ሰላም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 2
ብንጠግብ በልተን ጠጥተን
ብንገባም በሰላም ወጥተን
ልጆችን ወልደን ብንስም
ጠርተን ነው ጌታ ያንተን ስም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 3
ቢያምርብን ቢሞቀን ለብሰን
ብንረሳ ለቅሶና ኃዘን
ፍቅርህ ነው ዛሬን ያሳየን
ተመስገን እንልሀለን

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 4
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጬን ልብስ ለብሰን ታይተናል
መስቀሉን ከማህተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 5
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጩን ልብስ ለብሰን ታይተናል
መስቀሉን ከመሀተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 1
Tewahedo yeadamn siga
Amanuel hone kegna ga
Begrgm bebetelhem
Teweldo honeln selam

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 2
Bint’egb belten t’et’ten
Bingebam beselam wet’ten
Lijochn welden binsm
T’erten new Geta yanten sim

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 3
Biyamrbn bimoqen lebsen
Binresa leqsona hazen
Fiqrh new zaren yasayen
Temesgen enlhelen

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 4
Bebaed heger binnor
Biget’men mekera chgr
Nech’en libs lebsen taytenal
Mesqelun kemahtebu gar

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 5
Bebaed heger binnor
Biget’men mekera chgr
Nech’un libs lebsen taytenal
Mesqelun kemehetebu gar

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 1
ተዋህዶ የአዳምን ስጋ
አማኑኤል ሆነ ከኛ ጋ
በግርግም በቤተልሔም
ተወልዶ ሆነልን ሰላም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 2
ብንጠግብ በልተን ጠጥተን
ብንገባም በሰላም ወጥተን
ልጆችን ወልደን ብንስም
ጠርተን ነው ጌታ ያንተን ስም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 3
ቢያምርብን ቢሞቀን ለብሰን
ብንረሳ ለቅሶና ኃዘን
ፍቅርህ ነው ዛሬን ያሳየን
ተመስገን እንልሀለን

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 4
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጬን ልብስ ለብሰን ታይተናል
መስቀሉን ከማህተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 5
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጩን ልብስ ለብሰን ታይተናል
መስቀሉን ከመሀተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል',
        lyrics_transliteration = 'CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 1
Tewahedo yeadamn siga
Amanuel hone kegna ga
Begrgm bebetelhem
Teweldo honeln selam

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 2
Bint’egb belten t’et’ten
Bingebam beselam wet’ten
Lijochn welden binsm
T’erten new Geta yanten sim

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 3
Biyamrbn bimoqen lebsen
Binresa leqsona hazen
Fiqrh new zaren yasayen
Temesgen enlhelen

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 4
Bebaed heger binnor
Biget’men mekera chgr
Nech’en libs lebsen taytenal
Mesqelun kemahtebu gar

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 5
Bebaed heger binnor
Biget’men mekera chgr
Nech’un libs lebsen taytenal
Mesqelun kemehetebu gar

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd34ece15-50f3-4e95-a789-58475afc8ba8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 1
ተዋህዶ የአዳምን ስጋ
አማኑኤል ሆነ ከኛ ጋ
በግርግም በቤተልሔም
ተወልዶ ሆነልን ሰላም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 2
ብንጠግብ በልተን ጠጥተን
ብንገባም በሰላም ወጥተን
ልጆችን ወልደን ብንስም
ጠርተን ነው ጌታ ያንተን ስም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 3
ቢያምርብን ቢሞቀን ለብሰን
ብንረሳ ለቅሶና ኃዘን
ፍቅርህ ነው ዛሬን ያሳየን
ተመስገን እንልሀለን

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 4
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጬን ልብስ ለብሰን ታይተናል
መስቀሉን ከማህተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 5
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጩን ልብስ ለብሰን ታይተናል
መስቀሉን ከመሀተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd34ece15-50f3-4e95-a789-58475afc8ba8'::uuid, 'agetinibet-simihin', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enidih-bearat-netib-lizega-mierafu ("Enidih Bearat Netib Lizega Mierafu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd3e3bb72-f83e-466f-9ceb-4b4464d77d4e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 1
ይለኝ ነበር ጠላት እግዚአብሔር ዘገየ
ግን ሁሉን በጊዜዉ ዉብ አርጎ ሲሰራ
አፍሯል ለዘላለም ደንቆት የእርሱ ሥራ(2)
በቃ ልጅ የለህም አትወልድም ሳራ

CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 2
ላይሰማህ እግዚአብሔር ጮኼህ በትጣራ እያለ ጠላቴ መስሎት ያሸነፈ
ይስሐቅ ተወለደ ያ ቀንም አለፈ(2)
ፍፃሜዬን ሳያይ ገና ከጅምሩ ጠላት በእርሱ ግምት ብዙ መናገሩ አስብሎታል
ተቄል ተቀይሮ ስሙ የዘገየ መስሎ ግታ በመቅደሙ(2)

CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 3
ድንጋይ ያሸከመን ዉኀ ተሸከመ ለእኛ ቀን ወጣልን ለእርሱ ግን ጨለመ ገዳይ ብዘገይም ሟች በመገስገሱ ፈረሰኛዉ ሞተ እስከነ ፈረሱ(2)
ብመስለንም ሌቱ ፍፁም የማይነጋ ተቆልፎ የምቀር በሩ እንደተዘጋ እርሱን ተስፋ አድርገዉ በአመንክበት ፅና ቀን
አለዉ እግዚአብሔር ያደርግሃል ቀና(2)

CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Endh bearat net’b lizega mierafu
Egziabher liyashenf yeersu hono selfu melkam lemenager afu baytadel
Yihn eskiyay t’elat min ale zim bel (2)
Melkamun debqo kifun eyasaye

VERSE 1
Yilegn neber t’elat Egziabher zegeye
Gin hulun begizewu wub argo sisera
Afrwal lezelalem denqot yeersu sira (2)
Beqa lij yelehm atweldm sara

CHORUS
Endh bearat net’b lizega mierafu
Egziabher liyashenf yeersu hono selfu melkam lemenager afu baytadel
Yihn eskiyay t’elat min ale zim bel (2)
Melkamun debqo kifun eyasaye

VERSE 2
Laysemah Egziabher ch’oኼh bett’ara eyale t’elate meslot yashenefe
Yisheq tewelede ya qenm alefe (2)
Fits’ameyen sayay gena kejmru t’elat beersu gimt bizu menageru asblotal
Teqel teqeyro simu yezegeye meslo gita bemeqdemu (2)

CHORUS
Endh bearat net’b lizega mierafu
Egziabher liyashenf yeersu hono selfu melkam lemenager afu baytadel
Yihn eskiyay t’elat min ale zim bel (2)
Melkamun debqo kifun eyasaye

VERSE 3
Dingay yashekemen wuhe teshekeme leegna qen wet’aln leersu gin ch’eleme geday bizegeym mwach bemegesgesu feresegnawu mote eskene feresu (2)
Bimeslenm letu fits’um yemaynega teqolfo yemqer beru endetezega ersun tesfa adrgewu beamenkbet ts’na qen
Alewu Egziabher yaderghal qena (2)

CHORUS
Endh bearat net’b lizega mierafu
Egziabher liyashenf yeersu hono selfu melkam lemenager afu baytadel
Yihn eskiyay t’elat min ale zim bel (2)
Melkamun debqo kifun eyasaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 1
ይለኝ ነበር ጠላት እግዚአብሔር ዘገየ
ግን ሁሉን በጊዜዉ ዉብ አርጎ ሲሰራ
አፍሯል ለዘላለም ደንቆት የእርሱ ሥራ(2)
በቃ ልጅ የለህም አትወልድም ሳራ

CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 2
ላይሰማህ እግዚአብሔር ጮኼህ በትጣራ እያለ ጠላቴ መስሎት ያሸነፈ
ይስሐቅ ተወለደ ያ ቀንም አለፈ(2)
ፍፃሜዬን ሳያይ ገና ከጅምሩ ጠላት በእርሱ ግምት ብዙ መናገሩ አስብሎታል
ተቄል ተቀይሮ ስሙ የዘገየ መስሎ ግታ በመቅደሙ(2)

CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 3
ድንጋይ ያሸከመን ዉኀ ተሸከመ ለእኛ ቀን ወጣልን ለእርሱ ግን ጨለመ ገዳይ ብዘገይም ሟች በመገስገሱ ፈረሰኛዉ ሞተ እስከነ ፈረሱ(2)
ብመስለንም ሌቱ ፍፁም የማይነጋ ተቆልፎ የምቀር በሩ እንደተዘጋ እርሱን ተስፋ አድርገዉ በአመንክበት ፅና ቀን
አለዉ እግዚአብሔር ያደርግሃል ቀና(2)

CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ',
        lyrics_transliteration = 'CHORUS
Endh bearat net’b lizega mierafu
Egziabher liyashenf yeersu hono selfu melkam lemenager afu baytadel
Yihn eskiyay t’elat min ale zim bel (2)
Melkamun debqo kifun eyasaye

VERSE 1
Yilegn neber t’elat Egziabher zegeye
Gin hulun begizewu wub argo sisera
Afrwal lezelalem denqot yeersu sira (2)
Beqa lij yelehm atweldm sara

CHORUS
Endh bearat net’b lizega mierafu
Egziabher liyashenf yeersu hono selfu melkam lemenager afu baytadel
Yihn eskiyay t’elat min ale zim bel (2)
Melkamun debqo kifun eyasaye

VERSE 2
Laysemah Egziabher ch’oኼh bett’ara eyale t’elate meslot yashenefe
Yisheq tewelede ya qenm alefe (2)
Fits’ameyen sayay gena kejmru t’elat beersu gimt bizu menageru asblotal
Teqel teqeyro simu yezegeye meslo gita bemeqdemu (2)

CHORUS
Endh bearat net’b lizega mierafu
Egziabher liyashenf yeersu hono selfu melkam lemenager afu baytadel
Yihn eskiyay t’elat min ale zim bel (2)
Melkamun debqo kifun eyasaye

VERSE 3
Dingay yashekemen wuhe teshekeme leegna qen wet’aln leersu gin ch’eleme geday bizegeym mwach bemegesgesu feresegnawu mote eskene feresu (2)
Bimeslenm letu fits’um yemaynega teqolfo yemqer beru endetezega ersun tesfa adrgewu beamenkbet ts’na qen
Alewu Egziabher yaderghal qena (2)

CHORUS
Endh bearat net’b lizega mierafu
Egziabher liyashenf yeersu hono selfu melkam lemenager afu baytadel
Yihn eskiyay t’elat min ale zim bel (2)
Melkamun debqo kifun eyasaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd3e3bb72-f83e-466f-9ceb-4b4464d77d4e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 1
ይለኝ ነበር ጠላት እግዚአብሔር ዘገየ
ግን ሁሉን በጊዜዉ ዉብ አርጎ ሲሰራ
አፍሯል ለዘላለም ደንቆት የእርሱ ሥራ(2)
በቃ ልጅ የለህም አትወልድም ሳራ

CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 2
ላይሰማህ እግዚአብሔር ጮኼህ በትጣራ እያለ ጠላቴ መስሎት ያሸነፈ
ይስሐቅ ተወለደ ያ ቀንም አለፈ(2)
ፍፃሜዬን ሳያይ ገና ከጅምሩ ጠላት በእርሱ ግምት ብዙ መናገሩ አስብሎታል
ተቄል ተቀይሮ ስሙ የዘገየ መስሎ ግታ በመቅደሙ(2)

CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 3
ድንጋይ ያሸከመን ዉኀ ተሸከመ ለእኛ ቀን ወጣልን ለእርሱ ግን ጨለመ ገዳይ ብዘገይም ሟች በመገስገሱ ፈረሰኛዉ ሞተ እስከነ ፈረሱ(2)
ብመስለንም ሌቱ ፍፁም የማይነጋ ተቆልፎ የምቀር በሩ እንደተዘጋ እርሱን ተስፋ አድርገዉ በአመንክበት ፅና ቀን
አለዉ እግዚአብሔር ያደርግሃል ቀና(2)

CHORUS
እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd3e3bb72-f83e-466f-9ceb-4b4464d77d4e'::uuid, 'enidih-bearat-netib-lizega-mierafu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lel-bel-zemarit-kisanet-kbrom-eritrean-orthodox-tewahdo-mezmur ("lel bel / Zemarit Kisanet Kbrom / Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5004002e-cdd1-4c73-946e-c36fba052211'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 1
ገሮሞ''ለ ዘይኮነ
ልማድ ሰብ ተከቲለ
ውሽጠይ ተረቲዐ ኢየ
ዘምልኸካ ኣቦየ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 2
ፍቅርካ ኣብ ደመይ ኣቲዩ
ከመይ ኢለ''ሞ ስቅ ክብል
ስምካ አንተ ዘይጸዋዕኩ
ልበይ ትብል ሸቀልቀል

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 3
☆☆☆☆☆☆☆
ህዋሳተይ ብሕብረት
ኣዋዲደ ብትግሃት
ቀትሪ ለይቲ ከይበልኩ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 4
ንስምኻ አንተ ዘመርኩ
ሓይለይ ኣይደክመንን''ዩ
ውሽጠይ ኣይጸግበካን''ዩ
መሊሱ "ኢየሱስ" ይበል

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 5
ኣይክአለሉን ስቅ ምባል
☆☆☆☆☆☆☆☆
ብሙሉ ልበይ ዝቀርቦ
ኩልንትናይ ዝህቦ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 6
ልዕሌካ ዝሰርዖ የልቦን
ብፍጹም''ውን ኣይሓስቦን
ምስጋናይ ኮነ ጸሎተይ
ጥበበይ ኮነ ድርሰተይ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 7
ትዘቅርቦ መስዋአተይ
ንዓኻ''ዩ ኣምላኸይ
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 8
ብሓቂ አንብርኸከልካ)²

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 1
Geromo''le zeykone
Limad seb teketile
Wisht’ey teretia iye
Zemlኸka aboye

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 2
Fiqrka ab demey atiyu
Kemey ile''mo siq kibl
Simka ante zeyts’ewaeku
Libey tibl sheqelqel

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 3
☆☆☆☆☆☆☆
Hiwasatey bihbret
Awadide bitghat
Qetri leyti keybelku

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 4
Nismኻ ante zemerku
Hayley aydekmenn''yu
Wisht’ey ayts’egbekan''yu
Melisu "Iyesus" yibel

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 5
Aykalelun siq mibal
☆☆☆☆☆☆☆☆
Bimulu libey ziqerbo
Kulntnay zihbo

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 6
Lieleka zisero yelbon
Bifts’um''win ayhasbon
Misganay kone ts’elotey
T’bebey kone dirsetey

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 7
Tizeqrbo meswaatey
Niaኻ''yu amlaኸy
(liel bel (kiber)² ableka
Bimenfes amlኸka

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 8
Bihaqi anbrኸkelka)²

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 1
ገሮሞ''ለ ዘይኮነ
ልማድ ሰብ ተከቲለ
ውሽጠይ ተረቲዐ ኢየ
ዘምልኸካ ኣቦየ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 2
ፍቅርካ ኣብ ደመይ ኣቲዩ
ከመይ ኢለ''ሞ ስቅ ክብል
ስምካ አንተ ዘይጸዋዕኩ
ልበይ ትብል ሸቀልቀል

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 3
☆☆☆☆☆☆☆
ህዋሳተይ ብሕብረት
ኣዋዲደ ብትግሃት
ቀትሪ ለይቲ ከይበልኩ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 4
ንስምኻ አንተ ዘመርኩ
ሓይለይ ኣይደክመንን''ዩ
ውሽጠይ ኣይጸግበካን''ዩ
መሊሱ "ኢየሱስ" ይበል

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 5
ኣይክአለሉን ስቅ ምባል
☆☆☆☆☆☆☆☆
ብሙሉ ልበይ ዝቀርቦ
ኩልንትናይ ዝህቦ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 6
ልዕሌካ ዝሰርዖ የልቦን
ብፍጹም''ውን ኣይሓስቦን
ምስጋናይ ኮነ ጸሎተይ
ጥበበይ ኮነ ድርሰተይ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 7
ትዘቅርቦ መስዋአተይ
ንዓኻ''ዩ ኣምላኸይ
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 8
ብሓቂ አንብርኸከልካ)²

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆',
        lyrics_transliteration = 'CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 1
Geromo''le zeykone
Limad seb teketile
Wisht’ey teretia iye
Zemlኸka aboye

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 2
Fiqrka ab demey atiyu
Kemey ile''mo siq kibl
Simka ante zeyts’ewaeku
Libey tibl sheqelqel

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 3
☆☆☆☆☆☆☆
Hiwasatey bihbret
Awadide bitghat
Qetri leyti keybelku

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 4
Nismኻ ante zemerku
Hayley aydekmenn''yu
Wisht’ey ayts’egbekan''yu
Melisu "Iyesus" yibel

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 5
Aykalelun siq mibal
☆☆☆☆☆☆☆☆
Bimulu libey ziqerbo
Kulntnay zihbo

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 6
Lieleka zisero yelbon
Bifts’um''win ayhasbon
Misganay kone ts’elotey
T’bebey kone dirsetey

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 7
Tizeqrbo meswaatey
Niaኻ''yu amlaኸy
(liel bel (kiber)² ableka
Bimenfes amlኸka

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 8
Bihaqi anbrኸkelka)²

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5004002e-cdd1-4c73-946e-c36fba052211'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 1
ገሮሞ''ለ ዘይኮነ
ልማድ ሰብ ተከቲለ
ውሽጠይ ተረቲዐ ኢየ
ዘምልኸካ ኣቦየ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 2
ፍቅርካ ኣብ ደመይ ኣቲዩ
ከመይ ኢለ''ሞ ስቅ ክብል
ስምካ አንተ ዘይጸዋዕኩ
ልበይ ትብል ሸቀልቀል

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 3
☆☆☆☆☆☆☆
ህዋሳተይ ብሕብረት
ኣዋዲደ ብትግሃት
ቀትሪ ለይቲ ከይበልኩ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 4
ንስምኻ አንተ ዘመርኩ
ሓይለይ ኣይደክመንን''ዩ
ውሽጠይ ኣይጸግበካን''ዩ
መሊሱ "ኢየሱስ" ይበል

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 5
ኣይክአለሉን ስቅ ምባል
☆☆☆☆☆☆☆☆
ብሙሉ ልበይ ዝቀርቦ
ኩልንትናይ ዝህቦ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 6
ልዕሌካ ዝሰርዖ የልቦን
ብፍጹም''ውን ኣይሓስቦን
ምስጋናይ ኮነ ጸሎተይ
ጥበበይ ኮነ ድርሰተይ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 7
ትዘቅርቦ መስዋአተይ
ንዓኻ''ዩ ኣምላኸይ
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 8
ብሓቂ አንብርኸከልካ)²

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5004002e-cdd1-4c73-946e-c36fba052211'::uuid, 'lel-bel-zemarit-kisanet-kbrom-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- o-kidus-mikael ("O Kidus Mikael")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4fed1e5e-9080-4813-bfb3-f5ac9c8167d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 1
እረቂቁ መላዕክ መብረቅ ተጎናጽፏል
ለሰማይ ሰራዊት አለቃቸው ሆኗል
የምክሩ አበጋዝ ስሙ የተፈራ
እሱ ነው ሚካኤል ለሕዝቡ የሚራራ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 2
እግዚአብሔር ኃይሉን የሚገልፅበት
ፀሎት የሚያሳርግ የሚያሰጥ ምህረት
ስለ ትህትናው ከአምላክ የተሾመው
ቅሩበ እግዚአብሔር ቅዱስ ሚካኤል ነው (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 3
እርህሩ ነው እና የነፍሳችን ወዳጅ
ለፍጥረቱ ሁሉ የታመነ አማላጅ
ከቅጥረ ፀሎቱ ነፍሳችን ትጠጋ
ተግቶ እንዲጠብቀን ሲመሽም ሲነጋ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 4
የነፀብራቅ ዝናር ሚካኤል ታጠቀ
በቅድመ እግዚአብሔር ሕዝቡን አስታረቀ
በእሳታዊው አክናፍ ከክፉ ጋረደ
ልጆቹን ሊባርክ ሚካኤል ወረደ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 1
Ereqiqu melaek mebreq tegonats’fwal
Lesemay serawit aleqachew honwal
Yemkru abegaz simu yetefera
Esu new Mikael lehzbu yemirara (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 2
Egziabher haylun yemigelts’bet
Ts’elot yemiyasarg yemiyaset’ mihret
Sile tihtnaw keamlak yeteshomew
Qirube Egziabher Kidus Mikael new (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 3
Erhru new ena yenefsachn wedaj
Left’retu hulu yetamene amalaj
Keqt’re ts’elotu nefsachn tit’ega
Tegto endit’ebqen simeshm sinega (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 4
Yenets’ebraq zinar Mikael tat’eqe
Beqdme Egziabher hizbun astareqe
Beesatawiw aknaf kekfu garede
Lijochun libark Mikael werede (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 1
እረቂቁ መላዕክ መብረቅ ተጎናጽፏል
ለሰማይ ሰራዊት አለቃቸው ሆኗል
የምክሩ አበጋዝ ስሙ የተፈራ
እሱ ነው ሚካኤል ለሕዝቡ የሚራራ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 2
እግዚአብሔር ኃይሉን የሚገልፅበት
ፀሎት የሚያሳርግ የሚያሰጥ ምህረት
ስለ ትህትናው ከአምላክ የተሾመው
ቅሩበ እግዚአብሔር ቅዱስ ሚካኤል ነው (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 3
እርህሩ ነው እና የነፍሳችን ወዳጅ
ለፍጥረቱ ሁሉ የታመነ አማላጅ
ከቅጥረ ፀሎቱ ነፍሳችን ትጠጋ
ተግቶ እንዲጠብቀን ሲመሽም ሲነጋ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 4
የነፀብራቅ ዝናር ሚካኤል ታጠቀ
በቅድመ እግዚአብሔር ሕዝቡን አስታረቀ
በእሳታዊው አክናፍ ከክፉ ጋረደ
ልጆቹን ሊባርክ ሚካኤል ወረደ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)',
        lyrics_transliteration = 'CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 1
Ereqiqu melaek mebreq tegonats’fwal
Lesemay serawit aleqachew honwal
Yemkru abegaz simu yetefera
Esu new Mikael lehzbu yemirara (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 2
Egziabher haylun yemigelts’bet
Ts’elot yemiyasarg yemiyaset’ mihret
Sile tihtnaw keamlak yeteshomew
Qirube Egziabher Kidus Mikael new (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 3
Erhru new ena yenefsachn wedaj
Left’retu hulu yetamene amalaj
Keqt’re ts’elotu nefsachn tit’ega
Tegto endit’ebqen simeshm sinega (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 4
Yenets’ebraq zinar Mikael tat’eqe
Beqdme Egziabher hizbun astareqe
Beesatawiw aknaf kekfu garede
Lijochun libark Mikael werede (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4fed1e5e-9080-4813-bfb3-f5ac9c8167d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 1
እረቂቁ መላዕክ መብረቅ ተጎናጽፏል
ለሰማይ ሰራዊት አለቃቸው ሆኗል
የምክሩ አበጋዝ ስሙ የተፈራ
እሱ ነው ሚካኤል ለሕዝቡ የሚራራ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 2
እግዚአብሔር ኃይሉን የሚገልፅበት
ፀሎት የሚያሳርግ የሚያሰጥ ምህረት
ስለ ትህትናው ከአምላክ የተሾመው
ቅሩበ እግዚአብሔር ቅዱስ ሚካኤል ነው (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 3
እርህሩ ነው እና የነፍሳችን ወዳጅ
ለፍጥረቱ ሁሉ የታመነ አማላጅ
ከቅጥረ ፀሎቱ ነፍሳችን ትጠጋ
ተግቶ እንዲጠብቀን ሲመሽም ሲነጋ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 4
የነፀብራቅ ዝናር ሚካኤል ታጠቀ
በቅድመ እግዚአብሔር ሕዝቡን አስታረቀ
በእሳታዊው አክናፍ ከክፉ ጋረደ
ልጆቹን ሊባርክ ሚካኤል ወረደ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4fed1e5e-9080-4813-bfb3-f5ac9c8167d5'::uuid, 'o-kidus-mikael', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemari-di-n-kedametsega-yohanis-simishin-siteraw-dinigil ("Zemari Di N Kedametsega Yohanis Simishin Siteraw Dinigil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f89682df-9158-48bf-b938-99a2430e8335'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 1
ትውልድ ነኝና ልጅሽ የፈጠረኝ
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዛቤር ባባቶቼ ፀጋ
ሳሊለነ እላለው ሲነሽም ሲነጋ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 2
በጠየቅሽው ጊዜ ወይኑን እንዲመላ
አክብሮሻልና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈፀም ሳመሰግንሽ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 3
በሰላምታ ድምፅሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በአብይ ቃል ጮሄ ልመስክር በብርቱ
ቅድስት ድንግል ማርያም የእግዚአብሄር እናቱ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 4
ከሰማይ ሲገኝ ነው አንችን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅድስ
ማርያም ህይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነው ምስጢሩ አንችን ማመስገኔ።

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 1
Tiwld negnna lijsh yefet’eregn
Dingil Emebete lanchi misgana alegn
Befeqade egzaber babatoche ts’ega
Salilene elalew sineshm sinega

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 2
Bet’eyeqshw gize weynun endimela
Akbroshalna beqana gelila
Yeselam enat hoy selam libelsh
Zemene yifets’em samesegnsh

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 3
Beselamta dimts’sh menfes temelche
Adegdge liqum ejochen zergche
Beaby qal ch’ohe limeskr bebrtu
Kidist Dingil Maryam yeegziabher enatu

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 4
Kesemay sigegn new anchn mawedes
Sigelet’ sifeqed kemenfes qids
Maryam hiywete nesh miknyat lemedane
Bizu new mist’iru anchn mamesgene.

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 1
ትውልድ ነኝና ልጅሽ የፈጠረኝ
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዛቤር ባባቶቼ ፀጋ
ሳሊለነ እላለው ሲነሽም ሲነጋ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 2
በጠየቅሽው ጊዜ ወይኑን እንዲመላ
አክብሮሻልና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈፀም ሳመሰግንሽ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 3
በሰላምታ ድምፅሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በአብይ ቃል ጮሄ ልመስክር በብርቱ
ቅድስት ድንግል ማርያም የእግዚአብሄር እናቱ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 4
ከሰማይ ሲገኝ ነው አንችን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅድስ
ማርያም ህይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነው ምስጢሩ አንችን ማመስገኔ።

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም',
        lyrics_transliteration = 'CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 1
Tiwld negnna lijsh yefet’eregn
Dingil Emebete lanchi misgana alegn
Befeqade egzaber babatoche ts’ega
Salilene elalew sineshm sinega

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 2
Bet’eyeqshw gize weynun endimela
Akbroshalna beqana gelila
Yeselam enat hoy selam libelsh
Zemene yifets’em samesegnsh

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 3
Beselamta dimts’sh menfes temelche
Adegdge liqum ejochen zergche
Beaby qal ch’ohe limeskr bebrtu
Kidist Dingil Maryam yeegziabher enatu

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 4
Kesemay sigegn new anchn mawedes
Sigelet’ sifeqed kemenfes qids
Maryam hiywete nesh miknyat lemedane
Bizu new mist’iru anchn mamesgene.

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f89682df-9158-48bf-b938-99a2430e8335'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 1
ትውልድ ነኝና ልጅሽ የፈጠረኝ
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዛቤር ባባቶቼ ፀጋ
ሳሊለነ እላለው ሲነሽም ሲነጋ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 2
በጠየቅሽው ጊዜ ወይኑን እንዲመላ
አክብሮሻልና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈፀም ሳመሰግንሽ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 3
በሰላምታ ድምፅሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በአብይ ቃል ጮሄ ልመስክር በብርቱ
ቅድስት ድንግል ማርያም የእግዚአብሄር እናቱ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 4
ከሰማይ ሲገኝ ነው አንችን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅድስ
ማርያም ህይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነው ምስጢሩ አንችን ማመስገኔ።

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f89682df-9158-48bf-b938-99a2430e8335'::uuid, 'zemari-di-n-kedametsega-yohanis-simishin-siteraw-dinigil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- andebetiem-yawta ("Andebetiem Yawta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e87145fe-8002-424e-8696-348a5b79696d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋራ ስዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገሥታት ቢቆጡም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃሌዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 1
Wet’med tesebere enem amelet’kugn
Kehat’iat filats’a kemot aterefegn
Yeanabstun af behaylu yezega
Yedannel amlak yinoral kegna ga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 2
Bedawit misgana beyared zimare
Keqdusan gara sizemr abre
Ersun samesegn melkol bitsqbgn
Legetaye kibir ezemralehugn

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 3
Asferiw nebelbal esatu binedm
Let’aot endsegd negestat biqot’um
Hulum bitewegnm bit’elagnm alem
Ts’nat yihonegnal Geta medhalealem

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 4
Wet’med tesebere enem amelet’kugn
Kehat’iat filats’a kemot aterefegn
Yeanabstun af behaylu yezega
Yedannel amlak yinoral kegna ga

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
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋራ ስዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገሥታት ቢቆጡም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃሌዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ',
        lyrics_transliteration = 'CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 1
Wet’med tesebere enem amelet’kugn
Kehat’iat filats’a kemot aterefegn
Yeanabstun af behaylu yezega
Yedannel amlak yinoral kegna ga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 2
Bedawit misgana beyared zimare
Keqdusan gara sizemr abre
Ersun samesegn melkol bitsqbgn
Legetaye kibir ezemralehugn

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 3
Asferiw nebelbal esatu binedm
Let’aot endsegd negestat biqot’um
Hulum bitewegnm bit’elagnm alem
Ts’nat yihonegnal Geta medhalealem

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 4
Wet’med tesebere enem amelet’kugn
Kehat’iat filats’a kemot aterefegn
Yeanabstun af behaylu yezega
Yedannel amlak yinoral kegna ga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e87145fe-8002-424e-8696-348a5b79696d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋራ ስዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገሥታት ቢቆጡም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃሌዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e87145fe-8002-424e-8696-348a5b79696d'::uuid, 'andebetiem-yawta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian-orthodox-tewahdo-mezmur ("Ethiopian Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '515f0fa7-f6a6-4cf2-8319-af29ed21f6c5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 1
የሕይወት እስትንፋስ ዘራብን ሕያው እንድንሆን
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለ ማይነገር ስጦታው እግዚአብሄር ይመስገን፤

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 2
ነፋስን ገስፆ ማዕበል አቁሞ ሚያሻግር
የዓለም ፈተና ቢበዛ እሱ መጠጊያችን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 3
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ ሰላምን ለሰጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን፤

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 4
ከሲኦል እስራት ተፈተን ነጻ የወጣንበት
ሕይወትን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 1
Yehywet estnfas zerabn hiyaw endnhon
Yihn yaderege amlakachn Egziabher yemesgen
Sile mayneger sit’otaw egziabher yimesgen;

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 2
Nefasn gests’o maebel aqumo miyashagr
Yealem fetena bibeza esu met’egiyachn
Sile mayneger sit’otaw Egziabher yemesgen

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 3
Dagm endanmot bemotu motn yeretaln
Yemnmekabet tinsae selamn leset’en
Sile mayneger sit’otaw Egziabher yimesgen;

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 4
Kesiol esrat tefeten nets’a yewet’anbet
Hiywetn leset’en leamlakachn enzemr beewnet
Sile mayneger sit’otaw Egziabher yemesgen

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 1
የሕይወት እስትንፋስ ዘራብን ሕያው እንድንሆን
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለ ማይነገር ስጦታው እግዚአብሄር ይመስገን፤

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 2
ነፋስን ገስፆ ማዕበል አቁሞ ሚያሻግር
የዓለም ፈተና ቢበዛ እሱ መጠጊያችን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 3
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ ሰላምን ለሰጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን፤

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 4
ከሲኦል እስራት ተፈተን ነጻ የወጣንበት
ሕይወትን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤',
        lyrics_transliteration = 'CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 1
Yehywet estnfas zerabn hiyaw endnhon
Yihn yaderege amlakachn Egziabher yemesgen
Sile mayneger sit’otaw egziabher yimesgen;

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 2
Nefasn gests’o maebel aqumo miyashagr
Yealem fetena bibeza esu met’egiyachn
Sile mayneger sit’otaw Egziabher yemesgen

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 3
Dagm endanmot bemotu motn yeretaln
Yemnmekabet tinsae selamn leset’en
Sile mayneger sit’otaw Egziabher yimesgen;

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 4
Kesiol esrat tefeten nets’a yewet’anbet
Hiywetn leset’en leamlakachn enzemr beewnet
Sile mayneger sit’otaw Egziabher yemesgen

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;',
        updated_at = clock_timestamp()::text
    WHERE import_id = '515f0fa7-f6a6-4cf2-8319-af29ed21f6c5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 1
የሕይወት እስትንፋስ ዘራብን ሕያው እንድንሆን
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለ ማይነገር ስጦታው እግዚአብሄር ይመስገን፤

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 2
ነፋስን ገስፆ ማዕበል አቁሞ ሚያሻግር
የዓለም ፈተና ቢበዛ እሱ መጠጊያችን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 3
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ ሰላምን ለሰጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን፤

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 4
ከሲኦል እስራት ተፈተን ነጻ የወጣንበት
ሕይወትን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '515f0fa7-f6a6-4cf2-8319-af29ed21f6c5'::uuid, 'ethiopian-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beekifish-dinigil ("Beekifish Dinigil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a6e2e077-e7c0-4dc3-b235-2f27854d236a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 1
ገና ከህፃንነት ስወጣ ከማህፀን
ስምሽ የተፃፈው ከአንደበቴ ማዕዘን
በኮልታፋ ቃላት ስጠራሽ አድጌ
ዛሬም ይኸው አለኹ ላንቺ አደግድጌ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 2
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ
በቀን በጨለማ ስምሽ ያፅናናኛል
ከመከራ እንዳልፍ ብርታቴ ሆኖኛል

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 3
ሞገስ ነሽ ማርያም ሁሌ በሄድኩበት
ሳልጠራሽ አይመሽም ድንግል የልቤ እረፍት
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 4
አንቺን እናት አርጎ ለሰጠኝ ፈጣሪ
ልጅነቴን ባርኮ ላቆመኝ መሐሪ
አንደበት ሆነሽኝ ውዳሴን ላስማማ
ቸርነቱን አየሁ ድምፅሽን ስሰማ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 5
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 1
Gena kehts’annet siwet’a kemahts’en
Simsh yetets’afew keandebete maezen
Bekoltafa qalat sit’erash adge
Zarem yiኸw aleኹ lanchi adegdge

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 2
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu
Beqen bech’elema simsh yats’nanagnal
Kemekera endalf birtate honognal

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 3
Moges nesh Maryam hule behedkubet
Salt’erash aymeshm Dingil yelbe ereft
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 4
Anchin enat argo leset’egn fet’ari
Lijneten barko laqomegn meheri
Andebet honeshgn widasen lasmama
Chernetun ayehu dimts’shn sisema

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 5
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 1
ገና ከህፃንነት ስወጣ ከማህፀን
ስምሽ የተፃፈው ከአንደበቴ ማዕዘን
በኮልታፋ ቃላት ስጠራሽ አድጌ
ዛሬም ይኸው አለኹ ላንቺ አደግድጌ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 2
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ
በቀን በጨለማ ስምሽ ያፅናናኛል
ከመከራ እንዳልፍ ብርታቴ ሆኖኛል

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 3
ሞገስ ነሽ ማርያም ሁሌ በሄድኩበት
ሳልጠራሽ አይመሽም ድንግል የልቤ እረፍት
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 4
አንቺን እናት አርጎ ለሰጠኝ ፈጣሪ
ልጅነቴን ባርኮ ላቆመኝ መሐሪ
አንደበት ሆነሽኝ ውዳሴን ላስማማ
ቸርነቱን አየሁ ድምፅሽን ስሰማ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 5
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ',
        lyrics_transliteration = 'CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 1
Gena kehts’annet siwet’a kemahts’en
Simsh yetets’afew keandebete maezen
Bekoltafa qalat sit’erash adge
Zarem yiኸw aleኹ lanchi adegdge

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 2
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu
Beqen bech’elema simsh yats’nanagnal
Kemekera endalf birtate honognal

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 3
Moges nesh Maryam hule behedkubet
Salt’erash aymeshm Dingil yelbe ereft
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 4
Anchin enat argo leset’egn fet’ari
Lijneten barko laqomegn meheri
Andebet honeshgn widasen lasmama
Chernetun ayehu dimts’shn sisema

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 5
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a6e2e077-e7c0-4dc3-b235-2f27854d236a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 1
ገና ከህፃንነት ስወጣ ከማህፀን
ስምሽ የተፃፈው ከአንደበቴ ማዕዘን
በኮልታፋ ቃላት ስጠራሽ አድጌ
ዛሬም ይኸው አለኹ ላንቺ አደግድጌ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 2
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ
በቀን በጨለማ ስምሽ ያፅናናኛል
ከመከራ እንዳልፍ ብርታቴ ሆኖኛል

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 3
ሞገስ ነሽ ማርያም ሁሌ በሄድኩበት
ሳልጠራሽ አይመሽም ድንግል የልቤ እረፍት
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 4
አንቺን እናት አርጎ ለሰጠኝ ፈጣሪ
ልጅነቴን ባርኮ ላቆመኝ መሐሪ
አንደበት ሆነሽኝ ውዳሴን ላስማማ
ቸርነቱን አየሁ ድምፅሽን ስሰማ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 5
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a6e2e077-e7c0-4dc3-b235-2f27854d236a'::uuid, 'beekifish-dinigil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- track-1829 ("Track")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '60653974-1135-4ef0-bee2-781e142420c2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 1
ቤተ ሣይዳ ላለች ከመቅደስ ላኖርካት
በበደል ለምናዝን ምህረትን ፍለጋ
በንስሐ ማረን ከዓራተ ዝንጋኤ ከኃጥያት አልጋ
በጠበሉ ደጃፍ ለፀኑት የሚላክ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 2
ለቀድሶተ ማይ የሚወርደው መልዐክ
በመንገድ ጠብቆ ሞትን የሚያሳልፍ
ዛሬም ይድረስልን ቀድመው ከገቡት ጋር ነፍሳችን እንድታርፍ
አልጋው ተሸክሞት ደክሞ ለሚጨነቅ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 3
አልጋን አሸክመህ ህመም የምታርቅ
ደዌያችንን ነስተህ ቆስለህ የምትፈውስ
የመፃጕዕ ረዳት የነፍሳት መጠጊያ መድኃኒት ክርስቶስ
የባሰ እንዳያየው ቃሉን ያልጠበቀ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 4
እጁን ሰዶ ፀፍቶ ከደዌው ታረቀ
ሰንበትን የሻረ ከሚሉት እንዳንውል
ለትንሳኤው ደስታ የሰንበትን ጌታ ዓርብን እንከተል
ዘማሪ ዲ/ን ቀዳሜፀጋ ዮሐንስ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 1
Bete sayda lalech kemeqdes lanorkat
Bebedel lemnazn mihretn filega
Benshe maren kearate zingae kehat’yat alga
Bet’ebelu dejaf lets’enut yemilak

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 2
Leqedsote may yemiwerdew melak
Bemenged t’ebqo motn yemiyasalf
Zarem yidresln qedmew kegebut gar nefsachn endtarf
Algaw teshekmot dekmo lemich’eneq

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 3
Algan ashekmeh himem yemtarq
Deweyachnn nesteh qosleh yemtfews
Yemets’agwe redat yenefsat met’egiya medhanit Kristos
Yebase endayayew qalun yalt’ebeqe

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 4
Ejun sedo ts’efto kedewew tareqe
Senbetn yeshare kemilut endanwl
Letnsaew desta yesenbetn Geta arbn enketel
Zemari di/n qedamets’ega yohens

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 1
ቤተ ሣይዳ ላለች ከመቅደስ ላኖርካት
በበደል ለምናዝን ምህረትን ፍለጋ
በንስሐ ማረን ከዓራተ ዝንጋኤ ከኃጥያት አልጋ
በጠበሉ ደጃፍ ለፀኑት የሚላክ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 2
ለቀድሶተ ማይ የሚወርደው መልዐክ
በመንገድ ጠብቆ ሞትን የሚያሳልፍ
ዛሬም ይድረስልን ቀድመው ከገቡት ጋር ነፍሳችን እንድታርፍ
አልጋው ተሸክሞት ደክሞ ለሚጨነቅ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 3
አልጋን አሸክመህ ህመም የምታርቅ
ደዌያችንን ነስተህ ቆስለህ የምትፈውስ
የመፃጕዕ ረዳት የነፍሳት መጠጊያ መድኃኒት ክርስቶስ
የባሰ እንዳያየው ቃሉን ያልጠበቀ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 4
እጁን ሰዶ ፀፍቶ ከደዌው ታረቀ
ሰንበትን የሻረ ከሚሉት እንዳንውል
ለትንሳኤው ደስታ የሰንበትን ጌታ ዓርብን እንከተል
ዘማሪ ዲ/ን ቀዳሜፀጋ ዮሐንስ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት',
        lyrics_transliteration = 'CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 1
Bete sayda lalech kemeqdes lanorkat
Bebedel lemnazn mihretn filega
Benshe maren kearate zingae kehat’yat alga
Bet’ebelu dejaf lets’enut yemilak

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 2
Leqedsote may yemiwerdew melak
Bemenged t’ebqo motn yemiyasalf
Zarem yidresln qedmew kegebut gar nefsachn endtarf
Algaw teshekmot dekmo lemich’eneq

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 3
Algan ashekmeh himem yemtarq
Deweyachnn nesteh qosleh yemtfews
Yemets’agwe redat yenefsat met’egiya medhanit Kristos
Yebase endayayew qalun yalt’ebeqe

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 4
Ejun sedo ts’efto kedewew tareqe
Senbetn yeshare kemilut endanwl
Letnsaew desta yesenbetn Geta arbn enketel
Zemari di/n qedamets’ega yohens

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '60653974-1135-4ef0-bee2-781e142420c2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 1
ቤተ ሣይዳ ላለች ከመቅደስ ላኖርካት
በበደል ለምናዝን ምህረትን ፍለጋ
በንስሐ ማረን ከዓራተ ዝንጋኤ ከኃጥያት አልጋ
በጠበሉ ደጃፍ ለፀኑት የሚላክ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 2
ለቀድሶተ ማይ የሚወርደው መልዐክ
በመንገድ ጠብቆ ሞትን የሚያሳልፍ
ዛሬም ይድረስልን ቀድመው ከገቡት ጋር ነፍሳችን እንድታርፍ
አልጋው ተሸክሞት ደክሞ ለሚጨነቅ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 3
አልጋን አሸክመህ ህመም የምታርቅ
ደዌያችንን ነስተህ ቆስለህ የምትፈውስ
የመፃጕዕ ረዳት የነፍሳት መጠጊያ መድኃኒት ክርስቶስ
የባሰ እንዳያየው ቃሉን ያልጠበቀ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 4
እጁን ሰዶ ፀፍቶ ከደዌው ታረቀ
ሰንበትን የሻረ ከሚሉት እንዳንውል
ለትንሳኤው ደስታ የሰንበትን ጌታ ዓርብን እንከተል
ዘማሪ ዲ/ን ቀዳሜፀጋ ዮሐንስ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '60653974-1135-4ef0-bee2-781e142420c2'::uuid, 'track-1829', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beene-bitekurim-semay ("Beene Bitekurim Semay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f8a518fd-5fc9-423f-87e7-14837de61f29'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 1
እርሱን ታምኜ እወጣለሁ
እርሱን ታመኜ እገባልሁ
ድብቅ ሰራዊት አለው ለኔ
የሚጠበቀኝ በዘመኔ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 2
እግዚአብሄር ለእኔ ብርሃኔ ነው
የሚአስደነግጠኝ የሚያስፈራኝ ማነው

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 3
ሰው አልባ ሆኜ በስደት
ወዳጅ የሆነኝ የኔ አባት
ክርስቶስ ለእኔ ሕይወቴ ነው
እርሱን ታምኜ እኖራልሁ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 4
የለም የሚያስፈራኝ በዘመኔ
ብርሃን ነውና እግዚአብሔር ለእኔ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 5
መች ይሰጠኛል ለጠላት
አይሰለጥንም በእኔ ሞት
የሚጠብቀኝ ጌታ ነው
የትኛው ጠላት ሊደፍረው

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 6
በቤቴ መቃን ላይ ደም ይታያል
እኔን ከእግዚአብሔር ከቶ ማን ይለያል

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 7
ይኧው አቆመኝ በመቅደሱ
እየጠበቀ በመንፈሱ
እኔን ሊያከበር ራሱን ሰጥቶ
ገዝቶኛል ጌታ ሞቴን ሞቶ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 8
ይገዛ ለስሙ ስጋ መንፈሴ
በእርሱ ነውና ለዛሬ መድረሴ
አዝ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 1
Ersun tamgne ewet’alehu
Ersun tamegne egebalhu
Dibq serawit alew lene
Yemit’ebeqegn bezemene

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 2
Egziabher leene birhane new
Yemiasdenegt’egn yemiyasferagn manew

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 3
Sew alba hogne besdet
Wedaj yehonegn yene abat
Kristos leene hiywete new
Ersun tamgne enoralhu

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 4
Yelem yemiyasferagn bezemene
Birhan newna Egziabher leene

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 5
Mech yiset’egnal let’elat
Ayselet’nm beene mot
Yemit’ebqegn Geta new
Yetgnaw t’elat lidefrew

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 6
Bebete meqan lay dem yitayal
Enen keegziabher keto man yileyal

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 7
Yiኧw aqomegn bemeqdesu
Eyet’ebeqe bemenfesu
Enen liyakeber rasun set’to
Geztognal Geta moten moto

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 8
Yigeza lesmu siga menfese
Beersu newna lezare medrese
CHORUS

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 1
እርሱን ታምኜ እወጣለሁ
እርሱን ታመኜ እገባልሁ
ድብቅ ሰራዊት አለው ለኔ
የሚጠበቀኝ በዘመኔ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 2
እግዚአብሄር ለእኔ ብርሃኔ ነው
የሚአስደነግጠኝ የሚያስፈራኝ ማነው

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 3
ሰው አልባ ሆኜ በስደት
ወዳጅ የሆነኝ የኔ አባት
ክርስቶስ ለእኔ ሕይወቴ ነው
እርሱን ታምኜ እኖራልሁ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 4
የለም የሚያስፈራኝ በዘመኔ
ብርሃን ነውና እግዚአብሔር ለእኔ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 5
መች ይሰጠኛል ለጠላት
አይሰለጥንም በእኔ ሞት
የሚጠብቀኝ ጌታ ነው
የትኛው ጠላት ሊደፍረው

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 6
በቤቴ መቃን ላይ ደም ይታያል
እኔን ከእግዚአብሔር ከቶ ማን ይለያል

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 7
ይኧው አቆመኝ በመቅደሱ
እየጠበቀ በመንፈሱ
እኔን ሊያከበር ራሱን ሰጥቶ
ገዝቶኛል ጌታ ሞቴን ሞቶ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 8
ይገዛ ለስሙ ስጋ መንፈሴ
በእርሱ ነውና ለዛሬ መድረሴ
አዝ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)',
        lyrics_transliteration = 'CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 1
Ersun tamgne ewet’alehu
Ersun tamegne egebalhu
Dibq serawit alew lene
Yemit’ebeqegn bezemene

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 2
Egziabher leene birhane new
Yemiasdenegt’egn yemiyasferagn manew

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 3
Sew alba hogne besdet
Wedaj yehonegn yene abat
Kristos leene hiywete new
Ersun tamgne enoralhu

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 4
Yelem yemiyasferagn bezemene
Birhan newna Egziabher leene

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 5
Mech yiset’egnal let’elat
Ayselet’nm beene mot
Yemit’ebqegn Geta new
Yetgnaw t’elat lidefrew

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 6
Bebete meqan lay dem yitayal
Enen keegziabher keto man yileyal

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 7
Yiኧw aqomegn bemeqdesu
Eyet’ebeqe bemenfesu
Enen liyakeber rasun set’to
Geztognal Geta moten moto

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 8
Yigeza lesmu siga menfese
Beersu newna lezare medrese
CHORUS

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f8a518fd-5fc9-423f-87e7-14837de61f29'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)
እርሱን ታምኜ እወጣለሁ
እርሱን ታመኜ እገባልሁ
ድብቅ ሰራዊት አለው ለኔ
የሚጠበቀኝ በዘመኔ
እግዚአብሄር ለእኔ ብርሃኔ ነው
የሚአስደነግጠኝ የሚያስፈራኝ ማነው
አዝ...
ሰው አልባ ሆኜ በስደት
ወዳጅ የሆነኝ የኔ አባት
ክርስቶስ ለእኔ ሕይወቴ ነው
እርሱን ታምኜ እኖራልሁ
የለም የሚያስፈራኝ በዘመኔ
ብርሃን ነውና እግዚአብሔር ለእኔ
አዝ...
መች ይሰጠኛል ለጠላት
አይሰለጥንም በእኔ ሞት
የሚጠብቀኝ ጌታ ነው
የትኛው ጠላት ሊደፍረው
በቤቴ መቃን ላይ ደም ይታያል
እኔን ከእግዚአብሔር ከቶ ማን ይለያል
አዝ...
ይኧው አቆመኝ በመቅደሱ
እየጠበቀ በመንፈሱ
እኔን ሊያከበር ራሱን ሰጥቶ
ገዝቶኛል ጌታ ሞቴን ሞቶ
ይገዛ ለስሙ ስጋ መንፈሴ
በእርሱ ነውና ለዛሬ መድረሴ
አዝ...❤

VERSE 1
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)
እርሱን ታምኜ እወጣለሁ
እርሱን ታመኜ እገባልሁ
ድብቅ ሰራዊት አለው ለኔ
የሚጠበቀኝ በዘመኔ
እግዚአብሄር ለእኔ ብርሃኔ ነው
የሚአስደነግጠኝ የሚያስፈራኝ ማነው
አዝ...
ሰው አልባ ሆኜ በስደት
ወዳጅ የሆነኝ የኔ አባት
ክርስቶስ ለእኔ ሕይወቴ ነው
እርሱን ታምኜ እኖራልሁ
የለም የሚያስፈራኝ በዘመኔ
ብርሃን ነውና እግዚአብሔር ለእኔ
አዝ...
መች ይሰጠኛል ለጠላት
አይሰለጥንም በእኔ ሞት
የሚጠብቀኝ ጌታ ነው
የትኛው ጠላት ሊደፍረው
በቤቴ መቃን ላይ ደም ይታያል
እኔን ከእግዚአብሔር ከቶ ማን ይለያል
አዝ...
ይኧው አቆመኝ በመቅደሱ
እየጠበቀ በመንፈሱ
እኔን ሊያከበር ራሱን ሰጥቶ
ገዝቶኛል ጌታ ሞቴን ሞቶ
ይገዛ ለስሙ ስጋ መንፈሴ
በእርሱ ነውና ለዛሬ መድረሴ
አዝ...❤

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)
እርሱን ታምኜ እወጣለሁ
እርሱን ታመኜ እገባልሁ
ድብቅ ሰራዊት አለው ለኔ
የሚጠበቀኝ በዘመኔ
እግዚአብሄር ለእኔ ብርሃኔ ነው
የሚአስደነግጠኝ የሚያስፈራኝ ማነው
አዝ...
ሰው አልባ ሆኜ በስደት
ወዳጅ የሆነኝ የኔ አባት
ክርስቶስ ለእኔ ሕይወቴ ነው
እርሱን ታምኜ እኖራልሁ
የለም የሚያስፈራኝ በዘመኔ
ብርሃን ነውና እግዚአብሔር ለእኔ
አዝ...
መች ይሰጠኛል ለጠላት
አይሰለጥንም በእኔ ሞት
የሚጠብቀኝ ጌታ ነው
የትኛው ጠላት ሊደፍረው
በቤቴ መቃን ላይ ደም ይታያል
እኔን ከእግዚአብሔር ከቶ ማን ይለያል
አዝ...
ይኧው አቆመኝ በመቅደሱ
እየጠበቀ በመንፈሱ
እኔን ሊያከበር ራሱን ሰጥቶ
ገዝቶኛል ጌታ ሞቴን ሞቶ
ይገዛ ለስሙ ስጋ መንፈሴ
በእርሱ ነውና ለዛሬ መድረሴ
አዝ...❤'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f8a518fd-5fc9-423f-87e7-14837de61f29'::uuid, 'beene-bitekurim-semay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyam-dinigil ("Mariyam Dinigil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '234eb779-7d95-42b9-aa78-c448f44c3fcb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 1
በክንፎችሽ ጋርደሽ ሰውረሽ ከመአት
ቃሉን ተመግበን ፍቅሩን ተረድተን
ልጆችሽ ለመሆን ምልጃሽ እረዳን
ማርያም እንወድሻለን።

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 2
እኛ ልጆችሽን በፍቅር ሰብስበሽ
በሀዘን በደስታ ከኛ ጋር ሆነሽ
ማእበሉ ቆሞ ወጀቡን አልፈን
በልጅሽ ቸርነት ለዚህች ቀን በቃን

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 3
ማርያም እንወድሻለን።
እናቅርብ ምስጋና እንዘምር ዝማሬ
ለነገስታት ንጉስ ለማሕጸንሽ ፍሬ
ድንግል የአምላክ እናት እናወድስሽ

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 4
ቃላት አይገልጸውም ልዩ ነው ፍቅርሽ
ማርያም እንወድሻለን።

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 1
Beknfochsh gardesh sewresh kemeat
Qalun temegben fiqrun teredten
Lijochsh lemehon miljash eredan
Maryam enwedshalen.

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 2
Egna lijochshn befqr sebsbesh
Behezen bedesta kegna gar honesh
Maebelu qomo wejebun alfen
Beljsh chernet lezihch qen beqan

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 3
Maryam enwedshalen.
Enaqrb misgana enzemr zimare
Lenegestat nigus lemahts’ensh fire
Dingil yeamlak enat enawedssh

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 4
Qalat aygelts’ewm liyu new fiqrsh
Maryam enwedshalen.

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 1
በክንፎችሽ ጋርደሽ ሰውረሽ ከመአት
ቃሉን ተመግበን ፍቅሩን ተረድተን
ልጆችሽ ለመሆን ምልጃሽ እረዳን
ማርያም እንወድሻለን።

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 2
እኛ ልጆችሽን በፍቅር ሰብስበሽ
በሀዘን በደስታ ከኛ ጋር ሆነሽ
ማእበሉ ቆሞ ወጀቡን አልፈን
በልጅሽ ቸርነት ለዚህች ቀን በቃን

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 3
ማርያም እንወድሻለን።
እናቅርብ ምስጋና እንዘምር ዝማሬ
ለነገስታት ንጉስ ለማሕጸንሽ ፍሬ
ድንግል የአምላክ እናት እናወድስሽ

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 4
ቃላት አይገልጸውም ልዩ ነው ፍቅርሽ
ማርያም እንወድሻለን።

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት',
        lyrics_transliteration = 'CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 1
Beknfochsh gardesh sewresh kemeat
Qalun temegben fiqrun teredten
Lijochsh lemehon miljash eredan
Maryam enwedshalen.

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 2
Egna lijochshn befqr sebsbesh
Behezen bedesta kegna gar honesh
Maebelu qomo wejebun alfen
Beljsh chernet lezihch qen beqan

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 3
Maryam enwedshalen.
Enaqrb misgana enzemr zimare
Lenegestat nigus lemahts’ensh fire
Dingil yeamlak enat enawedssh

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 4
Qalat aygelts’ewm liyu new fiqrsh
Maryam enwedshalen.

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '234eb779-7d95-42b9-aa78-c448f44c3fcb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 1
በክንፎችሽ ጋርደሽ ሰውረሽ ከመአት
ቃሉን ተመግበን ፍቅሩን ተረድተን
ልጆችሽ ለመሆን ምልጃሽ እረዳን
ማርያም እንወድሻለን።

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 2
እኛ ልጆችሽን በፍቅር ሰብስበሽ
በሀዘን በደስታ ከኛ ጋር ሆነሽ
ማእበሉ ቆሞ ወጀቡን አልፈን
በልጅሽ ቸርነት ለዚህች ቀን በቃን

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 3
ማርያም እንወድሻለን።
እናቅርብ ምስጋና እንዘምር ዝማሬ
ለነገስታት ንጉስ ለማሕጸንሽ ፍሬ
ድንግል የአምላክ እናት እናወድስሽ

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 4
ቃላት አይገልጸውም ልዩ ነው ፍቅርሽ
ማርያም እንወድሻለን።

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '234eb779-7d95-42b9-aa78-c448f44c3fcb'::uuid, 'mariyam-dinigil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beegiziabiherina-besew ("Beegiziabiherina Besew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a9614b15-7c10-473f-82cd-3c98a2ebe060'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 1
በምድር ተገልጦ የሰማዩን እዉነት የነገረን
ከፍ ከፍ ያለ ሊቀ ካህናት በሰማያት አለን
ከሀጥያት በቀር በነገሮች ሁሉ የተፈተኖ
አልፎ የገባ ወዳጅ አለን ተቀዳሚ ሆኖ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 2
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 3
ወንድሞች ብሎ እንዲጠራን የማያፍርብን
በድካማችን የሚራራ ሊቀ ካህን አለን
ከዘላለም ሞት ያስመለጠን ባፈሰሰው ደም
ስሙ ይቀደስ ፋሲካችን መድኃኔዓለም

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 4
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 5
ፅድቅ ሊሆነን ስላልቻለ የራሳችን ፅድቅ
በመስቀል ዋለ ከአባቱ ጋር እኛን ሊያስታርቅ
ሞትን ድል አርጎ በግርማው ቀኝ ያለው በመንግስቱ
የቀደመልን ስሙ ይክበር ሊቀ ካህናቱ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 6
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 7
እንደ ኢየሱስ ያለ ወዴት አለ በሰማይ በምድር
በደሙ የናደ ያፈረሰ የጠላትን ምክር
ይህንን እዉነት እንዳናቀል ፀጋው ትደግፈን
የልቦናችን አይን ይብራ ማዳኑ እንዳታልፈን

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 8
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 1
Bemdr tegelt’o yesemayun ewunet yenegeren
Kef kef yale liqe kahnat besemayat alen
Kehet’yat beqer benegeroch hulu yetefeteno
Alfo yegeba wedaj alen teqedami hono

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 2
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 3
Wendmoch bilo endit’eran yemayafrbn
Bedkamachn yemirara liqe kahn alen
Kezelalem mot yasmelet’en bafesesew dem
Simu yiqedes fasikachn Medhanealem

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 4
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 5
Ts’dq lihonen silalchale yerasachn ts’dq
Bemesqel wale keabatu gar egnan liyastarq
Motn dil argo begrmaw qegn yalew bemengstu
Yeqedemeln simu yikber liqe kahnatu

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 6
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 7
Ende Iyesus yale wedet ale besemay bemdr
Bedemu yenade yaferese yet’elatn mikr
Yihnn ewunet endanaqel ts’egaw tidegfen
Yelbonachn ayn yibra madanu endatalfen

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 8
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 1
በምድር ተገልጦ የሰማዩን እዉነት የነገረን
ከፍ ከፍ ያለ ሊቀ ካህናት በሰማያት አለን
ከሀጥያት በቀር በነገሮች ሁሉ የተፈተኖ
አልፎ የገባ ወዳጅ አለን ተቀዳሚ ሆኖ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 2
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 3
ወንድሞች ብሎ እንዲጠራን የማያፍርብን
በድካማችን የሚራራ ሊቀ ካህን አለን
ከዘላለም ሞት ያስመለጠን ባፈሰሰው ደም
ስሙ ይቀደስ ፋሲካችን መድኃኔዓለም

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 4
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 5
ፅድቅ ሊሆነን ስላልቻለ የራሳችን ፅድቅ
በመስቀል ዋለ ከአባቱ ጋር እኛን ሊያስታርቅ
ሞትን ድል አርጎ በግርማው ቀኝ ያለው በመንግስቱ
የቀደመልን ስሙ ይክበር ሊቀ ካህናቱ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 6
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 7
እንደ ኢየሱስ ያለ ወዴት አለ በሰማይ በምድር
በደሙ የናደ ያፈረሰ የጠላትን ምክር
ይህንን እዉነት እንዳናቀል ፀጋው ትደግፈን
የልቦናችን አይን ይብራ ማዳኑ እንዳታልፈን

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 8
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው',
        lyrics_transliteration = 'CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 1
Bemdr tegelt’o yesemayun ewunet yenegeren
Kef kef yale liqe kahnat besemayat alen
Kehet’yat beqer benegeroch hulu yetefeteno
Alfo yegeba wedaj alen teqedami hono

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 2
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 3
Wendmoch bilo endit’eran yemayafrbn
Bedkamachn yemirara liqe kahn alen
Kezelalem mot yasmelet’en bafesesew dem
Simu yiqedes fasikachn Medhanealem

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 4
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 5
Ts’dq lihonen silalchale yerasachn ts’dq
Bemesqel wale keabatu gar egnan liyastarq
Motn dil argo begrmaw qegn yalew bemengstu
Yeqedemeln simu yikber liqe kahnatu

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 6
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 7
Ende Iyesus yale wedet ale besemay bemdr
Bedemu yenade yaferese yet’elatn mikr
Yihnn ewunet endanaqel ts’egaw tidegfen
Yelbonachn ayn yibra madanu endatalfen

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 8
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a9614b15-7c10-473f-82cd-3c98a2ebe060'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 1
በምድር ተገልጦ የሰማዩን እዉነት የነገረን
ከፍ ከፍ ያለ ሊቀ ካህናት በሰማያት አለን
ከሀጥያት በቀር በነገሮች ሁሉ የተፈተኖ
አልፎ የገባ ወዳጅ አለን ተቀዳሚ ሆኖ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 2
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 3
ወንድሞች ብሎ እንዲጠራን የማያፍርብን
በድካማችን የሚራራ ሊቀ ካህን አለን
ከዘላለም ሞት ያስመለጠን ባፈሰሰው ደም
ስሙ ይቀደስ ፋሲካችን መድኃኔዓለም

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 4
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 5
ፅድቅ ሊሆነን ስላልቻለ የራሳችን ፅድቅ
በመስቀል ዋለ ከአባቱ ጋር እኛን ሊያስታርቅ
ሞትን ድል አርጎ በግርማው ቀኝ ያለው በመንግስቱ
የቀደመልን ስሙ ይክበር ሊቀ ካህናቱ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 6
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 7
እንደ ኢየሱስ ያለ ወዴት አለ በሰማይ በምድር
በደሙ የናደ ያፈረሰ የጠላትን ምክር
ይህንን እዉነት እንዳናቀል ፀጋው ትደግፈን
የልቦናችን አይን ይብራ ማዳኑ እንዳታልፈን

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 8
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a9614b15-7c10-473f-82cd-3c98a2ebe060'::uuid, 'beegiziabiherina-besew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- with-his-mercifulness ("With His Mercifulness")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ae9bc345-8234-4a37-9b8e-d924428d42e6'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 1
Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal (2) becherinetu

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 2
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 3
How can we thank you Lord Glorious God Almighty
You granted us this life to fulfill righteously
It is always your will to save us with your grace
You are love God indeed you cannot be replaced

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 4
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 5
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 6
No one compares to Him in His love in His grace
He is patient with us He endures for our sake
He calls us to His way return to me He says
Let us pray to Him now with humble repentance

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 7
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 8
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal becherinetu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 1
Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal (2) becherinetu

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 2
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 3
How can we thank you Lord Glorious God Almighty
You granted us this life to fulfill righteously
It is always your will to save us with your grace
You are love God indeed you cannot be replaced

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 4
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 5
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 6
No one compares to Him in His love in His grace
He is patient with us He endures for our sake
He calls us to His way return to me He says
Let us pray to Him now with humble repentance

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 7
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 8
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness',
        lyrics_transliteration = 'Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal becherinetu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ae9bc345-8234-4a37-9b8e-d924428d42e6'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 1
Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal (2) becherinetu

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 2
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 3
How can we thank you Lord Glorious God Almighty
You granted us this life to fulfill righteously
It is always your will to save us with your grace
You are love God indeed you cannot be replaced

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 4
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 5
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 6
No one compares to Him in His love in His grace
He is patient with us He endures for our sake
He calls us to His way return to me He says
Let us pray to Him now with humble repentance

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 7
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 8
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal becherinetu';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ae9bc345-8234-4a37-9b8e-d924428d42e6'::uuid, 'with-his-mercifulness', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yiwedisiwa ("Yiwedisiwa")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5cfbcefe-f1aa-4425-8554-cf39c5952048'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ

VERSE 1
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ

CHORUS
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa

VERSE 1
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa

CHORUS
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ

VERSE 1
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ

CHORUS
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ',
        lyrics_transliteration = 'CHORUS
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa

VERSE 1
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa

CHORUS
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5cfbcefe-f1aa-4425-8554-cf39c5952048'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ

VERSE 1
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ

CHORUS
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5cfbcefe-f1aa-4425-8554-cf39c5952048'::uuid, 'yiwedisiwa', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- webet-nesh-moged-simetagn-zemari-deacon-dawit-tilahun ("webet nesh moged simetagn zemari deacon dawit tilahun")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'eeb5aa85-ca6b-49a3-b295-b9a89b6904fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 1
አጎንብሻለሁኝ አፈሬ በለምፄ/2/
ወልቋል ከራሴ ላይ የብርሃን ልብሴ
ሃብቴ አንቺ ብቻ ነሽ ያለሽኝ ሞገሴ/2/
❴አዝ❵

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 2
ለአምላኬ የማቀርበው አጣሁ በጎ ስራ
ነፍሴ ተጨነቀች በምግባሬ መርራ/2/
ጥላሸቱ በዝቶ ተዳፍኖኗል ጎጆዬ
ብርሃን የለውም ካልበራ ሻማዬ/2/

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 3
❴አዝ❵
የምታመንበት አንዳች ነገር የለኝ
በነፍስም በስጋ ሁሉ የጎደለኝ/2/
እጠባበቃለሁ የእጅሽን በረከት

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 4
እቤቴ ላይ አርፎ እስክባረክበት/2/
❴አዝ❵
የጓዳዬ ክብር የቅጥሬ ድምቀት ነሽ
ዓይኔን የምትሞይው በመቅረዜ በርተሽ/2/

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 5
የፅልመት ጭላንጭል ጠፍቷል የለም ዛሬ
የብርሃን እናት ስላለች በበሬ/2/
❴አዝ❵

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 1
Agonbshalehugn afere belemts’e (2)
Welqwal kerase lay yebrhan libse
Habte anchi bicha nesh yaleshgn mogese (2)
❴az❵

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 2
Leamlake yemaqerbew at’ahu bego sira
Nefse tech’eneqech bemgbare merra (2)
T’lashetu bezto tedafnonwal gojoye
Birhan yelewm kalbera shamaye (2)

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 3
❴az❵
Yemtamenbet andach neger yelegn
Benefsm besga hulu yegodelegn (2)
Et’ebabeqalehu yeejshn bereket

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 4
Ebete lay arfo eskbarekbet (2)
❴az❵
Yegwadaye kibir yeqt’re dimqet nesh
Aynen yemtmoyw bemeqreze bertesh (2)

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 5
Yets’lmet ch’lanch’l t’eftwal yelem zare
Yebrhan enat silalech bebere (2)
❴az❵

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 1
አጎንብሻለሁኝ አፈሬ በለምፄ/2/
ወልቋል ከራሴ ላይ የብርሃን ልብሴ
ሃብቴ አንቺ ብቻ ነሽ ያለሽኝ ሞገሴ/2/
❴አዝ❵

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 2
ለአምላኬ የማቀርበው አጣሁ በጎ ስራ
ነፍሴ ተጨነቀች በምግባሬ መርራ/2/
ጥላሸቱ በዝቶ ተዳፍኖኗል ጎጆዬ
ብርሃን የለውም ካልበራ ሻማዬ/2/

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 3
❴አዝ❵
የምታመንበት አንዳች ነገር የለኝ
በነፍስም በስጋ ሁሉ የጎደለኝ/2/
እጠባበቃለሁ የእጅሽን በረከት

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 4
እቤቴ ላይ አርፎ እስክባረክበት/2/
❴አዝ❵
የጓዳዬ ክብር የቅጥሬ ድምቀት ነሽ
ዓይኔን የምትሞይው በመቅረዜ በርተሽ/2/

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 5
የፅልመት ጭላንጭል ጠፍቷል የለም ዛሬ
የብርሃን እናት ስላለች በበሬ/2/
❴አዝ❵

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ',
        lyrics_transliteration = 'CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 1
Agonbshalehugn afere belemts’e (2)
Welqwal kerase lay yebrhan libse
Habte anchi bicha nesh yaleshgn mogese (2)
❴az❵

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 2
Leamlake yemaqerbew at’ahu bego sira
Nefse tech’eneqech bemgbare merra (2)
T’lashetu bezto tedafnonwal gojoye
Birhan yelewm kalbera shamaye (2)

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 3
❴az❵
Yemtamenbet andach neger yelegn
Benefsm besga hulu yegodelegn (2)
Et’ebabeqalehu yeejshn bereket

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 4
Ebete lay arfo eskbarekbet (2)
❴az❵
Yegwadaye kibir yeqt’re dimqet nesh
Aynen yemtmoyw bemeqreze bertesh (2)

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 5
Yets’lmet ch’lanch’l t’eftwal yelem zare
Yebrhan enat silalech bebere (2)
❴az❵

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'eeb5aa85-ca6b-49a3-b295-b9a89b6904fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 1
አጎንብሻለሁኝ አፈሬ በለምፄ/2/
ወልቋል ከራሴ ላይ የብርሃን ልብሴ
ሃብቴ አንቺ ብቻ ነሽ ያለሽኝ ሞገሴ/2/
❴አዝ❵

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 2
ለአምላኬ የማቀርበው አጣሁ በጎ ስራ
ነፍሴ ተጨነቀች በምግባሬ መርራ/2/
ጥላሸቱ በዝቶ ተዳፍኖኗል ጎጆዬ
ብርሃን የለውም ካልበራ ሻማዬ/2/

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 3
❴አዝ❵
የምታመንበት አንዳች ነገር የለኝ
በነፍስም በስጋ ሁሉ የጎደለኝ/2/
እጠባበቃለሁ የእጅሽን በረከት

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 4
እቤቴ ላይ አርፎ እስክባረክበት/2/
❴አዝ❵
የጓዳዬ ክብር የቅጥሬ ድምቀት ነሽ
ዓይኔን የምትሞይው በመቅረዜ በርተሽ/2/

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 5
የፅልመት ጭላንጭል ጠፍቷል የለም ዛሬ
የብርሃን እናት ስላለች በበሬ/2/
❴አዝ❵

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'eeb5aa85-ca6b-49a3-b295-b9a89b6904fe'::uuid, 'webet-nesh-moged-simetagn-zemari-deacon-dawit-tilahun', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gebiriel-belut ("Gebiriel Belut")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '52812e38-a1ce-479b-b3e7-7ca50194cb8c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 1
ምህረትን ያዘልክ እሳታዊ መልኣክ
በዘመነ አዲስ ምስራች የምትሰብክ
ዘወትር የምትማልድ የምትኖር በራማ
ደግሞ በምድር ያለህ ፀሎትን ልትሰማ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 2
ባያድነን እንኳን ያመንነው እውነት
አንሰግድም አሉ ወድቀን ለጣኦት
ከመሃል ተገኘህ በእሳት ሳይበሉ
ዛሬም ዙሪያቸው ነህ ላመኑት በቃሉ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 3
እጅግ ከተራቡት ከአናብስቱ መሃል
በንጉሱ ትዕዛዝ ከሞት መሃል ብጣል
በተሰጠው ኪዳን ሕይወቴን ታድጓል
መልአኩ ገብርኤል ለእኔ ግን ይለያል

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 4
በባቢሉን ምድር በባእዳን ሀገር
ሲድራቅና ሚሳቅ ተብለን አብደናጎር
ለጣኦት እንዳንሰግድ የሆንከን ሞገስ
አምላከ ገብርኤል ስምህ ይቀደስ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 1
Mihretn yazelk esatawi melak
Bezemene adis misrach yemtsebk
Zewetr yemtmald yemtnor berama
Degmo bemdr yaleh ts’elotn litsema

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 2
Bayadnen enkwan yamennew ewnet
Ansegdm alu wedqen let’aot
Kemehal tegegneh beesat saybelu
Zarem zuriyachew neh lamenut beqalu

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 3
Ejg keterabut keanabstu mehal
Bengusu tiezaz kemot mehal bit’al
Beteset’ew kidan hiyweten tadgwal
Melaku Gebriel leene gin yileyal

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 4
Bebabilun midr bebaedan heger
Sidraqna misaq teblen abdenagor
Let’aot endansegd yehonken moges
Amlake Gebriel simh yiqedes

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 1
ምህረትን ያዘልክ እሳታዊ መልኣክ
በዘመነ አዲስ ምስራች የምትሰብክ
ዘወትር የምትማልድ የምትኖር በራማ
ደግሞ በምድር ያለህ ፀሎትን ልትሰማ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 2
ባያድነን እንኳን ያመንነው እውነት
አንሰግድም አሉ ወድቀን ለጣኦት
ከመሃል ተገኘህ በእሳት ሳይበሉ
ዛሬም ዙሪያቸው ነህ ላመኑት በቃሉ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 3
እጅግ ከተራቡት ከአናብስቱ መሃል
በንጉሱ ትዕዛዝ ከሞት መሃል ብጣል
በተሰጠው ኪዳን ሕይወቴን ታድጓል
መልአኩ ገብርኤል ለእኔ ግን ይለያል

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 4
በባቢሉን ምድር በባእዳን ሀገር
ሲድራቅና ሚሳቅ ተብለን አብደናጎር
ለጣኦት እንዳንሰግድ የሆንከን ሞገስ
አምላከ ገብርኤል ስምህ ይቀደስ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት',
        lyrics_transliteration = 'CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 1
Mihretn yazelk esatawi melak
Bezemene adis misrach yemtsebk
Zewetr yemtmald yemtnor berama
Degmo bemdr yaleh ts’elotn litsema

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 2
Bayadnen enkwan yamennew ewnet
Ansegdm alu wedqen let’aot
Kemehal tegegneh beesat saybelu
Zarem zuriyachew neh lamenut beqalu

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 3
Ejg keterabut keanabstu mehal
Bengusu tiezaz kemot mehal bit’al
Beteset’ew kidan hiyweten tadgwal
Melaku Gebriel leene gin yileyal

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 4
Bebabilun midr bebaedan heger
Sidraqna misaq teblen abdenagor
Let’aot endansegd yehonken moges
Amlake Gebriel simh yiqedes

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut',
        updated_at = clock_timestamp()::text
    WHERE import_id = '52812e38-a1ce-479b-b3e7-7ca50194cb8c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 1
ምህረትን ያዘልክ እሳታዊ መልኣክ
በዘመነ አዲስ ምስራች የምትሰብክ
ዘወትር የምትማልድ የምትኖር በራማ
ደግሞ በምድር ያለህ ፀሎትን ልትሰማ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 2
ባያድነን እንኳን ያመንነው እውነት
አንሰግድም አሉ ወድቀን ለጣኦት
ከመሃል ተገኘህ በእሳት ሳይበሉ
ዛሬም ዙሪያቸው ነህ ላመኑት በቃሉ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 3
እጅግ ከተራቡት ከአናብስቱ መሃል
በንጉሱ ትዕዛዝ ከሞት መሃል ብጣል
በተሰጠው ኪዳን ሕይወቴን ታድጓል
መልአኩ ገብርኤል ለእኔ ግን ይለያል

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 4
በባቢሉን ምድር በባእዳን ሀገር
ሲድራቅና ሚሳቅ ተብለን አብደናጎር
ለጣኦት እንዳንሰግድ የሆንከን ሞገስ
አምላከ ገብርኤል ስምህ ይቀደስ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '52812e38-a1ce-479b-b3e7-7ca50194cb8c'::uuid, 'gebiriel-belut', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yilal-andebete ("Yilal Andebete")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'db38f532-41f5-4367-8ef7-fbf80f5f9570'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 1
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 2
የትናንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩምሾ ነው
ወደ እረፍት የወጣሁ ይድረስ ምስጋናዬ
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 3
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 4
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
በድሉ በረሃ ምግብ መጠጦ ነው
መንገዴን አቅናው እጅህ በአፍ ያሻገረኝ
በእሳትና በውሃ መካከል አልፌ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 5
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 6
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
የብቸኝነቴን ማዕበል ገስጾአል
ለኔ ብርሃን ሆኖ የከሳሽ ጸልሟል

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 7
ቀስቱን እያደፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 8
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
ትናንት ዛሬ ነገ ዘላለም ጠባቂ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 9
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህርየው ቅዱስ የሌለው አምሳያ
ስሙ ወደበየ ነው መልኬን መጥራያ
ስሙ ወደበየ ነው መልኬን መጥራያ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 10
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 1
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 2
Yetnant hiyweten zor biye sayew
Mamlech’a yelelew at’rumsho new
Wede ereft yewet’ahu yidres misganaye
Bejor bizgubgn beru newgn Getaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 3
Bejor bizgubgn beru newgn Getaye
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 4
Tilehalech nefse fiqr new Getaye
Bedlu bereha migb met’et’o new
Mengeden aqnaw ejh beaf yashageregn
Beesatna bewha mekakel alfe

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 5
Temesgen elalehu kibir yihunh afe
Temesgen elalehu kibir yihunh afe
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 6
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye
Yebchegnneten maebel gests’oal
Lene birhan hono yekesash ts’elmwal

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 7
Qestun eyadefe tadegegn kesqay
Yegetaye hesab fiqr new beene lay
Yegetaye hesab fiqr new beene lay
Yilal andebete Egziabher Kidus new

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 8
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye
Tinant zare nege zelalem t’ebaqi

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 9
Yelben filagot salnegrew awaqi
Bebahryew Kidus yelelew amsaya
Simu wedebeye new melken met’raya
Simu wedebeye new melken met’raya

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 10
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 1
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 2
የትናንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩምሾ ነው
ወደ እረፍት የወጣሁ ይድረስ ምስጋናዬ
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 3
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 4
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
በድሉ በረሃ ምግብ መጠጦ ነው
መንገዴን አቅናው እጅህ በአፍ ያሻገረኝ
በእሳትና በውሃ መካከል አልፌ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 5
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 6
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
የብቸኝነቴን ማዕበል ገስጾአል
ለኔ ብርሃን ሆኖ የከሳሽ ጸልሟል

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 7
ቀስቱን እያደፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 8
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
ትናንት ዛሬ ነገ ዘላለም ጠባቂ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 9
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህርየው ቅዱስ የሌለው አምሳያ
ስሙ ወደበየ ነው መልኬን መጥራያ
ስሙ ወደበየ ነው መልኬን መጥራያ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 10
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ',
        lyrics_transliteration = 'CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 1
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 2
Yetnant hiyweten zor biye sayew
Mamlech’a yelelew at’rumsho new
Wede ereft yewet’ahu yidres misganaye
Bejor bizgubgn beru newgn Getaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 3
Bejor bizgubgn beru newgn Getaye
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 4
Tilehalech nefse fiqr new Getaye
Bedlu bereha migb met’et’o new
Mengeden aqnaw ejh beaf yashageregn
Beesatna bewha mekakel alfe

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 5
Temesgen elalehu kibir yihunh afe
Temesgen elalehu kibir yihunh afe
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 6
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye
Yebchegnneten maebel gests’oal
Lene birhan hono yekesash ts’elmwal

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 7
Qestun eyadefe tadegegn kesqay
Yegetaye hesab fiqr new beene lay
Yegetaye hesab fiqr new beene lay
Yilal andebete Egziabher Kidus new

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 8
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye
Tinant zare nege zelalem t’ebaqi

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 9
Yelben filagot salnegrew awaqi
Bebahryew Kidus yelelew amsaya
Simu wedebeye new melken met’raya
Simu wedebeye new melken met’raya

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 10
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'db38f532-41f5-4367-8ef7-fbf80f5f9570'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 1
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 2
የትናንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩምሾ ነው
ወደ እረፍት የወጣሁ ይድረስ ምስጋናዬ
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 3
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 4
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
በድሉ በረሃ ምግብ መጠጦ ነው
መንገዴን አቅናው እጅህ በአፍ ያሻገረኝ
በእሳትና በውሃ መካከል አልፌ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 5
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 6
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
የብቸኝነቴን ማዕበል ገስጾአል
ለኔ ብርሃን ሆኖ የከሳሽ ጸልሟል

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 7
ቀስቱን እያደፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 8
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
ትናንት ዛሬ ነገ ዘላለም ጠባቂ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 9
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህርየው ቅዱስ የሌለው አምሳያ
ስሙ ወደበየ ነው መልኬን መጥራያ
ስሙ ወደበየ ነው መልኬን መጥራያ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 10
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'db38f532-41f5-4367-8ef7-fbf80f5f9570'::uuid, 'yilal-andebete', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- besemeh-tamegnalew ("besemeh tamegnalew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '529c4cbc-8de7-488f-a253-e0aca600ea42'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
ተገፍቶ መች ይወድቃል በአንተ የሚታመን
አይሞትም ይኖራል በአንተ የሚታመን
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Zelalem temesgen kef bellgn
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
Tegefto mech yiwedqal beante yemitamen
Aymotm yinoral beante yemitamen
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
ተገፍቶ መች ይወድቃል በአንተ የሚታመን
አይሞትም ይኖራል በአንተ የሚታመን
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ',
        lyrics_transliteration = 'CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Zelalem temesgen kef bellgn
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
Tegefto mech yiwedqal beante yemitamen
Aymotm yinoral beante yemitamen
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite',
        updated_at = clock_timestamp()::text
    WHERE import_id = '529c4cbc-8de7-488f-a253-e0aca600ea42'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
ተገፍቶ መች ይወድቃል በአንተ የሚታመን
አይሞትም ይኖራል በአንተ የሚታመን
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '529c4cbc-8de7-488f-a253-e0aca600ea42'::uuid, 'besemeh-tamegnalew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopia-3173 ("Ethiopia")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '54db9e59-d5f0-4636-96e9-77d981a0a282'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 1
ስጋ በስጋ ህግ ይስበኛል
መንፈስ በመንፈስህግ ይጠራኛል
ለየትኛው ጌታ ተገዝቼ
የቱን እመርጣለሁ አንዱን ትቼ

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 2
ሀጥያት እሰራና ይጨንቀኛል
አምላኬ ሲለየኝ ይሰማኛል
ጌታየ ሲለየኝ ይሰማኛል
አምላኬ ሲለየኝ ይሰማኛል

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 3
በሐጥያት ለመኖር በዚህ አለም
የአምላክን ትእዛዝ በማጣመም
በስርቆት በዝሙት በስካር
በዲያብሎስ ፈቃድ ስንኖር

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 4
የኋላ የሗላ ጭንቀት ነው
አምላክ በክዶቹ ያልያዘው
የጨለማ ጉዞ ምኑ ይጥማል
አይን እያሳወረ ያዋርዳል

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 5
መላእክት በሰማይ ያለቅሳሉ
የእግዚአብሔር ቅዱሳን ያነባሉ
በሐጥያት ተማርከን ስንወሰድ
ሰይጣን ድል አግቶ ስንዋረድ

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 1
Siga besga hig yisbegnal
Menfes bemenfeshg yit’eragnal
Leyetgnaw Geta tegezche
Yetun emert’alehu andun tiche

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 2
Het’yat eserana yich’enqegnal
Amlake sileyegn yisemagnal
Getaye sileyegn yisemagnal
Amlake sileyegn yisemagnal

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 3
Behet’yat lemenor bezih alem
Yeamlakn tiezaz bemat’amem
Besrqot bezmut beskar
Bediyablos feqad sinnor

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 4
Yehwala yeሗla ch’nqet new
Amlak bekdochu yalyazew
Yech’elema guzo minu yit’mal
Ayn eyasawere yawardal

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 5
Melaekt besemay yaleqsalu
YeEgziabher Kidusan yanebalu
Behet’yat temarken sinwesed
Seyt’an dil agto sinwared

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 1
ስጋ በስጋ ህግ ይስበኛል
መንፈስ በመንፈስህግ ይጠራኛል
ለየትኛው ጌታ ተገዝቼ
የቱን እመርጣለሁ አንዱን ትቼ

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 2
ሀጥያት እሰራና ይጨንቀኛል
አምላኬ ሲለየኝ ይሰማኛል
ጌታየ ሲለየኝ ይሰማኛል
አምላኬ ሲለየኝ ይሰማኛል

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 3
በሐጥያት ለመኖር በዚህ አለም
የአምላክን ትእዛዝ በማጣመም
በስርቆት በዝሙት በስካር
በዲያብሎስ ፈቃድ ስንኖር

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 4
የኋላ የሗላ ጭንቀት ነው
አምላክ በክዶቹ ያልያዘው
የጨለማ ጉዞ ምኑ ይጥማል
አይን እያሳወረ ያዋርዳል

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 5
መላእክት በሰማይ ያለቅሳሉ
የእግዚአብሔር ቅዱሳን ያነባሉ
በሐጥያት ተማርከን ስንወሰድ
ሰይጣን ድል አግቶ ስንዋረድ

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ',
        lyrics_transliteration = 'CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 1
Siga besga hig yisbegnal
Menfes bemenfeshg yit’eragnal
Leyetgnaw Geta tegezche
Yetun emert’alehu andun tiche

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 2
Het’yat eserana yich’enqegnal
Amlake sileyegn yisemagnal
Getaye sileyegn yisemagnal
Amlake sileyegn yisemagnal

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 3
Behet’yat lemenor bezih alem
Yeamlakn tiezaz bemat’amem
Besrqot bezmut beskar
Bediyablos feqad sinnor

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 4
Yehwala yeሗla ch’nqet new
Amlak bekdochu yalyazew
Yech’elema guzo minu yit’mal
Ayn eyasawere yawardal

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 5
Melaekt besemay yaleqsalu
YeEgziabher Kidusan yanebalu
Behet’yat temarken sinwesed
Seyt’an dil agto sinwared

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro',
        updated_at = clock_timestamp()::text
    WHERE import_id = '54db9e59-d5f0-4636-96e9-77d981a0a282'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 1
ስጋ በስጋ ህግ ይስበኛል
መንፈስ በመንፈስህግ ይጠራኛል
ለየትኛው ጌታ ተገዝቼ
የቱን እመርጣለሁ አንዱን ትቼ

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 2
ሀጥያት እሰራና ይጨንቀኛል
አምላኬ ሲለየኝ ይሰማኛል
ጌታየ ሲለየኝ ይሰማኛል
አምላኬ ሲለየኝ ይሰማኛል

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 3
በሐጥያት ለመኖር በዚህ አለም
የአምላክን ትእዛዝ በማጣመም
በስርቆት በዝሙት በስካር
በዲያብሎስ ፈቃድ ስንኖር

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 4
የኋላ የሗላ ጭንቀት ነው
አምላክ በክዶቹ ያልያዘው
የጨለማ ጉዞ ምኑ ይጥማል
አይን እያሳወረ ያዋርዳል

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 5
መላእክት በሰማይ ያለቅሳሉ
የእግዚአብሔር ቅዱሳን ያነባሉ
በሐጥያት ተማርከን ስንወሰድ
ሰይጣን ድል አግቶ ስንዋረድ

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '54db9e59-d5f0-4636-96e9-77d981a0a282'::uuid, 'ethiopia-3173', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- esegid-leki ("Esegid Leki")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '558d68b2-a4ae-4ec8-9a4e-4f4159ce0e62'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 1
ፋራን የምትባይ የእንብቁም ተራራ
የማህፀንሽ ፍሬ በሁሉም ሚፈራ
በስጋሽም ድንግል ድንግል በህሊና
ካንቺ ሚተካከል ፍጥረት የለምና

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 2
እሰግድ ለኪ
ከጥፋቱ ዉሀ ኖህ የዳነብሽ
የምህረት ቃል-ኪዳን ቀስተደመና ነሽ
የኤልያስ መሶብ የሙሴ ደመና

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 3
ካንቺ ተመገብን ሰማያዊ መና
እሰግድ ለኪ
የአብርሃም ድንኳን የይህሳቅ መአዛ
ያይቆብ በራዕይ ያየሽ በፍኖተ ሎዛ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 4
በእጆችሽ ልባረክ እንዲበዛ ፅድቄ
ሰላም ለኪ ልበል ከፊትሽ ወድቄ
እሰግድ ለኪ
ሀረቡኒ ልበል የሀዘኔ መርሻ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 5
ካምላክ መገናኛ የፀሎቴ ዋሻ
ከተወዳጅ ልጅሽ ይቅርታ እንዳገኝ
አንቺን ዋስ ጠበቃ አድርጌያለሁኝ
እሰግድ ለኪ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 1
Faran yemtbay yeenbqum terara
Yemahts’ensh fire behulum mifera
Besgashm Dingil Dingil behlina
Kanchi mitekakel fit’ret yelemna

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 2
Esegd leki
Ket’fatu wuhe noh yedanebsh
Yemhret qal-kidan qestedemena nesh
Yeelyas mesob yemuse demena

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 3
Kanchi temegebn semayawi mena
Esegd leki
Yeabrham dinkwan yeyhsaq meaza
Yayqob beraey yayesh befnote loza

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 4
Beejochsh libarek endibeza ts’dqe
Selam leki libel kefitsh wedqe
Esegd leki
Herebuni libel yehezene mersha

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 5
Kamlak megenagna yets’elote washa
Ketewedaj lijsh yiqrta endagegn
Anchin was t’ebeqa adrgeyalehugn
Esegd leki

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 1
ፋራን የምትባይ የእንብቁም ተራራ
የማህፀንሽ ፍሬ በሁሉም ሚፈራ
በስጋሽም ድንግል ድንግል በህሊና
ካንቺ ሚተካከል ፍጥረት የለምና

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 2
እሰግድ ለኪ
ከጥፋቱ ዉሀ ኖህ የዳነብሽ
የምህረት ቃል-ኪዳን ቀስተደመና ነሽ
የኤልያስ መሶብ የሙሴ ደመና

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 3
ካንቺ ተመገብን ሰማያዊ መና
እሰግድ ለኪ
የአብርሃም ድንኳን የይህሳቅ መአዛ
ያይቆብ በራዕይ ያየሽ በፍኖተ ሎዛ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 4
በእጆችሽ ልባረክ እንዲበዛ ፅድቄ
ሰላም ለኪ ልበል ከፊትሽ ወድቄ
እሰግድ ለኪ
ሀረቡኒ ልበል የሀዘኔ መርሻ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 5
ካምላክ መገናኛ የፀሎቴ ዋሻ
ከተወዳጅ ልጅሽ ይቅርታ እንዳገኝ
አንቺን ዋስ ጠበቃ አድርጌያለሁኝ
እሰግድ ለኪ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2',
        lyrics_transliteration = 'CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 1
Faran yemtbay yeenbqum terara
Yemahts’ensh fire behulum mifera
Besgashm Dingil Dingil behlina
Kanchi mitekakel fit’ret yelemna

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 2
Esegd leki
Ket’fatu wuhe noh yedanebsh
Yemhret qal-kidan qestedemena nesh
Yeelyas mesob yemuse demena

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 3
Kanchi temegebn semayawi mena
Esegd leki
Yeabrham dinkwan yeyhsaq meaza
Yayqob beraey yayesh befnote loza

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 4
Beejochsh libarek endibeza ts’dqe
Selam leki libel kefitsh wedqe
Esegd leki
Herebuni libel yehezene mersha

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 5
Kamlak megenagna yets’elote washa
Ketewedaj lijsh yiqrta endagegn
Anchin was t’ebeqa adrgeyalehugn
Esegd leki

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '558d68b2-a4ae-4ec8-9a4e-4f4159ce0e62'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 1
ፋራን የምትባይ የእንብቁም ተራራ
የማህፀንሽ ፍሬ በሁሉም ሚፈራ
በስጋሽም ድንግል ድንግል በህሊና
ካንቺ ሚተካከል ፍጥረት የለምና

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 2
እሰግድ ለኪ
ከጥፋቱ ዉሀ ኖህ የዳነብሽ
የምህረት ቃል-ኪዳን ቀስተደመና ነሽ
የኤልያስ መሶብ የሙሴ ደመና

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 3
ካንቺ ተመገብን ሰማያዊ መና
እሰግድ ለኪ
የአብርሃም ድንኳን የይህሳቅ መአዛ
ያይቆብ በራዕይ ያየሽ በፍኖተ ሎዛ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 4
በእጆችሽ ልባረክ እንዲበዛ ፅድቄ
ሰላም ለኪ ልበል ከፊትሽ ወድቄ
እሰግድ ለኪ
ሀረቡኒ ልበል የሀዘኔ መርሻ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 5
ካምላክ መገናኛ የፀሎቴ ዋሻ
ከተወዳጅ ልጅሽ ይቅርታ እንዳገኝ
አንቺን ዋስ ጠበቃ አድርጌያለሁኝ
እሰግድ ለኪ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '558d68b2-a4ae-4ec8-9a4e-4f4159ce0e62'::uuid, 'esegid-leki', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- menigisite-silase ("Menigisite Silase")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '56227eed-349c-43c0-8bf8-05accf9455f1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 1
ንግበር ሰብአ ብለው አማን በአማን
አዳምን ፈጥረውት አማን በአማን
በቸርነትና በፍቅር ጎበኙት
ሁሉን በእጁ አድርገው ሁሉን አስገዙለት

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 2
የፍቅር የደስታ አማን በአማን
የበረከት አባት አማን በአማን
መንግስቱ ዘለዓለም ህልፈት የሌለበት
በአፈ መላዕክት የሚመሰገኑት

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 3
የዚያን የደግ አባት አማን በአማን
የአብርሃምን ቤት አማን በአማን
እንደባረኩለት የእኛንም ባርኩልን
የቤታችን ዋልታ መሰረት ሁኑልን

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 4
በመከራ ጊዜ አማን በአማን
ከጭንቅ የሚያውጡን አማን በአማን
ስሙን ሳመሰግን ትረካለች ነፍሴ
የነሙሴ አምላክ የአብርሃሙ ስላሴ

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 1
Nigber seba bilew aman beaman
Adamn fet’rewt aman beaman
Bechernetna befqr gobegnut
Hulun beeju adrgew hulun asgezulet

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 2
Yefqr yedesta aman beaman
Yebereket abat aman beaman
Mengstu zelealem hilfet yelelebet
Beafe melaekt yemimesegenut

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 3
Yeziyan yedeg abat aman beaman
Yeabrhamn bet aman beaman
Endebarekulet yeegnanm barkuln
Yebetachn walta meseret hunuln

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 4
Bemekera gize aman beaman
Kech’nq yemiyawt’un aman beaman
Simun samesegn tirekalech nefse
Yenemuse amlak yeabrhamu Silassie

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 1
ንግበር ሰብአ ብለው አማን በአማን
አዳምን ፈጥረውት አማን በአማን
በቸርነትና በፍቅር ጎበኙት
ሁሉን በእጁ አድርገው ሁሉን አስገዙለት

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 2
የፍቅር የደስታ አማን በአማን
የበረከት አባት አማን በአማን
መንግስቱ ዘለዓለም ህልፈት የሌለበት
በአፈ መላዕክት የሚመሰገኑት

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 3
የዚያን የደግ አባት አማን በአማን
የአብርሃምን ቤት አማን በአማን
እንደባረኩለት የእኛንም ባርኩልን
የቤታችን ዋልታ መሰረት ሁኑልን

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 4
በመከራ ጊዜ አማን በአማን
ከጭንቅ የሚያውጡን አማን በአማን
ስሙን ሳመሰግን ትረካለች ነፍሴ
የነሙሴ አምላክ የአብርሃሙ ስላሴ

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም',
        lyrics_transliteration = 'CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 1
Nigber seba bilew aman beaman
Adamn fet’rewt aman beaman
Bechernetna befqr gobegnut
Hulun beeju adrgew hulun asgezulet

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 2
Yefqr yedesta aman beaman
Yebereket abat aman beaman
Mengstu zelealem hilfet yelelebet
Beafe melaekt yemimesegenut

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 3
Yeziyan yedeg abat aman beaman
Yeabrhamn bet aman beaman
Endebarekulet yeegnanm barkuln
Yebetachn walta meseret hunuln

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 4
Bemekera gize aman beaman
Kech’nq yemiyawt’un aman beaman
Simun samesegn tirekalech nefse
Yenemuse amlak yeabrhamu Silassie

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem',
        updated_at = clock_timestamp()::text
    WHERE import_id = '56227eed-349c-43c0-8bf8-05accf9455f1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 1
ንግበር ሰብአ ብለው አማን በአማን
አዳምን ፈጥረውት አማን በአማን
በቸርነትና በፍቅር ጎበኙት
ሁሉን በእጁ አድርገው ሁሉን አስገዙለት

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 2
የፍቅር የደስታ አማን በአማን
የበረከት አባት አማን በአማን
መንግስቱ ዘለዓለም ህልፈት የሌለበት
በአፈ መላዕክት የሚመሰገኑት

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 3
የዚያን የደግ አባት አማን በአማን
የአብርሃምን ቤት አማን በአማን
እንደባረኩለት የእኛንም ባርኩልን
የቤታችን ዋልታ መሰረት ሁኑልን

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 4
በመከራ ጊዜ አማን በአማን
ከጭንቅ የሚያውጡን አማን በአማን
ስሙን ሳመሰግን ትረካለች ነፍሴ
የነሙሴ አምላክ የአብርሃሙ ስላሴ

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '56227eed-349c-43c0-8bf8-05accf9455f1'::uuid, 'menigisite-silase', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lekidisit-silase ("Lekidisit Silase")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2dd9dfc8-0eb0-4a97-b0ec-b2ee245a681c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 1
በጥበብ የሰራኝ በከሃሊነቱ
ግዛቱ ፅኑ ናት ዘላለም መንግስቱ
ቀድሞ የፈጠረኝ በሆድ ሳልሰራ
ግሩም ነው ስላሴ በእጆቹ ሥራ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 2
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 3
አብ ወልድ መንፈስ ቅዱስ አንድ አምላክ ስላሴ
አስገኝ ፈጣሪ የስጋ የነፍሴ
እድሜዬን በሙሉ ሳወድስህ ልኑር
ብቻህን ገናናው በሰማይ በምድር

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 4
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 5
ሳልወጣ ከእቅፍህ ከህልውናህ
መገናኘትህ አጥሮኝ ልኑር ሳመልክህ
በታላቅ ልእልና ከፍ ያልክ ያለ ልክ
መመለክ ሚገባህ አንተ ብቻ አምላክ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 6
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 1
Bet’beb yeseragn bekehalinetu
Gizatu ts’nu nat zelalem mengstu
Qedmo yefet’eregn behod salsera
Girum new Silassie beejochu sira

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 2
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 3
Ab Weld menfes Kidus and amlak Silassie
Asgegn fet’ari yesga yenefse
Edmeyen bemulu sawedsh linur
Bichahn genanaw besemay bemdr

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 4
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 5
Salwet’a keeqfh kehlwnah
Megenagneth at’rogn linur samelkh
Betalaq lielna kef yalk yale lik
Memelek migebah ante bicha amlak

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 6
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 1
በጥበብ የሰራኝ በከሃሊነቱ
ግዛቱ ፅኑ ናት ዘላለም መንግስቱ
ቀድሞ የፈጠረኝ በሆድ ሳልሰራ
ግሩም ነው ስላሴ በእጆቹ ሥራ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 2
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 3
አብ ወልድ መንፈስ ቅዱስ አንድ አምላክ ስላሴ
አስገኝ ፈጣሪ የስጋ የነፍሴ
እድሜዬን በሙሉ ሳወድስህ ልኑር
ብቻህን ገናናው በሰማይ በምድር

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 4
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 5
ሳልወጣ ከእቅፍህ ከህልውናህ
መገናኘትህ አጥሮኝ ልኑር ሳመልክህ
በታላቅ ልእልና ከፍ ያልክ ያለ ልክ
መመለክ ሚገባህ አንተ ብቻ አምላክ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 6
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ',
        lyrics_transliteration = 'CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 1
Bet’beb yeseragn bekehalinetu
Gizatu ts’nu nat zelalem mengstu
Qedmo yefet’eregn behod salsera
Girum new Silassie beejochu sira

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 2
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 3
Ab Weld menfes Kidus and amlak Silassie
Asgegn fet’ari yesga yenefse
Edmeyen bemulu sawedsh linur
Bichahn genanaw besemay bemdr

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 4
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 5
Salwet’a keeqfh kehlwnah
Megenagneth at’rogn linur samelkh
Betalaq lielna kef yalk yale lik
Memelek migebah ante bicha amlak

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 6
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2dd9dfc8-0eb0-4a97-b0ec-b2ee245a681c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 1
በጥበብ የሰራኝ በከሃሊነቱ
ግዛቱ ፅኑ ናት ዘላለም መንግስቱ
ቀድሞ የፈጠረኝ በሆድ ሳልሰራ
ግሩም ነው ስላሴ በእጆቹ ሥራ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 2
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 3
አብ ወልድ መንፈስ ቅዱስ አንድ አምላክ ስላሴ
አስገኝ ፈጣሪ የስጋ የነፍሴ
እድሜዬን በሙሉ ሳወድስህ ልኑር
ብቻህን ገናናው በሰማይ በምድር

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 4
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 5
ሳልወጣ ከእቅፍህ ከህልውናህ
መገናኘትህ አጥሮኝ ልኑር ሳመልክህ
በታላቅ ልእልና ከፍ ያልክ ያለ ልክ
መመለክ ሚገባህ አንተ ብቻ አምላክ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 6
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2dd9dfc8-0eb0-4a97-b0ec-b2ee245a681c'::uuid, 'lekidisit-silase', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- medahanalem-adanen-ethiopian ("Medahanalem adanen Ethiopian")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '45864672-9162-4f94-b175-ce6e40479f84'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::

VERSE 1
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::

CHORUS
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::

VERSE 1
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::

CHORUS
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::

VERSE 1
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::

CHORUS
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::',
        lyrics_transliteration = 'CHORUS
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::

VERSE 1
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::

CHORUS
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::',
        updated_at = clock_timestamp()::text
    WHERE import_id = '45864672-9162-4f94-b175-ce6e40479f84'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::

VERSE 1
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::

CHORUS
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '45864672-9162-4f94-b175-ce6e40479f84'::uuid, 'medahanalem-adanen-ethiopian', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- masitewal-sitilin ("Masitewal Sitilin")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'eec93ef8-5b85-445d-9d88-12d0e26a813b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 1
በአምስቱ አዕማድ የጸናችዉ ቁማ፤
የነፍስ ዕረፍት ነች ያለች አስቀድማ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 2
ያላቸዉ ከሚመስል የአምልኮ መልክ፤
ኃይልህን ለካዱት ሀሰት በመስበክ፤
ከሠራሃት ቅጽርህ በጽኑ መሠረት፤
ከመንጋዉ ተለዩ በኑፋቄ ትምህርት፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 3
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
ማርያም ማርያም ብትል በሠርክ በማለዳ፤
ስለሰጠችን ነዉ መድኃኒትን ወልዳ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 4
ነገረ ቅዱሳን ቢሰበክ በአዋጅ፤
መች ጋረዱንና ገለጡልን እንጅ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 5
ከ 3000 ዘመን ቀድማ ለታነጸች፤
አምላክ ወልደ አምላክ መሆኑን ላመነች፤
አይሆንም እየሱስ እንግዳ ዜናዋ፤
እርሱ ነዉ ያሰገኛት እርሱ ነዉ ሰሪዋ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 6
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
የስጋን ነዉ እንጅ የነፍስን ሳያዩ፤
ከፀጋዉ ግምጃ ቤት ርቀዉ ተለዩ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 7
ሃይማኖት እያለኝ ምግባር ለጎደለኝ፤
ለኔም ማስተዋሉን አይምሮን ስጠኝ::

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 1
Beamstu aemad yets’enachwu quma;
Yenefs ereft nech yalech asqedma;
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 2
Yalachewu kemimesl yeamlko melk;
Haylhn lekadut heset bemesbek;
Keserahat qits’rh bets’nu meseret;
Kemengawu teleyu benufaqe timhrt;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 3
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)
Maryam Maryam bitl beserk bemaleda;
Sileset’echn newu medhanitn welda;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 4
Negere Kidusan bisebek beawaj;
Mech garedunna gelet’uln enj;
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 5
Ke 3000 zemen qedma letanets’ech;
Amlak welde amlak mehonun lamenech;
Ayhonm eyesus engda zenawa;
Ersu newu yasegegnat ersu newu seriwa;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 6
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)
Yesgan newu enj yenefsn sayayu;
Kets’egawu gimja bet riqewu teleyu;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 7
Haymanot eyalegn migbar legodelegn;
Lenem mastewalun aymron sit’egn::

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 1
በአምስቱ አዕማድ የጸናችዉ ቁማ፤
የነፍስ ዕረፍት ነች ያለች አስቀድማ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 2
ያላቸዉ ከሚመስል የአምልኮ መልክ፤
ኃይልህን ለካዱት ሀሰት በመስበክ፤
ከሠራሃት ቅጽርህ በጽኑ መሠረት፤
ከመንጋዉ ተለዩ በኑፋቄ ትምህርት፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 3
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
ማርያም ማርያም ብትል በሠርክ በማለዳ፤
ስለሰጠችን ነዉ መድኃኒትን ወልዳ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 4
ነገረ ቅዱሳን ቢሰበክ በአዋጅ፤
መች ጋረዱንና ገለጡልን እንጅ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 5
ከ 3000 ዘመን ቀድማ ለታነጸች፤
አምላክ ወልደ አምላክ መሆኑን ላመነች፤
አይሆንም እየሱስ እንግዳ ዜናዋ፤
እርሱ ነዉ ያሰገኛት እርሱ ነዉ ሰሪዋ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 6
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
የስጋን ነዉ እንጅ የነፍስን ሳያዩ፤
ከፀጋዉ ግምጃ ቤት ርቀዉ ተለዩ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 7
ሃይማኖት እያለኝ ምግባር ለጎደለኝ፤
ለኔም ማስተዋሉን አይምሮን ስጠኝ::

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤',
        lyrics_transliteration = 'CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 1
Beamstu aemad yets’enachwu quma;
Yenefs ereft nech yalech asqedma;
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 2
Yalachewu kemimesl yeamlko melk;
Haylhn lekadut heset bemesbek;
Keserahat qits’rh bets’nu meseret;
Kemengawu teleyu benufaqe timhrt;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 3
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)
Maryam Maryam bitl beserk bemaleda;
Sileset’echn newu medhanitn welda;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 4
Negere Kidusan bisebek beawaj;
Mech garedunna gelet’uln enj;
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 5
Ke 3000 zemen qedma letanets’ech;
Amlak welde amlak mehonun lamenech;
Ayhonm eyesus engda zenawa;
Ersu newu yasegegnat ersu newu seriwa;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 6
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)
Yesgan newu enj yenefsn sayayu;
Kets’egawu gimja bet riqewu teleyu;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 7
Haymanot eyalegn migbar legodelegn;
Lenem mastewalun aymron sit’egn::

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'eec93ef8-5b85-445d-9d88-12d0e26a813b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 1
በአምስቱ አዕማድ የጸናችዉ ቁማ፤
የነፍስ ዕረፍት ነች ያለች አስቀድማ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 2
ያላቸዉ ከሚመስል የአምልኮ መልክ፤
ኃይልህን ለካዱት ሀሰት በመስበክ፤
ከሠራሃት ቅጽርህ በጽኑ መሠረት፤
ከመንጋዉ ተለዩ በኑፋቄ ትምህርት፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 3
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
ማርያም ማርያም ብትል በሠርክ በማለዳ፤
ስለሰጠችን ነዉ መድኃኒትን ወልዳ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 4
ነገረ ቅዱሳን ቢሰበክ በአዋጅ፤
መች ጋረዱንና ገለጡልን እንጅ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 5
ከ 3000 ዘመን ቀድማ ለታነጸች፤
አምላክ ወልደ አምላክ መሆኑን ላመነች፤
አይሆንም እየሱስ እንግዳ ዜናዋ፤
እርሱ ነዉ ያሰገኛት እርሱ ነዉ ሰሪዋ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 6
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
የስጋን ነዉ እንጅ የነፍስን ሳያዩ፤
ከፀጋዉ ግምጃ ቤት ርቀዉ ተለዩ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 7
ሃይማኖት እያለኝ ምግባር ለጎደለኝ፤
ለኔም ማስተዋሉን አይምሮን ስጠኝ::

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'eec93ef8-5b85-445d-9d88-12d0e26a813b'::uuid, 'masitewal-sitilin', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- belibe-ketema-temelalesibet-3746 ("Belibe Ketema Temelalesibet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'aa73ed79-1ad2-4d72-918d-5b6f0c2ddd2f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 1
ባለፀጋ ስትሆን ድሆች ከበውሃል
ለንግስና ዙፋን አህያን መርጠሃል
አጀብ አትፈልግም አውቃለሁ ጌታ
ብቻህን ነበረ ደጄን ስትመታ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 2
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 3
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)
ድንግዝግዝ ኑሮዬ በምራቅህ ይብራ
ጨለማ አይዝህም አንተ ስትሰራ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 4
ማረኝ ያለህ እጆች ሲያሸበሽቡልህ
ሰምቼ አልቀረሁም በብርሃን አየሁህ
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 5
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 6
ከያዕቆብ ጉድጓድ ብቀዳም አብዝቼ
ዛሬም በጥማት ነኝ ከቶ መች ረክቼ
የህይወት ውሃ ምንጭ ነፍስን የምትመልስ
በበረሃው ልቤ ለዘላለም ፍሰስ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 7
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 1
Balets’ega sithon dihoch kebewhal
Lengsna zufan ahyan mert’ehal
Ajeb atfelgm awqalehu Geta
Bichahn nebere dejen sitmeta

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 2
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 3
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)
Dingzgz nuroye bemraqh yibra
Ch’elema ayzhm ante sitsera

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 4
Maregn yaleh ejoch siyashebeshbulh
Semche alqerehum bebrhan ayehuh
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 5
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 6
Keyaeqob gudgwad biqedam abzche
Zarem bet’mat negn keto mech rekche
Yehywet wiha minch’ nefsn yemtmels
Beberehaw libe lezelalem fises

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 7
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 1
ባለፀጋ ስትሆን ድሆች ከበውሃል
ለንግስና ዙፋን አህያን መርጠሃል
አጀብ አትፈልግም አውቃለሁ ጌታ
ብቻህን ነበረ ደጄን ስትመታ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 2
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 3
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)
ድንግዝግዝ ኑሮዬ በምራቅህ ይብራ
ጨለማ አይዝህም አንተ ስትሰራ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 4
ማረኝ ያለህ እጆች ሲያሸበሽቡልህ
ሰምቼ አልቀረሁም በብርሃን አየሁህ
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 5
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 6
ከያዕቆብ ጉድጓድ ብቀዳም አብዝቼ
ዛሬም በጥማት ነኝ ከቶ መች ረክቼ
የህይወት ውሃ ምንጭ ነፍስን የምትመልስ
በበረሃው ልቤ ለዘላለም ፍሰስ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 7
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)',
        lyrics_transliteration = 'CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 1
Balets’ega sithon dihoch kebewhal
Lengsna zufan ahyan mert’ehal
Ajeb atfelgm awqalehu Geta
Bichahn nebere dejen sitmeta

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 2
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 3
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)
Dingzgz nuroye bemraqh yibra
Ch’elema ayzhm ante sitsera

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 4
Maregn yaleh ejoch siyashebeshbulh
Semche alqerehum bebrhan ayehuh
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 5
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 6
Keyaeqob gudgwad biqedam abzche
Zarem bet’mat negn keto mech rekche
Yehywet wiha minch’ nefsn yemtmels
Beberehaw libe lezelalem fises

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 7
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'aa73ed79-1ad2-4d72-918d-5b6f0c2ddd2f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 1
ባለፀጋ ስትሆን ድሆች ከበውሃል
ለንግስና ዙፋን አህያን መርጠሃል
አጀብ አትፈልግም አውቃለሁ ጌታ
ብቻህን ነበረ ደጄን ስትመታ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 2
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 3
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)
ድንግዝግዝ ኑሮዬ በምራቅህ ይብራ
ጨለማ አይዝህም አንተ ስትሰራ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 4
ማረኝ ያለህ እጆች ሲያሸበሽቡልህ
ሰምቼ አልቀረሁም በብርሃን አየሁህ
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 5
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 6
ከያዕቆብ ጉድጓድ ብቀዳም አብዝቼ
ዛሬም በጥማት ነኝ ከቶ መች ረክቼ
የህይወት ውሃ ምንጭ ነፍስን የምትመልስ
በበረሃው ልቤ ለዘላለም ፍሰስ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 7
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'aa73ed79-1ad2-4d72-918d-5b6f0c2ddd2f'::uuid, 'belibe-ketema-temelalesibet-3746', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- erisu-fitsum-lilik ("Erisu Fitsum Lilik")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'afb14214-07ab-45fe-9aec-b681c65c1009'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 1
ጫማውን ልሸከም ከቶ የማይገባኝ
እኔን አስቀድሞ ለአገልግሎት ጠራኝ
ከኃላዬ የመጠው ነበር ከፊቴ
በስሙ ታምኑ ዘንድ እርሱ ነው ስስብከቴ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 2
በምድረ በዳ ላይ የጮኹለት ንጉስ
የኃያላን ኃያል ተገልጧል እየሱስ
ለኃጥአት ስርየት ይሰዋል ይሄ በግ
ለዓለም ሁሉ መዳን በቀራንዮ ሰርግ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 3
ለንስሃ የሚሆን ፍሬ ዛሬ አድርጉ
ለሰርጉ ሊጠራን መቷል እና በጉ
ከሚመጣው ቁጣ በእርሱ እንድታመልጡ
የእፉኝት ልጆች ከባቢሎን ውጡ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 4
የአብርሃም ልጆች ነን በማለት ላትድኑ
የመዳኑን ሰዓት ቀኑን አታባክኑ
ለአብርሃም ልጆችን ከድንጋይ ያስነሳል
መንሹም በእጁ ነው አውድማው ይጠራል

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 5
ጠማማው ልብ ይቅና ጥርጊያው ይስተካከል
ፍሬ የሌለው ዛፍ በእቶን ሳይቃጠል
ምሳር በዛፎች ስር ዛሬም ተቀምጧል
ንስሃ ግቡ ነው የመጨረሻው ቃል

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 1
Ch’amawn lishekem keto yemaygebagn
Enen asqedmo leagelglot t’eragn
Kehalaye yemet’ew neber kefite
Besmu tamnu zend ersu new sisbkete

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 2
Bemdre beda lay yech’oኹlet nigus
Yehayalan hayal tegelt’wal eyesus
Lehat’at siryet yisewal yihe beg
Lealem hulu medan beqeranyo serg

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 3
Lensha yemihon fire zare adrgu
Lesergu lit’eran metwal ena begu
Kemimet’aw qut’a beersu endtamelt’u
Yeefugnt lijoch kebabilon wit’u

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 4
Yeabrham lijoch nen bemalet latdnu
Yemedanun seat qenun atabaknu
Leabrham lijochn kedngay yasnesal
Menshum beeju new awdmaw yit’eral

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 5
T’emamaw lib yiqna t’rgiyaw yistekakel
Fire yelelew zaf beeton sayqat’el
Misar bezafoch sir zarem teqemt’wal
Nisha gibu new yemech’ereshaw qal

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 1
ጫማውን ልሸከም ከቶ የማይገባኝ
እኔን አስቀድሞ ለአገልግሎት ጠራኝ
ከኃላዬ የመጠው ነበር ከፊቴ
በስሙ ታምኑ ዘንድ እርሱ ነው ስስብከቴ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 2
በምድረ በዳ ላይ የጮኹለት ንጉስ
የኃያላን ኃያል ተገልጧል እየሱስ
ለኃጥአት ስርየት ይሰዋል ይሄ በግ
ለዓለም ሁሉ መዳን በቀራንዮ ሰርግ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 3
ለንስሃ የሚሆን ፍሬ ዛሬ አድርጉ
ለሰርጉ ሊጠራን መቷል እና በጉ
ከሚመጣው ቁጣ በእርሱ እንድታመልጡ
የእፉኝት ልጆች ከባቢሎን ውጡ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 4
የአብርሃም ልጆች ነን በማለት ላትድኑ
የመዳኑን ሰዓት ቀኑን አታባክኑ
ለአብርሃም ልጆችን ከድንጋይ ያስነሳል
መንሹም በእጁ ነው አውድማው ይጠራል

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 5
ጠማማው ልብ ይቅና ጥርጊያው ይስተካከል
ፍሬ የሌለው ዛፍ በእቶን ሳይቃጠል
ምሳር በዛፎች ስር ዛሬም ተቀምጧል
ንስሃ ግቡ ነው የመጨረሻው ቃል

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)',
        lyrics_transliteration = 'CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 1
Ch’amawn lishekem keto yemaygebagn
Enen asqedmo leagelglot t’eragn
Kehalaye yemet’ew neber kefite
Besmu tamnu zend ersu new sisbkete

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 2
Bemdre beda lay yech’oኹlet nigus
Yehayalan hayal tegelt’wal eyesus
Lehat’at siryet yisewal yihe beg
Lealem hulu medan beqeranyo serg

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 3
Lensha yemihon fire zare adrgu
Lesergu lit’eran metwal ena begu
Kemimet’aw qut’a beersu endtamelt’u
Yeefugnt lijoch kebabilon wit’u

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 4
Yeabrham lijoch nen bemalet latdnu
Yemedanun seat qenun atabaknu
Leabrham lijochn kedngay yasnesal
Menshum beeju new awdmaw yit’eral

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 5
T’emamaw lib yiqna t’rgiyaw yistekakel
Fire yelelew zaf beeton sayqat’el
Misar bezafoch sir zarem teqemt’wal
Nisha gibu new yemech’ereshaw qal

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'afb14214-07ab-45fe-9aec-b681c65c1009'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 1
ጫማውን ልሸከም ከቶ የማይገባኝ
እኔን አስቀድሞ ለአገልግሎት ጠራኝ
ከኃላዬ የመጠው ነበር ከፊቴ
በስሙ ታምኑ ዘንድ እርሱ ነው ስስብከቴ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 2
በምድረ በዳ ላይ የጮኹለት ንጉስ
የኃያላን ኃያል ተገልጧል እየሱስ
ለኃጥአት ስርየት ይሰዋል ይሄ በግ
ለዓለም ሁሉ መዳን በቀራንዮ ሰርግ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 3
ለንስሃ የሚሆን ፍሬ ዛሬ አድርጉ
ለሰርጉ ሊጠራን መቷል እና በጉ
ከሚመጣው ቁጣ በእርሱ እንድታመልጡ
የእፉኝት ልጆች ከባቢሎን ውጡ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 4
የአብርሃም ልጆች ነን በማለት ላትድኑ
የመዳኑን ሰዓት ቀኑን አታባክኑ
ለአብርሃም ልጆችን ከድንጋይ ያስነሳል
መንሹም በእጁ ነው አውድማው ይጠራል

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 5
ጠማማው ልብ ይቅና ጥርጊያው ይስተካከል
ፍሬ የሌለው ዛፍ በእቶን ሳይቃጠል
ምሳር በዛፎች ስር ዛሬም ተቀምጧል
ንስሃ ግቡ ነው የመጨረሻው ቃል

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'afb14214-07ab-45fe-9aec-b681c65c1009'::uuid, 'erisu-fitsum-lilik', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adanegn-geta-kibire-new ("Adanegn Geta Kibire New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '567c4b39-b72c-45fa-ab59-ad4dbe8ca4b9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ',
        lyrics_transliteration = 'CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '567c4b39-b72c-45fa-ab59-ad4dbe8ca4b9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '567c4b39-b72c-45fa-ab59-ad4dbe8ca4b9'::uuid, 'adanegn-geta-kibire-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
