-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 03 OF 32
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
  -- kidane-mihret-emebet ("Kidane Mihret Emebet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3c4ae65b-a99d-4f7c-a6e7-6d55d5a92bdb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አንቺ ነሽ የአምላካችን እናት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Anchi nesh yeAmlakachin enat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '3c4ae65b-a99d-4f7c-a6e7-6d55d5a92bdb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አንቺ ነሽ የአምላካችን እናት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Anchi nesh yeAmlakachin enat';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3c4ae65b-a99d-4f7c-a6e7-6d55d5a92bdb'::uuid, 'kidane-mihret-emebet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- for-my-eyes ("For My Eyes")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c835900a-9604-4bf5-b3c3-ed7b9e59ac10'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 1
Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 2
Descended from heaven for He so loved the world
The gracious Almighty Jesus Christ our Lord
Hidden in Bethlehem inside of the manger
He was born on that day our God and Savior

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 3
Many were the prophets that told of His coming
Born from Virgin Mary saved us from suffering
Lifted us from the dust path of iniquity
Saying hallelujah let’s sing in unity

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 4
Desired to restore those who were cast away
Honored us with His love in lowliness He came
What kind of love is this everlasting mercy
Our God being born in a barn so humbly

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 5
Remained perfectly pure in the sanctuary
Gave birth to salvation with full virginity
The Lord that rids the world of evil transgression
The hope of all mankind was born from the Virgin

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 1
Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 2
Descended from heaven for He so loved the world
The gracious Almighty Jesus Christ our Lord
Hidden in Bethlehem inside of the manger
He was born on that day our God and Savior

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 3
Many were the prophets that told of His coming
Born from Virgin Mary saved us from suffering
Lifted us from the dust path of iniquity
Saying hallelujah let’s sing in unity

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 4
Desired to restore those who were cast away
Honored us with His love in lowliness He came
What kind of love is this everlasting mercy
Our God being born in a barn so humbly

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 5
Remained perfectly pure in the sanctuary
Gave birth to salvation with full virginity
The Lord that rids the world of evil transgression
The hope of all mankind was born from the Virgin

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion',
        lyrics_transliteration = 'Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c835900a-9604-4bf5-b3c3-ed7b9e59ac10'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 1
Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 2
Descended from heaven for He so loved the world
The gracious Almighty Jesus Christ our Lord
Hidden in Bethlehem inside of the manger
He was born on that day our God and Savior

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 3
Many were the prophets that told of His coming
Born from Virgin Mary saved us from suffering
Lifted us from the dust path of iniquity
Saying hallelujah let’s sing in unity

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 4
Desired to restore those who were cast away
Honored us with His love in lowliness He came
What kind of love is this everlasting mercy
Our God being born in a barn so humbly

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 5
Remained perfectly pure in the sanctuary
Gave birth to salvation with full virginity
The Lord that rids the world of evil transgression
The hope of all mankind was born from the Virgin

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c835900a-9604-4bf5-b3c3-ed7b9e59ac10'::uuid, 'for-my-eyes', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gabriel-the-powerful ("Gabriel the powerful")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4e001eaf-45e4-4a87-93bb-8603e7bdc670'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዝ

VERSE 1
አዝ

CHORUS
አዝ

VERSE 2
አዝ

CHORUS
አዝ

VERSE 3
አዝ

CHORUS
አዝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
CHORUS

VERSE 1
CHORUS

CHORUS
CHORUS

VERSE 2
CHORUS

CHORUS
CHORUS

VERSE 3
CHORUS

CHORUS
CHORUS'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አዝ

VERSE 1
አዝ

CHORUS
አዝ

VERSE 2
አዝ

CHORUS
አዝ

VERSE 3
አዝ

CHORUS
አዝ',
        lyrics_transliteration = 'CHORUS
CHORUS

VERSE 1
CHORUS

CHORUS
CHORUS

VERSE 2
CHORUS

CHORUS
CHORUS

VERSE 3
CHORUS

CHORUS
CHORUS',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4e001eaf-45e4-4a87-93bb-8603e7bdc670'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'አዝ==

አዝ==

አዝ==

አዝ=='
      AND lyrics_transliteration IS NOT DISTINCT FROM 'ez==

ez==

ez==

ez==';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4e001eaf-45e4-4a87-93bb-8603e7bdc670'::uuid, 'gabriel-the-powerful', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian-orthodox-tewahdo-mezmur-1304 ("Ethiopian Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd3645a82-7dc9-4993-ab5e-25f8ee34d497'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች

VERSE 1
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች

CHORUS
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech

VERSE 1
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech

CHORUS
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች

VERSE 1
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች

CHORUS
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች',
        lyrics_transliteration = 'CHORUS
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech

VERSE 1
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech

CHORUS
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd3645a82-7dc9-4993-ab5e-25f8ee34d497'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች

VERSE 1
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች

CHORUS
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd3645a82-7dc9-4993-ab5e-25f8ee34d497'::uuid, 'ethiopian-orthodox-tewahdo-mezmur-1304', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemenish-zemene-hone ("Zemenish Zemene Hone")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3e647d51-81cd-429a-a450-ced107ff58c1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 1
ባህር ዘን ባህር አካል ዘእም አካል
ወልድም ከእግዚአብሔር አብ ቀድመ አለም ተወልዷል
ድህራለምም ጌታ ሲወለድ ከማርያም
እመቤታችን ፍፁም ህማም የለባትም

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 2
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት ( እግዚአብሄር አብን መስላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 3
እርሱን ስሙት እዳለ (እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ ( ልጄን ስሙት ብላለች)2
አብም ከወልድ በቀር የለውም ሌላ ልጅ
ሀይሉ ጥበቡ እርሱ ነው የአባቱ ቀኝ እጅ

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 4
ድንግልም አልወለደች ከዚህችው ቃል በቀር
እስቄኤል በራእይ ያያት የተዘጋችው በር
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 5
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 6
ቅድመ አለም ተወልዶ እርሱ ያለ እናት
እንድትወልድ አረጋት ድህረ አለም ያላባት
ድንግል ለሀዋርያት ይህንን አስተማረች
ባማን ወላዲት አምላክ የሚስጥሩ መዝገብ ነች

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 7
‹‹
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 8
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2
የባህሪ አባቱ በታቦር ሲመሰክር

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 9
የምወደውን ልጄን እርሱን ስሙት ሲል ነበር
የሥጋችንን ባህሪ በእርሱዋ የነታባት
እናቱን ብላናለች እርሱን ስሙት
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 10
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 11
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 1
Bahr zen bahr akal zeem akal
Weldm keegziabher Ab qedme alem teweldwal
Dihralemm Geta siweled kemaryam
Emebetachen fits’um himam yelebatm

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 2
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat ( egziabher abn meslalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 3
Ersun simut edale (ersu simut bilalech)2
Lijen simut edale ( lijen simut bilalech)2
Abm keweld beqer yelewm lela lij
Heylu t’bebu ersu new yeabatu qegn ej

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 4
Dinglm alweledech kezihchw qal beqer
Esqeel beraey yayat yetezegachw ber
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 5
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 6
Qidme alem teweldo ersu yale enat
Endtweld aregat dihre alem yalabat
Dingil lehewaryat yihnn astemarech
Baman weladit amlak yemist’ru mezgeb nech

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 7
‹‹
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 8
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2
Yebahri abatu betabor simesekr

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 9
Yemwedewn lijen ersun simut sil neber
Yesgachnn bahri beersuwa yenetabat
Enatun bilanalech ersun simut
Zemensh zemene hone ale egziyabheyer Ab (2)

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 10
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 11
Lijen simut edale( lijen simut bilalech)

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 1
ባህር ዘን ባህር አካል ዘእም አካል
ወልድም ከእግዚአብሔር አብ ቀድመ አለም ተወልዷል
ድህራለምም ጌታ ሲወለድ ከማርያም
እመቤታችን ፍፁም ህማም የለባትም

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 2
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት ( እግዚአብሄር አብን መስላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 3
እርሱን ስሙት እዳለ (እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ ( ልጄን ስሙት ብላለች)2
አብም ከወልድ በቀር የለውም ሌላ ልጅ
ሀይሉ ጥበቡ እርሱ ነው የአባቱ ቀኝ እጅ

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 4
ድንግልም አልወለደች ከዚህችው ቃል በቀር
እስቄኤል በራእይ ያያት የተዘጋችው በር
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 5
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 6
ቅድመ አለም ተወልዶ እርሱ ያለ እናት
እንድትወልድ አረጋት ድህረ አለም ያላባት
ድንግል ለሀዋርያት ይህንን አስተማረች
ባማን ወላዲት አምላክ የሚስጥሩ መዝገብ ነች

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 7
‹‹
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 8
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2
የባህሪ አባቱ በታቦር ሲመሰክር

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 9
የምወደውን ልጄን እርሱን ስሙት ሲል ነበር
የሥጋችንን ባህሪ በእርሱዋ የነታባት
እናቱን ብላናለች እርሱን ስሙት
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 10
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 11
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2',
        lyrics_transliteration = 'CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 1
Bahr zen bahr akal zeem akal
Weldm keegziabher Ab qedme alem teweldwal
Dihralemm Geta siweled kemaryam
Emebetachen fits’um himam yelebatm

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 2
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat ( egziabher abn meslalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 3
Ersun simut edale (ersu simut bilalech)2
Lijen simut edale ( lijen simut bilalech)2
Abm keweld beqer yelewm lela lij
Heylu t’bebu ersu new yeabatu qegn ej

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 4
Dinglm alweledech kezihchw qal beqer
Esqeel beraey yayat yetezegachw ber
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 5
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 6
Qidme alem teweldo ersu yale enat
Endtweld aregat dihre alem yalabat
Dingil lehewaryat yihnn astemarech
Baman weladit amlak yemist’ru mezgeb nech

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 7
‹‹
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 8
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2
Yebahri abatu betabor simesekr

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 9
Yemwedewn lijen ersun simut sil neber
Yesgachnn bahri beersuwa yenetabat
Enatun bilanalech ersun simut
Zemensh zemene hone ale egziyabheyer Ab (2)

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 10
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 11
Lijen simut edale( lijen simut bilalech)

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3e647d51-81cd-429a-a450-ced107ff58c1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 1
ባህር ዘን ባህር አካል ዘእም አካል
ወልድም ከእግዚአብሔር አብ ቀድመ አለም ተወልዷል
ድህራለምም ጌታ ሲወለድ ከማርያም
እመቤታችን ፍፁም ህማም የለባትም

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 2
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት ( እግዚአብሄር አብን መስላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 3
እርሱን ስሙት እዳለ (እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ ( ልጄን ስሙት ብላለች)2
አብም ከወልድ በቀር የለውም ሌላ ልጅ
ሀይሉ ጥበቡ እርሱ ነው የአባቱ ቀኝ እጅ

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 4
ድንግልም አልወለደች ከዚህችው ቃል በቀር
እስቄኤል በራእይ ያያት የተዘጋችው በር
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 5
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 6
ቅድመ አለም ተወልዶ እርሱ ያለ እናት
እንድትወልድ አረጋት ድህረ አለም ያላባት
ድንግል ለሀዋርያት ይህንን አስተማረች
ባማን ወላዲት አምላክ የሚስጥሩ መዝገብ ነች

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 7
‹‹
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 8
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2
የባህሪ አባቱ በታቦር ሲመሰክር

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 9
የምወደውን ልጄን እርሱን ስሙት ሲል ነበር
የሥጋችንን ባህሪ በእርሱዋ የነታባት
እናቱን ብላናለች እርሱን ስሙት
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 10
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 11
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3e647d51-81cd-429a-a450-ced107ff58c1'::uuid, 'zemenish-zemene-hone', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gebriel-hayal-melake-selam ("Gebriel Hayal Melake Selam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '084a1049-47db-4b63-bd94-01b0cab763ca'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 1
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 2
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 3
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 4
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው
ቆመህ ተገኘህ መሐከላቸው

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 5
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 6
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 7
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 8
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 9
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 10
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 11
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 12
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 13
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 14
ቂርቆስም ፀና ሞተን ሳይፈራ
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 15
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 16
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 17
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 18
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 19
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 20
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 1
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 2
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 3
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Yetsinatachew zinaw sisema

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 4
Keza Babilon kemot ketema
Hitsanat salu bera imnetachew
Qomeh tegelegneh mehakelachew
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 5
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 6
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 7
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 8
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Wihaw sizel biyasidenegitim

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 9
Beganochu wist biniwawetim
Tsentew zemeru lijina inatu
Ante sitiders keziya ke-isatu
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 10
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 11
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 12
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 13
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Qirqosim tsena moten sayifera

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 14
Ante silaleh kenerisu gara
Atifri alat silemin tifira
Amnew dil nesut yannin mekera
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 15
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 16
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 17
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 18
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Enem amnalew adinegn biye
Fetineh amalidegn kecher Getaye

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 19
Kifuwun zemen yemalifbet
Tsinatun sitegn dil linensabet
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 20
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen'
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
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 2
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 3
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 4
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው
ቆመህ ተገኘህ መሐከላቸው

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 5
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 6
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 7
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 8
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 9
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 10
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 11
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 12
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 13
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 14
ቂርቆስም ፀና ሞተን ሳይፈራ
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 15
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 16
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 17
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 18
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 19
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 20
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን',
        lyrics_transliteration = 'CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 1
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 2
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 3
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Yetsinatachew zinaw sisema

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 4
Keza Babilon kemot ketema
Hitsanat salu bera imnetachew
Qomeh tegelegneh mehakelachew
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 5
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 6
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 7
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 8
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Wihaw sizel biyasidenegitim

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 9
Beganochu wist biniwawetim
Tsentew zemeru lijina inatu
Ante sitiders keziya ke-isatu
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 10
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 11
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 12
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 13
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Qirqosim tsena moten sayifera

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 14
Ante silaleh kenerisu gara
Atifri alat silemin tifira
Amnew dil nesut yannin mekera
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 15
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 16
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 17
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 18
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Enem amnalew adinegn biye
Fetineh amalidegn kecher Getaye

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 19
Kifuwun zemen yemalifbet
Tsinatun sitegn dil linensabet
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 20
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '084a1049-47db-4b63-bd94-01b0cab763ca'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 1
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 2
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 3
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 4
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው
ቆመህ ተገኘህ መሐከላቸው

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 5
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 6
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 7
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 8
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 9
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 10
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 11
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 12
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 13
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 14
ቂርቆስም ፀና ሞተን ሳይፈራ
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 15
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 16
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 17
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 18
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 19
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 20
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 1
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 2
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 3
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Yetsinatachew zinaw sisema

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 4
Keza Babilon kemot ketema
Hitsanat salu bera imnetachew
Qomeh tegelegneh mehakelachew
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 5
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 6
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 7
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 8
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Wihaw sizel biyasidenegitim

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 9
Beganochu wist biniwawetim
Tsentew zemeru lijina inatu
Ante sitiders keziya ke-isatu
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 10
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 11
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 12
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 13
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Qirqosim tsena moten sayifera

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 14
Ante silaleh kenerisu gara
Atifri alat silemin tifira
Amnew dil nesut yannin mekera
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 15
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 16
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 17
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 18
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Enem amnalew adinegn biye
Fetineh amalidegn kecher Getaye

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 19
Kifuwun zemen yemalifbet
Tsinatun sitegn dil linensabet
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 20
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '084a1049-47db-4b63-bd94-01b0cab763ca'::uuid, 'gebriel-hayal-melake-selam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gedilike-grum ("Gedilike Grum")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '55ede167-ff34-433b-aa51-338ccb7dfa96'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገድልከ ግሩም ነገርከ ጥዑም

VERSE 1
ገድልከ ግሩም ነገርከ ጥዑም

CHORUS
ገድልከ ግሩም ነገርከ ጥዑም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gedilika grum negerika teum

VERSE 1
Gedilika grum negerika teum

CHORUS
Gedilika grum negerika teum'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ገድልከ ግሩም ነገርከ ጥዑም

VERSE 1
ገድልከ ግሩም ነገርከ ጥዑም

CHORUS
ገድልከ ግሩም ነገርከ ጥዑም',
        lyrics_transliteration = 'CHORUS
Gedilika grum negerika teum

VERSE 1
Gedilika grum negerika teum

CHORUS
Gedilika grum negerika teum',
        updated_at = clock_timestamp()::text
    WHERE import_id = '55ede167-ff34-433b-aa51-338ccb7dfa96'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገድልከ ግሩም ነገርከ ጥዑም

VERSE 1
ገድልከ ግሩም ነገርከ ጥዑም

CHORUS
ገድልከ ግሩም ነገርከ ጥዑም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gedilika grum negerika teum

VERSE 1
Gedilika grum negerika teum

CHORUS
Gedilika grum negerika teum';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '55ede167-ff34-433b-aa51-338ccb7dfa96'::uuid, 'gedilike-grum', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hale-luya-nisebik ("Hale Luya Hale Luya")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '398d2975-f5bb-4b12-a93a-6037c341614e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ወተወልደ በሥጋ ሰብእ /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
wetewelde besga seb /2 gize/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '398d2975-f5bb-4b12-a93a-6037c341614e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ወተወልደ በሥጋ ሰብእ /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
wetewelde besga seb /2 gize/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '398d2975-f5bb-4b12-a93a-6037c341614e'::uuid, 'hale-luya-nisebik', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mn-setuh-yehuda-winta-atsbha ("mn setuh yehuda winta atsbha")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd3fdda81-dfcd-450a-9aba-4e22c9ecb5bf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)

VERSE 1
ምን ሰጡህ ይሁዳ አይሁድ ዘመዶችህ
ለነርሱ አሳልፈህ ጌታህን የሰጠህ
ከሁሉም የሚበልጥ ሥልጣን ሰጥቶህ ሳለ(2x)
ብርን ለመቀበል ልብህ ተታለለ (2x)

CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)

VERSE 2
ሰማይና ምድርን በቃሉ የፈጠረ
እንዴት በመቃብር ሶስት ቀን አደረ
አንተ የሰጠኸው አሳልፈህ ለሞት (2x)
ሞትን ድል አድርጎ ተነሳ በሰንበት (2x)

CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)

VERSE 1
Min set’uh yihuda ayhud zemedochh
Lenersu asalfeh getahn yeset’eh
Kehulum yemibelt’ silt’an set’toh sale(2x)
Birn lemeqebel libh tetalele (2x)

CHORUS
Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)

VERSE 2
Semayna midrn beqalu yefet’ere
Endet bemeqabr sost qen adere
Ante yeset’eኸw asalfeh lemot (2x)
Motn dil adrgo tenesa besenbet (2x)

CHORUS
Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)

VERSE 1
ምን ሰጡህ ይሁዳ አይሁድ ዘመዶችህ
ለነርሱ አሳልፈህ ጌታህን የሰጠህ
ከሁሉም የሚበልጥ ሥልጣን ሰጥቶህ ሳለ(2x)
ብርን ለመቀበል ልብህ ተታለለ (2x)

CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)

VERSE 2
ሰማይና ምድርን በቃሉ የፈጠረ
እንዴት በመቃብር ሶስት ቀን አደረ
አንተ የሰጠኸው አሳልፈህ ለሞት (2x)
ሞትን ድል አድርጎ ተነሳ በሰንበት (2x)

CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)',
        lyrics_transliteration = 'CHORUS
Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)

VERSE 1
Min set’uh yihuda ayhud zemedochh
Lenersu asalfeh getahn yeset’eh
Kehulum yemibelt’ silt’an set’toh sale(2x)
Birn lemeqebel libh tetalele (2x)

CHORUS
Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)

VERSE 2
Semayna midrn beqalu yefet’ere
Endet bemeqabr sost qen adere
Ante yeset’eኸw asalfeh lemot (2x)
Motn dil adrgo tenesa besenbet (2x)

CHORUS
Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd3fdda81-dfcd-450a-9aba-4e22c9ecb5bf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)

VERSE 1
ምን ሰጡህ ይሁዳ አይሁድ ዘመዶችህ
ለነርሱ አሳልፈህ ጌታህን የሰጠህ
ከሁሉም የሚበልጥ ሥልጣን ሰጥቶህ ሳለ(2x)
ብርን ለመቀበል ልብህ ተታለለ (2x)

CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)

VERSE 2
ሰማይና ምድርን በቃሉ የፈጠረ
እንዴት በመቃብር ሶስት ቀን አደረ
አንተ የሰጠኸው አሳልፈህ ለሞት (2x)
ሞትን ድል አድርጎ ተነሳ በሰንበት (2x)

CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd3fdda81-dfcd-450a-9aba-4e22c9ecb5bf'::uuid, 'mn-setuh-yehuda-winta-atsbha', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hayle-birtate ("Hayle Birtate Kibre Mogese")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '52497ee2-d516-41ac-b0fd-97ef5387cb49'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የዘለዓለሙ የአብርሃሙ ስላሴ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Yezelealemu yeabirahamu selase (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '52497ee2-d516-41ac-b0fd-97ef5387cb49'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የዘለዓለሙ የአብርሃሙ ስላሴ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Yezelealemu yeabirahamu selase (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '52497ee2-d516-41ac-b0fd-97ef5387cb49'::uuid, 'hayle-birtate', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- grum-dinq-neh ("Grum Dinq Neh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '785699ca-010f-4f42-9e5b-9650f6ebbfbe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Grum dinq neh getayé grum dinq neh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '785699ca-010f-4f42-9e5b-9650f6ebbfbe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Grum dinq neh getayé grum dinq neh';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '785699ca-010f-4f42-9e5b-9650f6ebbfbe'::uuid, 'grum-dinq-neh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- he-is-praised ("He is praised")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cd44352e-a155-4b3f-b8c9-7374fa215509'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
For my home is complete by my King'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Misgun new yetemesegene
Baryawun enen yikir yale
Yimesgen yimesgenilign
Gojoyen Amlak molalign'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = 'Misgun new yetemesegene
Baryawun enen yikir yale
Yimesgen yimesgenilign
Gojoyen Amlak molalign',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cd44352e-a155-4b3f-b8c9-7374fa215509'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
For my home is complete by my King'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Misgun new yetemesegene
Baryawun enen yikir yale
Yimesgen yimesgenilign
Gojoyen Amlak molalign';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cd44352e-a155-4b3f-b8c9-7374fa215509'::uuid, 'he-is-praised', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- haylihi-sigelet-besemay ("Haylihi Sigelet Besemay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd2ab078d-9e2d-4ebc-8b99-14b73e331264'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ማን ይቆም ይሆን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Man yiqom yihon'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd2ab078d-9e2d-4ebc-8b99-14b73e331264'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ
አዝማች.............................
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ
አዝማች..............................
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ
አዝማች..............................
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት
አዝማች..............................
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ
አዝማች..............................
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት
አዝማች.......................

VERSE 1
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ
አዝማች.............................
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ
አዝማች..............................
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ
አዝማች..............................
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት
አዝማች..............................
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ
አዝማች..............................
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት
አዝማች.......................

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ
አዝማች.............................
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ
አዝማች..............................
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ
አዝማች..............................
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት
አዝማች..............................
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ
አዝማች..............................
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት
አዝማች.......................'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
haylh sigelet besemay/2/
ebet man yqom yhon kefith
man yqom yhon/2/ kefith
man yqom yhon
ebet qende meleket sinefa
ewaj sitawej beyfa
tsadqan siteru letedla
mn yhon yenya tesfa
ezmach.............................
ebet melakt semayun siyarsut
qedmew sisemu mebarqt
yaltayena yaltesema
dmts sisema kerama
ezmach..............................
ebet sebatu nefas tekeftew
mdrn siyawt qezfew
sitazez yebahr moged
mdrin likednat lefrd
ezmach..............................
ebet siteru tsadqan qdusan
melkam yeseru burukan
bemdr yeseru trufat
siyaqerbu leemlak sbhet
ezmach..............................
ebet haten gn lefrd siteru
bechelema alem liqeru
yemayteqm wayta hono
mewared yhonal bakno
ezmach..............................
ebet siteru tsadqan qdusan
melkam yeseru burukan
bemdr yeseru trufat
siyasemu leemlak sbhet
ezmach.......................

VERSE 1
haylh sigelet besemay/2/
ebet man yqom yhon kefith
man yqom yhon/2/ kefith
man yqom yhon
ebet qende meleket sinefa
ewaj sitawej beyfa
tsadqan siteru letedla
mn yhon yenya tesfa
ezmach.............................
ebet melakt semayun siyarsut
qedmew sisemu mebarqt
yaltayena yaltesema
dmts sisema kerama
ezmach..............................
ebet sebatu nefas tekeftew
mdrn siyawt qezfew
sitazez yebahr moged
mdrin likednat lefrd
ezmach..............................
ebet siteru tsadqan qdusan
melkam yeseru burukan
bemdr yeseru trufat
siyaqerbu leemlak sbhet
ezmach..............................
ebet haten gn lefrd siteru
bechelema alem liqeru
yemayteqm wayta hono
mewared yhonal bakno
ezmach..............................
ebet siteru tsadqan qdusan
melkam yeseru burukan
bemdr yeseru trufat
siyasemu leemlak sbhet
ezmach.......................

CHORUS
haylh sigelet besemay/2/
ebet man yqom yhon kefith
man yqom yhon/2/ kefith
man yqom yhon
ebet qende meleket sinefa
ewaj sitawej beyfa
tsadqan siteru letedla
mn yhon yenya tesfa
ezmach.............................
ebet melakt semayun siyarsut
qedmew sisemu mebarqt
yaltayena yaltesema
dmts sisema kerama
ezmach..............................
ebet sebatu nefas tekeftew
mdrn siyawt qezfew
sitazez yebahr moged
mdrin likednat lefrd
ezmach..............................
ebet siteru tsadqan qdusan
melkam yeseru burukan
bemdr yeseru trufat
siyaqerbu leemlak sbhet
ezmach..............................
ebet haten gn lefrd siteru
bechelema alem liqeru
yemayteqm wayta hono
mewared yhonal bakno
ezmach..............................
ebet siteru tsadqan qdusan
melkam yeseru burukan
bemdr yeseru trufat
siyasemu leemlak sbhet
ezmach.......................';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd2ab078d-9e2d-4ebc-8b99-14b73e331264'::uuid, 'haylihi-sigelet-besemay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- he-who-created-you ("He who created you")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fe5de49f-762c-4f05-89e3-8bec92e9265a'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Blessed be God let His let His name be praised'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fe5de49f-762c-4f05-89e3-8bec92e9265a'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Blessed be God let His let His name be praised'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fe5de49f-762c-4f05-89e3-8bec92e9265a'::uuid, 'he-who-created-you', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nu-lemesgana-zemari-kesis-mindaye-berhanu ("Nu Lemesgana Zemari Kesis Mindaye Berhanu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3eaccd2a-38a1-4d0c-a573-0b009834a369'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)',
        lyrics_transliteration = 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3eaccd2a-38a1-4d0c-a573-0b009834a369'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3eaccd2a-38a1-4d0c-a573-0b009834a369'::uuid, 'nu-lemesgana-zemari-kesis-mindaye-berhanu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- elil-elil-elil ("Elil Elil Elil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '40d6d19f-100e-4f52-abbf-89f0ddcf2647'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ደስም አለን የሠራዊት ጌታ ክበር ተመስገን',
        lyrics_transliteration = 'CHORUS
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
Desm alen yeserawit Geta kiber temesgen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '40d6d19f-100e-4f52-abbf-89f0ddcf2647'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '40d6d19f-100e-4f52-abbf-89f0ddcf2647'::uuid, 'elil-elil-elil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-call-out-your-name ("I call out your name")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e13d2ce0-39e8-416d-aba6-3adf6ca28543'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
To you my reverence O Virgin is due'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshin teriche meche afralew
Mariam biye meche ewedkalew
Yemitsnanabet simish newina
Dingil hoy lakrib lanchi misgana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = 'Simshin teriche meche afralew
Mariam biye meche ewedkalew
Yemitsnanabet simish newina
Dingil hoy lakrib lanchi misgana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e13d2ce0-39e8-416d-aba6-3adf6ca28543'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
To you my reverence O Virgin is due'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshin teriche meche afralew
Mariam biye meche ewedkalew
Yemitsnanabet simish newina
Dingil hoy lakrib lanchi misgana';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e13d2ce0-39e8-416d-aba6-3adf6ca28543'::uuid, 'i-call-out-your-name', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ye-yared-wub-zema ("Ye Yared Wub Zema")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3f8e2cfd-63b0-4f42-ad2d-510886556f5e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 1
በምን አደበቴ
እደትሥ ባለ ቃል
ማርያም ልበልሽ
በምን አደበቴ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 2
እደትሥ ባለ ቃል
ማርያም ልበልሽ(2)
ምድርና ሠማዩ ታምርሺን ይገሩ
ፋጥረታትበሙሉሥላች ይመሥክሩ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 3
ተነግሮ የማያልቅ ድንቅ ነው ሥራሺ
ድንግል ሆይ እናቴ አምሣያ የለሺ
ማርያም ድግል እረዳቴ
የምደርሺልኝ ነይ ሥልሺ በጭንቀቴ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 4
ተአምርሺንም በአይኔ አይቻለሁ
ፅወን ሆይ ሥልሺ ድንግል ሆይ እጠግባለሁ
"""""""አዝ""""""''
የእግዚአብሔር ጥበቡ በአንች ተገለጠ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 5
የአዳም ዘር በሙሉ ከሞት አመለጠ
የመዳን ምክንያት ማርያም አች ነሺ
ለፋጥረቱ ሁሉ መሠላል የሆሽ
ነገ ባላውቅ እኔንም ቢያሥፈራኝ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 6
አንች ካለ ሺኝ በፋፁም አልወድቅም
በፊትሺ እድቆም ለምሥጋና
ማርያም ልበልሺ በትህትና
""""""""""አዝ"""""""""""

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 7
ትውልዱ በሙሉ ለምሥጋና ይቁም
ባንች ሥለሆነ የቀረለት መርገም
አዳም ከነልጁ በሠማይ በምድር
ማርያም ማርያም ይበል ታምርሺን ይናገር

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 8
ጨለማው ከፊቴ ተገፈፈ
ማርያም በምልጃሽ ልቤ አረፈ
ከጎኔ ነይ ሥልሽ እፅናናለሁ
እሣት ገደሉን ሁሉንም አልፈዋለሁ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 9
የያሬድ ውብ ዜማ
ድንግል እመቤቴ
ሥጦታየ ነሺ
በምን አደበቴ እደትሥ ባለ ቃል

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 10
ማርያም ልበልሺ(2)

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 1
Bemn adebete
Edets bale qal
Maryam libelsh
Bemn adebete

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 2
Edets bale qal
Maryam libelsh (2)
Midrna semayu tamrshin yigeru
Fat’retatbemuluslach yimeskru

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 3
Tenegro yemayalq dinq new sirashi
Dingil hoy enate amsaya yeleshi
Maryam digl eredate
Yemdershilgn ney silshi bech’nqete

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 4
Teamrshinm beayne aychalehu
Ts’wen hoy silshi Dingil hoy et’egbalehu
"""""""az""""""''
YeEgziabher t’bebu beanch tegelet’e

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 5
Yeadam zer bemulu kemot amelet’e
Yemedan miknyat Maryam ach neshi
Lefat’retu hulu meselal yehosh
Nege balawq enenm biyasferagn

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 6
Anch kale shign befats’um alwedqm
Befitshi edqom lemsgana
Maryam libelshi bethtna
""""""""""az"""""""""""

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 7
Tiwldu bemulu lemsgana yiqum
Banch silehone yeqerelet mergem
Adam kenelju besemay bemdr
Maryam Maryam yibel tamrshin yinager

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 8
Ch’elemaw kefite tegefefe
Maryam bemljash libe arefe
Kegone ney silsh ets’nanalehu
Esat gedelun hulunm alfewalehu

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 9
Yeyared wib zema
Dingil Emebete
Sit’otaye neshi
Bemn adebete edets bale qal

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 10
Maryam libelshi (2)

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 1
በምን አደበቴ
እደትሥ ባለ ቃል
ማርያም ልበልሽ
በምን አደበቴ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 2
እደትሥ ባለ ቃል
ማርያም ልበልሽ(2)
ምድርና ሠማዩ ታምርሺን ይገሩ
ፋጥረታትበሙሉሥላች ይመሥክሩ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 3
ተነግሮ የማያልቅ ድንቅ ነው ሥራሺ
ድንግል ሆይ እናቴ አምሣያ የለሺ
ማርያም ድግል እረዳቴ
የምደርሺልኝ ነይ ሥልሺ በጭንቀቴ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 4
ተአምርሺንም በአይኔ አይቻለሁ
ፅወን ሆይ ሥልሺ ድንግል ሆይ እጠግባለሁ
"""""""አዝ""""""''
የእግዚአብሔር ጥበቡ በአንች ተገለጠ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 5
የአዳም ዘር በሙሉ ከሞት አመለጠ
የመዳን ምክንያት ማርያም አች ነሺ
ለፋጥረቱ ሁሉ መሠላል የሆሽ
ነገ ባላውቅ እኔንም ቢያሥፈራኝ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 6
አንች ካለ ሺኝ በፋፁም አልወድቅም
በፊትሺ እድቆም ለምሥጋና
ማርያም ልበልሺ በትህትና
""""""""""አዝ"""""""""""

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 7
ትውልዱ በሙሉ ለምሥጋና ይቁም
ባንች ሥለሆነ የቀረለት መርገም
አዳም ከነልጁ በሠማይ በምድር
ማርያም ማርያም ይበል ታምርሺን ይናገር

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 8
ጨለማው ከፊቴ ተገፈፈ
ማርያም በምልጃሽ ልቤ አረፈ
ከጎኔ ነይ ሥልሽ እፅናናለሁ
እሣት ገደሉን ሁሉንም አልፈዋለሁ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 9
የያሬድ ውብ ዜማ
ድንግል እመቤቴ
ሥጦታየ ነሺ
በምን አደበቴ እደትሥ ባለ ቃል

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 10
ማርያም ልበልሺ(2)

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ',
        lyrics_transliteration = 'CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 1
Bemn adebete
Edets bale qal
Maryam libelsh
Bemn adebete

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 2
Edets bale qal
Maryam libelsh (2)
Midrna semayu tamrshin yigeru
Fat’retatbemuluslach yimeskru

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 3
Tenegro yemayalq dinq new sirashi
Dingil hoy enate amsaya yeleshi
Maryam digl eredate
Yemdershilgn ney silshi bech’nqete

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 4
Teamrshinm beayne aychalehu
Ts’wen hoy silshi Dingil hoy et’egbalehu
"""""""az""""""''
YeEgziabher t’bebu beanch tegelet’e

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 5
Yeadam zer bemulu kemot amelet’e
Yemedan miknyat Maryam ach neshi
Lefat’retu hulu meselal yehosh
Nege balawq enenm biyasferagn

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 6
Anch kale shign befats’um alwedqm
Befitshi edqom lemsgana
Maryam libelshi bethtna
""""""""""az"""""""""""

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 7
Tiwldu bemulu lemsgana yiqum
Banch silehone yeqerelet mergem
Adam kenelju besemay bemdr
Maryam Maryam yibel tamrshin yinager

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 8
Ch’elemaw kefite tegefefe
Maryam bemljash libe arefe
Kegone ney silsh ets’nanalehu
Esat gedelun hulunm alfewalehu

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 9
Yeyared wib zema
Dingil Emebete
Sit’otaye neshi
Bemn adebete edets bale qal

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 10
Maryam libelshi (2)

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3f8e2cfd-63b0-4f42-ad2d-510886556f5e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 1
በምን አደበቴ
እደትሥ ባለ ቃል
ማርያም ልበልሽ
በምን አደበቴ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 2
እደትሥ ባለ ቃል
ማርያም ልበልሽ(2)
ምድርና ሠማዩ ታምርሺን ይገሩ
ፋጥረታትበሙሉሥላች ይመሥክሩ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 3
ተነግሮ የማያልቅ ድንቅ ነው ሥራሺ
ድንግል ሆይ እናቴ አምሣያ የለሺ
ማርያም ድግል እረዳቴ
የምደርሺልኝ ነይ ሥልሺ በጭንቀቴ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 4
ተአምርሺንም በአይኔ አይቻለሁ
ፅወን ሆይ ሥልሺ ድንግል ሆይ እጠግባለሁ
"""""""አዝ""""""''
የእግዚአብሔር ጥበቡ በአንች ተገለጠ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 5
የአዳም ዘር በሙሉ ከሞት አመለጠ
የመዳን ምክንያት ማርያም አች ነሺ
ለፋጥረቱ ሁሉ መሠላል የሆሽ
ነገ ባላውቅ እኔንም ቢያሥፈራኝ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 6
አንች ካለ ሺኝ በፋፁም አልወድቅም
በፊትሺ እድቆም ለምሥጋና
ማርያም ልበልሺ በትህትና
""""""""""አዝ"""""""""""

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 7
ትውልዱ በሙሉ ለምሥጋና ይቁም
ባንች ሥለሆነ የቀረለት መርገም
አዳም ከነልጁ በሠማይ በምድር
ማርያም ማርያም ይበል ታምርሺን ይናገር

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 8
ጨለማው ከፊቴ ተገፈፈ
ማርያም በምልጃሽ ልቤ አረፈ
ከጎኔ ነይ ሥልሽ እፅናናለሁ
እሣት ገደሉን ሁሉንም አልፈዋለሁ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 9
የያሬድ ውብ ዜማ
ድንግል እመቤቴ
ሥጦታየ ነሺ
በምን አደበቴ እደትሥ ባለ ቃል

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 10
ማርያም ልበልሺ(2)

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3f8e2cfd-63b0-4f42-ad2d-510886556f5e'::uuid, 'ye-yared-wub-zema', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wedanichi-yemetaw ("Wedanichi Yemetaw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '45995179-03e6-41c6-aa97-8a7b0435cdfd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
በአንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሄዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባህሪሽን ባህሪ አድርጎት
ለፍጥረታት ጌታ መዓዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 3
በጥቂቱ አደገ ተልኮና ታ
ከድንግልና ጋር አንድ የሆነ ሀሊብ
በሩካቤ ሳይሆን በብስራት እንደ ንብ
ከሆድ መጥበብ ጋራ የመለኮት ስፋት

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 4
እንቺ ሆነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ህሊና የማይመረመር
እፁብ ነው ድንቅ ነው የመጽነሷ ነገር
እሳት ወነበልባል በሆድሽ ውስጥ ሲያድር

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር
መዝሙር
የሊቀ መዘምራንይልማ ኃይሉ

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 1
Beanchi tefets’eme yesew lijoch desta
Bedeyn yetet’alech hewan tedesetech
Yedesta mefleqiya anchin silagegnech
Yebereket fire kanchi tegegneln

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 2
Yeweyn bota nesh Dingil enatachn
Weldm bahrishn bahri adrgot
Left’retat Geta meazash tesmamtot
Kanchi yiweled zend fits’um lilalaksh

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 3
Bet’qitu adege telkona ta
Kednglna gar and yehone helib
Berukabe sayhon bebsrat ende nib
Kehod met’beb gara yemelekot sifat

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 4
Enchi honesh sale tanashwa mushrit
Beft’ur hilina yemaymeremer
Ets’ub new dinq new yemets’neswa neger
Esat wenebelbal behodsh wist’ siyadr

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 5
Nede nebelbalu alfejeshm neber
Mezmur
Yeliqe mezemranylma haylu

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
በአንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሄዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባህሪሽን ባህሪ አድርጎት
ለፍጥረታት ጌታ መዓዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 3
በጥቂቱ አደገ ተልኮና ታ
ከድንግልና ጋር አንድ የሆነ ሀሊብ
በሩካቤ ሳይሆን በብስራት እንደ ንብ
ከሆድ መጥበብ ጋራ የመለኮት ስፋት

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 4
እንቺ ሆነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ህሊና የማይመረመር
እፁብ ነው ድንቅ ነው የመጽነሷ ነገር
እሳት ወነበልባል በሆድሽ ውስጥ ሲያድር

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር
መዝሙር
የሊቀ መዘምራንይልማ ኃይሉ

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ',
        lyrics_transliteration = 'CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 1
Beanchi tefets’eme yesew lijoch desta
Bedeyn yetet’alech hewan tedesetech
Yedesta mefleqiya anchin silagegnech
Yebereket fire kanchi tegegneln

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 2
Yeweyn bota nesh Dingil enatachn
Weldm bahrishn bahri adrgot
Left’retat Geta meazash tesmamtot
Kanchi yiweled zend fits’um lilalaksh

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 3
Bet’qitu adege telkona ta
Kednglna gar and yehone helib
Berukabe sayhon bebsrat ende nib
Kehod met’beb gara yemelekot sifat

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 4
Enchi honesh sale tanashwa mushrit
Beft’ur hilina yemaymeremer
Ets’ub new dinq new yemets’neswa neger
Esat wenebelbal behodsh wist’ siyadr

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 5
Nede nebelbalu alfejeshm neber
Mezmur
Yeliqe mezemranylma haylu

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '45995179-03e6-41c6-aa97-8a7b0435cdfd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
በአንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሄዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባህሪሽን ባህሪ አድርጎት
ለፍጥረታት ጌታ መዓዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 3
በጥቂቱ አደገ ተልኮና ታ
ከድንግልና ጋር አንድ የሆነ ሀሊብ
በሩካቤ ሳይሆን በብስራት እንደ ንብ
ከሆድ መጥበብ ጋራ የመለኮት ስፋት

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 4
እንቺ ሆነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ህሊና የማይመረመር
እፁብ ነው ድንቅ ነው የመጽነሷ ነገር
እሳት ወነበልባል በሆድሽ ውስጥ ሲያድር

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር
መዝሙር
የሊቀ መዘምራንይልማ ኃይሉ

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '45995179-03e6-41c6-aa97-8a7b0435cdfd'::uuid, 'wedanichi-yemetaw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hosana-emrit ("Hosana Emrit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a3136a8b-5093-4ce8-ad69-39de4ced1938'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)

VERSE 1
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)

CHORUS
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)

VERSE 1
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)

CHORUS
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a3136a8b-5093-4ce8-ad69-39de4ced1938'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)

VERSE 1
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)

CHORUS
ሆሳዕና እምርት እንተ አቡነ ዳዊት (2)
ቡርክት እንተ ትመጽእ መንግስት (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)

VERSE 1
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)

CHORUS
hosana mrt nte ebune dawit (2)
burkt nte tmets mengst (4)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a3136a8b-5093-4ce8-ad69-39de4ced1938'::uuid, 'hosana-emrit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-have-no-righteous-deeds ("I have no righteous deeds")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ccf49930-c12a-4f9e-9bd2-2d82a858a988'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Ezegnilegni Dingil Ematsenishalew'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Enes bemigibare dekama hognalehu
Ezegnilegni Dingil elemeneshalehu
Ezegnilegni Dingil ematsenishalew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = 'Enes bemigibare dekama hognalehu
Ezegnilegni Dingil elemeneshalehu
Ezegnilegni Dingil ematsenishalew',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ccf49930-c12a-4f9e-9bd2-2d82a858a988'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Ezegnilegni Dingil Ematsenishalew'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Enes bemigibare dekama hognalehu
Ezegnilegni Dingil elemeneshalehu
Ezegnilegni Dingil ematsenishalew';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ccf49930-c12a-4f9e-9bd2-2d82a858a988'::uuid, 'i-have-no-righteous-deeds', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- girum-zimarewoch-bemin-des-lasegnih-yewededegn-geta-girum-dinik-neh-bemu ("Girum Zimarewoch Bemin Des Lasegnih Yewededegn Geta Girum Dinik Neh Bemuhaze Sibihat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '42015f1f-c1ca-4e4a-ab96-572614c6cfb7'::uuid
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
    WHERE import_id = '42015f1f-c1ca-4e4a-ab96-572614c6cfb7'::uuid
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
        '42015f1f-c1ca-4e4a-ab96-572614c6cfb7'::uuid, 'girum-zimarewoch-bemin-des-lasegnih-yewededegn-geta-girum-dinik-neh-bemu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-have-seen-all-i-need ("I have seen all I need")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8ed978b6-64e8-48c1-aebb-82507cb66fa4'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
My Lord is here indeed'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = '8ed978b6-64e8-48c1-aebb-82507cb66fa4'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
My Lord is here indeed'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8ed978b6-64e8-48c1-aebb-82507cb66fa4'::uuid, 'i-have-seen-all-i-need', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yetewedede-ken-zemarit-betselot-asimare ("Yetewedede Ken…zemarit Betselot Asimare")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4679461a-ebfc-4abd-a1dd-97f87e0d19ff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለ��ነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 1
Amshto yemet’a aygebam atbelu
Abakno yemet’a aygebam atbelu
Fiqr sele��ne Egziabher lehulu
Lij betun yiwersal endetesefa qalu

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 2
Kenazret melkam sew aywet’am eyalu
Filp’os natnael yinegageralu
Adrgotalna wihewn weyn
Zarem lewt’ognal wesdotal liben

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 3
Ene negn alamaw ene negn hesabu
Abate deg new yemirara libu
Zet’ena zet’egnun tamnewt eyale
Andun yifelgal wedet neh eyale

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 4
Hulun aychalehu hulun mermrealehu
Bealem kante lela endelele awqalehu
Endemaylewet’ abatneth wedajneth
T’efche simet’a ayehut lijh

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 5
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet x2

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለ��ነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2',
        lyrics_transliteration = 'CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 1
Amshto yemet’a aygebam atbelu
Abakno yemet’a aygebam atbelu
Fiqr sele��ne Egziabher lehulu
Lij betun yiwersal endetesefa qalu

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 2
Kenazret melkam sew aywet’am eyalu
Filp’os natnael yinegageralu
Adrgotalna wihewn weyn
Zarem lewt’ognal wesdotal liben

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 3
Ene negn alamaw ene negn hesabu
Abate deg new yemirara libu
Zet’ena zet’egnun tamnewt eyale
Andun yifelgal wedet neh eyale

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 4
Hulun aychalehu hulun mermrealehu
Bealem kante lela endelele awqalehu
Endemaylewet’ abatneth wedajneth
T’efche simet’a ayehut lijh

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 5
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet x2

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4679461a-ebfc-4abd-a1dd-97f87e0d19ff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለ��ነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4679461a-ebfc-4abd-a1dd-97f87e0d19ff'::uuid, 'yetewedede-ken-zemarit-betselot-asimare', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyam-mariyam ("Mariyam Mariyam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd47d27cd-ba4b-4a4b-b11a-9a82f3c8244c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 1
አዝ
ማር ልበል በምድር ያም ልበል በሰማይ
የማይጠግቡት መና የማይጨርሱት ሲሳይ
መንፈስ ቅዱስ ቃኝቶት ሰርቶ በምስጢሩ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 2
አፌ ላይ ጣፈጠኝ ስምሽ አጠራሩ/2/
አዝ
መድሃኒት ታቅፈሽ የአለሙን ጌታ
ከቤተሌሄም ደጅ እስከ ጎለጌታ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 3
የዓለሙን ህመም የአለሙን በሽታ
ታክሚው ነበረ ድንግል በዝምታ/2/
አዝ
በምን እንመስልሽ የለሽም ምሳሌ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 4
አንጠግብም ብንጠራሽ ብንዘምርልሽ ሁሌ
ምስክር አያሻም ያንቺ ልዕልና
የአለሙን ንጉስ ወልደሽዋልና/2/
አዝ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 5
የወርቅ ማዕጠንት እሳት የታቀፍሽ
የአዲስ ኪዳን ክሩብ ማርያም አንቺ ነሽ
ያ''ርያም እጣን ነሽ መዓዛሽ ያምረ
ዘለዓለም አይወድቅም አንቺን ያከበረ/2/

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 1
CHORUS
Mar libel bemdr yam libel besemay
Yemayt’egbut mena yemaych’ersut sisay
Menfes Kidus qagntot serto bemst’iru

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 2
Afe lay t’afet’egn simsh at’eraru (2)
CHORUS
Medhanit taqfesh yealemun Geta
Kebetelehem dej eske golegeta

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 3
Yealemun himem yealemun beshta
Takmiw nebere Dingil bezmta (2)
CHORUS
Bemn enmeslsh yeleshm misale

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 4
Ant’egbm bint’erash binzemrlsh hule
Miskr ayasham yanchi lielna
Yealemun nigus weldeshwalna (2)
CHORUS

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 5
Yewerq maet’ent esat yetaqefsh
Yeadis kidan kirub Maryam anchi nesh
Ya''riyam et’an nesh meazash yamre
Zelealem aywedqm anchin yakebere (2)

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 1
አዝ
ማር ልበል በምድር ያም ልበል በሰማይ
የማይጠግቡት መና የማይጨርሱት ሲሳይ
መንፈስ ቅዱስ ቃኝቶት ሰርቶ በምስጢሩ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 2
አፌ ላይ ጣፈጠኝ ስምሽ አጠራሩ/2/
አዝ
መድሃኒት ታቅፈሽ የአለሙን ጌታ
ከቤተሌሄም ደጅ እስከ ጎለጌታ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 3
የዓለሙን ህመም የአለሙን በሽታ
ታክሚው ነበረ ድንግል በዝምታ/2/
አዝ
በምን እንመስልሽ የለሽም ምሳሌ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 4
አንጠግብም ብንጠራሽ ብንዘምርልሽ ሁሌ
ምስክር አያሻም ያንቺ ልዕልና
የአለሙን ንጉስ ወልደሽዋልና/2/
አዝ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 5
የወርቅ ማዕጠንት እሳት የታቀፍሽ
የአዲስ ኪዳን ክሩብ ማርያም አንቺ ነሽ
ያ''ርያም እጣን ነሽ መዓዛሽ ያምረ
ዘለዓለም አይወድቅም አንቺን ያከበረ/2/

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ',
        lyrics_transliteration = 'CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 1
CHORUS
Mar libel bemdr yam libel besemay
Yemayt’egbut mena yemaych’ersut sisay
Menfes Kidus qagntot serto bemst’iru

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 2
Afe lay t’afet’egn simsh at’eraru (2)
CHORUS
Medhanit taqfesh yealemun Geta
Kebetelehem dej eske golegeta

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 3
Yealemun himem yealemun beshta
Takmiw nebere Dingil bezmta (2)
CHORUS
Bemn enmeslsh yeleshm misale

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 4
Ant’egbm bint’erash binzemrlsh hule
Miskr ayasham yanchi lielna
Yealemun nigus weldeshwalna (2)
CHORUS

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 5
Yewerq maet’ent esat yetaqefsh
Yeadis kidan kirub Maryam anchi nesh
Ya''riyam et’an nesh meazash yamre
Zelealem aywedqm anchin yakebere (2)

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd47d27cd-ba4b-4a4b-b11a-9a82f3c8244c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ
አዝ = = = = = ==
ማር ልበል በምድር ያም ልበል በሰማይ
የማይጠግቡት መና የማይጨርሱት ሲሳይ
መንፈስ ቅዱስ ቃኝቶት ሰርቶ በምስጢሩ
አፌ ላይ ጣፈጠኝ ስምሽ አጠራሩ/2/
አዝ = = = = = = =
መድሃኒት ታቅፈሽ የአለሙን ጌታ
ከቤተሌሄም ደጅ እስከ ጎለጌታ
የዓለሙን ህመም የአለሙን በሽታ
ታክሚው ነበረ ድንግል በዝምታ/2/
አዝ = = = = = =
በምን እንመስልሽ የለሽም ምሳሌ
አንጠግብም ብንጠራሽ ብንዘምርልሽ ሁሌ
ምስክር አያሻም ያንቺ ልዕልና
የአለሙን ንጉስ ወልደሽዋልና/2/
አዝ = = = = = =
የወርቅ ማዕጠንት እሳት የታቀፍሽ
የአዲስ ኪዳን ክሩብ ማርያም አንቺ ነሽ
ያ''ርያም እጣን ነሽ መዓዛሽ ያምረ
ዘለዓለም አይወድቅም አንቺን ያከበረ/2/

VERSE 1
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ
አዝ = = = = = ==
ማር ልበል በምድር ያም ልበል በሰማይ
የማይጠግቡት መና የማይጨርሱት ሲሳይ
መንፈስ ቅዱስ ቃኝቶት ሰርቶ በምስጢሩ
አፌ ላይ ጣፈጠኝ ስምሽ አጠራሩ/2/
አዝ = = = = = = =
መድሃኒት ታቅፈሽ የአለሙን ጌታ
ከቤተሌሄም ደጅ እስከ ጎለጌታ
የዓለሙን ህመም የአለሙን በሽታ
ታክሚው ነበረ ድንግል በዝምታ/2/
አዝ = = = = = =
በምን እንመስልሽ የለሽም ምሳሌ
አንጠግብም ብንጠራሽ ብንዘምርልሽ ሁሌ
ምስክር አያሻም ያንቺ ልዕልና
የአለሙን ንጉስ ወልደሽዋልና/2/
አዝ = = = = = =
የወርቅ ማዕጠንት እሳት የታቀፍሽ
የአዲስ ኪዳን ክሩብ ማርያም አንቺ ነሽ
ያ''ርያም እጣን ነሽ መዓዛሽ ያምረ
ዘለዓለም አይወድቅም አንቺን ያከበረ/2/

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ
አዝ = = = = = ==
ማር ልበል በምድር ያም ልበል በሰማይ
የማይጠግቡት መና የማይጨርሱት ሲሳይ
መንፈስ ቅዱስ ቃኝቶት ሰርቶ በምስጢሩ
አፌ ላይ ጣፈጠኝ ስምሽ አጠራሩ/2/
አዝ = = = = = = =
መድሃኒት ታቅፈሽ የአለሙን ጌታ
ከቤተሌሄም ደጅ እስከ ጎለጌታ
የዓለሙን ህመም የአለሙን በሽታ
ታክሚው ነበረ ድንግል በዝምታ/2/
አዝ = = = = = =
በምን እንመስልሽ የለሽም ምሳሌ
አንጠግብም ብንጠራሽ ብንዘምርልሽ ሁሌ
ምስክር አያሻም ያንቺ ልዕልና
የአለሙን ንጉስ ወልደሽዋልና/2/
አዝ = = = = = =
የወርቅ ማዕጠንት እሳት የታቀፍሽ
የአዲስ ኪዳን ክሩብ ማርያም አንቺ ነሽ
ያ''ርያም እጣን ነሽ መዓዛሽ ያምረ
ዘለዓለም አይወድቅም አንቺን ያከበረ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd47d27cd-ba4b-4a4b-b11a-9a82f3c8244c'::uuid, 'mariyam-mariyam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-will-forever-sing-for-my-lady ("I will forever sing for my Lady")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2b505fa7-1ac7-4a8a-807b-989fd9128d72'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
I will praise the Virgin until the end of time'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yihew ezemiralew le Emebete
Ye fiqrua bereket gebto bete
Silegobegnechiw gosquala hiyweten
Ameseginalehu Dingil Emebeten'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = 'Yihew ezemiralew le Emebete
Ye fiqrua bereket gebto bete
Silegobegnechiw gosquala hiyweten
Ameseginalehu Dingil Emebeten',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2b505fa7-1ac7-4a8a-807b-989fd9128d72'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
I will praise the Virgin until the end of time'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yihew ezemiralew le Emebete
Ye fiqrua bereket gebto bete
Silegobegnechiw gosquala hiyweten
Ameseginalehu Dingil Emebeten';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2b505fa7-1ac7-4a8a-807b-989fd9128d72'::uuid, 'i-will-forever-sing-for-my-lady', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-will-praise-you ("I will praise You")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '39817b47-0aa1-48ea-81ae-a737f5dc8709'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
A gift given to glorify you my Father'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Lamesginih yene Geta lamesginih
Liqegnilih yene Geta liqegnilih
Hiywete new zimare tirufate
Yesetehegn endakebrih ante abate'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = 'Lamesginih yene Geta lamesginih
Liqegnilih yene Geta liqegnilih
Hiywete new zimare tirufate
Yesetehegn endakebrih ante abate',
        updated_at = clock_timestamp()::text
    WHERE import_id = '39817b47-0aa1-48ea-81ae-a737f5dc8709'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
A gift given to glorify you my Father'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Lamesginih yene Geta lamesginih
Liqegnilih yene Geta liqegnilih
Hiywete new zimare tirufate
Yesetehegn endakebrih ante abate';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '39817b47-0aa1-48ea-81ae-a737f5dc8709'::uuid, 'i-will-praise-you', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egiziabiher-siraw-dinik-new-bezemenat-yeshemegele-likesiyuman-tsige-asit ("Egiziabiher Siraw Dinik New//bezemenat Yeshemegele Likesiyuman Tsige Asiteraye Ye Gna Amet Misireta Beal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '461b85de-d2f7-41f6-88ec-f231723cfbe0'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እንደ እግዚአብሔር ኧረ ማን አለ',
        lyrics_transliteration = 'CHORUS
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
Ende Egziabher ኧre man ale',
        updated_at = clock_timestamp()::text
    WHERE import_id = '461b85de-d2f7-41f6-88ec-f231723cfbe0'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '461b85de-d2f7-41f6-88ec-f231723cfbe0'::uuid, 'egiziabiher-siraw-dinik-new-bezemenat-yeshemegele-likesiyuman-tsige-asit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-called-unto-my-dear-lord ("I called unto my Dear Lord")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'db346f44-9a68-44d2-b9ec-b17a4a82dc1b'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
My anxiousness he calmed rescued me from despair'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'db346f44-9a68-44d2-b9ec-b17a4a82dc1b'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
My anxiousness he calmed rescued me from despair'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'db346f44-9a68-44d2-b9ec-b17a4a82dc1b'::uuid, 'i-called-unto-my-dear-lord', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- iyaqem-we-hana ("Iyaqem we Hana")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5a74a65a-41bc-46fc-a4d9-8dc55f7b2f74'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እፁብ ድንቅ የሆንሽ ማርያም አንች ነሽ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Etsub dink yehonish Mariyam anchi nesh (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '5a74a65a-41bc-46fc-a4d9-8dc55f7b2f74'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እፁብ ድንቅ የሆንሽ ማርያም አንች ነሽ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Etsub dink yehonish Mariyam anchi nesh (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5a74a65a-41bc-46fc-a4d9-8dc55f7b2f74'::uuid, 'iyaqem-we-hana', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- in-your-temple-o-lord ("In Your Temple O Lord")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '89e4011a-d77c-4b79-a12e-3753e52b2d5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
From pains of this world I have tired'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Be bete mekedese yasadekegn
Ye afayen tibebn yastemarkegn
Ye lijente amlak wedet ale
Kezi alem hasab kinde zale'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = 'Be bete mekedese yasadekegn
Ye afayen tibebn yastemarkegn
Ye lijente amlak wedet ale
Kezi alem hasab kinde zale',
        updated_at = clock_timestamp()::text
    WHERE import_id = '89e4011a-d77c-4b79-a12e-3753e52b2d5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
From pains of this world I have tired'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Be bete mekedese yasadekegn
Ye afayen tibebn yastemarkegn
Ye lijente amlak wedet ale
Kezi alem hasab kinde zale';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '89e4011a-d77c-4b79-a12e-3753e52b2d5f'::uuid, 'in-your-temple-o-lord', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeteshale-neger ("Yeteshale Neger")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4711d9c2-0054-4357-9f29-652c5ed4bf10'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል',
        lyrics_transliteration = 'CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4711d9c2-0054-4357-9f29-652c5ed4bf10'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4711d9c2-0054-4357-9f29-652c5ed4bf10'::uuid, 'yeteshale-neger', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ke-getaye-feqir-yemileyegn-manew ("KeGetaye Feqir Yemileyegn Manew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cee52039-cb1c-4a50-a1ae-310ddff839eb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
መከር ችግር ስቃይ ወይስ መራቆት ነው/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Meker chigir sik’ay weyis merakot new (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cee52039-cb1c-4a50-a1ae-310ddff839eb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
መከር ችግር ስቃይ ወይስ መራቆት ነው/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Meker chigir sik’ay weyis merakot new (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cee52039-cb1c-4a50-a1ae-310ddff839eb'::uuid, 'ke-getaye-feqir-yemileyegn-manew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lyric-1245 ("Lyric")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '49577483-7c97-4552-a4f0-f15b37fef798'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 1
ከመሬት ላይ ያለች ሁለተኛ ሰማይ
ልጇ ከፍ አረገን ወሰደን ወደላይ
የእግዚአብሔር ጥበቡ የተፃፈብሽ
ማንም የማይነካው ድንቅ መዝገብ ነሽ

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 2
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 3
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 4
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 5
ፀጋንና ክብርን ከተቀበሉት
ባማረ ማጌጫ ከተሸለሙት
የሚስተካከላት የሚያክላት ማነው
ክብሯ ከአድባራቱ ከፍ ከፍ ያለ ነው

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 6
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 7
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 8
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 9
አዝማች (፪)

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 1
Kemeret lay yalech huletegna semay
Lijwa kef aregen weseden wedelay
YeEgziabher t’bebu yetets’afebsh
Manm yemaynekaw dinq mezgeb nesh

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 2
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 3
Melaku sinegrat tiweljalesh bilo
Amna teqebelech alech ende qalu
Ejg yemifera yemineger neber
Yaderew behodwa yesemachw mist’r

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 4
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 5
Ts’eganna kibrn keteqebelut
Bamare magech’a keteshelemut
Yemistekakelat yemiyaklat manew
Kibrwa keadbaratu kef kef yale new

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 6
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 7
Melaku sinegrat tiweljalesh bilo
Amna teqebelech alech ende qalu
Ejg yemifera yemineger neber
Yaderew behodwa yesemachw mist’r

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 8
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 9
CHORUS

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 1
ከመሬት ላይ ያለች ሁለተኛ ሰማይ
ልጇ ከፍ አረገን ወሰደን ወደላይ
የእግዚአብሔር ጥበቡ የተፃፈብሽ
ማንም የማይነካው ድንቅ መዝገብ ነሽ

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 2
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 3
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 4
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 5
ፀጋንና ክብርን ከተቀበሉት
ባማረ ማጌጫ ከተሸለሙት
የሚስተካከላት የሚያክላት ማነው
ክብሯ ከአድባራቱ ከፍ ከፍ ያለ ነው

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 6
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 7
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 8
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 9
አዝማች (፪)

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)',
        lyrics_transliteration = 'CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 1
Kemeret lay yalech huletegna semay
Lijwa kef aregen weseden wedelay
YeEgziabher t’bebu yetets’afebsh
Manm yemaynekaw dinq mezgeb nesh

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 2
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 3
Melaku sinegrat tiweljalesh bilo
Amna teqebelech alech ende qalu
Ejg yemifera yemineger neber
Yaderew behodwa yesemachw mist’r

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 4
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 5
Ts’eganna kibrn keteqebelut
Bamare magech’a keteshelemut
Yemistekakelat yemiyaklat manew
Kibrwa keadbaratu kef kef yale new

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 6
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 7
Melaku sinegrat tiweljalesh bilo
Amna teqebelech alech ende qalu
Ejg yemifera yemineger neber
Yaderew behodwa yesemachw mist’r

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 8
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 9
CHORUS

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '49577483-7c97-4552-a4f0-f15b37fef798'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 1
ከመሬት ላይ ያለች ሁለተኛ ሰማይ
ልጇ ከፍ አረገን ወሰደን ወደላይ
የእግዚአብሔር ጥበቡ የተፃፈብሽ
ማንም የማይነካው ድንቅ መዝገብ ነሽ

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 2
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 3
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 4
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 5
ፀጋንና ክብርን ከተቀበሉት
ባማረ ማጌጫ ከተሸለሙት
የሚስተካከላት የሚያክላት ማነው
ክብሯ ከአድባራቱ ከፍ ከፍ ያለ ነው

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 6
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 7
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 8
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 9
አዝማች (፪)

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '49577483-7c97-4552-a4f0-f15b37fef798'::uuid, 'lyric-1245', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
