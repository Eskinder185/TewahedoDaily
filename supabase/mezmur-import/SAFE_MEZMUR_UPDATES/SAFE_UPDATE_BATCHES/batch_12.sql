-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 12 OF 32
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
  -- agetnibet ("Agetnibet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c2629925-af84-407f-a56e-cea359e4c892'::uuid
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
ነጩን ልብስ ለብሰን ታይተናል
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
መስቀሉን ከማህተቡ ጋር

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
Nech’un libs lebsen taytenal
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
Mesqelun kemahtebu gar

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
ነጩን ልብስ ለብሰን ታይተናል
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
መስቀሉን ከማህተቡ ጋር

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
Nech’un libs lebsen taytenal
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
Mesqelun kemahtebu gar

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c2629925-af84-407f-a56e-cea359e4c892'::uuid
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
ነጩን ልብስ ለብሰን ታይተናል
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
መስቀሉን ከማህተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c2629925-af84-407f-a56e-cea359e4c892'::uuid, 'agetnibet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- simishin-teriche-meche-afiralew ("Simishin Teriche Meche Afiralew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3ff615f9-18ee-435b-a396-315ad614140e'::uuid
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
    WHERE import_id = '3ff615f9-18ee-435b-a396-315ad614140e'::uuid
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
        '3ff615f9-18ee-435b-a396-315ad614140e'::uuid, 'simishin-teriche-meche-afiralew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemin-des-lasegnih-getaye-hoy-bemuhaze-sibihat ("Bemin Des Lasegnih Getaye Hoy *** Bemuhaze Sibihat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a663ae77-ce1d-4ff5-8f82-a110ee755a18'::uuid
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
    WHERE import_id = 'a663ae77-ce1d-4ff5-8f82-a110ee755a18'::uuid
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
        'a663ae77-ce1d-4ff5-8f82-a110ee755a18'::uuid, 'bemin-des-lasegnih-getaye-hoy-bemuhaze-sibihat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ye-lejesh-cherenet ("Ye lejesh Cherenet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '25fe3cf8-e591-47a7-a2b7-c30da8fda559'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 1
ባርኪኝ የአምላክ እናት ይራቅ ጉስቁልናዬ
አፌን በእሳት ሙይው እንዲታባስ እንባዬ
እኔ ወዳንቺ ልጠጋ ልማልል ከፊትሽ/2/
አንገትን አያስቀልስም እናቴ ልመናሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 2
ሰርጉን እንዳልገባ ልብሴን አሳድፌያለሁ
በምልጃሽ በማመን ላንቺ አሳስባለሁ
በሥላሴ ፊት ስምሽም በእውነት ሰልጥኗልና/2/
ይታረቃል እግዚአብሔር ድንግል ባንቺ ልመና/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 3
ነግረሽው ነውና ልጅሽ የታገሰኝ
እንደሃጥያቴ ብዛት ፈጥኖ ያላጠፋኝ
እውነተኛ መዝገቤ ነሽ ድህነት ያገኘሁብሽ/2/
ወደቤ ነሽ እመቤቴ በሰላም ያረፍኩብሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 4
ሃጥአን እንዲፀድቁ ምክንያት አድርጎሻል
ከሞት ወደ ህይወት አዳም ተሻግሮብሻል
በጌታ ፊት በወረደ በመረረ እንባሽ/2/
ያባቴ ቡሩካን ብሎ ይቀበለኝ ልጅሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 1
Barkign yeamlak enat yiraq gusqulnaye
Afen beesat muyw enditabas enbaye
Ene wedanchi lit’ega limall kefitsh (2)
Angetn ayasqelsm enate limenash (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 2
Sergun endalgeba libsen asadfeyalehu
Bemljash bemamen lanchi asasbalehu
Beslase fit simshm beewnet selt’nwalna (2)
Yitareqal Egziabher Dingil banchi limena (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 3
Negreshw newna lijsh yetagesegn
Endehat’yate bizat fet’no yalat’efagn
Ewnetegna mezgebe nesh dihnet yagegnehubsh (2)
Wedebe nesh Emebete beselam yarefkubsh (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 4
Hat’an endits’edqu miknyat adrgoshal
Kemot wede hiywet adam teshagrobshal
Begeta fit bewerede bemerere enbash (2)
Yabate burukan bilo yiqebelegn lijsh (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 1
ባርኪኝ የአምላክ እናት ይራቅ ጉስቁልናዬ
አፌን በእሳት ሙይው እንዲታባስ እንባዬ
እኔ ወዳንቺ ልጠጋ ልማልል ከፊትሽ/2/
አንገትን አያስቀልስም እናቴ ልመናሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 2
ሰርጉን እንዳልገባ ልብሴን አሳድፌያለሁ
በምልጃሽ በማመን ላንቺ አሳስባለሁ
በሥላሴ ፊት ስምሽም በእውነት ሰልጥኗልና/2/
ይታረቃል እግዚአብሔር ድንግል ባንቺ ልመና/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 3
ነግረሽው ነውና ልጅሽ የታገሰኝ
እንደሃጥያቴ ብዛት ፈጥኖ ያላጠፋኝ
እውነተኛ መዝገቤ ነሽ ድህነት ያገኘሁብሽ/2/
ወደቤ ነሽ እመቤቴ በሰላም ያረፍኩብሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 4
ሃጥአን እንዲፀድቁ ምክንያት አድርጎሻል
ከሞት ወደ ህይወት አዳም ተሻግሮብሻል
በጌታ ፊት በወረደ በመረረ እንባሽ/2/
ያባቴ ቡሩካን ብሎ ይቀበለኝ ልጅሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/',
        lyrics_transliteration = 'CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 1
Barkign yeamlak enat yiraq gusqulnaye
Afen beesat muyw enditabas enbaye
Ene wedanchi lit’ega limall kefitsh (2)
Angetn ayasqelsm enate limenash (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 2
Sergun endalgeba libsen asadfeyalehu
Bemljash bemamen lanchi asasbalehu
Beslase fit simshm beewnet selt’nwalna (2)
Yitareqal Egziabher Dingil banchi limena (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 3
Negreshw newna lijsh yetagesegn
Endehat’yate bizat fet’no yalat’efagn
Ewnetegna mezgebe nesh dihnet yagegnehubsh (2)
Wedebe nesh Emebete beselam yarefkubsh (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 4
Hat’an endits’edqu miknyat adrgoshal
Kemot wede hiywet adam teshagrobshal
Begeta fit bewerede bemerere enbash (2)
Yabate burukan bilo yiqebelegn lijsh (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '25fe3cf8-e591-47a7-a2b7-c30da8fda559'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 1
ባርኪኝ የአምላክ እናት ይራቅ ጉስቁልናዬ
አፌን በእሳት ሙይው እንዲታባስ እንባዬ
እኔ ወዳንቺ ልጠጋ ልማልል ከፊትሽ/2/
አንገትን አያስቀልስም እናቴ ልመናሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 2
ሰርጉን እንዳልገባ ልብሴን አሳድፌያለሁ
በምልጃሽ በማመን ላንቺ አሳስባለሁ
በሥላሴ ፊት ስምሽም በእውነት ሰልጥኗልና/2/
ይታረቃል እግዚአብሔር ድንግል ባንቺ ልመና/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 3
ነግረሽው ነውና ልጅሽ የታገሰኝ
እንደሃጥያቴ ብዛት ፈጥኖ ያላጠፋኝ
እውነተኛ መዝገቤ ነሽ ድህነት ያገኘሁብሽ/2/
ወደቤ ነሽ እመቤቴ በሰላም ያረፍኩብሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 4
ሃጥአን እንዲፀድቁ ምክንያት አድርጎሻል
ከሞት ወደ ህይወት አዳም ተሻግሮብሻል
በጌታ ፊት በወረደ በመረረ እንባሽ/2/
ያባቴ ቡሩካን ብሎ ይቀበለኝ ልጅሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '25fe3cf8-e591-47a7-a2b7-c30da8fda559'::uuid, 'ye-lejesh-cherenet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- simika-new-eritrean-orthodox-tewahdo-mezmur-2022-zemari-bereket-tikue-sm ("#simika_New_Eritrean_orthodox_tewahdo_mezmur_2022_zemari_Bereket_tikue_smka")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '40b115bb-468d-4529-ad74-10ce7a8ef713'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 1
ብዝሓርር መስዋእቲ ብደም ድቤላታት ፡
ሞት ብዝግድቦም ናይ ኦሪት ካህናት
ብናይ ሞት ኣጎልጉሎት ኣይኮነን ድሕነተይ ፡
ብገዛእ ደምኻ''ዩ ኦ ሊቀ ካህነይ።

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 2
ክህነትካ ዘልኣለማዊ''ዩ
ሞት መቃብር ኣይግድቦን''ዩ
ስለዚ''የ ኣባኻ ዝውከል
መን ኣሎኒ ብጀካ መድሕን

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 3
ኦ ኢየሱስ እሙን ኣምላኸይ
ኣብ ሕይወተይ ንስኻ ንገሰለይ፡ኣሜን።
ስምኻ''ዩ ሓይለይ ንሰይጣን ዝስዕረሉ
ምንጪ በረኸተይ ካልኣይ ዘይብሉ

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 4
ንድሕነተይ ኢሉ ዝተዋህበኒ ስም
ብዘይካ ኢየሱስ ከቶ ካልእ የለን።
ኢየሱስ ኢየሱስ ክብል''የ
ብማህሌት ብምስጋና ቆይመ

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 5
ኢየሱስ ኢየሱስ በሉ
ንክብሩ ሃየ ዘምሩ
ኢየሱስ ኢየሱስ ንበል
መድሃኔት''ዩ ኣብኡ ንወከል፡ኣሜን።

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 6
ብስምካ ንልምን ብስምካ ንረክብ
ብስምካ ንትስፎ ብስምካ ንስዕር
እቲ ኣሎና ንብሎ ዕጥቅና ስንቅና
ኢየሱስ ስምካ''ዩ ሓይሊ ዝህበና

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 7
ከመይ''ሲ ከምቲ ቃልካ ዝብሎ
ኩሉ ነገር ብስምካ ክንገብሮ
ስለዚ ኢና ኣባካ ንውከል
መን ኣሎና ብዘይካካ መድሕን

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 8
ኦ ኢየሱስ እሙን ኣምላኽና
ኣምልኾን ምስጋናን ንዓኻ(3)ኣሜን።

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 1
Bizharr meswaeti bidem dibelatat
Mot bizgdbom nay orit kahnat
Binay mot agolgulot aykonen dihnetey
Bigezae demኻ''yu o liqe kahney.

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 2
Kihnetka zelalemawi''yu
Mot meqabr aygdbon''yu
Silezi''ye abaኻ ziwkel
Men aloni bijeka medhn

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 3
O Iyesus emun amlaኸy
Ab hiywetey nisኻ nigeseley amen.
Simኻ''yu hayley niseyt’an ziserelu
Minch’i bereኸtey kalay zeyblu

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 4
Nidhnetey ilu zitewahbeni sim
Bizeyka Iyesus keto kale yelen.
Iyesus Iyesus kibl''ye
Bimahlet bimsgana qoyme

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 5
Iyesus Iyesus belu
Nikbru haye zemru
Iyesus Iyesus nibel
Medhanet''yu abu niwekel amen.

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 6
Bismka nilmn bismka nirekb
Bismka nitsfo bismka niser
Eti alona niblo et’qna sinqna
Iyesus simka''yu hayli zihbena

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 7
Kemey''si kemti qalka ziblo
Kulu neger bismka kingebro
Silezi ina abaka niwkel
Men alona bizeykaka medhn

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 8
O Iyesus emun amlaኽna
Amlኾn misganan niaኻ (3)amen.

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 1
ብዝሓርር መስዋእቲ ብደም ድቤላታት ፡
ሞት ብዝግድቦም ናይ ኦሪት ካህናት
ብናይ ሞት ኣጎልጉሎት ኣይኮነን ድሕነተይ ፡
ብገዛእ ደምኻ''ዩ ኦ ሊቀ ካህነይ።

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 2
ክህነትካ ዘልኣለማዊ''ዩ
ሞት መቃብር ኣይግድቦን''ዩ
ስለዚ''የ ኣባኻ ዝውከል
መን ኣሎኒ ብጀካ መድሕን

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 3
ኦ ኢየሱስ እሙን ኣምላኸይ
ኣብ ሕይወተይ ንስኻ ንገሰለይ፡ኣሜን።
ስምኻ''ዩ ሓይለይ ንሰይጣን ዝስዕረሉ
ምንጪ በረኸተይ ካልኣይ ዘይብሉ

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 4
ንድሕነተይ ኢሉ ዝተዋህበኒ ስም
ብዘይካ ኢየሱስ ከቶ ካልእ የለን።
ኢየሱስ ኢየሱስ ክብል''የ
ብማህሌት ብምስጋና ቆይመ

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 5
ኢየሱስ ኢየሱስ በሉ
ንክብሩ ሃየ ዘምሩ
ኢየሱስ ኢየሱስ ንበል
መድሃኔት''ዩ ኣብኡ ንወከል፡ኣሜን።

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 6
ብስምካ ንልምን ብስምካ ንረክብ
ብስምካ ንትስፎ ብስምካ ንስዕር
እቲ ኣሎና ንብሎ ዕጥቅና ስንቅና
ኢየሱስ ስምካ''ዩ ሓይሊ ዝህበና

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 7
ከመይ''ሲ ከምቲ ቃልካ ዝብሎ
ኩሉ ነገር ብስምካ ክንገብሮ
ስለዚ ኢና ኣባካ ንውከል
መን ኣሎና ብዘይካካ መድሕን

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 8
ኦ ኢየሱስ እሙን ኣምላኽና
ኣምልኾን ምስጋናን ንዓኻ(3)ኣሜን።

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)',
        lyrics_transliteration = 'CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 1
Bizharr meswaeti bidem dibelatat
Mot bizgdbom nay orit kahnat
Binay mot agolgulot aykonen dihnetey
Bigezae demኻ''yu o liqe kahney.

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 2
Kihnetka zelalemawi''yu
Mot meqabr aygdbon''yu
Silezi''ye abaኻ ziwkel
Men aloni bijeka medhn

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 3
O Iyesus emun amlaኸy
Ab hiywetey nisኻ nigeseley amen.
Simኻ''yu hayley niseyt’an ziserelu
Minch’i bereኸtey kalay zeyblu

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 4
Nidhnetey ilu zitewahbeni sim
Bizeyka Iyesus keto kale yelen.
Iyesus Iyesus kibl''ye
Bimahlet bimsgana qoyme

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 5
Iyesus Iyesus belu
Nikbru haye zemru
Iyesus Iyesus nibel
Medhanet''yu abu niwekel amen.

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 6
Bismka nilmn bismka nirekb
Bismka nitsfo bismka niser
Eti alona niblo et’qna sinqna
Iyesus simka''yu hayli zihbena

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 7
Kemey''si kemti qalka ziblo
Kulu neger bismka kingebro
Silezi ina abaka niwkel
Men alona bizeykaka medhn

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 8
O Iyesus emun amlaኽna
Amlኾn misganan niaኻ (3)amen.

CHORUS
Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '40b115bb-468d-4529-ad74-10ce7a8ef713'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 1
ብዝሓርር መስዋእቲ ብደም ድቤላታት ፡
ሞት ብዝግድቦም ናይ ኦሪት ካህናት
ብናይ ሞት ኣጎልጉሎት ኣይኮነን ድሕነተይ ፡
ብገዛእ ደምኻ''ዩ ኦ ሊቀ ካህነይ።

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 2
ክህነትካ ዘልኣለማዊ''ዩ
ሞት መቃብር ኣይግድቦን''ዩ
ስለዚ''የ ኣባኻ ዝውከል
መን ኣሎኒ ብጀካ መድሕን

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 3
ኦ ኢየሱስ እሙን ኣምላኸይ
ኣብ ሕይወተይ ንስኻ ንገሰለይ፡ኣሜን።
ስምኻ''ዩ ሓይለይ ንሰይጣን ዝስዕረሉ
ምንጪ በረኸተይ ካልኣይ ዘይብሉ

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 4
ንድሕነተይ ኢሉ ዝተዋህበኒ ስም
ብዘይካ ኢየሱስ ከቶ ካልእ የለን።
ኢየሱስ ኢየሱስ ክብል''የ
ብማህሌት ብምስጋና ቆይመ

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 5
ኢየሱስ ኢየሱስ በሉ
ንክብሩ ሃየ ዘምሩ
ኢየሱስ ኢየሱስ ንበል
መድሃኔት''ዩ ኣብኡ ንወከል፡ኣሜን።

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 6
ብስምካ ንልምን ብስምካ ንረክብ
ብስምካ ንትስፎ ብስምካ ንስዕር
እቲ ኣሎና ንብሎ ዕጥቅና ስንቅና
ኢየሱስ ስምካ''ዩ ሓይሊ ዝህበና

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 7
ከመይ''ሲ ከምቲ ቃልካ ዝብሎ
ኩሉ ነገር ብስምካ ክንገብሮ
ስለዚ ኢና ኣባካ ንውከል
መን ኣሎና ብዘይካካ መድሕን

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 8
ኦ ኢየሱስ እሙን ኣምላኽና
ኣምልኾን ምስጋናን ንዓኻ(3)ኣሜን።

CHORUS
ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '40b115bb-468d-4529-ad74-10ce7a8ef713'::uuid, 'simika-new-eritrean-orthodox-tewahdo-mezmur-2022-zemari-bereket-tikue-sm', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cher-agelgay-mabew ("cher agelgay mabew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '915a0f0a-cc20-4f09-976c-119047045395'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 1
በጥቂቱ ታምኖ በብዙ የተሾመው
ባለ አምስቱ መክሊት ሊቀ ጳጳሱ ነው
++++++++++++++++++++
ሳይሰለች የተጋ ባለሁለት መክሊት

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 2
የታመነ እረኛ በፍቅርና በእምነት
ግባ የተባለው ወደ ጌታው ደስታ
አጥምቆ ያቆርባል ካህኑ የጌታ
++++++++++++++++++++

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 3
ለሚበልጠው ጸጋ ተጠርቶ የነበረ
መክሊቱን ደብቆ ቆፍሮ የቀበረ
ሰነፍ ባርያ ተብሎ ወደ ፍርድ ተጣለ
ማኔ ቴቄል ፋሬስ በአምላክ ፊት ቀለለ

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 4
++++++++++++++++++++
ፈቃድህን ማድረግ ነፍሱ ለምትወደው
ወንጌልህን መግለፅ የየዕለት ግብሩ ነው
ህግህ ለዘለላም ተጽፎ ይኖራል

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 5
በታላቅ ጉባኤ ጽድቅህ ይነገራል

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 1
Bet’qitu tamno bebzu yeteshomew
Bale amstu meklit liqe p’ap’asu new
++++++++++++++++++++
Sayselech yetega balehulet meklit

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 2
Yetamene eregna befqrna beemnet
Giba yetebalew wede getaw desta
At’mqo yaqorbal kahnu yegeta
++++++++++++++++++++

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 3
Lemibelt’ew ts’ega tet’erto yenebere
Meklitun debqo qofro yeqebere
Senef barya teblo wede fird tet’ale
Mane teqel fares beamlak fit qelele

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 4
++++++++++++++++++++
Feqadhn madreg nefsu lemtwedew
Wengelhn meglets’ yeyeelet gibru new
High lezelelam tets’fo yinoral

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 5
Betalaq gubae ts’dqh yinegeral

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 1
በጥቂቱ ታምኖ በብዙ የተሾመው
ባለ አምስቱ መክሊት ሊቀ ጳጳሱ ነው
++++++++++++++++++++
ሳይሰለች የተጋ ባለሁለት መክሊት

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 2
የታመነ እረኛ በፍቅርና በእምነት
ግባ የተባለው ወደ ጌታው ደስታ
አጥምቆ ያቆርባል ካህኑ የጌታ
++++++++++++++++++++

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 3
ለሚበልጠው ጸጋ ተጠርቶ የነበረ
መክሊቱን ደብቆ ቆፍሮ የቀበረ
ሰነፍ ባርያ ተብሎ ወደ ፍርድ ተጣለ
ማኔ ቴቄል ፋሬስ በአምላክ ፊት ቀለለ

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 4
++++++++++++++++++++
ፈቃድህን ማድረግ ነፍሱ ለምትወደው
ወንጌልህን መግለፅ የየዕለት ግብሩ ነው
ህግህ ለዘለላም ተጽፎ ይኖራል

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 5
በታላቅ ጉባኤ ጽድቅህ ይነገራል

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው',
        lyrics_transliteration = 'CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 1
Bet’qitu tamno bebzu yeteshomew
Bale amstu meklit liqe p’ap’asu new
++++++++++++++++++++
Sayselech yetega balehulet meklit

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 2
Yetamene eregna befqrna beemnet
Giba yetebalew wede getaw desta
At’mqo yaqorbal kahnu yegeta
++++++++++++++++++++

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 3
Lemibelt’ew ts’ega tet’erto yenebere
Meklitun debqo qofro yeqebere
Senef barya teblo wede fird tet’ale
Mane teqel fares beamlak fit qelele

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 4
++++++++++++++++++++
Feqadhn madreg nefsu lemtwedew
Wengelhn meglets’ yeyeelet gibru new
High lezelelam tets’fo yinoral

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 5
Betalaq gubae ts’dqh yinegeral

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new',
        updated_at = clock_timestamp()::text
    WHERE import_id = '915a0f0a-cc20-4f09-976c-119047045395'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 1
በጥቂቱ ታምኖ በብዙ የተሾመው
ባለ አምስቱ መክሊት ሊቀ ጳጳሱ ነው
++++++++++++++++++++
ሳይሰለች የተጋ ባለሁለት መክሊት

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 2
የታመነ እረኛ በፍቅርና በእምነት
ግባ የተባለው ወደ ጌታው ደስታ
አጥምቆ ያቆርባል ካህኑ የጌታ
++++++++++++++++++++

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 3
ለሚበልጠው ጸጋ ተጠርቶ የነበረ
መክሊቱን ደብቆ ቆፍሮ የቀበረ
ሰነፍ ባርያ ተብሎ ወደ ፍርድ ተጣለ
ማኔ ቴቄል ፋሬስ በአምላክ ፊት ቀለለ

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 4
++++++++++++++++++++
ፈቃድህን ማድረግ ነፍሱ ለምትወደው
ወንጌልህን መግለፅ የየዕለት ግብሩ ነው
ህግህ ለዘለላም ተጽፎ ይኖራል

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 5
በታላቅ ጉባኤ ጽድቅህ ይነገራል

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '915a0f0a-cc20-4f09-976c-119047045395'::uuid, 'cher-agelgay-mabew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selam-argiw-mariam-like-mezemeran-tewodros-yosef ("Selam Argiw Mariam Like Mezemeran Tewodros Yosef")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c52fb9f4-1220-4b39-8f19-69cff0b2f82c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 1
ጠላት ዘራና ክፍፍሉን
የፍቅር ቋንቋ ቀዘቀዘ
አንድነታችን ደበዘዘ፡፡
ያስጎነበሰን ሸክም ይቅለል

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 2
በልጅሽ ምህረት ቀና እንበል
ሰላም እንዲሰንፍ በምህረቱ
ንጉሱን ማልጅው ንግስቲቱ፡፡
የሽንገላ ቃል ከኛ ይውጣ

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 3
ያ ክፉ ዘመን እንዳይመጣ
በመለያየት ተመስርቶ
የፀና መንግስት የለም ከቶ፡፡
በረከት አዟል አምላካችን

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 4
ህብረት ባለበት መኖሪያችን
ክፍፍል ይቅር አሳስቢልን
በቃል ኪዳንሽ አስጠልይን፡፡
ክፋትን ተክለን በልባችን

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 5
መልክ ብቻ ነው አምልኳችን
ወድቀን እንዳንቀር እንዳንጠፋ
ፍቅርን ሳይብን የአዳም ተስፋ፡፡
እንወድሻለን ማርያም

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 1
T’elat zerana kifflun
Yefqr qwanqwa qezeqeze
Andnetachn debezeze
Yasgonebesen shekm yiqlel

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 2
Beljsh mihret qena enbel
Selam endisenf bemhretu
Nigusun maljw nigstitu
Yeshngela qal kegna yiwt’a

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 3
Ya kifu zemen endaymet’a
Bemeleyayet temesrto
Yets’ena mengst yelem keto
Bereket azwal amlakachn

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 4
Hibret balebet menoriyachn
Kiffl yiqr asasbiln
Beqal kidansh ast’elyn
Kifatn teklen belbachn

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 5
Melk bicha new amlkwachn
Wedqen endanqer endant’efa
Fiqrn saybn yeadam tesfa
Enwedshalen Maryam

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 1
ጠላት ዘራና ክፍፍሉን
የፍቅር ቋንቋ ቀዘቀዘ
አንድነታችን ደበዘዘ፡፡
ያስጎነበሰን ሸክም ይቅለል

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 2
በልጅሽ ምህረት ቀና እንበል
ሰላም እንዲሰንፍ በምህረቱ
ንጉሱን ማልጅው ንግስቲቱ፡፡
የሽንገላ ቃል ከኛ ይውጣ

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 3
ያ ክፉ ዘመን እንዳይመጣ
በመለያየት ተመስርቶ
የፀና መንግስት የለም ከቶ፡፡
በረከት አዟል አምላካችን

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 4
ህብረት ባለበት መኖሪያችን
ክፍፍል ይቅር አሳስቢልን
በቃል ኪዳንሽ አስጠልይን፡፡
ክፋትን ተክለን በልባችን

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 5
መልክ ብቻ ነው አምልኳችን
ወድቀን እንዳንቀር እንዳንጠፋ
ፍቅርን ሳይብን የአዳም ተስፋ፡፡
እንወድሻለን ማርያም

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን',
        lyrics_transliteration = 'CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 1
T’elat zerana kifflun
Yefqr qwanqwa qezeqeze
Andnetachn debezeze
Yasgonebesen shekm yiqlel

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 2
Beljsh mihret qena enbel
Selam endisenf bemhretu
Nigusun maljw nigstitu
Yeshngela qal kegna yiwt’a

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 3
Ya kifu zemen endaymet’a
Bemeleyayet temesrto
Yets’ena mengst yelem keto
Bereket azwal amlakachn

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 4
Hibret balebet menoriyachn
Kiffl yiqr asasbiln
Beqal kidansh ast’elyn
Kifatn teklen belbachn

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 5
Melk bicha new amlkwachn
Wedqen endanqer endant’efa
Fiqrn saybn yeadam tesfa
Enwedshalen Maryam

CHORUS
Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c52fb9f4-1220-4b39-8f19-69cff0b2f82c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 1
ጠላት ዘራና ክፍፍሉን
የፍቅር ቋንቋ ቀዘቀዘ
አንድነታችን ደበዘዘ፡፡
ያስጎነበሰን ሸክም ይቅለል

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 2
በልጅሽ ምህረት ቀና እንበል
ሰላም እንዲሰንፍ በምህረቱ
ንጉሱን ማልጅው ንግስቲቱ፡፡
የሽንገላ ቃል ከኛ ይውጣ

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 3
ያ ክፉ ዘመን እንዳይመጣ
በመለያየት ተመስርቶ
የፀና መንግስት የለም ከቶ፡፡
በረከት አዟል አምላካችን

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 4
ህብረት ባለበት መኖሪያችን
ክፍፍል ይቅር አሳስቢልን
በቃል ኪዳንሽ አስጠልይን፡፡
ክፋትን ተክለን በልባችን

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 5
መልክ ብቻ ነው አምልኳችን
ወድቀን እንዳንቀር እንዳንጠፋ
ፍቅርን ሳይብን የአዳም ተስፋ፡፡
እንወድሻለን ማርያም

CHORUS
ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c52fb9f4-1220-4b39-8f19-69cff0b2f82c'::uuid, 'selam-argiw-mariam-like-mezemeran-tewodros-yosef', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-kem-ntfue-wedi-bereket-tikue-gesera ("Eritrean Orthodox Tewahdo Mezmur kem ntfue wedi Bereket Tikue Gesera")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2707ed3e-ac29-4b4c-9749-f1f2a211f4b2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 1
ዘይከም ቁመት ዘኬዎስ ዝሓጸሮ ልቢ
ተጋዊ እንድየ ኔረ ዘይናቱ ኣካቢ
ብፍጹም ትሕትና ቃላትካ ከይስከም
ኣብ ሳግላ ትዕቢተይ ሓዂረ ክትዕነን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 2
ትሪ ልበይ ሴርካ ከፊትካ ንዓይነይ
ቤተይ ምስ ባረኽካ ርኤካ መድሕነይ
ይትረፍ ኣነ ህያው ዝዛረብ ብልሳን
ሰማይ ኣንቃዕሪራ ዑፍ''ኳ ትምስክር

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 3
ለቆታ ከብደይ ግን ተመስገን ደረታ
ብሰሪ ስስዕቲ ንሕግኻ እስሕታ
ሰላመይ ክትመስል ንሓጢኣት ከርዲና
ሓይሊ ኢድ ምሕረትካ ውሉድካ ኣድሒና

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 4
ከም ጥጦስ ኣይኮንኩን ክብርኻ ዝመስከረ
ከም ጴጥሮስ ኣይኮንኩን ንስሓ ዘክበረ
ንሳቶም ብግብሮም ክስመዩ ጻድቃን
ነዓይ ንሓጥእ ግን ግብሪ ኣይነበረንን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 5
ምሕረትካ ዓዚዙ ሂብካኒ ይቅሬታ
ምስጋና ይብጻሕካ ናይ ሰራዊት ጎይታ
በሊሕ ብምርጋጸይ ነፍሰይ ከምትጉዳእ
ኣየናይ''ላቶ ልበይ ንቃልካ ክትርዳእ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 6
ፈቃር ኣምላኸይ ግን እንታይ ይሰኣነካ
ብግሊ ግሌኻ ንርእሰይ ጎልቢብካ
ብዝርጉሕ ቅልጽምካ መሊስካኒ ክብሪ
ክርስቶስ ተመስገን ለዋህ ኣቦ ፍቅሪ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 1
Zeykem qumet zekewos zihats’ero libi
Tegawi endye nere zeynatu akabi
Bifts’um tihtna qalatka keyskem
Ab sagla tiebitey hakhwire kitenen

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 2
Tiri libey serka kefitka niayney
Betey mis bareኽka rieka medhney
Yitref ane hiyaw zizareb bilsan
Semay anqaerira uf''kwa timskr

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 3
Leqota kebdey gin temesgen dereta
Biseri siseti nihgኻ eshta
Selamey kitmesl nihat’iat kerdina
Hayli id mihretka wiludka adhina

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 4
Kem t’t’os aykonkun kibrኻ zimeskere
Kem p’et’ros aykonkun nisha zekbere
Nisatom bigbrom kismeyu ts’adqan
Neay nihat’e gin gibri ayneberenn

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 5
Mihretka azizu hibkani yiqreta
Misgana yibts’ahka nay serawit goyta
Belih bimrgats’ey nefsey kemtgudae
Ayenay''lato libey niqalka kitrdae

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 6
Feqar amlaኸy gin entay yiseaneka
Bigli gileኻ niresey golbibka
Bizrguh qilts’mka meliskani kibri
Kristos temesgen lewah abo fiqri

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 1
ዘይከም ቁመት ዘኬዎስ ዝሓጸሮ ልቢ
ተጋዊ እንድየ ኔረ ዘይናቱ ኣካቢ
ብፍጹም ትሕትና ቃላትካ ከይስከም
ኣብ ሳግላ ትዕቢተይ ሓዂረ ክትዕነን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 2
ትሪ ልበይ ሴርካ ከፊትካ ንዓይነይ
ቤተይ ምስ ባረኽካ ርኤካ መድሕነይ
ይትረፍ ኣነ ህያው ዝዛረብ ብልሳን
ሰማይ ኣንቃዕሪራ ዑፍ''ኳ ትምስክር

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 3
ለቆታ ከብደይ ግን ተመስገን ደረታ
ብሰሪ ስስዕቲ ንሕግኻ እስሕታ
ሰላመይ ክትመስል ንሓጢኣት ከርዲና
ሓይሊ ኢድ ምሕረትካ ውሉድካ ኣድሒና

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 4
ከም ጥጦስ ኣይኮንኩን ክብርኻ ዝመስከረ
ከም ጴጥሮስ ኣይኮንኩን ንስሓ ዘክበረ
ንሳቶም ብግብሮም ክስመዩ ጻድቃን
ነዓይ ንሓጥእ ግን ግብሪ ኣይነበረንን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 5
ምሕረትካ ዓዚዙ ሂብካኒ ይቅሬታ
ምስጋና ይብጻሕካ ናይ ሰራዊት ጎይታ
በሊሕ ብምርጋጸይ ነፍሰይ ከምትጉዳእ
ኣየናይ''ላቶ ልበይ ንቃልካ ክትርዳእ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 6
ፈቃር ኣምላኸይ ግን እንታይ ይሰኣነካ
ብግሊ ግሌኻ ንርእሰይ ጎልቢብካ
ብዝርጉሕ ቅልጽምካ መሊስካኒ ክብሪ
ክርስቶስ ተመስገን ለዋህ ኣቦ ፍቅሪ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ',
        lyrics_transliteration = 'CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 1
Zeykem qumet zekewos zihats’ero libi
Tegawi endye nere zeynatu akabi
Bifts’um tihtna qalatka keyskem
Ab sagla tiebitey hakhwire kitenen

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 2
Tiri libey serka kefitka niayney
Betey mis bareኽka rieka medhney
Yitref ane hiyaw zizareb bilsan
Semay anqaerira uf''kwa timskr

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 3
Leqota kebdey gin temesgen dereta
Biseri siseti nihgኻ eshta
Selamey kitmesl nihat’iat kerdina
Hayli id mihretka wiludka adhina

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 4
Kem t’t’os aykonkun kibrኻ zimeskere
Kem p’et’ros aykonkun nisha zekbere
Nisatom bigbrom kismeyu ts’adqan
Neay nihat’e gin gibri ayneberenn

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 5
Mihretka azizu hibkani yiqreta
Misgana yibts’ahka nay serawit goyta
Belih bimrgats’ey nefsey kemtgudae
Ayenay''lato libey niqalka kitrdae

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 6
Feqar amlaኸy gin entay yiseaneka
Bigli gileኻ niresey golbibka
Bizrguh qilts’mka meliskani kibri
Kristos temesgen lewah abo fiqri

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2707ed3e-ac29-4b4c-9749-f1f2a211f4b2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 1
ዘይከም ቁመት ዘኬዎስ ዝሓጸሮ ልቢ
ተጋዊ እንድየ ኔረ ዘይናቱ ኣካቢ
ብፍጹም ትሕትና ቃላትካ ከይስከም
ኣብ ሳግላ ትዕቢተይ ሓዂረ ክትዕነን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 2
ትሪ ልበይ ሴርካ ከፊትካ ንዓይነይ
ቤተይ ምስ ባረኽካ ርኤካ መድሕነይ
ይትረፍ ኣነ ህያው ዝዛረብ ብልሳን
ሰማይ ኣንቃዕሪራ ዑፍ''ኳ ትምስክር

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 3
ለቆታ ከብደይ ግን ተመስገን ደረታ
ብሰሪ ስስዕቲ ንሕግኻ እስሕታ
ሰላመይ ክትመስል ንሓጢኣት ከርዲና
ሓይሊ ኢድ ምሕረትካ ውሉድካ ኣድሒና

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 4
ከም ጥጦስ ኣይኮንኩን ክብርኻ ዝመስከረ
ከም ጴጥሮስ ኣይኮንኩን ንስሓ ዘክበረ
ንሳቶም ብግብሮም ክስመዩ ጻድቃን
ነዓይ ንሓጥእ ግን ግብሪ ኣይነበረንን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 5
ምሕረትካ ዓዚዙ ሂብካኒ ይቅሬታ
ምስጋና ይብጻሕካ ናይ ሰራዊት ጎይታ
በሊሕ ብምርጋጸይ ነፍሰይ ከምትጉዳእ
ኣየናይ''ላቶ ልበይ ንቃልካ ክትርዳእ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 6
ፈቃር ኣምላኸይ ግን እንታይ ይሰኣነካ
ብግሊ ግሌኻ ንርእሰይ ጎልቢብካ
ብዝርጉሕ ቅልጽምካ መሊስካኒ ክብሪ
ክርስቶስ ተመስገን ለዋህ ኣቦ ፍቅሪ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2707ed3e-ac29-4b4c-9749-f1f2a211f4b2'::uuid, 'eritrean-orthodox-tewahdo-mezmur-kem-ntfue-wedi-bereket-tikue-gesera', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amalaje-zemari-yonas-gebrekidan ("Amalaje Zemari Yonas Gebrekidan")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '28887768-61f0-4658-891f-ca4080e67fce'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 1
በጠራኋት ጊዜ የቅርብ ወደጄ
የማላጣት ከጎኔ
ቀርባ ምታግዘኝ
በደስታ በሐዘኔ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 2
ሰላም ከእኔ ሲርቅ
ወደ እርሷ ጮሃለው
ያፅናናኛል ፍቅሯ
ደግሞ እበረታለው

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 3
ባድር አይገደኝም ማርያም ውበቴ
ሳነሳሳት ውዬ
ክብሬናት እመ አምላክ
ስጦታ የአንድዬ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 4
ጠላቴ ሆይ ስማ
ከአፌ አልነጥላትም
ደምስሬ በሙሉ
ይላል ማርያም ማርያም

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 5
በኤፍሬም ውዳሴ መማፀኛዬ
አወድሳታለሁ
ዘወትር በማህሌት
ስሟን እጣራለሁ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 6
መበርቻዬ ለኔ
ክፉን ያለፍኩበት
በረታለው እንጂ
አላፍርም ስጠራት

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 7
እንወዳታለን ማርያምን እንወዳታለን
ልዕልናዋን ለትውልድ እናውጃለን
እወዳታለን
አንጠራጠርም

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 8
በአማላጅነቷ
ኢየሱስ እኮነው
የፍቅሯ ስጦታ
ለክብሯ ዘምረን

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 9
መች እንጠግባለን
ዘመናት ያልፋሉ
ማርያም እያልን
ጌጣችን ነው ስሟ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 10
መተማመኛችን
ክብራችን ነው ክብሯ
ከፍታ ማማችን
መማፀኛችን ናት

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 11
አርማችን ዘላለም
እናገናታለን
በማርያም አናፍርም
የእረፍታችን ወደብ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 12
አንድያ ልጇ ነው
አያልቅም ተነግሮ
ከእርሷ ያገኘነው
ፈጥና ትደርሳለች

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 13
ይዛ ምህረትን
ጠላት ያሻውን ቢል
አንተውም ማርያምን

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 1
Bet’erahwat gize yeqrb wedeje
Yemalat’at kegone
Qerba mitagzegn
Bedesta behezene

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 2
Selam keene sirq
Wede erswa ch’ohalew
Yats’nanagnal fiqrwa
Degmo eberetalew

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 3
Badr aygedegnm Maryam wibete
Sanesasat wiye
Kibrenat eme amlak
Sit’ota yeandye

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 4
T’elate hoy sima
Keafe alnet’latm
Demsre bemulu
Yilal Maryam Maryam

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 5
Beefrem widase memats’egnaye
Awedsatalehu
Zewetr bemahlet
Simwan et’aralehu

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 6
Meberchaye lene
Kifun yalefkubet
Beretalew enji
Alafrm sit’erat

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 7
Enwedatalen Maryamn enwedatalen
Lielnawan letwld enawjalen
Ewedatalen
Ant’erat’erm

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 8
Beamalajnetwa
Iyesus ekonew
Yefqrwa sit’ota
Lekbrwa zemren

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 9
Mech ent’egbalen
Zemenat yalfalu
Maryam eyaln
Get’achn new simwa

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 10
Metemamegnachn
Kibrachn new kibrwa
Kefta mamachn
Memats’egnachn nat

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 11
Armachn zelalem
Enagenatalen
BeMaryam anafrm
Yeereftachn wedeb

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 12
Andya lijwa new
Ayalqm tenegro
Keerswa yagegnenew
Fet’na tidersalech

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 13
Yiza mihretn
T’elat yashawn bil
Antewm Maryamn

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 1
በጠራኋት ጊዜ የቅርብ ወደጄ
የማላጣት ከጎኔ
ቀርባ ምታግዘኝ
በደስታ በሐዘኔ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 2
ሰላም ከእኔ ሲርቅ
ወደ እርሷ ጮሃለው
ያፅናናኛል ፍቅሯ
ደግሞ እበረታለው

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 3
ባድር አይገደኝም ማርያም ውበቴ
ሳነሳሳት ውዬ
ክብሬናት እመ አምላክ
ስጦታ የአንድዬ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 4
ጠላቴ ሆይ ስማ
ከአፌ አልነጥላትም
ደምስሬ በሙሉ
ይላል ማርያም ማርያም

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 5
በኤፍሬም ውዳሴ መማፀኛዬ
አወድሳታለሁ
ዘወትር በማህሌት
ስሟን እጣራለሁ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 6
መበርቻዬ ለኔ
ክፉን ያለፍኩበት
በረታለው እንጂ
አላፍርም ስጠራት

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 7
እንወዳታለን ማርያምን እንወዳታለን
ልዕልናዋን ለትውልድ እናውጃለን
እወዳታለን
አንጠራጠርም

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 8
በአማላጅነቷ
ኢየሱስ እኮነው
የፍቅሯ ስጦታ
ለክብሯ ዘምረን

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 9
መች እንጠግባለን
ዘመናት ያልፋሉ
ማርያም እያልን
ጌጣችን ነው ስሟ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 10
መተማመኛችን
ክብራችን ነው ክብሯ
ከፍታ ማማችን
መማፀኛችን ናት

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 11
አርማችን ዘላለም
እናገናታለን
በማርያም አናፍርም
የእረፍታችን ወደብ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 12
አንድያ ልጇ ነው
አያልቅም ተነግሮ
ከእርሷ ያገኘነው
ፈጥና ትደርሳለች

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 13
ይዛ ምህረትን
ጠላት ያሻውን ቢል
አንተውም ማርያምን

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ',
        lyrics_transliteration = 'CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 1
Bet’erahwat gize yeqrb wedeje
Yemalat’at kegone
Qerba mitagzegn
Bedesta behezene

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 2
Selam keene sirq
Wede erswa ch’ohalew
Yats’nanagnal fiqrwa
Degmo eberetalew

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 3
Badr aygedegnm Maryam wibete
Sanesasat wiye
Kibrenat eme amlak
Sit’ota yeandye

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 4
T’elate hoy sima
Keafe alnet’latm
Demsre bemulu
Yilal Maryam Maryam

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 5
Beefrem widase memats’egnaye
Awedsatalehu
Zewetr bemahlet
Simwan et’aralehu

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 6
Meberchaye lene
Kifun yalefkubet
Beretalew enji
Alafrm sit’erat

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 7
Enwedatalen Maryamn enwedatalen
Lielnawan letwld enawjalen
Ewedatalen
Ant’erat’erm

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 8
Beamalajnetwa
Iyesus ekonew
Yefqrwa sit’ota
Lekbrwa zemren

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 9
Mech ent’egbalen
Zemenat yalfalu
Maryam eyaln
Get’achn new simwa

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 10
Metemamegnachn
Kibrachn new kibrwa
Kefta mamachn
Memats’egnachn nat

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 11
Armachn zelalem
Enagenatalen
BeMaryam anafrm
Yeereftachn wedeb

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 12
Andya lijwa new
Ayalqm tenegro
Keerswa yagegnenew
Fet’na tidersalech

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 13
Yiza mihretn
T’elat yashawn bil
Antewm Maryamn

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete',
        updated_at = clock_timestamp()::text
    WHERE import_id = '28887768-61f0-4658-891f-ca4080e67fce'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 1
በጠራኋት ጊዜ የቅርብ ወደጄ
የማላጣት ከጎኔ
ቀርባ ምታግዘኝ
በደስታ በሐዘኔ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 2
ሰላም ከእኔ ሲርቅ
ወደ እርሷ ጮሃለው
ያፅናናኛል ፍቅሯ
ደግሞ እበረታለው

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 3
ባድር አይገደኝም ማርያም ውበቴ
ሳነሳሳት ውዬ
ክብሬናት እመ አምላክ
ስጦታ የአንድዬ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 4
ጠላቴ ሆይ ስማ
ከአፌ አልነጥላትም
ደምስሬ በሙሉ
ይላል ማርያም ማርያም

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 5
በኤፍሬም ውዳሴ መማፀኛዬ
አወድሳታለሁ
ዘወትር በማህሌት
ስሟን እጣራለሁ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 6
መበርቻዬ ለኔ
ክፉን ያለፍኩበት
በረታለው እንጂ
አላፍርም ስጠራት

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 7
እንወዳታለን ማርያምን እንወዳታለን
ልዕልናዋን ለትውልድ እናውጃለን
እወዳታለን
አንጠራጠርም

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 8
በአማላጅነቷ
ኢየሱስ እኮነው
የፍቅሯ ስጦታ
ለክብሯ ዘምረን

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 9
መች እንጠግባለን
ዘመናት ያልፋሉ
ማርያም እያልን
ጌጣችን ነው ስሟ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 10
መተማመኛችን
ክብራችን ነው ክብሯ
ከፍታ ማማችን
መማፀኛችን ናት

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 11
አርማችን ዘላለም
እናገናታለን
በማርያም አናፍርም
የእረፍታችን ወደብ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 12
አንድያ ልጇ ነው
አያልቅም ተነግሮ
ከእርሷ ያገኘነው
ፈጥና ትደርሳለች

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 13
ይዛ ምህረትን
ጠላት ያሻውን ቢል
አንተውም ማርያምን

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '28887768-61f0-4658-891f-ca4080e67fce'::uuid, 'amalaje-zemari-yonas-gebrekidan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tewelide-iyesus ("Tewelide Iyesus")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4212bc0d-c218-432e-a2da-892e4ab48071'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 1
በቤተልሔም
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 2
ዘይሁዳ
በቤተልሔም
አዋልድ እለት
ጢሮስ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 3
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም
አዋልድ እለት

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 4
ጢሮስ
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 5
ተወልዶ ኢየሱስ
በቤተልሔም
በቤተልሔም
በይሁዳ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 6
በቤተልሔም
ተወልዶ ኢየሱስ
በቤተልሔም
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 7
በይሁዳ
በቤተልሔም
የጢሮስ ልጆች
ሁሉ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 8
ያን ጊዜ ይሰግዱአሉ
ያን ጊዜ ይሰግዱአሉ
በቤተልሔም
የጢሮስ ልጆች

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 9
ሁሉ
ያን ጊዜ ይሰግዱአሉ
ያን ጊዜ ይሰግዱአሉ
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 10
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 11
በቤተልሔም
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 12
ዘይሁዳ
በቤተልሔም
አዋልድ እለት
ጢሮስ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 13
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም
አዋልድ እለት

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 14
ጢሮስ
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 1
Bebetelhem
Tewelde Iyesus
Bebetelhem
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 2
Zeyhuda
Bebetelhem
Awald elet
T’iros

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 3
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem
Awald elet

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 4
T’iros
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 5
Teweldo Iyesus
Bebetelhem
Bebetelhem
Beyhuda

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 6
Bebetelhem
Teweldo Iyesus
Bebetelhem
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 7
Beyhuda
Bebetelhem
Yet’iros lijoch
Hulu

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 8
Yan gize yisegdualu
Yan gize yisegdualu
Bebetelhem
Yet’iros lijoch

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 9
Hulu
Yan gize yisegdualu
Yan gize yisegdualu
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 10
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 11
Bebetelhem
Tewelde Iyesus
Bebetelhem
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 12
Zeyhuda
Bebetelhem
Awald elet
T’iros

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 13
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem
Awald elet

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 14
T’iros
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 1
በቤተልሔም
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 2
ዘይሁዳ
በቤተልሔም
አዋልድ እለት
ጢሮስ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 3
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም
አዋልድ እለት

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 4
ጢሮስ
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 5
ተወልዶ ኢየሱስ
በቤተልሔም
በቤተልሔም
በይሁዳ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 6
በቤተልሔም
ተወልዶ ኢየሱስ
በቤተልሔም
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 7
በይሁዳ
በቤተልሔም
የጢሮስ ልጆች
ሁሉ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 8
ያን ጊዜ ይሰግዱአሉ
ያን ጊዜ ይሰግዱአሉ
በቤተልሔም
የጢሮስ ልጆች

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 9
ሁሉ
ያን ጊዜ ይሰግዱአሉ
ያን ጊዜ ይሰግዱአሉ
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 10
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 11
በቤተልሔም
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 12
ዘይሁዳ
በቤተልሔም
አዋልድ እለት
ጢሮስ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 13
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም
አዋልድ እለት

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 14
ጢሮስ
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ',
        lyrics_transliteration = 'CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 1
Bebetelhem
Tewelde Iyesus
Bebetelhem
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 2
Zeyhuda
Bebetelhem
Awald elet
T’iros

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 3
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem
Awald elet

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 4
T’iros
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 5
Teweldo Iyesus
Bebetelhem
Bebetelhem
Beyhuda

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 6
Bebetelhem
Teweldo Iyesus
Bebetelhem
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 7
Beyhuda
Bebetelhem
Yet’iros lijoch
Hulu

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 8
Yan gize yisegdualu
Yan gize yisegdualu
Bebetelhem
Yet’iros lijoch

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 9
Hulu
Yan gize yisegdualu
Yan gize yisegdualu
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 10
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 11
Bebetelhem
Tewelde Iyesus
Bebetelhem
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 12
Zeyhuda
Bebetelhem
Awald elet
T’iros

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 13
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem
Awald elet

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 14
T’iros
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem

CHORUS
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4212bc0d-c218-432e-a2da-892e4ab48071'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 1
በቤተልሔም
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 2
ዘይሁዳ
በቤተልሔም
አዋልድ እለት
ጢሮስ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 3
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም
አዋልድ እለት

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 4
ጢሮስ
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 5
ተወልዶ ኢየሱስ
በቤተልሔም
በቤተልሔም
በይሁዳ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 6
በቤተልሔም
ተወልዶ ኢየሱስ
በቤተልሔም
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 7
በይሁዳ
በቤተልሔም
የጢሮስ ልጆች
ሁሉ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 8
ያን ጊዜ ይሰግዱአሉ
ያን ጊዜ ይሰግዱአሉ
በቤተልሔም
የጢሮስ ልጆች

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 9
ሁሉ
ያን ጊዜ ይሰግዱአሉ
ያን ጊዜ ይሰግዱአሉ
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 10
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 11
በቤተልሔም
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 12
ዘይሁዳ
በቤተልሔም
አዋልድ እለት
ጢሮስ

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 13
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም
አዋልድ እለት

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 14
ጢሮስ
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም

CHORUS
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4212bc0d-c218-432e-a2da-892e4ab48071'::uuid, 'tewelide-iyesus', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dinigil-kewededishign ("Dinigil Kewededishign")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '424bda66-00df-4261-b5b3-33544e951a66'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 1
ማርያም ጣዕምሽን - በአፌ አኑሮታል
አንቺ ከወደድሽኝ - ልጅሽ ይወደኛል
ልጅሽ ከወደደኝ - ማን ይቃወመኛል(፪)
በኪዳንሽ ታምና - ነፍሴ አንቺን ትሻለች

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 2
ሲመሽም ሲነጋ - ማርያም ትላለች
ባ''ንደበቴ አኑሮት - ልጅሽ ጣዕምሽን
ዘውትር እጠራለሁ - ማርያም ስምሽን
ከጌታ አስታረቅሽኝ - ካ''ምላክ አማለድሽኝ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 3
በደሌን ሳታዪ - እናቴ ወደድሽኝ
ምልጃሽ እያገዘኝ - ቆሜ ታየሁ ዛሬን
ሙሉ ሰው አ''ርገሽኝ - አፈለኩ ዝማሬን
ከፊትሽ ሞገስን - እንዳገኝ አድርጊኝ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 4
ዘላለም በምግባር - በሃይማኖት አትጊኝ
ልቤ እያፈለቀ - ውዳሴ ምስጋና
ድንግል ሆይ! ለክብርሽ - እቀኛለሁ ገና
መዳንና ሰላም - ለቤቴ የሆነው

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 5
ኪዳነ ምሕረት - ጽዮን በምልጃሽ ነው
ጓዳዬን ጎብኝተሽ - ሰፈነ በረከት
ረድኤት ያስገኛል - ወዳ''ንቺ መመልከት።
አፍቅርኒ እንበለ ንትጋ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 6
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 1
Maryam t’aemshn - beafe anurotal
Anchi kewededshgn - lijsh yiwedegnal
Lijsh kewededegn - man yiqawemegnal (2)
Bekidansh tamna - nefse anchin tishalech

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 2
Simeshm sinega - Maryam tilalech
Ba''nidebete anurot - lijsh t’aemshn
Zewtr et’eralehu - Maryam simshn
Kegeta astareqshgn - ka''milak amaledshgn

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 3
Bedelen satayi - enate wededshgn
Miljash eyagezegn - qome tayehu zaren
Mulu sew a''rigeshgn - afeleku zimaren
Kefitsh mogesn - endagegn adrgign

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 4
Zelalem bemgbar - behaymanot atgign
Libe eyafeleqe - widase misgana
Dingil hoy! lekbrsh - eqegnalehu gena
Medanna selam - lebete yehonew

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 5
Kidane mihret - ts’yon bemljash new
Gwadayen gobgntesh - sefene bereket
Redet yasgegnal - weda''nichi memelket.
Afqrni enbele nitga

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 6
Lebese dem wesga
Zeyeabi emz iyehess ts’ega

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 1
ማርያም ጣዕምሽን - በአፌ አኑሮታል
አንቺ ከወደድሽኝ - ልጅሽ ይወደኛል
ልጅሽ ከወደደኝ - ማን ይቃወመኛል(፪)
በኪዳንሽ ታምና - ነፍሴ አንቺን ትሻለች

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 2
ሲመሽም ሲነጋ - ማርያም ትላለች
ባ''ንደበቴ አኑሮት - ልጅሽ ጣዕምሽን
ዘውትር እጠራለሁ - ማርያም ስምሽን
ከጌታ አስታረቅሽኝ - ካ''ምላክ አማለድሽኝ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 3
በደሌን ሳታዪ - እናቴ ወደድሽኝ
ምልጃሽ እያገዘኝ - ቆሜ ታየሁ ዛሬን
ሙሉ ሰው አ''ርገሽኝ - አፈለኩ ዝማሬን
ከፊትሽ ሞገስን - እንዳገኝ አድርጊኝ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 4
ዘላለም በምግባር - በሃይማኖት አትጊኝ
ልቤ እያፈለቀ - ውዳሴ ምስጋና
ድንግል ሆይ! ለክብርሽ - እቀኛለሁ ገና
መዳንና ሰላም - ለቤቴ የሆነው

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 5
ኪዳነ ምሕረት - ጽዮን በምልጃሽ ነው
ጓዳዬን ጎብኝተሽ - ሰፈነ በረከት
ረድኤት ያስገኛል - ወዳ''ንቺ መመልከት።
አፍቅርኒ እንበለ ንትጋ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 6
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል',
        lyrics_transliteration = 'CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 1
Maryam t’aemshn - beafe anurotal
Anchi kewededshgn - lijsh yiwedegnal
Lijsh kewededegn - man yiqawemegnal (2)
Bekidansh tamna - nefse anchin tishalech

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 2
Simeshm sinega - Maryam tilalech
Ba''nidebete anurot - lijsh t’aemshn
Zewtr et’eralehu - Maryam simshn
Kegeta astareqshgn - ka''milak amaledshgn

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 3
Bedelen satayi - enate wededshgn
Miljash eyagezegn - qome tayehu zaren
Mulu sew a''rigeshgn - afeleku zimaren
Kefitsh mogesn - endagegn adrgign

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 4
Zelalem bemgbar - behaymanot atgign
Libe eyafeleqe - widase misgana
Dingil hoy! lekbrsh - eqegnalehu gena
Medanna selam - lebete yehonew

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 5
Kidane mihret - ts’yon bemljash new
Gwadayen gobgntesh - sefene bereket
Redet yasgegnal - weda''nichi memelket.
Afqrni enbele nitga

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 6
Lebese dem wesga
Zeyeabi emz iyehess ts’ega

CHORUS
Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '424bda66-00df-4261-b5b3-33544e951a66'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 1
ማርያም ጣዕምሽን - በአፌ አኑሮታል
አንቺ ከወደድሽኝ - ልጅሽ ይወደኛል
ልጅሽ ከወደደኝ - ማን ይቃወመኛል(፪)
በኪዳንሽ ታምና - ነፍሴ አንቺን ትሻለች

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 2
ሲመሽም ሲነጋ - ማርያም ትላለች
ባ''ንደበቴ አኑሮት - ልጅሽ ጣዕምሽን
ዘውትር እጠራለሁ - ማርያም ስምሽን
ከጌታ አስታረቅሽኝ - ካ''ምላክ አማለድሽኝ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 3
በደሌን ሳታዪ - እናቴ ወደድሽኝ
ምልጃሽ እያገዘኝ - ቆሜ ታየሁ ዛሬን
ሙሉ ሰው አ''ርገሽኝ - አፈለኩ ዝማሬን
ከፊትሽ ሞገስን - እንዳገኝ አድርጊኝ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 4
ዘላለም በምግባር - በሃይማኖት አትጊኝ
ልቤ እያፈለቀ - ውዳሴ ምስጋና
ድንግል ሆይ! ለክብርሽ - እቀኛለሁ ገና
መዳንና ሰላም - ለቤቴ የሆነው

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 5
ኪዳነ ምሕረት - ጽዮን በምልጃሽ ነው
ጓዳዬን ጎብኝተሽ - ሰፈነ በረከት
ረድኤት ያስገኛል - ወዳ''ንቺ መመልከት።
አፍቅርኒ እንበለ ንትጋ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 6
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ

CHORUS
አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '424bda66-00df-4261-b5b3-33544e951a66'::uuid, 'dinigil-kewededishign', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tv-eyesus-yu-smu ("TV: Eyesus Yu Smu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e1d6fcf3-0a61-4450-9627-4a85218bf90c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 1
ወዲ ድንግል ማርያም ስጋይ ዝለበሰ
ፈራዲ ልዑል ኣምላኽ ክቡር ደሙ ዘፍሰሰ
ንስለ ፍቅሪ ሰብ ብፍቃዱ ዝተፈርደ
መከራ ንኽቕበል ካብ ሰማይ ወረደ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 2
ኢየሱስ ክርስቶስ እግዚአብሔር ባዕሉ
ንስለ ፍቕሪ ''ንድዩ ኣብ መስቀል ዉዒሉ
ዕጣን ንኣምላኽነቱ ወርቂ ንንግስነቱ
ከርበ''ዩ ዝተሓረየሉ ነቲ መሪር ሞቱ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 3
ንዓይኒ ዘገርም ዉዕለቱ ክሓስቦ
ፍቕሩ ይገርመኒ ሞሳ ዘይርከቦ
ኢየሱስ ኣምላኸይ ናይ ነፍሰይ ፈዉሲ
ክርስቶስ ክቡር ኣምላኽ ሓዘነይ ደባሲ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 1
Wedi Dingil Maryam sigay zilebese
Feradi liul amlaኽ kibur demu zefsese
Nisle fiqri seb bifqadu ziteferde
Mekera niኽቕbel kab semay werede

CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 2
Iyesus Kristos Egziabher baelu
Nisle fiቕri ''nidyu ab mesqel wuilu
Et’an niamlaኽnetu werqi ningsnetu
Kerbe''yu zitehareyelu neti merir motu

CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 3
Niayni zegerm wueletu kihasbo
Fiቕru yigermeni mosa zeyrkebo
Iyesus amlaኸy nay nefsey fewusi
Kristos kibur amlaኽ hazeney debasi

CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 1
ወዲ ድንግል ማርያም ስጋይ ዝለበሰ
ፈራዲ ልዑል ኣምላኽ ክቡር ደሙ ዘፍሰሰ
ንስለ ፍቅሪ ሰብ ብፍቃዱ ዝተፈርደ
መከራ ንኽቕበል ካብ ሰማይ ወረደ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 2
ኢየሱስ ክርስቶስ እግዚአብሔር ባዕሉ
ንስለ ፍቕሪ ''ንድዩ ኣብ መስቀል ዉዒሉ
ዕጣን ንኣምላኽነቱ ወርቂ ንንግስነቱ
ከርበ''ዩ ዝተሓረየሉ ነቲ መሪር ሞቱ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 3
ንዓይኒ ዘገርም ዉዕለቱ ክሓስቦ
ፍቕሩ ይገርመኒ ሞሳ ዘይርከቦ
ኢየሱስ ኣምላኸይ ናይ ነፍሰይ ፈዉሲ
ክርስቶስ ክቡር ኣምላኽ ሓዘነይ ደባሲ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ',
        lyrics_transliteration = 'CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 1
Wedi Dingil Maryam sigay zilebese
Feradi liul amlaኽ kibur demu zefsese
Nisle fiqri seb bifqadu ziteferde
Mekera niኽቕbel kab semay werede

CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 2
Iyesus Kristos Egziabher baelu
Nisle fiቕri ''nidyu ab mesqel wuilu
Et’an niamlaኽnetu werqi ningsnetu
Kerbe''yu zitehareyelu neti merir motu

CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 3
Niayni zegerm wueletu kihasbo
Fiቕru yigermeni mosa zeyrkebo
Iyesus amlaኸy nay nefsey fewusi
Kristos kibur amlaኽ hazeney debasi

CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e1d6fcf3-0a61-4450-9627-4a85218bf90c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 1
ወዲ ድንግል ማርያም ስጋይ ዝለበሰ
ፈራዲ ልዑል ኣምላኽ ክቡር ደሙ ዘፍሰሰ
ንስለ ፍቅሪ ሰብ ብፍቃዱ ዝተፈርደ
መከራ ንኽቕበል ካብ ሰማይ ወረደ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 2
ኢየሱስ ክርስቶስ እግዚአብሔር ባዕሉ
ንስለ ፍቕሪ ''ንድዩ ኣብ መስቀል ዉዒሉ
ዕጣን ንኣምላኽነቱ ወርቂ ንንግስነቱ
ከርበ''ዩ ዝተሓረየሉ ነቲ መሪር ሞቱ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 3
ንዓይኒ ዘገርም ዉዕለቱ ክሓስቦ
ፍቕሩ ይገርመኒ ሞሳ ዘይርከቦ
ኢየሱስ ኣምላኸይ ናይ ነፍሰይ ፈዉሲ
ክርስቶስ ክቡር ኣምላኽ ሓዘነይ ደባሲ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e1d6fcf3-0a61-4450-9627-4a85218bf90c'::uuid, 'tv-eyesus-yu-smu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- itti-hin-leeyya-u-angafa-faarfattootaa-dn-firaanol-moosisaa-faarfannaa-d ("Itti hin leeyya'u Angafa Faarfattootaa Dn Firaanol Moosisaa Faarfannaa Durii")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '272a06cf-7587-4c5e-ae28-fb65fc0768bc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 1
Argeetan si hubadhee xibraados gamasittii
Ati abba hundumaa sorraa gabaa shaniitii
Amala nama hundaa si qofatu danda''aa
Waaqolii hundaa keessaa maaltu hamma kee gahaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 2
Maltuu hamma ke gahaa
Bari''a lafaa ka''ee gara keetii fiiguun koo
Iccitii gara kootii hiike sitti himachuun koo
Mana keeti na fiddee yaa waaq situ na tiksee

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 3
Gooftaa si faarfachuun koo hundaa na dagachiisee
Hundumaa na dhiisisee
Maalinuu sin qixxeessu hundaarran si fo''adhaa
Jaalala keet naaf addaa kanaaf si mararafadha

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 4
Sagantaa koo si qofa hin karoorsu kan biraa
Manni kees mana kootii gaddisa bara baraa
Galgalli koo si biraa
Addunyaan waa''ee keetii dhiphatte walrakkisaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 5
Inno ilma yooseffi tokko raajota keessa
Ati ija koo naaf bannaan Si hubadheera gooftaa
Sagalee hundaa uumte ilma waaqa jiraataa
Elshaadayidha gofta

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 1
Argeetan si hubadhee xibraados gamasittii
Ati abba hundumaa sorraa gabaa shaniitii
Amala nama hundaa si qofatu danda''aa
Waaqolii hundaa keessaa maaltu hamma kee gahaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 2
Maltuu hamma ke gahaa
Bari''a lafaa ka''ee gara keetii fiiguun koo
Iccitii gara kootii hiike sitti himachuun koo
Mana keeti na fiddee yaa waaq situ na tiksee

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 3
Gooftaa si faarfachuun koo hundaa na dagachiisee
Hundumaa na dhiisisee
Maalinuu sin qixxeessu hundaarran si fo''adhaa
Jaalala keet naaf addaa kanaaf si mararafadha

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 4
Sagantaa koo si qofa hin karoorsu kan biraa
Manni kees mana kootii gaddisa bara baraa
Galgalli koo si biraa
Addunyaan waa''ee keetii dhiphatte walrakkisaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 5
Inno ilma yooseffi tokko raajota keessa
Ati ija koo naaf bannaan Si hubadheera gooftaa
Sagalee hundaa uumte ilma waaqa jiraataa
Elshaadayidha gofta

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 1
Argeetan si hubadhee xibraados gamasittii
Ati abba hundumaa sorraa gabaa shaniitii
Amala nama hundaa si qofatu danda''aa
Waaqolii hundaa keessaa maaltu hamma kee gahaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 2
Maltuu hamma ke gahaa
Bari''a lafaa ka''ee gara keetii fiiguun koo
Iccitii gara kootii hiike sitti himachuun koo
Mana keeti na fiddee yaa waaq situ na tiksee

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 3
Gooftaa si faarfachuun koo hundaa na dagachiisee
Hundumaa na dhiisisee
Maalinuu sin qixxeessu hundaarran si fo''adhaa
Jaalala keet naaf addaa kanaaf si mararafadha

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 4
Sagantaa koo si qofa hin karoorsu kan biraa
Manni kees mana kootii gaddisa bara baraa
Galgalli koo si biraa
Addunyaan waa''ee keetii dhiphatte walrakkisaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 5
Inno ilma yooseffi tokko raajota keessa
Ati ija koo naaf bannaan Si hubadheera gooftaa
Sagalee hundaa uumte ilma waaqa jiraataa
Elshaadayidha gofta

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo',
        lyrics_transliteration = 'CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 1
Argeetan si hubadhee xibraados gamasittii
Ati abba hundumaa sorraa gabaa shaniitii
Amala nama hundaa si qofatu danda''aa
Waaqolii hundaa keessaa maaltu hamma kee gahaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 2
Maltuu hamma ke gahaa
Bari''a lafaa ka''ee gara keetii fiiguun koo
Iccitii gara kootii hiike sitti himachuun koo
Mana keeti na fiddee yaa waaq situ na tiksee

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 3
Gooftaa si faarfachuun koo hundaa na dagachiisee
Hundumaa na dhiisisee
Maalinuu sin qixxeessu hundaarran si fo''adhaa
Jaalala keet naaf addaa kanaaf si mararafadha

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 4
Sagantaa koo si qofa hin karoorsu kan biraa
Manni kees mana kootii gaddisa bara baraa
Galgalli koo si biraa
Addunyaan waa''ee keetii dhiphatte walrakkisaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 5
Inno ilma yooseffi tokko raajota keessa
Ati ija koo naaf bannaan Si hubadheera gooftaa
Sagalee hundaa uumte ilma waaqa jiraataa
Elshaadayidha gofta

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo',
        updated_at = clock_timestamp()::text
    WHERE import_id = '272a06cf-7587-4c5e-ae28-fb65fc0768bc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 1
Argeetan si hubadhee xibraados gamasittii
Ati abba hundumaa sorraa gabaa shaniitii
Amala nama hundaa si qofatu danda''aa
Waaqolii hundaa keessaa maaltu hamma kee gahaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 2
Maltuu hamma ke gahaa
Bari''a lafaa ka''ee gara keetii fiiguun koo
Iccitii gara kootii hiike sitti himachuun koo
Mana keeti na fiddee yaa waaq situ na tiksee

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 3
Gooftaa si faarfachuun koo hundaa na dagachiisee
Hundumaa na dhiisisee
Maalinuu sin qixxeessu hundaarran si fo''adhaa
Jaalala keet naaf addaa kanaaf si mararafadha

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 4
Sagantaa koo si qofa hin karoorsu kan biraa
Manni kees mana kootii gaddisa bara baraa
Galgalli koo si biraa
Addunyaan waa''ee keetii dhiphatte walrakkisaa

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 5
Inno ilma yooseffi tokko raajota keessa
Ati ija koo naaf bannaan Si hubadheera gooftaa
Sagalee hundaa uumte ilma waaqa jiraataa
Elshaadayidha gofta

CHORUS
Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '272a06cf-7587-4c5e-ae28-fb65fc0768bc'::uuid, 'itti-hin-leeyya-u-angafa-faarfattootaa-dn-firaanol-moosisaa-faarfannaa-d', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anichin-bicha-betelihem ("Anichin Bicha Betelihem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2c01227e-f868-4103-a791-d1a5dc646c2a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 1
አንቺን ብቻ ቀራንዮ
አንቺን ብቻ በኮረብታ
ዮሴፍንም አላየንም
ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 3
ህጻኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 4
የግብፅን በረሃ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነርሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 5
ሃሙስ እለት ፋሲካን ሲበሉ ያመሹ
አርብ እለት ተነስተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበረ ላይከዱት መሃላ
ድንግል ካንቺ በቀር ማን ነበረ ሌላ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 6
በሰላሳው ዘመን በስጋ ወራቱ
መች ነበሩ ከቶ ደቀ መዛሙርቱ
የእጆቹን ተዓምራት ቀን ከሌት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ነበርሽ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 1
Anchin bicha qeranyo
Anchin bicha bekorebta
Yosefnm alayenm
Litost’ra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshiw yenebersh anchi bicha enatu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 4
Yegbts’n bereha abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enersu eyeferu
Anchin bicha titew bemender neberu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 5
Hamus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew nebere laykedut mehala
Dingil kanchi beqer man nebere lela (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 6
Beselasaw zemen besga weratu
Mech neberu keto deqe mezamurtu
Yeejochun teamrat qen kelet eyayesh
Beqalu birtat fit anchi bicha nebersh (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel bemotu
Abreshiw yenebersh anchi bicha enatu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 1
አንቺን ብቻ ቀራንዮ
አንቺን ብቻ በኮረብታ
ዮሴፍንም አላየንም
ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 3
ህጻኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 4
የግብፅን በረሃ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነርሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 5
ሃሙስ እለት ፋሲካን ሲበሉ ያመሹ
አርብ እለት ተነስተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበረ ላይከዱት መሃላ
ድንግል ካንቺ በቀር ማን ነበረ ሌላ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 6
በሰላሳው ዘመን በስጋ ወራቱ
መች ነበሩ ከቶ ደቀ መዛሙርቱ
የእጆቹን ተዓምራት ቀን ከሌት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ነበርሽ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም',
        lyrics_transliteration = 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 1
Anchin bicha qeranyo
Anchin bicha bekorebta
Yosefnm alayenm
Litost’ra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshiw yenebersh anchi bicha enatu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 4
Yegbts’n bereha abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enersu eyeferu
Anchin bicha titew bemender neberu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 5
Hamus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew nebere laykedut mehala
Dingil kanchi beqer man nebere lela (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 6
Beselasaw zemen besga weratu
Mech neberu keto deqe mezamurtu
Yeejochun teamrat qen kelet eyayesh
Beqalu birtat fit anchi bicha nebersh (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel bemotu
Abreshiw yenebersh anchi bicha enatu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2c01227e-f868-4103-a791-d1a5dc646c2a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 1
አንቺን ብቻ ቀራንዮ
አንቺን ብቻ በኮረብታ
ዮሴፍንም አላየንም
ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 3
ህጻኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 4
የግብፅን በረሃ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነርሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 5
ሃሙስ እለት ፋሲካን ሲበሉ ያመሹ
አርብ እለት ተነስተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበረ ላይከዱት መሃላ
ድንግል ካንቺ በቀር ማን ነበረ ሌላ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 6
በሰላሳው ዘመን በስጋ ወራቱ
መች ነበሩ ከቶ ደቀ መዛሙርቱ
የእጆቹን ተዓምራት ቀን ከሌት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ነበርሽ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2c01227e-f868-4103-a791-d1a5dc646c2a'::uuid, 'anichin-bicha-betelihem', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ene-ehonin-643 ("Ene Ehonin")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2ed01e24-60b9-49f8-98e1-1159ac766be4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 1
ይሁዳ ነኝ ወይስ ጴጥሮስ ሐሙስ ማታ እኔ ማነኝ
የዛሬን መቆሜን እንጂ አላውቅም መጨረሻዬን
እውድሃለውኝ ብዬ የዛሬን እናገራለሁ
አላውቅህም ብዬ እንዳልናገር ስለነገ ግን እፈራለሁ

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 2
ስንት የአጥቢያ ኮከቦች ለአንተ ዘምረውልህ ወደቁ
በሰማይ መቅደስህ አጥነው በትዕቢት ረግፈው አለቁ
እፈራለሁ እኔም ለራሴ መንገዴን ንገረኝ ጌታ
ጠዋት በዘመርኩበት አፍ እንዳልሳደብ ማታ

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 3
ሳጥናኤልም መልአክ ነበር ይሁዳም ሐዋርያ
ንስጥሮስም ጳጳስ ነበር አርዮስም ባለሙያ
እነዚህ ሁሉ ከወጡ ከአምላካቸው ጉያ
ደካማ ለሆንኩትማ የት ይሆን የኔ መገኛ?

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 4
ታናሹን ጅማርዬን አንተው ታላቅም አድርግልኝ
ነበረች ከመባል ፈተና አንተው በፍቅርህ አድነኝ
ያስጀመርከኝ አምላኬ እንግዲህ መንገዴን አደራ
በፊትህ ቆሜ ለማመስገን አብቃኝ ከቅዱሳን ጋራ

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?

VERSE 1
Yihuda negn weys p’et’ros hemus mata ene manegn
Yezaren meqomen enji alawqm mech’ereshayen
Ewdhalewgn biye yezaren enageralehu
Alawqhm biye endalnager silenege gin eferalehu

CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?

VERSE 2
Sint yeat’biya kokeboch leante zemrewlh wedequ
Besemay meqdesh at’new betebit regfew alequ
Eferalehu enem lerase mengeden nigeregn Geta
T’ewat bezemerkubet af endalsadeb mata

CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?

VERSE 3
Sat’naelm melak neber yihudam hewarya
Nist’rosm p’ap’as neber aryosm balemuya
Enezih hulu kewet’u keamlakachew guya
Dekama lehonkutma yet yihon yene megegna?

CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?

VERSE 4
Tanashun jimaryen antew talaqm adrglgn
Neberech kemebal fetena antew befqrh adnegn
Yasjemerkegn amlake engdih mengeden adera
Befith qome lemamesgen abqagn keqdusan gara

CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 1
ይሁዳ ነኝ ወይስ ጴጥሮስ ሐሙስ ማታ እኔ ማነኝ
የዛሬን መቆሜን እንጂ አላውቅም መጨረሻዬን
እውድሃለውኝ ብዬ የዛሬን እናገራለሁ
አላውቅህም ብዬ እንዳልናገር ስለነገ ግን እፈራለሁ

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 2
ስንት የአጥቢያ ኮከቦች ለአንተ ዘምረውልህ ወደቁ
በሰማይ መቅደስህ አጥነው በትዕቢት ረግፈው አለቁ
እፈራለሁ እኔም ለራሴ መንገዴን ንገረኝ ጌታ
ጠዋት በዘመርኩበት አፍ እንዳልሳደብ ማታ

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 3
ሳጥናኤልም መልአክ ነበር ይሁዳም ሐዋርያ
ንስጥሮስም ጳጳስ ነበር አርዮስም ባለሙያ
እነዚህ ሁሉ ከወጡ ከአምላካቸው ጉያ
ደካማ ለሆንኩትማ የት ይሆን የኔ መገኛ?

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 4
ታናሹን ጅማርዬን አንተው ታላቅም አድርግልኝ
ነበረች ከመባል ፈተና አንተው በፍቅርህ አድነኝ
ያስጀመርከኝ አምላኬ እንግዲህ መንገዴን አደራ
በፊትህ ቆሜ ለማመስገን አብቃኝ ከቅዱሳን ጋራ

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?',
        lyrics_transliteration = 'CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?

VERSE 1
Yihuda negn weys p’et’ros hemus mata ene manegn
Yezaren meqomen enji alawqm mech’ereshayen
Ewdhalewgn biye yezaren enageralehu
Alawqhm biye endalnager silenege gin eferalehu

CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?

VERSE 2
Sint yeat’biya kokeboch leante zemrewlh wedequ
Besemay meqdesh at’new betebit regfew alequ
Eferalehu enem lerase mengeden nigeregn Geta
T’ewat bezemerkubet af endalsadeb mata

CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?

VERSE 3
Sat’naelm melak neber yihudam hewarya
Nist’rosm p’ap’as neber aryosm balemuya
Enezih hulu kewet’u keamlakachew guya
Dekama lehonkutma yet yihon yene megegna?

CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?

VERSE 4
Tanashun jimaryen antew talaqm adrglgn
Neberech kemebal fetena antew befqrh adnegn
Yasjemerkegn amlake engdih mengeden adera
Befith qome lemamesgen abqagn keqdusan gara

CHORUS
Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2ed01e24-60b9-49f8-98e1-1159ac766be4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 1
ይሁዳ ነኝ ወይስ ጴጥሮስ ሐሙስ ማታ እኔ ማነኝ
የዛሬን መቆሜን እንጂ አላውቅም መጨረሻዬን
እውድሃለውኝ ብዬ የዛሬን እናገራለሁ
አላውቅህም ብዬ እንዳልናገር ስለነገ ግን እፈራለሁ

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 2
ስንት የአጥቢያ ኮከቦች ለአንተ ዘምረውልህ ወደቁ
በሰማይ መቅደስህ አጥነው በትዕቢት ረግፈው አለቁ
እፈራለሁ እኔም ለራሴ መንገዴን ንገረኝ ጌታ
ጠዋት በዘመርኩበት አፍ እንዳልሳደብ ማታ

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 3
ሳጥናኤልም መልአክ ነበር ይሁዳም ሐዋርያ
ንስጥሮስም ጳጳስ ነበር አርዮስም ባለሙያ
እነዚህ ሁሉ ከወጡ ከአምላካቸው ጉያ
ደካማ ለሆንኩትማ የት ይሆን የኔ መገኛ?

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 4
ታናሹን ጅማርዬን አንተው ታላቅም አድርግልኝ
ነበረች ከመባል ፈተና አንተው በፍቅርህ አድነኝ
ያስጀመርከኝ አምላኬ እንግዲህ መንገዴን አደራ
በፊትህ ቆሜ ለማመስገን አብቃኝ ከቅዱሳን ጋራ

CHORUS
አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2ed01e24-60b9-49f8-98e1-1159ac766be4'::uuid, 'ene-ehonin-643', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- man-yimeramer ("Man Yimeramer")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '824b38e2-6f65-4f9a-a054-adc53d3004b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 1
ማን ይመራመር?
"በቀዳማይ ዕለት ፣ ቀዳማይ ሰዓት፥
መፍጠር እስክትጀምር አራት ባሕርያት፥
ለምን አልፈጠርክም ቀድመህ?" ቢል ደራሲ፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 2
አይመረመርም "ቅድመ ዓለም ነጋሢ"
ያንተን ሥራ. . . .
እሳትና ውኃ ነፋስና መሬት፥
"እም ኀበ አልቦ" መጡ ካለመኖር እንዴት?

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 3
በአርምሞ ሰባት ፣ በቃሉም ዐሥራ አራት፥
የመፍጠሩን ጥበብ ማን ሊመረምራት?
ያንተን ሥራ
ስፉህ ፣ ምጡቅ መልኩን በእጁ ፣ ባ''ፈር መሣል፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 4
በእስትፋንሱ ነፍስ ሕያው ፣ በፀጋም ልጅ ማስባል፥
"የፍጥረቱም ገዢ ታደርገው ዘንድ ሰው..
ምንድር ነው?" ያለ ዳዊት መቼ መረመረው?
ያንተን ሥራ. . .

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 5
ከፈጠረበትም ያዳነበት ጥበብ፥
የሚረቅ ነውና ሥጋዌው ሊታሰብ፥
እንደ ሕርያቆስ በነፋስ ትከሻ፥
ተጭነን መብረርን መመርመር አንሻ!

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 6
ወደ ቀድሞ ነገር በእምነት መመለሻ፥
ጸሎተ ሃይማኖት ነው መነሻ መድረሻ።
ያንተን ሥራ
ስለዚያችም ሰዓት ፣ ዕለተ ምጽአት፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 7
ከአብ ብቻ በቀር በግብር ማን ሊያውቃት፥
ወልድ በቃልነቱ ትለፍ ሳይል ዓለሙን፥
ሥጋውን በልተነው ተቀብለን ደሙን፥
"አይመረመሬው ሳይመራመረን"

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 8
በደል ተደምስሶ መንግሥቱን ይቸረን!
ያንተን ሥራ

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 1
Man yimeramer?
"beqedamay elet , qedamay seat:
Meft’er esktjemr arat bahryat:
Lemn alfet’erkm qedmeh?" bil derasi:

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 2
Aymeremerm "qidme alem negasi"
Yanten sira. . . .
Esatna wiha nefasna meret:
"em hebe albo" met’u kalemenor endet?

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 3
Bearmmo sebat , beqalum asra arat:
Yemeft’erun t’beb man limeremrat?
Yanten sira
Sifuh , mit’uq melkun beeju , ba''fer mesal:

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 4
Beestfansu nefs hiyaw , bets’egam lij masbal:
"yeft’retum gezhi tadergew zend sew..
Mindr new?" yale dawit meche meremerew?
Yanten sira. . .

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 5
Kefet’erebetm yadanebet t’beb:
Yemireq newna sigawew litaseb:
Ende hiryaqos benefas tikesha:
Tech’nen mebrern memermer ansha!

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 6
Wede qedmo neger beemnet memelesha:
Ts’elote haymanot new menesha medresha.
Yanten sira
Sileziyachm seat , elete mits’at:

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 7
Keab bicha beqer begbr man liyawqat:
Weld beqalnetu tilef sayl alemun:
Sigawn beltenew teqeblen demun:
"aymeremerew saymerameren"

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 8
Bedel tedemsso mengstun yicheren!
Yanten sira

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 1
ማን ይመራመር?
"በቀዳማይ ዕለት ፣ ቀዳማይ ሰዓት፥
መፍጠር እስክትጀምር አራት ባሕርያት፥
ለምን አልፈጠርክም ቀድመህ?" ቢል ደራሲ፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 2
አይመረመርም "ቅድመ ዓለም ነጋሢ"
ያንተን ሥራ. . . .
እሳትና ውኃ ነፋስና መሬት፥
"እም ኀበ አልቦ" መጡ ካለመኖር እንዴት?

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 3
በአርምሞ ሰባት ፣ በቃሉም ዐሥራ አራት፥
የመፍጠሩን ጥበብ ማን ሊመረምራት?
ያንተን ሥራ
ስፉህ ፣ ምጡቅ መልኩን በእጁ ፣ ባ''ፈር መሣል፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 4
በእስትፋንሱ ነፍስ ሕያው ፣ በፀጋም ልጅ ማስባል፥
"የፍጥረቱም ገዢ ታደርገው ዘንድ ሰው..
ምንድር ነው?" ያለ ዳዊት መቼ መረመረው?
ያንተን ሥራ. . .

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 5
ከፈጠረበትም ያዳነበት ጥበብ፥
የሚረቅ ነውና ሥጋዌው ሊታሰብ፥
እንደ ሕርያቆስ በነፋስ ትከሻ፥
ተጭነን መብረርን መመርመር አንሻ!

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 6
ወደ ቀድሞ ነገር በእምነት መመለሻ፥
ጸሎተ ሃይማኖት ነው መነሻ መድረሻ።
ያንተን ሥራ
ስለዚያችም ሰዓት ፣ ዕለተ ምጽአት፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 7
ከአብ ብቻ በቀር በግብር ማን ሊያውቃት፥
ወልድ በቃልነቱ ትለፍ ሳይል ዓለሙን፥
ሥጋውን በልተነው ተቀብለን ደሙን፥
"አይመረመሬው ሳይመራመረን"

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 8
በደል ተደምስሶ መንግሥቱን ይቸረን!
ያንተን ሥራ

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር',
        lyrics_transliteration = 'CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 1
Man yimeramer?
"beqedamay elet , qedamay seat:
Meft’er esktjemr arat bahryat:
Lemn alfet’erkm qedmeh?" bil derasi:

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 2
Aymeremerm "qidme alem negasi"
Yanten sira. . . .
Esatna wiha nefasna meret:
"em hebe albo" met’u kalemenor endet?

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 3
Bearmmo sebat , beqalum asra arat:
Yemeft’erun t’beb man limeremrat?
Yanten sira
Sifuh , mit’uq melkun beeju , ba''fer mesal:

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 4
Beestfansu nefs hiyaw , bets’egam lij masbal:
"yeft’retum gezhi tadergew zend sew..
Mindr new?" yale dawit meche meremerew?
Yanten sira. . .

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 5
Kefet’erebetm yadanebet t’beb:
Yemireq newna sigawew litaseb:
Ende hiryaqos benefas tikesha:
Tech’nen mebrern memermer ansha!

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 6
Wede qedmo neger beemnet memelesha:
Ts’elote haymanot new menesha medresha.
Yanten sira
Sileziyachm seat , elete mits’at:

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 7
Keab bicha beqer begbr man liyawqat:
Weld beqalnetu tilef sayl alemun:
Sigawn beltenew teqeblen demun:
"aymeremerew saymerameren"

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 8
Bedel tedemsso mengstun yicheren!
Yanten sira

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr',
        updated_at = clock_timestamp()::text
    WHERE import_id = '824b38e2-6f65-4f9a-a054-adc53d3004b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 1
ማን ይመራመር?
"በቀዳማይ ዕለት ፣ ቀዳማይ ሰዓት፥
መፍጠር እስክትጀምር አራት ባሕርያት፥
ለምን አልፈጠርክም ቀድመህ?" ቢል ደራሲ፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 2
አይመረመርም "ቅድመ ዓለም ነጋሢ"
ያንተን ሥራ. . . .
እሳትና ውኃ ነፋስና መሬት፥
"እም ኀበ አልቦ" መጡ ካለመኖር እንዴት?

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 3
በአርምሞ ሰባት ፣ በቃሉም ዐሥራ አራት፥
የመፍጠሩን ጥበብ ማን ሊመረምራት?
ያንተን ሥራ
ስፉህ ፣ ምጡቅ መልኩን በእጁ ፣ ባ''ፈር መሣል፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 4
በእስትፋንሱ ነፍስ ሕያው ፣ በፀጋም ልጅ ማስባል፥
"የፍጥረቱም ገዢ ታደርገው ዘንድ ሰው..
ምንድር ነው?" ያለ ዳዊት መቼ መረመረው?
ያንተን ሥራ. . .

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 5
ከፈጠረበትም ያዳነበት ጥበብ፥
የሚረቅ ነውና ሥጋዌው ሊታሰብ፥
እንደ ሕርያቆስ በነፋስ ትከሻ፥
ተጭነን መብረርን መመርመር አንሻ!

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 6
ወደ ቀድሞ ነገር በእምነት መመለሻ፥
ጸሎተ ሃይማኖት ነው መነሻ መድረሻ።
ያንተን ሥራ
ስለዚያችም ሰዓት ፣ ዕለተ ምጽአት፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 7
ከአብ ብቻ በቀር በግብር ማን ሊያውቃት፥
ወልድ በቃልነቱ ትለፍ ሳይል ዓለሙን፥
ሥጋውን በልተነው ተቀብለን ደሙን፥
"አይመረመሬው ሳይመራመረን"

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 8
በደል ተደምስሶ መንግሥቱን ይቸረን!
ያንተን ሥራ

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '824b38e2-6f65-4f9a-a054-adc53d3004b5'::uuid, 'man-yimeramer', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kibre-new ("Kibre New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '29799856-24e6-40bb-af4e-497cb5f1da03'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ 2

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 2
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ 2

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 3
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 4
አባቴ ነህና የምታስብ ለእኔ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 5
ተመስገን ተመስገን ጠዋትና ማታ 2

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 1
eyche yejhn tamrat
semche yeqalhn tmhrt
honyalehu mskr leedanyneth

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 2
sgan tewahdeh lenya megeleth 2
teketelkuh hulun neger nqe
medhenit mehonkn ewqe
kemelka beth tetelyalehu

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 3
yejhn bereket kante tegbalehu 2
rf yzhe lalars wedela
yayehu mereben stmola

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 4
mekabhelew bante medhne
emlake nehna yemtrara lene
ebate nehna yemtasb lene
chernet mhret kebezalny

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 5
lesmh wdase qne eleny
kbrena mogese ente neh geta
temesgen temesgen tewatna mata 2

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ 2

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 2
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ 2

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 3
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 4
አባቴ ነህና የምታስብ ለእኔ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 5
ተመስገን ተመስገን ጠዋትና ማታ 2

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2',
        lyrics_transliteration = 'CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 1
eyche yejhn tamrat
semche yeqalhn tmhrt
honyalehu mskr leedanyneth

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 2
sgan tewahdeh lenya megeleth 2
teketelkuh hulun neger nqe
medhenit mehonkn ewqe
kemelka beth tetelyalehu

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 3
yejhn bereket kante tegbalehu 2
rf yzhe lalars wedela
yayehu mereben stmola

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 4
mekabhelew bante medhne
emlake nehna yemtrara lene
ebate nehna yemtasb lene
chernet mhret kebezalny

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 5
lesmh wdase qne eleny
kbrena mogese ente neh geta
temesgen temesgen tewatna mata 2

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '29799856-24e6-40bb-af4e-497cb5f1da03'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ 2

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 2
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ 2

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 3
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 4
አባቴ ነህና የምታስብ ለእኔ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 5
ተመስገን ተመስገን ጠዋትና ማታ 2

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 1
eyche yejhn tamrat
semche yeqalhn tmhrt
honyalehu mskr leedanyneth

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 2
sgan tewahdeh lenya megeleth 2
teketelkuh hulun neger nqe
medhenit mehonkn ewqe
kemelka beth tetelyalehu

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 3
yejhn bereket kante tegbalehu 2
rf yzhe lalars wedela
yayehu mereben stmola

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 4
mekabhelew bante medhne
emlake nehna yemtrara lene
ebate nehna yemtasb lene
chernet mhret kebezalny

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 5
lesmh wdase qne eleny
kbrena mogese ente neh geta
temesgen temesgen tewatna mata 2

CHORUS
kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '29799856-24e6-40bb-af4e-497cb5f1da03'::uuid, 'kibre-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gelila-etiwi ("Gelila Etiwi")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '44027fdd-79d0-4a8f-a2f3-8443c98bb15f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 1
ስደቱ ይበቃሻል
ሄሮድስ ሞቷል ብሎ
ገብርኤል ነግሮሻል ገሊላ እትዊ
በእሳት ሰረገላ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 2
ኡራኤል ይመረሻል
ሀገረኪ ገሊላ እትዊ (፪)
የዝናቡ ጌታ ገሊላ እትዊ
እናት ሆነሽ ሳለ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 3
ሰይጣን በሰው አድሮ
እያስከለከለ
ውሃ ፀንቶብሽ
አፍራሽ ደርቆ ዋለ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 4
ይበቃል እናቴ
ረሀብ ጥማትሽ
ሂጂ ወደ ገሊላ
ወደ ዘመዶች

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 5
ሀገረኪ ገሊላ እትዊ (፪)
የሰማዕታት አክሊል ገሊላ እትዊ
የጻድቃን እናት
ባርከሽ ሰጠሻቸው

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 6
መከራንጨስደት
እኛም ይታደለን
የአንቺው በረከት
ሀገረኪ ገሊላ እትዊ (፬)

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 7
ገፅሽ ብሩህ መልካም
ልክ እንደ ፀሐይ
እግእዝትነ ማርያም
እሙ ለአዶናይ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 8
አይገባም ለአንቺ
መከራ ስቃይ ገሊላ እትዊ
ሀገረኪ ገሊላ እትዊ (፬)
ገሊላ ግቢ (፬) ሀገርሽ ገሊላ ግቢ (፪)

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 1
Sidetu yibeqashal
Herods motwal bilo
Gebriel negroshal gelila etwi
Beesat seregela

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 2
Urael yimereshal
Hegereki gelila etwi (2)
Yeznabu Geta gelila etwi
Enat honesh sale

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 3
Seyt’an besew adro
Eyaskelekele
Wiha ts’entobsh
Afrash derqo wale

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 4
Yibeqal enate
Reheb t’matsh
Hiji wede gelila
Wede zemedoch

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 5
Hegereki gelila etwi (2)
Yesemaetat aklil gelila etwi
Yets’adqan enat
Barkesh set’eshachew

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 6
Mekeranch’esdet
Egnam yitadelen
Yeanchiw bereket
Hegereki gelila etwi (4)

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 7
Gets’sh biruh melkam
Lik ende ts’ehey
Egeztne Maryam
Emu leadonay

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 8
Aygebam leanchi
Mekera siqay gelila etwi
Hegereki gelila etwi (4)
Gelila gibi (4) hegersh gelila gibi (2)

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 1
ስደቱ ይበቃሻል
ሄሮድስ ሞቷል ብሎ
ገብርኤል ነግሮሻል ገሊላ እትዊ
በእሳት ሰረገላ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 2
ኡራኤል ይመረሻል
ሀገረኪ ገሊላ እትዊ (፪)
የዝናቡ ጌታ ገሊላ እትዊ
እናት ሆነሽ ሳለ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 3
ሰይጣን በሰው አድሮ
እያስከለከለ
ውሃ ፀንቶብሽ
አፍራሽ ደርቆ ዋለ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 4
ይበቃል እናቴ
ረሀብ ጥማትሽ
ሂጂ ወደ ገሊላ
ወደ ዘመዶች

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 5
ሀገረኪ ገሊላ እትዊ (፪)
የሰማዕታት አክሊል ገሊላ እትዊ
የጻድቃን እናት
ባርከሽ ሰጠሻቸው

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 6
መከራንጨስደት
እኛም ይታደለን
የአንቺው በረከት
ሀገረኪ ገሊላ እትዊ (፬)

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 7
ገፅሽ ብሩህ መልካም
ልክ እንደ ፀሐይ
እግእዝትነ ማርያም
እሙ ለአዶናይ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 8
አይገባም ለአንቺ
መከራ ስቃይ ገሊላ እትዊ
ሀገረኪ ገሊላ እትዊ (፬)
ገሊላ ግቢ (፬) ሀገርሽ ገሊላ ግቢ (፪)

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ',
        lyrics_transliteration = 'CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 1
Sidetu yibeqashal
Herods motwal bilo
Gebriel negroshal gelila etwi
Beesat seregela

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 2
Urael yimereshal
Hegereki gelila etwi (2)
Yeznabu Geta gelila etwi
Enat honesh sale

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 3
Seyt’an besew adro
Eyaskelekele
Wiha ts’entobsh
Afrash derqo wale

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 4
Yibeqal enate
Reheb t’matsh
Hiji wede gelila
Wede zemedoch

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 5
Hegereki gelila etwi (2)
Yesemaetat aklil gelila etwi
Yets’adqan enat
Barkesh set’eshachew

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 6
Mekeranch’esdet
Egnam yitadelen
Yeanchiw bereket
Hegereki gelila etwi (4)

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 7
Gets’sh biruh melkam
Lik ende ts’ehey
Egeztne Maryam
Emu leadonay

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 8
Aygebam leanchi
Mekera siqay gelila etwi
Hegereki gelila etwi (4)
Gelila gibi (4) hegersh gelila gibi (2)

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi',
        updated_at = clock_timestamp()::text
    WHERE import_id = '44027fdd-79d0-4a8f-a2f3-8443c98bb15f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 1
ስደቱ ይበቃሻል
ሄሮድስ ሞቷል ብሎ
ገብርኤል ነግሮሻል ገሊላ እትዊ
በእሳት ሰረገላ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 2
ኡራኤል ይመረሻል
ሀገረኪ ገሊላ እትዊ (፪)
የዝናቡ ጌታ ገሊላ እትዊ
እናት ሆነሽ ሳለ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 3
ሰይጣን በሰው አድሮ
እያስከለከለ
ውሃ ፀንቶብሽ
አፍራሽ ደርቆ ዋለ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 4
ይበቃል እናቴ
ረሀብ ጥማትሽ
ሂጂ ወደ ገሊላ
ወደ ዘመዶች

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 5
ሀገረኪ ገሊላ እትዊ (፪)
የሰማዕታት አክሊል ገሊላ እትዊ
የጻድቃን እናት
ባርከሽ ሰጠሻቸው

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 6
መከራንጨስደት
እኛም ይታደለን
የአንቺው በረከት
ሀገረኪ ገሊላ እትዊ (፬)

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 7
ገፅሽ ብሩህ መልካም
ልክ እንደ ፀሐይ
እግእዝትነ ማርያም
እሙ ለአዶናይ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 8
አይገባም ለአንቺ
መከራ ስቃይ ገሊላ እትዊ
ሀገረኪ ገሊላ እትዊ (፬)
ገሊላ ግቢ (፬) ሀገርሽ ገሊላ ግቢ (፪)

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '44027fdd-79d0-4a8f-a2f3-8443c98bb15f'::uuid, 'gelila-etiwi', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gebriel-hayal ("Gebriel Hayal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd0a11343-d76b-466c-a834-cd05c8f629ae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 1
አዝ፡ //
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 2
ቆመህ ተገኘህ መሐከላቸው
አዝ፡ //
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 3
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ
አዝ፡ //
ቂርቆስም ፀና ሞተን ሳይፈራ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 4
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ
አዝ፡ //

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 5
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 1
CHORUS
Yets’natachew zinaw sisema
Keza babilon kemot ketema
Hits’anat salu bera emnetachew

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 2
Qomeh tegegneh mehekelachew
CHORUS
Wihaw sizel biyasdeneget’m
Beganochu wist’ binewawet’m

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 3
Ts’entew zemeru lijna enatu
Ante sitders keziya keesatu
CHORUS
Qirqosm ts’ena moten sayfera

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 4
Ante silaleh kenersu gara
Atfri alat silemn tifra
Amnew dil nesut yann mekera
CHORUS

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 5
Enem amnalehu adnegn biye
Fet’neh amaldegn kecher Getaye
Kifuwn zemen yemalfbet
Ts’natun sit’egn dil linsabet

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 1
አዝ፡ //
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 2
ቆመህ ተገኘህ መሐከላቸው
አዝ፡ //
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 3
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ
አዝ፡ //
ቂርቆስም ፀና ሞተን ሳይፈራ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 4
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ
አዝ፡ //

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 5
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን',
        lyrics_transliteration = 'CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 1
CHORUS
Yets’natachew zinaw sisema
Keza babilon kemot ketema
Hits’anat salu bera emnetachew

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 2
Qomeh tegegneh mehekelachew
CHORUS
Wihaw sizel biyasdeneget’m
Beganochu wist’ binewawet’m

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 3
Ts’entew zemeru lijna enatu
Ante sitders keziya keesatu
CHORUS
Qirqosm ts’ena moten sayfera

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 4
Ante silaleh kenersu gara
Atfri alat silemn tifra
Amnew dil nesut yann mekera
CHORUS

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 5
Enem amnalehu adnegn biye
Fet’neh amaldegn kecher Getaye
Kifuwn zemen yemalfbet
Ts’natun sit’egn dil linsabet

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd0a11343-d76b-466c-a834-cd05c8f629ae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 1
አዝ፡ //
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 2
ቆመህ ተገኘህ መሐከላቸው
አዝ፡ //
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 3
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ
አዝ፡ //
ቂርቆስም ፀና ሞተን ሳይፈራ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 4
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ
አዝ፡ //

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 5
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd0a11343-d76b-466c-a834-cd05c8f629ae'::uuid, 'gebriel-hayal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-4139 ("Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2a8990b2-c455-44e9-867c-4939edcd3266'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 1
እንካብ ዝተወልዱ ብዕብየት ትዝከር
ሕሹኽ በል ንጎይታይ ናብ ዳሱ ክጽንበር፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 2
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ገለ ተረኸብኩ ዕድል ተሳትፎ
ኣብቲ ክቡር ዕድመ ንስመይ ጸሓፎ፡ ዮሃንስ
እንካብ ዘለኹዎ ክግስግስ ብሓይሊ

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 3
ጎበዝ ረድኤትካ ንስጕመይ የሳሊ፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ዓርኩ ለመርዓዊ ትሰመይ፡ ወኣንተኒ ህጻን ነቢየ ልዑል !

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 4
ኣብቲ ዳስ ንጽህና ኩሉ ናዓለለ
ሰንኪ ክዳን መርዓ ካብ ሰበይ ከይፍለ፡ ዮሃንስ
ልብሲ ጥዑስ ልቢ ዘሳግር ናብ ሰማይ
ምስቲ ጸጕሪ ገመል ፈልቊ ስፈየለይ፡ ነቢየ ልዑል

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 5
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል !

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 6
ሰዓት ምስ ኣኸለ ምምጻእ ናይ መርዓዊ
ምስ ዘበርህ ቀንዴል ምሕረቱ ክጸዊ፡ ዮሃንስ
ትብሩኽ መንፈሱ ነፍሰይ ክማርኻ
ዘመን ፍረ ጌርካ ዓመተይ ባርካ፡ ነቢየ ልዑል

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 7
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል (2)

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 1
Enkab ziteweldu biebyet tizker
Hishuኽ bel nigoytay nab dasu kits’nber nebiye liul
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 2
Weanteni hits’an nebiye liul (2)
Gele tereኸbku edl tesatfo
Abti kibur edme nismey ts’ehafo yohans
Enkab zeleኹwo kigsgs bihayli

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 3
Gobez redetka nisgwmey yesali nebiye liul
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Arku lemerawi tisemey weanteni hits’an nebiye liul !

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 4
Abti das nits’hna kulu naalele
Senki kidan mera kab sebey keyfle yohans
Libsi t’us libi zesagr nab semay
Misti ts’egwri gemel felqwi sifeyeley nebiye liul

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 5
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Weanteni hits’an nebiye liul
Arku lemerawi tisemey tisemey nebiye liul !

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 6
Seat mis aኸle mimts’ae nay merawi
Mis zeberh qendel mihretu kits’ewi yohans
Tibruኽ menfesu nefsey kimarኻ
Zemen fire gerka ametey barka nebiye liul

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 7
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul (2)

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 1
እንካብ ዝተወልዱ ብዕብየት ትዝከር
ሕሹኽ በል ንጎይታይ ናብ ዳሱ ክጽንበር፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 2
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ገለ ተረኸብኩ ዕድል ተሳትፎ
ኣብቲ ክቡር ዕድመ ንስመይ ጸሓፎ፡ ዮሃንስ
እንካብ ዘለኹዎ ክግስግስ ብሓይሊ

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 3
ጎበዝ ረድኤትካ ንስጕመይ የሳሊ፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ዓርኩ ለመርዓዊ ትሰመይ፡ ወኣንተኒ ህጻን ነቢየ ልዑል !

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 4
ኣብቲ ዳስ ንጽህና ኩሉ ናዓለለ
ሰንኪ ክዳን መርዓ ካብ ሰበይ ከይፍለ፡ ዮሃንስ
ልብሲ ጥዑስ ልቢ ዘሳግር ናብ ሰማይ
ምስቲ ጸጕሪ ገመል ፈልቊ ስፈየለይ፡ ነቢየ ልዑል

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 5
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል !

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 6
ሰዓት ምስ ኣኸለ ምምጻእ ናይ መርዓዊ
ምስ ዘበርህ ቀንዴል ምሕረቱ ክጸዊ፡ ዮሃንስ
ትብሩኽ መንፈሱ ነፍሰይ ክማርኻ
ዘመን ፍረ ጌርካ ዓመተይ ባርካ፡ ነቢየ ልዑል

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 7
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል (2)

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ',
        lyrics_transliteration = 'CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 1
Enkab ziteweldu biebyet tizker
Hishuኽ bel nigoytay nab dasu kits’nber nebiye liul
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 2
Weanteni hits’an nebiye liul (2)
Gele tereኸbku edl tesatfo
Abti kibur edme nismey ts’ehafo yohans
Enkab zeleኹwo kigsgs bihayli

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 3
Gobez redetka nisgwmey yesali nebiye liul
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Arku lemerawi tisemey weanteni hits’an nebiye liul !

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 4
Abti das nits’hna kulu naalele
Senki kidan mera kab sebey keyfle yohans
Libsi t’us libi zesagr nab semay
Misti ts’egwri gemel felqwi sifeyeley nebiye liul

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 5
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Weanteni hits’an nebiye liul
Arku lemerawi tisemey tisemey nebiye liul !

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 6
Seat mis aኸle mimts’ae nay merawi
Mis zeberh qendel mihretu kits’ewi yohans
Tibruኽ menfesu nefsey kimarኻ
Zemen fire gerka ametey barka nebiye liul

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 7
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul (2)

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2a8990b2-c455-44e9-867c-4939edcd3266'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 1
እንካብ ዝተወልዱ ብዕብየት ትዝከር
ሕሹኽ በል ንጎይታይ ናብ ዳሱ ክጽንበር፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 2
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ገለ ተረኸብኩ ዕድል ተሳትፎ
ኣብቲ ክቡር ዕድመ ንስመይ ጸሓፎ፡ ዮሃንስ
እንካብ ዘለኹዎ ክግስግስ ብሓይሊ

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 3
ጎበዝ ረድኤትካ ንስጕመይ የሳሊ፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ዓርኩ ለመርዓዊ ትሰመይ፡ ወኣንተኒ ህጻን ነቢየ ልዑል !

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 4
ኣብቲ ዳስ ንጽህና ኩሉ ናዓለለ
ሰንኪ ክዳን መርዓ ካብ ሰበይ ከይፍለ፡ ዮሃንስ
ልብሲ ጥዑስ ልቢ ዘሳግር ናብ ሰማይ
ምስቲ ጸጕሪ ገመል ፈልቊ ስፈየለይ፡ ነቢየ ልዑል

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 5
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል !

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 6
ሰዓት ምስ ኣኸለ ምምጻእ ናይ መርዓዊ
ምስ ዘበርህ ቀንዴል ምሕረቱ ክጸዊ፡ ዮሃንስ
ትብሩኽ መንፈሱ ነፍሰይ ክማርኻ
ዘመን ፍረ ጌርካ ዓመተይ ባርካ፡ ነቢየ ልዑል

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 7
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል (2)

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2a8990b2-c455-44e9-867c-4939edcd3266'::uuid, 'eritrean-orthodox-tewahdo-mezmur-4139', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidane-mihiret-enate ("Kidane Mihiret Enate")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6c699ae3-5968-4331-aaa3-41c48696db73'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 1
ከአፌ ሳይወጣ ሳልነግርሽ (2)
ልዘምር ልቁም ከፊትሽ ልምጣ ልምበርከክ ለክብርሽ
ብርቅ ከሀገር ከቤቴ ከቶ አልረሳሽም እናቴ ከቶ አልረሳሽም እናቴ
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 2
ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልልም መቼ ነው ቀኑ የእኔ መጎብኛ ዘበኑ እንደሚፈጸም አምናለሁ
ሁሉን በጊዜው አያለሁ (2)
ክዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 3
ከአፌ ሳይወጣ ሳልነግርሽ (2)
የልቤን ችግር ላዋይሽ ከስዕልሽ ፊት ቆሜ እንባዬ ቀድሞ ዝም አልኩኝ
ሳልነግርሽ ስለምታውቂ (2)
ክዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 4
ከአፌ ሳይሰጣ ሳልነግርሽ (2)

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 1
Keafe saywet’a salnegrsh (2)
Lizemr liqum kefitsh limt’a limberkek lekbrsh
Birq keheger kebete keto alresashm enate keto alresashm enate
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 2
Keafe saywet’a salnegrsh (2)
Allm meche new qenu yeene megobgna zebenu endemifets’em amnalehu
Hulun begizew ayalehu (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 3
Keafe saywet’a salnegrsh (2)
Yelben chgr lawaysh keselsh fit qome enbaye qedmo zim alkugn
Salnegrsh silemtawqi (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 4
Keafe sayset’a salnegrsh (2)

CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 1
ከአፌ ሳይወጣ ሳልነግርሽ (2)
ልዘምር ልቁም ከፊትሽ ልምጣ ልምበርከክ ለክብርሽ
ብርቅ ከሀገር ከቤቴ ከቶ አልረሳሽም እናቴ ከቶ አልረሳሽም እናቴ
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 2
ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልልም መቼ ነው ቀኑ የእኔ መጎብኛ ዘበኑ እንደሚፈጸም አምናለሁ
ሁሉን በጊዜው አያለሁ (2)
ክዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 3
ከአፌ ሳይወጣ ሳልነግርሽ (2)
የልቤን ችግር ላዋይሽ ከስዕልሽ ፊት ቆሜ እንባዬ ቀድሞ ዝም አልኩኝ
ሳልነግርሽ ስለምታውቂ (2)
ክዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 4
ከአፌ ሳይሰጣ ሳልነግርሽ (2)

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ',
        lyrics_transliteration = 'CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 1
Keafe saywet’a salnegrsh (2)
Lizemr liqum kefitsh limt’a limberkek lekbrsh
Birq keheger kebete keto alresashm enate keto alresashm enate
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 2
Keafe saywet’a salnegrsh (2)
Allm meche new qenu yeene megobgna zebenu endemifets’em amnalehu
Hulun begizew ayalehu (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 3
Keafe saywet’a salnegrsh (2)
Yelben chgr lawaysh keselsh fit qome enbaye qedmo zim alkugn
Salnegrsh silemtawqi (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 4
Keafe sayset’a salnegrsh (2)

CHORUS
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6c699ae3-5968-4331-aaa3-41c48696db73'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 1
ከአፌ ሳይወጣ ሳልነግርሽ (2)
ልዘምር ልቁም ከፊትሽ ልምጣ ልምበርከክ ለክብርሽ
ብርቅ ከሀገር ከቤቴ ከቶ አልረሳሽም እናቴ ከቶ አልረሳሽም እናቴ
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 2
ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልልም መቼ ነው ቀኑ የእኔ መጎብኛ ዘበኑ እንደሚፈጸም አምናለሁ
ሁሉን በጊዜው አያለሁ (2)
ክዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 3
ከአፌ ሳይወጣ ሳልነግርሽ (2)
የልቤን ችግር ላዋይሽ ከስዕልሽ ፊት ቆሜ እንባዬ ቀድሞ ዝም አልኩኝ
ሳልነግርሽ ስለምታውቂ (2)
ክዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 4
ከአፌ ሳይሰጣ ሳልነግርሽ (2)

CHORUS
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6c699ae3-5968-4331-aaa3-41c48696db73'::uuid, 'kidane-mihiret-enate', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adanegn-geta ("Adanegn Geta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2abc210e-7ff2-4fdf-b2f7-a2cbf8939dd2'::uuid
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
ኃጢአተኛውን ወደደኝ

VERSE 7
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 8
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 9
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 10
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 11
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

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
Hat’iategnawn wededegn

VERSE 7
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 8
Cher amlak yeewnet dagna; Amanuel lene metamegna
CHORUS
Ch’eleman alawqm beguzoye; behywete hulu neh meriye;
Tegwazkugn letun bebrhan; beante ayehugn meshagern; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 9
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Maqerqeren seberk alkugn qena; bertche teramedku endegena;
Qalh hayle yemiyats’enagn; bealet laym yetekelkegn; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 10
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Enbaye tabese sitats’nanagn; dil yehonew honowal sitredagn;
Bet’elate fit moges honkegn; lebariyahm dil set’eኸgn; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 11
Cher amlak yeewnet dagna; Amanuel lene metamegna;
CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)

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
ኃጢአተኛውን ወደደኝ

VERSE 7
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 8
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 9
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 10
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 11
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

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
Hat’iategnawn wededegn

VERSE 7
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 8
Cher amlak yeewnet dagna; Amanuel lene metamegna
CHORUS
Ch’eleman alawqm beguzoye; behywete hulu neh meriye;
Tegwazkugn letun bebrhan; beante ayehugn meshagern; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 9
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Maqerqeren seberk alkugn qena; bertche teramedku endegena;
Qalh hayle yemiyats’enagn; bealet laym yetekelkegn; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 10
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Enbaye tabese sitats’nanagn; dil yehonew honowal sitredagn;
Bet’elate fit moges honkegn; lebariyahm dil set’eኸgn; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 11
Cher amlak yeewnet dagna; Amanuel lene metamegna;
CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2abc210e-7ff2-4fdf-b2f7-a2cbf8939dd2'::uuid
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
ኃጢአተኛውን ወደደኝ

VERSE 7
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 8
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 9
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 10
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 11
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2abc210e-7ff2-4fdf-b2f7-a2cbf8939dd2'::uuid, 'adanegn-geta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- riese-bahitawiyan ("Riese Bahitawiyan")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '462ec3b7-c5f7-49ba-92dc-c6037c0b40ef'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 1
አዝ
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 2
አስተምረኸኛል ምግባር ሃይማኖት
አዝ
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 3
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ
በተጋድሎህ ብዛት በፆም በፀሎትህ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 4
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 5
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 1
CHORUS
Besmmu lemiyamnut amalaj honehel
Bets’elothm hayl temamnenbhal
Yekbr kokeb neh yegedam mebrat

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 2
Astemreኸgnal migbar haymanot
CHORUS
Yemiyalfewn alem yemdrun niqehel
Yetamenkew amlak hiyaw adrgohal

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 3
Besga benefsh Egziabher kebere
Yemastareqn qal beante lay anore
CHORUS
Betegadloh bizat bets’om bets’eloth

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 4
Titega nebere bets’enach emneth
Sile qal kidanh bereket yiwerdal
Yante sim sit’era agannt yirdal
CHORUS

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 5
Gebremenfes Kidus yeemnet abat
Anabrt anabst yetazezulet
Kenhisa tenesto ityop’iya derese
Ts’egaw bereketu beegna lay fesese

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 1
አዝ
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 2
አስተምረኸኛል ምግባር ሃይማኖት
አዝ
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 3
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ
በተጋድሎህ ብዛት በፆም በፀሎትህ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 4
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 5
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ',
        lyrics_transliteration = 'CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 1
CHORUS
Besmmu lemiyamnut amalaj honehel
Bets’elothm hayl temamnenbhal
Yekbr kokeb neh yegedam mebrat

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 2
Astemreኸgnal migbar haymanot
CHORUS
Yemiyalfewn alem yemdrun niqehel
Yetamenkew amlak hiyaw adrgohal

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 3
Besga benefsh Egziabher kebere
Yemastareqn qal beante lay anore
CHORUS
Betegadloh bizat bets’om bets’eloth

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 4
Titega nebere bets’enach emneth
Sile qal kidanh bereket yiwerdal
Yante sim sit’era agannt yirdal
CHORUS

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 5
Gebremenfes Kidus yeemnet abat
Anabrt anabst yetazezulet
Kenhisa tenesto ityop’iya derese
Ts’egaw bereketu beegna lay fesese

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi',
        updated_at = clock_timestamp()::text
    WHERE import_id = '462ec3b7-c5f7-49ba-92dc-c6037c0b40ef'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ_መንፈስቅዱስ ርዕሰ ባሕታዊ
አዝ======
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት
አስተምረኸኛል ምግባር ሃይማኖት
አዝ======
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ======
በተጋድሎህ ብዛት በፆም በፀሎትህ
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ======
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ

VERSE 1
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ_መንፈስቅዱስ ርዕሰ ባሕታዊ
አዝ======
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት
አስተምረኸኛል ምግባር ሃይማኖት
አዝ======
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ======
በተጋድሎህ ብዛት በፆም በፀሎትህ
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ======
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ_መንፈስቅዱስ ርዕሰ ባሕታዊ
አዝ======
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት
አስተምረኸኛል ምግባር ሃይማኖት
አዝ======
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ======
በተጋድሎህ ብዛት በፆም በፀሎትህ
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ======
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '462ec3b7-c5f7-49ba-92dc-c6037c0b40ef'::uuid, 'riese-bahitawiyan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopia-orthodox-mezmure ("Ethiopia Orthodox Mezmure")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2c0aa1af-6a23-449d-af8e-884eb04c1e05'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 1
ጠላት እንዲያጠፋኝ የወረወረው ቀስት
ሳይመታኝ ያለፈው ዕድል አይደል ክስተት
በከበባው መሀል ሰላም ነኝ የምለው
አጠገቤ ሳይሆን ውስጤ ስላለህ ነው

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 2
አለህኝ አንተ የኔ ወዳጅ መንፈስ ቅዱስ
ብቻዬን ማተወኝ መውደድህ የማይቀንስ
ውድቀቴን የማትሻ አዛኝ በድካሜ
ስዝል ድጋፌ ነህ የዘለዐለሜ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 3
መርተህ አደረስከኝ ወደ ፀጋው ዙፋን
ሆንክልኝ ብቃቴ እንዳይ የአብ ፊቱን
ሰማያት ተተክለው ብርሀን ሳይገለጥ
ፍጥረታት ሳይመጡ ምድር ፍሬ ሳትሰጥ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 4
ሳይጋርድህ ድንበር ሰፈህ በውሃ ላይ
እንደነበርክ ያኔ ነግሰሀል ልቤም ላይ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 1
T’elat endiyat’efagn yewerewerew qest
Saymetagn yalefew edl aydel kistet
Bekebebaw mehel selam negn yemlew
At’egebe sayhon wist’e silaleh new

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 2
Alehgn ante yene wedaj menfes Kidus
Bichayen matewegn mewdedh yemayqens
Widqeten yematsha azagn bedkame
Sizl digafe neh yezelealeme

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 3
Merteh adereskegn wede ts’egaw zufan
Honklgn biqate enday yeab fitun
Semayat teteklew birhen saygelet’
Fit’retat saymet’u midr fire satset’

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 4
Saygardh dinber sefeh bewha lay
Endeneberk yane negsehel libem lay

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 1
ጠላት እንዲያጠፋኝ የወረወረው ቀስት
ሳይመታኝ ያለፈው ዕድል አይደል ክስተት
በከበባው መሀል ሰላም ነኝ የምለው
አጠገቤ ሳይሆን ውስጤ ስላለህ ነው

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 2
አለህኝ አንተ የኔ ወዳጅ መንፈስ ቅዱስ
ብቻዬን ማተወኝ መውደድህ የማይቀንስ
ውድቀቴን የማትሻ አዛኝ በድካሜ
ስዝል ድጋፌ ነህ የዘለዐለሜ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 3
መርተህ አደረስከኝ ወደ ፀጋው ዙፋን
ሆንክልኝ ብቃቴ እንዳይ የአብ ፊቱን
ሰማያት ተተክለው ብርሀን ሳይገለጥ
ፍጥረታት ሳይመጡ ምድር ፍሬ ሳትሰጥ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 4
ሳይጋርድህ ድንበር ሰፈህ በውሃ ላይ
እንደነበርክ ያኔ ነግሰሀል ልቤም ላይ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ',
        lyrics_transliteration = 'CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 1
T’elat endiyat’efagn yewerewerew qest
Saymetagn yalefew edl aydel kistet
Bekebebaw mehel selam negn yemlew
At’egebe sayhon wist’e silaleh new

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 2
Alehgn ante yene wedaj menfes Kidus
Bichayen matewegn mewdedh yemayqens
Widqeten yematsha azagn bedkame
Sizl digafe neh yezelealeme

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 3
Merteh adereskegn wede ts’egaw zufan
Honklgn biqate enday yeab fitun
Semayat teteklew birhen saygelet’
Fit’retat saymet’u midr fire satset’

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 4
Saygardh dinber sefeh bewha lay
Endeneberk yane negsehel libem lay

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2c0aa1af-6a23-449d-af8e-884eb04c1e05'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 1
ጠላት እንዲያጠፋኝ የወረወረው ቀስት
ሳይመታኝ ያለፈው ዕድል አይደል ክስተት
በከበባው መሀል ሰላም ነኝ የምለው
አጠገቤ ሳይሆን ውስጤ ስላለህ ነው

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 2
አለህኝ አንተ የኔ ወዳጅ መንፈስ ቅዱስ
ብቻዬን ማተወኝ መውደድህ የማይቀንስ
ውድቀቴን የማትሻ አዛኝ በድካሜ
ስዝል ድጋፌ ነህ የዘለዐለሜ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 3
መርተህ አደረስከኝ ወደ ፀጋው ዙፋን
ሆንክልኝ ብቃቴ እንዳይ የአብ ፊቱን
ሰማያት ተተክለው ብርሀን ሳይገለጥ
ፍጥረታት ሳይመጡ ምድር ፍሬ ሳትሰጥ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 4
ሳይጋርድህ ድንበር ሰፈህ በውሃ ላይ
እንደነበርክ ያኔ ነግሰሀል ልቤም ላይ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2c0aa1af-6a23-449d-af8e-884eb04c1e05'::uuid, 'ethiopia-orthodox-mezmure', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egziabher-yimesgen-zemarit-fasika-mekonen ("Egziabher Yimesgen Zemarit Fasika Mekonen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f84f30ff-7175-4451-97db-f0f6875ca9cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 1
ለልጆቹ እረኛ ነው በለምለም መስክ የሚያሰማራ
እኛም ተግተን የምንሰማው በኃያል ድምጽ ሲጣራ
በጽዮን ውብ ምስጋና በባዕድ ሀገር ባርኮናል
ልጆቹን አልተወንም ከክፉ ጠብቆናል

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 2
የመከራውን ሌሊት አሳለፈን ያንን ቀን
ካሰብነውም ካላሰበነው ከልሎ እየጠበቀን
በኃዘንም በደስታ ሳይለይ ከእኛ ጋራ
ወደ ድሎ ሰገነት አወጣን እየመራ

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 3
ይህንን ቀን ሰቶናል እንድንቆም ለምስጋና
በታላቅ ጉባኤ ፊት አሰባስቦናልና
በዘለዓለም ፍቅር ወዶን ከሞት ቀንበር ላስጣለን
ከምስጋና በስተቀር ምንስ እንከፍለዋለን

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 4
ልዩ ለሆነው ዕለት አድርሶናል በደስታ
ስንወድቅ እያነሳ እየደገፈን ጌታ
መርቆናል በቤቱ የስኬት ቀን ነው ዛሬ
ለምስጋና ቆመናል እነሆ በዝማሬ

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 5
የተገኘው ከእናቱ ጋር በቃና ዘገሊላ
ይኸው እኛም አይተናል ጉድለታችን ሲሞላ
በአንድነት አጽንቶ በጎ ዘመን ሊሰጠን
የታመነው እግዚአብሔር ለዚህ ቀን አደረሰን

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 1
Leljochu eregna new belemlem mesk yemiyasemara
Egnam tegten yemnsemaw behayal dimts’ sit’ara
Bets’yon wib misgana bebaed heger barkonal
Lijochun altewenm kekfu t’ebqonal

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 2
Yemekerawn lelit asalefen yann qen
Kasebnewm kalasebenew kello eyet’ebeqen
Behazenm bedesta sayley keegna gara
Wede dilo segenet awet’an eyemera

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 3
Yihnn qen setonal endnqom lemsgana
Betalaq gubae fit asebasbonalna
Bezelealem fiqr wedon kemot qenber last’alen
Kemsgana besteqer mins enkeflewalen

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 4
Liyu lehonew elet adrsonal bedesta
Sinwedq eyanesa eyedegefen Geta
Merqonal bebetu yesket qen new zare
Lemsgana qomenal eneho bezmare

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 5
Yetegegnew keenatu gar beqana zegelila
Yiኸw egnam aytenal gudletachn simola
Beandnet ats’nto bego zemen liset’en
Yetamenew Egziabher lezih qen aderesen

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 1
ለልጆቹ እረኛ ነው በለምለም መስክ የሚያሰማራ
እኛም ተግተን የምንሰማው በኃያል ድምጽ ሲጣራ
በጽዮን ውብ ምስጋና በባዕድ ሀገር ባርኮናል
ልጆቹን አልተወንም ከክፉ ጠብቆናል

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 2
የመከራውን ሌሊት አሳለፈን ያንን ቀን
ካሰብነውም ካላሰበነው ከልሎ እየጠበቀን
በኃዘንም በደስታ ሳይለይ ከእኛ ጋራ
ወደ ድሎ ሰገነት አወጣን እየመራ

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 3
ይህንን ቀን ሰቶናል እንድንቆም ለምስጋና
በታላቅ ጉባኤ ፊት አሰባስቦናልና
በዘለዓለም ፍቅር ወዶን ከሞት ቀንበር ላስጣለን
ከምስጋና በስተቀር ምንስ እንከፍለዋለን

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 4
ልዩ ለሆነው ዕለት አድርሶናል በደስታ
ስንወድቅ እያነሳ እየደገፈን ጌታ
መርቆናል በቤቱ የስኬት ቀን ነው ዛሬ
ለምስጋና ቆመናል እነሆ በዝማሬ

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 5
የተገኘው ከእናቱ ጋር በቃና ዘገሊላ
ይኸው እኛም አይተናል ጉድለታችን ሲሞላ
በአንድነት አጽንቶ በጎ ዘመን ሊሰጠን
የታመነው እግዚአብሔር ለዚህ ቀን አደረሰን

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን',
        lyrics_transliteration = 'CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 1
Leljochu eregna new belemlem mesk yemiyasemara
Egnam tegten yemnsemaw behayal dimts’ sit’ara
Bets’yon wib misgana bebaed heger barkonal
Lijochun altewenm kekfu t’ebqonal

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 2
Yemekerawn lelit asalefen yann qen
Kasebnewm kalasebenew kello eyet’ebeqen
Behazenm bedesta sayley keegna gara
Wede dilo segenet awet’an eyemera

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 3
Yihnn qen setonal endnqom lemsgana
Betalaq gubae fit asebasbonalna
Bezelealem fiqr wedon kemot qenber last’alen
Kemsgana besteqer mins enkeflewalen

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 4
Liyu lehonew elet adrsonal bedesta
Sinwedq eyanesa eyedegefen Geta
Merqonal bebetu yesket qen new zare
Lemsgana qomenal eneho bezmare

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 5
Yetegegnew keenatu gar beqana zegelila
Yiኸw egnam aytenal gudletachn simola
Beandnet ats’nto bego zemen liset’en
Yetamenew Egziabher lezih qen aderesen

CHORUS
Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f84f30ff-7175-4451-97db-f0f6875ca9cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 1
ለልጆቹ እረኛ ነው በለምለም መስክ የሚያሰማራ
እኛም ተግተን የምንሰማው በኃያል ድምጽ ሲጣራ
በጽዮን ውብ ምስጋና በባዕድ ሀገር ባርኮናል
ልጆቹን አልተወንም ከክፉ ጠብቆናል

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 2
የመከራውን ሌሊት አሳለፈን ያንን ቀን
ካሰብነውም ካላሰበነው ከልሎ እየጠበቀን
በኃዘንም በደስታ ሳይለይ ከእኛ ጋራ
ወደ ድሎ ሰገነት አወጣን እየመራ

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 3
ይህንን ቀን ሰቶናል እንድንቆም ለምስጋና
በታላቅ ጉባኤ ፊት አሰባስቦናልና
በዘለዓለም ፍቅር ወዶን ከሞት ቀንበር ላስጣለን
ከምስጋና በስተቀር ምንስ እንከፍለዋለን

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 4
ልዩ ለሆነው ዕለት አድርሶናል በደስታ
ስንወድቅ እያነሳ እየደገፈን ጌታ
መርቆናል በቤቱ የስኬት ቀን ነው ዛሬ
ለምስጋና ቆመናል እነሆ በዝማሬ

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 5
የተገኘው ከእናቱ ጋር በቃና ዘገሊላ
ይኸው እኛም አይተናል ጉድለታችን ሲሞላ
በአንድነት አጽንቶ በጎ ዘመን ሊሰጠን
የታመነው እግዚአብሔር ለዚህ ቀን አደረሰን

CHORUS
እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f84f30ff-7175-4451-97db-f0f6875ca9cd'::uuid, 'egziabher-yimesgen-zemarit-fasika-mekonen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egnan-kewededebet-ketilik-fikiru-yetenesa ("Egnan Kewededebet Ketilik Fikiru Yetenesa")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2ad9942e-a3ac-4c8c-84df-6c008fa75df0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 1
ስለወደደን ጌታ ፈቅዶ
ይኸው አዳነን እንዲህ ወርዶ
ከጥልቁ ጉድጓድ ተጥለን
ጽኑ መከራ ውስጥ ሳለን

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 2
ክርስቶስ በስጋ ተገልጦ
ሕይወትን ሰጠን ሞትን ውጦ
ታስሮ ወረደ በፍቅር
መዳፉን ሰጠ ለችንካር

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 3
የባዘንነውን ሰበሰበን
ርቀን ነበር አቀረበን
ቁጥር የለውም ለዘመኑ
ድንበር የለውም ለማዳኑ

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 4
ይኸው ሞትን አሰናበተ
ሰማይ በደሙ ተከፈተ

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm

VERSE 1
Silewededen Geta feqdo
Yiኸw adanen endih werdo
Ket’lqu gudgwad tet’len
Ts’nu mekera wist’ salen

CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm

VERSE 2
Kristos besga tegelt’o
Hiywetn set’en motn wit’o
Tasro werede befqr
Medafun set’e lechnkar

CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm

VERSE 3
Yebazennewn sebeseben
Riqen neber aqereben
Qut’r yelewm lezemenu
Dinber yelewm lemadanu

CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm

VERSE 4
Yiኸw motn asenabete
Semay bedemu tekefete

CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 1
ስለወደደን ጌታ ፈቅዶ
ይኸው አዳነን እንዲህ ወርዶ
ከጥልቁ ጉድጓድ ተጥለን
ጽኑ መከራ ውስጥ ሳለን

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 2
ክርስቶስ በስጋ ተገልጦ
ሕይወትን ሰጠን ሞትን ውጦ
ታስሮ ወረደ በፍቅር
መዳፉን ሰጠ ለችንካር

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 3
የባዘንነውን ሰበሰበን
ርቀን ነበር አቀረበን
ቁጥር የለውም ለዘመኑ
ድንበር የለውም ለማዳኑ

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 4
ይኸው ሞትን አሰናበተ
ሰማይ በደሙ ተከፈተ

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም',
        lyrics_transliteration = 'CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm

VERSE 1
Silewededen Geta feqdo
Yiኸw adanen endih werdo
Ket’lqu gudgwad tet’len
Ts’nu mekera wist’ salen

CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm

VERSE 2
Kristos besga tegelt’o
Hiywetn set’en motn wit’o
Tasro werede befqr
Medafun set’e lechnkar

CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm

VERSE 3
Yebazennewn sebeseben
Riqen neber aqereben
Qut’r yelewm lezemenu
Dinber yelewm lemadanu

CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm

VERSE 4
Yiኸw motn asenabete
Semay bedemu tekefete

CHORUS
Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2ad9942e-a3ac-4c8c-84df-6c008fa75df0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 1
ስለወደደን ጌታ ፈቅዶ
ይኸው አዳነን እንዲህ ወርዶ
ከጥልቁ ጉድጓድ ተጥለን
ጽኑ መከራ ውስጥ ሳለን

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 2
ክርስቶስ በስጋ ተገልጦ
ሕይወትን ሰጠን ሞትን ውጦ
ታስሮ ወረደ በፍቅር
መዳፉን ሰጠ ለችንካር

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 3
የባዘንነውን ሰበሰበን
ርቀን ነበር አቀረበን
ቁጥር የለውም ለዘመኑ
ድንበር የለውም ለማዳኑ

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 4
ይኸው ሞትን አሰናበተ
ሰማይ በደሙ ተከፈተ

CHORUS
እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2ad9942e-a3ac-4c8c-84df-6c008fa75df0'::uuid, 'egnan-kewededebet-ketilik-fikiru-yetenesa', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-bij-d-msgna-ata-nebsey-tnafkeka ("Eritrean Orthodox tewahdo mezmur bij d.msgna ata nebsey tnafkeka")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '471fa5f9-f176-41a1-baff-8d7766e1475d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 1
1)ናብራ ቅድስና ድሕረት ቆጺረዮ
ድምጺ ጻዊዒትካ ኣበይ ሰሚዐዮ
ናይ መስቀል ፍቕርካ ኩሉ ጠሊመዮ
ምሕረት ግበረለይ ንገበነይ ውን እለዮ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 2
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
2) ፈቐዶ ክኹብልል ግዜ ምስ ሓለፈ
ምስ ከንቱ ትምኒታት ክጐይይ ተሰኒፈ
ካባኻ ሪሒቐ ኣበይ ጢዒሙኒ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 3
ናፊቓላ ነፍሰይ ናብ ደንበኻ ምለሰኒ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
3)ናብራ ቤት ኣቡኣ ነብሰይ ናፊቓቶ
እቲ ማሙቕ ሕቑፍኻ ኩሉ ዘኪራቶ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 4
ፍትውተይ እንዳበልካ ካብ ኣኽራን ምፃያ
ንጎደና ሂወት ብቃላትካ ከተርእያ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
4) ናይ ዝኽሪ መስቀልካ ብመንፈስ ከምርሕ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 5
ምሳኻ ኣብ ቀራንዮ ድኻነይ ክሰርሕ
ኽጎይይ ድሕረኻ ስሓበኒ ጎይታ
ኣሜን ሃሌ ሉያ ናፍቆተይ ማራናታ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 1
1)nabra qidsna dihret qots’ireyo
Dimts’i ts’awiitka abey semiayo
Nay mesqel fiቕrka kulu t’elimeyo
Mihret gibereley nigebeney win eleyo

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 2
Az: ata nebsey tinafqeka kemay tits’emaka
2) feቐdo kiኹbll gize mis halefe
Mis kentu timnitat kigweyy tesenife
Kabaኻ rihiቐ abey t’iimuni

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 3
Nafiቓla nefsey nab denbeኻ mileseni
Az: ata nebsey tinafqeka kemay tits’emaka
3)nabra bet abua nebsey nafiቓto
Eti mamuቕ hiቑfኻ kulu zekirato

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 4
Fitwtey endabelka kab aኽran mits’aya
Nigodena hiwet biqalatka ketereya
Az: ata nebsey tinafqeka kemay tits’emaka
4) nay ziኽri mesqelka bimenfes kemrh

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 5
Misaኻ ab qeranyo diኻney kiserh
ኽgoyy dihreኻ sihabeni goyta
Amen Halleluya nafqotey maranata
Az: ata nebsey tinafqeka kemay tits’emaka

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 1
1)ናብራ ቅድስና ድሕረት ቆጺረዮ
ድምጺ ጻዊዒትካ ኣበይ ሰሚዐዮ
ናይ መስቀል ፍቕርካ ኩሉ ጠሊመዮ
ምሕረት ግበረለይ ንገበነይ ውን እለዮ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 2
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
2) ፈቐዶ ክኹብልል ግዜ ምስ ሓለፈ
ምስ ከንቱ ትምኒታት ክጐይይ ተሰኒፈ
ካባኻ ሪሒቐ ኣበይ ጢዒሙኒ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 3
ናፊቓላ ነፍሰይ ናብ ደንበኻ ምለሰኒ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
3)ናብራ ቤት ኣቡኣ ነብሰይ ናፊቓቶ
እቲ ማሙቕ ሕቑፍኻ ኩሉ ዘኪራቶ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 4
ፍትውተይ እንዳበልካ ካብ ኣኽራን ምፃያ
ንጎደና ሂወት ብቃላትካ ከተርእያ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
4) ናይ ዝኽሪ መስቀልካ ብመንፈስ ከምርሕ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 5
ምሳኻ ኣብ ቀራንዮ ድኻነይ ክሰርሕ
ኽጎይይ ድሕረኻ ስሓበኒ ጎይታ
ኣሜን ሃሌ ሉያ ናፍቆተይ ማራናታ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ',
        lyrics_transliteration = 'CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 1
1)nabra qidsna dihret qots’ireyo
Dimts’i ts’awiitka abey semiayo
Nay mesqel fiቕrka kulu t’elimeyo
Mihret gibereley nigebeney win eleyo

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 2
Az: ata nebsey tinafqeka kemay tits’emaka
2) feቐdo kiኹbll gize mis halefe
Mis kentu timnitat kigweyy tesenife
Kabaኻ rihiቐ abey t’iimuni

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 3
Nafiቓla nefsey nab denbeኻ mileseni
Az: ata nebsey tinafqeka kemay tits’emaka
3)nabra bet abua nebsey nafiቓto
Eti mamuቕ hiቑfኻ kulu zekirato

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 4
Fitwtey endabelka kab aኽran mits’aya
Nigodena hiwet biqalatka ketereya
Az: ata nebsey tinafqeka kemay tits’emaka
4) nay ziኽri mesqelka bimenfes kemrh

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 5
Misaኻ ab qeranyo diኻney kiserh
ኽgoyy dihreኻ sihabeni goyta
Amen Halleluya nafqotey maranata
Az: ata nebsey tinafqeka kemay tits’emaka

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka',
        updated_at = clock_timestamp()::text
    WHERE import_id = '471fa5f9-f176-41a1-baff-8d7766e1475d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 1
1)ናብራ ቅድስና ድሕረት ቆጺረዮ
ድምጺ ጻዊዒትካ ኣበይ ሰሚዐዮ
ናይ መስቀል ፍቕርካ ኩሉ ጠሊመዮ
ምሕረት ግበረለይ ንገበነይ ውን እለዮ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 2
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
2) ፈቐዶ ክኹብልል ግዜ ምስ ሓለፈ
ምስ ከንቱ ትምኒታት ክጐይይ ተሰኒፈ
ካባኻ ሪሒቐ ኣበይ ጢዒሙኒ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 3
ናፊቓላ ነፍሰይ ናብ ደንበኻ ምለሰኒ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
3)ናብራ ቤት ኣቡኣ ነብሰይ ናፊቓቶ
እቲ ማሙቕ ሕቑፍኻ ኩሉ ዘኪራቶ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 4
ፍትውተይ እንዳበልካ ካብ ኣኽራን ምፃያ
ንጎደና ሂወት ብቃላትካ ከተርእያ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
4) ናይ ዝኽሪ መስቀልካ ብመንፈስ ከምርሕ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 5
ምሳኻ ኣብ ቀራንዮ ድኻነይ ክሰርሕ
ኽጎይይ ድሕረኻ ስሓበኒ ጎይታ
ኣሜን ሃሌ ሉያ ናፍቆተይ ማራናታ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '471fa5f9-f176-41a1-baff-8d7766e1475d'::uuid, 'eritrean-orthodox-tewahdo-mezmur-bij-d-msgna-ata-nebsey-tnafkeka', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- atilef-yetewahidon-diniber ("Atilef Yetewahidon Diniber")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd2652a5a-a4ad-4d88-b13f-67c3d7a81490'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 1
የአብና የወልድ የመንፈስ ቅዱስን
ሶስትነቱን አምነን ፍፁም አንድነቱን
ቅዱሳት መፃህፍት እንደመሰከሩ
የስላሴ አኗኗር ድንቅ ነው ምስጢሩ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 2
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
የአምላክን ሰው መሆን የስጋዌን ነገር
የአለሙን ድህነት ተዋህዶ ትመስክር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 3
ያለ መደባለቅ ያለ መቀላቀል
ስጋን መዋሃዱ ከማርያም ድንግል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 4
የመቅደሷ ስርዓት በውስጧ የሚታየው
የተዋህዶ ነገር ምንጩ ከሰማይ ነው
ትርጉሙን ተረዱ ምስጢሩን ጠይቁ
በኑፋቄ ገመድ እንዳትታነቁ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 5
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
በፀበል በመስቀል በእምነት ሲታበሱ
በውስጧ ይገኛል የእግዚአብሄር ፈውሱ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 6
የአለመጠራጠር በእምነት ቅረቡ
የመለኮት ስራ ብዙ ነው ጥበቡ
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 7
ዓለሙን ሊያሳልፍ ይመጣል ዳግመኛ
በፍርዱ ወንበር ፊት እንቆማለን እኛ
በመለኮት ስልጣን በክብር ይገለፃል
አማላጅ አይደለም ኢየሱስ ይፈርዳል

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 8
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 1
Yeabna yeweld yemenfes qidusn
Sostnetun amnen fits’um andnetun
Qidusat mets’ahft endemesekeru
Yeslase anwanwar dinq new mist’iru

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 2
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer
Yeamlakn sew mehon yesgawen neger
Yealemun dihnet Tewahedo timeskr

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 3
Yale medebaleq yale meqelaqel
Sigan mewahadu kemaryam Dingil
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 4
Yemeqdeswa sirat bewst’wa yemitayew
Yetewahdo neger minch’u kesemay new
Tirgumun teredu mist’irun t’eyqu
Benufaqe gemed endattanequ

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 5
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer
Bets’ebel bemesqel beemnet sitabesu
Bewst’wa yigegnal yeegziabher fewsu

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 6
Yealemet’erat’er beemnet qirebu
Yemelekot sira bizu new t’bebu
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 7
Alemun liyasalf yimet’al dagmegna
Befrdu wenber fit enqomalen egna
Bemelekot silt’an bekbr yigelets’al
Amalaj aydelem Iyesus yiferdal

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 8
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 1
የአብና የወልድ የመንፈስ ቅዱስን
ሶስትነቱን አምነን ፍፁም አንድነቱን
ቅዱሳት መፃህፍት እንደመሰከሩ
የስላሴ አኗኗር ድንቅ ነው ምስጢሩ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 2
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
የአምላክን ሰው መሆን የስጋዌን ነገር
የአለሙን ድህነት ተዋህዶ ትመስክር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 3
ያለ መደባለቅ ያለ መቀላቀል
ስጋን መዋሃዱ ከማርያም ድንግል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 4
የመቅደሷ ስርዓት በውስጧ የሚታየው
የተዋህዶ ነገር ምንጩ ከሰማይ ነው
ትርጉሙን ተረዱ ምስጢሩን ጠይቁ
በኑፋቄ ገመድ እንዳትታነቁ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 5
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
በፀበል በመስቀል በእምነት ሲታበሱ
በውስጧ ይገኛል የእግዚአብሄር ፈውሱ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 6
የአለመጠራጠር በእምነት ቅረቡ
የመለኮት ስራ ብዙ ነው ጥበቡ
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 7
ዓለሙን ሊያሳልፍ ይመጣል ዳግመኛ
በፍርዱ ወንበር ፊት እንቆማለን እኛ
በመለኮት ስልጣን በክብር ይገለፃል
አማላጅ አይደለም ኢየሱስ ይፈርዳል

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 8
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር',
        lyrics_transliteration = 'CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 1
Yeabna yeweld yemenfes qidusn
Sostnetun amnen fits’um andnetun
Qidusat mets’ahft endemesekeru
Yeslase anwanwar dinq new mist’iru

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 2
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer
Yeamlakn sew mehon yesgawen neger
Yealemun dihnet Tewahedo timeskr

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 3
Yale medebaleq yale meqelaqel
Sigan mewahadu kemaryam Dingil
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 4
Yemeqdeswa sirat bewst’wa yemitayew
Yetewahdo neger minch’u kesemay new
Tirgumun teredu mist’irun t’eyqu
Benufaqe gemed endattanequ

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 5
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer
Bets’ebel bemesqel beemnet sitabesu
Bewst’wa yigegnal yeegziabher fewsu

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 6
Yealemet’erat’er beemnet qirebu
Yemelekot sira bizu new t’bebu
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 7
Alemun liyasalf yimet’al dagmegna
Befrdu wenber fit enqomalen egna
Bemelekot silt’an bekbr yigelets’al
Amalaj aydelem Iyesus yiferdal

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 8
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd2652a5a-a4ad-4d88-b13f-67c3d7a81490'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 1
የአብና የወልድ የመንፈስ ቅዱስን
ሶስትነቱን አምነን ፍፁም አንድነቱን
ቅዱሳት መፃህፍት እንደመሰከሩ
የስላሴ አኗኗር ድንቅ ነው ምስጢሩ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 2
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
የአምላክን ሰው መሆን የስጋዌን ነገር
የአለሙን ድህነት ተዋህዶ ትመስክር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 3
ያለ መደባለቅ ያለ መቀላቀል
ስጋን መዋሃዱ ከማርያም ድንግል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 4
የመቅደሷ ስርዓት በውስጧ የሚታየው
የተዋህዶ ነገር ምንጩ ከሰማይ ነው
ትርጉሙን ተረዱ ምስጢሩን ጠይቁ
በኑፋቄ ገመድ እንዳትታነቁ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 5
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
በፀበል በመስቀል በእምነት ሲታበሱ
በውስጧ ይገኛል የእግዚአብሄር ፈውሱ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 6
የአለመጠራጠር በእምነት ቅረቡ
የመለኮት ስራ ብዙ ነው ጥበቡ
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 7
ዓለሙን ሊያሳልፍ ይመጣል ዳግመኛ
በፍርዱ ወንበር ፊት እንቆማለን እኛ
በመለኮት ስልጣን በክብር ይገለፃል
አማላጅ አይደለም ኢየሱስ ይፈርዳል

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 8
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd2652a5a-a4ad-4d88-b13f-67c3d7a81490'::uuid, 'atilef-yetewahidon-diniber', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yilal-anidebete ("Yilal Anidebete")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ef1dc3ae-a901-4a51-9977-bf132b15e13e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 1
የትላንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩም እሾህ ነው
ወደ እረፍቴ ወጣው ይድረስ ምስጋናዬ
ደጆች ቢዘጉብኝ በር ሆኖኝ ጌታዬ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 2
በጥልቁ በረሀ ምግብ መጠጥ ሆኖኝ
መንገዴን አቀናው እጄን በአፌ አስጫነኝ
በእሳት እና ውሀ መካከል አልፌ
ተመስገን እላለው ቅኔ ሞልቶት አፌን(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 3
የብቸኝነቴን ማእበል ገስፃል
ለእኔ ብርሀን ሆኖ ለከሳሽ ጨልሟል
ቀስቱን እያጠፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በኔ ላይ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 4
ትላንት ዛሬ ነገ ዘላለም ጠባቂ
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህሪው ቅዱስ የሌለው አምሳያ
ስሙ ወደቤ ነው መልሕቄን መጣያ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 1
Yetlant hiyweten zor biye sayew
Mamlech’a yelelew at’rum eshoh new
Wede erefte wet’aw yidres misganaye
Dejoch bizegubgn ber honogn Getaye(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 2
Bet’lqu berehe migb met’et’ honogn
Mengeden aqenaw ejen beafe asch’anegn
Beesat ena wihe mekakel alfe
Temesgen elalew qine moltot afen(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 3
Yebchegnneten maebel gests’al
Leene birhen hono lekesash ch’elmwal
Qestun eyat’efe tadegegn kesqay
Yegetaye hesab fiqr new bene lay(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 4
Tilant zare nege zelalem t’ebaqi
Yelben filagot salnegrew awaqi
Bebahriw Kidus yelelew amsaya
Simu wedebe new melhqen met’aya(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 1
የትላንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩም እሾህ ነው
ወደ እረፍቴ ወጣው ይድረስ ምስጋናዬ
ደጆች ቢዘጉብኝ በር ሆኖኝ ጌታዬ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 2
በጥልቁ በረሀ ምግብ መጠጥ ሆኖኝ
መንገዴን አቀናው እጄን በአፌ አስጫነኝ
በእሳት እና ውሀ መካከል አልፌ
ተመስገን እላለው ቅኔ ሞልቶት አፌን(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 3
የብቸኝነቴን ማእበል ገስፃል
ለእኔ ብርሀን ሆኖ ለከሳሽ ጨልሟል
ቀስቱን እያጠፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በኔ ላይ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 4
ትላንት ዛሬ ነገ ዘላለም ጠባቂ
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህሪው ቅዱስ የሌለው አምሳያ
ስሙ ወደቤ ነው መልሕቄን መጣያ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ',
        lyrics_transliteration = 'CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 1
Yetlant hiyweten zor biye sayew
Mamlech’a yelelew at’rum eshoh new
Wede erefte wet’aw yidres misganaye
Dejoch bizegubgn ber honogn Getaye(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 2
Bet’lqu berehe migb met’et’ honogn
Mengeden aqenaw ejen beafe asch’anegn
Beesat ena wihe mekakel alfe
Temesgen elalew qine moltot afen(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 3
Yebchegnneten maebel gests’al
Leene birhen hono lekesash ch’elmwal
Qestun eyat’efe tadegegn kesqay
Yegetaye hesab fiqr new bene lay(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 4
Tilant zare nege zelalem t’ebaqi
Yelben filagot salnegrew awaqi
Bebahriw Kidus yelelew amsaya
Simu wedebe new melhqen met’aya(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ef1dc3ae-a901-4a51-9977-bf132b15e13e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 1
የትላንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩም እሾህ ነው
ወደ እረፍቴ ወጣው ይድረስ ምስጋናዬ
ደጆች ቢዘጉብኝ በር ሆኖኝ ጌታዬ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 2
በጥልቁ በረሀ ምግብ መጠጥ ሆኖኝ
መንገዴን አቀናው እጄን በአፌ አስጫነኝ
በእሳት እና ውሀ መካከል አልፌ
ተመስገን እላለው ቅኔ ሞልቶት አፌን(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 3
የብቸኝነቴን ማእበል ገስፃል
ለእኔ ብርሀን ሆኖ ለከሳሽ ጨልሟል
ቀስቱን እያጠፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በኔ ላይ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 4
ትላንት ዛሬ ነገ ዘላለም ጠባቂ
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህሪው ቅዱስ የሌለው አምሳያ
ስሙ ወደቤ ነው መልሕቄን መጣያ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ef1dc3ae-a901-4a51-9977-bf132b15e13e'::uuid, 'yilal-anidebete', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beyenay-kalat ("Beyenay Kalat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ef562681-f81b-4e3a-b948-8d7d427699e7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 1
ፅምእይ ዘተርክስ
እቲ ማይ ሕይወት''ዩ ንዓይ ዝፈወሰ
ኢየሱስ''ዩ ንሱ ነፍሰይ ዝረኽባ
ብዘይ ውዳእ ምሕረት ናብ ጽድቒ ዝሰሓባ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 2
ኣዞማች
ብድኻም ንሰባት ኣይፍንፍንን ንሱ/2/
ምድሓን ናይ ነፍሳትዩ ንዕኡስ ሓጎሱ
ንዓይ ንኽደሊ መጺኡ ንበይኑ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 3
ሪኣቶያ ነፍሰይ ነቲዒቢ ምድሓኑ
ኣዝማች
ነቲ ምረት ልበይ ሕልኽላኽ ናይ ቤተይ /ናይ ውሽጠይ/
ኩሉ ነገሩኒ ዘርዚሩ ታሪኸይ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 4
ሰላሙ ሂቡኒ ሰኽመይ ኣራጊፉ
ዳግም ሰሪሑኒ ልበይ ብእኡ ኣዕሪፉ
ኣዝማች

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 1
Ts’mey zeterks
Eti may hiywet''yu niay zifewese
Iyesus''yu nisu nefsey zireኽba
Bizey widae mihret nab ts’dቒ zisehaba

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 2
Azomach
Bidኻm nisebat ayfnfnn nisu (2)
Midhan nay nefsatyu nieus hagosu
Niay niኽdeli mets’iu nibeynu

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 3
Riatoya nefsey netiibi midhanu
Azmach
Neti miret libey hilኽlaኽ nay betey /nay wisht’ey/
Kulu negeruni zerziru tariኸy

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 4
Selamu hibuni seኽmey aragifu
Dagm serihuni libey bieu aerifu
Azmach

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 1
ፅምእይ ዘተርክስ
እቲ ማይ ሕይወት''ዩ ንዓይ ዝፈወሰ
ኢየሱስ''ዩ ንሱ ነፍሰይ ዝረኽባ
ብዘይ ውዳእ ምሕረት ናብ ጽድቒ ዝሰሓባ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 2
ኣዞማች
ብድኻም ንሰባት ኣይፍንፍንን ንሱ/2/
ምድሓን ናይ ነፍሳትዩ ንዕኡስ ሓጎሱ
ንዓይ ንኽደሊ መጺኡ ንበይኑ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 3
ሪኣቶያ ነፍሰይ ነቲዒቢ ምድሓኑ
ኣዝማች
ነቲ ምረት ልበይ ሕልኽላኽ ናይ ቤተይ /ናይ ውሽጠይ/
ኩሉ ነገሩኒ ዘርዚሩ ታሪኸይ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 4
ሰላሙ ሂቡኒ ሰኽመይ ኣራጊፉ
ዳግም ሰሪሑኒ ልበይ ብእኡ ኣዕሪፉ
ኣዝማች

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/',
        lyrics_transliteration = 'CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 1
Ts’mey zeterks
Eti may hiywet''yu niay zifewese
Iyesus''yu nisu nefsey zireኽba
Bizey widae mihret nab ts’dቒ zisehaba

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 2
Azomach
Bidኻm nisebat ayfnfnn nisu (2)
Midhan nay nefsatyu nieus hagosu
Niay niኽdeli mets’iu nibeynu

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 3
Riatoya nefsey netiibi midhanu
Azmach
Neti miret libey hilኽlaኽ nay betey /nay wisht’ey/
Kulu negeruni zerziru tariኸy

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 4
Selamu hibuni seኽmey aragifu
Dagm serihuni libey bieu aerifu
Azmach

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ef562681-f81b-4e3a-b948-8d7d427699e7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 1
ፅምእይ ዘተርክስ
እቲ ማይ ሕይወት''ዩ ንዓይ ዝፈወሰ
ኢየሱስ''ዩ ንሱ ነፍሰይ ዝረኽባ
ብዘይ ውዳእ ምሕረት ናብ ጽድቒ ዝሰሓባ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 2
ኣዞማች
ብድኻም ንሰባት ኣይፍንፍንን ንሱ/2/
ምድሓን ናይ ነፍሳትዩ ንዕኡስ ሓጎሱ
ንዓይ ንኽደሊ መጺኡ ንበይኑ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 3
ሪኣቶያ ነፍሰይ ነቲዒቢ ምድሓኑ
ኣዝማች
ነቲ ምረት ልበይ ሕልኽላኽ ናይ ቤተይ /ናይ ውሽጠይ/
ኩሉ ነገሩኒ ዘርዚሩ ታሪኸይ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 4
ሰላሙ ሂቡኒ ሰኽመይ ኣራጊፉ
ዳግም ሰሪሑኒ ልበይ ብእኡ ኣዕሪፉ
ኣዝማች

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ef562681-f81b-4e3a-b948-8d7d427699e7'::uuid, 'beyenay-kalat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- christianyu-smey-orthodox-tewahdo-mezmur ("’ / Christian’yu smey / / orthodox tewahdo mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9c0812f6-8879-4d8c-936e-f964dc8cfe55'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 1
> Deገይ ጻዕዳ ጌረ ብውሽጠይ ግን ጸላም
ስመይ ናይ ክርስቶስ ግብረይ ግን ናይ ዓለም
ከም ሉቅሉቅ መቃብር በድኒ ተሸኪመ
ብምሱሉይ መንገዲ ክንደይ ድየ ሳጊመ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 2
ውሻጠ ውሻጠይ ንስኻ ኢኻ ተፈልጦ
ሓደራኻ ጎይታይ ህይወተይ ለውጦ
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 3
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2
> ይኣክል ሎሚ''ሲ በቃ ይእክለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 4
ሓቀኛ ማንነት ኣነ ከኽብረካ
ብስጋ ብነብሲ ክግዛእ ንዓኻ
በደለይ ረሲዕካ ይቅረ በለኒ ኢኻ''ሞ
ዘመነይ ኣብ ቤትካ ኾይነ ክዛዝሞ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 5
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 6
> ይኣክል ሎሚ''ሲ በቃ ይእክለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ
ሓቀኛ ማንነት ኣነ ከኽብረካ
ብስጋ ብነብሲ ክግዛእ ንዓኻ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 7
በደለይ ረሲዕካ ይቅረ በለኒ ኢኻ''ሞ
ዘመነይ ኣብ ቤትካ ኾይነ ክዛዝሞ
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 8
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 1
> Degey ts’aeda gere biwsht’ey gin ts’elam
Simey nay Kristos gibrey gin nay alem
Kem luqluq meqabr bedni teshekime
Bimsuluy mengedi kindey diye sagime

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 2
Wishat’e wishat’ey nisኻ iኻ tefelt’o
Haderaኻ goytay hiywetey lewt’o
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 3
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2
> yiakl lomi''si beqa yiekleni
Zeynsey mimsaley ts’oru kebiduni

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 4
Haqegna mannet ane keኽbreka
Bisga binebsi kigzae niaኻ
Bedeley resieka yiqre beleni iኻ''mo
Zemeney ab betka ኾyne kizazmo

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 5
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 6
> yiakl lomi''si beqa yiekleni
Zeynsey mimsaley ts’oru kebiduni
Haqegna mannet ane keኽbreka
Bisga binebsi kigzae niaኻ

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 7
Bedeley resieka yiqre beleni iኻ''mo
Zemeney ab betka ኾyne kizazmo
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 8
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 1
> Deገይ ጻዕዳ ጌረ ብውሽጠይ ግን ጸላም
ስመይ ናይ ክርስቶስ ግብረይ ግን ናይ ዓለም
ከም ሉቅሉቅ መቃብር በድኒ ተሸኪመ
ብምሱሉይ መንገዲ ክንደይ ድየ ሳጊመ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 2
ውሻጠ ውሻጠይ ንስኻ ኢኻ ተፈልጦ
ሓደራኻ ጎይታይ ህይወተይ ለውጦ
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 3
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2
> ይኣክል ሎሚ''ሲ በቃ ይእክለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 4
ሓቀኛ ማንነት ኣነ ከኽብረካ
ብስጋ ብነብሲ ክግዛእ ንዓኻ
በደለይ ረሲዕካ ይቅረ በለኒ ኢኻ''ሞ
ዘመነይ ኣብ ቤትካ ኾይነ ክዛዝሞ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 5
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 6
> ይኣክል ሎሚ''ሲ በቃ ይእክለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ
ሓቀኛ ማንነት ኣነ ከኽብረካ
ብስጋ ብነብሲ ክግዛእ ንዓኻ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 7
በደለይ ረሲዕካ ይቅረ በለኒ ኢኻ''ሞ
ዘመነይ ኣብ ቤትካ ኾይነ ክዛዝሞ
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 8
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2',
        lyrics_transliteration = 'CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 1
> Degey ts’aeda gere biwsht’ey gin ts’elam
Simey nay Kristos gibrey gin nay alem
Kem luqluq meqabr bedni teshekime
Bimsuluy mengedi kindey diye sagime

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 2
Wishat’e wishat’ey nisኻ iኻ tefelt’o
Haderaኻ goytay hiywetey lewt’o
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 3
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2
> yiakl lomi''si beqa yiekleni
Zeynsey mimsaley ts’oru kebiduni

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 4
Haqegna mannet ane keኽbreka
Bisga binebsi kigzae niaኻ
Bedeley resieka yiqre beleni iኻ''mo
Zemeney ab betka ኾyne kizazmo

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 5
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 6
> yiakl lomi''si beqa yiekleni
Zeynsey mimsaley ts’oru kebiduni
Haqegna mannet ane keኽbreka
Bisga binebsi kigzae niaኻ

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 7
Bedeley resieka yiqre beleni iኻ''mo
Zemeney ab betka ኾyne kizazmo
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 8
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

CHORUS
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9c0812f6-8879-4d8c-936e-f964dc8cfe55'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 1
> Deገይ ጻዕዳ ጌረ ብውሽጠይ ግን ጸላም
ስመይ ናይ ክርስቶስ ግብረይ ግን ናይ ዓለም
ከም ሉቅሉቅ መቃብር በድኒ ተሸኪመ
ብምሱሉይ መንገዲ ክንደይ ድየ ሳጊመ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 2
ውሻጠ ውሻጠይ ንስኻ ኢኻ ተፈልጦ
ሓደራኻ ጎይታይ ህይወተይ ለውጦ
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 3
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2
> ይኣክል ሎሚ''ሲ በቃ ይእክለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 4
ሓቀኛ ማንነት ኣነ ከኽብረካ
ብስጋ ብነብሲ ክግዛእ ንዓኻ
በደለይ ረሲዕካ ይቅረ በለኒ ኢኻ''ሞ
ዘመነይ ኣብ ቤትካ ኾይነ ክዛዝሞ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 5
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 6
> ይኣክል ሎሚ''ሲ በቃ ይእክለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ
ሓቀኛ ማንነት ኣነ ከኽብረካ
ብስጋ ብነብሲ ክግዛእ ንዓኻ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 7
በደለይ ረሲዕካ ይቅረ በለኒ ኢኻ''ሞ
ዘመነይ ኣብ ቤትካ ኾይነ ክዛዝሞ
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 8
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

CHORUS
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9c0812f6-8879-4d8c-936e-f964dc8cfe55'::uuid, 'christianyu-smey-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tegten-entseley-like-mezemeran-tewodros-yosef ("Tegten Entseley Like Mezemeran Tewodros Yosef")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd2a144d7-cbb2-4d3c-aefc-1f4f24e2cbcc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 1
በጸጋ እንድንኖር የሚቃወመን ጠላትም ይድቀቅ
በጦር ሰፈርነን ያጠላታችን ሌጊዮን ታጥቋል
መሳሪያ ሳንይዝ የወጣነውን ስንቶቹን ጥሏል
ዘይት አልቆብን የመቅረዛችን መብራት ደብዝዟል

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 2
ብርሃኑን ጥለን የጠላት ምሽግ በምን ይታያል
ያዘነ ብላል ጆሮን ወደእኛ ጠላት ይመታል
ወጥመዱን ሰብሮ ያመንበትን ያሻግረናል
ያሰማራናል በለምለሙ መስክ በተስፋ ሞልቶ

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 3
ማንአፍሮ ያውቃል የእግአብሔርን ስሙንስ ጠርቶ
የክብር ዘይት በቆሰለው ሰው ቀድተው የሚያ ፊሱት
መድኃኒት ነው ለአለም ሁሉ ዲናር የማይከፍሉት
የፍቅር አባት ደጁን ስንመታ ይከፍትልናል

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 4
መሻታችንን እየፈጸመ ይባርከናል

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq

VERSE 1
Bets’ega endnnor yemiqawemen t’elatm yidqeq
Bet’or sefernen yat’elatachn legiyon tat’qwal
Mesariya sanyz yewet’anewn sintochun t’lwal
Zeyt alqobn yemeqrezachn mebrat debzzwal

CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq

VERSE 2
Birhanun t’len yet’elat mishg bemn yitayal
Yazene bilal joron wedeegna t’elat yimetal
Wet’medun sebro yamenbetn yashagrenal
Yasemaranal belemlemu mesk betesfa molto

CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq

VERSE 3
Manafro yawqal yeegabhern simuns t’erto
Yekbr zeyt beqoselew sew qedtew yemiya fisut
Medhanit new lealem hulu dinar yemaykeflut
Yefqr abat dejun sinmeta yikeftlnal

CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq

VERSE 4
Meshatachnn eyefets’eme yibarkenal

CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 1
በጸጋ እንድንኖር የሚቃወመን ጠላትም ይድቀቅ
በጦር ሰፈርነን ያጠላታችን ሌጊዮን ታጥቋል
መሳሪያ ሳንይዝ የወጣነውን ስንቶቹን ጥሏል
ዘይት አልቆብን የመቅረዛችን መብራት ደብዝዟል

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 2
ብርሃኑን ጥለን የጠላት ምሽግ በምን ይታያል
ያዘነ ብላል ጆሮን ወደእኛ ጠላት ይመታል
ወጥመዱን ሰብሮ ያመንበትን ያሻግረናል
ያሰማራናል በለምለሙ መስክ በተስፋ ሞልቶ

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 3
ማንአፍሮ ያውቃል የእግአብሔርን ስሙንስ ጠርቶ
የክብር ዘይት በቆሰለው ሰው ቀድተው የሚያ ፊሱት
መድኃኒት ነው ለአለም ሁሉ ዲናር የማይከፍሉት
የፍቅር አባት ደጁን ስንመታ ይከፍትልናል

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 4
መሻታችንን እየፈጸመ ይባርከናል

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ',
        lyrics_transliteration = 'CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq

VERSE 1
Bets’ega endnnor yemiqawemen t’elatm yidqeq
Bet’or sefernen yat’elatachn legiyon tat’qwal
Mesariya sanyz yewet’anewn sintochun t’lwal
Zeyt alqobn yemeqrezachn mebrat debzzwal

CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq

VERSE 2
Birhanun t’len yet’elat mishg bemn yitayal
Yazene bilal joron wedeegna t’elat yimetal
Wet’medun sebro yamenbetn yashagrenal
Yasemaranal belemlemu mesk betesfa molto

CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq

VERSE 3
Manafro yawqal yeegabhern simuns t’erto
Yekbr zeyt beqoselew sew qedtew yemiya fisut
Medhanit new lealem hulu dinar yemaykeflut
Yefqr abat dejun sinmeta yikeftlnal

CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq

VERSE 4
Meshatachnn eyefets’eme yibarkenal

CHORUS
Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd2a144d7-cbb2-4d3c-aefc-1f4f24e2cbcc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 1
በጸጋ እንድንኖር የሚቃወመን ጠላትም ይድቀቅ
በጦር ሰፈርነን ያጠላታችን ሌጊዮን ታጥቋል
መሳሪያ ሳንይዝ የወጣነውን ስንቶቹን ጥሏል
ዘይት አልቆብን የመቅረዛችን መብራት ደብዝዟል

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 2
ብርሃኑን ጥለን የጠላት ምሽግ በምን ይታያል
ያዘነ ብላል ጆሮን ወደእኛ ጠላት ይመታል
ወጥመዱን ሰብሮ ያመንበትን ያሻግረናል
ያሰማራናል በለምለሙ መስክ በተስፋ ሞልቶ

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 3
ማንአፍሮ ያውቃል የእግአብሔርን ስሙንስ ጠርቶ
የክብር ዘይት በቆሰለው ሰው ቀድተው የሚያ ፊሱት
መድኃኒት ነው ለአለም ሁሉ ዲናር የማይከፍሉት
የፍቅር አባት ደጁን ስንመታ ይከፍትልናል

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 4
መሻታችንን እየፈጸመ ይባርከናል

CHORUS
ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd2a144d7-cbb2-4d3c-aefc-1f4f24e2cbcc'::uuid, 'tegten-entseley-like-mezemeran-tewodros-yosef', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adignign-enate ("Adignign Enate")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2e38e53d-59de-4901-9916-41e0b59c783e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሀይል
ምንም ቢበዛብሽ የእኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና /2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 2
ተስፋዬ ነሽና እመካብሻልሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሰጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ/2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 3
በስጋ ደክሜ በነፍሴ እንዳልጠፋ
እማጸንሻለሁ ድንግል የእኔ ተስፋ
ለመንግሥቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራን መስራት እኔን አስተምሪኝ /2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 4
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመሃከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኚልኝ ጓዳውን/2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 1
YeAmanuel enat yetewahdo aklil
Att’fi kemehal endthognn heyl
Minm bibezabsh yeegna gusqulna
Kegna gara kehonsh alen qidsna (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 2
Tesfaye neshna emekabshalhu
Gira qegnm all mirkognash hognalehu
Siqbezebez ayto tesfa yeset’egn
Egziabher yemesgen kanchi yast’egagn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 3
Besga dekme benefse endalt’efa
Emats’enshalehu Dingil yeene tesfa
Lemengstu werash endhon adrgign
Melkam siran mesrat enen astemrign (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 4
Anchi yeleleshbet gubaew bado new
Bequm yedereqe hiywet yeteleyew
Kemehakel gebtesh muy yegodelewn
Sergu tedegswal gobgnilgn gwadawn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሀይል
ምንም ቢበዛብሽ የእኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና /2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 2
ተስፋዬ ነሽና እመካብሻልሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሰጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ/2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 3
በስጋ ደክሜ በነፍሴ እንዳልጠፋ
እማጸንሻለሁ ድንግል የእኔ ተስፋ
ለመንግሥቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራን መስራት እኔን አስተምሪኝ /2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 4
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመሃከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኚልኝ ጓዳውን/2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/',
        lyrics_transliteration = 'CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 1
YeAmanuel enat yetewahdo aklil
Att’fi kemehal endthognn heyl
Minm bibezabsh yeegna gusqulna
Kegna gara kehonsh alen qidsna (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 2
Tesfaye neshna emekabshalhu
Gira qegnm all mirkognash hognalehu
Siqbezebez ayto tesfa yeset’egn
Egziabher yemesgen kanchi yast’egagn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 3
Besga dekme benefse endalt’efa
Emats’enshalehu Dingil yeene tesfa
Lemengstu werash endhon adrgign
Melkam siran mesrat enen astemrign (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 4
Anchi yeleleshbet gubaew bado new
Bequm yedereqe hiywet yeteleyew
Kemehakel gebtesh muy yegodelewn
Sergu tedegswal gobgnilgn gwadawn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2e38e53d-59de-4901-9916-41e0b59c783e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሀይል
ምንም ቢበዛብሽ የእኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና /2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 2
ተስፋዬ ነሽና እመካብሻልሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሰጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ/2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 3
በስጋ ደክሜ በነፍሴ እንዳልጠፋ
እማጸንሻለሁ ድንግል የእኔ ተስፋ
ለመንግሥቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራን መስራት እኔን አስተምሪኝ /2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 4
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመሃከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኚልኝ ጓዳውን/2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2e38e53d-59de-4901-9916-41e0b59c783e'::uuid, 'adignign-enate', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-tekebel-meswaetey ("eritrean orthodox tewahdo mezmur/ /Tekebel Meswaetey")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd9043931-1875-45fe-95ab-bc3544169b4d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 1
ፍረ ከናፍረይ ተቐበል ወስዋእተይ
ተስፋይ ኣባኻ እምበር ኣብ ኢድ ሰብ ኣይኮነን
እምነተይ ኣባኻ ፈጺሙ ኣይውዳእን
ዕጽው እንተመሰh ደገታት ዕድhይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 2
ይኣምን እየ ኣነስ ከምዘhኻ ምሳይ/2/
+
ንሰብ ዘይከኣል ቀሊል''ዩ ንዓኻ
ንኹሉ ትመልኽ ጎይታ ፍሉይ ኢኻ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 3
ንስኻ ክትከፍት ከ መን ኣሎ ዓጻዊ
ተስፋ ሓጥእ ነፍሰይ ሕያዋይ ሳምራዊ/2/
+ +
ጌርካhይ ኢኻ''ሞ ከመስግነካዬ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 4
ኣፍቂርካኒ ኢኻ''ሞ ከምልኸካ እዬ
ንኽብሪ ዕቤትካ በገናይ ኣhዒh
ክዝምረልካዬ ድምጸይ ክብ ኣቢለ/2/
ሓhፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑለይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 5
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ሎ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ
ፍረ ከናፍረይ ተቐበል መስዋእተይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 1
Fire kenafrey teቐbel weswaetey
Tesfay abaኻ ember ab id seb aykonen
Emnetey abaኻ fets’imu aywdaen
Ets’w entemeseh degetat edhy

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 2
Yiamn eye anes kemzehኻ misay (2)
+
Niseb zeykeal qelil''yu niaኻ
Niኹlu timelኽ goyta filuy iኻ

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 3
Nisኻ kitkeft ke men alo ats’awi
Tesfa hat’e nefsey hiyaway samrawi (2)
+ +
Gerkahy iኻ''mo kemesgnekaye

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 4
Afqirkani iኻ''mo kemlኸka eye
Niኽbri ebetka begenay ahih
Kizmrelkaye dimts’ey kib abile (2)
Hahfeyoye maebelat hiywetey selamka bezihuley

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 5
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''lo mo libey
Enho ellta enho misganay
Fire kenafrey teቐbel meswaetey

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 1
ፍረ ከናፍረይ ተቐበል ወስዋእተይ
ተስፋይ ኣባኻ እምበር ኣብ ኢድ ሰብ ኣይኮነን
እምነተይ ኣባኻ ፈጺሙ ኣይውዳእን
ዕጽው እንተመሰh ደገታት ዕድhይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 2
ይኣምን እየ ኣነስ ከምዘhኻ ምሳይ/2/
+
ንሰብ ዘይከኣል ቀሊል''ዩ ንዓኻ
ንኹሉ ትመልኽ ጎይታ ፍሉይ ኢኻ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 3
ንስኻ ክትከፍት ከ መን ኣሎ ዓጻዊ
ተስፋ ሓጥእ ነፍሰይ ሕያዋይ ሳምራዊ/2/
+ +
ጌርካhይ ኢኻ''ሞ ከመስግነካዬ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 4
ኣፍቂርካኒ ኢኻ''ሞ ከምልኸካ እዬ
ንኽብሪ ዕቤትካ በገናይ ኣhዒh
ክዝምረልካዬ ድምጸይ ክብ ኣቢለ/2/
ሓhፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑለይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 5
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ሎ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ
ፍረ ከናፍረይ ተቐበል መስዋእተይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ',
        lyrics_transliteration = 'CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 1
Fire kenafrey teቐbel weswaetey
Tesfay abaኻ ember ab id seb aykonen
Emnetey abaኻ fets’imu aywdaen
Ets’w entemeseh degetat edhy

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 2
Yiamn eye anes kemzehኻ misay (2)
+
Niseb zeykeal qelil''yu niaኻ
Niኹlu timelኽ goyta filuy iኻ

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 3
Nisኻ kitkeft ke men alo ats’awi
Tesfa hat’e nefsey hiyaway samrawi (2)
+ +
Gerkahy iኻ''mo kemesgnekaye

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 4
Afqirkani iኻ''mo kemlኸka eye
Niኽbri ebetka begenay ahih
Kizmrelkaye dimts’ey kib abile (2)
Hahfeyoye maebelat hiywetey selamka bezihuley

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 5
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''lo mo libey
Enho ellta enho misganay
Fire kenafrey teቐbel meswaetey

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd9043931-1875-45fe-95ab-bc3544169b4d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 1
ፍረ ከናፍረይ ተቐበል ወስዋእተይ
ተስፋይ ኣባኻ እምበር ኣብ ኢድ ሰብ ኣይኮነን
እምነተይ ኣባኻ ፈጺሙ ኣይውዳእን
ዕጽው እንተመሰh ደገታት ዕድhይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 2
ይኣምን እየ ኣነስ ከምዘhኻ ምሳይ/2/
+
ንሰብ ዘይከኣል ቀሊል''ዩ ንዓኻ
ንኹሉ ትመልኽ ጎይታ ፍሉይ ኢኻ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 3
ንስኻ ክትከፍት ከ መን ኣሎ ዓጻዊ
ተስፋ ሓጥእ ነፍሰይ ሕያዋይ ሳምራዊ/2/
+ +
ጌርካhይ ኢኻ''ሞ ከመስግነካዬ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 4
ኣፍቂርካኒ ኢኻ''ሞ ከምልኸካ እዬ
ንኽብሪ ዕቤትካ በገናይ ኣhዒh
ክዝምረልካዬ ድምጸይ ክብ ኣቢለ/2/
ሓhፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑለይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 5
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ሎ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ
ፍረ ከናፍረይ ተቐበል መስዋእተይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd9043931-1875-45fe-95ab-bc3544169b4d'::uuid, 'eritrean-orthodox-tewahdo-mezmur-tekebel-meswaetey', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
