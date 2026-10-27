-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 01 OF 32
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
  -- absera-gebriel ("Absera Gebriel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c560903e-5d40-42d6-89a6-930b2631c43b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 1
ሚካኤል መልአክ በክነፍ ሕፁራ
መንጦላዕት ደመና ሰወራ
ንፅሕት በድንግልና
አልባሲ ሙስና ተወልደ ወልድ እምኔሀ

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 2
ገብርኤል ማርያምን አበሰራት አበሰራት
ወንድ ልጅን ተወልጃለሽ አላት

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 3
ሚካኤል መልአክ በክንፉ ከለላት
የሰማይ መጋረጃውን ሸፈናት
ንፅሕት ናትና በድንግልና /2/
ጥፋት የለባትምና ወንድ ልጅን ወልዳልናለችና

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 1
Mikael melak beknef hits’ura
Ment’olaet demena sewera
Nits’ht bedingilina
Albasi musna tewelde Weld emnehe

CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 2
Gebriel Maryamn abeserat abeserat
Wend lijn teweljalesh alat

CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 3
Mikael melak beknfu kelelat
Yesemay megarejawn shefenat
Nits’ht natna bedingilina (2)
T’fat yelebatmna wend lijn weldalnalechna

CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 1
ሚካኤል መልአክ በክነፍ ሕፁራ
መንጦላዕት ደመና ሰወራ
ንፅሕት በድንግልና
አልባሲ ሙስና ተወልደ ወልድ እምኔሀ

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 2
ገብርኤል ማርያምን አበሰራት አበሰራት
ወንድ ልጅን ተወልጃለሽ አላት

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 3
ሚካኤል መልአክ በክንፉ ከለላት
የሰማይ መጋረጃውን ሸፈናት
ንፅሕት ናትና በድንግልና /2/
ጥፋት የለባትምና ወንድ ልጅን ወልዳልናለችና

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ',
        lyrics_transliteration = 'CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 1
Mikael melak beknef hits’ura
Ment’olaet demena sewera
Nits’ht bedingilina
Albasi musna tewelde Weld emnehe

CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 2
Gebriel Maryamn abeserat abeserat
Wend lijn teweljalesh alat

CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 3
Mikael melak beknfu kelelat
Yesemay megarejawn shefenat
Nits’ht natna bedingilina (2)
T’fat yelebatmna wend lijn weldalnalechna

CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c560903e-5d40-42d6-89a6-930b2631c43b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 1
ሚካኤል መልአክ በክነፍ ሕፁራ
መንጦላዕት ደመና ሰወራ
ንፅሕት በድንግልና
አልባሲ ሙስና ተወልደ ወልድ እምኔሀ

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 2
ገብርኤል ማርያምን አበሰራት አበሰራት
ወንድ ልጅን ተወልጃለሽ አላት

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 3
ሚካኤል መልአክ በክንፉ ከለላት
የሰማይ መጋረጃውን ሸፈናት
ንፅሕት ናትና በድንግልና /2/
ጥፋት የለባትምና ወንድ ልጅን ወልዳልናለችና

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Absera Gebriel le Maryam weyibela weyibela tiweldi weld

VERSE 1
Mika’el mel’ak bekenef hitsura
Mento laet demena sewera
Nitsihit bedingilina
Al basi mus’na tewelde weld emneha

CHORUS
Absera Gebriel le Maryam weyibela weyibela tiweldi weld

VERSE 2
Gebriel Maryamn abeserat abeserat
Wend lijin teweljalesh alat

CHORUS
Absera Gebriel le Maryam weyibela weyibela tiweldi weld

VERSE 3
Mika’el mel’ak bek’nefu kelelat
Yesemay megarajawin shefenat
Nitsihit natena bedingilina (x2)
Tifat yelebatemna
Wend lijin weldalinalechna

CHORUS
Absera Gebriel le Maryam weyibela weyibela tiweldi weld';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c560903e-5d40-42d6-89a6-930b2631c43b'::uuid, 'absera-gebriel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ahade-leke-we-ahade-lemuse ("Ahade Leke we Ahade le Musie")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'dda9c224-687b-49df-8228-b3a6c7f1c031'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

VERSE 1
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)

VERSE 1
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)

CHORUS
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

VERSE 1
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)',
        lyrics_transliteration = 'CHORUS
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)

VERSE 1
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)

CHORUS
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'dda9c224-687b-49df-8228-b3a6c7f1c031'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

VERSE 1
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)

VERSE 1
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)

CHORUS
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'dda9c224-687b-49df-8228-b3a6c7f1c031'::uuid, 'ahade-leke-we-ahade-lemuse', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adegnegn-enate-kesega-fetena ("Adegnegn Enate Kesega Fetena")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fc269c44-d9f6-4fc2-8633-f41a48681023'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሃይል
ምንም ቢበዛብሽ የኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 2
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 3
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 4
ተስፋዬ ነሽና እመካብሻለሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሠጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 5
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 6
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 7
በስጋ ደክሜ በነፍስ እንዳልጠፋ
እማጸንሻለሁ ድንግል የኔ ተስፋ
የመንግስቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራ መስራት እኔን አስተምሪኝ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 8
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 9
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 10
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመካከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኝልን ጓዳውን (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 11
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 1
YeAmanuel enat yetewahdo aklil
Att’fi kemehal endthognn hayl
Minm bibezabsh yegna gusqulna
Kegna gara kehonsh alen qidsna (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 2
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 3
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 4
Tesfaye neshna emekabshalehu
Gira qegnm all mirkognash hognalehu
Siqbezebez ayto tesfa yeset’egn
Egziabher yemesgen kanchi yast’egagn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 5
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 6
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 7
Besga dekme benefs endalt’efa
Emats’enshalehu Dingil yene tesfa
Yemengstu werash endhon adrgign
Melkam sira mesrat enen astemrign (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 8
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 9
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 10
Anchi yeleleshbet gubaew bado new
Bequm yedereqe hiywet yeteleyew
Kemekakel gebtesh muy yegodelewn
Sergu tedegswal gobgnln gwadawn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 11
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሃይል
ምንም ቢበዛብሽ የኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 2
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 3
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 4
ተስፋዬ ነሽና እመካብሻለሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሠጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 5
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 6
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 7
በስጋ ደክሜ በነፍስ እንዳልጠፋ
እማጸንሻለሁ ድንግል የኔ ተስፋ
የመንግስቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራ መስራት እኔን አስተምሪኝ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 8
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 9
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 10
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመካከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኝልን ጓዳውን (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 11
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)',
        lyrics_transliteration = 'CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 1
YeAmanuel enat yetewahdo aklil
Att’fi kemehal endthognn hayl
Minm bibezabsh yegna gusqulna
Kegna gara kehonsh alen qidsna (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 2
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 3
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 4
Tesfaye neshna emekabshalehu
Gira qegnm all mirkognash hognalehu
Siqbezebez ayto tesfa yeset’egn
Egziabher yemesgen kanchi yast’egagn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 5
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 6
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 7
Besga dekme benefs endalt’efa
Emats’enshalehu Dingil yene tesfa
Yemengstu werash endhon adrgign
Melkam sira mesrat enen astemrign (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 8
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 9
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 10
Anchi yeleleshbet gubaew bado new
Bequm yedereqe hiywet yeteleyew
Kemekakel gebtesh muy yegodelewn
Sergu tedegswal gobgnln gwadawn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 11
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fc269c44-d9f6-4fc2-8633-f41a48681023'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሃይል
ምንም ቢበዛብሽ የኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 2
አዝ....

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 3
ተስፋዬ ነሽና እመካብሻለሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሠጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 4
አዝ.....

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 5
በስጋ ደክሜ በነፍስ እንዳልጠፋ
እማጸንሻለሁ ድንግል የኔ ተስፋ
የመንግስቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራ መስራት እኔን አስተምሪኝ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 6
አዝ......

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 7
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመካከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኝልን ጓዳውን (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adegnegn Enate Kesega Fetena
Segaye Kehatiat Keto Arakemena
Shekeme Yekebede Bechegna Hognalehu
Ateleyegn Dingel Adera Eleshalehu (2)

VERSE 1
YeAmanuel Enat Yetewado Akelil
Atetfi Kemhal Endetehognen Haile
Minem Bebezabesh yegna Guskulena
Kegna Gar Kehonesh Alen Kidesena (2)

CHORUS
Adegnegn Enate Kesega Fetena
Segaye Kehatiat Keto Arakemena
Shekeme Yekebede Bechegna Hognalehu
Ateleyegn Dingel Adera Eleshalehu (2)

VERSE 2
Az....

CHORUS
Adegnegn Enate Kesega Fetena
Segaye Kehatiat Keto Arakemena
Shekeme Yekebede Bechegna Hognalehu
Ateleyegn Dingel Adera Eleshalehu (2)

VERSE 3
Tesfaye Neshena Emekabeshalehu
Gera Kegnem Alele Merkognaesh Hognalehu
Sikbezebez Ayito Tesfa Yesetegn
Egziabher Yemesgen Kanchi Yastegagn (2)

CHORUS
Adegnegn Enate Kesega Fetena
Segaye Kehatiat Keto Arakemena
Shekeme Yekebede Bechegna Hognalehu
Ateleyegn Dingel Adera Eleshalehu (2)

VERSE 4
Az.....

CHORUS
Adegnegn Enate Kesega Fetena
Segaye Kehatiat Keto Arakemena
Shekeme Yekebede Bechegna Hognalehu
Ateleyegn Dingel Adera Eleshalehu (2)

VERSE 5
Besega Dekeme Benefes Endaletefa
Ematseneshalehu Dengel Yene Tesfa
Yemengistu Werash Endethon Adregegn
Melkam Sera Mesrat Enen Astemeregn (2)

CHORUS
Adegnegn Enate Kesega Fetena
Segaye Kehatiat Keto Arakemena
Shekeme Yekebede Bechegna Hognalehu
Ateleyegn Dingel Adera Eleshalehu (2)

VERSE 6
Az......

CHORUS
Adegnegn Enate Kesega Fetena
Segaye Kehatiat Keto Arakemena
Shekeme Yekebede Bechegna Hognalehu
Ateleyegn Dingel Adera Eleshalehu (2)

VERSE 7
Anchi Yeleshebet Gubaewe bado new
Bekum Yedereke Hiwot Yeteleyew
Kemkakel Gebtesh Muye Yegodelewen
Sergu Tedegswal Gbgnlen Gwadawan (2)

CHORUS
Adegnegn Enate Kesega Fetena
Segaye Kehatiat Keto Arakemena
Shekeme Yekebede Bechegna Hognalehu
Ateleyegn Dingel Adera Eleshalehu (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fc269c44-d9f6-4fc2-8633-f41a48681023'::uuid, 'adegnegn-enate-kesega-fetena', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hawaz-tegegn-mezmur ("Hawaz tegegn mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b719acaa-d527-49b3-b1eb-f639dbb1d3aa'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Moten yesharelgn hiywete yawejelegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b719acaa-d527-49b3-b1eb-f639dbb1d3aa'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሞቴን የሻረልኝ ህይወቴ ያወጀለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b719acaa-d527-49b3-b1eb-f639dbb1d3aa'::uuid, 'hawaz-tegegn-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe ("Tewedaj Yekidus Mikael Mezimurat Liredagn Meta//yeafomiya Eredat Neh//beberehaw Beharuru")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '30b59bda-d61d-44b8-a641-5621760f7274'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 1
መንገድ የመራኸው - - ኃያል ቅዱስ ሚካኤል
የኤርትራን ባህር - - ኃያል ሚካኤል
ከፍለህ ያሻገርከው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 2
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የአፎሚያ ረዳት ነህ ሚካኤል(፪)
ቅሩበ እግዚአብሔር የልዑል
ፈጥነህ ድረስልን ስንጠራህ ሚካኤል

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 3
ፊት ለፊታችን አምላክ ሰደደህ
አቀናህልን መንገዱን ጠርገህ
የቤልሆርን ምክር አፈረስክ
ከልጆችህ ጋር ከነአን ደረስክ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 4
ከኛ ጋር ነበርክ አርባውን ዘመን
እንጠራሃለን ሚካኤል ብለን
የአፎሚያ ረዳት ነህ ሚካኤል(፪)
ቅሩበ እግዚአብሔር የልዑል

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 5
ፈጥነህ ድረስልን ስንጠራህ ሚካኤል
በበረሃው በሀሩሩ፣
በሚያስፈራው በባሕሩ፣
እስራኤልን የታደገው፣

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 6
በክንፎቹ የጋረደው ሚካኤል ነው።
ሚካኤል ነው አጽናኝ ደጋፊዬ
" " በዱር በበረሃ
" " ነፍሴን ያረካልኝ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 7
" " ከዓለቱ ውሃ
የፊቴ ፈገግታ የውስጤ ፍስሐ
ከአምላክ የተሠጠኝ በረከት አምሐ።
ሚካኤል ነው ያሳደገኝ መልአክ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 8
" " በፍቅር የመራኝ
" " ስደክም ያገዘኝ
" " ስወድቅ ያነሳኝ
በነገሬ ሁሉ የቀደመልኝ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 9
ሚካኤል እርሱ ነው ከጥልቁ ያወጣኝ።
በበረሃው በሀሩሩ፣
በሚያስፈራው በባሕሩ፣
እስራኤልን የታደገው፣

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 10
በክንፎቹ የጋረደው ሚካኤል ነው።

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 1
Menged yemeraኸw - - hayal Kidus Mikael
Yeertran bahr - - hayal Mikael
Kefleh yashagerkew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 2
Yit’ebqegnal hayal Kidus Mikael
Yeafomiya redat neh Mikael (2)
Qirube Egziabher yelul
Fet’neh diresln sint’erah Mikael

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 3
Fit lefitachn amlak sededeh
Aqenahln mengedun t’ergeh
Yebelhorn mikr aferesk
Keljochh gar kenean deresk

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 4
Kegna gar neberk arbawn zemen
Ent’erahalen Mikael bilen
Yeafomiya redat neh Mikael (2)
Qirube Egziabher yelul

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 5
Fet’neh diresln sint’erah Mikael
Beberehaw beheruru,
Bemiyasferaw bebahru,
Esraeln yetadegew,

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 6
Beknfochu yegaredew Mikael new.
Mikael new ats’nagn degafiye
" " bedur bebereha
" " nefsen yarekalgn

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 7
" " kealetu wiha
Yefite fegegta yewst’e fishe
Keamlak yeteset’egn bereket amhe.
Mikael new yasadegegn melak

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 8
" " befqr yemeragn
" " sidekm yagezegn
" " siwedq yanesagn
Benegere hulu yeqedemelgn

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 9
Mikael ersu new ket’lqu yawet’agn.
Beberehaw beheruru,
Bemiyasferaw bebahru,
Esraeln yetadegew,

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 10
Beknfochu yegaredew Mikael new.

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 1
መንገድ የመራኸው - - ኃያል ቅዱስ ሚካኤል
የኤርትራን ባህር - - ኃያል ሚካኤል
ከፍለህ ያሻገርከው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 2
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የአፎሚያ ረዳት ነህ ሚካኤል(፪)
ቅሩበ እግዚአብሔር የልዑል
ፈጥነህ ድረስልን ስንጠራህ ሚካኤል

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 3
ፊት ለፊታችን አምላክ ሰደደህ
አቀናህልን መንገዱን ጠርገህ
የቤልሆርን ምክር አፈረስክ
ከልጆችህ ጋር ከነአን ደረስክ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 4
ከኛ ጋር ነበርክ አርባውን ዘመን
እንጠራሃለን ሚካኤል ብለን
የአፎሚያ ረዳት ነህ ሚካኤል(፪)
ቅሩበ እግዚአብሔር የልዑል

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 5
ፈጥነህ ድረስልን ስንጠራህ ሚካኤል
በበረሃው በሀሩሩ፣
በሚያስፈራው በባሕሩ፣
እስራኤልን የታደገው፣

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 6
በክንፎቹ የጋረደው ሚካኤል ነው።
ሚካኤል ነው አጽናኝ ደጋፊዬ
" " በዱር በበረሃ
" " ነፍሴን ያረካልኝ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 7
" " ከዓለቱ ውሃ
የፊቴ ፈገግታ የውስጤ ፍስሐ
ከአምላክ የተሠጠኝ በረከት አምሐ።
ሚካኤል ነው ያሳደገኝ መልአክ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 8
" " በፍቅር የመራኝ
" " ስደክም ያገዘኝ
" " ስወድቅ ያነሳኝ
በነገሬ ሁሉ የቀደመልኝ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 9
ሚካኤል እርሱ ነው ከጥልቁ ያወጣኝ።
በበረሃው በሀሩሩ፣
በሚያስፈራው በባሕሩ፣
እስራኤልን የታደገው፣

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 10
በክንፎቹ የጋረደው ሚካኤል ነው።

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል',
        lyrics_transliteration = 'CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 1
Menged yemeraኸw - - hayal Kidus Mikael
Yeertran bahr - - hayal Mikael
Kefleh yashagerkew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 2
Yit’ebqegnal hayal Kidus Mikael
Yeafomiya redat neh Mikael (2)
Qirube Egziabher yelul
Fet’neh diresln sint’erah Mikael

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 3
Fit lefitachn amlak sededeh
Aqenahln mengedun t’ergeh
Yebelhorn mikr aferesk
Keljochh gar kenean deresk

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 4
Kegna gar neberk arbawn zemen
Ent’erahalen Mikael bilen
Yeafomiya redat neh Mikael (2)
Qirube Egziabher yelul

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 5
Fet’neh diresln sint’erah Mikael
Beberehaw beheruru,
Bemiyasferaw bebahru,
Esraeln yetadegew,

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 6
Beknfochu yegaredew Mikael new.
Mikael new ats’nagn degafiye
" " bedur bebereha
" " nefsen yarekalgn

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 7
" " kealetu wiha
Yefite fegegta yewst’e fishe
Keamlak yeteset’egn bereket amhe.
Mikael new yasadegegn melak

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 8
" " befqr yemeragn
" " sidekm yagezegn
" " siwedq yanesagn
Benegere hulu yeqedemelgn

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 9
Mikael ersu new ket’lqu yawet’agn.
Beberehaw beheruru,
Bemiyasferaw bebahru,
Esraeln yetadegew,

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 10
Beknfochu yegaredew Mikael new.

CHORUS
✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael',
        updated_at = clock_timestamp()::text
    WHERE import_id = '30b59bda-d61d-44b8-a641-5621760f7274'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 1
መንገድ የመራኸው - - ኃያል ቅዱስ ሚካኤል
የኤርትራን ባህር - - ኃያል ሚካኤል
ከፍለህ ያሻገርከው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 2
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የአፎሚያ ረዳት ነህ ሚካኤል(፪)
ቅሩበ እግዚአብሔር የልዑል
ፈጥነህ ድረስልን ስንጠራህ ሚካኤል

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 3
ፊት ለፊታችን አምላክ ሰደደህ
አቀናህልን መንገዱን ጠርገህ
የቤልሆርን ምክር አፈረስክ
ከልጆችህ ጋር ከነአን ደረስክ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 4
ከኛ ጋር ነበርክ አርባውን ዘመን
እንጠራሃለን ሚካኤል ብለን
የአፎሚያ ረዳት ነህ ሚካኤል(፪)
ቅሩበ እግዚአብሔር የልዑል

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 5
ፈጥነህ ድረስልን ስንጠራህ ሚካኤል
በበረሃው በሀሩሩ፣
በሚያስፈራው በባሕሩ፣
እስራኤልን የታደገው፣

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 6
በክንፎቹ የጋረደው ሚካኤል ነው።
ሚካኤል ነው አጽናኝ ደጋፊዬ
" " በዱር በበረሃ
" " ነፍሴን ያረካልኝ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 7
" " ከዓለቱ ውሃ
የፊቴ ፈገግታ የውስጤ ፍስሐ
ከአምላክ የተሠጠኝ በረከት አምሐ።
ሚካኤል ነው ያሳደገኝ መልአክ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 8
" " በፍቅር የመራኝ
" " ስደክም ያገዘኝ
" " ስወድቅ ያነሳኝ
በነገሬ ሁሉ የቀደመልኝ

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 9
ሚካኤል እርሱ ነው ከጥልቁ ያወጣኝ።
በበረሃው በሀሩሩ፣
በሚያስፈራው በባሕሩ፣
እስራኤልን የታደገው፣

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 10
በክንፎቹ የጋረደው ሚካኤል ነው።

CHORUS
✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '30b59bda-d61d-44b8-a641-5621760f7274'::uuid, 'tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- altewengem-geta ("Altewengem Geta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b755c051-a70d-46b7-8a5b-9def2c4eb9d3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 1
በበደል ጉራንጉር በሃጢያት ጫካ
ብጠፋበት እንኳን አልተወኝም ለካ

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 2
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል /2/
ለካስ አልጠላኝም ጌታ ይወደኛል /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 3
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ስረሳው

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 4
ለእኔ ያለው ፍቅር አልቀነሰብኝም /2/
ዛሬም ይወደኛል ጌታ አልጠላኝም /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 5
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 6
በህይወቴ ሁሉ ፍጽም ለመራኝ /2/
ክብርና ምስጋና አቀርባለሁኝ /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 1
Bebedel gurangur behatiyat chaka
Bitefabet enkwan altewengem leka

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 2
Zarem lijé bilo dagim yit’eral (x2)
Lekas alt’elagñim geta yiwedegnal (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 3
Lesilt’an lekibre biye sikdew
Legenzeb adilché ené siresew

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 4
Lene yalew fiqir alqenesebignim (x2)
Zarem yiwedegnal geta alt’elagñim (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 5
Tadiya lezih fiqru lelelow wesan
Kechinqa meqaber lawetagñ ené

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 6
Behiywete hulu fits’um lemeragn (x2)
Kibirna misgana aqerbalewgn (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 1
በበደል ጉራንጉር በሃጢያት ጫካ
ብጠፋበት እንኳን አልተወኝም ለካ

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 2
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል /2/
ለካስ አልጠላኝም ጌታ ይወደኛል /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 3
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ስረሳው

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 4
ለእኔ ያለው ፍቅር አልቀነሰብኝም /2/
ዛሬም ይወደኛል ጌታ አልጠላኝም /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 5
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 6
በህይወቴ ሁሉ ፍጽም ለመራኝ /2/
ክብርና ምስጋና አቀርባለሁኝ /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል',
        lyrics_transliteration = 'CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 1
Bebedel gurangur behatiyat chaka
Bitefabet enkwan altewengem leka

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 2
Zarem lijé bilo dagim yit’eral (x2)
Lekas alt’elagñim geta yiwedegnal (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 3
Lesilt’an lekibre biye sikdew
Legenzeb adilché ené siresew

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 4
Lene yalew fiqir alqenesebignim (x2)
Zarem yiwedegnal geta alt’elagñim (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 5
Tadiya lezih fiqru lelelow wesan
Kechinqa meqaber lawetagñ ené

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 6
Behiywete hulu fits’um lemeragn (x2)
Kibirna misgana aqerbalewgn (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b755c051-a70d-46b7-8a5b-9def2c4eb9d3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 1
በበደል ጉራንጉር በሃጢያት ጫካ
ብጠፋበት እንኳን አልተወኝም ለካ

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 2
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል /2/
ለካስ አልጠላኝም ጌታ ይወደኛል /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 3
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ስረሳው

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 4
ለእኔ ያለው ፍቅር አልቀነሰብኝም /2/
ዛሬም ይወደኛል ጌታ አልጠላኝም /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 5
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 6
በህይወቴ ሁሉ ፍጽም ለመራኝ /2/
ክብርና ምስጋና አቀርባለሁኝ /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 1
Bebedel gurangur behatiyat chaka
Bitefabet enkwan altewengem leka

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 2
Zarem lijé bilo dagim yit’eral (x2)
Lekas alt’elagñim geta yiwedegnal (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 3
Lesilt’an lekibre biye sikdew
Legenzeb adilché ené siresew

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 4
Lene yalew fiqir alqenesebignim (x2)
Zarem yiwedegnal geta alt’elagñim (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 5
Tadiya lezih fiqru lelelow wesan
Kechinqa meqaber lawetagñ ené

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 6
Behiywete hulu fits’um lemeragn (x2)
Kibirna misgana aqerbalewgn (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b755c051-a70d-46b7-8a5b-9def2c4eb9d3'::uuid, 'altewengem-geta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aman-beaman ("Aman Beaman")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '546bc23f-39f8-427d-9939-862dd881a25b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)

VERSE 1
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)

CHORUS
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)

VERSE 1
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)

CHORUS
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)

VERSE 1
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)

CHORUS
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)',
        lyrics_transliteration = 'CHORUS
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)

VERSE 1
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)

CHORUS
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '546bc23f-39f8-427d-9939-862dd881a25b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)

VERSE 1
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)

CHORUS
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)

VERSE 1
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)

CHORUS
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '546bc23f-39f8-427d-9939-862dd881a25b'::uuid, 'aman-beaman', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aman-beaman-menkir ("Aman beAman Menkir")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '55e354a2-c775-46b6-a496-ca9172e7be26'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን /2/
መንክር /2 ጊዜ/

VERSE 1
መንክር ስብሐተ ልደቱ /4 ጊዜ/

CHORUS
አማን በአማን /2/
መንክር /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
eman beeman /2/
menkr /2 gize/

VERSE 1
menkr sbhete ldetu /4 gize/

CHORUS
eman beeman /2/
menkr /2 gize/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አማን በአማን /2/
መንክር /2 ጊዜ/

VERSE 1
መንክር ስብሐተ ልደቱ /4 ጊዜ/

CHORUS
አማን በአማን /2/
መንክር /2 ጊዜ/',
        lyrics_transliteration = 'CHORUS
eman beeman /2/
menkr /2 gize/

VERSE 1
menkr sbhete ldetu /4 gize/

CHORUS
eman beeman /2/
menkr /2 gize/',
        updated_at = clock_timestamp()::text
    WHERE import_id = '55e354a2-c775-46b6-a496-ca9172e7be26'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን /2/
መንክር /2 ጊዜ/

VERSE 1
መንክር ስብሐተ ልደቱ /4 ጊዜ/

CHORUS
አማን በአማን /2/
መንክር /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
eman beeman /2/
menkr /2 gize/

VERSE 1
menkr sbhete ldetu /4 gize/

CHORUS
eman beeman /2/
menkr /2 gize/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '55e354a2-c775-46b6-a496-ca9172e7be26'::uuid, 'aman-beaman-menkir', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- meskelun-sisalem-orthodox-tewahido-song-zemari-hawaz-tegegn ("Meskelun Sisalem Orthodox Tewahido Song Zemari Hawaz Tegegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '30d64d46-58cf-4cf6-8ae0-fc9dc1b79e64'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 1
ባርከኒ በመስቀልከ ክቡር
ሃሳቤ ታውሮ በምኞት ተጋርዶ
አይነ ህሊናዬ ወደ ተምና ወርዶ
ደጄን እያንካካህ ሣለህ ከበራፌ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 2
ለበደል ስጀግን ለጽድቅህ ሰንፌ
አሁን ግን መለስከኝ ግርዶሹ ገፈፈ
የመስቀልህ ብርሃን ሞቴን አሸነፈ
ተስፋ የተለየው የራቀው ደስታ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 3
ነውር ያደቀቀው ለአለም የተረታ
ሆኜ እንዳልነበር የአመጽ ጦር እቃ
ሳልጠፋ ታደግኸኝ ቀኔ ሳያበቃ
አጋጣሚ አይደለም ፈቅደህ ነው ጌታዬ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 4
በመስቀልህ ቀረ የውድቀት ጉዞዬ
ካህኑ መዳፍ ላይ ሳየው መስቀልህን
ድቅን አለ በአይኔ ሳልኩት ችንካርህን
የእሾህ አክሊል ጦሩ ጅራፍ ግርፋቱ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 5
ስለሕይወቴ ነው እንዳልቀር በከንቱ
ቅዱስ ምልክትህ ሆነልኝ መዳኛ
መስቀልህ አርገኝ የፍቅርህ ምርኮኛ
የተጣለች ነፍሴ በደምህ ተዋጅታ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 6
አሁን አዲስ ነው ነኝ ቸርነትህ በዝታ
አለምም ለእኔ እኔም ለአለም ሞትኩ
አምላኬ በቤትህ ለመኖር ተመረጥኩ
እግሮቼ ከእንግዲህ ላንተ ይሮጣሉ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 7
ቃላቶቼ ፍቅርህን ይመስከራሉ
ኢየሱስ ስምህን በእምነት እጠራለሁ
ቅዱስ መስቀልህን እሳለመዋለሁ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 1
Barkeni bemesqelke kibur
Hasabe tawro bemgnot tegardo
Ayne hilinaye wede temna werdo
Dejen eyankakah saleh keberafe

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 2
Lebedel sijegn lets’dqh senfe
Ahun gin meleskegn girdoshu gefefe
Yemesqelh birhan moten ashenefe
Tesfa yeteleyew yeraqew desta

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 3
Newr yadeqeqew lealem yetereta
Hogne endalneber yeamets’ t’or eqa
Salt’efa tadegኸgn qene sayabeqa
Agat’ami aydelem feqdeh new Getaye

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 4
Bemesqelh qere yewdqet guzoye
Kahnu medaf lay sayew mesqelhn
Diqn ale beayne salkut chnkarhn
Yeeshoh aklil t’oru jiraf girfatu

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 5
Silehywete new endalqer bekentu
Kidus milkth honelgn medagna
Mesqelh argegn yefqrh mirkogna
Yetet’alech nefse bedemh tewajta

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 6
Ahun adis new negn cherneth bezta
Alemm leene enem lealem motku
Amlake bebeth lemenor temeret’ku
Egroche keengdih lante yirot’alu

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 7
Qalatoche fiqrhn yimeskeralu
Iyesus simhn beemnet et’eralehu
Kidus mesqelhn esalemewalehu

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 1
ባርከኒ በመስቀልከ ክቡር
ሃሳቤ ታውሮ በምኞት ተጋርዶ
አይነ ህሊናዬ ወደ ተምና ወርዶ
ደጄን እያንካካህ ሣለህ ከበራፌ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 2
ለበደል ስጀግን ለጽድቅህ ሰንፌ
አሁን ግን መለስከኝ ግርዶሹ ገፈፈ
የመስቀልህ ብርሃን ሞቴን አሸነፈ
ተስፋ የተለየው የራቀው ደስታ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 3
ነውር ያደቀቀው ለአለም የተረታ
ሆኜ እንዳልነበር የአመጽ ጦር እቃ
ሳልጠፋ ታደግኸኝ ቀኔ ሳያበቃ
አጋጣሚ አይደለም ፈቅደህ ነው ጌታዬ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 4
በመስቀልህ ቀረ የውድቀት ጉዞዬ
ካህኑ መዳፍ ላይ ሳየው መስቀልህን
ድቅን አለ በአይኔ ሳልኩት ችንካርህን
የእሾህ አክሊል ጦሩ ጅራፍ ግርፋቱ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 5
ስለሕይወቴ ነው እንዳልቀር በከንቱ
ቅዱስ ምልክትህ ሆነልኝ መዳኛ
መስቀልህ አርገኝ የፍቅርህ ምርኮኛ
የተጣለች ነፍሴ በደምህ ተዋጅታ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 6
አሁን አዲስ ነው ነኝ ቸርነትህ በዝታ
አለምም ለእኔ እኔም ለአለም ሞትኩ
አምላኬ በቤትህ ለመኖር ተመረጥኩ
እግሮቼ ከእንግዲህ ላንተ ይሮጣሉ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 7
ቃላቶቼ ፍቅርህን ይመስከራሉ
ኢየሱስ ስምህን በእምነት እጠራለሁ
ቅዱስ መስቀልህን እሳለመዋለሁ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ',
        lyrics_transliteration = 'CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 1
Barkeni bemesqelke kibur
Hasabe tawro bemgnot tegardo
Ayne hilinaye wede temna werdo
Dejen eyankakah saleh keberafe

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 2
Lebedel sijegn lets’dqh senfe
Ahun gin meleskegn girdoshu gefefe
Yemesqelh birhan moten ashenefe
Tesfa yeteleyew yeraqew desta

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 3
Newr yadeqeqew lealem yetereta
Hogne endalneber yeamets’ t’or eqa
Salt’efa tadegኸgn qene sayabeqa
Agat’ami aydelem feqdeh new Getaye

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 4
Bemesqelh qere yewdqet guzoye
Kahnu medaf lay sayew mesqelhn
Diqn ale beayne salkut chnkarhn
Yeeshoh aklil t’oru jiraf girfatu

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 5
Silehywete new endalqer bekentu
Kidus milkth honelgn medagna
Mesqelh argegn yefqrh mirkogna
Yetet’alech nefse bedemh tewajta

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 6
Ahun adis new negn cherneth bezta
Alemm leene enem lealem motku
Amlake bebeth lemenor temeret’ku
Egroche keengdih lante yirot’alu

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 7
Qalatoche fiqrhn yimeskeralu
Iyesus simhn beemnet et’eralehu
Kidus mesqelhn esalemewalehu

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede',
        updated_at = clock_timestamp()::text
    WHERE import_id = '30d64d46-58cf-4cf6-8ae0-fc9dc1b79e64'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 1
ባርከኒ በመስቀልከ ክቡር
ሃሳቤ ታውሮ በምኞት ተጋርዶ
አይነ ህሊናዬ ወደ ተምና ወርዶ
ደጄን እያንካካህ ሣለህ ከበራፌ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 2
ለበደል ስጀግን ለጽድቅህ ሰንፌ
አሁን ግን መለስከኝ ግርዶሹ ገፈፈ
የመስቀልህ ብርሃን ሞቴን አሸነፈ
ተስፋ የተለየው የራቀው ደስታ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 3
ነውር ያደቀቀው ለአለም የተረታ
ሆኜ እንዳልነበር የአመጽ ጦር እቃ
ሳልጠፋ ታደግኸኝ ቀኔ ሳያበቃ
አጋጣሚ አይደለም ፈቅደህ ነው ጌታዬ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 4
በመስቀልህ ቀረ የውድቀት ጉዞዬ
ካህኑ መዳፍ ላይ ሳየው መስቀልህን
ድቅን አለ በአይኔ ሳልኩት ችንካርህን
የእሾህ አክሊል ጦሩ ጅራፍ ግርፋቱ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 5
ስለሕይወቴ ነው እንዳልቀር በከንቱ
ቅዱስ ምልክትህ ሆነልኝ መዳኛ
መስቀልህ አርገኝ የፍቅርህ ምርኮኛ
የተጣለች ነፍሴ በደምህ ተዋጅታ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 6
አሁን አዲስ ነው ነኝ ቸርነትህ በዝታ
አለምም ለእኔ እኔም ለአለም ሞትኩ
አምላኬ በቤትህ ለመኖር ተመረጥኩ
እግሮቼ ከእንግዲህ ላንተ ይሮጣሉ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 7
ቃላቶቼ ፍቅርህን ይመስከራሉ
ኢየሱስ ስምህን በእምነት እጠራለሁ
ቅዱስ መስቀልህን እሳለመዋለሁ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '30d64d46-58cf-4cf6-8ae0-fc9dc1b79e64'::uuid, 'meskelun-sisalem-orthodox-tewahido-song-zemari-hawaz-tegegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amanuel-temesgen ("Amanuel Temesgen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '80739da9-6c63-4ab2-828c-3e29ab1082df'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 1
ለዚህ ፍቅርህ ምን ልክፈል /2/

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 2
ድብቁን ሃጢያት አንተ ብትገልጠው
ይቅር ብለኸኝ ባትሸፋፍነው
እንደሰው በቀል ቢኖርህ ጌታ
ለእኔ ሃጢያትስ የለውም ቦታ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 3
በየደቂቃው ሃጢያት ስሰራ
ስሰርቅ ስበድል አንተን ሳልፈራ
አንተ ግን ፊትህ ምንም ቢቀየም
በቁጣህ በትር አልገረፍከኝም

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 4
ምህረትህን ልከህ አድነኝ ዛሬ
ታክቶኛልና በሃጢያት መኖሬ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 5
ዓለም በሃጢያት እየሳበችኝ
በፍቅርህ በደስታ መኖር አቃተኝ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 6
የሃጢያት ጉዞ ጣፋጭ ቢመስልም
ውጤቱ መሮ ፍጹም አይጥምም

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 7
እንደ በደሌ ስላልከፈልከኝ
ተመስገን እንጂ ሌላ ምን አለኝ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 1
Lezih fiqirh min likfel (x2)

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 2
Dibiqun hat’iyat ante bitigelt’ew
Yikir bilehign batishafafnew
Endesew beqel binorh geta
Lene hat’iyat yelewim bota

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 3
Beyedekikaw hat’iyat sisera
Siserik sibedil anten salfera
Ante gin fitih minim bike’yem
Bequt’ah betir algerefkegn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 4
Mihretihin likih adnegn zare
Taktonyalna behat’iyat menoré

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 5
Alem behat’iyat eyisabechign
Befiqirh bedesta menor aqategn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 6
Ye hat’iyat guzo tafach bimeslim
Witetu mero fits’um ayit’imim

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 7
Ende bedelé silalkefel’kegn
Temesgen enji lela min alegn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 1
ለዚህ ፍቅርህ ምን ልክፈል /2/

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 2
ድብቁን ሃጢያት አንተ ብትገልጠው
ይቅር ብለኸኝ ባትሸፋፍነው
እንደሰው በቀል ቢኖርህ ጌታ
ለእኔ ሃጢያትስ የለውም ቦታ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 3
በየደቂቃው ሃጢያት ስሰራ
ስሰርቅ ስበድል አንተን ሳልፈራ
አንተ ግን ፊትህ ምንም ቢቀየም
በቁጣህ በትር አልገረፍከኝም

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 4
ምህረትህን ልከህ አድነኝ ዛሬ
ታክቶኛልና በሃጢያት መኖሬ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 5
ዓለም በሃጢያት እየሳበችኝ
በፍቅርህ በደስታ መኖር አቃተኝ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 6
የሃጢያት ጉዞ ጣፋጭ ቢመስልም
ውጤቱ መሮ ፍጹም አይጥምም

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 7
እንደ በደሌ ስላልከፈልከኝ
ተመስገን እንጂ ሌላ ምን አለኝ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/',
        lyrics_transliteration = 'CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 1
Lezih fiqirh min likfel (x2)

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 2
Dibiqun hat’iyat ante bitigelt’ew
Yikir bilehign batishafafnew
Endesew beqel binorh geta
Lene hat’iyat yelewim bota

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 3
Beyedekikaw hat’iyat sisera
Siserik sibedil anten salfera
Ante gin fitih minim bike’yem
Bequt’ah betir algerefkegn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 4
Mihretihin likih adnegn zare
Taktonyalna behat’iyat menoré

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 5
Alem behat’iyat eyisabechign
Befiqirh bedesta menor aqategn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 6
Ye hat’iyat guzo tafach bimeslim
Witetu mero fits’um ayit’imim

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 7
Ende bedelé silalkefel’kegn
Temesgen enji lela min alegn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '80739da9-6c63-4ab2-828c-3e29ab1082df'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 1
ለዚህ ፍቅርህ ምን ልክፈል /2/

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 2
ድብቁን ሃጢያት አንተ ብትገልጠው
ይቅር ብለኸኝ ባትሸፋፍነው
እንደሰው በቀል ቢኖርህ ጌታ
ለእኔ ሃጢያትስ የለውም ቦታ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 3
በየደቂቃው ሃጢያት ስሰራ
ስሰርቅ ስበድል አንተን ሳልፈራ
አንተ ግን ፊትህ ምንም ቢቀየም
በቁጣህ በትር አልገረፍከኝም

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 4
ምህረትህን ልከህ አድነኝ ዛሬ
ታክቶኛልና በሃጢያት መኖሬ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 5
ዓለም በሃጢያት እየሳበችኝ
በፍቅርህ በደስታ መኖር አቃተኝ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 6
የሃጢያት ጉዞ ጣፋጭ ቢመስልም
ውጤቱ መሮ ፍጹም አይጥምም

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 7
እንደ በደሌ ስላልከፈልከኝ
ተመስገን እንጂ ሌላ ምን አለኝ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 1
Lezih fiqirh min likfel (x2)

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 2
Dibiqun hat’iyat ante bitigelt’ew
Yikir bilehign batishafafnew
Endesew beqel binorh geta
Lene hat’iyat yelewim bota

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 3
Beyedekikaw hat’iyat sisera
Siserik sibedil anten salfera
Ante gin fitih minim bike’yem
Bequt’ah betir algerefkegn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 4
Mihretihin likih adnegn zare
Taktonyalna behat’iyat menoré

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 5
Alem behat’iyat eyisabechign
Befiqirh bedesta menor aqategn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 6
Ye hat’iyat guzo tafach bimeslim
Witetu mero fits’um ayit’imim

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 7
Ende bedelé silalkefel’kegn
Temesgen enji lela min alegn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '80739da9-6c63-4ab2-828c-3e29ab1082df'::uuid, 'amanuel-temesgen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ametun-asalfeh ("Ametun Asalfeh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '979f6b1f-693d-4748-9275-b787d14f5066'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)

VERSE 1
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)

CHORUS
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)

VERSE 1
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)

CHORUS
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)

VERSE 1
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)

CHORUS
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)',
        lyrics_transliteration = 'CHORUS
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)

VERSE 1
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)

CHORUS
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '979f6b1f-693d-4748-9275-b787d14f5066'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)

VERSE 1
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)

CHORUS
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)

VERSE 1
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)

CHORUS
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '979f6b1f-693d-4748-9275-b787d14f5066'::uuid, 'ametun-asalfeh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aman-beaman-tesebha ("Aman be'aman Tesebha")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'df6fa259-53e8-4910-9a0b-870647530722'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)

VERSE 1
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)

CHORUS
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)

VERSE 1
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)

CHORUS
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)

VERSE 1
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)

CHORUS
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)',
        lyrics_transliteration = 'CHORUS
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)

VERSE 1
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)

CHORUS
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'df6fa259-53e8-4910-9a0b-870647530722'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)

VERSE 1
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)

CHORUS
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)

VERSE 1
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)

CHORUS
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'df6fa259-53e8-4910-9a0b-870647530722'::uuid, 'aman-beaman-tesebha', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemarit-saron-yohannes-eritrean-orthodox-tewahdo-mezmur ("# Zemarit Saron Yohannes Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0292a3c8-cecf-4b36-87a4-ed5e3e6962ac'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 1
ስጋሰብ ዝቅለብ ህምየት ዘኩርዓኒ
ሓጥየተይ ከለኒ ሓጥያት ሰብ ዝዳኒ
ኢደይ ዘወጣውጥ ረሲዐ ገበነይ
ኣብ መጋባያ ፍርድስ እንታይ ኮን ዩ ፍርደይ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 2
ልቅሉቅ መቃብር በድኒ ጸይረ ውሽተይ
እነኩ ይልምን ክትቅይር ህየወትይ
ኦ ኣቦይ በጃካ ኣይትርእ በደለይ
ዝሰግዶ ብፍቅዲ ፍቅርካ ኣልቦ ቁጽሪ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 3
ዘፍቃርካኒ ሓቂ ሓጥያተይ ግን ጽርዲ
ምስተሃህደ ግብረይ ክህባእ መቁጽልቲ
ባዕለይ ምስ ሓጣዕኩ ምክኒተይ ደርዳሪ
ምህረት ምስ ሓብካኒ ኣይ ሰሙን ሳልስቲ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 4
መሊሰ ዝሓጥዕ ዘይብለይ መዳርግቲ
ደይበ ኣትራኖስ ዝብል ተነስሁ
ንስሓስ ንዓዩ ዛነብሰይ ዘርሳህኩ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 1
Sigaseb ziqleb himyet zekurani
Hat’yetey keleni hat’yat seb zidani
Idey zewet’awt’ resia gebeney
Ab megabaya firds entay kon yu firdey

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 2
Liqluq meqabr bedni ts’eyre wishtey
Eneku yilmn kitqyr hiyewety
O aboy bejaka aytre bedeley
Zisegdo bifqdi fiqrka albo quts’ri

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 3
Zefqarkani haqi hat’yatey gin ts’rdi
Mistehahde gibrey kihbae mequts’lti
Baeley mis hat’aeku miknitey derdari
Mihret mis habkani ay semun salsti

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 4
Melise zihat’e zeybley medargti
Deybe atranos zibl teneshu
Nishas niayu zanebsey zersahku

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 1
ስጋሰብ ዝቅለብ ህምየት ዘኩርዓኒ
ሓጥየተይ ከለኒ ሓጥያት ሰብ ዝዳኒ
ኢደይ ዘወጣውጥ ረሲዐ ገበነይ
ኣብ መጋባያ ፍርድስ እንታይ ኮን ዩ ፍርደይ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 2
ልቅሉቅ መቃብር በድኒ ጸይረ ውሽተይ
እነኩ ይልምን ክትቅይር ህየወትይ
ኦ ኣቦይ በጃካ ኣይትርእ በደለይ
ዝሰግዶ ብፍቅዲ ፍቅርካ ኣልቦ ቁጽሪ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 3
ዘፍቃርካኒ ሓቂ ሓጥያተይ ግን ጽርዲ
ምስተሃህደ ግብረይ ክህባእ መቁጽልቲ
ባዕለይ ምስ ሓጣዕኩ ምክኒተይ ደርዳሪ
ምህረት ምስ ሓብካኒ ኣይ ሰሙን ሳልስቲ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 4
መሊሰ ዝሓጥዕ ዘይብለይ መዳርግቲ
ደይበ ኣትራኖስ ዝብል ተነስሁ
ንስሓስ ንዓዩ ዛነብሰይ ዘርሳህኩ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ',
        lyrics_transliteration = 'CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 1
Sigaseb ziqleb himyet zekurani
Hat’yetey keleni hat’yat seb zidani
Idey zewet’awt’ resia gebeney
Ab megabaya firds entay kon yu firdey

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 2
Liqluq meqabr bedni ts’eyre wishtey
Eneku yilmn kitqyr hiyewety
O aboy bejaka aytre bedeley
Zisegdo bifqdi fiqrka albo quts’ri

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 3
Zefqarkani haqi hat’yatey gin ts’rdi
Mistehahde gibrey kihbae mequts’lti
Baeley mis hat’aeku miknitey derdari
Mihret mis habkani ay semun salsti

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 4
Melise zihat’e zeybley medargti
Deybe atranos zibl teneshu
Nishas niayu zanebsey zersahku

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0292a3c8-cecf-4b36-87a4-ed5e3e6962ac'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 1
ስጋሰብ ዝቅለብ ህምየት ዘኩርዓኒ
ሓጥየተይ ከለኒ ሓጥያት ሰብ ዝዳኒ
ኢደይ ዘወጣውጥ ረሲዐ ገበነይ
ኣብ መጋባያ ፍርድስ እንታይ ኮን ዩ ፍርደይ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 2
ልቅሉቅ መቃብር በድኒ ጸይረ ውሽተይ
እነኩ ይልምን ክትቅይር ህየወትይ
ኦ ኣቦይ በጃካ ኣይትርእ በደለይ
ዝሰግዶ ብፍቅዲ ፍቅርካ ኣልቦ ቁጽሪ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 3
ዘፍቃርካኒ ሓቂ ሓጥያተይ ግን ጽርዲ
ምስተሃህደ ግብረይ ክህባእ መቁጽልቲ
ባዕለይ ምስ ሓጣዕኩ ምክኒተይ ደርዳሪ
ምህረት ምስ ሓብካኒ ኣይ ሰሙን ሳልስቲ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 4
መሊሰ ዝሓጥዕ ዘይብለይ መዳርግቲ
ደይበ ኣትራኖስ ዝብል ተነስሁ
ንስሓስ ንዓዩ ዛነብሰይ ዘርሳህኩ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0292a3c8-cecf-4b36-87a4-ed5e3e6962ac'::uuid, 'zemarit-saron-yohannes-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anchin-bicha-betelehem ("Anchin Bicha Betelehem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3bd06b70-a646-483d-a79a-a2d6ddd9d091'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ 2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 3
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 4
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 1
Yosefnm alayenm litost’ra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu 2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshw yenebersh anchi bicha enatu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 4
Yegbts’n berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyeferu
Anchin bicha titew bemender neberu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi bicha tayesh2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel memotu
Abreshw yenebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ 2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 3
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 4
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ',
        lyrics_transliteration = 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 1
Yosefnm alayenm litost’ra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu 2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshw yenebersh anchi bicha enatu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 4
Yegbts’n berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyeferu
Anchin bicha titew bemender neberu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi bicha tayesh2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel memotu
Abreshw yenebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3bd06b70-a646-483d-a79a-a2d6ddd9d091'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ
አዝ...
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ *2
አዝ....
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው  እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ*2
አዝ...
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ*2
አዝ..
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ*2
አዝ...
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ*2
አዝ...
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ
አዝ...

VERSE 1
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ
አዝ...
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ *2
አዝ....
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው  እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ*2
አዝ...
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ*2
አዝ..
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ*2
አዝ...
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ*2
አዝ...
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ
አዝ...

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ
አዝ...
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ *2
አዝ....
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው  እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ*2
አዝ...
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ*2
አዝ..
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ*2
አዝ...
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ*2
አዝ...
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ
አዝ...'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
enchin bcha betelhem
enchin bcha beziya grgm
yohensn begelila beefrata elayenm
enchin bcha qeranyo enchin bcha bekorebta
yosefnm elayenm litostra golgota
ez...
gena bemaleda benazre meqdes
gebrel bsrat yzo kegelila siders
yan zena stsemi dengtesh bebrtu
enchi bcha nebersh blatenaytu *2
ez....
htsanun stwelji grgm yeneberu
yelum bemekeraw qeranyon feru
beldet new nji yetalu bemotu
ebreshw yenebersh enchi bcha natu*2
ez...
yegbtsn berehe ebrewsh yewetu
beqeyafa gbi ndemn elmetu
rsu lemigeref nesu yeferu
enchin bcha ttew bemender neberu*2
ez..
hemus let fasikan sibelu yameshu
erb let tenestew keto wedet sheshu
qal gebtew neber laykdut mehela
dngl kanchi beqer man neber lela*2
ez...
beselasa zemen besga weratu
mech neberu keto deqemezamurtu
yejochun tamrat qen kelelit yayesh
beqalu brtat fit enchi bcha tayesh*2
ez...
betelhem yalu qeranyo yelum
qeranyom yalu grgm elneberum
behonebet zemen bemesqel memotu
ebreshw yenebersh enchi bcha natu
ez...

VERSE 1
enchin bcha betelhem
enchin bcha beziya grgm
yohensn begelila beefrata elayenm
enchin bcha qeranyo enchin bcha bekorebta
yosefnm elayenm litostra golgota
ez...
gena bemaleda benazre meqdes
gebrel bsrat yzo kegelila siders
yan zena stsemi dengtesh bebrtu
enchi bcha nebersh blatenaytu *2
ez....
htsanun stwelji grgm yeneberu
yelum bemekeraw qeranyon feru
beldet new nji yetalu bemotu
ebreshw yenebersh enchi bcha natu*2
ez...
yegbtsn berehe ebrewsh yewetu
beqeyafa gbi ndemn elmetu
rsu lemigeref nesu yeferu
enchin bcha ttew bemender neberu*2
ez..
hemus let fasikan sibelu yameshu
erb let tenestew keto wedet sheshu
qal gebtew neber laykdut mehela
dngl kanchi beqer man neber lela*2
ez...
beselasa zemen besga weratu
mech neberu keto deqemezamurtu
yejochun tamrat qen kelelit yayesh
beqalu brtat fit enchi bcha tayesh*2
ez...
betelhem yalu qeranyo yelum
qeranyom yalu grgm elneberum
behonebet zemen bemesqel memotu
ebreshw yenebersh enchi bcha natu
ez...

CHORUS
enchin bcha betelhem
enchin bcha beziya grgm
yohensn begelila beefrata elayenm
enchin bcha qeranyo enchin bcha bekorebta
yosefnm elayenm litostra golgota
ez...
gena bemaleda benazre meqdes
gebrel bsrat yzo kegelila siders
yan zena stsemi dengtesh bebrtu
enchi bcha nebersh blatenaytu *2
ez....
htsanun stwelji grgm yeneberu
yelum bemekeraw qeranyon feru
beldet new nji yetalu bemotu
ebreshw yenebersh enchi bcha natu*2
ez...
yegbtsn berehe ebrewsh yewetu
beqeyafa gbi ndemn elmetu
rsu lemigeref nesu yeferu
enchin bcha ttew bemender neberu*2
ez..
hemus let fasikan sibelu yameshu
erb let tenestew keto wedet sheshu
qal gebtew neber laykdut mehela
dngl kanchi beqer man neber lela*2
ez...
beselasa zemen besga weratu
mech neberu keto deqemezamurtu
yejochun tamrat qen kelelit yayesh
beqalu brtat fit enchi bcha tayesh*2
ez...
betelhem yalu qeranyo yelum
qeranyom yalu grgm elneberum
behonebet zemen bemesqel memotu
ebreshw yenebersh enchi bcha natu
ez...';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3bd06b70-a646-483d-a79a-a2d6ddd9d091'::uuid, 'anchin-bicha-betelehem', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- andebetem-yawta ("Andebetem Yawta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9def8ee9-3fc0-4b72-bdf0-e4272ee50e41'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢያት ፍላፃ ከሞት አተረፈከኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሚልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣዖት እንድሰግድ ነገሥታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃኔዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 1
Wetemed tesebere eném ameleṭkuñ
Ke’hatiyat felatsa ke’mot atereferkeghe
Ye’anabestuñ af be’haylu yezega
Ye’Dan’el amlak yinoral ke’ënna ga

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 2
Be’Dawit mesigana be’Yared zemare
Ke’qidusān gar lezemir abre
Ersun samesegen Milkol bitseqebegn
Le’getayey kibir ezemralehughe

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 3
Asferiw nebelbal esatu binedem
Le’ta’ot endseged negestat
Hulum biteweghem bitelaghim alem
Tsenat yihoneñal geta medihane’alem

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme'
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
ከኃጢያት ፍላፃ ከሞት አተረፈከኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሚልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣዖት እንድሰግድ ነገሥታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃኔዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ',
        lyrics_transliteration = 'CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 1
Wetemed tesebere eném ameleṭkuñ
Ke’hatiyat felatsa ke’mot atereferkeghe
Ye’anabestuñ af be’haylu yezega
Ye’Dan’el amlak yinoral ke’ënna ga

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 2
Be’Dawit mesigana be’Yared zemare
Ke’qidusān gar lezemir abre
Ersun samesegen Milkol bitseqebegn
Le’getayey kibir ezemralehughe

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 3
Asferiw nebelbal esatu binedem
Le’ta’ot endseged negestat
Hulum biteweghem bitelaghim alem
Tsenat yihoneñal geta medihane’alem

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9def8ee9-3fc0-4b72-bdf0-e4272ee50e41'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢያት ፍላፃ ከሞት አተረፈከኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሚልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣዖት እንድሰግድ ነገሥታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃኔዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 1
Wetemed tesebere eném ameleṭkuñ
Ke’hatiyat felatsa ke’mot atereferkeghe
Ye’anabestuñ af be’haylu yezega
Ye’Dan’el amlak yinoral ke’ënna ga

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 2
Be’Dawit mesigana be’Yared zemare
Ke’qidusān gar lezemir abre
Ersun samesegen Milkol bitseqebegn
Le’getayey kibir ezemralehughe

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 3
Asferiw nebelbal esatu binedem
Le’ta’ot endseged negestat
Hulum biteweghem bitelaghim alem
Tsenat yihoneñal geta medihane’alem

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9def8ee9-3fc0-4b72-bdf0-e4272ee50e41'::uuid, 'andebetem-yawta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anchin-yeyaze-sew ("Anchin Yeyaze Sew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a2ba9043-2213-4ee9-8768-43e43d6e8e35'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ፀጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ፅድቅን አሸተትን የሕይወት መዓዛ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቆፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ፀጋና ሃብት አለሽ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 1
Bereketish bizu ye-denagil genzeb
Ye-miskinan enat ye-rehuban qeleb
Le-hulu megabi tsegash yemayigodil
Simish tium migib ke-rehab yemiyas-ttil (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 2
Anchi bittimechi ke-miskinwa bete
Ende Metmiku enat bezallign hassete
Ye-Addis Kidan kurban menber tereppeza
Tsidqin ashetetin ye-hiywot me’aza (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 3
Libie teteratiro kidanishin kalkeda
Limenam alwerdim alyizim akofada
Hulun iyemolash memegeb tawkiyalesh
Bizut yemayalk tsega-na habt alesh (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 4
Ye-Igziabeher marefiya Korebawit washa
Ye-hiywot wuha minch ye-hig mefsesha
Nebelyal tewahedosh Musie anchin ayitwal
Chammawin awulko befitish tedefitwal (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ፀጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ፅድቅን አሸተትን የሕይወት መዓዛ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቆፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ፀጋና ሃብት አለሽ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/',
        lyrics_transliteration = 'CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 1
Bereketish bizu ye-denagil genzeb
Ye-miskinan enat ye-rehuban qeleb
Le-hulu megabi tsegash yemayigodil
Simish tium migib ke-rehab yemiyas-ttil (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 2
Anchi bittimechi ke-miskinwa bete
Ende Metmiku enat bezallign hassete
Ye-Addis Kidan kurban menber tereppeza
Tsidqin ashetetin ye-hiywot me’aza (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 3
Libie teteratiro kidanishin kalkeda
Limenam alwerdim alyizim akofada
Hulun iyemolash memegeb tawkiyalesh
Bizut yemayalk tsega-na habt alesh (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 4
Ye-Igziabeher marefiya Korebawit washa
Ye-hiywot wuha minch ye-hig mefsesha
Nebelyal tewahedosh Musie anchin ayitwal
Chammawin awulko befitish tedefitwal (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a2ba9043-2213-4ee9-8768-43e43d6e8e35'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ፀጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ፅድቅን አሸተትን የሕይወት መዓዛ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቆፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ፀጋና ሃብት አለሽ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 1
Bereketish bizu ye-denagil genzeb
Ye-miskinan enat ye-rehuban qeleb
Le-hulu megabi tsegash yemayigodil
Simish tium migib ke-rehab yemiyas-ttil (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 2
Anchi bittimechi ke-miskinwa bete
Ende Metmiku enat bezallign hassete
Ye-Addis Kidan kurban menber tereppeza
Tsidqin ashetetin ye-hiywot me’aza (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 3
Libie teteratiro kidanishin kalkeda
Limenam alwerdim alyizim akofada
Hulun iyemolash memegeb tawkiyalesh
Bizut yemayalk tsega-na habt alesh (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 4
Ye-Igziabeher marefiya Korebawit washa
Ye-hiywot wuha minch ye-hig mefsesha
Nebelyal tewahedosh Musie anchin ayitwal
Chammawin awulko befitish tedefitwal (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a2ba9043-2213-4ee9-8768-43e43d6e8e35'::uuid, 'anchin-yeyaze-sew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anferatsu-sebea-segel ("Anferatsu Seba Segel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ee1cccc2-73ca-4134-b253-5c2a880b9009'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንፈራፁ ሰብአ ሰገል
አንፈራፁ ሰበእ ሰገል /2 ጊዜ/

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /2 ጊዜ/

CHORUS
አንፈራፁ ሰብአ ሰገል
አንፈራፁ ሰበእ ሰገል /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
enferatsu sebe segel
enferatsu sebe segel /2 gize/

VERSE 1
emhahomu emtsu medmme /2 gize/

CHORUS
enferatsu sebe segel
enferatsu sebe segel /2 gize/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንፈራፁ ሰብአ ሰገል
አንፈራፁ ሰበእ ሰገል /2 ጊዜ/

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /2 ጊዜ/

CHORUS
አንፈራፁ ሰብአ ሰገል
አንፈራፁ ሰበእ ሰገል /2 ጊዜ/',
        lyrics_transliteration = 'CHORUS
enferatsu sebe segel
enferatsu sebe segel /2 gize/

VERSE 1
emhahomu emtsu medmme /2 gize/

CHORUS
enferatsu sebe segel
enferatsu sebe segel /2 gize/',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ee1cccc2-73ca-4134-b253-5c2a880b9009'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንፈራፁ ሰብአ ሰገል
አንፈራፁ ሰበእ ሰገል /2 ጊዜ/

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /2 ጊዜ/

CHORUS
አንፈራፁ ሰብአ ሰገል
አንፈራፁ ሰበእ ሰገል /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
enferatsu sebe segel
enferatsu sebe segel /2 gize/

VERSE 1
emhahomu emtsu medmme /2 gize/

CHORUS
enferatsu sebe segel
enferatsu sebe segel /2 gize/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ee1cccc2-73ca-4134-b253-5c2a880b9009'::uuid, 'anferatsu-sebea-segel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anurognal-cherneteh ("Anurognal Cherneteh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '50b0f2ef-add0-4b82-82f5-cca5c4eaa347'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 1
ያቺ ፈዋሽ አዳኝ እጅህ ዛሬም ለኔ ተዘርግታ
በሀጥያት ርቄ እንዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ህይወት ምርጫ ቢሆን ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህኮ ጌታዬ ፍቅርኮ አለምን ያስቀናል

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 2
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የኔ እጣ
ከንቱ ነበር ማንነቴ አሸናፊ ለዚች አለም
ግን አንተ የያዝከው ይኖራል ዘላለም

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 3
መቅደስህን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤ ውስጥ ያስቀመጥኩት እንዲህ ለሰው ማይነገር
ግን የሆነ ሁሉ ሆኖ የለም ዛሬ ያላረፈ
የመከራው እሳት የፈተናው እሳት ባንተ እየታለፈ

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 4
አይጠፋኝም ያ ፈገግታ ልጄ ብለህ ያሳደከኝ
አመጸኛ መጥፎ ሆኜ በትከሻህ ላይ ያኖርከኝ
እዲም አይነት ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙም ኢየሱስ ነው (2) የጽድቃችን ሚስጢር

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 5
መቸኮሌ መጣደፌ አምላኬ ሆይ በከንቱ ነዉ
መፈጸሙ ላይቀር (2) ጌታዬ አንተ ያልከዉ

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 1
Yachi fewash adaghe ijh zarem lene tezergta
Behatiyat reqe endalguaz asregheghal bewelleta
Degmos hiywot mircha bihon kante wede man yikedal
Abate fiqrehko Getaye fiqrehko alemn yaskenal

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 2
Moche neber teqebre Geta wedeñe batemetta
Ante moten batemotleñ wedet neber yeñe eta
Kentu neber manenneté ashenafi lezich alem
Gin ante yeyazkew yinoral zelalem

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 3
Meqdesehen tetegiche aychalehu bezu neger
Belibe wist yaskemetkewt endih lesew mayineger
Gin yehone hulu hono yelem zare yalarefe
Yemekeraw esat yefetenaw esat bante iyetalefe

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 4
Aytefagnim ya fegegta lije bileh yasadegegh
Ametsegha metfo hoghe betekeshah lay yanorkeghe
Endim aynet wedaj ale iyetelut yemiyafeqir
Simu Iyesus new (2) yetsidqachin mistir

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 5
Mechekole metadefe Amlake hoy bekentu new
Mefetsemu layiqer (2) Getaye ante yalkew

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 1
ያቺ ፈዋሽ አዳኝ እጅህ ዛሬም ለኔ ተዘርግታ
በሀጥያት ርቄ እንዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ህይወት ምርጫ ቢሆን ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህኮ ጌታዬ ፍቅርኮ አለምን ያስቀናል

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 2
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የኔ እጣ
ከንቱ ነበር ማንነቴ አሸናፊ ለዚች አለም
ግን አንተ የያዝከው ይኖራል ዘላለም

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 3
መቅደስህን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤ ውስጥ ያስቀመጥኩት እንዲህ ለሰው ማይነገር
ግን የሆነ ሁሉ ሆኖ የለም ዛሬ ያላረፈ
የመከራው እሳት የፈተናው እሳት ባንተ እየታለፈ

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 4
አይጠፋኝም ያ ፈገግታ ልጄ ብለህ ያሳደከኝ
አመጸኛ መጥፎ ሆኜ በትከሻህ ላይ ያኖርከኝ
እዲም አይነት ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙም ኢየሱስ ነው (2) የጽድቃችን ሚስጢር

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 5
መቸኮሌ መጣደፌ አምላኬ ሆይ በከንቱ ነዉ
መፈጸሙ ላይቀር (2) ጌታዬ አንተ ያልከዉ

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)',
        lyrics_transliteration = 'CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 1
Yachi fewash adaghe ijh zarem lene tezergta
Behatiyat reqe endalguaz asregheghal bewelleta
Degmos hiywot mircha bihon kante wede man yikedal
Abate fiqrehko Getaye fiqrehko alemn yaskenal

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 2
Moche neber teqebre Geta wedeñe batemetta
Ante moten batemotleñ wedet neber yeñe eta
Kentu neber manenneté ashenafi lezich alem
Gin ante yeyazkew yinoral zelalem

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 3
Meqdesehen tetegiche aychalehu bezu neger
Belibe wist yaskemetkewt endih lesew mayineger
Gin yehone hulu hono yelem zare yalarefe
Yemekeraw esat yefetenaw esat bante iyetalefe

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 4
Aytefagnim ya fegegta lije bileh yasadegegh
Ametsegha metfo hoghe betekeshah lay yanorkeghe
Endim aynet wedaj ale iyetelut yemiyafeqir
Simu Iyesus new (2) yetsidqachin mistir

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 5
Mechekole metadefe Amlake hoy bekentu new
Mefetsemu layiqer (2) Getaye ante yalkew

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '50b0f2ef-add0-4b82-82f5-cca5c4eaa347'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 1
ያቺ ፈዋሽ አዳኝ እጅህ ዛሬም ለኔ ተዘርግታ
በሀጥያት ርቄ እንዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ህይወት ምርጫ ቢሆን ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህኮ ጌታዬ ፍቅርኮ አለምን ያስቀናል

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 2
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የኔ እጣ
ከንቱ ነበር ማንነቴ አሸናፊ ለዚች አለም
ግን አንተ የያዝከው ይኖራል ዘላለም

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 3
መቅደስህን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤ ውስጥ ያስቀመጥኩት እንዲህ ለሰው ማይነገር
ግን የሆነ ሁሉ ሆኖ የለም ዛሬ ያላረፈ
የመከራው እሳት የፈተናው እሳት ባንተ እየታለፈ

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 4
አይጠፋኝም ያ ፈገግታ ልጄ ብለህ ያሳደከኝ
አመጸኛ መጥፎ ሆኜ በትከሻህ ላይ ያኖርከኝ
እዲም አይነት ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙም ኢየሱስ ነው (2) የጽድቃችን ሚስጢር

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 5
መቸኮሌ መጣደፌ አምላኬ ሆይ በከንቱ ነዉ
መፈጸሙ ላይቀር (2) ጌታዬ አንተ ያልከዉ

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 1
Yachi fewash adaghe ijh zarem lene tezergta
Behatiyat reqe endalguaz asregheghal bewelleta
Degmos hiywot mircha bihon kante wede man yikedal
Abate fiqrehko Getaye fiqrehko alemn yaskenal

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 2
Moche neber teqebre Geta wedeñe batemetta
Ante moten batemotleñ wedet neber yeñe eta
Kentu neber manenneté ashenafi lezich alem
Gin ante yeyazkew yinoral zelalem

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 3
Meqdesehen tetegiche aychalehu bezu neger
Belibe wist yaskemetkewt endih lesew mayineger
Gin yehone hulu hono yelem zare yalarefe
Yemekeraw esat yefetenaw esat bante iyetalefe

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 4
Aytefagnim ya fegegta lije bileh yasadegegh
Ametsegha metfo hoghe betekeshah lay yanorkeghe
Endim aynet wedaj ale iyetelut yemiyafeqir
Simu Iyesus new (2) yetsidqachin mistir

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 5
Mechekole metadefe Amlake hoy bekentu new
Mefetsemu layiqer (2) Getaye ante yalkew

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '50b0f2ef-add0-4b82-82f5-cca5c4eaa347'::uuid, 'anurognal-cherneteh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- awde-amet-le-barko ("Awde Amet le Barko")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '618001df-1cb1-4eae-b1d3-063a788fcc3d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)

VERSE 1
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)

CHORUS
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)

VERSE 1
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)

CHORUS
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)

VERSE 1
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)

CHORUS
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)',
        lyrics_transliteration = 'CHORUS
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)

VERSE 1
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)

CHORUS
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '618001df-1cb1-4eae-b1d3-063a788fcc3d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)

VERSE 1
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)

CHORUS
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)

VERSE 1
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)

CHORUS
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '618001df-1cb1-4eae-b1d3-063a788fcc3d'::uuid, 'awde-amet-le-barko', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- azekri-dingil ("Azekri Dingil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6939522d-5211-4ad9-8fc3-f658f279352e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
ከአንቺ መወለዱን አዘክሪ

VERSE 1
በቤተልሔም አዘክሪ
በጨርቅ መጠቅለሉን አዘክሪ
መኝታው ግርግም አዘክሪ
ለኃጥአን አኮ ለጻድቃን

CHORUS
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
ከአንቺ መወለዱን አዘክሪ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Azekri Dingil azekri
Le lijish asasebi azekri
Le hat’an ako le tsadqan
Ke anchi mewoledun azekri

VERSE 1
Be Betlehem azekri
Be cherq meteqlelun azekri
Menyitaw girgim azekri
Le hat’an ako le tsadqan

CHORUS
Azekri Dingil azekri
Le lijish asasebi azekri
Le hat’an ako le tsadqan
Ke anchi mewoledun azekri'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
ከአንቺ መወለዱን አዘክሪ

VERSE 1
በቤተልሔም አዘክሪ
በጨርቅ መጠቅለሉን አዘክሪ
መኝታው ግርግም አዘክሪ
ለኃጥአን አኮ ለጻድቃን

CHORUS
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
ከአንቺ መወለዱን አዘክሪ',
        lyrics_transliteration = 'CHORUS
Azekri Dingil azekri
Le lijish asasebi azekri
Le hat’an ako le tsadqan
Ke anchi mewoledun azekri

VERSE 1
Be Betlehem azekri
Be cherq meteqlelun azekri
Menyitaw girgim azekri
Le hat’an ako le tsadqan

CHORUS
Azekri Dingil azekri
Le lijish asasebi azekri
Le hat’an ako le tsadqan
Ke anchi mewoledun azekri',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6939522d-5211-4ad9-8fc3-f658f279352e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
ከአንቺ መወለዱን አዘክሪ

VERSE 1
በቤተልሔም አዘክሪ
በጨርቅ መጠቅለሉን አዘክሪ
መኝታው ግርግም አዘክሪ
ለኃጥአን አኮ ለጻድቃን

CHORUS
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
ከአንቺ መወለዱን አዘክሪ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Azekri Dingil azekri
Le lijish asasebi azekri
Le hat’an ako le tsadqan
Ke anchi mewoledun azekri

VERSE 1
Be Betlehem azekri
Be cherq meteqlelun azekri
Menyitaw girgim azekri
Le hat’an ako le tsadqan

CHORUS
Azekri Dingil azekri
Le lijish asasebi azekri
Le hat’an ako le tsadqan
Ke anchi mewoledun azekri';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6939522d-5211-4ad9-8fc3-f658f279352e'::uuid, 'azekri-dingil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- awedesegn-ephrem ("Awedesegn Ephrem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ba5440b7-3d8e-4ec1-acc1-9c6d6e00ba5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 1
ልቡ ያዘነ አዳምን ሊያድን ጌታ ወደደ
ዳግሚት ሰማይ ማደሪያው ልትሆን እሱ ፈቀደ
የሰማይ ምስጢር በማህጸንሽ ተከናወነ
ከዘሩ ቀርተሽ በንጽሕናሽ የሰው ዘር ዳነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 2
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 3
በሔዋን ምክንያት በለስዋን በልተን ገነት ቢዘጋ
በአንቺ እናትነት ዳግም ተዛመድን ከአምላካችንጋ
ትውልድ ሁሉ ስምሽን በክብር አመሰገነ
የሲዖል ቀንበር በላያችን ላይ ስላልተጫነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 4
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 5
የእዳ ደብዳቤ ተቀዳደደ የባርነቱ
አዳም ሔዋንም ከእስራታቸው ወጡ ተፈቱ
የሲዖል ጽልመት በልጅሽ ጠፍቶ ብርሃን ሆነ
እረፍት አገኘን የምሕረት ዓመት ባንቺ ዘመነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 6
ሰዐሊ ለነ (፪)
አዕምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 7
ሙሴ በሲና ሳትቃጠይ ያየሽ ሐመልማል
እግዚአብሔር መርጦሽ በማህጸንሽ ዙፋኑን ተክሏል
የዲያብሎስን ጥበብ እንዲያፈርስ አምላክ ሰው ሆነ
በልጅሽ መሞት መዳናችንም ተከናወነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 8
ሰዐሊ ለነ (፪)

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 1
Libu yazene adamn liyadn Geta wedede
Dagmit semay maderiyaw lithon esu feqede
Yesemay mist’ir bemahts’ensh tekenawene
Kezeru qertesh bents’hnash yesew zer dane

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 2
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln
CHORUS

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 3
Behewan miknyat beleswan belten genet bizega
Beanchi enatnet dagm tezamedn keamlakachnga
Tiwld hulu simshn bekbr amesegene
Yesiol qenber belayachn lay silaltech’ane

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 4
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln
CHORUS

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 5
Yeeda debdabe teqedadede yebarnetu
Adam hewanm keesratachew wet’u tefetu
Yesiol ts’lmet beljsh t’efto birhan hone
Ereft agegnen yemhret amet banchi zemene

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 6
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln
CHORUS

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 7
Muse besina satqat’ey yayesh hemelmal
Egziabher mert’osh bemahts’ensh zufanun teklwal
Yediyablosn t’beb endiyafers amlak sew hone
Beljsh memot medanachnm tekenawene

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 8
Seali lene (2)

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 1
ልቡ ያዘነ አዳምን ሊያድን ጌታ ወደደ
ዳግሚት ሰማይ ማደሪያው ልትሆን እሱ ፈቀደ
የሰማይ ምስጢር በማህጸንሽ ተከናወነ
ከዘሩ ቀርተሽ በንጽሕናሽ የሰው ዘር ዳነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 2
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 3
በሔዋን ምክንያት በለስዋን በልተን ገነት ቢዘጋ
በአንቺ እናትነት ዳግም ተዛመድን ከአምላካችንጋ
ትውልድ ሁሉ ስምሽን በክብር አመሰገነ
የሲዖል ቀንበር በላያችን ላይ ስላልተጫነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 4
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 5
የእዳ ደብዳቤ ተቀዳደደ የባርነቱ
አዳም ሔዋንም ከእስራታቸው ወጡ ተፈቱ
የሲዖል ጽልመት በልጅሽ ጠፍቶ ብርሃን ሆነ
እረፍት አገኘን የምሕረት ዓመት ባንቺ ዘመነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 6
ሰዐሊ ለነ (፪)
አዕምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 7
ሙሴ በሲና ሳትቃጠይ ያየሽ ሐመልማል
እግዚአብሔር መርጦሽ በማህጸንሽ ዙፋኑን ተክሏል
የዲያብሎስን ጥበብ እንዲያፈርስ አምላክ ሰው ሆነ
በልጅሽ መሞት መዳናችንም ተከናወነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 8
ሰዐሊ ለነ (፪)

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና',
        lyrics_transliteration = 'CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 1
Libu yazene adamn liyadn Geta wedede
Dagmit semay maderiyaw lithon esu feqede
Yesemay mist’ir bemahts’ensh tekenawene
Kezeru qertesh bents’hnash yesew zer dane

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 2
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln
CHORUS

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 3
Behewan miknyat beleswan belten genet bizega
Beanchi enatnet dagm tezamedn keamlakachnga
Tiwld hulu simshn bekbr amesegene
Yesiol qenber belayachn lay silaltech’ane

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 4
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln
CHORUS

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 5
Yeeda debdabe teqedadede yebarnetu
Adam hewanm keesratachew wet’u tefetu
Yesiol ts’lmet beljsh t’efto birhan hone
Ereft agegnen yemhret amet banchi zemene

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 6
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln
CHORUS

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 7
Muse besina satqat’ey yayesh hemelmal
Egziabher mert’osh bemahts’ensh zufanun teklwal
Yediyablosn t’beb endiyafers amlak sew hone
Beljsh memot medanachnm tekenawene

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 8
Seali lene (2)

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ba5440b7-3d8e-4ec1-acc1-9c6d6e00ba5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና
ልቡ ያዘነ አዳምን ሊያድን ጌታ ወደደ
ዳግሚት ሰማይ ማደሪያው ልትሆን እሱ ፈቀደ
የሰማይ ምስጢር በማህጸንሽ ተከናወነ
ከዘሩ ቀርተሽ በንጽሕናሽ የሰው ዘር ዳነ
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ= = = = =
በሔዋን ምክንያት በለስዋን በልተን ገነት ቢዘጋ
በአንቺ እናትነት ዳግም ተዛመድን ከአምላካችንጋ
ትውልድ ሁሉ ስምሽን በክብር አመሰገነ
የሲዖል ቀንበር በላያችን ላይ ስላልተጫነ
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ= = = = =
የእዳ ደብዳቤ ተቀዳደደ የባርነቱ
አዳም ሔዋንም ከእስራታቸው ወጡ ተፈቱ
የሲዖል ጽልመት በልጅሽ ጠፍቶ ብርሃን ሆነ
እረፍት አገኘን የምሕረት ዓመት ባንቺ ዘመነ
ሰዐሊ ለነ (፪)
አዕምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ= = = = =
ሙሴ በሲና ሳትቃጠይ ያየሽ ሐመልማል
እግዚአብሔር መርጦሽ በማህጸንሽ ዙፋኑን ተክሏል
የዲያብሎስን ጥበብ እንዲያፈርስ አምላክ ሰው ሆነ
በልጅሽ መሞት መዳናችንም ተከናወነ
ሰዐሊ ለነ (፪)

VERSE 1
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና
ልቡ ያዘነ አዳምን ሊያድን ጌታ ወደደ
ዳግሚት ሰማይ ማደሪያው ልትሆን እሱ ፈቀደ
የሰማይ ምስጢር በማህጸንሽ ተከናወነ
ከዘሩ ቀርተሽ በንጽሕናሽ የሰው ዘር ዳነ
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ= = = = =
በሔዋን ምክንያት በለስዋን በልተን ገነት ቢዘጋ
በአንቺ እናትነት ዳግም ተዛመድን ከአምላካችንጋ
ትውልድ ሁሉ ስምሽን በክብር አመሰገነ
የሲዖል ቀንበር በላያችን ላይ ስላልተጫነ
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ= = = = =
የእዳ ደብዳቤ ተቀዳደደ የባርነቱ
አዳም ሔዋንም ከእስራታቸው ወጡ ተፈቱ
የሲዖል ጽልመት በልጅሽ ጠፍቶ ብርሃን ሆነ
እረፍት አገኘን የምሕረት ዓመት ባንቺ ዘመነ
ሰዐሊ ለነ (፪)
አዕምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ= = = = =
ሙሴ በሲና ሳትቃጠይ ያየሽ ሐመልማል
እግዚአብሔር መርጦሽ በማህጸንሽ ዙፋኑን ተክሏል
የዲያብሎስን ጥበብ እንዲያፈርስ አምላክ ሰው ሆነ
በልጅሽ መሞት መዳናችንም ተከናወነ
ሰዐሊ ለነ (፪)

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና
ልቡ ያዘነ አዳምን ሊያድን ጌታ ወደደ
ዳግሚት ሰማይ ማደሪያው ልትሆን እሱ ፈቀደ
የሰማይ ምስጢር በማህጸንሽ ተከናወነ
ከዘሩ ቀርተሽ በንጽሕናሽ የሰው ዘር ዳነ
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ= = = = =
በሔዋን ምክንያት በለስዋን በልተን ገነት ቢዘጋ
በአንቺ እናትነት ዳግም ተዛመድን ከአምላካችንጋ
ትውልድ ሁሉ ስምሽን በክብር አመሰገነ
የሲዖል ቀንበር በላያችን ላይ ስላልተጫነ
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ= = = = =
የእዳ ደብዳቤ ተቀዳደደ የባርነቱ
አዳም ሔዋንም ከእስራታቸው ወጡ ተፈቱ
የሲዖል ጽልመት በልጅሽ ጠፍቶ ብርሃን ሆነ
እረፍት አገኘን የምሕረት ዓመት ባንቺ ዘመነ
ሰዐሊ ለነ (፪)
አዕምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ= = = = =
ሙሴ በሲና ሳትቃጠይ ያየሽ ሐመልማል
እግዚአብሔር መርጦሽ በማህጸንሽ ዙፋኑን ተክሏል
የዲያብሎስን ጥበብ እንዲያፈርስ አምላክ ሰው ሆነ
በልጅሽ መሞት መዳናችንም ተከናወነ
ሰዐሊ ለነ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ba5440b7-3d8e-4ec1-acc1-9c6d6e00ba5f'::uuid, 'awedesegn-ephrem', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- atetowal-godelobetal-bay-kesis-ashenafi-mzemur ("Atetowal godelobetal bay kesis Ashenafi mzemur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '31f9f223-cbb6-448b-9567-4220f3234c71'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 1
ሀዘን ፅልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ፀና ልቤ በእግዚያብሔር ይህን እያወቀ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ስራህን ስናገር

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አደረከኸኝ አንተ ሰው አትንቅም

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ
ከዚህም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለስምህ መነቀፌ ክብሬ ነው ማዕረጌ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 5
በምን መንገድ ላስደስትህ እንደምን አድርጌ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 1
Hezen ts’lmet kifu zemen biget’megnm enkwa
Yalfal hulum tarik hono befith sileka
Man afere man godele anten yet’ebeqe
Ts’ena libe beegziyabher yihn eyaweqe

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 2
Bealem sifra baynoregnm bihonm gosqwala
Amlake hoy kante beqer alhed wede lela
Getaye hoy beflegah wet’ahu kemeqabr
Simesekr enoralehu sirahn sinager

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 3
Qen lekteh gizen ayteh sewn yematkeda
Yaleweret timet’aleh enen litreda
Keneelyab wendmoche balstekakelm
Mama honeh kef aderekeኸgn ante sew atnqm

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 4
Ende enat lij endalqot’rh
Kezihm tibelt’aleh
Kante beqer yafeqeregn bemdr silelele
Silesmh meneqefe kibre new maerege

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 5
Bemn menged lasdesth endemn adrge

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 1
ሀዘን ፅልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ፀና ልቤ በእግዚያብሔር ይህን እያወቀ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ስራህን ስናገር

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አደረከኸኝ አንተ ሰው አትንቅም

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ
ከዚህም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለስምህ መነቀፌ ክብሬ ነው ማዕረጌ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 5
በምን መንገድ ላስደስትህ እንደምን አድርጌ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)',
        lyrics_transliteration = 'CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 1
Hezen ts’lmet kifu zemen biget’megnm enkwa
Yalfal hulum tarik hono befith sileka
Man afere man godele anten yet’ebeqe
Ts’ena libe beegziyabher yihn eyaweqe

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 2
Bealem sifra baynoregnm bihonm gosqwala
Amlake hoy kante beqer alhed wede lela
Getaye hoy beflegah wet’ahu kemeqabr
Simesekr enoralehu sirahn sinager

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 3
Qen lekteh gizen ayteh sewn yematkeda
Yaleweret timet’aleh enen litreda
Keneelyab wendmoche balstekakelm
Mama honeh kef aderekeኸgn ante sew atnqm

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 4
Ende enat lij endalqot’rh
Kezihm tibelt’aleh
Kante beqer yafeqeregn bemdr silelele
Silesmh meneqefe kibre new maerege

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 5
Bemn menged lasdesth endemn adrge

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '31f9f223-cbb6-448b-9567-4220f3234c71'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 1
ሀዘን ፅልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ፀና ልቤ በእግዚያብሔር ይህን እያወቀ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ስራህን ስናገር

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አደረከኸኝ አንተ ሰው አትንቅም

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ
ከዚህም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለስምህ መነቀፌ ክብሬ ነው ማዕረጌ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 5
በምን መንገድ ላስደስትህ እንደምን አድርጌ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '31f9f223-cbb6-448b-9567-4220f3234c71'::uuid, 'atetowal-godelobetal-bay-kesis-ashenafi-mzemur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- barkeni-aba-yaqob ("Barkeni Aba Yaqob")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3deec62b-b7b2-4ac7-8653-d35b3a28d9b8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ

VERSE 1
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ

CHORUS
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Barkeni Aba mefekere meamenan Yaqob

VERSE 1
Barkeni Aba mefekere meamenan Yaqob

CHORUS
Barkeni Aba mefekere meamenan Yaqob'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ

VERSE 1
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ

CHORUS
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ',
        lyrics_transliteration = 'CHORUS
Barkeni Aba mefekere meamenan Yaqob

VERSE 1
Barkeni Aba mefekere meamenan Yaqob

CHORUS
Barkeni Aba mefekere meamenan Yaqob',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3deec62b-b7b2-4ac7-8653-d35b3a28d9b8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ

VERSE 1
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ

CHORUS
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Barkeni Aba mefekere meamenan Yaqob

VERSE 1
Barkeni Aba mefekere meamenan Yaqob

CHORUS
Barkeni Aba mefekere meamenan Yaqob';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3deec62b-b7b2-4ac7-8653-d35b3a28d9b8'::uuid, 'barkeni-aba-yaqob', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bahiranini-yibe-amarya ("Baḥiranini Yibe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7a1c5cd2-95e9-4e2a-9db2-be978f41704a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማርያ

VERSE 1
ባሕራንኒ ይቤ ዘነገደ ባሕረ (2x)

CHORUS
አማርያ

VERSE 2
ርኢክዎ ለሚካኤል ወስዕንኩ ጠይቆቶ ስዕን (2x)

CHORUS
አማርያ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amarya

VERSE 1
Baḥiranini yibe zenegede baḥire (2x)

CHORUS
Amarya

VERSE 2
Riiko Lemikaeli wesiiniku teyikoto siluniku (2x)

CHORUS
Amarya'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አማርያ

VERSE 1
ባሕራንኒ ይቤ ዘነገደ ባሕረ (2x)

CHORUS
አማርያ

VERSE 2
ርኢክዎ ለሚካኤል ወስዕንኩ ጠይቆቶ ስዕን (2x)

CHORUS
አማርያ',
        lyrics_transliteration = 'CHORUS
Amarya

VERSE 1
Baḥiranini yibe zenegede baḥire (2x)

CHORUS
Amarya

VERSE 2
Riiko Lemikaeli wesiiniku teyikoto siluniku (2x)

CHORUS
Amarya',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7a1c5cd2-95e9-4e2a-9db2-be978f41704a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማርያ

VERSE 1
ባሕራንኒ ይቤ ዘነገደ ባሕረ (2x)

CHORUS
አማርያ

VERSE 2
ርኢክዎ ለሚካኤል ወስዕንኩ ጠይቆቶ ስዕን (2x)

CHORUS
አማርያ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amarya

VERSE 1
Baḥiranini yibe zenegede baḥire (2x)

CHORUS
Amarya

VERSE 2
Riiko Lemikaeli wesiiniku teyikoto siluniku (2x)

CHORUS
Amarya';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7a1c5cd2-95e9-4e2a-9db2-be978f41704a'::uuid, 'bahiranini-yibe-amarya', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zares-teyizhalehugn-like-mezemiran-yilima-hayilu ("Zares Teyizhalehugn Like Mezemiran Yilima Hayilu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '32f97e9e-9a67-47a4-a8e4-79673190e9dc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 1
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለሁ
ፍቅርህን ሳስተውል ሁልጊዜ አለቅሳለሁ /2/

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 2
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከሕሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያጽናና ከሁሉ ይበልጣል

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 3
ሰው ነህ ተብያለሁ አንተ ሰው ስላልከኝ
ማን ያስታውሰኛል አንተ ባታከብረኝ
አትጣለኝ አንተ ሁሉም ያከብሩኛል
ኃጢአቴን ባትቆጥር ለእኔ ይበቃኛል

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 1
Yalset’eኸgn neger bezih midr yelem
Fiqrh wesen yelew dinq new zelalem
Eneneten sayew mindnegn elalehu
Fiqrhn sastewl hulgize aleqsalehu (2)

CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 2
Lebchaye hogne amlaken sasbew
Kehlina belay wiletah bizu new
Yetet’alewn sew mansat yawqbetal
Miskinun siyats’nana kehulu yibelt’al

CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 3
Sew neh tebyalehu ante sew silalkegn
Man yastawsegnal ante batakebregn
Att’alegn ante hulum yakebrugnal
Hat’iaten batqot’r leene yibeqagnal

CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 1
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለሁ
ፍቅርህን ሳስተውል ሁልጊዜ አለቅሳለሁ /2/

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 2
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከሕሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያጽናና ከሁሉ ይበልጣል

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 3
ሰው ነህ ተብያለሁ አንተ ሰው ስላልከኝ
ማን ያስታውሰኛል አንተ ባታከብረኝ
አትጣለኝ አንተ ሁሉም ያከብሩኛል
ኃጢአቴን ባትቆጥር ለእኔ ይበቃኛል

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/',
        lyrics_transliteration = 'CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 1
Yalset’eኸgn neger bezih midr yelem
Fiqrh wesen yelew dinq new zelalem
Eneneten sayew mindnegn elalehu
Fiqrhn sastewl hulgize aleqsalehu (2)

CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 2
Lebchaye hogne amlaken sasbew
Kehlina belay wiletah bizu new
Yetet’alewn sew mansat yawqbetal
Miskinun siyats’nana kehulu yibelt’al

CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 3
Sew neh tebyalehu ante sew silalkegn
Man yastawsegnal ante batakebregn
Att’alegn ante hulum yakebrugnal
Hat’iaten batqot’r leene yibeqagnal

CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '32f97e9e-9a67-47a4-a8e4-79673190e9dc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 1
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለሁ
ፍቅርህን ሳስተውል ሁልጊዜ አለቅሳለሁ /2/

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 2
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከሕሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያጽናና ከሁሉ ይበልጣል

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 3
ሰው ነህ ተብያለሁ አንተ ሰው ስላልከኝ
ማን ያስታውሰኛል አንተ ባታከብረኝ
አትጣለኝ አንተ ሁሉም ያከብሩኛል
ኃጢአቴን ባትቆጥር ለእኔ ይበቃኛል

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '32f97e9e-9a67-47a4-a8e4-79673190e9dc'::uuid, 'zares-teyizhalehugn-like-mezemiran-yilima-hayilu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beki-yitfesihu ("Beki Yitfesihu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '660362c2-91d0-4da2-bb06-f094c304ed20'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን

VERSE 1
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን

CHORUS
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beki yitfesihu zegennet tsige tsadqan

VERSE 1
Beki yitfesihu zegennet tsige tsadqan

CHORUS
Beki yitfesihu zegennet tsige tsadqan'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን

VERSE 1
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን

CHORUS
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን',
        lyrics_transliteration = 'CHORUS
Beki yitfesihu zegennet tsige tsadqan

VERSE 1
Beki yitfesihu zegennet tsige tsadqan

CHORUS
Beki yitfesihu zegennet tsige tsadqan',
        updated_at = clock_timestamp()::text
    WHERE import_id = '660362c2-91d0-4da2-bb06-f094c304ed20'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Beki yitfesihu zegennet tsige tsadqan';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '660362c2-91d0-4da2-bb06-f094c304ed20'::uuid, 'beki-yitfesihu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- begol-sekebe-beatsrqt ("Begol Sekebe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '366520a2-b5b1-490d-9bb3-1bc48b83174b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጎል ሰከበ በአዕፅርቅት ተጠብለለ
ኀደረ ማኅፀነ ድንግል /2 ጊዜ/

VERSE 1
እፎ ተሴሰየ ተሴሰየ
ሀሊበ ከመ ሕፃናት ተሴሰየ /2 ጊዜ/

CHORUS
በጎል ሰከበ በአዕፅርቅት ተጠብለለ
ኀደረ ማኅፀነ ድንግል /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
begol sekebe beetsrqt teteblele
hedere mahtsene dngl /2 gize/

VERSE 1
fo teseseye teseseye
helibe keme htsanat teseseye /2 gize/

CHORUS
begol sekebe beetsrqt teteblele
hedere mahtsene dngl /2 gize/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በጎል ሰከበ በአዕፅርቅት ተጠብለለ
ኀደረ ማኅፀነ ድንግል /2 ጊዜ/

VERSE 1
እፎ ተሴሰየ ተሴሰየ
ሀሊበ ከመ ሕፃናት ተሴሰየ /2 ጊዜ/

CHORUS
በጎል ሰከበ በአዕፅርቅት ተጠብለለ
ኀደረ ማኅፀነ ድንግል /2 ጊዜ/',
        lyrics_transliteration = 'CHORUS
begol sekebe beetsrqt teteblele
hedere mahtsene dngl /2 gize/

VERSE 1
fo teseseye teseseye
helibe keme htsanat teseseye /2 gize/

CHORUS
begol sekebe beetsrqt teteblele
hedere mahtsene dngl /2 gize/',
        updated_at = clock_timestamp()::text
    WHERE import_id = '366520a2-b5b1-490d-9bb3-1bc48b83174b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጎል ሰከበ በአዕፅርቅት ተጠብለለ
ኀደረ ማኅፀነ ድንግል /2 ጊዜ/

VERSE 1
እፎ ተሴሰየ ተሴሰየ
ሀሊበ ከመ ሕፃናት ተሴሰየ /2 ጊዜ/

CHORUS
በጎል ሰከበ በአዕፅርቅት ተጠብለለ
ኀደረ ማኅፀነ ድንግል /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
begol sekebe beetsrqt teteblele
hedere mahtsene dngl /2 gize/

VERSE 1
fo teseseye teseseye
helibe keme htsanat teseseye /2 gize/

CHORUS
begol sekebe beetsrqt teteblele
hedere mahtsene dngl /2 gize/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '366520a2-b5b1-490d-9bb3-1bc48b83174b'::uuid, 'begol-sekebe-beatsrqt', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lemen-telahegn-wendeme ("Lemen Telahegn Wendeme")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'caae34be-59ad-4956-b31c-5e12d6d45b1f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 1
የተካፈልኩትን ንብረት አጥፍቸ ብመለስ ዛሬ
አባቴ ናፍቆኝ ብመጣ ልቤን አንገቴን ሰብሬ
ለሁላችንም ይበቃል ብዙነው የሱ መንግስት
አይክፋህ ባክህ ወንድሜ ፍቅር ይበልጣል ከሀብት

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 2
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወንድሜ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 3
ፊትህ በሃዘን አይጥቆር ድንጋዩን ጣለው ወንድሜ
ተቅበዝባዥ እንዳያደርግ እጅህ ቆሽሾ በደሜ
ልብህን መልካም ብታደርግ ያንተም መስዋእት ያረጋል
ጌታ ለሁሉም እኩል ነው መታዘዝ ንጉስ ያደርጋል

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 4
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 5
ብልጥ ስለሆንኩ አይደለም የተባረኩት በጌታ
ጽኑ መሻቴን አይቶ ነው በኩር ያደረገኝ ስመታ
የበቀል ጦርክን ሸሽቼ በባእድ ሀገር ብኖርም
በልጅ በትዳር ባርኮኛል አብረን እንኑር በሰላም

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 6
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 1
Yetekafelkutn nibret at’fche bimeles zare
Abate nafqogn bimet’a liben angeten sebre
Lehulachnm yibeqal bizunew yesu mengst
Aykfah bakh wendme fiqr yibelt’al kehebt

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 2
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wendme yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 3
Fith behazen ayt’qor dingayun t’alew wendme
Teqbezbazh endayaderg ejh qoshsho bedeme
Libhn melkam bitaderg yantem meswaet yaregal
Geta lehulum ekul new metazez nigus yadergal

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 4
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 5
Bilt’ silehonku aydelem yetebarekut begeta
Ts’nu meshaten ayto new bekur yaderegegn simeta
Yebeqel t’orkn sheshche bebaed heger binorm
Belj betdar barkognal abren ennur beselam

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 6
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 1
የተካፈልኩትን ንብረት አጥፍቸ ብመለስ ዛሬ
አባቴ ናፍቆኝ ብመጣ ልቤን አንገቴን ሰብሬ
ለሁላችንም ይበቃል ብዙነው የሱ መንግስት
አይክፋህ ባክህ ወንድሜ ፍቅር ይበልጣል ከሀብት

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 2
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወንድሜ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 3
ፊትህ በሃዘን አይጥቆር ድንጋዩን ጣለው ወንድሜ
ተቅበዝባዥ እንዳያደርግ እጅህ ቆሽሾ በደሜ
ልብህን መልካም ብታደርግ ያንተም መስዋእት ያረጋል
ጌታ ለሁሉም እኩል ነው መታዘዝ ንጉስ ያደርጋል

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 4
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 5
ብልጥ ስለሆንኩ አይደለም የተባረኩት በጌታ
ጽኑ መሻቴን አይቶ ነው በኩር ያደረገኝ ስመታ
የበቀል ጦርክን ሸሽቼ በባእድ ሀገር ብኖርም
በልጅ በትዳር ባርኮኛል አብረን እንኑር በሰላም

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 6
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን',
        lyrics_transliteration = 'CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 1
Yetekafelkutn nibret at’fche bimeles zare
Abate nafqogn bimet’a liben angeten sebre
Lehulachnm yibeqal bizunew yesu mengst
Aykfah bakh wendme fiqr yibelt’al kehebt

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 2
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wendme yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 3
Fith behazen ayt’qor dingayun t’alew wendme
Teqbezbazh endayaderg ejh qoshsho bedeme
Libhn melkam bitaderg yantem meswaet yaregal
Geta lehulum ekul new metazez nigus yadergal

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 4
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 5
Bilt’ silehonku aydelem yetebarekut begeta
Ts’nu meshaten ayto new bekur yaderegegn simeta
Yebeqel t’orkn sheshche bebaed heger binorm
Belj betdar barkognal abren ennur beselam

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 6
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'caae34be-59ad-4956-b31c-5e12d6d45b1f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 1
የተካፈልኩትን ንብረት አጥፍቸ ብመለስ ዛሬ
አባቴ ናፍቆኝ ብመጣ ልቤን አንገቴን ሰብሬ
ለሁላችንም ይበቃል ብዙነው የሱ መንግስት
አይክፋህ ባክህ ወንድሜ ፍቅር ይበልጣል ከሀብት

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 2
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወንድሜ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 3
ፊትህ በሃዘን አይጥቆር ድንጋዩን ጣለው ወንድሜ
ተቅበዝባዥ እንዳያደርግ እጅህ ቆሽሾ በደሜ
ልብህን መልካም ብታደርግ ያንተም መስዋእት ያረጋል
ጌታ ለሁሉም እኩል ነው መታዘዝ ንጉስ ያደርጋል

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 4
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 5
ብልጥ ስለሆንኩ አይደለም የተባረኩት በጌታ
ጽኑ መሻቴን አይቶ ነው በኩር ያደረገኝ ስመታ
የበቀል ጦርክን ሸሽቼ በባእድ ሀገር ብኖርም
በልጅ በትዳር ባርኮኛል አብረን እንኑር በሰላም

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 6
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'caae34be-59ad-4956-b31c-5e12d6d45b1f'::uuid, 'lemen-telahegn-wendeme', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- believe-in-the-lord ("Believe In The Lord")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e2dedf4d-7394-4427-a1ab-3e05e537de0c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ

VERSE 1
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ

CHORUS
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone

VERSE 1
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone

CHORUS
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ

VERSE 1
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ

CHORUS
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ',
        lyrics_transliteration = 'CHORUS
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone

VERSE 1
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone

CHORUS
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e2dedf4d-7394-4427-a1ab-3e05e537de0c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ

VERSE 1
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ

CHORUS
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone

VERSE 1
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone

CHORUS
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e2dedf4d-7394-4427-a1ab-3e05e537de0c'::uuid, 'believe-in-the-lord', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemen-des-lasenyih ("Bemen Des Lasenyih")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a79ca29e-8c57-4146-91a6-d255b523410d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰግኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትቢያ ነኝ ምን ልስጥህ ምንስ አለኝና (2)

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 2
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 3
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 4
ጌታ ሆይ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 5
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 6
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው (2)

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 7
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 8
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤና የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 9
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 10
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 11
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 12
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 1
Kirubel Surafel Kidus Silus yaluh
Melaekt berama yemiyamesegenuh
Dink mekar hayal Elshaday nehna
Tenbiya negn min lishith mins alegnina (2)

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 2
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 3
Yefeterkew hulu yantew aydelem wey
Kidusun meswaet Leul silemiwed
Min yize limtana beamlake fit lisged
Wede lay besemay wede tach betilket

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 4
Amlake yet ale yematigegnibet
Geta hoy yet ale yematigegnibet
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 5
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bekidan betshelot kidassie saatat

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 6
Ante yesetehgne yemenfes kidus habt
Melesen wede ante binset min ale
Tewew gudachinen sistachinen yihew (2)

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 7
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 8
Habtina nibretes gulbetes mindenew
Tenaye yesetegn kante beker manew
Besetehgne edme behiwot zemene

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 9
Kegelayes bihon yetignawu new yene
Keakilates bihon yetignawu new yene
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 10
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 11
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 12
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey'
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
መላዕክት በራማ የሚያመሰግኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትቢያ ነኝ ምን ልስጥህ ምንስ አለኝና (2)

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 2
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 3
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 4
ጌታ ሆይ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 5
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 6
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው (2)

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 7
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 8
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤና የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 9
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 10
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 11
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 12
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ',
        lyrics_transliteration = 'CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 1
Kirubel Surafel Kidus Silus yaluh
Melaekt berama yemiyamesegenuh
Dink mekar hayal Elshaday nehna
Tenbiya negn min lishith mins alegnina (2)

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 2
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 3
Yefeterkew hulu yantew aydelem wey
Kidusun meswaet Leul silemiwed
Min yize limtana beamlake fit lisged
Wede lay besemay wede tach betilket

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 4
Amlake yet ale yematigegnibet
Geta hoy yet ale yematigegnibet
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 5
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bekidan betshelot kidassie saatat

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 6
Ante yesetehgne yemenfes kidus habt
Melesen wede ante binset min ale
Tewew gudachinen sistachinen yihew (2)

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 7
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 8
Habtina nibretes gulbetes mindenew
Tenaye yesetegn kante beker manew
Besetehgne edme behiwot zemene

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 9
Kegelayes bihon yetignawu new yene
Keakilates bihon yetignawu new yene
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 10
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 11
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 12
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a79ca29e-8c57-4146-91a6-d255b523410d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰግኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትቢያ ነኝ ምን ልስጥህ ምንስ አለኝና (2)

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 2
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 3
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 4
ጌታ ሆይ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 5
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 6
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው (2)

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 7
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 8
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤና የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 9
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 10
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 11
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 12
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 1
Kirubel Surafel Kidus Silus yaluh
Melaekt berama yemiyamesegenuh
Dink mekar hayal Elshaday nehna
Tenbiya negn min lishith mins alegnina (2)

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 2
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 3
Yefeterkew hulu yantew aydelem wey
Kidusun meswaet Leul silemiwed
Min yize limtana beamlake fit lisged
Wede lay besemay wede tach betilket

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 4
Amlake yet ale yematigegnibet
Geta hoy yet ale yematigegnibet
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 5
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bekidan betshelot kidassie saatat

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 6
Ante yesetehgne yemenfes kidus habt
Melesen wede ante binset min ale
Tewew gudachinen sistachinen yihew (2)

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 7
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 8
Habtina nibretes gulbetes mindenew
Tenaye yesetegn kante beker manew
Besetehgne edme behiwot zemene

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 9
Kegelayes bihon yetignawu new yene
Keakilates bihon yetignawu new yene
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 10
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 11
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 12
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a79ca29e-8c57-4146-91a6-d255b523410d'::uuid, 'bemen-des-lasenyih', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eregnaye ("Eregnaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bfaebc21-e195-4fc0-92ad-dfd5021df130'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ክርስቶስ መቼም የማይተወኝ',
        lyrics_transliteration = 'CHORUS
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
Kristos mechem yemaytewegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bfaebc21-e195-4fc0-92ad-dfd5021df130'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bfaebc21-e195-4fc0-92ad-dfd5021df130'::uuid, 'eregnaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- orthidox-tewahdo-song ("orthidox tewahdo song")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd4c72f7f-1365-454c-881f-045fd73c28cc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 1
እህ ብርሃነ ከፈነቤ ነህ
የሞታችን ሰንሰል
በግርማ ተፈታ ዛሬ
ሰላም ሆነ በምድር ደስታ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 2
ከሳሾች ከእንግዲህ
በኛ ላይ አይፈዱም
ጠፍተን አልቀረንም
ሊያጠፉን ቢወዱ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 3
ብርሃነ ከፈቤ
እህ ብርሃነ ከፈኑ ዲነው
ብርሃነ ከፈኑ ዲነ ነው
መስቀል ተሸክመህ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 4
እኛን ነጻ ወጣ
ቃልህ ፈመራ
ልዩ የእኛን ሞት ስትከላ ለኛ
እኛ ህይወት ሆነ ከሞት በኋላ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 5
ብርሃነ ከፈቤ
ከፈቤ ዲቤ
ከፈኖ ዲቤ ነህ
የእስራኤል ማህበር ያረዱ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 6
ህዝቡ በግንባ ተፋ
እኛን ለመታደግ በኢማሆ መንገድ
እግር ቀድሞ መጣ
የማይጨል በምድራችን ወጣ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 7
ብርሃነ ከፈቤ
ከፈቤ
ከፈነቤ ነህ
በመስቀል ጠረቀ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 8
ሞትን የገደልከው
መቃብርን መግለፁን
ፍጡር አላርከው
ዛሬ በብርሃን ህይወታችን ይብራ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 9
መኖር አጭር ሆነ ከኛ ጋራ
ብርሃነ ከፈኑ ዲቤ
ከፈኑ ዲቤ
እህ ብርሃነ ከፈቤ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 10
ከፈቤ
ትንሳኤ ለለመነ
ትንሳኤል አነፈኑ ዲቤ
ከፈቤ ባነራ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 11
ከፈኖ ዲቤ
ከፈኖ ዲቤ ነህ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 1
Eh birhane kefenebe neh
Yemotachn sensel
Begrma tefeta zare
Selam hone bemdr desta

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 2
Kesashoch keengdih
Begna lay ayfedum
T’eften alqerenm
Liyat’efun biwedu

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 3
Birhane kefebe
Eh birhane kefenu dinew
Birhane kefenu dine new
Mesqel teshekmeh

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 4
Egnan nets’a wet’a
Qalh femera
Liyu yeegnan mot sitkela legna
Egna hiywet hone kemot behwala

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 5
Birhane kefebe
Kefebe dibe
Kefeno dibe neh
Yeesrael mahber yaredu

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 6
Hizbu begnba tefa
Egnan lemetadeg beimaho menged
Egr qedmo met’a
Yemaych’el bemdrachn wet’a

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 7
Birhane kefebe
Kefebe
Kefenebe neh
Bemesqel t’ereqe

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 8
Motn yegedelkew
Meqabrn meglets’un
Fit’ur alarkew
Zare bebrhan hiywetachn yibra

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 9
Menor ach’r hone kegna gara
Birhane kefenu dibe
Kefenu dibe
Eh birhane kefebe

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 10
Kefebe
Tinsae lelemene
Tinsael anefenu dibe
Kefebe banera

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 11
Kefeno dibe
Kefeno dibe neh

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 1
እህ ብርሃነ ከፈነቤ ነህ
የሞታችን ሰንሰል
በግርማ ተፈታ ዛሬ
ሰላም ሆነ በምድር ደስታ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 2
ከሳሾች ከእንግዲህ
በኛ ላይ አይፈዱም
ጠፍተን አልቀረንም
ሊያጠፉን ቢወዱ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 3
ብርሃነ ከፈቤ
እህ ብርሃነ ከፈኑ ዲነው
ብርሃነ ከፈኑ ዲነ ነው
መስቀል ተሸክመህ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 4
እኛን ነጻ ወጣ
ቃልህ ፈመራ
ልዩ የእኛን ሞት ስትከላ ለኛ
እኛ ህይወት ሆነ ከሞት በኋላ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 5
ብርሃነ ከፈቤ
ከፈቤ ዲቤ
ከፈኖ ዲቤ ነህ
የእስራኤል ማህበር ያረዱ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 6
ህዝቡ በግንባ ተፋ
እኛን ለመታደግ በኢማሆ መንገድ
እግር ቀድሞ መጣ
የማይጨል በምድራችን ወጣ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 7
ብርሃነ ከፈቤ
ከፈቤ
ከፈነቤ ነህ
በመስቀል ጠረቀ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 8
ሞትን የገደልከው
መቃብርን መግለፁን
ፍጡር አላርከው
ዛሬ በብርሃን ህይወታችን ይብራ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 9
መኖር አጭር ሆነ ከኛ ጋራ
ብርሃነ ከፈኑ ዲቤ
ከፈኑ ዲቤ
እህ ብርሃነ ከፈቤ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 10
ከፈቤ
ትንሳኤ ለለመነ
ትንሳኤል አነፈኑ ዲቤ
ከፈቤ ባነራ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 11
ከፈኖ ዲቤ
ከፈኖ ዲቤ ነህ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ',
        lyrics_transliteration = 'CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 1
Eh birhane kefenebe neh
Yemotachn sensel
Begrma tefeta zare
Selam hone bemdr desta

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 2
Kesashoch keengdih
Begna lay ayfedum
T’eften alqerenm
Liyat’efun biwedu

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 3
Birhane kefebe
Eh birhane kefenu dinew
Birhane kefenu dine new
Mesqel teshekmeh

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 4
Egnan nets’a wet’a
Qalh femera
Liyu yeegnan mot sitkela legna
Egna hiywet hone kemot behwala

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 5
Birhane kefebe
Kefebe dibe
Kefeno dibe neh
Yeesrael mahber yaredu

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 6
Hizbu begnba tefa
Egnan lemetadeg beimaho menged
Egr qedmo met’a
Yemaych’el bemdrachn wet’a

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 7
Birhane kefebe
Kefebe
Kefenebe neh
Bemesqel t’ereqe

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 8
Motn yegedelkew
Meqabrn meglets’un
Fit’ur alarkew
Zare bebrhan hiywetachn yibra

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 9
Menor ach’r hone kegna gara
Birhane kefenu dibe
Kefenu dibe
Eh birhane kefebe

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 10
Kefebe
Tinsae lelemene
Tinsael anefenu dibe
Kefebe banera

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 11
Kefeno dibe
Kefeno dibe neh

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd4c72f7f-1365-454c-881f-045fd73c28cc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 1
እህ ብርሃነ ከፈነቤ ነህ
የሞታችን ሰንሰል
በግርማ ተፈታ ዛሬ
ሰላም ሆነ በምድር ደስታ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 2
ከሳሾች ከእንግዲህ
በኛ ላይ አይፈዱም
ጠፍተን አልቀረንም
ሊያጠፉን ቢወዱ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 3
ብርሃነ ከፈቤ
እህ ብርሃነ ከፈኑ ዲነው
ብርሃነ ከፈኑ ዲነ ነው
መስቀል ተሸክመህ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 4
እኛን ነጻ ወጣ
ቃልህ ፈመራ
ልዩ የእኛን ሞት ስትከላ ለኛ
እኛ ህይወት ሆነ ከሞት በኋላ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 5
ብርሃነ ከፈቤ
ከፈቤ ዲቤ
ከፈኖ ዲቤ ነህ
የእስራኤል ማህበር ያረዱ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 6
ህዝቡ በግንባ ተፋ
እኛን ለመታደግ በኢማሆ መንገድ
እግር ቀድሞ መጣ
የማይጨል በምድራችን ወጣ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 7
ብርሃነ ከፈቤ
ከፈቤ
ከፈነቤ ነህ
በመስቀል ጠረቀ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 8
ሞትን የገደልከው
መቃብርን መግለፁን
ፍጡር አላርከው
ዛሬ በብርሃን ህይወታችን ይብራ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 9
መኖር አጭር ሆነ ከኛ ጋራ
ብርሃነ ከፈኑ ዲቤ
ከፈኑ ዲቤ
እህ ብርሃነ ከፈቤ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 10
ከፈቤ
ትንሳኤ ለለመነ
ትንሳኤል አነፈኑ ዲቤ
ከፈቤ ባነራ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 11
ከፈኖ ዲቤ
ከፈኖ ዲቤ ነህ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd4c72f7f-1365-454c-881f-045fd73c28cc'::uuid, 'orthidox-tewahdo-song', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lehulu-yemitiset ("Lehulu Yemitiset")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '34fb8a9c-5a59-43ca-9f5f-d153392dbc37'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 1
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 2
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 3
በትምክህት ሆነን
በአንዳች እንዳንፈርድ
በሰው ያለው ድካም
አለ በእኛም ዘንድ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 4
በምህረቱ ብዛት
ተሸፍነን እንጅ
እጅግ ብዙ ድካም
አለ በእኛ እጅ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 5
እጅግ ብዙ ድካም
አለ በእኛ እጅ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 6
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 7
ተገልጦ ነው እንጂ ኃይሉ በእኛ ድካም
ኃጢያት የሌለበት አንድስ እንኳን የለም
እኔ እሻላለሁ አንበል በ ልባችን
አግናጥዮስ አለ በመካከላችን 2x

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 8
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
አንዱ የአንዱን ድካም እያገዘ ይኑር

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 9
የኃጢያትን ብዛት ይሸፍናል ፍቅር
መቅደም ስለሌለ ለብቻ ሮጦ
ያፀድቀናል እንጂ እግዚአብሔር መርጦ 2x
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 10
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እራሱን ከፍ አርጎ ሌላውን የሚ��ቅ
በአመነው አይፀናም ቅርብ ነው ለመውደቅ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 11
የትህትናን ሕይወት ይነግረናል ቃሉ
እኛ የማንጠቅም ባርያዎች ነን በሉ 2
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 12
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
በክርስቶስ ፍቅር እንውደድ ሁሉን
ነፍሰ ገዳይ ሆነን እንዳናጣ ክብሩን
እየተባባልን የአጵሎስ የኬፋ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 13
ካላመኑት ይልቅ ብሰን እንዳንከፋ
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 14
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 1
Endanl agzen
Ene ebelt’ ene ebelt’
Ye ewqet aynochn
Le hulu yemtset’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 2
Endanl agzen
Ene ebelt’ ene ebelt’
Endanl agzen
Ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 3
Betmkht honen
Beandach endanferd
Besew yalew dikam
Ale beegnam zend

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 4
Bemhretu bizat
Teshefnen enj
Ejg bizu dikam
Ale beegna ej

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 5
Ejg bizu dikam
Ale beegna ej
Ye ewqet aynochn
Le hulu yemtset’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 6
Endanl agzen
Ene ebelt’ ene ebelt’
Endanl agzen
Ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 7
Tegelt’o new enji haylu beegna dikam
Hat’iyat yelelebet ands enkwan yelem
Ene eshalalehu anbel be libachn
Agnat’yos ale bemekakelachn 2x

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 8
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’
Andu yeandun dikam eyageze yinur

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 9
Yehat’iyatn bizat yishefnal fiqr
Meqdem silelele lebcha rot’o
Yats’edqenal enji Egziabher mert’o 2x
Ye ewqet aynochn le hulu yemtset’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 10
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’
Erasun kef argo lelawn yemi��q
Beamenew ayts’enam qirb new lemewdeq

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 11
Yethtnan hiywet yinegrenal qalu
Egna yemant’eqm baryawoch nen belu 2
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 12
Endanl agzen ene ebelt’ ene ebelt’
BeKristos fiqr enwded hulun
Nefse geday honen endanat’a kibrun
Eyetebabaln yeap’los yekefa

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 13
Kalamenut yilq bisen endankefa
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 14
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 1
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 2
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 3
በትምክህት ሆነን
በአንዳች እንዳንፈርድ
በሰው ያለው ድካም
አለ በእኛም ዘንድ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 4
በምህረቱ ብዛት
ተሸፍነን እንጅ
እጅግ ብዙ ድካም
አለ በእኛ እጅ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 5
እጅግ ብዙ ድካም
አለ በእኛ እጅ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 6
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 7
ተገልጦ ነው እንጂ ኃይሉ በእኛ ድካም
ኃጢያት የሌለበት አንድስ እንኳን የለም
እኔ እሻላለሁ አንበል በ ልባችን
አግናጥዮስ አለ በመካከላችን 2x

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 8
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
አንዱ የአንዱን ድካም እያገዘ ይኑር

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 9
የኃጢያትን ብዛት ይሸፍናል ፍቅር
መቅደም ስለሌለ ለብቻ ሮጦ
ያፀድቀናል እንጂ እግዚአብሔር መርጦ 2x
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 10
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እራሱን ከፍ አርጎ ሌላውን የሚ��ቅ
በአመነው አይፀናም ቅርብ ነው ለመውደቅ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 11
የትህትናን ሕይወት ይነግረናል ቃሉ
እኛ የማንጠቅም ባርያዎች ነን በሉ 2
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 12
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
በክርስቶስ ፍቅር እንውደድ ሁሉን
ነፍሰ ገዳይ ሆነን እንዳናጣ ክብሩን
እየተባባልን የአጵሎስ የኬፋ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 13
ካላመኑት ይልቅ ብሰን እንዳንከፋ
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 14
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ',
        lyrics_transliteration = 'CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 1
Endanl agzen
Ene ebelt’ ene ebelt’
Ye ewqet aynochn
Le hulu yemtset’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 2
Endanl agzen
Ene ebelt’ ene ebelt’
Endanl agzen
Ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 3
Betmkht honen
Beandach endanferd
Besew yalew dikam
Ale beegnam zend

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 4
Bemhretu bizat
Teshefnen enj
Ejg bizu dikam
Ale beegna ej

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 5
Ejg bizu dikam
Ale beegna ej
Ye ewqet aynochn
Le hulu yemtset’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 6
Endanl agzen
Ene ebelt’ ene ebelt’
Endanl agzen
Ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 7
Tegelt’o new enji haylu beegna dikam
Hat’iyat yelelebet ands enkwan yelem
Ene eshalalehu anbel be libachn
Agnat’yos ale bemekakelachn 2x

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 8
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’
Andu yeandun dikam eyageze yinur

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 9
Yehat’iyatn bizat yishefnal fiqr
Meqdem silelele lebcha rot’o
Yats’edqenal enji Egziabher mert’o 2x
Ye ewqet aynochn le hulu yemtset’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 10
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’
Erasun kef argo lelawn yemi��q
Beamenew ayts’enam qirb new lemewdeq

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 11
Yethtnan hiywet yinegrenal qalu
Egna yemant’eqm baryawoch nen belu 2
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 12
Endanl agzen ene ebelt’ ene ebelt’
BeKristos fiqr enwded hulun
Nefse geday honen endanat’a kibrun
Eyetebabaln yeap’los yekefa

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 13
Kalamenut yilq bisen endankefa
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 14
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’',
        updated_at = clock_timestamp()::text
    WHERE import_id = '34fb8a9c-5a59-43ca-9f5f-d153392dbc37'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 1
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 2
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 3
በትምክህት ሆነን
በአንዳች እንዳንፈርድ
በሰው ያለው ድካም
አለ በእኛም ዘንድ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 4
በምህረቱ ብዛት
ተሸፍነን እንጅ
እጅግ ብዙ ድካም
አለ በእኛ እጅ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 5
እጅግ ብዙ ድካም
አለ በእኛ እጅ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 6
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 7
ተገልጦ ነው እንጂ ኃይሉ በእኛ ድካም
ኃጢያት የሌለበት አንድስ እንኳን የለም
እኔ እሻላለሁ አንበል በ ልባችን
አግናጥዮስ አለ በመካከላችን 2x

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 8
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
አንዱ የአንዱን ድካም እያገዘ ይኑር

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 9
የኃጢያትን ብዛት ይሸፍናል ፍቅር
መቅደም ስለሌለ ለብቻ ሮጦ
ያፀድቀናል እንጂ እግዚአብሔር መርጦ 2x
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 10
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እራሱን ከፍ አርጎ ሌላውን የሚ��ቅ
በአመነው አይፀናም ቅርብ ነው ለመውደቅ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 11
የትህትናን ሕይወት ይነግረናል ቃሉ
እኛ የማንጠቅም ባርያዎች ነን በሉ 2
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 12
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
በክርስቶስ ፍቅር እንውደድ ሁሉን
ነፍሰ ገዳይ ሆነን እንዳናጣ ክብሩን
እየተባባልን የአጵሎስ የኬፋ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 13
ካላመኑት ይልቅ ብሰን እንዳንከፋ
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 14
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '34fb8a9c-5a59-43ca-9f5f-d153392dbc37'::uuid, 'lehulu-yemitiset', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beza-kulu-alem-yom-tewolede ("Beza Kulu Alem Yom Tewolede")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1792ee78-cad2-4042-8a3b-abedb283365c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/

CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/

VERSE 1
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/

CHORUS
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/

CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/',
        lyrics_transliteration = 'CHORUS
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/

VERSE 1
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/

CHORUS
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1792ee78-cad2-4042-8a3b-abedb283365c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/

CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/

VERSE 1
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/

CHORUS
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1792ee78-cad2-4042-8a3b-abedb283365c'::uuid, 'beza-kulu-alem-yom-tewolede', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
