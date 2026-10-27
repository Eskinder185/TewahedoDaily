-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 31 OF 32
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
  -- simalee-hin-jiraadhu ("simalee-hin-jiraadhu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9fc81bfc-4a65-4ec3-b480-e10a6cc2340b'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 1
Sii wajjiin jireenyi gaariidha naaf kottuu.
Dinnii koo si arge abdii haa kutaatuu.
Kottuu yaaa haadha koo gara muccaa keetti.
Diinaaf boqquu cabsee akkaan bitamneetti.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 2
Ati naa wajjiin jiraanan ulfinaa argadheeraa.
Wayyaa qulqullummaas uffaadhe dhapherraa.
Ato naa dhunfatteee egaa kannan booda.
Dhipinni koo darbee anoo nan gammadaa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 3
Harkaa koof ijaa koo gara keetti ol kaasee.
Kuno sin faarfaadha immimaan lolaase.
Da''oon koo sumaadh iddoon boqonnaa koo.
Siitoo ana olcheee darbannnaa diinaa koo.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 4
Kanaaf siiin filaadhee haadhaf abbaa korraa.
Eenyuuu addaa naan baasu durbee maariyam irrraa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 1
Sii wajjiin jireenyi gaariidha naaf kottuu.
Dinnii koo si arge abdii haa kutaatuu.
Kottuu yaaa haadha koo gara muccaa keetti.
Diinaaf boqquu cabsee akkaan bitamneetti.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 2
Ati naa wajjiin jiraanan ulfinaa argadheeraa.
Wayyaa qulqullummaas uffaadhe dhapherraa.
Ato naa dhunfatteee egaa kannan booda.
Dhipinni koo darbee anoo nan gammadaa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 3
Harkaa koof ijaa koo gara keetti ol kaasee.
Kuno sin faarfaadha immimaan lolaase.
Da''oon koo sumaadh iddoon boqonnaa koo.
Siitoo ana olcheee darbannnaa diinaa koo.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 4
Kanaaf siiin filaadhee haadhaf abbaa korraa.
Eenyuuu addaa naan baasu durbee maariyam irrraa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 1
Sii wajjiin jireenyi gaariidha naaf kottuu.
Dinnii koo si arge abdii haa kutaatuu.
Kottuu yaaa haadha koo gara muccaa keetti.
Diinaaf boqquu cabsee akkaan bitamneetti.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 2
Ati naa wajjiin jiraanan ulfinaa argadheeraa.
Wayyaa qulqullummaas uffaadhe dhapherraa.
Ato naa dhunfatteee egaa kannan booda.
Dhipinni koo darbee anoo nan gammadaa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 3
Harkaa koof ijaa koo gara keetti ol kaasee.
Kuno sin faarfaadha immimaan lolaase.
Da''oon koo sumaadh iddoon boqonnaa koo.
Siitoo ana olcheee darbannnaa diinaa koo.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 4
Kanaaf siiin filaadhee haadhaf abbaa korraa.
Eenyuuu addaa naan baasu durbee maariyam irrraa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.' THEN lyrics_amharic 
          ELSE 'CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 1
Sii wajjiin jireenyi gaariidha naaf kottuu.
Dinnii koo si arge abdii haa kutaatuu.
Kottuu yaaa haadha koo gara muccaa keetti.
Diinaaf boqquu cabsee akkaan bitamneetti.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 2
Ati naa wajjiin jiraanan ulfinaa argadheeraa.
Wayyaa qulqullummaas uffaadhe dhapherraa.
Ato naa dhunfatteee egaa kannan booda.
Dhipinni koo darbee anoo nan gammadaa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 3
Harkaa koof ijaa koo gara keetti ol kaasee.
Kuno sin faarfaadha immimaan lolaase.
Da''oon koo sumaadh iddoon boqonnaa koo.
Siitoo ana olcheee darbannnaa diinaa koo.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 4
Kanaaf siiin filaadhee haadhaf abbaa korraa.
Eenyuuu addaa naan baasu durbee maariyam irrraa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.' 
        END,
        lyrics_transliteration = 'CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 1
Sii wajjiin jireenyi gaariidha naaf kottuu.
Dinnii koo si arge abdii haa kutaatuu.
Kottuu yaaa haadha koo gara muccaa keetti.
Diinaaf boqquu cabsee akkaan bitamneetti.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 2
Ati naa wajjiin jiraanan ulfinaa argadheeraa.
Wayyaa qulqullummaas uffaadhe dhapherraa.
Ato naa dhunfatteee egaa kannan booda.
Dhipinni koo darbee anoo nan gammadaa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 3
Harkaa koof ijaa koo gara keetti ol kaasee.
Kuno sin faarfaadha immimaan lolaase.
Da''oon koo sumaadh iddoon boqonnaa koo.
Siitoo ana olcheee darbannnaa diinaa koo.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 4
Kanaaf siiin filaadhee haadhaf abbaa korraa.
Eenyuuu addaa naan baasu durbee maariyam irrraa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9fc81bfc-4a65-4ec3-b480-e10a6cc2340b'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 1
Sii wajjiin jireenyi gaariidha naaf kottuu.
Dinnii koo si arge abdii haa kutaatuu.
Kottuu yaaa haadha koo gara muccaa keetti.
Diinaaf boqquu cabsee akkaan bitamneetti.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 2
Ati naa wajjiin jiraanan ulfinaa argadheeraa.
Wayyaa qulqullummaas uffaadhe dhapherraa.
Ato naa dhunfatteee egaa kannan booda.
Dhipinni koo darbee anoo nan gammadaa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 3
Harkaa koof ijaa koo gara keetti ol kaasee.
Kuno sin faarfaadha immimaan lolaase.
Da''oon koo sumaadh iddoon boqonnaa koo.
Siitoo ana olcheee darbannnaa diinaa koo.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.

VERSE 4
Kanaaf siiin filaadhee haadhaf abbaa korraa.
Eenyuuu addaa naan baasu durbee maariyam irrraa.

CHORUS
Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Sii malee jiraadhuu ani yaa haadha koo.
Sii wajjiin midhagaa anaaf jireenyi koo.
Waan hundumtuu gaarii anaaf ta''uu diidee.
Waaniin hawwee turees naa fuulduraa badee.
Sii wajjiin jireenyi gaariidha naaf kottuu.
Dinnii koo si arge abdii haa kutaatuu.
Kottuu yaaa haadha koo gara muccaa keetti.
Diinaaf boqquu cabsee akkaan bitamneetti.
Ati naa wajjiin jiraanan ulfinaa argadheeraa.
Wayyaa qulqullummaas uffaadhe dhapherraa.
Ato naa dhunfatteee egaa kannan booda.
Dhipinni koo darbee anoo nan gammadaa.
Harkaa koof ijaa koo gara keetti ol kaasee.
Kuno sin faarfaadha immimaan lolaase.
Da''oon koo sumaadh iddoon boqonnaa koo.
Siitoo ana olcheee darbannnaa diinaa koo.
Kanaaf siiin filaadhee haadhaf abbaa korraa.
Eenyuuu addaa naan baasu durbee maariyam irrraa.'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9fc81bfc-4a65-4ec3-b480-e10a6cc2340b'::uuid, 'simalee-hin-jiraadhu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-cross-is-the-light ("መስቀል ብርሃን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '15213e4f-e189-434d-beb1-b423096ee93c'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 1
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 2
Mesqel birhan lekulu alem
Meserete betekrstyan
Mesqel birhan lekulu alem
Meserete betekrstyan

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 3
Wehabe selam medhanealem
Mesqel medhn le-ele neamn
Wehabe selam medhanealem
Mesqel medhn le-ele neamn

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 4
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 5
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 1
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 2
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 3
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 4
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 5
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 1
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 2
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 3
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 4
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 5
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church' THEN lyrics_amharic 
          ELSE 'CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 1
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 2
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 3
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 4
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 5
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church' 
        END,
        lyrics_transliteration = 'CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 1
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 2
Mesqel birhan lekulu alem
Meserete betekrstyan
Mesqel birhan lekulu alem
Meserete betekrstyan

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 3
Wehabe selam medhanealem
Mesqel medhn le-ele neamn
Wehabe selam medhanealem
Mesqel medhn le-ele neamn

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 4
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 5
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church',
        updated_at = clock_timestamp()::text
    WHERE import_id = '15213e4f-e189-434d-beb1-b423096ee93c'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 1
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 2
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 3
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 4
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church

VERSE 5
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe

CHORUS
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church'
        OR lyrics_amharic IS NOT DISTINCT FROM 'The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን
መስቀል ብርሃን ለኩሉ አለም
መሰረተ ቤተክርስትያን
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን
ወሃበ ሰላም መድኃኔአለም
መስቀል መድህን ለ-እለ ነአምን
The Cross is the light for the entire world
The foundation of our Holy Church
The Cross is the light for the entire world
The foundation of our Holy Church
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe
He''s the giver of peace our Savior and our King
The Cross is healing for those who do believe'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '15213e4f-e189-434d-beb1-b423096ee93c'::uuid, 'the-cross-is-the-light', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ascend-our-supplication ("ascend-our-supplication")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5b259785-3de1-40dd-9ca9-2cb4edd294ad'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 1
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 2
You care to watch over us
So that we won''t stumble
You are truly humble
For our body you contend

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 3
With the devil
Even then who dares
Not to speak evil
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 4
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 5
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
You hold a golden censor

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 6
With much and pure incense
You offer it at the altar
With the prayer of saints
That time remember to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 7
Raise our prayer
Remind Him who won''t
Forget the sinner
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 8
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 9
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
If we are in a dreadful den

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 10
Where life has tossed us down
If Satan throws at us his snare
Walks like a roaring lion
There''s no one loyal to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 11
Us concerning this
Except the helper
Saint Michael our Prince
Pray for us the

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 12
Angel of peace
Ascend our supplication
To the heavenly throne
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 13
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 14
The leader of heavenly hosts
He rides the wind
Where thunders fade,
A flame in heaven''s host

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 15
His sword ignites
Where darkness breaks
Marked by the Holy Cross
When our faith is weak,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 16
He hears our faintest cry
Who is sent by God,
With mercy in his eye
Saint Michael

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 17
The angel of light
Tewekef Tselotene
Weste Nuha Semay
Tewekef ts’elotene

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 18
Wiste nuha semay
Tselotene
Weste Nuha Semay
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 19
Senayi Lique Melaekt
Weseeletene kesa meaza
Senay liqe melaekt
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 20
Senayi Lique Melaekt

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 1
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 2
You care to watch over us
So that we won''t stumble
You are truly humble
For our body you contend

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 3
With the devil
Even then who dares
Not to speak evil
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 4
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 5
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
You hold a golden censor

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 6
With much and pure incense
You offer it at the altar
With the prayer of saints
That time remember to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 7
Raise our prayer
Remind Him who won''t
Forget the sinner
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 8
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 9
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
If we are in a dreadful den

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 10
Where life has tossed us down
If Satan throws at us his snare
Walks like a roaring lion
There''s no one loyal to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 11
Us concerning this
Except the helper
Saint Michael our Prince
Pray for us the

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 12
Angel of peace
Ascend our supplication
To the heavenly throne
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 13
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 14
The leader of heavenly hosts
He rides the wind
Where thunders fade,
A flame in heaven''s host

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 15
His sword ignites
Where darkness breaks
Marked by the Holy Cross
When our faith is weak,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 16
He hears our faintest cry
Who is sent by God,
With mercy in his eye
Saint Michael

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 17
The angel of light
Tewekef Tselotene
Weste Nuha Semay
ተወከፍ ጸሎተነ

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 18
ውስተ ኑኃ ሰማይ
Tselotene
Weste Nuha Semay
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 19
Senayi Lique Melaekt
ወሰዕለተነ ከሣ መዐዛ
ሰናይ ሊቀ መላእክት
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 20
Senayi Lique Melaekt

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 1
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 2
You care to watch over us
So that we won''t stumble
You are truly humble
For our body you contend

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 3
With the devil
Even then who dares
Not to speak evil
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 4
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 5
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
You hold a golden censor

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 6
With much and pure incense
You offer it at the altar
With the prayer of saints
That time remember to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 7
Raise our prayer
Remind Him who won''t
Forget the sinner
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 8
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 9
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
If we are in a dreadful den

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 10
Where life has tossed us down
If Satan throws at us his snare
Walks like a roaring lion
There''s no one loyal to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 11
Us concerning this
Except the helper
Saint Michael our Prince
Pray for us the

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 12
Angel of peace
Ascend our supplication
To the heavenly throne
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 13
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 14
The leader of heavenly hosts
He rides the wind
Where thunders fade,
A flame in heaven''s host

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 15
His sword ignites
Where darkness breaks
Marked by the Holy Cross
When our faith is weak,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 16
He hears our faintest cry
Who is sent by God,
With mercy in his eye
Saint Michael

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 17
The angel of light
Tewekef Tselotene
Weste Nuha Semay
ተወከፍ ጸሎተነ

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 18
ውስተ ኑኃ ሰማይ
Tselotene
Weste Nuha Semay
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 19
Senayi Lique Melaekt
ወሰዕለተነ ከሣ መዐዛ
ሰናይ ሊቀ መላእክት
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 20
Senayi Lique Melaekt

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne' THEN lyrics_amharic 
          ELSE 'CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 1
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 2
You care to watch over us
So that we won''t stumble
You are truly humble
For our body you contend

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 3
With the devil
Even then who dares
Not to speak evil
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 4
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 5
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
You hold a golden censor

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 6
With much and pure incense
You offer it at the altar
With the prayer of saints
That time remember to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 7
Raise our prayer
Remind Him who won''t
Forget the sinner
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 8
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 9
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
If we are in a dreadful den

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 10
Where life has tossed us down
If Satan throws at us his snare
Walks like a roaring lion
There''s no one loyal to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 11
Us concerning this
Except the helper
Saint Michael our Prince
Pray for us the

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 12
Angel of peace
Ascend our supplication
To the heavenly throne
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 13
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 14
The leader of heavenly hosts
He rides the wind
Where thunders fade,
A flame in heaven''s host

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 15
His sword ignites
Where darkness breaks
Marked by the Holy Cross
When our faith is weak,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 16
He hears our faintest cry
Who is sent by God,
With mercy in his eye
Saint Michael

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 17
The angel of light
Tewekef Tselotene
Weste Nuha Semay
ተወከፍ ጸሎተነ

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 18
ውስተ ኑኃ ሰማይ
Tselotene
Weste Nuha Semay
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 19
Senayi Lique Melaekt
ወሰዕለተነ ከሣ መዐዛ
ሰናይ ሊቀ መላእክት
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 20
Senayi Lique Melaekt

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne' 
        END,
        lyrics_transliteration = 'CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 1
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 2
You care to watch over us
So that we won''t stumble
You are truly humble
For our body you contend

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 3
With the devil
Even then who dares
Not to speak evil
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 4
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 5
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
You hold a golden censor

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 6
With much and pure incense
You offer it at the altar
With the prayer of saints
That time remember to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 7
Raise our prayer
Remind Him who won''t
Forget the sinner
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 8
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 9
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
If we are in a dreadful den

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 10
Where life has tossed us down
If Satan throws at us his snare
Walks like a roaring lion
There''s no one loyal to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 11
Us concerning this
Except the helper
Saint Michael our Prince
Pray for us the

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 12
Angel of peace
Ascend our supplication
To the heavenly throne
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 13
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 14
The leader of heavenly hosts
He rides the wind
Where thunders fade,
A flame in heaven''s host

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 15
His sword ignites
Where darkness breaks
Marked by the Holy Cross
When our faith is weak,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 16
He hears our faintest cry
Who is sent by God,
With mercy in his eye
Saint Michael

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 17
The angel of light
Tewekef Tselotene
Weste Nuha Semay
Tewekef ts’elotene

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 18
Wiste nuha semay
Tselotene
Weste Nuha Semay
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 19
Senayi Lique Melaekt
Weseeletene kesa meaza
Senay liqe melaekt
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 20
Senayi Lique Melaekt

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5b259785-3de1-40dd-9ca9-2cb4edd294ad'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 1
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 2
You care to watch over us
So that we won''t stumble
You are truly humble
For our body you contend

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 3
With the devil
Even then who dares
Not to speak evil
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 4
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 5
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
You hold a golden censor

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 6
With much and pure incense
You offer it at the altar
With the prayer of saints
That time remember to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 7
Raise our prayer
Remind Him who won''t
Forget the sinner
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 8
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 9
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
If we are in a dreadful den

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 10
Where life has tossed us down
If Satan throws at us his snare
Walks like a roaring lion
There''s no one loyal to

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 11
Us concerning this
Except the helper
Saint Michael our Prince
Pray for us the

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 12
Angel of peace
Ascend our supplication
To the heavenly throne
Ascend our supplication

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 13
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 14
The leader of heavenly hosts
He rides the wind
Where thunders fade,
A flame in heaven''s host

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 15
His sword ignites
Where darkness breaks
Marked by the Holy Cross
When our faith is weak,

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 16
He hears our faintest cry
Who is sent by God,
With mercy in his eye
Saint Michael

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 17
The angel of light
Tewekef Tselotene
Weste Nuha Semay
ተወከፍ ጸሎተነ

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 18
ውስተ ኑኃ ሰማይ
Tselotene
Weste Nuha Semay
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 19
Senayi Lique Melaekt
ወሰዕለተነ ከሣ መዐዛ
ሰናይ ሊቀ መላእክት
Weseelletene Keme Meaza

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne

VERSE 20
Senayi Lique Melaekt

CHORUS
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
You care to watch over us
So that we won''t stumble
You are truly humble
For our body you contend
With the devil
Even then who dares
Not to speak evil
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
You hold a golden censor
With much and pure incense
You offer it at the altar
With the prayer of saints
That time remember to
Raise our prayer
Remind Him who won''t
Forget the sinner
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
If we are in a dreadful den
Where life has tossed us down
If Satan throws at us his snare
Walks like a roaring lion
There''s no one loyal to
Us concerning this
Except the helper
Saint Michael our Prince
Pray for us the
Angel of peace
Ascend our supplication
To the heavenly throne
Ascend our supplication
To the heavenly throne
As a sweet-scented pure incense for all,
The leader of heavenly hosts
As a sweet-scented pure incense for all,
The leader of heavenly hosts
He rides the wind
Where thunders fade,
A flame in heaven''s host
His sword ignites
Where darkness breaks
Marked by the Holy Cross
When our faith is weak,
He hears our faintest cry
Who is sent by God,
With mercy in his eye
Saint Michael
The angel of light
Tewekef Tselotene
Weste Nuha Semay
ተወከፍ ጸሎተነ
ውስተ ኑኃ ሰማይ
Tselotene
Weste Nuha Semay
Weseelletene Keme Meaza
Senayi Lique Melaekt
ወሰዕለተነ ከሣ መዐዛ
ሰናይ ሊቀ መላእክት
Weseelletene Keme Meaza
Senayi Lique Melaekt'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5b259785-3de1-40dd-9ca9-2cb4edd294ad'::uuid, 'ascend-our-supplication', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- come-all-and-then-marvel ("ኑ ተመልከቱልኝ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '70d10f46-5771-49ed-b6c7-03410b5c1062'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 1
Their works found true and fair in front of their maker
Persistently walked in holy matrimony
The mother of our Lord they birthed Virgin Mary
Day and night he would pray the priest Zacharias

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 2
Pleaded Elizabeth through all her barriers
With the talents of God even in their old state
He gave them the honor of having John the Saint
Holy Tsegazeab and Egziharya

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 3
Benevolently wed icons of their era
Through their seed they begot Saint Teklehaymnot
Through the day and the night prayer they both devote
Nu temelketulign ye Amanualin sira

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 4
Mushirochu honu Abraham we Sara

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 1
Their works found true and fair in front of their maker
Persistently walked in holy matrimony
The mother of our Lord they birthed Virgin Mary
Day and night he would pray the priest Zacharias

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 2
Pleaded Elizabeth through all her barriers
With the talents of God even in their old state
He gave them the honor of having John the Saint
Holy Tsegazeab and Egziharya

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 3
Benevolently wed icons of their era
Through their seed they begot Saint Teklehaymnot
Through the day and the night prayer they both devote
Nu temelketulign ye Amanualin sira

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 4
Mushirochu honu Abraham we Sara

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 1
Their works found true and fair in front of their maker
Persistently walked in holy matrimony
The mother of our Lord they birthed Virgin Mary
Day and night he would pray the priest Zacharias

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 2
Pleaded Elizabeth through all her barriers
With the talents of God even in their old state
He gave them the honor of having John the Saint
Holy Tsegazeab and Egziharya

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 3
Benevolently wed icons of their era
Through their seed they begot Saint Teklehaymnot
Through the day and the night prayer they both devote
Nu temelketulign ye Amanualin sira

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 4
Mushirochu honu Abraham we Sara

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer' THEN lyrics_amharic 
          ELSE 'CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 1
Their works found true and fair in front of their maker
Persistently walked in holy matrimony
The mother of our Lord they birthed Virgin Mary
Day and night he would pray the priest Zacharias

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 2
Pleaded Elizabeth through all her barriers
With the talents of God even in their old state
He gave them the honor of having John the Saint
Holy Tsegazeab and Egziharya

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 3
Benevolently wed icons of their era
Through their seed they begot Saint Teklehaymnot
Through the day and the night prayer they both devote
Nu temelketulign ye Amanualin sira

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 4
Mushirochu honu Abraham we Sara

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer' 
        END,
        lyrics_transliteration = 'CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 1
Their works found true and fair in front of their maker
Persistently walked in holy matrimony
The mother of our Lord they birthed Virgin Mary
Day and night he would pray the priest Zacharias

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 2
Pleaded Elizabeth through all her barriers
With the talents of God even in their old state
He gave them the honor of having John the Saint
Holy Tsegazeab and Egziharya

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 3
Benevolently wed icons of their era
Through their seed they begot Saint Teklehaymnot
Through the day and the night prayer they both devote
Nu temelketulign ye Amanualin sira

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 4
Mushirochu honu Abraham we Sara

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer',
        updated_at = clock_timestamp()::text
    WHERE import_id = '70d10f46-5771-49ed-b6c7-03410b5c1062'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 1
Their works found true and fair in front of their maker
Persistently walked in holy matrimony
The mother of our Lord they birthed Virgin Mary
Day and night he would pray the priest Zacharias

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 2
Pleaded Elizabeth through all her barriers
With the talents of God even in their old state
He gave them the honor of having John the Saint
Holy Tsegazeab and Egziharya

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 3
Benevolently wed icons of their era
Through their seed they begot Saint Teklehaymnot
Through the day and the night prayer they both devote
Nu temelketulign ye Amanualin sira

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer

VERSE 4
Mushirochu honu Abraham we Sara

CHORUS
At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer'
        OR lyrics_amharic IS NOT DISTINCT FROM 'At the works of our Lord come all and then marvel
The deeds of our God of our Emmanuel
Sara and Abraham became their example
Hannah and Joachim were made strong through prayer
Their works found true and fair in front of their maker
Persistently walked in holy matrimony
The mother of our Lord they birthed Virgin Mary
Day and night he would pray the priest Zacharias
Pleaded Elizabeth through all her barriers
With the talents of God even in their old state
He gave them the honor of having John the Saint
Holy Tsegazeab and Egziharya
Benevolently wed icons of their era
Through their seed they begot Saint Teklehaymnot
Through the day and the night prayer they both devote
Nu temelketulign ye Amanualin sira
Mushirochu honu Abraham we Sara'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '70d10f46-5771-49ed-b6c7-03410b5c1062'::uuid, 'come-all-and-then-marvel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cheru-hoy-ena-nu-bebirihanu-temelalesu-yebole-medihanealem-felege-yorida ("ቸሩ ሆይ እና ኑ በብርሃኑ ተመላለሱ የቦሌ መድኃኔዓለም ፈለገ ዮርዳኖስ ሰ/ት/ቤት የሱባኤ ጉባኤ ተመራቂ ተማሪዎች")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bfff096c-48d7-4b20-ba94-893dd477a721'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 1
A.z //
Cheru hoy leayne siwr meri
Cheru hoy mirkuz memekiya neh
Cheru hoy anten yemimesl

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 2
Cheru hoy minm neger yelem
Cheru hoy mihretna fiqrh
Cheru hoy wesen weder yelew
Cheru hoy sanwedh wedeኽn

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 3
Cheru hoy felgeh t’erahn
A.z //
Cheru hoy semteh edalsemah
Cheru hoy ayteh endalayeh

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 4
Cheru hoy hulun talfewaleh
Cheru hoy fiqrawi abat neh
Cheru hoy Amanuel Geta
Cheru hoy cheru fet’ariyachn

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 5
Cheru hoy wiletah bizu new
Cheru hoy leegna yewalkln
A.z //
Cheru hoy bekebtoch maderiya

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 6
Cheru hoy beziyach tinsh girgm
Cheru hoy teweldo adanen
Cheru hoy Geta Medhanealem
Cheru hoy ell belu sewoch

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 7
Cheru hoy and lay zemeru
Cheru hoy sibhat leEgziabher
Cheru hoy bearyam belu

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 1
አ.ዝ //
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 2
ቸሩ ሆይ ምንም ነገር የለም
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደኽን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 3
ቸሩ ሆይ ፈልገህ ጠራህን
አ.ዝ //
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 4
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 5
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን
አ.ዝ //
ቸሩ ሆይ በከብቶች ማደሪያ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 6
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም
ቸሩ ሆይ እልል በሉ ሰዎች

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 7
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሃት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 1
አ.ዝ //
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 2
ቸሩ ሆይ ምንም ነገር የለም
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደኽን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 3
ቸሩ ሆይ ፈልገህ ጠራህን
አ.ዝ //
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 4
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 5
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን
አ.ዝ //
ቸሩ ሆይ በከብቶች ማደሪያ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 6
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም
ቸሩ ሆይ እልል በሉ ሰዎች

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 7
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሃት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና' THEN lyrics_amharic 
          ELSE 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 1
አ.ዝ //
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 2
ቸሩ ሆይ ምንም ነገር የለም
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደኽን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 3
ቸሩ ሆይ ፈልገህ ጠራህን
አ.ዝ //
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 4
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 5
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን
አ.ዝ //
ቸሩ ሆይ በከብቶች ማደሪያ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 6
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም
ቸሩ ሆይ እልል በሉ ሰዎች

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 7
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሃት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና' 
        END,
        lyrics_transliteration = 'CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 1
A.z //
Cheru hoy leayne siwr meri
Cheru hoy mirkuz memekiya neh
Cheru hoy anten yemimesl

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 2
Cheru hoy minm neger yelem
Cheru hoy mihretna fiqrh
Cheru hoy wesen weder yelew
Cheru hoy sanwedh wedeኽn

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 3
Cheru hoy felgeh t’erahn
A.z //
Cheru hoy semteh edalsemah
Cheru hoy ayteh endalayeh

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 4
Cheru hoy hulun talfewaleh
Cheru hoy fiqrawi abat neh
Cheru hoy Amanuel Geta
Cheru hoy cheru fet’ariyachn

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 5
Cheru hoy wiletah bizu new
Cheru hoy leegna yewalkln
A.z //
Cheru hoy bekebtoch maderiya

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 6
Cheru hoy beziyach tinsh girgm
Cheru hoy teweldo adanen
Cheru hoy Geta Medhanealem
Cheru hoy ell belu sewoch

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 7
Cheru hoy and lay zemeru
Cheru hoy sibhat leEgziabher
Cheru hoy bearyam belu

CHORUS
Cheru hoy cheru hoy nana (2)
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bfff096c-48d7-4b20-ba94-893dd477a721'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 1
አ.ዝ //
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 2
ቸሩ ሆይ ምንም ነገር የለም
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደኽን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 3
ቸሩ ሆይ ፈልገህ ጠራህን
አ.ዝ //
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 4
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 5
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን
አ.ዝ //
ቸሩ ሆይ በከብቶች ማደሪያ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 6
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም
ቸሩ ሆይ እልል በሉ ሰዎች

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 7
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሃት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ቸሩ ሆይ ቸሩ ሆይ ናና /2/
ቸሩ ሆይ አማኑኤል ናና
የእሥራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና
አ.ዝ---------------------------//
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል
ቸሩ ሆይ ምንም ነገር የለም
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደኽን
ቸሩ ሆይ ፈልገህ ጠራህን
አ.ዝ---------------------------//
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን
አ.ዝ---------------------------//
ቸሩ ሆይ በከብቶች ማደሪያ
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም
ቸሩ ሆይ እልል በሉ ሰዎች
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሃት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bfff096c-48d7-4b20-ba94-893dd477a721'::uuid, 'cheru-hoy-ena-nu-bebirihanu-temelalesu-yebole-medihanealem-felege-yorida', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- likane-melaekt-by-the-four-deacons ("ሊቃነ መላእክት በአራቱ ዲያቆናት")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e58de43a-9d88-46ea-83fe-197d8d1002af'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 1
Silt’anat mekwannt arbab menabrt
Liqanat melaekt neged aelafat
Endeye ts’otachhu awt’un ket’fat
Mebarqtn beeju yizo yemilak

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 2
Lijun t’lo ayawqm Mikael melak
Yemotn debdabe yemilewt’ew
Mihret genzebu new lemilemnew
Benegodgwad lay new meremamejaw

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 3
Aywesnew t’lqu siberebrew
Yesemay serawit newna azazhachew
Kenefas yiqedmal bahrun siqezfew
Wet’atochn liyadn Gebriel felgo

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 4
Nebelbal esatun wiha endihon adrgo
Sidraqna misaq endihu abdinago
Keetonu wet’u nebelbalun barko
Yigermal dinq new afet’at’erachew

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 5
Hul gize misgana qidase migbachew
Egnan lemet’ebeq dikam yelebachew
Zewetr yayunal ende siratachew

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 1
ስልጣናት መኳንንት አርባብ መናብርት
ሊቃናት መላእክት ነገድ አእላፋት
እንደየ ፆታችሁ አውጡን ከጥፋት
መባርቅትን በእጁ ይዞ የሚላክ

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 2
ልጁን ጥሎ አያውቅም ሚካኤል መልአክ
የሞትን ደብዳቤ የሚለውጠው
ምህረት ገንዘቡ ነው ለሚለምነው
በነጎድጓድ ላይ ነው መረማመጃው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 3
አይወስነው ጥልቁ ሲበረብረው
የሰማይ ሰራዊት ነውና አዛዣቸው
ከነፋስ ይቀድማል ባህሩን ሲቀዝፈው
ወጣቶችን ሊያድን ገብርኤል ፈልጎ

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 4
ነበልባል እሳቱን ውሃ እንዲሆን አድርጎ
ሲድራቅና ሚሳቅ እንዲሁ አብዲናጎ
ከእቶኑ ወጡ ነበልባሉን ባርኮ
ይገርማል ድንቅ ነው አፈጣጠራቸው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 5
ሁል ጊዜ ምስጋና ቅዳሴ ምግባቸው
እኛን ለመጠበቅ ድካም የለባቸው
ዘወትር ያዩናል እንደ ስርዓታቸው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 1
ስልጣናት መኳንንት አርባብ መናብርት
ሊቃናት መላእክት ነገድ አእላፋት
እንደየ ፆታችሁ አውጡን ከጥፋት
መባርቅትን በእጁ ይዞ የሚላክ

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 2
ልጁን ጥሎ አያውቅም ሚካኤል መልአክ
የሞትን ደብዳቤ የሚለውጠው
ምህረት ገንዘቡ ነው ለሚለምነው
በነጎድጓድ ላይ ነው መረማመጃው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 3
አይወስነው ጥልቁ ሲበረብረው
የሰማይ ሰራዊት ነውና አዛዣቸው
ከነፋስ ይቀድማል ባህሩን ሲቀዝፈው
ወጣቶችን ሊያድን ገብርኤል ፈልጎ

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 4
ነበልባል እሳቱን ውሃ እንዲሆን አድርጎ
ሲድራቅና ሚሳቅ እንዲሁ አብዲናጎ
ከእቶኑ ወጡ ነበልባሉን ባርኮ
ይገርማል ድንቅ ነው አፈጣጠራቸው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 5
ሁል ጊዜ ምስጋና ቅዳሴ ምግባቸው
እኛን ለመጠበቅ ድካም የለባቸው
ዘወትር ያዩናል እንደ ስርዓታቸው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት' THEN lyrics_amharic 
          ELSE 'CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 1
ስልጣናት መኳንንት አርባብ መናብርት
ሊቃናት መላእክት ነገድ አእላፋት
እንደየ ፆታችሁ አውጡን ከጥፋት
መባርቅትን በእጁ ይዞ የሚላክ

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 2
ልጁን ጥሎ አያውቅም ሚካኤል መልአክ
የሞትን ደብዳቤ የሚለውጠው
ምህረት ገንዘቡ ነው ለሚለምነው
በነጎድጓድ ላይ ነው መረማመጃው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 3
አይወስነው ጥልቁ ሲበረብረው
የሰማይ ሰራዊት ነውና አዛዣቸው
ከነፋስ ይቀድማል ባህሩን ሲቀዝፈው
ወጣቶችን ሊያድን ገብርኤል ፈልጎ

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 4
ነበልባል እሳቱን ውሃ እንዲሆን አድርጎ
ሲድራቅና ሚሳቅ እንዲሁ አብዲናጎ
ከእቶኑ ወጡ ነበልባሉን ባርኮ
ይገርማል ድንቅ ነው አፈጣጠራቸው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 5
ሁል ጊዜ ምስጋና ቅዳሴ ምግባቸው
እኛን ለመጠበቅ ድካም የለባቸው
ዘወትር ያዩናል እንደ ስርዓታቸው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት' 
        END,
        lyrics_transliteration = 'CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 1
Silt’anat mekwannt arbab menabrt
Liqanat melaekt neged aelafat
Endeye ts’otachhu awt’un ket’fat
Mebarqtn beeju yizo yemilak

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 2
Lijun t’lo ayawqm Mikael melak
Yemotn debdabe yemilewt’ew
Mihret genzebu new lemilemnew
Benegodgwad lay new meremamejaw

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 3
Aywesnew t’lqu siberebrew
Yesemay serawit newna azazhachew
Kenefas yiqedmal bahrun siqezfew
Wet’atochn liyadn Gebriel felgo

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 4
Nebelbal esatun wiha endihon adrgo
Sidraqna misaq endihu abdinago
Keetonu wet’u nebelbalun barko
Yigermal dinq new afet’at’erachew

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat

VERSE 5
Hul gize misgana qidase migbachew
Egnan lemet’ebeq dikam yelebachew
Zewetr yayunal ende siratachew

CHORUS
Liqane melaekt 2
Amlakn beft’net yemitazezulet
Amlakn befrhat yemitazezulet
Agaezt kirubel surafel heylat',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e58de43a-9d88-46ea-83fe-197d8d1002af'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 1
ስልጣናት መኳንንት አርባብ መናብርት
ሊቃናት መላእክት ነገድ አእላፋት
እንደየ ፆታችሁ አውጡን ከጥፋት
መባርቅትን በእጁ ይዞ የሚላክ

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 2
ልጁን ጥሎ አያውቅም ሚካኤል መልአክ
የሞትን ደብዳቤ የሚለውጠው
ምህረት ገንዘቡ ነው ለሚለምነው
በነጎድጓድ ላይ ነው መረማመጃው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 3
አይወስነው ጥልቁ ሲበረብረው
የሰማይ ሰራዊት ነውና አዛዣቸው
ከነፋስ ይቀድማል ባህሩን ሲቀዝፈው
ወጣቶችን ሊያድን ገብርኤል ፈልጎ

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 4
ነበልባል እሳቱን ውሃ እንዲሆን አድርጎ
ሲድራቅና ሚሳቅ እንዲሁ አብዲናጎ
ከእቶኑ ወጡ ነበልባሉን ባርኮ
ይገርማል ድንቅ ነው አፈጣጠራቸው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት

VERSE 5
ሁል ጊዜ ምስጋና ቅዳሴ ምግባቸው
እኛን ለመጠበቅ ድካም የለባቸው
ዘወትር ያዩናል እንደ ስርዓታቸው

CHORUS
ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ሊቃነ መላእክት 2
አምላክን በፍጥነት የሚታዘዙለት
አምላክን በፍርሃት የሚታዘዙለት
አጋእዝት ኪሩቤል ሡራፌል ሀይላት
ስልጣናት መኳንንት አርባብ መናብርት
ሊቃናት መላእክት ነገድ አእላፋት
እንደየ ፆታችሁ አውጡን ከጥፋት
መባርቅትን በእጁ ይዞ የሚላክ
ልጁን ጥሎ አያውቅም ሚካኤል መልአክ
የሞትን ደብዳቤ የሚለውጠው
ምህረት ገንዘቡ ነው ለሚለምነው
በነጎድጓድ ላይ ነው መረማመጃው
አይወስነው ጥልቁ ሲበረብረው
የሰማይ ሰራዊት ነውና አዛዣቸው
ከነፋስ ይቀድማል ባህሩን ሲቀዝፈው
ወጣቶችን ሊያድን ገብርኤል ፈልጎ
ነበልባል እሳቱን ውሃ እንዲሆን አድርጎ
ሲድራቅና ሚሳቅ እንዲሁ አብዲናጎ
ከእቶኑ ወጡ ነበልባሉን ባርኮ
ይገርማል ድንቅ ነው አፈጣጠራቸው
ሁል ጊዜ ምስጋና ቅዳሴ ምግባቸው
እኛን ለመጠበቅ ድካም የለባቸው
ዘወትር ያዩናል እንደ ስርዓታቸው'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e58de43a-9d88-46ea-83fe-197d8d1002af'::uuid, 'likane-melaekt-by-the-four-deacons', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- illuminating-are-the-works-of-emmanuel ("ደመቀ አበራልን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '072337ce-941f-4321-bc5a-417578b628d7'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom' THEN lyrics_amharic 
          ELSE 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom' 
        END,
        lyrics_transliteration = 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom',
        updated_at = clock_timestamp()::text
    WHERE import_id = '072337ce-941f-4321-bc5a-417578b628d7'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '072337ce-941f-4321-bc5a-417578b628d7'::uuid, 'illuminating-are-the-works-of-emmanuel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- like-the-fig-tree ("አጥቷል ጎሎበታል")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '567e2bcc-6270-4aca-870c-c1b39af727dc'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
At’twal golobetal bileኽ satnqegn
Atual golobetal bileh satinikegn
Leziኽ yadereskegn Getaye ene man negn
Lezi yadereskegn getaye ene manegn

VERSE 1
Yimolal ayqerm beante sheleqoye
Yimolal aykerim bante shelekoye
T’ebqaleኹna qenኽn Getaye
Tebkalehuna kenihin getaye

CHORUS
At’twal golobetal bileኽ satnqegn
Atual golobetal bileh satinikegn
Leziኽ yadereskegn Getaye ene man negn
Lezi yadereskegn getaye ene manegn

VERSE 2
Like the fig tree i’m bare, I have no fruit to spare (cf Luke 13:6-9)
Who am I that you, Lord, have kept me in Your care
I know my cup will be, filled when You come my way
I will wait faithfully until that wondrous day

CHORUS
At’twal golobetal bileኽ satnqegn
Atual golobetal bileh satinikegn
Leziኽ yadereskegn Getaye ene man negn
Lezi yadereskegn getaye ene manegn'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn

VERSE 1
ይሞላል አይቀርም በአንተ ሸለቆዬ
yimolal aykerim bante shelekoye
ጠብቃለኹና ቀንኽን ጌታዬ
tebkalehuna kenihin getaye

CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn

VERSE 2
Like the fig tree i’m bare, I have no fruit to spare (cf Luke 13:6-9)
who am I that you, Lord, have kept me in Your care
I know my cup will be, filled when You come my way
I will wait faithfully until that wondrous day

CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn

VERSE 1
ይሞላል አይቀርም በአንተ ሸለቆዬ
yimolal aykerim bante shelekoye
ጠብቃለኹና ቀንኽን ጌታዬ
tebkalehuna kenihin getaye

CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn

VERSE 2
Like the fig tree i’m bare, I have no fruit to spare (cf Luke 13:6-9)
who am I that you, Lord, have kept me in Your care
I know my cup will be, filled when You come my way
I will wait faithfully until that wondrous day

CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn' THEN lyrics_amharic 
          ELSE 'CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn

VERSE 1
ይሞላል አይቀርም በአንተ ሸለቆዬ
yimolal aykerim bante shelekoye
ጠብቃለኹና ቀንኽን ጌታዬ
tebkalehuna kenihin getaye

CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn

VERSE 2
Like the fig tree i’m bare, I have no fruit to spare (cf Luke 13:6-9)
who am I that you, Lord, have kept me in Your care
I know my cup will be, filled when You come my way
I will wait faithfully until that wondrous day

CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn' 
        END,
        lyrics_transliteration = 'CHORUS
At’twal golobetal bileኽ satnqegn
Atual golobetal bileh satinikegn
Leziኽ yadereskegn Getaye ene man negn
Lezi yadereskegn getaye ene manegn

VERSE 1
Yimolal ayqerm beante sheleqoye
Yimolal aykerim bante shelekoye
T’ebqaleኹna qenኽn Getaye
Tebkalehuna kenihin getaye

CHORUS
At’twal golobetal bileኽ satnqegn
Atual golobetal bileh satinikegn
Leziኽ yadereskegn Getaye ene man negn
Lezi yadereskegn getaye ene manegn

VERSE 2
Like the fig tree i’m bare, I have no fruit to spare (cf Luke 13:6-9)
Who am I that you, Lord, have kept me in Your care
I know my cup will be, filled when You come my way
I will wait faithfully until that wondrous day

CHORUS
At’twal golobetal bileኽ satnqegn
Atual golobetal bileh satinikegn
Leziኽ yadereskegn Getaye ene man negn
Lezi yadereskegn getaye ene manegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '567e2bcc-6270-4aca-870c-c1b39af727dc'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn

VERSE 1
ይሞላል አይቀርም በአንተ ሸለቆዬ
yimolal aykerim bante shelekoye
ጠብቃለኹና ቀንኽን ጌታዬ
tebkalehuna kenihin getaye

CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn

VERSE 2
Like the fig tree i’m bare, I have no fruit to spare (cf Luke 13:6-9)
who am I that you, Lord, have kept me in Your care
I know my cup will be, filled when You come my way
I will wait faithfully until that wondrous day

CHORUS
አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn'
        OR lyrics_amharic IS NOT DISTINCT FROM 'አጥቷል ጎሎበታል ብለኽ ሳትንቀኝ
Atual golobetal bileh satinikegn
ለዚኽ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
lezi yadereskegn getaye ene manegn
ይሞላል አይቀርም በአንተ ሸለቆዬ
yimolal aykerim bante shelekoye
ጠብቃለኹና ቀንኽን ጌታዬ
tebkalehuna kenihin getaye
Like the fig tree i’m bare, I have no fruit to spare (cf Luke 13:6-9)
who am I that you, Lord, have kept me in Your care
I know my cup will be, filled when You come my way
I will wait faithfully until that wondrous day'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '567e2bcc-6270-4aca-870c-c1b39af727dc'::uuid, 'like-the-fig-tree', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nana-yemisgana-geta-hosanna ("ናና የምስጋና ጌታ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '610eaf12-3f27-4d0e-92fa-c1892ef96392'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi

VERSE 1
Selamsh tawjwal medanshm qerbwal
Geta ligobegnsh keberafsh qomwal
Yaltadelshw heger gergeseyon hoy
Lemn teqawemshw amlakshn sitayiw

CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi

VERSE 2
Yeketemawn ber mezgiyawn qolfesh
Keruq yeshegneshw simet’a selamsh
Yebitanya dingay andebet awt’to
Misgana jemere amlakun leyto

CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi

VERSE 3
Sarna qit’elu zenbabaw segede
Fit’ret liyamesegn amlakun wedede
Hits’an shmaglew misgana siyaqerbu
Teqolfo neber ferisawi libu

CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi

VERSE 4
Zarem lemsgana libachn yilewet’
Hosaena Geta yimelalesbet

CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 1
ሰላምሽ ታውጇል መዳንሽም ቀርቧል
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር ጌርጌሴዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 2
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጥቶ
ምስጋና ጀመረ አምላኩን ለይቶ

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 3
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 4
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 1
ሰላምሽ ታውጇል መዳንሽም ቀርቧል
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር ጌርጌሴዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 2
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጥቶ
ምስጋና ጀመረ አምላኩን ለይቶ

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 3
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 4
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ' THEN lyrics_amharic 
          ELSE 'CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 1
ሰላምሽ ታውጇል መዳንሽም ቀርቧል
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር ጌርጌሴዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 2
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጥቶ
ምስጋና ጀመረ አምላኩን ለይቶ

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 3
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 4
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ' 
        END,
        lyrics_transliteration = 'CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi

VERSE 1
Selamsh tawjwal medanshm qerbwal
Geta ligobegnsh keberafsh qomwal
Yaltadelshw heger gergeseyon hoy
Lemn teqawemshw amlakshn sitayiw

CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi

VERSE 2
Yeketemawn ber mezgiyawn qolfesh
Keruq yeshegneshw simet’a selamsh
Yebitanya dingay andebet awt’to
Misgana jemere amlakun leyto

CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi

VERSE 3
Sarna qit’elu zenbabaw segede
Fit’ret liyamesegn amlakun wedede
Hits’an shmaglew misgana siyaqerbu
Teqolfo neber ferisawi libu

CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi

VERSE 4
Zarem lemsgana libachn yilewet’
Hosaena Geta yimelalesbet

CHORUS
Nana yemsgana Geta nana yemhret Geta
Madanh tegegntalechna selamh tegegntalechna
Iyerusalem hoy misgana jemri
Meleketn nifi negarit gosmi',
        updated_at = clock_timestamp()::text
    WHERE import_id = '610eaf12-3f27-4d0e-92fa-c1892ef96392'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 1
ሰላምሽ ታውጇል መዳንሽም ቀርቧል
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር ጌርጌሴዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 2
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጥቶ
ምስጋና ጀመረ አምላኩን ለይቶ

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 3
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ

VERSE 4
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት

CHORUS
ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ናና የምስጋና ጌታ ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና ሰላምህ ተገኝታለችና
ኢየሩሳሌም ሆይ ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ
ሰላምሽ ታውጇል መዳንሽም ቀርቧል
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር ጌርጌሴዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጥቶ
ምስጋና ጀመረ አምላኩን ለይቶ
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '610eaf12-3f27-4d0e-92fa-c1892ef96392'::uuid, 'nana-yemisgana-geta-hosanna', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ab-mesikel-ziraehiwo-fikiri ("ኣብ መስቀል ዝራእኽዎ ፍቕሪ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '825bae32-2c26-450c-bd72-63c04c674a41'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)

VERSE 1
Enats’elewo nisu gin yifetwom (2)
Enagotetwo goyta yiኽtelom (2)
Neti ts’adቕ hat’e neti haqi hasot (2)
Ilom kich’rhu yiseቐl yimut (2)

CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)

VERSE 2
Weye kimrmro nifet’ari fit’ur (2)
Kristos asiru fethalom niberban (2)
Hiቑu enkgerfwo bizeqats’l ch’guraf (2)
Bimhret haቖfom biyቕreta aኽnaf (2)

CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)

VERSE 3
Hamot kestywo bimerir ch’kane (2)
Gonu mis wegewo dem wemay wehaze (2)
Gimja albeswo gefifom kidanu (2)
Aኽlil nay eshoኽ''wun ab riesu seቐlu (2)

CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)

VERSE 4
O nay ayhud nigus ''nabelu ቐledu (2)
Nihywet koynwom nay Iyesus motu (2)

CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 1
እናጸልእዎ ንሱ ግን ይፈትዎም /2/
እናጎተትዎ ጎይታ ይኽተሎም /2/
ነቲ ጻድቕ ሓጥእ ነቲ ሓቂ ሓሶት /2/
ኢሎም ክጭርሑ ይሰቐል ይሙት /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 2
ወየ ክምርምሮ ንፈጣሪ ፍጡር /2/
ክርስቶስ ኣሲሩ ፈትሓሎም ንበርባን /2/
ሕቑኡ እንክገርፍዎ ብዘቃጽል ጭጉራፍ /2/
ብምሕረት ሓቖፎም ብይቕሬታ ኣኽናፍ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 3
ሓሞት ከስትይዎ ብመሪር ጭካነ /2/
ጎኑ ምስ ወግእዎ ደም ወማይ ወሓዘ /2/
ግምጃ ኣልበስዎ ገፊፎም ክዳኑ /2/
ኣኽሊል ናይ እሾኽ''ዉን ኣብ ርእሱ ሰቐሉ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 4
ኦ ናይ ኣይሁድ ንጉስ ''ናበሉ ቐለዱ /2/
ንሕይወት ኮይንዎም ናይ ኢየሱስ ሞቱ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 1
እናጸልእዎ ንሱ ግን ይፈትዎም /2/
እናጎተትዎ ጎይታ ይኽተሎም /2/
ነቲ ጻድቕ ሓጥእ ነቲ ሓቂ ሓሶት /2/
ኢሎም ክጭርሑ ይሰቐል ይሙት /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 2
ወየ ክምርምሮ ንፈጣሪ ፍጡር /2/
ክርስቶስ ኣሲሩ ፈትሓሎም ንበርባን /2/
ሕቑኡ እንክገርፍዎ ብዘቃጽል ጭጉራፍ /2/
ብምሕረት ሓቖፎም ብይቕሬታ ኣኽናፍ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 3
ሓሞት ከስትይዎ ብመሪር ጭካነ /2/
ጎኑ ምስ ወግእዎ ደም ወማይ ወሓዘ /2/
ግምጃ ኣልበስዎ ገፊፎም ክዳኑ /2/
ኣኽሊል ናይ እሾኽ''ዉን ኣብ ርእሱ ሰቐሉ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 4
ኦ ናይ ኣይሁድ ንጉስ ''ናበሉ ቐለዱ /2/
ንሕይወት ኮይንዎም ናይ ኢየሱስ ሞቱ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/' THEN lyrics_amharic 
          ELSE 'CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 1
እናጸልእዎ ንሱ ግን ይፈትዎም /2/
እናጎተትዎ ጎይታ ይኽተሎም /2/
ነቲ ጻድቕ ሓጥእ ነቲ ሓቂ ሓሶት /2/
ኢሎም ክጭርሑ ይሰቐል ይሙት /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 2
ወየ ክምርምሮ ንፈጣሪ ፍጡር /2/
ክርስቶስ ኣሲሩ ፈትሓሎም ንበርባን /2/
ሕቑኡ እንክገርፍዎ ብዘቃጽል ጭጉራፍ /2/
ብምሕረት ሓቖፎም ብይቕሬታ ኣኽናፍ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 3
ሓሞት ከስትይዎ ብመሪር ጭካነ /2/
ጎኑ ምስ ወግእዎ ደም ወማይ ወሓዘ /2/
ግምጃ ኣልበስዎ ገፊፎም ክዳኑ /2/
ኣኽሊል ናይ እሾኽ''ዉን ኣብ ርእሱ ሰቐሉ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 4
ኦ ናይ ኣይሁድ ንጉስ ''ናበሉ ቐለዱ /2/
ንሕይወት ኮይንዎም ናይ ኢየሱስ ሞቱ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/' 
        END,
        lyrics_transliteration = 'CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)

VERSE 1
Enats’elewo nisu gin yifetwom (2)
Enagotetwo goyta yiኽtelom (2)
Neti ts’adቕ hat’e neti haqi hasot (2)
Ilom kich’rhu yiseቐl yimut (2)

CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)

VERSE 2
Weye kimrmro nifet’ari fit’ur (2)
Kristos asiru fethalom niberban (2)
Hiቑu enkgerfwo bizeqats’l ch’guraf (2)
Bimhret haቖfom biyቕreta aኽnaf (2)

CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)

VERSE 3
Hamot kestywo bimerir ch’kane (2)
Gonu mis wegewo dem wemay wehaze (2)
Gimja albeswo gefifom kidanu (2)
Aኽlil nay eshoኽ''wun ab riesu seቐlu (2)

CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)

VERSE 4
O nay ayhud nigus ''nabelu ቐledu (2)
Nihywet koynwom nay Iyesus motu (2)

CHORUS
Ab mesqel ziraeኽwo fiቕri (2)
Nismu kizmr yeberabreni (2)
Gets’u ''nats’efewo endategelatea (2)
Bikwinat enkwugae yiቕretau habe (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '825bae32-2c26-450c-bd72-63c04c674a41'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 1
እናጸልእዎ ንሱ ግን ይፈትዎም /2/
እናጎተትዎ ጎይታ ይኽተሎም /2/
ነቲ ጻድቕ ሓጥእ ነቲ ሓቂ ሓሶት /2/
ኢሎም ክጭርሑ ይሰቐል ይሙት /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 2
ወየ ክምርምሮ ንፈጣሪ ፍጡር /2/
ክርስቶስ ኣሲሩ ፈትሓሎም ንበርባን /2/
ሕቑኡ እንክገርፍዎ ብዘቃጽል ጭጉራፍ /2/
ብምሕረት ሓቖፎም ብይቕሬታ ኣኽናፍ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 3
ሓሞት ከስትይዎ ብመሪር ጭካነ /2/
ጎኑ ምስ ወግእዎ ደም ወማይ ወሓዘ /2/
ግምጃ ኣልበስዎ ገፊፎም ክዳኑ /2/
ኣኽሊል ናይ እሾኽ''ዉን ኣብ ርእሱ ሰቐሉ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/

VERSE 4
ኦ ናይ ኣይሁድ ንጉስ ''ናበሉ ቐለዱ /2/
ንሕይወት ኮይንዎም ናይ ኢየሱስ ሞቱ /2/

CHORUS
ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኣብ መስቀል ዝራእኽዎ ፍቕሪ /2/
ንስሙ ክዝምር የበራብረኒ /2/
ገጹ ''ናጸፍዕዎ እንዳተገላተዐ /2/
ብኲናት እንክዉጋእ ይቕሬታኡ ሃበ /2/
እናጸልእዎ ንሱ ግን ይፈትዎም /2/
እናጎተትዎ ጎይታ ይኽተሎም /2/
ነቲ ጻድቕ ሓጥእ ነቲ ሓቂ ሓሶት /2/
ኢሎም ክጭርሑ ይሰቐል ይሙት /2/
ወየ ክምርምሮ ንፈጣሪ ፍጡር /2/
ክርስቶስ ኣሲሩ ፈትሓሎም ንበርባን /2/
ሕቑኡ እንክገርፍዎ ብዘቃጽል ጭጉራፍ /2/
ብምሕረት ሓቖፎም ብይቕሬታ ኣኽናፍ /2/
ሓሞት ከስትይዎ ብመሪር ጭካነ /2/
ጎኑ ምስ ወግእዎ ደም ወማይ ወሓዘ /2/
ግምጃ ኣልበስዎ ገፊፎም ክዳኑ /2/
ኣኽሊል ናይ እሾኽ''ዉን ኣብ ርእሱ ሰቐሉ /2/
ኦ ናይ ኣይሁድ ንጉስ ''ናበሉ ቐለዱ /2/
ንሕይወት ኮይንዎም ናይ ኢየሱስ ሞቱ /2/'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '825bae32-2c26-450c-bd72-63c04c674a41'::uuid, 'ab-mesikel-ziraehiwo-fikiri', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enze-tehaqfiyo-tehakfiyo ("እንዘ ተሐቅፊዮ የጽጌ መዝሙር መዝሙር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '44e4594b-bcf8-406e-8e9e-b2bc290ed7a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enze teheqfiyo lehts’anki nii Maryam
Nii nii nii Maryam

VERSE 1
Enze teheqfiyo lehts’anki nii Maryam
Nii nii nii Maryam

CHORUS
Enze teheqfiyo lehts’anki nii Maryam
Nii nii nii Maryam'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም

VERSE 1
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም

CHORUS
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም

VERSE 1
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም

CHORUS
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም' THEN lyrics_amharic 
          ELSE 'CHORUS
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም

VERSE 1
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም

CHORUS
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም' 
        END,
        lyrics_transliteration = 'CHORUS
Enze teheqfiyo lehts’anki nii Maryam
Nii nii nii Maryam

VERSE 1
Enze teheqfiyo lehts’anki nii Maryam
Nii nii nii Maryam

CHORUS
Enze teheqfiyo lehts’anki nii Maryam
Nii nii nii Maryam',
        updated_at = clock_timestamp()::text
    WHERE import_id = '44e4594b-bcf8-406e-8e9e-b2bc290ed7a1'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም

VERSE 1
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም

CHORUS
እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እንዘ ተሐቅፊዮ ለሕጻንኪ ንዒ ማርያም
ንዒ ንዒ ንዒ ማርያም'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '44e4594b-bcf8-406e-8e9e-b2bc290ed7a1'::uuid, 'enze-tehaqfiyo-tehakfiyo', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemari-deacon-samson-negash ("+ፍቅርህ ማረከኝ+ ዘማሪ ዲያቆን ሳምሶን ነጋሽ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1cb24f58-3b90-498e-9291-032b3ff1b0fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)' THEN lyrics_amharic 
          ELSE 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)' 
        END,
        lyrics_transliteration = 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1cb24f58-3b90-498e-9291-032b3ff1b0fe'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)
አዝ.........
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)
አዝ........
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)
አዝ.......
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1cb24f58-3b90-498e-9291-032b3ff1b0fe'::uuid, 'zemari-deacon-samson-negash', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- our-bride-and-groom ("ሙሽራዬ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f29a4e8b-7271-4917-9970-7edde5b8c640'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 1
You have found a sister that will stand beside you
Glorious groom with bliss may you become consumed
The will of our Lord has brought both of you here
May He come bless your home with love none you will fear

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 2
You have found a brother that thinks truly for you
Enchanting bride with bliss may you become consumed
In turn we thank our God for we are filled with joy
In this house of christians your wedding we’ll enjoy

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 3
Love her and adore her as if she is your soul
Entrusting her to you we are in front of Lord
And just as your own flesh care for him with marvel
She puts her trust in you your mother the gospel

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 1
You have found a sister that will stand beside you
Glorious groom with bliss may you become consumed
The will of our Lord has brought both of you here
May He come bless your home with love none you will fear

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 2
You have found a brother that thinks truly for you
Enchanting bride with bliss may you become consumed
In turn we thank our God for we are filled with joy
In this house of christians your wedding we’ll enjoy

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 3
Love her and adore her as if she is your soul
Entrusting her to you we are in front of Lord
And just as your own flesh care for him with marvel
She puts her trust in you your mother the gospel

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 1
You have found a sister that will stand beside you
Glorious groom with bliss may you become consumed
The will of our Lord has brought both of you here
May He come bless your home with love none you will fear

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 2
You have found a brother that thinks truly for you
Enchanting bride with bliss may you become consumed
In turn we thank our God for we are filled with joy
In this house of christians your wedding we’ll enjoy

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 3
Love her and adore her as if she is your soul
Entrusting her to you we are in front of Lord
And just as your own flesh care for him with marvel
She puts her trust in you your mother the gospel

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye' THEN lyrics_amharic 
          ELSE 'CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 1
You have found a sister that will stand beside you
Glorious groom with bliss may you become consumed
The will of our Lord has brought both of you here
May He come bless your home with love none you will fear

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 2
You have found a brother that thinks truly for you
Enchanting bride with bliss may you become consumed
In turn we thank our God for we are filled with joy
In this house of christians your wedding we’ll enjoy

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 3
Love her and adore her as if she is your soul
Entrusting her to you we are in front of Lord
And just as your own flesh care for him with marvel
She puts her trust in you your mother the gospel

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye' 
        END,
        lyrics_transliteration = 'CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 1
You have found a sister that will stand beside you
Glorious groom with bliss may you become consumed
The will of our Lord has brought both of you here
May He come bless your home with love none you will fear

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 2
You have found a brother that thinks truly for you
Enchanting bride with bliss may you become consumed
In turn we thank our God for we are filled with joy
In this house of christians your wedding we’ll enjoy

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 3
Love her and adore her as if she is your soul
Entrusting her to you we are in front of Lord
And just as your own flesh care for him with marvel
She puts her trust in you your mother the gospel

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f29a4e8b-7271-4917-9970-7edde5b8c640'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 1
You have found a sister that will stand beside you
Glorious groom with bliss may you become consumed
The will of our Lord has brought both of you here
May He come bless your home with love none you will fear

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 2
You have found a brother that thinks truly for you
Enchanting bride with bliss may you become consumed
In turn we thank our God for we are filled with joy
In this house of christians your wedding we’ll enjoy

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye

VERSE 3
Love her and adore her as if she is your soul
Entrusting her to you we are in front of Lord
And just as your own flesh care for him with marvel
She puts her trust in you your mother the gospel

CHORUS
Our bride and groom
Their love will bloom
Mushiraye
Abebaye'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Our bride and groom
Their love will bloom
Mushiraye
Abebaye
You have found a sister that will stand beside you
Glorious groom with bliss may you become consumed
The will of our Lord has brought both of you here
May He come bless your home with love none you will fear
You have found a brother that thinks truly for you
Enchanting bride with bliss may you become consumed
In turn we thank our God for we are filled with joy
In this house of christians your wedding we’ll enjoy
Love her and adore her as if she is your soul
Entrusting her to you we are in front of Lord
And just as your own flesh care for him with marvel
She puts her trust in you your mother the gospel'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f29a4e8b-7271-4917-9970-7edde5b8c640'::uuid, 'our-bride-and-groom', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aman-beaman-3019 ("አማን በአማን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9fdc6838-5d1e-4230-aaf2-0454eee9ff42'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman/2x/ ኸ..menkr: /2x/
Menkr sibhete lidetu:: /4x/

VERSE 1
Aman beaman/2x/ ኸ..menkr: /2x/
Menkr sibhete lidetu:: /4x/

CHORUS
Aman beaman/2x/ ኸ..menkr: /2x/
Menkr sibhete lidetu:: /4x/'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/

VERSE 1
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/

CHORUS
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/

VERSE 1
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/

CHORUS
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/' THEN lyrics_amharic 
          ELSE 'CHORUS
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/

VERSE 1
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/

CHORUS
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/' 
        END,
        lyrics_transliteration = 'CHORUS
Aman beaman/2x/ ኸ..menkr: /2x/
Menkr sibhete lidetu:: /4x/

VERSE 1
Aman beaman/2x/ ኸ..menkr: /2x/
Menkr sibhete lidetu:: /4x/

CHORUS
Aman beaman/2x/ ኸ..menkr: /2x/
Menkr sibhete lidetu:: /4x/',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9fdc6838-5d1e-4230-aaf2-0454eee9ff42'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/

VERSE 1
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/

CHORUS
አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/'
        OR lyrics_amharic IS NOT DISTINCT FROM 'አማን በአማን/2x/ ኸ..መንክር: /2x/
መንክር ስብሐተ ልደቱ:: /4x/'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9fdc6838-5d1e-4230-aaf2-0454eee9ff42'::uuid, 'aman-beaman-3019', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- o-virgin-mary ("እመቤቴ ማርያም እለምንሻለሁ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '550a6871-bb23-42d0-a03b-649ec10730d7'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 1
My troubles and my pain no one will care to know
Mary listen to me for you''re the one He chose
My sorrows adding up the suffering won''t end
How can I handle it on you I will depend

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 2
Emmanuel''s mother hurry and take my hand
I stumble endlessly I am about to fall
Oh Mary support me the pillar I lean on
Virgin stand next to me I have no aid at all

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 3
Emebete Mariam eleminishalehu
Be lekso be wayta fitish wedikyalehu
Emebete simign tematsigneshalehu

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 1
My troubles and my pain no one will care to know
Mary listen to me for you''re the one He chose
My sorrows adding up the suffering won''t end
How can I handle it on you I will depend

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 2
Emmanuel''s mother hurry and take my hand
I stumble endlessly I am about to fall
Oh Mary support me the pillar I lean on
Virgin stand next to me I have no aid at all

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 3
Emebete Mariam eleminishalehu
Be lekso be wayta fitish wedikyalehu
Emebete simign tematsigneshalehu

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 1
My troubles and my pain no one will care to know
Mary listen to me for you''re the one He chose
My sorrows adding up the suffering won''t end
How can I handle it on you I will depend

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 2
Emmanuel''s mother hurry and take my hand
I stumble endlessly I am about to fall
Oh Mary support me the pillar I lean on
Virgin stand next to me I have no aid at all

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 3
Emebete Mariam eleminishalehu
Be lekso be wayta fitish wedikyalehu
Emebete simign tematsigneshalehu

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those' THEN lyrics_amharic 
          ELSE 'CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 1
My troubles and my pain no one will care to know
Mary listen to me for you''re the one He chose
My sorrows adding up the suffering won''t end
How can I handle it on you I will depend

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 2
Emmanuel''s mother hurry and take my hand
I stumble endlessly I am about to fall
Oh Mary support me the pillar I lean on
Virgin stand next to me I have no aid at all

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 3
Emebete Mariam eleminishalehu
Be lekso be wayta fitish wedikyalehu
Emebete simign tematsigneshalehu

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those' 
        END,
        lyrics_transliteration = 'CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 1
My troubles and my pain no one will care to know
Mary listen to me for you''re the one He chose
My sorrows adding up the suffering won''t end
How can I handle it on you I will depend

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 2
Emmanuel''s mother hurry and take my hand
I stumble endlessly I am about to fall
Oh Mary support me the pillar I lean on
Virgin stand next to me I have no aid at all

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 3
Emebete Mariam eleminishalehu
Be lekso be wayta fitish wedikyalehu
Emebete simign tematsigneshalehu

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those',
        updated_at = clock_timestamp()::text
    WHERE import_id = '550a6871-bb23-42d0-a03b-649ec10730d7'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 1
My troubles and my pain no one will care to know
Mary listen to me for you''re the one He chose
My sorrows adding up the suffering won''t end
How can I handle it on you I will depend

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 2
Emmanuel''s mother hurry and take my hand
I stumble endlessly I am about to fall
Oh Mary support me the pillar I lean on
Virgin stand next to me I have no aid at all

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those

VERSE 3
Emebete Mariam eleminishalehu
Be lekso be wayta fitish wedikyalehu
Emebete simign tematsigneshalehu

CHORUS
Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Oh Virgin Mary I beg listen to me
With my tears and my cries I''m falling at your feet
Oh Mother of our Lord incline your ear to me
My sadness and my tears who will listen to those
My troubles and my pain no one will care to know
Mary listen to me for you''re the one He chose
My sorrows adding up the suffering won''t end
How can I handle it on you I will depend
Emmanuel''s mother hurry and take my hand
I stumble endlessly I am about to fall
Oh Mary support me the pillar I lean on
Virgin stand next to me I have no aid at all
Emebete Mariam eleminishalehu
Be lekso be wayta fitish wedikyalehu
Emebete simign tematsigneshalehu'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '550a6871-bb23-42d0-a03b-649ec10730d7'::uuid, 'o-virgin-mary', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bekalina-benuro ("በቃልና በኑሮ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd584057c-cb9f-4b70-80c2-45b75cbe0d7c'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 1
CHORUS
Besmmu lemiyamnut amalaj honehel
Bets’elothm hayl temamnenbhal
Yekbr kokeb neh yegedam mebrat

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 2
Astemreኸgnal migbar haymanot
CHORUS
Yemiyalfewn alem yemdrun niqehel
Yetamenkew amlak hiyaw adrgohal

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 3
Besga benefsh Egziabher kebere
Yemastareqn qal beante lay anore
CHORUS
Betegadloh bizat bets’om bets’eloth

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 4
Titega nebere bets’enach emneth
Sile qal kidanh bereket yiwerdal
Yante sim sit’era agannt yirdal
CHORUS

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 5
Gebremenfes Kidus yeemnet abat
Anabrt anabst yetazezulet
Kenhisa tenesto ityop’iya derese
Ts’egaw bereketu beegna lay fesese

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 1
አዝ
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 2
አስተምረኸኛል ምግባር ሃይማኖት
አዝ
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 3
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ
በተጋድሎህ ብዛት በፆም በፀሎትህ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 4
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 5
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 1
አዝ
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 2
አስተምረኸኛል ምግባር ሃይማኖት
አዝ
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 3
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ
በተጋድሎህ ብዛት በፆም በፀሎትህ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 4
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 5
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ' THEN lyrics_amharic 
          ELSE 'CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 1
አዝ
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 2
አስተምረኸኛል ምግባር ሃይማኖት
አዝ
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 3
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ
በተጋድሎህ ብዛት በፆም በፀሎትህ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 4
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 5
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ' 
        END,
        lyrics_transliteration = 'CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 1
CHORUS
Besmmu lemiyamnut amalaj honehel
Bets’elothm hayl temamnenbhal
Yekbr kokeb neh yegedam mebrat

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 2
Astemreኸgnal migbar haymanot
CHORUS
Yemiyalfewn alem yemdrun niqehel
Yetamenkew amlak hiyaw adrgohal

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 3
Besga benefsh Egziabher kebere
Yemastareqn qal beante lay anore
CHORUS
Betegadloh bizat bets’om bets’eloth

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 4
Titega nebere bets’enach emneth
Sile qal kidanh bereket yiwerdal
Yante sim sit’era agannt yirdal
CHORUS

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 5
Gebremenfes Kidus yeemnet abat
Anabrt anabst yetazezulet
Kenhisa tenesto ityop’iya derese
Ts’egaw bereketu beegna lay fesese

CHORUS
Qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd584057c-cb9f-4b70-80c2-45b75cbe0d7c'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 1
አዝ
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 2
አስተምረኸኛል ምግባር ሃይማኖት
አዝ
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 3
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ
በተጋድሎህ ብዛት በፆም በፀሎትህ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 4
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 5
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ

CHORUS
ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ቃልና በኑሮህ ሆነሀል ምስክር
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
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd584057c-cb9f-4b70-80c2-45b75cbe0d7c'::uuid, 'bekalina-benuro', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anchi-bicha-betelhem ("አንቺን ብቻ ቤተልሄም")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '91adcf56-a30e-46b6-9534-6ef1d432cc46'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 1
Yosefnm alayenm lit’astra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel besrat yizo kegelila siders
Yan zena sisemi deneget’sh bebrtu
Anchi bicha nebersh bilatenaytu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 3
Hits’anun sitwelj girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldetu enji yetalu bemotu
Abreshu nebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 4
Yegbts’ berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyaferu
Anchin bicha titew bemender neberu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi nebersh

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel motu
Abreshu nebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊጣስትራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል በስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስሰሚ ደነገጥሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 3
ሕፃኑን ስትወልጅ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደቱ እንጂ የታሉ በሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 4
የግብፅ በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እያፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ነበርሽ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል ሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊጣስትራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል በስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስሰሚ ደነገጥሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 3
ሕፃኑን ስትወልጅ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደቱ እንጂ የታሉ በሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 4
የግብፅ በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እያፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ነበርሽ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል ሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ' THEN lyrics_amharic 
          ELSE 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊጣስትራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል በስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስሰሚ ደነገጥሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 3
ሕፃኑን ስትወልጅ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደቱ እንጂ የታሉ በሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 4
የግብፅ በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እያፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ነበርሽ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል ሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ' 
        END,
        lyrics_transliteration = 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 1
Yosefnm alayenm lit’astra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel besrat yizo kegelila siders
Yan zena sisemi deneget’sh bebrtu
Anchi bicha nebersh bilatenaytu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 3
Hits’anun sitwelj girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldetu enji yetalu bemotu
Abreshu nebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 4
Yegbts’ berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyaferu
Anchin bicha titew bemender neberu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi nebersh

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel motu
Abreshu nebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensne begelila beefrata alayenm
Anchin bicha qeranyo anchin bekorebta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '91adcf56-a30e-46b6-9534-6ef1d432cc46'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊጣስትራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል በስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስሰሚ ደነገጥሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 3
ሕፃኑን ስትወልጅ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደቱ እንጂ የታሉ በሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 4
የግብፅ በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እያፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ነበርሽ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል ሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስነ በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን በኮረብታ
ዮሴፍንም አላየንም ሊጣስትራ ጎልጎታ
አዝ...
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል በስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስሰሚ ደነገጥሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ
አዝ....
ሕፃኑን ስትወልጅ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደቱ እንጂ የታሉ በሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ
አዝ...
የግብፅ በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እያፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ
አዝ..
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ
አዝ...
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ነበርሽ
አዝ...
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል ሞቱ
አብረሹ ነበርሽ አንቺ ብቻ እናቱ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '91adcf56-a30e-46b6-9534-6ef1d432cc46'::uuid, 'anchi-bicha-betelhem', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- agatami-aykonen-eritrean-orthodox-tewahdo-mezmur ("ኣጋጣሚ ኣይኮነን ~ ~")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e1080792-d495-4234-b91c-0177dc883455'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 1
Men''yu abti bereኻ mena megibu may zesteyeni
Men''yu zidegefeni maemuq sinch’ro zesagereni
Nisኻ niay kem aboy adey
Fits’um fitwey sigay aets’mtey

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 2
Ayney ayelen kabti zufanka
Gets’u aykwln feqar aynኻ
Ts’elmat enkwereni tesfay masinu libey kidemi
Rieyu zara nibatey semay sent’iqu mets’iuni gweytay

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 3
Ts’ehayey eyu andi birhaney
Iyesus niay hiwet mengedey
Aytesenefkun abertiuni
Nimot siiru hiwet hibuni

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 4
Kitfle nebsey kab siga bits’elmat ewan biኽfue hadega
Kab af nay mot dihine tewesiኹley nay nisha edme
Bits’dqey aykonen ziterefku
Beti fiqru’ye beti mihretu

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 5
Nibeyney koyne zibeኽyo kulu
Enda bedelkuwo medhney mikhwanu
O mot abey alo bilhኻ ata siol''ke abey alo awetka
Bitnsae nay Kristos tesairka’ኻ bado terifka

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 6
Mengstu kiwers zifet’ereni
Wildnet hibu zihareyeni
Meqabr keyhats’ro agelglotey
Kefituley’yu af dege gweytay

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 1
መን''ዩ ኣብቲ በረኻ መና መጊቡ ማይ ዘስተየኒ
መን''ዩ ዝደገፈኒ ማዕሙቅ ስንጭሮ ዘሳገረኒ
ንስኻ ንዓይ ከም ኣቦይ ኣደይ
ፍጹም ፍትወይ ስጋይ ኣዕጽምተይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 2
ዓይነይ ኣይእለን ካብቲ ዙፋንካ
ገጹ ኣይክውልን ፈቃር ዓይንኻ
ጸልማት እንክወረኒ ተስፋይ ማሲኑ ልበይ ክደሚ
ርእዩ ዛራ ንብዓተይ ሰማይ ሰንጢቁ መጺኡኒ ጐይታይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 3
ጸሓየይ እዩ ዓንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ
ኣይተሰነፍኩን ኣበርቲዑኒ
ንሞት ስዒሩ ሂወት ሂቡኒ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 4
ክትፍለ ነብሰይ ካብ ስጋ ብጸልማት እዋን ብኽፉእ ሓደጋ
ካብ ኣፍ ናይ ሞት ድሒነ፡ ተወሲኹለይ ናይ ንስሓ ዕድመ
ብጽድቀይ ኣይኮነን ዝተረፍኩ
በቲ ፍቅሩ’የ በቲ ምሕረቱ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 5
ንበይነይ ኮይነ ዝበኽዮ ኩሉ
እንዳ በደልኩዎ መድሕነይ ምዃኑ
ኦ ሞት ኣበይ ኣሎ ብልሕኻ ኣታ ሲኦል''ከ ኣበይ ኣሎ ዓወትካ
ብትንሳኤ ናይ ክርስቶስ ተሳዒርካ’ኻ ባዶ ተሪፍካ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 6
መንግስቱ ክወርስ ዝፈጠረኒ
ውልድነት ሂቡ ዝሓረየኒ
መቃብር ከይሓጽሮ ኣገልግሎተይ
ከፊቱለይ’ዩ ኣፍ ደገ ጐይታይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 1
መን''ዩ ኣብቲ በረኻ መና መጊቡ ማይ ዘስተየኒ
መን''ዩ ዝደገፈኒ ማዕሙቅ ስንጭሮ ዘሳገረኒ
ንስኻ ንዓይ ከም ኣቦይ ኣደይ
ፍጹም ፍትወይ ስጋይ ኣዕጽምተይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 2
ዓይነይ ኣይእለን ካብቲ ዙፋንካ
ገጹ ኣይክውልን ፈቃር ዓይንኻ
ጸልማት እንክወረኒ ተስፋይ ማሲኑ ልበይ ክደሚ
ርእዩ ዛራ ንብዓተይ ሰማይ ሰንጢቁ መጺኡኒ ጐይታይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 3
ጸሓየይ እዩ ዓንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ
ኣይተሰነፍኩን ኣበርቲዑኒ
ንሞት ስዒሩ ሂወት ሂቡኒ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 4
ክትፍለ ነብሰይ ካብ ስጋ ብጸልማት እዋን ብኽፉእ ሓደጋ
ካብ ኣፍ ናይ ሞት ድሒነ፡ ተወሲኹለይ ናይ ንስሓ ዕድመ
ብጽድቀይ ኣይኮነን ዝተረፍኩ
በቲ ፍቅሩ’የ በቲ ምሕረቱ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 5
ንበይነይ ኮይነ ዝበኽዮ ኩሉ
እንዳ በደልኩዎ መድሕነይ ምዃኑ
ኦ ሞት ኣበይ ኣሎ ብልሕኻ ኣታ ሲኦል''ከ ኣበይ ኣሎ ዓወትካ
ብትንሳኤ ናይ ክርስቶስ ተሳዒርካ’ኻ ባዶ ተሪፍካ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 6
መንግስቱ ክወርስ ዝፈጠረኒ
ውልድነት ሂቡ ዝሓረየኒ
መቃብር ከይሓጽሮ ኣገልግሎተይ
ከፊቱለይ’ዩ ኣፍ ደገ ጐይታይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ' THEN lyrics_amharic 
          ELSE 'CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 1
መን''ዩ ኣብቲ በረኻ መና መጊቡ ማይ ዘስተየኒ
መን''ዩ ዝደገፈኒ ማዕሙቅ ስንጭሮ ዘሳገረኒ
ንስኻ ንዓይ ከም ኣቦይ ኣደይ
ፍጹም ፍትወይ ስጋይ ኣዕጽምተይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 2
ዓይነይ ኣይእለን ካብቲ ዙፋንካ
ገጹ ኣይክውልን ፈቃር ዓይንኻ
ጸልማት እንክወረኒ ተስፋይ ማሲኑ ልበይ ክደሚ
ርእዩ ዛራ ንብዓተይ ሰማይ ሰንጢቁ መጺኡኒ ጐይታይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 3
ጸሓየይ እዩ ዓንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ
ኣይተሰነፍኩን ኣበርቲዑኒ
ንሞት ስዒሩ ሂወት ሂቡኒ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 4
ክትፍለ ነብሰይ ካብ ስጋ ብጸልማት እዋን ብኽፉእ ሓደጋ
ካብ ኣፍ ናይ ሞት ድሒነ፡ ተወሲኹለይ ናይ ንስሓ ዕድመ
ብጽድቀይ ኣይኮነን ዝተረፍኩ
በቲ ፍቅሩ’የ በቲ ምሕረቱ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 5
ንበይነይ ኮይነ ዝበኽዮ ኩሉ
እንዳ በደልኩዎ መድሕነይ ምዃኑ
ኦ ሞት ኣበይ ኣሎ ብልሕኻ ኣታ ሲኦል''ከ ኣበይ ኣሎ ዓወትካ
ብትንሳኤ ናይ ክርስቶስ ተሳዒርካ’ኻ ባዶ ተሪፍካ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 6
መንግስቱ ክወርስ ዝፈጠረኒ
ውልድነት ሂቡ ዝሓረየኒ
መቃብር ከይሓጽሮ ኣገልግሎተይ
ከፊቱለይ’ዩ ኣፍ ደገ ጐይታይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ' 
        END,
        lyrics_transliteration = 'CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 1
Men''yu abti bereኻ mena megibu may zesteyeni
Men''yu zidegefeni maemuq sinch’ro zesagereni
Nisኻ niay kem aboy adey
Fits’um fitwey sigay aets’mtey

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 2
Ayney ayelen kabti zufanka
Gets’u aykwln feqar aynኻ
Ts’elmat enkwereni tesfay masinu libey kidemi
Rieyu zara nibatey semay sent’iqu mets’iuni gweytay

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 3
Ts’ehayey eyu andi birhaney
Iyesus niay hiwet mengedey
Aytesenefkun abertiuni
Nimot siiru hiwet hibuni

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 4
Kitfle nebsey kab siga bits’elmat ewan biኽfue hadega
Kab af nay mot dihine tewesiኹley nay nisha edme
Bits’dqey aykonen ziterefku
Beti fiqru’ye beti mihretu

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 5
Nibeyney koyne zibeኽyo kulu
Enda bedelkuwo medhney mikhwanu
O mot abey alo bilhኻ ata siol''ke abey alo awetka
Bitnsae nay Kristos tesairka’ኻ bado terifka

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey

VERSE 6
Mengstu kiwers zifet’ereni
Wildnet hibu zihareyeni
Meqabr keyhats’ro agelglotey
Kefituley’yu af dege gweytay

CHORUS
Agat’ami aykonen mitrafey midhaney
Nay gweyta teamr’yu zedeneqeni niay
Mot diqas koynuley qelilu ch’nqetey
Ziredani gweyta''yu enaseabe fitwey',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e1080792-d495-4234-b91c-0177dc883455'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 1
መን''ዩ ኣብቲ በረኻ መና መጊቡ ማይ ዘስተየኒ
መን''ዩ ዝደገፈኒ ማዕሙቅ ስንጭሮ ዘሳገረኒ
ንስኻ ንዓይ ከም ኣቦይ ኣደይ
ፍጹም ፍትወይ ስጋይ ኣዕጽምተይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 2
ዓይነይ ኣይእለን ካብቲ ዙፋንካ
ገጹ ኣይክውልን ፈቃር ዓይንኻ
ጸልማት እንክወረኒ ተስፋይ ማሲኑ ልበይ ክደሚ
ርእዩ ዛራ ንብዓተይ ሰማይ ሰንጢቁ መጺኡኒ ጐይታይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 3
ጸሓየይ እዩ ዓንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ
ኣይተሰነፍኩን ኣበርቲዑኒ
ንሞት ስዒሩ ሂወት ሂቡኒ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 4
ክትፍለ ነብሰይ ካብ ስጋ ብጸልማት እዋን ብኽፉእ ሓደጋ
ካብ ኣፍ ናይ ሞት ድሒነ፡ ተወሲኹለይ ናይ ንስሓ ዕድመ
ብጽድቀይ ኣይኮነን ዝተረፍኩ
በቲ ፍቅሩ’የ በቲ ምሕረቱ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 5
ንበይነይ ኮይነ ዝበኽዮ ኩሉ
እንዳ በደልኩዎ መድሕነይ ምዃኑ
ኦ ሞት ኣበይ ኣሎ ብልሕኻ ኣታ ሲኦል''ከ ኣበይ ኣሎ ዓወትካ
ብትንሳኤ ናይ ክርስቶስ ተሳዒርካ’ኻ ባዶ ተሪፍካ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ

VERSE 6
መንግስቱ ክወርስ ዝፈጠረኒ
ውልድነት ሂቡ ዝሓረየኒ
መቃብር ከይሓጽሮ ኣገልግሎተይ
ከፊቱለይ’ዩ ኣፍ ደገ ጐይታይ

CHORUS
ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኣጋጣሚ ኣይኮነን ምትራፈይ ምድሓነይ
ናይ ጐይታ ተኣምር’ዩ ዘደነቀኒ ንዓይ
ሞት ድቃስ ኮይኑለይ ቀሊሉ ጭንቀተይ
ዝረድኣኒ ጐይታ''ዩ እናሰዓበ ፍትወይ
መን''ዩ ኣብቲ በረኻ መና መጊቡ ማይ ዘስተየኒ
መን''ዩ ዝደገፈኒ ማዕሙቅ ስንጭሮ ዘሳገረኒ
ንስኻ ንዓይ ከም ኣቦይ ኣደይ
ፍጹም ፍትወይ ስጋይ ኣዕጽምተይ
ዓይነይ ኣይእለን ካብቲ ዙፋንካ
ገጹ ኣይክውልን ፈቃር ዓይንኻ
ጸልማት እንክወረኒ ተስፋይ ማሲኑ ልበይ ክደሚ
ርእዩ ዛራ ንብዓተይ ሰማይ ሰንጢቁ መጺኡኒ ጐይታይ
ጸሓየይ እዩ ዓንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ
ኣይተሰነፍኩን ኣበርቲዑኒ
ንሞት ስዒሩ ሂወት ሂቡኒ
ክትፍለ ነብሰይ ካብ ስጋ ብጸልማት እዋን ብኽፉእ ሓደጋ
ካብ ኣፍ ናይ ሞት ድሒነ፡ ተወሲኹለይ ናይ ንስሓ ዕድመ
ብጽድቀይ ኣይኮነን ዝተረፍኩ
በቲ ፍቅሩ’የ በቲ ምሕረቱ
ንበይነይ ኮይነ ዝበኽዮ ኩሉ
እንዳ በደልኩዎ መድሕነይ ምዃኑ
ኦ ሞት ኣበይ ኣሎ ብልሕኻ ኣታ ሲኦል''ከ ኣበይ ኣሎ ዓወትካ
ብትንሳኤ ናይ ክርስቶስ ተሳዒርካ’ኻ ባዶ ተሪፍካ
መንግስቱ ክወርስ ዝፈጠረኒ
ውልድነት ሂቡ ዝሓረየኒ
መቃብር ከይሓጽሮ ኣገልግሎተይ
ከፊቱለይ’ዩ ኣፍ ደገ ጐይታይ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e1080792-d495-4234-b91c-0177dc883455'::uuid, 'agatami-aykonen-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- be-filled-with-glee ("ተፈስሒ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1c9803a6-1fb5-4756-880e-9db2a7f7ae7e'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom' THEN lyrics_amharic 
          ELSE 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom' 
        END,
        lyrics_transliteration = 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1c9803a6-1fb5-4756-880e-9db2a7f7ae7e'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 1
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 2
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 3
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom

VERSE 4
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves

CHORUS
Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Illuminating are the works of Emmanuel
Abraham and Sara we see in the couple
In the house of the Lord under its shade they stood
A crown of righteousness they wore the bride and groom
For they received the grace of the Holy Spirit
The bride and groom will shine their demeanor is lit
For these two separate hearts become one under God
Lets Praise almighty Lord and rejoice with a song
“Your bones are from my ribs and your flesh from my flesh”
Testaments of Adam today we all witnessed
The light of the crown is visible among us
Mystery of unity magnified in this house
He who made us worthy to see this engagement
Glory be to God who revealed this sacrament
In union they both stood adorned in robes of white
Resting under the shade of Holy Spirit''s might
Conquered were both the bride and the groom with one love
In eucharist to partake wearing white like the doves'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1c9803a6-1fb5-4756-880e-9db2a7f7ae7e'::uuid, 'be-filled-with-glee', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- believe-in-him ("believe-in-him")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '39421b13-587f-4cdc-ac51-cea54a9709f3'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 1
Happiness should come beside you
Excitement should swell inside you
Lift your voice calling out to Him
The Lord God truly has risen (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 2
Angles wearing all white
The joyful news they announce
He’s risen they cry out with joy
Share the news with all girls and boys (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 3
Eyuna emenu sewoch
Eyuna emenu sewoch dingayu tefeneqaqlwal
Kristos beekule lelit behaylu motn dil nestwal
Ellta lezih yigebal girgrta lezih yigebal

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 4
Yemot hayl tewardwal zare siolm temeseqaqlwal
Melaektu nech’ lebsew misrachun abeseru
Tenestwal Iyesus bilew lealem endinageru

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 1
Happiness should come beside you
Excitement should swell inside you
Lift your voice calling out to Him
The Lord God truly has risen (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 2
Angles wearing all white
The joyful news they announce
He’s risen they cry out with joy
Share the news with all girls and boys (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 3
እዩና እመኑ ሰዎች
እዩና እመኑ ሰዎች ድንጋዩ ተፈነቃቅሏል
ክርስቶስ በእኩለ ሌሊት በኃይሉ ሞትን ድል ነስቷል
እልልታ ለዚህ ይገባል ግርግርታ ለዚህ ይገባል

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 4
የሞት ኃይል ተዋርዷል ዛሬ ሲዖልም ተመሰቃቅሏል
መላእክቱ ነጭ ለብሰው ምስራቹን አበሰሩ
ተነስቷል ኢየሱስ ብለው ለዓለም እንዲናገሩ

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 1
Happiness should come beside you
Excitement should swell inside you
Lift your voice calling out to Him
The Lord God truly has risen (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 2
Angles wearing all white
The joyful news they announce
He’s risen they cry out with joy
Share the news with all girls and boys (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 3
እዩና እመኑ ሰዎች
እዩና እመኑ ሰዎች ድንጋዩ ተፈነቃቅሏል
ክርስቶስ በእኩለ ሌሊት በኃይሉ ሞትን ድል ነስቷል
እልልታ ለዚህ ይገባል ግርግርታ ለዚህ ይገባል

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 4
የሞት ኃይል ተዋርዷል ዛሬ ሲዖልም ተመሰቃቅሏል
መላእክቱ ነጭ ለብሰው ምስራቹን አበሰሩ
ተነስቷል ኢየሱስ ብለው ለዓለም እንዲናገሩ

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)' THEN lyrics_amharic 
          ELSE 'CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 1
Happiness should come beside you
Excitement should swell inside you
Lift your voice calling out to Him
The Lord God truly has risen (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 2
Angles wearing all white
The joyful news they announce
He’s risen they cry out with joy
Share the news with all girls and boys (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 3
እዩና እመኑ ሰዎች
እዩና እመኑ ሰዎች ድንጋዩ ተፈነቃቅሏል
ክርስቶስ በእኩለ ሌሊት በኃይሉ ሞትን ድል ነስቷል
እልልታ ለዚህ ይገባል ግርግርታ ለዚህ ይገባል

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 4
የሞት ኃይል ተዋርዷል ዛሬ ሲዖልም ተመሰቃቅሏል
መላእክቱ ነጭ ለብሰው ምስራቹን አበሰሩ
ተነስቷል ኢየሱስ ብለው ለዓለም እንዲናገሩ

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)' 
        END,
        lyrics_transliteration = 'CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 1
Happiness should come beside you
Excitement should swell inside you
Lift your voice calling out to Him
The Lord God truly has risen (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 2
Angles wearing all white
The joyful news they announce
He’s risen they cry out with joy
Share the news with all girls and boys (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 3
Eyuna emenu sewoch
Eyuna emenu sewoch dingayu tefeneqaqlwal
Kristos beekule lelit behaylu motn dil nestwal
Ellta lezih yigebal girgrta lezih yigebal

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 4
Yemot hayl tewardwal zare siolm temeseqaqlwal
Melaektu nech’ lebsew misrachun abeseru
Tenestwal Iyesus bilew lealem endinageru

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '39421b13-587f-4cdc-ac51-cea54a9709f3'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 1
Happiness should come beside you
Excitement should swell inside you
Lift your voice calling out to Him
The Lord God truly has risen (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 2
Angles wearing all white
The joyful news they announce
He’s risen they cry out with joy
Share the news with all girls and boys (2)

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 3
እዩና እመኑ ሰዎች
እዩና እመኑ ሰዎች ድንጋዩ ተፈነቃቅሏል
ክርስቶስ በእኩለ ሌሊት በኃይሉ ሞትን ድል ነስቷል
እልልታ ለዚህ ይገባል ግርግርታ ለዚህ ይገባል

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)

VERSE 4
የሞት ኃይል ተዋርዷል ዛሬ ሲዖልም ተመሰቃቅሏል
መላእክቱ ነጭ ለብሰው ምስራቹን አበሰሩ
ተነስቷል ኢየሱስ ብለው ለዓለም እንዲናገሩ

CHORUS
Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Believe in Him, believe your own eyes
The boulder has been set aside
At midnight our King of Kings
Has saved us coming back to life (2)
Happiness should come beside you
Excitement should swell inside you
Lift your voice calling out to Him
The Lord God truly has risen (2)
Angles wearing all white
The joyful news they announce
He’s risen they cry out with joy
Share the news with all girls and boys (2)
እዩና እመኑ ሰዎች
እዩና እመኑ ሰዎች ድንጋዩ ተፈነቃቅሏል
ክርስቶስ በእኩለ ሌሊት በኃይሉ ሞትን ድል ነስቷል
እልልታ ለዚህ ይገባል ግርግርታ ለዚህ ይገባል
የሞት ኃይል ተዋርዷል ዛሬ ሲዖልም ተመሰቃቅሏል
መላእክቱ ነጭ ለብሰው ምስራቹን አበሰሩ
ተነስቷል ኢየሱስ ብለው ለዓለም እንዲናገሩ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '39421b13-587f-4cdc-ac51-cea54a9709f3'::uuid, 'believe-in-him', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-will-forever-sing-for-my-lady-2931 ("ይኸው እዘምራለሁ ለእመቤቴ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3e05e190-69e5-4c26-8c76-f0b7cf35d450'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Yiኸw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyweten
Amesegnalehu Dingil emebeten

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ይኸው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ሕይወቴን
አመሰግናለሁ ድንግል እመቤቴን

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ይኸው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ሕይወቴን
አመሰግናለሁ ድንግል እመቤቴን

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time' THEN lyrics_amharic 
          ELSE 'CHORUS
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
ይኸው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ሕይወቴን
አመሰግናለሁ ድንግል እመቤቴን

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time' 
        END,
        lyrics_transliteration = 'CHORUS
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
Yiኸw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyweten
Amesegnalehu Dingil emebeten

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3e05e190-69e5-4c26-8c76-f0b7cf35d450'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ይኸው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ሕይወቴን
አመሰግናለሁ ድንግል እመቤቴን

CHORUS
I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time'
        OR lyrics_amharic IS NOT DISTINCT FROM 'I will forever sing for my Lady
For she has filled my home with homily
Because she’s visited me through this wretched life
I will praise the Virgin until the end of time
From my sorrowful face she soothed away my tears
I’m made to magnify her with songs and prayers
With misery and pain I no longer suffer
Into my home she came the mother of wonder
The disarray of life crumbling around me
She cleared it all away restored my sanity
She listens to my pleas my appeals and my cries
With her intercession my prayers will arise
No longer do I see through a clouded vision
My eyes have been healed by her hands of compassion
When I appeal to her with sorrow and despair
Immaculate is she, to the world I’ll declare
Day and night I lament with a heavy burden
From drowning she saved me so I won’t be saddened
For she has pulled me free from the clench of my sins
To her eternally I will raise up my hands
ይኸው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ሕይወቴን
አመሰግናለሁ ድንግል እመቤቴን'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3e05e190-69e5-4c26-8c76-f0b7cf35d450'::uuid, 'i-will-forever-sing-for-my-lady-2931', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- our-heavenly-father ("እንደ ቸርነትህ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '021c1fab-872f-4083-b14c-35302b60274a'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 1
From unrighteous living and all of my mistakes
It’s You who can save me my shackles You will break
I’ve sinned against You Lord strayed far from all Your laws
I will fall before You within Your holy house

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 2
With my remorseful heart when I appeal to You
Your light will shine through me my soul it will renew
Lord bless this gathering preserve our unity
Send us your spirit too as we call upon thee

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 1
From unrighteous living and all of my mistakes
It’s You who can save me my shackles You will break
I’ve sinned against You Lord strayed far from all Your laws
I will fall before You within Your holy house

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 2
With my remorseful heart when I appeal to You
Your light will shine through me my soul it will renew
Lord bless this gathering preserve our unity
Send us your spirit too as we call upon thee

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 1
From unrighteous living and all of my mistakes
It’s You who can save me my shackles You will break
I’ve sinned against You Lord strayed far from all Your laws
I will fall before You within Your holy house

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 2
With my remorseful heart when I appeal to You
Your light will shine through me my soul it will renew
Lord bless this gathering preserve our unity
Send us your spirit too as we call upon thee

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions' THEN lyrics_amharic 
          ELSE 'CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 1
From unrighteous living and all of my mistakes
It’s You who can save me my shackles You will break
I’ve sinned against You Lord strayed far from all Your laws
I will fall before You within Your holy house

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 2
With my remorseful heart when I appeal to You
Your light will shine through me my soul it will renew
Lord bless this gathering preserve our unity
Send us your spirit too as we call upon thee

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions' 
        END,
        lyrics_transliteration = 'CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 1
From unrighteous living and all of my mistakes
It’s You who can save me my shackles You will break
I’ve sinned against You Lord strayed far from all Your laws
I will fall before You within Your holy house

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 2
With my remorseful heart when I appeal to You
Your light will shine through me my soul it will renew
Lord bless this gathering preserve our unity
Send us your spirit too as we call upon thee

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions',
        updated_at = clock_timestamp()::text
    WHERE import_id = '021c1fab-872f-4083-b14c-35302b60274a'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 1
From unrighteous living and all of my mistakes
It’s You who can save me my shackles You will break
I’ve sinned against You Lord strayed far from all Your laws
I will fall before You within Your holy house

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions

VERSE 2
With my remorseful heart when I appeal to You
Your light will shine through me my soul it will renew
Lord bless this gathering preserve our unity
Send us your spirit too as we call upon thee

CHORUS
Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Our Heavenly Father Lord have mercy on us
You are compassionate give us Your forgiveness
Purify my soul God from all my transgressions
So I’m not enslaved to the world of corruptions
From unrighteous living and all of my mistakes
It’s You who can save me my shackles You will break
I’ve sinned against You Lord strayed far from all Your laws
I will fall before You within Your holy house
With my remorseful heart when I appeal to You
Your light will shine through me my soul it will renew
Lord bless this gathering preserve our unity
Send us your spirit too as we call upon thee'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '021c1fab-872f-4083-b14c-35302b60274a'::uuid, 'our-heavenly-father', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- seven-curtains-of-fire ("ሰባቱ መንጦላይት")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6c6fe730-bc8a-44d9-b0b0-b265b802cef2'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mentolayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Sebatu mebratoch wedet tesenadu

VERSE 1
Tanash mushra nesh yeasra amst amet
Tanash mushira nesh yasra amist amet
Beanchi lay sifets’em engda sirat
Banchi lay sifetsem ingida sirat

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mentolayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Sebatu mebratoch wedet tesenadu

VERSE 2
Where in You were those seven curtains of fire
Whereunto were arrayed seven lights of splendor
You were 15 years old, a young bride for the Groom
When this mystery became manifest in your womb

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mentolayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Sebatu mebratoch wedet tesenadu'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu

VERSE 1
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
Tanash mushira nesh yasra amist amet
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት
Banchi lay sifetsem ingida sirat

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu

VERSE 2
Where in You were those seven curtains of fire
Whereunto were arrayed seven lights of splendor
You were 15 years old, a young bride for the Groom
When this mystery became manifest in your womb

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu

VERSE 1
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
Tanash mushira nesh yasra amist amet
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት
Banchi lay sifetsem ingida sirat

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu

VERSE 2
Where in You were those seven curtains of fire
Whereunto were arrayed seven lights of splendor
You were 15 years old, a young bride for the Groom
When this mystery became manifest in your womb

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu' THEN lyrics_amharic 
          ELSE 'CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu

VERSE 1
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
Tanash mushira nesh yasra amist amet
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት
Banchi lay sifetsem ingida sirat

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu

VERSE 2
Where in You were those seven curtains of fire
Whereunto were arrayed seven lights of splendor
You were 15 years old, a young bride for the Groom
When this mystery became manifest in your womb

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu' 
        END,
        lyrics_transliteration = 'CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mentolayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Sebatu mebratoch wedet tesenadu

VERSE 1
Tanash mushra nesh yeasra amst amet
Tanash mushira nesh yasra amist amet
Beanchi lay sifets’em engda sirat
Banchi lay sifetsem ingida sirat

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mentolayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Sebatu mebratoch wedet tesenadu

VERSE 2
Where in You were those seven curtains of fire
Whereunto were arrayed seven lights of splendor
You were 15 years old, a young bride for the Groom
When this mystery became manifest in your womb

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mentolayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Sebatu mebratoch wedet tesenadu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6c6fe730-bc8a-44d9-b0b0-b265b802cef2'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu

VERSE 1
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
Tanash mushira nesh yasra amist amet
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት
Banchi lay sifetsem ingida sirat

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu

VERSE 2
Where in You were those seven curtains of fire
Whereunto were arrayed seven lights of splendor
You were 15 years old, a young bride for the Groom
When this mystery became manifest in your womb

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ሰባቱ መንጦላይት ወዴት ተጋረዱ
Sebatu mentolayt wedet tegaredu
ሰባቱ መብራቶች ወዴት ተሰናዱ
Sebatu mebratoch wedet tesenadu
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
Tanash mushira nesh yasra amist amet
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት
Banchi lay sifetsem ingida sirat
Where in You were those seven curtains of fire
Whereunto were arrayed seven lights of splendor
You were 15 years old, a young bride for the Groom
When this mystery became manifest in your womb'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6c6fe730-bc8a-44d9-b0b0-b265b802cef2'::uuid, 'seven-curtains-of-fire', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- your-name-gives-me-the-strength ("ስምሽ ጉልበት ሆኖኝ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4d53d668-6101-4243-ba1e-9b12755d2459'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 1
His son born from your womb your flesh He has embraced
The vessel for the world to be saved yes it''s true
Holiest of holies Virgin Mary it''s you
I will pass through the storm with my support Mary

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 2
My weakness will vanish under the shade you bring
Without you we could not have received medicine
The heavenly manna through you we were given
The father of David praise to the Creator

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 3
Blessings have filled my home through the interceder
Those who draw near to you in body and spirit
The heavenly reward from Him they''ll inherit
So that my soul be filled and I may not hunger

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 4
From your abundant well nourish me my mother
By entering your home finally I''m at peace
My clothes have been made new from the stain I''m released

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 1
His son born from your womb your flesh He has embraced
The vessel for the world to be saved yes it''s true
Holiest of holies Virgin Mary it''s you
I will pass through the storm with my support Mary

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 2
My weakness will vanish under the shade you bring
Without you we could not have received medicine
The heavenly manna through you we were given
The father of David praise to the Creator

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 3
Blessings have filled my home through the interceder
Those who draw near to you in body and spirit
The heavenly reward from Him they''ll inherit
So that my soul be filled and I may not hunger

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 4
From your abundant well nourish me my mother
By entering your home finally I''m at peace
My clothes have been made new from the stain I''m released

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 1
His son born from your womb your flesh He has embraced
The vessel for the world to be saved yes it''s true
Holiest of holies Virgin Mary it''s you
I will pass through the storm with my support Mary

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 2
My weakness will vanish under the shade you bring
Without you we could not have received medicine
The heavenly manna through you we were given
The father of David praise to the Creator

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 3
Blessings have filled my home through the interceder
Those who draw near to you in body and spirit
The heavenly reward from Him they''ll inherit
So that my soul be filled and I may not hunger

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 4
From your abundant well nourish me my mother
By entering your home finally I''m at peace
My clothes have been made new from the stain I''m released

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace' THEN lyrics_amharic 
          ELSE 'CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 1
His son born from your womb your flesh He has embraced
The vessel for the world to be saved yes it''s true
Holiest of holies Virgin Mary it''s you
I will pass through the storm with my support Mary

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 2
My weakness will vanish under the shade you bring
Without you we could not have received medicine
The heavenly manna through you we were given
The father of David praise to the Creator

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 3
Blessings have filled my home through the interceder
Those who draw near to you in body and spirit
The heavenly reward from Him they''ll inherit
So that my soul be filled and I may not hunger

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 4
From your abundant well nourish me my mother
By entering your home finally I''m at peace
My clothes have been made new from the stain I''m released

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace' 
        END,
        lyrics_transliteration = 'CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 1
His son born from your womb your flesh He has embraced
The vessel for the world to be saved yes it''s true
Holiest of holies Virgin Mary it''s you
I will pass through the storm with my support Mary

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 2
My weakness will vanish under the shade you bring
Without you we could not have received medicine
The heavenly manna through you we were given
The father of David praise to the Creator

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 3
Blessings have filled my home through the interceder
Those who draw near to you in body and spirit
The heavenly reward from Him they''ll inherit
So that my soul be filled and I may not hunger

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 4
From your abundant well nourish me my mother
By entering your home finally I''m at peace
My clothes have been made new from the stain I''m released

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4d53d668-6101-4243-ba1e-9b12755d2459'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 1
His son born from your womb your flesh He has embraced
The vessel for the world to be saved yes it''s true
Holiest of holies Virgin Mary it''s you
I will pass through the storm with my support Mary

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 2
My weakness will vanish under the shade you bring
Without you we could not have received medicine
The heavenly manna through you we were given
The father of David praise to the Creator

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 3
Blessings have filled my home through the interceder
Those who draw near to you in body and spirit
The heavenly reward from Him they''ll inherit
So that my soul be filled and I may not hunger

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace

VERSE 4
From your abundant well nourish me my mother
By entering your home finally I''m at peace
My clothes have been made new from the stain I''m released

CHORUS
Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Your name gives me the strength to climb up the mountain
I have passed through the snare with your intercession
Holy Virgin Mary I''ve broken free through your mediation
Above all creation He has filled you with grace
His son born from your womb your flesh He has embraced
The vessel for the world to be saved yes it''s true
Holiest of holies Virgin Mary it''s you
I will pass through the storm with my support Mary
My weakness will vanish under the shade you bring
Without you we could not have received medicine
The heavenly manna through you we were given
The father of David praise to the Creator
Blessings have filled my home through the interceder
Those who draw near to you in body and spirit
The heavenly reward from Him they''ll inherit
So that my soul be filled and I may not hunger
From your abundant well nourish me my mother
By entering your home finally I''m at peace
My clothes have been made new from the stain I''m released'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4d53d668-6101-4243-ba1e-9b12755d2459'::uuid, 'your-name-gives-me-the-strength', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kgll-kmelo ("ክግልል ክመልኦ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '788361cb-f6fc-4bb4-a582-0ce62a590f34'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 1
Az
Ts’emia''ye Maryam ts’dqi wuhiduni
Midrebeda libey siinelu t’eli
Weridu wihizu feleg nay fiቕrኺ

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 2
Setye niኽt’ell kemti ts’mue kelbi
Az
Siቕta wihit’uni nibeyney ab ts’elam
Ab eton kidrbe kebiduni hisem

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 3
Rediekni Dingil biesat keybeli
Gena aymeneኽwon''ti mamuቕ hiቑfoኺ
Az
Gibrey zenqelo fida kebiduni

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 4
Ab t’lqet nay siol gize newhuni
Esat mis weledki niesat mis ts’orki
Nits’elot tensia wedኺ mets’iuni
Az

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 5
Nab Kidus sigaኺ westay enkemaeri
Aedawey siine nibatey kizari
Mihretki azizu akaley ts’eginki
Bismki kishbshb kidan yiኹneni

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 6
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 1
ኣዝ
ጸሚአ''የ ማርያም ጽድቂ ዉሒዱኒ
ምድረበዳ ልበይ ስኢነሉ ጠሊ
ወሪዱ ውኂዙ ፈለግ ናይ ፍቕርኺ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 2
ሰትየ ንኽጠልል ከምቲ ጽሙእ ከልቢ
ኣዝ
ስቕታ ውሒጡኒ ንበይነይ ኣብ ጸላም
ኣብ እቶን ክድርበ ከቢዱኒ ሕሰም

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 3
ረዲእክኒ ድንግል ብእሳት ከይበሊ
ጌና ኣይመነኽዎን''ቲ ማሙቕ ሕቑፎኺ
ኣዝ
ግብረይ ዘንቀሎ ፍዳ ከቢዱኒ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 4
ኣብ ጥልቀት ናይ ሲኦል ጊዜ ነውኁኒ
እሳት ምስ ወለድኪ ንእሳት ምስ ፆርኪ
ንጸሎት ተንሢአ ወድኺ መጺኡኒ
ኣዝ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 5
ናብ ቅዱስ ሥጋኺ ወስታይ እንከማዕሪ
ኣእዳወይ ስኢነ ንብዓተይ ክዛሪ
ምሕረትኪ ዓዚዙ ኣካለይ ጸጊንኪ
ብስምኪ ክሽብሽብ ኪዳን ይኹነኒ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 6
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 1
ኣዝ
ጸሚአ''የ ማርያም ጽድቂ ዉሒዱኒ
ምድረበዳ ልበይ ስኢነሉ ጠሊ
ወሪዱ ውኂዙ ፈለግ ናይ ፍቕርኺ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 2
ሰትየ ንኽጠልል ከምቲ ጽሙእ ከልቢ
ኣዝ
ስቕታ ውሒጡኒ ንበይነይ ኣብ ጸላም
ኣብ እቶን ክድርበ ከቢዱኒ ሕሰም

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 3
ረዲእክኒ ድንግል ብእሳት ከይበሊ
ጌና ኣይመነኽዎን''ቲ ማሙቕ ሕቑፎኺ
ኣዝ
ግብረይ ዘንቀሎ ፍዳ ከቢዱኒ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 4
ኣብ ጥልቀት ናይ ሲኦል ጊዜ ነውኁኒ
እሳት ምስ ወለድኪ ንእሳት ምስ ፆርኪ
ንጸሎት ተንሢአ ወድኺ መጺኡኒ
ኣዝ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 5
ናብ ቅዱስ ሥጋኺ ወስታይ እንከማዕሪ
ኣእዳወይ ስኢነ ንብዓተይ ክዛሪ
ምሕረትኪ ዓዚዙ ኣካለይ ጸጊንኪ
ብስምኪ ክሽብሽብ ኪዳን ይኹነኒ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 6
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)' THEN lyrics_amharic 
          ELSE 'CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 1
ኣዝ
ጸሚአ''የ ማርያም ጽድቂ ዉሒዱኒ
ምድረበዳ ልበይ ስኢነሉ ጠሊ
ወሪዱ ውኂዙ ፈለግ ናይ ፍቕርኺ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 2
ሰትየ ንኽጠልል ከምቲ ጽሙእ ከልቢ
ኣዝ
ስቕታ ውሒጡኒ ንበይነይ ኣብ ጸላም
ኣብ እቶን ክድርበ ከቢዱኒ ሕሰም

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 3
ረዲእክኒ ድንግል ብእሳት ከይበሊ
ጌና ኣይመነኽዎን''ቲ ማሙቕ ሕቑፎኺ
ኣዝ
ግብረይ ዘንቀሎ ፍዳ ከቢዱኒ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 4
ኣብ ጥልቀት ናይ ሲኦል ጊዜ ነውኁኒ
እሳት ምስ ወለድኪ ንእሳት ምስ ፆርኪ
ንጸሎት ተንሢአ ወድኺ መጺኡኒ
ኣዝ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 5
ናብ ቅዱስ ሥጋኺ ወስታይ እንከማዕሪ
ኣእዳወይ ስኢነ ንብዓተይ ክዛሪ
ምሕረትኪ ዓዚዙ ኣካለይ ጸጊንኪ
ብስምኪ ክሽብሽብ ኪዳን ይኹነኒ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 6
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)' 
        END,
        lyrics_transliteration = 'CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 1
Az
Ts’emia''ye Maryam ts’dqi wuhiduni
Midrebeda libey siinelu t’eli
Weridu wihizu feleg nay fiቕrኺ

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 2
Setye niኽt’ell kemti ts’mue kelbi
Az
Siቕta wihit’uni nibeyney ab ts’elam
Ab eton kidrbe kebiduni hisem

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 3
Rediekni Dingil biesat keybeli
Gena aymeneኽwon''ti mamuቕ hiቑfoኺ
Az
Gibrey zenqelo fida kebiduni

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 4
Ab t’lqet nay siol gize newhuni
Esat mis weledki niesat mis ts’orki
Nits’elot tensia wedኺ mets’iuni
Az

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 5
Nab Kidus sigaኺ westay enkemaeri
Aedawey siine nibatey kizari
Mihretki azizu akaley ts’eginki
Bismki kishbshb kidan yiኹneni

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

VERSE 6
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)

CHORUS
Kigll kimelo bado etro libey
Bimhret kirewi ts’mat wisht’i nefsey
Amsaya lewuhatki nefsey etbhgo
Kinegr''ye fiቕra wisht’ey yibleni''lo (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '788361cb-f6fc-4bb4-a582-0ce62a590f34'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 1
ኣዝ
ጸሚአ''የ ማርያም ጽድቂ ዉሒዱኒ
ምድረበዳ ልበይ ስኢነሉ ጠሊ
ወሪዱ ውኂዙ ፈለግ ናይ ፍቕርኺ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 2
ሰትየ ንኽጠልል ከምቲ ጽሙእ ከልቢ
ኣዝ
ስቕታ ውሒጡኒ ንበይነይ ኣብ ጸላም
ኣብ እቶን ክድርበ ከቢዱኒ ሕሰም

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 3
ረዲእክኒ ድንግል ብእሳት ከይበሊ
ጌና ኣይመነኽዎን''ቲ ማሙቕ ሕቑፎኺ
ኣዝ
ግብረይ ዘንቀሎ ፍዳ ከቢዱኒ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 4
ኣብ ጥልቀት ናይ ሲኦል ጊዜ ነውኁኒ
እሳት ምስ ወለድኪ ንእሳት ምስ ፆርኪ
ንጸሎት ተንሢአ ወድኺ መጺኡኒ
ኣዝ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 5
ናብ ቅዱስ ሥጋኺ ወስታይ እንከማዕሪ
ኣእዳወይ ስኢነ ንብዓተይ ክዛሪ
ምሕረትኪ ዓዚዙ ኣካለይ ጸጊንኪ
ብስምኪ ክሽብሽብ ኪዳን ይኹነኒ

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

VERSE 6
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)

CHORUS
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)
ኣዝ...................
ጸሚአ''የ ማርያም ጽድቂ ዉሒዱኒ
ምድረበዳ ልበይ ስኢነሉ ጠሊ
ወሪዱ ውኂዙ ፈለግ ናይ ፍቕርኺ
ሰትየ ንኽጠልል ከምቲ ጽሙእ ከልቢ
ኣዝ...................
ስቕታ ውሒጡኒ ንበይነይ ኣብ ጸላም
ኣብ እቶን ክድርበ ከቢዱኒ ሕሰም
ረዲእክኒ ድንግል ብእሳት ከይበሊ
ጌና ኣይመነኽዎን''ቲ ማሙቕ ሕቑፎኺ
ኣዝ...................
ግብረይ ዘንቀሎ ፍዳ ከቢዱኒ
ኣብ ጥልቀት ናይ ሲኦል ጊዜ ነውኁኒ
እሳት ምስ ወለድኪ ንእሳት ምስ ፆርኪ
ንጸሎት ተንሢአ ወድኺ መጺኡኒ
ኣዝ...................
ናብ ቅዱስ ሥጋኺ ወስታይ እንከማዕሪ
ኣእዳወይ ስኢነ ንብዓተይ ክዛሪ
ምሕረትኪ ዓዚዙ ኣካለይ ጸጊንኪ
ብስምኪ ክሽብሽብ ኪዳን ይኹነኒ
ክግልል ክመልኦ ባዶ ዕትሮ ልበይ
ብምሕረት ክረዊ ጽምኣት ውሽጢ ነፍሰይ
ኣምሳያ ለዉሃትኪ ነፍሰይ እትብህጎ
ክነግር''የ ፍቕራ ውሽጠይ ይብለኒ''ሎ (2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '788361cb-f6fc-4bb4-a582-0ce62a590f34'::uuid, 'kgll-kmelo', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- in-cana-s-water ("በማየ ቃና")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '871ee49b-62fe-4842-8860-05a8544b8b28'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 1
Chosen among many in Cana''s water
The first of miracles in Cana''s water
Cana of Galilee in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 2
We witnessed the glory of Mary her intercession
When Mary told her son in Cana''s water
The barrels are empty in Cana''s water
The water turned to wine in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 3
For everyone to see in Cana''s water
He chose Cana as the first wonder with admiration
We witnessed the glory of Mary her intercession
Ushers of the wedding in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 4
Did not know what to do in Cana''s water
The Son of our Lady in Cana''s water
Their worries He subdued in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 5
We witnessed the glory of Mary her intercession
In turn we all believe in Cana''s water
The hope that we receive in Cana''s water
Through Marys Covenant in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 6
Everything will proceed in Cana''s water
Qanan liyadergat ye teamiru qedami sifra
Ye Dingilim kibir tegelete ye milja sira
Emebetachin banchi milja

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 7
Medhanealem teamir sera be maye Qana

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 1
Chosen among many in Cana''s water
The first of miracles in Cana''s water
Cana of Galilee in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 2
We witnessed the glory of Mary her intercession
When Mary told her son in Cana''s water
The barrels are empty in Cana''s water
The water turned to wine in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 3
For everyone to see in Cana''s water
He chose Cana as the first wonder with admiration
We witnessed the glory of Mary her intercession
Ushers of the wedding in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 4
Did not know what to do in Cana''s water
The Son of our Lady in Cana''s water
Their worries He subdued in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 5
We witnessed the glory of Mary her intercession
In turn we all believe in Cana''s water
The hope that we receive in Cana''s water
Through Marys Covenant in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 6
Everything will proceed in Cana''s water
Qanan liyadergat ye teamiru qedami sifra
Ye Dingilim kibir tegelete ye milja sira
Emebetachin banchi milja

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 7
Medhanealem teamir sera be maye Qana

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 1
Chosen among many in Cana''s water
The first of miracles in Cana''s water
Cana of Galilee in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 2
We witnessed the glory of Mary her intercession
When Mary told her son in Cana''s water
The barrels are empty in Cana''s water
The water turned to wine in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 3
For everyone to see in Cana''s water
He chose Cana as the first wonder with admiration
We witnessed the glory of Mary her intercession
Ushers of the wedding in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 4
Did not know what to do in Cana''s water
The Son of our Lady in Cana''s water
Their worries He subdued in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 5
We witnessed the glory of Mary her intercession
In turn we all believe in Cana''s water
The hope that we receive in Cana''s water
Through Marys Covenant in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 6
Everything will proceed in Cana''s water
Qanan liyadergat ye teamiru qedami sifra
Ye Dingilim kibir tegelete ye milja sira
Emebetachin banchi milja

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 7
Medhanealem teamir sera be maye Qana

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water' THEN lyrics_amharic 
          ELSE 'CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 1
Chosen among many in Cana''s water
The first of miracles in Cana''s water
Cana of Galilee in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 2
We witnessed the glory of Mary her intercession
When Mary told her son in Cana''s water
The barrels are empty in Cana''s water
The water turned to wine in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 3
For everyone to see in Cana''s water
He chose Cana as the first wonder with admiration
We witnessed the glory of Mary her intercession
Ushers of the wedding in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 4
Did not know what to do in Cana''s water
The Son of our Lady in Cana''s water
Their worries He subdued in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 5
We witnessed the glory of Mary her intercession
In turn we all believe in Cana''s water
The hope that we receive in Cana''s water
Through Marys Covenant in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 6
Everything will proceed in Cana''s water
Qanan liyadergat ye teamiru qedami sifra
Ye Dingilim kibir tegelete ye milja sira
Emebetachin banchi milja

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 7
Medhanealem teamir sera be maye Qana

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water' 
        END,
        lyrics_transliteration = 'CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 1
Chosen among many in Cana''s water
The first of miracles in Cana''s water
Cana of Galilee in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 2
We witnessed the glory of Mary her intercession
When Mary told her son in Cana''s water
The barrels are empty in Cana''s water
The water turned to wine in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 3
For everyone to see in Cana''s water
He chose Cana as the first wonder with admiration
We witnessed the glory of Mary her intercession
Ushers of the wedding in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 4
Did not know what to do in Cana''s water
The Son of our Lady in Cana''s water
Their worries He subdued in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 5
We witnessed the glory of Mary her intercession
In turn we all believe in Cana''s water
The hope that we receive in Cana''s water
Through Marys Covenant in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 6
Everything will proceed in Cana''s water
Qanan liyadergat ye teamiru qedami sifra
Ye Dingilim kibir tegelete ye milja sira
Emebetachin banchi milja

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 7
Medhanealem teamir sera be maye Qana

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water',
        updated_at = clock_timestamp()::text
    WHERE import_id = '871ee49b-62fe-4842-8860-05a8544b8b28'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 1
Chosen among many in Cana''s water
The first of miracles in Cana''s water
Cana of Galilee in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 2
We witnessed the glory of Mary her intercession
When Mary told her son in Cana''s water
The barrels are empty in Cana''s water
The water turned to wine in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 3
For everyone to see in Cana''s water
He chose Cana as the first wonder with admiration
We witnessed the glory of Mary her intercession
Ushers of the wedding in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 4
Did not know what to do in Cana''s water
The Son of our Lady in Cana''s water
Their worries He subdued in Cana''s water
He chose Cana as the first wonder with admiration

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 5
We witnessed the glory of Mary her intercession
In turn we all believe in Cana''s water
The hope that we receive in Cana''s water
Through Marys Covenant in Cana''s water

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 6
Everything will proceed in Cana''s water
Qanan liyadergat ye teamiru qedami sifra
Ye Dingilim kibir tegelete ye milja sira
Emebetachin banchi milja

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water

VERSE 7
Medhanealem teamir sera be maye Qana

CHORUS
Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord in Cana''s water'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Our Blessed Lady Interceder
Virgin Mary Interceder
The savior performed a miracle in Cana''s water
From the wonders of Lord -- in Cana''s water
Chosen among many -- in Cana''s water
The first of miracles -- in Cana''s water
Cana of Galilee -- in Cana''s water
He chose Cana as the first wonder with admiration
We witnessed the glory of Mary her intercession
When Mary told her son -- in Cana''s water
The barrels are empty -- in Cana''s water
The water turned to wine -- in Cana''s water
For everyone to see -- in Cana''s water
He chose Cana as the first wonder with admiration
We witnessed the glory of Mary her intercession
Ushers of the wedding -- in Cana''s water
Did not know what to do -- in Cana''s water
The Son of our Lady -- in Cana''s water
Their worries He subdued -- in Cana''s water
He chose Cana as the first wonder with admiration
We witnessed the glory of Mary her intercession
In turn we all believe -- in Cana''s water
The hope that we receive -- in Cana''s water
Through Marys Covenant -- in Cana''s water
Everything will proceed -- in Cana''s water
Qanan liyadergat ye teamiru qedami sifra
Ye Dingilim kibir tegelete ye milja sira
Emebetachin banchi milja
Medhanealem teamir sera be maye Qana'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '871ee49b-62fe-4842-8860-05a8544b8b28'::uuid, 'in-cana-s-water', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mother-of-god-virgin-mary ("እመቤቴ የአምላክ እናት")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4730c0e5-6b84-4c27-a915-c1d7e5b19719'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 1
My heart it will arise tuned for praise I will sing
Through my humility I give my offering
Zion you are near me Abraham''s holy tent
Mother of shining light it’s you I lean against

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 2
O Green Meadow of Peace the one He had chosen
Ark of the covenant you''re Isaiah''s virgin
Queen of heaven and Earth standing on the Lord''s right
Honor is due to her we will sing day and night

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 3
Dearest Virgin Mary the mother of us all
With your intercession save me so I don''t fall
Help me cross through the flames keep me on the right path
Death and defeat will cease since I have you at last

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 1
My heart it will arise tuned for praise I will sing
Through my humility I give my offering
Zion you are near me Abraham''s holy tent
Mother of shining light it’s you I lean against

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 2
O Green Meadow of Peace the one He had chosen
Ark of the covenant you''re Isaiah''s virgin
Queen of heaven and Earth standing on the Lord''s right
Honor is due to her we will sing day and night

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 3
Dearest Virgin Mary the mother of us all
With your intercession save me so I don''t fall
Help me cross through the flames keep me on the right path
Death and defeat will cease since I have you at last

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 1
My heart it will arise tuned for praise I will sing
Through my humility I give my offering
Zion you are near me Abraham''s holy tent
Mother of shining light it’s you I lean against

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 2
O Green Meadow of Peace the one He had chosen
Ark of the covenant you''re Isaiah''s virgin
Queen of heaven and Earth standing on the Lord''s right
Honor is due to her we will sing day and night

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 3
Dearest Virgin Mary the mother of us all
With your intercession save me so I don''t fall
Help me cross through the flames keep me on the right path
Death and defeat will cease since I have you at last

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High' THEN lyrics_amharic 
          ELSE 'CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 1
My heart it will arise tuned for praise I will sing
Through my humility I give my offering
Zion you are near me Abraham''s holy tent
Mother of shining light it’s you I lean against

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 2
O Green Meadow of Peace the one He had chosen
Ark of the covenant you''re Isaiah''s virgin
Queen of heaven and Earth standing on the Lord''s right
Honor is due to her we will sing day and night

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 3
Dearest Virgin Mary the mother of us all
With your intercession save me so I don''t fall
Help me cross through the flames keep me on the right path
Death and defeat will cease since I have you at last

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High' 
        END,
        lyrics_transliteration = 'CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 1
My heart it will arise tuned for praise I will sing
Through my humility I give my offering
Zion you are near me Abraham''s holy tent
Mother of shining light it’s you I lean against

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 2
O Green Meadow of Peace the one He had chosen
Ark of the covenant you''re Isaiah''s virgin
Queen of heaven and Earth standing on the Lord''s right
Honor is due to her we will sing day and night

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 3
Dearest Virgin Mary the mother of us all
With your intercession save me so I don''t fall
Help me cross through the flames keep me on the right path
Death and defeat will cease since I have you at last

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4730c0e5-6b84-4c27-a915-c1d7e5b19719'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 1
My heart it will arise tuned for praise I will sing
Through my humility I give my offering
Zion you are near me Abraham''s holy tent
Mother of shining light it’s you I lean against

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 2
O Green Meadow of Peace the one He had chosen
Ark of the covenant you''re Isaiah''s virgin
Queen of heaven and Earth standing on the Lord''s right
Honor is due to her we will sing day and night

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 3
Dearest Virgin Mary the mother of us all
With your intercession save me so I don''t fall
Help me cross through the flames keep me on the right path
Death and defeat will cease since I have you at last

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High
My heart it will arise tuned for praise I will sing
Through my humility I give my offering
Zion you are near me Abraham''s holy tent
Mother of shining light it’s you I lean against
O Green Meadow of Peace the one He had chosen
Ark of the covenant you''re Isaiah''s virgin
Queen of heaven and Earth standing on the Lord''s right
Honor is due to her we will sing day and night
Dearest Virgin Mary the mother of us all
With your intercession save me so I don''t fall
Help me cross through the flames keep me on the right path
Death and defeat will cease since I have you at last'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4730c0e5-6b84-4c27-a915-c1d7e5b19719'::uuid, 'mother-of-god-virgin-mary', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- you-are-my-reliance-2573 ("መመኪያዬ አንተ ነህ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f4b31d46-09b7-4598-b5a5-14d3bf59e8ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 1
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 2
Cleanse me of transgressions and from all of my sins
Let Your spirit renew my body from within
Kebedelem ants’agn degmom kehat’iate (2)
Bemenfes yitades melaw sewnete

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 3
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 4
My steep and hardened heart inclined to be prideful
It wanted vanity and thought it would not fall
Aqebetu libe bech’nch’aw tiebit
Ashebrqo neber alfers meslot

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 5
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 6
For the king who fasted wished to come in my life
It must be broken and leveled from any pride
Yets’om nigus memt’at siletenegere
Medeldel alebet eyetesebere

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 7
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 8
As You saved Susanna from false accusation
Save me from going down the path of transgression
Sosnan yadankat kehaset miskr
Enenm adnegn kaltasebe neger

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 9
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 1
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 2
Cleanse me of transgressions and from all of my sins
Let Your spirit renew my body from within
ከበደሌም አንጻኝ ደግሞም ከኃጢአቴ (2)
በመንፈስ ይታደስ መላው ሰውነቴ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 3
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 4
My steep and hardened heart inclined to be prideful
It wanted vanity and thought it would not fall
አቀበቱ ልቤ በጭንጫው ትዕቢት
አሸብርቆ ነበር አልፈርስ መስሎት

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 5
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 6
For the king who fasted wished to come in my life
It must be broken and leveled from any pride
የጾም ንጉሥ መምጣት ስለተነገረ
መደልደል አለበት እየተሰበረ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 7
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 8
As You saved Susanna from false accusation
Save me from going down the path of transgression
ሶስናን ያዳንካት ከሃሰት ምስክር
እኔንም አድነኝ ካልታሰበ ነገር

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 9
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 1
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 2
Cleanse me of transgressions and from all of my sins
Let Your spirit renew my body from within
ከበደሌም አንጻኝ ደግሞም ከኃጢአቴ (2)
በመንፈስ ይታደስ መላው ሰውነቴ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 3
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 4
My steep and hardened heart inclined to be prideful
It wanted vanity and thought it would not fall
አቀበቱ ልቤ በጭንጫው ትዕቢት
አሸብርቆ ነበር አልፈርስ መስሎት

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 5
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 6
For the king who fasted wished to come in my life
It must be broken and leveled from any pride
የጾም ንጉሥ መምጣት ስለተነገረ
መደልደል አለበት እየተሰበረ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 7
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 8
As You saved Susanna from false accusation
Save me from going down the path of transgression
ሶስናን ያዳንካት ከሃሰት ምስክር
እኔንም አድነኝ ካልታሰበ ነገር

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 9
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ' THEN lyrics_amharic 
          ELSE 'CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 1
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 2
Cleanse me of transgressions and from all of my sins
Let Your spirit renew my body from within
ከበደሌም አንጻኝ ደግሞም ከኃጢአቴ (2)
በመንፈስ ይታደስ መላው ሰውነቴ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 3
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 4
My steep and hardened heart inclined to be prideful
It wanted vanity and thought it would not fall
አቀበቱ ልቤ በጭንጫው ትዕቢት
አሸብርቆ ነበር አልፈርስ መስሎት

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 5
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 6
For the king who fasted wished to come in my life
It must be broken and leveled from any pride
የጾም ንጉሥ መምጣት ስለተነገረ
መደልደል አለበት እየተሰበረ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 7
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 8
As You saved Susanna from false accusation
Save me from going down the path of transgression
ሶስናን ያዳንካት ከሃሰት ምስክር
እኔንም አድነኝ ካልታሰበ ነገር

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 9
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ' 
        END,
        lyrics_transliteration = 'CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 1
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 2
Cleanse me of transgressions and from all of my sins
Let Your spirit renew my body from within
Kebedelem ants’agn degmom kehat’iate (2)
Bemenfes yitades melaw sewnete

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 3
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 4
My steep and hardened heart inclined to be prideful
It wanted vanity and thought it would not fall
Aqebetu libe bech’nch’aw tiebit
Ashebrqo neber alfers meslot

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 5
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 6
For the king who fasted wished to come in my life
It must be broken and leveled from any pride
Yets’om nigus memt’at siletenegere
Medeldel alebet eyetesebere

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 7
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 8
As You saved Susanna from false accusation
Save me from going down the path of transgression
Sosnan yadankat kehaset miskr
Enenm adnegn kaltasebe neger

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna

VERSE 9
I will give my life (2) unto You
My Creator and Lord where should I look for You
Hiyweten leante (2) biyalehu
Amlak yeene Geta yet agegnhalehu

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
Memekiyaye ante neh yenefse medagna
Temelket wede ene atst’egn ledagna',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f4b31d46-09b7-4598-b5a5-14d3bf59e8ec'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 1
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 2
Cleanse me of transgressions and from all of my sins
Let Your spirit renew my body from within
ከበደሌም አንጻኝ ደግሞም ከኃጢአቴ (2)
በመንፈስ ይታደስ መላው ሰውነቴ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 3
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 4
My steep and hardened heart inclined to be prideful
It wanted vanity and thought it would not fall
አቀበቱ ልቤ በጭንጫው ትዕቢት
አሸብርቆ ነበር አልፈርስ መስሎት

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 5
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 6
For the king who fasted wished to come in my life
It must be broken and leveled from any pride
የጾም ንጉሥ መምጣት ስለተነገረ
መደልደል አለበት እየተሰበረ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 7
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 8
As You saved Susanna from false accusation
Save me from going down the path of transgression
ሶስናን ያዳንካት ከሃሰት ምስክር
እኔንም አድነኝ ካልታሰበ ነገር

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ

VERSE 9
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ

CHORUS
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'VERSE 1:
You are my reliance for my life salvation
Look upon me do not give me to conviction
መመኪያዬ አንተ ነህ የነፍሴ መዳኛ
ተመልከት ወደ እኔ አትስጠኝ ለዳኛ
CHORUS:
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ
VERSE 2:
Cleanse me of transgressions and from all of my sins
Let Your spirit renew my body from within
ከበደሌም አንጻኝ ደግሞም ከኃጢአቴ (2)
በመንፈስ ይታደስ መላው ሰውነቴ
CHORUS:
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ
VERSE 3:
My steep and hardened heart inclined to be prideful
It wanted vanity and thought it would not fall
አቀበቱ ልቤ በጭንጫው ትዕቢት
አሸብርቆ ነበር አልፈርስ መስሎት
CHORUS:
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ
VERSE 4:
For the king who fasted wished to come in my life
It must be broken and leveled from any pride
የጾም ንጉሥ መምጣት ስለተነገረ
መደልደል አለበት እየተሰበረ
CHORUS:
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ
VERSE 5:
As You saved Susanna from false accusation
Save me from going down the path of transgression
ሶስናን ያዳንካት ከሃሰት ምስክር
እኔንም አድነኝ ካልታሰበ ነገር
CHORUS:
I will give my life (2) unto You
My Creator and Lord where should I look for You
ሕይወቴን ለአንተ (2) ብያለሁ
አምላክ የእኔ ጌታ የት አገኝሃለሁ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f4b31d46-09b7-4598-b5a5-14d3bf59e8ec'::uuid, 'you-are-my-reliance-2573', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beaferata-meder ("በኤፍራታ ምድር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '654d96bd-e4f7-4f00-831a-ba662b50856b'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 1
Mengawn belelit sit’ebqu eregnoch
Kesemaym semu talaq yemsrach
Bemelaekt girma midr sitabera
Yemiyasch’enq neber ejg yemiyasfera

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 2
Dingetm yesemay serawit tegelt’ew
Bandnet zemeru kenolot gar honew
Kibir leEgziabher bearyam bilew
Selamn bemdr bego fiqad lesew

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 3
Betelhem hedew getan tesalemu
Keenatu gara honew begrgm agegnut
Yemelaektn zema eregnoch aweru
Belyu misgana amlakn siyakebru

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 4
Bemezmur bihon fishe desta
Bedawit ketema tewelede Geta
Hits’an keenatu gar begrgm felegut
Ersu new lesewoch yednet milkt

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 1
መንጋውን በሌሊት ሲጠብቁ እረኞች
ከሰማይም ሰሙ ታላቅ የምስራች
በመላእክት ግርማ ምድር ስታበራ
የሚያስጨንቅ ነበር እጅግ የሚያስፈራ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 2
ድንገትም የሰማይ ሰራዊት ተገልጠው
ባንድነት ዘመሩ ከኖሎት ጋር ሆነው
ክብር ለእግዚአብሔር በአርያም ብለው
ሰላምን በምድር በጎ ፍቃድ ለሰው

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 3
ቤተልሄም ሄደው ጌታን ተሳለሙ
ከእናቱ ጋራ ሆነው በግርግም አገኙት
የመላእክትን ዜማ እረኞች አወሩ
በልዩ ምስጋና አምላክን ሲያከብሩ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 4
በመዝሙር ቢሆን ፍስሐ ደስታ
በዳዊት ከተማ ተወለደ ጌታ
ህፃን ከእናቱ ጋር በግርግም ፈለጉት
እርሱ ነው ለሰዎች የድነት ምልክት

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 1
መንጋውን በሌሊት ሲጠብቁ እረኞች
ከሰማይም ሰሙ ታላቅ የምስራች
በመላእክት ግርማ ምድር ስታበራ
የሚያስጨንቅ ነበር እጅግ የሚያስፈራ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 2
ድንገትም የሰማይ ሰራዊት ተገልጠው
ባንድነት ዘመሩ ከኖሎት ጋር ሆነው
ክብር ለእግዚአብሔር በአርያም ብለው
ሰላምን በምድር በጎ ፍቃድ ለሰው

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 3
ቤተልሄም ሄደው ጌታን ተሳለሙ
ከእናቱ ጋራ ሆነው በግርግም አገኙት
የመላእክትን ዜማ እረኞች አወሩ
በልዩ ምስጋና አምላክን ሲያከብሩ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 4
በመዝሙር ቢሆን ፍስሐ ደስታ
በዳዊት ከተማ ተወለደ ጌታ
ህፃን ከእናቱ ጋር በግርግም ፈለጉት
እርሱ ነው ለሰዎች የድነት ምልክት

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/' THEN lyrics_amharic 
          ELSE 'CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 1
መንጋውን በሌሊት ሲጠብቁ እረኞች
ከሰማይም ሰሙ ታላቅ የምስራች
በመላእክት ግርማ ምድር ስታበራ
የሚያስጨንቅ ነበር እጅግ የሚያስፈራ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 2
ድንገትም የሰማይ ሰራዊት ተገልጠው
ባንድነት ዘመሩ ከኖሎት ጋር ሆነው
ክብር ለእግዚአብሔር በአርያም ብለው
ሰላምን በምድር በጎ ፍቃድ ለሰው

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 3
ቤተልሄም ሄደው ጌታን ተሳለሙ
ከእናቱ ጋራ ሆነው በግርግም አገኙት
የመላእክትን ዜማ እረኞች አወሩ
በልዩ ምስጋና አምላክን ሲያከብሩ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 4
በመዝሙር ቢሆን ፍስሐ ደስታ
በዳዊት ከተማ ተወለደ ጌታ
ህፃን ከእናቱ ጋር በግርግም ፈለጉት
እርሱ ነው ለሰዎች የድነት ምልክት

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/' 
        END,
        lyrics_transliteration = 'CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 1
Mengawn belelit sit’ebqu eregnoch
Kesemaym semu talaq yemsrach
Bemelaekt girma midr sitabera
Yemiyasch’enq neber ejg yemiyasfera

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 2
Dingetm yesemay serawit tegelt’ew
Bandnet zemeru kenolot gar honew
Kibir leEgziabher bearyam bilew
Selamn bemdr bego fiqad lesew

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 3
Betelhem hedew getan tesalemu
Keenatu gara honew begrgm agegnut
Yemelaektn zema eregnoch aweru
Belyu misgana amlakn siyakebru

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 4
Bemezmur bihon fishe desta
Bedawit ketema tewelede Geta
Hits’an keenatu gar begrgm felegut
Ersu new lesewoch yednet milkt

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '654d96bd-e4f7-4f00-831a-ba662b50856b'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 1
መንጋውን በሌሊት ሲጠብቁ እረኞች
ከሰማይም ሰሙ ታላቅ የምስራች
በመላእክት ግርማ ምድር ስታበራ
የሚያስጨንቅ ነበር እጅግ የሚያስፈራ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 2
ድንገትም የሰማይ ሰራዊት ተገልጠው
ባንድነት ዘመሩ ከኖሎት ጋር ሆነው
ክብር ለእግዚአብሔር በአርያም ብለው
ሰላምን በምድር በጎ ፍቃድ ለሰው

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 3
ቤተልሄም ሄደው ጌታን ተሳለሙ
ከእናቱ ጋራ ሆነው በግርግም አገኙት
የመላእክትን ዜማ እረኞች አወሩ
በልዩ ምስጋና አምላክን ሲያከብሩ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 4
በመዝሙር ቢሆን ፍስሐ ደስታ
በዳዊት ከተማ ተወለደ ጌታ
ህፃን ከእናቱ ጋር በግርግም ፈለጉት
እርሱ ነው ለሰዎች የድነት ምልክት

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/'
        OR lyrics_amharic IS NOT DISTINCT FROM 'በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/
አዝ............
መንጋውን በሌሊት ሲጠብቁ እረኞች
ከሰማይም ሰሙ ታላቅ የምስራች
በመላእክት ግርማ ምድር ስታበራ
የሚያስጨንቅ ነበር እጅግ የሚያስፈራ
አዝ..........
ድንገትም የሰማይ ሰራዊት ተገልጠው
ባንድነት ዘመሩ ከኖሎት ጋር ሆነው
ክብር ለእግዚአብሔር በአርያም ብለው
ሰላምን በምድር በጎ ፍቃድ ለሰው
አዝ..........
ቤተልሄም ሄደው ጌታን ተሳለሙ
ከእናቱ ጋራ ሆነው በግርግም አገኙት
የመላእክትን ዜማ እረኞች አወሩ
በልዩ ምስጋና አምላክን ሲያከብሩ
አዝ.........
በመዝሙር ቢሆን ፍስሐ ደስታ
በዳዊት ከተማ ተወለደ ጌታ
ህፃን ከእናቱ ጋር በግርግም ፈለጉት
እርሱ ነው ለሰዎች የድነት ምልክት'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '654d96bd-e4f7-4f00-831a-ba662b50856b'::uuid, 'beaferata-meder', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nu-lemisigana-enitebaber ("ኑ ለምስጋና እንተባበር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd42ed1e7-4a84-4c58-9021-4764d6ade83d'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
Enmesret Andit Gubaye (x2)' THEN lyrics_amharic 
          ELSE 'CHORUS
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
        END,
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
    WHERE import_id = 'd42ed1e7-4a84-4c58-9021-4764d6ade83d'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
        OR lyrics_amharic IS NOT DISTINCT FROM 'Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd42ed1e7-4a84-4c58-9021-4764d6ade83d'::uuid, 'nu-lemisigana-enitebaber', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adigenal-bedeju ("አድገናል በደጁ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '16235d0a-b46a-4afa-8fcc-c323bdec9022'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 1
Kekbru zufan bete meqdesu
Silet’ebeqen qagnton menfesu
Belyu moges qomenal zare
Leredan melak yizen zimare

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 2
Abatachen melaku Mikael
Miljah birtu kibrhm new heyal (2)

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 3
Eyet’ebeqen qen ena lelit
Kebren taytenal honon bereket
Silewedeqe asch’eniqiyachn
Heyln lebsenal betadagiyachn

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 4
Abatachen

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 5
Simu kibrachn kinfu qit’rachn
Man ende Egziabher eredatachn
Mikru lelul lehyaw Geta
Midrtu titay bekbru berta

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 6
Abatachen

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 7
Tefqal ena yemote t’omar
Ahunm dejh meqdes limar
Zimaren lante yiኸw kelbe
Lekbrh zema beenba tajbe

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 8
Abatachen

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 1
ከክብሩ ዙፋን ቤተ መቅደሱ
ስለጠበቀን ቃኝቶን መንፈሱ
በልዩ ሞገስ ቆመናል ዛሬ
ለረዳን መላክ ይዘን ዝማሬ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 2
አባታችን መላኩ ሚካኤል
ምልጃህ ብርቱ ክብርህም ነው ሀያል/2/

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 3
እየጠበቀን ቀን እና ሌሊት
ከብረን ታይተናል ሆኖን በረከት
ስለወደቀ አስጨኒቂያችን
ሀይልን ለብሰናል በታዳጊያችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 4
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 5
ስሙ ክብራችን ክንፉ ቅጥራችን
ማን እንደ እግዚአብሔር እረዳታችን
ምክሩ ለልዑል ለህያው ጌታ
ምድርቱ ትታይ በክብሩ በርታ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 6
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 7
ተፍቃል እና የሞቴ ጦማር
አሁንም ደጅህ መቅደስ ልማር
ዝማሬን ላንተ ይኸው ከልቤ
ለክብርህ ዜማ በእንባ ታጅቤ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 8
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 1
ከክብሩ ዙፋን ቤተ መቅደሱ
ስለጠበቀን ቃኝቶን መንፈሱ
በልዩ ሞገስ ቆመናል ዛሬ
ለረዳን መላክ ይዘን ዝማሬ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 2
አባታችን መላኩ ሚካኤል
ምልጃህ ብርቱ ክብርህም ነው ሀያል/2/

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 3
እየጠበቀን ቀን እና ሌሊት
ከብረን ታይተናል ሆኖን በረከት
ስለወደቀ አስጨኒቂያችን
ሀይልን ለብሰናል በታዳጊያችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 4
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 5
ስሙ ክብራችን ክንፉ ቅጥራችን
ማን እንደ እግዚአብሔር እረዳታችን
ምክሩ ለልዑል ለህያው ጌታ
ምድርቱ ትታይ በክብሩ በርታ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 6
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 7
ተፍቃል እና የሞቴ ጦማር
አሁንም ደጅህ መቅደስ ልማር
ዝማሬን ላንተ ይኸው ከልቤ
ለክብርህ ዜማ በእንባ ታጅቤ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 8
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/' THEN lyrics_amharic 
          ELSE 'CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 1
ከክብሩ ዙፋን ቤተ መቅደሱ
ስለጠበቀን ቃኝቶን መንፈሱ
በልዩ ሞገስ ቆመናል ዛሬ
ለረዳን መላክ ይዘን ዝማሬ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 2
አባታችን መላኩ ሚካኤል
ምልጃህ ብርቱ ክብርህም ነው ሀያል/2/

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 3
እየጠበቀን ቀን እና ሌሊት
ከብረን ታይተናል ሆኖን በረከት
ስለወደቀ አስጨኒቂያችን
ሀይልን ለብሰናል በታዳጊያችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 4
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 5
ስሙ ክብራችን ክንፉ ቅጥራችን
ማን እንደ እግዚአብሔር እረዳታችን
ምክሩ ለልዑል ለህያው ጌታ
ምድርቱ ትታይ በክብሩ በርታ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 6
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 7
ተፍቃል እና የሞቴ ጦማር
አሁንም ደጅህ መቅደስ ልማር
ዝማሬን ላንተ ይኸው ከልቤ
ለክብርህ ዜማ በእንባ ታጅቤ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 8
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/' 
        END,
        lyrics_transliteration = 'CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 1
Kekbru zufan bete meqdesu
Silet’ebeqen qagnton menfesu
Belyu moges qomenal zare
Leredan melak yizen zimare

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 2
Abatachen melaku Mikael
Miljah birtu kibrhm new heyal (2)

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 3
Eyet’ebeqen qen ena lelit
Kebren taytenal honon bereket
Silewedeqe asch’eniqiyachn
Heyln lebsenal betadagiyachn

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 4
Abatachen

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 5
Simu kibrachn kinfu qit’rachn
Man ende Egziabher eredatachn
Mikru lelul lehyaw Geta
Midrtu titay bekbru berta

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 6
Abatachen

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 7
Tefqal ena yemote t’omar
Ahunm dejh meqdes limar
Zimaren lante yiኸw kelbe
Lekbrh zema beenba tajbe

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)

VERSE 8
Abatachen

CHORUS
Adgenal bedeju temegben keeju
Aynekanm kifu gebten beeqfu (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '16235d0a-b46a-4afa-8fcc-c323bdec9022'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 1
ከክብሩ ዙፋን ቤተ መቅደሱ
ስለጠበቀን ቃኝቶን መንፈሱ
በልዩ ሞገስ ቆመናል ዛሬ
ለረዳን መላክ ይዘን ዝማሬ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 2
አባታችን መላኩ ሚካኤል
ምልጃህ ብርቱ ክብርህም ነው ሀያል/2/

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 3
እየጠበቀን ቀን እና ሌሊት
ከብረን ታይተናል ሆኖን በረከት
ስለወደቀ አስጨኒቂያችን
ሀይልን ለብሰናል በታዳጊያችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 4
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 5
ስሙ ክብራችን ክንፉ ቅጥራችን
ማን እንደ እግዚአብሔር እረዳታችን
ምክሩ ለልዑል ለህያው ጌታ
ምድርቱ ትታይ በክብሩ በርታ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 6
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 7
ተፍቃል እና የሞቴ ጦማር
አሁንም ደጅህ መቅደስ ልማር
ዝማሬን ላንተ ይኸው ከልቤ
ለክብርህ ዜማ በእንባ ታጅቤ

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/

VERSE 8
አባታችን

CHORUS
አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/'
        OR lyrics_amharic IS NOT DISTINCT FROM 'አድገናል በደጁ ተመግበን ከእጁ
አይነካንም ክፉ ገብተን በእቅፉ/2/
አዝ
ከክብሩ ዙፋን ቤተ መቅደሱ
ስለጠበቀን ቃኝቶን መንፈሱ
በልዩ ሞገስ ቆመናል ዛሬ
ለረዳን መላክ ይዘን ዝማሬ
# አባታችን መላኩ ሚካኤል
ምልጃህ ብርቱ ክብርህም ነው ሀያል/2/
አዝ
እየጠበቀን ቀን እና ሌሊት
ከብረን ታይተናል ሆኖን በረከት
ስለወደቀ አስጨኒቂያችን
ሀይልን ለብሰናል በታዳጊያችን
#አባታችን.............
አዝ
ስሙ ክብራችን ክንፉ ቅጥራችን
ማን እንደ እግዚአብሔር እረዳታችን
ምክሩ ለልዑል ለህያው ጌታ
ምድርቱ ትታይ በክብሩ በርታ
#አባታችን................
አዝ
ተፍቃል እና የሞቴ ጦማር
አሁንም ደጅህ መቅደስ ልማር
ዝማሬን ላንተ ይኸው ከልቤ
ለክብርህ ዜማ በእንባ ታጅቤ
#አባታችን...............'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '16235d0a-b46a-4afa-8fcc-c323bdec9022'::uuid, 'adigenal-bedeju', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fetena-wejeb-bibeza ("ፈተና ወጀብ ቢበዛ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1a311c5a-b73d-4575-b9ed-c13aeaf6cdd6'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)

VERSE 1
Fiqr newu yenardos shto
Wededen teseqlo moto
Negodgwad mebreq bihonm
Behywet alen ahunm (2)

CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)

VERSE 2
Mekwannt dejun kifetu
Yets’egawu feltwal zeytu
Teragfwal shekmachn
Mihretu bifesln (2)

CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)

VERSE 3
Tets’nantwal arfwal libachn
Beesat tat’roal qit’rachn
Anwedqm anshenefm
Yizonal yeamlakachn sim (2)

CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)

VERSE 4
Hiywet neh yets’dq t’la
Yawqhel qal yetemela
Neh ante t’afach’ migbachn
Egziabher cheru amlakachn (2)

CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 1
ፍቅር ነዉ የናርዶስ ሽቶ
ወደደን ተሰቅሎ ሞቶ
ነጎድጓድ መብረቅ ቢሆንም
በህይወት አለን አሁንም/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 2
መኳንንት ደጁን ክፈቱ
የፀጋዉ ፈልቷል ዘይቱ
ተራግፏል ሸክማችን
ምህረቱ ቢፈስልን/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 3
ተጽናንቷል አርፏል ልባችን
በእሳት ታጥሮአል ቅጥራችን
አንወድቅም አንሸነፍም
ይዞናል የአምላካችን ስም/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 4
ሕይወት ነህ የፅድቅ ጥላ
ያውቅሐል ቃል የተመላ
ነህ አንተ ጣፋጭ ምግባችን
እግዚአብሔር ቸሩ አምላካችን/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 1
ፍቅር ነዉ የናርዶስ ሽቶ
ወደደን ተሰቅሎ ሞቶ
ነጎድጓድ መብረቅ ቢሆንም
በህይወት አለን አሁንም/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 2
መኳንንት ደጁን ክፈቱ
የፀጋዉ ፈልቷል ዘይቱ
ተራግፏል ሸክማችን
ምህረቱ ቢፈስልን/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 3
ተጽናንቷል አርፏል ልባችን
በእሳት ታጥሮአል ቅጥራችን
አንወድቅም አንሸነፍም
ይዞናል የአምላካችን ስም/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 4
ሕይወት ነህ የፅድቅ ጥላ
ያውቅሐል ቃል የተመላ
ነህ አንተ ጣፋጭ ምግባችን
እግዚአብሔር ቸሩ አምላካችን/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/' THEN lyrics_amharic 
          ELSE 'CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 1
ፍቅር ነዉ የናርዶስ ሽቶ
ወደደን ተሰቅሎ ሞቶ
ነጎድጓድ መብረቅ ቢሆንም
በህይወት አለን አሁንም/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 2
መኳንንት ደጁን ክፈቱ
የፀጋዉ ፈልቷል ዘይቱ
ተራግፏል ሸክማችን
ምህረቱ ቢፈስልን/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 3
ተጽናንቷል አርፏል ልባችን
በእሳት ታጥሮአል ቅጥራችን
አንወድቅም አንሸነፍም
ይዞናል የአምላካችን ስም/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 4
ሕይወት ነህ የፅድቅ ጥላ
ያውቅሐል ቃል የተመላ
ነህ አንተ ጣፋጭ ምግባችን
እግዚአብሔር ቸሩ አምላካችን/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/' 
        END,
        lyrics_transliteration = 'CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)

VERSE 1
Fiqr newu yenardos shto
Wededen teseqlo moto
Negodgwad mebreq bihonm
Behywet alen ahunm (2)

CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)

VERSE 2
Mekwannt dejun kifetu
Yets’egawu feltwal zeytu
Teragfwal shekmachn
Mihretu bifesln (2)

CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)

VERSE 3
Tets’nantwal arfwal libachn
Beesat tat’roal qit’rachn
Anwedqm anshenefm
Yizonal yeamlakachn sim (2)

CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)

VERSE 4
Hiywet neh yets’dq t’la
Yawqhel qal yetemela
Neh ante t’afach’ migbachn
Egziabher cheru amlakachn (2)

CHORUS
Fetena wejeb bibeza
Aytenal hizbun siyabeza
Behywet ande t’ertonal
Egziabher mech yitewenal (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1a311c5a-b73d-4575-b9ed-c13aeaf6cdd6'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 1
ፍቅር ነዉ የናርዶስ ሽቶ
ወደደን ተሰቅሎ ሞቶ
ነጎድጓድ መብረቅ ቢሆንም
በህይወት አለን አሁንም/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 2
መኳንንት ደጁን ክፈቱ
የፀጋዉ ፈልቷል ዘይቱ
ተራግፏል ሸክማችን
ምህረቱ ቢፈስልን/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 3
ተጽናንቷል አርፏል ልባችን
በእሳት ታጥሮአል ቅጥራችን
አንወድቅም አንሸነፍም
ይዞናል የአምላካችን ስም/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/

VERSE 4
ሕይወት ነህ የፅድቅ ጥላ
ያውቅሐል ቃል የተመላ
ነህ አንተ ጣፋጭ ምግባችን
እግዚአብሔር ቸሩ አምላካችን/2/

CHORUS
ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ፈተና ወጀብ ቢበዛ
አይተናል ሕዝቡን ሲያበዛ
በሕይወት አንዴ ጠርቶናል
እግዚአብሔር መች ይተወናል/2/
አዝ
ፍቅር ነዉ የናርዶስ ሽቶ
ወደደን ተሰቅሎ ሞቶ
ነጎድጓድ መብረቅ ቢሆንም
በህይወት አለን አሁንም/2/
አዝ
መኳንንት ደጁን ክፈቱ
የፀጋዉ ፈልቷል ዘይቱ
ተራግፏል ሸክማችን
ምህረቱ ቢፈስልን/2/
አዝ
ተጽናንቷል አርፏል ልባችን
በእሳት ታጥሮአል ቅጥራችን
አንወድቅም አንሸነፍም
ይዞናል የአምላካችን ስም/2/
አዝ
ሕይወት ነህ የፅድቅ ጥላ
ያውቅሐል ቃል የተመላ
ነህ አንተ ጣፋጭ ምግባችን
እግዚአብሔር ቸሩ አምላካችን/2/'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1a311c5a-b73d-4575-b9ed-c13aeaf6cdd6'::uuid, 'fetena-wejeb-bibeza', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- alpha-and-omega ("አልፋና ኦሜጋ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '83a143db-72ad-4886-b151-d893d631d167'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 1
Your call was holiness their response was disdain
Adam’s children were saved as you carried our pain
Your righteous holy hands with chains they were bounded
They were blinded to the forgiveness you granted

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 2
Always omnipresent from the seas to the skies
But they covered your face your glory they despised
They stood you for judgment in the court of Pilate
They handed you over the uproaring riots

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 3
Annas, Caiaphas too sought your condemnation
They sent you to Herod with a proclamation
Your flesh covered in blood from beatings you endured
They added to that pain suffering they assured

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 4
They nailed you to the cross my Lord the Prince of Peace
They put a crown of thorns on you the King of Kings
They pierced you on your side wounded their medicine
With your bound outstretched hands you carried our sins

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 5
All the soldiers mocked you as you hanged on the tree
I must never forget the price you paid for me

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 1
Your call was holiness their response was disdain
Adam’s children were saved as you carried our pain
Your righteous holy hands with chains they were bounded
They were blinded to the forgiveness you granted

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 2
Always omnipresent from the seas to the skies
But they covered your face your glory they despised
They stood you for judgment in the court of Pilate
They handed you over the uproaring riots

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 3
Annas, Caiaphas too sought your condemnation
They sent you to Herod with a proclamation
Your flesh covered in blood from beatings you endured
They added to that pain suffering they assured

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 4
They nailed you to the cross my Lord the Prince of Peace
They put a crown of thorns on you the King of Kings
They pierced you on your side wounded their medicine
With your bound outstretched hands you carried our sins

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 5
All the soldiers mocked you as you hanged on the tree
I must never forget the price you paid for me

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 1
Your call was holiness their response was disdain
Adam’s children were saved as you carried our pain
Your righteous holy hands with chains they were bounded
They were blinded to the forgiveness you granted

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 2
Always omnipresent from the seas to the skies
But they covered your face your glory they despised
They stood you for judgment in the court of Pilate
They handed you over the uproaring riots

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 3
Annas, Caiaphas too sought your condemnation
They sent you to Herod with a proclamation
Your flesh covered in blood from beatings you endured
They added to that pain suffering they assured

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 4
They nailed you to the cross my Lord the Prince of Peace
They put a crown of thorns on you the King of Kings
They pierced you on your side wounded their medicine
With your bound outstretched hands you carried our sins

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 5
All the soldiers mocked you as you hanged on the tree
I must never forget the price you paid for me

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you' THEN lyrics_amharic 
          ELSE 'CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 1
Your call was holiness their response was disdain
Adam’s children were saved as you carried our pain
Your righteous holy hands with chains they were bounded
They were blinded to the forgiveness you granted

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 2
Always omnipresent from the seas to the skies
But they covered your face your glory they despised
They stood you for judgment in the court of Pilate
They handed you over the uproaring riots

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 3
Annas, Caiaphas too sought your condemnation
They sent you to Herod with a proclamation
Your flesh covered in blood from beatings you endured
They added to that pain suffering they assured

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 4
They nailed you to the cross my Lord the Prince of Peace
They put a crown of thorns on you the King of Kings
They pierced you on your side wounded their medicine
With your bound outstretched hands you carried our sins

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 5
All the soldiers mocked you as you hanged on the tree
I must never forget the price you paid for me

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you' 
        END,
        lyrics_transliteration = 'CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 1
Your call was holiness their response was disdain
Adam’s children were saved as you carried our pain
Your righteous holy hands with chains they were bounded
They were blinded to the forgiveness you granted

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 2
Always omnipresent from the seas to the skies
But they covered your face your glory they despised
They stood you for judgment in the court of Pilate
They handed you over the uproaring riots

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 3
Annas, Caiaphas too sought your condemnation
They sent you to Herod with a proclamation
Your flesh covered in blood from beatings you endured
They added to that pain suffering they assured

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 4
They nailed you to the cross my Lord the Prince of Peace
They put a crown of thorns on you the King of Kings
They pierced you on your side wounded their medicine
With your bound outstretched hands you carried our sins

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 5
All the soldiers mocked you as you hanged on the tree
I must never forget the price you paid for me

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you',
        updated_at = clock_timestamp()::text
    WHERE import_id = '83a143db-72ad-4886-b151-d893d631d167'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 1
Your call was holiness their response was disdain
Adam’s children were saved as you carried our pain
Your righteous holy hands with chains they were bounded
They were blinded to the forgiveness you granted

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 2
Always omnipresent from the seas to the skies
But they covered your face your glory they despised
They stood you for judgment in the court of Pilate
They handed you over the uproaring riots

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 3
Annas, Caiaphas too sought your condemnation
They sent you to Herod with a proclamation
Your flesh covered in blood from beatings you endured
They added to that pain suffering they assured

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 4
They nailed you to the cross my Lord the Prince of Peace
They put a crown of thorns on you the King of Kings
They pierced you on your side wounded their medicine
With your bound outstretched hands you carried our sins

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you

VERSE 5
All the soldiers mocked you as you hanged on the tree
I must never forget the price you paid for me

CHORUS
Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Alpha and Omega by all you are worshipped
In the hands of traitors you were brought for verdict
They pushed and abused you they wanted to subdue
While inflicting torment Christ they said mocking you
Your call was holiness their response was disdain
Adam’s children were saved as you carried our pain
Your righteous holy hands with chains they were bounded
They were blinded to the forgiveness you granted
Always omnipresent from the seas to the skies
But they covered your face your glory they despised
They stood you for judgment in the court of Pilate
They handed you over the uproaring riots
Annas, Caiaphas too sought your condemnation
They sent you to Herod with a proclamation
Your flesh covered in blood from beatings you endured
They added to that pain suffering they assured
They nailed you to the cross my Lord the Prince of Peace
They put a crown of thorns on you the King of Kings
They pierced you on your side wounded their medicine
With your bound outstretched hands you carried our sins
All the soldiers mocked you as you hanged on the tree
I must never forget the price you paid for me'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '83a143db-72ad-4886-b151-d893d631d167'::uuid, 'alpha-and-omega', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  RAISE NOTICE 'Batch 31 executed successfully: 33 records processed.';
END $$;

COMMIT;
