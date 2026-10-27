-- =========================================================================
-- ROLLBACK BATCH 08 of 10: 100 Hymns (701 to 800)
-- Target: public.mezmur_data_import
-- =========================================================================

DO $rollback_batch_08$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn rollback: Sebihiwo Leamilakine (sebihiwo-leamilakine)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 1
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 2
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 3
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 4
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን',
      lyrics_transliteration = 'CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 1
Yitayal yaberal Geta zarem besraw
Misgun new serawit hulu yamesegenew

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 2
Mihretu yiqrtaw bizu kewesen yesefa
Abat new birtu met’egiya yesew lijoch tesfa
Megabi left’ret alem talaq balets’ega
Yabbal yilemelmal ersun yetet’ega

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 3
Temesgen temesgen yilal yetegobegne sew
Ket’fat kegusqulna kemot yemelesew
Yiqebal ketach ansto keregnnet bota
Yiqrtaw ts’egaw bizunew mihretu yegeta

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 4
Melaekt belay besemay yizemruletal
Dawitm kebegenaw gar beqne tenestwal
Bemdrm egna lijochu enbel nisebho
Yigebal leamlake esrael widase amlko

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sebihiwo-leamilakine'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 1
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

VERSE 2
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

VERSE 3
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

VERSE 4
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 1
Yitayal yaberal Geta zarem besraw
Misgun new serawit hulu yamesegenew

VERSE 2
Mihretu yiqrtaw bizu kewesen yesefa
Abat new birtu met’egiya yesew lijoch tesfa
Megabi left’ret alem talaq balets’ega
Yabbal yilemelmal ersun yetet’ega

VERSE 3
Temesgen temesgen yilal yetegobegne sew
Ket’fat kegusqulna kemot yemelesew
Yiqebal ketach ansto keregnnet bota
Yiqrtaw ts’egaw bizunew mihretu yegeta

VERSE 4
Melaekt belay besemay yizemruletal
Dawitm kebegenaw gar beqne tenestwal
Bemdrm egna lijochu enbel nisebho
Yigebal leamlake esrael widase amlko'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sebihiwo-leamilakine', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Seirkani (seirkani)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 1
ኣበይ''ዶ መልሲ ክረኽበልካ''የ ኣብ ዙፋን ፍርድኻ:
ቆፎ ግብረይ ጸንቂቐ ብዘይ ፍረ ዘጉሃኩኻ:
ተመስገን''ያ ምክሊት ነብሰይ ቀቢረ ኮይነ ኣማራሪ:
ካብቲ ቅዱስ ማኣድኻ ብጉጤት ተመንጣሊ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 2
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
ንራእየይ ፍጹም ዘደብዝዝ ዘይጥዓስ ልቢ ሒዘ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 3
ንጽያፍ ግብረይ ዘይመኑ ውዒለ ክሓድረሉ:
ኢልካኒ ጸሚኤ ፍቕርኻ ሓሞት ሓርማዝ ዘስተኹኻ:
ግን ትጽበየኒ እንቅዓ ዘይትርብርብ ፈቃር ኢኻ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 4
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
መሲለ ነዚ ርኹስ ዘመን ካብ ሂወት ንሞት ዝኣምን:
ንተስፋ ውሽጠይ ቀቲለ ሕልናይ ናብ ሞት ሰቒለ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 5
ዘይትቀብጽ ኣቦ ምሕረት ግብርኻ ከመይ ክቁጸር:
ኣብ ማይ የእትየዮ ውዕለትካ ግን ጌና ዝርጉሕ''ዩ ኢድካ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)',
      lyrics_transliteration = 'CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 1
Abey''do melsi kireኽbelka''ye ab zufan firdኻ:
Qofo gibrey ts’enqiቐ bizey fire zeguhakuኻ:
Temesgen''ya miklit nebsey qebire koyne amarari:
Kabti Kidus maadኻ bigut’et tement’ali:

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 2
[abet kem bizhi mihretka t’emitkani]
[kab kontnet za''alem ab betka awilkani.]
Az""""
Niraeyey fits’um zedebzz zeyt’as libi hize:

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 3
Nits’yaf gibrey zeymenu wiile kihadrelu:
Ilkani ts’emie fiቕrኻ hamot harmaz zesteኹኻ:
Gin tits’beyeni enqa zeytrbrb feqar iኻ:
[abet kem bizhi mihretka t’emitkani]

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 4
[kab kontnet za''alem ab betka awilkani.]
Az""""
Mesile nezi riኹs zemen kab hiwet nimot ziamn:
Nitesfa wisht’ey qetile hilnay nab mot seቒle:

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 5
Zeytqebts’ abo mihret gibrኻ kemey kiquts’er:
Ab may yeetyeyo wieletka gin gena zirguh''yu idka:
[abet kem bizhi mihretka t’emitkani]
[kab kontnet za''alem ab betka awilkani.]

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'seirkani'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 1
ኣበይ''ዶ መልሲ ክረኽበልካ''የ ኣብ ዙፋን ፍርድኻ:
ቆፎ ግብረይ ጸንቂቐ ብዘይ ፍረ ዘጉሃኩኻ:
ተመስገን''ያ ምክሊት ነብሰይ ቀቢረ ኮይነ ኣማራሪ:
ካብቲ ቅዱስ ማኣድኻ ብጉጤት ተመንጣሊ:

VERSE 2
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
ንራእየይ ፍጹም ዘደብዝዝ ዘይጥዓስ ልቢ ሒዘ:

VERSE 3
ንጽያፍ ግብረይ ዘይመኑ ውዒለ ክሓድረሉ:
ኢልካኒ ጸሚኤ ፍቕርኻ ሓሞት ሓርማዝ ዘስተኹኻ:
ግን ትጽበየኒ እንቅዓ ዘይትርብርብ ፈቃር ኢኻ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]

VERSE 4
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
መሲለ ነዚ ርኹስ ዘመን ካብ ሂወት ንሞት ዝኣምን:
ንተስፋ ውሽጠይ ቀቲለ ሕልናይ ናብ ሞት ሰቒለ:

VERSE 5
ዘይትቀብጽ ኣቦ ምሕረት ግብርኻ ከመይ ክቁጸር:
ኣብ ማይ የእትየዮ ውዕለትካ ግን ጌና ዝርጉሕ''ዩ ኢድካ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 1
Abey''do melsi kireኽbelka''ye ab zufan firdኻ:
Qofo gibrey ts’enqiቐ bizey fire zeguhakuኻ:
Temesgen''ya miklit nebsey qebire koyne amarari:
Kabti Kidus maadኻ bigut’et tement’ali:

VERSE 2
[abet kem bizhi mihretka t’emitkani]
[kab kontnet za''alem ab betka awilkani.]
Az""""
Niraeyey fits’um zedebzz zeyt’as libi hize:

VERSE 3
Nits’yaf gibrey zeymenu wiile kihadrelu:
Ilkani ts’emie fiቕrኻ hamot harmaz zesteኹኻ:
Gin tits’beyeni enqa zeytrbrb feqar iኻ:
[abet kem bizhi mihretka t’emitkani]

VERSE 4
[kab kontnet za''alem ab betka awilkani.]
Az""""
Mesile nezi riኹs zemen kab hiwet nimot ziamn:
Nitesfa wisht’ey qetile hilnay nab mot seቒle:

VERSE 5
Zeytqebts’ abo mihret gibrኻ kemey kiquts’er:
Ab may yeetyeyo wieletka gin gena zirguh''yu idka:
[abet kem bizhi mihretka t’emitkani]
[kab kontnet za''alem ab betka awilkani.]'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'seirkani', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sekokawe Hager (sekokawe-hager)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 1
“ስንሞት እንበዛን” ያለ ጠርጡለስ፥
በዐውደ ኢትዮጵያ ዛሬ ይከሰስ፥
ደሙም ዘር አልሆነ እያደር ማነስ።
ዘቅዝቀው ሰቀሉት ወንድሜን በጣ’ይ፥

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 2
በሰይፍም ቆረጡት ፈርደው በጉባይ፥
የጴጥሮስ ፣ የጳውሎስ ታሪክ ባ’ይኔ ‘ማይ፥
ጦቢያ የመሰለኝ ሮም አይደለም ወይ?
ገበሬን ምን ነካው ምንስ አስነኩት፥

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 3
እንዲህ ሲለኝ ሰማሁ ልቡ ተስቶት፥
"ላሜን አረድኩና ባ''ህያ ጫንኩት፥
ባ''ህያ ጫንኩና ጅብን ንዳ አልኩት፥
ጅብን ንዳ አልኩና ውሻን ሳብ አልኩት፥"

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 4
ኧረ መ''ላ በ''ሉት ተው/ዉ በ''ሉት በ''ሉት! (ጠብቆና ላልቶ ይደገማል)
ምንድን ሆኗል ሰዉ በሽታን ያልቻለ፥
አቅም የሚሰጠው ብርቱካ’ን እያለ፥
መብላቱ መች ጠፍቶት እየከፋፈለ።

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 5
ምን ያገብረኛል መቆም ለወረት፥
ለየትኛው ሰዓታት እያለ መቅረት።
በገሃድ እንዳንጦም ከዝግን ፣ ቅቅሉ፥
እስኪ ጠይቁልን መቼ ዋለ ባ’ሉ?

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 6
እግዚአብሔር ልዑል በመንበሩ ሳለ፥
ሰው በሰው ላይ ወጥቶ “ከፋ’ለ ከፋ’ለ”።

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።',
      lyrics_transliteration = 'CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 1
“snmot enbezan” yale t’ert’ules:
Beawde ityop’ya zare yikeses:
Demum zer alhone eyader manes.
Zeqzqew seqelut wendmen bet’a’y:

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 2
Beseyfm qoret’ut ferdew begubay:
Yep’et’ros , yep’awlos tarik ba’yne ‘may:
T’obiya yemeselegn rom aydelem wey?
Geberen min nekaw mins asnekut:

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 3
Endih silegn semahu libu testot:
"lamen aredkuna ba''hiya ch’ankut:
Ba''hiya ch’ankuna jibn nida alkut:
Jibn nida alkuna wishan sab alkut:"

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 4
ኧre me''la be''lut tew/wu be''lut be''lut! (t’ebqona lalto yidegemal)
Mindn honwal sewu beshtan yalchale:
Aqm yemiset’ew birtuka’n eyale:
Meblatu mech t’eftot eyekefafele.

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 5
Min yagebregnal meqom leweret:
Leyetgnaw seatat eyale meqret.
Begehad endant’om kezgn , qiqlu:
Eski t’eyquln meche wale ba’lu?

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 6
Egziabher liul bemenberu sale:
Sew besew lay wet’to “kefa’le kefa’le”.

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sekokawe-hager'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 1
“ስንሞት እንበዛን” ያለ ጠርጡለስ፥
በዐውደ ኢትዮጵያ ዛሬ ይከሰስ፥
ደሙም ዘር አልሆነ እያደር ማነስ።
ዘቅዝቀው ሰቀሉት ወንድሜን በጣ’ይ፥

VERSE 2
በሰይፍም ቆረጡት ፈርደው በጉባይ፥
የጴጥሮስ ፣ የጳውሎስ ታሪክ ባ’ይኔ ‘ማይ፥
ጦቢያ የመሰለኝ ሮም አይደለም ወይ?
ገበሬን ምን ነካው ምንስ አስነኩት፥

VERSE 3
እንዲህ ሲለኝ ሰማሁ ልቡ ተስቶት፥
"ላሜን አረድኩና ባ''ህያ ጫንኩት፥
ባ''ህያ ጫንኩና ጅብን ንዳ አልኩት፥
ጅብን ንዳ አልኩና ውሻን ሳብ አልኩት፥"

VERSE 4
ኧረ መ''ላ በ''ሉት ተው/ዉ በ''ሉት በ''ሉት! (ጠብቆና ላልቶ ይደገማል)
ምንድን ሆኗል ሰዉ በሽታን ያልቻለ፥
አቅም የሚሰጠው ብርቱካ’ን እያለ፥
መብላቱ መች ጠፍቶት እየከፋፈለ።

VERSE 5
ምን ያገብረኛል መቆም ለወረት፥
ለየትኛው ሰዓታት እያለ መቅረት።
በገሃድ እንዳንጦም ከዝግን ፣ ቅቅሉ፥
እስኪ ጠይቁልን መቼ ዋለ ባ’ሉ?

VERSE 6
እግዚአብሔር ልዑል በመንበሩ ሳለ፥
ሰው በሰው ላይ ወጥቶ “ከፋ’ለ ከፋ’ለ”።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 1
“snmot enbezan” yale t’ert’ules:
Beawde ityop’ya zare yikeses:
Demum zer alhone eyader manes.
Zeqzqew seqelut wendmen bet’a’y:

VERSE 2
Beseyfm qoret’ut ferdew begubay:
Yep’et’ros , yep’awlos tarik ba’yne ‘may:
T’obiya yemeselegn rom aydelem wey?
Geberen min nekaw mins asnekut:

VERSE 3
Endih silegn semahu libu testot:
"lamen aredkuna ba''hiya ch’ankut:
Ba''hiya ch’ankuna jibn nida alkut:
Jibn nida alkuna wishan sab alkut:"

VERSE 4
ኧre me''la be''lut tew/wu be''lut be''lut! (t’ebqona lalto yidegemal)
Mindn honwal sewu beshtan yalchale:
Aqm yemiset’ew birtuka’n eyale:
Meblatu mech t’eftot eyekefafele.

VERSE 5
Min yagebregnal meqom leweret:
Leyetgnaw seatat eyale meqret.
Begehad endant’om kezgn , qiqlu:
Eski t’eyquln meche wale ba’lu?

VERSE 6
Egziabher liul bemenberu sale:
Sew besew lay wet’to “kefa’le kefa’le”.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sekokawe-hager', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selam Argiw Mariam Like Mezemeran Tewodros Yosef (selam-argiw-mariam-like-mezemeran-tewodros-yosef)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selam-argiw-mariam-like-mezemeran-tewodros-yosef'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላም አርጊው ማርያም ስጭን የጅሽን
አንድ መንጋ ሆነን በዛ ቋንቋችን
ናፍቀናል ልጆችሽ ፍቅር አንድነትን
በስንዴው መሃል እንክርዳዱን

VERSE 1
ጠላት ዘራና ክፍፍሉን
የፍቅር ቋንቋ ቀዘቀዘ
አንድነታችን ደበዘዘ፡፡
ያስጎነበሰን ሸክም ይቅለል

VERSE 2
በልጅሽ ምህረት ቀና እንበል
ሰላም እንዲሰንፍ በምህረቱ
ንጉሱን ማልጅው ንግስቲቱ፡፡
የሽንገላ ቃል ከኛ ይውጣ

VERSE 3
ያ ክፉ ዘመን እንዳይመጣ
በመለያየት ተመስርቶ
የፀና መንግስት የለም ከቶ፡፡
በረከት አዟል አምላካችን

VERSE 4
ህብረት ባለበት መኖሪያችን
ክፍፍል ይቅር አሳስቢልን
በቃል ኪዳንሽ አስጠልይን፡፡
ክፋትን ተክለን በልባችን

VERSE 5
መልክ ብቻ ነው አምልኳችን
ወድቀን እንዳንቀር እንዳንጠፋ
ፍቅርን ሳይብን የአዳም ተስፋ፡፡
እንወድሻለን ማርያም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selam argiw Maryam sich’n yejshn
And menga honen beza qwanqwachn
Nafqenal lijochsh fiqr andnetn
Besndew mehal enkrdadun

VERSE 1
T’elat zerana kifflun
Yefqr qwanqwa qezeqeze
Andnetachn debezeze
Yasgonebesen shekm yiqlel

VERSE 2
Beljsh mihret qena enbel
Selam endisenf bemhretu
Nigusun maljw nigstitu
Yeshngela qal kegna yiwt’a

VERSE 3
Ya kifu zemen endaymet’a
Bemeleyayet temesrto
Yets’ena mengst yelem keto
Bereket azwal amlakachn

VERSE 4
Hibret balebet menoriyachn
Kiffl yiqr asasbiln
Beqal kidansh ast’elyn
Kifatn teklen belbachn

VERSE 5
Melk bicha new amlkwachn
Wedqen endanqer endant’efa
Fiqrn saybn yeadam tesfa
Enwedshalen Maryam'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selam-argiw-mariam-like-mezemeran-tewodros-yosef', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selam Leitiyopiya (selam-leitiyopiya)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 1
አቅናት ፈጣሪዋ ስርአት እንደገና
የሰቀለችሁን ታውርድ ያን በገና
ያቼ ዳቦ ምድር ያዘነች አዝመራ
እንዴት ስለችግር ስለረሃብ ታውራ ተመልከታት አምላክ ምህረትህ ይድረሳት ጩኸቷ ተሰምቶ በረከት አርሳት

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 2
የገዛ ውሀችን በዋጋ ገዝተናል
በራሳችን ምድር ባለእዳር ሆነናል
ትሁፊት ታሪካችን ባህሉም ተረሳ የሰዶምን ኃጢያት ምድራችን ተላብሳ
እንሆ እግሮቻችን ለስደት ተነሱ

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 3
የናቁት እርስቶች በደም ተወረሱ
አንተ ብቻ አብሰው የዓይናችን ለቅሶ ወድቀናል ከደጅ ሀዘናችን ብሶ

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ',
      lyrics_transliteration = 'CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 1
Aqnat fet’ariwa sirat endegena
Yeseqelechhun tawrd yan begena
Yache dabo midr yazenech azmera
Endet silechgr silerehab tawra temelketat amlak mihreth yidresat ch’uኸtwa tesemto bereket arsat

CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 2
Yegeza wihechn bewaga geztenal
Berasachn midr baleedar honenal
Tihufit tarikachn bahlum teresa yesedomn hat’iyat midrachn telabsa
Enho egrochachn lesdet tenesu

CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 3
Yenaqut erstoch bedem teweresu
Ante bicha absew yeaynachn leqso wedqenal kedej hezenachn biso

CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selam-leitiyopiya'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 1
አቅናት ፈጣሪዋ ስርአት እንደገና
የሰቀለችሁን ታውርድ ያን በገና
ያቼ ዳቦ ምድር ያዘነች አዝመራ
እንዴት ስለችግር ስለረሃብ ታውራ ተመልከታት አምላክ ምህረትህ ይድረሳት ጩኸቷ ተሰምቶ በረከት አርሳት

VERSE 2
የገዛ ውሀችን በዋጋ ገዝተናል
በራሳችን ምድር ባለእዳር ሆነናል
ትሁፊት ታሪካችን ባህሉም ተረሳ የሰዶምን ኃጢያት ምድራችን ተላብሳ
እንሆ እግሮቻችን ለስደት ተነሱ

VERSE 3
የናቁት እርስቶች በደም ተወረሱ
አንተ ብቻ አብሰው የዓይናችን ለቅሶ ወድቀናል ከደጅ ሀዘናችን ብሶ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 1
Aqnat fet’ariwa sirat endegena
Yeseqelechhun tawrd yan begena
Yache dabo midr yazenech azmera
Endet silechgr silerehab tawra temelketat amlak mihreth yidresat ch’uኸtwa tesemto bereket arsat

VERSE 2
Yegeza wihechn bewaga geztenal
Berasachn midr baleedar honenal
Tihufit tarikachn bahlum teresa yesedomn hat’iyat midrachn telabsa
Enho egrochachn lesdet tenesu

VERSE 3
Yenaqut erstoch bedem teweresu
Ante bicha absew yeaynachn leqso wedqenal kedej hezenachn biso'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selam-leitiyopiya', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selam Leki (selam-leki)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰላም ለኪ ለኖህ ሐመሩ ሰላም ለኪ የአሮን በትሩ
የቅዱስ ዳዊት መሰንቆ መዝሙሩ ሰላም ለኪ የጌዴዎን ጾምሩ
የሰለሞን መንበረ ክብሩ ሰላም ለኪ ፍሬ ስብሐት መዝሙሩ/2/

VERSE 1
እመ እግዚአብሔር ጸባኦት ሰላም ለኪ/2/

CHORUS
ሰላም ለኪ ለኖህ ሐመሩ ሰላም ለኪ የአሮን በትሩ
የቅዱስ ዳዊት መሰንቆ መዝሙሩ ሰላም ለኪ የጌዴዎን ጾምሩ
የሰለሞን መንበረ ክብሩ ሰላም ለኪ ፍሬ ስብሐት መዝሙሩ/2/

VERSE 2
ሰላም ለኪ ሰረገላው ለአሚናዳብ ሰላም ለኪ
መና ያለብሽ ንጹህ መሶብ ሰላም ለኪ
ያዕቆብ ያየሽ በሎዛ ሰላም ለኪ
የይስሐቅ መዓዛ/2/

CHORUS
ሰላም ለኪ ለኖህ ሐመሩ ሰላም ለኪ የአሮን በትሩ
የቅዱስ ዳዊት መሰንቆ መዝሙሩ ሰላም ለኪ የጌዴዎን ጾምሩ
የሰለሞን መንበረ ክብሩ ሰላም ለኪ ፍሬ ስብሐት መዝሙሩ/2/

VERSE 3
እንዘ ንሴብሖ ለበረከትኪ ዘምስለ አምሃ እሰግድ ለኪ/2/

CHORUS
ሰላም ለኪ ለኖህ ሐመሩ ሰላም ለኪ የአሮን በትሩ
የቅዱስ ዳዊት መሰንቆ መዝሙሩ ሰላም ለኪ የጌዴዎን ጾምሩ
የሰለሞን መንበረ ክብሩ ሰላም ለኪ ፍሬ ስብሐት መዝሙሩ/2/

VERSE 4
ሰላም ለኪ ህብስተ መና ዘ እስራኤል ሰላም ለኪ
የሰማዕታት ንጹህ አክሊል ሰላም ለኪ
እጸ እጳጦስ ዘሲና ሰላም ለኪ
የኤልያስ መና/2/

CHORUS
ሰላም ለኪ ለኖህ ሐመሩ ሰላም ለኪ የአሮን በትሩ
የቅዱስ ዳዊት መሰንቆ መዝሙሩ ሰላም ለኪ የጌዴዎን ጾምሩ
የሰለሞን መንበረ ክብሩ ሰላም ለኪ ፍሬ ስብሐት መዝሙሩ/2/

VERSE 5
እንዘ ንሴብሖ ለበረከትኪ ዘምስለ አምሃ እሰግድ ለኪ/2/

CHORUS
ሰላም ለኪ ለኖህ ሐመሩ ሰላም ለኪ የአሮን በትሩ
የቅዱስ ዳዊት መሰንቆ መዝሙሩ ሰላም ለኪ የጌዴዎን ጾምሩ
የሰለሞን መንበረ ክብሩ ሰላም ለኪ ፍሬ ስብሐት መዝሙሩ/2/',
      lyrics_transliteration = 'CHORUS
Selam leki leNoah hameru selam leki yeAaron betru
YeKidus Dawit mesenqo mezmuru selam leki yeGedeon ts’omru
YeSolomon menbere kibru selam leki firé sibhat mezmuru (x2)

VERSE 1
Eme Egziabher Tsebaot selam leki (x2)

CHORUS
Selam leki leNoah hameru selam leki yeAaron betru
YeKidus Dawit mesenqo mezmuru selam leki yeGedeon ts’omru
YeSolomon menbere kibru selam leki firé sibhat mezmuru (x2)

VERSE 2
Selam leki seregela leAminadab selam leki
Mena yalebish nits’uh mesob selam leki
Ya’eqob yayesh beloza selam leki
YeYishaq me’aza (x2)

CHORUS
Selam leki leNoah hameru selam leki yeAaron betru
YeKidus Dawit mesenqo mezmuru selam leki yeGedeon ts’omru
YeSolomon menbere kibru selam leki firé sibhat mezmuru (x2)

VERSE 3
Enze nsebho lebereketki zemesle amha esegid leki (x2)

CHORUS
Selam leki leNoah hameru selam leki yeAaron betru
YeKidus Dawit mesenqo mezmuru selam leki yeGedeon ts’omru
YeSolomon menbere kibru selam leki firé sibhat mezmuru (x2)

VERSE 4
Selam leki hibste mena ze Israel selam leki
YeSema’etat nits’uh aklil selam leki
Itse ep’atos zeSina selam leki
YeEliyas mena (x2)

CHORUS
Selam leki leNoah hameru selam leki yeAaron betru
YeKidus Dawit mesenqo mezmuru selam leki yeGedeon ts’omru
YeSolomon menbere kibru selam leki firé sibhat mezmuru (x2)

VERSE 5
Enze nsebho lebereketki zemesle amha esegid leki (x2)

CHORUS
Selam leki leNoah hameru selam leki yeAaron betru
YeKidus Dawit mesenqo mezmuru selam leki yeGedeon ts’omru
YeSolomon menbere kibru selam leki firé sibhat mezmuru (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selam-leki'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላም ለኪ ለኖህ ሐመሩ ሰላም ለኪ የአሮን በትሩ
የቅዱስ ዳዊት መሰንቆ መዝሙሩ ሰላም ለኪ የጌዴዎን ጾምሩ
የሰለሞን መንበረ ክብሩ ሰላም ለኪ ፍሬ ስብሐት መዝሙሩ/2/

VERSE 1
እመ እግዚአብሔር ጸባኦት ሰላም ለኪ/2/

VERSE 2
ሰላም ለኪ ሰረገላው ለአሚናዳብ ሰላም ለኪ
መና ያለብሽ ንጹህ መሶብ ሰላም ለኪ
ያዕቆብ ያየሽ በሎዛ ሰላም ለኪ
የይስሐቅ መዓዛ/2/

VERSE 3
እንዘ ንሴብሖ ለበረከትኪ ዘምስለ አምሃ እሰግድ ለኪ/2/

VERSE 4
ሰላም ለኪ ህብስተ መና ዘ እስራኤል ሰላም ለኪ
የሰማዕታት ንጹህ አክሊል ሰላም ለኪ
እጸ እጳጦስ ዘሲና ሰላም ለኪ
የኤልያስ መና/2/

VERSE 5
እንዘ ንሴብሖ ለበረከትኪ ዘምስለ አምሃ እሰግድ ለኪ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selam leki leNoah hameru selam leki yeAaron betru
YeKidus Dawit mesenqo mezmuru selam leki yeGedeon ts’omru
YeSolomon menbere kibru selam leki firé sibhat mezmuru (x2)

VERSE 1
Eme Egziabher Tsebaot selam leki (x2)

VERSE 2
Selam leki seregela leAminadab selam leki
Mena yalebish nits’uh mesob selam leki
Ya’eqob yayesh beloza selam leki
YeYishaq me’aza (x2)

VERSE 3
Enze nsebho lebereketki zemesle amha esegid leki (x2)

VERSE 4
Selam leki hibste mena ze Israel selam leki
YeSema’etat nits’uh aklil selam leki
Itse ep’atos zeSina selam leki
YeEliyas mena (x2)

VERSE 5
Enze nsebho lebereketki zemesle amha esegid leki (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selam-leki', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selam Leki Eyale (selam-leki-eyale)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 1
ተሰማ የገብርኤል ድምጽ ተሰማ
ውሃ ስትቀጂ ክንፉን እያማታ
ሊያበስርሽ የመጣው በታላቅ ደስታ
ከሞገስሽ ብዛት /2/ ሲታጠቅ ስፈታ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 2
አቅርቦልሽ ነበር የክብር ሰላምታ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 3
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
የምሥራቹን ቃል ምስጢር ተሸክሞ
ገብርኤል ተላከ ሊያረጋጋት ደግሞ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 4
እርጋታን ተሞልታ /2/ ነገሩን መርምራ
የመልአኩን ብሥራት ሰማችው በተራ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 5
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
ይደሰታል እንጂ መንፈሴ በአምላኬ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 6
በምስጋና ሳድር ዘወትር ተንበርክኬ
ሃሳቤ ለቅፅበት /2/ ሌላ መች ያስባል
ለእኔ ልጅን መውለድ እንዴት ይቻለኛል
ሰላም ለኪ እያለ /2/

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 7
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 8
ከአንቺ የሚወለደው ልዑል ነው ክቡር
የተመስገነ በሰማይ በምድር
ምስጢሩ ኃያል ነው /2/ ይረቃል ይሰፋል
ከአንቺ በቀር ይኼን ማን ይሸከመዋል

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 9
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 10
ተሰማ የገብርኤል ድምጽ ተሰማ
እጹብ ነው ድንቅ ነው አንቺን የፈጠረ
አንቺን በመውደዱ ሰውን አከበረ
ዓለም ይባረካል /2/ በማሕፀንሽ ፍሬ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 11
ክብርሽን አልዘልቅም ዘርዝሬ ዘርዝሬ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 12
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ',
      lyrics_transliteration = 'CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 1
Tesema ye-Gebriel dimts tesema
Wuha sitqeji kinfun eyamata
Liyabesirish yemetaw betalaq desta
Ke-mogesish bizat (2) sitataq sifeta

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 2
Aqirbolish neber ye-kibir selamta
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 3
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Ye-misirachun qal mistir teshekimo
Gebriel telake liyaregagat degmo

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 4
Ergatan temolta (2) negerun mermira
Ye-melakun bisirat semachiw betera
Selam leki eyale (2)
Harna werqun sitasmama

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 5
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Yidesetal inji menfese beamlake

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 6
Be-misgana sadir zewetir tenberkike
Hasabe leqitsbet (2) lela mech yasibal
Le-ene lijin mewled endet yichalegnal

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 7
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 8
Tesema ye-Gebriel dimts tesema
Ke-anchi yemiwoledew liul new kibur
Ye-temesgene besemay bemidir
Mistiru hayal new (2) yireqal yisefal

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 9
Ke-anchi beqer yihen man yishekemewal
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 10
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Itsub new dinq new anchin yefetere
Anchin bemewdedu sewin akebere

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 11
Alem yibarekal (2) be-mahitsensh fire
Kibirishin alzelqim zerzire zerzire
Selam leki eyale (2)
Harna werqun sitasmama

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 12
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selam-leki-eyale'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 1
ተሰማ የገብርኤል ድምጽ ተሰማ
ውሃ ስትቀጂ ክንፉን እያማታ
ሊያበስርሽ የመጣው በታላቅ ደስታ
ከሞገስሽ ብዛት /2/ ሲታጠቅ ስፈታ

VERSE 2
አቅርቦልሽ ነበር የክብር ሰላምታ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

VERSE 3
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
የምሥራቹን ቃል ምስጢር ተሸክሞ
ገብርኤል ተላከ ሊያረጋጋት ደግሞ

VERSE 4
እርጋታን ተሞልታ /2/ ነገሩን መርምራ
የመልአኩን ብሥራት ሰማችው በተራ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ

VERSE 5
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
ይደሰታል እንጂ መንፈሴ በአምላኬ

VERSE 6
በምስጋና ሳድር ዘወትር ተንበርክኬ
ሃሳቤ ለቅፅበት /2/ ሌላ መች ያስባል
ለእኔ ልጅን መውለድ እንዴት ይቻለኛል
ሰላም ለኪ እያለ /2/

VERSE 7
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ

VERSE 8
ከአንቺ የሚወለደው ልዑል ነው ክቡር
የተመስገነ በሰማይ በምድር
ምስጢሩ ኃያል ነው /2/ ይረቃል ይሰፋል
ከአንቺ በቀር ይኼን ማን ይሸከመዋል

VERSE 9
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 10
ተሰማ የገብርኤል ድምጽ ተሰማ
እጹብ ነው ድንቅ ነው አንቺን የፈጠረ
አንቺን በመውደዱ ሰውን አከበረ
ዓለም ይባረካል /2/ በማሕፀንሽ ፍሬ

VERSE 11
ክብርሽን አልዘልቅም ዘርዝሬ ዘርዝሬ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

VERSE 12
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 1
Tesema ye-Gebriel dimts tesema
Wuha sitqeji kinfun eyamata
Liyabesirish yemetaw betalaq desta
Ke-mogesish bizat (2) sitataq sifeta

VERSE 2
Aqirbolish neber ye-kibir selamta
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

VERSE 3
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Ye-misirachun qal mistir teshekimo
Gebriel telake liyaregagat degmo

VERSE 4
Ergatan temolta (2) negerun mermira
Ye-melakun bisirat semachiw betera
Selam leki eyale (2)
Harna werqun sitasmama

VERSE 5
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Yidesetal inji menfese beamlake

VERSE 6
Be-misgana sadir zewetir tenberkike
Hasabe leqitsbet (2) lela mech yasibal
Le-ene lijin mewled endet yichalegnal

VERSE 7
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 8
Tesema ye-Gebriel dimts tesema
Ke-anchi yemiwoledew liul new kibur
Ye-temesgene besemay bemidir
Mistiru hayal new (2) yireqal yisefal

VERSE 9
Ke-anchi beqer yihen man yishekemewal
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

VERSE 10
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Itsub new dinq new anchin yefetere
Anchin bemewdedu sewin akebere

VERSE 11
Alem yibarekal (2) be-mahitsensh fire
Kibirishin alzelqim zerzire zerzire
Selam leki eyale (2)
Harna werqun sitasmama

VERSE 12
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selam-leki-eyale', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selam Selam Leki (selam-selam-leki)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰላም (x2) ለኪ
ማርያም ሰላም ለኪ

VERSE 1
የሕይወት መሠረት ሰላም ለኪ
የፍጥረት አለኝታ ሰላም ለኪ
ድንግል አደራሽን ሰላም ለኪ
ሁኝልን መከታ ሰላም ለኪ

CHORUS
ሰላም (x2) ለኪ
ማርያም ሰላም ለኪ

VERSE 2
በላዔ ሰብ ዳነ ሰላም ለኪ
ብዙ ነፍስ አጥፍቶ ሰላም ለኪ
ያንቺን ስም ለጠራ ሰላም ለኪ
እፍኝ ውኃ ሰጥቶ ሰላም ለኪ

CHORUS
ሰላም (x2) ለኪ
ማርያም ሰላም ለኪ

VERSE 3
ተማጽነንብሻል ሰላም ለኪ
ባማላጅነትሽ ሰላም ለኪ
ድንግል አደራሽን ሰላም ለኪ
አማልጅን ከልጅሽ ሰላም ለኪ

CHORUS
ሰላም (x2) ለኪ
ማርያም ሰላም ለኪ

VERSE 4
እኛም ብንከተል ሰላም ለኪ
በጎ ምግባርን ሰላም ለኪ
በሰላም በጤና ሰላም ለኪ
እንኖራለን ሰላም ለኪ

CHORUS
ሰላም (x2) ለኪ
ማርያም ሰላም ለኪ',
      lyrics_transliteration = 'CHORUS
Selam (x2) leki
Maryam selam leki

VERSE 1
Ye-hiywot meseret selam leki
Ye-fitr’et aleñita selam leki
Dengel aderashin selam leki
Hunyilen meket’a selam leki

CHORUS
Selam (x2) leki
Maryam selam leki

VERSE 2
Belaye seb dane selam leki
Bizu nefs at’feto selam leki
Yanchin sim letera selam leki
Efighe wuha setto selam leki

CHORUS
Selam (x2) leki
Maryam selam leki

VERSE 3
Temats’nenbshal selam leki
Ba-mamalajinet’sh selam leki
Dengel aderashin selam leki
Amaljin ke-lijish selam leki

CHORUS
Selam (x2) leki
Maryam selam leki

VERSE 4
Enyam bink’etel selam leki
Bego migbarin selam leki
Be-selam beṭena selam leki
Ennoraln selam leki

CHORUS
Selam (x2) leki
Maryam selam leki',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selam-selam-leki'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላም (x2) ለኪ
ማርያም ሰላም ለኪ

VERSE 1
የሕይወት መሠረት ሰላም ለኪ
የፍጥረት አለኝታ ሰላም ለኪ
ድንግል አደራሽን ሰላም ለኪ
ሁኝልን መከታ ሰላም ለኪ

VERSE 2
በላዔ ሰብ ዳነ ሰላም ለኪ
ብዙ ነፍስ አጥፍቶ ሰላም ለኪ
ያንቺን ስም ለጠራ ሰላም ለኪ
እፍኝ ውኃ ሰጥቶ ሰላም ለኪ

VERSE 3
ተማጽነንብሻል ሰላም ለኪ
ባማላጅነትሽ ሰላም ለኪ
ድንግል አደራሽን ሰላም ለኪ
አማልጅን ከልጅሽ ሰላም ለኪ

VERSE 4
እኛም ብንከተል ሰላም ለኪ
በጎ ምግባርን ሰላም ለኪ
በሰላም በጤና ሰላም ለኪ
እንኖራለን ሰላም ለኪ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selam (x2) leki
Maryam selam leki

VERSE 1
Ye-hiywot meseret selam leki
Ye-fitr’et aleñita selam leki
Dengel aderashin selam leki
Hunyilen meket’a selam leki

VERSE 2
Belaye seb dane selam leki
Bizu nefs at’feto selam leki
Yanchin sim letera selam leki
Efighe wuha setto selam leki

VERSE 3
Temats’nenbshal selam leki
Ba-mamalajinet’sh selam leki
Dengel aderashin selam leki
Amaljin ke-lijish selam leki

VERSE 4
Enyam bink’etel selam leki
Bego migbarin selam leki
Be-selam beṭena selam leki
Ennoraln selam leki'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selam-selam-leki', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selam Selam (selam-selam-tinsae)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰላም ሰላም
እምይእዜሰ ይኩን ሰላም /x2/

VERSE 1
ሰላም ሰላም
ከእንግዲህስ ይሁን ሰላም /x2/

CHORUS
ሰላም ሰላም
እምይእዜሰ ይኩን ሰላም /x2/',
      lyrics_transliteration = 'CHORUS
Selam selam
Emyize se yikun selam (x2)

VERSE 1
Selam selam
Ke''engidihis yihun selam (x2)

CHORUS
Selam selam
Emyize se yikun selam (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selam-selam-tinsae'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላም ሰላም
እምይእዜሰ ይኩን ሰላም /x2/

VERSE 1
ሰላም ሰላም
ከእንግዲህስ ይሁን ሰላም /x2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selam selam
Emyize se yikun selam (x2)

VERSE 1
Selam selam
Ke''engidihis yihun selam (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selam-selam-tinsae', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selam Yikun (selam-yikun)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)

VERSE 1
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)

CHORUS
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)',
      lyrics_transliteration = 'CHORUS
Selam (4)
Emyieziese yikun selam (4)

VERSE 1
Selam (4)
Emyieziese yikun selam (4)

CHORUS
Selam (4)
Emyieziese yikun selam (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selam-yikun'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)

VERSE 1
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selam (4)
Emyieziese yikun selam (4)

VERSE 1
Selam (4)
Emyieziese yikun selam (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selam-yikun', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selame Banite New (selame-banite-new)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selame-banite-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላሜ በአንተ ነው የኔ ጌታ
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
ልቤ ለፍቅርህ ተሸነፈ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selame beante new yene Geta
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
Libe lefqrh teshenefe'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selame-banite-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selame Beante (selame-beante)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selame-beante'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላሜ በአንተ ነው የኔ ጌታ
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
ልቤ ለፍቅርህ ተሸነፈ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selame beante new yene Geta
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
Libe lefqrh teshenefe'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selame-beante', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selame Nesh Dengle (selame-nesh-dengle)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 1
ወገን ዘመድ ያልኩትሁሉ እራቀኝ
ሀዘን ፅልመት ችግር ገዝፎ ታየኝ
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እፅናናለሁ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 2
ፍቅርን ወልደሽ ሰላምን አገኘው
ድንግል በምልጃሽ ተፈውሻለሁ
የሰላም ምንጭ የነፃነት አርማ
ክብር የምትሰጭ ሞገስ ታላቅ ግርማ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 3
አንቺን ተስፋ አድርጌ ወጥቻለሁ
ቀን እና ሌት ንኢ እልሻለሁ
ላንቺ ልንበርከክ አይዛል ጉልበቴ
ውዳሴሽ ይብዛ ከአንደበቴ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 4
ሱላማጢስ ስልሽ እረካለሁ
በህይወቴ ሰላም አግቻለሁ
እንደሰው ልጅ ቀን እያየሽ የማትርቂ
የአማኑኤል እናት ዛሬም ባርኪኝ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 5
ተባርኪያለሁ ድንግል በልጅሽ
ይኸው ቆሚያለሁ ላመሰግንሽ
ወገን ዘመድ ያልኩት ሁሉ ራቀኝ
ሀዘን ጽልመት ችግር ገዝፎ ታየኝ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 6
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እናናለሁ
ፍቅርን ወልደሽ ሰላምን አገኘሁ
ድንግል በምልጃሽ ተፈውሻለሁ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ',
      lyrics_transliteration = 'CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 1
Wegen zemed yalkuthulu eraqegn
Hezen ts’lmet chgr gezfo tayegn
Birab migbe honeshlgn aychalehu
Selam bat’am banchi ets’nanalehu

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 2
Fiqrn weldesh selamn agegnew
Dingil bemljash tefewshalehu
Yeselam minch’ yenets’anet arma
Kibir yemtsech’ moges talaq girma

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 3
Anchin tesfa adrge wet’chalehu
Qen ena let nii elshalehu
Lanchi linberkek ayzal gulbete
Widasesh yibza keandebete

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 4
Sulamat’is silsh erekalehu
Behywete selam agchalehu
Endesew lij qen eyayesh yematrqi
YeAmanuel enat zarem barkign

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 5
Tebarkiyalehu Dingil beljsh
Yiኸw qomiyalehu lamesegnsh
Wegen zemed yalkut hulu raqegn
Hezen ts’lmet chgr gezfo tayegn

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 6
Birab migbe honeshlgn aychalehu
Selam bat’am banchi enanalehu
Fiqrn weldesh selamn agegnehu
Dingil bemljash tefewshalehu

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selame-nesh-dengle'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 1
ወገን ዘመድ ያልኩትሁሉ እራቀኝ
ሀዘን ፅልመት ችግር ገዝፎ ታየኝ
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እፅናናለሁ

VERSE 2
ፍቅርን ወልደሽ ሰላምን አገኘው
ድንግል በምልጃሽ ተፈውሻለሁ
የሰላም ምንጭ የነፃነት አርማ
ክብር የምትሰጭ ሞገስ ታላቅ ግርማ

VERSE 3
አንቺን ተስፋ አድርጌ ወጥቻለሁ
ቀን እና ሌት ንኢ እልሻለሁ
ላንቺ ልንበርከክ አይዛል ጉልበቴ
ውዳሴሽ ይብዛ ከአንደበቴ

VERSE 4
ሱላማጢስ ስልሽ እረካለሁ
በህይወቴ ሰላም አግቻለሁ
እንደሰው ልጅ ቀን እያየሽ የማትርቂ
የአማኑኤል እናት ዛሬም ባርኪኝ

VERSE 5
ተባርኪያለሁ ድንግል በልጅሽ
ይኸው ቆሚያለሁ ላመሰግንሽ
ወገን ዘመድ ያልኩት ሁሉ ራቀኝ
ሀዘን ጽልመት ችግር ገዝፎ ታየኝ

VERSE 6
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እናናለሁ
ፍቅርን ወልደሽ ሰላምን አገኘሁ
ድንግል በምልጃሽ ተፈውሻለሁ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 1
Wegen zemed yalkuthulu eraqegn
Hezen ts’lmet chgr gezfo tayegn
Birab migbe honeshlgn aychalehu
Selam bat’am banchi ets’nanalehu

VERSE 2
Fiqrn weldesh selamn agegnew
Dingil bemljash tefewshalehu
Yeselam minch’ yenets’anet arma
Kibir yemtsech’ moges talaq girma

VERSE 3
Anchin tesfa adrge wet’chalehu
Qen ena let nii elshalehu
Lanchi linberkek ayzal gulbete
Widasesh yibza keandebete

VERSE 4
Sulamat’is silsh erekalehu
Behywete selam agchalehu
Endesew lij qen eyayesh yematrqi
YeAmanuel enat zarem barkign

VERSE 5
Tebarkiyalehu Dingil beljsh
Yiኸw qomiyalehu lamesegnsh
Wegen zemed yalkut hulu raqegn
Hezen ts’lmet chgr gezfo tayegn

VERSE 6
Birab migbe honeshlgn aychalehu
Selam bat’am banchi enanalehu
Fiqrn weldesh selamn agegnehu
Dingil bemljash tefewshalehu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selame-nesh-dengle', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Selamish Zare New (selamish-zare-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰላምሽ ዛሬ ነው ኢየሩሳሌም
ወዳንች መጥቷልና አምላክ ዘለዓለም /2/

VERSE 1
ሆሳዕና በአርያም እያሉ ዘመሩ
ሕፃናት በኢየሩሳሌም

CHORUS
ሰላምሽ ዛሬ ነው ኢየሩሳሌም
ወዳንች መጥቷልና አምላክ ዘለዓለም /2/

VERSE 2
አንቺ ቤተልሔም የዳዊት ከተማ
የሕዝቦችሽ ብርሃን መጣልሽ በግርማ /2/

CHORUS
ሰላምሽ ዛሬ ነው ኢየሩሳሌም
ወዳንች መጥቷልና አምላክ ዘለዓለም /2/

VERSE 3
ሆሳዕና እያሉ አመሰገኑት
በኢየሩሳሌም አእሩግ ህፃናት /2/

CHORUS
ሰላምሽ ዛሬ ነው ኢየሩሳሌም
ወዳንች መጥቷልና አምላክ ዘለዓለም /2/

VERSE 4
ኪሩቤል መንበሩን የሚሸከሙለት
መስቀል ተሸከመ ሊሆነን መድኃኒት /2/

CHORUS
ሰላምሽ ዛሬ ነው ኢየሩሳሌም
ወዳንች መጥቷልና አምላክ ዘለዓለም /2/

VERSE 5
የኢየሱስን ሕማም ደናግልም አይተው
እያለቀሱለት ሄዱ ተከትለው /2/

CHORUS
ሰላምሽ ዛሬ ነው ኢየሩሳሌም
ወዳንች መጥቷልና አምላክ ዘለዓለም /2/',
      lyrics_transliteration = 'CHORUS
selamish zare new eyerusalem
wedaniche metitwalina āmlak zelealem /2/

VERSE 1
hosana beāriyam eyalu zemeru
hit͟sanat beeyerusalem

CHORUS
selamish zare new eyerusalem
wedaniche metitwalina āmlak zelealem /2/

VERSE 2
ānichi bēteliḥēm yedawīt ketema
yeḥizibochish birihan metalish begirima /2/

CHORUS
selamish zare new eyerusalem
wedaniche metitwalina āmlak zelealem /2/

VERSE 3
hosana eyalu āmesegenut
beyerusalēm ārugi hit͟sanat /2/

CHORUS
selamish zare new eyerusalem
wedaniche metitwalina āmlak zelealem /2/

VERSE 4
kīrubēl meniberun yemīshekemulet
meskel teshekeme līhonen mediḫanīt /2/

CHORUS
selamish zare new eyerusalem
wedaniche metitwalina āmlak zelealem /2/

VERSE 5
ye’eyesusin ḥimam denagilim ayitew
eyalekesulet hēdu teketilew /2/

CHORUS
selamish zare new eyerusalem
wedaniche metitwalina āmlak zelealem /2/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'selamish-zare-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰላምሽ ዛሬ ነው ኢየሩሳሌም
ወዳንች መጥቷልና አምላክ ዘለዓለም /2/

VERSE 1
ሆሳዕና በአርያም እያሉ ዘመሩ
ሕፃናት በኢየሩሳሌም

VERSE 2
አንቺ ቤተልሔም የዳዊት ከተማ
የሕዝቦችሽ ብርሃን መጣልሽ በግርማ /2/

VERSE 3
ሆሳዕና እያሉ አመሰገኑት
በኢየሩሳሌም አእሩግ ህፃናት /2/

VERSE 4
ኪሩቤል መንበሩን የሚሸከሙለት
መስቀል ተሸከመ ሊሆነን መድኃኒት /2/

VERSE 5
የኢየሱስን ሕማም ደናግልም አይተው
እያለቀሱለት ሄዱ ተከትለው /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'selamish zare new eyerusalem
wedaniche metitwalina āmlak zelealem /2/

VERSE 1
hosana beāriyam eyalu zemeru
hit͟sanat beeyerusalem

VERSE 2
ānichi bēteliḥēm yedawīt ketema
yeḥizibochish birihan metalish begirima /2/

VERSE 3
hosana eyalu āmesegenut
beyerusalēm ārugi hit͟sanat /2/

VERSE 4
kīrubēl meniberun yemīshekemulet
meskel teshekeme līhonen mediḫanīt /2/

VERSE 5
ye’eyesusin ḥimam denagilim ayitew
eyalekesulet hēdu teketilew /2/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'selamish-zare-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Semeshen litraw D Zelalem Takele Zegola (semeshen-litraw-d-zelalem-takele-zegola)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 1
የምሔድበት የማደርገው ሲቸግረኝ
አልጠራጠር የልቤ ነሽ እረፍቱ
አንቺ ከጎኔ እስከ አለሽ አዛኝቱ
ምልጃሽ ፈጥኖ ይደርሳል

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 2
ሥምሽ ጭንቀት ያስረሳል
ልጥራው ስምሸን ልጥራው
መጽናኛ አርጎ ነው የሠራው
እንኳን አልቅሼ ለምኜሽ ፊትሽ ቁሜ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 3
ቃልን አውጥቼ በስምሽ ተማጽኜ
የውስጤን ጉዳት ታውቄያለሽ የኔ ጥላ
አንቺ ይዤ አላፍርም የነፍሴን ነሽ ከለላ
ምልጃሽ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 4
መረጋጋትን በስምሽ አገኛለሁ
በምልጃሽ ድንግል ያንን ቀን አልፌያለሁ
ጉደለቴን ሸፋኝ ምስጥሬን አልተውሽም
መሸሸጊያን ይዣለሁ አለቅሽም

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 5
ምልጃሽ
የማትረሽኝ ማትሰለች እኔን መርዳት
ማንም ያላየው ምታይው የኔን ጉዳት
ቃላት ማይገለጹት ነገርሽ የጣፈጠ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 6
ምስጋና ለእርሱ አንቺን ለእኛ ለሰጠ
ምልጃሽ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ',
      lyrics_transliteration = 'CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 1
Yemhedbet yemadergew sichegregn
Alt’erat’er yelbe nesh ereftu
Anchi kegone eske alesh azagntu
Miljash fet’no yidersal

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 2
Simsh ch’nqet yasresal
Lit’raw simshen lit’raw
Mets’nagna argo new yeseraw
Enkwan alqshe lemgnesh fitsh qume

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 3
Qaln awt’che besmsh temats’gne
Yewst’en gudat tawqeyalesh yene t’la
Anchi yizhe alafrm yenefsen nesh kelela
Miljash

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 4
Meregagatn besmsh agegnalehu
Bemljash Dingil yann qen alfeyalehu
Gudeleten shefagn mist’ren altewshm
Mesheshegiyan yizhalehu aleqshm

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 5
Miljash
Yematreshgn matselech enen merdat
Manm yalayew mitayw yenen gudat
Qalat maygelets’ut negersh yet’afet’e

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 6
Misgana leersu anchin leegna leset’e
Miljash

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'semeshen-litraw-d-zelalem-takele-zegola'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 1
የምሔድበት የማደርገው ሲቸግረኝ
አልጠራጠር የልቤ ነሽ እረፍቱ
አንቺ ከጎኔ እስከ አለሽ አዛኝቱ
ምልጃሽ ፈጥኖ ይደርሳል

VERSE 2
ሥምሽ ጭንቀት ያስረሳል
ልጥራው ስምሸን ልጥራው
መጽናኛ አርጎ ነው የሠራው
እንኳን አልቅሼ ለምኜሽ ፊትሽ ቁሜ

VERSE 3
ቃልን አውጥቼ በስምሽ ተማጽኜ
የውስጤን ጉዳት ታውቄያለሽ የኔ ጥላ
አንቺ ይዤ አላፍርም የነፍሴን ነሽ ከለላ
ምልጃሽ

VERSE 4
መረጋጋትን በስምሽ አገኛለሁ
በምልጃሽ ድንግል ያንን ቀን አልፌያለሁ
ጉደለቴን ሸፋኝ ምስጥሬን አልተውሽም
መሸሸጊያን ይዣለሁ አለቅሽም

VERSE 5
ምልጃሽ
የማትረሽኝ ማትሰለች እኔን መርዳት
ማንም ያላየው ምታይው የኔን ጉዳት
ቃላት ማይገለጹት ነገርሽ የጣፈጠ

VERSE 6
ምስጋና ለእርሱ አንቺን ለእኛ ለሰጠ
ምልጃሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 1
Yemhedbet yemadergew sichegregn
Alt’erat’er yelbe nesh ereftu
Anchi kegone eske alesh azagntu
Miljash fet’no yidersal

VERSE 2
Simsh ch’nqet yasresal
Lit’raw simshen lit’raw
Mets’nagna argo new yeseraw
Enkwan alqshe lemgnesh fitsh qume

VERSE 3
Qaln awt’che besmsh temats’gne
Yewst’en gudat tawqeyalesh yene t’la
Anchi yizhe alafrm yenefsen nesh kelela
Miljash

VERSE 4
Meregagatn besmsh agegnalehu
Bemljash Dingil yann qen alfeyalehu
Gudeleten shefagn mist’ren altewshm
Mesheshegiyan yizhalehu aleqshm

VERSE 5
Miljash
Yematreshgn matselech enen merdat
Manm yalayew mitayw yenen gudat
Qalat maygelets’ut negersh yet’afet’e

VERSE 6
Misgana leersu anchin leegna leset’e
Miljash'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'semeshen-litraw-d-zelalem-takele-zegola', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Senbetna eka Eyesus /eritrean Orthodox Tewahdo Mezmur / zemarit Hermela yhsho (senbetna-eka-eyesus-eritrean-orthodox-tewahdo-mezmur-zemarit-hermela-yhs)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'senbetna-eka-eyesus-eritrean-orthodox-tewahdo-mezmur-zemarit-hermela-yhs'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ትብዓትና ኢኻ ኢየሱስ ትንምክሓሉ
ሰንበትና ኢኻ ንስኻስ እቲ ዘዕረፍናሉ (2)
ኣቦነትካ''ስ ርኢናዮ ሓበላ ዓልንና ክሽፍን
ነቲ ጉሉጽ ዕሽነትና ከምዘይርኣየ ክኽውል

VERSE 1
ትዕግስትኻ''ስ ዘገርምዩ ብፍቅሪ ልቢ ዝስዕር
ዕድለኛታት ኢና ንሕና ናትካ ሙኻናስ ንሕበን
ቃላት ንስእነሉ ንለውሃትካ
ነጊርና ኣይንጸግቦን ንምሕረትካ

VERSE 2
ንሱ እንድዩ ምስጢር ህላውነትና
ኩሉ ግዜ ተስፋ ዝኾነና
ኣዝ. . .
ቅዱስ ደምካ ተሓቲምና ካብ ጸጋኻ ተኻፊልና

VERSE 3
ርህራሄኻ በዚሑልና ብፍቅርኻ ኢና ዓሪፍና
ምሕረትካ እንዲዩ ዝረድኣና ክሳብ ኣብዚ ዘብጸሓና
ብጀካኻ መን እሞ ኣሎና ኢየሱስ ዝጥንቀቐልና
ስለዚ ኢና ንሕና ነፍቅረካ

VERSE 4
ክበር እናበልና ነምልኸካ
ፍቅርኻ ኣብ ልብና ነጊሱ
ውሽጥና በኣኻ ተፈዊሱ
ኣዝ. . .

VERSE 5
ዝተረፈ ዘመን ሂወትና ኩሉ ንስኻ ኽትሓልፎ
ኣታ ኩሉ ትኽእል ኢድካ ንነገራትና ንገፎ
ደጊም ንስጋ ከይንነብር ንስኻ ኣባና ክትከብር
ካብ ልብና ወሲና ኢና ከምቲ ትደልዮ ክነብር

VERSE 6
ንዓኻ ኣሚኑ ዝተሰለፈ
የለን ኣብ መንገዲ ዝተረፈ
ንዑ ከዕርፈኩም ስለ ዝበልካ
ከም ቃልካ እንሆ ሲዒብናካ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tibatna iኻ Iyesus tinmkhalu
Senbetna iኻ nisኻs eti zeerefnalu (2)
Abonetka''s riinayo habela alnna kishfn
Neti guluts’ eshnetna kemzeyraye kiኽwl

VERSE 1
Tiegstኻ''s zegermyu bifqri libi ziser
Edlegnatat ina nihna natka muኻnas nihben
Qalat nisenelu nilewhatka
Negirna aynts’egbon nimhretka

VERSE 2
Nisu endyu mist’ir hilawnetna
Kulu gize tesfa ziኾnena
Az. . .
Kidus demka tehatimna kab ts’egaኻ teኻfilna

VERSE 3
Rihraheኻ bezihulna bifqrኻ ina arifna
Mihretka endiyu ziredana kisab abzi zebts’ehana
Bijekaኻ men emo alona Iyesus zit’nqeቐlna
Silezi ina nihna nefqreka

VERSE 4
Kiber enabelna nemlኸka
Fiqrኻ ab libna negisu
Wisht’na beaኻ tefewisu
Az. . .

VERSE 5
Ziterefe zemen hiwetna kulu nisኻ ኽthalfo
Ata kulu tiኽel idka ninegeratna nigefo
Degim nisga keynnebr nisኻ abana kitkebr
Kab libna wesina ina kemti tidelyo kinebr

VERSE 6
Niaኻ aminu ziteselefe
Yelen ab mengedi ziterefe
Niu keerfekum sile zibelka
Kem qalka enho siibnaka'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'senbetna-eka-eyesus-eritrean-orthodox-tewahdo-mezmur-zemarit-hermela-yhs', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Serae Lene (serae-lene-senbet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ

VERSE 1
ሠራልን ሰንበትን ለዕረፍታችን
ሠራልን ሰንበትን ለዕረፍታችን

CHORUS
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ',
      lyrics_transliteration = 'CHORUS
Serae lene senbete le''erefte ziane
Serae lene senbete le''erefte ziane

VERSE 1
Seralin senbeten le''ereftachin
Seralin senbeten le''ereftachin

CHORUS
Serae lene senbete le''erefte ziane
Serae lene senbete le''erefte ziane',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'serae-lene-senbet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ

VERSE 1
ሠራልን ሰንበትን ለዕረፍታችን
ሠራልን ሰንበትን ለዕረፍታችን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Serae lene senbete le''erefte ziane
Serae lene senbete le''erefte ziane

VERSE 1
Seralin senbeten le''ereftachin
Seralin senbeten le''ereftachin'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'serae-lene-senbet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Seregelawochih Yeesat Nachew (seregelawochih-yeesat-nachew)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'seregelawochih-yeesat-nachew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 1
ሳመልክህ እኖራለሁ ጠዋት ማታ ×3
በእሳት ሰረገላ ታጥሯል መንደራችን
ግያዝ ሆይ አትፍራ አለ ፈጣሪያችን
የጠላትን ምሽግ በቃሉ ይቆርጣል

VERSE 2
ከእኛ ጋራ ያለው ከነርሱ ይበልጣል
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው

VERSE 3
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2
ከቴማን ተራራ ከፋራን ሲወርድ
ጠላት ይጨነቃል ከድምፁ በሞገድ

VERSE 4
ጦረኛ አያበዛም ሞአብን ሲመታ
በአህያ መንጋጋ ሺውን ጥሏል ጌታ
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው

VERSE 5
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2
የጥልቁን መሰረት በንፋስ አስሮታል

VERSE 6
ከሰማያት በላይ ዙፋኑን ዘርግቷል
ዘንባባ ይዛችሁ ግቡ ከመቅደሱ
በመስጋናው ስርአት እንድትቀደሱ
ሰረገላዎችህ የሳት ናቸው

VERSE 7
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2

VERSE 8
ወደረኞቻችን ከቁጥር ቢበዙም
እንደ ቃየል ልጆች ሾትል አንመዝም
እንጀራም መግበን እንሰዳቸዋለን
በቀልና ፍርድን ለአምላካችን ትተን

VERSE 9
ሰረገላዎችህ የሳት ናቸው
የሌጊዎን ጭፍሮች ማይችሏቸው
የገሀነም ደጆች ማይችሏቸው
አንተ ብቻ ቅዱስ ሀያል ጌታ

VERSE 10
ሳመልክህ እኖራለሁ ጠዋት ማታ ×2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 1
Samelkh enoralehu t’ewat mata ×3
Beesat seregela tat’rwal menderachn
Giyaz hoy atfra ale fet’ariyachn
Yet’elatn mishg beqalu yiqort’al

VERSE 2
Keegna gara yalew kenersu yibelt’al
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew

VERSE 3
Ante bicha Kidus heyal Geta
Samelkh enoralehu t’ewat mata ×2
Keteman terara kefaran siwerd
T’elat yich’eneqal kedmts’u bemoged

VERSE 4
T’oregna ayabezam moabn simeta
Beahya mengaga shiwn t’lwal Geta
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew

VERSE 5
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta
Samelkh enoralehu t’ewat mata ×2
Yet’lqun meseret benfas asrotal

VERSE 6
Kesemayat belay zufanun zergtwal
Zenbaba yizachhu gibu kemeqdesu
Bemesganaw sirat endtqedesu
Seregelawochh yesat nachew

VERSE 7
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta
Samelkh enoralehu t’ewat mata ×2

VERSE 8
Wederegnochachn kequt’r bibezum
Ende qayel lijoch shotl anmezm
Enjeram megben ensedachewalen
Beqelna firdn leamlakachn titen

VERSE 9
Seregelawochh yesat nachew
Yelegiwon ch’froch maychlwachew
Yegehenem dejoch maychlwachew
Ante bicha Kidus heyal Geta

VERSE 10
Samelkh enoralehu t’ewat mata ×2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'seregelawochih-yeesat-nachew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sew Atiresam Keto Atitilim Medihaniyalem (sew-atiresam-keto-atitilim-medihaniyalem)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰው አትረሳም ከቶ አትጥልም መድሃኒያለም(2)
ታምኛለሁ ባንተ ለዘላለም
አስታዋሽ እረኛ ፈጥረህ የማትረሳ
ምስኪኑን ከጉድፍ ከአፈር ምታነሳ

VERSE 1
ሰው የለንም ላሉ ሰው ሆነህ የታየህ
እግዚአብሔር በእውነት ድንቅ ነህ
ሁሉም አለህና ባለጸጋው ጌታ
ማን ያፍራል ለምኖህ በጎውን ስጦታ

CHORUS
ሰው አትረሳም ከቶ አትጥልም መድሃኒያለም(2)
ታምኛለሁ ባንተ ለዘላለም
አስታዋሽ እረኛ ፈጥረህ የማትረሳ
ምስኪኑን ከጉድፍ ከአፈር ምታነሳ

VERSE 2
በስምህ ያመኑትን ታድናቸዋለህ
ለፀኑት ሁልጊዜ መልስ አለህ
እህት ወንድም ላጡ ደጋፊ አለኝታቸው
ወላጅ ለማያቁ አባት መፅናኛቸው

CHORUS
ሰው አትረሳም ከቶ አትጥልም መድሃኒያለም(2)
ታምኛለሁ ባንተ ለዘላለም
አስታዋሽ እረኛ ፈጥረህ የማትረሳ
ምስኪኑን ከጉድፍ ከአፈር ምታነሳ

VERSE 3
የተዘነጉትን የማትዘነጋ
አንተ ነህ አልፋና ኦሜጋ

CHORUS
ሰው አትረሳም ከቶ አትጥልም መድሃኒያለም(2)
ታምኛለሁ ባንተ ለዘላለም
አስታዋሽ እረኛ ፈጥረህ የማትረሳ
ምስኪኑን ከጉድፍ ከአፈር ምታነሳ',
      lyrics_transliteration = 'CHORUS
Sew atresam keto att’lm medhaniyalem (2)
Tamgnalehu bante lezelalem
Astawash eregna fet’reh yematresa
Miskinun kegudf keafer mitanesa

VERSE 1
Sew yelenm lalu sew honeh yetayeh
Egziabher beewnet dinq neh
Hulum alehna balets’egaw Geta
Man yafral lemnoh begown sit’ota

CHORUS
Sew atresam keto att’lm medhaniyalem (2)
Tamgnalehu bante lezelalem
Astawash eregna fet’reh yematresa
Miskinun kegudf keafer mitanesa

VERSE 2
Besmh yamenutn tadnachewaleh
Lets’enut hulgize mels aleh
Eht wendm lat’u degafi alegntachew
Welaj lemayaqu abat mets’nagnachew

CHORUS
Sew atresam keto att’lm medhaniyalem (2)
Tamgnalehu bante lezelalem
Astawash eregna fet’reh yematresa
Miskinun kegudf keafer mitanesa

VERSE 3
Yetezenegutn yematzenega
Ante neh alfana omega

CHORUS
Sew atresam keto att’lm medhaniyalem (2)
Tamgnalehu bante lezelalem
Astawash eregna fet’reh yematresa
Miskinun kegudf keafer mitanesa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sew-atiresam-keto-atitilim-medihaniyalem'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰው አትረሳም ከቶ አትጥልም መድሃኒያለም(2)
ታምኛለሁ ባንተ ለዘላለም
አስታዋሽ እረኛ ፈጥረህ የማትረሳ
ምስኪኑን ከጉድፍ ከአፈር ምታነሳ

VERSE 1
ሰው የለንም ላሉ ሰው ሆነህ የታየህ
እግዚአብሔር በእውነት ድንቅ ነህ
ሁሉም አለህና ባለጸጋው ጌታ
ማን ያፍራል ለምኖህ በጎውን ስጦታ

VERSE 2
በስምህ ያመኑትን ታድናቸዋለህ
ለፀኑት ሁልጊዜ መልስ አለህ
እህት ወንድም ላጡ ደጋፊ አለኝታቸው
ወላጅ ለማያቁ አባት መፅናኛቸው

VERSE 3
የተዘነጉትን የማትዘነጋ
አንተ ነህ አልፋና ኦሜጋ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sew atresam keto att’lm medhaniyalem (2)
Tamgnalehu bante lezelalem
Astawash eregna fet’reh yematresa
Miskinun kegudf keafer mitanesa

VERSE 1
Sew yelenm lalu sew honeh yetayeh
Egziabher beewnet dinq neh
Hulum alehna balets’egaw Geta
Man yafral lemnoh begown sit’ota

VERSE 2
Besmh yamenutn tadnachewaleh
Lets’enut hulgize mels aleh
Eht wendm lat’u degafi alegntachew
Welaj lemayaqu abat mets’nagnachew

VERSE 3
Yetezenegutn yematzenega
Ante neh alfana omega'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sew-atiresam-keto-atitilim-medihaniyalem', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sew Le Sew (sew-le-sew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰው ለሰው /2/ ቢፋቀር ምነው /2/

VERSE 1
ለሰው ይመስለዋል ብዙ የሚቆይ
ግን በድንገት ያልፋል ሁሉንም /2/ ሳያይ
ሀብትን ያከማቻል ቀኑን ሳያውቀው
በድንገት ሲጠራ /2/ ላይከተለው

CHORUS
ሰው ለሰው /2/ ቢፋቀር ምነው /2/

VERSE 2
የሰው ልጅ በተራው መጠራቱ ላይቀር
ምነው አንዱ ለአንዱ መቃብር /2/ ባይቆፍር
አይጠቅምም መጨነቅ እንዲያው ለውበት
ይረግፋል ይጠፋል ሁሉም /2/ ከመሬት

CHORUS
ሰው ለሰው /2/ ቢፋቀር ምነው /2/

VERSE 3
ዋ! ቁንጅና ከንቱ ማማርም ብላሽ
አፈር ትቢያ ሲሆን ሲጨልም /2/ ሲመሽ
ደሀ ባለጸጋ አንድ ነው መንገዱ
በጨርቅ ተገንዞ በሳጥን /2/ መሄዱ

CHORUS
ሰው ለሰው /2/ ቢፋቀር ምነው /2/

VERSE 4
ሰው ዙሪያውን ቢያጥር መዝጊያውን ቢሠራ
በሕንፃ ላይ ሕንፃ ቢያስመስል ተራራ
አይቀርም መሄዱ ሁሉም /2/ በየተራ

CHORUS
ሰው ለሰው /2/ ቢፋቀር ምነው /2/',
      lyrics_transliteration = 'CHORUS
Sew lewsew /2/ Bifeker Minew /2/

VERSE 1
Lesew Yemeslewal Bizu Yemikoy
Gin Bedinget Yalfal Hulunem/2/ Sayay
Habten Yakemachal Kenun Sayawekew
Bedinget Sitera/2/ Layeketelew

CHORUS
Sew lewsew /2/ Bifeker Minew /2/

VERSE 2
Yesew Lij Beteraw Meteratu Layker
Minew Andu Leandu Mekabir/2/ Baykofer
Aytekimem Mechenek Endiaw Lewebet
Yiregfal Yitefal Hulum/2/ Kemeret

CHORUS
Sew lewsew /2/ Bifeker Minew /2/

VERSE 3
Wa! Kuinjena Kenetu Mamarem Belash
Afer Tebia Sihon Sichelem/2/ Simesh
Deha Baletsega Ande new mengedu
Becherk Tegenezo Besaten/2/ Mehedu

CHORUS
Sew lewsew /2/ Bifeker Minew /2/

VERSE 4
Sew Zuriawen Biater Mezgiawen Bisera
Behintsa lay Hintsa Biasmesel Terara
Aykerim Mehedu Hulum/2/ Beyetera

CHORUS
Sew lewsew /2/ Bifeker Minew /2/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sew-le-sew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰው ለሰው /2/ ቢፋቀር ምነው /2/

VERSE 1
ለሰው ይመስለዋል ብዙ የሚቆይ
ግን በድንገት ያልፋል ሁሉንም /2/ ሳያይ
ሀብትን ያከማቻል ቀኑን ሳያውቀው
በድንገት ሲጠራ /2/ ላይከተለው

VERSE 2
የሰው ልጅ በተራው መጠራቱ ላይቀር
ምነው አንዱ ለአንዱ መቃብር /2/ ባይቆፍር
አይጠቅምም መጨነቅ እንዲያው ለውበት
ይረግፋል ይጠፋል ሁሉም /2/ ከመሬት

VERSE 3
ዋ! ቁንጅና ከንቱ ማማርም ብላሽ
አፈር ትቢያ ሲሆን ሲጨልም /2/ ሲመሽ
ደሀ ባለጸጋ አንድ ነው መንገዱ
በጨርቅ ተገንዞ በሳጥን /2/ መሄዱ

VERSE 4
ሰው ዙሪያውን ቢያጥር መዝጊያውን ቢሠራ
በሕንፃ ላይ ሕንፃ ቢያስመስል ተራራ
አይቀርም መሄዱ ሁሉም /2/ በየተራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sew lewsew /2/ Bifeker Minew /2/

VERSE 1
Lesew Yemeslewal Bizu Yemikoy
Gin Bedinget Yalfal Hulunem/2/ Sayay
Habten Yakemachal Kenun Sayawekew
Bedinget Sitera/2/ Layeketelew

VERSE 2
Yesew Lij Beteraw Meteratu Layker
Minew Andu Leandu Mekabir/2/ Baykofer
Aytekimem Mechenek Endiaw Lewebet
Yiregfal Yitefal Hulum/2/ Kemeret

VERSE 3
Wa! Kuinjena Kenetu Mamarem Belash
Afer Tebia Sihon Sichelem/2/ Simesh
Deha Baletsega Ande new mengedu
Becherk Tegenezo Besaten/2/ Mehedu

VERSE 4
Sew Zuriawen Biater Mezgiawen Bisera
Behintsa lay Hintsa Biasmesel Terara
Aykerim Mehedu Hulum/2/ Beyetera'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sew-le-sew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sewoch Des Yibelen (sewoch-des-yibelen)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sewoch-des-yibelen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 1
አዝ….
በኃጢአት በሽታ ወድቄ ሳለሁኝ
መድሃኒት ክርስቶስ ከውድቀቴ አነሳኝ
ስጦታው ብዙ ነው ለኔ የሰጠኝ

VERSE 2
ተመስገን ብቻ ነው አምላክ ላንተ ያለኝ
አዝ….
እንደ በርጤምዮስ እውር የነበርኩኝ
ዛሬ ግን በአምላኬ ድህነት አገኘሁኝ

VERSE 3
ህጉም ለመንገዴ ብርሐን ሆኖኛል
የእርሱ ስለሆንኩኝ ሠላምን ሰጥቶኛል
አዝ….
በድንቅ አጠራርህ በፍቅር የጠራኽኝ

VERSE 4
ከአጋንንት እሥራት ነፃ ያወጣኽኝ
አልፋና ኦሜጋ ዘላለም የምትኖር
ኤልሻዳይ የሆንከው አማኑኤል ተመስገን
አዝ….

VERSE 5
የዕዳ ደብዳቤዬን ጌታዬ ቀደደው
የማዳኑን ሥራ በአይኔ አይቻለው
ቸርነቱ አያልቅም ድንቅ የሆነ ጌታ
ስሙን እናመስግን እንዘምር በእልልታ

VERSE 6
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 1
ez….
behatiet beshta wedqe salehuny
medhanit krstos kewdqete enesany
stotaw bzu new lene yeseteny

VERSE 2
temesgen bcha new emlak lante yaleny
ez….
nde bertemyos wr yeneberkuny
zare gn beemlake dhnet egenyehuny

VERSE 3
hgum lemengede brhen hononyal
yersu slehonkuny selamn settonyal
ez….
bednq eterarh befqr yeterahny

VERSE 4
keegannt srat netsa yawetahny
elfana omega zelalem yemtnor
elshaday yehonkew emanuel temesgen
ez….

VERSE 5
yeda debdabeyen getaye qededew
yemadanun sra beeyne eychalew
chernetu eyalqm dnq yehone geta
smun namesgn nzemr bellta

VERSE 6
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sewoch-des-yibelen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sewoch Feredubign (sewoch-feredubign)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sewoch-feredubign'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 1
ሌላ ምን ቃል አለኝ
ሊያልፉኝ አልወደዱም ነቄን ሊሰውሩ
ሰዎች ፈጠኑብኝ በደሌን ሊያወሩ
አንተ ግን ሰብስበህ በፍቅር ሸፈንከኝ

VERSE 2
በመተላለፌ አዝነህ ሳትለየኝ
ይህ ፍቅርህ ሰበረኝ አጣበቀኝ ካንተ
ደጅህ ያመጣኛል ሁሌ እየጎተተ (2)

VERSE 3
መርከሴን አውጀው ሲያነሱብኝ ድንጋይ
ሰወረኝ ተዓምርህ ልጅ ሳልሰቃይ
ወደህ ስለማርከኝ ብዙዎች ተከዙ
ይህ አይደለም ብለው የኃጢአት ደሞዙ

VERSE 4
ካንተ በላይ ጌታ ማን ሊያውቀኝ ይችላል
የፍቅርህን ሚዛን ማንስ ያዛባዋል (2)

VERSE 5
ማዳንህ ይደንቃል ለወደኩት ልጅህ
ምህረትህ ይደፋል ሁሌም በሚዛንህ
እንደሰው አይታይ ፍርድህም ይለያል
ለባርያህ አርነት በምህረት ፈርደሃል

VERSE 6
ፍቅር እየዘረዘርክ መንገዴን የጠረክ
ስለልጅህ ጽድቅን ለድነት የፈረድክ (2)

VERSE 7
እኔ አልፈርድብህም በሰላም ሂድ አልከኝ
ዳግም እንዳልበድል በፍቅር እያየኸኝ
ወደ ጽድቅህ ህጎች ነፍሴን አፈዛለሁ
እንዲህ ከወደድከኝ ወዴት እሄዳለሁ

VERSE 8
አልለይም ካንተ ከፍቅር መድረኬ
አመልካለሁ አንተን ፊትህ ተንበርክኬ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 1
Lela min qal alegn
Liyalfugn alwededum neqen lisewru
Sewoch fet’enubgn bedelen liyaweru
Ante gin sebsbeh befqr shefenkegn

VERSE 2
Bemetelalefe azneh satleyegn
Yih fiqrh seberegn at’abeqegn kante
Dejh yamet’agnal hule eyegotete (2)

VERSE 3
Merkesen awjew siyanesubgn dingay
Seweregn teamrh lij salseqay
Wedeh silemarkegn bizuwoch tekezu
Yih aydelem bilew yehat’iat demozu

VERSE 4
Kante belay Geta man liyawqegn yichlal
Yefqrhn mizan mans yazabawal (2)

VERSE 5
Madanh yidenqal lewedekut lijh
Mihreth yidefal hulem bemizanh
Endesew aytay firdhm yileyal
Lebaryah arnet bemhret ferdehal

VERSE 6
Fiqr eyezerezerk mengeden yet’erek
Sileljh ts’dqn lednet yeferedk (2)

VERSE 7
Ene alferdbhm beselam hid alkegn
Dagm endalbedl befqr eyayeኸgn
Wede ts’dqh higoch nefsen afezalehu
Endih kewededkegn wedet ehedalehu

VERSE 8
Alleym kante kefqr medreke
Amelkalehu anten fith tenberkke (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sewoch-feredubign', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: She Is Born For Us All (she-is-born-for-us-all)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ተወልዳለችና የጌታ እናት የኛ መድኃኒት

VERSE 1
እናመስግናት እናወድሳት እንውደዳት
እንውደዳት የአዳምን ሕይወት

CHORUS
ተወልዳለችና የጌታ እናት የኛ መድኃኒት',
      lyrics_transliteration = 'CHORUS
Teweldalechna yegita enat yegna medhanit
Enamesgenat enawedsat enwededat

VERSE 1
Enwededat yeAdamin hiwot

CHORUS
Teweldalechna yegita enat yegna medhanit
Enamesgenat enawedsat enwededat',
      lyrics_english = 'CHORUS
She is born for us all
The mother of God our Lord and Salvation

VERSE 1
We give her our praise and our admiration our veneration
For she’s the hope of Adam and his children

CHORUS
She is born for us all
The mother of God our Lord and Salvation',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'she-is-born-for-us-all'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ተወልዳለችና የጌታ እናት የኛ መድኃኒት

VERSE 1
እናመስግናት እናወድሳት እንውደዳት
እንውደዳት የአዳምን ሕይወት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Teweldalechna yegita enat yegna medhanit
Enamesgenat enawedsat enwededat

VERSE 1
Enwededat yeAdamin hiwot'
    AND lyrics_english IS NOT DISTINCT FROM 'She is born for us all
The mother of God our Lord and Salvation

VERSE 1
We give her our praise and our admiration our veneration
For she’s the hope of Adam and his children'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'she-is-born-for-us-all', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: #shefani_gudey_new_eritrean_orthodox_mezmur#shefani_gudey_by_zemari_Bereket_tikue 2021 (shefani-gudey-new-eritrean-orthodox-mezmur-shefani-gudey-by-zemari-berek)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 1
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
ካባይ ብዙሕ ሓጢኣት ካባኻ''ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 2
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
በደለይ ከም ከቢድ ጾር ኣዝዪ ይኸብደኒ ኣሎ
ኣዋርሕ ከንቱነተይ ሰላመይ እናመንጠሎ
ቀትሪ ኮይኑ ለይተይ ለይቲ ኮይኑ ቀትረይ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 3
ብሰሪ ሓጢኣተይ "ደኺመን ኣዕጽምተይ(2)"
ብምሕረትካ (2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ኣብቅዓኒ
ካባይ ብዙሕ ሓጢኣት

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 4
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህ
ከባቴ ኣበሳ ሸፋኒ ንጉደይ ኣማኑኤል

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 5
ካብ ቅድሜኻ ኣይክወልን ግሁድ እንድዪ ንዓኻ
ጎይታይ ንዕሽነተይ ትፈልጦ ኢኻ ንስኻ
ሓጢኣት በደለይ''ውን "ካባኻ ኣይተሓብአን(2)"
ቤትካ ክኸውን ቤተይ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 6
ሎሚ ባርያኻ ኣድሕን
ሎሚ ወድኻ ኣድሕን
ብምሕረትካ(2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ዕድመ ሃበኒ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 7
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 8
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ',
      lyrics_transliteration = 'CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 1
Kebate abesay shefani nigudey amanuel
Kabay bizuh hat’iat kabaኻ''win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhh

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 2
Kebate abesay shefani nigudey amanuel
Bedeley kem kebid ts’or azyi yiኸbdeni alo
Awarh kentunetey selamey enament’elo
Qetri koynu leytey leyti koynu qetrey

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 3
Biseri hat’iatey "deኺmen aets’mtey (2)"
Bimhretka (2) t’emteni
Kemzi ile keynebr ninsha abqani
Kabay bizuh hat’iat

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 4
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhh
Kebate abesa shefani nigudey amanuel

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 5
Kab qidmeኻ aykweln gihud endyi niaኻ
Goytay nieshnetey tifelt’o iኻ nisኻ
Hat’iat bedeley''win "kabaኻ aytehaban (2)"
Betka kiኸwn betey

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 6
Lomi baryaኻ adhn
Lomi wedኻ adhn
Bimhretka (2) t’emteni
Kemzi ile keynebr ninsha edme habeni

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 7
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 8
Kebate abesay shefani nigudey amanuel

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'shefani-gudey-new-eritrean-orthodox-mezmur-shefani-gudey-by-zemari-berek'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 1
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
ካባይ ብዙሕ ሓጢኣት ካባኻ''ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህ

VERSE 2
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
በደለይ ከም ከቢድ ጾር ኣዝዪ ይኸብደኒ ኣሎ
ኣዋርሕ ከንቱነተይ ሰላመይ እናመንጠሎ
ቀትሪ ኮይኑ ለይተይ ለይቲ ኮይኑ ቀትረይ

VERSE 3
ብሰሪ ሓጢኣተይ "ደኺመን ኣዕጽምተይ(2)"
ብምሕረትካ (2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ኣብቅዓኒ
ካባይ ብዙሕ ሓጢኣት

VERSE 4
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህ
ከባቴ ኣበሳ ሸፋኒ ንጉደይ ኣማኑኤል

VERSE 5
ካብ ቅድሜኻ ኣይክወልን ግሁድ እንድዪ ንዓኻ
ጎይታይ ንዕሽነተይ ትፈልጦ ኢኻ ንስኻ
ሓጢኣት በደለይ''ውን "ካባኻ ኣይተሓብአን(2)"
ቤትካ ክኸውን ቤተይ

VERSE 6
ሎሚ ባርያኻ ኣድሕን
ሎሚ ወድኻ ኣድሕን
ብምሕረትካ(2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ዕድመ ሃበኒ

VERSE 7
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 8
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 1
Kebate abesay shefani nigudey amanuel
Kabay bizuh hat’iat kabaኻ''win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhh

VERSE 2
Kebate abesay shefani nigudey amanuel
Bedeley kem kebid ts’or azyi yiኸbdeni alo
Awarh kentunetey selamey enament’elo
Qetri koynu leytey leyti koynu qetrey

VERSE 3
Biseri hat’iatey "deኺmen aets’mtey (2)"
Bimhretka (2) t’emteni
Kemzi ile keynebr ninsha abqani
Kabay bizuh hat’iat

VERSE 4
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhh
Kebate abesa shefani nigudey amanuel

VERSE 5
Kab qidmeኻ aykweln gihud endyi niaኻ
Goytay nieshnetey tifelt’o iኻ nisኻ
Hat’iat bedeley''win "kabaኻ aytehaban (2)"
Betka kiኸwn betey

VERSE 6
Lomi baryaኻ adhn
Lomi wedኻ adhn
Bimhretka (2) t’emteni
Kemzi ile keynebr ninsha edme habeni

VERSE 7
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 8
Kebate abesay shefani nigudey amanuel'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'shefani-gudey-new-eritrean-orthodox-mezmur-shefani-gudey-by-zemari-berek', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: SHISHG LBEL ZEMARIT TENAYE ASEFA (shishg-lbel-zemarit-tenaye-asefa)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'shishg-lbel-zemarit-tenaye-asefa'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 1
የምድር ባህሪዋ ሲለዋወጥ ሰማይ ሲነጋ ሲጨልም
ህይወቴም እንደዛው ነው ጥቂት ፈገግታ ደስታ የለኝም
መከራው ሰነበተ እንዲሁ ዘመን አስቆጠረ
እፎይ የምልበት ጀንበር ለምን ከኔ ዛሬ ተሰወረ

VERSE 2
ለኔም እንደ እኩዮቼ ይወግን ወጋገኑ
የመጎብኛዬ ወራት ይቸኩል ጊዜ ቀኑ
ይሁን እንደ ሰመመን ያለፈብኝ መከራ
አቁሚኝ ከለምለሙ ሰላም ካለው አዝመራ

VERSE 3
በልፋት ያባከንኩት መውደቅና መነሳቴ
ደም እንባ ያለቀስኩበት ንጋትና ምሽቴ
ይሁንና እንደህልም እንደገና ልነሳ
ትላንት ብዬ ላውራው ላላስብም ይረሳ

VERSE 4
አፅናኝኝ ኪዳነምህረት አፅናኝኝ ደጓ እመቤት
አፅናኝኝ ርህሪቷ አበርቺኝ አማላጂቷ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret

VERSE 1
Yemdr bahriwa silewawet’ semay sinega sich’elm
Hiywetem endezaw new t’qit fegegta desta yelegnm
Mekeraw senebete endihu zemen asqot’ere
Efoy yemlbet jenber lemn kene zare tesewere

VERSE 2
Lenem ende ekuyoche yiwegn wegagenu
Yemegobgnaye werat yichekul gize qenu
Yihun ende sememen yalefebgn mekera
Aqumign kelemlemu selam kalew azmera

VERSE 3
Belfat yabakenkut mewdeqna menesate
Dem enba yaleqeskubet nigatna mishte
Yihunna endehlm endegena linesa
Tilant biye lawraw lalasbm yiresa

VERSE 4
Ats’nagngn kidanemhret ats’nagngn degwa emebet
Ats’nagngn rihritwa aberchign amalajitwa'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'shishg-lbel-zemarit-tenaye-asefa', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sidiben Arikesh Newiren Shefenishiw (sidiben-arikesh-newiren-shefenishiw)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 1
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሐዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 2
እንደ ሃና ሆኜ ከቤተ መቅደስ
በመረረ ሐዘን ነው እኔ የማለቅስ
ፍረጅልኝና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 3
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ
አዝ
መከራው በዝቶ ግራ ገብቶኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 4
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 5
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጠራሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 6
ከመከራ ሁሉ ታወጪኛለሽ
አዝ
በምርኮ ሳለሁ በሰው ሀገር
ግፍ ጥለውብኝ ስኖር በእስር

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 7
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በተአምራትሽ እኔ ድኛለሁ
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 8
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኸው ባረከችኝ
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዝልኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 9
አዝ
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅ ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 10
ይሞላልና የጎደለው
ግራ የገባው የቸገረው
ድንግልን ይጥራት እንድትረዳው
ሳዝን ስተክዝ የምታጽናና

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 11
እናት አለችኝ ርኅርኂተ ልቦና
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ',
      lyrics_transliteration = 'CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 1
Newr alebgn bizu sidb
Anjet yemilt’ lib yemiyaqosl
Simen lewt’ew biyanqwashshugn
Behezen beleqso Dingil met’ahugn

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 2
Ende hana hogne kebete meqdes
Bemerere hezen new ene yemaleqs
Firejlgnna limeles kebete
Hezenen bedesta lewch’iw enate

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 3
Begram beqegnm t’elat bikebegn
Abzche ech’ohalew enate simign
CHORUS
Mekeraw bezto gira gebtognal

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 4
Dimts’shn lisma yaregagagnal
Yesew hiywetu birtu self new
Destana hezen yemayleyew
Beejachn wedqwal silugn t’elatoche

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 5
Amelet’kwachew simshn t’erche
Sew yezerawn yannu yach’dal
Beqoferew gudgwad rasu yigebal
Enate Emebete biye sit’erash

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 6
Kemekera hulu tawech’ignalesh
CHORUS
Bemrko salehu besew heger
Gif t’lewbgn sinor beesr

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 7
Miljash dersolgn tefetchalehu
Beteamratsh ene dignalehu
Qalshn semto ts’nsu segede
Bilalech elsabet’ newre tewegede

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 8
Yegetaye enat enen asebechgn
Tariken qeyra yiኸw barekechgn
Yeemebete kehonku man yiqawemegnal
Wejebum maebelum yitazezlgnal

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 9
CHORUS
Weynko alqwal yedokimas bet
Dingil amalj ney yeegna emebet
Simsh sit’era beyebotaw

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 10
Yimolalna yegodelew
Gira yegebaw yechegerew
Dingln yit’rat endtredaw
Sazn sitekz yemtats’nana

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 11
Enat alechgn rihrhite libona
Enate Emebete biye sit’erash
Kemekera hulu tawech’ignalesh

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sidiben-arikesh-newiren-shefenishiw'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 1
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሐዘን በለቅሶ ድንግል መጣሁኝ

VERSE 2
እንደ ሃና ሆኜ ከቤተ መቅደስ
በመረረ ሐዘን ነው እኔ የማለቅስ
ፍረጅልኝና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ

VERSE 3
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ
መከራው በዝቶ ግራ ገብቶኛል

VERSE 4
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ

VERSE 5
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጠራሽ

VERSE 6
ከመከራ ሁሉ ታወጪኛለሽ
በምርኮ ሳለሁ በሰው ሀገር
ግፍ ጥለውብኝ ስኖር በእስር

VERSE 7
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በተአምራትሽ እኔ ድኛለሁ
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ

VERSE 8
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኸው ባረከችኝ
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዝልኛል

VERSE 9
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅ ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው

VERSE 10
ይሞላልና የጎደለው
ግራ የገባው የቸገረው
ድንግልን ይጥራት እንድትረዳው
ሳዝን ስተክዝ የምታጽናና

VERSE 11
እናት አለችኝ ርኅርኂተ ልቦና
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 1
Newr alebgn bizu sidb
Anjet yemilt’ lib yemiyaqosl
Simen lewt’ew biyanqwashshugn
Behezen beleqso Dingil met’ahugn

VERSE 2
Ende hana hogne kebete meqdes
Bemerere hezen new ene yemaleqs
Firejlgnna limeles kebete
Hezenen bedesta lewch’iw enate

VERSE 3
Begram beqegnm t’elat bikebegn
Abzche ech’ohalew enate simign
Mekeraw bezto gira gebtognal

VERSE 4
Dimts’shn lisma yaregagagnal
Yesew hiywetu birtu self new
Destana hezen yemayleyew
Beejachn wedqwal silugn t’elatoche

VERSE 5
Amelet’kwachew simshn t’erche
Sew yezerawn yannu yach’dal
Beqoferew gudgwad rasu yigebal
Enate Emebete biye sit’erash

VERSE 6
Kemekera hulu tawech’ignalesh
Bemrko salehu besew heger
Gif t’lewbgn sinor beesr

VERSE 7
Miljash dersolgn tefetchalehu
Beteamratsh ene dignalehu
Qalshn semto ts’nsu segede
Bilalech elsabet’ newre tewegede

VERSE 8
Yegetaye enat enen asebechgn
Tariken qeyra yiኸw barekechgn
Yeemebete kehonku man yiqawemegnal
Wejebum maebelum yitazezlgnal

VERSE 9
Weynko alqwal yedokimas bet
Dingil amalj ney yeegna emebet
Simsh sit’era beyebotaw

VERSE 10
Yimolalna yegodelew
Gira yegebaw yechegerew
Dingln yit’rat endtredaw
Sazn sitekz yemtats’nana

VERSE 11
Enat alechgn rihrhite libona
Enate Emebete biye sit’erash
Kemekera hulu tawech’ignalesh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sidiben-arikesh-newiren-shefenishiw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sidiben Arqesh (sidiben-arqesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 1
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 2
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 3
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 4
እንደ ሃና ሆኜ በቤተ መቅደስ
በመረረ ሐዘን ነው የማለቅስ
ፍረጅልን እና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 5
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 6
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 7
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 8
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 9
መከራው በዝቶ ግራ ገብቶኛል
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 10
በእጃችን ወድቋል ሲሉ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 11
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 12
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 13
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 14
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 15
በሙርኮ ሳለሁ በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በታምራትሽ እኔ ድኛለሁ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 16
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነው የተወደደ
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኽው ባረከችኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 17
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዙልኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 18
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 19
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 20
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 21
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅው ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው
ይሞላልና የጎደለው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 22
ግራ የገባው የቸገረው
ድንግልን ይጥራ እንድትረዳው
ሳዝን ስተክዝ የምታጽናና
እናት አለችኝ እርህርህይተ ልቦና

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 23
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 24
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ',
      lyrics_transliteration = 'CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 1
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 2
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Newr alebign, bizu sidib

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 3
Anjet yemilit’ lib yemiyaqosil
Simen lewtew biyank’washw
Be-hazen be-leqso Dengel met’awñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 4
Ende Hana hone be-bete mekdes
Be-merere hazen new yemalek’es
Fikejilignna limeles ke-bete

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 5
Hazenen bedesta lewichiw enate
Be-giram be-qenyim telat bikebegn
Abizche ichohalew enate simiñ
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 6
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 7
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 8
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Mekeraw bezzito gira gebetognal

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 9
Dimsishin lisma yaregagagnal
Yesew hiywotu birtu self new
Desta na hazen yemayleyew

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 10
Be-ejachen wedkwal silu telatoche
Amelet’k’wachew simishin terchew
Sew yezerawein yaninu yachidal
Be-qoferaw gudguad rasu yigebal

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 11
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 12
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 13
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 14
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Be-murko salehu be-sew hager

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 15
Gif wulewebign sinor be-esir
Miljash dersolign tefet’chalew
Be-tamratish ine dinyalew
Qalishin semto ts’nisu segejde

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 16
Bilalet’ Elsabetch new yetewedede
Ye-getayeh enat enen asebechñ
Tariken qeyra yek’iw barekechñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 17
Ye-Emebete kehonk’u man yiqawemegn
Wejebum ma’ebellum yit’azezulñal
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 18
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 19
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 20
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Weyniko alkwal, ye-Dokimas bet
Dengel amaljiw ney, ye-egna Emebet

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 21
Simish sitera be-yebotaw
Yimolalna ye-godelewe
Gira yegebaw, ye-chegerwe

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 22
Dengel’n yitra endetiredaw
Sazen sitek’iz yemitatsnana
Enat alechñ, erherhiyte libona

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 23
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 24
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sidiben-arqesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 1
አ.ዝ \\

VERSE 2
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 3
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

VERSE 4
እንደ ሃና ሆኜ በቤተ መቅደስ
በመረረ ሐዘን ነው የማለቅስ
ፍረጅልን እና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ

VERSE 5
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ

VERSE 6
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 7
አ.ዝ \\

VERSE 8
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 9
መከራው በዝቶ ግራ ገብቶኛል
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው

VERSE 10
በእጃችን ወድቋል ሲሉ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል

VERSE 11
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

VERSE 12
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 13
አ.ዝ \\

VERSE 14
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 15
በሙርኮ ሳለሁ በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በታምራትሽ እኔ ድኛለሁ

VERSE 16
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነው የተወደደ
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኽው ባረከችኝ

VERSE 17
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዙልኛል

VERSE 18
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 19
አ.ዝ \\

VERSE 20
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 21
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅው ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው
ይሞላልና የጎደለው

VERSE 22
ግራ የገባው የቸገረው
ድንግልን ይጥራ እንድትረዳው
ሳዝን ስተክዝ የምታጽናና
እናት አለችኝ እርህርህይተ ልቦና

VERSE 23
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

VERSE 24
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 1
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

VERSE 2
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Newr alebign, bizu sidib

VERSE 3
Anjet yemilit’ lib yemiyaqosil
Simen lewtew biyank’washw
Be-hazen be-leqso Dengel met’awñ

VERSE 4
Ende Hana hone be-bete mekdes
Be-merere hazen new yemalek’es
Fikejilignna limeles ke-bete

VERSE 5
Hazenen bedesta lewichiw enate
Be-giram be-qenyim telat bikebegn
Abizche ichohalew enate simiñ
Sidiben arqesh, newren shefeneshw

VERSE 6
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 7
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

VERSE 8
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Mekeraw bezzito gira gebetognal

VERSE 9
Dimsishin lisma yaregagagnal
Yesew hiywotu birtu self new
Desta na hazen yemayleyew

VERSE 10
Be-ejachen wedkwal silu telatoche
Amelet’k’wachew simishin terchew
Sew yezerawein yaninu yachidal
Be-qoferaw gudguad rasu yigebal

VERSE 11
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

VERSE 12
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 13
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

VERSE 14
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Be-murko salehu be-sew hager

VERSE 15
Gif wulewebign sinor be-esir
Miljash dersolign tefet’chalew
Be-tamratish ine dinyalew
Qalishin semto ts’nisu segejde

VERSE 16
Bilalet’ Elsabetch new yetewedede
Ye-getayeh enat enen asebechñ
Tariken qeyra yek’iw barekechñ

VERSE 17
Ye-Emebete kehonk’u man yiqawemegn
Wejebum ma’ebellum yit’azezulñal
Sidiben arqesh, newren shefeneshw

VERSE 18
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 19
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

VERSE 20
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Weyniko alkwal, ye-Dokimas bet
Dengel amaljiw ney, ye-egna Emebet

VERSE 21
Simish sitera be-yebotaw
Yimolalna ye-godelewe
Gira yegebaw, ye-chegerwe

VERSE 22
Dengel’n yitra endetiredaw
Sazen sitek’iz yemitatsnana
Enat alechñ, erherhiyte libona

VERSE 23
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

VERSE 24
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sidiben-arqesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Silasie Lebeleh (silasie-lebeleh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሥላሴ ሥላሴ ልበልህ
አምላኬ መጠለያዬ ነህ
ጸባኦት ምስጋና ይፈሳል
መላዕክት /ፍጥረታት ያመሰግኑሃል

VERSE 1
ሰማይ ዙፋንህ ነው መረገጫህ ምድር
ሲያወድስ ይኖርል ፍጥረት ያንተ ክብር
ኪሩቤል ሱራፌል ዙፋንህን ይዘው
ስራቸው ቀን ከሌት አንተን ማመስገን ነው

CHORUS
ሥላሴ ሥላሴ ልበልህ
አምላኬ መጠለያዬ ነህ
ጸባኦት ምስጋና ይፈሳል
መላዕክት /ፍጥረታት ያመሰግኑሃል

VERSE 2
ነገደ መላዕክት ምስጋና ይፈሳሉ
ዙፋንህን ከበው ለክብርህ ይሰግዳሉ
በፊትህ የሚቆሙት ፊታቸውን ጋርደው
ሥሉስ ቅዱስ ብለው ሊዘምሩልህ ነው/፪/

CHORUS
ሥላሴ ሥላሴ ልበልህ
አምላኬ መጠለያዬ ነህ
ጸባኦት ምስጋና ይፈሳል
መላዕክት /ፍጥረታት ያመሰግኑሃል

VERSE 3
ውኖችን በፍኘህ ስፍረህ መዝነሃል
ሰማይና ምድር ይሁን ስትል ሆኑኦል
የሆነውም ሁሉ ያላንተ አልሆነም
አምላኬ ሥላሴ መንግስት ዘላለም/፪/

CHORUS
ሥላሴ ሥላሴ ልበልህ
አምላኬ መጠለያዬ ነህ
ጸባኦት ምስጋና ይፈሳል
መላዕክት /ፍጥረታት ያመሰግኑሃል

VERSE 4
ካህናተ ሰማይ ያመሰግኑሃል
የምድር ጠቢባን ይዘምሩልሃል
አምልካና ስግደት ላንተ ገንዘብህ ነው
አንተን ማወደሱ የፍጥረት ስራ ነው/፪/

CHORUS
ሥላሴ ሥላሴ ልበልህ
አምላኬ መጠለያዬ ነህ
ጸባኦት ምስጋና ይፈሳል
መላዕክት /ፍጥረታት ያመሰግኑሃል',
      lyrics_transliteration = 'CHORUS
Silassie Silassie libelh
Amlake met’eleyaye neh
Ts’ebaot misgana yifesal
Melaekt /fit’retat yamesegnuhal

VERSE 1
Semay zufanh new meregech’ah midr
Siyaweds yinorl fit’ret yante kibir
Kirubel surafel zufanhn yizew
Sirachew qen kelet anten mamesgen new

CHORUS
Silassie Silassie libelh
Amlake met’eleyaye neh
Ts’ebaot misgana yifesal
Melaekt /fit’retat yamesegnuhal

VERSE 2
Negede melaekt misgana yifesalu
Zufanhn kebew lekbrh yisegdalu
Befith yemiqomut fitachewn gardew
Silus Kidus bilew lizemrulh new (2)

CHORUS
Silassie Silassie libelh
Amlake met’eleyaye neh
Ts’ebaot misgana yifesal
Melaekt /fit’retat yamesegnuhal

VERSE 3
Winochn befgneh sifreh meznehal
Semayna midr yihun sitl honuol
Yehonewm hulu yalante alhonem
Amlake Silassie mengst zelalem (2)

CHORUS
Silassie Silassie libelh
Amlake met’eleyaye neh
Ts’ebaot misgana yifesal
Melaekt /fit’retat yamesegnuhal

VERSE 4
Kahnate semay yamesegnuhal
Yemdr t’ebiban yizemrulhal
Amlkana sigdet lante genzebh new
Anten mawedesu yeft’ret sira new (2)

CHORUS
Silassie Silassie libelh
Amlake met’eleyaye neh
Ts’ebaot misgana yifesal
Melaekt /fit’retat yamesegnuhal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'silasie-lebeleh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሥላሴ ሥላሴ ልበልህ
አምላኬ መጠለያዬ ነህ
ጸባኦት ምስጋና ይፈሳል
መላዕክት /ፍጥረታት ያመሰግኑሃል

VERSE 1
ሰማይ ዙፋንህ ነው መረገጫህ ምድር
ሲያወድስ ይኖርል ፍጥረት ያንተ ክብር
ኪሩቤል ሱራፌል ዙፋንህን ይዘው
ስራቸው ቀን ከሌት አንተን ማመስገን ነው

VERSE 2
ነገደ መላዕክት ምስጋና ይፈሳሉ
ዙፋንህን ከበው ለክብርህ ይሰግዳሉ
በፊትህ የሚቆሙት ፊታቸውን ጋርደው
ሥሉስ ቅዱስ ብለው ሊዘምሩልህ ነው/፪/

VERSE 3
ውኖችን በፍኘህ ስፍረህ መዝነሃል
ሰማይና ምድር ይሁን ስትል ሆኑኦል
የሆነውም ሁሉ ያላንተ አልሆነም
አምላኬ ሥላሴ መንግስት ዘላለም/፪/

VERSE 4
ካህናተ ሰማይ ያመሰግኑሃል
የምድር ጠቢባን ይዘምሩልሃል
አምልካና ስግደት ላንተ ገንዘብህ ነው
አንተን ማወደሱ የፍጥረት ስራ ነው/፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Silassie Silassie libelh
Amlake met’eleyaye neh
Ts’ebaot misgana yifesal
Melaekt /fit’retat yamesegnuhal

VERSE 1
Semay zufanh new meregech’ah midr
Siyaweds yinorl fit’ret yante kibir
Kirubel surafel zufanhn yizew
Sirachew qen kelet anten mamesgen new

VERSE 2
Negede melaekt misgana yifesalu
Zufanhn kebew lekbrh yisegdalu
Befith yemiqomut fitachewn gardew
Silus Kidus bilew lizemrulh new (2)

VERSE 3
Winochn befgneh sifreh meznehal
Semayna midr yihun sitl honuol
Yehonewm hulu yalante alhonem
Amlake Silassie mengst zelalem (2)

VERSE 4
Kahnate semay yamesegnuhal
Yemdr t’ebiban yizemrulhal
Amlkana sigdet lante genzebh new
Anten mawedesu yeft’ret sira new (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'silasie-lebeleh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Silassien Amesginu (silassien-amesginu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 1
Creations of the world

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 2
Honor God with hymnody

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 3
To the Father the Son and the Holy Spirit

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 4
We will give what is due worship for His merit

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 5
The creator of all things a world that is sublime

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 6
We shall praise night and day until the end of time

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 7
We will praise the Trinity (2)

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 8
Creations of the world

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 9
Honor God with hymnody

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 10
Cherubim Seraphim offer worship to you

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 11
Angels in the heavens sing to their God it''s true

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 12
The children of Adam singing to you since birth

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 13
Calling upon Your name in the heavens and Earth

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 14
We will praise the Trinity (2)

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 15
Creations of the world

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 16
Honor God with hymnody

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 17
If I hunger my Lord will feed me this I know

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 18
My thirst will go away blessings He will bestow

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 19
The Trinity is my protector and my grace

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 20
Always guiding me through whatever I may face

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 21
We will praise the Trinity (2)

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 22
Creations of the world

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 23
Honor God with hymnody

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 24
Silassien amesginu (2)

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 25
Ye midir fitretat

CHORUS
Praise the trinity
We will praise the Trinity (2)

VERSE 26
Zemiru elil belu

CHORUS
Praise the trinity
We will praise the Trinity (2)',
      lyrics_transliteration = 'CHORUS
Silassien amesginu (2)

VERSE 1
Ye midir fitretat

CHORUS
Silassien amesginu (2)

VERSE 2
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 3
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 4
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 5
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 6
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 7
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 8
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 9
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 10
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 11
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 12
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 13
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 14
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 15
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 16
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 17
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 18
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 19
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 20
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 21
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 22
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 23
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 24
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 25
Zemiru elil belu

CHORUS
Silassien amesginu (2)

VERSE 26
Zemiru elil belu

CHORUS
Silassien amesginu (2)',
      lyrics_english = 'CHORUS
We will praise the Trinity/x2/
Creations of the world
Honor God with hymnody

VERSE 1
To the Father the Son and the Holy Spirit
We will give what is due worship for His merit
The creator of all things a world that is sublime
We shall praise night and day until the end of time

CHORUS
We will praise the Trinity/x2/
Creations of the world
Honor God with hymnody

VERSE 2
Cherubim Seraphim offer worship to you
Angels in the heavens sing to their God it''s true
The children of Adam singing to you since birth
Calling upon Your name in the heavens and Earth

CHORUS
We will praise the Trinity/x2/
Creations of the world
Honor God with hymnody

VERSE 3
If I hunger my Lord will feed me this I know
My thirst will go away blessings He will bestow
The Trinity is my protector and my grace
Always guiding me through whatever I may face

CHORUS
We will praise the Trinity/x2/
Creations of the world
Honor God with hymnody

VERSE 4
We will praise the Trinity/x2/
Creations of the world
Honor God with hymnody

CHORUS
We will praise the Trinity/x2/
Creations of the world
Honor God with hymnody

VERSE 5
Silassien amesginu/x2/
Ye midir fitretat
Zemiru elil belu

CHORUS
We will praise the Trinity/x2/
Creations of the world
Honor God with hymnody',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'silassien-amesginu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'Praise the trinity
We will praise the Trinity (2)

VERSE 1
Creations of the world

VERSE 2
Honor God with hymnody

VERSE 3
To the Father the Son and the Holy Spirit

VERSE 4
We will give what is due worship for His merit

VERSE 5
The creator of all things a world that is sublime

VERSE 6
We shall praise night and day until the end of time

VERSE 7
We will praise the Trinity (2)

VERSE 8
Creations of the world

VERSE 9
Honor God with hymnody

VERSE 10
Cherubim Seraphim offer worship to you

VERSE 11
Angels in the heavens sing to their God it''s true

VERSE 12
The children of Adam singing to you since birth

VERSE 13
Calling upon Your name in the heavens and Earth

VERSE 14
We will praise the Trinity (2)

VERSE 15
Creations of the world

VERSE 16
Honor God with hymnody

VERSE 17
If I hunger my Lord will feed me this I know

VERSE 18
My thirst will go away blessings He will bestow

VERSE 19
The Trinity is my protector and my grace

VERSE 20
Always guiding me through whatever I may face

VERSE 21
We will praise the Trinity (2)

VERSE 22
Creations of the world

VERSE 23
Honor God with hymnody

VERSE 24
Silassien amesginu (2)

VERSE 25
Ye midir fitretat

VERSE 26
Zemiru elil belu'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Silassien amesginu (2)

VERSE 1
Ye midir fitretat

VERSE 2
Zemiru elil belu

VERSE 3
Zemiru elil belu

VERSE 4
Zemiru elil belu

VERSE 5
Zemiru elil belu

VERSE 6
Zemiru elil belu

VERSE 7
Zemiru elil belu

VERSE 8
Zemiru elil belu

VERSE 9
Zemiru elil belu

VERSE 10
Zemiru elil belu

VERSE 11
Zemiru elil belu

VERSE 12
Zemiru elil belu

VERSE 13
Zemiru elil belu

VERSE 14
Zemiru elil belu

VERSE 15
Zemiru elil belu

VERSE 16
Zemiru elil belu

VERSE 17
Zemiru elil belu

VERSE 18
Zemiru elil belu

VERSE 19
Zemiru elil belu

VERSE 20
Zemiru elil belu

VERSE 21
Zemiru elil belu

VERSE 22
Zemiru elil belu

VERSE 23
Zemiru elil belu

VERSE 24
Zemiru elil belu

VERSE 25
Zemiru elil belu

VERSE 26
Zemiru elil belu'
    AND lyrics_english IS NOT DISTINCT FROM 'We will praise the Trinity/x2/
Creations of the world
Honor God with hymnody

VERSE 1
To the Father the Son and the Holy Spirit
We will give what is due worship for His merit
The creator of all things a world that is sublime
We shall praise night and day until the end of time

VERSE 2
Cherubim Seraphim offer worship to you
Angels in the heavens sing to their God it''s true
The children of Adam singing to you since birth
Calling upon Your name in the heavens and Earth

VERSE 3
If I hunger my Lord will feed me this I know
My thirst will go away blessings He will bestow
The Trinity is my protector and my grace
Always guiding me through whatever I may face

VERSE 4
We will praise the Trinity/x2/
Creations of the world
Honor God with hymnody

VERSE 5
Silassien amesginu/x2/
Ye midir fitretat
Zemiru elil belu'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'silassien-amesginu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sile Mayneger Setotaw (sile-mayneger-setotaw)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sile-mayneger-setotaw'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 1
የሕይወት እስትንፉስ ዘራብን
ሕያው እንድንሆን
ይህን ያደረገ አምላካችን
እግዚአብሔር ይመስገን

VERSE 2
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 3
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 4
ነፉስን ገስፆ
ማዕበል አቁሞ ሚያሻግር
የዓለም ፈተና ቢበዛ
እሱ መጠጊያችን

VERSE 5
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 6
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 7
ዳግም እንዳንሞት
በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ
ሰላምን ለሰጠን

VERSE 8
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 9
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 10
ከሲኦል እስራት ተፈተን
ነጻ የወጣንበት
ሕይወትን ለሰጠን
ለአምላካችን እንዘምር በእውነት

VERSE 11
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 12
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ
ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sile mayneger setotaw Egziabher yimesgen
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 1
Yehiywet istinfus zerabn
Hiyaw endinhon
Yihin yaderge Amlakachen

VERSE 2
Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

VERSE 3
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 4
Nefusun gesfo
Maebel aqumo miyashager
Yealem fetena bibezza

VERSE 5
Isu metegiyachen
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

VERSE 6
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 7
Dagim endanmot
Bemotu moten yeretaln
Yeminemekabet tinisae

VERSE 8
Selamen leseten
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

VERSE 9
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen

VERSE 10
Kesiol esirat tefeten
Netsa yewetanbet
Hiyweten leseten

VERSE 11
LeAmlakachen enzemr beewnet
Sile mayneger setotaw Egziabher yimesgen
Sile mayneger setotaw Egziabher yimesgen

VERSE 12
Chel yalalen Amlak
Sengwaz maebelun aqwarten
Sile mayneger setotaw Egziabher yimesgen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sile-mayneger-setotaw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sile Mayneger Sitotaw (sile-mayneger-sitotaw)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን

VERSE 1
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን

VERSE 2
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን

VERSE 3
ንፋስን ገልጾ ማዕበል አቁሞ የሚያሻግር
የዓለም ፈተና ቢበዛ እርሱ መጠጊያችን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን

VERSE 4
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን

VERSE 5
የምንመካበት ትንሳኤን ሰላምን የሰጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን

VERSE 6
ከሲኦል እስራት ተፈተን ነፃ የወጣንበት
መስቀሉን ለሰጠን ለአምላካችን እንዘምር በእውነት

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን

VERSE 7
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን',
      lyrics_transliteration = 'CHORUS
Sile mayneger sitotaw Egziabher yimesgen
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en

VERSE 1
Sile mayneger sitotaw Egziabher yimesgen
Ye hiywet istinfas zeraben hiyaw endinhon

CHORUS
Sile mayneger sitotaw Egziabher yimesgen
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en

VERSE 2
Yihin yaderege Amlakachin Egziabher yimesgen
Sile mayneger sitotaw Egziabher yimesgen

CHORUS
Sile mayneger sitotaw Egziabher yimesgen
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en

VERSE 3
Nifasin gelitso ma’ebal aqumo yemiyashager
Ye alem fetena bibaza ersu met’ageyachin

CHORUS
Sile mayneger sitotaw Egziabher yimesgen
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en

VERSE 4
Sile mayneger sitotaw Egziabher yimesgen
Dagim endanmot bemotu moten yeretaln

CHORUS
Sile mayneger sitotaw Egziabher yimesgen
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en

VERSE 5
Yeminemekabet t’insaen selamen yeseten
Sile mayneger sitotaw Egziabher yimesgen

CHORUS
Sile mayneger sitotaw Egziabher yimesgen
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en

VERSE 6
Kesiool esirat tefeten netsa yewetanbet
Meskelun leseten leAmlakachin enzemir bewinit

CHORUS
Sile mayneger sitotaw Egziabher yimesgen
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en

VERSE 7
Sile mayneger sitotaw Egziabher yimesgen

CHORUS
Sile mayneger sitotaw Egziabher yimesgen
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sile-mayneger-sitotaw'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን

VERSE 1
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 2
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 3
ንፋስን ገልጾ ማዕበል አቁሞ የሚያሻግር
የዓለም ፈተና ቢበዛ እርሱ መጠጊያችን

VERSE 4
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን

VERSE 5
የምንመካበት ትንሳኤን ሰላምን የሰጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 6
ከሲኦል እስራት ተፈተን ነፃ የወጣንበት
መስቀሉን ለሰጠን ለአምላካችን እንዘምር በእውነት

VERSE 7
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sile mayneger sitotaw Egziabher yimesgen
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en

VERSE 1
Sile mayneger sitotaw Egziabher yimesgen
Ye hiywet istinfas zeraben hiyaw endinhon

VERSE 2
Yihin yaderege Amlakachin Egziabher yimesgen
Sile mayneger sitotaw Egziabher yimesgen

VERSE 3
Nifasin gelitso ma’ebal aqumo yemiyashager
Ye alem fetena bibaza ersu met’ageyachin

VERSE 4
Sile mayneger sitotaw Egziabher yimesgen
Dagim endanmot bemotu moten yeretaln

VERSE 5
Yeminemekabet t’insaen selamen yeseten
Sile mayneger sitotaw Egziabher yimesgen

VERSE 6
Kesiool esirat tefeten netsa yewetanbet
Meskelun leseten leAmlakachin enzemir bewinit

VERSE 7
Sile mayneger sitotaw Egziabher yimesgen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sile-mayneger-sitotaw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: silechemerkilgn edme (silechemerkilgn-edme)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 1
በሰዉ ፊት ልናገር አፍ የፈታሁብህ
እንደበት ሆነኼኝ ቆምያለሁ ለቅኔ
ንገሥ በሕይወቴ ያንተ ነዉ ዘመኔ(2)
በዓላማ ሠራኸኝ ስምህን ልቀድስ

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 2
ለይተህ ከፍጥረት ክብርህን እንድወርስ
ያስታጠቀኝ ስምህነዉ መታወቂያየዬ
አታናዉጸኝ ከዚህ እስክቋጭ እድሜዬ(2)አ
ከዘመርኩት በላይ እንድኖር ስዘምር

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 3
ጣፋጩን ሕግህን በልቤ ላይ አኑር
ከእከዛሬዉ በላይ ልኑር ሳገለግል
ፍቅር ነህና አንተ ይዘህ የማትጥል(2)
የሞት መልዐክ ቢቆም እያንኳኳ በሬን

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 4
ተጨምሮልኛል በእድሜዬ ላይ ዛሬን
እድል የሠጠኸኝ በማምሻ ዘመኔ
ምስክርህ የሆንኩ ሕዝቅያስ ነኝ እኔ(2)

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ',
      lyrics_transliteration = 'CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 1
Besewu fit linager af yefetahubh
Endebet honeኼgn qomyalehu leqne
Niges behywete yante newu zemene (2)
Bealama seraኸgn simhn liqeds

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 2
Leyteh keft’ret kibrhn endwers
Yastat’eqegn simhnewu metaweqiyayeye
Atanawuts’egn kezih eskqwach’ edmeye (2)a
Kezemerkut belay endnor sizemr

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 3
T’afach’un highn belbe lay anur
Keekezarewu belay linur sagelegl
Fiqr nehna ante yizeh yematt’l (2)
Yemot melak biqom eyankwakwa beren

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 4
Tech’emrolgnal beedmeye lay zaren
Edl yeset’eኸgn bemamsha zemene
Miskrh yehonku hizqyas negn ene (2)

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'silechemerkilgn-edme'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 1
በሰዉ ፊት ልናገር አፍ የፈታሁብህ
እንደበት ሆነኼኝ ቆምያለሁ ለቅኔ
ንገሥ በሕይወቴ ያንተ ነዉ ዘመኔ(2)
በዓላማ ሠራኸኝ ስምህን ልቀድስ

VERSE 2
ለይተህ ከፍጥረት ክብርህን እንድወርስ
ያስታጠቀኝ ስምህነዉ መታወቂያየዬ
አታናዉጸኝ ከዚህ እስክቋጭ እድሜዬ(2)አ
ከዘመርኩት በላይ እንድኖር ስዘምር

VERSE 3
ጣፋጩን ሕግህን በልቤ ላይ አኑር
ከእከዛሬዉ በላይ ልኑር ሳገለግል
ፍቅር ነህና አንተ ይዘህ የማትጥል(2)
የሞት መልዐክ ቢቆም እያንኳኳ በሬን

VERSE 4
ተጨምሮልኛል በእድሜዬ ላይ ዛሬን
እድል የሠጠኸኝ በማምሻ ዘመኔ
ምስክርህ የሆንኩ ሕዝቅያስ ነኝ እኔ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 1
Besewu fit linager af yefetahubh
Endebet honeኼgn qomyalehu leqne
Niges behywete yante newu zemene (2)
Bealama seraኸgn simhn liqeds

VERSE 2
Leyteh keft’ret kibrhn endwers
Yastat’eqegn simhnewu metaweqiyayeye
Atanawuts’egn kezih eskqwach’ edmeye (2)a
Kezemerkut belay endnor sizemr

VERSE 3
T’afach’un highn belbe lay anur
Keekezarewu belay linur sagelegl
Fiqr nehna ante yizeh yematt’l (2)
Yemot melak biqom eyankwakwa beren

VERSE 4
Tech’emrolgnal beedmeye lay zaren
Edl yeset’eኸgn bemamsha zemene
Miskrh yehonku hizqyas negn ene (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'silechemerkilgn-edme', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Silemayiger Sitotaw (silemayiger-sitotaw)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'silemayiger-sitotaw'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
የሕይወት እስትንፋስ ዘራብን ህያው እንድንሆን

VERSE 1
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 2
ነፋስን ገስጾ ማዕበል አቆሞ የሚያሻግር
የዓለም ፈተና ቢበዛ እርሱ መጠጊያችን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 3
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሳኤን ሰላምን ለሰጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 4
ከሲኦል እስራት ተፈተን ነጻ የወጣንበት
መስቀሉን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maebelun aqwart’en
Silemayneger sit’otaw Egziabher yemesgen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 1
Yihn yaderege amlakachn Egziabher yemesgen
Silemayneger sit’otaw Egziabher yemesgen

VERSE 2
Nefasn gests’o maebel aqomo yemiyashagr
Yealem fetena bibeza ersu met’egiyachn
Silemayneger sit’otaw Egziabher yemesgen

VERSE 3
Dagm endanmot bemotu motn yeretaln
Yemnmekabet tinsaen selamn leset’en
Silemayneger sit’otaw Egziabher yemesgen

VERSE 4
Kesiol esrat tefeten nets’a yewet’anbet
Mesqelun leset’en leamlakachn enzemr beewnet
Silemayneger sit’otaw Egziabher yemesgen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'silemayiger-sitotaw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Silemayineger Sitotaw (silemayineger-sitotaw)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማይበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመሰገን
የህይወት እስትንፋስ ዘራብን ሕያው እንድንሆን

VERSE 1
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ነፋስን ገስጾ ማዕበል አቁሞ የሚያሻግር
የአለም ፈተና ቢበዛ እሱ መጠጊያችን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማይበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመሰገን
የህይወት እስትንፋስ ዘራብን ሕያው እንድንሆን

VERSE 2
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሳኤ ሰላምን ለሰጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመሰገን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማይበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመሰገን
የህይወት እስትንፋስ ዘራብን ሕያው እንድንሆን

VERSE 3
ከሲኦል እስራት ተፈተን ነፃ የወጣንበት
መስቀሉን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
አሜን አሜን ዝማሬ መላእክትን ያሰማልን

CHORUS
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማይበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመሰገን
የህይወት እስትንፋስ ዘራብን ሕያው እንድንሆን',
      lyrics_transliteration = 'CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maybelun aqwart’en
Silemayneger sit’otaw Egziabher yimesegen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 1
Yihn yaderege amlakachn Egziabher yemesgen
Silemayneger sit’otaw Egziabher yemesgen
Nefasn gests’o maebel aqumo yemiyashagr
Yealem fetena bibeza esu met’egiyachn

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maybelun aqwart’en
Silemayneger sit’otaw Egziabher yimesegen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 2
Silemayneger sit’otaw Egziabher yemesgen
Dagm endanmot bemotu motn yeretaln
Yemnmekabet tinsae selamn leset’en
Silemayneger sit’otaw Egziabher yimesegen

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maybelun aqwart’en
Silemayneger sit’otaw Egziabher yimesegen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 3
Kesiol esrat tefeten nets’a yewet’anbet
Mesqelun leset’en leamlakachn enzemr beewnet
Silemayneger sit’otaw Egziabher yemesgen
Amen Amen zimare melaektn yasemaln

CHORUS
Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maybelun aqwart’en
Silemayneger sit’otaw Egziabher yimesegen
Yehywet estnfas zerabn hiyaw endnhon',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'silemayineger-sitotaw'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላለን አምላክ ስንጓዝ ማይበሉን አቋርጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመሰገን
የህይወት እስትንፋስ ዘራብን ሕያው እንድንሆን

VERSE 1
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ነፋስን ገስጾ ማዕበል አቁሞ የሚያሻግር
የአለም ፈተና ቢበዛ እሱ መጠጊያችን

VERSE 2
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሳኤ ሰላምን ለሰጠን
ስለማይነገር ስጦታው እግዚአብሔር ይመሰገን

VERSE 3
ከሲኦል እስራት ተፈተን ነፃ የወጣንበት
መስቀሉን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለማይነገር ስጦታው እግዚአብሔር ይመስገን
አሜን አሜን ዝማሬ መላእክትን ያሰማልን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Silemayneger sit’otaw Egziabher yemesgen
Chel yalalen amlak singwaz maybelun aqwart’en
Silemayneger sit’otaw Egziabher yimesegen
Yehywet estnfas zerabn hiyaw endnhon

VERSE 1
Yihn yaderege amlakachn Egziabher yemesgen
Silemayneger sit’otaw Egziabher yemesgen
Nefasn gests’o maebel aqumo yemiyashagr
Yealem fetena bibeza esu met’egiyachn

VERSE 2
Silemayneger sit’otaw Egziabher yemesgen
Dagm endanmot bemotu motn yeretaln
Yemnmekabet tinsae selamn leset’en
Silemayneger sit’otaw Egziabher yimesegen

VERSE 3
Kesiol esrat tefeten nets’a yewet’anbet
Mesqelun leset’en leamlakachn enzemr beewnet
Silemayneger sit’otaw Egziabher yemesgen
Amen Amen zimare melaektn yasemaln'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'silemayineger-sitotaw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Siman Egiziabiher (siman-egiziabiher)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 1
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ንፁሃን ታረዱ። በጭካኔ ተቆረጡ። ስማን እግዚአብሔር። እንደ ስብ ቀለጡ።
የሰዎች ጭካኔ በምድሪቱ በርትታለች። ስማን እግዚአብሔር። ፍቅር ቀዝቅዛለች።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 2
የጥፋት ደመና ያንዣብባል በሰማይ። ስማን እግዚአብሔር። በዛብን ስቃይ።
ቁጣህን በምህረት መልስልን አባታችን። ስማን እግዚአብሔር። አንተው ነህ ተስፋችን።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ሰይፍን የሚመዝዙ ይጠፋሉ በሰይፋቸው። ስማን እግዚአብሔር። አይቀርም ፍርዳቸው።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 3
ከለቅሷችን ብዛት ዓይኖቻችን ፈዝዘዋል። ስማን እግዚአብሔር። ልባችን ቆስሏል።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ህፃናት አዛዉንት እንባቸዉን አፈሰሱ። ስማን እግዚአብሔር። አይዘግይብን መልሱ።
ደም የጠጣው አውሬ እርስ በእርስ ሲያባላን። ስማን እግዚአብሔር። ሰላምን አጣን።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 4
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።',
      lyrics_transliteration = NULL,
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'siman-egiziabiher'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 1
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ንፁሃን ታረዱ። በጭካኔ ተቆረጡ። ስማን እግዚአብሔር። እንደ ስብ ቀለጡ።
የሰዎች ጭካኔ በምድሪቱ በርትታለች። ስማን እግዚአብሔር። ፍቅር ቀዝቅዛለች።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።

VERSE 2
የጥፋት ደመና ያንዣብባል በሰማይ። ስማን እግዚአብሔር። በዛብን ስቃይ።
ቁጣህን በምህረት መልስልን አባታችን። ስማን እግዚአብሔር። አንተው ነህ ተስፋችን።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ሰይፍን የሚመዝዙ ይጠፋሉ በሰይፋቸው። ስማን እግዚአብሔር። አይቀርም ፍርዳቸው።

VERSE 3
ከለቅሷችን ብዛት ዓይኖቻችን ፈዝዘዋል። ስማን እግዚአብሔር። ልባችን ቆስሏል።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ህፃናት አዛዉንት እንባቸዉን አፈሰሱ። ስማን እግዚአብሔር። አይዘግይብን መልሱ።
ደም የጠጣው አውሬ እርስ በእርስ ሲያባላን። ስማን እግዚአብሔር። ሰላምን አጣን።

VERSE 4
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'siman-egiziabiher', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Simih Behulu Temesegene (simih-behulu-temesegene)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simih-behulu-temesegene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምህ በሁሉ ተመሰገን
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክብር ግብራችን ሁኗል

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ( ፪)

VERSE 2
ሰማዩ ዝናብ ደመና ቢያጣም
ፍቅርህ በእኛ ውስጥ አላቋረጠም
ቸርነትህ እንጠብቃለን
ካንተ ደጅ አምላክ (ጌታ)የት እንሔዳለን(፪)

VERSE 3
በምግብ እጦት ብንሰቃይም
ማህሌትህን አናቋርጥም
የመከራ ዶፍ ቢወርድብንም
እንዘምራለን ለአምላካችን ስም(፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simh behulu temesegen
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makbr gibrachn hunwal

VERSE 1
Amlak temesgen besemayat
Simh yiwedes beft’retat
Kehts’anat af misgana yiwt’a
Anten mamesgen yihun yegna et’a (2)

VERSE 2
Semayu zinab demena biyat’am
Fiqrh beegna wist’ alaqwaret’em
Cherneth ent’ebqalen
Kante dej amlak (Geta)yet enhedalen (2)

VERSE 3
Bemgb et’ot binseqaym
Mahlethn anaqwart’m
Yemekera dof biwerdbnm
Enzemralen leamlakachn sim (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simih-behulu-temesegene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Simih Be-hulu Temesgene (simih-behulu-temesgene)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኗል /2/

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኗል /2/

VERSE 2
በምግብ እጥረት ብንሰቃይም ማህሌትህን አናቆርጥም
የመከራ ደመና ቢወርድብንም እንዘምራለን ለአምላካችን ስም /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኗል /2/

VERSE 3
ሰማዩ ዝናብ ደመና ቢያጣ
ፍቅርህ በእኛ ውስጥ አላቋረጠም ቸርነትህን እንጠብቃለን
ከአንተ ደጅ አምላክ የት እንሄዳለን /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኗል /2/',
      lyrics_transliteration = 'CHORUS
Simih be-hulu temesgene
Ke-kibir belay kibirih genene
Anten mawodes yasdestenal
Simihin makber kibrachin honwal (2)

VERSE 1
Amlak temesgen be-semayat
Simih yiwodes be-fitretat
Ke-hizat af misgana yiwt-ta
Anten mamesgen yihun yegna it-ta (2)

CHORUS
Simih be-hulu temesgene
Ke-kibir belay kibirih genene
Anten mawodes yasdestenal
Simihin makber kibrachin honwal (2)

VERSE 2
Be-migib itret binsiqayim mahilethun ana-qort-m
Ye-mekera demena biwerdbinim inzemiralen le-amlakachin sim (2)

CHORUS
Simih be-hulu temesgene
Ke-kibir belay kibirih genene
Anten mawodes yasdestenal
Simihin makber kibrachin honwal (2)

VERSE 3
Semayu zinab demena biyata
Fikrih be-ignaw wust al-aqua-retem chernethun in-te-be-qalen
Ke-ante dej Amlak yet in-hiedalen (2)

CHORUS
Simih be-hulu temesgene
Ke-kibir belay kibirih genene
Anten mawodes yasdestenal
Simihin makber kibrachin honwal (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simih-behulu-temesgene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኗል /2/

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ /2/

VERSE 2
በምግብ እጥረት ብንሰቃይም ማህሌትህን አናቆርጥም
የመከራ ደመና ቢወርድብንም እንዘምራለን ለአምላካችን ስም /2/

VERSE 3
ሰማዩ ዝናብ ደመና ቢያጣ
ፍቅርህ በእኛ ውስጥ አላቋረጠም ቸርነትህን እንጠብቃለን
ከአንተ ደጅ አምላክ የት እንሄዳለን /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simih be-hulu temesgene
Ke-kibir belay kibirih genene
Anten mawodes yasdestenal
Simihin makber kibrachin honwal (2)

VERSE 1
Amlak temesgen be-semayat
Simih yiwodes be-fitretat
Ke-hizat af misgana yiwt-ta
Anten mamesgen yihun yegna it-ta (2)

VERSE 2
Be-migib itret binsiqayim mahilethun ana-qort-m
Ye-mekera demena biwerdbinim inzemiralen le-amlakachin sim (2)

VERSE 3
Semayu zinab demena biyata
Fikrih be-ignaw wust al-aqua-retem chernethun in-te-be-qalen
Ke-ante dej Amlak yet in-hiedalen (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simih-behulu-temesgene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Simih Lezelealem Misigun Silehone (simih-lezelealem-misigun-silehone)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 1
መኸርን ለሰው ልጅ ምግብን የሰጠህ
የተራበችው ነፍስ በምድር በበረከት
በመገብካት ጊዜ ታመሰግናለች ስቡህ።
እንዳንተ ያለ ማነው ወቅት የሚያፈራርቅ

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 2
ምድርን በበረከት ሰማይን በጽድቅ
ተራሮች በአበባ ወንዞች የሚሞሉት
ስለጠገቡ ነው ከስጦታ ብዛት ስቡህ
የሚያበራው ገጹ ፊቱ የሚያወዛው

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 3
ከአንተ በሚቀዳው ከቸርነትህ ነው
የምድር ልምላሜ የፍጥረታት ደስታ
ሲዘምር ይውላል ለለጋሹ ጌታ ስቡህ

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ',
      lyrics_transliteration = 'CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 1
Meኸrn lesew lij migbn yeset’eh
Yeterabechw nefs bemdr bebereket
Bemegebkat gize tamesegnalech sibuh.
Endante yale manew weqt yemiyaferarq

CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 2
Midrn bebereket semayn bets’dq
Teraroch beabeba wenzoch yemimolut
Silet’egebu new kest’ota bizat sibuh
Yemiyaberaw gets’u fitu yemiyawezaw

CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 3
Keante bemiqedaw kecherneth new
Yemdr limlame yeft’retat desta
Sizemr yiwlal lelegashu Geta sibuh

CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simih-lezelealem-misigun-silehone'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 1
መኸርን ለሰው ልጅ ምግብን የሰጠህ
የተራበችው ነፍስ በምድር በበረከት
በመገብካት ጊዜ ታመሰግናለች ስቡህ።
እንዳንተ ያለ ማነው ወቅት የሚያፈራርቅ

VERSE 2
ምድርን በበረከት ሰማይን በጽድቅ
ተራሮች በአበባ ወንዞች የሚሞሉት
ስለጠገቡ ነው ከስጦታ ብዛት ስቡህ
የሚያበራው ገጹ ፊቱ የሚያወዛው

VERSE 3
ከአንተ በሚቀዳው ከቸርነትህ ነው
የምድር ልምላሜ የፍጥረታት ደስታ
ሲዘምር ይውላል ለለጋሹ ጌታ ስቡህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 1
Meኸrn lesew lij migbn yeset’eh
Yeterabechw nefs bemdr bebereket
Bemegebkat gize tamesegnalech sibuh.
Endante yale manew weqt yemiyaferarq

VERSE 2
Midrn bebereket semayn bets’dq
Teraroch beabeba wenzoch yemimolut
Silet’egebu new kest’ota bizat sibuh
Yemiyaberaw gets’u fitu yemiyawezaw

VERSE 3
Keante bemiqedaw kecherneth new
Yemdr limlame yeft’retat desta
Sizemr yiwlal lelegashu Geta sibuh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simih-lezelealem-misigun-silehone', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: #simika_New_Eritrean_orthodox_tewahdo_mezmur_2022_zemari_Bereket_tikue_smka (simika-new-eritrean-orthodox-tewahdo-mezmur-2022-zemari-bereket-tikue-sm)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simika-new-eritrean-orthodox-tewahdo-mezmur-2022-zemari-bereket-tikue-sm'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዘይትታከስ ሓላውየይ ናይዛ ነብሰይ እሙን ጋሳ
ብሕይወት ክሳዕ ዘለኹ ክዝምር''የ ከመስግነካ።
ስምኻ ክጽውዖ''የ ነሕዋተይ ውን ክነግር''የ
ኢየሱስ ንፍቅርኻ ኣብ ቕድሚ ማሕበር ክምስኽሮ''የ (2)

VERSE 1
ብዝሓርር መስዋእቲ ብደም ድቤላታት ፡
ሞት ብዝግድቦም ናይ ኦሪት ካህናት
ብናይ ሞት ኣጎልጉሎት ኣይኮነን ድሕነተይ ፡
ብገዛእ ደምኻ''ዩ ኦ ሊቀ ካህነይ።

VERSE 2
ክህነትካ ዘልኣለማዊ''ዩ
ሞት መቃብር ኣይግድቦን''ዩ
ስለዚ''የ ኣባኻ ዝውከል
መን ኣሎኒ ብጀካ መድሕን

VERSE 3
ኦ ኢየሱስ እሙን ኣምላኸይ
ኣብ ሕይወተይ ንስኻ ንገሰለይ፡ኣሜን።
ስምኻ''ዩ ሓይለይ ንሰይጣን ዝስዕረሉ
ምንጪ በረኸተይ ካልኣይ ዘይብሉ

VERSE 4
ንድሕነተይ ኢሉ ዝተዋህበኒ ስም
ብዘይካ ኢየሱስ ከቶ ካልእ የለን።
ኢየሱስ ኢየሱስ ክብል''የ
ብማህሌት ብምስጋና ቆይመ

VERSE 5
ኢየሱስ ኢየሱስ በሉ
ንክብሩ ሃየ ዘምሩ
ኢየሱስ ኢየሱስ ንበል
መድሃኔት''ዩ ኣብኡ ንወከል፡ኣሜን።

VERSE 6
ብስምካ ንልምን ብስምካ ንረክብ
ብስምካ ንትስፎ ብስምካ ንስዕር
እቲ ኣሎና ንብሎ ዕጥቅና ስንቅና
ኢየሱስ ስምካ''ዩ ሓይሊ ዝህበና

VERSE 7
ከመይ''ሲ ከምቲ ቃልካ ዝብሎ
ኩሉ ነገር ብስምካ ክንገብሮ
ስለዚ ኢና ኣባካ ንውከል
መን ኣሎና ብዘይካካ መድሕን

VERSE 8
ኦ ኢየሱስ እሙን ኣምላኽና
ኣምልኾን ምስጋናን ንዓኻ(3)ኣሜን።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zeyttakes halawyey nayza nebsey emun gasa
Bihywet kisae zeleኹ kizmr''ye kemesgneka.
Simኻ kits’wo''ye nehwatey win kinegr''ye
Iyesus nifqrኻ ab ቕdmi mahber kimsኽro''ye (2)

VERSE 1
Bizharr meswaeti bidem dibelatat
Mot bizgdbom nay orit kahnat
Binay mot agolgulot aykonen dihnetey
Bigezae demኻ''yu o liqe kahney.

VERSE 2
Kihnetka zelalemawi''yu
Mot meqabr aygdbon''yu
Silezi''ye abaኻ ziwkel
Men aloni bijeka medhn

VERSE 3
O Iyesus emun amlaኸy
Ab hiywetey nisኻ nigeseley amen.
Simኻ''yu hayley niseyt’an ziserelu
Minch’i bereኸtey kalay zeyblu

VERSE 4
Nidhnetey ilu zitewahbeni sim
Bizeyka Iyesus keto kale yelen.
Iyesus Iyesus kibl''ye
Bimahlet bimsgana qoyme

VERSE 5
Iyesus Iyesus belu
Nikbru haye zemru
Iyesus Iyesus nibel
Medhanet''yu abu niwekel amen.

VERSE 6
Bismka nilmn bismka nirekb
Bismka nitsfo bismka niser
Eti alona niblo et’qna sinqna
Iyesus simka''yu hayli zihbena

VERSE 7
Kemey''si kemti qalka ziblo
Kulu neger bismka kingebro
Silezi ina abaka niwkel
Men alona bizeykaka medhn

VERSE 8
O Iyesus emun amlaኽna
Amlኾn misganan niaኻ (3)amen.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simika-new-eritrean-orthodox-tewahdo-mezmur-2022-zemari-bereket-tikue-sm', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Simishin Biteru (simishin-biteru-693)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 1
የምንዱባን ሰፈር የሞላብሽ ግርማ
ቡራኬሽ ይድረሰኝ እናቴ ይህ ፍቅርሽ
ነፍሴን በምስጋና ለአንቺዉ ላድርስልሽ
የዕለም አርነት ጽህፈት ያለብሽ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 2
የሕይወት ፍደሌ ጽድቅ የተማርኩብሽ
ቢያነቡሽ አታልቅ ምስጥርሽ የሰፋ
ስምሽ ማራኪ ነዉ ከልብ የማይጠፋ
በሰዉ አገር ስኖር ሰዉ ጠፍቶ ከጎኔ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 3
ባልንጀራ ሆነሽ የሌሊት ብርሃኔ
ተስፋየን አብዝተሽ ጥሜን አስታሸግዉ
በብዙ በረከት ጎጆዬን ሞላሽዉ
ፍፁም ሩህሩህ ነሽ ስምሸ ጣዕም ያለዉ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 4
ኀዘኔ ሲበዛ በአንች እጽናናለሁ
የዕለም እርጋታ የሰላም ዉጥን ነሽ
ግዜ ለጣለዉ ሰዉ አይጨክንም ልብሽ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ',
      lyrics_transliteration = 'CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 1
Yemnduban sefer yemolabsh girma
Burakesh yidresegn enate yih fiqrsh
Nefsen bemsgana leanchiwu ladrslsh
Yeelem arnet ts’hfet yalebsh

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 2
Yehywet fidele ts’dq yetemarkubsh
Biyanebush atalq mist’rsh yesefa
Simsh maraki newu kelb yemayt’efa
Besewu ager sinor sewu t’efto kegone

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 3
Balnjera honesh yelelit birhane
Tesfayen abztesh t’men astashegwu
Bebzu bereket gojoyen molashwu
Fits’um ruhruh nesh simshe t’aem yalewu

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 4
Hezene sibeza beanch ets’nanalehu
Yeelem ergata yeselam wut’n nesh
Gize let’alewu sewu aych’eknm libsh

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simishin-biteru-693'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 1
የምንዱባን ሰፈር የሞላብሽ ግርማ
ቡራኬሽ ይድረሰኝ እናቴ ይህ ፍቅርሽ
ነፍሴን በምስጋና ለአንቺዉ ላድርስልሽ
የዕለም አርነት ጽህፈት ያለብሽ

VERSE 2
የሕይወት ፍደሌ ጽድቅ የተማርኩብሽ
ቢያነቡሽ አታልቅ ምስጥርሽ የሰፋ
ስምሽ ማራኪ ነዉ ከልብ የማይጠፋ
በሰዉ አገር ስኖር ሰዉ ጠፍቶ ከጎኔ

VERSE 3
ባልንጀራ ሆነሽ የሌሊት ብርሃኔ
ተስፋየን አብዝተሽ ጥሜን አስታሸግዉ
በብዙ በረከት ጎጆዬን ሞላሽዉ
ፍፁም ሩህሩህ ነሽ ስምሸ ጣዕም ያለዉ

VERSE 4
ኀዘኔ ሲበዛ በአንች እጽናናለሁ
የዕለም እርጋታ የሰላም ዉጥን ነሽ
ግዜ ለጣለዉ ሰዉ አይጨክንም ልብሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 1
Yemnduban sefer yemolabsh girma
Burakesh yidresegn enate yih fiqrsh
Nefsen bemsgana leanchiwu ladrslsh
Yeelem arnet ts’hfet yalebsh

VERSE 2
Yehywet fidele ts’dq yetemarkubsh
Biyanebush atalq mist’rsh yesefa
Simsh maraki newu kelb yemayt’efa
Besewu ager sinor sewu t’efto kegone

VERSE 3
Balnjera honesh yelelit birhane
Tesfayen abztesh t’men astashegwu
Bebzu bereket gojoyen molashwu
Fits’um ruhruh nesh simshe t’aem yalewu

VERSE 4
Hezene sibeza beanch ets’nanalehu
Yeelem ergata yeselam wut’n nesh
Gize let’alewu sewu aych’eknm libsh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simishin-biteru-693', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Simishin Le-Lij Lij (simishin-le-lij-lij)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 1
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከንእንባ ከለቅሶ ከልክይ
ልብሽ ይራራልኝ ወደኔ አዘንብይ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 2
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 3
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 4
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 5
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 6
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ
ቀስታቸውን ሁሉ ጣሉ ጠላቾቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 7
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 8
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 9
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 10
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 11
ሰላም አለኝ አሁን ይህንን አውቃለሁ
እጅግ ብዙ ነገር ባንቺ አግኝቻለሁ
ማድጋዬ ሞልቶ አለም ተመልክቷል
ምድረ በዳው ልቤ በጸሎትሽ ረክቶል

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 12
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 13
አዝ፡
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 14
ቀስታቸውን ሁሉ ጣሉ ጠላቶቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 15
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 16
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 17
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ',
      lyrics_transliteration = 'CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 1
Emebete biye simishin metrate
Biraqotibign new bado bihon bete
Aynochen ke-inba ke-leqso kelkiyi

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 2
Libish yiraralign wedene azenbiyi
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 3
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 4
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 5
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 6
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 7
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 8
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 9
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 10
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Selam alegn ahun yihinin awqalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 11
Ejig bizu neger banchi agnyichalehu
Madgaye molto alem temelkitwal
Midre bedaw libe be-tselotish rektol

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 12
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 13
Az:
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 14
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 15
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 16
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 17
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simishin-le-lij-lij'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 1
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከንእንባ ከለቅሶ ከልክይ
ልብሽ ይራራልኝ ወደኔ አዘንብይ

VERSE 2
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 3
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

VERSE 4
ማዕበል ሳይነቅለኝ

VERSE 5
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 6
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ
ቀስታቸውን ሁሉ ጣሉ ጠላቾቼ

VERSE 7
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 8
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

VERSE 9
ማዕበል ሳይነቅለኝ

VERSE 10
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 11
ሰላም አለኝ አሁን ይህንን አውቃለሁ
እጅግ ብዙ ነገር ባንቺ አግኝቻለሁ
ማድጋዬ ሞልቶ አለም ተመልክቷል
ምድረ በዳው ልቤ በጸሎትሽ ረክቶል

VERSE 12
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 13
አዝ፡
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ

VERSE 14
ቀስታቸውን ሁሉ ጣሉ ጠላቶቼ

VERSE 15
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 16
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 17
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 1
Emebete biye simishin metrate
Biraqotibign new bado bihon bete
Aynochen ke-inba ke-leqso kelkiyi

VERSE 2
Libish yiraralign wedene azenbiyi
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

VERSE 3
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu

VERSE 4
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

VERSE 5
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 6
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche

VERSE 7
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

VERSE 8
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

VERSE 9
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

VERSE 10
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Selam alegn ahun yihinin awqalehu

VERSE 11
Ejig bizu neger banchi agnyichalehu
Madgaye molto alem temelkitwal
Midre bedaw libe be-tselotish rektol

VERSE 12
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 13
Az:
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish

VERSE 14
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

VERSE 15
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

VERSE 16
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

VERSE 17
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simishin-le-lij-lij', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Simishin Siteraw Dinigil (simishin-siteraw-dinigil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 1
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራዉ ማርያም
አዝ
ትዉልድ ነኝ እና ልጅሽ የፈጠረኝ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 2
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዚአብሔር በአባቶቼ ጸጋ
ሰአሊለነ እላለሁ ሲመሽም ሲነጋ
አዝ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 3
በጠየቅሽዉ ግዜ ወይኑን እንዲመላ
አክብሮሻል እና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈጸም ሳመሰግንሽ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 4
አዝ
በሰላምታ ድምጽሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በዐቢይ ቃል ጮሄ ልመስክር በብርቱ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 5
ቅድስት ድንግል ማርያምን የእግዚአብሔር እናቱ
አዝ
ከሰማይ ሲገኝ ነው አንቺን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅዱስ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 6
ማርያም ሕይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነዉ ምስጢሩ አንቺን ማመስገኔ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም',
      lyrics_transliteration = 'CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 1
Landebete mar new lelbe selam
Simshn sit’erawu Maryam
CHORUS
Tiwuld negn ena lijsh yefet’eregn

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 2
Dingil Emebete lanchi misgana alegn
Befeqade Egziabher beabatoche ts’ega
Sealilene elalehu simeshm sinega
CHORUS

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 3
Bet’eyeqshwu gize weynun endimela
Akbroshal ena beqana gelila
Yeselam enat hoy selam libelsh
Zemene yifets’em samesegnsh

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 4
CHORUS
Beselamta dimts’sh menfes temelche
Adegdge liqum ejochen zergche
Beabiy qal ch’ohe limeskr bebrtu

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 5
Kidist Dingil Maryamn yeEgziabher enatu
CHORUS
Kesemay sigegn new anchin mawedes
Sigelet’ sifeqed kemenfes Kidus

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 6
Maryam hiywete nesh miknyat lemedane
Bizu newu mist’iru anchin mamesgene

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simishin-siteraw-dinigil'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 1
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራዉ ማርያም
ትዉልድ ነኝ እና ልጅሽ የፈጠረኝ

VERSE 2
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዚአብሔር በአባቶቼ ጸጋ
ሰአሊለነ እላለሁ ሲመሽም ሲነጋ

VERSE 3
በጠየቅሽዉ ግዜ ወይኑን እንዲመላ
አክብሮሻል እና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈጸም ሳመሰግንሽ

VERSE 4
በሰላምታ ድምጽሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በዐቢይ ቃል ጮሄ ልመስክር በብርቱ

VERSE 5
ቅድስት ድንግል ማርያምን የእግዚአብሔር እናቱ
ከሰማይ ሲገኝ ነው አንቺን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅዱስ

VERSE 6
ማርያም ሕይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነዉ ምስጢሩ አንቺን ማመስገኔ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 1
Landebete mar new lelbe selam
Simshn sit’erawu Maryam
Tiwuld negn ena lijsh yefet’eregn

VERSE 2
Dingil Emebete lanchi misgana alegn
Befeqade Egziabher beabatoche ts’ega
Sealilene elalehu simeshm sinega

VERSE 3
Bet’eyeqshwu gize weynun endimela
Akbroshal ena beqana gelila
Yeselam enat hoy selam libelsh
Zemene yifets’em samesegnsh

VERSE 4
Beselamta dimts’sh menfes temelche
Adegdge liqum ejochen zergche
Beabiy qal ch’ohe limeskr bebrtu

VERSE 5
Kidist Dingil Maryamn yeEgziabher enatu
Kesemay sigegn new anchin mawedes
Sigelet’ sifeqed kemenfes Kidus

VERSE 6
Maryam hiywete nesh miknyat lemedane
Bizu newu mist’iru anchin mamesgene'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simishin-siteraw-dinigil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Simishin Teriche (simishin-teriche)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simishin-teriche'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 1
።።።።።።።።።አዝ።።።።።።።።።።።።።
ጨለማ ውጦኝ በጠላት ሀገር
ለዘመናትም ስረገጥ ስኖር
ዲያቢሎስ ማርኮ ሲያሰቃየኝ

VERSE 2
የአለሙን መድን ወለድሽልኝ
ከአባቶች እርስት ከሀገር ወጥቼ
በአሕዛብ ሀገር ስኖር ተሽጬ
ደርሰሽ አፅናንተሽ አከበርሽኝ

VERSE 3
ብቸኝነቴን አስረሳሽኝ
።።።።።።።።።አዝ።።።።።።።።።።።።።
ድንኩዋኑ ሞልቶ ሰው ታድሞ
አስተናባሪው በጭንቀት ቆሞ

VERSE 4
ምን አቀርባለው ብዬ ስቸገር
ምልጃሽ ደርሶልኝ ዳንኩኝ ከማፈር
ያሰብኩት ሀሳብ ደመና ሆኖ
ቢበተንብኝ እንደ ጉም ተኖ

VERSE 5
ይሆናል ያልኩት ሳይሆን ቢቀርም
በእማምላክ እኔስ ተስፍም አልቆርጥም
።።።።።።።።።አዝ።።።።።።።።።።።።።
እናት አባቴ ባያስታውሱኝ

VERSE 6
ይቺ አለም ንቃ ገፍታ ብታየኝ
አንቺ ካለሽኝ ምን እሆናለው
አውሎንፍሱን ባህሩን አልፍለው
ጠላቴ ደርሶ ቢያንገላታኝ

VERSE 7
መከራ አብዝቶ ቢያሰቃየኝ
አላቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና
።።።።።።።።።አዝ።።።።።።።።።።።።።

VERSE 8
ክፍዎች ደርሰው ቢዝቱብኝ
አንቺን መውደዴን አያስተውኝ
በአሕዛብ መሀል ስምሽን ስጠራ
መከታ ሁኚኝ እናቴ አደራ

VERSE 9
ጠላቴ ደርሶ ቢያንገላታኝ
መከራ አብዝቶ ቢያስጨንቀኝ
አልአቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 1
.........az.............
Ch’elema wit’ogn bet’elat heger
Lezemenatm sireget’ sinor
Diyabilos marko siyaseqayegn

VERSE 2
Yealemun medn weledshlgn
Keabatoch erst keheger wet’che
Beahzab heger sinor teshch’e
Dersesh ats’nantesh akebershgn

VERSE 3
Bichegnneten asresashgn
.........az.............
Dinkuwanu molto sew tadmo
Astenabariw bech’nqet qomo

VERSE 4
Min aqerbalew biye sicheger
Miljash dersolgn dankugn kemafer
Yasebkut hesab demena hono
Bibetenbgn ende gum teno

VERSE 5
Yihonal yalkut sayhon biqerm
Beemamlak enes tesfm alqort’m
.........az.............
Enat abate bayastawsugn

VERSE 6
Yichi alem niqa gefta bitayegn
Anchi kaleshgn min ehonalew
Awlonfsun bahrun alflew
T’elate derso biyangelatagn

VERSE 7
Mekera abzto biyaseqayegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena
.........az.............

VERSE 8
Kifwoch dersew biztubgn
Anchin mewdeden ayastewgn
Beahzab mehel simshn sit’era
Meketa hugnign enate adera

VERSE 9
T’elate derso biyangelatagn
Mekera abzto biyasch’enqegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simishin-teriche', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Simishin Teriche (simishin-teriche-2qdc-airmrk)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simishin-teriche-2qdc-airmrk'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 1
።።።።።።።።።አዝ።።።።።።።።።።።።።
ጨለማ ውጦኝ በጠላት ሀገር
ለዘመናትም ስረገጥ ስኖር
ዲያቢሎስ ማርኮ ሲያሰቃየኝ

VERSE 2
የአለሙን መድን ወለድሽልኝ
ከአባቶች እርስት ከሀገር ወጥቼ
በአሕዛብ ሀገር ስኖር ተሽጬ
ደርሰሽ አፅናንተሽ አከበርሽኝ

VERSE 3
ብቸኝነቴን አስረሳሽኝ
።።።።።።።።።አዝ።።።።።።።።።።።።።
ድንኩዋኑ ሞልቶ ሰው ታድሞ
አስተናባሪው በጭንቀት ቆሞ

VERSE 4
ምን አቀርባለው ብዬ ስቸገር
ምልጃሽ ደርሶልኝ ዳንኩኝ ከማፈር
ያሰብኩት ሀሳብ ደመና ሆኖ
ቢበተንብኝ እንደ ጉም ተኖ

VERSE 5
ይሆናል ያልኩት ሳይሆን ቢቀርም
በእማምላክ እኔስ ተስፍም አልቆርጥም
።።።።።።።።።አዝ።።።።።።።።።።።።።
እናት አባቴ ባያስታውሱኝ

VERSE 6
ይቺ አለም ንቃ ገፍታ ብታየኝ
አንቺ ካለሽኝ ምን እሆናለው
አውሎንፍሱን ባህሩን አልፍለው
ጠላቴ ደርሶ ቢያንገላታኝ

VERSE 7
መከራ አብዝቶ ቢያሰቃየኝ
አላቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና
።።።።።።።።።አዝ።።።።።።።።።።።።።

VERSE 8
ክፍዎች ደርሰው ቢዝቱብኝ
አንቺን መውደዴን አያስተውኝ
በአሕዛብ መሀል ስምሽን ስጠራ
መከታ ሁኚኝ እናቴ አደራ

VERSE 9
ጠላቴ ደርሶ ቢያንገላታኝ
መከራ አብዝቶ ቢያስጨንቀኝ
አልአቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 1
.........az.............
Ch’elema wit’ogn bet’elat heger
Lezemenatm sireget’ sinor
Diyabilos marko siyaseqayegn

VERSE 2
Yealemun medn weledshlgn
Keabatoch erst keheger wet’che
Beahzab heger sinor teshch’e
Dersesh ats’nantesh akebershgn

VERSE 3
Bichegnneten asresashgn
.........az.............
Dinkuwanu molto sew tadmo
Astenabariw bech’nqet qomo

VERSE 4
Min aqerbalew biye sicheger
Miljash dersolgn dankugn kemafer
Yasebkut hesab demena hono
Bibetenbgn ende gum teno

VERSE 5
Yihonal yalkut sayhon biqerm
Beemamlak enes tesfm alqort’m
.........az.............
Enat abate bayastawsugn

VERSE 6
Yichi alem niqa gefta bitayegn
Anchi kaleshgn min ehonalew
Awlonfsun bahrun alflew
T’elate derso biyangelatagn

VERSE 7
Mekera abzto biyaseqayegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena
.........az.............

VERSE 8
Kifwoch dersew biztubgn
Anchin mewdeden ayastewgn
Beahzab mehel simshn sit’era
Meketa hugnign enate adera

VERSE 9
T’elate derso biyangelatagn
Mekera abzto biyasch’enqegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simishin-teriche-2qdc-airmrk', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Simishin Teriche Meche Afiralew (simishin-teriche-meche-afiralew)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'simishin-teriche-meche-afiralew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 1
።።።።።።።።።አዝ።።።።።።።።።።።።።
ጨለማ ውጦኝ በጠላት ሀገር
ለዘመናትም ስረገጥ ስኖር
ዲያቢሎስ ማርኮ ሲያሰቃየኝ

VERSE 2
የአለሙን መድን ወለድሽልኝ
ከአባቶች እርስት ከሀገር ወጥቼ
በአሕዛብ ሀገር ስኖር ተሽጬ
ደርሰሽ አፅናንተሽ አከበርሽኝ

VERSE 3
ብቸኝነቴን አስረሳሽኝ
።።።።።።።።።አዝ።።።።።።።።።።።።።
ድንኩዋኑ ሞልቶ ሰው ታድሞ
አስተናባሪው በጭንቀት ቆሞ

VERSE 4
ምን አቀርባለው ብዬ ስቸገር
ምልጃሽ ደርሶልኝ ዳንኩኝ ከማፈር
ያሰብኩት ሀሳብ ደመና ሆኖ
ቢበተንብኝ እንደ ጉም ተኖ

VERSE 5
ይሆናል ያልኩት ሳይሆን ቢቀርም
በእማምላክ እኔስ ተስፍም አልቆርጥም
።።።።።።።።።አዝ።።።።።።።።።።።።።
እናት አባቴ ባያስታውሱኝ

VERSE 6
ይቺ አለም ንቃ ገፍታ ብታየኝ
አንቺ ካለሽኝ ምን እሆናለው
አውሎንፍሱን ባህሩን አልፍለው
ጠላቴ ደርሶ ቢያንገላታኝ

VERSE 7
መከራ አብዝቶ ቢያሰቃየኝ
አላቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና
።።።።።።።።።አዝ።።።።።።።።።።።።።

VERSE 8
ክፍዎች ደርሰው ቢዝቱብኝ
አንቺን መውደዴን አያስተውኝ
በአሕዛብ መሀል ስምሽን ስጠራ
መከታ ሁኚኝ እናቴ አደራ

VERSE 9
ጠላቴ ደርሶ ቢያንገላታኝ
መከራ አብዝቶ ቢያስጨንቀኝ
አልአቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 1
.........az.............
Ch’elema wit’ogn bet’elat heger
Lezemenatm sireget’ sinor
Diyabilos marko siyaseqayegn

VERSE 2
Yealemun medn weledshlgn
Keabatoch erst keheger wet’che
Beahzab heger sinor teshch’e
Dersesh ats’nantesh akebershgn

VERSE 3
Bichegnneten asresashgn
.........az.............
Dinkuwanu molto sew tadmo
Astenabariw bech’nqet qomo

VERSE 4
Min aqerbalew biye sicheger
Miljash dersolgn dankugn kemafer
Yasebkut hesab demena hono
Bibetenbgn ende gum teno

VERSE 5
Yihonal yalkut sayhon biqerm
Beemamlak enes tesfm alqort’m
.........az.............
Enat abate bayastawsugn

VERSE 6
Yichi alem niqa gefta bitayegn
Anchi kaleshgn min ehonalew
Awlonfsun bahrun alflew
T’elate derso biyangelatagn

VERSE 7
Mekera abzto biyaseqayegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena
.........az.............

VERSE 8
Kifwoch dersew biztubgn
Anchin mewdeden ayastewgn
Beahzab mehel simshn sit’era
Meketa hugnign enate adera

VERSE 9
T’elate derso biyangelatagn
Mekera abzto biyasch’enqegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'simishin-teriche-meche-afiralew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sinegirush Semi Nesh (sinegirush-semi-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 1
በመከራ ላለው ሁኚለት መፅናኛ
ዕንባውን አብሽው አይዘን ዳግመኛ ጉድለቱን ሙይለት በፈረሰው ቆመሽ ስለምታስምሪ በልዩ ኪዳንሽ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 2
አዝ
ይበጠስ የእጁ የወህኒው ሠንሠለት
የሞቱ ደብዳቤ ይቀየር በሕይወት
አዲስ ተስፋ ሞልተሽ አዲስ ሠው አድርጊው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 3
መቅበዝበዙን ይርሣ ድንግል አረጋጊው
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 4
በዕንባ የመጣው ይመለስ በደስታ
መጠማቱ ይቅር ይሞላ በርካታ
ስዕለቱ ሰምሮለት ይቁም ለምስጋና
የአብራኩን ክፋይ አሣቅፊው እና

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 5
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ
ተይዞ ለሚኖር በአልጋ ቁራኛ

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 6
እርጂው እመቤቴ የደዌውን ዳኛ
መንገርስ ላንቺ ነው መማፀን ወዳንቺ
ተስፋን ለምትቀጥይ ህልምን ለምትፈቺ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 7
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት',
      lyrics_transliteration = 'CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 1
Bemekera lalew hugnilet mets’nagna
Enbawn abshw ayzen dagmegna gudletun muylet beferesew qomesh silemtasmri belyu kidansh
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 2
CHORUS
Yibet’es yeeju yewehniw senselet
Yemotu debdabe yiqeyer behywet
Adis tesfa moltesh adis sew adrgiw

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 3
Meqbezbezun yirsa Dingil aregagiw
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new
CHORUS

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 4
Beenba yemet’aw yimeles bedesta
Met’ematu yiqr yimola berkata
Sieletu semrolet yiqum lemsgana
Yeabrakun kifay asaqfiw ena

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 5
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new
CHORUS
Teyzo leminor bealga quragna

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 6
Erjiw Emebete yedewewn dagna
Mengers lanchi new memats’en wedanchi
Tesfan lemtqet’y hilmn lemtfechi
Kekidanm belay kidansh liyu new

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 7
Enate yemilsh amlaksh lijsh new

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sinegirush-semi-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 1
በመከራ ላለው ሁኚለት መፅናኛ
ዕንባውን አብሽው አይዘን ዳግመኛ ጉድለቱን ሙይለት በፈረሰው ቆመሽ ስለምታስምሪ በልዩ ኪዳንሽ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

VERSE 2
ይበጠስ የእጁ የወህኒው ሠንሠለት
የሞቱ ደብዳቤ ይቀየር በሕይወት
አዲስ ተስፋ ሞልተሽ አዲስ ሠው አድርጊው

VERSE 3
መቅበዝበዙን ይርሣ ድንግል አረጋጊው
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

VERSE 4
በዕንባ የመጣው ይመለስ በደስታ
መጠማቱ ይቅር ይሞላ በርካታ
ስዕለቱ ሰምሮለት ይቁም ለምስጋና
የአብራኩን ክፋይ አሣቅፊው እና

VERSE 5
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
ተይዞ ለሚኖር በአልጋ ቁራኛ

VERSE 6
እርጂው እመቤቴ የደዌውን ዳኛ
መንገርስ ላንቺ ነው መማፀን ወዳንቺ
ተስፋን ለምትቀጥይ ህልምን ለምትፈቺ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው

VERSE 7
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 1
Bemekera lalew hugnilet mets’nagna
Enbawn abshw ayzen dagmegna gudletun muylet beferesew qomesh silemtasmri belyu kidansh
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new

VERSE 2
Yibet’es yeeju yewehniw senselet
Yemotu debdabe yiqeyer behywet
Adis tesfa moltesh adis sew adrgiw

VERSE 3
Meqbezbezun yirsa Dingil aregagiw
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new

VERSE 4
Beenba yemet’aw yimeles bedesta
Met’ematu yiqr yimola berkata
Sieletu semrolet yiqum lemsgana
Yeabrakun kifay asaqfiw ena

VERSE 5
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new
Teyzo leminor bealga quragna

VERSE 6
Erjiw Emebete yedewewn dagna
Mengers lanchi new memats’en wedanchi
Tesfan lemtqet’y hilmn lemtfechi
Kekidanm belay kidansh liyu new

VERSE 7
Enate yemilsh amlaksh lijsh new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sinegirush-semi-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sisemaw Yadekut (sisemaw-yadekut)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 1
አስረጂ አልፈልግም ስላቺ ሚነገረኝ
ኪዳንሽ ያገዘኝ እኔው ምስክር ነኝ
በሹክሹክታ ድምጸት ምስጥሬን ነግሬሽ
ጉድለቴን ሞልተሻል ለልጅሽ አሳስበሽ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 2
መች አፈርኩኝ ድንግል በስምሽ ታምኜ
መቅረቢያዬ እኮ ነሸ ከልጅሸ ከአዳኜ
በማህጸንሽ ፍሬ በሰጠሽኝ መና
ነፍሴ ለምልማለች ይድረስሽ ምስጋና

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 3
መንበረ ልዑል ነሽ ለቃሉ ማህደር
እናት ሳለሽ ድንግል እመ እግዚአብሔር
መተኪያ የሌለሸ ከፍጥረት ብቸኛ
ምክንያተ ድሂን መመኪያችን የእኛ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 4
በዘመን ፍጻሜ በመምጫው ዋዜማ
በመልአኩ ገብርኤል የምስራች ዜማ
በልብሽ ይሁንታ በጸናች እምነትሽ
አለሙ ተጽናንቷል በወለድሽው ልጅሽ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 5
የዜማዬ ጣዕም የስንኜ ጉልበት
ስምሽ ነዉ እመ አምላክ የመዝሙሬ ዉበት

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ',
      lyrics_transliteration = 'CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 1
Asreji alfelgm silachi minegeregn
Kidansh yagezegn enew miskr negn
Beshukshukta dimts’et mist’ren negresh
Gudleten molteshal leljsh asasbesh

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 2
Mech aferkugn Dingil besmsh tamgne
Meqrebiyaye eko neshe keljshe keadagne
Bemahts’ensh fire beset’eshgn mena
Nefse lemlmalech yidressh misgana

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 3
Menbere liul nesh leqalu mahder
Enat salesh Dingil eme Egziabher
Metekiya yeleleshe keft’ret bichegna
Miknyate dihin memekiyachn yeegna

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 4
Bezemen fits’ame bememch’aw wazema
Bemelaku Gebriel yemsrach zema
Belbsh yihunta bets’enach emnetsh
Alemu tets’nantwal beweledshw lijsh

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 5
Yezemaye t’aem yesngne gulbet
Simsh newu eme amlak yemezmure wubet

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sisemaw-yadekut'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 1
አስረጂ አልፈልግም ስላቺ ሚነገረኝ
ኪዳንሽ ያገዘኝ እኔው ምስክር ነኝ
በሹክሹክታ ድምጸት ምስጥሬን ነግሬሽ
ጉድለቴን ሞልተሻል ለልጅሽ አሳስበሽ

VERSE 2
መች አፈርኩኝ ድንግል በስምሽ ታምኜ
መቅረቢያዬ እኮ ነሸ ከልጅሸ ከአዳኜ
በማህጸንሽ ፍሬ በሰጠሽኝ መና
ነፍሴ ለምልማለች ይድረስሽ ምስጋና

VERSE 3
መንበረ ልዑል ነሽ ለቃሉ ማህደር
እናት ሳለሽ ድንግል እመ እግዚአብሔር
መተኪያ የሌለሸ ከፍጥረት ብቸኛ
ምክንያተ ድሂን መመኪያችን የእኛ

VERSE 4
በዘመን ፍጻሜ በመምጫው ዋዜማ
በመልአኩ ገብርኤል የምስራች ዜማ
በልብሽ ይሁንታ በጸናች እምነትሽ
አለሙ ተጽናንቷል በወለድሽው ልጅሽ

VERSE 5
የዜማዬ ጣዕም የስንኜ ጉልበት
ስምሽ ነዉ እመ አምላክ የመዝሙሬ ዉበት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 1
Asreji alfelgm silachi minegeregn
Kidansh yagezegn enew miskr negn
Beshukshukta dimts’et mist’ren negresh
Gudleten molteshal leljsh asasbesh

VERSE 2
Mech aferkugn Dingil besmsh tamgne
Meqrebiyaye eko neshe keljshe keadagne
Bemahts’ensh fire beset’eshgn mena
Nefse lemlmalech yidressh misgana

VERSE 3
Menbere liul nesh leqalu mahder
Enat salesh Dingil eme Egziabher
Metekiya yeleleshe keft’ret bichegna
Miknyate dihin memekiyachn yeegna

VERSE 4
Bezemen fits’ame bememch’aw wazema
Bemelaku Gebriel yemsrach zema
Belbsh yihunta bets’enach emnetsh
Alemu tets’nantwal beweledshw lijsh

VERSE 5
Yezemaye t’aem yesngne gulbet
Simsh newu eme amlak yemezmure wubet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sisemaw-yadekut', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Smki-Xewie (smki-xewie)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)

VERSE 1
ጸላኢ መጺኡ ኪቃወመኒ
ንብዙሑ ዘመን ከሸግረኒ
ሰይጣን ማርኩ ከሳቅየኒ
ወላዲተ ኣምላክ ኣደ ኣላትኒ

CHORUS
ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)

VERSE 2
ናይ ለውሃት ኣደ ናይ ፍቅሪ ኣርኣያ
ናይ ድኩም ዘራይ ድንግል ንሳያ
ሓጥእ ኢካ ኢላ ኣይትንዕቀንን
ንዓኣ ሕዘስ ገለ ኣይከውንን

CHORUS
ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)

VERSE 3
መርዓ ምስ ኮነ ሰብ ምስ መልአ
ዝቅረብ ሽሻይ ምስ ተወድአ
እንታይ ክቅርብ ኢሉ ክሽገር
ንዓኪ ሒዙ ግና ኣይሓፈረን

CHORUS
ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)

VERSE 4
ጎይታ ሰሚዑ ንልማኖኪ
ባህ እንዳበሎ ትርህራሄኪ
ነቲ ጽሩይ ማይ ብተአምራት
ወይኒ ገበሮ ብከሃልነት

CHORUS
ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)

VERSE 5
በዓልቲ ግርማ ድንግል ኣደ ጎይታ
ምክንያት ምድሓን ናይ ኣዳም ተስፋ
ስምኪ ክጽውዕ ኣብ ግዜ ሓዘነይ
ምሳይ ልገቢ እምባ ጽዮን ጸግዐይ

CHORUS
ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)

VERSE 6
መታን ከይጠፍእ ዘክታም ከይከውን
እግዚአብሔር ስቅ ኣይበለንን
ኣምላክ ይመስገን ዕድል ኣሎኒ
ወላዲተ ኣምላክ ኣደ ኣላትኒ

CHORUS
ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)

VERSE 7
መርዓ ምስ ኮነ ሰብ ምስ መልአ
ዝቅረብ ሽሻይ ምስ ተወድአ
እንታይ ክቅርብ ኢሉ ክሽገር
ንዓኪ ሒዙ ግና ኣይሓፈረን

CHORUS
ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)

VERSE 8
ጎይታ ሰሚዑ ንልማኖኪ
ባህ እንዳበሎ ትርህራሄኪ
ነቲ ጽሩይ ማይ ብተአምራት
ወይኒ ገበሮ ብከሃልነት

CHORUS
ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)',
      lyrics_transliteration = 'CHORUS
Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)

VERSE 1
Ts’elai mets’iu kiqawemeni
Nibzuhu zemen keshegreni
Seyt’an marku kesaqyeni
Weladite amlak ade alatni

CHORUS
Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)

VERSE 2
Nay lewhat ade nay fiqri araya
Nay dikum zeray Dingil nisaya
Hat’e ika ila aytneqenn
Niaa hizes gele aykewnn

CHORUS
Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)

VERSE 3
Mera mis kone seb mis mela
Ziqreb shshay mis teweda
Entay kiqrb ilu kishger
Niaki hizu gina ayhaferen

CHORUS
Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)

VERSE 4
Goyta semiu nilmanoki
Bah endabelo tirhraheki
Neti ts’ruy may biteamrat
Weyni gebero bikehalnet

CHORUS
Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)

VERSE 5
Bealti girma Dingil ade goyta
Miknyat midhan nay adam tesfa
Simki kits’we ab gize hazeney
Misay ligebi emba ts’yon ts’egay

CHORUS
Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)

VERSE 6
Metan keyt’efe zektam keykewn
Egziabher siq aybelenn
Amlak yemesgen edl aloni
Weladite amlak ade alatni

CHORUS
Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)

VERSE 7
Mera mis kone seb mis mela
Ziqreb shshay mis teweda
Entay kiqrb ilu kishger
Niaki hizu gina ayhaferen

CHORUS
Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)

VERSE 8
Goyta semiu nilmanoki
Bah endabelo tirhraheki
Neti ts’ruy may biteamrat
Weyni gebero bikehalnet

CHORUS
Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'smki-xewie'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምኪ ጸዊዐ መዓስ ሓፊረ
ማርያም ኢለ ኣበይ ወዲቐ
ስምኪ ኢዩ''ሞ ስንቂ ኮይኑኒ
እንሆ ምስጋናይ ተቐበልኒ(2)

VERSE 1
ጸላኢ መጺኡ ኪቃወመኒ
ንብዙሑ ዘመን ከሸግረኒ
ሰይጣን ማርኩ ከሳቅየኒ
ወላዲተ ኣምላክ ኣደ ኣላትኒ

VERSE 2
ናይ ለውሃት ኣደ ናይ ፍቅሪ ኣርኣያ
ናይ ድኩም ዘራይ ድንግል ንሳያ
ሓጥእ ኢካ ኢላ ኣይትንዕቀንን
ንዓኣ ሕዘስ ገለ ኣይከውንን

VERSE 3
መርዓ ምስ ኮነ ሰብ ምስ መልአ
ዝቅረብ ሽሻይ ምስ ተወድአ
እንታይ ክቅርብ ኢሉ ክሽገር
ንዓኪ ሒዙ ግና ኣይሓፈረን

VERSE 4
ጎይታ ሰሚዑ ንልማኖኪ
ባህ እንዳበሎ ትርህራሄኪ
ነቲ ጽሩይ ማይ ብተአምራት
ወይኒ ገበሮ ብከሃልነት

VERSE 5
በዓልቲ ግርማ ድንግል ኣደ ጎይታ
ምክንያት ምድሓን ናይ ኣዳም ተስፋ
ስምኪ ክጽውዕ ኣብ ግዜ ሓዘነይ
ምሳይ ልገቢ እምባ ጽዮን ጸግዐይ

VERSE 6
መታን ከይጠፍእ ዘክታም ከይከውን
እግዚአብሔር ስቅ ኣይበለንን
ኣምላክ ይመስገን ዕድል ኣሎኒ
ወላዲተ ኣምላክ ኣደ ኣላትኒ

VERSE 7
መርዓ ምስ ኮነ ሰብ ምስ መልአ
ዝቅረብ ሽሻይ ምስ ተወድአ
እንታይ ክቅርብ ኢሉ ክሽገር
ንዓኪ ሒዙ ግና ኣይሓፈረን

VERSE 8
ጎይታ ሰሚዑ ንልማኖኪ
ባህ እንዳበሎ ትርህራሄኪ
ነቲ ጽሩይ ማይ ብተአምራት
ወይኒ ገበሮ ብከሃልነት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simki ts’ewia meas hafire
Maryam ile abey wediቐ
Simki iyu''mo sinqi koynuni
Enho misganay teቐbelni (2)

VERSE 1
Ts’elai mets’iu kiqawemeni
Nibzuhu zemen keshegreni
Seyt’an marku kesaqyeni
Weladite amlak ade alatni

VERSE 2
Nay lewhat ade nay fiqri araya
Nay dikum zeray Dingil nisaya
Hat’e ika ila aytneqenn
Niaa hizes gele aykewnn

VERSE 3
Mera mis kone seb mis mela
Ziqreb shshay mis teweda
Entay kiqrb ilu kishger
Niaki hizu gina ayhaferen

VERSE 4
Goyta semiu nilmanoki
Bah endabelo tirhraheki
Neti ts’ruy may biteamrat
Weyni gebero bikehalnet

VERSE 5
Bealti girma Dingil ade goyta
Miknyat midhan nay adam tesfa
Simki kits’we ab gize hazeney
Misay ligebi emba ts’yon ts’egay

VERSE 6
Metan keyt’efe zektam keykewn
Egziabher siq aybelenn
Amlak yemesgen edl aloni
Weladite amlak ade alatni

VERSE 7
Mera mis kone seb mis mela
Ziqreb shshay mis teweda
Entay kiqrb ilu kishger
Niaki hizu gina ayhaferen

VERSE 8
Goyta semiu nilmanoki
Bah endabelo tirhraheki
Neti ts’ruy may biteamrat
Weyni gebero bikehalnet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'smki-xewie', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sobe Semaene Zenake (sobe-semaene-zenake)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 1
ልጅም ተሰጠን ሕፃን ተወለደ
አስጨናቂዉ ዘመን በእርሱ ተወገደ
ሰዉና መዋእክት በአንድነት ዘመሩ
የእግዚአብሔርን ክብር ለዓለም መሰከሩ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 2
ምስጋና በሰማይ ለእግዚአብሔር ይሁን
ሰላም ለሰዉ ልጆች በምድር ይስፈን
እናቲቱ ሰማይ ሕፃኗ ፀሐይ
እጅግ ደስ ይለናል ይህንን ስናይ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 3
በኮከብ ተመርተዉ ነገስታት ማለዱ
ለሕፃኑ ንጉስ በፍቅር ሰገዱ
ድንቅ መካር ኃያል የሰላም አለቃ
ጌታ ሆይ በስምህ ግዞቱ አበቃ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 4
ሰላምን የሚሠጥ አልፋና ኦሜጋ
የእስራኤል ንጉስ ተገልጦአል በሥጋ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ',
      lyrics_transliteration = 'CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 1
Lijm teset’en hits’an tewelede
Asch’enaqiwu zemen beersu tewegede
Sewuna mewaekt beandnet zemeru
Yeegziabhern kibir lealem mesekeru

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 2
Misgana besemay leEgziabher yihun
Selam lesewu lijoch bemdr yisfen
Enatitu semay hits’anwa ts’ehey
Ejg des yilenal yihnn sinay

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 3
Bekokeb temertewu negestat maledu
Lehts’anu nigus befqr segedu
Dinq mekar hayal yeselam aleqa
Geta hoy besmh gizotu abeqa

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 4
Selamn yemiset’ alfana omega
Yeesrael nigus tegelt’oal besga

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sobe-semaene-zenake'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 1
ልጅም ተሰጠን ሕፃን ተወለደ
አስጨናቂዉ ዘመን በእርሱ ተወገደ
ሰዉና መዋእክት በአንድነት ዘመሩ
የእግዚአብሔርን ክብር ለዓለም መሰከሩ

VERSE 2
ምስጋና በሰማይ ለእግዚአብሔር ይሁን
ሰላም ለሰዉ ልጆች በምድር ይስፈን
እናቲቱ ሰማይ ሕፃኗ ፀሐይ
እጅግ ደስ ይለናል ይህንን ስናይ

VERSE 3
በኮከብ ተመርተዉ ነገስታት ማለዱ
ለሕፃኑ ንጉስ በፍቅር ሰገዱ
ድንቅ መካር ኃያል የሰላም አለቃ
ጌታ ሆይ በስምህ ግዞቱ አበቃ

VERSE 4
ሰላምን የሚሠጥ አልፋና ኦሜጋ
የእስራኤል ንጉስ ተገልጦአል በሥጋ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 1
Lijm teset’en hits’an tewelede
Asch’enaqiwu zemen beersu tewegede
Sewuna mewaekt beandnet zemeru
Yeegziabhern kibir lealem mesekeru

VERSE 2
Misgana besemay leEgziabher yihun
Selam lesewu lijoch bemdr yisfen
Enatitu semay hits’anwa ts’ehey
Ejg des yilenal yihnn sinay

VERSE 3
Bekokeb temertewu negestat maledu
Lehts’anu nigus befqr segedu
Dinq mekar hayal yeselam aleqa
Geta hoy besmh gizotu abeqa

VERSE 4
Selamn yemiset’ alfana omega
Yeesrael nigus tegelt’oal besga'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sobe-semaene-zenake', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sobe Tezekerineha Letsiyon (sobe-tezekerineha-letsiyon)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 1
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 2
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ
/አዝ
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 3
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 4
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 5
/አዝ
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 6
ባቢሎንን አሻገረ የማረኩንን በትኖ
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 7
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 8
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 9
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 10
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ',
      lyrics_transliteration = 'CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 1
Enziratine seqelne wiste kwihatiha
Basebnat gize ts’yonn
Basebnat gize ityop’yann
Bebabilon wenzoch at’egeb

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 2
Teqemt’en aleqesn
Mesenqoachnn seqeln bezafochwa lay
/az
Ts’nu mekeran teqebeln tech’eneqn befetena

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 3
Yedewe mot belayachn endeznab werdwalna
Ahzabm zebetubn endih bilew beyetera
Zemrulet leamlakachhu biyadnachhu kemekera
Egziabher ts’yonn bemengstu mert’watal ena

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 4
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 5
/az
Yemarekun bet’orachew behaylachew yetemeku
Bets’yon dej yalefrhat yets’yonn kibrwan neku
Yihn yaye kelay hono bedemena teshefno

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 6
Babilonn ashagere yemarekunn betno
Egziabher ts’yonn lemengstu mert’watal ena
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 7
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan
/az
Sigachnn yigel zend yemot t’la biyat’elam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 8
Enalfalen hulun banchi
Yeamlak enat Dingil Maryam
Kidist hoy kebarekshn
Endnalen kedeweyachn

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 9
Lesgana lenebsachn medhanit nesh enatachn
Egziabher ts’yonn bemengstu mert’watalna
Maderiyaw tihonew zend wedwatalna
Ts’yon hoy enatachn Kidist Dingil Maryam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 10
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sobe-tezekerineha-letsiyon'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 1
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ

VERSE 2
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ
/አዝ
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና

VERSE 3
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና

VERSE 4
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

VERSE 5
/አዝ
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ

VERSE 6
ባቢሎንን አሻገረ የማረኩንን በትኖ
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

VERSE 7
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም

VERSE 8
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን

VERSE 9
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

VERSE 10
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 1
Enziratine seqelne wiste kwihatiha
Basebnat gize ts’yonn
Basebnat gize ityop’yann
Bebabilon wenzoch at’egeb

VERSE 2
Teqemt’en aleqesn
Mesenqoachnn seqeln bezafochwa lay
/az
Ts’nu mekeran teqebeln tech’eneqn befetena

VERSE 3
Yedewe mot belayachn endeznab werdwalna
Ahzabm zebetubn endih bilew beyetera
Zemrulet leamlakachhu biyadnachhu kemekera
Egziabher ts’yonn bemengstu mert’watal ena

VERSE 4
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

VERSE 5
/az
Yemarekun bet’orachew behaylachew yetemeku
Bets’yon dej yalefrhat yets’yonn kibrwan neku
Yihn yaye kelay hono bedemena teshefno

VERSE 6
Babilonn ashagere yemarekunn betno
Egziabher ts’yonn lemengstu mert’watal ena
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam

VERSE 7
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan
/az
Sigachnn yigel zend yemot t’la biyat’elam

VERSE 8
Enalfalen hulun banchi
Yeamlak enat Dingil Maryam
Kidist hoy kebarekshn
Endnalen kedeweyachn

VERSE 9
Lesgana lenebsachn medhanit nesh enatachn
Egziabher ts’yonn bemengstu mert’watalna
Maderiyaw tihonew zend wedwatalna
Ts’yon hoy enatachn Kidist Dingil Maryam

VERSE 10
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sobe-tezekerineha-letsiyon', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sobe Tezekernaha Letsiyon (sobe-tezekernaha-letsiyon)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 1
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 2
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ
/አዝ
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 3
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 4
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 5
/አዝ
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 6
ባቢሎንን አሻገረ የማረኩንን በትኖ
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 7
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 8
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 9
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 10
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ',
      lyrics_transliteration = 'CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 1
Enziratine seqelne wiste kwihatiha
Basebnat gize ts’yonn
Basebnat gize ityop’yann
Bebabilon wenzoch at’egeb

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 2
Teqemt’en aleqesn
Mesenqoachnn seqeln bezafochwa lay
/az
Ts’nu mekeran teqebeln tech’eneqn befetena

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 3
Yedewe mot belayachn endeznab werdwalna
Ahzabm zebetubn endih bilew beyetera
Zemrulet leamlakachhu biyadnachhu kemekera
Egziabher ts’yonn bemengstu mert’watal ena

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 4
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 5
/az
Yemarekun bet’orachew behaylachew yetemeku
Bets’yon dej yalefrhat yets’yonn kibrwan neku
Yihn yaye kelay hono bedemena teshefno

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 6
Babilonn ashagere yemarekunn betno
Egziabher ts’yonn lemengstu mert’watal ena
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 7
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan
/az
Sigachnn yigel zend yemot t’la biyat’elam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 8
Enalfalen hulun banchi
Yeamlak enat Dingil Maryam
Kidist hoy kebarekshn
Endnalen kedeweyachn

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 9
Lesgana lenebsachn medhanit nesh enatachn
Egziabher ts’yonn bemengstu mert’watalna
Maderiyaw tihonew zend wedwatalna
Ts’yon hoy enatachn Kidist Dingil Maryam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 10
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sobe-tezekernaha-letsiyon'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 1
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ

VERSE 2
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ
/አዝ
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና

VERSE 3
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና

VERSE 4
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

VERSE 5
/አዝ
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ

VERSE 6
ባቢሎንን አሻገረ የማረኩንን በትኖ
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

VERSE 7
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም

VERSE 8
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን

VERSE 9
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

VERSE 10
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 1
Enziratine seqelne wiste kwihatiha
Basebnat gize ts’yonn
Basebnat gize ityop’yann
Bebabilon wenzoch at’egeb

VERSE 2
Teqemt’en aleqesn
Mesenqoachnn seqeln bezafochwa lay
/az
Ts’nu mekeran teqebeln tech’eneqn befetena

VERSE 3
Yedewe mot belayachn endeznab werdwalna
Ahzabm zebetubn endih bilew beyetera
Zemrulet leamlakachhu biyadnachhu kemekera
Egziabher ts’yonn bemengstu mert’watal ena

VERSE 4
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

VERSE 5
/az
Yemarekun bet’orachew behaylachew yetemeku
Bets’yon dej yalefrhat yets’yonn kibrwan neku
Yihn yaye kelay hono bedemena teshefno

VERSE 6
Babilonn ashagere yemarekunn betno
Egziabher ts’yonn lemengstu mert’watal ena
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam

VERSE 7
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan
/az
Sigachnn yigel zend yemot t’la biyat’elam

VERSE 8
Enalfalen hulun banchi
Yeamlak enat Dingil Maryam
Kidist hoy kebarekshn
Endnalen kedeweyachn

VERSE 9
Lesgana lenebsachn medhanit nesh enatachn
Egziabher ts’yonn bemengstu mert’watalna
Maderiyaw tihonew zend wedwatalna
Ts’yon hoy enatachn Kidist Dingil Maryam

VERSE 10
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sobe-tezekernaha-letsiyon', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Sobese (sobese)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sobese'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ

VERSE 1
ሶበሰ ይወርዱ መላእክት መላእክት ይወርዱ አው ወሊቃነ መላእክት ይበል ኧኸ
አልቦሙ ድምፅ ኧኸ ኧኸ ኧኸ ወአልቦ አሰር ለምክያዳት ይቀልል ሩፀቶሙ እምነፋሳት ውስተ ሃገሩ ለእግዚአብሔር ኢትዮጵያ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sobese yiwerdu melaekt melaekt yiwerdu aw weliqane melaekt yibel ኧኸ
Albomu dimts’ ኧኸ ኧኸ ኧኸ wealbo aser lemkyadat yiqell ruts’etomu emnefasat wiste hageru leEgziabher ityop’ya

VERSE 1
Sobese yiwerdu melaekt melaekt yiwerdu aw weliqane melaekt yibel ኧኸ
Albomu dimts’ ኧኸ ኧኸ ኧኸ wealbo aser lemkyadat yiqell ruts’etomu emnefasat wiste hageru leEgziabher ityop’ya'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'sobese', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: subscribe (subscribe)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 1
ዘወድቀ ውስተ ፍኖተ
ሲዘራ ያለቀው አእዋፈ ሰማይ
መሳጢ ነጠቀው
ዘወድቀ ዲበ ኮሕ

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 2
ጥልቅ አፈር ከሌለው
በደስታ እየሰማ በችግር የካደው
ዘወድቀ ውስተ ሶክ
ተጨንቆ እንዳይወጣ በአለም ትካዜ

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 3
በስፍጠተ ብዕል ታንቆ ፍሬ ያጣው
ውስተ ምድር ሰናይ
የወደቀም ነበር ዘወሀበ ፍሬ ሰምቶ የሚተገብር
ጌታዬ ከአራቱ ስፍራዎች በምሳሌ ካልከው

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 4
ወዴት ወድቆ ይሆን ከእኔ ልብ የላከው
እባክህ ጎተራ አበጅተህ ለአጨዳ ስትመጣ
ከፍሬያማው ክምር እድል እንዳላጣ
ከእሾህ ከጭንጫ ላይ ከመንገድ እንዳልቀር

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 5
ልቤ ልብ አግኝቶ በምግባር እንዲኖር
እራሴን መስማት ትቼ ለአንተ ፈቃድ ልደር
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 6
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)',
      lyrics_transliteration = 'CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 1
Zewedqe wiste finote
Sizera yaleqew aewafe semay
Mesat’i net’eqew
Zewedqe dibe koh

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 2
T’lq afer kelelew
Bedesta eyesema bechgr yekadew
Zewedqe wiste sok
Tech’enqo endaywet’a bealem tikaze

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 3
Besft’ete biel tanqo fire yat’aw
Wiste midr senay
Yewedeqem neber zewehebe fire semto yemitegebr
Getaye kearatu sifrawoch bemsale kalkew

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 4
Wedet wedqo yihon keene lib yelakew
Ebakh gotera abejteh leach’eda sitmet’a
Kefreyamaw kimr edl endalat’a
Keeshoh kech’nch’a lay kemenged endalqer

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 5
Libe lib aggnto bemgbar endinor
Erasen mesmat tiche leante feqad lider
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 6
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'subscribe'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 1
ዘወድቀ ውስተ ፍኖተ
ሲዘራ ያለቀው አእዋፈ ሰማይ
መሳጢ ነጠቀው
ዘወድቀ ዲበ ኮሕ

VERSE 2
ጥልቅ አፈር ከሌለው
በደስታ እየሰማ በችግር የካደው
ዘወድቀ ውስተ ሶክ
ተጨንቆ እንዳይወጣ በአለም ትካዜ

VERSE 3
በስፍጠተ ብዕል ታንቆ ፍሬ ያጣው
ውስተ ምድር ሰናይ
የወደቀም ነበር ዘወሀበ ፍሬ ሰምቶ የሚተገብር
ጌታዬ ከአራቱ ስፍራዎች በምሳሌ ካልከው

VERSE 4
ወዴት ወድቆ ይሆን ከእኔ ልብ የላከው
እባክህ ጎተራ አበጅተህ ለአጨዳ ስትመጣ
ከፍሬያማው ክምር እድል እንዳላጣ
ከእሾህ ከጭንጫ ላይ ከመንገድ እንዳልቀር

VERSE 5
ልቤ ልብ አግኝቶ በምግባር እንዲኖር
እራሴን መስማት ትቼ ለአንተ ፈቃድ ልደር
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)

VERSE 6
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 1
Zewedqe wiste finote
Sizera yaleqew aewafe semay
Mesat’i net’eqew
Zewedqe dibe koh

VERSE 2
T’lq afer kelelew
Bedesta eyesema bechgr yekadew
Zewedqe wiste sok
Tech’enqo endaywet’a bealem tikaze

VERSE 3
Besft’ete biel tanqo fire yat’aw
Wiste midr senay
Yewedeqem neber zewehebe fire semto yemitegebr
Getaye kearatu sifrawoch bemsale kalkew

VERSE 4
Wedet wedqo yihon keene lib yelakew
Ebakh gotera abejteh leach’eda sitmet’a
Kefreyamaw kimr edl endalat’a
Keeshoh kech’nch’a lay kemenged endalqer

VERSE 5
Libe lib aggnto bemgbar endinor
Erasen mesmat tiche leante feqad lider
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)

VERSE 6
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'subscribe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tabiswal Enibaye (tabiswal-enibaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 1
ነፍሴን ያስጨነቃት ያዘን ወላፍኑ
ማልቀስ ብቻ ሁኖ ዘወትር ስራዬ
ኣናግርሻለሁ ሁኜ ለብቻዬ//፪//
ድንግል ደርሽልኝ ህልሜን ፋታሽልኝ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 2
ኣልኩኝ ቀና ቀና ያም ቀን ኣለፈና
ኣዝማች
መቆሼሼን ኣይቶ ከሳሼ ቢከሰኝ
እማምላክ ግን ምልጃሽ ኣድስ ኣደርገኝ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 3
ነጩን ኣለበሽኝ ወርቃማውን በፍታ
እንዴት ዘነጋለሁ ያንችንስ ውለታ//፪//
በቀኙ ባትቆሚይ ጸሎቴን ባትሰሚይ
ኣይቀናም ጉዞዬ ጽልመት ነው ተስፋዬ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 4
ኣዝማች
እንደናት ኣባብለሽኣሳድገሽኛል
ኑሮዬ ሲጨልም ብርሀን ሁነሽኛል
የተማመንኩበት ሲሸሸኝ ወዳጄ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 5
ኣንች ግን ተገኜሽ በጓዳ በዴጄ//፪//
ኣፍራች በለሴ ተደሰተች ነፍሴ
ለምን ላቀርቅር ኣሁን ልዘምር
ኣዝማች

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 6
ትላንት ያዩኝ ሁሉ ዛሬ ይገርማሉ
እንዴት በግሩ ቆመ እየተባባሉ
ለሰው የማይቻል ለልጅሽ ተችሏል
እንዳያላፉት የለም ሁሉም ነገር አልፏል//፪//

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 7
ከቤቴ የማጠፊይ ችግሬን ምትቀርፊይ
እንድንችል ማን ኣለ ጭንቀትን የጣለ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ',
      lyrics_transliteration = 'CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 1
Nefsen yasch’eneqat yazen welafnu
Malqes bicha huno zewetr siraye
Anagrshalehu hugne lebchaye/ (2)/
Dingil dershlgn hilmen fatashlgn

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 2
Alkugn qena qena yam qen alefena
Azmach
Meqosheshen ayto kesashe bikesegn
Emamlak gin miljash ads adergegn

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 3
Nech’un alebeshgn werqamawn befta
Endet zenegalehu yanchns wileta/ (2)/
Beqegnu batqomiy ts’eloten batsemiy
Ayqenam guzoye ts’lmet new tesfaye

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 4
Azmach
Endenat abableshasadgeshgnal
Nuroye sich’elm birhen huneshgnal
Yetemamenkubet sisheshegn wedaje

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 5
Anch gin tegegnesh begwada bedeje/ (2)/
Afrach belese tedesetech nefse
Lemn laqerqr ahun lizemr
Azmach

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 6
Tilant yayugn hulu zare yigermalu
Endet begru qome eyetebabalu
Lesew yemaychal leljsh techlwal
Endayalafut yelem hulum neger alfwal/ (2)/

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 7
Kebete yemat’efiy chgren mitqerfiy
Endnchl man ale ch’nqetn yet’ale

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tabiswal-enibaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 1
ነፍሴን ያስጨነቃት ያዘን ወላፍኑ
ማልቀስ ብቻ ሁኖ ዘወትር ስራዬ
ኣናግርሻለሁ ሁኜ ለብቻዬ//፪//
ድንግል ደርሽልኝ ህልሜን ፋታሽልኝ

VERSE 2
ኣልኩኝ ቀና ቀና ያም ቀን ኣለፈና
ኣዝማች
መቆሼሼን ኣይቶ ከሳሼ ቢከሰኝ
እማምላክ ግን ምልጃሽ ኣድስ ኣደርገኝ

VERSE 3
ነጩን ኣለበሽኝ ወርቃማውን በፍታ
እንዴት ዘነጋለሁ ያንችንስ ውለታ//፪//
በቀኙ ባትቆሚይ ጸሎቴን ባትሰሚይ
ኣይቀናም ጉዞዬ ጽልመት ነው ተስፋዬ

VERSE 4
ኣዝማች
እንደናት ኣባብለሽኣሳድገሽኛል
ኑሮዬ ሲጨልም ብርሀን ሁነሽኛል
የተማመንኩበት ሲሸሸኝ ወዳጄ

VERSE 5
ኣንች ግን ተገኜሽ በጓዳ በዴጄ//፪//
ኣፍራች በለሴ ተደሰተች ነፍሴ
ለምን ላቀርቅር ኣሁን ልዘምር
ኣዝማች

VERSE 6
ትላንት ያዩኝ ሁሉ ዛሬ ይገርማሉ
እንዴት በግሩ ቆመ እየተባባሉ
ለሰው የማይቻል ለልጅሽ ተችሏል
እንዳያላፉት የለም ሁሉም ነገር አልፏል//፪//

VERSE 7
ከቤቴ የማጠፊይ ችግሬን ምትቀርፊይ
እንድንችል ማን ኣለ ጭንቀትን የጣለ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 1
Nefsen yasch’eneqat yazen welafnu
Malqes bicha huno zewetr siraye
Anagrshalehu hugne lebchaye/ (2)/
Dingil dershlgn hilmen fatashlgn

VERSE 2
Alkugn qena qena yam qen alefena
Azmach
Meqosheshen ayto kesashe bikesegn
Emamlak gin miljash ads adergegn

VERSE 3
Nech’un alebeshgn werqamawn befta
Endet zenegalehu yanchns wileta/ (2)/
Beqegnu batqomiy ts’eloten batsemiy
Ayqenam guzoye ts’lmet new tesfaye

VERSE 4
Azmach
Endenat abableshasadgeshgnal
Nuroye sich’elm birhen huneshgnal
Yetemamenkubet sisheshegn wedaje

VERSE 5
Anch gin tegegnesh begwada bedeje/ (2)/
Afrach belese tedesetech nefse
Lemn laqerqr ahun lizemr
Azmach

VERSE 6
Tilant yayugn hulu zare yigermalu
Endet begru qome eyetebabalu
Lesew yemaychal leljsh techlwal
Endayalafut yelem hulum neger alfwal/ (2)/

VERSE 7
Kebete yemat’efiy chgren mitqerfiy
Endnchl man ale ch’nqetn yet’ale'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tabiswal-enibaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tabor Abera (tabor-abera)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ታቦር አበራ ምድርን ከደናት ያ ደመና
እንቅልፍ የለንም ታላቅ ነጎድጕድ ሆኗልና
አነቃን ለምስጋና

VERSE 1
ሙሴም የቀደመው ሰዉ ኤልያስ ኃይለኛው
ተገኝተዋል በታቦር ምስክርህ ሆነው
እኛም ከገናናው ክብር ያባቱን ቃል ሰምተናል
በረዶ ሆኗል ልብሱ እፁብ እፁብ ብለናል

CHORUS
ታቦር አበራ ምድርን ከደናት ያ ደመና
እንቅልፍ የለንም ታላቅ ነጎድጕድ ሆኗልና
አነቃን ለምስጋና

VERSE 2
ቃል ገብተህልኝ ነበር ልታሳየኝ ክብርህን
ንገስ ከሞት ገስግሰህ አይቼሃለሁ አሁን
የእሳት ፈረሶች አሉህ ተዋጊው የኔ ጌታ
አርሞንኤም ደስ አለው ሲሳራን ስለመታ

CHORUS
ታቦር አበራ ምድርን ከደናት ያ ደመና
እንቅልፍ የለንም ታላቅ ነጎድጕድ ሆኗልና
አነቃን ለምስጋና

VERSE 3
እጠብቅሃለሁኝ በምታልፍበት ቆሜ
መብራቶቼን አብርቼ ነጩን ልብስ ተሸልሜ
የዳዊት ልጅ ሆይ ግባ ኢየሱስ ወደ ቤቴ
ጵንኤል እልሀለሁ ድናለች ሰውነቴ

CHORUS
ታቦር አበራ ምድርን ከደናት ያ ደመና
እንቅልፍ የለንም ታላቅ ነጎድጕድ ሆኗልና
አነቃን ለምስጋና

VERSE 4
ሁሉንም ብታከብር ሁሉንም ብትምረው
ማነው ቸርነትህን የሚከለክለው
ጠዋትም የተጠራ አምሽቶ የገባው
ሆነዋል ባለዋጋ ከበዛው ስጦታው

CHORUS
ታቦር አበራ ምድርን ከደናት ያ ደመና
እንቅልፍ የለንም ታላቅ ነጎድጕድ ሆኗልና
አነቃን ለምስጋና

VERSE 5
የረዳኸው ይናገር ያሰብከው በሕይወቱ
አቤነዘር እያለ ይዘምር ባንደበቱ
በደስታዬም ቀን አለህ አይሃለሁ ከጎኔ
ከእኔ ጋር አልቅሰሃል አሳዝኖህ ሀዘኔ

CHORUS
ታቦር አበራ ምድርን ከደናት ያ ደመና
እንቅልፍ የለንም ታላቅ ነጎድጕድ ሆኗልና
አነቃን ለምስጋና',
      lyrics_transliteration = 'CHORUS
Tabor Abera midren kedenat ya demena
Enkelf yelenem talak negodgud honewalna
Anekan lemesgana

VERSE 1
Musem yeqedemew sew Elias haylegnaw
Tegegntewal betabor mesekireh honew
Egnam ke genanaw keber yabatun qal semetenal
Beredo honewal lebsu etsub etsub belenal

CHORUS
Tabor Abera midren kedenat ya demena
Enkelf yelenem talak negodgud honewalna
Anekan lemesgana

VERSE 2
Qal gebtehelegn neber letasayegn kibrehen
Neges kemot gesegeseh ayichyahalew ahun
Yeesat feresoch aluh tewagiw yene geta
Armonem des alew Sisaran selemeta

CHORUS
Tabor Abera midren kedenat ya demena
Enkelf yelenem talak negodgud honewalna
Anekan lemesgana

VERSE 3
Etebqehalehugn bemitalefbet qome
Mebratochen abreche nechun lebs teshelme
Yedawit lej hoy geba Eyesus wede bete
Peniel elhalew denalech sewnete

CHORUS
Tabor Abera midren kedenat ya demena
Enkelf yelenem talak negodgud honewalna
Anekan lemesgana

VERSE 4
Hulunm betakeber hulunm betemerew
Manew cherenetehen yemikeleklew
Tewatm yetetera amsheto yegebaw
Honewal balewaga kebezaw setotaw

CHORUS
Tabor Abera midren kedenat ya demena
Enkelf yelenem talak negodgud honewalna
Anekan lemesgana

VERSE 5
Yeredehew yinagar yasebekew behiyewetu
Abenezer eyale yezemer bandebetu
Bedestayem qen aleh ayihalew kegone
Keene gar alqesehal asazenoh hazene

CHORUS
Tabor Abera midren kedenat ya demena
Enkelf yelenem talak negodgud honewalna
Anekan lemesgana',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tabor-abera'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ታቦር አበራ ምድርን ከደናት ያ ደመና
እንቅልፍ የለንም ታላቅ ነጎድጕድ ሆኗልና
አነቃን ለምስጋና

VERSE 1
ሙሴም የቀደመው ሰዉ ኤልያስ ኃይለኛው
ተገኝተዋል በታቦር ምስክርህ ሆነው
እኛም ከገናናው ክብር ያባቱን ቃል ሰምተናል
በረዶ ሆኗል ልብሱ እፁብ እፁብ ብለናል

VERSE 2
ቃል ገብተህልኝ ነበር ልታሳየኝ ክብርህን
ንገስ ከሞት ገስግሰህ አይቼሃለሁ አሁን
የእሳት ፈረሶች አሉህ ተዋጊው የኔ ጌታ
አርሞንኤም ደስ አለው ሲሳራን ስለመታ

VERSE 3
እጠብቅሃለሁኝ በምታልፍበት ቆሜ
መብራቶቼን አብርቼ ነጩን ልብስ ተሸልሜ
የዳዊት ልጅ ሆይ ግባ ኢየሱስ ወደ ቤቴ
ጵንኤል እልሀለሁ ድናለች ሰውነቴ

VERSE 4
ሁሉንም ብታከብር ሁሉንም ብትምረው
ማነው ቸርነትህን የሚከለክለው
ጠዋትም የተጠራ አምሽቶ የገባው
ሆነዋል ባለዋጋ ከበዛው ስጦታው

VERSE 5
የረዳኸው ይናገር ያሰብከው በሕይወቱ
አቤነዘር እያለ ይዘምር ባንደበቱ
በደስታዬም ቀን አለህ አይሃለሁ ከጎኔ
ከእኔ ጋር አልቅሰሃል አሳዝኖህ ሀዘኔ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tabor Abera midren kedenat ya demena
Enkelf yelenem talak negodgud honewalna
Anekan lemesgana

VERSE 1
Musem yeqedemew sew Elias haylegnaw
Tegegntewal betabor mesekireh honew
Egnam ke genanaw keber yabatun qal semetenal
Beredo honewal lebsu etsub etsub belenal

VERSE 2
Qal gebtehelegn neber letasayegn kibrehen
Neges kemot gesegeseh ayichyahalew ahun
Yeesat feresoch aluh tewagiw yene geta
Armonem des alew Sisaran selemeta

VERSE 3
Etebqehalehugn bemitalefbet qome
Mebratochen abreche nechun lebs teshelme
Yedawit lej hoy geba Eyesus wede bete
Peniel elhalew denalech sewnete

VERSE 4
Hulunm betakeber hulunm betemerew
Manew cherenetehen yemikeleklew
Tewatm yetetera amsheto yegebaw
Honewal balewaga kebezaw setotaw

VERSE 5
Yeredehew yinagar yasebekew behiyewetu
Abenezer eyale yezemer bandebetu
Bedestayem qen aleh ayihalew kegone
Keene gar alqesehal asazenoh hazene'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tabor-abera', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tadinegn Zenid (tadinegn-zenid)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tadinegn-zenid'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 1
ይሁን ስትል ሆኑ ፣ አዘዝህ ተፈጠሩ፥
በቃልህ ጸንተዋል ምድርና ጠፈሩ፥
ልክ እንደ መፃጉዕ ዳን ያልከው ይድናል፥
በአቅሌስያ ሳይዳ ፍጥረት ደጅ ይጠናል።

VERSE 2
ሐዋርያት በታንኳው አድነን እንዳሉ፥
በቃለ ተግሣፅህ ጸጥ እንዲል ማዕበሉ፥
ሞገድ ጾር ተነሥቷል በባሕረ ሥጋዬ፥
ኀድፈኒ ክርስቶስ ሊቀ ሐመርየ፥

VERSE 3
አድነኝ አምላኬ አድነኝ ጌታዬ።
ለሞት በተሰጠ ጎስቋላ ሰውነት፥
የማልወደውን ነው የማደርገው በእውነት።
ከሲኦል ከሰዶም ከዓለመ መዓቱ፥

VERSE 4
ያውጡኝ እጄን ይዘው እንደ ሎጥ መላእክቱ።
የነፍስ እድፍ ማጠብ ልምዱ ነው የኤልሻዳይ፥
ቢቀላ እንደ አለላ ይነጣል ከአመዳይ፥
በሁሶኘም ይርጨኝ ያንጻኝ ከበረዶ፥

VERSE 5
ቸር ወመስተሣህል ድኅነቴን ወዶ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 1
Yihun sitl honu , azezh tefet’eru:
Beqalh ts’entewal midrna t’eferu:
Lik ende mets’ague dan yalkew yidnal:
Beaqlesya sayda fit’ret dej yit’enal.

VERSE 2
Hewaryat betankwaw adnen endalu:
Beqale tegsats’h ts’et’ endil maebelu:
Moged ts’or tenestwal bebahre sigaye:
Hedfeni Kristos liqe hemerye:

VERSE 3
Adnegn amlake adnegn getaye.
Lemot beteset’e gosqwala sewnet:
Yemalwedewn new yemadergew beewnet.
Kesiol kesedom kealeme meatu:

VERSE 4
Yawt’ugn ejen yizew ende lot’ melaektu.
Yenefs edf mat’eb limdu new yeelshaday:
Biqela ende alela yinet’al keameday:
Behusognem yirch’egn yants’agn keberedo:

VERSE 5
Cher wemestesahl dihneten wedo.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tadinegn-zenid', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Talaku Melaek Mikaiel Yinegesal (talaku-melaek-mikaiel-yinegesal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 1
የማይቋረጥ ልዩ ምስጋና
አለኝ ሚካኤል ለክብርህ ገና
ንገስ በእልልታ ታላቅ ነህ እና
ህዝቤን ልትረዳ ወጥተሃል እና

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 2
ታላቁ መልዐክ ሚካኤል ይነግሳል
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 3
መጣ ከሰማይ በልዩ ግርማ
አህያ አየችው ከበልዓም ቀድማ
ለታላቅ ክብሩ ሰገደችለት
አየ በልዓም አይኑ ሲከፈት

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 4
አይሰራም መርገም በአምላክ ህዝብ ላይ
አንተን ሊቋቋም መጥቷል ከሰማይ
ቃሉ በአማረ ልዩ ምስጋና
ታላቁ መልዐክ ሚካኤል ይነግሳልና

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 5
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል',
      lyrics_transliteration = 'CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 1
Yemaykwaret liyu misgana
Alegn Mikaiel lekibirih gena
Niges be''illilta talak neh ena
Hizbien litreda wetahaleh ena

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 2
Talaku melaek Mikaiel yinegesal
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 3
Meta kesemay beliyu girma
Ahiya aychew kebelam qedma
Letalak kbiru segedechilet
Aye belam aynu sikfet

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 4
Ayseram mergem beamalak hizb lay
Ante litqaqwam metah kesemay
Qalu beamare liyu misgana
Talaku melaek Mikaiel yinegesalna

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 5
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'talaku-melaek-mikaiel-yinegesal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 1
የማይቋረጥ ልዩ ምስጋና
አለኝ ሚካኤል ለክብርህ ገና
ንገስ በእልልታ ታላቅ ነህ እና
ህዝቤን ልትረዳ ወጥተሃል እና

VERSE 2
ታላቁ መልዐክ ሚካኤል ይነግሳል
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 3
መጣ ከሰማይ በልዩ ግርማ
አህያ አየችው ከበልዓም ቀድማ
ለታላቅ ክብሩ ሰገደችለት
አየ በልዓም አይኑ ሲከፈት

VERSE 4
አይሰራም መርገም በአምላክ ህዝብ ላይ
አንተን ሊቋቋም መጥቷል ከሰማይ
ቃሉ በአማረ ልዩ ምስጋና
ታላቁ መልዐክ ሚካኤል ይነግሳልና

VERSE 5
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 1
Yemaykwaret liyu misgana
Alegn Mikaiel lekibirih gena
Niges be''illilta talak neh ena
Hizbien litreda wetahaleh ena

VERSE 2
Talaku melaek Mikaiel yinegesal
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 3
Meta kesemay beliyu girma
Ahiya aychew kebelam qedma
Letalak kbiru segedechilet
Aye belam aynu sikfet

VERSE 4
Ayseram mergem beamalak hizb lay
Ante litqaqwam metah kesemay
Qalu beamare liyu misgana
Talaku melaek Mikaiel yinegesalna

VERSE 5
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'talaku-melaek-mikaiel-yinegesal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tamemu Hager Betekirisitiyan (tamemu-hager-betekirisitiyan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 1
"ከሃገር ማን እንደኛ" ዋኔን፥
እንል ነበር ኮርተን ዋኔን፥
ከሰውነት ጠለል ዋኔን፥
በታች ማን ከተተን ዋኔን።

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 2
አበው "ሰው ሃገሩ"፥
እንዲሉ "ምግባሩ"፥
አይደለም አፈሩ፥
ጋራ ሸንተረሩ፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 3
ሕዝቦች ተፋቀሩ።
ጥል በተገደለበት ማኅተም፥
ጥል ነጋሪት ሲጎሰም፥
ሰው ታረደ እንደ በግ ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 4
ተብሎ በስማም ዋኔን።
ተጋበዘ ሰናክሬም፥
ሕዝቅያሳችን የለም፥
ከጠላት ንክሻ የሚያም፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 5
ሲከዳ ወዳጅ በመሳም።
ግራ ነው ግራ ነው፥
ግራ ነው ግራ ነው፥
የገዛ ማኅፀኗን ወላድ ወጋች ምነው፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 6
ግራ ነው ግራ ነው።
በግፍ መሠረት ላይ ዋኔን፥
የለም መደላደል ዋኔን፥
ይቆጨን ይንደደን ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 7
የሠራነው በደል ዋኔን።
አንድ ሆነን እናልቅስ ዋኔን፥
እንደ ነነዌ ሰው ዋኔን፥
የእሳት የዲኑን ዶፍ ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 8
ፈጥኖ እንዲመልሰው ዋኔን።
በየጓዳው ምትፈስ የኃጢአት ጠብታ፥
ጎርፍ ሆና ሳትወስደን ደራሽ ሆና መጥታ፥
እንቅረብ ከጌታ።

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።',
      lyrics_transliteration = 'CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 1
"kehager man endegna" wanen:
Enl neber korten wanen:
Kesewnet t’elel wanen:
Betach man keteten wanen.

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 2
Abew "sew hageru":
Endilu "migbaru":
Aydelem aferu:
Gara shentereru:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 3
Hizboch tefaqeru.
T’l betegedelebet mahtem:
T’l negarit sigosem:
Sew tarede ende beg wanen:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 4
Teblo besmam wanen.
Tegabeze senakrem:
Hizqyasachn yelem:
Ket’elat niksha yemiyam:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 5
Sikeda wedaj bemesam.
Gira new gira new:
Gira new gira new:
Yegeza mahts’enwan welad wegach minew:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 6
Gira new gira new.
Begf meseret lay wanen:
Yelem medeladel wanen:
Yiqoch’en yindeden wanen:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 7
Yeseranew bedel wanen.
And honen enalqs wanen:
Ende nenewe sew wanen:
Yeesat yedinun dof wanen:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 8
Fet’no endimelsew wanen.
Beyegwadaw mitfes yehat’iat t’ebta:
Gorf hona satwesden derash hona met’ta:
Enqreb kegeta.

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tamemu-hager-betekirisitiyan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 1
"ከሃገር ማን እንደኛ" ዋኔን፥
እንል ነበር ኮርተን ዋኔን፥
ከሰውነት ጠለል ዋኔን፥
በታች ማን ከተተን ዋኔን።

VERSE 2
አበው "ሰው ሃገሩ"፥
እንዲሉ "ምግባሩ"፥
አይደለም አፈሩ፥
ጋራ ሸንተረሩ፥

VERSE 3
ሕዝቦች ተፋቀሩ።
ጥል በተገደለበት ማኅተም፥
ጥል ነጋሪት ሲጎሰም፥
ሰው ታረደ እንደ በግ ዋኔን፥

VERSE 4
ተብሎ በስማም ዋኔን።
ተጋበዘ ሰናክሬም፥
ሕዝቅያሳችን የለም፥
ከጠላት ንክሻ የሚያም፥

VERSE 5
ሲከዳ ወዳጅ በመሳም።
ግራ ነው ግራ ነው፥
ግራ ነው ግራ ነው፥
የገዛ ማኅፀኗን ወላድ ወጋች ምነው፥

VERSE 6
ግራ ነው ግራ ነው።
በግፍ መሠረት ላይ ዋኔን፥
የለም መደላደል ዋኔን፥
ይቆጨን ይንደደን ዋኔን፥

VERSE 7
የሠራነው በደል ዋኔን።
አንድ ሆነን እናልቅስ ዋኔን፥
እንደ ነነዌ ሰው ዋኔን፥
የእሳት የዲኑን ዶፍ ዋኔን፥

VERSE 8
ፈጥኖ እንዲመልሰው ዋኔን።
በየጓዳው ምትፈስ የኃጢአት ጠብታ፥
ጎርፍ ሆና ሳትወስደን ደራሽ ሆና መጥታ፥
እንቅረብ ከጌታ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 1
"kehager man endegna" wanen:
Enl neber korten wanen:
Kesewnet t’elel wanen:
Betach man keteten wanen.

VERSE 2
Abew "sew hageru":
Endilu "migbaru":
Aydelem aferu:
Gara shentereru:

VERSE 3
Hizboch tefaqeru.
T’l betegedelebet mahtem:
T’l negarit sigosem:
Sew tarede ende beg wanen:

VERSE 4
Teblo besmam wanen.
Tegabeze senakrem:
Hizqyasachn yelem:
Ket’elat niksha yemiyam:

VERSE 5
Sikeda wedaj bemesam.
Gira new gira new:
Gira new gira new:
Yegeza mahts’enwan welad wegach minew:

VERSE 6
Gira new gira new.
Begf meseret lay wanen:
Yelem medeladel wanen:
Yiqoch’en yindeden wanen:

VERSE 7
Yeseranew bedel wanen.
And honen enalqs wanen:
Ende nenewe sew wanen:
Yeesat yedinun dof wanen:

VERSE 8
Fet’no endimelsew wanen.
Beyegwadaw mitfes yehat’iat t’ebta:
Gorf hona satwesden derash hona met’ta:
Enqreb kegeta.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tamemu-hager-betekirisitiyan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tatmeshal Besew lbona Zemarit Nardos Kasahun (tatmeshal-besew-lbona-zemarit-nardos-kasahun)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tatmeshal-besew-lbona-zemarit-nardos-kasahun'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 1
የተፅናናንብሽ የድሆች ማረፊያ
ነፋስ ውቅያኖሱን ወጀቡን መቅዘፊያ
ወርሰናል ስምሽን ከወርቁ መዝገብ ላይ
ወለድሽልን ድንግል የሕይወትን ፀሐይ

VERSE 2
ፅዮን ብለናል ነሽ መማፀኛችን
ሞትን አናይም ካለሽ እናታችን /2/
ቀስተ ደመናዬ ሁነሽ ምልክቴ
አለሁ እስከዛሬ ባንቺው በእመቤቴ

VERSE 3
ልጅሽን አምኜ ምን ይጎልብኛል
ያስጨነቀኝ ሁሉ ይታዘዝልኛል
ተከቧል ተራራው በብሩህ ደመና
የአብ ልጅ ክርስቶስ ባንቺ ወርዷልና

VERSE 4
ይባቤ ምስጋና አፋችንን ይሙላ
መቅደስ አላየሁም ድንግል ካንቺ ሌላ
የከሳሼን ጉልበት ፅናቱን ሰብረሻል
የአዳም ልጅ ከሲኦል ከሞት ወጥቶብሻል

VERSE 5
ጣፈጣት ለነፍሴ የማህጸንሽ ፍሬ
ስጠራሽ እኖራለሁ በያሬድ ዝማሬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 1
Yetets’nananbsh yedhoch marefiya
Nefas wiqyanosun wejebun meqzefiya
Wersenal simshn kewerqu mezgeb lay
Weledshln Dingil yehywetn ts’ehey

VERSE 2
Ts’yon bilenal nesh memats’egnachn
Motn anaym kalesh enatachn (2)
Qeste demenaye hunesh milkte
Alehu eskezare banchiw beemebete

VERSE 3
Lijshn amgne min yigolbgnal
Yasch’eneqegn hulu yitazezlgnal
Tekebwal teraraw bebruh demena
Yeab lij Kristos banchi werdwalna

VERSE 4
Yibabe misgana afachnn yimula
Meqdes alayehum Dingil kanchi lela
Yekesashen gulbet ts’natun sebreshal
Yeadam lij kesiol kemot wet’tobshal

VERSE 5
T’afet’at lenefse yemahts’ensh fire
Sit’erash enoralehu beyared zimare'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tatmeshal-besew-lbona-zemarit-nardos-kasahun', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: #Tebejawyey_New_eritrean_orthodox_mezmur_tebejawiyey_zemari_bereket_tikue_zemarit_Hermela_yehsho_2022 (tebejawyey-new-eritrean-orthodox-mezmur-tebejawiyey-zemari-bereket-tikue)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tebejawyey-new-eritrean-orthodox-mezmur-tebejawiyey-zemari-bereket-tikue'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 1
> ነተን ፈጠርቲ ኣእዳዉ ንድሕሪት ኣሲሮም
ናብቲ ብርሃን ገጹ ትፋኦም ተፊኦም
ነቲ ብዝናብ ክረምቲ ንምድሪ ዘጥለለ
ሓሞት ኣስተይዎ ጸሚአ እና በለ

VERSE 2
እዚ ኹሉ ዝወረዶ
ምእንታይ''ዪ ከፊልዎ
ንናይ ጎይታይ ሞት ባርይኡ እነኹ
ናይ ዘልኣለም ሕይወት እና ኣማዕደኹ

VERSE 3
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 4
> ንሕማመይ እንተ ዘይሓሞ
ንጾረይ እንተ ዘይጸረለይ
ንበደለይ እንተ ዘይሓድጎ
እየሱስ እንተ ዘይሞተለይ

VERSE 5
እንታይ ምኾነ እዚ ናተይ ሕይወት
ብዘይ ናቱ ህላውነት
ንዋዛ ኣይኮነን ተበጅዪኒ
ብዋጋ''ዪ ዓዲጉኒ

VERSE 6
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 1
> neten fet’erti aedawu nidhrit asirom
Nabti birhan gets’u tifaom tefiom
Neti biznab kiremti nimdri zet’lele
Hamot asteywo ts’emia ena bele

VERSE 2
Ezi ኹlu ziweredo
Mientay''yi kefilwo
Ninay goytay mot baryu eneኹ
Nay zelalem hiywet ena amaedeኹ

VERSE 3
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 4
> nihmamey ente zeyhamo
Nits’orey ente zeyts’ereley
Nibedeley ente zeyhadgo
Eyesus ente zeymoteley

VERSE 5
Entay miኾne ezi natey hiywet
Bizey natu hilawnet
Niwaza aykonen tebejyini
Biwaga''yi adiguni

VERSE 6
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tebejawyey-new-eritrean-orthodox-mezmur-tebejawiyey-zemari-bereket-tikue', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tebko Asadeggo (tebko-asadeggo-mikael)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 1
አያምርብኝ ብዘነጋው ታሪኬን
ሚካኤል ነው ያስጌጠልኝ ሕይወቴን
አረሳብኝ እርሱ አትርሳብኝ ያልኩትን
ለካስ ሰምቶኝ ኖሯል የልጅነት ጸሎቴን

CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 2
ሚካኤል ያን ሁሉ ዘመን የታገሰኝ
ሚካኤል ፍሬ ጠብቆ ያልቆረጠኝ
ሚካኤል የከፍታዬ መሰላል
ሚካኤል መነሻዬ ሆነሀል

CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 3
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 4
እንዳይከፋኝ እንዳልደፋ አንገቴን
እንዳላለቅስ እንዳላፈስ እንባዬን
እንዳይርቀኝ ደስታ በመንፈሴ እንዳልዝል
ካጠገቤ አይርቅም ያሳደገኝ ሚካኤል

CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 5
ሚካኤል ቀኔም ቀን አይሆን ሳልጠራህ
ሚካኤል ና ድረስልኝ ሳልልህ
ሚካኤል እንዳስጀመርከኝ ጅማሬዬን
ሚካኤል አሳምረው ፍጻሜዬን

CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 6
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 7
ውድቅ አደረገው የጠላቴን ክፉ እቅድ
አራመደኝ በከፍታዬ መንገድ
ሊያስቀረኝ አልቻለም ሊጎትተኝ ባለጋራ
ተጥሎ ስላለ በእግዚአብሔር ድንቅ ሥራ

CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 8
ሚካኤል እሳታዊ ነው ነበልባል
ሚካኤል ጠላቴ ፊትህ ይቀልጣል
ሚካኤል ለኔ ዐይኔ ነው መከታዬ
ሚካኤል የዘለዓለም ጠባቂዬ

CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 9
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

CHORUS
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/',
      lyrics_transliteration = 'CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 1
Ayamribign bizenegaw tarikén
Mika’el new yasgeṭelign hiwotén
Aresabign ersu atrsabign yalkutén
Lekas semtoñ noral ye-lijinet tselotén

CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 2
Mika’el yan hulu zemen yetagesegn
Mika’el fre tebko yalkoretegn
Mika’el ye-keftayé meselal
Mika’el meneshalé honehal

CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 3
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 4
Endaykefagn endaldefa angetén
Endalalekes endalafes imbayén
Endayirqegn desta be-menfesé endalzil
Katagebé ayirqim yasadegen Mika’el

CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 5
Mika’el qeném qen ayhon saltarah
Mika’el na dereslign salleh
Mika’el endasjemerkeñ jimaréyén
Mika’el asamrew fitsameyén

CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 6
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 7
Wudq aderegew ye-telatén kefo eqd
Aramedegn be-keftayé menged
Liyasqaregn alchalem ligotegn balegara
Tet’lo slale be-Egziabher dink sira

CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 8
Mika’el esatawi new nebelbal
Mika’el telaté fith yikelṭal
Mika’el lene ayne new meketayé
Mika’el ye-zele’alem tebakiye

CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 9
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

CHORUS
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tebko-asadeggo-mikael'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 1
አያምርብኝ ብዘነጋው ታሪኬን
ሚካኤል ነው ያስጌጠልኝ ሕይወቴን
አረሳብኝ እርሱ አትርሳብኝ ያልኩትን
ለካስ ሰምቶኝ ኖሯል የልጅነት ጸሎቴን

VERSE 2
ሚካኤል ያን ሁሉ ዘመን የታገሰኝ
ሚካኤል ፍሬ ጠብቆ ያልቆረጠኝ
ሚካኤል የከፍታዬ መሰላል
ሚካኤል መነሻዬ ሆነሀል

VERSE 3
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 4
እንዳይከፋኝ እንዳልደፋ አንገቴን
እንዳላለቅስ እንዳላፈስ እንባዬን
እንዳይርቀኝ ደስታ በመንፈሴ እንዳልዝል
ካጠገቤ አይርቅም ያሳደገኝ ሚካኤል

VERSE 5
ሚካኤል ቀኔም ቀን አይሆን ሳልጠራህ
ሚካኤል ና ድረስልኝ ሳልልህ
ሚካኤል እንዳስጀመርከኝ ጅማሬዬን
ሚካኤል አሳምረው ፍጻሜዬን

VERSE 6
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/

VERSE 7
ውድቅ አደረገው የጠላቴን ክፉ እቅድ
አራመደኝ በከፍታዬ መንገድ
ሊያስቀረኝ አልቻለም ሊጎትተኝ ባለጋራ
ተጥሎ ስላለ በእግዚአብሔር ድንቅ ሥራ

VERSE 8
ሚካኤል እሳታዊ ነው ነበልባል
ሚካኤል ጠላቴ ፊትህ ይቀልጣል
ሚካኤል ለኔ ዐይኔ ነው መከታዬ
ሚካኤል የዘለዓለም ጠባቂዬ

VERSE 9
ጠብቆ አሳድጎ ከልጅነቴ
አባት እየሆነኝ ሚካኤል አባቴ
ይለይብኛል ሚካኤል ይለይብኛል /፪/
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 1
Ayamribign bizenegaw tarikén
Mika’el new yasgeṭelign hiwotén
Aresabign ersu atrsabign yalkutén
Lekas semtoñ noral ye-lijinet tselotén

VERSE 2
Mika’el yan hulu zemen yetagesegn
Mika’el fre tebko yalkoretegn
Mika’el ye-keftayé meselal
Mika’el meneshalé honehal

VERSE 3
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 4
Endaykefagn endaldefa angetén
Endalalekes endalafes imbayén
Endayirqegn desta be-menfesé endalzil
Katagebé ayirqim yasadegen Mika’el

VERSE 5
Mika’el qeném qen ayhon saltarah
Mika’el na dereslign salleh
Mika’el endasjemerkeñ jimaréyén
Mika’el asamrew fitsameyén

VERSE 6
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)

VERSE 7
Wudq aderegew ye-telatén kefo eqd
Aramedegn be-keftayé menged
Liyasqaregn alchalem ligotegn balegara
Tet’lo slale be-Egziabher dink sira

VERSE 8
Mika’el esatawi new nebelbal
Mika’el telaté fith yikelṭal
Mika’el lene ayne new meketayé
Mika’el ye-zele’alem tebakiye

VERSE 9
Tebko asadeggo ke-lijineté
Abat eyehonegn Mika’el abaté
Yileyibignyal Mika’el yileyibignyal (2)
Be-kinfu shefno be-betu asadegognal (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tebko-asadeggo-mikael', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tegten Entseley Like Mezemeran Tewodros Yosef (tegten-entseley-like-mezemeran-tewodros-yosef)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tegten-entseley-like-mezemeran-tewodros-yosef'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ተግተን እንጸልይ ማቴ 26፣41
ተግተን እንፀልይ ወደፈተና እንዳንገባ
በህይወታችን በመንደራችን እግዚአብሔር ይግባ
በአባታችን ፊት በጸሎት ወድቀን ኃይል እንታጠቅ

VERSE 1
በጸጋ እንድንኖር የሚቃወመን ጠላትም ይድቀቅ
በጦር ሰፈርነን ያጠላታችን ሌጊዮን ታጥቋል
መሳሪያ ሳንይዝ የወጣነውን ስንቶቹን ጥሏል
ዘይት አልቆብን የመቅረዛችን መብራት ደብዝዟል

VERSE 2
ብርሃኑን ጥለን የጠላት ምሽግ በምን ይታያል
ያዘነ ብላል ጆሮን ወደእኛ ጠላት ይመታል
ወጥመዱን ሰብሮ ያመንበትን ያሻግረናል
ያሰማራናል በለምለሙ መስክ በተስፋ ሞልቶ

VERSE 3
ማንአፍሮ ያውቃል የእግአብሔርን ስሙንስ ጠርቶ
የክብር ዘይት በቆሰለው ሰው ቀድተው የሚያ ፊሱት
መድኃኒት ነው ለአለም ሁሉ ዲናር የማይከፍሉት
የፍቅር አባት ደጁን ስንመታ ይከፍትልናል

VERSE 4
መሻታችንን እየፈጸመ ይባርከናል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tegten ents’ely mate 26,41
Tegten ents’ely wedefetena endangeba
Behywetachn bemenderachn Egziabher yigba
Beabatachn fit bets’elot wedqen hayl entat’eq

VERSE 1
Bets’ega endnnor yemiqawemen t’elatm yidqeq
Bet’or sefernen yat’elatachn legiyon tat’qwal
Mesariya sanyz yewet’anewn sintochun t’lwal
Zeyt alqobn yemeqrezachn mebrat debzzwal

VERSE 2
Birhanun t’len yet’elat mishg bemn yitayal
Yazene bilal joron wedeegna t’elat yimetal
Wet’medun sebro yamenbetn yashagrenal
Yasemaranal belemlemu mesk betesfa molto

VERSE 3
Manafro yawqal yeegabhern simuns t’erto
Yekbr zeyt beqoselew sew qedtew yemiya fisut
Medhanit new lealem hulu dinar yemaykeflut
Yefqr abat dejun sinmeta yikeftlnal

VERSE 4
Meshatachnn eyefets’eme yibarkenal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tegten-entseley-like-mezemeran-tewodros-yosef', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Teklehaymanot / / Live mezmur (teklehaymanot-live-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 1
ደጊም ፈትየ አለኹ ክመስል ንዓኻ
ከምቲ ንስኻ እዉን ንክርስቶስ ዝመሰልካ። /2/''
ሽሕ እዃ እንተነበረ ሕሬት ኣዕቢኻዮ ግና ጸጋኻ ብእምነት
ብልቢ ስዒብካ ቃል ወንጌል ክርስቶስ

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 2
ናይ ስጋ ገዲፍካስ ነቢርካ ብመንፈስ
አብሎ ንልበይ ብጥበብ ጸጋኻ
ድሕሪት ተመሊሰ ክነብሮ ምንባርካ።
እቲ ዝመስል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 3
ቃል አምለኽ ምዃኑ ምስጢር ምግቢ ህይወት
ኪንዮ ብልዒ ስጋ ናይ ነፍሲ ዕንጋሎት
ሰሪጹ አብ ልብኻ ህያዉ ናይ ጎይታ ቃል
ወጺኻዮ ብጾም ተመስገን ብምባል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 4
ንገሮ ንኸርሰይ ነቲ ስሱዕ ሸዉሃት
ብልዒ ንኸብዲ እምበር ከም ዘየዉህብ ህይወት
እቲ ዝመስል
አብቲ ከቢድ እዋን ተፈታኒ ህሞት

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 5
ቅልስ ምስ ሰይጣን ወጺኻ ብዓወት
መሳርያ ኣይነበረን ናይ ዓወትካ ሚስጢር
ጾም ጸሎት እዩ ነይሩ እቲ ናይ ጽድቂ ኣጽዋር
ኩሉ ትናኻ አብነት ጽድቂ ኢኻ

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 6
ወሲነ ክለበሶ ዕጥቂ ናይ ገልኻ
እቲ
እስቲ ተመልከቱ ነቶም መራሕትኹም
ኣሰሮም ሰዓቡ ገድሎም እናስተንተንኩም

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 7
ከም ዝበሎ ጎይታ ኣብቲ ቅዱስ ወንጌል
ተበጊሰ አለኹ ንዓኻ ክመስል
እንተ ኣነ ግና ካባኻ ዝደሊ ተኽልየ ጸሎትካ እዩ ዘዉህበኒ ሓይሊ።
እቲ ዝመስል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ',
      lyrics_transliteration = 'CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 1
Degim fetye aleኹ kimesl niaኻ
Kemti nisኻ ewun nikrstos zimeselka. (2)''
Shh ekhwa entenebere hiret aebiኻyo gina ts’egaኻ biemnet
Bilbi siibka qal wengel Kristos

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 2
Nay siga gedifkas nebirka bimenfes
Ablo nilbey bit’beb ts’egaኻ
Dihrit temelise kinebro minbarka.
Eti zimesl

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 3
Qal amleኽ mikhwanu mist’ir migbi hiywet
Kinyo bili siga nay nefsi engalot
Serits’u Ab libኻ hiyawu nay goyta qal
Wets’iኻyo bits’om temesgen bimbal

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 4
Nigero niኸrsey neti sisue shewuhat
Bili niኸbdi ember kem zeyewuhb hiywet
Eti zimesl
Abti kebid ewan tefetani himot

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 5
Qils mis seyt’an wets’iኻ biawet
Mesarya ayneberen nay awetka mist’ir
Ts’om ts’elot eyu neyru eti nay ts’dqi ats’war
Kulu tinaኻ abnet ts’dqi iኻ

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 6
Wesine kilebeso et’qi nay gelኻ
Eti
Esti temelketu netom merahtኹm
Aserom seabu gedlom enastentenkum

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 7
Kem zibelo goyta abti Kidus wengel
Tebegise aleኹ niaኻ kimesl
Ente ane gina kabaኻ zideli teኽlye ts’elotka eyu zewuhbeni hayli.
Eti zimesl

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'teklehaymanot-live-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 1
ደጊም ፈትየ አለኹ ክመስል ንዓኻ
ከምቲ ንስኻ እዉን ንክርስቶስ ዝመሰልካ። /2/''
ሽሕ እዃ እንተነበረ ሕሬት ኣዕቢኻዮ ግና ጸጋኻ ብእምነት
ብልቢ ስዒብካ ቃል ወንጌል ክርስቶስ

VERSE 2
ናይ ስጋ ገዲፍካስ ነቢርካ ብመንፈስ
አብሎ ንልበይ ብጥበብ ጸጋኻ
ድሕሪት ተመሊሰ ክነብሮ ምንባርካ።
እቲ ዝመስል

VERSE 3
ቃል አምለኽ ምዃኑ ምስጢር ምግቢ ህይወት
ኪንዮ ብልዒ ስጋ ናይ ነፍሲ ዕንጋሎት
ሰሪጹ አብ ልብኻ ህያዉ ናይ ጎይታ ቃል
ወጺኻዮ ብጾም ተመስገን ብምባል

VERSE 4
ንገሮ ንኸርሰይ ነቲ ስሱዕ ሸዉሃት
ብልዒ ንኸብዲ እምበር ከም ዘየዉህብ ህይወት
እቲ ዝመስል
አብቲ ከቢድ እዋን ተፈታኒ ህሞት

VERSE 5
ቅልስ ምስ ሰይጣን ወጺኻ ብዓወት
መሳርያ ኣይነበረን ናይ ዓወትካ ሚስጢር
ጾም ጸሎት እዩ ነይሩ እቲ ናይ ጽድቂ ኣጽዋር
ኩሉ ትናኻ አብነት ጽድቂ ኢኻ

VERSE 6
ወሲነ ክለበሶ ዕጥቂ ናይ ገልኻ
እቲ
እስቲ ተመልከቱ ነቶም መራሕትኹም
ኣሰሮም ሰዓቡ ገድሎም እናስተንተንኩም

VERSE 7
ከም ዝበሎ ጎይታ ኣብቲ ቅዱስ ወንጌል
ተበጊሰ አለኹ ንዓኻ ክመስል
እንተ ኣነ ግና ካባኻ ዝደሊ ተኽልየ ጸሎትካ እዩ ዘዉህበኒ ሓይሊ።
እቲ ዝመስል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 1
Degim fetye aleኹ kimesl niaኻ
Kemti nisኻ ewun nikrstos zimeselka. (2)''
Shh ekhwa entenebere hiret aebiኻyo gina ts’egaኻ biemnet
Bilbi siibka qal wengel Kristos

VERSE 2
Nay siga gedifkas nebirka bimenfes
Ablo nilbey bit’beb ts’egaኻ
Dihrit temelise kinebro minbarka.
Eti zimesl

VERSE 3
Qal amleኽ mikhwanu mist’ir migbi hiywet
Kinyo bili siga nay nefsi engalot
Serits’u Ab libኻ hiyawu nay goyta qal
Wets’iኻyo bits’om temesgen bimbal

VERSE 4
Nigero niኸrsey neti sisue shewuhat
Bili niኸbdi ember kem zeyewuhb hiywet
Eti zimesl
Abti kebid ewan tefetani himot

VERSE 5
Qils mis seyt’an wets’iኻ biawet
Mesarya ayneberen nay awetka mist’ir
Ts’om ts’elot eyu neyru eti nay ts’dqi ats’war
Kulu tinaኻ abnet ts’dqi iኻ

VERSE 6
Wesine kilebeso et’qi nay gelኻ
Eti
Esti temelketu netom merahtኹm
Aserom seabu gedlom enastentenkum

VERSE 7
Kem zibelo goyta abti Kidus wengel
Tebegise aleኹ niaኻ kimesl
Ente ane gina kabaኻ zideli teኽlye ts’elotka eyu zewuhbeni hayli.
Eti zimesl'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'teklehaymanot-live-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Temesigen (temesigen-581)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 1
ልቤ ባንተ ፀና ፀሎቴም ተሰማ
በጠላቶቼ ላይ ሆንከኝ ሞገስ ግርማ
ባዶዬን ወጥቼ አትርፌ ተመለስኩ
የትዳር ሲደንቀኝ በልጅም ተባረኩ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 2
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 3
እጄን በአፌ አስጭነህ ልቤን አስደሰትከው
ቤቴን በበረከት በረድኤት ሞላህው
ከለመንኩህ አንዳች የቀረብኝ የለም
ምስጋና ይድረስህ ቸሩ መድኃኔዓለም

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 4
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 5
ዓይኔን በዓይኔ አየሁኝ ደግሜ ራሴን
ከአብራኬ ተከፋይ ልጅን ሰጠህኝ
ስለማይነገር ሰፊ ስጦታህ
ከምስጋና ሌላ ምኔን ልክፈልህ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 6
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ',
      lyrics_transliteration = 'CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 1
Libe bante ts’ena ts’elotem tesema
Bet’elatoche lay honkegn moges girma
Badoyen wet’che atrfe temelesku
Yetdar sidenqegn beljm tebareku

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 2
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 3
Ejen beafe asch’neh liben asdesetkew
Beten bebereket beredet molahw
Kelemenkuh andach yeqerebgn yelem
Misgana yidresh cheru Medhanealem

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 4
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 5
Aynen beayne ayehugn degme rasen
Keabrake tekefay lijn set’ehgn
Silemayneger sefi sit’otah
Kemsgana lela minen likfelh

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 6
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'temesigen-581'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 1
ልቤ ባንተ ፀና ፀሎቴም ተሰማ
በጠላቶቼ ላይ ሆንከኝ ሞገስ ግርማ
ባዶዬን ወጥቼ አትርፌ ተመለስኩ
የትዳር ሲደንቀኝ በልጅም ተባረኩ

VERSE 2
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 3
እጄን በአፌ አስጭነህ ልቤን አስደሰትከው
ቤቴን በበረከት በረድኤት ሞላህው
ከለመንኩህ አንዳች የቀረብኝ የለም
ምስጋና ይድረስህ ቸሩ መድኃኔዓለም

VERSE 4
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 5
ዓይኔን በዓይኔ አየሁኝ ደግሜ ራሴን
ከአብራኬ ተከፋይ ልጅን ሰጠህኝ
ስለማይነገር ሰፊ ስጦታህ
ከምስጋና ሌላ ምኔን ልክፈልህ

VERSE 6
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 1
Libe bante ts’ena ts’elotem tesema
Bet’elatoche lay honkegn moges girma
Badoyen wet’che atrfe temelesku
Yetdar sidenqegn beljm tebareku

VERSE 2
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 3
Ejen beafe asch’neh liben asdesetkew
Beten bebereket beredet molahw
Kelemenkuh andach yeqerebgn yelem
Misgana yidresh cheru Medhanealem

VERSE 4
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 5
Aynen beayne ayehugn degme rasen
Keabrake tekefay lijn set’ehgn
Silemayneger sefi sit’otah
Kemsgana lela minen likfelh

VERSE 6
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'temesigen-581', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tenager Alegn (tenager-alegn)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tenager-alegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 1
ሰው አድርጎኝ ሞቶ በደሙ
ኑሮዬን ባርኮት ህመሙ
ሰላም አውጥቶ ካስገባ
ልያዝ ለክብሩ ዘንባባ

VERSE 2
ሆሳና ልበል መድኃኒት
ከፍ በልልኝ የኔ አባት
ተጠምተህ እኔ ረካሁኝ
ስራህ ግሩም ነው ደነቀኝ

VERSE 3
አዝ………….
እጆቹን እዩት በእምነት
ቆሰለ ሊሰጠኝ ህይወት
በዚያ ታትሞ ውበቴ

VERSE 4
ኢየሱስ ለኔ ብርታቴ
ከማንም በላይ ከምንም
ለኔ ልዩ ነው ዘላለም
ህይወቴን ለእርሱ አስባርኬ

VERSE 5
እኔስ በረታሁ በአምላኬ
የእሾህ አክሊሉ በራሱ
ለእኔ ቤዛነው ሞገሱ
ሞቴን ገድሎታል አባቴ

VERSE 6
ሰላሜ እርሱ ነው እረፍቴ
ሰው የመሆኔ ሚስጥሩ
የማይለወጥ ነው ፍቅሩ
የገባኝ እውነት በምድር ላይ

VERSE 7
ፍቅር ነው ጌታ ኤልሻዳይ
ክብሩን ለማወጅ ተነሳው
ሲያድነኝ ከሞት እያየው
ገመናን ሸፋኝ ኪዳኔ

VERSE 8
ተራበ ውዴ መድኅኔ
ይህ ነው ያቆመኝ በፊቱ
ወሰን የሌለው ምህረቱ
ለዚህ ደግነት ውለታ

VERSE 9
ምን ይከፈላል ለጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 1
Sew adrgogn moto bedemu
Nuroyen barkot himemu
Selam awt’to kasgeba
Liyaz lekbru zenbaba

VERSE 2
Hosana libel medhanit
Kef bellgn yene abat
Tet’emteh ene rekahugn
Sirah girum new deneqegn

VERSE 3
Ejochun eyut beemnet
Qosele liset’egn hiywet
Beziya tatmo wibete

VERSE 4
Iyesus lene birtate
Kemanm belay kemnm
Lene liyu new zelalem
Hiyweten leersu asbarke

VERSE 5
Enes beretahu beamlake
Yeeshoh aklilu berasu
Leene bezanew mogesu
Moten gedlotal abate

VERSE 6
Selame ersu new erefte
Sew yemehone mist’ru
Yemaylewet’ new fiqru
Yegebagn ewnet bemdr lay

VERSE 7
Fiqr new Geta elshaday
Kibrun lemawej tenesaw
Siyadnegn kemot eyayew
Gemenan shefagn kidane

VERSE 8
Terabe wide medhne
Yih new yaqomegn befitu
Wesen yelelew mihretu
Lezih degnet wileta

VERSE 9
Min yikefelal legeta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tenager-alegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tenesitwal Bezih Yelem (tenesitwal-bezih-yelem)
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
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 1
Gedayu mot bersu dil mensat tewatena
Senseleten qenberen tekaw bebegena
Mot hoy mewgiyah yetal eyalin minzemirew
Mesqelih tor simih gashachin honolin new danin yeminilew

CHORUS
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 2
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

CHORUS
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 3
Teshagerenal silashagerken lezelalem
Bemeqabir mot yiyizen zend keto alchalem
Hayilegnawun behayil asirehew layifeta
Zemerinlih ashenafi neh yegna geta kef bel bellilta

CHORUS
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 4
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

CHORUS
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 5
Moto madan leman techilwal kante beqer
Getinetih sirah yinoral simesekir
Wodaje hoy wubetih wub new yemiyabera
Techeneke tenqeteqete telat fera itsub yante sira

CHORUS
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 6
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

CHORUS
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 7
Meskirulet yemisirach new tilaq zena
Melaektu nech lebsewal dil newna
Ketemawa andach honalech belelitu
Bezmare tenqeteqete wehni betu keberowun mitu

CHORUS
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 8
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

CHORUS
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tenesitwal-bezih-yelem'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን ምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው ዳንን የምንለው

VERSE 2
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘን ዘንድ ከቶ አልቻለም
ሃይለኛውን በሃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የኛ ጌታ ከፍ በል በልልታ

VERSE 4
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ሞቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰክር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ እጹብ ያንተ ስራ

VERSE 6
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
መስክሩለት የምስራች ነው ታላቅ ዜና
መላእክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሆናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወህኒ ቤቱ ከበሮውን ምቱ

VERSE 8
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 1
Gedayu mot bersu dil mensat tewatena
Senseleten qenberen tekaw bebegena
Mot hoy mewgiyah yetal eyalin minzemirew
Mesqelih tor simih gashachin honolin new danin yeminilew

VERSE 2
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 3
Teshagerenal silashagerken lezelalem
Bemeqabir mot yiyizen zend keto alchalem
Hayilegnawun behayil asirehew layifeta
Zemerinlih ashenafi neh yegna geta kef bel bellilta

VERSE 4
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 5
Moto madan leman techilwal kante beqer
Getinetih sirah yinoral simesekir
Wodaje hoy wubetih wub new yemiyabera
Techeneke tenqeteqete telat fera itsub yante sira

VERSE 6
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta

VERSE 7
Meskirulet yemisirach new tilaq zena
Melaektu nech lebsewal dil newna
Ketemawa andach honalech belelitu
Bezmare tenqeteqete wehni betu keberowun mitu

VERSE 8
Hidu nigeru awru alem
Tenesitwal bezih yelem (2)
Medhanealem mot yemayichilew yebereta
Hayal new mayireta mahtemun yefeta yetinsaeu geta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tenesitwal-bezih-yelem', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tenestual Deacon Zemari Endale Dereje (tenestual-deacon-zemari-endale-dereje)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 1
መቃብር ኑና እዩ ፣ በዚህ የለም ጌታ
በሥልጣን ተነስቷል ፣ ከሞት የበረታ
ብርሀን ተጎናጽፎ ፣ በሰማያት አለ
በአባቱ ቀኝ ነው ፣ እነሳለው ያለ።

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 2
በሰማያት መንበር ፣ ተቀምጦ ያየነው
ሞትን ድል የነሳው ፣ ከእርሱ በቀር ማነው !
አትፍራ ቶማስ ሆይ ፣ ና ጎኑን ዳሰህ እይ
ተነስቷል በክብር ፣ ተነስቷል አዶናይ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 3
በዝግ ቤት የገባው ፣ መድኀንህ እርሱ ነው
ትንሣኤና ሕይወት ፣ ነውና እመነው።
የሐዋርያት ጆሮ ፣ የቶማስ ዓይን አለን
በጌታ ትንሣኤ ፣ እኛም እናምናለን

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 4
በፍጹም ልባችን ፣ ፀሐዩ እንዲወጣ
እንማጸናለን ፣ የትንሣኤን ጌታ።
ይኽን ቤተ መቅደስ ፣ አፍርሱት እያለ
የነገራችሁ አምላክ ፣ ምንም አልበደለ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 5
ቢፈርስም በእጃችሁ ፣ የ40 ዓመት መቅደሱ
በሦስት ቀን ታንጿል ፣ ፈርሶ አይቀርም እርሱ ።
ከኃጢአት የራቀ ፣ ይሁን አእምሮዬ
ትንሣኤ ልቡናን ፣ አትም በኑሮዬ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 6
መከራ መስቀልህን ፣ ሞትህን የሚያስብ
አድለኝ ኅሊና ፣ አትንሳኝ ያንተን ልብ።

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።',
      lyrics_transliteration = 'CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 1
Meqabr nuna eyu , bezih yelem Geta
Beslt’an tenestwal , kemot yebereta
Birhen tegonats’fo , besemayat ale
Beabatu qegn new , enesalew yale.

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 2
Besemayat menber , teqemt’o yayenew
Motn dil yenesaw , keersu beqer manew !
Atfra tomas hoy , na gonun daseh ey
Tenestwal bekbr , tenestwal adonay

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 3
Bezg bet yegebaw , medhenh ersu new
Tinsaena hiywet , newna emenew.
Yehewaryat joro , yetomas ayn alen
Begeta tinsae , egnam enamnalen

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 4
Befts’um libachn , ts’eheyu endiwet’a
Enmats’enalen , yetnsaen geta.
Yiኽn bete meqdes , afrsut eyale
Yenegerachhu amlak , minm albedele

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 5
Bifersm beejachhu , ye40 amet meqdesu
Besost qen tants’wal , ferso ayqerm ersu .
Kehat’iat yeraqe , yihun aemroye
Tinsae libunan , atm benuroye

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 6
Mekera mesqelhn , mothn yemiyasb
Adlegn hilina , atnsagn yanten lib.

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tenestual-deacon-zemari-endale-dereje'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 1
መቃብር ኑና እዩ ፣ በዚህ የለም ጌታ
በሥልጣን ተነስቷል ፣ ከሞት የበረታ
ብርሀን ተጎናጽፎ ፣ በሰማያት አለ
በአባቱ ቀኝ ነው ፣ እነሳለው ያለ።

VERSE 2
በሰማያት መንበር ፣ ተቀምጦ ያየነው
ሞትን ድል የነሳው ፣ ከእርሱ በቀር ማነው !
አትፍራ ቶማስ ሆይ ፣ ና ጎኑን ዳሰህ እይ
ተነስቷል በክብር ፣ ተነስቷል አዶናይ

VERSE 3
በዝግ ቤት የገባው ፣ መድኀንህ እርሱ ነው
ትንሣኤና ሕይወት ፣ ነውና እመነው።
የሐዋርያት ጆሮ ፣ የቶማስ ዓይን አለን
በጌታ ትንሣኤ ፣ እኛም እናምናለን

VERSE 4
በፍጹም ልባችን ፣ ፀሐዩ እንዲወጣ
እንማጸናለን ፣ የትንሣኤን ጌታ።
ይኽን ቤተ መቅደስ ፣ አፍርሱት እያለ
የነገራችሁ አምላክ ፣ ምንም አልበደለ

VERSE 5
ቢፈርስም በእጃችሁ ፣ የ40 ዓመት መቅደሱ
በሦስት ቀን ታንጿል ፣ ፈርሶ አይቀርም እርሱ ።
ከኃጢአት የራቀ ፣ ይሁን አእምሮዬ
ትንሣኤ ልቡናን ፣ አትም በኑሮዬ

VERSE 6
መከራ መስቀልህን ፣ ሞትህን የሚያስብ
አድለኝ ኅሊና ፣ አትንሳኝ ያንተን ልብ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 1
Meqabr nuna eyu , bezih yelem Geta
Beslt’an tenestwal , kemot yebereta
Birhen tegonats’fo , besemayat ale
Beabatu qegn new , enesalew yale.

VERSE 2
Besemayat menber , teqemt’o yayenew
Motn dil yenesaw , keersu beqer manew !
Atfra tomas hoy , na gonun daseh ey
Tenestwal bekbr , tenestwal adonay

VERSE 3
Bezg bet yegebaw , medhenh ersu new
Tinsaena hiywet , newna emenew.
Yehewaryat joro , yetomas ayn alen
Begeta tinsae , egnam enamnalen

VERSE 4
Befts’um libachn , ts’eheyu endiwet’a
Enmats’enalen , yetnsaen geta.
Yiኽn bete meqdes , afrsut eyale
Yenegerachhu amlak , minm albedele

VERSE 5
Bifersm beejachhu , ye40 amet meqdesu
Besost qen tants’wal , ferso ayqerm ersu .
Kehat’iat yeraqe , yihun aemroye
Tinsae libunan , atm benuroye

VERSE 6
Mekera mesqelhn , mothn yemiyasb
Adlegn hilina , atnsagn yanten lib.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tenestual-deacon-zemari-endale-dereje', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tenestual Rebuni Zemarit Fasika Mekonen (tenestual-rebuni-zemarit-fasika-mekonen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ክርስቶስ ተንስአ እሙታን ሞተ ወኬዶ ለሞት
ለእለ ውስተ መቃብር ውሃበ ሕይወተ ዘለአለም እረፍተ
+++
እንቅልፍ የለኝ ዛሬስ በምንጣፌ

VERSE 1
ከሞት መዳፍ ከአጋንት ተርፌ
እገሰግሳለሁ ጨለማን ሳልፈራ
ከመስቀል አውርደው ከቀበሩት ስፍራ
+++

CHORUS
ክርስቶስ ተንስአ እሙታን ሞተ ወኬዶ ለሞት
ለእለ ውስተ መቃብር ውሃበ ሕይወተ ዘለአለም እረፍተ
+++
እንቅልፍ የለኝ ዛሬስ በምንጣፌ

VERSE 2
ነፃ አውጥቶኝ ከአጋንንት እስራት
ጤናን ሰጥቶኝ የታደገኝ ከሞት
ውለታው አለብኝ አጅግ የበለጠ
ከጠላት መንጋጋ ነፍሴን ያስመለጠ

CHORUS
ክርስቶስ ተንስአ እሙታን ሞተ ወኬዶ ለሞት
ለእለ ውስተ መቃብር ውሃበ ሕይወተ ዘለአለም እረፍተ
+++
እንቅልፍ የለኝ ዛሬስ በምንጣፌ

VERSE 3
+++
ስሙኝ ቃሌን ደቀመዛሙርቱ
ሽቶ ይዤ ስሔድ በጠዋቱ
መገንዙ ብቻ ነው በመቃብር ያለው

CHORUS
ክርስቶስ ተንስአ እሙታን ሞተ ወኬዶ ለሞት
ለእለ ውስተ መቃብር ውሃበ ሕይወተ ዘለአለም እረፍተ
+++
እንቅልፍ የለኝ ዛሬስ በምንጣፌ

VERSE 4
ተነስቷል ክርስቶስ እንደተናገረው
++++
መላእክቱ ነጭ ልብስን ለብሰው
በመቃብሩ አየሁ ተቀምጠው

CHORUS
ክርስቶስ ተንስአ እሙታን ሞተ ወኬዶ ለሞት
ለእለ ውስተ መቃብር ውሃበ ሕይወተ ዘለአለም እረፍተ
+++
እንቅልፍ የለኝ ዛሬስ በምንጣፌ

VERSE 5
ከሙታን መከካከል አትፈልጉት የለም
ተነስቷል ረቡኒ ጌታ መድኃኔዓለም

CHORUS
ክርስቶስ ተንስአ እሙታን ሞተ ወኬዶ ለሞት
ለእለ ውስተ መቃብር ውሃበ ሕይወተ ዘለአለም እረፍተ
+++
እንቅልፍ የለኝ ዛሬስ በምንጣፌ',
      lyrics_transliteration = 'CHORUS
Kristos tensa emutan mote wekedo lemot
Leele wiste meqabr wihabe hiywete zelealem erefte
+++
Enqlf yelegn zares bemnt’afe

VERSE 1
Kemot medaf keagant terfe
Egesegsalehu ch’eleman salfera
Kemesqel awrdew keqeberut sifra
+++

CHORUS
Kristos tensa emutan mote wekedo lemot
Leele wiste meqabr wihabe hiywete zelealem erefte
+++
Enqlf yelegn zares bemnt’afe

VERSE 2
Nets’a awt’togn keagannt esrat
T’enan set’togn yetadegegn kemot
Wiletaw alebgn ajg yebelet’e
Ket’elat mengaga nefsen yasmelet’e

CHORUS
Kristos tensa emutan mote wekedo lemot
Leele wiste meqabr wihabe hiywete zelealem erefte
+++
Enqlf yelegn zares bemnt’afe

VERSE 3
+++
Simugn qalen deqemezamurtu
Shto yizhe sihed bet’ewatu
Megenzu bicha new bemeqabr yalew

CHORUS
Kristos tensa emutan mote wekedo lemot
Leele wiste meqabr wihabe hiywete zelealem erefte
+++
Enqlf yelegn zares bemnt’afe

VERSE 4
Tenestwal Kristos endetenagerew
++++
Melaektu nech’ libsn lebsew
Bemeqabru ayehu teqemt’ew

CHORUS
Kristos tensa emutan mote wekedo lemot
Leele wiste meqabr wihabe hiywete zelealem erefte
+++
Enqlf yelegn zares bemnt’afe

VERSE 5
Kemutan mekekakel atfelgut yelem
Tenestwal rebuni Geta Medhanealem

CHORUS
Kristos tensa emutan mote wekedo lemot
Leele wiste meqabr wihabe hiywete zelealem erefte
+++
Enqlf yelegn zares bemnt’afe',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tenestual-rebuni-zemarit-fasika-mekonen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ክርስቶስ ተንስአ እሙታን ሞተ ወኬዶ ለሞት
ለእለ ውስተ መቃብር ውሃበ ሕይወተ ዘለአለም እረፍተ
+++
እንቅልፍ የለኝ ዛሬስ በምንጣፌ

VERSE 1
ከሞት መዳፍ ከአጋንት ተርፌ
እገሰግሳለሁ ጨለማን ሳልፈራ
ከመስቀል አውርደው ከቀበሩት ስፍራ
+++

VERSE 2
ነፃ አውጥቶኝ ከአጋንንት እስራት
ጤናን ሰጥቶኝ የታደገኝ ከሞት
ውለታው አለብኝ አጅግ የበለጠ
ከጠላት መንጋጋ ነፍሴን ያስመለጠ

VERSE 3
+++
ስሙኝ ቃሌን ደቀመዛሙርቱ
ሽቶ ይዤ ስሔድ በጠዋቱ
መገንዙ ብቻ ነው በመቃብር ያለው

VERSE 4
ተነስቷል ክርስቶስ እንደተናገረው
++++
መላእክቱ ነጭ ልብስን ለብሰው
በመቃብሩ አየሁ ተቀምጠው

VERSE 5
ከሙታን መከካከል አትፈልጉት የለም
ተነስቷል ረቡኒ ጌታ መድኃኔዓለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kristos tensa emutan mote wekedo lemot
Leele wiste meqabr wihabe hiywete zelealem erefte
+++
Enqlf yelegn zares bemnt’afe

VERSE 1
Kemot medaf keagant terfe
Egesegsalehu ch’eleman salfera
Kemesqel awrdew keqeberut sifra
+++

VERSE 2
Nets’a awt’togn keagannt esrat
T’enan set’togn yetadegegn kemot
Wiletaw alebgn ajg yebelet’e
Ket’elat mengaga nefsen yasmelet’e

VERSE 3
+++
Simugn qalen deqemezamurtu
Shto yizhe sihed bet’ewatu
Megenzu bicha new bemeqabr yalew

VERSE 4
Tenestwal Kristos endetenagerew
++++
Melaektu nech’ libsn lebsew
Bemeqabru ayehu teqemt’ew

VERSE 5
Kemutan mekekakel atfelgut yelem
Tenestwal rebuni Geta Medhanealem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tenestual-rebuni-zemarit-fasika-mekonen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tesifa Atikoritimina (tesifa-atikoritimina)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 1
አባቴ አይተወኝም ስለሆንኩኝ ልጁ
አዝ…
በከንቱ ምኞት በዓለም ዳንኪራ
ኃጢአትን ባደረግ አንተን ሳልፈራ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 2
የመንፈስ ፍሬ ከእኔ ቢታጣ
ሸክሜ ከብዶብኝ ብሆን ጎባጣ
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 3
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 4
ዳግም ላልገኝ ከኃጢአት መንደር
ቃል ገብቼልህ እንደ ቃልህ ልኖር
ቃሌን አጥፌ ፍቅርህን ንቄ
ዳግም ብገኝም በኃጢአት ወድቄ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 5
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 6
በድንግል ማርያም በጌታዬ እናት
በአቁራሪተ መዓት ምዕራገ ጸሎት
በእናትነት ፍቅሯ ጹኑ ነው ተስፋዬ
ምህረት እንደማገኝ ከቸር ፈጣሪዬ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 7
ስለ ቃልኪዳኗ አይለኝም ችላ
ጌታ ያሳርፈኛል በምህረቱ ጥላ
የአምላክ ባለሟሎች ቅዱሳኑ ሁሉ
ስለ እኔ ድኅነት ፊቱ ይቆማሉ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ',
      lyrics_transliteration = 'CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 1
Abate aytewegnm silehonkugn liju
CHORUS
Bekentu mignot bealem dankira
Hat’iatn badereg anten salfera

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 2
Yemenfes fire keene bitat’a
Shekme kebdobgn bihon gobat’a
Tesfa atqort’mna amlak beft’reth
Ayleym keene mihret cherneth

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 3
Biwedq enesalehu dagm benshe
Endihu besemay yihonal fishe

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 4
Dagm lalgegn kehat’iat mender
Qal gebchelh ende qalh linor
Qalen at’fe fiqrhn niqe
Dagm bigegnm behat’iat wedqe

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 5
Tesfa atqort’mna amlak beft’reth
Ayleym keene mihret cherneth
Biwedq enesalehu dagm benshe
Endihu besemay yihonal fishe

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 6
Bedngl Maryam begetaye enat
Beaqurarite meat mierage ts’elot
Beenatnet fiqrwa ts’unu new tesfaye
Mihret endemagegn kecher fet’ariye

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 7
Sile qalkidanwa aylegnm chla
Geta yasarfegnal bemhretu t’la
Yeamlak balemwaloch qidusanu hulu
Sile ene dihnet fitu yiqomalu

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tesifa-atikoritimina'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 1
አባቴ አይተወኝም ስለሆንኩኝ ልጁ
አዝ…
በከንቱ ምኞት በዓለም ዳንኪራ
ኃጢአትን ባደረግ አንተን ሳልፈራ

VERSE 2
የመንፈስ ፍሬ ከእኔ ቢታጣ
ሸክሜ ከብዶብኝ ብሆን ጎባጣ
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ

VERSE 3
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

VERSE 4
ዳግም ላልገኝ ከኃጢአት መንደር
ቃል ገብቼልህ እንደ ቃልህ ልኖር
ቃሌን አጥፌ ፍቅርህን ንቄ
ዳግም ብገኝም በኃጢአት ወድቄ

VERSE 5
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

VERSE 6
በድንግል ማርያም በጌታዬ እናት
በአቁራሪተ መዓት ምዕራገ ጸሎት
በእናትነት ፍቅሯ ጹኑ ነው ተስፋዬ
ምህረት እንደማገኝ ከቸር ፈጣሪዬ

VERSE 7
ስለ ቃልኪዳኗ አይለኝም ችላ
ጌታ ያሳርፈኛል በምህረቱ ጥላ
የአምላክ ባለሟሎች ቅዱሳኑ ሁሉ
ስለ እኔ ድኅነት ፊቱ ይቆማሉ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 1
Abate aytewegnm silehonkugn liju
Bekentu mignot bealem dankira
Hat’iatn badereg anten salfera

VERSE 2
Yemenfes fire keene bitat’a
Shekme kebdobgn bihon gobat’a
Tesfa atqort’mna amlak beft’reth
Ayleym keene mihret cherneth

VERSE 3
Biwedq enesalehu dagm benshe
Endihu besemay yihonal fishe

VERSE 4
Dagm lalgegn kehat’iat mender
Qal gebchelh ende qalh linor
Qalen at’fe fiqrhn niqe
Dagm bigegnm behat’iat wedqe

VERSE 5
Tesfa atqort’mna amlak beft’reth
Ayleym keene mihret cherneth
Biwedq enesalehu dagm benshe
Endihu besemay yihonal fishe

VERSE 6
Bedngl Maryam begetaye enat
Beaqurarite meat mierage ts’elot
Beenatnet fiqrwa ts’unu new tesfaye
Mihret endemagegn kecher fet’ariye

VERSE 7
Sile qalkidanwa aylegnm chla
Geta yasarfegnal bemhretu t’la
Yeamlak balemwaloch qidusanu hulu
Sile ene dihnet fitu yiqomalu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tesifa-atikoritimina', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tewedaj Yekidus Mikael Mezimurat Liredagn Meta//yeafomiya Eredat Neh//beberehaw Beharuru (tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe'
    AND lyrics_amharic IS NOT DISTINCT FROM '✞ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል

VERSE 1
መንገድ የመራኸው - - ኃያል ቅዱስ ሚካኤል
የኤርትራን ባህር - - ኃያል ሚካኤል
ከፍለህ ያሻገርከው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 2
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የአፎሚያ ረዳት ነህ ሚካኤል(፪)
ቅሩበ እግዚአብሔር የልዑል
ፈጥነህ ድረስልን ስንጠራህ ሚካኤል

VERSE 3
ፊት ለፊታችን አምላክ ሰደደህ
አቀናህልን መንገዱን ጠርገህ
የቤልሆርን ምክር አፈረስክ
ከልጆችህ ጋር ከነአን ደረስክ

VERSE 4
ከኛ ጋር ነበርክ አርባውን ዘመን
እንጠራሃለን ሚካኤል ብለን
የአፎሚያ ረዳት ነህ ሚካኤል(፪)
ቅሩበ እግዚአብሔር የልዑል

VERSE 5
ፈጥነህ ድረስልን ስንጠራህ ሚካኤል
በበረሃው በሀሩሩ፣
በሚያስፈራው በባሕሩ፣
እስራኤልን የታደገው፣

VERSE 6
በክንፎቹ የጋረደው ሚካኤል ነው።
ሚካኤል ነው አጽናኝ ደጋፊዬ
" " በዱር በበረሃ
" " ነፍሴን ያረካልኝ

VERSE 7
" " ከዓለቱ ውሃ
የፊቴ ፈገግታ የውስጤ ፍስሐ
ከአምላክ የተሠጠኝ በረከት አምሐ።
ሚካኤል ነው ያሳደገኝ መልአክ

VERSE 8
" " በፍቅር የመራኝ
" " ስደክም ያገዘኝ
" " ስወድቅ ያነሳኝ
በነገሬ ሁሉ የቀደመልኝ

VERSE 9
ሚካኤል እርሱ ነው ከጥልቁ ያወጣኝ።
በበረሃው በሀሩሩ፣
በሚያስፈራው በባሕሩ፣
እስራኤልን የታደገው፣

VERSE 10
በክንፎቹ የጋረደው ሚካኤል ነው።'
    AND lyrics_transliteration IS NOT DISTINCT FROM '✞liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael

VERSE 1
Menged yemeraኸw - - hayal Kidus Mikael
Yeertran bahr - - hayal Mikael
Kefleh yashagerkew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 2
Yit’ebqegnal hayal Kidus Mikael
Yeafomiya redat neh Mikael (2)
Qirube Egziabher yelul
Fet’neh diresln sint’erah Mikael

VERSE 3
Fit lefitachn amlak sededeh
Aqenahln mengedun t’ergeh
Yebelhorn mikr aferesk
Keljochh gar kenean deresk

VERSE 4
Kegna gar neberk arbawn zemen
Ent’erahalen Mikael bilen
Yeafomiya redat neh Mikael (2)
Qirube Egziabher yelul

VERSE 5
Fet’neh diresln sint’erah Mikael
Beberehaw beheruru,
Bemiyasferaw bebahru,
Esraeln yetadegew,

VERSE 6
Beknfochu yegaredew Mikael new.
Mikael new ats’nagn degafiye
" " bedur bebereha
" " nefsen yarekalgn

VERSE 7
" " kealetu wiha
Yefite fegegta yewst’e fishe
Keamlak yeteset’egn bereket amhe.
Mikael new yasadegegn melak

VERSE 8
" " befqr yemeragn
" " sidekm yagezegn
" " siwedq yanesagn
Benegere hulu yeqedemelgn

VERSE 9
Mikael ersu new ket’lqu yawet’agn.
Beberehaw beheruru,
Bemiyasferaw bebahru,
Esraeln yetadegew,

VERSE 10
Beknfochu yegaredew Mikael new.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tewelide Iyesus (tewelide-iyesus)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tewelide-iyesus'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 1
በቤተልሔም
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም

VERSE 2
ዘይሁዳ
በቤተልሔም
አዋልድ እለት
ጢሮስ

VERSE 3
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም
አዋልድ እለት

VERSE 4
ጢሮስ
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም

VERSE 5
ተወልዶ ኢየሱስ
በቤተልሔም
በቤተልሔም
በይሁዳ

VERSE 6
በቤተልሔም
ተወልዶ ኢየሱስ
በቤተልሔም
በቤተልሔም

VERSE 7
በይሁዳ
በቤተልሔም
የጢሮስ ልጆች
ሁሉ

VERSE 8
ያን ጊዜ ይሰግዱአሉ
ያን ጊዜ ይሰግዱአሉ
በቤተልሔም
የጢሮስ ልጆች

VERSE 9
ሁሉ
ያን ጊዜ ይሰግዱአሉ
ያን ጊዜ ይሰግዱአሉ
በቤተልሔም

VERSE 10
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም
ዘይሁዳ

VERSE 11
በቤተልሔም
ተወልደ ኢየሱስ
በቤተልሔም
በቤተልሔም

VERSE 12
ዘይሁዳ
በቤተልሔም
አዋልድ እለት
ጢሮስ

VERSE 13
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም
አዋልድ እለት

VERSE 14
ጢሮስ
አሜሃ ይስግድዋ
አሜሃ ይስግድዋ
በቤተልሔም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 1
Bebetelhem
Tewelde Iyesus
Bebetelhem
Bebetelhem

VERSE 2
Zeyhuda
Bebetelhem
Awald elet
T’iros

VERSE 3
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem
Awald elet

VERSE 4
T’iros
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem

VERSE 5
Teweldo Iyesus
Bebetelhem
Bebetelhem
Beyhuda

VERSE 6
Bebetelhem
Teweldo Iyesus
Bebetelhem
Bebetelhem

VERSE 7
Beyhuda
Bebetelhem
Yet’iros lijoch
Hulu

VERSE 8
Yan gize yisegdualu
Yan gize yisegdualu
Bebetelhem
Yet’iros lijoch

VERSE 9
Hulu
Yan gize yisegdualu
Yan gize yisegdualu
Bebetelhem

VERSE 10
Tewelde Iyesus
Bebetelhem
Bebetelhem
Zeyhuda

VERSE 11
Bebetelhem
Tewelde Iyesus
Bebetelhem
Bebetelhem

VERSE 12
Zeyhuda
Bebetelhem
Awald elet
T’iros

VERSE 13
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem
Awald elet

VERSE 14
T’iros
Ameha yisgdwa
Ameha yisgdwa
Bebetelhem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tewelide-iyesus', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Almighty God is Gracious (the-almighty-god-is-gracious)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እግዚአብሔር መልካም ነው
በመከራ ቀንም መሸሸጊያ ነው

VERSE 1
እግዚአብሔር መልካም ነው
በመከራ ቀንም መሸሸጊያ ነው

CHORUS
እግዚአብሔር መልካም ነው
በመከራ ቀንም መሸሸጊያ ነው',
      lyrics_transliteration = 'CHORUS
Egziabher melkam new

VERSE 1
Bemeqera qenim mesheshegiya new

CHORUS
Egziabher melkam new',
      lyrics_english = 'CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 1
When our father Adam was banished from Eden
Death had reigned over us making us feel beaten
As promised to save him so he would not falter
During his suffering He became his shelter

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 2
The Almighty God is gracious
He is my safe haven through times of hardships

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 3
The Almighty God is gracious
He is my safe haven through times of hardships

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 4
The Almighty God is gracious
He is my safe haven through times of hardships

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 5
Abraham left Harran his abode and homeland
With faith entered Canaan following God’s command
He put his hope in Him and he wasn’t deprived
Became vast like the sand his seed was multiplied

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 6
The Almighty God is gracious
He is my safe haven through times of hardships

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 7
The Almighty God is gracious
He is my safe haven through times of hardships

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 8
The Almighty God is gracious
He is my safe haven through times of hardships

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 9
In sorrow and trials times of my misery
From my anxious spirit He removes my worry
Evil serpent of old may rob me of my peace
But my God is gracious my pain came to a cease

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 10
Jesus Christ is gracious my pain came to a cease

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 11
The Almighty God is gracious
He is my safe haven through times of hardships

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 12
The Almighty God is gracious
He is my safe haven through times of hardships

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 13
The Almighty God is gracious
He is my safe haven through times of hardships

CHORUS
The Almighty God is gracious
He is my safe haven through times of hardships',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-almighty-god-is-gracious'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እግዚአብሔር መልካም ነው
በመከራ ቀንም መሸሸጊያ ነው

VERSE 1
እግዚአብሔር መልካም ነው
በመከራ ቀንም መሸሸጊያ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Egziabher melkam new

VERSE 1
Bemeqera qenim mesheshegiya new'
    AND lyrics_english IS NOT DISTINCT FROM 'The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 1
When our father Adam was banished from Eden
Death had reigned over us making us feel beaten
As promised to save him so he would not falter
During his suffering He became his shelter

VERSE 2
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 3
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 4
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 5
Abraham left Harran his abode and homeland
With faith entered Canaan following God’s command
He put his hope in Him and he wasn’t deprived
Became vast like the sand his seed was multiplied

VERSE 6
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 7
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 8
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 9
In sorrow and trials times of my misery
From my anxious spirit He removes my worry
Evil serpent of old may rob me of my peace
But my God is gracious my pain came to a cease

VERSE 10
Jesus Christ is gracious my pain came to a cease

VERSE 11
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 12
The Almighty God is gracious
He is my safe haven through times of hardships

VERSE 13
The Almighty God is gracious
He is my safe haven through times of hardships'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-almighty-god-is-gracious', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Angel (the-angel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
The Angel of the Lord surrounds (Psalm 34:7)
Those who fear him and bounds (Psalm 34:7)
Them from any trap and from harm (Psalm 34:7)
Delivers them who rely on him, delivers them (Psalm 34:7)

VERSE 1
He led the Israelites in the desert (Exodus 23:20)
As he comforted Daniel the prophet (Daniel 10:13-21)
Saint Michael is one of the Arch Angels
Who beseeches mercy for the faithful

CHORUS
The Angel of the Lord surrounds (Psalm 34:7)
Those who fear him and bounds (Psalm 34:7)
Them from any trap and from harm (Psalm 34:7)
Delivers them who rely on him, delivers them (Psalm 34:7)

VERSE 2
He saved the three children in Babylon (Daniel 3:25)
Annunciated Saint Mary the Virgin (Luke 2)
In the presence of God he stands for all (Luke 1:19)
Saint Gabriel intercede so we don’t fall

CHORUS
The Angel of the Lord surrounds (Psalm 34:7)
Those who fear him and bounds (Psalm 34:7)
Them from any trap and from harm (Psalm 34:7)
Delivers them who rely on him, delivers them (Psalm 34:7)

VERSE 3
The Angel of peace with a grace to heal
He gives health, the archangel Raphael
He gave Ezra the chalice of wisdom
Archangel Uriel guide us to freedom

CHORUS
The Angel of the Lord surrounds (Psalm 34:7)
Those who fear him and bounds (Psalm 34:7)
Them from any trap and from harm (Psalm 34:7)
Delivers them who rely on him, delivers them (Psalm 34:7)

VERSE 4
The servants of the Lord are Archangels
They’re our shields in spiritual struggles
They are sent forth to minister for us (Hebrews 1:14)
For our salvation so we could be heirs

CHORUS
The Angel of the Lord surrounds (Psalm 34:7)
Those who fear him and bounds (Psalm 34:7)
Them from any trap and from harm (Psalm 34:7)
Delivers them who rely on him, delivers them (Psalm 34:7)',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-angel'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'The Angel of the Lord surrounds (Psalm 34:7)
Those who fear him and bounds (Psalm 34:7)
Them from any trap and from harm (Psalm 34:7)
Delivers them who rely on him, delivers them (Psalm 34:7)

VERSE 1
He led the Israelites in the desert (Exodus 23:20)
As he comforted Daniel the prophet (Daniel 10:13-21)
Saint Michael is one of the Arch Angels
Who beseeches mercy for the faithful

VERSE 2
He saved the three children in Babylon (Daniel 3:25)
Annunciated Saint Mary the Virgin (Luke 2)
In the presence of God he stands for all (Luke 1:19)
Saint Gabriel intercede so we don’t fall

VERSE 3
The Angel of peace with a grace to heal
He gives health, the archangel Raphael
He gave Ezra the chalice of wisdom
Archangel Uriel guide us to freedom

VERSE 4
The servants of the Lord are Archangels
They’re our shields in spiritual struggles
They are sent forth to minister for us (Hebrews 1:14)
For our salvation so we could be heirs'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-angel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The God of Abraham (the-god-of-abraham)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ

VERSE 1
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ

CHORUS
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ',
      lyrics_transliteration = 'CHORUS
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza

VERSE 1
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza

CHORUS
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza',
      lyrics_english = 'CHORUS
The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver

VERSE 1
With false testimonies on trial they accused Him
Sentencing Him to death our Lord who''s without sin

CHORUS
The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver

VERSE 2
Pilate tortured the Lord shackling Him in chains
His love for the Romans made him side with their fame

CHORUS
The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver

VERSE 3
Holy Virgin Mary her tears she could not hold
As she watched on the Cross her son suffer unclothed

CHORUS
The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver

VERSE 4
The feet that stood on a holy throne made of light
They were nailed for the sins He came to overwrite

CHORUS
The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver

VERSE 5
The one that gave a crown of light to all the saints
Wearing a crown of thorns on Calvary He stayed

CHORUS
The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver

VERSE 6
The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver

CHORUS
The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-god-of-abraham'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ

VERSE 1
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza

VERSE 1
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza'
    AND lyrics_english IS NOT DISTINCT FROM 'The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver

VERSE 1
With false testimonies on trial they accused Him
Sentencing Him to death our Lord who''s without sin

VERSE 2
Pilate tortured the Lord shackling Him in chains
His love for the Romans made him side with their fame

VERSE 3
Holy Virgin Mary her tears she could not hold
As she watched on the Cross her son suffer unclothed

VERSE 4
The feet that stood on a holy throne made of light
They were nailed for the sins He came to overwrite

VERSE 5
The one that gave a crown of light to all the saints
Wearing a crown of thorns on Calvary He stayed

VERSE 6
The God of Abraham and Issac''s true Savior
Paid our debt though His blood His love does not waver'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-god-of-abraham', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Gracious and Adored Interceder (the-gracious-and-adored-interceder)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Cheritu amalajitu hoy
Enatu neshina le Adonay
Be Silassie fit siltan yalesh
Ye bahiryachin memekya nesh',
      lyrics_english = 'CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 1
Cheritu amalajitu hoy
Enatu neshina le Adonay
Be Silassie fit siltan yalesh
Ye bahiryachin memekya nesh

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 2
The one who was living in grief
Through your Son came peace and relief
When you gave birth to Jesus Christ
Adam gained his freedom and might

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 3
For those who cry out your name
And for those who will venerate
The Lord gave a covenant
To save us from the last judgement

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 4
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 5
He’s mindful our God from above
Calming His children with His love
For you stand on the Lord’s right side
For sinners plead and be their guide

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 6
For those who cry out your name
And for those who will venerate
The Lord gave a covenant
To save us from the last judgement

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 7
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 8
Descended from the highest realm
Adorned in the nature we claim
Revealed in your arms our lady
Held divine for our query

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 9
For those who cry out your name
And for those who will venerate
The Lord gave a covenant
To save us from the last judgement

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 10
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 11
A treaty for restoration
O Zion for our salvation
Citizens of Heaven and Earth
All rejoice in the one you birthed

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 12
For those who cry out your name
And for those who will venerate
The Lord gave a covenant
To save us from the last judgement

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 13
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 14
Cheritu amalajitu hoy
Enatu neshina le Adonay
Be Silassie fit siltan yalesh
Ye bahiryachin memekya nesh

CHORUS
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-gracious-and-adored-interceder'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Cheritu amalajitu hoy
Enatu neshina le Adonay
Be Silassie fit siltan yalesh
Ye bahiryachin memekya nesh'
    AND lyrics_english IS NOT DISTINCT FROM 'The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 1
Cheritu amalajitu hoy
Enatu neshina le Adonay
Be Silassie fit siltan yalesh
Ye bahiryachin memekya nesh

VERSE 2
The one who was living in grief
Through your Son came peace and relief
When you gave birth to Jesus Christ
Adam gained his freedom and might

VERSE 3
For those who cry out your name
And for those who will venerate
The Lord gave a covenant
To save us from the last judgement

VERSE 4
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 5
He’s mindful our God from above
Calming His children with His love
For you stand on the Lord’s right side
For sinners plead and be their guide

VERSE 6
For those who cry out your name
And for those who will venerate
The Lord gave a covenant
To save us from the last judgement

VERSE 7
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 8
Descended from the highest realm
Adorned in the nature we claim
Revealed in your arms our lady
Held divine for our query

VERSE 9
For those who cry out your name
And for those who will venerate
The Lord gave a covenant
To save us from the last judgement

VERSE 10
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 11
A treaty for restoration
O Zion for our salvation
Citizens of Heaven and Earth
All rejoice in the one you birthed

VERSE 12
For those who cry out your name
And for those who will venerate
The Lord gave a covenant
To save us from the last judgement

VERSE 13
The gracious and adored interceder
For our God you are truly His mother
You were chosen by the Trinity
So the human race takes after thee

VERSE 14
Cheritu amalajitu hoy
Enatu neshina le Adonay
Be Silassie fit siltan yalesh
Ye bahiryachin memekya nesh'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-gracious-and-adored-interceder', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Holy Apostle (the-holy-apostle)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 1
So God may save our souls
Out of his mercy and his compassion, for the sake of his holy name!
The Holy Apostle Saint Paul, the righteous,
The healer of the sick, your message is virtuous!

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 2
Beseech beseech and pray for all of us
So God may save our souls /x2/
The persecutor who turned out to be God’s messenger
And a pharisee yet a teacher for non-believers

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 3
We learned from you that God can change our past
Through our life if we preach the crucified Christ
You discount your status for the sake of those who are lost
Enduring many trials, you preached Jesus at any cost

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 4
For that you received a crown of righteousness
Became a role model for all the Christians
When you’re sick God’s power became perfect in your weakness
His grace was sufficient that led you to strive for greatness

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 5
Pray for us to be His chosen vessels
So we imitate you and all your lessons

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-holy-apostle'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 1
So God may save our souls
Out of his mercy and his compassion, for the sake of his holy name!
The Holy Apostle Saint Paul, the righteous,
The healer of the sick, your message is virtuous!

VERSE 2
Beseech beseech and pray for all of us
So God may save our souls /x2/
The persecutor who turned out to be God’s messenger
And a pharisee yet a teacher for non-believers

VERSE 3
We learned from you that God can change our past
Through our life if we preach the crucified Christ
You discount your status for the sake of those who are lost
Enduring many trials, you preached Jesus at any cost

VERSE 4
For that you received a crown of righteousness
Became a role model for all the Christians
When you’re sick God’s power became perfect in your weakness
His grace was sufficient that led you to strive for greatness

VERSE 5
Pray for us to be His chosen vessels
So we imitate you and all your lessons'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-holy-apostle', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Lord Has Risen (the-lord-has-risen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Geta tenestual elil elil belu
Amlak tenestual yemisirach belu
Musina mekabir be haylu atfito
Hulachin ayenew Kiristos tenesto',
      lyrics_english = 'CHORUS
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

VERSE 1
The covenant He gave promised to save Adam
From the verdict of death to pay off his ransom
He came from the heavens crucified for our blame
Erased death with His death witnesses we became

CHORUS
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

VERSE 2
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

CHORUS
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

VERSE 3
Disciples of our Lord were truly in distress
From the death of their God sorrow was in excess
While they were gathering not knowing what to do
He appeared to them and Jesus said peace to you

CHORUS
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

VERSE 4
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

CHORUS
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

VERSE 5
Mary Magdalene was walking with misery
Before the rise of dawn her God she went to see
The one who was tortured called the King of the Jews
She found Jesus risen and went to spread the news

CHORUS
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

VERSE 6
Geta tenestual elil elil belu
Amlak tenestual yemisirach belu
Musina mekabir be haylu atfito
Hulachin ayenew Kiristos tenesto

CHORUS
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-lord-has-risen'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Geta tenestual elil elil belu
Amlak tenestual yemisirach belu
Musina mekabir be haylu atfito
Hulachin ayenew Kiristos tenesto'
    AND lyrics_english IS NOT DISTINCT FROM 'The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

VERSE 1
The covenant He gave promised to save Adam
From the verdict of death to pay off his ransom
He came from the heavens crucified for our blame
Erased death with His death witnesses we became

VERSE 2
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

VERSE 3
Disciples of our Lord were truly in distress
From the death of their God sorrow was in excess
While they were gathering not knowing what to do
He appeared to them and Jesus said peace to you

VERSE 4
The Lord has risen let us all sing and shout
Our God has risen spread the good news about
With His might He destroyed the death and corruption
We all have bore witness Jesus Christ has risen

VERSE 5
Mary Magdalene was walking with misery
Before the rise of dawn her God she went to see
The one who was tortured called the King of the Jews
She found Jesus risen and went to spread the news

VERSE 6
Geta tenestual elil elil belu
Amlak tenestual yemisirach belu
Musina mekabir be haylu atfito
Hulachin ayenew Kiristos tenesto'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-lord-has-risen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Old is Gone (the-old-is-gone)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 1
I left my father’s home (Luke 15:11)
I thought there’s something better
I was eating with swine
I lived like a beggar

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 2
Thinking of how evil that I have been
I went to my father without hesitation He forgave my sins

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 3
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 4
The sickness and the pain (Matthew 9:20)
All that I’ve endured
The blood from my body
Made me feel impure

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 5
I knew my savior would heal me I was sure
When I touched His garment twelve years of disease suddenly I was cured

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 6
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 7
Every day I watched (John 5:1-15)
Others being healed
Unable to move
Sadness I would feel

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 8
The Lord was my hope He came to rescue me
“Carry your bed” said the King, and I was set free

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 9
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 10
Dear Lord remember not
The sins I’ve committed
I’m done with my past
My heart I’ve submitted

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 11
My journey is not done so I go forward
I will not give up until I receive my heavenly reward.

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 12
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

CHORUS
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-old-is-gone'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 1
I left my father’s home (Luke 15:11)
I thought there’s something better
I was eating with swine
I lived like a beggar

VERSE 2
Thinking of how evil that I have been
I went to my father without hesitation He forgave my sins

VERSE 3
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 4
The sickness and the pain (Matthew 9:20)
All that I’ve endured
The blood from my body
Made me feel impure

VERSE 5
I knew my savior would heal me I was sure
When I touched His garment twelve years of disease suddenly I was cured

VERSE 6
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 7
Every day I watched (John 5:1-15)
Others being healed
Unable to move
Sadness I would feel

VERSE 8
The Lord was my hope He came to rescue me
“Carry your bed” said the King, and I was set free

VERSE 9
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night

VERSE 10
Dear Lord remember not
The sins I’ve committed
I’m done with my past
My heart I’ve submitted

VERSE 11
My journey is not done so I go forward
I will not give up until I receive my heavenly reward.

VERSE 12
The old is gone the new has come (2nd Corinthians 5:17)
I have been made new in Christ
The old is gone the new has come
My King comes shining in the night'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-old-is-gone', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Purest of the Pure (the-purest-of-the-pure)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 1
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 2
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 3
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 4
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 5
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 6
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 7
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 8
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 9
The adorned temple of God
The queen who will stand upon God''s right side
When Eve sinned, we were exiled
But we''re given a mother who''s our pride

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 10
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 11
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 12
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 13
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 14
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 15
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 16
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 17
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 18
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-purest-of-the-pure'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 1
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

VERSE 2
The holiest of the holies by far
The shiniest of all the stars

VERSE 3
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 4
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

VERSE 5
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 6
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

VERSE 7
The holiest of the holies by far
The shiniest of all the stars

VERSE 8
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 9
The adorned temple of God
The queen who will stand upon God''s right side
When Eve sinned, we were exiled
But we''re given a mother who''s our pride

VERSE 10
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 11
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

VERSE 12
The holiest of the holies by far
The shiniest of all the stars

VERSE 13
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 14
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

VERSE 15
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 16
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

VERSE 17
The holiest of the holies by far
The shiniest of all the stars

VERSE 18
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-purest-of-the-pure', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Spirit (the-spirit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
The spirit within me that abides
You are my true teacher and my guide (John 14:26)
One with the Father and the Son
I worship You with devotion (2)

VERSE 1
As Christ had promised You came (John 16:7)
Your temple is what my soul became
You kindled my heart like a flame (2)

CHORUS
The spirit within me that abides
You are my true teacher and my guide (John 14:26)
One with the Father and the Son
I worship You with devotion (2)

VERSE 2
Like the wind blows where it wishes (John 3:8)
With the abundance of Your riches
Come dwell in me Holy Spirit (2)

CHORUS
The spirit within me that abides
You are my true teacher and my guide (John 14:26)
One with the Father and the Son
I worship You with devotion (2)

VERSE 3
Holy Spirit descend from above (Matthew 3:16)
My paraclete immaculate dove
I am sealed with Your forgiving love (2) (Ephesians 4:30)

CHORUS
The spirit within me that abides
You are my true teacher and my guide (John 14:26)
One with the Father and the Son
I worship You with devotion (2)

VERSE 4
With you leading me to the truth (John 16:13)
I walk in Christ in the days of my youth
I will pour Your praise from my mouth (2)

CHORUS
The spirit within me that abides
You are my true teacher and my guide (John 14:26)
One with the Father and the Son
I worship You with devotion (2)',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-spirit'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'The spirit within me that abides
You are my true teacher and my guide (John 14:26)
One with the Father and the Son
I worship You with devotion (2)

VERSE 1
As Christ had promised You came (John 16:7)
Your temple is what my soul became
You kindled my heart like a flame (2)

VERSE 2
Like the wind blows where it wishes (John 3:8)
With the abundance of Your riches
Come dwell in me Holy Spirit (2)

VERSE 3
Holy Spirit descend from above (Matthew 3:16)
My paraclete immaculate dove
I am sealed with Your forgiving love (2) (Ephesians 4:30)

VERSE 4
With you leading me to the truth (John 16:13)
I walk in Christ in the days of my youth
I will pour Your praise from my mouth (2)'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-spirit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Stars (the-stars)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
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
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-stars'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'The Stars that shine in the darkness
Fountains of hope in the desert
Listen to the march of the martyrs
The heroes and fighters of the faith

VERSE 1
Defenders of the Faith.
The first martyr Saint Stephen
While they were stoning you, you showed your mercy
For that You saw in the heavens the Holy Trinity

VERSE 2
How you lived and died is Christ’s reflection
And your faith inspires our generation
Oh! Saint Stephen the first martyr defender of the faith.
The Stars…

VERSE 3
The Armenian virgin Saint Arsema (Rasphime)
When the king lusted after your beauty.
He didn’t know you kept yourself in purity
You loved Christ till death with true affection

VERSE 4
And your faith inspires our generation!
Oh! Saint Arsema the Armenian virgin defender of the faith
The Stars…
Saint George the Roman soldier

VERSE 5
With your faith in Christ, you slayed the beast
In the heavens you sit, today with the high priest
You overcame trials and tribulations
And your faith inspires our generation!

VERSE 6
O! Saint George the Roman soldier defender of the faith.
The Stars…
The thirty martyrs of Orthodox
Enemies of Christ they waged a war

VERSE 7
You answered the call on the Libyan shore
You received your crown with persecution
And your faith inspires our generation!
O! Martyrs of the Libyan shore, defenders of the faith.'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-stars', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: The Virgin Gave Birth to Her Creator (the-virgin-gave-birth-to-her-creator)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደርያ

VERSE 1
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደርያ

CHORUS
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደርያ',
      lyrics_transliteration = 'CHORUS
Dingil fetariwan weledachew
Bemeteqeleyaam teqeqelelechew

VERSE 1
Yelemna sifra lengdoch marefiya
Girigm astengachew bekebtoch maderiya

CHORUS
Dingil fetariwan weledachew
Bemeteqeleyaam teqeqelelechew',
      lyrics_english = 'CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 1
She became overwhelmed, the city of David
The miracle of the birth of our great Lord
To announce the good news, the Angel descended.
It shined as a bright light, The glory of the child.

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 2
This is a mystery, that cannot be expressed,
But in her heart Virgin Mary kept it guarded (2)

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 3
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 4
The wise men they arrived from the eastern nations
They brought gold, incense, myrrh, to the child’s location
They found the baby while carried by his mother
They proclaimed of this birth, to all of the others.

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 5
This is a mystery, that cannot be expressed,
But in her heart Virgin Mary kept it guarded (2)

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 6
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 7
The land of Judah was filled with glory and praise
A Galilean king has come from Nazareth
about this miracle, let Bethlehem proclaim
When she stopped the census, for heavenly worship

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 8
This is a mystery, that cannot be expressed,
But in her heart Virgin Mary kept it guarded (2)

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 9
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 10
God became a human, he who could not be seen
As the second Adam, he came as a person
His wisdom mesmerized the young, and perfect bride
The word had become flesh, it became unified

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 11
This is a mystery, that cannot be expressed,
But in her heart Virgin Mary kept it guarded (2)

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 12
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 13
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 14
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

CHORUS
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'the-virgin-gave-birth-to-her-creator'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደርያ

VERSE 1
ድንግል ፈጣሪዋን ወለደችው
በመጠቅለያም ጠቀቀለለችው
የለምና ስፍራ ለንግዶች ማረፊያ
ግርግም አስተኛችው በከብቶች ማደርያ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Dingil fetariwan weledachew
Bemeteqeleyaam teqeqelelechew

VERSE 1
Yelemna sifra lengdoch marefiya
Girigm astengachew bekebtoch maderiya'
    AND lyrics_english IS NOT DISTINCT FROM 'The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 1
She became overwhelmed, the city of David
The miracle of the birth of our great Lord
To announce the good news, the Angel descended.
It shined as a bright light, The glory of the child.

VERSE 2
This is a mystery, that cannot be expressed,
But in her heart Virgin Mary kept it guarded (2)

VERSE 3
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 4
The wise men they arrived from the eastern nations
They brought gold, incense, myrrh, to the child’s location
They found the baby while carried by his mother
They proclaimed of this birth, to all of the others.

VERSE 5
This is a mystery, that cannot be expressed,
But in her heart Virgin Mary kept it guarded (2)

VERSE 6
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 7
The land of Judah was filled with glory and praise
A Galilean king has come from Nazareth
about this miracle, let Bethlehem proclaim
When she stopped the census, for heavenly worship

VERSE 8
This is a mystery, that cannot be expressed,
But in her heart Virgin Mary kept it guarded (2)

VERSE 9
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 10
God became a human, he who could not be seen
As the second Adam, he came as a person
His wisdom mesmerized the young, and perfect bride
The word had become flesh, it became unified

VERSE 11
This is a mystery, that cannot be expressed,
But in her heart Virgin Mary kept it guarded (2)

VERSE 12
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 13
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.

VERSE 14
The Virgin gave birth to her creator
In swaddling clothes, laid in a manger
There was no room at all, a place to rest for guests
St. Mary found a barn, to let her baby rest.'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'the-virgin-gave-birth-to-her-creator', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Theotokos (theotokos)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 1
Isaiah saw this mystery (Isaiah 7:14)
About your virginity
When you read his prophecy
You showed your humility

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 2
You shall rejoice O God bearer! (Luke 1:28)
Since you gave us the redeemer
We lift our eyes to you and pray
For your compassion today

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 3
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 4
You are the true censer of gold (Exodus 30:1-9) (Leviticus 16:12)
Since you carried the burning coal
You are also like Aarons rod (Numbers 17:8)
Without seed you brought us God

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 5
O! Mary joy of angels
The Virgin foretold by the prophets
Rejoice for you have found favor (Luke 1:28)
God’s grace is yours forever

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 6
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'theotokos'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 1
Isaiah saw this mystery (Isaiah 7:14)
About your virginity
When you read his prophecy
You showed your humility

VERSE 2
You shall rejoice O God bearer! (Luke 1:28)
Since you gave us the redeemer
We lift our eyes to you and pray
For your compassion today

VERSE 3
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 4
You are the true censer of gold (Exodus 30:1-9) (Leviticus 16:12)
Since you carried the burning coal
You are also like Aarons rod (Numbers 17:8)
Without seed you brought us God

VERSE 5
O! Mary joy of angels
The Virgin foretold by the prophets
Rejoice for you have found favor (Luke 1:28)
God’s grace is yours forever

VERSE 6
Theotokos (4)
You’re truly full of wonder
You’re truly our mother'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'theotokos', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: There Is No One Like You (there-is-no-one-like-you)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Yalante lene man lihonegn
Geta hoy fikrih liben nekagn
Higih nebere yafe mefcha
Yematiqeyer ante bicha',
      lyrics_english = 'CHORUS
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 1
On my boat your teachings will be heard
My heart is a net to grasp your word
When day turns to night your love will stand
The fish multiplied by your command

CHORUS
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 2
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

CHORUS
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 3
You are dear to me God my treasure
My home and life are yours forever
You leveled the hills and now its clear
With you by my side there’s none to fear

CHORUS
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 4
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

CHORUS
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 5
Today I regret those lonely days
Living in darkness against your ways
Now I know your love sweet as honey
What life is there without you for me

CHORUS
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 6
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

CHORUS
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 7
You exiled them our enemies
We navigated adversities
Tomorrow is a new day of praise
We’ll sing to our Lord and God always

CHORUS
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 8
Yalante lene man lihonegn
Geta hoy fikrih liben nekagn
HIgih nebere yafe mefcha
Yematiqeyer ante bicha

CHORUS
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'there-is-no-one-like-you'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yalante lene man lihonegn
Geta hoy fikrih liben nekagn
Higih nebere yafe mefcha
Yematiqeyer ante bicha'
    AND lyrics_english IS NOT DISTINCT FROM 'There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 1
On my boat your teachings will be heard
My heart is a net to grasp your word
When day turns to night your love will stand
The fish multiplied by your command

VERSE 2
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 3
You are dear to me God my treasure
My home and life are yours forever
You leveled the hills and now its clear
With you by my side there’s none to fear

VERSE 4
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 5
Today I regret those lonely days
Living in darkness against your ways
Now I know your love sweet as honey
What life is there without you for me

VERSE 6
There is no one like you Lord for me
Touching my heart your love set me free
Your laws have become my foundation
Everlasting you are salvation

VERSE 7
You exiled them our enemies
We navigated adversities
Tomorrow is a new day of praise
We’ll sing to our Lord and God always

VERSE 8
Yalante lene man lihonegn
Geta hoy fikrih liben nekagn
HIgih nebere yafe mefcha
Yematiqeyer ante bicha'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'there-is-no-one-like-you', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: There Is Power in Your Words (there-is-power-in-your-words)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih',
      lyrics_english = 'CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 1
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
Kadesh the great frightening desert

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 2
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 3
We have passed through without feeling thirst
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 4
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 5
The walls of Jericho fell with shouts
Enemies will fall without a doubt
Marvelous how we took the city
It is by your will God almighty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 6
It is by your will Lord almighty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 7
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 8
Surpassing the trials and hardships
The marah water changed from tasteless
If we receive manna from above
Its because you are the God of Love

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 9
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 10
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty
Through your grace you changed our story

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 11
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 12
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 13
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 14
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 15
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'there-is-power-in-your-words'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih'
    AND lyrics_english IS NOT DISTINCT FROM 'There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 1
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
Kadesh the great frightening desert

VERSE 2
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 3
We have passed through without feeling thirst
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty

VERSE 4
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 5
The walls of Jericho fell with shouts
Enemies will fall without a doubt
Marvelous how we took the city
It is by your will God almighty

VERSE 6
It is by your will Lord almighty

VERSE 7
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 8
Surpassing the trials and hardships
The marah water changed from tasteless
If we receive manna from above
Its because you are the God of Love

VERSE 9
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 10
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty
Through your grace you changed our story

VERSE 11
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 12
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 13
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 14
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

VERSE 15
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'there-is-power-in-your-words', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Through The Desert (through-the-desert)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
በብረሃ በሃሩሩ
በምያስፈራ በባህሩ
እስራኤልን የታደገ
በክንፎቹ የጋረደው ሚካኤል ነው

VERSE 1
በብረሃ በሃሩሩ
በምያስፈራ በባህሩ
እስራኤልን የታደገ
በክንፎቹ የጋረደው ሚካኤል ነው

CHORUS
በብረሃ በሃሩሩ
በምያስፈራ በባህሩ
እስራኤልን የታደገ
በክንፎቹ የጋረደው ሚካኤል ነው',
      lyrics_transliteration = 'CHORUS
Bebereha beharruru
Bemiyasfera bebahiru

VERSE 1
Esraelen yetadeghe
Bekinfachu yegaredow Mikael new

CHORUS
Bebereha beharruru
Bemiyasfera bebahiru',
      lyrics_english = 'CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 1
Saint Micheal is…… my support and my strength
Saint Micheal is…… protection in the wild
Saint Micheal is…… he who sated my soul
Saint Micheal is…… with water from the stone

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 2
The reason for my smile and my hearts inner joy
My blessing from the Lord my gift forevermore

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 3
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 4
Saint Micheal is…… the one who brought lighetning
Saint Micheal is…… and who conquered our foes
Saint Micheal is…… Baharan’s beloved
Saint Micheal is…… who cast out his sorrow

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 5
The one who built his house who stood him on his feet
As mother and father he wed him with much glee

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 6
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 7
Saint Micheal is…… who raised me from my youth
Saint Micheal is…… guiding me toward the truth
Saint Micheal is…… my support when I’m weak
Saint Micheal is…… my aid in times of need

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 8
In all of my struggles he was there through it all
Truly it is Micheal who saved me from the falls

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 9
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 10
Saint Micheal is…… he who changed my story
Saint Micheal is…… erased my bonds of debt
Saint Micheal is…… by his intercession
Saint Micheal is…… who saved me from my death

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 11
He leads me on my path from near and from afar
He has written his love in the depths of my heart

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 12
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

CHORUS
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'through-the-desert'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በብረሃ በሃሩሩ
በምያስፈራ በባህሩ
እስራኤልን የታደገ
በክንፎቹ የጋረደው ሚካኤል ነው

VERSE 1
በብረሃ በሃሩሩ
በምያስፈራ በባህሩ
እስራኤልን የታደገ
በክንፎቹ የጋረደው ሚካኤል ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Bebereha beharruru
Bemiyasfera bebahiru

VERSE 1
Esraelen yetadeghe
Bekinfachu yegaredow Mikael new'
    AND lyrics_english IS NOT DISTINCT FROM 'Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 1
Saint Micheal is…… my support and my strength
Saint Micheal is…… protection in the wild
Saint Micheal is…… he who sated my soul
Saint Micheal is…… with water from the stone

VERSE 2
The reason for my smile and my hearts inner joy
My blessing from the Lord my gift forevermore

VERSE 3
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 4
Saint Micheal is…… the one who brought lighetning
Saint Micheal is…… and who conquered our foes
Saint Micheal is…… Baharan’s beloved
Saint Micheal is…… who cast out his sorrow

VERSE 5
The one who built his house who stood him on his feet
As mother and father he wed him with much glee

VERSE 6
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 7
Saint Micheal is…… who raised me from my youth
Saint Micheal is…… guiding me toward the truth
Saint Micheal is…… my support when I’m weak
Saint Micheal is…… my aid in times of need

VERSE 8
In all of my struggles he was there through it all
Truly it is Micheal who saved me from the falls

VERSE 9
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings

VERSE 10
Saint Micheal is…… he who changed my story
Saint Micheal is…… erased my bonds of debt
Saint Micheal is…… by his intercession
Saint Micheal is…… who saved me from my death

VERSE 11
He leads me on my path from near and from afar
He has written his love in the depths of my heart

VERSE 12
Through the desert and the barren
Through the perils of the ocean
The archangel Saint Micheal is
The one who saved Israel by his mighty wings'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'through-the-desert', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tiezazih Kebedegn (tiezazih-kebedegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 1
ቀድሞ በነበረው በብሉይ ኪዳን ሥር
እንደተፃፈው ነው የለመድኩት ፍቅር
ተቸግሬ ሳለ ወዳጄን ለመውደድ
አራከው ከበደኝ የሀዲሱ መንገድ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 2
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ
ሞቴን ለሚናፍቅ እንዴት ይጸለያል
የሚረግመኝ ጠላት ለምን ይመረቃል

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 3
መጎናፀፊያዬን ከወስደብኝ ሰው
በእጥፍ መቀበል ነው እኔ ምፈልገው !
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 4
ቀኜን ለሚመታኝ ግራዬን አልሰጥም
ስለ ዓይን ዓይን ነው ልማዴን አለቅም
ጠላትህን ጥላ ወዳጅህን ውደድ
እሱ ነው ሰላሜ የለመድኩት መንገድ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 5
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ',
      lyrics_transliteration = 'CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 1
Qedmo beneberew bebluy kidan sir
Endetets’afew new yelemedkut fiqr
Techegre sale wedajen lemewded
Arakew kebedegn yehedisu menged

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 2
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta
Moten leminafq endet yits’eleyal
Yemiregmegn t’elat lemn yimereqal

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 3
Megonats’efiyayen kewesdebgn sew
Beet’f meqebel new ene mifelgew !
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 4
Qegnen lemimetagn girayen alset’m
Sile ayn ayn new limaden aleqm
T’elathn t’la wedajhn wided
Esu new selame yelemedkut menged

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 5
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tiezazih-kebedegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 1
ቀድሞ በነበረው በብሉይ ኪዳን ሥር
እንደተፃፈው ነው የለመድኩት ፍቅር
ተቸግሬ ሳለ ወዳጄን ለመውደድ
አራከው ከበደኝ የሀዲሱ መንገድ

VERSE 2
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ
ሞቴን ለሚናፍቅ እንዴት ይጸለያል
የሚረግመኝ ጠላት ለምን ይመረቃል

VERSE 3
መጎናፀፊያዬን ከወስደብኝ ሰው
በእጥፍ መቀበል ነው እኔ ምፈልገው !
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ

VERSE 4
ቀኜን ለሚመታኝ ግራዬን አልሰጥም
ስለ ዓይን ዓይን ነው ልማዴን አለቅም
ጠላትህን ጥላ ወዳጅህን ውደድ
እሱ ነው ሰላሜ የለመድኩት መንገድ

VERSE 5
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 1
Qedmo beneberew bebluy kidan sir
Endetets’afew new yelemedkut fiqr
Techegre sale wedajen lemewded
Arakew kebedegn yehedisu menged

VERSE 2
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta
Moten leminafq endet yits’eleyal
Yemiregmegn t’elat lemn yimereqal

VERSE 3
Megonats’efiyayen kewesdebgn sew
Beet’f meqebel new ene mifelgew !
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta

VERSE 4
Qegnen lemimetagn girayen alset’m
Sile ayn ayn new limaden aleqm
T’elathn t’la wedajhn wided
Esu new selame yelemedkut menged

VERSE 5
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tiezazih-kebedegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: tigrgna orthodex mezmur zemarit hewan gebreanenia (tigrgna-orthodex-mezmur-zemarit-hewan-gebreanenia)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 1
ንዘልኣለም ተበጃውነቱ ፀኒዑ
ንዘልኣለም ጸላም ካብ ቅድሜና ጠፊኡ
ንዘልኣለም መልህቅና ኮይኑ መሪሕ ብርሃን
ንዘልኣለም ንሓጎስ ዕልልታ መፂልና ዘመን

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 2
መቅፃዕቲ ሓጥያት ደምሲሱ ኣብ መስቀል
ናይ ዕዳ ፅሕፈት ሓቢሱ ብደም
ፀልማት መቃብር ብብርሃን ጥሒሱ
ህይወት ሂቡና ንሞት ኣፍሪሱ

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 3
ንዘልኣለም እምኒ ልብና ተሰቢሩ
ንዘልኣለም ብልሙሉም ስጋ ተቀይሩ
ንዘልኣለም ከይሓድገና ከይንስበር
ንዘልኣለም ብደሙ ኣቲልና ፅኑዕ ኪዳን

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 4
ሊቀካህናት ሓንሳብ ሲዒሩ
ዘልኣለም ዝፀንዕ ዕርቂ ቀሚሩ
ካብ ፍርዲ ፀጋ ኪዳን ኣፅኒዑ
ዘይግደብ ምሕረት ረኪብና ሽዑ

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 5
ኣሜን ሂብካና ሓዱሽ ዘመን
ስለምሕረትካ ጎይታ ተመስገን
ኣሜን ተመስገነልና ብሓዱሽ ዜማ
ልዕል በለልና ኢካ ብዓል ግርማ

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 6
ኣሜን ኣምልኾ ስግደት ንዓካ ጥራይ
ኣቦና ኢየሱስ ህይወት ወሃባይ
ሰላማዊ ኢየሱስ መሊኡና ሰላም
ንንስሃ ዕድመ ሂቡና እዩ ዳግም

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 7
ስለዘይደሊ ሓደኳ ክጠፍእ
ብናይ ፍቅሪ ቋንቋ ንኩሉ ይፅውዕ
ዕልል ዕልል እንዳበልና ንውድሰካ
ስለዝፈቀድካ ክንነብር ምሳካ

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 8
ብምስጋና ስብሓት ንስሙ ኣልዒልና
ፍፁም ኣይንፀግቦን ነቲ ዘድሓነና
ጭብጨባ ዕልልታ ንኢየሱስ ይኩን
ኩሉ ሓዲስዎ''ዩ ኣረጊት የለን

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 9
ንገሰልና ኢየሱስ ተመስገን
ዝሃብካና ነዚ ፍሉይ ምድሓን
ትጉህ ሓላዊና ኣብ ሓዱሽ ዓመት
ይክበር ይንገሰልና ኣብ ሓዱሽ ዓመት

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 10
ንዑዑ ክንውድስ ኣብ ሓዱሽ ዓመት
ከቶ ኳ ኣይደክመና ኣብ ሓዱሽ ዓመት
የዋህን ትሑትን ኣብ ሓዱሽ ዓመት
ሸክምና ተራግፍ ኣብ ሓዱሽ ዓመት

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 11
ፍቅርካ ከም ዝናብ ኣብ ሓዱሽ ዓመት
ነናሻዕ ይዘንብ ኣብ ሓዱሽ ዓመት
ጎይታ ምሳና''ዩ ኣብ ሓዱሽ ዓመት
መን ክቃወመና ኣብ ሓዱሽ ዓመት

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 12
ረዲኡና ዩ ሞ ኣብ ሓዱሽ ዓመት
ምስጋና ንስሙ ኣብ ሓዱሽ ዓመት

CHORUS
ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም',
      lyrics_transliteration = 'CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 1
Nizelalem tebejawnetu ts’eniu
Nizelalem ts’elam kab qidmena t’efiu
Nizelalem melhqna koynu merih birhan
Nizelalem nihagos ellta mets’ilna zemen

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 2
Meqts’aeti hat’yat demsisu ab mesqel
Nay eda ts’hfet habisu bidem
Ts’elmat meqabr bibrhan t’hisu
Hiywet hibuna nimot afrisu

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 3
Nizelalem emni libna tesebiru
Nizelalem bilmulum siga teqeyru
Nizelalem keyhadgena keynsber
Nizelalem bidemu atilna ts’nue kidan

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 4
Liqekahnat hansab siiru
Zelalem zits’ene erqi qemiru
Kab firdi ts’ega kidan ats’niu
Zeygdeb mihret rekibna shu

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 5
Amen hibkana hadush zemen
Silemhretka goyta temesgen
Amen temesgenelna bihadush zema
Liel belelna ika bial girma

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 6
Amen amlኾ sigdet niaka t’ray
Abona Iyesus hiywet wehabay
Selamawi Iyesus meliuna selam
Ninsha edme hibuna eyu dagm

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 7
Silezeydeli hadekwa kit’efe
Binay fiqri qwanqwa nikulu yits’we
Ell ell endabelna niwdseka
Silezfeqedka kinnebr misaka

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 8
Bimsgana sibhat nismu alilna
Fits’um aynts’egbon neti zedhanena
Ch’bch’eba ellta niiyesus yikun
Kulu hadiswo''yu aregit yelen

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 9
Nigeselna Iyesus temesgen
Zihabkana nezi filuy midhan
Tiguh halawina ab hadush amet
Yikber yingeselna ab hadush amet

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 10
Niuu kinwds ab hadush amet
Keto kwa aydekmena ab hadush amet
Yewahn tihutn ab hadush amet
Shekmna teragf ab hadush amet

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 11
Fiqrka kem zinab ab hadush amet
Nenashae yizenb ab hadush amet
Goyta misana''yu ab hadush amet
Men kiqawemena ab hadush amet

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 12
Rediuna yu mo ab hadush amet
Misgana nismu ab hadush amet

CHORUS
Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tigrgna-orthodex-mezmur-zemarit-hewan-gebreanenia'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሓዱሽ ልቢ ሓዱሽ መንፈስ
ሓዱሽ ኪዳን ብደሙ ምፍሳስ
ኮይኑልና ዕርቂ ንዘልኣለም
ሳላ ኢየሱስ ኣቦ ሰላም

VERSE 1
ንዘልኣለም ተበጃውነቱ ፀኒዑ
ንዘልኣለም ጸላም ካብ ቅድሜና ጠፊኡ
ንዘልኣለም መልህቅና ኮይኑ መሪሕ ብርሃን
ንዘልኣለም ንሓጎስ ዕልልታ መፂልና ዘመን

VERSE 2
መቅፃዕቲ ሓጥያት ደምሲሱ ኣብ መስቀል
ናይ ዕዳ ፅሕፈት ሓቢሱ ብደም
ፀልማት መቃብር ብብርሃን ጥሒሱ
ህይወት ሂቡና ንሞት ኣፍሪሱ

VERSE 3
ንዘልኣለም እምኒ ልብና ተሰቢሩ
ንዘልኣለም ብልሙሉም ስጋ ተቀይሩ
ንዘልኣለም ከይሓድገና ከይንስበር
ንዘልኣለም ብደሙ ኣቲልና ፅኑዕ ኪዳን

VERSE 4
ሊቀካህናት ሓንሳብ ሲዒሩ
ዘልኣለም ዝፀንዕ ዕርቂ ቀሚሩ
ካብ ፍርዲ ፀጋ ኪዳን ኣፅኒዑ
ዘይግደብ ምሕረት ረኪብና ሽዑ

VERSE 5
ኣሜን ሂብካና ሓዱሽ ዘመን
ስለምሕረትካ ጎይታ ተመስገን
ኣሜን ተመስገነልና ብሓዱሽ ዜማ
ልዕል በለልና ኢካ ብዓል ግርማ

VERSE 6
ኣሜን ኣምልኾ ስግደት ንዓካ ጥራይ
ኣቦና ኢየሱስ ህይወት ወሃባይ
ሰላማዊ ኢየሱስ መሊኡና ሰላም
ንንስሃ ዕድመ ሂቡና እዩ ዳግም

VERSE 7
ስለዘይደሊ ሓደኳ ክጠፍእ
ብናይ ፍቅሪ ቋንቋ ንኩሉ ይፅውዕ
ዕልል ዕልል እንዳበልና ንውድሰካ
ስለዝፈቀድካ ክንነብር ምሳካ

VERSE 8
ብምስጋና ስብሓት ንስሙ ኣልዒልና
ፍፁም ኣይንፀግቦን ነቲ ዘድሓነና
ጭብጨባ ዕልልታ ንኢየሱስ ይኩን
ኩሉ ሓዲስዎ''ዩ ኣረጊት የለን

VERSE 9
ንገሰልና ኢየሱስ ተመስገን
ዝሃብካና ነዚ ፍሉይ ምድሓን
ትጉህ ሓላዊና ኣብ ሓዱሽ ዓመት
ይክበር ይንገሰልና ኣብ ሓዱሽ ዓመት

VERSE 10
ንዑዑ ክንውድስ ኣብ ሓዱሽ ዓመት
ከቶ ኳ ኣይደክመና ኣብ ሓዱሽ ዓመት
የዋህን ትሑትን ኣብ ሓዱሽ ዓመት
ሸክምና ተራግፍ ኣብ ሓዱሽ ዓመት

VERSE 11
ፍቅርካ ከም ዝናብ ኣብ ሓዱሽ ዓመት
ነናሻዕ ይዘንብ ኣብ ሓዱሽ ዓመት
ጎይታ ምሳና''ዩ ኣብ ሓዱሽ ዓመት
መን ክቃወመና ኣብ ሓዱሽ ዓመት

VERSE 12
ረዲኡና ዩ ሞ ኣብ ሓዱሽ ዓመት
ምስጋና ንስሙ ኣብ ሓዱሽ ዓመት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hadush libi hadush menfes
Hadush kidan bidemu mifsas
Koynulna erqi nizelalem
Sala Iyesus abo selam

VERSE 1
Nizelalem tebejawnetu ts’eniu
Nizelalem ts’elam kab qidmena t’efiu
Nizelalem melhqna koynu merih birhan
Nizelalem nihagos ellta mets’ilna zemen

VERSE 2
Meqts’aeti hat’yat demsisu ab mesqel
Nay eda ts’hfet habisu bidem
Ts’elmat meqabr bibrhan t’hisu
Hiywet hibuna nimot afrisu

VERSE 3
Nizelalem emni libna tesebiru
Nizelalem bilmulum siga teqeyru
Nizelalem keyhadgena keynsber
Nizelalem bidemu atilna ts’nue kidan

VERSE 4
Liqekahnat hansab siiru
Zelalem zits’ene erqi qemiru
Kab firdi ts’ega kidan ats’niu
Zeygdeb mihret rekibna shu

VERSE 5
Amen hibkana hadush zemen
Silemhretka goyta temesgen
Amen temesgenelna bihadush zema
Liel belelna ika bial girma

VERSE 6
Amen amlኾ sigdet niaka t’ray
Abona Iyesus hiywet wehabay
Selamawi Iyesus meliuna selam
Ninsha edme hibuna eyu dagm

VERSE 7
Silezeydeli hadekwa kit’efe
Binay fiqri qwanqwa nikulu yits’we
Ell ell endabelna niwdseka
Silezfeqedka kinnebr misaka

VERSE 8
Bimsgana sibhat nismu alilna
Fits’um aynts’egbon neti zedhanena
Ch’bch’eba ellta niiyesus yikun
Kulu hadiswo''yu aregit yelen

VERSE 9
Nigeselna Iyesus temesgen
Zihabkana nezi filuy midhan
Tiguh halawina ab hadush amet
Yikber yingeselna ab hadush amet

VERSE 10
Niuu kinwds ab hadush amet
Keto kwa aydekmena ab hadush amet
Yewahn tihutn ab hadush amet
Shekmna teragf ab hadush amet

VERSE 11
Fiqrka kem zinab ab hadush amet
Nenashae yizenb ab hadush amet
Goyta misana''yu ab hadush amet
Men kiqawemena ab hadush amet

VERSE 12
Rediuna yu mo ab hadush amet
Misgana nismu ab hadush amet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tigrgna-orthodex-mezmur-zemarit-hewan-gebreanenia', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tigrigna Mezmur _ Zemari Kibrom Berhe _ Aytfeleyeniii (tigrigna-mezmur-zemari-kibrom-berhe-aytfeleyeniii)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 1
ቃንዛይ ከቢዱ ኮይኑ ልዕሊ ልሳን
ሻቕሎት በዚሑ ኣብዩኒ ልበይ ምቕሳን
ዘለላ ንብዓተይ ካብ ኣርያም ጠሚትካ
" ኣጆኻ" በለኒ ብዘዕርፍ ቃልካ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 2
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ
ኣብ መስርሕ ሂወት ግድን''ዩ ምልኣት ጉድለት
ሕጊ ተፈጥሮ''ዩ ሕጊ ምንባር ምሟት

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 3
ንስኻ አይትጋገን ዋላ ሽሕ እንተጓሃኹ
ካብ ከርሲ ኣደይ''ውን ጥራየይ ወጻኹ
ኦ መንፈስቅዱስ ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 4
ዓቕሚ ፍጠረለይ ጎይታ ደጊመ ኸይነብዕ
ሂቡ ወሲዱ ኢለ ከም ኢዮብ ክጸንዕ
ኣዒንተይ ኣልዒለ ናብቲ ኣብ ኢደይ ዘሎ
ተመስገን ዝብለሉ ንኹሉ ዝኽእሎ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 5
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ',
      lyrics_transliteration = 'CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 1
Qanzay kebidu koynu lieli lisan
Shaቕlot bezihu abyuni libey miቕsan
Zelela nibatey kab aryam t’emitka
" ajoኻ" beleni bizeerf qalka

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 2
O Egziabher hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani
Ab mesrh hiwet gidn''yu milat gudlet
Higi tefet’ro''yu higi minbar mimwat

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 3
Nisኻ aytgagen wala shh entegwahaኹ
Kab kersi adey''win t’rayey wets’aኹ
O Menfes Kidus hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 4
Aቕmi fit’ereley goyta degime ኸynebe
Hibu wesidu ile kem iyob kits’ene
Aintey alile nabti ab idey zelo
Temesgen ziblelu niኹlu ziኽelo

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 5
O Egziabher hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tigrigna-mezmur-zemari-kibrom-berhe-aytfeleyeniii'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 1
ቃንዛይ ከቢዱ ኮይኑ ልዕሊ ልሳን
ሻቕሎት በዚሑ ኣብዩኒ ልበይ ምቕሳን
ዘለላ ንብዓተይ ካብ ኣርያም ጠሚትካ
" ኣጆኻ" በለኒ ብዘዕርፍ ቃልካ

VERSE 2
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ
ኣብ መስርሕ ሂወት ግድን''ዩ ምልኣት ጉድለት
ሕጊ ተፈጥሮ''ዩ ሕጊ ምንባር ምሟት

VERSE 3
ንስኻ አይትጋገን ዋላ ሽሕ እንተጓሃኹ
ካብ ከርሲ ኣደይ''ውን ጥራየይ ወጻኹ
ኦ መንፈስቅዱስ ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ

VERSE 4
ዓቕሚ ፍጠረለይ ጎይታ ደጊመ ኸይነብዕ
ሂቡ ወሲዱ ኢለ ከም ኢዮብ ክጸንዕ
ኣዒንተይ ኣልዒለ ናብቲ ኣብ ኢደይ ዘሎ
ተመስገን ዝብለሉ ንኹሉ ዝኽእሎ

VERSE 5
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 1
Qanzay kebidu koynu lieli lisan
Shaቕlot bezihu abyuni libey miቕsan
Zelela nibatey kab aryam t’emitka
" ajoኻ" beleni bizeerf qalka

VERSE 2
O Egziabher hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani
Ab mesrh hiwet gidn''yu milat gudlet
Higi tefet’ro''yu higi minbar mimwat

VERSE 3
Nisኻ aytgagen wala shh entegwahaኹ
Kab kersi adey''win t’rayey wets’aኹ
O Menfes Kidus hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani

VERSE 4
Aቕmi fit’ereley goyta degime ኸynebe
Hibu wesidu ile kem iyob kits’ene
Aintey alile nabti ab idey zelo
Temesgen ziblelu niኹlu ziኽelo

VERSE 5
O Egziabher hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tigrigna-mezmur-zemari-kibrom-berhe-aytfeleyeniii', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tigrigna Orthodox mezmur By Betelhem Brhane (tigrigna-orthodox-mezmur-by-betelhem-brhane)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 1
መዓልቲ እንትፈርሰ ዕንይንይ ትገንሖ
ዝወደቐ ኦም ምሳር እንትበዝሖ
ኣብ ጎኑ ደው ይብል ይሰምዕ ናይ ልቡ
ሰብ ንዘይብሉ ሰብ ኣማኑኤል ሰቡ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 2
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ኣይሓልፎን ዝበልኩ ሪአዮ ሓሊፉ
መዓልቲ ፍተናይ ድኻመይ ዓሪፉ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 3
ነዚ ዘርአየኒ ኣይኮነን ዕድለይ
ካብ ጎይታይ እዩ ኹሉ ካባይ ልኾን የለይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 4
ካብኡ ዝረሓቓ እንተለዋ መርከባት
ጎይታ ዝቖመላ ሃሰዮማ ማዕበላት
ኣድሕነኒ እንትብሎ ኣእዳው ዘርገሐ
ህድኣተይ መሊሱ ፀልማተይ ኣውገሐ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 5
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ንምንታይ ይፍተን ዝኣምን ብጎይታ
ናበልኹ እንትነብዕ ተመንጢለ ባህታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 6
ለካሰ ዝዓበየ ፀጋ ኣዲልዩለይ
እንሆ ዕልልታ መሊእዎ ኣፈይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ',
      lyrics_transliteration = 'CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 1
Mealti entferse enyny tigenho
Ziwedeቐ om misar entbezho
Ab gonu dew yibl yiseme nay libu
Seb nizeyblu seb amanuel sebu

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 2
Ameney zihabkani
Amen iኻ goyta
Ayhalfon zibelku riayo halifu
Mealti fitenay diኻmey arifu

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 3
Nezi zerayeni aykonen edley
Kab goytay eyu ኹlu kabay liኾn yeley
Ameney zihabkani
Amen iኻ goyta

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 4
Kabu zirehaቓ entelewa merkebat
Goyta ziቖmela haseyoma maebelat
Adhneni entblo aedaw zergehe
Hidatey melisu ts’elmatey awgehe

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 5
Ameney zihabkani
Amen iኻ goyta
Nimntay yiften ziamn bigoyta
Nabelኹ entnebe tement’ile bahta

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 6
Lekase ziabeye ts’ega adilyuley
Enho ellta meliewo afey
Ameney zihabkani
Amen iኻ goyta

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tigrigna-orthodox-mezmur-by-betelhem-brhane'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 1
መዓልቲ እንትፈርሰ ዕንይንይ ትገንሖ
ዝወደቐ ኦም ምሳር እንትበዝሖ
ኣብ ጎኑ ደው ይብል ይሰምዕ ናይ ልቡ
ሰብ ንዘይብሉ ሰብ ኣማኑኤል ሰቡ

VERSE 2
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ኣይሓልፎን ዝበልኩ ሪአዮ ሓሊፉ
መዓልቲ ፍተናይ ድኻመይ ዓሪፉ

VERSE 3
ነዚ ዘርአየኒ ኣይኮነን ዕድለይ
ካብ ጎይታይ እዩ ኹሉ ካባይ ልኾን የለይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ

VERSE 4
ካብኡ ዝረሓቓ እንተለዋ መርከባት
ጎይታ ዝቖመላ ሃሰዮማ ማዕበላት
ኣድሕነኒ እንትብሎ ኣእዳው ዘርገሐ
ህድኣተይ መሊሱ ፀልማተይ ኣውገሐ

VERSE 5
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ንምንታይ ይፍተን ዝኣምን ብጎይታ
ናበልኹ እንትነብዕ ተመንጢለ ባህታ

VERSE 6
ለካሰ ዝዓበየ ፀጋ ኣዲልዩለይ
እንሆ ዕልልታ መሊእዎ ኣፈይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 1
Mealti entferse enyny tigenho
Ziwedeቐ om misar entbezho
Ab gonu dew yibl yiseme nay libu
Seb nizeyblu seb amanuel sebu

VERSE 2
Ameney zihabkani
Amen iኻ goyta
Ayhalfon zibelku riayo halifu
Mealti fitenay diኻmey arifu

VERSE 3
Nezi zerayeni aykonen edley
Kab goytay eyu ኹlu kabay liኾn yeley
Ameney zihabkani
Amen iኻ goyta

VERSE 4
Kabu zirehaቓ entelewa merkebat
Goyta ziቖmela haseyoma maebelat
Adhneni entblo aedaw zergehe
Hidatey melisu ts’elmatey awgehe

VERSE 5
Ameney zihabkani
Amen iኻ goyta
Nimntay yiften ziamn bigoyta
Nabelኹ entnebe tement’ile bahta

VERSE 6
Lekase ziabeye ts’ega adilyuley
Enho ellta meliewo afey
Ameney zihabkani
Amen iኻ goyta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tigrigna-orthodox-mezmur-by-betelhem-brhane', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tigrigna Orthodox Tewahdo Mezmur (tigrigna-orthodox-tewahdo-mezmur-2583)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 1
ሰላም ለኪ ሰላም ለኪ|፪|
ወላዲተ ኣምላኽ ልዑል''ዩ ክብርኺ
ፀጋ ተዓደለ መን''ሎ ከማኺ
ትሕትናኺ ሪኡ መሪፁ ንዓኺ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 2
ክርስቶስ ኢየሱስ ሓዲሩ ኣባኺ
ከመይ ክኢልክዮ ንልዑል ፈጣሪ
ሰማይ ዘይስከሞ ዘይትፆሮ ምድሪ
ሰማያዊ ክብሩ ገዲፉ ዙፋኑ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 3
ድንግል ኣብ ማህፀንኪ ከመይ ተወሲኑ
ዝተባረኸ''ዩ ቅዱስ''ዩ ማህፀንኪ
ፅንሲ ናይ ኤልሳቤጥ ይመስክር ክብርኺ
ድምፅኺ ሰሚዑ ዘሊሉ ብደስታ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 4
ንፅህተ ንፁሃን ድንግል ኣደ ጎይታ
ብገብርኤል ሰላም ሰላምታ የቕርበልኪ
ቤዛ ዓለም መድሕን ስለዝወለድኪ
ክፅውዖ ስምኪ ማርያም ተምበርኪኸ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 5
ብግርማ ክብርኺ ምሒር ተማሪኸ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም',
      lyrics_transliteration = 'CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 1
Selam leki selam leki|2|
Weladite amlaኽ liul''yu kibrኺ
Ts’ega teadele men''lo kemaኺ
Tihtnaኺ riu merits’u niaኺ

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 2
Kristos Iyesus hadiru abaኺ
Kemey kiilkyo nilul fet’ari
Semay zeyskemo zeytts’oro midri
Semayawi kibru gedifu zufanu

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 3
Dingil ab mahts’enki kemey tewesinu
Zitebareኸ''yu Kidus''yu mahts’enki
Ts’nsi nay elsabet’ yimeskr kibrኺ
Dimts’ኺ semiu zelilu bidesta

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 4
Nits’hte nits’uhan Dingil ade goyta
Bigebrel selam selamta yeቕrbelki
Beza alem medhn silezweledki
Kits’wo simki Maryam temberkiኸ

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 5
Bigrma kibrኺ mihir temariኸ

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tigrigna-orthodox-tewahdo-mezmur-2583'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 1
ሰላም ለኪ ሰላም ለኪ|፪|
ወላዲተ ኣምላኽ ልዑል''ዩ ክብርኺ
ፀጋ ተዓደለ መን''ሎ ከማኺ
ትሕትናኺ ሪኡ መሪፁ ንዓኺ

VERSE 2
ክርስቶስ ኢየሱስ ሓዲሩ ኣባኺ
ከመይ ክኢልክዮ ንልዑል ፈጣሪ
ሰማይ ዘይስከሞ ዘይትፆሮ ምድሪ
ሰማያዊ ክብሩ ገዲፉ ዙፋኑ

VERSE 3
ድንግል ኣብ ማህፀንኪ ከመይ ተወሲኑ
ዝተባረኸ''ዩ ቅዱስ''ዩ ማህፀንኪ
ፅንሲ ናይ ኤልሳቤጥ ይመስክር ክብርኺ
ድምፅኺ ሰሚዑ ዘሊሉ ብደስታ

VERSE 4
ንፅህተ ንፁሃን ድንግል ኣደ ጎይታ
ብገብርኤል ሰላም ሰላምታ የቕርበልኪ
ቤዛ ዓለም መድሕን ስለዝወለድኪ
ክፅውዖ ስምኪ ማርያም ተምበርኪኸ

VERSE 5
ብግርማ ክብርኺ ምሒር ተማሪኸ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 1
Selam leki selam leki|2|
Weladite amlaኽ liul''yu kibrኺ
Ts’ega teadele men''lo kemaኺ
Tihtnaኺ riu merits’u niaኺ

VERSE 2
Kristos Iyesus hadiru abaኺ
Kemey kiilkyo nilul fet’ari
Semay zeyskemo zeytts’oro midri
Semayawi kibru gedifu zufanu

VERSE 3
Dingil ab mahts’enki kemey tewesinu
Zitebareኸ''yu Kidus''yu mahts’enki
Ts’nsi nay elsabet’ yimeskr kibrኺ
Dimts’ኺ semiu zelilu bidesta

VERSE 4
Nits’hte nits’uhan Dingil ade goyta
Bigebrel selam selamta yeቕrbelki
Beza alem medhn silezweledki
Kits’wo simki Maryam temberkiኸ

VERSE 5
Bigrma kibrኺ mihir temariኸ'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tigrigna-orthodox-tewahdo-mezmur-2583', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tihitnash Grum New (tihitnash-grum-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 1
ንፅሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ
የፍጥረታት ጌታ እመቤቴ እመቤቴ
ባንቺ አደረብሽ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 2
የድንግል መመረጥ እመቤቴ እመቤቴ
ዜናው አስገረመን እመቤቴ እመቤቴ
እሳቱን ታቅፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 3
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 4
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
ለእኔ መመኪያዬ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 5
በዓለም እዳልጠፋ እመቤቴ እመቤቴ
ሕይወቴ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጪው እመቤቴ እመቤቴ
ድንግል ድረሽልኝ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 6
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 7
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ
የሁላችን ደስታ እመቤቴ እመቤቴ
እሙ ለጸሐይ ፅድቅ እመቤቴ እመቤቴ
የሁሉ ጠበቃ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 8
ድንግል የድል አክሊል እመቤቴ እመቤቴ
ድንግል የፅድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋህዶ ተስፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 9
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 10
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 11
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/',
      lyrics_transliteration = 'CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 1
Enken yelelebsh Emebete Emebete
Yefitretat geta Emebete Emebete
Banchi aderebsh Emebete Emebete

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 2
Yedingil memereT Emebete Emebete
Zenaw asgeremen Emebete Emebete
Esatun taqfech Emebete Emebete

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 3
Yemayichalewn Emebete Emebete
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 4
Mirkuzey libelsh Emebete Emebete
Tila kelelaye Emebete Emebete
Gashayé nesh anchi Emebete Emebete

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 5
Le’ene memekiyayé Emebete
Be’alem edalTefa Emebete Emebete
Heywete merobign Emebete Emebete

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 6
Ende weyin atafchew Emebete Emebete
Dingil dreshelny Emebete Emebete
Tihitnash grum new degnetishim (2)

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 7
Enatu honeshal leMedhane Alem (2)
Yemiserak dejaf nesh Emebete Emebete
Yehulachen desta Emebete Emebete

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 8
Emu leTsehay tsidq Emebete Emebete
Yehulu Tebeqa Emebete Emebete
Dingil yedil aklil Emebete Emebete

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 9
Dingil yetsidq sira Emebete Emebete
Dingil meselal nesh Emebete Emebete
Yetewahido tesfa Emebete Emebete

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 10
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Tihitnash grum new degnetishim (2)

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 11
Enatu honeshal leMedhane Alem (2)
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)

CHORUS
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tihitnash-grum-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 1
ንፅሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ
የፍጥረታት ጌታ እመቤቴ እመቤቴ
ባንቺ አደረብሽ እመቤቴ እመቤቴ

VERSE 2
የድንግል መመረጥ እመቤቴ እመቤቴ
ዜናው አስገረመን እመቤቴ እመቤቴ
እሳቱን ታቅፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ

VERSE 3
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 4
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
ለእኔ መመኪያዬ እመቤቴ

VERSE 5
በዓለም እዳልጠፋ እመቤቴ እመቤቴ
ሕይወቴ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጪው እመቤቴ እመቤቴ
ድንግል ድረሽልኝ እመቤቴ እመቤቴ

VERSE 6
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 7
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ
የሁላችን ደስታ እመቤቴ እመቤቴ
እሙ ለጸሐይ ፅድቅ እመቤቴ እመቤቴ
የሁሉ ጠበቃ እመቤቴ እመቤቴ

VERSE 8
ድንግል የድል አክሊል እመቤቴ እመቤቴ
ድንግል የፅድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋህዶ ተስፋ እመቤቴ እመቤቴ

VERSE 9
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 10
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/

VERSE 11
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኔዓለም /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Nitsihit silehonesh Emebete Emebete

VERSE 1
Enken yelelebsh Emebete Emebete
Yefitretat geta Emebete Emebete
Banchi aderebsh Emebete Emebete

VERSE 2
Yedingil memereT Emebete Emebete
Zenaw asgeremen Emebete Emebete
Esatun taqfech Emebete Emebete

VERSE 3
Yemayichalewn Emebete Emebete
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)

VERSE 4
Mirkuzey libelsh Emebete Emebete
Tila kelelaye Emebete Emebete
Gashayé nesh anchi Emebete Emebete

VERSE 5
Le’ene memekiyayé Emebete
Be’alem edalTefa Emebete Emebete
Heywete merobign Emebete Emebete

VERSE 6
Ende weyin atafchew Emebete Emebete
Dingil dreshelny Emebete Emebete
Tihitnash grum new degnetishim (2)

VERSE 7
Enatu honeshal leMedhane Alem (2)
Yemiserak dejaf nesh Emebete Emebete
Yehulachen desta Emebete Emebete

VERSE 8
Emu leTsehay tsidq Emebete Emebete
Yehulu Tebeqa Emebete Emebete
Dingil yedil aklil Emebete Emebete

VERSE 9
Dingil yetsidq sira Emebete Emebete
Dingil meselal nesh Emebete Emebete
Yetewahido tesfa Emebete Emebete

VERSE 10
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)
Tihitnash grum new degnetishim (2)

VERSE 11
Enatu honeshal leMedhane Alem (2)
Tihitnash grum new degnetishim (2)
Enatu honeshal leMedhane Alem (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tihitnash-grum-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tikit Neger Yizhe (tikit-neger-yizhe)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tikit-neger-yizhe'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ጥቂት ነገር ይዤ ታላቁን እግዚአብሔር
ሳልጠራው አልውልም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም ማን እንደርሱ ፍቅር
ማን እንደርሱ ሰላም

VERSE 1
እዚ ።።።።።።።።።።።።።።።።።።።።።።
ደጋግሜ በሀጥያት በበደል ብወድቅም
እኔን ምሮ ምሮ ሰለቸኝ አያውቅም እድል
ይሰጠኛል አዲስ እያረገ በፍቅር ድምፆቹ ሁሌ

VERSE 2
እየፈለገ
እዚ ።።።።።።።።።።።።።።።።።።።።።።።።
የአለም ሀብታት ሁሉ በአንድ ቢደመሩ
በእውነት አይበልጡም ከጠብታ ፍቅሩ

VERSE 3
በእርሱ ደስ ይለኛል በለስ ባታፈራም
ጉድለቴን ይሞላል የእርሱን ስም ስጠራ
እዚ ።።።።።።።።።።።።።።።።።።።።።።
ባለጠግነትን እየከለከለ የሚያስፈልገኝን

VERSE 4
ለኔ እያበቀለ ይንከባከበኛል ስለኔ ይዋጋል
እጁን እያሰበ ይመሻል ይነጋል
እዚ ።።።።።።።።።።።።።።።።።።
ሲሰጥም ሲነሳ ትክክል ነውና ዝም ልል

VERSE 5
አልችልም እሰዋለሁ ምስጋና በክብሩ ዙፋን
ፊት በእምነት ቀረቤ ዘንበል ብሎልኝ
ተጠግኗል ልብ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'T’qit neger yizhe talaqun Egziabher
Salt’eraw alwlm man endersu fiqr
Man endersu selam man endersu fiqr
Man endersu selam

VERSE 1
Ezi ......................
Degagme behet’yat bebedel biwedqm
Enen miro miro selechegn ayawqm edl
Yiset’egnal adis eyarege befqr dimts’ochu hule

VERSE 2
Eyefelege
Ezi ........................
Yealem hebtat hulu beand bidemeru
Beewnet aybelt’um ket’ebta fiqru

VERSE 3
Beersu des yilegnal beles bataferam
Gudleten yimolal yeersun sim sit’era
Ezi ......................
Balet’egnetn eyekelekele yemiyasfelgegnn

VERSE 4
Lene eyabeqele yinkebakebegnal silene yiwagal
Ejun eyasebe yimeshal yinegal
Ezi ..................
Siset’m sinesa tikkl newna zim lil

VERSE 5
Alchlm esewalehu misgana bekbru zufan
Fit beemnet qerebe zenbel bilolgn
Tet’egnwal lib'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tikit-neger-yizhe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tilant yasalefkegn (tilant-yasalefkegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 1
መከራ ቢቆም ከፊቴ
እለት ከእለት ቢሆን ድክመቴ
ለሚያልፍ ቢያለፋን እንጂ
ባርኮቴ አይጎልም ከእጄ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 2
አለቅም አለቅም
ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 3
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ወጥኔ
ተስፋ አልቆርጥብምህ መድኔ
ፈተና ሰይፉን ቢያነሳ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 4
ጠላት በቁጣ ቢያገሳ
ጨለማ ቢደቀን ፊቴ
አንተ አተወኝም አባቴ
አለቅም አለቅም ሰላሜ ካንተ አይጎልም

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 5
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 6
ተስፋ አልቆርጥም መድኔ(2)
ስደት ብወጣ ለእንጀራ
በጣር ብጎርሰው በመከራ
ባንተ እንደሚያልፍ አውቃለሁ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 7
የሆነው ሁሉ ለበጎ ነው
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 8
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)
ተስፋ አልቆርጥም መድኔ(2)
ከጄ ቢበተን የያዝኩት

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 9
ጀርባ ቢሰጠኝ ያመንኩት
ባንተ ማለፌን አምናለሁ
ጭንቀቴን ፊትህ
ጥያለሁ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 10
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 11
ቢሆንም ባይሆንም ውጥኔ (2)
ተስፋ አልቆርጥም መድኔ(2)

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)',
      lyrics_transliteration = 'CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 1
Mekera biqom kefite
Elet keelet bihon dikmete
Lemiyalf biyalefan enji
Barkote aygolm keeje

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 2
Aleqm aleqm
Selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 3
Negenm alsegam eyaleh
Bihonm bayhonm wet’ne
Tesfa alqort’bmh medne
Fetena seyfun biyanesa

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 4
T’elat bequt’a biyagesa
Ch’elema bideqen fite
Ante atewegnm abate
Aleqm aleqm selame kante aygolm

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 5
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh
Negenm alsegam eyaleh
Bihonm bayhonm wit’ne (2)

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 6
Tesfa alqort’m medne (2)
Sidet biwet’a leenjera
Bet’ar bigorsew bemekera
Bante endemiyalf awqalehu

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 7
Yehonew hulu lebego new
Aleqm aleqm selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 8
Negenm alsegam eyaleh
Bihonm bayhonm wit’ne (2)
Tesfa alqort’m medne (2)
Keje bibeten yeyazkut

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 9
Jerba biset’egn yamenkut
Bante malefen amnalehu
Ch’nqeten fith
T’yalehu

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 10
Aleqm aleqm selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh
Negenm alsegam eyaleh

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 11
Bihonm bayhonm wit’ne (2)
Tesfa alqort’m medne (2)

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tilant-yasalefkegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 1
መከራ ቢቆም ከፊቴ
እለት ከእለት ቢሆን ድክመቴ
ለሚያልፍ ቢያለፋን እንጂ
ባርኮቴ አይጎልም ከእጄ

VERSE 2
አለቅም አለቅም
ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

VERSE 3
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ወጥኔ
ተስፋ አልቆርጥብምህ መድኔ
ፈተና ሰይፉን ቢያነሳ

VERSE 4
ጠላት በቁጣ ቢያገሳ
ጨለማ ቢደቀን ፊቴ
አንተ አተወኝም አባቴ
አለቅም አለቅም ሰላሜ ካንተ አይጎልም

VERSE 5
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)

VERSE 6
ተስፋ አልቆርጥም መድኔ(2)
ስደት ብወጣ ለእንጀራ
በጣር ብጎርሰው በመከራ
ባንተ እንደሚያልፍ አውቃለሁ

VERSE 7
የሆነው ሁሉ ለበጎ ነው
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

VERSE 8
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)
ተስፋ አልቆርጥም መድኔ(2)
ከጄ ቢበተን የያዝኩት

VERSE 9
ጀርባ ቢሰጠኝ ያመንኩት
ባንተ ማለፌን አምናለሁ
ጭንቀቴን ፊትህ
ጥያለሁ

VERSE 10
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ

VERSE 11
ቢሆንም ባይሆንም ውጥኔ (2)
ተስፋ አልቆርጥም መድኔ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 1
Mekera biqom kefite
Elet keelet bihon dikmete
Lemiyalf biyalefan enji
Barkote aygolm keeje

VERSE 2
Aleqm aleqm
Selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh

VERSE 3
Negenm alsegam eyaleh
Bihonm bayhonm wet’ne
Tesfa alqort’bmh medne
Fetena seyfun biyanesa

VERSE 4
T’elat bequt’a biyagesa
Ch’elema bideqen fite
Ante atewegnm abate
Aleqm aleqm selame kante aygolm

VERSE 5
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh
Negenm alsegam eyaleh
Bihonm bayhonm wit’ne (2)

VERSE 6
Tesfa alqort’m medne (2)
Sidet biwet’a leenjera
Bet’ar bigorsew bemekera
Bante endemiyalf awqalehu

VERSE 7
Yehonew hulu lebego new
Aleqm aleqm selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh

VERSE 8
Negenm alsegam eyaleh
Bihonm bayhonm wit’ne (2)
Tesfa alqort’m medne (2)
Keje bibeten yeyazkut

VERSE 9
Jerba biset’egn yamenkut
Bante malefen amnalehu
Ch’nqeten fith
T’yalehu

VERSE 10
Aleqm aleqm selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh
Negenm alsegam eyaleh

VERSE 11
Bihonm bayhonm wit’ne (2)
Tesfa alqort’m medne (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tilant-yasalefkegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tilin Bemeskelu Gedele (tilin-bemeskelu-gedele)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)

VERSE 1
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)

CHORUS
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)',
      lyrics_transliteration = 'CHORUS
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)

VERSE 1
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)

CHORUS
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tilin-bemeskelu-gedele'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)

VERSE 1
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)

VERSE 1
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tilin-bemeskelu-gedele', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: TILK FIKER DEACON ZEMARI ENDALE DEREJE (tilk-fiker-deacon-zemari-endale-dereje)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከጀርባህ ላይ ካለው ሰንበር
አንብቤአለሁ ጥልቅ ፍቅር
የእኔ መስቀል ሆኖ ለአንተ
ልጅህ ዳንኩኝ ሞቴ ሞተ

VERSE 1
ከግራ ቀኝ መንገላታት መውደቅና መነሳቱ
በአይሁድ በትር መሰቃየት የእኔ ነበር እንግልቱ
መቸንከሬ ለአንተ ሆነ ቆሰልክልኝ በችንካራት
መራራውን ጠጣህልኝ ጣፋጯንም እንድጠጣት

CHORUS
ከጀርባህ ላይ ካለው ሰንበር
አንብቤአለሁ ጥልቅ ፍቅር
የእኔ መስቀል ሆኖ ለአንተ
ልጅህ ዳንኩኝ ሞቴ ሞተ

VERSE 2
እስከ መሞት ያደረሰህ ከበደሌ ገዝፎ ፍቅርህ
ፍቅር እኮ ነው ስቦ ያመጣህ ከሀያል ክብር ከመንበርህ
ያንገላታህ ያሳሰረህ በግፍ ጅራፍ ያስገረፈህ
ፍቅር እኮ ነው በአይሁድ ሸንጎ እንድትቆም ያስገደደህ

CHORUS
ከጀርባህ ላይ ካለው ሰንበር
አንብቤአለሁ ጥልቅ ፍቅር
የእኔ መስቀል ሆኖ ለአንተ
ልጅህ ዳንኩኝ ሞቴ ሞተ

VERSE 3
ለእኔ ነበር የሞት አዋጅ ይሙት በቃ ይሰቀል
ህይወትህን ለእኔ ሰጥተህ ሞቴን ወሰድክ በመስቀል
ፍቅር እኮ ነው ፍቅር ብቻ እስከ መሞት ያደረሰህ
የበደልኩት እኔ ሳለሁ ነጻ ወጣሁ አንተ ሞተህ

CHORUS
ከጀርባህ ላይ ካለው ሰንበር
አንብቤአለሁ ጥልቅ ፍቅር
የእኔ መስቀል ሆኖ ለአንተ
ልጅህ ዳንኩኝ ሞቴ ሞተ',
      lyrics_transliteration = 'CHORUS
Kejerbah lay kalew senber
Anbbealehu t’lq fiqr
Yeene mesqel hono leante
Lijh dankugn mote mote

VERSE 1
Kegra qegn mengelatat mewdeqna menesatu
Beayhud betr meseqayet yeene neber engltu
Mechenkere leante hone qoselklgn bechnkarat
Merarawn t’et’ahlgn t’afach’wanm endt’et’at

CHORUS
Kejerbah lay kalew senber
Anbbealehu t’lq fiqr
Yeene mesqel hono leante
Lijh dankugn mote mote

VERSE 2
Eske memot yadereseh kebedele gezfo fiqrh
Fiqr eko new sibo yamet’ah keheyal kibir kemenberh
Yangelatah yasasereh begf jiraf yasgerefeh
Fiqr eko new beayhud shengo endtqom yasgededeh

CHORUS
Kejerbah lay kalew senber
Anbbealehu t’lq fiqr
Yeene mesqel hono leante
Lijh dankugn mote mote

VERSE 3
Leene neber yemot awaj yimut beqa yiseqel
Hiywethn leene set’teh moten wesedk bemesqel
Fiqr eko new fiqr bicha eske memot yadereseh
Yebedelkut ene salehu nets’a wet’ahu ante moteh

CHORUS
Kejerbah lay kalew senber
Anbbealehu t’lq fiqr
Yeene mesqel hono leante
Lijh dankugn mote mote',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tilk-fiker-deacon-zemari-endale-dereje'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከጀርባህ ላይ ካለው ሰንበር
አንብቤአለሁ ጥልቅ ፍቅር
የእኔ መስቀል ሆኖ ለአንተ
ልጅህ ዳንኩኝ ሞቴ ሞተ

VERSE 1
ከግራ ቀኝ መንገላታት መውደቅና መነሳቱ
በአይሁድ በትር መሰቃየት የእኔ ነበር እንግልቱ
መቸንከሬ ለአንተ ሆነ ቆሰልክልኝ በችንካራት
መራራውን ጠጣህልኝ ጣፋጯንም እንድጠጣት

VERSE 2
እስከ መሞት ያደረሰህ ከበደሌ ገዝፎ ፍቅርህ
ፍቅር እኮ ነው ስቦ ያመጣህ ከሀያል ክብር ከመንበርህ
ያንገላታህ ያሳሰረህ በግፍ ጅራፍ ያስገረፈህ
ፍቅር እኮ ነው በአይሁድ ሸንጎ እንድትቆም ያስገደደህ

VERSE 3
ለእኔ ነበር የሞት አዋጅ ይሙት በቃ ይሰቀል
ህይወትህን ለእኔ ሰጥተህ ሞቴን ወሰድክ በመስቀል
ፍቅር እኮ ነው ፍቅር ብቻ እስከ መሞት ያደረሰህ
የበደልኩት እኔ ሳለሁ ነጻ ወጣሁ አንተ ሞተህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kejerbah lay kalew senber
Anbbealehu t’lq fiqr
Yeene mesqel hono leante
Lijh dankugn mote mote

VERSE 1
Kegra qegn mengelatat mewdeqna menesatu
Beayhud betr meseqayet yeene neber engltu
Mechenkere leante hone qoselklgn bechnkarat
Merarawn t’et’ahlgn t’afach’wanm endt’et’at

VERSE 2
Eske memot yadereseh kebedele gezfo fiqrh
Fiqr eko new sibo yamet’ah keheyal kibir kemenberh
Yangelatah yasasereh begf jiraf yasgerefeh
Fiqr eko new beayhud shengo endtqom yasgededeh

VERSE 3
Leene neber yemot awaj yimut beqa yiseqel
Hiywethn leene set’teh moten wesedk bemesqel
Fiqr eko new fiqr bicha eske memot yadereseh
Yebedelkut ene salehu nets’a wet’ahu ante moteh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tilk-fiker-deacon-zemari-endale-dereje', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Timikihite Zemedine (timikihite-zemedine)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 1
የሕይወት መሰረት ነሽ ድንግል እናታችን
አንቺን ለኛ ዘርን ባይስቀር
እንደ ጥንቱ እንደ ሰዶም ምድር
ሁላችንም በጠፋን ነበር

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 2
የአብርሃም ድንኳን ነሽ አምላክ ያደረብሽ
የጌድዮንም ፀምር ለይቶ ያከበረሽ
የእኛ ቤዛ በጉ የተያዘብሽ
የዋህ ርግብ ከአበው ስር የተገኘሽ

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 3
እፀ ሳቤቅ የሕይወት ሐረግ ነሽ
አምላክ ከሰማይ ሆኖ ይህችን ዓለም ሲቃኝ
ንጽህት ቅድስት ሆነሽ ማርያም አንቺን ቢያገኝ
ትሕትናሽን ሕይወትሽንም ወዶ

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 4
ቃል ሰው ሆነ ከሰማያት ወርዶ
አከበረሽ በፍጹም ተዋህዶ
የመዳናችን ምክንያት የሰው ልጆች ሰላም
ከኃጢአት ከመርገም የዳነብሽ ዓለም

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 5
አምስት ሺህ አምስት መቶ ዘመን
በሲኦል ውስጥ ተግዘን የኖርን
ድንግል ባአንቺ ነፃነት አገኘን

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን',
      lyrics_transliteration = 'CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 1
Yehywet meseret nesh Dingil enatachn
Anchin legna zern baysqer
Ende t’ntu ende sedom midr
Hulachnm bet’efan neber

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 2
Yeabrham dinkwan nesh amlak yaderebsh
Yegedyonm ts’emr leyto yakeberesh
Yeegna beza begu yeteyazebsh
Yewah rigb keabew sir yetegegnesh

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 3
Ets’e sabeq yehywet hereg nesh
Amlak kesemay hono yihchn alem siqagn
Nits’ht Kidist honesh Maryam anchin biyagegn
Tihtnashn hiywetshnm wedo

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 4
Qal sew hone kesemayat werdo
Akeberesh befts’um Tewahedo
Yemedanachn miknyat yesew lijoch selam
Kehat’iat kemergem yedanebsh alem

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 5
Amst shih amst meto zemen
Besiol wist’ tegzen yenorn
Dingil baanchi nets’anet agegnen

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'timikihite-zemedine'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 1
የሕይወት መሰረት ነሽ ድንግል እናታችን
አንቺን ለኛ ዘርን ባይስቀር
እንደ ጥንቱ እንደ ሰዶም ምድር
ሁላችንም በጠፋን ነበር

VERSE 2
የአብርሃም ድንኳን ነሽ አምላክ ያደረብሽ
የጌድዮንም ፀምር ለይቶ ያከበረሽ
የእኛ ቤዛ በጉ የተያዘብሽ
የዋህ ርግብ ከአበው ስር የተገኘሽ

VERSE 3
እፀ ሳቤቅ የሕይወት ሐረግ ነሽ
አምላክ ከሰማይ ሆኖ ይህችን ዓለም ሲቃኝ
ንጽህት ቅድስት ሆነሽ ማርያም አንቺን ቢያገኝ
ትሕትናሽን ሕይወትሽንም ወዶ

VERSE 4
ቃል ሰው ሆነ ከሰማያት ወርዶ
አከበረሽ በፍጹም ተዋህዶ
የመዳናችን ምክንያት የሰው ልጆች ሰላም
ከኃጢአት ከመርገም የዳነብሽ ዓለም

VERSE 5
አምስት ሺህ አምስት መቶ ዘመን
በሲኦል ውስጥ ተግዘን የኖርን
ድንግል ባአንቺ ነፃነት አገኘን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 1
Yehywet meseret nesh Dingil enatachn
Anchin legna zern baysqer
Ende t’ntu ende sedom midr
Hulachnm bet’efan neber

VERSE 2
Yeabrham dinkwan nesh amlak yaderebsh
Yegedyonm ts’emr leyto yakeberesh
Yeegna beza begu yeteyazebsh
Yewah rigb keabew sir yetegegnesh

VERSE 3
Ets’e sabeq yehywet hereg nesh
Amlak kesemay hono yihchn alem siqagn
Nits’ht Kidist honesh Maryam anchin biyagegn
Tihtnashn hiywetshnm wedo

VERSE 4
Qal sew hone kesemayat werdo
Akeberesh befts’um Tewahedo
Yemedanachn miknyat yesew lijoch selam
Kehat’iat kemergem yedanebsh alem

VERSE 5
Amst shih amst meto zemen
Besiol wist’ tegzen yenorn
Dingil baanchi nets’anet agegnen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'timikihite-zemedine', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Timkihte Zemedne (timkihte-zemedne)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ትምክህተ ዘመድነ
ትምክህተ ዘመድነ
በወሊዶታ ዚአነ /2 ጊዜ/

VERSE 1
ይእቲ እግዝእትነ
እግዝእትነ ማርያም ድንግል::

CHORUS
ትምክህተ ዘመድነ
ትምክህተ ዘመድነ
በወሊዶታ ዚአነ /2 ጊዜ/',
      lyrics_transliteration = 'CHORUS
tmkhte zemedne
tmkhte zemedne
bewelidota ziene /2 gize/

VERSE 1
yti gztne
gztne maryam dngl::

CHORUS
tmkhte zemedne
tmkhte zemedne
bewelidota ziene /2 gize/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'timkihte-zemedne'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ትምክህተ ዘመድነ
ትምክህተ ዘመድነ
በወሊዶታ ዚአነ /2 ጊዜ/

VERSE 1
ይእቲ እግዝእትነ
እግዝእትነ ማርያም ድንግል::'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'tmkhte zemedne
tmkhte zemedne
bewelidota ziene /2 gize/

VERSE 1
yti gztne
gztne maryam dngl::'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'timkihte-zemedne', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tinsaeke Le’ele Amene (tinsaeke-leele-amene)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)

VERSE 1
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)

CHORUS
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)',
      lyrics_transliteration = 'CHORUS
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)

VERSE 1
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)

CHORUS
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tinsaeke-leele-amene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)

VERSE 1
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)

VERSE 1
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tinsaeke-leele-amene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tinsa''eke Le''ile Amene (tinsaeke-leile-amene)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/

VERSE 1
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/

CHORUS
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/',
      lyrics_transliteration = 'CHORUS
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/

VERSE 1
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/

CHORUS
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tinsaeke-leile-amene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/

VERSE 1
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/

VERSE 1
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tinsaeke-leile-amene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 100 THEN
    RAISE EXCEPTION 'Rollback batch 08 count mismatch: expected 100, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Rollback batch 08 completed: % hymns restored.', v_total;
END $rollback_batch_08$;
