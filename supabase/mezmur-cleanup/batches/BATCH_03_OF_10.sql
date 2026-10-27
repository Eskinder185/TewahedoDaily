-- =========================================================================
-- BATCH 03 of 10: 100 Hymns (201 to 300)
-- Target: public.mezmur_data_import
-- Strict 5-Column Concurrency Check + Atomic Transaction
-- =========================================================================

DO $batch_03$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn: Chernetih New (chernetih-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 1
መክሊቴን ቀብሬ ባሳዝንህ
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ በፍቅርህ
ጎብኝተህ ከሞት አውጣኝ ከቤትህ

VERSE 2
ርቄ መች ጠገብኩኝ
በረሃብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ተቀበለኝ

VERSE 3
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 4
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታ ለባሪያህ ይደርሰኛል

VERSE 5
በመቅደስህ ቆሜ ለመዘመር
ሥራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ

VERSE 6
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 7
በሰው እጅ መመካት አቁሜያለሁ
ረዳቴ አንተ ነህ አውቀዋለሁ
አንተ ከጠበከኝ በሕይወቴ
ቅጥሬ አይደፈርም መድኃኒቴ

VERSE 8
የእኔን ሥራ ተወው ተግባሬን
የመስቀሉን ነገር መርሳቴን
አዚሜን አንስተህ አንተን ልይህ
ኢየሱስ ክርስቶስ አምላኬ ነህ

VERSE 9
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)',
      lyrics_transliteration = 'Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 1
Mebratenim yize baltebkih
Betalaq yiqirta endatrsany befikrih
Gobenyteh kemot awtaññ ke bethih
Riqe mech tegebkugh

VERSE 2
Berehab berizat techgerkugh
Amenalehu Amlake enditmiregh
Leyiqirta metahu teqebelegh

VERSE 3
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Andach endelegh awqewalehu

VERSE 4
Beante chernet gin emekalehu
Yekebedew shekme yiqelenyal
Yiqirta lebariyah yidersenyal

VERSE 5
Bemeqdesih qome lemezemer
Sirahen letiwuld lememesker
Ene maneghn biye asbalehu
Amlak chernetihn adeneqalehu

VERSE 6
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Besew ej memekat aqmeyalehu

VERSE 7
Redate ante neh awqewalehu
Ante ketebekegh behiywete
Qitre ayideferm medhanite

VERSE 8
Yeñen sira tewew tegbareñ
Yemesqelun neger mersatun
Azimen ansteh anten liyih
Iyesus Kristos Amlake neh

VERSE 9
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'chernetih-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 1
መክሊቴን ቀብሬ ባሳዝንህ
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ በፍቅርህ
ጎብኝተህ ከሞት አውጣኝ ከቤትህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 2
ርቄ መች ጠገብኩኝ
በረሃብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ተቀበለኝ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 3
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 4
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታ ለባሪያህ ይደርሰኛል

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 5
በመቅደስህ ቆሜ ለመዘመር
ሥራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 6
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 7
በሰው እጅ መመካት አቁሜያለሁ
ረዳቴ አንተ ነህ አውቀዋለሁ
አንተ ከጠበከኝ በሕይወቴ
ቅጥሬ አይደፈርም መድኃኒቴ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 8
የእኔን ሥራ ተወው ተግባሬን
የመስቀሉን ነገር መርሳቴን
አዚሜን አንስተህ አንተን ልይህ
ኢየሱስ ክርስቶስ አምላኬ ነህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

VERSE 9
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 1
Mebratenim yize baltebkih
Betalaq yiqirta endatrsany befikrih
Gobenyteh kemot awtaññ ke bethih
Riqe mech tegebkugh

CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 2
Berehab berizat techgerkugh
Amenalehu Amlake enditmiregh
Leyiqirta metahu teqebelegh

CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 3
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Andach endelegh awqewalehu

CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 4
Beante chernet gin emekalehu
Yekebedew shekme yiqelenyal
Yiqirta lebariyah yidersenyal

CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 5
Bemeqdesih qome lemezemer
Sirahen letiwuld lememesker
Ene maneghn biye asbalehu
Amlak chernetihn adeneqalehu

CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 6
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Besew ej memekat aqmeyalehu

CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 7
Redate ante neh awqewalehu
Ante ketebekegh behiywete
Qitre ayideferm medhanite

CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 8
Yeñen sira tewew tegbareñ
Yemesqelun neger mersatun
Azimen ansteh anten liyih
Iyesus Kristos Amlake neh

CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi

VERSE 9
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)

CHORUS
Chernetih new yaderesegh eske zare
Chernetih new yetebekeghe eske zare
Lamesgenih yene geta bezmare (2)
Mekliṭen kebre basazinhi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'chernetih-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Cheru Hoy (cheru-hoy)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 1
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል
ቸሩ ሆይ ምንም ነገር የለም

VERSE 2
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደድከን
ቸሩ ሆይ ፈልገህ ጠራህን

VERSE 3
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ

VERSE 4
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን

VERSE 5
ቸሩ ሆይ በከብቶች ማደሪያ
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም

VERSE 6
ቸሩ ሆይ እልል በሉ ሰዎች
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሐት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ',
      lyrics_transliteration = 'Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 1
Cheru hoy leayne siwr meri
Cheru hoy mirkuz memekiya neh
Cheru hoy anten yemimesl
Cheru hoy minm neger yelem

VERSE 2
Cheru hoy mihretna fiqrh
Cheru hoy wesen weder yelew
Cheru hoy sanwedh wededken
Cheru hoy felgeh t’erahn

VERSE 3
Cheru hoy semteh edalsemah
Cheru hoy ayteh endalayeh
Cheru hoy hulun talfewaleh
Cheru hoy fiqrawi abat neh

VERSE 4
Cheru hoy Amanuel Geta
Cheru hoy cheru fet’ariyachn
Cheru hoy wiletah bizu new
Cheru hoy leegna yewalkln

VERSE 5
Cheru hoy bekebtoch maderiya
Cheru hoy beziyach tinsh girgm
Cheru hoy teweldo adanen
Cheru hoy Geta Medhanealem

VERSE 6
Cheru hoy ell belu sewoch
Cheru hoy and lay zemeru
Cheru hoy sibhet leEgziabher
Cheru hoy bearyam belu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'cheru-hoy'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 1
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል
ቸሩ ሆይ ምንም ነገር የለም

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 2
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደድከን
ቸሩ ሆይ ፈልገህ ጠራህን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 3
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 4
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 5
ቸሩ ሆይ በከብቶች ማደሪያ
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 6
ቸሩ ሆይ እልል በሉ ሰዎች
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሐት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 1
Cheru hoy leayne siwr meri
Cheru hoy mirkuz memekiya neh
Cheru hoy anten yemimesl
Cheru hoy minm neger yelem

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 2
Cheru hoy mihretna fiqrh
Cheru hoy wesen weder yelew
Cheru hoy sanwedh wededken
Cheru hoy felgeh t’erahn

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 3
Cheru hoy semteh edalsemah
Cheru hoy ayteh endalayeh
Cheru hoy hulun talfewaleh
Cheru hoy fiqrawi abat neh

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 4
Cheru hoy Amanuel Geta
Cheru hoy cheru fet’ariyachn
Cheru hoy wiletah bizu new
Cheru hoy leegna yewalkln

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 5
Cheru hoy bekebtoch maderiya
Cheru hoy beziyach tinsh girgm
Cheru hoy teweldo adanen
Cheru hoy Geta Medhanealem

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 6
Cheru hoy ell belu sewoch
Cheru hoy and lay zemeru
Cheru hoy sibhet leEgziabher
Cheru hoy bearyam belu

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'cheru-hoy', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Chohin Chohin (chohin-chohin)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 1
በመስቀሉ ፍቅርን ተምረን ከጌታ።
የእስራኤልን ጩኸት አምላካችን ሰምቶ፣
ፈርኦንን ጥሎታል ሙሴን አስነስቶ።
አ.ዝ

VERSE 2
ሀገርን የሰራን ድንበር ያስከበርን፣
ነፃነት የሰጠን ቅርስን ያስረከብን።
በውስጥም በውጭም መሪ ለነበርነው፣
ጩኸታችን ዛሬ ያልተሰማ ምነው?

VERSE 3
አ.ዝ
ሰማዕታት እንጂ አንቆጥርም እሬሳ፣
አምነው የሞቱትን ስለማንረሳ።
እንደሚታረድ በግ እንዲሁ ዝም ያልነው፣

VERSE 4
ልብሳችንን ሸጠን ሰይፍ እንዳንገዛ ነው።
አ.ዝ
ጥበብና ማዳን ሀይልም የእግዚአብሔር ነው፣
ሾተል አንመዝም ድል ያለው ከእርሱ ነው።

VERSE 5
መከራ እና ስቃይ እስር ሰንሰለቱ፣
ለተዋህዶ እንግዳ አይደለም እሳቱ።
አ.ዝ
በተዋህዶ ላይ እንዲያ የጨከኑ፣

VERSE 6
የሮማ ቄሳሮች የሉም በዙፋኑ።
መከራው አለቀ ስቃዩም አበቃ፣
ቤተክርስቲያን ግን ዛሬም አለች ደምቃ።',
      lyrics_transliteration = 'Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 1
Bemesqelu fiqrn temren kegeta.
Yeesraeln ch’uኸt amlakachn semto,
Feronn t’lotal musen asnesto.
A.z

VERSE 2
Hegern yeseran dinber yaskebern,
Nets’anet yeset’en qirsn yasrekebn.
Bewst’m bewch’m meri lenebernew,
Ch’uኸtachn zare yaltesema minew?

VERSE 3
A.z
Semaetat enji anqot’rm eresa,
Amnew yemotutn silemanresa.
Endemitared beg endihu zim yalnew,

VERSE 4
Libsachnn shet’en seyf endangeza new.
A.z
T’bebna madan heylm yeEgziabher new,
Shotel anmezm dil yalew keersu new.

VERSE 5
Mekera ena siqay esr senseletu,
Letewahdo engda aydelem esatu.
A.z
Betewahdo lay endiya yech’ekenu,

VERSE 6
Yeroma qesaroch yelum bezufanu.
Mekeraw aleqe siqayum abeqa,
Bete Kristian gin zarem alech demqa.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'chohin-chohin'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 1
በመስቀሉ ፍቅርን ተምረን ከጌታ።
የእስራኤልን ጩኸት አምላካችን ሰምቶ፣
ፈርኦንን ጥሎታል ሙሴን አስነስቶ።
አ.ዝ

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 2
ሀገርን የሰራን ድንበር ያስከበርን፣
ነፃነት የሰጠን ቅርስን ያስረከብን።
በውስጥም በውጭም መሪ ለነበርነው፣
ጩኸታችን ዛሬ ያልተሰማ ምነው?

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 3
አ.ዝ
ሰማዕታት እንጂ አንቆጥርም እሬሳ፣
አምነው የሞቱትን ስለማንረሳ።
እንደሚታረድ በግ እንዲሁ ዝም ያልነው፣

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 4
ልብሳችንን ሸጠን ሰይፍ እንዳንገዛ ነው።
አ.ዝ
ጥበብና ማዳን ሀይልም የእግዚአብሔር ነው፣
ሾተል አንመዝም ድል ያለው ከእርሱ ነው።

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 5
መከራ እና ስቃይ እስር ሰንሰለቱ፣
ለተዋህዶ እንግዳ አይደለም እሳቱ።
አ.ዝ
በተዋህዶ ላይ እንዲያ የጨከኑ፣

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 6
የሮማ ቄሳሮች የሉም በዙፋኑ።
መከራው አለቀ ስቃዩም አበቃ፣
ቤተክርስቲያን ግን ዛሬም አለች ደምቃ።

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 1
Bemesqelu fiqrn temren kegeta.
Yeesraeln ch’uኸt amlakachn semto,
Feronn t’lotal musen asnesto.
A.z

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 2
Hegern yeseran dinber yaskebern,
Nets’anet yeset’en qirsn yasrekebn.
Bewst’m bewch’m meri lenebernew,
Ch’uኸtachn zare yaltesema minew?

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 3
A.z
Semaetat enji anqot’rm eresa,
Amnew yemotutn silemanresa.
Endemitared beg endihu zim yalnew,

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 4
Libsachnn shet’en seyf endangeza new.
A.z
T’bebna madan heylm yeEgziabher new,
Shotel anmezm dil yalew keersu new.

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 5
Mekera ena siqay esr senseletu,
Letewahdo engda aydelem esatu.
A.z
Betewahdo lay endiya yech’ekenu,

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 6
Yeroma qesaroch yelum bezufanu.
Mekeraw aleqe siqayum abeqa,
Bete Kristian gin zarem alech demqa.

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'chohin-chohin', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ’ / Christian’yu smey / / orthodox tewahdo mezmur (christianyu-smey-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 1
> Deገይ ጻዕዳ ጌረ ብውሽጠይ ግን ጸላም
ስመይ ናይ ክርስቶስ ግብረይ ግን ናይ ዓለም
ከም ሉቅሉቅ መቃብር በድኒ ተሸኪመ
ብምሱሉይ መንገዲ ክንደይ ድየ ሳጊመ

VERSE 2
ውሻጠ ውሻጠይ ንስኻ ኢኻ ተፈልጦ
ሓደራኻ ጎይታይ ህይወተይ ለውጦ
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ

VERSE 3
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2
> ይኣክል ሎሚ''ሲ በቃ ይእክለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ

VERSE 4
ሓቀኛ ማንነት ኣነ ከኽብረካ
ብስጋ ብነብሲ ክግዛእ ንዓኻ
በደለይ ረሲዕካ ይቅረ በለኒ ኢኻ''ሞ
ዘመነይ ኣብ ቤትካ ኾይነ ክዛዝሞ

VERSE 5
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2

VERSE 6
> ይኣክል ሎሚ''ሲ በቃ ይእክለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ
ሓቀኛ ማንነት ኣነ ከኽብረካ
ብስጋ ብነብሲ ክግዛእ ንዓኻ

VERSE 7
በደለይ ረሲዕካ ይቅረ በለኒ ኢኻ''ሞ
ዘመነይ ኣብ ቤትካ ኾይነ ክዛዝሞ
ኩሉ ሰብ ይፈልጦ''ዪ ክርስትያን''ዪ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ'' ትምክሕተይ

VERSE 8
ልበይ እንዳ ኣመነ ግብረይ ከይክሕደካ
እየሱስ ብፍቅሪ ሕተሞ ባርያኻ X2',
      lyrics_transliteration = 'Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 1
> Degey ts’aeda gere biwsht’ey gin ts’elam
Simey nay Kristos gibrey gin nay alem
Kem luqluq meqabr bedni teshekime
Bimsuluy mengedi kindey diye sagime

VERSE 2
Wishat’e wishat’ey nisኻ iኻ tefelt’o
Haderaኻ goytay hiywetey lewt’o
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey

VERSE 3
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2
> yiakl lomi''si beqa yiekleni
Zeynsey mimsaley ts’oru kebiduni

VERSE 4
Haqegna mannet ane keኽbreka
Bisga binebsi kigzae niaኻ
Bedeley resieka yiqre beleni iኻ''mo
Zemeney ab betka ኾyne kizazmo

VERSE 5
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2

VERSE 6
> yiakl lomi''si beqa yiekleni
Zeynsey mimsaley ts’oru kebiduni
Haqegna mannet ane keኽbreka
Bisga binebsi kigzae niaኻ

VERSE 7
Bedeley resieka yiqre beleni iኻ''mo
Zemeney ab betka ኾyne kizazmo
Kulu seb yifelt’o''yi kirstyan''yi simey
Maebel zesgereni simka z'' timkhtey

VERSE 8
Libey enda amene gibrey keykhdeka
Eyesus bifqri hitemo baryaኻ X2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'christianyu-smey-orthodox-tewahdo-mezmur'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'christianyu-smey-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Come all let us rejoice (come-all-let-us-rejoice)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Sewoch des yibelen beAmlakachin
Kehatiyat barinet netsa yawetan
Tenesu enamesgin wiletaw bizu new
Min yikefelewal temesgen bicha new',
      lyrics_english = 'Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

VERSE 1
Sewoch des yibelen beAmlakachin
Kehatiyat barinet netsa yawetan
Tenesu enamesgin wiletaw bizu new
Min yikefelewal temesgen bicha new

VERSE 2
From my sickness of sin with chains I have been bound
The Lord my medicine has raised me from the ground
Your gifts are plentiful that You bestow on me
All I can give to you is praise and melody

VERSE 3
Just like Bartimeus my eyes they could not see
But now through the Lord’s Grace His healing I received
I’m guided by His laws on my path they will shine
Since I belong to Him His peace has become mine

VERSE 4
With a proclamation showing your love to me
I was chained by demons but with you now I’m free
Alpha and Omega for all eternity
You are El Shaddai God Emmanuel we call Thee

VERSE 5
The contract of my death to save me He has ripped
The wonders He performed with my eyes I witnessed
His Grace never-ending my God the almighty
We glorify Your name out loud in jubilee

VERSE 6
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

VERSE 7
Sewoch des yibelen beAmlakachin
Kehatiyat barinet netsa yawetan
Tenesu enamesgin wiletaw bizu new
Min yikefelewal temesgen bicha new',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'come-all-let-us-rejoice'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sewoch des yibelen beAmlakachin
Kehatiyat barinet netsa yawetan
Tenesu enamesgin wiletaw bizu new
Min yikefelewal temesgen bicha new'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

VERSE 1
Sewoch des yibelen beAmlakachin
Kehatiyat barinet netsa yawetan
Tenesu enamesgin wiletaw bizu new
Min yikefelewal temesgen bicha new

CHORUS
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

VERSE 2
From my sickness of sin with chains I have been bound
The Lord my medicine has raised me from the ground
Your gifts are plentiful that You bestow on me
All I can give to you is praise and melody

CHORUS
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

VERSE 3
Just like Bartimeus my eyes they could not see
But now through the Lord’s Grace His healing I received
I’m guided by His laws on my path they will shine
Since I belong to Him His peace has become mine

CHORUS
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

VERSE 4
With a proclamation showing your love to me
I was chained by demons but with you now I’m free
Alpha and Omega for all eternity
You are El Shaddai God Emmanuel we call Thee

CHORUS
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

VERSE 5
The contract of my death to save me He has ripped
The wonders He performed with my eyes I witnessed
His Grace never-ending my God the almighty
We glorify Your name out loud in jubilee

CHORUS
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

VERSE 6
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

CHORUS
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant

VERSE 7
Sewoch des yibelen beAmlakachin
Kehatiyat barinet netsa yawetan
Tenesu enamesgin wiletaw bizu new
Min yikefelewal temesgen bicha new

CHORUS
Come all let us rejoice in the Lord Jesus Christ
From slavery of sin He freed us with his might
Arise with songs of praise His favor’s abundant
There’s no way to repay but to be jubilant'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'come-all-let-us-rejoice', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Covenant of Mercy (covenant-of-mercy)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese
Selam leki',
      lyrics_english = 'For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 1
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

VERSE 2
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 3
The times of misery, with ease I left behind
Drawing nearer to you, redemption of mankind
The grace of your Child and your benevolence
Protected your servant from a worrisome death

VERSE 4
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 5
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

VERSE 6
Peace be unto you

VERSE 7
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 8
My heart grew firm by you and it became lifted
Upon my enemies, my mouth spoke convicted
By your healing wonders, your servant is happy
Your child has broken arrows of the mighty

VERSE 9
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 10
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

VERSE 11
Peace be unto you

VERSE 12
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 13
My loved ones fled when my hands weren’t full and sufficed
When they tried to divide with their cursed advice
I told them that He had taken what He first gave
But I have my Lady, they were quickly ashamed

VERSE 14
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 15
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

VERSE 16
Peace be unto you

VERSE 17
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 18
As I stood on the stage, calling her name to praise
With gentle compassion, towards me she had gazed
No one mirrors your rare and unique thoughtfulness
Through you Mother Mary, I found my true solace

VERSE 19
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 20
Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese

VERSE 21
Selam leki

VERSE 22
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 23
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

VERSE 24
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 25
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 26
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'covenant-of-mercy'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese
Selam leki'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 1
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 2
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 3
The times of misery, with ease I left behind
Drawing nearer to you, redemption of mankind
The grace of your Child and your benevolence
Protected your servant from a worrisome death

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 4
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 5
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 6
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 7
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 8
My heart grew firm by you and it became lifted
Upon my enemies, my mouth spoke convicted
By your healing wonders, your servant is happy
Your child has broken arrows of the mighty

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 9
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 10
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 11
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 12
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 13
My loved ones fled when my hands weren’t full and sufficed
When they tried to divide with their cursed advice
I told them that He had taken what He first gave
But I have my Lady, they were quickly ashamed

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 14
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 15
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 16
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 17
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 18
As I stood on the stage, calling her name to praise
With gentle compassion, towards me she had gazed
No one mirrors your rare and unique thoughtfulness
Through you Mother Mary, I found my true solace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 19
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 20
Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 21
Selam leki

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 22
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 23
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 24
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 25
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 26
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'covenant-of-mercy', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: D.MINDAYE BIRHANU (d-mindaye-birhanu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 1
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 2
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል
መንገድ የመራኸው - - ኃያል ቅዱስ ሚካኤል
የኤርትራን ባህር - - ኃያል ሚካኤል

VERSE 3
ከፍለህ ያሻገርከው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ክብርህ ከመላእክት - - ኃያል ሚካኤል

VERSE 4
ከፍ ከፍ ያለ ነው - - ኃያል ቅዱስ ሚካኤል
ታላቁ አለቃ - - ኃያል ሚካኤል
ከቶ እንዳንተ ማነው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 5
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
በኃጢአት በረሃ - - ኃያል ሚካኤል
መጠለያ ሁነን - - ኃያል ቅዱስ ሚካኤል
ጠላት በመንገድ ላይ - - ኃያል ሚካኤል

VERSE 6
እንዳያስፈራራን - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 7
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል',
      lyrics_transliteration = 'Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 1
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 2
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael
Menged yemeraኸw - - hayal Kidus Mikael
Yeertran bahr - - hayal Mikael

VERSE 3
Kefleh yashagerkew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Kibrh kemelaekt - - hayal Mikael

VERSE 4
Kef kef yale new - - hayal Kidus Mikael
Talaqu aleqa - - hayal Mikael
Keto endante manew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 5
Yit’ebqegnal hayal Kidus Mikael
Behat’iat bereha - - hayal Mikael
Met’eleya hunen - - hayal Kidus Mikael
T’elat bemenged lay - - hayal Mikael

VERSE 6
Endayasferaran - - hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 7
Yit’ebqegnal hayal Kidus Mikael',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'd-mindaye-birhanu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 1
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 2
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል
መንገድ የመራኸው - - ኃያል ቅዱስ ሚካኤል
የኤርትራን ባህር - - ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 3
ከፍለህ ያሻገርከው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ክብርህ ከመላእክት - - ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 4
ከፍ ከፍ ያለ ነው - - ኃያል ቅዱስ ሚካኤል
ታላቁ አለቃ - - ኃያል ሚካኤል
ከቶ እንዳንተ ማነው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 5
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
በኃጢአት በረሃ - - ኃያል ሚካኤል
መጠለያ ሁነን - - ኃያል ቅዱስ ሚካኤል
ጠላት በመንገድ ላይ - - ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 6
እንዳያስፈራራን - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 7
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 1
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 2
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael
Menged yemeraኸw - - hayal Kidus Mikael
Yeertran bahr - - hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 3
Kefleh yashagerkew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Kibrh kemelaekt - - hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 4
Kef kef yale new - - hayal Kidus Mikael
Talaqu aleqa - - hayal Mikael
Keto endante manew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 5
Yit’ebqegnal hayal Kidus Mikael
Behat’iat bereha - - hayal Mikael
Met’eleya hunen - - hayal Kidus Mikael
T’elat bemenged lay - - hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 6
Endayasferaran - - hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 7
Yit’ebqegnal hayal Kidus Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'd-mindaye-birhanu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ‛ ’ Deacon Begna Girma (deacon-begna-girma)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሰላሜ በአንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 1
ሰላሜ ባንተ ነው የኔ ጌታ
እረፍቴ ባንተ ነው የኔ ጌታ
አልከለከል ምስጋና
አልከለከል ውዳሴ ላንተ ውለታ

VERSE 2
ጨለማዬ ባንተ በራልኝ
ከሰው ትከሻ ወረድኩኝ
የምመራበት ዱላዬ
ባንተ ተጥሏል ጌታዬ

VERSE 3
አሁን በግላጭ አያለሁ
ሙሉ ሰው ባንተ ሆኛለሁ
ጨለማዬ ባንተ በራልኝ
ከሰው ትከሻ ወረድኩኝ

VERSE 4
የምመራበት ዱላዬ
ባንተ ተጥሏል ጌታዬ
አሁን በግላጭ አያለሁ
ሙሉ ሰው ባንተ ሆኛለሁ

VERSE 5
የመውገሪያው ድንጋይ ቀረልኝ
ጠላቴ በፊቴ አፈረልኝ
በፊትህ አቆምከኝ በጸጋህ
ገዝተኸኛልና በዋጋ

VERSE 6
ለውለታህማ ምን እላለሁ
ተመስገን ብዬ አልፈዋለሁ
የመውገሪያው ድንጋይ ቀረልኝ
ጠላቴ በፊቴ አፈረልኝ

VERSE 7
በፊትህ አቆምከኝ በጸጋህ
ገዝተኸኛልና በዋጋ
ለውለታህማ ምን እላለሁ
ተመስገን ብዬ አልፈዋለሁ

VERSE 8
ሰላላው እጄን አቅንተሃል
ሽባነቴንም ተርትረሃል
ደካማነቴ ተወገደ
ያ ክፉ መንፈስ ተሰደደ

VERSE 9
ታውጆልኛል ነፃነቴ
አመልክሃለሁ በሕይወቴ
ሰላላው እጄን አቅንተሃል
ሽባነቴንም ተርትረሃል

VERSE 10
ደካማነቴ ተወገደ
ያ ክፉ መንፈስ ተሰደደ
ታውጆልኛል ነፃነቴ
አመልክሃለሁ በሕይወቴ

VERSE 11
የአይኔ ላይ ቅርፊት ወለቀ
ሸክሙም ከላዬ ወደቀ
በደማሰቆ ብርሃን መታኸኝ
የራስህ ምርጥ ዕቃ አረግከኝ

VERSE 12
ያ ከንቱ ድካሜ አለፈ
ልቤ ለፍቅርህ ተሸነፈ
የአይኔ ላይ ቅርፊት ወለቀ
ሸክሙም ከላዬ ወደቀ

VERSE 13
በደማሰቆ ብርሃን መታኸኝ
የራስህ ምርጥ ዕቃ አረግከኝ
ያ ከንቱ ድካሜ አለፈ
ልቤ ለፍቅርህ ተሸነፈ',
      lyrics_transliteration = 'Selame beante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 1
Selame bante new yene Geta
Erefte bante new yene Geta
Alkelekel misgana
Alkelekel widase lante wileta

VERSE 2
Ch’elemaye bante beralgn
Kesew tikesha weredkugn
Yemmerabet dulaye
Bante tet’lwal Getaye

VERSE 3
Ahun beglach’ ayalehu
Mulu sew bante hognalehu
Ch’elemaye bante beralgn
Kesew tikesha weredkugn

VERSE 4
Yemmerabet dulaye
Bante tet’lwal Getaye
Ahun beglach’ ayalehu
Mulu sew bante hognalehu

VERSE 5
Yemewgeriyaw dingay qerelgn
T’elate befite aferelgn
Befith aqomkegn bets’egah
Gezteኸgnalna bewaga

VERSE 6
Lewletahma min elalehu
Temesgen biye alfewalehu
Yemewgeriyaw dingay qerelgn
T’elate befite aferelgn

VERSE 7
Befith aqomkegn bets’egah
Gezteኸgnalna bewaga
Lewletahma min elalehu
Temesgen biye alfewalehu

VERSE 8
Selalaw ejen aqntehal
Shbanetenm tertrehal
Dekamanete tewegede
Ya kifu menfes tesedede

VERSE 9
Tawjolgnal nets’anete
Amelkhalehu behywete
Selalaw ejen aqntehal
Shbanetenm tertrehal

VERSE 10
Dekamanete tewegede
Ya kifu menfes tesedede
Tawjolgnal nets’anete
Amelkhalehu behywete

VERSE 11
Yeayne lay qirfit weleqe
Shekmum kelaye wedeqe
Bedemaseqo birhan metaኸgn
Yerash mirt’ eqa aregkegn

VERSE 12
Ya kentu dikame alefe
Libe lefqrh teshenefe
Yeayne lay qirfit weleqe
Shekmum kelaye wedeqe

VERSE 13
Bedemaseqo birhan metaኸgn
Yerash mirt’ eqa aregkegn
Ya kentu dikame alefe
Libe lefqrh teshenefe',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'deacon-begna-girma'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'deacon-begna-girma', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Debre zeyit (debre-zeyit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አኧ ለፍርድ ይመጣል አምላካችን
ለፍርድ ይመጣል አምላካችን
ዋጋ ሊከፍል ለሥራችን
በኃይል በስልጣን ይገለጣል

VERSE 1
የወጉት ሁሉም ያዩታል
አኧ ለፍርድ…
አንድበትም ሁሉ ዝም ይላል
የተከፈተ አፍ ዲዳ ይሆናል

VERSE 2
መፅሐፍት ሁሉ ተዘርግተው
ይገለፃል የሁሉ ሥራው
አኧ ለፍርድ…
ዓለም በሐጢያቱ ይቀጣል

VERSE 3
የትዕቢቱ ኩራት ይሻራል
ይዋረዳሉ ጨካኞቹ
ይከበራሉ ትሁቶቹ
አኧ ለፍርድ…

VERSE 4
ለአሕዛብ ሊሆን ምስክር
የመግስቱ ወንጌል ሲነገር
ቅዱሱ ወንጌል ይሄን ብሏል
ፍጻሜ ዘመን ያኔ ይሆናል

VERSE 5
አኧ ለፍርድ…
እንዲወጣ መብረቅ ከምስራቅ
እስከ ምዕራብ እንዲዘልቅ
የጌታ መምጣት እንደዚህ ነው

VERSE 6
መንግሥትና ፍርዱ በእጁ ነው
አኧ ለፍርድ…
እንጠብቀ ተዝጋጅተን
ልባሞች ሆነን መብራት ይዘን

VERSE 7
አናውቅምና ቀኒቱን የሙሽራው መምጫውን
እናውቅምና ሰዓቱን የሙሽራው መምጫውን',
      lyrics_transliteration = 'Aኧ lefrd yimet’al amlakachn
Lefrd yimet’al amlakachn
Waga likefl lesrachn
Behayl beslt’an yigelet’al

VERSE 1
Yewegut hulum yayutal
Aኧ lefrd…
Andbetm hulu zim yilal
Yetekefete af dida yihonal

VERSE 2
Mets’heft hulu tezergtew
Yigelets’al yehulu siraw
Aኧ lefrd…
Alem behet’iyatu yiqet’al

VERSE 3
Yetebitu kurat yisharal
Yiwaredalu ch’ekagnochu
Yikeberalu tihutochu
Aኧ lefrd…

VERSE 4
Leahzab lihon miskr
Yemegstu wengel sineger
Qidusu wengel yihen bilwal
Fits’ame zemen yane yihonal

VERSE 5
Aኧ lefrd…
Endiwet’a mebreq kemsraq
Eske mierab endizelq
Yegeta memt’at endezih new

VERSE 6
Mengstna firdu beeju new
Aኧ lefrd…
Ent’ebqe tezgajten
Libamoch honen mebrat yizen

VERSE 7
Anawqmna qenitun yemushraw memch’awn
Enawqmna seatun yemushraw memch’awn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'debre-zeyit'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'debre-zeyit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Deg Degun Asayen (deg-degun-asayen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 1
ሾተል ስቦ የነበረ አበባን ይስጥ ለወንድሙ
ከመቅበዝበዝ ከጸብ ይውጣ አብሮት ይኑር በሰላሙ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

VERSE 2
አዛውንቱ ህጻናቱ አለቅንብህ በሰቀቀን
መቼም ላንተ አይሳንህ አቅርብልን የሳቁን ቀን
ዳግም ያብብ በልባችን የረገፈው የፍቅር ዘር
በሚያልፍ ሃሳብ ተደግፈን ተጠላልፈን እንዳንቀር

VERSE 3
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ማዕዳችን ሙሉ ይሁን ማዕዳችን ጥጋብ አርገው
እንዳለፈው መልካም ጊዜ አንዱ አንዱን ይደግፈው

VERSE 4
አትረፍርፈን በበረከት ጥቂት ዘርተን ብዙ እንጨድ
የአባውን ዘመን መልስ እርስ በርስበርስም እንዋደድ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

VERSE 5
የሃዘናችን ካባ ይውለቅ ደስታ አልብሰን እንደ ድሮው
እናት በሃዘን አትጎዳ አባት አይኑር አቀርቅሮ
ትናንትናን አስረስተህ በአዲስ ዘመን አዲስ አድርገን
ቂም በቀልን አርቅልን እንደገናም አስተቃቅፈን

VERSE 6
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት',
      lyrics_transliteration = 'Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 1
Shotel sibo yenebere abeban yist’ lewendmu
Kemeqbezbez kets’eb yiwt’a abrot yinur beselamu
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

VERSE 2
Azawntu hits’anatu aleqnbh beseqeqen
Mechem lante aysanh aqrbln yesaqun qen
Dagm yabb belbachn yeregefew yefqr zer
Bemiyalf hasab tedegfen tet’elalfen endanqer

VERSE 3
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Maedachn mulu yihun maedachn t’gab argew
Endalefew melkam gize andu andun yidegfew

VERSE 4
Atrefrfen bebereket t’qit zerten bizu ench’ed
Yeabawn zemen mels ers bersbersm enwaded
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

VERSE 5
Yehazenachn kaba yiwleq desta albsen ende dirow
Enat behazen atgoda abat aynur aqerqro
Tinantnan asresteh beadis zemen adis adrgen
Qim beqeln arqln endegenam asteqaqfen

VERSE 6
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'deg-degun-asayen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 1
ሾተል ስቦ የነበረ አበባን ይስጥ ለወንድሙ
ከመቅበዝበዝ ከጸብ ይውጣ አብሮት ይኑር በሰላሙ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 2
አዛውንቱ ህጻናቱ አለቅንብህ በሰቀቀን
መቼም ላንተ አይሳንህ አቅርብልን የሳቁን ቀን
ዳግም ያብብ በልባችን የረገፈው የፍቅር ዘር
በሚያልፍ ሃሳብ ተደግፈን ተጠላልፈን እንዳንቀር

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 3
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ማዕዳችን ሙሉ ይሁን ማዕዳችን ጥጋብ አርገው
እንዳለፈው መልካም ጊዜ አንዱ አንዱን ይደግፈው

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 4
አትረፍርፈን በበረከት ጥቂት ዘርተን ብዙ እንጨድ
የአባውን ዘመን መልስ እርስ በርስበርስም እንዋደድ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 5
የሃዘናችን ካባ ይውለቅ ደስታ አልብሰን እንደ ድሮው
እናት በሃዘን አትጎዳ አባት አይኑር አቀርቅሮ
ትናንትናን አስረስተህ በአዲስ ዘመን አዲስ አድርገን
ቂም በቀልን አርቅልን እንደገናም አስተቃቅፈን

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 6
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 1
Shotel sibo yenebere abeban yist’ lewendmu
Kemeqbezbez kets’eb yiwt’a abrot yinur beselamu
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 2
Azawntu hits’anatu aleqnbh beseqeqen
Mechem lante aysanh aqrbln yesaqun qen
Dagm yabb belbachn yeregefew yefqr zer
Bemiyalf hasab tedegfen tet’elalfen endanqer

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 3
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Maedachn mulu yihun maedachn t’gab argew
Endalefew melkam gize andu andun yidegfew

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 4
Atrefrfen bebereket t’qit zerten bizu ench’ed
Yeabawn zemen mels ers bersbersm enwaded
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 5
Yehazenachn kaba yiwleq desta albsen ende dirow
Enat behazen atgoda abat aynur aqerqro
Tinantnan asresteh beadis zemen adis adrgen
Qim beqeln arqln endegenam asteqaqfen

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 6
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'deg-degun-asayen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Degu Samirawi (degu-samirawi)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 1
ኣብ ሞንጎ ህይወትን ሞትን እንከለኹ
ዘልዕለኒ ደልየ ብብርቱዕ ጸዋዕኩ
ርጋጽ ሓደ ካህን ካብ ርሑቕ ሰማዕኩ
ንኸልዕለኒ ውን ብዙሕ ተመነኹ

VERSE 2
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ
ሓደ ሌዋዊ ሰብ ብመንገደይ መጸ
ኣልዕለኒ በለት ልበይ እናሓዘነት

VERSE 3
ናባይ እንክጽጋዕ ርጋጹ ሰሚዐ
ኣልዕለኒ በልኩ ኣእዳወይ ዘርጊሐ
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ

VERSE 4
ሓደ ሳምራዊ ግን ርእዩኒ ቀረበ
ብፍጹም ትሕትና ናባይ ተጸገዐ
ንቑስለይ ሓጺቡ ኣፍሰሰለይ ዘይቱ
ቅንዕ ኣበለኒ ኣእዳዉ ዘርጊሑ

VERSE 5
ብኽልተ ዲናር ከፊሉ ሓለውቲ
ጐይታይ ኣድሓነኒ ካብ ክፉእ መንጣሊ',
      lyrics_transliteration = 'Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 1
Ab mongo hiywetn motn enkeleኹ
Zeleleni delye bibrtue ts’ewaeku
Rigats’ hade kahn kab rihuቕ semaeku
Niኸleleni win bizuh temeneኹ

VERSE 2
Fintt ilu ኸde tets’eynu qusley
Mesiluni neru zimets’e medhney
Hade lewawi seb bimengedey mets’e
Aleleni belet libey enahazenet

VERSE 3
Nabay enkts’gae rigats’u semia
Aleleni belku aedawey zergihe
Fintt ilu ኸde tets’eynu qusley
Mesiluni neru zimets’e medhney

VERSE 4
Hade samrawi gin rieyuni qerebe
Bifts’um tihtna nabay tets’egea
Niቑsley hats’ibu afseseley zeytu
Qine abeleni aedawu zergihu

VERSE 5
Biኽlte dinar kefilu halewti
Gweytay adhaneni kab kifue ment’ali',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'degu-samirawi'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 1
ኣብ ሞንጎ ህይወትን ሞትን እንከለኹ
ዘልዕለኒ ደልየ ብብርቱዕ ጸዋዕኩ
ርጋጽ ሓደ ካህን ካብ ርሑቕ ሰማዕኩ
ንኸልዕለኒ ውን ብዙሕ ተመነኹ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 2
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ
ሓደ ሌዋዊ ሰብ ብመንገደይ መጸ
ኣልዕለኒ በለት ልበይ እናሓዘነት

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 3
ናባይ እንክጽጋዕ ርጋጹ ሰሚዐ
ኣልዕለኒ በልኩ ኣእዳወይ ዘርጊሐ
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 4
ሓደ ሳምራዊ ግን ርእዩኒ ቀረበ
ብፍጹም ትሕትና ናባይ ተጸገዐ
ንቑስለይ ሓጺቡ ኣፍሰሰለይ ዘይቱ
ቅንዕ ኣበለኒ ኣእዳዉ ዘርጊሑ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 5
ብኽልተ ዲናር ከፊሉ ሓለውቲ
ጐይታይ ኣድሓነኒ ካብ ክፉእ መንጣሊ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 1
Ab mongo hiywetn motn enkeleኹ
Zeleleni delye bibrtue ts’ewaeku
Rigats’ hade kahn kab rihuቕ semaeku
Niኸleleni win bizuh temeneኹ

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 2
Fintt ilu ኸde tets’eynu qusley
Mesiluni neru zimets’e medhney
Hade lewawi seb bimengedey mets’e
Aleleni belet libey enahazenet

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 3
Nabay enkts’gae rigats’u semia
Aleleni belku aedawey zergihe
Fintt ilu ኸde tets’eynu qusley
Mesiluni neru zimets’e medhney

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 4
Hade samrawi gin rieyuni qerebe
Bifts’um tihtna nabay tets’egea
Niቑsley hats’ibu afseseley zeytu
Qine abeleni aedawu zergihu

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 5
Biኽlte dinar kefilu halewti
Gweytay adhaneni kab kifue ment’ali

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'degu-samirawi', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Degu Samrawi Zemarit Fasika (degu-samrawi-zemarit-fasika)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 1
ሌዋዊው ሸሸኝ በሩቁ ተመልክቶ
ካህኑ አዘነ አለፈ ቁስሌን አይቶ
አንተ ብቻ ነህ ግድ የሚልህ ስለ እኔ
የነፍሴ ቤዛ አማኑኤል መድኅኔ

VERSE 2
ድካሜን አይተህ ከአህያ ላይ የወረድክ
እኔን ልታድን ልታነሳኝ የወደድክ
ከእንግዶች ስፍራ አሳደርከኝ ወስደህ
አስታመኸኛል ሁለት ዲናር ከፍለህ

VERSE 3
ወንጌል መግበህ በሐዲሱ ኪዳን
በመስቀል ሞተህ ሰጠኸኝ ህይወትን
ጌታዬ ደርሰህ ባታነሳኝ ወድቄ
በወንበዴ እጅ እኖር ነበር ተንቄ

VERSE 4
የሚያየኝ የለም በሰዎች ተንቄአለሁ
በነግህ በሰርክ ጌታዬ እልሃለሁ
አንሳኝ ከትቢያ ከእቅፍህ አስገባኝ
በፍቅርህ ዘይት ቁስሌን ፈውስልኝ',
      lyrics_transliteration = 'Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 1
Lewawiw sheshegn beruqu temelkto
Kahnu azene alefe quslen ayto
Ante bicha neh gid yemilh sile ene
Yenefse beza Amanuel medhne

VERSE 2
Dikamen ayteh keahya lay yeweredk
Enen litadn litanesagn yewededk
Keengdoch sifra asaderkegn wesdeh
Astameኸgnal hulet dinar kefleh

VERSE 3
Wengel megbeh behedisu kidan
Bemesqel moteh set’eኸgn hiywetn
Getaye derseh batanesagn wedqe
Bewenbede ej enor neber tenqe

VERSE 4
Yemiyayegn yelem besewoch tenqealehu
Benegh beserk Getaye elhalehu
Ansagn ketbiya keeqfh asgebagn
Befqrh zeyt quslen fewslgn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'degu-samrawi-zemarit-fasika'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 1
ሌዋዊው ሸሸኝ በሩቁ ተመልክቶ
ካህኑ አዘነ አለፈ ቁስሌን አይቶ
አንተ ብቻ ነህ ግድ የሚልህ ስለ እኔ
የነፍሴ ቤዛ አማኑኤል መድኅኔ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 2
ድካሜን አይተህ ከአህያ ላይ የወረድክ
እኔን ልታድን ልታነሳኝ የወደድክ
ከእንግዶች ስፍራ አሳደርከኝ ወስደህ
አስታመኸኛል ሁለት ዲናር ከፍለህ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 3
ወንጌል መግበህ በሐዲሱ ኪዳን
በመስቀል ሞተህ ሰጠኸኝ ህይወትን
ጌታዬ ደርሰህ ባታነሳኝ ወድቄ
በወንበዴ እጅ እኖር ነበር ተንቄ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 4
የሚያየኝ የለም በሰዎች ተንቄአለሁ
በነግህ በሰርክ ጌታዬ እልሃለሁ
አንሳኝ ከትቢያ ከእቅፍህ አስገባኝ
በፍቅርህ ዘይት ቁስሌን ፈውስልኝ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 1
Lewawiw sheshegn beruqu temelkto
Kahnu azene alefe quslen ayto
Ante bicha neh gid yemilh sile ene
Yenefse beza Amanuel medhne

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 2
Dikamen ayteh keahya lay yeweredk
Enen litadn litanesagn yewededk
Keengdoch sifra asaderkegn wesdeh
Astameኸgnal hulet dinar kefleh

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 3
Wengel megbeh behedisu kidan
Bemesqel moteh set’eኸgn hiywetn
Getaye derseh batanesagn wedqe
Bewenbede ej enor neber tenqe

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 4
Yemiyayegn yelem besewoch tenqealehu
Benegh beserk Getaye elhalehu
Ansagn ketbiya keeqfh asgebagn
Befqrh zeyt quslen fewslgn

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'degu-samrawi-zemarit-fasika', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dej Tenahu Koyiche Kidane Mihiretin (dej-tenahu-koyiche-kidane-mihiretin)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 1
ሞገስ ሁኚኝ ቀሪው ዘመኔን(2×)
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የአለሟን ቤዛ፤
የልጅሽ ቸርነት ያአንቺም ደግነት

VERSE 2
ባርያሽን ሰወረኝ ካስጨናቂ ሞት
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ

VERSE 3
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
ልቤ ባንቺ ፀና ከፍከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ፤

VERSE 4
በማዳንሽ ስራ ባርያሽ ደስ በሎኛል
የሀያላኑን ቀንድ ልጅሽ ሰ���ሮልኛል፤
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤

VERSE 5
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
እጄ በዶ ሲሆን ወዳጆቼም ሸሹ

VERSE 6
በመርገም ምክራቸው ሊለያዩኝ ሲሹ፤
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው፤
እናቴ ስምሽን ስጠራ

VERSE 7
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ

VERSE 8
ከአውደምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየቺኝ ኪዳነምህረት፤
ሀሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ ባንቺ ነው

VERSE 9
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤',
      lyrics_transliteration = 'Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 1
Moges hugnign qeriw zemenen(2×)
Yemekeraw zemen alefe endewaza
Anchin tet’egche yealemwan beza;
Yeljsh chernet yaanchim degnet

VERSE 2
Baryashn seweregn kasch’enaqi mot
Enate simshn sit’era
Alefe yahulu mekera;
Enbaye kefitsh fesese

VERSE 3
Emye banchi eyetabese;
Selam aleki
Libe banchi ts’ena kefkefm ale
Bet’elatochem lay afe tenagere;

VERSE 4
Bemadansh sira baryash des belognal
Yeheyalanun qend lijsh se���rolgnal;
Enate simshn sit’era
Alefe yahulu mekera;

VERSE 5
Enbaye kefitsh fesese
Emye banchi eyetabese;
Selam aleki
Eje bedo sihon wedajochem sheshu

VERSE 6
Bemergem mikrachew lileyayugn sishu;
Ersu yeset’egnn ersu wesede alkwachew
Emebete alechgn biye asaferkwachew;
Enate simshn sit’era

VERSE 7
Alefe yahulu mekera;
Enbaye kefitsh fesese
Emye banchi eyetabese;
Selam aleki

VERSE 8
Keawdemhretu hogne sit’erat
Zenbel bila ayechign kidanemhret;
Hesabshn minm yelem yemimeslew
Ereft yagegnehut enate banchi new

VERSE 9
Enate simshn sit’era
Alefe yahulu mekera;
Enbaye kefitsh fesese
Emye banchi eyetabese;',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dej-tenahu-koyiche-kidane-mihiretin'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 1
ሞገስ ሁኚኝ ቀሪው ዘመኔን(2×)
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የአለሟን ቤዛ፤
የልጅሽ ቸርነት ያአንቺም ደግነት

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 2
ባርያሽን ሰወረኝ ካስጨናቂ ሞት
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 3
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
ልቤ ባንቺ ፀና ከፍከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 4
በማዳንሽ ስራ ባርያሽ ደስ በሎኛል
የሀያላኑን ቀንድ ልጅሽ ሰ���ሮልኛል፤
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 5
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
እጄ በዶ ሲሆን ወዳጆቼም ሸሹ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 6
በመርገም ምክራቸው ሊለያዩኝ ሲሹ፤
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው፤
እናቴ ስምሽን ስጠራ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 7
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 8
ከአውደምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየቺኝ ኪዳነምህረት፤
ሀሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ ባንቺ ነው

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 9
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 1
Moges hugnign qeriw zemenen(2×)
Yemekeraw zemen alefe endewaza
Anchin tet’egche yealemwan beza;
Yeljsh chernet yaanchim degnet

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 2
Baryashn seweregn kasch’enaqi mot
Enate simshn sit’era
Alefe yahulu mekera;
Enbaye kefitsh fesese

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 3
Emye banchi eyetabese;
Selam aleki
Libe banchi ts’ena kefkefm ale
Bet’elatochem lay afe tenagere;

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 4
Bemadansh sira baryash des belognal
Yeheyalanun qend lijsh se���rolgnal;
Enate simshn sit’era
Alefe yahulu mekera;

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 5
Enbaye kefitsh fesese
Emye banchi eyetabese;
Selam aleki
Eje bedo sihon wedajochem sheshu

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 6
Bemergem mikrachew lileyayugn sishu;
Ersu yeset’egnn ersu wesede alkwachew
Emebete alechgn biye asaferkwachew;
Enate simshn sit’era

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 7
Alefe yahulu mekera;
Enbaye kefitsh fesese
Emye banchi eyetabese;
Selam aleki

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 8
Keawdemhretu hogne sit’erat
Zenbel bila ayechign kidanemhret;
Hesabshn minm yelem yemimeslew
Ereft yagegnehut enate banchi new

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 9
Enate simshn sit’era
Alefe yahulu mekera;
Enbaye kefitsh fesese
Emye banchi eyetabese;

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dej-tenahu-koyiche-kidane-mihiretin', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dej Tenahu Koyiche Kidane Mihiretini (dej-tenahu-koyiche-kidane-mihiretini)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 1
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የዓለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባሪያሽን ሰወረኝ ከአስጨናቂ ሞት

VERSE 2
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ

VERSE 3
ልቤ በአንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ
በማዳንሽ ሥራ ባሪያሽ ደስ ብሎኛል

VERSE 4
የኃያሉን ቀስት ልጅሽ ሰብሮልኛል
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ

VERSE 5
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
እጄ ባዶ ሲሆን ወዳጆቼም ሸሹ
በመርገም ምክራቸው ሊለይልዩን ሲሹ

VERSE 6
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ

VERSE 7
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
ከዓውደ ምህረቱ ሆኜ ስጠራት

VERSE 8
ዘንበል ብላ አየችኝ ኪዳነምህረት
ሐሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ በአንቺ ነው
እናቴ ሥምሽን ስጠራ

VERSE 9
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ',
      lyrics_transliteration = 'Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 1
Yemekeraw zemen alefe endewaza
Anchin tet’egche yealemwan beza
Yeljsh chernet yeanchim degnet
Bariyashn seweregn keasch’enaqi mot

VERSE 2
Enate simshn sit’era
Alefe ya hulu mekera
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki

VERSE 3
Libe beanchi ts’ena kef kefm ale
Bet’elatochem lay afe tenagere
Bemadansh sira bariyash des bilognal

VERSE 4
Yehayalun qest lijsh sebrolgnal
Enate simshn sit’era
Alefe ya hulu mekera
Enbaye befitsh fesese

VERSE 5
Emye beanchi eyetabese selam eleki
Eje bado sihon wedajochem sheshu
Bemergem mikrachew lileylyun sishu

VERSE 6
Ersu yeset’egnn ersu wesede alkwachew
Emebete alechgn biye asaferkwachew
Enate simshn sit’era
Alefe ya hulu mekera

VERSE 7
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki
Keawde mihretu hogne sit’erat

VERSE 8
Zenbel bila ayechgn kidanemhret
Hesabshn minm yelem yemimeslew
Ereft yagegnehut enate beanchi new
Enate simshn sit’era

VERSE 9
Alefe ya hulu mekera
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dej-tenahu-koyiche-kidane-mihiretini'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 1
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የዓለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባሪያሽን ሰወረኝ ከአስጨናቂ ሞት

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 2
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 3
አዝ
ልቤ በአንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ
በማዳንሽ ሥራ ባሪያሽ ደስ ብሎኛል

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 4
የኃያሉን ቀስት ልጅሽ ሰብሮልኛል
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 5
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ
እጄ ባዶ ሲሆን ወዳጆቼም ሸሹ
በመርገም ምክራቸው ሊለይልዩን ሲሹ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 6
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 7
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ
ከዓውደ ምህረቱ ሆኜ ስጠራት

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 8
ዘንበል ብላ አየችኝ ኪዳነምህረት
ሐሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ በአንቺ ነው
እናቴ ሥምሽን ስጠራ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 9
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 1
Yemekeraw zemen alefe endewaza
Anchin tet’egche yealemwan beza
Yeljsh chernet yeanchim degnet
Bariyashn seweregn keasch’enaqi mot

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 2
Enate simshn sit’era
Alefe ya hulu mekera
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 3
CHORUS
Libe beanchi ts’ena kef kefm ale
Bet’elatochem lay afe tenagere
Bemadansh sira bariyash des bilognal

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 4
Yehayalun qest lijsh sebrolgnal
Enate simshn sit’era
Alefe ya hulu mekera
Enbaye befitsh fesese

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 5
Emye beanchi eyetabese selam eleki
CHORUS
Eje bado sihon wedajochem sheshu
Bemergem mikrachew lileylyun sishu

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 6
Ersu yeset’egnn ersu wesede alkwachew
Emebete alechgn biye asaferkwachew
Enate simshn sit’era
Alefe ya hulu mekera

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 7
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki
CHORUS
Keawde mihretu hogne sit’erat

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 8
Zenbel bila ayechgn kidanemhret
Hesabshn minm yelem yemimeslew
Ereft yagegnehut enate beanchi new
Enate simshn sit’era

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 9
Alefe ya hulu mekera
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dej-tenahu-koyiche-kidane-mihiretini', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dej T’naaw Koyche (dej-tenaw-koyche)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ደጅ ጠናው ቆይቼ ኪዳነ ምህረትን
ተፅናናሁኝ ረሳው ሀዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን

VERSE 1
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የአለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባርያሽን ሰወረኝ ከአስጨናቂው ሞት

VERSE 2
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

VERSE 3
ልቤ ባንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼ ላይ አፌ ተናገረ
በማዳንሽ ስራ ባርያሽ ደስ ብሎኛል
የኃያላኑን ቀስት ልጅሽ ሰብሮልኛል

VERSE 4
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

VERSE 5
እጄ ባዶ ሲሆን ወዳጆቼ ሸሹ
በመርግም ምክራቸው ሊለያዩን ሲሹ
እርሱ የሰጠኝን እሱ ወሰድ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው

VERSE 6
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ

VERSE 7
ከአውደ ምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየቺኝ ኪዳነ ምህረት
ሀሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘውት እናቴ ባንቺ ነው

VERSE 8
እናቴ ስምሽን ስጠራ አለፈ ያሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ እምዬ በአንቺ እየታበሰ - ሰላም እለኪ',
      lyrics_transliteration = 'Dej t’naaw koyche Kidane Mihretin
Tets’nanahun resawe hazenen
Ye’Amlak enat, emebetachin
Moges hunign qeriyu zemenen

VERSE 1
Yemekiraw zemen alefe endewaza
Anch’in tetegiche ye’aleman beza
Ye lijish chernet, ye anchim degnet
Baryashen sewareny ke’aschenaqiw mot

VERSE 2
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

VERSE 3
Libe banchi ts’ena, kef kefm ale
Bet’elatoch’e lay, afe tenagere
Bemadanesh sira, baryashen des blonyal
Yehayalanu’n qest, lijish sebrolyal

VERSE 4
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

VERSE 5
Eje bado sihon, wedajoch’e sheshu
Bemergem mikrach’ew, lileyayun sishu
Ersu yeset’egn, isu wosed alk’achew
Emebete alechign biye asafark’wachew

VERSE 6
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki

VERSE 7
Be’awde mihretu hone set’rat
Zenbel bla ayechin Kidane Mihret
Hasabshen minm yelem yemimeslew
Ereft yagenyewt enate banchi new

VERSE 8
Enate simshen set’ra alefe yahulu mekera
Enbaye bef’itish fese, emye be’anchi eyetabese — selam eleki',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dej-tenaw-koyche'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dej-tenaw-koyche', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Demenaw Bayitay (demenaw-bayitay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 1
አስፈሪ ነው ያልኩት ድቅድቁ ጨለማ
በብርሃን ይዋጣል ድምፅ ስታሰማ
ያ የታወጀብኝ አስፈሪው አዋጄ
ከዙሪያዬ ሸሸ ስታንኳኳው ደጄን

VERSE 2
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል
የጠበቅኩህ አምላክ በመጠበቂያዬ
በልቅሶዬ ወራት ያልተውከኝ ጌታዬ

VERSE 3
ልታቆመኝ ስትፈቅድ ሰዓትህ ስትደስ
መባረክ ታውቃለህ በብዙ ሞገስ
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል

VERSE 4
እጄን በአፌ የጫንኩት በብዙ መገረም
የእንባ ሳግ ማነባው በሐዘን አይደለም
አልብሰከሰክም ትናንቴን እያሰብኩ
ከፊቴ የተሻለ መኖሩን ስላወኩ

VERSE 5
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል
ያለፈውን ትቼ ወደ ፊት ልራመድ
እርሱ ባሰበልኝ ባሰመረው መንገድ

VERSE 6
ከእንግዲህ አልሰጋም በምርትህ ሄጄ
ዝምታ ለምኔ ባንተ ተወድጄ
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል',
      lyrics_transliteration = 'Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 1
Asferi new yalkut diqdqu ch’elema
Bebrhan yiwat’al dimts’ sitasema
Ya yetawejebgn asferiw awaje
Kezuriyaye sheshe sitankwakwaw dejen

VERSE 2
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal
Yet’ebeqkuh amlak bemet’ebeqiyaye
Belqsoye werat yaltewkegn Getaye

VERSE 3
Litaqomegn sitfeqd seath sitdes
Mebarek tawqaleh bebzu moges
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal

VERSE 4
Ejen beafe yech’ankut bebzu megerem
Yeenba sag manebaw behezen aydelem
Albsekesekm tinanten eyasebku
Kefite yeteshale menorun silaweku

VERSE 5
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal
Yalefewn tiche wede fit liramed
Ersu basebelgn basemerew menged

VERSE 6
Keengdih alsegam bemrth heje
Zimta lemne bante tewedje
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'demenaw-bayitay'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'demenaw-bayitay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dengel Weladite Kal (dengel-weladite-kal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 1
አሟሟትሽ በጥር ነሐሴ መቃብር ድንግል
የአንቺ ለብቻ ነው ትንሣኤሽ ሲነገር ድንግል
ሥጋሽ በምድር ላይ የታለ እንደ ፍጡር ድንግል
ዐርጓል ወደ ሰማይ ከክርስቶስ መንበር ድንግል

VERSE 2
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 3
ሥጋሽን ሲያሳርጉ መላእክተ ሰማይ ድንግል
ቶማስ በደመና ሲመጣ መንገድ ላይ ድንግል
መግነዝ ተረከበ ለሐዋርያት ሊያሳይ ድንግል

VERSE 4
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 5
ትንሣኤሽን ሽተው ግራ ሲገባቸው ድንግል
ሐዋርያት ጾመው ተገለጥሽላቸው ድንግል
ተቀብራ አልቀረችም በምድር ከደጇ ድንግል
ወደ ላይ ዐረገች እርሷም እንደልጇ ድንግል

VERSE 6
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 7
ለማየት ሲጏጉ የድንግልን ትንሣኤ ድንግል
ዕርገቷን አወቁ በብዙ ሱባዔ ድንግል
እኛም እንጸልይ በራችንን እንዝጋ ድንግል
ከወላዲተ አምላክ እንድናገኝ ዋጋ ድንግል

VERSE 8
ድንግል ድንግል ወላዲተ ቃል (2)',
      lyrics_transliteration = 'Dengel Dengel Weladite Kal (2)

VERSE 1
Amumatesh beter Nehasie mekabir Dengel
Yanchi lebecha new Tinsaesh sineger Dengel
Segash bemider lay yetale endefitur Dengel
Aregwal wede semay keKristos menber Dengel

VERSE 2
Dengel Dengel Weladite Kal (2)

VERSE 3
Segashin siasargu melaekt kesemay Dengel
Thomas bedemena simeta meneged lay Dengel
Megnez terekebe leHawaryat liyasay Dengel

VERSE 4
Dengel Dengel Weladite Kal (2)

VERSE 5
Tensaeshin shitew gira sigebachew Dengel
Hawaryat tsomew tegeletsshilachew Dengel
Teqebra alqerechim bemidir kedejua Dengel
Wedelay aregech ersuam endelijua Dengel

VERSE 6
Dengel Dengel Weladite Kal (2)

VERSE 7
Lemayet siguagu yedinglin tinsae Dengel
Ergetuan aweku bebizu subaie Dengel
Egnam entseliy berachinin enziga Dengel
KeWeladite Amlak endinagegn waga Dengel

VERSE 8
Dengel Dengel Weladite Kal (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dengel-weladite-kal'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dengel-weladite-kal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Des Yibelen (des-yibelen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 1
ምን ቢተባበሩ ምቀኞች ቢጥሩ
ቅዱሱ መስቀሉንም ሸሽገው ቢሰውሩ (2)
አልቻሉም ሊያጠፉ ምን ቢተባበሩ (2)

VERSE 2
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 3
በተራራ ተሸፍኖ ለዘመናት (2)
ተጥሎ በተንኮል ተደብቆ ከኖረበት (2)
ተገለጠ እነሆ በደመራ እሳት (2)

VERSE 4
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 5
ታሪካዊ የክርስቶስ ህያው መስቀል (2)
ይኸው ተገለጠ በክብር በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲሁ ይኖራል (2)

VERSE 6
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 7
እሌኒ ነች ይህን ምሥጢር ያስገኘችው (2)
ደመራን በጥበብ በቦታው ያስቆመችው (2)
የተንኮልን ተራራ ያስቆፈረችው (2)',
      lyrics_transliteration = 'Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 1
Min bitebaberu mikegnoch bitru
Kidusu meskelunim sheshigew bisewuru (2)
Alchalum liyatefu min bitebaberu (2)

VERSE 2
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 3
Beterara teshefino lezemenat (2)
Tetilo betenkol tedebiko kenorebet (2)
Tegelete eneho bedemera esat (2)

VERSE 4
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 5
Tarikawi yekiristos hiyaw meskel (2)
Yihew tegelete bekibir begirum hayl (2)
Mingizem siyabera endihu yinoral (2)

VERSE 6
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 7
Eleni nech yihin mistir yasgegnechiw (2)
Demeran betibeb bebotaw yaskomechiw (2)
Yetenkolin terara yaskoferechiw (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'des-yibelen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 1
ምን ቢተባበሩ ምቀኞች ቢጥሩ
ቅዱሱ መስቀሉንም ሸሽገው ቢሰውሩ (2)
አልቻሉም ሊያጠፉ ምን ቢተባበሩ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 2
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 3
በተራራ ተሸፍኖ ለዘመናት (2)
ተጥሎ በተንኮል ተደብቆ ከኖረበት (2)
ተገለጠ እነሆ በደመራ እሳት (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 4
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 5
ታሪካዊ የክርስቶስ ህያው መስቀል (2)
ይኸው ተገለጠ በክብር በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲሁ ይኖራል (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 6
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 7
እሌኒ ነች ይህን ምሥጢር ያስገኘችው (2)
ደመራን በጥበብ በቦታው ያስቆመችው (2)
የተንኮልን ተራራ ያስቆፈረችው (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 1
Min bitebaberu mikegnoch bitru
Kidusu meskelunim sheshigew bisewuru (2)
Alchalum liyatefu min bitebaberu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 2
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 3
Beterara teshefino lezemenat (2)
Tetilo betenkol tedebiko kenorebet (2)
Tegelete eneho bedemera esat (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 4
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 5
Tarikawi yekiristos hiyaw meskel (2)
Yihew tegelete bekibir begirum hayl (2)
Mingizem siyabera endihu yinoral (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 6
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 7
Eleni nech yihin mistir yasgegnechiw (2)
Demeran betibeb bebotaw yaskomechiw (2)
Yetenkolin terara yaskoferechiw (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'des-yibelen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: DESTAN ABSARI FEBEN EYOB (destan-absari-feben-eyob)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 1
የምድንበትን ምሥራች ንገረኝ
በመንገዴ ቅደም ጽድቅን አስተምረኝ
አትለየኝ ከእኔ በመውጣት በመግባቴ
ከክፉ አድነኝ ገብርኤል አባቴ

VERSE 2
''ባንተ ጥበቃ ነው ለዛሬ የደረስኩት
የመከራን ማዕበል አልፌ የቆምኩት
አንተን ተደግፌ ነገንም አልፈራ
ቀድመሀልና መንገዴን ልትመራ

VERSE 3
ያሳደግኸኝ መልአክ በእንክብካቤ
ከአፌ የማትጠፋ ገብርኤል ነህ ቅርቤ
ዙሪያዬ ረበህ ዘውትር አይሀለሁ
የልቤን ኹሉ ለአንተ እነግራለሁ

VERSE 4
ድንቅን የምታደርግ በእኔ ሕይወት
የምትቆምልኝ በእግዚአብሔር ፊት
የምትባርከኝ በሥጋም በነፍሴ
መልአከ ራማ ገብርኤል ሞገሴ',
      lyrics_transliteration = 'Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 1
Yemdnbetn misrach nigeregn
Bemengede qidem ts’dqn astemregn
Atleyegn keene bemewt’at bemegbate
Kekfu adnegn Gebriel abate

VERSE 2
''bante t’beqa new lezare yedereskut
Yemekeran maebel alfe yeqomkut
Anten tedegfe negenm alfera
Qedmehelna mengeden litmera

VERSE 3
Yasadegኸgn melak beenkbkabe
Keafe yematt’efa Gebriel neh qirbe
Zuriyaye rebeh zewtr ayhelehu
Yelben ኹlu leante enegralehu

VERSE 4
Dinqn yemtaderg beene hiywet
Yemtqomlgn beEgziabher fit
Yemtbarkegn besgam benefse
Melake rama Gebriel mogese',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'destan-absari-feben-eyob'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 1
የምድንበትን ምሥራች ንገረኝ
በመንገዴ ቅደም ጽድቅን አስተምረኝ
አትለየኝ ከእኔ በመውጣት በመግባቴ
ከክፉ አድነኝ ገብርኤል አባቴ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 2
''ባንተ ጥበቃ ነው ለዛሬ የደረስኩት
የመከራን ማዕበል አልፌ የቆምኩት
አንተን ተደግፌ ነገንም አልፈራ
ቀድመሀልና መንገዴን ልትመራ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 3
ያሳደግኸኝ መልአክ በእንክብካቤ
ከአፌ የማትጠፋ ገብርኤል ነህ ቅርቤ
ዙሪያዬ ረበህ ዘውትር አይሀለሁ
የልቤን ኹሉ ለአንተ እነግራለሁ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 4
ድንቅን የምታደርግ በእኔ ሕይወት
የምትቆምልኝ በእግዚአብሔር ፊት
የምትባርከኝ በሥጋም በነፍሴ
መልአከ ራማ ገብርኤል ሞገሴ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 1
Yemdnbetn misrach nigeregn
Bemengede qidem ts’dqn astemregn
Atleyegn keene bemewt’at bemegbate
Kekfu adnegn Gebriel abate

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 2
''bante t’beqa new lezare yedereskut
Yemekeran maebel alfe yeqomkut
Anten tedegfe negenm alfera
Qedmehelna mengeden litmera

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 3
Yasadegኸgn melak beenkbkabe
Keafe yematt’efa Gebriel neh qirbe
Zuriyaye rebeh zewtr ayhelehu
Yelben ኹlu leante enegralehu

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 4
Dinqn yemtaderg beene hiywet
Yemtqomlgn beEgziabher fit
Yemtbarkegn besgam benefse
Melake rama Gebriel mogese

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'destan-absari-feben-eyob', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Di/n Teame Segid Mezimur (di-n-teame-segid-mezimur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 1
ከምቶም ደቂ ዓሳ ሓድሕድ ክንጨኻኸን
ኮይንና ድዩ በቃ ይቅሬታ ክሰኣን
ሓደራ ሓደራ ፍቁራት ኣሕዋትና
ጋሻ ውሕጅ ስጋ ከይተዳህልለና

VERSE 2
ንነብሲ ነዳሉ መታን ክሕሸና
ጽባሕ ንበደልና ሕድገት ክንረኽበሉ
ጾር ኣሕዋትና ንጹር ዋላ ተበደሉ
ጠዋሪ ስኢኑ ምንባር ዝናፈቀ

VERSE 3
ነዛ ድራር እለት ከቶ ዘይሰነቀ
ኣብቲ ጎደናታት ኣሎ ዝወደቀ
ተመሊስካ ትረድኦ ገዲፍካዮ ኣይትእቶ
ምስላ ኣቦታትና ጎይታ ዝሰረቶ

VERSE 4
ርህራሄ ሳምራዊ ልብና ከይስሕቶ
ኣምላክ ክረድኣና ኣብቲ ዳሕራይ ዓለም
ብጻይና ንምርዳእ ሃየ ንቀዳደም
ንዕምቆት ለውሃቱ መን''ዩ ዘስተንትኖ

VERSE 5
ሕያው ኮነ ጉኡዝ ዝኣምኖ ዘይኣምኖ
መን ኣሎና ፍጡር ምሕረቱ ዘይከድኖ
ጽሓይ ኮነ ዝናብ ብልግሲ ዝምግብ
ዘየዳሉ ኣምላኽ ኣቦ ምሉእ ህያብ

VERSE 6
ሂቡ ዘይጣዓስ ምሒሩ ዘይርብርብ
ንዝርጉሓት ኣእዳው ክንህበን ትኳቦ
ይጽበየና''ሎ ምሕረቱ ክንስዕቦ
እንትርፎ ፈጣሪ መን ኣሎና ፍጹም

VERSE 7
ሰብ ጎደሎ ፍጥረት ሰብ ኣበረ ድኻም
ታሪኽ ሕሉፍና''ንድዩ ዛንታ ኣቦና ኣዳም
ወይ''ዚ ጎይታና ግን መጠን ኣልቦ ፍቅሩ
ውርደትና ሓዚሉ መስቀል ምሽንካሩ

VERSE 8
ሓውና ክንሰትር''ዩ በደልና ሰቲሩ
ባሮቱ ዘይኮንስ ክንከውን ኣዕርኽቱ
ኣሕዋት ንደናገጽ ዘኪርና ምሕረቱ',
      lyrics_transliteration = 'Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 1
Kemtom deqi asa hadhd kinch’eኻኸn
Koynna diyu beqa yiqreta kisean
Hadera hadera fiqurat ahwatna
Gasha wihj siga keytedahllena

VERSE 2
Ninebsi nedalu metan kihshena
Ts’bah nibedelna hidget kinreኽbelu
Ts’or ahwatna nits’ur wala tebedelu
T’ewari siinu minbar zinafeqe

VERSE 3
Neza dirar elet keto zeyseneqe
Abti godenatat alo ziwedeqe
Temeliska tiredo gedifkayo ayteto
Misla abotatna goyta zisereto

VERSE 4
Rihrahe samrawi libna keyshto
Amlak kiredana abti dahray alem
Bits’ayna nimrdae haye niqedadem
Niemqot lewhatu men''yu zestentno

VERSE 5
Hiyaw kone guuz ziamno zeyamno
Men alona fit’ur mihretu zeykedno
Ts’hay kone zinab bilgsi zimgb
Zeyedalu amlaኽ abo milue hiyab

VERSE 6
Hibu zeyt’aas mihiru zeyrbrb
Nizrguhat aedaw kinhben tikwabo
Yits’beyena''lo mihretu kinsebo
Entrfo fet’ari men alona fits’um

VERSE 7
Seb godelo fit’ret seb abere diኻm
Tariኽ hilufna''nidyu zanta abona adam
Wey''zi goytana gin met’en albo fiqru
Wirdetna hazilu mesqel mishnkaru

VERSE 8
Hawna kinsetr''yu bedelna setiru
Barotu zeykons kinkewn aerኽtu
Ahwat nidenagets’ zekirna mihretu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'di-n-teame-segid-mezimur'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'di-n-teame-segid-mezimur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Di/n Zemari Behayilu Tebeje Adis Yeemebetachin Zimare Yeewinet Mena (di-n-zemari-behayilu-tebeje-adis-yeemebetachin-zimare-yeewinet-mena)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ

VERSE 1
መሶበ ወርቅና መጋረጃ ሰፍታ
እንጨቱንም ሰብራ ውሃውንም ቀድታ
የጌታ አገልጋይ ልጅ እንዲሰጠን
ስለት እንግባ አሉ ሐና ና እያቄም(❷)

VERSE 2
ሰንጥቃ ስትመጣ ሰባቱን ሰማያት
ተገልጦለት በራእይ እያቂምም አያት
በሐና እራስ ላይ ስታርፍ በክብር

VERSE 3
በማህጸን ጸንሳት በሆዷ ስታድር(❷)
በማህጸን ሳለች ስታደርግ ታምር
አይሁድ ተመቅኝተው እንዲህ ይሉ ነበረ

VERSE 4
ሰማንያ ዓመት ገዙ ዳዊት ሰለሞን
ከእርሷ የሚወለደው ከቶ ምን ሊሆን(❷)
ቀድማ የተዘጋጀች በህሌና አምላክ

VERSE 5
መመረጧ ይደንቃል ይህንን ስናስብ
ተወለደች ማርያም ከሐናና እያቄም
ደግሞ እናት ልትሆነው ለመድኃኔዓለም(❷)

VERSE 6
ሆዷ ዘመድ ሳይወድ አፏ እህል ሳይፈልግ
ለጌታ ሰጥተናት በመቅደሱ ትደግ
ድንግልን አስገቧት በሶስት ዓመቷ
ቤተ እግዚብሔር ወስደው እናትና አባቷ(❷)

VERSE 7
ካህኑ ዘካርያስ ስለምግቧ አስቦ
ምጥቅድሙ መጣ ህዝቡንም ሰብስቦ
ቅዱስ ፈኑኤልም ከሰማያት ወርዶ

VERSE 8
ሲመግባት ታየ በክንፎቹ ጋርዶ(❷)',
      lyrics_transliteration = 'Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS

VERSE 1
Mesobe werqna megareja sefta
Ench’etunm sebra wihawnm qedta
Yegeta agelgay lij endiset’en
Silet engba alu hena na eyaqem(❷)

VERSE 2
Sent’qa sitmet’a sebatun semayat
Tegelt’olet beraey eyaqimm ayat
Behena eras lay sitarf bekbr

VERSE 3
Bemahts’en ts’ensat behodwa sitadr(❷)
Bemahts’en salech sitaderg tamr
Ayhud temeqgntew endih yilu nebere

VERSE 4
Semanya amet gezu dawit selemon
Keerswa yemiweledew keto min lihon(❷)
Qedma yetezegajech behlena amlak

VERSE 5
Memeret’wa yidenqal yihnn sinasb
Teweledech Maryam kehenana eyaqem
Degmo enat lithonew lemedhanealem(❷)

VERSE 6
Hodwa zemed saywed afwa ehl sayfelg
Legeta set’tenat bemeqdesu tideg
Dingln asgebwat besost ametwa
Bete egzibher wesdew enatna abatwa(❷)

VERSE 7
Kahnu zekaryas silemgbwa asbo
Mit’qdmu met’a hizbunm sebsbo
Kidus fenuelm kesemayat werdo

VERSE 8
Simegbat taye beknfochu gardo(❷)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'di-n-zemari-behayilu-tebeje-adis-yeemebetachin-zimare-yeewinet-mena'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ

VERSE 1
መሶበ ወርቅና መጋረጃ ሰፍታ
እንጨቱንም ሰብራ ውሃውንም ቀድታ
የጌታ አገልጋይ ልጅ እንዲሰጠን
ስለት እንግባ አሉ ሐና ና እያቄም(❷)

CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ

VERSE 2
አዝ
ሰንጥቃ ስትመጣ ሰባቱን ሰማያት
ተገልጦለት በራእይ እያቂምም አያት
በሐና እራስ ላይ ስታርፍ በክብር

CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ

VERSE 3
በማህጸን ጸንሳት በሆዷ ስታድር(❷)
አዝ
በማህጸን ሳለች ስታደርግ ታምር
አይሁድ ተመቅኝተው እንዲህ ይሉ ነበረ

CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ

VERSE 4
ሰማንያ ዓመት ገዙ ዳዊት ሰለሞን
ከእርሷ የሚወለደው ከቶ ምን ሊሆን(❷)
አዝ
ቀድማ የተዘጋጀች በህሌና አምላክ

CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ

VERSE 5
መመረጧ ይደንቃል ይህንን ስናስብ
ተወለደች ማርያም ከሐናና እያቄም
ደግሞ እናት ልትሆነው ለመድኃኔዓለም(❷)
አዝ

CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ

VERSE 6
ሆዷ ዘመድ ሳይወድ አፏ እህል ሳይፈልግ
ለጌታ ሰጥተናት በመቅደሱ ትደግ
ድንግልን አስገቧት በሶስት ዓመቷ
ቤተ እግዚብሔር ወስደው እናትና አባቷ(❷)

CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ

VERSE 7
አዝ
ካህኑ ዘካርያስ ስለምግቧ አስቦ
ምጥቅድሙ መጣ ህዝቡንም ሰብስቦ
ቅዱስ ፈኑኤልም ከሰማያት ወርዶ

CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ

VERSE 8
ሲመግባት ታየ በክንፎቹ ጋርዶ(❷)

CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS

VERSE 1
Mesobe werqna megareja sefta
Ench’etunm sebra wihawnm qedta
Yegeta agelgay lij endiset’en
Silet engba alu hena na eyaqem(❷)

CHORUS
Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS

VERSE 2
CHORUS
Sent’qa sitmet’a sebatun semayat
Tegelt’olet beraey eyaqimm ayat
Behena eras lay sitarf bekbr

CHORUS
Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS

VERSE 3
Bemahts’en ts’ensat behodwa sitadr(❷)
CHORUS
Bemahts’en salech sitaderg tamr
Ayhud temeqgntew endih yilu nebere

CHORUS
Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS

VERSE 4
Semanya amet gezu dawit selemon
Keerswa yemiweledew keto min lihon(❷)
CHORUS
Qedma yetezegajech behlena amlak

CHORUS
Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS

VERSE 5
Memeret’wa yidenqal yihnn sinasb
Teweledech Maryam kehenana eyaqem
Degmo enat lithonew lemedhanealem(❷)
CHORUS

CHORUS
Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS

VERSE 6
Hodwa zemed saywed afwa ehl sayfelg
Legeta set’tenat bemeqdesu tideg
Dingln asgebwat besost ametwa
Bete egzibher wesdew enatna abatwa(❷)

CHORUS
Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS

VERSE 7
CHORUS
Kahnu zekaryas silemgbwa asbo
Mit’qdmu met’a hizbunm sebsbo
Kidus fenuelm kesemayat werdo

CHORUS
Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS

VERSE 8
Simegbat taye beknfochu gardo(❷)

CHORUS
Yeewnet mena yalebsh(❷ yewerq mesob
Fireshn belan Dingil fireshn belan Maryam
Yehywetn migb
CHORUS'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'di-n-zemari-behayilu-tebeje-adis-yeemebetachin-zimare-yeewinet-mena', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Di/n Zemari Behayilu Tebeje Eregnaye Adis Mezimur Bevidiyo Diacon Zemari Behailu Tebeje Neworthodox Mezmur (di-n-zemari-behayilu-tebeje-eregnaye-adis-mezimur-bevidiyo-diacon-zemari)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 1
ህይወት በምድር ላይ ብትሆን ከባድ
ወጥመዷን ማምለጫ ጌታ ለኝ መንገድ
እጠባበቃለውህ ተስፋዬን አጥብቄ
ለዓለም አትተወኝም ኣልቀርም ወድቄ

VERSE 2
በእጅህ ተፈጥሬ ክቡር አድርገኸኝ
ከቶ ያለ አላማ መቼ መጣሁኝ [2]
በኔ ላይ ሰልጥኖ ሓጥያት ከነ ቤቱ
መሽቶ ይነጋብኛል ስባዝን በከንቱ

VERSE 3
ሰጠኸኝ ነበረ ጊዜ ለንስሓ
ትንሽ ኣድርጌ እንጂ ትልቁን አምሃ
ይነቀል ከልቤ የተተበተበው
አንተ ብቻ ልዪ ጠላቴን ጥለኸው[2]

VERSE 4
የበጎች እረኛ ቸሩ ጌታችን
ያድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

VERSE 5
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2)
ካገሬም ብሰደድ ጽናቱን አጥቼ
ገባው ተሰሎንቄ መቅደስህን ትቼ

VERSE 6
ጌታዬ መልሰኝ እኜ እመለሳለው
ልቤን ካንተ ሌላ ለማን እሰጣለው
ዓይኖቼም ይመሉ የፀፀትን እንባ
ደግሞም ተመልሼ ወደ እቅፍህ ልግባ[2]

VERSE 7
የበጎች እረኛ ቸሩ ጌታችን
የድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

VERSE 8
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2]',
      lyrics_transliteration = 'Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 1
Hiywet bemdr lay bithon kebad
Wet’medwan mamlech’a Geta legn menged
Et’ebabeqalewh tesfayen at’bqe
Lealem attewegnm alqerm wedqe

VERSE 2
Beejh tefet’re kibur adrgeኸgn
Keto yale alama meche met’ahugn [2]
Bene lay selt’no hat’yat kene betu
Meshto yinegabgnal sibazn bekentu

VERSE 3
Set’eኸgn nebere gize lensha
Tinsh adrge enji tilqun amha
Yineqel kelbe yetetebetebew
Ante bicha liyi t’elaten t’leኸw[2]

VERSE 4
Yebegoch eregna cheru Getachen
Yadnewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

VERSE 5
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2)
Kagerem biseded ts’natun at’che
Gebaw teselonqe meqdeshn tiche

VERSE 6
Getaye melsegn egne emelesalew
Liben kante lela leman eset’alew
Aynochem yimelu yets’ets’etn enba
Degmom temelshe wede eqfh ligba[2]

VERSE 7
Yebegoch eregna cheru Getachen
Yednewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

VERSE 8
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2]',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'di-n-zemari-behayilu-tebeje-eregnaye-adis-mezimur-bevidiyo-diacon-zemari'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 1
ህይወት በምድር ላይ ብትሆን ከባድ
ወጥመዷን ማምለጫ ጌታ ለኝ መንገድ
እጠባበቃለውህ ተስፋዬን አጥብቄ
ለዓለም አትተወኝም ኣልቀርም ወድቄ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 2
በእጅህ ተፈጥሬ ክቡር አድርገኸኝ
ከቶ ያለ አላማ መቼ መጣሁኝ [2]
በኔ ላይ ሰልጥኖ ሓጥያት ከነ ቤቱ
መሽቶ ይነጋብኛል ስባዝን በከንቱ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 3
ሰጠኸኝ ነበረ ጊዜ ለንስሓ
ትንሽ ኣድርጌ እንጂ ትልቁን አምሃ
ይነቀል ከልቤ የተተበተበው
አንተ ብቻ ልዪ ጠላቴን ጥለኸው[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 4
የበጎች እረኛ ቸሩ ጌታችን
ያድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 5
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2)
ካገሬም ብሰደድ ጽናቱን አጥቼ
ገባው ተሰሎንቄ መቅደስህን ትቼ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 6
ጌታዬ መልሰኝ እኜ እመለሳለው
ልቤን ካንተ ሌላ ለማን እሰጣለው
ዓይኖቼም ይመሉ የፀፀትን እንባ
ደግሞም ተመልሼ ወደ እቅፍህ ልግባ[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 7
የበጎች እረኛ ቸሩ ጌታችን
የድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 8
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 1
Hiywet bemdr lay bithon kebad
Wet’medwan mamlech’a Geta legn menged
Et’ebabeqalewh tesfayen at’bqe
Lealem attewegnm alqerm wedqe

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 2
Beejh tefet’re kibur adrgeኸgn
Keto yale alama meche met’ahugn [2]
Bene lay selt’no hat’yat kene betu
Meshto yinegabgnal sibazn bekentu

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 3
Set’eኸgn nebere gize lensha
Tinsh adrge enji tilqun amha
Yineqel kelbe yetetebetebew
Ante bicha liyi t’elaten t’leኸw[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 4
Yebegoch eregna cheru Getachen
Yadnewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 5
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2)
Kagerem biseded ts’natun at’che
Gebaw teselonqe meqdeshn tiche

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 6
Getaye melsegn egne emelesalew
Liben kante lela leman eset’alew
Aynochem yimelu yets’ets’etn enba
Degmom temelshe wede eqfh ligba[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 7
Yebegoch eregna cheru Getachen
Yednewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 8
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'di-n-zemari-behayilu-tebeje-eregnaye-adis-mezimur-bevidiyo-diacon-zemari', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dingil Embete Yehiywete Redat (dingil-embete-yehiywete-redat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንግል እመቤቴ የህይወቴ ረዳት
የኑሮዬ ጣዕም ዋልታ መሰረት
እለምንሻለሁ /2/ ፍጹም በረከት

VERSE 1
ትህትናሽ ሲታሰብ ድንግል እመቤቴ
በሰዎች ልቦና ድንግል እመቤቴ
ግርምትን ይፈጥራል /2/ ልብ ይመስጥና

VERSE 2
ጽዮን መጠጊያ ነሽ ድንግል እመቤቴ
የአብርሃም ድንኳን ድንግል እመቤቴ
የታጠረች ተክል /2/ እመብዙሃን

VERSE 3
ከሚካኤል ጋራ ድንግል እመቤቴ
ፈጥነሽ ድረሽልኝ ድንግል እመቤቴ
ቅዱስ ገብርኤል ይምጣ /2/ ክብርሽን ያብስረን

VERSE 4
ከድንግል ጋር ሆነህ ድንግል እመቤቴ
ኡራኤል ፈጥነህ ና ድንግል እመቤቴ
ሩፋኤል ራጉኤል /2/ ንኡ በደመና

VERSE 5
በደማችን ሰርጿል ድንግል እመቤቴ
ፍቅርዋ የማርያም ድንግል እመቤቴ
ምስክር ነን እኛ /2/ እስከ ዘለዓለም

VERSE 6
በአባቶች ፋንታ ድንግል እመቤቴ
ልጆችሽ ስላለን ድንግል እመቤቴ
ስምሽን ለልጅ ልጅ /2/ እንዘክራለን',
      lyrics_transliteration = 'Dingil embeté yehiywete redat
Yenuroyé ta’em walta meseret
Ilemenishalehu (x2) fits’um bereket

VERSE 1
Tihitnash sitaseb dingil embeté
Besewoch libona dingil embeté
Girmtin yifet’ral (x2) lib yimisit’na

VERSE 2
Ts’iyon met’egiya nesh dingil embeté
YeAbrham dink’wan dingil embeté
Yet’atarech tekil (x2) emebzuhan

VERSE 3
KeMikael gara dingil embeté
Fet’nesh dereshlign dingil embeté
Kidus Gebriel yimta (x2) kibirsh yabseren

VERSE 4
Kedingil gar honeh dingil embeté
Urael fet’neh na dingil embeté
Rufael Raguel (x2) nu be-demena

VERSE 5
Bedemachin serṭwal dingil embeté
Fiqirwa yeMaryam dingil embeté
Misikir nen enya (x2) eske zelealem

VERSE 6
Beabatotch fanta dingil embeté
Lijochish silalen dingil embeté
Simish leliji lij (x2) enzekiralen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dingil-embete-yehiywete-redat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል እመቤቴ የህይወቴ ረዳት
የኑሮዬ ጣዕም ዋልታ መሰረት
እለምንሻለሁ /2/ ፍጹም በረከት

VERSE 1
ትህትናሽ ሲታሰብ ድንግል እመቤቴ
በሰዎች ልቦና ድንግል እመቤቴ
ግርምትን ይፈጥራል /2/ ልብ ይመስጥና

CHORUS
ድንግል እመቤቴ የህይወቴ ረዳት
የኑሮዬ ጣዕም ዋልታ መሰረት
እለምንሻለሁ /2/ ፍጹም በረከት

VERSE 2
ጽዮን መጠጊያ ነሽ ድንግል እመቤቴ
የአብርሃም ድንኳን ድንግል እመቤቴ
የታጠረች ተክል /2/ እመብዙሃን

CHORUS
ድንግል እመቤቴ የህይወቴ ረዳት
የኑሮዬ ጣዕም ዋልታ መሰረት
እለምንሻለሁ /2/ ፍጹም በረከት

VERSE 3
ከሚካኤል ጋራ ድንግል እመቤቴ
ፈጥነሽ ድረሽልኝ ድንግል እመቤቴ
ቅዱስ ገብርኤል ይምጣ /2/ ክብርሽን ያብስረን

CHORUS
ድንግል እመቤቴ የህይወቴ ረዳት
የኑሮዬ ጣዕም ዋልታ መሰረት
እለምንሻለሁ /2/ ፍጹም በረከት

VERSE 4
ከድንግል ጋር ሆነህ ድንግል እመቤቴ
ኡራኤል ፈጥነህ ና ድንግል እመቤቴ
ሩፋኤል ራጉኤል /2/ ንኡ በደመና

CHORUS
ድንግል እመቤቴ የህይወቴ ረዳት
የኑሮዬ ጣዕም ዋልታ መሰረት
እለምንሻለሁ /2/ ፍጹም በረከት

VERSE 5
በደማችን ሰርጿል ድንግል እመቤቴ
ፍቅርዋ የማርያም ድንግል እመቤቴ
ምስክር ነን እኛ /2/ እስከ ዘለዓለም

CHORUS
ድንግል እመቤቴ የህይወቴ ረዳት
የኑሮዬ ጣዕም ዋልታ መሰረት
እለምንሻለሁ /2/ ፍጹም በረከት

VERSE 6
በአባቶች ፋንታ ድንግል እመቤቴ
ልጆችሽ ስላለን ድንግል እመቤቴ
ስምሽን ለልጅ ልጅ /2/ እንዘክራለን

CHORUS
ድንግል እመቤቴ የህይወቴ ረዳት
የኑሮዬ ጣዕም ዋልታ መሰረት
እለምንሻለሁ /2/ ፍጹም በረከት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil embeté yehiywete redat
Yenuroyé ta’em walta meseret
Ilemenishalehu (x2) fits’um bereket

VERSE 1
Tihitnash sitaseb dingil embeté
Besewoch libona dingil embeté
Girmtin yifet’ral (x2) lib yimisit’na

CHORUS
Dingil embeté yehiywete redat
Yenuroyé ta’em walta meseret
Ilemenishalehu (x2) fits’um bereket

VERSE 2
Ts’iyon met’egiya nesh dingil embeté
YeAbrham dink’wan dingil embeté
Yet’atarech tekil (x2) emebzuhan

CHORUS
Dingil embeté yehiywete redat
Yenuroyé ta’em walta meseret
Ilemenishalehu (x2) fits’um bereket

VERSE 3
KeMikael gara dingil embeté
Fet’nesh dereshlign dingil embeté
Kidus Gebriel yimta (x2) kibirsh yabseren

CHORUS
Dingil embeté yehiywete redat
Yenuroyé ta’em walta meseret
Ilemenishalehu (x2) fits’um bereket

VERSE 4
Kedingil gar honeh dingil embeté
Urael fet’neh na dingil embeté
Rufael Raguel (x2) nu be-demena

CHORUS
Dingil embeté yehiywete redat
Yenuroyé ta’em walta meseret
Ilemenishalehu (x2) fits’um bereket

VERSE 5
Bedemachin serṭwal dingil embeté
Fiqirwa yeMaryam dingil embeté
Misikir nen enya (x2) eske zelealem

CHORUS
Dingil embeté yehiywete redat
Yenuroyé ta’em walta meseret
Ilemenishalehu (x2) fits’um bereket

VERSE 6
Beabatotch fanta dingil embeté
Lijochish silalen dingil embeté
Simish leliji lij (x2) enzekiralen

CHORUS
Dingil embeté yehiywete redat
Yenuroyé ta’em walta meseret
Ilemenishalehu (x2) fits’um bereket'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dingil-embete-yehiywete-redat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dingil Fetariwan (dingil-fetariwan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/

VERSE 1
ጨነቃት ጠበባት የዳዊት ከተማ
የጌታ መወለድ ታምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

VERSE 2
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

VERSE 3
ሰብአ ሰገል መጡ ከሩቅ ምስራቅ ሀገር
ወርቅ እጣን ከርቤዉን ለርሱ ለመገበር
በእናቱም እቅፍ አገኙት ህፃኑን
ለአለም ተናገሩ ንጉስ መወለዱን

VERSE 4
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

VERSE 5
የይሁዳ ምድር ምስጋናን ተመላ
ንጉስ መጥቷል እና ከናዝሬት ገሊላ
ታምሩን ትናገር ቤተልሄም ታዉራ
ዝማሬ ሲዉጣት ተርስቶ ቆጠራ

VERSE 6
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

VERSE 7
የማይታይ ታየ ተዳሰሰ እንደሰዉ
በጠባቡ ደረት አዳምን መሰለዉ
ገረማት ጥበቡ ታናሿን ሙሽራ
ተዋህዷልና ቃል ከስጋ ጋራ

VERSE 8
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/',
      lyrics_transliteration = 'Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/

VERSE 1
Chenqat tebebat ye-Dawit ketema
Ye-geta meweled tamru si-sema
Wered mel’aku misrach liyawera
Ye-hitsanu kibir be-midir abera

VERSE 2
Yih mistir girum new ketho ye-mayineger
Maryamm be-libwa ti-tebeqew neber /2/

VERSE 3
Seb’a segel metu ke-ruq misraq hager
Worq iṭan kerbeyun le-rsu le-megeber
Be-inatumm iqif agenut hitsanun
Le-alem tenageru nigus meweledun

VERSE 4
Yih mistir girum new ketho ye-mayineger
Maryamm be-libwa ti-tebeqew neber /2/

VERSE 5
Ye-Yihuda midir misganan temela
Nigus met’twal ena ke-Nazret Gelila
Tamrun tinager Betelhem tawura
Zimare siwetat ters’tto qotera

VERSE 6
Yih mistir girum new ketho ye-mayineger
Maryamm be-libwa ti-tebeqew neber /2/

VERSE 7
Ye-mayitay taye tadasese endesew
Be-tebabu deret Adamen mesel’lew
Geramat tibebu tanashwan mushira
Tewahdelna qal ke-siga gara

VERSE 8
Yih mistir girum new ketho ye-mayineger
Maryamm be-libwa ti-tebeqew neber /2/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dingil-fetariwan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/

VERSE 1
ጨነቃት ጠበባት የዳዊት ከተማ
የጌታ መወለድ ታምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/

VERSE 2
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/

VERSE 3
ሰብአ ሰገል መጡ ከሩቅ ምስራቅ ሀገር
ወርቅ እጣን ከርቤዉን ለርሱ ለመገበር
በእናቱም እቅፍ አገኙት ህፃኑን
ለአለም ተናገሩ ንጉስ መወለዱን

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/

VERSE 4
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/

VERSE 5
የይሁዳ ምድር ምስጋናን ተመላ
ንጉስ መጥቷል እና ከናዝሬት ገሊላ
ታምሩን ትናገር ቤተልሄም ታዉራ
ዝማሬ ሲዉጣት ተርስቶ ቆጠራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/

VERSE 6
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/

VERSE 7
የማይታይ ታየ ተዳሰሰ እንደሰዉ
በጠባቡ ደረት አዳምን መሰለዉ
ገረማት ጥበቡ ታናሿን ሙሽራ
ተዋህዷልና ቃል ከስጋ ጋራ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/

VERSE 8
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለእንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደሪያ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/

VERSE 1
Chenqat tebebat ye-Dawit ketema
Ye-geta meweled tamru si-sema
Wered mel’aku misrach liyawera
Ye-hitsanu kibir be-midir abera

CHORUS
Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/

VERSE 2
Yih mistir girum new ketho ye-mayineger
Maryamm be-libwa ti-tebeqew neber /2/

CHORUS
Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/

VERSE 3
Seb’a segel metu ke-ruq misraq hager
Worq iṭan kerbeyun le-rsu le-megeber
Be-inatumm iqif agenut hitsanun
Le-alem tenageru nigus meweledun

CHORUS
Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/

VERSE 4
Yih mistir girum new ketho ye-mayineger
Maryamm be-libwa ti-tebeqew neber /2/

CHORUS
Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/

VERSE 5
Ye-Yihuda midir misganan temela
Nigus met’twal ena ke-Nazret Gelila
Tamrun tinager Betelhem tawura
Zimare siwetat ters’tto qotera

CHORUS
Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/

VERSE 6
Yih mistir girum new ketho ye-mayineger
Maryamm be-libwa ti-tebeqew neber /2/

CHORUS
Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/

VERSE 7
Ye-mayitay taye tadasese endesew
Be-tebabu deret Adamen mesel’lew
Geramat tibebu tanashwan mushira
Tewahdelna qal ke-siga gara

CHORUS
Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/

VERSE 8
Yih mistir girum new ketho ye-mayineger
Maryamm be-libwa ti-tebeqew neber /2/

CHORUS
Dingil fetariwan weledechew
Be-metekeleyam teqeqelelechew
Yelemna sifra le-ingidoch marefiya
Girigim astenyachew be-kebtoch maderiya /2/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dingil-fetariwan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dingil Hoy Wede Ene (dingil-hoy-wede-ene)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንግል ሆይ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
እመቤቴ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
ደካማ ነኝ እኔ ምግባር ይጎድለኛል (2)

VERSE 1
በሥጋዊ ሳይኾን በመንፈስ ዐይኖቼ
ለማየት እሻለኹ ከልቤ ጓጉቼ
ሥራዬ የከፋ መኾኑን አውቃለኹ
ስምሽንም መጥራት እጅግ እፈራለኹ

VERSE 2
ክብርሽ የበዛ ነው ቤዛዊተ ኵሉ
ምሕረት ታሰጫለሽ ላመነብሽ ኹሉ
በአንቺ የተመካ ምንም አያገኘው
የገሃነም እሳት ሲዖልም አይበላው

VERSE 3
የልዑል ማደሪያ የሲና ዕፀ ጳጦስ
አንቺን ላመስግንሽ ከደዌ እንድፈወስ
ፍቀጂልኝ ድንግል ከአንቺ ጋር እንድኖር
ልጅሽን ማልጂልኝ እንዲያበቃኝ ለክብር

VERSE 4
ምንም ተስፋ የለኝ ያላንቺ እናቴ
እመካብሻለኹ እስከ ዕለተ ሞቴ
የምስኪኖች አጽናኝ የጭንቅ ቀን ደራሽ
የልቤ ማረፊያ ምግብ መጠጤ ነሽ

VERSE 5
የጌታዬ እናት ድንግል እመቤቴ
ተወስና ትኑር በአንቺ ዘንድ ሕይወቴ
የትሕትና ምንጭ የፍቅር ውቅያኖስ
ጠጥቼ ልርካብሸ ድንግል እንድቀደስ',
      lyrics_transliteration = 'Dingil hoy wede ene tmechi zend endet yihonal
Emebete wede ene tmechi zend endet yihonal
Dekama negh ene migibar yigodlenyal (×2)

VERSE 1
Besegawi sayihon be menfes aynoche
Lemayet ishalehu kelbe gwaguche
Siraye yekefa mehonun awkalehu
Simishinim metrat ejig eferaleku

VERSE 2
Kibrish yebezza new bezawite kulu
Mihret tasechalesh lamenebish hulu
Be anchi yetemeka minim ayageghew
Ye gehanem isat Siolim ayibelaw

VERSE 3
Ye leul maderiya ye Sina etse Patos
Anchin lamesegnish kedewe endfewes
Fekejilign Dingil ke anchi gar endinor
Lijishin maljilign endiabekagn le kibr

VERSE 4
Minim tesfa yelegh yalanchi enate
Imekabishalehu iske elete mote
Ye miskinotch atsnanghe ye chnq qen derash
Ye libe marefiya migib metete nesh

VERSE 5
Ye Getaye enat Dingil emebete
Tewesna tnur be anchi zend hiywete
Ye tihitna minch ye fikr wqiyanos
Tetche lirkabish Dingil endeqedes',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dingil-hoy-wede-ene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ሆይ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
እመቤቴ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
ደካማ ነኝ እኔ ምግባር ይጎድለኛል (2)

VERSE 1
በሥጋዊ ሳይኾን በመንፈስ ዐይኖቼ
ለማየት እሻለኹ ከልቤ ጓጉቼ
ሥራዬ የከፋ መኾኑን አውቃለኹ
ስምሽንም መጥራት እጅግ እፈራለኹ

CHORUS
ድንግል ሆይ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
እመቤቴ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
ደካማ ነኝ እኔ ምግባር ይጎድለኛል (2)

VERSE 2
ክብርሽ የበዛ ነው ቤዛዊተ ኵሉ
ምሕረት ታሰጫለሽ ላመነብሽ ኹሉ
በአንቺ የተመካ ምንም አያገኘው
የገሃነም እሳት ሲዖልም አይበላው

CHORUS
ድንግል ሆይ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
እመቤቴ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
ደካማ ነኝ እኔ ምግባር ይጎድለኛል (2)

VERSE 3
የልዑል ማደሪያ የሲና ዕፀ ጳጦስ
አንቺን ላመስግንሽ ከደዌ እንድፈወስ
ፍቀጂልኝ ድንግል ከአንቺ ጋር እንድኖር
ልጅሽን ማልጂልኝ እንዲያበቃኝ ለክብር

CHORUS
ድንግል ሆይ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
እመቤቴ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
ደካማ ነኝ እኔ ምግባር ይጎድለኛል (2)

VERSE 4
ምንም ተስፋ የለኝ ያላንቺ እናቴ
እመካብሻለኹ እስከ ዕለተ ሞቴ
የምስኪኖች አጽናኝ የጭንቅ ቀን ደራሽ
የልቤ ማረፊያ ምግብ መጠጤ ነሽ

CHORUS
ድንግል ሆይ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
እመቤቴ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
ደካማ ነኝ እኔ ምግባር ይጎድለኛል (2)

VERSE 5
የጌታዬ እናት ድንግል እመቤቴ
ተወስና ትኑር በአንቺ ዘንድ ሕይወቴ
የትሕትና ምንጭ የፍቅር ውቅያኖስ
ጠጥቼ ልርካብሸ ድንግል እንድቀደስ

CHORUS
ድንግል ሆይ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
እመቤቴ ወደ እኔ ትመጪ ዘንድ እንዴት ይኾናል
ደካማ ነኝ እኔ ምግባር ይጎድለኛል (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil hoy wede ene tmechi zend endet yihonal
Emebete wede ene tmechi zend endet yihonal
Dekama negh ene migibar yigodlenyal (×2)

VERSE 1
Besegawi sayihon be menfes aynoche
Lemayet ishalehu kelbe gwaguche
Siraye yekefa mehonun awkalehu
Simishinim metrat ejig eferaleku

CHORUS
Dingil hoy wede ene tmechi zend endet yihonal
Emebete wede ene tmechi zend endet yihonal
Dekama negh ene migibar yigodlenyal (×2)

VERSE 2
Kibrish yebezza new bezawite kulu
Mihret tasechalesh lamenebish hulu
Be anchi yetemeka minim ayageghew
Ye gehanem isat Siolim ayibelaw

CHORUS
Dingil hoy wede ene tmechi zend endet yihonal
Emebete wede ene tmechi zend endet yihonal
Dekama negh ene migibar yigodlenyal (×2)

VERSE 3
Ye leul maderiya ye Sina etse Patos
Anchin lamesegnish kedewe endfewes
Fekejilign Dingil ke anchi gar endinor
Lijishin maljilign endiabekagn le kibr

CHORUS
Dingil hoy wede ene tmechi zend endet yihonal
Emebete wede ene tmechi zend endet yihonal
Dekama negh ene migibar yigodlenyal (×2)

VERSE 4
Minim tesfa yelegh yalanchi enate
Imekabishalehu iske elete mote
Ye miskinotch atsnanghe ye chnq qen derash
Ye libe marefiya migib metete nesh

CHORUS
Dingil hoy wede ene tmechi zend endet yihonal
Emebete wede ene tmechi zend endet yihonal
Dekama negh ene migibar yigodlenyal (×2)

VERSE 5
Ye Getaye enat Dingil emebete
Tewesna tnur be anchi zend hiywete
Ye tihitna minch ye fikr wqiyanos
Tetche lirkabish Dingil endeqedes

CHORUS
Dingil hoy wede ene tmechi zend endet yihonal
Emebete wede ene tmechi zend endet yihonal
Dekama negh ene migibar yigodlenyal (×2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dingil-hoy-wede-ene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dingl Enate Ney (dingl-enate-ney)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 1
በሀዘን በሰቆቃ ጉልበቴ ደቆ
በረከት አልባ ሆኜ እንዳልከፋ
ድረሽልኝ እናቴ ነይ የእኔ ተስፋ
ብቸኝነት ክፉ ነው አንገት ያስደፋል

VERSE 2
ጭንቀትን አባብሶ ለክፉ ይሰጣል
አንቺ ከጎኔ ካለሽ አልሸነፍም
ለዚህ ዓለም ሞኝነት እጄን አልሰጥም
እንኳን ለደካማው ሰው ለእኔ ለባሪያሽ

VERSE 3
ለዓለም ይተርፋል ፀሎት ልመናሽ
በዚያ በፍርድ ሰዓት ጥላ ሁኚኝ
ክፉ ግብሬን መዝኖ እንዳያቀለኝ
እረፍዶብኛል ጉዞው የሠርጉ ቤት

VERSE 4
ሙሽራው ሊገባ ነው ሳልይዝ መብራት
አፍጥኚኝ እናት ዓለም ለመልካም ሥራ
የእሳት ሲሳይ እንዳልሆን ድንግል አደራ',
      lyrics_transliteration = 'Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 1
Behezen beseqoqa gulbete deqo
Bereket alba hogne endalkefa
Direshlgn enate ney yeene tesfa
Bichegnnet kifu new anget yasdefal

VERSE 2
Ch’nqetn ababso lekfu yiset’al
Anchi kegone kalesh alshenefm
Lezih alem mognnet ejen alset’m
Enkwan ledekamaw sew leene lebariyash

VERSE 3
Lealem yiterfal ts’elot limenash
Beziya befrd seat t’la hugnign
Kifu gibren mezno endayaqelegn
Erefdobgnal guzow yesergu bet

VERSE 4
Mushraw ligeba new salyz mebrat
Aft’gnign enat alem lemelkam sira
Yeesat sisay endalhon Dingil adera',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dingl-enate-ney'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 1
በሀዘን በሰቆቃ ጉልበቴ ደቆ
በረከት አልባ ሆኜ እንዳልከፋ
ድረሽልኝ እናቴ ነይ የእኔ ተስፋ
ብቸኝነት ክፉ ነው አንገት ያስደፋል

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 2
ጭንቀትን አባብሶ ለክፉ ይሰጣል
አንቺ ከጎኔ ካለሽ አልሸነፍም
ለዚህ ዓለም ሞኝነት እጄን አልሰጥም
እንኳን ለደካማው ሰው ለእኔ ለባሪያሽ

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 3
ለዓለም ይተርፋል ፀሎት ልመናሽ
በዚያ በፍርድ ሰዓት ጥላ ሁኚኝ
ክፉ ግብሬን መዝኖ እንዳያቀለኝ
እረፍዶብኛል ጉዞው የሠርጉ ቤት

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 4
ሙሽራው ሊገባ ነው ሳልይዝ መብራት
አፍጥኚኝ እናት ዓለም ለመልካም ሥራ
የእሳት ሲሳይ እንዳልሆን ድንግል አደራ

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 1
Behezen beseqoqa gulbete deqo
Bereket alba hogne endalkefa
Direshlgn enate ney yeene tesfa
Bichegnnet kifu new anget yasdefal

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 2
Ch’nqetn ababso lekfu yiset’al
Anchi kegone kalesh alshenefm
Lezih alem mognnet ejen alset’m
Enkwan ledekamaw sew leene lebariyash

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 3
Lealem yiterfal ts’elot limenash
Beziya befrd seat t’la hugnign
Kifu gibren mezno endayaqelegn
Erefdobgnal guzow yesergu bet

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 4
Mushraw ligeba new salyz mebrat
Aft’gnign enat alem lemelkam sira
Yeesat sisay endalhon Dingil adera

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dingl-enate-ney', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dinigil Fetariwan Weledechiw (dinigil-fetariwan-weledechiw)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = '''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 1
''''''''ጨነቃት ጠበባት የዳዊት ከተማ''''''''''''
የጌታ መወለድ ተአምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

VERSE 2
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)
''''''''''ሰብዐ ሰገል መጡ ከሩቅ ምስራቅ አገር''''''''
ወርቅ ዕጣን ከርቤውን ለርሱ ለመገበር

VERSE 3
በእናቱም እቅፍ አገኙት ህፃኑን
ለዓለም ተናገሩ ንጉሥ መወለዱን
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)

VERSE 4
''''''''''የይሁዳ ምድር ምስጋና ተመላ''''''''''
ንጉሥ መጥቷልና ከናዝሬት ገሊላ
ተአምሩን ትናገር ቤተልሔም ታውራ
ዝማሬ ሲውጣት ተረስቶ ቆጠራ

VERSE 5
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)
''''''''''''የማይታይ ታየ ተዳሰሰ አንደ ሰው''''''''''''
በጠባቡ ደረት ዓለምን ወሰነው

VERSE 6
ገረማት ጥበቡ ታናሿን ሙሽራ
ተዋህዷልና ቃል ከሥጋ ጋራ
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር''''''',
      lyrics_transliteration = '''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 1
''''''''ch’eneqat t’ebebat yedawit ketema''''''''''''
Yegeta meweled teamru sisema
Werede melaku misrach liyawera
Yehts’anu kibir bemdr abera

VERSE 2
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)
''''''''''seba segel met’u keruq misraq ager''''''''
Werq et’an kerbewn lersu lemegeber

VERSE 3
Beenatum eqf agegnut hits’anun
Lealem tenageru nigus meweledun
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

VERSE 4
''''''''''yeyhuda midr misgana temela''''''''''
Nigus met’twalna kenazret gelila
Teamrun tinager betelhem tawra
Zimare siwt’at teresto qot’era

VERSE 5
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)
''''''''''''yemaytay taye tedasese ande sew''''''''''''
Bet’ebabu deret alemn wesenew

VERSE 6
Geremat t’bebu tanashwan mushra
Tewahdwalna qal kesga gara
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber''''''',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dinigil-fetariwan-weledechiw'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dinigil-fetariwan-weledechiw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dinigil Fetariwan Weledechiw (dinigil-fetariwan-weledechiw-628)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊአ
ግርግም አስተኛችው በከብቶች ማደርያ /2/

VERSE 1
ጨነቃት ጠበባት የዳዊት ከተማ
የጌታ መወለድ ታምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

VERSE 2
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

VERSE 3
ሰብአ ሰገል መጡ ከሩቅ ምስራቅ ሀገር
ወርቅ እጣን ከርቤዉን ለርሱ ለመገበር
በእናቱም እቅፍ አገኙት ህፃኑን
ላለም ተናገሩ ንጉስ መወለዱን

VERSE 4
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

VERSE 5
የይሁዳ ምድር ምስጋና ተመላ
ንጉስ መታልና ከናዝሬት ገሊላ
ታምሩን ትናገር ቤተልሄም ታዉራ
ዝማሬ ሲወጣ ከርስቱ ቆጠራ

VERSE 6
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/

VERSE 7
የማይታይ ታየ ተዳሰሰ አንደ ሰዉ
በጠባቡ ደረት አዳምን መሰለዉ
ገረማት ጥበቡ ታናሹአን ሙሽራ
ተዋህዳልና ቃል ከ ስጋ ጋራ

VERSE 8
ይህ ሚስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር /2/',
      lyrics_transliteration = 'Dingil fet’ariwan weledechw
Bemet’eqleyam t’eqeqelelechw
Yelemna sifra lengdoch marefia
Girgm astegnachw bekebtoch maderya (2)

VERSE 1
Ch’eneqat t’ebebat yedawit ketema
Yegeta meweled tamru sisema
Werede melaku misrach liyawera
Yehts’anu kibir bemdr abera

VERSE 2
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

VERSE 3
Seba segel met’u keruq misraq heger
Werq et’an kerbewun lersu lemegeber
Beenatum eqf agegnut hits’anun
Lalem tenageru nigus meweledun

VERSE 4
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

VERSE 5
Yeyhuda midr misgana temela
Nigus metalna kenazret gelila
Tamrun tinager betelhem tawura
Zimare siwet’a kerstu qot’era

VERSE 6
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

VERSE 7
Yemaytay taye tedasese ande sewu
Bet’ebabu deret adamn meselewu
Geremat t’bebu tanashuan mushra
Tewahdalna qal ke siga gara

VERSE 8
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dinigil-fetariwan-weledechiw-628'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dinigil-fetariwan-weledechiw-628', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dinigil Hoy Sile Anichi Newina (dinigil-hoy-sile-anichi-newina)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 1
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ታውቆኛል ጥፋቴ ብዙ እንደበደልኩኝ
ትእዛዙን እንደሻርኩ ህጉን እንደጣስኩኝ

VERSE 2
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
በፊቱ እንዳላፍር የተጠራሁ ለታ
እለምነዋለሁ ከአሁኑ ይቅርታ

VERSE 3
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
አንተ ክቡር መልአክ ልደቱን አብሣሪ
አማልደኝ ከጌታዬ ከፈጣሪ

VERSE 4
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ፃድቃን ሰማእታት እናንተም ሁላችሁ
አማልዱኝ ከአምላኬ ከአምላካችሁ

VERSE 5
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ',
      lyrics_transliteration = 'Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 1
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Tawqognal t’fate bizu endebedelkugn
Tiezazun endesharku higun endet’askugn

VERSE 2
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Befitu endalafr yetet’erahu leta
Elemnewalehu keahunu yiqrta

VERSE 3
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Ante kibur melak lidetun absari
Amaldegn kegetaye kefet’ari

VERSE 4
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Ts’adqan semaetat enantem hulachhu
Amaldugn keamlake keamlakachhu

VERSE 5
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dinigil-hoy-sile-anichi-newina'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dinigil-hoy-sile-anichi-newina', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dinigil Hoy Wede Ene Timechi Zenid (dinigil-hoy-wede-ene-timechi-zenid-2895)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 1
ፈጥነሽ ስትመጪ ድምፅሽ የተሰማ
የኤልሳቤጥ ዘመድ የዘካርያስ
ድምፅሽን አሰሚኝ ባንቺ ልቀደስ
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል

VERSE 2
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
በማዕፀንሽ ይዘሽ የሰማይ እንግዳ
እንዴት ትመጫለሽ በታናሹዋ ጉዋዳ

VERSE 3
እንዴት ልቀበልሽ አምላኬን ይዘሽ
መንፈስ ቤቴ ሞላ ሲሰማ ድምፅሽ
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል

VERSE 4
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ከስጋዊ ሳይሆን በመንፈስ ዓይኖቼ
ለማየት እሻለው ከልቤ ጉዋጉቼ
ስራዬ የከፋ መሆኑን አውቃለው

VERSE 5
ድምፅሽን ለመስማት እጅግ እፈራለሁ
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x

VERSE 6
አንቺ ቡሩክት ነሽ ቡሩክ ያንቺ ፍሬ
ላመንሽዋ ብፅዕት ትዘምር ከንፈሬ
ፅንሱን ደስ አሰኘ የድምፅሽ ሰላምታ
ለዚህ ታላቅ ነገር ይገባል እልልታ

VERSE 7
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
በሁሉ የሞላ ዙፋኑ ያረገሽ

VERSE 8
የመላዕክት መዝሙር ተሰማ በሆድሽ
ሁለተኛ ሰማይ ድንግል ማርያም
ባንቺ ድንቅ አድርጉዋል መድሀኔዓለም
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል

VERSE 9
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x',
      lyrics_transliteration = 'Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 1
Fet’nesh sitmech’i dimts’sh yetesema
Yeelsabet’ zemed yezekaryas
Dimts’shn asemign banchi liqedes
Dingil hoy wedeene timech’i zend endet yihonal

VERSE 2
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Bemaets’ensh yizesh yesemay engda
Endet timech’alesh betanashuwa guwada

VERSE 3
Endet liqebelsh amlaken yizesh
Menfes bete mola sisema dimts’sh
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal

VERSE 4
Dekama negn ene migbar yigolegnal 2x
Kesgawi sayhon bemenfes aynoche
Lemayet eshalew kelbe guwaguche
Siraye yekefa mehonun awqalew

VERSE 5
Dimts’shn lemesmat ejg eferalehu
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x

VERSE 6
Anchi burukt nesh buruk yanchi fire
Lamenshwa bits’et tizemr kenfere
Ts’nsun des asegne yedmts’sh selamta
Lezih talaq neger yigebal ellta

VERSE 7
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Behulu yemola zufanu yaregesh

VERSE 8
Yemelaekt mezmur tesema behodsh
Huletegna semay Dingil Maryam
Banchi dinq adrguwal medhenealem
Dingil hoy wedeene timech’i zend endet yihonal

VERSE 9
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dinigil-hoy-wede-ene-timechi-zenid-2895'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 1
ፈጥነሽ ስትመጪ ድምፅሽ የተሰማ
የኤልሳቤጥ ዘመድ የዘካርያስ
ድምፅሽን አሰሚኝ ባንቺ ልቀደስ
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል

CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 2
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
በማዕፀንሽ ይዘሽ የሰማይ እንግዳ
እንዴት ትመጫለሽ በታናሹዋ ጉዋዳ

CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 3
እንዴት ልቀበልሽ አምላኬን ይዘሽ
መንፈስ ቤቴ ሞላ ሲሰማ ድምፅሽ
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል

CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 4
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ከስጋዊ ሳይሆን በመንፈስ ዓይኖቼ
ለማየት እሻለው ከልቤ ጉዋጉቼ
ስራዬ የከፋ መሆኑን አውቃለው

CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 5
ድምፅሽን ለመስማት እጅግ እፈራለሁ
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x

CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 6
አንቺ ቡሩክት ነሽ ቡሩክ ያንቺ ፍሬ
ላመንሽዋ ብፅዕት ትዘምር ከንፈሬ
ፅንሱን ደስ አሰኘ የድምፅሽ ሰላምታ
ለዚህ ታላቅ ነገር ይገባል እልልታ

CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 7
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
በሁሉ የሞላ ዙፋኑ ያረገሽ

CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 8
የመላዕክት መዝሙር ተሰማ በሆድሽ
ሁለተኛ ሰማይ ድንግል ማርያም
ባንቺ ድንቅ አድርጉዋል መድሀኔዓለም
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል

CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ

VERSE 9
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x

CHORUS
ድንግል ሆይ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
እመቤቴ ወደእኔ ትመጪ ዘንድ እንዴት ይሆናል
ደካማ ነኝ እኔ ምግባር ይጎለኛል 2x
ወደተራራማ ይሁዳ ከተማ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 1
Fet’nesh sitmech’i dimts’sh yetesema
Yeelsabet’ zemed yezekaryas
Dimts’shn asemign banchi liqedes
Dingil hoy wedeene timech’i zend endet yihonal

CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 2
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Bemaets’ensh yizesh yesemay engda
Endet timech’alesh betanashuwa guwada

CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 3
Endet liqebelsh amlaken yizesh
Menfes bete mola sisema dimts’sh
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal

CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 4
Dekama negn ene migbar yigolegnal 2x
Kesgawi sayhon bemenfes aynoche
Lemayet eshalew kelbe guwaguche
Siraye yekefa mehonun awqalew

CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 5
Dimts’shn lemesmat ejg eferalehu
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x

CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 6
Anchi burukt nesh buruk yanchi fire
Lamenshwa bits’et tizemr kenfere
Ts’nsun des asegne yedmts’sh selamta
Lezih talaq neger yigebal ellta

CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 7
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Behulu yemola zufanu yaregesh

CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 8
Yemelaekt mezmur tesema behodsh
Huletegna semay Dingil Maryam
Banchi dinq adrguwal medhenealem
Dingil hoy wedeene timech’i zend endet yihonal

CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema

VERSE 9
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x

CHORUS
Dingil hoy wedeene timech’i zend endet yihonal
Emebete wedeene timech’i zend endet yihonal
Dekama negn ene migbar yigolegnal 2x
Wedeterarama yihuda ketema'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dinigil-hoy-wede-ene-timechi-zenid-2895', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dinigil Kewededishign (dinigil-kewededishign)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አፍቅርኒ እንበለ ንትጋ
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ
ፍቅርሽን በልቤ - ላይ አሳድሮታል

VERSE 1
ማርያም ጣዕምሽን - በአፌ አኑሮታል
አንቺ ከወደድሽኝ - ልጅሽ ይወደኛል
ልጅሽ ከወደደኝ - ማን ይቃወመኛል(፪)
በኪዳንሽ ታምና - ነፍሴ አንቺን ትሻለች

VERSE 2
ሲመሽም ሲነጋ - ማርያም ትላለች
ባ''ንደበቴ አኑሮት - ልጅሽ ጣዕምሽን
ዘውትር እጠራለሁ - ማርያም ስምሽን
ከጌታ አስታረቅሽኝ - ካ''ምላክ አማለድሽኝ

VERSE 3
በደሌን ሳታዪ - እናቴ ወደድሽኝ
ምልጃሽ እያገዘኝ - ቆሜ ታየሁ ዛሬን
ሙሉ ሰው አ''ርገሽኝ - አፈለኩ ዝማሬን
ከፊትሽ ሞገስን - እንዳገኝ አድርጊኝ

VERSE 4
ዘላለም በምግባር - በሃይማኖት አትጊኝ
ልቤ እያፈለቀ - ውዳሴ ምስጋና
ድንግል ሆይ! ለክብርሽ - እቀኛለሁ ገና
መዳንና ሰላም - ለቤቴ የሆነው

VERSE 5
ኪዳነ ምሕረት - ጽዮን በምልጃሽ ነው
ጓዳዬን ጎብኝተሽ - ሰፈነ በረከት
ረድኤት ያስገኛል - ወዳ''ንቺ መመልከት።
አፍቅርኒ እንበለ ንትጋ

VERSE 6
ለብእሴ ደም ወሥጋ
ዘየዐቢ እምዝ ኢየኀሥሥ ጸጋ',
      lyrics_transliteration = 'Afqrni enbele nitga
Lebese dem wesga
Zeyeabi emz iyehess ts’ega
Fiqrshn belbe - lay asadrotal

VERSE 1
Maryam t’aemshn - beafe anurotal
Anchi kewededshgn - lijsh yiwedegnal
Lijsh kewededegn - man yiqawemegnal (2)
Bekidansh tamna - nefse anchin tishalech

VERSE 2
Simeshm sinega - Maryam tilalech
Ba''nidebete anurot - lijsh t’aemshn
Zewtr et’eralehu - Maryam simshn
Kegeta astareqshgn - ka''milak amaledshgn

VERSE 3
Bedelen satayi - enate wededshgn
Miljash eyagezegn - qome tayehu zaren
Mulu sew a''rigeshgn - afeleku zimaren
Kefitsh mogesn - endagegn adrgign

VERSE 4
Zelalem bemgbar - behaymanot atgign
Libe eyafeleqe - widase misgana
Dingil hoy! lekbrsh - eqegnalehu gena
Medanna selam - lebete yehonew

VERSE 5
Kidane mihret - ts’yon bemljash new
Gwadayen gobgntesh - sefene bereket
Redet yasgegnal - weda''nichi memelket.
Afqrni enbele nitga

VERSE 6
Lebese dem wesga
Zeyeabi emz iyehess ts’ega',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dinigil-kewededishign'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dinigil-kewededishign', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dinik Adirigolignal (dinik-adirigolignal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 1
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ
ድንቅ አድርጎልኛል በዳግም ምጻቱ

VERSE 2
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ
አ.ዝ
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ

VERSE 3
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

VERSE 4
አ.ዝ
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል

VERSE 5
ድንቅ አድርጎልኛል እያሉ ሲሉኝ
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ',
      lyrics_transliteration = 'Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 1
Dinq adrgolgnal wedebetu t’eragn
Dinq adrgolgnal rekshe salehu
Dinq adrgolgnal lije hoy na alegn
Dinq adrgolgnal bedagm mits’atu

VERSE 2
Dinq adrgolgnal mengstun liyawersegn
A.z
Dinq adrgolgnal keanbesa mengaga
Dinq adrgolgnal kegudgwad awet’agn

VERSE 3
Dinq adrgolgnal bet’elatoche fit
Dinq adrgolgnal girma moges set’egn
Dinq adrgolgnal min emelsalehu
Dinq adrgolgnal endi lewededegn

VERSE 4
A.z
Dinq adrgolgnal t’elatoche hulu
Dinq adrgolgnal sigwadedubgn
Dinq adrgolgnal man yidersletal

VERSE 5
Dinq adrgolgnal eyalu silugn
Dinq adrgolgnal fet’neh deresklgn
Dinq adrgolgnal kemot adankegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dinik-adirigolignal'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dinik-adirigolignal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dinik Yeabiy Tsom Mezimur (dinik-yeabiy-tsom-mezimur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 1
ቀን እና ለሊት ከኔ አይርቅም
ድምጸ አራዊት የለሊት ግርማ
ወደኔ አይቀርብም ድምጽህ ሲሰማ

VERSE 2
መሰናክልን ለእግሮቼ አይሰጥም
ይሰውረኛል በቀኙ ሰላም
ፀሐይም በቀን አይተኩሰኝም
የአጋንንትም ሀይል አያስፈራኝም

VERSE 3
ነፍሴን ጠበቃት ከጠላት ወጥመድ
ጌታዬ መራኝ በጽድቅ መንገድ
መውጣት መግባቴን እየጠበቀ
ለዚህ አበቃኝ እርሱ ባወቀ

VERSE 4
የሰማዩን ጠል እታገሳለው
ሰው ከጨከነ ምን እሆናለው
ለሊት በድብቅ ለሚጎበኙኝ
ለጻድቃኑ ክብር አምላክ ይስጥልኝ

VERSE 5
እንቅልፌን ባርኮ ለሰጠኝ የጌታ
በአለም ሀሳብ ሳልንገላታ
የእለት ምግቤንም ላልነሳኝ ፍጹም
ምስጋና ላቅርብ እስከ ዘለዓለም',
      lyrics_transliteration = 'Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 1
Qen ena lelit kene ayrqm
Dimts’e arawit yelelit girma
Wedene ayqerbm dimts’h sisema

VERSE 2
Mesenakln leegroche ayset’m
Yisewregnal beqegnu selam
Ts’eheym beqen aytekusegnm
Yeaganntm heyl ayasferagnm

VERSE 3
Nefsen t’ebeqat ket’elat wet’med
Getaye meragn bets’dq menged
Mewt’at megbaten eyet’ebeqe
Lezih abeqagn ersu baweqe

VERSE 4
Yesemayun t’el etagesalew
Sew kech’ekene min ehonalew
Lelit bedbq lemigobegnugn
Lets’adqanu kibir amlak yist’lgn

VERSE 5
Enqlfen barko leset’egn yegeta
Bealem hesab salngelata
Yeelet migbenm lalnesagn fits’um
Misgana laqrb eske zelealem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dinik-yeabiy-tsom-mezimur'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dinik-yeabiy-tsom-mezimur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Dink Adirgolignyal (dink-adirgolignyal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 1
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ

VERSE 2
ድንቅ አድርጎልኛል በዳግም ምጻቱ
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ

VERSE 3
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 4
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ

VERSE 5
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

VERSE 6
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)

VERSE 7
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል
ድንቅ አድርጎልኛል እያሉ ሲሉኝ

VERSE 8
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ

VERSE 9
ድንቅ አድርጎልኛል
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)',
      lyrics_transliteration = 'Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 1
Dink adirgolignyal bedelen sayqot’ir
Dink adirgolignyal wedebetu t’erat’agn
Dink adirgolignyal rek’she salehu

VERSE 2
Dink adirgolignyal lijé hoy na alegn
Dink adirgolignyal bedagim mits’atu
Dink adirgolignyal mengistun liyawirsagn

VERSE 3
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 4
Dink adirgolignyal keanbesa mengagga
Dink adirgolignyal kegudgwad awet’agn
Dink adirgolignyal bet’elateche fit

VERSE 5
Dink adirgolignyal girma moges set’egn
Dink adirgolignyal min emelsalew
Dink adirgolignyal indi lewededegn

VERSE 6
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)

VERSE 7
Dink adirgolignyal t’elateche hulu
Dink adirgolignyal siguadedubegn
Dink adirgolignyal man yidersletal

VERSE 8
Dink adirgolignyal eyalu silugn
Dink adirgolignyal fet’neh deresklign
Dink adirgolignyal kemot adanekegn

VERSE 9
Dink adirgolignyal
Dink adirgolignyal yeserawit geta (x2)
Alresagnim Amlak anesagn ketibiya (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'dink-adirgolignyal'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'dink-adirgolignyal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Diwiy Nen (diwiy-nen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድውይ ነን አንተ አድነን
መፃጉን የፈወስክ በልዩ ሥልጣንህ (፪)

VERSE 1
የሥጋ በሽታ በአንተ እንደተረታ (፪)
እኛም ተይዘናል በነፍስ በሽታ
አድነን የሠራዊት ጌታ (፪)',
      lyrics_transliteration = 'Diwiy negn ante adenen
Metsagun yefewesk beleu seltanih (2)

VERSE 1
Yesga besheta bante endetereta (2)
Egnam teyezenal benefs besheta
Adenen yeserawit geta (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'diwiy-nen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድውይ ነን አንተ አድነን
መፃጉን የፈወስክ በልዩ ሥልጣንህ (፪)

VERSE 1
የሥጋ በሽታ በአንተ እንደተረታ (፪)
እኛም ተይዘናል በነፍስ በሽታ
አድነን የሠራዊት ጌታ (፪)

CHORUS
ድውይ ነን አንተ አድነን
መፃጉን የፈወስክ በልዩ ሥልጣንህ (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Diwiy negn ante adenen
Metsagun yefewesk beleu seltanih (2)

VERSE 1
Yesga besheta bante endetereta (2)
Egnam teyezenal benefs besheta
Adenen yeserawit geta (2)

CHORUS
Diwiy negn ante adenen
Metsagun yefewesk beleu seltanih (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'diwiy-nen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Diyakon (diyakon)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 1
የልቤን ጥማት ተካህ በሙላት
ላክብር ስምህን ላውራ ዝናህን
ሞገስ ግርማዬ ሀር ሸማዬ
አፍሯል ከሳሼ አንተን ለብሼ

VERSE 2
ተባረክ ውዴ እውነት መንገዴ
ልውጣ ማልጄ ተከፍቶ ደጄ
ወደ ናፍቆቴ አቅንቷል ፊቴ
ድካሜን ጥዬ እልፍ ብዬ

VERSE 3
አግኝቼሀለው መች እለቅሀለው
ተባረክ ውዴ እውነት መንገዴ
ዘውዴን ላንሳልህ እጅ እንድነሳ
ክብርስ ላንተ ነው ሞቴን ለሞትከው

VERSE 4
አልደራደር ባንተማ ነገር
ብኖር ብሞትም አንተን አልክድም
ተባረክ ውዴ እውነት መንገዴ
ብቆም ሰገነት በቤተመንግስት

VERSE 5
አለቴ አንተ ነህ የምመካብህ
የነብሴን አውታር ቃኝተህ በፍቅር
ባታሰልፈኝ ማን ያስታውሰኝ',
      lyrics_transliteration = 'Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 1
Yelben t’mat tekah bemulat
Lakbr simhn lawra zinahn
Moges girmaye her shemaye
Afrwal kesashe anten lebshe

VERSE 2
Tebarek wide ewnet mengede
Liwt’a malje tekefto deje
Wede nafqote aqntwal fite
Dikamen t’ye elf biye

VERSE 3
Aggnchehelew mech eleqhelew
Tebarek wide ewnet mengede
Zewden lansalh ej endnesa
Kibrs lante new moten lemotkew

VERSE 4
Alderader bantema neger
Binor bimotm anten alkdm
Tebarek wide ewnet mengede
Biqom segenet bebetemengst

VERSE 5
Alete ante neh yemmekabh
Yenebsen awtar qagnteh befqr
Bataselfegn man yastawsegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'diyakon'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 1
የልቤን ጥማት ተካህ በሙላት
ላክብር ስምህን ላውራ ዝናህን
ሞገስ ግርማዬ ሀር ሸማዬ
አፍሯል ከሳሼ አንተን ለብሼ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 2
ተባረክ ውዴ እውነት መንገዴ
ልውጣ ማልጄ ተከፍቶ ደጄ
ወደ ናፍቆቴ አቅንቷል ፊቴ
ድካሜን ጥዬ እልፍ ብዬ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 3
አግኝቼሀለው መች እለቅሀለው
ተባረክ ውዴ እውነት መንገዴ
ዘውዴን ላንሳልህ እጅ እንድነሳ
ክብርስ ላንተ ነው ሞቴን ለሞትከው

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 4
አልደራደር ባንተማ ነገር
ብኖር ብሞትም አንተን አልክድም
ተባረክ ውዴ እውነት መንገዴ
ብቆም ሰገነት በቤተመንግስት

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 5
አለቴ አንተ ነህ የምመካብህ
የነብሴን አውታር ቃኝተህ በፍቅር
ባታሰልፈኝ ማን ያስታውሰኝ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 1
Yelben t’mat tekah bemulat
Lakbr simhn lawra zinahn
Moges girmaye her shemaye
Afrwal kesashe anten lebshe

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 2
Tebarek wide ewnet mengede
Liwt’a malje tekefto deje
Wede nafqote aqntwal fite
Dikamen t’ye elf biye

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 3
Aggnchehelew mech eleqhelew
Tebarek wide ewnet mengede
Zewden lansalh ej endnesa
Kibrs lante new moten lemotkew

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 4
Alderader bantema neger
Binor bimotm anten alkdm
Tebarek wide ewnet mengede
Biqom segenet bebetemengst

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 5
Alete ante neh yemmekabh
Yenebsen awtar qagnteh befqr
Bataselfegn man yastawsegn

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'diyakon', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Done for me (done-for-me)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 1
Suffering through the marsh that took me under it
When I had thought I lost the ones supporting me
He truly stowed away my troubles endlessly
Our Lord and our strength our glory and power

VERSE 2
Humiliated them with faith my wrongdoers
That you won’t forsake me finally I know truth
Above worldly calling I’ve committed to you
Few became abundant You fed the multitudes

VERSE 3
To show my gratitude enough I can’t give you
Through the days and the nights, the one that shines the light
Glorious it all is your works and all Your might
Deserving you are for praise and admiration

VERSE 4
For the humble of heart blessings, you have given
Impoverished I am not you are my fortune
My life is filled by you never again barren',
      lyrics_transliteration = 'Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 1
Suffering through the marsh that took me under it
When I had thought I lost the ones supporting me
He truly stowed away my troubles endlessly
Our Lord and our strength our glory and power

VERSE 2
Humiliated them with faith my wrongdoers
That you won’t forsake me finally I know truth
Above worldly calling I’ve committed to you
Few became abundant You fed the multitudes

VERSE 3
To show my gratitude enough I can’t give you
Through the days and the nights, the one that shines the light
Glorious it all is your works and all Your might
Deserving you are for praise and admiration

VERSE 4
For the humble of heart blessings, you have given
Impoverished I am not you are my fortune
My life is filled by you never again barren',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'done-for-me'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 1
Suffering through the marsh that took me under it
When I had thought I lost the ones supporting me
He truly stowed away my troubles endlessly
Our Lord and our strength our glory and power

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 2
Humiliated them with faith my wrongdoers
That you won’t forsake me finally I know truth
Above worldly calling I’ve committed to you
Few became abundant You fed the multitudes

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 3
To show my gratitude enough I can’t give you
Through the days and the nights, the one that shines the light
Glorious it all is your works and all Your might
Deserving you are for praise and admiration

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 4
For the humble of heart blessings, you have given
Impoverished I am not you are my fortune
My life is filled by you never again barren

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 1
Suffering through the marsh that took me under it
When I had thought I lost the ones supporting me
He truly stowed away my troubles endlessly
Our Lord and our strength our glory and power

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 2
Humiliated them with faith my wrongdoers
That you won’t forsake me finally I know truth
Above worldly calling I’ve committed to you
Few became abundant You fed the multitudes

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 3
To show my gratitude enough I can’t give you
Through the days and the nights, the one that shines the light
Glorious it all is your works and all Your might
Deserving you are for praise and admiration

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness

VERSE 4
For the humble of heart blessings, you have given
Impoverished I am not you are my fortune
My life is filled by you never again barren

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/
The day that became night drowned by the darkness'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'done-for-me', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ebakeh Wedet Neh (ebakeh-wedet-neh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 1
ይልሃል እግዚአብሔር እባክህ ወዴት ነህ

VERSE 2
ከዓለም ጉያ ውስጥ ሽብር ከተሞላው
ከስንጥቅ አለቶች ጎድጓዳ ከሆነው
የአራዊቱ ግርማ የአንበሶቹ ግሳት
የጨለማው ክብደት የፍጥረት ማዛጋት

VERSE 3
ከእንዲህ ያለ ስፍራ ተወርውረህ ነወይ
ቀናት ተቆጠሩ አይኖችህን ሳላይ

VERSE 4
ከቅዳሴ የወጣ ምስጋና ስቀበል
ጎላ ያለው ድምጽህ ተሰውሮብኛል

VERSE 5
በቅድስቱ በኩል በምትቆምበት በቅዳሴ ጊዜ
አይኖቼ ስላጡ ፈልገው ፈልገው ይዞኛል ትካዜ

VERSE 6
ልጄ ምን በደልኩህ ምን አጎደልኩብህ
ትተኸኝ የሄድከው እንደዛ ስወድህ

VERSE 7
ዘወትር ፊትህን ሳየው ደስ እያለኝ
ደስታዬን በሀዘን ምነው ለወጥክብኝ',
      lyrics_transliteration = 'Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 1
Yilhál Egziabher ebakeh wedet neh

VERSE 2
Ke’alam guya wist shibir ketemolaw
Kesinit’ik aletotch godgwada kehonaw
Ye’arawitu girma ye’anbesoch gisat
Yechelemáw kibdet yefit’ret mazagat

VERSE 3
Ke’endih yale sifra tewerweréh newey
Qenat teqot’aru aynochih salay

VERSE 4
Keqiddase yeweta misgana siqebel
Gola yalew dimtsih tesewrobnial

VERSE 5
Beqiddistu bekul bemit’qomibet beqiddase gize
Aynoché silatu felgew felgew yizognal tikazé

VERSE 6
Lijé min bedelkuh min agodelkubeh
Titehény yehedkew endezá siwedéh

VERSE 7
Zawitir fitih sayew des eyalégn
Destayen behazen menew lewet’kebign',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ebakeh-wedet-neh'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ebakeh-wedet-neh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ~ Eftn Aleku ~ By Zemari Henok Fikadu~ Eritrean Orthodox Tewahdo Mezmur (eftn-aleku-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥

VERSE 1
ማርቆስ 𝟏𝟎:𝟒𝟔𝟓𝟐
1st may
ወዲ ዳዊት ጎዪታይ "ስምዓኒ ''ሞ" ሓንሳብ ከዕልለካ ንድምጸይ ጽን በሎ “መልሰለይ”
ሰሪ ዝ ድፉን ልቦናይ፥ ከመይ ኢለ ክሪኦ ''ቲ ትህቦ ፍቅሪ ቑልሕ በል ጸውዓኒ

VERSE 2
ውሉደይ ! እንታይ ኢኻ ትደሊ፡ እንታይ ክገብረልካ
ማርቆስ 10፥51
ኣምላከይ ! ብ ዕውርቲ ልበይ፡ ክርኢ ምድሓንካ
ማርቆስ 10፥51

VERSE 3
እመን እሞ፡ እቲ ዘድልየካ፡ ኩሉ ክገብረልካ
ማርቆስ 10፥52
ኣነ ኢየ፡ ''ቲ ኩሉ ዝኽእል ወሃቢ ኣምላኽካ
ኤርምያስ 32፥2627

VERSE 4
ሮሜ 𝟕:𝟏𝟒𝟐𝟓
2nd may
ነቲ ኣነ ክገብሮ ዘይደሊ፡ እናፈለጥኩ ጐይታይ፡ ብድፍረት ዝገብሮስ “ታየ ኮይነ”
ኣብዛ ሥጋይ፡ ሠናይ የለን፡ ጕዕዞ ሞት ኮይኑኒ፡ ማራናታ ኢየሱስ ምድሓነይ ናፊቀ

VERSE 5
ንሓጢኣትካ፡ ብሞተይ ክስዕሮ፡ ሕይወተይ
ሂበ ''የ፡
1ይ ቆረንጦስ 15:3
ኣብ ድኽመተይ፡ ሓይልካ ክትገልጽ፡ ጸጋኻ’የ ደልየ፡

VERSE 6
2ይ ቆረንጦስ 12:9
ሰዓበኒ ! ወደይ ኣይትማታእ፡ ነዓ መስቀልካ ኣልዕል፡
ሉቃስ 9:23
ክሓጽበካ''ሞ፡ ካብ በረድ ኽትጽዕዱ፡ ከም ብተይ ክትዘልል፡

VERSE 7
ኢሳይያስ 1:18
ዘፍጥረት 𝟑𝟐:𝟐𝟒𝟑𝟎
3rd may
ኣለኩ ኣብዚ፥ ክሳብ ተ''ውግሓለይ

VERSE 8
ከይባረኽካንሲ ክሓድገካ ከመይ "መድሓኒየይ"
ክሳብ መዓስየ ኽ''ኽወል ካብቲ ብርሃን ገጽካ
ብሰንኪ ኃጢኣትይ ኢድካ ዘርግሓለይ
ዝሓስበልካ ሓሳብ እፈልጦየ ነገር ደሓን እዩ

VERSE 9
ኤርምያስ 29:11
እኣምን ጐይታይ፡ ካባኻ ዝፈልየኒ፡ድኻመይ እንድኣሉ
ኢሳይያስ 59:2-3
ጽናዕ ትባዕ ኣብ ትኸዶ ኩሉ ምሳካ’የ ወትሩ

VERSE 10
ኢያሱ 1:9
ካብ ሓጢኣትካ ‘ቲ ጸጋይ ይዓቢ ክትሰግሮ ኢካ ኩሉ
ሮሜ 5:20
እፍትን ኣለኩ፥ እቃለስ ኣምላኸይ በብሓንቲ፥

VERSE 11
ዪኣኽለኒ ከይበልካስ፥ ኣብዚ ጉዕዞይ እባ ኣሳሊየኒ፥
ምሳኻ ውዒለ፥ ንምሸቱ ዋላ ተጸደፍኩ፥ መደያይቦይ ኩን፥ ዘየፍርሕ ዓይኑ ምስተጠመትኩ፥
ተተጠዓስኩሲ፥ ዝርድኦ ቃላት ከየውጻኹ፥(2)',
      lyrics_transliteration = 'Eftn aleku: eqales amlaኸy bebhanti:
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ:

VERSE 1
Marqos 𝟏𝟎:𝟒𝟔𝟓𝟐
1st may
Wedi dawit goyitay "simani ''mo" hansab keelleka nidmts’ey ts’n belo “melseley”
Seri z difun libonay: kemey ile kirio ''ti tihbo fiqri ቑlh bel ts’ewani

VERSE 2
Wiludey ! entay iኻ tideli entay kigebrelka
Marqos 10:51
Amlakey ! b ewrti libey kiri midhanka
Marqos 10:51

VERSE 3
Emen emo eti zedlyeka kulu kigebrelka
Marqos 10:52
Ane iye ''ti kulu ziኽel wehabi amlaኽka
Ermyas 32:2627

VERSE 4
Rome 𝟕:𝟏𝟒𝟐𝟓
2nd may
Neti ane kigebro zeydeli enafelet’ku gweytay bidfret zigebros “taye koyne”
Abza sigay senay yelen gwezo mot koynuni maranata Iyesus midhaney nafiqe

VERSE 5
Nihat’iatka bimotey kisero hiywetey
Hibe ''ye
1y qorent’os 15:3
Ab diኽmetey haylka kitgelts’ ts’egaኻ’ye delye

VERSE 6
2y qorent’os 12:9
Seabeni ! wedey aytmatae nea mesqelka alel
Luqas 9:23
Kihats’beka''mo kab bered ኽtts’edu kem bitey kitzell

VERSE 7
Isayyas 1:18
Zeft’ret 𝟑𝟐:𝟐𝟒𝟑𝟎
3rd may
Aleku abzi: kisab te''wighaley

VERSE 8
Keybareኽkansi kihadgeka kemey "medhaniyey"
Kisab measye ኽ''ኽwel kabti birhan gets’ka
Bisenki hat’iaty idka zerghaley
Zihasbelka hasab efelt’oye neger dehan eyu

VERSE 9
Ermyas 29:11
Eamn gweytay kabaኻ zifelyeni dኻmey endalu
Isayyas 59:2-3
Ts’nae tibae ab tiኸdo kulu misaka’ye wetru

VERSE 10
Iyasu 1:9
Kab hat’iatka ‘ti ts’egay yiabi kitsegro ika kulu
Rome 5:20
Eftn aleku: eqales amlaኸy bebhanti:

VERSE 11
Yiaኽleni keybelkas: abzi guezoy eba asaliyeni:
Misaኻ wiile: nimshetu wala tets’edefku: medeyayboy kun: zeyefrh aynu mistet’emetku:
Tetet’easkusi: zirdo qalat keyewts’aኹ: (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eftn-aleku-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eftn-aleku-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egiziabiher Begna Bet (egiziabiher-begna-bet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 1
በደጃፋችን ላይ አለ ህያዉ ስሙ
ጉበን መቃናችን ቃሉ ነዉ ማህተሙ
ዘንባባን አንጠፈን የምቀበለዉ
እግዚአብሔር ቀን በቀን ሆሳዕናችን ነዉ (2)

VERSE 2
ከእግዚአብሔር የምበልጥ የለም በቤታችን
ቀዳም ነዉ ስሙ አልፋ ኦሜጋችን
ሕጉን ጠልፈንበት መጋሬጃችን ላይ
ንጉስ ነዉ በእኛ

VERSE 3
ቤት በከፍታ የምታይ (2)
ከአማሌቅ አማልክት ከቶ አንቀላውጥም
ለክብሩ የማይሆን እርም አናስቀምጥም
አይረክስም ምንጣፉ የክብሩ መቅረዞች

VERSE 4
ከሬሞን በመጡ በጣዖት ቤት ሰዎች(2)
ሲሞላም ስጎድልም አይቆምም ምሥጋና
ቤቱ ያለ መዝሙር አያጌጥምና
እግዚአብሔር ቢሰጥ አግዚአብሔር ቢነሳ

VERSE 5
አይውልም በእኛ ቤት ክብሩ ሳይነሣ(2)',
      lyrics_transliteration = 'Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 1
Bedejafachn lay ale hiyawu simu
Guben meqanachn qalu newu mahtemu
Zenbaban ant’efen yemqebelewu
Egziabher qen beqen hosaenachn newu (2)

VERSE 2
Keegziabher yembelt’ yelem bebetachn
Qedam newu simu alfa omegachn
Higun t’elfenbet megarejachn lay
Nigus newu beegna

VERSE 3
Bet bekefta yemtay (2)
Keamaleq amalkt keto anqelawt’m
Lekbru yemayhon erm anasqemt’m
Ayreksm mint’afu yekbru meqrezoch

VERSE 4
Keremon bemet’u bet’aot bet sewoch (2)
Simolam sigodlm ayqomm misgana
Betu yale mezmur ayaget’mna
Egziabher biset’ agziabher binesa

VERSE 5
Aywlm beegna bet kibru saynesa (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egiziabiher-begna-bet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 1
በደጃፋችን ላይ አለ ህያዉ ስሙ
ጉበን መቃናችን ቃሉ ነዉ ማህተሙ
ዘንባባን አንጠፈን የምቀበለዉ
እግዚአብሔር ቀን በቀን ሆሳዕናችን ነዉ (2)

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 2
ከእግዚአብሔር የምበልጥ የለም በቤታችን
ቀዳም ነዉ ስሙ አልፋ ኦሜጋችን
ሕጉን ጠልፈንበት መጋሬጃችን ላይ
ንጉስ ነዉ በእኛ

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 3
ቤት በከፍታ የምታይ (2)
ከአማሌቅ አማልክት ከቶ አንቀላውጥም
ለክብሩ የማይሆን እርም አናስቀምጥም
አይረክስም ምንጣፉ የክብሩ መቅረዞች

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 4
ከሬሞን በመጡ በጣዖት ቤት ሰዎች(2)
ሲሞላም ስጎድልም አይቆምም ምሥጋና
ቤቱ ያለ መዝሙር አያጌጥምና
እግዚአብሔር ቢሰጥ አግዚአብሔር ቢነሳ

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 5
አይውልም በእኛ ቤት ክብሩ ሳይነሣ(2)

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 1
Bedejafachn lay ale hiyawu simu
Guben meqanachn qalu newu mahtemu
Zenbaban ant’efen yemqebelewu
Egziabher qen beqen hosaenachn newu (2)

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 2
Keegziabher yembelt’ yelem bebetachn
Qedam newu simu alfa omegachn
Higun t’elfenbet megarejachn lay
Nigus newu beegna

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 3
Bet bekefta yemtay (2)
Keamaleq amalkt keto anqelawt’m
Lekbru yemayhon erm anasqemt’m
Ayreksm mint’afu yekbru meqrezoch

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 4
Keremon bemet’u bet’aot bet sewoch (2)
Simolam sigodlm ayqomm misgana
Betu yale mezmur ayaget’mna
Egziabher biset’ agziabher binesa

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 5
Aywlm beegna bet kibru saynesa (2)

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egiziabiher-begna-bet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egiziabiher Egnan Sireda (egiziabiher-egnan-sireda)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)

VERSE 1
ዘካርያስ ስማ አምላክህ ያደርጋል
አትበል ያረጀ እንደምን ይወልዳል?
ፍርሀት የሚናገር አንደበት ዝም ይበል
ለአምላካችን ስራ አሜን እንላለን

VERSE 2
እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
አንተ መድሃኒያለም የኛ መሸሸጊያ
በበረታው እጅህ ይከፈታል መዝጊያ

VERSE 3
ልጆችህ ነን እና ሆነን እድለኛ
ድንጋይ ይሰበራል ስትመጣ ወደኛ
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)

VERSE 4
በትከሻችን ልክ አይደለም ደካማ
እግዚአብሔር ህያው ነው
የሚያይ የሚሰማ
በምድረበዳ ውስጥ ያደርጋል ዘንባባ

VERSE 5
እልል እልል እያልን ወደ ቤቱ እንግባ
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)
ቀሲስ በጣም እወዶታለሁ

VERSE 6
እግዚአብሔርን ያወቅሁት
ባንቱ ስብከትና መዝሙር ነው
ከዛ በፊት ስለ እግዚአብሔር የማውቀው
ነገር ቢኖር አምላኬ መሆኑ ብቻ ነው',
      lyrics_transliteration = 'Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)

VERSE 1
Zekaryas sima amlakh yadergal
Atbel yareje endemn yiweldal?
Firhet yeminager andebet zim yibel
Leamlakachn sira Amen enlalen

VERSE 2
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Ante medhaniyalem yegna mesheshegiya
Beberetaw ejh yikefetal mezgiya

VERSE 3
Lijochh nen ena honen edlegna
Dingay yiseberal sitmet’a wedegna
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)

VERSE 4
Betkeshachn lik aydelem dekama
Egziabher hiyaw new
Yemiyay yemisema
Bemdrebeda wist’ yadergal zenbaba

VERSE 5
Ell ell eyaln wede betu engba
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Qesis bet’am ewedotalehu

VERSE 6
Egziabhern yaweqhut
Bantu sibketna mezmur new
Keza befit sile Egziabher yemawqew
Neger binor amlake mehonu bicha new',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egiziabiher-egnan-sireda'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)

VERSE 1
ዘካርያስ ስማ አምላክህ ያደርጋል
አትበል ያረጀ እንደምን ይወልዳል?
ፍርሀት የሚናገር አንደበት ዝም ይበል
ለአምላካችን ስራ አሜን እንላለን

CHORUS
እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)

VERSE 2
እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
አንተ መድሃኒያለም የኛ መሸሸጊያ
በበረታው እጅህ ይከፈታል መዝጊያ

CHORUS
እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)

VERSE 3
ልጆችህ ነን እና ሆነን እድለኛ
ድንጋይ ይሰበራል ስትመጣ ወደኛ
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)

CHORUS
እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)

VERSE 4
በትከሻችን ልክ አይደለም ደካማ
እግዚአብሔር ህያው ነው
የሚያይ የሚሰማ
በምድረበዳ ውስጥ ያደርጋል ዘንባባ

CHORUS
እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)

VERSE 5
እልል እልል እያልን ወደ ቤቱ እንግባ
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)
ቀሲስ በጣም እወዶታለሁ

CHORUS
እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)

VERSE 6
እግዚአብሔርን ያወቅሁት
ባንቱ ስብከትና መዝሙር ነው
ከዛ በፊት ስለ እግዚአብሔር የማውቀው
ነገር ቢኖር አምላኬ መሆኑ ብቻ ነው

CHORUS
እግዚአብሔር እኛን ሲረዳ (2)
ይሆናል ተራራው ሜዳ (4)
እግዚአብሔር እኛን ሲረዳ(2)
ይሆናል ተራራው ሜዳ(4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)

VERSE 1
Zekaryas sima amlakh yadergal
Atbel yareje endemn yiweldal?
Firhet yeminager andebet zim yibel
Leamlakachn sira Amen enlalen

CHORUS
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)

VERSE 2
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Ante medhaniyalem yegna mesheshegiya
Beberetaw ejh yikefetal mezgiya

CHORUS
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)

VERSE 3
Lijochh nen ena honen edlegna
Dingay yiseberal sitmet’a wedegna
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)

CHORUS
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)

VERSE 4
Betkeshachn lik aydelem dekama
Egziabher hiyaw new
Yemiyay yemisema
Bemdrebeda wist’ yadergal zenbaba

CHORUS
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)

VERSE 5
Ell ell eyaln wede betu engba
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Qesis bet’am ewedotalehu

CHORUS
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)

VERSE 6
Egziabhern yaweqhut
Bantu sibketna mezmur new
Keza befit sile Egziabher yemawqew
Neger binor amlake mehonu bicha new

CHORUS
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)
Egziabher egnan sireda (2)
Yihonal teraraw meda (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egiziabiher-egnan-sireda', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egiziabiher Eregnaye New (egiziabiher-eregnaye-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 1
ነፍሴን መለሳት ከጥፋት ወጥመድ
ስለስሙ መራኝ በፅድቅ መንገድ
ባለፍኩም ጊዜ በሞት ጥላ ስር
ክፉውን አልፈራም ነህና ከእኔ ጋር

VERSE 2
በትርህ ምርኩዝህ እነሱ አዳኑኝ
በፊቴም ገበታ አዘጋጀህልኝ
በዘይት ቀባኸኝ በደስታ ፀጋ
ፅዋዬም ተረፈ ስኖር ካንተ ጋራ

VERSE 3
ከአዳኝ ወጥመድም እርሱ ያድነኛል
በላባዎቹም ስር ይጋርደኛል
መሸሸጊያዬ ነው በርሱ እታመናለው
እርሱ መጠጊያዬ ከቶ ምን እሆናለው

VERSE 4
ቸርነትህ እና ምህረትህ ዘወትር
ይከተሉኛል በህይወቴ ዘመን
ስለዚህ በፅናት ባንተ ቤት ኖራለው
በእግዚአብሔር ቸርነት ፍቅር እየተደገፍኩ',
      lyrics_transliteration = 'Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 1
Nefsen melesat ket’fat wet’med
Silesmu meragn bets’dq menged
Balefkum gize bemot t’la sir
Kifuwn alferam nehna keene gar

VERSE 2
Betrh mirkuzh enesu adanugn
Befitem gebeta azegajehlgn
Bezeyt qebaኸgn bedesta ts’ega
Ts’wayem terefe sinor kante gara

VERSE 3
Keadagn wet’medm ersu yadnegnal
Belabawochum sir yigardegnal
Mesheshegiyaye new bersu etamenalew
Ersu met’egiyaye keto min ehonalew

VERSE 4
Cherneth ena mihreth zewetr
Yiketelugnal behywete zemen
Silezih bets’nat bante bet noralew
BeEgziabher chernet fiqr eyetedegefku',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egiziabiher-eregnaye-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 1
ነፍሴን መለሳት ከጥፋት ወጥመድ
ስለስሙ መራኝ በፅድቅ መንገድ
ባለፍኩም ጊዜ በሞት ጥላ ስር
ክፉውን አልፈራም ነህና ከእኔ ጋር

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 2
በትርህ ምርኩዝህ እነሱ አዳኑኝ
በፊቴም ገበታ አዘጋጀህልኝ
በዘይት ቀባኸኝ በደስታ ፀጋ
ፅዋዬም ተረፈ ስኖር ካንተ ጋራ

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 3
ከአዳኝ ወጥመድም እርሱ ያድነኛል
በላባዎቹም ስር ይጋርደኛል
መሸሸጊያዬ ነው በርሱ እታመናለው
እርሱ መጠጊያዬ ከቶ ምን እሆናለው

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 4
ቸርነትህ እና ምህረትህ ዘወትር
ይከተሉኛል በህይወቴ ዘመን
ስለዚህ በፅናት ባንተ ቤት ኖራለው
በእግዚአብሔር ቸርነት ፍቅር እየተደገፍኩ

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 1
Nefsen melesat ket’fat wet’med
Silesmu meragn bets’dq menged
Balefkum gize bemot t’la sir
Kifuwn alferam nehna keene gar

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 2
Betrh mirkuzh enesu adanugn
Befitem gebeta azegajehlgn
Bezeyt qebaኸgn bedesta ts’ega
Ts’wayem terefe sinor kante gara

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 3
Keadagn wet’medm ersu yadnegnal
Belabawochum sir yigardegnal
Mesheshegiyaye new bersu etamenalew
Ersu met’egiyaye keto min ehonalew

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 4
Cherneth ena mihreth zewetr
Yiketelugnal behywete zemen
Silezih bets’nat bante bet noralew
BeEgziabher chernet fiqr eyetedegefku

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egiziabiher-eregnaye-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egiziabiher Hayal New (egiziabiher-hayal-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 1
ማዳንና ጥበብ ኃይል በእጁ ሆኖ
ለሰዉ የማይቻል ለእርሱ ቀሊል ሆኖ
ፈጥኖ ይጎበኛል የምስኪኑን ጓዳ
ፈፅሞ አይዘገይም ጌታ ሲሰናዳ

VERSE 2
አንዱን እየሻረ አንዱን እየሾመ
የተዋረደዉን ክብር እያሸለመ
በኋላ ያለዉን ከፊት አሳልፎ
በጎ ቀን የመጣል ጨለማዉን ገፍፎ

VERSE 3
እንደቋትም ቢከብድ የሕይወት ፈተና
ሰዉን የሚያፀና አምላክ አለንና
ደስ ያሰኛ እርሱ መከራን አጥፍቶ
ታግሶ የቆመ ማን አፈረ ከቶ

VERSE 4
የሚያስፈራ ጊዜ ቢመጣም ክፉ ቀን
እናልፋለን እና እግዚአብሔርን ይዘን
ወራት ከብዶባችሁ ያጎነበሳችሁ
ታሪክ ሆኖ ያልፋል እግዚአብሔር ሲያያችሁ',
      lyrics_transliteration = 'Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 1
Madanna t’beb hayl beeju hono
Lesewu yemaychal leersu qelil hono
Fet’no yigobegnal yemskinun gwada
Fets’mo ayzegeym Geta sisenada

VERSE 2
Andun eyeshare andun eyeshome
Yetewaredewun kibir eyasheleme
Behwala yalewun kefit asalfo
Bego qen yemet’al ch’elemawun geffo

VERSE 3
Endeqwatm bikebd yehywet fetena
Sewun yemiyats’ena amlak alenna
Des yasegna ersu mekeran at’fto
Tagso yeqome man afere keto

VERSE 4
Yemiyasfera gize bimet’am kifu qen
Enalfalen ena Egziabhern yizen
Werat kebdobachhu yagonebesachhu
Tarik hono yalfal Egziabher siyayachhu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egiziabiher-hayal-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 1
ማዳንና ጥበብ ኃይል በእጁ ሆኖ
ለሰዉ የማይቻል ለእርሱ ቀሊል ሆኖ
ፈጥኖ ይጎበኛል የምስኪኑን ጓዳ
ፈፅሞ አይዘገይም ጌታ ሲሰናዳ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 2
አንዱን እየሻረ አንዱን እየሾመ
የተዋረደዉን ክብር እያሸለመ
በኋላ ያለዉን ከፊት አሳልፎ
በጎ ቀን የመጣል ጨለማዉን ገፍፎ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 3
እንደቋትም ቢከብድ የሕይወት ፈተና
ሰዉን የሚያፀና አምላክ አለንና
ደስ ያሰኛ እርሱ መከራን አጥፍቶ
ታግሶ የቆመ ማን አፈረ ከቶ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 4
የሚያስፈራ ጊዜ ቢመጣም ክፉ ቀን
እናልፋለን እና እግዚአብሔርን ይዘን
ወራት ከብዶባችሁ ያጎነበሳችሁ
ታሪክ ሆኖ ያልፋል እግዚአብሔር ሲያያችሁ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 1
Madanna t’beb hayl beeju hono
Lesewu yemaychal leersu qelil hono
Fet’no yigobegnal yemskinun gwada
Fets’mo ayzegeym Geta sisenada

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 2
Andun eyeshare andun eyeshome
Yetewaredewun kibir eyasheleme
Behwala yalewun kefit asalfo
Bego qen yemet’al ch’elemawun geffo

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 3
Endeqwatm bikebd yehywet fetena
Sewun yemiyats’ena amlak alenna
Des yasegna ersu mekeran at’fto
Tagso yeqome man afere keto

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 4
Yemiyasfera gize bimet’am kifu qen
Enalfalen ena Egziabhern yizen
Werat kebdobachhu yagonebesachhu
Tarik hono yalfal Egziabher siyayachhu

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egiziabiher-hayal-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egiziabiher Kegna Gar Bayihon (egiziabiher-kegna-gar-bayihon)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚኣብሔር ከእኛ ጋር ባይሆን
ጠላት ምንኛ በናቀን
ግን ሁሉም በግዜው ኣልፏል
ቸርነቱ ሲጠብቀን

VERSE 1
የነሃሱን መዝግያ ብረቱን ባይቆርጠው
በራሱ ችሎታ ማን ነበር ሚያመልጠው
ግን ሁሉም ኣለፈ ቀስ እያለ ነጋ
ለካስ ወድቆ ኣይወድቅም ኣንተን የተጠጋ (2)

VERSE 2
ያሻግራል ሲሉን ሰምተናል በዝና
ለሊት በዓምደ ብርሃን ቀኑን በደመና
ዛሬ ግን ተገልጧል መዳኑ በላየ
ወዳጄ እለዋለው ባለዉለታየ (2)

VERSE 3
ጸጉራችን ተላጭቶ ናዝራዊነታችን
ጭፍራው እያፋጨ ነግሶ በላያችን
እግዚኣብሔር ሲያስበን ጉልበታም ሆነናል
ምሶሶዉን ይዘን ጠላትን ፈጭተናል (2)

VERSE 4
ኣይችሉም እያለ ይፎክራል ጠላት
ኣሳላፊው ንጉስ የት ሄዶ የኛ አባት
የማይወጣውን ወጣነው ታግሰን
እልል እንላለን ከእርሱ ጋራ ነግሰን (2)',
      lyrics_transliteration = 'Egziabher keegna gar bayhon
T’elat mingna benaqen
Gin hulum begzew alfwal
Chernetu sit’ebqen

VERSE 1
Yenehasun mezgya biretun bayqort’ew
Berasu chlota man neber miyamelt’ew
Gin hulum alefe qes eyale nega
Lekas wedqo aywedqm anten yetet’ega (2)

VERSE 2
Yashagral silun semtenal bezna
Lelit beamde birhan qenun bedemena
Zare gin tegelt’wal medanu belaye
Wedaje elewalew balewuletaye (2)

VERSE 3
Ts’egurachn telach’to nazrawinetachn
Ch’fraw eyafach’e negso belayachn
Egziabher siyasben gulbetam honenal
Misosowun yizen t’elatn fech’tenal (2)

VERSE 4
Aychlum eyale yifokral t’elat
Asalafiw nigus yet hedo yegna abat
Yemaywet’awn wet’anew tagsen
Ell enlalen keersu gara negsen (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egiziabiher-kegna-gar-bayihon'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egiziabiher-kegna-gar-bayihon', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egiziabiher Siraw (egiziabiher-siraw)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 1
አ.ዝ //
በኃጢአት በሽታ ወድቄ ሳለሁኝ
መድሃኒት ክርስቶስ ከውድቀቴ አነሳኝ
ስጦታው ብዙ ነው ለኔ የሰጠኝ

VERSE 2
ተመስገን ብቻ ነው አምላክ ላንተ ያለኝ
አ.ዝ //
እንደ በርጤምዮስ እውር የነበርኩኝ
ዛሬ ግን በአምላኬ ድህነት አገኘሁኝ

VERSE 3
ህጉም ለመንገዴ ብርሐን ሆኖኛል
የእርሱ ስለሆንኩኝ ሠላምን ሰጥቶኛል
አ.ዝ //
በድንቅ አጠራርህ በፍቅር የጠራኽኝ

VERSE 4
ከአጋንንት እሥራት ነፃ ያወጣኽኝ
አልፋና ኦሜጋ ዘላለም የምትኖር
ኤልሻዳይ የሆንከው አማኑኤል ተመስገን
አ.ዝ፦ //

VERSE 5
የዕዳ ደብዳቤዬን ጌታዬ ቀደደው
የማዳኑን ሥራ በአይኔ አይቻለው
ቸርነቱ አያልቅም ድንቅ የሆነ ጌታ
ስሙን እናመስግን እንዘምር በእልልታ',
      lyrics_transliteration = 'Sewoch des yibelen beamlakachn
Kehat’iat barnet nets’a lawet’an
Tenesu enamesgn wiletaw bizu new
Min yikefelewal temesgen bicha new

VERSE 1
A.z //
Behat’iat beshta wedqe salehugn
Medhanit Kristos kewdqete anesagn
Sit’otaw bizu new lene yeset’egn

VERSE 2
Temesgen bicha new amlak lante yalegn
A.z //
Ende bert’emyos ewr yeneberkugn
Zare gin beamlake dihnet agegnehugn

VERSE 3
Higum lemengede birhen honognal
Yeersu silehonkugn selamn set’tognal
A.z //
Bednq at’erarh befqr yet’eraኽgn

VERSE 4
Keagannt esrat nets’a yawet’aኽgn
Alfana omega zelalem yemtnor
Elshaday yehonkew Amanuel temesgen
A.zi: //

VERSE 5
Yeeda debdabeyen Getaye qededew
Yemadanun sira beayne aychalew
Chernetu ayalqm dinq yehone Geta
Simun enamesgn enzemr beellta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egiziabiher-siraw'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 1
አ.ዝ //
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
አ.ዝ //
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
አ.ዝ //
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
አ.ዝ፦ //

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
ምን ይከፈለዋል ተመስገን ብቻ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sewoch des yibelen beamlakachn
Kehat’iat barnet nets’a lawet’an
Tenesu enamesgn wiletaw bizu new
Min yikefelewal temesgen bicha new

VERSE 1
A.z //
Behat’iat beshta wedqe salehugn
Medhanit Kristos kewdqete anesagn
Sit’otaw bizu new lene yeset’egn

CHORUS
Sewoch des yibelen beamlakachn
Kehat’iat barnet nets’a lawet’an
Tenesu enamesgn wiletaw bizu new
Min yikefelewal temesgen bicha new

VERSE 2
Temesgen bicha new amlak lante yalegn
A.z //
Ende bert’emyos ewr yeneberkugn
Zare gin beamlake dihnet agegnehugn

CHORUS
Sewoch des yibelen beamlakachn
Kehat’iat barnet nets’a lawet’an
Tenesu enamesgn wiletaw bizu new
Min yikefelewal temesgen bicha new

VERSE 3
Higum lemengede birhen honognal
Yeersu silehonkugn selamn set’tognal
A.z //
Bednq at’erarh befqr yet’eraኽgn

CHORUS
Sewoch des yibelen beamlakachn
Kehat’iat barnet nets’a lawet’an
Tenesu enamesgn wiletaw bizu new
Min yikefelewal temesgen bicha new

VERSE 4
Keagannt esrat nets’a yawet’aኽgn
Alfana omega zelalem yemtnor
Elshaday yehonkew Amanuel temesgen
A.zi: //

CHORUS
Sewoch des yibelen beamlakachn
Kehat’iat barnet nets’a lawet’an
Tenesu enamesgn wiletaw bizu new
Min yikefelewal temesgen bicha new

VERSE 5
Yeeda debdabeyen Getaye qededew
Yemadanun sira beayne aychalew
Chernetu ayalqm dinq yehone Geta
Simun enamesgn enzemr beellta

CHORUS
Sewoch des yibelen beamlakachn
Kehat’iat barnet nets’a lawet’an
Tenesu enamesgn wiletaw bizu new
Min yikefelewal temesgen bicha new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egiziabiher-siraw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egiziabiher Siraw Dinik New//bezemenat Yeshemegele Likesiyuman Tsige Asiteraye Ye Gna Amet Misireta Beal (egiziabiher-siraw-dinik-new-bezemenat-yeshemegele-likesiyuman-tsige-asit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 1
ጥሎብኛል መጎናፀፊያ
ለይቶኛል ከስጋ ጥድፊያ
በሰው ሚዛን ክብርን የማይለካ
እውነተኛ ጌታ ነው ለካ

VERSE 2
ደመና ነው መንኮራኩሩ
ነበልባል ነው ዙፋን ድንበሩ
መሠወሪያው አይደረስም
በማንም ሞት አይከሰስም

VERSE 3
ቀን ዘመናት ሁሉ ሲያረጁ
አዲሶቹ ዘምነው ሲጃጁ
ጌታ አዲስ ነው ሁሌ ማለዳ
ፍቅር ያዘንባል ከልቡ ጓዳ

VERSE 4
መካኒቱን በልጅ ባረከ
ኃይለኛውን አንበረከከ
ለምስኪኖች ስለሚራራ
በኢየሱስ ልባችን ኮራ

VERSE 5
በዘመናት የሸመገለ',
      lyrics_transliteration = 'Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 1
T’lobgnal megonats’efiya
Leytognal kesga t’dfiya
Besew mizan kibrn yemayleka
Ewnetegna Geta new leka

VERSE 2
Demena new menkorakuru
Nebelbal new zufan dinberu
Meseweriyaw ayderesm
Bemanm mot aykesesm

VERSE 3
Qen zemenat hulu siyareju
Adisochu zemnew sijaju
Geta adis new hule maleda
Fiqr yazenbal kelbu gwada

VERSE 4
Mekanitun belj bareke
Haylegnawn anberekeke
Lemskinoch silemirara
Beiyesus libachn kora

VERSE 5
Bezemenat yeshemegele',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egiziabiher-siraw-dinik-new-bezemenat-yeshemegele-likesiyuman-tsige-asit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 1
ጥሎብኛል መጎናፀፊያ
ለይቶኛል ከስጋ ጥድፊያ
በሰው ሚዛን ክብርን የማይለካ
እውነተኛ ጌታ ነው ለካ

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 2
ደመና ነው መንኮራኩሩ
ነበልባል ነው ዙፋን ድንበሩ
መሠወሪያው አይደረስም
በማንም ሞት አይከሰስም

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 3
ቀን ዘመናት ሁሉ ሲያረጁ
አዲሶቹ ዘምነው ሲጃጁ
ጌታ አዲስ ነው ሁሌ ማለዳ
ፍቅር ያዘንባል ከልቡ ጓዳ

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 4
መካኒቱን በልጅ ባረከ
ኃይለኛውን አንበረከከ
ለምስኪኖች ስለሚራራ
በኢየሱስ ልባችን ኮራ

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 5
በዘመናት የሸመገለ

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 1
T’lobgnal megonats’efiya
Leytognal kesga t’dfiya
Besew mizan kibrn yemayleka
Ewnetegna Geta new leka

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 2
Demena new menkorakuru
Nebelbal new zufan dinberu
Meseweriyaw ayderesm
Bemanm mot aykesesm

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 3
Qen zemenat hulu siyareju
Adisochu zemnew sijaju
Geta adis new hule maleda
Fiqr yazenbal kelbu gwada

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 4
Mekanitun belj bareke
Haylegnawn anberekeke
Lemskinoch silemirara
Beiyesus libachn kora

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 5
Bezemenat yeshemegele

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egiziabiher-siraw-dinik-new-bezemenat-yeshemegele-likesiyuman-tsige-asit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egiziabiher Sirawu Dinik New Zemari Di N Bisirat Chebisi (egiziabiher-sirawu-dinik-new-zemari-di-n-bisirat-chebisi)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር ስራው ድንቅ ነዉ
ለእኔ ያደረገው ብዙ ነዉ
እግዚአብሔር ስራዉ ድንቅ ነዉ
ለእኔ ያረገልኝ ብዙ ነዉ

VERSE 1
እረዳቴ እሱ ነዉ ከሰማያት
እግዚአብሔር ጠባቂ የኔን ሕይወት
ብርሀኑን በፊቴ የሚያበራ
አምላኬ ድንቅ ነዉ የእሱ ስራ

VERSE 2
በመንገዴ ሁሉ የሚመራኝ
ስነሳ ስወድቅም የሚያስበኝ
ማንም አልመጣልኝ ከወገኔ
ከሁሉም ይበልጣል እሱ ለእኔ

VERSE 3
የእዳዬን ደብዳቤ ዉድቅ አድርጎ
ሕይወቴን መራልኝ ወደ በጎ
እረ እንደ እግዚአብሔር ማን ይሆናል
እርሱን ለሚፈሩት ይታመናል

VERSE 4
አንድ ቀን አስቤ ተጨንቄ
ለመኖር አልቻልኩም ተጠንቅቄ
ሁሉን ነገር ለእርሱ ትቼዋለው
በምእረቱ ጥላ እኖራለዉ',
      lyrics_transliteration = 'Egziabher siraw dinq newu
Leene yaderegew bizu newu
Egziabher sirawu dinq newu
Leene yaregelgn bizu newu

VERSE 1
Eredate esu newu kesemayat
Egziabher t’ebaqi yenen hiywet
Birhenun befite yemiyabera
Amlake dinq newu yeesu sira

VERSE 2
Bemengede hulu yemimeragn
Sinesa siwedqm yemiyasbegn
Manm almet’algn kewegene
Kehulum yibelt’al esu leene

VERSE 3
Yeedayen debdabe wudq adrgo
Hiyweten meralgn wede bego
Ere ende Egziabher man yihonal
Ersun lemiferut yitamenal

VERSE 4
And qen asbe tech’enqe
Lemenor alchalkum tet’enqqe
Hulun neger leersu tichewalew
Bemeretu t’la enoralewu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egiziabiher-sirawu-dinik-new-zemari-di-n-bisirat-chebisi'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ስራው ድንቅ ነዉ
ለእኔ ያደረገው ብዙ ነዉ
እግዚአብሔር ስራዉ ድንቅ ነዉ
ለእኔ ያረገልኝ ብዙ ነዉ

VERSE 1
እረዳቴ እሱ ነዉ ከሰማያት
እግዚአብሔር ጠባቂ የኔን ሕይወት
ብርሀኑን በፊቴ የሚያበራ
አምላኬ ድንቅ ነዉ የእሱ ስራ

CHORUS
እግዚአብሔር ስራው ድንቅ ነዉ
ለእኔ ያደረገው ብዙ ነዉ
እግዚአብሔር ስራዉ ድንቅ ነዉ
ለእኔ ያረገልኝ ብዙ ነዉ

VERSE 2
በመንገዴ ሁሉ የሚመራኝ
ስነሳ ስወድቅም የሚያስበኝ
ማንም አልመጣልኝ ከወገኔ
ከሁሉም ይበልጣል እሱ ለእኔ

CHORUS
እግዚአብሔር ስራው ድንቅ ነዉ
ለእኔ ያደረገው ብዙ ነዉ
እግዚአብሔር ስራዉ ድንቅ ነዉ
ለእኔ ያረገልኝ ብዙ ነዉ

VERSE 3
የእዳዬን ደብዳቤ ዉድቅ አድርጎ
ሕይወቴን መራልኝ ወደ በጎ
እረ እንደ እግዚአብሔር ማን ይሆናል
እርሱን ለሚፈሩት ይታመናል

CHORUS
እግዚአብሔር ስራው ድንቅ ነዉ
ለእኔ ያደረገው ብዙ ነዉ
እግዚአብሔር ስራዉ ድንቅ ነዉ
ለእኔ ያረገልኝ ብዙ ነዉ

VERSE 4
አንድ ቀን አስቤ ተጨንቄ
ለመኖር አልቻልኩም ተጠንቅቄ
ሁሉን ነገር ለእርሱ ትቼዋለው
በምእረቱ ጥላ እኖራለዉ

CHORUS
እግዚአብሔር ስራው ድንቅ ነዉ
ለእኔ ያደረገው ብዙ ነዉ
እግዚአብሔር ስራዉ ድንቅ ነዉ
ለእኔ ያረገልኝ ብዙ ነዉ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher siraw dinq newu
Leene yaderegew bizu newu
Egziabher sirawu dinq newu
Leene yaregelgn bizu newu

VERSE 1
Eredate esu newu kesemayat
Egziabher t’ebaqi yenen hiywet
Birhenun befite yemiyabera
Amlake dinq newu yeesu sira

CHORUS
Egziabher siraw dinq newu
Leene yaderegew bizu newu
Egziabher sirawu dinq newu
Leene yaregelgn bizu newu

VERSE 2
Bemengede hulu yemimeragn
Sinesa siwedqm yemiyasbegn
Manm almet’algn kewegene
Kehulum yibelt’al esu leene

CHORUS
Egziabher siraw dinq newu
Leene yaderegew bizu newu
Egziabher sirawu dinq newu
Leene yaregelgn bizu newu

VERSE 3
Yeedayen debdabe wudq adrgo
Hiyweten meralgn wede bego
Ere ende Egziabher man yihonal
Ersun lemiferut yitamenal

CHORUS
Egziabher siraw dinq newu
Leene yaderegew bizu newu
Egziabher sirawu dinq newu
Leene yaregelgn bizu newu

VERSE 4
And qen asbe tech’enqe
Lemenor alchalkum tet’enqqe
Hulun neger leersu tichewalew
Bemeretu t’la enoralewu

CHORUS
Egziabher siraw dinq newu
Leene yaderegew bizu newu
Egziabher sirawu dinq newu
Leene yaregelgn bizu newu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egiziabiher-sirawu-dinik-new-zemari-di-n-bisirat-chebisi', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egiziabiherin Amesiginu (egiziabiherin-amesiginu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 1
ያጸናው እርሱ ነው
ሥራህ ድንቅ ነው በሉት
የባሕርን ጥልቀት የመጠነ
ዳርቻዋን የወሰነ

VERSE 2
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት
ማዕበል ንፋስ የሚገሥጽ
ፍጥረቱ ለስሙ የሚታዘዘ

VERSE 3
ትጉኅ እረኛ ድካም የሌለበት
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ንጹሐ ባሕርይ ነው ሁሉን የሚገዛ
የነገሥታት ንጉሥ አልፋና ኦሜጋ

VERSE 4
ዘለዓለም እርሱ የማይለወጥ
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ጥበብን የሚገልጽ ጥበበኛ
ፍርድ የሚያደርግ እውነተኛ ዳኛ

VERSE 5
እንደርሱ ያለ ከቶ አይገኝም
እግዚአብሔር ግሩም ነው ዘለዓለም',
      lyrics_transliteration = 'Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 1
Yats’enaw ersu new
Sirah dinq new belut
Yebahrn t’lqet yemet’ene
Darchawan yewesene

VERSE 2
Egziabhern amesgnut
Sirah girum dinq new belut
Maebel nifas yemigests’
Fit’retu lesmu yemitazeze

VERSE 3
Tiguh eregna dikam yelelebet
Egziabhern sirah dinq new belut
Nits’uhe bahry new hulun yemigeza
Yenegestat nigus alfana omega

VERSE 4
Zelealem ersu yemaylewet’
Egziabhern sirah dinq new belut
T’bebn yemigelts’ t’bebegna
Fird yemiyaderg ewnetegna dagna

VERSE 5
Endersu yale keto aygegnm
Egziabher girum new zelealem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egiziabiherin-amesiginu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 1
ያጸናው እርሱ ነው
ሥራህ ድንቅ ነው በሉት
የባሕርን ጥልቀት የመጠነ
ዳርቻዋን የወሰነ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 2
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት
ማዕበል ንፋስ የሚገሥጽ
ፍጥረቱ ለስሙ የሚታዘዘ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 3
ትጉኅ እረኛ ድካም የሌለበት
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ንጹሐ ባሕርይ ነው ሁሉን የሚገዛ
የነገሥታት ንጉሥ አልፋና ኦሜጋ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 4
ዘለዓለም እርሱ የማይለወጥ
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ጥበብን የሚገልጽ ጥበበኛ
ፍርድ የሚያደርግ እውነተኛ ዳኛ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 5
እንደርሱ ያለ ከቶ አይገኝም
እግዚአብሔር ግሩም ነው ዘለዓለም

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 1
Yats’enaw ersu new
Sirah dinq new belut
Yebahrn t’lqet yemet’ene
Darchawan yewesene

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 2
Egziabhern amesgnut
Sirah girum dinq new belut
Maebel nifas yemigests’
Fit’retu lesmu yemitazeze

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 3
Tiguh eregna dikam yelelebet
Egziabhern sirah dinq new belut
Nits’uhe bahry new hulun yemigeza
Yenegestat nigus alfana omega

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 4
Zelealem ersu yemaylewet’
Egziabhern sirah dinq new belut
T’bebn yemigelts’ t’bebegna
Fird yemiyaderg ewnetegna dagna

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 5
Endersu yale keto aygegnm
Egziabher girum new zelealem

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egiziabiherin-amesiginu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: EGNA GINE / ETHIOPIAN ORTHODOX MEZMURE OLD (egna-gine-ethiopian-orthodox-mezmure-old)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም

VERSE 1
ስንቆ ትናፍ ፍቅር ወተሮ
ለአምልኮ የጣለን ከሰሩ
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን

VERSE 2
ሊገዛን መነር በሞቱ
መውጊያውን ሰበረ
ቀሚሱ እጣ ሲጣለበት ተገፎ
አለማት

VERSE 3
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ያለው ሞትና መቃብር ያረገው
በግርማ በክብር ክብር

VERSE 4
በአባቱ ቀኝ የተቀመጠው
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ፍጹም ሰው ፍጹም አምላክ ሆኖ

VERSE 5
በፍቅሩ አለማትን ከድኖ
ነፍሳትን ከሲኦል ዘረፈ
በደሙ ህያው ታሪክ ጻፈ
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን

VERSE 6
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ለእናቱም ለአባቱም አንድ ውድ ነው
የሌለው መተኪያ
ለፍቅር ነፍሱን ያልሰጠ

VERSE 7
አንድ ሆኖ ስለሁሉ ሞተ
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን

VERSE 8
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን',
      lyrics_transliteration = 'Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem

VERSE 1
Sinqo tinaf fiqr wetero
Leamlko yet’alen keseru
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen

VERSE 2
Ligezan mener bemotu
Mewgiyawn sebere
Qemisu et’a sit’alebet tegefo
Alemat

VERSE 3
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
Yalew motna meqabr yaregew
Begrma bekbr kibir

VERSE 4
Beabatu qegn yeteqemet’ew
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
Fits’um sew fits’um amlak hono

VERSE 5
Befqru alematn kedno
Nefsatn kesiol zerefe
Bedemu hiyaw tarik ts’afe
Egna gin yeteseqelewn Kristosn ensebkalen

VERSE 6
Egna gin bedl yaregewn eyesusn ensebkalen
Leenatum leabatum and wid new
Yelelew metekiya
Lefqr nefsun yalset’e

VERSE 7
And hono silehulu mote
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
Egna gin yeteseqelewn Kristosn ensebkalen

VERSE 8
Egna gin bedl yaregewn eyesusn ensebkalen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egna-gine-ethiopian-orthodox-mezmure-old'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም

VERSE 1
ስንቆ ትናፍ ፍቅር ወተሮ
ለአምልኮ የጣለን ከሰሩ
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን

CHORUS
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም

VERSE 2
ሊገዛን መነር በሞቱ
መውጊያውን ሰበረ
ቀሚሱ እጣ ሲጣለበት ተገፎ
አለማት

CHORUS
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም

VERSE 3
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ያለው ሞትና መቃብር ያረገው
በግርማ በክብር ክብር

CHORUS
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም

VERSE 4
በአባቱ ቀኝ የተቀመጠው
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ፍጹም ሰው ፍጹም አምላክ ሆኖ

CHORUS
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም

VERSE 5
በፍቅሩ አለማትን ከድኖ
ነፍሳትን ከሲኦል ዘረፈ
በደሙ ህያው ታሪክ ጻፈ
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን

CHORUS
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም

VERSE 6
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ለእናቱም ለአባቱም አንድ ውድ ነው
የሌለው መተኪያ
ለፍቅር ነፍሱን ያልሰጠ

CHORUS
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም

VERSE 7
አንድ ሆኖ ስለሁሉ ሞተ
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን

CHORUS
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም

VERSE 8
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን

CHORUS
እኛ ግን የተሰቀለውን ክርስቶስን እንሰብካለን
እኛ ግን በድል ያረገውን እየሱስን እንሰብካለን
ጦር አይደለም ትጥቆላ
ጥበብ አይደለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem

VERSE 1
Sinqo tinaf fiqr wetero
Leamlko yet’alen keseru
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen

CHORUS
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem

VERSE 2
Ligezan mener bemotu
Mewgiyawn sebere
Qemisu et’a sit’alebet tegefo
Alemat

CHORUS
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem

VERSE 3
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
Yalew motna meqabr yaregew
Begrma bekbr kibir

CHORUS
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem

VERSE 4
Beabatu qegn yeteqemet’ew
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
Fits’um sew fits’um amlak hono

CHORUS
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem

VERSE 5
Befqru alematn kedno
Nefsatn kesiol zerefe
Bedemu hiyaw tarik ts’afe
Egna gin yeteseqelewn Kristosn ensebkalen

CHORUS
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem

VERSE 6
Egna gin bedl yaregewn eyesusn ensebkalen
Leenatum leabatum and wid new
Yelelew metekiya
Lefqr nefsun yalset’e

CHORUS
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem

VERSE 7
And hono silehulu mote
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
Egna gin yeteseqelewn Kristosn ensebkalen

CHORUS
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem

VERSE 8
Egna gin bedl yaregewn eyesusn ensebkalen

CHORUS
Egna gin yeteseqelewn Kristosn ensebkalen
Egna gin bedl yaregewn eyesusn ensebkalen
T’or aydelem tit’qola
T’beb aydelem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egna-gine-ethiopian-orthodox-mezmure-old', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egnan Kewededebet Ketilik Fikiru Yetenesa (egnan-kewededebet-ketilik-fikiru-yetenesa)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኛን ከወደደበት ከጥልቅ ፍቅሩ የተነሳ
በደላችን ተሻረ ኃዘናችን ተረሳ /2/
ጽድቃችን ሆኖ እንደመርገም
ነፍሳችን ዝላ በሞት ሸክም

VERSE 1
ስለወደደን ጌታ ፈቅዶ
ይኸው አዳነን እንዲህ ወርዶ
ከጥልቁ ጉድጓድ ተጥለን
ጽኑ መከራ ውስጥ ሳለን

VERSE 2
ክርስቶስ በስጋ ተገልጦ
ሕይወትን ሰጠን ሞትን ውጦ
ታስሮ ወረደ በፍቅር
መዳፉን ሰጠ ለችንካር

VERSE 3
የባዘንነውን ሰበሰበን
ርቀን ነበር አቀረበን
ቁጥር የለውም ለዘመኑ
ድንበር የለውም ለማዳኑ

VERSE 4
ይኸው ሞትን አሰናበተ
ሰማይ በደሙ ተከፈተ',
      lyrics_transliteration = 'Egnan kewededebet ket’lq fiqru yetenesa
Bedelachn teshare hazenachn teresa (2)
Ts’dqachn hono endemergem
Nefsachn zila bemot shekm

VERSE 1
Silewededen Geta feqdo
Yiኸw adanen endih werdo
Ket’lqu gudgwad tet’len
Ts’nu mekera wist’ salen

VERSE 2
Kristos besga tegelt’o
Hiywetn set’en motn wit’o
Tasro werede befqr
Medafun set’e lechnkar

VERSE 3
Yebazennewn sebeseben
Riqen neber aqereben
Qut’r yelewm lezemenu
Dinber yelewm lemadanu

VERSE 4
Yiኸw motn asenabete
Semay bedemu tekefete',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egnan-kewededebet-ketilik-fikiru-yetenesa'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egnan-kewededebet-ketilik-fikiru-yetenesa', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egziabger hoy (egziabger-hoy)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ /2/
እድሜ ለንሰሃ እንደ ሕዝቅያስ ሰጥተህ
ጠማማውን ልቤን በቃልህ አቃንተህ
አላቀውም ብሎ ሲጠየቅ ያመጸው

VERSE 1
ዶሮ እስኪጮህ ድረስ ሦስት ጊዜ የካደው
የጅረት ወንዝ ነው የሰጠኸው እንባ
ጴጥሮስ ተጸፅቶ ንስሃ እንዲገባ
ጽዋው እንዳይደርሰኝ የይሁዳ እድል

VERSE 2
ልጅህ ሆኖ ውሎ ኋላ መኮብለል
ጴጥሮስ እድለኛው አልቅሶ ተማረ
በትዕቢቱ ይሁዳ እንደወጣ ቀረ
ዘመኗን በሙሉ በዝሙት አቃጥላ

VERSE 3
ለንሰሐ ጠራት ጌታ በገሊላ
ታድሳ ተነሳች በእንባዋ ብዛት
እግሩ ሥር ተደፍታ ማርያም መግደላዊት
አመጸኛው ልቤ ዛሬስ መች ይተኛል

VERSE 4
በኃጢአት በዝሙት በስርቆት ይዋኛል
ወደ ቀድሞ ግብሩ እዳይመለስ
ፍቅህ በእኔ ሰርጾ ኃጢአቴን ደምስስ
በደላችንን ሁሉ ሳታስብ ትተህ

VERSE 5
በምጽአት ሰዓት ከጻድቃን ቆጥረህ
ነጭ ልብስ ለብሰን ሆነን ከአንተ ጋራ
በሩ ሳይዘጋ አስገባን አደራ',
      lyrics_transliteration = 'Egziabher hoy erdagn chernet adrgeh (2)
Edme lenseha ende hizqyas set’teh
T’emamawn liben beqalh aqanteh
Alaqewm bilo sit’eyeq yamets’ew

VERSE 1
Doro eskich’oh dires sost gize yekadew
Yejret wenz new yeset’eኸw enba
P’et’ros tets’ets’to nisha endigeba
Ts’waw endaydersegn yeyhuda edl

VERSE 2
Lijh hono wilo hwala mekoblel
P’et’ros edlegnaw alqso temare
Betebitu yihuda endewet’a qere
Zemenwan bemulu bezmut aqat’la

VERSE 3
Lensehe t’erat Geta begelila
Tadsa tenesach beenbawa bizat
Egru sir tedefta Maryam megdelawit
Amets’egnaw libe zares mech yitegnal

VERSE 4
Behat’iat bezmut besrqot yiwagnal
Wede qedmo gibru edaymeles
Fiqh beene serts’o hat’iaten demss
Bedelachnn hulu satasb titeh

VERSE 5
Bemts’at seat kets’adqan qot’reh
Nech’ libs lebsen honen keante gara
Beru sayzega asgeban adera',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egziabger-hoy'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ /2/
እድሜ ለንሰሃ እንደ ሕዝቅያስ ሰጥተህ
ጠማማውን ልቤን በቃልህ አቃንተህ
አላቀውም ብሎ ሲጠየቅ ያመጸው

VERSE 1
ዶሮ እስኪጮህ ድረስ ሦስት ጊዜ የካደው
የጅረት ወንዝ ነው የሰጠኸው እንባ
ጴጥሮስ ተጸፅቶ ንስሃ እንዲገባ
ጽዋው እንዳይደርሰኝ የይሁዳ እድል

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ /2/
እድሜ ለንሰሃ እንደ ሕዝቅያስ ሰጥተህ
ጠማማውን ልቤን በቃልህ አቃንተህ
አላቀውም ብሎ ሲጠየቅ ያመጸው

VERSE 2
ልጅህ ሆኖ ውሎ ኋላ መኮብለል
ጴጥሮስ እድለኛው አልቅሶ ተማረ
በትዕቢቱ ይሁዳ እንደወጣ ቀረ
ዘመኗን በሙሉ በዝሙት አቃጥላ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ /2/
እድሜ ለንሰሃ እንደ ሕዝቅያስ ሰጥተህ
ጠማማውን ልቤን በቃልህ አቃንተህ
አላቀውም ብሎ ሲጠየቅ ያመጸው

VERSE 3
ለንሰሐ ጠራት ጌታ በገሊላ
ታድሳ ተነሳች በእንባዋ ብዛት
እግሩ ሥር ተደፍታ ማርያም መግደላዊት
አመጸኛው ልቤ ዛሬስ መች ይተኛል

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ /2/
እድሜ ለንሰሃ እንደ ሕዝቅያስ ሰጥተህ
ጠማማውን ልቤን በቃልህ አቃንተህ
አላቀውም ብሎ ሲጠየቅ ያመጸው

VERSE 4
በኃጢአት በዝሙት በስርቆት ይዋኛል
ወደ ቀድሞ ግብሩ እዳይመለስ
ፍቅህ በእኔ ሰርጾ ኃጢአቴን ደምስስ
በደላችንን ሁሉ ሳታስብ ትተህ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ /2/
እድሜ ለንሰሃ እንደ ሕዝቅያስ ሰጥተህ
ጠማማውን ልቤን በቃልህ አቃንተህ
አላቀውም ብሎ ሲጠየቅ ያመጸው

VERSE 5
በምጽአት ሰዓት ከጻድቃን ቆጥረህ
ነጭ ልብስ ለብሰን ሆነን ከአንተ ጋራ
በሩ ሳይዘጋ አስገባን አደራ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ /2/
እድሜ ለንሰሃ እንደ ሕዝቅያስ ሰጥተህ
ጠማማውን ልቤን በቃልህ አቃንተህ
አላቀውም ብሎ ሲጠየቅ ያመጸው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher hoy erdagn chernet adrgeh (2)
Edme lenseha ende hizqyas set’teh
T’emamawn liben beqalh aqanteh
Alaqewm bilo sit’eyeq yamets’ew

VERSE 1
Doro eskich’oh dires sost gize yekadew
Yejret wenz new yeset’eኸw enba
P’et’ros tets’ets’to nisha endigeba
Ts’waw endaydersegn yeyhuda edl

CHORUS
Egziabher hoy erdagn chernet adrgeh (2)
Edme lenseha ende hizqyas set’teh
T’emamawn liben beqalh aqanteh
Alaqewm bilo sit’eyeq yamets’ew

VERSE 2
Lijh hono wilo hwala mekoblel
P’et’ros edlegnaw alqso temare
Betebitu yihuda endewet’a qere
Zemenwan bemulu bezmut aqat’la

CHORUS
Egziabher hoy erdagn chernet adrgeh (2)
Edme lenseha ende hizqyas set’teh
T’emamawn liben beqalh aqanteh
Alaqewm bilo sit’eyeq yamets’ew

VERSE 3
Lensehe t’erat Geta begelila
Tadsa tenesach beenbawa bizat
Egru sir tedefta Maryam megdelawit
Amets’egnaw libe zares mech yitegnal

CHORUS
Egziabher hoy erdagn chernet adrgeh (2)
Edme lenseha ende hizqyas set’teh
T’emamawn liben beqalh aqanteh
Alaqewm bilo sit’eyeq yamets’ew

VERSE 4
Behat’iat bezmut besrqot yiwagnal
Wede qedmo gibru edaymeles
Fiqh beene serts’o hat’iaten demss
Bedelachnn hulu satasb titeh

CHORUS
Egziabher hoy erdagn chernet adrgeh (2)
Edme lenseha ende hizqyas set’teh
T’emamawn liben beqalh aqanteh
Alaqewm bilo sit’eyeq yamets’ew

VERSE 5
Bemts’at seat kets’adqan qot’reh
Nech’ libs lebsen honen keante gara
Beru sayzega asgeban adera

CHORUS
Egziabher hoy erdagn chernet adrgeh (2)
Edme lenseha ende hizqyas set’teh
T’emamawn liben beqalh aqanteh
Alaqewm bilo sit’eyeq yamets’ew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egziabger-hoy', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egziabher Hoy Erdagn (egziabher-hoy-erdagn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 1
ጠማማውን ልቤን በቃልህ አቃንተህ
አላውቀውም ብሎ ሲጠየቅ ያመጸው

VERSE 2
ዶሮ እስኪጮህ ድረስ ሶስት ጊዜ የካደው
የጅረት ወንዝ ነው የሰጠኸው እንባ
ጴጥሮስ ተጸጽቶ ንስሐ እንዲገባ

VERSE 3
ጽዋው እንዳይደርሰኝ የይሁዳ እድል
ልጅህ ሆኖ ውሎ ኃላ መኮብለል

VERSE 4
ጴጥሮስ እድለኛው አልቅሶ ተማረ
በትዕቢቱ ይሁዳ እንደወጣ ቀረ

VERSE 5
ዘመኗን በሙሉ በዝሙት አቃጥላ
በንስሐ ጠራት ጌታ በገሊላ

VERSE 6
ታድሳ ተነሳች በእንባዋ ብዛት
እግሩ ስር ተደፍታ ማርያም መግደላዊት

VERSE 7
አመጸኛው ልቤ ዛሬስ መቼ ይተኛል
በሃጢያት በዝሙት በስርቆት ይዋኛል

VERSE 8
ወደ ቀድሞ ግብሩ እንዳይመለስ
ፍቅርህ በእኔ ሰርጾ ሃጢያቴን ደምስስ

VERSE 9
በደላችን ሁሉ ሳታስብ ትተህ
በምጽአትህ ሰዓት ከጻድቃን ቆጥረህ

VERSE 10
ነጭ ልብስን ለብሰን ሆነን ካንተ ጋራ
በሩ ሳይዘጋ አስገባን አደራ',
      lyrics_transliteration = 'Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 1
T’amamawn libe beqalih aqanteh
Alawqewm blo sit’eyeq yameṣew

VERSE 2
Doro iski’choh deres sost gize yekadew
Yejeret wenz new yeset’teh enba
Petros tets’etsto nsiha endigeba

VERSE 3
Ts’ewaw endetayderesegn Yehuda edil
Lijh hono wlo hala meqobelel

VERSE 4
Petros edilgnaw alqso temare
Bet’ibiṭu Yehuda endeweta qere

VERSE 5
Zemenwan bemulu bezimut aqet’ela
Bensiha t’erat geta beGalila

VERSE 6
Tadsa tenesach beenbawa bizat
Egru sir tedifta Maryam Megdelawit

VERSE 7
Amets’egnaw libe zare meche yitenyal
Behatiyat bezimut besirqot yiwanal

VERSE 8
Wede qedemo gebru endetaymelis
Fiqrih bene serṭo hatiyate demesis

VERSE 9
Bedelachin hulu sat’asib titeh
Bemits’athih seat keTs’adqan qot’ereh

VERSE 10
Nech libs lenebsen honen kante gara
Beru sayizega asgebagn adera',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egziabher-hoy-erdagn'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egziabher-hoy-erdagn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egziabher Hoy Ewedehalew (egziabher-hoy-ewedehalew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 1
አለም ሁሉ በጠላኝ ጊዜ
ስንገላታ ይዞኝ ትካዜ
አንተ ከኔ አልተለየህም
እግዝአብሔር ሆይ ወደር የለህም (2)

VERSE 2
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 3
ሳዖል እኔን ሲያሳድደኝ
ጎልያድም ሲዝትብኝ
ግርማ ሆነህ ከፊቴ የቆምክ
እግዝአብሔር ሆይ ስምህ ይባረክ (2)

VERSE 4
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 5
ሞቷዋል ብለው ቀብረውኝ ሰዎች
ምስኪን ሁኜ ሳይኖረኝ አንዳች
ከመቃብር ቆፍሮ አወጣኝ
አይዞህ ብሎ አምላክ አፅናናኝ (2)

VERSE 6
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 7
ሐሳብህን በእግዝአብሔር ላይ ጣል
ለዘለዓለም ያበራልሃል
ታማኝ ወዳጅ እርሱ ነውና
ሰላም ይሙላህ ለእርሱ ተውና (2)

VERSE 8
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)',
      lyrics_transliteration = 'Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal

VERSE 1
Ende Egziabher keyet yigenyal (2)
Az
Alem hulu betelañ gize

VERSE 2
Sengelaṭa yizony tikaẓe
Ante kene alteleyehim

VERSE 3
Egziabher hoy weder yelehim (2)
Az
Sa’ul enen siasaddegñ

VERSE 4
Golyadim sizitibñ
Girma honeh kefite yekomik
Egziabher hoy simih yibarek (2)

VERSE 5
Az
Motwal bilew kebrewñ sewotch

VERSE 6
Misikin hunye sayinoreñ andach
Kemekabr qofro awetaññ
Ayzoḥ bilo Amlak aṭsñaññ (2)

VERSE 7
Az
Hasabihn beEgziabher lay ṭal
Lezele’ālem yaberahal

VERSE 8
Tamany abatih ersu newna
Selam bereket yersuh newna (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egziabher-hoy-ewedehalew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 1
አለም ሁሉ በጠላኝ ጊዜ
ስንገላታ ይዞኝ ትካዜ
አንተ ከኔ አልተለየህም
እግዝአብሔር ሆይ ወደር የለህም (2)

CHORUS
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 2
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

CHORUS
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 3
ሳዖል እኔን ሲያሳድደኝ
ጎልያድም ሲዝትብኝ
ግርማ ሆነህ ከፊቴ የቆምክ
እግዝአብሔር ሆይ ስምህ ይባረክ (2)

CHORUS
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 4
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

CHORUS
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 5
ሞቷዋል ብለው ቀብረውኝ ሰዎች
ምስኪን ሁኜ ሳይኖረኝ አንዳች
ከመቃብር ቆፍሮ አወጣኝ
አይዞህ ብሎ አምላክ አፅናናኝ (2)

CHORUS
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 6
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

CHORUS
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 7
ሐሳብህን በእግዝአብሔር ላይ ጣል
ለዘለዓለም ያበራልሃል
ታማኝ ወዳጅ እርሱ ነውና
ሰላም ይሙላህ ለእርሱ ተውና (2)

CHORUS
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

VERSE 8
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)

CHORUS
እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ እቃጠላለው
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዝአብሔር ከየት ይገኛል (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal

VERSE 1
Ende Egziabher keyet yigenyal (2)
Az
Alem hulu betelañ gize

CHORUS
Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal

VERSE 2
Sengelaṭa yizony tikaẓe
Ante kene alteleyehim

CHORUS
Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal

VERSE 3
Egziabher hoy weder yelehim (2)
Az
Sa’ul enen siasaddegñ

CHORUS
Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal

VERSE 4
Golyadim sizitibñ
Girma honeh kefite yekomik
Egziabher hoy simih yibarek (2)

CHORUS
Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal

VERSE 5
Az
Motwal bilew kebrewñ sewotch

CHORUS
Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal

VERSE 6
Misikin hunye sayinoreñ andach
Kemekabr qofro awetaññ
Ayzoḥ bilo Amlak aṭsñaññ (2)

CHORUS
Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal

VERSE 7
Az
Hasabihn beEgziabher lay ṭal
Lezele’ālem yaberahal

CHORUS
Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal

VERSE 8
Tamany abatih ersu newna
Selam bereket yersuh newna (2)

CHORUS
Egziabher hoy ewedehalew
Sile simih eqatalalew
Fikrih enen yimesṭeñal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egziabher-hoy-ewedehalew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egziabher Yimesgen Zemarit Fasika Mekonen (egziabher-yimesgen-zemarit-fasika-mekonen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር ይመስገን(4) ኧኸ
ለዚህ ያደረሰን(2) እግዚአብሔር ይመስገን

VERSE 1
ለልጆቹ እረኛ ነው በለምለም መስክ የሚያሰማራ
እኛም ተግተን የምንሰማው በኃያል ድምጽ ሲጣራ
በጽዮን ውብ ምስጋና በባዕድ ሀገር ባርኮናል
ልጆቹን አልተወንም ከክፉ ጠብቆናል

VERSE 2
የመከራውን ሌሊት አሳለፈን ያንን ቀን
ካሰብነውም ካላሰበነው ከልሎ እየጠበቀን
በኃዘንም በደስታ ሳይለይ ከእኛ ጋራ
ወደ ድሎ ሰገነት አወጣን እየመራ

VERSE 3
ይህንን ቀን ሰቶናል እንድንቆም ለምስጋና
በታላቅ ጉባኤ ፊት አሰባስቦናልና
በዘለዓለም ፍቅር ወዶን ከሞት ቀንበር ላስጣለን
ከምስጋና በስተቀር ምንስ እንከፍለዋለን

VERSE 4
ልዩ ለሆነው ዕለት አድርሶናል በደስታ
ስንወድቅ እያነሳ እየደገፈን ጌታ
መርቆናል በቤቱ የስኬት ቀን ነው ዛሬ
ለምስጋና ቆመናል እነሆ በዝማሬ

VERSE 5
የተገኘው ከእናቱ ጋር በቃና ዘገሊላ
ይኸው እኛም አይተናል ጉድለታችን ሲሞላ
በአንድነት አጽንቶ በጎ ዘመን ሊሰጠን
የታመነው እግዚአብሔር ለዚህ ቀን አደረሰን',
      lyrics_transliteration = 'Egziabher yemesgen (4) ኧኸ
Lezih yaderesen (2) Egziabher yemesgen

VERSE 1
Leljochu eregna new belemlem mesk yemiyasemara
Egnam tegten yemnsemaw behayal dimts’ sit’ara
Bets’yon wib misgana bebaed heger barkonal
Lijochun altewenm kekfu t’ebqonal

VERSE 2
Yemekerawn lelit asalefen yann qen
Kasebnewm kalasebenew kello eyet’ebeqen
Behazenm bedesta sayley keegna gara
Wede dilo segenet awet’an eyemera

VERSE 3
Yihnn qen setonal endnqom lemsgana
Betalaq gubae fit asebasbonalna
Bezelealem fiqr wedon kemot qenber last’alen
Kemsgana besteqer mins enkeflewalen

VERSE 4
Liyu lehonew elet adrsonal bedesta
Sinwedq eyanesa eyedegefen Geta
Merqonal bebetu yesket qen new zare
Lemsgana qomenal eneho bezmare

VERSE 5
Yetegegnew keenatu gar beqana zegelila
Yiኸw egnam aytenal gudletachn simola
Beandnet ats’nto bego zemen liset’en
Yetamenew Egziabher lezih qen aderesen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egziabher-yimesgen-zemarit-fasika-mekonen'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egziabher-yimesgen-zemarit-fasika-mekonen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egziabheren Terahut (egziabheren-terahut)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 1
የልመናዬን ድምጽ እርሱ ሰምቷልና
ጆሮውን ወደ እኔ አዘንብሏልና
በዘመኔ ሁሉ ስጠራው እኖራለሁ /2/

VERSE 2
ጎስቋላ ብሆንም ምስጋና አቀርባለሁ /2/

VERSE 3
እንደ ቃልህ መጓዝ መራመድ አቅቶኝ
የሃጢያት መንገድ ማዕበሉ ገፍቶኝ
ወደ እርሱ ስማጸን ደግሞ ስጸጸት /2/
አላሳፈረኝም መጣ በምህረት /2/

VERSE 4
ኖህን እንዳዳንከው እኛንም አድነን
ከቀስቱ እንድናመልጥ ምልክትን ስጠን

VERSE 5
በትርህ ምርኩዝህ እነሱ ያጽናኑኝ /2/
አንተ ከኔ ጋር ነህ አልፈራም ክፉውን /2/

VERSE 6
በበዛ ምህረቱ ያለፈውን ትቶ
በፍቅሩ ጎበኘኝ አልተወኝም ከቶ

VERSE 7
ሊቀበለኝ ወዶ ፊቱን አበራልኝ /2/
ማን ይቃወመኛል እግዚአብሔር ካለልኝ /2/',
      lyrics_transliteration = 'Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 1
Yelemenayen dimts ersu semtwalna
Jorown wede ené azembilwalna
Bezemené hulu sit’raw enoralew (x2)

VERSE 2
Goskwala bihonem misgana aqerbalew (x2)

VERSE 3
Ende qalih meguwaz meramed aqtoñ
Yehatiyat menged ma’ebalu geftoñ
Wede ersu simats’en degmo sits’etset (x2)
Alasaferegnim meta bemihret (x2)

VERSE 4
Nohn endadanekew enyanem adnen
Keqest’u endetamelit milikitin set’en

VERSE 5
Betrih mirkuzih enesu yats’nanugn (x2)
Ante kené gara neh alferam kifun (x2)

VERSE 6
Bebeza mihretu yalefewn t’ito
Befiqru gobegnegn alt’ewognim k’eto

VERSE 7
Liqebelégn wodo fitun aberalgn (x2)
Man yiqawemegn Egziabher kalelgn (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egziabheren-terahut'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 1
የልመናዬን ድምጽ እርሱ ሰምቷልና
ጆሮውን ወደ እኔ አዘንብሏልና
በዘመኔ ሁሉ ስጠራው እኖራለሁ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 2
ጎስቋላ ብሆንም ምስጋና አቀርባለሁ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 3
እንደ ቃልህ መጓዝ መራመድ አቅቶኝ
የሃጢያት መንገድ ማዕበሉ ገፍቶኝ
ወደ እርሱ ስማጸን ደግሞ ስጸጸት /2/
አላሳፈረኝም መጣ በምህረት /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 4
ኖህን እንዳዳንከው እኛንም አድነን
ከቀስቱ እንድናመልጥ ምልክትን ስጠን

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 5
በትርህ ምርኩዝህ እነሱ ያጽናኑኝ /2/
አንተ ከኔ ጋር ነህ አልፈራም ክፉውን /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 6
በበዛ ምህረቱ ያለፈውን ትቶ
በፍቅሩ ጎበኘኝ አልተወኝም ከቶ

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 7
ሊቀበለኝ ወዶ ፊቱን አበራልኝ /2/
ማን ይቃወመኛል እግዚአብሔር ካለልኝ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 1
Yelemenayen dimts ersu semtwalna
Jorown wede ené azembilwalna
Bezemené hulu sit’raw enoralew (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 2
Goskwala bihonem misgana aqerbalew (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 3
Ende qalih meguwaz meramed aqtoñ
Yehatiyat menged ma’ebalu geftoñ
Wede ersu simats’en degmo sits’etset (x2)
Alasaferegnim meta bemihret (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 4
Nohn endadanekew enyanem adnen
Keqest’u endetamelit milikitin set’en

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 5
Betrih mirkuzih enesu yats’nanugn (x2)
Ante kené gara neh alferam kifun (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 6
Bebeza mihretu yalefewn t’ito
Befiqru gobegnegn alt’ewognim k’eto

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 7
Liqebelégn wodo fitun aberalgn (x2)
Man yiqawemegn Egziabher kalelgn (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egziabheren-terahut', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Egziabherin Amesegnut (egziabherin-amesegnut)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 1
ሰማይን ያለምሰሶ ምድርንም ያለ መሰረት
ያጸናው እርሱ ነው ሥራህ ድንቅ ነው በሉት

VERSE 2
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 3
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 4
የባህርንም ጥልቀት የመጠነ
ዳርቻዋን የወሰነ
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት

VERSE 5
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 6
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 7
ማዕበል ንፋስ የሚገሥጽ
ፍጥረቱ ለስሙ የሚታዘዝ
ትጉህ እረኛ ድካም የሌለበት
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት

VERSE 8
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 9
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 10
ንጹሃ ባህርይ ነው ሁሉን የሚገዛ
የነገሥታት ንጉስ አልፋና ኦሜጋ
ዘለአለም እርሱ የማይለወጥ
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት

VERSE 11
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 12
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 13
ጥበብን የሚገልጥ ጥበበኛ
ፍርድ የሚያደርግ እውነተኛ ዳኛ
እንደርሱ ያለ ከቶ አይገኝም
እግዚአብሔር ግሩም ነው ዘለዓለም

VERSE 14
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪',
      lyrics_transliteration = 'Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 1
Yatsenaw ersu new, sirah dink new belut
Egziabherin amesegnut
Sirah girum dink new belut (2)

VERSE 2
Az
Egziabherin amesegnut
Sirah girum dink new belut (2)

VERSE 3
Yebahirin tilket, yametene
Darchawan yawesene
Egziabherin amesegnut

VERSE 4
Sirah girum dink new belut
Egziabherin amesegnut

VERSE 5
Sirah girum dink new belut (2)
Az
Egziabherin amesegnut

VERSE 6
Sirah girum dink new belut (2)
Ma’abel nefas yemigesets
Fiteratu lesmu yemitazez

VERSE 7
Tiguh erenya, dikam yalelabet
Egziabherin, sirah dink new belut
Egziabherin amesegnut

VERSE 8
Sirah girum dink new belut (2)
Az
Egziabherin amesegnut

VERSE 9
Sirah girum dink new belut (2)
Nitsuha bahiri new, hulun yemigeza

VERSE 10
Yanegestat nigus, Alpha ena Omega
Zelalem, ersu yamaylewot
Egziabherin, sirah dink new belut

VERSE 11
Egziabherin amesegnut
Sirah girum dink new belut (2)
Az

VERSE 12
Egziabherin amesegnut
Sirah girum dink new belut (2)
Tibebin yamigelt tibebegha

VERSE 13
Fird yemiaderg ewnetegna dagha
Endersu yale, keto aygeghim
Egziabher girum new, zelalem

VERSE 14
Egziabherin amesegnut
Sirah girum dink new belut (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'egziabherin-amesegnut'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 1
ሰማይን ያለምሰሶ ምድርንም ያለ መሰረት
ያጸናው እርሱ ነው ሥራህ ድንቅ ነው በሉት

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 2
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 3
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 4
የባህርንም ጥልቀት የመጠነ
ዳርቻዋን የወሰነ
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 5
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 6
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 7
ማዕበል ንፋስ የሚገሥጽ
ፍጥረቱ ለስሙ የሚታዘዝ
ትጉህ እረኛ ድካም የሌለበት
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 8
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 9
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 10
ንጹሃ ባህርይ ነው ሁሉን የሚገዛ
የነገሥታት ንጉስ አልፋና ኦሜጋ
ዘለአለም እርሱ የማይለወጥ
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 11
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 12
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 13
ጥበብን የሚገልጥ ጥበበኛ
ፍርድ የሚያደርግ እውነተኛ ዳኛ
እንደርሱ ያለ ከቶ አይገኝም
እግዚአብሔር ግሩም ነው ዘለዓለም

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

VERSE 14
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት ፪'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 1
Yatsenaw ersu new, sirah dink new belut
Egziabherin amesegnut
Sirah girum dink new belut (2)

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 2
Az
Egziabherin amesegnut
Sirah girum dink new belut (2)

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 3
Yebahirin tilket, yametene
Darchawan yawesene
Egziabherin amesegnut

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 4
Sirah girum dink new belut
Egziabherin amesegnut

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 5
Sirah girum dink new belut (2)
Az
Egziabherin amesegnut

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 6
Sirah girum dink new belut (2)
Ma’abel nefas yemigesets
Fiteratu lesmu yemitazez

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 7
Tiguh erenya, dikam yalelabet
Egziabherin, sirah dink new belut
Egziabherin amesegnut

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 8
Sirah girum dink new belut (2)
Az
Egziabherin amesegnut

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 9
Sirah girum dink new belut (2)
Nitsuha bahiri new, hulun yemigeza

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 10
Yanegestat nigus, Alpha ena Omega
Zelalem, ersu yamaylewot
Egziabherin, sirah dink new belut

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 11
Egziabherin amesegnut
Sirah girum dink new belut (2)
Az

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 12
Egziabherin amesegnut
Sirah girum dink new belut (2)
Tibebin yamigelt tibebegha

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 13
Fird yemiaderg ewnetegna dagha
Endersu yale, keto aygeghim
Egziabher girum new, zelalem

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret

VERSE 14
Egziabherin amesegnut
Sirah girum dink new belut (2)

CHORUS
Egziabherin amesegnut
Sirah girum dink new belut (2)
Semayin yalemeseso, midrinim yale meseret'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'egziabherin-amesegnut', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Elel Belu (elel-belu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
ዐይቶ ዝም ላለን ጠላቶቹ ሳለን
ውለታው ብዙ ነው ክብር ለእርሱ ይሁን /x2/

VERSE 2
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም
ምስጋና ይድረሰው ለመድኃኔዓለም /x2/

VERSE 3
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልጆች ብሎ በመስቀል የዋለ
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያት ወርዶ ሆነ ከእኛ ጋራ /x2/

VERSE 4
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /x2/',
      lyrics_transliteration = 'Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 1
Be-hatiat barnet sin-nor tegezten
Ke-betu sin-rik tizazun afrisen
Ayito zim lalen telatochu salen
Wuletaw bizu new kibir le-irsu yihun (x2)

VERSE 2
Rasun awardo ignan akiberen
Sigawn-na demun bilu tetu alen
Melkam eregna new yemiyasatan yelem
Misgana yidresew le-Medhane’alem (x2)

VERSE 3
Hiywotun yesewa ende amlak man ale
Le-sew lijoch bilo be-meskel yewale
Fikru ayileka ayalkim biwora
Ke-semayat werdo hone ke-igna gara (x2)

VERSE 4
Sirawn enadink indih le-wededen
Ke-mayalkew fikru bereket ladelen
Le-mayinegerew le-amlak sitota
Widase’n enakrib inzemir be-elelta (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'elel-belu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
ዐይቶ ዝም ላለን ጠላቶቹ ሳለን
ውለታው ብዙ ነው ክብር ለእርሱ ይሁን /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 2
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም
ምስጋና ይድረሰው ለመድኃኔዓለም /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 3
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልጆች ብሎ በመስቀል የዋለ
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያት ወርዶ ሆነ ከእኛ ጋራ /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 4
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 1
Be-hatiat barnet sin-nor tegezten
Ke-betu sin-rik tizazun afrisen
Ayito zim lalen telatochu salen
Wuletaw bizu new kibir le-irsu yihun (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 2
Rasun awardo ignan akiberen
Sigawn-na demun bilu tetu alen
Melkam eregna new yemiyasatan yelem
Misgana yidresew le-Medhane’alem (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 3
Hiywotun yesewa ende amlak man ale
Le-sew lijoch bilo be-meskel yewale
Fikru ayileka ayalkim biwora
Ke-semayat werdo hone ke-igna gara (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 4
Sirawn enadink indih le-wededen
Ke-mayalkew fikru bereket ladelen
Le-mayinegerew le-amlak sitota
Widase’n enakrib inzemir be-elelta (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'elel-belu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eleni Nigist Haseset Meskelu (eleni-nigist-haseset-meskelu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ዕሌኒ ንግሥት ሐሰሰት መስቀሎ (፪)
እንባቆም ነቢይ ዘአንከረ ግብሮ (፪)

VERSE 1
ዕሌኒ ንግሥት ሐሰሰት መስቀሎ (፪)
እንባቆም ነቢይ ዘአንከረ ግብሮ (፪)',
      lyrics_transliteration = 'Eleni nigist haseset meskelu (2)
Enbakom nebiye ze’ankere gibro (2)

VERSE 1
Eleni nigist haseset meskelu (2)
Enbakom nebiye ze’ankere gibro (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eleni-nigist-haseset-meskelu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዕሌኒ ንግሥት ሐሰሰት መስቀሎ (፪)
እንባቆም ነቢይ ዘአንከረ ግብሮ (፪)

VERSE 1
ዕሌኒ ንግሥት ሐሰሰት መስቀሎ (፪)
እንባቆም ነቢይ ዘአንከረ ግብሮ (፪)

CHORUS
ዕሌኒ ንግሥት ሐሰሰት መስቀሎ (፪)
እንባቆም ነቢይ ዘአንከረ ግብሮ (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eleni nigist haseset meskelu (2)
Enbakom nebiye ze’ankere gibro (2)

VERSE 1
Eleni nigist haseset meskelu (2)
Enbakom nebiye ze’ankere gibro (2)

CHORUS
Eleni nigist haseset meskelu (2)
Enbakom nebiye ze’ankere gibro (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eleni-nigist-haseset-meskelu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Elil Belu Beanidinet Zemiru (elil-belu-beanidinet-zemiru)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
አይቶ ዝም ላላለን ጠላቶቹ ስንሆን
ውለታው ብዙ ነው ክብር ለዕርሱ ይሁን/2/

VERSE 2
አ.ዝ //
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም

VERSE 3
ምስጋና ይድረሰው ለመድሐኔአለም/2/
አ.ዝ //
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልች ብሎ በመስቀል የዋለ

VERSE 4
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያትወርዶ ሆነ ከእኛ ጋራ/2/

VERSE 5
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /2/',
      lyrics_transliteration = 'Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 1
Behat’iyat barnet sinnor tegezten
Kebetu sinrq tiezazun afrsen
Ayto zim lalalen t’elatochu sinhon
Wiletaw bizu new kibir leersu yihun (2)

VERSE 2
A.z //
Rasun awardo egnan akeberen
Sigawna demun bilu t’et’u alen
Melkam eregna new yemiyasat’an yelem

VERSE 3
Misgana yidresew lemedhenealem (2)
A.z //
Hiywetun yesewa ende amlak man ale
Lesew lich bilo bemesqel yewale

VERSE 4
Fiqru ayleka ayalqm biwera
Kesemayatwerdo hone keegna gara (2)

VERSE 5
Sirawn enadnq endih lewededen
Kemayalqew fiqru bereket ladelen
Lemaynegerew leamlak sit’ota
Widasen enaqrb enzemr beellta (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'elil-belu-beanidinet-zemiru'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
አይቶ ዝም ላላለን ጠላቶቹ ስንሆን
ውለታው ብዙ ነው ክብር ለዕርሱ ይሁን/2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 2
አ.ዝ //
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 3
ምስጋና ይድረሰው ለመድሐኔአለም/2/
አ.ዝ //
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልች ብሎ በመስቀል የዋለ

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 4
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያትወርዶ ሆነ ከእኛ ጋራ/2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 5
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 1
Behat’iyat barnet sinnor tegezten
Kebetu sinrq tiezazun afrsen
Ayto zim lalalen t’elatochu sinhon
Wiletaw bizu new kibir leersu yihun (2)

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 2
A.z //
Rasun awardo egnan akeberen
Sigawna demun bilu t’et’u alen
Melkam eregna new yemiyasat’an yelem

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 3
Misgana yidresew lemedhenealem (2)
A.z //
Hiywetun yesewa ende amlak man ale
Lesew lich bilo bemesqel yewale

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 4
Fiqru ayleka ayalqm biwera
Kesemayatwerdo hone keegna gara (2)

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 5
Sirawn enadnq endih lewededen
Kemayalqew fiqru bereket ladelen
Lemaynegerew leamlak sit’ota
Widasen enaqrb enzemr beellta (2)

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'elil-belu-beanidinet-zemiru', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Elil Elil Elil (elil-elil-elil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እልል እልል እልል
ደስ ይበለን ሁላችን
አምላካችን መልካም አደረግልን
ደስም አለን የሠራዊት ጌታ ክበር ተመስገን

VERSE 1
ልመናን ይሰማል እልል
እግዚአብሔር ይረዳል እልል
ከመንገድ አንወድቅም እልል
እርሱ ይደግፈናል እልል

VERSE 2
ሰውና መላእክት እልል
በአንድነት ዘመሩ እልል
የአምላክ ትሕትና እልል
ለሰው ሆነ ክብሩ እልል

VERSE 3
እግዚአብሔር ከእኛ ጋር ነው …….. እልል
ማን ይቃወመናል ……… እልል
ማዕበሉም ጸጥ ይላል ……… እልል
እግዚአብሔር ከፍ ይላል ……. እልል

VERSE 4
እረኞቹ መጡ………… እልል
መላአክቱን አይተው …. እልል
ሰብአ ሰገል መጡ ……. እልል
በኮከብ ተመርተው ……. እልል

VERSE 5
ቆሜ ዘምሬያለሁ …… እልል
ጌታ ለልደትህ …… እልል
አቁመኝ በቀኝህ ….. እልል
በክብር በመንግሥትህ …… እልል',
      lyrics_transliteration = 'Ell ell ell
Des yibelen hulachn
Amlakachn melkam aderegln
Desm alen yeserawit Geta kiber temesgen

VERSE 1
Limenan yisemal ell
Egziabher yiredal ell
Kemenged anwedqm ell
Ersu yidegfenal ell

VERSE 2
Sewna melaekt ell
Beandnet zemeru ell
Yeamlak tihtna ell
Lesew hone kibru ell

VERSE 3
Egziabher keegna gar new …….. ell
Man yiqawemenal ……… ell
Maebelum ts’et’ yilal ……… ell
Egziabher kef yilal ……. ell

VERSE 4
Eregnochu met’u………… ell
Melaaktun aytew …. ell
Seba segel met’u ……. ell
Bekokeb temertew ……. ell

VERSE 5
Qome zemreyalehu …… ell
Geta leldeth …… ell
Aqumegn beqegnh ….. ell
Bekbr bemengsth …… ell',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'elil-elil-elil'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እልል እልል እልል
ደስ ይበለን ሁላችን
አምላካችን መልካም አደረግልን
ደስም አለን የሠራዊት ጌታ ክበር ተመስገን

VERSE 1
ልመናን ይሰማል እልል
እግዚአብሔር ይረዳል እልል
ከመንገድ አንወድቅም እልል
እርሱ ይደግፈናል እልል

CHORUS
እልል እልል እልል
ደስ ይበለን ሁላችን
አምላካችን መልካም አደረግልን
ደስም አለን የሠራዊት ጌታ ክበር ተመስገን

VERSE 2
ሰውና መላእክት እልል
በአንድነት ዘመሩ እልል
የአምላክ ትሕትና እልል
ለሰው ሆነ ክብሩ እልል

CHORUS
እልል እልል እልል
ደስ ይበለን ሁላችን
አምላካችን መልካም አደረግልን
ደስም አለን የሠራዊት ጌታ ክበር ተመስገን

VERSE 3
እግዚአብሔር ከእኛ ጋር ነው …….. እልል
ማን ይቃወመናል ……… እልል
ማዕበሉም ጸጥ ይላል ……… እልል
እግዚአብሔር ከፍ ይላል ……. እልል

CHORUS
እልል እልል እልል
ደስ ይበለን ሁላችን
አምላካችን መልካም አደረግልን
ደስም አለን የሠራዊት ጌታ ክበር ተመስገን

VERSE 4
እረኞቹ መጡ………… እልል
መላአክቱን አይተው …. እልል
ሰብአ ሰገል መጡ ……. እልል
በኮከብ ተመርተው ……. እልል

CHORUS
እልል እልል እልል
ደስ ይበለን ሁላችን
አምላካችን መልካም አደረግልን
ደስም አለን የሠራዊት ጌታ ክበር ተመስገን

VERSE 5
ቆሜ ዘምሬያለሁ …… እልል
ጌታ ለልደትህ …… እልል
አቁመኝ በቀኝህ ….. እልል
በክብር በመንግሥትህ …… እልል

CHORUS
እልል እልል እልል
ደስ ይበለን ሁላችን
አምላካችን መልካም አደረግልን
ደስም አለን የሠራዊት ጌታ ክበር ተመስገን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ell ell ell
Des yibelen hulachn
Amlakachn melkam aderegln
Desm alen yeserawit Geta kiber temesgen

VERSE 1
Limenan yisemal ell
Egziabher yiredal ell
Kemenged anwedqm ell
Ersu yidegfenal ell

CHORUS
Ell ell ell
Des yibelen hulachn
Amlakachn melkam aderegln
Desm alen yeserawit Geta kiber temesgen

VERSE 2
Sewna melaekt ell
Beandnet zemeru ell
Yeamlak tihtna ell
Lesew hone kibru ell

CHORUS
Ell ell ell
Des yibelen hulachn
Amlakachn melkam aderegln
Desm alen yeserawit Geta kiber temesgen

VERSE 3
Egziabher keegna gar new …….. ell
Man yiqawemenal ……… ell
Maebelum ts’et’ yilal ……… ell
Egziabher kef yilal ……. ell

CHORUS
Ell ell ell
Des yibelen hulachn
Amlakachn melkam aderegln
Desm alen yeserawit Geta kiber temesgen

VERSE 4
Eregnochu met’u………… ell
Melaaktun aytew …. ell
Seba segel met’u ……. ell
Bekokeb temertew ……. ell

CHORUS
Ell ell ell
Des yibelen hulachn
Amlakachn melkam aderegln
Desm alen yeserawit Geta kiber temesgen

VERSE 5
Qome zemreyalehu …… ell
Geta leldeth …… ell
Aqumegn beqegnh ….. ell
Bekbr bemengsth …… ell

CHORUS
Ell ell ell
Des yibelen hulachn
Amlakachn melkam aderegln
Desm alen yeserawit Geta kiber temesgen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'elil-elil-elil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ellil Ellil Enbel (ellil-ellil-enbel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 1
ደስታ ፈነጠቀ ብርሃን በሕይወታችን
የሰላሙ መሪ መሐሪ አምላካችን
መቃብር ሳይናድ መግነዝ ሳይፈታ
ተነሣ ከሙታን ኃያል የእኛ ጌታ

VERSE 2
አዝ…….

VERSE 3
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 4
ዓለም ሁሉ ይስማ የትንሣኤን ዜና
ኅዘን ተደምስሶ ሰላም ሰፍኗልና
ለነፍስ ለሥጋ የሆነ መድኃኒት
ሞትን አሸንፎ ተነሥቷል በሰንበት

VERSE 5
አዝ…….

VERSE 6
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 7
ይገባል እልልታ ይገባል ዝማሬ
ሰይጣን ተሸንፎ ደስታ ሆኗል ዛሬ
ይገባል እልልታ ይገባል ዝማሬ
ሰይጣን ተሸንፎ ደስታ ሆኗል ዛሬ

VERSE 8
አዝ…….

VERSE 9
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን',
      lyrics_transliteration = 'll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 1
yeselamu meri meheri emlakachn
meqabr saynad megnez sayfeta

VERSE 2
tenesa kemutan hayal yenya geta
ez…….

VERSE 3
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
alem hulu ysma yetnsaen zena

VERSE 4
hzen tedemsso selam seflna
lenefs lesga yehone medhanit

VERSE 5
motn eshenfo tenesl besenbet
ez…….

VERSE 6
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
ygebal llta ygebal zmare

VERSE 7
seytan teshenfo desta hol zare
ygebal llta ygebal zmare

VERSE 8
seytan teshenfo desta hol zare
ez…….

VERSE 9
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ellil-ellil-enbel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 1
ደስታ ፈነጠቀ ብርሃን በሕይወታችን
የሰላሙ መሪ መሐሪ አምላካችን
መቃብር ሳይናድ መግነዝ ሳይፈታ
ተነሣ ከሙታን ኃያል የእኛ ጌታ

CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 2
አዝ…….

CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 3
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 4
ዓለም ሁሉ ይስማ የትንሣኤን ዜና
ኅዘን ተደምስሶ ሰላም ሰፍኗልና
ለነፍስ ለሥጋ የሆነ መድኃኒት
ሞትን አሸንፎ ተነሥቷል በሰንበት

CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 5
አዝ…….

CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 6
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 7
ይገባል እልልታ ይገባል ዝማሬ
ሰይጣን ተሸንፎ ደስታ ሆኗል ዛሬ
ይገባል እልልታ ይገባል ዝማሬ
ሰይጣን ተሸንፎ ደስታ ሆኗል ዛሬ

CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 8
አዝ…….

CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

VERSE 9
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን

CHORUS
እልል(2) እንበል በአንድነት ሁላችን
የሙታን በኩር ሆኖ ተነስቷል ጌታችን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 1
yeselamu meri meheri emlakachn
meqabr saynad megnez sayfeta

CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 2
tenesa kemutan hayal yenya geta
ez…….

CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 3
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
alem hulu ysma yetnsaen zena

CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 4
hzen tedemsso selam seflna
lenefs lesga yehone medhanit

CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 5
motn eshenfo tenesl besenbet
ez…….

CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 6
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
ygebal llta ygebal zmare

CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 7
seytan teshenfo desta hol zare
ygebal llta ygebal zmare

CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 8
seytan teshenfo desta hol zare
ez…….

CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn

VERSE 9
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn

CHORUS
ll(2) nbel beendnet hulachn
yemutan bekur hono tenesl getachn
desta feneteqe brhan behywetachn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ellil-ellil-enbel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Em Afe Deqiq (em-afe-deqiq)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እም አፈ ደቂቅ ወሕፃናት አስተዳሎከ ስብሐተ (፪)
በእንተ ጸላዒ (፬) ከመ ትንሥቶ ለጸላዒ ወለገፋኢ (፪)

VERSE 1
እም አፈ ደቂቅ ወሕፃናት አስተዳሎከ ስብሐተ (፪)
በእንተ ጸላዒ (፬) ከመ ትንሥቶ ለጸላዒ ወለገፋኢ (፪)',
      lyrics_transliteration = 'em āfe dekīki weḥit͟sanat āsitedaloke sibiḥāte (2)
benite tselaī (4) keme tinisito letselaī welegefaī (2)

VERSE 1
em āfe dekīki weḥit͟sanat āsitedaloke sibiḥāte (2)
benite tselaī (4) keme tinisito letselaī welegefaī (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'em-afe-deqiq'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እም አፈ ደቂቅ ወሕፃናት አስተዳሎከ ስብሐተ (፪)
በእንተ ጸላዒ (፬) ከመ ትንሥቶ ለጸላዒ ወለገፋኢ (፪)

VERSE 1
እም አፈ ደቂቅ ወሕፃናት አስተዳሎከ ስብሐተ (፪)
በእንተ ጸላዒ (፬) ከመ ትንሥቶ ለጸላዒ ወለገፋኢ (፪)

CHORUS
እም አፈ ደቂቅ ወሕፃናት አስተዳሎከ ስብሐተ (፪)
በእንተ ጸላዒ (፬) ከመ ትንሥቶ ለጸላዒ ወለገፋኢ (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
em āfe dekīki weḥit͟sanat āsitedaloke sibiḥāte (2)
benite tselaī (4) keme tinisito letselaī welegefaī (2)

VERSE 1
em āfe dekīki weḥit͟sanat āsitedaloke sibiḥāte (2)
benite tselaī (4) keme tinisito letselaī welegefaī (2)

CHORUS
em āfe dekīki weḥit͟sanat āsitedaloke sibiḥāte (2)
benite tselaī (4) keme tinisito letselaī welegefaī (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'em-afe-deqiq', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eme Amlak Asbign Be-Serk (eme-amlak-asbign-be-serk)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 1
ሃዘኔ ጭንቀቴ በጣም በዛብኝ
ከልጅሽ አማልጅኝ አንቺው አስታርቂኝ
ከመንበሩ ቆመሽ ንገሪው ለልጅሽ
እናቱ ነሽና እሱ አያሳፍርሽ

VERSE 2
እመ አምላክ (2) አስቢኝ በሰርክ

VERSE 3
እኔ ኃጥያተኛው በደሌን አውቃለው
ምርኩዜ ነሽና እከተልሻለው
መንገዱ ጠፍቶብኝ የጽድቁ ጎዳና
መብራቱን አብሪልኝ እመጣለሁና

VERSE 4
እመ አምላክ (2) አስቢኝ በሰርክ

VERSE 5
መመገብ ይቅርብኝ አልራብምና
ስምሽን ስጠራ እጠግባለውና
አበው ሊቃውንቱ በአንቺ ይመካሉ
እመ አምላክ እያሉ ስምሽን ይጠራሉ

VERSE 6
እመ አምላክ (2) አስቢኝ በሰርክ

VERSE 7
ከገሃነም አውጭኝ ከዚያ ነበልባል
ከሲዖል ወድቄ እንዳልቃጠል
ያ የስቃይ ሃገር ባህሩ ያሰጥመኛል
አንቺ ከለመንሽው ልጅሽ ያዝንልኛል

VERSE 8
እመ አምላክ (2) አስቢኝ በሰርክ

VERSE 9
ወገን አታድርጊኝ ከሲዖል ከተማ
መድረሻ ያሳጣኝ የእሳቱ ጨልማ
አወድስሸለው በ ኤፍሬም ውዳሴ
ሁኝልኝ ጠበቃ አደራ ለነፍሴ

VERSE 10
እመ አምላክ (2) አስቢኝ በሰርክ

VERSE 11
እኔስ እፈራለው ምግባሬን ሳየው
ደካማው እምነቴ እየለየኝ ነው
አልረሳሽም ድንግል እማጸንሻለው
አማላጅነትሸ መድኅን ነው አውቃለው

VERSE 12
እመ አምላክ (2) አስቢኝ በሰርክ',
      lyrics_transliteration = 'Eme Amlak (2)
Asbiggn be-serk

VERSE 1
Hazene chinqete betam bezabign
Ke-lijish amaljign anchiew astarqign
Ke-menberu qomesh nigeriew le-lijish
Enatu neshina esu ayasafrish

VERSE 2
Eme Amlak (2) Asbiggn be-serk

VERSE 3
Enie hatyategnaw bedelien awqalew
Mirkuzie neshina eketeleshalew
Mengedu teftobign ye-tsidqu godana
Mebratun abrilign emetallie-huna

VERSE 4
Eme Amlak (2) Asbiggn be-serk

VERSE 5
Memegeb yiqribign alrabimina
Simishin sitera etegballiew-na
Abew liqawuntu banchi yimekkallu
Eme Amlak eyallu simishin yiterallu

VERSE 6
Eme Amlak (2) Asbiggn be-serk

VERSE 7
Ke-gehanem awchign ke-ziya nebelbal
Ke-siol wodqie endal-qatel
Ya ye-siqay hager bahru yasetmegnal
Anchi ke-lemen-shiw lijish yaznilignal

VERSE 8
Eme Amlak (2) Asbiggn be-serk

VERSE 9
Wegen atadrigign ke-siol ketema
Medresha yasatagn ye-esatu chelema
Awedisash-alew be-Ephrem Widdasie
Hugnilign tebeqa adera le-nefsie

VERSE 10
Eme Amlak (2) Asbiggn be-serk

VERSE 11
Enies eferalliew migbarien sayiew
Dekamaw emnietie eye-leyegn niew
Al-resashim Dingel ematsenishalew
Amalajinetish medhin niew awqalew

VERSE 12
Eme Amlak (2) Asbiggn be-serk',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eme-amlak-asbign-be-serk'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 1
ሃዘኔ ጭንቀቴ በጣም በዛብኝ
ከልጅሽ አማልጅኝ አንቺው አስታርቂኝ
ከመንበሩ ቆመሽ ንገሪው ለልጅሽ
እናቱ ነሽና እሱ አያሳፍርሽ

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 2
እመ አምላክ (2) አስቢኝ በሰርክ

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 3
እኔ ኃጥያተኛው በደሌን አውቃለው
ምርኩዜ ነሽና እከተልሻለው
መንገዱ ጠፍቶብኝ የጽድቁ ጎዳና
መብራቱን አብሪልኝ እመጣለሁና

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 4
እመ አምላክ (2) አስቢኝ በሰርክ

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 5
መመገብ ይቅርብኝ አልራብምና
ስምሽን ስጠራ እጠግባለውና
አበው ሊቃውንቱ በአንቺ ይመካሉ
እመ አምላክ እያሉ ስምሽን ይጠራሉ

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 6
እመ አምላክ (2) አስቢኝ በሰርክ

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 7
ከገሃነም አውጭኝ ከዚያ ነበልባል
ከሲዖል ወድቄ እንዳልቃጠል
ያ የስቃይ ሃገር ባህሩ ያሰጥመኛል
አንቺ ከለመንሽው ልጅሽ ያዝንልኛል

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 8
እመ አምላክ (2) አስቢኝ በሰርክ

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 9
ወገን አታድርጊኝ ከሲዖል ከተማ
መድረሻ ያሳጣኝ የእሳቱ ጨልማ
አወድስሸለው በ ኤፍሬም ውዳሴ
ሁኝልኝ ጠበቃ አደራ ለነፍሴ

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 10
እመ አምላክ (2) አስቢኝ በሰርክ

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 11
እኔስ እፈራለው ምግባሬን ሳየው
ደካማው እምነቴ እየለየኝ ነው
አልረሳሽም ድንግል እማጸንሻለው
አማላጅነትሸ መድኅን ነው አውቃለው

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ

VERSE 12
እመ አምላክ (2) አስቢኝ በሰርክ

CHORUS
እመ አምላክ (2)
አስቢኝ በሰርክ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 1
Hazene chinqete betam bezabign
Ke-lijish amaljign anchiew astarqign
Ke-menberu qomesh nigeriew le-lijish
Enatu neshina esu ayasafrish

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 2
Eme Amlak (2) Asbiggn be-serk

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 3
Enie hatyategnaw bedelien awqalew
Mirkuzie neshina eketeleshalew
Mengedu teftobign ye-tsidqu godana
Mebratun abrilign emetallie-huna

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 4
Eme Amlak (2) Asbiggn be-serk

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 5
Memegeb yiqribign alrabimina
Simishin sitera etegballiew-na
Abew liqawuntu banchi yimekkallu
Eme Amlak eyallu simishin yiterallu

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 6
Eme Amlak (2) Asbiggn be-serk

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 7
Ke-gehanem awchign ke-ziya nebelbal
Ke-siol wodqie endal-qatel
Ya ye-siqay hager bahru yasetmegnal
Anchi ke-lemen-shiw lijish yaznilignal

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 8
Eme Amlak (2) Asbiggn be-serk

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 9
Wegen atadrigign ke-siol ketema
Medresha yasatagn ye-esatu chelema
Awedisash-alew be-Ephrem Widdasie
Hugnilign tebeqa adera le-nefsie

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 10
Eme Amlak (2) Asbiggn be-serk

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 11
Enies eferalliew migbarien sayiew
Dekamaw emnietie eye-leyegn niew
Al-resashim Dingel ematsenishalew
Amalajinetish medhin niew awqalew

CHORUS
Eme Amlak (2)
Asbiggn be-serk

VERSE 12
Eme Amlak (2) Asbiggn be-serk

CHORUS
Eme Amlak (2)
Asbiggn be-serk'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eme-amlak-asbign-be-serk', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emebetachin Banchi Milja (emebetachin-banchi-milja-bemaye-qana)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 1
ለጌታችን ተዓምር በማየ ቃና
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና

VERSE 2
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

VERSE 3
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 4
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና
ሁሉ አዩ ሰሙ በማየ ቃና

VERSE 5
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

VERSE 6
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 7
አሳላፊዎቹ በማየ ቃና
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና

VERSE 8
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

VERSE 9
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 10
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና
ሁሉ እንደሚቀና በማየ ቃና

VERSE 11
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

VERSE 12
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2',
      lyrics_transliteration = 'mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 1
legetachn teamr bemaye qana
temerta tadla bemaye qana
mejemeriya honech bemaye qana

VERSE 2
qana zegelila bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

VERSE 3
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 4
tawt slalechw bemaye qana
weynke elbomu bemaye qana
wha weyn sihon bemaye qana

VERSE 5
hulu eyu semu bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

VERSE 6
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 7
esalafiwochu bemaye qana
gra bigebachew bemaye qana
yedngl maryam lj bemaye qana

VERSE 8
kechnq ewetachew bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

VERSE 9
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 10
nyam namnalen bemaye qana
ber tnblna bemaye qana
sle qalkida bemaye qana

VERSE 11
hulu ndemiqena bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

VERSE 12
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emebetachin-banchi-milja-bemaye-qana'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 1
ለጌታችን ተዓምር በማየ ቃና
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 2
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 3
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 4
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና
ሁሉ አዩ ሰሙ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 5
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 6
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 7
አሳላፊዎቹ በማየ ቃና
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 8
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 9
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 10
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና
ሁሉ እንደሚቀና በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 11
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 12
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 1
legetachn teamr bemaye qana
temerta tadla bemaye qana
mejemeriya honech bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 2
qana zegelila bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 3
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 4
tawt slalechw bemaye qana
weynke elbomu bemaye qana
wha weyn sihon bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 5
hulu eyu semu bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 6
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 7
esalafiwochu bemaye qana
gra bigebachew bemaye qana
yedngl maryam lj bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 8
kechnq ewetachew bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 9
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 10
nyam namnalen bemaye qana
ber tnblna bemaye qana
sle qalkida bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 11
hulu ndemiqena bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 12
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emebetachin-banchi-milja-bemaye-qana', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emebetachin Banichi Milija (emebetachin-banichi-milija)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ',
      lyrics_transliteration = 'Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emebetachin-banichi-milija'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emebetachin-banichi-milija', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emebetachin Beanichi Milija (emebetachin-beanichi-milija)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ',
      lyrics_transliteration = 'Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emebetachin-beanichi-milija'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emebetachin-beanichi-milija', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emebetachin Mariam (emebetachin-mariam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመቤታችን ማርያም
ሀገራችንን ጠብቂልን በምልጃሽ
እመቤታችን ማርያም
ኢትዮጵያን ጠብቂልን በምልጃሽ

VERSE 1
ከጠላት ሰይጣን ከከሀዲያን
ከጠላት ሰይጣን ሰዉረሽ
እንድትጠብቂን በምልጃሽ',
      lyrics_transliteration = 'Emebetachen Maryam
Hegerachnn t’ebqiln bemljash
Emebetachen Maryam
Ityop’yan t’ebqiln bemljash

VERSE 1
Ket’elat seyt’an kekehediyan
Ket’elat seyt’an sewuresh
Endtt’ebqin bemljash',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emebetachin-mariam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ማርያም
ሀገራችንን ጠብቂልን በምልጃሽ
እመቤታችን ማርያም
ኢትዮጵያን ጠብቂልን በምልጃሽ

VERSE 1
ከጠላት ሰይጣን ከከሀዲያን
ከጠላት ሰይጣን ሰዉረሽ
እንድትጠብቂን በምልጃሽ

CHORUS
እመቤታችን ማርያም
ሀገራችንን ጠብቂልን በምልጃሽ
እመቤታችን ማርያም
ኢትዮጵያን ጠብቂልን በምልጃሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebetachen Maryam
Hegerachnn t’ebqiln bemljash
Emebetachen Maryam
Ityop’yan t’ebqiln bemljash

VERSE 1
Ket’elat seyt’an kekehediyan
Ket’elat seyt’an sewuresh
Endtt’ebqin bemljash

CHORUS
Emebetachen Maryam
Hegerachnn t’ebqiln bemljash
Emebetachen Maryam
Ityop’yan t’ebqiln bemljash'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emebetachin-mariam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emebete Mariam Elemneshalew (emebete-mariam-elemneshalew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 1
ሐዘኔን ጭንቀቴን ለማን እነግራለው
ችግሬን ጉዳቴን ለማን አዋያለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 2
ሐዘኑ በዛብኝ ፈተናው ከበደኝ
እንደምን ልቻለው እኔስ ብቻዬን ነኝ
የዐማኑኤል እናት ፈጥነሽ ድረሽልኝ /2/

VERSE 3
በጣም ተንገዳገድከ ልወድቅ ነው እኔ
እመ አምላክ ደግፊኝ ቁሚልኝ ከጎኔ
ምንም አጋር የለኝ ከአንቺ በቀር ለእኔ /2/',
      lyrics_transliteration = 'Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 1
Hazenen Chinketen Leman Enegralehu
Chigren Gudaten Leman Awayalehu
Emebete semign Tematsegnalew /2/

VERSE 2
Hazenu Bezabgn Fetanaw Kebedegn
Endemen Lichalew Enes bichayen negn
Yeamanuel Enat Fetinesh Dereshilegn /2/

VERSE 3
Betam Tengedagedkugn Lewedik new ene
Eme Amlak Degefegn kumilegn keGone
Menem Ager Yelegnem Keanchi Beker lene /2/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emebete-mariam-elemneshalew'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emebete-mariam-elemneshalew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emebete Mariyam Emebete (emebete-mariyam-emebete)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 1
ሁሉንም የሚችል ያለ በአርያም
የአምላክ ማደሪያ ድንግል ማርያም
ጌታ የመረጠሽ እስከ ዘላለም /2/
ላንቺ ሊያስተላልፍ ገብርኤል ሰላሞታ

VERSE 2
ከንጉሥ ተልኮ ከሠራዊት ጌታ
ሰላም ላንቺ ይሁን ብሎ ያበሠረሽ
እመቤቴ ማርያም ምስጋና ይድረስሽ /2/
የምድር ባለጸጎች ሲማልሉ ፊትሽ

VERSE 3
የሰማይ መላእክት ምስጋና ያቅርቡልሽ
አሕዛብ ይንበርከኩ ለኃያሉ ልጅሽ
ክብር ይገባሻል በእናትነትሽ /2/',
      lyrics_transliteration = 'Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 1
Hulunm yemichl yale bearyam
Yeamlak maderiya Dingil Maryam
Geta yemeret’esh eske zelalem (2)
Lanchi liyastelalf Gebriel selamota

VERSE 2
Kengus telko keserawit Geta
Selam lanchi yihun bilo yabeseresh
Emebete Maryam misgana yidressh (2)
Yemdr balets’egoch simallu fitsh

VERSE 3
Yesemay melaekt misgana yaqrbulsh
Ahzab yinberkeku lehayalu lijsh
Kibir yigebashal beenatnetsh (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emebete-mariyam-emebete'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 1
ሁሉንም የሚችል ያለ በአርያም
የአምላክ ማደሪያ ድንግል ማርያም
ጌታ የመረጠሽ እስከ ዘላለም /2/
ላንቺ ሊያስተላልፍ ገብርኤል ሰላሞታ

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 2
ከንጉሥ ተልኮ ከሠራዊት ጌታ
ሰላም ላንቺ ይሁን ብሎ ያበሠረሽ
እመቤቴ ማርያም ምስጋና ይድረስሽ /2/
የምድር ባለጸጎች ሲማልሉ ፊትሽ

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 3
የሰማይ መላእክት ምስጋና ያቅርቡልሽ
አሕዛብ ይንበርከኩ ለኃያሉ ልጅሽ
ክብር ይገባሻል በእናትነትሽ /2/

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 1
Hulunm yemichl yale bearyam
Yeamlak maderiya Dingil Maryam
Geta yemeret’esh eske zelalem (2)
Lanchi liyastelalf Gebriel selamota

CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 2
Kengus telko keserawit Geta
Selam lanchi yihun bilo yabeseresh
Emebete Maryam misgana yidressh (2)
Yemdr balets’egoch simallu fitsh

CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 3
Yesemay melaekt misgana yaqrbulsh
Ahzab yinberkeku lehayalu lijsh
Kibir yigebashal beenatnetsh (2)

CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emebete-mariyam-emebete', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emebete Yamlak Enat (emebete-yamlek-enat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመቤቴ የአምላክ እናት ላመስግንሽ ቀን ከሌሊት
ለልጅሽም ክብር ውዳሴ ታቀርባለች ዘወትር ነፍሴ (2)

VERSE 1
ልቤ ተነሳሳ ተቀኘ ለክብርሽ
በፍጹም ትህትና ሊያመሰግንሽ
ጽዮን መጠጊያ ነሽ የአብርሃም ድንኳን
የታጠረች ተክል እመ ብዙሃን

VERSE 2
የለመለመች መስክ አምላክ የመረጣት
የጽላቱ ኪዳን ታቦቱ ድንግል ናት
የሰማይ የምድር ንግሥት ናትና
ክብር ይገባታል ዘወትር ጠዋት ማታ

VERSE 3
አደራሽን ማርያም የሁሉ እናት
በምልጃሽ አስቢኝ ኋላ ስራቆት
ያንን የእሳት ባሕር አሻግርኝ ድንግል ሆይ
እንዳልወድቅ እንዳልሞት ከቶ እንዳላይ ስቃይ',
      lyrics_transliteration = 'Emebete yamlak enat lamesignish ken kelelit
Lelijishim kibir widase takeribalech zewetir nefse (2)

VERSE 1
Libe tenesasa tekenye lekibirish
Befitsum tihitina liyamesegenish
Tsiyon metegiya nesh yeabrham dinkwan
Yetaterech tekl eme bezuhan

VERSE 2
Yelemelemeche mesk amlak yemeretat
Yetsilatu kidan tabotu dingil nat
Yesemay yemidir nigist natina
Kibir yigebatal zewetir tewat mata

VERSE 3
Aderashin Mariyam yehulu enat
Bemeljash asibign hwala sirakot
Yanin yeisat bahir ashagirign dingil hoy
Endalwedik endalmot keto endalay sikay',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emebete-yamlek-enat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ የአምላክ እናት ላመስግንሽ ቀን ከሌሊት
ለልጅሽም ክብር ውዳሴ ታቀርባለች ዘወትር ነፍሴ (2)

VERSE 1
ልቤ ተነሳሳ ተቀኘ ለክብርሽ
በፍጹም ትህትና ሊያመሰግንሽ
ጽዮን መጠጊያ ነሽ የአብርሃም ድንኳን
የታጠረች ተክል እመ ብዙሃን

CHORUS
እመቤቴ የአምላክ እናት ላመስግንሽ ቀን ከሌሊት
ለልጅሽም ክብር ውዳሴ ታቀርባለች ዘወትር ነፍሴ (2)

VERSE 2
የለመለመች መስክ አምላክ የመረጣት
የጽላቱ ኪዳን ታቦቱ ድንግል ናት
የሰማይ የምድር ንግሥት ናትና
ክብር ይገባታል ዘወትር ጠዋት ማታ

CHORUS
እመቤቴ የአምላክ እናት ላመስግንሽ ቀን ከሌሊት
ለልጅሽም ክብር ውዳሴ ታቀርባለች ዘወትር ነፍሴ (2)

VERSE 3
አደራሽን ማርያም የሁሉ እናት
በምልጃሽ አስቢኝ ኋላ ስራቆት
ያንን የእሳት ባሕር አሻግርኝ ድንግል ሆይ
እንዳልወድቅ እንዳልሞት ከቶ እንዳላይ ስቃይ

CHORUS
እመቤቴ የአምላክ እናት ላመስግንሽ ቀን ከሌሊት
ለልጅሽም ክብር ውዳሴ ታቀርባለች ዘወትር ነፍሴ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebete yamlak enat lamesignish ken kelelit
Lelijishim kibir widase takeribalech zewetir nefse (2)

VERSE 1
Libe tenesasa tekenye lekibirish
Befitsum tihitina liyamesegenish
Tsiyon metegiya nesh yeabrham dinkwan
Yetaterech tekl eme bezuhan

CHORUS
Emebete yamlak enat lamesignish ken kelelit
Lelijishim kibir widase takeribalech zewetir nefse (2)

VERSE 2
Yelemelemeche mesk amlak yemeretat
Yetsilatu kidan tabotu dingil nat
Yesemay yemidir nigist natina
Kibir yigebatal zewetir tewat mata

CHORUS
Emebete yamlak enat lamesignish ken kelelit
Lelijishim kibir widase takeribalech zewetir nefse (2)

VERSE 3
Aderashin Mariyam yehulu enat
Bemeljash asibign hwala sirakot
Yanin yeisat bahir ashagirign dingil hoy
Endalwedik endalmot keto endalay sikay

CHORUS
Emebete yamlak enat lamesignish ken kelelit
Lelijishim kibir widase takeribalech zewetir nefse (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emebete-yamlek-enat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emebete Zarem Barikign (emebete-zarem-barikign)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 1
ጸሎቴን እያሳረግሽ ልመናዬን ስትሰሚ
ከጎኔ ሳትለይ ተቆጠሩ ዘመናት
ይሀዉ ለዝህ ደረስኩኝ ከእናትም በላይ ሆነሽ እናት
እዝ።።።።።።።

VERSE 2
በጎጆዬ ስላለሽ መጉደልን አላዉቅም
የአንደበቴ ቃንቃ ነዉ እናቴ ያንቺ ስም
ሰንደቄና አርማየ የኔ መታወቂያ ነሽ
ከእግረ መስቀሉ ሥር ቀራንዮ ላይ ያገኘሁሽ

VERSE 3
እዝ።።።።።።።
ፈዉስን የቀዳሁብሽ የበረከት አዘቅት
ለዝህ ቀን የደረስኩት ሆነሽኝ ነዉ ብርታት
ስንቱን አለፍኩት ባንቺ ወጣሁ ስንቱን ተራራ

VERSE 4
መከታ ጋሻየ ነሽ የከሳሹን ቀስት እንዳልፈራ
እዝ።።።።።።።
ጌታየን ከእቅፍሽ ፍቅርን ከመቅደስሽን
ትህትናን ተምሬያለዉ ፍደሌ ስለሆንሽ

VERSE 5
ከቶ ነግቶ አይመሽም ለዉዳሴሽ ሳልቆም
ብዙ ነዉ ምስጥራችን የኔ እና ያንች ማርያም
እዝ።።።።።',
      lyrics_transliteration = 'And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 1
Ts’eloten eyasaregsh limenayen sitsemi
Kegone satley teqot’eru zemenat
Yihewu lezh dereskugn keenatm belay honesh enat
Ez.......

VERSE 2
Begojoye silalesh megudeln alawuqm
Yeandebete qanqa newu enate yanchi sim
Sendeqena armaye yene metaweqiya nesh
Keegre mesqelu sir qeranyo lay yagegnehush

VERSE 3
Ez.......
Fewusn yeqedahubsh yebereket azeqt
Lezh qen yedereskut honeshgn newu birtat
Sintun alefkut banchi wet’ahu sintun terara

VERSE 4
Meketa gashaye nesh yekesashun qest endalfera
Ez.......
Getayen keeqfsh fiqrn kemeqdesshn
Tihtnan temreyalewu fidele silehonsh

VERSE 5
Keto negto aymeshm lewudasesh salqom
Bizu newu mist’rachn yene ena yanch Maryam
Ez.....',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emebete-zarem-barikign'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 1
ጸሎቴን እያሳረግሽ ልመናዬን ስትሰሚ
ከጎኔ ሳትለይ ተቆጠሩ ዘመናት
ይሀዉ ለዝህ ደረስኩኝ ከእናትም በላይ ሆነሽ እናት
እዝ።።።።።።።

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 2
በጎጆዬ ስላለሽ መጉደልን አላዉቅም
የአንደበቴ ቃንቃ ነዉ እናቴ ያንቺ ስም
ሰንደቄና አርማየ የኔ መታወቂያ ነሽ
ከእግረ መስቀሉ ሥር ቀራንዮ ላይ ያገኘሁሽ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 3
እዝ።።።።።።።
ፈዉስን የቀዳሁብሽ የበረከት አዘቅት
ለዝህ ቀን የደረስኩት ሆነሽኝ ነዉ ብርታት
ስንቱን አለፍኩት ባንቺ ወጣሁ ስንቱን ተራራ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 4
መከታ ጋሻየ ነሽ የከሳሹን ቀስት እንዳልፈራ
እዝ።።።።።።።
ጌታየን ከእቅፍሽ ፍቅርን ከመቅደስሽን
ትህትናን ተምሬያለዉ ፍደሌ ስለሆንሽ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 5
ከቶ ነግቶ አይመሽም ለዉዳሴሽ ሳልቆም
ብዙ ነዉ ምስጥራችን የኔ እና ያንች ማርያም
እዝ።።።።።

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 1
Ts’eloten eyasaregsh limenayen sitsemi
Kegone satley teqot’eru zemenat
Yihewu lezh dereskugn keenatm belay honesh enat
Ez.......

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 2
Begojoye silalesh megudeln alawuqm
Yeandebete qanqa newu enate yanchi sim
Sendeqena armaye yene metaweqiya nesh
Keegre mesqelu sir qeranyo lay yagegnehush

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 3
Ez.......
Fewusn yeqedahubsh yebereket azeqt
Lezh qen yedereskut honeshgn newu birtat
Sintun alefkut banchi wet’ahu sintun terara

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 4
Meketa gashaye nesh yekesashun qest endalfera
Ez.......
Getayen keeqfsh fiqrn kemeqdesshn
Tihtnan temreyalewu fidele silehonsh

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 5
Keto negto aymeshm lewudasesh salqom
Bizu newu mist’rachn yene ena yanch Maryam
Ez.....

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emebete-zarem-barikign', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emikebikabe Welida Ledinigil (emikebikabe-welida-ledinigil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 1
ኧ
እምከብካበ
ወልዳ ለድንግል (2)
ቃለ አብ ህያው የመረጠሽ

VERSE 2
በተዋህዶ ያደረብሽ
አማናዊት ፂሆን ማርያም አንቺ ነሽ
ማህደረ መለኮት ድንግል አንቺ ነሽ
ረቂቅ ቃልየተፃፈብሽ

VERSE 3
ድህነታችን የታወጀብሽ
ህትምት ሰሌዳ ንፅሂት አንቺ ነሽ
የኪዳሉ ፅላት ብፅሂት አንቺ ነሽ(2)
ሙሽራሽ ሆነ ቸሩ ልጅሽ

VERSE 4
ስጋችንን ነስቶከስጋሽ
በመርገመ ሀጥያት ስንቆሽሽ
ህይወትን አደለን ሆነልን ፈዋሽ
ንግስተ ሰማይ በመሆንሽ

VERSE 5
ባለሟልነትን ስለታደልሽ
ከሰርጉ እንዳይለየን ቅዱሱ ልጅሽ
ተማፅነንብሻል እኛ ልጆችሽ',
      lyrics_transliteration = 'Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 1
ኧ
Emkebkabe
Welda ledngl (2)
Qale Ab hiyaw yemeret’esh

VERSE 2
Betewahdo yaderebsh
Amanawit ts’ihon Maryam anchi nesh
Mahdere melekot Dingil anchi nesh
Reqiq qalyetets’afebsh

VERSE 3
Dihnetachn yetawejebsh
Hitmt seleda nits’hit anchi nesh
Yekidalu ts’lat bits’hit anchi nesh (2)
Mushrash hone cheru lijsh

VERSE 4
Sigachnn nestokesgash
Bemergeme het’yat sinqoshsh
Hiywetn adelen honeln fewash
Nigste semay bemehonsh

VERSE 5
Balemwalnetn siletadelsh
Kesergu endayleyen qidusu lijsh
Temats’nenbshal egna lijochsh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emikebikabe-welida-ledinigil'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 1
ኧ
እምከብካበ
ወልዳ ለድንግል (2)
ቃለ አብ ህያው የመረጠሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 2
በተዋህዶ ያደረብሽ
አማናዊት ፂሆን ማርያም አንቺ ነሽ
ማህደረ መለኮት ድንግል አንቺ ነሽ
ረቂቅ ቃልየተፃፈብሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 3
ድህነታችን የታወጀብሽ
ህትምት ሰሌዳ ንፅሂት አንቺ ነሽ
የኪዳሉ ፅላት ብፅሂት አንቺ ነሽ(2)
ሙሽራሽ ሆነ ቸሩ ልጅሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 4
ስጋችንን ነስቶከስጋሽ
በመርገመ ሀጥያት ስንቆሽሽ
ህይወትን አደለን ሆነልን ፈዋሽ
ንግስተ ሰማይ በመሆንሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 5
ባለሟልነትን ስለታደልሽ
ከሰርጉ እንዳይለየን ቅዱሱ ልጅሽ
ተማፅነንብሻል እኛ ልጆችሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 1
ኧ
Emkebkabe
Welda ledngl (2)
Qale Ab hiyaw yemeret’esh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 2
Betewahdo yaderebsh
Amanawit ts’ihon Maryam anchi nesh
Mahdere melekot Dingil anchi nesh
Reqiq qalyetets’afebsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 3
Dihnetachn yetawejebsh
Hitmt seleda nits’hit anchi nesh
Yekidalu ts’lat bits’hit anchi nesh (2)
Mushrash hone cheru lijsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 4
Sigachnn nestokesgash
Bemergeme het’yat sinqoshsh
Hiywetn adelen honeln fewash
Nigste semay bemehonsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 5
Balemwalnetn siletadelsh
Kesergu endayleyen qidusu lijsh
Temats’nenbshal egna lijochsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emikebikabe-welida-ledinigil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emmanuel (emmanuel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማኑኤል ይቅር ባይነው ፍቅር
ምህረት ከቦት በሰማያት ቢኖር
እያመመዉ አባቱንን የጠራ
አይቻለዉ ለሚገድሉት ሲራራ

VERSE 1
አማኑኤል ይቅር ባይነው ፍቅር
ምህረት ከቦት በሰማያት ቢኖር
እያመመዉ አባቱንን የጠራ
አይቻለዉ ለሚገድሉት ሲራራ',
      lyrics_transliteration = 'Amanuel yiqir baynew fiqir
Mihret kebot besemayat binor

VERSE 1
Eyammemew abatun yenetara
Ayichalew lemigedlut sirara',
      lyrics_english = 'Emmanuel He’s loving and forgiving
Fenced by mercy in Heaven He is dwelling
Calling upon His Father while He’s in pain
Those who nailed Him to the Cross He didn’t blame

VERSE 1
Believe that He is merciful for He is not a ruthless king
His sanctified and precious Blood will cleanse us from sin endlessly
With a grand wave of divine grace the Earth has been filled and flooded
His mercy as His source of strength from death we have been protected

VERSE 2
The God who enlightened the dark for brighter days He paved the way
His spear of love pierces us all without it we are left astray
Trials we passed with victory overcoming all with Jesus
Our sins have been covered by Christ the Lord who died for all of us

VERSE 3
There’s not a single sin greater than our Lord’s eternal love
We shouldn’t fear or hesitate to reunite with God above
The heavens as our homeland no one will fall or be ignored
For it is our inheritance by the Holy Blood of our Lord

VERSE 4
In all the heavens and the Earth no one shows His dedication
His Holy name is Jesus Christ with Him He brought us affection
Above the grave He has risen His love left the world astonished
On His shoulders He carried us the children that He had cherished

VERSE 5
Emmanuel He’s loving and forgiving
Fenced by mercy in Heaven He is dwelling
Calling upon His Father while He’s in pain
Those who nailed Him to the Cross He didn’t blame',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emmanuel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማኑኤል ይቅር ባይነው ፍቅር
ምህረት ከቦት በሰማያት ቢኖር
እያመመዉ አባቱንን የጠራ
አይቻለዉ ለሚገድሉት ሲራራ

VERSE 1
አማኑኤል ይቅር ባይነው ፍቅር
ምህረት ከቦት በሰማያት ቢኖር
እያመመዉ አባቱንን የጠራ
አይቻለዉ ለሚገድሉት ሲራራ

CHORUS
አማኑኤል ይቅር ባይነው ፍቅር
ምህረት ከቦት በሰማያት ቢኖር
እያመመዉ አባቱንን የጠራ
አይቻለዉ ለሚገድሉት ሲራራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amanuel yiqir baynew fiqir
Mihret kebot besemayat binor

VERSE 1
Eyammemew abatun yenetara
Ayichalew lemigedlut sirara

CHORUS
Amanuel yiqir baynew fiqir
Mihret kebot besemayat binor'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Emmanuel He’s loving and forgiving
Fenced by mercy in Heaven He is dwelling
Calling upon His Father while He’s in pain
Those who nailed Him to the Cross He didn’t blame

VERSE 1
Believe that He is merciful for He is not a ruthless king
His sanctified and precious Blood will cleanse us from sin endlessly
With a grand wave of divine grace the Earth has been filled and flooded
His mercy as His source of strength from death we have been protected

CHORUS
Emmanuel He’s loving and forgiving
Fenced by mercy in Heaven He is dwelling
Calling upon His Father while He’s in pain
Those who nailed Him to the Cross He didn’t blame

VERSE 2
The God who enlightened the dark for brighter days He paved the way
His spear of love pierces us all without it we are left astray
Trials we passed with victory overcoming all with Jesus
Our sins have been covered by Christ the Lord who died for all of us

CHORUS
Emmanuel He’s loving and forgiving
Fenced by mercy in Heaven He is dwelling
Calling upon His Father while He’s in pain
Those who nailed Him to the Cross He didn’t blame

VERSE 3
There’s not a single sin greater than our Lord’s eternal love
We shouldn’t fear or hesitate to reunite with God above
The heavens as our homeland no one will fall or be ignored
For it is our inheritance by the Holy Blood of our Lord

CHORUS
Emmanuel He’s loving and forgiving
Fenced by mercy in Heaven He is dwelling
Calling upon His Father while He’s in pain
Those who nailed Him to the Cross He didn’t blame

VERSE 4
In all the heavens and the Earth no one shows His dedication
His Holy name is Jesus Christ with Him He brought us affection
Above the grave He has risen His love left the world astonished
On His shoulders He carried us the children that He had cherished

CHORUS
Emmanuel He’s loving and forgiving
Fenced by mercy in Heaven He is dwelling
Calling upon His Father while He’s in pain
Those who nailed Him to the Cross He didn’t blame

VERSE 5
Emmanuel He’s loving and forgiving
Fenced by mercy in Heaven He is dwelling
Calling upon His Father while He’s in pain
Those who nailed Him to the Cross He didn’t blame

CHORUS
Emmanuel He’s loving and forgiving
Fenced by mercy in Heaven He is dwelling
Calling upon His Father while He’s in pain
Those who nailed Him to the Cross He didn’t blame'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emmanuel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emnet Kab Msmae''ya (emnet-kab-msmae-ya)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 1
ብጽኑዕ ኣብ ልበይ ግዲ ዘይሰፈረ ትጥዑም ብስራት
ክንዲ ዝዓርፈሉ ኣሻቡ ይጠፍእ ይጎድለኒ እምነት
ሰሚዑ ዝርስዕ ጸላኢ ዝሰርቆ ኮይነ ከይተርፍ
ደጊምካ ኣንቅሓኒ ጎይታ መንፈስቅዱስ ንድኻመይ ደግፍ

VERSE 2
እምነት ካብ ምስማዕ''ያ
ቃልካ ምስ ሰማዕኩ ዋኒነይ ገዲፈ ንቤትካ ይጠብቆ
ግን ድማ ኣይጸንሕን ሓልዮት ናይ''ዛ ስጋይ ንልበይ ይሓንቆ
ነቲ ሓዲግ ጌሩ ንድሕሪት ዝጎተኒ ፍርሒ ናይ መጻኢ

VERSE 3
ስዒረ ክወጽእ ኣዒንተይ ክፈተን ጸጋኻ ክርኢ
እምነት ካብ ምስማዕ''ያ
ጽን ኢለ ክሰምዖ ሓጎስ ይወረኒ ነቲ ዝተባህለ
ሽግር ምስ መጸ ግን ጸኒዐ ኣይጸንዕን ካብ ስፍራይ ይእለ

VERSE 4
ሕጂ ግን እምነተይ ሱሩ ንኽድልድል ምትባዕ ኣላምዶ
ክእመን ንስምካ ወትሩ ንኽእውጅ ኣብ ኩሉ ዝኸዶ
እምነት ካብ ምስማዕ''ያ
ከምቶም ዝተናእዱ ናይ ምድሓኖም ወንጌል ብህድኣት ዝሰምዑ

VERSE 5
ኣብቲ ዱዃ ልቦሙ ሚእቲ ዝፈረየ ትቃል ተዘሪኡ
ኣነ ውን ከምኣቶም ንዓካ ዘኽብር ንኽርከበኒ
እነኹ ኣብቅድሜኻ ንነብሰይ የቅርባ ብቃልካ ስርሓኒ
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ

VERSE 6
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ',
      lyrics_transliteration = 'Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 1
Bits’nue ab libey gidi zeysefere tit’um bisrat
Kindi ziarfelu ashabu yit’efe yigodleni emnet
Semiu zirse ts’elai ziserqo koyne keyterf
Degimka anqhani goyta Menfes Kidus nidኻmey degf

VERSE 2
Emnet kab mismae''ya
Qalka mis semaeku waniney gedife nibetka yit’ebqo
Gin dima ayts’enhn halyot nay''za sigay nilbey yihanqo
Neti hadig geru nidhrit zigoteni firhi nay mets’ai

VERSE 3
Siire kiwets’e aintey kifeten ts’egaኻ kiri
Emnet kab mismae''ya
Ts’n ile kisemo hagos yiwereni neti zitebahle
Shgr mis mets’e gin ts’enia ayts’enen kab sifray yiele

VERSE 4
Hiji gin emnetey suru niኽdldl mitbae alamdo
Kiemen nismka wetru niኽewj ab kulu ziኸdo
Emnet kab mismae''ya
Kemtom zitenaedu nay midhanom wengel bihdat zisemu

VERSE 5
Abti dukhwa libomu mieti zifereye tiqal tezeriu
Ane win kematom niaka zeኽbr niኽrkebeni
Eneኹ abqdmeኻ ninebsey yeqrba biqalka sirhani
Emnet kab mismae''ya mismae win biqal nay Kristos

VERSE 6
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emnet-kab-msmae-ya'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 1
ብጽኑዕ ኣብ ልበይ ግዲ ዘይሰፈረ ትጥዑም ብስራት
ክንዲ ዝዓርፈሉ ኣሻቡ ይጠፍእ ይጎድለኒ እምነት
ሰሚዑ ዝርስዕ ጸላኢ ዝሰርቆ ኮይነ ከይተርፍ
ደጊምካ ኣንቅሓኒ ጎይታ መንፈስቅዱስ ንድኻመይ ደግፍ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 2
እምነት ካብ ምስማዕ''ያ
ቃልካ ምስ ሰማዕኩ ዋኒነይ ገዲፈ ንቤትካ ይጠብቆ
ግን ድማ ኣይጸንሕን ሓልዮት ናይ''ዛ ስጋይ ንልበይ ይሓንቆ
ነቲ ሓዲግ ጌሩ ንድሕሪት ዝጎተኒ ፍርሒ ናይ መጻኢ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 3
ስዒረ ክወጽእ ኣዒንተይ ክፈተን ጸጋኻ ክርኢ
እምነት ካብ ምስማዕ''ያ
ጽን ኢለ ክሰምዖ ሓጎስ ይወረኒ ነቲ ዝተባህለ
ሽግር ምስ መጸ ግን ጸኒዐ ኣይጸንዕን ካብ ስፍራይ ይእለ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 4
ሕጂ ግን እምነተይ ሱሩ ንኽድልድል ምትባዕ ኣላምዶ
ክእመን ንስምካ ወትሩ ንኽእውጅ ኣብ ኩሉ ዝኸዶ
እምነት ካብ ምስማዕ''ያ
ከምቶም ዝተናእዱ ናይ ምድሓኖም ወንጌል ብህድኣት ዝሰምዑ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 5
ኣብቲ ዱዃ ልቦሙ ሚእቲ ዝፈረየ ትቃል ተዘሪኡ
ኣነ ውን ከምኣቶም ንዓካ ዘኽብር ንኽርከበኒ
እነኹ ኣብቅድሜኻ ንነብሰይ የቅርባ ብቃልካ ስርሓኒ
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 6
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 1
Bits’nue ab libey gidi zeysefere tit’um bisrat
Kindi ziarfelu ashabu yit’efe yigodleni emnet
Semiu zirse ts’elai ziserqo koyne keyterf
Degimka anqhani goyta Menfes Kidus nidኻmey degf

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 2
Emnet kab mismae''ya
Qalka mis semaeku waniney gedife nibetka yit’ebqo
Gin dima ayts’enhn halyot nay''za sigay nilbey yihanqo
Neti hadig geru nidhrit zigoteni firhi nay mets’ai

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 3
Siire kiwets’e aintey kifeten ts’egaኻ kiri
Emnet kab mismae''ya
Ts’n ile kisemo hagos yiwereni neti zitebahle
Shgr mis mets’e gin ts’enia ayts’enen kab sifray yiele

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 4
Hiji gin emnetey suru niኽdldl mitbae alamdo
Kiemen nismka wetru niኽewj ab kulu ziኸdo
Emnet kab mismae''ya
Kemtom zitenaedu nay midhanom wengel bihdat zisemu

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 5
Abti dukhwa libomu mieti zifereye tiqal tezeriu
Ane win kematom niaka zeኽbr niኽrkebeni
Eneኹ abqdmeኻ ninebsey yeqrba biqalka sirhani
Emnet kab mismae''ya mismae win biqal nay Kristos

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 6
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emnet-kab-msmae-ya', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ~Emun Arki Lbey~By Zemari Henok Fikadu~ Eritrean Orthodox Tewahdo Mezmur (emun-arki-lbey-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 1
ፍቕሩ ገሊጹለይ፡ ''ዛ ሕይወቱ ሂቡ፡
ዘየዳሉ አምላክ፡ ሓዳግ''ዩ ንዅሉ፡
ክብሉኻ ሰሚዐስ፡ ብለይቲ መጺአ''ሎኹ፡
ረቡኒ መሃረኒ፡ ''ቲ ናይ ሰማይ ሃብቲ፡ ከመይ ከም ምዃኑ፡

VERSE 2
ድነ ጸልማት ኰይኑ፡ ጕዕዞ ናይ ሕይወተይ፡
''ዛ ልበይ ኪህበካስ፡ ብርሃነይ ኩነኒ፡ ኢየሱስ ንጉሠይ።
ንናተይ ዕዳ፡ ንስኻ ክትከፍሎ፡
ንአበሳይ፡ ኣብ ዝባንካ ክትጾሮ፡

VERSE 3
ብዓይነይ ርእየ''የ፡ ኣብቲ ቀራንዮ፡.
ፍቕርኻ ኪትገልጽ፡ ንሞተይ ሞይትካዮ፡
ኣዝ
ካባኻ ብምህዳመይ፡ ትእዛዝካ ጥሒሰ፡

VERSE 4
ኣብዛ ቅድሚ ዓይነይ፡ ይሰቕሉኻ''ዶ ኢለ፡
ፍቱወይ በዲለካ፡ ግብረይ ኣሕፊሩኒ፡ ኣነስ ተጣዒሰ፡
ምሕረቱ ዘይውዳእ፡ አቦ ፍቕሪ ኢኻ''ሞ፡
ገስጸኒ እምበር፡ ኣይትመንነኒ፡ ኪዳንካ ዘክሮ፡

VERSE 5
ንናተይ ዕዳ፡ ንስኻ ክትከፍሎ፡
ንአበሳይ፡ ኣብ ዝባንካ ክትጾሮ፡
ብዓይነይ ርእየ''የ፡ ኣብቲ ቀራንዮ፡
ፍቕርኻ ክትገልጽ ንሞተይ ሞትካዮ

VERSE 6
ኣዝ
ንኽረኽበካ ኢለ፡ ክንደይ ዲየ ደይበ፡
''ሰንኪ ሕጽረት ግብረይ፡ ክርእየካ ከመይ''ለ፡
ኣብ ጫውጫውታ ህዝቢ፡ ንድምጸይ ትሰምዖ፡ ተቕልበለይ''ዶ ኢለ፡

VERSE 7
ድሌት ውሽጢ ልበይ፡ እትፈልጥ ልብኻ፡
ምሳይ''ያ ዘምሰየት፡ ምድኃን ውሽጢ ቤተይ፡ ንኽትመልስ ኢላ።
እዚ ዋና ልበይ፡ ክንደይ የፍቅረኒ፡
ዓቀብ ቍልቍል፡ ወሪዱ መጺኡኒ

VERSE 8
ውሽጢ ቤተይ ኣምስዩስ፡ ምሳይ እንክድረር፡
ዓጊበ''የ በቃ፡ ርእየ ''ዚ ተአምር።',
      lyrics_transliteration = 'Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 1
Fiቕru gelits’uley ''za hiywetu hibu
Zeyedalu amlak hadag''yu nikhwlu
Kibluኻ semias bileyti mets’ia''loኹ
Rebuni mehareni ''ti nay semay habti kemey kem mikhwanu

VERSE 2
Dine ts’elmat kweynu gwezo nay hiywetey
''za libey kihbekas birhaney kuneni Iyesus nigusey.
Ninatey eda nisኻ kitkeflo
Niabesay ab zibanka kitts’oro

VERSE 3
Biayney rieye''ye abti qeranyo .
Fiቕrኻ kitgelts’ nimotey moytkayo
Az
Kabaኻ bimhdamey tiezazka t’hise

VERSE 4
Abza qidmi ayney yiseቕluኻ''do ile
Fituwey bedileka gibrey ahfiruni anes tet’aise
Mihretu zeywdae abo fiቕri iኻ''mo
Gests’eni ember aytmenneni kidanka zekro

VERSE 5
Ninatey eda nisኻ kitkeflo
Niabesay ab zibanka kitts’oro
Biayney rieye''ye abti qeranyo
Fiቕrኻ kitgelts’ nimotey motkayo

VERSE 6
Az
Niኽreኽbeka ile kindey diye deybe
''senki hits’ret gibrey kireyeka kemey''le
Ab ch’awch’awta hizbi nidmts’ey tisemo teቕlbeley''do ile

VERSE 7
Dilet wisht’i libey etfelt’ libኻ
Misay''ya zemseyet midhan wisht’i betey niኽtmels ila.
Ezi wana libey kindey yefqreni
Aqeb qwlqwl weridu mets’iuni

VERSE 8
Wisht’i betey amsyus misay enkdrer
Agibe''ye beqa rieye ''zi teamr.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emun-arki-lbey-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emun-arki-lbey-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Emun eka (emun-eka)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 1
ጎይታይ ንቅዱስ ስምካ
ማይ"""""""""""""''''''''''''''''''''''
ኪንዮ ርዲኢተይ
እሙን ኢኻ ጎይታይ

VERSE 2
ዘይተቀየርካ''ኳ
ክትቅይር ዓለመይ
መገደይ ሓርየ ምስ ኣሕዘንኩኻ
ብዝኸዶ ይጥፋኣ ማዓስ እሞ ኢልካ

VERSE 3
ዝባነይ ሂበካ ክምዘይ ሓጣእኩ
ብጸጋኻ እንዴ ሎሚ ዘለኹ
ማይ" """""''''''''''''''''''''''''''''''''''''''''''''''''''''''''
ምንም ኣብ ዘይብለይ

VERSE 4
ንስኻ ኣሎኻኒ
ኢደይ እንተመልእ ውን
ኣብኻ ነይበልጸኒ
ልዕሊ ዛነብሰይ እትሓልየለይ

VERSE 5
ኣቦ ዘልኣለም ክለኻ ምሳይ
ይኣምነካ እምበር ከመይ ዘይኣምን
ገባሪ ጽቡቅ ሰብ''ኳ ይእመን',
      lyrics_transliteration = 'Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 1
Goytay niqdus simka
May"""""""""""""''''''''''''''''''''''
Kinyo ridiitey
Emun iኻ goytay

VERSE 2
Zeyteqeyerka''kwa
Kitqyr alemey
Megedey harye mis ahzenkuኻ
Bizኸdo yit’faa maas emo ilka

VERSE 3
Zibaney hibeka kimzey hat’aeku
Bits’egaኻ ende lomi zeleኹ
May" """""''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Minm ab zeybley

VERSE 4
Nisኻ aloኻni
Idey entemele win
Abኻ neybelts’eni
Lieli zanebsey ethalyeley

VERSE 5
Abo zelalem kileኻ misay
Yiamneka ember kemey zeyamn
Gebari ts’buq seb''kwa yiemen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'emun-eka'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 1
ጎይታይ ንቅዱስ ስምካ
ማይ"""""""""""""''''''''''''''''''''''
ኪንዮ ርዲኢተይ
እሙን ኢኻ ጎይታይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 2
ዘይተቀየርካ''ኳ
ክትቅይር ዓለመይ
መገደይ ሓርየ ምስ ኣሕዘንኩኻ
ብዝኸዶ ይጥፋኣ ማዓስ እሞ ኢልካ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 3
ዝባነይ ሂበካ ክምዘይ ሓጣእኩ
ብጸጋኻ እንዴ ሎሚ ዘለኹ
ማይ" """""''''''''''''''''''''''''''''''''''''''''''''''''''''''''
ምንም ኣብ ዘይብለይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 4
ንስኻ ኣሎኻኒ
ኢደይ እንተመልእ ውን
ኣብኻ ነይበልጸኒ
ልዕሊ ዛነብሰይ እትሓልየለይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 5
ኣቦ ዘልኣለም ክለኻ ምሳይ
ይኣምነካ እምበር ከመይ ዘይኣምን
ገባሪ ጽቡቅ ሰብ''ኳ ይእመን

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 1
Goytay niqdus simka
May"""""""""""""''''''''''''''''''''''
Kinyo ridiitey
Emun iኻ goytay

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 2
Zeyteqeyerka''kwa
Kitqyr alemey
Megedey harye mis ahzenkuኻ
Bizኸdo yit’faa maas emo ilka

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 3
Zibaney hibeka kimzey hat’aeku
Bits’egaኻ ende lomi zeleኹ
May" """""''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Minm ab zeybley

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 4
Nisኻ aloኻni
Idey entemele win
Abኻ neybelts’eni
Lieli zanebsey ethalyeley

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 5
Abo zelalem kileኻ misay
Yiamneka ember kemey zeyamn
Gebari ts’buq seb''kwa yiemen

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'emun-eka', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enamesegnihalen (enamesegnihalen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 1
ለአምላክ ወዳሴ ለፈጣሪ ክብር
ማለዳ ተነስተን ምስጋና ስንጀምር
የአባቶች ዝማሬ ቅኔ መወድሱ
ሲሰማ ደስ ይላል ከቤተመቅደሱ

VERSE 2
ሥረአተ ሰማይ በምድር ተሰርቶ
በአባቶች ልቦና የአምላክ ጥበብ መልቶ
ዝማሬ ፈለቀ ከታለቁ መቅደስ
በጥዑመ ዜማ ፈጣሪ ሊወደስ

VERSE 3
ድምፁ ቀስቀሰን ከቅዱስ ታራራ
የያሬድ ፅናፅል መስንቆ በገና
የፅዮን ደናግል ለመዝሙር ተነሱ
ሥሉስ ቅዱስ በሉ ስሙን አወድሱ

VERSE 4
ማህሌቱ ሲቆም ሰዓታት መዝሙሩ
ቅዱሳን መላእክት አብረው ሲዘምሩ
ፍፁም ተመሰጠች ነፍሳችን በደስታ
ለምስጋና ስንቆም ከቅዱሳን ተርታ',
      lyrics_transliteration = 'Enamesegnhalen
Enamesegnhalen (2)
Ende abatochachn bemahlet ent’erehalen
Ende qidusanu lekbrh enzemralen

VERSE 1
Leamlak wedase lefet’ari kibir
Maleda tenesten misgana sinjemr
Yeabatoch zimare qine mewedsu
Sisema des yilal kebetemeqdesu

VERSE 2
Sireate semay bemdr teserto
Beabatoch libona yeamlak t’beb melto
Zimare feleqe ketalequ meqdes
Bet’ume zema fet’ari liwedes

VERSE 3
Dimts’u qesqesen keqdus tarara
Yeyared ts’nats’l mesnqo begena
Yets’yon denagl lemezmur tenesu
Silus Kidus belu simun awedsu

VERSE 4
Mahletu siqom seatat mezmuru
Kidusan melaekt abrew sizemru
Fits’um temeset’ech nefsachn bedesta
Lemsgana sinqom keqdusan terta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enamesegnihalen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 1
ለአምላክ ወዳሴ ለፈጣሪ ክብር
ማለዳ ተነስተን ምስጋና ስንጀምር
የአባቶች ዝማሬ ቅኔ መወድሱ
ሲሰማ ደስ ይላል ከቤተመቅደሱ

CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 2
ሥረአተ ሰማይ በምድር ተሰርቶ
በአባቶች ልቦና የአምላክ ጥበብ መልቶ
ዝማሬ ፈለቀ ከታለቁ መቅደስ
በጥዑመ ዜማ ፈጣሪ ሊወደስ

CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 3
ድምፁ ቀስቀሰን ከቅዱስ ታራራ
የያሬድ ፅናፅል መስንቆ በገና
የፅዮን ደናግል ለመዝሙር ተነሱ
ሥሉስ ቅዱስ በሉ ስሙን አወድሱ

CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 4
ማህሌቱ ሲቆም ሰዓታት መዝሙሩ
ቅዱሳን መላእክት አብረው ሲዘምሩ
ፍፁም ተመሰጠች ነፍሳችን በደስታ
ለምስጋና ስንቆም ከቅዱሳን ተርታ

CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatochachn bemahlet ent’erehalen
Ende qidusanu lekbrh enzemralen

VERSE 1
Leamlak wedase lefet’ari kibir
Maleda tenesten misgana sinjemr
Yeabatoch zimare qine mewedsu
Sisema des yilal kebetemeqdesu

CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatochachn bemahlet ent’erehalen
Ende qidusanu lekbrh enzemralen

VERSE 2
Sireate semay bemdr teserto
Beabatoch libona yeamlak t’beb melto
Zimare feleqe ketalequ meqdes
Bet’ume zema fet’ari liwedes

CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatochachn bemahlet ent’erehalen
Ende qidusanu lekbrh enzemralen

VERSE 3
Dimts’u qesqesen keqdus tarara
Yeyared ts’nats’l mesnqo begena
Yets’yon denagl lemezmur tenesu
Silus Kidus belu simun awedsu

CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatochachn bemahlet ent’erehalen
Ende qidusanu lekbrh enzemralen

VERSE 4
Mahletu siqom seatat mezmuru
Kidusan melaekt abrew sizemru
Fits’um temeset’ech nefsachn bedesta
Lemsgana sinqom keqdusan terta

CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatochachn bemahlet ent’erehalen
Ende qidusanu lekbrh enzemralen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enamesegnihalen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enat Alegn Kidane Mihiret (enat-alegn-kidane-mihiret)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እናት አለኝ የምታብስ እምባ
አያታለሁ ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምረህት ኪዳነ ምህረት(3) አምባ መጠግያ ናት
ሄዌን ሰታኝ ከበለሱ ፍሬ

VERSE 1
እራቆቴን ብቆምም አፍሬ
ለብሴን ይዘሽ ወደኔ መተሻል
ደጓ እናቴ ቤተን አድምቀሻል
ኪዳነ ምህረት ኪዳነ ምህረት(3)

VERSE 2
አምባ መጠግያ ናት
ለዘላለም ንጽይት በመሆኗ
ከኔ ጋር ነዉ ህያዉ ቃልኪዳኗ
ደስተኛ ነኝ ሀዘኔን አልፌ

VERSE 3
አጽናኝ ሆናኝ የመስቀል ስር ተርፌ
ከጥፋቱ ዉሃ ማረፊያዬ
መርከቤ ነሽ ከሞት ማምለጫዬ
የአምላከ እናት ምልጃሽ ሆኖኝ ክብሬ

VERSE 4
በህይወት አለዉ ጥልቁን ተሻግሬ
በእናትነት ህይወቴን ጎብኝታዉ
ልቤ አረፌ ተነቅሎ በሽታ
ሰንሰሌቴ ከእጄ ተቆረጠ

VERSE 5
መራራዬ በልጅሽ ጣፈጠ',
      lyrics_transliteration = 'Enat alegn yemtabs emba
Ayatalehu siwet’a sigeba
Kidane mihret kidane mireht kidane mihret (3) amba met’egya nat
Hewen setagn kebelesu fire

VERSE 1
Eraqoten biqomm afre
Lebsen yizesh wedene meteshal
Degwa enate beten admqeshal
Kidane mihret kidane mihret (3)

VERSE 2
Amba met’egya nat
Lezelalem nits’yt bemehonwa
Kene gar newu hiyawu qalkidanwa
Destegna negn hezenen alfe

VERSE 3
Ats’nagn honagn yemesqel sir terfe
Ket’fatu wuha marefiyaye
Merkebe nesh kemot mamlech’aye
Yeamlake enat miljash honogn kibre

VERSE 4
Behywet alewu t’lqun teshagre
Beenatnet hiyweten gobgntawu
Libe arefe teneqlo beshta
Senselete keeje teqoret’e

VERSE 5
Meraraye beljsh t’afet’e',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enat-alegn-kidane-mihiret'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enat-alegn-kidane-mihiret', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enat Alegn Yemitabbs Enba (enat-alegn-yemitabbs-enba)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 1
ሔዋን ሰጥታኝ ከበለሱ ፍሬ
ራቁቴን ብቆምም አፍሬ
ልብሴን ይዘሽ ወደኔ መጥተሻል
ደጏ እናቴ ቤቴን አድምቀሻል

VERSE 2
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 3
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 4
ለዘላለም ንፅሕት በመሆኗ
ከእኔ ጋር ነው ሕያው ቃልኪዳኗ
ደስተኛ ነኝ ሐዘኔን አልፌ
አፅናኝ ሆናኝ የመስቀል ስር ትርፌ

VERSE 5
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 6
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 7
ከጥፋት ውሃ ማረፊያዬ
መርከቤ ነሽ ከሞት ማምለጫዬ
የአምላክ እናት ምልጃሽ ሆኖኝ ክብሬ
በሕይወት አለሁ ጥልቁን ተሻግሬ

VERSE 8
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 9
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 10
በእናትነት ሕይወቴን ጎብኝታ
ልቤ አረፈ ተነቅሎ በሽታ
ሰንሰለቴ ከእግሬ ተቆረጠ
መራራዬ በልጅሽ ጣፈጠ

VERSE 11
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 12
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት',
      lyrics_transliteration = 'Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 1
Hewan settagn ke-belesu firie
Raqutien biqomim afrie
Libsien yizesh wedenie met-teshal

VERSE 2
Degwa innate betien adimqeshal
Kidane Meheret (x3) amba metogiya nat
Enat alegn yemitabis inba

VERSE 3
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 4
Le-zelalem nitsihit be-mo-hon-wa
Ke-inie gara new hiyaw qalkidan-wa
Destegna negn hazene’n alifie

VERSE 5
Atsnagn honagn ye-meskel sir tiffie
Kidane Meheret (x3) amba metogiya nat
Enat alegn yemitabis inba

VERSE 6
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 7
Ke-tifat wuha marefiya-yie
Merkie-be nesh ke-mot mamlecha-yie
Ye-amlak enat miljash honogn kibrie

VERSE 8
Be-hiywot allehu tilqun teshagrie
Kidane Meheret (x3) amba metogiya nat
Enat alegn yemitabis inba

VERSE 9
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 10
Be-enat-net hiywotie’n gobign-ta
Libie arefe teneqlo beshita
Senseletie ke-igrie teqorete

VERSE 11
Merara-yie be-lijish tafete
Kidane Meheret (x3) amba metogiya nat
Enat alegn yemitabis inba

VERSE 12
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enat-alegn-yemitabbs-enba'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 1
ሔዋን ሰጥታኝ ከበለሱ ፍሬ
ራቁቴን ብቆምም አፍሬ
ልብሴን ይዘሽ ወደኔ መጥተሻል
ደጏ እናቴ ቤቴን አድምቀሻል

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 2
ኪዳነምረት /3/ አምባ መጠጊያ ናት

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 3
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 4
ለዘላለም ንፅሕት በመሆኗ
ከእኔ ጋር ነው ሕያው ቃልኪዳኗ
ደስተኛ ነኝ ሐዘኔን አልፌ
አፅናኝ ሆናኝ የመስቀል ስር ትርፌ

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 5
ኪዳነምረት /3/ አምባ መጠጊያ ናት

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 6
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 7
ከጥፋት ውሃ ማረፊያዬ
መርከቤ ነሽ ከሞት ማምለጫዬ
የአምላክ እናት ምልጃሽ ሆኖኝ ክብሬ
በሕይወት አለሁ ጥልቁን ተሻግሬ

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 8
ኪዳነምረት /3/ አምባ መጠጊያ ናት

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 9
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 10
በእናትነት ሕይወቴን ጎብኝታ
ልቤ አረፈ ተነቅሎ በሽታ
ሰንሰለቴ ከእግሬ ተቆረጠ
መራራዬ በልጅሽ ጣፈጠ

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 11
ኪዳነምረት /3/ አምባ መጠጊያ ናት

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

VERSE 12
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት

CHORUS
እናት አለኝ የምታብስ እንባ
አያታለሁ ስወጣ ስገባ
ኪዳነምረት /3/ አምባ መጠጊያ ናት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 1
Hewan settagn ke-belesu firie
Raqutien biqomim afrie
Libsien yizesh wedenie met-teshal

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 2
Degwa innate betien adimqeshal
Kidane Meheret (x3) amba metogiya nat
Enat alegn yemitabis inba

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 3
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 4
Le-zelalem nitsihit be-mo-hon-wa
Ke-inie gara new hiyaw qalkidan-wa
Destegna negn hazene’n alifie

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 5
Atsnagn honagn ye-meskel sir tiffie
Kidane Meheret (x3) amba metogiya nat
Enat alegn yemitabis inba

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 6
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 7
Ke-tifat wuha marefiya-yie
Merkie-be nesh ke-mot mamlecha-yie
Ye-amlak enat miljash honogn kibrie

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 8
Be-hiywot allehu tilqun teshagrie
Kidane Meheret (x3) amba metogiya nat
Enat alegn yemitabis inba

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 9
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 10
Be-enat-net hiywotie’n gobign-ta
Libie arefe teneqlo beshita
Senseletie ke-igrie teqorete

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 11
Merara-yie be-lijish tafete
Kidane Meheret (x3) amba metogiya nat
Enat alegn yemitabis inba

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

VERSE 12
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat

CHORUS
Enat alegn yemitabis inba
Ayatalehu siwet-ta sigebe
Kidane Meheret (x3) amba metogiya nat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enat-alegn-yemitabbs-enba', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enatinet (enatinet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እናትነት ክድንግልና ጋር ዕፁብ
እመ አምላክ ከትህትና ጋር ግሩም
ድንግል ማርያም እሙ ለአዶናይ ንኢ
ይዘምራል ልቤ እያለ ተፈሥሂ

VERSE 1
እንደምን ይሆን ይህ ታላቅ ምሥጢር በአንቺ ሲገለጥ
እግዚአብሔር ልጁን አለም እንዲድን እንዲድን እንዲሁ ሲሰጥ
ከስጋሽ ስጋን ከነፍስሽ ነፍስን የአብ ቃል ነስቶ
ተዋህዶ ታየ ፍጹም እውነትን ጸጋን ተመልቶ

VERSE 2
ኦ ድንግልሆይ : ክብርሽ ይለያል
ኦ ማርያም : ከሁሉ ይልቃል
ኦ እመ አምላክ : ብጽዕት ነሽና
ኦ ማርያም : አለኝ ምሥጋና

VERSE 3
ሠላም ለኪ ተፈሥሂ ፍሥህት ምልዕተ ጸጋ
ቅዱስ ገብርኤል ሲያበስርሽ ያኔ እያረጋጋ
ፍጽምት ቅድስት ቢል የተባረክሽ ከሴቶች ሁሉ
ንጉስ ወድዶሽ ነው ለእናትነት መርጦሽ ልዑሉ

VERSE 4
ኦ ድንግል ሆይ:
በትህትና ይኩነኒ ያልሽ የእምነት ምሳሌ
እንባ ቀደመኝ ፍቅርሽን ሊገልጽ አጠረ ቃሌ
እምዬ ምልሽ የመና ሙዳይ ንጽሕት ሰማይ

VERSE 5
ምዘምርልሽ ወልደሽልኝ ነው የነፍሴን ጸሃይ
የታደለ ሰው ጌታ አምላክ ሲለው በልጅሽ አምኖ
ጸጋ በዝቶለት ሰማያት ቢደርስ እምነቱ ገንኖ
አይችልም ከቶ እኩል ነኝ ብሎ ሊሆንሽ አቻ

VERSE 6
ፈጣሬ አለማት እናቴ ሚልሽ ማርያም ብቻ
የገሊላ አንስት አንገታቸውን ቀና እንዳረጉ
አይደለም የአንቺ ልዩ ነሽ ድንግል ሳቤቅ ለበጉ
ምልጃ ጸሎትሽ ህያው ነው ዛሬም እግዝዕትነ

VERSE 7
በአንድያ ልጅሽ በእምነት ጸንቶ ለተማጸነ',
      lyrics_transliteration = 'Enatnet kidnglna gar ets’ub
Eme amlak kethtna gar girum
Dingil Maryam emu leadonay nii
Yizemral libe eyale tefeshi

VERSE 1
Endemn yihon yih talaq mist’ir beanchi sigelet’
Egziabher lijun alem endidn endidn endihu siset’
Kesgash sigan kenefssh nefsn yeab qal nesto
Tewahedo taye fits’um ewnetn ts’egan temelto

VERSE 2
O dinglhoy : kibrsh yileyal
O Maryam : kehulu yilqal
O eme amlak : bits’et neshna
O Maryam : alegn misgana

VERSE 3
Selam leki tefeshi fisht milete ts’ega
Kidus Gebriel siyabesrsh yane eyaregaga
Fits’mt Kidist bil yetebareksh kesetoch hulu
Nigus weddosh new leenatnet mert’osh liulu

VERSE 4
O Dingil hoy:
Bethtna yikuneni yalsh yeemnet misale
Enba qedemegn fiqrshn ligelts’ at’ere qale
Emye milsh yemena muday nits’ht semay

VERSE 5
Mizemrlsh weldeshlgn new yenefsen ts’ehay
Yetadele sew Geta amlak silew beljsh amno
Ts’ega beztolet semayat biders emnetu genno
Aychlm keto ekul negn bilo lihonsh acha

VERSE 6
Fet’are alemat enate milsh Maryam bicha
Yegelila anst angetachewn qena endaregu
Aydelem yeanchi liyu nesh Dingil sabeq lebegu
Milja ts’elotsh hiyaw new zarem egzetne

VERSE 7
Beandya lijsh beemnet ts’ento letemats’ene',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enatinet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እናትነት ክድንግልና ጋር ዕፁብ
እመ አምላክ ከትህትና ጋር ግሩም
ድንግል ማርያም እሙ ለአዶናይ ንኢ
ይዘምራል ልቤ እያለ ተፈሥሂ

VERSE 1
እንደምን ይሆን ይህ ታላቅ ምሥጢር በአንቺ ሲገለጥ
እግዚአብሔር ልጁን አለም እንዲድን እንዲድን እንዲሁ ሲሰጥ
ከስጋሽ ስጋን ከነፍስሽ ነፍስን የአብ ቃል ነስቶ
ተዋህዶ ታየ ፍጹም እውነትን ጸጋን ተመልቶ

CHORUS
እናትነት ክድንግልና ጋር ዕፁብ
እመ አምላክ ከትህትና ጋር ግሩም
ድንግል ማርያም እሙ ለአዶናይ ንኢ
ይዘምራል ልቤ እያለ ተፈሥሂ

VERSE 2
ኦ ድንግልሆይ : ክብርሽ ይለያል
ኦ ማርያም : ከሁሉ ይልቃል
ኦ እመ አምላክ : ብጽዕት ነሽና
ኦ ማርያም : አለኝ ምሥጋና

CHORUS
እናትነት ክድንግልና ጋር ዕፁብ
እመ አምላክ ከትህትና ጋር ግሩም
ድንግል ማርያም እሙ ለአዶናይ ንኢ
ይዘምራል ልቤ እያለ ተፈሥሂ

VERSE 3
ሠላም ለኪ ተፈሥሂ ፍሥህት ምልዕተ ጸጋ
ቅዱስ ገብርኤል ሲያበስርሽ ያኔ እያረጋጋ
ፍጽምት ቅድስት ቢል የተባረክሽ ከሴቶች ሁሉ
ንጉስ ወድዶሽ ነው ለእናትነት መርጦሽ ልዑሉ

CHORUS
እናትነት ክድንግልና ጋር ዕፁብ
እመ አምላክ ከትህትና ጋር ግሩም
ድንግል ማርያም እሙ ለአዶናይ ንኢ
ይዘምራል ልቤ እያለ ተፈሥሂ

VERSE 4
ኦ ድንግል ሆይ:
በትህትና ይኩነኒ ያልሽ የእምነት ምሳሌ
እንባ ቀደመኝ ፍቅርሽን ሊገልጽ አጠረ ቃሌ
እምዬ ምልሽ የመና ሙዳይ ንጽሕት ሰማይ

CHORUS
እናትነት ክድንግልና ጋር ዕፁብ
እመ አምላክ ከትህትና ጋር ግሩም
ድንግል ማርያም እሙ ለአዶናይ ንኢ
ይዘምራል ልቤ እያለ ተፈሥሂ

VERSE 5
ምዘምርልሽ ወልደሽልኝ ነው የነፍሴን ጸሃይ
የታደለ ሰው ጌታ አምላክ ሲለው በልጅሽ አምኖ
ጸጋ በዝቶለት ሰማያት ቢደርስ እምነቱ ገንኖ
አይችልም ከቶ እኩል ነኝ ብሎ ሊሆንሽ አቻ

CHORUS
እናትነት ክድንግልና ጋር ዕፁብ
እመ አምላክ ከትህትና ጋር ግሩም
ድንግል ማርያም እሙ ለአዶናይ ንኢ
ይዘምራል ልቤ እያለ ተፈሥሂ

VERSE 6
ፈጣሬ አለማት እናቴ ሚልሽ ማርያም ብቻ
የገሊላ አንስት አንገታቸውን ቀና እንዳረጉ
አይደለም የአንቺ ልዩ ነሽ ድንግል ሳቤቅ ለበጉ
ምልጃ ጸሎትሽ ህያው ነው ዛሬም እግዝዕትነ

CHORUS
እናትነት ክድንግልና ጋር ዕፁብ
እመ አምላክ ከትህትና ጋር ግሩም
ድንግል ማርያም እሙ ለአዶናይ ንኢ
ይዘምራል ልቤ እያለ ተፈሥሂ

VERSE 7
በአንድያ ልጅሽ በእምነት ጸንቶ ለተማጸነ

CHORUS
እናትነት ክድንግልና ጋር ዕፁብ
እመ አምላክ ከትህትና ጋር ግሩም
ድንግል ማርያም እሙ ለአዶናይ ንኢ
ይዘምራል ልቤ እያለ ተፈሥሂ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enatnet kidnglna gar ets’ub
Eme amlak kethtna gar girum
Dingil Maryam emu leadonay nii
Yizemral libe eyale tefeshi

VERSE 1
Endemn yihon yih talaq mist’ir beanchi sigelet’
Egziabher lijun alem endidn endidn endihu siset’
Kesgash sigan kenefssh nefsn yeab qal nesto
Tewahedo taye fits’um ewnetn ts’egan temelto

CHORUS
Enatnet kidnglna gar ets’ub
Eme amlak kethtna gar girum
Dingil Maryam emu leadonay nii
Yizemral libe eyale tefeshi

VERSE 2
O dinglhoy : kibrsh yileyal
O Maryam : kehulu yilqal
O eme amlak : bits’et neshna
O Maryam : alegn misgana

CHORUS
Enatnet kidnglna gar ets’ub
Eme amlak kethtna gar girum
Dingil Maryam emu leadonay nii
Yizemral libe eyale tefeshi

VERSE 3
Selam leki tefeshi fisht milete ts’ega
Kidus Gebriel siyabesrsh yane eyaregaga
Fits’mt Kidist bil yetebareksh kesetoch hulu
Nigus weddosh new leenatnet mert’osh liulu

CHORUS
Enatnet kidnglna gar ets’ub
Eme amlak kethtna gar girum
Dingil Maryam emu leadonay nii
Yizemral libe eyale tefeshi

VERSE 4
O Dingil hoy:
Bethtna yikuneni yalsh yeemnet misale
Enba qedemegn fiqrshn ligelts’ at’ere qale
Emye milsh yemena muday nits’ht semay

CHORUS
Enatnet kidnglna gar ets’ub
Eme amlak kethtna gar girum
Dingil Maryam emu leadonay nii
Yizemral libe eyale tefeshi

VERSE 5
Mizemrlsh weldeshlgn new yenefsen ts’ehay
Yetadele sew Geta amlak silew beljsh amno
Ts’ega beztolet semayat biders emnetu genno
Aychlm keto ekul negn bilo lihonsh acha

CHORUS
Enatnet kidnglna gar ets’ub
Eme amlak kethtna gar girum
Dingil Maryam emu leadonay nii
Yizemral libe eyale tefeshi

VERSE 6
Fet’are alemat enate milsh Maryam bicha
Yegelila anst angetachewn qena endaregu
Aydelem yeanchi liyu nesh Dingil sabeq lebegu
Milja ts’elotsh hiyaw new zarem egzetne

CHORUS
Enatnet kidnglna gar ets’ub
Eme amlak kethtna gar girum
Dingil Maryam emu leadonay nii
Yizemral libe eyale tefeshi

VERSE 7
Beandya lijsh beemnet ts’ento letemats’ene

CHORUS
Enatnet kidnglna gar ets’ub
Eme amlak kethtna gar girum
Dingil Maryam emu leadonay nii
Yizemral libe eyale tefeshi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enatinet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ende Igziabeher Yale Manim Yelem-na (ende-egziabeher-yale-manim-yelem-na)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 1
ባሕር ተከፈለ እስኪታይ መሬቱ
ፈርዖን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ጸንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኸው ፈራርሶ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንጸናለን በእርሱ ተደግፈን

VERSE 3
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን
ተሸነፈ አዳኝ ጠላታችን

VERSE 4
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ
የድንግል ልጅ እኛ የምናመልከው
መድሃኒአለም የለም የሚሳነው',
      lyrics_transliteration = 'Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 1
Bahir tekefele iskitay meretu
Far’on wedeqe alseram timkihtu
Dekamochim tsentew teramedu
Hayilegnonchim yihew tewaredu

VERSE 2
Ye-Iyariko qitir yemayedefferew
Yihew ferars-o ye-sew ij sayinekaw
Hayilegnonchim bibertatubin
Intsenalen be-irsu tedegfen

VERSE 3
Ye-teworewerew ye-telatachin tor
Mieda lay wedeqe gasha hono Igziabeher
Le-Sillassie yidres misganachin
Teshenefe adagn telatachin

VERSE 4
Bahir lay siramed moges alew irsu
Be-girmaw sinessa tsett yilal nefasu
Ye-Dingil lij igna yeminnamlkew
Medhanealem yelem yemisanew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ende-egziabeher-yale-manim-yelem-na'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 1
ባሕር ተከፈለ እስኪታይ መሬቱ
ፈርዖን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ጸንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኸው ፈራርሶ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንጸናለን በእርሱ ተደግፈን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 3
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን
ተሸነፈ አዳኝ ጠላታችን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 4
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ
የድንግል ልጅ እኛ የምናመልከው
መድሃኒአለም የለም የሚሳነው

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 1
Bahir tekefele iskitay meretu
Far’on wedeqe alseram timkihtu
Dekamochim tsentew teramedu
Hayilegnonchim yihew tewaredu

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 2
Ye-Iyariko qitir yemayedefferew
Yihew ferars-o ye-sew ij sayinekaw
Hayilegnonchim bibertatubin
Intsenalen be-irsu tedegfen

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 3
Ye-teworewerew ye-telatachin tor
Mieda lay wedeqe gasha hono Igziabeher
Le-Sillassie yidres misganachin
Teshenefe adagn telatachin

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 4
Bahir lay siramed moges alew irsu
Be-girmaw sinessa tsett yilal nefasu
Ye-Dingil lij igna yeminnamlkew
Medhanealem yelem yemisanew

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ende-egziabeher-yale-manim-yelem-na', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ende Egziabher Yale Manem Yelemna (ende-egziabher-yale-manem-yelemna)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 1
ባሕር ተከፈለ እስኪታይ መሬቱ
ፈርዖን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ጸንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኸው ፈራርሶ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንጸናለን በእርሱ ተደግፈን

VERSE 3
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን
ተሸነፈ አዳኝ ጠላታችን

VERSE 4
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ
የድንግል ልጅ እኛ የምናመልከው
መድሃኒአለም የለም የሚሳነው',
      lyrics_transliteration = 'Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 1
Baher tekefele eskitay meretu
Fereon wedeke alseram timkhetu
Dekamochum tsentew teramedu
Haylegnochum yehew tewaredu

VERSE 2
Yeyariko kiter yemaydeferew
Yehew ferarese yesew ej saynekaw
Haylegnochum bibertatuben
Entsenalen bersu tedegfen

VERSE 3
Yetewerewerew yetelatachen tor
Meda lay wedeke gasha hono Egziabher
LeSilassie yedres mesganachen
Teshenefe adagn telatachen

VERSE 4
Baher lay siramed moges alew ersu
Begrmaw sinesa tset yelal nifasu
YeDingel lij egna menamelkew
Medhanialem yelem misanew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ende-egziabher-yale-manem-yelemna'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 1
ባሕር ተከፈለ እስኪታይ መሬቱ
ፈርዖን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ጸንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኸው ፈራርሶ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንጸናለን በእርሱ ተደግፈን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 3
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን
ተሸነፈ አዳኝ ጠላታችን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 4
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ
የድንግል ልጅ እኛ የምናመልከው
መድሃኒአለም የለም የሚሳነው

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 1
Baher tekefele eskitay meretu
Fereon wedeke alseram timkhetu
Dekamochum tsentew teramedu
Haylegnochum yehew tewaredu

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 2
Yeyariko kiter yemaydeferew
Yehew ferarese yesew ej saynekaw
Haylegnochum bibertatuben
Entsenalen bersu tedegfen

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 3
Yetewerewerew yetelatachen tor
Meda lay wedeke gasha hono Egziabher
LeSilassie yedres mesganachen
Teshenefe adagn telatachen

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 4
Baher lay siramed moges alew ersu
Begrmaw sinesa tset yelal nifasu
YeDingel lij egna menamelkew
Medhanialem yelem misanew

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ende-egziabher-yale-manem-yelemna', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ene Alazinim (ene-alazinim)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኔ አላዝንም
እኔ አላዝንም አነተ እያለኸኝ አልከፋም 2x
እናት አባት ዘመዴ አንተ ነህ የኔ ተስፋ 2x
ለሚወድህ ለሚያገለግልህ

VERSE 1
ለጠራኸው ጌታዬ እንዳሳብህ
ቢያስጨንቅም ነገር ለበጎ ነው
ቢያስተክዝም ፍፃሜው መልካም ነው
አሜን, ይሁን አንተ የወደድከው ለእኔ የፈቀድከው 2x

VERSE 2
አዝ…………
ከእናት በላይ የምታጽናናኝ
ከአባት በላይ አቅፈህ የምትስመኝ
የወለድከኝ በፅኑ መከራ

VERSE 3
ያሳደከኝ በመስቀል ስራ
ስላለኸኝ ኢየሱስ ሰላሜ
ተጽናናው ደግሜ 2x
አዝ………

VERSE 4
አላነባም ሰው የለኝም ብዬ
የሻትከውን ስትሰራው ጌታዬ
የኔም ጉዞ ወደ አንተ ነውና
መሰብሰቤ ከቶ አይቀርም እና

VERSE 5
ላመስግንህ ስለሆነው ሁሉ
እግዚሐብሔር ሀያሉ 2x
አዝ…………
ያጣሁትን በእጥፍ ትተካለህ

VERSE 6
ሸለቆዬን ደስታ ትሞላለህ
የፍቅርህ እጅህ ከአይኔ በታች አርፏል
እያበሰ እንባዬን አንጥፏል
ዘምራለው ይኸው እንደገና ሁሉም አልፏልና 2x

VERSE 7
አዝ…………',
      lyrics_transliteration = 'Ene alaznm
Ene alaznm anete eyaleኸgn alkefam 2x
Enat abat zemede ante neh yene tesfa 2x
Lemiwedh lemiyageleglh

VERSE 1
Let’eraኸw Getaye endasabh
Biyasch’enqm neger lebego new
Biyastekzm fits’amew melkam new
Amen, yihun ante yewededkew leene yefeqedkew 2x

VERSE 2
Keenat belay yemtats’nanagn
Keabat belay aqfeh yemtsmegn
Yeweledkegn bets’nu mekera

VERSE 3
Yasadekegn bemesqel sira
Silaleኸgn Iyesus selame
Tets’nanaw degme 2x

VERSE 4
Alanebam sew yelegnm biye
Yeshatkewn sitseraw Getaye
Yenem guzo wede ante newna
Mesebsebe keto ayqerm ena

VERSE 5
Lamesgnh silehonew hulu
Egzihebher heyalu 2x
Yat’ahutn beet’f titekaleh

VERSE 6
Sheleqoyen desta timolaleh
Yefqrh ejh keayne betach arfwal
Eyabese enbayen ant’fwal
Zemralew yiኸw endegena hulum alfwalna 2x

VERSE 7',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ene-alazinim'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ene-alazinim', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ene Anite Bet (ene-anite-bet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 1
የሚመስልህ ማንም የለም።(2×)
ፀሎቴ ቢሆን የወረት
ጎደሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ

VERSE 2
በደል ጥፋቴንም ሳታይ
ቀባኀኝ ጠርተኀኝ ከዱር
ሰጠኀኝ ከፍ ያለ መንበር
ሳይኖረኝ ምንም በጎነት

VERSE 3
ባረከኝ እኔን በረከት
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም

VERSE 4
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም።
ቃልኪዳንህን ኣክባሪ
ታማኝ ነህ ሁሌም መሀሪ

VERSE 5
የማልከውንም መኃላ
ኣትረሳም ኣትልም ችላ
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ

VERSE 6
ፍቅር ነህ ካባትም በላይ
የሰማይ የምድር ሲሳይ።',
      lyrics_transliteration = 'Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 1
Yemimeslh manm yelem.(2×)
Ts’elote bihon yeweret
Godelo bihon yene emnet
Barekegn enen kesemay

VERSE 2
Bedel t’fatenm satay
Qebahegn t’ertehegn kedur
Set’ehegn kef yale menber
Saynoregn minm begonet

VERSE 3
Barekegn enen bereket
Ene ante bet
Ene ante fit
Yemqom sew aydelehum

VERSE 4
Gin fiqr neh lezelalem
Yemimeslh manm yelem.
Qalkidanhn akbari
Tamagn neh hulem meheri

VERSE 5
Yemalkewnm mehala
Atresam atlm chla
Mekari dinq memhre
Lante new zema mezmure

VERSE 6
Fiqr neh kabatm belay
Yesemay yemdr sisay.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ene-anite-bet'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ene-anite-bet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ene Ante Bet (ene-ante-bet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 1
ጸሎቴ ቢሆን ለወረት
ጎዶሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ
በደል ጥፋቴንም ሳታይ

VERSE 2
ቀባኸኝ ጠርተኸኝ ከዱር
ሰጠኸኝ ከፍ ያለ ወንበር
ሳይኖረኝ አንድም በጎነት
ባረከኝ በእጅህ በረከት

VERSE 3
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 4
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 5
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 6
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

VERSE 7
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

VERSE 8
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 9
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 10
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 11
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

VERSE 12
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

VERSE 13
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 14
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 15
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 16
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

VERSE 17
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

VERSE 18
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 19
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 20
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም',
      lyrics_transliteration = 'ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 1
tselote bihon leweret
godolo bihon yene mnet
barekeny nen kesemay
bedel tfatenm satay

VERSE 2
qebaheny terteheny kedur
seteheny kef yale wenber
saynoreny endm begonet
barekeny bejh bereket

VERSE 3
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 4
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 5
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 6
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

VERSE 7
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

VERSE 8
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 9
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 10
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 11
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

VERSE 12
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

VERSE 13
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 14
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 15
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 16
meshaten bcha slayeh
dekama ljhn gobenyeh
bqate meche honena
yaqomeny lante msgana

VERSE 17
enku slalk enhu
teyqu slalk teyeqhuh
keftehal berhn lene
yetatemkubh medhne

VERSE 18
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 19
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 20
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ene-ante-bet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 1
ጸሎቴ ቢሆን ለወረት
ጎዶሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ
በደል ጥፋቴንም ሳታይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 2
ቀባኸኝ ጠርተኸኝ ከዱር
ሰጠኸኝ ከፍ ያለ ወንበር
ሳይኖረኝ አንድም በጎነት
ባረከኝ በእጅህ በረከት

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 3
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 4
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 5
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 6
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 7
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 8
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 9
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 10
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 11
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 12
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 13
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 14
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 15
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 16
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 17
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 18
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 19
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 20
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 1
tselote bihon leweret
godolo bihon yene mnet
barekeny nen kesemay
bedel tfatenm satay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 2
qebaheny terteheny kedur
seteheny kef yale wenber
saynoreny endm begonet
barekeny bejh bereket

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 3
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 4
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 5
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 6
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 7
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 8
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 9
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 10
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 11
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 12
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 13
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 14
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 15
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 16
meshaten bcha slayeh
dekama ljhn gobenyeh
bqate meche honena
yaqomeny lante msgana

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 17
enku slalk enhu
teyqu slalk teyeqhuh
keftehal berhn lene
yetatemkubh medhne

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 18
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 19
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 20
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ene-ante-bet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ene Ante Fit (ene-ante-fit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 1
ጸሎቴ ቢሆን ለወረት
ጎዶሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ
በደል ጥፋቴንም ሳታይ

VERSE 2
ቀባኸኝ ጠርተኸኝ ከዱር
ሰጠኸኝ ከፍ ያለ ወንበር
ሳይኖረኝ አንድም በጎነት
ባረከኝ በእጅህ በረከት

VERSE 3
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 4
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

VERSE 5
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

VERSE 6
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 7
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

VERSE 8
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

VERSE 9
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 10
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

VERSE 11
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

VERSE 12
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም',
      lyrics_transliteration = 'Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 1
Ts’elote bihon leweret
Godolo bihon yene emnet
Barekegn enen kesemay
Bedel t’fatenm satay

VERSE 2
Qebaኸgn t’erteኸgn kedur
Set’eኸgn kef yale wenber
Saynoregn andm begonet
Barekegn beejh bereket

VERSE 3
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 4
Qal kidanhn akbari
Tamagn neh hule mehari
Yemalkewnm mehala
Atresam atlm chla

VERSE 5
Mekari dinq memhre
Lante new zema mezmure
Fiqr neh keabatm belay
Yesemay yemdr sisay

VERSE 6
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 7
Qal kidanhn akbari
Tamagn neh hule mehari
Yemalkewnm mehala
Atresam atlm chla

VERSE 8
Mekari dinq memhre
Lante new zema mezmure
Fiqr neh keabatm belay
Yesemay yemdr sisay

VERSE 9
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 10
Meshaten bicha silayeh
Dekama lijhn gobegneh
Biqate meche honena
Yaqomegn lante misgana

VERSE 11
Ankwaku silalk ankwakwahu
T’eyqu silalk t’eyeqhuh
Keftehal berhn lene
Yetatemkubh medhne

VERSE 12
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ene-ante-fit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 1
ጸሎቴ ቢሆን ለወረት
ጎዶሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ
በደል ጥፋቴንም ሳታይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 2
ቀባኸኝ ጠርተኸኝ ከዱር
ሰጠኸኝ ከፍ ያለ ወንበር
ሳይኖረኝ አንድም በጎነት
ባረከኝ በእጅህ በረከት

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 3
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 4
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 5
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 6
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 7
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 8
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 9
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 10
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 11
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 12
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 1
Ts’elote bihon leweret
Godolo bihon yene emnet
Barekegn enen kesemay
Bedel t’fatenm satay

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 2
Qebaኸgn t’erteኸgn kedur
Set’eኸgn kef yale wenber
Saynoregn andm begonet
Barekegn beejh bereket

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 3
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 4
Qal kidanhn akbari
Tamagn neh hule mehari
Yemalkewnm mehala
Atresam atlm chla

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 5
Mekari dinq memhre
Lante new zema mezmure
Fiqr neh keabatm belay
Yesemay yemdr sisay

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 6
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 7
Qal kidanhn akbari
Tamagn neh hule mehari
Yemalkewnm mehala
Atresam atlm chla

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 8
Mekari dinq memhre
Lante new zema mezmure
Fiqr neh keabatm belay
Yesemay yemdr sisay

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 9
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 10
Meshaten bicha silayeh
Dekama lijhn gobegneh
Biqate meche honena
Yaqomegn lante misgana

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 11
Ankwaku silalk ankwakwahu
T’eyqu silalk t’eyeqhuh
Keftehal berhn lene
Yetatemkubh medhne

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 12
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ene-ante-fit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ene Ehonin (ene-ehonin-643)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አላውቅህም ብዬ በሰው ፊት የምክድህ
ለጠላት አንስቼ አሳልፌ እምሰጥህ
እኔ እሆንን ጌታ ሆይ እኔ እሆንን ?
እኔ እሆንን አምላክ ሆይ እኔ እሆንን ?

VERSE 1
ይሁዳ ነኝ ወይስ ጴጥሮስ ሐሙስ ማታ እኔ ማነኝ
የዛሬን መቆሜን እንጂ አላውቅም መጨረሻዬን
እውድሃለውኝ ብዬ የዛሬን እናገራለሁ
አላውቅህም ብዬ እንዳልናገር ስለነገ ግን እፈራለሁ

VERSE 2
ስንት የአጥቢያ ኮከቦች ለአንተ ዘምረውልህ ወደቁ
በሰማይ መቅደስህ አጥነው በትዕቢት ረግፈው አለቁ
እፈራለሁ እኔም ለራሴ መንገዴን ንገረኝ ጌታ
ጠዋት በዘመርኩበት አፍ እንዳልሳደብ ማታ

VERSE 3
ሳጥናኤልም መልአክ ነበር ይሁዳም ሐዋርያ
ንስጥሮስም ጳጳስ ነበር አርዮስም ባለሙያ
እነዚህ ሁሉ ከወጡ ከአምላካቸው ጉያ
ደካማ ለሆንኩትማ የት ይሆን የኔ መገኛ?

VERSE 4
ታናሹን ጅማርዬን አንተው ታላቅም አድርግልኝ
ነበረች ከመባል ፈተና አንተው በፍቅርህ አድነኝ
ያስጀመርከኝ አምላኬ እንግዲህ መንገዴን አደራ
በፊትህ ቆሜ ለማመስገን አብቃኝ ከቅዱሳን ጋራ',
      lyrics_transliteration = 'Alawqhm biye besew fit yemkdh
Let’elat ansche asalfe emset’h
Ene ehonn Geta hoy ene ehonn ?
Ene ehonn amlak hoy ene ehonn ?

VERSE 1
Yihuda negn weys p’et’ros hemus mata ene manegn
Yezaren meqomen enji alawqm mech’ereshayen
Ewdhalewgn biye yezaren enageralehu
Alawqhm biye endalnager silenege gin eferalehu

VERSE 2
Sint yeat’biya kokeboch leante zemrewlh wedequ
Besemay meqdesh at’new betebit regfew alequ
Eferalehu enem lerase mengeden nigeregn Geta
T’ewat bezemerkubet af endalsadeb mata

VERSE 3
Sat’naelm melak neber yihudam hewarya
Nist’rosm p’ap’as neber aryosm balemuya
Enezih hulu kewet’u keamlakachew guya
Dekama lehonkutma yet yihon yene megegna?

VERSE 4
Tanashun jimaryen antew talaqm adrglgn
Neberech kemebal fetena antew befqrh adnegn
Yasjemerkegn amlake engdih mengeden adera
Befith qome lemamesgen abqagn keqdusan gara',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ene-ehonin-643'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ene-ehonin-643', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enes Bemegbare (enes-bemegbare)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኔስ በምግባሬ ደካማ ሆኛለሁ
እዘኝልኝ ድንግል እለምንሻለሁ

VERSE 1
ያንን የእሳት ባህር እንዳላይ አደራ
ድረሽልኝ ድንግል ስምሽን ስጠራ

VERSE 2
የዳዊት መሰንቆ የእስራኤል መና
የናሆም መድሃኒት ንኢ በደመና

VERSE 3
አንቺ ነሽ ጉልበቴ በደከመኝ ጊዜ
የልቤ መጽናኛ እረዳት ምርኩዜ

VERSE 4
አፈሳለሁ እንባ በጣም ተጨንቄ
እማጸንሻለሁ በደሌን አውቄ',
      lyrics_transliteration = 'Enes bemegbare dekama honalew
Ezenign dingil ilemnshalew

VERSE 1
Yanen ye’isat bahir endalay adera
Dereshlign dingil simishn sit’era

VERSE 2
YeDawit mesenqo yeIsrael mena
YeNahom medhanit ni’i bedemena

VERSE 3
Anchi nesh gulbeté bedekemegn gize
Yelibé mets’nagna eredat mirkuzé

VERSE 4
Afesalew enba betam tech’enqé
Imats’eneshalew bedelé awqé',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enes-bemegbare'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔስ በምግባሬ ደካማ ሆኛለሁ
እዘኝልኝ ድንግል እለምንሻለሁ

VERSE 1
ያንን የእሳት ባህር እንዳላይ አደራ
ድረሽልኝ ድንግል ስምሽን ስጠራ

CHORUS
እኔስ በምግባሬ ደካማ ሆኛለሁ
እዘኝልኝ ድንግል እለምንሻለሁ

VERSE 2
የዳዊት መሰንቆ የእስራኤል መና
የናሆም መድሃኒት ንኢ በደመና

CHORUS
እኔስ በምግባሬ ደካማ ሆኛለሁ
እዘኝልኝ ድንግል እለምንሻለሁ

VERSE 3
አንቺ ነሽ ጉልበቴ በደከመኝ ጊዜ
የልቤ መጽናኛ እረዳት ምርኩዜ

CHORUS
እኔስ በምግባሬ ደካማ ሆኛለሁ
እዘኝልኝ ድንግል እለምንሻለሁ

VERSE 4
አፈሳለሁ እንባ በጣም ተጨንቄ
እማጸንሻለሁ በደሌን አውቄ

CHORUS
እኔስ በምግባሬ ደካማ ሆኛለሁ
እዘኝልኝ ድንግል እለምንሻለሁ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enes bemegbare dekama honalew
Ezenign dingil ilemnshalew

VERSE 1
Yanen ye’isat bahir endalay adera
Dereshlign dingil simishn sit’era

CHORUS
Enes bemegbare dekama honalew
Ezenign dingil ilemnshalew

VERSE 2
YeDawit mesenqo yeIsrael mena
YeNahom medhanit ni’i bedemena

CHORUS
Enes bemegbare dekama honalew
Ezenign dingil ilemnshalew

VERSE 3
Anchi nesh gulbeté bedekemegn gize
Yelibé mets’nagna eredat mirkuzé

CHORUS
Enes bemegbare dekama honalew
Ezenign dingil ilemnshalew

VERSE 4
Afesalew enba betam tech’enqé
Imats’eneshalew bedelé awqé

CHORUS
Enes bemegbare dekama honalew
Ezenign dingil ilemnshalew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enes-bemegbare', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enes Tesifa Alikoritim (enes-tesifa-alikoritim)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 1
ወዳጅም ሲከዳኝ አለው አልሽኝ /2/
ሕይወቴን ከጥልቁ ማን መለሰው
ቀና ቀና ያልኩት በምልጃሽ ነው /2/
ጠላቴም ሲፎክር ከቶ አልፈራ

VERSE 2
እናት አለኝ እና የምትራራ /2/
በረከት አገኘሁ ፍፁም ሰላም
ፍቅርሽ ስላገዘኝ ድንግል ማርያም /2/
አትውጣ አክአብ ተው አትድከም

VERSE 3
ድንግልን ይዣለሁ አልረታም /2/
በቃልህ ማህሌት ተስፋ አድርጌ
ክብሬ ተቀየረ ማእረጌ /2/
ሰሎሞን ላይፈታው የእኔን ችግር

VERSE 4
መጣሁኝ ከደጅሽ ለአንቺው ልናገር /2/
ዘወትር የማዜመው ስለ ክብርሽ
መልስ ሁነሽኝ ነው በኪዳንሽ /2/',
      lyrics_transliteration = 'Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 1
Wedajm sikedagn alew alshgn (2)
Hiyweten ket’lqu man melesew
Qena qena yalkut bemljash new (2)
T’elatem sifokr keto alfera

VERSE 2
Enat alegn ena yemtrara (2)
Bereket agegnehu fits’um selam
Fiqrsh silagezegn Dingil Maryam (2)
Atwt’a akab tew atdkem

VERSE 3
Dingln yizhalehu alretam (2)
Beqalh mahlet tesfa adrge
Kibre teqeyere maerege (2)
Selomon layfetaw yeenen chgr

VERSE 4
Met’ahugn kedejsh leanchiw linager (2)
Zewetr yemazemew sile kibrsh
Mels huneshgn new bekidansh (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enes-tesifa-alikoritim'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 1
ወዳጅም ሲከዳኝ አለው አልሽኝ /2/
ሕይወቴን ከጥልቁ ማን መለሰው
ቀና ቀና ያልኩት በምልጃሽ ነው /2/
ጠላቴም ሲፎክር ከቶ አልፈራ

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 2
እናት አለኝ እና የምትራራ /2/
በረከት አገኘሁ ፍፁም ሰላም
ፍቅርሽ ስላገዘኝ ድንግል ማርያም /2/
አትውጣ አክአብ ተው አትድከም

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 3
ድንግልን ይዣለሁ አልረታም /2/
በቃልህ ማህሌት ተስፋ አድርጌ
ክብሬ ተቀየረ ማእረጌ /2/
ሰሎሞን ላይፈታው የእኔን ችግር

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 4
መጣሁኝ ከደጅሽ ለአንቺው ልናገር /2/
ዘወትር የማዜመው ስለ ክብርሽ
መልስ ሁነሽኝ ነው በኪዳንሽ /2/

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 1
Wedajm sikedagn alew alshgn (2)
Hiyweten ket’lqu man melesew
Qena qena yalkut bemljash new (2)
T’elatem sifokr keto alfera

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 2
Enat alegn ena yemtrara (2)
Bereket agegnehu fits’um selam
Fiqrsh silagezegn Dingil Maryam (2)
Atwt’a akab tew atdkem

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 3
Dingln yizhalehu alretam (2)
Beqalh mahlet tesfa adrge
Kibre teqeyere maerege (2)
Selomon layfetaw yeenen chgr

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 4
Met’ahugn kedejsh leanchiw linager (2)
Zewetr yemazemew sile kibrsh
Mels huneshgn new bekidansh (2)

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enes-tesifa-alikoritim', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enes Tesifa Alikoritim Yeemebetachin Zimare Bezemarit Sara Menigisitu Yetsiyon Dejoch Kelijinet Anidebete (enes-tesifa-alikoritim-yeemebetachin-zimare-bezemarit-sara-menigisitu-ye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 1
አርፈናል ስሟን ስንጠራ(2)
ኃይልን በሚያደርገው ለተወዳጅ ስምሽ
የዜማ እቃችንን አነሳን ልጆችሽ
ማህተመ ቡራኬሽ በልባችን አለ

VERSE 2
አፋችን ማርያም ሲል ጭንቃችን ቀለለ
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 3
አርፈናል ስሟን ስንጠራ(2)
የምስጋና ጥበብ የቅኔ ሃብት ፀጋ
ከደጃፍሽ መጥተን ገዛን ያለ ዋጋ
ጥልቁን ወጥተነዋል በትከሻሽ ሆነን

VERSE 4
ፅዮንን በእልልታ በዜማ ሸፍነን
እኔስ ተስፋ አልቆርጥም
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ

VERSE 5
አዛኝቱ አንቺን ይዥለሁ
ዙርያዬን ሲጨልም ብርሃን ሆንሽኝ
ወዳጅም ሲከዳኝ አለው አልሽኝ(2)
ህይወቴ ከጥልቁ ማን መልሰው

VERSE 6
ቀና ቀና ያልኩት በምልጃሽ ነው(2)
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ
አዛኝቱ አንቺን ይዥለሁ

VERSE 7
ከልጅነት አንደበቴ
ድንግል ነች በሀሳብ በሕሊና
ያጌጠች በፍፁም ትህትና
ስላሴን በሆዷ አስተናግዳ

VERSE 8
አየናት ምስለ ፍቁር ወልዳ
ከኪሩቤል ድንግል ትበልጣለች
ከሱራፌል ድንግል ትበልጣለች
ለእግዚአብሔር ቃል ማደሪያ ሆናለች

VERSE 9
ከልጅነት አንደበቴ
አለኝ ምስጋና ለእመቤቴ
ከኮልታፋው አንደበቴ
አለኝ እልልታ ለእመቤቴ',
      lyrics_transliteration = NULL,
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enes-tesifa-alikoritim-yeemebetachin-zimare-bezemarit-sara-menigisitu-ye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 1
አርፈናል ስሟን ስንጠራ(2)
ኃይልን በሚያደርገው ለተወዳጅ ስምሽ
የዜማ እቃችንን አነሳን ልጆችሽ
ማህተመ ቡራኬሽ በልባችን አለ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 2
አፋችን ማርያም ሲል ጭንቃችን ቀለለ
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 3
አርፈናል ስሟን ስንጠራ(2)
የምስጋና ጥበብ የቅኔ ሃብት ፀጋ
ከደጃፍሽ መጥተን ገዛን ያለ ዋጋ
ጥልቁን ወጥተነዋል በትከሻሽ ሆነን

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 4
ፅዮንን በእልልታ በዜማ ሸፍነን
እኔስ ተስፋ አልቆርጥም
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 5
አዛኝቱ አንቺን ይዥለሁ
ዙርያዬን ሲጨልም ብርሃን ሆንሽኝ
ወዳጅም ሲከዳኝ አለው አልሽኝ(2)
ህይወቴ ከጥልቁ ማን መልሰው

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 6
ቀና ቀና ያልኩት በምልጃሽ ነው(2)
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ
አዛኝቱ አንቺን ይዥለሁ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 7
ከልጅነት አንደበቴ
ድንግል ነች በሀሳብ በሕሊና
ያጌጠች በፍፁም ትህትና
ስላሴን በሆዷ አስተናግዳ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 8
አየናት ምስለ ፍቁር ወልዳ
ከኪሩቤል ድንግል ትበልጣለች
ከሱራፌል ድንግል ትበልጣለች
ለእግዚአብሔር ቃል ማደሪያ ሆናለች

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 9
ከልጅነት አንደበቴ
አለኝ ምስጋና ለእመቤቴ
ከኮልታፋው አንደበቴ
አለኝ እልልታ ለእመቤቴ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enes-tesifa-alikoritim-yeemebetachin-zimare-bezemarit-sara-menigisitu-ye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ENEWEDATALEN (enewedatalen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 1
በመረገም ተይዞ ዓለም በጨለማ
ድህነት እየራበው ጽድቅ እየተጠማ
ከቁስል ለመዳን የመድኃኒት እናት

VERSE 2
የሕይወት ውኃ ምንጩን መቸ አመስገናት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
አለም ምንም ይበል እንወዳታለን"!

VERSE 3
በደሙ አክምናል የእርሷ የሆድ ፍሬ
ዓለም ክብሯ ርቆት ይጠብቃል ዛሬ
ታላቁ እውነታ ምሥጥሩ ይሄ ነው
አምላክን ያየነው በእርሷ እናትነት ነው

VERSE 4
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
ለእናቶች ቀን ሠጥቶ ዓለሙ ሲዘክር

VERSE 5
እንዴት ይቃወማል የእርሷን ምስጋና ክብር
እግዚአብሔር ማስተዋል ጥበቡን ገልጦለት
የድንግሊቱን ፍቅር በልቡ ይሳልለት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን

VERSE 6
ዓለም ምንም ይበል እንወዳታለን"!
በቀኙ የምትቆም ማርያም ንግስቲቱ
ለክብሯ መዘመረ ምኑ ነው ስህተቱ?

VERSE 7
ከቅዱስ ገብርኤል እንደ ስማነው ቃል
መልካሙ ምስጋና ልባችን ይፈልቃል
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን "!

VERSE 8',
      lyrics_transliteration = 'Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 1
Bemeregem teyzo alem bech’elema
Dihnet eyerabew ts’dq eyetet’ema
Kequsl lemedan yemedhanit enat

VERSE 2
Yehywet wiha minch’un meche amesgenat
"egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen"!

VERSE 3
Bedemu akmnal yeerswa yehod fire
Alem kibrwa riqot yit’ebqal zare
Talaqu ewneta mist’ru yihe new
Amlakn yayenew beerswa enatnet new

VERSE 4
" egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen"!
Leenatoch qen set’to alemu sizekr

VERSE 5
Endet yiqawemal yeerswan misgana kibir
Egziabher mastewal t’bebun gelt’olet
Yednglitun fiqr belbu yisallet
"egna gin kibir alen egna gin fiqr alen

VERSE 6
Alem minm yibel enwedatalen"!
Beqegnu yemtqom Maryam nigstitu
Lekbrwa mezemere minu new sihtetu?

VERSE 7
Keqdus Gebriel ende simanew qal
Melkamu misgana libachn yifelqal
" egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen "!

VERSE 8',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enewedatalen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 1
አዝ
በመረገም ተይዞ ዓለም በጨለማ
ድህነት እየራበው ጽድቅ እየተጠማ
ከቁስል ለመዳን የመድኃኒት እናት

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 2
የሕይወት ውኃ ምንጩን መቸ አመስገናት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
አለም ምንም ይበል እንወዳታለን"!
አዝ

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 3
በደሙ አክምናል የእርሷ የሆድ ፍሬ
ዓለም ክብሯ ርቆት ይጠብቃል ዛሬ
ታላቁ እውነታ ምሥጥሩ ይሄ ነው
አምላክን ያየነው በእርሷ እናትነት ነው

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 4
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
አዝ
ለእናቶች ቀን ሠጥቶ ዓለሙ ሲዘክር

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 5
እንዴት ይቃወማል የእርሷን ምስጋና ክብር
እግዚአብሔር ማስተዋል ጥበቡን ገልጦለት
የድንግሊቱን ፍቅር በልቡ ይሳልለት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 6
ዓለም ምንም ይበል እንወዳታለን"!
አዝ
በቀኙ የምትቆም ማርያም ንግስቲቱ
ለክብሯ መዘመረ ምኑ ነው ስህተቱ?

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 7
ከቅዱስ ገብርኤል እንደ ስማነው ቃል
መልካሙ ምስጋና ልባችን ይፈልቃል
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን "!

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 8
አዝ

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 1
CHORUS
Bemeregem teyzo alem bech’elema
Dihnet eyerabew ts’dq eyetet’ema
Kequsl lemedan yemedhanit enat

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 2
Yehywet wiha minch’un meche amesgenat
"egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen"!
CHORUS

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 3
Bedemu akmnal yeerswa yehod fire
Alem kibrwa riqot yit’ebqal zare
Talaqu ewneta mist’ru yihe new
Amlakn yayenew beerswa enatnet new

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 4
" egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen"!
CHORUS
Leenatoch qen set’to alemu sizekr

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 5
Endet yiqawemal yeerswan misgana kibir
Egziabher mastewal t’bebun gelt’olet
Yednglitun fiqr belbu yisallet
"egna gin kibir alen egna gin fiqr alen

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 6
Alem minm yibel enwedatalen"!
CHORUS
Beqegnu yemtqom Maryam nigstitu
Lekbrwa mezemere minu new sihtetu?

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 7
Keqdus Gebriel ende simanew qal
Melkamu misgana libachn yifelqal
" egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen "!

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 8
CHORUS

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enewedatalen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enibayen Abesikilign (enibayen-abesikilign)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በደሌን ሳትቆጥርብኝ
ሐጢአቴን ሳታይብኝ
ጉድለቴን ከደንክልኝ
እንባዬን አበስክልኝ

VERSE 1
አባቴ ክበርልኝ
መዝገቤ በፊትህ ነው
የለኝም ምደብቀው
ብትበይን እንዳየኸኝ

VERSE 2
ሙት ነበርኩ ፅድቅ የሌለኝ
ታውቃለህ ማንነቴን
የልቤን የውስጠቴን
ይቅርታህ በዝቶልኝ ነው

VERSE 3
ማዜመው ምዘምረው
ባትቀድም በመንገዴ
ባትገባ ጣልቃ ውዴ
በትናንት ጥዩፍ ስሜ

VERSE 4
ነበርኩኝ በድካሜ
እንድኖር በምስጋና
ፈቃድህ በእኔ ሆና
ስራዬ ሟች ሲያስብለኝ

VERSE 5
ጸጋህ ግን እድሜን ሰጠኝ
ሺህ ጊዜ ደጋግሜ
በድዬህ አስቀይሜህ
በእጥፍ እየማርከኝ

VERSE 6
በፊትህ ያቀረብከኝ
ፍቅር ነህ እውነተኛ
የነፍሴ ጻድቅ ዳኛ
እንዳንተ የለም ለእኔ

VERSE 7
በእድሜዬ በዘመኔ
ባትከልለኝ ምህረትህ
ባትረዳኝ ቸርነትህ
ቢቆጠር የኔ ነገር

VERSE 8
አያልቅም ቢዘርዝር
ዛሬ ላይ ሰው መሆኔ
መቆሜ አምሮ ቀኔ
ሸፍኖኝ ነው ጸጋህ

VERSE 9
ተመስገን የምልህ',
      lyrics_transliteration = 'Bedelen satqot’rbgn
Het’iaten sataybgn
Gudleten kedenklgn
Enbayen abesklgn

VERSE 1
Abate kiberlgn
Mezgebe befith new
Yelegnm midebqew
Bitbeyn endayeኸgn

VERSE 2
Mut neberku ts’dq yelelegn
Tawqaleh manneten
Yelben yewst’eten
Yiqrtah beztolgn new

VERSE 3
Mazemew mizemrew
Batqedm bemengede
Batgeba t’alqa wide
Betnant t’yuf sime

VERSE 4
Neberkugn bedkame
Endnor bemsgana
Feqadh beene hona
Siraye mwach siyasblegn

VERSE 5
Ts’egah gin edmen set’egn
Shih gize degagme
Bedyeh asqeymeh
Beet’f eyemarkegn

VERSE 6
Befith yaqerebkegn
Fiqr neh ewnetegna
Yenefse ts’adq dagna
Endante yelem leene

VERSE 7
Beedmeye bezemene
Batkellegn mihreth
Batredagn cherneth
Biqot’er yene neger

VERSE 8
Ayalqm bizerzr
Zare lay sew mehone
Meqome amro qene
Shefnogn new ts’egah

VERSE 9
Temesgen yemlh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enibayen-abesikilign'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enibayen-abesikilign', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enide Elisabet Lamesiginish (enide-elisabet-lamesiginish)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 1
ርኀራኄሽ ያስደንቀኛል
ስለ ኃጢአቴ ምልጃሽ ይቀድማል
የሰላምታሽ ድምፅ ደስ ያሰኘኛል
ከትካዜዬም ያሳርፈኛል

VERSE 2
ድምፅሽ ሲሰማኝ ልቤ ይረካል
ሃዘኔ ቀርቶ ፊቴ ይፈካል
በእናትነት አንቺን ለሰጠን
ቸሩ አምላካችን ይክበር ይመስገን

VERSE 3
የሁሉ እመቤት የሁሉ አጽናኝ
የአበዉ መድኀኒት ከአምላክ አገናኝ
ዛሬም በልቤ ደስታን ጨምረሽ
እንደ ኤልሳቤጥ ሰላም ልበልሽ

VERSE 4
ከሴቶች መካከል መርጦ ቀድሶሻል
ትዉልድ ሁሉ ብፅዕት ይሉሻል
በልዩ ወዳሴ ያመሰግኑሻል
ድንግል ንግሥታችን በቀኙ ቆመሻል

VERSE 5
የሰላሞታሽ ድምፅ ልቤ ሲሰማ
ነፍሴ ደስ አላት ቀለለ ሸክሟ
ድንግል ለክብርሽ ስንበረከክ
እጅሽ ይዘርጋ ለመባረክ',
      lyrics_transliteration = 'Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 1
Riherahesh yasdenqegnal
Sile hat’iate miljash yiqedmal
Yeselamtash dimts’ des yasegnegnal
Ketkazeyem yasarfegnal

VERSE 2
Dimts’sh sisemagn libe yirekal
Hazene qerto fite yifekal
Beenatnet anchin leset’en
Cheru amlakachn yikber yemesgen

VERSE 3
Yehulu emebet yehulu ats’nagn
Yeabewu medhenit keamlak agenagn
Zarem belbe destan ch’emresh
Ende elsabet’ selam libelsh

VERSE 4
Kesetoch mekakel mert’o qedsoshal
Tiwuld hulu bits’et yilushal
Belyu wedase yamesegnushal
Dingil nigstachn beqegnu qomeshal

VERSE 5
Yeselamotash dimts’ libe sisema
Nefse des alat qelele shekmwa
Dingil lekbrsh sinberekek
Ejsh yizerga lemebarek',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enide-elisabet-lamesiginish'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 1
ርኀራኄሽ ያስደንቀኛል
ስለ ኃጢአቴ ምልጃሽ ይቀድማል
የሰላምታሽ ድምፅ ደስ ያሰኘኛል
ከትካዜዬም ያሳርፈኛል

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 2
ድምፅሽ ሲሰማኝ ልቤ ይረካል
ሃዘኔ ቀርቶ ፊቴ ይፈካል
በእናትነት አንቺን ለሰጠን
ቸሩ አምላካችን ይክበር ይመስገን

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 3
የሁሉ እመቤት የሁሉ አጽናኝ
የአበዉ መድኀኒት ከአምላክ አገናኝ
ዛሬም በልቤ ደስታን ጨምረሽ
እንደ ኤልሳቤጥ ሰላም ልበልሽ

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 4
ከሴቶች መካከል መርጦ ቀድሶሻል
ትዉልድ ሁሉ ብፅዕት ይሉሻል
በልዩ ወዳሴ ያመሰግኑሻል
ድንግል ንግሥታችን በቀኙ ቆመሻል

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 5
የሰላሞታሽ ድምፅ ልቤ ሲሰማ
ነፍሴ ደስ አላት ቀለለ ሸክሟ
ድንግል ለክብርሽ ስንበረከክ
እጅሽ ይዘርጋ ለመባረክ

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 1
Riherahesh yasdenqegnal
Sile hat’iate miljash yiqedmal
Yeselamtash dimts’ des yasegnegnal
Ketkazeyem yasarfegnal

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 2
Dimts’sh sisemagn libe yirekal
Hazene qerto fite yifekal
Beenatnet anchin leset’en
Cheru amlakachn yikber yemesgen

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 3
Yehulu emebet yehulu ats’nagn
Yeabewu medhenit keamlak agenagn
Zarem belbe destan ch’emresh
Ende elsabet’ selam libelsh

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 4
Kesetoch mekakel mert’o qedsoshal
Tiwuld hulu bits’et yilushal
Belyu wedase yamesegnushal
Dingil nigstachn beqegnu qomeshal

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 5
Yeselamotash dimts’ libe sisema
Nefse des alat qelele shekmwa
Dingil lekbrsh sinberekek
Ejsh yizerga lemebarek

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enide-elisabet-lamesiginish', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enide Kidus Dawit (enide-kidus-dawit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 1
ሄሮድያዳ ሆይ ዘፈንሽ ሐይል አጧል
የእግዚአብሔር ምስጋና ምድራችን ከድኗል
ዝም የማይል ልሳን ሰቶኛል ጌታዬ
ለስሙ ዘምሬ ቆምኩኝ ሰው ተብዬ

VERSE 2
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
ግብረ ተልኮዬ ቅኔ ነው መዝሙር

VERSE 3
በልቤ ነግሰህል ቅዱስ እግዚአብሔር
ከወገኔ ጋራ ልጥራህ በእልልታ
ያሳደከኝ አምላክ ናፍቆቴ ነህ ጌታ
ከተጠራን ከተሰጠን ለስሙ ምስጋና

VERSE 4
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
ጀርባህን አያለው እርቄም ብወጣ
ስለ ቀደምከልኝ ከፊት ስለ ወጣ

VERSE 5
በየተኛው ቋንቋ ተመስገን ልበልህ
ዘምሬ ዘምሬ አልቸንኣልም ልጠግብህ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና

VERSE 6
ምስክር አልሻም እንድ ዘምርልህ
ይቀሰቅሰኛል ፍቅር እና ምረትህ
እስካጣ እስከደክም እንቅልፌ አይኖቼ

VERSE 7
ንሴብኦ ልበል መቅደስህ ገብቼ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደ ገና',
      lyrics_transliteration = 'Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 1
Herodyada hoy zefensh heyl at’wal
YeEgziabher misgana midrachn kednwal
Zim yemayl lisan setognal Getaye
Lesmu zemre qomkugn sew tebye

VERSE 2
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem endegena
Gibre telkoye qine new mezmur

VERSE 3
Belbe negsehl Kidus Egziabher
Kewegene gara lit’rah beellta
Yasadekegn amlak nafqote neh Geta
Ketet’eran keteset’en lesmu misgana

VERSE 4
Amen yibel midr semay zarem endegena
Jerbahn ayalew erqem biwet’a
Sile qedemkelgn kefit sile wet’a

VERSE 5
Beyetegnaw qwanqwa temesgen libelh
Zemre zemre alchenalm lit’egbh
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem endegena

VERSE 6
Miskr alsham end zemrlh
Yiqeseqsegnal fiqr ena mireth
Eskat’a eskedekm enqlfe aynoche

VERSE 7
Nisebo libel meqdesh gebche
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem ende gena',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enide-kidus-dawit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 1
ሄሮድያዳ ሆይ ዘፈንሽ ሐይል አጧል
የእግዚአብሔር ምስጋና ምድራችን ከድኗል
ዝም የማይል ልሳን ሰቶኛል ጌታዬ
ለስሙ ዘምሬ ቆምኩኝ ሰው ተብዬ

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 2
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ
ግብረ ተልኮዬ ቅኔ ነው መዝሙር

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 3
በልቤ ነግሰህል ቅዱስ እግዚአብሔር
ከወገኔ ጋራ ልጥራህ በእልልታ
ያሳደከኝ አምላክ ናፍቆቴ ነህ ጌታ
ከተጠራን ከተሰጠን ለስሙ ምስጋና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 4
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ
ጀርባህን አያለው እርቄም ብወጣ
ስለ ቀደምከልኝ ከፊት ስለ ወጣ

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 5
በየተኛው ቋንቋ ተመስገን ልበልህ
ዘምሬ ዘምሬ አልቸንኣልም ልጠግብህ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 6
አዝ
ምስክር አልሻም እንድ ዘምርልህ
ይቀሰቅሰኛል ፍቅር እና ምረትህ
እስካጣ እስከደክም እንቅልፌ አይኖቼ

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 7
ንሴብኦ ልበል መቅደስህ ገብቼ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደ ገና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 1
Herodyada hoy zefensh heyl at’wal
YeEgziabher misgana midrachn kednwal
Zim yemayl lisan setognal Getaye
Lesmu zemre qomkugn sew tebye

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 2
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem endegena
CHORUS
Gibre telkoye qine new mezmur

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 3
Belbe negsehl Kidus Egziabher
Kewegene gara lit’rah beellta
Yasadekegn amlak nafqote neh Geta
Ketet’eran keteset’en lesmu misgana

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 4
Amen yibel midr semay zarem endegena
CHORUS
Jerbahn ayalew erqem biwet’a
Sile qedemkelgn kefit sile wet’a

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 5
Beyetegnaw qwanqwa temesgen libelh
Zemre zemre alchenalm lit’egbh
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem endegena

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 6
CHORUS
Miskr alsham end zemrlh
Yiqeseqsegnal fiqr ena mireth
Eskat’a eskedekm enqlfe aynoche

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 7
Nisebo libel meqdesh gebche
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem ende gena

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enide-kidus-dawit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enide Mihiretih Bizat Maregn (enide-mihiretih-bizat-maregn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 1
እጅግ በዛ የኔ ሀጢያት ከፀጉሬ
በመቅደስ እጮሀለሁ አቀርቅሬ
አትቅሰፈኝ በመአጥ አትገስፀኝ
ጌታዬ ሆይ የማዳንህን ደስታ ስጠኝ

VERSE 2
እንደማውቕ በአደባባይ ምን ብናገር
ስራዬ ግን ይህን እውነት አይመሰክር
ከእልፍኝ ብሄድ ርቄ ከአንተ ፍቅር
ሁሉን ከሰርኩ አላተረፍኩ አንዳች ነገር

VERSE 3
ማን እንደኔ ከትውልዱ የበደለ
መሀሪ አምላክ ከአንተ በቀር ወዴት አለ
የዳዊት ልጅ ማረኝ ብዬ እጮሀለሁ
እያነባሁ በጉልበቴ እሰግዳለሁ

VERSE 4
የሰጠኽኝ የልጅነት ክቡር ፀጋ
ቀራንዮ ላይ የከፈልከው የደም ዋጋ
በመዘንጋት የመስቀሉን ድንቅ ውለታ
ኮበለልኩኝ ከአንተ ሸሸሁ መስሎኝ ደስታ

VERSE 5
በመዳፈር እንደ አፍኒንና እንደ ፉንሀስ
ሰውነቴን አቆሽሻለሁ ያነተን መቅደስ
አሳልፈህ እንዳትሰጠኝ ለሀጢአቴ
እንደ ቀድሞ ልጄ በለኝ ደጉ አባቴ !

VERSE 6
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ',
      lyrics_transliteration = 'Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 1
Ejg beza yene het’iyat kets’egure
Bemeqdes ech’ohelehu aqerqre
Atqsefegn bemeat’ atgests’egn
Getaye hoy yemadanhn desta sit’egn

VERSE 2
Endemawቕ beadebabay min binager
Siraye gin yihn ewnet aymesekr
Keelfgn bihed riqe keante fiqr
Hulun keserku alaterefku andach neger

VERSE 3
Man endene ketwldu yebedele
Meheri amlak keante beqer wedet ale
Yedawit lij maregn biye ech’ohelehu
Eyanebahu begulbete esegdalehu

VERSE 4
Yeset’eኽgn yeljnet kibur ts’ega
Qeranyo lay yekefelkew yedem waga
Bemezengat yemesqelun dinq wileta
Kobelelkugn keante sheshehu meslogn desta

VERSE 5
Bemedafer ende afninna ende funhes
Sewneten aqoshshalehu yaneten meqdes
Asalfeh endatset’egn lehet’iate
Ende qedmo lije belegn degu abate !

VERSE 6
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enide-mihiretih-bizat-maregn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 1
እጅግ በዛ የኔ ሀጢያት ከፀጉሬ
በመቅደስ እጮሀለሁ አቀርቅሬ
አትቅሰፈኝ በመአጥ አትገስፀኝ
ጌታዬ ሆይ የማዳንህን ደስታ ስጠኝ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 2
እንደማውቕ በአደባባይ ምን ብናገር
ስራዬ ግን ይህን እውነት አይመሰክር
ከእልፍኝ ብሄድ ርቄ ከአንተ ፍቅር
ሁሉን ከሰርኩ አላተረፍኩ አንዳች ነገር

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 3
ማን እንደኔ ከትውልዱ የበደለ
መሀሪ አምላክ ከአንተ በቀር ወዴት አለ
የዳዊት ልጅ ማረኝ ብዬ እጮሀለሁ
እያነባሁ በጉልበቴ እሰግዳለሁ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 4
የሰጠኽኝ የልጅነት ክቡር ፀጋ
ቀራንዮ ላይ የከፈልከው የደም ዋጋ
በመዘንጋት የመስቀሉን ድንቅ ውለታ
ኮበለልኩኝ ከአንተ ሸሸሁ መስሎኝ ደስታ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 5
በመዳፈር እንደ አፍኒንና እንደ ፉንሀስ
ሰውነቴን አቆሽሻለሁ ያነተን መቅደስ
አሳልፈህ እንዳትሰጠኝ ለሀጢአቴ
እንደ ቀድሞ ልጄ በለኝ ደጉ አባቴ !

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 6
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 1
Ejg beza yene het’iyat kets’egure
Bemeqdes ech’ohelehu aqerqre
Atqsefegn bemeat’ atgests’egn
Getaye hoy yemadanhn desta sit’egn

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 2
Endemawቕ beadebabay min binager
Siraye gin yihn ewnet aymesekr
Keelfgn bihed riqe keante fiqr
Hulun keserku alaterefku andach neger

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 3
Man endene ketwldu yebedele
Meheri amlak keante beqer wedet ale
Yedawit lij maregn biye ech’ohelehu
Eyanebahu begulbete esegdalehu

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 4
Yeset’eኽgn yeljnet kibur ts’ega
Qeranyo lay yekefelkew yedem waga
Bemezengat yemesqelun dinq wileta
Kobelelkugn keante sheshehu meslogn desta

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 5
Bemedafer ende afninna ende funhes
Sewneten aqoshshalehu yaneten meqdes
Asalfeh endatset’egn lehet’iate
Ende qedmo lije belegn degu abate !

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 6
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enide-mihiretih-bizat-maregn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enide Yosef (enide-yosef)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን

VERSE 1
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን',
      lyrics_transliteration = 'Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen

VERSE 1
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enide-yosef'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን

VERSE 1
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን

CHORUS
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen

VERSE 1
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen

CHORUS
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enide-yosef', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enidemin Beretach (enidemin-beretach)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 1
የአሕዛብን ፈቃድ ያደረኩበት ቀን
እንደምን ይቆጠር ገብቶ በኔ ዘመን
ካየሁ ጀምሮ ይቆጠር እድሜዬ
ሳላውቅህ የኖርኩት የኔ አይደል ጌታዬ

VERSE 2
የትዕግስትህ መጠን ስፋቱ ጥልቅ ነው
ሁሌ እያጠፋሁ ቃልህ የፍቅር ነው
ረቡኒ ተናገር ላድምጥ በዝምታ
እስራቴ ይውለቅ ስትናገር ጌታ

VERSE 3
በኔ ውስጥ ምሰሶ እያለ ተጋርዶ
ዓይኔ ያያል የሰው የበደልን ነዶ
አልታዘዝ ብዬ ልቤን ሳትታዘብ
ሰው እየከሰስኩም አደረከኝ ገንዘብ

VERSE 4
ሰው ፊትን እያየ ሞገስን ሲያበዛ
ሚዛንህ ልብ ነው የዓለሙ ቤዛ
ከአገር የሰፋውን የእኔን እዳ ምረህ
ለትንሽ ስጨክን ይቅር አለኝ ልብህ

VERSE 5
ስላልተውከኝ ክበር ስላልተውከኝ ንገስ
የልቤ መድኃኒት ተስፋዬ ኢየሱስ',
      lyrics_transliteration = 'Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 1
Yeahzabn feqad yaderekubet qen
Endemn yiqot’er gebto bene zemen
Kayehu jemro yiqot’er edmeye
Salawqh yenorkut yene aydel Getaye

VERSE 2
Yetegsth met’en sifatu t’lq new
Hule eyat’efahu qalh yefqr new
Rebuni tenager ladmt’ bezmta
Esrate yiwleq sitnager Geta

VERSE 3
Bene wist’ miseso eyale tegardo
Ayne yayal yesew yebedeln nedo
Altazez biye liben sattazeb
Sew eyekeseskum aderekegn genzeb

VERSE 4
Sew fitn eyaye mogesn siyabeza
Mizanh lib new yealemu beza
Keager yesefawn yeenen eda mireh
Letnsh sich’ekn yiqr alegn libh

VERSE 5
Silaltewkegn kiber silaltewkegn niges
Yelbe medhanit tesfaye Iyesus',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enidemin-beretach'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 1
የአሕዛብን ፈቃድ ያደረኩበት ቀን
እንደምን ይቆጠር ገብቶ በኔ ዘመን
ካየሁ ጀምሮ ይቆጠር እድሜዬ
ሳላውቅህ የኖርኩት የኔ አይደል ጌታዬ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 2
የትዕግስትህ መጠን ስፋቱ ጥልቅ ነው
ሁሌ እያጠፋሁ ቃልህ የፍቅር ነው
ረቡኒ ተናገር ላድምጥ በዝምታ
እስራቴ ይውለቅ ስትናገር ጌታ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 3
በኔ ውስጥ ምሰሶ እያለ ተጋርዶ
ዓይኔ ያያል የሰው የበደልን ነዶ
አልታዘዝ ብዬ ልቤን ሳትታዘብ
ሰው እየከሰስኩም አደረከኝ ገንዘብ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 4
ሰው ፊትን እያየ ሞገስን ሲያበዛ
ሚዛንህ ልብ ነው የዓለሙ ቤዛ
ከአገር የሰፋውን የእኔን እዳ ምረህ
ለትንሽ ስጨክን ይቅር አለኝ ልብህ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 5
ስላልተውከኝ ክበር ስላልተውከኝ ንገስ
የልቤ መድኃኒት ተስፋዬ ኢየሱስ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 1
Yeahzabn feqad yaderekubet qen
Endemn yiqot’er gebto bene zemen
Kayehu jemro yiqot’er edmeye
Salawqh yenorkut yene aydel Getaye

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 2
Yetegsth met’en sifatu t’lq new
Hule eyat’efahu qalh yefqr new
Rebuni tenager ladmt’ bezmta
Esrate yiwleq sitnager Geta

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 3
Bene wist’ miseso eyale tegardo
Ayne yayal yesew yebedeln nedo
Altazez biye liben sattazeb
Sew eyekeseskum aderekegn genzeb

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 4
Sew fitn eyaye mogesn siyabeza
Mizanh lib new yealemu beza
Keager yesefawn yeenen eda mireh
Letnsh sich’ekn yiqr alegn libh

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 5
Silaltewkegn kiber silaltewkegn niges
Yelbe medhanit tesfaye Iyesus

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enidemin-beretach', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enidet Enidalefikut Alawikim (enidet-enidalefikut-alawikim)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን

VERSE 1
እንዴት ብዬ ጸንቶ ማቆም ያንተ ነው ስልጣኑ
አቅም የለው ጉልበት የለው ስጋ በዘመን
ደክሜ ማሁ ስወርድ አየሁት አምላኬ አብሮኝ ሲራመድ
ሲራመድ ሲራመድ ሲራመድ አብሮኝ ሲራመድ

VERSE 2
ሲራመድ ሲራመድ አብሮኝ ሲራመድ
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ

VERSE 3
አይተህልኝ መንገዴን
እንዴት ብዬ ቃል የለኝ ፍቅርን የሚለካ
ካየነው ከሰማነው ያለፈነው ለካ
የማለዳ ጸሃይ አይደለም ፍቃቴ

VERSE 4
አንተ ነህ ብርሃኔ አንተ ነህ ንጋቴ
አንተ ነህ አንተ ነህ አንተ ነህ ንጋቴ
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን

VERSE 5
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን
እንዴት ቃልም የለኝ አንድም ንግግር
ማለፊያ ማረፊያ ቅዱስ እግዚአብሄር

VERSE 6
በሸክላ ካኖርከው የክብርን መስገብ
የማልጠቅመውን ሰው ካረከኝ ገንዘብ
ካረከኝ ካረከኝ ገንዘብ
ካረከኝ ካረከኝ ገንዘብ

VERSE 7
እንዴት እንዳኖርከኝ አላውቅም
እንዴት እንዳለፍኩት ያን ቀን
አይኔ ሆነ ብርሃን ሆነ
አይተህልኝ መንገዴን',
      lyrics_transliteration = 'Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden

VERSE 1
Endet biye ts’ento maqom yante new silt’anu
Aqm yelew gulbet yelew siga bezemen
Dekme mahu siwerd ayehut amlake abrogn siramed
Siramed siramed siramed abrogn siramed

VERSE 2
Siramed siramed abrogn siramed
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone

VERSE 3
Aytehlgn mengeden
Endet biye qal yelegn fiqrn yemileka
Kayenew kesemanew yalefenew leka
Yemaleda ts’ehay aydelem fiqate

VERSE 4
Ante neh birhane ante neh nigate
Ante neh ante neh ante neh nigate
Endet endanorkegn alawqm
Endet endalefkut yan qen

VERSE 5
Ayne hone birhan hone
Aytehlgn mengeden
Endet qalm yelegn andm niggr
Malefiya marefiya Kidus egziabher

VERSE 6
Beshekla kanorkew yekbrn mesgeb
Yemalt’eqmewn sew karekegn genzeb
Karekegn karekegn genzeb
Karekegn karekegn genzeb

VERSE 7
Endet endanorkegn alawqm
Endet endalefkut yan qen
Ayne hone birhan hone
Aytehlgn mengeden',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enidet-enidalefikut-alawikim'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enidet-enidalefikut-alawikim', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enidetenagere Tenesitwal (enidetenagere-tenesitwal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 1
እንደተናገረው በገሊላ ሳለ
በኃጥያተኞች እጅ በእንጨት ተሰቀለ
በሶስተኛውም ቀን ከሙታን ተነሳ
ሞትን አሸንፎ የይሁዳ አንበሳ

VERSE 2
መግደላዊት ማርያም ወጣች በማለዳ
ሽቶ ልትቀባው ከመቃብር ወርዳ
የመቃብር መዝጊያው ድንጋይ ተንከባሏል
ስጋው በዚያ የለም ኢየሱስ ተነስቷል

VERSE 3
ነፍሴን የመለሰው ከአጥያት ጎዳና
ጌታዬ ተወስዷል ስትል በእንባ ሆና
ለምን ታለቅሻለሽ ሲላት የነበረው
የአትክልት ጠባቂው አደለም ጌታ ነው

VERSE 4
የጌታን መነሳት አትጠራጠሩ
ጴጥሮስም አትሂድ ወደ መቃብሩ
ቅዠት መስሎ ዜናው ከቶ አይታያችሁ
የሆነው ድንቅ ነው ይቀበል ልባችሁ

VERSE 5
በሲዖል ባልተወን ባከበረን ጌታ
ሰላም ታወጀልን አለን በፀጥታ
መውጊያው ወዴት አለ ብለን የዘመርነው
በትንሳኤው ብርሃን ሞት ድል ተነስቶ ነው',
      lyrics_transliteration = 'Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 1
Endetenagerew begelila sale
Behat’yategnoch ej beench’et teseqele
Besostegnawm qen kemutan tenesa
Motn ashenfo yeyhuda anbesa

VERSE 2
Megdelawit Maryam wet’ach bemaleda
Shto litqebaw kemeqabr werda
Yemeqabr mezgiyaw dingay tenkebalwal
Sigaw beziya yelem Iyesus tenestwal

VERSE 3
Nefsen yemelesew keat’yat godana
Getaye tewesdwal sitl beenba hona
Lemn taleqshalesh silat yeneberew
Yeatklt t’ebaqiw adelem Geta new

VERSE 4
Yegetan menesat att’erat’eru
P’et’rosm athid wede meqabru
Qizhet meslo zenaw keto aytayachhu
Yehonew dinq new yiqebel libachhu

VERSE 5
Besiol baltewen bakeberen Geta
Selam tawejeln alen bets’et’ta
Mewgiyaw wedet ale bilen yezemernew
Betnsaew birhan mot dil tenesto new',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enidetenagere-tenesitwal'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enidetenagere-tenesitwal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enidih Bearat Netib Lizega Mierafu (enidih-bearat-netib-lizega-mierafu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንድህ በአራት ነጥብ ሊዘጋ ምዕራፉ
እግዚአብሔር ሊያሸንፍ የእርሱ ሆኖ ሰልፉ መልካም ለመናገር አፉ ባይታደል
ይህን እስኪያይ ጠላት ምን አለ ዝም በል(2)
መልካሙን ደብቆ ክፉን እያሳየ

VERSE 1
ይለኝ ነበር ጠላት እግዚአብሔር ዘገየ
ግን ሁሉን በጊዜዉ ዉብ አርጎ ሲሰራ
አፍሯል ለዘላለም ደንቆት የእርሱ ሥራ(2)
በቃ ልጅ የለህም አትወልድም ሳራ

VERSE 2
ላይሰማህ እግዚአብሔር ጮኼህ በትጣራ እያለ ጠላቴ መስሎት ያሸነፈ
ይስሐቅ ተወለደ ያ ቀንም አለፈ(2)
ፍፃሜዬን ሳያይ ገና ከጅምሩ ጠላት በእርሱ ግምት ብዙ መናገሩ አስብሎታል
ተቄል ተቀይሮ ስሙ የዘገየ መስሎ ግታ በመቅደሙ(2)

VERSE 3
ድንጋይ ያሸከመን ዉኀ ተሸከመ ለእኛ ቀን ወጣልን ለእርሱ ግን ጨለመ ገዳይ ብዘገይም ሟች በመገስገሱ ፈረሰኛዉ ሞተ እስከነ ፈረሱ(2)
ብመስለንም ሌቱ ፍፁም የማይነጋ ተቆልፎ የምቀር በሩ እንደተዘጋ እርሱን ተስፋ አድርገዉ በአመንክበት ፅና ቀን
አለዉ እግዚአብሔር ያደርግሃል ቀና(2)',
      lyrics_transliteration = 'Endh bearat net’b lizega mierafu
Egziabher liyashenf yeersu hono selfu melkam lemenager afu baytadel
Yihn eskiyay t’elat min ale zim bel (2)
Melkamun debqo kifun eyasaye

VERSE 1
Yilegn neber t’elat Egziabher zegeye
Gin hulun begizewu wub argo sisera
Afrwal lezelalem denqot yeersu sira (2)
Beqa lij yelehm atweldm sara

VERSE 2
Laysemah Egziabher ch’oኼh bett’ara eyale t’elate meslot yashenefe
Yisheq tewelede ya qenm alefe (2)
Fits’ameyen sayay gena kejmru t’elat beersu gimt bizu menageru asblotal
Teqel teqeyro simu yezegeye meslo gita bemeqdemu (2)

VERSE 3
Dingay yashekemen wuhe teshekeme leegna qen wet’aln leersu gin ch’eleme geday bizegeym mwach bemegesgesu feresegnawu mote eskene feresu (2)
Bimeslenm letu fits’um yemaynega teqolfo yemqer beru endetezega ersun tesfa adrgewu beamenkbet ts’na qen
Alewu Egziabher yaderghal qena (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enidih-bearat-netib-lizega-mierafu'
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
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enidih-bearat-netib-lizega-mierafu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 100 THEN
    RAISE EXCEPTION 'Batch 03 count mismatch: expected 100, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Batch 03 completed: % hymns updated.', v_total;
END $batch_03$;
