-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 32 OF 32
-- Target Table: public.mezmur_data_import
-- Total Records in Batch: 33
-- Target Condition: WHERE import_id = '<UUID>'::uuid (Primary Key)
-- Concurrency Protection: Dual-compatible guard (supports formatted or raw baseline)
-- Transliteration Guard: lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = ''
-- Atomicity: PL/pgSQL block rolls back entirely on any 0-row update (ERRCODE 40001)
-- Idempotency: EXISTS check ensures safe re-runs without duplicate execution
-- ============================================================================
BEGIN;

DO $$
DECLARE
  v_rows integer;
BEGIN
  -- eritrean-orthodox-tewhado-mezmur-ade-alatni ("~ ኣደ ኣላትኒ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c85b5c37-6339-46a6-9286-8aea5408c5c6'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 1
Bizey libsi muኻney hafire
Libsey hizki nabay mets’iኽley
Rihrhti ade betey admiqkley
[kidane mihret (3)aqurarite meat]

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 2
Az,,,,,,,,,,,,,
Nizelalem nits’hti bimኻnki
Misay iyu hiyaw qal kidanki
Higus''ye halifu hazeney

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 3
Wihbto mesqel konki mets’nitey
[kidane mihret (3) aqurarite meat]
Az,,,,,,,,,,,,,,,,,,,,,,,,,,,,
Kabti t’fat iኺ mets’lelitey

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 4
Merkeb iኺ kab mot memlet’itey
Ade goytay kibrey limanoኺ
Hiywet hibki ts’elmat asagirki
[kidane mihret (3) aqurarite meat]

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 5
Az,,,,,,,,,,,,,,,,,,,,,,,,,,,,
Biadenet hiywetey degifki
Nay zelalem tesfa bimwladki
Tebetiኹ meቑh senseletey

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 6
Biwedኺ abqiu mekeray
[kidane mihret (3) aqurarite meat]
Az,,,,,,,,,,,,,,,,,,
Ade alatni nibat ethbs

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 7
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Sibhat leegziabher
Weleweladitu Dingil

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 8
Wele mesqelu kibur
Amen (3)

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 1
ብዘይ ልብሲ ሙኻነይ ሓፊረ
ልብሰይ ሒዝኪ ናባይ መጺኽለይ
ርህርህቲ ኣደ ቤተይ ኣድሚቅክለይ
[ኪዳነ ምህረት (3)ኣቁራሪተ መዓት]

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 2
ኣዝ,,,,,,,,,,,,,
ንዘልኣለም ንጽህቲ ብምኻንኪ
ምሳይ ኢዩ ህያው ቃል ኪዳንኪ
ሕጉስ''የ ሓሊፉ ሓዘነይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 3
ውህብቶ መስቀል ኮንኪ መጽንዒተይ
[ኪዳነ ምህረት (3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ካብቲ ጥፍኣት ኢኺ መጽለሊተይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 4
መርከብ ኢኺ ካብ ሞት መምለጢተይ
ኣደ ጎይታይ ክብረይ ልማኖኺ
ህይወት ሂብኪ ጸልማት ኣሳጊርኪ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 5
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ብኣደነት ህይወተይ ደጊፍኪ
ናይ ዘልኣለም ተስፋ ብምውላድኪ
ተበቲኹ መቑሕ ሰንሰለተይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 6
ብወድኺ ኣብቂዑ መከራይ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,
ኣደ ኣላትኒ ንብዓት እትሕብስ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 7
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ስብሃት ለእግዚኣብሄር
ወለወላዲቱ ድንግል

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 8
ወለ መስቀሉ ክቡር
ኣሜን(3)

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 1
ብዘይ ልብሲ ሙኻነይ ሓፊረ
ልብሰይ ሒዝኪ ናባይ መጺኽለይ
ርህርህቲ ኣደ ቤተይ ኣድሚቅክለይ
[ኪዳነ ምህረት (3)ኣቁራሪተ መዓት]

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 2
ኣዝ,,,,,,,,,,,,,
ንዘልኣለም ንጽህቲ ብምኻንኪ
ምሳይ ኢዩ ህያው ቃል ኪዳንኪ
ሕጉስ''የ ሓሊፉ ሓዘነይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 3
ውህብቶ መስቀል ኮንኪ መጽንዒተይ
[ኪዳነ ምህረት (3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ካብቲ ጥፍኣት ኢኺ መጽለሊተይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 4
መርከብ ኢኺ ካብ ሞት መምለጢተይ
ኣደ ጎይታይ ክብረይ ልማኖኺ
ህይወት ሂብኪ ጸልማት ኣሳጊርኪ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 5
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ብኣደነት ህይወተይ ደጊፍኪ
ናይ ዘልኣለም ተስፋ ብምውላድኪ
ተበቲኹ መቑሕ ሰንሰለተይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 6
ብወድኺ ኣብቂዑ መከራይ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,
ኣደ ኣላትኒ ንብዓት እትሕብስ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 7
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ስብሃት ለእግዚኣብሄር
ወለወላዲቱ ድንግል

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 8
ወለ መስቀሉ ክቡር
ኣሜን(3)

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ' THEN lyrics_amharic 
          ELSE 'CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 1
ብዘይ ልብሲ ሙኻነይ ሓፊረ
ልብሰይ ሒዝኪ ናባይ መጺኽለይ
ርህርህቲ ኣደ ቤተይ ኣድሚቅክለይ
[ኪዳነ ምህረት (3)ኣቁራሪተ መዓት]

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 2
ኣዝ,,,,,,,,,,,,,
ንዘልኣለም ንጽህቲ ብምኻንኪ
ምሳይ ኢዩ ህያው ቃል ኪዳንኪ
ሕጉስ''የ ሓሊፉ ሓዘነይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 3
ውህብቶ መስቀል ኮንኪ መጽንዒተይ
[ኪዳነ ምህረት (3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ካብቲ ጥፍኣት ኢኺ መጽለሊተይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 4
መርከብ ኢኺ ካብ ሞት መምለጢተይ
ኣደ ጎይታይ ክብረይ ልማኖኺ
ህይወት ሂብኪ ጸልማት ኣሳጊርኪ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 5
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ብኣደነት ህይወተይ ደጊፍኪ
ናይ ዘልኣለም ተስፋ ብምውላድኪ
ተበቲኹ መቑሕ ሰንሰለተይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 6
ብወድኺ ኣብቂዑ መከራይ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,
ኣደ ኣላትኒ ንብዓት እትሕብስ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 7
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ስብሃት ለእግዚኣብሄር
ወለወላዲቱ ድንግል

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 8
ወለ መስቀሉ ክቡር
ኣሜን(3)

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ' 
        END,
        lyrics_transliteration = 'CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 1
Bizey libsi muኻney hafire
Libsey hizki nabay mets’iኽley
Rihrhti ade betey admiqkley
[kidane mihret (3)aqurarite meat]

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 2
Az,,,,,,,,,,,,,
Nizelalem nits’hti bimኻnki
Misay iyu hiyaw qal kidanki
Higus''ye halifu hazeney

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 3
Wihbto mesqel konki mets’nitey
[kidane mihret (3) aqurarite meat]
Az,,,,,,,,,,,,,,,,,,,,,,,,,,,,
Kabti t’fat iኺ mets’lelitey

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 4
Merkeb iኺ kab mot memlet’itey
Ade goytay kibrey limanoኺ
Hiywet hibki ts’elmat asagirki
[kidane mihret (3) aqurarite meat]

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 5
Az,,,,,,,,,,,,,,,,,,,,,,,,,,,,
Biadenet hiywetey degifki
Nay zelalem tesfa bimwladki
Tebetiኹ meቑh senseletey

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 6
Biwedኺ abqiu mekeray
[kidane mihret (3) aqurarite meat]
Az,,,,,,,,,,,,,,,,,,
Ade alatni nibat ethbs

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 7
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Sibhat leegziabher
Weleweladitu Dingil

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire

VERSE 8
Wele mesqelu kibur
Amen (3)

CHORUS
Ade alatni nibat ethbs
Yireya''ye kitnse kidqs
Kidane mihret (3) aqurarite meat
Hewan hiba kab nay beles fire',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c85b5c37-6339-46a6-9286-8aea5408c5c6'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 1
ብዘይ ልብሲ ሙኻነይ ሓፊረ
ልብሰይ ሒዝኪ ናባይ መጺኽለይ
ርህርህቲ ኣደ ቤተይ ኣድሚቅክለይ
[ኪዳነ ምህረት (3)ኣቁራሪተ መዓት]

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 2
ኣዝ,,,,,,,,,,,,,
ንዘልኣለም ንጽህቲ ብምኻንኪ
ምሳይ ኢዩ ህያው ቃል ኪዳንኪ
ሕጉስ''የ ሓሊፉ ሓዘነይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 3
ውህብቶ መስቀል ኮንኪ መጽንዒተይ
[ኪዳነ ምህረት (3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ካብቲ ጥፍኣት ኢኺ መጽለሊተይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 4
መርከብ ኢኺ ካብ ሞት መምለጢተይ
ኣደ ጎይታይ ክብረይ ልማኖኺ
ህይወት ሂብኪ ጸልማት ኣሳጊርኪ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 5
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ብኣደነት ህይወተይ ደጊፍኪ
ናይ ዘልኣለም ተስፋ ብምውላድኪ
ተበቲኹ መቑሕ ሰንሰለተይ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 6
ብወድኺ ኣብቂዑ መከራይ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,
ኣደ ኣላትኒ ንብዓት እትሕብስ

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 7
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ስብሃት ለእግዚኣብሄር
ወለወላዲቱ ድንግል

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ

VERSE 8
ወለ መስቀሉ ክቡር
ኣሜን(3)

CHORUS
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ሄዋን ሂባ ካብ ናይ በለስ ፍረ
ብዘይ ልብሲ ሙኻነይ ሓፊረ
ልብሰይ ሒዝኪ ናባይ መጺኽለይ
ርህርህቲ ኣደ ቤተይ ኣድሚቅክለይ
[ኪዳነ ምህረት (3)ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,
ንዘልኣለም ንጽህቲ ብምኻንኪ
ምሳይ ኢዩ ህያው ቃል ኪዳንኪ
ሕጉስ''የ ሓሊፉ ሓዘነይ
ውህብቶ መስቀል ኮንኪ መጽንዒተይ
[ኪዳነ ምህረት (3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ካብቲ ጥፍኣት ኢኺ መጽለሊተይ
መርከብ ኢኺ ካብ ሞት መምለጢተይ
ኣደ ጎይታይ ክብረይ ልማኖኺ
ህይወት ሂብኪ ጸልማት ኣሳጊርኪ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ብኣደነት ህይወተይ ደጊፍኪ
ናይ ዘልኣለም ተስፋ ብምውላድኪ
ተበቲኹ መቑሕ ሰንሰለተይ
ብወድኺ ኣብቂዑ መከራይ
[ኪዳነ ምህረት(3) ኣቁራሪተ መዓት]
ኣዝ,,,,,,,,,,,,,,,,,,
ኣደ ኣላትኒ ንብዓት እትሕብስ
ይርእያ''የ ክትንስእ ክድቅስ
ኪዳነ ምህረት(3) ኣቁራሪተ መዓት
ስብሃት ለእግዚኣብሄር
ወለወላዲቱ ድንግል
ወለ መስቀሉ ክቡር
ኣሜን(3)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c85b5c37-6339-46a6-9286-8aea5408c5c6'::uuid, 'eritrean-orthodox-tewhado-mezmur-ade-alatni', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- teum-zena ("ገብርኤል ጥዑም ዜና ብ ቤ/ት/ሰ/ቅዱስ ገብርኤል ኣኽርያ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e0ed5e8a-1db9-494f-a497-2e2065fe5ef5'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 1
Asman (2) melake nay rama
Seyt’an nislt’an keegergr
Amlኹn ilu ketall
Qalu zihfere qalka mis semu

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 2
Mahber melaekt kem zits’enu
Lomi''win lomi kemti timali
Adhn baryaka kabti ment’ali
Qoyme kits’ene ab Kidus emnet

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 3
Qalka asmani liqe melaekt
Niananya azarya misael
Ch’rqos weemu mis daniel
Kab gihur iton kab af anabs

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 4
Dihnet zisebeka firdom zidmss
Lomi''win lomi hazen mis liቕso
Yiekelo ilka libey debso
Kem t’um weyni hazen zerese

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 5
T’um dimts’ka''s nilbey asme
Neta nits’hti Kidist Dingil
Fiቕri zimela kulu testewel
Nielshaday gweyta tayysano

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 6
Ilka zebserkaya qalka kitamno
Lomi''win lomi kem Kidist Dingil
Qalka semia yiኹn nikbl
Betlhem libey ts’dqi kitfer

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 7
Qalka asman Gebriel absar

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 1
ኣስምዓን/2/ መልኣከ ናይ ራማ
ሰይጣን ንስልጣን ከዕገርግር
ኣምልኹን ኢሉ ከታልል
ቃሉ ዝሕፈረ ቃልካ ምስ ሰምዑ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 2
ማሕበር መላእክት ከም ዝጸንዑ
ሎሚ''ውን ሎሚ ከምቲ ትማሊ
ኣድሕን ባርያካ ካብቲ መንጣሊ
ቆይመ ክጸንዕ ኣብ ቅዱስ እምነት

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 3
ቃልካ ኣስምዓኒ ሊቀ መላእክት
ንኣናንያ ኣዛርያ ሚሳኤል
ጭርቆስ ወእሙ ምስ ዳኒኤል
ካብ ግሁር ኢቶን ካብ ኣፍ ኣናብስ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 4
ድሕነት ዝሰበካ ፍርዶም ዝድምስስ
ሎሚ''ውን ሎሚ ሓዘን ምስ ልቕሶ
ይእከሎ ኢልካ ልበይ ደብሶ
ከም ጥዑም ወይኒ ሓዘን ዘረስዕ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 5
ጥዑም ድምጽካ''ስ ንልበይ ኣስምዕ
ነታ ንጽህቲ ቅድስት ድንግል
ፍቕሪ ዝመልኣ ኩሉ ተስተውዕል
ንኤልሻዳይ ጐይታ ታይይስኣኖ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 6
ኢልካ ዘብሰርካያ ቃልካ ክትኣምኖ
ሎሚ''ውን ሎሚ ከም ቅድስት ድንግል
ቃልካ ሰሚዐ ይኹን ንክብል
ቤትልሔም ልበይ ጽድቂ ክትፈር

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 7
ቃልካ ኣስምዓን ገብርኤል ኣብሳር

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 1
ኣስምዓን/2/ መልኣከ ናይ ራማ
ሰይጣን ንስልጣን ከዕገርግር
ኣምልኹን ኢሉ ከታልል
ቃሉ ዝሕፈረ ቃልካ ምስ ሰምዑ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 2
ማሕበር መላእክት ከም ዝጸንዑ
ሎሚ''ውን ሎሚ ከምቲ ትማሊ
ኣድሕን ባርያካ ካብቲ መንጣሊ
ቆይመ ክጸንዕ ኣብ ቅዱስ እምነት

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 3
ቃልካ ኣስምዓኒ ሊቀ መላእክት
ንኣናንያ ኣዛርያ ሚሳኤል
ጭርቆስ ወእሙ ምስ ዳኒኤል
ካብ ግሁር ኢቶን ካብ ኣፍ ኣናብስ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 4
ድሕነት ዝሰበካ ፍርዶም ዝድምስስ
ሎሚ''ውን ሎሚ ሓዘን ምስ ልቕሶ
ይእከሎ ኢልካ ልበይ ደብሶ
ከም ጥዑም ወይኒ ሓዘን ዘረስዕ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 5
ጥዑም ድምጽካ''ስ ንልበይ ኣስምዕ
ነታ ንጽህቲ ቅድስት ድንግል
ፍቕሪ ዝመልኣ ኩሉ ተስተውዕል
ንኤልሻዳይ ጐይታ ታይይስኣኖ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 6
ኢልካ ዘብሰርካያ ቃልካ ክትኣምኖ
ሎሚ''ውን ሎሚ ከም ቅድስት ድንግል
ቃልካ ሰሚዐ ይኹን ንክብል
ቤትልሔም ልበይ ጽድቂ ክትፈር

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 7
ቃልካ ኣስምዓን ገብርኤል ኣብሳር

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ' THEN lyrics_amharic 
          ELSE 'CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 1
ኣስምዓን/2/ መልኣከ ናይ ራማ
ሰይጣን ንስልጣን ከዕገርግር
ኣምልኹን ኢሉ ከታልል
ቃሉ ዝሕፈረ ቃልካ ምስ ሰምዑ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 2
ማሕበር መላእክት ከም ዝጸንዑ
ሎሚ''ውን ሎሚ ከምቲ ትማሊ
ኣድሕን ባርያካ ካብቲ መንጣሊ
ቆይመ ክጸንዕ ኣብ ቅዱስ እምነት

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 3
ቃልካ ኣስምዓኒ ሊቀ መላእክት
ንኣናንያ ኣዛርያ ሚሳኤል
ጭርቆስ ወእሙ ምስ ዳኒኤል
ካብ ግሁር ኢቶን ካብ ኣፍ ኣናብስ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 4
ድሕነት ዝሰበካ ፍርዶም ዝድምስስ
ሎሚ''ውን ሎሚ ሓዘን ምስ ልቕሶ
ይእከሎ ኢልካ ልበይ ደብሶ
ከም ጥዑም ወይኒ ሓዘን ዘረስዕ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 5
ጥዑም ድምጽካ''ስ ንልበይ ኣስምዕ
ነታ ንጽህቲ ቅድስት ድንግል
ፍቕሪ ዝመልኣ ኩሉ ተስተውዕል
ንኤልሻዳይ ጐይታ ታይይስኣኖ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 6
ኢልካ ዘብሰርካያ ቃልካ ክትኣምኖ
ሎሚ''ውን ሎሚ ከም ቅድስት ድንግል
ቃልካ ሰሚዐ ይኹን ንክብል
ቤትልሔም ልበይ ጽድቂ ክትፈር

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 7
ቃልካ ኣስምዓን ገብርኤል ኣብሳር

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ' 
        END,
        lyrics_transliteration = 'CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 1
Asman (2) melake nay rama
Seyt’an nislt’an keegergr
Amlኹn ilu ketall
Qalu zihfere qalka mis semu

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 2
Mahber melaekt kem zits’enu
Lomi''win lomi kemti timali
Adhn baryaka kabti ment’ali
Qoyme kits’ene ab Kidus emnet

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 3
Qalka asmani liqe melaekt
Niananya azarya misael
Ch’rqos weemu mis daniel
Kab gihur iton kab af anabs

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 4
Dihnet zisebeka firdom zidmss
Lomi''win lomi hazen mis liቕso
Yiekelo ilka libey debso
Kem t’um weyni hazen zerese

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 5
T’um dimts’ka''s nilbey asme
Neta nits’hti Kidist Dingil
Fiቕri zimela kulu testewel
Nielshaday gweyta tayysano

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 6
Ilka zebserkaya qalka kitamno
Lomi''win lomi kem Kidist Dingil
Qalka semia yiኹn nikbl
Betlhem libey ts’dqi kitfer

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema

VERSE 7
Qalka asman Gebriel absar

CHORUS
Gebriel Gebriel t’um zema
Tegelets’ biኽbr bigrma
Tidmts’ka ninefsey kit’eqma
Asman (2) Gebriel t’um zema',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e0ed5e8a-1db9-494f-a497-2e2065fe5ef5'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 1
ኣስምዓን/2/ መልኣከ ናይ ራማ
ሰይጣን ንስልጣን ከዕገርግር
ኣምልኹን ኢሉ ከታልል
ቃሉ ዝሕፈረ ቃልካ ምስ ሰምዑ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 2
ማሕበር መላእክት ከም ዝጸንዑ
ሎሚ''ውን ሎሚ ከምቲ ትማሊ
ኣድሕን ባርያካ ካብቲ መንጣሊ
ቆይመ ክጸንዕ ኣብ ቅዱስ እምነት

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 3
ቃልካ ኣስምዓኒ ሊቀ መላእክት
ንኣናንያ ኣዛርያ ሚሳኤል
ጭርቆስ ወእሙ ምስ ዳኒኤል
ካብ ግሁር ኢቶን ካብ ኣፍ ኣናብስ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 4
ድሕነት ዝሰበካ ፍርዶም ዝድምስስ
ሎሚ''ውን ሎሚ ሓዘን ምስ ልቕሶ
ይእከሎ ኢልካ ልበይ ደብሶ
ከም ጥዑም ወይኒ ሓዘን ዘረስዕ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 5
ጥዑም ድምጽካ''ስ ንልበይ ኣስምዕ
ነታ ንጽህቲ ቅድስት ድንግል
ፍቕሪ ዝመልኣ ኩሉ ተስተውዕል
ንኤልሻዳይ ጐይታ ታይይስኣኖ

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 6
ኢልካ ዘብሰርካያ ቃልካ ክትኣምኖ
ሎሚ''ውን ሎሚ ከም ቅድስት ድንግል
ቃልካ ሰሚዐ ይኹን ንክብል
ቤትልሔም ልበይ ጽድቂ ክትፈር

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ

VERSE 7
ቃልካ ኣስምዓን ገብርኤል ኣብሳር

CHORUS
ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ትድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ገብርኤል ገብርኤል ጥዑም ዜማ
ተገለጽ ብኽብር ብግርማ
ት`ድምጽካ ንነፍሰይ ክጠቅማ
ኣስምዓን/2/ ገብርኤል ጥዑም ዜማ
ኣስምዓን/2/ መልኣከ ናይ ራማ
ሰይጣን ንስልጣን ከዕገርግር
ኣምልኹን ኢሉ ከታልል
ቃሉ ዝሕፈረ ቃልካ ምስ ሰምዑ
ማሕበር መላእክት ከም ዝጸንዑ
ሎሚ''ውን ሎሚ ከምቲ ትማሊ
ኣድሕን ባርያካ ካብቲ መንጣሊ
ቆይመ ክጸንዕ ኣብ ቅዱስ እምነት
ቃልካ ኣስምዓኒ ሊቀ መላእክት
ንኣናንያ ኣዛርያ ሚሳኤል
ጭርቆስ ወእሙ ምስ ዳኒኤል
ካብ ግሁር ኢቶን ካብ ኣፍ ኣናብስ
ድሕነት ዝሰበካ ፍርዶም ዝድምስስ
ሎሚ''ውን ሎሚ ሓዘን ምስ ልቕሶ
ይእከሎ ኢልካ ልበይ ደብሶ
ከም ጥዑም ወይኒ ሓዘን ዘረስዕ
ጥዑም ድምጽካ''ስ ንልበይ ኣስምዕ
ነታ ንጽህቲ ቅድስት ድንግል
ፍቕሪ ዝመልኣ ኩሉ ተስተውዕል
ንኤልሻዳይ ጐይታ ታይ`ይስኣኖ
ኢልካ ዘብሰርካያ ቃልካ ክትኣምኖ
ሎሚ''ውን ሎሚ ከም ቅድስት ድንግል
ቃልካ ሰሚዐ ይኹን ንክብል
ቤትልሔም ልበይ ጽድቂ ክትፈር
ቃልካ ኣስምዓን ገብርኤል ኣብሳር'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e0ed5e8a-1db9-494f-a497-2e2065fe5ef5'::uuid, 'teum-zena', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- to-receive-the-lord-s-love ("የወደደኝ ጌታ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e772bf84-89dd-43be-b47f-141a048b0d4c'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 1
YeWdedeng Geta Min Adrigelet New
Bezemereletim YeAnsibetal Yihew
KeWudqete Ansiteh Dikamen YeAgezkeng
Sebarawun Deldey Gettmeh Yasalefkeng

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 2
When I had nothing left begging in Jericho
Swallowed up by darkness I had nowhere to go
The Lord of light had heard my cries and He drew near
With His hands healed me, my vision became clear

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 3
For many months and years I had been bedridden
No one came to my aid no support was given
My Lord and my Savior He came to me and said
Your sins are forgiven rise and carry and your bed

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 4
With twelve long years of pain blood flowing with no end
I was rejected with no one to call a friend
When Christ came near I touched the edge of His clothing
The power that came forth ended my suffering

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 5
I was a drunk, a thief and an adulterer
I was the cheif rebel and was a murderer
But I praise God because He changed my life around
In His power and hope today I do abound

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 1
YeWdedeng Geta Min Adrigelet New
Bezemereletim YeAnsibetal Yihew
KeWudqete Ansiteh Dikamen YeAgezkeng
Sebarawun Deldey Gettmeh Yasalefkeng

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 2
When I had nothing left begging in Jericho
Swallowed up by darkness I had nowhere to go
The Lord of light had heard my cries and He drew near
With His hands healed me, my vision became clear

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 3
For many months and years I had been bedridden
No one came to my aid no support was given
My Lord and my Savior He came to me and said
Your sins are forgiven rise and carry and your bed

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 4
With twelve long years of pain blood flowing with no end
I was rejected with no one to call a friend
When Christ came near I touched the edge of His clothing
The power that came forth ended my suffering

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 5
I was a drunk, a thief and an adulterer
I was the cheif rebel and was a murderer
But I praise God because He changed my life around
In His power and hope today I do abound

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 1
YeWdedeng Geta Min Adrigelet New
Bezemereletim YeAnsibetal Yihew
KeWudqete Ansiteh Dikamen YeAgezkeng
Sebarawun Deldey Gettmeh Yasalefkeng

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 2
When I had nothing left begging in Jericho
Swallowed up by darkness I had nowhere to go
The Lord of light had heard my cries and He drew near
With His hands healed me, my vision became clear

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 3
For many months and years I had been bedridden
No one came to my aid no support was given
My Lord and my Savior He came to me and said
Your sins are forgiven rise and carry and your bed

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 4
With twelve long years of pain blood flowing with no end
I was rejected with no one to call a friend
When Christ came near I touched the edge of His clothing
The power that came forth ended my suffering

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 5
I was a drunk, a thief and an adulterer
I was the cheif rebel and was a murderer
But I praise God because He changed my life around
In His power and hope today I do abound

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again' THEN lyrics_amharic 
          ELSE 'CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 1
YeWdedeng Geta Min Adrigelet New
Bezemereletim YeAnsibetal Yihew
KeWudqete Ansiteh Dikamen YeAgezkeng
Sebarawun Deldey Gettmeh Yasalefkeng

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 2
When I had nothing left begging in Jericho
Swallowed up by darkness I had nowhere to go
The Lord of light had heard my cries and He drew near
With His hands healed me, my vision became clear

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 3
For many months and years I had been bedridden
No one came to my aid no support was given
My Lord and my Savior He came to me and said
Your sins are forgiven rise and carry and your bed

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 4
With twelve long years of pain blood flowing with no end
I was rejected with no one to call a friend
When Christ came near I touched the edge of His clothing
The power that came forth ended my suffering

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 5
I was a drunk, a thief and an adulterer
I was the cheif rebel and was a murderer
But I praise God because He changed my life around
In His power and hope today I do abound

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again' 
        END,
        lyrics_transliteration = 'CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 1
YeWdedeng Geta Min Adrigelet New
Bezemereletim YeAnsibetal Yihew
KeWudqete Ansiteh Dikamen YeAgezkeng
Sebarawun Deldey Gettmeh Yasalefkeng

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 2
When I had nothing left begging in Jericho
Swallowed up by darkness I had nowhere to go
The Lord of light had heard my cries and He drew near
With His hands healed me, my vision became clear

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 3
For many months and years I had been bedridden
No one came to my aid no support was given
My Lord and my Savior He came to me and said
Your sins are forgiven rise and carry and your bed

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 4
With twelve long years of pain blood flowing with no end
I was rejected with no one to call a friend
When Christ came near I touched the edge of His clothing
The power that came forth ended my suffering

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 5
I was a drunk, a thief and an adulterer
I was the cheif rebel and was a murderer
But I praise God because He changed my life around
In His power and hope today I do abound

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e772bf84-89dd-43be-b47f-141a048b0d4c'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 1
YeWdedeng Geta Min Adrigelet New
Bezemereletim YeAnsibetal Yihew
KeWudqete Ansiteh Dikamen YeAgezkeng
Sebarawun Deldey Gettmeh Yasalefkeng

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 2
When I had nothing left begging in Jericho
Swallowed up by darkness I had nowhere to go
The Lord of light had heard my cries and He drew near
With His hands healed me, my vision became clear

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 3
For many months and years I had been bedridden
No one came to my aid no support was given
My Lord and my Savior He came to me and said
Your sins are forgiven rise and carry and your bed

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 4
With twelve long years of pain blood flowing with no end
I was rejected with no one to call a friend
When Christ came near I touched the edge of His clothing
The power that came forth ended my suffering

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 5
I was a drunk, a thief and an adulterer
I was the cheif rebel and was a murderer
But I praise God because He changed my life around
In His power and hope today I do abound

CHORUS
To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again'
        OR lyrics_amharic IS NOT DISTINCT FROM 'To receive the Lord''s love what have I done for Him?
Although it''s not enough I''m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again
YeWdedeng Geta Min Adrigelet New
Bezemereletim YeAnsibetal Yihew
KeWudqete Ansiteh Dikamen YeAgezkeng
Sebarawun Deldey Gettmeh Yasalefkeng
When I had nothing left begging in Jericho
Swallowed up by darkness I had nowhere to go
The Lord of light had heard my cries and He drew near
With His hands healed me, my vision became clear
For many months and years I had been bedridden
No one came to my aid no support was given
My Lord and my Savior He came to me and said
Your sins are forgiven rise and carry and your bed
With twelve long years of pain blood flowing with no end
I was rejected with no one to call a friend
When Christ came near I touched the edge of His clothing
The power that came forth ended my suffering
I was a drunk, a thief and an adulterer
I was the cheif rebel and was a murderer
But I praise God because He changed my life around
In His power and hope today I do abound'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e772bf84-89dd-43be-b47f-141a048b0d4c'::uuid, 'to-receive-the-lord-s-love', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yehiyawan-amilak ("የሕያዋን አምላክ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fd746953-d52f-40f5-9ec6-925bc6824265'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 1
Bemesqelu yedan Kristos tenesa
Kehet’yat qoragna Kristos tenesa
Yetewarednewn Kristos tenesa
Liyakebren dagmegna Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 2
Motn ashenfo Kristos tenesa
Tenesaln legna Kristos tenesa
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 3
Enates atfru Kristos tenesa
Enegrachhalehu Kristos tenesa
Yeteseqelewn Kristos tenesa
Endtshu awqalehu Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 4
Hiywan kemutan Kristos tenesa
Lemn felegachhu Kristos tenesa
Endetenagerew Kristos tenesa
Tenestwal Getachen Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 5
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Motn dil adrgo Kristos tenesa
Beekule lelit Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 6
Asqedmo taye Kristos tenesa
Lemeqdelawit kirstose tenesa
Erswam tinsaewn Kristos tenesa
Lalem abeserech Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 7
Getayen ayehut Kristos tenesa
Tenestwal eyalech Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 1
በመስቀሉ የዳን ክርስቶስ ተነሳ
ከሀጥያት ቆራኛ ክርስቶስ ተነሳ
የተዋረድነውን ክርስቶስ ተነሳ
ሊያከብረን ዳግመኛ ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 2
ሞትን አሸንፎ ክርስቶስ ተነሳ
ተነሳልን ለኛ ክርስቶስ ተነሳ
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ/2/

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 3
እናተስ አትፍሩ ክርስቶስ ተነሳ
እነግራችኃለሁ ክርስቶስ ተነሳ
የተሠቀለውን ክርስቶስ ተነሳ
እንድትሹ አውቃለሁ ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 4
ህይዋን ከሙታን ክርስቶስ ተነሳ
ለምን ፈለጋችሁ ክርስቶስ ተነሳ
እንዴተናገረው ክርስቶስ ተነሳ
ተነስቷል ጌታችን ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 5
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሞትን ድል አድርጎ ክርስቶስ ተነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 6
አስቀድሞ ታየ ክርስቶስ ተነሳ
ለመቅደላዊት ክርስቶሰ ተነሳ
እርሷም ትንሳኤውን ክርስቶስ ተነሳ
ላለም አበሠረች ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 7
ጌታየን አየሁት ክርስቶስ ተነሳ
ተነስቷል እያለች ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 1
በመስቀሉ የዳን ክርስቶስ ተነሳ
ከሀጥያት ቆራኛ ክርስቶስ ተነሳ
የተዋረድነውን ክርስቶስ ተነሳ
ሊያከብረን ዳግመኛ ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 2
ሞትን አሸንፎ ክርስቶስ ተነሳ
ተነሳልን ለኛ ክርስቶስ ተነሳ
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ/2/

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 3
እናተስ አትፍሩ ክርስቶስ ተነሳ
እነግራችኃለሁ ክርስቶስ ተነሳ
የተሠቀለውን ክርስቶስ ተነሳ
እንድትሹ አውቃለሁ ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 4
ህይዋን ከሙታን ክርስቶስ ተነሳ
ለምን ፈለጋችሁ ክርስቶስ ተነሳ
እንዴተናገረው ክርስቶስ ተነሳ
ተነስቷል ጌታችን ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 5
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሞትን ድል አድርጎ ክርስቶስ ተነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 6
አስቀድሞ ታየ ክርስቶስ ተነሳ
ለመቅደላዊት ክርስቶሰ ተነሳ
እርሷም ትንሳኤውን ክርስቶስ ተነሳ
ላለም አበሠረች ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 7
ጌታየን አየሁት ክርስቶስ ተነሳ
ተነስቷል እያለች ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ' THEN lyrics_amharic 
          ELSE 'CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 1
በመስቀሉ የዳን ክርስቶስ ተነሳ
ከሀጥያት ቆራኛ ክርስቶስ ተነሳ
የተዋረድነውን ክርስቶስ ተነሳ
ሊያከብረን ዳግመኛ ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 2
ሞትን አሸንፎ ክርስቶስ ተነሳ
ተነሳልን ለኛ ክርስቶስ ተነሳ
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ/2/

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 3
እናተስ አትፍሩ ክርስቶስ ተነሳ
እነግራችኃለሁ ክርስቶስ ተነሳ
የተሠቀለውን ክርስቶስ ተነሳ
እንድትሹ አውቃለሁ ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 4
ህይዋን ከሙታን ክርስቶስ ተነሳ
ለምን ፈለጋችሁ ክርስቶስ ተነሳ
እንዴተናገረው ክርስቶስ ተነሳ
ተነስቷል ጌታችን ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 5
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሞትን ድል አድርጎ ክርስቶስ ተነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 6
አስቀድሞ ታየ ክርስቶስ ተነሳ
ለመቅደላዊት ክርስቶሰ ተነሳ
እርሷም ትንሳኤውን ክርስቶስ ተነሳ
ላለም አበሠረች ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 7
ጌታየን አየሁት ክርስቶስ ተነሳ
ተነስቷል እያለች ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ' 
        END,
        lyrics_transliteration = 'CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 1
Bemesqelu yedan Kristos tenesa
Kehet’yat qoragna Kristos tenesa
Yetewarednewn Kristos tenesa
Liyakebren dagmegna Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 2
Motn ashenfo Kristos tenesa
Tenesaln legna Kristos tenesa
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 3
Enates atfru Kristos tenesa
Enegrachhalehu Kristos tenesa
Yeteseqelewn Kristos tenesa
Endtshu awqalehu Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 4
Hiywan kemutan Kristos tenesa
Lemn felegachhu Kristos tenesa
Endetenagerew Kristos tenesa
Tenestwal Getachen Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 5
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Motn dil adrgo Kristos tenesa
Beekule lelit Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 6
Asqedmo taye Kristos tenesa
Lemeqdelawit kirstose tenesa
Erswam tinsaewn Kristos tenesa
Lalem abeserech Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa

VERSE 7
Getayen ayehut Kristos tenesa
Tenestwal eyalech Kristos tenesa

CHORUS
Yehywan amlak mutann liyasnesa
Beekule lelit Kristos tenesa (2)
Mutan aydelenm Kristos tenesa
Hiywan nen egna Kristos tenesa',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fd746953-d52f-40f5-9ec6-925bc6824265'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 1
በመስቀሉ የዳን ክርስቶስ ተነሳ
ከሀጥያት ቆራኛ ክርስቶስ ተነሳ
የተዋረድነውን ክርስቶስ ተነሳ
ሊያከብረን ዳግመኛ ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 2
ሞትን አሸንፎ ክርስቶስ ተነሳ
ተነሳልን ለኛ ክርስቶስ ተነሳ
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ/2/

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 3
እናተስ አትፍሩ ክርስቶስ ተነሳ
እነግራችኃለሁ ክርስቶስ ተነሳ
የተሠቀለውን ክርስቶስ ተነሳ
እንድትሹ አውቃለሁ ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 4
ህይዋን ከሙታን ክርስቶስ ተነሳ
ለምን ፈለጋችሁ ክርስቶስ ተነሳ
እንዴተናገረው ክርስቶስ ተነሳ
ተነስቷል ጌታችን ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 5
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሞትን ድል አድርጎ ክርስቶስ ተነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 6
አስቀድሞ ታየ ክርስቶስ ተነሳ
ለመቅደላዊት ክርስቶሰ ተነሳ
እርሷም ትንሳኤውን ክርስቶስ ተነሳ
ላለም አበሠረች ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ

VERSE 7
ጌታየን አየሁት ክርስቶስ ተነሳ
ተነስቷል እያለች ክርስቶስ ተነሳ

CHORUS
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም ክርስቶስ ተነሳ
ህይዋን ነን እኛ ክርስቶስ ተነሳ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሙታን አይደለንም..............ክርስቶስ ተነሳ
ህይዋን ነን እኛ ................ክርስቶስ ተነሳ
በመስቀሉ የዳን ...............ክርስቶስ ተነሳ
ከሀጥያት ቆራኛ.................ክርስቶስ ተነሳ
የተዋረድነውን ...................ክርስቶስ ተነሳ
ሊያከብረን ዳግመኛ ...............ክርስቶስ ተነሳ
ሞትን አሸንፎ ...............ክርስቶስ ተነሳ
ተነሳልን ለኛ ...............ክርስቶስ ተነሳ
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ/2/
እናተስ አትፍሩ ...............ክርስቶስ ተነሳ
እነግራችኃለሁ ...............ክርስቶስ ተነሳ
የተሠቀለውን...................ክርስቶስ ተነሳ
እንድትሹ አውቃለሁ...........ክርስቶስ ተነሳ
ህይዋን ከሙታን.............ክርስቶስ ተነሳ
ለምን ፈለጋችሁ.............ክርስቶስ ተነሳ
እንዴተናገረው .............ክርስቶስ ተነሳ
ተነስቷል ጌታችን...............ክርስቶስ ተነሳ
የህይዋን አምላክ ሙታንን ሊያስነሳ
በእኩለ ሌሊት ክርስቶስ ተነሳ /2/
ሞትን ድል አድርጎ...........ክርስቶስ ተነሳ
በእኩለ ሌሊት..............ክርስቶስ ተነሳ
አስቀድሞ ታየ ...............ክርስቶስ ተነሳ
ለመቅደላዊት................ክርስቶሰ ተነሳ
እርሷም ትንሳኤውን.............ክርስቶስ ተነሳ
ላለም አበሠረች ..............ክርስቶስ ተነሳ
ጌታየን አየሁት..............ክርስቶስ ተነሳ
ተነስቷል እያለች..................ክርስቶስ ተነሳ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fd746953-d52f-40f5-9ec6-925bc6824265'::uuid, 'yehiyawan-amilak', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hoyahoye-buha-belu-orthodox-mezmure ("ሆያ ሆዬ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9bc8f75e-2dc8-48c1-b2ab-396bfc21c058'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 1
Buhe belu ho buhe belu ho lijoch hulu ho
Beterara ch’af ho bedebre tabor ho
Getachgn qomo ho taye bekbr ho
Muse elyas ho met’u kalubet ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 2
Birhann lebso ho ayut hawaryat ho
Melekot tegelet’e birhan abera (2)
Amlakachn qomo taye betabor terara (2)
Kedebroch liqesh ho birhann lebsesh ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 3
Betalaq girma ho amlak tayebsh ho
Libsu nech’ hone ho mola demena ho
Betabor taye ho yebrhan fana ho
Debre tabor tadleshal yemaychal chleshal (2

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 4
Yethtnawn amlak Kristosn yizeshal(2
Yeab abatnet ho yeweldm lijnet ho
Begehed taye ho taweqe beewnet ho
Yedawit tinbit ho tefets’emebet ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 5
Biluy kehedis ho tegenagnubet ho
Ersun bicha ensma lezelealem (2)
Yalesga wedemu keto andnm (2)
Yeenatoch bahl ho ya yemulmulu ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 6
Yebereket new ho yibelal hulu ho
Yeabatoch chbo ho ch’eleman gefa ho
Yeset’en selam ho bealem yisfa ho
Amlakachn yemesgen simu yignen (2)

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 7
Yetaboru birhan hiywet yihunen (2)
Bejraf ch’uኸt ho seferu demqol ho
Yebuhe chbo ho liwet’a qerbwal ho
Ch’elemaw alfo ho birhan siwet’a ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 8
Belu enzemr ho yiraqen qut’a ho
Ersun bicha ensma lezelealem (2)
Yalesga wedemu keto andnm (2)
Kifetut dejun ho yegetawn ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 9
Yibarklachhu ho betachhun ho
Sech’iwn yabzaw ho aynfegachhu ho
Lezare ametm ho ho
Amlakachn yemesgen simu yignen (2)

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 10
E (2)
Amet awde amet digemena amet digemena
Beqeri edmeyayachhu digemena amet digemena
Lemaereg yabqachhu digemena amet digemena

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 11
Betachhu bereket digemena amet digemena
Ayt’a beewnet digemena amet digemena
Yetaboru Geta digemena amet digemena
Yigba t’ewat mata digemena amet digemena

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 12
Bizu yayalu gena digemena amet digemena
Set’tot fiqr t’ena digemena amet digemena
Lezare yaderesen Amen
Yikber yemesgen Amen

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 13
Yesemayu amlak Amen
Selamun yilak Amen
Lehegerachn fiqr Amen
Yihun kibir Amen

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 14
Kensha hiywet Amen
Yasatfen beewnet Amen
Leametu yadrsen Amen
Sayleyayen Amen

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 15
Yeqdusan melaekt yets’adqan semaetat redet bereket yigba behulum bet
Enqum behaymanot ts’enten besga
Lehet’iyatachn dihnet yiqreta
Yaqoyuln yeabew qedemt

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 16
Yigebalna lint’ebq beewnet
Bahlawiwn yeabatoch tiwfit

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 1
ቡሄ በሉ ሆ ቡሄ በሉ ሆ ልጆች ሁሉ ሆ
በተራራ ጫፍ ሆ በደብረ ታቦር ሆ
ጌታችኝ ቆሞ ሆ ታየ በክብር ሆ
ሙሴ ኤልያስ ሆ መጡ ካሉበት ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 2
ብርሃንን ለብሶ ሆ አዩት ሃዋርያት ሆ
መለኮት ተገለጠ ብርሃን አበራ (2)
አምላካችን ቆሞ ታየ በታቦር ተራራ(2)
ከደብሮች ልቀሽ ሆ ብርሃንን ለብሰሽ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 3
በታላቅ ግርማ ሆ አምላክ ታየብሽ ሆ
ልብሱ ነጭ ሆነ ሆ ሞላ ደመና ሆ
በታቦር ታየ ሆ የብርሃን ፋና ሆ
ደብረ ታቦር ታድለሻል የማይቻል ችለሻል (2

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 4
የትህትናውን አምላክ ክርስቶስን ይዘሻል(2
የአብ አባትነት ሆ የወልድም ልጅነት ሆ
በገሀድ ታየ ሆ ታወቀ በእውነት ሆ
የዳዊት ትንቢት ሆ ተፈጸመበት ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 5
ብሉይ ከሀዲስ ሆ ተገናኙበት ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
የእናቶች ባህል ሆ ያ የሙልሙሉ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 6
የበረከት ነው ሆ ይበላል ሁሉ ሆ
የአባቶች ችቦ ሆ ጨለማን ገፋ ሆ
የሰጠን ሰላም ሆ በአለም ይስፋ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 7
የታቦሩ ብርሃን ህይወት ይሁነን(2)
በጅራፍ ጩኸት ሆ ሰፈሩ ደምቆል ሆ
የቡሄ ችቦ ሆ ሊወጣ ቀርቧል ሆ
ጨለማው አልፎ ሆ ብርሃን ሲወጣ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 8
በሉ እንዘምር ሆ ይራቀን ቁጣ ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
ክፈቱት ደጁን ሆ የጌታውን ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 9
ይባርክላችሁ ሆ ቤታችሁን ሆ
ሰጪውን ያብዛው ሆ አይንፈጋችሁ ሆ
ለዛሬ ዓመትም ሆ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 10
E(2)
ዓመት አውደ ዓመት ድገመና አመት ድገመና
በቀሪ እድሜያያችሁ ድገመና አመት ድገመና
ለማዕረግ ያብቃችሁ ድገመና አመት ድገመና

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 11
ቤታችሁ በረከት ድገመና አመት ድገመና
አይጣ በእውነት ድገመና አመት ድገመና
የታቦሩ ጌታ ድገመና አመት ድገመና
ይግባ ጠዋት ማታ ድገመና አመት ድገመና

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 12
ብዙ ያያሉ ገና ድገመና አመት ድገመና
ሰጥቶት ፍቅር ጤና ድገመና አመት ድገመና
ለዛሬ ያደረሰን አሜን
ይክበር ይመስገን አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 13
የሰማዩ አምላክ አሜን
ሰላሙን ይላክ አሜን
ለሀገራችን ፍቅር አሜን
ይሁን ክብር አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 14
ከንስሃ ህይወት አሜን
ያሳትፈን በእውነት አሜን
ለአመቱ ያድርሰን አሜን
ሳይለያየን አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 15
የቅዱሳን መላእክት የጻድቃን ሰማእታት ረድኤት በረከት ይግባ በሁሉም ቤት
እንቁም በሃይማኖት ጸንተን በስጋ
ለሀጢያታችን ድህነት ይቅረታ
ያቆዩልን የአበው ቀደምት

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 16
ይገባልና ልንጠብቅ በእውነት
ባህላዊውን የአባቶች ትውፊት

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 1
ቡሄ በሉ ሆ ቡሄ በሉ ሆ ልጆች ሁሉ ሆ
በተራራ ጫፍ ሆ በደብረ ታቦር ሆ
ጌታችኝ ቆሞ ሆ ታየ በክብር ሆ
ሙሴ ኤልያስ ሆ መጡ ካሉበት ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 2
ብርሃንን ለብሶ ሆ አዩት ሃዋርያት ሆ
መለኮት ተገለጠ ብርሃን አበራ (2)
አምላካችን ቆሞ ታየ በታቦር ተራራ(2)
ከደብሮች ልቀሽ ሆ ብርሃንን ለብሰሽ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 3
በታላቅ ግርማ ሆ አምላክ ታየብሽ ሆ
ልብሱ ነጭ ሆነ ሆ ሞላ ደመና ሆ
በታቦር ታየ ሆ የብርሃን ፋና ሆ
ደብረ ታቦር ታድለሻል የማይቻል ችለሻል (2

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 4
የትህትናውን አምላክ ክርስቶስን ይዘሻል(2
የአብ አባትነት ሆ የወልድም ልጅነት ሆ
በገሀድ ታየ ሆ ታወቀ በእውነት ሆ
የዳዊት ትንቢት ሆ ተፈጸመበት ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 5
ብሉይ ከሀዲስ ሆ ተገናኙበት ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
የእናቶች ባህል ሆ ያ የሙልሙሉ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 6
የበረከት ነው ሆ ይበላል ሁሉ ሆ
የአባቶች ችቦ ሆ ጨለማን ገፋ ሆ
የሰጠን ሰላም ሆ በአለም ይስፋ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 7
የታቦሩ ብርሃን ህይወት ይሁነን(2)
በጅራፍ ጩኸት ሆ ሰፈሩ ደምቆል ሆ
የቡሄ ችቦ ሆ ሊወጣ ቀርቧል ሆ
ጨለማው አልፎ ሆ ብርሃን ሲወጣ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 8
በሉ እንዘምር ሆ ይራቀን ቁጣ ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
ክፈቱት ደጁን ሆ የጌታውን ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 9
ይባርክላችሁ ሆ ቤታችሁን ሆ
ሰጪውን ያብዛው ሆ አይንፈጋችሁ ሆ
ለዛሬ ዓመትም ሆ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 10
E(2)
ዓመት አውደ ዓመት ድገመና አመት ድገመና
በቀሪ እድሜያያችሁ ድገመና አመት ድገመና
ለማዕረግ ያብቃችሁ ድገመና አመት ድገመና

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 11
ቤታችሁ በረከት ድገመና አመት ድገመና
አይጣ በእውነት ድገመና አመት ድገመና
የታቦሩ ጌታ ድገመና አመት ድገመና
ይግባ ጠዋት ማታ ድገመና አመት ድገመና

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 12
ብዙ ያያሉ ገና ድገመና አመት ድገመና
ሰጥቶት ፍቅር ጤና ድገመና አመት ድገመና
ለዛሬ ያደረሰን አሜን
ይክበር ይመስገን አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 13
የሰማዩ አምላክ አሜን
ሰላሙን ይላክ አሜን
ለሀገራችን ፍቅር አሜን
ይሁን ክብር አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 14
ከንስሃ ህይወት አሜን
ያሳትፈን በእውነት አሜን
ለአመቱ ያድርሰን አሜን
ሳይለያየን አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 15
የቅዱሳን መላእክት የጻድቃን ሰማእታት ረድኤት በረከት ይግባ በሁሉም ቤት
እንቁም በሃይማኖት ጸንተን በስጋ
ለሀጢያታችን ድህነት ይቅረታ
ያቆዩልን የአበው ቀደምት

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 16
ይገባልና ልንጠብቅ በእውነት
ባህላዊውን የአባቶች ትውፊት

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ' THEN lyrics_amharic 
          ELSE 'CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 1
ቡሄ በሉ ሆ ቡሄ በሉ ሆ ልጆች ሁሉ ሆ
በተራራ ጫፍ ሆ በደብረ ታቦር ሆ
ጌታችኝ ቆሞ ሆ ታየ በክብር ሆ
ሙሴ ኤልያስ ሆ መጡ ካሉበት ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 2
ብርሃንን ለብሶ ሆ አዩት ሃዋርያት ሆ
መለኮት ተገለጠ ብርሃን አበራ (2)
አምላካችን ቆሞ ታየ በታቦር ተራራ(2)
ከደብሮች ልቀሽ ሆ ብርሃንን ለብሰሽ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 3
በታላቅ ግርማ ሆ አምላክ ታየብሽ ሆ
ልብሱ ነጭ ሆነ ሆ ሞላ ደመና ሆ
በታቦር ታየ ሆ የብርሃን ፋና ሆ
ደብረ ታቦር ታድለሻል የማይቻል ችለሻል (2

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 4
የትህትናውን አምላክ ክርስቶስን ይዘሻል(2
የአብ አባትነት ሆ የወልድም ልጅነት ሆ
በገሀድ ታየ ሆ ታወቀ በእውነት ሆ
የዳዊት ትንቢት ሆ ተፈጸመበት ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 5
ብሉይ ከሀዲስ ሆ ተገናኙበት ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
የእናቶች ባህል ሆ ያ የሙልሙሉ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 6
የበረከት ነው ሆ ይበላል ሁሉ ሆ
የአባቶች ችቦ ሆ ጨለማን ገፋ ሆ
የሰጠን ሰላም ሆ በአለም ይስፋ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 7
የታቦሩ ብርሃን ህይወት ይሁነን(2)
በጅራፍ ጩኸት ሆ ሰፈሩ ደምቆል ሆ
የቡሄ ችቦ ሆ ሊወጣ ቀርቧል ሆ
ጨለማው አልፎ ሆ ብርሃን ሲወጣ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 8
በሉ እንዘምር ሆ ይራቀን ቁጣ ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
ክፈቱት ደጁን ሆ የጌታውን ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 9
ይባርክላችሁ ሆ ቤታችሁን ሆ
ሰጪውን ያብዛው ሆ አይንፈጋችሁ ሆ
ለዛሬ ዓመትም ሆ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 10
E(2)
ዓመት አውደ ዓመት ድገመና አመት ድገመና
በቀሪ እድሜያያችሁ ድገመና አመት ድገመና
ለማዕረግ ያብቃችሁ ድገመና አመት ድገመና

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 11
ቤታችሁ በረከት ድገመና አመት ድገመና
አይጣ በእውነት ድገመና አመት ድገመና
የታቦሩ ጌታ ድገመና አመት ድገመና
ይግባ ጠዋት ማታ ድገመና አመት ድገመና

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 12
ብዙ ያያሉ ገና ድገመና አመት ድገመና
ሰጥቶት ፍቅር ጤና ድገመና አመት ድገመና
ለዛሬ ያደረሰን አሜን
ይክበር ይመስገን አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 13
የሰማዩ አምላክ አሜን
ሰላሙን ይላክ አሜን
ለሀገራችን ፍቅር አሜን
ይሁን ክብር አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 14
ከንስሃ ህይወት አሜን
ያሳትፈን በእውነት አሜን
ለአመቱ ያድርሰን አሜን
ሳይለያየን አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 15
የቅዱሳን መላእክት የጻድቃን ሰማእታት ረድኤት በረከት ይግባ በሁሉም ቤት
እንቁም በሃይማኖት ጸንተን በስጋ
ለሀጢያታችን ድህነት ይቅረታ
ያቆዩልን የአበው ቀደምት

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 16
ይገባልና ልንጠብቅ በእውነት
ባህላዊውን የአባቶች ትውፊት

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ' 
        END,
        lyrics_transliteration = 'CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 1
Buhe belu ho buhe belu ho lijoch hulu ho
Beterara ch’af ho bedebre tabor ho
Getachgn qomo ho taye bekbr ho
Muse elyas ho met’u kalubet ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 2
Birhann lebso ho ayut hawaryat ho
Melekot tegelet’e birhan abera (2)
Amlakachn qomo taye betabor terara (2)
Kedebroch liqesh ho birhann lebsesh ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 3
Betalaq girma ho amlak tayebsh ho
Libsu nech’ hone ho mola demena ho
Betabor taye ho yebrhan fana ho
Debre tabor tadleshal yemaychal chleshal (2

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 4
Yethtnawn amlak Kristosn yizeshal(2
Yeab abatnet ho yeweldm lijnet ho
Begehed taye ho taweqe beewnet ho
Yedawit tinbit ho tefets’emebet ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 5
Biluy kehedis ho tegenagnubet ho
Ersun bicha ensma lezelealem (2)
Yalesga wedemu keto andnm (2)
Yeenatoch bahl ho ya yemulmulu ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 6
Yebereket new ho yibelal hulu ho
Yeabatoch chbo ho ch’eleman gefa ho
Yeset’en selam ho bealem yisfa ho
Amlakachn yemesgen simu yignen (2)

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 7
Yetaboru birhan hiywet yihunen (2)
Bejraf ch’uኸt ho seferu demqol ho
Yebuhe chbo ho liwet’a qerbwal ho
Ch’elemaw alfo ho birhan siwet’a ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 8
Belu enzemr ho yiraqen qut’a ho
Ersun bicha ensma lezelealem (2)
Yalesga wedemu keto andnm (2)
Kifetut dejun ho yegetawn ho

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 9
Yibarklachhu ho betachhun ho
Sech’iwn yabzaw ho aynfegachhu ho
Lezare ametm ho ho
Amlakachn yemesgen simu yignen (2)

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 10
E (2)
Amet awde amet digemena amet digemena
Beqeri edmeyayachhu digemena amet digemena
Lemaereg yabqachhu digemena amet digemena

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 11
Betachhu bereket digemena amet digemena
Ayt’a beewnet digemena amet digemena
Yetaboru Geta digemena amet digemena
Yigba t’ewat mata digemena amet digemena

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 12
Bizu yayalu gena digemena amet digemena
Set’tot fiqr t’ena digemena amet digemena
Lezare yaderesen Amen
Yikber yemesgen Amen

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 13
Yesemayu amlak Amen
Selamun yilak Amen
Lehegerachn fiqr Amen
Yihun kibir Amen

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 14
Kensha hiywet Amen
Yasatfen beewnet Amen
Leametu yadrsen Amen
Sayleyayen Amen

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 15
Yeqdusan melaekt yets’adqan semaetat redet bereket yigba behulum bet
Enqum behaymanot ts’enten besga
Lehet’iyatachn dihnet yiqreta
Yaqoyuln yeabew qedemt

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya

VERSE 16
Yigebalna lint’ebq beewnet
Bahlawiwn yeabatoch tiwfit

CHORUS
Hele hele luya Halleluya
Bedebre tabor Halleluya
Geta tegelet’e Halleluya
Lihonen medhn Halleluya',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9bc8f75e-2dc8-48c1-b2ab-396bfc21c058'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 1
ቡሄ በሉ ሆ ቡሄ በሉ ሆ ልጆች ሁሉ ሆ
በተራራ ጫፍ ሆ በደብረ ታቦር ሆ
ጌታችኝ ቆሞ ሆ ታየ በክብር ሆ
ሙሴ ኤልያስ ሆ መጡ ካሉበት ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 2
ብርሃንን ለብሶ ሆ አዩት ሃዋርያት ሆ
መለኮት ተገለጠ ብርሃን አበራ (2)
አምላካችን ቆሞ ታየ በታቦር ተራራ(2)
ከደብሮች ልቀሽ ሆ ብርሃንን ለብሰሽ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 3
በታላቅ ግርማ ሆ አምላክ ታየብሽ ሆ
ልብሱ ነጭ ሆነ ሆ ሞላ ደመና ሆ
በታቦር ታየ ሆ የብርሃን ፋና ሆ
ደብረ ታቦር ታድለሻል የማይቻል ችለሻል (2

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 4
የትህትናውን አምላክ ክርስቶስን ይዘሻል(2
የአብ አባትነት ሆ የወልድም ልጅነት ሆ
በገሀድ ታየ ሆ ታወቀ በእውነት ሆ
የዳዊት ትንቢት ሆ ተፈጸመበት ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 5
ብሉይ ከሀዲስ ሆ ተገናኙበት ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
የእናቶች ባህል ሆ ያ የሙልሙሉ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 6
የበረከት ነው ሆ ይበላል ሁሉ ሆ
የአባቶች ችቦ ሆ ጨለማን ገፋ ሆ
የሰጠን ሰላም ሆ በአለም ይስፋ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 7
የታቦሩ ብርሃን ህይወት ይሁነን(2)
በጅራፍ ጩኸት ሆ ሰፈሩ ደምቆል ሆ
የቡሄ ችቦ ሆ ሊወጣ ቀርቧል ሆ
ጨለማው አልፎ ሆ ብርሃን ሲወጣ ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 8
በሉ እንዘምር ሆ ይራቀን ቁጣ ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
ክፈቱት ደጁን ሆ የጌታውን ሆ

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 9
ይባርክላችሁ ሆ ቤታችሁን ሆ
ሰጪውን ያብዛው ሆ አይንፈጋችሁ ሆ
ለዛሬ ዓመትም ሆ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 10
E(2)
ዓመት አውደ ዓመት ድገመና አመት ድገመና
በቀሪ እድሜያያችሁ ድገመና አመት ድገመና
ለማዕረግ ያብቃችሁ ድገመና አመት ድገመና

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 11
ቤታችሁ በረከት ድገመና አመት ድገመና
አይጣ በእውነት ድገመና አመት ድገመና
የታቦሩ ጌታ ድገመና አመት ድገመና
ይግባ ጠዋት ማታ ድገመና አመት ድገመና

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 12
ብዙ ያያሉ ገና ድገመና አመት ድገመና
ሰጥቶት ፍቅር ጤና ድገመና አመት ድገመና
ለዛሬ ያደረሰን አሜን
ይክበር ይመስገን አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 13
የሰማዩ አምላክ አሜን
ሰላሙን ይላክ አሜን
ለሀገራችን ፍቅር አሜን
ይሁን ክብር አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 14
ከንስሃ ህይወት አሜን
ያሳትፈን በእውነት አሜን
ለአመቱ ያድርሰን አሜን
ሳይለያየን አሜን

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 15
የቅዱሳን መላእክት የጻድቃን ሰማእታት ረድኤት በረከት ይግባ በሁሉም ቤት
እንቁም በሃይማኖት ጸንተን በስጋ
ለሀጢያታችን ድህነት ይቅረታ
ያቆዩልን የአበው ቀደምት

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ

VERSE 16
ይገባልና ልንጠብቅ በእውነት
ባህላዊውን የአባቶች ትውፊት

CHORUS
ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ሀሌ ሀሌ ሉያ ሃሌ ሉያ
በደብረ ታቦር ሃሌ ሉያ
ጌታ ተገለጠ ሃሌ ሉያ
ሊሆነን መድህን ሃሌ ሉያ
〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️
ቡሄ በሉ ሆ ቡሄ በሉ ሆ ልጆች ሁሉ ሆ
በተራራ ጫፍ ሆ በደብረ ታቦር ሆ
ጌታችኝ ቆሞ ሆ ታየ በክብር ሆ
ሙሴ ኤልያስ ሆ መጡ ካሉበት ሆ
ብርሃንን ለብሶ ሆ አዩት ሃዋርያት ሆ
መለኮት ተገለጠ ብርሃን አበራ (2)
አምላካችን ቆሞ ታየ በታቦር ተራራ(2)
〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️
ከደብሮች ልቀሽ ሆ ብርሃንን ለብሰሽ ሆ
በታላቅ ግርማ ሆ አምላክ ታየብሽ ሆ
ልብሱ ነጭ ሆነ ሆ ሞላ ደመና ሆ
በታቦር ታየ ሆ የብርሃን ፋና ሆ
ደብረ ታቦር ታድለሻል የማይቻል ችለሻል (2
የትህትናውን አምላክ ክርስቶስን ይዘሻል(2
〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️
የአብ አባትነት ሆ የወልድም ልጅነት ሆ
በገሀድ ታየ ሆ ታወቀ በእውነት ሆ
የዳዊት ትንቢት ሆ ተፈጸመበት ሆ
ብሉይ ከሀዲስ ሆ ተገናኙበት ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️
የእናቶች ባህል ሆ ያ የሙልሙሉ ሆ
የበረከት ነው ሆ ይበላል ሁሉ ሆ
የአባቶች ችቦ ሆ ጨለማን ገፋ ሆ
የሰጠን ሰላም ሆ በአለም ይስፋ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)
የታቦሩ ብርሃን ህይወት ይሁነን(2)
〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️
በጅራፍ ጩኸት ሆ ሰፈሩ ደምቆል ሆ
የቡሄ ችቦ ሆ ሊወጣ ቀርቧል ሆ
ጨለማው አልፎ ሆ ብርሃን ሲወጣ ሆ
በሉ እንዘምር ሆ ይራቀን ቁጣ ሆ
እርሱን ብቻ እንስማ ለዘለዓለም (2)
ያለስጋ ወደሙ ከቶ አንድንም(2)
〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️
ክፈቱት ደጁን ሆ የጌታውን ሆ
ይባርክላችሁ ሆ ቤታችሁን ሆ
ሰጪውን ያብዛው ሆ አይንፈጋችሁ ሆ
ለዛሬ ዓመትም ሆ ሆ
አምላካችን ይመስገን ስሙ ይግነን (2)
E(2)
〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️〽️
ዓመት አውደ ዓመት ድገመና አመት ድገመና
በቀሪ እድሜያያችሁ ድገመና አመት ድገመና
ለማዕረግ ያብቃችሁ ድገመና አመት ድገመና
ቤታችሁ በረከት ድገመና አመት ድገመና
አይጣ በእውነት ድገመና አመት ድገመና
የታቦሩ ጌታ ድገመና አመት ድገመና
ይግባ ጠዋት ማታ ድገመና አመት ድገመና
ብዙ ያያሉ ገና ድገመና አመት ድገመና
ሰጥቶት ፍቅር ጤና ድገመና አመት ድገመና
ለዛሬ ያደረሰን አሜን
ይክበር ይመስገን አሜን
የሰማዩ አምላክ አሜን
ሰላሙን ይላክ አሜን
ለሀገራችን ፍቅር አሜን
ይሁን ክብር አሜን
ከንስሃ ህይወት አሜን
ያሳትፈን በእውነት አሜን
ለአመቱ ያድርሰን አሜን
ሳይለያየን አሜን
የቅዱሳን መላእክት የጻድቃን ሰማእታት ረድኤት በረከት ይግባ በሁሉም ቤት
እንቁም በሃይማኖት ጸንተን በስጋ
ለሀጢያታችን ድህነት ይቅረታ
ያቆዩልን የአበው ቀደምት
ይገባልና ልንጠብቅ በእውነት
ባህላዊውን የአባቶች ትውፊት'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9bc8f75e-2dc8-48c1-b2ab-396bfc21c058'::uuid, 'hoyahoye-buha-belu-orthodox-mezmure', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- weta-keraniyo ("ወጣ ቀራንዮ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6049dcf4-2fc4-4180-bb40-ad8ab30e08a9'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 1
Amlakm sew hone befqr tereta
Silebedelachn tasro tengelata
Kesemay werede egnan yadn zend
Beayhud shengo fit qerebe lefrd

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 2
Nigus tekesese medhanit tet’ela
Ch’elema tewat’ech alem ersun seqla
Yeeshoh gungun aklil berasu lay deftew
Tezebabetubet abet kifatachew

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 3
Fitu dem lebese himemu bereta
Lik yelew tiegstu yeserawit Geta
Befqr eske mesqel yalteleyen keto
Hiywetn adelen motachnn moto

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 4
Bedem waga kasa beza left’retu
Lealem tegelet’e fits’um mihretu
Asrew debedebut qey gimjan lebese
Erqanun seqelut hulunm tagese

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 5
Yekeberen meswaet erasu asargo
Rasun meswaet teqebaym adrgo (2)

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 1
አምላክም ሰው ሆነ በፍቅር ተረታ
ስለበደላችን ታስሮ ተንገላታ
ከሰማይ ወረደ እኛን ያድን ዘንድ
በአይሁድ ሸንጎ ፊት ቀረበ ለፍርድ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 2
ንጉሥ ተከሰሰ መድኃኒት ተጠላ
ጨለማ ተዋጠች ዓለም እርሱን ሰቅላ
የእሾህ ጉንጉን አክሊል በራሱ ላይ ደፍተው
ተዘባበቱበት አቤት ክፋታቸው

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 3
ፊቱ ደም ለበሰ ሕመሙ በረታ
ልክ የለው ትዕግስቱ የሠራዊት ጌታ
በፍቅር እስከ መስቀል ያልተለየን ከቶ
ሕይወትን አደለን ሞታችንን ሞቶ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 4
በደም ዋጋ ካሳ ቤዛ ለፍጥረቱ
ለዓለም ተገለጠ ፍጹም ምህረቱ
አስረው ደበደቡት ቀይ ግምጃን ለበሰ
እርቃኑን ሰቀሉት ሁሉንም ታገሰ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 5
የከበረን መስዋዕት እራሱ አሳርጎ
ራሱን መስዋዕት ተቀባይም አድርጎ (2)

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 1
አምላክም ሰው ሆነ በፍቅር ተረታ
ስለበደላችን ታስሮ ተንገላታ
ከሰማይ ወረደ እኛን ያድን ዘንድ
በአይሁድ ሸንጎ ፊት ቀረበ ለፍርድ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 2
ንጉሥ ተከሰሰ መድኃኒት ተጠላ
ጨለማ ተዋጠች ዓለም እርሱን ሰቅላ
የእሾህ ጉንጉን አክሊል በራሱ ላይ ደፍተው
ተዘባበቱበት አቤት ክፋታቸው

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 3
ፊቱ ደም ለበሰ ሕመሙ በረታ
ልክ የለው ትዕግስቱ የሠራዊት ጌታ
በፍቅር እስከ መስቀል ያልተለየን ከቶ
ሕይወትን አደለን ሞታችንን ሞቶ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 4
በደም ዋጋ ካሳ ቤዛ ለፍጥረቱ
ለዓለም ተገለጠ ፍጹም ምህረቱ
አስረው ደበደቡት ቀይ ግምጃን ለበሰ
እርቃኑን ሰቀሉት ሁሉንም ታገሰ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 5
የከበረን መስዋዕት እራሱ አሳርጎ
ራሱን መስዋዕት ተቀባይም አድርጎ (2)

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ' THEN lyrics_amharic 
          ELSE 'CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 1
አምላክም ሰው ሆነ በፍቅር ተረታ
ስለበደላችን ታስሮ ተንገላታ
ከሰማይ ወረደ እኛን ያድን ዘንድ
በአይሁድ ሸንጎ ፊት ቀረበ ለፍርድ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 2
ንጉሥ ተከሰሰ መድኃኒት ተጠላ
ጨለማ ተዋጠች ዓለም እርሱን ሰቅላ
የእሾህ ጉንጉን አክሊል በራሱ ላይ ደፍተው
ተዘባበቱበት አቤት ክፋታቸው

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 3
ፊቱ ደም ለበሰ ሕመሙ በረታ
ልክ የለው ትዕግስቱ የሠራዊት ጌታ
በፍቅር እስከ መስቀል ያልተለየን ከቶ
ሕይወትን አደለን ሞታችንን ሞቶ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 4
በደም ዋጋ ካሳ ቤዛ ለፍጥረቱ
ለዓለም ተገለጠ ፍጹም ምህረቱ
አስረው ደበደቡት ቀይ ግምጃን ለበሰ
እርቃኑን ሰቀሉት ሁሉንም ታገሰ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 5
የከበረን መስዋዕት እራሱ አሳርጎ
ራሱን መስዋዕት ተቀባይም አድርጎ (2)

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ' 
        END,
        lyrics_transliteration = 'CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 1
Amlakm sew hone befqr tereta
Silebedelachn tasro tengelata
Kesemay werede egnan yadn zend
Beayhud shengo fit qerebe lefrd

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 2
Nigus tekesese medhanit tet’ela
Ch’elema tewat’ech alem ersun seqla
Yeeshoh gungun aklil berasu lay deftew
Tezebabetubet abet kifatachew

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 3
Fitu dem lebese himemu bereta
Lik yelew tiegstu yeserawit Geta
Befqr eske mesqel yalteleyen keto
Hiywetn adelen motachnn moto

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 4
Bedem waga kasa beza left’retu
Lealem tegelet’e fits’um mihretu
Asrew debedebut qey gimjan lebese
Erqanun seqelut hulunm tagese

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda

VERSE 5
Yekeberen meswaet erasu asargo
Rasun meswaet teqebaym adrgo (2)

CHORUS
Wet’a qeranyo demun eyezera
Mesqel teshekmo ts’enabet mekera
Bemebl binwedq binyazm beeda
40 qen 40 let ts’ome midre beda',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6049dcf4-2fc4-4180-bb40-ad8ab30e08a9'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 1
አምላክም ሰው ሆነ በፍቅር ተረታ
ስለበደላችን ታስሮ ተንገላታ
ከሰማይ ወረደ እኛን ያድን ዘንድ
በአይሁድ ሸንጎ ፊት ቀረበ ለፍርድ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 2
ንጉሥ ተከሰሰ መድኃኒት ተጠላ
ጨለማ ተዋጠች ዓለም እርሱን ሰቅላ
የእሾህ ጉንጉን አክሊል በራሱ ላይ ደፍተው
ተዘባበቱበት አቤት ክፋታቸው

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 3
ፊቱ ደም ለበሰ ሕመሙ በረታ
ልክ የለው ትዕግስቱ የሠራዊት ጌታ
በፍቅር እስከ መስቀል ያልተለየን ከቶ
ሕይወትን አደለን ሞታችንን ሞቶ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 4
በደም ዋጋ ካሳ ቤዛ ለፍጥረቱ
ለዓለም ተገለጠ ፍጹም ምህረቱ
አስረው ደበደቡት ቀይ ግምጃን ለበሰ
እርቃኑን ሰቀሉት ሁሉንም ታገሰ

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ

VERSE 5
የከበረን መስዋዕት እራሱ አሳርጎ
ራሱን መስዋዕት ተቀባይም አድርጎ (2)

CHORUS
ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ወጣ ቀራንዮ ደሙን እየዘራ
መስቀል ተሸክሞ ጸናበት መከራ
በመብል ብንወድቅ ብንያዝም በእዳ
40 ቀን 40 ሌት ጾመ ምድረ በዳ
አምላክም ሰው ሆነ በፍቅር ተረታ
ስለበደላችን ታስሮ ተንገላታ
ከሰማይ ወረደ እኛን ያድን ዘንድ
በአይሁድ ሸንጎ ፊት ቀረበ ለፍርድ
ንጉሥ ተከሰሰ መድኃኒት ተጠላ
ጨለማ ተዋጠች ዓለም እርሱን ሰቅላ
የእሾህ ጉንጉን አክሊል በራሱ ላይ ደፍተው
ተዘባበቱበት አቤት ክፋታቸው
ፊቱ ደም ለበሰ ሕመሙ በረታ
ልክ የለው ትዕግስቱ የሠራዊት ጌታ
በፍቅር እስከ መስቀል ያልተለየን ከቶ
ሕይወትን አደለን ሞታችንን ሞቶ
በደም ዋጋ ካሳ ቤዛ ለፍጥረቱ
ለዓለም ተገለጠ ፍጹም ምህረቱ
አስረው ደበደቡት ቀይ ግምጃን ለበሰ
እርቃኑን ሰቀሉት ሁሉንም ታገሰ
የከበረን መስዋዕት እራሱ አሳርጎ
ራሱን መስዋዕት ተቀባይም አድርጎ (2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6049dcf4-2fc4-4180-bb40-ad8ab30e08a9'::uuid, 'weta-keraniyo', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-eti-nmkiho ("እቲ ንምክሖ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a1a628dc-2323-4784-a8f7-dc0d7bb1954e'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 1
Nab betna kiatu yiኹhኹh''yu zelo
Niseme entlena
Nay libna maets’o hiji nikfetelu
Kinebr misana

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 2
Fits’ame hasabna mist’ir nay awetna
Sirah amlakna eyu aykonen kabana
Emo aynmekah ab haylna aynemen
Sele senay gibru nieu nemesgn (2)

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 3
Halafit hiwetna natna timeslena
Wana yidelya alo nerekbo ina
Efoyta kitrekb nabu nemaeቑba
Hade ilna nihnets’a biቓlu nindeqa (2)

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 4
Liel''ti nihasbo zefqrena goyta
Nits’orna zits’ere kisab golegota
Hiji''win entekone keragf sheኸmna
Diluw eyu zelo kihadg hat’iatna (2)

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 5
Nikrstos zigebro minch’i nay timkhtu
Bithtna yisero niwedit ts’elaetu
Biselam yindq menfes yirege
Nich’nqet eza alem haghigu yewts’e (2)

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 1
ናብ ቤትና ክኣቱ ይኹሕኹሕ''ዩ ዘሎ
ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንክፈተሉ
ክነብር ምሳና

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 2
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላክና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
ሰለ ሰናይ ግብሩ ንዕኡ ነመስግን(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 3
ሓላፊት ሂወትና ናትና ትመስለና
ዋንኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቑባ
ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 4
ልዕል''ቲ ንሓስቦ ዘፍቅረና ጎይታ
ንጾርና ዝጸረ ክሳብ ጎለጎታ
ሕጂ''ውን እንተኮነ ከራግፍ ሸኸምና
ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 5
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንወዲት ጸላእቱ
ብሰላም ይንድቅ መንፈስ ይረግእ
ንጭንቀት እዛ ዓለም ሓግሒጉ የውጽእ(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 1
ናብ ቤትና ክኣቱ ይኹሕኹሕ''ዩ ዘሎ
ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንክፈተሉ
ክነብር ምሳና

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 2
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላክና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
ሰለ ሰናይ ግብሩ ንዕኡ ነመስግን(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 3
ሓላፊት ሂወትና ናትና ትመስለና
ዋንኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቑባ
ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 4
ልዕል''ቲ ንሓስቦ ዘፍቅረና ጎይታ
ንጾርና ዝጸረ ክሳብ ጎለጎታ
ሕጂ''ውን እንተኮነ ከራግፍ ሸኸምና
ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 5
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንወዲት ጸላእቱ
ብሰላም ይንድቅ መንፈስ ይረግእ
ንጭንቀት እዛ ዓለም ሓግሒጉ የውጽእ(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ' THEN lyrics_amharic 
          ELSE 'CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 1
ናብ ቤትና ክኣቱ ይኹሕኹሕ''ዩ ዘሎ
ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንክፈተሉ
ክነብር ምሳና

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 2
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላክና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
ሰለ ሰናይ ግብሩ ንዕኡ ነመስግን(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 3
ሓላፊት ሂወትና ናትና ትመስለና
ዋንኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቑባ
ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 4
ልዕል''ቲ ንሓስቦ ዘፍቅረና ጎይታ
ንጾርና ዝጸረ ክሳብ ጎለጎታ
ሕጂ''ውን እንተኮነ ከራግፍ ሸኸምና
ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 5
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንወዲት ጸላእቱ
ብሰላም ይንድቅ መንፈስ ይረግእ
ንጭንቀት እዛ ዓለም ሓግሒጉ የውጽእ(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ' 
        END,
        lyrics_transliteration = 'CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 1
Nab betna kiatu yiኹhኹh''yu zelo
Niseme entlena
Nay libna maets’o hiji nikfetelu
Kinebr misana

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 2
Fits’ame hasabna mist’ir nay awetna
Sirah amlakna eyu aykonen kabana
Emo aynmekah ab haylna aynemen
Sele senay gibru nieu nemesgn (2)

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 3
Halafit hiwetna natna timeslena
Wana yidelya alo nerekbo ina
Efoyta kitrekb nabu nemaeቑba
Hade ilna nihnets’a biቓlu nindeqa (2)

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 4
Liel''ti nihasbo zefqrena goyta
Nits’orna zits’ere kisab golegota
Hiji''win entekone keragf sheኸmna
Diluw eyu zelo kihadg hat’iatna (2)

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah

VERSE 5
Nikrstos zigebro minch’i nay timkhtu
Bithtna yisero niwedit ts’elaetu
Biselam yindq menfes yirege
Nich’nqet eza alem haghigu yewts’e (2)

CHORUS
Eti nimkho biegziabher yikun
Bihaylu nimekah
Nikndhn''win ab iyerusalem
Ab meqdesu nits’nah',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a1a628dc-2323-4784-a8f7-dc0d7bb1954e'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 1
ናብ ቤትና ክኣቱ ይኹሕኹሕ''ዩ ዘሎ
ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንክፈተሉ
ክነብር ምሳና

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 2
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላክና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
ሰለ ሰናይ ግብሩ ንዕኡ ነመስግን(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 3
ሓላፊት ሂወትና ናትና ትመስለና
ዋንኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቑባ
ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 4
ልዕል''ቲ ንሓስቦ ዘፍቅረና ጎይታ
ንጾርና ዝጸረ ክሳብ ጎለጎታ
ሕጂ''ውን እንተኮነ ከራግፍ ሸኸምና
ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ

VERSE 5
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንወዲት ጸላእቱ
ብሰላም ይንድቅ መንፈስ ይረግእ
ንጭንቀት እዛ ዓለም ሓግሒጉ የውጽእ(2)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እቲ ንምክሖ ብእግዚኣብሄር ይኩን
ብሓይሉ ንመካሕ
ንክንድሕን''ውን ኣብ ኢየሩሳሌም
ኣብ መቅደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይኹሕኹሕ''ዩ ዘሎ
ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንክፈተሉ
ክነብር ምሳና
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላክና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
ሰለ ሰናይ ግብሩ ንዕኡ ነመስግን(2)
ሓላፊት ሂወትና ናትና ትመስለና
ዋንኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቑባ
ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ(2)
ልዕል''ቲ ንሓስቦ ዘፍቅረና ጎይታ
ንጾርና ዝጸረ ክሳብ ጎለጎታ
ሕጂ''ውን እንተኮነ ከራግፍ ሸኸምና
ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና(2)
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንወዲት ጸላእቱ
ብሰላም ይንድቅ መንፈስ ይረግእ
ንጭንቀት እዛ ዓለም ሓግሒጉ የውጽእ(2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a1a628dc-2323-4784-a8f7-dc0d7bb1954e'::uuid, 'eritrean-orthodox-tewahdo-mezmur-eti-nmkiho', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-hiwetu-mulue ("ህይወቱ ሙሉእ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e0932437-fdc4-463b-a057-d3604c600baa'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 1
Bezen aeyntna ayreanan biaezanna aysemaenan
Aytets’ahfen ayenbebnan abotatna''win kab qedem kab t’nti aynegerunan
Tesfa ቖrits’u eti diኹm libna gwahi kidfo
Kwilu enkts’emm ts’egemna keysemo

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 2
Ayhadegenan aymenenenan (2)
Kemzi iኻ kemti keybele koynuna''yu medhn
Uret aeyntey biwegen zemedey kem mergem kiቚts’er
Simey migdur koynu bisebat kimrer

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 3
Ts’elmat hiywetey biaኻ berihu (2)
Ab wisht’ey yenjerbb alo hisemey galihu
Alem merira binefsi bisga ts’ora kiኸbdeni
Eshoኽ amekela zuryay kiኸbeni

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 4
Sheኽmey aቕlilka anagifkani (2)
Niaኻ zihbo goytay ane entay aleni
Gwidgwad anabs kiwerd kisndo bimኽri resian
Danel moytu''yu kiwre babilon

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 5
Nigde asnanom aywefeyenn (2)
Biayney rieyo aleኹ nay amlaኸy midhan

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 1
በዘን ኣዕይንትና ኣይረኣናን ብኣእዛንና ኣይሰማዕናን
ኣይተጻሕፈን ኣየንበብናን ኣቦታትና''ውን ካብ ቀደም ካብ ጥንቲ ኣይነገሩናን
ተስፋ ቖሪጹ እቲ ድኹም ልብና ጓሂ ክድፍኦ
ኲሉ እንክጸምም ጸገምና ከይሰምዖ

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 2
ኣይሓደገናን ኣይመነነናን (2)
ከምዚ ኢኻ ከምቲ ከይበለ ኮይኑና''ዩ መድሕን
ዑረት ኣዕይንተይ ብወገን ዘመደይ ከም መርገም ክቚጸር
ስመይ ምግዱር ኮይኑ ብሰባት ክምረር

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 3
ጸልማት ሕይወተይ ብኣኻ በሪሁ (2)
ኣብ ውሽጠይ የንጀርብብ ኣሎ ሕሰመይ ጋሊሁ
ዓለም መሪራ ብነፍሲ ብስጋ ፆራ ክኸብደኒ
እሾኽ ኣሜከላ ዙርያይ ክኸበኒ

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 4
ሸኽመይ ኣቕሊልካ ኣናጊፍካኒ (2)
ንዓኻ ዝህቦ ጎይታይ ኣነ እንታይ ኣለኒ
ጒድጓድ ኣናብስ ክወርድ ክስንዶ ብምኽሪ ረሲኣን
ዳንኤል ሞይቱ''ዩ ክውረ ባቢሎን

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 5
ንግደ ኣስናኖም ኣይወፈየንን(2)
ብዓይነይ ርኤዮ ኣለኹ ናይ ኣምላኸይ ምድሓን

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 1
በዘን ኣዕይንትና ኣይረኣናን ብኣእዛንና ኣይሰማዕናን
ኣይተጻሕፈን ኣየንበብናን ኣቦታትና''ውን ካብ ቀደም ካብ ጥንቲ ኣይነገሩናን
ተስፋ ቖሪጹ እቲ ድኹም ልብና ጓሂ ክድፍኦ
ኲሉ እንክጸምም ጸገምና ከይሰምዖ

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 2
ኣይሓደገናን ኣይመነነናን (2)
ከምዚ ኢኻ ከምቲ ከይበለ ኮይኑና''ዩ መድሕን
ዑረት ኣዕይንተይ ብወገን ዘመደይ ከም መርገም ክቚጸር
ስመይ ምግዱር ኮይኑ ብሰባት ክምረር

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 3
ጸልማት ሕይወተይ ብኣኻ በሪሁ (2)
ኣብ ውሽጠይ የንጀርብብ ኣሎ ሕሰመይ ጋሊሁ
ዓለም መሪራ ብነፍሲ ብስጋ ፆራ ክኸብደኒ
እሾኽ ኣሜከላ ዙርያይ ክኸበኒ

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 4
ሸኽመይ ኣቕሊልካ ኣናጊፍካኒ (2)
ንዓኻ ዝህቦ ጎይታይ ኣነ እንታይ ኣለኒ
ጒድጓድ ኣናብስ ክወርድ ክስንዶ ብምኽሪ ረሲኣን
ዳንኤል ሞይቱ''ዩ ክውረ ባቢሎን

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 5
ንግደ ኣስናኖም ኣይወፈየንን(2)
ብዓይነይ ርኤዮ ኣለኹ ናይ ኣምላኸይ ምድሓን

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ' THEN lyrics_amharic 
          ELSE 'CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 1
በዘን ኣዕይንትና ኣይረኣናን ብኣእዛንና ኣይሰማዕናን
ኣይተጻሕፈን ኣየንበብናን ኣቦታትና''ውን ካብ ቀደም ካብ ጥንቲ ኣይነገሩናን
ተስፋ ቖሪጹ እቲ ድኹም ልብና ጓሂ ክድፍኦ
ኲሉ እንክጸምም ጸገምና ከይሰምዖ

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 2
ኣይሓደገናን ኣይመነነናን (2)
ከምዚ ኢኻ ከምቲ ከይበለ ኮይኑና''ዩ መድሕን
ዑረት ኣዕይንተይ ብወገን ዘመደይ ከም መርገም ክቚጸር
ስመይ ምግዱር ኮይኑ ብሰባት ክምረር

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 3
ጸልማት ሕይወተይ ብኣኻ በሪሁ (2)
ኣብ ውሽጠይ የንጀርብብ ኣሎ ሕሰመይ ጋሊሁ
ዓለም መሪራ ብነፍሲ ብስጋ ፆራ ክኸብደኒ
እሾኽ ኣሜከላ ዙርያይ ክኸበኒ

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 4
ሸኽመይ ኣቕሊልካ ኣናጊፍካኒ (2)
ንዓኻ ዝህቦ ጎይታይ ኣነ እንታይ ኣለኒ
ጒድጓድ ኣናብስ ክወርድ ክስንዶ ብምኽሪ ረሲኣን
ዳንኤል ሞይቱ''ዩ ክውረ ባቢሎን

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 5
ንግደ ኣስናኖም ኣይወፈየንን(2)
ብዓይነይ ርኤዮ ኣለኹ ናይ ኣምላኸይ ምድሓን

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ' 
        END,
        lyrics_transliteration = 'CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 1
Bezen aeyntna ayreanan biaezanna aysemaenan
Aytets’ahfen ayenbebnan abotatna''win kab qedem kab t’nti aynegerunan
Tesfa ቖrits’u eti diኹm libna gwahi kidfo
Kwilu enkts’emm ts’egemna keysemo

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 2
Ayhadegenan aymenenenan (2)
Kemzi iኻ kemti keybele koynuna''yu medhn
Uret aeyntey biwegen zemedey kem mergem kiቚts’er
Simey migdur koynu bisebat kimrer

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 3
Ts’elmat hiywetey biaኻ berihu (2)
Ab wisht’ey yenjerbb alo hisemey galihu
Alem merira binefsi bisga ts’ora kiኸbdeni
Eshoኽ amekela zuryay kiኸbeni

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 4
Sheኽmey aቕlilka anagifkani (2)
Niaኻ zihbo goytay ane entay aleni
Gwidgwad anabs kiwerd kisndo bimኽri resian
Danel moytu''yu kiwre babilon

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru

VERSE 5
Nigde asnanom aywefeyenn (2)
Biayney rieyo aleኹ nay amlaኸy midhan

CHORUS
Hiywetu milue ab egziabher tewekilu
Niegziabher aminu nismu alilu
Tehadigu wey''si hafiru
Zibl zanta''do semiekum tifelt’u eski nigeru',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e0932437-fdc4-463b-a057-d3604c600baa'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 1
በዘን ኣዕይንትና ኣይረኣናን ብኣእዛንና ኣይሰማዕናን
ኣይተጻሕፈን ኣየንበብናን ኣቦታትና''ውን ካብ ቀደም ካብ ጥንቲ ኣይነገሩናን
ተስፋ ቖሪጹ እቲ ድኹም ልብና ጓሂ ክድፍኦ
ኲሉ እንክጸምም ጸገምና ከይሰምዖ

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 2
ኣይሓደገናን ኣይመነነናን (2)
ከምዚ ኢኻ ከምቲ ከይበለ ኮይኑና''ዩ መድሕን
ዑረት ኣዕይንተይ ብወገን ዘመደይ ከም መርገም ክቚጸር
ስመይ ምግዱር ኮይኑ ብሰባት ክምረር

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 3
ጸልማት ሕይወተይ ብኣኻ በሪሁ (2)
ኣብ ውሽጠይ የንጀርብብ ኣሎ ሕሰመይ ጋሊሁ
ዓለም መሪራ ብነፍሲ ብስጋ ፆራ ክኸብደኒ
እሾኽ ኣሜከላ ዙርያይ ክኸበኒ

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 4
ሸኽመይ ኣቕሊልካ ኣናጊፍካኒ (2)
ንዓኻ ዝህቦ ጎይታይ ኣነ እንታይ ኣለኒ
ጒድጓድ ኣናብስ ክወርድ ክስንዶ ብምኽሪ ረሲኣን
ዳንኤል ሞይቱ''ዩ ክውረ ባቢሎን

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ

VERSE 5
ንግደ ኣስናኖም ኣይወፈየንን(2)
ብዓይነይ ርኤዮ ኣለኹ ናይ ኣምላኸይ ምድሓን

CHORUS
ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ሕይወቱ ምሉእ ኣብ እግዚኣብሔር ተወኪሉ
ንእግዚኣብሔር ኣሚኑ ንስሙ ኣልዒሉ
ተሓዲጉ ወይ''ሲ ሓፊሩ
ዝብል ዛንታ''ዶ ሰሚዕኩም ትፈልጡ እስኪ ንገሩ
በዘን ኣዕይንትና ኣይረኣናን ብኣእዛንና ኣይሰማዕናን
ኣይተጻሕፈን ኣየንበብናን ኣቦታትና''ውን ካብ ቀደም ካብ ጥንቲ ኣይነገሩናን
ተስፋ ቖሪጹ እቲ ድኹም ልብና ጓሂ ክድፍኦ
ኲሉ እንክጸምም ጸገምና ከይሰምዖ
ኣይሓደገናን ኣይመነነናን (2)
ከምዚ ኢኻ ከምቲ ከይበለ ኮይኑና''ዩ መድሕን
ዑረት ኣዕይንተይ ብወገን ዘመደይ ከም መርገም ክቚጸር
ስመይ ምግዱር ኮይኑ ብሰባት ክምረር
ጸልማት ሕይወተይ ብኣኻ በሪሁ (2)
ኣብ ውሽጠይ የንጀርብብ ኣሎ ሕሰመይ ጋሊሁ
ዓለም መሪራ ብነፍሲ ብስጋ ፆራ ክኸብደኒ
እሾኽ ኣሜከላ ዙርያይ ክኸበኒ
ሸኽመይ ኣቕሊልካ ኣናጊፍካኒ (2)
ንዓኻ ዝህቦ ጎይታይ ኣነ እንታይ ኣለኒ
ጒድጓድ ኣናብስ ክወርድ ክስንዶ ብምኽሪ ረሲኣን
ዳንኤል ሞይቱ''ዩ ክውረ ባቢሎን
ንግደ ኣስናኖም ኣይወፈየንን(2)
ብዓይነይ ርኤዮ ኣለኹ ናይ ኣምላኸይ ምድሓን'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e0932437-fdc4-463b-a057-d3604c600baa'::uuid, 'eritrean-orthodox-tewahdo-mezmur-hiwetu-mulue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mezmur-eti-nimikho ("እቲ ንምክሖ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ae7c3bcb-7f38-4787-a4f9-8b11e2dc0c25'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana

VERSE 1
Fits’ame hasabna mist’ir nay awetna
Sirah amlaኽna eyu aykonen kabana
Emo aynmekah ab haylna aynemen
(sile senay gibru nieu nemesgn) (2)

CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana

VERSE 2
Halafit hiywetna natna timeslena
Wanaa yidelya alo nerekbo ina
Efoyta kitrekb nabu nemaeqwiba
(hade ilna nihnets’a biቓlu nindeqa) (2)

CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana

VERSE 3
Lieli eti nihasbo zefqerena goyta
Nits’orna zits’ore kisab golgota
Hiji ewn entekone keragf sheኸmna
(diluw eyu zelo kihadg hat’iatna) (2)

CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana

VERSE 4
Nikrstos zigebro minch’i nay timkhtu
Bithtna yisero niwdit ts’elaetu
Biselam yindeቕ menfesu yirege

CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 1
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላኽና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
(ስለ ሰናይ ግብሩ ንዕኡ ነመስግን) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 2
ሓላፊት ህይወትና ናትና ትመስለና
ዋናኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቊባ
(ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 3
ልዕሊ እቲ ንሓስቦ ዘፍቀረና ጎይታ
ንጾርና ዝጾረ ክሳብ ጎልጎታ
ሕጂ እውን እንተኮነ ከራግፍ ሸኸምና
(ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 4
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንውዲት ጸላእቱ
ብሰላም ይንደቕ መንፈሱ ይረግእ

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 1
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላኽና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
(ስለ ሰናይ ግብሩ ንዕኡ ነመስግን) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 2
ሓላፊት ህይወትና ናትና ትመስለና
ዋናኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቊባ
(ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 3
ልዕሊ እቲ ንሓስቦ ዘፍቀረና ጎይታ
ንጾርና ዝጾረ ክሳብ ጎልጎታ
ሕጂ እውን እንተኮነ ከራግፍ ሸኸምና
(ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 4
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንውዲት ጸላእቱ
ብሰላም ይንደቕ መንፈሱ ይረግእ

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና' THEN lyrics_amharic 
          ELSE 'CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 1
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላኽና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
(ስለ ሰናይ ግብሩ ንዕኡ ነመስግን) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 2
ሓላፊት ህይወትና ናትና ትመስለና
ዋናኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቊባ
(ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 3
ልዕሊ እቲ ንሓስቦ ዘፍቀረና ጎይታ
ንጾርና ዝጾረ ክሳብ ጎልጎታ
ሕጂ እውን እንተኮነ ከራግፍ ሸኸምና
(ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 4
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንውዲት ጸላእቱ
ብሰላም ይንደቕ መንፈሱ ይረግእ

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና' 
        END,
        lyrics_transliteration = 'CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana

VERSE 1
Fits’ame hasabna mist’ir nay awetna
Sirah amlaኽna eyu aykonen kabana
Emo aynmekah ab haylna aynemen
(sile senay gibru nieu nemesgn) (2)

CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana

VERSE 2
Halafit hiywetna natna timeslena
Wanaa yidelya alo nerekbo ina
Efoyta kitrekb nabu nemaeqwiba
(hade ilna nihnets’a biቓlu nindeqa) (2)

CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana

VERSE 3
Lieli eti nihasbo zefqerena goyta
Nits’orna zits’ore kisab golgota
Hiji ewn entekone keragf sheኸmna
(diluw eyu zelo kihadg hat’iatna) (2)

CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana

VERSE 4
Nikrstos zigebro minch’i nay timkhtu
Bithtna yisero niwdit ts’elaetu
Biselam yindeቕ menfesu yirege

CHORUS
Eti nimkho biegziabher yiኹn bihaylu nimekah
Niኽndhn ewn ab iyerusalem ab meቕdesu nits’nah
Nab betna kiatu yikhwihkwh eyu zelo niseme entlena
Nay libna maets’o hiji niኽfetelu kinebr misana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ae7c3bcb-7f38-4787-a4f9-8b11e2dc0c25'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 1
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላኽና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
(ስለ ሰናይ ግብሩ ንዕኡ ነመስግን) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 2
ሓላፊት ህይወትና ናትና ትመስለና
ዋናኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቊባ
(ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 3
ልዕሊ እቲ ንሓስቦ ዘፍቀረና ጎይታ
ንጾርና ዝጾረ ክሳብ ጎልጎታ
ሕጂ እውን እንተኮነ ከራግፍ ሸኸምና
(ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና) (፪)

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና

VERSE 4
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንውዲት ጸላእቱ
ብሰላም ይንደቕ መንፈሱ ይረግእ

CHORUS
እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እቲ ንምክሖ ብእግዚኣብሄር ይኹን ብሓይሉ ንመካሕ
ንኽንድሕን እውን ኣብ ኢየሩሳሌም ኣብ መቕደሱ ንጽናሕ
ናብ ቤትና ክኣቱ ይዂሕኵሕ እዩ ዘሎ ንሰምዕ እንትለና
ናይ ልብና ማዕጾ ሕጂ ንኽፈተሉ ክነብር ምሳና
ፍጻሜ ሓሳብና ምስጢር ናይ ዓወትና
ስራሕ ኣምላኽና እዩ ኣይኮነን ካባና
እሞ ኣይንመካሕ ኣብ ሓይልና ኣይንእመን
(ስለ ሰናይ ግብሩ ንዕኡ ነመስግን) (፪)
ሓላፊት ህይወትና ናትና ትመስለና
ዋናኣ ይደልያ ኣሎ ነረክቦ ኢና
እፎይታ ክትረክብ ናብኡ ነማዕቊባ
(ሓደ ኢልና ንህነጻ ብቓሉ ንንደቃ) (፪)
ልዕሊ እቲ ንሓስቦ ዘፍቀረና ጎይታ
ንጾርና ዝጾረ ክሳብ ጎልጎታ
ሕጂ እውን እንተኮነ ከራግፍ ሸኸምና
(ድሉው እዩ ዘሎ ክሓድግ ሓጢኣትና) (፪)
ንክርስቶስ ዝገብሮ ምንጪ ናይ ትምክሕቱ
ብትሕትና ይስዕሮ ንውዲት ጸላእቱ
ብሰላም ይንደቕ መንፈሱ ይረግእ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ae7c3bcb-7f38-4787-a4f9-8b11e2dc0c25'::uuid, 'mezmur-eti-nimikho', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zxgo-emba-yelen ("ዝጽግዖ እምባ የለን ኦርቶዶክስ ትግርኛ መዝሙር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e559a612-1258-4a09-9af6-8fa8517f58c6'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zits’go emba yelen
Bizeyaka Kidus kerenka
Gedey aykonen zirsti
Ezi midrawi ketema

VERSE 1
Ente tegaezku nibeyney
Bihasabey timerihe
Niamlaኽy wetru misy kun
Mirhani nabti zihashe

CHORUS
Zits’go emba yelen
Bizeyaka Kidus kerenka
Gedey aykonen zirsti
Ezi midrawi ketema

VERSE 2
Nigbats’i ente hanets’kuwa
Emni Ab riesi emni anbire
Zeblech’lch’''win
Enteኾne bizh deኺme ts’ire

CHORUS
Zits’go emba yelen
Bizeyaka Kidus kerenka
Gedey aykonen zirsti
Ezi midrawi ketema

VERSE 3
Biftawey meas koynnu
Hayli feron gedduni
Barnetey reiኻ gin bahri kefilka awts’ikani

CHORUS
Zits’go emba yelen
Bizeyaka Kidus kerenka
Gedey aykonen zirsti
Ezi midrawi ketema'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 1
እንተ ተጋዕዝኩ ንበይነይ
ብሓሳበይ ትመሪሐ
ንአምላኽይ ወትሩ ምስይ ኩን
ምርሓኒ ናብቲ ዝሓሸ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 2
ንግባጺ እንተ ሃነጽኩዋ
እምኒ አብ ርእሲ እምኒ አንቢረ
ዘብለጭልጭ''ውን
እንተኾነ ብዝሕ ደኺመ ጽዒረ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 3
ብፍታወይ መዓስ ኮይንኑ
ሓይሊ ፈርኦን ገድዱኒ
ባርነተይ ረኢኻ ግን ባሕሪ ከፊልካ ኣውጺካኒ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 1
እንተ ተጋዕዝኩ ንበይነይ
ብሓሳበይ ትመሪሐ
ንአምላኽይ ወትሩ ምስይ ኩን
ምርሓኒ ናብቲ ዝሓሸ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 2
ንግባጺ እንተ ሃነጽኩዋ
እምኒ አብ ርእሲ እምኒ አንቢረ
ዘብለጭልጭ''ውን
እንተኾነ ብዝሕ ደኺመ ጽዒረ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 3
ብፍታወይ መዓስ ኮይንኑ
ሓይሊ ፈርኦን ገድዱኒ
ባርነተይ ረኢኻ ግን ባሕሪ ከፊልካ ኣውጺካኒ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ' THEN lyrics_amharic 
          ELSE 'CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 1
እንተ ተጋዕዝኩ ንበይነይ
ብሓሳበይ ትመሪሐ
ንአምላኽይ ወትሩ ምስይ ኩን
ምርሓኒ ናብቲ ዝሓሸ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 2
ንግባጺ እንተ ሃነጽኩዋ
እምኒ አብ ርእሲ እምኒ አንቢረ
ዘብለጭልጭ''ውን
እንተኾነ ብዝሕ ደኺመ ጽዒረ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 3
ብፍታወይ መዓስ ኮይንኑ
ሓይሊ ፈርኦን ገድዱኒ
ባርነተይ ረኢኻ ግን ባሕሪ ከፊልካ ኣውጺካኒ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ' 
        END,
        lyrics_transliteration = 'CHORUS
Zits’go emba yelen
Bizeyaka Kidus kerenka
Gedey aykonen zirsti
Ezi midrawi ketema

VERSE 1
Ente tegaezku nibeyney
Bihasabey timerihe
Niamlaኽy wetru misy kun
Mirhani nabti zihashe

CHORUS
Zits’go emba yelen
Bizeyaka Kidus kerenka
Gedey aykonen zirsti
Ezi midrawi ketema

VERSE 2
Nigbats’i ente hanets’kuwa
Emni Ab riesi emni anbire
Zeblech’lch’''win
Enteኾne bizh deኺme ts’ire

CHORUS
Zits’go emba yelen
Bizeyaka Kidus kerenka
Gedey aykonen zirsti
Ezi midrawi ketema

VERSE 3
Biftawey meas koynnu
Hayli feron gedduni
Barnetey reiኻ gin bahri kefilka awts’ikani

CHORUS
Zits’go emba yelen
Bizeyaka Kidus kerenka
Gedey aykonen zirsti
Ezi midrawi ketema',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e559a612-1258-4a09-9af6-8fa8517f58c6'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 1
እንተ ተጋዕዝኩ ንበይነይ
ብሓሳበይ ትመሪሐ
ንአምላኽይ ወትሩ ምስይ ኩን
ምርሓኒ ናብቲ ዝሓሸ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 2
ንግባጺ እንተ ሃነጽኩዋ
እምኒ አብ ርእሲ እምኒ አንቢረ
ዘብለጭልጭ''ውን
እንተኾነ ብዝሕ ደኺመ ጽዒረ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ

VERSE 3
ብፍታወይ መዓስ ኮይንኑ
ሓይሊ ፈርኦን ገድዱኒ
ባርነተይ ረኢኻ ግን ባሕሪ ከፊልካ ኣውጺካኒ

CHORUS
ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ዝጽግዖ እምባ የለን
ብዘያካ ቅዱስ ከረንካ
ገደይ ኣይኮነን ዝርስቲ
እዚ ምድራዊ ከተማ
እንተ ተጋዕዝኩ ንበይነይ
ብሓሳበይ ትመሪሐ
ንአምላኽይ ወትሩ ምስይ ኩን
ምርሓኒ ናብቲ ዝሓሸ
ንግባጺ እንተ ሃነጽኩዋ
እምኒ አብ ርእሲ እምኒ አንቢረ
ዘብለጭልጭ''ውን
እንተኾነ ብዝሕ ደኺመ ጽዒረ
ብፍታወይ መዓስ ኮይንኑ
ሓይሊ ፈርኦን ገድዱኒ
ባርነተይ ረኢኻ ግን ባሕሪ ከፊልካ ኣውጺካኒ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e559a612-1258-4a09-9af6-8fa8517f58c6'::uuid, 'zxgo-emba-yelen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- there-is-power-in-your-words-2203 ("ድል አለ በስምህ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e4f8c495-5561-49a3-90c7-7c00409c800a'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 1
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Kadesh the great frightening desert
We have passed through without feeling thirst

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 2
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty
There is power in Your words and victory in Your name (2)

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 3
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
The walls of Jericho fell with shouts
Enemies will fall without a doubt

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 4
Marvelous how we took the city
It is by your will God almighty
It is by your will Lord almighty
There is power in Your words and victory in Your name

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 5
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Surpassing the trials and hardships
The marah water changed from tasteless

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 6
If we receive manna from above
Its because you are the God of Love
There is power in Your words and victory in Your name (2)
The mountains will tremble Emmanual I proclaim

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 7
The seas will part again my Savior I proclaim
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 8
Through your grace you changed our story
There is power in Your words and victory in Your name (2)
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 9
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 1
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Kadesh the great frightening desert
We have passed through without feeling thirst

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 2
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty
There is power in Your words and victory in Your name /2/

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 3
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
The walls of Jericho fell with shouts
Enemies will fall without a doubt

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 4
Marvelous how we took the city
It is by your will God almighty
It is by your will Lord almighty
There is power in Your words and victory in Your name

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 5
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Surpassing the trials and hardships
The marah water changed from tasteless

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 6
If we receive manna from above
Its because you are the God of Love
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 7
The seas will part again my Savior I proclaim
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 8
Through your grace you changed our story
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 9
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 1
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Kadesh the great frightening desert
We have passed through without feeling thirst

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 2
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty
There is power in Your words and victory in Your name /2/

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 3
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
The walls of Jericho fell with shouts
Enemies will fall without a doubt

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 4
Marvelous how we took the city
It is by your will God almighty
It is by your will Lord almighty
There is power in Your words and victory in Your name

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 5
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Surpassing the trials and hardships
The marah water changed from tasteless

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 6
If we receive manna from above
Its because you are the God of Love
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 7
The seas will part again my Savior I proclaim
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 8
Through your grace you changed our story
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 9
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name' THEN lyrics_amharic 
          ELSE 'CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 1
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Kadesh the great frightening desert
We have passed through without feeling thirst

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 2
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty
There is power in Your words and victory in Your name /2/

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 3
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
The walls of Jericho fell with shouts
Enemies will fall without a doubt

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 4
Marvelous how we took the city
It is by your will God almighty
It is by your will Lord almighty
There is power in Your words and victory in Your name

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 5
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Surpassing the trials and hardships
The marah water changed from tasteless

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 6
If we receive manna from above
Its because you are the God of Love
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 7
The seas will part again my Savior I proclaim
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 8
Through your grace you changed our story
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 9
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name' 
        END,
        lyrics_transliteration = 'CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 1
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Kadesh the great frightening desert
We have passed through without feeling thirst

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 2
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty
There is power in Your words and victory in Your name (2)

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 3
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
The walls of Jericho fell with shouts
Enemies will fall without a doubt

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 4
Marvelous how we took the city
It is by your will God almighty
It is by your will Lord almighty
There is power in Your words and victory in Your name

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 5
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Surpassing the trials and hardships
The marah water changed from tasteless

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 6
If we receive manna from above
Its because you are the God of Love
There is power in Your words and victory in Your name (2)
The mountains will tremble Emmanual I proclaim

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 7
The seas will part again my Savior I proclaim
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 8
Through your grace you changed our story
There is power in Your words and victory in Your name (2)
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 9
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
Dil ale besimih dil ale beqalih (2)
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e4f8c495-5561-49a3-90c7-7c00409c800a'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 1
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Kadesh the great frightening desert
We have passed through without feeling thirst

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 2
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty
There is power in Your words and victory in Your name /2/

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 3
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
The walls of Jericho fell with shouts
Enemies will fall without a doubt

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 4
Marvelous how we took the city
It is by your will God almighty
It is by your will Lord almighty
There is power in Your words and victory in Your name

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 5
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Surpassing the trials and hardships
The marah water changed from tasteless

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 6
If we receive manna from above
Its because you are the God of Love
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 7
The seas will part again my Savior I proclaim
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 8
Through your grace you changed our story
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name

VERSE 9
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Kadesh the great frightening desert
We have passed through without feeling thirst
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
The walls of Jericho fell with shouts
Enemies will fall without a doubt
Marvelous how we took the city
It is by your will God almighty
It is by your will Lord almighty
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Surpassing the trials and hardships
The marah water changed from tasteless
If we receive manna from above
Its because you are the God of Love
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty
Through your grace you changed our story
There is power in Your words and victory in Your name /2/
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim
Dil ale besimih dil ale beqalih /2/
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e4f8c495-5561-49a3-90c7-7c00409c800a'::uuid, 'there-is-power-in-your-words-2203', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- you-triumph-the-works-of-evil-2717 ("ኃያል ነህ አንተ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'daf1c8c4-3549-4445-8d4e-b80a05ff3f64'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 1
Hayal neh ante hayal
Degu melak Gebriel
Yiwdeq yishenef t’elat
Ante teradan bewnet

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 2
On the field of Dura
An idol was arranged
To favor its worship
A law had been proclaimed

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 3
But the wise children had remained faithful and true
They turned to The Most High temptations they subdued
Frustrated was the king
With the youthful children

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 4
In fire to be burned
He ordered to throw them
Descended down from the heavens as he was sent
Untouched by the fire he saved them from torment

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 5
They were filled with praises
Beneath the fire pit
The ones that pushed them in
Found themselves within it

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 6
They persevered with joy aided by Almighty
The nobles of the king witnessed the Lord’s glory
Nebuchadnezzar was
Bemused by what he saw

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 7
The mighty arch angel
Snatched them out of his claw
He praised the Lord who sent the angel to save them
He kneeled before their God for worship unto Him

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 1
ኃያል ነህ አንተ ኃያል
ደጉ መልአክ ገብርኤል
ይውደቅ ይሸነፍ ጠላት
አንተ ተራዳን በውነት

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 2
On the field of Dura
An idol was arranged
To favor its worship
A law had been proclaimed

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 3
But the wise children had remained faithful and true
They turned to The Most High temptations they subdued
Frustrated was the king
With the youthful children

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 4
In fire to be burned
He ordered to throw them
Descended down from the heavens as he was sent
Untouched by the fire he saved them from torment

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 5
They were filled with praises
Beneath the fire pit
The ones that pushed them in
Found themselves within it

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 6
They persevered with joy aided by Almighty
The nobles of the king witnessed the Lord’s glory
Nebuchadnezzar was
Bemused by what he saw

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 7
The mighty arch angel
Snatched them out of his claw
He praised the Lord who sent the angel to save them
He kneeled before their God for worship unto Him

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 1
ኃያል ነህ አንተ ኃያል
ደጉ መልአክ ገብርኤል
ይውደቅ ይሸነፍ ጠላት
አንተ ተራዳን በውነት

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 2
On the field of Dura
An idol was arranged
To favor its worship
A law had been proclaimed

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 3
But the wise children had remained faithful and true
They turned to The Most High temptations they subdued
Frustrated was the king
With the youthful children

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 4
In fire to be burned
He ordered to throw them
Descended down from the heavens as he was sent
Untouched by the fire he saved them from torment

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 5
They were filled with praises
Beneath the fire pit
The ones that pushed them in
Found themselves within it

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 6
They persevered with joy aided by Almighty
The nobles of the king witnessed the Lord’s glory
Nebuchadnezzar was
Bemused by what he saw

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 7
The mighty arch angel
Snatched them out of his claw
He praised the Lord who sent the angel to save them
He kneeled before their God for worship unto Him

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender' THEN lyrics_amharic 
          ELSE 'CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 1
ኃያል ነህ አንተ ኃያል
ደጉ መልአክ ገብርኤል
ይውደቅ ይሸነፍ ጠላት
አንተ ተራዳን በውነት

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 2
On the field of Dura
An idol was arranged
To favor its worship
A law had been proclaimed

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 3
But the wise children had remained faithful and true
They turned to The Most High temptations they subdued
Frustrated was the king
With the youthful children

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 4
In fire to be burned
He ordered to throw them
Descended down from the heavens as he was sent
Untouched by the fire he saved them from torment

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 5
They were filled with praises
Beneath the fire pit
The ones that pushed them in
Found themselves within it

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 6
They persevered with joy aided by Almighty
The nobles of the king witnessed the Lord’s glory
Nebuchadnezzar was
Bemused by what he saw

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 7
The mighty arch angel
Snatched them out of his claw
He praised the Lord who sent the angel to save them
He kneeled before their God for worship unto Him

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender' 
        END,
        lyrics_transliteration = 'CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 1
Hayal neh ante hayal
Degu melak Gebriel
Yiwdeq yishenef t’elat
Ante teradan bewnet

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 2
On the field of Dura
An idol was arranged
To favor its worship
A law had been proclaimed

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 3
But the wise children had remained faithful and true
They turned to The Most High temptations they subdued
Frustrated was the king
With the youthful children

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 4
In fire to be burned
He ordered to throw them
Descended down from the heavens as he was sent
Untouched by the fire he saved them from torment

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 5
They were filled with praises
Beneath the fire pit
The ones that pushed them in
Found themselves within it

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 6
They persevered with joy aided by Almighty
The nobles of the king witnessed the Lord’s glory
Nebuchadnezzar was
Bemused by what he saw

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 7
The mighty arch angel
Snatched them out of his claw
He praised the Lord who sent the angel to save them
He kneeled before their God for worship unto Him

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'daf1c8c4-3549-4445-8d4e-b80a05ff3f64'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 1
ኃያል ነህ አንተ ኃያል
ደጉ መልአክ ገብርኤል
ይውደቅ ይሸነፍ ጠላት
አንተ ተራዳን በውነት

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 2
On the field of Dura
An idol was arranged
To favor its worship
A law had been proclaimed

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 3
But the wise children had remained faithful and true
They turned to The Most High temptations they subdued
Frustrated was the king
With the youthful children

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 4
In fire to be burned
He ordered to throw them
Descended down from the heavens as he was sent
Untouched by the fire he saved them from torment

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 5
They were filled with praises
Beneath the fire pit
The ones that pushed them in
Found themselves within it

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 6
They persevered with joy aided by Almighty
The nobles of the king witnessed the Lord’s glory
Nebuchadnezzar was
Bemused by what he saw

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender

VERSE 7
The mighty arch angel
Snatched them out of his claw
He praised the Lord who sent the angel to save them
He kneeled before their God for worship unto Him

CHORUS
You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender'
        OR lyrics_amharic IS NOT DISTINCT FROM 'You triumph the works of evil
The mighty angel St. Gebriel
Let the enemy surrender
Be my rescuing defender
ኃያል ነህ አንተ ኃያል
ደጉ መልአክ ገብርኤል
ይውደቅ ይሸነፍ ጠላት
አንተ ተራዳን በውነት
On the field of Dura
An idol was arranged
To favor its worship
A law had been proclaimed
But the wise children had remained faithful and true
They turned to The Most High temptations they subdued
Frustrated was the king
With the youthful children
In fire to be burned
He ordered to throw them
Descended down from the heavens as he was sent
Untouched by the fire he saved them from torment
They were filled with praises
Beneath the fire pit
The ones that pushed them in
Found themselves within it
They persevered with joy aided by Almighty
The nobles of the king witnessed the Lord’s glory
Nebuchadnezzar was
Bemused by what he saw
The mighty arch angel
Snatched them out of his claw
He praised the Lord who sent the angel to save them
He kneeled before their God for worship unto Him'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'daf1c8c4-3549-4445-8d4e-b80a05ff3f64'::uuid, 'you-triumph-the-works-of-evil-2717', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian-orthodox-tinsae-mezmur ("ወምድርኒ ትገብር ፋሲካ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '98feb6b0-fb21-43c4-be62-2798f0afe710'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wemdrni tigebr fasika (2)
Tehets’iba bedeme Kristos (4)
Mider ts’edach heset aderegech (2)
BeKristos dem beewnet tat’ebech (4)

VERSE 1
Wemdrni tigebr fasika (2)
Tehets’iba bedeme Kristos (4)
Mider ts’edach heset aderegech (2)
BeKristos dem beewnet tat’ebech (4)

CHORUS
Wemdrni tigebr fasika (2)
Tehets’iba bedeme Kristos (4)
Mider ts’edach heset aderegech (2)
BeKristos dem beewnet tat’ebech (4)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/

VERSE 1
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/

CHORUS
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/

VERSE 1
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/

CHORUS
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/' THEN lyrics_amharic 
          ELSE 'CHORUS
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/

VERSE 1
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/

CHORUS
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/' 
        END,
        lyrics_transliteration = 'CHORUS
Wemdrni tigebr fasika (2)
Tehets’iba bedeme Kristos (4)
Mider ts’edach heset aderegech (2)
BeKristos dem beewnet tat’ebech (4)

VERSE 1
Wemdrni tigebr fasika (2)
Tehets’iba bedeme Kristos (4)
Mider ts’edach heset aderegech (2)
BeKristos dem beewnet tat’ebech (4)

CHORUS
Wemdrni tigebr fasika (2)
Tehets’iba bedeme Kristos (4)
Mider ts’edach heset aderegech (2)
BeKristos dem beewnet tat’ebech (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '98feb6b0-fb21-43c4-be62-2798f0afe710'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/

VERSE 1
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/

CHORUS
ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ወምድርኒ ትገብር ፋሲካ/2/
ተሐጺባ በደመ ክርስቶስ /4/
ምደር ጸዳች ሐሴት አደረገች /2/
በክርስቶስ ደም በእውነት ታጠበች/4/'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '98feb6b0-fb21-43c4-be62-2798f0afe710'::uuid, 'ethiopian-orthodox-tinsae-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidus ("ሥላሴ መመኪያችን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0d6d9035-59e2-4664-ac82-24eb1bbf9a83'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana

VERSE 1
Binaqerblet widase ellta
Kibru leegna new misgun new Geta
Surafel yisegdu lotu
Wekirubel yisebhwo yits’erhu enze yiblu

CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana

VERSE 2
Temesgen binl binzemrlet
Aydelem andach linch’emrlet
Fit’ur baynorm alem batts’ena
Aygodlbetm t’um misgana

CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana

VERSE 3
Qedamawi new t’efer meseret
Beersu zend yelem shumetm shret
Mengstu ts’nu zelalem nwari
Kidist Silassie lijochun meri

CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana

VERSE 4
Besemay heylat alew widase
Ereftachew new maqreb qidase
T’um zimare libn yemiserq
Yemayqwaret’ ''mayferareq

CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 1
ብናቀርብለት ውዳሴ እልልታ
ክብሩ ለእኛ ነው ምስጉን ነው ጌታ
ሱራፌል ይሰግዱ ሎቱ
ወኪሩቤል ይሴብሕዎ ይጸርሑ እንዘ ይብሉ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 2
ተመስገን ብንል ብንዘምርለት
አይደለም አንዳች ልንጨምርለት
ፍጡር ባይኖርም ዓለም ባትጸና
አይጎድልበትም ጥዑም ምስጋና

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 3
ቀዳማዊ ነው ጠፈር መሠረት
በእርሱ ዘንድ የለም ሹመትም ሽረት
መንግሥቱ ጽኑ ዘላለም ኗሪ
ቅድስት ሥላሴ ልጆቹን መሪ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 4
በሰማይ ኀይላት አለው ውዳሴ
ዕረፍታቸው ነው ማቅረብ ቅዳሴ
ጥዑም ዝማሬ ልብን የሚሰርቅ
የማይቋረጥ ''ማይፈራረቅ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 1
ብናቀርብለት ውዳሴ እልልታ
ክብሩ ለእኛ ነው ምስጉን ነው ጌታ
ሱራፌል ይሰግዱ ሎቱ
ወኪሩቤል ይሴብሕዎ ይጸርሑ እንዘ ይብሉ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 2
ተመስገን ብንል ብንዘምርለት
አይደለም አንዳች ልንጨምርለት
ፍጡር ባይኖርም ዓለም ባትጸና
አይጎድልበትም ጥዑም ምስጋና

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 3
ቀዳማዊ ነው ጠፈር መሠረት
በእርሱ ዘንድ የለም ሹመትም ሽረት
መንግሥቱ ጽኑ ዘላለም ኗሪ
ቅድስት ሥላሴ ልጆቹን መሪ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 4
በሰማይ ኀይላት አለው ውዳሴ
ዕረፍታቸው ነው ማቅረብ ቅዳሴ
ጥዑም ዝማሬ ልብን የሚሰርቅ
የማይቋረጥ ''ማይፈራረቅ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና' THEN lyrics_amharic 
          ELSE 'CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 1
ብናቀርብለት ውዳሴ እልልታ
ክብሩ ለእኛ ነው ምስጉን ነው ጌታ
ሱራፌል ይሰግዱ ሎቱ
ወኪሩቤል ይሴብሕዎ ይጸርሑ እንዘ ይብሉ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 2
ተመስገን ብንል ብንዘምርለት
አይደለም አንዳች ልንጨምርለት
ፍጡር ባይኖርም ዓለም ባትጸና
አይጎድልበትም ጥዑም ምስጋና

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 3
ቀዳማዊ ነው ጠፈር መሠረት
በእርሱ ዘንድ የለም ሹመትም ሽረት
መንግሥቱ ጽኑ ዘላለም ኗሪ
ቅድስት ሥላሴ ልጆቹን መሪ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 4
በሰማይ ኀይላት አለው ውዳሴ
ዕረፍታቸው ነው ማቅረብ ቅዳሴ
ጥዑም ዝማሬ ልብን የሚሰርቅ
የማይቋረጥ ''ማይፈራረቅ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና' 
        END,
        lyrics_transliteration = 'CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana

VERSE 1
Binaqerblet widase ellta
Kibru leegna new misgun new Geta
Surafel yisegdu lotu
Wekirubel yisebhwo yits’erhu enze yiblu

CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana

VERSE 2
Temesgen binl binzemrlet
Aydelem andach linch’emrlet
Fit’ur baynorm alem batts’ena
Aygodlbetm t’um misgana

CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana

VERSE 3
Qedamawi new t’efer meseret
Beersu zend yelem shumetm shret
Mengstu ts’nu zelalem nwari
Kidist Silassie lijochun meri

CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana

VERSE 4
Besemay heylat alew widase
Ereftachew new maqreb qidase
T’um zimare libn yemiserq
Yemayqwaret’ ''mayferareq

CHORUS
Kidus Kidus Kidus silus
Egziabher misgun new widus
Kef ziq yemil meche ኾnena
Yebahryu new leersu misgana',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0d6d9035-59e2-4664-ac82-24eb1bbf9a83'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 1
ብናቀርብለት ውዳሴ እልልታ
ክብሩ ለእኛ ነው ምስጉን ነው ጌታ
ሱራፌል ይሰግዱ ሎቱ
ወኪሩቤል ይሴብሕዎ ይጸርሑ እንዘ ይብሉ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 2
ተመስገን ብንል ብንዘምርለት
አይደለም አንዳች ልንጨምርለት
ፍጡር ባይኖርም ዓለም ባትጸና
አይጎድልበትም ጥዑም ምስጋና

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 3
ቀዳማዊ ነው ጠፈር መሠረት
በእርሱ ዘንድ የለም ሹመትም ሽረት
መንግሥቱ ጽኑ ዘላለም ኗሪ
ቅድስት ሥላሴ ልጆቹን መሪ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና

VERSE 4
በሰማይ ኀይላት አለው ውዳሴ
ዕረፍታቸው ነው ማቅረብ ቅዳሴ
ጥዑም ዝማሬ ልብን የሚሰርቅ
የማይቋረጥ ''ማይፈራረቅ

CHORUS
ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ቅዱስ ቅዱስ ቅዱስ ሥሉስ
እግዚአብሔር ምስጉን ነው ውዱስ
ከፍ ዝቅ የሚል መቼ ኾነና
የባሕርዩ ነው ለእርሱ ምስጋና
ብናቀርብለት ውዳሴ እልልታ
ክብሩ ለእኛ ነው ምስጉን ነው ጌታ
ሱራፌል ይሰግዱ ሎቱ
ወኪሩቤል ይሴብሕዎ ይጸርሑ እንዘ ይብሉ
ተመስገን ብንል ብንዘምርለት
አይደለም አንዳች ልንጨምርለት
ፍጡር ባይኖርም ዓለም ባትጸና
አይጎድልበትም ጥዑም ምስጋና
ቀዳማዊ ነው ጠፈር መሠረት
በእርሱ ዘንድ የለም ሹመትም ሽረት
መንግሥቱ ጽኑ ዘላለም ኗሪ
ቅድስት ሥላሴ ልጆቹን መሪ
በሰማይ ኀይላት አለው ውዳሴ
ዕረፍታቸው ነው ማቅረብ ቅዳሴ
ጥዑም ዝማሬ ልብን የሚሰርቅ
የማይቋረጥ ''ማይፈራረቅ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0d6d9035-59e2-4664-ac82-24eb1bbf9a83'::uuid, 'kidus', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bariya-ayidelehum ("ባርያ አይደለሁም")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9d1d4ee6-ff86-4474-9dbe-620ac9f0b876'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal

VERSE 1
Asrogn yeneberew t’elate wedqolgn
Yeesatu senselet keeje lay welqolgn
Nets’a wet’chalehu beamlake chernet
Dagm aygezugnm (2) diyablos na mot

CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal

VERSE 2
Bete meqdes honwal libe sewnete
Bewaga geztognal wedogn medhenite
Bealem set’me endalqer kebetu
Endalst agezegn (2)fiqr namhretu

CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal

VERSE 3
Yesiol mezgiyawoch ferarsew wedequ
Yemot serawitoch silt’an tenet’equ
Dagm tewelje kirstiyan hognalehu
Yeljnet ts’egan (2) kibrn lebshalehu

CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal

VERSE 4
Bemesqel teseqlo beza honolgnal
Keengdih barnet meche yigezagnal
Alt’eret’rewm yamenkut alegn
Simum Iyesus new (2) kemot yadanegn

CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 1
አስሮኝ የነበረው ጠላቴ ወድቆልኝ
የእሳቱ ሰንሰለት ከእጄ ላይ ወልቆልኝ
ነፃ ወጥቻለሁ በአምላኬ ቸርነት
ዳግም አይገዙኝም (፪) ዲያብሎስ ና ሞት

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 2
ቤተ መቅደስ ሆኗል ልቤ ሰውነቴ
በዋጋ ገዝቶኛል ወዶኝ መድሐኒቴ
በዓለም ሰጥሜ እንዳልቀር ከቤቱ
እንዳልስት አገዘኝ (2)ፍቅር ናምህረቱ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 3
የሲኦል መዝጊያዎች ፈራርሰው ወደቁ
የሞት ሰራዊቶች ስልጣን ተነጠቁ
ዳግም ተወልጄ ክርስቲያን ሆኛለሁ
የልጅነት ጸጋን (2) ክብርን ለብሻለሁ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 4
በመስቀል ተሰቅሎ ቤዛ ሆኖልኛል
ከእንግዲህ ባርነት መቼ ይገዛኛል
አልጠረጥረውም ያመንኩት አለኝ
ስሙም ኢየሱስ ነው(2) ከሞት ያዳነኝ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 1
አስሮኝ የነበረው ጠላቴ ወድቆልኝ
የእሳቱ ሰንሰለት ከእጄ ላይ ወልቆልኝ
ነፃ ወጥቻለሁ በአምላኬ ቸርነት
ዳግም አይገዙኝም (፪) ዲያብሎስ ና ሞት

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 2
ቤተ መቅደስ ሆኗል ልቤ ሰውነቴ
በዋጋ ገዝቶኛል ወዶኝ መድሐኒቴ
በዓለም ሰጥሜ እንዳልቀር ከቤቱ
እንዳልስት አገዘኝ (2)ፍቅር ናምህረቱ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 3
የሲኦል መዝጊያዎች ፈራርሰው ወደቁ
የሞት ሰራዊቶች ስልጣን ተነጠቁ
ዳግም ተወልጄ ክርስቲያን ሆኛለሁ
የልጅነት ጸጋን (2) ክብርን ለብሻለሁ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 4
በመስቀል ተሰቅሎ ቤዛ ሆኖልኛል
ከእንግዲህ ባርነት መቼ ይገዛኛል
አልጠረጥረውም ያመንኩት አለኝ
ስሙም ኢየሱስ ነው(2) ከሞት ያዳነኝ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል' THEN lyrics_amharic 
          ELSE 'CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 1
አስሮኝ የነበረው ጠላቴ ወድቆልኝ
የእሳቱ ሰንሰለት ከእጄ ላይ ወልቆልኝ
ነፃ ወጥቻለሁ በአምላኬ ቸርነት
ዳግም አይገዙኝም (፪) ዲያብሎስ ና ሞት

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 2
ቤተ መቅደስ ሆኗል ልቤ ሰውነቴ
በዋጋ ገዝቶኛል ወዶኝ መድሐኒቴ
በዓለም ሰጥሜ እንዳልቀር ከቤቱ
እንዳልስት አገዘኝ (2)ፍቅር ናምህረቱ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 3
የሲኦል መዝጊያዎች ፈራርሰው ወደቁ
የሞት ሰራዊቶች ስልጣን ተነጠቁ
ዳግም ተወልጄ ክርስቲያን ሆኛለሁ
የልጅነት ጸጋን (2) ክብርን ለብሻለሁ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 4
በመስቀል ተሰቅሎ ቤዛ ሆኖልኛል
ከእንግዲህ ባርነት መቼ ይገዛኛል
አልጠረጥረውም ያመንኩት አለኝ
ስሙም ኢየሱስ ነው(2) ከሞት ያዳነኝ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል' 
        END,
        lyrics_transliteration = 'CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal

VERSE 1
Asrogn yeneberew t’elate wedqolgn
Yeesatu senselet keeje lay welqolgn
Nets’a wet’chalehu beamlake chernet
Dagm aygezugnm (2) diyablos na mot

CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal

VERSE 2
Bete meqdes honwal libe sewnete
Bewaga geztognal wedogn medhenite
Bealem set’me endalqer kebetu
Endalst agezegn (2)fiqr namhretu

CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal

VERSE 3
Yesiol mezgiyawoch ferarsew wedequ
Yemot serawitoch silt’an tenet’equ
Dagm tewelje kirstiyan hognalehu
Yeljnet ts’egan (2) kibrn lebshalehu

CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal

VERSE 4
Bemesqel teseqlo beza honolgnal
Keengdih barnet meche yigezagnal
Alt’eret’rewm yamenkut alegn
Simum Iyesus new (2) kemot yadanegn

CHORUS
Barya aydelehum liju ene
Amelkewalehu beedme zemene
T’elaten t’lo nets’a awt’tognal
Begeza demu hiywet set’tognal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9d1d4ee6-ff86-4474-9dbe-620ac9f0b876'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 1
አስሮኝ የነበረው ጠላቴ ወድቆልኝ
የእሳቱ ሰንሰለት ከእጄ ላይ ወልቆልኝ
ነፃ ወጥቻለሁ በአምላኬ ቸርነት
ዳግም አይገዙኝም (፪) ዲያብሎስ ና ሞት

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 2
ቤተ መቅደስ ሆኗል ልቤ ሰውነቴ
በዋጋ ገዝቶኛል ወዶኝ መድሐኒቴ
በዓለም ሰጥሜ እንዳልቀር ከቤቱ
እንዳልስት አገዘኝ (2)ፍቅር ናምህረቱ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 3
የሲኦል መዝጊያዎች ፈራርሰው ወደቁ
የሞት ሰራዊቶች ስልጣን ተነጠቁ
ዳግም ተወልጄ ክርስቲያን ሆኛለሁ
የልጅነት ጸጋን (2) ክብርን ለብሻለሁ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል

VERSE 4
በመስቀል ተሰቅሎ ቤዛ ሆኖልኛል
ከእንግዲህ ባርነት መቼ ይገዛኛል
አልጠረጥረውም ያመንኩት አለኝ
ስሙም ኢየሱስ ነው(2) ከሞት ያዳነኝ

CHORUS
ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ባርያ አይደለሁም ልጁ እኔ
አመልከዋለሁ በእድሜ ዘመኔ
ጠላቴን ጥሎ ነፃ አውጥቶኛል
በገዛ ደሙ ህይወት ሰጥቶኛል
አዝ...
አስሮኝ የነበረው ጠላቴ ወድቆልኝ
የእሳቱ ሰንሰለት ከእጄ ላይ ወልቆልኝ
ነፃ ወጥቻለሁ በአምላኬ ቸርነት
ዳግም አይገዙኝም (፪) ዲያብሎስ ና ሞት
አዝ...
ቤተ መቅደስ ሆኗል ልቤ ሰውነቴ
በዋጋ ገዝቶኛል ወዶኝ መድሐኒቴ
በዓለም ሰጥሜ እንዳልቀር ከቤቱ
እንዳልስት አገዘኝ (2)ፍቅር ናምህረቱ
አዝ...
የሲኦል መዝጊያዎች ፈራርሰው ወደቁ
የሞት ሰራዊቶች ስልጣን ተነጠቁ
ዳግም ተወልጄ ክርስቲያን ሆኛለሁ
የልጅነት ጸጋን (2) ክብርን ለብሻለሁ
አዝ....
በመስቀል ተሰቅሎ ቤዛ ሆኖልኛል
ከእንግዲህ ባርነት መቼ ይገዛኛል
አልጠረጥረውም ያመንኩት አለኝ
ስሙም ኢየሱስ ነው(2) ከሞት ያዳነኝ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9d1d4ee6-ff86-4474-9dbe-620ac9f0b876'::uuid, 'bariya-ayidelehum', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ayenocha-madanune ("አይኖቼ ማዳኑን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a66ed163-63de-4ba4-be2c-5aa0e6e0a472'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher

VERSE 1
Bebetelhem washa beziya begrgm
Tewelede zare Medhanealem
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher

VERSE 2
Kebedel gurangun anesan ketbiya
Beandnet enzemr enbel Halleluya
Yetenaqn senhon egnan liyakebr wedo
Befqr akeberen erasun awardo

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher

VERSE 3
Min aynet fiqr new fits’um mihret
Yeamlak meweled bekebtoch beret
Bents’hna ts’entesh betemeqdes yenorsh
Behetum dingilina medhanitn weledsh

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher

VERSE 4
Yealemn hat’iat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 1
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 2
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሉያ
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 3
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት
የአምላክ መወለድ በከብቶች በረት
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 4
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 1
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 2
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሉያ
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 3
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት
የአምላክ መወለድ በከብቶች በረት
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 4
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር' THEN lyrics_amharic 
          ELSE 'CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 1
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 2
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሉያ
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 3
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት
የአምላክ መወለድ በከብቶች በረት
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 4
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር' 
        END,
        lyrics_transliteration = 'CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher

VERSE 1
Bebetelhem washa beziya begrgm
Tewelede zare Medhanealem
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher

VERSE 2
Kebedel gurangun anesan ketbiya
Beandnet enzemr enbel Halleluya
Yetenaqn senhon egnan liyakebr wedo
Befqr akeberen erasun awardo

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher

VERSE 3
Min aynet fiqr new fits’um mihret
Yeamlak meweled bekebtoch beret
Bents’hna ts’entesh betemeqdes yenorsh
Behetum dingilina medhanitn weledsh

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher

VERSE 4
Yealemn hat’iat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
Kesemay werede sewn bemafqer
Hayalu getachen cheru Egziabher',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a66ed163-63de-4ba4-be2c-5aa0e6e0a472'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 1
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 2
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሉያ
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 3
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት
የአምላክ መወለድ በከብቶች በረት
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር

VERSE 4
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር'
        OR lyrics_amharic IS NOT DISTINCT FROM 'አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
.................
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ እግዚአብሔር
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
................
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሉያ
.................
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት
የአምላክ መወለድ በከብቶች በረት
................
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a66ed163-63de-4ba4-be2c-5aa0e6e0a472'::uuid, 'ayenocha-madanune', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cover-mezmur ("ኣብ ሓጢኣተኛ ድንኳን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9dc4a157-a6f5-478f-b4ee-b98220ad9322'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)

VERSE 1
Eti kwa gerkani milue seb amlaኸy
Nisu endyu zinafቕ zimneyo libey
Nay zemenat sheኸm halifu mekera
Zit’efea begie rekibkayo iኻ

CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)

VERSE 2
Eti kitreni ab tihti ''ta beles
Ab gets’ka zinbeb fets’imu zeyhass
Kabzi zibelets’e kitri iኻ ilkani
Aynኻ timskr kem zeytgedfeni

CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)

VERSE 3
Bado enknsey betey etenkwahkuh
Wusht’eys resah''yu nisኻ gin rihruh
Kab loms ayt’lqn mints’afey binbat
Bits’hayo nilbey biyቕreta mihret

CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)

VERSE 4
Yifelt’''ye goytay kulu kem''tefqr
Kab af anabsti awaj mot kitser
Kemzi enda bele''yu ziቕne hilnay
Iyesus Kristos megbey ika mestey

CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 1
እቲ ኳ ጌርካኒ ምሉእ ሰብ ኣምላኸይ
ንሱ እንድዩ ዝናፍቕ ዝምነዮ ልበይ
ናይ ዘመናት ሸኸም ሓሊፉ መከራ
ዝጠፈአ በጊዕ ረኪብካዮ ኢኻ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 2
እቲ ክትርኤኒ ኣብ ትሕቲ ''ታ በለስ
ኣብ ገጽካ ዝንበብ ፈጺሙ ዘይሃስስ
ካብዚ ዝበለጸ ክትርኢ ኢኻ ኢልካኒ
ዓይንኻ ትምስክር ከም ዘይትገድፈኒ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 3
ባዶ እንክንሰይ ቤተይ እተንኳሕኩሕ
ዉሽጠይስ ረሳሕ''ዩ ንስኻ ግን ርህሩህ
ካብ ሎምስ ኣይጥልቅን ምንጻፈይ ብንብዓት
ብጽሓዮ ንልበይ ብይቕሬታ ምሕረት

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 4
ይፈልጥ''የ ጎይታይ ኩሉ ከም''ተፍቅር
ካብ ኣፍ ኣናብስቲ ኣዋጅ ሞት ክትስዕር
ከምዚ እንዳ በለ''ዩ ዝቕነ ሕልናይ
ኢየሱስ ክርስቶስ መግበይ ኢካ መስተይ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 1
እቲ ኳ ጌርካኒ ምሉእ ሰብ ኣምላኸይ
ንሱ እንድዩ ዝናፍቕ ዝምነዮ ልበይ
ናይ ዘመናት ሸኸም ሓሊፉ መከራ
ዝጠፈአ በጊዕ ረኪብካዮ ኢኻ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 2
እቲ ክትርኤኒ ኣብ ትሕቲ ''ታ በለስ
ኣብ ገጽካ ዝንበብ ፈጺሙ ዘይሃስስ
ካብዚ ዝበለጸ ክትርኢ ኢኻ ኢልካኒ
ዓይንኻ ትምስክር ከም ዘይትገድፈኒ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 3
ባዶ እንክንሰይ ቤተይ እተንኳሕኩሕ
ዉሽጠይስ ረሳሕ''ዩ ንስኻ ግን ርህሩህ
ካብ ሎምስ ኣይጥልቅን ምንጻፈይ ብንብዓት
ብጽሓዮ ንልበይ ብይቕሬታ ምሕረት

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 4
ይፈልጥ''የ ጎይታይ ኩሉ ከም''ተፍቅር
ካብ ኣፍ ኣናብስቲ ኣዋጅ ሞት ክትስዕር
ከምዚ እንዳ በለ''ዩ ዝቕነ ሕልናይ
ኢየሱስ ክርስቶስ መግበይ ኢካ መስተይ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/' THEN lyrics_amharic 
          ELSE 'CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 1
እቲ ኳ ጌርካኒ ምሉእ ሰብ ኣምላኸይ
ንሱ እንድዩ ዝናፍቕ ዝምነዮ ልበይ
ናይ ዘመናት ሸኸም ሓሊፉ መከራ
ዝጠፈአ በጊዕ ረኪብካዮ ኢኻ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 2
እቲ ክትርኤኒ ኣብ ትሕቲ ''ታ በለስ
ኣብ ገጽካ ዝንበብ ፈጺሙ ዘይሃስስ
ካብዚ ዝበለጸ ክትርኢ ኢኻ ኢልካኒ
ዓይንኻ ትምስክር ከም ዘይትገድፈኒ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 3
ባዶ እንክንሰይ ቤተይ እተንኳሕኩሕ
ዉሽጠይስ ረሳሕ''ዩ ንስኻ ግን ርህሩህ
ካብ ሎምስ ኣይጥልቅን ምንጻፈይ ብንብዓት
ብጽሓዮ ንልበይ ብይቕሬታ ምሕረት

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 4
ይፈልጥ''የ ጎይታይ ኩሉ ከም''ተፍቅር
ካብ ኣፍ ኣናብስቲ ኣዋጅ ሞት ክትስዕር
ከምዚ እንዳ በለ''ዩ ዝቕነ ሕልናይ
ኢየሱስ ክርስቶስ መግበይ ኢካ መስተይ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/' 
        END,
        lyrics_transliteration = 'CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)

VERSE 1
Eti kwa gerkani milue seb amlaኸy
Nisu endyu zinafቕ zimneyo libey
Nay zemenat sheኸm halifu mekera
Zit’efea begie rekibkayo iኻ

CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)

VERSE 2
Eti kitreni ab tihti ''ta beles
Ab gets’ka zinbeb fets’imu zeyhass
Kabzi zibelets’e kitri iኻ ilkani
Aynኻ timskr kem zeytgedfeni

CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)

VERSE 3
Bado enknsey betey etenkwahkuh
Wusht’eys resah''yu nisኻ gin rihruh
Kab loms ayt’lqn mints’afey binbat
Bits’hayo nilbey biyቕreta mihret

CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)

VERSE 4
Yifelt’''ye goytay kulu kem''tefqr
Kab af anabsti awaj mot kitser
Kemzi enda bele''yu ziቕne hilnay
Iyesus Kristos megbey ika mestey

CHORUS
Ab hat’iategna dunkwan amlaኸy sefirka
Wedey abey alo ilka anadiኻ
Niaኻ mis hazku qelilu seኸmey
Zigeberkaleys bizuh''yu goytay (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9dc4a157-a6f5-478f-b4ee-b98220ad9322'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 1
እቲ ኳ ጌርካኒ ምሉእ ሰብ ኣምላኸይ
ንሱ እንድዩ ዝናፍቕ ዝምነዮ ልበይ
ናይ ዘመናት ሸኸም ሓሊፉ መከራ
ዝጠፈአ በጊዕ ረኪብካዮ ኢኻ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 2
እቲ ክትርኤኒ ኣብ ትሕቲ ''ታ በለስ
ኣብ ገጽካ ዝንበብ ፈጺሙ ዘይሃስስ
ካብዚ ዝበለጸ ክትርኢ ኢኻ ኢልካኒ
ዓይንኻ ትምስክር ከም ዘይትገድፈኒ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 3
ባዶ እንክንሰይ ቤተይ እተንኳሕኩሕ
ዉሽጠይስ ረሳሕ''ዩ ንስኻ ግን ርህሩህ
ካብ ሎምስ ኣይጥልቅን ምንጻፈይ ብንብዓት
ብጽሓዮ ንልበይ ብይቕሬታ ምሕረት

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/

VERSE 4
ይፈልጥ''የ ጎይታይ ኩሉ ከም''ተፍቅር
ካብ ኣፍ ኣናብስቲ ኣዋጅ ሞት ክትስዕር
ከምዚ እንዳ በለ''ዩ ዝቕነ ሕልናይ
ኢየሱስ ክርስቶስ መግበይ ኢካ መስተይ

CHORUS
ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኣብ ሓጢኣተኛ ዱንኳን ኣምላኸይ ሰፊርካ
ወደይ ኣበይ ኣሎ ኢልካ ኣናዲኻ
ንዓኻ ምስ ሓዝኩ ቀሊሉ ሰኸመይ
ዝገበርካለይስ ብዙሕ''ዩ ጎይታይ /2/
እቲ ኳ ጌርካኒ ምሉእ ሰብ ኣምላኸይ
ንሱ እንድዩ ዝናፍቕ ዝምነዮ ልበይ
ናይ ዘመናት ሸኸም ሓሊፉ መከራ
ዝጠፈአ በጊዕ ረኪብካዮ ኢኻ
እቲ ክትርኤኒ ኣብ ትሕቲ ''ታ በለስ
ኣብ ገጽካ ዝንበብ ፈጺሙ ዘይሃስስ
ካብዚ ዝበለጸ ክትርኢ ኢኻ ኢልካኒ
ዓይንኻ ትምስክር ከም ዘይትገድፈኒ
ባዶ እንክንሰይ ቤተይ እተንኳሕኩሕ
ዉሽጠይስ ረሳሕ''ዩ ንስኻ ግን ርህሩህ
ካብ ሎምስ ኣይጥልቅን ምንጻፈይ ብንብዓት
ብጽሓዮ ንልበይ ብይቕሬታ ምሕረት
ይፈልጥ''የ ጎይታይ ኩሉ ከም''ተፍቅር
ካብ ኣፍ ኣናብስቲ ኣዋጅ ሞት ክትስዕር
ከምዚ እንዳ በለ''ዩ ዝቕነ ሕልናይ
ኢየሱስ ክርስቶስ መግበይ ኢካ መስተይ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9dc4a157-a6f5-478f-b4ee-b98220ad9322'::uuid, 'cover-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cover-mezmur-3522 ("ኣብ ድንኳነይ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '068ca999-c4fe-421d-af97-4ed12a09db14'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai

VERSE 1
Garedeley koynni mehbi
Beti rihruh beti fetawyey
Selam koynu ab wushat’e betey
Nay mengedey ts’rgya aቕniu

CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai

VERSE 2
Zirebrebe hayley''wun ats’niu
Qidmi ቕdmey beawet merihu
Bimsgana niqdmit amrihu
Keynaቐ hat’yategna ilu

CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai

VERSE 3
Milue seb eye godolo zeyblu
T’imuni wey ente kefani
Higus eye amlaኸy aleni
Mimrar migurumram gedifeyo

CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai

VERSE 4
Andebetey qine melieyo
Enkferareቕ birhann ts’elmatn
Kab misgana anes ayeerfn

CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 1
ጋረደለይ ኮይንኒ መሕብኢ
በቲ ርህሩህ በቲ ፈታውየይ
ሰላም ኮይኑ ኣብ ዉሻጠ ቤተይ
ናይ መንገደይ ጽርግያ ኣቕኒዑ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 2
ዝረብረበ ሓይለይ''ዉን ኣጽኒዑ
ቅድሚ ቕድመይ በዓወት መሪሑ
ብምስጋና ንቅድሚት ኣምሪሑ
ከይንዓቐ ሓጥያተኛ ኢሉ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 3
ምሉእ ሰብ እየ ጎዶሎ ዘይብሉ
ጥዒሙኒ ወይ እንተ ከፍኣኒ
ሕጉስ እየ ኣምላኸይ ኣለኒ
ምምራር ምጉሩምራም ገዲፈዮ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 4
ኣንደበተይ ቅኔ መሊኤዮ
እንክፈራረቕ ብርሃንን ጸልማትን
ካብ ምስጋና ኣነስ ኣየዕርፍን

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 1
ጋረደለይ ኮይንኒ መሕብኢ
በቲ ርህሩህ በቲ ፈታውየይ
ሰላም ኮይኑ ኣብ ዉሻጠ ቤተይ
ናይ መንገደይ ጽርግያ ኣቕኒዑ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 2
ዝረብረበ ሓይለይ''ዉን ኣጽኒዑ
ቅድሚ ቕድመይ በዓወት መሪሑ
ብምስጋና ንቅድሚት ኣምሪሑ
ከይንዓቐ ሓጥያተኛ ኢሉ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 3
ምሉእ ሰብ እየ ጎዶሎ ዘይብሉ
ጥዒሙኒ ወይ እንተ ከፍኣኒ
ሕጉስ እየ ኣምላኸይ ኣለኒ
ምምራር ምጉሩምራም ገዲፈዮ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 4
ኣንደበተይ ቅኔ መሊኤዮ
እንክፈራረቕ ብርሃንን ጸልማትን
ካብ ምስጋና ኣነስ ኣየዕርፍን

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ' THEN lyrics_amharic 
          ELSE 'CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 1
ጋረደለይ ኮይንኒ መሕብኢ
በቲ ርህሩህ በቲ ፈታውየይ
ሰላም ኮይኑ ኣብ ዉሻጠ ቤተይ
ናይ መንገደይ ጽርግያ ኣቕኒዑ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 2
ዝረብረበ ሓይለይ''ዉን ኣጽኒዑ
ቅድሚ ቕድመይ በዓወት መሪሑ
ብምስጋና ንቅድሚት ኣምሪሑ
ከይንዓቐ ሓጥያተኛ ኢሉ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 3
ምሉእ ሰብ እየ ጎዶሎ ዘይብሉ
ጥዒሙኒ ወይ እንተ ከፍኣኒ
ሕጉስ እየ ኣምላኸይ ኣለኒ
ምምራር ምጉሩምራም ገዲፈዮ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 4
ኣንደበተይ ቅኔ መሊኤዮ
እንክፈራረቕ ብርሃንን ጸልማትን
ካብ ምስጋና ኣነስ ኣየዕርፍን

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ' 
        END,
        lyrics_transliteration = 'CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai

VERSE 1
Garedeley koynni mehbi
Beti rihruh beti fetawyey
Selam koynu ab wushat’e betey
Nay mengedey ts’rgya aቕniu

CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai

VERSE 2
Zirebrebe hayley''wun ats’niu
Qidmi ቕdmey beawet merihu
Bimsgana niqdmit amrihu
Keynaቐ hat’yategna ilu

CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai

VERSE 3
Milue seb eye godolo zeyblu
T’imuni wey ente kefani
Higus eye amlaኸy aleni
Mimrar migurumram gedifeyo

CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai

VERSE 4
Andebetey qine melieyo
Enkferareቕ birhann ts’elmatn
Kab misgana anes ayeerfn

CHORUS
Ab dinkwaney ellta milue''yu
Ab dinkwaney zimare milue''yu
Ab mennetey win Egziabher aby''yu
Tewerwari filats’a ts’elai',
        updated_at = clock_timestamp()::text
    WHERE import_id = '068ca999-c4fe-421d-af97-4ed12a09db14'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 1
ጋረደለይ ኮይንኒ መሕብኢ
በቲ ርህሩህ በቲ ፈታውየይ
ሰላም ኮይኑ ኣብ ዉሻጠ ቤተይ
ናይ መንገደይ ጽርግያ ኣቕኒዑ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 2
ዝረብረበ ሓይለይ''ዉን ኣጽኒዑ
ቅድሚ ቕድመይ በዓወት መሪሑ
ብምስጋና ንቅድሚት ኣምሪሑ
ከይንዓቐ ሓጥያተኛ ኢሉ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 3
ምሉእ ሰብ እየ ጎዶሎ ዘይብሉ
ጥዒሙኒ ወይ እንተ ከፍኣኒ
ሕጉስ እየ ኣምላኸይ ኣለኒ
ምምራር ምጉሩምራም ገዲፈዮ

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ

VERSE 4
ኣንደበተይ ቅኔ መሊኤዮ
እንክፈራረቕ ብርሃንን ጸልማትን
ካብ ምስጋና ኣነስ ኣየዕርፍን

CHORUS
ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኣብ ድንኳነይ ዕልልታ ምሉእ''ዩ
ኣብ ድንኳነይ ዝማሬ ምሉእ''ዩ
ኣብ መንነተይ ውን እግዚአብሔር ዓብይ''ዩ
ተወርዋሪ ፍላጻ ጸላኢ
ጋረደለይ ኮይንኒ መሕብኢ
በቲ ርህሩህ በቲ ፈታውየይ
ሰላም ኮይኑ ኣብ ዉሻጠ ቤተይ
ናይ መንገደይ ጽርግያ ኣቕኒዑ
ዝረብረበ ሓይለይ''ዉን ኣጽኒዑ
ቅድሚ ቕድመይ በዓወት መሪሑ
ብምስጋና ንቅድሚት ኣምሪሑ
ከይንዓቐ ሓጥያተኛ ኢሉ
ምሉእ ሰብ እየ ጎዶሎ ዘይብሉ
ጥዒሙኒ ወይ እንተ ከፍኣኒ
ሕጉስ እየ ኣምላኸይ ኣለኒ
ምምራር ምጉሩምራም ገዲፈዮ
ኣንደበተይ ቅኔ መሊኤዮ
እንክፈራረቕ ብርሃንን ጸልማትን
ካብ ምስጋና ኣነስ ኣየዕርፍን'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '068ca999-c4fe-421d-af97-4ed12a09db14'::uuid, 'cover-mezmur-3522', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- esey-tewelede-4348 ("እሰይ ተወለደ የዓለም መድኃኒት -- የልደት")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9e6b9b8b-a3c6-47ed-82c8-e550ea330664'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Esey tewelede [yealem medhanit (3)]
Yiኸw tewelede [yealem medhanit (3) ]
Tinbit tenageru [nebyat bemulu (3)]
Amlak qedamawi [yiwerdal eyalu (3)]

VERSE 1
…az…
Seba segel met’u [lisegdu bemulu (3)]
Yeesrael nigus [teweldwal eyalu (3)]
…az…

CHORUS
Esey tewelede [yealem medhanit (3)]
Yiኸw tewelede [yealem medhanit (3) ]
Tinbit tenageru [nebyat bemulu (3)]
Amlak qedamawi [yiwerdal eyalu (3)]

VERSE 2
Seba segel met’u [yizew ej mensha (3)]
Werq et’anun kerbe [leMaryam ej mensha (3)]
…az…
Besorya taye [fet’ari ende engda (3)]

CHORUS
Esey tewelede [yealem medhanit (3)]
Yiኸw tewelede [yealem medhanit (3) ]
Tinbit tenageru [nebyat bemulu (3)]
Amlak qedamawi [yiwerdal eyalu (3)]

VERSE 3
Bisrate lidetun [lehulum liyasreda (3)]
…az…
Hits’anat enhid [lidetu bet (3)]
Wiha honwalna [marna wetet (3)]

CHORUS
Esey tewelede [yealem medhanit (3)]
Yiኸw tewelede [yealem medhanit (3) ]
Tinbit tenageru [nebyat bemulu (3)]
Amlak qedamawi [yiwerdal eyalu (3)]'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 1
…አዝ…
ሰብዓ ሰገል መጡ [ሊሰግዱ በሙሉ (3)]
የእስራኤል ንጉስ [ተወልዷል እያሉ (3)]
…አዝ…

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 2
ሰብዓ ሰገል መጡ [ይዘው እጅ መንሻ (3)]
ወርቅ ዕጣኑን ከርቤ [ለማርያም እጅ መንሻ (3)]
…አዝ…
በሶርያ ታየ [ፈጣሪ እንደ እንግዳ (3)]

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 3
ብስራተ ልደቱን [ለሁሉም ሊያስረዳ (3)]
…አዝ…
ሕጻናት እንሂድ [ልደቱ ቤት (3)]
ውሃ ሆኗልና [ማርና ወተት (3)]

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 1
…አዝ…
ሰብዓ ሰገል መጡ [ሊሰግዱ በሙሉ (3)]
የእስራኤል ንጉስ [ተወልዷል እያሉ (3)]
…አዝ…

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 2
ሰብዓ ሰገል መጡ [ይዘው እጅ መንሻ (3)]
ወርቅ ዕጣኑን ከርቤ [ለማርያም እጅ መንሻ (3)]
…አዝ…
በሶርያ ታየ [ፈጣሪ እንደ እንግዳ (3)]

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 3
ብስራተ ልደቱን [ለሁሉም ሊያስረዳ (3)]
…አዝ…
ሕጻናት እንሂድ [ልደቱ ቤት (3)]
ውሃ ሆኗልና [ማርና ወተት (3)]

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]' THEN lyrics_amharic 
          ELSE 'CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 1
…አዝ…
ሰብዓ ሰገል መጡ [ሊሰግዱ በሙሉ (3)]
የእስራኤል ንጉስ [ተወልዷል እያሉ (3)]
…አዝ…

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 2
ሰብዓ ሰገል መጡ [ይዘው እጅ መንሻ (3)]
ወርቅ ዕጣኑን ከርቤ [ለማርያም እጅ መንሻ (3)]
…አዝ…
በሶርያ ታየ [ፈጣሪ እንደ እንግዳ (3)]

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 3
ብስራተ ልደቱን [ለሁሉም ሊያስረዳ (3)]
…አዝ…
ሕጻናት እንሂድ [ልደቱ ቤት (3)]
ውሃ ሆኗልና [ማርና ወተት (3)]

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]' 
        END,
        lyrics_transliteration = 'CHORUS
Esey tewelede [yealem medhanit (3)]
Yiኸw tewelede [yealem medhanit (3) ]
Tinbit tenageru [nebyat bemulu (3)]
Amlak qedamawi [yiwerdal eyalu (3)]

VERSE 1
…az…
Seba segel met’u [lisegdu bemulu (3)]
Yeesrael nigus [teweldwal eyalu (3)]
…az…

CHORUS
Esey tewelede [yealem medhanit (3)]
Yiኸw tewelede [yealem medhanit (3) ]
Tinbit tenageru [nebyat bemulu (3)]
Amlak qedamawi [yiwerdal eyalu (3)]

VERSE 2
Seba segel met’u [yizew ej mensha (3)]
Werq et’anun kerbe [leMaryam ej mensha (3)]
…az…
Besorya taye [fet’ari ende engda (3)]

CHORUS
Esey tewelede [yealem medhanit (3)]
Yiኸw tewelede [yealem medhanit (3) ]
Tinbit tenageru [nebyat bemulu (3)]
Amlak qedamawi [yiwerdal eyalu (3)]

VERSE 3
Bisrate lidetun [lehulum liyasreda (3)]
…az…
Hits’anat enhid [lidetu bet (3)]
Wiha honwalna [marna wetet (3)]

CHORUS
Esey tewelede [yealem medhanit (3)]
Yiኸw tewelede [yealem medhanit (3) ]
Tinbit tenageru [nebyat bemulu (3)]
Amlak qedamawi [yiwerdal eyalu (3)]',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9e6b9b8b-a3c6-47ed-82c8-e550ea330664'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 1
…አዝ…
ሰብዓ ሰገል መጡ [ሊሰግዱ በሙሉ (3)]
የእስራኤል ንጉስ [ተወልዷል እያሉ (3)]
…አዝ…

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 2
ሰብዓ ሰገል መጡ [ይዘው እጅ መንሻ (3)]
ወርቅ ዕጣኑን ከርቤ [ለማርያም እጅ መንሻ (3)]
…አዝ…
በሶርያ ታየ [ፈጣሪ እንደ እንግዳ (3)]

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]

VERSE 3
ብስራተ ልደቱን [ለሁሉም ሊያስረዳ (3)]
…አዝ…
ሕጻናት እንሂድ [ልደቱ ቤት (3)]
ውሃ ሆኗልና [ማርና ወተት (3)]

CHORUS
እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እሰይ ተወለደ [የዓለም መድኃኒት (3)]
ይኸው ተወለደ [የዓለም መድኃኒት (3) ]
ትንቢት ተናገሩ [ነብያት በሙሉ (3)]
አምላክ ቀዳማዊ [ይወርዳል እያሉ (3)]
…አዝ…
ሰብዓ ሰገል መጡ [ሊሰግዱ በሙሉ (3)]
የእስራኤል ንጉስ [ተወልዷል እያሉ (3)]
…አዝ…
ሰብዓ ሰገል መጡ [ይዘው እጅ መንሻ (3)]
ወርቅ ዕጣኑን ከርቤ [ለማርያም እጅ መንሻ (3)]
…አዝ…
በሶርያ ታየ [ፈጣሪ እንደ እንግዳ (3)]
ብስራተ ልደቱን [ለሁሉም ሊያስረዳ (3)]
…አዝ…
ሕጻናት እንሂድ [ልደቱ ቤት (3)]
ውሃ ሆኗልና [ማርና ወተት (3)]'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9e6b9b8b-a3c6-47ed-82c8-e550ea330664'::uuid, 'esey-tewelede-4348', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ewenetayaw-selam ("እውነተኛው ሰላም")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '826d9a45-fccb-473a-8a18-27e2cc4f10f6'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 1
Kante meleyete nefsen adkmotal
Wedeante melsegn ene emelesalehu
Ewnetegna selam yalew kebeth new
CHORUS

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 2
Leqdase ts’elot zewtr endaltegahu
Badebabay qume simkn endalt’erahu
Tesenekakye wedqealehuna
Erdagn Amanuel beheymanot lits’na

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 3
CHORUS
Ayne enban yamnch’ lalqs sile hat’yate
Yenshe tihun qeriwa hiywete
Bemedane seat bezarewa elet

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 4
Fiqrhn asbe met’ahu kante fit
CHORUS
Geta hoy ts’eloten enbayen teqebel
Abatsh negn belegn enem lij negn libel

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 5
Zeyt salazegaj dinget metehbgn
Berhn bemezgat kedejh atasqeregn

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 1
ካንተ መለየቴ ነፍሴን አድክሞታል
ወደአንተ መልሰኝ እኔ እመለሳለሁ
እውነተኛ ሰላም ያለው ከቤትህ ነው
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 2
ለቅዳሴ ፀሎት ዘውትር እንዳልተጋሁ
ባደባባይ ቁሜ ስምክን እንዳልጠራሁ
ተሰነካክየ ወድቄአለሁና
እርዳኝ አማኑኤል በሀይማኖት ልፅና

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 3
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
አይኔ እንባን ያምንጭ ላልቅስ ስለ ሃጥያቴ
የንስሀ ትሁን ቀሪዋ ሕይወቴ
በመዳኔ ሰአት በዛሬዋ እለት

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 4
ፍቅርህን አስቤ መጣሁ ካንተ ፊት
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡።፡።፡፡።።።።።፡፡።።
ጌታ ሆይ ጸሎቴን እንባዬን ተቀበል
አባትሽ ነኝ በለኝ እኔም ልጅ ነኝ ልበል

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 5
ዘይት ሳላዘጋጅ ድንገት መተህብኝ
በርህን በመዝጋት ከደጅህ አታስቀረኝ

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 1
ካንተ መለየቴ ነፍሴን አድክሞታል
ወደአንተ መልሰኝ እኔ እመለሳለሁ
እውነተኛ ሰላም ያለው ከቤትህ ነው
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 2
ለቅዳሴ ፀሎት ዘውትር እንዳልተጋሁ
ባደባባይ ቁሜ ስምክን እንዳልጠራሁ
ተሰነካክየ ወድቄአለሁና
እርዳኝ አማኑኤል በሀይማኖት ልፅና

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 3
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
አይኔ እንባን ያምንጭ ላልቅስ ስለ ሃጥያቴ
የንስሀ ትሁን ቀሪዋ ሕይወቴ
በመዳኔ ሰአት በዛሬዋ እለት

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 4
ፍቅርህን አስቤ መጣሁ ካንተ ፊት
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡።፡።፡፡።።።።።፡፡።።
ጌታ ሆይ ጸሎቴን እንባዬን ተቀበል
አባትሽ ነኝ በለኝ እኔም ልጅ ነኝ ልበል

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 5
ዘይት ሳላዘጋጅ ድንገት መተህብኝ
በርህን በመዝጋት ከደጅህ አታስቀረኝ

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል' THEN lyrics_amharic 
          ELSE 'CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 1
ካንተ መለየቴ ነፍሴን አድክሞታል
ወደአንተ መልሰኝ እኔ እመለሳለሁ
እውነተኛ ሰላም ያለው ከቤትህ ነው
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 2
ለቅዳሴ ፀሎት ዘውትር እንዳልተጋሁ
ባደባባይ ቁሜ ስምክን እንዳልጠራሁ
ተሰነካክየ ወድቄአለሁና
እርዳኝ አማኑኤል በሀይማኖት ልፅና

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 3
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
አይኔ እንባን ያምንጭ ላልቅስ ስለ ሃጥያቴ
የንስሀ ትሁን ቀሪዋ ሕይወቴ
በመዳኔ ሰአት በዛሬዋ እለት

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 4
ፍቅርህን አስቤ መጣሁ ካንተ ፊት
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡።፡።፡፡።።።።።፡፡።።
ጌታ ሆይ ጸሎቴን እንባዬን ተቀበል
አባትሽ ነኝ በለኝ እኔም ልጅ ነኝ ልበል

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 5
ዘይት ሳላዘጋጅ ድንገት መተህብኝ
በርህን በመዝጋት ከደጅህ አታስቀረኝ

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል' 
        END,
        lyrics_transliteration = 'CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 1
Kante meleyete nefsen adkmotal
Wedeante melsegn ene emelesalehu
Ewnetegna selam yalew kebeth new
CHORUS

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 2
Leqdase ts’elot zewtr endaltegahu
Badebabay qume simkn endalt’erahu
Tesenekakye wedqealehuna
Erdagn Amanuel beheymanot lits’na

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 3
CHORUS
Ayne enban yamnch’ lalqs sile hat’yate
Yenshe tihun qeriwa hiywete
Bemedane seat bezarewa elet

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 4
Fiqrhn asbe met’ahu kante fit
CHORUS
Geta hoy ts’eloten enbayen teqebel
Abatsh negn belegn enem lij negn libel

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal

VERSE 5
Zeyt salazegaj dinget metehbgn
Berhn bemezgat kedejh atasqeregn

CHORUS
Ewnetegna selam yalew kebeth new (2)
Erdagn alnawets’ elemnhelehu (2)

Het’iyaten sasbew libe yich’eneqal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '826d9a45-fccb-473a-8a18-27e2cc4f10f6'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 1
ካንተ መለየቴ ነፍሴን አድክሞታል
ወደአንተ መልሰኝ እኔ እመለሳለሁ
እውነተኛ ሰላም ያለው ከቤትህ ነው
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 2
ለቅዳሴ ፀሎት ዘውትር እንዳልተጋሁ
ባደባባይ ቁሜ ስምክን እንዳልጠራሁ
ተሰነካክየ ወድቄአለሁና
እርዳኝ አማኑኤል በሀይማኖት ልፅና

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 3
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
አይኔ እንባን ያምንጭ ላልቅስ ስለ ሃጥያቴ
የንስሀ ትሁን ቀሪዋ ሕይወቴ
በመዳኔ ሰአት በዛሬዋ እለት

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 4
ፍቅርህን አስቤ መጣሁ ካንተ ፊት
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡።፡።፡፡።።።።።፡፡።።
ጌታ ሆይ ጸሎቴን እንባዬን ተቀበል
አባትሽ ነኝ በለኝ እኔም ልጅ ነኝ ልበል

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 5
ዘይት ሳላዘጋጅ ድንገት መተህብኝ
በርህን በመዝጋት ከደጅህ አታስቀረኝ

CHORUS
እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እውነተኛ ሰላም ያለው ከቤትህ ነው (፪)
እርዳኝ አልናወፅ እለምንሀለሁ (፪)
፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ሀጢያቴን ሳስበው ልቤ ይጨነቃል
ካንተ መለየቴ ነፍሴን አድክሞታል
ወደአንተ መልሰኝ እኔ እመለሳለሁ
እውነተኛ ሰላም ያለው ከቤትህ ነው
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
ለቅዳሴ ፀሎት ዘውትር እንዳልተጋሁ
ባደባባይ ቁሜ ስምክን እንዳልጠራሁ
ተሰነካክየ ወድቄአለሁና
እርዳኝ አማኑኤል በሀይማኖት ልፅና
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡
አይኔ እንባን ያምንጭ ላልቅስ ስለ ሃጥያቴ
የንስሀ ትሁን ቀሪዋ ሕይወቴ
በመዳኔ ሰአት በዛሬዋ እለት
ፍቅርህን አስቤ መጣሁ ካንተ ፊት
አዝ፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡፡።፡።፡፡።።።።።፡፡።።
ጌታ ሆይ ጸሎቴን እንባዬን ተቀበል
አባትሽ ነኝ በለኝ እኔም ልጅ ነኝ ልበል
ዘይት ሳላዘጋጅ ድንገት መተህብኝ
በርህን በመዝጋት ከደጅህ አታስቀረኝ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '826d9a45-fccb-473a-8a18-27e2cc4f10f6'::uuid, 'ewenetayaw-selam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemenna ("ዘመንና")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f2a707c4-d4ea-4606-9a39-d76c943c39da'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)

VERSE 1
Ziwefere kulu biselam kimles
Zit’efa shshayna degimna kinhafs
Wilud mis weladi niኽteaኻኸb
Nemaezn hiywetna niqalu bimsab

CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)

VERSE 2
Bits’ebeba shgr bibzuh mahleኻ
Zehlefnayo zemen niኸbqe beqa
Silassie barኹ nay tariኽna sened
Zihazene libi zelalem kiebed

CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)

VERSE 3
Niayhi nibatna kenets’hyo lomi
Degim yiaኽlena gibrtat nay ami
Niftwet sigana nigt’emo bidlo
Taos misana''yu kulu zikealo

CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)

VERSE 4
Bihagos keeleqlq libna kifsah
Nihat’yat nits’eyef bimlat ninesah
Ab qereba enkelo niu emo nedhyo
Wihbet ts’ega emlaኽ nieu ina nireyo

CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 1
ዝወፈረ ኩሉ ብሰላም ክምለስ
ዝጠፍአ ሽሻይና ደጊምና ክንሓፍስ
ውሉድ ምስ ወላዲ ንኽተኣኻኸብ
ነማእዝን ሕይወትና ንቃሉ ብምስዓብ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 2
ብጸበባ ሽግር ብብዙሕ ማሕለኻ
ዘሕለፍናዮ ዘመን ንኸብቅዕ በቃ
ስላሴ ባርኹ ናይ ታሪኽና ሰነድ
ዝሓዘነ ልቢ ዘልኣለም ክእበድ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 3
ንኣይሂ ንብዓትና ከነጽሕዮ ሎሚ
ደጊም ይኣኽለና ግብርታት ናይ ዓሚ
ንፍትወት ስጋና ንግጠሞ ብድሎ
ታኦስ ምሳና''ዩ ኩሉ ዝከኣሎ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 4
ብሓጎስ ከዕለቅልቅ ልብና ክፍሳሕ
ንሓጥያት ንጸየፍ ብምልኣት ንነሳሕ
ኣብ ቀረባ እንከሎ ንዑ እሞ ነድህዮ
ውህበት ጸጋ እምላኽ ንዕኡ ኢና ንርእዮ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 1
ዝወፈረ ኩሉ ብሰላም ክምለስ
ዝጠፍአ ሽሻይና ደጊምና ክንሓፍስ
ውሉድ ምስ ወላዲ ንኽተኣኻኸብ
ነማእዝን ሕይወትና ንቃሉ ብምስዓብ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 2
ብጸበባ ሽግር ብብዙሕ ማሕለኻ
ዘሕለፍናዮ ዘመን ንኸብቅዕ በቃ
ስላሴ ባርኹ ናይ ታሪኽና ሰነድ
ዝሓዘነ ልቢ ዘልኣለም ክእበድ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 3
ንኣይሂ ንብዓትና ከነጽሕዮ ሎሚ
ደጊም ይኣኽለና ግብርታት ናይ ዓሚ
ንፍትወት ስጋና ንግጠሞ ብድሎ
ታኦስ ምሳና''ዩ ኩሉ ዝከኣሎ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 4
ብሓጎስ ከዕለቅልቅ ልብና ክፍሳሕ
ንሓጥያት ንጸየፍ ብምልኣት ንነሳሕ
ኣብ ቀረባ እንከሎ ንዑ እሞ ነድህዮ
ውህበት ጸጋ እምላኽ ንዕኡ ኢና ንርእዮ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)' THEN lyrics_amharic 
          ELSE 'CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 1
ዝወፈረ ኩሉ ብሰላም ክምለስ
ዝጠፍአ ሽሻይና ደጊምና ክንሓፍስ
ውሉድ ምስ ወላዲ ንኽተኣኻኸብ
ነማእዝን ሕይወትና ንቃሉ ብምስዓብ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 2
ብጸበባ ሽግር ብብዙሕ ማሕለኻ
ዘሕለፍናዮ ዘመን ንኸብቅዕ በቃ
ስላሴ ባርኹ ናይ ታሪኽና ሰነድ
ዝሓዘነ ልቢ ዘልኣለም ክእበድ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 3
ንኣይሂ ንብዓትና ከነጽሕዮ ሎሚ
ደጊም ይኣኽለና ግብርታት ናይ ዓሚ
ንፍትወት ስጋና ንግጠሞ ብድሎ
ታኦስ ምሳና''ዩ ኩሉ ዝከኣሎ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 4
ብሓጎስ ከዕለቅልቅ ልብና ክፍሳሕ
ንሓጥያት ንጸየፍ ብምልኣት ንነሳሕ
ኣብ ቀረባ እንከሎ ንዑ እሞ ነድህዮ
ውህበት ጸጋ እምላኽ ንዕኡ ኢና ንርእዮ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)' 
        END,
        lyrics_transliteration = 'CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)

VERSE 1
Ziwefere kulu biselam kimles
Zit’efa shshayna degimna kinhafs
Wilud mis weladi niኽteaኻኸb
Nemaezn hiywetna niqalu bimsab

CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)

VERSE 2
Bits’ebeba shgr bibzuh mahleኻ
Zehlefnayo zemen niኸbqe beqa
Silassie barኹ nay tariኽna sened
Zihazene libi zelalem kiebed

CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)

VERSE 3
Niayhi nibatna kenets’hyo lomi
Degim yiaኽlena gibrtat nay ami
Niftwet sigana nigt’emo bidlo
Taos misana''yu kulu zikealo

CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)

VERSE 4
Bihagos keeleqlq libna kifsah
Nihat’yat nits’eyef bimlat ninesah
Ab qereba enkelo niu emo nedhyo
Wihbet ts’ega emlaኽ nieu ina nireyo

CHORUS
Zemenna kibareኽ amet fiqri kiኾnelna
Zemenna kibareኽ amet selam kiኾnelna
Nilemnom bihbret kulna
Silassie iyom ts’egena waltana (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f2a707c4-d4ea-4606-9a39-d76c943c39da'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 1
ዝወፈረ ኩሉ ብሰላም ክምለስ
ዝጠፍአ ሽሻይና ደጊምና ክንሓፍስ
ውሉድ ምስ ወላዲ ንኽተኣኻኸብ
ነማእዝን ሕይወትና ንቃሉ ብምስዓብ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 2
ብጸበባ ሽግር ብብዙሕ ማሕለኻ
ዘሕለፍናዮ ዘመን ንኸብቅዕ በቃ
ስላሴ ባርኹ ናይ ታሪኽና ሰነድ
ዝሓዘነ ልቢ ዘልኣለም ክእበድ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 3
ንኣይሂ ንብዓትና ከነጽሕዮ ሎሚ
ደጊም ይኣኽለና ግብርታት ናይ ዓሚ
ንፍትወት ስጋና ንግጠሞ ብድሎ
ታኦስ ምሳና''ዩ ኩሉ ዝከኣሎ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)

VERSE 4
ብሓጎስ ከዕለቅልቅ ልብና ክፍሳሕ
ንሓጥያት ንጸየፍ ብምልኣት ንነሳሕ
ኣብ ቀረባ እንከሎ ንዑ እሞ ነድህዮ
ውህበት ጸጋ እምላኽ ንዕኡ ኢና ንርእዮ

CHORUS
ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ዘመንና ክባረኽ ዓመት ፍቅሪ ክኾነልና
ዘመንና ክባረኽ ዓመት ሰላም ክኾነልና
ንለምኖም ብሕብረት ኩልና
ስላሴ ኢዮም ጸግዕና ዋልታና(2)
ዝወፈረ ኩሉ ብሰላም ክምለስ
ዝጠፍአ ሽሻይና ደጊምና ክንሓፍስ
ውሉድ ምስ ወላዲ ንኽተኣኻኸብ
ነማእዝን ሕይወትና ንቃሉ ብምስዓብ
ብጸበባ ሽግር ብብዙሕ ማሕለኻ
ዘሕለፍናዮ ዘመን ንኸብቅዕ በቃ
ስላሴ ባርኹ ናይ ታሪኽና ሰነድ
ዝሓዘነ ልቢ ዘልኣለም ክእበድ
ንኣይሂ ንብዓትና ከነጽሕዮ ሎሚ
ደጊም ይኣኽለና ግብርታት ናይ ዓሚ
ንፍትወት ስጋና ንግጠሞ ብድሎ
ታኦስ ምሳና''ዩ ኩሉ ዝከኣሎ
ብሓጎስ ከዕለቅልቅ ልብና ክፍሳሕ
ንሓጥያት ንጸየፍ ብምልኣት ንነሳሕ
ኣብ ቀረባ እንከሎ ንዑ እሞ ነድህዮ
ውህበት ጸጋ እምላኽ ንዕኡ ኢና ንርእዮ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f2a707c4-d4ea-4606-9a39-d76c943c39da'::uuid, 'zemenna', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yekidane-mihiret-mezimur ("የኪዳነ ምህረት መዝሙር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '57421d2c-8ee2-44e4-b7c1-ecd50103580e'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 1
Yeabatwan dawit tinbit litfets’m
Werqun tegonats’fa beqegnu litqom
Wede amlak maderiya wede semayat
Aregelech beellta Dingil yeegna enat

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 2
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 3
Semayat yikefet demenam yizerga
Zimtam aynorm eme amlak arga
Andebet yikefet Maryamn yamesgn
Kezelalem t’fat bemljawa endndn

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 4
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 5
Yeamlak maderiya Kidus sigash
Amlakn yaqefut eneziya ejochsh
Musna meqabr yizo alasqerachew
Tenestewal bekbr beemnet ayenachew

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 6
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 7
Hewaryat abew enkwan des alachhu
Bekbr aregech Maryam mogesachhu
Wede alemm wit’u sebenuwan yizachhu
Yedngl ergetwan nigeru tegtachhu

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 8
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 1
የአባቷን ዳዊት ትንቢት ልትፈፅም
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገለች በእልልታ ድንግል የእኛ እናት

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 2
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 3
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘላለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 4
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 5
የአምላክ ማደሪያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 6
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 7
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 8
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 1
የአባቷን ዳዊት ትንቢት ልትፈፅም
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገለች በእልልታ ድንግል የእኛ እናት

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 2
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 3
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘላለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 4
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 5
የአምላክ ማደሪያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 6
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 7
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 8
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች' THEN lyrics_amharic 
          ELSE 'CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 1
የአባቷን ዳዊት ትንቢት ልትፈፅም
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገለች በእልልታ ድንግል የእኛ እናት

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 2
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 3
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘላለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 4
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 5
የአምላክ ማደሪያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 6
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 7
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 8
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች' 
        END,
        lyrics_transliteration = 'CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 1
Yeabatwan dawit tinbit litfets’m
Werqun tegonats’fa beqegnu litqom
Wede amlak maderiya wede semayat
Aregelech beellta Dingil yeegna enat

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 2
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 3
Semayat yikefet demenam yizerga
Zimtam aynorm eme amlak arga
Andebet yikefet Maryamn yamesgn
Kezelalem t’fat bemljawa endndn

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 4
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 5
Yeamlak maderiya Kidus sigash
Amlakn yaqefut eneziya ejochsh
Musna meqabr yizo alasqerachew
Tenestewal bekbr beemnet ayenachew

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 6
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 7
Hewaryat abew enkwan des alachhu
Bekbr aregech Maryam mogesachhu
Wede alemm wit’u sebenuwan yizachhu
Yedngl ergetwan nigeru tegtachhu

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech

VERSE 8
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt eyaregagwat
Erswam ende lijwa tenestalech',
        updated_at = clock_timestamp()::text
    WHERE import_id = '57421d2c-8ee2-44e4-b7c1-ecd50103580e'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 1
የአባቷን ዳዊት ትንቢት ልትፈፅም
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገለች በእልልታ ድንግል የእኛ እናት

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 2
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 3
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘላለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 4
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 5
የአምላክ ማደሪያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 6
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 7
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች

VERSE 8
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ማርያም አርጋለች ወደ ገነት/2/
የሰማይ መላእክት እያረጋጓት
እርሷም እንደ ልጇ ተነስታለች
አዝ
የአባቷን ዳዊት ትንቢት ልትፈፅም
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገለች በእልልታ ድንግል የእኛ እናት
አርጋለች ማርያም ተነስታለች
አዝ
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘላለም ጥፋት በምልጃዋ እንድንድን
አርጋለች ማርያም ተነስታለች
አዝ
የአምላክ ማደሪያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው
አርጋለች ማርያም ተነስታለች
አዝ
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ
አርጋለች ማርያም ተነስታለች'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '57421d2c-8ee2-44e4-b7c1-ecd50103580e'::uuid, 'yekidane-mihiret-mezimur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fetereten-bemeyasemer ("ፍጥረትን መቢያስምር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '90989202-18bc-4234-897c-1ab38b1e10df'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 1
Tabote mist’iru yiqdus qal enat
Yekhnet meaza yeshtwachew muday
Yeet’anu maet’ent sewasew yeadonay
Yeet’anu maet’ent sewasew sewasew yeadonay

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 2
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 3
Esrael kesdet kegbts’ sidnu
Talaqun ej aytew bemuse endamenu
Kets’elaye senay gizot lamelet’n
Yetamenech enat kemesqel teset’en

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 4
Yetamenech enat kemesqel kemesqel teset’en
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 5
Leerswa kaltegeza hizbuna mengstu
Fets’mo yit’efal yilal betbitu
Ts’yon ts’ewenachn adisitwa hemer
Yetesfaw fits’ame sisay nat left’ur

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 6
Yetesfaw fits’ame sisay nat sisay nat left’ur
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 1
ታቦተ ምስጢሩ ይቅዱስ ቃል እናት
የክህነት መዓዛ የሽቷቸው ሙዳይ
የእጣኑ ማዕጠንት ሰዋሰው የአዶናይ
የእጣኑ ማዕጠንት ሰዋሰው ሰዋሰው የአዶናይ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 2
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 3
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላየ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 4
የታመነች እናት ከመስቀል ከመስቀል ተሰጠን
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 5
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትቢቱ
ጽዮን ጸወናችን አዲሲቷ ሀመር
የተስፋው ፍጻሜ ሲሳይ ናት ለፍጡር

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 6
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 1
ታቦተ ምስጢሩ ይቅዱስ ቃል እናት
የክህነት መዓዛ የሽቷቸው ሙዳይ
የእጣኑ ማዕጠንት ሰዋሰው የአዶናይ
የእጣኑ ማዕጠንት ሰዋሰው ሰዋሰው የአዶናይ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 2
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 3
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላየ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 4
የታመነች እናት ከመስቀል ከመስቀል ተሰጠን
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 5
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትቢቱ
ጽዮን ጸወናችን አዲሲቷ ሀመር
የተስፋው ፍጻሜ ሲሳይ ናት ለፍጡር

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 6
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት' THEN lyrics_amharic 
          ELSE 'CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 1
ታቦተ ምስጢሩ ይቅዱስ ቃል እናት
የክህነት መዓዛ የሽቷቸው ሙዳይ
የእጣኑ ማዕጠንት ሰዋሰው የአዶናይ
የእጣኑ ማዕጠንት ሰዋሰው ሰዋሰው የአዶናይ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 2
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 3
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላየ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 4
የታመነች እናት ከመስቀል ከመስቀል ተሰጠን
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 5
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትቢቱ
ጽዮን ጸወናችን አዲሲቷ ሀመር
የተስፋው ፍጻሜ ሲሳይ ናት ለፍጡር

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 6
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት' 
        END,
        lyrics_transliteration = 'CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 1
Tabote mist’iru yiqdus qal enat
Yekhnet meaza yeshtwachew muday
Yeet’anu maet’ent sewasew yeadonay
Yeet’anu maet’ent sewasew sewasew yeadonay

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 2
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 3
Esrael kesdet kegbts’ sidnu
Talaqun ej aytew bemuse endamenu
Kets’elaye senay gizot lamelet’n
Yetamenech enat kemesqel teset’en

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 4
Yetamenech enat kemesqel kemesqel teset’en
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 5
Leerswa kaltegeza hizbuna mengstu
Fets’mo yit’efal yilal betbitu
Ts’yon ts’ewenachn adisitwa hemer
Yetesfaw fits’ame sisay nat left’ur

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat

VERSE 6
Yetesfaw fits’ame sisay nat sisay nat left’ur
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr beenatu limena
Kristos yimaren mehari newna
Kristos yimaren mehari newna
Kahnat bemeqdes yemiyageleglwat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '90989202-18bc-4234-897c-1ab38b1e10df'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 1
ታቦተ ምስጢሩ ይቅዱስ ቃል እናት
የክህነት መዓዛ የሽቷቸው ሙዳይ
የእጣኑ ማዕጠንት ሰዋሰው የአዶናይ
የእጣኑ ማዕጠንት ሰዋሰው ሰዋሰው የአዶናይ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 2
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 3
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላየ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 4
የታመነች እናት ከመስቀል ከመስቀል ተሰጠን
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 5
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትቢቱ
ጽዮን ጸወናችን አዲሲቷ ሀመር
የተስፋው ፍጻሜ ሲሳይ ናት ለፍጡር

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት

VERSE 6
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር
በአሚነ ዚዓሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ፍጥረትን በሚያስምር በእናቱ ልመና
ክርስቶስ ይማረን መሃሪ ነውና
ክርስቶስ ይማረን መሃሪ ነውና
ካህናት በመቅደስ የሚያገለግሏት
ታቦተ ምስጢሩ ይቅዱስ ቃል እናት
የክህነት መዓዛ የሽቷቸው ሙዳይ
የእጣኑ ማዕጠንት ሰዋሰው የአዶናይ
የእጣኑ ማዕጠንት ሰዋሰው ሰዋሰው የአዶናይ
በአሚነ ዚዓሀ ለማርያም ንገኒ
አዝ....
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላየ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን
የታመነች እናት ከመስቀል ከመስቀል ተሰጠን
በአሚነ ዚዓሀ ለማርያም ንገኒ
አዝ....
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትቢቱ
ጽዮን ጸወናችን አዲሲቷ ሀመር
የተስፋው ፍጻሜ ሲሳይ ናት ለፍጡር
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር
በአሚነ ዚዓሀ ለማርያም ንገኒ
አዝ....'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '90989202-18bc-4234-897c-1ab38b1e10df'::uuid, 'fetereten-bemeyasemer', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- shmki-ndeki-seb-orthodox-tigrigna-mezmur ("ስምሽን ለልጅ እነግራለሁ ሽምኪ ንደቂ ሰብ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1cc7c8ec-66a7-40ba-8a97-891b93a4274a'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Shmki nideqi seb ኽnegr eye
Adeway bishmki seb ኾyne eye
Maryam ኽbleki nieni
Maebel keywesedeni

VERSE 1
Maryam ile shmki mits’waay
Aqli siine eye bado ኾynu gezay
Yeeyntey kab nibat hazen arhቕley
Libኺ yimeles nabay Dingil adey

CHORUS
Shmki nideqi seb ኽnegr eye
Adeway bishmki seb ኾyne eye
Maryam ኽbleki nieni
Maebel keywesedeni

VERSE 2
T''bahrim temela yiamno''ye wedኺ
Kisad ayednnn adeway ts’elotki
Nishmki ኽts’we zergihe yeedawey
Meቕteliom derbiyom ኹlom ts’elaetey

CHORUS
Shmki nideqi seb ኽnegr eye
Adeway bishmki seb ኾyne eye
Maryam ኽbleki nieni
Maebel keywesedeni

VERSE 3
Selam''win aleni hiji yifelt’o''ye
Zibezehe ኽbri baaki rekibe''ye
Temelkitu alem bezihu shshayey
Bits’elotki ts’egbe zit’emeyo libey

CHORUS
Shmki nideqi seb ኽnegr eye
Adeway bishmki seb ኾyne eye
Maryam ኽbleki nieni
Maebel keywesedeni'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 1
ማርያም ኢለ ሽምኪ ምፅዋዐይ
ዓቅሊ ስኢነ እየ ባዶ ኾይኑ ገዛይ
የዕይንተይ ካብ ንብዓት ሓዘን አርሕቕለይ
ልብኺ ይመለስ ናባይ ድንግል አደይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 2
ት''ባሕሪም ተመልአ ይአምኖ''የ ወድኺ
ክሳድ አየድንንን አደዋይ ጸሎትኪ
ንሽምኪ ኽፅውዕ ዘርጊሐ የእዳወይ
መቕተሊኦም ደርቢዮም ኹሎም ጸላእተይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 3
ሰላም''ውን አለኒ ሕጂ ይፈልጦ''የ
ዝበዘሐ ኽብሪ ባአኪ ረኪበ''የ
ተመልኪቱ ዓለም በዚሑ ሽሻየይ
ብጸሎትኪ ጸግበ ዝጠመዮ ልበይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 1
ማርያም ኢለ ሽምኪ ምፅዋዐይ
ዓቅሊ ስኢነ እየ ባዶ ኾይኑ ገዛይ
የዕይንተይ ካብ ንብዓት ሓዘን አርሕቕለይ
ልብኺ ይመለስ ናባይ ድንግል አደይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 2
ት''ባሕሪም ተመልአ ይአምኖ''የ ወድኺ
ክሳድ አየድንንን አደዋይ ጸሎትኪ
ንሽምኪ ኽፅውዕ ዘርጊሐ የእዳወይ
መቕተሊኦም ደርቢዮም ኹሎም ጸላእተይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 3
ሰላም''ውን አለኒ ሕጂ ይፈልጦ''የ
ዝበዘሐ ኽብሪ ባአኪ ረኪበ''የ
ተመልኪቱ ዓለም በዚሑ ሽሻየይ
ብጸሎትኪ ጸግበ ዝጠመዮ ልበይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ' THEN lyrics_amharic 
          ELSE 'CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 1
ማርያም ኢለ ሽምኪ ምፅዋዐይ
ዓቅሊ ስኢነ እየ ባዶ ኾይኑ ገዛይ
የዕይንተይ ካብ ንብዓት ሓዘን አርሕቕለይ
ልብኺ ይመለስ ናባይ ድንግል አደይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 2
ት''ባሕሪም ተመልአ ይአምኖ''የ ወድኺ
ክሳድ አየድንንን አደዋይ ጸሎትኪ
ንሽምኪ ኽፅውዕ ዘርጊሐ የእዳወይ
መቕተሊኦም ደርቢዮም ኹሎም ጸላእተይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 3
ሰላም''ውን አለኒ ሕጂ ይፈልጦ''የ
ዝበዘሐ ኽብሪ ባአኪ ረኪበ''የ
ተመልኪቱ ዓለም በዚሑ ሽሻየይ
ብጸሎትኪ ጸግበ ዝጠመዮ ልበይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ' 
        END,
        lyrics_transliteration = 'CHORUS
Shmki nideqi seb ኽnegr eye
Adeway bishmki seb ኾyne eye
Maryam ኽbleki nieni
Maebel keywesedeni

VERSE 1
Maryam ile shmki mits’waay
Aqli siine eye bado ኾynu gezay
Yeeyntey kab nibat hazen arhቕley
Libኺ yimeles nabay Dingil adey

CHORUS
Shmki nideqi seb ኽnegr eye
Adeway bishmki seb ኾyne eye
Maryam ኽbleki nieni
Maebel keywesedeni

VERSE 2
T''bahrim temela yiamno''ye wedኺ
Kisad ayednnn adeway ts’elotki
Nishmki ኽts’we zergihe yeedawey
Meቕteliom derbiyom ኹlom ts’elaetey

CHORUS
Shmki nideqi seb ኽnegr eye
Adeway bishmki seb ኾyne eye
Maryam ኽbleki nieni
Maebel keywesedeni

VERSE 3
Selam''win aleni hiji yifelt’o''ye
Zibezehe ኽbri baaki rekibe''ye
Temelkitu alem bezihu shshayey
Bits’elotki ts’egbe zit’emeyo libey

CHORUS
Shmki nideqi seb ኽnegr eye
Adeway bishmki seb ኾyne eye
Maryam ኽbleki nieni
Maebel keywesedeni',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1cc7c8ec-66a7-40ba-8a97-891b93a4274a'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 1
ማርያም ኢለ ሽምኪ ምፅዋዐይ
ዓቅሊ ስኢነ እየ ባዶ ኾይኑ ገዛይ
የዕይንተይ ካብ ንብዓት ሓዘን አርሕቕለይ
ልብኺ ይመለስ ናባይ ድንግል አደይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 2
ት''ባሕሪም ተመልአ ይአምኖ''የ ወድኺ
ክሳድ አየድንንን አደዋይ ጸሎትኪ
ንሽምኪ ኽፅውዕ ዘርጊሐ የእዳወይ
መቕተሊኦም ደርቢዮም ኹሎም ጸላእተይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ

VERSE 3
ሰላም''ውን አለኒ ሕጂ ይፈልጦ''የ
ዝበዘሐ ኽብሪ ባአኪ ረኪበ''የ
ተመልኪቱ ዓለም በዚሑ ሽሻየይ
ብጸሎትኪ ጸግበ ዝጠመዮ ልበይ

CHORUS
ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ሽምኪ ንደቂ ሰብ ኽነግር እየ
አደዋይ ብሽምኪ ሰብ ኾይነ እየ
ማርያም ኽብለኪ ንዕኒ
ማዕበል ከይወሰደኒ
ማርያም ኢለ ሽምኪ ምፅዋዐይ
ዓቅሊ ስኢነ እየ ባዶ ኾይኑ ገዛይ
የዕይንተይ ካብ ንብዓት ሓዘን አርሕቕለይ
ልብኺ ይመለስ ናባይ ድንግል አደይ
ት''ባሕሪም ተመልአ ይአምኖ''የ ወድኺ
ክሳድ አየድንንን አደዋይ ጸሎትኪ
ንሽምኪ ኽፅውዕ ዘርጊሐ የእዳወይ
መቕተሊኦም ደርቢዮም ኹሎም ጸላእተይ
ሰላም''ውን አለኒ ሕጂ ይፈልጦ''የ
ዝበዘሐ ኽብሪ ባአኪ ረኪበ''የ
ተመልኪቱ ዓለም በዚሑ ሽሻየይ
ብጸሎትኪ ጸግበ ዝጠመዮ ልበይ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1cc7c8ec-66a7-40ba-8a97-891b93a4274a'::uuid, 'shmki-ndeki-seb-orthodox-tigrigna-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beza-kulu ("beza-kulu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9064a1ee-3a2d-4c48-af97-a849fba469a5'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 1
Qeranyu bidkam bets’he
Afaqiruna demu nafasese
Tereda nay fiqru tergum
Mis moteluy medhanialem

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 2
Az
Waga hibu nebsu ahlifa
Fetihuna seyt’an asiru
Kahsa koynu kefalu eda

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 3
Aygedefenan ab midre beda
Az
Nezi faqru keytrsu
Elet elet simu qedusu

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 4
Kidanuyu zenabrekum
Timkeybl izlsankum
Az
Bimekera tebejyuna

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 5
Dagm hizbu dequ geruna
Aygezanan muqabur nay mot
Awrisna hadsh hiywet

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 1
ቀራንዩ ብድካም በጽሐ
ኣፋቂሩና ደሙ ናፋሰሰ
ተረድአ ናይ ፍቅሩ ቴርጉም
ምስ ሞተሉይ መድሃኒኣለም

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 2
ኣዝ
ዋጋ ሂቡ ነብሱ ኣሕሊፋ
ፈቲሑና ሰይጣን አሲሩ
ካሕሳ ኮይኑ ከፋሉ ዕዳ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 3
ኣይገደፈናን ኣብ ምድረ በዳ
ኣዝ
ነዚ ፋቅሩ ከይትርስዑ
ዕለት ዕለት ስሙ ቀዱሱ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 4
ኪዳኑዩ ዘናብረኩም
ትምከይብል ኢዝልሳንኩም
ኣዝ
ብመከራ ተበጅዩና

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 5
ዳግም ህዝቡ ደቁ ገሩና
ኣይገዝኣናን ሙቃቡር ናይ ሞት
ኣውሪስና ሓድሽ ሂይወት

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 1
ቀራንዩ ብድካም በጽሐ
ኣፋቂሩና ደሙ ናፋሰሰ
ተረድአ ናይ ፍቅሩ ቴርጉም
ምስ ሞተሉይ መድሃኒኣለም

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 2
ኣዝ
ዋጋ ሂቡ ነብሱ ኣሕሊፋ
ፈቲሑና ሰይጣን አሲሩ
ካሕሳ ኮይኑ ከፋሉ ዕዳ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 3
ኣይገደፈናን ኣብ ምድረ በዳ
ኣዝ
ነዚ ፋቅሩ ከይትርስዑ
ዕለት ዕለት ስሙ ቀዱሱ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 4
ኪዳኑዩ ዘናብረኩም
ትምከይብል ኢዝልሳንኩም
ኣዝ
ብመከራ ተበጅዩና

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 5
ዳግም ህዝቡ ደቁ ገሩና
ኣይገዝኣናን ሙቃቡር ናይ ሞት
ኣውሪስና ሓድሽ ሂይወት

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ' THEN lyrics_amharic 
          ELSE 'CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 1
ቀራንዩ ብድካም በጽሐ
ኣፋቂሩና ደሙ ናፋሰሰ
ተረድአ ናይ ፍቅሩ ቴርጉም
ምስ ሞተሉይ መድሃኒኣለም

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 2
ኣዝ
ዋጋ ሂቡ ነብሱ ኣሕሊፋ
ፈቲሑና ሰይጣን አሲሩ
ካሕሳ ኮይኑ ከፋሉ ዕዳ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 3
ኣይገደፈናን ኣብ ምድረ በዳ
ኣዝ
ነዚ ፋቅሩ ከይትርስዑ
ዕለት ዕለት ስሙ ቀዱሱ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 4
ኪዳኑዩ ዘናብረኩም
ትምከይብል ኢዝልሳንኩም
ኣዝ
ብመከራ ተበጅዩና

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 5
ዳግም ህዝቡ ደቁ ገሩና
ኣይገዝኣናን ሙቃቡር ናይ ሞት
ኣውሪስና ሓድሽ ሂይወት

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ' 
        END,
        lyrics_transliteration = 'CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 1
Qeranyu bidkam bets’he
Afaqiruna demu nafasese
Tereda nay fiqru tergum
Mis moteluy medhanialem

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 2
Az
Waga hibu nebsu ahlifa
Fetihuna seyt’an asiru
Kahsa koynu kefalu eda

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 3
Aygedefenan ab midre beda
Az
Nezi faqru keytrsu
Elet elet simu qedusu

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 4
Kidanuyu zenabrekum
Timkeybl izlsankum
Az
Bimekera tebejyuna

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az

VERSE 5
Dagm hizbu dequ geruna
Aygezanan muqabur nay mot
Awrisna hadsh hiywet

CHORUS
Beza kulu nay kulu beza (2)
Adekana bikubur demka
Amaniel hiwetka hibka (2)
Az',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9064a1ee-3a2d-4c48-af97-a849fba469a5'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 1
ቀራንዩ ብድካም በጽሐ
ኣፋቂሩና ደሙ ናፋሰሰ
ተረድአ ናይ ፍቅሩ ቴርጉም
ምስ ሞተሉይ መድሃኒኣለም

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 2
ኣዝ
ዋጋ ሂቡ ነብሱ ኣሕሊፋ
ፈቲሑና ሰይጣን አሲሩ
ካሕሳ ኮይኑ ከፋሉ ዕዳ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 3
ኣይገደፈናን ኣብ ምድረ በዳ
ኣዝ
ነዚ ፋቅሩ ከይትርስዑ
ዕለት ዕለት ስሙ ቀዱሱ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 4
ኪዳኑዩ ዘናብረኩም
ትምከይብል ኢዝልሳንኩም
ኣዝ
ብመከራ ተበጅዩና

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ

VERSE 5
ዳግም ህዝቡ ደቁ ገሩና
ኣይገዝኣናን ሙቃቡር ናይ ሞት
ኣውሪስና ሓድሽ ሂይወት

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ቤዛ ኩሉ ናይ ኩሉ ቤዛ (2)
ዓደካና ብኩቡር ደምካ
ኣማኒኤል ሂወትካ ሂብካ (2)
ኣዝ
ቀራንዩ ብድካም በጽሐ
ኣፋቂሩና ደሙ ናፋሰሰ
ተረድአ ናይ ፍቅሩ ቴርጉም
ምስ ሞተሉይ መድሃኒኣለም
ኣዝ
ዋጋ ሂቡ ነብሱ ኣሕሊፋ
ፈቲሑና ሰይጣን አሲሩ
ካሕሳ ኮይኑ ከፋሉ ዕዳ
ኣይገደፈናን ኣብ ምድረ በዳ
ኣዝ
ነዚ ፋቅሩ ከይትርስዑ
ዕለት ዕለት ስሙ ቀዱሱ
ኪዳኑዩ ዘናብረኩም
ትምከይብል ኢዝልሳንኩም
ኣዝ
ብመከራ ተበጅዩና
ዳግም ህዝቡ ደቁ ገሩና
ኣይገዝኣናን ሙቃቡር ናይ ሞት
ኣውሪስና ሓድሽ ሂይወት'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9064a1ee-3a2d-4c48-af97-a849fba469a5'::uuid, 'beza-kulu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-tigrigna-mezmur-mret-nay-sdetki ("ምረት ናይ ስደትኪ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a97fd546-277e-41bf-b70e-444f19167571'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 1
Nigobo hat’iatey kefrso nibatey
Bihlna milesni
Ab sidetki adey ts’enbrni
Ab sidetki kisatef kiatu

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 2
Ziኾnkiyo kulu wieloኺ kezentu (2)
Set’ah midre beda kitreyo zefrh
Met’en miቖt ts’fhu nidemka zeflh
Shwshwta t''nifas aezanka zenawts’

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 3
Rets’mi maebelatu qerbetka zilhts’ts’
Nisle dihnetna zimerere ts’eyra
Segirato hisem mis bizuh mekera
Bebzha gifeki zebeenti ane

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 4
Maryam astemhri lene
Zinabat zeznb kulu zikealo
Goytana Iyesus ab huqfa enkelo
Ts’mi ts’eniewa kitlmn amrira

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 5
Redai siina zimels niኽbra
Meas tesainwo ts’mata ket’ll
Fiቓdu kwaynu ember mekera kitqbel
"bebzha gifeki zebeenti ane

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 6
Maryam astemhri lene"
Rieyeyo maryamey t''merir sidetki
Mits’ar siineyo qanza siqyatki
Bihalafi shgr fits’um keyemarr

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 7
T''merir sidetki koynni''lo memhr
Sile t''quslኺ mekera ch’nqetki
Azekri Dingil mienti deqኺ
"bebzha gifeki zebeenti ane

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 8
Maryam astemhri lene"

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 1
ንጎቦ ሓጢኣተይ ከፍርሶ ንብዓተይ
ብሕልና ምለስኒ
ኣብ ስደትኪ ኣደይ ጸንብርኒ
ኣብ ስደትኪ ክሳተፍ ክኣቱ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 2
ዝኾንኪዮ ኩሉ ውዕሎኺ ከዘንቱ (2)
ሰጣሕ ምድረ በዳ ክትርእዮ ዘፍርሕ
መጠን ምቖት ጽፍሑ ንደምካ ዘፍልሕ
ሽውሽውታ ት''ንፋስ ኣእዛንካ ዘናውጽ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 3
ረጽሚ ማዕበላቱ ቄርበትካ ዝልሕጽጽ
ንስለ ድሕነትና ዝመረረ ጸይራ
ሰጊራቶ ሕሰም ምስ ብዙሕ መከራ
በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 4
ማርያም ኣስተምሕሪ ለነ
ዝናባት ዘዝንብ ኩሉ ዝከኣሎ
ጎይታና ኢየሱስ ኣብ ሑቅፋ እንከሎ
ጽምኢ ጸኒዕዋ ክትልምን ኣምሪራ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 5
ረዳኢ ስኢና ዝመልስ ንኽብራ
መዓስ ተሳኢንዎ ጽምኣታ ከጥልል
ፍቓዱ ኳይኑ እምበር መከራ ክትቅበል
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 6
ማርያም ኣስተምሕሪ ለነ"
ርእየዮ ማርያመይ ት''መሪር ስደትኪ
ምጻር ስኢነዮ ቃንዛ ስቅያትኪ
ብሓላፊ ሽግር ፍጹም ከየማርር

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 7
ት''መሪር ስደትኪ ኮይንኒ''ሎ መምህር
ስለ ት''ቁስልኺ መከራ ጭንቀትኪ
ኣዘክሪ ድንግል ምእንቲ ደቅኺ
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 8
ማርያም ኣስተምሕሪ ለነ"

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 1
ንጎቦ ሓጢኣተይ ከፍርሶ ንብዓተይ
ብሕልና ምለስኒ
ኣብ ስደትኪ ኣደይ ጸንብርኒ
ኣብ ስደትኪ ክሳተፍ ክኣቱ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 2
ዝኾንኪዮ ኩሉ ውዕሎኺ ከዘንቱ (2)
ሰጣሕ ምድረ በዳ ክትርእዮ ዘፍርሕ
መጠን ምቖት ጽፍሑ ንደምካ ዘፍልሕ
ሽውሽውታ ት''ንፋስ ኣእዛንካ ዘናውጽ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 3
ረጽሚ ማዕበላቱ ቄርበትካ ዝልሕጽጽ
ንስለ ድሕነትና ዝመረረ ጸይራ
ሰጊራቶ ሕሰም ምስ ብዙሕ መከራ
በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 4
ማርያም ኣስተምሕሪ ለነ
ዝናባት ዘዝንብ ኩሉ ዝከኣሎ
ጎይታና ኢየሱስ ኣብ ሑቅፋ እንከሎ
ጽምኢ ጸኒዕዋ ክትልምን ኣምሪራ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 5
ረዳኢ ስኢና ዝመልስ ንኽብራ
መዓስ ተሳኢንዎ ጽምኣታ ከጥልል
ፍቓዱ ኳይኑ እምበር መከራ ክትቅበል
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 6
ማርያም ኣስተምሕሪ ለነ"
ርእየዮ ማርያመይ ት''መሪር ስደትኪ
ምጻር ስኢነዮ ቃንዛ ስቅያትኪ
ብሓላፊ ሽግር ፍጹም ከየማርር

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 7
ት''መሪር ስደትኪ ኮይንኒ''ሎ መምህር
ስለ ት''ቁስልኺ መከራ ጭንቀትኪ
ኣዘክሪ ድንግል ምእንቲ ደቅኺ
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 8
ማርያም ኣስተምሕሪ ለነ"

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ' THEN lyrics_amharic 
          ELSE 'CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 1
ንጎቦ ሓጢኣተይ ከፍርሶ ንብዓተይ
ብሕልና ምለስኒ
ኣብ ስደትኪ ኣደይ ጸንብርኒ
ኣብ ስደትኪ ክሳተፍ ክኣቱ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 2
ዝኾንኪዮ ኩሉ ውዕሎኺ ከዘንቱ (2)
ሰጣሕ ምድረ በዳ ክትርእዮ ዘፍርሕ
መጠን ምቖት ጽፍሑ ንደምካ ዘፍልሕ
ሽውሽውታ ት''ንፋስ ኣእዛንካ ዘናውጽ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 3
ረጽሚ ማዕበላቱ ቄርበትካ ዝልሕጽጽ
ንስለ ድሕነትና ዝመረረ ጸይራ
ሰጊራቶ ሕሰም ምስ ብዙሕ መከራ
በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 4
ማርያም ኣስተምሕሪ ለነ
ዝናባት ዘዝንብ ኩሉ ዝከኣሎ
ጎይታና ኢየሱስ ኣብ ሑቅፋ እንከሎ
ጽምኢ ጸኒዕዋ ክትልምን ኣምሪራ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 5
ረዳኢ ስኢና ዝመልስ ንኽብራ
መዓስ ተሳኢንዎ ጽምኣታ ከጥልል
ፍቓዱ ኳይኑ እምበር መከራ ክትቅበል
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 6
ማርያም ኣስተምሕሪ ለነ"
ርእየዮ ማርያመይ ት''መሪር ስደትኪ
ምጻር ስኢነዮ ቃንዛ ስቅያትኪ
ብሓላፊ ሽግር ፍጹም ከየማርር

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 7
ት''መሪር ስደትኪ ኮይንኒ''ሎ መምህር
ስለ ት''ቁስልኺ መከራ ጭንቀትኪ
ኣዘክሪ ድንግል ምእንቲ ደቅኺ
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 8
ማርያም ኣስተምሕሪ ለነ"

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ' 
        END,
        lyrics_transliteration = 'CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 1
Nigobo hat’iatey kefrso nibatey
Bihlna milesni
Ab sidetki adey ts’enbrni
Ab sidetki kisatef kiatu

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 2
Ziኾnkiyo kulu wieloኺ kezentu (2)
Set’ah midre beda kitreyo zefrh
Met’en miቖt ts’fhu nidemka zeflh
Shwshwta t''nifas aezanka zenawts’

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 3
Rets’mi maebelatu qerbetka zilhts’ts’
Nisle dihnetna zimerere ts’eyra
Segirato hisem mis bizuh mekera
Bebzha gifeki zebeenti ane

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 4
Maryam astemhri lene
Zinabat zeznb kulu zikealo
Goytana Iyesus ab huqfa enkelo
Ts’mi ts’eniewa kitlmn amrira

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 5
Redai siina zimels niኽbra
Meas tesainwo ts’mata ket’ll
Fiቓdu kwaynu ember mekera kitqbel
"bebzha gifeki zebeenti ane

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 6
Maryam astemhri lene"
Rieyeyo maryamey t''merir sidetki
Mits’ar siineyo qanza siqyatki
Bihalafi shgr fits’um keyemarr

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 7
T''merir sidetki koynni''lo memhr
Sile t''quslኺ mekera ch’nqetki
Azekri Dingil mienti deqኺ
"bebzha gifeki zebeenti ane

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley

VERSE 8
Maryam astemhri lene"

CHORUS
Azekri Dingil anba merire zewhze emaentki
Wewerede dibe gets’e fiqur weldki
Miret nay sidetki kibets’ho aemroy
Biኽyat nay wedኺ kidegmo biቓley',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a97fd546-277e-41bf-b70e-444f19167571'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 1
ንጎቦ ሓጢኣተይ ከፍርሶ ንብዓተይ
ብሕልና ምለስኒ
ኣብ ስደትኪ ኣደይ ጸንብርኒ
ኣብ ስደትኪ ክሳተፍ ክኣቱ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 2
ዝኾንኪዮ ኩሉ ውዕሎኺ ከዘንቱ (2)
ሰጣሕ ምድረ በዳ ክትርእዮ ዘፍርሕ
መጠን ምቖት ጽፍሑ ንደምካ ዘፍልሕ
ሽውሽውታ ት''ንፋስ ኣእዛንካ ዘናውጽ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 3
ረጽሚ ማዕበላቱ ቄርበትካ ዝልሕጽጽ
ንስለ ድሕነትና ዝመረረ ጸይራ
ሰጊራቶ ሕሰም ምስ ብዙሕ መከራ
በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 4
ማርያም ኣስተምሕሪ ለነ
ዝናባት ዘዝንብ ኩሉ ዝከኣሎ
ጎይታና ኢየሱስ ኣብ ሑቅፋ እንከሎ
ጽምኢ ጸኒዕዋ ክትልምን ኣምሪራ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 5
ረዳኢ ስኢና ዝመልስ ንኽብራ
መዓስ ተሳኢንዎ ጽምኣታ ከጥልል
ፍቓዱ ኳይኑ እምበር መከራ ክትቅበል
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 6
ማርያም ኣስተምሕሪ ለነ"
ርእየዮ ማርያመይ ት''መሪር ስደትኪ
ምጻር ስኢነዮ ቃንዛ ስቅያትኪ
ብሓላፊ ሽግር ፍጹም ከየማርር

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 7
ት''መሪር ስደትኪ ኮይንኒ''ሎ መምህር
ስለ ት''ቁስልኺ መከራ ጭንቀትኪ
ኣዘክሪ ድንግል ምእንቲ ደቅኺ
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ

VERSE 8
ማርያም ኣስተምሕሪ ለነ"

CHORUS
ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኣዘክሪ ድንግል ኣንብዐ መሪረ ዘውኅዘ እምኣዕንትኪ
ወወረደ ዲበ ገጸ ፍቁር ወልድኪ
ምረት ናይ ስደትኪ ክበጽሖ ኣእምሮይ
ብኽያት ናይ ወድኺ ክደግሞ ብቓለይ
ንጎቦ ሓጢኣተይ ከፍርሶ ንብዓተይ
ብሕልና ምለስኒ
ኣብ ስደትኪ ኣደይ ጸንብርኒ
ኣብ ስደትኪ ክሳተፍ ክኣቱ
ዝኾንኪዮ ኩሉ ውዕሎኺ ከዘንቱ (2)
ሰጣሕ ምድረ በዳ ክትርእዮ ዘፍርሕ
መጠን ምቖት ጽፍሑ ንደምካ ዘፍልሕ
ሽውሽውታ ት''ንፋስ ኣእዛንካ ዘናውጽ
ረጽሚ ማዕበላቱ ቄርበትካ ዝልሕጽጽ
ንስለ ድሕነትና ዝመረረ ጸይራ
ሰጊራቶ ሕሰም ምስ ብዙሕ መከራ
በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ
ማርያም ኣስተምሕሪ ለነ
ዝናባት ዘዝንብ ኩሉ ዝከኣሎ
ጎይታና ኢየሱስ ኣብ ሑቅፋ እንከሎ
ጽምኢ ጸኒዕዋ ክትልምን ኣምሪራ
ረዳኢ ስኢና ዝመልስ ንኽብራ
መዓስ ተሳኢንዎ ጽምኣታ ከጥልል
ፍቓዱ ኳይኑ እምበር መከራ ክትቅበል
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ
ማርያም ኣስተምሕሪ ለነ"
ርእየዮ ማርያመይ ት''መሪር ስደትኪ
ምጻር ስኢነዮ ቃንዛ ስቅያትኪ
ብሓላፊ ሽግር ፍጹም ከየማርር
ት''መሪር ስደትኪ ኮይንኒ''ሎ መምህር
ስለ ት''ቁስልኺ መከራ ጭንቀትኪ
ኣዘክሪ ድንግል ምእንቲ ደቅኺ
"በብዝኃ ግፍዕኪ ዘበእንቲ ኣነ
ማርያም ኣስተምሕሪ ለነ"'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a97fd546-277e-41bf-b70e-444f19167571'::uuid, 'eritrean-orthodox-tewahdo-tigrigna-mezmur-mret-nay-sdetki', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-3760 ("ካብ ሑጻ ባሕሪ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ad2a6616-60c4-4feb-a23d-b41be2688876'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 1
Nisha ziseraeka aykonen nits’adqan
Nizeybedeluኻ niabrham niyshaq
Niyaeqob nimuse akonen nieyob
Niay nihat’e’yo niay niduኹm seb::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 2
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::
Erqaney terife tegefaf ts’egay
Qidmeኻ dew kibl aykeln birkey

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 3
Eney bihat’yat t’enisa welidatni
Goytay nihat’yatey ahlifka aythabeni
Qinue aleኻ amlaኽ kitqets’ani
Qinue aleኻ kitgsts’eni::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 4
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::
Gibri zeybley qalka tezarabi
Ab medreኽ dew ile wengelka mahari

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 5
Zemari wedasi moቕrebi qedasay
Abti Kidus betka mahletka qewamay
Gibri zeybley dendan eyu libey
Gebrher kiኸwn goyta fiቐdeley::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 6
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::
Qalka zekr goyta nay qeranyo
Ab betelhem miwladka zekro

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 7
Eti kulu siቓy mientay’do aykonen
Qalka eyu goyta hakim nihmuman::
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 8
Fiyatawi zeyeman mis lemeneka
Qalu semieka hat’yatu gedifka
Amsleni kemu niay nibaryaኻ
Goyta zekreni ab dagmay mits’atka::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 9
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 1
ንስሓ ዝሰራዕካ ኣይኮነን ንጻድቃን
ንዘይበደሉኻ ንኣብርሃም ንይስሓቅ
ንያዕቆብ ንሙሴ ኣኮነን ንእዮብ
ንዓይ ንሓጥእ’ዮ ንዓይ ንዱኹም ሰብ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 2
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ዕርቃነይ ተሪፈ ተገፋፍ ጸጋይ
ቅድሜኻ ደው ክብል ኣይክእልን ብርከይ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 3
እነይ ብሓጥያት ጠኒሳ ወሊዳትኒ
ጎይታይ ንሓጥያተይ ኣሕሊፍካ ኣይትሃበኒ
ቅኑዕ ኣለኻ ኣምላኽ ክትቀጽዓኒ
ቅኑዕ ኣለኻ ክትግስጸኒ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 4
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ግብሪ ዘይብለይ ቃልካ ተዛራቢ
ኣብ መድረኽ ደው ኢለ ወንጌልካ ማሃሪ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 5
ዘማሪ ወዳሲ ሞቕረቢ ቀዳሳይ
ኣብቲ ቅዱስ ቤትካ ማህሌትካ ቀዋማይ
ግብሪ ዘይብለይ ደንዳን እዩ ልበይ
ገብርሄር ክኸውን ጎይታ ፍቐደለይ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 6
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ቃልካ ዘክር ጎይታ ናይ ቀራንዮ
ኣብ ቤተልሄም ምውላድካ ዘክሮ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 7
እቲ ኩሉ ስቓይ ምእንታይ’ዶ ኣይኮነን
ቃልካ እዩ ጎይታ ሓኪም ንሕሙማን::
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 8
ፍያታዊ ዘየማን ምስ ለመነካ
ቃሉ ሰሚዕካ ሓጥያቱ ገዲፍካ
ኣምስለኒ ከምኡ ንዓይ ንባርያኻ
ጎይታ ዘክረኒ ኣብ ዳግማይ ምጽኣትካ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 9
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 1
ንስሓ ዝሰራዕካ ኣይኮነን ንጻድቃን
ንዘይበደሉኻ ንኣብርሃም ንይስሓቅ
ንያዕቆብ ንሙሴ ኣኮነን ንእዮብ
ንዓይ ንሓጥእ’ዮ ንዓይ ንዱኹም ሰብ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 2
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ዕርቃነይ ተሪፈ ተገፋፍ ጸጋይ
ቅድሜኻ ደው ክብል ኣይክእልን ብርከይ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 3
እነይ ብሓጥያት ጠኒሳ ወሊዳትኒ
ጎይታይ ንሓጥያተይ ኣሕሊፍካ ኣይትሃበኒ
ቅኑዕ ኣለኻ ኣምላኽ ክትቀጽዓኒ
ቅኑዕ ኣለኻ ክትግስጸኒ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 4
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ግብሪ ዘይብለይ ቃልካ ተዛራቢ
ኣብ መድረኽ ደው ኢለ ወንጌልካ ማሃሪ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 5
ዘማሪ ወዳሲ ሞቕረቢ ቀዳሳይ
ኣብቲ ቅዱስ ቤትካ ማህሌትካ ቀዋማይ
ግብሪ ዘይብለይ ደንዳን እዩ ልበይ
ገብርሄር ክኸውን ጎይታ ፍቐደለይ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 6
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ቃልካ ዘክር ጎይታ ናይ ቀራንዮ
ኣብ ቤተልሄም ምውላድካ ዘክሮ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 7
እቲ ኩሉ ስቓይ ምእንታይ’ዶ ኣይኮነን
ቃልካ እዩ ጎይታ ሓኪም ንሕሙማን::
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 8
ፍያታዊ ዘየማን ምስ ለመነካ
ቃሉ ሰሚዕካ ሓጥያቱ ገዲፍካ
ኣምስለኒ ከምኡ ንዓይ ንባርያኻ
ጎይታ ዘክረኒ ኣብ ዳግማይ ምጽኣትካ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 9
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ' THEN lyrics_amharic 
          ELSE 'CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 1
ንስሓ ዝሰራዕካ ኣይኮነን ንጻድቃን
ንዘይበደሉኻ ንኣብርሃም ንይስሓቅ
ንያዕቆብ ንሙሴ ኣኮነን ንእዮብ
ንዓይ ንሓጥእ’ዮ ንዓይ ንዱኹም ሰብ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 2
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ዕርቃነይ ተሪፈ ተገፋፍ ጸጋይ
ቅድሜኻ ደው ክብል ኣይክእልን ብርከይ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 3
እነይ ብሓጥያት ጠኒሳ ወሊዳትኒ
ጎይታይ ንሓጥያተይ ኣሕሊፍካ ኣይትሃበኒ
ቅኑዕ ኣለኻ ኣምላኽ ክትቀጽዓኒ
ቅኑዕ ኣለኻ ክትግስጸኒ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 4
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ግብሪ ዘይብለይ ቃልካ ተዛራቢ
ኣብ መድረኽ ደው ኢለ ወንጌልካ ማሃሪ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 5
ዘማሪ ወዳሲ ሞቕረቢ ቀዳሳይ
ኣብቲ ቅዱስ ቤትካ ማህሌትካ ቀዋማይ
ግብሪ ዘይብለይ ደንዳን እዩ ልበይ
ገብርሄር ክኸውን ጎይታ ፍቐደለይ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 6
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ቃልካ ዘክር ጎይታ ናይ ቀራንዮ
ኣብ ቤተልሄም ምውላድካ ዘክሮ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 7
እቲ ኩሉ ስቓይ ምእንታይ’ዶ ኣይኮነን
ቃልካ እዩ ጎይታ ሓኪም ንሕሙማን::
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 8
ፍያታዊ ዘየማን ምስ ለመነካ
ቃሉ ሰሚዕካ ሓጥያቱ ገዲፍካ
ኣምስለኒ ከምኡ ንዓይ ንባርያኻ
ጎይታ ዘክረኒ ኣብ ዳግማይ ምጽኣትካ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 9
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ' 
        END,
        lyrics_transliteration = 'CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 1
Nisha ziseraeka aykonen nits’adqan
Nizeybedeluኻ niabrham niyshaq
Niyaeqob nimuse akonen nieyob
Niay nihat’e’yo niay niduኹm seb::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 2
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::
Erqaney terife tegefaf ts’egay
Qidmeኻ dew kibl aykeln birkey

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 3
Eney bihat’yat t’enisa welidatni
Goytay nihat’yatey ahlifka aythabeni
Qinue aleኻ amlaኽ kitqets’ani
Qinue aleኻ kitgsts’eni::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 4
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::
Gibri zeybley qalka tezarabi
Ab medreኽ dew ile wengelka mahari

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 5
Zemari wedasi moቕrebi qedasay
Abti Kidus betka mahletka qewamay
Gibri zeybley dendan eyu libey
Gebrher kiኸwn goyta fiቐdeley::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 6
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::
Qalka zekr goyta nay qeranyo
Ab betelhem miwladka zekro

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 7
Eti kulu siቓy mientay’do aykonen
Qalka eyu goyta hakim nihmuman::
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 8
Fiyatawi zeyeman mis lemeneka
Qalu semieka hat’yatu gedifka
Amsleni kemu niay nibaryaኻ
Goyta zekreni ab dagmay mits’atka::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey

VERSE 9
Bimengstኻ zekreni goytay kitmets’e keleኻ
Bizfrh girma kitmets’e keleኻ zekreni iኻ::

CHORUS
Kab huts’a bahri yibezh hat’yatey
Qwah ile kit’mt aykeln semay
Ayzrzern’yu bizuh eyu bedeley
Miኽalu siine kebiduni ts’orey',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ad2a6616-60c4-4feb-a23d-b41be2688876'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 1
ንስሓ ዝሰራዕካ ኣይኮነን ንጻድቃን
ንዘይበደሉኻ ንኣብርሃም ንይስሓቅ
ንያዕቆብ ንሙሴ ኣኮነን ንእዮብ
ንዓይ ንሓጥእ’ዮ ንዓይ ንዱኹም ሰብ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 2
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ዕርቃነይ ተሪፈ ተገፋፍ ጸጋይ
ቅድሜኻ ደው ክብል ኣይክእልን ብርከይ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 3
እነይ ብሓጥያት ጠኒሳ ወሊዳትኒ
ጎይታይ ንሓጥያተይ ኣሕሊፍካ ኣይትሃበኒ
ቅኑዕ ኣለኻ ኣምላኽ ክትቀጽዓኒ
ቅኑዕ ኣለኻ ክትግስጸኒ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 4
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ግብሪ ዘይብለይ ቃልካ ተዛራቢ
ኣብ መድረኽ ደው ኢለ ወንጌልካ ማሃሪ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 5
ዘማሪ ወዳሲ ሞቕረቢ ቀዳሳይ
ኣብቲ ቅዱስ ቤትካ ማህሌትካ ቀዋማይ
ግብሪ ዘይብለይ ደንዳን እዩ ልበይ
ገብርሄር ክኸውን ጎይታ ፍቐደለይ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 6
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ቃልካ ዘክር ጎይታ ናይ ቀራንዮ
ኣብ ቤተልሄም ምውላድካ ዘክሮ

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 7
እቲ ኩሉ ስቓይ ምእንታይ’ዶ ኣይኮነን
ቃልካ እዩ ጎይታ ሓኪም ንሕሙማን::
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 8
ፍያታዊ ዘየማን ምስ ለመነካ
ቃሉ ሰሚዕካ ሓጥያቱ ገዲፍካ
ኣምስለኒ ከምኡ ንዓይ ንባርያኻ
ጎይታ ዘክረኒ ኣብ ዳግማይ ምጽኣትካ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ

VERSE 9
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::

CHORUS
ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ካብ ሑጻ ባሕሪ ይበዝሕ ሓጥያተይ
ቋሕ ኢለ ክጥምት ኣይክእልን ሰማይ
ኣይዝርዘርን’ዩ ብዙሕ እዩ በደለይ
ምኽኣሉ ስኢነ ከቢዱኒ ጾረይ
ንስሓ ዝሰራዕካ ኣይኮነን ንጻድቃን
ንዘይበደሉኻ ንኣብርሃም ንይስሓቅ
ንያዕቆብ ንሙሴ ኣኮነን ንእዮብ
ንዓይ ንሓጥእ’ዮ ንዓይ ንዱኹም ሰብ::
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ዕርቃነይ ተሪፈ ተገፋፍ ጸጋይ
ቅድሜኻ ደው ክብል ኣይክእልን ብርከይ
እነይ ብሓጥያት ጠኒሳ ወሊዳትኒ
ጎይታይ ንሓጥያተይ ኣሕሊፍካ ኣይትሃበኒ
ቅኑዕ ኣለኻ ኣምላኽ ክትቀጽዓኒ
ቅኑዕ ኣለኻ ክትግስጸኒ::
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ግብሪ ዘይብለይ ቃልካ ተዛራቢ
ኣብ መድረኽ ደው ኢለ ወንጌልካ ማሃሪ
ዘማሪ ወዳሲ ሞቕረቢ ቀዳሳይ
ኣብቲ ቅዱስ ቤትካ ማህሌትካ ቀዋማይ
ግብሪ ዘይብለይ ደንዳን እዩ ልበይ
ገብርሄር ክኸውን ጎይታ ፍቐደለይ::
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ቃልካ ዘክር ጎይታ ናይ ቀራንዮ
ኣብ ቤተልሄም ምውላድካ ዘክሮ
እቲ ኩሉ ስቓይ ምእንታይ’ዶ ኣይኮነን
ቃልካ እዩ ጎይታ ሓኪም ንሕሙማን::
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::
ፍያታዊ ዘየማን ምስ ለመነካ
ቃሉ ሰሚዕካ ሓጥያቱ ገዲፍካ
ኣምስለኒ ከምኡ ንዓይ ንባርያኻ
ጎይታ ዘክረኒ ኣብ ዳግማይ ምጽኣትካ::
ብመንግስትኻ ዘክረኒ ጎይታይ ክትመጽእ ከለኻ
ብዝፍርህ ግርማ ክትመጽእ ከለኻ ዘክረኒ ኢኻ::'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ad2a6616-60c4-4feb-a23d-b41be2688876'::uuid, 'eritrean-orthodox-tewahdo-mezmur-3760', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-3627 ("እመ ብርሃን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6ef15e35-1126-4854-8f9c-452d90674502'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eme birhan mirhni megedi qidsna niኽtegh nefsey wetru nimsgana sifra Kidusan kiኸwn eti natey ristey kab godena abesa awts’eya nefsey
Elama nay mift’arey neyru niኸmesgn binay ts’dqi godena nikmelales''win aykealetn sigay ketezez ninefsey hijis bertiuni''lo nay hat’iat siቓy
Gweytay siley misqalu bielama neyru selam niኽhbeni ts’elai asiru wielet siቕlet qeranyo keyhass kab libey siley qumi dingley keabi libonay
Tiezazatu enkelo ab wisht’i hilinay tighatey tets’erigu yisear bisgay miret siol kehasb entezኽel nikalit miarefe''do sigay kabzi kifue timnit

VERSE 1
Yelen kemaኺ Maryam ch’nqey zekaflo ziኽrኺ bereኸt''yu selam niaemro tesfu guezo hiywetey Dingil telemeni simki t’um meaza sinqi yiኹneni .

CHORUS
Eme birhan mirhni megedi qidsna niኽtegh nefsey wetru nimsgana sifra Kidusan kiኸwn eti natey ristey kab godena abesa awts’eya nefsey
Elama nay mift’arey neyru niኸmesgn binay ts’dqi godena nikmelales''win aykealetn sigay ketezez ninefsey hijis bertiuni''lo nay hat’iat siቓy
Gweytay siley misqalu bielama neyru selam niኽhbeni ts’elai asiru wielet siቕlet qeranyo keyhass kab libey siley qumi dingley keabi libonay
Tiezazatu enkelo ab wisht’i hilinay tighatey tets’erigu yisear bisgay miret siol kehasb entezኽel nikalit miarefe''do sigay kabzi kifue timnit'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመ ብርሃን ምርሕኒ መገዲ ቅድስና ንኽተግህ ነፍሰይ ወትሩ ንምስጋና ስፍራ ቅዱሳን ክኸውን እቲ ናተይ ርስተይ ካብ ጎደና ኣበሳ ኣውጽእያ ነፍሰይ
ዕላማ ናይ ምፍጣረይ ነይሩ ንኸመስግን ብናይ ጽድቂ ጎደና ንክመላለስ''ውን ኣይከኣለትን ስጋይ ከትእዘዝ ንነፍሰይ ሕጂስ በርቲዑኒ''ሎ ናይ ኃጢአት ስቓይ
ጐይታይ ስለይ ምስቃሉ ብዕላማ ነይሩ ሰላም ንኽህበኒ ጸላኢ ኣሲሩ ውዕለት ስቕለት ቀራንዮ ከይሃስስ ካብ ልበይ ስለይ ቁሚ ድንግለይ ከዓቢ ልቦናይ
ትእዛዛቱ እንከሎ ኣብ ውሽጢ ሕሊናይ ትግሃተይ ተጸሪጉ ይሰዓር ብስጋይ ምረት ሲኦል ከሓስብ እንተዝኽእል ንካልኢት ምዓረፈ''ዶ ስጋይ ካብዚ ክፉእ ትምኒት

VERSE 1
የለን ከማኺ ማርያም ጭንቀይ ዘካፍሎ ዝኽርኺ በረኸት''ዩ ሰላም ንኣእምሮ ተስፉ ጉዕዞ ሕይወተይ ድንግል ተለመኒ ስምኪ ጥዑም መዓዛ ስንቂ ይኹነኒ ።

CHORUS
እመ ብርሃን ምርሕኒ መገዲ ቅድስና ንኽተግህ ነፍሰይ ወትሩ ንምስጋና ስፍራ ቅዱሳን ክኸውን እቲ ናተይ ርስተይ ካብ ጎደና ኣበሳ ኣውጽእያ ነፍሰይ
ዕላማ ናይ ምፍጣረይ ነይሩ ንኸመስግን ብናይ ጽድቂ ጎደና ንክመላለስ''ውን ኣይከኣለትን ስጋይ ከትእዘዝ ንነፍሰይ ሕጂስ በርቲዑኒ''ሎ ናይ ኃጢአት ስቓይ
ጐይታይ ስለይ ምስቃሉ ብዕላማ ነይሩ ሰላም ንኽህበኒ ጸላኢ ኣሲሩ ውዕለት ስቕለት ቀራንዮ ከይሃስስ ካብ ልበይ ስለይ ቁሚ ድንግለይ ከዓቢ ልቦናይ
ትእዛዛቱ እንከሎ ኣብ ውሽጢ ሕሊናይ ትግሃተይ ተጸሪጉ ይሰዓር ብስጋይ ምረት ሲኦል ከሓስብ እንተዝኽእል ንካልኢት ምዓረፈ''ዶ ስጋይ ካብዚ ክፉእ ትምኒት'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመ ብርሃን ምርሕኒ መገዲ ቅድስና ንኽተግህ ነፍሰይ ወትሩ ንምስጋና ስፍራ ቅዱሳን ክኸውን እቲ ናተይ ርስተይ ካብ ጎደና ኣበሳ ኣውጽእያ ነፍሰይ
ዕላማ ናይ ምፍጣረይ ነይሩ ንኸመስግን ብናይ ጽድቂ ጎደና ንክመላለስ''ውን ኣይከኣለትን ስጋይ ከትእዘዝ ንነፍሰይ ሕጂስ በርቲዑኒ''ሎ ናይ ኃጢአት ስቓይ
ጐይታይ ስለይ ምስቃሉ ብዕላማ ነይሩ ሰላም ንኽህበኒ ጸላኢ ኣሲሩ ውዕለት ስቕለት ቀራንዮ ከይሃስስ ካብ ልበይ ስለይ ቁሚ ድንግለይ ከዓቢ ልቦናይ
ትእዛዛቱ እንከሎ ኣብ ውሽጢ ሕሊናይ ትግሃተይ ተጸሪጉ ይሰዓር ብስጋይ ምረት ሲኦል ከሓስብ እንተዝኽእል ንካልኢት ምዓረፈ''ዶ ስጋይ ካብዚ ክፉእ ትምኒት

VERSE 1
የለን ከማኺ ማርያም ጭንቀይ ዘካፍሎ ዝኽርኺ በረኸት''ዩ ሰላም ንኣእምሮ ተስፉ ጉዕዞ ሕይወተይ ድንግል ተለመኒ ስምኪ ጥዑም መዓዛ ስንቂ ይኹነኒ ።

CHORUS
እመ ብርሃን ምርሕኒ መገዲ ቅድስና ንኽተግህ ነፍሰይ ወትሩ ንምስጋና ስፍራ ቅዱሳን ክኸውን እቲ ናተይ ርስተይ ካብ ጎደና ኣበሳ ኣውጽእያ ነፍሰይ
ዕላማ ናይ ምፍጣረይ ነይሩ ንኸመስግን ብናይ ጽድቂ ጎደና ንክመላለስ''ውን ኣይከኣለትን ስጋይ ከትእዘዝ ንነፍሰይ ሕጂስ በርቲዑኒ''ሎ ናይ ኃጢአት ስቓይ
ጐይታይ ስለይ ምስቃሉ ብዕላማ ነይሩ ሰላም ንኽህበኒ ጸላኢ ኣሲሩ ውዕለት ስቕለት ቀራንዮ ከይሃስስ ካብ ልበይ ስለይ ቁሚ ድንግለይ ከዓቢ ልቦናይ
ትእዛዛቱ እንከሎ ኣብ ውሽጢ ሕሊናይ ትግሃተይ ተጸሪጉ ይሰዓር ብስጋይ ምረት ሲኦል ከሓስብ እንተዝኽእል ንካልኢት ምዓረፈ''ዶ ስጋይ ካብዚ ክፉእ ትምኒት' THEN lyrics_amharic 
          ELSE 'CHORUS
እመ ብርሃን ምርሕኒ መገዲ ቅድስና ንኽተግህ ነፍሰይ ወትሩ ንምስጋና ስፍራ ቅዱሳን ክኸውን እቲ ናተይ ርስተይ ካብ ጎደና ኣበሳ ኣውጽእያ ነፍሰይ
ዕላማ ናይ ምፍጣረይ ነይሩ ንኸመስግን ብናይ ጽድቂ ጎደና ንክመላለስ''ውን ኣይከኣለትን ስጋይ ከትእዘዝ ንነፍሰይ ሕጂስ በርቲዑኒ''ሎ ናይ ኃጢአት ስቓይ
ጐይታይ ስለይ ምስቃሉ ብዕላማ ነይሩ ሰላም ንኽህበኒ ጸላኢ ኣሲሩ ውዕለት ስቕለት ቀራንዮ ከይሃስስ ካብ ልበይ ስለይ ቁሚ ድንግለይ ከዓቢ ልቦናይ
ትእዛዛቱ እንከሎ ኣብ ውሽጢ ሕሊናይ ትግሃተይ ተጸሪጉ ይሰዓር ብስጋይ ምረት ሲኦል ከሓስብ እንተዝኽእል ንካልኢት ምዓረፈ''ዶ ስጋይ ካብዚ ክፉእ ትምኒት

VERSE 1
የለን ከማኺ ማርያም ጭንቀይ ዘካፍሎ ዝኽርኺ በረኸት''ዩ ሰላም ንኣእምሮ ተስፉ ጉዕዞ ሕይወተይ ድንግል ተለመኒ ስምኪ ጥዑም መዓዛ ስንቂ ይኹነኒ ።

CHORUS
እመ ብርሃን ምርሕኒ መገዲ ቅድስና ንኽተግህ ነፍሰይ ወትሩ ንምስጋና ስፍራ ቅዱሳን ክኸውን እቲ ናተይ ርስተይ ካብ ጎደና ኣበሳ ኣውጽእያ ነፍሰይ
ዕላማ ናይ ምፍጣረይ ነይሩ ንኸመስግን ብናይ ጽድቂ ጎደና ንክመላለስ''ውን ኣይከኣለትን ስጋይ ከትእዘዝ ንነፍሰይ ሕጂስ በርቲዑኒ''ሎ ናይ ኃጢአት ስቓይ
ጐይታይ ስለይ ምስቃሉ ብዕላማ ነይሩ ሰላም ንኽህበኒ ጸላኢ ኣሲሩ ውዕለት ስቕለት ቀራንዮ ከይሃስስ ካብ ልበይ ስለይ ቁሚ ድንግለይ ከዓቢ ልቦናይ
ትእዛዛቱ እንከሎ ኣብ ውሽጢ ሕሊናይ ትግሃተይ ተጸሪጉ ይሰዓር ብስጋይ ምረት ሲኦል ከሓስብ እንተዝኽእል ንካልኢት ምዓረፈ''ዶ ስጋይ ካብዚ ክፉእ ትምኒት' 
        END,
        lyrics_transliteration = 'CHORUS
Eme birhan mirhni megedi qidsna niኽtegh nefsey wetru nimsgana sifra Kidusan kiኸwn eti natey ristey kab godena abesa awts’eya nefsey
Elama nay mift’arey neyru niኸmesgn binay ts’dqi godena nikmelales''win aykealetn sigay ketezez ninefsey hijis bertiuni''lo nay hat’iat siቓy
Gweytay siley misqalu bielama neyru selam niኽhbeni ts’elai asiru wielet siቕlet qeranyo keyhass kab libey siley qumi dingley keabi libonay
Tiezazatu enkelo ab wisht’i hilinay tighatey tets’erigu yisear bisgay miret siol kehasb entezኽel nikalit miarefe''do sigay kabzi kifue timnit

VERSE 1
Yelen kemaኺ Maryam ch’nqey zekaflo ziኽrኺ bereኸt''yu selam niaemro tesfu guezo hiywetey Dingil telemeni simki t’um meaza sinqi yiኹneni .

CHORUS
Eme birhan mirhni megedi qidsna niኽtegh nefsey wetru nimsgana sifra Kidusan kiኸwn eti natey ristey kab godena abesa awts’eya nefsey
Elama nay mift’arey neyru niኸmesgn binay ts’dqi godena nikmelales''win aykealetn sigay ketezez ninefsey hijis bertiuni''lo nay hat’iat siቓy
Gweytay siley misqalu bielama neyru selam niኽhbeni ts’elai asiru wielet siቕlet qeranyo keyhass kab libey siley qumi dingley keabi libonay
Tiezazatu enkelo ab wisht’i hilinay tighatey tets’erigu yisear bisgay miret siol kehasb entezኽel nikalit miarefe''do sigay kabzi kifue timnit',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6ef15e35-1126-4854-8f9c-452d90674502'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመ ብርሃን ምርሕኒ መገዲ ቅድስና ንኽተግህ ነፍሰይ ወትሩ ንምስጋና ስፍራ ቅዱሳን ክኸውን እቲ ናተይ ርስተይ ካብ ጎደና ኣበሳ ኣውጽእያ ነፍሰይ
ዕላማ ናይ ምፍጣረይ ነይሩ ንኸመስግን ብናይ ጽድቂ ጎደና ንክመላለስ''ውን ኣይከኣለትን ስጋይ ከትእዘዝ ንነፍሰይ ሕጂስ በርቲዑኒ''ሎ ናይ ኃጢአት ስቓይ
ጐይታይ ስለይ ምስቃሉ ብዕላማ ነይሩ ሰላም ንኽህበኒ ጸላኢ ኣሲሩ ውዕለት ስቕለት ቀራንዮ ከይሃስስ ካብ ልበይ ስለይ ቁሚ ድንግለይ ከዓቢ ልቦናይ
ትእዛዛቱ እንከሎ ኣብ ውሽጢ ሕሊናይ ትግሃተይ ተጸሪጉ ይሰዓር ብስጋይ ምረት ሲኦል ከሓስብ እንተዝኽእል ንካልኢት ምዓረፈ''ዶ ስጋይ ካብዚ ክፉእ ትምኒት

VERSE 1
የለን ከማኺ ማርያም ጭንቀይ ዘካፍሎ ዝኽርኺ በረኸት''ዩ ሰላም ንኣእምሮ ተስፉ ጉዕዞ ሕይወተይ ድንግል ተለመኒ ስምኪ ጥዑም መዓዛ ስንቂ ይኹነኒ ።

CHORUS
እመ ብርሃን ምርሕኒ መገዲ ቅድስና ንኽተግህ ነፍሰይ ወትሩ ንምስጋና ስፍራ ቅዱሳን ክኸውን እቲ ናተይ ርስተይ ካብ ጎደና ኣበሳ ኣውጽእያ ነፍሰይ
ዕላማ ናይ ምፍጣረይ ነይሩ ንኸመስግን ብናይ ጽድቂ ጎደና ንክመላለስ''ውን ኣይከኣለትን ስጋይ ከትእዘዝ ንነፍሰይ ሕጂስ በርቲዑኒ''ሎ ናይ ኃጢአት ስቓይ
ጐይታይ ስለይ ምስቃሉ ብዕላማ ነይሩ ሰላም ንኽህበኒ ጸላኢ ኣሲሩ ውዕለት ስቕለት ቀራንዮ ከይሃስስ ካብ ልበይ ስለይ ቁሚ ድንግለይ ከዓቢ ልቦናይ
ትእዛዛቱ እንከሎ ኣብ ውሽጢ ሕሊናይ ትግሃተይ ተጸሪጉ ይሰዓር ብስጋይ ምረት ሲኦል ከሓስብ እንተዝኽእል ንካልኢት ምዓረፈ''ዶ ስጋይ ካብዚ ክፉእ ትምኒት'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እመ ብርሃን ምርሕኒ መገዲ ቅድስና ንኽተግህ ነፍሰይ ወትሩ ንምስጋና ስፍራ ቅዱሳን ክኸውን እቲ ናተይ ርስተይ ካብ ጎደና ኣበሳ ኣውጽእያ ነፍሰይ
ዕላማ ናይ ምፍጣረይ ነይሩ ንኸመስግን ብናይ ጽድቂ ጎደና ንክመላለስ''ውን ኣይከኣለትን ስጋይ ከትእዘዝ ንነፍሰይ ሕጂስ በርቲዑኒ''ሎ ናይ ኃጢአት ስቓይ
ጐይታይ ስለይ ምስቃሉ ብዕላማ ነይሩ ሰላም ንኽህበኒ ጸላኢ ኣሲሩ ውዕለት ስቕለት ቀራንዮ ከይሃስስ ካብ ልበይ ስለይ ቁሚ ድንግለይ ከዓቢ ልቦናይ
ትእዛዛቱ እንከሎ ኣብ ውሽጢ ሕሊናይ ትግሃተይ ተጸሪጉ ይሰዓር ብስጋይ ምረት ሲኦል ከሓስብ እንተዝኽእል ንካልኢት ምዓረፈ''ዶ ስጋይ ካብዚ ክፉእ ትምኒት
የለን ከማኺ ማርያም ጭንቀይ ዘካፍሎ ዝኽርኺ በረኸት''ዩ ሰላም ንኣእምሮ ተስፉ ጉዕዞ ሕይወተይ ድንግል ተለመኒ ስምኪ ጥዑም መዓዛ ስንቂ ይኹነኒ ።'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6ef15e35-1126-4854-8f9c-452d90674502'::uuid, 'eritrean-orthodox-tewahdo-mezmur-3627', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- help-my-unbelief-my-lord ("አለማመኔን እርዳው")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '954d44fd-26a6-4542-a645-d3da6d79ef53'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 1
Let my soul be with you even though it slackens
Do not cast me away though I lack righteousness
Be merciful this year that my strength may flourish
When my life is growing ignorant and shallow

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 2
Give me power to call unto you God of hope
If I don’t follow your commandments to please you
Be with me today Lord Your covenant stands true
My leprosy increased and the crowd exiled me

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 3
Come quickly with healing and bestow your mercy
Adjoin me with your flock the holy favored tribe
Surround me with your love, my heart it will revive
Give me your holy gifts an aroma that''s sweet

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 4
With blessings you fill me so my life is complete
Draw near to me with love and disregard my sin
With abundant mercy that I can''t imagine
Help my unbelief my Lord and Savior (2)

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 5
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Alemamenen erdaw Getaye (2)
Ante nehna mesheshegiyaye

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 6
Alemamenen erdaw Getaye

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 1
Let my soul be with you even though it slackens
Do not cast me away though I lack righteousness
Be merciful this year that my strength may flourish
When my life is growing ignorant and shallow

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 2
Give me power to call unto you God of hope
If I don’t follow your commandments to please you
Be with me today Lord Your covenant stands true
My leprosy increased and the crowd exiled me

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 3
Come quickly with healing and bestow your mercy
Adjoin me with your flock the holy favored tribe
Surround me with your love, my heart it will revive
Give me your holy gifts an aroma that''s sweet

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 4
With blessings you fill me so my life is complete
Draw near to me with love and disregard my sin
With abundant mercy that I can''t imagine
Help my unbelief my Lord and Savior (2)

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 5
You are my refuge my shining armor
Help my unbelief my Lord and Savior
አለማመኔን እርዳው ጌታዬ /2/
አንተ ነህና መሸሸጊያዬ

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 6
አለማመኔን እርዳው ጌታዬ

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 1
Let my soul be with you even though it slackens
Do not cast me away though I lack righteousness
Be merciful this year that my strength may flourish
When my life is growing ignorant and shallow

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 2
Give me power to call unto you God of hope
If I don’t follow your commandments to please you
Be with me today Lord Your covenant stands true
My leprosy increased and the crowd exiled me

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 3
Come quickly with healing and bestow your mercy
Adjoin me with your flock the holy favored tribe
Surround me with your love, my heart it will revive
Give me your holy gifts an aroma that''s sweet

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 4
With blessings you fill me so my life is complete
Draw near to me with love and disregard my sin
With abundant mercy that I can''t imagine
Help my unbelief my Lord and Savior (2)

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 5
You are my refuge my shining armor
Help my unbelief my Lord and Savior
አለማመኔን እርዳው ጌታዬ /2/
አንተ ነህና መሸሸጊያዬ

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 6
አለማመኔን እርዳው ጌታዬ

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions' THEN lyrics_amharic 
          ELSE 'CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 1
Let my soul be with you even though it slackens
Do not cast me away though I lack righteousness
Be merciful this year that my strength may flourish
When my life is growing ignorant and shallow

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 2
Give me power to call unto you God of hope
If I don’t follow your commandments to please you
Be with me today Lord Your covenant stands true
My leprosy increased and the crowd exiled me

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 3
Come quickly with healing and bestow your mercy
Adjoin me with your flock the holy favored tribe
Surround me with your love, my heart it will revive
Give me your holy gifts an aroma that''s sweet

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 4
With blessings you fill me so my life is complete
Draw near to me with love and disregard my sin
With abundant mercy that I can''t imagine
Help my unbelief my Lord and Savior (2)

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 5
You are my refuge my shining armor
Help my unbelief my Lord and Savior
አለማመኔን እርዳው ጌታዬ /2/
አንተ ነህና መሸሸጊያዬ

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 6
አለማመኔን እርዳው ጌታዬ

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions' 
        END,
        lyrics_transliteration = 'CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 1
Let my soul be with you even though it slackens
Do not cast me away though I lack righteousness
Be merciful this year that my strength may flourish
When my life is growing ignorant and shallow

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 2
Give me power to call unto you God of hope
If I don’t follow your commandments to please you
Be with me today Lord Your covenant stands true
My leprosy increased and the crowd exiled me

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 3
Come quickly with healing and bestow your mercy
Adjoin me with your flock the holy favored tribe
Surround me with your love, my heart it will revive
Give me your holy gifts an aroma that''s sweet

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 4
With blessings you fill me so my life is complete
Draw near to me with love and disregard my sin
With abundant mercy that I can''t imagine
Help my unbelief my Lord and Savior (2)

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 5
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Alemamenen erdaw Getaye (2)
Ante nehna mesheshegiyaye

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 6
Alemamenen erdaw Getaye

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions',
        updated_at = clock_timestamp()::text
    WHERE import_id = '954d44fd-26a6-4542-a645-d3da6d79ef53'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 1
Let my soul be with you even though it slackens
Do not cast me away though I lack righteousness
Be merciful this year that my strength may flourish
When my life is growing ignorant and shallow

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 2
Give me power to call unto you God of hope
If I don’t follow your commandments to please you
Be with me today Lord Your covenant stands true
My leprosy increased and the crowd exiled me

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 3
Come quickly with healing and bestow your mercy
Adjoin me with your flock the holy favored tribe
Surround me with your love, my heart it will revive
Give me your holy gifts an aroma that''s sweet

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 4
With blessings you fill me so my life is complete
Draw near to me with love and disregard my sin
With abundant mercy that I can''t imagine
Help my unbelief my Lord and Savior (2)

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 5
You are my refuge my shining armor
Help my unbelief my Lord and Savior
አለማመኔን እርዳው ጌታዬ /2/
አንተ ነህና መሸሸጊያዬ

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions

VERSE 6
አለማመኔን እርዳው ጌታዬ

CHORUS
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
Though I am not fruitful tormented by passions
Let my soul be with you even though it slackens
Do not cast me away though I lack righteousness
Be merciful this year that my strength may flourish
When my life is growing ignorant and shallow
Give me power to call unto you God of hope
If I don’t follow your commandments to please you
Be with me today Lord Your covenant stands true
My leprosy increased and the crowd exiled me
Come quickly with healing and bestow your mercy
Adjoin me with your flock the holy favored tribe
Surround me with your love, my heart it will revive
Give me your holy gifts an aroma that''s sweet
With blessings you fill me so my life is complete
Draw near to me with love and disregard my sin
With abundant mercy that I can''t imagine
Help my unbelief my Lord and Savior (2)
You are my refuge my shining armor
Help my unbelief my Lord and Savior
አለማመኔን እርዳው ጌታዬ /2/
አንተ ነህና መሸሸጊያዬ
አለማመኔን እርዳው ጌታዬ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '954d44fd-26a6-4542-a645-d3da6d79ef53'::uuid, 'help-my-unbelief-my-lord', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- werede-menifes-kidus ("ወረደ መንፈስ ቅዱስ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '24cac811-62f0-4615-bf51-b61a61ba9980'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 1
Ene bihed ats’nagnuymet’al
Haylachhun ende nisr yadsal
Enante gin qoyu eyerusalem
Eskimet’a ats’nagnu kearyam

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 2
Werde menfes Kidus
BeMaryam bet beandnet salu
Bets’om ts’elot sitegu beqalu
Besat amsal werdo belayachew

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 3
Besmu kibir defur argachew
Werde menfes Kidus
Bemaleda weyn alqemesu
Hayl honwachew yegeta menfesu

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 4
Beadis qwanqwa hizbun asgermu
Kristosn sebeku saydekmu
Werde menfes Kidus
Ende ts’ehey lealem aberu

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 5
Beadis menfes beadis keberu
Beadebabay seyfu mit alferu
Asro yizwachew yeEgziabher fiqru
Werde menfes Kidus

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 6
Keseyf silet kesat amelet’u
Dil adrgew keself mehel wet’u
Yealemn t’aym huletena niqew
Yamenutn ayen bedem sebkew

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 7
Werde menfes Kidus

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 1
እኔ ብሄድ አጽናኙይመጣል
ኃይላችሁን እንደ ንስር ያድሳል
እናንተ ግን ቆዩ እየሩሳሌም
እስኪመጣ አፅናኙ ከአርያም

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 2
ወርደ መንፈስ ቅዱስ
በማርያም ቤት በአንድነት ሳሉ
በፆም ፀሎት ሲተጉ በቃሉ
በሳት አምሳል ወርዶ በላያቸው

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 3
በስሙ ክብር ደፉር አርጋቸው
ወርደ መንፈስ ቅዱስ
በማለዳ ወይን አልቀመሱ
ኃይል ሆኗቸው የጌታ መንፈሱ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 4
በአዲስ ቋንቋ ህዝቡን አስገርሙ
ክርስቶስን ሰበኩ ሳይደክሙ
ወርደ መንፈስ ቅዱስ
እንደ ፀሀይ ለአለም አበሩ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 5
በአዲስ መንፈስ በአዲስ ከበሩ
በአደባባይ ሰይፉ ምት አልፈሩ
አስሮ ይዟቸው የእግዚአብሔር ፍቅሩ
ወርደ መንፈስ ቅዱስ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 6
ከሰይፍ ስለት ከሳት አመለጡ
ድል አድርገው ከሰልፍ መሀል ወጡ
የአለምን ጣይም ሁለተና ንቀው
ያመኑትን አየን በደም ሰብከው

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 7
ወርደ መንፈስ ቅዱስ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 1
እኔ ብሄድ አጽናኙይመጣል
ኃይላችሁን እንደ ንስር ያድሳል
እናንተ ግን ቆዩ እየሩሳሌም
እስኪመጣ አፅናኙ ከአርያም

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 2
ወርደ መንፈስ ቅዱስ
በማርያም ቤት በአንድነት ሳሉ
በፆም ፀሎት ሲተጉ በቃሉ
በሳት አምሳል ወርዶ በላያቸው

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 3
በስሙ ክብር ደፉር አርጋቸው
ወርደ መንፈስ ቅዱስ
በማለዳ ወይን አልቀመሱ
ኃይል ሆኗቸው የጌታ መንፈሱ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 4
በአዲስ ቋንቋ ህዝቡን አስገርሙ
ክርስቶስን ሰበኩ ሳይደክሙ
ወርደ መንፈስ ቅዱስ
እንደ ፀሀይ ለአለም አበሩ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 5
በአዲስ መንፈስ በአዲስ ከበሩ
በአደባባይ ሰይፉ ምት አልፈሩ
አስሮ ይዟቸው የእግዚአብሔር ፍቅሩ
ወርደ መንፈስ ቅዱስ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 6
ከሰይፍ ስለት ከሳት አመለጡ
ድል አድርገው ከሰልፍ መሀል ወጡ
የአለምን ጣይም ሁለተና ንቀው
ያመኑትን አየን በደም ሰብከው

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 7
ወርደ መንፈስ ቅዱስ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ' THEN lyrics_amharic 
          ELSE 'CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 1
እኔ ብሄድ አጽናኙይመጣል
ኃይላችሁን እንደ ንስር ያድሳል
እናንተ ግን ቆዩ እየሩሳሌም
እስኪመጣ አፅናኙ ከአርያም

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 2
ወርደ መንፈስ ቅዱስ
በማርያም ቤት በአንድነት ሳሉ
በፆም ፀሎት ሲተጉ በቃሉ
በሳት አምሳል ወርዶ በላያቸው

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 3
በስሙ ክብር ደፉር አርጋቸው
ወርደ መንፈስ ቅዱስ
በማለዳ ወይን አልቀመሱ
ኃይል ሆኗቸው የጌታ መንፈሱ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 4
በአዲስ ቋንቋ ህዝቡን አስገርሙ
ክርስቶስን ሰበኩ ሳይደክሙ
ወርደ መንፈስ ቅዱስ
እንደ ፀሀይ ለአለም አበሩ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 5
በአዲስ መንፈስ በአዲስ ከበሩ
በአደባባይ ሰይፉ ምት አልፈሩ
አስሮ ይዟቸው የእግዚአብሔር ፍቅሩ
ወርደ መንፈስ ቅዱስ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 6
ከሰይፍ ስለት ከሳት አመለጡ
ድል አድርገው ከሰልፍ መሀል ወጡ
የአለምን ጣይም ሁለተና ንቀው
ያመኑትን አየን በደም ሰብከው

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 7
ወርደ መንፈስ ቅዱስ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ' 
        END,
        lyrics_transliteration = 'CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 1
Ene bihed ats’nagnuymet’al
Haylachhun ende nisr yadsal
Enante gin qoyu eyerusalem
Eskimet’a ats’nagnu kearyam

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 2
Werde menfes Kidus
BeMaryam bet beandnet salu
Bets’om ts’elot sitegu beqalu
Besat amsal werdo belayachew

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 3
Besmu kibir defur argachew
Werde menfes Kidus
Bemaleda weyn alqemesu
Hayl honwachew yegeta menfesu

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 4
Beadis qwanqwa hizbun asgermu
Kristosn sebeku saydekmu
Werde menfes Kidus
Ende ts’ehey lealem aberu

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 5
Beadis menfes beadis keberu
Beadebabay seyfu mit alferu
Asro yizwachew yeEgziabher fiqru
Werde menfes Kidus

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 6
Keseyf silet kesat amelet’u
Dil adrgew keself mehel wet’u
Yealemn t’aym huletena niqew
Yamenutn ayen bedem sebkew

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus

VERSE 7
Werde menfes Kidus

CHORUS
Halleluya werede (2)
Menfes Kidus (2)
Laele hewaryat (3)
Menfes Kidus',
        updated_at = clock_timestamp()::text
    WHERE import_id = '24cac811-62f0-4615-bf51-b61a61ba9980'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 1
እኔ ብሄድ አጽናኙይመጣል
ኃይላችሁን እንደ ንስር ያድሳል
እናንተ ግን ቆዩ እየሩሳሌም
እስኪመጣ አፅናኙ ከአርያም

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 2
ወርደ መንፈስ ቅዱስ
በማርያም ቤት በአንድነት ሳሉ
በፆም ፀሎት ሲተጉ በቃሉ
በሳት አምሳል ወርዶ በላያቸው

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 3
በስሙ ክብር ደፉር አርጋቸው
ወርደ መንፈስ ቅዱስ
በማለዳ ወይን አልቀመሱ
ኃይል ሆኗቸው የጌታ መንፈሱ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 4
በአዲስ ቋንቋ ህዝቡን አስገርሙ
ክርስቶስን ሰበኩ ሳይደክሙ
ወርደ መንፈስ ቅዱስ
እንደ ፀሀይ ለአለም አበሩ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 5
በአዲስ መንፈስ በአዲስ ከበሩ
በአደባባይ ሰይፉ ምት አልፈሩ
አስሮ ይዟቸው የእግዚአብሔር ፍቅሩ
ወርደ መንፈስ ቅዱስ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 6
ከሰይፍ ስለት ከሳት አመለጡ
ድል አድርገው ከሰልፍ መሀል ወጡ
የአለምን ጣይም ሁለተና ንቀው
ያመኑትን አየን በደም ሰብከው

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ

VERSE 7
ወርደ መንፈስ ቅዱስ

CHORUS
ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ሃሌ ሉያ ወረደ (፪)
መንፈስ ቅዱስ/፪/
ላዕለ ሐዋርያት(፫)
መንፈስ ቅዱስ
እኔ ብሄድ አጽናኙይመጣል
ኃይላችሁን እንደ ንስር ያድሳል
እናንተ ግን ቆዩ እየሩሳሌም
እስኪመጣ አፅናኙ ከአርያም
ወርደ መንፈስ ቅዱስ
በማርያም ቤት በአንድነት ሳሉ
በፆም ፀሎት ሲተጉ በቃሉ
በሳት አምሳል ወርዶ በላያቸው
በስሙ ክብር ደፉር አርጋቸው
ወርደ መንፈስ ቅዱስ
በማለዳ ወይን አልቀመሱ
ኃይል ሆኗቸው የጌታ መንፈሱ
በአዲስ ቋንቋ ህዝቡን አስገርሙ
ክርስቶስን ሰበኩ ሳይደክሙ
ወርደ መንፈስ ቅዱስ
እንደ ፀሀይ ለአለም አበሩ
በአዲስ መንፈስ በአዲስ ከበሩ
በአደባባይ ሰይፉ ምት አልፈሩ
አስሮ ይዟቸው የእግዚአብሔር ፍቅሩ
ወርደ መንፈስ ቅዱስ
ከሰይፍ ስለት ከሳት አመለጡ
ድል አድርገው ከሰልፍ መሀል ወጡ
የአለምን ጣይም ሁለተና ንቀው
ያመኑትን አየን በደም ሰብከው
ወርደ መንፈስ ቅዱስ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '24cac811-62f0-4615-bf51-b61a61ba9980'::uuid, 'werede-menifes-kidus', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- say-you-ve-forgiven-me ("ምሬሃለው በለኝ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e8712958-c7d5-460d-b451-28241afbe592'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 1
Long enough I have stayed within the tents of sin
Renew my heart and spirts righteousness within
With your merciful eyes my lord look upon me
For the sake of the Virgin Mary set me free (2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 2
Lightly I took the significance of your blood
Retreated to my home from jaws of destruction
Shattered and restless I have been without your peace
For your dear mothers sake I plead for your mercy

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 3
For Virgin Mary sake I plead for your mercy
My vain desire caused my flesh to bury my soul
I have lost all my strength and broken all my bones
Purify me my lord even whiter than snow

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 4
For Virgin Mary’s sake cleanse the sin from my soul (2)
Open my mouth so I may rise in thanksgiving.
What’s guarding me from you expel the walls from me
Clothe me in righteousness I’m through with being cold

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 5
For virgin Mary’s sake return me to my home (2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 1
Long enough I have stayed within the tents of sin
Renew my heart and spirts righteousness within
With your merciful eyes my lord look upon me
For the sake of the Virgin Mary set me free(2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 2
Lightly I took the significance of your blood
Retreated to my home from jaws of destruction
Shattered and restless I have been without your peace
For your dear mothers sake I plead for your mercy

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 3
For Virgin Mary sake I plead for your mercy
My vain desire caused my flesh to bury my soul
I have lost all my strength and broken all my bones
Purify me my lord even whiter than snow

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 4
For Virgin Mary’s sake cleanse the sin from my soul(2)
Open my mouth so I may rise in thanksgiving.
What’s guarding me from you expel the walls from me
Clothe me in righteousness I’m through with being cold

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 5
For virgin Mary’s sake return me to my home(2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 1
Long enough I have stayed within the tents of sin
Renew my heart and spirts righteousness within
With your merciful eyes my lord look upon me
For the sake of the Virgin Mary set me free(2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 2
Lightly I took the significance of your blood
Retreated to my home from jaws of destruction
Shattered and restless I have been without your peace
For your dear mothers sake I plead for your mercy

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 3
For Virgin Mary sake I plead for your mercy
My vain desire caused my flesh to bury my soul
I have lost all my strength and broken all my bones
Purify me my lord even whiter than snow

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 4
For Virgin Mary’s sake cleanse the sin from my soul(2)
Open my mouth so I may rise in thanksgiving.
What’s guarding me from you expel the walls from me
Clothe me in righteousness I’m through with being cold

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 5
For virgin Mary’s sake return me to my home(2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም' THEN lyrics_amharic 
          ELSE 'CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 1
Long enough I have stayed within the tents of sin
Renew my heart and spirts righteousness within
With your merciful eyes my lord look upon me
For the sake of the Virgin Mary set me free(2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 2
Lightly I took the significance of your blood
Retreated to my home from jaws of destruction
Shattered and restless I have been without your peace
For your dear mothers sake I plead for your mercy

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 3
For Virgin Mary sake I plead for your mercy
My vain desire caused my flesh to bury my soul
I have lost all my strength and broken all my bones
Purify me my lord even whiter than snow

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 4
For Virgin Mary’s sake cleanse the sin from my soul(2)
Open my mouth so I may rise in thanksgiving.
What’s guarding me from you expel the walls from me
Clothe me in righteousness I’m through with being cold

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 5
For virgin Mary’s sake return me to my home(2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም' 
        END,
        lyrics_transliteration = 'CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 1
Long enough I have stayed within the tents of sin
Renew my heart and spirts righteousness within
With your merciful eyes my lord look upon me
For the sake of the Virgin Mary set me free (2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 2
Lightly I took the significance of your blood
Retreated to my home from jaws of destruction
Shattered and restless I have been without your peace
For your dear mothers sake I plead for your mercy

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 3
For Virgin Mary sake I plead for your mercy
My vain desire caused my flesh to bury my soul
I have lost all my strength and broken all my bones
Purify me my lord even whiter than snow

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 4
For Virgin Mary’s sake cleanse the sin from my soul (2)
Open my mouth so I may rise in thanksgiving.
What’s guarding me from you expel the walls from me
Clothe me in righteousness I’m through with being cold

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem

VERSE 5
For virgin Mary’s sake return me to my home (2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake (2)
Merciful savior of the world no one forgives like you
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e8712958-c7d5-460d-b451-28241afbe592'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 1
Long enough I have stayed within the tents of sin
Renew my heart and spirts righteousness within
With your merciful eyes my lord look upon me
For the sake of the Virgin Mary set me free(2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 2
Lightly I took the significance of your blood
Retreated to my home from jaws of destruction
Shattered and restless I have been without your peace
For your dear mothers sake I plead for your mercy

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 3
For Virgin Mary sake I plead for your mercy
My vain desire caused my flesh to bury my soul
I have lost all my strength and broken all my bones
Purify me my lord even whiter than snow

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 4
For Virgin Mary’s sake cleanse the sin from my soul(2)
Open my mouth so I may rise in thanksgiving.
What’s guarding me from you expel the walls from me
Clothe me in righteousness I’m through with being cold

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 5
For virgin Mary’s sake return me to my home(2)

CHORUS
Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Say you’ve forgiven me for Virgin Mary’s sake(2)
Merciful savior of the world no one forgives like you
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
Long enough I have stayed within the tents of sin
Renew my heart and spirts righteousness within
With your merciful eyes my lord look upon me
For the sake of the Virgin Mary set me free(2)
Lightly I took the significance of your blood
Retreated to my home from jaws of destruction
Shattered and restless I have been without your peace
For your dear mothers sake I plead for your mercy
For Virgin Mary sake I plead for your mercy
My vain desire caused my flesh to bury my soul
I have lost all my strength and broken all my bones
Purify me my lord even whiter than snow
For Virgin Mary’s sake cleanse the sin from my soul(2)
Open my mouth so I may rise in thanksgiving.
What’s guarding me from you expel the walls from me
Clothe me in righteousness I’m through with being cold
For virgin Mary’s sake return me to my home(2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e8712958-c7d5-460d-b451-28241afbe592'::uuid, 'say-you-ve-forgiven-me', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sleki-xion-eritrean-orthodox-tewahdo-mezmur-by-eritrean-artists-fnotebrh ("sleki-xion-eritrean-orthodox-tewahdo-mezmur-by-eritrean-artists-fnotebrh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '76a7e388-3bbb-4e4a-823b-59b40118a4a7'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 1
""fiቕrኺ ab libey qenbeybey misbele:
Qinatki kiet’eቕ niቕhat tiadile:
Miflat’u keysen reqiቕ tenkol seyt’an:
Simki eኹl koynu walta ruhey shfan.

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 2
Azz""""
Nibat zeynebero biኽyatey riiኽyo:
Dimts’i zeygebere awyatey semieኽyo:
Selamey kibten bimesa misluyat:

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 3
Simki neru kewley kab hibobula widqet:
Az"""
Dirut koynu aቕmey diኻm zilbasu:
Hilnay et’elmeni tesfay tets’enqiቑ:

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 4
Haqi ab wisht’ey hize bihasot key"gifae:
Simki''yu wahsey winey niኸywts’ae.
Az"""
Meguhayi zemedu regats’ qal fet’ari:

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 5
Ts’li koynu kabay kequrreni fiቕri:
Aych’ekenkn Dingil sieletki azizu:
Bidmqet kidanki abesay debzizu.
Az""" (2)

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 1
""ፍቕርኺ ኣብ ልበይ ቀንበይበይ ምስበለ:
ቅናትኪ ክዕጠቕ ንቕሓት ትዓዲለ:
ምፍላጡ ከይስእን ረቂቕ ተንኮል ሰይጣን:
ስምኪ እኹል ኮይኑ ዋልታ ሩሐይ ሽፋን።

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 2
ኣዝዝ""""
ንብዓት ዘይነበሮ ብኽያተይ ርኢኽዮ:
ድምጺ ዘይገበረ ኣውያተይ ሰሚዕኽዮ:
ሰላመይ ክብተን ብመስአ ምስሉያት:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 3
ስምኪ ኔሩ ከውለይ ካብ ህቦቡላ ውድቀት:
ኣዝ"""
ድሩት ኮይኑ ዓቕመይ ድኻም ዝልባሱ:
ሕልናይ እጠልመኒ ተስፋይ ተጸንቂቑ:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 4
ሓቂ ኣብ ውሽጠይ ሒዘ ብሓሶት ከይ"ግፋዕ:
ስምኪ''ዩ ዋሕሰይ ውነይ ንኸይውጻዕ።
ኣዝ"""
መጉሃዪ ዘመዱ ረጋጽ ቃል ፈጣሪ:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 5
ጽልኢ ኮይኑ ካባይ ከቁርረኒ ፍቕሪ:
ኣይጨከንክን ድንግል ስእለትኪ ዓዚዙ:
ብድምቀት ኪዳንኪ ኣበሳይ ደብዚዙ።
ኣዝ"""(2)

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 1
""ፍቕርኺ ኣብ ልበይ ቀንበይበይ ምስበለ:
ቅናትኪ ክዕጠቕ ንቕሓት ትዓዲለ:
ምፍላጡ ከይስእን ረቂቕ ተንኮል ሰይጣን:
ስምኪ እኹል ኮይኑ ዋልታ ሩሐይ ሽፋን።

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 2
ኣዝዝ""""
ንብዓት ዘይነበሮ ብኽያተይ ርኢኽዮ:
ድምጺ ዘይገበረ ኣውያተይ ሰሚዕኽዮ:
ሰላመይ ክብተን ብመስአ ምስሉያት:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 3
ስምኪ ኔሩ ከውለይ ካብ ህቦቡላ ውድቀት:
ኣዝ"""
ድሩት ኮይኑ ዓቕመይ ድኻም ዝልባሱ:
ሕልናይ እጠልመኒ ተስፋይ ተጸንቂቑ:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 4
ሓቂ ኣብ ውሽጠይ ሒዘ ብሓሶት ከይ"ግፋዕ:
ስምኪ''ዩ ዋሕሰይ ውነይ ንኸይውጻዕ።
ኣዝ"""
መጉሃዪ ዘመዱ ረጋጽ ቃል ፈጣሪ:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 5
ጽልኢ ኮይኑ ካባይ ከቁርረኒ ፍቕሪ:
ኣይጨከንክን ድንግል ስእለትኪ ዓዚዙ:
ብድምቀት ኪዳንኪ ኣበሳይ ደብዚዙ።
ኣዝ"""(2)

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)' THEN lyrics_amharic 
          ELSE 'CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 1
""ፍቕርኺ ኣብ ልበይ ቀንበይበይ ምስበለ:
ቅናትኪ ክዕጠቕ ንቕሓት ትዓዲለ:
ምፍላጡ ከይስእን ረቂቕ ተንኮል ሰይጣን:
ስምኪ እኹል ኮይኑ ዋልታ ሩሐይ ሽፋን።

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 2
ኣዝዝ""""
ንብዓት ዘይነበሮ ብኽያተይ ርኢኽዮ:
ድምጺ ዘይገበረ ኣውያተይ ሰሚዕኽዮ:
ሰላመይ ክብተን ብመስአ ምስሉያት:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 3
ስምኪ ኔሩ ከውለይ ካብ ህቦቡላ ውድቀት:
ኣዝ"""
ድሩት ኮይኑ ዓቕመይ ድኻም ዝልባሱ:
ሕልናይ እጠልመኒ ተስፋይ ተጸንቂቑ:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 4
ሓቂ ኣብ ውሽጠይ ሒዘ ብሓሶት ከይ"ግፋዕ:
ስምኪ''ዩ ዋሕሰይ ውነይ ንኸይውጻዕ።
ኣዝ"""
መጉሃዪ ዘመዱ ረጋጽ ቃል ፈጣሪ:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 5
ጽልኢ ኮይኑ ካባይ ከቁርረኒ ፍቕሪ:
ኣይጨከንክን ድንግል ስእለትኪ ዓዚዙ:
ብድምቀት ኪዳንኪ ኣበሳይ ደብዚዙ።
ኣዝ"""(2)

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)' 
        END,
        lyrics_transliteration = 'CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 1
""fiቕrኺ ab libey qenbeybey misbele:
Qinatki kiet’eቕ niቕhat tiadile:
Miflat’u keysen reqiቕ tenkol seyt’an:
Simki eኹl koynu walta ruhey shfan.

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 2
Azz""""
Nibat zeynebero biኽyatey riiኽyo:
Dimts’i zeygebere awyatey semieኽyo:
Selamey kibten bimesa misluyat:

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 3
Simki neru kewley kab hibobula widqet:
Az"""
Dirut koynu aቕmey diኻm zilbasu:
Hilnay et’elmeni tesfay tets’enqiቑ:

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 4
Haqi ab wisht’ey hize bihasot key"gifae:
Simki''yu wahsey winey niኸywts’ae.
Az"""
Meguhayi zemedu regats’ qal fet’ari:

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)

VERSE 5
Ts’li koynu kabay kequrreni fiቕri:
Aych’ekenkn Dingil sieletki azizu:
Bidmqet kidanki abesay debzizu.
Az""" (2)

CHORUS
Bisalaኺ endye nisleኺ zimskr
Bilaza lewhatki ab hiቕfoኺ zinebr
Biaኺ''we bisalaኺ bisalaኺ''we ts’yon
Nisቕta nihife abahrro sihtan (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '76a7e388-3bbb-4e4a-823b-59b40118a4a7'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 1
""ፍቕርኺ ኣብ ልበይ ቀንበይበይ ምስበለ:
ቅናትኪ ክዕጠቕ ንቕሓት ትዓዲለ:
ምፍላጡ ከይስእን ረቂቕ ተንኮል ሰይጣን:
ስምኪ እኹል ኮይኑ ዋልታ ሩሐይ ሽፋን።

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 2
ኣዝዝ""""
ንብዓት ዘይነበሮ ብኽያተይ ርኢኽዮ:
ድምጺ ዘይገበረ ኣውያተይ ሰሚዕኽዮ:
ሰላመይ ክብተን ብመስአ ምስሉያት:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 3
ስምኪ ኔሩ ከውለይ ካብ ህቦቡላ ውድቀት:
ኣዝ"""
ድሩት ኮይኑ ዓቕመይ ድኻም ዝልባሱ:
ሕልናይ እጠልመኒ ተስፋይ ተጸንቂቑ:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 4
ሓቂ ኣብ ውሽጠይ ሒዘ ብሓሶት ከይ"ግፋዕ:
ስምኪ''ዩ ዋሕሰይ ውነይ ንኸይውጻዕ።
ኣዝ"""
መጉሃዪ ዘመዱ ረጋጽ ቃል ፈጣሪ:

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)

VERSE 5
ጽልኢ ኮይኑ ካባይ ከቁርረኒ ፍቕሪ:
ኣይጨከንክን ድንግል ስእለትኪ ዓዚዙ:
ብድምቀት ኪዳንኪ ኣበሳይ ደብዚዙ።
ኣዝ"""(2)

CHORUS
ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ብሳላኺ እንድየ ንስሌኺ ዝምስክር
ብላዛ ለውሃትኪ ኣብ ሕቕፎኺ ዝነብር
ብኣኺ''ወ ብሳላኺ ብሳላኺ''ወ ጽዮን
ንስቕታ ንሒፈ አባህርሮ ስሕታን(2)
""ፍቕርኺ ኣብ ልበይ ቀንበይበይ ምስበለ:
ቅናትኪ ክዕጠቕ ንቕሓት ትዓዲለ:
ምፍላጡ ከይስእን ረቂቕ ተንኮል ሰይጣን:
ስምኪ እኹል ኮይኑ ዋልታ ሩሐይ ሽፋን።
ኣዝዝ""""
ንብዓት ዘይነበሮ ብኽያተይ ርኢኽዮ:
ድምጺ ዘይገበረ ኣውያተይ ሰሚዕኽዮ:
ሰላመይ ክብተን ብመስአ ምስሉያት:
ስምኪ ኔሩ ከውለይ ካብ ህቦቡላ ውድቀት:
ኣዝ"""
ድሩት ኮይኑ ዓቕመይ ድኻም ዝልባሱ:
ሕልናይ እጠልመኒ ተስፋይ ተጸንቂቑ:
ሓቂ ኣብ ውሽጠይ ሒዘ ብሓሶት ከይ"ግፋዕ:
ስምኪ''ዩ ዋሕሰይ ውነይ ንኸይውጻዕ።
ኣዝ"""
መጉሃዪ ዘመዱ ረጋጽ ቃል ፈጣሪ:
ጽልኢ ኮይኑ ካባይ ከቁርረኒ ፍቕሪ:
ኣይጨከንክን ድንግል ስእለትኪ ዓዚዙ:
ብድምቀት ኪዳንኪ ኣበሳይ ደብዚዙ።
ኣዝ"""(2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '76a7e388-3bbb-4e4a-823b-59b40118a4a7'::uuid, 'sleki-xion-eritrean-orthodox-tewahdo-mezmur-by-eritrean-artists-fnotebrh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- they-honor-her ("ያከብርዎ ለሰንበት")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '73e1859b-f4c3-4515-812e-36d6343c30a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
They honor her, the sabbath, the angels
In the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,

VERSE 1
For God rested on that day from all of these works

CHORUS
They honor her, the sabbath, the angels
In the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
They honor her, the sabbath, the angels
in the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,

VERSE 1
for God rested on that day from all of these works

CHORUS
They honor her, the sabbath, the angels
in the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
They honor her, the sabbath, the angels
in the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,

VERSE 1
for God rested on that day from all of these works

CHORUS
They honor her, the sabbath, the angels
in the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,' THEN lyrics_amharic 
          ELSE 'CHORUS
They honor her, the sabbath, the angels
in the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,

VERSE 1
for God rested on that day from all of these works

CHORUS
They honor her, the sabbath, the angels
in the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,' 
        END,
        lyrics_transliteration = 'CHORUS
They honor her, the sabbath, the angels
In the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,

VERSE 1
For God rested on that day from all of these works

CHORUS
They honor her, the sabbath, the angels
In the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,',
        updated_at = clock_timestamp()::text
    WHERE import_id = '73e1859b-f4c3-4515-812e-36d6343c30a1'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
They honor her, the sabbath, the angels
in the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,

VERSE 1
for God rested on that day from all of these works

CHORUS
They honor her, the sabbath, the angels
in the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,'
        OR lyrics_amharic IS NOT DISTINCT FROM 'They honor her, the sabbath, the angels
in the heavens and the saints that roam in Eden
All of creation, the fishes and the beast praise her,
The ones waiting for judgment so they many rest through her,
for God rested on that day from all of these works'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '73e1859b-f4c3-4515-812e-36d6343c30a1'::uuid, 'they-honor-her', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  RAISE NOTICE 'Batch 32 executed successfully: 33 records processed.';
END $$;

COMMIT;
