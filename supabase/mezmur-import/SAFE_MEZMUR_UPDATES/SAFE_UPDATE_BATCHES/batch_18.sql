-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 18 OF 32
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
  -- eritrean-orthodox-mezmur-3615 ("Eritrean Orthodox Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c9807d6d-f448-4eb2-926c-4ae363460642'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 1
ተመስገን መድኀነይ ዓመታት ትዕግሥተይ ደስታ ቀይርካዮ
ንስኻ እነተ ዘይሓነፅካ መን ጥበብ ምስ ሃቦ ሐነፅቲ ሰብ ዕዮ
ንስኻ እነተዘይሐለኻ ሓላዊ ከተማ ምነቕሐ''ዶ ኢልካዮ
አነ''ውን አምላኸይ ብዘይ ደገፍ ኢደካ የለን ናተይ ዘብሎ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 2
ከመይ ነስኻ ኢኻ ትብዓት ውሽጠይ ውሽጠይ ልበይ ዝውከሎ
ተመሰገን አምላኸይ
ቅደሚ ኩሉነገር ንስኻ ከበረለይ
ተመሰገን ግይታየ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 3
ቅደሚ ኩሉ ነገር ልዕል በለለይ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ዝነፍዐ ፈረሰኛ ከም ንፈሰ ክሕምበብ ኃይለይ''ዶ እብሎ ይኸውን
እቲ ዝምካሕ ብፍልጠቱ ኣብ ጥርዚ እንተ በጽሐስ ናተይ''ዶ እብሎ ይኸውን

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 4
መን ኣሎ ድዩ ፍጡር ዕድመ ከይሃብካዮ ነዚ ዘርክበሉ
መን ኣሎ''ኸ ዕውት ጥዕዩ ደው ከየበለ ዝበጽሕ ኣብ ኩሉ
ንዓይ ''ውን ኦ ግይታይ
ናይ ትማል ውህበትካ ገና ኣብ ልበይ ከሎ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 5
ነዚ ወሲኽካንስ
ኣምሳያ ልግስኻስ ''ታይ ኣሎ''ሞ ዝብሎ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ኹሉ ዝሓለፈኩዎ ዓቐብን ቊልቊን ብዓወት ክሰግሮ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 6
እቲ ኹሉ ዝሰገርኩዎ ታኼላን ተኾርባን በርቲዐ ክሰግሮ
ኃይሊ መን ድዩ ነይሩ ነዚ ፈጹም ስቕታይ ኩሉ ዝስበረ
አይንሰኻ''ንዲኻ ዓመታት ትዕግሦተየ ደስታ ዝቐየረ
ኣንታ''ቦ ውዕለተይ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 7
ሓለል''ዪ ብሓቂ ናትካ ውሉድ ምዃን
ብኽብርን ምስጋናን
ኣምልኾን ውዳሴን ዘለዓለም ተመስገን
ኣማን

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 1
Temesgen medheney ametat tiegstey desta qeyrkayo
Nisኻ enete zeyhanets’ka men t’beb mis habo henets’ti seb eyo
Nisኻ enetezeyheleኻ halawi ketema mineቕhe''do ilkayo
Ane''win amlaኸy bizey degef ideka yelen natey zeblo

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 2
Kemey nesኻ iኻ tibat wisht’ey wisht’ey libey ziwkelo
Temesegen amlaኸy
Qidemi kuluneger nisኻ kebereley
Temesegen giytaye

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 3
Qidemi kulu neger liel beleley
Ez...............................
Eti zinefa feresegna kem nifese kihmbeb hayley''do eblo yiኸwn
Eti zimkah biflt’etu ab t’rzi ente bets’hes natey''do eblo yiኸwn

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 4
Men alo diyu fit’ur edme keyhabkayo nezi zerkbelu
Men alo''ኸ ewt t’eyu dew keyebele zibets’h ab kulu
Niay ''win o giytay
Nay timal wihbetka gena ab libey kelo

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 5
Nezi wesiኽkans
Amsaya ligsኻs ''tay alo''mo ziblo
Ez...........................
Eti ኹlu zihalefekuwo aቐbn qwilqwin biawet kisegro

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 6
Eti ኹlu zisegerkuwo taኼlan teኾrban bertia kisegro
Hayli men diyu neyru nezi fets’um siቕtay kulu zisbere
Aynseኻ''nidiኻ ametat tiegsoteye desta ziቐyere
Anta''bo wieletey

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 7
Halel''yi bihaqi natka wilud mikhwan
Biኽbrn misganan
Amlኾn widasen zelealem temesgen
Aman

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 1
ተመስገን መድኀነይ ዓመታት ትዕግሥተይ ደስታ ቀይርካዮ
ንስኻ እነተ ዘይሓነፅካ መን ጥበብ ምስ ሃቦ ሐነፅቲ ሰብ ዕዮ
ንስኻ እነተዘይሐለኻ ሓላዊ ከተማ ምነቕሐ''ዶ ኢልካዮ
አነ''ውን አምላኸይ ብዘይ ደገፍ ኢደካ የለን ናተይ ዘብሎ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 2
ከመይ ነስኻ ኢኻ ትብዓት ውሽጠይ ውሽጠይ ልበይ ዝውከሎ
ተመሰገን አምላኸይ
ቅደሚ ኩሉነገር ንስኻ ከበረለይ
ተመሰገን ግይታየ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 3
ቅደሚ ኩሉ ነገር ልዕል በለለይ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ዝነፍዐ ፈረሰኛ ከም ንፈሰ ክሕምበብ ኃይለይ''ዶ እብሎ ይኸውን
እቲ ዝምካሕ ብፍልጠቱ ኣብ ጥርዚ እንተ በጽሐስ ናተይ''ዶ እብሎ ይኸውን

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 4
መን ኣሎ ድዩ ፍጡር ዕድመ ከይሃብካዮ ነዚ ዘርክበሉ
መን ኣሎ''ኸ ዕውት ጥዕዩ ደው ከየበለ ዝበጽሕ ኣብ ኩሉ
ንዓይ ''ውን ኦ ግይታይ
ናይ ትማል ውህበትካ ገና ኣብ ልበይ ከሎ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 5
ነዚ ወሲኽካንስ
ኣምሳያ ልግስኻስ ''ታይ ኣሎ''ሞ ዝብሎ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ኹሉ ዝሓለፈኩዎ ዓቐብን ቊልቊን ብዓወት ክሰግሮ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 6
እቲ ኹሉ ዝሰገርኩዎ ታኼላን ተኾርባን በርቲዐ ክሰግሮ
ኃይሊ መን ድዩ ነይሩ ነዚ ፈጹም ስቕታይ ኩሉ ዝስበረ
አይንሰኻ''ንዲኻ ዓመታት ትዕግሦተየ ደስታ ዝቐየረ
ኣንታ''ቦ ውዕለተይ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 7
ሓለል''ዪ ብሓቂ ናትካ ውሉድ ምዃን
ብኽብርን ምስጋናን
ኣምልኾን ውዳሴን ዘለዓለም ተመስገን
ኣማን

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ',
        lyrics_transliteration = 'CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 1
Temesgen medheney ametat tiegstey desta qeyrkayo
Nisኻ enete zeyhanets’ka men t’beb mis habo henets’ti seb eyo
Nisኻ enetezeyheleኻ halawi ketema mineቕhe''do ilkayo
Ane''win amlaኸy bizey degef ideka yelen natey zeblo

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 2
Kemey nesኻ iኻ tibat wisht’ey wisht’ey libey ziwkelo
Temesegen amlaኸy
Qidemi kuluneger nisኻ kebereley
Temesegen giytaye

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 3
Qidemi kulu neger liel beleley
Ez...............................
Eti zinefa feresegna kem nifese kihmbeb hayley''do eblo yiኸwn
Eti zimkah biflt’etu ab t’rzi ente bets’hes natey''do eblo yiኸwn

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 4
Men alo diyu fit’ur edme keyhabkayo nezi zerkbelu
Men alo''ኸ ewt t’eyu dew keyebele zibets’h ab kulu
Niay ''win o giytay
Nay timal wihbetka gena ab libey kelo

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 5
Nezi wesiኽkans
Amsaya ligsኻs ''tay alo''mo ziblo
Ez...........................
Eti ኹlu zihalefekuwo aቐbn qwilqwin biawet kisegro

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 6
Eti ኹlu zisegerkuwo taኼlan teኾrban bertia kisegro
Hayli men diyu neyru nezi fets’um siቕtay kulu zisbere
Aynseኻ''nidiኻ ametat tiegsoteye desta ziቐyere
Anta''bo wieletey

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 7
Halel''yi bihaqi natka wilud mikhwan
Biኽbrn misganan
Amlኾn widasen zelealem temesgen
Aman

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c9807d6d-f448-4eb2-926c-4ae363460642'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 1
ተመስገን መድኀነይ ዓመታት ትዕግሥተይ ደስታ ቀይርካዮ
ንስኻ እነተ ዘይሓነፅካ መን ጥበብ ምስ ሃቦ ሐነፅቲ ሰብ ዕዮ
ንስኻ እነተዘይሐለኻ ሓላዊ ከተማ ምነቕሐ''ዶ ኢልካዮ
አነ''ውን አምላኸይ ብዘይ ደገፍ ኢደካ የለን ናተይ ዘብሎ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 2
ከመይ ነስኻ ኢኻ ትብዓት ውሽጠይ ውሽጠይ ልበይ ዝውከሎ
ተመሰገን አምላኸይ
ቅደሚ ኩሉነገር ንስኻ ከበረለይ
ተመሰገን ግይታየ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 3
ቅደሚ ኩሉ ነገር ልዕል በለለይ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ዝነፍዐ ፈረሰኛ ከም ንፈሰ ክሕምበብ ኃይለይ''ዶ እብሎ ይኸውን
እቲ ዝምካሕ ብፍልጠቱ ኣብ ጥርዚ እንተ በጽሐስ ናተይ''ዶ እብሎ ይኸውን

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 4
መን ኣሎ ድዩ ፍጡር ዕድመ ከይሃብካዮ ነዚ ዘርክበሉ
መን ኣሎ''ኸ ዕውት ጥዕዩ ደው ከየበለ ዝበጽሕ ኣብ ኩሉ
ንዓይ ''ውን ኦ ግይታይ
ናይ ትማል ውህበትካ ገና ኣብ ልበይ ከሎ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 5
ነዚ ወሲኽካንስ
ኣምሳያ ልግስኻስ ''ታይ ኣሎ''ሞ ዝብሎ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ኹሉ ዝሓለፈኩዎ ዓቐብን ቊልቊን ብዓወት ክሰግሮ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 6
እቲ ኹሉ ዝሰገርኩዎ ታኼላን ተኾርባን በርቲዐ ክሰግሮ
ኃይሊ መን ድዩ ነይሩ ነዚ ፈጹም ስቕታይ ኩሉ ዝስበረ
አይንሰኻ''ንዲኻ ዓመታት ትዕግሦተየ ደስታ ዝቐየረ
ኣንታ''ቦ ውዕለተይ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 7
ሓለል''ዪ ብሓቂ ናትካ ውሉድ ምዃን
ብኽብርን ምስጋናን
ኣምልኾን ውዳሴን ዘለዓለም ተመስገን
ኣማን

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c9807d6d-f448-4eb2-926c-4ae363460642'::uuid, 'eritrean-orthodox-mezmur-3615', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemin-siraye ("Bemin Siraye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5ac48cd2-4381-476e-8398-5e2d51e38270'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 1
ክርስቲያን በሚል ስም እራሴን ሸፍኜ
ስትመረምረኝ ግን ፍሬ አልባ በለስ ነኝ
ትዕግስትህ ደንቆኛል እንዴት እንዳኖርከኝ (2)
ወይ በራድ ወይ ትኩስ ሳልሆን ለብ ብዬ

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 2
ወደኔ ስትመጣ ባዶ ነኝ ጌታዬ
በሰርግህ ለመግባት ልብሴን ሳላፀዳ
እንደ አብርሃም ቤቴ መች ትሆን እንግዳ (2)
በቃልህ ታንፄ ካልተስተካከልኩኝ

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 3
እኔ ሳልለወጥ ወንጌሉን ከያዝኩኝ
የቱ ምግባሬ ነው ሌላውን የሚያንፅ
ልቤን ስበርልኝ ዛሬ ይብቃኝ አመፅ (2)
ሰማያት በፊትህ ንፁሀን አይደሉም

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 4
በትር ብታነሳ ማንስ ፊትህ ሊቆም
በንስሀ ውሃ ልታጠብ ሀጥያቴን
ይብቃኝ መበደሉ የእውነት ያንተ ልሁን (2)

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 1
Kirstiyan bemil sim erasen shefgne
Sitmeremregn gin fire alba beles negn
Tiegsth denqognal endet endanorkegn (2)
Wey berad wey tikus salhon leb biye

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 2
Wedene sitmet’a bado negn Getaye
Besergh lemegbat libsen salats’eda
Ende abrham bete mech tihon engda (2)
Beqalh tants’e kaltestekakelkugn

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 3
Ene sallewet’ wengelun keyazkugn
Yetu migbare new lelawn yemiyants’
Liben siberlgn zare yibqagn amets’ (2)
Semayat befith nits’uhen aydelum

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 4
Betr bitanesa mans fith liqom
Benshe wiha litat’eb het’yaten
Yibqagn mebedelu yeewnet yante lihun (2)

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 1
ክርስቲያን በሚል ስም እራሴን ሸፍኜ
ስትመረምረኝ ግን ፍሬ አልባ በለስ ነኝ
ትዕግስትህ ደንቆኛል እንዴት እንዳኖርከኝ (2)
ወይ በራድ ወይ ትኩስ ሳልሆን ለብ ብዬ

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 2
ወደኔ ስትመጣ ባዶ ነኝ ጌታዬ
በሰርግህ ለመግባት ልብሴን ሳላፀዳ
እንደ አብርሃም ቤቴ መች ትሆን እንግዳ (2)
በቃልህ ታንፄ ካልተስተካከልኩኝ

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 3
እኔ ሳልለወጥ ወንጌሉን ከያዝኩኝ
የቱ ምግባሬ ነው ሌላውን የሚያንፅ
ልቤን ስበርልኝ ዛሬ ይብቃኝ አመፅ (2)
ሰማያት በፊትህ ንፁሀን አይደሉም

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 4
በትር ብታነሳ ማንስ ፊትህ ሊቆም
በንስሀ ውሃ ልታጠብ ሀጥያቴን
ይብቃኝ መበደሉ የእውነት ያንተ ልሁን (2)

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ',
        lyrics_transliteration = 'CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 1
Kirstiyan bemil sim erasen shefgne
Sitmeremregn gin fire alba beles negn
Tiegsth denqognal endet endanorkegn (2)
Wey berad wey tikus salhon leb biye

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 2
Wedene sitmet’a bado negn Getaye
Besergh lemegbat libsen salats’eda
Ende abrham bete mech tihon engda (2)
Beqalh tants’e kaltestekakelkugn

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 3
Ene sallewet’ wengelun keyazkugn
Yetu migbare new lelawn yemiyants’
Liben siberlgn zare yibqagn amets’ (2)
Semayat befith nits’uhen aydelum

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 4
Betr bitanesa mans fith liqom
Benshe wiha litat’eb het’yaten
Yibqagn mebedelu yeewnet yante lihun (2)

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5ac48cd2-4381-476e-8398-5e2d51e38270'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 1
ክርስቲያን በሚል ስም እራሴን ሸፍኜ
ስትመረምረኝ ግን ፍሬ አልባ በለስ ነኝ
ትዕግስትህ ደንቆኛል እንዴት እንዳኖርከኝ (2)
ወይ በራድ ወይ ትኩስ ሳልሆን ለብ ብዬ

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 2
ወደኔ ስትመጣ ባዶ ነኝ ጌታዬ
በሰርግህ ለመግባት ልብሴን ሳላፀዳ
እንደ አብርሃም ቤቴ መች ትሆን እንግዳ (2)
በቃልህ ታንፄ ካልተስተካከልኩኝ

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 3
እኔ ሳልለወጥ ወንጌሉን ከያዝኩኝ
የቱ ምግባሬ ነው ሌላውን የሚያንፅ
ልቤን ስበርልኝ ዛሬ ይብቃኝ አመፅ (2)
ሰማያት በፊትህ ንፁሀን አይደሉም

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 4
በትር ብታነሳ ማንስ ፊትህ ሊቆም
በንስሀ ውሃ ልታጠብ ሀጥያቴን
ይብቃኝ መበደሉ የእውነት ያንተ ልሁን (2)

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5ac48cd2-4381-476e-8398-5e2d51e38270'::uuid, 'bemin-siraye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yebegena-mezimur-mogese-nesh ("Yebegena Mezimur Mogese Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '824aad00-50ec-485b-aeb0-49c357ddba51'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 1
አመስግኘ ልጨርስ ምንም ቃል አይበቃ
መታወቂያ አርማዬ አሽ የነፍሴ ዉበት
ታምኛለሁ በምልጃሽ የቤቴ ሙላት
በልብሽ ዉስጥ አኑሪኝ ጥሪኝ በአፍሽ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 2
በንጽህናሽ አስጊጭኝ ልቁም ከፊትሽ
መሻቴን ልትሞይ ጸሎቴን ልትሰሚ
ኪዳነቃል ነይልኝ በረድኤት ቅደሚ
በእደስጋ አይደለም በእደ ህሊናየ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 3
እናቴ ይዠየሻለሁ ሁኝኝ ከለላዬ
የራሴ ጌጥ ቀጸላ ነሽና ማዕረጌ
በሰላም እኖራለሁ አንቺን ተስፋ አድርጌ
የቃልኪዳን መዝገብ ርህሩህ ልብ አለሽ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 4
ስላንቺ ይምረኛል ጽኑ ነዉ ኪዳንሽ
ስምሽ በአፌ ጣፈጠ ምግብ መጠጥ ሆነኝ
የምስጥሬ ምስጢር ነሽ ኪዳንሽ ያቆመኝ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 1
Amesggne lich’ers minm qal aybeqa
Metaweqiya armaye ash yenefse wubet
Tamgnalehu bemljash yebete mulat
Belbsh wust’ anurign t’rign beafsh

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 2
Bents’hnash asgich’gn liqum kefitsh
Meshaten litmoy ts’eloten litsemi
Kidaneqal neylgn beredet qidemi
Beedesga aydelem beede hilinaye

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 3
Enate yizheyeshalehu hugngn kelelaye
Yerase get’ qets’ela neshna maerege
Beselam enoralehu anchin tesfa adrge
Yeqalkidan mezgeb rihruh lib alesh

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 4
Silanchi yimregnal ts’nu newu kidansh
Simsh beafe t’afet’e migb met’et’ honegn
Yemst’re mist’ir nesh kidansh yaqomegn

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 1
አመስግኘ ልጨርስ ምንም ቃል አይበቃ
መታወቂያ አርማዬ አሽ የነፍሴ ዉበት
ታምኛለሁ በምልጃሽ የቤቴ ሙላት
በልብሽ ዉስጥ አኑሪኝ ጥሪኝ በአፍሽ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 2
በንጽህናሽ አስጊጭኝ ልቁም ከፊትሽ
መሻቴን ልትሞይ ጸሎቴን ልትሰሚ
ኪዳነቃል ነይልኝ በረድኤት ቅደሚ
በእደስጋ አይደለም በእደ ህሊናየ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 3
እናቴ ይዠየሻለሁ ሁኝኝ ከለላዬ
የራሴ ጌጥ ቀጸላ ነሽና ማዕረጌ
በሰላም እኖራለሁ አንቺን ተስፋ አድርጌ
የቃልኪዳን መዝገብ ርህሩህ ልብ አለሽ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 4
ስላንቺ ይምረኛል ጽኑ ነዉ ኪዳንሽ
ስምሽ በአፌ ጣፈጠ ምግብ መጠጥ ሆነኝ
የምስጥሬ ምስጢር ነሽ ኪዳንሽ ያቆመኝ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ',
        lyrics_transliteration = 'CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 1
Amesggne lich’ers minm qal aybeqa
Metaweqiya armaye ash yenefse wubet
Tamgnalehu bemljash yebete mulat
Belbsh wust’ anurign t’rign beafsh

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 2
Bents’hnash asgich’gn liqum kefitsh
Meshaten litmoy ts’eloten litsemi
Kidaneqal neylgn beredet qidemi
Beedesga aydelem beede hilinaye

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 3
Enate yizheyeshalehu hugngn kelelaye
Yerase get’ qets’ela neshna maerege
Beselam enoralehu anchin tesfa adrge
Yeqalkidan mezgeb rihruh lib alesh

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 4
Silanchi yimregnal ts’nu newu kidansh
Simsh beafe t’afet’e migb met’et’ honegn
Yemst’re mist’ir nesh kidansh yaqomegn

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa',
        updated_at = clock_timestamp()::text
    WHERE import_id = '824aad00-50ec-485b-aeb0-49c357ddba51'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 1
አመስግኘ ልጨርስ ምንም ቃል አይበቃ
መታወቂያ አርማዬ አሽ የነፍሴ ዉበት
ታምኛለሁ በምልጃሽ የቤቴ ሙላት
በልብሽ ዉስጥ አኑሪኝ ጥሪኝ በአፍሽ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 2
በንጽህናሽ አስጊጭኝ ልቁም ከፊትሽ
መሻቴን ልትሞይ ጸሎቴን ልትሰሚ
ኪዳነቃል ነይልኝ በረድኤት ቅደሚ
በእደስጋ አይደለም በእደ ህሊናየ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 3
እናቴ ይዠየሻለሁ ሁኝኝ ከለላዬ
የራሴ ጌጥ ቀጸላ ነሽና ማዕረጌ
በሰላም እኖራለሁ አንቺን ተስፋ አድርጌ
የቃልኪዳን መዝገብ ርህሩህ ልብ አለሽ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 4
ስላንቺ ይምረኛል ጽኑ ነዉ ኪዳንሽ
ስምሽ በአፌ ጣፈጠ ምግብ መጠጥ ሆነኝ
የምስጥሬ ምስጢር ነሽ ኪዳንሽ ያቆመኝ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '824aad00-50ec-485b-aeb0-49c357ddba51'::uuid, 'yebegena-mezimur-mogese-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yemitebikegn-ayitegnam-3283 ("Yemitebikegn Ayitegnam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7bdcfb53-34e5-4ae0-b72c-50e8c0325a79'::uuid
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
    WHERE import_id = '7bdcfb53-34e5-4ae0-b72c-50e8c0325a79'::uuid
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
        '7bdcfb53-34e5-4ae0-b72c-50e8c0325a79'::uuid, 'yemitebikegn-ayitegnam-3283', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yitekal ("Yitekal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '16874240-ba2a-4601-9ed5-efda523d3236'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 1
የሙሴ በረከት ደርሷል የኢያሱ
አምላክ በቃ ብሎ ሲጠራው ወደ እርሱ
ኢያሱን አቆመው በበረታ ጸጋ
የነገሥታት ንጉስ አልፋና ዖሜጋ (2)

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 2
መጎናጸፊያውን ለኤልሳ ትቶለት
ኤልያስ ቢሄድም ቢነጠቅ በእሳት
እጥፍ ድርብ ጸጋ ከሁሉ የሚልቅ
አምላክ ስለሰጠው ፈጽሟል ድንቃቅንቅ /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 3
ከእኔ ብቻ በቀር ማነው ያለው ሌላ
ትጉ አገልግሎት ዝናሩ ያልላላ
እንዲህ አትበሉ እግዚአብሔር ዘገየ
ይሾማል ለቤቱ ጠላት ዓይኑ እያየ /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 4
ቀድሰን ዘምረን ወንጌሉን መስክረን
ወደ ሰማዩ ቤት ደግሞ እነሄዳለን
እግዚአብሔር ያስነሳል ዳግም እንደገና
ዘመኑን የዋጀ እጅጉን የጸና /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 1
Yemuse bereket derswal yeiyasu
Amlak beqa bilo sit’eraw wede ersu
Iyasun aqomew bebereta ts’ega
Yenegestat nigus alfana omega (2)

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 2
Megonats’efiyawn leelsa titolet
Elyas bihedm binet’eq beesat
Et’f dirb ts’ega kehulu yemilq
Amlak sileset’ew fets’mwal dinqaqnq / (2)/

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 3
Keene bicha beqer manew yalew lela
Tigu agelglot zinaru yallala
Endih atbelu Egziabher zegeye
Yishomal lebetu t’elat aynu eyaye / (2)/

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 4
Qedsen zemren wengelun meskren
Wede semayu bet degmo enehedalen
Egziabher yasnesal dagm endegena
Zemenun yewaje ejgun yets’ena / (2)/

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 1
የሙሴ በረከት ደርሷል የኢያሱ
አምላክ በቃ ብሎ ሲጠራው ወደ እርሱ
ኢያሱን አቆመው በበረታ ጸጋ
የነገሥታት ንጉስ አልፋና ዖሜጋ (2)

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 2
መጎናጸፊያውን ለኤልሳ ትቶለት
ኤልያስ ቢሄድም ቢነጠቅ በእሳት
እጥፍ ድርብ ጸጋ ከሁሉ የሚልቅ
አምላክ ስለሰጠው ፈጽሟል ድንቃቅንቅ /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 3
ከእኔ ብቻ በቀር ማነው ያለው ሌላ
ትጉ አገልግሎት ዝናሩ ያልላላ
እንዲህ አትበሉ እግዚአብሔር ዘገየ
ይሾማል ለቤቱ ጠላት ዓይኑ እያየ /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 4
ቀድሰን ዘምረን ወንጌሉን መስክረን
ወደ ሰማዩ ቤት ደግሞ እነሄዳለን
እግዚአብሔር ያስነሳል ዳግም እንደገና
ዘመኑን የዋጀ እጅጉን የጸና /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)',
        lyrics_transliteration = 'CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 1
Yemuse bereket derswal yeiyasu
Amlak beqa bilo sit’eraw wede ersu
Iyasun aqomew bebereta ts’ega
Yenegestat nigus alfana omega (2)

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 2
Megonats’efiyawn leelsa titolet
Elyas bihedm binet’eq beesat
Et’f dirb ts’ega kehulu yemilq
Amlak sileset’ew fets’mwal dinqaqnq / (2)/

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 3
Keene bicha beqer manew yalew lela
Tigu agelglot zinaru yallala
Endih atbelu Egziabher zegeye
Yishomal lebetu t’elat aynu eyaye / (2)/

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 4
Qedsen zemren wengelun meskren
Wede semayu bet degmo enehedalen
Egziabher yasnesal dagm endegena
Zemenun yewaje ejgun yets’ena / (2)/

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '16874240-ba2a-4601-9ed5-efda523d3236'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 1
የሙሴ በረከት ደርሷል የኢያሱ
አምላክ በቃ ብሎ ሲጠራው ወደ እርሱ
ኢያሱን አቆመው በበረታ ጸጋ
የነገሥታት ንጉስ አልፋና ዖሜጋ (2)

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 2
መጎናጸፊያውን ለኤልሳ ትቶለት
ኤልያስ ቢሄድም ቢነጠቅ በእሳት
እጥፍ ድርብ ጸጋ ከሁሉ የሚልቅ
አምላክ ስለሰጠው ፈጽሟል ድንቃቅንቅ /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 3
ከእኔ ብቻ በቀር ማነው ያለው ሌላ
ትጉ አገልግሎት ዝናሩ ያልላላ
እንዲህ አትበሉ እግዚአብሔር ዘገየ
ይሾማል ለቤቱ ጠላት ዓይኑ እያየ /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 4
ቀድሰን ዘምረን ወንጌሉን መስክረን
ወደ ሰማዩ ቤት ደግሞ እነሄዳለን
እግዚአብሔር ያስነሳል ዳግም እንደገና
ዘመኑን የዋጀ እጅጉን የጸና /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '16874240-ba2a-4601-9ed5-efda523d3236'::uuid, 'yitekal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bezebane-kirub ("Bezebane Kirub")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cc6b211a-bc8f-44c8-aae0-a73036b9306a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 1
የተከበረ ነው በሰማይ በምድሩ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 2
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ኢሳይያስ ሲያየው እጅግ አፈረ
የተፈራ ነው የተከበረ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 3
የሰማይ ደጆች ተንቀጠቀጡ
ለቅዱስ ስሙ ክብርን ሲሰጡ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 4
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ያልተቀደሰ ለምስ ያነደደው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 5
እንዴት ይችላል ሊያመሰግነው
ባልፍ ካድልኝ ፍቅርህ ነህና
ልግባ መቅደስህ ላቅርብ ምስጋና
በዘባነ ኪሩብ ለሚቀመጠው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 6
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 7
ዙፋንህ ታየኝ ትምክህቴ ሆይ
ስትመሰገን በሰማይ ላይ
ስያመሰግንህ ያልተደሰተ
ባይተውር አልሆን አልልጣ ካንተ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 8
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 9
የተከበረ ነው በሰማይ በምድሩ
እኔ ሞላበት ያንን ሰገነት
ልቀላቀለው ጠመኝው በእውነት
ልዘምርልህ ባይገባኝም

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 10
ዝምም እልሳን አልሰጠኝም
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 11
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 1
Yetekebere new besemay bemdru
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 2
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru
Isayyas siyayew ejg afere
Yetefera new yetekebere

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 3
Yesemay dejoch tenqet’eqet’u
Leqdus simu kibrn siset’u
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 4
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru
Yalteqedese lems yanededew

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 5
Endet yichlal liyamesegnew
Balf kadlgn fiqrh nehna
Ligba meqdesh laqrb misgana
Bezebane kirub lemiqemet’ew

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 6
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 7
Zufanh tayegn timkhte hoy
Sitmesegen besemay lay
Siyamesegnh yaltedesete
Baytewr alhon allt’a kante

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 8
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 9
Yetekebere new besemay bemdru
Ene molabet yann segenet
Liqelaqelew t’emegnw beewnet
Lizemrlh baygebagnm

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 10
Zimm elsan alset’egnm
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 11
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 1
የተከበረ ነው በሰማይ በምድሩ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 2
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ኢሳይያስ ሲያየው እጅግ አፈረ
የተፈራ ነው የተከበረ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 3
የሰማይ ደጆች ተንቀጠቀጡ
ለቅዱስ ስሙ ክብርን ሲሰጡ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 4
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ያልተቀደሰ ለምስ ያነደደው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 5
እንዴት ይችላል ሊያመሰግነው
ባልፍ ካድልኝ ፍቅርህ ነህና
ልግባ መቅደስህ ላቅርብ ምስጋና
በዘባነ ኪሩብ ለሚቀመጠው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 6
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 7
ዙፋንህ ታየኝ ትምክህቴ ሆይ
ስትመሰገን በሰማይ ላይ
ስያመሰግንህ ያልተደሰተ
ባይተውር አልሆን አልልጣ ካንተ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 8
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 9
የተከበረ ነው በሰማይ በምድሩ
እኔ ሞላበት ያንን ሰገነት
ልቀላቀለው ጠመኝው በእውነት
ልዘምርልህ ባይገባኝም

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 10
ዝምም እልሳን አልሰጠኝም
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 11
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ',
        lyrics_transliteration = 'CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 1
Yetekebere new besemay bemdru
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 2
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru
Isayyas siyayew ejg afere
Yetefera new yetekebere

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 3
Yesemay dejoch tenqet’eqet’u
Leqdus simu kibrn siset’u
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 4
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru
Yalteqedese lems yanededew

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 5
Endet yichlal liyamesegnew
Balf kadlgn fiqrh nehna
Ligba meqdesh laqrb misgana
Bezebane kirub lemiqemet’ew

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 6
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 7
Zufanh tayegn timkhte hoy
Sitmesegen besemay lay
Siyamesegnh yaltedesete
Baytewr alhon allt’a kante

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 8
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 9
Yetekebere new besemay bemdru
Ene molabet yann segenet
Liqelaqelew t’emegnw beewnet
Lizemrlh baygebagnm

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 10
Zimm elsan alset’egnm
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 11
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cc6b211a-bc8f-44c8-aae0-a73036b9306a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 1
የተከበረ ነው በሰማይ በምድሩ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 2
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ኢሳይያስ ሲያየው እጅግ አፈረ
የተፈራ ነው የተከበረ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 3
የሰማይ ደጆች ተንቀጠቀጡ
ለቅዱስ ስሙ ክብርን ሲሰጡ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 4
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ያልተቀደሰ ለምስ ያነደደው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 5
እንዴት ይችላል ሊያመሰግነው
ባልፍ ካድልኝ ፍቅርህ ነህና
ልግባ መቅደስህ ላቅርብ ምስጋና
በዘባነ ኪሩብ ለሚቀመጠው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 6
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 7
ዙፋንህ ታየኝ ትምክህቴ ሆይ
ስትመሰገን በሰማይ ላይ
ስያመሰግንህ ያልተደሰተ
ባይተውር አልሆን አልልጣ ካንተ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 8
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 9
የተከበረ ነው በሰማይ በምድሩ
እኔ ሞላበት ያንን ሰገነት
ልቀላቀለው ጠመኝው በእውነት
ልዘምርልህ ባይገባኝም

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 10
ዝምም እልሳን አልሰጠኝም
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 11
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cc6b211a-bc8f-44c8-aae0-a73036b9306a'::uuid, 'bezebane-kirub', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemin-etsinanalehu ("Bemin Etsinanalehu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cee1cf10-6bbd-4b16-b874-7218857bcc0b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 1
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 2
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 3
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 4
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 1
Cher amlak yeewnet dagna; Amanuel lene metamegna
CHORUS
Ch’eleman alawqm beguzoye; behywete hulu neh meriye;
Tegwazkugn letun bebrhan; beante ayehugn meshagern; (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 2
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Maqerqeren seberk alkugn qena; bertche teramedku endegena;
Qalh hayle yemiyats’enagn; bealet laym yetekelkegn; (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 3
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Enbaye tabese sitats’nanagn; dil yehonew honowal sitredagn;
Bet’elate fit moges honkegn; lebariyahm dil set’eኸgn; (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 4
Cher amlak yeewnet dagna; Amanuel lene metamegna;
CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 1
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 2
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 3
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 4
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/',
        lyrics_transliteration = 'CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 1
Cher amlak yeewnet dagna; Amanuel lene metamegna
CHORUS
Ch’eleman alawqm beguzoye; behywete hulu neh meriye;
Tegwazkugn letun bebrhan; beante ayehugn meshagern; (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 2
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Maqerqeren seberk alkugn qena; bertche teramedku endegena;
Qalh hayle yemiyats’enagn; bealet laym yetekelkegn; (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 3
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Enbaye tabese sitats’nanagn; dil yehonew honowal sitredagn;
Bet’elate fit moges honkegn; lebariyahm dil set’eኸgn; (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 4
Cher amlak yeewnet dagna; Amanuel lene metamegna;
CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cee1cf10-6bbd-4b16-b874-7218857bcc0b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 1
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 2
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 3
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 4
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cee1cf10-6bbd-4b16-b874-7218857bcc0b'::uuid, 'bemin-etsinanalehu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amaldley ("Amaldley")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8374c7e0-4718-474a-8d9b-15bb9788c462'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 1
ተወደቕኩ ዘይልዓል ክትንስእ ሱረይ ዘይንቀል
ምምናው ኣብዩኒ ሓጢኣተይ ክምንን ኩኒ ገዳመይ
ከይቀውም ኣብ ቅድሚ ኣቦ ደኺመ ስኢነ ሓቦ
ወድኺ እንድዩ ት''ምሓሪ ክሰርየለይ ስለይ ቁሚ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 2
ኣዝ
ከይነቅል ብግዜ ሰንበት ከይጎዪ ቅኔ ክራማት
ጸዊዕኪ ከራግፍ ጾረይ ክመንዎ ንንእስነተይ
ኣበሳይ ከየጫጭሖ ንስሓይ ብኣግኡ ክርሖ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 3
ክግልሎ ንጽድቅኺ ሕሰብኒ ኣብ ጸሎትኪ
ኣዝ
የፍቅረካ እየ ጌና ንብዓተይ ስሌኻ ይውሕዛ
ምስ በልኪ ተሰይሩ ልበይ ነባዕኩ ክሕደገለይ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 4
ተስፋይ ፍኖቱ ባዕልኺ ጸላመይ እተብርሂ
ውሉድኪ''የ ዘይደልደለ ታትይኒ ጽድቂ ደልየ።
ኣዝ
ሕሓፍሶ ውዑይ ንብዓትካ ውሉደይ ምለሶ ገጽካ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 5
ዳበልኪ ተጽንዕኒ ኣደ ጎይታይ ንዕኒ
ክበርቀለይ ጸላመይ ክፍትን ምንባር ማርያመይ
ኣትሕዝኒ ዕርፍኺ ክጅምሮ መንገዲ ጽድቂ።
ኣዝ""(2)

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 1
Tewedeቕku zeylal kitnse surey zeynqel
Mimnaw abyuni hat’iatey kimnn kuni gedamey
Keyqewm ab qidmi abo deኺme siine habo
Wedኺ endyu t''mihari kiseryeley siley qumi

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 2
Az
Keyneql bigze senbet keygoyi qine kiramat
Ts’ewieki keragf ts’orey kimenwo ninesnetey
Abesay keyech’ach’ho nishay biagu kirho

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 3
Kigllo nits’dqኺ hisebni ab ts’elotki
Az
Yefqreka eye gena nibatey sileኻ yiwhza
Mis belki teseyru libey nebaeku kihdegeley

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 4
Tesfay finotu baelኺ ts’elamey etebrhi
Wiludki''ye zeydeldele tatyni ts’dqi delye.
Az
Hihafso wiuy nibatka wiludey mileso gets’ka

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 5
Dabelki tets’neni ade goytay nieni
Kiberqeley ts’elamey kiftn minbar maryamey
Athzni erfኺ kijmro mengedi ts’dqi.
Az"" (2)

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 1
ተወደቕኩ ዘይልዓል ክትንስእ ሱረይ ዘይንቀል
ምምናው ኣብዩኒ ሓጢኣተይ ክምንን ኩኒ ገዳመይ
ከይቀውም ኣብ ቅድሚ ኣቦ ደኺመ ስኢነ ሓቦ
ወድኺ እንድዩ ት''ምሓሪ ክሰርየለይ ስለይ ቁሚ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 2
ኣዝ
ከይነቅል ብግዜ ሰንበት ከይጎዪ ቅኔ ክራማት
ጸዊዕኪ ከራግፍ ጾረይ ክመንዎ ንንእስነተይ
ኣበሳይ ከየጫጭሖ ንስሓይ ብኣግኡ ክርሖ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 3
ክግልሎ ንጽድቅኺ ሕሰብኒ ኣብ ጸሎትኪ
ኣዝ
የፍቅረካ እየ ጌና ንብዓተይ ስሌኻ ይውሕዛ
ምስ በልኪ ተሰይሩ ልበይ ነባዕኩ ክሕደገለይ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 4
ተስፋይ ፍኖቱ ባዕልኺ ጸላመይ እተብርሂ
ውሉድኪ''የ ዘይደልደለ ታትይኒ ጽድቂ ደልየ።
ኣዝ
ሕሓፍሶ ውዑይ ንብዓትካ ውሉደይ ምለሶ ገጽካ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 5
ዳበልኪ ተጽንዕኒ ኣደ ጎይታይ ንዕኒ
ክበርቀለይ ጸላመይ ክፍትን ምንባር ማርያመይ
ኣትሕዝኒ ዕርፍኺ ክጅምሮ መንገዲ ጽድቂ።
ኣዝ""(2)

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)',
        lyrics_transliteration = 'CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 1
Tewedeቕku zeylal kitnse surey zeynqel
Mimnaw abyuni hat’iatey kimnn kuni gedamey
Keyqewm ab qidmi abo deኺme siine habo
Wedኺ endyu t''mihari kiseryeley siley qumi

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 2
Az
Keyneql bigze senbet keygoyi qine kiramat
Ts’ewieki keragf ts’orey kimenwo ninesnetey
Abesay keyech’ach’ho nishay biagu kirho

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 3
Kigllo nits’dqኺ hisebni ab ts’elotki
Az
Yefqreka eye gena nibatey sileኻ yiwhza
Mis belki teseyru libey nebaeku kihdegeley

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 4
Tesfay finotu baelኺ ts’elamey etebrhi
Wiludki''ye zeydeldele tatyni ts’dqi delye.
Az
Hihafso wiuy nibatka wiludey mileso gets’ka

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 5
Dabelki tets’neni ade goytay nieni
Kiberqeley ts’elamey kiftn minbar maryamey
Athzni erfኺ kijmro mengedi ts’dqi.
Az"" (2)

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8374c7e0-4718-474a-8d9b-15bb9788c462'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 1
ተወደቕኩ ዘይልዓል ክትንስእ ሱረይ ዘይንቀል
ምምናው ኣብዩኒ ሓጢኣተይ ክምንን ኩኒ ገዳመይ
ከይቀውም ኣብ ቅድሚ ኣቦ ደኺመ ስኢነ ሓቦ
ወድኺ እንድዩ ት''ምሓሪ ክሰርየለይ ስለይ ቁሚ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 2
ኣዝ
ከይነቅል ብግዜ ሰንበት ከይጎዪ ቅኔ ክራማት
ጸዊዕኪ ከራግፍ ጾረይ ክመንዎ ንንእስነተይ
ኣበሳይ ከየጫጭሖ ንስሓይ ብኣግኡ ክርሖ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 3
ክግልሎ ንጽድቅኺ ሕሰብኒ ኣብ ጸሎትኪ
ኣዝ
የፍቅረካ እየ ጌና ንብዓተይ ስሌኻ ይውሕዛ
ምስ በልኪ ተሰይሩ ልበይ ነባዕኩ ክሕደገለይ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 4
ተስፋይ ፍኖቱ ባዕልኺ ጸላመይ እተብርሂ
ውሉድኪ''የ ዘይደልደለ ታትይኒ ጽድቂ ደልየ።
ኣዝ
ሕሓፍሶ ውዑይ ንብዓትካ ውሉደይ ምለሶ ገጽካ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 5
ዳበልኪ ተጽንዕኒ ኣደ ጎይታይ ንዕኒ
ክበርቀለይ ጸላመይ ክፍትን ምንባር ማርያመይ
ኣትሕዝኒ ዕርፍኺ ክጅምሮ መንገዲ ጽድቂ።
ኣዝ""(2)

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8374c7e0-4718-474a-8d9b-15bb9788c462'::uuid, 'amaldley', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tenesitwal-bezih-yelem ("Tenesitwal Bezih Yelem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0dd9f931-ddf3-4af9-936a-9c6bbd9ad1a9'::uuid
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
Hayal new mayireta mahtemun yefeta yetinsaeu geta'
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '0dd9f931-ddf3-4af9-936a-9c6bbd9ad1a9'::uuid
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
Hayal new mayireta mahtemun yefeta yetinsaeu geta';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0dd9f931-ddf3-4af9-936a-9c6bbd9ad1a9'::uuid, 'tenesitwal-bezih-yelem', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-by-bereket-tikue-endegena-gesera ("Eritrean Orthodox Tewahdo Mezmur By Bereket Tikue endegena gesera")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '847742e9-0c14-44f6-aa04-1fe921821f5a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 1
ዕለት ዕለት ዕብየት ዘይብሉ ውሉድነት
ብኣፍ ጥራይ እንተኾይኑ ጐይታ ጐይታ ማለት
ብጽድቅኻ ጸዲቐ ፍረ ካብ ዘይብለይናይ
ኣፍ ኣማኒየ ከንቱያ ህይወተይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 2
ኣብቶም ኣህዛብ ከማን ዘየለ ልማድ
ካብ ተቖጻጸረኒ እቲ ናይ ስጋ ፍቓድ
ንዓኻ እንዳ ኣጽረፍኩ ምንባር ይእከል በቃ
ብቓልካ ኣርመኒ ስርሓኒ ደጊምካ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 3
እንደገና ህይወተይ ለውጦ
እንደገና ንናብራይ ቀይሮ
እንደገና ኣንጺህካ ሕጸበኒ
እንደገና ወደየ በለኒ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 4
ኣበሎ ፍርሓተይ
ዕብየትካ ኣይብጻሕ ፍጹም ኣይትልመድ
እንተ መሓርካንስ ኮይኑኒ ምልማድ
ከምቲ እኳ ፈለማ ዝነበረኒ ትግሃት

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 5
ምለሰለይ ኣቦ ከይጠፍእ ብትዕቢት
ካብ ፍጥረታት ኲሉ ተዘይሓሸ ግብረይ
እቲ ካልኣይ ልደት ኣበይ''ሎ ምድሓነይ
ሸኽሚ ዝኾነኒ ንዓ ቁረጸለይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 6
ንኽብርኻ ይኹን እዚ ክርስትናይ
እንደገና ኣበይ ኣሎ ፍርሃተይ
ኣብ ገዛይ በዳሊ ቅድሚ ሰብ ጸሎተኛ ል
ናይ ኣደባባይ ጭዋ ውሻጠይ ነውረኛ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 7
ርእሰይ እናጠበርኩ ምንባር ሰልኪኒዩ
ብጸጋ ለውጠኒ ሓይለይ ደኺሙዩ
ካብ ፈሪሳውነት ተዘይሓሸ እምነተይ
ባዶነት ካብ መልኦ ስብከተይ ጸሎተይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 8
ጉዑዞይ ንኽሰምር ከቕንዕ ናባኻ
ቅድሚ መስዋእተይ መሓረኒ ደጊምካ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 1
Elet elet ebyet zeyblu wiludnet
Biaf t’ray enteኾynu gweyta gweyta malet
Bits’dqኻ ts’ediቐ fire kab zeybleynay
Af amaniye kentuya hiywetey

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 2
Abtom ahzab keman zeyele limad
Kab teቖts’ats’ereni eti nay siga fiቓd
Niaኻ enda ats’refku minbar yiekel beqa
Biቓlka armeni sirhani degimka

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 3
Endegena hiywetey lewt’o
Endegena ninabray qeyro
Endegena ants’ihka hits’ebeni
Endegena wedeye beleni

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 4
Abelo firhatey
Ebyetka aybts’ah fits’um aytlmed
Ente meharkans koynuni milmad
Kemti ekwa felema zinebereni tighat

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 5
Mileseley abo keyt’efe bitebit
Kab fit’retat kwilu tezeyhashe gibrey
Eti kalay lidet abey''lo midhaney
Sheኽmi ziኾneni nia qurets’eley

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 6
Niኽbrኻ yiኹn ezi kirstnay
Endegena abey alo firhatey
Ab gezay bedali qidmi seb ts’elotegna l
Nay adebabay ch’wa wishat’ey newregna

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 7
Riesey enat’eberku minbar selkiniyu
Bits’ega lewt’eni hayley deኺmuyu
Kab ferisawnet tezeyhashe emnetey
Badonet kab melo sibketey ts’elotey

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 8
Guuzoy niኽsemr keቕne nabaኻ
Qidmi meswaetey mehareni degimka

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 1
ዕለት ዕለት ዕብየት ዘይብሉ ውሉድነት
ብኣፍ ጥራይ እንተኾይኑ ጐይታ ጐይታ ማለት
ብጽድቅኻ ጸዲቐ ፍረ ካብ ዘይብለይናይ
ኣፍ ኣማኒየ ከንቱያ ህይወተይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 2
ኣብቶም ኣህዛብ ከማን ዘየለ ልማድ
ካብ ተቖጻጸረኒ እቲ ናይ ስጋ ፍቓድ
ንዓኻ እንዳ ኣጽረፍኩ ምንባር ይእከል በቃ
ብቓልካ ኣርመኒ ስርሓኒ ደጊምካ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 3
እንደገና ህይወተይ ለውጦ
እንደገና ንናብራይ ቀይሮ
እንደገና ኣንጺህካ ሕጸበኒ
እንደገና ወደየ በለኒ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 4
ኣበሎ ፍርሓተይ
ዕብየትካ ኣይብጻሕ ፍጹም ኣይትልመድ
እንተ መሓርካንስ ኮይኑኒ ምልማድ
ከምቲ እኳ ፈለማ ዝነበረኒ ትግሃት

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 5
ምለሰለይ ኣቦ ከይጠፍእ ብትዕቢት
ካብ ፍጥረታት ኲሉ ተዘይሓሸ ግብረይ
እቲ ካልኣይ ልደት ኣበይ''ሎ ምድሓነይ
ሸኽሚ ዝኾነኒ ንዓ ቁረጸለይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 6
ንኽብርኻ ይኹን እዚ ክርስትናይ
እንደገና ኣበይ ኣሎ ፍርሃተይ
ኣብ ገዛይ በዳሊ ቅድሚ ሰብ ጸሎተኛ ል
ናይ ኣደባባይ ጭዋ ውሻጠይ ነውረኛ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 7
ርእሰይ እናጠበርኩ ምንባር ሰልኪኒዩ
ብጸጋ ለውጠኒ ሓይለይ ደኺሙዩ
ካብ ፈሪሳውነት ተዘይሓሸ እምነተይ
ባዶነት ካብ መልኦ ስብከተይ ጸሎተይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 8
ጉዑዞይ ንኽሰምር ከቕንዕ ናባኻ
ቅድሚ መስዋእተይ መሓረኒ ደጊምካ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ',
        lyrics_transliteration = 'CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 1
Elet elet ebyet zeyblu wiludnet
Biaf t’ray enteኾynu gweyta gweyta malet
Bits’dqኻ ts’ediቐ fire kab zeybleynay
Af amaniye kentuya hiywetey

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 2
Abtom ahzab keman zeyele limad
Kab teቖts’ats’ereni eti nay siga fiቓd
Niaኻ enda ats’refku minbar yiekel beqa
Biቓlka armeni sirhani degimka

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 3
Endegena hiywetey lewt’o
Endegena ninabray qeyro
Endegena ants’ihka hits’ebeni
Endegena wedeye beleni

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 4
Abelo firhatey
Ebyetka aybts’ah fits’um aytlmed
Ente meharkans koynuni milmad
Kemti ekwa felema zinebereni tighat

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 5
Mileseley abo keyt’efe bitebit
Kab fit’retat kwilu tezeyhashe gibrey
Eti kalay lidet abey''lo midhaney
Sheኽmi ziኾneni nia qurets’eley

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 6
Niኽbrኻ yiኹn ezi kirstnay
Endegena abey alo firhatey
Ab gezay bedali qidmi seb ts’elotegna l
Nay adebabay ch’wa wishat’ey newregna

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 7
Riesey enat’eberku minbar selkiniyu
Bits’ega lewt’eni hayley deኺmuyu
Kab ferisawnet tezeyhashe emnetey
Badonet kab melo sibketey ts’elotey

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 8
Guuzoy niኽsemr keቕne nabaኻ
Qidmi meswaetey mehareni degimka

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey',
        updated_at = clock_timestamp()::text
    WHERE import_id = '847742e9-0c14-44f6-aa04-1fe921821f5a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 1
ዕለት ዕለት ዕብየት ዘይብሉ ውሉድነት
ብኣፍ ጥራይ እንተኾይኑ ጐይታ ጐይታ ማለት
ብጽድቅኻ ጸዲቐ ፍረ ካብ ዘይብለይናይ
ኣፍ ኣማኒየ ከንቱያ ህይወተይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 2
ኣብቶም ኣህዛብ ከማን ዘየለ ልማድ
ካብ ተቖጻጸረኒ እቲ ናይ ስጋ ፍቓድ
ንዓኻ እንዳ ኣጽረፍኩ ምንባር ይእከል በቃ
ብቓልካ ኣርመኒ ስርሓኒ ደጊምካ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 3
እንደገና ህይወተይ ለውጦ
እንደገና ንናብራይ ቀይሮ
እንደገና ኣንጺህካ ሕጸበኒ
እንደገና ወደየ በለኒ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 4
ኣበሎ ፍርሓተይ
ዕብየትካ ኣይብጻሕ ፍጹም ኣይትልመድ
እንተ መሓርካንስ ኮይኑኒ ምልማድ
ከምቲ እኳ ፈለማ ዝነበረኒ ትግሃት

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 5
ምለሰለይ ኣቦ ከይጠፍእ ብትዕቢት
ካብ ፍጥረታት ኲሉ ተዘይሓሸ ግብረይ
እቲ ካልኣይ ልደት ኣበይ''ሎ ምድሓነይ
ሸኽሚ ዝኾነኒ ንዓ ቁረጸለይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 6
ንኽብርኻ ይኹን እዚ ክርስትናይ
እንደገና ኣበይ ኣሎ ፍርሃተይ
ኣብ ገዛይ በዳሊ ቅድሚ ሰብ ጸሎተኛ ል
ናይ ኣደባባይ ጭዋ ውሻጠይ ነውረኛ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 7
ርእሰይ እናጠበርኩ ምንባር ሰልኪኒዩ
ብጸጋ ለውጠኒ ሓይለይ ደኺሙዩ
ካብ ፈሪሳውነት ተዘይሓሸ እምነተይ
ባዶነት ካብ መልኦ ስብከተይ ጸሎተይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 8
ጉዑዞይ ንኽሰምር ከቕንዕ ናባኻ
ቅድሚ መስዋእተይ መሓረኒ ደጊምካ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '847742e9-0c14-44f6-aa04-1fe921821f5a'::uuid, 'eritrean-orthodox-tewahdo-mezmur-by-bereket-tikue-endegena-gesera', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yebrhan-gorf-nat-dingl-enatachn ("Yebrhan Gorf Nat Dingl Enatachn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0de486a5-7f2b-4849-9bdd-65531a5501b2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ፅድቅ አለው አንቺ ለማስተናገድ
የሀጥያት ጎተራ ነው የተሞላው በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦ ኦ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የእኔ ልብ ታሳናዳዋለች
ስለሀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦ ኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 1
Ts’egash yidresen (2)yiset’en eyalu
Yeene lib min ts’dq alew anchi lemastenaged
Yehet’yat gotera new yetemolaw besst
ኧre endet (2) Dingil tinurbet o o

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 2
Atts’eyefm yeene lib tasanadawalech
Silehet’yate yeene enat milja taqerbalech
Libachewn yezegu dingln lemasgebat
Hilinachew yimeles ents’ely lezih t’fat

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 3
Amlakn yiza new Dingil yemtmet’aw o o
Eswan sinmels Geta newn yemnasqeymew

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ፅድቅ አለው አንቺ ለማስተናገድ
የሀጥያት ጎተራ ነው የተሞላው በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦ ኦ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የእኔ ልብ ታሳናዳዋለች
ስለሀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦ ኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ',
        lyrics_transliteration = 'CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 1
Ts’egash yidresen (2)yiset’en eyalu
Yeene lib min ts’dq alew anchi lemastenaged
Yehet’yat gotera new yetemolaw besst
ኧre endet (2) Dingil tinurbet o o

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 2
Atts’eyefm yeene lib tasanadawalech
Silehet’yate yeene enat milja taqerbalech
Libachewn yezegu dingln lemasgebat
Hilinachew yimeles ents’ely lezih t’fat

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 3
Amlakn yiza new Dingil yemtmet’aw o o
Eswan sinmels Geta newn yemnasqeymew

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0de486a5-7f2b-4849-9bdd-65531a5501b2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ፅድቅ አለው አንቺ ለማስተናገድ
የሀጥያት ጎተራ ነው የተሞላው በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦ ኦ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የእኔ ልብ ታሳናዳዋለች
ስለሀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦ ኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0de486a5-7f2b-4849-9bdd-65531a5501b2'::uuid, 'yebrhan-gorf-nat-dingl-enatachn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- manew-mekomew-fethe ("Manew Mekomew Fethe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1c89af9d-5ef4-4034-b308-635858c836a2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 1
መኖር አየተመኘሁ እንደቃልህ
ስጋ አሸንፎኛል አልቻልኩም ልጂህ
ልዉጣ ከባቢሎን ግፊን መስራት ትቼ
ዉስጤን ለዉጥልኝ ልቁም ፀንቼ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 2
ህግህን በልቤ ብታኖርም ፅፈህ
በምኞት ታስሬ ዉስጤ መች ታዘዘህ
ለፊትህ የሚቀርብ በጎ ምግባር አጣሁ
የት ይሆን መግቢያዬ በበደሌ ፈራሁ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 3
የወይንህን ሃረግ በደጂህ
ተክለኸኛ ታፈራለች ብለህ
በትጋት ጠበከኝ ፍሬዬን አስበህ ባመቱ ብትመጣ
መራረ ፍሬ አገኘህ ከእኔ ምግባር ታጣ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 4
አንደበቴ ሞልቶ ቃልህ ቢትረፈረፍ
አልቻለም ለልቤ ለዉስጤ ለማትረፍ
በስጋዊ ምኞት ነፍሴ ተፈተነች
የዚህን አለም መንገድ እየተከተለች

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 5
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም(2)

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 1
Menor ayetemegnehu endeqalh
Siga ashenfognal alchalkum lijih
Liwut’a kebabilon gifin mesrat tiche
Wust’en lewut’lgn liqum ts’enche

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 2
Highn belbe bitanorm ts’feh
Bemgnot tasre wust’e mech tazezeh
Lefith yemiqerb bego migbar at’ahu
Yet yihon megbiyaye bebedele ferahu

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 3
Yeweynhn hareg bedejih
Tekleኸgna taferalech bileh
Betgat t’ebekegn fireyen asbeh bametu bitmet’a
Merare fire agegneh keene migbar tat’a

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 4
Andebete molto qalh bitreferef
Alchalem lelbe lewust’e lematref
Besgawi mignot nefse tefetenech
Yezihn alem menged eyeteketelech

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 5
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 1
መኖር አየተመኘሁ እንደቃልህ
ስጋ አሸንፎኛል አልቻልኩም ልጂህ
ልዉጣ ከባቢሎን ግፊን መስራት ትቼ
ዉስጤን ለዉጥልኝ ልቁም ፀንቼ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 2
ህግህን በልቤ ብታኖርም ፅፈህ
በምኞት ታስሬ ዉስጤ መች ታዘዘህ
ለፊትህ የሚቀርብ በጎ ምግባር አጣሁ
የት ይሆን መግቢያዬ በበደሌ ፈራሁ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 3
የወይንህን ሃረግ በደጂህ
ተክለኸኛ ታፈራለች ብለህ
በትጋት ጠበከኝ ፍሬዬን አስበህ ባመቱ ብትመጣ
መራረ ፍሬ አገኘህ ከእኔ ምግባር ታጣ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 4
አንደበቴ ሞልቶ ቃልህ ቢትረፈረፍ
አልቻለም ለልቤ ለዉስጤ ለማትረፍ
በስጋዊ ምኞት ነፍሴ ተፈተነች
የዚህን አለም መንገድ እየተከተለች

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 5
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም(2)

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)',
        lyrics_transliteration = 'CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 1
Menor ayetemegnehu endeqalh
Siga ashenfognal alchalkum lijih
Liwut’a kebabilon gifin mesrat tiche
Wust’en lewut’lgn liqum ts’enche

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 2
Highn belbe bitanorm ts’feh
Bemgnot tasre wust’e mech tazezeh
Lefith yemiqerb bego migbar at’ahu
Yet yihon megbiyaye bebedele ferahu

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 3
Yeweynhn hareg bedejih
Tekleኸgna taferalech bileh
Betgat t’ebekegn fireyen asbeh bametu bitmet’a
Merare fire agegneh keene migbar tat’a

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 4
Andebete molto qalh bitreferef
Alchalem lelbe lewust’e lematref
Besgawi mignot nefse tefetenech
Yezihn alem menged eyeteketelech

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 5
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1c89af9d-5ef4-4034-b308-635858c836a2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 1
መኖር አየተመኘሁ እንደቃልህ
ስጋ አሸንፎኛል አልቻልኩም ልጂህ
ልዉጣ ከባቢሎን ግፊን መስራት ትቼ
ዉስጤን ለዉጥልኝ ልቁም ፀንቼ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 2
ህግህን በልቤ ብታኖርም ፅፈህ
በምኞት ታስሬ ዉስጤ መች ታዘዘህ
ለፊትህ የሚቀርብ በጎ ምግባር አጣሁ
የት ይሆን መግቢያዬ በበደሌ ፈራሁ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 3
የወይንህን ሃረግ በደጂህ
ተክለኸኛ ታፈራለች ብለህ
በትጋት ጠበከኝ ፍሬዬን አስበህ ባመቱ ብትመጣ
መራረ ፍሬ አገኘህ ከእኔ ምግባር ታጣ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 4
አንደበቴ ሞልቶ ቃልህ ቢትረፈረፍ
አልቻለም ለልቤ ለዉስጤ ለማትረፍ
በስጋዊ ምኞት ነፍሴ ተፈተነች
የዚህን አለም መንገድ እየተከተለች

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 5
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም(2)

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1c89af9d-5ef4-4034-b308-635858c836a2'::uuid, 'manew-mekomew-fethe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- how-marvelous-is-mary ("How marvelous is Mary")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '333ca705-9c7d-4ee1-9150-50f62169ea9c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
observed with his eyes /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Observed with his eyes (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '333ca705-9c7d-4ee1-9150-50f62169ea9c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
observed with his eyes /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '333ca705-9c7d-4ee1-9150-50f62169ea9c'::uuid, 'how-marvelous-is-mary', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- misiganaw-yiketil ("Misiganaw Yiketil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '577e1d9f-1f5b-4684-a836-42cee80b84ad'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 1
አዝ
የሰማዕይታቱ ደም የፈሰሰው በምድር
አይተናል ሲያስቀጥል የክርስታናን ዘር
እንድናምን ብቻ መች ተጠራን እና

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 2
በእሳቱም መካከል ቅኔ አለን ምስጋና
መች ማጥፋት ይቻላል እሳትን በእሳት
አይቆምም ማሕሌት ቅዳሴ ሰአታት
ከሰማይም በላይ ከሰማይም በታች

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 3
ቤተ ክርስቲያን ዛሬም ነገም አለች
የዓለም ጨው ሆነን በዓለም የበዛነው
እየተደበደብን እየተገፋን ነው
በገደሉን ጊዜ ቁጥራችን ይበዛል

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 4
ከሞትም በኃላ ሕይወት ይቀጥላል
የተስፋይቱን ምድር ተነሱ እንወርሳለን
በመዝሙር በእልልታ ቅጥሩን እያፈረስን
የሰላዮቹን ቃል ሰምታችሑ አትፍሩ

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 5
በሀይማኖት ጽኑ በእምነታሑ ኑሩ
አዝ

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 1
CHORUS
Yesemaeytatu dem yefesesew bemdr
Aytenal siyasqet’l yekrstanan zer
Endnamn bicha mech tet’eran ena

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 2
Beesatum mekakel qine alen misgana
Mech mat’fat yichalal esatn beesat
Ayqomm mahlet qidase seatat
Kesemaym belay kesemaym betach

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 3
Bete Kristian zarem negem alech
Yealem ch’ew honen bealem yebezanew
Eyetedebedebn eyetegefan new
Begedelun gize qut’rachn yibezal

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 4
Kemotm behala hiywet yiqet’lal
Yetesfaytun midr tenesu enwersalen
Bemezmur beellta qit’run eyaferesn
Yeselayochun qal semtachhu atfru

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 5
Beheymanot ts’nu beemnetahu nuru
CHORUS

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 1
አዝ
የሰማዕይታቱ ደም የፈሰሰው በምድር
አይተናል ሲያስቀጥል የክርስታናን ዘር
እንድናምን ብቻ መች ተጠራን እና

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 2
በእሳቱም መካከል ቅኔ አለን ምስጋና
መች ማጥፋት ይቻላል እሳትን በእሳት
አይቆምም ማሕሌት ቅዳሴ ሰአታት
ከሰማይም በላይ ከሰማይም በታች

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 3
ቤተ ክርስቲያን ዛሬም ነገም አለች
የዓለም ጨው ሆነን በዓለም የበዛነው
እየተደበደብን እየተገፋን ነው
በገደሉን ጊዜ ቁጥራችን ይበዛል

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 4
ከሞትም በኃላ ሕይወት ይቀጥላል
የተስፋይቱን ምድር ተነሱ እንወርሳለን
በመዝሙር በእልልታ ቅጥሩን እያፈረስን
የሰላዮቹን ቃል ሰምታችሑ አትፍሩ

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 5
በሀይማኖት ጽኑ በእምነታሑ ኑሩ
አዝ

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው',
        lyrics_transliteration = 'CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 1
CHORUS
Yesemaeytatu dem yefesesew bemdr
Aytenal siyasqet’l yekrstanan zer
Endnamn bicha mech tet’eran ena

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 2
Beesatum mekakel qine alen misgana
Mech mat’fat yichalal esatn beesat
Ayqomm mahlet qidase seatat
Kesemaym belay kesemaym betach

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 3
Bete Kristian zarem negem alech
Yealem ch’ew honen bealem yebezanew
Eyetedebedebn eyetegefan new
Begedelun gize qut’rachn yibezal

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 4
Kemotm behala hiywet yiqet’lal
Yetesfaytun midr tenesu enwersalen
Bemezmur beellta qit’run eyaferesn
Yeselayochun qal semtachhu atfru

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 5
Beheymanot ts’nu beemnetahu nuru
CHORUS

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '577e1d9f-1f5b-4684-a836-42cee80b84ad'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው
አዝ ===
የሰማዕይታቱ ደም የፈሰሰው በምድር
አይተናል ሲያስቀጥል የክርስታናን ዘር
እንድናምን ብቻ መች ተጠራን እና
በእሳቱም መካከል ቅኔ አለን ምስጋና
መች ማጥፋት ይቻላል እሳትን በእሳት
አይቆምም ማሕሌት ቅዳሴ ሰአታት
ከሰማይም በላይ ከሰማይም በታች
ቤተ ክርስቲያን ዛሬም ነገም አለች
የዓለም ጨው ሆነን በዓለም የበዛነው
እየተደበደብን እየተገፋን ነው
በገደሉን ጊዜ ቁጥራችን ይበዛል
ከሞትም በኃላ ሕይወት ይቀጥላል
የተስፋይቱን ምድር ተነሱ እንወርሳለን
በመዝሙር በእልልታ ቅጥሩን እያፈረስን
የሰላዮቹን ቃል ሰምታችሑ አትፍሩ
በሀይማኖት ጽኑ በእምነታሑ ኑሩ
አዝ ===

VERSE 1
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው
አዝ ===
የሰማዕይታቱ ደም የፈሰሰው በምድር
አይተናል ሲያስቀጥል የክርስታናን ዘር
እንድናምን ብቻ መች ተጠራን እና
በእሳቱም መካከል ቅኔ አለን ምስጋና
መች ማጥፋት ይቻላል እሳትን በእሳት
አይቆምም ማሕሌት ቅዳሴ ሰአታት
ከሰማይም በላይ ከሰማይም በታች
ቤተ ክርስቲያን ዛሬም ነገም አለች
የዓለም ጨው ሆነን በዓለም የበዛነው
እየተደበደብን እየተገፋን ነው
በገደሉን ጊዜ ቁጥራችን ይበዛል
ከሞትም በኃላ ሕይወት ይቀጥላል
የተስፋይቱን ምድር ተነሱ እንወርሳለን
በመዝሙር በእልልታ ቅጥሩን እያፈረስን
የሰላዮቹን ቃል ሰምታችሑ አትፍሩ
በሀይማኖት ጽኑ በእምነታሑ ኑሩ
አዝ ===

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው
አዝ ===
የሰማዕይታቱ ደም የፈሰሰው በምድር
አይተናል ሲያስቀጥል የክርስታናን ዘር
እንድናምን ብቻ መች ተጠራን እና
በእሳቱም መካከል ቅኔ አለን ምስጋና
መች ማጥፋት ይቻላል እሳትን በእሳት
አይቆምም ማሕሌት ቅዳሴ ሰአታት
ከሰማይም በላይ ከሰማይም በታች
ቤተ ክርስቲያን ዛሬም ነገም አለች
የዓለም ጨው ሆነን በዓለም የበዛነው
እየተደበደብን እየተገፋን ነው
በገደሉን ጊዜ ቁጥራችን ይበዛል
ከሞትም በኃላ ሕይወት ይቀጥላል
የተስፋይቱን ምድር ተነሱ እንወርሳለን
በመዝሙር በእልልታ ቅጥሩን እያፈረስን
የሰላዮቹን ቃል ሰምታችሑ አትፍሩ
በሀይማኖት ጽኑ በእምነታሑ ኑሩ
አዝ ==='
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '577e1d9f-1f5b-4684-a836-42cee80b84ad'::uuid, 'misiganaw-yiketil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- liredagn-meta ("LIredagn meta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '797c1665-cf6d-43cb-be9a-c3ba32a461dc'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሊረዳኝ መጣ ኃያል ሚካኤል',
        lyrics_transliteration = 'CHORUS
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
Liredagn met’a hayal Mikael',
        updated_at = clock_timestamp()::text
    WHERE import_id = '797c1665-cf6d-43cb-be9a-c3ba32a461dc'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '797c1665-cf6d-43cb-be9a-c3ba32a461dc'::uuid, 'liredagn-meta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mikael-siyum ("Mikael Siyum")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cfd7e7be-ea30-497f-ad9a-9fb52c4dd38a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 1
አዘጋጅተኸኛል ለሰማይ መንግስትህ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 2
በከንቱ እንዳልደክም ነብሴ እንዳትዝል
ትመግበኝ ነበር የህወትን ቃል
ወጣሁኝ ከአለም ተሰሎንቄን ረሣሁ
መጠማቴ ቀረ የህይወት ውሀ ጠጣሁ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 3
መዳንን እንድወርስ ሞትን እንዳላይ
ትረዳኝ ነበረ ከኔ ሣትለይ
በመንገዴ ሁሉ ከፊቴ ቀደምክ
አማኑኤል ብዬ ጌታን እንዳመልክ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 4
ምልጃህን ታምኜ ስኖር በመቅደስህ
ታሻግረኝ ነበር እጆቼን ይዘህ
በጎልማሣ ነቴ ነህና ከጎኔ
ጉልበቴም አንተው ነህ በእርጅና ዘመኔ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 1
Azegajteኸgnal lesemay mengsth

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 2
Bekentu endaldekm nebse endatzl
Timegbegn neber yehwetn qal
Wet’ahugn kealem teselonqen resahu
Met’emate qere yehywet wihe t’et’ahu

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 3
Medann endwers motn endalay
Tiredagn nebere kene satley
Bemengede hulu kefite qedemk
Amanuel biye getan endamelk

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 4
Miljahn tamgne sinor bemeqdesh
Tashagregn neber ejochen yizeh
Begolmasa nete nehna kegone
Gulbetem antew neh beerjna zemene

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 1
አዘጋጅተኸኛል ለሰማይ መንግስትህ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 2
በከንቱ እንዳልደክም ነብሴ እንዳትዝል
ትመግበኝ ነበር የህወትን ቃል
ወጣሁኝ ከአለም ተሰሎንቄን ረሣሁ
መጠማቴ ቀረ የህይወት ውሀ ጠጣሁ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 3
መዳንን እንድወርስ ሞትን እንዳላይ
ትረዳኝ ነበረ ከኔ ሣትለይ
በመንገዴ ሁሉ ከፊቴ ቀደምክ
አማኑኤል ብዬ ጌታን እንዳመልክ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 4
ምልጃህን ታምኜ ስኖር በመቅደስህ
ታሻግረኝ ነበር እጆቼን ይዘህ
በጎልማሣ ነቴ ነህና ከጎኔ
ጉልበቴም አንተው ነህ በእርጅና ዘመኔ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት',
        lyrics_transliteration = 'CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 1
Azegajteኸgnal lesemay mengsth

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 2
Bekentu endaldekm nebse endatzl
Timegbegn neber yehwetn qal
Wet’ahugn kealem teselonqen resahu
Met’emate qere yehywet wihe t’et’ahu

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 3
Medann endwers motn endalay
Tiredagn nebere kene satley
Bemengede hulu kefite qedemk
Amanuel biye getan endamelk

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 4
Miljahn tamgne sinor bemeqdesh
Tashagregn neber ejochen yizeh
Begolmasa nete nehna kegone
Gulbetem antew neh beerjna zemene

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cfd7e7be-ea30-497f-ad9a-9fb52c4dd38a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 1
አዘጋጅተኸኛል ለሰማይ መንግስትህ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 2
በከንቱ እንዳልደክም ነብሴ እንዳትዝል
ትመግበኝ ነበር የህወትን ቃል
ወጣሁኝ ከአለም ተሰሎንቄን ረሣሁ
መጠማቴ ቀረ የህይወት ውሀ ጠጣሁ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 3
መዳንን እንድወርስ ሞትን እንዳላይ
ትረዳኝ ነበረ ከኔ ሣትለይ
በመንገዴ ሁሉ ከፊቴ ቀደምክ
አማኑኤል ብዬ ጌታን እንዳመልክ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 4
ምልጃህን ታምኜ ስኖር በመቅደስህ
ታሻግረኝ ነበር እጆቼን ይዘህ
በጎልማሣ ነቴ ነህና ከጎኔ
ጉልበቴም አንተው ነህ በእርጅና ዘመኔ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cfd7e7be-ea30-497f-ad9a-9fb52c4dd38a'::uuid, 'mikael-siyum', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- smki-xewie ("Smki-Xewie")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b2089d72-440a-45a7-86cb-1f6d457c1588'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እንሆ ምስጋናይ ተቐበልኒ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Enho misganay teቐbelni (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b2089d72-440a-45a7-86cb-1f6d457c1588'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እንሆ ምስጋናይ ተቐበልኒ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b2089d72-440a-45a7-86cb-1f6d457c1588'::uuid, 'smki-xewie', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gubaeyachin-mariyam ("Gubaeyachin Mariyam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8672327d-8580-4a39-9c5b-dca52d5eeb7a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የድኅነት አስኳላ የሥጋዌ ቀለም፥'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Yedhnet askwala yesgawe qelem:'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '8672327d-8580-4a39-9c5b-dca52d5eeb7a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የድኅነት አስኳላ የሥጋዌ ቀለም፥'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8672327d-8580-4a39-9c5b-dca52d5eeb7a'::uuid, 'gubaeyachin-mariyam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bichayen-negn-biye-alawikim ("Bichayen Negn Biye Alawikim")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f7a0998c-bfb7-46ab-8824-128d24eb3510'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 1
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ
መነሻዬ መድረሻዬ
ብቻዬን ነኝ ብዬ አላዉቅም

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 2
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 3
በማዳኑ ተቀድሼ
ስሙ ሆንዋል አዳራሼ
ስሙ ሆንዋል አዳራሼ
ነፍሴ ሌላ አትምረጪ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 4
ነፍሴ ሌላ አትምረጪ
ሕይወት የለም ከእርሱ ዉጪ
ሕይወት የለም ከእርሱ ዉጪ
ስላጣሁኝ አይሸሸኝም

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 5
ስላጣሁኝ አይሸሸኝም
ከኔ ጋር ነዉ ሲኖረኝም
ከኔ ጋር ነዉ ሲኖረኝም
የሚኖረኝ በመንፈሱ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 6
የሚያኖረኝ በመንፈሱ
እኔም የእርሱ ብርቄም እርሱ
ዝማሬ መላእክት ያሰማልን

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 1
Egziabher newu t’ebaqiye
Meneshaye medreshaye
Meneshaye medreshaye
Bichayen negn biye alawuqm

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 2
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye
Meneshaye medreshaye

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 3
Bemadanu teqedshe
Simu honwal adarashe
Simu honwal adarashe
Nefse lela atmrech’i

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 4
Nefse lela atmrech’i
Hiywet yelem keersu wuch’i
Hiywet yelem keersu wuch’i
Silat’ahugn aysheshegnm

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 5
Silat’ahugn aysheshegnm
Kene gar newu sinoregnm
Kene gar newu sinoregnm
Yeminoregn bemenfesu

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 6
Yemiyanoregn bemenfesu
Enem yeersu birqem ersu
Zimare melaekt yasemaln

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 1
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ
መነሻዬ መድረሻዬ
ብቻዬን ነኝ ብዬ አላዉቅም

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 2
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 3
በማዳኑ ተቀድሼ
ስሙ ሆንዋል አዳራሼ
ስሙ ሆንዋል አዳራሼ
ነፍሴ ሌላ አትምረጪ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 4
ነፍሴ ሌላ አትምረጪ
ሕይወት የለም ከእርሱ ዉጪ
ሕይወት የለም ከእርሱ ዉጪ
ስላጣሁኝ አይሸሸኝም

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 5
ስላጣሁኝ አይሸሸኝም
ከኔ ጋር ነዉ ሲኖረኝም
ከኔ ጋር ነዉ ሲኖረኝም
የሚኖረኝ በመንፈሱ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 6
የሚያኖረኝ በመንፈሱ
እኔም የእርሱ ብርቄም እርሱ
ዝማሬ መላእክት ያሰማልን

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ',
        lyrics_transliteration = 'CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 1
Egziabher newu t’ebaqiye
Meneshaye medreshaye
Meneshaye medreshaye
Bichayen negn biye alawuqm

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 2
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye
Meneshaye medreshaye

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 3
Bemadanu teqedshe
Simu honwal adarashe
Simu honwal adarashe
Nefse lela atmrech’i

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 4
Nefse lela atmrech’i
Hiywet yelem keersu wuch’i
Hiywet yelem keersu wuch’i
Silat’ahugn aysheshegnm

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 5
Silat’ahugn aysheshegnm
Kene gar newu sinoregnm
Kene gar newu sinoregnm
Yeminoregn bemenfesu

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 6
Yemiyanoregn bemenfesu
Enem yeersu birqem ersu
Zimare melaekt yasemaln

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f7a0998c-bfb7-46ab-8824-128d24eb3510'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 1
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ
መነሻዬ መድረሻዬ
ብቻዬን ነኝ ብዬ አላዉቅም

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 2
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 3
በማዳኑ ተቀድሼ
ስሙ ሆንዋል አዳራሼ
ስሙ ሆንዋል አዳራሼ
ነፍሴ ሌላ አትምረጪ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 4
ነፍሴ ሌላ አትምረጪ
ሕይወት የለም ከእርሱ ዉጪ
ሕይወት የለም ከእርሱ ዉጪ
ስላጣሁኝ አይሸሸኝም

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 5
ስላጣሁኝ አይሸሸኝም
ከኔ ጋር ነዉ ሲኖረኝም
ከኔ ጋር ነዉ ሲኖረኝም
የሚኖረኝ በመንፈሱ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 6
የሚያኖረኝ በመንፈሱ
እኔም የእርሱ ብርቄም እርሱ
ዝማሬ መላእክት ያሰማልን

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f7a0998c-bfb7-46ab-8824-128d24eb3510'::uuid, 'bichayen-negn-biye-alawikim', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ceru-hoyi-nana-d-hizkyas-birhanu ("ceru hoyi nana D/hizkyas birhanu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '885816fd-1208-4e2f-9d05-5fa59e4ce25c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 1
አይተህ እንዳላዬህ
ሁሉን ታልፈዋለህ
ፍቅራዊ አባት ነህ
አማኑኤል ጌታ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 2
ቸሩ ፈጣሪያችን
ውለታህ ብዙ ነው
ለኛ የዋልክልን
አይነ ስውር መሪ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 3
ምርኩዝ መመኪያ ነህ
አንተን የሚመስል
ምንም ነገር የለም
ምህረት እና ፍቅርህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 4
ወሰን ወደር የለው
ሳንወድህ ወደኸን
ፈልገህ ጠራኸን
በከብቶች ማደሪያ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 5
በዚያች ትንሽ ግርግም
ተወልዶ አዳነን
ጌታ መድኃኔአለም
እልል በሉ ሰዎች

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 6
ባንድ ላይ ዘምሩ
ስብሀት ለእግዚአብሔር
በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 1
Ayteh endalayeh
Hulun talfewaleh
Fiqrawi abat neh
Amanuel Geta

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 2
Cheru fet’ariyachn
Wiletah bizu new
Legna yewalkln
Ayne siwr meri

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 3
Mirkuz memekiya neh
Anten yemimesl
Minm neger yelem
Mihret ena fiqrh

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 4
Wesen weder yelew
Sanwedh wedeኸn
Felgeh t’eraኸn
Bekebtoch maderiya

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 5
Beziyach tinsh girgm
Teweldo adanen
Geta medhanealem
Ell belu sewoch

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 6
Band lay zemru
Sibhet leEgziabher
Bearyam belu

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 1
አይተህ እንዳላዬህ
ሁሉን ታልፈዋለህ
ፍቅራዊ አባት ነህ
አማኑኤል ጌታ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 2
ቸሩ ፈጣሪያችን
ውለታህ ብዙ ነው
ለኛ የዋልክልን
አይነ ስውር መሪ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 3
ምርኩዝ መመኪያ ነህ
አንተን የሚመስል
ምንም ነገር የለም
ምህረት እና ፍቅርህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 4
ወሰን ወደር የለው
ሳንወድህ ወደኸን
ፈልገህ ጠራኸን
በከብቶች ማደሪያ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 5
በዚያች ትንሽ ግርግም
ተወልዶ አዳነን
ጌታ መድኃኔአለም
እልል በሉ ሰዎች

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 6
ባንድ ላይ ዘምሩ
ስብሀት ለእግዚአብሔር
በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ',
        lyrics_transliteration = 'CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 1
Ayteh endalayeh
Hulun talfewaleh
Fiqrawi abat neh
Amanuel Geta

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 2
Cheru fet’ariyachn
Wiletah bizu new
Legna yewalkln
Ayne siwr meri

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 3
Mirkuz memekiya neh
Anten yemimesl
Minm neger yelem
Mihret ena fiqrh

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 4
Wesen weder yelew
Sanwedh wedeኸn
Felgeh t’eraኸn
Bekebtoch maderiya

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 5
Beziyach tinsh girgm
Teweldo adanen
Geta medhanealem
Ell belu sewoch

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 6
Band lay zemru
Sibhet leEgziabher
Bearyam belu

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah',
        updated_at = clock_timestamp()::text
    WHERE import_id = '885816fd-1208-4e2f-9d05-5fa59e4ce25c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 1
አይተህ እንዳላዬህ
ሁሉን ታልፈዋለህ
ፍቅራዊ አባት ነህ
አማኑኤል ጌታ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 2
ቸሩ ፈጣሪያችን
ውለታህ ብዙ ነው
ለኛ የዋልክልን
አይነ ስውር መሪ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 3
ምርኩዝ መመኪያ ነህ
አንተን የሚመስል
ምንም ነገር የለም
ምህረት እና ፍቅርህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 4
ወሰን ወደር የለው
ሳንወድህ ወደኸን
ፈልገህ ጠራኸን
በከብቶች ማደሪያ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 5
በዚያች ትንሽ ግርግም
ተወልዶ አዳነን
ጌታ መድኃኔአለም
እልል በሉ ሰዎች

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 6
ባንድ ላይ ዘምሩ
ስብሀት ለእግዚአብሔር
በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '885816fd-1208-4e2f-9d05-5fa59e4ce25c'::uuid, 'ceru-hoyi-nana-d-hizkyas-birhanu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zekariyas-hoy ("Zekariyas Hoy")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0b9aa627-0ee2-4f3e-af54-9d59d54d21dd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 1
ያንተ ብቻ አይደለም የዮሐንስ ልደት
ምክንያት ነው እርሱ ለፍጥረት መደሰት
መንገድን ይጠርጋል ለሰማይ ፈጣሪ
የሕግ መምህር ነው የሁሉ መካሪ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 2
ማንም አይመስለውም ከሴት ልጆች ሁሉ
ብሎ ያከበረው ክርስቶስ በቃሉ
ነቢዩ ዮሐንስ ቅዱስ ሐዋርያ
ካህንና ሰማዕት ነው የእርሱ መጠሪያ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 3
ጫማውን ልፈታ አይገባኝም ሲል
አምላኩን በማጥመቅ አየነው ከፍ ሲል
አርጅቼአለሁ ብሎ ላዘነው በከንቱ
የማታ እንጀራ ነው ዮሐንስ ለአባቱ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 4
ገና ሳይወለድ መንፈስ ሞልቶበታል
መናኝ ነው እርሱ በዱር ተንከራትቶአል
እዩት ተመልከቱት ዮሐንስ ትጋቱን
በእናቱ ማሕፀን ጀመረ ስግደቱን

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 1
Yante bicha aydelem yeyohens lidet
Miknyat new ersu left’ret medeset
Mengedn yit’ergal lesemay fet’ari
Yehg memhr new yehulu mekari

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 2
Manm aymeslewm keset lijoch hulu
Bilo yakeberew Kristos beqalu
Nebiyu yohens Kidus hewarya
Kahnna semaet new yeersu met’eriya

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 3
Ch’amawn lifeta aygebagnm sil
Amlakun bemat’meq ayenew kef sil
Arjchealehu bilo lazenew bekentu
Yemata enjera new yohens leabatu

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 4
Gena sayweled menfes moltobetal
Menagn new ersu bedur tenkerattoal
Eyut temelketut yohens tigatun
Beenatu mahts’en jemere sigdetun

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 1
ያንተ ብቻ አይደለም የዮሐንስ ልደት
ምክንያት ነው እርሱ ለፍጥረት መደሰት
መንገድን ይጠርጋል ለሰማይ ፈጣሪ
የሕግ መምህር ነው የሁሉ መካሪ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 2
ማንም አይመስለውም ከሴት ልጆች ሁሉ
ብሎ ያከበረው ክርስቶስ በቃሉ
ነቢዩ ዮሐንስ ቅዱስ ሐዋርያ
ካህንና ሰማዕት ነው የእርሱ መጠሪያ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 3
ጫማውን ልፈታ አይገባኝም ሲል
አምላኩን በማጥመቅ አየነው ከፍ ሲል
አርጅቼአለሁ ብሎ ላዘነው በከንቱ
የማታ እንጀራ ነው ዮሐንስ ለአባቱ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 4
ገና ሳይወለድ መንፈስ ሞልቶበታል
መናኝ ነው እርሱ በዱር ተንከራትቶአል
እዩት ተመልከቱት ዮሐንስ ትጋቱን
በእናቱ ማሕፀን ጀመረ ስግደቱን

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ',
        lyrics_transliteration = 'CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 1
Yante bicha aydelem yeyohens lidet
Miknyat new ersu left’ret medeset
Mengedn yit’ergal lesemay fet’ari
Yehg memhr new yehulu mekari

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 2
Manm aymeslewm keset lijoch hulu
Bilo yakeberew Kristos beqalu
Nebiyu yohens Kidus hewarya
Kahnna semaet new yeersu met’eriya

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 3
Ch’amawn lifeta aygebagnm sil
Amlakun bemat’meq ayenew kef sil
Arjchealehu bilo lazenew bekentu
Yemata enjera new yohens leabatu

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 4
Gena sayweled menfes moltobetal
Menagn new ersu bedur tenkerattoal
Eyut temelketut yohens tigatun
Beenatu mahts’en jemere sigdetun

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0b9aa627-0ee2-4f3e-af54-9d59d54d21dd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 1
ያንተ ብቻ አይደለም የዮሐንስ ልደት
ምክንያት ነው እርሱ ለፍጥረት መደሰት
መንገድን ይጠርጋል ለሰማይ ፈጣሪ
የሕግ መምህር ነው የሁሉ መካሪ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 2
ማንም አይመስለውም ከሴት ልጆች ሁሉ
ብሎ ያከበረው ክርስቶስ በቃሉ
ነቢዩ ዮሐንስ ቅዱስ ሐዋርያ
ካህንና ሰማዕት ነው የእርሱ መጠሪያ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 3
ጫማውን ልፈታ አይገባኝም ሲል
አምላኩን በማጥመቅ አየነው ከፍ ሲል
አርጅቼአለሁ ብሎ ላዘነው በከንቱ
የማታ እንጀራ ነው ዮሐንስ ለአባቱ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 4
ገና ሳይወለድ መንፈስ ሞልቶበታል
መናኝ ነው እርሱ በዱር ተንከራትቶአል
እዩት ተመልከቱት ዮሐንስ ትጋቱን
በእናቱ ማሕፀን ጀመረ ስግደቱን

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0b9aa627-0ee2-4f3e-af54-9d59d54d21dd'::uuid, 'zekariyas-hoy', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- medihanealem-789 ("Medihanealem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fd998a54-191c-493e-af42-862860b81a80'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 1
" አዝማች "
አልቅሼ ነገርኩህ በሀዘን ደክሜ
አብዝቼ ጠራሁህ ከመቅደስህ ቆሜ
አዘነበልክልኝ ቃሌን መቼ አለፍከው

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 2
አይዞሽ ልጄ ብለህ እንባዬን አበስከው
" አዝማች"
ከፊት እየቀደምክ መንገድ የምትመራ
ብርሐን የሆንክልን በመስቀልህ ስራ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 3
እውነተኛ መድህን የሒወት እንጀራ
የሁሉ አስገኚ ግሩም የሱ ስራ
" አዝማች "
ያላለፍኩት የለም አንተን ተጠግቼ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 4
መጽናቴ በአንተ ነው ስምህን ጠርቼ
የበረከቴ ምንጭ የጎጆዬ ሙላት
ለደከመች ነፍሴ ማረፊያ ሆንክላት
" አዝማች "

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 5
ዳግም ልጅ ተባልኩ በደሌን ሻርክልኝ
በከበረው ደምህ ባሪያህን ገዛህኝ
ሳወድስህ ልኑር ዘወትር በዝማሬ
መድኃኒአለም ሆንከኝ ሞገስና ክብሬ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 1
" azmach "
Alqshe negerkuh behezen dekme
Abzche t’erahuh kemeqdesh qome
Azenebelklgn qalen meche alefkew

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 2
Ayzosh lije bileh enbayen abeskew
" azmach"
Kefit eyeqedemk menged yemtmera
Birhen yehonkln bemesqelh sira

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 3
Ewnetegna medhn yehiwet enjera
Yehulu asgegni girum yesu sira
" azmach "
Yalalefkut yelem anten tet’egche

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 4
Mets’nate beante new simhn t’erche
Yeberekete minch’ yegojoye mulat
Ledekemech nefse marefiya honklat
" azmach "

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 5
Dagm lij tebalku bedelen sharklgn
Bekeberew demh bariyahn gezahgn
Sawedsh linur zewetr bezmare
Medhanialem honkegn mogesna kibre

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 1
" አዝማች "
አልቅሼ ነገርኩህ በሀዘን ደክሜ
አብዝቼ ጠራሁህ ከመቅደስህ ቆሜ
አዘነበልክልኝ ቃሌን መቼ አለፍከው

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 2
አይዞሽ ልጄ ብለህ እንባዬን አበስከው
" አዝማች"
ከፊት እየቀደምክ መንገድ የምትመራ
ብርሐን የሆንክልን በመስቀልህ ስራ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 3
እውነተኛ መድህን የሒወት እንጀራ
የሁሉ አስገኚ ግሩም የሱ ስራ
" አዝማች "
ያላለፍኩት የለም አንተን ተጠግቼ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 4
መጽናቴ በአንተ ነው ስምህን ጠርቼ
የበረከቴ ምንጭ የጎጆዬ ሙላት
ለደከመች ነፍሴ ማረፊያ ሆንክላት
" አዝማች "

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 5
ዳግም ልጅ ተባልኩ በደሌን ሻርክልኝ
በከበረው ደምህ ባሪያህን ገዛህኝ
ሳወድስህ ልኑር ዘወትር በዝማሬ
መድኃኒአለም ሆንከኝ ሞገስና ክብሬ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር',
        lyrics_transliteration = 'CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 1
" azmach "
Alqshe negerkuh behezen dekme
Abzche t’erahuh kemeqdesh qome
Azenebelklgn qalen meche alefkew

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 2
Ayzosh lije bileh enbayen abeskew
" azmach"
Kefit eyeqedemk menged yemtmera
Birhen yehonkln bemesqelh sira

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 3
Ewnetegna medhn yehiwet enjera
Yehulu asgegni girum yesu sira
" azmach "
Yalalefkut yelem anten tet’egche

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 4
Mets’nate beante new simhn t’erche
Yeberekete minch’ yegojoye mulat
Ledekemech nefse marefiya honklat
" azmach "

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 5
Dagm lij tebalku bedelen sharklgn
Bekeberew demh bariyahn gezahgn
Sawedsh linur zewetr bezmare
Medhanialem honkegn mogesna kibre

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fd998a54-191c-493e-af42-862860b81a80'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 1
" አዝማች "
አልቅሼ ነገርኩህ በሀዘን ደክሜ
አብዝቼ ጠራሁህ ከመቅደስህ ቆሜ
አዘነበልክልኝ ቃሌን መቼ አለፍከው

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 2
አይዞሽ ልጄ ብለህ እንባዬን አበስከው
" አዝማች"
ከፊት እየቀደምክ መንገድ የምትመራ
ብርሐን የሆንክልን በመስቀልህ ስራ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 3
እውነተኛ መድህን የሒወት እንጀራ
የሁሉ አስገኚ ግሩም የሱ ስራ
" አዝማች "
ያላለፍኩት የለም አንተን ተጠግቼ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 4
መጽናቴ በአንተ ነው ስምህን ጠርቼ
የበረከቴ ምንጭ የጎጆዬ ሙላት
ለደከመች ነፍሴ ማረፊያ ሆንክላት
" አዝማች "

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 5
ዳግም ልጅ ተባልኩ በደሌን ሻርክልኝ
በከበረው ደምህ ባሪያህን ገዛህኝ
ሳወድስህ ልኑር ዘወትር በዝማሬ
መድኃኒአለም ሆንከኝ ሞገስና ክብሬ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fd998a54-191c-493e-af42-862860b81a80'::uuid, 'medihanealem-789', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anidit-nat ("Anidit Nat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8a5cc412-e886-4b7e-b579-caac0252f69d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 1
አዲስ አይደለንም ለመከራ ጉዞ
የወደቀ አናውቅም መስቀል ተመርኩዞ
አምላከ ቅዱሳን ከእኛ ጋር ነውና
በርቱ ክርስቲያኖች በእውነት ጎዳና /፪ አዝ…

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 2
የአበውን እምነት በአላውያን ፊት
ሰምተን ስላደግን ከገድላት አንደበት
መስዋዕትነትም ቀርቧል ከፊታችን
እውነት ስትገፋ አይችልም ልባችን /፪

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 3
አዝ…
አልጠፋችምና በእሳት ተፈትና
ይህን እናውቃለን በገሃድ ነውና
መሰደድ መቃጠል ሁሉም ለጊዜው ነው

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 4
ለእውነት ከሆነ ሞትም ክብራችን ነው /፪
አዝ…
ከተዋሕዶ ጋር ስላለ መንፈሱ
እውነትን ለማጥፋት መቅደስ አታፍርሱ

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 5
በግፍ ቢገደሉ ክርስቲያኖች ሁሉ
ኦርቶዶክስ（ተዋሕዶ）አትጠፋም ተነግሯል በቃሉ /፪
አዝ…
ታሪክን ያኖረች ፊደላት ቀርፃ

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 6
ቅርስን ያወረሰች ገዳማት አንፃ
እንግዳ ተቀባይ መንፈሳዊት እናት
ይህንን አትዘንጉ ኦርቶዶክስ（ተዋሕዶ）ሀገር ናት /፪
አዝ…

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 1
Adis aydelenm lemekera guzo
Yewedeqe anawqm mesqel temerkuzo
Amlake Kidusan keegna gar newna
Bertu kirstiyanoch beewnet godana /2 az…

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 2
Yeabewn emnet bealawyan fit
Semten siladegn kegedlat andebet
Meswaetnetm qerbwal kefitachn
Ewnet sitgefa aychlm libachn /2

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 3
CHORUS
Alt’efachmna beesat tefetna
Yihn enawqalen begehad newna
Meseded meqat’el hulum legizew new

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 4
Leewnet kehone motm kibrachn new /2
CHORUS
Ketewahdo gar silale menfesu
Ewnetn lemat’fat meqdes atafrsu

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 5
Begf bigedelu kirstiyanoch hulu
Ortodoks（Tewahedo）att’efam tenegrwal beqalu /2
CHORUS
Tarikn yanorech fidelat qerts’a

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 6
Qirsn yaweresech gedamat ants’a
Engda teqebay menfesawit enat
Yihnn atzengu Ortodoks（Tewahedo）heger nat /2
CHORUS

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 1
አዲስ አይደለንም ለመከራ ጉዞ
የወደቀ አናውቅም መስቀል ተመርኩዞ
አምላከ ቅዱሳን ከእኛ ጋር ነውና
በርቱ ክርስቲያኖች በእውነት ጎዳና /፪ አዝ…

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 2
የአበውን እምነት በአላውያን ፊት
ሰምተን ስላደግን ከገድላት አንደበት
መስዋዕትነትም ቀርቧል ከፊታችን
እውነት ስትገፋ አይችልም ልባችን /፪

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 3
አዝ…
አልጠፋችምና በእሳት ተፈትና
ይህን እናውቃለን በገሃድ ነውና
መሰደድ መቃጠል ሁሉም ለጊዜው ነው

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 4
ለእውነት ከሆነ ሞትም ክብራችን ነው /፪
አዝ…
ከተዋሕዶ ጋር ስላለ መንፈሱ
እውነትን ለማጥፋት መቅደስ አታፍርሱ

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 5
በግፍ ቢገደሉ ክርስቲያኖች ሁሉ
ኦርቶዶክስ（ተዋሕዶ）አትጠፋም ተነግሯል በቃሉ /፪
አዝ…
ታሪክን ያኖረች ፊደላት ቀርፃ

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 6
ቅርስን ያወረሰች ገዳማት አንፃ
እንግዳ ተቀባይ መንፈሳዊት እናት
ይህንን አትዘንጉ ኦርቶዶክስ（ተዋሕዶ）ሀገር ናት /፪
አዝ…

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት',
        lyrics_transliteration = 'CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 1
Adis aydelenm lemekera guzo
Yewedeqe anawqm mesqel temerkuzo
Amlake Kidusan keegna gar newna
Bertu kirstiyanoch beewnet godana /2 az…

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 2
Yeabewn emnet bealawyan fit
Semten siladegn kegedlat andebet
Meswaetnetm qerbwal kefitachn
Ewnet sitgefa aychlm libachn /2

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 3
CHORUS
Alt’efachmna beesat tefetna
Yihn enawqalen begehad newna
Meseded meqat’el hulum legizew new

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 4
Leewnet kehone motm kibrachn new /2
CHORUS
Ketewahdo gar silale menfesu
Ewnetn lemat’fat meqdes atafrsu

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 5
Begf bigedelu kirstiyanoch hulu
Ortodoks（Tewahedo）att’efam tenegrwal beqalu /2
CHORUS
Tarikn yanorech fidelat qerts’a

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 6
Qirsn yaweresech gedamat ants’a
Engda teqebay menfesawit enat
Yihnn atzengu Ortodoks（Tewahedo）heger nat /2
CHORUS

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8a5cc412-e886-4b7e-b579-caac0252f69d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 1
አዲስ አይደለንም ለመከራ ጉዞ
የወደቀ አናውቅም መስቀል ተመርኩዞ
አምላከ ቅዱሳን ከእኛ ጋር ነውና
በርቱ ክርስቲያኖች በእውነት ጎዳና /፪ አዝ…

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 2
የአበውን እምነት በአላውያን ፊት
ሰምተን ስላደግን ከገድላት አንደበት
መስዋዕትነትም ቀርቧል ከፊታችን
እውነት ስትገፋ አይችልም ልባችን /፪

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 3
አዝ…
አልጠፋችምና በእሳት ተፈትና
ይህን እናውቃለን በገሃድ ነውና
መሰደድ መቃጠል ሁሉም ለጊዜው ነው

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 4
ለእውነት ከሆነ ሞትም ክብራችን ነው /፪
አዝ…
ከተዋሕዶ ጋር ስላለ መንፈሱ
እውነትን ለማጥፋት መቅደስ አታፍርሱ

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 5
በግፍ ቢገደሉ ክርስቲያኖች ሁሉ
ኦርቶዶክስ（ተዋሕዶ）አትጠፋም ተነግሯል በቃሉ /፪
አዝ…
ታሪክን ያኖረች ፊደላት ቀርፃ

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 6
ቅርስን ያወረሰች ገዳማት አንፃ
እንግዳ ተቀባይ መንፈሳዊት እናት
ይህንን አትዘንጉ ኦርቶዶክስ（ተዋሕዶ）ሀገር ናት /፪
አዝ…

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8a5cc412-e886-4b7e-b579-caac0252f69d'::uuid, 'anidit-nat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- esiki-lamesiginih ("Esiki Lamesiginih")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8501f4fc-8d79-4acb-971a-f659e88ae572'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 1
ሃጢያት በደሌን ጋርደህ
ደምህ አጥቦ አንፅቶኛል
ፅድቄን በይኖልኛል
አንተ ልጄ ነህ ብለህ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 2
ጌታ በጅራፍ ቆስለህ
ሳልከኝ ልብህ መሃል
ወጣሁ ከሞት ገደል
አዝ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 3
ነግቷል በብርሃንህ
ደግሞም በመከራህ
ጠፍቷል የሞት ጨለማ
ጌታ በስምህ ግርማ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 4
ፍቅርህ ከፍርድህ በዝቶ
ልብህ መዳኔን ሽቶ
በእንባ ታርቄሃለሁ
በእንባ እዘምራለሁ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 5
አዝ
ወዳጅ ባልጀራዬ
ውዴ ሁለንተናዬ
ልቤ ይናፍቀሃል

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 6
አይኔም ይጠብቅሃል
ቀርበህ ያስታመምከኝ
ቀደህ ያለበስኸኝ
አለኝ ብዙ ትዝታ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 7
ለኔስ ልዩ ነህ ጌታ
አዝ
ትናት ሌላ ነበርኩኝ
አንተን ያልተረዳሁኝ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 8
ዛሬ ያሳመንከኝ
ለጽድቅ አሰለፍከኝ
እንዴት ችሎ ዝም ይላል
ልቤም ዛሬም ይጮሃል

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 9
አዲስ ልዩ ምስጋና
ላንተ ይገባልና

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 1
Hat’iyat bedelen gardeh
Demh at’bo ants’tognal
Ts’dqen beynolgnal
Ante lije neh bileh

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 2
Geta bejraf qosleh
Salkegn libh mehal
Wet’ahu kemot gedel
CHORUS

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 3
Negtwal bebrhanh
Degmom bemekerah
T’eftwal yemot ch’elema
Geta besmh girma

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 4
Fiqrh kefrdh bezto
Libh medanen shto
Beenba tarqehalehu
Beenba ezemralehu

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 5
CHORUS
Wedaj baljeraye
Wide hulentenaye
Libe yinafqehal

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 6
Aynem yit’ebqhal
Qerbeh yastamemkegn
Qedeh yalebesኸgn
Alegn bizu tizta

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 7
Lenes liyu neh Geta
CHORUS
Tinat lela neberkugn
Anten yalteredahugn

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 8
Zare yasamenkegn
Lets’dq aselefkegn
Endet chlo zim yilal
Libem zarem yich’ohal

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 9
Adis liyu misgana
Lante yigebalna

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 1
ሃጢያት በደሌን ጋርደህ
ደምህ አጥቦ አንፅቶኛል
ፅድቄን በይኖልኛል
አንተ ልጄ ነህ ብለህ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 2
ጌታ በጅራፍ ቆስለህ
ሳልከኝ ልብህ መሃል
ወጣሁ ከሞት ገደል
አዝ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 3
ነግቷል በብርሃንህ
ደግሞም በመከራህ
ጠፍቷል የሞት ጨለማ
ጌታ በስምህ ግርማ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 4
ፍቅርህ ከፍርድህ በዝቶ
ልብህ መዳኔን ሽቶ
በእንባ ታርቄሃለሁ
በእንባ እዘምራለሁ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 5
አዝ
ወዳጅ ባልጀራዬ
ውዴ ሁለንተናዬ
ልቤ ይናፍቀሃል

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 6
አይኔም ይጠብቅሃል
ቀርበህ ያስታመምከኝ
ቀደህ ያለበስኸኝ
አለኝ ብዙ ትዝታ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 7
ለኔስ ልዩ ነህ ጌታ
አዝ
ትናት ሌላ ነበርኩኝ
አንተን ያልተረዳሁኝ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 8
ዛሬ ያሳመንከኝ
ለጽድቅ አሰለፍከኝ
እንዴት ችሎ ዝም ይላል
ልቤም ዛሬም ይጮሃል

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 9
አዲስ ልዩ ምስጋና
ላንተ ይገባልና

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ',
        lyrics_transliteration = 'CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 1
Hat’iyat bedelen gardeh
Demh at’bo ants’tognal
Ts’dqen beynolgnal
Ante lije neh bileh

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 2
Geta bejraf qosleh
Salkegn libh mehal
Wet’ahu kemot gedel
CHORUS

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 3
Negtwal bebrhanh
Degmom bemekerah
T’eftwal yemot ch’elema
Geta besmh girma

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 4
Fiqrh kefrdh bezto
Libh medanen shto
Beenba tarqehalehu
Beenba ezemralehu

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 5
CHORUS
Wedaj baljeraye
Wide hulentenaye
Libe yinafqehal

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 6
Aynem yit’ebqhal
Qerbeh yastamemkegn
Qedeh yalebesኸgn
Alegn bizu tizta

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 7
Lenes liyu neh Geta
CHORUS
Tinat lela neberkugn
Anten yalteredahugn

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 8
Zare yasamenkegn
Lets’dq aselefkegn
Endet chlo zim yilal
Libem zarem yich’ohal

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 9
Adis liyu misgana
Lante yigebalna

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8501f4fc-8d79-4acb-971a-f659e88ae572'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ
ሃጢያት በደሌን ጋርደህ
ደምህ አጥቦ አንፅቶኛል
ፅድቄን በይኖልኛል
አንተ ልጄ ነህ ብለህ
ጌታ በጅራፍ ቆስለህ
ሳልከኝ ልብህ መሃል
ወጣሁ ከሞት ገደል
አዝ========
ነግቷል በብርሃንህ
ደግሞም በመከራህ
ጠፍቷል የሞት ጨለማ
ጌታ በስምህ ግርማ
ፍቅርህ ከፍርድህ በዝቶ
ልብህ መዳኔን ሽቶ
በእንባ ታርቄሃለሁ
በእንባ እዘምራለሁ
አዝ========
ወዳጅ ባልጀራዬ
ውዴ ሁለንተናዬ
ልቤ ይናፍቀሃል
አይኔም ይጠብቅሃል
ቀርበህ ያስታመምከኝ
ቀደህ ያለበስኸኝ
አለኝ ብዙ ትዝታ
ለኔስ ልዩ ነህ ጌታ
አዝ========
ትናት ሌላ ነበርኩኝ
አንተን ያልተረዳሁኝ
ዛሬ ያሳመንከኝ
ለጽድቅ አሰለፍከኝ
እንዴት ችሎ ዝም ይላል
ልቤም ዛሬም ይጮሃል
አዲስ ልዩ ምስጋና
ላንተ ይገባልና

VERSE 1
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ
ሃጢያት በደሌን ጋርደህ
ደምህ አጥቦ አንፅቶኛል
ፅድቄን በይኖልኛል
አንተ ልጄ ነህ ብለህ
ጌታ በጅራፍ ቆስለህ
ሳልከኝ ልብህ መሃል
ወጣሁ ከሞት ገደል
አዝ========
ነግቷል በብርሃንህ
ደግሞም በመከራህ
ጠፍቷል የሞት ጨለማ
ጌታ በስምህ ግርማ
ፍቅርህ ከፍርድህ በዝቶ
ልብህ መዳኔን ሽቶ
በእንባ ታርቄሃለሁ
በእንባ እዘምራለሁ
አዝ========
ወዳጅ ባልጀራዬ
ውዴ ሁለንተናዬ
ልቤ ይናፍቀሃል
አይኔም ይጠብቅሃል
ቀርበህ ያስታመምከኝ
ቀደህ ያለበስኸኝ
አለኝ ብዙ ትዝታ
ለኔስ ልዩ ነህ ጌታ
አዝ========
ትናት ሌላ ነበርኩኝ
አንተን ያልተረዳሁኝ
ዛሬ ያሳመንከኝ
ለጽድቅ አሰለፍከኝ
እንዴት ችሎ ዝም ይላል
ልቤም ዛሬም ይጮሃል
አዲስ ልዩ ምስጋና
ላንተ ይገባልና

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ
ሃጢያት በደሌን ጋርደህ
ደምህ አጥቦ አንፅቶኛል
ፅድቄን በይኖልኛል
አንተ ልጄ ነህ ብለህ
ጌታ በጅራፍ ቆስለህ
ሳልከኝ ልብህ መሃል
ወጣሁ ከሞት ገደል
አዝ========
ነግቷል በብርሃንህ
ደግሞም በመከራህ
ጠፍቷል የሞት ጨለማ
ጌታ በስምህ ግርማ
ፍቅርህ ከፍርድህ በዝቶ
ልብህ መዳኔን ሽቶ
በእንባ ታርቄሃለሁ
በእንባ እዘምራለሁ
አዝ========
ወዳጅ ባልጀራዬ
ውዴ ሁለንተናዬ
ልቤ ይናፍቀሃል
አይኔም ይጠብቅሃል
ቀርበህ ያስታመምከኝ
ቀደህ ያለበስኸኝ
አለኝ ብዙ ትዝታ
ለኔስ ልዩ ነህ ጌታ
አዝ========
ትናት ሌላ ነበርኩኝ
አንተን ያልተረዳሁኝ
ዛሬ ያሳመንከኝ
ለጽድቅ አሰለፍከኝ
እንዴት ችሎ ዝም ይላል
ልቤም ዛሬም ይጮሃል
አዲስ ልዩ ምስጋና
ላንተ ይገባልና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8501f4fc-8d79-4acb-971a-f659e88ae572'::uuid, 'esiki-lamesiginih', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidus-gebriel-wedegna-metaln ("kidus gebriel . wedegna metaln")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd1260db0-4ae7-4a7a-9f96-0ff3851126b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 1
ዘማ………………
በሰማይ በሆነው በዓለመ መላእክት
ሳጥናኤል ሲነሳ ሽቶ አምላክነት
መከፋፈል ሲሆን ደንግጦ ልባቸው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 2
የሳጥናኤል ሀሳብ ያላጠራጠረው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው
ዘማ………………

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 3
በባቢሎን አገር ያሉ ሦስት ሕጻናት
ለፈጣሪያቸው የታመኑ በእውነት
ለአገሩ ጣኦት አንሰግድም ስላሉ
በጨካኙ ንጉሥ በእሳት ተጣሉ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 4
የእሳቱ ወላፈን ከቶ እንዳይነካቸው
ቅዱስ ገብርኤል ወርዶ ቆመ በመሐላቸው
ዘማ……………
ቂርቆስ ኢየሉጣ በእግዚአብሔር ታመኑ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 5
ስለስሙ ኖረው ምስክር ሊሆኑ
በፈጣሪያቸው በመታመናቸው
መሰደድ መሸሽ ሆነ እጣ ፋንታቸው
በሰማዕትነት እስክታርፍ ነፍሳቸው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 6
ቅዱስ ገብርኤል ነው ወርዶ ያበረታቸው
ዘማ…………
የአዳም ተስፋው ቃል መፈፀሚያው ሲደርስ
ክንፉን እያማታ ገባ ቤተ-መቅደስ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 7
የአምላክን ሰው መሆን ነገራት ለድንግል
ትፀንሻለሽ ብሎ አካላዊው ቃል
ወልደ አምላክ ክርስቶስ ወዳንቺ ይመጣል
ዓለሙን ለማዳን ካንቺ ይወለዳል

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 8
ዘማ………………
ዘወትር የሚቆም በእግዚአብሔር ፊት
ስለእኛ ሚማልድ ከአምላክ ምሕረት
የኃጥኡን መመለስ እጅግ ሚያስደስተው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 9
የመላእክት አለቃ ቅዱስ ገብርኤል ነው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 1
Zema………………
Besemay behonew bealeme melaekt
Sat’nael sinesa shto amlaknet
Mekefafel sihon dengt’o libachew

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 2
Yesat’nael hesab yalat’erat’erew
Balenbet enqum bilo yetenagerew
Negede melaektn yaregaga ersu new
Zema………………

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 3
Bebabilon ager yalu sost hits’anat
Lefet’ariyachew yetamenu beewnet
Leageru t’aot ansegdm silalu
Bech’ekagnu nigus beesat tet’alu

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 4
Yeesatu welafen keto endaynekachew
Kidus Gebriel werdo qome bemehelachew
Zema……………
Qirqos iyelut’a beEgziabher tamenu

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 5
Silesmu norew miskr lihonu
Befet’ariyachew bemetamenachew
Meseded meshesh hone et’a fantachew
Besemaetnet esktarf nefsachew

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 6
Kidus Gebriel new werdo yaberetachew
Zema…………
Yeadam tesfaw qal mefets’emiyaw siders
Kinfun eyamata geba bete-meqdes

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 7
Yeamlakn sew mehon negerat ledngl
Tits’enshalesh bilo akalawiw qal
Welde amlak Kristos wedanchi yimet’al
Alemun lemadan kanchi yiweledal

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 8
Zema………………
Zewetr yemiqom beEgziabher fit
Sileegna mimald keamlak mihret
Yehat’un memeles ejg miyasdestew

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 9
Yemelaekt aleqa Kidus Gebriel new
Balenbet enqum bilo yetenagerew
Negede melaektn yaregaga ersu new

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 1
ዘማ………………
በሰማይ በሆነው በዓለመ መላእክት
ሳጥናኤል ሲነሳ ሽቶ አምላክነት
መከፋፈል ሲሆን ደንግጦ ልባቸው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 2
የሳጥናኤል ሀሳብ ያላጠራጠረው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው
ዘማ………………

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 3
በባቢሎን አገር ያሉ ሦስት ሕጻናት
ለፈጣሪያቸው የታመኑ በእውነት
ለአገሩ ጣኦት አንሰግድም ስላሉ
በጨካኙ ንጉሥ በእሳት ተጣሉ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 4
የእሳቱ ወላፈን ከቶ እንዳይነካቸው
ቅዱስ ገብርኤል ወርዶ ቆመ በመሐላቸው
ዘማ……………
ቂርቆስ ኢየሉጣ በእግዚአብሔር ታመኑ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 5
ስለስሙ ኖረው ምስክር ሊሆኑ
በፈጣሪያቸው በመታመናቸው
መሰደድ መሸሽ ሆነ እጣ ፋንታቸው
በሰማዕትነት እስክታርፍ ነፍሳቸው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 6
ቅዱስ ገብርኤል ነው ወርዶ ያበረታቸው
ዘማ…………
የአዳም ተስፋው ቃል መፈፀሚያው ሲደርስ
ክንፉን እያማታ ገባ ቤተ-መቅደስ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 7
የአምላክን ሰው መሆን ነገራት ለድንግል
ትፀንሻለሽ ብሎ አካላዊው ቃል
ወልደ አምላክ ክርስቶስ ወዳንቺ ይመጣል
ዓለሙን ለማዳን ካንቺ ይወለዳል

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 8
ዘማ………………
ዘወትር የሚቆም በእግዚአብሔር ፊት
ስለእኛ ሚማልድ ከአምላክ ምሕረት
የኃጥኡን መመለስ እጅግ ሚያስደስተው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 9
የመላእክት አለቃ ቅዱስ ገብርኤል ነው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ',
        lyrics_transliteration = 'CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 1
Zema………………
Besemay behonew bealeme melaekt
Sat’nael sinesa shto amlaknet
Mekefafel sihon dengt’o libachew

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 2
Yesat’nael hesab yalat’erat’erew
Balenbet enqum bilo yetenagerew
Negede melaektn yaregaga ersu new
Zema………………

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 3
Bebabilon ager yalu sost hits’anat
Lefet’ariyachew yetamenu beewnet
Leageru t’aot ansegdm silalu
Bech’ekagnu nigus beesat tet’alu

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 4
Yeesatu welafen keto endaynekachew
Kidus Gebriel werdo qome bemehelachew
Zema……………
Qirqos iyelut’a beEgziabher tamenu

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 5
Silesmu norew miskr lihonu
Befet’ariyachew bemetamenachew
Meseded meshesh hone et’a fantachew
Besemaetnet esktarf nefsachew

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 6
Kidus Gebriel new werdo yaberetachew
Zema…………
Yeadam tesfaw qal mefets’emiyaw siders
Kinfun eyamata geba bete-meqdes

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 7
Yeamlakn sew mehon negerat ledngl
Tits’enshalesh bilo akalawiw qal
Welde amlak Kristos wedanchi yimet’al
Alemun lemadan kanchi yiweledal

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 8
Zema………………
Zewetr yemiqom beEgziabher fit
Sileegna mimald keamlak mihret
Yehat’un memeles ejg miyasdestew

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 9
Yemelaekt aleqa Kidus Gebriel new
Balenbet enqum bilo yetenagerew
Negede melaektn yaregaga ersu new

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd1260db0-4ae7-4a7a-9f96-0ff3851126b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 1
ዘማ………………
በሰማይ በሆነው በዓለመ መላእክት
ሳጥናኤል ሲነሳ ሽቶ አምላክነት
መከፋፈል ሲሆን ደንግጦ ልባቸው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 2
የሳጥናኤል ሀሳብ ያላጠራጠረው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው
ዘማ………………

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 3
በባቢሎን አገር ያሉ ሦስት ሕጻናት
ለፈጣሪያቸው የታመኑ በእውነት
ለአገሩ ጣኦት አንሰግድም ስላሉ
በጨካኙ ንጉሥ በእሳት ተጣሉ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 4
የእሳቱ ወላፈን ከቶ እንዳይነካቸው
ቅዱስ ገብርኤል ወርዶ ቆመ በመሐላቸው
ዘማ……………
ቂርቆስ ኢየሉጣ በእግዚአብሔር ታመኑ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 5
ስለስሙ ኖረው ምስክር ሊሆኑ
በፈጣሪያቸው በመታመናቸው
መሰደድ መሸሽ ሆነ እጣ ፋንታቸው
በሰማዕትነት እስክታርፍ ነፍሳቸው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 6
ቅዱስ ገብርኤል ነው ወርዶ ያበረታቸው
ዘማ…………
የአዳም ተስፋው ቃል መፈፀሚያው ሲደርስ
ክንፉን እያማታ ገባ ቤተ-መቅደስ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 7
የአምላክን ሰው መሆን ነገራት ለድንግል
ትፀንሻለሽ ብሎ አካላዊው ቃል
ወልደ አምላክ ክርስቶስ ወዳንቺ ይመጣል
ዓለሙን ለማዳን ካንቺ ይወለዳል

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 8
ዘማ………………
ዘወትር የሚቆም በእግዚአብሔር ፊት
ስለእኛ ሚማልድ ከአምላክ ምሕረት
የኃጥኡን መመለስ እጅግ ሚያስደስተው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 9
የመላእክት አለቃ ቅዱስ ገብርኤል ነው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd1260db0-4ae7-4a7a-9f96-0ff3851126b5'::uuid, 'kidus-gebriel-wedegna-metaln', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egiziabiher-siraw ("Egiziabiher Siraw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6c431965-2c8a-4b94-9f1d-3cecd0a154f0'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ምን ይከፈለዋል ተመስገን ብቻ ነው',
        lyrics_transliteration = 'CHORUS
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
Min yikefelewal temesgen bicha new',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6c431965-2c8a-4b94-9f1d-3cecd0a154f0'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6c431965-2c8a-4b94-9f1d-3cecd0a154f0'::uuid, 'egiziabiher-siraw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bakgnalehuna ("Bakgnalehuna")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0e61eca4-e0e3-43be-9187-95fa07664774'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 1
ፈጥነሽ ወደእኔ ነይ ከትንሿ ቤቴ
አጽናኚኝ እመአምላክ ድንግል እመቤቴ

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 2
ባህሩ ትልቅ ነው ድንግል እመቤቴ
ትንሽ ናት መርከቤ /2/
የመንገዴ መሪ
አንቺ ነሽ ወደቤ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 3
በመንገዴ ስዝል ድንግል እመቤቴ
ዓለም ትስቃለች /2/
መመኪያ እመቤቱ
ወዴት ነች እያለች /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 4
በቀቢጸ ተስፋ ድንግል እመቤቴ
እንዳልወድቅብሽ /2/
በቀንም በሌሊት
ተስፋዬ አንቺ ነሽ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 5
የለም ያተረፍኩት ድንግል እመቤቴ
ወጥቼ ወርጄ /2/
ትርፌ አንቺ ብቻ ነሽ
ጽዮን አማላጄ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 1
Fet’nesh wede’ene ney ketinishwa beté
Ats’nagnign EmeAmlak dingil emebeté

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 2
Bahru tilik new dingil emebeté
Tinish nat merkebé (x2)
Yemengedé meri
Anchi nesh wede’bé (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 3
Bemengedé sizil dingil emebeté
Alem t’sik’aletch (x2)
Memekiya emebetu
Wedet nech eyalech (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 4
Beqebitse tesfa dingil emebeté
Endalwodkibish (x2)
Beqenem belelit
Tesfayé anchi nesh (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 5
Yelem yaterafkut dingil emebeté
Wet’ché werjé (x2)
T’irfé anchi bicha nesh
Ts’iyon amalajé (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 1
ፈጥነሽ ወደእኔ ነይ ከትንሿ ቤቴ
አጽናኚኝ እመአምላክ ድንግል እመቤቴ

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 2
ባህሩ ትልቅ ነው ድንግል እመቤቴ
ትንሽ ናት መርከቤ /2/
የመንገዴ መሪ
አንቺ ነሽ ወደቤ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 3
በመንገዴ ስዝል ድንግል እመቤቴ
ዓለም ትስቃለች /2/
መመኪያ እመቤቱ
ወዴት ነች እያለች /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 4
በቀቢጸ ተስፋ ድንግል እመቤቴ
እንዳልወድቅብሽ /2/
በቀንም በሌሊት
ተስፋዬ አንቺ ነሽ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 5
የለም ያተረፍኩት ድንግል እመቤቴ
ወጥቼ ወርጄ /2/
ትርፌ አንቺ ብቻ ነሽ
ጽዮን አማላጄ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና',
        lyrics_transliteration = 'CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 1
Fet’nesh wede’ene ney ketinishwa beté
Ats’nagnign EmeAmlak dingil emebeté

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 2
Bahru tilik new dingil emebeté
Tinish nat merkebé (x2)
Yemengedé meri
Anchi nesh wede’bé (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 3
Bemengedé sizil dingil emebeté
Alem t’sik’aletch (x2)
Memekiya emebetu
Wedet nech eyalech (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 4
Beqebitse tesfa dingil emebeté
Endalwodkibish (x2)
Beqenem belelit
Tesfayé anchi nesh (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 5
Yelem yaterafkut dingil emebeté
Wet’ché werjé (x2)
T’irfé anchi bicha nesh
Ts’iyon amalajé (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0e61eca4-e0e3-43be-9187-95fa07664774'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 1
ፈጥነሽ ወደእኔ ነይ ከትንሿ ቤቴ
አጽናኚኝ እመአምላክ ድንግል እመቤቴ

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 2
ባህሩ ትልቅ ነው ድንግል እመቤቴ
ትንሽ ናት መርከቤ /2/
የመንገዴ መሪ
አንቺ ነሽ ወደቤ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 3
በመንገዴ ስዝል ድንግል እመቤቴ
ዓለም ትስቃለች /2/
መመኪያ እመቤቱ
ወዴት ነች እያለች /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 4
በቀቢጸ ተስፋ ድንግል እመቤቴ
እንዳልወድቅብሽ /2/
በቀንም በሌሊት
ተስፋዬ አንቺ ነሽ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 5
የለም ያተረፍኩት ድንግል እመቤቴ
ወጥቼ ወርጄ /2/
ትርፌ አንቺ ብቻ ነሽ
ጽዮን አማላጄ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 1
Fet’nesh wede’ene ney ketinishwa beté
Ats’nagnign EmeAmlak dingil emebeté

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 2
Bahru tilik new dingil emebeté
Tinish nat merkebé (x2)
Yemengedé meri
Anchi nesh wede’bé (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 3
Bemengedé sizil dingil emebeté
Alem t’sik’aletch (x2)
Memekiya emebetu
Wedet nech eyalech (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 4
Beqebitse tesfa dingil emebeté
Endalwodkibish (x2)
Beqenem belelit
Tesfayé anchi nesh (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 5
Yelem yaterafkut dingil emebeté
Wet’ché werjé (x2)
T’irfé anchi bicha nesh
Ts’iyon amalajé (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0e61eca4-e0e3-43be-9187-95fa07664774'::uuid, 'bakgnalehuna', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enatinet ("Enatinet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8d18cb18-57fc-4255-9c98-49357925060a'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ይዘምራል ልቤ እያለ ተፈሥሂ',
        lyrics_transliteration = 'CHORUS
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
Yizemral libe eyale tefeshi',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8d18cb18-57fc-4255-9c98-49357925060a'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8d18cb18-57fc-4255-9c98-49357925060a'::uuid, 'enatinet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mirtinesh-tilahun-yalante-geta-desta-mech-ale ("Mirtinesh Tilahun {{Yalante Geta Desta Mech Ale }}")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8d2366e4-1bff-4106-be79-df6f8845a955'::uuid
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
    WHERE import_id = '8d2366e4-1bff-4106-be79-df6f8845a955'::uuid
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
        '8d2366e4-1bff-4106-be79-df6f8845a955'::uuid, 'mirtinesh-tilahun-yalante-geta-desta-mech-ale', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yebirihan-gorif-nat-yeoritodokis-mezimur ("Yebirihan Gorif Nat Yeoritodokis Mezimur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0ee3904e-52c6-4f6c-b993-05f6667e5f43'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ጽድቅ አለው አንቺን ለማስተናገድ
የኃጢያት ጎተራ ነው የተሞላ በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦኦኦ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የእኔን ልብ ታሳናዳዋለች
ስለ ኃጢአቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 1
Ts’egash yidresen (2)yiset’en eyalu
Yeene lib min ts’dq alew anchin lemastenaged
Yehat’iyat gotera new yetemola besst
ኧre endet (2) Dingil tinurbet ooo

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 2
Atts’eyefm yeenen lib tasanadawalech
Sile hat’iate yeene enat milja taqerbalech
Libachewn yezegu dingln lemasgebat
Hilinachew yimeles ents’ely lezih t’fat

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 3
Amlakn yiza new Dingil yemtmet’aw ooo
Eswan sinmels Geta newn yemnasqeymew

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ጽድቅ አለው አንቺን ለማስተናገድ
የኃጢያት ጎተራ ነው የተሞላ በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦኦኦ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የእኔን ልብ ታሳናዳዋለች
ስለ ኃጢአቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ',
        lyrics_transliteration = 'CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 1
Ts’egash yidresen (2)yiset’en eyalu
Yeene lib min ts’dq alew anchin lemastenaged
Yehat’iyat gotera new yetemola besst
ኧre endet (2) Dingil tinurbet ooo

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 2
Atts’eyefm yeenen lib tasanadawalech
Sile hat’iate yeene enat milja taqerbalech
Libachewn yezegu dingln lemasgebat
Hilinachew yimeles ents’ely lezih t’fat

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 3
Amlakn yiza new Dingil yemtmet’aw ooo
Eswan sinmels Geta newn yemnasqeymew

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0ee3904e-52c6-4f6c-b993-05f6667e5f43'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ጽድቅ አለው አንቺን ለማስተናገድ
የኃጢያት ጎተራ ነው የተሞላ በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦኦኦ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የእኔን ልብ ታሳናዳዋለች
ስለ ኃጢአቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0ee3904e-52c6-4f6c-b993-05f6667e5f43'::uuid, 'yebirihan-gorif-nat-yeoritodokis-mezimur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zekreni-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur ("~Zekreni~By Zemari Henok Fikadu~ Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '789ba363-f09b-42f2-9a88-f5718f418206'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 1
ኣዝ
እቲ’ ኳ ክትውለድ ጎይታይ ኣብ መብልዕማል ከብቲ
ትህትና ክትምህር ሓዲግካ ንሃብቲ
ፈታሪ ከለኻ መላኺ ዛምድሪ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 2
ርእስካ ናሕሰርካ ክትህበኒ ክብሪ
ፍቅርካ ረሲዐስ ኮይነልካ ከታሪ
ኣዝ
ዘይከም በርጤሜዎስ ኮይነ ልቦናይ ዘይሪእይ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 3
ሃብታም ድኻ ኮይነ ክስእን ረዳኢ
ፈውስኻ ሲኢነ መንገዲ ከዕነኒ
ወዲ ዳዊት ጎይታይ ንዓ መሓረኒ
ብመንፈስ ዘርእያ ኣዕንቲ ሃበኒ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 4
ኣዝ
ይቕረ ዝልማዱ እንዲኻ መፍቀሬ ንስሓ
ዝዋውዕ በደለይ ከምበረድ አጻዕዲኻ
ታሪኸይ ክትቅይር ናይትማሊ ዛንታ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 5
ሕሉፈይ ረሲዕካ ከምየማናይ ሽፍታ
ኣብታ መንግስትኻ ዘክረኒ ጎይታይ
ዘክረኒ(2) ኢኻ ኣብቲ መንግስትኻ(4)

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 1
Az
Eti’ kwa kitwled goytay ab meblemal kebti
Tihtna kitmhr hadigka nihabti
Fetari keleኻ melaኺ zamdri

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 2
Rieska nahserka kithbeni kibri
Fiqrka resias koynelka ketari
Az
Zeykem bert’emewos koyne libonay zeyriey

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 3
Habtam diኻ koyne kisen redai
Fewsኻ siine mengedi keeneni
Wedi dawit goytay nia mehareni
Bimenfes zereya aenti habeni

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 4
Az
Yiቕre zilmadu endiኻ mefqere nisha
Ziwawe bedeley kembered ats’aediኻ
Tariኸy kitqyr naytmali zanta

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 5
Hilufey resieka kemyemanay shfta
Abta mengstኻ zekreni goytay
Zekreni (2) iኻ abti mengstኻ (4)

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 1
ኣዝ
እቲ’ ኳ ክትውለድ ጎይታይ ኣብ መብልዕማል ከብቲ
ትህትና ክትምህር ሓዲግካ ንሃብቲ
ፈታሪ ከለኻ መላኺ ዛምድሪ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 2
ርእስካ ናሕሰርካ ክትህበኒ ክብሪ
ፍቅርካ ረሲዐስ ኮይነልካ ከታሪ
ኣዝ
ዘይከም በርጤሜዎስ ኮይነ ልቦናይ ዘይሪእይ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 3
ሃብታም ድኻ ኮይነ ክስእን ረዳኢ
ፈውስኻ ሲኢነ መንገዲ ከዕነኒ
ወዲ ዳዊት ጎይታይ ንዓ መሓረኒ
ብመንፈስ ዘርእያ ኣዕንቲ ሃበኒ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 4
ኣዝ
ይቕረ ዝልማዱ እንዲኻ መፍቀሬ ንስሓ
ዝዋውዕ በደለይ ከምበረድ አጻዕዲኻ
ታሪኸይ ክትቅይር ናይትማሊ ዛንታ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 5
ሕሉፈይ ረሲዕካ ከምየማናይ ሽፍታ
ኣብታ መንግስትኻ ዘክረኒ ጎይታይ
ዘክረኒ(2) ኢኻ ኣብቲ መንግስትኻ(4)

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ',
        lyrics_transliteration = 'CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 1
Az
Eti’ kwa kitwled goytay ab meblemal kebti
Tihtna kitmhr hadigka nihabti
Fetari keleኻ melaኺ zamdri

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 2
Rieska nahserka kithbeni kibri
Fiqrka resias koynelka ketari
Az
Zeykem bert’emewos koyne libonay zeyriey

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 3
Habtam diኻ koyne kisen redai
Fewsኻ siine mengedi keeneni
Wedi dawit goytay nia mehareni
Bimenfes zereya aenti habeni

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 4
Az
Yiቕre zilmadu endiኻ mefqere nisha
Ziwawe bedeley kembered ats’aediኻ
Tariኸy kitqyr naytmali zanta

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 5
Hilufey resieka kemyemanay shfta
Abta mengstኻ zekreni goytay
Zekreni (2) iኻ abti mengstኻ (4)

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ',
        updated_at = clock_timestamp()::text
    WHERE import_id = '789ba363-f09b-42f2-9a88-f5718f418206'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 1
ኣዝ
እቲ’ ኳ ክትውለድ ጎይታይ ኣብ መብልዕማል ከብቲ
ትህትና ክትምህር ሓዲግካ ንሃብቲ
ፈታሪ ከለኻ መላኺ ዛምድሪ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 2
ርእስካ ናሕሰርካ ክትህበኒ ክብሪ
ፍቅርካ ረሲዐስ ኮይነልካ ከታሪ
ኣዝ
ዘይከም በርጤሜዎስ ኮይነ ልቦናይ ዘይሪእይ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 3
ሃብታም ድኻ ኮይነ ክስእን ረዳኢ
ፈውስኻ ሲኢነ መንገዲ ከዕነኒ
ወዲ ዳዊት ጎይታይ ንዓ መሓረኒ
ብመንፈስ ዘርእያ ኣዕንቲ ሃበኒ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 4
ኣዝ
ይቕረ ዝልማዱ እንዲኻ መፍቀሬ ንስሓ
ዝዋውዕ በደለይ ከምበረድ አጻዕዲኻ
ታሪኸይ ክትቅይር ናይትማሊ ዛንታ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 5
ሕሉፈይ ረሲዕካ ከምየማናይ ሽፍታ
ኣብታ መንግስትኻ ዘክረኒ ጎይታይ
ዘክረኒ(2) ኢኻ ኣብቲ መንግስትኻ(4)

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '789ba363-f09b-42f2-9a88-f5718f418206'::uuid, 'zekreni-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yewodedegn-geta ("Yewodedegn Geta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8d5f7073-f572-45e4-a7a4-7c757e907921'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

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
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 2
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 3
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 4
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 5
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal

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
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

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
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 2
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 3
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 4
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 5
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8d5f7073-f572-45e4-a7a4-7c757e907921'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8d5f7073-f572-45e4-a7a4-7c757e907921'::uuid, 'yewodedegn-geta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- done-for-me ("Done for me")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8d5195cd-799e-4c05-ac03-fda3d042d41a'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
The day that became night drowned by the darkness',
        lyrics_transliteration = 'CHORUS
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
The day that became night drowned by the darkness',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8d5195cd-799e-4c05-ac03-fda3d042d41a'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8d5195cd-799e-4c05-ac03-fda3d042d41a'::uuid, 'done-for-me', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- le-teklehaimanot-tsadiq ("Le-Teklehaimanot Tsadiq")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0f21816c-2ed2-45e8-897c-555f9d5ca569'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 1
እስመ በውስቴታ ተገብረ ፍልሠተ ሥጋሁ ወአጽሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 2
እምነ አድባራት ኵሎን ዘተለአለት በስሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 3
ኢየሱስ ክርስቶስ እንተ ቀደሳ በደሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 1
Isme be-wusteta tegebre filseta sigahu we-atsmu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 2
Imne adbarat kulon zete-le''alet be-simu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 3
Iyesus Kristos inte qedese be-demu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 1
እስመ በውስቴታ ተገብረ ፍልሠተ ሥጋሁ ወአጽሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 2
እምነ አድባራት ኵሎን ዘተለአለት በስሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 3
ኢየሱስ ክርስቶስ እንተ ቀደሳ በደሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/',
        lyrics_transliteration = 'CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 1
Isme be-wusteta tegebre filseta sigahu we-atsmu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 2
Imne adbarat kulon zete-le''alet be-simu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 3
Iyesus Kristos inte qedese be-demu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0f21816c-2ed2-45e8-897c-555f9d5ca569'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 1
እስመ በውስቴታ ተገብረ ፍልሠተ ሥጋሁ ወአጽሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 2
እምነ አድባራት ኵሎን ዘተለአለት በስሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 3
ኢየሱስ ክርስቶስ እንተ ቀደሳ በደሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 1
Isme be-wusteta tegebre filseta sigahu we-atsmu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 2
Imne adbarat kulon zete-le''alet be-simu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 3
Iyesus Kristos inte qedese be-demu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0f21816c-2ed2-45e8-897c-555f9d5ca569'::uuid, 'le-teklehaimanot-tsadiq', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
