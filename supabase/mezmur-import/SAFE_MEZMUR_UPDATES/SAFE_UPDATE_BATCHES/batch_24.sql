-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 24 OF 32
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
  -- live-mezmur-eritrean-orthodox-worship-song-reyeka-bayney-zemari-bereket ("Live mezmur /eritrean orthodox worship song /reyeka bayney / zemari Bereket tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e9e3a96e-0c68-4dfb-8be5-a2337bc89b0f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 2
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 3
መናሎ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 4
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 5
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 6
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 7
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 8
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 1
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 2
Hiji gida kefilkayo eday
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 3
Menalo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 4
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Men alo diyu nisle fiqri kibl
Men alo diyu miytu motey ziser

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 5
Men alo kemaኻ bifts’mti fiqri kisab mot zefqere
Biayne libonay hijs rieyeka eye Iyesus medhney
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 6
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 7
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 8
(kemesgneka''ye ane entay aloni)"2"

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 2
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 3
መናሎ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 4
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 5
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 6
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 7
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 8
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)',
        lyrics_transliteration = 'CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 1
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 2
Hiji gida kefilkayo eday
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 3
Menalo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 4
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Men alo diyu nisle fiqri kibl
Men alo diyu miytu motey ziser

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 5
Men alo kemaኻ bifts’mti fiqri kisab mot zefqere
Biayne libonay hijs rieyeka eye Iyesus medhney
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 6
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 7
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 8
(kemesgneka''ye ane entay aloni)"2"

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e9e3a96e-0c68-4dfb-8be5-a2337bc89b0f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 2
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 3
መናሎ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 4
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 5
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 6
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 7
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 8
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e9e3a96e-0c68-4dfb-8be5-a2337bc89b0f'::uuid, 'live-mezmur-eritrean-orthodox-worship-song-reyeka-bayney-zemari-bereket', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- moges-honehegnal ("Moges Honehegnal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '24c3e452-ff3c-43e2-897d-11e5de3e3b81'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 1
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 2
ከአንተ ከመልካሙ ወዴት እሄዳለሁ
ከህይወት ውሃዬ እንዴት እሸሻለሁ
የነፍሴ የስጋ ቸሩ ፈጣሪዬ
አመስግኜው ልኑር እግዚአብሔር አምላኬ

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 3
ቸርነትህ ብዙ ምህረት የሰጠኸኝ
ድብቁን ሃጢአቴን እየሸፈንክልኝ
አቆምከኝ ለቅኔ ለታላቅ ምስጋና
የፍቅር አምላክ ነህ ክብርህም ገናና

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 4
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 1
Keenate mahts’en kehts’annete
Yet’ebekegn ante yehonkegn abate
Sibedl sat’efa befqr eyalefkegn
Teshekmeኸgnal Egziabher temesgen

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 2
Keante kemelkamu wedet ehedalehu
Kehywet wihaye endet esheshalehu
Yenefse yesga cheru fet’ariye
Amesggnew linur Egziabher amlake

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 3
Cherneth bizu mihret yeset’eኸgn
Dibqun hat’iaten eyeshefenklgn
Aqomkegn leqne letalaq misgana
Yefqr amlak neh kibrhm genana

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 4
Keenate mahts’en kehts’annete
Yet’ebekegn ante yehonkegn abate
Sibedl sat’efa befqr eyalefkegn
Teshekmeኸgnal Egziabher temesgen

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 1
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 2
ከአንተ ከመልካሙ ወዴት እሄዳለሁ
ከህይወት ውሃዬ እንዴት እሸሻለሁ
የነፍሴ የስጋ ቸሩ ፈጣሪዬ
አመስግኜው ልኑር እግዚአብሔር አምላኬ

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 3
ቸርነትህ ብዙ ምህረት የሰጠኸኝ
ድብቁን ሃጢአቴን እየሸፈንክልኝ
አቆምከኝ ለቅኔ ለታላቅ ምስጋና
የፍቅር አምላክ ነህ ክብርህም ገናና

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 4
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ',
        lyrics_transliteration = 'CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 1
Keenate mahts’en kehts’annete
Yet’ebekegn ante yehonkegn abate
Sibedl sat’efa befqr eyalefkegn
Teshekmeኸgnal Egziabher temesgen

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 2
Keante kemelkamu wedet ehedalehu
Kehywet wihaye endet esheshalehu
Yenefse yesga cheru fet’ariye
Amesggnew linur Egziabher amlake

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 3
Cherneth bizu mihret yeset’eኸgn
Dibqun hat’iaten eyeshefenklgn
Aqomkegn leqne letalaq misgana
Yefqr amlak neh kibrhm genana

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 4
Keenate mahts’en kehts’annete
Yet’ebekegn ante yehonkegn abate
Sibedl sat’efa befqr eyalefkegn
Teshekmeኸgnal Egziabher temesgen

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '24c3e452-ff3c-43e2-897d-11e5de3e3b81'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 1
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 2
ከአንተ ከመልካሙ ወዴት እሄዳለሁ
ከህይወት ውሃዬ እንዴት እሸሻለሁ
የነፍሴ የስጋ ቸሩ ፈጣሪዬ
አመስግኜው ልኑር እግዚአብሔር አምላኬ

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 3
ቸርነትህ ብዙ ምህረት የሰጠኸኝ
ድብቁን ሃጢአቴን እየሸፈንክልኝ
አቆምከኝ ለቅኔ ለታላቅ ምስጋና
የፍቅር አምላክ ነህ ክብርህም ገናና

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 4
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '24c3e452-ff3c-43e2-897d-11e5de3e3b81'::uuid, 'moges-honehegnal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ete-mushraye-selomon-yalesh-ashenafi-gebremariam ("ETE MUSHRAYE SELOMON YALESH- ASHENAFI GEBREMARIAM")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2b1a967e-6c9c-46ec-a212-936dc1b5b9b4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 1
ድንግል እንደ ባሪያ ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 2
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሀርና በእንቁ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 3
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……
አሳድጐሽ ሳለ መልአኩ መ���ቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 4
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መላዕክ ጌታን ተሸከመሽው
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 5
የባሪያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ብጽዕት እንላለን እኛ ለዘለዓለም

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 6
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 1
Dingil ende bariya wiha teshekmesh
Getan bethtna tagelegyalesh
Ney bedemena (2) emebetach erhyte hilina
CHORUS

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 2
Werqe zebo lebsew bebetu kemolut
Beherna beenqu ketenqot’eqot’ut
Besew fit yamaru bizu honew sale
Geta gin wededesh enate nesh ale

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 3
Ney bedemena (2) emebetach erhyte hilina
CHORUS
Asadgwesh sale melaku me���bo
Teshelmesh sale beztolsh tewhbo

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 4
Ejg bethtna silagelegelshw
Ende kirub melaek getan teshekemeshw
Ney bedemena (2) emebetach erhyte hilina
CHORUS

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 5
Yebariyawn wirdet temelktwalna
Leweledshw nigus yidresew misgana
Kelb yewet’a enji kentuwn aydelem
Bits’et enlalen egna lezelealem

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 6
Ney bedemena (2) emebetach erhyte hilina

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 1
ድንግል እንደ ባሪያ ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 2
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሀርና በእንቁ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 3
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……
አሳድጐሽ ሳለ መልአኩ መ���ቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 4
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መላዕክ ጌታን ተሸከመሽው
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 5
የባሪያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ብጽዕት እንላለን እኛ ለዘለዓለም

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 6
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ',
        lyrics_transliteration = 'CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 1
Dingil ende bariya wiha teshekmesh
Getan bethtna tagelegyalesh
Ney bedemena (2) emebetach erhyte hilina
CHORUS

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 2
Werqe zebo lebsew bebetu kemolut
Beherna beenqu ketenqot’eqot’ut
Besew fit yamaru bizu honew sale
Geta gin wededesh enate nesh ale

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 3
Ney bedemena (2) emebetach erhyte hilina
CHORUS
Asadgwesh sale melaku me���bo
Teshelmesh sale beztolsh tewhbo

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 4
Ejg bethtna silagelegelshw
Ende kirub melaek getan teshekemeshw
Ney bedemena (2) emebetach erhyte hilina
CHORUS

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 5
Yebariyawn wirdet temelktwalna
Leweledshw nigus yidresew misgana
Kelb yewet’a enji kentuwn aydelem
Bits’et enlalen egna lezelealem

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 6
Ney bedemena (2) emebetach erhyte hilina

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2b1a967e-6c9c-46ec-a212-936dc1b5b9b4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 1
ድንግል እንደ ባሪያ ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 2
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሀርና በእንቁ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 3
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……
አሳድጐሽ ሳለ መልአኩ መ���ቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 4
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መላዕክ ጌታን ተሸከመሽው
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 5
የባሪያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ብጽዕት እንላለን እኛ ለዘለዓለም

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 6
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2b1a967e-6c9c-46ec-a212-936dc1b5b9b4'::uuid, 'ete-mushraye-selomon-yalesh-ashenafi-gebremariam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- keme-tibarekene ("Keme Tibarekene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '21c29ff4-2013-4146-97dd-5de1fb559ec1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እስጢፋኖስ ሐመልማለ ወርቅ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Estifanos hamelmale werk (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '21c29ff4-2013-4146-97dd-5de1fb559ec1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እስጢፋኖስ ሐመልማለ ወርቅ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Estifanos hamelmale werk (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '21c29ff4-2013-4146-97dd-5de1fb559ec1'::uuid, 'keme-tibarekene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- silasie-lebeleh ("Silasie Lebeleh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '344b1523-6ef6-4b31-9085-b06bf42182f5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
መላዕክት /ፍጥረታት ያመሰግኑሃል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Melaekt /fit’retat yamesegnuhal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '344b1523-6ef6-4b31-9085-b06bf42182f5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
መላዕክት /ፍጥረታት ያመሰግኑሃል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '344b1523-6ef6-4b31-9085-b06bf42182f5'::uuid, 'silasie-lebeleh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemarit-marita-hayile-silase-simih-behulu-temesegene ("Zemarit Marita Hayile Silase Simih Behulu Temesegene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2ab6c7cc-49e8-46b8-beca-cf64f0df222f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 2
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 3
በምግብ እጦት ብንሰቃይም
ማህሌትህን አናቁአርጥም
የመከራ ዶፍ ቢወርድብንም
እንዘምራለን ለአምላካችን ስም /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 4
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 5
ሰማዩ ዝናብ ደመና ቢያጣ
ፍቅርህ በእኛ ውስጥ ከቶ አይታጣ
ቸርነትህን እንጠብቃለን
ከአንተ ደጅ አምላክ የት እንሄዳለን /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 6
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 1
Amlak temesgen besemayat
Simh yiwedes beft’retat
Kehts’anat af misgana yiwt’a
Anten mamesgen yihun yegna et’a (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 2
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 3
Bemgb et’ot binseqaym
Mahlethn anaquart’m
Yemekera dof biwerdbnm
Enzemralen leamlakachn sim (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 4
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 5
Semayu zinab demena biyat’a
Fiqrh beegna wist’ keto aytat’a
Chernethn ent’ebqalen
Keante dej amlak yet enhedalen (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 6
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 2
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 3
በምግብ እጦት ብንሰቃይም
ማህሌትህን አናቁአርጥም
የመከራ ዶፍ ቢወርድብንም
እንዘምራለን ለአምላካችን ስም /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 4
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 5
ሰማዩ ዝናብ ደመና ቢያጣ
ፍቅርህ በእኛ ውስጥ ከቶ አይታጣ
ቸርነትህን እንጠብቃለን
ከአንተ ደጅ አምላክ የት እንሄዳለን /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 6
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/',
        lyrics_transliteration = 'CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 1
Amlak temesgen besemayat
Simh yiwedes beft’retat
Kehts’anat af misgana yiwt’a
Anten mamesgen yihun yegna et’a (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 2
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 3
Bemgb et’ot binseqaym
Mahlethn anaquart’m
Yemekera dof biwerdbnm
Enzemralen leamlakachn sim (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 4
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 5
Semayu zinab demena biyat’a
Fiqrh beegna wist’ keto aytat’a
Chernethn ent’ebqalen
Keante dej amlak yet enhedalen (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 6
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2ab6c7cc-49e8-46b8-beca-cf64f0df222f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 2
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 3
በምግብ እጦት ብንሰቃይም
ማህሌትህን አናቁአርጥም
የመከራ ዶፍ ቢወርድብንም
እንዘምራለን ለአምላካችን ስም /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 4
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 5
ሰማዩ ዝናብ ደመና ቢያጣ
ፍቅርህ በእኛ ውስጥ ከቶ አይታጣ
ቸርነትህን እንጠብቃለን
ከአንተ ደጅ አምላክ የት እንሄዳለን /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 6
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2ab6c7cc-49e8-46b8-beca-cf64f0df222f'::uuid, 'zemarit-marita-hayile-silase-simih-behulu-temesegene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-3614 ("Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e9eefa0b-cbc6-4590-ad86-986f4223f90c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 1
ዕሩቅ ጎድነይ ሳላኻ ማሚቑ
ዘይከምቲ ዝሓለፈ ድኻም ጉዕዞ ትማሊ
ስጉምተይ ብደምበርበር ናብራ ስጋይ ክሓሊ
ጎይታየ መድሕን ነፍሰይ ህይወተይ ቀይርካዮ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 2
ክምብርከኽ ንኣምልኾ ዓመት ነፍሰይ ጌርካዮ ካን ታሪኽ ኮይኑ''ዩ'' ቲ ድኻም ናይ ስጋ
ንጉስይ ካብ ሃብካ ከዓቢ ብጸጋ
መጽሓፈይ ታሪኽ ጉዕዞይ ስጉምተይ ዝሰነዶ
ቅሳነት ህድኣት ልቢ ብፍጹም ዘይንበቦ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 3
ሓሊፉ ላዕልን ታሕትን ምንም ትርጉን ዝይብሉ
ዛዚምካዮ ብሓጎስ ዕለት ጋማይ ኣኺሉ
መስቀለይ ኣልዒ ምስቲ ምቃል ጎድነይ
ፍልይቲ ዓመት'' ያ ዓመት ቃል ኪዳነይ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 4
ጎይታየ ንባርያኻ ዘይትጠልም መብጽዓ
ሰሪዕካያ አንሀት ዕለት ዓወት ክሪኣ
ኣኽሊልካ ኣኽሊል ቅብኢ ንዓይ ዘይግብኣኒ
ቅብአኻ ቅብኢ መንፈስ ንኺዳነይ ከሰኒ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 5
''ታይ ዝበለት ዕለት ፍጹም ዘይትርሳዕ
ፈጣሪ ዝሃበ ት'' ሂቡ ዘይከልአ
ኣብ ዘመን ግሽነተይ ሕግኻ ክምርምሮ
ኣብ ጉዕዞ ንሰማያት ቃላት ኣፍካ ከኽብሮ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 6
ክትከብር ኣብቲ ቤተይ ብምስጋና ኣምልኾ
ዕድሜኻ አቶ ቤተይ ብጸጋኻ ባርኮ
ኩሉ ካብ ላዕሊ '' ዩ አቲ ምሉአ ውህበት
ቤተይ ቤት ክብርኻ ትኹን ዘንትአለት

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 1
Eruq godney salaኻ mamiቑ
Zeykemti zihalefe diኻm guezo timali
Sigumtey bidemberber nabra sigay kihali
Goytaye medhn nefsey hiywetey qeyrkayo

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 2
Kimbrkeኽ niamlኾ amet nefsey gerkayo kan tariኽ koynu''yu'' ti diኻm nay siga
Nigusy kab habka keabi bits’ega
Mets’hafey tariኽ guezoy sigumtey zisenedo
Qisanet hidat libi bifts’um zeynbebo

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 3
Halifu laeln tahtn minm tirgun ziyblu
Zazimkayo bihagos elet gamay aኺlu
Mesqeley ali misti miqal godney
Filyti amet'' ya amet qal kidaney

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 4
Goytaye nibaryaኻ zeytt’elm mebts’a
Seriekaya anhet elet awet kiria
Aኽlilka aኽlil qibi niay zeygbani
Qibaኻ qibi menfes niኺdaney keseni

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 5
''tay zibelet elet fits’um zeytrsae
Fet’ari zihabe t'' hibu zeykela
Ab zemen gishnetey higኻ kimrmro
Ab guezo nisemayat qalat afka keኽbro

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 6
Kitkebr abti betey bimsgana amlኾ
Edmeኻ ato betey bits’egaኻ barko
Kulu kab laeli '' yu ati milua wihbet
Betey bet kibrኻ tiኹn zentalet

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 1
ዕሩቅ ጎድነይ ሳላኻ ማሚቑ
ዘይከምቲ ዝሓለፈ ድኻም ጉዕዞ ትማሊ
ስጉምተይ ብደምበርበር ናብራ ስጋይ ክሓሊ
ጎይታየ መድሕን ነፍሰይ ህይወተይ ቀይርካዮ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 2
ክምብርከኽ ንኣምልኾ ዓመት ነፍሰይ ጌርካዮ ካን ታሪኽ ኮይኑ''ዩ'' ቲ ድኻም ናይ ስጋ
ንጉስይ ካብ ሃብካ ከዓቢ ብጸጋ
መጽሓፈይ ታሪኽ ጉዕዞይ ስጉምተይ ዝሰነዶ
ቅሳነት ህድኣት ልቢ ብፍጹም ዘይንበቦ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 3
ሓሊፉ ላዕልን ታሕትን ምንም ትርጉን ዝይብሉ
ዛዚምካዮ ብሓጎስ ዕለት ጋማይ ኣኺሉ
መስቀለይ ኣልዒ ምስቲ ምቃል ጎድነይ
ፍልይቲ ዓመት'' ያ ዓመት ቃል ኪዳነይ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 4
ጎይታየ ንባርያኻ ዘይትጠልም መብጽዓ
ሰሪዕካያ አንሀት ዕለት ዓወት ክሪኣ
ኣኽሊልካ ኣኽሊል ቅብኢ ንዓይ ዘይግብኣኒ
ቅብአኻ ቅብኢ መንፈስ ንኺዳነይ ከሰኒ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 5
''ታይ ዝበለት ዕለት ፍጹም ዘይትርሳዕ
ፈጣሪ ዝሃበ ት'' ሂቡ ዘይከልአ
ኣብ ዘመን ግሽነተይ ሕግኻ ክምርምሮ
ኣብ ጉዕዞ ንሰማያት ቃላት ኣፍካ ከኽብሮ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 6
ክትከብር ኣብቲ ቤተይ ብምስጋና ኣምልኾ
ዕድሜኻ አቶ ቤተይ ብጸጋኻ ባርኮ
ኩሉ ካብ ላዕሊ '' ዩ አቲ ምሉአ ውህበት
ቤተይ ቤት ክብርኻ ትኹን ዘንትአለት

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ',
        lyrics_transliteration = 'CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 1
Eruq godney salaኻ mamiቑ
Zeykemti zihalefe diኻm guezo timali
Sigumtey bidemberber nabra sigay kihali
Goytaye medhn nefsey hiywetey qeyrkayo

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 2
Kimbrkeኽ niamlኾ amet nefsey gerkayo kan tariኽ koynu''yu'' ti diኻm nay siga
Nigusy kab habka keabi bits’ega
Mets’hafey tariኽ guezoy sigumtey zisenedo
Qisanet hidat libi bifts’um zeynbebo

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 3
Halifu laeln tahtn minm tirgun ziyblu
Zazimkayo bihagos elet gamay aኺlu
Mesqeley ali misti miqal godney
Filyti amet'' ya amet qal kidaney

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 4
Goytaye nibaryaኻ zeytt’elm mebts’a
Seriekaya anhet elet awet kiria
Aኽlilka aኽlil qibi niay zeygbani
Qibaኻ qibi menfes niኺdaney keseni

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 5
''tay zibelet elet fits’um zeytrsae
Fet’ari zihabe t'' hibu zeykela
Ab zemen gishnetey higኻ kimrmro
Ab guezo nisemayat qalat afka keኽbro

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 6
Kitkebr abti betey bimsgana amlኾ
Edmeኻ ato betey bits’egaኻ barko
Kulu kab laeli '' yu ati milua wihbet
Betey bet kibrኻ tiኹn zentalet

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e9eefa0b-cbc6-4590-ad86-986f4223f90c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 1
ዕሩቅ ጎድነይ ሳላኻ ማሚቑ
ዘይከምቲ ዝሓለፈ ድኻም ጉዕዞ ትማሊ
ስጉምተይ ብደምበርበር ናብራ ስጋይ ክሓሊ
ጎይታየ መድሕን ነፍሰይ ህይወተይ ቀይርካዮ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 2
ክምብርከኽ ንኣምልኾ ዓመት ነፍሰይ ጌርካዮ ካን ታሪኽ ኮይኑ''ዩ'' ቲ ድኻም ናይ ስጋ
ንጉስይ ካብ ሃብካ ከዓቢ ብጸጋ
መጽሓፈይ ታሪኽ ጉዕዞይ ስጉምተይ ዝሰነዶ
ቅሳነት ህድኣት ልቢ ብፍጹም ዘይንበቦ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 3
ሓሊፉ ላዕልን ታሕትን ምንም ትርጉን ዝይብሉ
ዛዚምካዮ ብሓጎስ ዕለት ጋማይ ኣኺሉ
መስቀለይ ኣልዒ ምስቲ ምቃል ጎድነይ
ፍልይቲ ዓመት'' ያ ዓመት ቃል ኪዳነይ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 4
ጎይታየ ንባርያኻ ዘይትጠልም መብጽዓ
ሰሪዕካያ አንሀት ዕለት ዓወት ክሪኣ
ኣኽሊልካ ኣኽሊል ቅብኢ ንዓይ ዘይግብኣኒ
ቅብአኻ ቅብኢ መንፈስ ንኺዳነይ ከሰኒ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 5
''ታይ ዝበለት ዕለት ፍጹም ዘይትርሳዕ
ፈጣሪ ዝሃበ ት'' ሂቡ ዘይከልአ
ኣብ ዘመን ግሽነተይ ሕግኻ ክምርምሮ
ኣብ ጉዕዞ ንሰማያት ቃላት ኣፍካ ከኽብሮ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 6
ክትከብር ኣብቲ ቤተይ ብምስጋና ኣምልኾ
ዕድሜኻ አቶ ቤተይ ብጸጋኻ ባርኮ
ኩሉ ካብ ላዕሊ '' ዩ አቲ ምሉአ ውህበት
ቤተይ ቤት ክብርኻ ትኹን ዘንትአለት

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e9eefa0b-cbc6-4590-ad86-986f4223f90c'::uuid, 'eritrean-orthodox-tewahdo-mezmur-3614', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dinigil-hoy-wede-ene-timechi-zenid-2895 ("Dinigil Hoy Wede Ene Timechi Zenid")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '25005c31-1995-41db-8417-fb0e7f187b2a'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ወደተራራማ ይሁዳ ከተማ',
        lyrics_transliteration = 'CHORUS
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
Wedeterarama yihuda ketema',
        updated_at = clock_timestamp()::text
    WHERE import_id = '25005c31-1995-41db-8417-fb0e7f187b2a'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '25005c31-1995-41db-8417-fb0e7f187b2a'::uuid, 'dinigil-hoy-wede-ene-timechi-zenid-2895', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemari-g-yohannes-g-tsadik ("+++ / / /Zemari G/Yohannes G/Tsadik")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2b63c9ef-f710-4592-a04a-10cb56876c2f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 1
እጅህ ሰፊ እንደሆነ አውቃለሁ ጌታዬ
የጎደለው ሞልቷል ይድረስ ምስጋናዬ
ያጣሁትን ካንተ አግኝቻለሁ
ሁሉን ነገር ለበጎ ብያለሁ /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 2
ማቄን የቀደደው ደስታ አስታጠቀኝ
ባዶ የነበርኩት ደስታ ተሰጠኝ
ሰጪም ነሺም እግዚአብሔር ብቻ ነው
የሰው ድርሻ በር ማንኳኳት ነው /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 3
እገፋለሁ እንጂ እኔ አልጨነቅም
መሠረቴ አንተ ነህ ከቶ አልናወጥም
ስትሰጠኝ የሚታየውን
እንዳትነሳኝ የዘላለሙን /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 4
ቢሰጥ አያልቅበት ለጋስ ክቡር ጌታ
ሁሉን ከወነልኝ በልዩ ችሮታ
ድሆች ስንሆን ሁሉ አለንና
አማላካችን ይድረሰው ምስጋና /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 1
Ejh sefi endehone awqalehu Getaye
Yegodelew moltwal yidres misganaye
Yat’ahutn kante aggnchalehu
Hulun neger lebego biyalehu (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 2
Maqen yeqededew desta astat’eqegn
Bado yeneberkut desta teset’egn
Sech’im neshim Egziabher bicha new
Yesew dirsha ber mankwakwat new (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 3
Egefalehu enji ene alch’eneqm
Meserete ante neh keto alnawet’m
Sitset’egn yemitayewn
Endatnesagn yezelalemun (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 4
Biset’ ayalqbet legas kibur Geta
Hulun kewenelgn belyu chrota
Dihoch sinhon hulu alenna
Amalakachn yidresew misgana (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 1
እጅህ ሰፊ እንደሆነ አውቃለሁ ጌታዬ
የጎደለው ሞልቷል ይድረስ ምስጋናዬ
ያጣሁትን ካንተ አግኝቻለሁ
ሁሉን ነገር ለበጎ ብያለሁ /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 2
ማቄን የቀደደው ደስታ አስታጠቀኝ
ባዶ የነበርኩት ደስታ ተሰጠኝ
ሰጪም ነሺም እግዚአብሔር ብቻ ነው
የሰው ድርሻ በር ማንኳኳት ነው /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 3
እገፋለሁ እንጂ እኔ አልጨነቅም
መሠረቴ አንተ ነህ ከቶ አልናወጥም
ስትሰጠኝ የሚታየውን
እንዳትነሳኝ የዘላለሙን /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 4
ቢሰጥ አያልቅበት ለጋስ ክቡር ጌታ
ሁሉን ከወነልኝ በልዩ ችሮታ
ድሆች ስንሆን ሁሉ አለንና
አማላካችን ይድረሰው ምስጋና /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ',
        lyrics_transliteration = 'CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 1
Ejh sefi endehone awqalehu Getaye
Yegodelew moltwal yidres misganaye
Yat’ahutn kante aggnchalehu
Hulun neger lebego biyalehu (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 2
Maqen yeqededew desta astat’eqegn
Bado yeneberkut desta teset’egn
Sech’im neshim Egziabher bicha new
Yesew dirsha ber mankwakwat new (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 3
Egefalehu enji ene alch’eneqm
Meserete ante neh keto alnawet’m
Sitset’egn yemitayewn
Endatnesagn yezelalemun (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 4
Biset’ ayalqbet legas kibur Geta
Hulun kewenelgn belyu chrota
Dihoch sinhon hulu alenna
Amalakachn yidresew misgana (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2b63c9ef-f710-4592-a04a-10cb56876c2f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 1
እጅህ ሰፊ እንደሆነ አውቃለሁ ጌታዬ
የጎደለው ሞልቷል ይድረስ ምስጋናዬ
ያጣሁትን ካንተ አግኝቻለሁ
ሁሉን ነገር ለበጎ ብያለሁ /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 2
ማቄን የቀደደው ደስታ አስታጠቀኝ
ባዶ የነበርኩት ደስታ ተሰጠኝ
ሰጪም ነሺም እግዚአብሔር ብቻ ነው
የሰው ድርሻ በር ማንኳኳት ነው /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 3
እገፋለሁ እንጂ እኔ አልጨነቅም
መሠረቴ አንተ ነህ ከቶ አልናወጥም
ስትሰጠኝ የሚታየውን
እንዳትነሳኝ የዘላለሙን /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 4
ቢሰጥ አያልቅበት ለጋስ ክቡር ጌታ
ሁሉን ከወነልኝ በልዩ ችሮታ
ድሆች ስንሆን ሁሉ አለንና
አማላካችን ይድረሰው ምስጋና /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2b63c9ef-f710-4592-a04a-10cb56876c2f'::uuid, 'zemari-g-yohannes-g-tsadik', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- abebaye-kidanemihiret ("Abebaye Kidanemihiret")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2d31bbcd-82f6-4692-8e8b-10d74677fe27'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 1
ለኔማ ለልጅሽ
ሰምዬ ነሽ በእውነት
እኮራለሁ በአንቺ ከዕልፍ እናቶች
ልጅሽ ስለሆነ ጌታቸው ለጌቶች

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 2
የበዛለት ቅኔ ፍቅርሽ የበዛለት
ውድስት አንቲ ይላል ሁሌ ያለ ዝለት
እናቴ አንቺን ለመውሰድ
ምን ያስፈራኛል

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 3
እናቴ ጌታ ከሰጠኝ
ማን ይነጥቀኛል
ባልደርብም ካባ ባልቀዳጅ ዘውድ
ለኔ ሞገሴ ነው ልጅሽ ወላዲት

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 4
የቀራንዮ ፍቅሩ መውደዱ ሲደንቀኝ
እነኋት አለና አንቺንም ሸለመኝ
ሽልማቴ ደብረ ነዋኂት
ፀምረ ጌዴዎን

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 5
ሽልማቴ ኅትምት ክታብ
እናቴ ጽዮን
ሰማይ ሆነሽለት ለእውነተኛው ፀሀይ
ድቅድቁ ለቀቀ ልጅሽ በአንቺ ሲታይ

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 6
በሞት መሸበሩ ግርግሩ በቃ
ጌታ በመስቀል ላይ ተፈጸመ አለ አበቃ
አበባዬ ተረሳሁ ብዬ
አልደፋ አንገቴን

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 7
አበባዬ አንቺ አለሽኝ
ለኔስ ኩራቴ

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 1
Lenema leljsh
Semye nesh beewnet
Ekoralehu beanchi keelf enatoch
Lijsh silehone getachew legetoch

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 2
Yebezalet qine fiqrsh yebezalet
Widst anti yilal hule yale zilet
Enate anchin lemewsed
Min yasferagnal

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 3
Enate Geta keset’egn
Man yinet’qegnal
Balderbm kaba balqedaj zewd
Lene mogese new lijsh weladit

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 4
Yeqeranyo fiqru mewdedu sidenqegn
Enehwat alena anchinm shelemegn
Shlmate debre newahit
Ts’emre gedewon

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 5
Shlmate hitmt kitab
Enate ts’yon
Semay honeshlet leewnetegnaw ts’ehey
Diqdqu leqeqe lijsh beanchi sitay

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 6
Bemot mesheberu girgru beqa
Geta bemesqel lay tefets’eme ale abeqa
Abebaye teresahu biye
Aldefa angeten

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 7
Abebaye anchi aleshgn
Lenes kurate

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 1
ለኔማ ለልጅሽ
ሰምዬ ነሽ በእውነት
እኮራለሁ በአንቺ ከዕልፍ እናቶች
ልጅሽ ስለሆነ ጌታቸው ለጌቶች

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 2
የበዛለት ቅኔ ፍቅርሽ የበዛለት
ውድስት አንቲ ይላል ሁሌ ያለ ዝለት
እናቴ አንቺን ለመውሰድ
ምን ያስፈራኛል

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 3
እናቴ ጌታ ከሰጠኝ
ማን ይነጥቀኛል
ባልደርብም ካባ ባልቀዳጅ ዘውድ
ለኔ ሞገሴ ነው ልጅሽ ወላዲት

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 4
የቀራንዮ ፍቅሩ መውደዱ ሲደንቀኝ
እነኋት አለና አንቺንም ሸለመኝ
ሽልማቴ ደብረ ነዋኂት
ፀምረ ጌዴዎን

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 5
ሽልማቴ ኅትምት ክታብ
እናቴ ጽዮን
ሰማይ ሆነሽለት ለእውነተኛው ፀሀይ
ድቅድቁ ለቀቀ ልጅሽ በአንቺ ሲታይ

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 6
በሞት መሸበሩ ግርግሩ በቃ
ጌታ በመስቀል ላይ ተፈጸመ አለ አበቃ
አበባዬ ተረሳሁ ብዬ
አልደፋ አንገቴን

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 7
አበባዬ አንቺ አለሽኝ
ለኔስ ኩራቴ

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት',
        lyrics_transliteration = 'CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 1
Lenema leljsh
Semye nesh beewnet
Ekoralehu beanchi keelf enatoch
Lijsh silehone getachew legetoch

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 2
Yebezalet qine fiqrsh yebezalet
Widst anti yilal hule yale zilet
Enate anchin lemewsed
Min yasferagnal

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 3
Enate Geta keset’egn
Man yinet’qegnal
Balderbm kaba balqedaj zewd
Lene mogese new lijsh weladit

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 4
Yeqeranyo fiqru mewdedu sidenqegn
Enehwat alena anchinm shelemegn
Shlmate debre newahit
Ts’emre gedewon

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 5
Shlmate hitmt kitab
Enate ts’yon
Semay honeshlet leewnetegnaw ts’ehey
Diqdqu leqeqe lijsh beanchi sitay

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 6
Bemot mesheberu girgru beqa
Geta bemesqel lay tefets’eme ale abeqa
Abebaye teresahu biye
Aldefa angeten

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 7
Abebaye anchi aleshgn
Lenes kurate

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2d31bbcd-82f6-4692-8e8b-10d74677fe27'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 1
ለኔማ ለልጅሽ
ሰምዬ ነሽ በእውነት
እኮራለሁ በአንቺ ከዕልፍ እናቶች
ልጅሽ ስለሆነ ጌታቸው ለጌቶች

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 2
የበዛለት ቅኔ ፍቅርሽ የበዛለት
ውድስት አንቲ ይላል ሁሌ ያለ ዝለት
እናቴ አንቺን ለመውሰድ
ምን ያስፈራኛል

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 3
እናቴ ጌታ ከሰጠኝ
ማን ይነጥቀኛል
ባልደርብም ካባ ባልቀዳጅ ዘውድ
ለኔ ሞገሴ ነው ልጅሽ ወላዲት

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 4
የቀራንዮ ፍቅሩ መውደዱ ሲደንቀኝ
እነኋት አለና አንቺንም ሸለመኝ
ሽልማቴ ደብረ ነዋኂት
ፀምረ ጌዴዎን

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 5
ሽልማቴ ኅትምት ክታብ
እናቴ ጽዮን
ሰማይ ሆነሽለት ለእውነተኛው ፀሀይ
ድቅድቁ ለቀቀ ልጅሽ በአንቺ ሲታይ

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 6
በሞት መሸበሩ ግርግሩ በቃ
ጌታ በመስቀል ላይ ተፈጸመ አለ አበቃ
አበባዬ ተረሳሁ ብዬ
አልደፋ አንገቴን

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 7
አበባዬ አንቺ አለሽኝ
ለኔስ ኩራቴ

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2d31bbcd-82f6-4692-8e8b-10d74677fe27'::uuid, 'abebaye-kidanemihiret', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- erefitish ("Erefitish")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '316d218f-2dfb-48f6-9125-dce1b06e1f91'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 1
ሞትሽ በወርኀ ጥር ነሐሴ መቃብርሽ
ውበት ሰጥተውታል ማርያም ሆይ ለክብርሽ
ዘካርያስ ያያት ተቅዋመ ማኅቶት
አማናዊት ፅዮን ማኅደረ መለኮት

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 2
ቶማስ በደመና ዕርገቷ እየታየው
ምስክር ሊሆነው ሰበኗ ተሰጠው
ሐዋርያት በአንድ ልብ ሱባዔ ጀምረው
ትንሣኤዋን ሳናይ እንዴት ቀረን ብለው

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 3
ጾም ጸሎታቸውን አምላክ ተቀበለው
ትኩስ አድርጎ በድኗን ነሐሴ ሰጣቸው
ከመቃብር ሳትቀር ድንግል ተነስታለች
ለሁሉ ሐዋርያት ነሃሴ ታይታለች

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 4
በልጇ እጅ ቆርባ በክብር ዐርጋለች
በልዕልና ሆና በጌታ ቀኝ አለች
በተዋህዶ እምነት ቀናኢ የሆንን
የምልጃዋን ጸሎት አምነን የቀረብን

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 5
የአስራት ሀገሯ ኢትዮጵያ ናት ያልን
ድንግል በፍልሰቷ ጸጋዋን ታልብሰን

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 1
Motsh bewerhe t’r nehese meqabrsh
Wibet set’tewtal Maryam hoy lekbrsh
Zekaryas yayat teqwame mahtot
Amanawit ts’yon mahdere melekot

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 2
Tomas bedemena ergetwa eyetayew
Miskr lihonew sebenwa teset’ew
Hewaryat beand lib subae jemrew
Tinsaewan sanay endet qeren bilew

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 3
Ts’om ts’elotachewn amlak teqebelew
Tikus adrgo bednwan nehese set’achew
Kemeqabr satqer Dingil tenestalech
Lehulu hewaryat nehase taytalech

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 4
Beljwa ej qorba bekbr argalech
Belelna hona begeta qegn alech
Betewahdo emnet qenai yehonn
Yemljawan ts’elot amnen yeqerebn

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 5
Yeasrat hegerwa ityop’ya nat yaln
Dingil beflsetwa ts’egawan talbsen

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 1
ሞትሽ በወርኀ ጥር ነሐሴ መቃብርሽ
ውበት ሰጥተውታል ማርያም ሆይ ለክብርሽ
ዘካርያስ ያያት ተቅዋመ ማኅቶት
አማናዊት ፅዮን ማኅደረ መለኮት

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 2
ቶማስ በደመና ዕርገቷ እየታየው
ምስክር ሊሆነው ሰበኗ ተሰጠው
ሐዋርያት በአንድ ልብ ሱባዔ ጀምረው
ትንሣኤዋን ሳናይ እንዴት ቀረን ብለው

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 3
ጾም ጸሎታቸውን አምላክ ተቀበለው
ትኩስ አድርጎ በድኗን ነሐሴ ሰጣቸው
ከመቃብር ሳትቀር ድንግል ተነስታለች
ለሁሉ ሐዋርያት ነሃሴ ታይታለች

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 4
በልጇ እጅ ቆርባ በክብር ዐርጋለች
በልዕልና ሆና በጌታ ቀኝ አለች
በተዋህዶ እምነት ቀናኢ የሆንን
የምልጃዋን ጸሎት አምነን የቀረብን

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 5
የአስራት ሀገሯ ኢትዮጵያ ናት ያልን
ድንግል በፍልሰቷ ጸጋዋን ታልብሰን

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት',
        lyrics_transliteration = 'CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 1
Motsh bewerhe t’r nehese meqabrsh
Wibet set’tewtal Maryam hoy lekbrsh
Zekaryas yayat teqwame mahtot
Amanawit ts’yon mahdere melekot

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 2
Tomas bedemena ergetwa eyetayew
Miskr lihonew sebenwa teset’ew
Hewaryat beand lib subae jemrew
Tinsaewan sanay endet qeren bilew

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 3
Ts’om ts’elotachewn amlak teqebelew
Tikus adrgo bednwan nehese set’achew
Kemeqabr satqer Dingil tenestalech
Lehulu hewaryat nehase taytalech

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 4
Beljwa ej qorba bekbr argalech
Belelna hona begeta qegn alech
Betewahdo emnet qenai yehonn
Yemljawan ts’elot amnen yeqerebn

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 5
Yeasrat hegerwa ityop’ya nat yaln
Dingil beflsetwa ts’egawan talbsen

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '316d218f-2dfb-48f6-9125-dce1b06e1f91'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 1
ሞትሽ በወርኀ ጥር ነሐሴ መቃብርሽ
ውበት ሰጥተውታል ማርያም ሆይ ለክብርሽ
ዘካርያስ ያያት ተቅዋመ ማኅቶት
አማናዊት ፅዮን ማኅደረ መለኮት

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 2
ቶማስ በደመና ዕርገቷ እየታየው
ምስክር ሊሆነው ሰበኗ ተሰጠው
ሐዋርያት በአንድ ልብ ሱባዔ ጀምረው
ትንሣኤዋን ሳናይ እንዴት ቀረን ብለው

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 3
ጾም ጸሎታቸውን አምላክ ተቀበለው
ትኩስ አድርጎ በድኗን ነሐሴ ሰጣቸው
ከመቃብር ሳትቀር ድንግል ተነስታለች
ለሁሉ ሐዋርያት ነሃሴ ታይታለች

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 4
በልጇ እጅ ቆርባ በክብር ዐርጋለች
በልዕልና ሆና በጌታ ቀኝ አለች
በተዋህዶ እምነት ቀናኢ የሆንን
የምልጃዋን ጸሎት አምነን የቀረብን

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 5
የአስራት ሀገሯ ኢትዮጵያ ናት ያልን
ድንግል በፍልሰቷ ጸጋዋን ታልብሰን

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '316d218f-2dfb-48f6-9125-dce1b06e1f91'::uuid, 'erefitish', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- min-biye ("Min Biye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3ea1220e-23ad-4c6b-9e88-22aad542e484'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 1
አይ የእርሱ ሥራ የእርሱ ደግነት
በየትኛው ቋንቋ ልመስክረለት
ክብሩን እያሰብኩ ልዘምርለት:
የልቤን መሻት ፈፅሞልኛል

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 2
ይክበር አምላኬ እኔን ወዶኛል:
ዘመኔን ሁሉ እጠራዋለሁ
ምስጋናን እንጂ ምን እሰዋለሁ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 3
ጨለማው ዓለም ብርሃን ሆነ
ጌታ በልቤ ገብቶ ገነነ
ሞቴን በሕይወት እየሸፈነ:
ባሪያ አደለሁም ልጁ ነኝ ዛሬ

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 4
ያስጐነበሰኝ የለም ቀንበሬ:
ተድላና ደስታን ሞላኝ ጌታዬ
የአፌ ምስጋና ውዴ ዜማዬ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 5
መራራው ኑሮ በእሱ ጣፈጠ
ሳበኝ በፍቅሩ ልቤ ቀለጠ
አዲስ አረገኝ እየለወጠ:
ቸር ነው መሃሪ በቀል የለበት

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 6
ሁሉን ያዳነ በተገኘበት:
ምን ይመልሰዋል ገጹ ምህረቱን
ዓይኔም አየችው አዳኝነቱን::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 7
ከጠላት ፍርሃት ነፍሴን አድኖ
በፀጋው ግምጃ በደሌን ከድኖ
ከጐኔ ቆሟል ታዳጌ ሆኖ:
መታመኛዬ ኃይሌ ጉልበቴ

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 8
የማይደፈር አለት ነው ቤቴ:
ይክብር አምላኬ በዘመን ሁሉ
የሚወዱትም አሜን! ይበሉ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 1
Ay yeersu sira yeersu degnet
Beyetgnaw qwanqwa limeskrelet
Kibrun eyasebku lizemrlet:
Yelben meshat fets’molgnal

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 2
Yikber amlake enen wedognal:
Zemenen hulu et’erawalehu
Misganan enji min esewalehu::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 3
Ch’elemaw alem birhan hone
Geta belbe gebto genene
Moten behywet eyeshefene:
Bariya adelehum liju negn zare

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 4
Yasgwenebesegn yelem qenbere:
Tedlana destan molagn Getaye
Yeafe misgana wide zemaye::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 5
Meraraw nuro beesu t’afet’e
Sabegn befqru libe qelet’e
Adis aregegn eyelewet’e:
Cher new mehari beqel yelebet

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 6
Hulun yadane betegegnebet:
Min yimelsewal gets’u mihretun
Aynem ayechw adagnnetun::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 7
Ket’elat firhat nefsen adno
Bets’egaw gimja bedelen kedno
Kegwene qomwal tadage hono:
Metamegnaye hayle gulbete

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 8
Yemaydefer alet new bete:
Yikbr amlake bezemen hulu
Yemiwedutm Amen! yibelu::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 1
አይ የእርሱ ሥራ የእርሱ ደግነት
በየትኛው ቋንቋ ልመስክረለት
ክብሩን እያሰብኩ ልዘምርለት:
የልቤን መሻት ፈፅሞልኛል

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 2
ይክበር አምላኬ እኔን ወዶኛል:
ዘመኔን ሁሉ እጠራዋለሁ
ምስጋናን እንጂ ምን እሰዋለሁ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 3
ጨለማው ዓለም ብርሃን ሆነ
ጌታ በልቤ ገብቶ ገነነ
ሞቴን በሕይወት እየሸፈነ:
ባሪያ አደለሁም ልጁ ነኝ ዛሬ

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 4
ያስጐነበሰኝ የለም ቀንበሬ:
ተድላና ደስታን ሞላኝ ጌታዬ
የአፌ ምስጋና ውዴ ዜማዬ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 5
መራራው ኑሮ በእሱ ጣፈጠ
ሳበኝ በፍቅሩ ልቤ ቀለጠ
አዲስ አረገኝ እየለወጠ:
ቸር ነው መሃሪ በቀል የለበት

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 6
ሁሉን ያዳነ በተገኘበት:
ምን ይመልሰዋል ገጹ ምህረቱን
ዓይኔም አየችው አዳኝነቱን::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 7
ከጠላት ፍርሃት ነፍሴን አድኖ
በፀጋው ግምጃ በደሌን ከድኖ
ከጐኔ ቆሟል ታዳጌ ሆኖ:
መታመኛዬ ኃይሌ ጉልበቴ

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 8
የማይደፈር አለት ነው ቤቴ:
ይክብር አምላኬ በዘመን ሁሉ
የሚወዱትም አሜን! ይበሉ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/',
        lyrics_transliteration = 'CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 1
Ay yeersu sira yeersu degnet
Beyetgnaw qwanqwa limeskrelet
Kibrun eyasebku lizemrlet:
Yelben meshat fets’molgnal

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 2
Yikber amlake enen wedognal:
Zemenen hulu et’erawalehu
Misganan enji min esewalehu::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 3
Ch’elemaw alem birhan hone
Geta belbe gebto genene
Moten behywet eyeshefene:
Bariya adelehum liju negn zare

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 4
Yasgwenebesegn yelem qenbere:
Tedlana destan molagn Getaye
Yeafe misgana wide zemaye::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 5
Meraraw nuro beesu t’afet’e
Sabegn befqru libe qelet’e
Adis aregegn eyelewet’e:
Cher new mehari beqel yelebet

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 6
Hulun yadane betegegnebet:
Min yimelsewal gets’u mihretun
Aynem ayechw adagnnetun::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 7
Ket’elat firhat nefsen adno
Bets’egaw gimja bedelen kedno
Kegwene qomwal tadage hono:
Metamegnaye hayle gulbete

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 8
Yemaydefer alet new bete:
Yikbr amlake bezemen hulu
Yemiwedutm Amen! yibelu::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3ea1220e-23ad-4c6b-9e88-22aad542e484'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 1
አይ የእርሱ ሥራ የእርሱ ደግነት
በየትኛው ቋንቋ ልመስክረለት
ክብሩን እያሰብኩ ልዘምርለት:
የልቤን መሻት ፈፅሞልኛል

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 2
ይክበር አምላኬ እኔን ወዶኛል:
ዘመኔን ሁሉ እጠራዋለሁ
ምስጋናን እንጂ ምን እሰዋለሁ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 3
ጨለማው ዓለም ብርሃን ሆነ
ጌታ በልቤ ገብቶ ገነነ
ሞቴን በሕይወት እየሸፈነ:
ባሪያ አደለሁም ልጁ ነኝ ዛሬ

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 4
ያስጐነበሰኝ የለም ቀንበሬ:
ተድላና ደስታን ሞላኝ ጌታዬ
የአፌ ምስጋና ውዴ ዜማዬ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 5
መራራው ኑሮ በእሱ ጣፈጠ
ሳበኝ በፍቅሩ ልቤ ቀለጠ
አዲስ አረገኝ እየለወጠ:
ቸር ነው መሃሪ በቀል የለበት

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 6
ሁሉን ያዳነ በተገኘበት:
ምን ይመልሰዋል ገጹ ምህረቱን
ዓይኔም አየችው አዳኝነቱን::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 7
ከጠላት ፍርሃት ነፍሴን አድኖ
በፀጋው ግምጃ በደሌን ከድኖ
ከጐኔ ቆሟል ታዳጌ ሆኖ:
መታመኛዬ ኃይሌ ጉልበቴ

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 8
የማይደፈር አለት ነው ቤቴ:
ይክብር አምላኬ በዘመን ሁሉ
የሚወዱትም አሜን! ይበሉ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3ea1220e-23ad-4c6b-9e88-22aad542e484'::uuid, 'min-biye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- merehalew-belegn ("Merehalew Belegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '34b29d80-f518-4a26-8edd-07dfe60468fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 1
የምህረት አይኖችህ ይዩኝ በይቅርታ
ስለ ድንግል ማርያም እስራቴን ፍታ /2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 2
ቸል በማለቴ የደምህን ዋጋ
ተመልሼ ገባሁ ከጥፋት መጋጋ
ሰላሜ ደፍርሶ ተቅበዝባዥ ሆኛለሁ
ስለ እናትህ ብለህ ማረኝ እልሃለሁ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 3
ስለ ድንግል ማርያም ማረኝ እልሃለሁ
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በከንቱ መሻቴ ስጋ ነብሴን ቀብሮ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 4
አቅም አጥቻለሁ አጥንቴ ተሰብሮ
ከበረዶ ይልቅ ነጭ እንድታደርገኝ
ስለ ድንግል ማርያም ከሀጥያቴ እጠበኝ
ስለ ድንግል ማርያም ምሬሃለሁ በለኝ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 5
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
ከንፈሮቼን ከፍተህ ልቁም ለምስጋና
አንተን የጋረደኝ ጣርያ ይነሳና

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 6
አልብሰኝ ፅድቅህን ይቅር መራቆቴ
ስል ድንግል ማርያም መልሰኝ ከቤቴ/2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም(2)

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 1
Yemhret aynochh yiyugn beyqrta
Sile Dingil Maryam esraten fita /2
Mirehalewu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 2
Chel bemalete yedemhn waga
Temelshe gebahu ket’fat megaga
Selame defrso teqbezbazh hognalehu
Sile enath bileh maregn elhalehu

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 3
Sile Dingil Maryam maregn elhalehu
Mirehalehu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem
Bekentu meshate siga nebsen qebro

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 4
Aqm at’chalehu at’nte tesebro
Keberedo yilq nech’ endtadergegn
Sile Dingil Maryam kehet’yate et’ebegn
Sile Dingil Maryam mirehalehu belegn

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 5
Mirehalehu belegn sile Dingil Maryam
Mihariw medhani alem yiqr bay endante yelem
Kenferochen kefteh liqum lemsgana
Anten yegaredegn t’arya yinesana

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 6
Albsegn ts’dqhn yiqr meraqote
Sil Dingil Maryam melsegn kebete/2
Mirehalewu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem (2)

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 1
የምህረት አይኖችህ ይዩኝ በይቅርታ
ስለ ድንግል ማርያም እስራቴን ፍታ /2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 2
ቸል በማለቴ የደምህን ዋጋ
ተመልሼ ገባሁ ከጥፋት መጋጋ
ሰላሜ ደፍርሶ ተቅበዝባዥ ሆኛለሁ
ስለ እናትህ ብለህ ማረኝ እልሃለሁ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 3
ስለ ድንግል ማርያም ማረኝ እልሃለሁ
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በከንቱ መሻቴ ስጋ ነብሴን ቀብሮ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 4
አቅም አጥቻለሁ አጥንቴ ተሰብሮ
ከበረዶ ይልቅ ነጭ እንድታደርገኝ
ስለ ድንግል ማርያም ከሀጥያቴ እጠበኝ
ስለ ድንግል ማርያም ምሬሃለሁ በለኝ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 5
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
ከንፈሮቼን ከፍተህ ልቁም ለምስጋና
አንተን የጋረደኝ ጣርያ ይነሳና

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 6
አልብሰኝ ፅድቅህን ይቅር መራቆቴ
ስል ድንግል ማርያም መልሰኝ ከቤቴ/2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም(2)

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ',
        lyrics_transliteration = 'CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 1
Yemhret aynochh yiyugn beyqrta
Sile Dingil Maryam esraten fita /2
Mirehalewu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 2
Chel bemalete yedemhn waga
Temelshe gebahu ket’fat megaga
Selame defrso teqbezbazh hognalehu
Sile enath bileh maregn elhalehu

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 3
Sile Dingil Maryam maregn elhalehu
Mirehalehu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem
Bekentu meshate siga nebsen qebro

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 4
Aqm at’chalehu at’nte tesebro
Keberedo yilq nech’ endtadergegn
Sile Dingil Maryam kehet’yate et’ebegn
Sile Dingil Maryam mirehalehu belegn

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 5
Mirehalehu belegn sile Dingil Maryam
Mihariw medhani alem yiqr bay endante yelem
Kenferochen kefteh liqum lemsgana
Anten yegaredegn t’arya yinesana

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 6
Albsegn ts’dqhn yiqr meraqote
Sil Dingil Maryam melsegn kebete/2
Mirehalewu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem (2)

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e',
        updated_at = clock_timestamp()::text
    WHERE import_id = '34b29d80-f518-4a26-8edd-07dfe60468fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 1
የምህረት አይኖችህ ይዩኝ በይቅርታ
ስለ ድንግል ማርያም እስራቴን ፍታ /2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 2
ቸል በማለቴ የደምህን ዋጋ
ተመልሼ ገባሁ ከጥፋት መጋጋ
ሰላሜ ደፍርሶ ተቅበዝባዥ ሆኛለሁ
ስለ እናትህ ብለህ ማረኝ እልሃለሁ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 3
ስለ ድንግል ማርያም ማረኝ እልሃለሁ
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በከንቱ መሻቴ ስጋ ነብሴን ቀብሮ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 4
አቅም አጥቻለሁ አጥንቴ ተሰብሮ
ከበረዶ ይልቅ ነጭ እንድታደርገኝ
ስለ ድንግል ማርያም ከሀጥያቴ እጠበኝ
ስለ ድንግል ማርያም ምሬሃለሁ በለኝ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 5
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
ከንፈሮቼን ከፍተህ ልቁም ለምስጋና
አንተን የጋረደኝ ጣርያ ይነሳና

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 6
አልብሰኝ ፅድቅህን ይቅር መራቆቴ
ስል ድንግል ማርያም መልሰኝ ከቤቴ/2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም(2)

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '34b29d80-f518-4a26-8edd-07dfe60468fc'::uuid, 'merehalew-belegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- in-that-very-hour ("In That Very Hour")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '31aa3dd7-6e14-471b-828b-4e4aac163021'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ

VERSE 1
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ

CHORUS
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata

VERSE 1
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata

CHORUS
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '31aa3dd7-6e14-471b-828b-4e4aac163021'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ

VERSE 1
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ

CHORUS
አቤት የዚያን ጊዜ ክርስቶስ ሲመጣ (2)
ትንሹም ትልቁም (3) መድረሻውን ሲያጣ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata

VERSE 1
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata

CHORUS
Abet yezian gize Kristos simeta (2)
Tinishum tilikum (3) medreshawn siyata';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '31aa3dd7-6e14-471b-828b-4e4aac163021'::uuid, 'in-that-very-hour', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- silemayineger-sitotaw ("Silemayineger Sitotaw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ed103926-17b7-4f9e-9a3d-d1c06aa07fe1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የህይወት እስትንፋስ ዘራብን ሕያው እንድንሆን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Yehywet estnfas zerabn hiyaw endnhon'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ed103926-17b7-4f9e-9a3d-d1c06aa07fe1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የህይወት እስትንፋስ ዘራብን ሕያው እንድንሆን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ed103926-17b7-4f9e-9a3d-d1c06aa07fe1'::uuid, 'silemayineger-sitotaw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wetibelo-yikwineni ("Wetibelo Yikwineni")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0ca168fa-7447-402c-b049-e1955697ccc7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬

VERSE 1
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬

CHORUS
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wetbelo yikuneni 2
Bekeme tibeleni yikuneni 4

VERSE 1
Wetbelo yikuneni 2
Bekeme tibeleni yikuneni 4

CHORUS
Wetbelo yikuneni 2
Bekeme tibeleni yikuneni 4'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬

VERSE 1
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬

CHORUS
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬',
        lyrics_transliteration = 'CHORUS
Wetbelo yikuneni 2
Bekeme tibeleni yikuneni 4

VERSE 1
Wetbelo yikuneni 2
Bekeme tibeleni yikuneni 4

CHORUS
Wetbelo yikuneni 2
Bekeme tibeleni yikuneni 4',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0ca168fa-7447-402c-b049-e1955697ccc7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬

VERSE 1
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬

CHORUS
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0ca168fa-7447-402c-b049-e1955697ccc7'::uuid, 'wetibelo-yikwineni', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- misgana-be-meqdesih ("Misgana be Meqdesih")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '342ffcd8-af8d-4e29-b7d2-34fa4a496b08'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 1
ሰገነት አይመቸኝ ካባዬ ክብር አይሆነኝ
ሁሉንም ንቄዋለው የአንተን ቤት መርጫለው (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 2
ያረጃል የዓለም ዝና ጥበብም ሆኖ መና
አንተ ግን ያው አንተ ነህ በሁሉ ትፀናለህ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 3
ከሰማይ በዓይንህ ታየው በፍቅርህ ተጎበኘው
በባሕሪህ ባለጸጋ ፈወስከኝ በደም ዋጋ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 4
ቃልህን ነፍሴ ሰምታ ተዋበች በእልልታ
ወደ እግርህ መረገጫ መስገዴ አለው ብልጫ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 1
Segenet ayimecheghe, kabaye kibr ayhoneneghe
Hulunim neqewalew, ye’anten bet merchalew (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 2
Yarejal yealem zina, tibebim hono mena
Ante gin yaw ante neh, behulu titsenaleh (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 3
Kesemay beayinhi tayewe, befikrih tegobeghew
Bebahrih baletṣega, feweskegh bedem waga (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 4
Qalihn nefse semta tewabetch bellilta
Wede egerih meregecha, mesgede alew bilcha (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 1
ሰገነት አይመቸኝ ካባዬ ክብር አይሆነኝ
ሁሉንም ንቄዋለው የአንተን ቤት መርጫለው (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 2
ያረጃል የዓለም ዝና ጥበብም ሆኖ መና
አንተ ግን ያው አንተ ነህ በሁሉ ትፀናለህ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 3
ከሰማይ በዓይንህ ታየው በፍቅርህ ተጎበኘው
በባሕሪህ ባለጸጋ ፈወስከኝ በደም ዋጋ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 4
ቃልህን ነፍሴ ሰምታ ተዋበች በእልልታ
ወደ እግርህ መረገጫ መስገዴ አለው ብልጫ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ',
        lyrics_transliteration = 'CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 1
Segenet ayimecheghe, kabaye kibr ayhoneneghe
Hulunim neqewalew, ye’anten bet merchalew (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 2
Yarejal yealem zina, tibebim hono mena
Ante gin yaw ante neh, behulu titsenaleh (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 3
Kesemay beayinhi tayewe, befikrih tegobeghew
Bebahrih baletṣega, feweskegh bedem waga (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 4
Qalihn nefse semta tewabetch bellilta
Wede egerih meregecha, mesgede alew bilcha (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '342ffcd8-af8d-4e29-b7d2-34fa4a496b08'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 1
ሰገነት አይመቸኝ ካባዬ ክብር አይሆነኝ
ሁሉንም ንቄዋለው የአንተን ቤት መርጫለው (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 2
ያረጃል የዓለም ዝና ጥበብም ሆኖ መና
አንተ ግን ያው አንተ ነህ በሁሉ ትፀናለህ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 3
ከሰማይ በዓይንህ ታየው በፍቅርህ ተጎበኘው
በባሕሪህ ባለጸጋ ፈወስከኝ በደም ዋጋ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 4
ቃልህን ነፍሴ ሰምታ ተዋበች በእልልታ
ወደ እግርህ መረገጫ መስገዴ አለው ብልጫ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 1
Segenet ayimecheghe, kabaye kibr ayhoneneghe
Hulunim neqewalew, ye’anten bet merchalew (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 2
Yarejal yealem zina, tibebim hono mena
Ante gin yaw ante neh, behulu titsenaleh (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 3
Kesemay beayinhi tayewe, befikrih tegobeghew
Bebahrih baletṣega, feweskegh bedem waga (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 4
Qalihn nefse semta tewabetch bellilta
Wede egerih meregecha, mesgede alew bilcha (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '342ffcd8-af8d-4e29-b7d2-34fa4a496b08'::uuid, 'misgana-be-meqdesih', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amlak-tekle-haymanot ("Amlak Tekle Haymanot")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '374249e3-6450-4afd-9c7b-3c5f53cce2d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 1
ስለ ቃል ኪዳንህ በቁጣህ አታጥፋን

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 2
ሃዋርያው ቅዱስ ተክለ ሀይማኖት
የእቲሳ አንበሳ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 3
ቁጣውን አብርደው ተክለሀይማኖት
በምልጃ ተነሳ የኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 4
ቁጣውን አብርደው ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 5
ከሰማይ ካህናት ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 6
የስላሴን መንበር ተክለሀይማኖት
ለማጠን በቅተሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 7
ከከርቤ ከሚአ ተክልሀይማኖት
ከሰሊክም በልጧል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 8
የጻድቁ ጸሎት ተክልሀይማኖት
በእግዚአብሔር ፊት ሸቷል

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 9
ስለቃልኪዳንህ ተክለሀይማኖት
አምላክ ይለመናል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 10
ጸሎት ሲደርስ ተክለሀይማኖት
እኛን ይታረቃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 11
ተማጽነንብሃል ተክለ ሃይማኖት
ጌታ ሆይ በስሙ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 12
በጻድቁ ጸሎት ተክለሀይማኖት
በሰባራ አጽሙ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 13
ኢትዮጵያን በሙሉ ተክለሀይማኖት
አስተምሮ ሲመለስ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 14
አጽመ ርስቱ ሆነቸህ ተክለሀይማኖት
ደብረ ሊባኖስ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 15
የጸድቁ መንፈስ ተክለሀይማኖት
ከቅዱሳን ጋራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 16
ከልባችን ገብተህ ተክለሀይማኖት
ብርሀንን አበራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 17
በጸሎት ስቁም ተክለሀይማኖት
ስምህን ስጠራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 18
ነፍሴ ተደሰተች ተክለሀይማኖት
ሲርቀኝ መከራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 1
Sile qal kidanih bequt’ah atat’fan

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 2
Hawariyaw Kidus Tekle Haymanot
Ye’itisa anbessa yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 3
Qut’awn abriddew Tekle Haymanot
Bemilija tenesa yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 4
Qut’awn abriddew Tekle Haymanot
Beteseb honehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 5
Kesemay kahnat Tekle Haymanot
Beteseb honehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 6
Yesilase menber Tekle Haymanot
Lematon beqtehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 7
Kekerbe kemia Tekle Haymanot
Keselikim bel’twal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 8
Yetsadiku tselot Tekle Haymanot
BeEgziabher fit shetwal

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 9
Sile qal kidanih Tekle Haymanot
Amlak yilemenal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 10
Tselot sidires Tekle Haymanot
Enyan yitarekal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 11
Tematsnenbihal Tekle Haymanot
Geta hoy besimih yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 12
Betsadiku tselot Tekle Haymanot
Besebara atsmu yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 13
Ityopiyan bemulu Tekle Haymanot
Astemro simeles yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 14
Atsme ristu honetch Tekle Haymanot
Debre Libanos yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 15
Yetsadiku menfes Tekle Haymanot
Kekidusan gara yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 16
Kelbachin gebteh Tekle Haymanot
Birhanen abera yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 17
Beteslot sik’um Tekle Haymanot
Simihn sit’era yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 18
Nefsé tedesetech Tekle Haymanot
Sir’qegn mekara yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 1
ስለ ቃል ኪዳንህ በቁጣህ አታጥፋን

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 2
ሃዋርያው ቅዱስ ተክለ ሀይማኖት
የእቲሳ አንበሳ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 3
ቁጣውን አብርደው ተክለሀይማኖት
በምልጃ ተነሳ የኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 4
ቁጣውን አብርደው ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 5
ከሰማይ ካህናት ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 6
የስላሴን መንበር ተክለሀይማኖት
ለማጠን በቅተሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 7
ከከርቤ ከሚአ ተክልሀይማኖት
ከሰሊክም በልጧል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 8
የጻድቁ ጸሎት ተክልሀይማኖት
በእግዚአብሔር ፊት ሸቷል

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 9
ስለቃልኪዳንህ ተክለሀይማኖት
አምላክ ይለመናል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 10
ጸሎት ሲደርስ ተክለሀይማኖት
እኛን ይታረቃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 11
ተማጽነንብሃል ተክለ ሃይማኖት
ጌታ ሆይ በስሙ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 12
በጻድቁ ጸሎት ተክለሀይማኖት
በሰባራ አጽሙ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 13
ኢትዮጵያን በሙሉ ተክለሀይማኖት
አስተምሮ ሲመለስ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 14
አጽመ ርስቱ ሆነቸህ ተክለሀይማኖት
ደብረ ሊባኖስ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 15
የጸድቁ መንፈስ ተክለሀይማኖት
ከቅዱሳን ጋራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 16
ከልባችን ገብተህ ተክለሀይማኖት
ብርሀንን አበራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 17
በጸሎት ስቁም ተክለሀይማኖት
ስምህን ስጠራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 18
ነፍሴ ተደሰተች ተክለሀይማኖት
ሲርቀኝ መከራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)',
        lyrics_transliteration = 'CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 1
Sile qal kidanih bequt’ah atat’fan

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 2
Hawariyaw Kidus Tekle Haymanot
Ye’itisa anbessa yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 3
Qut’awn abriddew Tekle Haymanot
Bemilija tenesa yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 4
Qut’awn abriddew Tekle Haymanot
Beteseb honehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 5
Kesemay kahnat Tekle Haymanot
Beteseb honehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 6
Yesilase menber Tekle Haymanot
Lematon beqtehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 7
Kekerbe kemia Tekle Haymanot
Keselikim bel’twal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 8
Yetsadiku tselot Tekle Haymanot
BeEgziabher fit shetwal

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 9
Sile qal kidanih Tekle Haymanot
Amlak yilemenal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 10
Tselot sidires Tekle Haymanot
Enyan yitarekal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 11
Tematsnenbihal Tekle Haymanot
Geta hoy besimih yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 12
Betsadiku tselot Tekle Haymanot
Besebara atsmu yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 13
Ityopiyan bemulu Tekle Haymanot
Astemro simeles yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 14
Atsme ristu honetch Tekle Haymanot
Debre Libanos yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 15
Yetsadiku menfes Tekle Haymanot
Kekidusan gara yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 16
Kelbachin gebteh Tekle Haymanot
Birhanen abera yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 17
Beteslot sik’um Tekle Haymanot
Simihn sit’era yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 18
Nefsé tedesetech Tekle Haymanot
Sir’qegn mekara yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '374249e3-6450-4afd-9c7b-3c5f53cce2d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 1
ስለ ቃል ኪዳንህ በቁጣህ አታጥፋን

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 2
ሃዋርያው ቅዱስ ተክለ ሀይማኖት
የእቲሳ አንበሳ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 3
ቁጣውን አብርደው ተክለሀይማኖት
በምልጃ ተነሳ የኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 4
ቁጣውን አብርደው ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 5
ከሰማይ ካህናት ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 6
የስላሴን መንበር ተክለሀይማኖት
ለማጠን በቅተሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 7
ከከርቤ ከሚአ ተክልሀይማኖት
ከሰሊክም በልጧል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 8
የጻድቁ ጸሎት ተክልሀይማኖት
በእግዚአብሔር ፊት ሸቷል

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 9
ስለቃልኪዳንህ ተክለሀይማኖት
አምላክ ይለመናል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 10
ጸሎት ሲደርስ ተክለሀይማኖት
እኛን ይታረቃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 11
ተማጽነንብሃል ተክለ ሃይማኖት
ጌታ ሆይ በስሙ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 12
በጻድቁ ጸሎት ተክለሀይማኖት
በሰባራ አጽሙ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 13
ኢትዮጵያን በሙሉ ተክለሀይማኖት
አስተምሮ ሲመለስ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 14
አጽመ ርስቱ ሆነቸህ ተክለሀይማኖት
ደብረ ሊባኖስ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 15
የጸድቁ መንፈስ ተክለሀይማኖት
ከቅዱሳን ጋራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 16
ከልባችን ገብተህ ተክለሀይማኖት
ብርሀንን አበራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 17
በጸሎት ስቁም ተክለሀይማኖት
ስምህን ስጠራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 18
ነፍሴ ተደሰተች ተክለሀይማኖት
ሲርቀኝ መከራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 1
Sile qal kidanih bequt’ah atat’fan

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 2
Hawariyaw Kidus Tekle Haymanot
Ye’itisa anbessa yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 3
Qut’awn abriddew Tekle Haymanot
Bemilija tenesa yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 4
Qut’awn abriddew Tekle Haymanot
Beteseb honehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 5
Kesemay kahnat Tekle Haymanot
Beteseb honehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 6
Yesilase menber Tekle Haymanot
Lematon beqtehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 7
Kekerbe kemia Tekle Haymanot
Keselikim bel’twal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 8
Yetsadiku tselot Tekle Haymanot
BeEgziabher fit shetwal

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 9
Sile qal kidanih Tekle Haymanot
Amlak yilemenal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 10
Tselot sidires Tekle Haymanot
Enyan yitarekal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 11
Tematsnenbihal Tekle Haymanot
Geta hoy besimih yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 12
Betsadiku tselot Tekle Haymanot
Besebara atsmu yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 13
Ityopiyan bemulu Tekle Haymanot
Astemro simeles yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 14
Atsme ristu honetch Tekle Haymanot
Debre Libanos yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 15
Yetsadiku menfes Tekle Haymanot
Kekidusan gara yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 16
Kelbachin gebteh Tekle Haymanot
Birhanen abera yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 17
Beteslot sik’um Tekle Haymanot
Simihn sit’era yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 18
Nefsé tedesetech Tekle Haymanot
Sir’qegn mekara yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '374249e3-6450-4afd-9c7b-3c5f53cce2d5'::uuid, 'amlak-tekle-haymanot', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- michael-wedaje-zemarit-betselot-asmare ("Michael Wedaje Zemarit Betselot Asmare")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2aa5c77d-5876-49ed-8f62-dd41ae2c6ada'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 1
የልቤን የነገርኩት
ቀርቤ ያማከርኩት
የፈታው ቋጠሮዬን
ያቃና ጎዳናዬን

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 2
ሚካኤል ወደጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 3
ታምኜ የምጠራው
እንባዬን ከአይኔ ያበሰው
ያስመለጠኝ ከክፉ
የጋረደኝ በክንፉ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 4
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 5
ያፅናናኝ ከሃዘኔ
ያገዘኝ ሆኖ ጎኔ
መሻቴን የፈፀመ
ጠላቴን ያደከመ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 6
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 7
ጉልበቴን ያበረታ
ያማለደኝ ከጌታ
የመራኝ ከፊት ቀድሞ
ያከበረኝ ሸልሞ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 8
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 1
Yelben yenegerkut
Qerbe yamakerkut
Yefetaw qwat’eroyen
Yaqana godanayen

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 2
Mikael wedeje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 3
Tamgne yemt’eraw
Enbayen keayne yabesew
Yasmelet’egn kekfu
Yegaredegn beknfu

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 4
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 5
Yats’nanagn kehazene
Yagezegn hono gone
Meshaten yefets’eme
T’elaten yadekeme

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 6
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 7
Gulbeten yabereta
Yamaledegn kegeta
Yemeragn kefit qedmo
Yakeberegn shelmo

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 8
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 1
የልቤን የነገርኩት
ቀርቤ ያማከርኩት
የፈታው ቋጠሮዬን
ያቃና ጎዳናዬን

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 2
ሚካኤል ወደጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 3
ታምኜ የምጠራው
እንባዬን ከአይኔ ያበሰው
ያስመለጠኝ ከክፉ
የጋረደኝ በክንፉ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 4
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 5
ያፅናናኝ ከሃዘኔ
ያገዘኝ ሆኖ ጎኔ
መሻቴን የፈፀመ
ጠላቴን ያደከመ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 6
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 7
ጉልበቴን ያበረታ
ያማለደኝ ከጌታ
የመራኝ ከፊት ቀድሞ
ያከበረኝ ሸልሞ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 8
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው',
        lyrics_transliteration = 'CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 1
Yelben yenegerkut
Qerbe yamakerkut
Yefetaw qwat’eroyen
Yaqana godanayen

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 2
Mikael wedeje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 3
Tamgne yemt’eraw
Enbayen keayne yabesew
Yasmelet’egn kekfu
Yegaredegn beknfu

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 4
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 5
Yats’nanagn kehazene
Yagezegn hono gone
Meshaten yefets’eme
T’elaten yadekeme

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 6
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 7
Gulbeten yabereta
Yamaledegn kegeta
Yemeragn kefit qedmo
Yakeberegn shelmo

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 8
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2aa5c77d-5876-49ed-8f62-dd41ae2c6ada'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 1
የልቤን የነገርኩት
ቀርቤ ያማከርኩት
የፈታው ቋጠሮዬን
ያቃና ጎዳናዬን

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 2
ሚካኤል ወደጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 3
ታምኜ የምጠራው
እንባዬን ከአይኔ ያበሰው
ያስመለጠኝ ከክፉ
የጋረደኝ በክንፉ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 4
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 5
ያፅናናኝ ከሃዘኔ
ያገዘኝ ሆኖ ጎኔ
መሻቴን የፈፀመ
ጠላቴን ያደከመ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 6
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 7
ጉልበቴን ያበረታ
ያማለደኝ ከጌታ
የመራኝ ከፊት ቀድሞ
ያከበረኝ ሸልሞ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 8
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2aa5c77d-5876-49ed-8f62-dd41ae2c6ada'::uuid, 'michael-wedaje-zemarit-betselot-asmare', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fekade-yih-new ("Fekade Yih New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '385af9d5-8b02-4af7-a324-92709400a9fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 1
ህይወቴ በሙሉ በሀጢአት ተመልታ
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሶሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ፀሎት ትቼ
የመዳኑ ሰአት አለፉ ቀኖቼ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 4
ተቆጥሮ የማያልቅ በደሌ ተከድኖ
በሞትና በደም ሀጥያቴን ሸፍኖ
ሰው አርጎኝ በሰው ፊት አቁሞኝ ጌታዬ
በማንም አልፈርድም ሀጥያተኛ ብዬ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 1
Heywete bemulu behatiyat temelta
Amlake kemaregn befekru zemta
Yesew bedel lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 2
Bayne fit tegarido yalewin mesoso
Eyaye kalefegn bemihret tageso
Yesew gudf lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 3
Ante qerachu sew yaleh aqerqereh
Bemihret temelesk kene yilq deneh
Bante lay sitequm yenen tselot teche
Yemedanu seat alefu qenoche (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 4
Teqotero yemayalq bedele teqedeno
Bemotina bedem hatiaten shefeno
Sew argogn besew fit aqumogn Getaye
Bemanm alferdim hatiategna beye (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 1
ህይወቴ በሙሉ በሀጢአት ተመልታ
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሶሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ፀሎት ትቼ
የመዳኑ ሰአት አለፉ ቀኖቼ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 4
ተቆጥሮ የማያልቅ በደሌ ተከድኖ
በሞትና በደም ሀጥያቴን ሸፍኖ
ሰው አርጎኝ በሰው ፊት አቁሞኝ ጌታዬ
በማንም አልፈርድም ሀጥያተኛ ብዬ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር',
        lyrics_transliteration = 'CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 1
Heywete bemulu behatiyat temelta
Amlake kemaregn befekru zemta
Yesew bedel lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 2
Bayne fit tegarido yalewin mesoso
Eyaye kalefegn bemihret tageso
Yesew gudf lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 3
Ante qerachu sew yaleh aqerqereh
Bemihret temelesk kene yilq deneh
Bante lay sitequm yenen tselot teche
Yemedanu seat alefu qenoche (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 4
Teqotero yemayalq bedele teqedeno
Bemotina bedem hatiaten shefeno
Sew argogn besew fit aqumogn Getaye
Bemanm alferdim hatiategna beye (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager',
        updated_at = clock_timestamp()::text
    WHERE import_id = '385af9d5-8b02-4af7-a324-92709400a9fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 1
ህይወቴ በሙሉ በሀጢአት ተመልታ
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሶሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ፀሎት ትቼ
የመዳኑ ሰአት አለፉ ቀኖቼ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 4
ተቆጥሮ የማያልቅ በደሌ ተከድኖ
በሞትና በደም ሀጥያቴን ሸፍኖ
ሰው አርጎኝ በሰው ፊት አቁሞኝ ጌታዬ
በማንም አልፈርድም ሀጥያተኛ ብዬ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 1
Heywete bemulu behatiyat temelta
Amlake kemaregn befekru zemta
Yesew bedel lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 2
Bayne fit tegarido yalewin mesoso
Eyaye kalefegn bemihret tageso
Yesew gudf lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 3
Ante qerachu sew yaleh aqerqereh
Bemihret temelesk kene yilq deneh
Bante lay sitequm yenen tselot teche
Yemedanu seat alefu qenoche (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 4
Teqotero yemayalq bedele teqedeno
Bemotina bedem hatiaten shefeno
Sew argogn besew fit aqumogn Getaye
Bemanm alferdim hatiategna beye (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '385af9d5-8b02-4af7-a324-92709400a9fc'::uuid, 'fekade-yih-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bale-wuletaye ("Bale Wuletaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '44c07430-b3b9-4d1f-b6d8-0e036dd873d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 1
በሩን ቢዘጋብኝ ስምዖን ጨክኖ
ዝቅ አደርጎ ቢያየኝ ከአይሁድ ጋር ሆኖ
እንድቀርብ ወደ እርሱ አዘዘኝ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድ ወርድ ከዛፉ አዘዘኝ ጌታዬ
መዓረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በኢየሱስ ክርስቶስ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ኃጢአትም በእነርሱ
በሠላም ሂድ ብሎ ምሮኛል ንጉሱ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 4
የማምነውም አምላክ አውቀዋለሁ እኔ
በሰራልኝ ሥራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤ ትከሻ
ልለየው አልችልም እስከ መጨረሻ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 1
Berun bizege-bi-gn Simon chekno
Ziq adergo biyaye-gn ke-Ayihud gara honno
Indiqerib wede irsu azzez-egn Getaye
Igrun atbewalehu wedqie be-inbaye (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 2
Ye-qerach aleqa bihonim siraye
Indiwerd ke-zafu azzez-egn Getaye
Ma''eregien meshekem iskiyaktie dres
Bete tebareke be-Iyesus Kristos (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 3
Dingay ye-chebetu ferajoch kebewign
Newrien zerzerew Geta fit aqumugn
Feredech-bachew hatiat-m be-inersu
Be-selam hid bilo mirognal Nigusu (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 4
Yemamnewm Amlak awqewalehu inie
Be-serallign sira be-idmie be-zemene
Fikrun teshekmuwal ye-libie tikesha
Lileyew alchilum iske mecheresha (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 1
በሩን ቢዘጋብኝ ስምዖን ጨክኖ
ዝቅ አደርጎ ቢያየኝ ከአይሁድ ጋር ሆኖ
እንድቀርብ ወደ እርሱ አዘዘኝ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድ ወርድ ከዛፉ አዘዘኝ ጌታዬ
መዓረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በኢየሱስ ክርስቶስ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ኃጢአትም በእነርሱ
በሠላም ሂድ ብሎ ምሮኛል ንጉሱ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 4
የማምነውም አምላክ አውቀዋለሁ እኔ
በሰራልኝ ሥራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤ ትከሻ
ልለየው አልችልም እስከ መጨረሻ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ',
        lyrics_transliteration = 'CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 1
Berun bizege-bi-gn Simon chekno
Ziq adergo biyaye-gn ke-Ayihud gara honno
Indiqerib wede irsu azzez-egn Getaye
Igrun atbewalehu wedqie be-inbaye (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 2
Ye-qerach aleqa bihonim siraye
Indiwerd ke-zafu azzez-egn Getaye
Ma''eregien meshekem iskiyaktie dres
Bete tebareke be-Iyesus Kristos (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 3
Dingay ye-chebetu ferajoch kebewign
Newrien zerzerew Geta fit aqumugn
Feredech-bachew hatiat-m be-inersu
Be-selam hid bilo mirognal Nigusu (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 4
Yemamnewm Amlak awqewalehu inie
Be-serallign sira be-idmie be-zemene
Fikrun teshekmuwal ye-libie tikesha
Lileyew alchilum iske mecheresha (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '44c07430-b3b9-4d1f-b6d8-0e036dd873d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 1
በሩን ቢዘጋብኝ ስምዖን ጨክኖ
ዝቅ አደርጎ ቢያየኝ ከአይሁድ ጋር ሆኖ
እንድቀርብ ወደ እርሱ አዘዘኝ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድ ወርድ ከዛፉ አዘዘኝ ጌታዬ
መዓረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በኢየሱስ ክርስቶስ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ኃጢአትም በእነርሱ
በሠላም ሂድ ብሎ ምሮኛል ንጉሱ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 4
የማምነውም አምላክ አውቀዋለሁ እኔ
በሰራልኝ ሥራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤ ትከሻ
ልለየው አልችልም እስከ መጨረሻ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 1
Berun bizege-bi-gn Simon chekno
Ziq adergo biyaye-gn ke-Ayihud gara honno
Indiqerib wede irsu azzez-egn Getaye
Igrun atbewalehu wedqie be-inbaye (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 2
Ye-qerach aleqa bihonim siraye
Indiwerd ke-zafu azzez-egn Getaye
Ma''eregien meshekem iskiyaktie dres
Bete tebareke be-Iyesus Kristos (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 3
Dingay ye-chebetu ferajoch kebewign
Newrien zerzerew Geta fit aqumugn
Feredech-bachew hatiat-m be-inersu
Be-selam hid bilo mirognal Nigusu (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 4
Yemamnewm Amlak awqewalehu inie
Be-serallign sira be-idmie be-zemene
Fikrun teshekmuwal ye-libie tikesha
Lileyew alchilum iske mecheresha (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '44c07430-b3b9-4d1f-b6d8-0e036dd873d5'::uuid, 'bale-wuletaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- rufael-abate ("Rufael Abate")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2f0bb4a7-c18e-410a-b0be-a6543382ee39'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 1
አይኔን አብርትህ ሩፋኤል
ሰው ልታርገኝ
በእናቴ ማህፀን ጠብቀህ
ዛሬን አየሁኝ

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 2
አሰማንድዮስን አስረከው ተረፍኩኝ ከሞት
እዘምራልሁ ለክብርህ ቀንና ሌሊት
ናልኝ ሩፋኤል አባቴ
ና መዳኒት

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 3
ናልኝ መልእኩ በስህል
የአምላክ ባለሟል

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 1
Aynen abrth Rufael
Sew litargegn
Beenate mahts’en t’ebqeh
Zaren ayehugn

CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 2
Asemandyosn asrekew terefkugn kemot
Ezemralhu lekbrh qenna lelit
Nalgn Rufael abate
Na medanit

CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 3
Nalgn meleku beshl
Yeamlak balemwal

CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 1
አይኔን አብርትህ ሩፋኤል
ሰው ልታርገኝ
በእናቴ ማህፀን ጠብቀህ
ዛሬን አየሁኝ

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 2
አሰማንድዮስን አስረከው ተረፍኩኝ ከሞት
እዘምራልሁ ለክብርህ ቀንና ሌሊት
ናልኝ ሩፋኤል አባቴ
ና መዳኒት

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 3
ናልኝ መልእኩ በስህል
የአምላክ ባለሟል

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}',
        lyrics_transliteration = 'CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 1
Aynen abrth Rufael
Sew litargegn
Beenate mahts’en t’ebqeh
Zaren ayehugn

CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 2
Asemandyosn asrekew terefkugn kemot
Ezemralhu lekbrh qenna lelit
Nalgn Rufael abate
Na medanit

CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 3
Nalgn meleku beshl
Yeamlak balemwal

CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2f0bb4a7-c18e-410a-b0be-a6543382ee39'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 1
አይኔን አብርትህ ሩፋኤል
ሰው ልታርገኝ
በእናቴ ማህፀን ጠብቀህ
ዛሬን አየሁኝ

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 2
አሰማንድዮስን አስረከው ተረፍኩኝ ከሞት
እዘምራልሁ ለክብርህ ቀንና ሌሊት
ናልኝ ሩፋኤል አባቴ
ና መዳኒት

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 3
ናልኝ መልእኩ በስህል
የአምላክ ባለሟል

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2f0bb4a7-c18e-410a-b0be-a6543382ee39'::uuid, 'rufael-abate', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- alete-neh-anbaye ("Alete Neh Anbaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3026fa64-2480-4dae-8084-ad25419e407e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 1
እንደ ወጣ ይቅር አትበለኝ
በንስሀ ቤትህ ምልሰኝ
በመቅደስህ ዓለት አቁመኝ
ማዕበልና ንፋስ ሳይነቅለኝ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 2
የነገን አላውቅም እጣዬን
በቤትህ ጸንቼ መኖሬን
አላምነውምና ክፉ ልቤን
ስፈራው እኖራለሁ የመጪውን

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 3
አልመካም እኔ እፈራለሁ
ወድቆ ስላየሁኝ የቆመው ሰው
ባልተሰበረ ልብ በመኖሬ
መቆሜን አላውቅም እስከዛሬ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 4
በወደቀው ጨክኜ ፈርጄ
የደካማው በደል አለ በጄ
ማንም ስላልሾመኝ ፈራጅ አድርጎ
ልቤን መልስልኝ ወደ በጎ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 1
Ende weta yikir atbeleng
Benis’ha betih melseng
Bemeqdesih alet aqumeng
Ma’ebalna nifas sayneqelgn

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 2
Yenegen alawikm it’ayen
Betih ts’enche menorén
Alamnewmna kifu libén
Siferaw enoralew yemetchiwn

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 3
Almekam ene iferalew
Wedqo silayehugn yeqome sew
Baltesebere lib bemenoré
Meqomen alawikm eskizare

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 4
Bewedekew chekigne ferjé
Yedekamaw bedel ale bejé
Manim silalshomegn feraj adrgo
Libén melsilgn wede bego

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 1
እንደ ወጣ ይቅር አትበለኝ
በንስሀ ቤትህ ምልሰኝ
በመቅደስህ ዓለት አቁመኝ
ማዕበልና ንፋስ ሳይነቅለኝ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 2
የነገን አላውቅም እጣዬን
በቤትህ ጸንቼ መኖሬን
አላምነውምና ክፉ ልቤን
ስፈራው እኖራለሁ የመጪውን

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 3
አልመካም እኔ እፈራለሁ
ወድቆ ስላየሁኝ የቆመው ሰው
ባልተሰበረ ልብ በመኖሬ
መቆሜን አላውቅም እስከዛሬ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 4
በወደቀው ጨክኜ ፈርጄ
የደካማው በደል አለ በጄ
ማንም ስላልሾመኝ ፈራጅ አድርጎ
ልቤን መልስልኝ ወደ በጎ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/',
        lyrics_transliteration = 'CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 1
Ende weta yikir atbeleng
Benis’ha betih melseng
Bemeqdesih alet aqumeng
Ma’ebalna nifas sayneqelgn

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 2
Yenegen alawikm it’ayen
Betih ts’enche menorén
Alamnewmna kifu libén
Siferaw enoralew yemetchiwn

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 3
Almekam ene iferalew
Wedqo silayehugn yeqome sew
Baltesebere lib bemenoré
Meqomen alawikm eskizare

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 4
Bewedekew chekigne ferjé
Yedekamaw bedel ale bejé
Manim silalshomegn feraj adrgo
Libén melsilgn wede bego

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3026fa64-2480-4dae-8084-ad25419e407e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 1
እንደ ወጣ ይቅር አትበለኝ
በንስሀ ቤትህ ምልሰኝ
በመቅደስህ ዓለት አቁመኝ
ማዕበልና ንፋስ ሳይነቅለኝ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 2
የነገን አላውቅም እጣዬን
በቤትህ ጸንቼ መኖሬን
አላምነውምና ክፉ ልቤን
ስፈራው እኖራለሁ የመጪውን

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 3
አልመካም እኔ እፈራለሁ
ወድቆ ስላየሁኝ የቆመው ሰው
ባልተሰበረ ልብ በመኖሬ
መቆሜን አላውቅም እስከዛሬ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 4
በወደቀው ጨክኜ ፈርጄ
የደካማው በደል አለ በጄ
ማንም ስላልሾመኝ ፈራጅ አድርጎ
ልቤን መልስልኝ ወደ በጎ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 1
Ende weta yikir atbeleng
Benis’ha betih melseng
Bemeqdesih alet aqumeng
Ma’ebalna nifas sayneqelgn

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 2
Yenegen alawikm it’ayen
Betih ts’enche menorén
Alamnewmna kifu libén
Siferaw enoralew yemetchiwn

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 3
Almekam ene iferalew
Wedqo silayehugn yeqome sew
Baltesebere lib bemenoré
Meqomen alawikm eskizare

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 4
Bewedekew chekigne ferjé
Yedekamaw bedel ale bejé
Manim silalshomegn feraj adrgo
Libén melsilgn wede bego

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3026fa64-2480-4dae-8084-ad25419e407e'::uuid, 'alete-neh-anbaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tinsaeke-leile-amene ("Tinsa'eke Le'ile Amene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '386c7b0b-6533-4dcc-a2f2-1202e0c7ae59'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/

VERSE 1
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/

CHORUS
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/

VERSE 1
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/

CHORUS
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '386c7b0b-6533-4dcc-a2f2-1202e0c7ae59'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/

VERSE 1
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/

CHORUS
ትንሳኤከ ለእለ አመነ
ብርሃነከ ፈኑ ዲቤነ /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/

VERSE 1
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/

CHORUS
Tinsa''eke le''ile amene
Birhaneke fenu dibene /2/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '386c7b0b-6533-4dcc-a2f2-1202e0c7ae59'::uuid, 'tinsaeke-leile-amene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- di-n-zemari-behayilu-tebeje-adis-yeemebetachin-zimare-yeewinet-mena ("Di/n Zemari Behayilu Tebeje Adis Yeemebetachin Zimare Yeewinet Mena")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '39eff746-2760-4109-981a-8275ef009c08'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አዝ',
        lyrics_transliteration = 'CHORUS
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
CHORUS',
        updated_at = clock_timestamp()::text
    WHERE import_id = '39eff746-2760-4109-981a-8275ef009c08'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ🌻🌻🌻🌻🌻
መሶበ ወርቅና መጋረጃ ሰፍታ
እንጨቱንም ሰብራ ውሃውንም ቀድታ
የጌታ አገልጋይ ልጅ እንዲሰጠን
ስለት እንግባ አሉ ሐና ና እያቄም(❷)
አዝ🌻🌻🌻🌻🌻
ሰንጥቃ ስትመጣ ሰባቱን ሰማያት
ተገልጦለት በራእይ እያቂምም አያት
በሐና እራስ ላይ ስታርፍ በክብር
በማህጸን ጸንሳት በሆዷ ስታድር(❷)
አዝ🌻🌻🌻🌻🌻
በማህጸን ሳለች ስታደርግ ታምር
አይሁድ ተመቅኝተው እንዲህ ይሉ ነበረ
ሰማንያ ዓመት ገዙ ዳዊት ሰለሞን
ከእርሷ የሚወለደው ከቶ ምን ሊሆን(❷)
አዝ🌻🌻🌻🌻🌻
ቀድማ የተዘጋጀች በህሌና አምላክ
መመረጧ ይደንቃል ይህንን ስናስብ
ተወለደች ማርያም ከሐናና እያቄም
ደግሞ እናት ልትሆነው ለመድኃኔዓለም(❷)
አዝ🌻🌻🌻🌻🌻
ሆዷ ዘመድ ሳይወድ አፏ እህል ሳይፈልግ
ለጌታ ሰጥተናት በመቅደሱ ትደግ
ድንግልን አስገቧት በሶስት ዓመቷ
ቤተ እግዚብሔር ወስደው እናትና አባቷ(❷)
አዝ🌻🌻🌻🌻🌻
ካህኑ ዘካርያስ ስለምግቧ አስቦ
ምጥቅድሙ መጣ ህዝቡንም ሰብስቦ
ቅዱስ ፈኑኤልም ከሰማያት ወርዶ
ሲመግባት ታየ በክንፎቹ ጋርዶ(❷)

VERSE 1
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ🌻🌻🌻🌻🌻
መሶበ ወርቅና መጋረጃ ሰፍታ
እንጨቱንም ሰብራ ውሃውንም ቀድታ
የጌታ አገልጋይ ልጅ እንዲሰጠን
ስለት እንግባ አሉ ሐና ና እያቄም(❷)
አዝ🌻🌻🌻🌻🌻
ሰንጥቃ ስትመጣ ሰባቱን ሰማያት
ተገልጦለት በራእይ እያቂምም አያት
በሐና እራስ ላይ ስታርፍ በክብር
በማህጸን ጸንሳት በሆዷ ስታድር(❷)
አዝ🌻🌻🌻🌻🌻
በማህጸን ሳለች ስታደርግ ታምር
አይሁድ ተመቅኝተው እንዲህ ይሉ ነበረ
ሰማንያ ዓመት ገዙ ዳዊት ሰለሞን
ከእርሷ የሚወለደው ከቶ ምን ሊሆን(❷)
አዝ🌻🌻🌻🌻🌻
ቀድማ የተዘጋጀች በህሌና አምላክ
መመረጧ ይደንቃል ይህንን ስናስብ
ተወለደች ማርያም ከሐናና እያቄም
ደግሞ እናት ልትሆነው ለመድኃኔዓለም(❷)
አዝ🌻🌻🌻🌻🌻
ሆዷ ዘመድ ሳይወድ አፏ እህል ሳይፈልግ
ለጌታ ሰጥተናት በመቅደሱ ትደግ
ድንግልን አስገቧት በሶስት ዓመቷ
ቤተ እግዚብሔር ወስደው እናትና አባቷ(❷)
አዝ🌻🌻🌻🌻🌻
ካህኑ ዘካርያስ ስለምግቧ አስቦ
ምጥቅድሙ መጣ ህዝቡንም ሰብስቦ
ቅዱስ ፈኑኤልም ከሰማያት ወርዶ
ሲመግባት ታየ በክንፎቹ ጋርዶ(❷)

CHORUS
የእውነት መና ያለብሽ(❷ የወርቅ መሶብ
ፍሬሽን በላን ድንግል ፍሬሽን በላን ማርያም
የህይወትን ምግብ
አዝ🌻🌻🌻🌻🌻
መሶበ ወርቅና መጋረጃ ሰፍታ
እንጨቱንም ሰብራ ውሃውንም ቀድታ
የጌታ አገልጋይ ልጅ እንዲሰጠን
ስለት እንግባ አሉ ሐና ና እያቄም(❷)
አዝ🌻🌻🌻🌻🌻
ሰንጥቃ ስትመጣ ሰባቱን ሰማያት
ተገልጦለት በራእይ እያቂምም አያት
በሐና እራስ ላይ ስታርፍ በክብር
በማህጸን ጸንሳት በሆዷ ስታድር(❷)
አዝ🌻🌻🌻🌻🌻
በማህጸን ሳለች ስታደርግ ታምር
አይሁድ ተመቅኝተው እንዲህ ይሉ ነበረ
ሰማንያ ዓመት ገዙ ዳዊት ሰለሞን
ከእርሷ የሚወለደው ከቶ ምን ሊሆን(❷)
አዝ🌻🌻🌻🌻🌻
ቀድማ የተዘጋጀች በህሌና አምላክ
መመረጧ ይደንቃል ይህንን ስናስብ
ተወለደች ማርያም ከሐናና እያቄም
ደግሞ እናት ልትሆነው ለመድኃኔዓለም(❷)
አዝ🌻🌻🌻🌻🌻
ሆዷ ዘመድ ሳይወድ አፏ እህል ሳይፈልግ
ለጌታ ሰጥተናት በመቅደሱ ትደግ
ድንግልን አስገቧት በሶስት ዓመቷ
ቤተ እግዚብሔር ወስደው እናትና አባቷ(❷)
አዝ🌻🌻🌻🌻🌻
ካህኑ ዘካርያስ ስለምግቧ አስቦ
ምጥቅድሙ መጣ ህዝቡንም ሰብስቦ
ቅዱስ ፈኑኤልም ከሰማያት ወርዶ
ሲመግባት ታየ በክንፎቹ ጋርዶ(❷)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '39eff746-2760-4109-981a-8275ef009c08'::uuid, 'di-n-zemari-behayilu-tebeje-adis-yeemebetachin-zimare-yeewinet-mena', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidane-mihiret ("Kidane Mihiret")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '36d5fe30-df53-4c53-86a4-e24318aad7b6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የኪዳን የእርቅ መዝገብ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Yekidan yeerq mezgeb'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '36d5fe30-df53-4c53-86a4-e24318aad7b6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የኪዳን የእርቅ መዝገብ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '36d5fe30-df53-4c53-86a4-e24318aad7b6'::uuid, 'kidane-mihiret', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selame-banite-new ("Selame Banite New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3929ab35-e770-4fc1-9b64-e6a29c2c73fb'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '3929ab35-e770-4fc1-9b64-e6a29c2c73fb'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3929ab35-e770-4fc1-9b64-e6a29c2c73fb'::uuid, 'selame-banite-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- by-d-teame-segid ("By D. Teame Segid")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4280f981-92de-45e8-80a9-bcb105533bd0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 1
ከይሲ ኣብ ሥጋ ተመን ኃዲሩ ''ንተ ኣስሓተና
አምላክ ሥጋ ማርያም ለቢሱ ካብ ሞት ኣድኂኑና
ሰሪ በደል ሔዋን ዝተዓጽወት ገነት
ብዳግማዊት ሔዋን ዳግማይ ተኸፍተት

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 2
አምላክ ዘርኣየትኒ ብሥጋ ወሊዳ
ዓይነይ ''ንተ በልክዋስ ዓይኒ ''ኳ ክውሕዳ
ኣኽሊል ትምክሕተይ''ያ ጀማሪት ድኅነተይ
ምኽንያት ኣለዎ ''ንተ ወደሳ ልበይ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 3
ኣዝ
ኃጢኣት ብምብዝሑ እምብዛ ብኢሱ
ጸጋ እግዚአብሔር ኣባና ፈሲሱ
ሔዋን ብበደላ ቃል መርገም ምስ ሰምዐት

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 4
ማርያም ብንጽሕናኣ ቃል ምድኃን ተበሥረት
ሥጋን ደምን ጎይታይ ቀዳሲ ሕይወተይ
ካብ ጽዮን ፈልፊሉ ኲሉ በረኸተይ
ምእንቲ''ዚ''የ''ኮ ነናሻዕ ዘፍቅራ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 5
ዝጽገብ ኣይኮነን መዝሙረይ ንኽብራ
ኣዝ
ክኸውን''ዩ ዝብል ቃሉ ምስ ተነግራ
ይኹነኒ ኢላ ብእምነት መስኪራ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 6
ካብ ሰማይ ምዃኑ ክብሪ ኣደ ኣማኑኤል
ሕያው ምስክር''ዩ ቃል ቅዱስ ገብርኤል
ከም ኤልሳቤጥ ኣደይ ኣደ ጎይታይ ክብል
ካበይ ኮን ኮነለይ ክውድስ ንድንግል

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 7
ካባይ መዓስ ኮይኑ ናይ ፍቕራ ምስጋናይ
ካብ መንፈስ ቅዱስ''ዩ ቅኒት ጣዕመ ዜማይ
ኣዝ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 1
Keysi ab siga temen hadiru ''nite ashatena
Amlak siga Maryam lebisu kab mot adhinuna
Seri bedel hewan ziteats’wet genet
Bidagmawit hewan dagmay teኸftet

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 2
Amlak zerayetni bisga welida
Ayney ''nite belkwas ayni ''kwa kiwhda
Aኽlil timkhtey''ya jemarit dihnetey
Miኽnyat alewo ''nite wedesa libey

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 3
Az
Hat’iat bimbzhu embza biisu
Ts’ega Egziabher abana fesisu
Hewan bibedela qal mergem mis semat

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 4
Maryam bints’hnaa qal midhan tebesret
Sigan demn goytay qedasi hiywetey
Kab ts’yon felfilu kwilu bereኸtey
Mienti''zi''ye''ko nenashae zefqra

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 5
Zits’geb aykonen mezmurey niኽbra
Az
Kiኸwn''yu zibl qalu mis tenegra
Yiኹneni ila biemnet meskira

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 6
Kab semay mikhwanu kibri ade amanuel
Hiyaw miskr''yu qal Kidus Gebriel
Kem elsabet’ adey ade goytay kibl
Kabey kon koneley kiwds nidngl

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 7
Kabay meas koynu nay fiቕra misganay
Kab menfes Kidus''yu qinit t’aeme zemay
Az

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 1
ከይሲ ኣብ ሥጋ ተመን ኃዲሩ ''ንተ ኣስሓተና
አምላክ ሥጋ ማርያም ለቢሱ ካብ ሞት ኣድኂኑና
ሰሪ በደል ሔዋን ዝተዓጽወት ገነት
ብዳግማዊት ሔዋን ዳግማይ ተኸፍተት

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 2
አምላክ ዘርኣየትኒ ብሥጋ ወሊዳ
ዓይነይ ''ንተ በልክዋስ ዓይኒ ''ኳ ክውሕዳ
ኣኽሊል ትምክሕተይ''ያ ጀማሪት ድኅነተይ
ምኽንያት ኣለዎ ''ንተ ወደሳ ልበይ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 3
ኣዝ
ኃጢኣት ብምብዝሑ እምብዛ ብኢሱ
ጸጋ እግዚአብሔር ኣባና ፈሲሱ
ሔዋን ብበደላ ቃል መርገም ምስ ሰምዐት

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 4
ማርያም ብንጽሕናኣ ቃል ምድኃን ተበሥረት
ሥጋን ደምን ጎይታይ ቀዳሲ ሕይወተይ
ካብ ጽዮን ፈልፊሉ ኲሉ በረኸተይ
ምእንቲ''ዚ''የ''ኮ ነናሻዕ ዘፍቅራ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 5
ዝጽገብ ኣይኮነን መዝሙረይ ንኽብራ
ኣዝ
ክኸውን''ዩ ዝብል ቃሉ ምስ ተነግራ
ይኹነኒ ኢላ ብእምነት መስኪራ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 6
ካብ ሰማይ ምዃኑ ክብሪ ኣደ ኣማኑኤል
ሕያው ምስክር''ዩ ቃል ቅዱስ ገብርኤል
ከም ኤልሳቤጥ ኣደይ ኣደ ጎይታይ ክብል
ካበይ ኮን ኮነለይ ክውድስ ንድንግል

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 7
ካባይ መዓስ ኮይኑ ናይ ፍቕራ ምስጋናይ
ካብ መንፈስ ቅዱስ''ዩ ቅኒት ጣዕመ ዜማይ
ኣዝ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና',
        lyrics_transliteration = 'CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 1
Keysi ab siga temen hadiru ''nite ashatena
Amlak siga Maryam lebisu kab mot adhinuna
Seri bedel hewan ziteats’wet genet
Bidagmawit hewan dagmay teኸftet

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 2
Amlak zerayetni bisga welida
Ayney ''nite belkwas ayni ''kwa kiwhda
Aኽlil timkhtey''ya jemarit dihnetey
Miኽnyat alewo ''nite wedesa libey

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 3
Az
Hat’iat bimbzhu embza biisu
Ts’ega Egziabher abana fesisu
Hewan bibedela qal mergem mis semat

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 4
Maryam bints’hnaa qal midhan tebesret
Sigan demn goytay qedasi hiywetey
Kab ts’yon felfilu kwilu bereኸtey
Mienti''zi''ye''ko nenashae zefqra

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 5
Zits’geb aykonen mezmurey niኽbra
Az
Kiኸwn''yu zibl qalu mis tenegra
Yiኹneni ila biemnet meskira

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 6
Kab semay mikhwanu kibri ade amanuel
Hiyaw miskr''yu qal Kidus Gebriel
Kem elsabet’ adey ade goytay kibl
Kabey kon koneley kiwds nidngl

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 7
Kabay meas koynu nay fiቕra misganay
Kab menfes Kidus''yu qinit t’aeme zemay
Az

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4280f981-92de-45e8-80a9-bcb105533bd0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 1
ከይሲ ኣብ ሥጋ ተመን ኃዲሩ ''ንተ ኣስሓተና
አምላክ ሥጋ ማርያም ለቢሱ ካብ ሞት ኣድኂኑና
ሰሪ በደል ሔዋን ዝተዓጽወት ገነት
ብዳግማዊት ሔዋን ዳግማይ ተኸፍተት

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 2
አምላክ ዘርኣየትኒ ብሥጋ ወሊዳ
ዓይነይ ''ንተ በልክዋስ ዓይኒ ''ኳ ክውሕዳ
ኣኽሊል ትምክሕተይ''ያ ጀማሪት ድኅነተይ
ምኽንያት ኣለዎ ''ንተ ወደሳ ልበይ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 3
ኣዝ
ኃጢኣት ብምብዝሑ እምብዛ ብኢሱ
ጸጋ እግዚአብሔር ኣባና ፈሲሱ
ሔዋን ብበደላ ቃል መርገም ምስ ሰምዐት

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 4
ማርያም ብንጽሕናኣ ቃል ምድኃን ተበሥረት
ሥጋን ደምን ጎይታይ ቀዳሲ ሕይወተይ
ካብ ጽዮን ፈልፊሉ ኲሉ በረኸተይ
ምእንቲ''ዚ''የ''ኮ ነናሻዕ ዘፍቅራ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 5
ዝጽገብ ኣይኮነን መዝሙረይ ንኽብራ
ኣዝ
ክኸውን''ዩ ዝብል ቃሉ ምስ ተነግራ
ይኹነኒ ኢላ ብእምነት መስኪራ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 6
ካብ ሰማይ ምዃኑ ክብሪ ኣደ ኣማኑኤል
ሕያው ምስክር''ዩ ቃል ቅዱስ ገብርኤል
ከም ኤልሳቤጥ ኣደይ ኣደ ጎይታይ ክብል
ካበይ ኮን ኮነለይ ክውድስ ንድንግል

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 7
ካባይ መዓስ ኮይኑ ናይ ፍቕራ ምስጋናይ
ካብ መንፈስ ቅዱስ''ዩ ቅኒት ጣዕመ ዜማይ
ኣዝ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4280f981-92de-45e8-80a9-bcb105533bd0'::uuid, 'by-d-teame-segid', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anite-yikir-belen ("Anite Yikir Belen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '36367d1d-8184-4fc1-8f33-f6247f39fa70'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 1
ምነው አቤቱ ጌታ ፣ ይሻለው ነበር ባትፈጥረው
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ዘመኑ እንደ ጥላ ፣ ቶሎ ያልፋል

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 2
ዳዊትም ተናግሯል ፣ አፈር ትል ንኝ ብሏል
አቤቱ ሰው ከንቱ ፣ ነገርን ይመስላል
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 3
ሰውስ ክቡር ነበር አላወቀምና
በሲና በርሃ የመገበው መና
ሊያድነው ቢመጣ ሰቀለው እንደብራና
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 4
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፫x)

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 1
Minew abetu Geta , yishalew neber batfet’rew
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Zemenu ende t’la , tolo yalfal

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 2
Dawitm tenagrwal , afer til nign bilwal
Abetu sew kentu , negern yimeslal
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 3
Sews kibur neber alaweqemna
Besina berha yemegebew mena
Liyadnew bimet’a seqelew endebrana
Egna sew mehon , ayqerm enbedlhalen

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 4
Ende cherneth abetu , ante yiqr belen(3x)

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 1
ምነው አቤቱ ጌታ ፣ ይሻለው ነበር ባትፈጥረው
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ዘመኑ እንደ ጥላ ፣ ቶሎ ያልፋል

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 2
ዳዊትም ተናግሯል ፣ አፈር ትል ንኝ ብሏል
አቤቱ ሰው ከንቱ ፣ ነገርን ይመስላል
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 3
ሰውስ ክቡር ነበር አላወቀምና
በሲና በርሃ የመገበው መና
ሊያድነው ቢመጣ ሰቀለው እንደብራና
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 4
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፫x)

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው',
        lyrics_transliteration = 'CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 1
Minew abetu Geta , yishalew neber batfet’rew
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Zemenu ende t’la , tolo yalfal

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 2
Dawitm tenagrwal , afer til nign bilwal
Abetu sew kentu , negern yimeslal
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 3
Sews kibur neber alaweqemna
Besina berha yemegebew mena
Liyadnew bimet’a seqelew endebrana
Egna sew mehon , ayqerm enbedlhalen

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 4
Ende cherneth abetu , ante yiqr belen(3x)

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new',
        updated_at = clock_timestamp()::text
    WHERE import_id = '36367d1d-8184-4fc1-8f33-f6247f39fa70'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 1
ምነው አቤቱ ጌታ ፣ ይሻለው ነበር ባትፈጥረው
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ዘመኑ እንደ ጥላ ፣ ቶሎ ያልፋል

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 2
ዳዊትም ተናግሯል ፣ አፈር ትል ንኝ ብሏል
አቤቱ ሰው ከንቱ ፣ ነገርን ይመስላል
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 3
ሰውስ ክቡር ነበር አላወቀምና
በሲና በርሃ የመገበው መና
ሊያድነው ቢመጣ ሰቀለው እንደብራና
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 4
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፫x)

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '36367d1d-8184-4fc1-8f33-f6247f39fa70'::uuid, 'anite-yikir-belen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adanegn-geta-ena-emebete-yeamilak-enat ("Adanegn Geta Ena Emebete Yeamilak Enat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3b1eff8a-9e73-4039-9bfb-7d6c17584ed6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ',
        lyrics_transliteration = 'CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3b1eff8a-9e73-4039-9bfb-7d6c17584ed6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3b1eff8a-9e73-4039-9bfb-7d6c17584ed6'::uuid, 'adanegn-geta-ena-emebete-yeamilak-enat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emebete-yamlek-enat ("Emebete Yamlak Enat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '36408955-a838-48f2-b996-289aeea3e3fc'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ለልጅሽም ክብር ውዳሴ ታቀርባለች ዘወትር ነፍሴ (2)',
        lyrics_transliteration = 'CHORUS
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
Lelijishim kibir widase takeribalech zewetir nefse (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '36408955-a838-48f2-b996-289aeea3e3fc'::uuid
      AND deleted_at IS NULL
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
Lelijishim kibir widase takeribalech zewetir nefse (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '36408955-a838-48f2-b996-289aeea3e3fc'::uuid, 'emebete-yamlek-enat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mother-of-god ("Mother of God")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '427e7389-8be4-43bc-9cdc-b749c163eab1'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Worship is due to The Most High

VERSE 4
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 5
Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
Worship is due to The Most High

VERSE 4
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 5
Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High',
        lyrics_transliteration = 'Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse',
        updated_at = clock_timestamp()::text
    WHERE import_id = '427e7389-8be4-43bc-9cdc-b749c163eab1'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Worship is due to The Most High

VERSE 4
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 5
Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '427e7389-8be4-43bc-9cdc-b749c163eab1'::uuid, 'mother-of-god', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- alemamenen-eridaw ("Alemamenen Eridaw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '53f0da3a-8f19-4113-91d5-9506cf022984'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 1
ነፍሴ አብራህ ትኑር በማደርያህ ጥላ
አታውጣን ከቤትህ ባጣም ቅድስና
ይህቺን ዓመት ተወኝ ጉልበቴ እስኪጸና
ያልጸናው ሕይወቴ ቢያስቸግርህ ላልቶ

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 2
እስኪቆም ታገስኝ ጉልበቴ በርትቶ
እንደ ቃልህ ባልኖር ደስም ባላሰኝህ
ዛሬም ከኔ ጋር ሁን በጸናው ኪዳንህ
ለምጼ እጅግ በዝቶ ከስዎች ብገለል

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 3
ልትዳስስኝ ፍጠን ምህረትን ልታደል
ደባልቀኝ ከመንጋው ከበረታው ወገን
አዘንብል ወደኔ በፍቅርህ ልሽፈን
መዓዛዪን ለውጥ ጠረኔን ቀይረው

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 4
እንደ ናርዶስ ሽቶ የከበረ አድርገው
ቅረበኝ በፍቅርህ በደሌን ትተኸው
ሳበኝ በምሕረትህ ፊቴን ደስ አሰኜው

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 1
Nefse abrah tinur bemaderyah t’la
Atawt’an kebeth bat’am qidsna
Yihchin amet tewegn gulbete eskits’ena
Yalts’enaw hiywete biyaschegrh lalto

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 2
Eskiqom tagesgn gulbete bertto
Ende qalh balnor desm balasegnh
Zarem kene gar hun bets’enaw kidanh
Lemts’e ejg bezto keswoch bigelel

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 3
Litdassgn fit’en mihretn litadel
Debalqegn kemengaw keberetaw wegen
Azenbl wedene befqrh lishfen
Meazayin lewt’ t’erenen qeyrew

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 4
Ende nardos shto yekebere adrgew
Qirebegn befqrh bedelen titeኸw
Sabegn bemhreth fiten des asegnew

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 1
ነፍሴ አብራህ ትኑር በማደርያህ ጥላ
አታውጣን ከቤትህ ባጣም ቅድስና
ይህቺን ዓመት ተወኝ ጉልበቴ እስኪጸና
ያልጸናው ሕይወቴ ቢያስቸግርህ ላልቶ

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 2
እስኪቆም ታገስኝ ጉልበቴ በርትቶ
እንደ ቃልህ ባልኖር ደስም ባላሰኝህ
ዛሬም ከኔ ጋር ሁን በጸናው ኪዳንህ
ለምጼ እጅግ በዝቶ ከስዎች ብገለል

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 3
ልትዳስስኝ ፍጠን ምህረትን ልታደል
ደባልቀኝ ከመንጋው ከበረታው ወገን
አዘንብል ወደኔ በፍቅርህ ልሽፈን
መዓዛዪን ለውጥ ጠረኔን ቀይረው

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 4
እንደ ናርዶስ ሽቶ የከበረ አድርገው
ቅረበኝ በፍቅርህ በደሌን ትተኸው
ሳበኝ በምሕረትህ ፊቴን ደስ አሰኜው

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ',
        lyrics_transliteration = 'CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 1
Nefse abrah tinur bemaderyah t’la
Atawt’an kebeth bat’am qidsna
Yihchin amet tewegn gulbete eskits’ena
Yalts’enaw hiywete biyaschegrh lalto

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 2
Eskiqom tagesgn gulbete bertto
Ende qalh balnor desm balasegnh
Zarem kene gar hun bets’enaw kidanh
Lemts’e ejg bezto keswoch bigelel

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 3
Litdassgn fit’en mihretn litadel
Debalqegn kemengaw keberetaw wegen
Azenbl wedene befqrh lishfen
Meazayin lewt’ t’erenen qeyrew

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 4
Ende nardos shto yekebere adrgew
Qirebegn befqrh bedelen titeኸw
Sabegn bemhreth fiten des asegnew

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla',
        updated_at = clock_timestamp()::text
    WHERE import_id = '53f0da3a-8f19-4113-91d5-9506cf022984'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 1
ነፍሴ አብራህ ትኑር በማደርያህ ጥላ
አታውጣን ከቤትህ ባጣም ቅድስና
ይህቺን ዓመት ተወኝ ጉልበቴ እስኪጸና
ያልጸናው ሕይወቴ ቢያስቸግርህ ላልቶ

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 2
እስኪቆም ታገስኝ ጉልበቴ በርትቶ
እንደ ቃልህ ባልኖር ደስም ባላሰኝህ
ዛሬም ከኔ ጋር ሁን በጸናው ኪዳንህ
ለምጼ እጅግ በዝቶ ከስዎች ብገለል

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 3
ልትዳስስኝ ፍጠን ምህረትን ልታደል
ደባልቀኝ ከመንጋው ከበረታው ወገን
አዘንብል ወደኔ በፍቅርህ ልሽፈን
መዓዛዪን ለውጥ ጠረኔን ቀይረው

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 4
እንደ ናርዶስ ሽቶ የከበረ አድርገው
ቅረበኝ በፍቅርህ በደሌን ትተኸው
ሳበኝ በምሕረትህ ፊቴን ደስ አሰኜው

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '53f0da3a-8f19-4113-91d5-9506cf022984'::uuid, 'alemamenen-eridaw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hanos-begena ("hanos begena")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5175fb81-b990-4910-ad50-fd89a28da464'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እኔ አልቀርበው ስል ስፈራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Ene alqerbew sil sifera'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '5175fb81-b990-4910-ad50-fd89a28da464'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እኔ አልቀርበው ስል ስፈራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5175fb81-b990-4910-ad50-fd89a28da464'::uuid, 'hanos-begena', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
