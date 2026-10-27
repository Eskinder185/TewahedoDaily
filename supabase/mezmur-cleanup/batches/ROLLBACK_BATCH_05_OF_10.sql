-- =========================================================================
-- ROLLBACK BATCH 05 of 10: 100 Hymns (401 to 500)
-- Target: public.mezmur_data_import
-- =========================================================================

DO $rollback_batch_05$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn rollback: Girum Dinik Neh (girum-dinik-neh)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'girum-dinik-neh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 1
.......
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kat’iyategnaw bet yigebal erat libela

VERSE 2
Beqel ayawqm Getaye kefqr lela
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2

VERSE 3
Endamanuel manm yelem 2
.......
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju

VERSE 4
Kesamrawiw gar yiwlal ende guwadegna
Hulun befqr yemiyasb tamagn eregna
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2

VERSE 5
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......
Sew yenaqewn ansto shomo yakebral

VERSE 6
Zeyt afso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew
Endamlakachn manm yelem 2

VERSE 7
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......

VERSE 8
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Degmo aynorm bebetu yeesr qenber
Ersun temamno yeqome kemeqdesu sir

VERSE 9
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2

VERSE 10
Amen zimare melaektn yasemaln.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'girum-dinik-neh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Girum Dinik Neh Amilake *** Bemuhaze Sibihat (girum-dinik-neh-amilake-bemuhaze-sibihat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 1
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ከኃጢያተኛው ቤት ይገባል እራት ሊበላ
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 2
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንዳማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 3
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ
ከሳምራዊው ጋር ይውላል እንደ ጓደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 4
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 5
ሰው የናቀውን አንስቶ ሾሞ ያከብራል
ዘይት አፍስሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 6
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 7
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ዳግሞ አይኖርም በቤቱ የእስራት ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 8
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/',
      lyrics_transliteration = 'CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 1
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kehat’iyategnaw bet yigebal erat libela
Beqel ayawqm Getaye kefqr lela

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 2
Endamlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Endamanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 3
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju
Kesamrawiw gar yiwlal ende gwadegna
Hulun befqr yemiyasb tamagn eregna

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 4
Endamlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 5
Sew yenaqewn ansto shomo yakebral
Zeyt afsso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 6
Ende amlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 7
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Dagmo aynorm bebetu yeesrat qenber
Ersun temamno yeqome kemeqdesu sir

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 8
Ende amlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'girum-dinik-neh-amilake-bemuhaze-sibihat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 1
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ከኃጢያተኛው ቤት ይገባል እራት ሊበላ
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ

VERSE 2
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንዳማኑኤል #ማንም የለም /2/

VERSE 3
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ
ከሳምራዊው ጋር ይውላል እንደ ጓደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ

VERSE 4
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

VERSE 5
ሰው የናቀውን አንስቶ ሾሞ ያከብራል
ዘይት አፍስሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው

VERSE 6
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

VERSE 7
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ዳግሞ አይኖርም በቤቱ የእስራት ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

VERSE 8
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 1
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kehat’iyategnaw bet yigebal erat libela
Beqel ayawqm Getaye kefqr lela

VERSE 2
Endamlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Endamanuel #manm yelem (2)

VERSE 3
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju
Kesamrawiw gar yiwlal ende gwadegna
Hulun befqr yemiyasb tamagn eregna

VERSE 4
Endamlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

VERSE 5
Sew yenaqewn ansto shomo yakebral
Zeyt afsso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew

VERSE 6
Ende amlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

VERSE 7
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Dagmo aynorm bebetu yeesrat qenber
Ersun temamno yeqome kemeqdesu sir

VERSE 8
Ende amlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'girum-dinik-neh-amilake-bemuhaze-sibihat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Girum Dinik Neh Amilake Bemuhaze Sibihat Dagimawi Deribe (girum-dinik-neh-amilake-bemuhaze-sibihat-dagimawi-deribe)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'girum-dinik-neh-amilake-bemuhaze-sibihat-dagimawi-deribe'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 1
.......
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kat’iyategnaw bet yigebal erat libela

VERSE 2
Beqel ayawqm Getaye kefqr lela
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2

VERSE 3
Endamanuel manm yelem 2
.......
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju

VERSE 4
Kesamrawiw gar yiwlal ende guwadegna
Hulun befqr yemiyasb tamagn eregna
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2

VERSE 5
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......
Sew yenaqewn ansto shomo yakebral

VERSE 6
Zeyt afso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew
Endamlakachn manm yelem 2

VERSE 7
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......

VERSE 8
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Degmo aynorm bebetu yeesr qenber
Ersun temamno yeqome kemeqdesu sir

VERSE 9
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2

VERSE 10
Amen zimare melaektn yasemaln.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'girum-dinik-neh-amilake-bemuhaze-sibihat-dagimawi-deribe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: girum dink neh zemari diacon dawit tilahun (girum-dink-neh-zemari-diacon-dawit-tilahun)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'girum-dink-neh-zemari-diacon-dawit-tilahun'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 1
.......
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kat’iyategnaw bet yigebal erat libela

VERSE 2
Beqel ayawqm Getaye kefqr lela
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2

VERSE 3
Endamanuel manm yelem 2
.......
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju

VERSE 4
Kesamrawiw gar yiwlal ende guwadegna
Hulun befqr yemiyasb tamagn eregna
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2

VERSE 5
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......
Sew yenaqewn ansto shomo yakebral

VERSE 6
Zeyt afso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew
Endamlakachn manm yelem 2

VERSE 7
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......

VERSE 8
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Degmo aynorm bebetu yeesr qenber
Ersun temamno yeqome kemeqdesu sir

VERSE 9
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2

VERSE 10
Amen zimare melaektn yasemaln.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'girum-dink-neh-zemari-diacon-dawit-tilahun', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Girum Zimarewoch Bemin Des Lasegnih Yewededegn Geta Girum Dinik Neh Bemuhaze Sibihat (girum-zimarewoch-bemin-des-lasegnih-yewededegn-geta-girum-dinik-neh-bemu)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'girum-zimarewoch-bemin-des-lasegnih-yewededegn-geta-girum-dinik-neh-bemu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 1
.......
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kat’iyategnaw bet yigebal erat libela

VERSE 2
Beqel ayawqm Getaye kefqr lela
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2

VERSE 3
Endamanuel manm yelem 2
.......
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju

VERSE 4
Kesamrawiw gar yiwlal ende guwadegna
Hulun befqr yemiyasb tamagn eregna
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2

VERSE 5
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......
Sew yenaqewn ansto shomo yakebral

VERSE 6
Zeyt afso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew
Endamlakachn manm yelem 2

VERSE 7
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......

VERSE 8
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Degmo aynorm bebetu yeesr qenber
Ersun temamno yeqome kemeqdesu sir

VERSE 9
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2

VERSE 10
Amen zimare melaektn yasemaln.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'girum-zimarewoch-bemin-des-lasegnih-yewededegn-geta-girum-dinik-neh-bemu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Go forth testify (go-forth-testify)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሂዱ ንገሩ አውሩ ለዓለም ተነሥቷል በዚህ የለም መድኃኔዓለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሣኤው ጌታ

VERSE 1
ሂዱ ንገሩ አውሩ ለዓለም ተነሥቷል በዚህ የለም መድኃኔዓለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሣኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም ተነሥቷል በዚህ የለም መድኃኔዓለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሣኤው ጌታ',
      lyrics_transliteration = 'CHORUS
Hidu negeru awru le''alem tenes''twal bezih yelem medhanealem
Mot yemaychilaw yebereta hayal new yemayreta

VERSE 1
Mahtemun yefeta yetinsa''ew geta

CHORUS
Hidu negeru awru le''alem tenes''twal bezih yelem medhanealem
Mot yemaychilaw yebereta hayal new yemayreta',
      lyrics_english = 'CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 1
Oppressive death with His victory is defeated
Removed my chains and replaced with the harp of David
Saying O death where’s your sting we sing in unison
Your Holy Cross and name serve as our protection

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 2
We declare salvation

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 3
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 4
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 5
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 6
With Your guidance and eternal aid we have crossed through
Demise could not confine You to the burial tomb
The merciless with Your might they are now imprisoned
We praise You Lord for Your success is never halted

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 7
You shall be exalted

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 8
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 9
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 10
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 11
Aside from You who can die in order to redeem
Through witnesses Your virtuous works will always gleam
My beloved Your beauty is radiant and beams
Dismay and fear were instilled into our enemies

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 12
Marvelous are Your deeds

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 13
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 14
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 15
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 16
Proclaim this news for it is above all miracles
For this triumph dressed in white are His holy angels
The city shook and had awakened during the night
The hymnody made the prison tremble out of fright

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 17
Play the drums in delight

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 18
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 19
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 20
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

CHORUS
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'go-forth-testify'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሂዱ ንገሩ አውሩ ለዓለም ተነሥቷል በዚህ የለም መድኃኔዓለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሣኤው ጌታ

VERSE 1
ሂዱ ንገሩ አውሩ ለዓለም ተነሥቷል በዚህ የለም መድኃኔዓለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሣኤው ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hidu negeru awru le''alem tenes''twal bezih yelem medhanealem
Mot yemaychilaw yebereta hayal new yemayreta

VERSE 1
Mahtemun yefeta yetinsa''ew geta'
    AND lyrics_english IS NOT DISTINCT FROM 'Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 1
Oppressive death with His victory is defeated
Removed my chains and replaced with the harp of David
Saying O death where’s your sting we sing in unison
Your Holy Cross and name serve as our protection

VERSE 2
We declare salvation

VERSE 3
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 4
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 5
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 6
With Your guidance and eternal aid we have crossed through
Demise could not confine You to the burial tomb
The merciless with Your might they are now imprisoned
We praise You Lord for Your success is never halted

VERSE 7
You shall be exalted

VERSE 8
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 9
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 10
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 11
Aside from You who can die in order to redeem
Through witnesses Your virtuous works will always gleam
My beloved Your beauty is radiant and beams
Dismay and fear were instilled into our enemies

VERSE 12
Marvelous are Your deeds

VERSE 13
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 14
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 15
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 16
Proclaim this news for it is above all miracles
For this triumph dressed in white are His holy angels
The city shook and had awakened during the night
The hymnody made the prison tremble out of fright

VERSE 17
Play the drums in delight

VERSE 18
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 19
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord

VERSE 20
Go forth testify tell the whole world He’s risen can’t be conformed our Savior and Lord
The incapable death He destroyed with His might we are restored
Released us from the seal’s hold the resurrected Lord'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'go-forth-testify', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Goyitay_bejaha (goyitay-bejaha)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 1
መቅደስ ልበይ ፈሪሳ
ብባቢሎናውያን ሓጥያት ፍጹም ረኺሳ
ወኻሩ ፍትወት ዉሻጤኣ ይሕንብጣሉ
ሰይጣን ብልሳጥር ንኣቅሓኣ ይግልገለሉ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 2
ከምቲ ንኽዳንካ ንልበይ ተማቐልዎ
ገለ ክፍሉ በቲ ገለ ክፍሉ ኣብቲ
ንገለ ኸኣ በቲ ደርበይዎ
ብሰንኪ ምዕናወይ እሾኽ ተኾርባ በቍሉኒ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 3
ግርማ ሻኻ ነብሰይ ሰቲ ንጽህናይ ነቂጹኒ
ጸላእትኻ ጸላእቲ ስምካ ኣንጻረይ ይለዓሉ
ተኣኪቦም ከምዚ ይብሉ
ሓይሊ እቲ ልዑል ስለ ዝደኸመ፡ እዛ ከተማ ወዲቓያ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 4
መን ከይረድኣ ንዑ ንተኣከብ መመሊስና ንውቅዓያ
ታሪኻ ከይዝከር ዝረኣያ ከይድንግጸላ
እምኒ ኣብ ልዕሊ እምኒ ከቶ ከይንገድፈላ
ጎይታይ በጃኻ ንጸሎተይ ተመልከቶ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 5
ምስባርያኻ ኣብ ፍርዲ ኣይትእቶ
መቅደስ ልበይ ብቃልካ ሓድሶ
እሾኽ ሓልዮት ዓለም ካብ ዉሻጠ ልበይ በንቁሶ
መቅደስ ልበይ ብቃልካ ኣሐድስ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 6
እሾኽ ሓልዮት ዓለም ካብ ዉሽጢ ልበይ በንቁስ
ንንብረት ልበይ ባዕልኻ ማርኸለይ
ንኹሉ ስዒርካስ ልበይ ኣክበለይ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ',
      lyrics_transliteration = 'CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 1
Meqdes libey ferisa
Bibabilonawyan hat’yat fits’um reኺsa
Weኻru fitwet wushat’ea yihnbt’alu
Seyt’an bilsat’r niaqhaa yiglgelelu

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 2
Kemti niኽdanka nilbey temaቐlwo
Gele kiflu beti gele kiflu abti
Nigele ኸa beti derbeywo
Bisenki mienawey eshoኽ teኾrba beqwluni

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 3
Girma shaኻ nebsey seti nits’hnay neqits’uni
Ts’elaetኻ ts’elaeti simka ants’arey yilealu
Teakibom kemzi yiblu
Hayli eti liul sile zideኸme eza ketema wediቓya

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 4
Men keyreda niu niteakeb memelisna niwqaya
Tariኻ keyzker zireaya keydngts’ela
Emni ab lieli emni keto keyngedfela
Goytay bejaኻ nits’elotey temelketo

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 5
Misbaryaኻ ab firdi ayteto
Meqdes libey biqalka hadso
Eshoኽ halyot alem kab wushat’e libey benquso
Meqdes libey biqalka aheds

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 6
Eshoኽ halyot alem kab wusht’i libey benqus
Ninbret libey baelኻ marኸley
Niኹlu siirkas libey akbeley

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'goyitay-bejaha'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 1
መቅደስ ልበይ ፈሪሳ
ብባቢሎናውያን ሓጥያት ፍጹም ረኺሳ
ወኻሩ ፍትወት ዉሻጤኣ ይሕንብጣሉ
ሰይጣን ብልሳጥር ንኣቅሓኣ ይግልገለሉ

VERSE 2
ከምቲ ንኽዳንካ ንልበይ ተማቐልዎ
ገለ ክፍሉ በቲ ገለ ክፍሉ ኣብቲ
ንገለ ኸኣ በቲ ደርበይዎ
ብሰንኪ ምዕናወይ እሾኽ ተኾርባ በቍሉኒ

VERSE 3
ግርማ ሻኻ ነብሰይ ሰቲ ንጽህናይ ነቂጹኒ
ጸላእትኻ ጸላእቲ ስምካ ኣንጻረይ ይለዓሉ
ተኣኪቦም ከምዚ ይብሉ
ሓይሊ እቲ ልዑል ስለ ዝደኸመ፡ እዛ ከተማ ወዲቓያ

VERSE 4
መን ከይረድኣ ንዑ ንተኣከብ መመሊስና ንውቅዓያ
ታሪኻ ከይዝከር ዝረኣያ ከይድንግጸላ
እምኒ ኣብ ልዕሊ እምኒ ከቶ ከይንገድፈላ
ጎይታይ በጃኻ ንጸሎተይ ተመልከቶ

VERSE 5
ምስባርያኻ ኣብ ፍርዲ ኣይትእቶ
መቅደስ ልበይ ብቃልካ ሓድሶ
እሾኽ ሓልዮት ዓለም ካብ ዉሻጠ ልበይ በንቁሶ
መቅደስ ልበይ ብቃልካ ኣሐድስ

VERSE 6
እሾኽ ሓልዮት ዓለም ካብ ዉሽጢ ልበይ በንቁስ
ንንብረት ልበይ ባዕልኻ ማርኸለይ
ንኹሉ ስዒርካስ ልበይ ኣክበለይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 1
Meqdes libey ferisa
Bibabilonawyan hat’yat fits’um reኺsa
Weኻru fitwet wushat’ea yihnbt’alu
Seyt’an bilsat’r niaqhaa yiglgelelu

VERSE 2
Kemti niኽdanka nilbey temaቐlwo
Gele kiflu beti gele kiflu abti
Nigele ኸa beti derbeywo
Bisenki mienawey eshoኽ teኾrba beqwluni

VERSE 3
Girma shaኻ nebsey seti nits’hnay neqits’uni
Ts’elaetኻ ts’elaeti simka ants’arey yilealu
Teakibom kemzi yiblu
Hayli eti liul sile zideኸme eza ketema wediቓya

VERSE 4
Men keyreda niu niteakeb memelisna niwqaya
Tariኻ keyzker zireaya keydngts’ela
Emni ab lieli emni keto keyngedfela
Goytay bejaኻ nits’elotey temelketo

VERSE 5
Misbaryaኻ ab firdi ayteto
Meqdes libey biqalka hadso
Eshoኽ halyot alem kab wushat’e libey benquso
Meqdes libey biqalka aheds

VERSE 6
Eshoኽ halyot alem kab wusht’i libey benqus
Ninbret libey baelኻ marኸley
Niኹlu siirkas libey akbeley'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'goyitay-bejaha', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Grum Dinq Neh (grum-dinq-neh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ

VERSE 1
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ

VERSE 2
ከቤተሳይዳ ያነሳል በአልጋ ያለውን
መተመቅ ሽቶ ረዳት ወገን ያጣውን

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ

VERSE 3
ከሃጢያተኛ ጋር ይገባል እራት ሊበላ
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ

VERSE 4
እንደ አምላካችን ማንም የለም
እንደ እግዝአብሔር ማንም የለም
እንደ ፈጣሪ ማንም የለም
እንደ አማኑኤል ማንም የለም

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ',
      lyrics_transliteration = 'CHORUS
Grum dinq neh Amlaké grum dinq neh
Grum dinq neh getayé grum dinq neh

VERSE 1
Sew yet’alewn kemidir kef tadregaléh
Yet’eresawn Amlaké tastawsaléh

CHORUS
Grum dinq neh Amlaké grum dinq neh
Grum dinq neh getayé grum dinq neh

VERSE 2
KeBetesaida yanasal be’alga yalewn
Met’emeq shito redat wegen yat’awn

CHORUS
Grum dinq neh Amlaké grum dinq neh
Grum dinq neh getayé grum dinq neh

VERSE 3
Kehat’iyategna gar yigebal erat libela
Beqel ayawikim getayé kefiqir lela

CHORUS
Grum dinq neh Amlaké grum dinq neh
Grum dinq neh getayé grum dinq neh

VERSE 4
Ende Amlakachin manim yelem
Ende Egziabher manim yelem
Ende fet’ari manim yelem
Ende Amanuel manim yelem

CHORUS
Grum dinq neh Amlaké grum dinq neh
Grum dinq neh getayé grum dinq neh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'grum-dinq-neh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ

VERSE 1
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 2
ከቤተሳይዳ ያነሳል በአልጋ ያለውን
መተመቅ ሽቶ ረዳት ወገን ያጣውን

VERSE 3
ከሃጢያተኛ ጋር ይገባል እራት ሊበላ
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ

VERSE 4
እንደ አምላካችን ማንም የለም
እንደ እግዝአብሔር ማንም የለም
እንደ ፈጣሪ ማንም የለም
እንደ አማኑኤል ማንም የለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Grum dinq neh Amlaké grum dinq neh
Grum dinq neh getayé grum dinq neh

VERSE 1
Sew yet’alewn kemidir kef tadregaléh
Yet’eresawn Amlaké tastawsaléh

VERSE 2
KeBetesaida yanasal be’alga yalewn
Met’emeq shito redat wegen yat’awn

VERSE 3
Kehat’iyategna gar yigebal erat libela
Beqel ayawikim getayé kefiqir lela

VERSE 4
Ende Amlakachin manim yelem
Ende Egziabher manim yelem
Ende fet’ari manim yelem
Ende Amanuel manim yelem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'grum-dinq-neh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Gubaeyachin Mariyam (gubaeyachin-mariyam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ማርያም ፊደል ናት የሁሉ መማሪያ(2×)
ተጽፋለችና ሁሌም በንፅህና(2×)
የተነበበብሽ ስመ መድኃኔዓለም፥
የድኅነት አስኳላ የሥጋዌ ቀለም፥

VERSE 1
ልዑል መሠረተሽ ፥ ሠራሽ አብ የኔታ፥
ለልጁ ቃል ጽሕፈት አድርጎሽ ገበታ።
"ጉባኤያችን ማርያም በእርግጥም ነሽ ፊደል።
ስምሽን ባንጠራ በሆነ "ሀ" ገደል፥"

CHORUS
ማርያም ፊደል ናት የሁሉ መማሪያ(2×)
ተጽፋለችና ሁሌም በንፅህና(2×)
የተነበበብሽ ስመ መድኃኔዓለም፥
የድኅነት አስኳላ የሥጋዌ ቀለም፥

VERSE 2
ማርያም ሰሌዳ ፥ ናት የሙሴ ጽላት፥
የውጣ በሚባል ሥውር የእግዚአብሔር ጣት፥
ተጽፈው ''ሚታዩ በላዩዋ ትእዛዛት፥
በአንደበቷም "እርሱን ስሙት የምትል ናት።"

CHORUS
ማርያም ፊደል ናት የሁሉ መማሪያ(2×)
ተጽፋለችና ሁሌም በንፅህና(2×)
የተነበበብሽ ስመ መድኃኔዓለም፥
የድኅነት አስኳላ የሥጋዌ ቀለም፥

VERSE 3
"ጉባኤያችን ማርያም በእርግጥም ነሽ ፊደል።
ስምሽን ባንጠራ በሆነ "ሀ" ገደል፥"
እንደተናገረው ኢሳይያስ በትንቢት፥
ንባብ ምስጋናዋን የናቀ በትዕቢት

CHORUS
ማርያም ፊደል ናት የሁሉ መማሪያ(2×)
ተጽፋለችና ሁሌም በንፅህና(2×)
የተነበበብሽ ስመ መድኃኔዓለም፥
የድኅነት አስኳላ የሥጋዌ ቀለም፥

VERSE 4
ምንም ብትሰጠው እናት መጣፍ ሆና፥
ማንበብ አይቻለው የእርሷን ቅድስና።
"ጉባኤያችን ማርያም በእርግጥም ነሽ ፊደል።
ስምሽን ባንጠራ በሆነ "ሀ" ገደል፥"

CHORUS
ማርያም ፊደል ናት የሁሉ መማሪያ(2×)
ተጽፋለችና ሁሌም በንፅህና(2×)
የተነበበብሽ ስመ መድኃኔዓለም፥
የድኅነት አስኳላ የሥጋዌ ቀለም፥

VERSE 5
ፊደል ትመስያለሽ ወንጌል ትወልጃለሽ
ሃርገወይን ማርያም ተስፋችን አቺው ነሽ
የተማሪ ቀለብ በእንተ ስማ እኮ ነው።
በፊደላችን ነው ፊደል የቆጠርነው።

CHORUS
ማርያም ፊደል ናት የሁሉ መማሪያ(2×)
ተጽፋለችና ሁሌም በንፅህና(2×)
የተነበበብሽ ስመ መድኃኔዓለም፥
የድኅነት አስኳላ የሥጋዌ ቀለም፥

VERSE 6
"ጉባኤያችን ማርያም በእርግጥም ነሽ ፊደል።
ስምሽን ባንጠራ በሆነ "ሀ" ገደል፥"

CHORUS
ማርያም ፊደል ናት የሁሉ መማሪያ(2×)
ተጽፋለችና ሁሌም በንፅህና(2×)
የተነበበብሽ ስመ መድኃኔዓለም፥
የድኅነት አስኳላ የሥጋዌ ቀለም፥',
      lyrics_transliteration = 'CHORUS
Maryam fidel nat yehulu memariya(2×)
Tets’falechna hulem bents’hna(2×)
Yetenebebebsh sime medhanealem:
Yedhnet askwala yesgawe qelem:

VERSE 1
Liul meseretesh : serash Ab yeneta:
Lelju qal ts’hfet adrgosh gebeta.
"gubaeyachn Maryam beergt’m nesh fidel.
Simshn bant’era behone "he" gedel:"

CHORUS
Maryam fidel nat yehulu memariya(2×)
Tets’falechna hulem bents’hna(2×)
Yetenebebebsh sime medhanealem:
Yedhnet askwala yesgawe qelem:

VERSE 2
Maryam seleda : nat yemuse ts’lat:
Yewt’a bemibal siwr yeEgziabher t’at:
Tets’few ''mitayu belayuwa tiezazat:
Beandebetwam "ersun simut yemtl nat."

CHORUS
Maryam fidel nat yehulu memariya(2×)
Tets’falechna hulem bents’hna(2×)
Yetenebebebsh sime medhanealem:
Yedhnet askwala yesgawe qelem:

VERSE 3
"gubaeyachn Maryam beergt’m nesh fidel.
Simshn bant’era behone "he" gedel:"
Endetenagerew isayyas betnbit:
Nibab misganawan yenaqe betebit

CHORUS
Maryam fidel nat yehulu memariya(2×)
Tets’falechna hulem bents’hna(2×)
Yetenebebebsh sime medhanealem:
Yedhnet askwala yesgawe qelem:

VERSE 4
Minm bitset’ew enat met’af hona:
Manbeb aychalew yeerswan qidsna.
"gubaeyachn Maryam beergt’m nesh fidel.
Simshn bant’era behone "he" gedel:"

CHORUS
Maryam fidel nat yehulu memariya(2×)
Tets’falechna hulem bents’hna(2×)
Yetenebebebsh sime medhanealem:
Yedhnet askwala yesgawe qelem:

VERSE 5
Fidel timesyalesh wengel tiweljalesh
Hargeweyn Maryam tesfachn achiw nesh
Yetemari qeleb beente sima eko new.
Befidelachn new fidel yeqot’ernew.

CHORUS
Maryam fidel nat yehulu memariya(2×)
Tets’falechna hulem bents’hna(2×)
Yetenebebebsh sime medhanealem:
Yedhnet askwala yesgawe qelem:

VERSE 6
"gubaeyachn Maryam beergt’m nesh fidel.
Simshn bant’era behone "he" gedel:"

CHORUS
Maryam fidel nat yehulu memariya(2×)
Tets’falechna hulem bents’hna(2×)
Yetenebebebsh sime medhanealem:
Yedhnet askwala yesgawe qelem:',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gubaeyachin-mariyam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ማርያም ፊደል ናት የሁሉ መማሪያ(2×)
ተጽፋለችና ሁሌም በንፅህና(2×)
የተነበበብሽ ስመ መድኃኔዓለም፥
የድኅነት አስኳላ የሥጋዌ ቀለም፥

VERSE 1
ልዑል መሠረተሽ ፥ ሠራሽ አብ የኔታ፥
ለልጁ ቃል ጽሕፈት አድርጎሽ ገበታ።
"ጉባኤያችን ማርያም በእርግጥም ነሽ ፊደል።
ስምሽን ባንጠራ በሆነ "ሀ" ገደል፥"

VERSE 2
ማርያም ሰሌዳ ፥ ናት የሙሴ ጽላት፥
የውጣ በሚባል ሥውር የእግዚአብሔር ጣት፥
ተጽፈው ''ሚታዩ በላዩዋ ትእዛዛት፥
በአንደበቷም "እርሱን ስሙት የምትል ናት።"

VERSE 3
"ጉባኤያችን ማርያም በእርግጥም ነሽ ፊደል።
ስምሽን ባንጠራ በሆነ "ሀ" ገደል፥"
እንደተናገረው ኢሳይያስ በትንቢት፥
ንባብ ምስጋናዋን የናቀ በትዕቢት

VERSE 4
ምንም ብትሰጠው እናት መጣፍ ሆና፥
ማንበብ አይቻለው የእርሷን ቅድስና።
"ጉባኤያችን ማርያም በእርግጥም ነሽ ፊደል።
ስምሽን ባንጠራ በሆነ "ሀ" ገደል፥"

VERSE 5
ፊደል ትመስያለሽ ወንጌል ትወልጃለሽ
ሃርገወይን ማርያም ተስፋችን አቺው ነሽ
የተማሪ ቀለብ በእንተ ስማ እኮ ነው።
በፊደላችን ነው ፊደል የቆጠርነው።

VERSE 6
"ጉባኤያችን ማርያም በእርግጥም ነሽ ፊደል።
ስምሽን ባንጠራ በሆነ "ሀ" ገደል፥"'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Maryam fidel nat yehulu memariya(2×)
Tets’falechna hulem bents’hna(2×)
Yetenebebebsh sime medhanealem:
Yedhnet askwala yesgawe qelem:

VERSE 1
Liul meseretesh : serash Ab yeneta:
Lelju qal ts’hfet adrgosh gebeta.
"gubaeyachn Maryam beergt’m nesh fidel.
Simshn bant’era behone "he" gedel:"

VERSE 2
Maryam seleda : nat yemuse ts’lat:
Yewt’a bemibal siwr yeEgziabher t’at:
Tets’few ''mitayu belayuwa tiezazat:
Beandebetwam "ersun simut yemtl nat."

VERSE 3
"gubaeyachn Maryam beergt’m nesh fidel.
Simshn bant’era behone "he" gedel:"
Endetenagerew isayyas betnbit:
Nibab misganawan yenaqe betebit

VERSE 4
Minm bitset’ew enat met’af hona:
Manbeb aychalew yeerswan qidsna.
"gubaeyachn Maryam beergt’m nesh fidel.
Simshn bant’era behone "he" gedel:"

VERSE 5
Fidel timesyalesh wengel tiweljalesh
Hargeweyn Maryam tesfachn achiw nesh
Yetemari qeleb beente sima eko new.
Befidelachn new fidel yeqot’ernew.

VERSE 6
"gubaeyachn Maryam beergt’m nesh fidel.
Simshn bant’era behone "he" gedel:"'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'gubaeyachin-mariyam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hager Kidisit Itiyopiya (hager-kidisit-itiyopiya)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hager-kidisit-itiyopiya'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ

VERSE 1
ሃገር ቅድስት ኢትዮጵያ
እግዚአብሔር ዘአርያ /2/ እኸ
ቅድስት ሃገር ኢትዮጵያ
እግዚአብሔር የመረጣት /2/ እኸ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hager Kidist ityop’ya
Egziabher zearya (2) eኸ
Kidist hager ityop’ya
Egziabher yemeret’at (2) eኸ

VERSE 1
Hager Kidist ityop’ya
Egziabher zearya (2) eኸ
Kidist hager ityop’ya
Egziabher yemeret’at (2) eኸ'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hager-kidisit-itiyopiya', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Haile Bertate Kebre Moges (haile-bertate-kebre-moges)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 1
በአንድነት ሶስትነት በዙፋኑ ሞልቶ
የሚሳነው የለም ለስላሴ ከቶ
አዝ…
ከመንገድ ዳር ልቁም የወደቀ ላንሳ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 2
የተራበ ላብላ የታመመ አልርሳ
እንደ አብርሃም አርገኝ እንደ ደጉ አባት
ቤቴ እንዲሞላ በአንተ በረከት
አዝ…

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 3
ጠፈሩት በውሃ በጥበብ የሰራ
እኔስ ይገርመኛል የስላሴ ስራ
ኑና ተመልከቱ ተዓምራት ሲሰራ
ሰዎች እልል በሉ ወላድ ሆነች ሳራ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 4
አዝ…
አብ አንድያ ልጁን እስኪስጥ ወዶናል
ወልድ በተዋህዶ እኛንም መስሎናል
ኃይሉ ተገለጠ የመንፈስ ቅዱስ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 5
በቅዱሳን አድሮ ሲያድን ሲፈውስ
አዝ…

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ',
      lyrics_transliteration = 'CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 1
Beandnet sostnet bezufanu molto
Yemisanew yelem leSilassie keto
CHORUS
Kemenged dar liqum yewedeqe lansa

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 2
Yeterabe labla yetameme alrsa
Ende abrham argegn ende degu abat
Bete endimola beante bereket
CHORUS

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 3
T’eferut bewha bet’beb yesera
Enes yigermegnal yeslase sira
Nuna temelketu teamrat sisera
Sewoch ell belu welad honech sara

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 4
CHORUS
Ab andya lijun eskist’ wedonal
Weld betewahdo egnanm meslonal
Haylu tegelet’e yemenfes Kidus

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 5
Beqdusan adro siyadn sifews
CHORUS

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'haile-bertate-kebre-moges'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 1
በአንድነት ሶስትነት በዙፋኑ ሞልቶ
የሚሳነው የለም ለስላሴ ከቶ
አዝ…
ከመንገድ ዳር ልቁም የወደቀ ላንሳ

VERSE 2
የተራበ ላብላ የታመመ አልርሳ
እንደ አብርሃም አርገኝ እንደ ደጉ አባት
ቤቴ እንዲሞላ በአንተ በረከት
አዝ…

VERSE 3
ጠፈሩት በውሃ በጥበብ የሰራ
እኔስ ይገርመኛል የስላሴ ስራ
ኑና ተመልከቱ ተዓምራት ሲሰራ
ሰዎች እልል በሉ ወላድ ሆነች ሳራ

VERSE 4
አዝ…
አብ አንድያ ልጁን እስኪስጥ ወዶናል
ወልድ በተዋህዶ እኛንም መስሎናል
ኃይሉ ተገለጠ የመንፈስ ቅዱስ

VERSE 5
በቅዱሳን አድሮ ሲያድን ሲፈውስ
አዝ…'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 1
Beandnet sostnet bezufanu molto
Yemisanew yelem leSilassie keto
Kemenged dar liqum yewedeqe lansa

VERSE 2
Yeterabe labla yetameme alrsa
Ende abrham argegn ende degu abat
Bete endimola beante bereket

VERSE 3
T’eferut bewha bet’beb yesera
Enes yigermegnal yeslase sira
Nuna temelketu teamrat sisera
Sewoch ell belu welad honech sara

VERSE 4
Ab andya lijun eskist’ wedonal
Weld betewahdo egnanm meslonal
Haylu tegelet’e yemenfes Kidus

VERSE 5
Beqdusan adro siyadn sifews'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'haile-bertate-kebre-moges', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hailemichel Ethiopian Orthodox mezmure (hailemichel-ethiopian-orthodox-mezmure)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 1
የተፅናናንብሽ የድሆች ማረፊያ
ነፋስ ውቅያኖሱን ወጀቡን፣ መቅዘፊያ
ወርሰናል ስምሽን፣ ከወርቁ መዝገብ ላይ
ወለድሽልን ድንግል የህይወትን ፀሃይ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 2
ቀስተ ደመናዬ ሆነሽ ምልክቴ
አለሁ እስከ ዛሬ ባንቺው በእመቤቴ
ልጅሽን አምኜ ምን ይጎድልብኛል
ያስጨነቀኝ ሁሉ ይታዘዝልኛል

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 3
ተከቧል ተራራው በብሩህ ደመና
የአብ ልጅ ክርስቶስ ባንቺ ወርዷልና
ይባቤ ምስጋና አፋችን ይሞላ
መቅደስ አላየኝም ድንግል ካንቺ ሌላ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 4
የከሳሼኝ ጉልበት ፅናቱን ሰብረሻል
የአዳም ልጅ ከሲኦል ከሞት ወቶብሻል
ጣፈጣት ለነፍሴ የማህፀንሽ ፍሬ
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
Nefas wiqyanosun wejebun, meqzefiya
Wersenal simshn, kewerqu mezgeb lay
Weledshln Dingil yehywetn ts’ehay

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 2
Qeste demenaye honesh milkte
Alehu eske zare banchiw beemebete
Lijshn amgne min yigodlbgnal
Yasch’eneqegn hulu yitazezlgnal

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 3
Tekebwal teraraw bebruh demena
Yeab lij Kristos banchi werdwalna
Yibabe misgana afachn yimola
Meqdes alayegnm Dingil kanchi lela

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 4
Yekesashegn gulbet ts’natun sebreshal
Yeadam lij kesiol kemot wetobshal
T’afet’at lenefse yemahts’ensh fire
Sit’erash enoralehu beyared zimare

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hailemichel-ethiopian-orthodox-mezmure'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 1
የተፅናናንብሽ የድሆች ማረፊያ
ነፋስ ውቅያኖሱን ወጀቡን፣ መቅዘፊያ
ወርሰናል ስምሽን፣ ከወርቁ መዝገብ ላይ
ወለድሽልን ድንግል የህይወትን ፀሃይ

VERSE 2
ቀስተ ደመናዬ ሆነሽ ምልክቴ
አለሁ እስከ ዛሬ ባንቺው በእመቤቴ
ልጅሽን አምኜ ምን ይጎድልብኛል
ያስጨነቀኝ ሁሉ ይታዘዝልኛል

VERSE 3
ተከቧል ተራራው በብሩህ ደመና
የአብ ልጅ ክርስቶስ ባንቺ ወርዷልና
ይባቤ ምስጋና አፋችን ይሞላ
መቅደስ አላየኝም ድንግል ካንቺ ሌላ

VERSE 4
የከሳሼኝ ጉልበት ፅናቱን ሰብረሻል
የአዳም ልጅ ከሲኦል ከሞት ወቶብሻል
ጣፈጣት ለነፍሴ የማህፀንሽ ፍሬ
ስጠራሽ እኖራለሁ በያሬድ ዝማሬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 1
Yetets’nananbsh yedhoch marefiya
Nefas wiqyanosun wejebun, meqzefiya
Wersenal simshn, kewerqu mezgeb lay
Weledshln Dingil yehywetn ts’ehay

VERSE 2
Qeste demenaye honesh milkte
Alehu eske zare banchiw beemebete
Lijshn amgne min yigodlbgnal
Yasch’eneqegn hulu yitazezlgnal

VERSE 3
Tekebwal teraraw bebruh demena
Yeab lij Kristos banchi werdwalna
Yibabe misgana afachn yimola
Meqdes alayegnm Dingil kanchi lela

VERSE 4
Yekesashegn gulbet ts’natun sebreshal
Yeadam lij kesiol kemot wetobshal
T’afet’at lenefse yemahts’ensh fire
Sit’erash enoralehu beyared zimare'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hailemichel-ethiopian-orthodox-mezmure', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hale Hale Luya (hale-hale-luya)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hale-hale-luya'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሃሌ ሃሌ ሉያ (2x)
በሰማይ በምድር ምሕረት ሆኗልና (2x)
ሃሌ ሃሌ ሉያ አሜን ሃሌ ሉያ
መላእክት ዘመሩ አመሰገኑት

VERSE 1
እየተደነቁ በአምላክ ቸርነት (2x)
ስብሐት ለእግዚአብሔር በሰማያት አሉ
እረኞችም አብረው እርሱን አከበሩ (2x)
ሃሌ ሃሌ ሉያ

VERSE 2
ዓለምን ለመፍጠር ከተጠበበበት
ይበልጣል ከሁሉ እኛን ያዳነበት (2x)
ከዳግማዊት ሔዋን ከእመቤታችን
በረቂቅ ጥበቡ ተወልዶ አዳነን (2x)

VERSE 3
ሃሌ ሃሌ ሉያ
ሁላችሁም ሂዱ ከቤተልሔም
ታገኙታላችሁ በከብቶች ግርግም (2x)
ኢየሱስ ክርስቶስ ወኀቤ ሠላም

VERSE 4
ሞታችንን ወስዶ ሕይወቱን ሰጠን (2x)
ሃሌ ሃሌ ሉያ
ሁላችሁም ሂዱ ከቤተልሔም
ታገኙታላችሁ በከብቶች ግርግም (2x)

VERSE 5
ኢየሱስ ክርስቶስ ወኀቤ ሠላም
ሞታችንን ወስዶ ሕይወቱን ሰጠን (2x)
ሃሌ ሃሌ ሉያ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hale Halleluya (2x)
Besemay bemdr mihret honwalna (2x)
Hale Halleluya Amen Halleluya
Melaekt zemeru amesegenut

VERSE 1
Eyetedenequ beamlak chernet (2x)
Sibhet leEgziabher besemayat alu
Eregnochm abrew ersun akeberu (2x)
Hale Halleluya

VERSE 2
Alemn lemeft’er ketet’ebebebet
Yibelt’al kehulu egnan yadanebet (2x)
Kedagmawit hewan keemebetachn
Bereqiq t’bebu teweldo adanen (2x)

VERSE 3
Hale Halleluya
Hulachhum hidu kebetelhem
Tagegnutalachhu bekebtoch girgm (2x)
Iyesus Kristos wehebe selam

VERSE 4
Motachnn wesdo hiywetun set’en (2x)
Hale Halleluya
Hulachhum hidu kebetelhem
Tagegnutalachhu bekebtoch girgm (2x)

VERSE 5
Iyesus Kristos wehebe selam
Motachnn wesdo hiywetun set’en (2x)
Hale Halleluya'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hale-hale-luya', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hale Luya Hale Luya (hale-luya-nisebik)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሃሌ ሉያ ሃሌ ሉያ
ንሰብክ ወልደ እምዘራ ዳዊት
ወተወልደ በሥጋ ሰብእ /2 ጊዜ/

VERSE 1
ውስተ ማኅፀነ ድንግል
ውስተ ማኅፀነ ድንግል
ኀደረ ሥጋ ኮነ
ወተወልደ በሥጋ ሰብእ

CHORUS
ሃሌ ሉያ ሃሌ ሉያ
ንሰብክ ወልደ እምዘራ ዳዊት
ወተወልደ በሥጋ ሰብእ /2 ጊዜ/

VERSE 2
ሥጋ ሰብእ በሥጋ ሰብእ /2 ጊዜ/

CHORUS
ሃሌ ሉያ ሃሌ ሉያ
ንሰብክ ወልደ እምዘራ ዳዊት
ወተወልደ በሥጋ ሰብእ /2 ጊዜ/

VERSE 3
ሃሌ ሉያ ሃሌ ሉያ
ንሰብክ ወልደ እምዘራ ዳዊት
ወተወልደ በሥጋ ሰብእ /2 ጊዜ/

CHORUS
ሃሌ ሉያ ሃሌ ሉያ
ንሰብክ ወልደ እምዘራ ዳዊት
ወተወልደ በሥጋ ሰብእ /2 ጊዜ/',
      lyrics_transliteration = 'CHORUS
hale luya hale luya
nsebk welde mzera dawit
wetewelde besga seb /2 gize/

VERSE 1
wste mahtsene dngl
wste mahtsene dngl
hedere sga kone

CHORUS
hale luya hale luya
nsebk welde mzera dawit
wetewelde besga seb /2 gize/

VERSE 2
wetewelde besga seb
sga seb besga seb /2 gize/
hale luya hale luya

CHORUS
hale luya hale luya
nsebk welde mzera dawit
wetewelde besga seb /2 gize/

VERSE 3
nsebk welde mzera dawit
wetewelde besga seb /2 gize/

CHORUS
hale luya hale luya
nsebk welde mzera dawit
wetewelde besga seb /2 gize/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hale-luya-nisebik'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሃሌ ሉያ ሃሌ ሉያ
ንሰብክ ወልደ እምዘራ ዳዊት
ወተወልደ በሥጋ ሰብእ /2 ጊዜ/

VERSE 1
ውስተ ማኅፀነ ድንግል
ውስተ ማኅፀነ ድንግል
ኀደረ ሥጋ ኮነ
ወተወልደ በሥጋ ሰብእ

VERSE 2
ሥጋ ሰብእ በሥጋ ሰብእ /2 ጊዜ/

VERSE 3
ሃሌ ሉያ ሃሌ ሉያ
ንሰብክ ወልደ እምዘራ ዳዊት
ወተወልደ በሥጋ ሰብእ /2 ጊዜ/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'hale luya hale luya
nsebk welde mzera dawit
wetewelde besga seb /2 gize/

VERSE 1
wste mahtsene dngl
wste mahtsene dngl
hedere sga kone

VERSE 2
wetewelde besga seb
sga seb besga seb /2 gize/
hale luya hale luya

VERSE 3
nsebk welde mzera dawit
wetewelde besga seb /2 gize/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hale-luya-nisebik', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Haleluya Zemarit Fasika Mekonen (haleluya-zemarit-fasika-mekonen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 1
እምቅድመ ይፍጥር መላእክተ ለክብር ወለቅዳሴ
እምቅድመ ይፍጥሮ ለአዳም ለአምልኮ ወለውዳሴ
ፀሐይ ከዋክብትን ጨረቃን በቃሉ ቀድሞ ሳይፈጥር
አመስጋኝ ሳይሻ ቅድመ ዓለም ንጉሥ ምስጉን ነበር

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 2
ስሙን በመቀደስ እንዲኖሩ ክብሩንም እንዲያወርሳቸው
እንዲያመሰግኑ ሌትና ቀን መላእክቱን ፈጠራቸው
ዲያቢሎስ ከክፋት ከክህደቱ መመለስ እንዳይሻ አውቆ
አዳምን ተካበት በአምሳሉ ፈጥሮ በክብር አልቆ

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 3
ኪሩቤል ዙፋኑን ተሸክመው ሳያርፋ ያወድሳሉ
ሱራፌል ካህናት የሰማዩን መቅደስ ዘወትር ያጥናሉ
በሰጠኸን ጸጋ እናመስግን እኛም እንደየ አቅማችን
የምስጋና መስዋዕት እንሰዋ ለአንተ ለአምላካችን

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና',
      lyrics_transliteration = 'CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 1
Emqdme yift’r melaekte lekbr weleqdase
Emqdme yift’ro leadam leamlko welewdase
Ts’ehey kewakbtn ch’ereqan beqalu qedmo sayfet’r
Amesgagn saysha qidme alem nigus misgun neber

CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 2
Simun bemeqedes endinoru kibrunm endiyawersachew
Endiyamesegnu letna qen melaektun fet’erachew
Diyabilos kekfat kekhdetu memeles endaysha awqo
Adamn tekabet beamsalu fet’ro bekbr alqo

CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 3
Kirubel zufanun teshekmew sayarfa yawedsalu
Surafel kahnat yesemayun meqdes zewetr yat’nalu
Beset’eኸn ts’ega enamesgn egnam endeye aqmachn
Yemsgana meswaet ensewa leante leamlakachn

CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'haleluya-zemarit-fasika-mekonen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 1
እምቅድመ ይፍጥር መላእክተ ለክብር ወለቅዳሴ
እምቅድመ ይፍጥሮ ለአዳም ለአምልኮ ወለውዳሴ
ፀሐይ ከዋክብትን ጨረቃን በቃሉ ቀድሞ ሳይፈጥር
አመስጋኝ ሳይሻ ቅድመ ዓለም ንጉሥ ምስጉን ነበር

VERSE 2
ስሙን በመቀደስ እንዲኖሩ ክብሩንም እንዲያወርሳቸው
እንዲያመሰግኑ ሌትና ቀን መላእክቱን ፈጠራቸው
ዲያቢሎስ ከክፋት ከክህደቱ መመለስ እንዳይሻ አውቆ
አዳምን ተካበት በአምሳሉ ፈጥሮ በክብር አልቆ

VERSE 3
ኪሩቤል ዙፋኑን ተሸክመው ሳያርፋ ያወድሳሉ
ሱራፌል ካህናት የሰማዩን መቅደስ ዘወትር ያጥናሉ
በሰጠኸን ጸጋ እናመስግን እኛም እንደየ አቅማችን
የምስጋና መስዋዕት እንሰዋ ለአንተ ለአምላካችን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 1
Emqdme yift’r melaekte lekbr weleqdase
Emqdme yift’ro leadam leamlko welewdase
Ts’ehey kewakbtn ch’ereqan beqalu qedmo sayfet’r
Amesgagn saysha qidme alem nigus misgun neber

VERSE 2
Simun bemeqedes endinoru kibrunm endiyawersachew
Endiyamesegnu letna qen melaektun fet’erachew
Diyabilos kekfat kekhdetu memeles endaysha awqo
Adamn tekabet beamsalu fet’ro bekbr alqo

VERSE 3
Kirubel zufanun teshekmew sayarfa yawedsalu
Surafel kahnat yesemayun meqdes zewetr yat’nalu
Beset’eኸn ts’ega enamesgn egnam endeye aqmachn
Yemsgana meswaet ensewa leante leamlakachn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'haleluya-zemarit-fasika-mekonen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: hanos begena (hanos-begena)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 1
ወንዙን ተሻግሮ መጣና
በፍቅር አስያዘኝ በገና
በፍቅር አስያዘኝ ምስጋና
ለስሜ ነበር ምኖረው

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 2
ለካስ የኔ ስም ከላይ ነው
ለካስ የኔ ስም ከሱ ነው
ስሜ በከንቱ ሀሜት ቢጠፋም
ከሰማይ አለኝ ሌላ ስም

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 3
ከእርሱ ዘንድ አለኝ ሌላ ስም
የልጅነት ስም ከሰጠኝ
ከዚህ በላይ ስም ምን አለኝ (2)
ሳዖል ቢነሳ ሊገለኝ

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 4
በማምለጫ አለት ደበቀኝ
በማምለጫ አለት ጠበቀኝ
ጠላት ቢፎክር ከማዶ
ጭብጥ አይሞላም እንኳን ነዶ(2)

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 5
ስለበዛ እንጂ ትግስት
ኃይለኛ የለም በፊቱ
ጉልበታም የለም በፊቱ
ያገኘኝን አገኘሁት

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 6
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ
ወንዙን ተሻግሮ መጣና

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 7
በፍቅር አስያዘኝ በገና
በክብር አስያዘኝ በገና
አይኔ እያነባ በፍቅሩ
እዘምራለሁ ለክብሩ(2)

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 8
የእንባዬን ጋን ወዝውዞ
ያስለቅሰኛል አፍዝዞ(2)
እንዲህ ነው ፍቅሩ የጌታ
በፍቅር ማስለቀስ በደስታ(2)

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 9
ለካ ለዚህ ነው የጠራኝ
በገነት መንደር ሊያኖረኝ
በሰላም መንደር ሊያሰፍረኝ
ከማንባት በቀር በፍቅሩ

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 10
መግለጫም የለኝ ለክብሩ(2)
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 11
እኔ አልቀርበው ስል ስፈራ
ወንዙን ተሻግሮ መጣና
በፍቅር አስያዘኝ በገና
በፍቅር አስያዘኝ ምስጋና

CHORUS
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ',
      lyrics_transliteration = 'CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 1
Wenzun teshagro met’ana
Befqr asyazegn begena
Befqr asyazegn misgana
Lesme neber minorew

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 2
Lekas yene sim kelay new
Lekas yene sim kesu new
Sime bekentu hemet bit’efam
Kesemay alegn lela sim

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 3
Keersu zend alegn lela sim
Yeljnet sim keset’egn
Kezih belay sim min alegn (2)
Saol binesa ligelegn

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 4
Bemamlech’a alet debeqegn
Bemamlech’a alet t’ebeqegn
T’elat bifokr kemado
Ch’bt’ aymolam enkwan nedo (2)

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 5
Silebeza enji tigst
Haylegna yelem befitu
Gulbetam yelem befitu
Yagegnegnn agegnehut

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 6
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera
Wenzun teshagro met’ana

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 7
Befqr asyazegn begena
Bekbr asyazegn begena
Ayne eyaneba befqru
Ezemralehu lekbru (2)

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 8
Yeenbayen gan wezwzo
Yasleqsegnal afzzo (2)
Endih new fiqru yegeta
Befqr masleqes bedesta (2)

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 9
Leka lezih new yet’eragn
Begenet mender liyanoregn
Beselam mender liyasefregn
Kemanbat beqer befqru

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 10
Meglech’am yelegn lekbru (2)
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 11
Ene alqerbew sil sifera
Wenzun teshagro met’ana
Befqr asyazegn begena
Befqr asyazegn misgana

CHORUS
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hanos-begena'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ

VERSE 1
ወንዙን ተሻግሮ መጣና
በፍቅር አስያዘኝ በገና
በፍቅር አስያዘኝ ምስጋና
ለስሜ ነበር ምኖረው

VERSE 2
ለካስ የኔ ስም ከላይ ነው
ለካስ የኔ ስም ከሱ ነው
ስሜ በከንቱ ሀሜት ቢጠፋም
ከሰማይ አለኝ ሌላ ስም

VERSE 3
ከእርሱ ዘንድ አለኝ ሌላ ስም
የልጅነት ስም ከሰጠኝ
ከዚህ በላይ ስም ምን አለኝ (2)
ሳዖል ቢነሳ ሊገለኝ

VERSE 4
በማምለጫ አለት ደበቀኝ
በማምለጫ አለት ጠበቀኝ
ጠላት ቢፎክር ከማዶ
ጭብጥ አይሞላም እንኳን ነዶ(2)

VERSE 5
ስለበዛ እንጂ ትግስት
ኃይለኛ የለም በፊቱ
ጉልበታም የለም በፊቱ
ያገኘኝን አገኘሁት

VERSE 6
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ
እኔ አልቀርበው ስል ስፈራ
ወንዙን ተሻግሮ መጣና

VERSE 7
በፍቅር አስያዘኝ በገና
በክብር አስያዘኝ በገና
አይኔ እያነባ በፍቅሩ
እዘምራለሁ ለክብሩ(2)

VERSE 8
የእንባዬን ጋን ወዝውዞ
ያስለቅሰኛል አፍዝዞ(2)
እንዲህ ነው ፍቅሩ የጌታ
በፍቅር ማስለቀስ በደስታ(2)

VERSE 9
ለካ ለዚህ ነው የጠራኝ
በገነት መንደር ሊያኖረኝ
በሰላም መንደር ሊያሰፍረኝ
ከማንባት በቀር በፍቅሩ

VERSE 10
መግለጫም የለኝ ለክብሩ(2)
ያገኘኝን አገኘሁት
የጠራኝን ተከተልኩት
እርሱ ከማዶ ሲጣራ

VERSE 11
እኔ አልቀርበው ስል ስፈራ
ወንዙን ተሻግሮ መጣና
በፍቅር አስያዘኝ በገና
በፍቅር አስያዘኝ ምስጋና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera

VERSE 1
Wenzun teshagro met’ana
Befqr asyazegn begena
Befqr asyazegn misgana
Lesme neber minorew

VERSE 2
Lekas yene sim kelay new
Lekas yene sim kesu new
Sime bekentu hemet bit’efam
Kesemay alegn lela sim

VERSE 3
Keersu zend alegn lela sim
Yeljnet sim keset’egn
Kezih belay sim min alegn (2)
Saol binesa ligelegn

VERSE 4
Bemamlech’a alet debeqegn
Bemamlech’a alet t’ebeqegn
T’elat bifokr kemado
Ch’bt’ aymolam enkwan nedo (2)

VERSE 5
Silebeza enji tigst
Haylegna yelem befitu
Gulbetam yelem befitu
Yagegnegnn agegnehut

VERSE 6
Yet’eragnn teketelkut
Ersu kemado sit’ara
Ene alqerbew sil sifera
Wenzun teshagro met’ana

VERSE 7
Befqr asyazegn begena
Bekbr asyazegn begena
Ayne eyaneba befqru
Ezemralehu lekbru (2)

VERSE 8
Yeenbayen gan wezwzo
Yasleqsegnal afzzo (2)
Endih new fiqru yegeta
Befqr masleqes bedesta (2)

VERSE 9
Leka lezih new yet’eragn
Begenet mender liyanoregn
Beselam mender liyasefregn
Kemanbat beqer befqru

VERSE 10
Meglech’am yelegn lekbru (2)
Yagegnegnn agegnehut
Yet’eragnn teketelkut
Ersu kemado sit’ara

VERSE 11
Ene alqerbew sil sifera
Wenzun teshagro met’ana
Befqr asyazegn begena
Befqr asyazegn misgana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hanos-begena', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ḥawaryaw Menekuse (hawaryaw-menekuse-yemeretuh-selase)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 1
ዳሞት ትናገረው የአንተን ሐዋርያነት
የወንጌል ገበሬ የጣኦታት ጠላት
ጸሎተኛው ቅዱስ አባ ተክለሐይማኖት
ክንፍን የተሸለምክ እንደ ሰማይ መልአክ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 2
ብራናው ሲገለጽ ገድለ ተክለሐይማኖት
ከሰወ ልጅ ልቦና ያወጣል አጋንት
የቅዳሴው ዕጣን ሲወጣ ከዋሻው
ምድርን ይባርካል ጸሎቱ ምህላው (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 3
የኢትዮጵያን ምድር አርስከው በመስቀል
ጭንጫው ፈራረሰ ተዘራበት ወንጌል
ትላንት የዘራኽው ዛሬ ለእኛ ሆኗል
አምላከ ተክልዬ ብለን ተምረናል (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 4
ከሱራፌል ተርታ ቆመህ ስታጥን
ቅዱስ ቅዱስ ብለህ ስታመሰግን
ጸሎት ትሩፋትህ ትህትና ስግደትህ
ፆምህ ከፍ አድርጎ ሰማይ አደረሰህ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 5
ዛፉ ሲመነገል አምላክ የተባለው
መቶሎሚ ሲያፍር ትልቅ ሰው ነኝ ያለው
የተክልዬ ጸሎት ብዙ ነወ ምስጢሩ
ስድስት ክንፍ አወጣ ቢቆረጥ አንድ እግሩ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ',
      lyrics_transliteration = 'CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 1
Damot ṭenagerew Ye-anten ḥawaryanat
Ye-wengel gebere Ye-ṭaotat ṭelat
Tselotenghaw kidus Abba Tekle Haymanot
Kenfihin yetešhelemk enda semay mal’ak (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 2
Beranaw sigeleṣ gedle Tekle Haymanot
Kesew lej lebona yaweṭal agannt
Ye-qedasew eṭan siweṭa kewashaw
Medren yebarkal Tselotu mehlaw (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 3
YeEthiopyan medr arsekew bemeskel
Chincaw ferarese tezerabet wengel
Telant yezeraghew zare leegha honwal
Amlake Tekleye blen temrenal (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 4
Kesurafel terta komeh seṭaṭen
Kidus kidus bleh seṭamesgen
Tselot terufathe teḥetna segdathe
Tsomeh kef adergo semay adereseh (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 5
Zafu simeneggel amlak yeṭebalew
Metolomi siafr teleq sew neghe yalew
YeTekleye tselot bezu nw mestiru
Sedest kenf aweṭa biqoret andu egru (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hawaryaw-menekuse-yemeretuh-selase'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 1
ዳሞት ትናገረው የአንተን ሐዋርያነት
የወንጌል ገበሬ የጣኦታት ጠላት
ጸሎተኛው ቅዱስ አባ ተክለሐይማኖት
ክንፍን የተሸለምክ እንደ ሰማይ መልአክ (2)

VERSE 2
ብራናው ሲገለጽ ገድለ ተክለሐይማኖት
ከሰወ ልጅ ልቦና ያወጣል አጋንት
የቅዳሴው ዕጣን ሲወጣ ከዋሻው
ምድርን ይባርካል ጸሎቱ ምህላው (2)

VERSE 3
የኢትዮጵያን ምድር አርስከው በመስቀል
ጭንጫው ፈራረሰ ተዘራበት ወንጌል
ትላንት የዘራኽው ዛሬ ለእኛ ሆኗል
አምላከ ተክልዬ ብለን ተምረናል (2)

VERSE 4
ከሱራፌል ተርታ ቆመህ ስታጥን
ቅዱስ ቅዱስ ብለህ ስታመሰግን
ጸሎት ትሩፋትህ ትህትና ስግደትህ
ፆምህ ከፍ አድርጎ ሰማይ አደረሰህ (2)

VERSE 5
ዛፉ ሲመነገል አምላክ የተባለው
መቶሎሚ ሲያፍር ትልቅ ሰው ነኝ ያለው
የተክልዬ ጸሎት ብዙ ነወ ምስጢሩ
ስድስት ክንፍ አወጣ ቢቆረጥ አንድ እግሩ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 1
Damot ṭenagerew Ye-anten ḥawaryanat
Ye-wengel gebere Ye-ṭaotat ṭelat
Tselotenghaw kidus Abba Tekle Haymanot
Kenfihin yetešhelemk enda semay mal’ak (2)

VERSE 2
Beranaw sigeleṣ gedle Tekle Haymanot
Kesew lej lebona yaweṭal agannt
Ye-qedasew eṭan siweṭa kewashaw
Medren yebarkal Tselotu mehlaw (2)

VERSE 3
YeEthiopyan medr arsekew bemeskel
Chincaw ferarese tezerabet wengel
Telant yezeraghew zare leegha honwal
Amlake Tekleye blen temrenal (2)

VERSE 4
Kesurafel terta komeh seṭaṭen
Kidus kidus bleh seṭamesgen
Tselot terufathe teḥetna segdathe
Tsomeh kef adergo semay adereseh (2)

VERSE 5
Zafu simeneggel amlak yeṭebalew
Metolomi siafr teleq sew neghe yalew
YeTekleye tselot bezu nw mestiru
Sedest kenf aweṭa biqoret andu egru (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hawaryaw-menekuse-yemeretuh-selase', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hawaz tegegn mezmur (hawaz-tegegn-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 1
እርሱ ነው እየሱስ
እርሱ ነው ጌታዬ
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 2
እርሱ ነው እየሱስ
እርሱ ነው ጌታዬ
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 3
ቃል አውጥቶልኛል በህይወት ትኖራለህ
በሰላም ሂድ ብሎ እመን ትድናለህ
እንዳላድኖኝ አልሸክሜን አንከባለሁ
የዘመናት ህመሜ የከረመ ሸክሜ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 4
በጌታ ተሻረ ታሪክ ተቀየረ
ነገር ተቀየረ አሁንማ ባለዜማ ነኝ ባለእልልታ
መዝሙር ቅኔ ስራዬ ሆኗል ደኘ በጌታ
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 5
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ
እርሱ ነው እየሱስ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 6
እርሱ ነው ጌታዬ
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ
እርሱ ነው እየሱስ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 7
እርሱ ነው ጌታዬ
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ
በስሜ ጠርቶኛል አቤት ብዬ ነው ጣእም

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 8
መግነዜ ይፈታ ሞተሀል ያለው ማነው
አዋጅ ይቅየራል አመነ በጌታ
የሌለውን ነገር እንዳለ ሚፀራ
ታሪክ ሚገለብጥ እፁብ የእርሱ ስራ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 9
እፁብ እፁብ እፁብ የእርሱ ስራ
እፁብ እፁብ እፁብ የእርሱ ስራ
እፁብ እፁብ እፁብ የእርሱ ስራ
እፁብ እፁብ እፁብ የእርሱ ስራ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 10
ቀሚሱን ብዳስስ ሀይለ ከእርሱ ወጣ
ቀጠለ መርገሜ እየሱስ ያድናል
ፈውስ በጌታ አለኝ እኔ
ልቤን አክሞታል ምስክር ነኝ እኔ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 11
አይኖቼን አብርቷል አይቻለው እኔ
ልቤን ፈውሶታል ምስክር ነኝ እኔ
ልቤን አክሞታል ምስክር ነኝ እኔ
አይኖቼን አብርቷል አይቻለው እኔ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 12
ልቤን ፈውሶታል ምስክር ነኝ እኔ
ልቤን አክሞታል ምስክር ነኝ እኔ
አይኖቼን አብርቷል አይቻለው እኔ
ልቤን ፈውሶታል ምስክር ነኝ እኔ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 13
ልቤን አክሞታል ምስክር ነኝ እኔ
አይኖቼን አብርቷል አይቻለው እኔ
ልቤን ፈውሶታል ምስክር ነኝ እኔ
ልቤን አክሞታል ምስክር ነኝ እኔ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 14
አይኖቼን አብርቷል አይቻለው እኔ
ልቤን ፈውሶታል ምስክር ነኝ እኔ
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 15
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ
እርሱ ነው እየሱስ
እርሱ ነው ጌታዬ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 16
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ
እርሱ ነው እየሱስ
እርሱ ነው ጌታዬ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 17
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ

CHORUS
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ',
      lyrics_transliteration = 'CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 1
Ersu new eyesus
Ersu new Getaye
Ersu new Kristos
Ersu new bezaye

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 2
Ersu new eyesus
Ersu new Getaye
Ersu new Kristos
Ersu new bezaye

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 3
Qal awt’tolgnal behywet tinoraleh
Beselam hid bilo emen tidnaleh
Endaladnogn alshekmen ankebalehu
Yezemenat himeme yekereme shekme

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 4
Begeta teshare tarik teqeyere
Neger teqeyere ahunma balezema negn baleellta
Mezmur qine siraye honwal degne begeta
Beselam hid yalegn awajn qeyro

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 5
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn
Ersu new eyesus

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 6
Ersu new Getaye
Ersu new Kristos
Ersu new bezaye
Ersu new eyesus

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 7
Ersu new Getaye
Ersu new Kristos
Ersu new bezaye
Besme t’ertognal abet biye new t’aem

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 8
Megneze yifeta motehel yalew manew
Awaj yiqyeral amene begeta
Yelelewn neger endale mits’era
Tarik migelebt’ ets’ub yeersu sira

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 9
Ets’ub ets’ub ets’ub yeersu sira
Ets’ub ets’ub ets’ub yeersu sira
Ets’ub ets’ub ets’ub yeersu sira
Ets’ub ets’ub ets’ub yeersu sira

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 10
Qemisun bidass heyle keersu wet’a
Qet’ele mergeme eyesus yadnal
Fews begeta alegn ene
Liben akmotal miskr negn ene

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 11
Aynochen abrtwal aychalew ene
Liben fewsotal miskr negn ene
Liben akmotal miskr negn ene
Aynochen abrtwal aychalew ene

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 12
Liben fewsotal miskr negn ene
Liben akmotal miskr negn ene
Aynochen abrtwal aychalew ene
Liben fewsotal miskr negn ene

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 13
Liben akmotal miskr negn ene
Aynochen abrtwal aychalew ene
Liben fewsotal miskr negn ene
Liben akmotal miskr negn ene

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 14
Aynochen abrtwal aychalew ene
Liben fewsotal miskr negn ene
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 15
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn
Ersu new eyesus
Ersu new Getaye

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 16
Ersu new Kristos
Ersu new bezaye
Ersu new eyesus
Ersu new Getaye

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 17
Ersu new Kristos
Ersu new bezaye

CHORUS
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hawaz-tegegn-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ

VERSE 1
እርሱ ነው እየሱስ
እርሱ ነው ጌታዬ
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ

VERSE 2
እርሱ ነው እየሱስ
እርሱ ነው ጌታዬ
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ

VERSE 3
ቃል አውጥቶልኛል በህይወት ትኖራለህ
በሰላም ሂድ ብሎ እመን ትድናለህ
እንዳላድኖኝ አልሸክሜን አንከባለሁ
የዘመናት ህመሜ የከረመ ሸክሜ

VERSE 4
በጌታ ተሻረ ታሪክ ተቀየረ
ነገር ተቀየረ አሁንማ ባለዜማ ነኝ ባለእልልታ
መዝሙር ቅኔ ስራዬ ሆኗል ደኘ በጌታ
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ

VERSE 5
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ
እርሱ ነው እየሱስ

VERSE 6
እርሱ ነው ጌታዬ
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ
እርሱ ነው እየሱስ

VERSE 7
እርሱ ነው ጌታዬ
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ
በስሜ ጠርቶኛል አቤት ብዬ ነው ጣእም

VERSE 8
መግነዜ ይፈታ ሞተሀል ያለው ማነው
አዋጅ ይቅየራል አመነ በጌታ
የሌለውን ነገር እንዳለ ሚፀራ
ታሪክ ሚገለብጥ እፁብ የእርሱ ስራ

VERSE 9
እፁብ እፁብ እፁብ የእርሱ ስራ
እፁብ እፁብ እፁብ የእርሱ ስራ
እፁብ እፁብ እፁብ የእርሱ ስራ
እፁብ እፁብ እፁብ የእርሱ ስራ

VERSE 10
ቀሚሱን ብዳስስ ሀይለ ከእርሱ ወጣ
ቀጠለ መርገሜ እየሱስ ያድናል
ፈውስ በጌታ አለኝ እኔ
ልቤን አክሞታል ምስክር ነኝ እኔ

VERSE 11
አይኖቼን አብርቷል አይቻለው እኔ
ልቤን ፈውሶታል ምስክር ነኝ እኔ
ልቤን አክሞታል ምስክር ነኝ እኔ
አይኖቼን አብርቷል አይቻለው እኔ

VERSE 12
ልቤን ፈውሶታል ምስክር ነኝ እኔ
ልቤን አክሞታል ምስክር ነኝ እኔ
አይኖቼን አብርቷል አይቻለው እኔ
ልቤን ፈውሶታል ምስክር ነኝ እኔ

VERSE 13
ልቤን አክሞታል ምስክር ነኝ እኔ
አይኖቼን አብርቷል አይቻለው እኔ
ልቤን ፈውሶታል ምስክር ነኝ እኔ
ልቤን አክሞታል ምስክር ነኝ እኔ

VERSE 14
አይኖቼን አብርቷል አይቻለው እኔ
ልቤን ፈውሶታል ምስክር ነኝ እኔ
በሰላም ሂድ ያለኝ አዋጅን ቀይሮ
ደነሃል ኑር ያለኝ ቀንበሬን ሰባብሮ

VERSE 15
ነፃነት የሰጠኝ አረንነት ያወጣ
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ
እርሱ ነው እየሱስ
እርሱ ነው ጌታዬ

VERSE 16
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ
እርሱ ነው እየሱስ
እርሱ ነው ጌታዬ

VERSE 17
እርሱ ነው ክርስቶስ
እርሱ ነው ቤዛዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn

VERSE 1
Ersu new eyesus
Ersu new Getaye
Ersu new Kristos
Ersu new bezaye

VERSE 2
Ersu new eyesus
Ersu new Getaye
Ersu new Kristos
Ersu new bezaye

VERSE 3
Qal awt’tolgnal behywet tinoraleh
Beselam hid bilo emen tidnaleh
Endaladnogn alshekmen ankebalehu
Yezemenat himeme yekereme shekme

VERSE 4
Begeta teshare tarik teqeyere
Neger teqeyere ahunma balezema negn baleellta
Mezmur qine siraye honwal degne begeta
Beselam hid yalegn awajn qeyro

VERSE 5
Denehal nur yalegn qenberen sebabro
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn
Ersu new eyesus

VERSE 6
Ersu new Getaye
Ersu new Kristos
Ersu new bezaye
Ersu new eyesus

VERSE 7
Ersu new Getaye
Ersu new Kristos
Ersu new bezaye
Besme t’ertognal abet biye new t’aem

VERSE 8
Megneze yifeta motehel yalew manew
Awaj yiqyeral amene begeta
Yelelewn neger endale mits’era
Tarik migelebt’ ets’ub yeersu sira

VERSE 9
Ets’ub ets’ub ets’ub yeersu sira
Ets’ub ets’ub ets’ub yeersu sira
Ets’ub ets’ub ets’ub yeersu sira
Ets’ub ets’ub ets’ub yeersu sira

VERSE 10
Qemisun bidass heyle keersu wet’a
Qet’ele mergeme eyesus yadnal
Fews begeta alegn ene
Liben akmotal miskr negn ene

VERSE 11
Aynochen abrtwal aychalew ene
Liben fewsotal miskr negn ene
Liben akmotal miskr negn ene
Aynochen abrtwal aychalew ene

VERSE 12
Liben fewsotal miskr negn ene
Liben akmotal miskr negn ene
Aynochen abrtwal aychalew ene
Liben fewsotal miskr negn ene

VERSE 13
Liben akmotal miskr negn ene
Aynochen abrtwal aychalew ene
Liben fewsotal miskr negn ene
Liben akmotal miskr negn ene

VERSE 14
Aynochen abrtwal aychalew ene
Liben fewsotal miskr negn ene
Beselam hid yalegn awajn qeyro
Denehal nur yalegn qenberen sebabro

VERSE 15
Nets’anet yeset’egn arennet yawet’a
Moten yesharelgn hiywete yawejelegn
Ersu new eyesus
Ersu new Getaye

VERSE 16
Ersu new Kristos
Ersu new bezaye
Ersu new eyesus
Ersu new Getaye

VERSE 17
Ersu new Kristos
Ersu new bezaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hawaz-tegegn-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hayal Man Enidanite (hayal-man-enidanite)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hayal-man-enidanite'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኃያል ማን እንዳንተ ሰዳዴ ሳጥናኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
የመላእክት አለቃ ሚካኤል ሲጠራ
ይረግፋል ይበናል ሰይጣን እየፈራ

VERSE 1
ሞገሱ ለሙሴ ተስፋው ለእስራኤል
የእግዚአብሔር ባለሟል መልአኩ ሚካኤል
ከአምላክ ዘንድ ተልኮ ወደኛ የሚመጣው
መቅሰፍትን ሚያጠፋው ሚካኤል እርሱ ነው

VERSE 2
ሁሌም የሚላከው ምድሪቷን የሚከባት
የሚያድን ሚታደግ ሕዝቡንም ከጥፋት
የሚታደግ ሚያድን ሕዝቡንም ከጥፋት
ሚካኤል ያድናል ብለን ስንመሰክር

VERSE 3
በአይናችን አይተን ነው የእሳቱን ባሕር
ፍቅሩ ስላለብን ሁሌም በልባችን
እንመሰክራልን ሥራውን በአንደበታችን
እንመሰክራልን ሥራውን በዝማሬያችን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hayal man endante sedade sat’nael
YeEgziabher balemwal melaku Mikael
Yemelaekt aleqa Mikael sit’era
Yiregfal yibenal seyt’an eyefera

VERSE 1
Mogesu lemuse tesfaw leesrael
YeEgziabher balemwal melaku Mikael
Keamlak zend telko wedegna yemimet’aw
Meqseftn miyat’efaw Mikael ersu new

VERSE 2
Hulem yemilakew midritwan yemikebat
Yemiyadn mitadeg hizbunm ket’fat
Yemitadeg miyadn hizbunm ket’fat
Mikael yadnal bilen sinmesekr

VERSE 3
Beaynachn ayten new yeesatun bahr
Fiqru silalebn hulem belbachn
Enmesekraln sirawn beandebetachn
Enmesekraln sirawn bezmareyachn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hayal-man-enidanite', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hayalineh Neh Anite Hayal Degu Meliak Gebiriel (hayalineh-neh-anite-hayal-degu-meliak-gebiriel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 1
ሊያመልኩት ወደዱ ገብርኤል
አዲስ አዋጅ ወጥቶ ገብርኤል
ሲድራቅና ሚሳቅ አብድናጎብ ጸኑ
ጣዖቱን ረግጠው በእግዚአብሔር አመኑ

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 2
ተቆጣ ንጉሱ ገብርኤል
በሦስቱ ህጻናት ገብርኤል
ጨምሯቸው አለ ገብርኤል
ወደ እቶኑ እሳት ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 3
ከሰማይ ተልኮ ደረሰ መልአኩ
ከሞት አዳናቸው በእሳት ሳይነኩ
ከዕቶኑ ስር ሆነው ገብርኤል
ዝማሬ ተሞሉ ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 4
ገፍተው የጣሏቸው ገብርኤል
በእሳቱ ሲበሉ ገብርኤል
አልተቃጠለችም የራሳቸው ፀጉር
አዩ መኳንንቱ የእግዚአብሔርን ክብር

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 5
ናቡከደነጾር ገብርኤል
እጁን በአፉ ጫነ ገብርኤል
ሠለስቱ ደቂቅን ገብርኤል
ከእሳት ስላዳነ ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 6
ይክበር ጌታ አለ የላከ መላኩን
ሊያመልከው ወደደ ስላየ ማዳኑን

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል',
      lyrics_transliteration = 'CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 1
Liyamelkut wededu Gebriel
Adis awaj wet’to Gebriel
Sidraqna misaq abdnagob ts’enu
T’aotun regt’ew beEgziabher amenu

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 2
Teqot’a nigusu Gebriel
Besostu hits’anat Gebriel
Ch’emrwachew ale Gebriel
Wede etonu esat Gebriel

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 3
Kesemay telko derese melaku
Kemot adanachew beesat sayneku
Keetonu sir honew Gebriel
Zimare temolu Gebriel

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 4
Geftew yet’alwachew Gebriel
Beesatu sibelu Gebriel
Alteqat’elechm yerasachew ts’egur
Ayu mekwanntu yeegziabhern kibir

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 5
Nabukedenets’or Gebriel
Ejun beafu ch’ane Gebriel
Selestu deqiqn Gebriel
Keesat siladane Gebriel

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 6
Yikber Geta ale yelake melakun
Liyamelkew wedede silaye madanun

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hayalineh-neh-anite-hayal-degu-meliak-gebiriel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 1
ሊያመልኩት ወደዱ ገብርኤል
አዲስ አዋጅ ወጥቶ ገብርኤል
ሲድራቅና ሚሳቅ አብድናጎብ ጸኑ
ጣዖቱን ረግጠው በእግዚአብሔር አመኑ

VERSE 2
ተቆጣ ንጉሱ ገብርኤል
በሦስቱ ህጻናት ገብርኤል
ጨምሯቸው አለ ገብርኤል
ወደ እቶኑ እሳት ገብርኤል

VERSE 3
ከሰማይ ተልኮ ደረሰ መልአኩ
ከሞት አዳናቸው በእሳት ሳይነኩ
ከዕቶኑ ስር ሆነው ገብርኤል
ዝማሬ ተሞሉ ገብርኤል

VERSE 4
ገፍተው የጣሏቸው ገብርኤል
በእሳቱ ሲበሉ ገብርኤል
አልተቃጠለችም የራሳቸው ፀጉር
አዩ መኳንንቱ የእግዚአብሔርን ክብር

VERSE 5
ናቡከደነጾር ገብርኤል
እጁን በአፉ ጫነ ገብርኤል
ሠለስቱ ደቂቅን ገብርኤል
ከእሳት ስላዳነ ገብርኤል

VERSE 6
ይክበር ጌታ አለ የላከ መላኩን
ሊያመልከው ወደደ ስላየ ማዳኑን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 1
Liyamelkut wededu Gebriel
Adis awaj wet’to Gebriel
Sidraqna misaq abdnagob ts’enu
T’aotun regt’ew beEgziabher amenu

VERSE 2
Teqot’a nigusu Gebriel
Besostu hits’anat Gebriel
Ch’emrwachew ale Gebriel
Wede etonu esat Gebriel

VERSE 3
Kesemay telko derese melaku
Kemot adanachew beesat sayneku
Keetonu sir honew Gebriel
Zimare temolu Gebriel

VERSE 4
Geftew yet’alwachew Gebriel
Beesatu sibelu Gebriel
Alteqat’elechm yerasachew ts’egur
Ayu mekwanntu yeegziabhern kibir

VERSE 5
Nabukedenets’or Gebriel
Ejun beafu ch’ane Gebriel
Selestu deqiqn Gebriel
Keesat siladane Gebriel

VERSE 6
Yikber Geta ale yelake melakun
Liyamelkew wedede silaye madanun'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hayalineh-neh-anite-hayal-degu-meliak-gebiriel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hayilen Gulibeten Tadisaleh (hayilen-gulibeten-tadisaleh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 1
ክንድህ ይዘርጋ ከሞት ልዳን
ባንተ ልሻገር ክፉን ዘመን
ከሚያስጨንቁኝ አድነኝ
ካለአንተ በቀር ማን አለኝ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 2
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 3
ላገለገልህ ፈቅጄ አለሁ
እጄን ከፊትህ አንስቼ አለሁ
አጥንቴም ይቁም ባንተ ጸንቶ
መንፈስህ ይቃኘኝ ከላይ መቶ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 4
በጎና መልካም ካንተ ነው
ከአለም ይሔንን አላገኘው
ክብሬ ነህ አንተ መድኃኒቴ
በቃልህ ዳነች ሰውነቴ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 5
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ',
      lyrics_transliteration = 'CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 1
Kindh yizerga kemot lidan
Bante lishager kifun zemen
Kemiyasch’enqugn adnegn
Kaleante beqer man alegn

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 2
Beru yikefet ya yesergu
Geta asqemet’egn kemaeregu
Edfen t’alew kefith
Kezih belay new mihreth

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 3
Lagelegelh feqje alehu
Ejen kefith ansche alehu
At’ntem yiqum bante ts’ento
Menfesh yiqagnegn kelay meto

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 4
Begona melkam kante new
Kealem yihenn alagegnew
Kibre neh ante medhanite
Beqalh danech sewnete

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 5
Beru yikefet ya yesergu
Geta asqemet’egn kemaeregu
Edfen t’alew kefith
Kezih belay new mihreth

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hayilen-gulibeten-tadisaleh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 1
ክንድህ ይዘርጋ ከሞት ልዳን
ባንተ ልሻገር ክፉን ዘመን
ከሚያስጨንቁኝ አድነኝ
ካለአንተ በቀር ማን አለኝ

VERSE 2
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ

VERSE 3
ላገለገልህ ፈቅጄ አለሁ
እጄን ከፊትህ አንስቼ አለሁ
አጥንቴም ይቁም ባንተ ጸንቶ
መንፈስህ ይቃኘኝ ከላይ መቶ

VERSE 4
በጎና መልካም ካንተ ነው
ከአለም ይሔንን አላገኘው
ክብሬ ነህ አንተ መድኃኒቴ
በቃልህ ዳነች ሰውነቴ

VERSE 5
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 1
Kindh yizerga kemot lidan
Bante lishager kifun zemen
Kemiyasch’enqugn adnegn
Kaleante beqer man alegn

VERSE 2
Beru yikefet ya yesergu
Geta asqemet’egn kemaeregu
Edfen t’alew kefith
Kezih belay new mihreth

VERSE 3
Lagelegelh feqje alehu
Ejen kefith ansche alehu
At’ntem yiqum bante ts’ento
Menfesh yiqagnegn kelay meto

VERSE 4
Begona melkam kante new
Kealem yihenn alagegnew
Kibre neh ante medhanite
Beqalh danech sewnete

VERSE 5
Beru yikefet ya yesergu
Geta asqemet’egn kemaeregu
Edfen t’alew kefith
Kezih belay new mihreth'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hayilen-gulibeten-tadisaleh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hayilih Sigelet (hayilih-sigelet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 1
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 2
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 3
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 4
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 5
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 6
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 7
አዝማች 🏾

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን',
      lyrics_transliteration = 'CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 1
Abet qende meleket sinefa
Awaj sitawej beyfa
Ts’adqan sit’eru letedla
Min yihon yeegna tesfa

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 2
Abet melaekt semayun siyarsut
Qedmew sisemu mebarqt
Yaltayena yaltesema
Dimts’ sisema kerama

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 3
Abet sebatu nefas tekeftew
Midrn siyawkwat qezfew
Sitazez yebahr moged
Midritwan likednat lefrd

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 4
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyaqerbu leamlak sibhet

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 5
Abet hat’an gin lefrd sit’eru
Bech’elema alem liqeru
Yemayt’eqm wayta hono
Mewared yihonal bakno

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 6
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyasemu leamlak sibhet

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 7
CHORUS

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hayilih-sigelet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 1
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ

VERSE 2
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ

VERSE 3
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ

VERSE 4
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት

VERSE 5
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ

VERSE 6
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት

VERSE 7
አዝማች 🏾'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 1
Abet qende meleket sinefa
Awaj sitawej beyfa
Ts’adqan sit’eru letedla
Min yihon yeegna tesfa

VERSE 2
Abet melaekt semayun siyarsut
Qedmew sisemu mebarqt
Yaltayena yaltesema
Dimts’ sisema kerama

VERSE 3
Abet sebatu nefas tekeftew
Midrn siyawkwat qezfew
Sitazez yebahr moged
Midritwan likednat lefrd

VERSE 4
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyaqerbu leamlak sibhet

VERSE 5
Abet hat’an gin lefrd sit’eru
Bech’elema alem liqeru
Yemayt’eqm wayta hono
Mewared yihonal bakno

VERSE 6
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyasemu leamlak sibhet

VERSE 7'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hayilih-sigelet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hayle Birtate Kibre Mogese (hayle-birtate)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)

VERSE 1
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ
በአንድነት ሶስትነት በዙፋኑ ሞልቶ
የሚሳነው የለም ለስላሴ ከቶ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)

VERSE 2
ከመንገድ ዳር ልቁም የወደቀ ላንሳ
የተራበ ላብላ የታመመ አልርሳ
እንደ አብርሃም አርገኝ እንደ ደጉ አባት
ቤቴ እንዲሞላ በአንተ በረከት

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)

VERSE 3
ጠፈሩን በውሃ በጥበብ የሰራ
እኔስ ይገርመኛል የስላሴ ስራ
ኑና ተመልከቱ ተዓምራት ሲሰራ
ሰዎች እልል በሉ ወላድ ሆነች ሳራ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)

VERSE 4
አብ አንድያ ልጁን እስኪሰጥ ወዶናል
ወልድ በተዋህዶ እኛንም መስሎናል
ኃይሉ ተገለጠ የመንፈስ ቅዱስ
በቅዱሳን አድሮ ሲያድን ሲፈውስ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)',
      lyrics_transliteration = 'CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabirahamu selase (2)

VERSE 1
Temeretech nefse anten lemawedes
Kelay kearyam keselase mekdes
Beandinet sostinet bezufanu molto
Yemisanewe yelem leselase ketto

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabirahamu selase (2)

VERSE 2
Kemenged dar liqum yewedeke lansa
Yeterabe labla yetameme alersa
Ende Abiraham argegn ende degu abat
Bete endimola beante bereket

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabirahamu selase (2)

VERSE 3
Teferun bewha betibeb yesera
Enes yigermenyal yeselase sera
Nuna temelketu teamrat sisera
Sewoch ellil belu welad honetch Sara

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabirahamu selase (2)

VERSE 4
Ab andiya lijun eskiset wedonal
Weld betewahido egnam meslonal
Haylu tegelete yemenfes kidus
Bekidusan adro siyadn sifewes

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabirahamu selase (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hayle-birtate'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)

VERSE 1
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ
በአንድነት ሶስትነት በዙፋኑ ሞልቶ
የሚሳነው የለም ለስላሴ ከቶ

VERSE 2
ከመንገድ ዳር ልቁም የወደቀ ላንሳ
የተራበ ላብላ የታመመ አልርሳ
እንደ አብርሃም አርገኝ እንደ ደጉ አባት
ቤቴ እንዲሞላ በአንተ በረከት

VERSE 3
ጠፈሩን በውሃ በጥበብ የሰራ
እኔስ ይገርመኛል የስላሴ ስራ
ኑና ተመልከቱ ተዓምራት ሲሰራ
ሰዎች እልል በሉ ወላድ ሆነች ሳራ

VERSE 4
አብ አንድያ ልጁን እስኪሰጥ ወዶናል
ወልድ በተዋህዶ እኛንም መስሎናል
ኃይሉ ተገለጠ የመንፈስ ቅዱስ
በቅዱሳን አድሮ ሲያድን ሲፈውስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hayle birtate kibre mogese (2)
Yezelealemu yeabirahamu selase (2)

VERSE 1
Temeretech nefse anten lemawedes
Kelay kearyam keselase mekdes
Beandinet sostinet bezufanu molto
Yemisanewe yelem leselase ketto

VERSE 2
Kemenged dar liqum yewedeke lansa
Yeterabe labla yetameme alersa
Ende Abiraham argegn ende degu abat
Bete endimola beante bereket

VERSE 3
Teferun bewha betibeb yesera
Enes yigermenyal yeselase sera
Nuna temelketu teamrat sisera
Sewoch ellil belu welad honetch Sara

VERSE 4
Ab andiya lijun eskiset wedonal
Weld betewahido egnam meslonal
Haylu tegelete yemenfes kidus
Bekidusan adro siyadn sifewes'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hayle-birtate', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Haylihi Sigelet Besemay (haylihi-sigelet-besemay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 1
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 2
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 3
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 4
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 5
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 6
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን',
      lyrics_transliteration = 'CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 1
Abet qende meleket sinefa
Awaj sitawej beyfa
Ts’adqan sit’eru letedla
Min yihon yeegna tesfa

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 2
Abet melaekt semayun siyarsut
Qedmew sisemu mebarqt
Yaltayena yaltesema
Dimts’ sisema kerama

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 3
Abet sebatu nefas tekeftew
Midrn siyawkwat qezfew
Sitazez yebahr moged
Midritwan likednat lefrd

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 4
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyaqerbu leamlak sibhet

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 5
Abet hat’an gin lefrd sit’eru
Bech’elema alem liqeru
Yemayt’eqm wayta hono
Mewared yihonal bakno

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 6
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyasemu leamlak sibhet

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'haylihi-sigelet-besemay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 1
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ

VERSE 2
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ

VERSE 3
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ

VERSE 4
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት

VERSE 5
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ

VERSE 6
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 1
Abet qende meleket sinefa
Awaj sitawej beyfa
Ts’adqan sit’eru letedla
Min yihon yeegna tesfa

VERSE 2
Abet melaekt semayun siyarsut
Qedmew sisemu mebarqt
Yaltayena yaltesema
Dimts’ sisema kerama

VERSE 3
Abet sebatu nefas tekeftew
Midrn siyawkwat qezfew
Sitazez yebahr moged
Midritwan likednat lefrd

VERSE 4
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyaqerbu leamlak sibhet

VERSE 5
Abet hat’an gin lefrd sit’eru
Bech’elema alem liqeru
Yemayt’eqm wayta hono
Mewared yihonal bakno

VERSE 6
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyasemu leamlak sibhet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'haylihi-sigelet-besemay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: He is praised (he-is-praised)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Misgun new yetemesegene
Baryawun enen yikir yale
Yimesgen yimesgenilign
Gojoyen Amlak molalign',
      lyrics_english = 'CHORUS
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

VERSE 1
Misgun new yetemesegene
Baryawun enen yikir yale
Yimesgen yimesgenilign
Gojoyen Amlak molalign

CHORUS
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

VERSE 2
I know my Lord He gives for all generously
My void has been filled now receive my melody
For what I lacked you granted me its true
All will align for good by your virtue

CHORUS
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

VERSE 3
My sorrow He banished so that my joy perceives
The emptiness has passed you fulfilled all my needs
To give and take He has authority
To knock and ask is all He needs of me

CHORUS
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

VERSE 4
I may be pushed and heaved but I won’t feel distress
You are my foundation my home is your fortress
When you grant me tangibles to my eyes
Do not withhold from me your paradise

CHORUS
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

VERSE 5
He gives from His vast wealth the sovereign gracious Lord
For every need we have His blessings have been poured
When we''re deprived through Him we are restored
Praise to our God in our hearts He’s adored

CHORUS
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

VERSE 6
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

CHORUS
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

VERSE 7
Misgun new yetemesegene
Baryawun enen yikir yale
Yimesgen yimesgenilign
Gojoyen Amlak molalign

CHORUS
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'he-is-praised'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Misgun new yetemesegene
Baryawun enen yikir yale
Yimesgen yimesgenilign
Gojoyen Amlak molalign'
    AND lyrics_english IS NOT DISTINCT FROM 'He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

VERSE 1
Misgun new yetemesegene
Baryawun enen yikir yale
Yimesgen yimesgenilign
Gojoyen Amlak molalign

VERSE 2
I know my Lord He gives for all generously
My void has been filled now receive my melody
For what I lacked you granted me its true
All will align for good by your virtue

VERSE 3
My sorrow He banished so that my joy perceives
The emptiness has passed you fulfilled all my needs
To give and take He has authority
To knock and ask is all He needs of me

VERSE 4
I may be pushed and heaved but I won’t feel distress
You are my foundation my home is your fortress
When you grant me tangibles to my eyes
Do not withhold from me your paradise

VERSE 5
He gives from His vast wealth the sovereign gracious Lord
For every need we have His blessings have been poured
When we''re deprived through Him we are restored
Praise to our God in our hearts He’s adored

VERSE 6
He is praised honored and glorified
He shows me mercy when I abide
I’ll praise Him give Him my offering
For my home is complete by my King

VERSE 7
Misgun new yetemesegene
Baryawun enen yikir yale
Yimesgen yimesgenilign
Gojoyen Amlak molalign'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'he-is-praised', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: He who created you (he-who-created-you)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
He who created you without blemish for the world’s salvation /2/
Blessed be God let His name praised
Blessed be God let His let His name be praised

VERSE 1
He who created you without blemish for the world’s salvation /2/
Blessed be God let His name praised
Blessed be God let His let His name be praised

CHORUS
He who created you without blemish for the world’s salvation /2/
Blessed be God let His name praised
Blessed be God let His let His name be praised',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'he-who-created-you'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'He who created you without blemish for the world’s salvation /2/
Blessed be God let His name praised
Blessed be God let His let His name be praised

VERSE 1
He who created you without blemish for the world’s salvation /2/
Blessed be God let His name praised
Blessed be God let His let His name be praised'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'he-who-created-you', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: He''s Done Wonders for Me (hes-done-wonders-for-me)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless
He’s done wonders for me Told me my child come

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 2
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 3
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ',
      lyrics_transliteration = 'CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 2
He’s done wonders for me Told me my child come
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom
He’s done wonders for me the Lord God Almighty

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 3
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya',
      lyrics_english = 'CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless
He’s done wonders for me Told me my child come

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 2
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 3
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 4
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 5
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 6
He’s done wonders for me From the den of lions
He’s done wonders for me His shelter kept me safe
He’s done wonders for me In front of all my foes
He’s done wonders for me I’ve been given His grace

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 7
He’s done wonders for me How can I repay Him?
He’s done wonders for me His love can’t be replaced

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 8
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 9
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 10
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 11
He’s done wonders for me All of my enemies
He’s done wonders for me Against me they had formed
He’s done wonders for me Who will come to rescue?
He’s done wonders for me Mockingly they had told

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 12
He’s done wonders for me Swiftly came to my aid
He’s done wonders for me From death I was restored

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 13
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 14
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 15
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hes-done-wonders-for-me'
    AND lyrics_amharic IS NOT DISTINCT FROM 'He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless
He’s done wonders for me Told me my child come

VERSE 2
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom

VERSE 3
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless

VERSE 2
He’s done wonders for me Told me my child come
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom
He’s done wonders for me the Lord God Almighty

VERSE 3
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya'
    AND lyrics_english IS NOT DISTINCT FROM 'He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless
He’s done wonders for me Told me my child come

VERSE 2
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom

VERSE 3
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 4
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 5
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 6
He’s done wonders for me From the den of lions
He’s done wonders for me His shelter kept me safe
He’s done wonders for me In front of all my foes
He’s done wonders for me I’ve been given His grace

VERSE 7
He’s done wonders for me How can I repay Him?
He’s done wonders for me His love can’t be replaced

VERSE 8
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 9
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 10
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 11
He’s done wonders for me All of my enemies
He’s done wonders for me Against me they had formed
He’s done wonders for me Who will come to rescue?
He’s done wonders for me Mockingly they had told

VERSE 12
He’s done wonders for me Swiftly came to my aid
He’s done wonders for me From death I was restored

VERSE 13
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 14
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me

VERSE 15
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hes-done-wonders-for-me', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hidu Ngeru (hidu-ngeru-awru-lealem)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በእርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን እምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 2
ዳንን የምንለው

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 4
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 6
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘህ ዘንድ ከቶ አልቻለም
ኃይለኛውን በኃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የእኛ ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 8
ከፍ በል በእልልታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 9
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 10
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 11
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 12
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 13
ማቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰከር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 14
ዕጹብ ያንተ ስራ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 15
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 16
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 17
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 18
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 19
መስክሩለት የምስራች ነው ታላቅ ዜና
መላዕክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሁናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወኅኒ ቤቱ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 20
ከበረውን ምቱ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 21
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 22
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 23
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ',
      lyrics_transliteration = 'CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 1
Gedayu mot beersu dil mensat tewatena
Senseletien qenberien tekaw bebegena
Mot hoy mewgiyah yetal eyaln emnzemrew

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 2
Mesqelh tor smh gashachn honoln new
Dann yemnlew
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 3
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 4
Az:
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 5
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 6
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 7
Teshagrenal slashagerken lezelalem
Bemeqabr mot yyzeh zend keto alchalem
Haylegnawn behayl asrekhew layfeta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 8
Zemernlh ashenafi neh yeegna gieta
Kef bel beellta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 9
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 10
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 11
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 12
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Mato madan leman techlwal kante beqer

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 13
Gietneth srah ynoral simeseker
Wedajie hoy wbeth wb new yemiyabera
Techeneqe tenqeteqete telat fera

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 14
Etsub yante sra
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 15
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 16
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 17
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 18
Mahtemun yefeta yetnsaiew gieta
Meskrulet yemsrach new talaq ziena
Melaektu nech lebsewal dl newna

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 19
Ketemawa andach hunalech belielitu
Bezmarie tenqeteqete wehni bietu
Keberewn mtu

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 20
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 21
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 22
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 23
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hidu-ngeru-awru-lealem'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በእርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን እምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው

VERSE 2
ዳንን የምንለው

VERSE 3
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 4
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

VERSE 5
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 6
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘህ ዘንድ ከቶ አልቻለም
ኃይለኛውን በኃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የእኛ ጌታ

VERSE 8
ከፍ በል በእልልታ

VERSE 9
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 10
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

VERSE 11
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 12
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 13
ማቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰከር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ

VERSE 14
ዕጹብ ያንተ ስራ

VERSE 15
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 16
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

VERSE 17
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 18
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 19
መስክሩለት የምስራች ነው ታላቅ ዜና
መላዕክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሁናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወኅኒ ቤቱ

VERSE 20
ከበረውን ምቱ

VERSE 21
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 22
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 23
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 1
Gedayu mot beersu dil mensat tewatena
Senseletien qenberien tekaw bebegena
Mot hoy mewgiyah yetal eyaln emnzemrew

VERSE 2
Mesqelh tor smh gashachn honoln new
Dann yemnlew
Hidu ngeru awru lealem

VERSE 3
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 4
Az:
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

VERSE 5
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

VERSE 6
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 7
Teshagrenal slashagerken lezelalem
Bemeqabr mot yyzeh zend keto alchalem
Haylegnawn behayl asrekhew layfeta

VERSE 8
Zemernlh ashenafi neh yeegna gieta
Kef bel beellta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

VERSE 9
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

VERSE 10
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

VERSE 11
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

VERSE 12
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Mato madan leman techlwal kante beqer

VERSE 13
Gietneth srah ynoral simeseker
Wedajie hoy wbeth wb new yemiyabera
Techeneqe tenqeteqete telat fera

VERSE 14
Etsub yante sra
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

VERSE 15
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

VERSE 16
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 17
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

VERSE 18
Mahtemun yefeta yetnsaiew gieta
Meskrulet yemsrach new talaq ziena
Melaektu nech lebsewal dl newna

VERSE 19
Ketemawa andach hunalech belielitu
Bezmarie tenqeteqete wehni bietu
Keberewn mtu

VERSE 20
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

VERSE 21
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

VERSE 22
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

VERSE 23
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hidu-ngeru-awru-lealem', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hosana Emrit (hosana-emrit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)

VERSE 1
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)

CHORUS
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)',
      lyrics_transliteration = 'CHORUS
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)

VERSE 1
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)

CHORUS
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hosana-emrit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)

VERSE 1
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)

VERSE 1
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hosana-emrit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Hosanna in Ariyam (hosanna-in-ariyam)
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
      lyrics_english = 'CHORUS
Holy Jerusalem you are at peace today
He has entered your gates
Your God leading the way

VERSE 1
Hosanna in Ariyam
They sang unto their Lord
The children of Holy Jerusalem

CHORUS
Holy Jerusalem you are at peace today
He has entered your gates
Your God leading the way

VERSE 2
The city of David O Bethlehem rejoice
The light of your people
Has come hearing your voice

CHORUS
Holy Jerusalem you are at peace today
He has entered your gates
Your God leading the way

VERSE 3
With their praises they sang
Hosanna to their King
Within Jerusalem
Their hearts poured offerings

CHORUS
Holy Jerusalem you are at peace today
He has entered your gates
Your God leading the way

VERSE 4
Suffering of Jesus
The pure of heart witnessed
Their eyes welling with tears
They all cried with sadness

CHORUS
Holy Jerusalem you are at peace today
He has entered your gates
Your God leading the way',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'hosanna-in-ariyam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem

VERSE 1
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem

VERSE 1
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem'
    AND lyrics_english IS NOT DISTINCT FROM 'Holy Jerusalem you are at peace today
He has entered your gates
Your God leading the way

VERSE 1
Hosanna in Ariyam
They sang unto their Lord
The children of Holy Jerusalem

VERSE 2
The city of David O Bethlehem rejoice
The light of your people
Has come hearing your voice

VERSE 3
With their praises they sang
Hosanna to their King
Within Jerusalem
Their hearts poured offerings

VERSE 4
Suffering of Jesus
The pure of heart witnessed
Their eyes welling with tears
They all cried with sadness'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'hosanna-in-ariyam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: How marvelous is Mary (how-marvelous-is-mary)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
How marvelous is Mary,
seen from afar like a light,
heaven’s mountain that Saint Moses,
observed with his eyes /2/

VERSE 1
[She is the one about whom,
Ezra prophesied,
She is the one /4/ David sang about] /2/
አይ ይእቲ ዛቲ እንተ ታስተርኢ ፣

CHORUS
How marvelous is Mary,
seen from afar like a light,
heaven’s mountain that Saint Moses,
observed with his eyes /2/

VERSE 2
እምርኁቅ ከመ ማኅቶት ደብረ ገነት /2/ ፣
ሙሴኒ ርእያ ሀገር ቅድስት ፣
ዕዝራኒ ተናገራ /3/ ዘመራ ዳዊት /2/

CHORUS
How marvelous is Mary,
seen from afar like a light,
heaven’s mountain that Saint Moses,
observed with his eyes /2/',
      lyrics_transliteration = 'CHORUS
How marvelous is Mary,
Seen from afar like a light,
Heaven’s mountain that Saint Moses,
Observed with his eyes (2)

VERSE 1
[She is the one about whom,
Ezra prophesied,
She is the one (4) David sang about] (2)
Ay yieti zati ente tasteri ,

CHORUS
How marvelous is Mary,
Seen from afar like a light,
Heaven’s mountain that Saint Moses,
Observed with his eyes (2)

VERSE 2
Emrhuq keme mahtot debre genet (2) ,
Museni rieya heger Kidist ,
Ezrani tenagera (3) zemera dawit (2)

CHORUS
How marvelous is Mary,
Seen from afar like a light,
Heaven’s mountain that Saint Moses,
Observed with his eyes (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'how-marvelous-is-mary'
    AND lyrics_amharic IS NOT DISTINCT FROM 'How marvelous is Mary,
seen from afar like a light,
heaven’s mountain that Saint Moses,
observed with his eyes /2/

VERSE 1
[She is the one about whom,
Ezra prophesied,
She is the one /4/ David sang about] /2/
አይ ይእቲ ዛቲ እንተ ታስተርኢ ፣

VERSE 2
እምርኁቅ ከመ ማኅቶት ደብረ ገነት /2/ ፣
ሙሴኒ ርእያ ሀገር ቅድስት ፣
ዕዝራኒ ተናገራ /3/ ዘመራ ዳዊት /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'How marvelous is Mary,
Seen from afar like a light,
Heaven’s mountain that Saint Moses,
Observed with his eyes (2)

VERSE 1
[She is the one about whom,
Ezra prophesied,
She is the one (4) David sang about] (2)
Ay yieti zati ente tasteri ,

VERSE 2
Emrhuq keme mahtot debre genet (2) ,
Museni rieya heger Kidist ,
Ezrani tenagera (3) zemera dawit (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'how-marvelous-is-mary', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Huletegna Semay (huletegna-semay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 1
የጽዮን ምሳሌ ሰማይ ተዘረጋ
ኃይለ ልዑል ያላት የተመላች ጸጋ
በአምላክ ሕሊና የኖረች ታስባ
ጸዋሪተ ፍሬ የገነት አበባ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 2
የተለየች ድንኳን ለሊቀ ካህናቱ
የተገለጸባት የእግዚአብሔር ምሕረቱ
ከያዕቆብ ድንኳኖች ያንቺን ውበት ወዶ
ወደ ርስቱ አገባን የሠጠንን ወስዶ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 3
የምሕረትን ዝናም ያወረድሽ ደመና
ንጽሕት መሶበ ወርቅ በውስጥ ያለሽ መና
ዓለምን ያጽናናሽ አዲስ ብሥራት ዜና
አርጋኖን ውዳሴ ላንቺ ይሁን ሞስጋና

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 4
በልማድሽ ምሕረት ባደረግሽው ምልጃ
የጭንቁን ማቅ ቀድዶ አለበሰን ግምጃ
ባንቺ ያገኘነው የሠራልን ሥራ
ዕፁብ ዕፁብ እንጂ አያልቅም ቢወራ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ',
      lyrics_transliteration = 'CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 1
Yets’yon misale semay tezerega
Hayle liul yalat yetemelach ts’ega
Beamlak hilina yenorech tasba
Ts’ewarite fire yegenet abeba

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 2
Yeteleyech dinkwan leliqe kahnatu
Yetegelets’ebat yeEgziabher mihretu
Keyaeqob dinkwanoch yanchin wibet wedo
Wede ristu ageban yeset’enn wesdo

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 3
Yemhretn zinam yaweredsh demena
Nits’ht mesobe werq bewst’ yalesh mena
Alemn yats’nanash adis bisrat zena
Arganon widase lanchi yihun mosgana

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 4
Belmadsh mihret baderegshw milja
Yech’nqun maq qeddo alebesen gimja
Banchi yagegnenew yeseraln sira
Ets’ub ets’ub enji ayalqm biwera

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'huletegna-semay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 1
የጽዮን ምሳሌ ሰማይ ተዘረጋ
ኃይለ ልዑል ያላት የተመላች ጸጋ
በአምላክ ሕሊና የኖረች ታስባ
ጸዋሪተ ፍሬ የገነት አበባ

VERSE 2
የተለየች ድንኳን ለሊቀ ካህናቱ
የተገለጸባት የእግዚአብሔር ምሕረቱ
ከያዕቆብ ድንኳኖች ያንቺን ውበት ወዶ
ወደ ርስቱ አገባን የሠጠንን ወስዶ

VERSE 3
የምሕረትን ዝናም ያወረድሽ ደመና
ንጽሕት መሶበ ወርቅ በውስጥ ያለሽ መና
ዓለምን ያጽናናሽ አዲስ ብሥራት ዜና
አርጋኖን ውዳሴ ላንቺ ይሁን ሞስጋና

VERSE 4
በልማድሽ ምሕረት ባደረግሽው ምልጃ
የጭንቁን ማቅ ቀድዶ አለበሰን ግምጃ
ባንቺ ያገኘነው የሠራልን ሥራ
ዕፁብ ዕፁብ እንጂ አያልቅም ቢወራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 1
Yets’yon misale semay tezerega
Hayle liul yalat yetemelach ts’ega
Beamlak hilina yenorech tasba
Ts’ewarite fire yegenet abeba

VERSE 2
Yeteleyech dinkwan leliqe kahnatu
Yetegelets’ebat yeEgziabher mihretu
Keyaeqob dinkwanoch yanchin wibet wedo
Wede ristu ageban yeset’enn wesdo

VERSE 3
Yemhretn zinam yaweredsh demena
Nits’ht mesobe werq bewst’ yalesh mena
Alemn yats’nanash adis bisrat zena
Arganon widase lanchi yihun mosgana

VERSE 4
Belmadsh mihret baderegshw milja
Yech’nqun maq qeddo alebesen gimja
Banchi yagegnenew yeseraln sira
Ets’ub ets’ub enji ayalqm biwera'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'huletegna-semay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I call out your name (i-call-out-your-name)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Simshin teriche meche afralew
Mariam biye meche ewedkalew
Yemitsnanabet simish newina
Dingil hoy lakrib lanchi misgana',
      lyrics_english = 'CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 1
Simshin teriche meche afralew
Mariam biye meche ewedkalew
Yemitsnanabet simish newina
Dingil hoy lakrib lanchi misgana

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 2
In the land of foes swallowed by darkness
Living for ages trampled by meekness
When the devil dragged me through misery
The Savior of the world you brought for me

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 3
When I left the land of my father''s place
Among the gentiles slavery I faced
You came to my aid bestowed your blessing
Mary with you I end my suffering

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 4
When my tent was filled with the wedding guests
The ushers and hosts were in grave distress
When stricken without gifts to give in strife
Your swift aid steered me from the edge of life

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 5
My dreams like the clouds scattered in the breeze
Faded like a mist like feathers with ease
In my shortcomings I will still stand tall
In Theotokos hope answers the call

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 6
When my kin forsakes no one to confide
When this heartless world cast me out aside
With you fear subsides power dwells in me
Through the fiercest winds I will sail the sea

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 7
In the grasp of foes I found agony
Pain and suffering trials aplenty
I will never cease my praises to you
Dear Virgin Mary your marvels renew

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 8
When tormentors loom shouting threats at me
Their words can''t cease the love I hold for thee
In the scoffer''s crowd your name I’ll decree
So my faith withstands shield me dear Mary

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 9
In the grasp of foes I found agony
Pain and suffering trials aplenty
I will never cease my praises to you
Dear Virgin Mary your marvels renew

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 10
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 11
Simshin teriche meche afralew
Mariam biye meche ewedkalew
Yemitsnanabet simish newina
Dingil hoy lakrib lanchi misgana

CHORUS
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-call-out-your-name'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshin teriche meche afralew
Mariam biye meche ewedkalew
Yemitsnanabet simish newina
Dingil hoy lakrib lanchi misgana'
    AND lyrics_english IS NOT DISTINCT FROM 'With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 1
Simshin teriche meche afralew
Mariam biye meche ewedkalew
Yemitsnanabet simish newina
Dingil hoy lakrib lanchi misgana

VERSE 2
In the land of foes swallowed by darkness
Living for ages trampled by meekness
When the devil dragged me through misery
The Savior of the world you brought for me

VERSE 3
When I left the land of my father''s place
Among the gentiles slavery I faced
You came to my aid bestowed your blessing
Mary with you I end my suffering

VERSE 4
When my tent was filled with the wedding guests
The ushers and hosts were in grave distress
When stricken without gifts to give in strife
Your swift aid steered me from the edge of life

VERSE 5
My dreams like the clouds scattered in the breeze
Faded like a mist like feathers with ease
In my shortcomings I will still stand tall
In Theotokos hope answers the call

VERSE 6
When my kin forsakes no one to confide
When this heartless world cast me out aside
With you fear subsides power dwells in me
Through the fiercest winds I will sail the sea

VERSE 7
In the grasp of foes I found agony
Pain and suffering trials aplenty
I will never cease my praises to you
Dear Virgin Mary your marvels renew

VERSE 8
When tormentors loom shouting threats at me
Their words can''t cease the love I hold for thee
In the scoffer''s crowd your name I’ll decree
So my faith withstands shield me dear Mary

VERSE 9
In the grasp of foes I found agony
Pain and suffering trials aplenty
I will never cease my praises to you
Dear Virgin Mary your marvels renew

VERSE 10
With unshaken faith I call out your name
Pleading to Mary I won''t fall in shame
I find my solace when I call to you
To you my reverence O Virgin is due

VERSE 11
Simshin teriche meche afralew
Mariam biye meche ewedkalew
Yemitsnanabet simish newina
Dingil hoy lakrib lanchi misgana'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-call-out-your-name', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I called unto my Dear Lord (i-called-unto-my-dear-lord)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
I called unto my Dear Lord when my life was impaired
I called unto my Father when I had none to spare
My anxiousness he calmed rescued me from despair

VERSE 1
When I appeal to Him He hears my desperate cry
His ears are attentive and open are His eyes
For He will rescue me from a life that is grim
I may be unworthy but still I will praise Him

CHORUS
I called unto my Dear Lord when my life was impaired
I called unto my Father when I had none to spare
My anxiousness he calmed rescued me from despair

VERSE 2
Unable to walk on the path of righteousness
The drowning waves of sin seemed to me tireless
When I appealed to Him with a regretful heart
He brought forth His mercy and pulled me from the dark

CHORUS
I called unto my Dear Lord when my life was impaired
I called unto my Father when I had none to spare
My anxiousness he calmed rescued me from despair

VERSE 3
Just as you saved Noah rescue us from the storm
Shield us from the arrows coming in every form
My strength will be in you I won’t tremble in fear
I will lean on the cross knowing my God is near

CHORUS
I called unto my Dear Lord when my life was impaired
I called unto my Father when I had none to spare
My anxiousness he calmed rescued me from despair

VERSE 4
With abundant mercy death was left in the past
He never left His child showing His love is vast
God received me with joy with His bright shining light
Who will stand against me with my Lord as my might

CHORUS
I called unto my Dear Lord when my life was impaired
I called unto my Father when I had none to spare
My anxiousness he calmed rescued me from despair',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-called-unto-my-dear-lord'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'I called unto my Dear Lord when my life was impaired
I called unto my Father when I had none to spare
My anxiousness he calmed rescued me from despair

VERSE 1
When I appeal to Him He hears my desperate cry
His ears are attentive and open are His eyes
For He will rescue me from a life that is grim
I may be unworthy but still I will praise Him

VERSE 2
Unable to walk on the path of righteousness
The drowning waves of sin seemed to me tireless
When I appealed to Him with a regretful heart
He brought forth His mercy and pulled me from the dark

VERSE 3
Just as you saved Noah rescue us from the storm
Shield us from the arrows coming in every form
My strength will be in you I won’t tremble in fear
I will lean on the cross knowing my God is near

VERSE 4
With abundant mercy death was left in the past
He never left His child showing His love is vast
God received me with joy with His bright shining light
Who will stand against me with my Lord as my might'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-called-unto-my-dear-lord', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I can''t do it alone (i-cant-do-it-alone)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
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
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-cant-do-it-alone'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 1
Give me tears of repentance, The Tears of St. Peter
The tears of the woman who cried, washed, Your feet with her hair
Give me the tears of King David, and his humble heart
Let me cry to cleanse my sins, give me true regret

VERSE 2
I can''t do it alone, Lord be my strength.
Chorus….

VERSE 3
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 4
You are my hope and my Lord, shine your guiding light
I repent, confess, all my sins, alone I cannot fight
Help me to live righteously, give me a way out
I am empty without you, send me your spirit

VERSE 5
I can''t do it alone, Lord be my strength.
Chorus….

VERSE 6
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility

VERSE 7
Grant me depth in knowing you, teach me the right path
Reveal, to me Your mysteries, please strengthen my faith
You suffered on my behalf, on the cross you died
You gave me Your flesh and blood, so I can be saved

VERSE 8
I can''t do it alone, Lord be my strength.

VERSE 9
I can''t do it alone, Lord be my strength /x2/
My soul longs for you, show me your truth /x2/
Help me cry and regret my sins, Lord forgive me /x2/
Give me, a repentant heart with humility'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-cant-do-it-alone', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I found tranquility (i-found-tranquility)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Ewnetegna selam yalew ke betih new
Erdagn alinawet eleminihalew',
      lyrics_english = 'CHORUS
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
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-found-tranquility'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ewnetegna selam yalew ke betih new
Erdagn alinawet eleminihalew'
    AND lyrics_english IS NOT DISTINCT FROM 'I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 1
Thinking of all my sins my heart beats anxiously
Being far from you Lord my soul lives fearfully
Return me to Your grace I''ll find my way back home
The one true holy peace I found in Your abode

VERSE 2
For prayer liturgy I could not persevere
I stood before the crowd my praises not sincere
My endless temptations have dragged me far from You
Save me Emmanuel with faith that I once knew

VERSE 3
Let my eyes pour their tears as they cry for my sins
May the rest of my days be spent in repentance
At the very hour the moment I''m redeemed
Thinking of Your love Lord I''ve fallen at Your feet

VERSE 4
Ewnetegna selam yalew ke betih new
Erdagn alinawet eleminihalew'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-found-tranquility', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I Have A Reason (i-have-a-reason)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 1
The Mother of the Lord, the boast of all the saints
The voice of their prayers support that doesn''t shame
If I sing saying im proud you are my mother
I have reason to testify to your honor

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 2
When Adam became subject to death, through his sin
Retreated in vigil, praying while standing still
Saw the light within him, through whom he would be saved
My Lord’s Mother he said, ‘my life’ became her name

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 3
I too have a reason to boast of my lady,
With good reason I will sing of her name Mary
Protector of my life, from the merciless sea
Rainbow after the storm, from wrath she protects me

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 4
She preserved him from death, Semblance of Noah’s ark,
The safeguard of my soul, through her I receive life
She is my advocate I will witness of her
At all times with reason her name I’ll remember

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 5
At the mount Sinai when Moses saw her
Aron with the sistrum sang praises unto her
Ezra with mesenqo, King David with the harp
In faith I saw them all, praises they did impart

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 6
Deep down I’m awoken, to praise her from my heart
She is my hymnody the reason for my songs
When the angel of good news called her the bles-sed
Elizabeth bowed down my Lord’s mother she said

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 7
St Yaried in his hymns, Ephraim in his praises
Hiryaqos followed on, Liturgy he arranged
When her honor’s revealed in heaven and on earth
I have reason to sing praises of her honor

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku',
      lyrics_transliteration = 'CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 1
The Mother of the Lord, the boast of all the saints
The voice of their prayers support that doesn''t shame
If I sing saying im proud you are my mother
I have reason to testify to your honor

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 2
When Adam became subject to death, through his sin
Retreated in vigil, praying while standing still
Saw the light within him, through whom he would be saved
My Lord’s Mother he said, ‘my life’ became her name

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 3
I too have a reason to boast of my lady,
With good reason I will sing of her name Mary
Protector of my life, from the merciless sea
Rainbow after the storm, from wrath she protects me

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 4
She preserved him from death, Semblance of Noah’s ark,
The safeguard of my soul, through her I receive life
She is my advocate I will witness of her
At all times with reason her name I’ll remember

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 5
At the mount Sinai when Moses saw her
Aron with the sistrum sang praises unto her
Ezra with mesenqo, King David with the harp
In faith I saw them all, praises they did impart

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 6
Deep down I’m awoken, to praise her from my heart
She is my hymnody the reason for my songs
When the angel of good news called her the bles-sed
Elizabeth bowed down my Lord’s mother she said

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 7
St Yaried in his hymns, Ephraim in his praises
Hiryaqos followed on, Liturgy he arranged
When her honor’s revealed in heaven and on earth
I have reason to sing praises of her honor

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-have-a-reason'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 1
The Mother of the Lord, the boast of all the saints
The voice of their prayers support that doesn''t shame
If I sing saying im proud you are my mother
I have reason to testify to your honor

VERSE 2
When Adam became subject to death, through his sin
Retreated in vigil, praying while standing still
Saw the light within him, through whom he would be saved
My Lord’s Mother he said, ‘my life’ became her name

VERSE 3
I too have a reason to boast of my lady,
With good reason I will sing of her name Mary
Protector of my life, from the merciless sea
Rainbow after the storm, from wrath she protects me

VERSE 4
She preserved him from death, Semblance of Noah’s ark,
The safeguard of my soul, through her I receive life
She is my advocate I will witness of her
At all times with reason her name I’ll remember

VERSE 5
At the mount Sinai when Moses saw her
Aron with the sistrum sang praises unto her
Ezra with mesenqo, King David with the harp
In faith I saw them all, praises they did impart

VERSE 6
Deep down I’m awoken, to praise her from my heart
She is my hymnody the reason for my songs
When the angel of good news called her the bles-sed
Elizabeth bowed down my Lord’s mother she said

VERSE 7
St Yaried in his hymns, Ephraim in his praises
Hiryaqos followed on, Liturgy he arranged
When her honor’s revealed in heaven and on earth
I have reason to sing praises of her honor'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 1
The Mother of the Lord, the boast of all the saints
The voice of their prayers support that doesn''t shame
If I sing saying im proud you are my mother
I have reason to testify to your honor

VERSE 2
When Adam became subject to death, through his sin
Retreated in vigil, praying while standing still
Saw the light within him, through whom he would be saved
My Lord’s Mother he said, ‘my life’ became her name

VERSE 3
I too have a reason to boast of my lady,
With good reason I will sing of her name Mary
Protector of my life, from the merciless sea
Rainbow after the storm, from wrath she protects me

VERSE 4
She preserved him from death, Semblance of Noah’s ark,
The safeguard of my soul, through her I receive life
She is my advocate I will witness of her
At all times with reason her name I’ll remember

VERSE 5
At the mount Sinai when Moses saw her
Aron with the sistrum sang praises unto her
Ezra with mesenqo, King David with the harp
In faith I saw them all, praises they did impart

VERSE 6
Deep down I’m awoken, to praise her from my heart
She is my hymnody the reason for my songs
When the angel of good news called her the bles-sed
Elizabeth bowed down my Lord’s mother she said

VERSE 7
St Yaried in his hymns, Ephraim in his praises
Hiryaqos followed on, Liturgy he arranged
When her honor’s revealed in heaven and on earth
I have reason to sing praises of her honor'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-have-a-reason', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I have no righteous deeds (i-have-no-righteous-deeds)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Enes bemigibare dekama hognalehu
Ezegnilegni Dingil elemeneshalehu
Ezegnilegni Dingil ematsenishalew',
      lyrics_english = 'CHORUS
Enes bemigibare dekama hognalehu
Ezegnilegni Dingil Elemeneshalehu
Ezegnilegni Dingil Ematsenishalew

VERSE 1
I have no righteous deeds, I have fallen to sin
Pray for me Saint Mary, see me with compassion
Plead for me Saint Mary, see me with compassion

CHORUS
Enes bemigibare dekama hognalehu
Ezegnilegni Dingil Elemeneshalehu
Ezegnilegni Dingil Ematsenishalew

VERSE 2
So that I may escape, the eternal fire
I call upon your name, mother of my Savior

CHORUS
Enes bemigibare dekama hognalehu
Ezegnilegni Dingil Elemeneshalehu
Ezegnilegni Dingil Ematsenishalew

VERSE 3
Medicine of Nahom, melody of David,
Manna of Elijah, come to us on a cloud

CHORUS
Enes bemigibare dekama hognalehu
Ezegnilegni Dingil Elemeneshalehu
Ezegnilegni Dingil Ematsenishalew

VERSE 4
You are my strength Mary, whenever I am weak
Your intercession is, what my broken heart needs

CHORUS
Enes bemigibare dekama hognalehu
Ezegnilegni Dingil Elemeneshalehu
Ezegnilegni Dingil Ematsenishalew

VERSE 5
My sins and my weakness, are causing me to stress
The mother of my Lord, pray for my forgiveness

CHORUS
Enes bemigibare dekama hognalehu
Ezegnilegni Dingil Elemeneshalehu
Ezegnilegni Dingil Ematsenishalew',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-have-no-righteous-deeds'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Enes bemigibare dekama hognalehu
Ezegnilegni Dingil elemeneshalehu
Ezegnilegni Dingil ematsenishalew'
    AND lyrics_english IS NOT DISTINCT FROM 'Enes bemigibare dekama hognalehu
Ezegnilegni Dingil Elemeneshalehu
Ezegnilegni Dingil Ematsenishalew

VERSE 1
I have no righteous deeds, I have fallen to sin
Pray for me Saint Mary, see me with compassion
Plead for me Saint Mary, see me with compassion

VERSE 2
So that I may escape, the eternal fire
I call upon your name, mother of my Savior

VERSE 3
Medicine of Nahom, melody of David,
Manna of Elijah, come to us on a cloud

VERSE 4
You are my strength Mary, whenever I am weak
Your intercession is, what my broken heart needs

VERSE 5
My sins and my weakness, are causing me to stress
The mother of my Lord, pray for my forgiveness'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-have-no-righteous-deeds', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I have seen all I need (i-have-seen-all-i-need)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
I have seen all I need (3) (Luke 2)
My Lord is here indeed

VERSE 1
I was in disbelief of a virgin birth
But now I have seen this mystery here on earth
I waited for so long to see this prophecy
And now I have seen my Lord who came to rescue me

CHORUS
I have seen all I need (3) (Luke 2)
My Lord is here indeed

VERSE 2
Without leaving His throne He came down from above
Although my sins were great He came to show His love
And now I can declare that I have been set free
My God is truly One and in One He is Three

CHORUS
I have seen all I need (3) (Luke 2)
My Lord is here indeed

VERSE 3
My Lord Jesus Christ, my Savior and my King
I always worship Him it’s His name that I sing
The light of the world He’s all that I can see
The Word became flesh, and He came to save me

CHORUS
I have seen all I need (3) (Luke 2)
My Lord is here indeed

VERSE 4
The Son becoming Man this holy mystery
No one can understand this sacred unity
Those who have eyes see! Those who have ears hear!
Christ has come to this world there’s nothing else to fear

CHORUS
I have seen all I need (3) (Luke 2)
My Lord is here indeed',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-have-seen-all-i-need'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'I have seen all I need (3) (Luke 2)
My Lord is here indeed

VERSE 1
I was in disbelief of a virgin birth
But now I have seen this mystery here on earth
I waited for so long to see this prophecy
And now I have seen my Lord who came to rescue me

VERSE 2
Without leaving His throne He came down from above
Although my sins were great He came to show His love
And now I can declare that I have been set free
My God is truly One and in One He is Three

VERSE 3
My Lord Jesus Christ, my Savior and my King
I always worship Him it’s His name that I sing
The light of the world He’s all that I can see
The Word became flesh, and He came to save me

VERSE 4
The Son becoming Man this holy mystery
No one can understand this sacred unity
Those who have eyes see! Those who have ears hear!
Christ has come to this world there’s nothing else to fear'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-have-seen-all-i-need', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I know the one who has saved me (i-know-the-one-who-has-saved-me)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new',
      lyrics_english = 'CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 1
Banishing the darkness away
He is the one who shined His light
Because of Christ I am complete
I will follow Him day and night

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 2
I saw the brilliant light of God
Always ahead guiding me now
His love brought me toward the church
I chose to worship Him and bow

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 3
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 4
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 5
He gave me rest in His embrace
My corrupted life He maintains
Dying on the cross for my sins
I was healed while He was in pain

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 6
His tireless arms carry me
So that I may live in honor
For my salvation He came down
Humbly He laid in a manger

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 7
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 8
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 9
To glorify I will sing songs
On the cross Jesus shed His blood
For the sake of His children’s lives
He gave His life for those He loved

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 10
This love brought Christ from the heavens
The humble God came for my gain
I became holy through the lamb
On Calvary the Lord was slain

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 11
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 12
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 13
The King who wore a crown of thorns
Left His throne and glory for me
He guided me to my honor
With holy blood I was redeemed

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 14
Bowing His head He raised me up
His righteousness brightens my face
I will live the rest of my days
With Jesus Christ who gives me grace

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 15
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 16
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 17
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 18
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 19
Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 20
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-know-the-one-who-has-saved-me'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new'
    AND lyrics_english IS NOT DISTINCT FROM 'I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 1
Banishing the darkness away
He is the one who shined His light
Because of Christ I am complete
I will follow Him day and night

VERSE 2
I saw the brilliant light of God
Always ahead guiding me now
His love brought me toward the church
I chose to worship Him and bow

VERSE 3
I will give praise (3) For He loves me always

VERSE 4
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 5
He gave me rest in His embrace
My corrupted life He maintains
Dying on the cross for my sins
I was healed while He was in pain

VERSE 6
His tireless arms carry me
So that I may live in honor
For my salvation He came down
Humbly He laid in a manger

VERSE 7
I will give praise (3) For He loves me always

VERSE 8
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 9
To glorify I will sing songs
On the cross Jesus shed His blood
For the sake of His children’s lives
He gave His life for those He loved

VERSE 10
This love brought Christ from the heavens
The humble God came for my gain
I became holy through the lamb
On Calvary the Lord was slain

VERSE 11
I will give praise (3) For He loves me always

VERSE 12
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 13
The King who wore a crown of thorns
Left His throne and glory for me
He guided me to my honor
With holy blood I was redeemed

VERSE 14
Bowing His head He raised me up
His righteousness brightens my face
I will live the rest of my days
With Jesus Christ who gives me grace

VERSE 15
I will give praise (3) For He loves me always

VERSE 16
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 17
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 18
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 19
Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new

VERSE 20
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-know-the-one-who-has-saved-me', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I will forever sing for my Lady (i-will-forever-sing-for-my-lady)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Yihew ezemiralew le Emebete
Ye fiqrua bereket gebto bete
Silegobegnechiw gosquala hiyweten
Ameseginalehu Dingil Emebeten',
      lyrics_english = 'CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time

VERSE 1
From my sorrowful face she soothed away my tears
I’m made to magnify her with songs and prayers
With misery and pain I no longer suffer
Into my home she came the mother of wonder

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time

VERSE 2
The disarray of life crumbling around me
She cleared it all away restored my sanity
She listens to my pleas my appeals and my cries
With her intercession my prayers will arise

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time

VERSE 3
No longer do I see through a clouded vision
My eyes have been healed by her hands of compassion
When I appeal to her with sorrow and despair
Immaculate is she, to the world I’ll declare

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time

VERSE 4
Day and night I lament with a heavy burden
From drowning she saved me so I won’t be saddened
For she has pulled me free from the clench of my sins
To her eternally I will raise up my hands

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time

VERSE 5
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time

VERSE 6
Yihew ezemiralew le Emebete
Ye fiqrua bereket gebto bete
Silegobegnechiw gosquala hiyweten
Ameseginalehu Dingil Emebeten

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-will-forever-sing-for-my-lady'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yihew ezemiralew le Emebete
Ye fiqrua bereket gebto bete
Silegobegnechiw gosquala hiyweten
Ameseginalehu Dingil Emebeten'
    AND lyrics_english IS NOT DISTINCT FROM 'I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time

VERSE 1
From my sorrowful face she soothed away my tears
I’m made to magnify her with songs and prayers
With misery and pain I no longer suffer
Into my home she came the mother of wonder

VERSE 2
The disarray of life crumbling around me
She cleared it all away restored my sanity
She listens to my pleas my appeals and my cries
With her intercession my prayers will arise

VERSE 3
No longer do I see through a clouded vision
My eyes have been healed by her hands of compassion
When I appeal to her with sorrow and despair
Immaculate is she, to the world I’ll declare

VERSE 4
Day and night I lament with a heavy burden
From drowning she saved me so I won’t be saddened
For she has pulled me free from the clench of my sins
To her eternally I will raise up my hands

VERSE 5
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time

VERSE 6
Yihew ezemiralew le Emebete
Ye fiqrua bereket gebto bete
Silegobegnechiw gosquala hiyweten
Ameseginalehu Dingil Emebeten'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-will-forever-sing-for-my-lady', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I will praise You (i-will-praise-you)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Lamesginih yene Geta lamesginih
Liqegnilih yene Geta liqegnilih
Hiywete new zimare tirufate
Yesetehegn endakebrih ante abate',
      lyrics_english = 'CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 1
From all that’s mine, I cannot find any worthy
Fill me oh Lord, all your gifts I’ll, return gladly
You’re my wisdom, the foundation for all glory
Bountiful are all the blessings, You’ve poured on me

CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 2
My gracious Lord who tuned my heart to stand and praise
Receive my songs from the talents of which You gave

CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 3
Vast is the void I once called life, I’m left empty
My hands deprived, offered none to The Almighty
Though I may live, a life tangled with transgression
The songs I sing, may You accept with compassion

CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 4
My gracious Lord who tuned my heart to stand and praise
Receive my songs from the talents of which You gave

CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 5
When you made me from the Earth''s dust in your likeness
What work is there aside from praise it is priceless
Day and night I stand in the house of my father
To glorify tirelessly in Your honor

CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 6
My gracious Lord who tuned my heart to stand and praise
Receive my songs from the talents of which You gave

CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 7
Ezra give me the instrument that’s Cherubic
Grant me David your harp which is therapeutic
Compositions and songs I learned from the clergy
Touched by Your love I sing to You though unworthy

CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 8
My gracious Lord who tuned my heart to stand and praise
Receive my songs from the talents of which You gave

CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 9
Lamesginih yene Geta lamesginih
Liqegnilih yene Geta liqegnilih
Hiywete new zimare tirufate
Yesetehegn endakebrih ante abate

CHORUS
I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-will-praise-you'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Lamesginih yene Geta lamesginih
Liqegnilih yene Geta liqegnilih
Hiywete new zimare tirufate
Yesetehegn endakebrih ante abate'
    AND lyrics_english IS NOT DISTINCT FROM 'I will praise You with Melodies God Almighty
Compositions will pour out of my heart for Thee
Singing to you completes me Lord it’s my treasure
A gift given to glorify you my Father

VERSE 1
From all that’s mine, I cannot find any worthy
Fill me oh Lord, all your gifts I’ll, return gladly
You’re my wisdom, the foundation for all glory
Bountiful are all the blessings, You’ve poured on me

VERSE 2
My gracious Lord who tuned my heart to stand and praise
Receive my songs from the talents of which You gave

VERSE 3
Vast is the void I once called life, I’m left empty
My hands deprived, offered none to The Almighty
Though I may live, a life tangled with transgression
The songs I sing, may You accept with compassion

VERSE 4
My gracious Lord who tuned my heart to stand and praise
Receive my songs from the talents of which You gave

VERSE 5
When you made me from the Earth''s dust in your likeness
What work is there aside from praise it is priceless
Day and night I stand in the house of my father
To glorify tirelessly in Your honor

VERSE 6
My gracious Lord who tuned my heart to stand and praise
Receive my songs from the talents of which You gave

VERSE 7
Ezra give me the instrument that’s Cherubic
Grant me David your harp which is therapeutic
Compositions and songs I learned from the clergy
Touched by Your love I sing to You though unworthy

VERSE 8
My gracious Lord who tuned my heart to stand and praise
Receive my songs from the talents of which You gave

VERSE 9
Lamesginih yene Geta lamesginih
Liqegnilih yene Geta liqegnilih
Hiywete new zimare tirufate
Yesetehegn endakebrih ante abate'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-will-praise-you', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: I won''t Forget (i-wont-forget)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
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
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'i-wont-forget'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 1
To defeat my adversary
I sold my soul to the serpent
I was stripped of being Your son
I was alone and deserted

VERSE 2
Until my fate you reverted.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

VERSE 3
With Your blood You set me free.
The weight of my sin was a burden
My condition seem to worsen
But then you came for the rescue

VERSE 4
And paid my debt that I was due.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

VERSE 5
With Your blood You set me free.
Never deserved, your divine gift
Up to the cross, you loved me first
And now I shout, from the rooftops

VERSE 6
I’ll sing for You, I will not stop.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

VERSE 7
With Your blood You set me free'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'i-wont-forget', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: In That Very Hour (in-that-very-hour)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ

VERSE 1
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ

CHORUS
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ',
      lyrics_transliteration = 'CHORUS
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata

VERSE 1
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata

CHORUS
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata',
      lyrics_english = 'CHORUS
In that very hour when Christ comes once again (2)
From the youth to the old (3)
We will all face Him then

VERSE 1
From the east to the west from the north to the south
When the winds are released (3) to rain down the chaos.

CHORUS
In that very hour when Christ comes once again (2)
From the youth to the old (3)
We will all face Him then

VERSE 2
The heavens and the Earth when they start to align (2)
We will meet our maker (3) with nowhere left to hide

CHORUS
In that very hour when Christ comes once again (2)
From the youth to the old (3)
We will all face Him then

VERSE 3
The Righteous to the right to the left the sinners (2)
With the sound of the horns (3) with the beat of the drums

CHORUS
In that very hour when Christ comes once again (2)
From the youth to the old (3)
We will all face Him then

VERSE 4
The Earth disintegrates and the bones are gathered (2)
It is overwhelming (3) when God’s judgment is served

CHORUS
In that very hour when Christ comes once again (2)
From the youth to the old (3)
We will all face Him then

VERSE 5
The fear of the darkness the cries and the screaming (2)
For those who closed the door, to the light of the Lord, for those who closed the door, when Christ had been knocking

CHORUS
In that very hour when Christ comes once again (2)
From the youth to the old (3)
We will all face Him then

VERSE 6
As they enter heaven the righteous by their works (2)
The sinners were sentenced (3) to the eternal curse

CHORUS
In that very hour when Christ comes once again (2)
From the youth to the old (3)
We will all face Him then',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'in-that-very-hour'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ

VERSE 1
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata

VERSE 1
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata'
    AND lyrics_english IS NOT DISTINCT FROM 'In that very hour when Christ comes once again (2)
From the youth to the old (3)
We will all face Him then

VERSE 1
From the east to the west from the north to the south
When the winds are released (3) to rain down the chaos.

VERSE 2
The heavens and the Earth when they start to align (2)
We will meet our maker (3) with nowhere left to hide

VERSE 3
The Righteous to the right to the left the sinners (2)
With the sound of the horns (3) with the beat of the drums

VERSE 4
The Earth disintegrates and the bones are gathered (2)
It is overwhelming (3) when God’s judgment is served

VERSE 5
The fear of the darkness the cries and the screaming (2)
For those who closed the door, to the light of the Lord, for those who closed the door, when Christ had been knocking

VERSE 6
As they enter heaven the righteous by their works (2)
The sinners were sentenced (3) to the eternal curse'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'in-that-very-hour', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: In the Land of Ephrathah (in-the-land-of-ephrathah)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
በኤፍራታ ምድር፣ በቤተልሔም (፪)
BE EFRATA MEDER BE''BETELHEM(2)
ጌታ ተወለደ፣ ከድንግል ማርያም (፪)
GETA TEWELEDE KE''DENGEL MARYAM(2)

VERSE 1
ብርሃናዊው ኮከብ ከሰማይ ዝቅ አለ (፪)
BERHANAWIW KOKEB KE''SEMAY ZEK ALE(2)
ፍጥረትም ዘመረ “ሃሌ ሉያ” እያለ (፪)
FETRETM ZEMERE HALE LUYA EYALE (2)

CHORUS
በኤፍራታ ምድር፣ በቤተልሔም (፪)
BE EFRATA MEDER BE''BETELHEM(2)
ጌታ ተወለደ፣ ከድንግል ማርያም (፪)
GETA TEWELEDE KE''DENGEL MARYAM(2)

VERSE 2
IN THE LAND OF EPHRATAH, IN BETHLEHEM’S CITY (×2),
THE SAVIOR HAS BEEN BORN, FROM SAINT VIRGIN MARY, (×2)
THE LUMINOUS STAR CAME, DESCENDING FROM THE SKY (×2)
ALL CREATURES PRAISED THE LORD, “HALLELUJAH” THEY SANG /CRIED.

CHORUS
በኤፍራታ ምድር፣ በቤተልሔም (፪)
BE EFRATA MEDER BE''BETELHEM(2)
ጌታ ተወለደ፣ ከድንግል ማርያም (፪)
GETA TEWELEDE KE''DENGEL MARYAM(2)

VERSE 3
HALLELUJAH” THEY CRIED.
AS THE SHEPHERDS HERDED THEIR FLOCKS DURING THE NIGHT,
THEY HEARD THE GOOD TIDINGS DESCENDING FROM THE HEIGHT
THE ANGEL’S GLORY SHONE, BLAZING THROUGHOUT THE LAND,

CHORUS
በኤፍራታ ምድር፣ በቤተልሔም (፪)
BE EFRATA MEDER BE''BETELHEM(2)
ጌታ ተወለደ፣ ከድንግል ማርያም (፪)
GETA TEWELEDE KE''DENGEL MARYAM(2)

VERSE 4
A SIGHT THAT SHOOK THEIR HEARTS, TOO TREMBLING TO WITHSTAND.
HEAVEN’S HOSTS OF ANGELS APPEARED IN SUDDEN LIGHT,
IN ONE ACCORD THEY SANG WITH THE SHEPHERDS THAT NIGHT;
GLORY BE TO THE LORD IN THE HIGHEST HEAVEN,

CHORUS
በኤፍራታ ምድር፣ በቤተልሔም (፪)
BE EFRATA MEDER BE''BETELHEM(2)
ጌታ ተወለደ፣ ከድንግል ማርያም (፪)
GETA TEWELEDE KE''DENGEL MARYAM(2)

VERSE 5
AND PEACE UNTO MANKIND, TO THOSE IN HIS FAVOR.
TO BETHLEHEM THEY WENT, THEY HAILED THE NEWBORN LORD
IN THE MANGER HE''S FOUND, WITHIN HIS MOTHER’S HOLD
THE SHEPHERDS SPREAD THE WORD—THE ANGELS’ SONG THEY’D HEARD;

CHORUS
በኤፍራታ ምድር፣ በቤተልሔም (፪)
BE EFRATA MEDER BE''BETELHEM(2)
ጌታ ተወለደ፣ ከድንግል ማርያም (፪)
GETA TEWELEDE KE''DENGEL MARYAM(2)

VERSE 6
WITH THEIR HEARTS FULL OF PRAISE, THEY GLORIFIED THEIR GOD.
GOOD NEWS OF JOY FOR ALL, THE PEOPLE OF THE LORD;
IN DAVID’S HOLY TOWN, THE SAVIOR HAS BEEN BORN.
THEY LOOKED IN THE MANGER, THE CHILD WITH HIS MOTHER;

CHORUS
በኤፍራታ ምድር፣ በቤተልሔም (፪)
BE EFRATA MEDER BE''BETELHEM(2)
ጌታ ተወለደ፣ ከድንግል ማርያም (፪)
GETA TEWELEDE KE''DENGEL MARYAM(2)

VERSE 7
FOR HE IS THE SIGN OF SALVATION OF THE WORLD.

CHORUS
በኤፍራታ ምድር፣ በቤተልሔም (፪)
BE EFRATA MEDER BE''BETELHEM(2)
ጌታ ተወለደ፣ ከድንግል ማርያም (፪)
GETA TEWELEDE KE''DENGEL MARYAM(2)',
      lyrics_transliteration = 'CHORUS
Beefrata midr, bebetelhem (2)
BE EFRATA MEDER BE''BETELHEM (2)
Geta tewelede, kedngl Maryam (2)
GETA TEWELEDE KE''DENGEL MARYAM (2)

VERSE 1
Birhanawiw kokeb kesemay ziq ale (2)
BERHANAWIW KOKEB KE''SEMAY ZEK ALE (2)
Fit’retm zemere “Halleluya” eyale (2)
FETRETM ZEMERE HALE LUYA EYALE (2)

CHORUS
Beefrata midr, bebetelhem (2)
BE EFRATA MEDER BE''BETELHEM (2)
Geta tewelede, kedngl Maryam (2)
GETA TEWELEDE KE''DENGEL MARYAM (2)

VERSE 2
IN THE LAND OF EPHRATAH, IN BETHLEHEM’S CITY (×2),
THE SAVIOR HAS BEEN BORN, FROM SAINT VIRGIN MARY, (×2)
THE LUMINOUS STAR CAME, DESCENDING FROM THE SKY (×2)
ALL CREATURES PRAISED THE LORD, “HALLELUJAH” THEY SANG /CRIED.

CHORUS
Beefrata midr, bebetelhem (2)
BE EFRATA MEDER BE''BETELHEM (2)
Geta tewelede, kedngl Maryam (2)
GETA TEWELEDE KE''DENGEL MARYAM (2)

VERSE 3
HALLELUJAH” THEY CRIED.
AS THE SHEPHERDS HERDED THEIR FLOCKS DURING THE NIGHT,
THEY HEARD THE GOOD TIDINGS DESCENDING FROM THE HEIGHT
THE ANGEL’S GLORY SHONE, BLAZING THROUGHOUT THE LAND,

CHORUS
Beefrata midr, bebetelhem (2)
BE EFRATA MEDER BE''BETELHEM (2)
Geta tewelede, kedngl Maryam (2)
GETA TEWELEDE KE''DENGEL MARYAM (2)

VERSE 4
A SIGHT THAT SHOOK THEIR HEARTS, TOO TREMBLING TO WITHSTAND.
HEAVEN’S HOSTS OF ANGELS APPEARED IN SUDDEN LIGHT,
IN ONE ACCORD THEY SANG WITH THE SHEPHERDS THAT NIGHT;
GLORY BE TO THE LORD IN THE HIGHEST HEAVEN,

CHORUS
Beefrata midr, bebetelhem (2)
BE EFRATA MEDER BE''BETELHEM (2)
Geta tewelede, kedngl Maryam (2)
GETA TEWELEDE KE''DENGEL MARYAM (2)

VERSE 5
AND PEACE UNTO MANKIND, TO THOSE IN HIS FAVOR.
TO BETHLEHEM THEY WENT, THEY HAILED THE NEWBORN LORD
IN THE MANGER HE''S FOUND, WITHIN HIS MOTHER’S HOLD
THE SHEPHERDS SPREAD THE WORD—THE ANGELS’ SONG THEY’D HEARD;

CHORUS
Beefrata midr, bebetelhem (2)
BE EFRATA MEDER BE''BETELHEM (2)
Geta tewelede, kedngl Maryam (2)
GETA TEWELEDE KE''DENGEL MARYAM (2)

VERSE 6
WITH THEIR HEARTS FULL OF PRAISE, THEY GLORIFIED THEIR GOD.
GOOD NEWS OF JOY FOR ALL, THE PEOPLE OF THE LORD;
IN DAVID’S HOLY TOWN, THE SAVIOR HAS BEEN BORN.
THEY LOOKED IN THE MANGER, THE CHILD WITH HIS MOTHER;

CHORUS
Beefrata midr, bebetelhem (2)
BE EFRATA MEDER BE''BETELHEM (2)
Geta tewelede, kedngl Maryam (2)
GETA TEWELEDE KE''DENGEL MARYAM (2)

VERSE 7
FOR HE IS THE SIGN OF SALVATION OF THE WORLD.

CHORUS
Beefrata midr, bebetelhem (2)
BE EFRATA MEDER BE''BETELHEM (2)
Geta tewelede, kedngl Maryam (2)
GETA TEWELEDE KE''DENGEL MARYAM (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'in-the-land-of-ephrathah'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በኤፍራታ ምድር፣ በቤተልሔም (፪)
BE EFRATA MEDER BE''BETELHEM(2)
ጌታ ተወለደ፣ ከድንግል ማርያም (፪)
GETA TEWELEDE KE''DENGEL MARYAM(2)

VERSE 1
ብርሃናዊው ኮከብ ከሰማይ ዝቅ አለ (፪)
BERHANAWIW KOKEB KE''SEMAY ZEK ALE(2)
ፍጥረትም ዘመረ “ሃሌ ሉያ” እያለ (፪)
FETRETM ZEMERE HALE LUYA EYALE (2)

VERSE 2
IN THE LAND OF EPHRATAH, IN BETHLEHEM’S CITY (×2),
THE SAVIOR HAS BEEN BORN, FROM SAINT VIRGIN MARY, (×2)
THE LUMINOUS STAR CAME, DESCENDING FROM THE SKY (×2)
ALL CREATURES PRAISED THE LORD, “HALLELUJAH” THEY SANG /CRIED.

VERSE 3
HALLELUJAH” THEY CRIED.
AS THE SHEPHERDS HERDED THEIR FLOCKS DURING THE NIGHT,
THEY HEARD THE GOOD TIDINGS DESCENDING FROM THE HEIGHT
THE ANGEL’S GLORY SHONE, BLAZING THROUGHOUT THE LAND,

VERSE 4
A SIGHT THAT SHOOK THEIR HEARTS, TOO TREMBLING TO WITHSTAND.
HEAVEN’S HOSTS OF ANGELS APPEARED IN SUDDEN LIGHT,
IN ONE ACCORD THEY SANG WITH THE SHEPHERDS THAT NIGHT;
GLORY BE TO THE LORD IN THE HIGHEST HEAVEN,

VERSE 5
AND PEACE UNTO MANKIND, TO THOSE IN HIS FAVOR.
TO BETHLEHEM THEY WENT, THEY HAILED THE NEWBORN LORD
IN THE MANGER HE''S FOUND, WITHIN HIS MOTHER’S HOLD
THE SHEPHERDS SPREAD THE WORD—THE ANGELS’ SONG THEY’D HEARD;

VERSE 6
WITH THEIR HEARTS FULL OF PRAISE, THEY GLORIFIED THEIR GOD.
GOOD NEWS OF JOY FOR ALL, THE PEOPLE OF THE LORD;
IN DAVID’S HOLY TOWN, THE SAVIOR HAS BEEN BORN.
THEY LOOKED IN THE MANGER, THE CHILD WITH HIS MOTHER;

VERSE 7
FOR HE IS THE SIGN OF SALVATION OF THE WORLD.'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Beefrata midr, bebetelhem (2)
BE EFRATA MEDER BE''BETELHEM (2)
Geta tewelede, kedngl Maryam (2)
GETA TEWELEDE KE''DENGEL MARYAM (2)

VERSE 1
Birhanawiw kokeb kesemay ziq ale (2)
BERHANAWIW KOKEB KE''SEMAY ZEK ALE (2)
Fit’retm zemere “Halleluya” eyale (2)
FETRETM ZEMERE HALE LUYA EYALE (2)

VERSE 2
IN THE LAND OF EPHRATAH, IN BETHLEHEM’S CITY (×2),
THE SAVIOR HAS BEEN BORN, FROM SAINT VIRGIN MARY, (×2)
THE LUMINOUS STAR CAME, DESCENDING FROM THE SKY (×2)
ALL CREATURES PRAISED THE LORD, “HALLELUJAH” THEY SANG /CRIED.

VERSE 3
HALLELUJAH” THEY CRIED.
AS THE SHEPHERDS HERDED THEIR FLOCKS DURING THE NIGHT,
THEY HEARD THE GOOD TIDINGS DESCENDING FROM THE HEIGHT
THE ANGEL’S GLORY SHONE, BLAZING THROUGHOUT THE LAND,

VERSE 4
A SIGHT THAT SHOOK THEIR HEARTS, TOO TREMBLING TO WITHSTAND.
HEAVEN’S HOSTS OF ANGELS APPEARED IN SUDDEN LIGHT,
IN ONE ACCORD THEY SANG WITH THE SHEPHERDS THAT NIGHT;
GLORY BE TO THE LORD IN THE HIGHEST HEAVEN,

VERSE 5
AND PEACE UNTO MANKIND, TO THOSE IN HIS FAVOR.
TO BETHLEHEM THEY WENT, THEY HAILED THE NEWBORN LORD
IN THE MANGER HE''S FOUND, WITHIN HIS MOTHER’S HOLD
THE SHEPHERDS SPREAD THE WORD—THE ANGELS’ SONG THEY’D HEARD;

VERSE 6
WITH THEIR HEARTS FULL OF PRAISE, THEY GLORIFIED THEIR GOD.
GOOD NEWS OF JOY FOR ALL, THE PEOPLE OF THE LORD;
IN DAVID’S HOLY TOWN, THE SAVIOR HAS BEEN BORN.
THEY LOOKED IN THE MANGER, THE CHILD WITH HIS MOTHER;

VERSE 7
FOR HE IS THE SIGN OF SALVATION OF THE WORLD.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'in-the-land-of-ephrathah', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: In Your Temple O Lord (in-your-temple-o-lord)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Be bete mekedese yasadekegn
Ye afayen tibebn yastemarkegn
Ye lijente amlak wedet ale
Kezi alem hasab kinde zale',
      lyrics_english = 'CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 1
Be bete mekedese yasadekegn
ye afayen tibebn yastemarkegn
ye lijente amlak wedet sale
kezi alem hasab kinde zale

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 2
My home is a poorly made creation
Quivering it is the foundation
From the strength of my foes I am exhausted
Alone I’m no longer supported

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 3
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 4
Wasteful I have become rebellious
My sins against you are numerous
Clashing spiritually my path has blurred
Who can reunite me with Your Word

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 5
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 6
You’re the peace that I long for all my years
I’ve written you in my heart with tears
The temptations of this world have chained me
Restore me O Lord and hear my plea

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 7
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 8
Rebels enter your home though unworthy
Touched by your love they receive mercy
From them your kind embrace did not depart
Your warm compassion melted their heart

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 9
In Your Temple O Lord you have raised me
For my tongue you have taught me melody
My God since birth it’s You I desire
From pains of this world I have tired

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 10
Be bete mekedese yasadekegn
ye afayen tibebn yastemarkegn
ye lijente amlak wedet ale
kezi alem hasab kinde zale

CHORUS
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'in-your-temple-o-lord'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Be bete mekedese yasadekegn
Ye afayen tibebn yastemarkegn
Ye lijente amlak wedet ale
Kezi alem hasab kinde zale'
    AND lyrics_english IS NOT DISTINCT FROM 'In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 1
Be bete mekedese yasadekegn
ye afayen tibebn yastemarkegn
ye lijente amlak wedet sale
kezi alem hasab kinde zale

VERSE 2
My home is a poorly made creation
Quivering it is the foundation
From the strength of my foes I am exhausted
Alone I’m no longer supported

VERSE 3
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 4
Wasteful I have become rebellious
My sins against you are numerous
Clashing spiritually my path has blurred
Who can reunite me with Your Word

VERSE 5
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 6
You’re the peace that I long for all my years
I’ve written you in my heart with tears
The temptations of this world have chained me
Restore me O Lord and hear my plea

VERSE 7
In Your Temple O Lord You have raised me
For my tongue you have taught me melody
My God since birth it’s you I desire
From pains of this world I have tired

VERSE 8
Rebels enter your home though unworthy
Touched by your love they receive mercy
From them your kind embrace did not depart
Your warm compassion melted their heart

VERSE 9
In Your Temple O Lord you have raised me
For my tongue you have taught me melody
My God since birth it’s You I desire
From pains of this world I have tired

VERSE 10
Be bete mekedese yasadekegn
ye afayen tibebn yastemarkegn
ye lijente amlak wedet ale
kezi alem hasab kinde zale'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'in-your-temple-o-lord', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Itiyopiyawiw Tsadik (itiyopiyawiw-tsadik)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'itiyopiyawiw-tsadik'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኢትዮጵያዊው ጻድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

VERSE 1
ethiopiawiw tsdaik man new biye teyeku
bereket felige lisalemew nafeku
kibrun limesekir tefeta milase
kedeju derishe fikrun bemekmese

VERSE 2
°°°
በኢቲሳ ምድር ዘር ሆነህ በቅለህ
ተለየህ ለአምላክ ዓለምን ጥለህ
ደብረ ሊባኖስ ህያው ምስክር

VERSE 3
ስላንተ ዝና ስላንተ ክብር
ተክለሃይማኖት ወዳጄ
ተባርኳል ባንተ ጓዳ ደጄ
beetisa midir zer honeh bekleh

VERSE 4
teleyehe lamlak alemin tileh
debrelibanos hiyaw misikir
silante zina silante kibir
teklehaymanot wedaje

VERSE 5
tebarkual bante guada deje
°°°
አክባሪው አምላክ ስላከበረ
ዛሬም ከኛ ጋር በመንፈስ አለ

VERSE 6
ደጅህ እንጠናለን በትህትና
የጻድቅ ጸሎት ኃይል አላትና
ተክለሃይማኖት ጸሃይ
ጸጋህ ይሙላልኝ ከሰማይ

VERSE 7
akbariw amlak silakebereh
zarem kegna gar bemenfes aleh
deji intenalen betihitina
yetsadiku tselot hayl alatina

VERSE 8
teklehaymanot tsehay
tsegah yimulagn kesemay
°°°
ወደ ለምለም መስክ ሰብከህ መራኅን

VERSE 9
የቃሉን ወተት አጠጥተኅን
ያቀጣጠልከው የወንጌል ችቦ
የአምላክ አረገው ትውልዱን ስቦ
ተክለሃይማኖት ወዳጄ

VERSE 10
ተባርኳል ባንተ ቤቴ ደጄ
wede lemlem mesk sebkeh merahen
yekalun wetet atetitehen
yaketatelkew yewengel chibo

VERSE 11
yamlak adirgual tiwlidun sibo
teklehaymanot wedaje
tebarkual bante deje
°°°

VERSE 12
ሰላሳ ስልሳ መቶ ያፈራል
በደብረ አጽቦ ቆመህ በአንድ እግርህ
የመቶሎሜ መሻት ቀረና
የጌታ መንገድ ጥርጊያውም ቀና

VERSE 13
ተክለሃይማኖት ወዳጄ
ተባርኳል ባንተ ጓዳ ደጄ
selasa sisla moto yafera
bedevre atsbo komeh beand argeh

VERSE 14
yemetolomeh mishat kerena
yegeta menged tirgyaum kena
teklehaymanot wedaje
tebarkual bante guada deje'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

VERSE 1
Ethiopiawiw tsdaik man new biye teyeku
Bereket felige lisalemew nafeku
Kibrun limesekir tefeta milase
Kedeju derishe fikrun bemekmese

VERSE 2
°°°
Beitisa midr zer honeh beqleh
Teleyeh leamlak alemn t’leh
Debre libanos hiyaw miskr

VERSE 3
Silante zina silante kibir
Tekle Haymanot wedaje
Tebarkwal bante gwada deje
Beetisa midir zer honeh bekleh

VERSE 4
Teleyehe lamlak alemin tileh
Debrelibanos hiyaw misikir
Silante zina silante kibir
Teklehaymanot wedaje

VERSE 5
Tebarkual bante guada deje
°°°
Akbariw amlak silakebere
Zarem kegna gar bemenfes ale

VERSE 6
Dejh ent’enalen bethtna
Yets’adq ts’elot hayl alatna
Tekle Haymanot ts’ehay
Ts’egah yimulalgn kesemay

VERSE 7
Akbariw amlak silakebereh
Zarem kegna gar bemenfes aleh
Deji intenalen betihitina
Yetsadiku tselot hayl alatina

VERSE 8
Teklehaymanot tsehay
Tsegah yimulagn kesemay
°°°
Wede lemlem mesk sebkeh merahn

VERSE 9
Yeqalun wetet at’et’tehn
Yaqet’at’elkew yewengel chbo
Yeamlak aregew tiwldun sibo
Tekle Haymanot wedaje

VERSE 10
Tebarkwal bante bete deje
Wede lemlem mesk sebkeh merahen
Yekalun wetet atetitehen
Yaketatelkew yewengel chibo

VERSE 11
Yamlak adirgual tiwlidun sibo
Teklehaymanot wedaje
Tebarkual bante deje
°°°

VERSE 12
Selasa silsa meto yaferal
Bedebre ats’bo qomeh beand egrh
Yemetolome meshat qerena
Yegeta menged t’rgiyawm qena

VERSE 13
Tekle Haymanot wedaje
Tebarkwal bante gwada deje
Selasa sisla moto yafera
Bedevre atsbo komeh beand argeh

VERSE 14
Yemetolomeh mishat kerena
Yegeta menged tirgyaum kena
Teklehaymanot wedaje
Tebarkual bante guada deje'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'itiyopiyawiw-tsadik', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Itti hin leeyya''u Angafa Faarfattootaa Dn Firaanol Moosisaa Faarfannaa Durii (itti-hin-leeyya-u-angafa-faarfattootaa-dn-firaanol-moosisaa-faarfannaa-d)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'itti-hin-leeyya-u-angafa-faarfattootaa-dn-firaanol-moosisaa-faarfannaa-d'
    AND lyrics_amharic IS NOT DISTINCT FROM 'Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 1
Argeetan si hubadhee xibraados gamasittii
Ati abba hundumaa sorraa gabaa shaniitii
Amala nama hundaa si qofatu danda''aa
Waaqolii hundaa keessaa maaltu hamma kee gahaa

VERSE 2
Maltuu hamma ke gahaa
Bari''a lafaa ka''ee gara keetii fiiguun koo
Iccitii gara kootii hiike sitti himachuun koo
Mana keeti na fiddee yaa waaq situ na tiksee

VERSE 3
Gooftaa si faarfachuun koo hundaa na dagachiisee
Hundumaa na dhiisisee
Maalinuu sin qixxeessu hundaarran si fo''adhaa
Jaalala keet naaf addaa kanaaf si mararafadha

VERSE 4
Sagantaa koo si qofa hin karoorsu kan biraa
Manni kees mana kootii gaddisa bara baraa
Galgalli koo si biraa
Addunyaan waa''ee keetii dhiphatte walrakkisaa

VERSE 5
Inno ilma yooseffi tokko raajota keessa
Ati ija koo naaf bannaan Si hubadheera gooftaa
Sagalee hundaa uumte ilma waaqa jiraataa
Elshaadayidha gofta'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Itti hin leeyya''u kanan amaneen beeka
Hin ariifadhuu kennaa harka isaan eega
Ittinan tolaa isa sansaaka koo
Karaadhaafdhugaa iyyasuus jirreenyiikoo

VERSE 1
Argeetan si hubadhee xibraados gamasittii
Ati abba hundumaa sorraa gabaa shaniitii
Amala nama hundaa si qofatu danda''aa
Waaqolii hundaa keessaa maaltu hamma kee gahaa

VERSE 2
Maltuu hamma ke gahaa
Bari''a lafaa ka''ee gara keetii fiiguun koo
Iccitii gara kootii hiike sitti himachuun koo
Mana keeti na fiddee yaa waaq situ na tiksee

VERSE 3
Gooftaa si faarfachuun koo hundaa na dagachiisee
Hundumaa na dhiisisee
Maalinuu sin qixxeessu hundaarran si fo''adhaa
Jaalala keet naaf addaa kanaaf si mararafadha

VERSE 4
Sagantaa koo si qofa hin karoorsu kan biraa
Manni kees mana kootii gaddisa bara baraa
Galgalli koo si biraa
Addunyaan waa''ee keetii dhiphatte walrakkisaa

VERSE 5
Inno ilma yooseffi tokko raajota keessa
Ati ija koo naaf bannaan Si hubadheera gooftaa
Sagalee hundaa uumte ilma waaqa jiraataa
Elshaadayidha gofta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'itti-hin-leeyya-u-angafa-faarfattootaa-dn-firaanol-moosisaa-faarfannaa-d', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Iyaqem we Hana (iyaqem-we-hana)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኢያቄም ወሐና እናት አባትሽ
ቤተ እግዚአብሔር ወስደው ስለት የሰጡሽ
መና ከሰማያት የወረደልሽ
እፁብ ድንቅ የሆንሽ ማርያም አንች ነሽ /2/

VERSE 1
ኦ (4) እመ ክርስቶስ
ማርያም አንቺ ነሽ (2)

CHORUS
ኢያቄም ወሐና እናት አባትሽ
ቤተ እግዚአብሔር ወስደው ስለት የሰጡሽ
መና ከሰማያት የወረደልሽ
እፁብ ድንቅ የሆንሽ ማርያም አንች ነሽ /2/',
      lyrics_transliteration = 'CHORUS
Iyaqem we Hana enat abatish
Bete Egziabher wesdew silet yesetush
Mena ke-semayat yeweredeilish
Etsub dink yehonish Mariyam anchi nesh (2)

VERSE 1
O (4) Emme Kristos
Mariyam anchi nesh (2)

CHORUS
Iyaqem we Hana enat abatish
Bete Egziabher wesdew silet yesetush
Mena ke-semayat yeweredeilish
Etsub dink yehonish Mariyam anchi nesh (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'iyaqem-we-hana'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኢያቄም ወሐና እናት አባትሽ
ቤተ እግዚአብሔር ወስደው ስለት የሰጡሽ
መና ከሰማያት የወረደልሽ
እፁብ ድንቅ የሆንሽ ማርያም አንች ነሽ /2/

VERSE 1
ኦ (4) እመ ክርስቶስ
ማርያም አንቺ ነሽ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Iyaqem we Hana enat abatish
Bete Egziabher wesdew silet yesetush
Mena ke-semayat yeweredeilish
Etsub dink yehonish Mariyam anchi nesh (2)

VERSE 1
O (4) Emme Kristos
Mariyam anchi nesh (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'iyaqem-we-hana', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Iyesus Diyakon Zemari Enidale Dereje (iyesus-diyakon-zemari-enidale-dereje)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 1
እርሱ ነው ክርስቶስ
ይኸው ቀረ ወደ ኃላ የውርደት ሞት
ተሰበረ የሲዖል ደጅ ደሙ ወርሶት
የድል ዜማ የድል ቅኔ ለእርሱ ክብር

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 2
ስለወጣሁ እጄን ይዞ ከመቃብር
በራስ ቅል ላይ አለ ክብር የማልገልጸው
አሳዳጁን ያንን ዘንዶ የረገጠው
ተተከለ ልዩ መውደድ በልቤ ላይ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 3
የማይጠልቀው ተሰቅሎልኝ ልዩ ፀሐይ
አርክቶኛል ተጠምቶልኝ ደሙን አፍስሶ
ህይወት ሆኗል በእኔ ፈንታ እርሱ ተከሶ
ሰላሜ ነው የኔ ተስፋ የኔ ክብር

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 4
የእግዚአብሔር ልጅ መድኃኒቴ እግዚአብሔር
የቻለኝን ሁሌም ሳስብ ያንን ፍቅር
ያወጣኝን ነጥቆ ልጁን ከሞት ሐገር
ከዚም ያልፋል ለኔ ያየው የኔ ጌታ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 5
አውሎኛል ማዕረግ ሆኖ በከፍታ
ድል ተነሳ ሞት ስልጣኑ ማሸነፉ
የአማኑኤል የአምላኬ ነው አሁንም ሰልፉ
ከእንግዲህማ ልቤ አይሰጋም በሞት ወሬ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 6
የበጉ ደም ታትሞብኝ በግንባሬ
ማን ሊዘጋው አሁን ያንን የጽድቅ በር
ዋጋ ከፍሎ ዋጅቶኝ አቁሞኝ በክብር
ገለል ብሏል ከሳሽ ላይቆም ፊትለፊቴ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 7
ስለገዛኝ በደም ዋጋ መድኃኒቴ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር',
      lyrics_transliteration = 'CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 1
Ersu new Kristos
Yiኸw qere wede hala yewrdet mot
Tesebere yesiol dej demu wersot
Yedl zema yedl qine leersu kibir

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 2
Silewet’ahu ejen yizo kemeqabr
Beras qil lay ale kibir yemalgelts’ew
Asadajun yann zendo yereget’ew
Tetekele liyu mewded belbe lay

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 3
Yemayt’elqew teseqlolgn liyu ts’ehey
Arktognal tet’emtolgn demun afsso
Hiywet honwal beene fenta ersu tekeso
Selame new yene tesfa yene kibir

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 4
YeEgziabher lij medhanite Egziabher
Yechalegnn hulem sasb yann fiqr
Yawet’agnn net’qo lijun kemot heger
Kezim yalfal lene yayew yene Geta

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 5
Awlognal maereg hono bekefta
Dil tenesa mot silt’anu mashenefu
YeAmanuel yeamlake new ahunm selfu
Keengdihma libe aysegam bemot were

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 6
Yebegu dem tatmobgn begnbare
Man lizegaw ahun yann yets’dq ber
Waga keflo wajtogn aqumogn bekbr
Gelel bilwal kesash layqom fitlefite

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 7
Silegezagn bedem waga medhanite

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'iyesus-diyakon-zemari-enidale-dereje'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 1
እርሱ ነው ክርስቶስ
ይኸው ቀረ ወደ ኃላ የውርደት ሞት
ተሰበረ የሲዖል ደጅ ደሙ ወርሶት
የድል ዜማ የድል ቅኔ ለእርሱ ክብር

VERSE 2
ስለወጣሁ እጄን ይዞ ከመቃብር
በራስ ቅል ላይ አለ ክብር የማልገልጸው
አሳዳጁን ያንን ዘንዶ የረገጠው
ተተከለ ልዩ መውደድ በልቤ ላይ

VERSE 3
የማይጠልቀው ተሰቅሎልኝ ልዩ ፀሐይ
አርክቶኛል ተጠምቶልኝ ደሙን አፍስሶ
ህይወት ሆኗል በእኔ ፈንታ እርሱ ተከሶ
ሰላሜ ነው የኔ ተስፋ የኔ ክብር

VERSE 4
የእግዚአብሔር ልጅ መድኃኒቴ እግዚአብሔር
የቻለኝን ሁሌም ሳስብ ያንን ፍቅር
ያወጣኝን ነጥቆ ልጁን ከሞት ሐገር
ከዚም ያልፋል ለኔ ያየው የኔ ጌታ

VERSE 5
አውሎኛል ማዕረግ ሆኖ በከፍታ
ድል ተነሳ ሞት ስልጣኑ ማሸነፉ
የአማኑኤል የአምላኬ ነው አሁንም ሰልፉ
ከእንግዲህማ ልቤ አይሰጋም በሞት ወሬ

VERSE 6
የበጉ ደም ታትሞብኝ በግንባሬ
ማን ሊዘጋው አሁን ያንን የጽድቅ በር
ዋጋ ከፍሎ ዋጅቶኝ አቁሞኝ በክብር
ገለል ብሏል ከሳሽ ላይቆም ፊትለፊቴ

VERSE 7
ስለገዛኝ በደም ዋጋ መድኃኒቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 1
Ersu new Kristos
Yiኸw qere wede hala yewrdet mot
Tesebere yesiol dej demu wersot
Yedl zema yedl qine leersu kibir

VERSE 2
Silewet’ahu ejen yizo kemeqabr
Beras qil lay ale kibir yemalgelts’ew
Asadajun yann zendo yereget’ew
Tetekele liyu mewded belbe lay

VERSE 3
Yemayt’elqew teseqlolgn liyu ts’ehey
Arktognal tet’emtolgn demun afsso
Hiywet honwal beene fenta ersu tekeso
Selame new yene tesfa yene kibir

VERSE 4
YeEgziabher lij medhanite Egziabher
Yechalegnn hulem sasb yann fiqr
Yawet’agnn net’qo lijun kemot heger
Kezim yalfal lene yayew yene Geta

VERSE 5
Awlognal maereg hono bekefta
Dil tenesa mot silt’anu mashenefu
YeAmanuel yeamlake new ahunm selfu
Keengdihma libe aysegam bemot were

VERSE 6
Yebegu dem tatmobgn begnbare
Man lizegaw ahun yann yets’dq ber
Waga keflo wajtogn aqumogn bekbr
Gelel bilwal kesash layqom fitlefite

VERSE 7
Silegezagn bedem waga medhanite'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'iyesus-diyakon-zemari-enidale-dereje', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Jesus Orthodox tewahdo mezmur / Zemari Bereket Tikue (jesus-orthodox-tewahdo-mezmur-zemari-bereket-tikue)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 1
ምሕረትካ ግን በዚሑለይ
ኣይፈደኻንን ከም ግብረይ
ምስማዕሲ ሰሚዐ ብዙሕ ብዛዕባኻ
ሎሚ ግን ሪአዮ ትዓቢ ሳህልኻ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 2
ኣድሕነኒ ኢለ ብልበይ ምስ ጸዋዕኩ
ደበኽ ኢኻ ኢልካለይ ቃለይ ከይወዳእኩ
ኣዝ
ኣብቲ ሕሱም ጭንቂ ሰዓት

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 3
ከንቀጥቅጥ ብምሒር ፍርሓት
ከም ውሕጅ ክፈስስ ንብዓተይ
ረዳኢ ኮንካያ ንነብሰይ
ከመይለ ''ርስዖ ትዓቢ ምድሓንካ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 4
ከተናግፈኒ ጉድጓደይ ደፊንካ
ትናይ ሞተይ ኣዋጅ ብኣዋጅ ክትስዕሮ
ሓዘነይ ብሓጎስ ቅጽበት ክትቅይሮ
ኣዝ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 5
ደጊምሲ ናትካ''ያ ሂወተይ
ኣባኻ አግዝኦ ፍቓደይ
ኩል ግዜ ስሌኻ ክምስክር
ንስምካ ከልዕሎ''የ ልዑል

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 6
ተጌሩለዩ''ሞ ኣዝዩ ዓቢ ነገር
ብቓላት ዘይግለጽ ዘደንጹ ተኣምር
ተዘይ ክኣልኩኳ ውዕለትካ ክመልሶ
ከመስግነካ''የ ስምካ ክውድሶ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ',
      lyrics_transliteration = 'CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 1
Mihretka gin bezihuley
Ayfedeኻnn kem gibrey
Mismaesi semia bizuh bizaebaኻ
Lomi gin riayo tiabi sahlኻ

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 2
Adhneni ile bilbey mis ts’ewaeku
Debeኽ iኻ ilkaley qaley keywedaeku
Az
Abti hisum ch’nqi seat

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 3
Kenqet’qt’ bimhir firhat
Kem wihj kifess nibatey
Redai konkaya ninebsey
Kemeyle ''riso tiabi midhanka

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 4
Ketenagfeni gudgwadey definka
Tinay motey awaj biawaj kitsero
Hazeney bihagos qits’bet kitqyro
Az

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 5
Degimsi natka''ya hiwetey
Abaኻ agzo fiቓdey
Kul gize sileኻ kimskr
Nismka kelelo''ye liul

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 6
Tegeruleyu''mo azyu abi neger
Biቓlat zeyglets’ zedents’u teamr
Tezey kialkukwa wieletka kimelso
Kemesgneka''ye simka kiwdso

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'jesus-orthodox-tewahdo-mezmur-zemari-bereket-tikue'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 1
ምሕረትካ ግን በዚሑለይ
ኣይፈደኻንን ከም ግብረይ
ምስማዕሲ ሰሚዐ ብዙሕ ብዛዕባኻ
ሎሚ ግን ሪአዮ ትዓቢ ሳህልኻ

VERSE 2
ኣድሕነኒ ኢለ ብልበይ ምስ ጸዋዕኩ
ደበኽ ኢኻ ኢልካለይ ቃለይ ከይወዳእኩ
ኣዝ
ኣብቲ ሕሱም ጭንቂ ሰዓት

VERSE 3
ከንቀጥቅጥ ብምሒር ፍርሓት
ከም ውሕጅ ክፈስስ ንብዓተይ
ረዳኢ ኮንካያ ንነብሰይ
ከመይለ ''ርስዖ ትዓቢ ምድሓንካ

VERSE 4
ከተናግፈኒ ጉድጓደይ ደፊንካ
ትናይ ሞተይ ኣዋጅ ብኣዋጅ ክትስዕሮ
ሓዘነይ ብሓጎስ ቅጽበት ክትቅይሮ
ኣዝ

VERSE 5
ደጊምሲ ናትካ''ያ ሂወተይ
ኣባኻ አግዝኦ ፍቓደይ
ኩል ግዜ ስሌኻ ክምስክር
ንስምካ ከልዕሎ''የ ልዑል

VERSE 6
ተጌሩለዩ''ሞ ኣዝዩ ዓቢ ነገር
ብቓላት ዘይግለጽ ዘደንጹ ተኣምር
ተዘይ ክኣልኩኳ ውዕለትካ ክመልሶ
ከመስግነካ''የ ስምካ ክውድሶ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 1
Mihretka gin bezihuley
Ayfedeኻnn kem gibrey
Mismaesi semia bizuh bizaebaኻ
Lomi gin riayo tiabi sahlኻ

VERSE 2
Adhneni ile bilbey mis ts’ewaeku
Debeኽ iኻ ilkaley qaley keywedaeku
Az
Abti hisum ch’nqi seat

VERSE 3
Kenqet’qt’ bimhir firhat
Kem wihj kifess nibatey
Redai konkaya ninebsey
Kemeyle ''riso tiabi midhanka

VERSE 4
Ketenagfeni gudgwadey definka
Tinay motey awaj biawaj kitsero
Hazeney bihagos qits’bet kitqyro
Az

VERSE 5
Degimsi natka''ya hiwetey
Abaኻ agzo fiቓdey
Kul gize sileኻ kimskr
Nismka kelelo''ye liul

VERSE 6
Tegeruleyu''mo azyu abi neger
Biቓlat zeyglets’ zedents’u teamr
Tezey kialkukwa wieletka kimelso
Kemesgneka''ye simka kiwdso'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'jesus-orthodox-tewahdo-mezmur-zemari-bereket-tikue', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Jesus, You Are Better // // Zemari Bereket Tikue (jesus-you-are-better-zemari-bereket-tikue)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 1
1፣ ዕዬ ናይ ኣእዳወይ ቀኒዑለይ
ንእሽቶይ ምስ ዓቢ እንተዉረየለይ
ግን ንስኻ ተዘየሎኻ ኣባይ
ትርፎ ድኻም’ዩ እንታይ ይዓብሰለይ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 2
2፣ ምርካብ ምስኣን ንሱስ ጊዛዊ’ዪ
ትርጉም ሂወት ብኡ ኣይልካዕን’ዪ
ህላዉነትካ’ዪ ምንጪ ደስታይ
ዘይጣዐሰሉ ንስኻ ኢኻ ምርጫይ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 3
3፣ ትምክሕቲ ዘበለ ካባይ ይርሓቅ
ኣብ ስጋ ምድጋፍ ካባይ ይርሓቅ
ተማሂረ ኣለኹ ከም ዘወድቅ
ብኣኻ ጥራይ’ዪ ነገረይ ዝጽብቅ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2',
      lyrics_transliteration = 'CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 1
1, eye nay aedawey qeniuley
Nieshtoy mis abi entewureyeley
Gin nisኻ tezeyeloኻ abay
Tirfo diኻm’yu entay yiabseley

CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 2
2, mirkab misan nisus gizawi’yi
Tirgum hiwet biu aylkaen’yi
Hilawunetka’yi minch’i destay
Zeyt’aaselu nisኻ iኻ mirch’ay

CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 3
3, timkhti zebele kabay yirhaq
Ab siga midgaf kabay yirhaq
Temahire aleኹ kem zewedq
Biaኻ t’ray’yi negerey zits’bq

CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'jesus-you-are-better-zemari-bereket-tikue'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 1
1፣ ዕዬ ናይ ኣእዳወይ ቀኒዑለይ
ንእሽቶይ ምስ ዓቢ እንተዉረየለይ
ግን ንስኻ ተዘየሎኻ ኣባይ
ትርፎ ድኻም’ዩ እንታይ ይዓብሰለይ

VERSE 2
2፣ ምርካብ ምስኣን ንሱስ ጊዛዊ’ዪ
ትርጉም ሂወት ብኡ ኣይልካዕን’ዪ
ህላዉነትካ’ዪ ምንጪ ደስታይ
ዘይጣዐሰሉ ንስኻ ኢኻ ምርጫይ

VERSE 3
3፣ ትምክሕቲ ዘበለ ካባይ ይርሓቅ
ኣብ ስጋ ምድጋፍ ካባይ ይርሓቅ
ተማሂረ ኣለኹ ከም ዘወድቅ
ብኣኻ ጥራይ’ዪ ነገረይ ዝጽብቅ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 1
1, eye nay aedawey qeniuley
Nieshtoy mis abi entewureyeley
Gin nisኻ tezeyeloኻ abay
Tirfo diኻm’yu entay yiabseley

VERSE 2
2, mirkab misan nisus gizawi’yi
Tirgum hiwet biu aylkaen’yi
Hilawunetka’yi minch’i destay
Zeyt’aaselu nisኻ iኻ mirch’ay

VERSE 3
3, timkhti zebele kabay yirhaq
Ab siga midgaf kabay yirhaq
Temahire aleኹ kem zewedq
Biaኻ t’ray’yi negerey zits’bq'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'jesus-you-are-better-zemari-bereket-tikue', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: JIREENYADHA. M/K/O/T/ Itoophiyaatti Faarfannaa Afaan Oromoo Hangafa Far.D/N Firaanol Moosisaatiin (jireenyadha-m-k-o-t-itoophiyaatti-faarfannaa-afaan-oromoo-hangafa-far-d)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 1
Guddinni kee jecha koo irra caala
Dur kanan si beeku madaaf dhiigaani michuu koo
Qoma keetti siqee siwaliin oolee bulu koo
Fuula mootii lafaa qullaa dhaabbachuu kee

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 2
Dirraa madooftee du''aaf kennamuu kee
Miti har''a garu (2) kan caaluunan si''arge (2)
Huursaa akka bishaanii sagalee nabutu
Albee arraba lamaan abidda darbatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 3
Addaataa akka cabbii qajjisi mataa kee
Furtuun du''aaf si''ool lachuu jira harka kee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu
Sagalee xumuraan Eelohim yemmuu ati jetttu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 4
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Xumura jaalalaa du''aan gaafa mul''ifte
Miti har''a garu (2) kan caaluunan si''arge (2)
Baattuu ibsaa warqee gidduu kan dhaabbattuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 5
Xiyyoo ija abiddaa calaqqee darbattu
Urjiilee gurguddoos quba keetu lakkaa''ee
Abbaa keen qixxaateee ulfinaan sittu taa''ee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 6
Sagalee xumuraan Eelohim yemmuu ati jetttu
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Dirraa madooftee du''a kan nabaraarte
Miti har''a garu (2) kan caaluunan si''arge (2)

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 7
Utubaa qilleensaa kan galmicha baatu
Simboo ardiif samii bakka Aarsaa guutuu
Leenca Saawwa Risaa Namas kan fakkaatu
Mootii moototaa kiruub irra jiraatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala',
      lyrics_transliteration = 'CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 1
Guddinni kee jecha koo irra caala
Dur kanan si beeku madaaf dhiigaani michuu koo
Qoma keetti siqee siwaliin oolee bulu koo
Fuula mootii lafaa qullaa dhaabbachuu kee

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 2
Dirraa madooftee du''aaf kennamuu kee
Miti har''a garu (2) kan caaluunan si''arge (2)
Huursaa akka bishaanii sagalee nabutu
Albee arraba lamaan abidda darbatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 3
Addaataa akka cabbii qajjisi mataa kee
Furtuun du''aaf si''ool lachuu jira harka kee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu
Sagalee xumuraan Eelohim yemmuu ati jetttu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 4
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Xumura jaalalaa du''aan gaafa mul''ifte
Miti har''a garu (2) kan caaluunan si''arge (2)
Baattuu ibsaa warqee gidduu kan dhaabbattuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 5
Xiyyoo ija abiddaa calaqqee darbattu
Urjiilee gurguddoos quba keetu lakkaa''ee
Abbaa keen qixxaateee ulfinaan sittu taa''ee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 6
Sagalee xumuraan Eelohim yemmuu ati jetttu
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Dirraa madooftee du''a kan nabaraarte
Miti har''a garu (2) kan caaluunan si''arge (2)

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 7
Utubaa qilleensaa kan galmicha baatu
Simboo ardiif samii bakka Aarsaa guutuu
Leenca Saawwa Risaa Namas kan fakkaatu
Mootii moototaa kiruub irra jiraatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'jireenyadha-m-k-o-t-itoophiyaatti-faarfannaa-afaan-oromoo-hangafa-far-d'
    AND lyrics_amharic IS NOT DISTINCT FROM 'Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 1
Guddinni kee jecha koo irra caala
Dur kanan si beeku madaaf dhiigaani michuu koo
Qoma keetti siqee siwaliin oolee bulu koo
Fuula mootii lafaa qullaa dhaabbachuu kee

VERSE 2
Dirraa madooftee du''aaf kennamuu kee
Miti har''a garu (2) kan caaluunan si''arge (2)
Huursaa akka bishaanii sagalee nabutu
Albee arraba lamaan abidda darbatu

VERSE 3
Addaataa akka cabbii qajjisi mataa kee
Furtuun du''aaf si''ool lachuu jira harka kee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu
Sagalee xumuraan Eelohim yemmuu ati jetttu

VERSE 4
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Xumura jaalalaa du''aan gaafa mul''ifte
Miti har''a garu (2) kan caaluunan si''arge (2)
Baattuu ibsaa warqee gidduu kan dhaabbattuu

VERSE 5
Xiyyoo ija abiddaa calaqqee darbattu
Urjiilee gurguddoos quba keetu lakkaa''ee
Abbaa keen qixxaateee ulfinaan sittu taa''ee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu

VERSE 6
Sagalee xumuraan Eelohim yemmuu ati jetttu
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Dirraa madooftee du''a kan nabaraarte
Miti har''a garu (2) kan caaluunan si''arge (2)

VERSE 7
Utubaa qilleensaa kan galmicha baatu
Simboo ardiif samii bakka Aarsaa guutuu
Leenca Saawwa Risaa Namas kan fakkaatu
Mootii moototaa kiruub irra jiraatu'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 1
Guddinni kee jecha koo irra caala
Dur kanan si beeku madaaf dhiigaani michuu koo
Qoma keetti siqee siwaliin oolee bulu koo
Fuula mootii lafaa qullaa dhaabbachuu kee

VERSE 2
Dirraa madooftee du''aaf kennamuu kee
Miti har''a garu (2) kan caaluunan si''arge (2)
Huursaa akka bishaanii sagalee nabutu
Albee arraba lamaan abidda darbatu

VERSE 3
Addaataa akka cabbii qajjisi mataa kee
Furtuun du''aaf si''ool lachuu jira harka kee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu
Sagalee xumuraan Eelohim yemmuu ati jetttu

VERSE 4
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Xumura jaalalaa du''aan gaafa mul''ifte
Miti har''a garu (2) kan caaluunan si''arge (2)
Baattuu ibsaa warqee gidduu kan dhaabbattuu

VERSE 5
Xiyyoo ija abiddaa calaqqee darbattu
Urjiilee gurguddoos quba keetu lakkaa''ee
Abbaa keen qixxaateee ulfinaan sittu taa''ee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu

VERSE 6
Sagalee xumuraan Eelohim yemmuu ati jetttu
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Dirraa madooftee du''a kan nabaraarte
Miti har''a garu (2) kan caaluunan si''arge (2)

VERSE 7
Utubaa qilleensaa kan galmicha baatu
Simboo ardiif samii bakka Aarsaa guutuu
Leenca Saawwa Risaa Namas kan fakkaatu
Mootii moototaa kiruub irra jiraatu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'jireenyadha-m-k-o-t-itoophiyaatti-faarfannaa-afaan-oromoo-hangafa-far-d', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: kab Fikri Christos (kab-fikri-christos)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 1
ከመ ባጊዕ ዝሕረዱ
ናብ ማእሰርቲ ከም ዝወርዱ
ምእንትኡ ተቀቲልና
ግን ትፍቅሩ ኣይለቀና

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 2
ዘሎ ኮነ ተዝመፅእ
በዓል ሓይሊ ትዝገዝእ
ዘይተርኣየ ካሊእ ፍጥረት
ከቶ የለን ፀልማት ወይ ሞት

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 3
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 4
በታ ጎይታ ዘፍቀረና
ካብ ሰዓርቲ በሊፅና ኢና
አብድካምና ሓይልና ኣሎ
በቲ አብ መሰቀል ዝወዓሎ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 5
ፀልማት ኣብኡ አይፅልምትን
ድካም ሰዕረት አይምልከቶን
ሰሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 6
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 7
ፅዬን እያ ኸተማና
ክንኣና እውን ታርሰትና
ብዘይአምኑ ተከቢብና
ጎይታ እግዚአብሔር ነምልኮ ኢና

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 8
ብናይ አበው ቅኑዕ ፍኖት
ሂውታቶም ጌርና አብነት
ንሶም እዬም ዝሰዓሩ
ብእምነቶም ዝነበሩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 9
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 10
በታ ጎይታ ዘፍቀረና
ካብ ስዓርቲበሊፅና ኢና
አብ ድካምና ሓይልና ኣሎ
በቲ አብ መስቀል ዝዋዓሎ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 11
ፀልማት ኣብኡ ኣይፅልምትን
ድካም ስዕረት ኣይምልከቶን
ስሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)',
      lyrics_transliteration = 'CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 1
Keme bagie zihredu
Nab maeserti kem ziwerdu
Mientu teqetilna
Gin tifqru ayleqena

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 2
Zelo kone tezmets’e
Beal hayli tizgeze
Zeyteraye kalie fit’ret
Keto yelen ts’elmat wey mot

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 3
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 4
Beta goyta zefqerena
Kab searti belits’na ina
Abdkamna haylna alo
Beti Ab meseqel ziwealo

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 5
Ts’elmat abu ayts’lmtn
Dikam seeret aymlketon
Semu walta koynna eyu
Baal milue hayli eyu

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 6
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 7
Ts’yen eya ኸtemana
Kinana ewn tarsetna
Bizeyamnu tekebibna
Goyta Egziabher nemlko ina

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 8
Binay abew qinue finot
Hiwtatom gerna abnet
Nisom eyem zisearu
Biemnetom zineberu

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 9
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 10
Beta goyta zefqerena
Kab siartibelits’na ina
Ab dikamna haylna alo
Beti Ab mesqel ziwaalo

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 11
Ts’elmat abu ayts’lmtn
Dikam sieret aymlketon
Simu walta koynna eyu
Baal milue hayli eyu

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kab-fikri-christos'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 1
ከመ ባጊዕ ዝሕረዱ
ናብ ማእሰርቲ ከም ዝወርዱ
ምእንትኡ ተቀቲልና
ግን ትፍቅሩ ኣይለቀና

VERSE 2
ዘሎ ኮነ ተዝመፅእ
በዓል ሓይሊ ትዝገዝእ
ዘይተርኣየ ካሊእ ፍጥረት
ከቶ የለን ፀልማት ወይ ሞት

VERSE 3
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

VERSE 4
በታ ጎይታ ዘፍቀረና
ካብ ሰዓርቲ በሊፅና ኢና
አብድካምና ሓይልና ኣሎ
በቲ አብ መሰቀል ዝወዓሎ

VERSE 5
ፀልማት ኣብኡ አይፅልምትን
ድካም ሰዕረት አይምልከቶን
ሰሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ

VERSE 6
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

VERSE 7
ፅዬን እያ ኸተማና
ክንኣና እውን ታርሰትና
ብዘይአምኑ ተከቢብና
ጎይታ እግዚአብሔር ነምልኮ ኢና

VERSE 8
ብናይ አበው ቅኑዕ ፍኖት
ሂውታቶም ጌርና አብነት
ንሶም እዬም ዝሰዓሩ
ብእምነቶም ዝነበሩ

VERSE 9
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

VERSE 10
በታ ጎይታ ዘፍቀረና
ካብ ስዓርቲበሊፅና ኢና
አብ ድካምና ሓይልና ኣሎ
በቲ አብ መስቀል ዝዋዓሎ

VERSE 11
ፀልማት ኣብኡ ኣይፅልምትን
ድካም ስዕረት ኣይምልከቶን
ስሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 1
Keme bagie zihredu
Nab maeserti kem ziwerdu
Mientu teqetilna
Gin tifqru ayleqena

VERSE 2
Zelo kone tezmets’e
Beal hayli tizgeze
Zeyteraye kalie fit’ret
Keto yelen ts’elmat wey mot

VERSE 3
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

VERSE 4
Beta goyta zefqerena
Kab searti belits’na ina
Abdkamna haylna alo
Beti Ab meseqel ziwealo

VERSE 5
Ts’elmat abu ayts’lmtn
Dikam seeret aymlketon
Semu walta koynna eyu
Baal milue hayli eyu

VERSE 6
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

VERSE 7
Ts’yen eya ኸtemana
Kinana ewn tarsetna
Bizeyamnu tekebibna
Goyta Egziabher nemlko ina

VERSE 8
Binay abew qinue finot
Hiwtatom gerna abnet
Nisom eyem zisearu
Biemnetom zineberu

VERSE 9
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

VERSE 10
Beta goyta zefqerena
Kab siartibelits’na ina
Ab dikamna haylna alo
Beti Ab mesqel ziwaalo

VERSE 11
Ts’elmat abu ayts’lmtn
Dikam sieret aymlketon
Simu walta koynna eyu
Baal milue hayli eyu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kab-fikri-christos', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kalh sineger lisma mk mahbere kidusan tr3 (kalh-sineger-lisma-mk-mahbere-kidusan-tr3)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/

VERSE 1
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/

CHORUS
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/',
      lyrics_transliteration = 'CHORUS
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)

VERSE 1
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)

CHORUS
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kalh-sineger-lisma-mk-mahbere-kidusan-tr3'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/

VERSE 1
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)

VERSE 1
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kalh-sineger-lisma-mk-mahbere-kidusan-tr3', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kaln Lemwled (kaln-lemwled)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ቃልን ለመውለድ ከአብ ዘንድ ሞገስ ያገኘሽ (2)
የሐና ልጅ ነሽ የኢያቄም እፁብ ድንቅ ነሽ (2)

VERSE 1
የሀዘን የለቅሶ ሆነ ኑሮዬ
የልጅሽ ፍጥረት ተጎሳቁዬ
ሞገድ ማዕበል እንዳይውጠኝ
ልቤን በእምነት ደግፊልኝ

CHORUS
ቃልን ለመውለድ ከአብ ዘንድ ሞገስ ያገኘሽ (2)
የሐና ልጅ ነሽ የኢያቄም እፁብ ድንቅ ነሽ (2)

VERSE 2
ቆሜ ልሳለም ከስዕልሽ ፊት
ፍቅር ትህትናን እንድማርበት
የፀጋ ስግደት ልስገድልሽ
የጌታዬ እናት ልሁን ባርያሽ

CHORUS
ቃልን ለመውለድ ከአብ ዘንድ ሞገስ ያገኘሽ (2)
የሐና ልጅ ነሽ የኢያቄም እፁብ ድንቅ ነሽ (2)

VERSE 3
የዳዊት ልጅ ሆይ ቁሚ ከጎኔ
ወደ መስቀሉ ይመልከት ዓይኔ
የሌዊ ልጅ ሆይ አይዞሽ /አይዞህ በይኝ
የሥጋ ድካም እንዳይጎዳኝ

CHORUS
ቃልን ለመውለድ ከአብ ዘንድ ሞገስ ያገኘሽ (2)
የሐና ልጅ ነሽ የኢያቄም እፁብ ድንቅ ነሽ (2)',
      lyrics_transliteration = 'CHORUS
Kaln lemewled keAb zend moges yagegnesh (2)
YeHana liji nesh yeEyakem etsub dink nesh (2)

VERSE 1
Yehazen yeleqso hone nuroye
Yelijish fitret tegosaquye
Moged maebel endaywutegn
Liben bemnet degfilign

CHORUS
Kaln lemewled keAb zend moges yagegnesh (2)
YeHana liji nesh yeEyakem etsub dink nesh (2)

VERSE 2
Qome lsalem keSielish fit
Fikir tihitinan endimarbet
Yetsega sigdet lisgedilish
Yegetaye enat lihun bariyash

CHORUS
Kaln lemewled keAb zend moges yagegnesh (2)
YeHana liji nesh yeEyakem etsub dink nesh (2)

VERSE 3
YeDawit lij hoy qumi kegone
Wede meskelu yimelket ayine
YeLewi lij hoy ayizosh / ayizoh beyign
Yesiga dikam endaygodagn

CHORUS
Kaln lemewled keAb zend moges yagegnesh (2)
YeHana liji nesh yeEyakem etsub dink nesh (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kaln-lemwled'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ቃልን ለመውለድ ከአብ ዘንድ ሞገስ ያገኘሽ (2)
የሐና ልጅ ነሽ የኢያቄም እፁብ ድንቅ ነሽ (2)

VERSE 1
የሀዘን የለቅሶ ሆነ ኑሮዬ
የልጅሽ ፍጥረት ተጎሳቁዬ
ሞገድ ማዕበል እንዳይውጠኝ
ልቤን በእምነት ደግፊልኝ

VERSE 2
ቆሜ ልሳለም ከስዕልሽ ፊት
ፍቅር ትህትናን እንድማርበት
የፀጋ ስግደት ልስገድልሽ
የጌታዬ እናት ልሁን ባርያሽ

VERSE 3
የዳዊት ልጅ ሆይ ቁሚ ከጎኔ
ወደ መስቀሉ ይመልከት ዓይኔ
የሌዊ ልጅ ሆይ አይዞሽ /አይዞህ በይኝ
የሥጋ ድካም እንዳይጎዳኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kaln lemewled keAb zend moges yagegnesh (2)
YeHana liji nesh yeEyakem etsub dink nesh (2)

VERSE 1
Yehazen yeleqso hone nuroye
Yelijish fitret tegosaquye
Moged maebel endaywutegn
Liben bemnet degfilign

VERSE 2
Qome lsalem keSielish fit
Fikir tihitinan endimarbet
Yetsega sigdet lisgedilish
Yegetaye enat lihun bariyash

VERSE 3
YeDawit lij hoy qumi kegone
Wede meskelu yimelket ayine
YeLewi lij hoy ayizosh / ayizoh beyign
Yesiga dikam endaygodagn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kaln-lemwled', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: kanesagn kafer ketbiya (kanesagn-kafer-ketbiya)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kanesagn-kafer-ketbiya'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 1
ስደተኛ ሰው ብሆን
አልተለየኝም ልጁን
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና

VERSE 2
ተነዋወጠ ወይኒው
በመዝሙር ሳወደሰው
የእጄን ሰንሰለት የፈታ
ብዙ ነው ስራው የጌታ

VERSE 3
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና
አይቻለሁ እጁን
አብርቶኛል ፊቱን

VERSE 4
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega

VERSE 1
Sidetegna sew bihon
Alteleyegnm lijun
Kebete giba memhru efewesalehu bet’ena
Yehywet ras medhanit yenefse kibir nehna

VERSE 2
Tenewawet’e weyniw
Bemezmur sawedesew
Yeejen senselet yefeta
Bizu new siraw yegeta

VERSE 3
Kebete giba memhru efewesalehu bet’ena
Yehywet ras medhanit yenefse kibir nehna
Aychalehu ejun
Abrtognal fitun

VERSE 4
Belul t’la sinor
Wesen belelew fiqr
Kebete giba memhru efewesalehu bet’ena
Yehywet ras medhanit yenefse kibir nehna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kanesagn-kafer-ketbiya', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kanesagn Kafer Ketibiya//belikesiyuman (kanesagn-kafer-ketibiya-belikesiyuman)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 2
አልተለየኝም ልጁን
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 3
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 4
የእጄን ሰንሰለት የፈታ
ብዙ ነው ሥራው የጌታ
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 5
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
አይቻለሁኝ እጁን

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 6
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር
ከቤቴ ግባ መምህሩ

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 7
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)',
      lyrics_transliteration = 'CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 1
CHORUS
Yeanbesochn af yezega
Enen lemadan yetega
Sidetegna sew bihonm

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 2
Alteleyegnm lijun
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 3
Yenefse kibir nehna
CHORUS
Tenewawet’e weyniw
Bemezmur sawedsew

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 4
Yeejen senselet yefeta
Bizu new siraw yegeta
Kebete giba memhru
Efewesalehu bet’ena

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 5
Yehywet ras medhanit
Yenefse kibir nehna
CHORUS
Aychalehugn ejun

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 6
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr
Kebete giba memhru

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 7
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kanesagn-kafer-ketibiya-belikesiyuman'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም

VERSE 2
አልተለየኝም ልጁን
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት

VERSE 3
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው

VERSE 4
የእጄን ሰንሰለት የፈታ
ብዙ ነው ሥራው የጌታ
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና

VERSE 5
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
አይቻለሁኝ እጁን

VERSE 6
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር
ከቤቴ ግባ መምህሩ

VERSE 7
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 1
Yeanbesochn af yezega
Enen lemadan yetega
Sidetegna sew bihonm

VERSE 2
Alteleyegnm lijun
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit

VERSE 3
Yenefse kibir nehna
Tenewawet’e weyniw
Bemezmur sawedsew

VERSE 4
Yeejen senselet yefeta
Bizu new siraw yegeta
Kebete giba memhru
Efewesalehu bet’ena

VERSE 5
Yehywet ras medhanit
Yenefse kibir nehna
Aychalehugn ejun

VERSE 6
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr
Kebete giba memhru

VERSE 7
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kanesagn-kafer-ketibiya-belikesiyuman', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kanesagn keafer ketbiya by D/n Begna Girma (kanesagn-keafer-ketbiya-by-d-n-begna-girma)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 1
የአምበሶቹን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም
አልተለየኝም ልጁን

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 2
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 3
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው
የእጄን ሰንሰለት የፈታ
ብዙ ነው ስራው የጌታ

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 4
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 5
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 6
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 7
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 8
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት',
      lyrics_transliteration = 'CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 1
Yeambesochun af yezega
Enen lemadan yetega
Sidetegna sew bihonm
Alteleyegnm lijun

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 2
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 3
Tenewawet’e weyniw
Bemezmur sawedsew
Yeejen senselet yefeta
Bizu new siraw yegeta

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 4
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 5
Aychalehugn ejun
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 6
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 7
Aychalehugn ejun
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 8
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kanesagn-keafer-ketbiya-by-d-n-begna-girma'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 1
የአምበሶቹን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም
አልተለየኝም ልጁን

VERSE 2
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

VERSE 3
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው
የእጄን ሰንሰለት የፈታ
ብዙ ነው ስራው የጌታ

VERSE 4
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

VERSE 5
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

VERSE 6
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

VERSE 7
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

VERSE 8
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 1
Yeambesochun af yezega
Enen lemadan yetega
Sidetegna sew bihonm
Alteleyegnm lijun

VERSE 2
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

VERSE 3
Tenewawet’e weyniw
Bemezmur sawedsew
Yeejen senselet yefeta
Bizu new siraw yegeta

VERSE 4
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

VERSE 5
Aychalehugn ejun
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr

VERSE 6
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

VERSE 7
Aychalehugn ejun
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr

VERSE 8
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kanesagn-keafer-ketbiya-by-d-n-begna-girma', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kanite Yehone Melikam New (kanite-yehone-melikam-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 1
ለምለሙን እንጀራ ስቡን ብታበቅልም
በሙላት ወጥታችሁ ባዶ አትመለሱ
የእስራኤልን ቅዱስ ቃል ኪዳን አስታውሱ
ሩት አትለፊ የቦኤዝን እርሻ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 2
ጌታ ፈቅዶልሻል የእንጀራሽን ድርሻ
ያለኝ ይበቃኛል ብለው ለሚያምኑት
እጅግ አትርፈዋል ሰላም በረከት
እስማኤል አይደለም የእግዚአብሔር ስጦታ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 3
አብርሃም ሆይ ጽና ባለህበት ቦታ
ሰላም እናፍቅር ይዞ የሚመጣው
ይስሐቅ ይወለዳል ቢዘገይም ጊዜው
ሰዶም ብታበቅልም ለምለሙን ቄጤማ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 4
ለእግዚአብሔር ልጆች ነች የማትስማማ
ድንጋይ እንኳን ቢመስል የአብርሃም ርስት
ጠግበዋል ልጆቹ ማርና ወተት

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም',
      lyrics_transliteration = 'CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 1
Lemlemun enjera sibun bitabeqlm
Bemulat wet’tachhu bado atmelesu
Yeesraeln Kidus qal kidan astawsu
Rut atlefi yeboezn ersha

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 2
Geta feqdolshal yeenjerashn dirsha
Yalegn yibeqagnal bilew lemiyamnut
Ejg atrfewal selam bereket
Esmael aydelem yeEgziabher sit’ota

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 3
Abrham hoy ts’na balehbet bota
Selam enafqr yizo yemimet’aw
Yisheq yiweledal bizegeym gizew
Sedom bitabeqlm lemlemun qet’ema

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 4
LeEgziabher lijoch nech yematsmama
Dingay enkwan bimesl yeabrham rist
T’egbewal lijochu marna wetet

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kanite-yehone-melikam-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 1
ለምለሙን እንጀራ ስቡን ብታበቅልም
በሙላት ወጥታችሁ ባዶ አትመለሱ
የእስራኤልን ቅዱስ ቃል ኪዳን አስታውሱ
ሩት አትለፊ የቦኤዝን እርሻ

VERSE 2
ጌታ ፈቅዶልሻል የእንጀራሽን ድርሻ
ያለኝ ይበቃኛል ብለው ለሚያምኑት
እጅግ አትርፈዋል ሰላም በረከት
እስማኤል አይደለም የእግዚአብሔር ስጦታ

VERSE 3
አብርሃም ሆይ ጽና ባለህበት ቦታ
ሰላም እናፍቅር ይዞ የሚመጣው
ይስሐቅ ይወለዳል ቢዘገይም ጊዜው
ሰዶም ብታበቅልም ለምለሙን ቄጤማ

VERSE 4
ለእግዚአብሔር ልጆች ነች የማትስማማ
ድንጋይ እንኳን ቢመስል የአብርሃም ርስት
ጠግበዋል ልጆቹ ማርና ወተት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 1
Lemlemun enjera sibun bitabeqlm
Bemulat wet’tachhu bado atmelesu
Yeesraeln Kidus qal kidan astawsu
Rut atlefi yeboezn ersha

VERSE 2
Geta feqdolshal yeenjerashn dirsha
Yalegn yibeqagnal bilew lemiyamnut
Ejg atrfewal selam bereket
Esmael aydelem yeEgziabher sit’ota

VERSE 3
Abrham hoy ts’na balehbet bota
Selam enafqr yizo yemimet’aw
Yisheq yiweledal bizegeym gizew
Sedom bitabeqlm lemlemun qet’ema

VERSE 4
LeEgziabher lijoch nech yematsmama
Dingay enkwan bimesl yeabrham rist
T’egbewal lijochu marna wetet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kanite-yehone-melikam-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ke Dejeh Siders (ke-dejeh-siders)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ke-dejeh-siders'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከደጅህ ስደርስ ልቤ ይመታል
ወደ ማደሪያህ እግሬ ተነስቷል
ኦጌታዬ ሆይ(3) ልቤአንተን ይመኛል
ህይወቴን ላንተ ልሰጥ መጣሁ

VERSE 1
ለኃጢያቴ ይቅርታ ካንተ እሻለሁ
ኦጌታዬ ሆይ(3) መንገድህን አሳየኝ
የአንተ መንገድ እጅግ ይከብዳል
የጽድቅህ ፈተና ማለፍ ይጠይቃል

VERSE 2
ኦጌታዬ ሆይ(3) ጥበቃህ ይደንቃል
ደካማ ብሆን በራሴ ባልችለውም
አንተ በኔ ካለህ ድል አደርገዋለሁ
ኦጌታዬ ሆይ(3) አሸንፈዋለሁ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kedejh siders libe yimetal
Wede maderiyah egre tenestwal
Ogetaye hoy (3) libeanten yimegnal
Hiyweten lante liset’ met’ahu

VERSE 1
Lehat’iyate yiqrta kante eshalehu
Ogetaye hoy (3) mengedhn asayegn
Yeante menged ejg yikebdal
Yets’dqh fetena malef yit’eyqal

VERSE 2
Ogetaye hoy (3) t’beqah yidenqal
Dekama bihon berase balchlewm
Ante bene kaleh dil adergewalehu
Ogetaye hoy (3) ashenfewalehu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ke-dejeh-siders', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: KeGetaye Feqir Yemileyegn Manew (ke-getaye-feqir-yemileyegn-manew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከጌታዬ ፍቅር የሚለየኝ ማነው/2/
መከር ችግር ስቃይ ወይስ መራቆት ነው/2/

VERSE 1
አንፈራም አንሰጋም አንጠራጠርም/2/
እግዚአብሔር ከኛ ጋራ ይኖራል ለዘለዓለም/2/

CHORUS
ከጌታዬ ፍቅር የሚለየኝ ማነው/2/
መከር ችግር ስቃይ ወይስ መራቆት ነው/2/

VERSE 2
የሰማይ ቤታችን አማኑኤል የሰራው/2/
ግንቡ ንጹህ ውሃ መሰረቱ ደም ነው/2/

CHORUS
ከጌታዬ ፍቅር የሚለየኝ ማነው/2/
መከር ችግር ስቃይ ወይስ መራቆት ነው/2/

VERSE 3
ሳይነጋ ተራምደን እንጓዝ በጠዋት/2/
በደሙ መስርቶ ከሰራልን ቤት/2/

CHORUS
ከጌታዬ ፍቅር የሚለየኝ ማነው/2/
መከር ችግር ስቃይ ወይስ መራቆት ነው/2/

VERSE 4
የውሃ ግድግዳ የደም መሰረት/2/
ይኸው ከዚህ አለ የአማኑኤል ቤት/2/

CHORUS
ከጌታዬ ፍቅር የሚለየኝ ማነው/2/
መከር ችግር ስቃይ ወይስ መራቆት ነው/2/',
      lyrics_transliteration = 'CHORUS
Ke getaye feqir yemileyegn manew (x2)
Meker chigir sik’ay weyis merakot new (x2)

VERSE 1
Anferam ansegam ant’eraterem (x2)
Egziabher kena gara yinoral lezelalem (x2)

CHORUS
Ke getaye feqir yemileyegn manew (x2)
Meker chigir sik’ay weyis merakot new (x2)

VERSE 2
Yesemay betachin Amanuel yeseraw (x2)
Ginbu nits’uh wuha meseretu dem new (x2)

CHORUS
Ke getaye feqir yemileyegn manew (x2)
Meker chigir sik’ay weyis merakot new (x2)

VERSE 3
Saynega teramden engwaz bet’wat (x2)
Bedemu mesirto keseralen bet (x2)

CHORUS
Ke getaye feqir yemileyegn manew (x2)
Meker chigir sik’ay weyis merakot new (x2)

VERSE 4
Yewuha gidigda yedem meseret (x2)
Yih’ew kezih ale yeAmanuel bet (x2)

CHORUS
Ke getaye feqir yemileyegn manew (x2)
Meker chigir sik’ay weyis merakot new (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ke-getaye-feqir-yemileyegn-manew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከጌታዬ ፍቅር የሚለየኝ ማነው/2/
መከር ችግር ስቃይ ወይስ መራቆት ነው/2/

VERSE 1
አንፈራም አንሰጋም አንጠራጠርም/2/
እግዚአብሔር ከኛ ጋራ ይኖራል ለዘለዓለም/2/

VERSE 2
የሰማይ ቤታችን አማኑኤል የሰራው/2/
ግንቡ ንጹህ ውሃ መሰረቱ ደም ነው/2/

VERSE 3
ሳይነጋ ተራምደን እንጓዝ በጠዋት/2/
በደሙ መስርቶ ከሰራልን ቤት/2/

VERSE 4
የውሃ ግድግዳ የደም መሰረት/2/
ይኸው ከዚህ አለ የአማኑኤል ቤት/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ke getaye feqir yemileyegn manew (x2)
Meker chigir sik’ay weyis merakot new (x2)

VERSE 1
Anferam ansegam ant’eraterem (x2)
Egziabher kena gara yinoral lezelalem (x2)

VERSE 2
Yesemay betachin Amanuel yeseraw (x2)
Ginbu nits’uh wuha meseretu dem new (x2)

VERSE 3
Saynega teramden engwaz bet’wat (x2)
Bedemu mesirto keseralen bet (x2)

VERSE 4
Yewuha gidigda yedem meseret (x2)
Yih’ew kezih ale yeAmanuel bet (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ke-getaye-feqir-yemileyegn-manew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ke Karan Seweta (ke-karan-seweta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 1
በረከት አግኝቼ ዘሬን አበዛሁኝ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 2
ሲማኝ ምሬቱ የቀድሞው ኑሮዬ
ከቅርቡ ታሪኬ ጨለመ ኋላዬ
ካራን ያስተማረኝ ተስፋ ቢስ ህይወት ነው
ስጠራኝ ያየሁት የነገን ክብሬን ነው

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 3
ከቶ ማን ሆኜ ነው እንዲህ ያከበርከኝ
ካህዛብ ለይተህ ከፍ ከፍ ያረከኝ
አብርሐም ሆይ አልከኝ የወደድከኝ አምላክ
ልገዛ ላምልክህ ለክብርህ ልንበርከክ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 4
ህዝብህን ታደገው በረከት አይጥፋ
መሆንክን ይወቀው የዘለዓለም ተስፋ
ዓለማመን ይራቅ ጥርጥር ይወገድ
ልጆችህ ይጓዙ በአንዲቱ መንገድ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ',
      lyrics_transliteration = 'CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 1
Bereket aggnche zeren abezahugn

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 2
Simagn miretu yeqedmow nuroye
Keqrbu tarike ch’eleme hwalaye
Karan yastemaregn tesfa bis hiywet new
Sit’eragn yayehut yenegen kibren new

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 3
Keto man hogne new endih yakeberkegn
Kahzab leyteh kef kef yarekegn
Abrhem hoy alkegn yewededkegn amlak
Ligeza lamlkh lekbrh linberkek

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 4
Hizbhn tadegew bereket ayt’fa
Mehonkn yiweqew yezelealem tesfa
Alemamen yiraq t’rt’r yiweged
Lijochh yigwazu beanditu menged

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ke-karan-seweta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 1
በረከት አግኝቼ ዘሬን አበዛሁኝ

VERSE 2
ሲማኝ ምሬቱ የቀድሞው ኑሮዬ
ከቅርቡ ታሪኬ ጨለመ ኋላዬ
ካራን ያስተማረኝ ተስፋ ቢስ ህይወት ነው
ስጠራኝ ያየሁት የነገን ክብሬን ነው

VERSE 3
ከቶ ማን ሆኜ ነው እንዲህ ያከበርከኝ
ካህዛብ ለይተህ ከፍ ከፍ ያረከኝ
አብርሐም ሆይ አልከኝ የወደድከኝ አምላክ
ልገዛ ላምልክህ ለክብርህ ልንበርከክ

VERSE 4
ህዝብህን ታደገው በረከት አይጥፋ
መሆንክን ይወቀው የዘለዓለም ተስፋ
ዓለማመን ይራቅ ጥርጥር ይወገድ
ልጆችህ ይጓዙ በአንዲቱ መንገድ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 1
Bereket aggnche zeren abezahugn

VERSE 2
Simagn miretu yeqedmow nuroye
Keqrbu tarike ch’eleme hwalaye
Karan yastemaregn tesfa bis hiywet new
Sit’eragn yayehut yenegen kibren new

VERSE 3
Keto man hogne new endih yakeberkegn
Kahzab leyteh kef kef yarekegn
Abrhem hoy alkegn yewededkegn amlak
Ligeza lamlkh lekbrh linberkek

VERSE 4
Hizbhn tadegew bereket ayt’fa
Mehonkn yiweqew yezelealem tesfa
Alemamen yiraq t’rt’r yiweged
Lijochh yigwazu beanditu menged'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ke-karan-seweta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kebeles Betach Yayehign (kebeles-betach-yayehign)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 1
​
መልካም ሰው አይወጣም ከናዝሬት ከተማ
ብዬ ብናገርም ስላንተ ስሰማ
በቀልን ሳታስብ የልቤን ነገርከኝ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 2
ተንኮል የሌለበት ብለህ ተቀበልከኝ
ካለህበት ድረስ አየሁህ መጥቼ
ቀምሼ ፍቅርህን ቀረሁ ተረትቼ
ካንተ ጋር ኖራለሁ ጎድለቴ እንዲሞላ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 3
ከእንግዲህ አልመኝም የበለሷን ጥላ
ወደፊት ተራመድኩ በመርሳት ኋላዬን
መንፈሴ ታደሰ እያየሁ ጌታዬን
ሳያቆስል ማርኮ የእሱ አድርጎኛልና

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 4
የሚበልጥ ነገር ብዙ አያለሁ ገና
በስውር ብበድል ለኃጢአት ነቅቼ
ምድረበዳ ሆንኩኝ እጅግ ተራቁቼ
ልብሴን አገኘሁ መድመቂያዪን ዛሬ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 5
ናዝራዊውን ንጉሥ ያከብራል ከንፈሬ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ',
      lyrics_transliteration = 'CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 1
​
Melkam sew aywet’am kenazret ketema
Biye binagerm silante sisema
Beqeln satasb yelben negerkegn

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 2
Tenkol yelelebet bileh teqebelkegn
Kalehbet dires ayehuh met’che
Qemshe fiqrhn qerehu teretche
Kante gar noralehu godlete endimola

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 3
Keengdih almegnm yebeleswan t’la
Wedefit teramedku bemersat hwalayen
Menfese tadese eyayehu getayen
Sayaqosl marko yeesu adrgognalna

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 4
Yemibelt’ neger bizu ayalehu gena
Beswr bibedl lehat’iat neqche
Midrebeda honkugn ejg teraquche
Libsen agegnehu medmeqiyayin zare

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 5
Nazrawiwn nigus yakebral kenfere

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kebeles-betach-yayehign'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 1
​
መልካም ሰው አይወጣም ከናዝሬት ከተማ
ብዬ ብናገርም ስላንተ ስሰማ
በቀልን ሳታስብ የልቤን ነገርከኝ

VERSE 2
ተንኮል የሌለበት ብለህ ተቀበልከኝ
ካለህበት ድረስ አየሁህ መጥቼ
ቀምሼ ፍቅርህን ቀረሁ ተረትቼ
ካንተ ጋር ኖራለሁ ጎድለቴ እንዲሞላ

VERSE 3
ከእንግዲህ አልመኝም የበለሷን ጥላ
ወደፊት ተራመድኩ በመርሳት ኋላዬን
መንፈሴ ታደሰ እያየሁ ጌታዬን
ሳያቆስል ማርኮ የእሱ አድርጎኛልና

VERSE 4
የሚበልጥ ነገር ብዙ አያለሁ ገና
በስውር ብበድል ለኃጢአት ነቅቼ
ምድረበዳ ሆንኩኝ እጅግ ተራቁቼ
ልብሴን አገኘሁ መድመቂያዪን ዛሬ

VERSE 5
ናዝራዊውን ንጉሥ ያከብራል ከንፈሬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 1
​
Melkam sew aywet’am kenazret ketema
Biye binagerm silante sisema
Beqeln satasb yelben negerkegn

VERSE 2
Tenkol yelelebet bileh teqebelkegn
Kalehbet dires ayehuh met’che
Qemshe fiqrhn qerehu teretche
Kante gar noralehu godlete endimola

VERSE 3
Keengdih almegnm yebeleswan t’la
Wedefit teramedku bemersat hwalayen
Menfese tadese eyayehu getayen
Sayaqosl marko yeesu adrgognalna

VERSE 4
Yemibelt’ neger bizu ayalehu gena
Beswr bibedl lehat’iat neqche
Midrebeda honkugn ejg teraquche
Libsen agegnehu medmeqiyayin zare

VERSE 5
Nazrawiwn nigus yakebral kenfere'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kebeles-betach-yayehign', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kedametsega (kedametsega)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kedametsega'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 1
ውበትና ሞገሴ
ግርማ ሆነህ ለነፍሴ
ሰማያዊው ጥበቤ
ታበራለህ በልቤ

VERSE 2
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

VERSE 3
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 4
ንፁሁ በግ ክርስቶስ
ኃጢአቴን ያስወገድከው
ይቅር ባይ ነህ አምላኬ
ለኔ በደል የሞትከው

VERSE 5
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

VERSE 6
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 7
ዓለምን ካለመኖር
በጥበብ አምጥተህ
መወለድ መሰቀልህ
ይደንቃል ማዳንህ

VERSE 8
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

VERSE 9
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 10
በሞትህ ሞቴ ጠፍቶ
ዛሬ በህይወት ቆሜያለሁ
የአብ ኃይሉ ጥበቡ
አመሰግንሃለሁ

VERSE 11
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

VERSE 12
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 13
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 1
Wibetna mogese
Girma honeh lenefse
Semayawiw t’bebe
Taberaleh belbe

VERSE 2
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

VERSE 3
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 4
Nits’uhu beg Kristos
Hat’iaten yaswegedkew
Yiqr bay neh amlake
Lene bedel yemotkew

VERSE 5
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

VERSE 6
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 7
Alemn kalemenor
Bet’beb amt’teh
Meweled meseqelh
Yidenqal madanh

VERSE 8
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

VERSE 9
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 10
Bemoth mote t’efto
Zare behywet qomeyalehu
Yeab haylu t’bebu
Amesegnhalehu

VERSE 11
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

VERSE 12
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 13
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kedametsega', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kedan Esike Berisabeh (kedan-esike-berisabeh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 1
በገና ተነስ እንዚራ
ማዳኑን እንድናወራ
ምትቀድሙ ምትከተሉ
ሁላችሁ ሆሳዕና በሉ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 2
እግዚአብሔር ዘመን ከሰጠ
ይዘምር የተለወጠ
እልልታ ይሁን ለስሙ
ለዋጀን በወርቀ ደሙ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 3
የክብሬ የቤቴ ጌታ
ለነፍሴ ባለውልታ
ኤፉዱ ነው በፍታው ለብሴ
ዘማሪ ነኝ ለንጉሴ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 4
ሰገነት ላይ የወጣችሁ
ዝምታን የመረጣችሁ
ካፋችሁ ኩራት አይዉጣ
እርሱ ነው ቀን የሚያወጣ

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 5
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)',
      lyrics_transliteration = 'CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 1
Begena tenes enzira
Madanun endnawera
Mitqedmu mitketelu
Hulachhu hosaena belu (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 2
Egziabher zemen keset’e
Yizemr yetelewet’e
Ellta yihun lesmu
Lewajen bewerqe demu (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 3
Yekbre yebete Geta
Lenefse balewlta
Efudu new beftaw lebse
Zemari negn lenguse (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 4
Segenet lay yewet’achhu
Zimtan yemeret’achhu
Kafachhu kurat aywut’a
Ersu new qen yemiyawet’a

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 5
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kedan-esike-berisabeh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 1
በገና ተነስ እንዚራ
ማዳኑን እንድናወራ
ምትቀድሙ ምትከተሉ
ሁላችሁ ሆሳዕና በሉ (፪)

VERSE 2
እግዚአብሔር ዘመን ከሰጠ
ይዘምር የተለወጠ
እልልታ ይሁን ለስሙ
ለዋጀን በወርቀ ደሙ (፪)

VERSE 3
የክብሬ የቤቴ ጌታ
ለነፍሴ ባለውልታ
ኤፉዱ ነው በፍታው ለብሴ
ዘማሪ ነኝ ለንጉሴ (፪)

VERSE 4
ሰገነት ላይ የወጣችሁ
ዝምታን የመረጣችሁ
ካፋችሁ ኩራት አይዉጣ
እርሱ ነው ቀን የሚያወጣ

VERSE 5
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 1
Begena tenes enzira
Madanun endnawera
Mitqedmu mitketelu
Hulachhu hosaena belu (2)

VERSE 2
Egziabher zemen keset’e
Yizemr yetelewet’e
Ellta yihun lesmu
Lewajen bewerqe demu (2)

VERSE 3
Yekbre yebete Geta
Lenefse balewlta
Efudu new beftaw lebse
Zemari negn lenguse (2)

VERSE 4
Segenet lay yewet’achhu
Zimtan yemeret’achhu
Kafachhu kurat aywut’a
Ersu new qen yemiyawet’a

VERSE 5
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kedan-esike-berisabeh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Keekifih (keekifih)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'keekifih'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከእቅፍህ ተሰድጄ ከደጀ ሰላምህ
በፈቃዴ ኮብልዬ ከሰፊው መደፍህ
ማረኝ ብዬ ስቀርብህ ተምሬ ከትናንቴ
ፊትህን ሳታጠቁር ተቀበለኝ አባቴ

VERSE 1
ከውድቀቴ ስመለስ ከጥፋቴ ጎዳና
በእጥፍ አሳየኸኝ መውደድክን እንደገና
አይኖቼን ወደ ዓለም ጀርባዬን ደግሞ ላንተ
ሰጥቼ የኖርኩበት ያ ዘመን ተከተተ

VERSE 2
በናፍቆት ደጅ ደጅህን በተስፋ እያየህ
ትጠብቀኝ ነበረ በዚያ ልክ ገፍቼህ
ባማረ ነጭ በፍታ ድል ባለ ድግስ
ተቀበልከኝ አባባ ሆነህልኝ ሞገስ ( 2 )

VERSE 3
ብጎድልም ከበረትህ ብከስርም በምርጫዬ
ሙላቴ ነህ ለእኔ አለም ክብሬ ነህ ማጌጫዬ
ለምኞቴ ተስቤ ፀጋዬን እንዳላጣ
እንደ ፈቃድህ ትሁን አጥናልኝ የእኔን እጣ

VERSE 4
ሁሉ ይቅርብኝ ብዬ ልጅነት ክብርም ዝና
ከጥፋቴ ብመለስ ወደ ደጅህ ባቀና
ከሸሸሁህ ሺህ እርምጃ እልፍ ጊዜ ቀረብከኝ
የሚያስወድድ ሳይኖረኝ ኧረ እንደምን ወደድከኝ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Keeqfh tesedje kedeje selamh
Befeqade koblye kesefiw medefh
Maregn biye siqerbh temre ketnante
Fithn satat’equr teqebelegn abate

VERSE 1
Kewdqete simeles ket’fate godana
Beet’f asayeኸgn mewdedkn endegena
Aynochen wede alem jerbayen degmo lante
Set’che yenorkubet ya zemen teketete

VERSE 2
Benafqot dej dejhn betesfa eyayeh
Tit’ebqegn nebere beziya lik gefcheh
Bamare nech’ befta dil bale digs
Teqebelkegn ababa honehlgn moges (2)

VERSE 3
Bigodlm kebereth bikesrm bemrch’aye
Mulate neh leene alem kibre neh magech’aye
Lemgnote tesbe ts’egayen endalat’a
Ende feqadh tihun at’nalgn yeenen et’a

VERSE 4
Hulu yiqrbgn biye lijnet kibrm zina
Ket’fate bimeles wede dejh baqena
Kesheshehuh shih ermja elf gize qerebkegn
Yemiyaswedd saynoregn ኧre endemn wededkegn (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'keekifih', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kegne Tirisagn (kegne-tirisagn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 1
የምስጋናን ቃል የፈለጉብኝ
አመስግን እንጂ ዘምር ቢሉኝ
ልቤ ተነሳ ሊያዜምልህ
ቅኔዬ ነቃ እንዲህ ሊልህ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 2
ቀኜ ትርሳኝ ብረሳህ
ምላሴ ይጣበቅ ባላስብህ
የምወድህ ደስታዬ
ገነቴ ነህ መኖሪያዬ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 3
አንተ አይደለህም ወይ የኪዳን ሃገሬ
ሞት እንዳያገኘኝ ከለላ የሆንኸኝ የሕይወት ድንበሬ
አንተ አይደለህም ወይ ያዘመትኸኝ መሪ
በጸናች እጅ እና በተዘረጋች ክንድ ሆነህ ፊት አውራሪ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 4
አንተ አይደለህም ወይ እንዴት ይዘነጋል
ውለታህ ልቤ ውስጥ ዘለአለም ላይጠፋ በጣትህ ተፅፏል
ቀኜ ትርሳኝ ብረሳህ
ምላሴ ይጣበቅ ባላስብህ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 5
የምወድህ ደስታዬ
ገነቴ ነህ መኖሪያዬ
ክንድህ አይደለም ወይ ትላንቴን የረታ
ዛሬን የሚያኖረኝ የነገ ተስፋዬ የነፍሴ መከታ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 6
እጅህ አይደለም ወይ ያጎረሰኝ ቆርሶ
ያጠጣኝ ስጠማ ከልዑላን ማዕድ በክብር አቋድሶ
እጅህ አይደለም ወይ ያከመኝ ታምሜ
አቅፎ ያባበለኝ እንባዬን ያበሰው ጣትህ ነው ሰላሜ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 7
ቀኜ ትርሳኝ ብረሳህ
ምላሴ ይጣበቅ ባላስብህ
የምወድህ ደስታዬ
ገነቴ ነህ መኖሪያዬ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 8
አንተ እኮ ነህ ጌታ የዜማዬ ቃና
የቃላቴ ሞገስ የስብከቴ ርዕስ የንግግሬ አርማ
አንተ እኮ ነህ ጌታ የልጅነት ሕልሜ
የጉብዝና ሃሳቤ የምኞቴ አልፋ ርስቴ አለሜ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 9
በአንተ እኮ ነው ጌታ መሻገር መትረፌ
የጭንቄን ማለዳ የእንባዬን ሌሊቶች የቆምኩት አልፌ
ቀኜ ትርሳኝ ብረሳህ
ምላሴ ይጣበቅ ባላስብህ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 10
የምወድህ ደስታዬ
ገነቴ ነህ መኖሪያዬ
ላምጣ በገናዬን መወድሱን ላንሳ
የልሳኔን ጩኸት ሳልገድብ ሳልሳሳ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 11
ታጥቄያለሁ ቅኔ ስምህ ነው ዜማዬ
ለክብርህ እኖራለሁ መዝሙር ነው ስራዬ
ዜማን በልቤ አርገህ ፈጥረኸኛልና
ማምለክ ነው ስራዬ አንተን በምስጋና

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 12
ኸረ እኔስ አለኝ ምስጋና ለሕይወቴ ጀግና
ኸረ እኔስ አለኝ ምስጋና ለሕይወቴ ጀግና
ቀኜ ትርሳኝ ብረሳህ ምላሴ ይጣበቅ ባላስብህ
የምወድህ ደስታዬ ገነቴ ነህ መኖሪያዬ

CHORUS
መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ',
      lyrics_transliteration = 'CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 1
Yemsganan qal yefelegubgn
Amesgn enji zemr bilugn
Libe tenesa liyazemlh
Qineye neqa endih lilh

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 2
Qegne tirsagn biresah
Milase yit’abeq balasbh
Yemwedh destaye
Genete neh menoriyaye

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 3
Ante aydelehm wey yekidan hagere
Mot endayagegnegn kelela yehonኸgn yehywet dinbere
Ante aydelehm wey yazemetኸgn meri
Bets’enach ej ena betezeregach kind honeh fit awrari

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 4
Ante aydelehm wey endet yizenegal
Wiletah libe wist’ zelealem layt’efa bet’ath tets’fwal
Qegne tirsagn biresah
Milase yit’abeq balasbh

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 5
Yemwedh destaye
Genete neh menoriyaye
Kindh aydelem wey tilanten yereta
Zaren yemiyanoregn yenege tesfaye yenefse meketa

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 6
Ejh aydelem wey yagoresegn qorso
Yat’et’agn sit’ema kelulan maed bekbr aqwadso
Ejh aydelem wey yakemegn tamme
Aqfo yababelegn enbayen yabesew t’ath new selame

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 7
Qegne tirsagn biresah
Milase yit’abeq balasbh
Yemwedh destaye
Genete neh menoriyaye

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 8
Ante eko neh Geta yezemaye qana
Yeqalate moges yesbkete ries yenggre arma
Ante eko neh Geta yeljnet hilme
Yegubzna hasabe yemgnote alfa riste aleme

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 9
Beante eko new Geta meshager metrefe
Yech’nqen maleda yeenbayen lelitoch yeqomkut alfe
Qegne tirsagn biresah
Milase yit’abeq balasbh

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 10
Yemwedh destaye
Genete neh menoriyaye
Lamt’a begenayen mewedsun lansa
Yelsanen ch’uኸt salgedb salsasa

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 11
Tat’qeyalehu qine simh new zemaye
Lekbrh enoralehu mezmur new siraye
Zeman belbe argeh fet’reኸgnalna
Mamlek new siraye anten bemsgana

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 12
ኸre enes alegn misgana lehywete jegna
ኸre enes alegn misgana lehywete jegna
Qegne tirsagn biresah milase yit’abeq balasbh
Yemwedh destaye genete neh menoriyaye

CHORUS
Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kegne-tirisagn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'መሰንቆዬን በአሃያ ዛፎች ላይ ሰቅዬ
የእንቢልታዬ ቅኝት ዜማው ቀርቶ ከኌላዬ
በአደባባዩ በደርቡ ዜማዬ ባይወጣ
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ

VERSE 1
የምስጋናን ቃል የፈለጉብኝ
አመስግን እንጂ ዘምር ቢሉኝ
ልቤ ተነሳ ሊያዜምልህ
ቅኔዬ ነቃ እንዲህ ሊልህ

VERSE 2
ቀኜ ትርሳኝ ብረሳህ
ምላሴ ይጣበቅ ባላስብህ
የምወድህ ደስታዬ
ገነቴ ነህ መኖሪያዬ

VERSE 3
አንተ አይደለህም ወይ የኪዳን ሃገሬ
ሞት እንዳያገኘኝ ከለላ የሆንኸኝ የሕይወት ድንበሬ
አንተ አይደለህም ወይ ያዘመትኸኝ መሪ
በጸናች እጅ እና በተዘረጋች ክንድ ሆነህ ፊት አውራሪ

VERSE 4
አንተ አይደለህም ወይ እንዴት ይዘነጋል
ውለታህ ልቤ ውስጥ ዘለአለም ላይጠፋ በጣትህ ተፅፏል
ቀኜ ትርሳኝ ብረሳህ
ምላሴ ይጣበቅ ባላስብህ

VERSE 5
የምወድህ ደስታዬ
ገነቴ ነህ መኖሪያዬ
ክንድህ አይደለም ወይ ትላንቴን የረታ
ዛሬን የሚያኖረኝ የነገ ተስፋዬ የነፍሴ መከታ

VERSE 6
እጅህ አይደለም ወይ ያጎረሰኝ ቆርሶ
ያጠጣኝ ስጠማ ከልዑላን ማዕድ በክብር አቋድሶ
እጅህ አይደለም ወይ ያከመኝ ታምሜ
አቅፎ ያባበለኝ እንባዬን ያበሰው ጣትህ ነው ሰላሜ

VERSE 7
ቀኜ ትርሳኝ ብረሳህ
ምላሴ ይጣበቅ ባላስብህ
የምወድህ ደስታዬ
ገነቴ ነህ መኖሪያዬ

VERSE 8
አንተ እኮ ነህ ጌታ የዜማዬ ቃና
የቃላቴ ሞገስ የስብከቴ ርዕስ የንግግሬ አርማ
አንተ እኮ ነህ ጌታ የልጅነት ሕልሜ
የጉብዝና ሃሳቤ የምኞቴ አልፋ ርስቴ አለሜ

VERSE 9
በአንተ እኮ ነው ጌታ መሻገር መትረፌ
የጭንቄን ማለዳ የእንባዬን ሌሊቶች የቆምኩት አልፌ
ቀኜ ትርሳኝ ብረሳህ
ምላሴ ይጣበቅ ባላስብህ

VERSE 10
የምወድህ ደስታዬ
ገነቴ ነህ መኖሪያዬ
ላምጣ በገናዬን መወድሱን ላንሳ
የልሳኔን ጩኸት ሳልገድብ ሳልሳሳ

VERSE 11
ታጥቄያለሁ ቅኔ ስምህ ነው ዜማዬ
ለክብርህ እኖራለሁ መዝሙር ነው ስራዬ
ዜማን በልቤ አርገህ ፈጥረኸኛልና
ማምለክ ነው ስራዬ አንተን በምስጋና

VERSE 12
ኸረ እኔስ አለኝ ምስጋና ለሕይወቴ ጀግና
ኸረ እኔስ አለኝ ምስጋና ለሕይወቴ ጀግና
ቀኜ ትርሳኝ ብረሳህ ምላሴ ይጣበቅ ባላስብህ
የምወድህ ደስታዬ ገነቴ ነህ መኖሪያዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Mesenqoyen beahaya zafoch lay seqye
Yeenbiltaye qignt zemaw qerto kehwelaye
Beadebabayu bederbu zemaye baywet’a
Bitaqeb andebete qal keafe sitat’a

VERSE 1
Yemsganan qal yefelegubgn
Amesgn enji zemr bilugn
Libe tenesa liyazemlh
Qineye neqa endih lilh

VERSE 2
Qegne tirsagn biresah
Milase yit’abeq balasbh
Yemwedh destaye
Genete neh menoriyaye

VERSE 3
Ante aydelehm wey yekidan hagere
Mot endayagegnegn kelela yehonኸgn yehywet dinbere
Ante aydelehm wey yazemetኸgn meri
Bets’enach ej ena betezeregach kind honeh fit awrari

VERSE 4
Ante aydelehm wey endet yizenegal
Wiletah libe wist’ zelealem layt’efa bet’ath tets’fwal
Qegne tirsagn biresah
Milase yit’abeq balasbh

VERSE 5
Yemwedh destaye
Genete neh menoriyaye
Kindh aydelem wey tilanten yereta
Zaren yemiyanoregn yenege tesfaye yenefse meketa

VERSE 6
Ejh aydelem wey yagoresegn qorso
Yat’et’agn sit’ema kelulan maed bekbr aqwadso
Ejh aydelem wey yakemegn tamme
Aqfo yababelegn enbayen yabesew t’ath new selame

VERSE 7
Qegne tirsagn biresah
Milase yit’abeq balasbh
Yemwedh destaye
Genete neh menoriyaye

VERSE 8
Ante eko neh Geta yezemaye qana
Yeqalate moges yesbkete ries yenggre arma
Ante eko neh Geta yeljnet hilme
Yegubzna hasabe yemgnote alfa riste aleme

VERSE 9
Beante eko new Geta meshager metrefe
Yech’nqen maleda yeenbayen lelitoch yeqomkut alfe
Qegne tirsagn biresah
Milase yit’abeq balasbh

VERSE 10
Yemwedh destaye
Genete neh menoriyaye
Lamt’a begenayen mewedsun lansa
Yelsanen ch’uኸt salgedb salsasa

VERSE 11
Tat’qeyalehu qine simh new zemaye
Lekbrh enoralehu mezmur new siraye
Zeman belbe argeh fet’reኸgnalna
Mamlek new siraye anten bemsgana

VERSE 12
ኸre enes alegn misgana lehywete jegna
ኸre enes alegn misgana lehywete jegna
Qegne tirsagn biresah milase yit’abeq balasbh
Yemwedh destaye genete neh menoriyaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kegne-tirisagn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kehatiategnaw Dinikwan (kehatiategnaw-dinikwan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 1
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 2
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 3
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 4
እንኳንስ አድርገኝ ጌታዬ ሙሉ ሰው
እንዲሁም ይሄን ነው ልቤ የሚናፍቀው
የዘመን አሸከር ጠረጉስኩህና
የጠፋውን ድሪ ባገኘሁህና

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 5
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 6
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 7
ባገኘኸኝ ጊዜ ሸፈነኝ በለስዋ
ከፊት ያነበቡት ፍጹም አይረሳ
ከዚህም የበለጠ ታያለህ የምትለኝ
አይንህ ይናገራል እንደማትረሳ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 8
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 9
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 10
ምን አለኝ ብለህ ደጃፌን የምትመታ
እኔ ደካማ ነኝ አንተ ቅዱስ ጌታ
ከእንግዲህ አልረሳው ምንጣፌን በእንባ
ምልጦ ላይቴን ከፍተው በሁለት ግባ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 11
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 12
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 13
እኔ እኮ አውቀሃለሁ ሁሉን ስታፈቅረኝ
የአናብስትህን ጉርጓድ ከቦታው አሰሽ
እንዲህ እያለ ነው የሚቀኘው ውስጤ
እየሱስ ክርስቶስ ምግቤና መጠጤ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 14
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 15
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ',
      lyrics_transliteration = 'CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 1
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 2
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 3
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 4
Enkwans adrgegn Getaye mulu sew
Endihum yihen new libe yeminafqew
Yezemen asheker t’ereguskuhna
Yet’efawn diri bagegnehuhna

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 5
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 6
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 7
Bagegneኸgn gize shefenegn beleswa
Kefit yanebebut fits’um ayresa
Kezihm yebelet’e tayaleh yemtlegn
Aynh yinageral endematresa

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 8
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 9
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 10
Min alegn bileh dejafen yemtmeta
Ene dekama negn ante Kidus Geta
Keengdih alresaw mint’afen beenba
Milt’o layten keftew behulet giba

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 11
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 12
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 13
Ene eko awqehalehu hulun sitafeqregn
Yeanabsthn gurgwad kebotaw asesh
Endih eyale new yemiqegnew wist’e
Eyesus Kristos migbena met’et’e

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 14
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 15
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kehatiategnaw-dinikwan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 1
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

VERSE 2
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 3
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

VERSE 4
እንኳንስ አድርገኝ ጌታዬ ሙሉ ሰው
እንዲሁም ይሄን ነው ልቤ የሚናፍቀው
የዘመን አሸከር ጠረጉስኩህና
የጠፋውን ድሪ ባገኘሁህና

VERSE 5
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 6
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

VERSE 7
ባገኘኸኝ ጊዜ ሸፈነኝ በለስዋ
ከፊት ያነበቡት ፍጹም አይረሳ
ከዚህም የበለጠ ታያለህ የምትለኝ
አይንህ ይናገራል እንደማትረሳ

VERSE 8
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 9
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

VERSE 10
ምን አለኝ ብለህ ደጃፌን የምትመታ
እኔ ደካማ ነኝ አንተ ቅዱስ ጌታ
ከእንግዲህ አልረሳው ምንጣፌን በእንባ
ምልጦ ላይቴን ከፍተው በሁለት ግባ

VERSE 11
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 12
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

VERSE 13
እኔ እኮ አውቀሃለሁ ሁሉን ስታፈቅረኝ
የአናብስትህን ጉርጓድ ከቦታው አሰሽ
እንዲህ እያለ ነው የሚቀኘው ውስጤ
እየሱስ ክርስቶስ ምግቤና መጠጤ

VERSE 14
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 15
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 1
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

VERSE 2
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 3
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

VERSE 4
Enkwans adrgegn Getaye mulu sew
Endihum yihen new libe yeminafqew
Yezemen asheker t’ereguskuhna
Yet’efawn diri bagegnehuhna

VERSE 5
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 6
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

VERSE 7
Bagegneኸgn gize shefenegn beleswa
Kefit yanebebut fits’um ayresa
Kezihm yebelet’e tayaleh yemtlegn
Aynh yinageral endematresa

VERSE 8
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 9
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

VERSE 10
Min alegn bileh dejafen yemtmeta
Ene dekama negn ante Kidus Geta
Keengdih alresaw mint’afen beenba
Milt’o layten keftew behulet giba

VERSE 11
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 12
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

VERSE 13
Ene eko awqehalehu hulun sitafeqregn
Yeanabsthn gurgwad kebotaw asesh
Endih eyale new yemiqegnew wist’e
Eyesus Kristos migbena met’et’e

VERSE 14
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 15
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kehatiategnaw-dinikwan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: [kem Fikadu ] (kem-fikadu)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kem-fikadu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኣዝ- ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ

VERSE 1
ጓሂ ልብና ምሒር በዚሑ
ልዕሊ ዓቅሚ ኮይኑና ሲኢና ምፍትሑ
"ኣብቂዑ''ዩ ናተይ ነገር" ኣብ ንብለሉ
መፍትሒ ኣለዉ ንጎይታ ጾርና ንቅርበሉ

VERSE 2
ኣዝ
ክሲ ሕልና ሰላም ከሊኡና
ተስፋ ካባና ሪሑቁ መቅባሕባሕቲ ኮይና
ዋላ''ኳ አንተ ወደቅና ፍጽም ኣይንትሓለል

VERSE 3
ርህሩህ ኣቦ ኣሎና ከምዚ''ኻ ከይበለ ዝቅበል
ኣዝ
አቲ ንዓና ከቢድ ዝመስል
ኸይነስተውዕል ጋሪዱ ዝኾነና ግድል

VERSE 4
ኣብ ቅድሚ አግዚኣብሄር ኣዝዩ ንአሽቶ''ዩ
ጥራይ ንተኣመን ኣምላኽና ኩሉ ከኣሊ''ዩ
ከም ፍቓዱ ጌርና አንተ ለመና
አሙንን ጻድቕን''ዩ ክህበናዩ ድሌትና

VERSE 5
"ብአምነት ዝዃሕኩሐ ደጊታት ይረሓወሉ"
ኢሉና''ዩ ብቃሉ ነዚ ቃል ነድህበሉ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Az- kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu

VERSE 1
Gwahi libna mihir bezihu
Lieli aqmi koynuna siina mifthu
"abqiu''yu natey neger" ab niblelu
Mefthi alewu nigoyta ts’orna niqrbelu

VERSE 2
Az
Kisi hilna selam keliuna
Tesfa kabana rihuqu meqbahbahti koyna
Wala''kwa ante wedeqna fits’m aynthalel

VERSE 3
Rihruh abo alona kemzi''ኻ keybele ziqbel
Az
Ati niana kebid zimesl
ኸynestewel garidu ziኾnena gidl

VERSE 4
Ab qidmi agziabher azyu niashto''yu
T’ray niteamen amlaኽna kulu keali''yu
Kem fiቓdu gerna ante lemena
Amunn ts’adቕn''yu kihbenayu diletna

VERSE 5
"biamnet zikhwahkuhe degitat yirehawelu"
Iluna''yu biqalu nezi qal nedhbelu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kem-fikadu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: … kem ntfue wedi ... kem ntfue wedi bzemari bereket tkue (kem-ntfue-wedi-kem-ntfue-wedi-bzemari-bereket-tkue)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kem-ntfue-wedi-kem-ntfue-wedi-bzemari-bereket-tkue'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 1
ዘይከም ድኽመት ዘርኪዬስ ዝሓጸሮ ንግቢ
ተጋዊ እንደየ ነይረ ዘይናቱ ኣካቢ
ብፍጽም ትሕትናይ ቃላትካ ከይስከም
ኣብ ሳግላ ትዕቢተይ ሓኹረ ክትዕነን

VERSE 2
ትሪ ልበይ ሴርካ ከፌትካ ንዓይነይ
ቤተይ ምስ ባረኽካ (ርኤካ መድሕነይ(2))
ኣዝ
ይትረፉ ኣነ ንህያው ዝዛረብ ብልሳን

VERSE 3
ሰማይ ኣንቃዕሪራ ዑፍካ ትምስክን
ሎቆታ ከብደይ ግን ተመስገን ደረታ
ብሰሪ ስስዕቲ ንሕግኻ እስሕታ
ሰላመይ ክትመስል ንሓጥያት ከርዲና

VERSE 4
ሓይሊ ኢድ ምሕረትካ (ውሉድካ ኣድሒና(2))
ኣዝ
ከም ጥጦስ ኣይኮንኮን ክብርኻ ዝመሰከረ
ከም ጴጥሮስ ኣይኮንኩን ንስሓ ዝኽበረ

VERSE 5
ንሳቶም ብግብሮም ክስመዮ ጸጋ
ንዓይ ንሓጥእ ግን ግብሪ ኣይነበረንን
ምሕረትካ ዓዚዙ ሂብካኒ ይቅሬታ
ምስጋና ይብጻሕካ (ናይ ሰራዊት ጎይታ(2))

VERSE 6
ኣዝ
በሊሕ ብምርጋጸይ ነብሰይ ከም ትጉዳእ
ኣየናይ’ላቶ ልበይ ንቃልካ ክትርዳእ
ፈቃር ኣምላኽይ ግን እንታይ ይስኣነካ

VERSE 7
ብግሊ ግሌኻ ንርእሰይ ጎልቢብካ
ብዝርጉሕ ቅልጽምካ መሊስካኒ ክብሪ
ክርስቶስ ተመስገን (ለዋህ ኣቦ ፍቅሪ(2))
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ

VERSE 8
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 1
Zeykem diኽmet zerkiyes zihats’ero nigbi
Tegawi endeye neyre zeynatu akabi
Bifts’m tihtnay qalatka keyskem
Ab sagla tiebitey haኹre kitenen

VERSE 2
Tiri libey serka kefetka niayney
Betey mis bareኽka (rieka medhney (2))
Az
Yitrefu ane nihyaw zizareb bilsan

VERSE 3
Semay anqaerira ufka timskn
Loqota kebdey gin temesgen dereta
Biseri siseti nihgኻ eshta
Selamey kitmesl nihat’yat kerdina

VERSE 4
Hayli id mihretka (wiludka adhina (2))
Az
Kem t’t’os aykonkon kibrኻ zimesekere
Kem p’et’ros aykonkun nisha ziኽbere

VERSE 5
Nisatom bigbrom kismeyo ts’ega
Niay nihat’e gin gibri ayneberenn
Mihretka azizu hibkani yiqreta
Misgana yibts’ahka (nay serawit goyta (2))

VERSE 6
Az
Belih bimrgats’ey nebsey kem tigudae
Ayenay’lato libey niqalka kitrdae
Feqar amlaኽy gin entay yisaneka

VERSE 7
Bigli gileኻ niresey golbibka
Bizrguh qilts’mka meliskani kibri
Kristos temesgen (lewah abo fiqri (2))
Kem nit’fue wedi mihretka zet’reyo

VERSE 8
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kem-ntfue-wedi-kem-ntfue-wedi-bzemari-bereket-tkue', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Keme Tibarekene (keme-tibarekene)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከመ ትባርከነ በመስቀልከ ዘወርቅ (፪)(፪)
ተዋነይ በጽድቅ (፬)
እስጢፋኖስ ሐመልማለ ወርቅ (፪)

VERSE 1
ከመ ትባርከነ በመስቀልከ ዘወርቅ (፪)(፪)
ተዋነይ በጽድቅ (፬)
እስጢፋኖስ ሐመልማለ ወርቅ (፪)

CHORUS
ከመ ትባርከነ በመስቀልከ ዘወርቅ (፪)(፪)
ተዋነይ በጽድቅ (፬)
እስጢፋኖስ ሐመልማለ ወርቅ (፪)',
      lyrics_transliteration = 'CHORUS
Keme tibarekene bemeskelike zewerk (2)(2)
Tewaney betsidk (4)
Estifanos hamelmale werk (2)

VERSE 1
Keme tibarekene bemeskelike zewerk (2)(2)
Tewaney betsidk (4)
Estifanos hamelmale werk (2)

CHORUS
Keme tibarekene bemeskelike zewerk (2)(2)
Tewaney betsidk (4)
Estifanos hamelmale werk (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'keme-tibarekene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከመ ትባርከነ በመስቀልከ ዘወርቅ (፪)(፪)
ተዋነይ በጽድቅ (፬)
እስጢፋኖስ ሐመልማለ ወርቅ (፪)

VERSE 1
ከመ ትባርከነ በመስቀልከ ዘወርቅ (፪)(፪)
ተዋነይ በጽድቅ (፬)
እስጢፋኖስ ሐመልማለ ወርቅ (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Keme tibarekene bemeskelike zewerk (2)(2)
Tewaney betsidk (4)
Estifanos hamelmale werk (2)

VERSE 1
Keme tibarekene bemeskelike zewerk (2)(2)
Tewaney betsidk (4)
Estifanos hamelmale werk (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'keme-tibarekene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kemelaekit Gara Sigelets Besemay (kemelaekit-gara-sigelets-besemay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ፀንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 1
ኧኸ ምስጋና ይድረስ ሁልጊዜ ጠዋት ማታ
ሃሌ ሃሌ ሉያ የሠራዊት ጌታ /2/
ሰማይና ምድር ከፊቱ ሲሸሹ
መግቢያ አጥቶ ይጮሃል ትልቁ ትንሹ

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ፀንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 2
ጻድቃን ሲደሰቱ የኃጥአን ፋንታ
ሆኖ ጠበቃቸው ለቅሶና ዋይታ
ስለማይታወቅ አምላክ አመጣጥህ
በሃይማኖት አፅናን ተግተን እንጠብቅህ

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ፀንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 3
ጠላት እንዳይገዛን በእርሱ እንዳንረታ
እግዚአብሔር አድነን ሁንልን መከታ

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ፀንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ',
      lyrics_transliteration = 'CHORUS
Kemelaekt gara sigelet’ besemay
Ts’enten ent’ebqew kibrun hulu endnay
Begrma simet’a beasdengach’ huneta
Weyolsh nefse hoy weyew yezan leta

VERSE 1
ኧኸ misgana yidres hulgize t’ewat mata
Hale Halleluya yeserawit Geta (2)
Semayna midr kefitu sisheshu
Megbiya at’to yich’ohal tilqu tinshu

CHORUS
Kemelaekt gara sigelet’ besemay
Ts’enten ent’ebqew kibrun hulu endnay
Begrma simet’a beasdengach’ huneta
Weyolsh nefse hoy weyew yezan leta

VERSE 2
Ts’adqan sidesetu yehat’an fanta
Hono t’ebeqachew leqsona wayta
Silemaytaweq amlak amet’at’h
Behaymanot ats’nan tegten ent’ebqh

CHORUS
Kemelaekt gara sigelet’ besemay
Ts’enten ent’ebqew kibrun hulu endnay
Begrma simet’a beasdengach’ huneta
Weyolsh nefse hoy weyew yezan leta

VERSE 3
T’elat endaygezan beersu endanreta
Egziabher adnen hunln meketa

CHORUS
Kemelaekt gara sigelet’ besemay
Ts’enten ent’ebqew kibrun hulu endnay
Begrma simet’a beasdengach’ huneta
Weyolsh nefse hoy weyew yezan leta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kemelaekit-gara-sigelets-besemay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከመላእክት ጋራ ሲገለጥ በሰማይ
ፀንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 1
ኧኸ ምስጋና ይድረስ ሁልጊዜ ጠዋት ማታ
ሃሌ ሃሌ ሉያ የሠራዊት ጌታ /2/
ሰማይና ምድር ከፊቱ ሲሸሹ
መግቢያ አጥቶ ይጮሃል ትልቁ ትንሹ

VERSE 2
ጻድቃን ሲደሰቱ የኃጥአን ፋንታ
ሆኖ ጠበቃቸው ለቅሶና ዋይታ
ስለማይታወቅ አምላክ አመጣጥህ
በሃይማኖት አፅናን ተግተን እንጠብቅህ

VERSE 3
ጠላት እንዳይገዛን በእርሱ እንዳንረታ
እግዚአብሔር አድነን ሁንልን መከታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kemelaekt gara sigelet’ besemay
Ts’enten ent’ebqew kibrun hulu endnay
Begrma simet’a beasdengach’ huneta
Weyolsh nefse hoy weyew yezan leta

VERSE 1
ኧኸ misgana yidres hulgize t’ewat mata
Hale Halleluya yeserawit Geta (2)
Semayna midr kefitu sisheshu
Megbiya at’to yich’ohal tilqu tinshu

VERSE 2
Ts’adqan sidesetu yehat’an fanta
Hono t’ebeqachew leqsona wayta
Silemaytaweq amlak amet’at’h
Behaymanot ats’nan tegten ent’ebqh

VERSE 3
T’elat endaygezan beersu endanreta
Egziabher adnen hunln meketa'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kemelaekit-gara-sigelets-besemay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: KeMelaket Gar (kemelaket-gar)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kemelaket-gar'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 1
ኧኸ ምስጋና ይድረስህ ሁል ጊዜ ጧት ማታ
ሃሌ ሃሌ ሉያ የሠራዊት ጌታ /2/

VERSE 2
ሰማይና ምድር ከፊቱ ሲሸሹ
መግቢያ አጥቶ ይጮሃል ትልቁም ትንሹ
ጻድቃን ሲደሰቱ የኃጥአን ፈንታ
ሆኖ ጠበቃቸው ለቅሶና ዋይታ

VERSE 3
ስለማይታወቅ አምላክ አመጣጥህ
በመንፈስህ አጽናን ጸንተን እንጠብቅህ
ጠላት እንዳይገዛን በመንግሥት ቦታ
እግዚኦ ሰውረን ከመሰውር ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 1
Ehe Misgana Yidreshe Hulgize Tewat Mata
Hale Haleluya Yeserawit Geta /2/

VERSE 2
Semaye ena Mider Kefitu Sisheshu
Megbya Ateto Yechohal Tilekum Tinishu
Tsadekan Sidesetu Yehatan Fanta
Hono Tebekachew Leksona Wayta

VERSE 3
Silemaytawek Amlak Ametatehe
Bemenfeshe Atsenane Tsenten Entebekehe
Telat Endaygezan Bemengist Bota
Egzio Seweren Kemsewer Geta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kemelaket-gar', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kemetsge Roman (kemetsge-roman)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)

VERSE 1
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)

CHORUS
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)',
      lyrics_transliteration = 'CHORUS
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)

VERSE 1
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)

CHORUS
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kemetsge-roman'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)

VERSE 1
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)

VERSE 1
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kemetsge-roman', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: kemey krseo /zemari Bereket tikue/ eritrean Orthodox Tewahdo Mezmur (kemey-krseo-zemari-bereket-tikue-eritrean-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 1
ክሳደይ ደኒኑ ዓይነይ ዝነብዕ
ታሪኽ ስለ ዘይብለይ''ዩ ዘኹርዕ
ትማልየይ ቀይርካለይ ኢኻ''ምበር
እንታይ ጽቡቕ ግብሪ ኣሎኒ ውሉድካ ዘብል

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 2
ኣዝ//
ናተይ ኢድ የብሉን ድሕነተይ ብኣኻ''ምበር
ኣብ መስቀል ፈጺምካዮ ናተይ ነገር
ዝውድሰካ ብሓጎስ ዝዝምር

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 3
ደምካ ዝዋሕሱ ኮይነ''ንድየ ዝነብር
ዘማ//
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 4
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//',
      lyrics_transliteration = 'CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 1
Kisadey deninu ayney zinebe
Tariኽ sile zeybley''yu zeኹre
Timalyey qeyrkaley iኻ''miber
Entay ts’buቕ gibri aloni wiludka zebl

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 2
Az//
Natey id yeblun dihnetey biaኻ''miber
Ab mesqel fets’imkayo natey neger
Ziwdseka bihagos zizmr

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 3
Demka ziwahsu koyne''nidye zinebr
Zema//
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 4
Ab libey''yu / (3)/ kirso kemey kiኾneley

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kemey-krseo-zemari-bereket-tikue-eritrean-orthodox-tewahdo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 1
ክሳደይ ደኒኑ ዓይነይ ዝነብዕ
ታሪኽ ስለ ዘይብለይ''ዩ ዘኹርዕ
ትማልየይ ቀይርካለይ ኢኻ''ምበር
እንታይ ጽቡቕ ግብሪ ኣሎኒ ውሉድካ ዘብል

VERSE 2
ኣዝ//
ናተይ ኢድ የብሉን ድሕነተይ ብኣኻ''ምበር
ኣብ መስቀል ፈጺምካዮ ናተይ ነገር
ዝውድሰካ ብሓጎስ ዝዝምር

VERSE 3
ደምካ ዝዋሕሱ ኮይነ''ንድየ ዝነብር
ዘማ//
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ

VERSE 4
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 1
Kisadey deninu ayney zinebe
Tariኽ sile zeybley''yu zeኹre
Timalyey qeyrkaley iኻ''miber
Entay ts’buቕ gibri aloni wiludka zebl

VERSE 2
Az//
Natey id yeblun dihnetey biaኻ''miber
Ab mesqel fets’imkayo natey neger
Ziwdseka bihagos zizmr

VERSE 3
Demka ziwahsu koyne''nidye zinebr
Zema//
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema

VERSE 4
Ab libey''yu / (3)/ kirso kemey kiኾneley'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kemey-krseo-zemari-bereket-tikue-eritrean-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Keminedew Esat (keminedew-esat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 1
የከለዳውያን አስማት ተዘለፈ
በሰማዩ ምስጢር ገብርኤል
ህይወቴ ከሞት አተረፈ /2/
የእስረኞቹ አለቃ አስፋኒስ ተገርሞ

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 2
ሽብሸባዬን አየ ከእሳቱ ዳር ቆሞ
የአማልክትን ልጅ ባይለይም ንጉሱ
አምላክ ወሰብ መልአክ ከቶኑ
ሃያሉ ታድጎኛል እርሱ /2/

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 3
ጠላት የለኮሰው የፈተናው ችቦ
በነፍሴ አላለፈም ስጋዬን ለብልቦ
ከባቢሎን ዋዕይ ተርፍለች ህይወቴ
የጌታ ባለሟል በምልጃው

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 4
ጥላ ስር ከልሎኝ አባቴ /2/
የውሀው መፍለቅለቅ ልቤን አያዝልም
ዓለም ንዳንድ ቢሆን እምነቴን አይንድም
ቂርቆስ እየሉጣን ከፍል እንዳዳነ

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 5
ደመናን ሰንጥቆ ገብርኤል
ከጥፋት ሊያድነኝ ፈጠነ /2/

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል',
      lyrics_transliteration = 'CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 1
Yekeledawyan asmat tezelefe
Besemayu mist’ir Gebriel
Hiywete kemot aterefe (2)
Yeesregnochu aleqa asfanis tegermo

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 2
Shbshebayen aye keesatu dar qomo
Yeamalktn lij bayleym nigusu
Amlak weseb melak ketonu
Hayalu tadgognal ersu (2)

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 3
T’elat yelekosew yefetenaw chbo
Benefse alalefem sigayen leblbo
Kebabilon waey terflech hiywete
Yegeta balemwal bemljaw

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 4
T’la sir kellogn abate (2)
Yewhew mefleqleq liben ayazlm
Alem nidand bihon emneten ayndm
Qirqos eyelut’an kefl endadane

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 5
Demenan sent’qo Gebriel
Ket’fat liyadnegn fet’ene (2)

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'keminedew-esat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 1
የከለዳውያን አስማት ተዘለፈ
በሰማዩ ምስጢር ገብርኤል
ህይወቴ ከሞት አተረፈ /2/
የእስረኞቹ አለቃ አስፋኒስ ተገርሞ

VERSE 2
ሽብሸባዬን አየ ከእሳቱ ዳር ቆሞ
የአማልክትን ልጅ ባይለይም ንጉሱ
አምላክ ወሰብ መልአክ ከቶኑ
ሃያሉ ታድጎኛል እርሱ /2/

VERSE 3
ጠላት የለኮሰው የፈተናው ችቦ
በነፍሴ አላለፈም ስጋዬን ለብልቦ
ከባቢሎን ዋዕይ ተርፍለች ህይወቴ
የጌታ ባለሟል በምልጃው

VERSE 4
ጥላ ስር ከልሎኝ አባቴ /2/
የውሀው መፍለቅለቅ ልቤን አያዝልም
ዓለም ንዳንድ ቢሆን እምነቴን አይንድም
ቂርቆስ እየሉጣን ከፍል እንዳዳነ

VERSE 5
ደመናን ሰንጥቆ ገብርኤል
ከጥፋት ሊያድነኝ ፈጠነ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 1
Yekeledawyan asmat tezelefe
Besemayu mist’ir Gebriel
Hiywete kemot aterefe (2)
Yeesregnochu aleqa asfanis tegermo

VERSE 2
Shbshebayen aye keesatu dar qomo
Yeamalktn lij bayleym nigusu
Amlak weseb melak ketonu
Hayalu tadgognal ersu (2)

VERSE 3
T’elat yelekosew yefetenaw chbo
Benefse alalefem sigayen leblbo
Kebabilon waey terflech hiywete
Yegeta balemwal bemljaw

VERSE 4
T’la sir kellogn abate (2)
Yewhew mefleqleq liben ayazlm
Alem nidand bihon emneten ayndm
Qirqos eyelut’an kefl endadane

VERSE 5
Demenan sent’qo Gebriel
Ket’fat liyadnegn fet’ene (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'keminedew-esat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ken Aleh (ken-aleh)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ken-aleh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 1
አባቴ ሁሉን በየተራ
እንዳላየ ዓይተህ ጥለህ ምስኪኑን ማታልፍ
እርሱማ እንደዚህ ነው ሲሉህ የማትጸየፍ
ብለው ነበረ ይወድቃል ይህ ሰው

VERSE 2
ዳግም አይቆምም ማንም አይረዳው
ጥሎታል እግዚአብሔር ትቶታል
ኃጢአቱ ለዚህ አብቅቶታል
ከእንግዲህ ሰው አይሆንም ሲሉኝ

VERSE 3
አንተ ግን ፊታቸው አቆምከኝ
በዚህ ዘመንማ ከፋ ማን ሰውን ይወዳል?
መጻጉዕ ዳግም ቢታመም አልጋው ላይ ይሞታል
ወትሮም እንዲህ ነው ማን አስታወሰው

VERSE 4
ሁሉ አልነበር ወይ ጥሎት ያለፈው
ከአልጋዬ ቀና ያደረከኝ
አባብለህ አቅፈህ ያስታመምከኝ
ባዶ ቤት ብቻዬን ቀርቼ

VERSE 5
ስንቴ ዳንኩ ስንት ጊዜ ሞቼ
ተሰብሮ የሚማጸንን ልብ ቸል አትልምና
ደም ከፍለህ የተቤዥከውን አትረሳምና
ከቤትህ ርቆ ጠፍቶ የሄደን ሰው

VERSE 6
እንዴት ደግሰህ አቅፈህ ተቀበልከው
አባክኗል ብዙ በድሎሃል
ይቅርብህ አስወጣው ይሉሃል
ላንተ ግን መጎስቆሌ ታየህ

VERSE 7
እንባዬ ለቅሶዬ አስለቀሰህ
ጌታዬ ናልኝ ምትሉ እርሱን ምትጠብቁ
ዘግይቶም አይቀደምም ይህንን እወቁ
አንድ ቀን አለ ፀሐይ ትወጣለች

VERSE 8
ትንሿ ጎጆ ብርሃን ትሞላለች
ይመጣል እግዚአብሔር ይመጣል
ቀጥሮማ መቼ ቀርቶ ያውቃል
አይዋሽም ታማኝ ነው በቃሉ

VERSE 9
በገሃድ ይመጣል ኃያሉ
እንዳላየ ዓይተህ ጥለህ ምስኪኑን ማታልፍ
እርሱማ እንደዚህ ነው ሲሉህ የማትጸየፍ
ብለው ነበረ ይወድቃል ይህ ሰው

VERSE 10
ዳግም አይቆምም ማንም አይረዳው
ጥሎታል እግዚአብሔር ትቶታል
ኃጢአቱ ለዚህ አብቅቶታል
ከእንግዲህ ሰው አይሆንም ሲሉኝ

VERSE 11
አንተ ግን ፊታቸው አቆምከኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 1
Abate hulun beyetera
Endalaye ayteh t’leh miskinun matalf
Ersuma endezih new siluh yematts’eyef
Bilew nebere yiwedqal yih sew

VERSE 2
Dagm ayqomm manm ayredaw
T’lotal Egziabher titotal
Hat’iatu lezih abqtotal
Keengdih sew ayhonm silugn

VERSE 3
Ante gin fitachew aqomkegn
Bezih zemenma kefa man sewn yiwedal?
Mets’ague dagm bitamem algaw lay yimotal
Wetrom endih new man astawesew

VERSE 4
Hulu alneber wey t’lot yalefew
Kealgaye qena yaderekegn
Abableh aqfeh yastamemkegn
Bado bet bichayen qerche

VERSE 5
Sinte danku sint gize moche
Tesebro yemimats’enn lib chel atlmna
Dem kefleh yetebezhkewn atresamna
Kebeth riqo t’efto yeheden sew

VERSE 6
Endet degseh aqfeh teqebelkew
Abaknwal bizu bedlohal
Yiqrbh aswet’aw yiluhal
Lante gin megosqole tayeh

VERSE 7
Enbaye leqsoye asleqeseh
Getaye nalgn mitlu ersun mitt’ebqu
Zegytom ayqedemm yihnn ewequ
And qen ale ts’ehey tiwet’alech

VERSE 8
Tinshwa gojo birhan timolalech
Yimet’al Egziabher yimet’al
Qet’roma meche qerto yawqal
Aywashm tamagn new beqalu

VERSE 9
Begehad yimet’al hayalu
Endalaye ayteh t’leh miskinun matalf
Ersuma endezih new siluh yematts’eyef
Bilew nebere yiwedqal yih sew

VERSE 10
Dagm ayqomm manm ayredaw
T’lotal Egziabher titotal
Hat’iatu lezih abqtotal
Keengdih sew ayhonm silugn

VERSE 11
Ante gin fitachew aqomkegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ken-aleh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ken Amita (ken-amita)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 1
እባክህ ቀን አምጣ ታረቀን አቤቱ
ልብ ያለው ልብ ይበል ዘመኑን ያስተውል እንደሚገባ
ማነው ያላለቀሰ ያላነባ (x2)
መሻገሪያው በእሳት ከታጠረ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 2
ሰው በጭንቀት ብዛት ከሰከረ
የደሀው ደም መፋረጃ ካጣ
ከትላንቱም
የባሰ ከመጣ (x2)

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 3
የዋሂቱ እርግብ በዘንዶ ምላስ ላይ ጣለች ልጆቿን
ታዲያ ማን አየው ሊላት ጫጩቶቿን
እኮ ማን አየሁ ሊላት ክፋዮቿን
እረ ፍትህ ዳኛ ወዴት አለ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 4
ከተማውስ ይሄን ጉድ ምን አለ
ለማይራራው አመፅ ለተሞላ
ፍርድ የለም ወይ
አደራ ለበላ (x2)

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 5
ምነው ያለ ወትሮ ቀኑ ጨላለመ ፀና ደመናው
ታላቁ የፍርድ ቀን ገናና ነው
ታላቁ የፍርድ ቀን ሚያስፈራ ነው
አኬልዳማ ምድር ቃልዋን ሰጠች

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 6
የእግዚአብሔር ጣት ይህን አደረገች
የአመፀኞች ቅጥራቸው ፈረሰ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ',
      lyrics_transliteration = 'CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 1
Ebakh qen amt’a tareqen abetu
Lib yalew lib yibel zemenun yastewl endemigeba
Manew yalaleqese yalaneba (x2)
Meshageriyaw beesat ketat’ere

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 2
Sew bech’nqet bizat kesekere
Yedehew dem mefareja kat’a
Ketlantum
Yebase kemet’a (x2)

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 3
Yewahitu ergb bezendo milas lay t’alech lijochwan
Tadiya man ayew lilat ch’ach’utochwan
Eko man ayehu lilat kifayochwan
Ere fith dagna wedet ale

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 4
Ketemaws yihen gud min ale
Lemayraraw amets’ letemola
Fird yelem wey
Adera lebela (x2)

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 5
Minew yale wetro qenu ch’elaleme ts’ena demenaw
Talaqu yefrd qen genana new
Talaqu yefrd qen miyasfera new
Akeldama midr qalwan set’ech

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 6
YeEgziabher t’at yihn aderegech
Yeamets’egnoch qit’rachew ferese

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ken-amita'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 1
እባክህ ቀን አምጣ ታረቀን አቤቱ
ልብ ያለው ልብ ይበል ዘመኑን ያስተውል እንደሚገባ
ማነው ያላለቀሰ ያላነባ (x2)
መሻገሪያው በእሳት ከታጠረ

VERSE 2
ሰው በጭንቀት ብዛት ከሰከረ
የደሀው ደም መፋረጃ ካጣ
ከትላንቱም
የባሰ ከመጣ (x2)

VERSE 3
የዋሂቱ እርግብ በዘንዶ ምላስ ላይ ጣለች ልጆቿን
ታዲያ ማን አየው ሊላት ጫጩቶቿን
እኮ ማን አየሁ ሊላት ክፋዮቿን
እረ ፍትህ ዳኛ ወዴት አለ

VERSE 4
ከተማውስ ይሄን ጉድ ምን አለ
ለማይራራው አመፅ ለተሞላ
ፍርድ የለም ወይ
አደራ ለበላ (x2)

VERSE 5
ምነው ያለ ወትሮ ቀኑ ጨላለመ ፀና ደመናው
ታላቁ የፍርድ ቀን ገናና ነው
ታላቁ የፍርድ ቀን ሚያስፈራ ነው
አኬልዳማ ምድር ቃልዋን ሰጠች

VERSE 6
የእግዚአብሔር ጣት ይህን አደረገች
የአመፀኞች ቅጥራቸው ፈረሰ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 1
Ebakh qen amt’a tareqen abetu
Lib yalew lib yibel zemenun yastewl endemigeba
Manew yalaleqese yalaneba (x2)
Meshageriyaw beesat ketat’ere

VERSE 2
Sew bech’nqet bizat kesekere
Yedehew dem mefareja kat’a
Ketlantum
Yebase kemet’a (x2)

VERSE 3
Yewahitu ergb bezendo milas lay t’alech lijochwan
Tadiya man ayew lilat ch’ach’utochwan
Eko man ayehu lilat kifayochwan
Ere fith dagna wedet ale

VERSE 4
Ketemaws yihen gud min ale
Lemayraraw amets’ letemola
Fird yelem wey
Adera lebela (x2)

VERSE 5
Minew yale wetro qenu ch’elaleme ts’ena demenaw
Talaqu yefrd qen genana new
Talaqu yefrd qen miyasfera new
Akeldama midr qalwan set’ech

VERSE 6
YeEgziabher t’at yihn aderegech
Yeamets’egnoch qit’rachew ferese'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ken-amita', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kena Arekegn Deacon Endale Dereje (kena-arekegn-deacon-endale-dereje)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 1
በጡጫ ተመተህ ምራቅ ተተፋብህ
በአይሁድ ሸንጎ ፊት ቆመህ ተከሰህ
በደል ሳይኖርብህ የኔን በደል ወስደህ
እኔን ነጻ አደረግከኝ አንተ ተጎንብሰህ

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 2
በሸላቾቹ ፊት ዝም እንደሚል በግ
ዝም አለ ጌታዬ እንዳገኝ ማዕረግ 2×
ገፍትረው ሲጥሉህ ወደቅህ በእግሮችህ
እኔ እንድራመድ ደካማው ልጅህ

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 3
ተጠማህ ስለኔ እኔ እንዳልጠማ
አንተ ደማህልኝ ልጅህ እንዳልደማ
የእሾህ አክሊል ደፍተህ ለኔ ክብር አክሊል
ከለሜዳ ለብሰህ ለበስኩኝ ካባን

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 4
ሸክሜን አቀለልከው የዘመናት ነውሬን
እንባዬን አብሰህ መለስክልኝ ሳቄን

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ',
      lyrics_transliteration = 'CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 1
Bet’uch’a temeteh miraq tetefabh
Beayhud shengo fit qomeh tekeseh
Bedel saynorbh yenen bedel wesdeh
Enen nets’a aderegkegn ante tegonbseh

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 2
Beshelachochu fit zim endemil beg
Zim ale Getaye endagegn maereg 2×
Geftrew sit’luh wedeqh beegrochh
Ene endramed dekamaw lijh

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 3
Tet’emah silene ene endalt’ema
Ante demahlgn lijh endaldema
Yeeshoh aklil defteh lene kibir aklil
Kelemeda lebseh lebeskugn kaban

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 4
Shekmen aqelelkew yezemenat newren
Enbayen abseh melesklgn saqen

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kena-arekegn-deacon-endale-dereje'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 1
በጡጫ ተመተህ ምራቅ ተተፋብህ
በአይሁድ ሸንጎ ፊት ቆመህ ተከሰህ
በደል ሳይኖርብህ የኔን በደል ወስደህ
እኔን ነጻ አደረግከኝ አንተ ተጎንብሰህ

VERSE 2
በሸላቾቹ ፊት ዝም እንደሚል በግ
ዝም አለ ጌታዬ እንዳገኝ ማዕረግ 2×
ገፍትረው ሲጥሉህ ወደቅህ በእግሮችህ
እኔ እንድራመድ ደካማው ልጅህ

VERSE 3
ተጠማህ ስለኔ እኔ እንዳልጠማ
አንተ ደማህልኝ ልጅህ እንዳልደማ
የእሾህ አክሊል ደፍተህ ለኔ ክብር አክሊል
ከለሜዳ ለብሰህ ለበስኩኝ ካባን

VERSE 4
ሸክሜን አቀለልከው የዘመናት ነውሬን
እንባዬን አብሰህ መለስክልኝ ሳቄን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 1
Bet’uch’a temeteh miraq tetefabh
Beayhud shengo fit qomeh tekeseh
Bedel saynorbh yenen bedel wesdeh
Enen nets’a aderegkegn ante tegonbseh

VERSE 2
Beshelachochu fit zim endemil beg
Zim ale Getaye endagegn maereg 2×
Geftrew sit’luh wedeqh beegrochh
Ene endramed dekamaw lijh

VERSE 3
Tet’emah silene ene endalt’ema
Ante demahlgn lijh endaldema
Yeeshoh aklil defteh lene kibir aklil
Kelemeda lebseh lebeskugn kaban

VERSE 4
Shekmen aqelelkew yezemenat newren
Enbayen abseh melesklgn saqen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kena-arekegn-deacon-endale-dereje', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: kene Nesh (kene-nesh)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kene-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 1
ግብሬ ክፉ ስራ መንገዴ የግፍ
ፅልመት ያጨለመው ከድካም ማላርፍ
አንቺ ስትሰጪኝ ከመስቀሉ ግርጌ
እንዴት ላመስግንሽ እንዴትስ አድርጌ

VERSE 2
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 3
ቅኔ ነሽ የማይቆም ዝማሬ
ያፈልቃል መወድስ ከንፈሬ
ሞገስ ነሽ ለምስኪናን ሁሉ
ማርያም ምልዕተ ኩሉ

VERSE 4
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 5
አቦጊዳዬ ነሽ ፅድቅ የተማርኩብሽ
የፊደል ገበታ ጌታን ያወኩብሽ
የህይወት መገኛ ቤተልሔም ለህብስቱ
ተቀዳ ከሆድሽ ህይወት ለፍጥረቱ

VERSE 6
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 7
ርግብየ ንኢ ሰናይትየ
ልቤ አያርፍ ልጅሽን ካላየ
መገኛ የሰላም የዕረፍቱ
ላመነሽ ቅጥር ነሽ ዕርስቱ

VERSE 8
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 9
ምዕሊተ ፀጋ የንጉስ ሙሽራ
ለተጠማ ውሻ ልብሽ የሚራራ
ሸልሞ ከሰጠኝ አንቺን ለእናትነት
በስምሽ ልጠራ እንድታወቅበት

VERSE 10
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 11
ጣፋጭ ነሽ ከማር ከወለላ
ምስጋናሽ አንደበቴን ይሙላ
ለንጉስ ኪሩብ ለመንግስቱ
ማረፊያ ድንግል ለፍጥረቱ

VERSE 12
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 1
Gibre kifu sira mengede yegif
Tsilmet yach''elemew kedikam malarif
Anchi sitisetsign kemeskelu girge
Indet lamesginish indetis adirge

VERSE 2
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 3
K''ine nesh yemayikom zimare
Yafelkal mewedis kenfere
Moges nesh lemiskinan hulu
Maryam milite kulu

VERSE 4
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 5
Abogidaye nesh tsidik yetemarkubish
Yefidel gebeta getan yawekubish
Yehiwot megenya betelihem lehibistu
Tek''eda kehodish hiwot lefitretu

VERSE 6
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 7
Rigbiye ni''i senayitiye
Libe ayarif lijishin kalaye
Megenya yeselam ye''irefitu
Lamenesh kit''ir nesh iristu

VERSE 8
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 9
Mi''ilite tsega yenigus mushira
Letetema wusha libish yemirara
Shelmo kesetegn anchin le''inatinet
Besimish litera inditawek''ibet

VERSE 10
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 11
Tafach'' nesh kemar kewelela
Misganash andebeten yimula
Lenigus kirub lemengistu
Marefiya dingil lefitretu

VERSE 12
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kene-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kenitu Negn (kenitu-negn)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kenitu-negn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከንቱ ነኝ የከንቱ ከንቱ ነኝ
ዋስትና መከታ እግዚአብሔር ካልሆነኝ
ተስፋዬ የሚሆነኝ ሕይወት የሚሰጠኝ
እግዚአብሔ ብቻ ነው የሚያስተማምነኝ

VERSE 1
አምላኬ ብቻ ነው የሚያስተማምነኝ
እኔ ንጉሥ ነበርኩ በክብር ያጌጥኩኝ
ሁሉን በምድር ላይ በጥበብ ፈፀምኩኝ
የዚህ ዓለም ደስታ ምንም አላዋጣኝ

VERSE 2
በመጨረሻው ቀን በሞት ተወሰድኩኝ/2/
ከፀሐይቱ በታች አዲስ ነገር የለም
ሰዎች ይደክማሉ እስከ ዘለዓለም
ጥበቡን ፍለጋ ደክሜ ነበረ

VERSE 3
ሁሉም ከንቱ ሆኖ በመቃብር ቀረ/2/
ከእኔ አስቀድመዉ የከበሩ ሁሉ
አፈር ተጭኗቸዉ የከበሩ ሁሉ
እብደትና እዉቀት ሁሉን አወቅኳችሁ

VERSE 4
ምንም ቋሚ የለም ሁሉም ከንቱ ናቸዉ/2/
ልቤን የሰተሁት ተስፋ የጣልኩበት
አልጨበጥ ብሎኝ አለሁኝ በጭንቀት
የጥበቡም ብዛት ለትካዜ ሰተኝ

VERSE 5
እኔ በዚህ ምድር እጅግ ጐስቋላ ነኝ/2/
ልቤንም ፈተንኩት በደስታ በዛት
የዚህን አለም ለውጥ ጣውት አቀመስኩት
ሳቅም በልቤ ዉስጥ ይፍለቀለቅ ነበር

VERSE 6
ሁሉም ከንቱ ሆነ ገብቶ ከመቃበር/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kentu negn yekentu kentu negn
Wastna meketa Egziabher kalhonegn
Tesfaye yemihonegn hiywet yemiset’egn
Egziabhe bicha new yemiyastemamnegn

VERSE 1
Amlake bicha new yemiyastemamnegn
Ene nigus neberku bekbr yaget’kugn
Hulun bemdr lay bet’beb fets’emkugn
Yezih alem desta minm alawat’agn

VERSE 2
Bemech’ereshaw qen bemot tewesedkugn (2)
Kets’eheytu betach adis neger yelem
Sewoch yidekmalu eske zelealem
T’bebun filega dekme nebere

VERSE 3
Hulum kentu hono bemeqabr qere (2)
Keene asqedmewu yekeberu hulu
Afer tech’nwachewu yekeberu hulu
Ebdetna ewuqet hulun aweqkwachhu

VERSE 4
Minm qwami yelem hulum kentu nachewu (2)
Liben yesetehut tesfa yet’alkubet
Alch’ebet’ bilogn alehugn bech’nqet
Yet’bebum bizat letkaze setegn

VERSE 5
Ene bezih midr ejg gwesqwala negn (2)
Libenm fetenkut bedesta bezat
Yezihn alem lewt’ t’awt aqemeskut
Saqm belbe wust’ yifleqeleq neber

VERSE 6
Hulum kentu hone gebto kemeqaber (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kenitu-negn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: kentu eye (kentu-eye)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kentu-eye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 1
ኣምላኸይ ጥራይ’ዩ ዘጸናንዓኒ
ኣነስ ንጉሥ ነይረ ብኽብሪ ዘጌጽኩ
ኵሉ ኣብዚ ምድሪ ብጥበብ ፈጸምኩ
ደስታ እዛ ዓለም ዋላ ኣየዋጽኣንን

VERSE 2
መዓልተይ ኣኺሉ ሞትውን ወሲዱኒ/2/
ኣብ ትሕቲ እዛ ጸሓይ ሓድሽ ነገር የለን
ሰባት ግን ይደኽሙ ካብ ዘመን ናብ ዘመን
ን ጥበብ ክደሊ ደኺመየ ምሒር

VERSE 3
ኵሉ ከንቱ ኮይኑ ተሪፉ ኣብ መቓብር /2/
ቅድመይ ዝነብሩ ክቡራት ናይ ዓለም
ኣለዉ ኣብ መቓብር ሓመድ ተደፊኖም
ፍልጠትን ዕብዳንን ኵለን ፈሊጠየን

VERSE 4
ኵሎም ከንቱ እዮም ቀወምቲ ኣይኮኑን /2/
ልበይ ዝሃብክዎ ተስፋ ዘንበርኩሉ
ምጭባጥ ኣብዩኒ ክሕዞ ኣይከኣልኩን
ጥበብ ብምብዝሐይ እነሆ ተኪዘ

VERSE 5
ኣነስ ኣብዛ ዓለም ዘይጠቅም ፍጥረት’የ/2/
ብብዙሕ ታሕጓስ ልበይ ፈቲነዮ
ናይዚ ዓለም ለውጢ ኣስተማቒረዮ
ሰሓቕ’ውን ኣብ ውሽጠይ ይሰራሰር ነይሩ

VERSE 6
ኣብ ሓመድ ተሪፉ ኵሉ ከንቱ ኮይኑ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 1
Amlaኸy t’ray’yu zets’enanani
Anes nigus neyre biኽbri zegets’ku
Kwlu abzi midri bit’beb fets’emku
Desta eza alem wala ayewats’ann

VERSE 2
Mealtey aኺlu motwn wesiduni (2)
Ab tihti eza ts’ehay hadsh neger yelen
Sebat gin yideኽmu kab zemen nab zemen
N t’beb kideli deኺmeye mihir

VERSE 3
Kwlu kentu koynu terifu ab meቓbr (2)
Qidmey zinebru kiburat nay alem
Alewu ab meቓbr hamed tedefinom
Filt’etn ebdann kwlen felit’eyen

VERSE 4
Kwlom kentu eyom qewemti aykonun (2)
Libey zihabkwo tesfa zenberkulu
Mich’bat’ abyuni kihzo aykealkun
T’beb bimbzhey eneho tekize

VERSE 5
Anes abza alem zeyt’eqm fit’ret’ye (2)
Bibzuh tahgwas libey fetineyo
Nayzi alem lewt’i astemaቒreyo
Sehaቕ’wn ab wisht’ey yiseraser neyru

VERSE 6
Ab hamed terifu kwlu kentu koynu (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kentu-eye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kesetehegn Edime....zemarit Rut Demelash (kesetehegn-edime-zemarit-rut-demelash)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 1
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 2
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 3
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 4
ይቺንም አመት ተወኝ
ሁል ጊዜ እበድላለሁ
አንተ እየማርከኝ
እኔ በድላለሁ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 5
ባንተ አስጀምረኝ
ይቅርና በኔ
የተቆጠረ ነው
በፊት ዘመኔ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 6
ስለቸርነትህ
በአዲስ አመት
አዲስ እድሜ
ላመስግን

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 7
መድኃኔዓለም ደጋግሜ
ላመስግን
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 8
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ
ማለዳ ማለዳ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 9
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና
ሺህ አመት በፊት

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 10
እንዳለፈች ትናንት
ቀንም እንደ ሌሊት
ትሆናለች ትጋት
ማለዳም አብቦ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 11
ለሚረግፍ እድሜ
በዚህ አመት እንኳን
ይመር ፍጻሜ
ስለቸርነትህ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 12
በአዲስ አመት
አዲስ እድሜ
ላመስግን
መድኃኔዓለም ደጋግሜ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 13
ላመስግን
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 14
ምህረትህ እየበዛ
ትተበደለኝ
ማለዳ ማለዳ
ሁሌ አዲስ ነህና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 15
አመቱን ልጀምር
በአዲስ ምስጋና
በዘመን ማህፀን
የምታሳልፈኝ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 16
አንዱንም ያንተን ቀን
አንተ ነህ የምትሰጠኝ
አንድ ጊዜ ታይቶ
ለሚጠፋ ጥላ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 17
ወደፊት ነው እንጂ
አለኝ ወደ ኋላ
ስለቸርነትህ
በአዲስ አመት

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 18
አዲስ እድሜ
ላመስግን
መድኃኔዓለም ደጋግሜ
ላመስግን

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 19
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 20
ትተበደለኝ
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 21
በአዲስ ምስጋና
ዘመንም እንደ ልብስ
በዘመኔ ያረጀአል
አንተ ግን አንተ ነህ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 22
ዘመንም አያረጅአል
እኔ ያንተ ሳልሆን
ዘመኔን እንዳይፈትን
ስራኝ እንደገና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 23
የእውነት ሰው ልሁን
ስለቸርነትህ
በአዲስ አመት
አዲስ እድሜ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 24
ላመስግን
መድኃኔዓለም ደጋግሜ
ላመስግን
አማኑኤል ደጋግሜ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 25
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 26
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 27
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 28
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ',
      lyrics_transliteration = 'CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 1
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 2
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 3
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 4
Yichinm amet tewegn
Hul gize ebedlalehu
Ante eyemarkegn
Ene bedlalehu

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 5
Bante asjemregn
Yiqrna bene
Yeteqot’ere new
Befit zemene

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 6
Silecherneth
Beadis amet
Adis edme
Lamesgn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 7
Medhanealem degagme
Lamesgn
Amanuel degagme
Keset’eኸgn edme

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 8
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn
Maleda maleda

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 9
Hule adis nehna
Ametun lijemr
Beadis misgana
Shih amet befit

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 10
Endalefech tinant
Qenm ende lelit
Tihonalech tigat
Maledam abbo

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 11
Lemiregf edme
Bezih amet enkwan
Yimer fits’ame
Silecherneth

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 12
Beadis amet
Adis edme
Lamesgn
Medhanealem degagme

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 13
Lamesgn
Amanuel degagme
Keset’eኸgn edme
Keset’eኸgn qen

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 14
Mihreth eyebeza
Titebedelegn
Maleda maleda
Hule adis nehna

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 15
Ametun lijemr
Beadis misgana
Bezemen mahts’en
Yemtasalfegn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 16
Andunm yanten qen
Ante neh yemtset’egn
And gize tayto
Lemit’efa t’la

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 17
Wedefit new enji
Alegn wede hwala
Silecherneth
Beadis amet

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 18
Adis edme
Lamesgn
Medhanealem degagme
Lamesgn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 19
Amanuel degagme
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 20
Titebedelegn
Maleda maleda
Hule adis nehna
Ametun lijemr

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 21
Beadis misgana
Zemenm ende libs
Bezemene yarejeal
Ante gin ante neh

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 22
Zemenm ayarejal
Ene yante salhon
Zemenen endayfetn
Siragn endegena

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 23
Yeewnet sew lihun
Silecherneth
Beadis amet
Adis edme

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 24
Lamesgn
Medhanealem degagme
Lamesgn
Amanuel degagme

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 25
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 26
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 27
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 28
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kesetehegn-edime-zemarit-rut-demelash'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 1
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

VERSE 2
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 3
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

VERSE 4
ይቺንም አመት ተወኝ
ሁል ጊዜ እበድላለሁ
አንተ እየማርከኝ
እኔ በድላለሁ

VERSE 5
ባንተ አስጀምረኝ
ይቅርና በኔ
የተቆጠረ ነው
በፊት ዘመኔ

VERSE 6
ስለቸርነትህ
በአዲስ አመት
አዲስ እድሜ
ላመስግን

VERSE 7
መድኃኔዓለም ደጋግሜ
ላመስግን
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ

VERSE 8
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ
ማለዳ ማለዳ

VERSE 9
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና
ሺህ አመት በፊት

VERSE 10
እንዳለፈች ትናንት
ቀንም እንደ ሌሊት
ትሆናለች ትጋት
ማለዳም አብቦ

VERSE 11
ለሚረግፍ እድሜ
በዚህ አመት እንኳን
ይመር ፍጻሜ
ስለቸርነትህ

VERSE 12
በአዲስ አመት
አዲስ እድሜ
ላመስግን
መድኃኔዓለም ደጋግሜ

VERSE 13
ላመስግን
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን

VERSE 14
ምህረትህ እየበዛ
ትተበደለኝ
ማለዳ ማለዳ
ሁሌ አዲስ ነህና

VERSE 15
አመቱን ልጀምር
በአዲስ ምስጋና
በዘመን ማህፀን
የምታሳልፈኝ

VERSE 16
አንዱንም ያንተን ቀን
አንተ ነህ የምትሰጠኝ
አንድ ጊዜ ታይቶ
ለሚጠፋ ጥላ

VERSE 17
ወደፊት ነው እንጂ
አለኝ ወደ ኋላ
ስለቸርነትህ
በአዲስ አመት

VERSE 18
አዲስ እድሜ
ላመስግን
መድኃኔዓለም ደጋግሜ
ላመስግን

VERSE 19
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ

VERSE 20
ትተበደለኝ
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር

VERSE 21
በአዲስ ምስጋና
ዘመንም እንደ ልብስ
በዘመኔ ያረጀአል
አንተ ግን አንተ ነህ

VERSE 22
ዘመንም አያረጅአል
እኔ ያንተ ሳልሆን
ዘመኔን እንዳይፈትን
ስራኝ እንደገና

VERSE 23
የእውነት ሰው ልሁን
ስለቸርነትህ
በአዲስ አመት
አዲስ እድሜ

VERSE 24
ላመስግን
መድኃኔዓለም ደጋግሜ
ላመስግን
አማኑኤል ደጋግሜ

VERSE 25
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 26
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

VERSE 27
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 28
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 1
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

VERSE 2
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 3
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

VERSE 4
Yichinm amet tewegn
Hul gize ebedlalehu
Ante eyemarkegn
Ene bedlalehu

VERSE 5
Bante asjemregn
Yiqrna bene
Yeteqot’ere new
Befit zemene

VERSE 6
Silecherneth
Beadis amet
Adis edme
Lamesgn

VERSE 7
Medhanealem degagme
Lamesgn
Amanuel degagme
Keset’eኸgn edme

VERSE 8
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn
Maleda maleda

VERSE 9
Hule adis nehna
Ametun lijemr
Beadis misgana
Shih amet befit

VERSE 10
Endalefech tinant
Qenm ende lelit
Tihonalech tigat
Maledam abbo

VERSE 11
Lemiregf edme
Bezih amet enkwan
Yimer fits’ame
Silecherneth

VERSE 12
Beadis amet
Adis edme
Lamesgn
Medhanealem degagme

VERSE 13
Lamesgn
Amanuel degagme
Keset’eኸgn edme
Keset’eኸgn qen

VERSE 14
Mihreth eyebeza
Titebedelegn
Maleda maleda
Hule adis nehna

VERSE 15
Ametun lijemr
Beadis misgana
Bezemen mahts’en
Yemtasalfegn

VERSE 16
Andunm yanten qen
Ante neh yemtset’egn
And gize tayto
Lemit’efa t’la

VERSE 17
Wedefit new enji
Alegn wede hwala
Silecherneth
Beadis amet

VERSE 18
Adis edme
Lamesgn
Medhanealem degagme
Lamesgn

VERSE 19
Amanuel degagme
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza

VERSE 20
Titebedelegn
Maleda maleda
Hule adis nehna
Ametun lijemr

VERSE 21
Beadis misgana
Zemenm ende libs
Bezemene yarejeal
Ante gin ante neh

VERSE 22
Zemenm ayarejal
Ene yante salhon
Zemenen endayfetn
Siragn endegena

VERSE 23
Yeewnet sew lihun
Silecherneth
Beadis amet
Adis edme

VERSE 24
Lamesgn
Medhanealem degagme
Lamesgn
Amanuel degagme

VERSE 25
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 26
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

VERSE 27
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 28
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kesetehegn-edime-zemarit-rut-demelash', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kibir Lesilase (kibir-lesilase)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 1
ምድርን በአፉ ቃል በዉሃ ላይ ረጋ
በርሃንን ፈጥሮ አለሙን ያበራ
ጨለማንም ሰርቶ ሌሊት ብሎ ጠራዉ
ክብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ በሰማይ በምድር ምስጋና ይፍሰስ(2)

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 2
በዉሆች መካከል ጠፈር አደረገ ከፈላቸዉና ህጉን ደነገገ የምድርቱን ዉሃ
ባአንድ ሰበሰበዉ መከማቻዉንም ስሙን ባህር አለዉ
ምድር ዘር እንትሰጥ አንድት ቃል አወጣ
አየናት ለምልማ በአበቦች አግጣ

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 3
ቀንና ለልቱን እግዝአብሔር ለየዉ አለሙን ስላሴ ፈጠረ አሳመረዉ
የሰዉን ልጅ ከአፈር ከምድር አነሳዉ
በመልኩ በአርዕያዉ በምሳለዉ ሰራዉ
ህያዉ አደረገዉ በእጁ ሰራዉና የራሱን

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 4
እስትንፋስ እፍ አለበትና
ከብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ
በሰማይ በምድር ምስጋና ይፍሴስ

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ',
      lyrics_transliteration = 'CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 1
Midrn beafu qal bewuha lay rega
Berhann fet’ro alemun yabera
Ch’elemanm serto lelit bilo t’erawu
Kibir leSilassie leabna leweld lemenfes Kidus besemay bemdr misgana yifses (2)

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 2
Bewuhoch mekakel t’efer aderege kefelachewuna higun denegege yemdrtun wuha
Baand sebesebewu mekemachawunm simun bahr alewu
Midr zer entset’ andt qal awet’a
Ayenat lemlma beabeboch agt’a

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 3
Qenna leltun egzabher leyewu alemun Silassie fet’ere asamerewu
Yesewun lij keafer kemdr anesawu
Bemelku beareyawu bemsalewu serawu
Hiyawu aderegewu beeju serawuna yerasun

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 4
Estnfas ef alebetna
Kebr leSilassie leabna leweld lemenfes Kidus
Besemay bemdr misgana yifses

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kibir-lesilase'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 1
ምድርን በአፉ ቃል በዉሃ ላይ ረጋ
በርሃንን ፈጥሮ አለሙን ያበራ
ጨለማንም ሰርቶ ሌሊት ብሎ ጠራዉ
ክብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ በሰማይ በምድር ምስጋና ይፍሰስ(2)

VERSE 2
በዉሆች መካከል ጠፈር አደረገ ከፈላቸዉና ህጉን ደነገገ የምድርቱን ዉሃ
ባአንድ ሰበሰበዉ መከማቻዉንም ስሙን ባህር አለዉ
ምድር ዘር እንትሰጥ አንድት ቃል አወጣ
አየናት ለምልማ በአበቦች አግጣ

VERSE 3
ቀንና ለልቱን እግዝአብሔር ለየዉ አለሙን ስላሴ ፈጠረ አሳመረዉ
የሰዉን ልጅ ከአፈር ከምድር አነሳዉ
በመልኩ በአርዕያዉ በምሳለዉ ሰራዉ
ህያዉ አደረገዉ በእጁ ሰራዉና የራሱን

VERSE 4
እስትንፋስ እፍ አለበትና
ከብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ
በሰማይ በምድር ምስጋና ይፍሴስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 1
Midrn beafu qal bewuha lay rega
Berhann fet’ro alemun yabera
Ch’elemanm serto lelit bilo t’erawu
Kibir leSilassie leabna leweld lemenfes Kidus besemay bemdr misgana yifses (2)

VERSE 2
Bewuhoch mekakel t’efer aderege kefelachewuna higun denegege yemdrtun wuha
Baand sebesebewu mekemachawunm simun bahr alewu
Midr zer entset’ andt qal awet’a
Ayenat lemlma beabeboch agt’a

VERSE 3
Qenna leltun egzabher leyewu alemun Silassie fet’ere asamerewu
Yesewun lij keafer kemdr anesawu
Bemelku beareyawu bemsalewu serawu
Hiyawu aderegewu beeju serawuna yerasun

VERSE 4
Estnfas ef alebetna
Kebr leSilassie leabna leweld lemenfes Kidus
Besemay bemdr misgana yifses'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kibir-lesilase', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kibire New Kibirihin Menagere (kibire-new-kibirihin-menagere)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kibire-new-kibirihin-menagere'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ 2

VERSE 2
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ 2

VERSE 3
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

VERSE 4
አባቴ ነህና የምታስብ ለእኔ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

VERSE 5
ተመስገን ተመስገን ጠዋትና ማታ 2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu 2

VERSE 1
Ayche yeejhn tamrat
Semche yeqalhn timhrt
Hognalehu miskr leadagnneth
Sigan tewahdeh leegna megelet’h 2

VERSE 2
Teketelkuh hulun neger niqe
Medhenit mehonkn awqe
Kemelkamwa beth tet’elyalehu
Yeejhn bereket kante et’egbalehu 2

VERSE 3
Erf yizhe lalars wedehwala
Eyayehu mereben sitmola
Emekabhelew bante medhne
Amlake nehna yemtrara leene

VERSE 4
Abate nehna yemtasb leene
Chernet mihret kebezalgn
Lesmh widase qine alegn
Kibrena mogese ante neh Geta

VERSE 5
Temesgen temesgen t’ewatna mata 2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kibire-new-kibirihin-menagere', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kibire New Kibirihin Menagere (kibire-new-kibirihin-menagere-28gigilxh-q)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 2
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 3
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 4
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 5
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 6
አባቴ ነህና የምታስብ ለእኔ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 7
ስጠራህ ሳመልክህ ኖራለሁ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 8
ተመስገን ተመስገን ጠዋትና ማታ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 9
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ',
      lyrics_transliteration = 'CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 1
Ayche yeejhn tamrat
Semche yeqalhn timhrt
Hognalehu miskr leadagnneth
Sigan tewahdeh leegna megelet’h

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 2
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 3
Teketelkuh hulun neger niqe
Medhenit mehonkn awqe
Kemelkamwa beth tet’elyalehu
Yeejhn bereket kante et’egbalehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 4
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 5
Erf yizhe lalars wedehwala
Eyayehu mereben sitmola
Emekabhelew bante medhne
Amlake nehna yemtrara leene

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 6
Abate nehna yemtasb leene
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 7
Sit’erah samelkh noralehu
Chernet mihret kebezalgn
Lesmh widase qine alegn
Kibrena mogese ante neh Geta

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 8
Temesgen temesgen t’ewatna mata
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 9
Sit’erah samelkh noralehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kibire-new-kibirihin-menagere-28gigilxh-q'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ

VERSE 2
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 3
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ

VERSE 4
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 5
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

VERSE 6
አባቴ ነህና የምታስብ ለእኔ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

VERSE 7
ስጠራህ ሳመልክህ ኖራለሁ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

VERSE 8
ተመስገን ተመስገን ጠዋትና ማታ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

VERSE 9
ስጠራህ ሳመልክህ ኖራለሁ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 1
Ayche yeejhn tamrat
Semche yeqalhn timhrt
Hognalehu miskr leadagnneth
Sigan tewahdeh leegna megelet’h

VERSE 2
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 3
Teketelkuh hulun neger niqe
Medhenit mehonkn awqe
Kemelkamwa beth tet’elyalehu
Yeejhn bereket kante et’egbalehu

VERSE 4
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 5
Erf yizhe lalars wedehwala
Eyayehu mereben sitmola
Emekabhelew bante medhne
Amlake nehna yemtrara leene

VERSE 6
Abate nehna yemtasb leene
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew

VERSE 7
Sit’erah samelkh noralehu
Chernet mihret kebezalgn
Lesmh widase qine alegn
Kibrena mogese ante neh Geta

VERSE 8
Temesgen temesgen t’ewatna mata
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew

VERSE 9
Sit’erah samelkh noralehu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kibire-new-kibirihin-menagere-28gigilxh-q', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kibre New (kibre-new)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kibre-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ 2

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ 2

VERSE 2
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ 2

VERSE 3
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

VERSE 4
አባቴ ነህና የምታስብ ለእኔ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

VERSE 5
ተመስገን ተመስገን ጠዋትና ማታ 2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'kbre new kbrhn menagere
tsdqe new fqrhn memeskere
getaye emlake lhelew
sterah samelkh noralehu 2

VERSE 1
eyche yejhn tamrat
semche yeqalhn tmhrt
honyalehu mskr leedanyneth

VERSE 2
sgan tewahdeh lenya megeleth 2
teketelkuh hulun neger nqe
medhenit mehonkn ewqe
kemelka beth tetelyalehu

VERSE 3
yejhn bereket kante tegbalehu 2
rf yzhe lalars wedela
yayehu mereben stmola

VERSE 4
mekabhelew bante medhne
emlake nehna yemtrara lene
ebate nehna yemtasb lene
chernet mhret kebezalny

VERSE 5
lesmh wdase qne eleny
kbrena mogese ente neh geta
temesgen temesgen tewatna mata 2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kibre-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidan Mihiret Emebet (kidan-mihiret-emebet)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidan-mihiret-emebet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነ ምህረት እመቤት እመቤት(2)
ነይልን ነይልን ካለንበት(2)

VERSE 1
ከሰማያት በላይ ካለው ከማደሪያሽ (2)
ዝማሬ ክሞላው ከዘላለም ቤትሽ
የምድር ፍጥረታት ማርያም ማርያም ሲሉሽ (2)
የቃል እናት እመቤቴ ነይ በሰረገላሽ (2)

VERSE 2
ከፀጥታ ወደብ ከፍቅር አውድማ (2)
ከሰላሙ መንደር ከእውነት ከተማ
ሰአሊለነ ቅድስት ውዳሴ ሲሰማ (2)
ከሚካኤል ክገብርኤል ጋር ነይልን ከራማ (2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት(2)
እንባችን ይታበስ ባንቺ አማላጅነት
በጽዮን ዝማሬ ተሞላ ነፍሳችን (2)
ንዒ (3) እንበል እንደ አባቶቻችን (2)

VERSE 4
ፍጥረታት ሊድኑ በአማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብጽዕት ይሉሻል(2)
እናቴ መመኪያዬ ምርኩዜ ሆነሻል (2)

VERSE 5
የልብን ሲያዋዩሽ ሰምተሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨከንም
ከዓይን ጥቅሻ ፈጥነሽ ትደርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 1
Kesemayat belay kalew kemaderiyash (2)
Zimare kimolaw kezelalem betsh
Yemdr fit’retat Maryam Maryam silush (2)
Yeqal enat Emebete ney beseregelash (2)

VERSE 2
Kets’et’ta wedeb kefqr awdma (2)
Keselamu mender keewnet ketema
Sealilene Kidist widase sisema (2)
Kemikael kigebrel gar neyln kerama (2)

VERSE 3
Zerfafaw qemissh yiwred kesemayat (2)
Enbachn yitabes banchi amalajnet
Bets’yon zimare temola nefsachn (2)
Nii (3) enbel ende abatochachn (2)

VERSE 4
Fit’retat lidnu beamalajnetsh (2)
Yezelalem kidan Amanuel set’esh
Tiwld yihn amno bits’et yilushal (2)
Enate memekiyaye mirkuze honeshal (2)

VERSE 5
Yelbn siyawayush semtesh zim atym (2)
Chgregnan ayto libsh aych’ekenm
Keayn t’qsha fet’nesh tidershletalesh (2)
Kehezen kemekera tasarfiwalesh (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidan-mihiret-emebet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidane Mihiret (kidane-mihiret)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 1
የጥፋት ማምለጫ መርከብ
ይዛለች የሕይወት ማዕድ
ብፅዕት ይላታል ትውልድ
ካህናቱ ቆመው በአንድነት

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 2
ይጠሯታል እያሉ ቅድስት
ነይ ይሏታል በያሬድ ዜማ
እመ እግዚአብሔር ንግሥተ ራማ
ሕብር ባለው ቀስተደመና

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 3
ምልክት ሆናለችና
ሰንሰለቱ ተሰባበረ
ልጇ ታሪክ ቀየረ
ከዞብል ስደርስ አስሼ ምድርን

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 4
አየሁኝ ገዳም ታላቋ ራማን
ምድራዊ ገነት የሰላም ቦታ
የጽድቅ ምዕራፍ የነፍስ እርካታ
እንዲምረኝ መሐሪ ልጇ

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 5
ሱባኤ ገባሁ ከደጇ
ሸክሜ ተንከባለለ
በድንግል ሁሉ ቀለለ
በጭንቀት ያለ በሀዘን በእስራት

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 6
ይሂድ ራማ ኪዳነ ምሕረት
ምስክር ነኝ ስለ እርሷ ምልጃ
ስንቱን አለፍኩኝ ደርሼ ደጇ
ከአምላኳ ጸጋን አግኝታ

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 7
የስንቱ ችግር ተፈታ
ብርቱ ነው የለም ደካማ
የሄደ በእምነት ራማ
ልሂድ ልገስግስ ልሰዋ ቅኔ

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 8
ታብሷልና እንባ ከዓይኔ
ላቅርብ ዝማሬ ስሟንም ልጥራ
እያልኩ የራማ ኪዳነ ምሕረት
አምላክ ነው እጇ ላይ ያለው

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 9
በክንዷ የታቀፈችው
ምሕረትን የተሸከመች
አንድ ናት ፈጥኖ ደራሽ ነች
ሊቃውንቱ መነኮሳቱ

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 10
ምእመናን ሕጻናቱ
ይጠሯታል የእርሷ ልጆች
እናታቸው መመኪያቸው ስለሆነች

CHORUS
ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ',
      lyrics_transliteration = 'CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 1
Yet’fat mamlech’a merkeb
Yizalech yehywet maed
Bits’et yilatal tiwld
Kahnatu qomew beandnet

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 2
Yit’erwatal eyalu Kidist
Ney yilwatal beyared zema
Eme Egziabher nigste rama
Hibr balew qestedemena

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 3
Milkt honalechna
Senseletu tesebabere
Lijwa tarik qeyere
Kezobl siders asshe midrn

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 4
Ayehugn gedam talaqwa raman
Midrawi genet yeselam bota
Yets’dq mieraf yenefs erkata
Endimregn meheri lijwa

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 5
Subae gebahu kedejwa
Shekme tenkebalele
Bedngl hulu qelele
Bech’nqet yale behezen beesrat

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 6
Yihid rama kidane mihret
Miskr negn sile erswa milja
Sintun alefkugn dershe dejwa
Keamlakwa ts’egan aggnta

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 7
Yesntu chgr tefeta
Birtu new yelem dekama
Yehede beemnet rama
Lihid ligesgs lisewa qine

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 8
Tabswalna enba keayne
Laqrb zimare simwanm lit’ra
Eyalku yerama kidane mihret
Amlak new ejwa lay yalew

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 9
Bekndwa yetaqefechw
Mihretn yeteshekemech
And nat fet’no derash nech
Liqawntu menekosatu

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 10
Miemenan hits’anatu
Yit’erwatal yeerswa lijoch
Enatachew memekiyachew silehonech

CHORUS
Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidane-mihiret'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነ ምሕረት ኪዳነ ምሕረት ፪
መጣች ከራማ የጠራኋት እለት
እኔን ልታድን ልትሰጠኝ ምሕረት ፪
የኪዳን የእርቅ መዝገብ

VERSE 1
የጥፋት ማምለጫ መርከብ
ይዛለች የሕይወት ማዕድ
ብፅዕት ይላታል ትውልድ
ካህናቱ ቆመው በአንድነት

VERSE 2
ይጠሯታል እያሉ ቅድስት
ነይ ይሏታል በያሬድ ዜማ
እመ እግዚአብሔር ንግሥተ ራማ
ሕብር ባለው ቀስተደመና

VERSE 3
ምልክት ሆናለችና
ሰንሰለቱ ተሰባበረ
ልጇ ታሪክ ቀየረ
ከዞብል ስደርስ አስሼ ምድርን

VERSE 4
አየሁኝ ገዳም ታላቋ ራማን
ምድራዊ ገነት የሰላም ቦታ
የጽድቅ ምዕራፍ የነፍስ እርካታ
እንዲምረኝ መሐሪ ልጇ

VERSE 5
ሱባኤ ገባሁ ከደጇ
ሸክሜ ተንከባለለ
በድንግል ሁሉ ቀለለ
በጭንቀት ያለ በሀዘን በእስራት

VERSE 6
ይሂድ ራማ ኪዳነ ምሕረት
ምስክር ነኝ ስለ እርሷ ምልጃ
ስንቱን አለፍኩኝ ደርሼ ደጇ
ከአምላኳ ጸጋን አግኝታ

VERSE 7
የስንቱ ችግር ተፈታ
ብርቱ ነው የለም ደካማ
የሄደ በእምነት ራማ
ልሂድ ልገስግስ ልሰዋ ቅኔ

VERSE 8
ታብሷልና እንባ ከዓይኔ
ላቅርብ ዝማሬ ስሟንም ልጥራ
እያልኩ የራማ ኪዳነ ምሕረት
አምላክ ነው እጇ ላይ ያለው

VERSE 9
በክንዷ የታቀፈችው
ምሕረትን የተሸከመች
አንድ ናት ፈጥኖ ደራሽ ነች
ሊቃውንቱ መነኮሳቱ

VERSE 10
ምእመናን ሕጻናቱ
ይጠሯታል የእርሷ ልጆች
እናታቸው መመኪያቸው ስለሆነች'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidane mihret kidane mihret 2
Met’ach kerama yet’erahwat elet
Enen litadn litset’egn mihret 2
Yekidan yeerq mezgeb

VERSE 1
Yet’fat mamlech’a merkeb
Yizalech yehywet maed
Bits’et yilatal tiwld
Kahnatu qomew beandnet

VERSE 2
Yit’erwatal eyalu Kidist
Ney yilwatal beyared zema
Eme Egziabher nigste rama
Hibr balew qestedemena

VERSE 3
Milkt honalechna
Senseletu tesebabere
Lijwa tarik qeyere
Kezobl siders asshe midrn

VERSE 4
Ayehugn gedam talaqwa raman
Midrawi genet yeselam bota
Yets’dq mieraf yenefs erkata
Endimregn meheri lijwa

VERSE 5
Subae gebahu kedejwa
Shekme tenkebalele
Bedngl hulu qelele
Bech’nqet yale behezen beesrat

VERSE 6
Yihid rama kidane mihret
Miskr negn sile erswa milja
Sintun alefkugn dershe dejwa
Keamlakwa ts’egan aggnta

VERSE 7
Yesntu chgr tefeta
Birtu new yelem dekama
Yehede beemnet rama
Lihid ligesgs lisewa qine

VERSE 8
Tabswalna enba keayne
Laqrb zimare simwanm lit’ra
Eyalku yerama kidane mihret
Amlak new ejwa lay yalew

VERSE 9
Bekndwa yetaqefechw
Mihretn yeteshekemech
And nat fet’no derash nech
Liqawntu menekosatu

VERSE 10
Miemenan hits’anatu
Yit’erwatal yeerswa lijoch
Enatachew memekiyachew silehonech'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidane-mihiret', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidane Mihiret (kidane-mihiret-574)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidane-mihiret-574'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 1
የአዳም ተስፋው ነሽ የሴት ቸርነቱ
ኪዳነምህረት ነሽ የኖህ ምልክቱ
አዳም ደጅ የጠናሽ ሲገባ ንስሀ
ኖህም ድኖብሻል ከጥፋቱ ውሃ

VERSE 2
የአብርሃም ድንኳን ነሽ የሙሴ ፅላቱ
ማርያም አንቺ ነሽ የፈጣሪ እናቱ
የእስራኤል መሰላል የሴም እጣ ክፍሉ
እመብርሃን ስሚኝ ልመናየን ሁሉ

VERSE 3
የሰሎሞን አክሊል የዳዊት ዝማሬ
ድንግል መሆንሽን ትመስክር ከንፈሬ
ለተጠማው ውሻ የሚራራው ልብሽ
ለኔም እራርቶልኝ አስታርቂኝ ከልጅሽ

VERSE 4
የአብርሃም ድንኳን ነሽ የሙሴ ፅላቱ
ማርያም አንች ነሽ የፈጣሪ እናቱ
የእስራኤል መሰላል የሴም እጣ ክፍሉ
እመብርሃን ስሚኝ ልመናዬን ሁሉ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)

VERSE 1
Yeadam tesfaw nesh yeset chernetu
Kidanemhret nesh yenoh milktu
Adam dej yet’enash sigeba nishe
Nohm dinobshal ket’fatu wiha

VERSE 2
Yeabrham dinkwan nesh yemuse ts’latu
Maryam anchi nesh yefet’ari enatu
Yeesrael meselal yesem et’a kiflu
Emebrhan simign limenayen hulu

VERSE 3
Yeselomon aklil yedawit zimare
Dingil mehonshn timeskr kenfere
Letet’emaw wisha yemiraraw libsh
Lenem erartolgn astarqign keljsh

VERSE 4
Yeabrham dinkwan nesh yemuse ts’latu
Maryam anch nesh yefet’ari enatu
Yeesrael meselal yesem et’a kiflu
Emebrhan simign limenayen hulu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidane-mihiret-574', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidane Mihiret Enate (kidane-mihiret-enate)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidane-mihiret-enate'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልፏል መናኛው ኑሮ ምልጃሽ ውሃውን ቀይሮ
መልካሙ ወይን ደረሰ እምባዬ በአንቺ ታበሰ (2)
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 1
ከአፌ ሳይወጣ ሳልነግርሽ (2)
ልዘምር ልቁም ከፊትሽ ልምጣ ልምበርከክ ለክብርሽ
ብርቅ ከሀገር ከቤቴ ከቶ አልረሳሽም እናቴ ከቶ አልረሳሽም እናቴ
ኪዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 2
ከአፌ ሳይወጣ ሳልነግርሽ (2)
አልልም መቼ ነው ቀኑ የእኔ መጎብኛ ዘበኑ እንደሚፈጸም አምናለሁ
ሁሉን በጊዜው አያለሁ (2)
ክዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 3
ከአፌ ሳይወጣ ሳልነግርሽ (2)
የልቤን ችግር ላዋይሽ ከስዕልሽ ፊት ቆሜ እንባዬ ቀድሞ ዝም አልኩኝ
ሳልነግርሽ ስለምታውቂ (2)
ክዳነ ምሕረት እናቴ ምጥስረኛዬ ጓዳዬ የጎደለኝን ታውቂያለሽ

VERSE 4
ከአፌ ሳይሰጣ ሳልነግርሽ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh keafe saywet’a salnegrsh (2)
Alfwal menagnaw nuro miljash wihawn qeyro
Melkamu weyn derese embaye beanchi tabese (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 1
Keafe saywet’a salnegrsh (2)
Lizemr liqum kefitsh limt’a limberkek lekbrsh
Birq keheger kebete keto alresashm enate keto alresashm enate
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 2
Keafe saywet’a salnegrsh (2)
Allm meche new qenu yeene megobgna zebenu endemifets’em amnalehu
Hulun begizew ayalehu (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 3
Keafe saywet’a salnegrsh (2)
Yelben chgr lawaysh keselsh fit qome enbaye qedmo zim alkugn
Salnegrsh silemtawqi (2)
Kidane mihret enate mit’sregnaye gwadaye yegodelegnn tawqiyalesh

VERSE 4
Keafe sayset’a salnegrsh (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidane-mihiret-enate', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidane Mihiret Enate (kidane-mihiret-enate-661)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidane-mihiret-enate-661'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 1
የልቤን ሁሉ ያዋየሁሽን
መቼ ቀረብኝ አየሽ መሻቴ
በቃል ኪዳንሽ ጸና ጉልበቴ
ያገኘሁትን እኔ አውቃለሁ

VERSE 2
የቱንስ ትቼ የቱን ነግራለሁ
ሚስጥረኛዬ አጽናኝ ዘመዴ
ክብር ሆኖኛል አንቺን መውደዴ
የውዳሴሸን ቃል ጣዕሙ ብዙ ነው

VERSE 3
አንቺን የያዘ ዛሬም ብረቱ ነው
ገዳዬ ቢዝት መች ይችለኛል
ኪዳንሽ ዛሬም ይሸፍነኛል
የጌታዬ እናት አማላጂቱ

VERSE 4
ለፍጥረት ሁሉ ነሽ አዛኝቱ
እኔ አንቺን ይዤመንገዴ ቀና
ሠላም እለኪ እመ ትህትና
የጭንቄ ደራሽ እንባዬን አባሽ

VERSE 5
አንዴት አድራለው አንቺን ሳልጠራሽ
ሰላም ሆኛለው ደጅሽ አድጌ
ልዘምርልሽ እኔ አደግድጌ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 1
Yelben hulu yawayehushn
Meche qerebgn ayesh meshate
Beqal kidansh ts’ena gulbete
Yagegnehutn ene awqalehu

VERSE 2
Yetuns tiche yetun negralehu
Mist’regnaye ats’nagn zemede
Kibir honognal anchin mewdede
Yewdaseshen qal t’aemu bizu new

VERSE 3
Anchin yeyaze zarem biretu new
Gedaye bizt mech yichlegnal
Kidansh zarem yishefnegnal
Yegetaye enat amalajitu

VERSE 4
Left’ret hulu nesh azagntu
Ene anchin yizhemengede qena
Selam eleki eme tihtna
Yech’nqe derash enbayen abash

VERSE 5
Andet adralew anchin salt’erash
Selam hognalew dejsh adge
Lizemrlsh ene adegdge'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidane-mihiret-enate-661', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidane Mihret Emebet (kidane-mihret-emebet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኪዳነ ምሕረት እመቤት
የዓለም ሁሉ መድሃኒት
ቅድስተ ቅዱሳን ንጽሕት
አንቺ ነሽ የአምላካችን እናት

VERSE 1
ጌታ አንቺን መረጠሽ ልዩ አድርጎ
በሚያስድንቅ ሚሥጢሩ ተዋሕዶ
ለልዑል ማደርያነት የተመረጥሽ
ያለህማም ወለድሽው ድንግል ሆነሽ

CHORUS
ኪዳነ ምሕረት እመቤት
የዓለም ሁሉ መድሃኒት
ቅድስተ ቅዱሳን ንጽሕት
አንቺ ነሽ የአምላካችን እናት

VERSE 2
እናትነት ድንግልና
አስተባበረሽ ይዘሻልና
ድንግልም እናትም እመብርሃን
ቅድስተ ቅዱሳን እኛን አማልጅን

CHORUS
ኪዳነ ምሕረት እመቤት
የዓለም ሁሉ መድሃኒት
ቅድስተ ቅዱሳን ንጽሕት
አንቺ ነሽ የአምላካችን እናት',
      lyrics_transliteration = 'CHORUS
Kidane Mihret Emebet
Yealem hulu medhanit
Kideste kidusan nitshit
Anchi nesh yeAmlakachin enat

VERSE 1
Geta anchin meretesh leyu adergo
Bemiyasdeniq misteru tewahedo
Leleul maderyanet yetemeretsh
Yalehimam weledshiw dingil honesh

CHORUS
Kidane Mihret Emebet
Yealem hulu medhanit
Kideste kidusan nitshit
Anchi nesh yeAmlakachin enat

VERSE 2
Enatnet dingilina
Astebabresh yezeshalena
Dingilim enatim Eme Birhan
Kideste kidusan egnan amaljin

CHORUS
Kidane Mihret Emebet
Yealem hulu medhanit
Kideste kidusan nitshit
Anchi nesh yeAmlakachin enat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidane-mihret-emebet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነ ምሕረት እመቤት
የዓለም ሁሉ መድሃኒት
ቅድስተ ቅዱሳን ንጽሕት
አንቺ ነሽ የአምላካችን እናት

VERSE 1
ጌታ አንቺን መረጠሽ ልዩ አድርጎ
በሚያስድንቅ ሚሥጢሩ ተዋሕዶ
ለልዑል ማደርያነት የተመረጥሽ
ያለህማም ወለድሽው ድንግል ሆነሽ

VERSE 2
እናትነት ድንግልና
አስተባበረሽ ይዘሻልና
ድንግልም እናትም እመብርሃን
ቅድስተ ቅዱሳን እኛን አማልጅን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidane Mihret Emebet
Yealem hulu medhanit
Kideste kidusan nitshit
Anchi nesh yeAmlakachin enat

VERSE 1
Geta anchin meretesh leyu adergo
Bemiyasdeniq misteru tewahedo
Leleul maderyanet yetemeretsh
Yalehimam weledshiw dingil honesh

VERSE 2
Enatnet dingilina
Astebabresh yezeshalena
Dingilim enatim Eme Birhan
Kideste kidusan egnan amaljin'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidane-mihret-emebet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidane Mihret Emebet (kidane-mihret-emebet-neylin)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 1
ከሰማያት በላይ ካለው ከማደሪያሽ (2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ
የምድር ፍጥረታት ማርያም ማርያም ሲሉሽ (2)
የቃል እናት እመቤቴ ነይ በሰረገላሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 2
ከፀጥታ ወደብ ከፍቅር አውድማ (2)
ከሰላሙ መንደር ከእውነት ከተማ
ሰአሊለነ ቅድስት ውዳሴ ሲሰማ (2)
ከሚካኤል ከገብርኤል ጋር ነይልን ከራማ (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት (2)
እንባችን ይታበስ ባንቺ አማላጅነት
በጽዮን ዝማሬ ተሞላ ነፍሳችን (2)
ንዒ (3) እንበል እንደ አባቶቻችን (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 4
ፍጥረታት ሊድኑ በአማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብጽዕት ይሉሻል (2)
እናቴ መመኪያዬ ምርኩዜ ሆነሻል (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 5
የልብን ሲያዋዩሽ ሰምተሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨከንም
ከዓይን ጥቅሻ ፈጥነሽ ትደርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)',
      lyrics_transliteration = 'CHORUS
Kidane mihret emebet
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 1
Kesemayat belay kalew kemaderiyash (2)
Zimare kemolaw kezelalem betsh
Yemdr fit’retat Maryam Maryam silush (2)
Yeqal enat Emebete ney beseregelash (2)

CHORUS
Kidane mihret emebet
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 2
Kets’et’ta wedeb kefqr awdma (2)
Keselamu mender keewnet ketema
Sealilene Kidist widase sisema (2)
Kemikael kegebrel gar neyln kerama (2)

CHORUS
Kidane mihret emebet
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 3
Zerfafaw qemissh yiwred kesemayat (2)
Enbachn yitabes banchi amalajnet
Bets’yon zimare temola nefsachn (2)
Nii (3) enbel ende abatochachn (2)

CHORUS
Kidane mihret emebet
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 4
Fit’retat lidnu beamalajnetsh (2)
Yezelalem kidan Amanuel set’esh
Tiwld yihn amno bits’et yilushal (2)
Enate memekiyaye mirkuze honeshal (2)

CHORUS
Kidane mihret emebet
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 5
Yelbn siyawayush semtesh zim atym (2)
Chgregnan ayto libsh aych’ekenm
Keayn t’qsha fet’nesh tidershletalesh (2)
Kehezen kemekera tasarfiwalesh (2)

CHORUS
Kidane mihret emebet
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidane-mihret-emebet-neylin'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 1
ከሰማያት በላይ ካለው ከማደሪያሽ (2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ
የምድር ፍጥረታት ማርያም ማርያም ሲሉሽ (2)
የቃል እናት እመቤቴ ነይ በሰረገላሽ (2)

VERSE 2
ከፀጥታ ወደብ ከፍቅር አውድማ (2)
ከሰላሙ መንደር ከእውነት ከተማ
ሰአሊለነ ቅድስት ውዳሴ ሲሰማ (2)
ከሚካኤል ከገብርኤል ጋር ነይልን ከራማ (2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት (2)
እንባችን ይታበስ ባንቺ አማላጅነት
በጽዮን ዝማሬ ተሞላ ነፍሳችን (2)
ንዒ (3) እንበል እንደ አባቶቻችን (2)

VERSE 4
ፍጥረታት ሊድኑ በአማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብጽዕት ይሉሻል (2)
እናቴ መመኪያዬ ምርኩዜ ሆነሻል (2)

VERSE 5
የልብን ሲያዋዩሽ ሰምተሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨከንም
ከዓይን ጥቅሻ ፈጥነሽ ትደርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidane mihret emebet
Kidane mihret emebet emebet (2)
Neyln neyln kalenbet (2)

VERSE 1
Kesemayat belay kalew kemaderiyash (2)
Zimare kemolaw kezelalem betsh
Yemdr fit’retat Maryam Maryam silush (2)
Yeqal enat Emebete ney beseregelash (2)

VERSE 2
Kets’et’ta wedeb kefqr awdma (2)
Keselamu mender keewnet ketema
Sealilene Kidist widase sisema (2)
Kemikael kegebrel gar neyln kerama (2)

VERSE 3
Zerfafaw qemissh yiwred kesemayat (2)
Enbachn yitabes banchi amalajnet
Bets’yon zimare temola nefsachn (2)
Nii (3) enbel ende abatochachn (2)

VERSE 4
Fit’retat lidnu beamalajnetsh (2)
Yezelalem kidan Amanuel set’esh
Tiwld yihn amno bits’et yilushal (2)
Enate memekiyaye mirkuze honeshal (2)

VERSE 5
Yelbn siyawayush semtesh zim atym (2)
Chgregnan ayto libsh aych’ekenm
Keayn t’qsha fet’nesh tidershletalesh (2)
Kehezen kemekera tasarfiwalesh (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidane-mihret-emebet-neylin', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidanemhret Tigrigna Orthodox Tewahedo mezmur (kidanemhret-tigrigna-orthodox-tewahedo-mezmur)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidanemhret-tigrigna-orthodox-tewahedo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 1
:::::::::::::::::::::::::::::::::::::::::::
ሳላ ቃል ኪዳንኺ አብ ተስፋይ ጸንዐ
ብአማላድነትኺ ምሕረት ጎይታ ርኤ
ምኽንያት ምድሓነይ መሰላል ናይ ፍቕር

VERSE 2
ንዓኺ ይትስፍዉ ብሰማይ ብምድር
:::::::::::::::::::::::::::::::::::::::::::
ካብ አመና ፍቕር ልፈልፈለ ብኽያት
አዶነትኺ የስተማቕር ዓጂበ ብንብዓት

VERSE 3
ስምኺ እንትፅዉዕ እዚ ጎልዳፍ አፈይ
አመና ይበዚሕ ጸጋ በረከተይ
::::::::::::::::::::::::::::::::::::::::::
ዘመኑ ኸፍኡ ኮይኑ አካሒዳ

VERSE 4
ምድር ብልምልሙ ኮይኑ ምድረ በዳ
ንስኺ እንተለኺ ተስፋ ናይዛ ምድር
ከመይሉ ይተርፍ ከንቱ ኮይኑ ፃዕር
::::::::::::::::::::::::::::::::::::::::::

VERSE 5
ሕልፊ ዝወላዲ ወላዲት ናይ ስጋይ
ትቀርቢ ትበልፂ ንስኺ እኺ ንዓይ
ቲዘጓነፈኒ ፅቡቕ ይኹን መዓት
ንዓኺ ይነግር አደይ ኪዳነ ምሕረት

VERSE 6
:::::::::::::::::::::::::::::::::::::::::::
ኪዳነ ምሕረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 1
:::::::::::::::::::::::::::::::::::::::::::
Sala qal kidanኺ Ab tesfay ts’ena
Biamaladnetኺ mihret goyta rie
Miኽnyat midhaney meselal nay fiቕr

VERSE 2
Niaኺ yitsfwu bisemay bimdr
:::::::::::::::::::::::::::::::::::::::::::
Kab amena fiቕr lifelfele biኽyat
Adonetኺ yestemaቕr ajibe binbat

VERSE 3
Simኺ entts’wue ezi goldaf afey
Amena yibezih ts’ega bereketey
::::::::::::::::::::::::::::::::::::::::::
Zemenu ኸfu koynu akahida

VERSE 4
Midr bilmlmu koynu midre beda
Nisኺ enteleኺ tesfa nayza midr
Kemeylu yiterf kentu koynu ts’aer
::::::::::::::::::::::::::::::::::::::::::

VERSE 5
Hilfi ziweladi weladit nay sigay
Tiqerbi tibelts’i nisኺ eኺ niay
Tizegwanefeni ts’buቕ yiኹn meat
Niaኺ yinegr adey kidane mihret

VERSE 6
:::::::::::::::::::::::::::::::::::::::::::
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidanemhret-tigrigna-orthodox-tewahedo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidanish megbiya bare Orthodox (kidanish-megbiya-bare-orthodox)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 1
መልካሟ እርግብ እመቤቴ
አትለይኝ ነይ ከቤቴ
ያላንቺ እኔን ማን ያውቀኛል
ምልክቴ ሆነሽኛል

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 2
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
ምን እምነት ነው እል ነበረ
ቅዱሳኑን ያመነነ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 3
መከራ ውስጥ ለካ ሚያዩሽ
የማጠፊ ብርሀን ነሽ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 4
፨ለዘላለም ካንቺ ጋራ
እንድጸና በምስጋና
በኪዳንሽ ታምኛለዉ
ይህን አለም ንቄዋለዉ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 5
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨ካከበሩሽ አባቶቼ
በፍቅር ቃል ተሞልቼ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 6
ሰዓሊለነ እልሻለዉ
እንዴልጎድል እኔም ከመንጋዉ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 7
፨ባታይብኝ መልካም ፍሬ
በትህትና ተሰብሬ
የእምነትሽን ጥሩር ልልበስ
በቀዳሹ እንድቀደስ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 8
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨በወንጌል ቃል ተጫምቼ
የእምነትን ጋሻ አንስቼ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 9
በጽድቅ ፍኖት እንድራመድ
ምርኩዝ ሁኚኝ ስንገዳገድ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ',
      lyrics_transliteration = 'CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 1
Melkamwa ergb Emebete
Atleygn ney kebete
Yalanchi enen man yawqegnal
Milkte honeshgnal

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 2
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Min emnet new el nebere
Qidusanun yamenene

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 3
Mekera wist’ leka miyayush
Yemat’efi birhen nesh
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 4
Lezelalem kanchi gara
Endts’ena bemsgana
Bekidansh tamgnalewu
Yihn alem niqewalewu

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 5
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Kakeberush abatoche
Befqr qal temolche

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 6
Sealilene elshalewu
Endelgodl enem kemengawu
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 7
Bataybgn melkam fire
Bethtna tesebre
Yeemnetshn t’rur lilbes
Beqedashu endqedes

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 8
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Bewengel qal tech’amche
Yeemnetn gasha ansche

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 9
Bets’dq finot endramed
Mirkuz hugnign singedaged
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidanish-megbiya-bare-orthodox'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 1
መልካሟ እርግብ እመቤቴ
አትለይኝ ነይ ከቤቴ
ያላንቺ እኔን ማን ያውቀኛል
ምልክቴ ሆነሽኛል

VERSE 2
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
ምን እምነት ነው እል ነበረ
ቅዱሳኑን ያመነነ

VERSE 3
መከራ ውስጥ ለካ ሚያዩሽ
የማጠፊ ብርሀን ነሽ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

VERSE 4
፨ለዘላለም ካንቺ ጋራ
እንድጸና በምስጋና
በኪዳንሽ ታምኛለዉ
ይህን አለም ንቄዋለዉ

VERSE 5
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨ካከበሩሽ አባቶቼ
በፍቅር ቃል ተሞልቼ

VERSE 6
ሰዓሊለነ እልሻለዉ
እንዴልጎድል እኔም ከመንጋዉ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

VERSE 7
፨ባታይብኝ መልካም ፍሬ
በትህትና ተሰብሬ
የእምነትሽን ጥሩር ልልበስ
በቀዳሹ እንድቀደስ

VERSE 8
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨በወንጌል ቃል ተጫምቼ
የእምነትን ጋሻ አንስቼ

VERSE 9
በጽድቅ ፍኖት እንድራመድ
ምርኩዝ ሁኚኝ ስንገዳገድ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 1
Melkamwa ergb Emebete
Atleygn ney kebete
Yalanchi enen man yawqegnal
Milkte honeshgnal

VERSE 2
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Min emnet new el nebere
Qidusanun yamenene

VERSE 3
Mekera wist’ leka miyayush
Yemat’efi birhen nesh
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

VERSE 4
Lezelalem kanchi gara
Endts’ena bemsgana
Bekidansh tamgnalewu
Yihn alem niqewalewu

VERSE 5
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Kakeberush abatoche
Befqr qal temolche

VERSE 6
Sealilene elshalewu
Endelgodl enem kemengawu
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

VERSE 7
Bataybgn melkam fire
Bethtna tesebre
Yeemnetshn t’rur lilbes
Beqedashu endqedes

VERSE 8
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Bewengel qal tech’amche
Yeemnetn gasha ansche

VERSE 9
Bets’dq finot endramed
Mirkuz hugnign singedaged
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidanish-megbiya-bare-orthodox', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidanishe New (kidanishe-new)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidanishe-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳንሽ ነው መበርቻዬ
ፀሎትሽ ነው መደገፊያዬ
ሞጎሴ ነሽ መድመቅያዬ
አርማዬ ነሽ መለያዬ

VERSE 1
እንደ ዶኪማስ ቤት ጉድለቴ እንዲመላ
ዘንበል ብለሽልኝ ድንግል የኔ ጥላ
የባዘነው ልቤ ይረፍ በምልጃሺ
ቅረቢ ወደኔ ድንግል ስጠራሺ

VERSE 2
የተመለሰብሽ አዳም ወደ ክብሩ
አበው እየጠሩሽ መልካም ፍሬ አፈሩ
በታናሽ አንደበት ልጥራሽ ደጋግሜ
አንችን ማመስገን ነው የልጅነት ህልሜ

VERSE 3
ቅደሚልኝ ከፊት ጉዞዬ እንዲቀና
ያላይቺ ጎዳናው አይገፋም እና
እጠብቅሻለው በመጠበቅያዬ
መመኪያዬ ድንግል አንቺ ነሽ ተስፋዬ

VERSE 4
ኪዳንሽን አምኖ ባንቺ የተማፀነ
ከልጅሽ በረከት አትርፎ ዘገነ
ኪዳነምህረት የቤቴ ውበት
ልጅሽ አማኑኤል ሃይልና ጉልበት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidansh new meberchaye
Ts’elotsh new medegefiyaye
Mogose nesh medmeqyaye
Armaye nesh meleyaye

VERSE 1
Ende dokimas bet gudlete endimela
Zenbel bileshlgn Dingil yene t’la
Yebazenew libe yiref bemljashi
Qirebi wedene Dingil sit’erashi

VERSE 2
Yetemelesebsh adam wede kibru
Abew eyet’erush melkam fire aferu
Betanash andebet lit’rash degagme
Anchn mamesgen new yeljnet hilme

VERSE 3
Qidemilgn kefit guzoye endiqena
Yalaychi godanaw aygefam ena
Et’ebqshalew bemet’ebeqyaye
Memekiyaye Dingil anchi nesh tesfaye

VERSE 4
Kidanshn amno banchi yetemats’ene
Keljsh bereket atrfo zegene
Kidanemhret yebete wibet
Lijsh Amanuel haylna gulbet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidanishe-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Kidanki Kone (kidanki-kone)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)

VERSE 1
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)

CHORUS
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)',
      lyrics_transliteration = 'CHORUS
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)

VERSE 1
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)

CHORUS
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidanki-kone'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)

VERSE 1
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)

VERSE 1
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidanki-kone', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: kidanmhret emebete (kidanmhret-emebete)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 1
የምድር ፍጥረታት ማርያም ማርይም ሲሉሽ
የቃል እናት እመቤቴ ነይ በሰረገላሽ(2)
አዝማ..
ከፀጥታው ወደብ ከፍቅር አውድማ(2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 2
ከሰላሙ መንደር ከእውነትከተማ
ሳሊለነ ቅድስት ውዳሴሽ ሲሰማ (2)
ከሚካኤል ከገብርኤል ጋ ነይልን ከራማ (2)
አዝማ

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት (2)
እምባንችን ይታበስ ባንች አማላጅነት
የፅዮን ዝማሬ ተመላች ነፍሳችን (2)
ነይ ነይ ነይ እንበል እንዳባቶቻችን (2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 4
አዝማ..
ፍጥረታት ሊድኑ ባማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብፅዕት ይልሻል (2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 5
እናቴ መመኬይዬ ምርኩዜ ሁነሻል (2)
አዝማ
የልብን ሲያዋዬሽ ሰምትሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨክንም

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 6
ከአይን ጥቅሻ ፈጥነሽ ትድርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)
አዝማ

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)',
      lyrics_transliteration = 'CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 1
Yemdr fit’retat Maryam marym silush
Yeqal enat Emebete ney beseregelash (2)
CHORUS
Kets’et’taw wedeb kefqr awdma (2)

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 2
Keselamu mender keewnetketema
Salilene Kidist widasesh sisema (2)
Kemikael kegebrel ga neyln kerama (2)
CHORUS

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 3
Zerfafaw qemissh yiwred kesemayat (2)
Embanchn yitabes banch amalajnet
Yets’yon zimare temelach nefsachn (2)
Ney ney ney enbel endabatochachn (2)

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 4
CHORUS
Fit’retat lidnu bamalajnetsh (2)
Yezelalem kidan Amanuel set’esh
Tiwld yihn amno bits’et yilshal (2)

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 5
Enate memekeyye mirkuze huneshal (2)
CHORUS
Yelbn siyawayesh semtsh zim atym (2)
Chgregnan ayto libsh aych’eknm

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 6
Keayn t’qsha fet’nesh tidrshletalesh (2)
Kehezen kemekera tasarfiwalesh (2)
CHORUS

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidanmhret-emebete'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 1
የምድር ፍጥረታት ማርያም ማርይም ሲሉሽ
የቃል እናት እመቤቴ ነይ በሰረገላሽ(2)
አዝማ..
ከፀጥታው ወደብ ከፍቅር አውድማ(2)

VERSE 2
ከሰላሙ መንደር ከእውነትከተማ
ሳሊለነ ቅድስት ውዳሴሽ ሲሰማ (2)
ከሚካኤል ከገብርኤል ጋ ነይልን ከራማ (2)
አዝማ

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት (2)
እምባንችን ይታበስ ባንች አማላጅነት
የፅዮን ዝማሬ ተመላች ነፍሳችን (2)
ነይ ነይ ነይ እንበል እንዳባቶቻችን (2)

VERSE 4
አዝማ..
ፍጥረታት ሊድኑ ባማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብፅዕት ይልሻል (2)

VERSE 5
እናቴ መመኬይዬ ምርኩዜ ሁነሻል (2)
አዝማ
የልብን ሲያዋዬሽ ሰምትሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨክንም

VERSE 6
ከአይን ጥቅሻ ፈጥነሽ ትድርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)
አዝማ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 1
Yemdr fit’retat Maryam marym silush
Yeqal enat Emebete ney beseregelash (2)
Kets’et’taw wedeb kefqr awdma (2)

VERSE 2
Keselamu mender keewnetketema
Salilene Kidist widasesh sisema (2)
Kemikael kegebrel ga neyln kerama (2)

VERSE 3
Zerfafaw qemissh yiwred kesemayat (2)
Embanchn yitabes banch amalajnet
Yets’yon zimare temelach nefsachn (2)
Ney ney ney enbel endabatochachn (2)

VERSE 4
Fit’retat lidnu bamalajnetsh (2)
Yezelalem kidan Amanuel set’esh
Tiwld yihn amno bits’et yilshal (2)

VERSE 5
Enate memekeyye mirkuze huneshal (2)
Yelbn siyawayesh semtsh zim atym (2)
Chgregnan ayto libsh aych’eknm

VERSE 6
Keayn t’qsha fet’nesh tidrshletalesh (2)
Kehezen kemekera tasarfiwalesh (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'kidanmhret-emebete', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 100 THEN
    RAISE EXCEPTION 'Rollback batch 05 count mismatch: expected 100, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Rollback batch 05 completed: % hymns restored.', v_total;
END $rollback_batch_05$;
