-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 05 OF 32
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
  -- melody-of-yared ("Melody of Yared")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '546bc978-afab-4802-b0e2-8906f9a5a8f6'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 1
The heavens and the earth they speak of your marvels
And all of creation testifies with novels
A tale that is ceaseless, wondrous are your deeds
Oh My Virgin Mary to you none supersede

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 2
Mother of all Saint Mary my strength and aid
You swiftly come when I call I’m not afraid
Your miracles and wonders I have witnessed
Zion Mary you have cured me of emptiness

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 3
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 4
The wisdom of our Lord unveiled by you Virgin
Adam''s children escaped the death that came from sin
It is you my mother the root of salvation
Who became the ladder for all of creation

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 5
If the future''s uncertain full of dismay
With you as my rod I cannot be led astray
I’ll stand before you to give praise night and day
With humbleness I call you Mary I pray

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 6
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 7
Generations as one they will stand to give praise
You’ve abolished the curse saved them from sorrow days
Adam and his children on Earth and in the skies
He will sing songs to you may his prayers arise

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 8
The shadows of this dark world from me they part
Intercessions made by you have calmed my heart
When you’re with me Saint Mary I shall know peace
The clench from the pit of sorrow will be released

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 9
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 10
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 11
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 12
Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 13
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 1
The heavens and the earth they speak of your marvels
And all of creation testifies with novels
A tale that is ceaseless, wondrous are your deeds
Oh My Virgin Mary to you none supersede

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 2
Mother of all Saint Mary my strength and aid
You swiftly come when I call I’m not afraid
Your miracles and wonders I have witnessed
Zion Mary you have cured me of emptiness

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 3
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 4
The wisdom of our Lord unveiled by you Virgin
Adam''s children escaped the death that came from sin
It is you my mother the root of salvation
Who became the ladder for all of creation

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 5
If the future''s uncertain full of dismay
With you as my rod I cannot be led astray
I’ll stand before you to give praise night and day
With humbleness I call you Mary I pray

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 6
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 7
Generations as one they will stand to give praise
You’ve abolished the curse saved them from sorrow days
Adam and his children on Earth and in the skies
He will sing songs to you may his prayers arise

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 8
The shadows of this dark world from me they part
Intercessions made by you have calmed my heart
When you’re with me Saint Mary I shall know peace
The clench from the pit of sorrow will be released

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 9
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 10
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 11
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 12
Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 13
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love',
        lyrics_transliteration = 'Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish',
        updated_at = clock_timestamp()::text
    WHERE import_id = '546bc978-afab-4802-b0e2-8906f9a5a8f6'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 1
The heavens and the earth they speak of your marvels
And all of creation testifies with novels
A tale that is ceaseless, wondrous are your deeds
Oh My Virgin Mary to you none supersede

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 2
Mother of all Saint Mary my strength and aid
You swiftly come when I call I’m not afraid
Your miracles and wonders I have witnessed
Zion Mary you have cured me of emptiness

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 3
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 4
The wisdom of our Lord unveiled by you Virgin
Adam''s children escaped the death that came from sin
It is you my mother the root of salvation
Who became the ladder for all of creation

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 5
If the future''s uncertain full of dismay
With you as my rod I cannot be led astray
I’ll stand before you to give praise night and day
With humbleness I call you Mary I pray

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 6
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 7
Generations as one they will stand to give praise
You’ve abolished the curse saved them from sorrow days
Adam and his children on Earth and in the skies
He will sing songs to you may his prayers arise

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 8
The shadows of this dark world from me they part
Intercessions made by you have calmed my heart
When you’re with me Saint Mary I shall know peace
The clench from the pit of sorrow will be released

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 9
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 10
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 11
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 12
Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 13
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '546bc978-afab-4802-b0e2-8906f9a5a8f6'::uuid, 'melody-of-yared', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- andebetn-setegn-getaye ("Andebetn Setegn Getaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5b1a3fa2-7b98-4d96-9f26-724e0a103348'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 1
ምስጋናህን ብቻ የምናገርበት/2/
አንደበትን ስጠኝ ጌታዬ/4/
ሕይወት የሆነውን ቃልህን ሰባኪ
ገናናነትህን ክብርህን ተራኪ

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 2
ለንስሃ ህይወት በጎችህን ጠሪ
እንደ ሐዋሪያት ፍቅርህን መስካሪ/2/
ከከሃድያን ጋር የማይተባበር
ፆምና ጸሎትን የሚያዘወትር

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 3
ከጽድቅ ስራ ጋር መልካም ህብረት ያለው
በምድራዊ ምኞት የማይታለለው/2/
ፈተና ሲገጥመኝ በመከራ ጊዜ
የሀዘን ጥላ ጋርዶን ሲከበን ትካዜ

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 4
ተመስገን የሚል በችግር በደስታ
ርቱዕ አንደበትን ፍጠርልን ጌታ/2/

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 1
Misganahin bicha yemnagerbet (x2)
Andebetn setegn getaye (x4)
Hiywet yehonewn qalhin sebaki
Genaninetihin kibirhin teraki

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 2
Lenes’ha hiywet begotchhin t’eri
Ende hawariyat fiqirhin meskari (x2)
Kekehadiyan gar yemayitebaber

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 3
Ts’omna tselotn yemiyazewetir
Kets’idik sira gar melkam hibret yalew
Bemidravi minyot yemayitalelew (x2)
Fetena sigeṭmeny bemekera gize

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 4
Ye hazen t’ila gardon sik’eben tikaze
Temesgen yemil bechigir bedesta
Rit’u andebetn fit’irlen geta (x2)

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 1
ምስጋናህን ብቻ የምናገርበት/2/
አንደበትን ስጠኝ ጌታዬ/4/
ሕይወት የሆነውን ቃልህን ሰባኪ
ገናናነትህን ክብርህን ተራኪ

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 2
ለንስሃ ህይወት በጎችህን ጠሪ
እንደ ሐዋሪያት ፍቅርህን መስካሪ/2/
ከከሃድያን ጋር የማይተባበር
ፆምና ጸሎትን የሚያዘወትር

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 3
ከጽድቅ ስራ ጋር መልካም ህብረት ያለው
በምድራዊ ምኞት የማይታለለው/2/
ፈተና ሲገጥመኝ በመከራ ጊዜ
የሀዘን ጥላ ጋርዶን ሲከበን ትካዜ

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 4
ተመስገን የሚል በችግር በደስታ
ርቱዕ አንደበትን ፍጠርልን ጌታ/2/

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት',
        lyrics_transliteration = 'CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 1
Misganahin bicha yemnagerbet (x2)
Andebetn setegn getaye (x4)
Hiywet yehonewn qalhin sebaki
Genaninetihin kibirhin teraki

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 2
Lenes’ha hiywet begotchhin t’eri
Ende hawariyat fiqirhin meskari (x2)
Kekehadiyan gar yemayitebaber

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 3
Ts’omna tselotn yemiyazewetir
Kets’idik sira gar melkam hibret yalew
Bemidravi minyot yemayitalelew (x2)
Fetena sigeṭmeny bemekera gize

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 4
Ye hazen t’ila gardon sik’eben tikaze
Temesgen yemil bechigir bedesta
Rit’u andebetn fit’irlen geta (x2)

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5b1a3fa2-7b98-4d96-9f26-724e0a103348'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 1
ምስጋናህን ብቻ የምናገርበት/2/
አንደበትን ስጠኝ ጌታዬ/4/
ሕይወት የሆነውን ቃልህን ሰባኪ
ገናናነትህን ክብርህን ተራኪ

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 2
ለንስሃ ህይወት በጎችህን ጠሪ
እንደ ሐዋሪያት ፍቅርህን መስካሪ/2/
ከከሃድያን ጋር የማይተባበር
ፆምና ጸሎትን የሚያዘወትር

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 3
ከጽድቅ ስራ ጋር መልካም ህብረት ያለው
በምድራዊ ምኞት የማይታለለው/2/
ፈተና ሲገጥመኝ በመከራ ጊዜ
የሀዘን ጥላ ጋርዶን ሲከበን ትካዜ

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 4
ተመስገን የሚል በችግር በደስታ
ርቱዕ አንደበትን ፍጠርልን ጌታ/2/

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 1
Misganahin bicha yemnagerbet (x2)
Andebetn setegn getaye (x4)
Hiywet yehonewn qalhin sebaki
Genaninetihin kibirhin teraki

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 2
Lenes’ha hiywet begotchhin t’eri
Ende hawariyat fiqirhin meskari (x2)
Kekehadiyan gar yemayitebaber

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 3
Ts’omna tselotn yemiyazewetir
Kets’idik sira gar melkam hibret yalew
Bemidravi minyot yemayitalelew (x2)
Fetena sigeṭmeny bemekera gize

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 4
Ye hazen t’ila gardon sik’eben tikaze
Temesgen yemil bechigir bedesta
Rit’u andebetn fit’irlen geta (x2)

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5b1a3fa2-7b98-4d96-9f26-724e0a103348'::uuid, 'andebetn-setegn-getaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selam-selam-leki ("Selam Selam Leki")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a54c01b7-7614-47f5-bef1-45ff505a848b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ማርያም ሰላም ለኪ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Maryam selam leki'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a54c01b7-7614-47f5-bef1-45ff505a848b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ማርያም ሰላም ለኪ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Maryam selam leki';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a54c01b7-7614-47f5-bef1-45ff505a848b'::uuid, 'selam-selam-leki', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selam-selam-tinsae ("Selam Selam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c92708c8-f516-4182-a623-717d2a83b093'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም ሰላም
እምይእዜሰ ይኩን ሰላም /x2/

VERSE 1
ሰላም ሰላም
ከእንግዲህስ ይሁን ሰላም /x2/

CHORUS
ሰላም ሰላም
እምይእዜሰ ይኩን ሰላም /x2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selam selam
Emyize se yikun selam (x2)

VERSE 1
Selam selam
Ke''engidihis yihun selam (x2)

CHORUS
Selam selam
Emyize se yikun selam (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c92708c8-f516-4182-a623-717d2a83b093'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም ሰላም
እምይእዜሰ ይኩን ሰላም /x2/

VERSE 1
ሰላም ሰላም
ከእንግዲህስ ይሁን ሰላም /x2/

CHORUS
ሰላም ሰላም
እምይእዜሰ ይኩን ሰላም /x2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selam selam
Emyize se yikun selam (x2)

VERSE 1
Selam selam
Ke''engidihis yihun selam (x2)

CHORUS
Selam selam
Emyize se yikun selam (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c92708c8-f516-4182-a623-717d2a83b093'::uuid, 'selam-selam-tinsae', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- praises-of-mary ("Praises of Mary")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'dc6c33ff-2fa1-4585-9d85-ced336e28ffc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady

VERSE 1
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady

CHORUS
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign

VERSE 1
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign

CHORUS
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady

VERSE 1
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady

CHORUS
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady',
        lyrics_transliteration = 'CHORUS
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign

VERSE 1
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign

CHORUS
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'dc6c33ff-2fa1-4585-9d85-ced336e28ffc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady

VERSE 1
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady

CHORUS
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign

VERSE 1
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign

CHORUS
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'dc6c33ff-2fa1-4585-9d85-ced336e28ffc'::uuid, 'praises-of-mary', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selam-yikun ("Selam Yikun")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '37249121-cb36-499b-b167-de4a8ba2ce9c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)

VERSE 1
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)

CHORUS
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selam (4)
Emyieziese yikun selam (4)

VERSE 1
Selam (4)
Emyieziese yikun selam (4)

CHORUS
Selam (4)
Emyieziese yikun selam (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '37249121-cb36-499b-b167-de4a8ba2ce9c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)

VERSE 1
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)

CHORUS
ሰላም (4)
እምይእዜሰ ይኩን ሰላም (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selam (4)
Emyieziese yikun selam (4)

VERSE 1
Selam (4)
Emyieziese yikun selam (4)

CHORUS
Selam (4)
Emyieziese yikun selam (4)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '37249121-cb36-499b-b167-de4a8ba2ce9c'::uuid, 'selam-yikun', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- serae-lene-senbet ("Serae Lene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e89bd7cb-079d-4c55-baea-abded9b5729e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ

VERSE 1
ሠራልን ሰንበትን ለዕረፍታችን
ሠራልን ሰንበትን ለዕረፍታችን

CHORUS
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Serae lene senbete le''erefte ziane
Serae lene senbete le''erefte ziane

VERSE 1
Seralin senbeten le''ereftachin
Seralin senbeten le''ereftachin

CHORUS
Serae lene senbete le''erefte ziane
Serae lene senbete le''erefte ziane'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e89bd7cb-079d-4c55-baea-abded9b5729e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ

VERSE 1
ሠራልን ሰንበትን ለዕረፍታችን
ሠራልን ሰንበትን ለዕረፍታችን

CHORUS
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ
ሠርዐ ለነ ሰንበተ ለዕረፍተ ዚአነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Serae lene senbete le''erefte ziane
Serae lene senbete le''erefte ziane

VERSE 1
Seralin senbeten le''ereftachin
Seralin senbeten le''ereftachin

CHORUS
Serae lene senbete le''erefte ziane
Serae lene senbete le''erefte ziane';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e89bd7cb-079d-4c55-baea-abded9b5729e'::uuid, 'serae-lene-senbet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- reiywo-nolot ("Re'iywo Nolot")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'dead6263-e2b0-4dfc-8fc0-efd469082674'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/

VERSE 1
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/

CHORUS
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/

VERSE 1
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/

CHORUS
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/

VERSE 1
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/

CHORUS
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/',
        lyrics_transliteration = 'CHORUS
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/

VERSE 1
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/

CHORUS
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'dead6263-e2b0-4dfc-8fc0-efd469082674'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/

VERSE 1
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/

CHORUS
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/

VERSE 1
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/

CHORUS
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'dead6263-e2b0-4dfc-8fc0-efd469082674'::uuid, 'reiywo-nolot', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- degu-samrawi-zemarit-fasika ("Degu Samrawi Zemarit Fasika")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5629953d-c388-45d9-a976-b244c1b50186'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 1
ሌዋዊው ሸሸኝ በሩቁ ተመልክቶ
ካህኑ አዘነ አለፈ ቁስሌን አይቶ
አንተ ብቻ ነህ ግድ የሚልህ ስለ እኔ
የነፍሴ ቤዛ አማኑኤል መድኅኔ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 2
ድካሜን አይተህ ከአህያ ላይ የወረድክ
እኔን ልታድን ልታነሳኝ የወደድክ
ከእንግዶች ስፍራ አሳደርከኝ ወስደህ
አስታመኸኛል ሁለት ዲናር ከፍለህ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 3
ወንጌል መግበህ በሐዲሱ ኪዳን
በመስቀል ሞተህ ሰጠኸኝ ህይወትን
ጌታዬ ደርሰህ ባታነሳኝ ወድቄ
በወንበዴ እጅ እኖር ነበር ተንቄ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 4
የሚያየኝ የለም በሰዎች ተንቄአለሁ
በነግህ በሰርክ ጌታዬ እልሃለሁ
አንሳኝ ከትቢያ ከእቅፍህ አስገባኝ
በፍቅርህ ዘይት ቁስሌን ፈውስልኝ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 1
Lewawiw sheshegn beruqu temelkto
Kahnu azene alefe quslen ayto
Ante bicha neh gid yemilh sile ene
Yenefse beza Amanuel medhne

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 2
Dikamen ayteh keahya lay yeweredk
Enen litadn litanesagn yewededk
Keengdoch sifra asaderkegn wesdeh
Astameኸgnal hulet dinar kefleh

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 3
Wengel megbeh behedisu kidan
Bemesqel moteh set’eኸgn hiywetn
Getaye derseh batanesagn wedqe
Bewenbede ej enor neber tenqe

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 4
Yemiyayegn yelem besewoch tenqealehu
Benegh beserk Getaye elhalehu
Ansagn ketbiya keeqfh asgebagn
Befqrh zeyt quslen fewslgn

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 1
ሌዋዊው ሸሸኝ በሩቁ ተመልክቶ
ካህኑ አዘነ አለፈ ቁስሌን አይቶ
አንተ ብቻ ነህ ግድ የሚልህ ስለ እኔ
የነፍሴ ቤዛ አማኑኤል መድኅኔ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 2
ድካሜን አይተህ ከአህያ ላይ የወረድክ
እኔን ልታድን ልታነሳኝ የወደድክ
ከእንግዶች ስፍራ አሳደርከኝ ወስደህ
አስታመኸኛል ሁለት ዲናር ከፍለህ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 3
ወንጌል መግበህ በሐዲሱ ኪዳን
በመስቀል ሞተህ ሰጠኸኝ ህይወትን
ጌታዬ ደርሰህ ባታነሳኝ ወድቄ
በወንበዴ እጅ እኖር ነበር ተንቄ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 4
የሚያየኝ የለም በሰዎች ተንቄአለሁ
በነግህ በሰርክ ጌታዬ እልሃለሁ
አንሳኝ ከትቢያ ከእቅፍህ አስገባኝ
በፍቅርህ ዘይት ቁስሌን ፈውስልኝ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ',
        lyrics_transliteration = 'CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 1
Lewawiw sheshegn beruqu temelkto
Kahnu azene alefe quslen ayto
Ante bicha neh gid yemilh sile ene
Yenefse beza Amanuel medhne

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 2
Dikamen ayteh keahya lay yeweredk
Enen litadn litanesagn yewededk
Keengdoch sifra asaderkegn wesdeh
Astameኸgnal hulet dinar kefleh

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 3
Wengel megbeh behedisu kidan
Bemesqel moteh set’eኸgn hiywetn
Getaye derseh batanesagn wedqe
Bewenbede ej enor neber tenqe

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu

VERSE 4
Yemiyayegn yelem besewoch tenqealehu
Benegh beserk Getaye elhalehu
Ansagn ketbiya keeqfh asgebagn
Befqrh zeyt quslen fewslgn

CHORUS
Degu samrawi Iyesus Kristos
Qusle siga qusle nefs yemtfews
Lijh bebedel behat’yat dekmealehu
Endtanesagn Getaye anten eshalehu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5629953d-c388-45d9-a976-b244c1b50186'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 1
ሌዋዊው ሸሸኝ በሩቁ ተመልክቶ
ካህኑ አዘነ አለፈ ቁስሌን አይቶ
አንተ ብቻ ነህ ግድ የሚልህ ስለ እኔ
የነፍሴ ቤዛ አማኑኤል መድኅኔ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 2
ድካሜን አይተህ ከአህያ ላይ የወረድክ
እኔን ልታድን ልታነሳኝ የወደድክ
ከእንግዶች ስፍራ አሳደርከኝ ወስደህ
አስታመኸኛል ሁለት ዲናር ከፍለህ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 3
ወንጌል መግበህ በሐዲሱ ኪዳን
በመስቀል ሞተህ ሰጠኸኝ ህይወትን
ጌታዬ ደርሰህ ባታነሳኝ ወድቄ
በወንበዴ እጅ እኖር ነበር ተንቄ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ

VERSE 4
የሚያየኝ የለም በሰዎች ተንቄአለሁ
በነግህ በሰርክ ጌታዬ እልሃለሁ
አንሳኝ ከትቢያ ከእቅፍህ አስገባኝ
በፍቅርህ ዘይት ቁስሌን ፈውስልኝ

CHORUS
ደጉ ሳምራዊ ኢየሱስ ክርስቶስ
ቁስለ ስጋ ቁስለ ነፍስ የምትፈውስ
ልጅህ በበደል በኃጥያት ደክሜአለሁ
እንድታነሳኝ ጌታዬ አንተን እሻለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5629953d-c388-45d9-a976-b244c1b50186'::uuid, 'degu-samrawi-zemarit-fasika', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bealet-lay-newina ("Bealet Lay Newina")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '56d415b9-5b1f-4d30-843b-4931b5a54e57'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 1
መንጋዋን ሊበትን ተኩላዉ ቢያበረታ
በዕበሉ መርከቧን ፍፁም ቢያንገላታ
የተቃወሟትን ሁሉን ድል ነስታለች
ዛሬም እንደፀሀይ ይኼዉ ታበራለች

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 2
የቀርሎስ እናት ናት የድዮስቆሮስ
አኖሬዮስ እና የኔፉልጶስ
የወለተ ጴጥሮስ የክርስቶስ ሳምራ
የጴጥሮስ እናት ናት የነመስቀለ ክብር

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 3
ኑፋቄ ቢነሳ ክህደቱ ቢነፍስ
ዙርያዋን ቢከባት ቅጥሯን ለማፍረስ
የፀና ነዉና በደም ተመስርቶ
ትረታለች እንጅ አትረታም ከቶ

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 4
አእላፍ መላእክት ዙርያ ከበዋታል
አእላፍ ቅዱሳን ይፀልዩላታል
እኛ የማናዉቃቸዉ እሱ የሚያዉቃቸዉ
ለእሷ የሚሰሩ እጅግ ብዙ ነቸዉ

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 1
Mengawan libetn tekulawu biyabereta
Beebelu merkebwan fits’um biyangelata
Yeteqawemwatn hulun dil nestalech
Zarem endets’ehey yiኼwu taberalech

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 2
Yeqerlos enat nat yedyosqoros
Anoreyos ena yenefulp’os
Yewelete p’et’ros yeKristos samra
Yep’et’ros enat nat yenemesqele kibir

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 3
Nufaqe binesa kihdetu binefs
Zuryawan bikebat qit’rwan lemafres
Yets’ena newuna bedem temesrto
Tiretalech enj atretam keto

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 4
Aelaf melaekt zurya kebewatal
Aelaf Kidusan yits’elyulatal
Egna yemanawuqachewu esu yemiyawuqachewu
Leeswa yemiseru ejg bizu nechewu

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 1
መንጋዋን ሊበትን ተኩላዉ ቢያበረታ
በዕበሉ መርከቧን ፍፁም ቢያንገላታ
የተቃወሟትን ሁሉን ድል ነስታለች
ዛሬም እንደፀሀይ ይኼዉ ታበራለች

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 2
የቀርሎስ እናት ናት የድዮስቆሮስ
አኖሬዮስ እና የኔፉልጶስ
የወለተ ጴጥሮስ የክርስቶስ ሳምራ
የጴጥሮስ እናት ናት የነመስቀለ ክብር

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 3
ኑፋቄ ቢነሳ ክህደቱ ቢነፍስ
ዙርያዋን ቢከባት ቅጥሯን ለማፍረስ
የፀና ነዉና በደም ተመስርቶ
ትረታለች እንጅ አትረታም ከቶ

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 4
አእላፍ መላእክት ዙርያ ከበዋታል
አእላፍ ቅዱሳን ይፀልዩላታል
እኛ የማናዉቃቸዉ እሱ የሚያዉቃቸዉ
ለእሷ የሚሰሩ እጅግ ብዙ ነቸዉ

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)',
        lyrics_transliteration = 'CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 1
Mengawan libetn tekulawu biyabereta
Beebelu merkebwan fits’um biyangelata
Yeteqawemwatn hulun dil nestalech
Zarem endets’ehey yiኼwu taberalech

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 2
Yeqerlos enat nat yedyosqoros
Anoreyos ena yenefulp’os
Yewelete p’et’ros yeKristos samra
Yep’et’ros enat nat yenemesqele kibir

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 3
Nufaqe binesa kihdetu binefs
Zuryawan bikebat qit’rwan lemafres
Yets’ena newuna bedem temesrto
Tiretalech enj atretam keto

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 4
Aelaf melaekt zurya kebewatal
Aelaf Kidusan yits’elyulatal
Egna yemanawuqachewu esu yemiyawuqachewu
Leeswa yemiseru ejg bizu nechewu

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '56d415b9-5b1f-4d30-843b-4931b5a54e57'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 1
መንጋዋን ሊበትን ተኩላዉ ቢያበረታ
በዕበሉ መርከቧን ፍፁም ቢያንገላታ
የተቃወሟትን ሁሉን ድል ነስታለች
ዛሬም እንደፀሀይ ይኼዉ ታበራለች

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 2
የቀርሎስ እናት ናት የድዮስቆሮስ
አኖሬዮስ እና የኔፉልጶስ
የወለተ ጴጥሮስ የክርስቶስ ሳምራ
የጴጥሮስ እናት ናት የነመስቀለ ክብር

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 3
ኑፋቄ ቢነሳ ክህደቱ ቢነፍስ
ዙርያዋን ቢከባት ቅጥሯን ለማፍረስ
የፀና ነዉና በደም ተመስርቶ
ትረታለች እንጅ አትረታም ከቶ

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 4
አእላፍ መላእክት ዙርያ ከበዋታል
አእላፍ ቅዱሳን ይፀልዩላታል
እኛ የማናዉቃቸዉ እሱ የሚያዉቃቸዉ
ለእሷ የሚሰሩ እጅግ ብዙ ነቸዉ

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '56d415b9-5b1f-4d30-843b-4931b5a54e57'::uuid, 'bealet-lay-newina', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- simih-behulu-temesgene ("Simih Be-hulu Temesgene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bfd23b8e-52fb-48e5-8a5c-7d9b043100d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ስምህን ማክበር ክብራችን ሆኗል /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Simihin makber kibrachin honwal (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bfd23b8e-52fb-48e5-8a5c-7d9b043100d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ስምህን ማክበር ክብራችን ሆኗል /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Simihin makber kibrachin honwal (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bfd23b8e-52fb-48e5-8a5c-7d9b043100d5'::uuid, 'simih-behulu-temesgene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sile-mayneger-sitotaw ("Sile Mayneger Sitotaw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '78279065-2389-4c5d-99e5-355471d0dbff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '78279065-2389-4c5d-99e5-355471d0dbff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Chel yalalen Amlak sinigwaz ma’ebalun aqwart’en';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '78279065-2389-4c5d-99e5-355471d0dbff'::uuid, 'sile-mayneger-sitotaw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egiziabiher-begna-bet ("Egiziabiher Begna Bet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '589d45c5-67aa-48d8-adcb-19a2d150821f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 1
በደጃፋችን ላይ አለ ህያዉ ስሙ
ጉበን መቃናችን ቃሉ ነዉ ማህተሙ
ዘንባባን አንጠፈን የምቀበለዉ
እግዚአብሔር ቀን በቀን ሆሳዕናችን ነዉ (2)

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 2
ከእግዚአብሔር የምበልጥ የለም በቤታችን
ቀዳም ነዉ ስሙ አልፋ ኦሜጋችን
ሕጉን ጠልፈንበት መጋሬጃችን ላይ
ንጉስ ነዉ በእኛ

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 3
ቤት በከፍታ የምታይ (2)
ከአማሌቅ አማልክት ከቶ አንቀላውጥም
ለክብሩ የማይሆን እርም አናስቀምጥም
አይረክስም ምንጣፉ የክብሩ መቅረዞች

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 4
ከሬሞን በመጡ በጣዖት ቤት ሰዎች(2)
ሲሞላም ስጎድልም አይቆምም ምሥጋና
ቤቱ ያለ መዝሙር አያጌጥምና
እግዚአብሔር ቢሰጥ አግዚአብሔር ቢነሳ

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 5
አይውልም በእኛ ቤት ክብሩ ሳይነሣ(2)

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 1
Bedejafachn lay ale hiyawu simu
Guben meqanachn qalu newu mahtemu
Zenbaban ant’efen yemqebelewu
Egziabher qen beqen hosaenachn newu (2)

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 2
Keegziabher yembelt’ yelem bebetachn
Qedam newu simu alfa omegachn
Higun t’elfenbet megarejachn lay
Nigus newu beegna

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 3
Bet bekefta yemtay (2)
Keamaleq amalkt keto anqelawt’m
Lekbru yemayhon erm anasqemt’m
Ayreksm mint’afu yekbru meqrezoch

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 4
Keremon bemet’u bet’aot bet sewoch (2)
Simolam sigodlm ayqomm misgana
Betu yale mezmur ayaget’mna
Egziabher biset’ agziabher binesa

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 5
Aywlm beegna bet kibru saynesa (2)

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 1
በደጃፋችን ላይ አለ ህያዉ ስሙ
ጉበን መቃናችን ቃሉ ነዉ ማህተሙ
ዘንባባን አንጠፈን የምቀበለዉ
እግዚአብሔር ቀን በቀን ሆሳዕናችን ነዉ (2)

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 2
ከእግዚአብሔር የምበልጥ የለም በቤታችን
ቀዳም ነዉ ስሙ አልፋ ኦሜጋችን
ሕጉን ጠልፈንበት መጋሬጃችን ላይ
ንጉስ ነዉ በእኛ

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 3
ቤት በከፍታ የምታይ (2)
ከአማሌቅ አማልክት ከቶ አንቀላውጥም
ለክብሩ የማይሆን እርም አናስቀምጥም
አይረክስም ምንጣፉ የክብሩ መቅረዞች

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 4
ከሬሞን በመጡ በጣዖት ቤት ሰዎች(2)
ሲሞላም ስጎድልም አይቆምም ምሥጋና
ቤቱ ያለ መዝሙር አያጌጥምና
እግዚአብሔር ቢሰጥ አግዚአብሔር ቢነሳ

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 5
አይውልም በእኛ ቤት ክብሩ ሳይነሣ(2)

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)',
        lyrics_transliteration = 'CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 1
Bedejafachn lay ale hiyawu simu
Guben meqanachn qalu newu mahtemu
Zenbaban ant’efen yemqebelewu
Egziabher qen beqen hosaenachn newu (2)

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 2
Keegziabher yembelt’ yelem bebetachn
Qedam newu simu alfa omegachn
Higun t’elfenbet megarejachn lay
Nigus newu beegna

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 3
Bet bekefta yemtay (2)
Keamaleq amalkt keto anqelawt’m
Lekbru yemayhon erm anasqemt’m
Ayreksm mint’afu yekbru meqrezoch

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 4
Keremon bemet’u bet’aot bet sewoch (2)
Simolam sigodlm ayqomm misgana
Betu yale mezmur ayaget’mna
Egziabher biset’ agziabher binesa

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)

VERSE 5
Aywlm beegna bet kibru saynesa (2)

CHORUS
Egziabher beegna bet hul gize misgun newu
Yeamalkt amlak amnen yemeret’newu
Simu bemaleda beqen yiqedesal
Ersu rasachn newu belelt yinegsal (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '589d45c5-67aa-48d8-adcb-19a2d150821f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 1
በደጃፋችን ላይ አለ ህያዉ ስሙ
ጉበን መቃናችን ቃሉ ነዉ ማህተሙ
ዘንባባን አንጠፈን የምቀበለዉ
እግዚአብሔር ቀን በቀን ሆሳዕናችን ነዉ (2)

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 2
ከእግዚአብሔር የምበልጥ የለም በቤታችን
ቀዳም ነዉ ስሙ አልፋ ኦሜጋችን
ሕጉን ጠልፈንበት መጋሬጃችን ላይ
ንጉስ ነዉ በእኛ

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 3
ቤት በከፍታ የምታይ (2)
ከአማሌቅ አማልክት ከቶ አንቀላውጥም
ለክብሩ የማይሆን እርም አናስቀምጥም
አይረክስም ምንጣፉ የክብሩ መቅረዞች

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 4
ከሬሞን በመጡ በጣዖት ቤት ሰዎች(2)
ሲሞላም ስጎድልም አይቆምም ምሥጋና
ቤቱ ያለ መዝሙር አያጌጥምና
እግዚአብሔር ቢሰጥ አግዚአብሔር ቢነሳ

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)

VERSE 5
አይውልም በእኛ ቤት ክብሩ ሳይነሣ(2)

CHORUS
እግዚአብሔር በእኛ ቤት ሁል ግዜ ምስጉን ነዉ
የአማልክት አምላክ አምነን የመረጥነዉ
ስሙ በማለዳ በቀን ይቀደሳል
እርሱ ራሳችን ነዉ በሌልት ይነግሳል(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '589d45c5-67aa-48d8-adcb-19a2d150821f'::uuid, 'egiziabiher-begna-bet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sobe-tezekernaha-letsiyon ("Sobe Tezekernaha Letsiyon")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f3b83f2a-7bbc-417a-88ff-4c6080ffb7dd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ህየ ነበርነ ወበከይነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Hiye neberne webekeyne'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f3b83f2a-7bbc-417a-88ff-4c6080ffb7dd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 1
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 2
/አዝ=====

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 3
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 4
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 5
/አዝ=====

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 6
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ
ባቢሎንን አሻገረ የማረኩንን በትኖ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 7
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 8
/አዝ=====

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 9
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ

VERSE 10
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 1
basebnat gize tsyonn
basebnat gize ityopyann
bebabilon wenzoch etegeb
teqemten eleqesn
mesenqoechnn seqeln bezafo lay

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 2
/ez=====

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 3
tsnu mekeran teqebeln techeneqn befetena
yedewe mot belayachn ndeznab werlna
ehzabm zebetubn ndih blew beyetera
zemrulet leemlakachhu biyadnachhu kemekera

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 4
gziebher tsyonn bemengstu mertal na
maderiyaw thonew zend wetal na
tsyon hoy natachn qdst dngl maryam
tsyon hoy natachn qdst bete krstiyan
enchin bnresa qenyachn trsan

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 5
/ez=====

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 6
yemarekun betorachew behaylachew yetemeku
betsyon dej yalefrhat yetsyonn kbn neku
yhn yaye kelay hono bedemena teshefno
babilonn eshagere yemarekunn betno

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 7
gziebher tsyonn lemengstu mertal na
maderiyaw thonew zend wetal na
tsyon hoy natachn qdst dngl maryam
tsyon hoy natachn qdst bete krstiyan
enchin bnresa qenyachn trsan

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 8
/ez=====

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 9
sgachnn ygel zend yemot tla biyatelam
nalfalen hulun banchi
yeemlak nat dngl maryam
qdst hoy kebarekshn
ndnalen kedeweyachn
lesgana lenebsachn medhanit nesh natachn

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha

VERSE 10
gziebher tsyonn bemengstu mertalna
maderiyaw thonew zend wetalna
tsyon hoy natachn qdst dngl maryam
tsyon hoy natachn qdst bete krstiyan
enchin bnresa qenyachn trsan

CHORUS
sobe tezekernaha letsyon
sobe tezekernaha letsyon
wste eflage babilon
hye neberne webekeyne
nziratine seqelne wste hatiha';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f3b83f2a-7bbc-417a-88ff-4c6080ffb7dd'::uuid, 'sobe-tezekernaha-letsiyon', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tebko-asadeggo-mikael ("Tebko Asadeggo")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '869c7c8c-d98d-43d2-970b-9ba49966ec5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Be-kinfu shefno be-betu asadegognal (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '869c7c8c-d98d-43d2-970b-9ba49966ec5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
በክንፉ ሸፍኖ በቤቱ አሳድጎኛል /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Be-kinfu shefno be-betu asadegognal (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '869c7c8c-d98d-43d2-970b-9ba49966ec5f'::uuid, 'tebko-asadeggo-mikael', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tabor-abera ("Tabor Abera")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '86476d5c-70f3-4c8d-a9c6-93d7d3535a9c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አነቃን ለምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Anekan lemesgana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '86476d5c-70f3-4c8d-a9c6-93d7d3535a9c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አነቃን ለምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Anekan lemesgana';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '86476d5c-70f3-4c8d-a9c6-93d7d3535a9c'::uuid, 'tabor-abera', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-3347 ("Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5a61707a-c0df-4200-951a-3303124dd5c9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 1
ሆሳእና ንበል
ቃላተይ ኣብሊሐ ብመዝሙር ምስጋና
በቲ ዓቕመይ ክውድስ እየ ጌና
ሆሳእና ክብል የ ክብሩ ከዘንቱ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 2
ስየ ከንጽፈሉ ናብ ልበይ ከኣቱ
ኣሕዛብ ኢዮርሳሌም ዘምሩ ንክብሪ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 3
ጸልማት ንኽስዓር ፍርሒ ንኸብቅዕ
ጸዳለ ብርሃኑ ንዓለም ከብርህ
ገልገል ተወጢሑ ትሕትና ለቢሱ
መጺዩ መድሓኒተይ ግርማ ተዓጢቑ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 4
ኣእማነ ቢታንያ ዘምሩ ንኽብሩ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ።
ሆሳእና በሉ
ሕማመይ ክፍውስ ዘልኣለም ክሕጎስ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 5
ሆሳእና ክብል''የ ንኢየሱስ ክርስቶስ
ክዝምረሉ''የ ስለቲ ውዕለቱ
ሰላም ንኽረክብ ሆሳእና ክብለሉ
ሕጻናት ኢዮርሳሌም ዘምሩ ንኽብሩ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 6
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ
ትሕትና ብምልባስ ትሕትና ምሂሩ
ፍትወይ ናተይ ከርእየኒ ፍቕሩ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 7
ፈውሰይ መድሓኒተይ ኢየሱስ ክርስቶስ
ክነብር''የ ምስኡ ዘልኣለም ክሕጎስ
ከንጽፈሉ''የ ዝርካበይ ኩሉ
ሆሳእና ኢለ ክዝምረሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 8
ሆሳእና በሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 1
Hosaena nibel
Qalatey ablihe bimezmur misgana
Beti aቕmey kiwds eye gena
Hosaena kibl ye kibru kezentu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 2
Siye kents’felu nab libey keatu
Ahzab iyorsalem zemru nikbri
Hosaena niwedi dawit ilkum ch’edru
Hosaena belu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 3
Ts’elmat niኽsar firhi niኸbqe
Ts’edale birhanu nialem kebrh
Gelgel tewet’ihu tihtna lebisu
Mets’iyu medhanitey girma teat’iቑ

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 4
Aemane bitanya zemru niኽbru
Hosaena niwedi dawit ilkum ch’edru.
Hosaena belu
Himamey kifws zelalem kihgos

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 5
Hosaena kibl''ye niiyesus Kristos
Kizmrelu''ye sileti wieletu
Selam niኽrekb hosaena kiblelu
Hits’anat iyorsalem zemru niኽbru

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 6
Hosaena niwedi dawit ilkum ch’edru
Hosaena belu
Tihtna bimlbas tihtna mihiru
Fitwey natey kereyeni fiቕru

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 7
Fewsey medhanitey Iyesus Kristos
Kinebr''ye misu zelalem kihgos
Kents’felu''ye zirkabey kulu
Hosaena ile kizmrelu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 8
Hosaena belu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 1
ሆሳእና ንበል
ቃላተይ ኣብሊሐ ብመዝሙር ምስጋና
በቲ ዓቕመይ ክውድስ እየ ጌና
ሆሳእና ክብል የ ክብሩ ከዘንቱ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 2
ስየ ከንጽፈሉ ናብ ልበይ ከኣቱ
ኣሕዛብ ኢዮርሳሌም ዘምሩ ንክብሪ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 3
ጸልማት ንኽስዓር ፍርሒ ንኸብቅዕ
ጸዳለ ብርሃኑ ንዓለም ከብርህ
ገልገል ተወጢሑ ትሕትና ለቢሱ
መጺዩ መድሓኒተይ ግርማ ተዓጢቑ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 4
ኣእማነ ቢታንያ ዘምሩ ንኽብሩ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ።
ሆሳእና በሉ
ሕማመይ ክፍውስ ዘልኣለም ክሕጎስ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 5
ሆሳእና ክብል''የ ንኢየሱስ ክርስቶስ
ክዝምረሉ''የ ስለቲ ውዕለቱ
ሰላም ንኽረክብ ሆሳእና ክብለሉ
ሕጻናት ኢዮርሳሌም ዘምሩ ንኽብሩ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 6
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ
ትሕትና ብምልባስ ትሕትና ምሂሩ
ፍትወይ ናተይ ከርእየኒ ፍቕሩ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 7
ፈውሰይ መድሓኒተይ ኢየሱስ ክርስቶስ
ክነብር''የ ምስኡ ዘልኣለም ክሕጎስ
ከንጽፈሉ''የ ዝርካበይ ኩሉ
ሆሳእና ኢለ ክዝምረሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 8
ሆሳእና በሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም',
        lyrics_transliteration = 'CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 1
Hosaena nibel
Qalatey ablihe bimezmur misgana
Beti aቕmey kiwds eye gena
Hosaena kibl ye kibru kezentu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 2
Siye kents’felu nab libey keatu
Ahzab iyorsalem zemru nikbri
Hosaena niwedi dawit ilkum ch’edru
Hosaena belu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 3
Ts’elmat niኽsar firhi niኸbqe
Ts’edale birhanu nialem kebrh
Gelgel tewet’ihu tihtna lebisu
Mets’iyu medhanitey girma teat’iቑ

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 4
Aemane bitanya zemru niኽbru
Hosaena niwedi dawit ilkum ch’edru.
Hosaena belu
Himamey kifws zelalem kihgos

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 5
Hosaena kibl''ye niiyesus Kristos
Kizmrelu''ye sileti wieletu
Selam niኽrekb hosaena kiblelu
Hits’anat iyorsalem zemru niኽbru

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 6
Hosaena niwedi dawit ilkum ch’edru
Hosaena belu
Tihtna bimlbas tihtna mihiru
Fitwey natey kereyeni fiቕru

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 7
Fewsey medhanitey Iyesus Kristos
Kinebr''ye misu zelalem kihgos
Kents’felu''ye zirkabey kulu
Hosaena ile kizmrelu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 8
Hosaena belu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5a61707a-c0df-4200-951a-3303124dd5c9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 1
ሆሳእና ንበል
ቃላተይ ኣብሊሐ ብመዝሙር ምስጋና
በቲ ዓቕመይ ክውድስ እየ ጌና
ሆሳእና ክብል የ ክብሩ ከዘንቱ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 2
ስየ ከንጽፈሉ ናብ ልበይ ከኣቱ
ኣሕዛብ ኢዮርሳሌም ዘምሩ ንክብሪ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 3
ጸልማት ንኽስዓር ፍርሒ ንኸብቅዕ
ጸዳለ ብርሃኑ ንዓለም ከብርህ
ገልገል ተወጢሑ ትሕትና ለቢሱ
መጺዩ መድሓኒተይ ግርማ ተዓጢቑ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 4
ኣእማነ ቢታንያ ዘምሩ ንኽብሩ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ።
ሆሳእና በሉ
ሕማመይ ክፍውስ ዘልኣለም ክሕጎስ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 5
ሆሳእና ክብል''የ ንኢየሱስ ክርስቶስ
ክዝምረሉ''የ ስለቲ ውዕለቱ
ሰላም ንኽረክብ ሆሳእና ክብለሉ
ሕጻናት ኢዮርሳሌም ዘምሩ ንኽብሩ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 6
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ
ትሕትና ብምልባስ ትሕትና ምሂሩ
ፍትወይ ናተይ ከርእየኒ ፍቕሩ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 7
ፈውሰይ መድሓኒተይ ኢየሱስ ክርስቶስ
ክነብር''የ ምስኡ ዘልኣለም ክሕጎስ
ከንጽፈሉ''የ ዝርካበይ ኩሉ
ሆሳእና ኢለ ክዝምረሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 8
ሆሳእና በሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5a61707a-c0df-4200-951a-3303124dd5c9'::uuid, 'eritrean-orthodox-tewahdo-mezmur-3347', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sew-le-sew ("Sew Le Sew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e00388be-dda6-4fe6-ae7d-79722cb39020'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሰው ለሰው /2/ ቢፋቀር ምነው /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Sew lewsew /2/ Bifeker Minew /2/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e00388be-dda6-4fe6-ae7d-79722cb39020'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሰው ለሰው /2/ ቢፋቀር ምነው /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Sew lewsew /2/ Bifeker Minew /2/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e00388be-dda6-4fe6-ae7d-79722cb39020'::uuid, 'sew-le-sew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enide-mihiretih-bizat-maregn ("Enide Mihiretih Bizat Maregn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e7f24a15-2849-48c4-ac50-01e8d26ce8f7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 1
እጅግ በዛ የኔ ሀጢያት ከፀጉሬ
በመቅደስ እጮሀለሁ አቀርቅሬ
አትቅሰፈኝ በመአጥ አትገስፀኝ
ጌታዬ ሆይ የማዳንህን ደስታ ስጠኝ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 2
እንደማውቕ በአደባባይ ምን ብናገር
ስራዬ ግን ይህን እውነት አይመሰክር
ከእልፍኝ ብሄድ ርቄ ከአንተ ፍቅር
ሁሉን ከሰርኩ አላተረፍኩ አንዳች ነገር

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 3
ማን እንደኔ ከትውልዱ የበደለ
መሀሪ አምላክ ከአንተ በቀር ወዴት አለ
የዳዊት ልጅ ማረኝ ብዬ እጮሀለሁ
እያነባሁ በጉልበቴ እሰግዳለሁ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 4
የሰጠኽኝ የልጅነት ክቡር ፀጋ
ቀራንዮ ላይ የከፈልከው የደም ዋጋ
በመዘንጋት የመስቀሉን ድንቅ ውለታ
ኮበለልኩኝ ከአንተ ሸሸሁ መስሎኝ ደስታ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 5
በመዳፈር እንደ አፍኒንና እንደ ፉንሀስ
ሰውነቴን አቆሽሻለሁ ያነተን መቅደስ
አሳልፈህ እንዳትሰጠኝ ለሀጢአቴ
እንደ ቀድሞ ልጄ በለኝ ደጉ አባቴ !

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 6
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 1
Ejg beza yene het’iyat kets’egure
Bemeqdes ech’ohelehu aqerqre
Atqsefegn bemeat’ atgests’egn
Getaye hoy yemadanhn desta sit’egn

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 2
Endemawቕ beadebabay min binager
Siraye gin yihn ewnet aymesekr
Keelfgn bihed riqe keante fiqr
Hulun keserku alaterefku andach neger

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 3
Man endene ketwldu yebedele
Meheri amlak keante beqer wedet ale
Yedawit lij maregn biye ech’ohelehu
Eyanebahu begulbete esegdalehu

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 4
Yeset’eኽgn yeljnet kibur ts’ega
Qeranyo lay yekefelkew yedem waga
Bemezengat yemesqelun dinq wileta
Kobelelkugn keante sheshehu meslogn desta

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 5
Bemedafer ende afninna ende funhes
Sewneten aqoshshalehu yaneten meqdes
Asalfeh endatset’egn lehet’iate
Ende qedmo lije belegn degu abate !

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 6
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 1
እጅግ በዛ የኔ ሀጢያት ከፀጉሬ
በመቅደስ እጮሀለሁ አቀርቅሬ
አትቅሰፈኝ በመአጥ አትገስፀኝ
ጌታዬ ሆይ የማዳንህን ደስታ ስጠኝ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 2
እንደማውቕ በአደባባይ ምን ብናገር
ስራዬ ግን ይህን እውነት አይመሰክር
ከእልፍኝ ብሄድ ርቄ ከአንተ ፍቅር
ሁሉን ከሰርኩ አላተረፍኩ አንዳች ነገር

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 3
ማን እንደኔ ከትውልዱ የበደለ
መሀሪ አምላክ ከአንተ በቀር ወዴት አለ
የዳዊት ልጅ ማረኝ ብዬ እጮሀለሁ
እያነባሁ በጉልበቴ እሰግዳለሁ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 4
የሰጠኽኝ የልጅነት ክቡር ፀጋ
ቀራንዮ ላይ የከፈልከው የደም ዋጋ
በመዘንጋት የመስቀሉን ድንቅ ውለታ
ኮበለልኩኝ ከአንተ ሸሸሁ መስሎኝ ደስታ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 5
በመዳፈር እንደ አፍኒንና እንደ ፉንሀስ
ሰውነቴን አቆሽሻለሁ ያነተን መቅደስ
አሳልፈህ እንዳትሰጠኝ ለሀጢአቴ
እንደ ቀድሞ ልጄ በለኝ ደጉ አባቴ !

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 6
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ',
        lyrics_transliteration = 'CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 1
Ejg beza yene het’iyat kets’egure
Bemeqdes ech’ohelehu aqerqre
Atqsefegn bemeat’ atgests’egn
Getaye hoy yemadanhn desta sit’egn

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 2
Endemawቕ beadebabay min binager
Siraye gin yihn ewnet aymesekr
Keelfgn bihed riqe keante fiqr
Hulun keserku alaterefku andach neger

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 3
Man endene ketwldu yebedele
Meheri amlak keante beqer wedet ale
Yedawit lij maregn biye ech’ohelehu
Eyanebahu begulbete esegdalehu

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 4
Yeset’eኽgn yeljnet kibur ts’ega
Qeranyo lay yekefelkew yedem waga
Bemezengat yemesqelun dinq wileta
Kobelelkugn keante sheshehu meslogn desta

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 5
Bemedafer ende afninna ende funhes
Sewneten aqoshshalehu yaneten meqdes
Asalfeh endatset’egn lehet’iate
Ende qedmo lije belegn degu abate !

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

VERSE 6
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku

CHORUS
Endemhreth bizat maregn
Metelalefen demsslgn
Anten bicha bedelku
Tihzazhn afereseku',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e7f24a15-2849-48c4-ac50-01e8d26ce8f7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 1
እጅግ በዛ የኔ ሀጢያት ከፀጉሬ
በመቅደስ እጮሀለሁ አቀርቅሬ
አትቅሰፈኝ በመአጥ አትገስፀኝ
ጌታዬ ሆይ የማዳንህን ደስታ ስጠኝ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 2
እንደማውቕ በአደባባይ ምን ብናገር
ስራዬ ግን ይህን እውነት አይመሰክር
ከእልፍኝ ብሄድ ርቄ ከአንተ ፍቅር
ሁሉን ከሰርኩ አላተረፍኩ አንዳች ነገር

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 3
ማን እንደኔ ከትውልዱ የበደለ
መሀሪ አምላክ ከአንተ በቀር ወዴት አለ
የዳዊት ልጅ ማረኝ ብዬ እጮሀለሁ
እያነባሁ በጉልበቴ እሰግዳለሁ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 4
የሰጠኽኝ የልጅነት ክቡር ፀጋ
ቀራንዮ ላይ የከፈልከው የደም ዋጋ
በመዘንጋት የመስቀሉን ድንቅ ውለታ
ኮበለልኩኝ ከአንተ ሸሸሁ መስሎኝ ደስታ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 5
በመዳፈር እንደ አፍኒንና እንደ ፉንሀስ
ሰውነቴን አቆሽሻለሁ ያነተን መቅደስ
አሳልፈህ እንዳትሰጠኝ ለሀጢአቴ
እንደ ቀድሞ ልጄ በለኝ ደጉ አባቴ !

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

VERSE 6
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ

CHORUS
እንደምህረትህ ብዛት ማረኝ
መተላለፌን ደምስስልኝ
አንተን ብቻ በደልኩ
ትህዛዝህን አፈረሰኩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e7f24a15-2849-48c4-ac50-01e8d26ce8f7'::uuid, 'enide-mihiretih-bizat-maregn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-angel ("The Angel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9b83a659-f4e3-4e3c-8622-0ef4fb45e447'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Delivers them who rely on him, delivers them (Psalm 34:7)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = '9b83a659-f4e3-4e3c-8622-0ef4fb45e447'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Delivers them who rely on him, delivers them (Psalm 34:7)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9b83a659-f4e3-4e3c-8622-0ef4fb45e447'::uuid, 'the-angel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-lord-has-risen ("The Lord Has Risen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ebb2a6ec-3538-4433-817d-8c9d65dda058'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
We all have bore witness Jesus Christ has risen'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Geta tenestual elil elil belu
Amlak tenestual yemisirach belu
Musina mekabir be haylu atfito
Hulachin ayenew Kiristos tenesto'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = 'Geta tenestual elil elil belu
Amlak tenestual yemisirach belu
Musina mekabir be haylu atfito
Hulachin ayenew Kiristos tenesto',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ebb2a6ec-3538-4433-817d-8c9d65dda058'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
We all have bore witness Jesus Christ has risen'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Geta tenestual elil elil belu
Amlak tenestual yemisirach belu
Musina mekabir be haylu atfito
Hulachin ayenew Kiristos tenesto';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ebb2a6ec-3538-4433-817d-8c9d65dda058'::uuid, 'the-lord-has-risen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-gracious-and-adored-interceder ("The Gracious and Adored Interceder")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1b85707e-bd94-485e-810d-9ed2cd2742b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
So the human race takes after thee'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Cheritu amalajitu hoy
Enatu neshina le Adonay
Be Silassie fit siltan yalesh
Ye bahiryachin memekya nesh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = 'Cheritu amalajitu hoy
Enatu neshina le Adonay
Be Silassie fit siltan yalesh
Ye bahiryachin memekya nesh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1b85707e-bd94-485e-810d-9ed2cd2742b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
So the human race takes after thee'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Cheritu amalajitu hoy
Enatu neshina le Adonay
Be Silassie fit siltan yalesh
Ye bahiryachin memekya nesh';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1b85707e-bd94-485e-810d-9ed2cd2742b5'::uuid, 'the-gracious-and-adored-interceder', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- azigne-simeta-betish ("Azigne Simeta Betish")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5b84f1a9-7698-471f-94fb-33a06c704e5c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 1
ይቅር ባይ ስለሆነ ልጅሽ
በቀኙ በክብር ያለሽ
በምልጃሽ ለምተማመነዉ
ማሪያም ስምሽ ጎልቤቴ ነው

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 2
ነሽና የመዳኒቴ ምንጭ
ሰላምን ደስታን የምታሰጭ
ቀዳሁኝ የነፍሴን ፈውስ
ይገባል አንቺን ማወደስ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 3
ፅዮን ሆይ ነሽ መማፀኛዬ
ውበቴ ክብሬ መድመቂያዬ
ዘወትር እላለሁ ቸመስገን
እግዚአብሔር አንቺን ሰለሰጠኝ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 4
ፀሎቴ ከልጅሽ ፊት ይግባ
ይታበስ ከአይኖቼ እንባ
ቁሚሊኝ ከአምላኬ ልታረቅ
ትካዜ ሐዘኔ እንዲርቅ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 5
ላንቺ ነው የምነግር ጉድለቴን
እንዲለብስ እራቁትነቴ
አልርቅም ድንግል ካንቺ ደጅ
ውሃዬ ሆኗል ወይንጠጅ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 1
Yiqr bay silehone lijsh
Beqegnu bekbr yalesh
Bemljash lemtemamenewu
Mariyam simsh golbete new

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 2
Neshna yemedanite minch’
Selamn destan yemtasech’
Qedahugn yenefsen fews
Yigebal anchin mawedes

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 3
Ts’yon hoy nesh memats’egnaye
Wibete kibre medmeqiyaye
Zewetr elalehu chemesgen
Egziabher anchin seleset’egn

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 4
Ts’elote keljsh fit yigba
Yitabes keaynoche enba
Qumilign keamlake litareq
Tikaze hezene endirq

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 5
Lanchi new yemnegr gudleten
Endilebs eraqutnete
Alrqm Dingil kanchi dej
Wihaye honwal weynt’ej

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 1
ይቅር ባይ ስለሆነ ልጅሽ
በቀኙ በክብር ያለሽ
በምልጃሽ ለምተማመነዉ
ማሪያም ስምሽ ጎልቤቴ ነው

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 2
ነሽና የመዳኒቴ ምንጭ
ሰላምን ደስታን የምታሰጭ
ቀዳሁኝ የነፍሴን ፈውስ
ይገባል አንቺን ማወደስ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 3
ፅዮን ሆይ ነሽ መማፀኛዬ
ውበቴ ክብሬ መድመቂያዬ
ዘወትር እላለሁ ቸመስገን
እግዚአብሔር አንቺን ሰለሰጠኝ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 4
ፀሎቴ ከልጅሽ ፊት ይግባ
ይታበስ ከአይኖቼ እንባ
ቁሚሊኝ ከአምላኬ ልታረቅ
ትካዜ ሐዘኔ እንዲርቅ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 5
ላንቺ ነው የምነግር ጉድለቴን
እንዲለብስ እራቁትነቴ
አልርቅም ድንግል ካንቺ ደጅ
ውሃዬ ሆኗል ወይንጠጅ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ',
        lyrics_transliteration = 'CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 1
Yiqr bay silehone lijsh
Beqegnu bekbr yalesh
Bemljash lemtemamenewu
Mariyam simsh golbete new

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 2
Neshna yemedanite minch’
Selamn destan yemtasech’
Qedahugn yenefsen fews
Yigebal anchin mawedes

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 3
Ts’yon hoy nesh memats’egnaye
Wibete kibre medmeqiyaye
Zewetr elalehu chemesgen
Egziabher anchin seleset’egn

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 4
Ts’elote keljsh fit yigba
Yitabes keaynoche enba
Qumilign keamlake litareq
Tikaze hezene endirq

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 5
Lanchi new yemnegr gudleten
Endilebs eraqutnete
Alrqm Dingil kanchi dej
Wihaye honwal weynt’ej

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5b84f1a9-7698-471f-94fb-33a06c704e5c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 1
ይቅር ባይ ስለሆነ ልጅሽ
በቀኙ በክብር ያለሽ
በምልጃሽ ለምተማመነዉ
ማሪያም ስምሽ ጎልቤቴ ነው

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 2
ነሽና የመዳኒቴ ምንጭ
ሰላምን ደስታን የምታሰጭ
ቀዳሁኝ የነፍሴን ፈውስ
ይገባል አንቺን ማወደስ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 3
ፅዮን ሆይ ነሽ መማፀኛዬ
ውበቴ ክብሬ መድመቂያዬ
ዘወትር እላለሁ ቸመስገን
እግዚአብሔር አንቺን ሰለሰጠኝ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 4
ፀሎቴ ከልጅሽ ፊት ይግባ
ይታበስ ከአይኖቼ እንባ
ቁሚሊኝ ከአምላኬ ልታረቅ
ትካዜ ሐዘኔ እንዲርቅ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 5
ላንቺ ነው የምነግር ጉድለቴን
እንዲለብስ እራቁትነቴ
አልርቅም ድንግል ካንቺ ደጅ
ውሃዬ ሆኗል ወይንጠጅ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5b84f1a9-7698-471f-94fb-33a06c704e5c'::uuid, 'azigne-simeta-betish', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-old-is-gone ("The Old is Gone")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f68d5df5-188e-4a56-83f5-750fe244f750'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
My King comes shining in the night'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f68d5df5-188e-4a56-83f5-750fe244f750'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
My King comes shining in the night'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f68d5df5-188e-4a56-83f5-750fe244f750'::uuid, 'the-old-is-gone', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-spirit ("The Spirit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ca71782e-686f-4434-8aab-101a46ad3d80'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
I worship You with devotion (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ca71782e-686f-4434-8aab-101a46ad3d80'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
I worship You with devotion (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ca71782e-686f-4434-8aab-101a46ad3d80'::uuid, 'the-spirit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- medihanit-neh-anite ("Medihanit Neh Anite")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '61cae4bc-58e1-4f09-a84d-1ca516c56a9c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 1
ከስም ሁሉ በላይ ስምህስ ልዩ ነው
ከሰማያት በላይ እንድንድንበት
ተሰጠን ይኸ ስም እንድናምንበት
ማዕበሉን ያቆመ ባህር የከፈለው

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 2
የአምላካችን ስሙ የፀና ግንብ ነው
ለፍርድ ቢያቆሙንም በሸንጓቸው ከሰው
እንዳታስተምሩ በኢሱስ ስም ብለው
አይሁድን ሳንፈራ ሰበክነው በአዋጅ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 3
ስለተገለጠ አለሙን ሊዋጅ
ከሰው ይልቅ ለአምላክ ይገባል መታዘዝ
እንዴት እንኖራለን ቅዱሱን ስም ሳንይዝ
ሞት ነው ወይስ እርሃብ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 4
ስደት ወይ መከራ
እኛን የሚያዘገይ ስሙን እንዳንጠራ
ሽባውን ተርተርነን እውር ያበራነው
ጎባጣን አቅንተን ድንቅን ያደረግነው

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 5
በእርሱ ስም ሰብከን ነው
በእርሱ ስም ተማፅነን
አልጫውን ዓለም በወንጌል ያጣፈጥን
የሚመጣው ቢሆን ያለውም ቢሆን

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 6
ሊያቆመን አይችልም ከእርሱ ሊለየን
ከመከራ ስጋ ከመከራ ነፍስ
ስሙ ነው መድሃኒት
ስሙ እኮ ነው ፈውስ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 1
Kesm hulu belay simhs liyu new
Kesemayat belay endndnbet
Teset’en yiኸ sim endnamnbet
Maebelun yaqome bahr yekefelew

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 2
Yeamlakachn simu yets’ena ginb new
Lefrd biyaqomunm beshengwachew kesew
Endatastemru beisus sim bilew
Ayhudn sanfera sebeknew beawaj

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 3
Siletegelet’e alemun liwaj
Kesew yilq leamlak yigebal metazez
Endet ennoralen qidusun sim sanyz
Mot new weys erhab

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 4
Sidet wey mekera
Egnan yemiyazegey simun endant’era
Shbawn terternen ewr yaberanew
Gobat’an aqnten dinqn yaderegnew

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 5
Beersu sim sebken new
Beersu sim temats’nen
Alch’awn alem bewengel yat’afet’n
Yemimet’aw bihon yalewm bihon

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 6
Liyaqomen aychlm keersu lileyen
Kemekera siga kemekera nefs
Simu new medhanit
Simu eko new fews

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 1
ከስም ሁሉ በላይ ስምህስ ልዩ ነው
ከሰማያት በላይ እንድንድንበት
ተሰጠን ይኸ ስም እንድናምንበት
ማዕበሉን ያቆመ ባህር የከፈለው

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 2
የአምላካችን ስሙ የፀና ግንብ ነው
ለፍርድ ቢያቆሙንም በሸንጓቸው ከሰው
እንዳታስተምሩ በኢሱስ ስም ብለው
አይሁድን ሳንፈራ ሰበክነው በአዋጅ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 3
ስለተገለጠ አለሙን ሊዋጅ
ከሰው ይልቅ ለአምላክ ይገባል መታዘዝ
እንዴት እንኖራለን ቅዱሱን ስም ሳንይዝ
ሞት ነው ወይስ እርሃብ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 4
ስደት ወይ መከራ
እኛን የሚያዘገይ ስሙን እንዳንጠራ
ሽባውን ተርተርነን እውር ያበራነው
ጎባጣን አቅንተን ድንቅን ያደረግነው

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 5
በእርሱ ስም ሰብከን ነው
በእርሱ ስም ተማፅነን
አልጫውን ዓለም በወንጌል ያጣፈጥን
የሚመጣው ቢሆን ያለውም ቢሆን

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 6
ሊያቆመን አይችልም ከእርሱ ሊለየን
ከመከራ ስጋ ከመከራ ነፍስ
ስሙ ነው መድሃኒት
ስሙ እኮ ነው ፈውስ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው',
        lyrics_transliteration = 'CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 1
Kesm hulu belay simhs liyu new
Kesemayat belay endndnbet
Teset’en yiኸ sim endnamnbet
Maebelun yaqome bahr yekefelew

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 2
Yeamlakachn simu yets’ena ginb new
Lefrd biyaqomunm beshengwachew kesew
Endatastemru beisus sim bilew
Ayhudn sanfera sebeknew beawaj

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 3
Siletegelet’e alemun liwaj
Kesew yilq leamlak yigebal metazez
Endet ennoralen qidusun sim sanyz
Mot new weys erhab

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 4
Sidet wey mekera
Egnan yemiyazegey simun endant’era
Shbawn terternen ewr yaberanew
Gobat’an aqnten dinqn yaderegnew

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 5
Beersu sim sebken new
Beersu sim temats’nen
Alch’awn alem bewengel yat’afet’n
Yemimet’aw bihon yalewm bihon

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 6
Liyaqomen aychlm keersu lileyen
Kemekera siga kemekera nefs
Simu new medhanit
Simu eko new fews

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new',
        updated_at = clock_timestamp()::text
    WHERE import_id = '61cae4bc-58e1-4f09-a84d-1ca516c56a9c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 1
ከስም ሁሉ በላይ ስምህስ ልዩ ነው
ከሰማያት በላይ እንድንድንበት
ተሰጠን ይኸ ስም እንድናምንበት
ማዕበሉን ያቆመ ባህር የከፈለው

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 2
የአምላካችን ስሙ የፀና ግንብ ነው
ለፍርድ ቢያቆሙንም በሸንጓቸው ከሰው
እንዳታስተምሩ በኢሱስ ስም ብለው
አይሁድን ሳንፈራ ሰበክነው በአዋጅ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 3
ስለተገለጠ አለሙን ሊዋጅ
ከሰው ይልቅ ለአምላክ ይገባል መታዘዝ
እንዴት እንኖራለን ቅዱሱን ስም ሳንይዝ
ሞት ነው ወይስ እርሃብ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 4
ስደት ወይ መከራ
እኛን የሚያዘገይ ስሙን እንዳንጠራ
ሽባውን ተርተርነን እውር ያበራነው
ጎባጣን አቅንተን ድንቅን ያደረግነው

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 5
በእርሱ ስም ሰብከን ነው
በእርሱ ስም ተማፅነን
አልጫውን ዓለም በወንጌል ያጣፈጥን
የሚመጣው ቢሆን ያለውም ቢሆን

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 6
ሊያቆመን አይችልም ከእርሱ ሊለየን
ከመከራ ስጋ ከመከራ ነፍስ
ስሙ ነው መድሃኒት
ስሙ እኮ ነው ፈውስ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '61cae4bc-58e1-4f09-a84d-1ca516c56a9c'::uuid, 'medihanit-neh-anite', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egiziabiherin-amesiginu ("Egiziabiherin Amesiginu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '61433fc6-fa3e-46d5-a561-2a69265a2d0b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 1
ያጸናው እርሱ ነው
ሥራህ ድንቅ ነው በሉት
የባሕርን ጥልቀት የመጠነ
ዳርቻዋን የወሰነ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 2
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት
ማዕበል ንፋስ የሚገሥጽ
ፍጥረቱ ለስሙ የሚታዘዘ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 3
ትጉኅ እረኛ ድካም የሌለበት
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ንጹሐ ባሕርይ ነው ሁሉን የሚገዛ
የነገሥታት ንጉሥ አልፋና ኦሜጋ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 4
ዘለዓለም እርሱ የማይለወጥ
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ጥበብን የሚገልጽ ጥበበኛ
ፍርድ የሚያደርግ እውነተኛ ዳኛ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 5
እንደርሱ ያለ ከቶ አይገኝም
እግዚአብሔር ግሩም ነው ዘለዓለም

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 1
Yats’enaw ersu new
Sirah dinq new belut
Yebahrn t’lqet yemet’ene
Darchawan yewesene

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 2
Egziabhern amesgnut
Sirah girum dinq new belut
Maebel nifas yemigests’
Fit’retu lesmu yemitazeze

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 3
Tiguh eregna dikam yelelebet
Egziabhern sirah dinq new belut
Nits’uhe bahry new hulun yemigeza
Yenegestat nigus alfana omega

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 4
Zelealem ersu yemaylewet’
Egziabhern sirah dinq new belut
T’bebn yemigelts’ t’bebegna
Fird yemiyaderg ewnetegna dagna

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 5
Endersu yale keto aygegnm
Egziabher girum new zelealem

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 1
ያጸናው እርሱ ነው
ሥራህ ድንቅ ነው በሉት
የባሕርን ጥልቀት የመጠነ
ዳርቻዋን የወሰነ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 2
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት
ማዕበል ንፋስ የሚገሥጽ
ፍጥረቱ ለስሙ የሚታዘዘ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 3
ትጉኅ እረኛ ድካም የሌለበት
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ንጹሐ ባሕርይ ነው ሁሉን የሚገዛ
የነገሥታት ንጉሥ አልፋና ኦሜጋ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 4
ዘለዓለም እርሱ የማይለወጥ
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ጥበብን የሚገልጽ ጥበበኛ
ፍርድ የሚያደርግ እውነተኛ ዳኛ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 5
እንደርሱ ያለ ከቶ አይገኝም
እግዚአብሔር ግሩም ነው ዘለዓለም

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት',
        lyrics_transliteration = 'CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 1
Yats’enaw ersu new
Sirah dinq new belut
Yebahrn t’lqet yemet’ene
Darchawan yewesene

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 2
Egziabhern amesgnut
Sirah girum dinq new belut
Maebel nifas yemigests’
Fit’retu lesmu yemitazeze

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 3
Tiguh eregna dikam yelelebet
Egziabhern sirah dinq new belut
Nits’uhe bahry new hulun yemigeza
Yenegestat nigus alfana omega

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 4
Zelealem ersu yemaylewet’
Egziabhern sirah dinq new belut
T’bebn yemigelts’ t’bebegna
Fird yemiyaderg ewnetegna dagna

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret

VERSE 5
Endersu yale keto aygegnm
Egziabher girum new zelealem

CHORUS
Egziabhern amesgnut
Sirah girum dinq new belut (2)
Semayn yale miseso
Midrnm yale meseret',
        updated_at = clock_timestamp()::text
    WHERE import_id = '61433fc6-fa3e-46d5-a561-2a69265a2d0b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 1
ያጸናው እርሱ ነው
ሥራህ ድንቅ ነው በሉት
የባሕርን ጥልቀት የመጠነ
ዳርቻዋን የወሰነ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 2
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት
ማዕበል ንፋስ የሚገሥጽ
ፍጥረቱ ለስሙ የሚታዘዘ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 3
ትጉኅ እረኛ ድካም የሌለበት
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ንጹሐ ባሕርይ ነው ሁሉን የሚገዛ
የነገሥታት ንጉሥ አልፋና ኦሜጋ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 4
ዘለዓለም እርሱ የማይለወጥ
እግዚአብሔርን ሥራህ ድንቅ ነው በሉት
ጥበብን የሚገልጽ ጥበበኛ
ፍርድ የሚያደርግ እውነተኛ ዳኛ

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት

VERSE 5
እንደርሱ ያለ ከቶ አይገኝም
እግዚአብሔር ግሩም ነው ዘለዓለም

CHORUS
እግዚአብሔርን አመስግኑት
ሥራህ ግሩም ድንቅ ነው በሉት (፪)
ሰማይን ያለ ምሰሶ
ምድርንም ያለ መሠረት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '61433fc6-fa3e-46d5-a561-2a69265a2d0b'::uuid, 'egiziabiherin-amesiginu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- before-the-most-high ("Before the most high")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e0f784a6-32a8-464f-9cf7-1a274670cfcd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር

VERSE 1
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር

CHORUS
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir

VERSE 1
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir

CHORUS
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር

VERSE 1
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር

CHORUS
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር',
        lyrics_transliteration = 'CHORUS
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir

VERSE 1
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir

CHORUS
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e0f784a6-32a8-464f-9cf7-1a274670cfcd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር

VERSE 1
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር

CHORUS
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir

VERSE 1
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir

CHORUS
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e0f784a6-32a8-464f-9cf7-1a274670cfcd'::uuid, 'before-the-most-high', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kulu-tkeel-ika ("kulu tkeel ika+")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e6cbda94-2209-439e-a494-0f8d9ea9411f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 1
ምስኪን ነፍሰይ ድምጽኻ ናፊቁ
በይነይ ኣይክሎን እየ ከቢድ ሚዛን ጾረይ
ተስፋይ ደገፍካዩ ኢየሱስ መድሕነይ (2)
ኣምላኸይ ስምዓዮ ጽን በሎ ቃላተይ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 2
ንጉሁይ ልበይ ኣህድእ ንመንፈሰይ
ልመናይ ተቐበል ኣቕልበሉ ድምጸይ
ብኽያት ይኣኽለኒ ሓበሶ ንብዓተይ
ሎሚ ውን ይጽውዕ ከይረብረብኩ ስምካ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 3
ክሳብ ዝምልከታኒ የዒንትኻ
ቆይመ ኣብ ልዳት ቤትካ የብጽሕ ጸሎተይ
ተወኪለካ’የ ልዕሊ ኩነታተይ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 1
Miskin nefsey dimts’ኻ nafiqu
Beyney ayklon eye kebid mizan ts’orey
Tesfay degefkayu Iyesus medhney (2)
Amlaኸy simayo ts’n belo qalatey

CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 2
Niguhuy libey ahde nimenfesey
Limenay teቐbel aቕlbelu dimts’ey
Biኽyat yiaኽleni habeso nibatey
Lomi win yits’we keyrebrebku simka

CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 3
Kisab zimlketani yeintኻ
Qoyme ab lidat betka yebts’h ts’elotey
Tewekileka’ye lieli kunetatey

CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 1
ምስኪን ነፍሰይ ድምጽኻ ናፊቁ
በይነይ ኣይክሎን እየ ከቢድ ሚዛን ጾረይ
ተስፋይ ደገፍካዩ ኢየሱስ መድሕነይ (2)
ኣምላኸይ ስምዓዮ ጽን በሎ ቃላተይ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 2
ንጉሁይ ልበይ ኣህድእ ንመንፈሰይ
ልመናይ ተቐበል ኣቕልበሉ ድምጸይ
ብኽያት ይኣኽለኒ ሓበሶ ንብዓተይ
ሎሚ ውን ይጽውዕ ከይረብረብኩ ስምካ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 3
ክሳብ ዝምልከታኒ የዒንትኻ
ቆይመ ኣብ ልዳት ቤትካ የብጽሕ ጸሎተይ
ተወኪለካ’የ ልዕሊ ኩነታተይ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ',
        lyrics_transliteration = 'CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 1
Miskin nefsey dimts’ኻ nafiqu
Beyney ayklon eye kebid mizan ts’orey
Tesfay degefkayu Iyesus medhney (2)
Amlaኸy simayo ts’n belo qalatey

CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 2
Niguhuy libey ahde nimenfesey
Limenay teቐbel aቕlbelu dimts’ey
Biኽyat yiaኽleni habeso nibatey
Lomi win yits’we keyrebrebku simka

CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 3
Kisab zimlketani yeintኻ
Qoyme ab lidat betka yebts’h ts’elotey
Tewekileka’ye lieli kunetatey

CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e6cbda94-2209-439e-a494-0f8d9ea9411f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 1
ምስኪን ነፍሰይ ድምጽኻ ናፊቁ
በይነይ ኣይክሎን እየ ከቢድ ሚዛን ጾረይ
ተስፋይ ደገፍካዩ ኢየሱስ መድሕነይ (2)
ኣምላኸይ ስምዓዮ ጽን በሎ ቃላተይ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 2
ንጉሁይ ልበይ ኣህድእ ንመንፈሰይ
ልመናይ ተቐበል ኣቕልበሉ ድምጸይ
ብኽያት ይኣኽለኒ ሓበሶ ንብዓተይ
ሎሚ ውን ይጽውዕ ከይረብረብኩ ስምካ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 3
ክሳብ ዝምልከታኒ የዒንትኻ
ቆይመ ኣብ ልዳት ቤትካ የብጽሕ ጸሎተይ
ተወኪለካ’የ ልዕሊ ኩነታተይ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e6cbda94-2209-439e-a494-0f8d9ea9411f'::uuid, 'kulu-tkeel-ika', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- there-is-no-one-like-you ("There Is No One Like You")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '73e7ca83-a70c-4245-908a-f17849fa50a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Everlasting you are salvation'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yalante lene man lihonegn
Geta hoy fikrih liben nekagn
Higih nebere yafe mefcha
Yematiqeyer ante bicha'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
        lyrics_transliteration = 'Yalante lene man lihonegn
Geta hoy fikrih liben nekagn
Higih nebere yafe mefcha
Yematiqeyer ante bicha',
        updated_at = clock_timestamp()::text
    WHERE import_id = '73e7ca83-a70c-4245-908a-f17849fa50a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
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
Everlasting you are salvation'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yalante lene man lihonegn
Geta hoy fikrih liben nekagn
Higih nebere yafe mefcha
Yematiqeyer ante bicha';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '73e7ca83-a70c-4245-908a-f17849fa50a1'::uuid, 'there-is-no-one-like-you', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tilin-bemeskelu-gedele ("Tilin Bemeskelu Gedele")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f60a35cf-b6e8-42a1-884b-72ee9cb34386'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)

VERSE 1
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)

CHORUS
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)

VERSE 1
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)

CHORUS
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f60a35cf-b6e8-42a1-884b-72ee9cb34386'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)

VERSE 1
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)

CHORUS
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)

VERSE 1
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)

CHORUS
tln bemesqelu gedele (*2)
bemesqelu lesew lj selamn edele (*2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f60a35cf-b6e8-42a1-884b-72ee9cb34386'::uuid, 'tilin-bemeskelu-gedele', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- timkihte-zemedne ("Timkihte Zemedne")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '55230536-32c3-405c-8b80-826c77188e62'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትምክህተ ዘመድነ
ትምክህተ ዘመድነ
በወሊዶታ ዚአነ /2 ጊዜ/

VERSE 1
ይእቲ እግዝእትነ
እግዝእትነ ማርያም ድንግል::

CHORUS
ትምክህተ ዘመድነ
ትምክህተ ዘመድነ
በወሊዶታ ዚአነ /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
tmkhte zemedne
tmkhte zemedne
bewelidota ziene /2 gize/

VERSE 1
yti gztne
gztne maryam dngl::

CHORUS
tmkhte zemedne
tmkhte zemedne
bewelidota ziene /2 gize/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '55230536-32c3-405c-8b80-826c77188e62'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትምክህተ ዘመድነ
ትምክህተ ዘመድነ
በወሊዶታ ዚአነ /2 ጊዜ/

VERSE 1
ይእቲ እግዝእትነ
እግዝእትነ ማርያም ድንግል::

CHORUS
ትምክህተ ዘመድነ
ትምክህተ ዘመድነ
በወሊዶታ ዚአነ /2 ጊዜ/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
tmkhte zemedne
tmkhte zemedne
bewelidota ziene /2 gize/

VERSE 1
yti gztne
gztne maryam dngl::

CHORUS
tmkhte zemedne
tmkhte zemedne
bewelidota ziene /2 gize/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '55230536-32c3-405c-8b80-826c77188e62'::uuid, 'timkihte-zemedne', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tinsaeke-leele-amene ("Tinsaeke Le’ele Amene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ad6ebf13-c196-4b6b-ae28-23ff3585d4ff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)

VERSE 1
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)

CHORUS
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)

VERSE 1
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)

CHORUS
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ad6ebf13-c196-4b6b-ae28-23ff3585d4ff'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)

VERSE 1
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)

CHORUS
ትንሣኤከ ለእለ አመነ (2)
ፈኑ ዲቤነ ብርሃነከ ፈኑ ዲቤነ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)

VERSE 1
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)

CHORUS
Tinsaeke le’ele amene (2)
Fenu dibene birhaneke fenu dibene (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ad6ebf13-c196-4b6b-ae28-23ff3585d4ff'::uuid, 'tinsaeke-leele-amene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tilk-fiker-deacon-zemari-endale-dereje ("TILK FIKER DEACON ZEMARI ENDALE DEREJE")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '62468ab4-576e-42c0-9f14-65192821b1b6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ልጅህ ዳንኩኝ ሞቴ ሞተ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Lijh dankugn mote mote'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '62468ab4-576e-42c0-9f14-65192821b1b6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ልጅህ ዳንኩኝ ሞቴ ሞተ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '62468ab4-576e-42c0-9f14-65192821b1b6'::uuid, 'tilk-fiker-deacon-zemari-endale-dereje', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
