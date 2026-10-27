-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 10 OF 32
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
  -- alegn-widase-belike-lisanat-cherinet-senay ("Alegn Widase Belike Lisanat Cherinet Senay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a1ea01e2-4fe6-4cdc-8eea-f001719eea6c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 1
ክብሬን ጥዪልህ ዙፋንህ ፊት ኣለኝ ውዳሴ
የሜልኮን ንቀት መች ይታየኛል ኣለኝ ምስጋና
ፍቅርህ ፍርሃቴን ኣውልቆልኛል ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 2
ስድቧን ቢያስወግድ መካኗን ሃና ኣለኝ ምስጋና
በልጆች ባርኮ ቢያደርጋት ቀና ኣለኝ ውዳሴ
ብላ ዘመረች ኣዋቂ ነህ ኣለኝ ምስጋና
የኔም ምስጋና ደርሷል ፊትህ ኣለኝ ውዳሴ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 3
ኣዝማች . . . . . . . .
ውሃው ቢፈላ ቢነድ እሳቱ ኣለኝ ምስጋና
በእጥፍ ንዱዋል ፍቅርህ ጽናቱ ኣለኝ ውዳሴ
ከቶ ኣላቆምም ቅኔና ዜማ ኣለኝ ምስጋና

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 4
እስከ ምድር ጫፍ ማዳንህ ይሰማ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ከተራራዋ ወርደህ ኣለቱ ኣለኝ ምስጋና
በክብር ስትነግስ ኣይቷል ፍጥረቱ ኣለኝ ውዳሴ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 5
ዛሬም ነግሰሃል በልቤ ላይ ኣለኝ ምስጋና
ኣብራ በቤቴ የኔ ጸሃይ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ክብር ለስምህ ክብር ላንተ (2)

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 6
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ (3)
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 1
Kibren t’yilh zufanh fit alegn widase
Yemelkon niqet mech yitayegnal alegn misgana
Fiqrh firhaten awlqolgnal alegn widase
Azmach . . . . . . . .

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 2
Sidbwan biyaswegd mekanwan hana alegn misgana
Beljoch barko biyadergat qena alegn widase
Bila zemerech awaqi neh alegn misgana
Yenem misgana derswal fith alegn widase

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 3
Azmach . . . . . . . .
Wihaw bifela bined esatu alegn misgana
Beet’f niduwal fiqrh ts’natu alegn widase
Keto alaqomm qinena zema alegn misgana

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 4
Eske midr ch’af madanh yisema alegn widase
Azmach . . . . . . . .
Keterarawa werdeh aletu alegn misgana
Bekbr sitnegs aytwal fit’retu alegn widase

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 5
Zarem negsehal belbe lay alegn misgana
Abra bebete yene ts’ehay alegn widase
Azmach . . . . . . . .
Kibir lesmh kibir lante (2)

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 6
Misgana qit’ru laferese
Kibir lesmh kibir lante (3)
Misgana qit’ru laferese
Kibir lesmh kibir lante

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 1
ክብሬን ጥዪልህ ዙፋንህ ፊት ኣለኝ ውዳሴ
የሜልኮን ንቀት መች ይታየኛል ኣለኝ ምስጋና
ፍቅርህ ፍርሃቴን ኣውልቆልኛል ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 2
ስድቧን ቢያስወግድ መካኗን ሃና ኣለኝ ምስጋና
በልጆች ባርኮ ቢያደርጋት ቀና ኣለኝ ውዳሴ
ብላ ዘመረች ኣዋቂ ነህ ኣለኝ ምስጋና
የኔም ምስጋና ደርሷል ፊትህ ኣለኝ ውዳሴ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 3
ኣዝማች . . . . . . . .
ውሃው ቢፈላ ቢነድ እሳቱ ኣለኝ ምስጋና
በእጥፍ ንዱዋል ፍቅርህ ጽናቱ ኣለኝ ውዳሴ
ከቶ ኣላቆምም ቅኔና ዜማ ኣለኝ ምስጋና

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 4
እስከ ምድር ጫፍ ማዳንህ ይሰማ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ከተራራዋ ወርደህ ኣለቱ ኣለኝ ምስጋና
በክብር ስትነግስ ኣይቷል ፍጥረቱ ኣለኝ ውዳሴ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 5
ዛሬም ነግሰሃል በልቤ ላይ ኣለኝ ምስጋና
ኣብራ በቤቴ የኔ ጸሃይ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ክብር ለስምህ ክብር ላንተ (2)

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 6
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ (3)
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና',
        lyrics_transliteration = 'CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 1
Kibren t’yilh zufanh fit alegn widase
Yemelkon niqet mech yitayegnal alegn misgana
Fiqrh firhaten awlqolgnal alegn widase
Azmach . . . . . . . .

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 2
Sidbwan biyaswegd mekanwan hana alegn misgana
Beljoch barko biyadergat qena alegn widase
Bila zemerech awaqi neh alegn misgana
Yenem misgana derswal fith alegn widase

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 3
Azmach . . . . . . . .
Wihaw bifela bined esatu alegn misgana
Beet’f niduwal fiqrh ts’natu alegn widase
Keto alaqomm qinena zema alegn misgana

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 4
Eske midr ch’af madanh yisema alegn widase
Azmach . . . . . . . .
Keterarawa werdeh aletu alegn misgana
Bekbr sitnegs aytwal fit’retu alegn widase

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 5
Zarem negsehal belbe lay alegn misgana
Abra bebete yene ts’ehay alegn widase
Azmach . . . . . . . .
Kibir lesmh kibir lante (2)

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 6
Misgana qit’ru laferese
Kibir lesmh kibir lante (3)
Misgana qit’ru laferese
Kibir lesmh kibir lante

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a1ea01e2-4fe6-4cdc-8eea-f001719eea6c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 1
ክብሬን ጥዪልህ ዙፋንህ ፊት ኣለኝ ውዳሴ
የሜልኮን ንቀት መች ይታየኛል ኣለኝ ምስጋና
ፍቅርህ ፍርሃቴን ኣውልቆልኛል ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 2
ስድቧን ቢያስወግድ መካኗን ሃና ኣለኝ ምስጋና
በልጆች ባርኮ ቢያደርጋት ቀና ኣለኝ ውዳሴ
ብላ ዘመረች ኣዋቂ ነህ ኣለኝ ምስጋና
የኔም ምስጋና ደርሷል ፊትህ ኣለኝ ውዳሴ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 3
ኣዝማች . . . . . . . .
ውሃው ቢፈላ ቢነድ እሳቱ ኣለኝ ምስጋና
በእጥፍ ንዱዋል ፍቅርህ ጽናቱ ኣለኝ ውዳሴ
ከቶ ኣላቆምም ቅኔና ዜማ ኣለኝ ምስጋና

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 4
እስከ ምድር ጫፍ ማዳንህ ይሰማ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ከተራራዋ ወርደህ ኣለቱ ኣለኝ ምስጋና
በክብር ስትነግስ ኣይቷል ፍጥረቱ ኣለኝ ውዳሴ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 5
ዛሬም ነግሰሃል በልቤ ላይ ኣለኝ ምስጋና
ኣብራ በቤቴ የኔ ጸሃይ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ክብር ለስምህ ክብር ላንተ (2)

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 6
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ (3)
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a1ea01e2-4fe6-4cdc-8eea-f001719eea6c'::uuid, 'alegn-widase-belike-lisanat-cherinet-senay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- arikesh-newiren-shefenish-enidale-dereje ("Arikesh_newiren_shefenish Enidale Dereje")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2774d6bd-0688-4bf0-971e-b345464a815f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 1
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 2
እንደ ሐና ሆኜ በቤተ መቅደስ
በመረረ ኃዘን ነው እኔ እማለቅስ
ፍረጅልኝ እና ልመለስ ከቤቴ
ሀዘኔን በደስታ ለውጭው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 3
በግራም በቀኜም ጠላት ቢከበኝ
አብዝቼ እጮሀለሁ እናቴ ስሚኝ
መከራው በዝቶ ግራ ገብቶኛል
ድምጽሽን ልስማው ያረጋጋኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 4
የሰው ሕይወቱ ብርቱ ሰልፍ ነው
ደስታ እና ኃዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 5
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 6
በምርኮ ሳለው በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለው
በተአምራትሽ እኔ ድኛለው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 7
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ
የጌታዬ እናት እኔን አሰበቺኝ
ታሪኬን ቀይራ ይኸው ባረከቺኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 8
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማዕበሉም ይታዘዝልኛል
ወይን እኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጂው ነይ የእኛ እመቤት

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 9
ስምሽ ሲጠራ በየቦታዉ
ይመላልና የጎደለዉ
ግራ የገባው የቸገረዉ
ድንግልን ይጥራት እንድትረዳዉ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 10
ሳዝን ስተክዝ የምታጽናና
እናት አለቺኝ ርኅርኅተ ልቡና
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 1
Newr alebgn bizu sidb
Anjet yemilt’ lib yemiyaqosl
Simen lewt’ew biyanqwashshugn
Behezen beleqso Dingil met’ahugn

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 2
Ende hena hogne bebete meqdes
Bemerere hazen new ene emaleqs
Firejlgn ena limeles kebete
Hezenen bedesta lewch’w enate

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 3
Begram beqegnem t’elat bikebegn
Abzche ech’ohelehu enate simign
Mekeraw bezto gira gebtognal
Dimts’shn lismaw yaregagagnal

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 4
Yesew hiywetu birtu self new
Desta ena hazen yemayleyew
Beejachn wedqwal silugn t’elatoche
Amelet’kwachew simshn t’erche

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 5
Sew yezerawn yannu yach’dal
Beqoferew gudgwad rasu yigebal
Enate Emebete biye sit’rash
Kemekeraw hulu tawech’ignalesh

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 6
Bemrko salew besew heger
Gif wilewbgn sinor beesr
Miljash dersolgn tefetchalew
Beteamratsh ene dignalew

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 7
Qalshn semto ts’nsu segede
Bilalech elsabet’ newre tewegede
Yegetaye enat enen asebechign
Tariken qeyra yiኸw barekechign

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 8
Yeemebete kehonku man yiqawemegnal
Wejebum maebelum yitazezlgnal
Weyn eko alqwal yedokimas bet
Dingil amaljiw ney yeegna emebet

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 9
Simsh sit’era beyebotawu
Yimelalna yegodelewu
Gira yegebaw yechegerewu
Dingln yit’rat endtredawu

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 10
Sazn sitekz yemtats’nana
Enat alechign rihrhte libuna
Enate Emebete biye sit’rash
Kemekeraw hulu tawech’ignalesh

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 1
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 2
እንደ ሐና ሆኜ በቤተ መቅደስ
በመረረ ኃዘን ነው እኔ እማለቅስ
ፍረጅልኝ እና ልመለስ ከቤቴ
ሀዘኔን በደስታ ለውጭው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 3
በግራም በቀኜም ጠላት ቢከበኝ
አብዝቼ እጮሀለሁ እናቴ ስሚኝ
መከራው በዝቶ ግራ ገብቶኛል
ድምጽሽን ልስማው ያረጋጋኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 4
የሰው ሕይወቱ ብርቱ ሰልፍ ነው
ደስታ እና ኃዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 5
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 6
በምርኮ ሳለው በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለው
በተአምራትሽ እኔ ድኛለው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 7
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ
የጌታዬ እናት እኔን አሰበቺኝ
ታሪኬን ቀይራ ይኸው ባረከቺኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 8
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማዕበሉም ይታዘዝልኛል
ወይን እኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጂው ነይ የእኛ እመቤት

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 9
ስምሽ ሲጠራ በየቦታዉ
ይመላልና የጎደለዉ
ግራ የገባው የቸገረዉ
ድንግልን ይጥራት እንድትረዳዉ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 10
ሳዝን ስተክዝ የምታጽናና
እናት አለቺኝ ርኅርኅተ ልቡና
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ',
        lyrics_transliteration = 'CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 1
Newr alebgn bizu sidb
Anjet yemilt’ lib yemiyaqosl
Simen lewt’ew biyanqwashshugn
Behezen beleqso Dingil met’ahugn

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 2
Ende hena hogne bebete meqdes
Bemerere hazen new ene emaleqs
Firejlgn ena limeles kebete
Hezenen bedesta lewch’w enate

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 3
Begram beqegnem t’elat bikebegn
Abzche ech’ohelehu enate simign
Mekeraw bezto gira gebtognal
Dimts’shn lismaw yaregagagnal

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 4
Yesew hiywetu birtu self new
Desta ena hazen yemayleyew
Beejachn wedqwal silugn t’elatoche
Amelet’kwachew simshn t’erche

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 5
Sew yezerawn yannu yach’dal
Beqoferew gudgwad rasu yigebal
Enate Emebete biye sit’rash
Kemekeraw hulu tawech’ignalesh

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 6
Bemrko salew besew heger
Gif wilewbgn sinor beesr
Miljash dersolgn tefetchalew
Beteamratsh ene dignalew

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 7
Qalshn semto ts’nsu segede
Bilalech elsabet’ newre tewegede
Yegetaye enat enen asebechign
Tariken qeyra yiኸw barekechign

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 8
Yeemebete kehonku man yiqawemegnal
Wejebum maebelum yitazezlgnal
Weyn eko alqwal yedokimas bet
Dingil amaljiw ney yeegna emebet

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 9
Simsh sit’era beyebotawu
Yimelalna yegodelewu
Gira yegebaw yechegerewu
Dingln yit’rat endtredawu

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 10
Sazn sitekz yemtats’nana
Enat alechign rihrhte libuna
Enate Emebete biye sit’rash
Kemekeraw hulu tawech’ignalesh

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2774d6bd-0688-4bf0-971e-b345464a815f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 1
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 2
እንደ ሐና ሆኜ በቤተ መቅደስ
በመረረ ኃዘን ነው እኔ እማለቅስ
ፍረጅልኝ እና ልመለስ ከቤቴ
ሀዘኔን በደስታ ለውጭው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 3
በግራም በቀኜም ጠላት ቢከበኝ
አብዝቼ እጮሀለሁ እናቴ ስሚኝ
መከራው በዝቶ ግራ ገብቶኛል
ድምጽሽን ልስማው ያረጋጋኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 4
የሰው ሕይወቱ ብርቱ ሰልፍ ነው
ደስታ እና ኃዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 5
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 6
በምርኮ ሳለው በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለው
በተአምራትሽ እኔ ድኛለው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 7
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ
የጌታዬ እናት እኔን አሰበቺኝ
ታሪኬን ቀይራ ይኸው ባረከቺኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 8
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማዕበሉም ይታዘዝልኛል
ወይን እኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጂው ነይ የእኛ እመቤት

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 9
ስምሽ ሲጠራ በየቦታዉ
ይመላልና የጎደለዉ
ግራ የገባው የቸገረዉ
ድንግልን ይጥራት እንድትረዳዉ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 10
ሳዝን ስተክዝ የምታጽናና
እናት አለቺኝ ርኅርኅተ ልቡና
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2774d6bd-0688-4bf0-971e-b345464a815f'::uuid, 'arikesh-newiren-shefenish-enidale-dereje', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- debre-zeyit ("Debre zeyit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0dba58f5-cdda-44d0-b9de-fbec16435150'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 1
የወጉት ሁሉም ያዩታል
አኧ ለፍርድ…
አንድበትም ሁሉ ዝም ይላል
የተከፈተ አፍ ዲዳ ይሆናል

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 2
መፅሐፍት ሁሉ ተዘርግተው
ይገለፃል የሁሉ ሥራው
አኧ ለፍርድ…
ዓለም በሐጢያቱ ይቀጣል

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 3
የትዕቢቱ ኩራት ይሻራል
ይዋረዳሉ ጨካኞቹ
ይከበራሉ ትሁቶቹ
አኧ ለፍርድ…

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 4
ለአሕዛብ ሊሆን ምስክር
የመግስቱ ወንጌል ሲነገር
ቅዱሱ ወንጌል ይሄን ብሏል
ፍጻሜ ዘመን ያኔ ይሆናል

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 5
አኧ ለፍርድ…
እንዲወጣ መብረቅ ከምስራቅ
እስከ ምዕራብ እንዲዘልቅ
የጌታ መምጣት እንደዚህ ነው

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 6
መንግሥትና ፍርዱ በእጁ ነው
አኧ ለፍርድ…
እንጠብቀ ተዝጋጅተን
ልባሞች ሆነን መብራት ይዘን

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 7
አናውቅምና ቀኒቱን የሙሽራው መምጫውን
እናውቅምና ሰዓቱን የሙሽራው መምጫውን

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 1
Yewegut hulum yayutal
Aኧ lefrd…
Andbetm hulu zim yilal
Yetekefete af dida yihonal

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 2
Mets’heft hulu tezergtew
Yigelets’al yehulu siraw
Aኧ lefrd…
Alem behet’iyatu yiqet’al

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 3
Yetebitu kurat yisharal
Yiwaredalu ch’ekagnochu
Yikeberalu tihutochu
Aኧ lefrd…

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 4
Leahzab lihon miskr
Yemegstu wengel sineger
Qidusu wengel yihen bilwal
Fits’ame zemen yane yihonal

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 5
Aኧ lefrd…
Endiwet’a mebreq kemsraq
Eske mierab endizelq
Yegeta memt’at endezih new

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 6
Mengstna firdu beeju new
Aኧ lefrd…
Ent’ebqe tezgajten
Libamoch honen mebrat yizen

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 7
Anawqmna qenitun yemushraw memch’awn
Enawqmna seatun yemushraw memch’awn

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 1
የወጉት ሁሉም ያዩታል
አኧ ለፍርድ…
አንድበትም ሁሉ ዝም ይላል
የተከፈተ አፍ ዲዳ ይሆናል

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 2
መፅሐፍት ሁሉ ተዘርግተው
ይገለፃል የሁሉ ሥራው
አኧ ለፍርድ…
ዓለም በሐጢያቱ ይቀጣል

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 3
የትዕቢቱ ኩራት ይሻራል
ይዋረዳሉ ጨካኞቹ
ይከበራሉ ትሁቶቹ
አኧ ለፍርድ…

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 4
ለአሕዛብ ሊሆን ምስክር
የመግስቱ ወንጌል ሲነገር
ቅዱሱ ወንጌል ይሄን ብሏል
ፍጻሜ ዘመን ያኔ ይሆናል

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 5
አኧ ለፍርድ…
እንዲወጣ መብረቅ ከምስራቅ
እስከ ምዕራብ እንዲዘልቅ
የጌታ መምጣት እንደዚህ ነው

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 6
መንግሥትና ፍርዱ በእጁ ነው
አኧ ለፍርድ…
እንጠብቀ ተዝጋጅተን
ልባሞች ሆነን መብራት ይዘን

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 7
አናውቅምና ቀኒቱን የሙሽራው መምጫውን
እናውቅምና ሰዓቱን የሙሽራው መምጫውን

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል',
        lyrics_transliteration = 'CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 1
Yewegut hulum yayutal
Aኧ lefrd…
Andbetm hulu zim yilal
Yetekefete af dida yihonal

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 2
Mets’heft hulu tezergtew
Yigelets’al yehulu siraw
Aኧ lefrd…
Alem behet’iyatu yiqet’al

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 3
Yetebitu kurat yisharal
Yiwaredalu ch’ekagnochu
Yikeberalu tihutochu
Aኧ lefrd…

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 4
Leahzab lihon miskr
Yemegstu wengel sineger
Qidusu wengel yihen bilwal
Fits’ame zemen yane yihonal

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 5
Aኧ lefrd…
Endiwet’a mebreq kemsraq
Eske mierab endizelq
Yegeta memt’at endezih new

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 6
Mengstna firdu beeju new
Aኧ lefrd…
Ent’ebqe tezgajten
Libamoch honen mebrat yizen

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 7
Anawqmna qenitun yemushraw memch’awn
Enawqmna seatun yemushraw memch’awn

CHORUS
Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0dba58f5-cdda-44d0-b9de-fbec16435150'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 1
የወጉት ሁሉም ያዩታል
አኧ ለፍርድ…
አንድበትም ሁሉ ዝም ይላል
የተከፈተ አፍ ዲዳ ይሆናል

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 2
መፅሐፍት ሁሉ ተዘርግተው
ይገለፃል የሁሉ ሥራው
አኧ ለፍርድ…
ዓለም በሐጢያቱ ይቀጣል

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 3
የትዕቢቱ ኩራት ይሻራል
ይዋረዳሉ ጨካኞቹ
ይከበራሉ ትሁቶቹ
አኧ ለፍርድ…

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 4
ለአሕዛብ ሊሆን ምስክር
የመግስቱ ወንጌል ሲነገር
ቅዱሱ ወንጌል ይሄን ብሏል
ፍጻሜ ዘመን ያኔ ይሆናል

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 5
አኧ ለፍርድ…
እንዲወጣ መብረቅ ከምስራቅ
እስከ ምዕራብ እንዲዘልቅ
የጌታ መምጣት እንደዚህ ነው

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 6
መንግሥትና ፍርዱ በእጁ ነው
አኧ ለፍርድ…
እንጠብቀ ተዝጋጅተን
ልባሞች ሆነን መብራት ይዘን

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 7
አናውቅምና ቀኒቱን የሙሽራው መምጫውን
እናውቅምና ሰዓቱን የሙሽራው መምጫውን

CHORUS
አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0dba58f5-cdda-44d0-b9de-fbec16435150'::uuid, 'debre-zeyit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tsehayin-yachelemew-tsehay ("Tsehayin Yachelemew Tsehay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '10678123-64c2-4685-a0bf-bd9db5ddba97'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 1
የማይሞተው ሞተ ሞትን እንዲሽር
አለምን ወደደ በዘላለም ፍቅር
እርሱ እየወደቀ እኛን አነሳን
እርሱ እየቆሰለ እኛን ፈወሰን

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 2
የብርሐን ዐይኗን ነበልባል ድንግል ማርያም ሸፍነች
አትናገርም ሲያጠጡት እያየች
አንድ ልጄ ወየው እያለች ድንግል አዘነች
አውነተኛው ጸሐይ ሳለ በመስቀል ላይ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 3
ጨረቃም ደም ሆነች እርቃኑ እንዳይታይ
ከዋክብት ረገፉ ሙታንም ተነሱ
አስገኚ ገዢያቸው ሲሰቀል ንጉሱ
ዮሐንስ ልቧን ደግፎ ከጎልጎታ ደረሰች

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 4
በጽኑ መከራ ወድቃ እየተነሳች
አንድ ልጇን በስስት አየች ድንግል አዘነች
በብርሐን ፊቱ ምራቅ ተተፋበት
የእግዚአብሔር ልጅ አይሁድ ዘበቱበት

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 5
የሞትነው ተነሳን የራቅነው ቀረብን
የቀራንዮ በግ ለኛ ተሰዋልን
ደረቷን ደቅታ ቀና አለች
ልጇን ልታየው በፍቅር

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 6
ሲደፉት ሲያዳፉት ሲጥሉት ከምድር
እርሱ እንደወንበዴ እየተቆጠረ
ቅዱሱ ተዋርዶ እኛን አከበረ
ከርስታችን ገባን በደሙ ማዕተብ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 7
ክርስቶስ እርሱ ነው የእረፍታችን ወደብ
በነፍሷ ሰይፍ አለፈ አለቀሰች ተንሰቅስቃ
በአይሁድ ጭካኔ እጅጉን ተሳቃ
በአንድ ልጇ አየች ሰቆቃ በምድር ወድቃ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 1
Yemaymotew mote motn endishr
Alemn wedede bezelalem fiqr
Ersu eyewedeqe egnan anesan
Ersu eyeqosele egnan fewesen

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 2
Yebrhen aynwan nebelbal Dingil Maryam shefnech
Atnagerm siyat’et’ut eyayech
And lije weyew eyalech Dingil azenech
Awnetegnaw ts’ehey sale bemesqel lay

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 3
Ch’ereqam dem honech erqanu endaytay
Kewakbt regefu mutanm tenesu
Asgegni gezhiyachew siseqel nigusu
Yohens libwan degfo kegolgota deresech

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 4
Bets’nu mekera wedqa eyetenesach
And lijwan besst ayech Dingil azenech
Bebrhen fitu miraq tetefabet
YeEgziabher lij ayhud zebetubet

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 5
Yemotnew tenesan yeraqnew qerebn
Yeqeranyo beg legna tesewaln
Deretwan deqta qena alech
Lijwan litayew befqr

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 6
Sidefut siyadafut sit’lut kemdr
Ersu endewenbede eyeteqot’ere
Qidusu tewardo egnan akebere
Kerstachn geban bedemu maeteb

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 7
Kristos ersu new yeereftachn wedeb
Benefswa seyf alefe aleqesech tenseqsqa
Beayhud ch’kane ejgun tesaqa
Beand lijwa ayech seqoqa bemdr wedqa

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 1
የማይሞተው ሞተ ሞትን እንዲሽር
አለምን ወደደ በዘላለም ፍቅር
እርሱ እየወደቀ እኛን አነሳን
እርሱ እየቆሰለ እኛን ፈወሰን

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 2
የብርሐን ዐይኗን ነበልባል ድንግል ማርያም ሸፍነች
አትናገርም ሲያጠጡት እያየች
አንድ ልጄ ወየው እያለች ድንግል አዘነች
አውነተኛው ጸሐይ ሳለ በመስቀል ላይ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 3
ጨረቃም ደም ሆነች እርቃኑ እንዳይታይ
ከዋክብት ረገፉ ሙታንም ተነሱ
አስገኚ ገዢያቸው ሲሰቀል ንጉሱ
ዮሐንስ ልቧን ደግፎ ከጎልጎታ ደረሰች

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 4
በጽኑ መከራ ወድቃ እየተነሳች
አንድ ልጇን በስስት አየች ድንግል አዘነች
በብርሐን ፊቱ ምራቅ ተተፋበት
የእግዚአብሔር ልጅ አይሁድ ዘበቱበት

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 5
የሞትነው ተነሳን የራቅነው ቀረብን
የቀራንዮ በግ ለኛ ተሰዋልን
ደረቷን ደቅታ ቀና አለች
ልጇን ልታየው በፍቅር

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 6
ሲደፉት ሲያዳፉት ሲጥሉት ከምድር
እርሱ እንደወንበዴ እየተቆጠረ
ቅዱሱ ተዋርዶ እኛን አከበረ
ከርስታችን ገባን በደሙ ማዕተብ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 7
ክርስቶስ እርሱ ነው የእረፍታችን ወደብ
በነፍሷ ሰይፍ አለፈ አለቀሰች ተንሰቅስቃ
በአይሁድ ጭካኔ እጅጉን ተሳቃ
በአንድ ልጇ አየች ሰቆቃ በምድር ወድቃ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ',
        lyrics_transliteration = 'CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 1
Yemaymotew mote motn endishr
Alemn wedede bezelalem fiqr
Ersu eyewedeqe egnan anesan
Ersu eyeqosele egnan fewesen

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 2
Yebrhen aynwan nebelbal Dingil Maryam shefnech
Atnagerm siyat’et’ut eyayech
And lije weyew eyalech Dingil azenech
Awnetegnaw ts’ehey sale bemesqel lay

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 3
Ch’ereqam dem honech erqanu endaytay
Kewakbt regefu mutanm tenesu
Asgegni gezhiyachew siseqel nigusu
Yohens libwan degfo kegolgota deresech

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 4
Bets’nu mekera wedqa eyetenesach
And lijwan besst ayech Dingil azenech
Bebrhen fitu miraq tetefabet
YeEgziabher lij ayhud zebetubet

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 5
Yemotnew tenesan yeraqnew qerebn
Yeqeranyo beg legna tesewaln
Deretwan deqta qena alech
Lijwan litayew befqr

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 6
Sidefut siyadafut sit’lut kemdr
Ersu endewenbede eyeteqot’ere
Qidusu tewardo egnan akebere
Kerstachn geban bedemu maeteb

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 7
Kristos ersu new yeereftachn wedeb
Benefswa seyf alefe aleqesech tenseqsqa
Beayhud ch’kane ejgun tesaqa
Beand lijwa ayech seqoqa bemdr wedqa

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega',
        updated_at = clock_timestamp()::text
    WHERE import_id = '10678123-64c2-4685-a0bf-bd9db5ddba97'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 1
የማይሞተው ሞተ ሞትን እንዲሽር
አለምን ወደደ በዘላለም ፍቅር
እርሱ እየወደቀ እኛን አነሳን
እርሱ እየቆሰለ እኛን ፈወሰን

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 2
የብርሐን ዐይኗን ነበልባል ድንግል ማርያም ሸፍነች
አትናገርም ሲያጠጡት እያየች
አንድ ልጄ ወየው እያለች ድንግል አዘነች
አውነተኛው ጸሐይ ሳለ በመስቀል ላይ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 3
ጨረቃም ደም ሆነች እርቃኑ እንዳይታይ
ከዋክብት ረገፉ ሙታንም ተነሱ
አስገኚ ገዢያቸው ሲሰቀል ንጉሱ
ዮሐንስ ልቧን ደግፎ ከጎልጎታ ደረሰች

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 4
በጽኑ መከራ ወድቃ እየተነሳች
አንድ ልጇን በስስት አየች ድንግል አዘነች
በብርሐን ፊቱ ምራቅ ተተፋበት
የእግዚአብሔር ልጅ አይሁድ ዘበቱበት

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 5
የሞትነው ተነሳን የራቅነው ቀረብን
የቀራንዮ በግ ለኛ ተሰዋልን
ደረቷን ደቅታ ቀና አለች
ልጇን ልታየው በፍቅር

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 6
ሲደፉት ሲያዳፉት ሲጥሉት ከምድር
እርሱ እንደወንበዴ እየተቆጠረ
ቅዱሱ ተዋርዶ እኛን አከበረ
ከርስታችን ገባን በደሙ ማዕተብ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 7
ክርስቶስ እርሱ ነው የእረፍታችን ወደብ
በነፍሷ ሰይፍ አለፈ አለቀሰች ተንሰቅስቃ
በአይሁድ ጭካኔ እጅጉን ተሳቃ
በአንድ ልጇ አየች ሰቆቃ በምድር ወድቃ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '10678123-64c2-4685-a0bf-bd9db5ddba97'::uuid, 'tsehayin-yachelemew-tsehay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egiziabiher-kegna-gar-bayihon ("Egiziabiher Kegna Gar Bayihon")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2c1a3b51-358b-4ea2-a1ee-72f269204319'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 1
የነሃሱን መዝግያ ብረቱን ባይቆርጠው
በራሱ ችሎታ ማን ነበር ሚያመልጠው
ግን ሁሉም ኣለፈ ቀስ እያለ ነጋ
ለካስ ወድቆ ኣይወድቅም ኣንተን የተጠጋ (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 2
ያሻግራል ሲሉን ሰምተናል በዝና
ለሊት በዓምደ ብርሃን ቀኑን በደመና
ዛሬ ግን ተገልጧል መዳኑ በላየ
ወዳጄ እለዋለው ባለዉለታየ (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 3
ጸጉራችን ተላጭቶ ናዝራዊነታችን
ጭፍራው እያፋጨ ነግሶ በላያችን
እግዚኣብሔር ሲያስበን ጉልበታም ሆነናል
ምሶሶዉን ይዘን ጠላትን ፈጭተናል (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 4
ኣይችሉም እያለ ይፎክራል ጠላት
ኣሳላፊው ንጉስ የት ሄዶ የኛ አባት
የማይወጣውን ወጣነው ታግሰን
እልል እንላለን ከእርሱ ጋራ ነግሰን (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen

VERSE 1
Yenehasun mezgya biretun bayqort’ew
Berasu chlota man neber miyamelt’ew
Gin hulum alefe qes eyale nega
Lekas wedqo aywedqm anten yetet’ega (2)

CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen

VERSE 2
Yashagral silun semtenal bezna
Lelit beamde birhan qenun bedemena
Zare gin tegelt’wal medanu belaye
Wedaje elewalew balewuletaye (2)

CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen

VERSE 3
Ts’egurachn telach’to nazrawinetachn
Ch’fraw eyafach’e negso belayachn
Egziabher siyasben gulbetam honenal
Misosowun yizen t’elatn fech’tenal (2)

CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen

VERSE 4
Aychlum eyale yifokral t’elat
Asalafiw nigus yet hedo yegna abat
Yemaywet’awn wet’anew tagsen
Ell enlalen keersu gara negsen (2)

CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 1
የነሃሱን መዝግያ ብረቱን ባይቆርጠው
በራሱ ችሎታ ማን ነበር ሚያመልጠው
ግን ሁሉም ኣለፈ ቀስ እያለ ነጋ
ለካስ ወድቆ ኣይወድቅም ኣንተን የተጠጋ (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 2
ያሻግራል ሲሉን ሰምተናል በዝና
ለሊት በዓምደ ብርሃን ቀኑን በደመና
ዛሬ ግን ተገልጧል መዳኑ በላየ
ወዳጄ እለዋለው ባለዉለታየ (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 3
ጸጉራችን ተላጭቶ ናዝራዊነታችን
ጭፍራው እያፋጨ ነግሶ በላያችን
እግዚኣብሔር ሲያስበን ጉልበታም ሆነናል
ምሶሶዉን ይዘን ጠላትን ፈጭተናል (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 4
ኣይችሉም እያለ ይፎክራል ጠላት
ኣሳላፊው ንጉስ የት ሄዶ የኛ አባት
የማይወጣውን ወጣነው ታግሰን
እልል እንላለን ከእርሱ ጋራ ነግሰን (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን',
        lyrics_transliteration = 'CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen

VERSE 1
Yenehasun mezgya biretun bayqort’ew
Berasu chlota man neber miyamelt’ew
Gin hulum alefe qes eyale nega
Lekas wedqo aywedqm anten yetet’ega (2)

CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen

VERSE 2
Yashagral silun semtenal bezna
Lelit beamde birhan qenun bedemena
Zare gin tegelt’wal medanu belaye
Wedaje elewalew balewuletaye (2)

CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen

VERSE 3
Ts’egurachn telach’to nazrawinetachn
Ch’fraw eyafach’e negso belayachn
Egziabher siyasben gulbetam honenal
Misosowun yizen t’elatn fech’tenal (2)

CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen

VERSE 4
Aychlum eyale yifokral t’elat
Asalafiw nigus yet hedo yegna abat
Yemaywet’awn wet’anew tagsen
Ell enlalen keersu gara negsen (2)

CHORUS
Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2c1a3b51-358b-4ea2-a1ee-72f269204319'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 1
የነሃሱን መዝግያ ብረቱን ባይቆርጠው
በራሱ ችሎታ ማን ነበር ሚያመልጠው
ግን ሁሉም ኣለፈ ቀስ እያለ ነጋ
ለካስ ወድቆ ኣይወድቅም ኣንተን የተጠጋ (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 2
ያሻግራል ሲሉን ሰምተናል በዝና
ለሊት በዓምደ ብርሃን ቀኑን በደመና
ዛሬ ግን ተገልጧል መዳኑ በላየ
ወዳጄ እለዋለው ባለዉለታየ (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 3
ጸጉራችን ተላጭቶ ናዝራዊነታችን
ጭፍራው እያፋጨ ነግሶ በላያችን
እግዚኣብሔር ሲያስበን ጉልበታም ሆነናል
ምሶሶዉን ይዘን ጠላትን ፈጭተናል (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 4
ኣይችሉም እያለ ይፎክራል ጠላት
ኣሳላፊው ንጉስ የት ሄዶ የኛ አባት
የማይወጣውን ወጣነው ታግሰን
እልል እንላለን ከእርሱ ጋራ ነግሰን (2)

CHORUS
እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2c1a3b51-358b-4ea2-a1ee-72f269204319'::uuid, 'egiziabiher-kegna-gar-bayihon', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yemiset-bitsue-zemarit-ruth-demelash ("Yemiset Bitsue /Zemarit Ruth Demelash")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2c1ea015-5ff9-42d5-8ecd-f45c2d564fe2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 1
የሚሰጥ ብጹዕ ነው ከሚቀበል ይልቅ
ቸርነት የሚያረግ ትንሽ ሳይል ትልቅ
ስንቁን ይቋጥራል ለክፉ ዘመኑ
እርሷ ናት መዳኒት መትረፊያ ኪዳኑ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 2
ትልቅ እድል አለ ከላይ የተሰጠን
አምላክ ያዘጋጀው ገብቶ ሊጎበኘን
ኑና እናበድረው ሁሉ ለሞላለት
እጆቹን ዘርግቷል ኩርማን እንጣልለት

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 3
የሰማይ የምድር የፍጥረቱ ንጉሥ
አብ ለእጟለ ማውታ ኢየሱስ ክርስቶስ
የሚሰጥ እርሱ ነው የሚሰጥም እርሱ
ሰተን እንቀበል ራሱን ከራሱ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 4
ድሆች ሆነን ሳለን ሳይንቅ የወደደን
ከኛ ጋር ተቆጥሮ በፍቅሩ የሳበን
ምጽዋት እርሱ ነው መዝገብ ለፍጥረቱ
ለአለም የተሰጠ በአንድያ በአባቱ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 1
Yemiset’ bits’ue new kemiqebel yilq
Chernet yemiyareg tinsh sayl tilq
Sinqun yiqwat’ral lekfu zemenu
Erswa nat medanit metrefiya kidanu

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 2
Tilq edl ale kelay yeteset’en
Amlak yazegajew gebto ligobegnen
Nuna enabedrew hulu lemolalet
Ejochun zergtwal kurman ent’allet

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 3
Yesemay yemdr yeft’retu nigus
Ab leeጟle mawta Iyesus Kristos
Yemiset’ ersu new yemiset’m ersu
Seten enqebel rasun kerasu

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 4
Dihoch honen salen saynq yewededen
Kegna gar teqot’ro befqru yesaben
Mits’wat ersu new mezgeb left’retu
Lealem yeteset’e beandya beabatu

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 1
የሚሰጥ ብጹዕ ነው ከሚቀበል ይልቅ
ቸርነት የሚያረግ ትንሽ ሳይል ትልቅ
ስንቁን ይቋጥራል ለክፉ ዘመኑ
እርሷ ናት መዳኒት መትረፊያ ኪዳኑ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 2
ትልቅ እድል አለ ከላይ የተሰጠን
አምላክ ያዘጋጀው ገብቶ ሊጎበኘን
ኑና እናበድረው ሁሉ ለሞላለት
እጆቹን ዘርግቷል ኩርማን እንጣልለት

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 3
የሰማይ የምድር የፍጥረቱ ንጉሥ
አብ ለእጟለ ማውታ ኢየሱስ ክርስቶስ
የሚሰጥ እርሱ ነው የሚሰጥም እርሱ
ሰተን እንቀበል ራሱን ከራሱ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 4
ድሆች ሆነን ሳለን ሳይንቅ የወደደን
ከኛ ጋር ተቆጥሮ በፍቅሩ የሳበን
ምጽዋት እርሱ ነው መዝገብ ለፍጥረቱ
ለአለም የተሰጠ በአንድያ በአባቱ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት',
        lyrics_transliteration = 'CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 1
Yemiset’ bits’ue new kemiqebel yilq
Chernet yemiyareg tinsh sayl tilq
Sinqun yiqwat’ral lekfu zemenu
Erswa nat medanit metrefiya kidanu

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 2
Tilq edl ale kelay yeteset’en
Amlak yazegajew gebto ligobegnen
Nuna enabedrew hulu lemolalet
Ejochun zergtwal kurman ent’allet

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 3
Yesemay yemdr yeft’retu nigus
Ab leeጟle mawta Iyesus Kristos
Yemiset’ ersu new yemiset’m ersu
Seten enqebel rasun kerasu

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 4
Dihoch honen salen saynq yewededen
Kegna gar teqot’ro befqru yesaben
Mits’wat ersu new mezgeb left’retu
Lealem yeteset’e beandya beabatu

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2c1ea015-5ff9-42d5-8ecd-f45c2d564fe2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 1
የሚሰጥ ብጹዕ ነው ከሚቀበል ይልቅ
ቸርነት የሚያረግ ትንሽ ሳይል ትልቅ
ስንቁን ይቋጥራል ለክፉ ዘመኑ
እርሷ ናት መዳኒት መትረፊያ ኪዳኑ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 2
ትልቅ እድል አለ ከላይ የተሰጠን
አምላክ ያዘጋጀው ገብቶ ሊጎበኘን
ኑና እናበድረው ሁሉ ለሞላለት
እጆቹን ዘርግቷል ኩርማን እንጣልለት

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 3
የሰማይ የምድር የፍጥረቱ ንጉሥ
አብ ለእጟለ ማውታ ኢየሱስ ክርስቶስ
የሚሰጥ እርሱ ነው የሚሰጥም እርሱ
ሰተን እንቀበል ራሱን ከራሱ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 4
ድሆች ሆነን ሳለን ሳይንቅ የወደደን
ከኛ ጋር ተቆጥሮ በፍቅሩ የሳበን
ምጽዋት እርሱ ነው መዝገብ ለፍጥረቱ
ለአለም የተሰጠ በአንድያ በአባቱ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2c1ea015-5ff9-42d5-8ecd-f45c2d564fe2'::uuid, 'yemiset-bitsue-zemarit-ruth-demelash', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-stars ("The Stars")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9f1701c4-f3bf-480b-a0de-80e1cf158a36'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 1
Defenders of the Faith.
The first martyr Saint Stephen
While they were stoning you, you showed your mercy
For that You saw in the heavens the Holy Trinity

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 2
How you lived and died is Christ’s reflection
And your faith inspires our generation
Oh! Saint Stephen the first martyr defender of the faith.
The Stars…

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 3
The Armenian virgin Saint Arsema (Rasphime)
When the king lusted after your beauty.
He didn’t know you kept yourself in purity
You loved Christ till death with true affection

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 4
And your faith inspires our generation!
Oh! Saint Arsema the Armenian virgin defender of the faith
The Stars…
Saint George the Roman soldier

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 5
With your faith in Christ, you slayed the beast
In the heavens you sit, today with the high priest
You overcame trials and tribulations
And your faith inspires our generation!

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 6
O! Saint George the Roman soldier defender of the faith.
The Stars…
The thirty martyrs of Orthodox
Enemies of Christ they waged a war

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 7
You answered the call on the Libyan shore
You received your crown with persecution
And your faith inspires our generation!
O! Martyrs of the Libyan shore, defenders of the faith.

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 1
Defenders of the Faith.
The first martyr Saint Stephen
While they were stoning you, you showed your mercy
For that You saw in the heavens the Holy Trinity

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 2
How you lived and died is Christ’s reflection
And your faith inspires our generation
Oh! Saint Stephen the first martyr defender of the faith.
The Stars…

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 3
The Armenian virgin Saint Arsema (Rasphime)
When the king lusted after your beauty.
He didn’t know you kept yourself in purity
You loved Christ till death with true affection

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 4
And your faith inspires our generation!
Oh! Saint Arsema the Armenian virgin defender of the faith
The Stars…
Saint George the Roman soldier

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 5
With your faith in Christ, you slayed the beast
In the heavens you sit, today with the high priest
You overcame trials and tribulations
And your faith inspires our generation!

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 6
O! Saint George the Roman soldier defender of the faith.
The Stars…
The thirty martyrs of Orthodox
Enemies of Christ they waged a war

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 7
You answered the call on the Libyan shore
You received your crown with persecution
And your faith inspires our generation!
O! Martyrs of the Libyan shore, defenders of the faith.

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = '9f1701c4-f3bf-480b-a0de-80e1cf158a36'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 1
Defenders of the Faith.
The first martyr Saint Stephen
While they were stoning you, you showed your mercy
For that You saw in the heavens the Holy Trinity

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 2
How you lived and died is Christ’s reflection
And your faith inspires our generation
Oh! Saint Stephen the first martyr defender of the faith.
The Stars…

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 3
The Armenian virgin Saint Arsema (Rasphime)
When the king lusted after your beauty.
He didn’t know you kept yourself in purity
You loved Christ till death with true affection

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 4
And your faith inspires our generation!
Oh! Saint Arsema the Armenian virgin defender of the faith
The Stars…
Saint George the Roman soldier

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 5
With your faith in Christ, you slayed the beast
In the heavens you sit, today with the high priest
You overcame trials and tribulations
And your faith inspires our generation!

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 6
O! Saint George the Roman soldier defender of the faith.
The Stars…
The thirty martyrs of Orthodox
Enemies of Christ they waged a war

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 7
You answered the call on the Libyan shore
You received your crown with persecution
And your faith inspires our generation!
O! Martyrs of the Libyan shore, defenders of the faith.

CHORUS
The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9f1701c4-f3bf-480b-a0de-80e1cf158a36'::uuid, 'the-stars', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eniwedishalen-kidane-mihiret ("Eniwedishalen Kidane Mihiret")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2d37830e-0496-4c28-8ec4-d16d25633fdf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 1
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻልን ኪዳነምህረት:

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 2
በጨለማ ላሉት ብርሃንን አየ
ለርስቱ ተካፋይ እንዲሆን ተለየ
ወደ ቀድሞ ክብሩ ሊመለስ ዳግመኛ
አንቺ ነበርሽ ተስፋው ለአለም መዳኛ

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 3
እግዚአብሔር ታቦቱ መቆደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 4
ያን ሁሉ ዘመናት የፈሰሰው ደም
አለምን ከስራት ሊፈታ አልቻለም
ወደ ሚሻል ኪዳን በደም ሊያሻግረን
ጀምሽን ተዋሕዶ መድኃኒትአለም ዋጀን

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 5
ኧዘ
አለን ብዙ ምክንያት አንቺን ምንወደበት
አለም ያልተረዳው ያላወቀው እውነት
ያወቀ የተረዳ የመዳኑን ምስጢር

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 6
አያፍርም ክብርሽን ቆሞ ለመናገር
እዝ
አውቃለሁ እግዚአብሔር የሰጠሽን ክብር
ላመስግንሽ እኔም ሳልቀንስ ሳልጨምር

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 7
ሚባርክሽ ብሩክ ነውና እናቴ
ኪዳን ምህረት ንገሽ እመቤቴ
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 8
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት።

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 1
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshaln kidanemhret:

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 2
Bech’elema lalut birhann aye
Lerstu tekafay endihon teleye
Wede qedmo kibru limeles dagmegna
Anchi nebersh tesfaw lealem medagna

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 3
Egziabher tabotu meqodesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanmhret

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 4
Yan hulu zemenat yefesesew dem
Alemn kesrat lifeta alchalem
Wede mishal kidan bedem liyashagren
Jemshn Tewahedo medhanitalem wajen

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 5
ኧze
Alen bizu miknyat anchin minwedebet
Alem yalteredaw yalaweqew ewnet
Yaweqe yetereda yemedanun mist’ir

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 6
Ayafrm kibrshn qomo lemenager
Ez
Awqalehu Egziabher yeset’eshn kibir
Lamesgnsh enem salqens salch’emr

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 7
Mibarksh biruk newna enate
Kidan mihret nigesh Emebete
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 8
Yekbrachn get’ shlmat
Enwedshalen kidanmhret.

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 1
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻልን ኪዳነምህረት:

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 2
በጨለማ ላሉት ብርሃንን አየ
ለርስቱ ተካፋይ እንዲሆን ተለየ
ወደ ቀድሞ ክብሩ ሊመለስ ዳግመኛ
አንቺ ነበርሽ ተስፋው ለአለም መዳኛ

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 3
እግዚአብሔር ታቦቱ መቆደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 4
ያን ሁሉ ዘመናት የፈሰሰው ደም
አለምን ከስራት ሊፈታ አልቻለም
ወደ ሚሻል ኪዳን በደም ሊያሻግረን
ጀምሽን ተዋሕዶ መድኃኒትአለም ዋጀን

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 5
ኧዘ
አለን ብዙ ምክንያት አንቺን ምንወደበት
አለም ያልተረዳው ያላወቀው እውነት
ያወቀ የተረዳ የመዳኑን ምስጢር

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 6
አያፍርም ክብርሽን ቆሞ ለመናገር
እዝ
አውቃለሁ እግዚአብሔር የሰጠሽን ክብር
ላመስግንሽ እኔም ሳልቀንስ ሳልጨምር

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 7
ሚባርክሽ ብሩክ ነውና እናቴ
ኪዳን ምህረት ንገሽ እመቤቴ
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 8
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት።

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :',
        lyrics_transliteration = 'CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 1
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshaln kidanemhret:

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 2
Bech’elema lalut birhann aye
Lerstu tekafay endihon teleye
Wede qedmo kibru limeles dagmegna
Anchi nebersh tesfaw lealem medagna

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 3
Egziabher tabotu meqodesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanmhret

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 4
Yan hulu zemenat yefesesew dem
Alemn kesrat lifeta alchalem
Wede mishal kidan bedem liyashagren
Jemshn Tewahedo medhanitalem wajen

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 5
ኧze
Alen bizu miknyat anchin minwedebet
Alem yalteredaw yalaweqew ewnet
Yaweqe yetereda yemedanun mist’ir

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 6
Ayafrm kibrshn qomo lemenager
Ez
Awqalehu Egziabher yeset’eshn kibir
Lamesgnsh enem salqens salch’emr

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 7
Mibarksh biruk newna enate
Kidan mihret nigesh Emebete
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 8
Yekbrachn get’ shlmat
Enwedshalen kidanmhret.

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2d37830e-0496-4c28-8ec4-d16d25633fdf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 1
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻልን ኪዳነምህረት:

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 2
በጨለማ ላሉት ብርሃንን አየ
ለርስቱ ተካፋይ እንዲሆን ተለየ
ወደ ቀድሞ ክብሩ ሊመለስ ዳግመኛ
አንቺ ነበርሽ ተስፋው ለአለም መዳኛ

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 3
እግዚአብሔር ታቦቱ መቆደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 4
ያን ሁሉ ዘመናት የፈሰሰው ደም
አለምን ከስራት ሊፈታ አልቻለም
ወደ ሚሻል ኪዳን በደም ሊያሻግረን
ጀምሽን ተዋሕዶ መድኃኒትአለም ዋጀን

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 5
ኧዘ
አለን ብዙ ምክንያት አንቺን ምንወደበት
አለም ያልተረዳው ያላወቀው እውነት
ያወቀ የተረዳ የመዳኑን ምስጢር

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 6
አያፍርም ክብርሽን ቆሞ ለመናገር
እዝ
አውቃለሁ እግዚአብሔር የሰጠሽን ክብር
ላመስግንሽ እኔም ሳልቀንስ ሳልጨምር

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 7
ሚባርክሽ ብሩክ ነውና እናቴ
ኪዳን ምህረት ንገሽ እመቤቴ
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 8
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት።

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2d37830e-0496-4c28-8ec4-d16d25633fdf'::uuid, 'eniwedishalen-kidane-mihiret', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adanegn-geta-zemari-d-ne-yoseph-girma ("Adanegn Geta / Zemari D/ne Yoseph Girma")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2d587a38-7e3a-4fcc-8007-6f9068c98e76'::uuid
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
    WHERE import_id = '2d587a38-7e3a-4fcc-8007-6f9068c98e76'::uuid
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
        '2d587a38-7e3a-4fcc-8007-6f9068c98e76'::uuid, 'adanegn-geta-zemari-d-ne-yoseph-girma', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- baleweletaye ("Baleweletaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0ef7f398-fa40-4fc5-9b11-68c9fc7dd45d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 1
እንድቀርብ ወደ እርሱ አዘዘ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድወርድ ከዛፉ አዘዘጌታዬ
ማይረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በእየሱስ ክርስቶስ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ሀጢያትም በእነርሱ
በሰላም ሂድ ብሎ ምሮኛልን ጉሱ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 4
የማምነውን አምላክ አውቀዋለሁ እኔ
በሰራልኝ ስራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤትከሻ
ልለየው አልችልም እስከመጨረሻ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 5
የቀራጭ አለቃ ቢሆንም ስራይ
እድወርድ ከዛፉ አዘዘ ጌታዬ
ማዕረጌን መሸከም እስኪያቅተኝ ድረስ ቤቴ ተባረከ በእየሱስ ክርስቶስ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 1
Endqerb wede ersu azeze Getaye
Egrun at’bewalehu wedqe beenbaye

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 2
Yeqerach’ aleqa bihonm siraye
Endwerd kezafu azezegetaye
Mayregen meshekem eskiyaqtegn dires
Bete tebareke beeyesus Kristos

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 3
Dingay yech’ebet’u ferajoch kebewgn
Newren zerzrew Geta fit aqomugn
Feredechbachew het’iyatm beenersu
Beselam hid bilo mirognaln gusu

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 4
Yemamnewn amlak awqewalehu ene
Beseralgn sira beedme bezemene
Fiqrun teshekmwal yelbetkesha
Lileyew alchlm eskemech’eresha

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 5
Yeqerach’ aleqa bihonm siray
Edwerd kezafu azeze Getaye
Maeregen meshekem eskiyaqtegn dires bete tebareke beeyesus Kristos

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 1
እንድቀርብ ወደ እርሱ አዘዘ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድወርድ ከዛፉ አዘዘጌታዬ
ማይረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በእየሱስ ክርስቶስ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ሀጢያትም በእነርሱ
በሰላም ሂድ ብሎ ምሮኛልን ጉሱ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 4
የማምነውን አምላክ አውቀዋለሁ እኔ
በሰራልኝ ስራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤትከሻ
ልለየው አልችልም እስከመጨረሻ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 5
የቀራጭ አለቃ ቢሆንም ስራይ
እድወርድ ከዛፉ አዘዘ ጌታዬ
ማዕረጌን መሸከም እስኪያቅተኝ ድረስ ቤቴ ተባረከ በእየሱስ ክርስቶስ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ',
        lyrics_transliteration = 'CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 1
Endqerb wede ersu azeze Getaye
Egrun at’bewalehu wedqe beenbaye

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 2
Yeqerach’ aleqa bihonm siraye
Endwerd kezafu azezegetaye
Mayregen meshekem eskiyaqtegn dires
Bete tebareke beeyesus Kristos

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 3
Dingay yech’ebet’u ferajoch kebewgn
Newren zerzrew Geta fit aqomugn
Feredechbachew het’iyatm beenersu
Beselam hid bilo mirognaln gusu

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 4
Yemamnewn amlak awqewalehu ene
Beseralgn sira beedme bezemene
Fiqrun teshekmwal yelbetkesha
Lileyew alchlm eskemech’eresha

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 5
Yeqerach’ aleqa bihonm siray
Edwerd kezafu azeze Getaye
Maeregen meshekem eskiyaqtegn dires bete tebareke beeyesus Kristos

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0ef7f398-fa40-4fc5-9b11-68c9fc7dd45d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 1
እንድቀርብ ወደ እርሱ አዘዘ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድወርድ ከዛፉ አዘዘጌታዬ
ማይረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በእየሱስ ክርስቶስ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ሀጢያትም በእነርሱ
በሰላም ሂድ ብሎ ምሮኛልን ጉሱ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 4
የማምነውን አምላክ አውቀዋለሁ እኔ
በሰራልኝ ስራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤትከሻ
ልለየው አልችልም እስከመጨረሻ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 5
የቀራጭ አለቃ ቢሆንም ስራይ
እድወርድ ከዛፉ አዘዘ ጌታዬ
ማዕረጌን መሸከም እስኪያቅተኝ ድረስ ቤቴ ተባረከ በእየሱስ ክርስቶስ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0ef7f398-fa40-4fc5-9b11-68c9fc7dd45d'::uuid, 'baleweletaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yewededegn-geta-min-adirigelet-new-bemuhaze-sibihat-dagimawi-deribe ("Yewededegn Geta Min Adirigelet New Bemuhaze Sibihat Dagimawi Deribe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2dbef4fd-995e-49a4-a5d2-368a532ad33d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 2
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 3
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 4
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 5
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ',
        lyrics_transliteration = 'CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 2
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 3
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 4
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 5
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2dbef4fd-995e-49a4-a5d2-368a532ad33d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2dbef4fd-995e-49a4-a5d2-368a532ad33d'::uuid, 'yewededegn-geta-min-adirigelet-new-bemuhaze-sibihat-dagimawi-deribe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tikit-neger-yizhe ("Tikit Neger Yizhe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3dd0a803-874e-481f-8e67-afe978d6b639'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 1
እዚ ።።።።።።።።።።።።።።።።።።።።።።
ደጋግሜ በሀጥያት በበደል ብወድቅም
እኔን ምሮ ምሮ ሰለቸኝ አያውቅም እድል
ይሰጠኛል አዲስ እያረገ በፍቅር ድምፆቹ ሁሌ

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 2
እየፈለገ
እዚ ።።።።።።።።።።።።።።።።።።።።።።።።
የአለም ሀብታት ሁሉ በአንድ ቢደመሩ
በእውነት አይበልጡም ከጠብታ ፍቅሩ

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 3
በእርሱ ደስ ይለኛል በለስ ባታፈራም
ጉድለቴን ይሞላል የእርሱን ስም ስጠራ
እዚ ።።።።።።።።።።።።።።።።።።።።።።
ባለጠግነትን እየከለከለ የሚያስፈልገኝን

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 4
ለኔ እያበቀለ ይንከባከበኛል ስለኔ ይዋጋል
እጁን እያሰበ ይመሻል ይነጋል
እዚ ።።።።።።።።።።።።።።።።።።
ሲሰጥም ሲነሳ ትክክል ነውና ዝም ልል

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 5
አልችልም እሰዋለሁ ምስጋና በክብሩ ዙፋን
ፊት በእምነት ቀረቤ ዘንበል ብሎልኝ
ተጠግኗል ልብ

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 1
Ezi ......................
Degagme behet’yat bebedel biwedqm
Enen miro miro selechegn ayawqm edl
Yiset’egnal adis eyarege befqr dimts’ochu hule

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 2
Eyefelege
Ezi ........................
Yealem hebtat hulu beand bidemeru
Beewnet aybelt’um ket’ebta fiqru

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 3
Beersu des yilegnal beles bataferam
Gudleten yimolal yeersun sim sit’era
Ezi ......................
Balet’egnetn eyekelekele yemiyasfelgegnn

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 4
Lene eyabeqele yinkebakebegnal silene yiwagal
Ejun eyasebe yimeshal yinegal
Ezi ..................
Siset’m sinesa tikkl newna zim lil

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 5
Alchlm esewalehu misgana bekbru zufan
Fit beemnet qerebe zenbel bilolgn
Tet’egnwal lib

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 1
እዚ ።።።።።።።።።።።።።።።።።።።።።።
ደጋግሜ በሀጥያት በበደል ብወድቅም
እኔን ምሮ ምሮ ሰለቸኝ አያውቅም እድል
ይሰጠኛል አዲስ እያረገ በፍቅር ድምፆቹ ሁሌ

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 2
እየፈለገ
እዚ ።።።።።።።።።።።።።።።።።።።።።።።።
የአለም ሀብታት ሁሉ በአንድ ቢደመሩ
በእውነት አይበልጡም ከጠብታ ፍቅሩ

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 3
በእርሱ ደስ ይለኛል በለስ ባታፈራም
ጉድለቴን ይሞላል የእርሱን ስም ስጠራ
እዚ ።።።።።።።።።።።።።።።።።።።።።።
ባለጠግነትን እየከለከለ የሚያስፈልገኝን

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 4
ለኔ እያበቀለ ይንከባከበኛል ስለኔ ይዋጋል
እጁን እያሰበ ይመሻል ይነጋል
እዚ ።።።።።።።።።።።።።።።።።።
ሲሰጥም ሲነሳ ትክክል ነውና ዝም ልል

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 5
አልችልም እሰዋለሁ ምስጋና በክብሩ ዙፋን
ፊት በእምነት ቀረቤ ዘንበል ብሎልኝ
ተጠግኗል ልብ

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም',
        lyrics_transliteration = 'CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 1
Ezi ......................
Degagme behet’yat bebedel biwedqm
Enen miro miro selechegn ayawqm edl
Yiset’egnal adis eyarege befqr dimts’ochu hule

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 2
Eyefelege
Ezi ........................
Yealem hebtat hulu beand bidemeru
Beewnet aybelt’um ket’ebta fiqru

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 3
Beersu des yilegnal beles bataferam
Gudleten yimolal yeersun sim sit’era
Ezi ......................
Balet’egnetn eyekelekele yemiyasfelgegnn

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 4
Lene eyabeqele yinkebakebegnal silene yiwagal
Ejun eyasebe yimeshal yinegal
Ezi ..................
Siset’m sinesa tikkl newna zim lil

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 5
Alchlm esewalehu misgana bekbru zufan
Fit beemnet qerebe zenbel bilolgn
Tet’egnwal lib

CHORUS
T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3dd0a803-874e-481f-8e67-afe978d6b639'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 1
እዚ ።።።።።።።።።።።።።።።።።።።።።።
ደጋግሜ በሀጥያት በበደል ብወድቅም
እኔን ምሮ ምሮ ሰለቸኝ አያውቅም እድል
ይሰጠኛል አዲስ እያረገ በፍቅር ድምፆቹ ሁሌ

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 2
እየፈለገ
እዚ ።።።።።።።።።።።።።።።።።።።።።።።።
የአለም ሀብታት ሁሉ በአንድ ቢደመሩ
በእውነት አይበልጡም ከጠብታ ፍቅሩ

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 3
በእርሱ ደስ ይለኛል በለስ ባታፈራም
ጉድለቴን ይሞላል የእርሱን ስም ስጠራ
እዚ ።።።።።።።።።።።።።።።።።።።።።።
ባለጠግነትን እየከለከለ የሚያስፈልገኝን

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 4
ለኔ እያበቀለ ይንከባከበኛል ስለኔ ይዋጋል
እጁን እያሰበ ይመሻል ይነጋል
እዚ ።።።።።።።።።።።።።።።።።።
ሲሰጥም ሲነሳ ትክክል ነውና ዝም ልል

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 5
አልችልም እሰዋለሁ ምስጋና በክብሩ ዙፋን
ፊት በእምነት ቀረቤ ዘንበል ብሎልኝ
ተጠግኗል ልብ

CHORUS
ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3dd0a803-874e-481f-8e67-afe978d6b639'::uuid, 'tikit-neger-yizhe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gebiriel-yetamenik-yenefis-wedaj ("Gebiriel-yetamenik Yenefis Wedaj")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cbc3bd3b-515b-4208-a2b9-6d9e143d942f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 1
ነበልባሉን ውሀ አደረግኸው
ሰንሰለቱን በጣጠስከው
የነደደው እሳት ጠፍቷል
ከእኛ ጋር ገብርኤል ቆሟል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 2
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 3
አዝ…..
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 4
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 5
ለድንግል ነገርህ ገብርኤል
አዝ…..
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 6
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 7
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ…
በመዐልትና በሌሊት

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 8
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 9
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ….

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 1
Nebelbalun wihe aderegኸw
Senseletun bet’at’eskew
Yenededew esat t’eftwal
Keegna gar Gebriel qomwal

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 2
Melaektun besemay Gebriel
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 3
CHORUS
Yeanabstun af zegaኸw
Wehniwn anawets’kew
Behywet menged yemtmera

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 4
LeEgziabher hizb yemtrara
Melaektun besemay Gebriel
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 5
Ledngl negerh Gebriel
CHORUS
Ts’elot yizo yemiwet’a
Mihret yizo yemimet’a

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 6
Zewetr yemiyay yeamlakun fit
Kidus Gebriel liqe melaekt
Melaektun besemay Gebriel
Endaregagah Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 7
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel
CHORUS
Bemealtna belelit

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 8
Yemiyadnen ket’fat
Zuriyachnn yemisefr
Yemiyamald keegziabher
Melaektun besemay Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 9
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel
CHORUS

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 1
ነበልባሉን ውሀ አደረግኸው
ሰንሰለቱን በጣጠስከው
የነደደው እሳት ጠፍቷል
ከእኛ ጋር ገብርኤል ቆሟል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 2
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 3
አዝ…..
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 4
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 5
ለድንግል ነገርህ ገብርኤል
አዝ…..
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 6
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 7
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ…
በመዐልትና በሌሊት

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 8
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 9
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ….

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር',
        lyrics_transliteration = 'CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 1
Nebelbalun wihe aderegኸw
Senseletun bet’at’eskew
Yenededew esat t’eftwal
Keegna gar Gebriel qomwal

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 2
Melaektun besemay Gebriel
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 3
CHORUS
Yeanabstun af zegaኸw
Wehniwn anawets’kew
Behywet menged yemtmera

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 4
LeEgziabher hizb yemtrara
Melaektun besemay Gebriel
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 5
Ledngl negerh Gebriel
CHORUS
Ts’elot yizo yemiwet’a
Mihret yizo yemimet’a

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 6
Zewetr yemiyay yeamlakun fit
Kidus Gebriel liqe melaekt
Melaektun besemay Gebriel
Endaregagah Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 7
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel
CHORUS
Bemealtna belelit

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 8
Yemiyadnen ket’fat
Zuriyachnn yemisefr
Yemiyamald keegziabher
Melaektun besemay Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 9
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel
CHORUS

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cbc3bd3b-515b-4208-a2b9-6d9e143d942f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 1
ነበልባሉን ውሀ አደረግኸው
ሰንሰለቱን በጣጠስከው
የነደደው እሳት ጠፍቷል
ከእኛ ጋር ገብርኤል ቆሟል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 2
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 3
አዝ…..
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 4
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 5
ለድንግል ነገርህ ገብርኤል
አዝ…..
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 6
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 7
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ…
በመዐልትና በሌሊት

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 8
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 9
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ….

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cbc3bd3b-515b-4208-a2b9-6d9e143d942f'::uuid, 'gebiriel-yetamenik-yenefis-wedaj', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fekade-yih ("Fekade Yih")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '47084c7e-156e-4159-800b-280a32b3045b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 1
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሰሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ጸሎት ትቼ
የመዳኑ ሰዓት አለፉ ቀኖቼ(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 4
ተቆጥሮ የማያልቅ ኃጢአቴ ተጠርቶ
በሞትና በደል በኃጢአት ሸፍኖ
ሰው አርጎ አቁሞኝ በሰው ፊት ጌታዬ
በማንም አልፈርድም ኃጢአተኛ ብዬ

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 5
በማንም አልፈርድም በደለኛ ብዬ

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 1
Amlake kemaregn befqru zimta
Yesew bedel lalay beewnet miyalew
Enen ketagesegn fiqr temreyalew (2)

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 2
Bayne fit tegardo yalewn miseso
Eyaye kalefegn bemhret tagso
Yesew gudf lalay beewnet miyalew
Enen ketagesegn fiqr temreyalew (2)

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 3
Ante qerach’u sew yaleh aqerqreh
Bemhret temelesk kene yilq dineh
Bante lay sit’equm yenen ts’elot tiche
Yemedanu seat alefu qenoche (2)

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 4
Teqot’ro yemayalq hat’iate tet’erto
Bemotna bedel behat’iat shefno
Sew argo aqumogn besew fit Getaye
Bemanm alferdm hat’iategna biye

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 5
Bemanm alferdm bedelegna biye

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 1
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሰሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ጸሎት ትቼ
የመዳኑ ሰዓት አለፉ ቀኖቼ(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 4
ተቆጥሮ የማያልቅ ኃጢአቴ ተጠርቶ
በሞትና በደል በኃጢአት ሸፍኖ
ሰው አርጎ አቁሞኝ በሰው ፊት ጌታዬ
በማንም አልፈርድም ኃጢአተኛ ብዬ

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 5
በማንም አልፈርድም በደለኛ ብዬ

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ',
        lyrics_transliteration = 'CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 1
Amlake kemaregn befqru zimta
Yesew bedel lalay beewnet miyalew
Enen ketagesegn fiqr temreyalew (2)

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 2
Bayne fit tegardo yalewn miseso
Eyaye kalefegn bemhret tagso
Yesew gudf lalay beewnet miyalew
Enen ketagesegn fiqr temreyalew (2)

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 3
Ante qerach’u sew yaleh aqerqreh
Bemhret temelesk kene yilq dineh
Bante lay sit’equm yenen ts’elot tiche
Yemedanu seat alefu qenoche (2)

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 4
Teqot’ro yemayalq hat’iate tet’erto
Bemotna bedel behat’iat shefno
Sew argo aqumogn besew fit Getaye
Bemanm alferdm hat’iategna biye

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 5
Bemanm alferdm bedelegna biye

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '47084c7e-156e-4159-800b-280a32b3045b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 1
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሰሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ጸሎት ትቼ
የመዳኑ ሰዓት አለፉ ቀኖቼ(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 4
ተቆጥሮ የማያልቅ ኃጢአቴ ተጠርቶ
በሞትና በደል በኃጢአት ሸፍኖ
ሰው አርጎ አቁሞኝ በሰው ፊት ጌታዬ
በማንም አልፈርድም ኃጢአተኛ ብዬ

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 5
በማንም አልፈርድም በደለኛ ብዬ

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '47084c7e-156e-4159-800b-280a32b3045b'::uuid, 'fekade-yih', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyam-des-yibelish ("Mariyam Des Yibelish")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8e466cd1-31d7-40b8-a807-f8478dac2b62'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 1
የዜናው አብሳሪ ገብርኤል ነበረ
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ ሐዲስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 2
የአምላክን መወለድ ስጋ በመልበስ
ገብርኤል ሲያበስራት ድንግል ስትሰማ
በእሷ ላይ አደረ የመለኮት ግርማ
እዉነተኛ መልአክ መሆኑን ስላየች

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 3
ይሁንልኝ ብላ ቃሉን ተቀበለች
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ አዲስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 4
የአምላክን መወለድ ስጋ በመልበስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 1
Yezenaw absari Gebriel nebere
Dingil teqemt’a bebetemeqdes
Har werqun asmamta sitfetl nigst
Gebriel Gebriel zenawi hedis

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 2
Yeamlakn meweled siga bemelbes
Gebriel siyabesrat Dingil sitsema
Beeswa lay adere yemelekot girma
Ewunetegna melak mehonun silayech

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 3
Yihunlgn bila qalun teqebelech
Dingil teqemt’a bebetemeqdes
Har werqun asmamta sitfetl nigst
Gebriel Gebriel zenawi adis

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 4
Yeamlakn meweled siga bemelbes

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 1
የዜናው አብሳሪ ገብርኤል ነበረ
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ ሐዲስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 2
የአምላክን መወለድ ስጋ በመልበስ
ገብርኤል ሲያበስራት ድንግል ስትሰማ
በእሷ ላይ አደረ የመለኮት ግርማ
እዉነተኛ መልአክ መሆኑን ስላየች

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 3
ይሁንልኝ ብላ ቃሉን ተቀበለች
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ አዲስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 4
የአምላክን መወለድ ስጋ በመልበስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ',
        lyrics_transliteration = 'CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 1
Yezenaw absari Gebriel nebere
Dingil teqemt’a bebetemeqdes
Har werqun asmamta sitfetl nigst
Gebriel Gebriel zenawi hedis

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 2
Yeamlakn meweled siga bemelbes
Gebriel siyabesrat Dingil sitsema
Beeswa lay adere yemelekot girma
Ewunetegna melak mehonun silayech

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 3
Yihunlgn bila qalun teqebelech
Dingil teqemt’a bebetemeqdes
Har werqun asmamta sitfetl nigst
Gebriel Gebriel zenawi adis

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 4
Yeamlakn meweled siga bemelbes

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8e466cd1-31d7-40b8-a807-f8478dac2b62'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 1
የዜናው አብሳሪ ገብርኤል ነበረ
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ ሐዲስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 2
የአምላክን መወለድ ስጋ በመልበስ
ገብርኤል ሲያበስራት ድንግል ስትሰማ
በእሷ ላይ አደረ የመለኮት ግርማ
እዉነተኛ መልአክ መሆኑን ስላየች

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 3
ይሁንልኝ ብላ ቃሉን ተቀበለች
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ አዲስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 4
የአምላክን መወለድ ስጋ በመልበስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8e466cd1-31d7-40b8-a807-f8478dac2b62'::uuid, 'mariyam-des-yibelish', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- litatibegn-demih-fesese ("Litatibegn Demih Fesese")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1139ed7f-9cf5-44fa-937d-9caf7a7e34b6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 1
እንደ በግ በሸላቹ ፊት
ሲጎተት ስለ እኔ ህይወት
ተረስቶኝ የሞትህ ዋጋ
ስጠፋ ወጣህ ፍለጋ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 2
ስበረው አለቱ ልቤን
አርቀው ክፉ ሀሳቤን
ልማረክ እጄን ልዘርጋ
ጨለማው ሌሉቱ ይንጋ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 3
ቀና እንደል የተደፋኸው
ሸክሜን የተሸከምከው
በምኔ ምን ብትወደኝ ነው
ቅዱሱ የተሰዋኸው

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 4
ይገለጥ የአይኔ ቅርፊት
ልመልከት ይህንን እውነት
ይወገድ አዚም ከላዬ
ላምልክህ ሁለንተናዬ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 5
ስለ አንዴ ጥለህ ሌላውን
የፈለክ በደለኛውን
ከጥልቁ እጄን ጎትተህ
አወጣኸን እዳዬን ከፍለህ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 6
ሳይኖረኝ አንዳች በጎነት
ልጅ የሚያስብል የምኮርበት
አብሰህ የአይኖቼን እንባ
ዘመርኩኝ አልኩኝ አባባ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 1
Ende beg beshelachu fit
Sigotet sile ene hiywet
Terestogn yemoth waga
Sit’efa wet’ah filega

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 2
Siberew aletu liben
Arqew kifu hesaben
Limarek ejen lizerga
Ch’elemaw lelutu yinga

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 3
Qena endel yetedefaኸw
Shekmen yeteshekemkew
Bemne min bitwedegn new
Qidusu yetesewaኸw

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 4
Yigelet’ yeayne qirfit
Limelket yihnn ewnet
Yiweged azim kelaye
Lamlkh hulentenaye

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 5
Sile ande t’leh lelawn
Yefelek bedelegnawn
Ket’lqu ejen gotteh
Awet’aኸn edayen kefleh

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 6
Saynoregn andach begonet
Lij yemiyasbl yemkorbet
Abseh yeaynochen enba
Zemerkugn alkugn ababa

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 1
እንደ በግ በሸላቹ ፊት
ሲጎተት ስለ እኔ ህይወት
ተረስቶኝ የሞትህ ዋጋ
ስጠፋ ወጣህ ፍለጋ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 2
ስበረው አለቱ ልቤን
አርቀው ክፉ ሀሳቤን
ልማረክ እጄን ልዘርጋ
ጨለማው ሌሉቱ ይንጋ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 3
ቀና እንደል የተደፋኸው
ሸክሜን የተሸከምከው
በምኔ ምን ብትወደኝ ነው
ቅዱሱ የተሰዋኸው

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 4
ይገለጥ የአይኔ ቅርፊት
ልመልከት ይህንን እውነት
ይወገድ አዚም ከላዬ
ላምልክህ ሁለንተናዬ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 5
ስለ አንዴ ጥለህ ሌላውን
የፈለክ በደለኛውን
ከጥልቁ እጄን ጎትተህ
አወጣኸን እዳዬን ከፍለህ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 6
ሳይኖረኝ አንዳች በጎነት
ልጅ የሚያስብል የምኮርበት
አብሰህ የአይኖቼን እንባ
ዘመርኩኝ አልኩኝ አባባ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ',
        lyrics_transliteration = 'CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 1
Ende beg beshelachu fit
Sigotet sile ene hiywet
Terestogn yemoth waga
Sit’efa wet’ah filega

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 2
Siberew aletu liben
Arqew kifu hesaben
Limarek ejen lizerga
Ch’elemaw lelutu yinga

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 3
Qena endel yetedefaኸw
Shekmen yeteshekemkew
Bemne min bitwedegn new
Qidusu yetesewaኸw

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 4
Yigelet’ yeayne qirfit
Limelket yihnn ewnet
Yiweged azim kelaye
Lamlkh hulentenaye

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 5
Sile ande t’leh lelawn
Yefelek bedelegnawn
Ket’lqu ejen gotteh
Awet’aኸn edayen kefleh

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 6
Saynoregn andach begonet
Lij yemiyasbl yemkorbet
Abseh yeaynochen enba
Zemerkugn alkugn ababa

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1139ed7f-9cf5-44fa-937d-9caf7a7e34b6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 1
እንደ በግ በሸላቹ ፊት
ሲጎተት ስለ እኔ ህይወት
ተረስቶኝ የሞትህ ዋጋ
ስጠፋ ወጣህ ፍለጋ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 2
ስበረው አለቱ ልቤን
አርቀው ክፉ ሀሳቤን
ልማረክ እጄን ልዘርጋ
ጨለማው ሌሉቱ ይንጋ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 3
ቀና እንደል የተደፋኸው
ሸክሜን የተሸከምከው
በምኔ ምን ብትወደኝ ነው
ቅዱሱ የተሰዋኸው

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 4
ይገለጥ የአይኔ ቅርፊት
ልመልከት ይህንን እውነት
ይወገድ አዚም ከላዬ
ላምልክህ ሁለንተናዬ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 5
ስለ አንዴ ጥለህ ሌላውን
የፈለክ በደለኛውን
ከጥልቁ እጄን ጎትተህ
አወጣኸን እዳዬን ከፍለህ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 6
ሳይኖረኝ አንዳች በጎነት
ልጅ የሚያስብል የምኮርበት
አብሰህ የአይኖቼን እንባ
ዘመርኩኝ አልኩኝ አባባ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1139ed7f-9cf5-44fa-937d-9caf7a7e34b6'::uuid, 'litatibegn-demih-fesese', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- o-rihirihite-hilina ("O Rihirihite Hilina")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2ef40ee7-6f9f-4b1f-a119-0c69e8233225'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 1
የእውነተኛው ዝናብ መገኛ
እውነተኛይቱ ደመና
የህይወታችን ህያው መሶብ
የዘለዓለም ህይወት መና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 2
ጸዋህሪተ መድህን አማኑኤል
ወለተ እያቄም ወሃና
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 3
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 4
ለሠው ልጆች ሁሉ አዛኝ እናት
መመኪያ ዘውድ ናት ለኛ ባህሪ
ከፈጣሪ በታች ለዕልናዋ
ከፍጥረታቱ ሁሉ በላይ

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 5
ቃልኪዳኗ በእውነት ያድነናል
ምልጃዋ በምድር በሰማይ
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 6
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 7
የተዋህዶ ምስጢር መገለጫ
ጥበበ ጸጳጦስ እንተ ሲና
የህይወት ኪዳን መታረቂያ
ወልድን የወለደች በትህትና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 8
ለፍጥረቱ ሁሉ የምትራራ
አዛኝ ናት ርህርተ ህሊና
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 9
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 1
Yeewnetegnaw zinab megegna
Ewnetegnaytu demena
Yehywetachn hiyaw mesob
Yezelealem hiywet mena

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 2
Ts’ewahrite medhn Amanuel
Welete eyaqem wehana
Sirgut beqdsna
Etmt bedingilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 3
Maryam rihrte hilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 4
Lesew lijoch hulu azagn enat
Memekiya zewd nat legna bahri
Kefet’ari betach leelnawa
Keft’retatu hulu belay

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 5
Qalkidanwa beewnet yadnenal
Miljawa bemdr besemay
Sirgut beqdsna
Etmt bedingilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 6
Maryam rihrte hilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 7
Yetewahdo mist’ir megelech’a
T’bebe ts’ep’at’os ente sina
Yehywet kidan metareqiya
Weldn yeweledech bethtna

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 8
Left’retu hulu yemtrara
Azagn nat rihrte hilina
Sirgut beqdsna
Etmt bedingilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 9
Maryam rihrte hilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 1
የእውነተኛው ዝናብ መገኛ
እውነተኛይቱ ደመና
የህይወታችን ህያው መሶብ
የዘለዓለም ህይወት መና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 2
ጸዋህሪተ መድህን አማኑኤል
ወለተ እያቄም ወሃና
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 3
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 4
ለሠው ልጆች ሁሉ አዛኝ እናት
መመኪያ ዘውድ ናት ለኛ ባህሪ
ከፈጣሪ በታች ለዕልናዋ
ከፍጥረታቱ ሁሉ በላይ

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 5
ቃልኪዳኗ በእውነት ያድነናል
ምልጃዋ በምድር በሰማይ
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 6
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 7
የተዋህዶ ምስጢር መገለጫ
ጥበበ ጸጳጦስ እንተ ሲና
የህይወት ኪዳን መታረቂያ
ወልድን የወለደች በትህትና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 8
ለፍጥረቱ ሁሉ የምትራራ
አዛኝ ናት ርህርተ ህሊና
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 9
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና',
        lyrics_transliteration = 'CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 1
Yeewnetegnaw zinab megegna
Ewnetegnaytu demena
Yehywetachn hiyaw mesob
Yezelealem hiywet mena

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 2
Ts’ewahrite medhn Amanuel
Welete eyaqem wehana
Sirgut beqdsna
Etmt bedingilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 3
Maryam rihrte hilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 4
Lesew lijoch hulu azagn enat
Memekiya zewd nat legna bahri
Kefet’ari betach leelnawa
Keft’retatu hulu belay

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 5
Qalkidanwa beewnet yadnenal
Miljawa bemdr besemay
Sirgut beqdsna
Etmt bedingilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 6
Maryam rihrte hilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 7
Yetewahdo mist’ir megelech’a
T’bebe ts’ep’at’os ente sina
Yehywet kidan metareqiya
Weldn yeweledech bethtna

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 8
Left’retu hulu yemtrara
Azagn nat rihrte hilina
Sirgut beqdsna
Etmt bedingilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 9
Maryam rihrte hilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2ef40ee7-6f9f-4b1f-a119-0c69e8233225'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 1
የእውነተኛው ዝናብ መገኛ
እውነተኛይቱ ደመና
የህይወታችን ህያው መሶብ
የዘለዓለም ህይወት መና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 2
ጸዋህሪተ መድህን አማኑኤል
ወለተ እያቄም ወሃና
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 3
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 4
ለሠው ልጆች ሁሉ አዛኝ እናት
መመኪያ ዘውድ ናት ለኛ ባህሪ
ከፈጣሪ በታች ለዕልናዋ
ከፍጥረታቱ ሁሉ በላይ

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 5
ቃልኪዳኗ በእውነት ያድነናል
ምልጃዋ በምድር በሰማይ
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 6
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 7
የተዋህዶ ምስጢር መገለጫ
ጥበበ ጸጳጦስ እንተ ሲና
የህይወት ኪዳን መታረቂያ
ወልድን የወለደች በትህትና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 8
ለፍጥረቱ ሁሉ የምትራራ
አዛኝ ናት ርህርተ ህሊና
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 9
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2ef40ee7-6f9f-4b1f-a119-0c69e8233225'::uuid, 'o-rihirihite-hilina', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yerasen-tsegur-kutirun-yawikewal ("Yerasen Tsegur Kutirun Yawikewal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '48a28818-b5ed-4eaa-981f-af93ddcafe6e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 1
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 2
ስለምግብና ስለምለብሰው
ብዙ ብጨነቅ ጥቅሙ ምንድነው
አበባን ለምድር ምግብን ለወፎች
የሚሰጥ አባት አለኝ ሳይሰለች

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 3
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 4
የማያምኑትን ስሙን ሳያውቁ
የሚያገኙትን ሳይጨነቁ
ስለምን ልድከም በከንቱ መሻት
እያለ ጌታ ያዳነኝ ከሞት

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 5
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 6
የክፉዎች ሰልፍ ቢሰፍር በላዬ
ዝናሩን ታጥቆ ቢዝት ገዳዬ
በሞት ጥላ ውስጥ ብጓዝ ብሔድም
የሚጠብቀኝ አያንቀላፋም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 7
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 8
ሀሳቤን ልጣል በእረኛዬ
በሚያሰማራኝ ቸር ጠባቂዬ
ከበረከት ምንጭ አያሳጣኝም
በግ ስለራሱ ተጨንቆ አያውቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 9
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 10
መንግስቱን ልሻ ልፈልግ ፅድቁን
ስለሚሰጠኝ ጌታ ሌላውን
ስለሚጨነቅ ነገ ለራሱ
ላመስግን ዛሬ ታምኜ በእርሱ

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 11
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 12
እግዚአብሔር አለ አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 1
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 2
Silemgbna silemlebsew
Bizu bich’eneq t’qmu mindnew
Abeban lemdr migbn lewefoch
Yemiset’ abat alegn sayselech

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 3
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 4
Yemayamnutn simun sayawqu
Yemiyagegnutn saych’enequ
Silemn lidkem bekentu meshat
Eyale Geta yadanegn kemot

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 5
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 6
Yekfuwoch self bisefr belaye
Zinarun tat’qo bizt gedaye
Bemot t’la wist’ bigwaz bihedm
Yemit’ebqegn ayanqelafam

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 7
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 8
Hesaben lit’al beeregnaye
Bemiyasemaragn cher t’ebaqiye
Kebereket minch’ ayasat’agnm
Beg silerasu tech’enqo ayawqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 9
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 10
Mengstun lisha lifelg ts’dqun
Silemiset’egn Geta lelawn
Silemich’eneq nege lerasu
Lamesgn zare tamgne beersu

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 11
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 12
Egziabher ale alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 1
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 2
ስለምግብና ስለምለብሰው
ብዙ ብጨነቅ ጥቅሙ ምንድነው
አበባን ለምድር ምግብን ለወፎች
የሚሰጥ አባት አለኝ ሳይሰለች

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 3
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 4
የማያምኑትን ስሙን ሳያውቁ
የሚያገኙትን ሳይጨነቁ
ስለምን ልድከም በከንቱ መሻት
እያለ ጌታ ያዳነኝ ከሞት

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 5
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 6
የክፉዎች ሰልፍ ቢሰፍር በላዬ
ዝናሩን ታጥቆ ቢዝት ገዳዬ
በሞት ጥላ ውስጥ ብጓዝ ብሔድም
የሚጠብቀኝ አያንቀላፋም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 7
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 8
ሀሳቤን ልጣል በእረኛዬ
በሚያሰማራኝ ቸር ጠባቂዬ
ከበረከት ምንጭ አያሳጣኝም
በግ ስለራሱ ተጨንቆ አያውቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 9
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 10
መንግስቱን ልሻ ልፈልግ ፅድቁን
ስለሚሰጠኝ ጌታ ሌላውን
ስለሚጨነቅ ነገ ለራሱ
ላመስግን ዛሬ ታምኜ በእርሱ

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 11
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 12
እግዚአብሔር አለ አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም',
        lyrics_transliteration = 'CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 1
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 2
Silemgbna silemlebsew
Bizu bich’eneq t’qmu mindnew
Abeban lemdr migbn lewefoch
Yemiset’ abat alegn sayselech

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 3
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 4
Yemayamnutn simun sayawqu
Yemiyagegnutn saych’enequ
Silemn lidkem bekentu meshat
Eyale Geta yadanegn kemot

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 5
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 6
Yekfuwoch self bisefr belaye
Zinarun tat’qo bizt gedaye
Bemot t’la wist’ bigwaz bihedm
Yemit’ebqegn ayanqelafam

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 7
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 8
Hesaben lit’al beeregnaye
Bemiyasemaragn cher t’ebaqiye
Kebereket minch’ ayasat’agnm
Beg silerasu tech’enqo ayawqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 9
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 10
Mengstun lisha lifelg ts’dqun
Silemiset’egn Geta lelawn
Silemich’eneq nege lerasu
Lamesgn zare tamgne beersu

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 11
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 12
Egziabher ale alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm',
        updated_at = clock_timestamp()::text
    WHERE import_id = '48a28818-b5ed-4eaa-981f-af93ddcafe6e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 1
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 2
ስለምግብና ስለምለብሰው
ብዙ ብጨነቅ ጥቅሙ ምንድነው
አበባን ለምድር ምግብን ለወፎች
የሚሰጥ አባት አለኝ ሳይሰለች

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 3
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 4
የማያምኑትን ስሙን ሳያውቁ
የሚያገኙትን ሳይጨነቁ
ስለምን ልድከም በከንቱ መሻት
እያለ ጌታ ያዳነኝ ከሞት

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 5
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 6
የክፉዎች ሰልፍ ቢሰፍር በላዬ
ዝናሩን ታጥቆ ቢዝት ገዳዬ
በሞት ጥላ ውስጥ ብጓዝ ብሔድም
የሚጠብቀኝ አያንቀላፋም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 7
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 8
ሀሳቤን ልጣል በእረኛዬ
በሚያሰማራኝ ቸር ጠባቂዬ
ከበረከት ምንጭ አያሳጣኝም
በግ ስለራሱ ተጨንቆ አያውቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 9
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 10
መንግስቱን ልሻ ልፈልግ ፅድቁን
ስለሚሰጠኝ ጌታ ሌላውን
ስለሚጨነቅ ነገ ለራሱ
ላመስግን ዛሬ ታምኜ በእርሱ

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 11
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 12
እግዚአብሔር አለ አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '48a28818-b5ed-4eaa-981f-af93ddcafe6e'::uuid, 'yerasen-tsegur-kutirun-yawikewal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hale-hale-luya ("Hale Hale Luya")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5755dc33-d88c-4bdd-a11d-914c2bf997cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 1
እየተደነቁ በአምላክ ቸርነት (2x)
ስብሐት ለእግዚአብሔር በሰማያት አሉ
እረኞችም አብረው እርሱን አከበሩ (2x)
ሃሌ ሃሌ ሉያ

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 2
ዓለምን ለመፍጠር ከተጠበበበት
ይበልጣል ከሁሉ እኛን ያዳነበት (2x)
ከዳግማዊት ሔዋን ከእመቤታችን
በረቂቅ ጥበቡ ተወልዶ አዳነን (2x)

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 3
ሃሌ ሃሌ ሉያ
ሁላችሁም ሂዱ ከቤተልሔም
ታገኙታላችሁ በከብቶች ግርግም (2x)
ኢየሱስ ክርስቶስ ወኀቤ ሠላም

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 4
ሞታችንን ወስዶ ሕይወቱን ሰጠን (2x)
ሃሌ ሃሌ ሉያ
ሁላችሁም ሂዱ ከቤተልሔም
ታገኙታላችሁ በከብቶች ግርግም (2x)

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 5
ኢየሱስ ክርስቶስ ወኀቤ ሠላም
ሞታችንን ወስዶ ሕይወቱን ሰጠን (2x)
ሃሌ ሃሌ ሉያ

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 1
Eyetedenequ beamlak chernet (2x)
Sibhet leEgziabher besemayat alu
Eregnochm abrew ersun akeberu (2x)
Hale Halleluya

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 2
Alemn lemeft’er ketet’ebebebet
Yibelt’al kehulu egnan yadanebet (2x)
Kedagmawit hewan keemebetachn
Bereqiq t’bebu teweldo adanen (2x)

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 3
Hale Halleluya
Hulachhum hidu kebetelhem
Tagegnutalachhu bekebtoch girgm (2x)
Iyesus Kristos wehebe selam

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 4
Motachnn wesdo hiywetun set’en (2x)
Hale Halleluya
Hulachhum hidu kebetelhem
Tagegnutalachhu bekebtoch girgm (2x)

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 5
Iyesus Kristos wehebe selam
Motachnn wesdo hiywetun set’en (2x)
Hale Halleluya

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 1
እየተደነቁ በአምላክ ቸርነት (2x)
ስብሐት ለእግዚአብሔር በሰማያት አሉ
እረኞችም አብረው እርሱን አከበሩ (2x)
ሃሌ ሃሌ ሉያ

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 2
ዓለምን ለመፍጠር ከተጠበበበት
ይበልጣል ከሁሉ እኛን ያዳነበት (2x)
ከዳግማዊት ሔዋን ከእመቤታችን
በረቂቅ ጥበቡ ተወልዶ አዳነን (2x)

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 3
ሃሌ ሃሌ ሉያ
ሁላችሁም ሂዱ ከቤተልሔም
ታገኙታላችሁ በከብቶች ግርግም (2x)
ኢየሱስ ክርስቶስ ወኀቤ ሠላም

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 4
ሞታችንን ወስዶ ሕይወቱን ሰጠን (2x)
ሃሌ ሃሌ ሉያ
ሁላችሁም ሂዱ ከቤተልሔም
ታገኙታላችሁ በከብቶች ግርግም (2x)

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 5
ኢየሱስ ክርስቶስ ወኀቤ ሠላም
ሞታችንን ወስዶ ሕይወቱን ሰጠን (2x)
ሃሌ ሃሌ ሉያ

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት',
        lyrics_transliteration = 'CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 1
Eyetedenequ beamlak chernet (2x)
Sibhet leEgziabher besemayat alu
Eregnochm abrew ersun akeberu (2x)
Hale Halleluya

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 2
Alemn lemeft’er ketet’ebebebet
Yibelt’al kehulu egnan yadanebet (2x)
Kedagmawit hewan keemebetachn
Bereqiq t’bebu teweldo adanen (2x)

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 3
Hale Halleluya
Hulachhum hidu kebetelhem
Tagegnutalachhu bekebtoch girgm (2x)
Iyesus Kristos wehebe selam

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 4
Motachnn wesdo hiywetun set’en (2x)
Hale Halleluya
Hulachhum hidu kebetelhem
Tagegnutalachhu bekebtoch girgm (2x)

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 5
Iyesus Kristos wehebe selam
Motachnn wesdo hiywetun set’en (2x)
Hale Halleluya

CHORUS
Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5755dc33-d88c-4bdd-a11d-914c2bf997cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 1
እየተደነቁ በአምላክ ቸርነት (2x)
ስብሐት ለእግዚአብሔር በሰማያት አሉ
እረኞችም አብረው እርሱን አከበሩ (2x)
ሃሌ ሃሌ ሉያ

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 2
ዓለምን ለመፍጠር ከተጠበበበት
ይበልጣል ከሁሉ እኛን ያዳነበት (2x)
ከዳግማዊት ሔዋን ከእመቤታችን
በረቂቅ ጥበቡ ተወልዶ አዳነን (2x)

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 3
ሃሌ ሃሌ ሉያ
ሁላችሁም ሂዱ ከቤተልሔም
ታገኙታላችሁ በከብቶች ግርግም (2x)
ኢየሱስ ክርስቶስ ወኀቤ ሠላም

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 4
ሞታችንን ወስዶ ሕይወቱን ሰጠን (2x)
ሃሌ ሃሌ ሉያ
ሁላችሁም ሂዱ ከቤተልሔም
ታገኙታላችሁ በከብቶች ግርግም (2x)

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 5
ኢየሱስ ክርስቶስ ወኀቤ ሠላም
ሞታችንን ወስዶ ሕይወቱን ሰጠን (2x)
ሃሌ ሃሌ ሉያ

CHORUS
ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5755dc33-d88c-4bdd-a11d-914c2bf997cd'::uuid, 'hale-hale-luya', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemenen-amesgenekut ("Zemenen Amesgenekut")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9f8d7c94-d4b6-4eac-9260-d4cb4f72aed7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 1
ገና እዘምራለሁ ምስጋና አለኝ ገና
ካበቃኝ ለዛሬ ከደረስኩ በደህና
እስትንፋሴ እስኪቆም ወደርሱ እስክጠራ
ውዳሴ ማቅረብ ነው ግብሬ የእኔ ስራ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 2
ከያቦክ ወንዝ ዳር ክፉ ስሜን ጣለው
ለስሙ እድዘምር እዳመሰግነው
ትናንትን አልፌ በቃሁኝ ለዛሬ
በጌልጌላ ምድር ተወግዶ ነውሬ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 3
ለጣቶቼ ሰልፍን ለእጆቼ በገና
አስተምሮ አቆመኝ ለስሙ ምስጋና
ለመዝሙር ቢቀባኝ ገና ሕጻን ሳለሁ
በደሌ ቢበዛም ዛሬም ዘምራለሁ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 4
ሜልኮል ዝም አላለች ዛሬምከመተቸት
በሰገነት ሆና መዝሙሬን እያየች
ከእግዚአብሔር በላይ እኔ ምን ክብር አለኝ
ክብሬም ምስጋናዬም ለእሱ ነው ለሾመኝ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 5
መዝሙር ምስጋናዬ መዝሙር ነው ፀሎቴ
የሚፈጸምበት ልመና መሻቴ
ማእበሉ ወጀቡ የበረታው ጭንቀት
ለስሙ እየዘመርኩ ስንቱን ጌዜ አለፍኩት

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 6
ሀይል አለው ዝማሬ ፈውስ ነው በገና
ከደዌ ከጭንቀት ይፈውሳልና
የጠላትን ሀሳብ ቅጥሩን ያፈረስኩት
ስሙን ጠርቼ ነው በበረታ ጩኸት

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 1
Gena ezemralehu misgana alegn gena
Kabeqagn lezare kederesku bedehna
Estnfase eskiqom wedersu eskt’era
Widase maqreb new gibre yeene sira

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 2
Keyabok wenz dar kifu simen t’alew
Lesmu edzemr edamesegnew
Tinantn alfe beqahugn lezare
Begelgela midr tewegdo newre

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 3
Let’atoche selfn leejoche begena
Astemro aqomegn lesmu misgana
Lemezmur biqebagn gena hits’an salehu
Bedele bibezam zarem zemralehu

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 4
Melkol zim alalech zaremkemetechet
Besegenet hona mezmuren eyayech
Keegziabher belay ene min kibir alegn
Kibrem misganayem leesu new leshomegn

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 5
Mezmur misganaye mezmur new ts’elote
Yemifets’embet limena meshate
Maebelu wejebu yeberetaw ch’nqet
Lesmu eyezemerku sintun geze alefkut

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 6
Heyl alew zimare fews new begena
Kedewe kech’nqet yifewsalna
Yet’elatn hesab qit’run yafereskut
Simun t’erche new bebereta ch’uኸt

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 1
ገና እዘምራለሁ ምስጋና አለኝ ገና
ካበቃኝ ለዛሬ ከደረስኩ በደህና
እስትንፋሴ እስኪቆም ወደርሱ እስክጠራ
ውዳሴ ማቅረብ ነው ግብሬ የእኔ ስራ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 2
ከያቦክ ወንዝ ዳር ክፉ ስሜን ጣለው
ለስሙ እድዘምር እዳመሰግነው
ትናንትን አልፌ በቃሁኝ ለዛሬ
በጌልጌላ ምድር ተወግዶ ነውሬ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 3
ለጣቶቼ ሰልፍን ለእጆቼ በገና
አስተምሮ አቆመኝ ለስሙ ምስጋና
ለመዝሙር ቢቀባኝ ገና ሕጻን ሳለሁ
በደሌ ቢበዛም ዛሬም ዘምራለሁ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 4
ሜልኮል ዝም አላለች ዛሬምከመተቸት
በሰገነት ሆና መዝሙሬን እያየች
ከእግዚአብሔር በላይ እኔ ምን ክብር አለኝ
ክብሬም ምስጋናዬም ለእሱ ነው ለሾመኝ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 5
መዝሙር ምስጋናዬ መዝሙር ነው ፀሎቴ
የሚፈጸምበት ልመና መሻቴ
ማእበሉ ወጀቡ የበረታው ጭንቀት
ለስሙ እየዘመርኩ ስንቱን ጌዜ አለፍኩት

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 6
ሀይል አለው ዝማሬ ፈውስ ነው በገና
ከደዌ ከጭንቀት ይፈውሳልና
የጠላትን ሀሳብ ቅጥሩን ያፈረስኩት
ስሙን ጠርቼ ነው በበረታ ጩኸት

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን',
        lyrics_transliteration = 'CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 1
Gena ezemralehu misgana alegn gena
Kabeqagn lezare kederesku bedehna
Estnfase eskiqom wedersu eskt’era
Widase maqreb new gibre yeene sira

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 2
Keyabok wenz dar kifu simen t’alew
Lesmu edzemr edamesegnew
Tinantn alfe beqahugn lezare
Begelgela midr tewegdo newre

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 3
Let’atoche selfn leejoche begena
Astemro aqomegn lesmu misgana
Lemezmur biqebagn gena hits’an salehu
Bedele bibezam zarem zemralehu

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 4
Melkol zim alalech zaremkemetechet
Besegenet hona mezmuren eyayech
Keegziabher belay ene min kibir alegn
Kibrem misganayem leesu new leshomegn

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 5
Mezmur misganaye mezmur new ts’elote
Yemifets’embet limena meshate
Maebelu wejebu yeberetaw ch’nqet
Lesmu eyezemerku sintun geze alefkut

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 6
Heyl alew zimare fews new begena
Kedewe kech’nqet yifewsalna
Yet’elatn hesab qit’run yafereskut
Simun t’erche new bebereta ch’uኸt

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9f8d7c94-d4b6-4eac-9260-d4cb4f72aed7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 1
ገና እዘምራለሁ ምስጋና አለኝ ገና
ካበቃኝ ለዛሬ ከደረስኩ በደህና
እስትንፋሴ እስኪቆም ወደርሱ እስክጠራ
ውዳሴ ማቅረብ ነው ግብሬ የእኔ ስራ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 2
ከያቦክ ወንዝ ዳር ክፉ ስሜን ጣለው
ለስሙ እድዘምር እዳመሰግነው
ትናንትን አልፌ በቃሁኝ ለዛሬ
በጌልጌላ ምድር ተወግዶ ነውሬ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 3
ለጣቶቼ ሰልፍን ለእጆቼ በገና
አስተምሮ አቆመኝ ለስሙ ምስጋና
ለመዝሙር ቢቀባኝ ገና ሕጻን ሳለሁ
በደሌ ቢበዛም ዛሬም ዘምራለሁ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 4
ሜልኮል ዝም አላለች ዛሬምከመተቸት
በሰገነት ሆና መዝሙሬን እያየች
ከእግዚአብሔር በላይ እኔ ምን ክብር አለኝ
ክብሬም ምስጋናዬም ለእሱ ነው ለሾመኝ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 5
መዝሙር ምስጋናዬ መዝሙር ነው ፀሎቴ
የሚፈጸምበት ልመና መሻቴ
ማእበሉ ወጀቡ የበረታው ጭንቀት
ለስሙ እየዘመርኩ ስንቱን ጌዜ አለፍኩት

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 6
ሀይል አለው ዝማሬ ፈውስ ነው በገና
ከደዌ ከጭንቀት ይፈውሳልና
የጠላትን ሀሳብ ቅጥሩን ያፈረስኩት
ስሙን ጠርቼ ነው በበረታ ጩኸት

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9f8d7c94-d4b6-4eac-9260-d4cb4f72aed7'::uuid, 'zemenen-amesgenekut', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yikuneni ("Yikuneni")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '12d93716-8117-45f7-aafa-c9b2ca970a59'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 1
የአዳም ቃልኪዳን መፈጸሚያው ሲደርስ
ላከው ገብርኤልን ወደ ቤተመቅደስ
በእግዚአብሔር እሊና ተስላ የነበረች
ከሰማይ የመጣ ቃሉን ተቀበለች

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 2
ዳግሚት ሰማይ አርያም ሆነች
ይደረግ ብላ በትዕትና ተቀበለች
አዝ……………………………………………………………
ማርያም ሆይ አትፍሪ ብሎ እያረጋጋት

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 3
ካንቺ የሚወለደው መድኃኒት ነው አላት
ወንድ ስለማላውቅ ይሄ እንዴት ይሆናል
ብላ ጠየቀችው ድንግልም ደንቋታል
ከሴቶች መሀል አንቺ ልዩነሽ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 4
በህግ ሳይሆን በድንግልና ትፀንሻለሽ
አዝ……………………………………………………………
ሕይወት ቢቀዳባት አድሮኋል በማህጸኗ
አይኖርም ከእንግዲህ የሔዋን መርገሟ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 5
የአዲሱ ኪዳን አዲስ ብስራታችን
ምክንያተ ድህነት አለች እናታችን
ቃልህ ይፈጸም ይደረግ ብላ
ታምር ተሰማ እየሩሳሌም ናዝሬት ገሊላ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 6
አዝ…………………………………………………………
እጅግ አስገረመኝ የገብርኤል ዜና
የነ ዘካርያሰ ከቶ አይደለምና
የተመረጠችው የደረስው ብስራት

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 7
አለምን ከመሞት ከመርገሟ ዋጃት
ከሴቶች መሀል አንቺ ልዩነሽ
በህግ ሳይሆን በድንግልና ትፀንሻለሽ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 1
Yeadam qalkidan mefets’emiyaw siders
Lakew gebreln wede betemeqdes
BeEgziabher elina tesla yeneberech
Kesemay yemet’a qalun teqebelech

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 2
Dagmit semay aryam honech
Yidereg bila betetna teqebelech
CHORUS
Maryam hoy atfri bilo eyaregagat

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 3
Kanchi yemiweledew medhanit new alat
Wend silemalawq yihe endet yihonal
Bila t’eyeqechw dinglm denqwatal
Kesetoch mehel anchi liyunesh

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 4
Behg sayhon bedingilina tits’enshalesh
CHORUS
Hiywet biqedabat adrohwal bemahts’enwa
Aynorm keengdih yehewan mergemwa

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 5
Yeadisu kidan adis bisratachn
Miknyate dihnet alech enatachn
Qalh yifets’em yidereg bila
Tamr tesema eyerusalem nazret gelila

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 6
CHORUS
Ejg asgeremegn yeGebriel zena
Yene zekaryase keto aydelemna
Yetemeret’echw yederesw bisrat

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 7
Alemn kememot kemergemwa wajat
Kesetoch mehel anchi liyunesh
Behg sayhon bedingilina tits’enshalesh

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 1
የአዳም ቃልኪዳን መፈጸሚያው ሲደርስ
ላከው ገብርኤልን ወደ ቤተመቅደስ
በእግዚአብሔር እሊና ተስላ የነበረች
ከሰማይ የመጣ ቃሉን ተቀበለች

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 2
ዳግሚት ሰማይ አርያም ሆነች
ይደረግ ብላ በትዕትና ተቀበለች
አዝ……………………………………………………………
ማርያም ሆይ አትፍሪ ብሎ እያረጋጋት

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 3
ካንቺ የሚወለደው መድኃኒት ነው አላት
ወንድ ስለማላውቅ ይሄ እንዴት ይሆናል
ብላ ጠየቀችው ድንግልም ደንቋታል
ከሴቶች መሀል አንቺ ልዩነሽ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 4
በህግ ሳይሆን በድንግልና ትፀንሻለሽ
አዝ……………………………………………………………
ሕይወት ቢቀዳባት አድሮኋል በማህጸኗ
አይኖርም ከእንግዲህ የሔዋን መርገሟ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 5
የአዲሱ ኪዳን አዲስ ብስራታችን
ምክንያተ ድህነት አለች እናታችን
ቃልህ ይፈጸም ይደረግ ብላ
ታምር ተሰማ እየሩሳሌም ናዝሬት ገሊላ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 6
አዝ…………………………………………………………
እጅግ አስገረመኝ የገብርኤል ዜና
የነ ዘካርያሰ ከቶ አይደለምና
የተመረጠችው የደረስው ብስራት

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 7
አለምን ከመሞት ከመርገሟ ዋጃት
ከሴቶች መሀል አንቺ ልዩነሽ
በህግ ሳይሆን በድንግልና ትፀንሻለሽ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………',
        lyrics_transliteration = 'CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 1
Yeadam qalkidan mefets’emiyaw siders
Lakew gebreln wede betemeqdes
BeEgziabher elina tesla yeneberech
Kesemay yemet’a qalun teqebelech

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 2
Dagmit semay aryam honech
Yidereg bila betetna teqebelech
CHORUS
Maryam hoy atfri bilo eyaregagat

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 3
Kanchi yemiweledew medhanit new alat
Wend silemalawq yihe endet yihonal
Bila t’eyeqechw dinglm denqwatal
Kesetoch mehel anchi liyunesh

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 4
Behg sayhon bedingilina tits’enshalesh
CHORUS
Hiywet biqedabat adrohwal bemahts’enwa
Aynorm keengdih yehewan mergemwa

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 5
Yeadisu kidan adis bisratachn
Miknyate dihnet alech enatachn
Qalh yifets’em yidereg bila
Tamr tesema eyerusalem nazret gelila

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 6
CHORUS
Ejg asgeremegn yeGebriel zena
Yene zekaryase keto aydelemna
Yetemeret’echw yederesw bisrat

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 7
Alemn kememot kemergemwa wajat
Kesetoch mehel anchi liyunesh
Behg sayhon bedingilina tits’enshalesh

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS',
        updated_at = clock_timestamp()::text
    WHERE import_id = '12d93716-8117-45f7-aafa-c9b2ca970a59'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 1
የአዳም ቃልኪዳን መፈጸሚያው ሲደርስ
ላከው ገብርኤልን ወደ ቤተመቅደስ
በእግዚአብሔር እሊና ተስላ የነበረች
ከሰማይ የመጣ ቃሉን ተቀበለች

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 2
ዳግሚት ሰማይ አርያም ሆነች
ይደረግ ብላ በትዕትና ተቀበለች
አዝ……………………………………………………………
ማርያም ሆይ አትፍሪ ብሎ እያረጋጋት

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 3
ካንቺ የሚወለደው መድኃኒት ነው አላት
ወንድ ስለማላውቅ ይሄ እንዴት ይሆናል
ብላ ጠየቀችው ድንግልም ደንቋታል
ከሴቶች መሀል አንቺ ልዩነሽ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 4
በህግ ሳይሆን በድንግልና ትፀንሻለሽ
አዝ……………………………………………………………
ሕይወት ቢቀዳባት አድሮኋል በማህጸኗ
አይኖርም ከእንግዲህ የሔዋን መርገሟ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 5
የአዲሱ ኪዳን አዲስ ብስራታችን
ምክንያተ ድህነት አለች እናታችን
ቃልህ ይፈጸም ይደረግ ብላ
ታምር ተሰማ እየሩሳሌም ናዝሬት ገሊላ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 6
አዝ…………………………………………………………
እጅግ አስገረመኝ የገብርኤል ዜና
የነ ዘካርያሰ ከቶ አይደለምና
የተመረጠችው የደረስው ብስራት

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 7
አለምን ከመሞት ከመርገሟ ዋጃት
ከሴቶች መሀል አንቺ ልዩነሽ
በህግ ሳይሆን በድንግልና ትፀንሻለሽ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '12d93716-8117-45f7-aafa-c9b2ca970a59'::uuid, 'yikuneni', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- akilile-tsige-mariyam ("Akilile Tsige Mariyam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1e774f02-29e1-4a69-8b10-5e26ff0a0259'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አክሊለ ፅጌ ማሪያም
አክሊለ ፅጌ ማርያም
አክሊለ ፅጌ ማርያም
ቀፀላ መንገስቱ መንግስቱ ለጊዮርጊስ

VERSE 1
ክበበ ጊራ ወርቅ አክልለ ፅጌ

CHORUS
አክሊለ ፅጌ ማሪያም
አክሊለ ፅጌ ማርያም
አክሊለ ፅጌ ማርያም
ቀፀላ መንገስቱ መንግስቱ ለጊዮርጊስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aklile ts’ge mariyam
Aklile ts’ge Maryam
Aklile ts’ge Maryam
Qets’ela mengestu mengstu legiyorgis

VERSE 1
Kibebe gira werq aklle ts’ge

CHORUS
Aklile ts’ge mariyam
Aklile ts’ge Maryam
Aklile ts’ge Maryam
Qets’ela mengestu mengstu legiyorgis'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አክሊለ ፅጌ ማሪያም
አክሊለ ፅጌ ማርያም
አክሊለ ፅጌ ማርያም
ቀፀላ መንገስቱ መንግስቱ ለጊዮርጊስ

VERSE 1
ክበበ ጊራ ወርቅ አክልለ ፅጌ

CHORUS
አክሊለ ፅጌ ማሪያም
አክሊለ ፅጌ ማርያም
አክሊለ ፅጌ ማርያም
ቀፀላ መንገስቱ መንግስቱ ለጊዮርጊስ',
        lyrics_transliteration = 'CHORUS
Aklile ts’ge mariyam
Aklile ts’ge Maryam
Aklile ts’ge Maryam
Qets’ela mengestu mengstu legiyorgis

VERSE 1
Kibebe gira werq aklle ts’ge

CHORUS
Aklile ts’ge mariyam
Aklile ts’ge Maryam
Aklile ts’ge Maryam
Qets’ela mengestu mengstu legiyorgis',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1e774f02-29e1-4a69-8b10-5e26ff0a0259'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አክሊለ ፅጌ ማሪያም
አክሊለ ፅጌ ማርያም
አክሊለ ፅጌ ማርያም
ቀፀላ መንገስቱ መንግስቱ ለጊዮርጊስ

VERSE 1
ክበበ ጊራ ወርቅ አክልለ ፅጌ

CHORUS
አክሊለ ፅጌ ማሪያም
አክሊለ ፅጌ ማርያም
አክሊለ ፅጌ ማርያም
ቀፀላ መንገስቱ መንግስቱ ለጊዮርጊስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1e774f02-29e1-4a69-8b10-5e26ff0a0259'::uuid, 'akilile-tsige-mariyam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eftn-aleku-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur ("~ Eftn Aleku ~ By Zemari Henok Fikadu~ Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f1839be0-2d74-4026-ba3c-3f54a61fba5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 1
ማርቆስ 𝟏𝟎:𝟒𝟔𝟓𝟐
1st may
ወዲ ዳዊት ጎዪታይ "ስምዓኒ ''ሞ" ሓንሳብ ከዕልለካ ንድምጸይ ጽን በሎ “መልሰለይ”
ሰሪ ዝ ድፉን ልቦናይ፥ ከመይ ኢለ ክሪኦ ''ቲ ትህቦ ፍቅሪ ቑልሕ በል ጸውዓኒ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 2
ውሉደይ ! እንታይ ኢኻ ትደሊ፡ እንታይ ክገብረልካ
ማርቆስ 10፥51
ኣምላከይ ! ብ ዕውርቲ ልበይ፡ ክርኢ ምድሓንካ
ማርቆስ 10፥51

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 3
እመን እሞ፡ እቲ ዘድልየካ፡ ኩሉ ክገብረልካ
ማርቆስ 10፥52
ኣነ ኢየ፡ ''ቲ ኩሉ ዝኽእል ወሃቢ ኣምላኽካ
ኤርምያስ 32፥2627

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 4
ሮሜ 𝟕:𝟏𝟒𝟐𝟓
2nd may
ነቲ ኣነ ክገብሮ ዘይደሊ፡ እናፈለጥኩ ጐይታይ፡ ብድፍረት ዝገብሮስ “ታየ ኮይነ”
ኣብዛ ሥጋይ፡ ሠናይ የለን፡ ጕዕዞ ሞት ኮይኑኒ፡ ማራናታ ኢየሱስ ምድሓነይ ናፊቀ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 5
ንሓጢኣትካ፡ ብሞተይ ክስዕሮ፡ ሕይወተይ
ሂበ ''የ፡
1ይ ቆረንጦስ 15:3
ኣብ ድኽመተይ፡ ሓይልካ ክትገልጽ፡ ጸጋኻ’የ ደልየ፡

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 6
2ይ ቆረንጦስ 12:9
ሰዓበኒ ! ወደይ ኣይትማታእ፡ ነዓ መስቀልካ ኣልዕል፡
ሉቃስ 9:23
ክሓጽበካ''ሞ፡ ካብ በረድ ኽትጽዕዱ፡ ከም ብተይ ክትዘልል፡

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 7
ኢሳይያስ 1:18
ዘፍጥረት 𝟑𝟐:𝟐𝟒𝟑𝟎
3rd may
ኣለኩ ኣብዚ፥ ክሳብ ተ''ውግሓለይ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 8
ከይባረኽካንሲ ክሓድገካ ከመይ "መድሓኒየይ"
ክሳብ መዓስየ ኽ''ኽወል ካብቲ ብርሃን ገጽካ
ብሰንኪ ኃጢኣትይ ኢድካ ዘርግሓለይ
ዝሓስበልካ ሓሳብ እፈልጦየ ነገር ደሓን እዩ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 9
ኤርምያስ 29:11
እኣምን ጐይታይ፡ ካባኻ ዝፈልየኒ፡ድኻመይ እንድኣሉ
ኢሳይያስ 59:2-3
ጽናዕ ትባዕ ኣብ ትኸዶ ኩሉ ምሳካ’የ ወትሩ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 10
ኢያሱ 1:9
ካብ ሓጢኣትካ ‘ቲ ጸጋይ ይዓቢ ክትሰግሮ ኢካ ኩሉ
ሮሜ 5:20
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 11
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥(2)

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 1
Marqos 𝟏𝟎:𝟒𝟔𝟓𝟐
1st may
Wedi dawit goyitay "simani ''mo" hansab keelleka nidmts’ey ts’n belo “melseley”
Seri z difun libonay: kemey ile kirio ''ti tihbo fiqri ቑlh bel ts’ewani

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 2
Wiludey ! entay iኻ tideli entay kigebrelka
Marqos 10:51
Amlakey ! b ewrti libey kiri midhanka
Marqos 10:51

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 3
Emen emo eti zedlyeka kulu kigebrelka
Marqos 10:52
Ane iye ''ti kulu ziኽel wehabi amlaኽka
Ermyas 32:2627

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 4
Rome 𝟕:𝟏𝟒𝟐𝟓
2nd may
Neti ane kigebro zeydeli enafelet’ku gweytay bidfret zigebros “taye koyne”
Abza sigay senay yelen gwezo mot koynuni maranata Iyesus midhaney nafiqe

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 5
Nihat’iatka bimotey kisero hiywetey
Hibe ''ye
1y qorent’os 15:3
Ab diኽmetey haylka kitgelts’ ts’egaኻ’ye delye

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 6
2y qorent’os 12:9
Seabeni ! wedey aytmatae nea mesqelka alel
Luqas 9:23
Kihats’beka''mo kab bered ኽtts’edu kem bitey kitzell

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 7
Isayyas 1:18
Zeft’ret 𝟑𝟐:𝟐𝟒𝟑𝟎
3rd may
Aleku abzi: kisab te''wighaley

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 8
Keybareኽkansi kihadgeka kemey "medhaniyey"
Kisab measye ኽ''ኽwel kabti birhan gets’ka
Bisenki hat’iaty idka zerghaley
Zihasbelka hasab efelt’oye neger dehan eyu

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 9
Ermyas 29:11
Eamn gweytay kabaኻ zifelyeni dኻmey endalu
Isayyas 59:2-3
Ts’nae tibae ab tiኸdo kulu misaka’ye wetru

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 10
Iyasu 1:9
Kab hat’iatka ‘ti ts’egay yiabi kitsegro ika kulu
Rome 5:20
Eftn aleku: eqales amlaኸy bebhanti:

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 11
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ: (2)

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 1
ማርቆስ 𝟏𝟎:𝟒𝟔𝟓𝟐
1st may
ወዲ ዳዊት ጎዪታይ "ስምዓኒ ''ሞ" ሓንሳብ ከዕልለካ ንድምጸይ ጽን በሎ “መልሰለይ”
ሰሪ ዝ ድፉን ልቦናይ፥ ከመይ ኢለ ክሪኦ ''ቲ ትህቦ ፍቅሪ ቑልሕ በል ጸውዓኒ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 2
ውሉደይ ! እንታይ ኢኻ ትደሊ፡ እንታይ ክገብረልካ
ማርቆስ 10፥51
ኣምላከይ ! ብ ዕውርቲ ልበይ፡ ክርኢ ምድሓንካ
ማርቆስ 10፥51

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 3
እመን እሞ፡ እቲ ዘድልየካ፡ ኩሉ ክገብረልካ
ማርቆስ 10፥52
ኣነ ኢየ፡ ''ቲ ኩሉ ዝኽእል ወሃቢ ኣምላኽካ
ኤርምያስ 32፥2627

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 4
ሮሜ 𝟕:𝟏𝟒𝟐𝟓
2nd may
ነቲ ኣነ ክገብሮ ዘይደሊ፡ እናፈለጥኩ ጐይታይ፡ ብድፍረት ዝገብሮስ “ታየ ኮይነ”
ኣብዛ ሥጋይ፡ ሠናይ የለን፡ ጕዕዞ ሞት ኮይኑኒ፡ ማራናታ ኢየሱስ ምድሓነይ ናፊቀ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 5
ንሓጢኣትካ፡ ብሞተይ ክስዕሮ፡ ሕይወተይ
ሂበ ''የ፡
1ይ ቆረንጦስ 15:3
ኣብ ድኽመተይ፡ ሓይልካ ክትገልጽ፡ ጸጋኻ’የ ደልየ፡

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 6
2ይ ቆረንጦስ 12:9
ሰዓበኒ ! ወደይ ኣይትማታእ፡ ነዓ መስቀልካ ኣልዕል፡
ሉቃስ 9:23
ክሓጽበካ''ሞ፡ ካብ በረድ ኽትጽዕዱ፡ ከም ብተይ ክትዘልል፡

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 7
ኢሳይያስ 1:18
ዘፍጥረት 𝟑𝟐:𝟐𝟒𝟑𝟎
3rd may
ኣለኩ ኣብዚ፥ ክሳብ ተ''ውግሓለይ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 8
ከይባረኽካንሲ ክሓድገካ ከመይ "መድሓኒየይ"
ክሳብ መዓስየ ኽ''ኽወል ካብቲ ብርሃን ገጽካ
ብሰንኪ ኃጢኣትይ ኢድካ ዘርግሓለይ
ዝሓስበልካ ሓሳብ እፈልጦየ ነገር ደሓን እዩ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 9
ኤርምያስ 29:11
እኣምን ጐይታይ፡ ካባኻ ዝፈልየኒ፡ድኻመይ እንድኣሉ
ኢሳይያስ 59:2-3
ጽናዕ ትባዕ ኣብ ትኸዶ ኩሉ ምሳካ’የ ወትሩ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 10
ኢያሱ 1:9
ካብ ሓጢኣትካ ‘ቲ ጸጋይ ይዓቢ ክትሰግሮ ኢካ ኩሉ
ሮሜ 5:20
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 11
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥(2)

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥',
        lyrics_transliteration = 'CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 1
Marqos 𝟏𝟎:𝟒𝟔𝟓𝟐
1st may
Wedi dawit goyitay "simani ''mo" hansab keelleka nidmts’ey ts’n belo “melseley”
Seri z difun libonay: kemey ile kirio ''ti tihbo fiqri ቑlh bel ts’ewani

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 2
Wiludey ! entay iኻ tideli entay kigebrelka
Marqos 10:51
Amlakey ! b ewrti libey kiri midhanka
Marqos 10:51

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 3
Emen emo eti zedlyeka kulu kigebrelka
Marqos 10:52
Ane iye ''ti kulu ziኽel wehabi amlaኽka
Ermyas 32:2627

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 4
Rome 𝟕:𝟏𝟒𝟐𝟓
2nd may
Neti ane kigebro zeydeli enafelet’ku gweytay bidfret zigebros “taye koyne”
Abza sigay senay yelen gwezo mot koynuni maranata Iyesus midhaney nafiqe

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 5
Nihat’iatka bimotey kisero hiywetey
Hibe ''ye
1y qorent’os 15:3
Ab diኽmetey haylka kitgelts’ ts’egaኻ’ye delye

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 6
2y qorent’os 12:9
Seabeni ! wedey aytmatae nea mesqelka alel
Luqas 9:23
Kihats’beka''mo kab bered ኽtts’edu kem bitey kitzell

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 7
Isayyas 1:18
Zeft’ret 𝟑𝟐:𝟐𝟒𝟑𝟎
3rd may
Aleku abzi: kisab te''wighaley

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 8
Keybareኽkansi kihadgeka kemey "medhaniyey"
Kisab measye ኽ''ኽwel kabti birhan gets’ka
Bisenki hat’iaty idka zerghaley
Zihasbelka hasab efelt’oye neger dehan eyu

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 9
Ermyas 29:11
Eamn gweytay kabaኻ zifelyeni dኻmey endalu
Isayyas 59:2-3
Ts’nae tibae ab tiኸdo kulu misaka’ye wetru

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 10
Iyasu 1:9
Kab hat’iatka ‘ti ts’egay yiabi kitsegro ika kulu
Rome 5:20
Eftn aleku: eqales amlaኸy bebhanti:

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 11
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ: (2)

CHORUS
Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f1839be0-2d74-4026-ba3c-3f54a61fba5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 1
ማርቆስ 𝟏𝟎:𝟒𝟔𝟓𝟐
1st may
ወዲ ዳዊት ጎዪታይ "ስምዓኒ ''ሞ" ሓንሳብ ከዕልለካ ንድምጸይ ጽን በሎ “መልሰለይ”
ሰሪ ዝ ድፉን ልቦናይ፥ ከመይ ኢለ ክሪኦ ''ቲ ትህቦ ፍቅሪ ቑልሕ በል ጸውዓኒ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 2
ውሉደይ ! እንታይ ኢኻ ትደሊ፡ እንታይ ክገብረልካ
ማርቆስ 10፥51
ኣምላከይ ! ብ ዕውርቲ ልበይ፡ ክርኢ ምድሓንካ
ማርቆስ 10፥51

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 3
እመን እሞ፡ እቲ ዘድልየካ፡ ኩሉ ክገብረልካ
ማርቆስ 10፥52
ኣነ ኢየ፡ ''ቲ ኩሉ ዝኽእል ወሃቢ ኣምላኽካ
ኤርምያስ 32፥2627

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 4
ሮሜ 𝟕:𝟏𝟒𝟐𝟓
2nd may
ነቲ ኣነ ክገብሮ ዘይደሊ፡ እናፈለጥኩ ጐይታይ፡ ብድፍረት ዝገብሮስ “ታየ ኮይነ”
ኣብዛ ሥጋይ፡ ሠናይ የለን፡ ጕዕዞ ሞት ኮይኑኒ፡ ማራናታ ኢየሱስ ምድሓነይ ናፊቀ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 5
ንሓጢኣትካ፡ ብሞተይ ክስዕሮ፡ ሕይወተይ
ሂበ ''የ፡
1ይ ቆረንጦስ 15:3
ኣብ ድኽመተይ፡ ሓይልካ ክትገልጽ፡ ጸጋኻ’የ ደልየ፡

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 6
2ይ ቆረንጦስ 12:9
ሰዓበኒ ! ወደይ ኣይትማታእ፡ ነዓ መስቀልካ ኣልዕል፡
ሉቃስ 9:23
ክሓጽበካ''ሞ፡ ካብ በረድ ኽትጽዕዱ፡ ከም ብተይ ክትዘልል፡

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 7
ኢሳይያስ 1:18
ዘፍጥረት 𝟑𝟐:𝟐𝟒𝟑𝟎
3rd may
ኣለኩ ኣብዚ፥ ክሳብ ተ''ውግሓለይ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 8
ከይባረኽካንሲ ክሓድገካ ከመይ "መድሓኒየይ"
ክሳብ መዓስየ ኽ''ኽወል ካብቲ ብርሃን ገጽካ
ብሰንኪ ኃጢኣትይ ኢድካ ዘርግሓለይ
ዝሓስበልካ ሓሳብ እፈልጦየ ነገር ደሓን እዩ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 9
ኤርምያስ 29:11
እኣምን ጐይታይ፡ ካባኻ ዝፈልየኒ፡ድኻመይ እንድኣሉ
ኢሳይያስ 59:2-3
ጽናዕ ትባዕ ኣብ ትኸዶ ኩሉ ምሳካ’የ ወትሩ

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 10
ኢያሱ 1:9
ካብ ሓጢኣትካ ‘ቲ ጸጋይ ይዓቢ ክትሰግሮ ኢካ ኩሉ
ሮሜ 5:20
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 11
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥(2)

CHORUS
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f1839be0-2d74-4026-ba3c-3f54a61fba5f'::uuid, 'eftn-aleku-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-cant-do-it-alone ("I can't do it alone")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '12f84685-8586-40cb-a383-ffef88f02fb2'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 1
Give me tears of repentance, The Tears of St. Peter
The tears of the woman who cried, washed, Your feet with her hair
Give me the tears of King David, and his humble heart
Let me cry to cleanse my sins, give me true regret

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 2
I can''t do it alone, Lord be my strength.
Chorus….

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 3
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 4
You are my hope and my Lord, shine your guiding light
I repent, confess, all my sins, alone I cannot fight
Help me to live righteously, give me a way out
I am empty without you, send me your spirit

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 5
I can''t do it alone, Lord be my strength.
Chorus….

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 6
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 7
Grant me depth in knowing you, teach me the right path
Reveal, to me Your mysteries, please strengthen my faith
You suffered on my behalf, on the cross you died
You gave me Your flesh and blood, so I can be saved

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 8
I can''t do it alone, Lord be my strength.

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 9
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 1
Give me tears of repentance, The Tears of St. Peter
The tears of the woman who cried, washed, Your feet with her hair
Give me the tears of King David, and his humble heart
Let me cry to cleanse my sins, give me true regret

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 2
I can''t do it alone, Lord be my strength.
Chorus….

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 3
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 4
You are my hope and my Lord, shine your guiding light
I repent, confess, all my sins, alone I cannot fight
Help me to live righteously, give me a way out
I am empty without you, send me your spirit

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 5
I can''t do it alone, Lord be my strength.
Chorus….

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 6
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 7
Grant me depth in knowing you, teach me the right path
Reveal, to me Your mysteries, please strengthen my faith
You suffered on my behalf, on the cross you died
You gave me Your flesh and blood, so I can be saved

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 8
I can''t do it alone, Lord be my strength.

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 9
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = '12f84685-8586-40cb-a383-ffef88f02fb2'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 1
Give me tears of repentance, The Tears of St. Peter
The tears of the woman who cried, washed, Your feet with her hair
Give me the tears of King David, and his humble heart
Let me cry to cleanse my sins, give me true regret

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 2
I can''t do it alone, Lord be my strength.
Chorus….

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 3
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 4
You are my hope and my Lord, shine your guiding light
I repent, confess, all my sins, alone I cannot fight
Help me to live righteously, give me a way out
I am empty without you, send me your spirit

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 5
I can''t do it alone, Lord be my strength.
Chorus….

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 6
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 7
Grant me depth in knowing you, teach me the right path
Reveal, to me Your mysteries, please strengthen my faith
You suffered on my behalf, on the cross you died
You gave me Your flesh and blood, so I can be saved

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 8
I can''t do it alone, Lord be my strength.

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 9
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

CHORUS
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '12f84685-8586-40cb-a383-ffef88f02fb2'::uuid, 'i-cant-do-it-alone', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- getaye-kesetegn ("Getaye Kesetegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5d8a600f-aedb-4baf-80d7-dea9151ef6d9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
የሀዘኔ መርሻ ማርያም እናቴ ነሽ
እናት አግኝቻለሁ ከመስቀሉ እግርጌ

VERSE 1
ስሟን እየጠራሁ ከፍ እንዲል ማዕረጌ
ምርኩዝ ድጋፍ ሆኖኝ ድንግል ሆይ ፀሎትሽ በእፎይታ ሞልቶኛል የሰላምታ ድምፅሽ ፍፁም ላይረሳኝ ገብቶ ከደም ስሬ ይቀሰቅሰኛል ክብርሽ ለዝማሬ በልጅሽ መከራ ቀራንዮ ያለሽ አትዘነጊኝም ዛሬም ከእኔ ጋር ነሽ መታወክ መጨነቅ ከቤቴ እንዲነቀል የበረከቴን ቁልፍ ሰጥቶኛል ከመስቀል ከጣራዪ በታች መነጨ ደስታ ለጠቆረዉ ፊቴ እመቤቴ አብርታ በራስ ቅል ተራራ በነፍስሽ ሰይፍ አልፎ ካሳ ሆነኝ ፍቅርሽ በልቤ ተፅፎ እነኋት እናትህ ሲለኝ በርትቻለሁ በልጅነት ክብር ከፊትሽ ቆሜአለሁ የመስቀል ስጦታ እነኋት እናቴ ማንንም ሳልፈራ ወደስኳት ከቤቴ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ

CHORUS
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
የሀዘኔ መርሻ ማርያም እናቴ ነሽ
እናት አግኝቻለሁ ከመስቀሉ እግርጌ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Getayi keset’egn alferam liwesdsh
Getayi keset’egn alferam liwesdsh
Yehezene mersha Maryam enate nesh
Enat aggnchalehu kemesqelu egrge

VERSE 1
Simwan eyet’erahu kef endil maerege
Mirkuz digaf honogn Dingil hoy ts’elotsh beefoyta moltognal yeselamta dimts’sh fits’um layresagn gebto kedem sire yiqeseqsegnal kibrsh lezmare beljsh mekera qeranyo yalesh atzenegignm zarem keene gar nesh metawek mech’eneq kebete endineqel yebereketen qulf set’tognal kemesqel ket’arayi betach menech’e desta let’eqorewu fite Emebete abrta beras qil terara benefssh seyf alfo kasa honegn fiqrsh belbe tets’fo enehwat enath silegn bertchalehu beljnet kibir kefitsh qomealehu yemesqel sit’ota enehwat enate mannm salfera wedeskwat kebete bemesqel lay hono lijsh eraralgn beenatnet fiqrsh beten shelemelgn bemiyats’nanawu qalu meseberen kiso belbe tekele ats’nagnwan miseso mognnet aydelem negere mesqelu ejg matrefiya newu anchin meqebelu bemesqel lay hono lijsh eraralgn beenatnet fiqrsh beten shelemelgn bemiyats’nanawu qalu meseberen kiso belbe tekele ats’nagnwan miseso mognnet aydelem negere mesqelu ejg matrefiya newu anchin meqebelu

CHORUS
Getayi keset’egn alferam liwesdsh
Getayi keset’egn alferam liwesdsh
Yehezene mersha Maryam enate nesh
Enat aggnchalehu kemesqelu egrge'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
የሀዘኔ መርሻ ማርያም እናቴ ነሽ
እናት አግኝቻለሁ ከመስቀሉ እግርጌ

VERSE 1
ስሟን እየጠራሁ ከፍ እንዲል ማዕረጌ
ምርኩዝ ድጋፍ ሆኖኝ ድንግል ሆይ ፀሎትሽ በእፎይታ ሞልቶኛል የሰላምታ ድምፅሽ ፍፁም ላይረሳኝ ገብቶ ከደም ስሬ ይቀሰቅሰኛል ክብርሽ ለዝማሬ በልጅሽ መከራ ቀራንዮ ያለሽ አትዘነጊኝም ዛሬም ከእኔ ጋር ነሽ መታወክ መጨነቅ ከቤቴ እንዲነቀል የበረከቴን ቁልፍ ሰጥቶኛል ከመስቀል ከጣራዪ በታች መነጨ ደስታ ለጠቆረዉ ፊቴ እመቤቴ አብርታ በራስ ቅል ተራራ በነፍስሽ ሰይፍ አልፎ ካሳ ሆነኝ ፍቅርሽ በልቤ ተፅፎ እነኋት እናትህ ሲለኝ በርትቻለሁ በልጅነት ክብር ከፊትሽ ቆሜአለሁ የመስቀል ስጦታ እነኋት እናቴ ማንንም ሳልፈራ ወደስኳት ከቤቴ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ

CHORUS
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
የሀዘኔ መርሻ ማርያም እናቴ ነሽ
እናት አግኝቻለሁ ከመስቀሉ እግርጌ',
        lyrics_transliteration = 'CHORUS
Getayi keset’egn alferam liwesdsh
Getayi keset’egn alferam liwesdsh
Yehezene mersha Maryam enate nesh
Enat aggnchalehu kemesqelu egrge

VERSE 1
Simwan eyet’erahu kef endil maerege
Mirkuz digaf honogn Dingil hoy ts’elotsh beefoyta moltognal yeselamta dimts’sh fits’um layresagn gebto kedem sire yiqeseqsegnal kibrsh lezmare beljsh mekera qeranyo yalesh atzenegignm zarem keene gar nesh metawek mech’eneq kebete endineqel yebereketen qulf set’tognal kemesqel ket’arayi betach menech’e desta let’eqorewu fite Emebete abrta beras qil terara benefssh seyf alfo kasa honegn fiqrsh belbe tets’fo enehwat enath silegn bertchalehu beljnet kibir kefitsh qomealehu yemesqel sit’ota enehwat enate mannm salfera wedeskwat kebete bemesqel lay hono lijsh eraralgn beenatnet fiqrsh beten shelemelgn bemiyats’nanawu qalu meseberen kiso belbe tekele ats’nagnwan miseso mognnet aydelem negere mesqelu ejg matrefiya newu anchin meqebelu bemesqel lay hono lijsh eraralgn beenatnet fiqrsh beten shelemelgn bemiyats’nanawu qalu meseberen kiso belbe tekele ats’nagnwan miseso mognnet aydelem negere mesqelu ejg matrefiya newu anchin meqebelu

CHORUS
Getayi keset’egn alferam liwesdsh
Getayi keset’egn alferam liwesdsh
Yehezene mersha Maryam enate nesh
Enat aggnchalehu kemesqelu egrge',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5d8a600f-aedb-4baf-80d7-dea9151ef6d9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
የሀዘኔ መርሻ ማርያም እናቴ ነሽ
እናት አግኝቻለሁ ከመስቀሉ እግርጌ

VERSE 1
ስሟን እየጠራሁ ከፍ እንዲል ማዕረጌ
ምርኩዝ ድጋፍ ሆኖኝ ድንግል ሆይ ፀሎትሽ በእፎይታ ሞልቶኛል የሰላምታ ድምፅሽ ፍፁም ላይረሳኝ ገብቶ ከደም ስሬ ይቀሰቅሰኛል ክብርሽ ለዝማሬ በልጅሽ መከራ ቀራንዮ ያለሽ አትዘነጊኝም ዛሬም ከእኔ ጋር ነሽ መታወክ መጨነቅ ከቤቴ እንዲነቀል የበረከቴን ቁልፍ ሰጥቶኛል ከመስቀል ከጣራዪ በታች መነጨ ደስታ ለጠቆረዉ ፊቴ እመቤቴ አብርታ በራስ ቅል ተራራ በነፍስሽ ሰይፍ አልፎ ካሳ ሆነኝ ፍቅርሽ በልቤ ተፅፎ እነኋት እናትህ ሲለኝ በርትቻለሁ በልጅነት ክብር ከፊትሽ ቆሜአለሁ የመስቀል ስጦታ እነኋት እናቴ ማንንም ሳልፈራ ወደስኳት ከቤቴ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ

CHORUS
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
የሀዘኔ መርሻ ማርያም እናቴ ነሽ
እናት አግኝቻለሁ ከመስቀሉ እግርጌ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5d8a600f-aedb-4baf-80d7-dea9151ef6d9'::uuid, 'getaye-kesetegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tatmeshal-besew-lbona-zemarit-nardos-kasahun ("Tatmeshal Besew lbona Zemarit Nardos Kasahun")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c26c3e24-8b33-43b0-8e4e-4167ae241ce1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 1
የተፅናናንብሽ የድሆች ማረፊያ
ነፋስ ውቅያኖሱን ወጀቡን መቅዘፊያ
ወርሰናል ስምሽን ከወርቁ መዝገብ ላይ
ወለድሽልን ድንግል የሕይወትን ፀሐይ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 2
ፅዮን ብለናል ነሽ መማፀኛችን
ሞትን አናይም ካለሽ እናታችን /2/
ቀስተ ደመናዬ ሁነሽ ምልክቴ
አለሁ እስከዛሬ ባንቺው በእመቤቴ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 3
ልጅሽን አምኜ ምን ይጎልብኛል
ያስጨነቀኝ ሁሉ ይታዘዝልኛል
ተከቧል ተራራው በብሩህ ደመና
የአብ ልጅ ክርስቶስ ባንቺ ወርዷልና

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 4
ይባቤ ምስጋና አፋችንን ይሙላ
መቅደስ አላየሁም ድንግል ካንቺ ሌላ
የከሳሼን ጉልበት ፅናቱን ሰብረሻል
የአዳም ልጅ ከሲኦል ከሞት ወጥቶብሻል

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 5
ጣፈጣት ለነፍሴ የማህጸንሽ ፍሬ
ስጠራሽ እኖራለሁ በያሬድ ዝማሬ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 1
Yetets’nananbsh yedhoch marefiya
Nefas wiqyanosun wejebun meqzefiya
Wersenal simshn kewerqu mezgeb lay
Weledshln Dingil yehywetn ts’ehey

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 2
Ts’yon bilenal nesh memats’egnachn
Motn anaym kalesh enatachn (2)
Qeste demenaye hunesh milkte
Alehu eskezare banchiw beemebete

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 3
Lijshn amgne min yigolbgnal
Yasch’eneqegn hulu yitazezlgnal
Tekebwal teraraw bebruh demena
Yeab lij Kristos banchi werdwalna

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 4
Yibabe misgana afachnn yimula
Meqdes alayehum Dingil kanchi lela
Yekesashen gulbet ts’natun sebreshal
Yeadam lij kesiol kemot wet’tobshal

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 5
T’afet’at lenefse yemahts’ensh fire
Sit’erash enoralehu beyared zimare

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 1
የተፅናናንብሽ የድሆች ማረፊያ
ነፋስ ውቅያኖሱን ወጀቡን መቅዘፊያ
ወርሰናል ስምሽን ከወርቁ መዝገብ ላይ
ወለድሽልን ድንግል የሕይወትን ፀሐይ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 2
ፅዮን ብለናል ነሽ መማፀኛችን
ሞትን አናይም ካለሽ እናታችን /2/
ቀስተ ደመናዬ ሁነሽ ምልክቴ
አለሁ እስከዛሬ ባንቺው በእመቤቴ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 3
ልጅሽን አምኜ ምን ይጎልብኛል
ያስጨነቀኝ ሁሉ ይታዘዝልኛል
ተከቧል ተራራው በብሩህ ደመና
የአብ ልጅ ክርስቶስ ባንቺ ወርዷልና

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 4
ይባቤ ምስጋና አፋችንን ይሙላ
መቅደስ አላየሁም ድንግል ካንቺ ሌላ
የከሳሼን ጉልበት ፅናቱን ሰብረሻል
የአዳም ልጅ ከሲኦል ከሞት ወጥቶብሻል

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 5
ጣፈጣት ለነፍሴ የማህጸንሽ ፍሬ
ስጠራሽ እኖራለሁ በያሬድ ዝማሬ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ',
        lyrics_transliteration = 'CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 1
Yetets’nananbsh yedhoch marefiya
Nefas wiqyanosun wejebun meqzefiya
Wersenal simshn kewerqu mezgeb lay
Weledshln Dingil yehywetn ts’ehey

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 2
Ts’yon bilenal nesh memats’egnachn
Motn anaym kalesh enatachn (2)
Qeste demenaye hunesh milkte
Alehu eskezare banchiw beemebete

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 3
Lijshn amgne min yigolbgnal
Yasch’eneqegn hulu yitazezlgnal
Tekebwal teraraw bebruh demena
Yeab lij Kristos banchi werdwalna

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 4
Yibabe misgana afachnn yimula
Meqdes alayehum Dingil kanchi lela
Yekesashen gulbet ts’natun sebreshal
Yeadam lij kesiol kemot wet’tobshal

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 5
T’afet’at lenefse yemahts’ensh fire
Sit’erash enoralehu beyared zimare

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c26c3e24-8b33-43b0-8e4e-4167ae241ce1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 1
የተፅናናንብሽ የድሆች ማረፊያ
ነፋስ ውቅያኖሱን ወጀቡን መቅዘፊያ
ወርሰናል ስምሽን ከወርቁ መዝገብ ላይ
ወለድሽልን ድንግል የሕይወትን ፀሐይ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 2
ፅዮን ብለናል ነሽ መማፀኛችን
ሞትን አናይም ካለሽ እናታችን /2/
ቀስተ ደመናዬ ሁነሽ ምልክቴ
አለሁ እስከዛሬ ባንቺው በእመቤቴ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 3
ልጅሽን አምኜ ምን ይጎልብኛል
ያስጨነቀኝ ሁሉ ይታዘዝልኛል
ተከቧል ተራራው በብሩህ ደመና
የአብ ልጅ ክርስቶስ ባንቺ ወርዷልና

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 4
ይባቤ ምስጋና አፋችንን ይሙላ
መቅደስ አላየሁም ድንግል ካንቺ ሌላ
የከሳሼን ጉልበት ፅናቱን ሰብረሻል
የአዳም ልጅ ከሲኦል ከሞት ወጥቶብሻል

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 5
ጣፈጣት ለነፍሴ የማህጸንሽ ፍሬ
ስጠራሽ እኖራለሁ በያሬድ ዝማሬ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c26c3e24-8b33-43b0-8e4e-4167ae241ce1'::uuid, 'tatmeshal-besew-lbona-zemarit-nardos-kasahun', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hager-kidisit-itiyopiya ("Hager Kidisit Itiyopiya")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '31703491-c028-484f-bf96-1fc30a54e05b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ

VERSE 1
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ

CHORUS
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hager Kidist ityop’ya
Egziabher zearya (2) eኸ
Kidist hager ityop’ya
Egziabher yemeret’at (2) eኸ

VERSE 1
Hager Kidist ityop’ya
Egziabher zearya (2) eኸ
Kidist hager ityop’ya
Egziabher yemeret’at (2) eኸ

CHORUS
Hager Kidist ityop’ya
Egziabher zearya (2) eኸ
Kidist hager ityop’ya
Egziabher yemeret’at (2) eኸ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ

VERSE 1
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ

CHORUS
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ',
        lyrics_transliteration = 'CHORUS
Hager Kidist ityop’ya
Egziabher zearya (2) eኸ
Kidist hager ityop’ya
Egziabher yemeret’at (2) eኸ

VERSE 1
Hager Kidist ityop’ya
Egziabher zearya (2) eኸ
Kidist hager ityop’ya
Egziabher yemeret’at (2) eኸ

CHORUS
Hager Kidist ityop’ya
Egziabher zearya (2) eኸ
Kidist hager ityop’ya
Egziabher yemeret’at (2) eኸ',
        updated_at = clock_timestamp()::text
    WHERE import_id = '31703491-c028-484f-bf96-1fc30a54e05b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ

VERSE 1
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ

CHORUS
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '31703491-c028-484f-bf96-1fc30a54e05b'::uuid, 'hager-kidisit-itiyopiya', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yelben-hulu-yewusten-hulu ("yelben hulu yewusten hulu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1587a929-0e59-417e-b3a2-676c75eb0a88'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 1
መቀመጤን መነሳቴን
መች ታያለህ አንተ ፊቴን
የልቤ ነህ የውስጥ አይኔ
ምከተልህ በዘመኔ

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 2
ምድረ በዳው ደስ ይለዋል
እግዚአብሔር ይሰራዋል
ባዶ ብሆን ባንተ ፊት
ሰጥኸኛል ሰገነት

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 3
በእግዚአብሔር ልቤ ጸና.
ደግ አድራጊ ቸር ነውና
አንስቶኛል ካፈር ትቢያ
ልበልለት ሃሌ ሉ

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 4
Estfanos mesganwe

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 1
Meqemet’en menesaten
Mech tayaleh ante fiten
Yelbe neh yewst’ ayne
Miketelh bezemene

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 2
Midre bedaw des yilewal
Egziabher yiserawal
Bado bihon bante fit
Set’ኸgnal segenet

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 3
BeEgziabher libe ts’ena.
Deg adragi cher newna
Anstognal kafer tibiya
Libellet hale lu

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 4
Estfanos mesganwe

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 1
መቀመጤን መነሳቴን
መች ታያለህ አንተ ፊቴን
የልቤ ነህ የውስጥ አይኔ
ምከተልህ በዘመኔ

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 2
ምድረ በዳው ደስ ይለዋል
እግዚአብሔር ይሰራዋል
ባዶ ብሆን ባንተ ፊት
ሰጥኸኛል ሰገነት

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 3
በእግዚአብሔር ልቤ ጸና.
ደግ አድራጊ ቸር ነውና
አንስቶኛል ካፈር ትቢያ
ልበልለት ሃሌ ሉ

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 4
Estfanos mesganwe

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ',
        lyrics_transliteration = 'CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 1
Meqemet’en menesaten
Mech tayaleh ante fiten
Yelbe neh yewst’ ayne
Miketelh bezemene

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 2
Midre bedaw des yilewal
Egziabher yiserawal
Bado bihon bante fit
Set’ኸgnal segenet

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 3
BeEgziabher libe ts’ena.
Deg adragi cher newna
Anstognal kafer tibiya
Libellet hale lu

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 4
Estfanos mesganwe

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1587a929-0e59-417e-b3a2-676c75eb0a88'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 1
መቀመጤን መነሳቴን
መች ታያለህ አንተ ፊቴን
የልቤ ነህ የውስጥ አይኔ
ምከተልህ በዘመኔ

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 2
ምድረ በዳው ደስ ይለዋል
እግዚአብሔር ይሰራዋል
ባዶ ብሆን ባንተ ፊት
ሰጥኸኛል ሰገነት

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 3
በእግዚአብሔር ልቤ ጸና.
ደግ አድራጊ ቸር ነውና
አንስቶኛል ካፈር ትቢያ
ልበልለት ሃሌ ሉ

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 4
Estfanos mesganwe

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1587a929-0e59-417e-b3a2-676c75eb0a88'::uuid, 'yelben-hulu-yewusten-hulu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yehwanesen-yiza ("Yehwanesen Yiza")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '19d78781-2f45-4539-8b5a-2742e7ba98a9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 1
ያስገርም ነበረ የፈሰሰ እንባዋ(፪)
ዮሐንስ ቢደንቀው የሐዘኗ ፅናት
አነሳት ደግፎ በብርቱ ሊያፅናናት
ድንግልም አለችው ልጄ አሳዘነኝ

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 2
እህት ወንድም የለው ላልቅስለት ተወኝ (፪)
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
መግደላዊት ማርያም ሰሎሜ ዮሐና

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 3
ማርያምን አይዋት ፀንቶባት ሃዘኗ
በለቅሶዋ ጣዕም ተነክቶ ልባቸው
እንባን አፈሰሱ ውለታው ገብቷቸው
ከሁሉም ይበልጣል ያስደፋል አንገትን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 4
የማርያም ሐዘን
ራሔል አልቅሳለች ላላቀፈቻቸው
ድንግል ግን ብታለቅስ አዝላው ተሰዳ ነው
ያቆብም አልቅሷል በሌላ የሰው ደም

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 5
ማርያም ግን ብታለቅስ ፈሷል የልጇ ደም
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
ጠብቶ ስላደገ የድንግልና ጡቷን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 6
መቆም አልቻለችም ስታይ መጠማቱን
በደም ተሽፍኖ ብታየው ውበቱን
ለይልኝ አለችው ከስጋዋ ነብሷን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 1
Yasgerm nebere yefesese enbawa (2)
Yohens bidenqew yehezenwa ts’nat
Anesat degfo bebrtu liyats’nanat
Dinglm alechw lije asazenegn

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 2
Eht wendm yelew lalqslet tewegn (2)
Kehulum yibelt’al yasdefal angetn
YeMaryam hezen
Megdelawit Maryam selome yohena

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 3
Maryamn aywat ts’entobat hazenwa
Beleqsowa t’aem tenekto libachew
Enban afesesu wiletaw gebtwachew
Kehulum yibelt’al yasdefal angetn

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 4
YeMaryam hezen
Rahel alqsalech lalaqefechachew
Dingil gin bitaleqs azlaw teseda new
Yaqobm alqswal belela yesew dem

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 5
Maryam gin bitaleqs feswal yeljwa dem
Kehulum yibelt’al yasdefal angetn
YeMaryam hezen
T’ebto siladege yednglna t’utwan

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 6
Meqom alchalechm sitay met’ematun
Bedem teshfno bitayew wibetun
Leylgn alechw kesgawa nebswan

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 1
ያስገርም ነበረ የፈሰሰ እንባዋ(፪)
ዮሐንስ ቢደንቀው የሐዘኗ ፅናት
አነሳት ደግፎ በብርቱ ሊያፅናናት
ድንግልም አለችው ልጄ አሳዘነኝ

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 2
እህት ወንድም የለው ላልቅስለት ተወኝ (፪)
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
መግደላዊት ማርያም ሰሎሜ ዮሐና

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 3
ማርያምን አይዋት ፀንቶባት ሃዘኗ
በለቅሶዋ ጣዕም ተነክቶ ልባቸው
እንባን አፈሰሱ ውለታው ገብቷቸው
ከሁሉም ይበልጣል ያስደፋል አንገትን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 4
የማርያም ሐዘን
ራሔል አልቅሳለች ላላቀፈቻቸው
ድንግል ግን ብታለቅስ አዝላው ተሰዳ ነው
ያቆብም አልቅሷል በሌላ የሰው ደም

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 5
ማርያም ግን ብታለቅስ ፈሷል የልጇ ደም
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
ጠብቶ ስላደገ የድንግልና ጡቷን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 6
መቆም አልቻለችም ስታይ መጠማቱን
በደም ተሽፍኖ ብታየው ውበቱን
ለይልኝ አለችው ከስጋዋ ነብሷን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ',
        lyrics_transliteration = 'CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 1
Yasgerm nebere yefesese enbawa (2)
Yohens bidenqew yehezenwa ts’nat
Anesat degfo bebrtu liyats’nanat
Dinglm alechw lije asazenegn

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 2
Eht wendm yelew lalqslet tewegn (2)
Kehulum yibelt’al yasdefal angetn
YeMaryam hezen
Megdelawit Maryam selome yohena

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 3
Maryamn aywat ts’entobat hazenwa
Beleqsowa t’aem tenekto libachew
Enban afesesu wiletaw gebtwachew
Kehulum yibelt’al yasdefal angetn

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 4
YeMaryam hezen
Rahel alqsalech lalaqefechachew
Dingil gin bitaleqs azlaw teseda new
Yaqobm alqswal belela yesew dem

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 5
Maryam gin bitaleqs feswal yeljwa dem
Kehulum yibelt’al yasdefal angetn
YeMaryam hezen
T’ebto siladege yednglna t’utwan

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 6
Meqom alchalechm sitay met’ematun
Bedem teshfno bitayew wibetun
Leylgn alechw kesgawa nebswan

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa',
        updated_at = clock_timestamp()::text
    WHERE import_id = '19d78781-2f45-4539-8b5a-2742e7ba98a9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 1
ያስገርም ነበረ የፈሰሰ እንባዋ(፪)
ዮሐንስ ቢደንቀው የሐዘኗ ፅናት
አነሳት ደግፎ በብርቱ ሊያፅናናት
ድንግልም አለችው ልጄ አሳዘነኝ

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 2
እህት ወንድም የለው ላልቅስለት ተወኝ (፪)
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
መግደላዊት ማርያም ሰሎሜ ዮሐና

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 3
ማርያምን አይዋት ፀንቶባት ሃዘኗ
በለቅሶዋ ጣዕም ተነክቶ ልባቸው
እንባን አፈሰሱ ውለታው ገብቷቸው
ከሁሉም ይበልጣል ያስደፋል አንገትን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 4
የማርያም ሐዘን
ራሔል አልቅሳለች ላላቀፈቻቸው
ድንግል ግን ብታለቅስ አዝላው ተሰዳ ነው
ያቆብም አልቅሷል በሌላ የሰው ደም

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 5
ማርያም ግን ብታለቅስ ፈሷል የልጇ ደም
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
ጠብቶ ስላደገ የድንግልና ጡቷን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 6
መቆም አልቻለችም ስታይ መጠማቱን
በደም ተሽፍኖ ብታየው ውበቱን
ለይልኝ አለችው ከስጋዋ ነብሷን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '19d78781-2f45-4539-8b5a-2742e7ba98a9'::uuid, 'yehwanesen-yiza', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian ("Ethiopian")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '836ec874-10c6-4e8f-acae-f7e40b5c1bf3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 1
ሙሽራ ልቀበል ተነስቼ ሌሊት
ራሴን አገኘሁት ካጎደሉት ዘይት
አምስቱ ጎበዞች ሰነፎቹም አምስት
ምግባር ነው ዘይቱ ሃይማኖቱ መብራት

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 2
ሙሽራው ዘገየ እንቅልፍ እንቅልፍ አለኝ
በሕይወቴም ባከንኩ ወደኋላ አልኩኝ
ዜናውም ተሰማ የሙሽራው መምጣት
በሉ ቶሎ ውጡ እንድትቀበሉት

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 3
ተነሳው በሌሊት ሙሽራ ልቀበል
መብራት ብቻ ይዤ ዘይት አልቆብኛል
መለመን ጀመርኩኝ ዘይት ከልባሞች
ውሰት የለም በነፍስ አንሁን ደካሞች

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 4
ጌታዬን አየሁት ከመላዕክት ሕብረት
ልባሞቹም ገቡ መንግስተ ሰማያት
በሮቹ ተዘጉ ሰነፎቹም ከደጅ
ቀኑን ስለማላውቅ እንግዲህ ልዘጋጅ

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 1
Mushra liqebel tenesche lelit
Rasen agegnehut kagodelut zeyt
Amstu gobezoch senefochum amst
Migbar new zeytu haymanotu mebrat

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 2
Mushraw zegeye enqlf enqlf alegn
Behywetem bakenku wedehwala alkugn
Zenawm tesema yemushraw memt’at
Belu tolo wit’u endtqebelut

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 3
Tenesaw belelit mushra liqebel
Mebrat bicha yizhe zeyt alqobgnal
Melemen jemerkugn zeyt kelbamoch
Wiset yelem benefs anhun dekamoch

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 4
Getayen ayehut kemelaekt hibret
Libamochum gebu mengste semayat
Berochu tezegu senefochum kedej
Qenun silemalawq engdih lizegaj

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 1
ሙሽራ ልቀበል ተነስቼ ሌሊት
ራሴን አገኘሁት ካጎደሉት ዘይት
አምስቱ ጎበዞች ሰነፎቹም አምስት
ምግባር ነው ዘይቱ ሃይማኖቱ መብራት

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 2
ሙሽራው ዘገየ እንቅልፍ እንቅልፍ አለኝ
በሕይወቴም ባከንኩ ወደኋላ አልኩኝ
ዜናውም ተሰማ የሙሽራው መምጣት
በሉ ቶሎ ውጡ እንድትቀበሉት

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 3
ተነሳው በሌሊት ሙሽራ ልቀበል
መብራት ብቻ ይዤ ዘይት አልቆብኛል
መለመን ጀመርኩኝ ዘይት ከልባሞች
ውሰት የለም በነፍስ አንሁን ደካሞች

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 4
ጌታዬን አየሁት ከመላዕክት ሕብረት
ልባሞቹም ገቡ መንግስተ ሰማያት
በሮቹ ተዘጉ ሰነፎቹም ከደጅ
ቀኑን ስለማላውቅ እንግዲህ ልዘጋጅ

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ',
        lyrics_transliteration = 'CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 1
Mushra liqebel tenesche lelit
Rasen agegnehut kagodelut zeyt
Amstu gobezoch senefochum amst
Migbar new zeytu haymanotu mebrat

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 2
Mushraw zegeye enqlf enqlf alegn
Behywetem bakenku wedehwala alkugn
Zenawm tesema yemushraw memt’at
Belu tolo wit’u endtqebelut

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 3
Tenesaw belelit mushra liqebel
Mebrat bicha yizhe zeyt alqobgnal
Melemen jemerkugn zeyt kelbamoch
Wiset yelem benefs anhun dekamoch

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 4
Getayen ayehut kemelaekt hibret
Libamochum gebu mengste semayat
Berochu tezegu senefochum kedej
Qenun silemalawq engdih lizegaj

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera',
        updated_at = clock_timestamp()::text
    WHERE import_id = '836ec874-10c6-4e8f-acae-f7e40b5c1bf3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 1
ሙሽራ ልቀበል ተነስቼ ሌሊት
ራሴን አገኘሁት ካጎደሉት ዘይት
አምስቱ ጎበዞች ሰነፎቹም አምስት
ምግባር ነው ዘይቱ ሃይማኖቱ መብራት

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 2
ሙሽራው ዘገየ እንቅልፍ እንቅልፍ አለኝ
በሕይወቴም ባከንኩ ወደኋላ አልኩኝ
ዜናውም ተሰማ የሙሽራው መምጣት
በሉ ቶሎ ውጡ እንድትቀበሉት

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 3
ተነሳው በሌሊት ሙሽራ ልቀበል
መብራት ብቻ ይዤ ዘይት አልቆብኛል
መለመን ጀመርኩኝ ዘይት ከልባሞች
ውሰት የለም በነፍስ አንሁን ደካሞች

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 4
ጌታዬን አየሁት ከመላዕክት ሕብረት
ልባሞቹም ገቡ መንግስተ ሰማያት
በሮቹ ተዘጉ ሰነፎቹም ከደጅ
ቀኑን ስለማላውቅ እንግዲህ ልዘጋጅ

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '836ec874-10c6-4e8f-acae-f7e40b5c1bf3'::uuid, 'ethiopian', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yetibeb-sewoch-metu ("Yetibeb Sewoch Metu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9d52d0b2-2da0-4f5d-96ac-bc1957c575de'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 1
አዝ
የጥበብ ሰዎች መጡ/፪/ ሰምተውት በዜና /፪
እያበራላቸው ኮከብ እንደፋና /፪
አዝ

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 2
ድንግል እመቤቴ ሰላምታ ይድረስሽ
ለአምላክ ወገኖች መመኪያቸው የሆንሽ
ከአንቺ ተወለደ የዓለም መድኅን
ኩነኔን አጥፍቶ ጽድቅን ሊያወርሰን

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 3
አዝ
ጌታችን ሲወለድ በቤተልሔም
ሐዘን ተደምስሶ ሰፈነ ሰላም
እንጨቶች አፈሩ ፍሬ በረከት

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 4
ወንዞች ሁሉ ሆኑ ማርና ወተት
አዝ
ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ
የእስራኤል ንጉሥ ወደ የት አለ እያሉ

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 5
እጅ መንሻውን ሰጡት እንደየሥርዓቱ
እጣኑን ለክህነት ወርቁን ለመንግሥቱ
አሜን ዝማሬ መላእክትን ያሰማልን

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 1
CHORUS
Yet’beb sewoch met’u (2) semtewt bezena /2
Eyaberalachew kokeb endefana /2
CHORUS

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 2
Dingil Emebete selamta yidressh
Leamlak wegenoch memekiyachew yehonsh
Keanchi tewelede yealem medhn
Kunenen at’fto ts’dqn liyawersen

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 3
CHORUS
Getachen siweled bebetelhem
Hezen tedemsso sefene selam
Ench’etoch aferu fire bereket

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 4
Wenzoch hulu honu marna wetet
CHORUS
Seba segel met’u lisegdu bemulu
Yeesrael nigus wede yet ale eyalu

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 5
Ej menshawn set’ut endeyesratu
Et’anun lekhnet werqun lemengstu
Amen zimare melaektn yasemaln

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 1
አዝ
የጥበብ ሰዎች መጡ/፪/ ሰምተውት በዜና /፪
እያበራላቸው ኮከብ እንደፋና /፪
አዝ

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 2
ድንግል እመቤቴ ሰላምታ ይድረስሽ
ለአምላክ ወገኖች መመኪያቸው የሆንሽ
ከአንቺ ተወለደ የዓለም መድኅን
ኩነኔን አጥፍቶ ጽድቅን ሊያወርሰን

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 3
አዝ
ጌታችን ሲወለድ በቤተልሔም
ሐዘን ተደምስሶ ሰፈነ ሰላም
እንጨቶች አፈሩ ፍሬ በረከት

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 4
ወንዞች ሁሉ ሆኑ ማርና ወተት
አዝ
ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ
የእስራኤል ንጉሥ ወደ የት አለ እያሉ

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 5
እጅ መንሻውን ሰጡት እንደየሥርዓቱ
እጣኑን ለክህነት ወርቁን ለመንግሥቱ
አሜን ዝማሬ መላእክትን ያሰማልን

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ',
        lyrics_transliteration = 'CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 1
CHORUS
Yet’beb sewoch met’u (2) semtewt bezena /2
Eyaberalachew kokeb endefana /2
CHORUS

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 2
Dingil Emebete selamta yidressh
Leamlak wegenoch memekiyachew yehonsh
Keanchi tewelede yealem medhn
Kunenen at’fto ts’dqn liyawersen

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 3
CHORUS
Getachen siweled bebetelhem
Hezen tedemsso sefene selam
Ench’etoch aferu fire bereket

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 4
Wenzoch hulu honu marna wetet
CHORUS
Seba segel met’u lisegdu bemulu
Yeesrael nigus wede yet ale eyalu

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 5
Ej menshawn set’ut endeyesratu
Et’anun lekhnet werqun lemengstu
Amen zimare melaektn yasemaln

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9d52d0b2-2da0-4f5d-96ac-bc1957c575de'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ
አዝ 🌻🌻🌻🌻
የጥበብ ሰዎች መጡ/፪/ ሰምተውት በዜና /፪
እያበራላቸው ኮከብ እንደፋና /፪
አዝ 🌻🌻🌻🌻
ድንግል እመቤቴ ሰላምታ ይድረስሽ
ለአምላክ ወገኖች መመኪያቸው የሆንሽ
ከአንቺ ተወለደ የዓለም መድኅን
ኩነኔን አጥፍቶ ጽድቅን ሊያወርሰን
አዝ 🌻🌻🌻🌻
ጌታችን ሲወለድ በቤተልሔም
ሐዘን ተደምስሶ ሰፈነ ሰላም
እንጨቶች አፈሩ ፍሬ በረከት
ወንዞች ሁሉ ሆኑ ማርና ወተት
አዝ 🌻🌻🌻🌻
ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ
የእስራኤል ንጉሥ ወደ የት አለ እያሉ
እጅ መንሻውን ሰጡት እንደየሥርዓቱ
እጣኑን ለክህነት ወርቁን ለመንግሥቱ
አሜን ዝማሬ መላእክትን ያሰማልን

VERSE 1
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ
አዝ 🌻🌻🌻🌻
የጥበብ ሰዎች መጡ/፪/ ሰምተውት በዜና /፪
እያበራላቸው ኮከብ እንደፋና /፪
አዝ 🌻🌻🌻🌻
ድንግል እመቤቴ ሰላምታ ይድረስሽ
ለአምላክ ወገኖች መመኪያቸው የሆንሽ
ከአንቺ ተወለደ የዓለም መድኅን
ኩነኔን አጥፍቶ ጽድቅን ሊያወርሰን
አዝ 🌻🌻🌻🌻
ጌታችን ሲወለድ በቤተልሔም
ሐዘን ተደምስሶ ሰፈነ ሰላም
እንጨቶች አፈሩ ፍሬ በረከት
ወንዞች ሁሉ ሆኑ ማርና ወተት
አዝ 🌻🌻🌻🌻
ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ
የእስራኤል ንጉሥ ወደ የት አለ እያሉ
እጅ መንሻውን ሰጡት እንደየሥርዓቱ
እጣኑን ለክህነት ወርቁን ለመንግሥቱ
አሜን ዝማሬ መላእክትን ያሰማልን

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ
አዝ 🌻🌻🌻🌻
የጥበብ ሰዎች መጡ/፪/ ሰምተውት በዜና /፪
እያበራላቸው ኮከብ እንደፋና /፪
አዝ 🌻🌻🌻🌻
ድንግል እመቤቴ ሰላምታ ይድረስሽ
ለአምላክ ወገኖች መመኪያቸው የሆንሽ
ከአንቺ ተወለደ የዓለም መድኅን
ኩነኔን አጥፍቶ ጽድቅን ሊያወርሰን
አዝ 🌻🌻🌻🌻
ጌታችን ሲወለድ በቤተልሔም
ሐዘን ተደምስሶ ሰፈነ ሰላም
እንጨቶች አፈሩ ፍሬ በረከት
ወንዞች ሁሉ ሆኑ ማርና ወተት
አዝ 🌻🌻🌻🌻
ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ
የእስራኤል ንጉሥ ወደ የት አለ እያሉ
እጅ መንሻውን ሰጡት እንደየሥርዓቱ
እጣኑን ለክህነት ወርቁን ለመንግሥቱ
አሜን ዝማሬ መላእክትን ያሰማልን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9d52d0b2-2da0-4f5d-96ac-bc1957c575de'::uuid, 'yetibeb-sewoch-metu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enat-alegn-kidane-mihiret ("Enat Alegn Kidane Mihiret")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '10f526d3-8288-49ad-ad3c-e96ceb18616f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 1
እራቆቴን ብቆምም አፍሬ
ለብሴን ይዘሽ ወደኔ መተሻል
ደጓ እናቴ ቤተን አድምቀሻል
ኪዳነ ምህረት ኪዳነ ምህረት(3)

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 2
አምባ መጠግያ ናት
ለዘላለም ንጽይት በመሆኗ
ከኔ ጋር ነዉ ህያዉ ቃልኪዳኗ
ደስተኛ ነኝ ሀዘኔን አልፌ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 3
አጽናኝ ሆናኝ የመስቀል ስር ተርፌ
ከጥፋቱ ዉሃ ማረፊያዬ
መርከቤ ነሽ ከሞት ማምለጫዬ
የአምላከ እናት ምልጃሽ ሆኖኝ ክብሬ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 4
በህይወት አለዉ ጥልቁን ተሻግሬ
በእናትነት ህይወቴን ጎብኝታዉ
ልቤ አረፌ ተነቅሎ በሽታ
ሰንሰሌቴ ከእጄ ተቆረጠ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 5
መራራዬ በልጅሽ ጣፈጠ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 1
Eraqoten biqomm afre
Lebsen yizesh wedene meteshal
Degwa enate beten admqeshal
Kidane mihret kidane mihret (3)

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 2
Amba met’egya nat
Lezelalem nits’yt bemehonwa
Kene gar newu hiyawu qalkidanwa
Destegna negn hezenen alfe

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 3
Ats’nagn honagn yemesqel sir terfe
Ket’fatu wuha marefiyaye
Merkebe nesh kemot mamlech’aye
Yeamlake enat miljash honogn kibre

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 4
Behywet alewu t’lqun teshagre
Beenatnet hiyweten gobgntawu
Libe arefe teneqlo beshta
Senselete keeje teqoret’e

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 5
Meraraye beljsh t’afet’e

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 1
እራቆቴን ብቆምም አፍሬ
ለብሴን ይዘሽ ወደኔ መተሻል
ደጓ እናቴ ቤተን አድምቀሻል
ኪዳነ ምህረት ኪዳነ ምህረት(3)

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 2
አምባ መጠግያ ናት
ለዘላለም ንጽይት በመሆኗ
ከኔ ጋር ነዉ ህያዉ ቃልኪዳኗ
ደስተኛ ነኝ ሀዘኔን አልፌ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 3
አጽናኝ ሆናኝ የመስቀል ስር ተርፌ
ከጥፋቱ ዉሃ ማረፊያዬ
መርከቤ ነሽ ከሞት ማምለጫዬ
የአምላከ እናት ምልጃሽ ሆኖኝ ክብሬ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 4
በህይወት አለዉ ጥልቁን ተሻግሬ
በእናትነት ህይወቴን ጎብኝታዉ
ልቤ አረፌ ተነቅሎ በሽታ
ሰንሰሌቴ ከእጄ ተቆረጠ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 5
መራራዬ በልጅሽ ጣፈጠ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ',
        lyrics_transliteration = 'CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 1
Eraqoten biqomm afre
Lebsen yizesh wedene meteshal
Degwa enate beten admqeshal
Kidane mihret kidane mihret (3)

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 2
Amba met’egya nat
Lezelalem nits’yt bemehonwa
Kene gar newu hiyawu qalkidanwa
Destegna negn hezenen alfe

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 3
Ats’nagn honagn yemesqel sir terfe
Ket’fatu wuha marefiyaye
Merkebe nesh kemot mamlech’aye
Yeamlake enat miljash honogn kibre

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 4
Behywet alewu t’lqun teshagre
Beenatnet hiyweten gobgntawu
Libe arefe teneqlo beshta
Senselete keeje teqoret’e

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 5
Meraraye beljsh t’afet’e

CHORUS
Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire',
        updated_at = clock_timestamp()::text
    WHERE import_id = '10f526d3-8288-49ad-ad3c-e96ceb18616f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 1
እራቆቴን ብቆምም አፍሬ
ለብሴን ይዘሽ ወደኔ መተሻል
ደጓ እናቴ ቤተን አድምቀሻል
ኪዳነ ምህረት ኪዳነ ምህረት(3)

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 2
አምባ መጠግያ ናት
ለዘላለም ንጽይት በመሆኗ
ከኔ ጋር ነዉ ህያዉ ቃልኪዳኗ
ደስተኛ ነኝ ሀዘኔን አልፌ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 3
አጽናኝ ሆናኝ የመስቀል ስር ተርፌ
ከጥፋቱ ዉሃ ማረፊያዬ
መርከቤ ነሽ ከሞት ማምለጫዬ
የአምላከ እናት ምልጃሽ ሆኖኝ ክብሬ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 4
በህይወት አለዉ ጥልቁን ተሻግሬ
በእናትነት ህይወቴን ጎብኝታዉ
ልቤ አረፌ ተነቅሎ በሽታ
ሰንሰሌቴ ከእጄ ተቆረጠ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 5
መራራዬ በልጅሽ ጣፈጠ

CHORUS
እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '10f526d3-8288-49ad-ad3c-e96ceb18616f'::uuid, 'enat-alegn-kidane-mihiret', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bete-krestianen-anetewem-keto ("Bete krestianen anetewem Keto")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '165b8de5-f346-4210-98e2-d247a187dc23'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ ለሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት/፪/

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
Hulunm behulu lemimolaw Geta
Mushraw yehone betu tesegnta
Bekbr bemoges bets’ega temolta
Demqa tinoralech lealem abrta (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 2
Diyablos bich’ers qestochun bemulu
Wet’med bizerega beguzoachn hulu
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 3
Besmu mesebseb besmu mesrat
Sile simu menor lesmu memot
T’elat diyablosn min bayasdest
Yih new kirstna yiኼ new hiywet (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 4
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Haymanotachn new yeegna rist gult (2)

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
ሁሉንም በሁሉ ለሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት/፪/

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
Hulunm behulu lemimolaw Geta
Mushraw yehone betu tesegnta
Bekbr bemoges bets’ega temolta
Demqa tinoralech lealem abrta (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 2
Diyablos bich’ers qestochun bemulu
Wet’med bizerega beguzoachn hulu
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 3
Besmu mesebseb besmu mesrat
Sile simu menor lesmu memot
T’elat diyablosn min bayasdest
Yih new kirstna yiኼ new hiywet (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 4
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Haymanotachn new yeegna rist gult (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto',
        updated_at = clock_timestamp()::text
    WHERE import_id = '165b8de5-f346-4210-98e2-d247a187dc23'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ ለሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '165b8de5-f346-4210-98e2-d247a187dc23'::uuid, 'bete-krestianen-anetewem-keto', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- senbetna-eka-eyesus-eritrean-orthodox-tewahdo-mezmur-zemarit-hermela-yhs ("Senbetna eka Eyesus /eritrean Orthodox Tewahdo Mezmur / zemarit Hermela yhsho")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '317c723a-341e-45aa-b270-1dd76c2a1705'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 1
ትዕግስትኻ''ስ ዘገርምዩ ብፍቅሪ ልቢ ዝስዕር
ዕድለኛታት ኢና ንሕና ናትካ ሙኻናስ ንሕበን
ቃላት ንስእነሉ ንለውሃትካ
ነጊርና ኣይንጸግቦን ንምሕረትካ

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 2
ንሱ እንድዩ ምስጢር ህላውነትና
ኩሉ ግዜ ተስፋ ዝኾነና
ኣዝ. . .
ቅዱስ ደምካ ተሓቲምና ካብ ጸጋኻ ተኻፊልና

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 3
ርህራሄኻ በዚሑልና ብፍቅርኻ ኢና ዓሪፍና
ምሕረትካ እንዲዩ ዝረድኣና ክሳብ ኣብዚ ዘብጸሓና
ብጀካኻ መን እሞ ኣሎና ኢየሱስ ዝጥንቀቐልና
ስለዚ ኢና ንሕና ነፍቅረካ

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 4
ክበር እናበልና ነምልኸካ
ፍቅርኻ ኣብ ልብና ነጊሱ
ውሽጥና በኣኻ ተፈዊሱ
ኣዝ. . .

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 5
ዝተረፈ ዘመን ሂወትና ኩሉ ንስኻ ኽትሓልፎ
ኣታ ኩሉ ትኽእል ኢድካ ንነገራትና ንገፎ
ደጊም ንስጋ ከይንነብር ንስኻ ኣባና ክትከብር
ካብ ልብና ወሲና ኢና ከምቲ ትደልዮ ክነብር

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 6
ንዓኻ ኣሚኑ ዝተሰለፈ
የለን ኣብ መንገዲ ዝተረፈ
ንዑ ከዕርፈኩም ስለ ዝበልካ
ከም ቃልካ እንሆ ሲዒብናካ

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 1
Tiegstኻ''s zegermyu bifqri libi ziser
Edlegnatat ina nihna natka muኻnas nihben
Qalat nisenelu nilewhatka
Negirna aynts’egbon nimhretka

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 2
Nisu endyu mist’ir hilawnetna
Kulu gize tesfa ziኾnena
Az. . .
Kidus demka tehatimna kab ts’egaኻ teኻfilna

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 3
Rihraheኻ bezihulna bifqrኻ ina arifna
Mihretka endiyu ziredana kisab abzi zebts’ehana
Bijekaኻ men emo alona Iyesus zit’nqeቐlna
Silezi ina nihna nefqreka

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 4
Kiber enabelna nemlኸka
Fiqrኻ ab libna negisu
Wisht’na beaኻ tefewisu
Az. . .

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 5
Ziterefe zemen hiwetna kulu nisኻ ኽthalfo
Ata kulu tiኽel idka ninegeratna nigefo
Degim nisga keynnebr nisኻ abana kitkebr
Kab libna wesina ina kemti tidelyo kinebr

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 6
Niaኻ aminu ziteselefe
Yelen ab mengedi ziterefe
Niu keerfekum sile zibelka
Kem qalka enho siibnaka

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 1
ትዕግስትኻ''ስ ዘገርምዩ ብፍቅሪ ልቢ ዝስዕር
ዕድለኛታት ኢና ንሕና ናትካ ሙኻናስ ንሕበን
ቃላት ንስእነሉ ንለውሃትካ
ነጊርና ኣይንጸግቦን ንምሕረትካ

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 2
ንሱ እንድዩ ምስጢር ህላውነትና
ኩሉ ግዜ ተስፋ ዝኾነና
ኣዝ. . .
ቅዱስ ደምካ ተሓቲምና ካብ ጸጋኻ ተኻፊልና

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 3
ርህራሄኻ በዚሑልና ብፍቅርኻ ኢና ዓሪፍና
ምሕረትካ እንዲዩ ዝረድኣና ክሳብ ኣብዚ ዘብጸሓና
ብጀካኻ መን እሞ ኣሎና ኢየሱስ ዝጥንቀቐልና
ስለዚ ኢና ንሕና ነፍቅረካ

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 4
ክበር እናበልና ነምልኸካ
ፍቅርኻ ኣብ ልብና ነጊሱ
ውሽጥና በኣኻ ተፈዊሱ
ኣዝ. . .

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 5
ዝተረፈ ዘመን ሂወትና ኩሉ ንስኻ ኽትሓልፎ
ኣታ ኩሉ ትኽእል ኢድካ ንነገራትና ንገፎ
ደጊም ንስጋ ከይንነብር ንስኻ ኣባና ክትከብር
ካብ ልብና ወሲና ኢና ከምቲ ትደልዮ ክነብር

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 6
ንዓኻ ኣሚኑ ዝተሰለፈ
የለን ኣብ መንገዲ ዝተረፈ
ንዑ ከዕርፈኩም ስለ ዝበልካ
ከም ቃልካ እንሆ ሲዒብናካ

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል',
        lyrics_transliteration = 'CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 1
Tiegstኻ''s zegermyu bifqri libi ziser
Edlegnatat ina nihna natka muኻnas nihben
Qalat nisenelu nilewhatka
Negirna aynts’egbon nimhretka

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 2
Nisu endyu mist’ir hilawnetna
Kulu gize tesfa ziኾnena
Az. . .
Kidus demka tehatimna kab ts’egaኻ teኻfilna

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 3
Rihraheኻ bezihulna bifqrኻ ina arifna
Mihretka endiyu ziredana kisab abzi zebts’ehana
Bijekaኻ men emo alona Iyesus zit’nqeቐlna
Silezi ina nihna nefqreka

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 4
Kiber enabelna nemlኸka
Fiqrኻ ab libna negisu
Wisht’na beaኻ tefewisu
Az. . .

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 5
Ziterefe zemen hiwetna kulu nisኻ ኽthalfo
Ata kulu tiኽel idka ninegeratna nigefo
Degim nisga keynnebr nisኻ abana kitkebr
Kab libna wesina ina kemti tidelyo kinebr

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 6
Niaኻ aminu ziteselefe
Yelen ab mengedi ziterefe
Niu keerfekum sile zibelka
Kem qalka enho siibnaka

CHORUS
Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl',
        updated_at = clock_timestamp()::text
    WHERE import_id = '317c723a-341e-45aa-b270-1dd76c2a1705'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 1
ትዕግስትኻ''ስ ዘገርምዩ ብፍቅሪ ልቢ ዝስዕር
ዕድለኛታት ኢና ንሕና ናትካ ሙኻናስ ንሕበን
ቃላት ንስእነሉ ንለውሃትካ
ነጊርና ኣይንጸግቦን ንምሕረትካ

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 2
ንሱ እንድዩ ምስጢር ህላውነትና
ኩሉ ግዜ ተስፋ ዝኾነና
ኣዝ. . .
ቅዱስ ደምካ ተሓቲምና ካብ ጸጋኻ ተኻፊልና

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 3
ርህራሄኻ በዚሑልና ብፍቅርኻ ኢና ዓሪፍና
ምሕረትካ እንዲዩ ዝረድኣና ክሳብ ኣብዚ ዘብጸሓና
ብጀካኻ መን እሞ ኣሎና ኢየሱስ ዝጥንቀቐልና
ስለዚ ኢና ንሕና ነፍቅረካ

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 4
ክበር እናበልና ነምልኸካ
ፍቅርኻ ኣብ ልብና ነጊሱ
ውሽጥና በኣኻ ተፈዊሱ
ኣዝ. . .

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 5
ዝተረፈ ዘመን ሂወትና ኩሉ ንስኻ ኽትሓልፎ
ኣታ ኩሉ ትኽእል ኢድካ ንነገራትና ንገፎ
ደጊም ንስጋ ከይንነብር ንስኻ ኣባና ክትከብር
ካብ ልብና ወሲና ኢና ከምቲ ትደልዮ ክነብር

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 6
ንዓኻ ኣሚኑ ዝተሰለፈ
የለን ኣብ መንገዲ ዝተረፈ
ንዑ ከዕርፈኩም ስለ ዝበልካ
ከም ቃልካ እንሆ ሲዒብናካ

CHORUS
ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '317c723a-341e-45aa-b270-1dd76c2a1705'::uuid, 'senbetna-eka-eyesus-eritrean-orthodox-tewahdo-mezmur-zemarit-hermela-yhs', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
