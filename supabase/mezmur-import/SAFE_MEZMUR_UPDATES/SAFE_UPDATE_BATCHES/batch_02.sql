-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 02 OF 32
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
  -- by-the-lords-grand-design ("By the Lord's grand design")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ad7a1791-982b-4c49-a5d8-97358e1248a6'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 1
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 2
The Heavens and the Earth His splendor they convey
Every sunrise and night His grand work on display
From the whispers of winds to the oceans that leap
We honor exalt Him His promises we keep

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 3
From what came to exist each piece is His design
In Heaven and on Earth His wonders intertwine
The sovereign Lord decrees for the good and we''re glad
In His grand creation all things good He has clad

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 4
The summer to winter and from daylight to night
He displays these wonders guiding our blinded sight
In His perfect canvas there’s no flaw to be rid
For there’s no one like Him our Creator is vivid

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 5
He feels our despair and joys that have lighted
Every twist every turn by His hand is guided
In joy and in sorrow His true purpose we find
For these eternal truths in God we will abide

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 6
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 7
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 1
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 2
The Heavens and the Earth His splendor they convey
Every sunrise and night His grand work on display
From the whispers of winds to the oceans that leap
We honor exalt Him His promises we keep

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 3
From what came to exist each piece is His design
In Heaven and on Earth His wonders intertwine
The sovereign Lord decrees for the good and we''re glad
In His grand creation all things good He has clad

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 4
The summer to winter and from daylight to night
He displays these wonders guiding our blinded sight
In His perfect canvas there’s no flaw to be rid
For there’s no one like Him our Creator is vivid

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 5
He feels our despair and joys that have lighted
Every twist every turn by His hand is guided
In joy and in sorrow His true purpose we find
For these eternal truths in God we will abide

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 6
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 7
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find',
        lyrics_transliteration = 'Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ad7a1791-982b-4c49-a5d8-97358e1248a6'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 1
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 2
The Heavens and the Earth His splendor they convey
Every sunrise and night His grand work on display
From the whispers of winds to the oceans that leap
We honor exalt Him His promises we keep

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 3
From what came to exist each piece is His design
In Heaven and on Earth His wonders intertwine
The sovereign Lord decrees for the good and we''re glad
In His grand creation all things good He has clad

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 4
The summer to winter and from daylight to night
He displays these wonders guiding our blinded sight
In His perfect canvas there’s no flaw to be rid
For there’s no one like Him our Creator is vivid

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 5
He feels our despair and joys that have lighted
Every twist every turn by His hand is guided
In joy and in sorrow His true purpose we find
For these eternal truths in God we will abide

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 6
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 7
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ad7a1791-982b-4c49-a5d8-97358e1248a6'::uuid, 'by-the-lords-grand-design', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egiziabiher-sirawu-dinik-new-zemari-di-n-bisirat-chebisi ("Egiziabiher Sirawu Dinik New Zemari Di N Bisirat Chebisi")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3564f2e0-f059-4109-a60a-0484609ef0c1'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ለእኔ ያረገልኝ ብዙ ነዉ',
        lyrics_transliteration = 'CHORUS
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
Leene yaregelgn bizu newu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3564f2e0-f059-4109-a60a-0484609ef0c1'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3564f2e0-f059-4109-a60a-0484609ef0c1'::uuid, 'egiziabiher-sirawu-dinik-new-zemari-di-n-bisirat-chebisi', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- come-all-let-us-rejoice ("Come all let us rejoice")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '20c1fcd3-44c7-4168-9835-4416e0ce276f'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Sewoch des yibelen beAmlakachin
Kehatiyat barinet netsa yawetan
Tenesu enamesgin wiletaw bizu new
Min yikefelewal temesgen bicha new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
There’s no way to repay but to be jubilant',
        lyrics_transliteration = 'Sewoch des yibelen beAmlakachin
Kehatiyat barinet netsa yawetan
Tenesu enamesgin wiletaw bizu new
Min yikefelewal temesgen bicha new',
        updated_at = clock_timestamp()::text
    WHERE import_id = '20c1fcd3-44c7-4168-9835-4416e0ce276f'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Sewoch des yibelen beAmlakachin
Kehatiyat barinet netsa yawetan
Tenesu enamesgin wiletaw bizu new
Min yikefelewal temesgen bicha new';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '20c1fcd3-44c7-4168-9835-4416e0ce276f'::uuid, 'come-all-let-us-rejoice', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- medihanealem-yelem-yemisanew ("Medihanealem Yelem Yemisanew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c0291adb-9dcc-4cc2-b762-77157ba427c8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 1
አላስብም ነበር አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን እያጠበ እንባዬን
እየተፈጸመ ኃይሉ በድካሜ
ማእበሉን አለፍኩኝ ቀለለልኝ ሸክሜ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 2
የቤቴ እራስ ነው የእቅዴ መሪ
በክፉም በደጉም ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው እንባዬ ታበሰ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 3
ትናንት ባዶ ነበር የለኝ የሚሰፈር
አንዳች አልነበረኝ ሚታይ የሚቆጠር
ከርሱ የተነሳ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን አለ የማይተወኝ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 4
እየከለከለ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ደግሞ የሚረባኝን
ሁሉ በእርሱ ሆኗል አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ይድረስ ለንጉሱ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 1
Alasbm neber alfewalehu biye
Gunch’ alfo tirasen eyat’ebe enbayen
Eyetefets’eme haylu bedkame
Maebelun alefkugn qelelelgn shekme

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 2
Yebete eras new yeeqde meri
Bekfum bedegum nefsen astemari
Fet’ro yemayresagn bezaye derese
Beten desta molaw enbaye tabese

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 3
Tinant bado neber yelegn yemisefer
Andach alneberegn mitay yemiqot’er
Kersu yetenesa zare gin mulu negn
Kibir leersu yihun ale yemaytewegn

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 4
Eyekelekele leene mayt’eqmegnn
Begize eyeset’e degmo yemirebagnn
Hulu beersu honwal alhonem yale ersu
Widase misgana yidres lengusu

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 1
አላስብም ነበር አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን እያጠበ እንባዬን
እየተፈጸመ ኃይሉ በድካሜ
ማእበሉን አለፍኩኝ ቀለለልኝ ሸክሜ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 2
የቤቴ እራስ ነው የእቅዴ መሪ
በክፉም በደጉም ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው እንባዬ ታበሰ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 3
ትናንት ባዶ ነበር የለኝ የሚሰፈር
አንዳች አልነበረኝ ሚታይ የሚቆጠር
ከርሱ የተነሳ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን አለ የማይተወኝ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 4
እየከለከለ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ደግሞ የሚረባኝን
ሁሉ በእርሱ ሆኗል አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ይድረስ ለንጉሱ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው',
        lyrics_transliteration = 'CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 1
Alasbm neber alfewalehu biye
Gunch’ alfo tirasen eyat’ebe enbayen
Eyetefets’eme haylu bedkame
Maebelun alefkugn qelelelgn shekme

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 2
Yebete eras new yeeqde meri
Bekfum bedegum nefsen astemari
Fet’ro yemayresagn bezaye derese
Beten desta molaw enbaye tabese

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 3
Tinant bado neber yelegn yemisefer
Andach alneberegn mitay yemiqot’er
Kersu yetenesa zare gin mulu negn
Kibir leersu yihun ale yemaytewegn

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 4
Eyekelekele leene mayt’eqmegnn
Begize eyeset’e degmo yemirebagnn
Hulu beersu honwal alhonem yale ersu
Widase misgana yidres lengusu

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c0291adb-9dcc-4cc2-b762-77157ba427c8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 1
አላስብም ነበር አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን እያጠበ እንባዬን
እየተፈጸመ ኃይሉ በድካሜ
ማእበሉን አለፍኩኝ ቀለለልኝ ሸክሜ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 2
የቤቴ እራስ ነው የእቅዴ መሪ
በክፉም በደጉም ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው እንባዬ ታበሰ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 3
ትናንት ባዶ ነበር የለኝ የሚሰፈር
አንዳች አልነበረኝ ሚታይ የሚቆጠር
ከርሱ የተነሳ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን አለ የማይተወኝ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 4
እየከለከለ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ደግሞ የሚረባኝን
ሁሉ በእርሱ ሆኗል አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ይድረስ ለንጉሱ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c0291adb-9dcc-4cc2-b762-77157ba427c8'::uuid, 'medihanealem-yelem-yemisanew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- menbeye-yersun-degnet-linager ("menbeye yersun degnet linager")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cae58bd2-d041-4e14-a574-bbea1398cde8'::uuid
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
    WHERE import_id = 'cae58bd2-d041-4e14-a574-bbea1398cde8'::uuid
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
        'cae58bd2-d041-4e14-a574-bbea1398cde8'::uuid, 'menbeye-yersun-degnet-linager', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- begol-sekebe-beatsriqt ("Begol Seke BeAtsriq Tetebilele")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd1e56cb1-954d-4c94-a1e4-8a4db1a4f5df'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጎል ሰከ በአፅርቅ ተጠብለለ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓልም
ቤዛ ኩለም ዮም ተወልደ /2 ጊዜ/

CHORUS
በጎል ሰከ በአፅርቅ ተጠብለለ /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
begol seke beetsrq teteblele /2 gize/

VERSE 1
beza kulu alm
beza kulem yom tewelde /2 gize/

CHORUS
begol seke beetsrq teteblele /2 gize/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በጎል ሰከ በአፅርቅ ተጠብለለ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓልም
ቤዛ ኩለም ዮም ተወልደ /2 ጊዜ/

CHORUS
በጎል ሰከ በአፅርቅ ተጠብለለ /2 ጊዜ/',
        lyrics_transliteration = 'CHORUS
begol seke beetsrq teteblele /2 gize/

VERSE 1
beza kulu alm
beza kulem yom tewelde /2 gize/

CHORUS
begol seke beetsrq teteblele /2 gize/',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd1e56cb1-954d-4c94-a1e4-8a4db1a4f5df'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጎል ሰከ በአፅርቅ ተጠብለለ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓልም
ቤዛ ኩለም ዮም ተወልደ /2 ጊዜ/

CHORUS
በጎል ሰከ በአፅርቅ ተጠብለለ /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
begol seke beetsrq teteblele /2 gize/

VERSE 1
beza kulu alm
beza kulem yom tewelde /2 gize/

CHORUS
begol seke beetsrq teteblele /2 gize/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd1e56cb1-954d-4c94-a1e4-8a4db1a4f5df'::uuid, 'begol-sekebe-beatsriqt', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dingil-embete-yehiywete-redat ("Dingil Embete Yehiywete Redat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3f732050-0af8-4dda-ac92-05bde13c0402'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እለምንሻለሁ /2/ ፍጹም በረከት',
        lyrics_transliteration = 'CHORUS
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
Ilemenishalehu (x2) fits’um bereket',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3f732050-0af8-4dda-ac92-05bde13c0402'::uuid
      AND deleted_at IS NULL
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
Ilemenishalehu (x2) fits’um bereket';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3f732050-0af8-4dda-ac92-05bde13c0402'::uuid, 'dingil-embete-yehiywete-redat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- qewamiyan ("Qewamiyan")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'acfd1300-764c-4865-b77b-2857d49e1f4d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 1
ይትፌነዉ ለሳህል (2)
እምኀበ ልዑል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 2
ለነፍሳት የቆሙ
እነዚህ መላዕክት
ዑራኤልና ሩፋኤል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 3
ከልዑል ዘንድ ለይቅርታ (2)
ይላካሉ ከልዑል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 1
Yitfenew le sahil (2)
Emhabe leul (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 2
Le nefsat yeqomu
Inezih melaekit
Uraelna Rufael (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 3
Ke leul zend le yiqirta (2)
Yilakalu ke leul (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 1
ይትፌነዉ ለሳህል (2)
እምኀበ ልዑል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 2
ለነፍሳት የቆሙ
እነዚህ መላዕክት
ዑራኤልና ሩፋኤል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 3
ከልዑል ዘንድ ለይቅርታ (2)
ይላካሉ ከልዑል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)',
        lyrics_transliteration = 'CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 1
Yitfenew le sahil (2)
Emhabe leul (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 2
Le nefsat yeqomu
Inezih melaekit
Uraelna Rufael (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 3
Ke leul zend le yiqirta (2)
Yilakalu ke leul (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'acfd1300-764c-4865-b77b-2857d49e1f4d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 1
ይትፌነዉ ለሳህል (2)
እምኀበ ልዑል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 2
ለነፍሳት የቆሙ
እነዚህ መላዕክት
ዑራኤልና ሩፋኤል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 3
ከልዑል ዘንድ ለይቅርታ (2)
ይላካሉ ከልዑል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 1
Yitfenew le sahil (2)
Emhabe leul (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 2
Le nefsat yeqomu
Inezih melaekit
Uraelna Rufael (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 3
Ke leul zend le yiqirta (2)
Yilakalu ke leul (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'acfd1300-764c-4865-b77b-2857d49e1f4d'::uuid, 'qewamiyan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yesew-zemenu-eyesheshe ("Yesew Zemenu Eyesheshe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cb88c98c-eecc-471c-8bad-eb0aff8e7e06'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 1
አዝ……
በጣም ፈጣን ነው ሰው ዘመኑ
ቀንሶ ሚያድር በየቀኑ
እውነት ነው ጠላት ይህን ያውቃል

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 2
በየሰበቡ ያዘገያል
በእሾህ መሀል እንዳለ ዘር
አድጎ በፍሬ ማይቆጠር
ታንቆ የቀረ በዚህ ዓለም

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 3
እንደኔ ሰነፍ ማንም የለም
አዝ……
በወደቀው ሰው እራሴን ለካሁ
መመዘኛዬን ቃሉን እረሳሁ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 4
ስለበደሌ ከመፀፀት
ተፅናና ልቤ በወደቁት
ችላ ባዬ ሆኜ ነገ ዛሬ
አለሁ በቅጠል ያለ ፍሬ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 5
በዓለም ጨክኜ እንድቆርጥ
እባክህ ጌታ ልቤን ለውጥ
አዝ……
ለፀሎት መትጋት ማስቀደሱ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 6
ሁሌ መገኘት በመቅደሱ
ነበር ተብሎ ከተወራ
በቅጠል ቀርቶል ሳያፈራ
ወደ ኋላ እርፍ ይዞ ከታረሰ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 7
ፅድቁን በርኩሰት ከጨረሰ
ነውና ሰይጣን ያዘገየው
የዕርሱ አሟሟት የከፋ ነው
አዝ……

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 8
በመንፈስ ሆነው የቀደሙት
በስጋ ስራ ደመደሙ
የሕይወት ቃልን የቀመሱ
ለአመጽ ለሐጥያት ይህው ባሱ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 9
ቁሜአለሁ የሚለው እንዳይወድቅ
ያለ ትትና የለም ፅድቅ
ባርያ ነኝ ይበል የማልጠቅም
ታምኖ ይሰማራ በአምላክ ስም

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 10
አዝ……

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 1
CHORUS
Bet’am fet’an new sew zemenu
Qenso miyadr beyeqenu
Ewnet new t’elat yihn yawqal

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 2
Beyesebebu yazegeyal
Beeshoh mehel endale zer
Adgo befre mayqot’er
Tanqo yeqere bezih alem

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 3
Endene senef manm yelem
CHORUS
Bewedeqew sew erasen lekahu
Memezegnayen qalun eresahu

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 4
Silebedele kemets’ets’et
Tets’nana libe bewedequt
Chla baye hogne nege zare
Alehu beqt’el yale fire

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 5
Bealem ch’ekgne endqort’
Ebakh Geta liben lewt’
CHORUS
Lets’elot metgat masqedesu

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 6
Hule megegnet bemeqdesu
Neber teblo ketewera
Beqt’el qertol sayafera
Wede hwala erf yizo ketarese

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 7
Ts’dqun berkuset kech’erese
Newna seyt’an yazegeyew
Yeersu amwamwat yekefa new
CHORUS

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 8
Bemenfes honew yeqedemut
Besga sira demedemu
Yehywet qaln yeqemesu
Leamets’ lehet’yat yihw basu

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 9
Qumealehu yemilew endaywedq
Yale titna yelem ts’dq
Barya negn yibel yemalt’eqm
Tamno yisemara beamlak sim

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 10
CHORUS

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 1
አዝ……
በጣም ፈጣን ነው ሰው ዘመኑ
ቀንሶ ሚያድር በየቀኑ
እውነት ነው ጠላት ይህን ያውቃል

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 2
በየሰበቡ ያዘገያል
በእሾህ መሀል እንዳለ ዘር
አድጎ በፍሬ ማይቆጠር
ታንቆ የቀረ በዚህ ዓለም

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 3
እንደኔ ሰነፍ ማንም የለም
አዝ……
በወደቀው ሰው እራሴን ለካሁ
መመዘኛዬን ቃሉን እረሳሁ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 4
ስለበደሌ ከመፀፀት
ተፅናና ልቤ በወደቁት
ችላ ባዬ ሆኜ ነገ ዛሬ
አለሁ በቅጠል ያለ ፍሬ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 5
በዓለም ጨክኜ እንድቆርጥ
እባክህ ጌታ ልቤን ለውጥ
አዝ……
ለፀሎት መትጋት ማስቀደሱ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 6
ሁሌ መገኘት በመቅደሱ
ነበር ተብሎ ከተወራ
በቅጠል ቀርቶል ሳያፈራ
ወደ ኋላ እርፍ ይዞ ከታረሰ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 7
ፅድቁን በርኩሰት ከጨረሰ
ነውና ሰይጣን ያዘገየው
የዕርሱ አሟሟት የከፋ ነው
አዝ……

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 8
በመንፈስ ሆነው የቀደሙት
በስጋ ስራ ደመደሙ
የሕይወት ቃልን የቀመሱ
ለአመጽ ለሐጥያት ይህው ባሱ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 9
ቁሜአለሁ የሚለው እንዳይወድቅ
ያለ ትትና የለም ፅድቅ
ባርያ ነኝ ይበል የማልጠቅም
ታምኖ ይሰማራ በአምላክ ስም

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 10
አዝ……

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ',
        lyrics_transliteration = 'CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 1
CHORUS
Bet’am fet’an new sew zemenu
Qenso miyadr beyeqenu
Ewnet new t’elat yihn yawqal

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 2
Beyesebebu yazegeyal
Beeshoh mehel endale zer
Adgo befre mayqot’er
Tanqo yeqere bezih alem

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 3
Endene senef manm yelem
CHORUS
Bewedeqew sew erasen lekahu
Memezegnayen qalun eresahu

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 4
Silebedele kemets’ets’et
Tets’nana libe bewedequt
Chla baye hogne nege zare
Alehu beqt’el yale fire

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 5
Bealem ch’ekgne endqort’
Ebakh Geta liben lewt’
CHORUS
Lets’elot metgat masqedesu

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 6
Hule megegnet bemeqdesu
Neber teblo ketewera
Beqt’el qertol sayafera
Wede hwala erf yizo ketarese

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 7
Ts’dqun berkuset kech’erese
Newna seyt’an yazegeyew
Yeersu amwamwat yekefa new
CHORUS

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 8
Bemenfes honew yeqedemut
Besga sira demedemu
Yehywet qaln yeqemesu
Leamets’ lehet’yat yihw basu

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 9
Qumealehu yemilew endaywedq
Yale titna yelem ts’dq
Barya negn yibel yemalt’eqm
Tamno yisemara beamlak sim

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 10
CHORUS

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cb88c98c-eecc-471c-8bad-eb0aff8e7e06'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 1
አዝ……
በጣም ፈጣን ነው ሰው ዘመኑ
ቀንሶ ሚያድር በየቀኑ
እውነት ነው ጠላት ይህን ያውቃል

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 2
በየሰበቡ ያዘገያል
በእሾህ መሀል እንዳለ ዘር
አድጎ በፍሬ ማይቆጠር
ታንቆ የቀረ በዚህ ዓለም

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 3
እንደኔ ሰነፍ ማንም የለም
አዝ……
በወደቀው ሰው እራሴን ለካሁ
መመዘኛዬን ቃሉን እረሳሁ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 4
ስለበደሌ ከመፀፀት
ተፅናና ልቤ በወደቁት
ችላ ባዬ ሆኜ ነገ ዛሬ
አለሁ በቅጠል ያለ ፍሬ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 5
በዓለም ጨክኜ እንድቆርጥ
እባክህ ጌታ ልቤን ለውጥ
አዝ……
ለፀሎት መትጋት ማስቀደሱ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 6
ሁሌ መገኘት በመቅደሱ
ነበር ተብሎ ከተወራ
በቅጠል ቀርቶል ሳያፈራ
ወደ ኋላ እርፍ ይዞ ከታረሰ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 7
ፅድቁን በርኩሰት ከጨረሰ
ነውና ሰይጣን ያዘገየው
የዕርሱ አሟሟት የከፋ ነው
አዝ……

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 8
በመንፈስ ሆነው የቀደሙት
በስጋ ስራ ደመደሙ
የሕይወት ቃልን የቀመሱ
ለአመጽ ለሐጥያት ይህው ባሱ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 9
ቁሜአለሁ የሚለው እንዳይወድቅ
ያለ ትትና የለም ፅድቅ
ባርያ ነኝ ይበል የማልጠቅም
ታምኖ ይሰማራ በአምላክ ስም

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 10
አዝ……

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cb88c98c-eecc-471c-8bad-eb0aff8e7e06'::uuid, 'yesew-zemenu-eyesheshe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kebeles-betach-yayehign ("Kebeles Betach Yayehign")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c0e3e883-5069-4ad0-bd74-f994dccf156e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 1
​
መልካም ሰው አይወጣም ከናዝሬት ከተማ
ብዬ ብናገርም ስላንተ ስሰማ
በቀልን ሳታስብ የልቤን ነገርከኝ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 2
ተንኮል የሌለበት ብለህ ተቀበልከኝ
ካለህበት ድረስ አየሁህ መጥቼ
ቀምሼ ፍቅርህን ቀረሁ ተረትቼ
ካንተ ጋር ኖራለሁ ጎድለቴ እንዲሞላ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 3
ከእንግዲህ አልመኝም የበለሷን ጥላ
ወደፊት ተራመድኩ በመርሳት ኋላዬን
መንፈሴ ታደሰ እያየሁ ጌታዬን
ሳያቆስል ማርኮ የእሱ አድርጎኛልና

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 4
የሚበልጥ ነገር ብዙ አያለሁ ገና
በስውር ብበድል ለኃጢአት ነቅቼ
ምድረበዳ ሆንኩኝ እጅግ ተራቁቼ
ልብሴን አገኘሁ መድመቂያዪን ዛሬ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 5
ናዝራዊውን ንጉሥ ያከብራል ከንፈሬ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 1
​
Melkam sew aywet’am kenazret ketema
Biye binagerm silante sisema
Beqeln satasb yelben negerkegn

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 2
Tenkol yelelebet bileh teqebelkegn
Kalehbet dires ayehuh met’che
Qemshe fiqrhn qerehu teretche
Kante gar noralehu godlete endimola

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 3
Keengdih almegnm yebeleswan t’la
Wedefit teramedku bemersat hwalayen
Menfese tadese eyayehu getayen
Sayaqosl marko yeesu adrgognalna

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 4
Yemibelt’ neger bizu ayalehu gena
Beswr bibedl lehat’iat neqche
Midrebeda honkugn ejg teraquche
Libsen agegnehu medmeqiyayin zare

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 5
Nazrawiwn nigus yakebral kenfere

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 1
​
መልካም ሰው አይወጣም ከናዝሬት ከተማ
ብዬ ብናገርም ስላንተ ስሰማ
በቀልን ሳታስብ የልቤን ነገርከኝ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 2
ተንኮል የሌለበት ብለህ ተቀበልከኝ
ካለህበት ድረስ አየሁህ መጥቼ
ቀምሼ ፍቅርህን ቀረሁ ተረትቼ
ካንተ ጋር ኖራለሁ ጎድለቴ እንዲሞላ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 3
ከእንግዲህ አልመኝም የበለሷን ጥላ
ወደፊት ተራመድኩ በመርሳት ኋላዬን
መንፈሴ ታደሰ እያየሁ ጌታዬን
ሳያቆስል ማርኮ የእሱ አድርጎኛልና

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 4
የሚበልጥ ነገር ብዙ አያለሁ ገና
በስውር ብበድል ለኃጢአት ነቅቼ
ምድረበዳ ሆንኩኝ እጅግ ተራቁቼ
ልብሴን አገኘሁ መድመቂያዪን ዛሬ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 5
ናዝራዊውን ንጉሥ ያከብራል ከንፈሬ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ',
        lyrics_transliteration = 'CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 1
​
Melkam sew aywet’am kenazret ketema
Biye binagerm silante sisema
Beqeln satasb yelben negerkegn

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 2
Tenkol yelelebet bileh teqebelkegn
Kalehbet dires ayehuh met’che
Qemshe fiqrhn qerehu teretche
Kante gar noralehu godlete endimola

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 3
Keengdih almegnm yebeleswan t’la
Wedefit teramedku bemersat hwalayen
Menfese tadese eyayehu getayen
Sayaqosl marko yeesu adrgognalna

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 4
Yemibelt’ neger bizu ayalehu gena
Beswr bibedl lehat’iat neqche
Midrebeda honkugn ejg teraquche
Libsen agegnehu medmeqiyayin zare

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus

VERSE 5
Nazrawiwn nigus yakebral kenfere

CHORUS
Kebeles betach yayehgn
Salawqh awqeh yasebkegn
Nazrawiw Geta Iyesus
Temesgen yenefse nigus',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c0e3e883-5069-4ad0-bd74-f994dccf156e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 1
​
መልካም ሰው አይወጣም ከናዝሬት ከተማ
ብዬ ብናገርም ስላንተ ስሰማ
በቀልን ሳታስብ የልቤን ነገርከኝ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 2
ተንኮል የሌለበት ብለህ ተቀበልከኝ
ካለህበት ድረስ አየሁህ መጥቼ
ቀምሼ ፍቅርህን ቀረሁ ተረትቼ
ካንተ ጋር ኖራለሁ ጎድለቴ እንዲሞላ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 3
ከእንግዲህ አልመኝም የበለሷን ጥላ
ወደፊት ተራመድኩ በመርሳት ኋላዬን
መንፈሴ ታደሰ እያየሁ ጌታዬን
ሳያቆስል ማርኮ የእሱ አድርጎኛልና

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 4
የሚበልጥ ነገር ብዙ አያለሁ ገና
በስውር ብበድል ለኃጢአት ነቅቼ
ምድረበዳ ሆንኩኝ እጅግ ተራቁቼ
ልብሴን አገኘሁ መድመቂያዪን ዛሬ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ

VERSE 5
ናዝራዊውን ንጉሥ ያከብራል ከንፈሬ

CHORUS
ከበለስ በታች ያየህኝ
ሳላውቅህ አውቀህ ያሰብከኝ
ናዝራዊው ጌታ ኢየሱስ
ተመስገን የነፍሴ ንጉስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c0e3e883-5069-4ad0-bd74-f994dccf156e'::uuid, 'kebeles-betach-yayehign', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dingil-hoy-wede-ene ("Dingil Hoy Wede Ene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cd96dc44-1968-4891-a414-bb4d17d73867'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ደካማ ነኝ እኔ ምግባር ይጎድለኛል (2)',
        lyrics_transliteration = 'CHORUS
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
Dekama negh ene migibar yigodlenyal (×2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cd96dc44-1968-4891-a414-bb4d17d73867'::uuid
      AND deleted_at IS NULL
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
Dekama negh ene migibar yigodlenyal (×2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cd96dc44-1968-4891-a414-bb4d17d73867'::uuid, 'dingil-hoy-wede-ene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dingil-fetariwan ("Dingil Fetariwan")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd1d0ba8d-4ff5-4824-a591-21e18ebed05c'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ግርግም አስተኛችው በከብቶች ማደሪያ /2/',
        lyrics_transliteration = 'CHORUS
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
Girigim astenyachew be-kebtoch maderiya /2/',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd1d0ba8d-4ff5-4824-a591-21e18ebed05c'::uuid
      AND deleted_at IS NULL
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
Girigim astenyachew be-kebtoch maderiya /2/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd1d0ba8d-4ff5-4824-a591-21e18ebed05c'::uuid, 'dingil-fetariwan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- meliake-adihino-diyakon-zemari-enidale-dereje ("Meliake Adihino Diyakon Zemari Enidale Dereje")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '36dab3f6-25f1-426e-8309-7238e0200e66'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 1
ደርሷል በጭንቄ - ሁሉም ሲርቀኝ
በምክንያት ነው - ለክብሩ ''ምቀኝ
ከእሳቱ ከወላፈኑ - ነጥቆ ያዳነኝ
ኃጢአተኛው ሰው - ከቶ እኔ ማን ነኝ?

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 2
ሳለሁ በኀዘን - ደስታ አበሠረኝ
ደጅ ስጸናው - ማልዶ አስማረኝ
ይመራኛል በጽድቅ - ሠርክ በለምለም
ከቶ አይተወኝም - ብቻዬን ላለም

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 3
የበለዓም - የራዕዩ ኮከብ
የሰላም የፍቅር - የጥበብ መርከብ
ማስተዋሉን ክብሩን - ጸጋውን ያደለኝ
የሚጠብቀኝ - ገብርኤል አለልኝ

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 4
የጌታ ልደት - ሐዋርያ ነው
እንደ ገብርኤል - ገናና ማነው!?
ሁልጊዜ ዘውትር - ልመስክረው ክብሩን
ዐይቻለሁኝ - ድንቅ ታምሩን።

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 1
Derswal bech’nqe - hulum sirqegn
Bemknyat new - lekbru ''miqegn
Keesatu kewelafenu - net’qo yadanegn
Hat’iategnaw sew - keto ene man negn?

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 2
Salehu behezen - desta abeseregn
Dej sits’enaw - maldo asmaregn
Yimeragnal bets’dq - serk belemlem
Keto aytewegnm - bichayen lalem

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 3
Yebeleam - yeraeyu kokeb
Yeselam yefqr - yet’beb merkeb
Mastewalun kibrun - ts’egawn yadelegn
Yemit’ebqegn - Gebriel alelgn

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 4
Yegeta lidet - hewarya new
Ende Gebriel - genana manew!?
Hulgize zewtr - limeskrew kibrun
Aychalehugn - dinq tamrun.

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 1
ደርሷል በጭንቄ - ሁሉም ሲርቀኝ
በምክንያት ነው - ለክብሩ ''ምቀኝ
ከእሳቱ ከወላፈኑ - ነጥቆ ያዳነኝ
ኃጢአተኛው ሰው - ከቶ እኔ ማን ነኝ?

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 2
ሳለሁ በኀዘን - ደስታ አበሠረኝ
ደጅ ስጸናው - ማልዶ አስማረኝ
ይመራኛል በጽድቅ - ሠርክ በለምለም
ከቶ አይተወኝም - ብቻዬን ላለም

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 3
የበለዓም - የራዕዩ ኮከብ
የሰላም የፍቅር - የጥበብ መርከብ
ማስተዋሉን ክብሩን - ጸጋውን ያደለኝ
የሚጠብቀኝ - ገብርኤል አለልኝ

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 4
የጌታ ልደት - ሐዋርያ ነው
እንደ ገብርኤል - ገናና ማነው!?
ሁልጊዜ ዘውትር - ልመስክረው ክብሩን
ዐይቻለሁኝ - ድንቅ ታምሩን።

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)',
        lyrics_transliteration = 'CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 1
Derswal bech’nqe - hulum sirqegn
Bemknyat new - lekbru ''miqegn
Keesatu kewelafenu - net’qo yadanegn
Hat’iategnaw sew - keto ene man negn?

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 2
Salehu behezen - desta abeseregn
Dej sits’enaw - maldo asmaregn
Yimeragnal bets’dq - serk belemlem
Keto aytewegnm - bichayen lalem

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 3
Yebeleam - yeraeyu kokeb
Yeselam yefqr - yet’beb merkeb
Mastewalun kibrun - ts’egawn yadelegn
Yemit’ebqegn - Gebriel alelgn

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 4
Yegeta lidet - hewarya new
Ende Gebriel - genana manew!?
Hulgize zewtr - limeskrew kibrun
Aychalehugn - dinq tamrun.

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '36dab3f6-25f1-426e-8309-7238e0200e66'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 1
ደርሷል በጭንቄ - ሁሉም ሲርቀኝ
በምክንያት ነው - ለክብሩ ''ምቀኝ
ከእሳቱ ከወላፈኑ - ነጥቆ ያዳነኝ
ኃጢአተኛው ሰው - ከቶ እኔ ማን ነኝ?

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 2
ሳለሁ በኀዘን - ደስታ አበሠረኝ
ደጅ ስጸናው - ማልዶ አስማረኝ
ይመራኛል በጽድቅ - ሠርክ በለምለም
ከቶ አይተወኝም - ብቻዬን ላለም

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 3
የበለዓም - የራዕዩ ኮከብ
የሰላም የፍቅር - የጥበብ መርከብ
ማስተዋሉን ክብሩን - ጸጋውን ያደለኝ
የሚጠብቀኝ - ገብርኤል አለልኝ

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 4
የጌታ ልደት - ሐዋርያ ነው
እንደ ገብርኤል - ገናና ማነው!?
ሁልጊዜ ዘውትር - ልመስክረው ክብሩን
ዐይቻለሁኝ - ድንቅ ታምሩን።

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '36dab3f6-25f1-426e-8309-7238e0200e66'::uuid, 'meliake-adihino-diyakon-zemari-enidale-dereje', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yashagiral ("Yashagiral")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '374c413b-cc6b-47f8-be1b-abaa34044166'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 1
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ደመናዉን እያየነው አይደክምም ልቦናችን
በበረሃ መና አዝንበህ አይተንሃል በዓይናችን
በሚለወጥ በሁኔታ ዜማችንን አንቀይር

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 2
ሁሉም አልፎ ሁሉም ሄዶ ቀሪያችን ነህ እግዚአብሔር !!!
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 3
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ቀስቱን አልፎ ይታየናል የተዘረጋው ክንድህ
ከሞት ዓይኖች ከፍላፃ ከልሎናል ሞገስህ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 4
የሸለቆ ፈሳሽ ሆነን ተራምደናል በግርማ
ሳይፈፅም አንወሰድ በኛ ያለው አላማ ፣
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 5
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ጥልቁ ባህር መድረካችን ውሃው ሰገነት ሆኖ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 6
ዘምረናል በእንባ መሐል ልባችን ባንተ ታምኖ
እስከመምጫህ ይቀጥላል ባያቆም ግፍያ ሰልፉ
ስትገለጥ ይፈፀማል የኛ ነው ማሸነፉ ፣
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 7
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 8
ህይወት አልባ ክርስትናን አልስጠህነምና
በዝቅታም በከፍታም ዘመርን በፈተና
ከሸለቆ ጥልቀት በላይ ስላለህ አለታችን በተከሻህ ተሻግራናል ገብተናል ከርስታችን ፣
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 9
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 10
ደመናዉን እያየነው አይደክምም ልቦናችን
በበረሃ መና አዝንበህ አይተንሃል በዓይናችን
በሚለወጥ በሁኔታ ዜማችንን አንቀይር
ሁሉም አልፎ ሁሉም ሄዶ ቀሪያችን ነህ እግዚአብሔር !!!

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 11
ህይወት አልባ ክርስትናን አልስጠህነምና
በዝቅታም በከፍታም ዘመርን በፈተና
ከሸለቆ ጥልቀት በላይ ስላለህ አለታችን በተከሻህ ተሻግራናል ገብተናል ከርስታችን ፣
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 12
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 1
Bewejebum alen zema Kristos silantema
Demenawun eyayenew aydekmm libonachn
Bebereha mena aznbeh aytenhal beaynachn
Bemilewet’ behuneta zemachnn anqeyr

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 2
Hulum alfo hulum hedo qeriyachn neh Egziabher !!!
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 3
Amlake anten mamen
Bewejebum alen zema Kristos silantema
Qestun alfo yitayenal yetezeregaw kindh
Kemot aynoch keflats’a kellonal mogesh

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 4
Yesheleqo fesash honen teramdenal begrma
Sayfets’m anwesed begna yalew alama ,
Yashagral yadnal anten mamen
Egziabher anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 5
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema
T’lqu bahr medrekachn wihaw segenet hono

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 6
Zemrenal beenba mehel libachn bante tamno
Eskememch’ah yiqet’lal bayaqom gifya selfu
Sitgelet’ yifets’emal yegna new mashenefu ,
Yashagral yadnal anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 7
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 8
Hiywet alba kirstnan alst’ehnemna
Bezqtam bekeftam zemern befetena
Kesheleqo t’lqet belay silaleh aletachn betekeshah teshagranal gebtenal kerstachn ,
Yashagral yadnal anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 9
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 10
Demenawun eyayenew aydekmm libonachn
Bebereha mena aznbeh aytenhal beaynachn
Bemilewet’ behuneta zemachnn anqeyr
Hulum alfo hulum hedo qeriyachn neh Egziabher !!!

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 11
Hiywet alba kirstnan alst’ehnemna
Bezqtam bekeftam zemern befetena
Kesheleqo t’lqet belay silaleh aletachn betekeshah teshagranal gebtenal kerstachn ,
Yashagral yadnal anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 12
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 1
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ደመናዉን እያየነው አይደክምም ልቦናችን
በበረሃ መና አዝንበህ አይተንሃል በዓይናችን
በሚለወጥ በሁኔታ ዜማችንን አንቀይር

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 2
ሁሉም አልፎ ሁሉም ሄዶ ቀሪያችን ነህ እግዚአብሔር !!!
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 3
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ቀስቱን አልፎ ይታየናል የተዘረጋው ክንድህ
ከሞት ዓይኖች ከፍላፃ ከልሎናል ሞገስህ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 4
የሸለቆ ፈሳሽ ሆነን ተራምደናል በግርማ
ሳይፈፅም አንወሰድ በኛ ያለው አላማ ፣
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 5
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ጥልቁ ባህር መድረካችን ውሃው ሰገነት ሆኖ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 6
ዘምረናል በእንባ መሐል ልባችን ባንተ ታምኖ
እስከመምጫህ ይቀጥላል ባያቆም ግፍያ ሰልፉ
ስትገለጥ ይፈፀማል የኛ ነው ማሸነፉ ፣
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 7
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 8
ህይወት አልባ ክርስትናን አልስጠህነምና
በዝቅታም በከፍታም ዘመርን በፈተና
ከሸለቆ ጥልቀት በላይ ስላለህ አለታችን በተከሻህ ተሻግራናል ገብተናል ከርስታችን ፣
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 9
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 10
ደመናዉን እያየነው አይደክምም ልቦናችን
በበረሃ መና አዝንበህ አይተንሃል በዓይናችን
በሚለወጥ በሁኔታ ዜማችንን አንቀይር
ሁሉም አልፎ ሁሉም ሄዶ ቀሪያችን ነህ እግዚአብሔር !!!

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 11
ህይወት አልባ ክርስትናን አልስጠህነምና
በዝቅታም በከፍታም ዘመርን በፈተና
ከሸለቆ ጥልቀት በላይ ስላለህ አለታችን በተከሻህ ተሻግራናል ገብተናል ከርስታችን ፣
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 12
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን',
        lyrics_transliteration = 'CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 1
Bewejebum alen zema Kristos silantema
Demenawun eyayenew aydekmm libonachn
Bebereha mena aznbeh aytenhal beaynachn
Bemilewet’ behuneta zemachnn anqeyr

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 2
Hulum alfo hulum hedo qeriyachn neh Egziabher !!!
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 3
Amlake anten mamen
Bewejebum alen zema Kristos silantema
Qestun alfo yitayenal yetezeregaw kindh
Kemot aynoch keflats’a kellonal mogesh

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 4
Yesheleqo fesash honen teramdenal begrma
Sayfets’m anwesed begna yalew alama ,
Yashagral yadnal anten mamen
Egziabher anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 5
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema
T’lqu bahr medrekachn wihaw segenet hono

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 6
Zemrenal beenba mehel libachn bante tamno
Eskememch’ah yiqet’lal bayaqom gifya selfu
Sitgelet’ yifets’emal yegna new mashenefu ,
Yashagral yadnal anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 7
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 8
Hiywet alba kirstnan alst’ehnemna
Bezqtam bekeftam zemern befetena
Kesheleqo t’lqet belay silaleh aletachn betekeshah teshagranal gebtenal kerstachn ,
Yashagral yadnal anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 9
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 10
Demenawun eyayenew aydekmm libonachn
Bebereha mena aznbeh aytenhal beaynachn
Bemilewet’ behuneta zemachnn anqeyr
Hulum alfo hulum hedo qeriyachn neh Egziabher !!!

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 11
Hiywet alba kirstnan alst’ehnemna
Bezqtam bekeftam zemern befetena
Kesheleqo t’lqet belay silaleh aletachn betekeshah teshagranal gebtenal kerstachn ,
Yashagral yadnal anten mamen

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 12
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema

CHORUS
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '374c413b-cc6b-47f8-be1b-abaa34044166'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 1
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ደመናዉን እያየነው አይደክምም ልቦናችን
በበረሃ መና አዝንበህ አይተንሃል በዓይናችን
በሚለወጥ በሁኔታ ዜማችንን አንቀይር

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 2
ሁሉም አልፎ ሁሉም ሄዶ ቀሪያችን ነህ እግዚአብሔር !!!
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 3
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ቀስቱን አልፎ ይታየናል የተዘረጋው ክንድህ
ከሞት ዓይኖች ከፍላፃ ከልሎናል ሞገስህ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 4
የሸለቆ ፈሳሽ ሆነን ተራምደናል በግርማ
ሳይፈፅም አንወሰድ በኛ ያለው አላማ ፣
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 5
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ጥልቁ ባህር መድረካችን ውሃው ሰገነት ሆኖ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 6
ዘምረናል በእንባ መሐል ልባችን ባንተ ታምኖ
እስከመምጫህ ይቀጥላል ባያቆም ግፍያ ሰልፉ
ስትገለጥ ይፈፀማል የኛ ነው ማሸነፉ ፣
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 7
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 8
ህይወት አልባ ክርስትናን አልስጠህነምና
በዝቅታም በከፍታም ዘመርን በፈተና
ከሸለቆ ጥልቀት በላይ ስላለህ አለታችን በተከሻህ ተሻግራናል ገብተናል ከርስታችን ፣
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 9
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 10
ደመናዉን እያየነው አይደክምም ልቦናችን
በበረሃ መና አዝንበህ አይተንሃል በዓይናችን
በሚለወጥ በሁኔታ ዜማችንን አንቀይር
ሁሉም አልፎ ሁሉም ሄዶ ቀሪያችን ነህ እግዚአብሔር !!!

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 11
ህይወት አልባ ክርስትናን አልስጠህነምና
በዝቅታም በከፍታም ዘመርን በፈተና
ከሸለቆ ጥልቀት በላይ ስላለህ አለታችን በተከሻህ ተሻግራናል ገብተናል ከርስታችን ፣
ያሻግራል ያድናል አንተን ማመን

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 12
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

CHORUS
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '374c413b-cc6b-47f8-be1b-abaa34044166'::uuid, 'yashagiral', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beegiziabiher-asab-yeteserach-emebetachin-menifesawit ("Beegiziabiher Asab Yeteserach Emebetachin Menifesawit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c2ab7289-d36b-4ea5-82d9-b46be078a34c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 1
ምክንያተ ድህነት አንቺ በመሆንሽ
የሲኦል ደጆችን ታንቀጠቅጪያለሽ
በአንቺ የተደረገው ይህ ታላቅ ምስጥር
አድርጎታልና ሰይጣንን እንዲያፍር

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 2
ስለሰዎች ፍቅር ልቦናሽ ያስባል
ዓለምን ለማዳን አጅሽ ይዘረጋል
በሲኦል አንድ ሰው እንዳይቀር በስቃይ
ለምሕረት ይዘርጋ እጅሽ ወደሰማይ

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 3
የሲኦል እሳቱን ስቃዩን አያየሽ
ለፍጥረታት ሁሉ ድንግል ሆይ ታዝኛለሽ
በአይነ ምህረቱ እንዲያየን ክርስቶስ
ለምኝልን ማርያም ፍጥረት እንዲቀደስ

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 4
እንደሚነገረው በአበው አንደበት
እኛም እንደምናውቅ ስንኖር በሕይወት
ወላዲተ አምላክ ሩኅሩኅ ፍጥረት ናት
ምሕረት የምትለምን ዘወትር ሳትታክት

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 5
በአግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 1
Miknyate dihnet anchi bemehonsh
Yesiol dejochn tanqet’eqch’iyalesh
Beanchi yetederegew yih talaq mist’r
Adrgotalna seyt’ann endiyafr

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 2
Silesewoch fiqr libonash yasbal
Alemn lemadan ajsh yizeregal
Besiol and sew endayqer besqay
Lemhret yizerga ejsh wedesemay

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 3
Yesiol esatun siqayun ayayesh
Left’retat hulu Dingil hoy tazgnalesh
Beayne mihretu endiyayen Kristos
Lemgnln Maryam fit’ret endiqedes

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 4
Endeminegerew beabew andebet
Egnam endemnawq sinnor behywet
Weladite amlak ruhruh fit’ret nat
Mihret yemtlemn zewetr sattakt

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 5
Beagziabher hasab yeteserach (2)
Emebetachen menfesawit

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 1
ምክንያተ ድህነት አንቺ በመሆንሽ
የሲኦል ደጆችን ታንቀጠቅጪያለሽ
በአንቺ የተደረገው ይህ ታላቅ ምስጥር
አድርጎታልና ሰይጣንን እንዲያፍር

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 2
ስለሰዎች ፍቅር ልቦናሽ ያስባል
ዓለምን ለማዳን አጅሽ ይዘረጋል
በሲኦል አንድ ሰው እንዳይቀር በስቃይ
ለምሕረት ይዘርጋ እጅሽ ወደሰማይ

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 3
የሲኦል እሳቱን ስቃዩን አያየሽ
ለፍጥረታት ሁሉ ድንግል ሆይ ታዝኛለሽ
በአይነ ምህረቱ እንዲያየን ክርስቶስ
ለምኝልን ማርያም ፍጥረት እንዲቀደስ

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 4
እንደሚነገረው በአበው አንደበት
እኛም እንደምናውቅ ስንኖር በሕይወት
ወላዲተ አምላክ ሩኅሩኅ ፍጥረት ናት
ምሕረት የምትለምን ዘወትር ሳትታክት

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 5
በአግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት',
        lyrics_transliteration = 'CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 1
Miknyate dihnet anchi bemehonsh
Yesiol dejochn tanqet’eqch’iyalesh
Beanchi yetederegew yih talaq mist’r
Adrgotalna seyt’ann endiyafr

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 2
Silesewoch fiqr libonash yasbal
Alemn lemadan ajsh yizeregal
Besiol and sew endayqer besqay
Lemhret yizerga ejsh wedesemay

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 3
Yesiol esatun siqayun ayayesh
Left’retat hulu Dingil hoy tazgnalesh
Beayne mihretu endiyayen Kristos
Lemgnln Maryam fit’ret endiqedes

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 4
Endeminegerew beabew andebet
Egnam endemnawq sinnor behywet
Weladite amlak ruhruh fit’ret nat
Mihret yemtlemn zewetr sattakt

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 5
Beagziabher hasab yeteserach (2)
Emebetachen menfesawit

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c2ab7289-d36b-4ea5-82d9-b46be078a34c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 1
ምክንያተ ድህነት አንቺ በመሆንሽ
የሲኦል ደጆችን ታንቀጠቅጪያለሽ
በአንቺ የተደረገው ይህ ታላቅ ምስጥር
አድርጎታልና ሰይጣንን እንዲያፍር

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 2
ስለሰዎች ፍቅር ልቦናሽ ያስባል
ዓለምን ለማዳን አጅሽ ይዘረጋል
በሲኦል አንድ ሰው እንዳይቀር በስቃይ
ለምሕረት ይዘርጋ እጅሽ ወደሰማይ

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 3
የሲኦል እሳቱን ስቃዩን አያየሽ
ለፍጥረታት ሁሉ ድንግል ሆይ ታዝኛለሽ
በአይነ ምህረቱ እንዲያየን ክርስቶስ
ለምኝልን ማርያም ፍጥረት እንዲቀደስ

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 4
እንደሚነገረው በአበው አንደበት
እኛም እንደምናውቅ ስንኖር በሕይወት
ወላዲተ አምላክ ሩኅሩኅ ፍጥረት ናት
ምሕረት የምትለምን ዘወትር ሳትታክት

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 5
በአግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c2ab7289-d36b-4ea5-82d9-b46be078a34c'::uuid, 'beegiziabiher-asab-yeteserach-emebetachin-menifesawit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eleni-nigist-haseset-meskelu ("Eleni Nigist Haseset Meskelu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c0281fc2-d60e-49b3-b9c5-1444ae7fe91b'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዕሌኒ ንግሥት ሐሰሰት መስቀሎ (፪)
እንባቆም ነቢይ ዘአንከረ ግብሮ (፪)

VERSE 1
ዕሌኒ ንግሥት ሐሰሰት መስቀሎ (፪)
እንባቆም ነቢይ ዘአንከረ ግብሮ (፪)

CHORUS
ዕሌኒ ንግሥት ሐሰሰት መስቀሎ (፪)
እንባቆም ነቢይ ዘአንከረ ግብሮ (፪)',
        lyrics_transliteration = 'CHORUS
Eleni nigist haseset meskelu (2)
Enbakom nebiye ze’ankere gibro (2)

VERSE 1
Eleni nigist haseset meskelu (2)
Enbakom nebiye ze’ankere gibro (2)

CHORUS
Eleni nigist haseset meskelu (2)
Enbakom nebiye ze’ankere gibro (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c0281fc2-d60e-49b3-b9c5-1444ae7fe91b'::uuid
      AND deleted_at IS NULL
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
Enbakom nebiye ze’ankere gibro (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c0281fc2-d60e-49b3-b9c5-1444ae7fe91b'::uuid, 'eleni-nigist-haseset-meskelu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- em-afe-deqiq ("Em Afe Deqiq")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '509c377c-df70-4d8d-bed0-ab1b8ad85f6c'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እም አፈ ደቂቅ ወሕፃናት አስተዳሎከ ስብሐተ (፪)
በእንተ ጸላዒ (፬) ከመ ትንሥቶ ለጸላዒ ወለገፋኢ (፪)

VERSE 1
እም አፈ ደቂቅ ወሕፃናት አስተዳሎከ ስብሐተ (፪)
በእንተ ጸላዒ (፬) ከመ ትንሥቶ ለጸላዒ ወለገፋኢ (፪)

CHORUS
እም አፈ ደቂቅ ወሕፃናት አስተዳሎከ ስብሐተ (፪)
በእንተ ጸላዒ (፬) ከመ ትንሥቶ ለጸላዒ ወለገፋኢ (፪)',
        lyrics_transliteration = 'CHORUS
em āfe dekīki weḥit͟sanat āsitedaloke sibiḥāte (2)
benite tselaī (4) keme tinisito letselaī welegefaī (2)

VERSE 1
em āfe dekīki weḥit͟sanat āsitedaloke sibiḥāte (2)
benite tselaī (4) keme tinisito letselaī welegefaī (2)

CHORUS
em āfe dekīki weḥit͟sanat āsitedaloke sibiḥāte (2)
benite tselaī (4) keme tinisito letselaī welegefaī (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '509c377c-df70-4d8d-bed0-ab1b8ad85f6c'::uuid
      AND deleted_at IS NULL
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
benite tselaī (4) keme tinisito letselaī welegefaī (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '509c377c-df70-4d8d-bed0-ab1b8ad85f6c'::uuid, 'em-afe-deqiq', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egiziabiher-egnan-sireda ("Egiziabiher Egnan Sireda")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '37fd5e50-af73-45b0-a8cd-5aef285b050b'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ይሆናል ተራራው ሜዳ(4)',
        lyrics_transliteration = 'CHORUS
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
Yihonal teraraw meda (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '37fd5e50-af73-45b0-a8cd-5aef285b050b'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '37fd5e50-af73-45b0-a8cd-5aef285b050b'::uuid, 'egiziabiher-egnan-sireda', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cana-of-galilee ("Cana of Galilee")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd2f61f0e-8050-4a7a-b6e4-51df41559afe'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 1
Invited were the crowds flooding through the foyer
Celebrating they ate emptied the wine chamber
Our Holy Virgin the Mother of our Lord
For your mediation it is you they implored

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 2
With you in attendance ashamed they will not feel
Nothing is beneath you fill with wine their barrel
“They have no wine” you said to your son our Lord
It is our Mother we cherish and adore

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 3
Divinity of Lord that was unveiled to us
How fortunate it was the house of Dokimas
And today in the home of this grand unity
Blessings have spilled to us, with His humility

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 4
Transfigured was the wine when it was just water
In Cana Galilee our eyes did not falter
If we ensure that He remains within our midst
Good wine will overflow as written in the scripts

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 1
Invited were the crowds flooding through the foyer
Celebrating they ate emptied the wine chamber
Our Holy Virgin the Mother of our Lord
For your mediation it is you they implored

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 2
With you in attendance ashamed they will not feel
Nothing is beneath you fill with wine their barrel
“They have no wine” you said to your son our Lord
It is our Mother we cherish and adore

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 3
Divinity of Lord that was unveiled to us
How fortunate it was the house of Dokimas
And today in the home of this grand unity
Blessings have spilled to us, with His humility

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 4
Transfigured was the wine when it was just water
In Cana Galilee our eyes did not falter
If we ensure that He remains within our midst
Good wine will overflow as written in the scripts

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd2f61f0e-8050-4a7a-b6e4-51df41559afe'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 1
Invited were the crowds flooding through the foyer
Celebrating they ate emptied the wine chamber
Our Holy Virgin the Mother of our Lord
For your mediation it is you they implored

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 2
With you in attendance ashamed they will not feel
Nothing is beneath you fill with wine their barrel
“They have no wine” you said to your son our Lord
It is our Mother we cherish and adore

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 3
Divinity of Lord that was unveiled to us
How fortunate it was the house of Dokimas
And today in the home of this grand unity
Blessings have spilled to us, with His humility

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 4
Transfigured was the wine when it was just water
In Cana Galilee our eyes did not falter
If we ensure that He remains within our midst
Good wine will overflow as written in the scripts

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd2f61f0e-8050-4a7a-b6e4-51df41559afe'::uuid, 'cana-of-galilee', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- qirqos-iyelutan ("Selestun Dekikan")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2daa446c-dcc8-432c-bdcc-581fad2b620f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።

VERSE 1
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።

CHORUS
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt

VERSE 1
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt

CHORUS
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።

VERSE 1
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።

CHORUS
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።',
        lyrics_transliteration = 'CHORUS
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt

VERSE 1
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt

CHORUS
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2daa446c-dcc8-432c-bdcc-581fad2b620f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።

VERSE 1
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።

CHORUS
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt

VERSE 1
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt

CHORUS
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2daa446c-dcc8-432c-bdcc-581fad2b620f'::uuid, 'qirqos-iyelutan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eme-amlak-asbign-be-serk ("Eme Amlak Asbign Be-Serk")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7c413789-9843-4010-8907-ed6785e3b24d'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አስቢኝ በሰርክ',
        lyrics_transliteration = 'CHORUS
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
Asbiggn be-serk',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7c413789-9843-4010-8907-ed6785e3b24d'::uuid
      AND deleted_at IS NULL
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
Asbiggn be-serk';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7c413789-9843-4010-8907-ed6785e3b24d'::uuid, 'eme-amlak-asbign-be-serk', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-3146 ("Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd12e17ba-8234-48a6-bfe4-11e6827b61ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 1
ክንድይ ክይጽንሓካ ልበይ ብጽፋፉ ዕላሙኡ ተስፍዩ
ጠቐር መሊኡዎ ኣብኡ''ሎ ተድርቢዪ
ክንድይ ክይጽንሓካ ኩስትር ምድሪ ቤቱ ሰቲ ትነስነሶ
ምኡዝ ቅድይ ቅቢኢ ሽቶ ዝፈስሶ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 2
መን ኣለኒ''ዩ እሞ ገጹ ዝመልስለይ ብግዜ ጽበባ
ነብስይ ዝቅብላ ምስ ስበባ
መን ኣለኒ''ዩ እሞ ንጉስ እንክንሱ በዓል ዓቢ ግርማ
ክውልድ ኣብኣ''ሉ ልበይ ዝስልማ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 3
ክድምቕ ብርሃነይ ከምቲ ኮኸብ ጽባሕ ስሉም ግርማ ስማይ
ውርትብ ብስራቱ ቅደድ ብራቕ ጻሓይ
ክድምቕ ብርሃነይ ከምቲ ጻሓይ ብራቕ ዘብህግ ትርኢታ
ኣይድብዝዝ ኣይሃስስ ኣየው ምልታ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 4
ተወለድ ኣብ ልበይ ክኸውን ባርያኻ እምነት ዝጽገዎ
ልበይ ከይስልከየ ቃልካ ክረርዎ
ተወለድ ኣብ ልበይ ቃልካ ትምድሓኒ ክኸውን መዝሙረይ
ፍቅሪ ምስ ተስፋኣ ክመልኦ ንልበይ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 5
ምኻንካ እፈልጥ''የ ዝድነነት ልቢ ንስኻ ተቅንዓ
ዝተስድት ንፋሲ ምኻንካ ዑቅባኣ
ምኻንካ እፍልጥ''የ ህያዉ ብዘለዎ ጽጋካ የጽግቦ
ሽጉር ብዙርያኡ ምሕረትክ ይኸቦ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 6
ከመይ''ለ ትም ክብል ምናድቐይ ከሎ ብኻረት ተኻንዩ
ሓስባይ ዘበለ ብክፋእ ተነንዩ
ከመይ''ለ ትም ክበይ ከም ብዝሒ ምሕረትካ ስምዓኒ ጸሎተይ
መብልዕ ማል ይኹንካ ተወለድ ኣብ ልበይ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 7
(2)

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 1
Kindy kiyts’nhaka libey bits’fafu elamuu tesfyu
T’eቐr meliuwo abu''lo tedrbiyi
Kindy kiyts’nhaka kustr midri betu seti tinesneso
Miuz qidy qibii shto zifesso

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 2
Men aleni''yu emo gets’u zimelsley bigze ts’beba
Nebsy ziqbla mis sibeba
Men aleni''yu emo nigus enknsu beal abi girma
Kiwld aba''lu libey zislma

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 3
Kidmቕ birhaney kemti koኸb ts’bah silum girma simay
Wirtb bisratu qided biraቕ ts’ahay
Kidmቕ birhaney kemti ts’ahay biraቕ zebhg tirita
Aydbzz ayhass ayew milta

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 4
Teweled ab libey kiኸwn baryaኻ emnet zits’gewo
Libey keyslkeye qalka kirerwo
Teweled ab libey qalka timdhani kiኸwn mezmurey
Fiqri mis tesfaa kimelo nilbey

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 5
Miኻnka efelt’''ye zidnenet libi nisኻ teqna
Zitesdt nifasi miኻnka uqbaa
Miኻnka eflt’''ye hiyawu bizelewo ts’gaka yets’gbo
Shgur bizuryau mihretk yiኸbo

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 6
Kemey''le tim kibl minadቐy kelo biኻret teኻnyu
Hasbay zebele bikfae tenenyu
Kemey''le tim kibey kem bizhi mihretka simani ts’elotey
Meble mal yiኹnka teweled ab libey

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 7
 (2)

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 1
ክንድይ ክይጽንሓካ ልበይ ብጽፋፉ ዕላሙኡ ተስፍዩ
ጠቐር መሊኡዎ ኣብኡ''ሎ ተድርቢዪ
ክንድይ ክይጽንሓካ ኩስትር ምድሪ ቤቱ ሰቲ ትነስነሶ
ምኡዝ ቅድይ ቅቢኢ ሽቶ ዝፈስሶ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 2
መን ኣለኒ''ዩ እሞ ገጹ ዝመልስለይ ብግዜ ጽበባ
ነብስይ ዝቅብላ ምስ ስበባ
መን ኣለኒ''ዩ እሞ ንጉስ እንክንሱ በዓል ዓቢ ግርማ
ክውልድ ኣብኣ''ሉ ልበይ ዝስልማ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 3
ክድምቕ ብርሃነይ ከምቲ ኮኸብ ጽባሕ ስሉም ግርማ ስማይ
ውርትብ ብስራቱ ቅደድ ብራቕ ጻሓይ
ክድምቕ ብርሃነይ ከምቲ ጻሓይ ብራቕ ዘብህግ ትርኢታ
ኣይድብዝዝ ኣይሃስስ ኣየው ምልታ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 4
ተወለድ ኣብ ልበይ ክኸውን ባርያኻ እምነት ዝጽገዎ
ልበይ ከይስልከየ ቃልካ ክረርዎ
ተወለድ ኣብ ልበይ ቃልካ ትምድሓኒ ክኸውን መዝሙረይ
ፍቅሪ ምስ ተስፋኣ ክመልኦ ንልበይ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 5
ምኻንካ እፈልጥ''የ ዝድነነት ልቢ ንስኻ ተቅንዓ
ዝተስድት ንፋሲ ምኻንካ ዑቅባኣ
ምኻንካ እፍልጥ''የ ህያዉ ብዘለዎ ጽጋካ የጽግቦ
ሽጉር ብዙርያኡ ምሕረትክ ይኸቦ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 6
ከመይ''ለ ትም ክብል ምናድቐይ ከሎ ብኻረት ተኻንዩ
ሓስባይ ዘበለ ብክፋእ ተነንዩ
ከመይ''ለ ትም ክበይ ከም ብዝሒ ምሕረትካ ስምዓኒ ጸሎተይ
መብልዕ ማል ይኹንካ ተወለድ ኣብ ልበይ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 7
(2)

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ',
        lyrics_transliteration = 'CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 1
Kindy kiyts’nhaka libey bits’fafu elamuu tesfyu
T’eቐr meliuwo abu''lo tedrbiyi
Kindy kiyts’nhaka kustr midri betu seti tinesneso
Miuz qidy qibii shto zifesso

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 2
Men aleni''yu emo gets’u zimelsley bigze ts’beba
Nebsy ziqbla mis sibeba
Men aleni''yu emo nigus enknsu beal abi girma
Kiwld aba''lu libey zislma

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 3
Kidmቕ birhaney kemti koኸb ts’bah silum girma simay
Wirtb bisratu qided biraቕ ts’ahay
Kidmቕ birhaney kemti ts’ahay biraቕ zebhg tirita
Aydbzz ayhass ayew milta

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 4
Teweled ab libey kiኸwn baryaኻ emnet zits’gewo
Libey keyslkeye qalka kirerwo
Teweled ab libey qalka timdhani kiኸwn mezmurey
Fiqri mis tesfaa kimelo nilbey

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 5
Miኻnka efelt’''ye zidnenet libi nisኻ teqna
Zitesdt nifasi miኻnka uqbaa
Miኻnka eflt’''ye hiyawu bizelewo ts’gaka yets’gbo
Shgur bizuryau mihretk yiኸbo

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 6
Kemey''le tim kibl minadቐy kelo biኻret teኻnyu
Hasbay zebele bikfae tenenyu
Kemey''le tim kibey kem bizhi mihretka simani ts’elotey
Meble mal yiኹnka teweled ab libey

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 7
 (2)

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd12e17ba-8234-48a6-bfe4-11e6827b61ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 1
ክንድይ ክይጽንሓካ ልበይ ብጽፋፉ ዕላሙኡ ተስፍዩ
ጠቐር መሊኡዎ ኣብኡ''ሎ ተድርቢዪ
ክንድይ ክይጽንሓካ ኩስትር ምድሪ ቤቱ ሰቲ ትነስነሶ
ምኡዝ ቅድይ ቅቢኢ ሽቶ ዝፈስሶ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 2
መን ኣለኒ''ዩ እሞ ገጹ ዝመልስለይ ብግዜ ጽበባ
ነብስይ ዝቅብላ ምስ ስበባ
መን ኣለኒ''ዩ እሞ ንጉስ እንክንሱ በዓል ዓቢ ግርማ
ክውልድ ኣብኣ''ሉ ልበይ ዝስልማ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 3
ክድምቕ ብርሃነይ ከምቲ ኮኸብ ጽባሕ ስሉም ግርማ ስማይ
ውርትብ ብስራቱ ቅደድ ብራቕ ጻሓይ
ክድምቕ ብርሃነይ ከምቲ ጻሓይ ብራቕ ዘብህግ ትርኢታ
ኣይድብዝዝ ኣይሃስስ ኣየው ምልታ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 4
ተወለድ ኣብ ልበይ ክኸውን ባርያኻ እምነት ዝጽገዎ
ልበይ ከይስልከየ ቃልካ ክረርዎ
ተወለድ ኣብ ልበይ ቃልካ ትምድሓኒ ክኸውን መዝሙረይ
ፍቅሪ ምስ ተስፋኣ ክመልኦ ንልበይ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 5
ምኻንካ እፈልጥ''የ ዝድነነት ልቢ ንስኻ ተቅንዓ
ዝተስድት ንፋሲ ምኻንካ ዑቅባኣ
ምኻንካ እፍልጥ''የ ህያዉ ብዘለዎ ጽጋካ የጽግቦ
ሽጉር ብዙርያኡ ምሕረትክ ይኸቦ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 6
ከመይ''ለ ትም ክብል ምናድቐይ ከሎ ብኻረት ተኻንዩ
ሓስባይ ዘበለ ብክፋእ ተነንዩ
ከመይ''ለ ትም ክበይ ከም ብዝሒ ምሕረትካ ስምዓኒ ጸሎተይ
መብልዕ ማል ይኹንካ ተወለድ ኣብ ልበይ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 7
(2)

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd12e17ba-8234-48a6-bfe4-11e6827b61ec'::uuid, 'eritrean-orthodox-tewahdo-mezmur-3146', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yikerta ("Yikerta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '39e4a84f-bb0e-416f-a6bd-7d3d7366f44c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 1
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 2
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 3
ጥሪውን ሳልሰማ ጆሮየን ደፍኜ
ለምጠፋው ዓለም ተሸነፍኩ በፍቅሯ መንኜ
ብዙ ዘመን ርቄ አምላኬ ጠፍቻለሁና
ከመንጋህ ቀላቅለኝ ይቅር በለኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 4
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 5
ስለ ክፉ ፈንታ ለልጅህ በጎን አድርገህ
አጥብቄ ስሸሽህ ፈለከኝ አጥብቀህ
የማይበርደው ፍቅርህ አባቴ ዛሬም ይሞቀኛል
እንዲህ ያለ ወዳጅ አምላኬ ከወዴት ይገኛል

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 6
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 7
በትርህ ፍቅር ነው ልብን የሚመታ
ስበድል ለኖርኩት ቁጣህም ዝምታ
አሁን ተቀበለኝ በፍቅርህ ማርከኸኛልና
አባቴ ልበልህ ፍቀድልኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 8
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 1
Alefegn bekentu zemene bewaza
Bezih alem fiqr getaye bemgnot denzza
Jenberwa zeqzqa qenu eyemeshe new
Anqagn mushraye getaye meqreze bado new

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 2
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 3
T’riwn salsema joroyen defgne
Lemt’efaw alem teshenefku befqrwa mengne
Bizu zemen riqe amlake t’efchalehuna
Kemengah qelaqlegn yiqr belegnna

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 4
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 5
Sile kifu fenta leljh begon adrgeh
At’bqe sisheshh felekegn at’bqeh
Yemayberdew fiqrh abate zarem yimoqegnal
Endih yale wedaj amlake kewedet yigegnal

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 6
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 7
Betrh fiqr new libn yemimeta
Sibedl lenorkut qut’ahm zimta
Ahun teqebelegn befqrh markeኸgnalna
Abate libelh fiqedlgnna

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 8
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 1
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 2
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 3
ጥሪውን ሳልሰማ ጆሮየን ደፍኜ
ለምጠፋው ዓለም ተሸነፍኩ በፍቅሯ መንኜ
ብዙ ዘመን ርቄ አምላኬ ጠፍቻለሁና
ከመንጋህ ቀላቅለኝ ይቅር በለኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 4
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 5
ስለ ክፉ ፈንታ ለልጅህ በጎን አድርገህ
አጥብቄ ስሸሽህ ፈለከኝ አጥብቀህ
የማይበርደው ፍቅርህ አባቴ ዛሬም ይሞቀኛል
እንዲህ ያለ ወዳጅ አምላኬ ከወዴት ይገኛል

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 6
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 7
በትርህ ፍቅር ነው ልብን የሚመታ
ስበድል ለኖርኩት ቁጣህም ዝምታ
አሁን ተቀበለኝ በፍቅርህ ማርከኸኛልና
አባቴ ልበልህ ፍቀድልኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 8
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ',
        lyrics_transliteration = 'CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 1
Alefegn bekentu zemene bewaza
Bezih alem fiqr getaye bemgnot denzza
Jenberwa zeqzqa qenu eyemeshe new
Anqagn mushraye getaye meqreze bado new

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 2
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 3
T’riwn salsema joroyen defgne
Lemt’efaw alem teshenefku befqrwa mengne
Bizu zemen riqe amlake t’efchalehuna
Kemengah qelaqlegn yiqr belegnna

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 4
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 5
Sile kifu fenta leljh begon adrgeh
At’bqe sisheshh felekegn at’bqeh
Yemayberdew fiqrh abate zarem yimoqegnal
Endih yale wedaj amlake kewedet yigegnal

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 6
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 7
Betrh fiqr new libn yemimeta
Sibedl lenorkut qut’ahm zimta
Ahun teqebelegn befqrh markeኸgnalna
Abate libelh fiqedlgnna

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 8
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '39e4a84f-bb0e-416f-a6bd-7d3d7366f44c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 1
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 2
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 3
ጥሪውን ሳልሰማ ጆሮየን ደፍኜ
ለምጠፋው ዓለም ተሸነፍኩ በፍቅሯ መንኜ
ብዙ ዘመን ርቄ አምላኬ ጠፍቻለሁና
ከመንጋህ ቀላቅለኝ ይቅር በለኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 4
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 5
ስለ ክፉ ፈንታ ለልጅህ በጎን አድርገህ
አጥብቄ ስሸሽህ ፈለከኝ አጥብቀህ
የማይበርደው ፍቅርህ አባቴ ዛሬም ይሞቀኛል
እንዲህ ያለ ወዳጅ አምላኬ ከወዴት ይገኛል

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 6
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 7
በትርህ ፍቅር ነው ልብን የሚመታ
ስበድል ለኖርኩት ቁጣህም ዝምታ
አሁን ተቀበለኝ በፍቅርህ ማርከኸኛልና
አባቴ ልበልህ ፍቀድልኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 8
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '39e4a84f-bb0e-416f-a6bd-7d3d7366f44c'::uuid, 'yikerta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gebremenfes-kidus-yealem-birhan ("Gebre Menfes Kidus Ye’Alem Birhan Natchew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9e940a92-8a99-4ec4-9b70-cc54270c4752'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 1
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘለለም ያበራል ስራቸው (2)

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 2
ነቅዓ በረከት ነህ ገብረመንፈስ ቅዱስ
የፅድቅ ሐወርያ የኢየሱስ ክርስቶስ
መልአኩ ገብርኤል መንገዱ እያሳየህ
በተጋድሎ ዘመን ካንተ መቸ ተለየ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 3
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 4
በእግዝአብሄር ተመረጥክ ገና በማህፀን
ገብረመንፈስ ቅዱስ ፃድቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ ኣንተን ወለዱና

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 5
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 6
ተጋድለው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዝአብሄር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አልለበሰም

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 7
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 8
ገብረመንፈስ ቅዱስ ያበራል ተጋድሎው
ሃይልንም ያድርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ
ከእግረቹ ትቢያ በልተው ይጠግባሉ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 9
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 10
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ
ከአምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 11
ገብረመንፈሥ ቅዱሥ የዓለም ብርሃን ናቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 12
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 1
Yihaw lezelalem yaberal sratchew
Yihaw lezelelem yaberal sratchew (2)

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 2
Neqa bereket neh Gebre Menfes Kidus
Ye-tsedeq hawarya ye-Iyesus Kristos
Melaku Gebriel mengedu iyasayeh
Be-tegadlo zemen kante meche teleye

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 3
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 4
Be-egziabher temereTik gena be-mahtsen
Gebre Menfes Kidus tsadqu abatachen
Ye-enat abatih miljana limena
Fits’ame agenye anta weleduna

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 5
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 6
Tegadlew dink new ts’nsetu ledetu
Be-egziabher fit kibur new ereftu
Midrawiw migib andach alkemesem
Be-sew yetesefa libs’m allebesem

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 7
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 8
Gebre Menfes Kidus yaberal tegadlow
Haylnm yadergal tselotna miljaw
Anabst anabert iyeteketelu
Ke-egrech’u tinbiya beltew yitegabal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 9
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 10
Zarem benya zemen be-emnet be-tsebelu
Ke-hmemu alga sentu qena alu
Ke-amlak yetesetew qal-kidanu ts’nu
Bereket yadelal be-miljaw yamenu

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 11
Gebre Menfes Kidus ye’alem birhan natchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 12
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 1
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘለለም ያበራል ስራቸው (2)

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 2
ነቅዓ በረከት ነህ ገብረመንፈስ ቅዱስ
የፅድቅ ሐወርያ የኢየሱስ ክርስቶስ
መልአኩ ገብርኤል መንገዱ እያሳየህ
በተጋድሎ ዘመን ካንተ መቸ ተለየ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 3
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 4
በእግዝአብሄር ተመረጥክ ገና በማህፀን
ገብረመንፈስ ቅዱስ ፃድቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ ኣንተን ወለዱና

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 5
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 6
ተጋድለው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዝአብሄር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አልለበሰም

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 7
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 8
ገብረመንፈስ ቅዱስ ያበራል ተጋድሎው
ሃይልንም ያድርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ
ከእግረቹ ትቢያ በልተው ይጠግባሉ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 9
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 10
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ
ከአምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 11
ገብረመንፈሥ ቅዱሥ የዓለም ብርሃን ናቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 12
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)',
        lyrics_transliteration = 'CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 1
Yihaw lezelalem yaberal sratchew
Yihaw lezelelem yaberal sratchew (2)

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 2
Neqa bereket neh Gebre Menfes Kidus
Ye-tsedeq hawarya ye-Iyesus Kristos
Melaku Gebriel mengedu iyasayeh
Be-tegadlo zemen kante meche teleye

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 3
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 4
Be-egziabher temereTik gena be-mahtsen
Gebre Menfes Kidus tsadqu abatachen
Ye-enat abatih miljana limena
Fits’ame agenye anta weleduna

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 5
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 6
Tegadlew dink new ts’nsetu ledetu
Be-egziabher fit kibur new ereftu
Midrawiw migib andach alkemesem
Be-sew yetesefa libs’m allebesem

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 7
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 8
Gebre Menfes Kidus yaberal tegadlow
Haylnm yadergal tselotna miljaw
Anabst anabert iyeteketelu
Ke-egrech’u tinbiya beltew yitegabal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 9
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 10
Zarem benya zemen be-emnet be-tsebelu
Ke-hmemu alga sentu qena alu
Ke-amlak yetesetew qal-kidanu ts’nu
Bereket yadelal be-miljaw yamenu

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 11
Gebre Menfes Kidus ye’alem birhan natchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 12
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9e940a92-8a99-4ec4-9b70-cc54270c4752'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 1
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘለለም ያበራል ስራቸው (2)

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 2
ነቅዓ በረከት ነህ ገብረመንፈስ ቅዱስ
የፅድቅ ሐወርያ የኢየሱስ ክርስቶስ
መልአኩ ገብርኤል መንገዱ እያሳየህ
በተጋድሎ ዘመን ካንተ መቸ ተለየ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 3
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 4
በእግዝአብሄር ተመረጥክ ገና በማህፀን
ገብረመንፈስ ቅዱስ ፃድቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ ኣንተን ወለዱና

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 5
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 6
ተጋድለው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዝአብሄር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አልለበሰም

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 7
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 8
ገብረመንፈስ ቅዱስ ያበራል ተጋድሎው
ሃይልንም ያድርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ
ከእግረቹ ትቢያ በልተው ይጠግባሉ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 9
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 10
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ
ከአምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 11
ገብረመንፈሥ ቅዱሥ የዓለም ብርሃን ናቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 12
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 1
Yihaw lezelalem yaberal sratchew
Yihaw lezelelem yaberal sratchew (2)

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 2
Neqa bereket neh Gebre Menfes Kidus
Ye-tsedeq hawarya ye-Iyesus Kristos
Melaku Gebriel mengedu iyasayeh
Be-tegadlo zemen kante meche teleye

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 3
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 4
Be-egziabher temereTik gena be-mahtsen
Gebre Menfes Kidus tsadqu abatachen
Ye-enat abatih miljana limena
Fits’ame agenye anta weleduna

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 5
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 6
Tegadlew dink new ts’nsetu ledetu
Be-egziabher fit kibur new ereftu
Midrawiw migib andach alkemesem
Be-sew yetesefa libs’m allebesem

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 7
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 8
Gebre Menfes Kidus yaberal tegadlow
Haylnm yadergal tselotna miljaw
Anabst anabert iyeteketelu
Ke-egrech’u tinbiya beltew yitegabal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 9
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 10
Zarem benya zemen be-emnet be-tsebelu
Ke-hmemu alga sentu qena alu
Ke-amlak yetesetew qal-kidanu ts’nu
Bereket yadelal be-miljaw yamenu

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 11
Gebre Menfes Kidus ye’alem birhan natchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 12
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9e940a92-8a99-4ec4-9b70-cc54270c4752'::uuid, 'gebremenfes-kidus-yealem-birhan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eyesus-tewelidu-gena-mezmur-eritrean-orthodox-mezmur-zemari-bereket-tiku ("Eyesus tewelidu / / Gena mezmur / Eritrean orthodox mezmur / zemari Bereket Tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3cb2c3f0-4b81-47de-ae6d-8d50f7def422'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 1
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 2
አብ ጸልማት ዝነብር ህዝቢ ዐብዪ ብርሃን ረአየ
አብ ዓዲ ሞትን ድኔአን መንግስቲ አምላኽ ተወርየ
አሰይ ተወሊዱልና ብሩኽ ሕጻን
ወድ’ቲ ልዑል አምላኽ በዐል ስልጣን /2/

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 3
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 4
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 1
Niኸbid ts’or hat’iatna niኸቕll
Ab meble mal tewelde Amanuel (2)
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 2
Ab ts’elmat zinebr hizbi abyi birhan reaye
Ab adi motn dinean mengsti amlaኽ tewerye
Asey tewelidulna biruኽ hits’an
Wed’ti liul amlaኽ beal silt’an (2)

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 3
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke barya wesidu gezae riesu win ahsere

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 4
Niኸbid ts’or hat’iatna niኸቕll
Ab meble mal tewelde Amanuel (2)
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 1
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 2
አብ ጸልማት ዝነብር ህዝቢ ዐብዪ ብርሃን ረአየ
አብ ዓዲ ሞትን ድኔአን መንግስቲ አምላኽ ተወርየ
አሰይ ተወሊዱልና ብሩኽ ሕጻን
ወድ’ቲ ልዑል አምላኽ በዐል ስልጣን /2/

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 3
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 4
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ',
        lyrics_transliteration = 'CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 1
Niኸbid ts’or hat’iatna niኸቕll
Ab meble mal tewelde Amanuel (2)
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 2
Ab ts’elmat zinebr hizbi abyi birhan reaye
Ab adi motn dinean mengsti amlaኽ tewerye
Asey tewelidulna biruኽ hits’an
Wed’ti liul amlaኽ beal silt’an (2)

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 3
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke barya wesidu gezae riesu win ahsere

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 4
Niኸbid ts’or hat’iatna niኸቕll
Ab meble mal tewelde Amanuel (2)
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3cb2c3f0-4b81-47de-ae6d-8d50f7def422'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 1
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 2
አብ ጸልማት ዝነብር ህዝቢ ዐብዪ ብርሃን ረአየ
አብ ዓዲ ሞትን ድኔአን መንግስቲ አምላኽ ተወርየ
አሰይ ተወሊዱልና ብሩኽ ሕጻን
ወድ’ቲ ልዑል አምላኽ በዐል ስልጣን /2/

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 3
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 4
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3cb2c3f0-4b81-47de-ae6d-8d50f7def422'::uuid, 'eyesus-tewelidu-gena-mezmur-eritrean-orthodox-mezmur-zemari-bereket-tiku', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enat-alegn-yemitabbs-enba ("Enat Alegn Yemitabbs Enba")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fb213dbd-1ad0-4914-ab88-b3be1ceb3e0e'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ኪዳነምረት /3/ አምባ መጠጊያ ናት',
        lyrics_transliteration = 'CHORUS
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
Kidane Meheret (x3) amba metogiya nat',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fb213dbd-1ad0-4914-ab88-b3be1ceb3e0e'::uuid
      AND deleted_at IS NULL
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
Kidane Meheret (x3) amba metogiya nat';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fb213dbd-1ad0-4914-ab88-b3be1ceb3e0e'::uuid, 'enat-alegn-yemitabbs-enba', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemarit-lemlem-kebede-adanegn-geta-adanegne ("+++ /Zemarit Lemlem Kebede adanegn Geta adanegne")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3a236e9c-c068-4c02-8226-397496a47784'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በእንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
ከእንግዲህ ላንተ ምስክር ሆኛለሁ
ስራህን ለአለም ሁሌም እነግራለሁ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
በእጅህ ወዴቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 3
የሃዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ እድሜ ጨመረሰክልኝ
ከአልጋየ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህርትህ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ህይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብርህ መዝገብ በእጅህ ተጽፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 5
የሃሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሰንሰለቱ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 6
በሃማ መስቀል መርደቀክዮስ የለም
የናቁት ሄደ በከንቱ አልቀርም
የእውነት ዳኛ ጌታ ስትመጣ
የሃሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Keengdih lante miskr hognalehu
Sirahn lealem hulem enegralehu[2]

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Beejh wedeqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 3
Yehazenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emereseklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhrth[2]

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbrh mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 5
Yehasetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu[2]

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 6
Behama mesqel merdeqekyos yelem
Yenaqut hede bekentu alqerm
Yeewnet dagna Geta sitmet’a
Yehasetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በእንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
ከእንግዲህ ላንተ ምስክር ሆኛለሁ
ስራህን ለአለም ሁሌም እነግራለሁ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
በእጅህ ወዴቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 3
የሃዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ እድሜ ጨመረሰክልኝ
ከአልጋየ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህርትህ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ህይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብርህ መዝገብ በእጅህ ተጽፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 5
የሃሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሰንሰለቱ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 6
በሃማ መስቀል መርደቀክዮስ የለም
የናቁት ሄደ በከንቱ አልቀርም
የእውነት ዳኛ ጌታ ስትመጣ
የሃሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ',
        lyrics_transliteration = 'CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Keengdih lante miskr hognalehu
Sirahn lealem hulem enegralehu[2]

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Beejh wedeqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 3
Yehazenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emereseklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhrth[2]

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbrh mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 5
Yehasetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu[2]

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 6
Behama mesqel merdeqekyos yelem
Yenaqut hede bekentu alqerm
Yeewnet dagna Geta sitmet’a
Yehasetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3a236e9c-c068-4c02-8226-397496a47784'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በእንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
ከእንግዲህ ላንተ ምስክር ሆኛለሁ
ስራህን ለአለም ሁሌም እነግራለሁ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
በእጅህ ወዴቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 3
የሃዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ እድሜ ጨመረሰክልኝ
ከአልጋየ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህርትህ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ህይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብርህ መዝገብ በእጅህ ተጽፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 5
የሃሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሰንሰለቱ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 6
በሃማ መስቀል መርደቀክዮስ የለም
የናቁት ሄደ በከንቱ አልቀርም
የእውነት ዳኛ ጌታ ስትመጣ
የሃሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3a236e9c-c068-4c02-8226-397496a47784'::uuid, 'zemarit-lemlem-kebede-adanegn-geta-adanegne', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- belelit-mezimur-yesetehegn ("Belelit Mezimur Yesetehegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ccce4d5e-56df-4bb9-a5d7-494fa227ea32'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 1
ማለዳ ከእንቅልፌ ስነቃ
እንድሆን የክብህ ምርጥ እቃ
ልትሰራ በእኔ በባሪያህ
በቃልህ ውስጤን አበራህ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 2
የትናንት የያዘኝ ቀንበር
ዛሬ ላይ የለም ክፉው ምክር
ለምልሟል የልቤ በረሃ
ተረጭቶ ልቤ ጥሩ ውሃ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 3
ወጋግኗል የፅልመቱ ኑሮ
ህይወቴ ልቤ አንተን አክብሮ
ማጉረምረም የለም በአንደበቴ
ስላለህ ኢየሱስ በቤቴ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 4
ደስታ ነው የፍስሃ ዘመን
መች ያፍራል ባንተ የሚታመን
ትካዜ ልቅሶው ተወግዷል
ማመስገን ህይወታችን ሆኗል

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 5
ከዚያኛት ከጨለማው ወራት
ጎትተህ ጠርተኸኝ ለምህረት
ዝምታን ለምን እሺ እላለሁ
ፅድቅህን ማምለጤን እያየሁ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 6
አንተማ ትለያለህ ለእኔ
የዜማ ባንተ ሆኗል ቀኔ
ቢሆንም ባይሆንም ከእንግዲህ
አልውልም በዜማ ሳልጠራህ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 1
Maleda keenqlfe sineqa
Endhon yekbh mirt’ eqa
Litsera beene bebariyah
Beqalh wist’en aberah

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 2
Yetnant yeyazegn qenber
Zare lay yelem kifuw mikr
Lemlmwal yelbe bereha
Terech’to libe t’ru wiha

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 3
Wegagnwal yets’lmetu nuro
Hiywete libe anten akbro
Maguremrem yelem beandebete
Silaleh Iyesus bebete

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 4
Desta new yefsha zemen
Mech yafral bante yemitamen
Tikaze liqsow tewegdwal
Mamesgen hiywetachn honwal

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 5
Keziyagnat kech’elemaw werat
Gotteh t’erteኸgn lemhret
Zimtan lemn eshi elalehu
Ts’dqhn mamlet’en eyayehu

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 6
Antema tileyaleh leene
Yezema bante honwal qene
Bihonm bayhonm keengdih
Alwlm bezema salt’erah

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 1
ማለዳ ከእንቅልፌ ስነቃ
እንድሆን የክብህ ምርጥ እቃ
ልትሰራ በእኔ በባሪያህ
በቃልህ ውስጤን አበራህ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 2
የትናንት የያዘኝ ቀንበር
ዛሬ ላይ የለም ክፉው ምክር
ለምልሟል የልቤ በረሃ
ተረጭቶ ልቤ ጥሩ ውሃ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 3
ወጋግኗል የፅልመቱ ኑሮ
ህይወቴ ልቤ አንተን አክብሮ
ማጉረምረም የለም በአንደበቴ
ስላለህ ኢየሱስ በቤቴ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 4
ደስታ ነው የፍስሃ ዘመን
መች ያፍራል ባንተ የሚታመን
ትካዜ ልቅሶው ተወግዷል
ማመስገን ህይወታችን ሆኗል

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 5
ከዚያኛት ከጨለማው ወራት
ጎትተህ ጠርተኸኝ ለምህረት
ዝምታን ለምን እሺ እላለሁ
ፅድቅህን ማምለጤን እያየሁ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 6
አንተማ ትለያለህ ለእኔ
የዜማ ባንተ ሆኗል ቀኔ
ቢሆንም ባይሆንም ከእንግዲህ
አልውልም በዜማ ሳልጠራህ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ',
        lyrics_transliteration = 'CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 1
Maleda keenqlfe sineqa
Endhon yekbh mirt’ eqa
Litsera beene bebariyah
Beqalh wist’en aberah

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 2
Yetnant yeyazegn qenber
Zare lay yelem kifuw mikr
Lemlmwal yelbe bereha
Terech’to libe t’ru wiha

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 3
Wegagnwal yets’lmetu nuro
Hiywete libe anten akbro
Maguremrem yelem beandebete
Silaleh Iyesus bebete

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 4
Desta new yefsha zemen
Mech yafral bante yemitamen
Tikaze liqsow tewegdwal
Mamesgen hiywetachn honwal

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 5
Keziyagnat kech’elemaw werat
Gotteh t’erteኸgn lemhret
Zimtan lemn eshi elalehu
Ts’dqhn mamlet’en eyayehu

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 6
Antema tileyaleh leene
Yezema bante honwal qene
Bihonm bayhonm keengdih
Alwlm bezema salt’erah

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ccce4d5e-56df-4bb9-a5d7-494fa227ea32'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 1
ማለዳ ከእንቅልፌ ስነቃ
እንድሆን የክብህ ምርጥ እቃ
ልትሰራ በእኔ በባሪያህ
በቃልህ ውስጤን አበራህ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 2
የትናንት የያዘኝ ቀንበር
ዛሬ ላይ የለም ክፉው ምክር
ለምልሟል የልቤ በረሃ
ተረጭቶ ልቤ ጥሩ ውሃ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 3
ወጋግኗል የፅልመቱ ኑሮ
ህይወቴ ልቤ አንተን አክብሮ
ማጉረምረም የለም በአንደበቴ
ስላለህ ኢየሱስ በቤቴ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 4
ደስታ ነው የፍስሃ ዘመን
መች ያፍራል ባንተ የሚታመን
ትካዜ ልቅሶው ተወግዷል
ማመስገን ህይወታችን ሆኗል

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 5
ከዚያኛት ከጨለማው ወራት
ጎትተህ ጠርተኸኝ ለምህረት
ዝምታን ለምን እሺ እላለሁ
ፅድቅህን ማምለጤን እያየሁ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 6
አንተማ ትለያለህ ለእኔ
የዜማ ባንተ ሆኗል ቀኔ
ቢሆንም ባይሆንም ከእንግዲህ
አልውልም በዜማ ሳልጠራህ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ccce4d5e-56df-4bb9-a5d7-494fa227ea32'::uuid, 'belelit-mezimur-yesetehegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enze-yiblu ("Enze Yiblu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1f99fb3f-1c7f-4a3f-9336-4f0ef4179bea'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ይብሉ ይዜምሩ በልሳን ዘኢያረምም
መንግሥተ ሥላሴ ዘለዓለም /፪/

VERSE 1
ዝም በማይል አንደበታቸው እንዲህ እያሉ ያመሰግኑታል
የሥላሴ መንግሥት ዘለዓለማዊ ነው /፪/

CHORUS
እንዘ ይብሉ ይዜምሩ በልሳን ዘኢያረምም
መንግሥተ ሥላሴ ዘለዓለም /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enze yiblu yizemru belisan ze-iyaremem
Mengiste Selase ze-lealem (2)

VERSE 1
Zem bemayil andebetachew endih eyalu yamesegnuwtal
YeSelase mengist ze-lealemawi new (2)

CHORUS
Enze yiblu yizemru belisan ze-iyaremem
Mengiste Selase ze-lealem (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንዘ ይብሉ ይዜምሩ በልሳን ዘኢያረምም
መንግሥተ ሥላሴ ዘለዓለም /፪/

VERSE 1
ዝም በማይል አንደበታቸው እንዲህ እያሉ ያመሰግኑታል
የሥላሴ መንግሥት ዘለዓለማዊ ነው /፪/

CHORUS
እንዘ ይብሉ ይዜምሩ በልሳን ዘኢያረምም
መንግሥተ ሥላሴ ዘለዓለም /፪/',
        lyrics_transliteration = 'CHORUS
Enze yiblu yizemru belisan ze-iyaremem
Mengiste Selase ze-lealem (2)

VERSE 1
Zem bemayil andebetachew endih eyalu yamesegnuwtal
YeSelase mengist ze-lealemawi new (2)

CHORUS
Enze yiblu yizemru belisan ze-iyaremem
Mengiste Selase ze-lealem (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1f99fb3f-1c7f-4a3f-9336-4f0ef4179bea'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ይብሉ ይዜምሩ በልሳን ዘኢያረምም
መንግሥተ ሥላሴ ዘለዓለም /፪/

VERSE 1
ዝም በማይል አንደበታቸው እንዲህ እያሉ ያመሰግኑታል
የሥላሴ መንግሥት ዘለዓለማዊ ነው /፪/

CHORUS
እንዘ ይብሉ ይዜምሩ በልሳን ዘኢያረምም
መንግሥተ ሥላሴ ዘለዓለም /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enze yiblu yizemru belisan ze-iyaremem
Mengiste Selase ze-lealem (2)

VERSE 1
Zem bemayil andebetachew endih eyalu yamesegnuwtal
YeSelase mengist ze-lealemawi new (2)

CHORUS
Enze yiblu yizemru belisan ze-iyaremem
Mengiste Selase ze-lealem (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1f99fb3f-1c7f-4a3f-9336-4f0ef4179bea'::uuid, 'enze-yiblu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enes-bemegbare ("Enes Bemegbare")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8a5fe5f8-bf98-4740-aec6-b64c99304e06'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እዘኝልኝ ድንግል እለምንሻለሁ',
        lyrics_transliteration = 'CHORUS
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
Ezenign dingil ilemnshalew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8a5fe5f8-bf98-4740-aec6-b64c99304e06'::uuid
      AND deleted_at IS NULL
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
Ezenign dingil ilemnshalew';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8a5fe5f8-bf98-4740-aec6-b64c99304e06'::uuid, 'enes-bemegbare', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- estifanos-semeat ("Estifanos Semeat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7c6c467c-553a-441a-804a-fffa214efc28'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)

VERSE 1
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)

CHORUS
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)

VERSE 1
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)

CHORUS
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)

VERSE 1
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)

CHORUS
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)',
        lyrics_transliteration = 'CHORUS
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)

VERSE 1
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)

CHORUS
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7c6c467c-553a-441a-804a-fffa214efc28'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)

VERSE 1
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)

CHORUS
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)

VERSE 1
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)

CHORUS
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7c6c467c-553a-441a-804a-fffa214efc28'::uuid, 'estifanos-semeat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ezemeralehu-leemebete ("Ezemeralehu LeEmebete")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a4f8d330-6c4d-4edf-8014-920c8417b990'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 1
ስላበሰችልኝ እንባዬን ከፊቴ
ይኸው እዘምራለሁ ለድንግል እናቴ
በስቃይ መከራ ቀርቷል መከፋቴ
የብዙሀን እናት ገብታለች ከቤቴ

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 2
ምስቅልቅሉ ወቶ የደፈረሰብኝ
ተስተካክሎልኛል በድንግል ጠርቶልኝ
እንባዬን ፀሎቴን ጩኸቴንም ሰምታ
ፈጥና ጎበኘችን በረድኤት መታ

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 3
በድንግዝግዝ ማዬት ቀርቶልኛል ለኔ
በፍቅር እጆቿ ተዳሶልኝ ዐይኔ
ሃዘኔን በእንባዬ ብነግራት ብሶቴን
ይኸው በበረከት ጎበኘችው ቤቴን

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 4
ቀን ከሌት ሳቃስት በከበደኝ ሸክም
አገዘችን ድንግል ደክሜ ሳልሰጥም
እጇ ስለ ሳበኝ ወጣሁኝ ከጉድባው
ለክብሯ ልዘምር እጆቼን አነሳው

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 1
Silabesechlgn enbayen kefite
Yiኸw ezemralehu ledngl enate
Besqay mekera qertwal mekefate
Yebzuhen enat gebtalech kebete

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 2
Misqlqlu weto yedeferesebgn
Testekaklolgnal bedngl t’ertolgn
Enbayen ts’eloten ch’uኸtenm semta
Fet’na gobegnechn beredet meta

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 3
Bedngzgz mayet qertolgnal lene
Befqr ejochwa tedasolgn ayne
Hazenen beenbaye binegrat bisoten
Yiኸw bebereket gobegnechw beten

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 4
Qen kelet saqast bekebedegn shekm
Agezechn Dingil dekme salset’m
Ejwa sile sabegn wet’ahugn kegudbaw
Lekbrwa lizemr ejochen anesaw

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 1
ስላበሰችልኝ እንባዬን ከፊቴ
ይኸው እዘምራለሁ ለድንግል እናቴ
በስቃይ መከራ ቀርቷል መከፋቴ
የብዙሀን እናት ገብታለች ከቤቴ

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 2
ምስቅልቅሉ ወቶ የደፈረሰብኝ
ተስተካክሎልኛል በድንግል ጠርቶልኝ
እንባዬን ፀሎቴን ጩኸቴንም ሰምታ
ፈጥና ጎበኘችን በረድኤት መታ

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 3
በድንግዝግዝ ማዬት ቀርቶልኛል ለኔ
በፍቅር እጆቿ ተዳሶልኝ ዐይኔ
ሃዘኔን በእንባዬ ብነግራት ብሶቴን
ይኸው በበረከት ጎበኘችው ቤቴን

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 4
ቀን ከሌት ሳቃስት በከበደኝ ሸክም
አገዘችን ድንግል ደክሜ ሳልሰጥም
እጇ ስለ ሳበኝ ወጣሁኝ ከጉድባው
ለክብሯ ልዘምር እጆቼን አነሳው

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን',
        lyrics_transliteration = 'CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 1
Silabesechlgn enbayen kefite
Yiኸw ezemralehu ledngl enate
Besqay mekera qertwal mekefate
Yebzuhen enat gebtalech kebete

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 2
Misqlqlu weto yedeferesebgn
Testekaklolgnal bedngl t’ertolgn
Enbayen ts’eloten ch’uኸtenm semta
Fet’na gobegnechn beredet meta

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 3
Bedngzgz mayet qertolgnal lene
Befqr ejochwa tedasolgn ayne
Hazenen beenbaye binegrat bisoten
Yiኸw bebereket gobegnechw beten

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 4
Qen kelet saqast bekebedegn shekm
Agezechn Dingil dekme salset’m
Ejwa sile sabegn wet’ahugn kegudbaw
Lekbrwa lizemr ejochen anesaw

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a4f8d330-6c4d-4edf-8014-920c8417b990'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 1
አዝ...

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 2
ስላበሰችልኝ እንባዬን ከፊቴ
ይኸው እዘምራለሁ ለድንግል እናቴ
በስቃይ መከራ ቀርቷል መከፋቴ
የብዙሀን እናት ገብታለች ከቤቴ

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 3
አዝ...

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 4
ምስቅልቅሉ ወቶ የደፈረሰብኝ
ተስተካክሎልኛል በድንግል ጠርቶልኝ
እንባዬን ፀሎቴን ጩኸቴንም ሰምታ
ፈጥና ጎበኘችን በረድኤት መታ

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 5
አዝ...

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 6
በድንግዝግዝ ማዬት ቀርቶልኛል ለኔ
በፍቅር እጆቿ ተዳሶልኝ ዐይኔ
ሃዘኔን በእንባዬ ብነግራት ብሶቴን
ይኸው በበረከት ጎበኘችው ቤቴን

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 7
አዝ...

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 8
ቀን ከሌት ሳቃስት በከበደኝ ሸክም
አገዘችን ድንግል ደክሜ ሳልሰጥም
እጇ ስለ ሳበኝ ወጣሁኝ ከጉድባው
ለክብሯ ልዘምር እጆቼን አነሳው

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yehew Ezemeralehu LeEmebete
YeFikerwa Bereket Gebeto Bete
Selegobegnechew Goskwalaw Hiwote
Amesegnalehu Dingel Emebeten

VERSE 1
Az...

CHORUS
Yehew Ezemeralehu LeEmebete
YeFikerwa Bereket Gebeto Bete
Selegobegnechew Goskwalaw Hiwote
Amesegnalehu Dingel Emebeten

VERSE 2
Selabesechelgn Enbayen Kefite
Yehew Ezemeralehu Ledengel Enate
Besekay Mekera Kertwal Mekefate
Yebezuhan Enat Gebtalech Kebete

CHORUS
Yehew Ezemeralehu LeEmebete
YeFikerwa Bereket Gebeto Bete
Selegobegnechew Goskwalaw Hiwote
Amesegnalehu Dingel Emebeten

VERSE 3
Az...

CHORUS
Yehew Ezemeralehu LeEmebete
YeFikerwa Bereket Gebeto Bete
Selegobegnechew Goskwalaw Hiwote
Amesegnalehu Dingel Emebeten

VERSE 4
Meskelkelu weto Yedeferesebgn
Testekakelolegnal Bedengel Tertolegn
Enbayen Betselot Chuhetenem Semeta
Fetena Gobegnchen Beredet Meta

CHORUS
Yehew Ezemeralehu LeEmebete
YeFikerwa Bereket Gebeto Bete
Selegobegnechew Goskwalaw Hiwote
Amesegnalehu Dingel Emebeten

VERSE 5
Az...

CHORUS
Yehew Ezemeralehu LeEmebete
YeFikerwa Bereket Gebeto Bete
Selegobegnechew Goskwalaw Hiwote
Amesegnalehu Dingel Emebeten

VERSE 6
Bedengezgez Mayet Kertolegn Lene
Befeker Ejochwa Tedasolegn Ayene
Hazenen Benbaye Benegerat Besoten
Yehew Bebereket Gobegnchew Beten

CHORUS
Yehew Ezemeralehu LeEmebete
YeFikerwa Bereket Gebeto Bete
Selegobegnechew Goskwalaw Hiwote
Amesegnalehu Dingel Emebeten

VERSE 7
Az...

CHORUS
Yehew Ezemeralehu LeEmebete
YeFikerwa Bereket Gebeto Bete
Selegobegnechew Goskwalaw Hiwote
Amesegnalehu Dingel Emebeten

VERSE 8
Ken Kelet Sakaset Bekebedegn Chekem
Agezechegn Dengel Dekeme Salsetem
Ejwa Sele Sabegn Gebahugn Kegudebaw
Lekebrwa Lezemer Ejochen Anesaw

CHORUS
Yehew Ezemeralehu LeEmebete
YeFikerwa Bereket Gebeto Bete
Selegobegnechew Goskwalaw Hiwote
Amesegnalehu Dingel Emebeten';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a4f8d330-6c4d-4edf-8014-920c8417b990'::uuid, 'ezemeralehu-leemebete', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selame-beante ("Selame Beante")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cda92e41-af51-42e5-bb1d-b84b353284be'::uuid
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
    WHERE import_id = 'cda92e41-af51-42e5-bb1d-b84b353284be'::uuid
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
        'cda92e41-af51-42e5-bb1d-b84b353284be'::uuid, 'selame-beante', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lenefise-nefiswa-nesh-lemenigede-fana ("Lenefise Nefiswa Nesh Lemenigede Fana")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ec623f75-8c40-4f20-b7d3-8ba8b945bad6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 1
አንቺ ግን አንዲት ነሽ የለሽም ጭማሪ
ትኖሪያለሽ እንጂ ትውልድ ስታስምሪ
ያንቺን ሥም ተማጽኖ ያንቺን ሥም ቀድሶ
አንቺን አመስግኖ አንቺን አወድሶ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 2
የተጠቀመ እንጂ በረከት አግኝቶ
አልታየም እስካሁን የተጎዳ ከቶ
ጎርጎርዮስና ሊቁ ዮሐንስ
አትናቴዎስና ሊቁ ባስልዮስ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 3
አባ ኤፍሬምና አባ ጊዮርጊስ
ተጠቅመዋል በአንቺ በሥጋም በነፍስ
አባትህን ጠይቅ ስለሚለን ቃሉ
ብንጠይቃቸው ቅዱሳኑን ሁሉ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 4
ስላንቺ ነገሩን ክብር ተዓምራትሽን
ለሰው ዘር በሙሉ አማላጅ መሆንሽን
ገብርኤል ከሰማይ ኤልሳቤጥ ከምድር
በአንድ መሠከሩ ስለ ድንግል ክብር

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 5
ሰዓሊ ለነ ብሎ ተማጽኖ በአንቺ ስም
የተጠቀመ እንጂ የተጎዳ የለም

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 1
Anchi gin andit nesh yeleshm ch’mari
Tinoriyalesh enji tiwld sitasmri
Yanchin sim temats’no yanchin sim qedso
Anchin amesgno anchin awedso

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 2
Yetet’eqeme enji bereket aggnto
Altayem eskahun yetegoda keto
Gorgoryosna liqu yohens
Atnatewosna liqu baslyos

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 3
Aba efremna aba Giyorgis
Tet’eqmewal beanchi besgam benefs
Abathn t’eyq silemilen qalu
Bint’eyqachew qidusanun hulu

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 4
Silanchi negerun kibir teamratshn
Lesew zer bemulu amalaj mehonshn
Gebriel kesemay elsabet’ kemdr
Beand mesekeru sile Dingil kibir

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 5
Seali lene bilo temats’no beanchi sim
Yetet’eqeme enji yetegoda yelem

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 1
አንቺ ግን አንዲት ነሽ የለሽም ጭማሪ
ትኖሪያለሽ እንጂ ትውልድ ስታስምሪ
ያንቺን ሥም ተማጽኖ ያንቺን ሥም ቀድሶ
አንቺን አመስግኖ አንቺን አወድሶ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 2
የተጠቀመ እንጂ በረከት አግኝቶ
አልታየም እስካሁን የተጎዳ ከቶ
ጎርጎርዮስና ሊቁ ዮሐንስ
አትናቴዎስና ሊቁ ባስልዮስ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 3
አባ ኤፍሬምና አባ ጊዮርጊስ
ተጠቅመዋል በአንቺ በሥጋም በነፍስ
አባትህን ጠይቅ ስለሚለን ቃሉ
ብንጠይቃቸው ቅዱሳኑን ሁሉ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 4
ስላንቺ ነገሩን ክብር ተዓምራትሽን
ለሰው ዘር በሙሉ አማላጅ መሆንሽን
ገብርኤል ከሰማይ ኤልሳቤጥ ከምድር
በአንድ መሠከሩ ስለ ድንግል ክብር

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 5
ሰዓሊ ለነ ብሎ ተማጽኖ በአንቺ ስም
የተጠቀመ እንጂ የተጎዳ የለም

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው',
        lyrics_transliteration = 'CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 1
Anchi gin andit nesh yeleshm ch’mari
Tinoriyalesh enji tiwld sitasmri
Yanchin sim temats’no yanchin sim qedso
Anchin amesgno anchin awedso

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 2
Yetet’eqeme enji bereket aggnto
Altayem eskahun yetegoda keto
Gorgoryosna liqu yohens
Atnatewosna liqu baslyos

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 3
Aba efremna aba Giyorgis
Tet’eqmewal beanchi besgam benefs
Abathn t’eyq silemilen qalu
Bint’eyqachew qidusanun hulu

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 4
Silanchi negerun kibir teamratshn
Lesew zer bemulu amalaj mehonshn
Gebriel kesemay elsabet’ kemdr
Beand mesekeru sile Dingil kibir

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 5
Seali lene bilo temats’no beanchi sim
Yetet’eqeme enji yetegoda yelem

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ec623f75-8c40-4f20-b7d3-8ba8b945bad6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 1
አንቺ ግን አንዲት ነሽ የለሽም ጭማሪ
ትኖሪያለሽ እንጂ ትውልድ ስታስምሪ
ያንቺን ሥም ተማጽኖ ያንቺን ሥም ቀድሶ
አንቺን አመስግኖ አንቺን አወድሶ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 2
የተጠቀመ እንጂ በረከት አግኝቶ
አልታየም እስካሁን የተጎዳ ከቶ
ጎርጎርዮስና ሊቁ ዮሐንስ
አትናቴዎስና ሊቁ ባስልዮስ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 3
አባ ኤፍሬምና አባ ጊዮርጊስ
ተጠቅመዋል በአንቺ በሥጋም በነፍስ
አባትህን ጠይቅ ስለሚለን ቃሉ
ብንጠይቃቸው ቅዱሳኑን ሁሉ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 4
ስላንቺ ነገሩን ክብር ተዓምራትሽን
ለሰው ዘር በሙሉ አማላጅ መሆንሽን
ገብርኤል ከሰማይ ኤልሳቤጥ ከምድር
በአንድ መሠከሩ ስለ ድንግል ክብር

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 5
ሰዓሊ ለነ ብሎ ተማጽኖ በአንቺ ስም
የተጠቀመ እንጂ የተጎዳ የለም

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ec623f75-8c40-4f20-b7d3-8ba8b945bad6'::uuid, 'lenefise-nefiswa-nesh-lemenigede-fana', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
