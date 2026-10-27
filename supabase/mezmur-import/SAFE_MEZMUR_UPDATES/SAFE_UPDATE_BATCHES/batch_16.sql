-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 16 OF 32
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
  -- ene-alazinim ("Ene Alazinim")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '08031bf1-bee9-4cbd-bcd5-bb7f042b9099'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 1
ለጠራኸው ጌታዬ እንዳሳብህ
ቢያስጨንቅም ነገር ለበጎ ነው
ቢያስተክዝም ፍፃሜው መልካም ነው
አሜን, ይሁን አንተ የወደድከው ለእኔ የፈቀድከው 2x

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 2
አዝ…………
ከእናት በላይ የምታጽናናኝ
ከአባት በላይ አቅፈህ የምትስመኝ
የወለድከኝ በፅኑ መከራ

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 3
ያሳደከኝ በመስቀል ስራ
ስላለኸኝ ኢየሱስ ሰላሜ
ተጽናናው ደግሜ 2x
አዝ………

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 4
አላነባም ሰው የለኝም ብዬ
የሻትከውን ስትሰራው ጌታዬ
የኔም ጉዞ ወደ አንተ ነውና
መሰብሰቤ ከቶ አይቀርም እና

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 5
ላመስግንህ ስለሆነው ሁሉ
እግዚሐብሔር ሀያሉ 2x
አዝ…………
ያጣሁትን በእጥፍ ትተካለህ

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 6
ሸለቆዬን ደስታ ትሞላለህ
የፍቅርህ እጅህ ከአይኔ በታች አርፏል
እያበሰ እንባዬን አንጥፏል
ዘምራለው ይኸው እንደገና ሁሉም አልፏልና 2x

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 7
አዝ…………

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 1
Let’eraኸw Getaye endasabh
Biyasch’enqm neger lebego new
Biyastekzm fits’amew melkam new
Amen, yihun ante yewededkew leene yefeqedkew 2x

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 2
CHORUS
Keenat belay yemtats’nanagn
Keabat belay aqfeh yemtsmegn
Yeweledkegn bets’nu mekera

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 3
Yasadekegn bemesqel sira
Silaleኸgn Iyesus selame
Tets’nanaw degme 2x
CHORUS

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 4
Alanebam sew yelegnm biye
Yeshatkewn sitseraw Getaye
Yenem guzo wede ante newna
Mesebsebe keto ayqerm ena

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 5
Lamesgnh silehonew hulu
Egzihebher heyalu 2x
CHORUS
Yat’ahutn beet’f titekaleh

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 6
Sheleqoyen desta timolaleh
Yefqrh ejh keayne betach arfwal
Eyabese enbayen ant’fwal
Zemralew yiኸw endegena hulum alfwalna 2x

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 7
CHORUS

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 1
ለጠራኸው ጌታዬ እንዳሳብህ
ቢያስጨንቅም ነገር ለበጎ ነው
ቢያስተክዝም ፍፃሜው መልካም ነው
አሜን, ይሁን አንተ የወደድከው ለእኔ የፈቀድከው 2x

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 2
አዝ…………
ከእናት በላይ የምታጽናናኝ
ከአባት በላይ አቅፈህ የምትስመኝ
የወለድከኝ በፅኑ መከራ

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 3
ያሳደከኝ በመስቀል ስራ
ስላለኸኝ ኢየሱስ ሰላሜ
ተጽናናው ደግሜ 2x
አዝ………

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 4
አላነባም ሰው የለኝም ብዬ
የሻትከውን ስትሰራው ጌታዬ
የኔም ጉዞ ወደ አንተ ነውና
መሰብሰቤ ከቶ አይቀርም እና

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 5
ላመስግንህ ስለሆነው ሁሉ
እግዚሐብሔር ሀያሉ 2x
አዝ…………
ያጣሁትን በእጥፍ ትተካለህ

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 6
ሸለቆዬን ደስታ ትሞላለህ
የፍቅርህ እጅህ ከአይኔ በታች አርፏል
እያበሰ እንባዬን አንጥፏል
ዘምራለው ይኸው እንደገና ሁሉም አልፏልና 2x

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 7
አዝ…………

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ',
        lyrics_transliteration = 'CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 1
Let’eraኸw Getaye endasabh
Biyasch’enqm neger lebego new
Biyastekzm fits’amew melkam new
Amen, yihun ante yewededkew leene yefeqedkew 2x

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 2
CHORUS
Keenat belay yemtats’nanagn
Keabat belay aqfeh yemtsmegn
Yeweledkegn bets’nu mekera

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 3
Yasadekegn bemesqel sira
Silaleኸgn Iyesus selame
Tets’nanaw degme 2x
CHORUS

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 4
Alanebam sew yelegnm biye
Yeshatkewn sitseraw Getaye
Yenem guzo wede ante newna
Mesebsebe keto ayqerm ena

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 5
Lamesgnh silehonew hulu
Egzihebher heyalu 2x
CHORUS
Yat’ahutn beet’f titekaleh

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 6
Sheleqoyen desta timolaleh
Yefqrh ejh keayne betach arfwal
Eyabese enbayen ant’fwal
Zemralew yiኸw endegena hulum alfwalna 2x

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 7
CHORUS

CHORUS
Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '08031bf1-bee9-4cbd-bcd5-bb7f042b9099'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 1
ለጠራኸው ጌታዬ እንዳሳብህ
ቢያስጨንቅም ነገር ለበጎ ነው
ቢያስተክዝም ፍፃሜው መልካም ነው
አሜን, ይሁን አንተ የወደድከው ለእኔ የፈቀድከው 2x

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 2
አዝ…………
ከእናት በላይ የምታጽናናኝ
ከአባት በላይ አቅፈህ የምትስመኝ
የወለድከኝ በፅኑ መከራ

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 3
ያሳደከኝ በመስቀል ስራ
ስላለኸኝ ኢየሱስ ሰላሜ
ተጽናናው ደግሜ 2x
አዝ………

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 4
አላነባም ሰው የለኝም ብዬ
የሻትከውን ስትሰራው ጌታዬ
የኔም ጉዞ ወደ አንተ ነውና
መሰብሰቤ ከቶ አይቀርም እና

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 5
ላመስግንህ ስለሆነው ሁሉ
እግዚሐብሔር ሀያሉ 2x
አዝ…………
ያጣሁትን በእጥፍ ትተካለህ

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 6
ሸለቆዬን ደስታ ትሞላለህ
የፍቅርህ እጅህ ከአይኔ በታች አርፏል
እያበሰ እንባዬን አንጥፏል
ዘምራለው ይኸው እንደገና ሁሉም አልፏልና 2x

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 7
አዝ…………

CHORUS
እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '08031bf1-bee9-4cbd-bcd5-bb7f042b9099'::uuid, 'ene-alazinim', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mesach-mezimur-asa-mebilat-ayidelem-kesis-ashenafi-gebiremariyam ("Mesach Mezimur Asa Mebilat Ayidelem Kesis Ashenafi Gebiremariyam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '70287ddf-4152-413b-bb24-6e120c598ba3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 1
ከኔ ዮሴፍ ጋራ ላውርድህ ከመስቀል
ከነ ማርያም ጋራ ልውጣ ጎልጎታ
ወደ ጥልቁ ፈቀቅ አርገኝ የኔ ጌታ
ተጠርቶ ከቤቱ መንገድ ላይ የቀረ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 2
በረሃ የበላው በዓለም ላይ ያደረ
መስቀል ተሸክሞ ያልገባው መስቀሉ
የሚያድር ተስማምቶ ከተገኘ ሁሉ
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 3
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
ወደ ጥልቁ ፈቀቅ ነበር ክርስትና

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 4
በአውሎና በወጀብ በባህር ጎዳና
በሸንጎ ፊት መቆም ጅራፍ መቀበል
ስቀለው ስቀለው ይወገድ መባል
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 5
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
በሞት ጥላ መሀል በህይወት መውጣት

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 6
ከእረኛው ጋራ በስንጥቅ አለት
በፀጋው ለዳኑ ስሙን ለሚወዱ
አልጋ በአልጋ አይደለም ከባድ ነው መንገዱ
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 7
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 1
Kene yosef gara lawrdh kemesqel
Kene Maryam gara liwt’a golgota
Wede t’lqu feqeq argegn yene Geta
Tet’erto kebetu menged lay yeqere

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 2
Bereha yebelaw bealem lay yadere
Mesqel teshekmo yalgebaw mesqelu
Yemiyadr tesmamto ketegegne hulu
Alama yelelew meshtobet adari

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 3
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre
Wede t’lqu feqeq neber kirstna

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 4
Beawlona bewejeb bebahr godana
Beshengo fit meqom jiraf meqebel
Siqelew siqelew yiweged mebal
Alama yelelew meshtobet adari

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 5
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre
Bemot t’la mehel behywet mewt’at

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 6
Keeregnaw gara besnt’q alet
Bets’egaw ledanu simun lemiwedu
Alga bealga aydelem kebad new mengedu
Alama yelelew meshtobet adari

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 7
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 1
ከኔ ዮሴፍ ጋራ ላውርድህ ከመስቀል
ከነ ማርያም ጋራ ልውጣ ጎልጎታ
ወደ ጥልቁ ፈቀቅ አርገኝ የኔ ጌታ
ተጠርቶ ከቤቱ መንገድ ላይ የቀረ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 2
በረሃ የበላው በዓለም ላይ ያደረ
መስቀል ተሸክሞ ያልገባው መስቀሉ
የሚያድር ተስማምቶ ከተገኘ ሁሉ
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 3
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
ወደ ጥልቁ ፈቀቅ ነበር ክርስትና

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 4
በአውሎና በወጀብ በባህር ጎዳና
በሸንጎ ፊት መቆም ጅራፍ መቀበል
ስቀለው ስቀለው ይወገድ መባል
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 5
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
በሞት ጥላ መሀል በህይወት መውጣት

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 6
ከእረኛው ጋራ በስንጥቅ አለት
በፀጋው ለዳኑ ስሙን ለሚወዱ
አልጋ በአልጋ አይደለም ከባድ ነው መንገዱ
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 7
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል',
        lyrics_transliteration = 'CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 1
Kene yosef gara lawrdh kemesqel
Kene Maryam gara liwt’a golgota
Wede t’lqu feqeq argegn yene Geta
Tet’erto kebetu menged lay yeqere

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 2
Bereha yebelaw bealem lay yadere
Mesqel teshekmo yalgebaw mesqelu
Yemiyadr tesmamto ketegegne hulu
Alama yelelew meshtobet adari

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 3
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre
Wede t’lqu feqeq neber kirstna

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 4
Beawlona bewejeb bebahr godana
Beshengo fit meqom jiraf meqebel
Siqelew siqelew yiweged mebal
Alama yelelew meshtobet adari

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 5
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre
Bemot t’la mehel behywet mewt’at

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 6
Keeregnaw gara besnt’q alet
Bets’egaw ledanu simun lemiwedu
Alga bealga aydelem kebad new mengedu
Alama yelelew meshtobet adari

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 7
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel',
        updated_at = clock_timestamp()::text
    WHERE import_id = '70287ddf-4152-413b-bb24-6e120c598ba3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 1
ከኔ ዮሴፍ ጋራ ላውርድህ ከመስቀል
ከነ ማርያም ጋራ ልውጣ ጎልጎታ
ወደ ጥልቁ ፈቀቅ አርገኝ የኔ ጌታ
ተጠርቶ ከቤቱ መንገድ ላይ የቀረ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 2
በረሃ የበላው በዓለም ላይ ያደረ
መስቀል ተሸክሞ ያልገባው መስቀሉ
የሚያድር ተስማምቶ ከተገኘ ሁሉ
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 3
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
ወደ ጥልቁ ፈቀቅ ነበር ክርስትና

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 4
በአውሎና በወጀብ በባህር ጎዳና
በሸንጎ ፊት መቆም ጅራፍ መቀበል
ስቀለው ስቀለው ይወገድ መባል
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 5
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
በሞት ጥላ መሀል በህይወት መውጣት

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 6
ከእረኛው ጋራ በስንጥቅ አለት
በፀጋው ለዳኑ ስሙን ለሚወዱ
አልጋ በአልጋ አይደለም ከባድ ነው መንገዱ
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 7
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '70287ddf-4152-413b-bb24-6e120c598ba3'::uuid, 'mesach-mezimur-asa-mebilat-ayidelem-kesis-ashenafi-gebiremariyam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- keekifih ("Keekifih")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b06e4edb-4986-44b4-b8fd-88981e42b48b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 1
ከውድቀቴ ስመለስ ከጥፋቴ ጎዳና
በእጥፍ አሳየኸኝ መውደድክን እንደገና
አይኖቼን ወደ ዓለም ጀርባዬን ደግሞ ላንተ
ሰጥቼ የኖርኩበት ያ ዘመን ተከተተ

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 2
በናፍቆት ደጅ ደጅህን በተስፋ እያየህ
ትጠብቀኝ ነበረ በዚያ ልክ ገፍቼህ
ባማረ ነጭ በፍታ ድል ባለ ድግስ
ተቀበልከኝ አባባ ሆነህልኝ ሞገስ ( 2 )

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 3
ብጎድልም ከበረትህ ብከስርም በምርጫዬ
ሙላቴ ነህ ለእኔ አለም ክብሬ ነህ ማጌጫዬ
ለምኞቴ ተስቤ ፀጋዬን እንዳላጣ
እንደ ፈቃድህ ትሁን አጥናልኝ የእኔን እጣ

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 4
ሁሉ ይቅርብኝ ብዬ ልጅነት ክብርም ዝና
ከጥፋቴ ብመለስ ወደ ደጅህ ባቀና
ከሸሸሁህ ሺህ እርምጃ እልፍ ጊዜ ቀረብከኝ
የሚያስወድድ ሳይኖረኝ ኧረ እንደምን ወደድከኝ (2)

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate

VERSE 1
Kewdqete simeles ket’fate godana
Beet’f asayeኸgn mewdedkn endegena
Aynochen wede alem jerbayen degmo lante
Set’che yenorkubet ya zemen teketete

CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate

VERSE 2
Benafqot dej dejhn betesfa eyayeh
Tit’ebqegn nebere beziya lik gefcheh
Bamare nech’ befta dil bale digs
Teqebelkegn ababa honehlgn moges (2)

CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate

VERSE 3
Bigodlm kebereth bikesrm bemrch’aye
Mulate neh leene alem kibre neh magech’aye
Lemgnote tesbe ts’egayen endalat’a
Ende feqadh tihun at’nalgn yeenen et’a

CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate

VERSE 4
Hulu yiqrbgn biye lijnet kibrm zina
Ket’fate bimeles wede dejh baqena
Kesheshehuh shih ermja elf gize qerebkegn
Yemiyaswedd saynoregn ኧre endemn wededkegn (2)

CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 1
ከውድቀቴ ስመለስ ከጥፋቴ ጎዳና
በእጥፍ አሳየኸኝ መውደድክን እንደገና
አይኖቼን ወደ ዓለም ጀርባዬን ደግሞ ላንተ
ሰጥቼ የኖርኩበት ያ ዘመን ተከተተ

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 2
በናፍቆት ደጅ ደጅህን በተስፋ እያየህ
ትጠብቀኝ ነበረ በዚያ ልክ ገፍቼህ
ባማረ ነጭ በፍታ ድል ባለ ድግስ
ተቀበልከኝ አባባ ሆነህልኝ ሞገስ ( 2 )

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 3
ብጎድልም ከበረትህ ብከስርም በምርጫዬ
ሙላቴ ነህ ለእኔ አለም ክብሬ ነህ ማጌጫዬ
ለምኞቴ ተስቤ ፀጋዬን እንዳላጣ
እንደ ፈቃድህ ትሁን አጥናልኝ የእኔን እጣ

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 4
ሁሉ ይቅርብኝ ብዬ ልጅነት ክብርም ዝና
ከጥፋቴ ብመለስ ወደ ደጅህ ባቀና
ከሸሸሁህ ሺህ እርምጃ እልፍ ጊዜ ቀረብከኝ
የሚያስወድድ ሳይኖረኝ ኧረ እንደምን ወደድከኝ (2)

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ',
        lyrics_transliteration = 'CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate

VERSE 1
Kewdqete simeles ket’fate godana
Beet’f asayeኸgn mewdedkn endegena
Aynochen wede alem jerbayen degmo lante
Set’che yenorkubet ya zemen teketete

CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate

VERSE 2
Benafqot dej dejhn betesfa eyayeh
Tit’ebqegn nebere beziya lik gefcheh
Bamare nech’ befta dil bale digs
Teqebelkegn ababa honehlgn moges (2)

CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate

VERSE 3
Bigodlm kebereth bikesrm bemrch’aye
Mulate neh leene alem kibre neh magech’aye
Lemgnote tesbe ts’egayen endalat’a
Ende feqadh tihun at’nalgn yeenen et’a

CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate

VERSE 4
Hulu yiqrbgn biye lijnet kibrm zina
Ket’fate bimeles wede dejh baqena
Kesheshehuh shih ermja elf gize qerebkegn
Yemiyaswedd saynoregn ኧre endemn wededkegn (2)

CHORUS
Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b06e4edb-4986-44b4-b8fd-88981e42b48b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 1
ከውድቀቴ ስመለስ ከጥፋቴ ጎዳና
በእጥፍ አሳየኸኝ መውደድክን እንደገና
አይኖቼን ወደ ዓለም ጀርባዬን ደግሞ ላንተ
ሰጥቼ የኖርኩበት ያ ዘመን ተከተተ

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 2
በናፍቆት ደጅ ደጅህን በተስፋ እያየህ
ትጠብቀኝ ነበረ በዚያ ልክ ገፍቼህ
ባማረ ነጭ በፍታ ድል ባለ ድግስ
ተቀበልከኝ አባባ ሆነህልኝ ሞገስ ( 2 )

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 3
ብጎድልም ከበረትህ ብከስርም በምርጫዬ
ሙላቴ ነህ ለእኔ አለም ክብሬ ነህ ማጌጫዬ
ለምኞቴ ተስቤ ፀጋዬን እንዳላጣ
እንደ ፈቃድህ ትሁን አጥናልኝ የእኔን እጣ

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 4
ሁሉ ይቅርብኝ ብዬ ልጅነት ክብርም ዝና
ከጥፋቴ ብመለስ ወደ ደጅህ ባቀና
ከሸሸሁህ ሺህ እርምጃ እልፍ ጊዜ ቀረብከኝ
የሚያስወድድ ሳይኖረኝ ኧረ እንደምን ወደድከኝ (2)

CHORUS
ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b06e4edb-4986-44b4-b8fd-88981e42b48b'::uuid, 'keekifih', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dinigil-fetariwan-weledechiw-628 ("Dinigil Fetariwan Weledechiw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a91bbfc5-888c-4e6e-a28b-6512f053eed9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 1
ጨነቃት ጠበባት የዳዊት ከተማ
የጌታ መወለድ ታምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 2
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 3
ሰብአ ሰገል መጡ ከሩቅ ምስራቅ ሀገር
ወርቅ እጣን ከርቤዉን ለርሱ ለመገበር
በእናቱም እቅፍ አገኙት ህፃኑን
ላለም ተናገሩ ንጉስ መወለዱን

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 4
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 5
የይሁዳ ምድር ምስጋና ተመላ
ንጉስ መታልና ከናዝሬት ገሊላ
ታምሩን ትናገር ቤተልሄም ታዉራ
ዝማሬ ሲወጣ ከርስቱ ቆጠራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 6
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 7
የማይታይ ታየ ተዳሰሰ አንደ ሰዉ
በጠባቡ ደረት አዳምን መሰለዉ
ገረማት ጥበቡ ታናሹአን ሙሽራ
ተዋህዳልና ቃል ከ ስጋ ጋራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 8
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 1
Ch’eneqat t’ebebat yedawit ketema
Yegeta meweled tamru sisema
Werede melaku misrach liyawera
Yehts’anu kibir bemdr abera

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 2
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 3
Seba segel met’u keruq misraq heger
Werq et’an kerbewun lersu lemegeber
Beenatum eqf agegnut hits’anun
Lalem tenageru nigus meweledun

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 4
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 5
Yeyhuda midr misgana temela
Nigus metalna kenazret gelila
Tamrun tinager betelhem tawura
Zimare siwet’a kerstu qot’era

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 6
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 7
Yemaytay taye tedasese ande sewu
Bet’ebabu deret adamn meselewu
Geremat t’bebu tanashuan mushra
Tewahdalna qal ke siga gara

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 8
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 1
ጨነቃት ጠበባት የዳዊት ከተማ
የጌታ መወለድ ታምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 2
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 3
ሰብአ ሰገል መጡ ከሩቅ ምስራቅ ሀገር
ወርቅ እጣን ከርቤዉን ለርሱ ለመገበር
በእናቱም እቅፍ አገኙት ህፃኑን
ላለም ተናገሩ ንጉስ መወለዱን

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 4
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 5
የይሁዳ ምድር ምስጋና ተመላ
ንጉስ መታልና ከናዝሬት ገሊላ
ታምሩን ትናገር ቤተልሄም ታዉራ
ዝማሬ ሲወጣ ከርስቱ ቆጠራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 6
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 7
የማይታይ ታየ ተዳሰሰ አንደ ሰዉ
በጠባቡ ደረት አዳምን መሰለዉ
ገረማት ጥበቡ ታናሹአን ሙሽራ
ተዋህዳልና ቃል ከ ስጋ ጋራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 8
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/',
        lyrics_transliteration = 'CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 1
Ch’eneqat t’ebebat yedawit ketema
Yegeta meweled tamru sisema
Werede melaku misrach liyawera
Yehts’anu kibir bemdr abera

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 2
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 3
Seba segel met’u keruq misraq heger
Werq et’an kerbewun lersu lemegeber
Beenatum eqf agegnut hits’anun
Lalem tenageru nigus meweledun

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 4
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 5
Yeyhuda midr misgana temela
Nigus metalna kenazret gelila
Tamrun tinager betelhem tawura
Zimare siwet’a kerstu qot’era

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 6
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 7
Yemaytay taye tedasese ande sewu
Bet’ebabu deret adamn meselewu
Geremat t’bebu tanashuan mushra
Tewahdalna qal ke siga gara

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 8
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a91bbfc5-888c-4e6e-a28b-6512f053eed9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 1
ጨነቃት ጠበባት የዳዊት ከተማ
የጌታ መወለድ ታምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 2
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 3
ሰብአ ሰገል መጡ ከሩቅ ምስራቅ ሀገር
ወርቅ እጣን ከርቤዉን ለርሱ ለመገበር
በእናቱም እቅፍ አገኙት ህፃኑን
ላለም ተናገሩ ንጉስ መወለዱን

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 4
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 5
የይሁዳ ምድር ምስጋና ተመላ
ንጉስ መታልና ከናዝሬት ገሊላ
ታምሩን ትናገር ቤተልሄም ታዉራ
ዝማሬ ሲወጣ ከርስቱ ቆጠራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 6
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 7
የማይታይ ታየ ተዳሰሰ አንደ ሰዉ
በጠባቡ ደረት አዳምን መሰለዉ
ገረማት ጥበቡ ታናሹአን ሙሽራ
ተዋህዳልና ቃል ከ ስጋ ጋራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 8
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a91bbfc5-888c-4e6e-a28b-6512f053eed9'::uuid, 'dinigil-fetariwan-weledechiw-628', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ante-bicha-nigus-orthodox-tewahido-mezmur-godolyas ("Ante Bicha Nigus Orthodox Tewahido mezmur godolyas")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'beb08c77-c5ef-4865-b13d-1d8f82840164'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሳ
እስከ ሽበት ስምክን ባነሳ
አልጠግብ እኔ አይሆንም ካሳ
እድሜ ልኬን ባነሳ

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 2
ያስተማርከኝ የውጤት ፊደል
የተከልከው በልቤ ወደብ
እያነቃኝ አመልክክሀለሁ
ካንተ ወድያ ማንን አውቃለሁ( 2)

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 3
ሰውነቴ ከግፍ ቢፀዳ
ህለናየ አተን ቢረዳ
ተፀየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ {2}

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 4
ከእንቅብ በታች መቸ ተነሳሁ
በተራራ እግሬን አፀናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አስቶ ከአፈር{2

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 5
}

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 1
Alt’egb ene ayhonh kasa
Eske shbet simkn banesa
Alt’egb ene ayhonm kasa
Edme liken banesa

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 2
Yastemarkegn yewt’et fidel
Yetekelkew belbe wedeb
Eyaneqagn amelkkhelehu
Kante wedya mann awqalehu (2)

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 3
Sewnete kegf bits’eda
Hilenaye aten bireda
Tets’eyefe yesewn mirkuz
Sitabera belbe meqrez {2}

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 4
Keenqb betach meche tenesahu
Beterara egren ats’enahu
Megezate lefqrh qenber
Sew aregegn asto keafer{2

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 5
}

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሳ
እስከ ሽበት ስምክን ባነሳ
አልጠግብ እኔ አይሆንም ካሳ
እድሜ ልኬን ባነሳ

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 2
ያስተማርከኝ የውጤት ፊደል
የተከልከው በልቤ ወደብ
እያነቃኝ አመልክክሀለሁ
ካንተ ወድያ ማንን አውቃለሁ( 2)

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 3
ሰውነቴ ከግፍ ቢፀዳ
ህለናየ አተን ቢረዳ
ተፀየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ {2}

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 4
ከእንቅብ በታች መቸ ተነሳሁ
በተራራ እግሬን አፀናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አስቶ ከአፈር{2

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 5
}

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ',
        lyrics_transliteration = 'CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 1
Alt’egb ene ayhonh kasa
Eske shbet simkn banesa
Alt’egb ene ayhonm kasa
Edme liken banesa

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 2
Yastemarkegn yewt’et fidel
Yetekelkew belbe wedeb
Eyaneqagn amelkkhelehu
Kante wedya mann awqalehu (2)

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 3
Sewnete kegf bits’eda
Hilenaye aten bireda
Tets’eyefe yesewn mirkuz
Sitabera belbe meqrez {2}

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 4
Keenqb betach meche tenesahu
Beterara egren ats’enahu
Megezate lefqrh qenber
Sew aregegn asto keafer{2

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 5
}

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'beb08c77-c5ef-4865-b13d-1d8f82840164'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሳ
እስከ ሽበት ስምክን ባነሳ
አልጠግብ እኔ አይሆንም ካሳ
እድሜ ልኬን ባነሳ

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 2
ያስተማርከኝ የውጤት ፊደል
የተከልከው በልቤ ወደብ
እያነቃኝ አመልክክሀለሁ
ካንተ ወድያ ማንን አውቃለሁ( 2)

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 3
ሰውነቴ ከግፍ ቢፀዳ
ህለናየ አተን ቢረዳ
ተፀየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ {2}

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 4
ከእንቅብ በታች መቸ ተነሳሁ
በተራራ እግሬን አፀናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አስቶ ከአፈር{2

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 5
}

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'beb08c77-c5ef-4865-b13d-1d8f82840164'::uuid, 'ante-bicha-nigus-orthodox-tewahido-mezmur-godolyas', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ete-mushraye ("Ete Mushraye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bfd372a4-cc84-43e5-9c6d-74503ffcc87f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 1
ማርያም ግቢ በቤቴ
ኹሉም ሰው ለራሱ ወንበር ሲዘረጋ
ለክብር ሽልማት ራሱን ሲያስጠጋ
ድንግል እንደ ባርያ ውሃ ተሸክመሽ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 2
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሐርና በእንቁ ከተንቆጠቆጡት

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 3
በሰው ፊት ያማሩ ብዙ ኾነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
አሳድጎ ሳለ መልአኩ መግቦ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 4
ተሸልመሽ ሳለ በዝቶልሽ ተውቦ
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መልአክ ጌታን ተሸከምሽው
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 5
የባርያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉሥ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ንጽሕት እንላለን እኛ ለዘለዓለም

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 6
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 1
Maryam gbi bebeté
Hulum sew lerasu wenber sizerrega
Lekibir shilmat rasun siyastega
Dingil ende barya wuha teshekemesh

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 2
Getan betihitina tagelgelalesh
Ney bedemena /4/ Embetachin rihrihte hilina
Worqe zebo lebsew bebetu kemolut

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 3
Beharna beenku ketenqotqotut
Besew fit yamaru bizu honew sale
Geta gin weddedesh enate nesh ale
Ney bedemena /4/ Embetachin rihrihte hilina

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 4
Asadgo sale melaku megbo
Teshelmesh sale bezto-lish tewbo
Ijig betihitina sile-agelgelishw

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 5
Ende kirub melak Getan teshekemishw
Ney bedemena /4/ Embetachin rihrihte hilina
Yebaryawun wurdet temelktoalna
Lewoledishw negus yidresw misgana

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 6
Kelib yeweta enji kentun aydelem
Nitsihit enlalalen enya lezalalem
Ney bedemena /4/ Embetachin rihrihte hilina

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 1
ማርያም ግቢ በቤቴ
ኹሉም ሰው ለራሱ ወንበር ሲዘረጋ
ለክብር ሽልማት ራሱን ሲያስጠጋ
ድንግል እንደ ባርያ ውሃ ተሸክመሽ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 2
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሐርና በእንቁ ከተንቆጠቆጡት

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 3
በሰው ፊት ያማሩ ብዙ ኾነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
አሳድጎ ሳለ መልአኩ መግቦ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 4
ተሸልመሽ ሳለ በዝቶልሽ ተውቦ
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መልአክ ጌታን ተሸከምሽው
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 5
የባርያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉሥ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ንጽሕት እንላለን እኛ ለዘለዓለም

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 6
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ',
        lyrics_transliteration = 'CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 1
Maryam gbi bebeté
Hulum sew lerasu wenber sizerrega
Lekibir shilmat rasun siyastega
Dingil ende barya wuha teshekemesh

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 2
Getan betihitina tagelgelalesh
Ney bedemena /4/ Embetachin rihrihte hilina
Worqe zebo lebsew bebetu kemolut

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 3
Beharna beenku ketenqotqotut
Besew fit yamaru bizu honew sale
Geta gin weddedesh enate nesh ale
Ney bedemena /4/ Embetachin rihrihte hilina

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 4
Asadgo sale melaku megbo
Teshelmesh sale bezto-lish tewbo
Ijig betihitina sile-agelgelishw

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 5
Ende kirub melak Getan teshekemishw
Ney bedemena /4/ Embetachin rihrihte hilina
Yebaryawun wurdet temelktoalna
Lewoledishw negus yidresw misgana

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 6
Kelib yeweta enji kentun aydelem
Nitsihit enlalalen enya lezalalem
Ney bedemena /4/ Embetachin rihrihte hilina

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bfd372a4-cc84-43e5-9c6d-74503ffcc87f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 1
ማርያም ግቢ በቤቴ
ኹሉም ሰው ለራሱ ወንበር ሲዘረጋ
ለክብር ሽልማት ራሱን ሲያስጠጋ
ድንግል እንደ ባርያ ውሃ ተሸክመሽ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 2
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሐርና በእንቁ ከተንቆጠቆጡት

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 3
በሰው ፊት ያማሩ ብዙ ኾነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
አሳድጎ ሳለ መልአኩ መግቦ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 4
ተሸልመሽ ሳለ በዝቶልሽ ተውቦ
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መልአክ ጌታን ተሸከምሽው
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 5
የባርያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉሥ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ንጽሕት እንላለን እኛ ለዘለዓለም

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 6
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 1
Maryam gbi bebeté
Hulum sew lerasu wenber sizerrega
Lekibir shilmat rasun siyastega
Dingil ende barya wuha teshekemesh

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 2
Getan betihitina tagelgelalesh
Ney bedemena /4/ Embetachin rihrihte hilina
Worqe zebo lebsew bebetu kemolut

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 3
Beharna beenku ketenqotqotut
Besew fit yamaru bizu honew sale
Geta gin weddedesh enate nesh ale
Ney bedemena /4/ Embetachin rihrihte hilina

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 4
Asadgo sale melaku megbo
Teshelmesh sale bezto-lish tewbo
Ijig betihitina sile-agelgelishw

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 5
Ende kirub melak Getan teshekemishw
Ney bedemena /4/ Embetachin rihrihte hilina
Yebaryawun wurdet temelktoalna
Lewoledishw negus yidresw misgana

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 6
Kelib yeweta enji kentun aydelem
Nitsihit enlalalen enya lezalalem
Ney bedemena /4/ Embetachin rihrihte hilina

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bfd372a4-cc84-43e5-9c6d-74503ffcc87f'::uuid, 'ete-mushraye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- simishin-teriche-2qdc-airmrk ("Simishin Teriche")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '084fdb9b-60a9-4c03-9314-71641c414261'::uuid
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
    WHERE import_id = '084fdb9b-60a9-4c03-9314-71641c414261'::uuid
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
        '084fdb9b-60a9-4c03-9314-71641c414261'::uuid, 'simishin-teriche-2qdc-airmrk', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yegebaw-yamesegen ("Yegebaw Yamesegen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '709fc4fe-84f6-44d1-aaa5-5d8d8349ed7c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 1
ቢያሸት ከሰማይ ሆኖ አለሙን
ሚችል መሸከም መሆን ዙፋኑ
ንጉስ ውበትሽ ስለ ወደደ
አንድያ ልጁን ወደ አንቺ ሰደደ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 2
የይስሐቅ መዓዛ የያይዕቆብ መሰላል
በሀሳብ በስጋ ፍፅምት እና ድንግል
የሳሙኤል ሽቶ መዓዛሽ ያማረ
በማህፀንሽ ፍሬ የአዳም ዘር ተማረ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 3
የኤፍሬም ድርሰቱ የያሬድ ውብ ዜማ
የአባ ህርያቆስ የቅዳሴው ግርማ
የመናኙ ፀሎት ለአይነ ስውር መሪ
ድንግል ትኖርናለሽ ፍጥረት ስታስምሪ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 4
አለም ምን ጋረደው ክብርሽን ለማየት
መሆንሽን ለአለም የመዳን ምክንያት
አንችን ጥሎ ሄዶ መዳን ስለሌለ
የገባው ያመስግን የልጅሽ ነኝ ያለ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 1
Biyashet kesemay hono alemun
Michl meshekem mehon zufanu
Nigus wibetsh sile wedede
Andya lijun wede anchi sedede

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 2
Yeysheq meaza yeyayeqob meselal
Behesab besga fits’mt ena Dingil
Yesamuel shto meazash yamare
Bemahts’ensh fire yeadam zer temare

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 3
Yeefrem dirsetu yeyared wib zema
Yeaba hiryaqos yeqdasew girma
Yemenagnu ts’elot leayne siwr meri
Dingil tinornalesh fit’ret sitasmri

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 4
Alem min garedew kibrshn lemayet
Mehonshn lealem yemedan miknyat
Anchn t’lo hedo medan silelele
Yegebaw yamesgn yeljsh negn yale

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 1
ቢያሸት ከሰማይ ሆኖ አለሙን
ሚችል መሸከም መሆን ዙፋኑ
ንጉስ ውበትሽ ስለ ወደደ
አንድያ ልጁን ወደ አንቺ ሰደደ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 2
የይስሐቅ መዓዛ የያይዕቆብ መሰላል
በሀሳብ በስጋ ፍፅምት እና ድንግል
የሳሙኤል ሽቶ መዓዛሽ ያማረ
በማህፀንሽ ፍሬ የአዳም ዘር ተማረ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 3
የኤፍሬም ድርሰቱ የያሬድ ውብ ዜማ
የአባ ህርያቆስ የቅዳሴው ግርማ
የመናኙ ፀሎት ለአይነ ስውር መሪ
ድንግል ትኖርናለሽ ፍጥረት ስታስምሪ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 4
አለም ምን ጋረደው ክብርሽን ለማየት
መሆንሽን ለአለም የመዳን ምክንያት
አንችን ጥሎ ሄዶ መዳን ስለሌለ
የገባው ያመስግን የልጅሽ ነኝ ያለ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ',
        lyrics_transliteration = 'CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 1
Biyashet kesemay hono alemun
Michl meshekem mehon zufanu
Nigus wibetsh sile wedede
Andya lijun wede anchi sedede

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 2
Yeysheq meaza yeyayeqob meselal
Behesab besga fits’mt ena Dingil
Yesamuel shto meazash yamare
Bemahts’ensh fire yeadam zer temare

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 3
Yeefrem dirsetu yeyared wib zema
Yeaba hiryaqos yeqdasew girma
Yemenagnu ts’elot leayne siwr meri
Dingil tinornalesh fit’ret sitasmri

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 4
Alem min garedew kibrshn lemayet
Mehonshn lealem yemedan miknyat
Anchn t’lo hedo medan silelele
Yegebaw yamesgn yeljsh negn yale

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '709fc4fe-84f6-44d1-aaa5-5d8d8349ed7c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 1
ቢያሸት ከሰማይ ሆኖ አለሙን
ሚችል መሸከም መሆን ዙፋኑ
ንጉስ ውበትሽ ስለ ወደደ
አንድያ ልጁን ወደ አንቺ ሰደደ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 2
የይስሐቅ መዓዛ የያይዕቆብ መሰላል
በሀሳብ በስጋ ፍፅምት እና ድንግል
የሳሙኤል ሽቶ መዓዛሽ ያማረ
በማህፀንሽ ፍሬ የአዳም ዘር ተማረ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 3
የኤፍሬም ድርሰቱ የያሬድ ውብ ዜማ
የአባ ህርያቆስ የቅዳሴው ግርማ
የመናኙ ፀሎት ለአይነ ስውር መሪ
ድንግል ትኖርናለሽ ፍጥረት ስታስምሪ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 4
አለም ምን ጋረደው ክብርሽን ለማየት
መሆንሽን ለአለም የመዳን ምክንያት
አንችን ጥሎ ሄዶ መዳን ስለሌለ
የገባው ያመስግን የልጅሽ ነኝ ያለ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '709fc4fe-84f6-44d1-aaa5-5d8d8349ed7c'::uuid, 'yegebaw-yamesegen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyam-yelibe-nesh ("Mariyam Yelibe Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c664337c-456e-44d8-a8a5-38f1b386f26f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 1
የማዋያት ውስጤን ጓዳ ጎርጓዳዬን
ድንግል አደራሽን አሳስቢ ጉዳዬን
እንዳዘንኩኝ ታስሬ እንዳልቀር ደግፊኝ
ቅስሜ ተሰብሮ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 2
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 3
ለንግግሬ ማር ጣፋጭ ለአንደበቴ
የሀሳቤ ማሰሪያ በሰው ፊት ኩራቴ
ደምግባቴ ባይጸድቅ በሰው እጅ ብልጫ
ልጅሽ ነው ሞገሴ ያኖረኝ በብቻ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 4
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 5
ሰሌዳ ሆነሽ ቃልን ያስተማርሽኝ
ደግሞ መሶበ ወርቅ ህብስቴን የሰጠሽኝ
በምን መሰለሽ ምሳሌው ደከመ
መስቀሉ ስር አለው አንቺን ተሸለመ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 6
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 1
Yemawayat wist’en gwada gorgwadayen
Dingil aderashn asasbi gudayen
Endazenkugn tasre endalqer degfign
Qisme tesebro

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 2
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 3
Lenggre mar t’afach’ leandebete
Yehesabe maseriya besew fit kurate
Demgbate bayts’edq besew ej bilch’a
Lijsh new mogese yanoregn bebcha

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 4
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 5
Seleda honesh qaln yastemarshgn
Degmo mesobe werq hibsten yeset’eshgn
Bemn meselesh misalew dekeme
Mesqelu sir alew anchin tesheleme

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 6
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 1
የማዋያት ውስጤን ጓዳ ጎርጓዳዬን
ድንግል አደራሽን አሳስቢ ጉዳዬን
እንዳዘንኩኝ ታስሬ እንዳልቀር ደግፊኝ
ቅስሜ ተሰብሮ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 2
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 3
ለንግግሬ ማር ጣፋጭ ለአንደበቴ
የሀሳቤ ማሰሪያ በሰው ፊት ኩራቴ
ደምግባቴ ባይጸድቅ በሰው እጅ ብልጫ
ልጅሽ ነው ሞገሴ ያኖረኝ በብቻ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 4
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 5
ሰሌዳ ሆነሽ ቃልን ያስተማርሽኝ
ደግሞ መሶበ ወርቅ ህብስቴን የሰጠሽኝ
በምን መሰለሽ ምሳሌው ደከመ
መስቀሉ ስር አለው አንቺን ተሸለመ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 6
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ',
        lyrics_transliteration = 'CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 1
Yemawayat wist’en gwada gorgwadayen
Dingil aderashn asasbi gudayen
Endazenkugn tasre endalqer degfign
Qisme tesebro

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 2
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 3
Lenggre mar t’afach’ leandebete
Yehesabe maseriya besew fit kurate
Demgbate bayts’edq besew ej bilch’a
Lijsh new mogese yanoregn bebcha

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 4
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 5
Seleda honesh qaln yastemarshgn
Degmo mesobe werq hibsten yeset’eshgn
Bemn meselesh misalew dekeme
Mesqelu sir alew anchin tesheleme

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 6
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c664337c-456e-44d8-a8a5-38f1b386f26f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 1
የማዋያት ውስጤን ጓዳ ጎርጓዳዬን
ድንግል አደራሽን አሳስቢ ጉዳዬን
እንዳዘንኩኝ ታስሬ እንዳልቀር ደግፊኝ
ቅስሜ ተሰብሮ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 2
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 3
ለንግግሬ ማር ጣፋጭ ለአንደበቴ
የሀሳቤ ማሰሪያ በሰው ፊት ኩራቴ
ደምግባቴ ባይጸድቅ በሰው እጅ ብልጫ
ልጅሽ ነው ሞገሴ ያኖረኝ በብቻ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 4
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 5
ሰሌዳ ሆነሽ ቃልን ያስተማርሽኝ
ደግሞ መሶበ ወርቅ ህብስቴን የሰጠሽኝ
በምን መሰለሽ ምሳሌው ደከመ
መስቀሉ ስር አለው አንቺን ተሸለመ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 6
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c664337c-456e-44d8-a8a5-38f1b386f26f'::uuid, 'mariyam-yelibe-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zm-mirtnesh ("Zm. Mirtnesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '68abd49e-885a-4b55-bfa3-74812c635a65'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 1
ስንቱን ኣለፍኩት ስንቱን መከራ
ለካ ሲያልፍ ቀን ሁሉም ይረሳል
ርሐብ ስደቱን ማን ያስታውሳል
ኣዝ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 2
ጽዋዬን ባርከህ ተትረፈረፈ
የጠላቴም ጦር በላዬ ኣለፈ
በሺ ቃላቶች ኣፌን ሞልቼ
ልዘምርልህ ጉያህ ገብቼ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 3
ኣዝ
ገዳዬ ቢሮጥ በቀን በማታ
እያለ ኣንድዬ እያለ ጌታ
ለሞት ኣልተኛም ቢደነቅ ኣለም

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 4
ተክሎኛልና ለዘለ ኣለም
ኣዝ
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 5
ኣላቀረቅር ኣልደፋ ኣንገቴን
እሞላዋለው በእልልታ ቤቴን
ኣዝ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 1
Sintun alefkut sintun mekera
Leka siyalf qen hulum yiresal
Riheb sidetun man yastawsal
Az

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 2
Ts’wayen barkeh tetreferefe
Yet’elatem t’or belaye alefe
Beshi qalatoch afen molche
Lizemrlh guyah gebche

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 3
Az
Gedaye birot’ beqen bemata
Eyale andye eyale Geta
Lemot altegnam bideneq alem

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 4
Teklognalna lezele alem
Az
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 5
Alaqereqr aldefa angeten
Emolawalew beellta beten
Az

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 1
ስንቱን ኣለፍኩት ስንቱን መከራ
ለካ ሲያልፍ ቀን ሁሉም ይረሳል
ርሐብ ስደቱን ማን ያስታውሳል
ኣዝ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 2
ጽዋዬን ባርከህ ተትረፈረፈ
የጠላቴም ጦር በላዬ ኣለፈ
በሺ ቃላቶች ኣፌን ሞልቼ
ልዘምርልህ ጉያህ ገብቼ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 3
ኣዝ
ገዳዬ ቢሮጥ በቀን በማታ
እያለ ኣንድዬ እያለ ጌታ
ለሞት ኣልተኛም ቢደነቅ ኣለም

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 4
ተክሎኛልና ለዘለ ኣለም
ኣዝ
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 5
ኣላቀረቅር ኣልደፋ ኣንገቴን
እሞላዋለው በእልልታ ቤቴን
ኣዝ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ',
        lyrics_transliteration = 'CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 1
Sintun alefkut sintun mekera
Leka siyalf qen hulum yiresal
Riheb sidetun man yastawsal
Az

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 2
Ts’wayen barkeh tetreferefe
Yet’elatem t’or belaye alefe
Beshi qalatoch afen molche
Lizemrlh guyah gebche

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 3
Az
Gedaye birot’ beqen bemata
Eyale andye eyale Geta
Lemot altegnam bideneq alem

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 4
Teklognalna lezele alem
Az
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 5
Alaqereqr aldefa angeten
Emolawalew beellta beten
Az

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah',
        updated_at = clock_timestamp()::text
    WHERE import_id = '68abd49e-885a-4b55-bfa3-74812c635a65'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 1
ስንቱን ኣለፍኩት ስንቱን መከራ
ለካ ሲያልፍ ቀን ሁሉም ይረሳል
ርሐብ ስደቱን ማን ያስታውሳል
ኣዝ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 2
ጽዋዬን ባርከህ ተትረፈረፈ
የጠላቴም ጦር በላዬ ኣለፈ
በሺ ቃላቶች ኣፌን ሞልቼ
ልዘምርልህ ጉያህ ገብቼ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 3
ኣዝ
ገዳዬ ቢሮጥ በቀን በማታ
እያለ ኣንድዬ እያለ ጌታ
ለሞት ኣልተኛም ቢደነቅ ኣለም

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 4
ተክሎኛልና ለዘለ ኣለም
ኣዝ
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 5
ኣላቀረቅር ኣልደፋ ኣንገቴን
እሞላዋለው በእልልታ ቤቴን
ኣዝ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '68abd49e-885a-4b55-bfa3-74812c635a65'::uuid, 'zm-mirtnesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidan-mihiret-emebet ("Kidan Mihiret Emebet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fe9fd389-0abe-4b1f-9d20-2ee0d2dfb40e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 1
ከሰማያት በላይ ካለው ከማደሪያሽ (2)
ዝማሬ ክሞላው ከዘላለም ቤትሽ
የምድር ፍጥረታት ማርያም ማርያም ሲሉሽ (2)
የቃል እናት እመቤቴ ነይ በሰረገላሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 2
ከፀጥታ ወደብ ከፍቅር አውድማ (2)
ከሰላሙ መንደር ከእውነት ከተማ
ሰአሊለነ ቅድስት ውዳሴ ሲሰማ (2)
ከሚካኤል ክገብርኤል ጋር ነይልን ከራማ (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት(2)
እንባችን ይታበስ ባንቺ አማላጅነት
በጽዮን ዝማሬ ተሞላ ነፍሳችን (2)
ንዒ (3) እንበል እንደ አባቶቻችን (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 4
ፍጥረታት ሊድኑ በአማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብጽዕት ይሉሻል(2)
እናቴ መመኪያዬ ምርኩዜ ሆነሻል (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 5
የልብን ሲያዋዩሽ ሰምተሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨከንም
ከዓይን ጥቅሻ ፈጥነሽ ትደርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 1
Kesemayat belay kalew kemaderiyash (2)
Zimare kimolaw kezelalem betsh
Yemdr fit’retat Maryam Maryam silush (2)
Yeqal enat Emebete ney beseregelash (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 2
Kets’et’ta wedeb kefqr awdma (2)
Keselamu mender keewnet ketema
Sealilene Kidist widase sisema (2)
Kemikael kigebrel gar neyln kerama (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 3
Zerfafaw qemissh yiwred kesemayat (2)
Enbachn yitabes banchi amalajnet
Bets’yon zimare temola nefsachn (2)
Nii (3) enbel ende abatochachn (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 4
Fit’retat lidnu beamalajnetsh (2)
Yezelalem kidan Amanuel set’esh
Tiwld yihn amno bits’et yilushal (2)
Enate memekiyaye mirkuze honeshal (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 5
Yelbn siyawayush semtesh zim atym (2)
Chgregnan ayto libsh aych’ekenm
Keayn t’qsha fet’nesh tidershletalesh (2)
Kehezen kemekera tasarfiwalesh (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 1
ከሰማያት በላይ ካለው ከማደሪያሽ (2)
ዝማሬ ክሞላው ከዘላለም ቤትሽ
የምድር ፍጥረታት ማርያም ማርያም ሲሉሽ (2)
የቃል እናት እመቤቴ ነይ በሰረገላሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 2
ከፀጥታ ወደብ ከፍቅር አውድማ (2)
ከሰላሙ መንደር ከእውነት ከተማ
ሰአሊለነ ቅድስት ውዳሴ ሲሰማ (2)
ከሚካኤል ክገብርኤል ጋር ነይልን ከራማ (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት(2)
እንባችን ይታበስ ባንቺ አማላጅነት
በጽዮን ዝማሬ ተሞላ ነፍሳችን (2)
ንዒ (3) እንበል እንደ አባቶቻችን (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 4
ፍጥረታት ሊድኑ በአማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብጽዕት ይሉሻል(2)
እናቴ መመኪያዬ ምርኩዜ ሆነሻል (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 5
የልብን ሲያዋዩሽ ሰምተሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨከንም
ከዓይን ጥቅሻ ፈጥነሽ ትደርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)',
        lyrics_transliteration = 'CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 1
Kesemayat belay kalew kemaderiyash (2)
Zimare kimolaw kezelalem betsh
Yemdr fit’retat Maryam Maryam silush (2)
Yeqal enat Emebete ney beseregelash (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 2
Kets’et’ta wedeb kefqr awdma (2)
Keselamu mender keewnet ketema
Sealilene Kidist widase sisema (2)
Kemikael kigebrel gar neyln kerama (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 3
Zerfafaw qemissh yiwred kesemayat (2)
Enbachn yitabes banchi amalajnet
Bets’yon zimare temola nefsachn (2)
Nii (3) enbel ende abatochachn (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 4
Fit’retat lidnu beamalajnetsh (2)
Yezelalem kidan Amanuel set’esh
Tiwld yihn amno bits’et yilushal (2)
Enate memekiyaye mirkuze honeshal (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 5
Yelbn siyawayush semtesh zim atym (2)
Chgregnan ayto libsh aych’ekenm
Keayn t’qsha fet’nesh tidershletalesh (2)
Kehezen kemekera tasarfiwalesh (2)

CHORUS
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fe9fd389-0abe-4b1f-9d20-2ee0d2dfb40e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 1
ከሰማያት በላይ ካለው ከማደሪያሽ (2)
ዝማሬ ክሞላው ከዘላለም ቤትሽ
የምድር ፍጥረታት ማርያም ማርያም ሲሉሽ (2)
የቃል እናት እመቤቴ ነይ በሰረገላሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 2
ከፀጥታ ወደብ ከፍቅር አውድማ (2)
ከሰላሙ መንደር ከእውነት ከተማ
ሰአሊለነ ቅድስት ውዳሴ ሲሰማ (2)
ከሚካኤል ክገብርኤል ጋር ነይልን ከራማ (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት(2)
እንባችን ይታበስ ባንቺ አማላጅነት
በጽዮን ዝማሬ ተሞላ ነፍሳችን (2)
ንዒ (3) እንበል እንደ አባቶቻችን (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 4
ፍጥረታት ሊድኑ በአማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብጽዕት ይሉሻል(2)
እናቴ መመኪያዬ ምርኩዜ ሆነሻል (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 5
የልብን ሲያዋዩሽ ሰምተሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨከንም
ከዓይን ጥቅሻ ፈጥነሽ ትደርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fe9fd389-0abe-4b1f-9d20-2ee0d2dfb40e'::uuid, 'kidan-mihiret-emebet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enibayen-abesikilign ("Enibayen Abesikilign")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '55687b9a-0af0-4f90-9a15-5f62a0027741'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 1
አባቴ ክበርልኝ
መዝገቤ በፊትህ ነው
የለኝም ምደብቀው
ብትበይን እንዳየኸኝ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 2
ሙት ነበርኩ ፅድቅ የሌለኝ
ታውቃለህ ማንነቴን
የልቤን የውስጠቴን
ይቅርታህ በዝቶልኝ ነው

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 3
ማዜመው ምዘምረው
ባትቀድም በመንገዴ
ባትገባ ጣልቃ ውዴ
በትናንት ጥዩፍ ስሜ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 4
ነበርኩኝ በድካሜ
እንድኖር በምስጋና
ፈቃድህ በእኔ ሆና
ስራዬ ሟች ሲያስብለኝ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 5
ጸጋህ ግን እድሜን ሰጠኝ
ሺህ ጊዜ ደጋግሜ
በድዬህ አስቀይሜህ
በእጥፍ እየማርከኝ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 6
በፊትህ ያቀረብከኝ
ፍቅር ነህ እውነተኛ
የነፍሴ ጻድቅ ዳኛ
እንዳንተ የለም ለእኔ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 7
በእድሜዬ በዘመኔ
ባትከልለኝ ምህረትህ
ባትረዳኝ ቸርነትህ
ቢቆጠር የኔ ነገር

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 8
አያልቅም ቢዘርዝር
ዛሬ ላይ ሰው መሆኔ
መቆሜ አምሮ ቀኔ
ሸፍኖኝ ነው ጸጋህ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 9
ተመስገን የምልህ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 1
Abate kiberlgn
Mezgebe befith new
Yelegnm midebqew
Bitbeyn endayeኸgn

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 2
Mut neberku ts’dq yelelegn
Tawqaleh manneten
Yelben yewst’eten
Yiqrtah beztolgn new

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 3
Mazemew mizemrew
Batqedm bemengede
Batgeba t’alqa wide
Betnant t’yuf sime

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 4
Neberkugn bedkame
Endnor bemsgana
Feqadh beene hona
Siraye mwach siyasblegn

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 5
Ts’egah gin edmen set’egn
Shih gize degagme
Bedyeh asqeymeh
Beet’f eyemarkegn

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 6
Befith yaqerebkegn
Fiqr neh ewnetegna
Yenefse ts’adq dagna
Endante yelem leene

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 7
Beedmeye bezemene
Batkellegn mihreth
Batredagn cherneth
Biqot’er yene neger

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 8
Ayalqm bizerzr
Zare lay sew mehone
Meqome amro qene
Shefnogn new ts’egah

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 9
Temesgen yemlh

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 1
አባቴ ክበርልኝ
መዝገቤ በፊትህ ነው
የለኝም ምደብቀው
ብትበይን እንዳየኸኝ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 2
ሙት ነበርኩ ፅድቅ የሌለኝ
ታውቃለህ ማንነቴን
የልቤን የውስጠቴን
ይቅርታህ በዝቶልኝ ነው

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 3
ማዜመው ምዘምረው
ባትቀድም በመንገዴ
ባትገባ ጣልቃ ውዴ
በትናንት ጥዩፍ ስሜ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 4
ነበርኩኝ በድካሜ
እንድኖር በምስጋና
ፈቃድህ በእኔ ሆና
ስራዬ ሟች ሲያስብለኝ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 5
ጸጋህ ግን እድሜን ሰጠኝ
ሺህ ጊዜ ደጋግሜ
በድዬህ አስቀይሜህ
በእጥፍ እየማርከኝ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 6
በፊትህ ያቀረብከኝ
ፍቅር ነህ እውነተኛ
የነፍሴ ጻድቅ ዳኛ
እንዳንተ የለም ለእኔ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 7
በእድሜዬ በዘመኔ
ባትከልለኝ ምህረትህ
ባትረዳኝ ቸርነትህ
ቢቆጠር የኔ ነገር

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 8
አያልቅም ቢዘርዝር
ዛሬ ላይ ሰው መሆኔ
መቆሜ አምሮ ቀኔ
ሸፍኖኝ ነው ጸጋህ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 9
ተመስገን የምልህ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ',
        lyrics_transliteration = 'CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 1
Abate kiberlgn
Mezgebe befith new
Yelegnm midebqew
Bitbeyn endayeኸgn

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 2
Mut neberku ts’dq yelelegn
Tawqaleh manneten
Yelben yewst’eten
Yiqrtah beztolgn new

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 3
Mazemew mizemrew
Batqedm bemengede
Batgeba t’alqa wide
Betnant t’yuf sime

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 4
Neberkugn bedkame
Endnor bemsgana
Feqadh beene hona
Siraye mwach siyasblegn

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 5
Ts’egah gin edmen set’egn
Shih gize degagme
Bedyeh asqeymeh
Beet’f eyemarkegn

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 6
Befith yaqerebkegn
Fiqr neh ewnetegna
Yenefse ts’adq dagna
Endante yelem leene

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 7
Beedmeye bezemene
Batkellegn mihreth
Batredagn cherneth
Biqot’er yene neger

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 8
Ayalqm bizerzr
Zare lay sew mehone
Meqome amro qene
Shefnogn new ts’egah

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 9
Temesgen yemlh

CHORUS
Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '55687b9a-0af0-4f90-9a15-5f62a0027741'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 1
አባቴ ክበርልኝ
መዝገቤ በፊትህ ነው
የለኝም ምደብቀው
ብትበይን እንዳየኸኝ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 2
ሙት ነበርኩ ፅድቅ የሌለኝ
ታውቃለህ ማንነቴን
የልቤን የውስጠቴን
ይቅርታህ በዝቶልኝ ነው

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 3
ማዜመው ምዘምረው
ባትቀድም በመንገዴ
ባትገባ ጣልቃ ውዴ
በትናንት ጥዩፍ ስሜ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 4
ነበርኩኝ በድካሜ
እንድኖር በምስጋና
ፈቃድህ በእኔ ሆና
ስራዬ ሟች ሲያስብለኝ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 5
ጸጋህ ግን እድሜን ሰጠኝ
ሺህ ጊዜ ደጋግሜ
በድዬህ አስቀይሜህ
በእጥፍ እየማርከኝ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 6
በፊትህ ያቀረብከኝ
ፍቅር ነህ እውነተኛ
የነፍሴ ጻድቅ ዳኛ
እንዳንተ የለም ለእኔ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 7
በእድሜዬ በዘመኔ
ባትከልለኝ ምህረትህ
ባትረዳኝ ቸርነትህ
ቢቆጠር የኔ ነገር

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 8
አያልቅም ቢዘርዝር
ዛሬ ላይ ሰው መሆኔ
መቆሜ አምሮ ቀኔ
ሸፍኖኝ ነው ጸጋህ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 9
ተመስገን የምልህ

CHORUS
በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '55687b9a-0af0-4f90-9a15-5f62a0027741'::uuid, 'enibayen-abesikilign', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bakkattan-deebisa ("Bakkattan deebisa")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e6ba045e-fcfa-4ee9-8a98-5055cbe72a45'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 1
Akka tasaa miti,yaadasaa keessattiduraan galmaa’eeraa
Adduyaa utuu hin uumin ilma isaa Kiristoosiin anaan filateera
Toorri fayyina koo baaramaa ta’ee an eebba ta’uu dha
Du’a mo’ee ka’ee ofkeessa nakaa’e mirgasaa taa’uu dha

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 2
An amma haaradha hin beeku kaleessaa
Hawwii koo fannisee seeneera isa keessaa
Balbala koo cufee sichi qofaa hin taa’uu
Haaraan siif kataba kan duraa hin lakkaa’uu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 3
Hiddi handhuura koo, sirraa wanna citeef sitti lakkaa’ataa
Dhahannaan onnee koof guutummaan ribuu koo siin balbaloomfataa
Silgi Sagalee kee kan fannoo irraa madde soorri koo ganamaa
Ittiin bulmaata koo dhugeeffanna dhugaa gaarammaa keen himaa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 4
Amma tasgabbaa’e ala hin dhageeffadhu
Balbala koo cufee keessa koon dhagahaa
Fayyeera Afuurri koo Lubbuu koo baraare
Foon koo isaaf qulleesseen Ormaaf ifa ta’aa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 5
Jaalalli kee dhugaa kan dhageettiin olii kan arge agartuun koo
Maddiin dhiitee bahe sadeessoof hin laannee olnaaf keesse hinkoo koo
Aangoof teessoon yeroo, Siboof ayyaana koo naduraa hin ukkaamsuu
Jireenya koo har’aa, galgala koo borii kennaa kee hin xiqqeessuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 6
Galma warra dhugaa Maqaa hin moggaafamnee
Keessaan si’amaneen guutuun sitti of kennee
Wargama Onnee koo kan dheebuu koo kuttee
Ilma kee nagootee baga Abbaa koo taate

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 7
Gaarummaan Isaa Narratti Baay''ate{{2))
Araarri Isaa Narratti Baay''ate((2))
Farsaa ergamoota si haa dhageesisuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 1
Akka tasaa miti,yaadasaa keessattiduraan galmaa’eeraa
Adduyaa utuu hin uumin ilma isaa Kiristoosiin anaan filateera
Toorri fayyina koo baaramaa ta’ee an eebba ta’uu dha
Du’a mo’ee ka’ee ofkeessa nakaa’e mirgasaa taa’uu dha

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 2
An amma haaradha hin beeku kaleessaa
Hawwii koo fannisee seeneera isa keessaa
Balbala koo cufee sichi qofaa hin taa’uu
Haaraan siif kataba kan duraa hin lakkaa’uu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 3
Hiddi handhuura koo, sirraa wanna citeef sitti lakkaa’ataa
Dhahannaan onnee koof guutummaan ribuu koo siin balbaloomfataa
Silgi Sagalee kee kan fannoo irraa madde soorri koo ganamaa
Ittiin bulmaata koo dhugeeffanna dhugaa gaarammaa keen himaa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 4
Amma tasgabbaa’e ala hin dhageeffadhu
Balbala koo cufee keessa koon dhagahaa
Fayyeera Afuurri koo Lubbuu koo baraare
Foon koo isaaf qulleesseen Ormaaf ifa ta’aa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 5
Jaalalli kee dhugaa kan dhageettiin olii kan arge agartuun koo
Maddiin dhiitee bahe sadeessoof hin laannee olnaaf keesse hinkoo koo
Aangoof teessoon yeroo, Siboof ayyaana koo naduraa hin ukkaamsuu
Jireenya koo har’aa, galgala koo borii kennaa kee hin xiqqeessuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 6
Galma warra dhugaa Maqaa hin moggaafamnee
Keessaan si’amaneen guutuun sitti of kennee
Wargama Onnee koo kan dheebuu koo kuttee
Ilma kee nagootee baga Abbaa koo taate

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 7
Gaarummaan Isaa Narratti Baay''ate{{2))
Araarri Isaa Narratti Baay''ate( (2))
Farsaa ergamoota si haa dhageesisuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 1
Akka tasaa miti,yaadasaa keessattiduraan galmaa’eeraa
Adduyaa utuu hin uumin ilma isaa Kiristoosiin anaan filateera
Toorri fayyina koo baaramaa ta’ee an eebba ta’uu dha
Du’a mo’ee ka’ee ofkeessa nakaa’e mirgasaa taa’uu dha

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 2
An amma haaradha hin beeku kaleessaa
Hawwii koo fannisee seeneera isa keessaa
Balbala koo cufee sichi qofaa hin taa’uu
Haaraan siif kataba kan duraa hin lakkaa’uu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 3
Hiddi handhuura koo, sirraa wanna citeef sitti lakkaa’ataa
Dhahannaan onnee koof guutummaan ribuu koo siin balbaloomfataa
Silgi Sagalee kee kan fannoo irraa madde soorri koo ganamaa
Ittiin bulmaata koo dhugeeffanna dhugaa gaarammaa keen himaa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 4
Amma tasgabbaa’e ala hin dhageeffadhu
Balbala koo cufee keessa koon dhagahaa
Fayyeera Afuurri koo Lubbuu koo baraare
Foon koo isaaf qulleesseen Ormaaf ifa ta’aa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 5
Jaalalli kee dhugaa kan dhageettiin olii kan arge agartuun koo
Maddiin dhiitee bahe sadeessoof hin laannee olnaaf keesse hinkoo koo
Aangoof teessoon yeroo, Siboof ayyaana koo naduraa hin ukkaamsuu
Jireenya koo har’aa, galgala koo borii kennaa kee hin xiqqeessuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 6
Galma warra dhugaa Maqaa hin moggaafamnee
Keessaan si’amaneen guutuun sitti of kennee
Wargama Onnee koo kan dheebuu koo kuttee
Ilma kee nagootee baga Abbaa koo taate

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 7
Gaarummaan Isaa Narratti Baay''ate{{2))
Araarri Isaa Narratti Baay''ate((2))
Farsaa ergamoota si haa dhageesisuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))',
        lyrics_transliteration = 'CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 1
Akka tasaa miti,yaadasaa keessattiduraan galmaa’eeraa
Adduyaa utuu hin uumin ilma isaa Kiristoosiin anaan filateera
Toorri fayyina koo baaramaa ta’ee an eebba ta’uu dha
Du’a mo’ee ka’ee ofkeessa nakaa’e mirgasaa taa’uu dha

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 2
An amma haaradha hin beeku kaleessaa
Hawwii koo fannisee seeneera isa keessaa
Balbala koo cufee sichi qofaa hin taa’uu
Haaraan siif kataba kan duraa hin lakkaa’uu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 3
Hiddi handhuura koo, sirraa wanna citeef sitti lakkaa’ataa
Dhahannaan onnee koof guutummaan ribuu koo siin balbaloomfataa
Silgi Sagalee kee kan fannoo irraa madde soorri koo ganamaa
Ittiin bulmaata koo dhugeeffanna dhugaa gaarammaa keen himaa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 4
Amma tasgabbaa’e ala hin dhageeffadhu
Balbala koo cufee keessa koon dhagahaa
Fayyeera Afuurri koo Lubbuu koo baraare
Foon koo isaaf qulleesseen Ormaaf ifa ta’aa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 5
Jaalalli kee dhugaa kan dhageettiin olii kan arge agartuun koo
Maddiin dhiitee bahe sadeessoof hin laannee olnaaf keesse hinkoo koo
Aangoof teessoon yeroo, Siboof ayyaana koo naduraa hin ukkaamsuu
Jireenya koo har’aa, galgala koo borii kennaa kee hin xiqqeessuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 6
Galma warra dhugaa Maqaa hin moggaafamnee
Keessaan si’amaneen guutuun sitti of kennee
Wargama Onnee koo kan dheebuu koo kuttee
Ilma kee nagootee baga Abbaa koo taate

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 7
Gaarummaan Isaa Narratti Baay''ate{{2))
Araarri Isaa Narratti Baay''ate( (2))
Farsaa ergamoota si haa dhageesisuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e6ba045e-fcfa-4ee9-8a98-5055cbe72a45'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 1
Akka tasaa miti,yaadasaa keessattiduraan galmaa’eeraa
Adduyaa utuu hin uumin ilma isaa Kiristoosiin anaan filateera
Toorri fayyina koo baaramaa ta’ee an eebba ta’uu dha
Du’a mo’ee ka’ee ofkeessa nakaa’e mirgasaa taa’uu dha

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 2
An amma haaradha hin beeku kaleessaa
Hawwii koo fannisee seeneera isa keessaa
Balbala koo cufee sichi qofaa hin taa’uu
Haaraan siif kataba kan duraa hin lakkaa’uu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 3
Hiddi handhuura koo, sirraa wanna citeef sitti lakkaa’ataa
Dhahannaan onnee koof guutummaan ribuu koo siin balbaloomfataa
Silgi Sagalee kee kan fannoo irraa madde soorri koo ganamaa
Ittiin bulmaata koo dhugeeffanna dhugaa gaarammaa keen himaa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 4
Amma tasgabbaa’e ala hin dhageeffadhu
Balbala koo cufee keessa koon dhagahaa
Fayyeera Afuurri koo Lubbuu koo baraare
Foon koo isaaf qulleesseen Ormaaf ifa ta’aa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 5
Jaalalli kee dhugaa kan dhageettiin olii kan arge agartuun koo
Maddiin dhiitee bahe sadeessoof hin laannee olnaaf keesse hinkoo koo
Aangoof teessoon yeroo, Siboof ayyaana koo naduraa hin ukkaamsuu
Jireenya koo har’aa, galgala koo borii kennaa kee hin xiqqeessuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 6
Galma warra dhugaa Maqaa hin moggaafamnee
Keessaan si’amaneen guutuun sitti of kennee
Wargama Onnee koo kan dheebuu koo kuttee
Ilma kee nagootee baga Abbaa koo taate

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 7
Gaarummaan Isaa Narratti Baay''ate{{2))
Araarri Isaa Narratti Baay''ate((2))
Farsaa ergamoota si haa dhageesisuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e6ba045e-fcfa-4ee9-8a98-5055cbe72a45'::uuid, 'bakkattan-deebisa', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ane-kzmrye ("Ane Kzmr’ye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '711b78e6-b6ab-45cb-9709-f4c73fa83cdb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 1
ንብዓተይ ካብ ዓይነይ ደሪዛትለይ’ያ
ኣነስ ክዝምር’የ ንድንግል ማርያም
ክፍኣት ናይ ህይወተይ ንኽየስዕብ ስቓይ
ባሪኻቶ ቤተይ ኣደ ናይ ብዙሓን

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 2
ኣብ ድነ ናይ ጸልማት ተሪፈ ንበይነይ
ብናይ ፍቕሪ ኣእዳዋ ትዳህስሶ ዓይነይ
ሓዘነይ ንብዓተይ ክነግር ንኣደይ
ሎሚ ብበረኸት መሊኣቶ ቤትይ

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 3
ዝዓነወ ህይወተይ እቲ ዝፈረሰ
ብልመና ድንግል ኵሉ ተሓደሰ
ንብዓተይ ጸሎተይ ኣውያተይ ሰሚዓ
ድንግል ኣደ ጎይታ ንረዲኤት መጺኣ

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 4
ሸኸም ከቢዱኒ ክሓዝን ክቑዝም
ድንግል ምጺኣትኒ ደኺመ ከይተርፍ
ስለ ዘውጽኣትኒ ካብ መዓሙቅ ጉድጓድ
የእዳወይ ዘርጊሐ ንኽብራ ክዝምር

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 1
Nibatey kab ayney derizatley’ya
Anes kizmr’ye nidngl Maryam
Kifat nay hiywetey niኽyeseb siቓy
Bariኻto betey ade nay bizuhan

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 2
Ab dine nay ts’elmat terife nibeyney
Binay fiቕri aedawa tidahsso ayney
Hazeney nibatey kinegr niadey
Lomi bibereኸt meliato bety

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 3
Zianewe hiywetey eti ziferese
Bilmena Dingil kwlu tehadese
Nibatey ts’elotey awyatey semia
Dingil ade goyta nirediet mets’ia

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 4
Sheኸm kebiduni kihazn kiቑzm
Dingil mits’iatni deኺme keyterf
Sile zewts’atni kab meamuq gudgwad
Yeedawey zergihe niኽbra kizmr

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 1
ንብዓተይ ካብ ዓይነይ ደሪዛትለይ’ያ
ኣነስ ክዝምር’የ ንድንግል ማርያም
ክፍኣት ናይ ህይወተይ ንኽየስዕብ ስቓይ
ባሪኻቶ ቤተይ ኣደ ናይ ብዙሓን

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 2
ኣብ ድነ ናይ ጸልማት ተሪፈ ንበይነይ
ብናይ ፍቕሪ ኣእዳዋ ትዳህስሶ ዓይነይ
ሓዘነይ ንብዓተይ ክነግር ንኣደይ
ሎሚ ብበረኸት መሊኣቶ ቤትይ

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 3
ዝዓነወ ህይወተይ እቲ ዝፈረሰ
ብልመና ድንግል ኵሉ ተሓደሰ
ንብዓተይ ጸሎተይ ኣውያተይ ሰሚዓ
ድንግል ኣደ ጎይታ ንረዲኤት መጺኣ

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 4
ሸኸም ከቢዱኒ ክሓዝን ክቑዝም
ድንግል ምጺኣትኒ ደኺመ ከይተርፍ
ስለ ዘውጽኣትኒ ካብ መዓሙቅ ጉድጓድ
የእዳወይ ዘርጊሐ ንኽብራ ክዝምር

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ',
        lyrics_transliteration = 'CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 1
Nibatey kab ayney derizatley’ya
Anes kizmr’ye nidngl Maryam
Kifat nay hiywetey niኽyeseb siቓy
Bariኻto betey ade nay bizuhan

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 2
Ab dine nay ts’elmat terife nibeyney
Binay fiቕri aedawa tidahsso ayney
Hazeney nibatey kinegr niadey
Lomi bibereኸt meliato bety

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 3
Zianewe hiywetey eti ziferese
Bilmena Dingil kwlu tehadese
Nibatey ts’elotey awyatey semia
Dingil ade goyta nirediet mets’ia

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 4
Sheኸm kebiduni kihazn kiቑzm
Dingil mits’iatni deኺme keyterf
Sile zewts’atni kab meamuq gudgwad
Yeedawey zergihe niኽbra kizmr

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey',
        updated_at = clock_timestamp()::text
    WHERE import_id = '711b78e6-b6ab-45cb-9709-f4c73fa83cdb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 1
ንብዓተይ ካብ ዓይነይ ደሪዛትለይ’ያ
ኣነስ ክዝምር’የ ንድንግል ማርያም
ክፍኣት ናይ ህይወተይ ንኽየስዕብ ስቓይ
ባሪኻቶ ቤተይ ኣደ ናይ ብዙሓን

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 2
ኣብ ድነ ናይ ጸልማት ተሪፈ ንበይነይ
ብናይ ፍቕሪ ኣእዳዋ ትዳህስሶ ዓይነይ
ሓዘነይ ንብዓተይ ክነግር ንኣደይ
ሎሚ ብበረኸት መሊኣቶ ቤትይ

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 3
ዝዓነወ ህይወተይ እቲ ዝፈረሰ
ብልመና ድንግል ኵሉ ተሓደሰ
ንብዓተይ ጸሎተይ ኣውያተይ ሰሚዓ
ድንግል ኣደ ጎይታ ንረዲኤት መጺኣ

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 4
ሸኸም ከቢዱኒ ክሓዝን ክቑዝም
ድንግል ምጺኣትኒ ደኺመ ከይተርፍ
ስለ ዘውጽኣትኒ ካብ መዓሙቅ ጉድጓድ
የእዳወይ ዘርጊሐ ንኽብራ ክዝምር

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '711b78e6-b6ab-45cb-9709-f4c73fa83cdb'::uuid, 'ane-kzmrye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dink-adirgolignyal ("Dink Adirgolignyal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bfd63e69-ee42-49a5-84e3-396600a3f84f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 1
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 2
ድንቅ አድርጎልኛል በዳግም ምጻቱ
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 3
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 4
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 5
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 6
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 7
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል
ድንቅ አድርጎልኛል እያሉ ሲሉኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 8
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 9
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 1
Dink adirgolignyal bedelen sayqot’ir
Dink adirgolignyal wedebetu t’erat’agn
Dink adirgolignyal rek’she salehu

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 2
Dink adirgolignyal lijé hoy na alegn
Dink adirgolignyal bedagim mits’atu
Dink adirgolignyal mengistun liyawirsagn

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 3
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 4
Dink adirgolignyal keanbesa mengagga
Dink adirgolignyal kegudgwad awet’agn
Dink adirgolignyal bet’elateche fit

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 5
Dink adirgolignyal girma moges set’egn
Dink adirgolignyal min emelsalew
Dink adirgolignyal indi lewededegn

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 6
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 7
Dink adirgolignyal t’elateche hulu
Dink adirgolignyal siguadedubegn
Dink adirgolignyal man yidersletal

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 8
Dink adirgolignyal eyalu silugn
Dink adirgolignyal fet’neh deresklign
Dink adirgolignyal kemot adanekegn

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 9
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 1
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 2
ድንቅ አድርጎልኛል በዳግም ምጻቱ
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 3
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 4
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 5
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 6
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 7
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል
ድንቅ አድርጎልኛል እያሉ ሲሉኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 8
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 9
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)',
        lyrics_transliteration = 'CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 1
Dink adirgolignyal bedelen sayqot’ir
Dink adirgolignyal wedebetu t’erat’agn
Dink adirgolignyal rek’she salehu

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 2
Dink adirgolignyal lijé hoy na alegn
Dink adirgolignyal bedagim mits’atu
Dink adirgolignyal mengistun liyawirsagn

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 3
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 4
Dink adirgolignyal keanbesa mengagga
Dink adirgolignyal kegudgwad awet’agn
Dink adirgolignyal bet’elateche fit

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 5
Dink adirgolignyal girma moges set’egn
Dink adirgolignyal min emelsalew
Dink adirgolignyal indi lewededegn

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 6
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 7
Dink adirgolignyal t’elateche hulu
Dink adirgolignyal siguadedubegn
Dink adirgolignyal man yidersletal

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 8
Dink adirgolignyal eyalu silugn
Dink adirgolignyal fet’neh deresklign
Dink adirgolignyal kemot adanekegn

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 9
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bfd63e69-ee42-49a5-84e3-396600a3f84f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 1
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 2
ድንቅ አድርጎልኛል በዳግም ምጻቱ
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 3
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 4
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 5
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 6
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 7
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል
ድንቅ አድርጎልኛል እያሉ ሲሉኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 8
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 9
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

CHORUS
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 1
Dink adirgolignyal bedelen sayqot’ir
Dink adirgolignyal wedebetu t’erat’agn
Dink adirgolignyal rek’she salehu

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 2
Dink adirgolignyal lijé hoy na alegn
Dink adirgolignyal bedagim mits’atu
Dink adirgolignyal mengistun liyawirsagn

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 3
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 4
Dink adirgolignyal keanbesa mengagga
Dink adirgolignyal kegudgwad awet’agn
Dink adirgolignyal bet’elateche fit

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 5
Dink adirgolignyal girma moges set’egn
Dink adirgolignyal min emelsalew
Dink adirgolignyal indi lewededegn

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 6
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 7
Dink adirgolignyal t’elateche hulu
Dink adirgolignyal siguadedubegn
Dink adirgolignyal man yidersletal

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 8
Dink adirgolignyal eyalu silugn
Dink adirgolignyal fet’neh deresklign
Dink adirgolignyal kemot adanekegn

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 9
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

CHORUS
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bfd63e69-ee42-49a5-84e3-396600a3f84f'::uuid, 'dink-adirgolignyal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sile-mayneger-setotaw ("Sile Mayneger Setotaw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c0605fd1-30ef-434e-bd0d-7245b26dcd95'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 1
የሕይወት እስትንፉስ ዘራብን
ሕያው እንድንሆን
ይህን ያደረገ አምላካችን
እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 2
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 3
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 4
ነፉስን ገስፆ
ማዕበል አቁሞ ሚያሻግር
የዓለም ፈተና ቢበዛ
እሱ መጠጊያችን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 5
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 6
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 7
ዳግም እንዳንሞት
በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ
ሰላምን ለሰጠን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 8
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 9
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 10
ከሲኦል እስራት ተፈተን
ነጻ የወጣንበት
ሕይወትን ለሰጠን
ለአምላካችን እንዘምር በእውነት

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 11
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 12
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 1
Yehiywet istinfus zerabn
Hiyaw endinhon
Yihin yaderge Amlakachen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 2
Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 3
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 4
Nefusun gesfo
Maebel aqumo miyashager
Yealem fetena bibezza

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 5
Isu metegiyachen
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 6
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 7
Dagim endanmot
Bemotu moten yeretaln
Yeminemekabet tinisae

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 8
Selamen leseten
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 9
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 10
Kesiol esirat tefeten
Netsa yewetanbet
Hiyweten leseten

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 11
LeAmlakachen enzemr beewnet
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 12
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 1
የሕይወት እስትንፉስ ዘራብን
ሕያው እንድንሆን
ይህን ያደረገ አምላካችን
እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 2
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 3
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 4
ነፉስን ገስፆ
ማዕበል አቁሞ ሚያሻግር
የዓለም ፈተና ቢበዛ
እሱ መጠጊያችን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 5
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 6
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 7
ዳግም እንዳንሞት
በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ
ሰላምን ለሰጠን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 8
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 9
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 10
ከሲኦል እስራት ተፈተን
ነጻ የወጣንበት
ሕይወትን ለሰጠን
ለአምላካችን እንዘምር በእውነት

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 11
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 12
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን',
        lyrics_transliteration = 'CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 1
Yehiywet istinfus zerabn
Hiyaw endinhon
Yihin yaderge Amlakachen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 2
Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 3
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 4
Nefusun gesfo
Maebel aqumo miyashager
Yealem fetena bibezza

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 5
Isu metegiyachen
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 6
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 7
Dagim endanmot
Bemotu moten yeretaln
Yeminemekabet tinisae

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 8
Selamen leseten
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 9
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 10
Kesiol esirat tefeten
Netsa yewetanbet
Hiyweten leseten

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 11
LeAmlakachen enzemr beewnet
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 12
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c0605fd1-30ef-434e-bd0d-7245b26dcd95'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 1
የሕይወት እስትንፉስ ዘራብን
ሕያው እንድንሆን
ይህን ያደረገ አምላካችን
እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 2
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 3
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 4
ነፉስን ገስፆ
ማዕበል አቁሞ ሚያሻግር
የዓለም ፈተና ቢበዛ
እሱ መጠጊያችን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 5
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 6
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 7
ዳግም እንዳንሞት
በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ
ሰላምን ለሰጠን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 8
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 9
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 10
ከሲኦል እስራት ተፈተን
ነጻ የወጣንበት
ሕይወትን ለሰጠን
ለአምላካችን እንዘምር በእውነት

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 11
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 12
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 1
Yehiywet istinfus zerabn
Hiyaw endinhon
Yihin yaderge Amlakachen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 2
Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 3
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 4
Nefusun gesfo
Maebel aqumo miyashager
Yealem fetena bibezza

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 5
Isu metegiyachen
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 6
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 7
Dagim endanmot
Bemotu moten yeretaln
Yeminemekabet tinisae

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 8
Selamen leseten
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 9
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 10
Kesiol esirat tefeten
Netsa yewetanbet
Hiyweten leseten

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 11
LeAmlakachen enzemr beewnet
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 12
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

CHORUS
Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c0605fd1-30ef-434e-bd0d-7245b26dcd95'::uuid, 'sile-mayneger-setotaw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kibire-new-kibirihin-menagere ("Kibire New Kibirihin Menagere")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7210684b-cd23-4451-b9cb-5a22a26ccec4'::uuid
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
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 1
Ayche yeejhn tamrat
Semche yeqalhn timhrt
Hognalehu miskr leadagnneth
Sigan tewahdeh leegna megelet’h 2

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 2
Teketelkuh hulun neger niqe
Medhenit mehonkn awqe
Kemelkamwa beth tet’elyalehu
Yeejhn bereket kante et’egbalehu 2

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 3
Erf yizhe lalars wedehwala
Eyayehu mereben sitmola
Emekabhelew bante medhne
Amlake nehna yemtrara leene

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 4
Abate nehna yemtasb leene
Chernet mihret kebezalgn
Lesmh widase qine alegn
Kibrena mogese ante neh Geta

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 5
Temesgen temesgen t’ewatna mata 2

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2'
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
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 1
Ayche yeejhn tamrat
Semche yeqalhn timhrt
Hognalehu miskr leadagnneth
Sigan tewahdeh leegna megelet’h 2

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 2
Teketelkuh hulun neger niqe
Medhenit mehonkn awqe
Kemelkamwa beth tet’elyalehu
Yeejhn bereket kante et’egbalehu 2

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 3
Erf yizhe lalars wedehwala
Eyayehu mereben sitmola
Emekabhelew bante medhne
Amlake nehna yemtrara leene

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 4
Abate nehna yemtasb leene
Chernet mihret kebezalgn
Lesmh widase qine alegn
Kibrena mogese ante neh Geta

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 5
Temesgen temesgen t’ewatna mata 2

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7210684b-cd23-4451-b9cb-5a22a26ccec4'::uuid
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7210684b-cd23-4451-b9cb-5a22a26ccec4'::uuid, 'kibire-new-kibirihin-menagere', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yetsadik-sew-tselot ("Yetsadik Sew Tselot")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '72a7a232-a746-4028-9a10-27bcadf53773'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 1
የኢያሱ ፀሎት ግዳጅን ፈፅሟል
በገባኦት ሰማይ ፀሀይን አቁሟል
ማድጋዋ ሟልቶል በኤልሳ በረከት
ከርሀብ ድናለች ሱናማዊቷ ሴት

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 2
ህያው እንድትሆን ጴጥሮስ ፀለየላት
ጣቢታ ተነሳች ሞት ተሸንፎላት
ከሰገነት ወድቆ ቢሞት አዉጣኪስ
ህይወት ሰጠዉ አቅፎ ቅዱስ ጳዉሎስ

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 3
በስሙ መከራን ለተቀበሉት
ይለመናል ጌታ ስለሰማዕታት
በፃድቅ ስም ዉሀ ለመስጠት የተጋ
ያገኛል ከእግዚአብሔር የፃድቁን ዋጋ

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 4
ቃል ኪዳን ስላለዉ ከመረጣቸው
ስለማለላቸዉ በፅኑ መሀላዉ
ጌታ ስለነርሱ እንደሚማለድን
በመንፈስ ቅዱስ አፍ መፅሐፍ ነገረን

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 1
Yeiyasu ts’elot gidajn fets’mwal
Begebaot semay ts’eheyn aqumwal
Madgawa mwaltol beelsa bereket
Kerheb dinalech sunamawitwa set

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 2
Hiyaw endthon p’et’ros ts’eleyelat
T’abita tenesach mot teshenfolat
Kesegenet wedqo bimot awut’akis
Hiywet set’ewu aqfo Kidus p’awulos

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 3
Besmu mekeran leteqebelut
Yilemenal Geta silesemaetat
Bets’adq sim wuhe lemest’et yetega
Yagegnal keegziabher yets’adqun waga

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 4
Qal kidan silalewu kemeret’achew
Silemalelachewu bets’nu mehelawu
Geta silenersu endemimaledn
Bemenfes Kidus af mets’hef negeren

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 1
የኢያሱ ፀሎት ግዳጅን ፈፅሟል
በገባኦት ሰማይ ፀሀይን አቁሟል
ማድጋዋ ሟልቶል በኤልሳ በረከት
ከርሀብ ድናለች ሱናማዊቷ ሴት

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 2
ህያው እንድትሆን ጴጥሮስ ፀለየላት
ጣቢታ ተነሳች ሞት ተሸንፎላት
ከሰገነት ወድቆ ቢሞት አዉጣኪስ
ህይወት ሰጠዉ አቅፎ ቅዱስ ጳዉሎስ

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 3
በስሙ መከራን ለተቀበሉት
ይለመናል ጌታ ስለሰማዕታት
በፃድቅ ስም ዉሀ ለመስጠት የተጋ
ያገኛል ከእግዚአብሔር የፃድቁን ዋጋ

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 4
ቃል ኪዳን ስላለዉ ከመረጣቸው
ስለማለላቸዉ በፅኑ መሀላዉ
ጌታ ስለነርሱ እንደሚማለድን
በመንፈስ ቅዱስ አፍ መፅሐፍ ነገረን

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል',
        lyrics_transliteration = 'CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 1
Yeiyasu ts’elot gidajn fets’mwal
Begebaot semay ts’eheyn aqumwal
Madgawa mwaltol beelsa bereket
Kerheb dinalech sunamawitwa set

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 2
Hiyaw endthon p’et’ros ts’eleyelat
T’abita tenesach mot teshenfolat
Kesegenet wedqo bimot awut’akis
Hiywet set’ewu aqfo Kidus p’awulos

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 3
Besmu mekeran leteqebelut
Yilemenal Geta silesemaetat
Bets’adq sim wuhe lemest’et yetega
Yagegnal keegziabher yets’adqun waga

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 4
Qal kidan silalewu kemeret’achew
Silemalelachewu bets’nu mehelawu
Geta silenersu endemimaledn
Bemenfes Kidus af mets’hef negeren

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '72a7a232-a746-4028-9a10-27bcadf53773'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 1
የኢያሱ ፀሎት ግዳጅን ፈፅሟል
በገባኦት ሰማይ ፀሀይን አቁሟል
ማድጋዋ ሟልቶል በኤልሳ በረከት
ከርሀብ ድናለች ሱናማዊቷ ሴት

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 2
ህያው እንድትሆን ጴጥሮስ ፀለየላት
ጣቢታ ተነሳች ሞት ተሸንፎላት
ከሰገነት ወድቆ ቢሞት አዉጣኪስ
ህይወት ሰጠዉ አቅፎ ቅዱስ ጳዉሎስ

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 3
በስሙ መከራን ለተቀበሉት
ይለመናል ጌታ ስለሰማዕታት
በፃድቅ ስም ዉሀ ለመስጠት የተጋ
ያገኛል ከእግዚአብሔር የፃድቁን ዋጋ

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 4
ቃል ኪዳን ስላለዉ ከመረጣቸው
ስለማለላቸዉ በፅኑ መሀላዉ
ጌታ ስለነርሱ እንደሚማለድን
በመንፈስ ቅዱስ አፍ መፅሐፍ ነገረን

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '72a7a232-a746-4028-9a10-27bcadf53773'::uuid, 'yetsadik-sew-tselot', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- itiyopiyawiw-tsadik ("Itiyopiyawiw Tsadik")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '23d02176-fcc9-4c78-b4c9-e66f750f46d2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 1
ethiopiawiw tsdaik man new biye teyeku
bereket felige lisalemew nafeku
kibrun limesekir tefeta milase
kedeju derishe fikrun bemekmese

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 2
°°°
በኢቲሳ ምድር ዘር ሆነህ በቅለህ
ተለየህ ለአምላክ ዓለምን ጥለህ
ደብረ ሊባኖስ ህያው ምስክር

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 3
ስላንተ ዝና ስላንተ ክብር
ተክለሃይማኖት ወዳጄ
ተባርኳል ባንተ ጓዳ ደጄ
beetisa midir zer honeh bekleh

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 4
teleyehe lamlak alemin tileh
debrelibanos hiyaw misikir
silante zina silante kibir
teklehaymanot wedaje

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 5
tebarkual bante guada deje
°°°
አክባሪው አምላክ ስላከበረ
ዛሬም ከኛ ጋር በመንፈስ አለ

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 6
ደጅህ እንጠናለን በትህትና
የጻድቅ ጸሎት ኃይል አላትና
ተክለሃይማኖት ጸሃይ
ጸጋህ ይሙላልኝ ከሰማይ

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 7
akbariw amlak silakebereh
zarem kegna gar bemenfes aleh
deji intenalen betihitina
yetsadiku tselot hayl alatina

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 8
teklehaymanot tsehay
tsegah yimulagn kesemay
°°°
ወደ ለምለም መስክ ሰብከህ መራኅን

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 9
የቃሉን ወተት አጠጥተኅን
ያቀጣጠልከው የወንጌል ችቦ
የአምላክ አረገው ትውልዱን ስቦ
ተክለሃይማኖት ወዳጄ

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 10
ተባርኳል ባንተ ቤቴ ደጄ
wede lemlem mesk sebkeh merahen
yekalun wetet atetitehen
yaketatelkew yewengel chibo

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 11
yamlak adirgual tiwlidun sibo
teklehaymanot wedaje
tebarkual bante deje
°°°

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 12
ሰላሳ ስልሳ መቶ ያፈራል
በደብረ አጽቦ ቆመህ በአንድ እግርህ
የመቶሎሜ መሻት ቀረና
የጌታ መንገድ ጥርጊያውም ቀና

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 13
ተክለሃይማኖት ወዳጄ
ተባርኳል ባንተ ጓዳ ደጄ
selasa sisla moto yafera
bedevre atsbo komeh beand argeh

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 14
yemetolomeh mishat kerena
yegeta menged tirgyaum kena
teklehaymanot wedaje
tebarkual bante guada deje

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 1
Ethiopiawiw tsdaik man new biye teyeku
Bereket felige lisalemew nafeku
Kibrun limesekir tefeta milase
Kedeju derishe fikrun bemekmese

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 2
°°°
Beitisa midr zer honeh beqleh
Teleyeh leamlak alemn t’leh
Debre libanos hiyaw miskr

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 3
Silante zina silante kibir
Tekle Haymanot wedaje
Tebarkwal bante gwada deje
Beetisa midir zer honeh bekleh

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 4
Teleyehe lamlak alemin tileh
Debrelibanos hiyaw misikir
Silante zina silante kibir
Teklehaymanot wedaje

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 5
Tebarkual bante guada deje
°°°
Akbariw amlak silakebere
Zarem kegna gar bemenfes ale

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 6
Dejh ent’enalen bethtna
Yets’adq ts’elot hayl alatna
Tekle Haymanot ts’ehay
Ts’egah yimulalgn kesemay

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 7
Akbariw amlak silakebereh
Zarem kegna gar bemenfes aleh
Deji intenalen betihitina
Yetsadiku tselot hayl alatina

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 8
Teklehaymanot tsehay
Tsegah yimulagn kesemay
°°°
Wede lemlem mesk sebkeh merahn

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 9
Yeqalun wetet at’et’tehn
Yaqet’at’elkew yewengel chbo
Yeamlak aregew tiwldun sibo
Tekle Haymanot wedaje

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 10
Tebarkwal bante bete deje
Wede lemlem mesk sebkeh merahen
Yekalun wetet atetitehen
Yaketatelkew yewengel chibo

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 11
Yamlak adirgual tiwlidun sibo
Teklehaymanot wedaje
Tebarkual bante deje
°°°

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 12
Selasa silsa meto yaferal
Bedebre ats’bo qomeh beand egrh
Yemetolome meshat qerena
Yegeta menged t’rgiyawm qena

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 13
Tekle Haymanot wedaje
Tebarkwal bante gwada deje
Selasa sisla moto yafera
Bedevre atsbo komeh beand argeh

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 14
Yemetolomeh mishat kerena
Yegeta menged tirgyaum kena
Teklehaymanot wedaje
Tebarkual bante guada deje

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 1
ethiopiawiw tsdaik man new biye teyeku
bereket felige lisalemew nafeku
kibrun limesekir tefeta milase
kedeju derishe fikrun bemekmese

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 2
°°°
በኢቲሳ ምድር ዘር ሆነህ በቅለህ
ተለየህ ለአምላክ ዓለምን ጥለህ
ደብረ ሊባኖስ ህያው ምስክር

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 3
ስላንተ ዝና ስላንተ ክብር
ተክለሃይማኖት ወዳጄ
ተባርኳል ባንተ ጓዳ ደጄ
beetisa midir zer honeh bekleh

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 4
teleyehe lamlak alemin tileh
debrelibanos hiyaw misikir
silante zina silante kibir
teklehaymanot wedaje

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 5
tebarkual bante guada deje
°°°
አክባሪው አምላክ ስላከበረ
ዛሬም ከኛ ጋር በመንፈስ አለ

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 6
ደጅህ እንጠናለን በትህትና
የጻድቅ ጸሎት ኃይል አላትና
ተክለሃይማኖት ጸሃይ
ጸጋህ ይሙላልኝ ከሰማይ

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 7
akbariw amlak silakebereh
zarem kegna gar bemenfes aleh
deji intenalen betihitina
yetsadiku tselot hayl alatina

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 8
teklehaymanot tsehay
tsegah yimulagn kesemay
°°°
ወደ ለምለም መስክ ሰብከህ መራኅን

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 9
የቃሉን ወተት አጠጥተኅን
ያቀጣጠልከው የወንጌል ችቦ
የአምላክ አረገው ትውልዱን ስቦ
ተክለሃይማኖት ወዳጄ

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 10
ተባርኳል ባንተ ቤቴ ደጄ
wede lemlem mesk sebkeh merahen
yekalun wetet atetitehen
yaketatelkew yewengel chibo

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 11
yamlak adirgual tiwlidun sibo
teklehaymanot wedaje
tebarkual bante deje
°°°

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 12
ሰላሳ ስልሳ መቶ ያፈራል
በደብረ አጽቦ ቆመህ በአንድ እግርህ
የመቶሎሜ መሻት ቀረና
የጌታ መንገድ ጥርጊያውም ቀና

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 13
ተክለሃይማኖት ወዳጄ
ተባርኳል ባንተ ጓዳ ደጄ
selasa sisla moto yafera
bedevre atsbo komeh beand argeh

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 14
yemetolomeh mishat kerena
yegeta menged tirgyaum kena
teklehaymanot wedaje
tebarkual bante guada deje

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ',
        lyrics_transliteration = 'CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 1
Ethiopiawiw tsdaik man new biye teyeku
Bereket felige lisalemew nafeku
Kibrun limesekir tefeta milase
Kedeju derishe fikrun bemekmese

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 2
°°°
Beitisa midr zer honeh beqleh
Teleyeh leamlak alemn t’leh
Debre libanos hiyaw miskr

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 3
Silante zina silante kibir
Tekle Haymanot wedaje
Tebarkwal bante gwada deje
Beetisa midir zer honeh bekleh

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 4
Teleyehe lamlak alemin tileh
Debrelibanos hiyaw misikir
Silante zina silante kibir
Teklehaymanot wedaje

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 5
Tebarkual bante guada deje
°°°
Akbariw amlak silakebere
Zarem kegna gar bemenfes ale

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 6
Dejh ent’enalen bethtna
Yets’adq ts’elot hayl alatna
Tekle Haymanot ts’ehay
Ts’egah yimulalgn kesemay

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 7
Akbariw amlak silakebereh
Zarem kegna gar bemenfes aleh
Deji intenalen betihitina
Yetsadiku tselot hayl alatina

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 8
Teklehaymanot tsehay
Tsegah yimulagn kesemay
°°°
Wede lemlem mesk sebkeh merahn

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 9
Yeqalun wetet at’et’tehn
Yaqet’at’elkew yewengel chbo
Yeamlak aregew tiwldun sibo
Tekle Haymanot wedaje

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 10
Tebarkwal bante bete deje
Wede lemlem mesk sebkeh merahen
Yekalun wetet atetitehen
Yaketatelkew yewengel chibo

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 11
Yamlak adirgual tiwlidun sibo
Teklehaymanot wedaje
Tebarkual bante deje
°°°

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 12
Selasa silsa meto yaferal
Bedebre ats’bo qomeh beand egrh
Yemetolome meshat qerena
Yegeta menged t’rgiyawm qena

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 13
Tekle Haymanot wedaje
Tebarkwal bante gwada deje
Selasa sisla moto yafera
Bedevre atsbo komeh beand argeh

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 14
Yemetolomeh mishat kerena
Yegeta menged tirgyaum kena
Teklehaymanot wedaje
Tebarkual bante guada deje

CHORUS
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese',
        updated_at = clock_timestamp()::text
    WHERE import_id = '23d02176-fcc9-4c78-b4c9-e66f750f46d2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 1
ethiopiawiw tsdaik man new biye teyeku
bereket felige lisalemew nafeku
kibrun limesekir tefeta milase
kedeju derishe fikrun bemekmese

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 2
°°°
በኢቲሳ ምድር ዘር ሆነህ በቅለህ
ተለየህ ለአምላክ ዓለምን ጥለህ
ደብረ ሊባኖስ ህያው ምስክር

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 3
ስላንተ ዝና ስላንተ ክብር
ተክለሃይማኖት ወዳጄ
ተባርኳል ባንተ ጓዳ ደጄ
beetisa midir zer honeh bekleh

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 4
teleyehe lamlak alemin tileh
debrelibanos hiyaw misikir
silante zina silante kibir
teklehaymanot wedaje

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 5
tebarkual bante guada deje
°°°
አክባሪው አምላክ ስላከበረ
ዛሬም ከኛ ጋር በመንፈስ አለ

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 6
ደጅህ እንጠናለን በትህትና
የጻድቅ ጸሎት ኃይል አላትና
ተክለሃይማኖት ጸሃይ
ጸጋህ ይሙላልኝ ከሰማይ

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 7
akbariw amlak silakebereh
zarem kegna gar bemenfes aleh
deji intenalen betihitina
yetsadiku tselot hayl alatina

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 8
teklehaymanot tsehay
tsegah yimulagn kesemay
°°°
ወደ ለምለም መስክ ሰብከህ መራኅን

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 9
የቃሉን ወተት አጠጥተኅን
ያቀጣጠልከው የወንጌል ችቦ
የአምላክ አረገው ትውልዱን ስቦ
ተክለሃይማኖት ወዳጄ

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 10
ተባርኳል ባንተ ቤቴ ደጄ
wede lemlem mesk sebkeh merahen
yekalun wetet atetitehen
yaketatelkew yewengel chibo

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 11
yamlak adirgual tiwlidun sibo
teklehaymanot wedaje
tebarkual bante deje
°°°

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 12
ሰላሳ ስልሳ መቶ ያፈራል
በደብረ አጽቦ ቆመህ በአንድ እግርህ
የመቶሎሜ መሻት ቀረና
የጌታ መንገድ ጥርጊያውም ቀና

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 13
ተክለሃይማኖት ወዳጄ
ተባርኳል ባንተ ጓዳ ደጄ
selasa sisla moto yafera
bedevre atsbo komeh beand argeh

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 14
yemetolomeh mishat kerena
yegeta menged tirgyaum kena
teklehaymanot wedaje
tebarkual bante guada deje

CHORUS
ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '23d02176-fcc9-4c78-b4c9-e66f750f46d2'::uuid, 'itiyopiyawiw-tsadik', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kem-fikadu ("[kem Fikadu ]")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '40098eed-f414-49fe-95a2-7b1a1af809c0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 1
ጓሂ ልብና ምሒር በዚሑ
ልዕሊ ዓቅሚ ኮይኑና ሲኢና ምፍትሑ
"ኣብቂዑ''ዩ ናተይ ነገር" ኣብ ንብለሉ
መፍትሒ ኣለዉ ንጎይታ ጾርና ንቅርበሉ

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 2
ኣዝ
ክሲ ሕልና ሰላም ከሊኡና
ተስፋ ካባና ሪሑቁ መቅባሕባሕቲ ኮይና
ዋላ''ኳ አንተ ወደቅና ፍጽም ኣይንትሓለል

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 3
ርህሩህ ኣቦ ኣሎና ከምዚ''ኻ ከይበለ ዝቅበል
ኣዝ
አቲ ንዓና ከቢድ ዝመስል
ኸይነስተውዕል ጋሪዱ ዝኾነና ግድል

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 4
ኣብ ቅድሚ አግዚኣብሄር ኣዝዩ ንአሽቶ''ዩ
ጥራይ ንተኣመን ኣምላኽና ኩሉ ከኣሊ''ዩ
ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 5
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 1
Gwahi libna mihir bezihu
Lieli aqmi koynuna siina mifthu
"abqiu''yu natey neger" ab niblelu
Mefthi alewu nigoyta ts’orna niqrbelu

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 2
Az
Kisi hilna selam keliuna
Tesfa kabana rihuqu meqbahbahti koyna
Wala''kwa ante wedeqna fits’m aynthalel

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 3
Rihruh abo alona kemzi''ኻ keybele ziqbel
Az
Ati niana kebid zimesl
ኸynestewel garidu ziኾnena gidl

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 4
Ab qidmi agziabher azyu niashto''yu
T’ray niteamen amlaኽna kulu keali''yu
Kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 5
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 1
ጓሂ ልብና ምሒር በዚሑ
ልዕሊ ዓቅሚ ኮይኑና ሲኢና ምፍትሑ
"ኣብቂዑ''ዩ ናተይ ነገር" ኣብ ንብለሉ
መፍትሒ ኣለዉ ንጎይታ ጾርና ንቅርበሉ

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 2
ኣዝ
ክሲ ሕልና ሰላም ከሊኡና
ተስፋ ካባና ሪሑቁ መቅባሕባሕቲ ኮይና
ዋላ''ኳ አንተ ወደቅና ፍጽም ኣይንትሓለል

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 3
ርህሩህ ኣቦ ኣሎና ከምዚ''ኻ ከይበለ ዝቅበል
ኣዝ
አቲ ንዓና ከቢድ ዝመስል
ኸይነስተውዕል ጋሪዱ ዝኾነና ግድል

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 4
ኣብ ቅድሚ አግዚኣብሄር ኣዝዩ ንአሽቶ''ዩ
ጥራይ ንተኣመን ኣምላኽና ኩሉ ከኣሊ''ዩ
ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 5
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ',
        lyrics_transliteration = 'CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 1
Gwahi libna mihir bezihu
Lieli aqmi koynuna siina mifthu
"abqiu''yu natey neger" ab niblelu
Mefthi alewu nigoyta ts’orna niqrbelu

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 2
Az
Kisi hilna selam keliuna
Tesfa kabana rihuqu meqbahbahti koyna
Wala''kwa ante wedeqna fits’m aynthalel

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 3
Rihruh abo alona kemzi''ኻ keybele ziqbel
Az
Ati niana kebid zimesl
ኸynestewel garidu ziኾnena gidl

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 4
Ab qidmi agziabher azyu niashto''yu
T’ray niteamen amlaኽna kulu keali''yu
Kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 5
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

CHORUS
Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '40098eed-f414-49fe-95a2-7b1a1af809c0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 1
ጓሂ ልብና ምሒር በዚሑ
ልዕሊ ዓቅሚ ኮይኑና ሲኢና ምፍትሑ
"ኣብቂዑ''ዩ ናተይ ነገር" ኣብ ንብለሉ
መፍትሒ ኣለዉ ንጎይታ ጾርና ንቅርበሉ

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 2
ኣዝ
ክሲ ሕልና ሰላም ከሊኡና
ተስፋ ካባና ሪሑቁ መቅባሕባሕቲ ኮይና
ዋላ''ኳ አንተ ወደቅና ፍጽም ኣይንትሓለል

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 3
ርህሩህ ኣቦ ኣሎና ከምዚ''ኻ ከይበለ ዝቅበል
ኣዝ
አቲ ንዓና ከቢድ ዝመስል
ኸይነስተውዕል ጋሪዱ ዝኾነና ግድል

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 4
ኣብ ቅድሚ አግዚኣብሄር ኣዝዩ ንአሽቶ''ዩ
ጥራይ ንተኣመን ኣምላኽና ኩሉ ከኣሊ''ዩ
ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 5
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

CHORUS
ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '40098eed-f414-49fe-95a2-7b1a1af809c0'::uuid, 'kem-fikadu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beenibaye-anikwakwahu ("Beenibaye Anikwakwahu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6508cf7c-749a-484d-96ff-c143fb66a39d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 1
ስሜቴ ገዝፎ ምኞቴ ነገሰ፤ እምነቴ እያነሰ።
እንደ ዮሴፍ እምነትን፤ እንደ ኢዮብ ትዕግስትን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 2
ከእኔ አትራቅ። የለኝ አማራጭ።
አታልላኝ አለም ጉልበቴን አድክማ፤ ውበቴን አክስማ፤
ስትጥለኝ ያዝከኝ። "በቃህ ልጄ።" አልከኝ። ከጉያህ ሸጎጥከኝ።
እንደ ጊዮርጊስ ተጋድሎን፤ እንደ አርሴማ ፅናትን፤ አድለኝ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 3
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
በቃ። አላነባም። የሚወደኝ አለ፤ እኔን "ልጄ" ያለ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 4
ሳልጠራው ደርሷል። እንባዬን ጠርጎታል። ሳቄን መልሶታል።
እንደ ዳዊት ውዳሴን፤ እንደ አሳፍ ዝማሬን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 5
ከእኔ አትራቅ። የለኝ አማራጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 1
Simete gezfo mignote negese; emnete eyanese.
Ende yosef emnetn; ende iyob tiegstn; adlegn.
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 2
Keene atraq. yelegn amarach’.
Atallagn alem gulbeten adkma; wibeten aksma;
Sitt’legn yazkegn. "beqah lije." alkegn. keguyah shegot’kegn.
Ende Giyorgis tegadlon; ende arsema ts’natn; adlegn.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 3
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Beqa. alanebam. yemiwedegn ale; enen "lije" yale.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 4
Salt’eraw derswal. enbayen t’ergotal. saqen melsotal.
Ende dawit widasen; ende asaf zimaren; adlegn.
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 5
Keene atraq. yelegn amarach’.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 1
ስሜቴ ገዝፎ ምኞቴ ነገሰ፤ እምነቴ እያነሰ።
እንደ ዮሴፍ እምነትን፤ እንደ ኢዮብ ትዕግስትን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 2
ከእኔ አትራቅ። የለኝ አማራጭ።
አታልላኝ አለም ጉልበቴን አድክማ፤ ውበቴን አክስማ፤
ስትጥለኝ ያዝከኝ። "በቃህ ልጄ።" አልከኝ። ከጉያህ ሸጎጥከኝ።
እንደ ጊዮርጊስ ተጋድሎን፤ እንደ አርሴማ ፅናትን፤ አድለኝ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 3
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
በቃ። አላነባም። የሚወደኝ አለ፤ እኔን "ልጄ" ያለ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 4
ሳልጠራው ደርሷል። እንባዬን ጠርጎታል። ሳቄን መልሶታል።
እንደ ዳዊት ውዳሴን፤ እንደ አሳፍ ዝማሬን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 5
ከእኔ አትራቅ። የለኝ አማራጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤',
        lyrics_transliteration = 'CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 1
Simete gezfo mignote negese; emnete eyanese.
Ende yosef emnetn; ende iyob tiegstn; adlegn.
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 2
Keene atraq. yelegn amarach’.
Atallagn alem gulbeten adkma; wibeten aksma;
Sitt’legn yazkegn. "beqah lije." alkegn. keguyah shegot’kegn.
Ende Giyorgis tegadlon; ende arsema ts’natn; adlegn.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 3
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Beqa. alanebam. yemiwedegn ale; enen "lije" yale.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 4
Salt’eraw derswal. enbayen t’ergotal. saqen melsotal.
Ende dawit widasen; ende asaf zimaren; adlegn.
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 5
Keene atraq. yelegn amarach’.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6508cf7c-749a-484d-96ff-c143fb66a39d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 1
ስሜቴ ገዝፎ ምኞቴ ነገሰ፤ እምነቴ እያነሰ።
እንደ ዮሴፍ እምነትን፤ እንደ ኢዮብ ትዕግስትን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 2
ከእኔ አትራቅ። የለኝ አማራጭ።
አታልላኝ አለም ጉልበቴን አድክማ፤ ውበቴን አክስማ፤
ስትጥለኝ ያዝከኝ። "በቃህ ልጄ።" አልከኝ። ከጉያህ ሸጎጥከኝ።
እንደ ጊዮርጊስ ተጋድሎን፤ እንደ አርሴማ ፅናትን፤ አድለኝ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 3
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
በቃ። አላነባም። የሚወደኝ አለ፤ እኔን "ልጄ" ያለ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 4
ሳልጠራው ደርሷል። እንባዬን ጠርጎታል። ሳቄን መልሶታል።
እንደ ዳዊት ውዳሴን፤ እንደ አሳፍ ዝማሬን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 5
ከእኔ አትራቅ። የለኝ አማራጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6508cf7c-749a-484d-96ff-c143fb66a39d'::uuid, 'beenibaye-anikwakwahu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- rieka-bayney-new-eritrean-orthodox-mezmur-2021-rieyeka-biayiney ("#rieka_bayney_new_eritrean_orthodox_mezmur_2021_rieyeka_biayiney")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f7b56e43-f242-424c-b321-6219aedc2b71'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ
ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 2
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 1
Gwahi libey ab wisht’ey mis bezhe
Tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 2
Men alo diyu nisle fiqri kibl
Men alo diyu miytu motey ziser
Men alo kemaኻ bifts’mti fiqri kisab mot zefqere
Biayne libonay hijs rieyeka eye Iyesus medhney

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ
ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 2
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)',
        lyrics_transliteration = 'CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 1
Gwahi libey ab wisht’ey mis bezhe
Tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 2
Men alo diyu nisle fiqri kibl
Men alo diyu miytu motey ziser
Men alo kemaኻ bifts’mti fiqri kisab mot zefqere
Biayne libonay hijs rieyeka eye Iyesus medhney

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f7b56e43-f242-424c-b321-6219aedc2b71'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ
ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 2
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f7b56e43-f242-424c-b321-6219aedc2b71'::uuid, 'rieka-bayney-new-eritrean-orthodox-mezmur-2021-rieyeka-biayiney', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beta-qene-391 ("Beta Qene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e73a48ba-6fad-4f55-9574-faf4099f664c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 1
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 2
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
ከዳን ወገን የሆኑ
በእግዚአብሔር ያመኑ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 3
ማኑሄ የሚባል ሰው
የጌታ አምላክ ታየው
ሚስቱ መካን ነበረች
ልጅንም ያላወለደች

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 4
ሚካኤል ተገልጦላት
በዘር ፍሬ ባረካት
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
በኦፍራህም በጌዴዎን የተገለጠው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 5
እስራኤልን ከመድያምም ይታደገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
አንተ ጽኑ ሀያል ሰው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 6
እግዚአብሔር ካንተ ጋር ነው
ክንዱን ላበረታ
ተልኬአለሁ ከጌታ
አይዞህ ጌዴዎን አለው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 7
ቁርባኑን ያሸተተው
ከኛ ጋር ነው ሚካኤል
ስልፋችንን ይመራል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 8
በኦርናም ደግሞ ሰይፍን ይዞ
ቆሞ የታየው
ዳዊት በምክር ተስፋውን ፈለገው
ኃያሉ ሚካኤል ድንቅ አደረገ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 9
ኃያሉ ሚካኤል ድንቅ አደረገ
በሶስት ቀን ቸነፈር
እንዳትጠፋ ምድር
ሰባ ሺህ ሰዎች ወድቀው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 10
መልአኩን ለቀአለው
ለምህረት እመጣለሁ
ለመዓት እልካለሁ
ሰይፉን በአፎቱ መቶዋል

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 11
ሚካኤል ለህዝቡ ቆሞአል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ስምዖን ጴጥሮስም ከወህብት ገብቶ ያወጣው
የእጆችን ሰንሰለት ፈቶ አደረገው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 12
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
በተጠበቂዎች መሃል
ኬፋን ከእንቅልፉ አቀተው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 13
የተዘጋውንም ጃፍ
አልተሳነውም ማለፍ
ሚካኤል እየመራው
ጴጥሮስ እግሩ የቀናው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 14
አውቆታል እውነት በርቶ
ዘለለ ስሙን ጠርቶ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 15
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 16
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 1
Hayalu Mikael dinq aderege
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 2
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Kedan wegen yehonu
BeEgziabher yamenu

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 3
Manuhe yemibal sew
Yegeta amlak tayew
Mistu mekan neberech
Lijnm yalaweledech

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 4
Mikael tegelt’olat
Bezer fire barekat
YeEgziabher melak simu dinq new
Beofrahm begedewon yetegelet’ew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 5
Esraeln kemedyamm yitadegew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Ante ts’nu heyal sew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 6
Egziabher kante gar new
Kindun labereta
Telkealehu kegeta
Ayzoh gedewon alew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 7
Qurbanun yashetetew
Kegna gar new Mikael
Silfachnn yimeral
YeEgziabher melak simu dinq new

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 8
Beornam degmo seyfn yizo
Qomo yetayew
Dawit bemkr tesfawn felegew
Hayalu Mikael dinq aderege

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 9
Hayalu Mikael dinq aderege
Besost qen chenefer
Endatt’efa midr
Seba shih sewoch wedqew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 10
Melakun leqealew
Lemhret emet’alehu
Lemeat elkalehu
Seyfun beafotu metowal

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 11
Mikael lehzbu qomoal
YeEgziabher melak simu dinq new
Simon p’et’rosm kewehbt gebto yawet’aw
Yeejochn senselet feto aderegew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 12
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Betet’ebeqiwoch mehal
Kefan keenqlfu aqetew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 13
Yetezegawnm jaf
Altesanewm malef
Mikael eyemeraw
P’et’ros egru yeqenaw

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 14
Awqotal ewnet berto
Zelele simun t’erto
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 15
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
YeEgziabher melak simu dinq new

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 16
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 1
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 2
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
ከዳን ወገን የሆኑ
በእግዚአብሔር ያመኑ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 3
ማኑሄ የሚባል ሰው
የጌታ አምላክ ታየው
ሚስቱ መካን ነበረች
ልጅንም ያላወለደች

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 4
ሚካኤል ተገልጦላት
በዘር ፍሬ ባረካት
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
በኦፍራህም በጌዴዎን የተገለጠው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 5
እስራኤልን ከመድያምም ይታደገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
አንተ ጽኑ ሀያል ሰው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 6
እግዚአብሔር ካንተ ጋር ነው
ክንዱን ላበረታ
ተልኬአለሁ ከጌታ
አይዞህ ጌዴዎን አለው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 7
ቁርባኑን ያሸተተው
ከኛ ጋር ነው ሚካኤል
ስልፋችንን ይመራል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 8
በኦርናም ደግሞ ሰይፍን ይዞ
ቆሞ የታየው
ዳዊት በምክር ተስፋውን ፈለገው
ኃያሉ ሚካኤል ድንቅ አደረገ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 9
ኃያሉ ሚካኤል ድንቅ አደረገ
በሶስት ቀን ቸነፈር
እንዳትጠፋ ምድር
ሰባ ሺህ ሰዎች ወድቀው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 10
መልአኩን ለቀአለው
ለምህረት እመጣለሁ
ለመዓት እልካለሁ
ሰይፉን በአፎቱ መቶዋል

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 11
ሚካኤል ለህዝቡ ቆሞአል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ስምዖን ጴጥሮስም ከወህብት ገብቶ ያወጣው
የእጆችን ሰንሰለት ፈቶ አደረገው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 12
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
በተጠበቂዎች መሃል
ኬፋን ከእንቅልፉ አቀተው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 13
የተዘጋውንም ጃፍ
አልተሳነውም ማለፍ
ሚካኤል እየመራው
ጴጥሮስ እግሩ የቀናው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 14
አውቆታል እውነት በርቶ
ዘለለ ስሙን ጠርቶ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 15
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 16
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ',
        lyrics_transliteration = 'CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 1
Hayalu Mikael dinq aderege
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 2
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Kedan wegen yehonu
BeEgziabher yamenu

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 3
Manuhe yemibal sew
Yegeta amlak tayew
Mistu mekan neberech
Lijnm yalaweledech

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 4
Mikael tegelt’olat
Bezer fire barekat
YeEgziabher melak simu dinq new
Beofrahm begedewon yetegelet’ew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 5
Esraeln kemedyamm yitadegew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Ante ts’nu heyal sew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 6
Egziabher kante gar new
Kindun labereta
Telkealehu kegeta
Ayzoh gedewon alew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 7
Qurbanun yashetetew
Kegna gar new Mikael
Silfachnn yimeral
YeEgziabher melak simu dinq new

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 8
Beornam degmo seyfn yizo
Qomo yetayew
Dawit bemkr tesfawn felegew
Hayalu Mikael dinq aderege

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 9
Hayalu Mikael dinq aderege
Besost qen chenefer
Endatt’efa midr
Seba shih sewoch wedqew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 10
Melakun leqealew
Lemhret emet’alehu
Lemeat elkalehu
Seyfun beafotu metowal

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 11
Mikael lehzbu qomoal
YeEgziabher melak simu dinq new
Simon p’et’rosm kewehbt gebto yawet’aw
Yeejochn senselet feto aderegew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 12
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Betet’ebeqiwoch mehal
Kefan keenqlfu aqetew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 13
Yetezegawnm jaf
Altesanewm malef
Mikael eyemeraw
P’et’ros egru yeqenaw

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 14
Awqotal ewnet berto
Zelele simun t’erto
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 15
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
YeEgziabher melak simu dinq new

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 16
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e73a48ba-6fad-4f55-9574-faf4099f664c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 1
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 2
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
ከዳን ወገን የሆኑ
በእግዚአብሔር ያመኑ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 3
ማኑሄ የሚባል ሰው
የጌታ አምላክ ታየው
ሚስቱ መካን ነበረች
ልጅንም ያላወለደች

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 4
ሚካኤል ተገልጦላት
በዘር ፍሬ ባረካት
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
በኦፍራህም በጌዴዎን የተገለጠው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 5
እስራኤልን ከመድያምም ይታደገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
አንተ ጽኑ ሀያል ሰው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 6
እግዚአብሔር ካንተ ጋር ነው
ክንዱን ላበረታ
ተልኬአለሁ ከጌታ
አይዞህ ጌዴዎን አለው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 7
ቁርባኑን ያሸተተው
ከኛ ጋር ነው ሚካኤል
ስልፋችንን ይመራል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 8
በኦርናም ደግሞ ሰይፍን ይዞ
ቆሞ የታየው
ዳዊት በምክር ተስፋውን ፈለገው
ኃያሉ ሚካኤል ድንቅ አደረገ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 9
ኃያሉ ሚካኤል ድንቅ አደረገ
በሶስት ቀን ቸነፈር
እንዳትጠፋ ምድር
ሰባ ሺህ ሰዎች ወድቀው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 10
መልአኩን ለቀአለው
ለምህረት እመጣለሁ
ለመዓት እልካለሁ
ሰይፉን በአፎቱ መቶዋል

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 11
ሚካኤል ለህዝቡ ቆሞአል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ስምዖን ጴጥሮስም ከወህብት ገብቶ ያወጣው
የእጆችን ሰንሰለት ፈቶ አደረገው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 12
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
በተጠበቂዎች መሃል
ኬፋን ከእንቅልፉ አቀተው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 13
የተዘጋውንም ጃፍ
አልተሳነውም ማለፍ
ሚካኤል እየመራው
ጴጥሮስ እግሩ የቀናው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 14
አውቆታል እውነት በርቶ
ዘለለ ስሙን ጠርቶ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 15
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 16
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e73a48ba-6fad-4f55-9574-faf4099f664c'::uuid, 'beta-qene-391', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hayal-man-enidanite ("Hayal Man Enidanite")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '784c9617-7dbc-4d12-9804-865e5cb057d7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 1
ሞገሱ ለሙሴ ተስፋው ለእስራኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
ከአምላክ ዘንድ ተልኮ ወደኛ የሚመጣው
መቅሰፍትን ሚያጠፋው ሚካኤል እርሱ ነው

CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 2
ሁሌም የሚላከው ምድሪቷን የሚከባት
የሚያድን ሚታደግ ሕዝቡንም ከጥፋት
የሚታደግ ሚያድን ሕዝቡንም ከጥፋት
ሚካኤል ያድናል ብለን ስንመሰክር

CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 3
በአይናችን አይተን ነው የእሳቱን ባሕር
ፍቅሩ ስላለብን ሁሌም በልባችን
እንመሰክራልን ሥራውን በአንደበታችን
እንመሰክራልን ሥራውን በዝማሬያችን

CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hayal man endante sedade sat’nael
YeEgziabher balemwal melaku Mikael
Yemelaekt aleqa Mikael sit’era
Yiregfal yibenal seyt’an eyefera

VERSE 1
Mogesu lemuse tesfaw leesrael
YeEgziabher balemwal melaku Mikael
Keamlak zend telko wedegna yemimet’aw
Meqseftn miyat’efaw Mikael ersu new

CHORUS
Hayal man endante sedade sat’nael
YeEgziabher balemwal melaku Mikael
Yemelaekt aleqa Mikael sit’era
Yiregfal yibenal seyt’an eyefera

VERSE 2
Hulem yemilakew midritwan yemikebat
Yemiyadn mitadeg hizbunm ket’fat
Yemitadeg miyadn hizbunm ket’fat
Mikael yadnal bilen sinmesekr

CHORUS
Hayal man endante sedade sat’nael
YeEgziabher balemwal melaku Mikael
Yemelaekt aleqa Mikael sit’era
Yiregfal yibenal seyt’an eyefera

VERSE 3
Beaynachn ayten new yeesatun bahr
Fiqru silalebn hulem belbachn
Enmesekraln sirawn beandebetachn
Enmesekraln sirawn bezmareyachn

CHORUS
Hayal man endante sedade sat’nael
YeEgziabher balemwal melaku Mikael
Yemelaekt aleqa Mikael sit’era
Yiregfal yibenal seyt’an eyefera'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 1
ሞገሱ ለሙሴ ተስፋው ለእስራኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
ከአምላክ ዘንድ ተልኮ ወደኛ የሚመጣው
መቅሰፍትን ሚያጠፋው ሚካኤል እርሱ ነው

CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 2
ሁሌም የሚላከው ምድሪቷን የሚከባት
የሚያድን ሚታደግ ሕዝቡንም ከጥፋት
የሚታደግ ሚያድን ሕዝቡንም ከጥፋት
ሚካኤል ያድናል ብለን ስንመሰክር

CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 3
በአይናችን አይተን ነው የእሳቱን ባሕር
ፍቅሩ ስላለብን ሁሌም በልባችን
እንመሰክራልን ሥራውን በአንደበታችን
እንመሰክራልን ሥራውን በዝማሬያችን

CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ',
        lyrics_transliteration = 'CHORUS
Hayal man endante sedade sat’nael
YeEgziabher balemwal melaku Mikael
Yemelaekt aleqa Mikael sit’era
Yiregfal yibenal seyt’an eyefera

VERSE 1
Mogesu lemuse tesfaw leesrael
YeEgziabher balemwal melaku Mikael
Keamlak zend telko wedegna yemimet’aw
Meqseftn miyat’efaw Mikael ersu new

CHORUS
Hayal man endante sedade sat’nael
YeEgziabher balemwal melaku Mikael
Yemelaekt aleqa Mikael sit’era
Yiregfal yibenal seyt’an eyefera

VERSE 2
Hulem yemilakew midritwan yemikebat
Yemiyadn mitadeg hizbunm ket’fat
Yemitadeg miyadn hizbunm ket’fat
Mikael yadnal bilen sinmesekr

CHORUS
Hayal man endante sedade sat’nael
YeEgziabher balemwal melaku Mikael
Yemelaekt aleqa Mikael sit’era
Yiregfal yibenal seyt’an eyefera

VERSE 3
Beaynachn ayten new yeesatun bahr
Fiqru silalebn hulem belbachn
Enmesekraln sirawn beandebetachn
Enmesekraln sirawn bezmareyachn

CHORUS
Hayal man endante sedade sat’nael
YeEgziabher balemwal melaku Mikael
Yemelaekt aleqa Mikael sit’era
Yiregfal yibenal seyt’an eyefera',
        updated_at = clock_timestamp()::text
    WHERE import_id = '784c9617-7dbc-4d12-9804-865e5cb057d7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 1
ሞገሱ ለሙሴ ተስፋው ለእስራኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
ከአምላክ ዘንድ ተልኮ ወደኛ የሚመጣው
መቅሰፍትን ሚያጠፋው ሚካኤል እርሱ ነው

CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 2
ሁሌም የሚላከው ምድሪቷን የሚከባት
የሚያድን ሚታደግ ሕዝቡንም ከጥፋት
የሚታደግ ሚያድን ሕዝቡንም ከጥፋት
ሚካኤል ያድናል ብለን ስንመሰክር

CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 3
በአይናችን አይተን ነው የእሳቱን ባሕር
ፍቅሩ ስላለብን ሁሌም በልባችን
እንመሰክራልን ሥራውን በአንደበታችን
እንመሰክራልን ሥራውን በዝማሬያችን

CHORUS
ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '784c9617-7dbc-4d12-9804-865e5cb057d7'::uuid, 'hayal-man-enidanite', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yihichin-amet-tewegn-1238 ("Yihichin Amet Tewegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ff1f2639-5045-4752-af5b-a4d2e77322bc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 4
እንዳው ፈስሶ ቀረ
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 1
Zarem salafera eshohn abqye derqe t’ebeqkugn
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem neger gin yih hulu alarmh alegn alleyegnm kealem
Yematslechegn hoy tenesche eskqom ebakh tagesegn
Yeenen kifat tewew melakhn semteh yihchin amet tewegn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 2
Awqalehu tawqaleh qet’eron set’che endemalakebr
Bizu gize aqje bizu gize ziche bewere endemqer
Zendros endalkugn amna yihen gize semteኸgn nebere
Minm sallewet’ zendroye alfo beadis teqeyere

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 3
Fire yemaywet’agn enen bemekotkot ejochh dekemu
Ene gin alehugn zarem albeqagnm behat’iat metamemu
Yeqalhn wiha bedngay lijh lay sattakt sitafes zemen teqot’ere
Wede libe sayserg hiyweten saylewt’

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 4
Endaw fesso qere
Qalhn t’egbe eyagesahut new leloch eskisemu
Beqalh menor gin alyazh alegn kebedegn qelemu
Bizu t’qs agegnehu keqdus mets’hefh gelch’e ayche

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 5
Kerase lay bicha and t’qs at’ahugn bebedel tegnche
Wit’ete dekama timhrt yemayserts’egn temari bihonm
Yihchin amet tewegn degmo tinsh limar tagesegn ahunm
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 6
Yaferut Kidusan yefreachew shta meaza endidersegn
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera
Man yitagesegnal t’elat eyehonkut ayseru sisera
Atawt’agn kebeth bizu bota alyzm fire silelelegn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn
Botas yemiyzut bale migbarochu qidusanh nachew
Lik ende zenbaba yetenzheregege tegadlo ts’dqachew
Kelibanos zigba ejgun yebeza gedl tirufatachew

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 8
Ene aydelehum botas yemtyzew yantew enat nat
Sirochwa bemdr ch’afochwa besemay sidersu yayenat
Yihchin amet tewegn kesrwa ehonalehu bafera minalbat
Yihchin amet tewegn ebakh amlake and amet minh nat

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 9
Shi amet and qen aydelem wey leante amet imnt nat
Yihe amet alfo dagm amet sit’egn eskemlh dires
Ebakhn Geta yihchin amet tewegn yewegun endaders

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 4
እንዳው ፈስሶ ቀረ
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ',
        lyrics_transliteration = 'CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 1
Zarem salafera eshohn abqye derqe t’ebeqkugn
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem neger gin yih hulu alarmh alegn alleyegnm kealem
Yematslechegn hoy tenesche eskqom ebakh tagesegn
Yeenen kifat tewew melakhn semteh yihchin amet tewegn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 2
Awqalehu tawqaleh qet’eron set’che endemalakebr
Bizu gize aqje bizu gize ziche bewere endemqer
Zendros endalkugn amna yihen gize semteኸgn nebere
Minm sallewet’ zendroye alfo beadis teqeyere

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 3
Fire yemaywet’agn enen bemekotkot ejochh dekemu
Ene gin alehugn zarem albeqagnm behat’iat metamemu
Yeqalhn wiha bedngay lijh lay sattakt sitafes zemen teqot’ere
Wede libe sayserg hiyweten saylewt’

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 4
Endaw fesso qere
Qalhn t’egbe eyagesahut new leloch eskisemu
Beqalh menor gin alyazh alegn kebedegn qelemu
Bizu t’qs agegnehu keqdus mets’hefh gelch’e ayche

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 5
Kerase lay bicha and t’qs at’ahugn bebedel tegnche
Wit’ete dekama timhrt yemayserts’egn temari bihonm
Yihchin amet tewegn degmo tinsh limar tagesegn ahunm
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 6
Yaferut Kidusan yefreachew shta meaza endidersegn
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera
Man yitagesegnal t’elat eyehonkut ayseru sisera
Atawt’agn kebeth bizu bota alyzm fire silelelegn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn
Botas yemiyzut bale migbarochu qidusanh nachew
Lik ende zenbaba yetenzheregege tegadlo ts’dqachew
Kelibanos zigba ejgun yebeza gedl tirufatachew

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 8
Ene aydelehum botas yemtyzew yantew enat nat
Sirochwa bemdr ch’afochwa besemay sidersu yayenat
Yihchin amet tewegn kesrwa ehonalehu bafera minalbat
Yihchin amet tewegn ebakh amlake and amet minh nat

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 9
Shi amet and qen aydelem wey leante amet imnt nat
Yihe amet alfo dagm amet sit’egn eskemlh dires
Ebakhn Geta yihchin amet tewegn yewegun endaders

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ff1f2639-5045-4752-af5b-a4d2e77322bc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 4
እንዳው ፈስሶ ቀረ
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ff1f2639-5045-4752-af5b-a4d2e77322bc'::uuid, 'yihichin-amet-tewegn-1238', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- limeskir-zemari-yeabkal-desalegn ("Limeskir zemari yeabkal desalegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9c66aabd-9370-4356-9a96-9665bbd2a2cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 1
የዘላለም መዳን ሕይወት የሚሰጥ
ከጥልቁ ሚነጥቅ ከሞት ሚያስመልጥ
የተላከው መሲህ የተቀባው ጌታ
የእምነታችን ራስ ፈጻሚ ነው ዋልታ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 2
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 3
ያንተ ብቻ እንድሆን አላማህ ነውና
በስምህ ቃኸኸው የአንደበቴን ቃና
ጠጥቼ ረክቼ ከቃሉ ወለላ
አልመችም አለ ሕይወቴ ለሌላ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 4
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 5
ለሚጠፋ መብል አልተጋም ለሥጋ
ክርስቲያን ነኝና ሰማያዊ ዜጋ
ታይቶ ለሚጠፋ ለጊዜያዊው ደስታ
ዋናዬ ኢየሱስን አልሸሽግም ላፍታ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 6
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 7
የሚለ የኝ የለም ከሞተልኝ ጋራ
ድኛለሁና እንዲያው በእርሱ ስራ
ያመንኩት ኢየሱስ ድፍረት ሆኖልኛል
በነቀፉኝ ቁጥር ፀጋው በዝቶልኛል

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 8
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 1
Yezelalem medan hiywet yemiset’
Ket’lqu minet’q kemot miyasmelt’
Yetelakew mesih yeteqebaw Geta
Yeemnetachn ras fets’ami new walta

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 2
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 3
Yante bicha endhon alamah newna
Besmh qaኸኸw yeandebeten qana
T’et’che rekche keqalu welela
Almechm ale hiywete lelela

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 4
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 5
Lemit’efa mebl altegam lesga
Kirstiyan negnna semayawi zega
Tayto lemit’efa legizeyawiw desta
Wanaye iyesusn alsheshgm lafta

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 6
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 7
Yemile yegn yelem kemotelgn gara
Dignalehuna endiyaw beersu sira
Yamenkut Iyesus difret honolgnal
Beneqefugn qut’r ts’egaw beztolgnal

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 8
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 1
የዘላለም መዳን ሕይወት የሚሰጥ
ከጥልቁ ሚነጥቅ ከሞት ሚያስመልጥ
የተላከው መሲህ የተቀባው ጌታ
የእምነታችን ራስ ፈጻሚ ነው ዋልታ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 2
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 3
ያንተ ብቻ እንድሆን አላማህ ነውና
በስምህ ቃኸኸው የአንደበቴን ቃና
ጠጥቼ ረክቼ ከቃሉ ወለላ
አልመችም አለ ሕይወቴ ለሌላ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 4
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 5
ለሚጠፋ መብል አልተጋም ለሥጋ
ክርስቲያን ነኝና ሰማያዊ ዜጋ
ታይቶ ለሚጠፋ ለጊዜያዊው ደስታ
ዋናዬ ኢየሱስን አልሸሽግም ላፍታ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 6
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 7
የሚለ የኝ የለም ከሞተልኝ ጋራ
ድኛለሁና እንዲያው በእርሱ ስራ
ያመንኩት ኢየሱስ ድፍረት ሆኖልኛል
በነቀፉኝ ቁጥር ፀጋው በዝቶልኛል

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 8
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት',
        lyrics_transliteration = 'CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 1
Yezelalem medan hiywet yemiset’
Ket’lqu minet’q kemot miyasmelt’
Yetelakew mesih yeteqebaw Geta
Yeemnetachn ras fets’ami new walta

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 2
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 3
Yante bicha endhon alamah newna
Besmh qaኸኸw yeandebeten qana
T’et’che rekche keqalu welela
Almechm ale hiywete lelela

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 4
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 5
Lemit’efa mebl altegam lesga
Kirstiyan negnna semayawi zega
Tayto lemit’efa legizeyawiw desta
Wanaye iyesusn alsheshgm lafta

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 6
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 7
Yemile yegn yelem kemotelgn gara
Dignalehuna endiyaw beersu sira
Yamenkut Iyesus difret honolgnal
Beneqefugn qut’r ts’egaw beztolgnal

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 8
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9c66aabd-9370-4356-9a96-9665bbd2a2cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 1
የዘላለም መዳን ሕይወት የሚሰጥ
ከጥልቁ ሚነጥቅ ከሞት ሚያስመልጥ
የተላከው መሲህ የተቀባው ጌታ
የእምነታችን ራስ ፈጻሚ ነው ዋልታ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 2
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 3
ያንተ ብቻ እንድሆን አላማህ ነውና
በስምህ ቃኸኸው የአንደበቴን ቃና
ጠጥቼ ረክቼ ከቃሉ ወለላ
አልመችም አለ ሕይወቴ ለሌላ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 4
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 5
ለሚጠፋ መብል አልተጋም ለሥጋ
ክርስቲያን ነኝና ሰማያዊ ዜጋ
ታይቶ ለሚጠፋ ለጊዜያዊው ደስታ
ዋናዬ ኢየሱስን አልሸሽግም ላፍታ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 6
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 7
የሚለ የኝ የለም ከሞተልኝ ጋራ
ድኛለሁና እንዲያው በእርሱ ስራ
ያመንኩት ኢየሱስ ድፍረት ሆኖልኛል
በነቀፉኝ ቁጥር ፀጋው በዝቶልኛል

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 8
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9c66aabd-9370-4356-9a96-9665bbd2a2cd'::uuid, 'limeskir-zemari-yeabkal-desalegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aniten-felige-metahu ("Aniten Felige Metahu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7359f540-9549-4e11-9eef-172c90e64557'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 1
በሥጋ እና በነፍስ በስምህ ከበሩ
በቤትህ ተተክለው ለምልመው ጸደቁ
በትሩፋት በእምነት ለመንግሥትህ በቁ
እኔም የአንተ ባርያ ሽቼ ቅድስና

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 2
በቤትኽ መጽደቅን እለምናለሁና
ዕንባ እና ጸሎቴን ቃሌን ተቀብለኽ
ከቤትኽ አታውጣኝ በበረከት ተክለኽ
ፍቅርህም ተገልጧል .ረቦ.. በቤቴ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 3
አንተን ስለ ያዘች ሠምራለች ሕይወቴ
እንደ ምትወደኝ ዛሬም አውቀዋለሁ
በረከት በእጄ ሞልቶ እያየሁ ነው
በቤትህ ውስጥ ካለው ታላቁን ድግስ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 4
ዕለት ዕለት በእምነት ኑሬ እንድቋደሥ
በሂሶጵም እርጨኝ እነጣማለሁ
እኔ እንደ በረዶ ሁኜ እቀርባለሁ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 1
Besga ena benefs besmh keberu
Bebeth teteklew lemlmew ts’edequ
Betrufat beemnet lemengsth bequ
Enem yeante barya shche qidsna

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 2
Bebetኽ mets’deqn elemnalehuna
Enba ena ts’eloten qalen teqebleኽ
Kebetኽ atawt’agn bebereket tekleኽ
Fiqrhm tegelt’wal .rebo.. bebete

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 3
Anten sile yazech semralech hiywete
Ende mitwedegn zarem awqewalehu
Bereket beeje molto eyayehu new
Bebeth wist’ kalew talaqun digs

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 4
Elet elet beemnet nure endqwades
Behisop’m erch’egn enet’amalehu
Ene ende beredo hugne eqerbalehu

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 1
በሥጋ እና በነፍስ በስምህ ከበሩ
በቤትህ ተተክለው ለምልመው ጸደቁ
በትሩፋት በእምነት ለመንግሥትህ በቁ
እኔም የአንተ ባርያ ሽቼ ቅድስና

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 2
በቤትኽ መጽደቅን እለምናለሁና
ዕንባ እና ጸሎቴን ቃሌን ተቀብለኽ
ከቤትኽ አታውጣኝ በበረከት ተክለኽ
ፍቅርህም ተገልጧል .ረቦ.. በቤቴ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 3
አንተን ስለ ያዘች ሠምራለች ሕይወቴ
እንደ ምትወደኝ ዛሬም አውቀዋለሁ
በረከት በእጄ ሞልቶ እያየሁ ነው
በቤትህ ውስጥ ካለው ታላቁን ድግስ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 4
ዕለት ዕለት በእምነት ኑሬ እንድቋደሥ
በሂሶጵም እርጨኝ እነጣማለሁ
እኔ እንደ በረዶ ሁኜ እቀርባለሁ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ',
        lyrics_transliteration = 'CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 1
Besga ena benefs besmh keberu
Bebeth teteklew lemlmew ts’edequ
Betrufat beemnet lemengsth bequ
Enem yeante barya shche qidsna

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 2
Bebetኽ mets’deqn elemnalehuna
Enba ena ts’eloten qalen teqebleኽ
Kebetኽ atawt’agn bebereket tekleኽ
Fiqrhm tegelt’wal .rebo.. bebete

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 3
Anten sile yazech semralech hiywete
Ende mitwedegn zarem awqewalehu
Bereket beeje molto eyayehu new
Bebeth wist’ kalew talaqun digs

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 4
Elet elet beemnet nure endqwades
Behisop’m erch’egn enet’amalehu
Ene ende beredo hugne eqerbalehu

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7359f540-9549-4e11-9eef-172c90e64557'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 1
በሥጋ እና በነፍስ በስምህ ከበሩ
በቤትህ ተተክለው ለምልመው ጸደቁ
በትሩፋት በእምነት ለመንግሥትህ በቁ
እኔም የአንተ ባርያ ሽቼ ቅድስና

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 2
በቤትኽ መጽደቅን እለምናለሁና
ዕንባ እና ጸሎቴን ቃሌን ተቀብለኽ
ከቤትኽ አታውጣኝ በበረከት ተክለኽ
ፍቅርህም ተገልጧል .ረቦ.. በቤቴ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 3
አንተን ስለ ያዘች ሠምራለች ሕይወቴ
እንደ ምትወደኝ ዛሬም አውቀዋለሁ
በረከት በእጄ ሞልቶ እያየሁ ነው
በቤትህ ውስጥ ካለው ታላቁን ድግስ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 4
ዕለት ዕለት በእምነት ኑሬ እንድቋደሥ
በሂሶጵም እርጨኝ እነጣማለሁ
እኔ እንደ በረዶ ሁኜ እቀርባለሁ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7359f540-9549-4e11-9eef-172c90e64557'::uuid, 'aniten-felige-metahu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- live ("Live")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '091749be-50b5-40e6-bbfd-3cbea4690ca9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን ምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው ዳንን የምንለው

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 2
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘን ዘንድ ከቶ አልቻለም
ሃይለኛውን በሃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የኛ ጌታ ከፍ በል በልልታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 4
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ሞቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰክር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ እጹብ ያንተ ስራ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 6
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
መስክሩለት የምስራች ነው ታላቅ ዜና
መላእክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሆናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወህኒ ቤቱ ከበሮውን ምቱ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 8
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 1
Gedayu mot bersu dil mensat tewat’ena
Senseleten qenberen tekaw bebegena
Mot hoy mewgiyah yetal eyaln minzemrew
Mesqelh t’or simh gashachn honoln new dann yemnlew

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 2
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 3
Teshagrenal silashagerken lezelalem
Bemeqabr mot yiyzen zend keto alchalem
Haylegnawn behayl asreኸw layfeta
Zemernlh ashenafi neh yegna Geta kef bel bellta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 4
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 5
Moto madan leman techlwal kante beqer
Getneth sirah yinoral simesekr
Wedaje hoy wibeth wib new yemiyabera
Tech’eneqe tenqet’eqet’e t’elat fera ets’ub yante sira

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 6
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 7
Meskrulet yemsrach new talaq zena
Melaektu nech’ lebsewal dil newna
Ketemawa andach honalech belelitu
Bezmare tenqet’eqet’e wehni betu keberown mitu

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 8
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን ምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው ዳንን የምንለው

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 2
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘን ዘንድ ከቶ አልቻለም
ሃይለኛውን በሃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የኛ ጌታ ከፍ በል በልልታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 4
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ሞቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰክር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ እጹብ ያንተ ስራ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 6
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
መስክሩለት የምስራች ነው ታላቅ ዜና
መላእክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሆናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወህኒ ቤቱ ከበሮውን ምቱ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 8
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ',
        lyrics_transliteration = 'CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 1
Gedayu mot bersu dil mensat tewat’ena
Senseleten qenberen tekaw bebegena
Mot hoy mewgiyah yetal eyaln minzemrew
Mesqelh t’or simh gashachn honoln new dann yemnlew

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 2
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 3
Teshagrenal silashagerken lezelalem
Bemeqabr mot yiyzen zend keto alchalem
Haylegnawn behayl asreኸw layfeta
Zemernlh ashenafi neh yegna Geta kef bel bellta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 4
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 5
Moto madan leman techlwal kante beqer
Getneth sirah yinoral simesekr
Wedaje hoy wibeth wib new yemiyabera
Tech’eneqe tenqet’eqet’e t’elat fera ets’ub yante sira

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 6
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 7
Meskrulet yemsrach new talaq zena
Melaektu nech’ lebsewal dil newna
Ketemawa andach honalech belelitu
Bezmare tenqet’eqet’e wehni betu keberown mitu

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 8
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '091749be-50b5-40e6-bbfd-3cbea4690ca9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን ምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው ዳንን የምንለው

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 2
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘን ዘንድ ከቶ አልቻለም
ሃይለኛውን በሃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የኛ ጌታ ከፍ በል በልልታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 4
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ሞቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰክር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ እጹብ ያንተ ስራ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 6
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
መስክሩለት የምስራች ነው ታላቅ ዜና
መላእክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሆናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወህኒ ቤቱ ከበሮውን ምቱ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 8
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '091749be-50b5-40e6-bbfd-3cbea4690ca9'::uuid, 'live', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- like-mezemiran-kinetibeb-welidekirikos-alem-atalay-nat-ethiopian-orthodo ("Like Mezemiran Kinetibeb Welidekirikos Alem Atalay Nat (Ethiopian Orthodox Mezmur)")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '740bce06-de76-4394-8863-21dfab49feff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪

VERSE 1
አለም ያንቺን መውደ ያንቺ ፍቅር፪
አይዘልቅምና ይቅር ይቅር አለም ያንቺ ፍቅር፪
መዝሙር በመሰንቆ መዝሙር በባገና፪
የነፍስ ምግብ ልዩቃና መዝሙር በበገና ፪

CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪

VERSE 2
ጾም ጸሎት ስግደት፬
የነፍስ የስጋ መድኅኒት ጾም ጸሎት ስግደት፪

CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2

VERSE 1
Alem yanchin mewde yanchi fiqr2
Ayzelqmna yiqr yiqr alem yanchi fiqr2
Mezmur bemesenqo mezmur bebagena2
Yenefs migb liyuqana mezmur bebegena 2

CHORUS
Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2

VERSE 2
Ts’om ts’elot sigdet4
Yenefs yesga medhnit ts’om ts’elot sigdet2

CHORUS
Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪

VERSE 1
አለም ያንቺን መውደ ያንቺ ፍቅር፪
አይዘልቅምና ይቅር ይቅር አለም ያንቺ ፍቅር፪
መዝሙር በመሰንቆ መዝሙር በባገና፪
የነፍስ ምግብ ልዩቃና መዝሙር በበገና ፪

CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪

VERSE 2
ጾም ጸሎት ስግደት፬
የነፍስ የስጋ መድኅኒት ጾም ጸሎት ስግደት፪

CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪',
        lyrics_transliteration = 'CHORUS
Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2

VERSE 1
Alem yanchin mewde yanchi fiqr2
Ayzelqmna yiqr yiqr alem yanchi fiqr2
Mezmur bemesenqo mezmur bebagena2
Yenefs migb liyuqana mezmur bebegena 2

CHORUS
Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2

VERSE 2
Ts’om ts’elot sigdet4
Yenefs yesga medhnit ts’om ts’elot sigdet2

CHORUS
Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '740bce06-de76-4394-8863-21dfab49feff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪

VERSE 1
አለም ያንቺን መውደ ያንቺ ፍቅር፪
አይዘልቅምና ይቅር ይቅር አለም ያንቺ ፍቅር፪
መዝሙር በመሰንቆ መዝሙር በባገና፪
የነፍስ ምግብ ልዩቃና መዝሙር በበገና ፪

CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪

VERSE 2
ጾም ጸሎት ስግደት፬
የነፍስ የስጋ መድኅኒት ጾም ጸሎት ስግደት፪

CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '740bce06-de76-4394-8863-21dfab49feff'::uuid, 'like-mezemiran-kinetibeb-welidekirikos-alem-atalay-nat-ethiopian-orthodo', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amanuel-amilak ("Amanuel Amilak")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7455b3bb-1f99-4c30-b2c9-3d80771fb944'::uuid
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
    WHERE import_id = '7455b3bb-1f99-4c30-b2c9-3d80771fb944'::uuid
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7455b3bb-1f99-4c30-b2c9-3d80771fb944'::uuid, 'amanuel-amilak', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enidet-enidalefikut-alawikim ("Enidet Enidalefikut Alawikim")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c09618fa-e379-4968-a618-d27462e06491'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 1
እንዴት ብዬ ጸንቶ ማቆም ያንተ ነው ስልጣኑ
አቅም የለው ጉልበት የለው ስጋ በዘመን
ደክሜ ማሁ ስወርድ አየሁት አምላኬ አብሮኝ ሲራመድ
ሲራመድ ሲራመድ ሲራመድ አብሮኝ ሲራመድ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 2
ሲራመድ ሲራመድ አብሮኝ ሲራመድ
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 3
አይተህልኝ መንገዴን
እንዴት ብዬ ቃል የለኝ ፍቅርን የሚለካ
ካየነው ከሰማነው ያለፈነው ለካ
የማለዳ ጸሃይ አይደለም ፍቃቴ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 4
አንተ ነህ ብርሃኔ አንተ ነህ ንጋቴ
አንተ ነህ አንተ ነህ አንተ ነህ ንጋቴ
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 5
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን
እንዴት ቃልም የለኝ አንድም ንግግር
ማለፊያ ማረፊያ ቅዱስ እግዚአብሄር

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 6
በሸክላ ካኖርከው የክብርን መስገብ
የማልጠቅመውን ሰው ካረከኝ ገንዘብ
ካረከኝ ካረከኝ ገንዘብ
ካረከኝ ካረከኝ ገንዘብ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 7
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 1
Endet biye ts’ento maqom yante new silt’anu
Aqm yelew gulbet yelew siga bezemen
Dekme mahu siwerd ayehut amlake abrogn siramed
Siramed siramed siramed abrogn siramed

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 2
Siramed siramed abrogn siramed
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 3
Aytehlgn mengeden
Endet biye qal yelegn fiqrn yemileka
Kayenew kesemanew yalefenew leka
Yemaleda ts’ehay aydelem fiqate

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 4
Ante neh birhane ante neh nigate
Ante neh ante neh ante neh nigate
Endet endanorkegn alawqm
Endet endalefkut yan qen

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 5
Ayne hone birhan hone
Aytehlgn mengeden
Endet qalm yelegn andm niggr
Malefiya marefiya Kidus egziabher

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 6
Beshekla kanorkew yekbrn mesgeb
Yemalt’eqmewn sew karekegn genzeb
Karekegn karekegn genzeb
Karekegn karekegn genzeb

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 7
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 1
እንዴት ብዬ ጸንቶ ማቆም ያንተ ነው ስልጣኑ
አቅም የለው ጉልበት የለው ስጋ በዘመን
ደክሜ ማሁ ስወርድ አየሁት አምላኬ አብሮኝ ሲራመድ
ሲራመድ ሲራመድ ሲራመድ አብሮኝ ሲራመድ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 2
ሲራመድ ሲራመድ አብሮኝ ሲራመድ
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 3
አይተህልኝ መንገዴን
እንዴት ብዬ ቃል የለኝ ፍቅርን የሚለካ
ካየነው ከሰማነው ያለፈነው ለካ
የማለዳ ጸሃይ አይደለም ፍቃቴ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 4
አንተ ነህ ብርሃኔ አንተ ነህ ንጋቴ
አንተ ነህ አንተ ነህ አንተ ነህ ንጋቴ
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 5
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን
እንዴት ቃልም የለኝ አንድም ንግግር
ማለፊያ ማረፊያ ቅዱስ እግዚአብሄር

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 6
በሸክላ ካኖርከው የክብርን መስገብ
የማልጠቅመውን ሰው ካረከኝ ገንዘብ
ካረከኝ ካረከኝ ገንዘብ
ካረከኝ ካረከኝ ገንዘብ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 7
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን',
        lyrics_transliteration = 'CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 1
Endet biye ts’ento maqom yante new silt’anu
Aqm yelew gulbet yelew siga bezemen
Dekme mahu siwerd ayehut amlake abrogn siramed
Siramed siramed siramed abrogn siramed

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 2
Siramed siramed abrogn siramed
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 3
Aytehlgn mengeden
Endet biye qal yelegn fiqrn yemileka
Kayenew kesemanew yalefenew leka
Yemaleda ts’ehay aydelem fiqate

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 4
Ante neh birhane ante neh nigate
Ante neh ante neh ante neh nigate
Endet endanorkegn alawqm
Endet endalefkut yan qen

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 5
Ayne hone birhan hone
Aytehlgn mengeden
Endet qalm yelegn andm niggr
Malefiya marefiya Kidus egziabher

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 6
Beshekla kanorkew yekbrn mesgeb
Yemalt’eqmewn sew karekegn genzeb
Karekegn karekegn genzeb
Karekegn karekegn genzeb

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 7
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

CHORUS
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c09618fa-e379-4968-a618-d27462e06491'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 1
እንዴት ብዬ ጸንቶ ማቆም ያንተ ነው ስልጣኑ
አቅም የለው ጉልበት የለው ስጋ በዘመን
ደክሜ ማሁ ስወርድ አየሁት አምላኬ አብሮኝ ሲራመድ
ሲራመድ ሲራመድ ሲራመድ አብሮኝ ሲራመድ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 2
ሲራመድ ሲራመድ አብሮኝ ሲራመድ
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 3
አይተህልኝ መንገዴን
እንዴት ብዬ ቃል የለኝ ፍቅርን የሚለካ
ካየነው ከሰማነው ያለፈነው ለካ
የማለዳ ጸሃይ አይደለም ፍቃቴ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 4
አንተ ነህ ብርሃኔ አንተ ነህ ንጋቴ
አንተ ነህ አንተ ነህ አንተ ነህ ንጋቴ
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 5
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን
እንዴት ቃልም የለኝ አንድም ንግግር
ማለፊያ ማረፊያ ቅዱስ እግዚአብሄር

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 6
በሸክላ ካኖርከው የክብርን መስገብ
የማልጠቅመውን ሰው ካረከኝ ገንዘብ
ካረከኝ ካረከኝ ገንዘብ
ካረከኝ ካረከኝ ገንዘብ

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 7
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

CHORUS
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c09618fa-e379-4968-a618-d27462e06491'::uuid, 'enidet-enidalefikut-alawikim', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yebegena-mezimur-di-n-abel-tesifaye-lanide-esikewediyagnawu-gitim-megabe ("Yebegena Mezimur Di/n Abel Tesifaye Lanide Esikewediyagnawu Gitim Megabe Hadis Dokiter Tewodiros Belete Zema")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c11a698d-7ca3-4d96-916c-235923a26563'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 1
ያን የቀኝ ወንበዴ
ብመስለው ላ’ንድቀን : ባየው መንገዴ
ለመስረቅ አይደለም ንብረት ለመቀማት
አልያም ለመዝረፍ ሕይወትን ለማጥፋት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 2
በዚያ መንገድማ
ከሱስ ብበልጥ እንጂ መች ከእርሱ አንስና
እኔን ታውቀኝ የለ …
የወንበዴ አለቃ ያ’ጢኣተኞች ዋና

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 3
ያ … ጸጸት ያዘለ
በዚያች የጭንቅ ሠዓት «አስበኝ» እያለ
ከመስቀልህ ጥላ ከሥር ስለዋለ
ካ’ዳም ቀድሞ ገባ ምሕረት ተቀበለ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 4
እኔም እንደ ጥጦስ : ማታዬ እንዲያምር
ብትለኝ ምን አለ? …
«ከገነት ተጠለል: ዛሬን ከእኔ እደር»
ላንዴ እስከወዲያኛው

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 5
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ : ዛሬን ከእኔ እደር»
ደ’ሞ ይህን ተመኘሁ
ለንጊኖስን በሆንኩ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 6
ያቺን ዕለተ ዓርብ : ቀራንዮ በዋልኩ
ለአመጽ አይደለም : ከከአይሁድ ለማበር
አልያም ለመውጋት : ያንተን ጎን በጦር
በዚያ መንገድማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 7
አንተን ለማሳመም: ማን እኔን መሰለ
ስንቴ እንዳቆሰልኩህ …
ስንቴ እንደወጋሁህ : እኔን ታወቀኝ የለ!
ያ …የጲላጦስ ጭፍራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 8
በመስቀል ላይ ሳለህ በሞት በመከራ
በጦሩ ቢወጋህ ሳያዝን ሳይራራ
ከቀኝ ጎን አፍስሰህ ውኃው ከደም ጋራ
በፍቅርህ ስታስረው ዐይኑን ስታበራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 9
ትዕግስትህን ጎትቶት ባንተ እንደ ተጠራ
ምናለ እንደው ’ኔንም …
ላንተ ብቻ እንዲያድር : ልቤን ብታበራ
ላንዴ እስከወዲያኛው

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 10
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ሰው ባ’ረገኝ ፣ ያቺንም
ምነው በመሰልኳት
የቺን አመንዝራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 11
እንደርሷ ላንድ ቀን : ከፊትህ ብጠራ
ለዝሙት አይደለም ነፍሴን ለማሳደፍ
አልያም ለመርከስ መቅደስክን ለማጉደፍ
በዚያ መንገድማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 12
ነውርን በመሸከም : መች ከእርሷ አንሳለሁ
ሕግህን በማፍረስ …
እኔን ታውቀኝ የለ : ምን እነግርሃለው
ያቺን … ድኩም ዘማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 13
በኃጢአቷ ቆስላ በበደሏ ታ’ማ
ዓለም ተሰብስቦ ሕይወቷን ሊቀማ
እንዲወግሯት ሳትፈርድ ቸርነትህ ቀድማ
መሬቱን ስትጭር ድምጽህ ሳይሰማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 14
ነውሯን እንደቀበርክ በከሳሽ ፊት ቆማ
ዳግም አትበድዪ : በፍቅር ሂጂ እንዳልካት
እንደው የኔንም ነፍስ …
ምናለ መልሰህ: እንዲያ በማረካት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 15
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ባ’ረገኝ ፣ ያቺንም ሴት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 1
Yan yeqegn wenbede
Bimeslew la’ndqen : bayew mengede
Lemesreq aydelem nibret lemeqemat
Alyam lemezref hiywetn lemat’fat

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 2
Beziya mengedma
Kesus bibelt’ enji mech keersu ansna
Enen tawqegn yele …
Yewenbede aleqa ya’t’iategnoch wana

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 3
Ya … ts’ets’et yazele
Beziyach yech’nq seat «asbegn» eyale
Kemesqelh t’la kesr silewale
Ka’dam qedmo geba mihret teqebele

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 4
Enem ende t’t’os : mataye endiyamr
Bitlegn min ale? …
«kegenet tet’elel: zaren keene eder»
Lande eskewediyagnaw

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 5
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku : zaren keene eder»
De’mo yihn temegnehu
Lenginosn behonku

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 6
Yachin elete arb : qeranyo bewalku
Leamets’ aydelem : kekeayhud lemaber
Alyam lemewgat : yanten gon bet’or
Beziya mengedma

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 7
Anten lemasamem: man enen mesele
Sinte endaqoselkuh …
Sinte endewegahuh : enen taweqegn yele!
Ya …yep’ilat’os ch’fra

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 8
Bemesqel lay saleh bemot bemekera
Bet’oru biwegah sayazn sayrara
Keqegn gon afsseh wihaw kedem gara
Befqrh sitasrew aynun sitabera

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 9
Tiegsthn gottot bante ende tet’era
Minale endew ’nenm …
Lante bicha endiyadr : liben bitabera
Lande eskewediyagnaw

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 10
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku sew ba’regegn , yachinm
Minew bemeselkwat
Yechin amenzra

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 11
Enderswa land qen : kefith bit’era
Lezmut aydelem nefsen lemasadef
Alyam lemerkes meqdeskn lemagudef
Beziya mengedma

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 12
Newrn bemeshekem : mech keerswa ansalehu
Highn bemafres …
Enen tawqegn yele : min enegrhalew
Yachin … dikum zema

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 13
Behat’iatwa qosla bebedelwa ta’ma
Alem tesebsbo hiywetwan liqema
Endiwegrwat satferd cherneth qedma
Meretun sitch’r dimts’h saysema

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 14
Newrwan endeqeberk bekesash fit qoma
Dagm atbedyi : befqr hiji endalkat
Endew yenenm nefs …
Minale melseh: endiya bemarekat

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 15
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku ba’regegn , yachinm set

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 1
ያን የቀኝ ወንበዴ
ብመስለው ላ’ንድቀን : ባየው መንገዴ
ለመስረቅ አይደለም ንብረት ለመቀማት
አልያም ለመዝረፍ ሕይወትን ለማጥፋት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 2
በዚያ መንገድማ
ከሱስ ብበልጥ እንጂ መች ከእርሱ አንስና
እኔን ታውቀኝ የለ …
የወንበዴ አለቃ ያ’ጢኣተኞች ዋና

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 3
ያ … ጸጸት ያዘለ
በዚያች የጭንቅ ሠዓት «አስበኝ» እያለ
ከመስቀልህ ጥላ ከሥር ስለዋለ
ካ’ዳም ቀድሞ ገባ ምሕረት ተቀበለ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 4
እኔም እንደ ጥጦስ : ማታዬ እንዲያምር
ብትለኝ ምን አለ? …
«ከገነት ተጠለል: ዛሬን ከእኔ እደር»
ላንዴ እስከወዲያኛው

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 5
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ : ዛሬን ከእኔ እደር»
ደ’ሞ ይህን ተመኘሁ
ለንጊኖስን በሆንኩ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 6
ያቺን ዕለተ ዓርብ : ቀራንዮ በዋልኩ
ለአመጽ አይደለም : ከከአይሁድ ለማበር
አልያም ለመውጋት : ያንተን ጎን በጦር
በዚያ መንገድማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 7
አንተን ለማሳመም: ማን እኔን መሰለ
ስንቴ እንዳቆሰልኩህ …
ስንቴ እንደወጋሁህ : እኔን ታወቀኝ የለ!
ያ …የጲላጦስ ጭፍራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 8
በመስቀል ላይ ሳለህ በሞት በመከራ
በጦሩ ቢወጋህ ሳያዝን ሳይራራ
ከቀኝ ጎን አፍስሰህ ውኃው ከደም ጋራ
በፍቅርህ ስታስረው ዐይኑን ስታበራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 9
ትዕግስትህን ጎትቶት ባንተ እንደ ተጠራ
ምናለ እንደው ’ኔንም …
ላንተ ብቻ እንዲያድር : ልቤን ብታበራ
ላንዴ እስከወዲያኛው

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 10
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ሰው ባ’ረገኝ ፣ ያቺንም
ምነው በመሰልኳት
የቺን አመንዝራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 11
እንደርሷ ላንድ ቀን : ከፊትህ ብጠራ
ለዝሙት አይደለም ነፍሴን ለማሳደፍ
አልያም ለመርከስ መቅደስክን ለማጉደፍ
በዚያ መንገድማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 12
ነውርን በመሸከም : መች ከእርሷ አንሳለሁ
ሕግህን በማፍረስ …
እኔን ታውቀኝ የለ : ምን እነግርሃለው
ያቺን … ድኩም ዘማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 13
በኃጢአቷ ቆስላ በበደሏ ታ’ማ
ዓለም ተሰብስቦ ሕይወቷን ሊቀማ
እንዲወግሯት ሳትፈርድ ቸርነትህ ቀድማ
መሬቱን ስትጭር ድምጽህ ሳይሰማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 14
ነውሯን እንደቀበርክ በከሳሽ ፊት ቆማ
ዳግም አትበድዪ : በፍቅር ሂጂ እንዳልካት
እንደው የኔንም ነፍስ …
ምናለ መልሰህ: እንዲያ በማረካት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 15
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ባ’ረገኝ ፣ ያቺንም ሴት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ',
        lyrics_transliteration = 'CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 1
Yan yeqegn wenbede
Bimeslew la’ndqen : bayew mengede
Lemesreq aydelem nibret lemeqemat
Alyam lemezref hiywetn lemat’fat

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 2
Beziya mengedma
Kesus bibelt’ enji mech keersu ansna
Enen tawqegn yele …
Yewenbede aleqa ya’t’iategnoch wana

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 3
Ya … ts’ets’et yazele
Beziyach yech’nq seat «asbegn» eyale
Kemesqelh t’la kesr silewale
Ka’dam qedmo geba mihret teqebele

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 4
Enem ende t’t’os : mataye endiyamr
Bitlegn min ale? …
«kegenet tet’elel: zaren keene eder»
Lande eskewediyagnaw

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 5
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku : zaren keene eder»
De’mo yihn temegnehu
Lenginosn behonku

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 6
Yachin elete arb : qeranyo bewalku
Leamets’ aydelem : kekeayhud lemaber
Alyam lemewgat : yanten gon bet’or
Beziya mengedma

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 7
Anten lemasamem: man enen mesele
Sinte endaqoselkuh …
Sinte endewegahuh : enen taweqegn yele!
Ya …yep’ilat’os ch’fra

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 8
Bemesqel lay saleh bemot bemekera
Bet’oru biwegah sayazn sayrara
Keqegn gon afsseh wihaw kedem gara
Befqrh sitasrew aynun sitabera

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 9
Tiegsthn gottot bante ende tet’era
Minale endew ’nenm …
Lante bicha endiyadr : liben bitabera
Lande eskewediyagnaw

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 10
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku sew ba’regegn , yachinm
Minew bemeselkwat
Yechin amenzra

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 11
Enderswa land qen : kefith bit’era
Lezmut aydelem nefsen lemasadef
Alyam lemerkes meqdeskn lemagudef
Beziya mengedma

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 12
Newrn bemeshekem : mech keerswa ansalehu
Highn bemafres …
Enen tawqegn yele : min enegrhalew
Yachin … dikum zema

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 13
Behat’iatwa qosla bebedelwa ta’ma
Alem tesebsbo hiywetwan liqema
Endiwegrwat satferd cherneth qedma
Meretun sitch’r dimts’h saysema

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 14
Newrwan endeqeberk bekesash fit qoma
Dagm atbedyi : befqr hiji endalkat
Endew yenenm nefs …
Minale melseh: endiya bemarekat

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 15
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku ba’regegn , yachinm set

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c11a698d-7ca3-4d96-916c-235923a26563'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 1
ያን የቀኝ ወንበዴ
ብመስለው ላ’ንድቀን : ባየው መንገዴ
ለመስረቅ አይደለም ንብረት ለመቀማት
አልያም ለመዝረፍ ሕይወትን ለማጥፋት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 2
በዚያ መንገድማ
ከሱስ ብበልጥ እንጂ መች ከእርሱ አንስና
እኔን ታውቀኝ የለ …
የወንበዴ አለቃ ያ’ጢኣተኞች ዋና

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 3
ያ … ጸጸት ያዘለ
በዚያች የጭንቅ ሠዓት «አስበኝ» እያለ
ከመስቀልህ ጥላ ከሥር ስለዋለ
ካ’ዳም ቀድሞ ገባ ምሕረት ተቀበለ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 4
እኔም እንደ ጥጦስ : ማታዬ እንዲያምር
ብትለኝ ምን አለ? …
«ከገነት ተጠለል: ዛሬን ከእኔ እደር»
ላንዴ እስከወዲያኛው

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 5
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ : ዛሬን ከእኔ እደር»
ደ’ሞ ይህን ተመኘሁ
ለንጊኖስን በሆንኩ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 6
ያቺን ዕለተ ዓርብ : ቀራንዮ በዋልኩ
ለአመጽ አይደለም : ከከአይሁድ ለማበር
አልያም ለመውጋት : ያንተን ጎን በጦር
በዚያ መንገድማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 7
አንተን ለማሳመም: ማን እኔን መሰለ
ስንቴ እንዳቆሰልኩህ …
ስንቴ እንደወጋሁህ : እኔን ታወቀኝ የለ!
ያ …የጲላጦስ ጭፍራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 8
በመስቀል ላይ ሳለህ በሞት በመከራ
በጦሩ ቢወጋህ ሳያዝን ሳይራራ
ከቀኝ ጎን አፍስሰህ ውኃው ከደም ጋራ
በፍቅርህ ስታስረው ዐይኑን ስታበራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 9
ትዕግስትህን ጎትቶት ባንተ እንደ ተጠራ
ምናለ እንደው ’ኔንም …
ላንተ ብቻ እንዲያድር : ልቤን ብታበራ
ላንዴ እስከወዲያኛው

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 10
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ሰው ባ’ረገኝ ፣ ያቺንም
ምነው በመሰልኳት
የቺን አመንዝራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 11
እንደርሷ ላንድ ቀን : ከፊትህ ብጠራ
ለዝሙት አይደለም ነፍሴን ለማሳደፍ
አልያም ለመርከስ መቅደስክን ለማጉደፍ
በዚያ መንገድማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 12
ነውርን በመሸከም : መች ከእርሷ አንሳለሁ
ሕግህን በማፍረስ …
እኔን ታውቀኝ የለ : ምን እነግርሃለው
ያቺን … ድኩም ዘማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 13
በኃጢአቷ ቆስላ በበደሏ ታ’ማ
ዓለም ተሰብስቦ ሕይወቷን ሊቀማ
እንዲወግሯት ሳትፈርድ ቸርነትህ ቀድማ
መሬቱን ስትጭር ድምጽህ ሳይሰማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 14
ነውሯን እንደቀበርክ በከሳሽ ፊት ቆማ
ዳግም አትበድዪ : በፍቅር ሂጂ እንዳልካት
እንደው የኔንም ነፍስ …
ምናለ መልሰህ: እንዲያ በማረካት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 15
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ባ’ረገኝ ፣ ያቺንም ሴት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c11a698d-7ca3-4d96-916c-235923a26563'::uuid, 'yebegena-mezimur-di-n-abel-tesifaye-lanide-esikewediyagnawu-gitim-megabe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- girum-dinik-neh ("Girum Dinik Neh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c2941c3d-cde3-4ad3-b4d7-3027d116340f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 1
.......
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kat’iyategnaw bet yigebal erat libela

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 2
Beqel ayawqm Getaye kefqr lela
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 3
Endamanuel manm yelem 2
.......
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 4
Kesamrawiw gar yiwlal ende guwadegna
Hulun befqr yemiyasb tamagn eregna
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 5
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......
Sew yenaqewn ansto shomo yakebral

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 6
Zeyt afso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew
Endamlakachn manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 7
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 8
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Degmo aynorm bebetu yeesr qenber
Ersun temamno yeqome kemeqdesu sir

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 9
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 10
Amen zimare melaektn yasemaln.

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ',
        lyrics_transliteration = 'CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 1
.......
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kat’iyategnaw bet yigebal erat libela

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 2
Beqel ayawqm Getaye kefqr lela
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 3
Endamanuel manm yelem 2
.......
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 4
Kesamrawiw gar yiwlal ende guwadegna
Hulun befqr yemiyasb tamagn eregna
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 5
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......
Sew yenaqewn ansto shomo yakebral

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 6
Zeyt afso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew
Endamlakachn manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 7
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 8
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Degmo aynorm bebetu yeesr qenber
Ersun temamno yeqome kemeqdesu sir

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 9
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 10
Amen zimare melaektn yasemaln.

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c2941c3d-cde3-4ad3-b4d7-3027d116340f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c2941c3d-cde3-4ad3-b4d7-3027d116340f'::uuid, 'girum-dinik-neh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeaelafat-zimare-besiyatil-yemitebikegn-ayitegnam ("Yeaelafat Zimare Besiyatil Yemitebikegn Ayitegnam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '75414d48-02c3-4be4-986c-ee8a92f08192'::uuid
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
    WHERE import_id = '75414d48-02c3-4be4-986c-ee8a92f08192'::uuid
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
        '75414d48-02c3-4be4-986c-ee8a92f08192'::uuid, 'yeaelafat-zimare-besiyatil-yemitebikegn-ayitegnam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
