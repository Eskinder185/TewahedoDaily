-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 04 OF 32
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
  -- ermias-haylay ("Ermias Haylay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4ece3d74-b6d6-4ef5-88c2-4399fffc0e65'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 1
ዘመናይ ማለት ኋላ ቀር፥
እያለ መጣፍ ሲናገር፥
ልብ ያለ ልብ ፥ ሰሚ ጆሮ፥
መች ነበር ድሮ ፣ ዘንድሮ?

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 2
ሺህ ዓመት ለእሱ እንደ ትናንት፥
ዝንተ ዓለም እንደ አንዲት ትጋት፥
ቸር ሆኖ የእድሜን ብርሃናት፥
ሲያቀዳጀን ዳግም ዘመን፥

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 3
ምሥራቁን እንይ አሻግረን፥
ጽልመትን በፀዳል ሽረን፥
እንገሥግሥ በእግረ ልቡና፥
ከአድማስ ጥግ የዋኖች መዲና።

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 4
እንኪያ እንሂድ ከጥንት መንደር፥
ለመሥገር እስኪ እንንደርደር፥
እንሁን ተላዌ አሠር፥
ለተሰማበት ፣ የደስታ አውታር፥

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 5
“የቀድሞዋን መንገድ እዩ፥”
እንዳለ ኤርምያስ ነቢዩ፥
ከዳዊት ፣ ከቆሬ ፣ ከአሣፍ፥
እንድረስ ከኤማን በራፍ።

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 1
Zemenay malet hwala qer:
Eyale met’af sinager:
Lib yale lib : semi joro:
Mech neber diro , zendro?

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 2
Shih amet leesu ende tinant:
Zinte alem ende andit tigat:
Cher hono yeedmen birhanat:
Siyaqedajen dagm zemen:

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 3
Misraqun eny ashagren:
Ts’lmetn bets’edal shren:
Engesgs beegre libuna:
Keadmas t’g yewanoch medina.

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 4
Enkiya enhid ket’nt mender:
Lemesger eski ennderder:
Enhun telawe aser:
Letesemabet , yedesta awtar:

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 5
“yeqedmowan menged eyu:”
Endale ermyas nebiyu:
Kedawit , keqore , keasaf:
Endres keeman beraf.

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 1
ዘመናይ ማለት ኋላ ቀር፥
እያለ መጣፍ ሲናገር፥
ልብ ያለ ልብ ፥ ሰሚ ጆሮ፥
መች ነበር ድሮ ፣ ዘንድሮ?

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 2
ሺህ ዓመት ለእሱ እንደ ትናንት፥
ዝንተ ዓለም እንደ አንዲት ትጋት፥
ቸር ሆኖ የእድሜን ብርሃናት፥
ሲያቀዳጀን ዳግም ዘመን፥

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 3
ምሥራቁን እንይ አሻግረን፥
ጽልመትን በፀዳል ሽረን፥
እንገሥግሥ በእግረ ልቡና፥
ከአድማስ ጥግ የዋኖች መዲና።

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 4
እንኪያ እንሂድ ከጥንት መንደር፥
ለመሥገር እስኪ እንንደርደር፥
እንሁን ተላዌ አሠር፥
ለተሰማበት ፣ የደስታ አውታር፥

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 5
“የቀድሞዋን መንገድ እዩ፥”
እንዳለ ኤርምያስ ነቢዩ፥
ከዳዊት ፣ ከቆሬ ፣ ከአሣፍ፥
እንድረስ ከኤማን በራፍ።

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥',
        lyrics_transliteration = 'CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 1
Zemenay malet hwala qer:
Eyale met’af sinager:
Lib yale lib : semi joro:
Mech neber diro , zendro?

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 2
Shih amet leesu ende tinant:
Zinte alem ende andit tigat:
Cher hono yeedmen birhanat:
Siyaqedajen dagm zemen:

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 3
Misraqun eny ashagren:
Ts’lmetn bets’edal shren:
Engesgs beegre libuna:
Keadmas t’g yewanoch medina.

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 4
Enkiya enhid ket’nt mender:
Lemesger eski ennderder:
Enhun telawe aser:
Letesemabet , yedesta awtar:

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 5
“yeqedmowan menged eyu:”
Endale ermyas nebiyu:
Kedawit , keqore , keasaf:
Endres keeman beraf.

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4ece3d74-b6d6-4ef5-88c2-4399fffc0e65'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 1
ዘመናይ ማለት ኋላ ቀር፥
እያለ መጣፍ ሲናገር፥
ልብ ያለ ልብ ፥ ሰሚ ጆሮ፥
መች ነበር ድሮ ፣ ዘንድሮ?

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 2
ሺህ ዓመት ለእሱ እንደ ትናንት፥
ዝንተ ዓለም እንደ አንዲት ትጋት፥
ቸር ሆኖ የእድሜን ብርሃናት፥
ሲያቀዳጀን ዳግም ዘመን፥

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 3
ምሥራቁን እንይ አሻግረን፥
ጽልመትን በፀዳል ሽረን፥
እንገሥግሥ በእግረ ልቡና፥
ከአድማስ ጥግ የዋኖች መዲና።

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 4
እንኪያ እንሂድ ከጥንት መንደር፥
ለመሥገር እስኪ እንንደርደር፥
እንሁን ተላዌ አሠር፥
ለተሰማበት ፣ የደስታ አውታር፥

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 5
“የቀድሞዋን መንገድ እዩ፥”
እንዳለ ኤርምያስ ነቢዩ፥
ከዳዊት ፣ ከቆሬ ፣ ከአሣፍ፥
እንድረስ ከኤማን በራፍ።

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4ece3d74-b6d6-4ef5-88c2-4399fffc0e65'::uuid, 'ermias-haylay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sew-atiresam-keto-atitilim-medihaniyalem ("Sew Atiresam Keto Atitilim Medihaniyalem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '52f52ebf-31d6-4ec0-93c6-d7561c2abdc7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ምስኪኑን ከጉድፍ ከአፈር ምታነሳ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Miskinun kegudf keafer mitanesa'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '52f52ebf-31d6-4ec0-93c6-d7561c2abdc7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ምስኪኑን ከጉድፍ ከአፈር ምታነሳ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '52f52ebf-31d6-4ec0-93c6-d7561c2abdc7'::uuid, 'sew-atiresam-keto-atitilim-medihaniyalem', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kemetsge-roman ("Kemetsge Roman")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2431d9a9-2c70-4413-9245-ea6da0fbcbe5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)

VERSE 1
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)

CHORUS
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)

VERSE 1
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)

CHORUS
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '2431d9a9-2c70-4413-9245-ea6da0fbcbe5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)

VERSE 1
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)

CHORUS
ከመፅጌ ሮማን ከመፅጌ (2)
አበባዬ (2) ወላዲተ አምላክ ሲሳይ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)

VERSE 1
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)

CHORUS
Kemetsge roman kemetsge (2)
Abebaye (2) weladite amlak sisay (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2431d9a9-2c70-4413-9245-ea6da0fbcbe5'::uuid, 'kemetsge-roman', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidane-mihret-emebet-neylin ("Kidane Mihret Emebet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6990f2dc-e36c-4d1c-a4a8-ec01d21f0802'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ነይልን ነይልን ካለንበት (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Neyln neyln kalenbet (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '6990f2dc-e36c-4d1c-a4a8-ec01d21f0802'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 1
አዝ..................//

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 2
ከሰማያት በላይ ካለው ከማደሪያሽ (2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ
የምድር ፍጥረታት ማርያም ማርያም ሲሉሽ (2)
የቃል እናት እመቤቴ ነይ በሰረገላሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 3
አዝ..................//

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 4
ከፀጥታ ወደብ ከፍቅር አውድማ (2)
ከሰላሙ መንደር ከእውነት ከተማ
ሰአሊለነ ቅድስት ውዳሴ ሲሰማ (2)
ከሚካኤል ከገብርኤል ጋር ነይልን ከራማ (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 5
አዝ..................//

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 6
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት (2)
እንባችን ይታበስ ባንቺ አማላጅነት
በጽዮን ዝማሬ ተሞላ ነፍሳችን (2)
ንዒ (3) እንበል እንደ አባቶቻችን (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 7
አዝ..................//

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 8
ፍጥረታት ሊድኑ በአማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብጽዕት ይሉሻል (2)
እናቴ መመኪያዬ ምርኩዜ ሆነሻል (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 9
አዝ..................//

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)

VERSE 10
የልብን ሲያዋዩሽ ሰምተሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨከንም
ከዓይን ጥቅሻ ፈጥነሽ ትደርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)

CHORUS
ኪዳነ ምህረት እመቤት
ኪዳነ ምህረት እመቤት እመቤት (2)
ነይልን ነይልን ካለንበት (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 1
Az..................//

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 2
Kesemayat belay kalew kemaderiyash (2)
Zemare kemolaw kezelalem betish
Yemidir fitretat Mariam Mariam silush (2)
Yekal Enat Emebete ney beseregelash (2)

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 3
Az..................//

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 4
Ketseta wedeb ke fikr awedma (2)
Keselamu mender ke ewnet ketema
Sealilena Kidist wudase sisema (2)
Ke Mikael ke Gebriel gar neylin kerama (2)

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 5
Az..................//

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 6
Zerfafaw kemish yiwered kesemayat (2)
Enbachen yitabes banchi ammalajinet
Be Tsiyon zemare temola nefsachen (2)
Nei (3) enbel enda abatotchachen (2)

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 7
Az..................//

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 8
Fitretat lidinu be ammalajinetish (2)
Yezelalem kidan Amanuel setesh
Tiwuld yihin amno bitsit yilushal (2)
Enate memekiyaye merekuze honeshal (2)

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 9
Az..................//

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)

VERSE 10
Yeliben siyawayush semtesh zim atiym (2)
Chigrenghan ayto libish aychekenim
Ke ayin tiksha fetenesh tiderishiletalish (2)
Ke hazen ke meqera tasarfiwalish (2)

CHORUS
Kidane Mihret Emebet
Kidane Mihret Emebet Emebet (2)
Neylin Neylin kalenibet (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6990f2dc-e36c-4d1c-a4a8-ec01d21f0802'::uuid, 'kidane-mihret-emebet-neylin', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kirstos-tensae ("Kirstos Tensae")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '96ff6786-e9fb-4a80-bee5-ba1af3b20775'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክርስቶስ ተንስአ እሙታን በዓቢይ ኃይል ወስልጣን
አሰሮ ለሰይጣን አግዓዞ ለአዳም ሰላም ሰላም ሰላም እም ይእዜሰ ይኩን ሰላም

VERSE 1
ክርስቶስ ተነሳ ከሙታን በታላቅ ኃይልና ስልጣን
ሰይጣንን አስሮ ነጻ አወጣው አዳምን ሰላም ሰላም ከእንግዲህ ይሁን ሰላም

CHORUS
ክርስቶስ ተንስአ እሙታን በዓቢይ ኃይል ወስልጣን
አሰሮ ለሰይጣን አግዓዞ ለአዳም ሰላም ሰላም ሰላም እም ይእዜሰ ይኩን ሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
krstos tense mutan beabiy hayl wesltan
esero leseytan egazo leedam selam selam selam m yzese ykun selam

VERSE 1
krstos tenesa kemutan betalaq haylna sltan
seytann esro netsa ewetaw edamn selam selam kengdih yhun selam

CHORUS
krstos tense mutan beabiy hayl wesltan
esero leseytan egazo leedam selam selam selam m yzese ykun selam'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ክርስቶስ ተንስአ እሙታን በዓቢይ ኃይል ወስልጣን
አሰሮ ለሰይጣን አግዓዞ ለአዳም ሰላም ሰላም ሰላም እም ይእዜሰ ይኩን ሰላም

VERSE 1
ክርስቶስ ተነሳ ከሙታን በታላቅ ኃይልና ስልጣን
ሰይጣንን አስሮ ነጻ አወጣው አዳምን ሰላም ሰላም ከእንግዲህ ይሁን ሰላም

CHORUS
ክርስቶስ ተንስአ እሙታን በዓቢይ ኃይል ወስልጣን
አሰሮ ለሰይጣን አግዓዞ ለአዳም ሰላም ሰላም ሰላም እም ይእዜሰ ይኩን ሰላም',
        lyrics_transliteration = 'CHORUS
krstos tense mutan beabiy hayl wesltan
esero leseytan egazo leedam selam selam selam m yzese ykun selam

VERSE 1
krstos tenesa kemutan betalaq haylna sltan
seytann esro netsa ewetaw edamn selam selam kengdih yhun selam

CHORUS
krstos tense mutan beabiy hayl wesltan
esero leseytan egazo leedam selam selam selam m yzese ykun selam',
        updated_at = clock_timestamp()::text
    WHERE import_id = '96ff6786-e9fb-4a80-bee5-ba1af3b20775'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክርስቶስ ተንስአ እሙታን በዓቢይ ኃይል ወስልጣን
አሰሮ ለሰይጣን አግዓዞ ለአዳም ሰላም ሰላም ሰላም እም ይእዜሰ ይኩን ሰላም

VERSE 1
ክርስቶስ ተነሳ ከሙታን በታላቅ ኃይልና ስልጣን
ሰይጣንን አስሮ ነጻ አወጣው አዳምን ሰላም ሰላም ከእንግዲህ ይሁን ሰላም

CHORUS
ክርስቶስ ተንስአ እሙታን በዓቢይ ኃይል ወስልጣን
አሰሮ ለሰይጣን አግዓዞ ለአዳም ሰላም ሰላም ሰላም እም ይእዜሰ ይኩን ሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
krstos tense mutan beabiy hayl wesltan
esero leseytan egazo leedam selam selam selam m yzese ykun selam

VERSE 1
krstos tenesa kemutan betalaq haylna sltan
seytann esro netsa ewetaw edamn selam selam kengdih yhun selam

CHORUS
krstos tense mutan beabiy hayl wesltan
esero leseytan egazo leedam selam selam selam m yzese ykun selam';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '96ff6786-e9fb-4a80-bee5-ba1af3b20775'::uuid, 'kirstos-tensae', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kiyamew-yikirna ("Kiyamew Yikirna")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a4b9b041-623a-48de-b7ef-0e79ba49c6c9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 1
እስከመቼ ድረስ ህዝብህ ተጎሳቁሎ
በረከሰ መንፈስ በርኩሰት ተጥሎ
ምድር እያለቀሰች ደም እየሸተታት
እባክህ አምላኬ ኢትዮጵያን ታረቃት /ሀገሬን/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 2
የዘመኑ ጣዖት ገንዘብ እያሳተን
ይህ ደካማ ስጋ አምላክን አስተወን
ግብዝነት ሞልቶት ፈራሹ አካል
በነፍስ በሽታ ህዝባችን ታሟል /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 3
ክንፋችን ተመትቶ መብረር አቅቶናል
በመንፈስ በሽታ ህዝባችን ታውኳል
ራዕይ የሌለው ተራ ሰው ስለሆን
እባክህ ጌታችን በፍትነት ታረቀን /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 4
ጸጋህ የተለየን ባዶነት የሞላን
ፍቅር የተነፈግን ሰላም የጎደለን
ሆነን ስለቀረን እግዚአብሔር ታረቀን
ጽድቅን አድለን ጽድቅ እንደተመኘን /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 1
Eskemeche deres hizbih tegosakelo
Berekkese menfes berkusat tet’lo
Midir eyalekesetch dem eyishetetat
Ebakih Amlake Ethiopia tarekat (hageren)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 2
Yezemenu ta’ot genzeb eyasaten
Yih dekama siga Amlakn astewen
Gibizinet molt’ot ferashu akal
Benefs beshita hizbachin tamwal (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 3
Kinfachin temetto mebrer aqt’onal
Bemenfes beshita hizbachin tawkwal
Ra’iy yelelew tera sew silehon
Ebakih getachin befit’net tareken (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 4
Tsegah yetelayen badonet yemolan
Fiqir yetenefegn selam yegodelen
Honen sileqeren Egziabher tareken
Tsidkin adlen tsidk endetemenyen (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 1
እስከመቼ ድረስ ህዝብህ ተጎሳቁሎ
በረከሰ መንፈስ በርኩሰት ተጥሎ
ምድር እያለቀሰች ደም እየሸተታት
እባክህ አምላኬ ኢትዮጵያን ታረቃት /ሀገሬን/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 2
የዘመኑ ጣዖት ገንዘብ እያሳተን
ይህ ደካማ ስጋ አምላክን አስተወን
ግብዝነት ሞልቶት ፈራሹ አካል
በነፍስ በሽታ ህዝባችን ታሟል /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 3
ክንፋችን ተመትቶ መብረር አቅቶናል
በመንፈስ በሽታ ህዝባችን ታውኳል
ራዕይ የሌለው ተራ ሰው ስለሆን
እባክህ ጌታችን በፍትነት ታረቀን /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 4
ጸጋህ የተለየን ባዶነት የሞላን
ፍቅር የተነፈግን ሰላም የጎደለን
ሆነን ስለቀረን እግዚአብሔር ታረቀን
ጽድቅን አድለን ጽድቅ እንደተመኘን /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/',
        lyrics_transliteration = 'CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 1
Eskemeche deres hizbih tegosakelo
Berekkese menfes berkusat tet’lo
Midir eyalekesetch dem eyishetetat
Ebakih Amlake Ethiopia tarekat (hageren)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 2
Yezemenu ta’ot genzeb eyasaten
Yih dekama siga Amlakn astewen
Gibizinet molt’ot ferashu akal
Benefs beshita hizbachin tamwal (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 3
Kinfachin temetto mebrer aqt’onal
Bemenfes beshita hizbachin tawkwal
Ra’iy yelelew tera sew silehon
Ebakih getachin befit’net tareken (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 4
Tsegah yetelayen badonet yemolan
Fiqir yetenefegn selam yegodelen
Honen sileqeren Egziabher tareken
Tsidkin adlen tsidk endetemenyen (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a4b9b041-623a-48de-b7ef-0e79ba49c6c9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 1
እስከመቼ ድረስ ህዝብህ ተጎሳቁሎ
በረከሰ መንፈስ በርኩሰት ተጥሎ
ምድር እያለቀሰች ደም እየሸተታት
እባክህ አምላኬ ኢትዮጵያን ታረቃት /ሀገሬን/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 2
የዘመኑ ጣዖት ገንዘብ እያሳተን
ይህ ደካማ ስጋ አምላክን አስተወን
ግብዝነት ሞልቶት ፈራሹ አካል
በነፍስ በሽታ ህዝባችን ታሟል /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 3
ክንፋችን ተመትቶ መብረር አቅቶናል
በመንፈስ በሽታ ህዝባችን ታውኳል
ራዕይ የሌለው ተራ ሰው ስለሆን
እባክህ ጌታችን በፍትነት ታረቀን /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 4
ጸጋህ የተለየን ባዶነት የሞላን
ፍቅር የተነፈግን ሰላም የጎደለን
ሆነን ስለቀረን እግዚአብሔር ታረቀን
ጽድቅን አድለን ጽድቅ እንደተመኘን /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 1
Eskemeche deres hizbih tegosakelo
Berekkese menfes berkusat tet’lo
Midir eyalekesetch dem eyishetetat
Ebakih Amlake Ethiopia tarekat (hageren)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 2
Yezemenu ta’ot genzeb eyasaten
Yih dekama siga Amlakn astewen
Gibizinet molt’ot ferashu akal
Benefs beshita hizbachin tamwal (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 3
Kinfachin temetto mebrer aqt’onal
Bemenfes beshita hizbachin tawkwal
Ra’iy yelelew tera sew silehon
Ebakih getachin befit’net tareken (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 4
Tsegah yetelayen badonet yemolan
Fiqir yetenefegn selam yegodelen
Honen sileqeren Egziabher tareken
Tsidkin adlen tsidk endetemenyen (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a4b9b041-623a-48de-b7ef-0e79ba49c6c9'::uuid, 'kiyamew-yikirna', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egziabger-hoy ("Egziabger hoy")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '49b9b484-91fa-4b94-8f23-97c2b9ad6a8b'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አላቀውም ብሎ ሲጠየቅ ያመጸው',
        lyrics_transliteration = 'CHORUS
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
Alaqewm bilo sit’eyeq yamets’ew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '49b9b484-91fa-4b94-8f23-97c2b9ad6a8b'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '49b9b484-91fa-4b94-8f23-97c2b9ad6a8b'::uuid, 'egziabger-hoy', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- liredan-meta-mikael ("Liredan Meta Mikael")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2ebd549e-f66b-4036-8799-dde26348069b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 1
መንገድ የመራኸው ››
የኤርትራን ባህር ››
ከፍለህ ያሻገርከው ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 2
ክብርህ ከመላእክት ኃያል ሚካኤል
ከፍ ከፍ ያለ ነው ››
ታላቁ አለቃ ››
ከቶ እንዳንተ ማነው ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 3
ከሃጢያት በረሃ ኃያል ሚካኤል
መጠለያ ሆነን ››
ጠላት በመንገድ ላይ ››
እንዳያስፈራራን ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 1
Menged yemarakhew ››
Ye’Ertra bahir ››
Kefleh yashagerkew ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 2
Kibirih kemela’ikt hayal Mikael
Kef kef yale new ››
Talaku aleqa ››
Keto endet ante manew ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 3
Kehat’iyat bereha hayal Mikael
Met’eleya honen ››
T’elaṭ bemenged lay ››
Endayasferaran ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 1
መንገድ የመራኸው ››
የኤርትራን ባህር ››
ከፍለህ ያሻገርከው ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 2
ክብርህ ከመላእክት ኃያል ሚካኤል
ከፍ ከፍ ያለ ነው ››
ታላቁ አለቃ ››
ከቶ እንዳንተ ማነው ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 3
ከሃጢያት በረሃ ኃያል ሚካኤል
መጠለያ ሆነን ››
ጠላት በመንገድ ላይ ››
እንዳያስፈራራን ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል',
        lyrics_transliteration = 'CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 1
Menged yemarakhew ››
Ye’Ertra bahir ››
Kefleh yashagerkew ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 2
Kibirih kemela’ikt hayal Mikael
Kef kef yale new ››
Talaku aleqa ››
Keto endet ante manew ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 3
Kehat’iyat bereha hayal Mikael
Met’eleya honen ››
T’elaṭ bemenged lay ››
Endayasferaran ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2ebd549e-f66b-4036-8799-dde26348069b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 1
መንገድ የመራኸው ››
የኤርትራን ባህር ››
ከፍለህ ያሻገርከው ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 2
ክብርህ ከመላእክት ኃያል ሚካኤል
ከፍ ከፍ ያለ ነው ››
ታላቁ አለቃ ››
ከቶ እንዳንተ ማነው ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 3
ከሃጢያት በረሃ ኃያል ሚካኤል
መጠለያ ሆነን ››
ጠላት በመንገድ ላይ ››
እንዳያስፈራራን ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 1
Menged yemarakhew ››
Ye’Ertra bahir ››
Kefleh yashagerkew ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 2
Kibirih kemela’ikt hayal Mikael
Kef kef yale new ››
Talaku aleqa ››
Keto endet ante manew ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 3
Kehat’iyat bereha hayal Mikael
Met’eleya honen ››
T’elaṭ bemenged lay ››
Endayasferaran ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2ebd549e-f66b-4036-8799-dde26348069b'::uuid, 'liredan-meta-mikael', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kemelaekit-gara-sigelets-besemay ("Kemelaekit Gara Sigelets Besemay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '49beee4c-6557-4678-ac9a-26ea19dcd8e9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Weyolsh nefse hoy weyew yezan leta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '49beee4c-6557-4678-ac9a-26ea19dcd8e9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '49beee4c-6557-4678-ac9a-26ea19dcd8e9'::uuid, 'kemelaekit-gara-sigelets-besemay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mar-mikael-libelih ("Mar Mikael Libel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '981ffd1c-8f9d-412a-b569-f980d9c57a03'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 1
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 2
ባህሩን ክፈለው በደረቅ እዳልፈው
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 3
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 4
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 5
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 6
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 7
በሞቱ ቀጠሮ ሠርግ የደገስክለት
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 8
ረዳኤ ምንዱባን በስደት ደጋፊ
ከክፉ ከልለህ በድል አሳላፊ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 9
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 10
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው
ያን የሰማነውን ዛሬ ሆኖ አየነው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 11
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 12
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 13
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 14
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ።

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 15
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 1
jmariye tanash yalbeqahu bhonm
ndtsena ewqalehu kefite stqedm
ftsameye ndiyamr ndiwab bebeth

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 2
ebertany lberta etsnany ltsna ljh
bahrun kfelew bedereq dalfew
ndalfera ebertany jen bejh yazew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 3
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 4
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 5
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 6
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 7
bemotu qetero serg yedegesklet
mna bahran staterfew kemot
zarem tamrhn tdgnahn eytew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 8
bzuwoch yluhel mikael mut ensaw
redae mnduban besdet degafi
kekfu kelleh bedl esalafi

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 9
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 10
eletun keflehw bebetre mesqel
kechnchaw setehen marna tsebel
qedmo lesrael yane ndaderekew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 11
yan yesemanewn zare hono eyenew
yebrhanun emd fana teketlen
keqdusan sfra zajrmael deresn

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 12
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 13
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 14
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 15
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 1
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 2
ባህሩን ክፈለው በደረቅ እዳልፈው
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 3
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 4
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 5
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 6
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 7
በሞቱ ቀጠሮ ሠርግ የደገስክለት
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 8
ረዳኤ ምንዱባን በስደት ደጋፊ
ከክፉ ከልለህ በድል አሳላፊ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 9
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 10
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው
ያን የሰማነውን ዛሬ ሆኖ አየነው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 11
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 12
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 13
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 14
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ።

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 15
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ',
        lyrics_transliteration = 'CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 1
jmariye tanash yalbeqahu bhonm
ndtsena ewqalehu kefite stqedm
ftsameye ndiyamr ndiwab bebeth

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 2
ebertany lberta etsnany ltsna ljh
bahrun kfelew bedereq dalfew
ndalfera ebertany jen bejh yazew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 3
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 4
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 5
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 6
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 7
bemotu qetero serg yedegesklet
mna bahran staterfew kemot
zarem tamrhn tdgnahn eytew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 8
bzuwoch yluhel mikael mut ensaw
redae mnduban besdet degafi
kekfu kelleh bedl esalafi

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 9
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 10
eletun keflehw bebetre mesqel
kechnchaw setehen marna tsebel
qedmo lesrael yane ndaderekew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 11
yan yesemanewn zare hono eyenew
yebrhanun emd fana teketlen
keqdusan sfra zajrmael deresn

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 12
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 13
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 14
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 15
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema',
        updated_at = clock_timestamp()::text
    WHERE import_id = '981ffd1c-8f9d-412a-b569-f980d9c57a03'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 1
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 2
ባህሩን ክፈለው በደረቅ እዳልፈው
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 3
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 4
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 5
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 6
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 7
በሞቱ ቀጠሮ ሠርግ የደገስክለት
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 8
ረዳኤ ምንዱባን በስደት ደጋፊ
ከክፉ ከልለህ በድል አሳላፊ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 9
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 10
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው
ያን የሰማነውን ዛሬ ሆኖ አየነው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 11
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 12
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 13
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 14
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ።

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 15
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 1
jmariye tanash yalbeqahu bhonm
ndtsena ewqalehu kefite stqedm
ftsameye ndiyamr ndiwab bebeth

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 2
ebertany lberta etsnany ltsna ljh
bahrun kfelew bedereq dalfew
ndalfera ebertany jen bejh yazew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 3
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 4
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 5
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 6
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 7
bemotu qetero serg yedegesklet
mna bahran staterfew kemot
zarem tamrhn tdgnahn eytew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 8
bzuwoch yluhel mikael mut ensaw
redae mnduban besdet degafi
kekfu kelleh bedl esalafi

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 9
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 10
eletun keflehw bebetre mesqel
kechnchaw setehen marna tsebel
qedmo lesrael yane ndaderekew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 11
yan yesemanewn zare hono eyenew
yebrhanun emd fana teketlen
keqdusan sfra zajrmael deresn

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 12
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 13
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 14
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 15
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '981ffd1c-8f9d-412a-b569-f980d9c57a03'::uuid, 'mar-mikael-libelih', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- rufael-tekebel-tseloten ("Rufael Tekebel Tseloten")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4c468a3f-783a-4155-a3e9-9ee9d62efcdc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 1
ተቀበል ከደጅህ መጥቼ
ተቀበል እጆቼን ዘርግቼ
ተቀበል ልሂድ ወደ ቤቴ
ተቀበል ባንተ ተፈትቼ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 2
ተቀበል እንደ ጦቢት ጦቢያ
ተቀበል አኔንም ባርከኝ
ተቀበል አምላኬ እግዚአብሔርን
ተቀበል ላመስግን እርዳኝ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 3
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 4
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 5
ተቀበል አስማንዲዎስ ይጥፋ
ተቀበል በመብረቅ ይውደም
ተቀበል እጣኑ ጭስ ሲያርግ
ተቀበል ደዌ ከኔ ይራቅ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 6
ተቀበል ድንቅን የምታደርግ
ተቀበል በአሳ አንባሪው ላይ
ተቀበል ሩፋኤል አንተ ነህ
ተቀበል እኔ ለኔ በላይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 7
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 8
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 1
Teqebel kedejh met’che
Teqebel ejochen zergche
Teqebel lihid wede bete
Teqebel bante tefetche

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 2
Teqebel ende t’obit t’obiya
Teqebel anenm barkegn
Teqebel amlake Egziabhern
Teqebel lamesgn erdagn

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 3
Teqebel azazeln asreh
Teqebel bech’elema yet’alk
Teqebel bedewe simeta
Teqebel medanite ante neh

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 4
Teqebel kene gara honeh
Teqebel ts’eloten asarg
Teqebel wist’e noha semay
Teqebel keamlake adonay

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 5
Teqebel asmandiwos yit’fa
Teqebel bemebreq yiwdem
Teqebel et’anu ch’s siyarg
Teqebel dewe kene yiraq

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 6
Teqebel dinqn yemtaderg
Teqebel beasa anbariw lay
Teqebel Rufael ante neh
Teqebel ene lene belay

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 7
Teqebel azazeln asreh
Teqebel bech’elema yet’alk
Teqebel bedewe simeta
Teqebel medanite ante neh

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 8
Teqebel kene gara honeh
Teqebel ts’eloten asarg
Teqebel wist’e noha semay
Teqebel keamlake adonay

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 1
ተቀበል ከደጅህ መጥቼ
ተቀበል እጆቼን ዘርግቼ
ተቀበል ልሂድ ወደ ቤቴ
ተቀበል ባንተ ተፈትቼ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 2
ተቀበል እንደ ጦቢት ጦቢያ
ተቀበል አኔንም ባርከኝ
ተቀበል አምላኬ እግዚአብሔርን
ተቀበል ላመስግን እርዳኝ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 3
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 4
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 5
ተቀበል አስማንዲዎስ ይጥፋ
ተቀበል በመብረቅ ይውደም
ተቀበል እጣኑ ጭስ ሲያርግ
ተቀበል ደዌ ከኔ ይራቅ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 6
ተቀበል ድንቅን የምታደርግ
ተቀበል በአሳ አንባሪው ላይ
ተቀበል ሩፋኤል አንተ ነህ
ተቀበል እኔ ለኔ በላይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 7
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 8
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን',
        lyrics_transliteration = 'CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 1
Teqebel kedejh met’che
Teqebel ejochen zergche
Teqebel lihid wede bete
Teqebel bante tefetche

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 2
Teqebel ende t’obit t’obiya
Teqebel anenm barkegn
Teqebel amlake Egziabhern
Teqebel lamesgn erdagn

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 3
Teqebel azazeln asreh
Teqebel bech’elema yet’alk
Teqebel bedewe simeta
Teqebel medanite ante neh

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 4
Teqebel kene gara honeh
Teqebel ts’eloten asarg
Teqebel wist’e noha semay
Teqebel keamlake adonay

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 5
Teqebel asmandiwos yit’fa
Teqebel bemebreq yiwdem
Teqebel et’anu ch’s siyarg
Teqebel dewe kene yiraq

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 6
Teqebel dinqn yemtaderg
Teqebel beasa anbariw lay
Teqebel Rufael ante neh
Teqebel ene lene belay

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 7
Teqebel azazeln asreh
Teqebel bech’elema yet’alk
Teqebel bedewe simeta
Teqebel medanite ante neh

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 8
Teqebel kene gara honeh
Teqebel ts’eloten asarg
Teqebel wist’e noha semay
Teqebel keamlake adonay

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4c468a3f-783a-4155-a3e9-9ee9d62efcdc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 1
ተቀበል ከደጅህ መጥቼ
ተቀበል እጆቼን ዘርግቼ
ተቀበል ልሂድ ወደ ቤቴ
ተቀበል ባንተ ተፈትቼ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 2
ተቀበል እንደ ጦቢት ጦቢያ
ተቀበል አኔንም ባርከኝ
ተቀበል አምላኬ እግዚአብሔርን
ተቀበል ላመስግን እርዳኝ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 3
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 4
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 5
ተቀበል አስማንዲዎስ ይጥፋ
ተቀበል በመብረቅ ይውደም
ተቀበል እጣኑ ጭስ ሲያርግ
ተቀበል ደዌ ከኔ ይራቅ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 6
ተቀበል ድንቅን የምታደርግ
ተቀበል በአሳ አንባሪው ላይ
ተቀበል ሩፋኤል አንተ ነህ
ተቀበል እኔ ለኔ በላይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 7
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 8
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4c468a3f-783a-4155-a3e9-9ee9d62efcdc'::uuid, 'rufael-tekebel-tseloten', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- meskel-birhane ("Meskel Birhane")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '44973840-b954-4174-beae-14d74c95de4c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀል ብርሀነ ለኵሉ ዓለም መሠረተ ቤተክርስቲያን (፪)
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ ነአምን (፪)

VERSE 1
መስቀል ብርሃን ነው ለመላው ዓለም መሠረት ነው የቤተክርስቲያን (፪)
ሰላምን ሰጪ ነው መድኃኔዓለም መስቀል አዳኝ ነው ለምናምን ሰዎች (፪)

CHORUS
መስቀል ብርሀነ ለኵሉ ዓለም መሠረተ ቤተክርስቲያን (፪)
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ ነአምን (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskel birhane lekulu alem meserete betekrstian (2)
Wehabe selam medhanialem meskel medhin le’ele ne’amin (2)

VERSE 1
Meskel birhan new lemelaw alem meseret new ye’betekrstian (2)
Selamin sechi new medhanialem meskel adagn new leminamin sewoch (2)

CHORUS
Meskel birhane lekulu alem meserete betekrstian (2)
Wehabe selam medhanialem meskel medhin le’ele ne’amin (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መስቀል ብርሀነ ለኵሉ ዓለም መሠረተ ቤተክርስቲያን (፪)
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ ነአምን (፪)

VERSE 1
መስቀል ብርሃን ነው ለመላው ዓለም መሠረት ነው የቤተክርስቲያን (፪)
ሰላምን ሰጪ ነው መድኃኔዓለም መስቀል አዳኝ ነው ለምናምን ሰዎች (፪)

CHORUS
መስቀል ብርሀነ ለኵሉ ዓለም መሠረተ ቤተክርስቲያን (፪)
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ ነአምን (፪)',
        lyrics_transliteration = 'CHORUS
Meskel birhane lekulu alem meserete betekrstian (2)
Wehabe selam medhanialem meskel medhin le’ele ne’amin (2)

VERSE 1
Meskel birhan new lemelaw alem meseret new ye’betekrstian (2)
Selamin sechi new medhanialem meskel adagn new leminamin sewoch (2)

CHORUS
Meskel birhane lekulu alem meserete betekrstian (2)
Wehabe selam medhanialem meskel medhin le’ele ne’amin (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '44973840-b954-4174-beae-14d74c95de4c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀል ብርሀነ ለኵሉ ዓለም መሠረተ ቤተክርስቲያን (፪)
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ ነአምን (፪)

VERSE 1
መስቀል ብርሃን ነው ለመላው ዓለም መሠረት ነው የቤተክርስቲያን (፪)
ሰላምን ሰጪ ነው መድኃኔዓለም መስቀል አዳኝ ነው ለምናምን ሰዎች (፪)

CHORUS
መስቀል ብርሀነ ለኵሉ ዓለም መሠረተ ቤተክርስቲያን (፪)
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ ነአምን (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskel birhane lekulu alem meserete betekrstian (2)
Wehabe selam medhanialem meskel medhin le’ele ne’amin (2)

VERSE 1
Meskel birhan new lemelaw alem meseret new ye’betekrstian (2)
Selamin sechi new medhanialem meskel adagn new leminamin sewoch (2)

CHORUS
Meskel birhane lekulu alem meserete betekrstian (2)
Wehabe selam medhanialem meskel medhin le’ele ne’amin (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '44973840-b954-4174-beae-14d74c95de4c'::uuid, 'meskel-birhane', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yefkrekaye ("yefkrekaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e13d1e4f-3c16-4a08-b1f6-ffbdd8635d6b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 1
ጸልማት እንክወረኒ ተስፉይ ማሲኑ ልበይ ክደሚ
ሪኡ ክፋስስ ንብዓተይ ሰማይ ሰንጢቁ
መጽዩኒ ጎይታይ ጽሓይ ኮይኑኒ ዒንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ ኣይተሰዓርኩን ጎይታይ ኣሎኒ ጉድጋድ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 2
ደፋኑስ ሂወት ሂቡኒ
ከም ኣምላኸይስ ማንም የለን ማንም የለን
ከም እግዛቢሄር ማንም የለን ማንም የለን
ከመ ፈጣሪየይ ማንም የለን ማንም የለን

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 3
ከመ ኣማኑኤል ማንም የለን ማንም የለን
ግሩም ዲንቂ ዩ ኣምላኸይ ግሩም ዲንቂ ዩ
ግሩም ዲንቂ ዩ ጎይታየይ ግሩም ዲንቂ ዩ
ሰብ ዝደርበዮ ካብ ምድሪ የልዐሎ እዩ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 4
ዝተረሰዐ ኣምላኸይ ይዝክር እዩ
ኣብቲ ብርቱዐ ማዐበል ክትኮነኒ ጸታ
ጭንቀይ እንዳ ረገጽካ መጺካኒ ጎይታ
ሓይሊ ናይ ሰብ እሞ ኣበይ ኣድሒኑኒ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 5
የማነይቲ ኢድካ እንተ ዘይትድግፈኒ
ታሪኸይ ቀያሪ መልክዐ ማንነተይ
ጸዋዐካኒ ጎይታ ንስኻ ዐረፍተይ
ተላዒለ ክውርውር ድምጺ ምስጋና

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 6
ከናፍረይ ኣፈልፉለ ተላዒለ ልሳነይ ትምስክር ኣላ
ምድሓኑ ሪእ ዓጊበ ተላዒለ እግረይ ናብ ቅዱስ መቅደስካ
እንሆ ኣንጊህ ይግስግስ ተላዒለ
ከም ብርቱዐ ገላቢ ፈረስ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 7
ብምስጋና ይመላለስ
ንዑ ንሕበር ንምስጋና
ንዑ ንሕበር ንውዳሴ
ንዑ ንሕበር ንኣምልኾ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 8
ንዑ ንሕበር ኣብ ጉባኤ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 1
Ts’elmat enkwereni tesfuy masinu libey kidemi
Riu kifass nibatey semay sent’iqu
Mets’yuni goytay ts’hay koynuni indi birhaney
Iyesus niay hiwet mengedey aytesearkun goytay aloni gudgad

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 2
Defanus hiwet hibuni
Kem amlaኸys manm yelen manm yelen
Kem egzabiher manm yelen manm yelen
Keme fet’ariyey manm yelen manm yelen

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 3
Keme amanuel manm yelen manm yelen
Girum dinqi yu amlaኸy girum dinqi yu
Girum dinqi yu goytayey girum dinqi yu
Seb ziderbeyo kab midri yelalo eyu

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 4
Ziteresea amlaኸy yizkr eyu
Abti birtua maabel kitkoneni ts’eta
Ch’nqey enda regets’ka mets’ikani goyta
Hayli nay seb emo abey adhinuni

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 5
Yemaneyti idka ente zeytdgfeni
Tariኸy qeyari melka mannetey
Ts’ewaakani goyta nisኻ areftey
Telaile kiwrwr dimts’i misgana

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 6
Kenafrey afelfule telaile lisaney timskr ala
Midhanu rie agibe telaile egrey nab Kidus meqdeska
Enho angih yigsgs telaile
Kem birtua gelabi feres

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 7
Bimsgana yimelales
Niu nihber nimsgana
Niu nihber niwdase
Niu nihber niamlኾ

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 8
Niu nihber ab gubae

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 1
ጸልማት እንክወረኒ ተስፉይ ማሲኑ ልበይ ክደሚ
ሪኡ ክፋስስ ንብዓተይ ሰማይ ሰንጢቁ
መጽዩኒ ጎይታይ ጽሓይ ኮይኑኒ ዒንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ ኣይተሰዓርኩን ጎይታይ ኣሎኒ ጉድጋድ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 2
ደፋኑስ ሂወት ሂቡኒ
ከም ኣምላኸይስ ማንም የለን ማንም የለን
ከም እግዛቢሄር ማንም የለን ማንም የለን
ከመ ፈጣሪየይ ማንም የለን ማንም የለን

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 3
ከመ ኣማኑኤል ማንም የለን ማንም የለን
ግሩም ዲንቂ ዩ ኣምላኸይ ግሩም ዲንቂ ዩ
ግሩም ዲንቂ ዩ ጎይታየይ ግሩም ዲንቂ ዩ
ሰብ ዝደርበዮ ካብ ምድሪ የልዐሎ እዩ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 4
ዝተረሰዐ ኣምላኸይ ይዝክር እዩ
ኣብቲ ብርቱዐ ማዐበል ክትኮነኒ ጸታ
ጭንቀይ እንዳ ረገጽካ መጺካኒ ጎይታ
ሓይሊ ናይ ሰብ እሞ ኣበይ ኣድሒኑኒ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 5
የማነይቲ ኢድካ እንተ ዘይትድግፈኒ
ታሪኸይ ቀያሪ መልክዐ ማንነተይ
ጸዋዐካኒ ጎይታ ንስኻ ዐረፍተይ
ተላዒለ ክውርውር ድምጺ ምስጋና

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 6
ከናፍረይ ኣፈልፉለ ተላዒለ ልሳነይ ትምስክር ኣላ
ምድሓኑ ሪእ ዓጊበ ተላዒለ እግረይ ናብ ቅዱስ መቅደስካ
እንሆ ኣንጊህ ይግስግስ ተላዒለ
ከም ብርቱዐ ገላቢ ፈረስ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 7
ብምስጋና ይመላለስ
ንዑ ንሕበር ንምስጋና
ንዑ ንሕበር ንውዳሴ
ንዑ ንሕበር ንኣምልኾ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 8
ንዑ ንሕበር ኣብ ጉባኤ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ',
        lyrics_transliteration = 'CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 1
Ts’elmat enkwereni tesfuy masinu libey kidemi
Riu kifass nibatey semay sent’iqu
Mets’yuni goytay ts’hay koynuni indi birhaney
Iyesus niay hiwet mengedey aytesearkun goytay aloni gudgad

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 2
Defanus hiwet hibuni
Kem amlaኸys manm yelen manm yelen
Kem egzabiher manm yelen manm yelen
Keme fet’ariyey manm yelen manm yelen

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 3
Keme amanuel manm yelen manm yelen
Girum dinqi yu amlaኸy girum dinqi yu
Girum dinqi yu goytayey girum dinqi yu
Seb ziderbeyo kab midri yelalo eyu

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 4
Ziteresea amlaኸy yizkr eyu
Abti birtua maabel kitkoneni ts’eta
Ch’nqey enda regets’ka mets’ikani goyta
Hayli nay seb emo abey adhinuni

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 5
Yemaneyti idka ente zeytdgfeni
Tariኸy qeyari melka mannetey
Ts’ewaakani goyta nisኻ areftey
Telaile kiwrwr dimts’i misgana

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 6
Kenafrey afelfule telaile lisaney timskr ala
Midhanu rie agibe telaile egrey nab Kidus meqdeska
Enho angih yigsgs telaile
Kem birtua gelabi feres

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 7
Bimsgana yimelales
Niu nihber nimsgana
Niu nihber niwdase
Niu nihber niamlኾ

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 8
Niu nihber ab gubae

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e13d1e4f-3c16-4a08-b1f6-ffbdd8635d6b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 1
ጸልማት እንክወረኒ ተስፉይ ማሲኑ ልበይ ክደሚ
ሪኡ ክፋስስ ንብዓተይ ሰማይ ሰንጢቁ
መጽዩኒ ጎይታይ ጽሓይ ኮይኑኒ ዒንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ ኣይተሰዓርኩን ጎይታይ ኣሎኒ ጉድጋድ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 2
ደፋኑስ ሂወት ሂቡኒ
ከም ኣምላኸይስ ማንም የለን ማንም የለን
ከም እግዛቢሄር ማንም የለን ማንም የለን
ከመ ፈጣሪየይ ማንም የለን ማንም የለን

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 3
ከመ ኣማኑኤል ማንም የለን ማንም የለን
ግሩም ዲንቂ ዩ ኣምላኸይ ግሩም ዲንቂ ዩ
ግሩም ዲንቂ ዩ ጎይታየይ ግሩም ዲንቂ ዩ
ሰብ ዝደርበዮ ካብ ምድሪ የልዐሎ እዩ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 4
ዝተረሰዐ ኣምላኸይ ይዝክር እዩ
ኣብቲ ብርቱዐ ማዐበል ክትኮነኒ ጸታ
ጭንቀይ እንዳ ረገጽካ መጺካኒ ጎይታ
ሓይሊ ናይ ሰብ እሞ ኣበይ ኣድሒኑኒ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 5
የማነይቲ ኢድካ እንተ ዘይትድግፈኒ
ታሪኸይ ቀያሪ መልክዐ ማንነተይ
ጸዋዐካኒ ጎይታ ንስኻ ዐረፍተይ
ተላዒለ ክውርውር ድምጺ ምስጋና

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 6
ከናፍረይ ኣፈልፉለ ተላዒለ ልሳነይ ትምስክር ኣላ
ምድሓኑ ሪእ ዓጊበ ተላዒለ እግረይ ናብ ቅዱስ መቅደስካ
እንሆ ኣንጊህ ይግስግስ ተላዒለ
ከም ብርቱዐ ገላቢ ፈረስ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 7
ብምስጋና ይመላለስ
ንዑ ንሕበር ንምስጋና
ንዑ ንሕበር ንውዳሴ
ንዑ ንሕበር ንኣምልኾ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 8
ንዑ ንሕበር ኣብ ጉባኤ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e13d1e4f-3c16-4a08-b1f6-ffbdd8635d6b'::uuid, 'yefkrekaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- misle-mikael-we-gebriel ("Misle Mikael We Gebriel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b7de174d-5132-4eed-873f-e01db5297e00'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)

VERSE 1
ንዒ ••ንዒ•• ንዒ •• ንዒ /፬/

CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)

VERSE 2
እም አምላክ ንዒ ማርያም (፪)

CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)

VERSE 1
Ni •• ni •• ni •• ni (×4)

CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)

VERSE 2
Em Amlak ni Maryam (×2)

CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)

VERSE 1
ንዒ ••ንዒ•• ንዒ •• ንዒ /፬/

CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)

VERSE 2
እም አምላክ ንዒ ማርያም (፪)

CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)',
        lyrics_transliteration = 'CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)

VERSE 1
Ni •• ni •• ni •• ni (×4)

CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)

VERSE 2
Em Amlak ni Maryam (×2)

CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b7de174d-5132-4eed-873f-e01db5297e00'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)

VERSE 1
ንዒ ••ንዒ•• ንዒ •• ንዒ /፬/

CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)

VERSE 2
እም አምላክ ንዒ ማርያም (፪)

CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)

VERSE 1
Ni •• ni •• ni •• ni (×4)

CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)

VERSE 2
Em Amlak ni Maryam (×2)

CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b7de174d-5132-4eed-873f-e01db5297e00'::uuid, 'misle-mikael-we-gebriel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian-orthodox-church-mezmur-zemarit-selamawit ("Ethiopian Orthodox Church Mezmur Zemarit Selamawit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '506a8def-6533-4d8e-8cdd-4b70d8cb9398'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 1
በመገፍት ብኖር እምነቴን አፀናለሁ
በጣቶችሽ ተይዤ አዲሱ ቀን አያለሁ (2)
ስማፀን ደጅሽ መጥቼ
ተመለሰኩ ተረጋግቼ

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 2
እንደምን አንቺን እረሳለሁ
በምልጃሽ ተፈውሻለሁ
የጠላቶቼን አራስ የሚቀጠቅጠው
የአብራክሽን ፍሬ ተስፍዬን አበራው (2)

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 3
የድኅነት ምክንያት አርጎሻል
ለአዳም ዘር ትምክህት ሆነሻል
የልቤ ብርሃን ፍና
አዛኝት ባንቺ ልፅናና

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 4
የአፌን እንጉርጉሮ ምስጋናዬ ወርሶታል
እግሬ ከእረግረግ ወጥቶ በሰገነት ተተክሏል (2)
ሐዜኔን የምሻገረው
ስምሽን እየጠራሁ ነው

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 5
አገኘው ደስታ ሰላም
ጠርቼ ብዬ ማርያም
በአብረቅራቂው ፍቅር በዓለሙ ውስጥ ስኖር
ለሙውጣት ዳክራለሁ ማርያም ማርያም እላለሁ(2)

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 6
ሰምተሻል ልመናዬን
ወጣሁኝ ያኑን ጥልቁን
እሳቱን ባንቺ አልፌአለሁ
በምልጃሽ ደግፌ አለው

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 1
Bemegeft binor emneten ats’enalehu
Bet’atochsh teyzhe adisu qen ayalehu (2)
Simats’en dejsh met’che
Temeleseku teregagche

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 2
Endemn anchin eresalehu
Bemljash tefewshalehu
Yet’elatochen aras yemiqet’eqt’ew
Yeabrakshn fire tesfyen aberaw (2)

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 3
Yedhnet miknyat argoshal
Leadam zer timkht honeshal
Yelbe birhan fina
Azagnt banchi lits’nana

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 4
Yeafen engurguro misganaye wersotal
Egre keeregreg wet’to besegenet teteklwal (2)
Hezenen yemshagerew
Simshn eyet’erahu new

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 5
Agegnew desta selam
T’erche biye Maryam
Beabreqraqiw fiqr bealemu wist’ sinor
Lemuwt’at dakralehu Maryam Maryam elalehu (2)

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 6
Semteshal limenayen
Wet’ahugn yanun t’lqun
Esatun banchi alfealehu
Bemljash degfe alew

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 1
በመገፍት ብኖር እምነቴን አፀናለሁ
በጣቶችሽ ተይዤ አዲሱ ቀን አያለሁ (2)
ስማፀን ደጅሽ መጥቼ
ተመለሰኩ ተረጋግቼ

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 2
እንደምን አንቺን እረሳለሁ
በምልጃሽ ተፈውሻለሁ
የጠላቶቼን አራስ የሚቀጠቅጠው
የአብራክሽን ፍሬ ተስፍዬን አበራው (2)

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 3
የድኅነት ምክንያት አርጎሻል
ለአዳም ዘር ትምክህት ሆነሻል
የልቤ ብርሃን ፍና
አዛኝት ባንቺ ልፅናና

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 4
የአፌን እንጉርጉሮ ምስጋናዬ ወርሶታል
እግሬ ከእረግረግ ወጥቶ በሰገነት ተተክሏል (2)
ሐዜኔን የምሻገረው
ስምሽን እየጠራሁ ነው

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 5
አገኘው ደስታ ሰላም
ጠርቼ ብዬ ማርያም
በአብረቅራቂው ፍቅር በዓለሙ ውስጥ ስኖር
ለሙውጣት ዳክራለሁ ማርያም ማርያም እላለሁ(2)

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 6
ሰምተሻል ልመናዬን
ወጣሁኝ ያኑን ጥልቁን
እሳቱን ባንቺ አልፌአለሁ
በምልጃሽ ደግፌ አለው

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ',
        lyrics_transliteration = 'CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 1
Bemegeft binor emneten ats’enalehu
Bet’atochsh teyzhe adisu qen ayalehu (2)
Simats’en dejsh met’che
Temeleseku teregagche

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 2
Endemn anchin eresalehu
Bemljash tefewshalehu
Yet’elatochen aras yemiqet’eqt’ew
Yeabrakshn fire tesfyen aberaw (2)

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 3
Yedhnet miknyat argoshal
Leadam zer timkht honeshal
Yelbe birhan fina
Azagnt banchi lits’nana

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 4
Yeafen engurguro misganaye wersotal
Egre keeregreg wet’to besegenet teteklwal (2)
Hezenen yemshagerew
Simshn eyet’erahu new

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 5
Agegnew desta selam
T’erche biye Maryam
Beabreqraqiw fiqr bealemu wist’ sinor
Lemuwt’at dakralehu Maryam Maryam elalehu (2)

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 6
Semteshal limenayen
Wet’ahugn yanun t’lqun
Esatun banchi alfealehu
Bemljash degfe alew

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone',
        updated_at = clock_timestamp()::text
    WHERE import_id = '506a8def-6533-4d8e-8cdd-4b70d8cb9398'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 1
በመገፍት ብኖር እምነቴን አፀናለሁ
በጣቶችሽ ተይዤ አዲሱ ቀን አያለሁ (2)
ስማፀን ደጅሽ መጥቼ
ተመለሰኩ ተረጋግቼ

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 2
እንደምን አንቺን እረሳለሁ
በምልጃሽ ተፈውሻለሁ
የጠላቶቼን አራስ የሚቀጠቅጠው
የአብራክሽን ፍሬ ተስፍዬን አበራው (2)

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 3
የድኅነት ምክንያት አርጎሻል
ለአዳም ዘር ትምክህት ሆነሻል
የልቤ ብርሃን ፍና
አዛኝት ባንቺ ልፅናና

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 4
የአፌን እንጉርጉሮ ምስጋናዬ ወርሶታል
እግሬ ከእረግረግ ወጥቶ በሰገነት ተተክሏል (2)
ሐዜኔን የምሻገረው
ስምሽን እየጠራሁ ነው

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 5
አገኘው ደስታ ሰላም
ጠርቼ ብዬ ማርያም
በአብረቅራቂው ፍቅር በዓለሙ ውስጥ ስኖር
ለሙውጣት ዳክራለሁ ማርያም ማርያም እላለሁ(2)

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 6
ሰምተሻል ልመናዬን
ወጣሁኝ ያኑን ጥልቁን
እሳቱን ባንቺ አልፌአለሁ
በምልጃሽ ደግፌ አለው

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '506a8def-6533-4d8e-8cdd-4b70d8cb9398'::uuid, 'ethiopian-orthodox-church-mezmur-zemarit-selamawit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- misiganayen ("Misiganayen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '956cbf3a-7ca8-41db-8e92-48859b530105'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 1
ዘንባባዬን ይዤ እንደ ሕፃናቱ
ሆሳዕና ልበለው ሰግጄ በፊቱ
ምንም ባዶ ብሆን እውቀት ቢጎድለኝም
ለስሙ ልዘምር ከልካይም የለኝም /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 2
አምላኬ በፊትህ ቃል አለብኝ እኔ
ቋንቋዬ መዝሙር ነው ያንተ እንደመሆኔ
በአሚናዳብ ደጃፍ በቅድመ ታቦቱ
ያ የክብርህ ዑደት ጠራኝ ማኅሌቱ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 3
የሕይወት ትርጉሜ አንተ ነህ ደስታዬ
ስምህን ማገልገል ክብሬ ነው ሥራዬ
ለታመነው ጌታ ምስክር የሆኑ
ከብረው ተመለሱ ለበረከት ሆኑ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 4
መነሻዬ አንተ ነህ ጉልበቴና ክብሬ
መድረሻዬም አንተ መደምደሚያ ቅጥሬ
በጽዮን ተራራ ስትገለጥ ያኔ
ነጩን ልብስ አልብሰህ አስነሳኝ ለቅኔ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 1
zenibabayēni yizhē inide ḥit͟s’anatu
hosana libelew segijē befītu
minim bado bihon ewiket bīgodilenyim
lesimu lizemir kelikayim yelenyim /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 2
āmilake befītihi kal ālebinyi ene
kwanikwayē mezmur new yanite endemehonē
beāmīnadabi dejaf bekidime tabotu
ya yekibirihi udeti teranyi maḫilētu /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 3
yeḥiyiwet tirigumē ānte nehi desitayē
simihin mageligel kibirē new siraye
letamenew gēta misikir yehonu
kebirewi temelesu lebereket honu /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 4
meneshayē ānte nehi gulibetēna kibirē
medireshayēm ānte medemidemīya kitirē
betsiyon terara sitigelet yanē
nechun libis ālibisehi āsinesanyi lekinē /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 1
ዘንባባዬን ይዤ እንደ ሕፃናቱ
ሆሳዕና ልበለው ሰግጄ በፊቱ
ምንም ባዶ ብሆን እውቀት ቢጎድለኝም
ለስሙ ልዘምር ከልካይም የለኝም /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 2
አምላኬ በፊትህ ቃል አለብኝ እኔ
ቋንቋዬ መዝሙር ነው ያንተ እንደመሆኔ
በአሚናዳብ ደጃፍ በቅድመ ታቦቱ
ያ የክብርህ ዑደት ጠራኝ ማኅሌቱ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 3
የሕይወት ትርጉሜ አንተ ነህ ደስታዬ
ስምህን ማገልገል ክብሬ ነው ሥራዬ
ለታመነው ጌታ ምስክር የሆኑ
ከብረው ተመለሱ ለበረከት ሆኑ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 4
መነሻዬ አንተ ነህ ጉልበቴና ክብሬ
መድረሻዬም አንተ መደምደሚያ ቅጥሬ
በጽዮን ተራራ ስትገለጥ ያኔ
ነጩን ልብስ አልብሰህ አስነሳኝ ለቅኔ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/',
        lyrics_transliteration = 'CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 1
zenibabayēni yizhē inide ḥit͟s’anatu
hosana libelew segijē befītu
minim bado bihon ewiket bīgodilenyim
lesimu lizemir kelikayim yelenyim /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 2
āmilake befītihi kal ālebinyi ene
kwanikwayē mezmur new yanite endemehonē
beāmīnadabi dejaf bekidime tabotu
ya yekibirihi udeti teranyi maḫilētu /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 3
yeḥiyiwet tirigumē ānte nehi desitayē
simihin mageligel kibirē new siraye
letamenew gēta misikir yehonu
kebirewi temelesu lebereket honu /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 4
meneshayē ānte nehi gulibetēna kibirē
medireshayēm ānte medemidemīya kitirē
betsiyon terara sitigelet yanē
nechun libis ālibisehi āsinesanyi lekinē /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/',
        updated_at = clock_timestamp()::text
    WHERE import_id = '956cbf3a-7ca8-41db-8e92-48859b530105'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 1
ዘንባባዬን ይዤ እንደ ሕፃናቱ
ሆሳዕና ልበለው ሰግጄ በፊቱ
ምንም ባዶ ብሆን እውቀት ቢጎድለኝም
ለስሙ ልዘምር ከልካይም የለኝም /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 2
አምላኬ በፊትህ ቃል አለብኝ እኔ
ቋንቋዬ መዝሙር ነው ያንተ እንደመሆኔ
በአሚናዳብ ደጃፍ በቅድመ ታቦቱ
ያ የክብርህ ዑደት ጠራኝ ማኅሌቱ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 3
የሕይወት ትርጉሜ አንተ ነህ ደስታዬ
ስምህን ማገልገል ክብሬ ነው ሥራዬ
ለታመነው ጌታ ምስክር የሆኑ
ከብረው ተመለሱ ለበረከት ሆኑ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 4
መነሻዬ አንተ ነህ ጉልበቴና ክብሬ
መድረሻዬም አንተ መደምደሚያ ቅጥሬ
በጽዮን ተራራ ስትገለጥ ያኔ
ነጩን ልብስ አልብሰህ አስነሳኝ ለቅኔ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 1
zenibabayēni yizhē inide ḥit͟s’anatu
hosana libelew segijē befītu
minim bado bihon ewiket bīgodilenyim
lesimu lizemir kelikayim yelenyim /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 2
āmilake befītihi kal ālebinyi ene
kwanikwayē mezmur new yanite endemehonē
beāmīnadabi dejaf bekidime tabotu
ya yekibirihi udeti teranyi maḫilētu /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 3
yeḥiyiwet tirigumē ānte nehi desitayē
simihin mageligel kibirē new siraye
letamenew gēta misikir yehonu
kebirewi temelesu lebereket honu /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 4
meneshayē ānte nehi gulibetēna kibirē
medireshayēm ānte medemidemīya kitirē
betsiyon terara sitigelet yanē
nechun libis ālibisehi āsinesanyi lekinē /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '956cbf3a-7ca8-41db-8e92-48859b530105'::uuid, 'misiganayen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- my-benevolent-lord ("My Benevolent Lord")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ffb576fa-0888-4b93-9140-7dd629458bd8'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 1
Closed off by Simon with a heavy discernment
Though he looked down on me with self entitlement
With a proclamation the Lord drew me near Him
I washed His feet with tears no longer feeling grim

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 2
Though my job was to tax collect and oversee
I was ordered by Christ to come down from the tree
His overwhelming grace I struggled to carry
For He has blessed my home Jesus Christ set me free

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 3
To be stoned by jurors when I was surrounded
They listed all my sins to see me convicted
Sin returned the verdict to each their own accord
Go home in peace He said my savior and my Lord

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 4
The God that I worship I know Him He is true
For all He''s done for me with abundant virtue
Within my heart I bear His love and His statute
I cannot leave His sight for He has made me new

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 5
Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 1
Closed off by Simon with a heavy discernment
Though he looked down on me with self entitlement
With a proclamation the Lord drew me near Him
I washed His feet with tears no longer feeling grim

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 2
Though my job was to tax collect and oversee
I was ordered by Christ to come down from the tree
His overwhelming grace I struggled to carry
For He has blessed my home Jesus Christ set me free

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 3
To be stoned by jurors when I was surrounded
They listed all my sins to see me convicted
Sin returned the verdict to each their own accord
Go home in peace He said my savior and my Lord

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 4
The God that I worship I know Him He is true
For all He''s done for me with abundant virtue
Within my heart I bear His love and His statute
I cannot leave His sight for He has made me new

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 5
Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded',
        lyrics_transliteration = 'Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ffb576fa-0888-4b93-9140-7dd629458bd8'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 1
Closed off by Simon with a heavy discernment
Though he looked down on me with self entitlement
With a proclamation the Lord drew me near Him
I washed His feet with tears no longer feeling grim

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 2
Though my job was to tax collect and oversee
I was ordered by Christ to come down from the tree
His overwhelming grace I struggled to carry
For He has blessed my home Jesus Christ set me free

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 3
To be stoned by jurors when I was surrounded
They listed all my sins to see me convicted
Sin returned the verdict to each their own accord
Go home in peace He said my savior and my Lord

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 4
The God that I worship I know Him He is true
For all He''s done for me with abundant virtue
Within my heart I bear His love and His statute
I cannot leave His sight for He has made me new

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 5
Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ffb576fa-0888-4b93-9140-7dd629458bd8'::uuid, 'my-benevolent-lord', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ayselchegnem-orthodox-mezmure ("Ayselchegnem / Orthodox Mezmure")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '50e6918e-9578-4ca7-aa84-4f23d599c736'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 1
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 2
የተከፈተ ደጃፍ ሰጥተኸኛል በፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 3
አልችልም የእርሱን ፍቅር መዘርዘርና ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 4
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 5
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ

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
Yante kind yemayndew terara gara yelem
Wet’chalehu ket’lqu talaq neh zelealem

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 2
Yetekefete dejaf set’teኸgnal befite
Temesgen kiberlgn nigeslgn abate
Angetun fits’um defto qena endl adrgognal
Eyeqatete moto behywet aqumognal

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 3
Alchlm yeersun fiqr mezerzerna mawrat
Wiletawn lemeglets’ yelegnm birtu qalat
Leyteh yet’eraኸgn yabezahlgn ts’ega
Tiztaye neh Geta simeshna sinega

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 4
Wedajna zemede biye sit’erah linur
Iyesus yeEgziabher lij lewet’egn yante
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 5
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta

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
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 2
የተከፈተ ደጃፍ ሰጥተኸኛል በፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 3
አልችልም የእርሱን ፍቅር መዘርዘርና ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 4
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 5
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ

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
Yante kind yemayndew terara gara yelem
Wet’chalehu ket’lqu talaq neh zelealem

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 2
Yetekefete dejaf set’teኸgnal befite
Temesgen kiberlgn nigeslgn abate
Angetun fits’um defto qena endl adrgognal
Eyeqatete moto behywet aqumognal

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 3
Alchlm yeersun fiqr mezerzerna mawrat
Wiletawn lemeglets’ yelegnm birtu qalat
Leyteh yet’eraኸgn yabezahlgn ts’ega
Tiztaye neh Geta simeshna sinega

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 4
Wedajna zemede biye sit’erah linur
Iyesus yeEgziabher lij lewet’egn yante
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 5
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw',
        updated_at = clock_timestamp()::text
    WHERE import_id = '50e6918e-9578-4ca7-aa84-4f23d599c736'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 1
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 2
የተከፈተ ደጃፍ ሰጥተኸኛል በፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 3
አልችልም የእርሱን ፍቅር መዘርዘርና ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 4
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 5
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '50e6918e-9578-4ca7-aa84-4f23d599c736'::uuid, 'ayselchegnem-orthodox-mezmure', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mistiregnaye-nesh ("Awqewalehu Dejishin")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'dc10e015-6562-41ac-80d3-b559bf649a7a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 1
ከአጸደ መቅደስሽ ከስዕልሽ ስር
እረፍቴ በዚያ ነው በቅዱሱ ደብር
ከተራራው አናት ከደጅሽ መጥቼ
ሰምሮልኛል ስምሽን ጠርቼ

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 2
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 3
የሮማን አበባ መዓዛሽ ተወዳጅ
በረከትን ልቅሰም ሳልለይ ካንቺ ደጅ
አስራትሽ አድርጊኝ ጠቅልይኝ እናቴ
ታብብልኝ ትፍካልኝ ሕይወቴ

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 4
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 5
አጠገቤ ጎኔ በዙሪያዬ እንዳለሽ
እንደርሱ ነው ልቤ እማ የሚያወራሽ
አልቅሼ ሲቀለኝ ነግሬሽ የውስጤን
አትዘገይም ስትሠሪልኝ ቤቴን

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 6
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 7
የእንጦጦዋ እናቴ እምዬ የምልሽ
ኪዳንኪ ደጓ የልብን ሰሚ ነሽ
በሄድኩበት አለሽ ተከትለሽኛል
ስላለሽኝ ሰላም ይሰማኛል

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 8
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 1
Ke-atsede meqdesish ke-si''ilish sir
Irefte beziya new be-qidusu debir
Keteraraw anat kedejish metiche
Semrolignal simishin teteriche

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 2
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 3
Ye-roman abeba me’azash tewodaj
Bereketin liqsem saliley kanchi dej
Asratish adrigign teqligign innate
Tabiblign tifikalign hiywote

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 4
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 5
Atigebe gone be-zuriyaye indallesh
Indersu new libbe imma yemiyaworash
Alqishe siqelign negresh yewostien
Atzegeyim sitserilign betien

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 6
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 7
Ye-Entotowa innate immiye yemilish
Kidanki degua yelibin semi nesh
Be-hedkubet allesh tekittileshingal
Silalleshign selam yisimagnal

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 8
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 1
ከአጸደ መቅደስሽ ከስዕልሽ ስር
እረፍቴ በዚያ ነው በቅዱሱ ደብር
ከተራራው አናት ከደጅሽ መጥቼ
ሰምሮልኛል ስምሽን ጠርቼ

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 2
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 3
የሮማን አበባ መዓዛሽ ተወዳጅ
በረከትን ልቅሰም ሳልለይ ካንቺ ደጅ
አስራትሽ አድርጊኝ ጠቅልይኝ እናቴ
ታብብልኝ ትፍካልኝ ሕይወቴ

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 4
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 5
አጠገቤ ጎኔ በዙሪያዬ እንዳለሽ
እንደርሱ ነው ልቤ እማ የሚያወራሽ
አልቅሼ ሲቀለኝ ነግሬሽ የውስጤን
አትዘገይም ስትሠሪልኝ ቤቴን

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 6
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 7
የእንጦጦዋ እናቴ እምዬ የምልሽ
ኪዳንኪ ደጓ የልብን ሰሚ ነሽ
በሄድኩበት አለሽ ተከትለሽኛል
ስላለሽኝ ሰላም ይሰማኛል

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 8
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)',
        lyrics_transliteration = 'CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 1
Ke-atsede meqdesish ke-si''ilish sir
Irefte beziya new be-qidusu debir
Keteraraw anat kedejish metiche
Semrolignal simishin teteriche

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 2
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 3
Ye-roman abeba me’azash tewodaj
Bereketin liqsem saliley kanchi dej
Asratish adrigign teqligign innate
Tabiblign tifikalign hiywote

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 4
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 5
Atigebe gone be-zuriyaye indallesh
Indersu new libbe imma yemiyaworash
Alqishe siqelign negresh yewostien
Atzegeyim sitserilign betien

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 6
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 7
Ye-Entotowa innate immiye yemilish
Kidanki degua yelibin semi nesh
Be-hedkubet allesh tekittileshingal
Silalleshign selam yisimagnal

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 8
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'dc10e015-6562-41ac-80d3-b559bf649a7a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 1
ከአጸደ መቅደስሽ ከስዕልሽ ስር
እረፍቴ በዚያ ነው በቅዱሱ ደብር
ከተራራው አናት ከደጅሽ መጥቼ
ሰምሮልኛል ስምሽን ጠርቼ

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 2
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 3
የሮማን አበባ መዓዛሽ ተወዳጅ
በረከትን ልቅሰም ሳልለይ ካንቺ ደጅ
አስራትሽ አድርጊኝ ጠቅልይኝ እናቴ
ታብብልኝ ትፍካልኝ ሕይወቴ

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 4
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 5
አጠገቤ ጎኔ በዙሪያዬ እንዳለሽ
እንደርሱ ነው ልቤ እማ የሚያወራሽ
አልቅሼ ሲቀለኝ ነግሬሽ የውስጤን
አትዘገይም ስትሠሪልኝ ቤቴን

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 6
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 7
የእንጦጦዋ እናቴ እምዬ የምልሽ
ኪዳንኪ ደጓ የልብን ሰሚ ነሽ
በሄድኩበት አለሽ ተከትለሽኛል
ስላለሽኝ ሰላም ይሰማኛል

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 8
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 1
Ke-atsede meqdesish ke-si''ilish sir
Irefte beziya new be-qidusu debir
Keteraraw anat kedejish metiche
Semrolignal simishin teteriche

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 2
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 3
Ye-roman abeba me’azash tewodaj
Bereketin liqsem saliley kanchi dej
Asratish adrigign teqligign innate
Tabiblign tifikalign hiywote

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 4
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 5
Atigebe gone be-zuriyaye indallesh
Indersu new libbe imma yemiyaworash
Alqishe siqelign negresh yewostien
Atzegeyim sitserilign betien

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 6
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 7
Ye-Entotowa innate immiye yemilish
Kidanki degua yelibin semi nesh
Be-hedkubet allesh tekittileshingal
Silalleshign selam yisimagnal

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 8
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'dc10e015-6562-41ac-80d3-b559bf649a7a'::uuid, 'mistiregnaye-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nana-amanuel-na-medhanite ("Nana Amanuel Na Medhanite")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '717a2acf-05f9-4417-809e-1df350be86f3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 1
ፊትህ የተመላ " "
ሁሌ ለይቅርታ " "
ካለው ፍቅር በላይ " "
አባት ለአንድ ልጁ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 2
አምላክ ይወደናል " "
አይጥለንም ከጁ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 3
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ " "
ቁስሌ ተፈውሷል " "
በቁስልህ በሞትህ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 4
ስሸጥህ አቀፍከኝ " "
ስወጋህ አይኔ በራ " "
በፍቅርህ አወጣኸኝ " "
ከዚያ ከመከራ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ " "
ድል አርገህልኛል " "
የጭንቄን ተራራ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 6
በጉባኤ መሃል " "
አፌ አንተን አወጀ “ ”
ለከከበረ ደምህ " "
ነብሴን ስላወጀ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 7
የድንግሏ ፍሬ አማኑኤል
የብላቴናዋ " "
የቤቴ ምሶሶ " "
የነብሴ ቤዛዋ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 8
መሰረቴ አንተ ነህ " "
ያሳደገኝ እጅህ " "
አተወኝም አንተ " "
ስለሆንኩኝ ልጅህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 1
Fith yetemela " "
Hule leyqrta " "
Kalew fiqr belay " "
Abat leand liju " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 2
Amlak yiwedenal " "
Ayt’lenm keju " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 3
Medhanite libel Amanuel
Dignalew bemoth " "
Qusle tefewswal " "
Bequslh bemoth " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 4
Sishet’h aqefkegn " "
Siwegah ayne bera " "
Befqrh awet’aኸgn " "
Keziya kemekera " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara " "
Dil argehlgnal " "
Yech’nqen terara " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 6
Begubae mehal " "
Afe anten aweje “ ”
Lekekebere demh " "
Nebsen silaweje " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 7
Yednglwa fire Amanuel
Yeblatenawa " "
Yebete misoso " "
Yenebse bezawa " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 8
Meserete ante neh " "
Yasadegegn ejh " "
Atewegnm ante " "
Silehonkugn lijh

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 1
ፊትህ የተመላ " "
ሁሌ ለይቅርታ " "
ካለው ፍቅር በላይ " "
አባት ለአንድ ልጁ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 2
አምላክ ይወደናል " "
አይጥለንም ከጁ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 3
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ " "
ቁስሌ ተፈውሷል " "
በቁስልህ በሞትህ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 4
ስሸጥህ አቀፍከኝ " "
ስወጋህ አይኔ በራ " "
በፍቅርህ አወጣኸኝ " "
ከዚያ ከመከራ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ " "
ድል አርገህልኛል " "
የጭንቄን ተራራ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 6
በጉባኤ መሃል " "
አፌ አንተን አወጀ “ ”
ለከከበረ ደምህ " "
ነብሴን ስላወጀ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 7
የድንግሏ ፍሬ አማኑኤል
የብላቴናዋ " "
የቤቴ ምሶሶ " "
የነብሴ ቤዛዋ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 8
መሰረቴ አንተ ነህ " "
ያሳደገኝ እጅህ " "
አተወኝም አንተ " "
ስለሆንኩኝ ልጅህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "',
        lyrics_transliteration = 'CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 1
Fith yetemela " "
Hule leyqrta " "
Kalew fiqr belay " "
Abat leand liju " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 2
Amlak yiwedenal " "
Ayt’lenm keju " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 3
Medhanite libel Amanuel
Dignalew bemoth " "
Qusle tefewswal " "
Bequslh bemoth " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 4
Sishet’h aqefkegn " "
Siwegah ayne bera " "
Befqrh awet’aኸgn " "
Keziya kemekera " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara " "
Dil argehlgnal " "
Yech’nqen terara " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 6
Begubae mehal " "
Afe anten aweje “ ”
Lekekebere demh " "
Nebsen silaweje " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 7
Yednglwa fire Amanuel
Yeblatenawa " "
Yebete misoso " "
Yenebse bezawa " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 8
Meserete ante neh " "
Yasadegegn ejh " "
Atewegnm ante " "
Silehonkugn lijh

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "',
        updated_at = clock_timestamp()::text
    WHERE import_id = '717a2acf-05f9-4417-809e-1df350be86f3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/

VERSE 1
የምህረት አባት     አማኑኤል
የቸርነት ጌታ            " "
ፊትህ የተመላ          " "
ሁሌ ለይቅርታ         " "
ካለው ፍቅር በላይ    " "
አባት ለአንድ ልጁ    " "
አምላክ ይወደናል     " "
አይጥለንም ከጁ     " "
አዝ-----
መድኃኒቴ ልበል     አማኑኤል
ድኛለው በሞትህ      " "
ቁስሌ ተፈውሷል      " "
በቁስልህ በሞትህ      " "
ስሸጥህ  አቀፍከኝ        " "
ስወጋህ አይኔ በራ       " "
በፍቅርህ አወጣኸኝ     " "
ከዚያ ከመከራ          " "
አዝ-----
አንተ ከኔ ጋር ነህ     አማኑኤል
አዎ ከኔ ጋራ              " "
ድል አርገህልኛል       " "
የጭንቄን ተራራ         " "
በጉባኤ መሃል          " "
አፌ አንተን አወጀ       “ ”

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/

VERSE 2
ለከከበረ ደምህ          " "
ነብሴን ስላወጀ         " "
አዝ-----
የድንግሏ ፍሬ         አማኑኤል
የብላቴናዋ                " "
የቤቴ ምሶሶ              " "
የነብሴ ቤዛዋ            " "
መሰረቴ አንተ ነህ        " "
ያሳደገኝ እጅህ              " "
አተወኝም አንተ           " "
ስለሆንኩኝ ልጅህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
nana emanuel na medhanite
tsdqhn elbseny yqr meraqote//

VERSE 1
yemhret ebat emanuel
yechernet geta " "
fith yetemela " "
hule leyqrta " "
kalew fqr belay " "
ebat leend lju " "
emlak ywedenal " "
eytlenm keju " "
ez-----
medhanite lbel emanuel
dnyalew bemoth " "
qusle tefewl " "
bequslh bemoth " "
ssheth eqefkeny " "
swegah eyne bera " "
befqrh ewetaheny " "
keziya kemekera " "
ez-----
ente kene gar neh emanuel
ewo kene gara " "
dl ergehlnyal " "
yechnqen terara " "
begubae mehal " "
efe enten eweje “ ”

CHORUS
nana emanuel na medhanite
tsdqhn elbseny yqr meraqote//

VERSE 2
lekekebere demh " "
nebsen slaweje " "
ez-----
yedng fre emanuel
yeblatenawa " "
yebete msoso " "
yenebse bezawa " "
meserete ente neh " "
yasadegeny jh " "
etewenym ente " "
slehonkuny ljh

CHORUS
nana emanuel na medhanite
tsdqhn elbseny yqr meraqote//';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '717a2acf-05f9-4417-809e-1df350be86f3'::uuid, 'nana-amanuel-na-medhanite', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nation-of-the-cross ("Nation of The Cross")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b78c7f6c-2d46-43aa-a474-ca23894964f5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 1
As it is written for His sake we’re killed all day long (Romans 8:36)
And we desire to live with Him where we belong
If Christ is magnified in our death then let it be
For He''s the one who died on the cross and set us free

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 2
We fear not those who kill the body but not the soul (Matthew 10:28)
But we fear God, He who can destroy both inside hell
When we live on this earth we know that we will suffer (John 16:33)
But Jesus overcame this world so we will cheer.

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 3
The gates of hell shall not prevail against our nation (Matthew 16:18)
It’s built upon the faith of rock that stays unshaken
We are not strange to witness the life of martyrdom
We know that God will honor their blood in His kingdom

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 1
As it is written for His sake we’re killed all day long (Romans 8:36)
And we desire to live with Him where we belong
If Christ is magnified in our death then let it be
For He''s the one who died on the cross and set us free

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 2
We fear not those who kill the body but not the soul (Matthew 10:28)
But we fear God, He who can destroy both inside hell
When we live on this earth we know that we will suffer (John 16:33)
But Jesus overcame this world so we will cheer.

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 3
The gates of hell shall not prevail against our nation (Matthew 16:18)
It’s built upon the faith of rock that stays unshaken
We are not strange to witness the life of martyrdom
We know that God will honor their blood in His kingdom

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b78c7f6c-2d46-43aa-a474-ca23894964f5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 1
As it is written for His sake we’re killed all day long (Romans 8:36)
And we desire to live with Him where we belong
If Christ is magnified in our death then let it be
For He''s the one who died on the cross and set us free

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 2
We fear not those who kill the body but not the soul (Matthew 10:28)
But we fear God, He who can destroy both inside hell
When we live on this earth we know that we will suffer (John 16:33)
But Jesus overcame this world so we will cheer.

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 3
The gates of hell shall not prevail against our nation (Matthew 16:18)
It’s built upon the faith of rock that stays unshaken
We are not strange to witness the life of martyrdom
We know that God will honor their blood in His kingdom

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b78c7f6c-2d46-43aa-a474-ca23894964f5'::uuid, 'nation-of-the-cross', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kegne-tirisagn ("Kegne Tirisagn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '51a6e811-0c2b-4825-9ee5-a95df7ca610a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Bitaqeb andebete qal keafe sitat’a'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '51a6e811-0c2b-4825-9ee5-a95df7ca610a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ቢታቀብ አንደበቴ ቃል ከአፌ ሲታጣ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '51a6e811-0c2b-4825-9ee5-a95df7ca610a'::uuid, 'kegne-tirisagn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kesetehegn-edime-zemarit-rut-demelash ("Kesetehegn Edime....zemarit Rut Demelash")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '548f602a-ad9d-42a2-8a61-9a87de5bff2a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ትተበደለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Titebedelegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '548f602a-ad9d-42a2-8a61-9a87de5bff2a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ትተበደለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '548f602a-ad9d-42a2-8a61-9a87de5bff2a'::uuid, 'kesetehegn-edime-zemarit-rut-demelash', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nisebiho ("Nisebiho")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '39b712e7-f353-4701-9a6f-028176c8762c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንሴብሖ /2/
ንሴብሖ ለእግዚአብሔር ስቡሕ ዘተሰብሐ

VERSE 1
እናመስግነው /2/
እግዚአብሔርን ምስጉን ነው የተመሰገነ /2/

CHORUS
ንሴብሖ /2/
ንሴብሖ ለእግዚአብሔር ስቡሕ ዘተሰብሐ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nisebiho /2/
Nisebiho le’Egziabher Sibuh zetesebiha

VERSE 1
Enamesginew /2/
Egziabherin Misgun new yetemesegene /2/

CHORUS
Nisebiho /2/
Nisebiho le’Egziabher Sibuh zetesebiha'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ንሴብሖ /2/
ንሴብሖ ለእግዚአብሔር ስቡሕ ዘተሰብሐ

VERSE 1
እናመስግነው /2/
እግዚአብሔርን ምስጉን ነው የተመሰገነ /2/

CHORUS
ንሴብሖ /2/
ንሴብሖ ለእግዚአብሔር ስቡሕ ዘተሰብሐ',
        lyrics_transliteration = 'CHORUS
Nisebiho /2/
Nisebiho le’Egziabher Sibuh zetesebiha

VERSE 1
Enamesginew /2/
Egziabherin Misgun new yetemesegene /2/

CHORUS
Nisebiho /2/
Nisebiho le’Egziabher Sibuh zetesebiha',
        updated_at = clock_timestamp()::text
    WHERE import_id = '39b712e7-f353-4701-9a6f-028176c8762c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንሴብሖ /2/
ንሴብሖ ለእግዚአብሔር ስቡሕ ዘተሰብሐ

VERSE 1
እናመስግነው /2/
እግዚአብሔርን ምስጉን ነው የተመሰገነ /2/

CHORUS
ንሴብሖ /2/
ንሴብሖ ለእግዚአብሔር ስቡሕ ዘተሰብሐ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nisebiho /2/
Nisebiho le’Egziabher Sibuh zetesebiha

VERSE 1
Enamesginew /2/
Egziabherin Misgun new yetemesegene /2/

CHORUS
Nisebiho /2/
Nisebiho le’Egziabher Sibuh zetesebiha';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '39b712e7-f353-4701-9a6f-028176c8762c'::uuid, 'nisebiho', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- o-my-savior-i-can-do-all-through-you ("O My Savior I Can Do All Through You")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '11901406-df28-4af7-8d9c-aa86dd6870d8'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters,  my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 5
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 6
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 7
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 8
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 9
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 10
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu kal seenager teraraw medanew
Medhanialem yelem yemesanew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters,  my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 5
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 6
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 7
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 8
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 9
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 10
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You',
        lyrics_transliteration = 'Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu kal seenager teraraw medanew
Medhanialem yelem yemesanew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '11901406-df28-4af7-8d9c-aa86dd6870d8'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters,  my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 5
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 6
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 7
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 8
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 9
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 10
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu kal seenager teraraw medanew
Medhanialem yelem yemesanew';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '11901406-df28-4af7-8d9c-aa86dd6870d8'::uuid, 'o-my-savior-i-can-do-all-through-you', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nu-be-egziabher-des-yibelen ("Nu BeEgziabher Des Yibelen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '57e80a87-f789-47c1-b61b-432453eba6aa'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 1
ኑ በእግዚአብሔር ኑ በድንግል ደስ ይበለን/2/
የሰማዩን መንግስት እርስቱን ለሰጠን
ከጨለማ አውጥቶ ብርሃንን ላሳየን

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 2
ለዚህ ድንቅ ውለታው ምስጋና ያንሰዋል
በእርሱ ደስ ይበለን ክብር ይገባዋል

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 3
ከአለት ላይ የፈለቀ ውሃ ጠጥተናል
ሰማያዊ መና አምላክ መግቦናል

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 4
ፍቅርህ የበዛልህ ምን ልክፈልህ ጌታ
ስምህን ላመስግነው ከጠዋት እስከማታ

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 5
በቃዴስ በረሃ ምንም በሌለበት
በኤርትራ ባህር ወጀብ በበዛጀት

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 6
ለእርሱ መንገድ አለው ከቶ ምን ተስኖት
ልባችሁ አይፍራ በፍጹም እመኑት

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 7
በባርነት ሳለን በድቅድቅ ዓለም
ብርሃንን አገኘን በድንግል ማርያም

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 8
ያጣነውን ሰላም ዛሬ አገኘን
እጅግ ደስ ይበለን በእመቤታችን

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 9
የሐና የእያቄም የእምነታቸው ፍሬ

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 1
Nu beEgziabher nu bedingil des yibelen (x2)
Yesemayun mengist irstun leseten
Kechelema awt’o birhanen lasayen

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 2
Lezih dinq wuletaw misgana yansawal
Be’ersu des yibelen kibir yigebawal

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 3
Ke’alet lay yefeleqe wuha t’etenal
Semayawi mena Amlak megbonal

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 4
Fiqirh yezalh min likfelh geta
Simhin lamesgnew ket’wat eskemata

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 5
Beqades bereha minim belelebet
Be’ertra bahir wej’eb bebazajet

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 6
Le’ersu menged alew keto min tesnot
Libachihu ayifra befits’um emenut

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 7
Bebarnet salén bedikdik alem
Birhanen agenen bedingil Maryam

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 8
Yat’anewn selam zare agenen
Ijig des yibelen be’emebetachin

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 9
YeHana YeIyaqem ye’emenetachew firé

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 1
ኑ በእግዚአብሔር ኑ በድንግል ደስ ይበለን/2/
የሰማዩን መንግስት እርስቱን ለሰጠን
ከጨለማ አውጥቶ ብርሃንን ላሳየን

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 2
ለዚህ ድንቅ ውለታው ምስጋና ያንሰዋል
በእርሱ ደስ ይበለን ክብር ይገባዋል

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 3
ከአለት ላይ የፈለቀ ውሃ ጠጥተናል
ሰማያዊ መና አምላክ መግቦናል

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 4
ፍቅርህ የበዛልህ ምን ልክፈልህ ጌታ
ስምህን ላመስግነው ከጠዋት እስከማታ

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 5
በቃዴስ በረሃ ምንም በሌለበት
በኤርትራ ባህር ወጀብ በበዛጀት

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 6
ለእርሱ መንገድ አለው ከቶ ምን ተስኖት
ልባችሁ አይፍራ በፍጹም እመኑት

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 7
በባርነት ሳለን በድቅድቅ ዓለም
ብርሃንን አገኘን በድንግል ማርያም

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 8
ያጣነውን ሰላም ዛሬ አገኘን
እጅግ ደስ ይበለን በእመቤታችን

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 9
የሐና የእያቄም የእምነታቸው ፍሬ

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን',
        lyrics_transliteration = 'CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 1
Nu beEgziabher nu bedingil des yibelen (x2)
Yesemayun mengist irstun leseten
Kechelema awt’o birhanen lasayen

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 2
Lezih dinq wuletaw misgana yansawal
Be’ersu des yibelen kibir yigebawal

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 3
Ke’alet lay yefeleqe wuha t’etenal
Semayawi mena Amlak megbonal

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 4
Fiqirh yezalh min likfelh geta
Simhin lamesgnew ket’wat eskemata

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 5
Beqades bereha minim belelebet
Be’ertra bahir wej’eb bebazajet

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 6
Le’ersu menged alew keto min tesnot
Libachihu ayifra befits’um emenut

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 7
Bebarnet salén bedikdik alem
Birhanen agenen bedingil Maryam

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 8
Yat’anewn selam zare agenen
Ijig des yibelen be’emebetachin

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 9
YeHana YeIyaqem ye’emenetachew firé

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren',
        updated_at = clock_timestamp()::text
    WHERE import_id = '57e80a87-f789-47c1-b61b-432453eba6aa'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 1
ኑ በእግዚአብሔር ኑ በድንግል ደስ ይበለን/2/
የሰማዩን መንግስት እርስቱን ለሰጠን
ከጨለማ አውጥቶ ብርሃንን ላሳየን

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 2
ለዚህ ድንቅ ውለታው ምስጋና ያንሰዋል
በእርሱ ደስ ይበለን ክብር ይገባዋል

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 3
ከአለት ላይ የፈለቀ ውሃ ጠጥተናል
ሰማያዊ መና አምላክ መግቦናል

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 4
ፍቅርህ የበዛልህ ምን ልክፈልህ ጌታ
ስምህን ላመስግነው ከጠዋት እስከማታ

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 5
በቃዴስ በረሃ ምንም በሌለበት
በኤርትራ ባህር ወጀብ በበዛጀት

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 6
ለእርሱ መንገድ አለው ከቶ ምን ተስኖት
ልባችሁ አይፍራ በፍጹም እመኑት

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 7
በባርነት ሳለን በድቅድቅ ዓለም
ብርሃንን አገኘን በድንግል ማርያም

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 8
ያጣነውን ሰላም ዛሬ አገኘን
እጅግ ደስ ይበለን በእመቤታችን

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 9
የሐና የእያቄም የእምነታቸው ፍሬ

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 1
Nu beEgziabher nu bedingil des yibelen (x2)
Yesemayun mengist irstun leseten
Kechelema awt’o birhanen lasayen

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 2
Lezih dinq wuletaw misgana yansawal
Be’ersu des yibelen kibir yigebawal

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 3
Ke’alet lay yefeleqe wuha t’etenal
Semayawi mena Amlak megbonal

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 4
Fiqirh yezalh min likfelh geta
Simhin lamesgnew ket’wat eskemata

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 5
Beqades bereha minim belelebet
Be’ertra bahir wej’eb bebazajet

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 6
Le’ersu menged alew keto min tesnot
Libachihu ayifra befits’um emenut

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 7
Bebarnet salén bedikdik alem
Birhanen agenen bedingil Maryam

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 8
Yat’anewn selam zare agenen
Ijig des yibelen be’emebetachin

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 9
YeHana YeIyaqem ye’emenetachew firé

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '57e80a87-f789-47c1-b61b-432453eba6aa'::uuid, 'nu-be-egziabher-des-yibelen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nu-enamesegen-bezimare ("Nu Enamesegen Bezimare Be'ililta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a5d4146e-f959-47ed-9982-9a363e1bb51b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 1
ጨለማው ኑሮ የስደት ሕይወት
በእግዚአብሔር ፍቅር ብርሃን በራበት
ባርነት ቀርቶ ነፃነት ወጣን
ልመናችንን እግዚአብሔር ሰማን

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 2
መሰናክሉን ክፉውን ፈተና
አልፈነው መጣን በአምላክ ጐዳና
አምላክ ከእኛ ጋር ስለነበረ
ዲያብሎስ አፍሮ ተዋርዶ ቀረ

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 3
የሚያስጨንቀን ዛሬ ተፈታ
የሕዝቡን እንባ አበሰ ጌታ
በምሕረቱ ስለጎበኘን
አምላካችንን ኑ እናመስግን

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 1
chelemaw nuro yesdet hywet
begziebher fqr brhan berabet
barnet qerto netsanet wetan
lmenachnn gziebher seman

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 2
mesenaklun kfuwn fetena
elfenew metan beemlak dana
emlak kenya gar slenebere
diyablos efro tewardo qere

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 3
yemiyaschenqen zare tefeta
yehzbun nba ebese geta
bemhretu slegobenyen
emlakachnn nu namesgn

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 1
ጨለማው ኑሮ የስደት ሕይወት
በእግዚአብሔር ፍቅር ብርሃን በራበት
ባርነት ቀርቶ ነፃነት ወጣን
ልመናችንን እግዚአብሔር ሰማን

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 2
መሰናክሉን ክፉውን ፈተና
አልፈነው መጣን በአምላክ ጐዳና
አምላክ ከእኛ ጋር ስለነበረ
ዲያብሎስ አፍሮ ተዋርዶ ቀረ

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 3
የሚያስጨንቀን ዛሬ ተፈታ
የሕዝቡን እንባ አበሰ ጌታ
በምሕረቱ ስለጎበኘን
አምላካችንን ኑ እናመስግን

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/',
        lyrics_transliteration = 'CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 1
chelemaw nuro yesdet hywet
begziebher fqr brhan berabet
barnet qerto netsanet wetan
lmenachnn gziebher seman

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 2
mesenaklun kfuwn fetena
elfenew metan beemlak dana
emlak kenya gar slenebere
diyablos efro tewardo qere

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 3
yemiyaschenqen zare tefeta
yehzbun nba ebese geta
bemhretu slegobenyen
emlakachnn nu namesgn

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a5d4146e-f959-47ed-9982-9a363e1bb51b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 1
ጨለማው ኑሮ የስደት ሕይወት
በእግዚአብሔር ፍቅር ብርሃን በራበት
ባርነት ቀርቶ ነፃነት ወጣን
ልመናችንን እግዚአብሔር ሰማን

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 2
መሰናክሉን ክፉውን ፈተና
አልፈነው መጣን በአምላክ ጐዳና
አምላክ ከእኛ ጋር ስለነበረ
ዲያብሎስ አፍሮ ተዋርዶ ቀረ

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 3
የሚያስጨንቀን ዛሬ ተፈታ
የሕዝቡን እንባ አበሰ ጌታ
በምሕረቱ ስለጎበኘን
አምላካችንን ኑ እናመስግን

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 1
chelemaw nuro yesdet hywet
begziebher fqr brhan berabet
barnet qerto netsanet wetan
lmenachnn gziebher seman

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 2
mesenaklun kfuwn fetena
elfenew metan beemlak dana
emlak kenya gar slenebere
diyablos efro tewardo qere

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 3
yemiyaschenqen zare tefeta
yehzbun nba ebese geta
bemhretu slegobenyen
emlakachnn nu namesgn

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a5d4146e-f959-47ed-9982-9a363e1bb51b'::uuid, 'nu-enamesegen-bezimare', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- like-mezemiran-kinetibeb-w-kirkos ("Like Mezemiran Kinetibeb W: Kirkos")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '52eb35a4-5302-4f69-84a2-52bd7e5a70ff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 1
ትውልዱ ተመታ በታላቅ በሽታ (2)
እረ በልክ ይሁን ጭፈራ እና ደስታ (2)
በማዕበል በጎርፍ እያየን ሲቀጣ (2)
አሁንም ተመለስ የከፋ ሳይመጣ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 2
አሁንም ተመለስ የባሰ ሳይመጣ
ተው አለም ተመለስ
ነነዌ ሊያጠፋ የወረደው እሳት (2)
አንተን እንዳይመታህ ተነሳ ለጸሎት (2)

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 3
አለም ብትሰጥህ አንተ እንድትተጋ (2)
ኃልዎተ እግዚአብሔር እንድምን ይዘንጋ (2)
ተው አለም ተመለስ
ችግር ለበዛበት እጅግ ለታወከ (2)

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 4
አምላክ መሃሪ ነው ለተንበረከ(2)
የአለም መድኃኒት የአለምን ቤዛ (2)
ጠይቀው ምህረትን ሰው ሆይ ልብ ግዛ (2)
ተው አለም ተመለስ ተው አለም ተገታ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 5
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 1
Tiwldu temeta betalaq beshta (2)
Ere belk yihun ch’fera ena desta (2)
Bemaebel begorf eyayen siqet’a (2)
Ahunm temeles yekefa saymet’a

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 2
Ahunm temeles yebase saymet’a
Tew alem temeles
Nenewe liyat’efa yeweredew esat (2)
Anten endaymetah tenesa lets’elot (2)

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 3
Alem bitset’h ante endttega (2)
Halwote Egziabher endmn yizenga (2)
Tew alem temeles
Chgr lebezabet ejg letaweke (2)

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 4
Amlak mehari new letenbereke (2)
Yealem medhanit yealemn beza (2)
T’eyqew mihretn sew hoy lib giza (2)
Tew alem temeles tew alem tegeta

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 5
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 1
ትውልዱ ተመታ በታላቅ በሽታ (2)
እረ በልክ ይሁን ጭፈራ እና ደስታ (2)
በማዕበል በጎርፍ እያየን ሲቀጣ (2)
አሁንም ተመለስ የከፋ ሳይመጣ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 2
አሁንም ተመለስ የባሰ ሳይመጣ
ተው አለም ተመለስ
ነነዌ ሊያጠፋ የወረደው እሳት (2)
አንተን እንዳይመታህ ተነሳ ለጸሎት (2)

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 3
አለም ብትሰጥህ አንተ እንድትተጋ (2)
ኃልዎተ እግዚአብሔር እንድምን ይዘንጋ (2)
ተው አለም ተመለስ
ችግር ለበዛበት እጅግ ለታወከ (2)

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 4
አምላክ መሃሪ ነው ለተንበረከ(2)
የአለም መድኃኒት የአለምን ቤዛ (2)
ጠይቀው ምህረትን ሰው ሆይ ልብ ግዛ (2)
ተው አለም ተመለስ ተው አለም ተገታ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 5
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ',
        lyrics_transliteration = 'CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 1
Tiwldu temeta betalaq beshta (2)
Ere belk yihun ch’fera ena desta (2)
Bemaebel begorf eyayen siqet’a (2)
Ahunm temeles yekefa saymet’a

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 2
Ahunm temeles yebase saymet’a
Tew alem temeles
Nenewe liyat’efa yeweredew esat (2)
Anten endaymetah tenesa lets’elot (2)

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 3
Alem bitset’h ante endttega (2)
Halwote Egziabher endmn yizenga (2)
Tew alem temeles
Chgr lebezabet ejg letaweke (2)

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 4
Amlak mehari new letenbereke (2)
Yealem medhanit yealemn beza (2)
T’eyqew mihretn sew hoy lib giza (2)
Tew alem temeles tew alem tegeta

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 5
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '52eb35a4-5302-4f69-84a2-52bd7e5a70ff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 1
ትውልዱ ተመታ በታላቅ በሽታ (2)
እረ በልክ ይሁን ጭፈራ እና ደስታ (2)
በማዕበል በጎርፍ እያየን ሲቀጣ (2)
አሁንም ተመለስ የከፋ ሳይመጣ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 2
አሁንም ተመለስ የባሰ ሳይመጣ
ተው አለም ተመለስ
ነነዌ ሊያጠፋ የወረደው እሳት (2)
አንተን እንዳይመታህ ተነሳ ለጸሎት (2)

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 3
አለም ብትሰጥህ አንተ እንድትተጋ (2)
ኃልዎተ እግዚአብሔር እንድምን ይዘንጋ (2)
ተው አለም ተመለስ
ችግር ለበዛበት እጅግ ለታወከ (2)

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 4
አምላክ መሃሪ ነው ለተንበረከ(2)
የአለም መድኃኒት የአለምን ቤዛ (2)
ጠይቀው ምህረትን ሰው ሆይ ልብ ግዛ (2)
ተው አለም ተመለስ ተው አለም ተገታ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 5
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '52eb35a4-5302-4f69-84a2-52bd7e5a70ff'::uuid, 'like-mezemiran-kinetibeb-w-kirkos', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- oh-all-that-you-have-done-for-me ("Oh All That You Have Done For Me")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f3ce10e1-cd9e-4d53-b857-4d58f78d16dd'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 1
The day that became night drowned by the darkness
Suffering through the marsh that took me under it
When I had thought I lost the ones supporting me
He truly stowed away my troubles endlessly

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 2
Our Lord and our strength our glory and power
Humiliated them with faith my wrongdoers
That you won’t forsake me finally I know truth
Above worldly calling I’ve committed to you

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 3
Few became abundant You fed the multitudes
To show my gratitude enough I can’t give you
Through the days and the nights, the one that shines the light
Glorious it all is your works and all Your might

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 4
Deserving you are for praise and admiration
For the humble of heart blessings, you have given
Impoverished I am not you are my fortune
My life is filled by you never again barren

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 1
The day that became night drowned by the darkness
Suffering through the marsh that took me under it
When I had thought I lost the ones supporting me
He truly stowed away my troubles endlessly

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 2
Our Lord and our strength our glory and power
Humiliated them with faith my wrongdoers
That you won’t forsake me finally I know truth
Above worldly calling I’ve committed to you

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 3
Few became abundant You fed the multitudes
To show my gratitude enough I can’t give you
Through the days and the nights, the one that shines the light
Glorious it all is your works and all Your might

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 4
Deserving you are for praise and admiration
For the humble of heart blessings, you have given
Impoverished I am not you are my fortune
My life is filled by you never again barren

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f3ce10e1-cd9e-4d53-b857-4d58f78d16dd'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 1
The day that became night drowned by the darkness
Suffering through the marsh that took me under it
When I had thought I lost the ones supporting me
He truly stowed away my troubles endlessly

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 2
Our Lord and our strength our glory and power
Humiliated them with faith my wrongdoers
That you won’t forsake me finally I know truth
Above worldly calling I’ve committed to you

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 3
Few became abundant You fed the multitudes
To show my gratitude enough I can’t give you
Through the days and the nights, the one that shines the light
Glorious it all is your works and all Your might

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 4
Deserving you are for praise and admiration
For the humble of heart blessings, you have given
Impoverished I am not you are my fortune
My life is filled by you never again barren

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f3ce10e1-cd9e-4d53-b857-4d58f78d16dd'::uuid, 'oh-all-that-you-have-done-for-me', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mar-michael ("Mar Michael")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '540f650b-dab7-4c84-b5dd-41e8d9ae3c06'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 1
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ
ባህሩን ክፈለው በደረቅ እዳልፈው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 2
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 3
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ
በሞቱ ቀጠሮ ሠርግ የደገስክለት

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 4
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው
ረዳኤ ምንዱባን በስደት ደጋፊ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 5
ከክፉ ከልለህ በድል አሳላፊ
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 6
ያን የሰማነውን ዛሬ ሆኖ አየነው
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን
ከእንቅልፌ ያነቃኛል የደጅህ ደውል

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 7
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 8
መውደዴ እውነት ነው በምልጃህ ተርፌ።

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 1
Endts’ena awqalehu kefite sitqedm
Fits’ameye endiyamr endiwab bebeth
Abertagn liberta ats’nagn lits’na lijh
Bahrun kifelew bedereq edalfew

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 2
Endalfera abertagn ejen beejh yazew
Keenqlfe yaneqagnal yedejh dewl
Belelit met’che beth edwl
Behedkubet hulu kafe atnet’elm

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 3
Yemar welela new Mikael yante sim
Mar Mikael silh mar mar alew afe
Mewdede ewnet new bemljah terfe
Bemotu qet’ero serg yedegesklet

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 4
Mina bahran sitaterfew kemot
Zarem tamrhn tidgnahn aytew
Bizuwoch yiluhel Mikael mut ansaw
Redae minduban besdet degafi

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 5
Kekfu kelleh bedl asalafi
Aletun keflehw bebetre mesqel
Kech’nch’aw set’eኸn marna ts’ebel
Qedmo leesrael yane endaderekew

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 6
Yan yesemanewn zare hono ayenew
Yebrhanun amd fana teketlen
Keqdusan sifra zajrmael deresn
Keenqlfe yaneqagnal yedejh dewl

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 7
Belelit met’che beth edwl
Behedkubet hulu kafe atnet’elm
Yemar welela new Mikael yante sim
Mar Mikael silh mar mar alew afe

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 8
Mewdede ewnet new bemljah terfe.

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 1
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ
ባህሩን ክፈለው በደረቅ እዳልፈው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 2
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 3
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ
በሞቱ ቀጠሮ ሠርግ የደገስክለት

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 4
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው
ረዳኤ ምንዱባን በስደት ደጋፊ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 5
ከክፉ ከልለህ በድል አሳላፊ
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 6
ያን የሰማነውን ዛሬ ሆኖ አየነው
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን
ከእንቅልፌ ያነቃኛል የደጅህ ደውል

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 7
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 8
መውደዴ እውነት ነው በምልጃህ ተርፌ።

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም',
        lyrics_transliteration = 'CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 1
Endts’ena awqalehu kefite sitqedm
Fits’ameye endiyamr endiwab bebeth
Abertagn liberta ats’nagn lits’na lijh
Bahrun kifelew bedereq edalfew

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 2
Endalfera abertagn ejen beejh yazew
Keenqlfe yaneqagnal yedejh dewl
Belelit met’che beth edwl
Behedkubet hulu kafe atnet’elm

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 3
Yemar welela new Mikael yante sim
Mar Mikael silh mar mar alew afe
Mewdede ewnet new bemljah terfe
Bemotu qet’ero serg yedegesklet

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 4
Mina bahran sitaterfew kemot
Zarem tamrhn tidgnahn aytew
Bizuwoch yiluhel Mikael mut ansaw
Redae minduban besdet degafi

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 5
Kekfu kelleh bedl asalafi
Aletun keflehw bebetre mesqel
Kech’nch’aw set’eኸn marna ts’ebel
Qedmo leesrael yane endaderekew

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 6
Yan yesemanewn zare hono ayenew
Yebrhanun amd fana teketlen
Keqdusan sifra zajrmael deresn
Keenqlfe yaneqagnal yedejh dewl

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 7
Belelit met’che beth edwl
Behedkubet hulu kafe atnet’elm
Yemar welela new Mikael yante sim
Mar Mikael silh mar mar alew afe

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 8
Mewdede ewnet new bemljah terfe.

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm',
        updated_at = clock_timestamp()::text
    WHERE import_id = '540f650b-dab7-4c84-b5dd-41e8d9ae3c06'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 1
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ
ባህሩን ክፈለው በደረቅ እዳልፈው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 2
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 3
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ
በሞቱ ቀጠሮ ሠርግ የደገስክለት

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 4
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው
ረዳኤ ምንዱባን በስደት ደጋፊ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 5
ከክፉ ከልለህ በድል አሳላፊ
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 6
ያን የሰማነውን ዛሬ ሆኖ አየነው
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን
ከእንቅልፌ ያነቃኛል የደጅህ ደውል

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 7
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 8
መውደዴ እውነት ነው በምልጃህ ተርፌ።

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '540f650b-dab7-4c84-b5dd-41e8d9ae3c06'::uuid, 'mar-michael', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- quanqaye-nesh-dingil ("Quanqaye Nesh Dingil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '911a4f0c-9d03-4426-ba02-a1eff36ca763'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 1
ባንቺ ቀርቤአለሁ ከአምላኬ ፊት
ቤቴ ሞልቶልኛል በበረከት /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 2
በምን ስራዬ ነው በፊቱ የቆምኩት
መቼ በቅቼ ነው ስሙን የጠራሁት
አስታራቂ እናት አንቺን ስለሰጠኝ
ስለ ቃል ኪዳንሽ አቤት ልጄ በይኝ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 3
ቅድስና ሕይወት ከኔ ተሰውሮ
በውሸት በሃሜት አንደበቴ ታስሮ
በእመ አምላክ ፍቅር አዲስ ሰው ሆኛለሁ
እንደ መላእክቱ ይኸው እዘምራለሁ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 4
ስለ እማምላክ ብሎ ያፈረ የለም
ባንቺ ያልከበረ ሰው አይገኝም
እንደ ባለማዕረግ እኔም ሰው መባሌ
አንቺን አግኝቼ ነው ድንግል መሰላሌ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 5
ሰላም ለኪ ብዬ ስጀምር ሰላምታን
ሐሴት ይሞላዋል መላው ሰውነቴን
እንደ ቅዱስ ኤፍሬም በምስጋናሽ ልጽና
በእጆችሽ ያለው አምላኬ ነውና /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 1
Banchi qerbéalehu keAmlaké fit
Beté moltolignal bebereket (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 2
Bemin sirayé new befitu yeqomkut
Meche beqché new simun yet’arahut
Astaraki enat anchin silesetegn
Sile qal kidanish abet lijé beyign (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 3
Qid’sina hiywet kené tesewro
Bewushet behamet andebeté tasro
BeEme Amlak fiqir adis sew honalew
Ende mela’iktu yih’ew ezemiralew (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 4
Sile Emamlak blo yaferé yelem
Banchi yalkebere sew ayigenim
Ende balema’ereg enem sew mebalé
Anchin agniche new dingil meselalé (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 5
Selam leki biye s’jemir selamtan
Haset yimolawal melaw sewineten
Ende Kidus Efrem bemisganash lits’na
Be’ijochish yalew Amlaké newna (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 1
ባንቺ ቀርቤአለሁ ከአምላኬ ፊት
ቤቴ ሞልቶልኛል በበረከት /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 2
በምን ስራዬ ነው በፊቱ የቆምኩት
መቼ በቅቼ ነው ስሙን የጠራሁት
አስታራቂ እናት አንቺን ስለሰጠኝ
ስለ ቃል ኪዳንሽ አቤት ልጄ በይኝ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 3
ቅድስና ሕይወት ከኔ ተሰውሮ
በውሸት በሃሜት አንደበቴ ታስሮ
በእመ አምላክ ፍቅር አዲስ ሰው ሆኛለሁ
እንደ መላእክቱ ይኸው እዘምራለሁ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 4
ስለ እማምላክ ብሎ ያፈረ የለም
ባንቺ ያልከበረ ሰው አይገኝም
እንደ ባለማዕረግ እኔም ሰው መባሌ
አንቺን አግኝቼ ነው ድንግል መሰላሌ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 5
ሰላም ለኪ ብዬ ስጀምር ሰላምታን
ሐሴት ይሞላዋል መላው ሰውነቴን
እንደ ቅዱስ ኤፍሬም በምስጋናሽ ልጽና
በእጆችሽ ያለው አምላኬ ነውና /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/',
        lyrics_transliteration = 'CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 1
Banchi qerbéalehu keAmlaké fit
Beté moltolignal bebereket (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 2
Bemin sirayé new befitu yeqomkut
Meche beqché new simun yet’arahut
Astaraki enat anchin silesetegn
Sile qal kidanish abet lijé beyign (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 3
Qid’sina hiywet kené tesewro
Bewushet behamet andebeté tasro
BeEme Amlak fiqir adis sew honalew
Ende mela’iktu yih’ew ezemiralew (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 4
Sile Emamlak blo yaferé yelem
Banchi yalkebere sew ayigenim
Ende balema’ereg enem sew mebalé
Anchin agniche new dingil meselalé (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 5
Selam leki biye s’jemir selamtan
Haset yimolawal melaw sewineten
Ende Kidus Efrem bemisganash lits’na
Be’ijochish yalew Amlaké newna (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '911a4f0c-9d03-4426-ba02-a1eff36ca763'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 1
ባንቺ ቀርቤአለሁ ከአምላኬ ፊት
ቤቴ ሞልቶልኛል በበረከት /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 2
በምን ስራዬ ነው በፊቱ የቆምኩት
መቼ በቅቼ ነው ስሙን የጠራሁት
አስታራቂ እናት አንቺን ስለሰጠኝ
ስለ ቃል ኪዳንሽ አቤት ልጄ በይኝ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 3
ቅድስና ሕይወት ከኔ ተሰውሮ
በውሸት በሃሜት አንደበቴ ታስሮ
በእመ አምላክ ፍቅር አዲስ ሰው ሆኛለሁ
እንደ መላእክቱ ይኸው እዘምራለሁ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 4
ስለ እማምላክ ብሎ ያፈረ የለም
ባንቺ ያልከበረ ሰው አይገኝም
እንደ ባለማዕረግ እኔም ሰው መባሌ
አንቺን አግኝቼ ነው ድንግል መሰላሌ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 5
ሰላም ለኪ ብዬ ስጀምር ሰላምታን
ሐሴት ይሞላዋል መላው ሰውነቴን
እንደ ቅዱስ ኤፍሬም በምስጋናሽ ልጽና
በእጆችሽ ያለው አምላኬ ነውና /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 1
Banchi qerbéalehu keAmlaké fit
Beté moltolignal bebereket (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 2
Bemin sirayé new befitu yeqomkut
Meche beqché new simun yet’arahut
Astaraki enat anchin silesetegn
Sile qal kidanish abet lijé beyign (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 3
Qid’sina hiywet kené tesewro
Bewushet behamet andebeté tasro
BeEme Amlak fiqir adis sew honalew
Ende mela’iktu yih’ew ezemiralew (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 4
Sile Emamlak blo yaferé yelem
Banchi yalkebere sew ayigenim
Ende balema’ereg enem sew mebalé
Anchin agniche new dingil meselalé (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 5
Selam leki biye s’jemir selamtan
Haset yimolawal melaw sewineten
Ende Kidus Efrem bemisganash lits’na
Be’ijochish yalew Amlaké newna (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '911a4f0c-9d03-4426-ba02-a1eff36ca763'::uuid, 'quanqaye-nesh-dingil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sebhiwo-leamlakine ("Sebhiwo Le’amlakine")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ae92cbfe-c25f-4c62-9dd3-c73bb1fa33fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 1
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 2
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 3
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 4
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 5
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 6
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 7
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 8
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 1
Semayun yal’mesoso atsentwal be-qalu
Meret’n be-wuhoch mehal mesertwal be-dinberun
Yitayal yaberal Geta zarem be-siraw
Misgun new serawit hulu ya-mesegenew

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 2
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 3
Mihretu yiqirtaw bizu kewesen yesefa
Abat new birtu metegiya ye-sew lijoch tesfa
Megabi le-fitret alem talaq bale-tsega
Yabibal yilemlemal ersun yetetega

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 4
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 5
Temesgen temesgen yilal yetegobenye sew
Ketifat kegusqulna kemot yemelesew
Yiqebal ketach ansito kerenyet bota
Yiqirtaw tsegaw bizu new mihretu ye-Geta

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 6
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 7
Mela’ekt belay be-semay yizemiruletal
Dawit’m kebegenaw gar be-qine tenestwal
Be-midirm igna lijochu enbel Nesebho
Yigebal le-Amlake Israel widase amliko

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 8
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 1
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 2
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 3
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 4
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 5
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 6
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 7
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 8
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/',
        lyrics_transliteration = 'CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 1
Semayun yal’mesoso atsentwal be-qalu
Meret’n be-wuhoch mehal mesertwal be-dinberun
Yitayal yaberal Geta zarem be-siraw
Misgun new serawit hulu ya-mesegenew

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 2
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 3
Mihretu yiqirtaw bizu kewesen yesefa
Abat new birtu metegiya ye-sew lijoch tesfa
Megabi le-fitret alem talaq bale-tsega
Yabibal yilemlemal ersun yetetega

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 4
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 5
Temesgen temesgen yilal yetegobenye sew
Ketifat kegusqulna kemot yemelesew
Yiqebal ketach ansito kerenyet bota
Yiqirtaw tsegaw bizu new mihretu ye-Geta

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 6
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 7
Mela’ekt belay be-semay yizemiruletal
Dawit’m kebegenaw gar be-qine tenestwal
Be-midirm igna lijochu enbel Nesebho
Yigebal le-Amlake Israel widase amliko

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 8
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ae92cbfe-c25f-4c62-9dd3-c73bb1fa33fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 1
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 2
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 3
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 4
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 5
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 6
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 7
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 8
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 1
Semayun yal’mesoso atsentwal be-qalu
Meret’n be-wuhoch mehal mesertwal be-dinberun
Yitayal yaberal Geta zarem be-siraw
Misgun new serawit hulu ya-mesegenew

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 2
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 3
Mihretu yiqirtaw bizu kewesen yesefa
Abat new birtu metegiya ye-sew lijoch tesfa
Megabi le-fitret alem talaq bale-tsega
Yabibal yilemlemal ersun yetetega

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 4
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 5
Temesgen temesgen yilal yetegobenye sew
Ketifat kegusqulna kemot yemelesew
Yiqebal ketach ansito kerenyet bota
Yiqirtaw tsegaw bizu new mihretu ye-Geta

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 6
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 7
Mela’ekt belay be-semay yizemiruletal
Dawit’m kebegenaw gar be-qine tenestwal
Be-midirm igna lijochu enbel Nesebho
Yigebal le-Amlake Israel widase amliko

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 8
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ae92cbfe-c25f-4c62-9dd3-c73bb1fa33fc'::uuid, 'sebhiwo-leamlakine', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- saint-mary-has-ascended ("Saint Mary Has Ascended")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd7bb2a53-49b1-4acd-8607-2097aa465914'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 1
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 2
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 3
To honor the prophecy, her father David told
To stand at the Lords right, wearing clothes of fine Gold
Our mother ascended, with glory honor praise
Through the seven heavens, where her Lord and Son dwells

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 4
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 5
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 6
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 7
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 8
Let the heavens open, and let clouds bear witness
No one must be silent, when the Virgin ascends
Let’s all venerate the mother of compassion
Unites us with her son, through her intercession

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 9
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 10
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 11
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 12
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 13
Your holy flesh that the, Lord has taken from thee
Your holy and pure hands , carried divinity
You are raised by your son, from the firm grasp of death
You are raised with honor, we have seen it through faith

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 14
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 15
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 16
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 17
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 18
Rejoice all apostles, our holy fathers
The Lord has ascended, St Mary your mother
Take her linens with you, go tell to the nations
Speak how she has risen, with fervent devotion

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 19
Aregalech Mariam tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 20
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 21
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 22
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Mariam aregalech wede Genet
Yesemay melaikt eyaregaguwat
Esuwam ende lijwa tenestalech'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 1
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 2
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 3
To honor the prophecy, her father David told
To stand at the Lords right, wearing clothes of fine Gold
Our mother ascended, with glory honor praise
Through the seven heavens, where her Lord and Son dwells

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 4
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 5
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 6
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 7
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 8
Let the heavens open, and let clouds bear witness
No one must be silent, when the Virgin ascends
Let’s all venerate the mother of compassion
Unites us with her son, through her intercession

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 9
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 10
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 11
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 12
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 13
Your holy flesh that the, Lord has taken from thee
Your holy and pure hands , carried divinity
You are raised by your son, from the firm grasp of death
You are raised with honor, we have seen it through faith

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 14
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 15
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 16
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 17
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 18
Rejoice all apostles, our holy fathers
The Lord has ascended, St Mary your mother
Take her linens with you, go tell to the nations
Speak how she has risen, with fervent devotion

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 19
Aregalech Mariam tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 20
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 21
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 22
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ',
        lyrics_transliteration = 'Mariam aregalech wede Genet
Yesemay melaikt eyaregaguwat
Esuwam ende lijwa tenestalech',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd7bb2a53-49b1-4acd-8607-2097aa465914'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 1
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 2
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 3
To honor the prophecy, her father David told
To stand at the Lords right, wearing clothes of fine Gold
Our mother ascended, with glory honor praise
Through the seven heavens, where her Lord and Son dwells

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 4
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 5
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 6
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 7
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 8
Let the heavens open, and let clouds bear witness
No one must be silent, when the Virgin ascends
Let’s all venerate the mother of compassion
Unites us with her son, through her intercession

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 9
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 10
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 11
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 12
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 13
Your holy flesh that the, Lord has taken from thee
Your holy and pure hands , carried divinity
You are raised by your son, from the firm grasp of death
You are raised with honor, we have seen it through faith

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 14
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 15
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 16
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 17
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 18
Rejoice all apostles, our holy fathers
The Lord has ascended, St Mary your mother
Take her linens with you, go tell to the nations
Speak how she has risen, with fervent devotion

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 19
Aregalech Mariam tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 20
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 21
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 22
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Mariam aregalech wede Genet
Yesemay melaikt eyaregaguwat
Esuwam ende lijwa tenestalech';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd7bb2a53-49b1-4acd-8607-2097aa465914'::uuid, 'saint-mary-has-ascended', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selam-leki ("Selam Leki")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'be6b9935-e5ff-4c51-b096-0e0735632a29'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የሰለሞን መንበረ ክብሩ ሰላም ለኪ ፍሬ ስብሐት መዝሙሩ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
YeSolomon menbere kibru selam leki firé sibhat mezmuru (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'be6b9935-e5ff-4c51-b096-0e0735632a29'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የሰለሞን መንበረ ክብሩ ሰላም ለኪ ፍሬ ስብሐት መዝሙሩ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
YeSolomon menbere kibru selam leki firé sibhat mezmuru (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'be6b9935-e5ff-4c51-b096-0e0735632a29'::uuid, 'selam-leki', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
