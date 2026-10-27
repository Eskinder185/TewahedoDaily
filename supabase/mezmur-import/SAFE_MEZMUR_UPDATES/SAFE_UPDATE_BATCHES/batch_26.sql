-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 26 OF 32
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
  -- misirak-yetsehay-mewicha ("Misirak Yetsehay Mewicha")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '624dde77-3502-4b6f-8db0-27829da8b0cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 1
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 2
አባቶቻችን ያስተማሩን የበዛላቸው ፀጋ
አንቺን ስላሉ አትርፈዋል በረከት ልዩ ዋጋ
ከቀዳሞት አበው የወረስነው አለን ያንቺ ምስጋና
እንጠራሻለን በውዳሴ አብዝተን እንደገና

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 3
ቅዱስ አፍሬም ብሏል እንወድሻለን
እኛም ልጆቹ ነን እንወድሻለን እናከብርሻለን
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 4
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
በምስራቅ በኩል ለወጣልን የፀሃይ የወልድ እናት
በፅልመት ዘመን ፋኖስ ብርሃን የማጠፊ ነሽ መብራት

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 5
የዕርቅ ሰነድ የሰማዩ የኖህ ቀስተ ደመና
አምላክ ፊት ለኛ የሞትቆሚ ለምህረት ለልመና
አዛኝቷ እናት አስታራቂያችን ሆይ
ለነፍስ አምላጅ ነሽ ለስጋችን ሲሳይ ለስጋችን ሲሳይ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 6
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 7
የአዳም ዘር ሀጢያት የሌለብሽ ጉድፍ ያልተገኘብሽ
ባለፈው አለም በዚያ ዘመን ከሁሉም ንፅህይት ነሽ
በዚህም ዘመን በወዲያኛው አንዳንቺ ቅድስት የለም
መና ስንቅነሽ ለሚወድሽ አማላጅ ለአለም ጣዕም

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 8
እንዳአባቶቻችን ፍቅርሽ ለኛም ይብዛ
ስምሽ ሞገስ አለው ልብን የሚገዛ ልብን የሚገዛ
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 9
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 10
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 1
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 2
Abatochachn yastemarun yebezalachew ts’ega
Anchin silalu atrfewal bereket liyu waga
Keqedamot abew yeweresnew alen yanchi misgana
Ent’erashalen bewdase abzten endegena

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 3
Kidus afrem bilwal enwedshalen
Egnam lijochu nen enwedshalen enakebrshalen
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 4
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal
Bemsraq bekul lewet’aln yets’ehay yeweld enat
Bets’lmet zemen fanos birhan yemat’efi nesh mebrat

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 5
Yeerq sened yesemayu yenoh qeste demena
Amlak fit legna yemotqomi lemhret lelmena
Azagntwa enat astaraqiyachn hoy
Lenefs amlaj nesh lesgachn sisay lesgachn sisay

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 6
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 7
Yeadam zer het’iyat yelelebsh gudf yaltegegnebsh
Balefew alem beziya zemen kehulum nits’hyt nesh
Bezihm zemen bewediyagnaw andanchi Kidist yelem
Mena sinqnesh lemiwedsh amalaj lealem t’aem

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 8
Endaabatochachn fiqrsh legnam yibza
Simsh moges alew libn yemigeza libn yemigeza
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 9
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 10
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 1
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 2
አባቶቻችን ያስተማሩን የበዛላቸው ፀጋ
አንቺን ስላሉ አትርፈዋል በረከት ልዩ ዋጋ
ከቀዳሞት አበው የወረስነው አለን ያንቺ ምስጋና
እንጠራሻለን በውዳሴ አብዝተን እንደገና

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 3
ቅዱስ አፍሬም ብሏል እንወድሻለን
እኛም ልጆቹ ነን እንወድሻለን እናከብርሻለን
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 4
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
በምስራቅ በኩል ለወጣልን የፀሃይ የወልድ እናት
በፅልመት ዘመን ፋኖስ ብርሃን የማጠፊ ነሽ መብራት

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 5
የዕርቅ ሰነድ የሰማዩ የኖህ ቀስተ ደመና
አምላክ ፊት ለኛ የሞትቆሚ ለምህረት ለልመና
አዛኝቷ እናት አስታራቂያችን ሆይ
ለነፍስ አምላጅ ነሽ ለስጋችን ሲሳይ ለስጋችን ሲሳይ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 6
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 7
የአዳም ዘር ሀጢያት የሌለብሽ ጉድፍ ያልተገኘብሽ
ባለፈው አለም በዚያ ዘመን ከሁሉም ንፅህይት ነሽ
በዚህም ዘመን በወዲያኛው አንዳንቺ ቅድስት የለም
መና ስንቅነሽ ለሚወድሽ አማላጅ ለአለም ጣዕም

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 8
እንዳአባቶቻችን ፍቅርሽ ለኛም ይብዛ
ስምሽ ሞገስ አለው ልብን የሚገዛ ልብን የሚገዛ
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 9
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 10
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል',
        lyrics_transliteration = 'CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 1
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 2
Abatochachn yastemarun yebezalachew ts’ega
Anchin silalu atrfewal bereket liyu waga
Keqedamot abew yeweresnew alen yanchi misgana
Ent’erashalen bewdase abzten endegena

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 3
Kidus afrem bilwal enwedshalen
Egnam lijochu nen enwedshalen enakebrshalen
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 4
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal
Bemsraq bekul lewet’aln yets’ehay yeweld enat
Bets’lmet zemen fanos birhan yemat’efi nesh mebrat

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 5
Yeerq sened yesemayu yenoh qeste demena
Amlak fit legna yemotqomi lemhret lelmena
Azagntwa enat astaraqiyachn hoy
Lenefs amlaj nesh lesgachn sisay lesgachn sisay

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 6
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 7
Yeadam zer het’iyat yelelebsh gudf yaltegegnebsh
Balefew alem beziya zemen kehulum nits’hyt nesh
Bezihm zemen bewediyagnaw andanchi Kidist yelem
Mena sinqnesh lemiwedsh amalaj lealem t’aem

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 8
Endaabatochachn fiqrsh legnam yibza
Simsh moges alew libn yemigeza libn yemigeza
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 9
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 10
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '624dde77-3502-4b6f-8db0-27829da8b0cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 1
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 2
አባቶቻችን ያስተማሩን የበዛላቸው ፀጋ
አንቺን ስላሉ አትርፈዋል በረከት ልዩ ዋጋ
ከቀዳሞት አበው የወረስነው አለን ያንቺ ምስጋና
እንጠራሻለን በውዳሴ አብዝተን እንደገና

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 3
ቅዱስ አፍሬም ብሏል እንወድሻለን
እኛም ልጆቹ ነን እንወድሻለን እናከብርሻለን
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 4
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
በምስራቅ በኩል ለወጣልን የፀሃይ የወልድ እናት
በፅልመት ዘመን ፋኖስ ብርሃን የማጠፊ ነሽ መብራት

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 5
የዕርቅ ሰነድ የሰማዩ የኖህ ቀስተ ደመና
አምላክ ፊት ለኛ የሞትቆሚ ለምህረት ለልመና
አዛኝቷ እናት አስታራቂያችን ሆይ
ለነፍስ አምላጅ ነሽ ለስጋችን ሲሳይ ለስጋችን ሲሳይ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 6
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 7
የአዳም ዘር ሀጢያት የሌለብሽ ጉድፍ ያልተገኘብሽ
ባለፈው አለም በዚያ ዘመን ከሁሉም ንፅህይት ነሽ
በዚህም ዘመን በወዲያኛው አንዳንቺ ቅድስት የለም
መና ስንቅነሽ ለሚወድሽ አማላጅ ለአለም ጣዕም

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 8
እንዳአባቶቻችን ፍቅርሽ ለኛም ይብዛ
ስምሽ ሞገስ አለው ልብን የሚገዛ ልብን የሚገዛ
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 9
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 10
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '624dde77-3502-4b6f-8db0-27829da8b0cd'::uuid, 'misirak-yetsehay-mewicha', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selamish-zare-new ("Selamish Zare New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6191f5b4-9c37-4d57-a0f1-792c63fc4171'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ወዳንች መጥቷልና አምላክ ዘለዓለም /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
wedaniche metitwalina āmlak zelealem /2/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '6191f5b4-9c37-4d57-a0f1-792c63fc4171'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ወዳንች መጥቷልና አምላክ ዘለዓለም /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
wedaniche metitwalina āmlak zelealem /2/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6191f5b4-9c37-4d57-a0f1-792c63fc4171'::uuid, 'selamish-zare-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enamesegnihalen ("Enamesegnihalen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '75c44e9d-2a36-4d53-b3c7-bbfb388fef4f'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን',
        lyrics_transliteration = 'CHORUS
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
Ende qidusanu lekbrh enzemralen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '75c44e9d-2a36-4d53-b3c7-bbfb388fef4f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 1
~ አዝ ~

CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 2
ለአምላክ ወዳሴ ለፈጣሪ ክብር
ማለዳ ተነስተን ምስጋና ስንጀምር
የአባቶች ዝማሬ ቅኔ መወድሱ
ሲሰማ ደስ ይላል ከቤተመቅደሱ

CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 3
ሥረአተ ሰማይ በምድር ተሰርቶ
በአባቶች ልቦና የአምላክ ጥበብ መልቶ
ዝማሬ ፈለቀ ከታለቁ መቅደስ
በጥዑመ ዜማ ፈጣሪ ሊወደስ

CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 4
ድምፁ ቀስቀሰን ከቅዱስ ታራራ
የያሬድ ፅናፅል መስንቆ በገና
የፅዮን ደናግል ለመዝሙር ተነሱ
ሥሉስ ቅዱስ በሉ ስሙን አወድሱ

CHORUS
እናመሰግንሃለን
እናመሰግንሃለን (፪)
እንደ አባቶቻችን በማህሌት እንጠረሃለን
እንደ ቅዱሳኑ ለክብርህ እንዘምራለን

VERSE 5
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
Ende abatotchachin be-mahlet enterhalen
Ende kidusan le-kebrih enzemralen

VERSE 1
~ Az ~
Le-Amlak wedase le-fetari kibr
Maleda tenesten misgana sinjemir
Ye-abatoch zimare k’ene mewodisu
Sisema des yelal ke-betemekdesu

CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatotchachin be-mahlet enterhalen
Ende kidusan le-kebrih enzemralen

VERSE 2
Az

CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatotchachin be-mahlet enterhalen
Ende kidusan le-kebrih enzemralen

VERSE 3
Sire’ate semay be-mid’r teserto
Be-abatoch libona Ye-Amlak tibeb melto
Zimare feleke ke-taleku mekdes
Be-t’iyume zema fetari liwedes
Az

CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatotchachin be-mahlet enterhalen
Ende kidusan le-kebrih enzemralen

VERSE 4
Dimtsu keskesen ke-kidus tarara
Ye-Yared ts’nats’l mesenqo be-gena
Ye-Tsiyon denagel le-mezmur tenesu
Selus Kidus belu simun awodesu
Az

CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatotchachin be-mahlet enterhalen
Ende kidusan le-kebrih enzemralen

VERSE 5
Mahletu siqom se’at-at mezmuru
Kidusan mela’ekit abrew sizemru
Fitsum temeset’ech nefsachin be-desta
Le-misgana sinkom ke-kidusan tarta

CHORUS
Enamesegnhalen
Enamesegnhalen (2)
Ende abatotchachin be-mahlet enterhalen
Ende kidusan le-kebrih enzemralen';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '75c44e9d-2a36-4d53-b3c7-bbfb388fef4f'::uuid, 'enamesegnihalen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tenestual-rebuni-zemarit-fasika-mekonen ("Tenestual Rebuni Zemarit Fasika Mekonen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '70c96bb1-64bc-41fb-9a3d-ac5c3b4fbeb9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እንቅልፍ የለኝ ዛሬስ በምንጣፌ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Enqlf yelegn zares bemnt’afe'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '70c96bb1-64bc-41fb-9a3d-ac5c3b4fbeb9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እንቅልፍ የለኝ ዛሬስ በምንጣፌ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '70c96bb1-64bc-41fb-9a3d-ac5c3b4fbeb9'::uuid, 'tenestual-rebuni-zemarit-fasika-mekonen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yewededegn-geta ("Yewededegn Geta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5644a631-076c-4f6a-826a-ce990064c3c4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለኃያሉ ጌታ ምስጋና ይገባል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ጌታ እኮ ነው ይህን ያደረገ
አምላኬ ነው ለኔ የታመነው
በዘመኔ ሁሉ ድንቅን የፈፀመው
ጌታ እኮ ነው ይህን ያደረገ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
ሳይከብድብኝ የዓለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኔም ነኝ ይህቺ ናት ቃሌ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ናታኔም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 6
ህይወት ሰላምን ትቼ
የማይታይ አይቼ
ላንተ ብሰጥ ጀርባዬን
ልተዋወቅ ጠላቴን

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 7
የከበበኝ ውጊያ ነው
የተረፈኝ ፀፀት ነው
የሻርክልኝ ቁስለቴን
ተሰቅለህ ነው አባቴ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 8
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 9
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 10
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና ከአምላኬ ፊት ልስገድ
ወደላይ በሰማይ ወደታች በጥልቀት
አምላኬ የት አለ የምትገኝበት

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 11
አምላኬ የት አለ የምትገኝበት
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 12
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 13
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebal

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 2
Geta eko new yihn yaderege
Amlake new lene yetamenew
Bezemene hulu dinqn yefets’emew
Geta eko new yihn yaderege

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 3
Saykebdbgn yealem zina
Tenberkke list’h misgana
Miknyat alegn lemazenbele
Natanem negn yihchi nat qale

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 4
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn ende waga
Akeberkegn bante ts’ega

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 5
Natanem negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 6
Hiywet selamn tiche
Yemaytay ayche
Lante biset’ jerbayen
Litewaweq t’elaten

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 7
Yekebebegn wigiya new
Yeterefegn ts’ets’et new
Yesharklgn qusleten
Teseqleh new abate

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 8
Bewaga gezteኸgnal ena
Sileene dem keflehel ena
Bewaga gezteኸgnal ena
Sileene dem keflehel ena

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 9
Lisane yawjal kibrhn
Alresam Geta wiletahn
Lisane yawjal kibrhn
Alresam Geta wiletahn

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 10
Qidusun meswaet liul silemiwed
Min yizhe limt’ana keamlake fit lisged
Wedelay besemay wedetach bet’lqet
Amlake yet ale yemtgegnbet

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 11
Amlake yet ale yemtgegnbet
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 12
Yefet’erkew hulu yantew aydelem wey
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 13
Yefet’erkew hulu yantew aydelem wey

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለኃያሉ ጌታ ምስጋና ይገባል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ጌታ እኮ ነው ይህን ያደረገ
አምላኬ ነው ለኔ የታመነው
በዘመኔ ሁሉ ድንቅን የፈፀመው
ጌታ እኮ ነው ይህን ያደረገ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
ሳይከብድብኝ የዓለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኔም ነኝ ይህቺ ናት ቃሌ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ናታኔም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 6
ህይወት ሰላምን ትቼ
የማይታይ አይቼ
ላንተ ብሰጥ ጀርባዬን
ልተዋወቅ ጠላቴን

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 7
የከበበኝ ውጊያ ነው
የተረፈኝ ፀፀት ነው
የሻርክልኝ ቁስለቴን
ተሰቅለህ ነው አባቴ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 8
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 9
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 10
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና ከአምላኬ ፊት ልስገድ
ወደላይ በሰማይ ወደታች በጥልቀት
አምላኬ የት አለ የምትገኝበት

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 11
አምላኬ የት አለ የምትገኝበት
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 12
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 13
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ',
        lyrics_transliteration = 'CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebal

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 2
Geta eko new yihn yaderege
Amlake new lene yetamenew
Bezemene hulu dinqn yefets’emew
Geta eko new yihn yaderege

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 3
Saykebdbgn yealem zina
Tenberkke list’h misgana
Miknyat alegn lemazenbele
Natanem negn yihchi nat qale

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 4
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn ende waga
Akeberkegn bante ts’ega

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 5
Natanem negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 6
Hiywet selamn tiche
Yemaytay ayche
Lante biset’ jerbayen
Litewaweq t’elaten

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 7
Yekebebegn wigiya new
Yeterefegn ts’ets’et new
Yesharklgn qusleten
Teseqleh new abate

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 8
Bewaga gezteኸgnal ena
Sileene dem keflehel ena
Bewaga gezteኸgnal ena
Sileene dem keflehel ena

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 9
Lisane yawjal kibrhn
Alresam Geta wiletahn
Lisane yawjal kibrhn
Alresam Geta wiletahn

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 10
Qidusun meswaet liul silemiwed
Min yizhe limt’ana keamlake fit lisged
Wedelay besemay wedetach bet’lqet
Amlake yet ale yemtgegnbet

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 11
Amlake yet ale yemtgegnbet
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 12
Yefet’erkew hulu yantew aydelem wey
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 13
Yefet’erkew hulu yantew aydelem wey

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5644a631-076c-4f6a-826a-ce990064c3c4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለኃያሉ ጌታ ምስጋና ይገባል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ጌታ እኮ ነው ይህን ያደረገ
አምላኬ ነው ለኔ የታመነው
በዘመኔ ሁሉ ድንቅን የፈፀመው
ጌታ እኮ ነው ይህን ያደረገ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
ሳይከብድብኝ የዓለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኔም ነኝ ይህቺ ናት ቃሌ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ናታኔም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 6
ህይወት ሰላምን ትቼ
የማይታይ አይቼ
ላንተ ብሰጥ ጀርባዬን
ልተዋወቅ ጠላቴን

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 7
የከበበኝ ውጊያ ነው
የተረፈኝ ፀፀት ነው
የሻርክልኝ ቁስለቴን
ተሰቅለህ ነው አባቴ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 8
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 9
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 10
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና ከአምላኬ ፊት ልስገድ
ወደላይ በሰማይ ወደታች በጥልቀት
አምላኬ የት አለ የምትገኝበት

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 11
አምላኬ የት አለ የምትገኝበት
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 12
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 13
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5644a631-076c-4f6a-826a-ce990064c3c4'::uuid, 'yewededegn-geta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anichin-yeyaze-sew-min-yigolibetal ("Anichin Yeyaze Sew Min Yigolibetal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ed1738a4-6267-4a32-bc14-d5a5b8113b30'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ጸጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል/2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ጽድቅን አሸተትን የሕይወትሽን መዓዛ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቁፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ጸጋና ሀብት አለሽ/2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 1
Bereketsh bizu yedenagl genzeb
Yemskinan enat yerhuban qeleb
Lehulu megabi ts’egash yemaygodl
Simsh t’um migb kereheb yemiyast’l (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 2
Anchi bitmech’i kemskinwa bete
Ende met’mqu enat bezalgn hesete
Yeadis kidan qurban menber t’erep’eza
Ts’dqn ashetetn yehywetshn meaza (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 3
Libe tet’erat’ro kidanshn kalkeda
Limenam alwerdm alyzm aqufada
Hulun eyemolash memegeb tawqiyalesh
Bizqut yemayalq ts’egana hebt alesh (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 4
YeEgziabher marefiya korebawit washa
Yehywet wiha minch’ yehg mefsesha
Nebelbal tewahdosh muse anchin aytwal
Ch’amawn awlqo befitsh tedeftwal (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ጸጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል/2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ጽድቅን አሸተትን የሕይወትሽን መዓዛ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቁፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ጸጋና ሀብት አለሽ/2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/',
        lyrics_transliteration = 'CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 1
Bereketsh bizu yedenagl genzeb
Yemskinan enat yerhuban qeleb
Lehulu megabi ts’egash yemaygodl
Simsh t’um migb kereheb yemiyast’l (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 2
Anchi bitmech’i kemskinwa bete
Ende met’mqu enat bezalgn hesete
Yeadis kidan qurban menber t’erep’eza
Ts’dqn ashetetn yehywetshn meaza (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 3
Libe tet’erat’ro kidanshn kalkeda
Limenam alwerdm alyzm aqufada
Hulun eyemolash memegeb tawqiyalesh
Bizqut yemayalq ts’egana hebt alesh (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 4
YeEgziabher marefiya korebawit washa
Yehywet wiha minch’ yehg mefsesha
Nebelbal tewahdosh muse anchin aytwal
Ch’amawn awlqo befitsh tedeftwal (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ed1738a4-6267-4a32-bc14-d5a5b8113b30'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ጸጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል/2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ጽድቅን አሸተትን የሕይወትሽን መዓዛ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቁፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ጸጋና ሀብት አለሽ/2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ed1738a4-6267-4a32-bc14-d5a5b8113b30'::uuid, 'anichin-yeyaze-sew-min-yigolibetal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ante-yalkew-yihun-fasika-mekonen ("Ante Yalkew Yihun Fasika Mekonen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ef9ed40c-ee25-478a-bfca-8322e69931e3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 1
ከአባትም በላይ አባት ነህ አንተ
ይሙት ይጥፋ አትል ለተሳሳተ
እድሜ የምትጨምር ለንስሐ ግብር
ሁሌም ርህሩህ ነህ ዘላለም ፍቅር

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 2
የጠፋው ልጅህን በብዙ ታገስከኝ
ጆሮህ እንደሰማ መቼ ፈርድክብኝ
ድርሻዬን ወስጄ እጅግ አሳዝኜህ
በፍቅር ተቀበልከኝ እጅህን ዘርግተህ

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 3
ባትጠባበቀኝ ባትሆን ከኔ ጋራ
ይስቅብኝ ነበር ጠላት ባለጋራ
እየተንከባከብክ እንደ አይን ብሌን
በትላንትና ላይ ጨመርክለኝ ዛሬን

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 4
ሰው ምን ያስተውላል አንተ ነህ አዋቂ
መልካም እረኛዬ ሳትተኛ ጠባቂ
አንዲት በግ ፍለጋ መከራ ተቀብልክ
ደምህን አፈሰስክ ሥጋህንም ቆረስክ

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 1
Keabatm belay abat neh ante
Yimut yit’fa atl letesasate
Edme yemtch’emr lenshe gibr
Hulem rihruh neh zelalem fiqr

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 2
Yet’efaw lijhn bebzu tageskegn
Joroh endesema meche ferdkbgn
Dirshayen wesje ejg asazgneh
Befqr teqebelkegn ejhn zergteh

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 3
Batt’ebabeqegn bathon kene gara
Yisqbgn neber t’elat balegara
Eyetenkebakebk ende ayn bilen
Betlantna lay ch’emerklegn zaren

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 4
Sew min yastewlal ante neh awaqi
Melkam eregnaye sattegna t’ebaqi
Andit beg filega mekera teqeblk
Demhn afesesk sigahnm qoresk

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 1
ከአባትም በላይ አባት ነህ አንተ
ይሙት ይጥፋ አትል ለተሳሳተ
እድሜ የምትጨምር ለንስሐ ግብር
ሁሌም ርህሩህ ነህ ዘላለም ፍቅር

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 2
የጠፋው ልጅህን በብዙ ታገስከኝ
ጆሮህ እንደሰማ መቼ ፈርድክብኝ
ድርሻዬን ወስጄ እጅግ አሳዝኜህ
በፍቅር ተቀበልከኝ እጅህን ዘርግተህ

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 3
ባትጠባበቀኝ ባትሆን ከኔ ጋራ
ይስቅብኝ ነበር ጠላት ባለጋራ
እየተንከባከብክ እንደ አይን ብሌን
በትላንትና ላይ ጨመርክለኝ ዛሬን

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 4
ሰው ምን ያስተውላል አንተ ነህ አዋቂ
መልካም እረኛዬ ሳትተኛ ጠባቂ
አንዲት በግ ፍለጋ መከራ ተቀብልክ
ደምህን አፈሰስክ ሥጋህንም ቆረስክ

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)',
        lyrics_transliteration = 'CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 1
Keabatm belay abat neh ante
Yimut yit’fa atl letesasate
Edme yemtch’emr lenshe gibr
Hulem rihruh neh zelalem fiqr

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 2
Yet’efaw lijhn bebzu tageskegn
Joroh endesema meche ferdkbgn
Dirshayen wesje ejg asazgneh
Befqr teqebelkegn ejhn zergteh

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 3
Batt’ebabeqegn bathon kene gara
Yisqbgn neber t’elat balegara
Eyetenkebakebk ende ayn bilen
Betlantna lay ch’emerklegn zaren

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 4
Sew min yastewlal ante neh awaqi
Melkam eregnaye sattegna t’ebaqi
Andit beg filega mekera teqeblk
Demhn afesesk sigahnm qoresk

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ef9ed40c-ee25-478a-bfca-8322e69931e3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 1
ከአባትም በላይ አባት ነህ አንተ
ይሙት ይጥፋ አትል ለተሳሳተ
እድሜ የምትጨምር ለንስሐ ግብር
ሁሌም ርህሩህ ነህ ዘላለም ፍቅር

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 2
የጠፋው ልጅህን በብዙ ታገስከኝ
ጆሮህ እንደሰማ መቼ ፈርድክብኝ
ድርሻዬን ወስጄ እጅግ አሳዝኜህ
በፍቅር ተቀበልከኝ እጅህን ዘርግተህ

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 3
ባትጠባበቀኝ ባትሆን ከኔ ጋራ
ይስቅብኝ ነበር ጠላት ባለጋራ
እየተንከባከብክ እንደ አይን ብሌን
በትላንትና ላይ ጨመርክለኝ ዛሬን

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 4
ሰው ምን ያስተውላል አንተ ነህ አዋቂ
መልካም እረኛዬ ሳትተኛ ጠባቂ
አንዲት በግ ፍለጋ መከራ ተቀብልክ
ደምህን አፈሰስክ ሥጋህንም ቆረስክ

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ef9ed40c-ee25-478a-bfca-8322e69931e3'::uuid, 'ante-yalkew-yihun-fasika-mekonen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-3731 ("ERITREAN ORTHODOX TEWAHDO MEZMUR")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '708b5538-e7ab-4428-a807-b52570570da8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 1
ካብ ጸግኣ ጸጋ መሊኤን የእጋረይ ይስጉማ ክዳ
ሰሪ ኣውያት ልበይ ተሰርባ ዓዒይንተይ ባኣኣ እበዳ
ስውር ዘይረአ ሓዘን ውሽጢ ውሽጠይ መዐቐኒ
ኣልቦ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 2
ኣፈይ እንተ ኣጽቀጠ ተመልኪታ ዓዕይንተይ ኣብ ገጻ
ተንብቦ
ናዛዚት ሕዙናን ድንግል እመ ብርሃን
ብምሕረት ቅረቢ ህይወተ ንምድሓን

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 3
ድምጻ እንክናፍቕ ኣብ ኣፍ ቤተይ ኮይነ ይሕሉ ምምጸኣ
ክብረይ ግርማይ እንድያ ስልማት ናይ ቤተይ ሸነን ዝብል
በኣ ትኑግ ኣክሊል ጋሂ ልበይ ከይደፍኦ ሰላመይ ከይስሑ
ስማ ተመሪቀ ይልምን ኣምላኸይ ከንብረኒ ኣብ ጥፍሑ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 4
ኣነ መን ኮይነ''የ ኣብ ቤቱ ዝነብር
ነዓኪ ሒዘ የ ኪዳኑ ይዝክር
ዓለም ልቢ ጌራ ከይትልግስ ፍቅሪ ከይምቅር ደሃያ
ከይልምልም ሸኻኣ ከይዛሪ ማያ መሪሩ ጸሓያ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 5
ስምዒ ደኣ ነብሰይ ልሳንኪ እሞ ግትኢ ሰምሰም ግደፍዮ
ሓታቲ እንተ መጸ ክፈልጥ ጸሓይኪ ማርያም'' ያ በልዮ
መብራህቲ ናይ ቤተይ ቀንዴል ብርሃን ባና
ማርያም ኣደ ጎይታይ ይብጻሕኪ ምስጋና

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 6
ኣብቲ ደንበ ሰላም ''ቲ መኣዲ ህይወት መን ድያ ተአንግዶ
መን'' ያ ኪዳን ምሕረት ከርሳ ዝተቐብአ መድሕን ክውለዶ
ማርያመይ ክብል'' የ ከመስግን ''የ ኣነስ ከይሕዘለይ ልባ
ሰብ እካ ዝምስገን ይትረፍ ኣደ መድሕን ዘይውዳእ ህያባ ምስጢር ሰላም ጉዕዞይ ምሕረትኪ ''ዩ ድንግል

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 7
እንሆ ደው ኢለ ውዕለትኪ ይነግር
ናዛዚት ሕዙናን ድንግል እመ ብትሃን
ብምሕረት ቕረቢ ህይወተይ ንምድሓን

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 1
Kab ts’ega ts’ega melien yeegarey yisguma kida
Seri awyat libey teserba aiyntey baaa ebeda
Siwr zeyrea hazen wisht’i wisht’ey meaቐni
Albo

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 2
Afey ente ats’qet’e temelkita aeyntey ab gets’a
Tenbbo
Nazazit hizunan Dingil eme birhan
Bimhret qirebi hiywete nimdhan

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 3
Dimts’a enknafቕ ab af betey koyne yihlu mimts’ea
Kibrey girmay endya silmat nay betey shenen zibl
Bea tinug aklil gahi libey keydefo selamey keyshu
Sima temeriqe yilmn amlaኸy kenbreni ab t’fhu

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 4
Ane men koyne''ye ab betu zinebr
Neaki hize ye kidanu yizkr
Alem libi gera keytlgs fiqri keymqr dehaya
Keylmlm sheኻa keyzari maya meriru ts’ehaya

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 5
Simi dea nebsey lisanki emo giti semsem gidefyo
Hatati ente mets’e kifelt’ ts’ehayki Maryam'' ya belyo
Mebrahti nay betey qendel birhan bana
Maryam ade goytay yibts’ahki misgana

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 6
Abti denbe selam ''ti meadi hiywet men diya teangdo
Men'' ya kidan mihret kersa ziteቐba medhn kiwledo
Maryamey kibl'' ye kemesgn ''ye anes keyhzeley liba
Seb eka zimsgen yitref ade medhn zeywdae hiyaba mist’ir selam guezoy mihretki ''yu Dingil

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 7
Enho dew ile wieletki yinegr
Nazazit hizunan Dingil eme bithan
Bimhret ቕrebi hiywetey nimdhan

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 1
ካብ ጸግኣ ጸጋ መሊኤን የእጋረይ ይስጉማ ክዳ
ሰሪ ኣውያት ልበይ ተሰርባ ዓዒይንተይ ባኣኣ እበዳ
ስውር ዘይረአ ሓዘን ውሽጢ ውሽጠይ መዐቐኒ
ኣልቦ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 2
ኣፈይ እንተ ኣጽቀጠ ተመልኪታ ዓዕይንተይ ኣብ ገጻ
ተንብቦ
ናዛዚት ሕዙናን ድንግል እመ ብርሃን
ብምሕረት ቅረቢ ህይወተ ንምድሓን

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 3
ድምጻ እንክናፍቕ ኣብ ኣፍ ቤተይ ኮይነ ይሕሉ ምምጸኣ
ክብረይ ግርማይ እንድያ ስልማት ናይ ቤተይ ሸነን ዝብል
በኣ ትኑግ ኣክሊል ጋሂ ልበይ ከይደፍኦ ሰላመይ ከይስሑ
ስማ ተመሪቀ ይልምን ኣምላኸይ ከንብረኒ ኣብ ጥፍሑ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 4
ኣነ መን ኮይነ''የ ኣብ ቤቱ ዝነብር
ነዓኪ ሒዘ የ ኪዳኑ ይዝክር
ዓለም ልቢ ጌራ ከይትልግስ ፍቅሪ ከይምቅር ደሃያ
ከይልምልም ሸኻኣ ከይዛሪ ማያ መሪሩ ጸሓያ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 5
ስምዒ ደኣ ነብሰይ ልሳንኪ እሞ ግትኢ ሰምሰም ግደፍዮ
ሓታቲ እንተ መጸ ክፈልጥ ጸሓይኪ ማርያም'' ያ በልዮ
መብራህቲ ናይ ቤተይ ቀንዴል ብርሃን ባና
ማርያም ኣደ ጎይታይ ይብጻሕኪ ምስጋና

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 6
ኣብቲ ደንበ ሰላም ''ቲ መኣዲ ህይወት መን ድያ ተአንግዶ
መን'' ያ ኪዳን ምሕረት ከርሳ ዝተቐብአ መድሕን ክውለዶ
ማርያመይ ክብል'' የ ከመስግን ''የ ኣነስ ከይሕዘለይ ልባ
ሰብ እካ ዝምስገን ይትረፍ ኣደ መድሕን ዘይውዳእ ህያባ ምስጢር ሰላም ጉዕዞይ ምሕረትኪ ''ዩ ድንግል

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 7
እንሆ ደው ኢለ ውዕለትኪ ይነግር
ናዛዚት ሕዙናን ድንግል እመ ብትሃን
ብምሕረት ቕረቢ ህይወተይ ንምድሓን

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር',
        lyrics_transliteration = 'CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 1
Kab ts’ega ts’ega melien yeegarey yisguma kida
Seri awyat libey teserba aiyntey baaa ebeda
Siwr zeyrea hazen wisht’i wisht’ey meaቐni
Albo

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 2
Afey ente ats’qet’e temelkita aeyntey ab gets’a
Tenbbo
Nazazit hizunan Dingil eme birhan
Bimhret qirebi hiywete nimdhan

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 3
Dimts’a enknafቕ ab af betey koyne yihlu mimts’ea
Kibrey girmay endya silmat nay betey shenen zibl
Bea tinug aklil gahi libey keydefo selamey keyshu
Sima temeriqe yilmn amlaኸy kenbreni ab t’fhu

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 4
Ane men koyne''ye ab betu zinebr
Neaki hize ye kidanu yizkr
Alem libi gera keytlgs fiqri keymqr dehaya
Keylmlm sheኻa keyzari maya meriru ts’ehaya

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 5
Simi dea nebsey lisanki emo giti semsem gidefyo
Hatati ente mets’e kifelt’ ts’ehayki Maryam'' ya belyo
Mebrahti nay betey qendel birhan bana
Maryam ade goytay yibts’ahki misgana

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 6
Abti denbe selam ''ti meadi hiywet men diya teangdo
Men'' ya kidan mihret kersa ziteቐba medhn kiwledo
Maryamey kibl'' ye kemesgn ''ye anes keyhzeley liba
Seb eka zimsgen yitref ade medhn zeywdae hiyaba mist’ir selam guezoy mihretki ''yu Dingil

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 7
Enho dew ile wieletki yinegr
Nazazit hizunan Dingil eme bithan
Bimhret ቕrebi hiywetey nimdhan

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr',
        updated_at = clock_timestamp()::text
    WHERE import_id = '708b5538-e7ab-4428-a807-b52570570da8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 1
ካብ ጸግኣ ጸጋ መሊኤን የእጋረይ ይስጉማ ክዳ
ሰሪ ኣውያት ልበይ ተሰርባ ዓዒይንተይ ባኣኣ እበዳ
ስውር ዘይረአ ሓዘን ውሽጢ ውሽጠይ መዐቐኒ
ኣልቦ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 2
ኣፈይ እንተ ኣጽቀጠ ተመልኪታ ዓዕይንተይ ኣብ ገጻ
ተንብቦ
ናዛዚት ሕዙናን ድንግል እመ ብርሃን
ብምሕረት ቅረቢ ህይወተ ንምድሓን

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 3
ድምጻ እንክናፍቕ ኣብ ኣፍ ቤተይ ኮይነ ይሕሉ ምምጸኣ
ክብረይ ግርማይ እንድያ ስልማት ናይ ቤተይ ሸነን ዝብል
በኣ ትኑግ ኣክሊል ጋሂ ልበይ ከይደፍኦ ሰላመይ ከይስሑ
ስማ ተመሪቀ ይልምን ኣምላኸይ ከንብረኒ ኣብ ጥፍሑ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 4
ኣነ መን ኮይነ''የ ኣብ ቤቱ ዝነብር
ነዓኪ ሒዘ የ ኪዳኑ ይዝክር
ዓለም ልቢ ጌራ ከይትልግስ ፍቅሪ ከይምቅር ደሃያ
ከይልምልም ሸኻኣ ከይዛሪ ማያ መሪሩ ጸሓያ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 5
ስምዒ ደኣ ነብሰይ ልሳንኪ እሞ ግትኢ ሰምሰም ግደፍዮ
ሓታቲ እንተ መጸ ክፈልጥ ጸሓይኪ ማርያም'' ያ በልዮ
መብራህቲ ናይ ቤተይ ቀንዴል ብርሃን ባና
ማርያም ኣደ ጎይታይ ይብጻሕኪ ምስጋና

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 6
ኣብቲ ደንበ ሰላም ''ቲ መኣዲ ህይወት መን ድያ ተአንግዶ
መን'' ያ ኪዳን ምሕረት ከርሳ ዝተቐብአ መድሕን ክውለዶ
ማርያመይ ክብል'' የ ከመስግን ''የ ኣነስ ከይሕዘለይ ልባ
ሰብ እካ ዝምስገን ይትረፍ ኣደ መድሕን ዘይውዳእ ህያባ ምስጢር ሰላም ጉዕዞይ ምሕረትኪ ''ዩ ድንግል

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 7
እንሆ ደው ኢለ ውዕለትኪ ይነግር
ናዛዚት ሕዙናን ድንግል እመ ብትሃን
ብምሕረት ቕረቢ ህይወተይ ንምድሓን

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '708b5538-e7ab-4428-a807-b52570570da8'::uuid, 'eritrean-orthodox-tewahdo-mezmur-3731', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adihineni ("Adihineni")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '69628b3f-d7e3-4529-a960-66ff929fcc58'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው

VERSE 1
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው

CHORUS
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew

VERSE 1
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew

CHORUS
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው

VERSE 1
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው

CHORUS
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው',
        lyrics_transliteration = 'CHORUS
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew

VERSE 1
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew

CHORUS
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '69628b3f-d7e3-4529-a960-66ff929fcc58'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው

VERSE 1
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው

CHORUS
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '69628b3f-d7e3-4529-a960-66ff929fcc58'::uuid, 'adihineni', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-god-of-abraham ("The God of Abraham")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6e7e71b6-a7e6-40bb-a111-d3ba8ccb639f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ

VERSE 1
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ

CHORUS
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza

VERSE 1
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza

CHORUS
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '6e7e71b6-a7e6-40bb-a111-d3ba8ccb639f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ

VERSE 1
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ

CHORUS
የአብርሃም አምላክ የይስሐቅም ቤዛ
ወገኖቹን ሁሉ በራሱ ደም ገዛ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza

VERSE 1
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza

CHORUS
YeAbraham amlak yeYishaq beza
Wegenochun hulu berasu dem geza';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6e7e71b6-a7e6-40bb-a111-d3ba8ccb639f'::uuid, 'the-god-of-abraham', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemenifes-beewinet-zemari-diyakon-hawaz-tegegni-yikirita-ketesegnew-kuti ("Bemenifes Beewinet Zemari Diyakon Hawaz Tegegni Yikirita Ketesegnew Kutir 3 Yezimare Alibem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6b7e49e4-2bff-497d-8e1c-4adf0a4ec891'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 1
ውዴ አመልክሃለሁ ያለ ፍርሃት
በመንፈስ በእውነት ላምልክህ
ክብርን እያየሁ ላክብርህ
በሰሎሞን መቅደስ አልባዝንም

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 2
መንፈስህን በሥፍራ አልገድብም
ሥምህ ነው የአምልኮ ማዕከሌ
መቅደስህ ማደሪያ ነኝ ጌታዬ
በመንፈስ በእውነት ላምልክህ

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 3
ክብርን እያየሁ ላክብርህ

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 1
Wide amelkhalehu yale firhat
Bemenfes beewnet lamlkh
Kibrn eyayehu lakbrh
Beselomon meqdes albaznm

CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 2
Menfeshn besfra algedbm
Simh new yeamlko maekele
Meqdesh maderiya negn Getaye
Bemenfes beewnet lamlkh

CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 3
Kibrn eyayehu lakbrh

CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 1
ውዴ አመልክሃለሁ ያለ ፍርሃት
በመንፈስ በእውነት ላምልክህ
ክብርን እያየሁ ላክብርህ
በሰሎሞን መቅደስ አልባዝንም

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 2
መንፈስህን በሥፍራ አልገድብም
ሥምህ ነው የአምልኮ ማዕከሌ
መቅደስህ ማደሪያ ነኝ ጌታዬ
በመንፈስ በእውነት ላምልክህ

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 3
ክብርን እያየሁ ላክብርህ

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት',
        lyrics_transliteration = 'CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 1
Wide amelkhalehu yale firhat
Bemenfes beewnet lamlkh
Kibrn eyayehu lakbrh
Beselomon meqdes albaznm

CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 2
Menfeshn besfra algedbm
Simh new yeamlko maekele
Meqdesh maderiya negn Getaye
Bemenfes beewnet lamlkh

CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 3
Kibrn eyayehu lakbrh

CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6b7e49e4-2bff-497d-8e1c-4adf0a4ec891'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 1
ውዴ አመልክሃለሁ ያለ ፍርሃት
በመንፈስ በእውነት ላምልክህ
ክብርን እያየሁ ላክብርህ
በሰሎሞን መቅደስ አልባዝንም

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 2
መንፈስህን በሥፍራ አልገድብም
ሥምህ ነው የአምልኮ ማዕከሌ
መቅደስህ ማደሪያ ነኝ ጌታዬ
በመንፈስ በእውነት ላምልክህ

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 3
ክብርን እያየሁ ላክብርህ

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6b7e49e4-2bff-497d-8e1c-4adf0a4ec891'::uuid, 'bemenifes-beewinet-zemari-diyakon-hawaz-tegegni-yikirita-ketesegnew-kuti', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tigrgna-orthodex-mezmur-zemarit-hewan-gebreanenia ("tigrgna orthodex mezmur zemarit hewan gebreanenia")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '90f6b0cf-cd2a-4446-9e90-21e07d8bcbae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሳላ ኢየሱስ ኣቦ ሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Sala Iyesus abo selam'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '90f6b0cf-cd2a-4446-9e90-21e07d8bcbae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሳላ ኢየሱስ ኣቦ ሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '90f6b0cf-cd2a-4446-9e90-21e07d8bcbae'::uuid, 'tigrgna-orthodex-mezmur-zemarit-hewan-gebreanenia', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bekidanesh-tila-orthodox-memzur ("BEKIDANESH TILA / Orthodox memzur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '898811b8-4462-4976-83db-d8382ca5bcc0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 1
ረዳት እንደሌለኝ ሲፎክርብኝ
ያስፈነድቀኛል ታሪክ ተቀይሮ
ኪዳንሽ ደርሶልኝ ቀርቶ እንጉርጉሮ
፨አዉቃለዉ እናቴ ደካማ ነኝ እኔ

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 2
ሰናይ ምግባር ሳልይዝ ያበቃ ዘመኔ
ፍጹም ተስፋ ሳልቆርጥ ደጅሽን መጥናቴ
ሆነልኝ ኪዳንሽ ብርሀን ለህይወቴ
፨ልጅሽ ክንደ ብርቱ ሁሉንም ይችላል

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 3
የአሸናፊ እናቱ ብጽዕት ተብለሻል
ምስክር ነኝ እኔም ሰርቷል በእኔ ላይ
ለዳመነዉ ልቤ ወጥቶልኛል ፀሐይ
፨ያለዉን ከሚሽር ከሚያሳልፍ ቃሉን

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 4
ቢያሳልፍ ይቀላል ሰማይና ምድርን
እብለት በሌለበት በታመነዉ ኪዳን
ዛሬም እናታችን ልጆችሽ ታምነናል

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 1
Redat endelelegn sifokrbgn
Yasfenedqegnal tarik teqeyro
Kidansh dersolgn qerto engurguro
Awuqalewu enate dekama negn ene

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 2
Senay migbar salyz yabeqa zemene
Fits’um tesfa salqort’ dejshn met’nate
Honelgn kidansh birhen lehywete
Ljsh kinde birtu hulunm yichlal

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 3
Yeashenafi enatu bits’et tebleshal
Miskr negn enem sertwal beene lay
Ledamenewu libe wet’tolgnal ts’ehey
Yalewun kemishr kemiyasalf qalun

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 4
Biyasalf yiqelal semayna midrn
Eblet belelebet betamenewu kidan
Zarem enatachn lijochsh tamnenal

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 1
ረዳት እንደሌለኝ ሲፎክርብኝ
ያስፈነድቀኛል ታሪክ ተቀይሮ
ኪዳንሽ ደርሶልኝ ቀርቶ እንጉርጉሮ
፨አዉቃለዉ እናቴ ደካማ ነኝ እኔ

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 2
ሰናይ ምግባር ሳልይዝ ያበቃ ዘመኔ
ፍጹም ተስፋ ሳልቆርጥ ደጅሽን መጥናቴ
ሆነልኝ ኪዳንሽ ብርሀን ለህይወቴ
፨ልጅሽ ክንደ ብርቱ ሁሉንም ይችላል

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 3
የአሸናፊ እናቱ ብጽዕት ተብለሻል
ምስክር ነኝ እኔም ሰርቷል በእኔ ላይ
ለዳመነዉ ልቤ ወጥቶልኛል ፀሐይ
፨ያለዉን ከሚሽር ከሚያሳልፍ ቃሉን

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 4
ቢያሳልፍ ይቀላል ሰማይና ምድርን
እብለት በሌለበት በታመነዉ ኪዳን
ዛሬም እናታችን ልጆችሽ ታምነናል

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ',
        lyrics_transliteration = 'CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 1
Redat endelelegn sifokrbgn
Yasfenedqegnal tarik teqeyro
Kidansh dersolgn qerto engurguro
Awuqalewu enate dekama negn ene

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 2
Senay migbar salyz yabeqa zemene
Fits’um tesfa salqort’ dejshn met’nate
Honelgn kidansh birhen lehywete
Ljsh kinde birtu hulunm yichlal

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 3
Yeashenafi enatu bits’et tebleshal
Miskr negn enem sertwal beene lay
Ledamenewu libe wet’tolgnal ts’ehey
Yalewun kemishr kemiyasalf qalun

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 4
Biyasalf yiqelal semayna midrn
Eblet belelebet betamenewu kidan
Zarem enatachn lijochsh tamnenal

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '898811b8-4462-4976-83db-d8382ca5bcc0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 1
ረዳት እንደሌለኝ ሲፎክርብኝ
ያስፈነድቀኛል ታሪክ ተቀይሮ
ኪዳንሽ ደርሶልኝ ቀርቶ እንጉርጉሮ
፨አዉቃለዉ እናቴ ደካማ ነኝ እኔ

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 2
ሰናይ ምግባር ሳልይዝ ያበቃ ዘመኔ
ፍጹም ተስፋ ሳልቆርጥ ደጅሽን መጥናቴ
ሆነልኝ ኪዳንሽ ብርሀን ለህይወቴ
፨ልጅሽ ክንደ ብርቱ ሁሉንም ይችላል

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 3
የአሸናፊ እናቱ ብጽዕት ተብለሻል
ምስክር ነኝ እኔም ሰርቷል በእኔ ላይ
ለዳመነዉ ልቤ ወጥቶልኛል ፀሐይ
፨ያለዉን ከሚሽር ከሚያሳልፍ ቃሉን

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 4
ቢያሳልፍ ይቀላል ሰማይና ምድርን
እብለት በሌለበት በታመነዉ ኪዳን
ዛሬም እናታችን ልጆችሽ ታምነናል

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '898811b8-4462-4976-83db-d8382ca5bcc0'::uuid, 'bekidanesh-tila-orthodox-memzur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- milikite-nesh ("Milikite Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '674d7860-86ad-4084-b225-f6082aac76bb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 1
ፀጋሽ ጎብኝቶኝ ቃልኪዳንሽ(2)
እዝ
ተስፋ ያረግሁት አልተበተነም
እምባዬም መሬት ከቶ አልወደቀም

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 2
ለበጎ ሆነ ማልቀስ ማንባቴ
ሰላም ሰፈነ በእልፍኝ በቤቴ
ቅኔ ነጠቅሁኝ የአባ ጊዮርጊስን
ቆምኩኝ ቅዳሴ የህርያቆስን

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 3
የያሬድ ዜማ ሞላ በልቤ
የለም ወጀቡ ቀርባኝ መርከቤ
እዝ
ወገቤን ታጠቅሁ ጭንቀቴን ጥዬ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 4
ዛሬስ በደስታ ይፍሰስ እምባዬ
የሐዘን ልብሴን ድንግል ቀይራ
የደበዘዘው ህይወቴ በራ
የአራራይ ዜማ ዛሬ ተማርኩኝ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 5
ፍቅሯ አሸነፈኝ እጄን ሰጠሁኝ
ቅኔ በልቤ ተመላለሰ
የድንግል ክብር ውስጤ ነገሰ
እዝ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 6
የዘረጋሁት እጄ ተሞላ
ማርያም ሆናልኝ ጥላ ከለላ
የውስጤ ፀሎት ዛሬ ሌላ ነው
የድንግል ክብር ምልጃ ቀየረው

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 7
ዛሬ ጎጆዬ አንፀባረቀች
ያማረ ሰልፌ እንቁ መሰለች
ክንዴ ከፍ ከፍ አለልኝና
ሰዋሁ ለድንግል ይህን ምስጋና

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 8
ዘማሪ ዲያቆን አቤል መክበብ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 1
Ts’egash gobgntogn qalkidansh (2)
Ez
Tesfa yareghut altebetenem
Embayem meret keto alwedeqem

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 2
Lebego hone malqes manbate
Selam sefene beelfgn bebete
Qine net’eqhugn yeaba giyorgisn
Qomkugn qidase yehryaqosn

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 3
Yeyared zema mola belbe
Yelem wejebu qerbagn merkebe
Ez
Wegeben tat’eqhu ch’nqeten t’ye

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 4
Zares bedesta yifses embaye
Yehezen libsen Dingil qeyra
Yedebezezew hiywete bera
Yeararay zema zare temarkugn

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 5
Fiqrwa ashenefegn ejen set’ehugn
Qine belbe temelalese
Yedngl kibir wist’e negese
Ez

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 6
Yezeregahut eje temola
Maryam honalgn t’la kelela
Yewst’e ts’elot zare lela new
Yedngl kibir milja qeyerew

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 7
Zare gojoye ants’ebareqech
Yamare selfe enqu meselech
Kinde kef kef alelgnna
Sewahu ledngl yihn misgana

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 8
Zemari diyaqon abel mekbeb

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 1
ፀጋሽ ጎብኝቶኝ ቃልኪዳንሽ(2)
እዝ
ተስፋ ያረግሁት አልተበተነም
እምባዬም መሬት ከቶ አልወደቀም

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 2
ለበጎ ሆነ ማልቀስ ማንባቴ
ሰላም ሰፈነ በእልፍኝ በቤቴ
ቅኔ ነጠቅሁኝ የአባ ጊዮርጊስን
ቆምኩኝ ቅዳሴ የህርያቆስን

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 3
የያሬድ ዜማ ሞላ በልቤ
የለም ወጀቡ ቀርባኝ መርከቤ
እዝ
ወገቤን ታጠቅሁ ጭንቀቴን ጥዬ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 4
ዛሬስ በደስታ ይፍሰስ እምባዬ
የሐዘን ልብሴን ድንግል ቀይራ
የደበዘዘው ህይወቴ በራ
የአራራይ ዜማ ዛሬ ተማርኩኝ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 5
ፍቅሯ አሸነፈኝ እጄን ሰጠሁኝ
ቅኔ በልቤ ተመላለሰ
የድንግል ክብር ውስጤ ነገሰ
እዝ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 6
የዘረጋሁት እጄ ተሞላ
ማርያም ሆናልኝ ጥላ ከለላ
የውስጤ ፀሎት ዛሬ ሌላ ነው
የድንግል ክብር ምልጃ ቀየረው

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 7
ዛሬ ጎጆዬ አንፀባረቀች
ያማረ ሰልፌ እንቁ መሰለች
ክንዴ ከፍ ከፍ አለልኝና
ሰዋሁ ለድንግል ይህን ምስጋና

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 8
ዘማሪ ዲያቆን አቤል መክበብ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ',
        lyrics_transliteration = 'CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 1
Ts’egash gobgntogn qalkidansh (2)
Ez
Tesfa yareghut altebetenem
Embayem meret keto alwedeqem

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 2
Lebego hone malqes manbate
Selam sefene beelfgn bebete
Qine net’eqhugn yeaba giyorgisn
Qomkugn qidase yehryaqosn

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 3
Yeyared zema mola belbe
Yelem wejebu qerbagn merkebe
Ez
Wegeben tat’eqhu ch’nqeten t’ye

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 4
Zares bedesta yifses embaye
Yehezen libsen Dingil qeyra
Yedebezezew hiywete bera
Yeararay zema zare temarkugn

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 5
Fiqrwa ashenefegn ejen set’ehugn
Qine belbe temelalese
Yedngl kibir wist’e negese
Ez

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 6
Yezeregahut eje temola
Maryam honalgn t’la kelela
Yewst’e ts’elot zare lela new
Yedngl kibir milja qeyerew

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 7
Zare gojoye ants’ebareqech
Yamare selfe enqu meselech
Kinde kef kef alelgnna
Sewahu ledngl yihn misgana

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 8
Zemari diyaqon abel mekbeb

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '674d7860-86ad-4084-b225-f6082aac76bb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 1
ፀጋሽ ጎብኝቶኝ ቃልኪዳንሽ(2)
እዝ
ተስፋ ያረግሁት አልተበተነም
እምባዬም መሬት ከቶ አልወደቀም

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 2
ለበጎ ሆነ ማልቀስ ማንባቴ
ሰላም ሰፈነ በእልፍኝ በቤቴ
ቅኔ ነጠቅሁኝ የአባ ጊዮርጊስን
ቆምኩኝ ቅዳሴ የህርያቆስን

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 3
የያሬድ ዜማ ሞላ በልቤ
የለም ወጀቡ ቀርባኝ መርከቤ
እዝ
ወገቤን ታጠቅሁ ጭንቀቴን ጥዬ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 4
ዛሬስ በደስታ ይፍሰስ እምባዬ
የሐዘን ልብሴን ድንግል ቀይራ
የደበዘዘው ህይወቴ በራ
የአራራይ ዜማ ዛሬ ተማርኩኝ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 5
ፍቅሯ አሸነፈኝ እጄን ሰጠሁኝ
ቅኔ በልቤ ተመላለሰ
የድንግል ክብር ውስጤ ነገሰ
እዝ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 6
የዘረጋሁት እጄ ተሞላ
ማርያም ሆናልኝ ጥላ ከለላ
የውስጤ ፀሎት ዛሬ ሌላ ነው
የድንግል ክብር ምልጃ ቀየረው

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 7
ዛሬ ጎጆዬ አንፀባረቀች
ያማረ ሰልፌ እንቁ መሰለች
ክንዴ ከፍ ከፍ አለልኝና
ሰዋሁ ለድንግል ይህን ምስጋና

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 8
ዘማሪ ዲያቆን አቤል መክበብ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '674d7860-86ad-4084-b225-f6082aac76bb'::uuid, 'milikite-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bichawin-yehonewin-sew ("Bichawin Yehonewin Sew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6edb1d73-77a2-441a-8920-1ad4a8ac4d2c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 1
Hiywete miskrh new
Beegziabher yetewedede (x2)
Yididiya ene negn chernetu yemiyanoregn
Set’to set’to ayalqbet mihretu aygodlbet

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 2
Yene yewah yene Geta betgestu aget’kubet
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 3
Zemene miskrh new
Hiywete miskrh new
Gizen ayto yemaykedagn
Yishurun bilo yemit’eragn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 4
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 5
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 6
Gizen ayto yemaykedagn
Lije bilo yemit’eragn
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 7
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 8
Zemene miskrh new
Hiywete miskrh new
T’bebegnoch hayalan salu balet’egoch kibir yetemelu
Gebto sayew keberete qal at’eregn leandebete

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 9
Wedhalew belbe mezgeb enoralew qalkn simegeb
Adrashaye mesqelh zemari negn silekbrh
Bichawn yehonewn sew
Redat yelelewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 10
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው',
        lyrics_transliteration = 'CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 1
Hiywete miskrh new
Beegziabher yetewedede (x2)
Yididiya ene negn chernetu yemiyanoregn
Set’to set’to ayalqbet mihretu aygodlbet

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 2
Yene yewah yene Geta betgestu aget’kubet
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 3
Zemene miskrh new
Hiywete miskrh new
Gizen ayto yemaykedagn
Yishurun bilo yemit’eragn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 4
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 5
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 6
Gizen ayto yemaykedagn
Lije bilo yemit’eragn
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 7
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 8
Zemene miskrh new
Hiywete miskrh new
T’bebegnoch hayalan salu balet’egoch kibir yetemelu
Gebto sayew keberete qal at’eregn leandebete

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 9
Wedhalew belbe mezgeb enoralew qalkn simegeb
Adrashaye mesqelh zemari negn silekbrh
Bichawn yehonewn sew
Redat yelelewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 10
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6edb1d73-77a2-441a-8920-1ad4a8ac4d2c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6edb1d73-77a2-441a-8920-1ad4a8ac4d2c'::uuid, 'bichawin-yehonewin-sew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wede-misraq-eyu ("Wede Misraq Eyu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6926f9e0-41d1-4622-b3fc-e7f5d2f3a44c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 1
ወገኖች ተነሱ እናታችን መጣች
ስሟን ስንጠራ መቼ ትቀራለች
የተከዘን ልታጽናና ነይ ስንላት ትመጣለችና

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 2
የጽጌው ማኅሌት በጸሎት ሲጀመር
ማርያም ትመጣለች በደመና በአየር
ንዒ ስንል በሰዓታት
ልትባርከን ትመጣለች በእውነት

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 3
ፍልሰታ ሲጀመር ቃልኪዳን ገብታለች
የሌሊት ውዳሴ ንዒን ትሰማለች
ህፃናቱን በበረከት
ልትጎበኘን ትመጣለች በእውነት

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 4
በፍጹም ቸርነት እንዲምረን ጌታ
በአማላጅነትሽ ሁኝልን መከታ
እናታችን አለኝታችን
እንድናለን ድንግል አንቺን ይዘን

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 1
Wegenoch tenesu enatachen metach
Seman sint’era meche tik’eralach
Yetekezen letatsnana ney sinlat timetalachna

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 2
Yetsigew mahlet bets’elot sijemer
Maryam timetalach bedemena beayer
Ni sinl kesa’at
Letebarken timetalach beewnet

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 3
Fils’eta sijemer kal kidan gebtalach
Yelelit wudase ni tisemalach
Hits’anatun bereket
Letgobenyan timetalach beewnet

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 4
Befitsum cherinet endimren geta
Beamalaajinetish hunyln meketa
Enatachen alenytachen
Endinalen dingil anchin yizen

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 1
ወገኖች ተነሱ እናታችን መጣች
ስሟን ስንጠራ መቼ ትቀራለች
የተከዘን ልታጽናና ነይ ስንላት ትመጣለችና

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 2
የጽጌው ማኅሌት በጸሎት ሲጀመር
ማርያም ትመጣለች በደመና በአየር
ንዒ ስንል በሰዓታት
ልትባርከን ትመጣለች በእውነት

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 3
ፍልሰታ ሲጀመር ቃልኪዳን ገብታለች
የሌሊት ውዳሴ ንዒን ትሰማለች
ህፃናቱን በበረከት
ልትጎበኘን ትመጣለች በእውነት

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 4
በፍጹም ቸርነት እንዲምረን ጌታ
በአማላጅነትሽ ሁኝልን መከታ
እናታችን አለኝታችን
እንድናለን ድንግል አንቺን ይዘን

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)',
        lyrics_transliteration = 'CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 1
Wegenoch tenesu enatachen metach
Seman sint’era meche tik’eralach
Yetekezen letatsnana ney sinlat timetalachna

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 2
Yetsigew mahlet bets’elot sijemer
Maryam timetalach bedemena beayer
Ni sinl kesa’at
Letebarken timetalach beewnet

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 3
Fils’eta sijemer kal kidan gebtalach
Yelelit wudase ni tisemalach
Hits’anatun bereket
Letgobenyan timetalach beewnet

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 4
Befitsum cherinet endimren geta
Beamalaajinetish hunyln meketa
Enatachen alenytachen
Endinalen dingil anchin yizen

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6926f9e0-41d1-4622-b3fc-e7f5d2f3a44c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 1
ወገኖች ተነሱ እናታችን መጣች
ስሟን ስንጠራ መቼ ትቀራለች
የተከዘን ልታጽናና ነይ ስንላት ትመጣለችና

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 2
የጽጌው ማኅሌት በጸሎት ሲጀመር
ማርያም ትመጣለች በደመና በአየር
ንዒ ስንል በሰዓታት
ልትባርከን ትመጣለች በእውነት

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 3
ፍልሰታ ሲጀመር ቃልኪዳን ገብታለች
የሌሊት ውዳሴ ንዒን ትሰማለች
ህፃናቱን በበረከት
ልትጎበኘን ትመጣለች በእውነት

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 4
በፍጹም ቸርነት እንዲምረን ጌታ
በአማላጅነትሽ ሁኝልን መከታ
እናታችን አለኝታችን
እንድናለን ድንግል አንቺን ይዘን

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 1
Wegenoch tenesu enatachen metach
Seman sint’era meche tik’eralach
Yetekezen letatsnana ney sinlat timetalachna

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 2
Yetsigew mahlet bets’elot sijemer
Maryam timetalach bedemena beayer
Ni sinl kesa’at
Letebarken timetalach beewnet

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 3
Fils’eta sijemer kal kidan gebtalach
Yelelit wudase ni tisemalach
Hits’anatun bereket
Letgobenyan timetalach beewnet

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 4
Befitsum cherinet endimren geta
Beamalaajinetish hunyln meketa
Enatachen alenytachen
Endinalen dingil anchin yizen

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6926f9e0-41d1-4622-b3fc-e7f5d2f3a44c'::uuid, 'wede-misraq-eyu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gdn-kon ("gdn kon")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7a30d151-a97b-466e-9f69-b954ee7c521f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 1
ዝባነይእንዳ ተገርፈ ብዋርዋርታ ናይ ጸሓይ
ግብረይ ገዲዱኒ ተገሊለ
ኣርዑት ሓጥያት ኣብዝባነይ ጼረ
ቃና ቃንዛይ ዝሰመዕ ግንጎይታ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 2
ግድን ኮኖ መጸ ብሰማርያ
እንክንሰይ ንጽድቂ ዝጸማእኩ እመና
ሕፍኒ ማይ ክነፍገሉ ነቲ ናይ ማያት ጎይታ
ዓይኒ ልበይ ገብን ዝሸፈኖ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 3
ድፍር ኢለ ንፈዉሰይእማጎጉቶ
ትዘይንዕ እየሱስ ዝብልዎ
ኩለንትናይ ብፍቅሪ ረትዕ
ወዝቢ ጎፍ ዝበለኒ ዘይፈልጠኒ መሲሉ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 4
ኣበይ ከ ገሚተዮ ምኻነይ ዕላምኡ
ነገረኒ ዘርዚሩ ንግብረይ
ንኽምለስ ናብ ፈለማ ዉነይ
ካብ ፍላጻታት ሞት ሰዊሩኒ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 5
ኣቦ ምሕረት ኣብ ፍቅሩ ኣጽሊሉኒ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 1
Zibaneyenda tegerfe biwarwarta nay ts’ehay
Gibrey gediduni tegelile
Arut hat’yat abzbaney ts’ere
Qana qanzay zisemee gingoyta

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 2
Gidn kono mets’e bisemarya
Enknsey nits’dqi zits’emaeku emena
Hifni may kinefgelu neti nay mayat goyta
Ayni libey gebn zishefeno

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 3
Difr ile nifewuseyemagoguto
Tizeyne eyesus ziblwo
Kulentnay bifqri rete
Wezbi gof zibeleni zeyfelt’eni mesilu

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 4
Abey ke gemiteyo miኻney elamu
Negereni zerziru nigbrey
Niኽmles nab felema wuney
Kab filats’atat mot sewiruni

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 5
Abo mihret ab fiqru ats’liluni

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 1
ዝባነይእንዳ ተገርፈ ብዋርዋርታ ናይ ጸሓይ
ግብረይ ገዲዱኒ ተገሊለ
ኣርዑት ሓጥያት ኣብዝባነይ ጼረ
ቃና ቃንዛይ ዝሰመዕ ግንጎይታ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 2
ግድን ኮኖ መጸ ብሰማርያ
እንክንሰይ ንጽድቂ ዝጸማእኩ እመና
ሕፍኒ ማይ ክነፍገሉ ነቲ ናይ ማያት ጎይታ
ዓይኒ ልበይ ገብን ዝሸፈኖ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 3
ድፍር ኢለ ንፈዉሰይእማጎጉቶ
ትዘይንዕ እየሱስ ዝብልዎ
ኩለንትናይ ብፍቅሪ ረትዕ
ወዝቢ ጎፍ ዝበለኒ ዘይፈልጠኒ መሲሉ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 4
ኣበይ ከ ገሚተዮ ምኻነይ ዕላምኡ
ነገረኒ ዘርዚሩ ንግብረይ
ንኽምለስ ናብ ፈለማ ዉነይ
ካብ ፍላጻታት ሞት ሰዊሩኒ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 5
ኣቦ ምሕረት ኣብ ፍቅሩ ኣጽሊሉኒ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ',
        lyrics_transliteration = 'CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 1
Zibaneyenda tegerfe biwarwarta nay ts’ehay
Gibrey gediduni tegelile
Arut hat’yat abzbaney ts’ere
Qana qanzay zisemee gingoyta

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 2
Gidn kono mets’e bisemarya
Enknsey nits’dqi zits’emaeku emena
Hifni may kinefgelu neti nay mayat goyta
Ayni libey gebn zishefeno

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 3
Difr ile nifewuseyemagoguto
Tizeyne eyesus ziblwo
Kulentnay bifqri rete
Wezbi gof zibeleni zeyfelt’eni mesilu

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 4
Abey ke gemiteyo miኻney elamu
Negereni zerziru nigbrey
Niኽmles nab felema wuney
Kab filats’atat mot sewiruni

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 5
Abo mihret ab fiqru ats’liluni

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7a30d151-a97b-466e-9f69-b954ee7c521f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 1
ዝባነይእንዳ ተገርፈ ብዋርዋርታ ናይ ጸሓይ
ግብረይ ገዲዱኒ ተገሊለ
ኣርዑት ሓጥያት ኣብዝባነይ ጼረ
ቃና ቃንዛይ ዝሰመዕ ግንጎይታ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 2
ግድን ኮኖ መጸ ብሰማርያ
እንክንሰይ ንጽድቂ ዝጸማእኩ እመና
ሕፍኒ ማይ ክነፍገሉ ነቲ ናይ ማያት ጎይታ
ዓይኒ ልበይ ገብን ዝሸፈኖ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 3
ድፍር ኢለ ንፈዉሰይእማጎጉቶ
ትዘይንዕ እየሱስ ዝብልዎ
ኩለንትናይ ብፍቅሪ ረትዕ
ወዝቢ ጎፍ ዝበለኒ ዘይፈልጠኒ መሲሉ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 4
ኣበይ ከ ገሚተዮ ምኻነይ ዕላምኡ
ነገረኒ ዘርዚሩ ንግብረይ
ንኽምለስ ናብ ፈለማ ዉነይ
ካብ ፍላጻታት ሞት ሰዊሩኒ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 5
ኣቦ ምሕረት ኣብ ፍቅሩ ኣጽሊሉኒ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7a30d151-a97b-466e-9f69-b954ee7c521f'::uuid, 'gdn-kon', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eridagn-zim-atibel ("Eridagn Zim Atibel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7e6e1903-2d45-4491-a57e-bbfe2a333bc2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 1
ጨንቆኝ እጣራለሁ ጸጋ አጥታ ሕይወቴ
እባክህ አርመኝ እርዳኝ መድኃኒቴ
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ሥራ ጌታዬ አትናቀው

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 2
አዝ….
የክርስትና ኑሮ ሥርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በኃጢአት ተከስሼ
ሰላምና ፍቅር ነበር ክርስትና

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 3
እኔ ግን ተናወጽኩ አልጸናሁምና
አዝ….
ሥራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 4
ጽኑ መሠረት ነህ የሕይወት አለት
ህይወት የሰጠኸኝ ደርሰኸ እስከሞት
አዝ….
በለመለመ መስክ በዕረፍት ወኃ ዘንድ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 5
የምታሰማራ በጎችኸን የምትወድ
ይቅር በለኝና እግዚአብሔር አምላኬ
ለሚያድነው ስምህ ልኑር ተንበርክኬ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 1
Ch’enqogn et’aralehu ts’ega at’ta hiywete
Ebakh armegn erdagn medhanite
Libe dingay hono qalh alseberew
Yeejhn sira Getaye atnaqew

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 2
CHORUS
Yekrstna nuro siratun afrshe
Aleqsalehu Geta behat’iat tekesshe
Selamna fiqr neber kirstna

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 3
Ene gin tenawets’ku alts’enahumna
CHORUS
Sirayena qalh algenagn alugn
Bet’emamaw libe anten asazenkugn

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 4
Ts’nu meseret neh yehywet alet
Hiywet yeset’eኸgn derseኸ eskemot
CHORUS
Belemeleme mesk beereft weha zend

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 5
Yemtasemara begochኸn yemtwed
Yiqr belegnna Egziabher amlake
Lemiyadnew simh linur tenberkke

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 1
ጨንቆኝ እጣራለሁ ጸጋ አጥታ ሕይወቴ
እባክህ አርመኝ እርዳኝ መድኃኒቴ
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ሥራ ጌታዬ አትናቀው

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 2
አዝ….
የክርስትና ኑሮ ሥርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በኃጢአት ተከስሼ
ሰላምና ፍቅር ነበር ክርስትና

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 3
እኔ ግን ተናወጽኩ አልጸናሁምና
አዝ….
ሥራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 4
ጽኑ መሠረት ነህ የሕይወት አለት
ህይወት የሰጠኸኝ ደርሰኸ እስከሞት
አዝ….
በለመለመ መስክ በዕረፍት ወኃ ዘንድ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 5
የምታሰማራ በጎችኸን የምትወድ
ይቅር በለኝና እግዚአብሔር አምላኬ
ለሚያድነው ስምህ ልኑር ተንበርክኬ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት',
        lyrics_transliteration = 'CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 1
Ch’enqogn et’aralehu ts’ega at’ta hiywete
Ebakh armegn erdagn medhanite
Libe dingay hono qalh alseberew
Yeejhn sira Getaye atnaqew

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 2
CHORUS
Yekrstna nuro siratun afrshe
Aleqsalehu Geta behat’iat tekesshe
Selamna fiqr neber kirstna

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 3
Ene gin tenawets’ku alts’enahumna
CHORUS
Sirayena qalh algenagn alugn
Bet’emamaw libe anten asazenkugn

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 4
Ts’nu meseret neh yehywet alet
Hiywet yeset’eኸgn derseኸ eskemot
CHORUS
Belemeleme mesk beereft weha zend

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 5
Yemtasemara begochኸn yemtwed
Yiqr belegnna Egziabher amlake
Lemiyadnew simh linur tenberkke

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7e6e1903-2d45-4491-a57e-bbfe2a333bc2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 1
ጨንቆኝ እጣራለሁ ጸጋ አጥታ ሕይወቴ
እባክህ አርመኝ እርዳኝ መድኃኒቴ
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ሥራ ጌታዬ አትናቀው

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 2
አዝ….
የክርስትና ኑሮ ሥርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በኃጢአት ተከስሼ
ሰላምና ፍቅር ነበር ክርስትና

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 3
እኔ ግን ተናወጽኩ አልጸናሁምና
አዝ….
ሥራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 4
ጽኑ መሠረት ነህ የሕይወት አለት
ህይወት የሰጠኸኝ ደርሰኸ እስከሞት
አዝ….
በለመለመ መስክ በዕረፍት ወኃ ዘንድ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 5
የምታሰማራ በጎችኸን የምትወድ
ይቅር በለኝና እግዚአብሔር አምላኬ
ለሚያድነው ስምህ ልኑር ተንበርክኬ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7e6e1903-2d45-4491-a57e-bbfe2a333bc2'::uuid, 'eridagn-zim-atibel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- be-abate-bet-zemari-mikael-zebre-ortodox-mezmur-cover ("be abate bet zemari Mikael zebre ortodox mezmur cover")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6ca3928d-1230-4e27-8862-7061501eef4b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 1
እለት እለት እመጣለው አልቀረሁም ከደጃፍህ
ተምለስን እሰማለሁ አልነጠፈም ሁሌ ካፍህ
አልፍራህም እንደድሮ መደንገጡ የለም ከኔ
ከልሎኛል ግብዝነት አልታየኝም መባከኔ

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 2
የተግባር ሰው ልሁን ጌታ ቅዱስ ቃልህን ልኑረው
በአንደበቴ ብቻ ሳይሆን በስራዬም ልመስክረው
የልጅነቴ አምላክ እርዳኝ በመፈስ እጆችህ ልቃኝ
በልቤ ደግሞ ልመለስ በልምድ መመላለስ ይብቃኝ

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 3
የህይወት ምግብን አስጥሎ የርያን ምግብ የሚያስመኝ
ይዞኛል ክፉ አባዜ ለከንቱ ነገር ሚያደክመኝ
በህይወቴ ያረከውን ያንተን ፍቅር ልረዳው
ለደካማው እዘንልኝ አለማመኔን እርዳው

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 1
Elet elet emet’alew alqerehum kedejafh
Temlesn esemalehu alnet’efem hule kafh
Alfrahm endedro medenget’u yelem kene
Kellognal gibznet altayegnm mebakene

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 2
Yetegbar sew lihun Geta Kidus qalhn linurew
Beandebete bicha sayhon besrayem limeskrew
Yeljnete amlak erdagn bemefes ejochh liqagn
Belbe degmo limeles belmd memelales yibqagn

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 3
Yehywet migbn ast’lo yeryan migb yemiyasmegn
Yizognal kifu abaze lekentu neger miyadekmegn
Behywete yarekewn yanten fiqr liredaw
Ledekamaw ezenlgn alemamenen erdaw

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 1
እለት እለት እመጣለው አልቀረሁም ከደጃፍህ
ተምለስን እሰማለሁ አልነጠፈም ሁሌ ካፍህ
አልፍራህም እንደድሮ መደንገጡ የለም ከኔ
ከልሎኛል ግብዝነት አልታየኝም መባከኔ

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 2
የተግባር ሰው ልሁን ጌታ ቅዱስ ቃልህን ልኑረው
በአንደበቴ ብቻ ሳይሆን በስራዬም ልመስክረው
የልጅነቴ አምላክ እርዳኝ በመፈስ እጆችህ ልቃኝ
በልቤ ደግሞ ልመለስ በልምድ መመላለስ ይብቃኝ

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 3
የህይወት ምግብን አስጥሎ የርያን ምግብ የሚያስመኝ
ይዞኛል ክፉ አባዜ ለከንቱ ነገር ሚያደክመኝ
በህይወቴ ያረከውን ያንተን ፍቅር ልረዳው
ለደካማው እዘንልኝ አለማመኔን እርዳው

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው',
        lyrics_transliteration = 'CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 1
Elet elet emet’alew alqerehum kedejafh
Temlesn esemalehu alnet’efem hule kafh
Alfrahm endedro medenget’u yelem kene
Kellognal gibznet altayegnm mebakene

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 2
Yetegbar sew lihun Geta Kidus qalhn linurew
Beandebete bicha sayhon besrayem limeskrew
Yeljnete amlak erdagn bemefes ejochh liqagn
Belbe degmo limeles belmd memelales yibqagn

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 3
Yehywet migbn ast’lo yeryan migb yemiyasmegn
Yizognal kifu abaze lekentu neger miyadekmegn
Behywete yarekewn yanten fiqr liredaw
Ledekamaw ezenlgn alemamenen erdaw

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6ca3928d-1230-4e27-8862-7061501eef4b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 1
እለት እለት እመጣለው አልቀረሁም ከደጃፍህ
ተምለስን እሰማለሁ አልነጠፈም ሁሌ ካፍህ
አልፍራህም እንደድሮ መደንገጡ የለም ከኔ
ከልሎኛል ግብዝነት አልታየኝም መባከኔ

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 2
የተግባር ሰው ልሁን ጌታ ቅዱስ ቃልህን ልኑረው
በአንደበቴ ብቻ ሳይሆን በስራዬም ልመስክረው
የልጅነቴ አምላክ እርዳኝ በመፈስ እጆችህ ልቃኝ
በልቤ ደግሞ ልመለስ በልምድ መመላለስ ይብቃኝ

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 3
የህይወት ምግብን አስጥሎ የርያን ምግብ የሚያስመኝ
ይዞኛል ክፉ አባዜ ለከንቱ ነገር ሚያደክመኝ
በህይወቴ ያረከውን ያንተን ፍቅር ልረዳው
ለደካማው እዘንልኝ አለማመኔን እርዳው

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6ca3928d-1230-4e27-8862-7061501eef4b'::uuid, 'be-abate-bet-zemari-mikael-zebre-ortodox-mezmur-cover', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- like-mezemeran-tewodros-yoseph ("Like Mezemeran Tewodros Yoseph")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '750846c3-c041-4f6f-a7a7-fbd5c1d13d29'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 1
እንደ አባቴ ዳዊት በበገና እዘምራለሁ
ቀን ከሌሊት ሳልል ለምስጋና እተጋለሁ
የኃጢአቴ ቁስል እንዲፈወስ እጮሃለሁ
ምርኩዜ ነሽና እመቤቴ በአንቺ እመካለሁ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 2
አ.ዝ \\
እመቤቴ በእውነት እንወድሻለን
የእውነተኛ መብል ክርስቶስን ወለድሽልን
ምክንያተ ድሂን ሆይ ድንግልማርያም የአምላክመገኛ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 3
በአማላጅነትሽ በመታመን እንጮሃን እኛ
ምሕረትን አድይን ኪዳነምህረት የዓለም መዳኛ
አ.ዝ \\
ስለ ቸርነትሽ እመቤቴ ለእኔ እናቴ ነሽ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 4
ስለ ንግሥትነትሽ እመቤቴ ነሽ
ዝናባት ሳያጠጡት አየራት ሳያሳድጉት
ሰማያዊ እንጀራ የሰጠሸን ቤተልሔማዊት
ቅድስተ ቅዱሳን የኖህ መርከብ የአምላክ እናት

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 5
አ.ዝ \\
ቃና ዘገሊላ በሰርጉ ቤት በዚያ ተገኝተሽ ሳለሽ
ውኃውን ወደ ወይን ባንቺ ምልጃ እዳስለወጥሽ
ዛሬም የእኔ ሕይወት ወይኑ አልቆ ባዶ ሆኖአልና

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 6
አንቺየአምላክ እናት ንጽሂትቅድስት ርኅሪሂተ ህሊና
ሕይወቴን አድሰሽ ቀድሰሽ ሙይው በምስጋና

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 1
Ende abate dawit bebegena ezemralehu
Qen kelelit sall lemsgana etegalehu
Yehat’iate qusl endifewes ech’ohalehu
Mirkuze neshna Emebete beanchi emekalehu

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 2
A.z \\
Emebete beewnet enwedshalen
Yeewnetegna mebl Kristosn weledshln
Miknyate dihin hoy dinglmaryam yeamlakmegegna

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 3
Beamalajnetsh bemetamen ench’ohan egna
Mihretn adyn kidanemhret yealem medagna
A.z \\
Sile chernetsh Emebete leene enate nesh

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 4
Sile nigstnetsh Emebete nesh
Zinabat sayat’et’ut ayerat sayasadgut
Semayawi enjera yeset’eshen betelhemawit
Qidste Kidusan yenoh merkeb yeamlak enat

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 5
A.z \\
Qana zegelila besergu bet beziya tegegntesh salesh
Wihawn wede weyn banchi milja edaslewet’sh
Zarem yeene hiywet weynu alqo bado honoalna

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 6
Anchiyeamlak enat nits’hitqdst rihrihite hilina
Hiyweten adsesh qedsesh muyw bemsgana

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 1
እንደ አባቴ ዳዊት በበገና እዘምራለሁ
ቀን ከሌሊት ሳልል ለምስጋና እተጋለሁ
የኃጢአቴ ቁስል እንዲፈወስ እጮሃለሁ
ምርኩዜ ነሽና እመቤቴ በአንቺ እመካለሁ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 2
አ.ዝ \\
እመቤቴ በእውነት እንወድሻለን
የእውነተኛ መብል ክርስቶስን ወለድሽልን
ምክንያተ ድሂን ሆይ ድንግልማርያም የአምላክመገኛ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 3
በአማላጅነትሽ በመታመን እንጮሃን እኛ
ምሕረትን አድይን ኪዳነምህረት የዓለም መዳኛ
አ.ዝ \\
ስለ ቸርነትሽ እመቤቴ ለእኔ እናቴ ነሽ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 4
ስለ ንግሥትነትሽ እመቤቴ ነሽ
ዝናባት ሳያጠጡት አየራት ሳያሳድጉት
ሰማያዊ እንጀራ የሰጠሸን ቤተልሔማዊት
ቅድስተ ቅዱሳን የኖህ መርከብ የአምላክ እናት

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 5
አ.ዝ \\
ቃና ዘገሊላ በሰርጉ ቤት በዚያ ተገኝተሽ ሳለሽ
ውኃውን ወደ ወይን ባንቺ ምልጃ እዳስለወጥሽ
ዛሬም የእኔ ሕይወት ወይኑ አልቆ ባዶ ሆኖአልና

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 6
አንቺየአምላክ እናት ንጽሂትቅድስት ርኅሪሂተ ህሊና
ሕይወቴን አድሰሽ ቀድሰሽ ሙይው በምስጋና

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ',
        lyrics_transliteration = 'CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 1
Ende abate dawit bebegena ezemralehu
Qen kelelit sall lemsgana etegalehu
Yehat’iate qusl endifewes ech’ohalehu
Mirkuze neshna Emebete beanchi emekalehu

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 2
A.z \\
Emebete beewnet enwedshalen
Yeewnetegna mebl Kristosn weledshln
Miknyate dihin hoy dinglmaryam yeamlakmegegna

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 3
Beamalajnetsh bemetamen ench’ohan egna
Mihretn adyn kidanemhret yealem medagna
A.z \\
Sile chernetsh Emebete leene enate nesh

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 4
Sile nigstnetsh Emebete nesh
Zinabat sayat’et’ut ayerat sayasadgut
Semayawi enjera yeset’eshen betelhemawit
Qidste Kidusan yenoh merkeb yeamlak enat

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 5
A.z \\
Qana zegelila besergu bet beziya tegegntesh salesh
Wihawn wede weyn banchi milja edaslewet’sh
Zarem yeene hiywet weynu alqo bado honoalna

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 6
Anchiyeamlak enat nits’hitqdst rihrihite hilina
Hiyweten adsesh qedsesh muyw bemsgana

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '750846c3-c041-4f6f-a7a7-fbd5c1d13d29'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 1
እንደ አባቴ ዳዊት በበገና እዘምራለሁ
ቀን ከሌሊት ሳልል ለምስጋና እተጋለሁ
የኃጢአቴ ቁስል እንዲፈወስ እጮሃለሁ
ምርኩዜ ነሽና እመቤቴ በአንቺ እመካለሁ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 2
አ.ዝ \\
እመቤቴ በእውነት እንወድሻለን
የእውነተኛ መብል ክርስቶስን ወለድሽልን
ምክንያተ ድሂን ሆይ ድንግልማርያም የአምላክመገኛ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 3
በአማላጅነትሽ በመታመን እንጮሃን እኛ
ምሕረትን አድይን ኪዳነምህረት የዓለም መዳኛ
አ.ዝ \\
ስለ ቸርነትሽ እመቤቴ ለእኔ እናቴ ነሽ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 4
ስለ ንግሥትነትሽ እመቤቴ ነሽ
ዝናባት ሳያጠጡት አየራት ሳያሳድጉት
ሰማያዊ እንጀራ የሰጠሸን ቤተልሔማዊት
ቅድስተ ቅዱሳን የኖህ መርከብ የአምላክ እናት

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 5
አ.ዝ \\
ቃና ዘገሊላ በሰርጉ ቤት በዚያ ተገኝተሽ ሳለሽ
ውኃውን ወደ ወይን ባንቺ ምልጃ እዳስለወጥሽ
ዛሬም የእኔ ሕይወት ወይኑ አልቆ ባዶ ሆኖአልና

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 6
አንቺየአምላክ እናት ንጽሂትቅድስት ርኅሪሂተ ህሊና
ሕይወቴን አድሰሽ ቀድሰሽ ሙይው በምስጋና

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '750846c3-c041-4f6f-a7a7-fbd5c1d13d29'::uuid, 'like-mezemeran-tewodros-yoseph', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ygrem-aleku-new-eritrean-orthodox-mezmur-yigirem-alehu-bizemari-berehet ("#YGREM_ALEKU_NEW_ERITREAN_ORTHODOX_MEZMUR_yigirem_alehu #bizemari_berehet_tikue_2021")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7a21eb7f-3b44-4609-a037-6687440a3488'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 1
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 2
ዓለም''ዪ ዘመንን ፍቅርኻ
ጎይታይ ምእንታይ ዘይሓፈርካ
ዕርቃንካ ኣብ መስቀል ስለይ ተዋሪድካ
ዝሞትካለይ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 3
ክሰብኮ''የ ስምካ ክሳብ መኸተምታ ዘመነይ
ተስፋይ ኣይጎድልን ኣይሓፍርን ፍጹም ብኣኻ
ልዕሊ ማንም እንዴ ኣብ ሂወተይ ክሉ ዝሰርዐካ
ይግረም ኣለኹ ብኣኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 4
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 5
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ
ከምቲ ነቶም ስምካ ዝፈትዉ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 6
ዝመሓርካ ስምዓኒ ንዓይ
ንስጉምተይ ኩሉ ኣብ ቃልካ ኣጽንዓዬ
ከይወድቅ
እከይ ከይመልከኒ ፈተና ጸላእተይ ካባይ ኣርሕቅ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 7
ገጽካ ኣብርሃለይ ስርዓታትካ ኸኣ ምሃረኒ
ኪንዬ ምብዛሕ ቃላት ብመንፈስ ክህሉ ርድኣኒ
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 8
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 9
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 1
Yidneq aleኹ biaኻ
Kristos girum''yi gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 2
Alem''yi zemenn fiqrኻ
Goytay mientay zeyhaferka
Erqanka ab mesqel siley tewaridka
Zimotkaley

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 3
Kisebko''ye simka kisab meኸtemta zemeney
Tesfay aygodln ayhafrn fits’um biaኻ
Lieli manm ende ab hiwetey kilu ziseraka
Yigrem aleኹ biaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 4
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ
Yidneq aleኹ biaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 5
Kristos girum''yi gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ
Kemti netom simka zifetwu

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 6
Zimeharka simani niay
Nisgumtey kulu ab qalka ats’naye
Keywedq
Ekey keymelkeni fetena ts’elaetey kabay arhq

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 7
Gets’ka abrhaley siratatka ኸa mihareni
Kinye mibzah qalat bimenfes kihlu ridani
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 8
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ
Yidneq aleኹ biaኻ
Kristos girum''yi gibrኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 9
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 1
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 2
ዓለም''ዪ ዘመንን ፍቅርኻ
ጎይታይ ምእንታይ ዘይሓፈርካ
ዕርቃንካ ኣብ መስቀል ስለይ ተዋሪድካ
ዝሞትካለይ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 3
ክሰብኮ''የ ስምካ ክሳብ መኸተምታ ዘመነይ
ተስፋይ ኣይጎድልን ኣይሓፍርን ፍጹም ብኣኻ
ልዕሊ ማንም እንዴ ኣብ ሂወተይ ክሉ ዝሰርዐካ
ይግረም ኣለኹ ብኣኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 4
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 5
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ
ከምቲ ነቶም ስምካ ዝፈትዉ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 6
ዝመሓርካ ስምዓኒ ንዓይ
ንስጉምተይ ኩሉ ኣብ ቃልካ ኣጽንዓዬ
ከይወድቅ
እከይ ከይመልከኒ ፈተና ጸላእተይ ካባይ ኣርሕቅ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 7
ገጽካ ኣብርሃለይ ስርዓታትካ ኸኣ ምሃረኒ
ኪንዬ ምብዛሕ ቃላት ብመንፈስ ክህሉ ርድኣኒ
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 8
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 9
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ',
        lyrics_transliteration = 'CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 1
Yidneq aleኹ biaኻ
Kristos girum''yi gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 2
Alem''yi zemenn fiqrኻ
Goytay mientay zeyhaferka
Erqanka ab mesqel siley tewaridka
Zimotkaley

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 3
Kisebko''ye simka kisab meኸtemta zemeney
Tesfay aygodln ayhafrn fits’um biaኻ
Lieli manm ende ab hiwetey kilu ziseraka
Yigrem aleኹ biaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 4
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ
Yidneq aleኹ biaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 5
Kristos girum''yi gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ
Kemti netom simka zifetwu

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 6
Zimeharka simani niay
Nisgumtey kulu ab qalka ats’naye
Keywedq
Ekey keymelkeni fetena ts’elaetey kabay arhq

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 7
Gets’ka abrhaley siratatka ኸa mihareni
Kinye mibzah qalat bimenfes kihlu ridani
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 8
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ
Yidneq aleኹ biaኻ
Kristos girum''yi gibrኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 9
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7a21eb7f-3b44-4609-a037-6687440a3488'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 1
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 2
ዓለም''ዪ ዘመንን ፍቅርኻ
ጎይታይ ምእንታይ ዘይሓፈርካ
ዕርቃንካ ኣብ መስቀል ስለይ ተዋሪድካ
ዝሞትካለይ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 3
ክሰብኮ''የ ስምካ ክሳብ መኸተምታ ዘመነይ
ተስፋይ ኣይጎድልን ኣይሓፍርን ፍጹም ብኣኻ
ልዕሊ ማንም እንዴ ኣብ ሂወተይ ክሉ ዝሰርዐካ
ይግረም ኣለኹ ብኣኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 4
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 5
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ
ከምቲ ነቶም ስምካ ዝፈትዉ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 6
ዝመሓርካ ስምዓኒ ንዓይ
ንስጉምተይ ኩሉ ኣብ ቃልካ ኣጽንዓዬ
ከይወድቅ
እከይ ከይመልከኒ ፈተና ጸላእተይ ካባይ ኣርሕቅ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 7
ገጽካ ኣብርሃለይ ስርዓታትካ ኸኣ ምሃረኒ
ኪንዬ ምብዛሕ ቃላት ብመንፈስ ክህሉ ርድኣኒ
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 8
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 9
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7a21eb7f-3b44-4609-a037-6687440a3488'::uuid, 'ygrem-aleku-new-eritrean-orthodox-mezmur-yigirem-alehu-bizemari-berehet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cherinetih-new-yaderesegn-esike-zare-3140 ("Cherinetih New Yaderesegn Esike Zare")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '90a2d0a9-7546-4d57-9bed-56ac1792f5c8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 1
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል
ይቅርታ ለባሪያ ይደርሰኛል

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 2
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ
አምላክ ቸርነትን አደንቃለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 3
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 4
መክሊቴን ቀብሬ ባሳዝንም
መብራቴንም ይዤ ባልጠብቅም
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 5
ከቤትህ ራቅኩኝ፣ ተቸገርኩኝ አምናለሁ
አምናለሁ አምላኬ እንድትምረኝ
በይቅርታ መጣሁ ተቀበለኝ
ቸርነት ነው ያደረሰን እስከ ዛሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 6
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
በዝማሬ
በሰው ልጅ መመካት አቁሚያለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 7
ረዳት ያንተ መሆንህን አውቄያለሁ
አንተ ከጠበከኝ ሕይወቴ አይደፈርም
የኔ ሥራ፣ ምግባሬን ተወው
የመስቀሉን ነገር መርሳቴን

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 8
ኃጢአቴን አንሳ አንተ ኢየሱስ ክርስቶስ አምላኬ ነህ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 9
ላመስግን የኔ ጌታ በዝማሬ
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 10
ይቅርታ ለባሪያ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 11
አምላክ ቸርነትን አደንቃለሁ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 12
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 1
Andach endelelegn awqewalehu
Beante chernet gin emekalehu
Yekebedew shekme yiqelal
Yiqrta lebariya yidersegnal

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 2
Bemeqdesh qome lemezemer
Sirahn letwld lememesker
Ene man negn ene man negn biye asbalehu
Amlak chernetn adenqalehu

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 3
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 4
Mekliten qebre basaznm
Mebratenm yizhe balt’ebqm
Betalaq yiqrta endatresagn
Befqr gobgnteh kemot awt’agn

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 5
Kebeth raqkugn, techegerkugn amnalehu
Amnalehu amlake endtmregn
Beyqrta met’ahu teqebelegn
Chernet new yaderesen eske zare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 6
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Bezmare
Besew lij memekat aqumiyalehu

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 7
Redat yante mehonhn awqeyalehu
Ante ket’ebekegn hiywete aydeferm
Yene sira, migbaren tewew
Yemesqelun neger mersaten

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 8
Hat’iaten ansa ante Iyesus Kristos amlake neh
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 9
Lamesgn yene Geta bezmare
Andach endelelegn awqewalehu
Beante chernet gin emekalehu
Yekebedew shekme yiqelal

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 10
Yiqrta lebariya yidersegnal
Bemeqdesh qome lemezemer
Sirahn letwld lememesker
Ene man negn ene man negn biye asbalehu

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 11
Amlak chernetn adenqalehu
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 12
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 1
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል
ይቅርታ ለባሪያ ይደርሰኛል

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 2
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ
አምላክ ቸርነትን አደንቃለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 3
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 4
መክሊቴን ቀብሬ ባሳዝንም
መብራቴንም ይዤ ባልጠብቅም
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 5
ከቤትህ ራቅኩኝ፣ ተቸገርኩኝ አምናለሁ
አምናለሁ አምላኬ እንድትምረኝ
በይቅርታ መጣሁ ተቀበለኝ
ቸርነት ነው ያደረሰን እስከ ዛሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 6
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
በዝማሬ
በሰው ልጅ መመካት አቁሚያለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 7
ረዳት ያንተ መሆንህን አውቄያለሁ
አንተ ከጠበከኝ ሕይወቴ አይደፈርም
የኔ ሥራ፣ ምግባሬን ተወው
የመስቀሉን ነገር መርሳቴን

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 8
ኃጢአቴን አንሳ አንተ ኢየሱስ ክርስቶስ አምላኬ ነህ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 9
ላመስግን የኔ ጌታ በዝማሬ
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 10
ይቅርታ ለባሪያ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 11
አምላክ ቸርነትን አደንቃለሁ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 12
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ',
        lyrics_transliteration = 'CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 1
Andach endelelegn awqewalehu
Beante chernet gin emekalehu
Yekebedew shekme yiqelal
Yiqrta lebariya yidersegnal

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 2
Bemeqdesh qome lemezemer
Sirahn letwld lememesker
Ene man negn ene man negn biye asbalehu
Amlak chernetn adenqalehu

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 3
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 4
Mekliten qebre basaznm
Mebratenm yizhe balt’ebqm
Betalaq yiqrta endatresagn
Befqr gobgnteh kemot awt’agn

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 5
Kebeth raqkugn, techegerkugn amnalehu
Amnalehu amlake endtmregn
Beyqrta met’ahu teqebelegn
Chernet new yaderesen eske zare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 6
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Bezmare
Besew lij memekat aqumiyalehu

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 7
Redat yante mehonhn awqeyalehu
Ante ket’ebekegn hiywete aydeferm
Yene sira, migbaren tewew
Yemesqelun neger mersaten

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 8
Hat’iaten ansa ante Iyesus Kristos amlake neh
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 9
Lamesgn yene Geta bezmare
Andach endelelegn awqewalehu
Beante chernet gin emekalehu
Yekebedew shekme yiqelal

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 10
Yiqrta lebariya yidersegnal
Bemeqdesh qome lemezemer
Sirahn letwld lememesker
Ene man negn ene man negn biye asbalehu

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 11
Amlak chernetn adenqalehu
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 12
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare',
        updated_at = clock_timestamp()::text
    WHERE import_id = '90a2d0a9-7546-4d57-9bed-56ac1792f5c8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 1
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል
ይቅርታ ለባሪያ ይደርሰኛል

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 2
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ
አምላክ ቸርነትን አደንቃለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 3
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 4
መክሊቴን ቀብሬ ባሳዝንም
መብራቴንም ይዤ ባልጠብቅም
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 5
ከቤትህ ራቅኩኝ፣ ተቸገርኩኝ አምናለሁ
አምናለሁ አምላኬ እንድትምረኝ
በይቅርታ መጣሁ ተቀበለኝ
ቸርነት ነው ያደረሰን እስከ ዛሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 6
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
በዝማሬ
በሰው ልጅ መመካት አቁሚያለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 7
ረዳት ያንተ መሆንህን አውቄያለሁ
አንተ ከጠበከኝ ሕይወቴ አይደፈርም
የኔ ሥራ፣ ምግባሬን ተወው
የመስቀሉን ነገር መርሳቴን

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 8
ኃጢአቴን አንሳ አንተ ኢየሱስ ክርስቶስ አምላኬ ነህ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 9
ላመስግን የኔ ጌታ በዝማሬ
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 10
ይቅርታ ለባሪያ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 11
አምላክ ቸርነትን አደንቃለሁ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 12
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '90a2d0a9-7546-4d57-9bed-56ac1792f5c8'::uuid, 'cherinetih-new-yaderesegn-esike-zare-3140', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nahu-tefetseme-tsige ("Nahu Tefetseme")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '947cb5c8-5879-4b07-9a36-c1f2122b8561'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናሁ ተፈጸመ ተፈጸመ ናሁ
ማኀሌተ ጽጌ ሥሙር ተፈጸመ ናሁ /፪/

VERSE 1
አስምኪ ቦቱ አስምኪ ቦቱ
ንግሥተ ሰማያት /፪/

CHORUS
ናሁ ተፈጸመ ተፈጸመ ናሁ
ማኀሌተ ጽጌ ሥሙር ተፈጸመ ናሁ /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nahu tefetseme tefetseme nahu
Mahlete tsige simur tefetseme nahu (×2)

VERSE 1
Asimki botu asimki botu
Nigistite semayat (×2)

CHORUS
Nahu tefetseme tefetseme nahu
Mahlete tsige simur tefetseme nahu (×2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ናሁ ተፈጸመ ተፈጸመ ናሁ
ማኀሌተ ጽጌ ሥሙር ተፈጸመ ናሁ /፪/

VERSE 1
አስምኪ ቦቱ አስምኪ ቦቱ
ንግሥተ ሰማያት /፪/

CHORUS
ናሁ ተፈጸመ ተፈጸመ ናሁ
ማኀሌተ ጽጌ ሥሙር ተፈጸመ ናሁ /፪/',
        lyrics_transliteration = 'CHORUS
Nahu tefetseme tefetseme nahu
Mahlete tsige simur tefetseme nahu (×2)

VERSE 1
Asimki botu asimki botu
Nigistite semayat (×2)

CHORUS
Nahu tefetseme tefetseme nahu
Mahlete tsige simur tefetseme nahu (×2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '947cb5c8-5879-4b07-9a36-c1f2122b8561'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናሁ ተፈጸመ ተፈጸመ ናሁ
ማኀሌተ ጽጌ ሥሙር ተፈጸመ ናሁ /፪/

VERSE 1
አስምኪ ቦቱ አስምኪ ቦቱ
ንግሥተ ሰማያት /፪/

CHORUS
ናሁ ተፈጸመ ተፈጸመ ናሁ
ማኀሌተ ጽጌ ሥሙር ተፈጸመ ናሁ /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nahu tefetseme tefetseme nahu
Mahlete tsige simur tefetseme nahu (×2)

VERSE 1
Asimki botu asimki botu
Nigistite semayat (×2)

CHORUS
Nahu tefetseme tefetseme nahu
Mahlete tsige simur tefetseme nahu (×2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '947cb5c8-5879-4b07-9a36-c1f2122b8561'::uuid, 'nahu-tefetseme-tsige', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ep-yiheg-fetsame-4187 ("EP Yiheg Fetsame")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '70b986e5-3cc4-4774-9f11-2bbf4fed2880'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 1
የአማልክት አምላክ የጌቶች ጌታ እግዚአብሔር
ጥንትየሌለው ለአኗኗሩ ለአኳሃኑ ፍጻሜ
ለውርዝውናውም ማርጀት ለዘመኑ ቁጥር ዕድሜ
የከበረ የደነቀ ሥራው ካየነው የሚልቅ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 2
አንስርትየማይደርሱበት ነው ዓሳዎች የማይዋኙበት ጥልቅ
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ጌትነቱ ከሰማነው ኃይሉ ከነገሩን በላይ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 3
ምድር መረማመጃው ነው የክብሩ ዙፋኑ ሰማይ
ለኃይሉ ድካም የሌለው ለጥበቡ ልኬት ድንበር
በቀልን የማያውቅ የዋህ ክፋት የሌለበትም ቸረ
የአማልክት አምላክ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 4
የጌቶች ጌታ እግዚአብሔር
ረዳትን የማይሻ ገው ባሌንጀራየሌለው አንድ
ትዕቢተኛን የሚቀጣ ግብዞችን የሚያዋርድ
የሚሸሸገው የሌለው ያውቃል ቀድሞ ስለሚሆነው

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 5
ሁለ እንደ ልብስ ያረጃል እርሱ ግን ዘለዓለም ያው ነው
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ኩሊሉትን የሚመረምር ልቡናን የሚፈትን

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 6
ወደ መኖር ያመጣቸው ያልነበሩ ፍጥረታትን
ያለመከልከል ሰጪ ያለመንፈግ ድንቅ ለጋስ
እድፍ የሌለበት ንጹህ ነው በባህሪው ልዩ ቅዱስ
የአማልክት አምላክ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 7
የጌቶች ጌታ እግዚአብሔር

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 1
Yeamalkt amlak yegetoch Geta Egziabher
T’ntyelelew leanwanwaru leakwahanu fits’ame
Lewrzwnawm marjet lezemenu qut’r edme
Yekebere yedeneqe siraw kayenew yemilq

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 2
Ansrtyemaydersubet new asawoch yemaywagnubet t’lq
Yeamalkt amlak
Yegetoch Geta Egziabher
Getnetu kesemanew haylu kenegerun belay

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 3
Midr meremamejaw new yekbru zufanu semay
Lehaylu dikam yelelew let’bebu liket dinber
Beqeln yemayawq yewah kifat yelelebetm chere
Yeamalkt amlak

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 4
Yegetoch Geta Egziabher
Redatn yemaysha gew balenjerayelelew and
Tiebitegnan yemiqet’a gibzochn yemiyaward
Yemisheshegew yelelew yawqal qedmo silemihonew

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 5
Hule ende libs yarejal ersu gin zelealem yaw new
Yeamalkt amlak
Yegetoch Geta Egziabher
Kulilutn yemimeremr libunan yemifetn

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 6
Wede menor yamet’achew yalneberu fit’retatn
Yalemekelkel sech’i yalemenfeg dinq legas
Edf yelelebet nits’uh new bebahriw liyu Kidus
Yeamalkt amlak

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 7
Yegetoch Geta Egziabher

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 1
የአማልክት አምላክ የጌቶች ጌታ እግዚአብሔር
ጥንትየሌለው ለአኗኗሩ ለአኳሃኑ ፍጻሜ
ለውርዝውናውም ማርጀት ለዘመኑ ቁጥር ዕድሜ
የከበረ የደነቀ ሥራው ካየነው የሚልቅ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 2
አንስርትየማይደርሱበት ነው ዓሳዎች የማይዋኙበት ጥልቅ
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ጌትነቱ ከሰማነው ኃይሉ ከነገሩን በላይ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 3
ምድር መረማመጃው ነው የክብሩ ዙፋኑ ሰማይ
ለኃይሉ ድካም የሌለው ለጥበቡ ልኬት ድንበር
በቀልን የማያውቅ የዋህ ክፋት የሌለበትም ቸረ
የአማልክት አምላክ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 4
የጌቶች ጌታ እግዚአብሔር
ረዳትን የማይሻ ገው ባሌንጀራየሌለው አንድ
ትዕቢተኛን የሚቀጣ ግብዞችን የሚያዋርድ
የሚሸሸገው የሌለው ያውቃል ቀድሞ ስለሚሆነው

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 5
ሁለ እንደ ልብስ ያረጃል እርሱ ግን ዘለዓለም ያው ነው
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ኩሊሉትን የሚመረምር ልቡናን የሚፈትን

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 6
ወደ መኖር ያመጣቸው ያልነበሩ ፍጥረታትን
ያለመከልከል ሰጪ ያለመንፈግ ድንቅ ለጋስ
እድፍ የሌለበት ንጹህ ነው በባህሪው ልዩ ቅዱስ
የአማልክት አምላክ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 7
የጌቶች ጌታ እግዚአብሔር

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር',
        lyrics_transliteration = 'CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 1
Yeamalkt amlak yegetoch Geta Egziabher
T’ntyelelew leanwanwaru leakwahanu fits’ame
Lewrzwnawm marjet lezemenu qut’r edme
Yekebere yedeneqe siraw kayenew yemilq

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 2
Ansrtyemaydersubet new asawoch yemaywagnubet t’lq
Yeamalkt amlak
Yegetoch Geta Egziabher
Getnetu kesemanew haylu kenegerun belay

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 3
Midr meremamejaw new yekbru zufanu semay
Lehaylu dikam yelelew let’bebu liket dinber
Beqeln yemayawq yewah kifat yelelebetm chere
Yeamalkt amlak

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 4
Yegetoch Geta Egziabher
Redatn yemaysha gew balenjerayelelew and
Tiebitegnan yemiqet’a gibzochn yemiyaward
Yemisheshegew yelelew yawqal qedmo silemihonew

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 5
Hule ende libs yarejal ersu gin zelealem yaw new
Yeamalkt amlak
Yegetoch Geta Egziabher
Kulilutn yemimeremr libunan yemifetn

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 6
Wede menor yamet’achew yalneberu fit’retatn
Yalemekelkel sech’i yalemenfeg dinq legas
Edf yelelebet nits’uh new bebahriw liyu Kidus
Yeamalkt amlak

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 7
Yegetoch Geta Egziabher

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber',
        updated_at = clock_timestamp()::text
    WHERE import_id = '70b986e5-3cc4-4774-9f11-2bbf4fed2880'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 1
የአማልክት አምላክ የጌቶች ጌታ እግዚአብሔር
ጥንትየሌለው ለአኗኗሩ ለአኳሃኑ ፍጻሜ
ለውርዝውናውም ማርጀት ለዘመኑ ቁጥር ዕድሜ
የከበረ የደነቀ ሥራው ካየነው የሚልቅ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 2
አንስርትየማይደርሱበት ነው ዓሳዎች የማይዋኙበት ጥልቅ
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ጌትነቱ ከሰማነው ኃይሉ ከነገሩን በላይ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 3
ምድር መረማመጃው ነው የክብሩ ዙፋኑ ሰማይ
ለኃይሉ ድካም የሌለው ለጥበቡ ልኬት ድንበር
በቀልን የማያውቅ የዋህ ክፋት የሌለበትም ቸረ
የአማልክት አምላክ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 4
የጌቶች ጌታ እግዚአብሔር
ረዳትን የማይሻ ገው ባሌንጀራየሌለው አንድ
ትዕቢተኛን የሚቀጣ ግብዞችን የሚያዋርድ
የሚሸሸገው የሌለው ያውቃል ቀድሞ ስለሚሆነው

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 5
ሁለ እንደ ልብስ ያረጃል እርሱ ግን ዘለዓለም ያው ነው
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ኩሊሉትን የሚመረምር ልቡናን የሚፈትን

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 6
ወደ መኖር ያመጣቸው ያልነበሩ ፍጥረታትን
ያለመከልከል ሰጪ ያለመንፈግ ድንቅ ለጋስ
እድፍ የሌለበት ንጹህ ነው በባህሪው ልዩ ቅዱስ
የአማልክት አምላክ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 7
የጌቶች ጌታ እግዚአብሔር

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '70b986e5-3cc4-4774-9f11-2bbf4fed2880'::uuid, 'ep-yiheg-fetsame-4187', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egna-gine-ethiopian-orthodox-mezmure-old ("EGNA GINE / ETHIOPIAN ORTHODOX MEZMURE OLD")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8d952d5d-15ea-4c87-baf8-aa920475c2cd'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ጥበብ አይደለም',
        lyrics_transliteration = 'CHORUS
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
T’beb aydelem',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8d952d5d-15ea-4c87-baf8-aa920475c2cd'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8d952d5d-15ea-4c87-baf8-aa920475c2cd'::uuid, 'egna-gine-ethiopian-orthodox-mezmure-old', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nana-ammanuel ("Nana Amanu’el")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '910205eb-2158-4114-8a02-c302c1869620'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 1
የምሕረት አባት አማኑኤል
የቸርነት ጌታ
ፊትህ የተመላ
ሁሌ በይቅርታ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 2
ካለው ፍቅር በላይ
አባት ለአንድ ልጁ
አምላክ ይወደናል
አይጥለንም ከእጁ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 3
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 4
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ
ቁስሌ ተፈውሷል
በቁስልህ በሞትህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 5
ስሸጥህ አቀፍከኝ
ስወጋህ አይኔ በራ
በፍቅርህ አወጣኽኝ
ከዚያ ከመከራ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 6
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 7
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ
ድል አርገህልኛል
የጭንቄን ተራራ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 8
በጉባኤ መሀል
አፌ አንተን አወጀ
የከበረ ደምህ
ነፍሴን ስለዋጀ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 9
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 10
የድንግሏ ፍሬ አማኑኤል
የበላቴናዋ
የቤቴ ምሰሶ
የነፍሴ ቤዛዋ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 11
መሠረቴ አንተ ነህ
ያሳደገኝ እጅህ
አትተወኝም አንተ
ስለሆንኩኝ ልጅህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 12
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 1
Ye’mihiret abat Amanu’el
Ye’chernet geta
Fitih yetemela
Hule beyiqirta

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 2
Kalew fiqir belay
Abat le’and liju
Amlak yiwedenal
Ayitilenem ke’eju

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 3
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 4
Medihanité libel Amanu’el
Denyalew be’motih
Quslé tefewusal
Be’quslih be’motih

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 5
Seshetih aqefkeny
Sewegah ayne bera
Be’fiqrih awetaqeny
Ke’ziya ke’mekera

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 6
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 7
Ante ke’ne gar neh Amanu’el
Awo ke’ne gara
Dil argehilñal
Ye’chinqen terara

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 8
Be’guba’e mehal
Afe anten awaje
Ye’kebera demih
Nefsen selawaje

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 9
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 10
Ye’dingela fre Amanu’el
Ye’belatenawa
Ye’bete mesaso
Ye’nefse beza’wa

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 11
Mesarete ante neh
Yasadageny ejih
Atewenyem ante
Selehonkugn lijih

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 12
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 1
የምሕረት አባት አማኑኤል
የቸርነት ጌታ
ፊትህ የተመላ
ሁሌ በይቅርታ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 2
ካለው ፍቅር በላይ
አባት ለአንድ ልጁ
አምላክ ይወደናል
አይጥለንም ከእጁ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 3
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 4
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ
ቁስሌ ተፈውሷል
በቁስልህ በሞትህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 5
ስሸጥህ አቀፍከኝ
ስወጋህ አይኔ በራ
በፍቅርህ አወጣኽኝ
ከዚያ ከመከራ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 6
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 7
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ
ድል አርገህልኛል
የጭንቄን ተራራ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 8
በጉባኤ መሀል
አፌ አንተን አወጀ
የከበረ ደምህ
ነፍሴን ስለዋጀ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 9
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 10
የድንግሏ ፍሬ አማኑኤል
የበላቴናዋ
የቤቴ ምሰሶ
የነፍሴ ቤዛዋ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 11
መሠረቴ አንተ ነህ
ያሳደገኝ እጅህ
አትተወኝም አንተ
ስለሆንኩኝ ልጅህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 12
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/',
        lyrics_transliteration = 'CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 1
Ye’mihiret abat Amanu’el
Ye’chernet geta
Fitih yetemela
Hule beyiqirta

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 2
Kalew fiqir belay
Abat le’and liju
Amlak yiwedenal
Ayitilenem ke’eju

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 3
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 4
Medihanité libel Amanu’el
Denyalew be’motih
Quslé tefewusal
Be’quslih be’motih

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 5
Seshetih aqefkeny
Sewegah ayne bera
Be’fiqrih awetaqeny
Ke’ziya ke’mekera

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 6
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 7
Ante ke’ne gar neh Amanu’el
Awo ke’ne gara
Dil argehilñal
Ye’chinqen terara

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 8
Be’guba’e mehal
Afe anten awaje
Ye’kebera demih
Nefsen selawaje

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 9
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 10
Ye’dingela fre Amanu’el
Ye’belatenawa
Ye’bete mesaso
Ye’nefse beza’wa

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 11
Mesarete ante neh
Yasadageny ejih
Atewenyem ante
Selehonkugn lijih

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 12
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '910205eb-2158-4114-8a02-c302c1869620'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 1
የምሕረት አባት አማኑኤል
የቸርነት ጌታ
ፊትህ የተመላ
ሁሌ በይቅርታ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 2
ካለው ፍቅር በላይ
አባት ለአንድ ልጁ
አምላክ ይወደናል
አይጥለንም ከእጁ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 3
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 4
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ
ቁስሌ ተፈውሷል
በቁስልህ በሞትህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 5
ስሸጥህ አቀፍከኝ
ስወጋህ አይኔ በራ
በፍቅርህ አወጣኽኝ
ከዚያ ከመከራ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 6
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 7
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ
ድል አርገህልኛል
የጭንቄን ተራራ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 8
በጉባኤ መሀል
አፌ አንተን አወጀ
የከበረ ደምህ
ነፍሴን ስለዋጀ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 9
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 10
የድንግሏ ፍሬ አማኑኤል
የበላቴናዋ
የቤቴ ምሰሶ
የነፍሴ ቤዛዋ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 11
መሠረቴ አንተ ነህ
ያሳደገኝ እጅህ
አትተወኝም አንተ
ስለሆንኩኝ ልጅህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 12
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 1
Ye’mihiret abat Amanu’el
Ye’chernet geta
Fitih yetemela
Hule beyiqirta

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 2
Kalew fiqir belay
Abat le’and liju
Amlak yiwedenal
Ayitilenem ke’eju

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 3
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 4
Medihanité libel Amanu’el
Denyalew be’motih
Quslé tefewusal
Be’quslih be’motih

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 5
Seshetih aqefkeny
Sewegah ayne bera
Be’fiqrih awetaqeny
Ke’ziya ke’mekera

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 6
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 7
Ante ke’ne gar neh Amanu’el
Awo ke’ne gara
Dil argehilñal
Ye’chinqen terara

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 8
Be’guba’e mehal
Afe anten awaje
Ye’kebera demih
Nefsen selawaje

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 9
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 10
Ye’dingela fre Amanu’el
Ye’belatenawa
Ye’bete mesaso
Ye’nefse beza’wa

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 11
Mesarete ante neh
Yasadageny ejih
Atewenyem ante
Selehonkugn lijih

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 12
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '910205eb-2158-4114-8a02-c302c1869620'::uuid, 'nana-ammanuel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tsega-nesaene ("Tsega Nesa’ene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '70da0ec4-9600-4d73-bb28-fabdf0053b75'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጸጋ ነሣዕነ ወህይወተ ረከብነ
በሐይለ መስቀሉ ለኢየሱስ ክርስቶስ በኃይለ መስቀሉ
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ እግዚአብሔር

VERSE 1
ጸጋን ተቀበልን ሕይወትንም አገኘን (፪)
በመስቀሉ ኃይል በኢየሱስ ክርስቶስ በመስቀሉ ኃይል (፪)
አቤቱ አንተን (፪) እናመሰግንሃለን እግዚአብሔር (፪)

CHORUS
ጸጋ ነሣዕነ ወህይወተ ረከብነ
በሐይለ መስቀሉ ለኢየሱስ ክርስቶስ በኃይለ መስቀሉ
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ እግዚአብሔር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tsega nesa’ene we’hiwote rekebine
Behayle meskelu le’Iyesus Kiristos behayle meskelu
Kiyake egzio neakut wensebhake Egziabher

VERSE 1
Tsegan tekebeln hiwotinim agegnen (2)
Bemeskelu hayl be’Iyesus Kiristos bemeskelu hayl (2)
Abetu anten (2) enameseginihalen Egziabher (2)

CHORUS
Tsega nesa’ene we’hiwote rekebine
Behayle meskelu le’Iyesus Kiristos behayle meskelu
Kiyake egzio neakut wensebhake Egziabher'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጸጋ ነሣዕነ ወህይወተ ረከብነ
በሐይለ መስቀሉ ለኢየሱስ ክርስቶስ በኃይለ መስቀሉ
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ እግዚአብሔር

VERSE 1
ጸጋን ተቀበልን ሕይወትንም አገኘን (፪)
በመስቀሉ ኃይል በኢየሱስ ክርስቶስ በመስቀሉ ኃይል (፪)
አቤቱ አንተን (፪) እናመሰግንሃለን እግዚአብሔር (፪)

CHORUS
ጸጋ ነሣዕነ ወህይወተ ረከብነ
በሐይለ መስቀሉ ለኢየሱስ ክርስቶስ በኃይለ መስቀሉ
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ እግዚአብሔር',
        lyrics_transliteration = 'CHORUS
Tsega nesa’ene we’hiwote rekebine
Behayle meskelu le’Iyesus Kiristos behayle meskelu
Kiyake egzio neakut wensebhake Egziabher

VERSE 1
Tsegan tekebeln hiwotinim agegnen (2)
Bemeskelu hayl be’Iyesus Kiristos bemeskelu hayl (2)
Abetu anten (2) enameseginihalen Egziabher (2)

CHORUS
Tsega nesa’ene we’hiwote rekebine
Behayle meskelu le’Iyesus Kiristos behayle meskelu
Kiyake egzio neakut wensebhake Egziabher',
        updated_at = clock_timestamp()::text
    WHERE import_id = '70da0ec4-9600-4d73-bb28-fabdf0053b75'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጸጋ ነሣዕነ ወህይወተ ረከብነ
በሐይለ መስቀሉ ለኢየሱስ ክርስቶስ በኃይለ መስቀሉ
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ እግዚአብሔር

VERSE 1
ጸጋን ተቀበልን ሕይወትንም አገኘን (፪)
በመስቀሉ ኃይል በኢየሱስ ክርስቶስ በመስቀሉ ኃይል (፪)
አቤቱ አንተን (፪) እናመሰግንሃለን እግዚአብሔር (፪)

CHORUS
ጸጋ ነሣዕነ ወህይወተ ረከብነ
በሐይለ መስቀሉ ለኢየሱስ ክርስቶስ በኃይለ መስቀሉ
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ እግዚአብሔር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tsega nesa’ene we’hiwote rekebine
Behayle meskelu le’Iyesus Kiristos behayle meskelu
Kiyake egzio neakut wensebhake Egziabher

VERSE 1
Tsegan tekebeln hiwotinim agegnen (2)
Bemeskelu hayl be’Iyesus Kiristos bemeskelu hayl (2)
Abetu anten (2) enameseginihalen Egziabher (2)

CHORUS
Tsega nesa’ene we’hiwote rekebine
Behayle meskelu le’Iyesus Kiristos behayle meskelu
Kiyake egzio neakut wensebhake Egziabher';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '70da0ec4-9600-4d73-bb28-fabdf0053b75'::uuid, 'tsega-nesaene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- behazene ("Behazene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7bbde69c-071d-4f36-998a-091210348748'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 1
ለዓለም ተዘርግቶ እጄ ባዶ ሆኗል
የራሴ ላይ አክሊል ተሽቀንጥሮ ወድቋል

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 2
ከኤልዛቤል ሸሽቼ መጣሁኝ ወደ አንቺ
የጎሰቆልኩትን እኔን ተመልከቺ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 3
የእግሬ መሰናክል ለዓለም ደስታ ነው
ተስፋ ቢስ መሆኔ ለጠላቴ ድል ነው

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 4
የደስታ መመንጫ የኤልሳቤጥ ዘመድ
እንዳልሰናከል ምሪኝ በመንገድ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 5
ምድር ትለኛለች ተስፋ ቢስ ብቸኛ
ሳለቅስ ሳነባ አይታኛለችና

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 6
ከቤተመቅደሱ ለእኔስ ዘመድ አለኝ
በሀዘኔ ሰዓት አይዞህ የምትለኝ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 7
ከአመድ የወደቀ ትንሽ ገንዘብ አለሽ
ልብሽ እራርቶልኝ ፈልጊኝ አጥብቀሽ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 8
እምነቴ እንዳይደክም እንዳልጠፋ ልጅሽ
አድጊያለሁና ከደጀ ሰላምሽ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 1
Le’alam tezergeto ejé bado honwal
Yerasé lay aklil teshqent’ro wedkwal

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 2
KeElzabel shesheche metahugn wede anchi
Yegoseqolqut enén temelekchi

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 3
Ye’egre mesenakel le’alam dest’a new
Tesfa bis mehoné let’elate dil new

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 4
Yedest’a memenegcha yeElsabet zemed
Endalesenakel mirign bemenged

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 5
Midir tilengnaletch tesfa bis bichegna
Salekis saneba aytagnaletchna

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 6
KeBetemekdesu lenés zemed alegn
Behazene seat ayzoh yemitilegn

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 7
Ke’amed yewodeqe tinish genzeb alesh
Libish irarto lign felign at’ibqesh

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 8
Imneté endetaydekem endet’ef’a lijish
Adgiyalewna kedeje selamish

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 1
ለዓለም ተዘርግቶ እጄ ባዶ ሆኗል
የራሴ ላይ አክሊል ተሽቀንጥሮ ወድቋል

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 2
ከኤልዛቤል ሸሽቼ መጣሁኝ ወደ አንቺ
የጎሰቆልኩትን እኔን ተመልከቺ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 3
የእግሬ መሰናክል ለዓለም ደስታ ነው
ተስፋ ቢስ መሆኔ ለጠላቴ ድል ነው

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 4
የደስታ መመንጫ የኤልሳቤጥ ዘመድ
እንዳልሰናከል ምሪኝ በመንገድ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 5
ምድር ትለኛለች ተስፋ ቢስ ብቸኛ
ሳለቅስ ሳነባ አይታኛለችና

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 6
ከቤተመቅደሱ ለእኔስ ዘመድ አለኝ
በሀዘኔ ሰዓት አይዞህ የምትለኝ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 7
ከአመድ የወደቀ ትንሽ ገንዘብ አለሽ
ልብሽ እራርቶልኝ ፈልጊኝ አጥብቀሽ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 8
እምነቴ እንዳይደክም እንዳልጠፋ ልጅሽ
አድጊያለሁና ከደጀ ሰላምሽ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ',
        lyrics_transliteration = 'CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 1
Le’alam tezergeto ejé bado honwal
Yerasé lay aklil teshqent’ro wedkwal

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 2
KeElzabel shesheche metahugn wede anchi
Yegoseqolqut enén temelekchi

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 3
Ye’egre mesenakel le’alam dest’a new
Tesfa bis mehoné let’elate dil new

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 4
Yedest’a memenegcha yeElsabet zemed
Endalesenakel mirign bemenged

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 5
Midir tilengnaletch tesfa bis bichegna
Salekis saneba aytagnaletchna

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 6
KeBetemekdesu lenés zemed alegn
Behazene seat ayzoh yemitilegn

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 7
Ke’amed yewodeqe tinish genzeb alesh
Libish irarto lign felign at’ibqesh

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 8
Imneté endetaydekem endet’ef’a lijish
Adgiyalewna kedeje selamish

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7bbde69c-071d-4f36-998a-091210348748'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 1
ለዓለም ተዘርግቶ እጄ ባዶ ሆኗል
የራሴ ላይ አክሊል ተሽቀንጥሮ ወድቋል

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 2
ከኤልዛቤል ሸሽቼ መጣሁኝ ወደ አንቺ
የጎሰቆልኩትን እኔን ተመልከቺ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 3
የእግሬ መሰናክል ለዓለም ደስታ ነው
ተስፋ ቢስ መሆኔ ለጠላቴ ድል ነው

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 4
የደስታ መመንጫ የኤልሳቤጥ ዘመድ
እንዳልሰናከል ምሪኝ በመንገድ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 5
ምድር ትለኛለች ተስፋ ቢስ ብቸኛ
ሳለቅስ ሳነባ አይታኛለችና

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 6
ከቤተመቅደሱ ለእኔስ ዘመድ አለኝ
በሀዘኔ ሰዓት አይዞህ የምትለኝ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 7
ከአመድ የወደቀ ትንሽ ገንዘብ አለሽ
ልብሽ እራርቶልኝ ፈልጊኝ አጥብቀሽ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 8
እምነቴ እንዳይደክም እንዳልጠፋ ልጅሽ
አድጊያለሁና ከደጀ ሰላምሽ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 1
Le’alam tezergeto ejé bado honwal
Yerasé lay aklil teshqent’ro wedkwal

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 2
KeElzabel shesheche metahugn wede anchi
Yegoseqolqut enén temelekchi

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 3
Ye’egre mesenakel le’alam dest’a new
Tesfa bis mehoné let’elate dil new

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 4
Yedest’a memenegcha yeElsabet zemed
Endalesenakel mirign bemenged

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 5
Midir tilengnaletch tesfa bis bichegna
Salekis saneba aytagnaletchna

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 6
KeBetemekdesu lenés zemed alegn
Behazene seat ayzoh yemitilegn

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 7
Ke’amed yewodeqe tinish genzeb alesh
Libish irarto lign felign at’ibqesh

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 8
Imneté endetaydekem endet’ef’a lijish
Adgiyalewna kedeje selamish

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7bbde69c-071d-4f36-998a-091210348748'::uuid, 'behazene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- in-the-land-of-ephrathah ("In the Land of Ephrathah")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8589462c-bc62-4db5-984f-ceeacd4022b8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
GETA TEWELEDE KE''DENGEL MARYAM(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
GETA TEWELEDE KE''DENGEL MARYAM (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '8589462c-bc62-4db5-984f-ceeacd4022b8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
GETA TEWELEDE KE''DENGEL MARYAM(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8589462c-bc62-4db5-984f-ceeacd4022b8'::uuid, 'in-the-land-of-ephrathah', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- let-us-give-praise ("Let us give praise")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '70ed5ad3-6417-4f67-b24f-b69ca8816247'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 1
We have crossed through the sea the waters have run dry
Upon our enemies triumphantly we rise
We were freed from their hold the chains of slavery
The bread that gives us life is truly heavenly

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 2
Trials that caused us fear abundant they all were
We have passed through them all with our Lord and Savior
Though we may lose our strength weakened by obstacles
Our salvation is God He makes all possible

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 3
We drank holy water that flowed from the boulder
We praise God Almighty who is full of wonder
Come all let us rejoice our lives have been redeemed
Our enemy Satan he has left in defeat

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 1
We have crossed through the sea the waters have run dry
Upon our enemies triumphantly we rise
We were freed from their hold the chains of slavery
The bread that gives us life is truly heavenly

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 2
Trials that caused us fear abundant they all were
We have passed through them all with our Lord and Savior
Though we may lose our strength weakened by obstacles
Our salvation is God He makes all possible

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 3
We drank holy water that flowed from the boulder
We praise God Almighty who is full of wonder
Come all let us rejoice our lives have been redeemed
Our enemy Satan he has left in defeat

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = '70ed5ad3-6417-4f67-b24f-b69ca8816247'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 1
We have crossed through the sea the waters have run dry
Upon our enemies triumphantly we rise
We were freed from their hold the chains of slavery
The bread that gives us life is truly heavenly

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 2
Trials that caused us fear abundant they all were
We have passed through them all with our Lord and Savior
Though we may lose our strength weakened by obstacles
Our salvation is God He makes all possible

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 3
We drank holy water that flowed from the boulder
We praise God Almighty who is full of wonder
Come all let us rejoice our lives have been redeemed
Our enemy Satan he has left in defeat

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '70ed5ad3-6417-4f67-b24f-b69ca8816247'::uuid, 'let-us-give-praise', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- diwiy-nen ("Diwiy Nen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '74d9aff6-f5b6-4e83-b8a2-c6b5223d3175'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ድውይ ነን አንተ አድነን
መፃጉን የፈወስክ በልዩ ሥልጣንህ (፪)

VERSE 1
የሥጋ በሽታ በአንተ እንደተረታ (፪)
እኛም ተይዘናል በነፍስ በሽታ
አድነን የሠራዊት ጌታ (፪)

CHORUS
ድውይ ነን አንተ አድነን
መፃጉን የፈወስክ በልዩ ሥልጣንህ (፪)',
        lyrics_transliteration = 'CHORUS
Diwiy negn ante adenen
Metsagun yefewesk beleu seltanih (2)

VERSE 1
Yesga besheta bante endetereta (2)
Egnam teyezenal benefs besheta
Adenen yeserawit geta (2)

CHORUS
Diwiy negn ante adenen
Metsagun yefewesk beleu seltanih (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '74d9aff6-f5b6-4e83-b8a2-c6b5223d3175'::uuid
      AND deleted_at IS NULL
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
Metsagun yefewesk beleu seltanih (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '74d9aff6-f5b6-4e83-b8a2-c6b5223d3175'::uuid, 'diwiy-nen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- besimih-tamignalehu ("Besimih Tamignalehu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '787851d9-8ec6-4628-9a9d-b4cfef06f665'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን
ተገፍቶ መች ይወድቃል በአንተ የሚታመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
አይሞትም ይኖራል በአንተ የሚታመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 7
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Zelalem temesgen kef bellgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen
Tegefto mech yiwedqal beante yemitamen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Aymotm yinoral beante yemitamen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 6
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 7
Guzoyen ante aqnalgn qidem kefite

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን
ተገፍቶ መች ይወድቃል በአንተ የሚታመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
አይሞትም ይኖራል በአንተ የሚታመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 7
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ',
        lyrics_transliteration = 'CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Zelalem temesgen kef bellgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen
Tegefto mech yiwedqal beante yemitamen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Aymotm yinoral beante yemitamen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 6
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 7
Guzoyen ante aqnalgn qidem kefite

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite',
        updated_at = clock_timestamp()::text
    WHERE import_id = '787851d9-8ec6-4628-9a9d-b4cfef06f665'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን
ተገፍቶ መች ይወድቃል በአንተ የሚታመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
አይሞትም ይኖራል በአንተ የሚታመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 7
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '787851d9-8ec6-4628-9a9d-b4cfef06f665'::uuid, 'besimih-tamignalehu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kaln-lemwled ("Kaln Lemwled")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8689dc0f-2355-4890-9c8c-aff53d24c7b6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የሐና ልጅ ነሽ የኢያቄም እፁብ ድንቅ ነሽ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
YeHana liji nesh yeEyakem etsub dink nesh (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '8689dc0f-2355-4890-9c8c-aff53d24c7b6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የሐና ልጅ ነሽ የኢያቄም እፁብ ድንቅ ነሽ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
YeHana liji nesh yeEyakem etsub dink nesh (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8689dc0f-2355-4890-9c8c-aff53d24c7b6'::uuid, 'kaln-lemwled', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- chereneteh ("Chereneteh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7388d75d-0ba5-460a-bf14-1c6ce62630a7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 2
በረሀብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ተቀበለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 3
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታህ ለባሪያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 4
ሥራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሜያለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 5
ረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበቅከኝ በህይወቴ
ቅጥርህ አይደፈርም መድሀኒቴ
የኔን ሥራ ተወው ተግባሬን

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 6
የመስቀሉን ነገር መርሳቴን
አዚሜን አንስተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 1
Mebratenm yizhe balt’ebqh
Betalaq yiqrta endatresagn
Befqr gobgnteh kemot awt’agn
Kebeth erqe mech t’egebkugn

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 2
Bereheb beerzat techegerkugn
Amnalehu amlake endtmregn
Leyqrta met’ahu teqebelegn
Andach endelelegn awqewalehu

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 3
Beante chernet gin emekalehu
Yekebedew shekme yiqelegnal
Yiqrtah lebariyah yidersegnal
Bemeqdesh qome lemezemer

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 4
Sirahn letwld lememesker
Ene manegn biye asbalehu
Amlak chernethn adenqalehu
Besew ej memekat aqumeyalehu

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 5
Redate ante neh awqeyalehu
Ante ket’ebeqkegn behywete
Qit’rh aydeferm medhenite
Yenen sira tewew tegbaren

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 6
Yemesqelun neger mersaten
Azimen ansteh anten liyh
Eyesus Kristos amlake neh

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 2
በረሀብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ተቀበለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 3
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታህ ለባሪያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 4
ሥራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሜያለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 5
ረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበቅከኝ በህይወቴ
ቅጥርህ አይደፈርም መድሀኒቴ
የኔን ሥራ ተወው ተግባሬን

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 6
የመስቀሉን ነገር መርሳቴን
አዚሜን አንስተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ',
        lyrics_transliteration = 'CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 1
Mebratenm yizhe balt’ebqh
Betalaq yiqrta endatresagn
Befqr gobgnteh kemot awt’agn
Kebeth erqe mech t’egebkugn

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 2
Bereheb beerzat techegerkugn
Amnalehu amlake endtmregn
Leyqrta met’ahu teqebelegn
Andach endelelegn awqewalehu

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 3
Beante chernet gin emekalehu
Yekebedew shekme yiqelegnal
Yiqrtah lebariyah yidersegnal
Bemeqdesh qome lemezemer

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 4
Sirahn letwld lememesker
Ene manegn biye asbalehu
Amlak chernethn adenqalehu
Besew ej memekat aqumeyalehu

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 5
Redate ante neh awqeyalehu
Ante ket’ebeqkegn behywete
Qit’rh aydeferm medhenite
Yenen sira tewew tegbaren

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 6
Yemesqelun neger mersaten
Azimen ansteh anten liyh
Eyesus Kristos amlake neh

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7388d75d-0ba5-460a-bf14-1c6ce62630a7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 2
በረሀብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ተቀበለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 3
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታህ ለባሪያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 4
ሥራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሜያለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 5
ረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበቅከኝ በህይወቴ
ቅጥርህ አይደፈርም መድሀኒቴ
የኔን ሥራ ተወው ተግባሬን

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 6
የመስቀሉን ነገር መርሳቴን
አዚሜን አንስተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7388d75d-0ba5-460a-bf14-1c6ce62630a7'::uuid, 'chereneteh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
