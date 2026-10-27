-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 30 OF 32
-- Target Table: public.mezmur_data_import
-- Total Records in Batch: 34
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
  -- mariyam-eniwedishalen-977 ("ማርያም እንወድሻለን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f4ad1109-7ad4-4902-a8f9-a4f963429da1'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 1
Dikmeten aty…………Maryam
Behet’iyat mewedeqen……..Maryam
Tesfaye anchi nesh ……….Maryam
Eskeletemote …………….Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 2
Lalkedash miyalehu ………..Maryam
Kesrsh lalt’efa ………….Maryam
Gets’e berekete ……………….Maryam
Yehywete wastna ………..Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 3
°°°°
Yememenan wibet …… Maryam
Zewd aklilachew ………Maryam
Dingil anchi eko nesh …….Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 4
Yemenged sinqachew …… Maryam
Miskr negn leanchi ………Maryam
Endenebyatu ………………Maryam
Sit’ota mehonshn …………Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 5
Leadam lijoch hulu ………Maryam
°°°°
Mogesna ts’ega ……………Maryam
Begeta fit yalesh ………Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 6
Was t’ebeqachn nesh….….Maryam
Endet neber yane …….Maryam
Getan sitwelji ……..Maryam
Yeeregnochu desta ………Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 7
Yemelaekt zimare ……Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 1
ድክመቴን አትይ…………ማርያም
በሀጢያት መወደቄን……..ማርያም
ተስፋዬ አንቺ ነሽ ……….ማርያም
እስከለተሞቴ …………….ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 2
ላልከዳሽ ምያለሁ ………..ማርያም
ከስርሽ ላልጠፋ ………….ማርያም
ገፀ በረከቴ ……………….ማርያም
የህይወቴ ዋስትና ………..ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 3
°°°°
የምእመናን ውበት …… ማርያም
ዘውድ አክሊላቸው ………ማርያም
ድንግል አንቺ እኮ ነሽ …….ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 4
የመንገድ ስንቃቸው …… ማርያም
ምስክር ነኝ ለአንቺ ………ማርያም
እንደነብያቱ ………………ማርያም
ስጦታ መሆንሽን …………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 5
ለአዳም ልጆች ሁሉ ………ማርያም
°°°°
ሞገስና ፀጋ ……………ማርያም
በጌታ ፊት ያለሽ ………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 6
ዋስ ጠበቃችን ነሽ….….ማርያም
እንዴት ነበር ያኔ …….ማርያም
ጌታን ስትወልጂ ……..ማርያም
የእረኞቹ ደስታ ………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 7
የመላእክት ዝማሬ ……ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 1
ድክመቴን አትይ…………ማርያም
በሀጢያት መወደቄን……..ማርያም
ተስፋዬ አንቺ ነሽ ……….ማርያም
እስከለተሞቴ …………….ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 2
ላልከዳሽ ምያለሁ ………..ማርያም
ከስርሽ ላልጠፋ ………….ማርያም
ገፀ በረከቴ ……………….ማርያም
የህይወቴ ዋስትና ………..ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 3
°°°°
የምእመናን ውበት …… ማርያም
ዘውድ አክሊላቸው ………ማርያም
ድንግል አንቺ እኮ ነሽ …….ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 4
የመንገድ ስንቃቸው …… ማርያም
ምስክር ነኝ ለአንቺ ………ማርያም
እንደነብያቱ ………………ማርያም
ስጦታ መሆንሽን …………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 5
ለአዳም ልጆች ሁሉ ………ማርያም
°°°°
ሞገስና ፀጋ ……………ማርያም
በጌታ ፊት ያለሽ ………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 6
ዋስ ጠበቃችን ነሽ….….ማርያም
እንዴት ነበር ያኔ …….ማርያም
ጌታን ስትወልጂ ……..ማርያም
የእረኞቹ ደስታ ………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 7
የመላእክት ዝማሬ ……ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°' THEN lyrics_amharic 
          ELSE 'CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 1
ድክመቴን አትይ…………ማርያም
በሀጢያት መወደቄን……..ማርያም
ተስፋዬ አንቺ ነሽ ……….ማርያም
እስከለተሞቴ …………….ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 2
ላልከዳሽ ምያለሁ ………..ማርያም
ከስርሽ ላልጠፋ ………….ማርያም
ገፀ በረከቴ ……………….ማርያም
የህይወቴ ዋስትና ………..ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 3
°°°°
የምእመናን ውበት …… ማርያም
ዘውድ አክሊላቸው ………ማርያም
ድንግል አንቺ እኮ ነሽ …….ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 4
የመንገድ ስንቃቸው …… ማርያም
ምስክር ነኝ ለአንቺ ………ማርያም
እንደነብያቱ ………………ማርያም
ስጦታ መሆንሽን …………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 5
ለአዳም ልጆች ሁሉ ………ማርያም
°°°°
ሞገስና ፀጋ ……………ማርያም
በጌታ ፊት ያለሽ ………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 6
ዋስ ጠበቃችን ነሽ….….ማርያም
እንዴት ነበር ያኔ …….ማርያም
ጌታን ስትወልጂ ……..ማርያም
የእረኞቹ ደስታ ………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 7
የመላእክት ዝማሬ ……ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°' 
        END,
        lyrics_transliteration = 'CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 1
Dikmeten aty…………Maryam
Behet’iyat mewedeqen……..Maryam
Tesfaye anchi nesh ……….Maryam
Eskeletemote …………….Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 2
Lalkedash miyalehu ………..Maryam
Kesrsh lalt’efa ………….Maryam
Gets’e berekete ……………….Maryam
Yehywete wastna ………..Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 3
°°°°
Yememenan wibet …… Maryam
Zewd aklilachew ………Maryam
Dingil anchi eko nesh …….Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 4
Yemenged sinqachew …… Maryam
Miskr negn leanchi ………Maryam
Endenebyatu ………………Maryam
Sit’ota mehonshn …………Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 5
Leadam lijoch hulu ………Maryam
°°°°
Mogesna ts’ega ……………Maryam
Begeta fit yalesh ………Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 6
Was t’ebeqachn nesh….….Maryam
Endet neber yane …….Maryam
Getan sitwelji ……..Maryam
Yeeregnochu desta ………Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°

VERSE 7
Yemelaekt zimare ……Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
°°°°',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f4ad1109-7ad4-4902-a8f9-a4f963429da1'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 1
ድክመቴን አትይ…………ማርያም
በሀጢያት መወደቄን……..ማርያም
ተስፋዬ አንቺ ነሽ ……….ማርያም
እስከለተሞቴ …………….ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 2
ላልከዳሽ ምያለሁ ………..ማርያም
ከስርሽ ላልጠፋ ………….ማርያም
ገፀ በረከቴ ……………….ማርያም
የህይወቴ ዋስትና ………..ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 3
°°°°
የምእመናን ውበት …… ማርያም
ዘውድ አክሊላቸው ………ማርያም
ድንግል አንቺ እኮ ነሽ …….ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 4
የመንገድ ስንቃቸው …… ማርያም
ምስክር ነኝ ለአንቺ ………ማርያም
እንደነብያቱ ………………ማርያም
ስጦታ መሆንሽን …………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 5
ለአዳም ልጆች ሁሉ ………ማርያም
°°°°
ሞገስና ፀጋ ……………ማርያም
በጌታ ፊት ያለሽ ………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 6
ዋስ ጠበቃችን ነሽ….….ማርያም
እንዴት ነበር ያኔ …….ማርያም
ጌታን ስትወልጂ ……..ማርያም
የእረኞቹ ደስታ ………ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°

VERSE 7
የመላእክት ዝማሬ ……ማርያም

CHORUS
ማርያም እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ማርያም_እንወድሻለን/2/
ስለወለድሽ የህይወት ምግብን
ማርያም እንወድሻለን
°°°°
ድክመቴን አትይ…………ማርያም
በሀጢያት መወደቄን……..ማርያም
ተስፋዬ አንቺ ነሽ ……….ማርያም
እስከለተሞቴ …………….ማርያም
ላልከዳሽ ምያለሁ ………..ማርያም
ከስርሽ ላልጠፋ ………….ማርያም
ገፀ በረከቴ ……………….ማርያም
የህይወቴ ዋስትና ………..ማርያም
°°°°
የምእመናን ውበት ……....ማርያም
ዘውድ አክሊላቸው ………ማርያም
ድንግል አንቺ እኮ ነሽ …….ማርያም
የመንገድ ስንቃቸው ……...ማርያም
ምስክር ነኝ ለአንቺ ………ማርያም
እንደነብያቱ ………………ማርያም
ስጦታ መሆንሽን …………ማርያም
ለአዳም ልጆች ሁሉ ………ማርያም
°°°°
ሞገስና ፀጋ ……………ማርያም
በጌታ ፊት ያለሽ ………ማርያም
ዋስ ጠበቃችን ነሽ….….ማርያም
እንዴት ነበር ያኔ …….ማርያም
ጌታን ስትወልጂ ……..ማርያም
የእረኞቹ ደስታ ………ማርያም
የመላእክት ዝማሬ ……ማርያም'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f4ad1109-7ad4-4902-a8f9-a4f963429da1'::uuid, 'mariyam-eniwedishalen-977', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bereket-tikue-orthodox-tewahdo-mezmur ("ምስሊ : ናይ ሕብረት መዝሙር #")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2828a01f-2b03-4e30-ae7e-a4f2bf2852ac'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 1
Ab medibuna qidmi misrat alem
Abo medibuna qidmi misrat alem(x2)
Reayu mo nay ab liwehat zeyblu mesferi
Bidኹmat enkolena( zigodelena kibri)x2

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 2
Nihade wedu liiኹ nabzi midri
Hiyawan geruna teኻfelti natu bahri
Misana tezamidu liel keblena
Aba abo enabelna kints’wo tebiena

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 3
Niknts’wo tebiena
Erbun midhan menfesu hatimuna
Bidem fiቑr wedu nab zifanu aቕribuna
Bimhretu ina reኺbna nay zelalem hiwet

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 4
Bits’dqna aykonan zemlet’na kab maeserti mot
Zemlet’na kabti ts’elmat
Kibri yiኹno niabo birhanat
Werestu geruna bits’ega biemnet

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 5
Zitegagekwo yitaremeley

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 1
ኣብ መዲቡና ቅድሚ ምስራት ዓለም
አቦ መዲቡና ቅድሚ ምስራት ዓለም(x2)
ረኣዩ ሞ ናይ ኣብ ልወሃት ዘይብሉ መስፈሪ
ብድኹማት እንኮለና( ዝጎደለና ክብሪ)x2

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 2
ንሓደ ወዱ ሊኢኹ ናብዚ ምድሪ
ህያዋን ጌሩና ተኻፈልቲ ናቱ ባህሪ
ምሳና ተዛሚዱ ልዕል ከብለና
ኣባ አቦ እናበልና ክንጽውዖ ተቢዕና

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 3
ንክንጽውዖ ተቢዕና
ዕርቡን ምድሓን መንፈሱ ሓቲሙና
ብደም ፍቑር ወዱ ናብ ዝፋኑ ኣቕሪቡና
ብምሕረቱ ኢና ረኺብና ናይ ዘልኣለም ሂወት

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 4
ብጽድቅና ኣይኮናን ዘምለጥና ካብ ማእሰርቲ ሞት
ዘምለጥና ካብቲ ጸልማት
ክብሪ ይኹኖ ንኣቦ ብርሃናት
ወረስቱ ጌሩና ብጸጋ ብእምነት

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 5
ዝተጋገክዎ ይትኣረመለይ

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 1
ኣብ መዲቡና ቅድሚ ምስራት ዓለም
አቦ መዲቡና ቅድሚ ምስራት ዓለም(x2)
ረኣዩ ሞ ናይ ኣብ ልወሃት ዘይብሉ መስፈሪ
ብድኹማት እንኮለና( ዝጎደለና ክብሪ)x2

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 2
ንሓደ ወዱ ሊኢኹ ናብዚ ምድሪ
ህያዋን ጌሩና ተኻፈልቲ ናቱ ባህሪ
ምሳና ተዛሚዱ ልዕል ከብለና
ኣባ አቦ እናበልና ክንጽውዖ ተቢዕና

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 3
ንክንጽውዖ ተቢዕና
ዕርቡን ምድሓን መንፈሱ ሓቲሙና
ብደም ፍቑር ወዱ ናብ ዝፋኑ ኣቕሪቡና
ብምሕረቱ ኢና ረኺብና ናይ ዘልኣለም ሂወት

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 4
ብጽድቅና ኣይኮናን ዘምለጥና ካብ ማእሰርቲ ሞት
ዘምለጥና ካብቲ ጸልማት
ክብሪ ይኹኖ ንኣቦ ብርሃናት
ወረስቱ ጌሩና ብጸጋ ብእምነት

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 5
ዝተጋገክዎ ይትኣረመለይ

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል' THEN lyrics_amharic 
          ELSE 'CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 1
ኣብ መዲቡና ቅድሚ ምስራት ዓለም
አቦ መዲቡና ቅድሚ ምስራት ዓለም(x2)
ረኣዩ ሞ ናይ ኣብ ልወሃት ዘይብሉ መስፈሪ
ብድኹማት እንኮለና( ዝጎደለና ክብሪ)x2

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 2
ንሓደ ወዱ ሊኢኹ ናብዚ ምድሪ
ህያዋን ጌሩና ተኻፈልቲ ናቱ ባህሪ
ምሳና ተዛሚዱ ልዕል ከብለና
ኣባ አቦ እናበልና ክንጽውዖ ተቢዕና

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 3
ንክንጽውዖ ተቢዕና
ዕርቡን ምድሓን መንፈሱ ሓቲሙና
ብደም ፍቑር ወዱ ናብ ዝፋኑ ኣቕሪቡና
ብምሕረቱ ኢና ረኺብና ናይ ዘልኣለም ሂወት

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 4
ብጽድቅና ኣይኮናን ዘምለጥና ካብ ማእሰርቲ ሞት
ዘምለጥና ካብቲ ጸልማት
ክብሪ ይኹኖ ንኣቦ ብርሃናት
ወረስቱ ጌሩና ብጸጋ ብእምነት

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 5
ዝተጋገክዎ ይትኣረመለይ

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል' 
        END,
        lyrics_transliteration = 'CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 1
Ab medibuna qidmi misrat alem
Abo medibuna qidmi misrat alem(x2)
Reayu mo nay ab liwehat zeyblu mesferi
Bidኹmat enkolena( zigodelena kibri)x2

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 2
Nihade wedu liiኹ nabzi midri
Hiyawan geruna teኻfelti natu bahri
Misana tezamidu liel keblena
Aba abo enabelna kints’wo tebiena

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 3
Niknts’wo tebiena
Erbun midhan menfesu hatimuna
Bidem fiቑr wedu nab zifanu aቕribuna
Bimhretu ina reኺbna nay zelalem hiwet

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 4
Bits’dqna aykonan zemlet’na kab maeserti mot
Zemlet’na kabti ts’elmat
Kibri yiኹno niabo birhanat
Werestu geruna bits’ega biemnet

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl

VERSE 5
Zitegagekwo yitaremeley

CHORUS
Misli wedu niኽnmesl
Kemti misli"ti midrawi zilebesna
Kemti misli"ti mewati zilebesna
Kemu win misli wedu niኽnmesl',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2828a01f-2b03-4e30-ae7e-a4f2bf2852ac'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 1
ኣብ መዲቡና ቅድሚ ምስራት ዓለም
አቦ መዲቡና ቅድሚ ምስራት ዓለም(x2)
ረኣዩ ሞ ናይ ኣብ ልወሃት ዘይብሉ መስፈሪ
ብድኹማት እንኮለና( ዝጎደለና ክብሪ)x2

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 2
ንሓደ ወዱ ሊኢኹ ናብዚ ምድሪ
ህያዋን ጌሩና ተኻፈልቲ ናቱ ባህሪ
ምሳና ተዛሚዱ ልዕል ከብለና
ኣባ አቦ እናበልና ክንጽውዖ ተቢዕና

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 3
ንክንጽውዖ ተቢዕና
ዕርቡን ምድሓን መንፈሱ ሓቲሙና
ብደም ፍቑር ወዱ ናብ ዝፋኑ ኣቕሪቡና
ብምሕረቱ ኢና ረኺብና ናይ ዘልኣለም ሂወት

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 4
ብጽድቅና ኣይኮናን ዘምለጥና ካብ ማእሰርቲ ሞት
ዘምለጥና ካብቲ ጸልማት
ክብሪ ይኹኖ ንኣቦ ብርሃናት
ወረስቱ ጌሩና ብጸጋ ብእምነት

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል

VERSE 5
ዝተጋገክዎ ይትኣረመለይ

CHORUS
ምስሊ ወዱ ንኽንመስል
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል'
        OR lyrics_amharic IS NOT DISTINCT FROM '♡ምስሊ ወዱ ንኽንመስል♡
ከምቲ ምስሊ"ቲ ምድራዊ ዝለበስና
ከምቲ ምስሊ"ቲ መዋቲ ዝለበስና
ከምኡ ውን ምስሊ ወዱ ንኽንመስል
ኣብ መዲቡና ቅድሚ ምስራት ዓለም
አቦ መዲቡና ቅድሚ ምስራት ዓለም(x2)
ረኣዩ ሞ ናይ ኣብ ልወሃት ዘይብሉ መስፈሪ
ብድኹማት እንኮለና( ዝጎደለና ክብሪ)x2
ንሓደ ወዱ ሊኢኹ ናብዚ ምድሪ
ህያዋን ጌሩና ተኻፈልቲ ናቱ ባህሪ
ምሳና ተዛሚዱ ልዕል ከብለና
ኣባ አቦ እናበልና ክንጽውዖ ተቢዕና
ንክንጽውዖ ተቢዕና
ዕርቡን ምድሓን መንፈሱ ሓቲሙና
ብደም ፍቑር ወዱ ናብ ዝፋኑ ኣቕሪቡና
ብምሕረቱ ኢና ረኺብና ናይ ዘልኣለም ሂወት
ብጽድቅና ኣይኮናን ዘምለጥና ካብ ማእሰርቲ ሞት
ዘምለጥና ካብቲ ጸልማት
ክብሪ ይኹኖ ንኣቦ ብርሃናት
ወረስቱ ጌሩና ብጸጋ ብእምነት
ዝተጋገክዎ ይትኣረመለይ❤'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2828a01f-2b03-4e30-ae7e-a4f2bf2852ac'::uuid, 'bereket-tikue-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yelen-new-orthodox-tewahido-tigrigna-mezmur ("የለን ሓድሽ ናይ ትንሳኤ መዝሙር ትግርኛ ብሥርጉት ሚድያ ዘማርያን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '29233330-09fb-4ed0-a4c4-37ac94b20c2b'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu

VERSE 1
Megdelawit Maryam ayoኺ aytfrhi
Nihyaw mis mutan nimntay tidelyi
Telailu eyu eti hayal memhrኺ
ኽdi n hewaryat tinsaeu absri

CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu

VERSE 2
Bisga ''temote bifቕri tesiru
Bislt’an melekot goyta telailu
Tensiu Iyesus tensiu kab mutan
Wengel tebesere bitnsae birhen

CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu

VERSE 3
Bitnsae goyta keto aynt’erat’er
Sigana entlebs melekotu ayhadegen
Nimegnezey fithu ''ti emni alelwo
Enteybele eyu nimotna ቐtilwo

CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu

VERSE 4
Telalu misbelom tensiom bizuhat
''tizedenቐnas nayti zeymot mimwat
Tinsaen hiywetn baelu Kristos eyu
Bieu ziamn ''temote hiyaw''yu

CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 1
መግደላዊት ማርያም ኣዮኺ ኣይትፍርሒ
ንህያው ምስ ሙታን ንምንታይ ትደልዪ
ተላዒሉ እዩ እቲ ሓያል መምህርኺ
ኽዲ ን ሀዋርያት ትንሳኤኡ ኣብስሪ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 2
ብስጋ ''ተሞተ ብፍቕሪ ተስዒሩ
ብስልጣን መለኮት ጎይታ ተላዒሉ
ተንሲኡ ኢየሱስ ተንሲኡ ካብ ሙታን
ወንጌል ተበሰረ ብትንሳኤ ብርሀን

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 3
ብትንሳኤ ጎይታ ከቶ ኣይንጠራጠር
ስጋና እንትለብስ መለኮቱ ኣይሓደገን
ንመግነዘይ ፍትሑ ''ቲ እምኒ ኣልዕልዎ
እንተይበለ እዩ ንሞትና ቐቲልዎ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 4
ተልዓሉ ምስበሎም ተንሲኦም ብዙሓት
''ትዘደንቐናስ ናይቲ ዘይሞት ምሟት
ትንሳኤን ህይወትን ባዕሉ ክርስቶስ እዩ
ብእኡ ዝኣምን ''ተሞተ ህያው''ዩ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 1
መግደላዊት ማርያም ኣዮኺ ኣይትፍርሒ
ንህያው ምስ ሙታን ንምንታይ ትደልዪ
ተላዒሉ እዩ እቲ ሓያል መምህርኺ
ኽዲ ን ሀዋርያት ትንሳኤኡ ኣብስሪ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 2
ብስጋ ''ተሞተ ብፍቕሪ ተስዒሩ
ብስልጣን መለኮት ጎይታ ተላዒሉ
ተንሲኡ ኢየሱስ ተንሲኡ ካብ ሙታን
ወንጌል ተበሰረ ብትንሳኤ ብርሀን

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 3
ብትንሳኤ ጎይታ ከቶ ኣይንጠራጠር
ስጋና እንትለብስ መለኮቱ ኣይሓደገን
ንመግነዘይ ፍትሑ ''ቲ እምኒ ኣልዕልዎ
እንተይበለ እዩ ንሞትና ቐቲልዎ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 4
ተልዓሉ ምስበሎም ተንሲኦም ብዙሓት
''ትዘደንቐናስ ናይቲ ዘይሞት ምሟት
ትንሳኤን ህይወትን ባዕሉ ክርስቶስ እዩ
ብእኡ ዝኣምን ''ተሞተ ህያው''ዩ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ' THEN lyrics_amharic 
          ELSE 'CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 1
መግደላዊት ማርያም ኣዮኺ ኣይትፍርሒ
ንህያው ምስ ሙታን ንምንታይ ትደልዪ
ተላዒሉ እዩ እቲ ሓያል መምህርኺ
ኽዲ ን ሀዋርያት ትንሳኤኡ ኣብስሪ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 2
ብስጋ ''ተሞተ ብፍቕሪ ተስዒሩ
ብስልጣን መለኮት ጎይታ ተላዒሉ
ተንሲኡ ኢየሱስ ተንሲኡ ካብ ሙታን
ወንጌል ተበሰረ ብትንሳኤ ብርሀን

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 3
ብትንሳኤ ጎይታ ከቶ ኣይንጠራጠር
ስጋና እንትለብስ መለኮቱ ኣይሓደገን
ንመግነዘይ ፍትሑ ''ቲ እምኒ ኣልዕልዎ
እንተይበለ እዩ ንሞትና ቐቲልዎ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 4
ተልዓሉ ምስበሎም ተንሲኦም ብዙሓት
''ትዘደንቐናስ ናይቲ ዘይሞት ምሟት
ትንሳኤን ህይወትን ባዕሉ ክርስቶስ እዩ
ብእኡ ዝኣምን ''ተሞተ ህያው''ዩ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ' 
        END,
        lyrics_transliteration = 'CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu

VERSE 1
Megdelawit Maryam ayoኺ aytfrhi
Nihyaw mis mutan nimntay tidelyi
Telailu eyu eti hayal memhrኺ
ኽdi n hewaryat tinsaeu absri

CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu

VERSE 2
Bisga ''temote bifቕri tesiru
Bislt’an melekot goyta telailu
Tensiu Iyesus tensiu kab mutan
Wengel tebesere bitnsae birhen

CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu

VERSE 3
Bitnsae goyta keto aynt’erat’er
Sigana entlebs melekotu ayhadegen
Nimegnezey fithu ''ti emni alelwo
Enteybele eyu nimotna ቐtilwo

CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu

VERSE 4
Telalu misbelom tensiom bizuhat
''tizedenቐnas nayti zeymot mimwat
Tinsaen hiywetn baelu Kristos eyu
Bieu ziamn ''temote hiyaw''yu

CHORUS
Telailu yelen goyta ab meቓbr
Nimotna ቐtilu fasika kebesr
Moytu ayterefen megnez tet’eቕlilu
Tensiu rebuni bimelekot haylu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '29233330-09fb-4ed0-a4c4-37ac94b20c2b'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 1
መግደላዊት ማርያም ኣዮኺ ኣይትፍርሒ
ንህያው ምስ ሙታን ንምንታይ ትደልዪ
ተላዒሉ እዩ እቲ ሓያል መምህርኺ
ኽዲ ን ሀዋርያት ትንሳኤኡ ኣብስሪ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 2
ብስጋ ''ተሞተ ብፍቕሪ ተስዒሩ
ብስልጣን መለኮት ጎይታ ተላዒሉ
ተንሲኡ ኢየሱስ ተንሲኡ ካብ ሙታን
ወንጌል ተበሰረ ብትንሳኤ ብርሀን

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 3
ብትንሳኤ ጎይታ ከቶ ኣይንጠራጠር
ስጋና እንትለብስ መለኮቱ ኣይሓደገን
ንመግነዘይ ፍትሑ ''ቲ እምኒ ኣልዕልዎ
እንተይበለ እዩ ንሞትና ቐቲልዎ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ

VERSE 4
ተልዓሉ ምስበሎም ተንሲኦም ብዙሓት
''ትዘደንቐናስ ናይቲ ዘይሞት ምሟት
ትንሳኤን ህይወትን ባዕሉ ክርስቶስ እዩ
ብእኡ ዝኣምን ''ተሞተ ህያው''ዩ

CHORUS
ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ተላዒሉ የለን ጎይታ ኣብ መቓብር
ንሞትና ቐቲሉ ፋሲካ ከበስር
ሞይቱ ኣይተረፈን መግነዝ ተጠቕሊሉ
ተንሲኡ ረቡኒ ብመለኮት ሓይሉ
መግደላዊት ማርያም ኣዮኺ ኣይትፍርሒ
ንህያው ምስ ሙታን ንምንታይ ትደልዪ
ተላዒሉ እዩ እቲ ሓያል መምህርኺ
ኽዲ ን ሀዋርያት ትንሳኤኡ ኣብስሪ
ብስጋ ''ተሞተ ብፍቕሪ ተስዒሩ
ብስልጣን መለኮት ጎይታ ተላዒሉ
ተንሲኡ ኢየሱስ ተንሲኡ ካብ ሙታን
ወንጌል ተበሰረ ብትንሳኤ ብርሀን
ብትንሳኤ ጎይታ ከቶ ኣይንጠራጠር
ስጋና እንትለብስ መለኮቱ ኣይሓደገን
ንመግነዘይ ፍትሑ ''ቲ እምኒ ኣልዕልዎ
እንተይበለ እዩ ንሞትና ቐቲልዎ
ተልዓሉ ምስበሎም ተንሲኦም ብዙሓት
''ትዘደንቐናስ ናይቲ ዘይሞት ምሟት
ትንሳኤን ህይወትን ባዕሉ ክርስቶስ እዩ
ብእኡ ዝኣምን ''ተሞተ ህያው''ዩ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '29233330-09fb-4ed0-a4c4-37ac94b20c2b'::uuid, 'yelen-new-orthodox-tewahido-tigrigna-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-spirit-2117 ("the-spirit-2117")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '01007c93-29eb-4a56-9658-33ec89ada46c'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 1
The spirit within me above.
You are my true teacher and my God.
I worship You with devotion.
As Christ had promised, You came.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 2
Your temple is what my soul became.
You kindled my heart like a flame.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 3
One with the Father and the Son.
I worship You in devotion.
Like the wind blows where it wishes
With abundance of Your riches.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 4
Come dwell in me, Holy Spirit.
The Spirit reign in me.
You are my true teacher and my guide.
I worship You in devotion.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 5
Holy Spirit, descend from above.
My Paraclete, immaculate God.
I''m sealed with Your forgiving love.
The spirit within me that abides.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 6
You are my guide,
One with the Father and the Son.
I worship You with devotion.
With You leading me to the truth,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 7
I walk in Christ in the days of my youth.
I will pour Your praise from my mouth.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 8
One with the Father and the Son.
I worship You with devotion.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 9
One with the Father and the Son.
I worship You with devotion.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 10
Blessed be God.
Let His name be praised.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 11
Blessed be God.
Let His name be praised.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 1
The spirit within me above.
You are my true teacher and my God.
I worship You with devotion.
As Christ had promised, You came.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 2
Your temple is what my soul became.
You kindled my heart like a flame.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 3
One with the Father and the Son.
I worship You in devotion.
Like the wind blows where it wishes
With abundance of Your riches.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 4
Come dwell in me, Holy Spirit.
The Spirit reign in me.
You are my true teacher and my guide.
I worship You in devotion.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 5
Holy Spirit, descend from above.
My Paraclete, immaculate God.
I''m sealed with Your forgiving love.
The spirit within me that abides.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 6
You are my guide,
One with the Father and the Son.
I worship You with devotion.
With You leading me to the truth,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 7
I walk in Christ in the days of my youth.
I will pour Your praise from my mouth.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 8
One with the Father and the Son.
I worship You with devotion.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 9
One with the Father and the Son.
I worship You with devotion.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 10
Blessed be God.
Let His name be praised.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 11
Blessed be God.
Let His name be praised.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 1
The spirit within me above.
You are my true teacher and my God.
I worship You with devotion.
As Christ had promised, You came.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 2
Your temple is what my soul became.
You kindled my heart like a flame.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 3
One with the Father and the Son.
I worship You in devotion.
Like the wind blows where it wishes
With abundance of Your riches.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 4
Come dwell in me, Holy Spirit.
The Spirit reign in me.
You are my true teacher and my guide.
I worship You in devotion.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 5
Holy Spirit, descend from above.
My Paraclete, immaculate God.
I''m sealed with Your forgiving love.
The spirit within me that abides.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 6
You are my guide,
One with the Father and the Son.
I worship You with devotion.
With You leading me to the truth,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 7
I walk in Christ in the days of my youth.
I will pour Your praise from my mouth.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 8
One with the Father and the Son.
I worship You with devotion.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 9
One with the Father and the Son.
I worship You with devotion.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 10
Blessed be God.
Let His name be praised.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 11
Blessed be God.
Let His name be praised.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.' THEN lyrics_amharic 
          ELSE 'CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 1
The spirit within me above.
You are my true teacher and my God.
I worship You with devotion.
As Christ had promised, You came.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 2
Your temple is what my soul became.
You kindled my heart like a flame.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 3
One with the Father and the Son.
I worship You in devotion.
Like the wind blows where it wishes
With abundance of Your riches.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 4
Come dwell in me, Holy Spirit.
The Spirit reign in me.
You are my true teacher and my guide.
I worship You in devotion.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 5
Holy Spirit, descend from above.
My Paraclete, immaculate God.
I''m sealed with Your forgiving love.
The spirit within me that abides.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 6
You are my guide,
One with the Father and the Son.
I worship You with devotion.
With You leading me to the truth,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 7
I walk in Christ in the days of my youth.
I will pour Your praise from my mouth.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 8
One with the Father and the Son.
I worship You with devotion.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 9
One with the Father and the Son.
I worship You with devotion.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 10
Blessed be God.
Let His name be praised.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 11
Blessed be God.
Let His name be praised.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.' 
        END,
        lyrics_transliteration = 'CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 1
The spirit within me above.
You are my true teacher and my God.
I worship You with devotion.
As Christ had promised, You came.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 2
Your temple is what my soul became.
You kindled my heart like a flame.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 3
One with the Father and the Son.
I worship You in devotion.
Like the wind blows where it wishes
With abundance of Your riches.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 4
Come dwell in me, Holy Spirit.
The Spirit reign in me.
You are my true teacher and my guide.
I worship You in devotion.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 5
Holy Spirit, descend from above.
My Paraclete, immaculate God.
I''m sealed with Your forgiving love.
The spirit within me that abides.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 6
You are my guide,
One with the Father and the Son.
I worship You with devotion.
With You leading me to the truth,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 7
I walk in Christ in the days of my youth.
I will pour Your praise from my mouth.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 8
One with the Father and the Son.
I worship You with devotion.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 9
One with the Father and the Son.
I worship You with devotion.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 10
Blessed be God.
Let His name be praised.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 11
Blessed be God.
Let His name be praised.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.',
        updated_at = clock_timestamp()::text
    WHERE import_id = '01007c93-29eb-4a56-9658-33ec89ada46c'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 1
The spirit within me above.
You are my true teacher and my God.
I worship You with devotion.
As Christ had promised, You came.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 2
Your temple is what my soul became.
You kindled my heart like a flame.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 3
One with the Father and the Son.
I worship You in devotion.
Like the wind blows where it wishes
With abundance of Your riches.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 4
Come dwell in me, Holy Spirit.
The Spirit reign in me.
You are my true teacher and my guide.
I worship You in devotion.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 5
Holy Spirit, descend from above.
My Paraclete, immaculate God.
I''m sealed with Your forgiving love.
The spirit within me that abides.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 6
You are my guide,
One with the Father and the Son.
I worship You with devotion.
With You leading me to the truth,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 7
I walk in Christ in the days of my youth.
I will pour Your praise from my mouth.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 8
One with the Father and the Son.
I worship You with devotion.
The spirit within me that abides,
You are my true teacher and my God,

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 9
One with the Father and the Son.
I worship You with devotion.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 10
Blessed be God.
Let His name be praised.
He who created You without blemish
For the world''s salvation.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.

VERSE 11
Blessed be God.
Let His name be praised.

CHORUS
The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.'
        OR lyrics_amharic IS NOT DISTINCT FROM 'The spirit within me that abides.
You are my true teacher and my guide.
One with the Father and the Son.
I worship You with devotion.
The spirit within me above.
You are my true teacher and my God.
I worship You with devotion.
As Christ had promised, You came.
Your temple is what my soul became.
You kindled my heart like a flame.
The spirit within me that abides,
You are my true teacher and my God,
One with the Father and the Son.
I worship You in devotion.
Like the wind blows where it wishes
With abundance of Your riches.
Come dwell in me, Holy Spirit.
The Spirit reign in me.
You are my true teacher and my guide.
I worship You in devotion.
Holy Spirit, descend from above.
My Paraclete, immaculate God.
I''m sealed with Your forgiving love.
The spirit within me that abides.
You are my guide,
One with the Father and the Son.
I worship You with devotion.
With You leading me to the truth,
I walk in Christ in the days of my youth.
I will pour Your praise from my mouth.
The spirit within me that abides,
You are my true teacher and my God,
One with the Father and the Son.
I worship You with devotion.
The spirit within me that abides,
You are my true teacher and my God,
One with the Father and the Son.
I worship You with devotion.
He who created You without blemish
For the world''s salvation.
Blessed be God.
Let His name be praised.
He who created You without blemish
For the world''s salvation.
Blessed be God.
Let His name be praised.'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '01007c93-29eb-4a56-9658-33ec89ada46c'::uuid, 'the-spirit-2117', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tv-coming-soon-nay-hbret-mezamur-orthodox-tewahdo-mezmur ("ዕፀሳቤቕ : ጾር ሓድሕ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ded180f3-6797-4eab-a59a-844626f61bfa'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 1
Aqusalu sefifu nidwy kehwi
Araya koynu endyu hiyaway samrawi
Eyesus bigbri baelu zerayena
Diኹm bimhgaz habtam eyu

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 2
Bahlna
Kemey libi awdiqna wuduቕna
Kenelel
Seb t’ray zeykone yits’beyu liul

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 3
Wegenna kisቐ bihmam killo
Kab sebu halifu yelen qulih ziblo
Gelena biwhbet gelena bits’elot
Niwts’at sebna enterina halyot

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 4
Kisemeyu goyta widuqna ketense
Ts’ama alewo ab laeli nihaw zirede
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 5
Ninebsna kab mot bidem ziedga
Kristos ab mesqel kefillna waga
Degef seb zits’be alo zideqese
Gulbab zeyqela alo zitedenese

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 6
Hadhd nidegagef wegenna ninabi
Bineshto ligsi alo abi asbi
Niawyat t’quat semiu zenagf
Hilfna alo goyta nilbom zeerf

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 7
Bizgeberelu amlaኹ kemesgn
Net zitesebre alewo zits’gn
Qanza hawna ts’erna tetegbirna
Fiqru

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 8
Nihna ina nirebh niኸbr biኽbru
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel
Kabti nibts’ayka hiwetka tiኸflo

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 9
Ziabi fiqri''si kale entay alo
Mis himum wegenu bigngats’e zihamm
Men alona ewt nits’dqi zeqedm
Ts’or hadhd kints’ewr areyuna

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 10
Fiqri
Nihgi Kristos nisabo nigbri
Bihalengi dewe rieyu zitegerfe
Ts’or sebu kebri sebu zeygedefe

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 11
Zeykemti lewawi gosywo zeyhalf
Menyu kem samrawi aqusalu zesff
Asbna ab semayu fets’mi
Kinreኽbelu

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 12
Kilte dinar werqi erbun nehlfelu
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 1
ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 2
ባህልና
ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 3
ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 4
ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 5
ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 6
ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 7
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 8
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 9
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
ጾር ሓድሕድ ክንጸውር ኣርእዩና

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 10
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 11
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 12
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 1
ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 2
ባህልና
ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 3
ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 4
ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 5
ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 6
ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 7
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 8
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 9
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
ጾር ሓድሕድ ክንጸውር ኣርእዩና

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 10
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 11
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 12
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል' THEN lyrics_amharic 
          ELSE 'CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 1
ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 2
ባህልና
ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 3
ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 4
ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 5
ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 6
ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 7
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 8
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 9
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
ጾር ሓድሕድ ክንጸውር ኣርእዩና

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 10
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 11
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 12
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል' 
        END,
        lyrics_transliteration = 'CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 1
Aqusalu sefifu nidwy kehwi
Araya koynu endyu hiyaway samrawi
Eyesus bigbri baelu zerayena
Diኹm bimhgaz habtam eyu

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 2
Bahlna
Kemey libi awdiqna wuduቕna
Kenelel
Seb t’ray zeykone yits’beyu liul

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 3
Wegenna kisቐ bihmam killo
Kab sebu halifu yelen qulih ziblo
Gelena biwhbet gelena bits’elot
Niwts’at sebna enterina halyot

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 4
Kisemeyu goyta widuqna ketense
Ts’ama alewo ab laeli nihaw zirede
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 5
Ninebsna kab mot bidem ziedga
Kristos ab mesqel kefillna waga
Degef seb zits’be alo zideqese
Gulbab zeyqela alo zitedenese

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 6
Hadhd nidegagef wegenna ninabi
Bineshto ligsi alo abi asbi
Niawyat t’quat semiu zenagf
Hilfna alo goyta nilbom zeerf

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 7
Bizgeberelu amlaኹ kemesgn
Net zitesebre alewo zits’gn
Qanza hawna ts’erna tetegbirna
Fiqru

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 8
Nihna ina nirebh niኸbr biኽbru
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel
Kabti nibts’ayka hiwetka tiኸflo

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 9
Ziabi fiqri''si kale entay alo
Mis himum wegenu bigngats’e zihamm
Men alona ewt nits’dqi zeqedm
Ts’or hadhd kints’ewr areyuna

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 10
Fiqri
Nihgi Kristos nisabo nigbri
Bihalengi dewe rieyu zitegerfe
Ts’or sebu kebri sebu zeygedefe

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 11
Zeykemti lewawi gosywo zeyhalf
Menyu kem samrawi aqusalu zesff
Asbna ab semayu fets’mi
Kinreኽbelu

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 12
Kilte dinar werqi erbun nehlfelu
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ded180f3-6797-4eab-a59a-844626f61bfa'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 1
ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 2
ባህልና
ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 3
ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 4
ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 5
ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 6
ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 7
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 8
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 9
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
ጾር ሓድሕድ ክንጸውር ኣርእዩና

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 10
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 11
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 12
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
❤ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ
ባህልና
**ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል
❤ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት
**ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
🤍ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
❤ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ
**ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
❤ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
** ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
🤍ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
❤ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
**ጾር ሓድሕድ ክንጸውር ኣርእዩና
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
❤ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
**ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
🤍ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ded180f3-6797-4eab-a59a-844626f61bfa'::uuid, 'tv-coming-soon-nay-hbret-mezamur-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- my-mother-virgin-mary ("ድንግል እናቴ ነይ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '570c7138-4596-4893-ae5f-0f28bf22cab2'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 1
Keat’egebe ኹgnina aleኹ beygn
Keategebe hungina alehu beyingn
My Mother Virgin Mary, Come and rescue me
I have no one near me to give me consolation

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 2
Be by my side and tell me that you are with me
All that I hoped would remain has faded away
In great sorrow and deep grief, my strength has weakened
Lest I be void of blessings, and filled with misery

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 3
Deliver me O my Hope, Virgin Mary
Unpleasant is loneliness, it hangs my head low
It worsens anxiety, so despair will grow
When You are with me Virgin I won''t be conquered

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 4
I won’t cave in or concede, to this fleeting world
Let alone for one like me, Your lowly servant
For the world Your prayer is more than sufficient
On that hour of judgement, guard me with your veil

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 5
So my many evil deeds, will not tip the scale
The bridegroom is coming but, I had no oil
I journeyed to fill my lamp, a fruitless toil
O mother kindle me to perform righteous deeds

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 6
Save me from the fire of death, O Virgin I plead

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 1
ከአጠገቤ ኹኚና አለኹ በይኝ
keategebe hungina alehu beyingn
My Mother Virgin Mary, Come and rescue me
I have no one near me to give me consolation

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 2
Be by my side and tell me that you are with me
All that I hoped would remain has faded away
In great sorrow and deep grief, my strength has weakened
Lest I be void of blessings, and filled with misery

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 3
Deliver me O my Hope, Virgin Mary
Unpleasant is loneliness, it hangs my head low
It worsens anxiety, so despair will grow
When You are with me Virgin I won''t be conquered

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 4
I won’t cave in or concede, to this fleeting world
Let alone for one like me, Your lowly servant
for the world Your prayer is more than sufficient
On that hour of judgement, guard me with your veil

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 5
So my many evil deeds, will not tip the scale
The bridegroom is coming but, I had no oil
I journeyed to fill my lamp, a fruitless toil
O mother kindle me to perform righteous deeds

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 6
Save me from the fire of death, O Virgin I plead

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 1
ከአጠገቤ ኹኚና አለኹ በይኝ
keategebe hungina alehu beyingn
My Mother Virgin Mary, Come and rescue me
I have no one near me to give me consolation

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 2
Be by my side and tell me that you are with me
All that I hoped would remain has faded away
In great sorrow and deep grief, my strength has weakened
Lest I be void of blessings, and filled with misery

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 3
Deliver me O my Hope, Virgin Mary
Unpleasant is loneliness, it hangs my head low
It worsens anxiety, so despair will grow
When You are with me Virgin I won''t be conquered

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 4
I won’t cave in or concede, to this fleeting world
Let alone for one like me, Your lowly servant
for the world Your prayer is more than sufficient
On that hour of judgement, guard me with your veil

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 5
So my many evil deeds, will not tip the scale
The bridegroom is coming but, I had no oil
I journeyed to fill my lamp, a fruitless toil
O mother kindle me to perform righteous deeds

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 6
Save me from the fire of death, O Virgin I plead

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn' THEN lyrics_amharic 
          ELSE 'CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 1
ከአጠገቤ ኹኚና አለኹ በይኝ
keategebe hungina alehu beyingn
My Mother Virgin Mary, Come and rescue me
I have no one near me to give me consolation

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 2
Be by my side and tell me that you are with me
All that I hoped would remain has faded away
In great sorrow and deep grief, my strength has weakened
Lest I be void of blessings, and filled with misery

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 3
Deliver me O my Hope, Virgin Mary
Unpleasant is loneliness, it hangs my head low
It worsens anxiety, so despair will grow
When You are with me Virgin I won''t be conquered

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 4
I won’t cave in or concede, to this fleeting world
Let alone for one like me, Your lowly servant
for the world Your prayer is more than sufficient
On that hour of judgement, guard me with your veil

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 5
So my many evil deeds, will not tip the scale
The bridegroom is coming but, I had no oil
I journeyed to fill my lamp, a fruitless toil
O mother kindle me to perform righteous deeds

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 6
Save me from the fire of death, O Virgin I plead

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn' 
        END,
        lyrics_transliteration = 'CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 1
Keat’egebe ኹgnina aleኹ beygn
Keategebe hungina alehu beyingn
My Mother Virgin Mary, Come and rescue me
I have no one near me to give me consolation

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 2
Be by my side and tell me that you are with me
All that I hoped would remain has faded away
In great sorrow and deep grief, my strength has weakened
Lest I be void of blessings, and filled with misery

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 3
Deliver me O my Hope, Virgin Mary
Unpleasant is loneliness, it hangs my head low
It worsens anxiety, so despair will grow
When You are with me Virgin I won''t be conquered

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 4
I won’t cave in or concede, to this fleeting world
Let alone for one like me, Your lowly servant
For the world Your prayer is more than sufficient
On that hour of judgement, guard me with your veil

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 5
So my many evil deeds, will not tip the scale
The bridegroom is coming but, I had no oil
I journeyed to fill my lamp, a fruitless toil
O mother kindle me to perform righteous deeds

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn

VERSE 6
Save me from the fire of death, O Virgin I plead

CHORUS
Dingil enate ney direshilgn
Dengel Enate neyi Dreshilegn
Wegen yelegnm qerbo yemiyats’nanagn
Wegen yelegnem kerbo yemiyatsinanagn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '570c7138-4596-4893-ae5f-0f28bf22cab2'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 1
ከአጠገቤ ኹኚና አለኹ በይኝ
keategebe hungina alehu beyingn
My Mother Virgin Mary, Come and rescue me
I have no one near me to give me consolation

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 2
Be by my side and tell me that you are with me
All that I hoped would remain has faded away
In great sorrow and deep grief, my strength has weakened
Lest I be void of blessings, and filled with misery

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 3
Deliver me O my Hope, Virgin Mary
Unpleasant is loneliness, it hangs my head low
It worsens anxiety, so despair will grow
When You are with me Virgin I won''t be conquered

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 4
I won’t cave in or concede, to this fleeting world
Let alone for one like me, Your lowly servant
for the world Your prayer is more than sufficient
On that hour of judgement, guard me with your veil

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 5
So my many evil deeds, will not tip the scale
The bridegroom is coming but, I had no oil
I journeyed to fill my lamp, a fruitless toil
O mother kindle me to perform righteous deeds

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn

VERSE 6
Save me from the fire of death, O Virgin I plead

CHORUS
ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ድንግል እናቴ ነይ ድረሺልኝ
Dengel Enate neyi Dreshilegn
ወገን የለኝም ቀርቦ የሚያጽናናኝ
wegen yelegnem kerbo yemiyatsinanagn
ከአጠገቤ ኹኚና አለኹ በይኝ
keategebe hungina alehu beyingn
My Mother Virgin Mary, Come and rescue me
I have no one near me to give me consolation
Be by my side and tell me that you are with me
All that I hoped would remain has faded away
In great sorrow and deep grief, my strength has weakened
Lest I be void of blessings, and filled with misery
Deliver me O my Hope, Virgin Mary
Unpleasant is loneliness, it hangs my head low
It worsens anxiety, so despair will grow
When You are with me Virgin I won''t be conquered
I won’t cave in or concede, to this fleeting world
Let alone for one like me, Your lowly servant
for the world Your prayer is more than sufficient
On that hour of judgement, guard me with your veil
So my many evil deeds, will not tip the scale
The bridegroom is coming but, I had no oil
I journeyed to fill my lamp, a fruitless toil
O mother kindle me to perform righteous deeds
Save me from the fire of death, O Virgin I plead'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '570c7138-4596-4893-ae5f-0f28bf22cab2'::uuid, 'my-mother-virgin-mary', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kokebe-kibir-aba-giyorigis-zegasicha ("ኮከበ ክብር አባ ጊዮርጊስ ዘጋስጫ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '61a86f95-a66e-4bd0-89e6-e58da03bf847'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 1
CHORUS
Ritua haymanot,aqabe emnet,
Yewengel arbegna, yets’ena beewnet,
Yets’elot abat new,ts’adq menokos,

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 2
Ityop’yawiw qerlos , aba giyorgis.
CHORUS
T’bebn endiyagegn , ende ezra sutul,
Yehywetn ts’wa, at’et’aw urael,

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 3
Dagmawi yared new,amlak yemeret’ew.
Misgana jemere , Dingil sitbarkew.
CHORUS
Seatat yibabew, qidase ts’elotu,

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 4
Kemar yit’aft’al, qalna sibketu,
Diwy yifewsal, gedlna dirsanu,
Ityop’yawiw ts’adq, Giyorgis kahnu.
CHORUS

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 5
Kemelaektu gar, kets’adqan mahber ,
Lemnln aba, mihret keegziabher ,
Amlak begebalh, mehala kidan,
Bemljah asben, bets’elot erdan.

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 1
አዝ፣
ርቱዐ ሃይማኖት፣አቃቤ እምነት፣
የወንጌል አርበኛ፣ የጸና በእውነት፣
የጸሎት አባት ነው፣ጻድቅ መኖኮስ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 2
ኢትዮጵያዊው ቄርሎስ ፣ አባ ጊዮርጊስ።
አዝ፣
ጥበብን እንዲያገኝ ፣ እንደ እዝራ ሱቱል፣
የሕይወትን ጽዋ፣ አጠጣው ዑራኤል፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 3
ዳግማዊ ያሬድ ነው፣አምላክ የመረጠው።
ምስጋና ጀመረ ፣ ድንግል ስትባርከው።
አዝ፣
ሠዓታት ይባቤው፣ ቅዳሴ ጸሎቱ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 4
ከማር ይጣፍጣል፣ ቃልና ስብከቱ፣
ድውይ ይፈውሳል፣ ገድልና ድርሳኑ፣
ኢትዮጵያዊው ጻድቅ፣ ጊዮርጊስ ካኅኑ።
አዝ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 5
ከመላእክቱ ጋር፣ ከጻድቃን ማኅበር ፣
ለምንልን አባ፣ ምሕረት ከእግዚአብሔር ፣
አምላክ በገባልህ፣ መኃላ ኪዳን፣
በምልጃህ አስበን፣ በጸሎት እርዳን።

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 1
አዝ፣
ርቱዐ ሃይማኖት፣አቃቤ እምነት፣
የወንጌል አርበኛ፣ የጸና በእውነት፣
የጸሎት አባት ነው፣ጻድቅ መኖኮስ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 2
ኢትዮጵያዊው ቄርሎስ ፣ አባ ጊዮርጊስ።
አዝ፣
ጥበብን እንዲያገኝ ፣ እንደ እዝራ ሱቱል፣
የሕይወትን ጽዋ፣ አጠጣው ዑራኤል፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 3
ዳግማዊ ያሬድ ነው፣አምላክ የመረጠው።
ምስጋና ጀመረ ፣ ድንግል ስትባርከው።
አዝ፣
ሠዓታት ይባቤው፣ ቅዳሴ ጸሎቱ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 4
ከማር ይጣፍጣል፣ ቃልና ስብከቱ፣
ድውይ ይፈውሳል፣ ገድልና ድርሳኑ፣
ኢትዮጵያዊው ጻድቅ፣ ጊዮርጊስ ካኅኑ።
አዝ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 5
ከመላእክቱ ጋር፣ ከጻድቃን ማኅበር ፣
ለምንልን አባ፣ ምሕረት ከእግዚአብሔር ፣
አምላክ በገባልህ፣ መኃላ ኪዳን፣
በምልጃህ አስበን፣ በጸሎት እርዳን።

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣' THEN lyrics_amharic 
          ELSE 'CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 1
አዝ፣
ርቱዐ ሃይማኖት፣አቃቤ እምነት፣
የወንጌል አርበኛ፣ የጸና በእውነት፣
የጸሎት አባት ነው፣ጻድቅ መኖኮስ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 2
ኢትዮጵያዊው ቄርሎስ ፣ አባ ጊዮርጊስ።
አዝ፣
ጥበብን እንዲያገኝ ፣ እንደ እዝራ ሱቱል፣
የሕይወትን ጽዋ፣ አጠጣው ዑራኤል፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 3
ዳግማዊ ያሬድ ነው፣አምላክ የመረጠው።
ምስጋና ጀመረ ፣ ድንግል ስትባርከው።
አዝ፣
ሠዓታት ይባቤው፣ ቅዳሴ ጸሎቱ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 4
ከማር ይጣፍጣል፣ ቃልና ስብከቱ፣
ድውይ ይፈውሳል፣ ገድልና ድርሳኑ፣
ኢትዮጵያዊው ጻድቅ፣ ጊዮርጊስ ካኅኑ።
አዝ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 5
ከመላእክቱ ጋር፣ ከጻድቃን ማኅበር ፣
ለምንልን አባ፣ ምሕረት ከእግዚአብሔር ፣
አምላክ በገባልህ፣ መኃላ ኪዳን፣
በምልጃህ አስበን፣ በጸሎት እርዳን።

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣' 
        END,
        lyrics_transliteration = 'CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 1
CHORUS
Ritua haymanot,aqabe emnet,
Yewengel arbegna, yets’ena beewnet,
Yets’elot abat new,ts’adq menokos,

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 2
Ityop’yawiw qerlos , aba giyorgis.
CHORUS
T’bebn endiyagegn , ende ezra sutul,
Yehywetn ts’wa, at’et’aw urael,

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 3
Dagmawi yared new,amlak yemeret’ew.
Misgana jemere , Dingil sitbarkew.
CHORUS
Seatat yibabew, qidase ts’elotu,

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 4
Kemar yit’aft’al, qalna sibketu,
Diwy yifewsal, gedlna dirsanu,
Ityop’yawiw ts’adq, Giyorgis kahnu.
CHORUS

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,

VERSE 5
Kemelaektu gar, kets’adqan mahber ,
Lemnln aba, mihret keegziabher ,
Amlak begebalh, mehala kidan,
Bemljah asben, bets’elot erdan.

CHORUS
Kokebe kibir ts’dul,
Ts’eheye agazi biruh,
Aba Giyorgis zegasch’a t’ume lisan,
Meserete Kidist bete kirstiyan,',
        updated_at = clock_timestamp()::text
    WHERE import_id = '61a86f95-a66e-4bd0-89e6-e58da03bf847'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 1
አዝ፣
ርቱዐ ሃይማኖት፣አቃቤ እምነት፣
የወንጌል አርበኛ፣ የጸና በእውነት፣
የጸሎት አባት ነው፣ጻድቅ መኖኮስ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 2
ኢትዮጵያዊው ቄርሎስ ፣ አባ ጊዮርጊስ።
አዝ፣
ጥበብን እንዲያገኝ ፣ እንደ እዝራ ሱቱል፣
የሕይወትን ጽዋ፣ አጠጣው ዑራኤል፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 3
ዳግማዊ ያሬድ ነው፣አምላክ የመረጠው።
ምስጋና ጀመረ ፣ ድንግል ስትባርከው።
አዝ፣
ሠዓታት ይባቤው፣ ቅዳሴ ጸሎቱ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 4
ከማር ይጣፍጣል፣ ቃልና ስብከቱ፣
ድውይ ይፈውሳል፣ ገድልና ድርሳኑ፣
ኢትዮጵያዊው ጻድቅ፣ ጊዮርጊስ ካኅኑ።
አዝ፣

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣

VERSE 5
ከመላእክቱ ጋር፣ ከጻድቃን ማኅበር ፣
ለምንልን አባ፣ ምሕረት ከእግዚአብሔር ፣
አምላክ በገባልህ፣ መኃላ ኪዳን፣
በምልጃህ አስበን፣ በጸሎት እርዳን።

CHORUS
ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኮከበ ክብር ጽዱል፣
ጸሐየ አግአዚ ብሩህ፣
አባ ጊዮርጊስ ዘጋስጫ ጥዑመ ልሳን፣
መሰረተ ቅድስት ቤተ ክርስቲያን፣
አዝ፣
ርቱዐ ሃይማኖት፣አቃቤ እምነት፣
የወንጌል አርበኛ፣ የጸና በእውነት፣
የጸሎት አባት ነው፣ጻድቅ መኖኮስ፣
ኢትዮጵያዊው ቄርሎስ ፣ አባ ጊዮርጊስ።
አዝ፣
ጥበብን እንዲያገኝ ፣ እንደ እዝራ ሱቱል፣
የሕይወትን ጽዋ፣ አጠጣው ዑራኤል፣
ዳግማዊ ያሬድ ነው፣አምላክ የመረጠው።
ምስጋና ጀመረ ፣ ድንግል ስትባርከው።
አዝ፣
ሠዓታት ይባቤው፣ ቅዳሴ ጸሎቱ፣
ከማር ይጣፍጣል፣ ቃልና ስብከቱ፣
ድውይ ይፈውሳል፣ ገድልና ድርሳኑ፣
ኢትዮጵያዊው ጻድቅ፣ ጊዮርጊስ ካኅኑ።
አዝ፣
ከመላእክቱ ጋር፣ ከጻድቃን ማኅበር ፣
ለምንልን አባ፣ ምሕረት ከእግዚአብሔር ፣
አምላክ በገባልህ፣ መኃላ ኪዳን፣
በምልጃህ አስበን፣ በጸሎት እርዳን።'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '61a86f95-a66e-4bd0-89e6-e58da03bf847'::uuid, 'kokebe-kibir-aba-giyorigis-zegasicha', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- orthodox-mezmur-zemerti-abel-sandro-rahwa-hermela-tikue-fikadu ("ኣይነማርር # , , , #")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cc76cb97-02df-40fb-9b48-af187d5a0da8'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 1
Birhanna Egziabher''yu zebrh nikulu (2)/
Nab eyob nit’emt biayni hilna
Ab amlak tetesfiyu siiru fetena
Amsaya tiegstu zeylkae emnetu

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 2
Dirb ets’fi hagos rekibu ab hiwetu
Azmach
Libna kirege ts’orna nikqell
Wuelo qeranyo ab libna nisal

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 3
Aedawu zergihu bifqri ziqbel
Hiyab gwasa alona keto aynthalel
Azmach
Zektamat aykonan beynna aynqazm

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 4
Shgrna shgru alena ko medhn
Zefqr zirhrh hilfi sigawi abo
Neti zikebdena yehlifna nihabo
Azmach

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 5
Nikey higos seyt’an nikeyrekb sefer
Silt’an aynhabo fets’imna aynemarr
Nitsfo ab adona emnetna neazz
Nay menkera emba kem qalu kinegez

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 6
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu
Birhanna Egziabher''yu zebrh nikulu (2)/

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 1
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//
ናብ እዮብ ንጠምት ብዓይኒ ሕልና
ኣብ ኣምላክ ተተስፊዩ ስዒሩ ፈተና
ኣምሳያ ትዕግስቱ ዘይልካዕ እምነቱ

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 2
ድርብ ዕፅፊ ሓጎስ ረኪቡ ኣብ ሂወቱ
ኣዝማች
ልብና ክረግእ ፆርና ንክቀልል
ዉዕሎ ቀራንዮ ኣብ ልብና ንስኣል

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 3
ኣእዳዉ ዘርጊሑ ብፍቅሪ ዝቅበል
ህያብ ጓሳ ኣሎና ከቶ ኣይንትሓለል
ኣዝማች
ዘክታማት ኣይኮናን በይንና ኣይንቃዝም

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 4
ሽግርና ሽግሩ ኣለና ኮ መድሕን
ዘፍቅር ዝርህርህ ሕልፊ ስጋዊ ኣቦ
ነቲ ዝከብደና የሕሊፍና ንሃቦ
ኣዝማች

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 5
ንከይ ሕጎስ ሰይጣን ንከይረክብ ሰፈር
ስልጣን ኣይንሃቦ ፈፂምና ኣይነማርር
ንትስፎ ኣብ ኣዶና እምነትና ነዐዝዝ
ናይ መንከራ እምባ ከም ቃሉ ክነግዕዝ

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 6
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 1
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//
ናብ እዮብ ንጠምት ብዓይኒ ሕልና
ኣብ ኣምላክ ተተስፊዩ ስዒሩ ፈተና
ኣምሳያ ትዕግስቱ ዘይልካዕ እምነቱ

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 2
ድርብ ዕፅፊ ሓጎስ ረኪቡ ኣብ ሂወቱ
ኣዝማች
ልብና ክረግእ ፆርና ንክቀልል
ዉዕሎ ቀራንዮ ኣብ ልብና ንስኣል

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 3
ኣእዳዉ ዘርጊሑ ብፍቅሪ ዝቅበል
ህያብ ጓሳ ኣሎና ከቶ ኣይንትሓለል
ኣዝማች
ዘክታማት ኣይኮናን በይንና ኣይንቃዝም

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 4
ሽግርና ሽግሩ ኣለና ኮ መድሕን
ዘፍቅር ዝርህርህ ሕልፊ ስጋዊ ኣቦ
ነቲ ዝከብደና የሕሊፍና ንሃቦ
ኣዝማች

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 5
ንከይ ሕጎስ ሰይጣን ንከይረክብ ሰፈር
ስልጣን ኣይንሃቦ ፈፂምና ኣይነማርር
ንትስፎ ኣብ ኣዶና እምነትና ነዐዝዝ
ናይ መንከራ እምባ ከም ቃሉ ክነግዕዝ

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 6
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ' THEN lyrics_amharic 
          ELSE 'CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 1
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//
ናብ እዮብ ንጠምት ብዓይኒ ሕልና
ኣብ ኣምላክ ተተስፊዩ ስዒሩ ፈተና
ኣምሳያ ትዕግስቱ ዘይልካዕ እምነቱ

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 2
ድርብ ዕፅፊ ሓጎስ ረኪቡ ኣብ ሂወቱ
ኣዝማች
ልብና ክረግእ ፆርና ንክቀልል
ዉዕሎ ቀራንዮ ኣብ ልብና ንስኣል

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 3
ኣእዳዉ ዘርጊሑ ብፍቅሪ ዝቅበል
ህያብ ጓሳ ኣሎና ከቶ ኣይንትሓለል
ኣዝማች
ዘክታማት ኣይኮናን በይንና ኣይንቃዝም

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 4
ሽግርና ሽግሩ ኣለና ኮ መድሕን
ዘፍቅር ዝርህርህ ሕልፊ ስጋዊ ኣቦ
ነቲ ዝከብደና የሕሊፍና ንሃቦ
ኣዝማች

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 5
ንከይ ሕጎስ ሰይጣን ንከይረክብ ሰፈር
ስልጣን ኣይንሃቦ ፈፂምና ኣይነማርር
ንትስፎ ኣብ ኣዶና እምነትና ነዐዝዝ
ናይ መንከራ እምባ ከም ቃሉ ክነግዕዝ

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 6
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ' 
        END,
        lyrics_transliteration = 'CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 1
Birhanna Egziabher''yu zebrh nikulu (2)/
Nab eyob nit’emt biayni hilna
Ab amlak tetesfiyu siiru fetena
Amsaya tiegstu zeylkae emnetu

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 2
Dirb ets’fi hagos rekibu ab hiwetu
Azmach
Libna kirege ts’orna nikqell
Wuelo qeranyo ab libna nisal

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 3
Aedawu zergihu bifqri ziqbel
Hiyab gwasa alona keto aynthalel
Azmach
Zektamat aykonan beynna aynqazm

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 4
Shgrna shgru alena ko medhn
Zefqr zirhrh hilfi sigawi abo
Neti zikebdena yehlifna nihabo
Azmach

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 5
Nikey higos seyt’an nikeyrekb sefer
Silt’an aynhabo fets’imna aynemarr
Nitsfo ab adona emnetna neazz
Nay menkera emba kem qalu kinegez

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu

VERSE 6
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu
Birhanna Egziabher''yu zebrh nikulu (2)/

CHORUS
Aynemarr
Bifetena alem aynemarr
Shgrna nigdefo nab Egziabher
Shh tets’elmetena zeywegh mesilu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cc76cb97-02df-40fb-9b48-af187d5a0da8'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 1
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//
ናብ እዮብ ንጠምት ብዓይኒ ሕልና
ኣብ ኣምላክ ተተስፊዩ ስዒሩ ፈተና
ኣምሳያ ትዕግስቱ ዘይልካዕ እምነቱ

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 2
ድርብ ዕፅፊ ሓጎስ ረኪቡ ኣብ ሂወቱ
ኣዝማች
ልብና ክረግእ ፆርና ንክቀልል
ዉዕሎ ቀራንዮ ኣብ ልብና ንስኣል

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 3
ኣእዳዉ ዘርጊሑ ብፍቅሪ ዝቅበል
ህያብ ጓሳ ኣሎና ከቶ ኣይንትሓለል
ኣዝማች
ዘክታማት ኣይኮናን በይንና ኣይንቃዝም

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 4
ሽግርና ሽግሩ ኣለና ኮ መድሕን
ዘፍቅር ዝርህርህ ሕልፊ ስጋዊ ኣቦ
ነቲ ዝከብደና የሕሊፍና ንሃቦ
ኣዝማች

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 5
ንከይ ሕጎስ ሰይጣን ንከይረክብ ሰፈር
ስልጣን ኣይንሃቦ ፈፂምና ኣይነማርር
ንትስፎ ኣብ ኣዶና እምነትና ነዐዝዝ
ናይ መንከራ እምባ ከም ቃሉ ክነግዕዝ

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ

VERSE 6
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//

CHORUS
ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኣይነማርር
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//
ናብ እዮብ ንጠምት ብዓይኒ ሕልና
ኣብ ኣምላክ ተተስፊዩ ስዒሩ ፈተና
ኣምሳያ ትዕግስቱ ዘይልካዕ እምነቱ
ድርብ ዕፅፊ ሓጎስ ረኪቡ ኣብ ሂወቱ
ኣዝማች
ልብና ክረግእ ፆርና ንክቀልል
ዉዕሎ ቀራንዮ ኣብ ልብና ንስኣል
ኣእዳዉ ዘርጊሑ ብፍቅሪ ዝቅበል
ህያብ ጓሳ ኣሎና ከቶ ኣይንትሓለል
ኣዝማች
ዘክታማት ኣይኮናን በይንና ኣይንቃዝም
ሽግርና ሽግሩ ኣለና ኮ መድሕን
ዘፍቅር ዝርህርህ ሕልፊ ስጋዊ ኣቦ
ነቲ ዝከብደና የሕሊፍና ንሃቦ
ኣዝማች
ንከይ ሕጎስ ሰይጣን ንከይረክብ ሰፈር
ስልጣን ኣይንሃቦ ፈፂምና ኣይነማርር
ንትስፎ ኣብ ኣዶና እምነትና ነዐዝዝ
ናይ መንከራ እምባ ከም ቃሉ ክነግዕዝ
ብፈተና ዓለም ኣይነማርር
ሽግርና ንግደፎ ናብ እግዚአብሔር
ሽሕ ተፀልመተና ዘይወግሕ መሲሉ
ብርሃንና እግዚአብሔር''ዩ ዘብርህ ንኩሉ/2//'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cc76cb97-02df-40fb-9b48-af187d5a0da8'::uuid, 'orthodox-mezmur-zemerti-abel-sandro-rahwa-hermela-tikue-fikadu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- god-of-creation ("god-of-creation")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4d93dca4-fc83-4a20-a990-e6e5549dd5e5'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 1
In the beginning, there was no light
An empty canvas, a starless night
But then He spoke, and all came alive
His masterpiece so vivid and bright

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 2
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 3
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
With colors, our Lord painted the sky
The sun and moon, He had placed up high

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 4
The birds that fly, soaring through the air
For creation, His love He did share
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 5
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 6
Crafting the sea with their depths unknown
With creatures vast, a world of its own
From gentle waves to the raging storms
His majesty, creation adorned

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 7
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 8
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
In His image, resembling Divine
Mankind was formed by His own design

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 9
With hearts that beat and with souls that long
We''re called to praise with prayer and song
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 10
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 1
In the beginning, there was no light
An empty canvas, a starless night
But then He spoke, and all came alive
His masterpiece so vivid and bright

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 2
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 3
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
With colors, our Lord painted the sky
The sun and moon, He had placed up high

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 4
The birds that fly, soaring through the air
For creation, His love He did share
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 5
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 6
Crafting the sea with their depths unknown
With creatures vast, a world of its own
From gentle waves to the raging storms
His majesty, creation adorned

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 7
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 8
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
In His image, resembling Divine
Mankind was formed by His own design

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 9
With hearts that beat and with souls that long
We''re called to praise with prayer and song
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 10
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 1
In the beginning, there was no light
An empty canvas, a starless night
But then He spoke, and all came alive
His masterpiece so vivid and bright

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 2
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 3
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
With colors, our Lord painted the sky
The sun and moon, He had placed up high

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 4
The birds that fly, soaring through the air
For creation, His love He did share
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 5
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 6
Crafting the sea with their depths unknown
With creatures vast, a world of its own
From gentle waves to the raging storms
His majesty, creation adorned

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 7
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 8
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
In His image, resembling Divine
Mankind was formed by His own design

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 9
With hearts that beat and with souls that long
We''re called to praise with prayer and song
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 10
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command' THEN lyrics_amharic 
          ELSE 'CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 1
In the beginning, there was no light
An empty canvas, a starless night
But then He spoke, and all came alive
His masterpiece so vivid and bright

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 2
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 3
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
With colors, our Lord painted the sky
The sun and moon, He had placed up high

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 4
The birds that fly, soaring through the air
For creation, His love He did share
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 5
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 6
Crafting the sea with their depths unknown
With creatures vast, a world of its own
From gentle waves to the raging storms
His majesty, creation adorned

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 7
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 8
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
In His image, resembling Divine
Mankind was formed by His own design

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 9
With hearts that beat and with souls that long
We''re called to praise with prayer and song
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 10
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command' 
        END,
        lyrics_transliteration = 'CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 1
In the beginning, there was no light
An empty canvas, a starless night
But then He spoke, and all came alive
His masterpiece so vivid and bright

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 2
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 3
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
With colors, our Lord painted the sky
The sun and moon, He had placed up high

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 4
The birds that fly, soaring through the air
For creation, His love He did share
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 5
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 6
Crafting the sea with their depths unknown
With creatures vast, a world of its own
From gentle waves to the raging storms
His majesty, creation adorned

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 7
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 8
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
In His image, resembling Divine
Mankind was formed by His own design

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 9
With hearts that beat and with souls that long
We''re called to praise with prayer and song
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 10
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4d93dca4-fc83-4a20-a990-e6e5549dd5e5'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 1
In the beginning, there was no light
An empty canvas, a starless night
But then He spoke, and all came alive
His masterpiece so vivid and bright

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 2
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 3
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
With colors, our Lord painted the sky
The sun and moon, He had placed up high

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 4
The birds that fly, soaring through the air
For creation, His love He did share
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 5
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 6
Crafting the sea with their depths unknown
With creatures vast, a world of its own
From gentle waves to the raging storms
His majesty, creation adorned

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 7
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 8
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
In His image, resembling Divine
Mankind was formed by His own design

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 9
With hearts that beat and with souls that long
We''re called to praise with prayer and song
From the highest peak to the deepest sea
Every living thing declares Your glory

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

VERSE 10
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command

CHORUS
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
In the beginning, there was no light
An empty canvas, a starless night
But then He spoke, and all came alive
His masterpiece so vivid and bright
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
With colors, our Lord painted the sky
The sun and moon, He had placed up high
The birds that fly, soaring through the air
For creation, His love He did share
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
Crafting the sea with their depths unknown
With creatures vast, a world of its own
From gentle waves to the raging storms
His majesty, creation adorned
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command
In His image, resembling Divine
Mankind was formed by His own design
With hearts that beat and with souls that long
We''re called to praise with prayer and song
From the highest peak to the deepest sea
Every living thing declares Your glory
Oh, God of creation, You''re the source of all
From the smallest grain to the mighty waterfall
You shaped this world with Your loving hand
And all we stand, and all we stand amazed by Your command'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4d93dca4-fc83-4a20-a990-e6e5549dd5e5'::uuid, 'god-of-creation', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tv-nay-hbret-mezamur-orthodox-tewahdo-mezmur ("ዕፀሳቤቕ : ጾር ሓድሕ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3e06e618-1f63-49f7-98af-8ae18b65df2d'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 1
Aqusalu sefifu nidwy kehwi
Araya koynu endyu hiyaway samrawi
Eyesus bigbri baelu zerayena
Diኹm bimhgaz habtam eyu

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 2
Bahlna
Kemey libi awdiqna wuduቕna
Kenelel
Seb t’ray zeykone yits’beyu liul

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 3
Wegenna kisቐ bihmam killo
Kab sebu halifu yelen qulih ziblo
Gelena biwhbet gelena bits’elot
Niwts’at sebna enterina halyot

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 4
Kisemeyu goyta widuqna ketense
Ts’ama alewo ab laeli nihaw zirede
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 5
Ninebsna kab mot bidem ziedga
Kristos ab mesqel kefillna waga
Degef seb zits’be alo zideqese
Gulbab zeyqela alo zitedenese

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 6
Hadhd nidegagef wegenna ninabi
Bineshto ligsi alo abi asbi
Niawyat t’quat semiu zenagf
Hilfna alo goyta nilbom zeerf

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 7
Bizgeberelu amlaኹ kemesgn
Net zitesebre alewo zits’gn
Qanza hawna ts’erna tetegbirna
Fiqru

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 8
Nihna ina nirebh niኸbr biኽbru
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel
Kabti nibts’ayka hiwetka tiኸflo

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 9
Ziabi fiqri''si kale entay alo
Mis himum wegenu bigngats’e zihamm
Men alona ewt nits’dqi zeqedm
Ts’or hadhd kints’ewr areyuna

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 10
Fiqri
Nihgi Kristos nisabo nigbri
Bihalengi dewe rieyu zitegerfe
Ts’or sebu kebri sebu zeygedefe

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 11
Zeykemti lewawi gosywo zeyhalf
Menyu kem samrawi aqusalu zesff
Asbna ab semayu fets’mi
Kinreኽbelu

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 12
Kilte dinar werqi erbun nehlfelu
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 1
ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 2
ባህልና
ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 3
ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 4
ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 5
ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 6
ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 7
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 8
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 9
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
ጾር ሓድሕድ ክንጸውር ኣርእዩና

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 10
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 11
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 12
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 1
ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 2
ባህልና
ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 3
ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 4
ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 5
ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 6
ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 7
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 8
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 9
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
ጾር ሓድሕድ ክንጸውር ኣርእዩና

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 10
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 11
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 12
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል' THEN lyrics_amharic 
          ELSE 'CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 1
ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 2
ባህልና
ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 3
ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 4
ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 5
ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 6
ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 7
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 8
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 9
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
ጾር ሓድሕድ ክንጸውር ኣርእዩና

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 10
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 11
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 12
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል' 
        END,
        lyrics_transliteration = 'CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 1
Aqusalu sefifu nidwy kehwi
Araya koynu endyu hiyaway samrawi
Eyesus bigbri baelu zerayena
Diኹm bimhgaz habtam eyu

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 2
Bahlna
Kemey libi awdiqna wuduቕna
Kenelel
Seb t’ray zeykone yits’beyu liul

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 3
Wegenna kisቐ bihmam killo
Kab sebu halifu yelen qulih ziblo
Gelena biwhbet gelena bits’elot
Niwts’at sebna enterina halyot

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 4
Kisemeyu goyta widuqna ketense
Ts’ama alewo ab laeli nihaw zirede
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 5
Ninebsna kab mot bidem ziedga
Kristos ab mesqel kefillna waga
Degef seb zits’be alo zideqese
Gulbab zeyqela alo zitedenese

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 6
Hadhd nidegagef wegenna ninabi
Bineshto ligsi alo abi asbi
Niawyat t’quat semiu zenagf
Hilfna alo goyta nilbom zeerf

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 7
Bizgeberelu amlaኹ kemesgn
Net zitesebre alewo zits’gn
Qanza hawna ts’erna tetegbirna
Fiqru

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 8
Nihna ina nirebh niኸbr biኽbru
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel
Kabti nibts’ayka hiwetka tiኸflo

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 9
Ziabi fiqri''si kale entay alo
Mis himum wegenu bigngats’e zihamm
Men alona ewt nits’dqi zeqedm
Ts’or hadhd kints’ewr areyuna

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 10
Fiqri
Nihgi Kristos nisabo nigbri
Bihalengi dewe rieyu zitegerfe
Ts’or sebu kebri sebu zeygedefe

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 11
Zeykemti lewawi gosywo zeyhalf
Menyu kem samrawi aqusalu zesff
Asbna ab semayu fets’mi
Kinreኽbelu

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

VERSE 12
Kilte dinar werqi erbun nehlfelu
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel

CHORUS
Ts’or hadhd bimts’ar higi wengel kinfts’m
Qanzana ts’eyru endyu meytu medhanialem
Zihbyu zibareኽ hilfi''ti ziqbel
Ts’or ahwat kiqell idey idka nibel',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3e06e618-1f63-49f7-98af-8ae18b65df2d'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 1
ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 2
ባህልና
ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 3
ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 4
ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 5
ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 6
ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 7
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 8
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 9
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
ጾር ሓድሕድ ክንጸውር ኣርእዩና

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 10
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 11
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

VERSE 12
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል

CHORUS
ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ጾር ሓድሕድ ብምጻር ሕጊ ወንጌል ክንፍጽም
ቃንዛና ጸይሩ እንድዩ መይቱ መድሃኒኣለም
ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
❤ኣቁሳሉ ሰፊፉ ንድውይ ከሕዊ
ኣርኣያ ኮይኑ እንድዩ ሕያዋይ ሳምራዊ
እየሱስ ብግብሪ ባዕሉ ዘርኣየና
ድኹም ብምሕጋዝ ሃብታም እዩ
ባህልና
**ከመይ ልቢ ኣውዲቅና ዉዱቕና
ከነልዕል
ሰብ ጥራይ ዘይኮነ ይጽበዩ ልዑል
❤ወገንና ክስቐ ብሕማም ክልሎ
ካብ ሰቡ ሓሊፉ የለን ቁሊሕ ዝብሎ
ገሌና ብውህበት ገሌና ብጸሎት
ንውጽዓት ሰብና እንተርኢና ሓልዮት
**ክሰምዕዩ ጎይታ ውዱቅና ከተንስእ
ጻማ ኣለዎ ኣብ ላዕሊ ንሓው ዝረድእ
🤍ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
❤ንነብስና ካብ ሞት ብደም ዝዕድጋ
ክርስቶስ ኣብ መስቀል ከፊልልና ዋጋ
ደገፍ ሰብ ዝጽበ ኣሎ ዝደቀሰ
ጉልባብ ዘይቀልዐ ኣሎ ዝተደነሰ
**ሓድሕድ ንደጋገፍ ወገንና ንናቢ
ብንእሽቶ ልግሲ ኣሎ ዓቢ ዓስቢ
❤ንኣውያት ጥቁዓት ሰሚዑ ዘናግፍ
ሕልፍና ኣሎ ጎይታ ንልቦም ዘዕርፍ
ብዝገበረሉ ኣምላኹ ከመስግን
ነት ዝተሰብረ ኣለዎ ዝጽግን
** ቃንዛ ሓውና ጼርና ተተግቢርና
ፍቅሩ
ንሕና ኢና ንረብሕ ንኸብር ብኽብሩ
🤍ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል
❤ካብቲ ንብጻይካ ሂወትካ ትኸፍሎ
ዝዓቢ ፍቅሪ''ሲ ካልእ እንታይ ኣሎ
ምስ ሕሙም ወገኑ ብግንጋጸ ዝሓምም
መን ኣሎና ዕውት ንጽድቂ ዘቀድም
**ጾር ሓድሕድ ክንጸውር ኣርእዩና
ፍቅሪ
ንሕጊ ክርስቶስ ንስዓቦ ንግብሪ
❤ብሓለንጊ ደዌ ርእዩ ዝተገርፈ
ጾር ሰቡ ከብሪ ሰቡ ዘይገደፈ
ዘይከምቲ ሌዋዊ ጎስይዎ ዘይሓልፍ
መንዩ ከም ሳምራዊ ኣቁሳሉ ዘስፍፍ
**ዓስብና ኣብ ሰማዩ ፈጽሚ
ክንረኽበሉ
ክልተ ዲናር ወርቂ ዕርቡን ነሕልፈሉ
🤍ዝህብዩ ዝባረኽ ሕልፊ''ቲ ዝቅበል
ጾር ኣሕዋት ክቀልል ኢደይ ኢድካ ንበል'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3e06e618-1f63-49f7-98af-8ae18b65df2d'::uuid, 'tv-nay-hbret-mezamur-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-burning-bush ("the-burning-bush")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e10b469d-eaf2-4917-b438-402e82af41a4'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 1
They say you are the holy of holies.
They say you are the holy of holies.
When the angels saw him on the throne,
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 2
You found him in the virgin bosom.
You''re the burning bush. Indeed, you are.
They covered her in attire.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 3
Indeed you are worshipping the fire.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 4
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
Prophets saw Moses take off his shoes.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 5
You''re the burning bush. Indeed, you are.
Before the bush had burned in his view,
You''re the burning bush. Indeed, you are.
Being amazed wondering what they saw,

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 6
You''re the burning bush. Indeed, you are.
It is the virgin''s foreshadow.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 7
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 8
She stands amongst the apostles'' claim.
You''re the burning bush. Indeed, you are.
She is their strength and what their hearts claim.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 9
When the flame she knew lights their home.
You''re the burning bush. Indeed, you are.
By him who she was a shadow.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 10
They say you are the holy of holies.
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 11
They say you are the holy of holies.
The forefathers say to Hermetic,
"You''re the burning bush. Indeed, truly you are.
We are their children. Therefore, we preach

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 12
You''re the burning bush. Indeed, truly you are."
The Theotokos she is given to us.
You''re the burning bush. Indeed, truly you are.
Who are loved by her son''s sacrifice.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 13
You''re the burning bush. Indeed, truly you are.
We say you are the holy of holies.
We say you are the holy of holies.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 14
Amen.
Amen.
Amen.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 15
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 1
They say you are the holy of holies.
They say you are the holy of holies.
When the angels saw him on the throne,
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 2
You found him in the virgin bosom.
You''re the burning bush. Indeed, you are.
They covered her in attire.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 3
Indeed you are worshipping the fire.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 4
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
Prophets saw Moses take off his shoes.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 5
You''re the burning bush. Indeed, you are.
Before the bush had burned in his view,
You''re the burning bush. Indeed, you are.
Being amazed wondering what they saw,

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 6
You''re the burning bush. Indeed, you are.
It is the virgin''s foreshadow.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 7
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 8
She stands amongst the apostles'' claim.
You''re the burning bush. Indeed, you are.
She is their strength and what their hearts claim.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 9
When the flame she knew lights their home.
You''re the burning bush. Indeed, you are.
By him who she was a shadow.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 10
They say you are the holy of holies.
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 11
They say you are the holy of holies.
The forefathers say to Hermetic,
"You''re the burning bush. Indeed, truly you are.
We are their children. Therefore, we preach

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 12
You''re the burning bush. Indeed, truly you are."
The Theotokos she is given to us.
You''re the burning bush. Indeed, truly you are.
Who are loved by her son''s sacrifice.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 13
You''re the burning bush. Indeed, truly you are.
We say you are the holy of holies.
We say you are the holy of holies.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 14
Amen.
Amen.
Amen.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 15
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 1
They say you are the holy of holies.
They say you are the holy of holies.
When the angels saw him on the throne,
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 2
You found him in the virgin bosom.
You''re the burning bush. Indeed, you are.
They covered her in attire.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 3
Indeed you are worshipping the fire.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 4
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
Prophets saw Moses take off his shoes.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 5
You''re the burning bush. Indeed, you are.
Before the bush had burned in his view,
You''re the burning bush. Indeed, you are.
Being amazed wondering what they saw,

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 6
You''re the burning bush. Indeed, you are.
It is the virgin''s foreshadow.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 7
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 8
She stands amongst the apostles'' claim.
You''re the burning bush. Indeed, you are.
She is their strength and what their hearts claim.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 9
When the flame she knew lights their home.
You''re the burning bush. Indeed, you are.
By him who she was a shadow.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 10
They say you are the holy of holies.
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 11
They say you are the holy of holies.
The forefathers say to Hermetic,
"You''re the burning bush. Indeed, truly you are.
We are their children. Therefore, we preach

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 12
You''re the burning bush. Indeed, truly you are."
The Theotokos she is given to us.
You''re the burning bush. Indeed, truly you are.
Who are loved by her son''s sacrifice.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 13
You''re the burning bush. Indeed, truly you are.
We say you are the holy of holies.
We say you are the holy of holies.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 14
Amen.
Amen.
Amen.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 15
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.' THEN lyrics_amharic 
          ELSE 'CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 1
They say you are the holy of holies.
They say you are the holy of holies.
When the angels saw him on the throne,
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 2
You found him in the virgin bosom.
You''re the burning bush. Indeed, you are.
They covered her in attire.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 3
Indeed you are worshipping the fire.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 4
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
Prophets saw Moses take off his shoes.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 5
You''re the burning bush. Indeed, you are.
Before the bush had burned in his view,
You''re the burning bush. Indeed, you are.
Being amazed wondering what they saw,

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 6
You''re the burning bush. Indeed, you are.
It is the virgin''s foreshadow.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 7
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 8
She stands amongst the apostles'' claim.
You''re the burning bush. Indeed, you are.
She is their strength and what their hearts claim.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 9
When the flame she knew lights their home.
You''re the burning bush. Indeed, you are.
By him who she was a shadow.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 10
They say you are the holy of holies.
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 11
They say you are the holy of holies.
The forefathers say to Hermetic,
"You''re the burning bush. Indeed, truly you are.
We are their children. Therefore, we preach

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 12
You''re the burning bush. Indeed, truly you are."
The Theotokos she is given to us.
You''re the burning bush. Indeed, truly you are.
Who are loved by her son''s sacrifice.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 13
You''re the burning bush. Indeed, truly you are.
We say you are the holy of holies.
We say you are the holy of holies.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 14
Amen.
Amen.
Amen.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 15
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.' 
        END,
        lyrics_transliteration = 'CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 1
They say you are the holy of holies.
They say you are the holy of holies.
When the angels saw him on the throne,
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 2
You found him in the virgin bosom.
You''re the burning bush. Indeed, you are.
They covered her in attire.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 3
Indeed you are worshipping the fire.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 4
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
Prophets saw Moses take off his shoes.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 5
You''re the burning bush. Indeed, you are.
Before the bush had burned in his view,
You''re the burning bush. Indeed, you are.
Being amazed wondering what they saw,

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 6
You''re the burning bush. Indeed, you are.
It is the virgin''s foreshadow.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 7
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 8
She stands amongst the apostles'' claim.
You''re the burning bush. Indeed, you are.
She is their strength and what their hearts claim.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 9
When the flame she knew lights their home.
You''re the burning bush. Indeed, you are.
By him who she was a shadow.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 10
They say you are the holy of holies.
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 11
They say you are the holy of holies.
The forefathers say to Hermetic,
"You''re the burning bush. Indeed, truly you are.
We are their children. Therefore, we preach

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 12
You''re the burning bush. Indeed, truly you are."
The Theotokos she is given to us.
You''re the burning bush. Indeed, truly you are.
Who are loved by her son''s sacrifice.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 13
You''re the burning bush. Indeed, truly you are.
We say you are the holy of holies.
We say you are the holy of holies.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 14
Amen.
Amen.
Amen.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 15
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e10b469d-eaf2-4917-b438-402e82af41a4'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 1
They say you are the holy of holies.
They say you are the holy of holies.
When the angels saw him on the throne,
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 2
You found him in the virgin bosom.
You''re the burning bush. Indeed, you are.
They covered her in attire.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 3
Indeed you are worshipping the fire.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 4
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
Prophets saw Moses take off his shoes.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 5
You''re the burning bush. Indeed, you are.
Before the bush had burned in his view,
You''re the burning bush. Indeed, you are.
Being amazed wondering what they saw,

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 6
You''re the burning bush. Indeed, you are.
It is the virgin''s foreshadow.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 7
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 8
She stands amongst the apostles'' claim.
You''re the burning bush. Indeed, you are.
She is their strength and what their hearts claim.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 9
When the flame she knew lights their home.
You''re the burning bush. Indeed, you are.
By him who she was a shadow.
You''re the burning bush. Indeed, you are.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 10
They say you are the holy of holies.
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 11
They say you are the holy of holies.
The forefathers say to Hermetic,
"You''re the burning bush. Indeed, truly you are.
We are their children. Therefore, we preach

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 12
You''re the burning bush. Indeed, truly you are."
The Theotokos she is given to us.
You''re the burning bush. Indeed, truly you are.
Who are loved by her son''s sacrifice.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 13
You''re the burning bush. Indeed, truly you are.
We say you are the holy of holies.
We say you are the holy of holies.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 14
Amen.
Amen.
Amen.
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.

VERSE 15
Amen.

CHORUS
You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.'
        OR lyrics_amharic IS NOT DISTINCT FROM 'You''re the burning bush. Indeed, you are.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
They say you are the holy of holies.
They say you are the holy of holies.
When the angels saw him on the throne,
You''re the burning bush. Indeed, you are.
You found him in the virgin bosom.
You''re the burning bush. Indeed, you are.
They covered her in attire.
You''re the burning bush. Indeed, you are.
Indeed you are worshipping the fire.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
Prophets saw Moses take off his shoes.
You''re the burning bush. Indeed, you are.
Before the bush had burned in his view,
You''re the burning bush. Indeed, you are.
Being amazed wondering what they saw,
You''re the burning bush. Indeed, you are.
It is the virgin''s foreshadow.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
She stands amongst the apostles'' claim.
You''re the burning bush. Indeed, you are.
She is their strength and what their hearts claim.
You''re the burning bush. Indeed, you are.
When the flame she knew lights their home.
You''re the burning bush. Indeed, you are.
By him who she was a shadow.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
You''re the burning bush. Indeed, you are.
They say you are the holy of holies.
They say you are the holy of holies.
The forefathers say to Hermetic,
"You''re the burning bush. Indeed, truly you are.
We are their children. Therefore, we preach
You''re the burning bush. Indeed, truly you are."
The Theotokos she is given to us.
You''re the burning bush. Indeed, truly you are.
Who are loved by her son''s sacrifice.
You''re the burning bush. Indeed, truly you are.
We say you are the holy of holies.
We say you are the holy of holies.
Amen.
Amen.
Amen.
Amen.
Amen.
Amen.'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e10b469d-eaf2-4917-b438-402e82af41a4'::uuid, 'the-burning-bush', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- for-there-s-no-one-like-him ("እንደ እግዚአብሔር ያለ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8772b6e5-1133-4122-8d14-f4639afd07c3'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 1
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
Ende Egziabher yale
Manm yelemna

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 2
Ende Egziabher yale
Manm yelemna
Ell belu qomu lemsgana
Ell belu qomu lemsgana

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 3
The water was parted
Revealing the sea floor
The Pharaoh had fallen
His scheming was no more

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 4
The meek used the new path and had treaded
The powerful were humiliated
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 5
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 6
The walls of Jericho
Untouched by any hand
What seemed invincible
Has crumbled down to sand

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 7
Though the mighty may seem to grow in strength
We''ll remain firm in him we have our faith
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 8
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 9
Our adversary
Had thrown a piercing rod
It tumbled to the ground
We''re shielded by our God

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 10
Let our praises soar to the Trinity
For he has lost the hunting enemy
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 11
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 12
On the sea he strides with
Grace and the utmost ease
When he rises grandly
The violent winds will cease

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 13
We worship him the virgin Mary''s son
He''s merciful impossible he''s done
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 14
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 15
Ende Egziabher yale
Manm yelemna
Ende Egziabher yale
Manm yelemna

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 16
Ell belu qomu lemsgana
Ell belu qomu lemsgana

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 1
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
እንደ እግዚአብሔር ያለ
ማንም የለምና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 2
እንደ እግዚአብሔር ያለ
ማንም የለምና
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 3
The water was parted
Revealing the sea floor
The Pharaoh had fallen
His scheming was no more

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 4
The meek used the new path and had treaded
The powerful were humiliated
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 5
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 6
The walls of Jericho
Untouched by any hand
What seemed invincible
Has crumbled down to sand

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 7
Though the mighty may seem to grow in strength
We''ll remain firm in him we have our faith
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 8
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 9
Our adversary
Had thrown a piercing rod
It tumbled to the ground
We''re shielded by our God

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 10
Let our praises soar to the Trinity
For he has lost the hunting enemy
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 11
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 12
On the sea he strides with
Grace and the utmost ease
When he rises grandly
The violent winds will cease

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 13
We worship him the virgin Mary''s son
He''s merciful impossible he''s done
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 14
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 15
እንደ እግዚአብሔር ያለ
ማንም የለምና
እንደ እግዚአብሔር ያለ
ማንም የለምና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 16
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 1
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
እንደ እግዚአብሔር ያለ
ማንም የለምና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 2
እንደ እግዚአብሔር ያለ
ማንም የለምና
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 3
The water was parted
Revealing the sea floor
The Pharaoh had fallen
His scheming was no more

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 4
The meek used the new path and had treaded
The powerful were humiliated
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 5
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 6
The walls of Jericho
Untouched by any hand
What seemed invincible
Has crumbled down to sand

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 7
Though the mighty may seem to grow in strength
We''ll remain firm in him we have our faith
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 8
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 9
Our adversary
Had thrown a piercing rod
It tumbled to the ground
We''re shielded by our God

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 10
Let our praises soar to the Trinity
For he has lost the hunting enemy
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 11
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 12
On the sea he strides with
Grace and the utmost ease
When he rises grandly
The violent winds will cease

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 13
We worship him the virgin Mary''s son
He''s merciful impossible he''s done
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 14
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 15
እንደ እግዚአብሔር ያለ
ማንም የለምና
እንደ እግዚአብሔር ያለ
ማንም የለምና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 16
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty' THEN lyrics_amharic 
          ELSE 'CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 1
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
እንደ እግዚአብሔር ያለ
ማንም የለምና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 2
እንደ እግዚአብሔር ያለ
ማንም የለምና
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 3
The water was parted
Revealing the sea floor
The Pharaoh had fallen
His scheming was no more

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 4
The meek used the new path and had treaded
The powerful were humiliated
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 5
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 6
The walls of Jericho
Untouched by any hand
What seemed invincible
Has crumbled down to sand

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 7
Though the mighty may seem to grow in strength
We''ll remain firm in him we have our faith
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 8
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 9
Our adversary
Had thrown a piercing rod
It tumbled to the ground
We''re shielded by our God

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 10
Let our praises soar to the Trinity
For he has lost the hunting enemy
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 11
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 12
On the sea he strides with
Grace and the utmost ease
When he rises grandly
The violent winds will cease

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 13
We worship him the virgin Mary''s son
He''s merciful impossible he''s done
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 14
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 15
እንደ እግዚአብሔር ያለ
ማንም የለምና
እንደ እግዚአብሔር ያለ
ማንም የለምና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 16
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty' 
        END,
        lyrics_transliteration = 'CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 1
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
Ende Egziabher yale
Manm yelemna

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 2
Ende Egziabher yale
Manm yelemna
Ell belu qomu lemsgana
Ell belu qomu lemsgana

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 3
The water was parted
Revealing the sea floor
The Pharaoh had fallen
His scheming was no more

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 4
The meek used the new path and had treaded
The powerful were humiliated
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 5
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 6
The walls of Jericho
Untouched by any hand
What seemed invincible
Has crumbled down to sand

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 7
Though the mighty may seem to grow in strength
We''ll remain firm in him we have our faith
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 8
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 9
Our adversary
Had thrown a piercing rod
It tumbled to the ground
We''re shielded by our God

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 10
Let our praises soar to the Trinity
For he has lost the hunting enemy
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 11
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 12
On the sea he strides with
Grace and the utmost ease
When he rises grandly
The violent winds will cease

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 13
We worship him the virgin Mary''s son
He''s merciful impossible he''s done
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 14
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 15
Ende Egziabher yale
Manm yelemna
Ende Egziabher yale
Manm yelemna

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 16
Ell belu qomu lemsgana
Ell belu qomu lemsgana

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8772b6e5-1133-4122-8d14-f4639afd07c3'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 1
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
እንደ እግዚአብሔር ያለ
ማንም የለምና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 2
እንደ እግዚአብሔር ያለ
ማንም የለምና
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 3
The water was parted
Revealing the sea floor
The Pharaoh had fallen
His scheming was no more

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 4
The meek used the new path and had treaded
The powerful were humiliated
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 5
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 6
The walls of Jericho
Untouched by any hand
What seemed invincible
Has crumbled down to sand

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 7
Though the mighty may seem to grow in strength
We''ll remain firm in him we have our faith
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 8
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 9
Our adversary
Had thrown a piercing rod
It tumbled to the ground
We''re shielded by our God

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 10
Let our praises soar to the Trinity
For he has lost the hunting enemy
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 11
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 12
On the sea he strides with
Grace and the utmost ease
When he rises grandly
The violent winds will cease

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 13
We worship him the virgin Mary''s son
He''s merciful impossible he''s done
For there''s no one like him
Our God the Almighty

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 14
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 15
እንደ እግዚአብሔር ያለ
ማንም የለምና
እንደ እግዚአብሔር ያለ
ማንም የለምና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty

VERSE 16
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና

CHORUS
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty'
        OR lyrics_amharic IS NOT DISTINCT FROM 'For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
እንደ እግዚአብሔር ያለ
ማንም የለምና
እንደ እግዚአብሔር ያለ
ማንም የለምና
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና
The water was parted
Revealing the sea floor
The Pharaoh had fallen
His scheming was no more
The meek used the new path and had treaded
The powerful were humiliated
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
The walls of Jericho
Untouched by any hand
What seemed invincible
Has crumbled down to sand
Though the mighty may seem to grow in strength
We''ll remain firm in him we have our faith
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
Our adversary
Had thrown a piercing rod
It tumbled to the ground
We''re shielded by our God
Let our praises soar to the Trinity
For he has lost the hunting enemy
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
On the sea he strides with
Grace and the utmost ease
When he rises grandly
The violent winds will cease
We worship him the virgin Mary''s son
He''s merciful impossible he''s done
For there''s no one like him
Our God the Almighty
For there''s no one like him
Our God the Almighty
Arise for praise and sing with Jubilee
Arise for praise and sing with Jubilee
እንደ እግዚአብሔር ያለ
ማንም የለምና
እንደ እግዚአብሔር ያለ
ማንም የለምና
እልል በሉ ቆሙ ለምስጋና
እልል በሉ ቆሙ ለምስጋና'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8772b6e5-1133-4122-8d14-f4639afd07c3'::uuid, 'for-there-s-no-one-like-him', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- who-is-the-righteous-one ("ኢትዮጵያዊው ፃድቅ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0ec65eca-26fa-43c3-b5db-cd1f16796f15'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 1
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 2
Seed in Ityisa, in faith you were grown,
You left all the world for the Lord alone.
Debre Libanos stands living and strong,
Proclaiming your glory in prayer in song.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 3
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 4
Lord who exalts you has crowned you with grace,
Now you are near us, unseen in this place.
In humility we stand, at your gate
Prayers of the righteous are grand great

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 5
Tekle Haymanot, a bright sun
Let grace pour upon me from heaven

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 6
Led us to pastures so living and green,
Fed us the Word, pure and gentle and clean.
The Gospel’s bright torch your hands set aflame
Enlightend all ages in the lords name.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 7
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 8
Bore thirty, sixty, a hundred once more,
Stood at debre asbo, one foot on the floor.
Bartholomew’s hope fulfilled in your way,
The Lord’s holy path was straightened that day.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 9
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 1
ኢትዮጵያዊው ፃድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 2
seed in Ityisa, in faith you were grown,
You left all the world for the Lord alone.
Debre Libanos stands living and strong,
Proclaiming your glory in prayer in song.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 3
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 4
Lord who exalts you has crowned you with grace,
now you are near us, unseen in this place.
In humility we stand, at your gate
prayers of the righteous are grand great

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 5
Tekle Haymanot, a bright sun
Let grace pour upon me from heaven

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 6
led us to pastures so living and green,
fed us the Word, pure and gentle and clean.
The Gospel’s bright torch your hands set aflame
Enlightend all ages in the lords name.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 7
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 8
bore thirty, sixty, a hundred once more,
Stood at debre asbo, one foot on the floor.
Bartholomew’s hope fulfilled in your way,
The Lord’s holy path was straightened that day.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 9
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 1
ኢትዮጵያዊው ፃድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 2
seed in Ityisa, in faith you were grown,
You left all the world for the Lord alone.
Debre Libanos stands living and strong,
Proclaiming your glory in prayer in song.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 3
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 4
Lord who exalts you has crowned you with grace,
now you are near us, unseen in this place.
In humility we stand, at your gate
prayers of the righteous are grand great

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 5
Tekle Haymanot, a bright sun
Let grace pour upon me from heaven

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 6
led us to pastures so living and green,
fed us the Word, pure and gentle and clean.
The Gospel’s bright torch your hands set aflame
Enlightend all ages in the lords name.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 7
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 8
bore thirty, sixty, a hundred once more,
Stood at debre asbo, one foot on the floor.
Bartholomew’s hope fulfilled in your way,
The Lord’s holy path was straightened that day.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 9
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.' THEN lyrics_amharic 
          ELSE 'CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 1
ኢትዮጵያዊው ፃድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 2
seed in Ityisa, in faith you were grown,
You left all the world for the Lord alone.
Debre Libanos stands living and strong,
Proclaiming your glory in prayer in song.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 3
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 4
Lord who exalts you has crowned you with grace,
now you are near us, unseen in this place.
In humility we stand, at your gate
prayers of the righteous are grand great

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 5
Tekle Haymanot, a bright sun
Let grace pour upon me from heaven

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 6
led us to pastures so living and green,
fed us the Word, pure and gentle and clean.
The Gospel’s bright torch your hands set aflame
Enlightend all ages in the lords name.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 7
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 8
bore thirty, sixty, a hundred once more,
Stood at debre asbo, one foot on the floor.
Bartholomew’s hope fulfilled in your way,
The Lord’s holy path was straightened that day.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 9
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.' 
        END,
        lyrics_transliteration = 'CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 1
Ityop’yawiw ts’adq man new biye t’eyeku
Bereket felge lisalemew nafeku
Kibrun limesekr tefeta milase
Kedeju dershe fiqrun bemeqmese

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 2
Seed in Ityisa, in faith you were grown,
You left all the world for the Lord alone.
Debre Libanos stands living and strong,
Proclaiming your glory in prayer in song.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 3
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 4
Lord who exalts you has crowned you with grace,
Now you are near us, unseen in this place.
In humility we stand, at your gate
Prayers of the righteous are grand great

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 5
Tekle Haymanot, a bright sun
Let grace pour upon me from heaven

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 6
Led us to pastures so living and green,
Fed us the Word, pure and gentle and clean.
The Gospel’s bright torch your hands set aflame
Enlightend all ages in the lords name.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 7
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 8
Bore thirty, sixty, a hundred once more,
Stood at debre asbo, one foot on the floor.
Bartholomew’s hope fulfilled in your way,
The Lord’s holy path was straightened that day.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 9
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0ec65eca-26fa-43c3-b5db-cd1f16796f15'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 1
ኢትዮጵያዊው ፃድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 2
seed in Ityisa, in faith you were grown,
You left all the world for the Lord alone.
Debre Libanos stands living and strong,
Proclaiming your glory in prayer in song.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 3
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 4
Lord who exalts you has crowned you with grace,
now you are near us, unseen in this place.
In humility we stand, at your gate
prayers of the righteous are grand great

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 5
Tekle Haymanot, a bright sun
Let grace pour upon me from heaven

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 6
led us to pastures so living and green,
fed us the Word, pure and gentle and clean.
The Gospel’s bright torch your hands set aflame
Enlightend all ages in the lords name.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 7
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 8
bore thirty, sixty, a hundred once more,
Stood at debre asbo, one foot on the floor.
Bartholomew’s hope fulfilled in your way,
The Lord’s holy path was straightened that day.

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.

VERSE 9
Tekle Haymanot, beloved
My home and my abode are blessed

CHORUS
Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Who is the righteous one of Ethiopia’s land?
I asked, with a longing to touch where you would stand.
I sought out your blessing, with my heart opened wide,
I came to your door and tasted your love inside.
ኢትዮጵያዊው ፃድቅ ማን ነው ብዬ ጠየኩ
በረከት ፈልጌ ልሳለመው ናፈኩ
ክብሩን ልመሰክር ተፈታ ምላሴ
ከደጁ ደርሼ ፍቅሩን በመቅመሴ
Verse:
seed in Ityisa, in faith you were grown,
You left all the world for the Lord alone.
Debre Libanos stands living and strong,
Proclaiming your glory in prayer in song.
Tekle Haymanot, beloved
My home and my abode are blessed
Verse:
Lord who exalts you has crowned you with grace,
now you are near us, unseen in this place.
In humility we stand, at your gate
prayers of the righteous are grand great
Tekle Haymanot, a bright sun
Let grace pour upon me from heaven
Verse:
led us to pastures so living and green,
fed us the Word, pure and gentle and clean.
The Gospel’s bright torch your hands set aflame
Enlightend all ages in the lords name.
Tekle Haymanot, beloved
My home and my abode are blessed
Verse:
bore thirty, sixty, a hundred once more,
Stood at debre asbo, one foot on the floor.
Bartholomew’s hope fulfilled in your way,
The Lord’s holy path was straightened that day.
Tekle Haymanot, beloved
My home and my abode are blessed'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0ec65eca-26fa-43c3-b5db-cd1f16796f15'::uuid, 'who-is-the-righteous-one', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- orthodox-tewahedo-mezmur-1415 ("እነሆ ተወለደ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4d204967-164a-49b5-9cb5-0a22ca21017a'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eneho tewelede |nay alem medhanit|x3
Asey tewelede |nay alem medhanit| x3
Tinbit tenebeyu |nebyat bimlom| x3
Amlak qedamawi |kwerd''yu ilomx3

VERSE 1
Seba segel mets’u |ksegdu bimlom| x3
Nay esrael nigus |tewelidu ilom| x3
Seba segel mets’u | kinesulu idom| x3
Werqi:et’an:kerbe |mets’wetu segidom| x3

CHORUS
Eneho tewelede |nay alem medhanit|x3
Asey tewelede |nay alem medhanit| x3
Tinbit tenebeyu |nebyat bimlom| x3
Amlak qedamawi |kwerd''yu ilomx3

VERSE 2
Miemenan niunay |nab lidetu bota | x3
May koynu iyu''mo |mear wala ts’eba| x3
Ab sorya teraeye |fet’ari kem gasha| x3
Bisrate lidetu |kerede niኹla| x3

CHORUS
Eneho tewelede |nay alem medhanit|x3
Asey tewelede |nay alem medhanit| x3
Tinbit tenebeyu |nebyat bimlom| x3
Amlak qedamawi |kwerd''yu ilomx3'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3

VERSE 1
ሰብአ ሰገል መጽኡ |ክሰግዱ ብምልኦም| x3
ናይ እስራኤል ንጉስ |ተወሊዱ ኢሎም| x3
ሰብአ ሰገል መጽኡ | ክነስኡሉ ኢዶም| x3
ወርቂ፥ዕጣን፥ከርቤ |መጽወቱ ሰጊዶም| x3

CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3

VERSE 2
ምእመናን ንዑናይ |ናብ ልደቱ ቦታ | x3
ማይ ኮይኑ ኢዩ''ሞ |መዓር ዋላ ጸባ| x3
ኣብ ሶርያ ተራእየ |ፈጣሪ ከም ጋሻ| x3
ብስራተ ልደቱ |ከረድእ ንኹላ| x3

CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3

VERSE 1
ሰብአ ሰገል መጽኡ |ክሰግዱ ብምልኦም| x3
ናይ እስራኤል ንጉስ |ተወሊዱ ኢሎም| x3
ሰብአ ሰገል መጽኡ | ክነስኡሉ ኢዶም| x3
ወርቂ፥ዕጣን፥ከርቤ |መጽወቱ ሰጊዶም| x3

CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3

VERSE 2
ምእመናን ንዑናይ |ናብ ልደቱ ቦታ | x3
ማይ ኮይኑ ኢዩ''ሞ |መዓር ዋላ ጸባ| x3
ኣብ ሶርያ ተራእየ |ፈጣሪ ከም ጋሻ| x3
ብስራተ ልደቱ |ከረድእ ንኹላ| x3

CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3' THEN lyrics_amharic 
          ELSE 'CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3

VERSE 1
ሰብአ ሰገል መጽኡ |ክሰግዱ ብምልኦም| x3
ናይ እስራኤል ንጉስ |ተወሊዱ ኢሎም| x3
ሰብአ ሰገል መጽኡ | ክነስኡሉ ኢዶም| x3
ወርቂ፥ዕጣን፥ከርቤ |መጽወቱ ሰጊዶም| x3

CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3

VERSE 2
ምእመናን ንዑናይ |ናብ ልደቱ ቦታ | x3
ማይ ኮይኑ ኢዩ''ሞ |መዓር ዋላ ጸባ| x3
ኣብ ሶርያ ተራእየ |ፈጣሪ ከም ጋሻ| x3
ብስራተ ልደቱ |ከረድእ ንኹላ| x3

CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3' 
        END,
        lyrics_transliteration = 'CHORUS
Eneho tewelede |nay alem medhanit|x3
Asey tewelede |nay alem medhanit| x3
Tinbit tenebeyu |nebyat bimlom| x3
Amlak qedamawi |kwerd''yu ilomx3

VERSE 1
Seba segel mets’u |ksegdu bimlom| x3
Nay esrael nigus |tewelidu ilom| x3
Seba segel mets’u | kinesulu idom| x3
Werqi:et’an:kerbe |mets’wetu segidom| x3

CHORUS
Eneho tewelede |nay alem medhanit|x3
Asey tewelede |nay alem medhanit| x3
Tinbit tenebeyu |nebyat bimlom| x3
Amlak qedamawi |kwerd''yu ilomx3

VERSE 2
Miemenan niunay |nab lidetu bota | x3
May koynu iyu''mo |mear wala ts’eba| x3
Ab sorya teraeye |fet’ari kem gasha| x3
Bisrate lidetu |kerede niኹla| x3

CHORUS
Eneho tewelede |nay alem medhanit|x3
Asey tewelede |nay alem medhanit| x3
Tinbit tenebeyu |nebyat bimlom| x3
Amlak qedamawi |kwerd''yu ilomx3',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4d204967-164a-49b5-9cb5-0a22ca21017a'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3

VERSE 1
ሰብአ ሰገል መጽኡ |ክሰግዱ ብምልኦም| x3
ናይ እስራኤል ንጉስ |ተወሊዱ ኢሎም| x3
ሰብአ ሰገል መጽኡ | ክነስኡሉ ኢዶም| x3
ወርቂ፥ዕጣን፥ከርቤ |መጽወቱ ሰጊዶም| x3

CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3

VERSE 2
ምእመናን ንዑናይ |ናብ ልደቱ ቦታ | x3
ማይ ኮይኑ ኢዩ''ሞ |መዓር ዋላ ጸባ| x3
ኣብ ሶርያ ተራእየ |ፈጣሪ ከም ጋሻ| x3
ብስራተ ልደቱ |ከረድእ ንኹላ| x3

CHORUS
እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እነሆ ተወለደ |ናይ ዓለም መድኃኒት|x3
ኣሰይ ተወለደ |ናይ ዓለም መድኃኒት| x3
ትንቢት ተነበዩ |ነብያት ብምልኦም| x3
አምላክ ቀዳማዊ |ክወርድ''ዩ ኢሎምx3
ሰብአ ሰገል መጽኡ |ክሰግዱ ብምልኦም| x3
ናይ እስራኤል ንጉስ |ተወሊዱ ኢሎም| x3
ሰብአ ሰገል መጽኡ | ክነስኡሉ ኢዶም| x3
ወርቂ፥ዕጣን፥ከርቤ |መጽወቱ ሰጊዶም| x3
ምእመናን ንዑናይ |ናብ ልደቱ ቦታ | x3
ማይ ኮይኑ ኢዩ''ሞ |መዓር ዋላ ጸባ| x3
ኣብ ሶርያ ተራእየ |ፈጣሪ ከም ጋሻ| x3
ብስራተ ልደቱ |ከረድእ ንኹላ| x3'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4d204967-164a-49b5-9cb5-0a22ca21017a'::uuid, 'orthodox-tewahedo-mezmur-1415', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wemako-ethiopian-orthodox-mezmur ("ወእመአኮ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fdd568d9-d6a3-4b30-bae4-af4d36442e08'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 1
" gizew yalalefe
" abbo t’ewlgo
" derqo yalregefe
Azagn yelegnm Dingil salew behywete

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 2
T’utwan salt’egbew diro t’lagn enate
Anchin yeset’egn Geta yimesgenlgn
Keengdih wedih kanchi manm ayleyegn

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 3
Heleluya enem ende efrem
" endamesegnsh
" amesgnegn yemil
" asemign keqalsh

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 4
Azagn yelegnm Dingil salew behywete
T’utwan salt’egbew diro t’lagn enate
Anchin yeset’egn Geta yimesgenlgn
Keengdih wedih kanchi manm ayleyegn

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 5
Heleluya maebelu gefto
" bitawek hiywete
" hemere noh Dingil
" honshgn meserete

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 6
Azagn yelegnm Dingil salew behywete
T’utwan salt’egbew diro t’lagn enate
Anchin yeset’egn Geta yimesgenlgn
Keengdih wedih kanchi manm ayleyegn

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 7
Heleluya sebarawn liben
" degefshw endiqom
" wiletash ayalqm
" bich’oh lezelalem

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 8
Azagn yelegnm Dingil salew behywete
T’utwan salt’egbew diro t’lagn enate
Anchin yeset’egn Geta yimesgenlgn
Keengdih wedih kanchi manm ayleyegn

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 1
" ጊዜው ያላለፈ
" አብቦ ጠውልጎ
" ደርቆ ያልረገፈ
አዛኝ የለኝም ድንግል ሳለው በህይወቴ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 2
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 3
ሀሌሉያ እኔም እንደ ኤፍሬም
" እንዳመሰግንሽ
" አመስግነኝ የሚል
" አሰሚኝ ከቃልሽ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 4
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 5
ሀሌሉያ ማዕበሉ ገፍቶ
" ቢታወክ ህይወቴ
" ሐመረ ኖህ ድንግል
" ሆንሽኝ መሠረቴ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 6
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 7
ሀሌሉያ ሠባራውን ልቤን
" ደገፍሽው እንዲቆም
" ውለታሽ አያልቅም
" ብጮህ ለዘላለም

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 8
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 1
" ጊዜው ያላለፈ
" አብቦ ጠውልጎ
" ደርቆ ያልረገፈ
አዛኝ የለኝም ድንግል ሳለው በህይወቴ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 2
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 3
ሀሌሉያ እኔም እንደ ኤፍሬም
" እንዳመሰግንሽ
" አመስግነኝ የሚል
" አሰሚኝ ከቃልሽ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 4
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 5
ሀሌሉያ ማዕበሉ ገፍቶ
" ቢታወክ ህይወቴ
" ሐመረ ኖህ ድንግል
" ሆንሽኝ መሠረቴ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 6
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 7
ሀሌሉያ ሠባራውን ልቤን
" ደገፍሽው እንዲቆም
" ውለታሽ አያልቅም
" ብጮህ ለዘላለም

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 8
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል' THEN lyrics_amharic 
          ELSE 'CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 1
" ጊዜው ያላለፈ
" አብቦ ጠውልጎ
" ደርቆ ያልረገፈ
አዛኝ የለኝም ድንግል ሳለው በህይወቴ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 2
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 3
ሀሌሉያ እኔም እንደ ኤፍሬም
" እንዳመሰግንሽ
" አመስግነኝ የሚል
" አሰሚኝ ከቃልሽ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 4
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 5
ሀሌሉያ ማዕበሉ ገፍቶ
" ቢታወክ ህይወቴ
" ሐመረ ኖህ ድንግል
" ሆንሽኝ መሠረቴ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 6
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 7
ሀሌሉያ ሠባራውን ልቤን
" ደገፍሽው እንዲቆም
" ውለታሽ አያልቅም
" ብጮህ ለዘላለም

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 8
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል' 
        END,
        lyrics_transliteration = 'CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 1
" gizew yalalefe
" abbo t’ewlgo
" derqo yalregefe
Azagn yelegnm Dingil salew behywete

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 2
T’utwan salt’egbew diro t’lagn enate
Anchin yeset’egn Geta yimesgenlgn
Keengdih wedih kanchi manm ayleyegn

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 3
Heleluya enem ende efrem
" endamesegnsh
" amesgnegn yemil
" asemign keqalsh

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 4
Azagn yelegnm Dingil salew behywete
T’utwan salt’egbew diro t’lagn enate
Anchin yeset’egn Geta yimesgenlgn
Keengdih wedih kanchi manm ayleyegn

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 5
Heleluya maebelu gefto
" bitawek hiywete
" hemere noh Dingil
" honshgn meserete

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 6
Azagn yelegnm Dingil salew behywete
T’utwan salt’egbew diro t’lagn enate
Anchin yeset’egn Geta yimesgenlgn
Keengdih wedih kanchi manm ayleyegn

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 7
Heleluya sebarawn liben
" degefshw endiqom
" wiletash ayalqm
" bich’oh lezelalem

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil

VERSE 8
Azagn yelegnm Dingil salew behywete
T’utwan salt’egbew diro t’lagn enate
Anchin yeset’egn Geta yimesgenlgn
Keengdih wedih kanchi manm ayleyegn

CHORUS
Weemeako
Weeme ako kemewereza hayel
Wist’e adbare betel
Heleluya abeba nesh Dingil',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fdd568d9-d6a3-4b30-bae4-af4d36442e08'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 1
" ጊዜው ያላለፈ
" አብቦ ጠውልጎ
" ደርቆ ያልረገፈ
አዛኝ የለኝም ድንግል ሳለው በህይወቴ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 2
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 3
ሀሌሉያ እኔም እንደ ኤፍሬም
" እንዳመሰግንሽ
" አመስግነኝ የሚል
" አሰሚኝ ከቃልሽ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 4
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 5
ሀሌሉያ ማዕበሉ ገፍቶ
" ቢታወክ ህይወቴ
" ሐመረ ኖህ ድንግል
" ሆንሽኝ መሠረቴ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 6
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 7
ሀሌሉያ ሠባራውን ልቤን
" ደገፍሽው እንዲቆም
" ውለታሽ አያልቅም
" ብጮህ ለዘላለም

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል

VERSE 8
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ

CHORUS
ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ወእመአኮ
ወእመ አኮ ከመወሬዛ ኃየል
ውስጠ አድባረ ቤቴል
ሀሌሉያ አበባ ነሽ ድንግል
" ጊዜው ያላለፈ
" አብቦ ጠውልጎ
" ደርቆ ያልረገፈ
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ
አዝማች
ሀሌሉያ እኔም እንደ ኤፍሬም
" እንዳመሰግንሽ
" አመስግነኝ የሚል
" አሰሚኝ ከቃልሽ
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ
አዝማች
ሀሌሉያ ማዕበሉ ገፍቶ
" ቢታወክ ህይወቴ
" ሐመረ ኖህ ድንግል
" ሆንሽኝ መሠረቴ
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ
ሀሌሉያ ሠባራውን ልቤን
" ደገፍሽው እንዲቆም
" ውለታሽ አያልቅም
" ብጮህ ለዘላለም
አዛኝ የለኝም ድንግል ሳለው በህይወቴ
ጡቷን ሳልጠግበው ድሮ ጥላኝ እናቴ
አንቺን የሰጠኝ ጌታ ይመስገንልኝ
ከእንግዲህ ወዲህ ካንቺ ማንም አይለየኝ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fdd568d9-d6a3-4b30-bae4-af4d36442e08'::uuid, 'wemako-ethiopian-orthodox-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nikodimos-english-ethiopian-orthodox-tewahedo-hymn ("nikodimos-english-ethiopian-orthodox-tewahedo-hymn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '41b83c00-7799-4c26-8b41-69757b2e6a29'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 1
Despite the darkened sky, one star shined in the night
Neglecting worldly things, steadfast amid the plight
Though he was a teacher, he never ceased to learn
The tethers of his pride, with humbleness, he did tear and did spurn

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 2
A love that conquers fear, did reign within his heart
He buried his Teacher, through this he did his part
The Shroud of our Lord, he honored with perfume
In doing so he was given life with Christ the heavenly groom

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 3
Passing from Lord to lord, true Wisdom was revealed
To those who keep the Law, I will advise indeed
If your soul awakens, and returns from her sins
Just like Nikodimos, your soul, stands with the Lord therein

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 1
Despite the darkened sky, one star shined in the night
Neglecting worldly things, steadfast amid the plight
Though he was a teacher, he never ceased to learn
The tethers of his pride, with humbleness, he did tear and did spurn

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 2
A love that conquers fear, did reign within his heart
He buried his Teacher, through this he did his part
the Shroud of our Lord, he honored with perfume
In doing so he was given life with Christ the heavenly groom

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 3
Passing from Lord to lord, true Wisdom was revealed
To those who keep the Law, I will advise indeed
If your soul awakens, and returns from her sins
Just like Nikodimos, your soul, stands with the Lord therein

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 1
Despite the darkened sky, one star shined in the night
Neglecting worldly things, steadfast amid the plight
Though he was a teacher, he never ceased to learn
The tethers of his pride, with humbleness, he did tear and did spurn

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 2
A love that conquers fear, did reign within his heart
He buried his Teacher, through this he did his part
the Shroud of our Lord, he honored with perfume
In doing so he was given life with Christ the heavenly groom

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 3
Passing from Lord to lord, true Wisdom was revealed
To those who keep the Law, I will advise indeed
If your soul awakens, and returns from her sins
Just like Nikodimos, your soul, stands with the Lord therein

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns' THEN lyrics_amharic 
          ELSE 'CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 1
Despite the darkened sky, one star shined in the night
Neglecting worldly things, steadfast amid the plight
Though he was a teacher, he never ceased to learn
The tethers of his pride, with humbleness, he did tear and did spurn

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 2
A love that conquers fear, did reign within his heart
He buried his Teacher, through this he did his part
the Shroud of our Lord, he honored with perfume
In doing so he was given life with Christ the heavenly groom

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 3
Passing from Lord to lord, true Wisdom was revealed
To those who keep the Law, I will advise indeed
If your soul awakens, and returns from her sins
Just like Nikodimos, your soul, stands with the Lord therein

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns' 
        END,
        lyrics_transliteration = 'CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 1
Despite the darkened sky, one star shined in the night
Neglecting worldly things, steadfast amid the plight
Though he was a teacher, he never ceased to learn
The tethers of his pride, with humbleness, he did tear and did spurn

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 2
A love that conquers fear, did reign within his heart
He buried his Teacher, through this he did his part
The Shroud of our Lord, he honored with perfume
In doing so he was given life with Christ the heavenly groom

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 3
Passing from Lord to lord, true Wisdom was revealed
To those who keep the Law, I will advise indeed
If your soul awakens, and returns from her sins
Just like Nikodimos, your soul, stands with the Lord therein

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns',
        updated_at = clock_timestamp()::text
    WHERE import_id = '41b83c00-7799-4c26-8b41-69757b2e6a29'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 1
Despite the darkened sky, one star shined in the night
Neglecting worldly things, steadfast amid the plight
Though he was a teacher, he never ceased to learn
The tethers of his pride, with humbleness, he did tear and did spurn

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 2
A love that conquers fear, did reign within his heart
He buried his Teacher, through this he did his part
the Shroud of our Lord, he honored with perfume
In doing so he was given life with Christ the heavenly groom

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns

VERSE 3
Passing from Lord to lord, true Wisdom was revealed
To those who keep the Law, I will advise indeed
If your soul awakens, and returns from her sins
Just like Nikodimos, your soul, stands with the Lord therein

CHORUS
Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Nikodimos nikodemos kibur
Lelitun bebirehan yemimar memehir
Nikodimos Nikodimos the honored
From dusk until dawn, A teacher who learns
Despite the darkened sky, one star shined in the night
Neglecting worldly things, steadfast amid the plight
Though he was a teacher, he never ceased to learn
The tethers of his pride, with humbleness, he did tear and did spurn
A love that conquers fear, did reign within his heart
He buried his Teacher, through this he did his part
the Shroud of our Lord, he honored with perfume
In doing so he was given life with Christ the heavenly groom
Passing from Lord to lord, true Wisdom was revealed
To those who keep the Law, I will advise indeed
If your soul awakens, and returns from her sins
Just like Nikodimos, your soul, stands with the Lord therein'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '41b83c00-7799-4c26-8b41-69757b2e6a29'::uuid, 'nikodimos-english-ethiopian-orthodox-tewahedo-hymn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- praises-of-mary-3026 ("praises-of-mary-3026")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7fa7abae-f3a4-48fb-8ca2-cc1f7ba459fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
This is a Merry Christmas
As we sing Melody the Virgin lives
And every person
Jesus Christ

VERSE 1
Word afraid
Community releasing to you
Around here
Glory

CHORUS
This is a Merry Christmas
As we sing Melody the Virgin lives
And every person
Jesus Christ

VERSE 2
Thank you

CHORUS
This is a Merry Christmas
As we sing Melody the Virgin lives
And every person
Jesus Christ'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ

VERSE 1
word afraid
community releasing to you
around here
Glory

CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ

VERSE 2
thank you

CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ

VERSE 1
word afraid
community releasing to you
around here
Glory

CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ

VERSE 2
thank you

CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ' THEN lyrics_amharic 
          ELSE 'CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ

VERSE 1
word afraid
community releasing to you
around here
Glory

CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ

VERSE 2
thank you

CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ' 
        END,
        lyrics_transliteration = 'CHORUS
This is a Merry Christmas
As we sing Melody the Virgin lives
And every person
Jesus Christ

VERSE 1
Word afraid
Community releasing to you
Around here
Glory

CHORUS
This is a Merry Christmas
As we sing Melody the Virgin lives
And every person
Jesus Christ

VERSE 2
Thank you

CHORUS
This is a Merry Christmas
As we sing Melody the Virgin lives
And every person
Jesus Christ',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7fa7abae-f3a4-48fb-8ca2-cc1f7ba459fe'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ

VERSE 1
word afraid
community releasing to you
around here
Glory

CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ

VERSE 2
thank you

CHORUS
this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'this is a Merry Christmas
As we sing Melody the Virgin lives
and every person
Jesus Christ
word afraid
community releasing to you
around here
Glory
thank you'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7fa7abae-f3a4-48fb-8ca2-cc1f7ba459fe'::uuid, 'praises-of-mary-3026', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- orthodox-begena-mezmur ("በጌተሰማኔ በአታክልቱ ቦታ ምርጥ የበገና መዝሙር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a17714c0-0aaa-4989-ac30-01e579b2b51f'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 1
Egnam neberebn yezelealem mot
Yezelealem mot
Mesqel teshekmo siwet’a terara (2)
Yigerfut nebere hulum beyetera

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 2
Hulum beyetera
Dingil alchalechm enbawan litgeta （2）
Eyayech bemesqel lijwa singelata
Lijwa singelata

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 3
Beamlaknetu sayferdbachew （2）
Endih sil ts’eleye abat hoy marachew
Abat hoy marachew
Bereqiq silt’anu hulun yefet’ere

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 4
Bereqiq t’bebu hulun yefet’ere
Besew ej tegerfo moto teqebere
Mote teqebere
Fiqrun yegelets’ew teweldo besga （2）

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 5
Eyesus Geta new alfana omega
Alfana omega
Bemesqel teseqlo endiya eyeqatete （2）
Alemn lemadan yemaymotew mote

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 6
Yemaymotew mote
Kemot litadegen bemet’aln fet’no（2）
Mesqel ashekemut wiletaw yih hono
Wiletaw yih hono

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 7
Mekerawn sasb sastaws qenun（2）
Yiqoslal yidemal libe behazen
Libe behazen
Mech leerasu neber yih hulu mekera（2）

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 8
Mesqel teshekmo yewet’a terara
Yewet’a terara
Siyagorsut ''minakes sew kifu newna
Ewrum biyabera gobat’an biyaqena

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 9
Getayen seqelut ayhud ch’ekenuna
Ayhud ch’ekenuna
Minew ayasazn yeayhud kifat （2）
Yeznabun Geta wiha sinegfut

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 10
Wiha sinegfut
Betenkol behat’iat qeru endesekeru （2）
Mutan kemeqabr tenestew siyastemru
Tenestew siyastemru

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 11
Enatachn hewan weyo bey alqsh
Yeanchn himem tamo kemot liyadnsh
Yehyawan Geta teseqelelsh
Teseqelelsh

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 12
Aye gud aye gud alem yehwalash （2）
Medhanit Kristos begf motebsh
Begf motebsh
Bemesqel teseqlo sigawn siqors

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 13
Bechnkar tewegto demunm siyafes
Walech bemekera Dingil sitaleqs
Enat sitaleqs
Sewnetsh rade hazen kebebesh

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 14
Siqay mekerawm dagm ts’enabsh
Teseqlo sitayw and amlak lijsh
And amlak lijsh
Bifesm enbaye hono menta menta

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 15
Mech waga yihonal leanditu t’ebta
Laleqesshw leqso Dingil yeziyan leta
Enat yeziyan leta
Baleqesshw leqso beljsh himem （2）

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 16
Kehat’at nets’ahugn dankugn kegehanem
Dankugn kegehanem

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 1
እኛም ነበረብን የዘለዓለም ሞት
የዘለዓለም ሞት
መስቀል ተሸክሞ ሲወጣ ተራራ (2)
ይገርፉት ነበረ ሁሉም በየተራ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 2
ሁሉም በየተራ
ድንግል አልቻለችም እንባዋን ልትገታ （2）
እያየች በመስቀል ልጇ ሲንገላታ
ልጇ ሲንገላታ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 3
በአምላክነቱ ሳይፈርድባቸው （2）
እንዲህ ሲል ፀለየ አባት ሆይ ማራቸው
አባት ሆይ ማራቸው
በረቂቅ ስልጣኑ ሁሉን የፈጠረ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 4
በረቂቅ ጥበቡ ሁሉን የፈጠረ
በሰው እጅ ተገርፎ ሞቶ ተቀበረ
ሞተ ተቀበረ
ፍቅሩን የገለፀው ተወልዶ በስጋ （2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 5
እየሱስ ጌታ ነው አልፋና ኦሜጋ
አልፋና ኦሜጋ
በመስቀል ተሰቅሎ እንዲያ እየቃተተ （2）
አለምን ለማዳን የማይሞተው ሞተ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 6
የማይሞተው ሞተ
ከሞት ሊታደገን በመጣልን ፈጥኖ（2）
መስቀል አሸከሙት ውለታው ይህ ሆኖ
ውለታው ይህ ሆኖ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 7
መከራውን ሳስብ ሳስታውስ ቀኑን（2）
ይቆስላል ይደማል ልቤ በሃዘን
ልቤ በሃዘን
መች ለእራሱ ነበር ይህ ሁሉ መከራ（2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 8
መስቀል ተሸክሞ የወጣ ተራራ
የወጣ ተራራ
ሲያጎርሱት ''ሚናከስ ሰው ክፉ ነውና
እውሩም ቢያበራ ጎባጣን ቢያቀና

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 9
ጌታየን ሰቀሉት አይሁድ ጨከኑና
አይሁድ ጨከኑና
ምነው አያሳዝን የአይሁድ ክፋት （2）
የዝናቡን ጌታ ውሃ ሲነግፉት

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 10
ውሃ ሲነግፉት
በተንኮል በኃጢአት ቀሩ እንደሰከሩ （2）
ሙታን ከመቃብር ተነስተው ሲያስተምሩ
ተነስተው ሲያስተምሩ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 11
እናታችን ሔዋን ወዮ በይ አልቅሽ
የአንችን ህመም ታሞ ከሞት ሊያድንሽ
የህያዋን ጌታ ተሰቀለልሽ
ተሰቀለልሽ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 12
አየ ጉድ አየ ጉድ ዓለም የኋላሽ （2）
መድሃኒት ክርስቶስ በግፍ ሞተብሽ
በግፍ ሞተብሽ
በመስቀል ተሰቅሎ ስጋውን ሲቆርስ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 13
በችንካር ተወግቶ ደሙንም ሲያፈስ
ዋለች በመከራ ድንግል ስታለቅስ
እናት ስታለቅስ
ሰውነትሽ ራደ ሃዘን ከበበሽ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 14
ስቃይ መከራውም ዳግም ፀናብሽ
ተሰቅሎ ስታይው አንድ አምላክ ልጅሽ
አንድ አምላክ ልጅሽ
ቢፈስም እንባየ ሆኖ መንታ መንታ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 15
መች ዋጋ ይሆናል ለአንዲቱ ጠብታ
ላለቀስሽው ለቅሶ ድንግል የዚያን ለታ
እናት የዚያን ለታ
ባለቀስሽው ለቅሶ በልጅሽ ህመም （2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 16
ከኃጥአት ነፃሁኝ ዳንኩኝ ከገሃነም
ዳንኩኝ ከገሃነም

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 1
እኛም ነበረብን የዘለዓለም ሞት
የዘለዓለም ሞት
መስቀል ተሸክሞ ሲወጣ ተራራ (2)
ይገርፉት ነበረ ሁሉም በየተራ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 2
ሁሉም በየተራ
ድንግል አልቻለችም እንባዋን ልትገታ （2）
እያየች በመስቀል ልጇ ሲንገላታ
ልጇ ሲንገላታ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 3
በአምላክነቱ ሳይፈርድባቸው （2）
እንዲህ ሲል ፀለየ አባት ሆይ ማራቸው
አባት ሆይ ማራቸው
በረቂቅ ስልጣኑ ሁሉን የፈጠረ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 4
በረቂቅ ጥበቡ ሁሉን የፈጠረ
በሰው እጅ ተገርፎ ሞቶ ተቀበረ
ሞተ ተቀበረ
ፍቅሩን የገለፀው ተወልዶ በስጋ （2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 5
እየሱስ ጌታ ነው አልፋና ኦሜጋ
አልፋና ኦሜጋ
በመስቀል ተሰቅሎ እንዲያ እየቃተተ （2）
አለምን ለማዳን የማይሞተው ሞተ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 6
የማይሞተው ሞተ
ከሞት ሊታደገን በመጣልን ፈጥኖ（2）
መስቀል አሸከሙት ውለታው ይህ ሆኖ
ውለታው ይህ ሆኖ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 7
መከራውን ሳስብ ሳስታውስ ቀኑን（2）
ይቆስላል ይደማል ልቤ በሃዘን
ልቤ በሃዘን
መች ለእራሱ ነበር ይህ ሁሉ መከራ（2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 8
መስቀል ተሸክሞ የወጣ ተራራ
የወጣ ተራራ
ሲያጎርሱት ''ሚናከስ ሰው ክፉ ነውና
እውሩም ቢያበራ ጎባጣን ቢያቀና

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 9
ጌታየን ሰቀሉት አይሁድ ጨከኑና
አይሁድ ጨከኑና
ምነው አያሳዝን የአይሁድ ክፋት （2）
የዝናቡን ጌታ ውሃ ሲነግፉት

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 10
ውሃ ሲነግፉት
በተንኮል በኃጢአት ቀሩ እንደሰከሩ （2）
ሙታን ከመቃብር ተነስተው ሲያስተምሩ
ተነስተው ሲያስተምሩ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 11
እናታችን ሔዋን ወዮ በይ አልቅሽ
የአንችን ህመም ታሞ ከሞት ሊያድንሽ
የህያዋን ጌታ ተሰቀለልሽ
ተሰቀለልሽ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 12
አየ ጉድ አየ ጉድ ዓለም የኋላሽ （2）
መድሃኒት ክርስቶስ በግፍ ሞተብሽ
በግፍ ሞተብሽ
በመስቀል ተሰቅሎ ስጋውን ሲቆርስ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 13
በችንካር ተወግቶ ደሙንም ሲያፈስ
ዋለች በመከራ ድንግል ስታለቅስ
እናት ስታለቅስ
ሰውነትሽ ራደ ሃዘን ከበበሽ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 14
ስቃይ መከራውም ዳግም ፀናብሽ
ተሰቅሎ ስታይው አንድ አምላክ ልጅሽ
አንድ አምላክ ልጅሽ
ቢፈስም እንባየ ሆኖ መንታ መንታ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 15
መች ዋጋ ይሆናል ለአንዲቱ ጠብታ
ላለቀስሽው ለቅሶ ድንግል የዚያን ለታ
እናት የዚያን ለታ
ባለቀስሽው ለቅሶ በልጅሽ ህመም （2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 16
ከኃጥአት ነፃሁኝ ዳንኩኝ ከገሃነም
ዳንኩኝ ከገሃነም

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)' THEN lyrics_amharic 
          ELSE 'CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 1
እኛም ነበረብን የዘለዓለም ሞት
የዘለዓለም ሞት
መስቀል ተሸክሞ ሲወጣ ተራራ (2)
ይገርፉት ነበረ ሁሉም በየተራ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 2
ሁሉም በየተራ
ድንግል አልቻለችም እንባዋን ልትገታ （2）
እያየች በመስቀል ልጇ ሲንገላታ
ልጇ ሲንገላታ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 3
በአምላክነቱ ሳይፈርድባቸው （2）
እንዲህ ሲል ፀለየ አባት ሆይ ማራቸው
አባት ሆይ ማራቸው
በረቂቅ ስልጣኑ ሁሉን የፈጠረ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 4
በረቂቅ ጥበቡ ሁሉን የፈጠረ
በሰው እጅ ተገርፎ ሞቶ ተቀበረ
ሞተ ተቀበረ
ፍቅሩን የገለፀው ተወልዶ በስጋ （2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 5
እየሱስ ጌታ ነው አልፋና ኦሜጋ
አልፋና ኦሜጋ
በመስቀል ተሰቅሎ እንዲያ እየቃተተ （2）
አለምን ለማዳን የማይሞተው ሞተ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 6
የማይሞተው ሞተ
ከሞት ሊታደገን በመጣልን ፈጥኖ（2）
መስቀል አሸከሙት ውለታው ይህ ሆኖ
ውለታው ይህ ሆኖ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 7
መከራውን ሳስብ ሳስታውስ ቀኑን（2）
ይቆስላል ይደማል ልቤ በሃዘን
ልቤ በሃዘን
መች ለእራሱ ነበር ይህ ሁሉ መከራ（2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 8
መስቀል ተሸክሞ የወጣ ተራራ
የወጣ ተራራ
ሲያጎርሱት ''ሚናከስ ሰው ክፉ ነውና
እውሩም ቢያበራ ጎባጣን ቢያቀና

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 9
ጌታየን ሰቀሉት አይሁድ ጨከኑና
አይሁድ ጨከኑና
ምነው አያሳዝን የአይሁድ ክፋት （2）
የዝናቡን ጌታ ውሃ ሲነግፉት

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 10
ውሃ ሲነግፉት
በተንኮል በኃጢአት ቀሩ እንደሰከሩ （2）
ሙታን ከመቃብር ተነስተው ሲያስተምሩ
ተነስተው ሲያስተምሩ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 11
እናታችን ሔዋን ወዮ በይ አልቅሽ
የአንችን ህመም ታሞ ከሞት ሊያድንሽ
የህያዋን ጌታ ተሰቀለልሽ
ተሰቀለልሽ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 12
አየ ጉድ አየ ጉድ ዓለም የኋላሽ （2）
መድሃኒት ክርስቶስ በግፍ ሞተብሽ
በግፍ ሞተብሽ
በመስቀል ተሰቅሎ ስጋውን ሲቆርስ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 13
በችንካር ተወግቶ ደሙንም ሲያፈስ
ዋለች በመከራ ድንግል ስታለቅስ
እናት ስታለቅስ
ሰውነትሽ ራደ ሃዘን ከበበሽ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 14
ስቃይ መከራውም ዳግም ፀናብሽ
ተሰቅሎ ስታይው አንድ አምላክ ልጅሽ
አንድ አምላክ ልጅሽ
ቢፈስም እንባየ ሆኖ መንታ መንታ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 15
መች ዋጋ ይሆናል ለአንዲቱ ጠብታ
ላለቀስሽው ለቅሶ ድንግል የዚያን ለታ
እናት የዚያን ለታ
ባለቀስሽው ለቅሶ በልጅሽ ህመም （2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 16
ከኃጥአት ነፃሁኝ ዳንኩኝ ከገሃነም
ዳንኩኝ ከገሃነም

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)' 
        END,
        lyrics_transliteration = 'CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 1
Egnam neberebn yezelealem mot
Yezelealem mot
Mesqel teshekmo siwet’a terara (2)
Yigerfut nebere hulum beyetera

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 2
Hulum beyetera
Dingil alchalechm enbawan litgeta （2）
Eyayech bemesqel lijwa singelata
Lijwa singelata

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 3
Beamlaknetu sayferdbachew （2）
Endih sil ts’eleye abat hoy marachew
Abat hoy marachew
Bereqiq silt’anu hulun yefet’ere

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 4
Bereqiq t’bebu hulun yefet’ere
Besew ej tegerfo moto teqebere
Mote teqebere
Fiqrun yegelets’ew teweldo besga （2）

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 5
Eyesus Geta new alfana omega
Alfana omega
Bemesqel teseqlo endiya eyeqatete （2）
Alemn lemadan yemaymotew mote

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 6
Yemaymotew mote
Kemot litadegen bemet’aln fet’no（2）
Mesqel ashekemut wiletaw yih hono
Wiletaw yih hono

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 7
Mekerawn sasb sastaws qenun（2）
Yiqoslal yidemal libe behazen
Libe behazen
Mech leerasu neber yih hulu mekera（2）

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 8
Mesqel teshekmo yewet’a terara
Yewet’a terara
Siyagorsut ''minakes sew kifu newna
Ewrum biyabera gobat’an biyaqena

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 9
Getayen seqelut ayhud ch’ekenuna
Ayhud ch’ekenuna
Minew ayasazn yeayhud kifat （2）
Yeznabun Geta wiha sinegfut

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 10
Wiha sinegfut
Betenkol behat’iat qeru endesekeru （2）
Mutan kemeqabr tenestew siyastemru
Tenestew siyastemru

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 11
Enatachn hewan weyo bey alqsh
Yeanchn himem tamo kemot liyadnsh
Yehyawan Geta teseqelelsh
Teseqelelsh

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 12
Aye gud aye gud alem yehwalash （2）
Medhanit Kristos begf motebsh
Begf motebsh
Bemesqel teseqlo sigawn siqors

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 13
Bechnkar tewegto demunm siyafes
Walech bemekera Dingil sitaleqs
Enat sitaleqs
Sewnetsh rade hazen kebebesh

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 14
Siqay mekerawm dagm ts’enabsh
Teseqlo sitayw and amlak lijsh
And amlak lijsh
Bifesm enbaye hono menta menta

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 15
Mech waga yihonal leanditu t’ebta
Laleqesshw leqso Dingil yeziyan leta
Enat yeziyan leta
Baleqesshw leqso beljsh himem （2）

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)

VERSE 16
Kehat’at nets’ahugn dankugn kegehanem
Dankugn kegehanem

CHORUS
Begetesemane beatakltu bota (2)
Legna sil Getachen bealem tengelata
Bealem tengelata
Adamna hewan bat’efut t’fat (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a17714c0-0aaa-4989-ac30-01e579b2b51f'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 1
እኛም ነበረብን የዘለዓለም ሞት
የዘለዓለም ሞት
መስቀል ተሸክሞ ሲወጣ ተራራ (2)
ይገርፉት ነበረ ሁሉም በየተራ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 2
ሁሉም በየተራ
ድንግል አልቻለችም እንባዋን ልትገታ （2）
እያየች በመስቀል ልጇ ሲንገላታ
ልጇ ሲንገላታ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 3
በአምላክነቱ ሳይፈርድባቸው （2）
እንዲህ ሲል ፀለየ አባት ሆይ ማራቸው
አባት ሆይ ማራቸው
በረቂቅ ስልጣኑ ሁሉን የፈጠረ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 4
በረቂቅ ጥበቡ ሁሉን የፈጠረ
በሰው እጅ ተገርፎ ሞቶ ተቀበረ
ሞተ ተቀበረ
ፍቅሩን የገለፀው ተወልዶ በስጋ （2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 5
እየሱስ ጌታ ነው አልፋና ኦሜጋ
አልፋና ኦሜጋ
በመስቀል ተሰቅሎ እንዲያ እየቃተተ （2）
አለምን ለማዳን የማይሞተው ሞተ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 6
የማይሞተው ሞተ
ከሞት ሊታደገን በመጣልን ፈጥኖ（2）
መስቀል አሸከሙት ውለታው ይህ ሆኖ
ውለታው ይህ ሆኖ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 7
መከራውን ሳስብ ሳስታውስ ቀኑን（2）
ይቆስላል ይደማል ልቤ በሃዘን
ልቤ በሃዘን
መች ለእራሱ ነበር ይህ ሁሉ መከራ（2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 8
መስቀል ተሸክሞ የወጣ ተራራ
የወጣ ተራራ
ሲያጎርሱት ''ሚናከስ ሰው ክፉ ነውና
እውሩም ቢያበራ ጎባጣን ቢያቀና

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 9
ጌታየን ሰቀሉት አይሁድ ጨከኑና
አይሁድ ጨከኑና
ምነው አያሳዝን የአይሁድ ክፋት （2）
የዝናቡን ጌታ ውሃ ሲነግፉት

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 10
ውሃ ሲነግፉት
በተንኮል በኃጢአት ቀሩ እንደሰከሩ （2）
ሙታን ከመቃብር ተነስተው ሲያስተምሩ
ተነስተው ሲያስተምሩ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 11
እናታችን ሔዋን ወዮ በይ አልቅሽ
የአንችን ህመም ታሞ ከሞት ሊያድንሽ
የህያዋን ጌታ ተሰቀለልሽ
ተሰቀለልሽ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 12
አየ ጉድ አየ ጉድ ዓለም የኋላሽ （2）
መድሃኒት ክርስቶስ በግፍ ሞተብሽ
በግፍ ሞተብሽ
በመስቀል ተሰቅሎ ስጋውን ሲቆርስ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 13
በችንካር ተወግቶ ደሙንም ሲያፈስ
ዋለች በመከራ ድንግል ስታለቅስ
እናት ስታለቅስ
ሰውነትሽ ራደ ሃዘን ከበበሽ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 14
ስቃይ መከራውም ዳግም ፀናብሽ
ተሰቅሎ ስታይው አንድ አምላክ ልጅሽ
አንድ አምላክ ልጅሽ
ቢፈስም እንባየ ሆኖ መንታ መንታ

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 15
መች ዋጋ ይሆናል ለአንዲቱ ጠብታ
ላለቀስሽው ለቅሶ ድንግል የዚያን ለታ
እናት የዚያን ለታ
ባለቀስሽው ለቅሶ በልጅሽ ህመም （2）

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)

VERSE 16
ከኃጥአት ነፃሁኝ ዳንኩኝ ከገሃነም
ዳንኩኝ ከገሃነም

CHORUS
በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'በጌተሰማኔ በአታክልቱ ቦታ (2)
ለኛ ሲል ጌታችን በአለም ተንገላታ
በአለም ተንገላታ
አዳምና ሔዋን ባጠፉት ጥፋት (2)
እኛም ነበረብን የዘለዓለም ሞት
የዘለዓለም ሞት
መስቀል ተሸክሞ ሲወጣ ተራራ (2)
ይገርፉት ነበረ ሁሉም በየተራ
ሁሉም በየተራ
ድንግል አልቻለችም እንባዋን ልትገታ （2）
እያየች በመስቀል ልጇ ሲንገላታ
ልጇ ሲንገላታ
በአምላክነቱ ሳይፈርድባቸው （2）
እንዲህ ሲል ፀለየ አባት ሆይ ማራቸው
አባት ሆይ ማራቸው
በረቂቅ ስልጣኑ ሁሉን የፈጠረ
በረቂቅ ጥበቡ ሁሉን የፈጠረ
በሰው እጅ ተገርፎ ሞቶ ተቀበረ
ሞተ ተቀበረ
ፍቅሩን የገለፀው ተወልዶ በስጋ （2）
እየሱስ ጌታ ነው አልፋና ኦሜጋ
አልፋና ኦሜጋ
በመስቀል ተሰቅሎ እንዲያ እየቃተተ （2）
አለምን ለማዳን የማይሞተው ሞተ
የማይሞተው ሞተ
ከሞት ሊታደገን በመጣልን ፈጥኖ（2）
መስቀል አሸከሙት ውለታው ይህ ሆኖ
ውለታው ይህ ሆኖ
መከራውን ሳስብ ሳስታውስ ቀኑን（2）
ይቆስላል ይደማል ልቤ በሃዘን
ልቤ በሃዘን
መች ለእራሱ ነበር ይህ ሁሉ መከራ（2）
መስቀል ተሸክሞ የወጣ ተራራ
የወጣ ተራራ
ሲያጎርሱት ''ሚናከስ ሰው ክፉ ነውና
እውሩም ቢያበራ ጎባጣን ቢያቀና
ጌታየን ሰቀሉት አይሁድ ጨከኑና
አይሁድ ጨከኑና
ምነው አያሳዝን የአይሁድ ክፋት （2）
የዝናቡን ጌታ ውሃ ሲነግፉት
ውሃ ሲነግፉት
በተንኮል በኃጢአት ቀሩ እንደሰከሩ （2）
ሙታን ከመቃብር ተነስተው ሲያስተምሩ
ተነስተው ሲያስተምሩ
እናታችን ሔዋን ወዮ በይ አልቅሽ
የአንችን ህመም ታሞ ከሞት ሊያድንሽ
የህያዋን ጌታ ተሰቀለልሽ
ተሰቀለልሽ
አየ ጉድ አየ ጉድ ዓለም የኋላሽ （2）
መድሃኒት ክርስቶስ በግፍ ሞተብሽ
በግፍ ሞተብሽ
በመስቀል ተሰቅሎ ስጋውን ሲቆርስ
በችንካር ተወግቶ ደሙንም ሲያፈስ
ዋለች በመከራ ድንግል ስታለቅስ
እናት ስታለቅስ
ሰውነትሽ ራደ ሃዘን ከበበሽ
ስቃይ መከራውም ዳግም ፀናብሽ
ተሰቅሎ ስታይው አንድ አምላክ ልጅሽ
አንድ አምላክ ልጅሽ
ቢፈስም እንባየ ሆኖ መንታ መንታ
መች ዋጋ ይሆናል ለአንዲቱ ጠብታ
ላለቀስሽው ለቅሶ ድንግል የዚያን ለታ
እናት የዚያን ለታ
ባለቀስሽው ለቅሶ በልጅሽ ህመም （2）
ከኃጥአት ነፃሁኝ ዳንኩኝ ከገሃነም
ዳንኩኝ ከገሃነም'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a17714c0-0aaa-4989-ac30-01e579b2b51f'::uuid, 'orthodox-begena-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-nay-yhuda-anbesa-bereket-tikue ("ይሁዳ ኣንበሳ# # ናይ ሕብረት# #")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b02f0729-3368-41a3-8f4a-8eb1db338960'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 1
Goyta sile zitensea
Ti''amnetna kab suru lemea
Sibኸtenasi keto aykonen
Tesfana''win fits’um ayqehamen

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 2
Az
Bikrstos''yu awetna
Lieli kunetna ts’eblel ilna
Tensae goyta adhinuna

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 3
Degim nihna wits’at hara ina
Az
"ell" nibel allulu
Sala ati genshel midhan koynu

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 4
Kisasina''win deninu
Degim silt’an nayti qubua koynu
Az
Goyta Iyesus''yu - kab diqdq ts’elmat

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 5
Goyta Iyesus''yu - ab laeli awet zihabena
Goyta Iyesus''yu - nay yuhuda anbesa mits’haf zigents’ele
Goyta Iyesus''yu - wuludu kinkono dimu zikefele
Niqanyelu - bimotu goyta nimotna siiru

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 6
Nizemru - siol bado koynu ts’elae hafiru
Neshebshbelu - bidem ati genshel lomi midhan koynu
Niallelu - ts’elmat teqent’it’u lomi birhan koynu

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 1
ጎይታ ስለ ዝተንሰአ
ቲ''አምነትና ካብ ሱሩ ለመዐ
ስብኸተናሲ ከቶ ኣይኮነን
ተስፋና''ውን ፍጹም ኣይቀሃመን

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 2
ኣዝ
ብክርስቶስ''ዩ ዓወትና
ልዕሊ ኩነትና ጸብለል ኢልና
ተንሳኤ ጎይታ ኣድሒኑና

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 3
ደጊም ንሕና ውጽኣት ሓራ ኢና
ኣዝ
"ዕልል" ንበል ዓልሉሉ
ሳላ አቲ ገንሸል ምድሓን ኮይኑ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 4
ክሳሲና''ውን ደኒኑ
ደጊም ስልጣን ናይቲ ቁቡአ ኮይኑ
ኣዝ
ጎይታ ኢየሱስ''ዩ - ካብ ድቅድቅ ጸልማት

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 5
ጎይታ ኢየሱስ''ዩ - ኣብ ላዕሊ ዓወት ዝሃበና
ጎይታ ኢየሱስ''ዩ - ናይ ዩሁዳ ኣንበሳ ምጽሓፍ ዝገንጸለ
ጎይታ ኢየሱስ''ዩ - ዉሉዱ ክንኮኖ ድሙ ዝከፈለ
ንቃንየሉ - ብሞቱ ጎይታ ንሞትና ስዒሩ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 6
ንዘምሩ - ሲኦል ባዶ ኮይኑ ጸላኤ ሓፊሩ
ነሸብሽበሉ - ብደም አቲ ገንሸል ሎሚ ምድሓን ኮይኑ
ንዓልለሉ - ጸልማት ተቀንጢጡ ሎሚ ብርሃን ኮይኑ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 1
ጎይታ ስለ ዝተንሰአ
ቲ''አምነትና ካብ ሱሩ ለመዐ
ስብኸተናሲ ከቶ ኣይኮነን
ተስፋና''ውን ፍጹም ኣይቀሃመን

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 2
ኣዝ
ብክርስቶስ''ዩ ዓወትና
ልዕሊ ኩነትና ጸብለል ኢልና
ተንሳኤ ጎይታ ኣድሒኑና

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 3
ደጊም ንሕና ውጽኣት ሓራ ኢና
ኣዝ
"ዕልል" ንበል ዓልሉሉ
ሳላ አቲ ገንሸል ምድሓን ኮይኑ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 4
ክሳሲና''ውን ደኒኑ
ደጊም ስልጣን ናይቲ ቁቡአ ኮይኑ
ኣዝ
ጎይታ ኢየሱስ''ዩ - ካብ ድቅድቅ ጸልማት

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 5
ጎይታ ኢየሱስ''ዩ - ኣብ ላዕሊ ዓወት ዝሃበና
ጎይታ ኢየሱስ''ዩ - ናይ ዩሁዳ ኣንበሳ ምጽሓፍ ዝገንጸለ
ጎይታ ኢየሱስ''ዩ - ዉሉዱ ክንኮኖ ድሙ ዝከፈለ
ንቃንየሉ - ብሞቱ ጎይታ ንሞትና ስዒሩ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 6
ንዘምሩ - ሲኦል ባዶ ኮይኑ ጸላኤ ሓፊሩ
ነሸብሽበሉ - ብደም አቲ ገንሸል ሎሚ ምድሓን ኮይኑ
ንዓልለሉ - ጸልማት ተቀንጢጡ ሎሚ ብርሃን ኮይኑ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2' THEN lyrics_amharic 
          ELSE 'CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 1
ጎይታ ስለ ዝተንሰአ
ቲ''አምነትና ካብ ሱሩ ለመዐ
ስብኸተናሲ ከቶ ኣይኮነን
ተስፋና''ውን ፍጹም ኣይቀሃመን

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 2
ኣዝ
ብክርስቶስ''ዩ ዓወትና
ልዕሊ ኩነትና ጸብለል ኢልና
ተንሳኤ ጎይታ ኣድሒኑና

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 3
ደጊም ንሕና ውጽኣት ሓራ ኢና
ኣዝ
"ዕልል" ንበል ዓልሉሉ
ሳላ አቲ ገንሸል ምድሓን ኮይኑ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 4
ክሳሲና''ውን ደኒኑ
ደጊም ስልጣን ናይቲ ቁቡአ ኮይኑ
ኣዝ
ጎይታ ኢየሱስ''ዩ - ካብ ድቅድቅ ጸልማት

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 5
ጎይታ ኢየሱስ''ዩ - ኣብ ላዕሊ ዓወት ዝሃበና
ጎይታ ኢየሱስ''ዩ - ናይ ዩሁዳ ኣንበሳ ምጽሓፍ ዝገንጸለ
ጎይታ ኢየሱስ''ዩ - ዉሉዱ ክንኮኖ ድሙ ዝከፈለ
ንቃንየሉ - ብሞቱ ጎይታ ንሞትና ስዒሩ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 6
ንዘምሩ - ሲኦል ባዶ ኮይኑ ጸላኤ ሓፊሩ
ነሸብሽበሉ - ብደም አቲ ገንሸል ሎሚ ምድሓን ኮይኑ
ንዓልለሉ - ጸልማት ተቀንጢጡ ሎሚ ብርሃን ኮይኑ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2' 
        END,
        lyrics_transliteration = 'CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 1
Goyta sile zitensea
Ti''amnetna kab suru lemea
Sibኸtenasi keto aykonen
Tesfana''win fits’um ayqehamen

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 2
Az
Bikrstos''yu awetna
Lieli kunetna ts’eblel ilna
Tensae goyta adhinuna

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 3
Degim nihna wits’at hara ina
Az
"ell" nibel allulu
Sala ati genshel midhan koynu

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 4
Kisasina''win deninu
Degim silt’an nayti qubua koynu
Az
Goyta Iyesus''yu - kab diqdq ts’elmat

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 5
Goyta Iyesus''yu - ab laeli awet zihabena
Goyta Iyesus''yu - nay yuhuda anbesa mits’haf zigents’ele
Goyta Iyesus''yu - wuludu kinkono dimu zikefele
Niqanyelu - bimotu goyta nimotna siiru

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2

VERSE 6
Nizemru - siol bado koynu ts’elae hafiru
Neshebshbelu - bidem ati genshel lomi midhan koynu
Niallelu - ts’elmat teqent’it’u lomi birhan koynu

CHORUS
Az: mot biawet tewaht’e
Bitnsae goyta kulu telewet’e
(o hat’yat awetka abey alo
O ts’elai bilhኻ temenit’lu''lo)2',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b02f0729-3368-41a3-8f4a-8eb1db338960'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 1
ጎይታ ስለ ዝተንሰአ
ቲ''አምነትና ካብ ሱሩ ለመዐ
ስብኸተናሲ ከቶ ኣይኮነን
ተስፋና''ውን ፍጹም ኣይቀሃመን

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 2
ኣዝ
ብክርስቶስ''ዩ ዓወትና
ልዕሊ ኩነትና ጸብለል ኢልና
ተንሳኤ ጎይታ ኣድሒኑና

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 3
ደጊም ንሕና ውጽኣት ሓራ ኢና
ኣዝ
"ዕልል" ንበል ዓልሉሉ
ሳላ አቲ ገንሸል ምድሓን ኮይኑ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 4
ክሳሲና''ውን ደኒኑ
ደጊም ስልጣን ናይቲ ቁቡአ ኮይኑ
ኣዝ
ጎይታ ኢየሱስ''ዩ - ካብ ድቅድቅ ጸልማት

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 5
ጎይታ ኢየሱስ''ዩ - ኣብ ላዕሊ ዓወት ዝሃበና
ጎይታ ኢየሱስ''ዩ - ናይ ዩሁዳ ኣንበሳ ምጽሓፍ ዝገንጸለ
ጎይታ ኢየሱስ''ዩ - ዉሉዱ ክንኮኖ ድሙ ዝከፈለ
ንቃንየሉ - ብሞቱ ጎይታ ንሞትና ስዒሩ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2

VERSE 6
ንዘምሩ - ሲኦል ባዶ ኮይኑ ጸላኤ ሓፊሩ
ነሸብሽበሉ - ብደም አቲ ገንሸል ሎሚ ምድሓን ኮይኑ
ንዓልለሉ - ጸልማት ተቀንጢጡ ሎሚ ብርሃን ኮይኑ

CHORUS
ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኣዝ፥ ሞት ብዓወት ተዋሕጠ
ብትንሳኤ ጎይታ ኩሉ ተለወጠ
(ኦ ሓጥያት ዓወትካ ኣበይ ኣሎ
ኦ ጸላኢ ብልሕኻ ተመኒጥሉ''ሎ)2
ጎይታ ስለ ዝተንሰአ
ቲ''አምነትና ካብ ሱሩ ለመዐ
ስብኸተናሲ ከቶ ኣይኮነን
ተስፋና''ውን ፍጹም ኣይቀሃመን
________ኣዝ___________
ብክርስቶስ''ዩ ዓወትና
ልዕሊ ኩነትና ጸብለል ኢልና
ተንሳኤ ጎይታ ኣድሒኑና
ደጊም ንሕና ውጽኣት ሓራ ኢና
_________ኣዝ___________
"ዕልል" ንበል ዓልሉሉ
ሳላ አቲ ገንሸል ምድሓን ኮይኑ
ክሳሲና''ውን ደኒኑ
ደጊም ስልጣን ናይቲ ቁቡአ ኮይኑ
__________ኣዝ______________
ጎይታ ኢየሱስ''ዩ - ካብ ድቅድቅ ጸልማት
ጎይታ ኢየሱስ''ዩ - ኣብ ላዕሊ ዓወት ዝሃበና
ጎይታ ኢየሱስ''ዩ - ናይ ዩሁዳ ኣንበሳ ምጽሓፍ ዝገንጸለ
ጎይታ ኢየሱስ''ዩ - ዉሉዱ ክንኮኖ ድሙ ዝከፈለ
ንቃንየሉ - ብሞቱ ጎይታ ንሞትና ስዒሩ
ንዘምሩ - ሲኦል ባዶ ኮይኑ ጸላኤ ሓፊሩ
ነሸብሽበሉ - ብደም አቲ ገንሸል ሎሚ ምድሓን ኮይኑ
ንዓልለሉ - ጸልማት ተቀንጢጡ ሎሚ ብርሃን ኮይኑ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b02f0729-3368-41a3-8f4a-8eb1db338960'::uuid, 'eritrean-orthodox-tewahdo-mezmur-nay-yhuda-anbesa-bereket-tikue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrea-ortodox-tewahdo-mezmur ("ኣብዚ ቦታ ስደት # ዘመርቲ ,ኣቤል,ሳንድሮ,ዩኤል,ራህዋ,ሄርሜላ, ቅሳነት")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '186aad70-c8de-45c8-8f78-110359af2601'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 1
Libnadeኾn''yu kabaኻ rihiqu
Weys lisana''yu misgana beqiqu
Yehlifka hibkana nihsem mekera
Kingfe bealem bimeret bebahra

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 2
Ez,,,,,,,,,,,
Zeyrea qanza libna zits’oro
Kabaኻ halifna yeblnan ninegro
Wala bifqadna nibeten nizero

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 3
Lomis yiaklena sidetna ahts’ro
Ez,,,,,,,,,,,
Kemtiekwa esrael70seb weridom
Adom zitemelsu bezihom rebihom

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 4
Abzihka arbihka milesena
Niadi
Ata rihruh abo nay semay weladi
Ez,,,,,,,,,,,,,

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 5
Libnadoኾ''yu kabaኻ rihiqu
Weys lisana''yu misgana beqiqu
Yehlifka hibkana nihsem mekera
Kingfae bealem bimeret bibahra

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 6
Ez,,,,,,,,,,,,

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 1
ልብናደኾን''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፍዕ በዓለም ብመሬት በባሕራ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 2
እዝ,,,,,,,,,,,
ዘይረአ ቃንዛ ልብና ዝፆሮ
ካባኻ ሓሊፍና የብልናን ንነግሮ
ዋላ ብፍቃድና ንበተን ንዘሮ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 3
ሎሚስ ይኣክለና ስደትና ኣሕፅሮ
እዝ,,,,,,,,,,,
ከምቲእኳ እስራኤል70ሰብ ወሪዶም
ዓዶም ዝተመልሱ በዚሖም ረቢሖም

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 4
ኣብዚሕካ ኣርቢሕካ ምለሰና
ንዓዲ
ኣታ ርህሩህ ኣቦ ናይ ሰማይ ወላዲ
እዝ,,,,,,,,,,,,,

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 5
ልብናዶኾ''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፋዕ በዓለም ብመሬት ብባሕራ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 6
እዝ,,,,,,,,,,,,

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 1
ልብናደኾን''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፍዕ በዓለም ብመሬት በባሕራ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 2
እዝ,,,,,,,,,,,
ዘይረአ ቃንዛ ልብና ዝፆሮ
ካባኻ ሓሊፍና የብልናን ንነግሮ
ዋላ ብፍቃድና ንበተን ንዘሮ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 3
ሎሚስ ይኣክለና ስደትና ኣሕፅሮ
እዝ,,,,,,,,,,,
ከምቲእኳ እስራኤል70ሰብ ወሪዶም
ዓዶም ዝተመልሱ በዚሖም ረቢሖም

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 4
ኣብዚሕካ ኣርቢሕካ ምለሰና
ንዓዲ
ኣታ ርህሩህ ኣቦ ናይ ሰማይ ወላዲ
እዝ,,,,,,,,,,,,,

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 5
ልብናዶኾ''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፋዕ በዓለም ብመሬት ብባሕራ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 6
እዝ,,,,,,,,,,,,

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)' THEN lyrics_amharic 
          ELSE 'CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 1
ልብናደኾን''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፍዕ በዓለም ብመሬት በባሕራ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 2
እዝ,,,,,,,,,,,
ዘይረአ ቃንዛ ልብና ዝፆሮ
ካባኻ ሓሊፍና የብልናን ንነግሮ
ዋላ ብፍቃድና ንበተን ንዘሮ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 3
ሎሚስ ይኣክለና ስደትና ኣሕፅሮ
እዝ,,,,,,,,,,,
ከምቲእኳ እስራኤል70ሰብ ወሪዶም
ዓዶም ዝተመልሱ በዚሖም ረቢሖም

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 4
ኣብዚሕካ ኣርቢሕካ ምለሰና
ንዓዲ
ኣታ ርህሩህ ኣቦ ናይ ሰማይ ወላዲ
እዝ,,,,,,,,,,,,,

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 5
ልብናዶኾ''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፋዕ በዓለም ብመሬት ብባሕራ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 6
እዝ,,,,,,,,,,,,

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)' 
        END,
        lyrics_transliteration = 'CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 1
Libnadeኾn''yu kabaኻ rihiqu
Weys lisana''yu misgana beqiqu
Yehlifka hibkana nihsem mekera
Kingfe bealem bimeret bebahra

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 2
Ez,,,,,,,,,,,
Zeyrea qanza libna zits’oro
Kabaኻ halifna yeblnan ninegro
Wala bifqadna nibeten nizero

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 3
Lomis yiaklena sidetna ahts’ro
Ez,,,,,,,,,,,
Kemtiekwa esrael70seb weridom
Adom zitemelsu bezihom rebihom

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 4
Abzihka arbihka milesena
Niadi
Ata rihruh abo nay semay weladi
Ez,,,,,,,,,,,,,

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 5
Libnadoኾ''yu kabaኻ rihiqu
Weys lisana''yu misgana beqiqu
Yehlifka hibkana nihsem mekera
Kingfae bealem bimeret bibahra

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)

VERSE 6
Ez,,,,,,,,,,,,

CHORUS
Kindey ina kinebr abzi bota sidet
20dyu30weys50amet
Nigerena goytay biqdusan nebyat
Nesha atina kinet’fo hat’yat (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '186aad70-c8de-45c8-8f78-110359af2601'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 1
ልብናደኾን''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፍዕ በዓለም ብመሬት በባሕራ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 2
እዝ,,,,,,,,,,,
ዘይረአ ቃንዛ ልብና ዝፆሮ
ካባኻ ሓሊፍና የብልናን ንነግሮ
ዋላ ብፍቃድና ንበተን ንዘሮ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 3
ሎሚስ ይኣክለና ስደትና ኣሕፅሮ
እዝ,,,,,,,,,,,
ከምቲእኳ እስራኤል70ሰብ ወሪዶም
ዓዶም ዝተመልሱ በዚሖም ረቢሖም

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 4
ኣብዚሕካ ኣርቢሕካ ምለሰና
ንዓዲ
ኣታ ርህሩህ ኣቦ ናይ ሰማይ ወላዲ
እዝ,,,,,,,,,,,,,

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 5
ልብናዶኾ''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፋዕ በዓለም ብመሬት ብባሕራ

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)

VERSE 6
እዝ,,,,,,,,,,,,

CHORUS
ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ክንደይ ኢና ክነብር ኣብዚ ቦታ ስደት
20ድዩ30ወይስ50ዓመት
ንገረና ጎይታይ ብቅዱሳን ነብያት
ነስሓ ኣቲና ክነጥፍኦ ሓጥያት(2)
ልብናደኾን''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፍዕ በዓለም ብመሬት በባሕራ
እዝ,,,,,,,,,,,
ዘይረአ ቃንዛ ልብና ዝፆሮ
ካባኻ ሓሊፍና የብልናን ንነግሮ
ዋላ ብፍቃድና ንበተን ንዘሮ
ሎሚስ ይኣክለና ስደትና ኣሕፅሮ
እዝ,,,,,,,,,,,
ከምቲእኳ እስራኤል70ሰብ ወሪዶም
ዓዶም ዝተመልሱ በዚሖም ረቢሖም
ኣብዚሕካ ኣርቢሕካ ምለሰና
ንዓዲ
ኣታ ርህሩህ ኣቦ ናይ ሰማይ ወላዲ
እዝ,,,,,,,,,,,,,
ልብናዶኾ''ዩ ካባኻ ሪሒቁ
ወይስ ልሳና''ዩ ምስጋና በቂቁ
የሕሊፍካ ሂብካና ንሕሰም መከራ
ክንግፋዕ በዓለም ብመሬት ብባሕራ
እዝ,,,,,,,,,,,,'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '186aad70-c8de-45c8-8f78-110359af2601'::uuid, 'eritrea-ortodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enide-egiziabiher-yale ("እንደ እግዚአብሔር ያለ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a01ee9e6-ef31-4dd0-934f-29ee124d4bed'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 1
Feron wedeqe alseram timkhtu
Dekamochum ts’entew teramedu
Haylegnochum yiኸw tewaredu
A.z //

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 2
Yeiyariko qit’r yemaydeferew
Yiኽw ferarese yesew ej saynekaw
Haylegnochum biberetatubn
Endnalen beersu tedegfen

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 3
A.z //
Yetewerewerew yet’elatachn t’or
Meda lay wedeqe gasha hono Egziabher
LeSilassie yidres misganachn

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 4
Teshenefe adagn t’elatachn
A.z //
Bahr lay siramed moges alew ersu
Begrmaw sinesa ts’et’ yilal nefasu

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 5
Yedngl lij egna yemnamelkew
Kehali new yelem yemisanew

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 1
ፈርኦን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ፀንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ
አ.ዝ //

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኽው ፈራረሰ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንድናለን በእርሱ ተደግፈን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 3
አ.ዝ //
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 4
ተሸነፈ አዳኝ ጠላታችን
አ.ዝ //
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 5
የድንግል ልጅ እኛ የምናመልከው
ከሃሊ ነው የለም የሚሳነው

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 1
ፈርኦን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ፀንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ
አ.ዝ //

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኽው ፈራረሰ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንድናለን በእርሱ ተደግፈን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 3
አ.ዝ //
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 4
ተሸነፈ አዳኝ ጠላታችን
አ.ዝ //
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 5
የድንግል ልጅ እኛ የምናመልከው
ከሃሊ ነው የለም የሚሳነው

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ' THEN lyrics_amharic 
          ELSE 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 1
ፈርኦን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ፀንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ
አ.ዝ //

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኽው ፈራረሰ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንድናለን በእርሱ ተደግፈን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 3
አ.ዝ //
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 4
ተሸነፈ አዳኝ ጠላታችን
አ.ዝ //
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 5
የድንግል ልጅ እኛ የምናመልከው
ከሃሊ ነው የለም የሚሳነው

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ' 
        END,
        lyrics_transliteration = 'CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 1
Feron wedeqe alseram timkhtu
Dekamochum ts’entew teramedu
Haylegnochum yiኸw tewaredu
A.z //

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 2
Yeiyariko qit’r yemaydeferew
Yiኽw ferarese yesew ej saynekaw
Haylegnochum biberetatubn
Endnalen beersu tedegfen

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 3
A.z //
Yetewerewerew yet’elatachn t’or
Meda lay wedeqe gasha hono Egziabher
LeSilassie yidres misganachn

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 4
Teshenefe adagn t’elatachn
A.z //
Bahr lay siramed moges alew ersu
Begrmaw sinesa ts’et’ yilal nefasu

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu

VERSE 5
Yedngl lij egna yemnamelkew
Kehali new yelem yemisanew

CHORUS
Ende Egziabher yale manm yelemna (2)
Ell belu qumu lemsgana (2)
A.z //
Bahr tekefele eskitay meretu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a01ee9e6-ef31-4dd0-934f-29ee124d4bed'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 1
ፈርኦን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ፀንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ
አ.ዝ //

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኽው ፈራረሰ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንድናለን በእርሱ ተደግፈን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 3
አ.ዝ //
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 4
ተሸነፈ አዳኝ ጠላታችን
አ.ዝ //
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ

VERSE 5
የድንግል ልጅ እኛ የምናመልከው
ከሃሊ ነው የለም የሚሳነው

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ //
ባሕር ተከፈለ እስኪታይ መሬቱ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እንደ እግዚአብሔር ያለ ማንም የለምና/2/
እልል በሉ ቁሙ ለምስጋና/2/
አ.ዝ---------------------//
ባሕር ተከፈለ እስኪታይ መሬቱ
ፈርኦን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ፀንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ
አ.ዝ---------------------//
የኢያሪኮ ቅጥር የማይደፈረው
ይኽው ፈራረሰ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንድናለን በእርሱ ተደግፈን
አ.ዝ---------------------//
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን
ተሸነፈ አዳኝ ጠላታችን
አ.ዝ---------------------//
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ
የድንግል ልጅ እኛ የምናመልከው
ከሃሊ ነው የለም የሚሳነው'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a01ee9e6-ef31-4dd0-934f-29ee124d4bed'::uuid, 'enide-egiziabiher-yale', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- addis-amet-mezmur ("ተለቀቀ ሆ ብለን መጣን የአዲስ ዐመት ዝማሬ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7edd14f1-ba77-4afb-8eed-9d615f0f7a5c'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 1
Kidus yohens timet’alachhu des des yibelachhu (2)
Ho bilen met’an ho bilen (2)
Getoch alu bilen
Ho bilen met’an ho bilen (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 2
Emete alu bilen
Ho bilen met’an ho bilen (2)
Zemen met’a
Yedeferese Halleluya wenz sit’era Halleluya

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 3
Bemeskerem wer Halleluya siyabb azmera Halleluya
Yerekese lib Halleluya yadefe libs
T’ye met’ahugn Halleluya endtades
Medhanealem ኧኸ

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 4
Cher mehari neh mimeslh yelem
Dingil hoy ኧኸ
Merkebachn nesh tashagrinalesh
Lich’ama qalun Halleluya lebshe wengel Halleluya

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 5
Bariya lihunh Halleluya lijh balbal Halleluya
Maqen qedje Halleluya kaba liderb Halleluya
Lenes yishalal Halleluya wedeante meqreb Halleluya
Adonay berekethn lak kesemay (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 6
Enqut’at’ash ahunm degmo degmo yamt’ash (2)
Tinantn alefku honeh gashaye
Negeyen siraw cher eregnaye
Nisha honogn gets’e bereket

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 7
Zemene yimer lashebrqbet
Medhanealem
Cher mehari neh mimeslh yelem
Dingil hoy

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 8
Merkebachn nesh tashagriyalesh
Adey yebr muday kolel bey
ኧኸ adey yeamlak enat Dingil ney
Maregn ኧኸ

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 9
Wede meqdesh
T’erte''h asgebagn
Yeljnet ኧኸ
Metelalefen atasbbgn

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 10
Bilugnm ኧኸ
Amshto met’a
Kebeth alwt’a
Kifelegn ኧኸ

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 11
Degu Getaye
Aynes wagaye
Yichin amet ኧኸ
Antew tewegn

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 12
Libh yizenlgn
(ete abebash ete abebaye aye ete abebaye )
Lebcha
Yichin amet tewegn Getaye - tewegn yichin amet

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 13
Firen afrche endabbbet
Tewegn yichin amet
Tewegn yichin amet (2)
Wet’che alqr

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 14
Beth melsegn
Tewegn yichin amet
Lensha edmen legsegn
Tewegn yichn amet

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 15
Bet gwadayenm lastekaklew
Tewegn yichn amet
Hizqyasnm endmeslew
Tewegn yichn amet (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 16
Bengus qegn yemtqomi
Maryam yene emebet
Silets’dqe hule qidemi
Maryam yene Emebete

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 17
Marat bilesh asmrignna
Liqegnlsh beadis misgana
Maryam yene emebet (2)
Dingil Maryam ኧኸ

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 18
Yemhret- zinab
Menfesawit- merkeb
Yebrhan - dinkwan
Tesfa nesh - lehat’an (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 19
Lemesqel leta ledemeraw
Beadisu amet bel maregn biye
Liqot’er met’ahugn lijh tebye
Bealem menor alt’eqemegnm

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 20
Kets’ets’et beqer alterefegnm
Yeset’eኸgnn mushrnet libs
Asadfeyalehu behat’iat merkes
Yet’mqet dirb beftaye yelem

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 21
Mebrat zeyte altezegajem
Yetekafelkut alqwal bemergem
Abrogn yat’efaw wedajem yelem
Ante gin aleh lezelealem (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 22
Kebrew yiqoyon kebrew
Yealemn hat’yat niqew
Honachhu libam mushra
Birhanachhu endiyabera

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 23
Wede betu gesgsachhu
Zeyt mebratun yizachhu
Kebrew yiqoyon kebrew
Kebren enqoy kebren

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 24
Bets’om bets’elot ts’enten
Asratun leersu awt’ten
Zikr miskr newna
Kebren enqoy bet’ena

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 1
ቅዱስ ዮሐንስ ትመጣላችሁ ደስ ደስ ይበላችሁ(2)
ሆ ብለን መጣን ሆ ብለን(፪)
ጌቶች አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 2
እሜቴ አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)
ዘመን መጣ
የደፈረሰ ሃሌ ሉያ ወንዝ ሲጠራ ሃሌ ሉያ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 3
በመስከረም ወር ሃሌ ሉያ ሲያብብ አዝመራ ሃሌ ሉያ
የረከሠ ልብ ሃሌ ሉያ ያደፈ ልብስ
ጥዬ መጣሁኝ ሃሌ ሉያ እንድታደስ
መድኃኔዓለም ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 4
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ ኧኸ
መርከባችን ነሽ ታሻግሪናለሽ
ልጫማ ቃሉን ሃሌ ሉያ ለብሼ ወንጌል ሃሌ ሉያ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 5
ባሪያ ልሁንህ ሃሌ ሉያ ልጅህ ባልባል ሃሌ ሉያ
ማቄን ቀድጄ ሃሌ ሉያ ካባ ልደርብ ሃሌ ሉያ
ለኔስ ይሻላል ሃሌ ሉያ ወደአንተ መቅረብ ሃሌ ሉያ
አዶናይ በረከትህን ላክ ከሠማይ (2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 6
እንቁጣጣሽ አሁንም ደግሞ ደግሞ ያምጣሽ (2)
ትናንትን አለፍኩ ሆነህ ጋሻዬ
ነገዬን ስራው ቸር እረኛዬ
ንስሃ ሆኖኝ ገፀ በረከት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 7
ዘመኔ ይመር ላሸብርቅበት
መድኃኔዓለም
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 8
መርከባችን ነሽ ታሻግሪያለሽ
አደይ የብር ሙዳይ ኮለል በይ
ኧኸ ዐደይ የአምላክ እናት ድንግል ነይ
ማረኝ ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 9
ወደ መቅደስህ
ጠርተ''ህ አስገባኝ
የልጅነት ኧኸ
መተላለፌን አታስብብኝ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 10
ቢሉኝም ኧኸ
አምሽቶ መጣ
ከቤትህ አልውጣ
ክፈለኝ ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 11
ደጉ ጌታዬ
አይነስ ዋጋዬ
ይቺን አመት ኧኸ
አንተው ተወኝ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 12
ልብህ ይዘንልኝ
(እቴ አበባሽ እቴ አበባዬ አዬ እቴ አበባዬ )
ለብቻ
ይቺን አመት ተወኝ ጌታዬ - ተወኝ ይቺን ዓመት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 13
ፍሬን አፍርቼ እንዳብብበት
ተወኝ ይቺን አመት
ተወኝ ይቺን አመት (2)
ወጥቼ አልቅር

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 14
ቤትህ መልሰኝ
ተወኝ ይቺን ዓመት
ለንስሃ ዕድሜን ለግሠኝ
ተወኝ ይችን ዓመት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 15
ቤት ጓዳዬንም ላስተካክለው
ተወኝ ይችን ዓመት
ህዝቅያስንም እንድመስለው
ተወኝ ይችን ዓመት(2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 16
በንጉስ ቀኝ የምትቆሚ
ማርያም የኔ እመቤት
ስለፅድቄ ሁሌ ቅደሚ
ማርያም የኔ እመቤቴ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 17
ማራት ብለሽ አስምሪኝና
ልቀኝልሽ በአዲስ ምስጋና
ማርያም የኔ እመቤት(2)
ድንግል ማርያም ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 18
የምህረት- ዝናብ
መንፈሣዊት- መርከብ
የብርሃን - ድንኳን
ተስፋ ነሽ - ለሃጥዓን(2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 19
ለመስቀል ለታ ለደመራው
በአዲሱ ዓመት በል ማረኝ ብዬ
ልቆጠር መጣሁኝ ልጅህ ተብዬ
በአለም መኖር አልጠቀመኝም

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 20
ከፀፀት በቀር አልተረፈኝም
የሠጠኸኝን ሙሽርነት ልብስ
አሣድፌያለሁ በኃጢዓት መርከስ
የጥምቀት ድርብ በፍታዬ የለም

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 21
መብራት ዘይቴ አልተዘጋጀም
የተካፈልኩት አልቋል በመርገም
አብሮኝ ያጠፋው ወዳጄም የለም
አንተ ግን አለህ ለዘለዓለም (2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 22
ከብረው ይቆዮን ከብረው
የአለምን ሃጥያት ንቀው
ሆናችሁ ልባም ሙሽራ
ብርሃናችሁ እንዲያበራ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 23
ወደ ቤቱ ገስግሣችሁ
ዘይት መብራቱን ይዛችሁ
ከብረው ይቆዮን ከብረው
ከብረን እንቆይ ከብረን

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 24
በፆም በፀሎት ፀንተን
አስራቱን ለእርሱ አውጥተን
ዝክር ምስክር ነውና
ከብረን እንቆይ በጤና

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 1
ቅዱስ ዮሐንስ ትመጣላችሁ ደስ ደስ ይበላችሁ(2)
ሆ ብለን መጣን ሆ ብለን(፪)
ጌቶች አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 2
እሜቴ አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)
ዘመን መጣ
የደፈረሰ ሃሌ ሉያ ወንዝ ሲጠራ ሃሌ ሉያ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 3
በመስከረም ወር ሃሌ ሉያ ሲያብብ አዝመራ ሃሌ ሉያ
የረከሠ ልብ ሃሌ ሉያ ያደፈ ልብስ
ጥዬ መጣሁኝ ሃሌ ሉያ እንድታደስ
መድኃኔዓለም ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 4
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ ኧኸ
መርከባችን ነሽ ታሻግሪናለሽ
ልጫማ ቃሉን ሃሌ ሉያ ለብሼ ወንጌል ሃሌ ሉያ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 5
ባሪያ ልሁንህ ሃሌ ሉያ ልጅህ ባልባል ሃሌ ሉያ
ማቄን ቀድጄ ሃሌ ሉያ ካባ ልደርብ ሃሌ ሉያ
ለኔስ ይሻላል ሃሌ ሉያ ወደአንተ መቅረብ ሃሌ ሉያ
አዶናይ በረከትህን ላክ ከሠማይ (2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 6
እንቁጣጣሽ አሁንም ደግሞ ደግሞ ያምጣሽ (2)
ትናንትን አለፍኩ ሆነህ ጋሻዬ
ነገዬን ስራው ቸር እረኛዬ
ንስሃ ሆኖኝ ገፀ በረከት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 7
ዘመኔ ይመር ላሸብርቅበት
መድኃኔዓለም
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 8
መርከባችን ነሽ ታሻግሪያለሽ
አደይ የብር ሙዳይ ኮለል በይ
ኧኸ ዐደይ የአምላክ እናት ድንግል ነይ
ማረኝ ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 9
ወደ መቅደስህ
ጠርተ''ህ አስገባኝ
የልጅነት ኧኸ
መተላለፌን አታስብብኝ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 10
ቢሉኝም ኧኸ
አምሽቶ መጣ
ከቤትህ አልውጣ
ክፈለኝ ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 11
ደጉ ጌታዬ
አይነስ ዋጋዬ
ይቺን አመት ኧኸ
አንተው ተወኝ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 12
ልብህ ይዘንልኝ
(እቴ አበባሽ እቴ አበባዬ አዬ እቴ አበባዬ )
ለብቻ
ይቺን አመት ተወኝ ጌታዬ - ተወኝ ይቺን ዓመት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 13
ፍሬን አፍርቼ እንዳብብበት
ተወኝ ይቺን አመት
ተወኝ ይቺን አመት (2)
ወጥቼ አልቅር

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 14
ቤትህ መልሰኝ
ተወኝ ይቺን ዓመት
ለንስሃ ዕድሜን ለግሠኝ
ተወኝ ይችን ዓመት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 15
ቤት ጓዳዬንም ላስተካክለው
ተወኝ ይችን ዓመት
ህዝቅያስንም እንድመስለው
ተወኝ ይችን ዓመት(2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 16
በንጉስ ቀኝ የምትቆሚ
ማርያም የኔ እመቤት
ስለፅድቄ ሁሌ ቅደሚ
ማርያም የኔ እመቤቴ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 17
ማራት ብለሽ አስምሪኝና
ልቀኝልሽ በአዲስ ምስጋና
ማርያም የኔ እመቤት(2)
ድንግል ማርያም ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 18
የምህረት- ዝናብ
መንፈሣዊት- መርከብ
የብርሃን - ድንኳን
ተስፋ ነሽ - ለሃጥዓን(2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 19
ለመስቀል ለታ ለደመራው
በአዲሱ ዓመት በል ማረኝ ብዬ
ልቆጠር መጣሁኝ ልጅህ ተብዬ
በአለም መኖር አልጠቀመኝም

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 20
ከፀፀት በቀር አልተረፈኝም
የሠጠኸኝን ሙሽርነት ልብስ
አሣድፌያለሁ በኃጢዓት መርከስ
የጥምቀት ድርብ በፍታዬ የለም

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 21
መብራት ዘይቴ አልተዘጋጀም
የተካፈልኩት አልቋል በመርገም
አብሮኝ ያጠፋው ወዳጄም የለም
አንተ ግን አለህ ለዘለዓለም (2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 22
ከብረው ይቆዮን ከብረው
የአለምን ሃጥያት ንቀው
ሆናችሁ ልባም ሙሽራ
ብርሃናችሁ እንዲያበራ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 23
ወደ ቤቱ ገስግሣችሁ
ዘይት መብራቱን ይዛችሁ
ከብረው ይቆዮን ከብረው
ከብረን እንቆይ ከብረን

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 24
በፆም በፀሎት ፀንተን
አስራቱን ለእርሱ አውጥተን
ዝክር ምስክር ነውና
ከብረን እንቆይ በጤና

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ' THEN lyrics_amharic 
          ELSE 'CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 1
ቅዱስ ዮሐንስ ትመጣላችሁ ደስ ደስ ይበላችሁ(2)
ሆ ብለን መጣን ሆ ብለን(፪)
ጌቶች አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 2
እሜቴ አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)
ዘመን መጣ
የደፈረሰ ሃሌ ሉያ ወንዝ ሲጠራ ሃሌ ሉያ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 3
በመስከረም ወር ሃሌ ሉያ ሲያብብ አዝመራ ሃሌ ሉያ
የረከሠ ልብ ሃሌ ሉያ ያደፈ ልብስ
ጥዬ መጣሁኝ ሃሌ ሉያ እንድታደስ
መድኃኔዓለም ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 4
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ ኧኸ
መርከባችን ነሽ ታሻግሪናለሽ
ልጫማ ቃሉን ሃሌ ሉያ ለብሼ ወንጌል ሃሌ ሉያ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 5
ባሪያ ልሁንህ ሃሌ ሉያ ልጅህ ባልባል ሃሌ ሉያ
ማቄን ቀድጄ ሃሌ ሉያ ካባ ልደርብ ሃሌ ሉያ
ለኔስ ይሻላል ሃሌ ሉያ ወደአንተ መቅረብ ሃሌ ሉያ
አዶናይ በረከትህን ላክ ከሠማይ (2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 6
እንቁጣጣሽ አሁንም ደግሞ ደግሞ ያምጣሽ (2)
ትናንትን አለፍኩ ሆነህ ጋሻዬ
ነገዬን ስራው ቸር እረኛዬ
ንስሃ ሆኖኝ ገፀ በረከት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 7
ዘመኔ ይመር ላሸብርቅበት
መድኃኔዓለም
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 8
መርከባችን ነሽ ታሻግሪያለሽ
አደይ የብር ሙዳይ ኮለል በይ
ኧኸ ዐደይ የአምላክ እናት ድንግል ነይ
ማረኝ ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 9
ወደ መቅደስህ
ጠርተ''ህ አስገባኝ
የልጅነት ኧኸ
መተላለፌን አታስብብኝ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 10
ቢሉኝም ኧኸ
አምሽቶ መጣ
ከቤትህ አልውጣ
ክፈለኝ ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 11
ደጉ ጌታዬ
አይነስ ዋጋዬ
ይቺን አመት ኧኸ
አንተው ተወኝ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 12
ልብህ ይዘንልኝ
(እቴ አበባሽ እቴ አበባዬ አዬ እቴ አበባዬ )
ለብቻ
ይቺን አመት ተወኝ ጌታዬ - ተወኝ ይቺን ዓመት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 13
ፍሬን አፍርቼ እንዳብብበት
ተወኝ ይቺን አመት
ተወኝ ይቺን አመት (2)
ወጥቼ አልቅር

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 14
ቤትህ መልሰኝ
ተወኝ ይቺን ዓመት
ለንስሃ ዕድሜን ለግሠኝ
ተወኝ ይችን ዓመት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 15
ቤት ጓዳዬንም ላስተካክለው
ተወኝ ይችን ዓመት
ህዝቅያስንም እንድመስለው
ተወኝ ይችን ዓመት(2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 16
በንጉስ ቀኝ የምትቆሚ
ማርያም የኔ እመቤት
ስለፅድቄ ሁሌ ቅደሚ
ማርያም የኔ እመቤቴ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 17
ማራት ብለሽ አስምሪኝና
ልቀኝልሽ በአዲስ ምስጋና
ማርያም የኔ እመቤት(2)
ድንግል ማርያም ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 18
የምህረት- ዝናብ
መንፈሣዊት- መርከብ
የብርሃን - ድንኳን
ተስፋ ነሽ - ለሃጥዓን(2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 19
ለመስቀል ለታ ለደመራው
በአዲሱ ዓመት በል ማረኝ ብዬ
ልቆጠር መጣሁኝ ልጅህ ተብዬ
በአለም መኖር አልጠቀመኝም

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 20
ከፀፀት በቀር አልተረፈኝም
የሠጠኸኝን ሙሽርነት ልብስ
አሣድፌያለሁ በኃጢዓት መርከስ
የጥምቀት ድርብ በፍታዬ የለም

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 21
መብራት ዘይቴ አልተዘጋጀም
የተካፈልኩት አልቋል በመርገም
አብሮኝ ያጠፋው ወዳጄም የለም
አንተ ግን አለህ ለዘለዓለም (2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 22
ከብረው ይቆዮን ከብረው
የአለምን ሃጥያት ንቀው
ሆናችሁ ልባም ሙሽራ
ብርሃናችሁ እንዲያበራ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 23
ወደ ቤቱ ገስግሣችሁ
ዘይት መብራቱን ይዛችሁ
ከብረው ይቆዮን ከብረው
ከብረን እንቆይ ከብረን

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 24
በፆም በፀሎት ፀንተን
አስራቱን ለእርሱ አውጥተን
ዝክር ምስክር ነውና
ከብረን እንቆይ በጤና

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ' 
        END,
        lyrics_transliteration = 'CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 1
Kidus yohens timet’alachhu des des yibelachhu (2)
Ho bilen met’an ho bilen (2)
Getoch alu bilen
Ho bilen met’an ho bilen (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 2
Emete alu bilen
Ho bilen met’an ho bilen (2)
Zemen met’a
Yedeferese Halleluya wenz sit’era Halleluya

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 3
Bemeskerem wer Halleluya siyabb azmera Halleluya
Yerekese lib Halleluya yadefe libs
T’ye met’ahugn Halleluya endtades
Medhanealem ኧኸ

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 4
Cher mehari neh mimeslh yelem
Dingil hoy ኧኸ
Merkebachn nesh tashagrinalesh
Lich’ama qalun Halleluya lebshe wengel Halleluya

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 5
Bariya lihunh Halleluya lijh balbal Halleluya
Maqen qedje Halleluya kaba liderb Halleluya
Lenes yishalal Halleluya wedeante meqreb Halleluya
Adonay berekethn lak kesemay (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 6
Enqut’at’ash ahunm degmo degmo yamt’ash (2)
Tinantn alefku honeh gashaye
Negeyen siraw cher eregnaye
Nisha honogn gets’e bereket

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 7
Zemene yimer lashebrqbet
Medhanealem
Cher mehari neh mimeslh yelem
Dingil hoy

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 8
Merkebachn nesh tashagriyalesh
Adey yebr muday kolel bey
ኧኸ adey yeamlak enat Dingil ney
Maregn ኧኸ

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 9
Wede meqdesh
T’erte''h asgebagn
Yeljnet ኧኸ
Metelalefen atasbbgn

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 10
Bilugnm ኧኸ
Amshto met’a
Kebeth alwt’a
Kifelegn ኧኸ

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 11
Degu Getaye
Aynes wagaye
Yichin amet ኧኸ
Antew tewegn

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 12
Libh yizenlgn
(ete abebash ete abebaye aye ete abebaye )
Lebcha
Yichin amet tewegn Getaye - tewegn yichin amet

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 13
Firen afrche endabbbet
Tewegn yichin amet
Tewegn yichin amet (2)
Wet’che alqr

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 14
Beth melsegn
Tewegn yichin amet
Lensha edmen legsegn
Tewegn yichn amet

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 15
Bet gwadayenm lastekaklew
Tewegn yichn amet
Hizqyasnm endmeslew
Tewegn yichn amet (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 16
Bengus qegn yemtqomi
Maryam yene emebet
Silets’dqe hule qidemi
Maryam yene Emebete

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 17
Marat bilesh asmrignna
Liqegnlsh beadis misgana
Maryam yene emebet (2)
Dingil Maryam ኧኸ

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 18
Yemhret- zinab
Menfesawit- merkeb
Yebrhan - dinkwan
Tesfa nesh - lehat’an (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 19
Lemesqel leta ledemeraw
Beadisu amet bel maregn biye
Liqot’er met’ahugn lijh tebye
Bealem menor alt’eqemegnm

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 20
Kets’ets’et beqer alterefegnm
Yeset’eኸgnn mushrnet libs
Asadfeyalehu behat’iat merkes
Yet’mqet dirb beftaye yelem

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 21
Mebrat zeyte altezegajem
Yetekafelkut alqwal bemergem
Abrogn yat’efaw wedajem yelem
Ante gin aleh lezelealem (2)

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 22
Kebrew yiqoyon kebrew
Yealemn hat’yat niqew
Honachhu libam mushra
Birhanachhu endiyabera

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 23
Wede betu gesgsachhu
Zeyt mebratun yizachhu
Kebrew yiqoyon kebrew
Kebren enqoy kebren

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu

VERSE 24
Bets’om bets’elot ts’enten
Asratun leersu awt’ten
Zikr miskr newna
Kebren enqoy bet’ena

CHORUS
Ho bilen met’an
Esey des des yibelen des des yibelen
Adisu amet met’aln des des yibelen (2)
Esey des des yibelachhu des des yibelachhu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7edd14f1-ba77-4afb-8eed-9d615f0f7a5c'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 1
ቅዱስ ዮሐንስ ትመጣላችሁ ደስ ደስ ይበላችሁ(2)
ሆ ብለን መጣን ሆ ብለን(፪)
ጌቶች አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 2
እሜቴ አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)
ዘመን መጣ
የደፈረሰ ሃሌ ሉያ ወንዝ ሲጠራ ሃሌ ሉያ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 3
በመስከረም ወር ሃሌ ሉያ ሲያብብ አዝመራ ሃሌ ሉያ
የረከሠ ልብ ሃሌ ሉያ ያደፈ ልብስ
ጥዬ መጣሁኝ ሃሌ ሉያ እንድታደስ
መድኃኔዓለም ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 4
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ ኧኸ
መርከባችን ነሽ ታሻግሪናለሽ
ልጫማ ቃሉን ሃሌ ሉያ ለብሼ ወንጌል ሃሌ ሉያ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 5
ባሪያ ልሁንህ ሃሌ ሉያ ልጅህ ባልባል ሃሌ ሉያ
ማቄን ቀድጄ ሃሌ ሉያ ካባ ልደርብ ሃሌ ሉያ
ለኔስ ይሻላል ሃሌ ሉያ ወደአንተ መቅረብ ሃሌ ሉያ
አዶናይ በረከትህን ላክ ከሠማይ (2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 6
እንቁጣጣሽ አሁንም ደግሞ ደግሞ ያምጣሽ (2)
ትናንትን አለፍኩ ሆነህ ጋሻዬ
ነገዬን ስራው ቸር እረኛዬ
ንስሃ ሆኖኝ ገፀ በረከት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 7
ዘመኔ ይመር ላሸብርቅበት
መድኃኔዓለም
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 8
መርከባችን ነሽ ታሻግሪያለሽ
አደይ የብር ሙዳይ ኮለል በይ
ኧኸ ዐደይ የአምላክ እናት ድንግል ነይ
ማረኝ ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 9
ወደ መቅደስህ
ጠርተ''ህ አስገባኝ
የልጅነት ኧኸ
መተላለፌን አታስብብኝ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 10
ቢሉኝም ኧኸ
አምሽቶ መጣ
ከቤትህ አልውጣ
ክፈለኝ ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 11
ደጉ ጌታዬ
አይነስ ዋጋዬ
ይቺን አመት ኧኸ
አንተው ተወኝ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 12
ልብህ ይዘንልኝ
(እቴ አበባሽ እቴ አበባዬ አዬ እቴ አበባዬ )
ለብቻ
ይቺን አመት ተወኝ ጌታዬ - ተወኝ ይቺን ዓመት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 13
ፍሬን አፍርቼ እንዳብብበት
ተወኝ ይቺን አመት
ተወኝ ይቺን አመት (2)
ወጥቼ አልቅር

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 14
ቤትህ መልሰኝ
ተወኝ ይቺን ዓመት
ለንስሃ ዕድሜን ለግሠኝ
ተወኝ ይችን ዓመት

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 15
ቤት ጓዳዬንም ላስተካክለው
ተወኝ ይችን ዓመት
ህዝቅያስንም እንድመስለው
ተወኝ ይችን ዓመት(2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 16
በንጉስ ቀኝ የምትቆሚ
ማርያም የኔ እመቤት
ስለፅድቄ ሁሌ ቅደሚ
ማርያም የኔ እመቤቴ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 17
ማራት ብለሽ አስምሪኝና
ልቀኝልሽ በአዲስ ምስጋና
ማርያም የኔ እመቤት(2)
ድንግል ማርያም ኧኸ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 18
የምህረት- ዝናብ
መንፈሣዊት- መርከብ
የብርሃን - ድንኳን
ተስፋ ነሽ - ለሃጥዓን(2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 19
ለመስቀል ለታ ለደመራው
በአዲሱ ዓመት በል ማረኝ ብዬ
ልቆጠር መጣሁኝ ልጅህ ተብዬ
በአለም መኖር አልጠቀመኝም

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 20
ከፀፀት በቀር አልተረፈኝም
የሠጠኸኝን ሙሽርነት ልብስ
አሣድፌያለሁ በኃጢዓት መርከስ
የጥምቀት ድርብ በፍታዬ የለም

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 21
መብራት ዘይቴ አልተዘጋጀም
የተካፈልኩት አልቋል በመርገም
አብሮኝ ያጠፋው ወዳጄም የለም
አንተ ግን አለህ ለዘለዓለም (2)

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 22
ከብረው ይቆዮን ከብረው
የአለምን ሃጥያት ንቀው
ሆናችሁ ልባም ሙሽራ
ብርሃናችሁ እንዲያበራ

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 23
ወደ ቤቱ ገስግሣችሁ
ዘይት መብራቱን ይዛችሁ
ከብረው ይቆዮን ከብረው
ከብረን እንቆይ ከብረን

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ

VERSE 24
በፆም በፀሎት ፀንተን
አስራቱን ለእርሱ አውጥተን
ዝክር ምስክር ነውና
ከብረን እንቆይ በጤና

CHORUS
ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ሆ ብለን መጣን
እሰይ ደስ ደስ ይበለን ደስ ደስ ይበለን
ዐዲሱ ዐመት መጣልን ደስ ደስ ይበለን(2)
እሰይ ደስ ደስ ይበላችሁ ደስ ደስ ይበላችሁ
ቅዱስ ዮሐንስ ትመጣላችሁ ደስ ደስ ይበላችሁ(2)
ሆ ብለን መጣን ሆ ብለን(፪)
ጌቶች አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)
እሜቴ አሉ ብለን
ሆ ብለን መጣን ሆ ብለን(፪)
ዘመን መጣ
የደፈረሰ ሃሌ ሉያ ወንዝ ሲጠራ ሃሌ ሉያ
በመስከረም ወር ሃሌ ሉያ ሲያብብ አዝመራ ሃሌ ሉያ
የረከሠ ልብ ሃሌ ሉያ ያደፈ ልብስ
ጥዬ መጣሁኝ ሃሌ ሉያ እንድታደስ
መድኃኔዓለም ኧኸ
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ ኧኸ
መርከባችን ነሽ ታሻግሪናለሽ
ልጫማ ቃሉን ሃሌ ሉያ ለብሼ ወንጌል ሃሌ ሉያ
ባሪያ ልሁንህ ሃሌ ሉያ ልጅህ ባልባል ሃሌ ሉያ
ማቄን ቀድጄ ሃሌ ሉያ ካባ ልደርብ ሃሌ ሉያ
ለኔስ ይሻላል ሃሌ ሉያ ወደአንተ መቅረብ ሃሌ ሉያ
አዶናይ በረከትህን ላክ ከሠማይ (2)
እንቁጣጣሽ አሁንም ደግሞ ደግሞ ያምጣሽ (2)
ትናንትን አለፍኩ ሆነህ ጋሻዬ
ነገዬን ስራው ቸር እረኛዬ
ንስሃ ሆኖኝ ገፀ በረከት
ዘመኔ ይመር ላሸብርቅበት
መድኃኔዓለም
ቸር መሃሪ ነህ ሚመስልህ የለም
ድንግል ሆይ
መርከባችን ነሽ ታሻግሪያለሽ
አደይ የብር ሙዳይ ኮለል በይ
ኧኸ ዐደይ የአምላክ እናት ድንግል ነይ
ማረኝ ኧኸ
ወደ መቅደስህ
ጠርተ''ህ አስገባኝ
የልጅነት ኧኸ
መተላለፌን አታስብብኝ
ቢሉኝም ኧኸ
አምሽቶ መጣ
ከቤትህ አልውጣ
ክፈለኝ ኧኸ
ደጉ ጌታዬ
አይነስ ዋጋዬ
ይቺን አመት ኧኸ
አንተው ተወኝ
ልብህ ይዘንልኝ
(እቴ አበባሽ እቴ አበባዬ አዬ እቴ አበባዬ...)
ለብቻ
ይቺን አመት ተወኝ ጌታዬ - ተወኝ ይቺን ዓመት
ፍሬን አፍርቼ እንዳብብበት
ተወኝ ይቺን አመት
ተወኝ ይቺን አመት (2*)
ወጥቼ አልቅር
ቤትህ መልሰኝ
ተወኝ ይቺን ዓመት
ለንስሃ ዕድሜን ለግሠኝ
ተወኝ ይችን ዓመት
ቤት ጓዳዬንም ላስተካክለው
ተወኝ ይችን ዓመት
ህዝቅያስንም እንድመስለው
ተወኝ ይችን ዓመት(2)
በንጉስ ቀኝ የምትቆሚ
ማርያም የኔ እመቤት
ስለፅድቄ ሁሌ ቅደሚ
ማርያም የኔ እመቤቴ
ማራት ብለሽ አስምሪኝና
ልቀኝልሽ በአዲስ ምስጋና
ማርያም የኔ እመቤት(2)
ድንግል ማርያም ኧኸ
የምህረት- ዝናብ
መንፈሣዊት- መርከብ
የብርሃን - ድንኳን
ተስፋ ነሽ - ለሃጥዓን(2*)
ለመስቀል ለታ ለደመራው
በአዲሱ ዓመት በል ማረኝ ብዬ
ልቆጠር መጣሁኝ ልጅህ ተብዬ
በአለም መኖር አልጠቀመኝም
ከፀፀት በቀር አልተረፈኝም
የሠጠኸኝን ሙሽርነት ልብስ
አሣድፌያለሁ በኃጢዓት መርከስ
የጥምቀት ድርብ በፍታዬ የለም
መብራት ዘይቴ አልተዘጋጀም
የተካፈልኩት አልቋል በመርገም
አብሮኝ ያጠፋው ወዳጄም የለም
አንተ ግን አለህ ለዘለዓለም (2*)
ከብረው ይቆዮን ከብረው
የአለምን ሃጥያት ንቀው
ሆናችሁ ልባም ሙሽራ
ብርሃናችሁ እንዲያበራ
ወደ ቤቱ ገስግሣችሁ
ዘይት መብራቱን ይዛችሁ
ከብረው ይቆዮን ከብረው
ከብረን እንቆይ ከብረን
በፆም በፀሎት ፀንተን
አስራቱን ለእርሱ አውጥተን
ዝክር ምስክር ነውና
ከብረን እንቆይ በጤና'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7edd14f1-ba77-4afb-8eed-9d615f0f7a5c'::uuid, 'addis-amet-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-2434 ("ዕልል ዕልል ንበል")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd488eefa-ed92-4e47-929a-236613aaf304'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 1
,,,,,,,,
Ab alem kelona temeselna miskin
Misana ኸleka zefrhena yelen
Bishgr mekera sigana temahmene

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 2
Wisht’na yihdes beti natka mihret (2)
,,,,,
Mesfen selam ika selam atesfn
Kem bezhi bedelna fits’m zey tich’kn

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 3
Seray hat’yatna keleኻna alfa
Kulu sae nemesgn temeliena tesfa (2)
,,,,,,,,
Enmkhalu ezgabher alena

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 4
Nihna entewedeqna nisu yelelena
Ab semayn midrn mulee misganau
Men alo kem goyta fiqri zibahriu (2)
,,,,,,,

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 5
Mesfen selam iኻ selam atesfn
Kem bezhi bedelna fits’m zey tich’kn
Seray hat’yatna keleኻna alf
Kulu sae nemesgn temeliena tesf (2)

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 1
,,,,,,,,
አብ ዓለም ከሎና ተመሰልና ሚስኪን
ምሳና ኸለካ ዘፍርሐና የለን
ብሽግር መከራ ስጋና ተማህመነ

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 2
ውሽጥና ይሕደስ በቲ ናትካ ምሕረት (2)
,,,,,
መስፈን ሰላም ኢካ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዜይ ትጭክን

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 3
ሰራይ ሓጥያትና ከለኻና አልፋ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፋ (2)
,,,,,,,,
እንምክሓሉ እዝጋብሄር አለና

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 4
ንሕና እንተወደቅና ንሱ የልዕለና
አብ ሰማይን ምድርን ሙለእ ምስጋናኡ
መን አሎ ከም ጎይታ ፍቅሪ ዝባህሪኡ(2)
,,,,,,,

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 5
መስፈን ሰላም ኢኻ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዘይ ትጭክን
ሰራይ ሓጥያትና ከለኻና አልፍ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፍ(2)

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 1
,,,,,,,,
አብ ዓለም ከሎና ተመሰልና ሚስኪን
ምሳና ኸለካ ዘፍርሐና የለን
ብሽግር መከራ ስጋና ተማህመነ

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 2
ውሽጥና ይሕደስ በቲ ናትካ ምሕረት (2)
,,,,,
መስፈን ሰላም ኢካ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዜይ ትጭክን

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 3
ሰራይ ሓጥያትና ከለኻና አልፋ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፋ (2)
,,,,,,,,
እንምክሓሉ እዝጋብሄር አለና

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 4
ንሕና እንተወደቅና ንሱ የልዕለና
አብ ሰማይን ምድርን ሙለእ ምስጋናኡ
መን አሎ ከም ጎይታ ፍቅሪ ዝባህሪኡ(2)
,,,,,,,

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 5
መስፈን ሰላም ኢኻ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዘይ ትጭክን
ሰራይ ሓጥያትና ከለኻና አልፍ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፍ(2)

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን' THEN lyrics_amharic 
          ELSE 'CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 1
,,,,,,,,
አብ ዓለም ከሎና ተመሰልና ሚስኪን
ምሳና ኸለካ ዘፍርሐና የለን
ብሽግር መከራ ስጋና ተማህመነ

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 2
ውሽጥና ይሕደስ በቲ ናትካ ምሕረት (2)
,,,,,
መስፈን ሰላም ኢካ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዜይ ትጭክን

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 3
ሰራይ ሓጥያትና ከለኻና አልፋ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፋ (2)
,,,,,,,,
እንምክሓሉ እዝጋብሄር አለና

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 4
ንሕና እንተወደቅና ንሱ የልዕለና
አብ ሰማይን ምድርን ሙለእ ምስጋናኡ
መን አሎ ከም ጎይታ ፍቅሪ ዝባህሪኡ(2)
,,,,,,,

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 5
መስፈን ሰላም ኢኻ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዘይ ትጭክን
ሰራይ ሓጥያትና ከለኻና አልፍ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፍ(2)

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን' 
        END,
        lyrics_transliteration = 'CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 1
,,,,,,,,
Ab alem kelona temeselna miskin
Misana ኸleka zefrhena yelen
Bishgr mekera sigana temahmene

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 2
Wisht’na yihdes beti natka mihret (2)
,,,,,
Mesfen selam ika selam atesfn
Kem bezhi bedelna fits’m zey tich’kn

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 3
Seray hat’yatna keleኻna alfa
Kulu sae nemesgn temeliena tesfa (2)
,,,,,,,,
Enmkhalu ezgabher alena

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 4
Nihna entewedeqna nisu yelelena
Ab semayn midrn mulee misganau
Men alo kem goyta fiqri zibahriu (2)
,,,,,,,

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman

VERSE 5
Mesfen selam iኻ selam atesfn
Kem bezhi bedelna fits’m zey tich’kn
Seray hat’yatna keleኻna alf
Kulu sae nemesgn temeliena tesf (2)

CHORUS
Ell ell nibel binay aryam zimare
Hizbey elka goyta keyreaኻ fire
Ab maekelna qoymka amlaኽna kitkewn
Aretna serkayo aman biaman',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd488eefa-ed92-4e47-929a-236613aaf304'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 1
,,,,,,,,
አብ ዓለም ከሎና ተመሰልና ሚስኪን
ምሳና ኸለካ ዘፍርሐና የለን
ብሽግር መከራ ስጋና ተማህመነ

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 2
ውሽጥና ይሕደስ በቲ ናትካ ምሕረት (2)
,,,,,
መስፈን ሰላም ኢካ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዜይ ትጭክን

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 3
ሰራይ ሓጥያትና ከለኻና አልፋ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፋ (2)
,,,,,,,,
እንምክሓሉ እዝጋብሄር አለና

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 4
ንሕና እንተወደቅና ንሱ የልዕለና
አብ ሰማይን ምድርን ሙለእ ምስጋናኡ
መን አሎ ከም ጎይታ ፍቅሪ ዝባህሪኡ(2)
,,,,,,,

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን

VERSE 5
መስፈን ሰላም ኢኻ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዘይ ትጭክን
ሰራይ ሓጥያትና ከለኻና አልፍ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፍ(2)

CHORUS
ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ዕልል ዕልል ንበል ብናይ አርያም ዝማሬ
ህዝበይ እልካ ጎይታ ከይረአኻ ፍሬ
አብ ማእከልና ቆይምካ አምላኽና ክትከውን
አርዕትና ሴርካዮ አማን ብአማን
,,,,,,,,🎤
አብ ዓለም ከሎና ተመሰልና ሚስኪን
ምሳና ኸለካ ዘፍርሐና የለን
ብሽግር መከራ ስጋና ተማህመነ
ውሽጥና ይሕደስ በቲ ናትካ ምሕረት (2)
,,,,,🎤
መስፈን ሰላም ኢካ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዜይ ትጭክን
ሰራይ ሓጥያትና ከለኻና አልፋ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፋ (2)
,,,,,,,,🎤
እንምክሓሉ እዝጋብሄር አለና
ንሕና እንተወደቅና ንሱ የልዕለና
አብ ሰማይን ምድርን ሙለእ ምስጋናኡ
መን አሎ ከም ጎይታ ፍቅሪ ዝባህሪኡ(2)
,,,,,,,🎤
መስፈን ሰላም ኢኻ ሰላም አተስፍን
ከም በዝሒ በደልና ፍጽም ዘይ ትጭክን
ሰራይ ሓጥያትና ከለኻና አልፍ
ኩሉ ሳዕ ነመስግን ተመሊእና ተስፍ(2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd488eefa-ed92-4e47-929a-236613aaf304'::uuid, 'eritrean-orthodox-tewahdo-mezmur-2434', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fqri-enktglex-eritrean-orthodox-tewahdo-mezmur ("ፍቅሪ እንክትግለጽ ~ ~")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '996b58fd-389d-4c6b-b2f4-5e6c062f62fb'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 1
Bits’ega delibki erqanu tishfni
Lewah ade fiቕri hiqwifua zeyts’geb
Aedawa zergiha nihat’e teቕrb
Bili nay fiቕrki ninefsey engale milat wisht’i betey biaኺ zille

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 2
Melke wiqabeኺ tihtna zegets’e
Biwerqi zeykone melke amlaኽ zimerets’e silmti adarash wiqabe Egziabher diri endo kwinni ab betu kinebr
Meste nay fiቕrኺ ninefsey riwyeta jah jah ilu ab lieley bibrtue jelemta
Haቒq may nay nigho filyti nits’hti

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 3
Aber zeytereኽba zeybla''win hifti
Wiqbti bigrma ts’baቐ sefiros
Simki nikedhyo habni''endo nablis
Meaza fiቕrኺ nimenfesey bahta

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 4
Ab lieley fesisu zimeaze shta
Felsi nay fiqrኺ ab libey t’et’iu
Senay fire feryu lemlimu agwlaeliu
Bimen kimsleki bimntay kigelts’eki

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 5
Aden dingln kwenki melekot zits’orki
Amanawi meble goyta zifereኺ bezi yefqreki bezi yeebyeki
Lieli mot hayalyu fiቕrኺ zit’eame
Alem yemenno widase enadegeme mar'' ilom abotat simki mis alalu

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 6
Yam'' koynu’ti megbom ab semay yiwelu
Maeser fits’ame kwilu mewedaeta higi
Kich’bt’a ab idey nay nigsnet zengi
Bimbzah zeykone biwahdi fidelat

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 7
Widaseኺ yidegm biቑnt’aro qalat
Fiቕrki mets’haf''yu manm zeynebebo
Filt’et delbni ab libey kirebo
Sendeq elamaኺ ab lieley fiቕri

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 8
Bejaኺ mirhni ts’dqi nikhari

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 1
ብጸጋ ደሊብኪ ዕርቃኑ ትሽፍኒ
ለዋህ ኣደ ፍቕሪ ሕቊፉኣ ዘይጽገብ
ኣእዳዋ ዘርጊሓ ንኃጥእ ተቕርብ
ብልዒ ናይ ፍቕርኪ ንነፍሰይ ዕንጋለ ምልኣት ውሽጢ ቤተይ ብኣኺ ዝልለ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 2
መልክዕ ውቃበኺ ትሕትና ዘጌጸ
ብወርቂ ዘይኮነ መልክዕ ኣምላኽ ዝመረጸ ስልምቲ ኣዳራሽ ውቃበ እግዚአብሔር ድርዒ እንዶ ኲንኒ ኣብ ቤቱ ኪነብር
መስተ ናይ ፍቕርኺ ንነፍሰይ ርውየታ ጃሕ ጃሕ ኢሉ ኣብ ልዕለይ ብብርቱዕ ጀለምታ
ሓቒቅ ማይ ናይ ንግሆ ፍልይቲ ንጽህቲ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 3
ኣበር ዘይተረኽባ ዘይብላ''ውን ሕፍቲ
ውቅብቲ ብግርማ ጽባቐ ሰፊሮስ
ስምኪ ንከድህዮ ሃብኒ''እንዶ ናብሊስ
መኣዛ ፍቕርኺ ንመንፈሰይ ባህታ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 4
ኣብ ልዕለይ ፈሲሱ ዝመኣዘ ሽታ
ፈልሲ ናይ ፍቅርኺ ኣብ ልበይ ጠጢዑ
ሠናይ ፍረ ፈርዩ ለምሊሙ ኣጕላዕሊዑ
ብመን ክምስለኪ ብምንታይ ኪገልጸኪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 5
ኣደን ድንግልን ኴንኪ መለኮት ዝጾርኪ
ኣማናዊ መብልዕ ጎይታ ዝፈረኺ በዚ የፍቅረኪ በዚ የዕብየኪ
ልዕሊ ሞት ሓያልዩ ፍቕርኺ ዝጠዓመ
ዓለም የመንኖ ውዳሴ እናደገመ ማር'' ኢሎም ኣቦታት ስምኪ ምስ ኣልዓሉ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 6
ያም'' ኮይኑ’ቲ መግቦም ኣብ ሰማይ ይውዕሉ
ማእሰር ፍጻሜ ኲሉ መወዳእታ ሕጊ
ክጭብጣ ኣብ ኢደይ ናይ ንግስነት ዘንጊ
ብምብዛሕ ዘይኮነ ብዋሕዲ ፊደላት

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 7
ውዳሴኺ ይደግም ብቑንጣሮ ቃላት
ፍቕርኪ መጽሓፍ''ዩ ማንም ዘይነበቦ
ፍልጠት ደልብኒ ኣብ ልበይ ክረቦ
ሰንደቅ ዕላማኺ ኣብ ልዕለይ ፍቕሪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 8
በጃኺ ምርሕኒ ጽድቂ ንክሓሪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 1
ብጸጋ ደሊብኪ ዕርቃኑ ትሽፍኒ
ለዋህ ኣደ ፍቕሪ ሕቊፉኣ ዘይጽገብ
ኣእዳዋ ዘርጊሓ ንኃጥእ ተቕርብ
ብልዒ ናይ ፍቕርኪ ንነፍሰይ ዕንጋለ ምልኣት ውሽጢ ቤተይ ብኣኺ ዝልለ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 2
መልክዕ ውቃበኺ ትሕትና ዘጌጸ
ብወርቂ ዘይኮነ መልክዕ ኣምላኽ ዝመረጸ ስልምቲ ኣዳራሽ ውቃበ እግዚአብሔር ድርዒ እንዶ ኲንኒ ኣብ ቤቱ ኪነብር
መስተ ናይ ፍቕርኺ ንነፍሰይ ርውየታ ጃሕ ጃሕ ኢሉ ኣብ ልዕለይ ብብርቱዕ ጀለምታ
ሓቒቅ ማይ ናይ ንግሆ ፍልይቲ ንጽህቲ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 3
ኣበር ዘይተረኽባ ዘይብላ''ውን ሕፍቲ
ውቅብቲ ብግርማ ጽባቐ ሰፊሮስ
ስምኪ ንከድህዮ ሃብኒ''እንዶ ናብሊስ
መኣዛ ፍቕርኺ ንመንፈሰይ ባህታ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 4
ኣብ ልዕለይ ፈሲሱ ዝመኣዘ ሽታ
ፈልሲ ናይ ፍቅርኺ ኣብ ልበይ ጠጢዑ
ሠናይ ፍረ ፈርዩ ለምሊሙ ኣጕላዕሊዑ
ብመን ክምስለኪ ብምንታይ ኪገልጸኪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 5
ኣደን ድንግልን ኴንኪ መለኮት ዝጾርኪ
ኣማናዊ መብልዕ ጎይታ ዝፈረኺ በዚ የፍቅረኪ በዚ የዕብየኪ
ልዕሊ ሞት ሓያልዩ ፍቕርኺ ዝጠዓመ
ዓለም የመንኖ ውዳሴ እናደገመ ማር'' ኢሎም ኣቦታት ስምኪ ምስ ኣልዓሉ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 6
ያም'' ኮይኑ’ቲ መግቦም ኣብ ሰማይ ይውዕሉ
ማእሰር ፍጻሜ ኲሉ መወዳእታ ሕጊ
ክጭብጣ ኣብ ኢደይ ናይ ንግስነት ዘንጊ
ብምብዛሕ ዘይኮነ ብዋሕዲ ፊደላት

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 7
ውዳሴኺ ይደግም ብቑንጣሮ ቃላት
ፍቕርኪ መጽሓፍ''ዩ ማንም ዘይነበቦ
ፍልጠት ደልብኒ ኣብ ልበይ ክረቦ
ሰንደቅ ዕላማኺ ኣብ ልዕለይ ፍቕሪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 8
በጃኺ ምርሕኒ ጽድቂ ንክሓሪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ' THEN lyrics_amharic 
          ELSE 'CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 1
ብጸጋ ደሊብኪ ዕርቃኑ ትሽፍኒ
ለዋህ ኣደ ፍቕሪ ሕቊፉኣ ዘይጽገብ
ኣእዳዋ ዘርጊሓ ንኃጥእ ተቕርብ
ብልዒ ናይ ፍቕርኪ ንነፍሰይ ዕንጋለ ምልኣት ውሽጢ ቤተይ ብኣኺ ዝልለ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 2
መልክዕ ውቃበኺ ትሕትና ዘጌጸ
ብወርቂ ዘይኮነ መልክዕ ኣምላኽ ዝመረጸ ስልምቲ ኣዳራሽ ውቃበ እግዚአብሔር ድርዒ እንዶ ኲንኒ ኣብ ቤቱ ኪነብር
መስተ ናይ ፍቕርኺ ንነፍሰይ ርውየታ ጃሕ ጃሕ ኢሉ ኣብ ልዕለይ ብብርቱዕ ጀለምታ
ሓቒቅ ማይ ናይ ንግሆ ፍልይቲ ንጽህቲ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 3
ኣበር ዘይተረኽባ ዘይብላ''ውን ሕፍቲ
ውቅብቲ ብግርማ ጽባቐ ሰፊሮስ
ስምኪ ንከድህዮ ሃብኒ''እንዶ ናብሊስ
መኣዛ ፍቕርኺ ንመንፈሰይ ባህታ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 4
ኣብ ልዕለይ ፈሲሱ ዝመኣዘ ሽታ
ፈልሲ ናይ ፍቅርኺ ኣብ ልበይ ጠጢዑ
ሠናይ ፍረ ፈርዩ ለምሊሙ ኣጕላዕሊዑ
ብመን ክምስለኪ ብምንታይ ኪገልጸኪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 5
ኣደን ድንግልን ኴንኪ መለኮት ዝጾርኪ
ኣማናዊ መብልዕ ጎይታ ዝፈረኺ በዚ የፍቅረኪ በዚ የዕብየኪ
ልዕሊ ሞት ሓያልዩ ፍቕርኺ ዝጠዓመ
ዓለም የመንኖ ውዳሴ እናደገመ ማር'' ኢሎም ኣቦታት ስምኪ ምስ ኣልዓሉ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 6
ያም'' ኮይኑ’ቲ መግቦም ኣብ ሰማይ ይውዕሉ
ማእሰር ፍጻሜ ኲሉ መወዳእታ ሕጊ
ክጭብጣ ኣብ ኢደይ ናይ ንግስነት ዘንጊ
ብምብዛሕ ዘይኮነ ብዋሕዲ ፊደላት

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 7
ውዳሴኺ ይደግም ብቑንጣሮ ቃላት
ፍቕርኪ መጽሓፍ''ዩ ማንም ዘይነበቦ
ፍልጠት ደልብኒ ኣብ ልበይ ክረቦ
ሰንደቅ ዕላማኺ ኣብ ልዕለይ ፍቕሪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 8
በጃኺ ምርሕኒ ጽድቂ ንክሓሪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ' 
        END,
        lyrics_transliteration = 'CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 1
Bits’ega delibki erqanu tishfni
Lewah ade fiቕri hiqwifua zeyts’geb
Aedawa zergiha nihat’e teቕrb
Bili nay fiቕrki ninefsey engale milat wisht’i betey biaኺ zille

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 2
Melke wiqabeኺ tihtna zegets’e
Biwerqi zeykone melke amlaኽ zimerets’e silmti adarash wiqabe Egziabher diri endo kwinni ab betu kinebr
Meste nay fiቕrኺ ninefsey riwyeta jah jah ilu ab lieley bibrtue jelemta
Haቒq may nay nigho filyti nits’hti

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 3
Aber zeytereኽba zeybla''win hifti
Wiqbti bigrma ts’baቐ sefiros
Simki nikedhyo habni''endo nablis
Meaza fiቕrኺ nimenfesey bahta

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 4
Ab lieley fesisu zimeaze shta
Felsi nay fiqrኺ ab libey t’et’iu
Senay fire feryu lemlimu agwlaeliu
Bimen kimsleki bimntay kigelts’eki

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 5
Aden dingln kwenki melekot zits’orki
Amanawi meble goyta zifereኺ bezi yefqreki bezi yeebyeki
Lieli mot hayalyu fiቕrኺ zit’eame
Alem yemenno widase enadegeme mar'' ilom abotat simki mis alalu

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 6
Yam'' koynu’ti megbom ab semay yiwelu
Maeser fits’ame kwilu mewedaeta higi
Kich’bt’a ab idey nay nigsnet zengi
Bimbzah zeykone biwahdi fidelat

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 7
Widaseኺ yidegm biቑnt’aro qalat
Fiቕrki mets’haf''yu manm zeynebebo
Filt’et delbni ab libey kirebo
Sendeq elamaኺ ab lieley fiቕri

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni

VERSE 8
Bejaኺ mirhni ts’dqi nikhari

CHORUS
Fiቕri enktglets’ hiba zeytts’egb abaኺ rieyeya yewt’a keybeቐቐt
Filyti hiyabey goyta zihabeni
Weladite amlaኽ qelt’ifki bits’hni (2)
Nefsu ziareቐ wahs etኾni',
        updated_at = clock_timestamp()::text
    WHERE import_id = '996b58fd-389d-4c6b-b2f4-5e6c062f62fb'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 1
ብጸጋ ደሊብኪ ዕርቃኑ ትሽፍኒ
ለዋህ ኣደ ፍቕሪ ሕቊፉኣ ዘይጽገብ
ኣእዳዋ ዘርጊሓ ንኃጥእ ተቕርብ
ብልዒ ናይ ፍቕርኪ ንነፍሰይ ዕንጋለ ምልኣት ውሽጢ ቤተይ ብኣኺ ዝልለ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 2
መልክዕ ውቃበኺ ትሕትና ዘጌጸ
ብወርቂ ዘይኮነ መልክዕ ኣምላኽ ዝመረጸ ስልምቲ ኣዳራሽ ውቃበ እግዚአብሔር ድርዒ እንዶ ኲንኒ ኣብ ቤቱ ኪነብር
መስተ ናይ ፍቕርኺ ንነፍሰይ ርውየታ ጃሕ ጃሕ ኢሉ ኣብ ልዕለይ ብብርቱዕ ጀለምታ
ሓቒቅ ማይ ናይ ንግሆ ፍልይቲ ንጽህቲ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 3
ኣበር ዘይተረኽባ ዘይብላ''ውን ሕፍቲ
ውቅብቲ ብግርማ ጽባቐ ሰፊሮስ
ስምኪ ንከድህዮ ሃብኒ''እንዶ ናብሊስ
መኣዛ ፍቕርኺ ንመንፈሰይ ባህታ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 4
ኣብ ልዕለይ ፈሲሱ ዝመኣዘ ሽታ
ፈልሲ ናይ ፍቅርኺ ኣብ ልበይ ጠጢዑ
ሠናይ ፍረ ፈርዩ ለምሊሙ ኣጕላዕሊዑ
ብመን ክምስለኪ ብምንታይ ኪገልጸኪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 5
ኣደን ድንግልን ኴንኪ መለኮት ዝጾርኪ
ኣማናዊ መብልዕ ጎይታ ዝፈረኺ በዚ የፍቅረኪ በዚ የዕብየኪ
ልዕሊ ሞት ሓያልዩ ፍቕርኺ ዝጠዓመ
ዓለም የመንኖ ውዳሴ እናደገመ ማር'' ኢሎም ኣቦታት ስምኪ ምስ ኣልዓሉ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 6
ያም'' ኮይኑ’ቲ መግቦም ኣብ ሰማይ ይውዕሉ
ማእሰር ፍጻሜ ኲሉ መወዳእታ ሕጊ
ክጭብጣ ኣብ ኢደይ ናይ ንግስነት ዘንጊ
ብምብዛሕ ዘይኮነ ብዋሕዲ ፊደላት

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 7
ውዳሴኺ ይደግም ብቑንጣሮ ቃላት
ፍቕርኪ መጽሓፍ''ዩ ማንም ዘይነበቦ
ፍልጠት ደልብኒ ኣብ ልበይ ክረቦ
ሰንደቅ ዕላማኺ ኣብ ልዕለይ ፍቕሪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ

VERSE 8
በጃኺ ምርሕኒ ጽድቂ ንክሓሪ

CHORUS
ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ፍቕሪ እንክትግለጽ ሂባ ዘይትጸግብ ኣባኺ ርእየያ የውጣ ከይበቐቐት
ፍልይቲ ህያበይ ጎይታ ዝሃበኒ
ወላዲተ ኣምላኽ ቀልጢፍኪ ብጽሕኒ /2/
ነፍሱ ዝዓረቐ ዋሕስ እትኾኒ
ብጸጋ ደሊብኪ ዕርቃኑ ትሽፍኒ
ለዋህ ኣደ ፍቕሪ ሕቊፉኣ ዘይጽገብ
ኣእዳዋ ዘርጊሓ ንኃጥእ ተቕርብ
ብልዒ ናይ ፍቕርኪ ንነፍሰይ ዕንጋለ ምልኣት ውሽጢ ቤተይ ብኣኺ ዝልለ
መልክዕ ውቃበኺ ትሕትና ዘጌጸ
ብወርቂ ዘይኮነ መልክዕ ኣምላኽ ዝመረጸ ስልምቲ ኣዳራሽ ውቃበ እግዚአብሔር ድርዒ እንዶ ኲንኒ ኣብ ቤቱ ኪነብር
መስተ ናይ ፍቕርኺ ንነፍሰይ ርውየታ ጃሕ ጃሕ ኢሉ ኣብ ልዕለይ ብብርቱዕ ጀለምታ
ሓቒቅ ማይ ናይ ንግሆ ፍልይቲ ንጽህቲ
ኣበር ዘይተረኽባ ዘይብላ''ውን ሕፍቲ
ውቅብቲ ብግርማ ጽባቐ ሰፊሮስ
ስምኪ ንከድህዮ ሃብኒ''እንዶ ናብሊስ
መኣዛ ፍቕርኺ ንመንፈሰይ ባህታ
ኣብ ልዕለይ ፈሲሱ ዝመኣዘ ሽታ
ፈልሲ ናይ ፍቅርኺ ኣብ ልበይ ጠጢዑ
ሠናይ ፍረ ፈርዩ ለምሊሙ ኣጕላዕሊዑ
ብመን ክምስለኪ ብምንታይ ኪገልጸኪ
ኣደን ድንግልን ኴንኪ መለኮት ዝጾርኪ
ኣማናዊ መብልዕ ጎይታ ዝፈረኺ በዚ የፍቅረኪ በዚ የዕብየኪ
ልዕሊ ሞት ሓያልዩ ፍቕርኺ ዝጠዓመ
ዓለም የመንኖ ውዳሴ እናደገመ ማር'' ኢሎም ኣቦታት ስምኪ ምስ ኣልዓሉ
ያም'' ኮይኑ’ቲ መግቦም ኣብ ሰማይ ይውዕሉ
ማእሰር ፍጻሜ ኲሉ መወዳእታ ሕጊ
ክጭብጣ ኣብ ኢደይ ናይ ንግስነት ዘንጊ
ብምብዛሕ ዘይኮነ ብዋሕዲ ፊደላት
ውዳሴኺ ይደግም ብቑንጣሮ ቃላት
ፍቕርኪ መጽሓፍ''ዩ ማንም ዘይነበቦ
ፍልጠት ደልብኒ ኣብ ልበይ ክረቦ
ሰንደቅ ዕላማኺ ኣብ ልዕለይ ፍቕሪ
በጃኺ ምርሕኒ ጽድቂ ንክሓሪ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '996b58fd-389d-4c6b-b2f4-5e6c062f62fb'::uuid, 'fqri-enktglex-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- for-all-that-he-has-done ("ይህን ላደረገ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7708233a-1b95-4895-803f-01f3b6858a2f'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 1
The mountains we passed the cliffs and hills
We stood with His grace strength He instills
Let us sing to Him with happiness
Dependable is the Lord our bliss

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 2
We cannot succeed with our brute strength
We will praise the Lord who sealed our fate
His abundant love shines bright we say
The light of his lamp Leading the way

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 3
The omnipotent nurturing Lord
Made all possible to his accord
Like children of Zuph we stand in line
To exalt His name with songs and rhyme

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 4
All those who are blessed by His great palms
Will pour from their mouth the purest songs
With the angels we have unified
In His graceful works we will abide

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 5
Although the barrels appear empty
He will care for us the Almighty
The undesired will leave our place
We are safeguarded in His embrace

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 6
We are aided like Ebenezer
At our weakest point He gives power
Our faces will shine with thankfulness
For He has become our joyfulness

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 1
The mountains we passed the cliffs and hills
We stood with His grace strength He instills
Let us sing to Him with happiness
Dependable is the Lord our bliss

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 2
We cannot succeed with our brute strength
We will praise the Lord who sealed our fate
His abundant love shines bright we say
The light of his lamp Leading the way

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 3
The omnipotent nurturing Lord
Made all possible to his accord
Like children of Zuph we stand in line
To exalt His name with songs and rhyme

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 4
All those who are blessed by His great palms
Will pour from their mouth the purest songs
With the angels we have unified
In His graceful works we will abide

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 5
Although the barrels appear empty
He will care for us the Almighty
The undesired will leave our place
We are safeguarded in His embrace

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 6
We are aided like Ebenezer
At our weakest point He gives power
Our faces will shine with thankfulness
For He has become our joyfulness

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 1
The mountains we passed the cliffs and hills
We stood with His grace strength He instills
Let us sing to Him with happiness
Dependable is the Lord our bliss

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 2
We cannot succeed with our brute strength
We will praise the Lord who sealed our fate
His abundant love shines bright we say
The light of his lamp Leading the way

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 3
The omnipotent nurturing Lord
Made all possible to his accord
Like children of Zuph we stand in line
To exalt His name with songs and rhyme

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 4
All those who are blessed by His great palms
Will pour from their mouth the purest songs
With the angels we have unified
In His graceful works we will abide

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 5
Although the barrels appear empty
He will care for us the Almighty
The undesired will leave our place
We are safeguarded in His embrace

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 6
We are aided like Ebenezer
At our weakest point He gives power
Our faces will shine with thankfulness
For He has become our joyfulness

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace' THEN lyrics_amharic 
          ELSE 'CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 1
The mountains we passed the cliffs and hills
We stood with His grace strength He instills
Let us sing to Him with happiness
Dependable is the Lord our bliss

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 2
We cannot succeed with our brute strength
We will praise the Lord who sealed our fate
His abundant love shines bright we say
The light of his lamp Leading the way

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 3
The omnipotent nurturing Lord
Made all possible to his accord
Like children of Zuph we stand in line
To exalt His name with songs and rhyme

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 4
All those who are blessed by His great palms
Will pour from their mouth the purest songs
With the angels we have unified
In His graceful works we will abide

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 5
Although the barrels appear empty
He will care for us the Almighty
The undesired will leave our place
We are safeguarded in His embrace

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 6
We are aided like Ebenezer
At our weakest point He gives power
Our faces will shine with thankfulness
For He has become our joyfulness

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace' 
        END,
        lyrics_transliteration = 'CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 1
The mountains we passed the cliffs and hills
We stood with His grace strength He instills
Let us sing to Him with happiness
Dependable is the Lord our bliss

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 2
We cannot succeed with our brute strength
We will praise the Lord who sealed our fate
His abundant love shines bright we say
The light of his lamp Leading the way

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 3
The omnipotent nurturing Lord
Made all possible to his accord
Like children of Zuph we stand in line
To exalt His name with songs and rhyme

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 4
All those who are blessed by His great palms
Will pour from their mouth the purest songs
With the angels we have unified
In His graceful works we will abide

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 5
Although the barrels appear empty
He will care for us the Almighty
The undesired will leave our place
We are safeguarded in His embrace

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 6
We are aided like Ebenezer
At our weakest point He gives power
Our faces will shine with thankfulness
For He has become our joyfulness

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7708233a-1b95-4895-803f-01f3b6858a2f'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 1
The mountains we passed the cliffs and hills
We stood with His grace strength He instills
Let us sing to Him with happiness
Dependable is the Lord our bliss

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 2
We cannot succeed with our brute strength
We will praise the Lord who sealed our fate
His abundant love shines bright we say
The light of his lamp Leading the way

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 3
The omnipotent nurturing Lord
Made all possible to his accord
Like children of Zuph we stand in line
To exalt His name with songs and rhyme

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 4
All those who are blessed by His great palms
Will pour from their mouth the purest songs
With the angels we have unified
In His graceful works we will abide

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 5
Although the barrels appear empty
He will care for us the Almighty
The undesired will leave our place
We are safeguarded in His embrace

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace

VERSE 6
We are aided like Ebenezer
At our weakest point He gives power
Our faces will shine with thankfulness
For He has become our joyfulness

CHORUS
For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace'
        OR lyrics_amharic IS NOT DISTINCT FROM 'For all that he has done praise with hallelujah
Faithful is our Lord Eternal Messiah
The groom and bride rejoice you are in His embrace
Jacob’s God is with you He has become your grace
The mountains we passed the cliffs and hills
We stood with His grace strength He instills
Let us sing to Him with happiness
Dependable is the Lord our bliss
We cannot succeed with our brute strength
We will praise the Lord who sealed our fate
His abundant love shines bright we say
The light of his lamp Leading the way
The omnipotent nurturing Lord
Made all possible to his accord
Like children of Zuph we stand in line
To exalt His name with songs and rhyme
All those who are blessed by His great palms
Will pour from their mouth the purest songs
With the angels we have unified
In His graceful works we will abide
Although the barrels appear empty
He will care for us the Almighty
The undesired will leave our place
We are safeguarded in His embrace
We are aided like Ebenezer
At our weakest point He gives power
Our faces will shine with thankfulness
For He has become our joyfulness'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7708233a-1b95-4895-803f-01f3b6858a2f'::uuid, 'for-all-that-he-has-done', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hagizeni-amilahey ("ሓግዘኒ ኣምላኸይ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9a68bead-a112-470d-a5d5-82359b5203c2'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey

VERSE 1
Mejemerya aykonen fits’um egabetey
Hagosey ezi''yu yits’ebቕ fits’amey
Ajoኻ beleni bit’um fiቕrኻ
Kits’enanae eye biቕdus menfeska

CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey

VERSE 2
Nay emnetey guezo bertia kifts’m
Ziwedeቐ yelen haylኻ ziemen
Bimenfes jemire keywude bisga
Ats’enanani biቕdus menfeska

CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey

VERSE 3
Nefsat niኽmels miኽnyat entegerkani
Biኽsi keywedቕ kota abertani
Bidem zegets’e''yu zelbeskani ts’ega
Biemnet ats’nani kilebso fiቕrኻ

CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey

VERSE 4
Bizuhat jemirom zeywedu alewu
Ab guezo keyterf ane ewun kemu
Bits’dqi lemlima kitdhn hiywetey
Senay niኽferi biagelglotey

CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 1
መጀመርያ ኣይኮነን ፍጹም ዕጋበተይ
ሓጎሰይ እዚ''ዩ ይጸብቕ ፍጻመይ
ኣጆኻ በለኒ ብጥዑም ፍቕርኻ
ክጸናናዕ እየ ብቕዱስ መንፈስካ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 2
ናይ እምነተይ ጉዕዞ በርቲዐ ክፍጽም
ዝወደቐ የለን ሓይልኻ ዝእመን
ብመንፈስ ጀሚረ ከይዉድእ ብስጋ
ኣጸናንዓኒ ብቕዱስ መንፈስካ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 3
ነፍሳት ንኽመልስ ምኽንያት እንተጌርካኒ
ብኽሲ ከይወድቕ ኮታ ኣበርትዓኒ
ብደም ዘጌጸ''ዩ ዘልበስካኒ ጸጋ
ብእምነት ኣጽንዓኒ ክለብሶ ፍቕርኻ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 4
ብዙሓት ጀሚሮም ዘይወድኡ ኣለዉ
ኣብ ጉዕዞ ከይተርፍ ኣነ እዉን ከምኡ
ብጽድቂ ለምሊማ ክትድሕን ሕይወተይ
ሰናይ ንኽፈሪ ብኣገልግሎተይ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 1
መጀመርያ ኣይኮነን ፍጹም ዕጋበተይ
ሓጎሰይ እዚ''ዩ ይጸብቕ ፍጻመይ
ኣጆኻ በለኒ ብጥዑም ፍቕርኻ
ክጸናናዕ እየ ብቕዱስ መንፈስካ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 2
ናይ እምነተይ ጉዕዞ በርቲዐ ክፍጽም
ዝወደቐ የለን ሓይልኻ ዝእመን
ብመንፈስ ጀሚረ ከይዉድእ ብስጋ
ኣጸናንዓኒ ብቕዱስ መንፈስካ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 3
ነፍሳት ንኽመልስ ምኽንያት እንተጌርካኒ
ብኽሲ ከይወድቕ ኮታ ኣበርትዓኒ
ብደም ዘጌጸ''ዩ ዘልበስካኒ ጸጋ
ብእምነት ኣጽንዓኒ ክለብሶ ፍቕርኻ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 4
ብዙሓት ጀሚሮም ዘይወድኡ ኣለዉ
ኣብ ጉዕዞ ከይተርፍ ኣነ እዉን ከምኡ
ብጽድቂ ለምሊማ ክትድሕን ሕይወተይ
ሰናይ ንኽፈሪ ብኣገልግሎተይ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ' THEN lyrics_amharic 
          ELSE 'CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 1
መጀመርያ ኣይኮነን ፍጹም ዕጋበተይ
ሓጎሰይ እዚ''ዩ ይጸብቕ ፍጻመይ
ኣጆኻ በለኒ ብጥዑም ፍቕርኻ
ክጸናናዕ እየ ብቕዱስ መንፈስካ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 2
ናይ እምነተይ ጉዕዞ በርቲዐ ክፍጽም
ዝወደቐ የለን ሓይልኻ ዝእመን
ብመንፈስ ጀሚረ ከይዉድእ ብስጋ
ኣጸናንዓኒ ብቕዱስ መንፈስካ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 3
ነፍሳት ንኽመልስ ምኽንያት እንተጌርካኒ
ብኽሲ ከይወድቕ ኮታ ኣበርትዓኒ
ብደም ዘጌጸ''ዩ ዘልበስካኒ ጸጋ
ብእምነት ኣጽንዓኒ ክለብሶ ፍቕርኻ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 4
ብዙሓት ጀሚሮም ዘይወድኡ ኣለዉ
ኣብ ጉዕዞ ከይተርፍ ኣነ እዉን ከምኡ
ብጽድቂ ለምሊማ ክትድሕን ሕይወተይ
ሰናይ ንኽፈሪ ብኣገልግሎተይ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ' 
        END,
        lyrics_transliteration = 'CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey

VERSE 1
Mejemerya aykonen fits’um egabetey
Hagosey ezi''yu yits’ebቕ fits’amey
Ajoኻ beleni bit’um fiቕrኻ
Kits’enanae eye biቕdus menfeska

CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey

VERSE 2
Nay emnetey guezo bertia kifts’m
Ziwedeቐ yelen haylኻ ziemen
Bimenfes jemire keywude bisga
Ats’enanani biቕdus menfeska

CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey

VERSE 3
Nefsat niኽmels miኽnyat entegerkani
Biኽsi keywedቕ kota abertani
Bidem zegets’e''yu zelbeskani ts’ega
Biemnet ats’nani kilebso fiቕrኻ

CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey

VERSE 4
Bizuhat jemirom zeywedu alewu
Ab guezo keyterf ane ewun kemu
Bits’dqi lemlima kitdhn hiywetey
Senay niኽferi biagelglotey

CHORUS
Hagzeni amlaኸy ts’elai keysereni
Diኹm''ye baryaኻ ''tezeydegifkani
Niaኻ hize''ye miwts’eay mietawey
Guezom kiቐnes qidm ab mengedey',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9a68bead-a112-470d-a5d5-82359b5203c2'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 1
መጀመርያ ኣይኮነን ፍጹም ዕጋበተይ
ሓጎሰይ እዚ''ዩ ይጸብቕ ፍጻመይ
ኣጆኻ በለኒ ብጥዑም ፍቕርኻ
ክጸናናዕ እየ ብቕዱስ መንፈስካ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 2
ናይ እምነተይ ጉዕዞ በርቲዐ ክፍጽም
ዝወደቐ የለን ሓይልኻ ዝእመን
ብመንፈስ ጀሚረ ከይዉድእ ብስጋ
ኣጸናንዓኒ ብቕዱስ መንፈስካ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 3
ነፍሳት ንኽመልስ ምኽንያት እንተጌርካኒ
ብኽሲ ከይወድቕ ኮታ ኣበርትዓኒ
ብደም ዘጌጸ''ዩ ዘልበስካኒ ጸጋ
ብእምነት ኣጽንዓኒ ክለብሶ ፍቕርኻ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ

VERSE 4
ብዙሓት ጀሚሮም ዘይወድኡ ኣለዉ
ኣብ ጉዕዞ ከይተርፍ ኣነ እዉን ከምኡ
ብጽድቂ ለምሊማ ክትድሕን ሕይወተይ
ሰናይ ንኽፈሪ ብኣገልግሎተይ

CHORUS
ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ሓግዘኒ ኣምላኸይ ጸላኢ ከይስዕረኒ
ድኹም''የ ባርያኻ ''ተዘይደጊፍካኒ
ንዓኻ ሒዘ''የ ምውጸአይ ምእታወይ
ጉዕዞም ክቐንዕስ ቅድም ኣብ መንገደይ
መጀመርያ ኣይኮነን ፍጹም ዕጋበተይ
ሓጎሰይ እዚ''ዩ ይጸብቕ ፍጻመይ
ኣጆኻ በለኒ ብጥዑም ፍቕርኻ
ክጸናናዕ እየ ብቕዱስ መንፈስካ
ናይ እምነተይ ጉዕዞ በርቲዐ ክፍጽም
ዝወደቐ የለን ሓይልኻ ዝእመን
ብመንፈስ ጀሚረ ከይዉድእ ብስጋ
ኣጸናንዓኒ ብቕዱስ መንፈስካ
ነፍሳት ንኽመልስ ምኽንያት እንተጌርካኒ
ብኽሲ ከይወድቕ ኮታ ኣበርትዓኒ
ብደም ዘጌጸ''ዩ ዘልበስካኒ ጸጋ
ብእምነት ኣጽንዓኒ ክለብሶ ፍቕርኻ
ብዙሓት ጀሚሮም ዘይወድኡ ኣለዉ
ኣብ ጉዕዞ ከይተርፍ ኣነ እዉን ከምኡ
ብጽድቂ ለምሊማ ክትድሕን ሕይወተይ
ሰናይ ንኽፈሪ ብኣገልግሎተይ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9a68bead-a112-470d-a5d5-82359b5203c2'::uuid, 'hagizeni-amilahey', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- siley-tesekilu-zemeriti-di-yowuhanisi-di-kibiromi-abeli-sanidiro-yieli-s ("ስለይ ተሰቒሉ # ዘመርቲ፡ ዲ.ዮዉሃንስ፡ ዲ.ክብሮም፡ኣቤል፡ሳንድሮ፡ ዪኤል፡ ሳይሞን፡ ሰሎሙን፡ ራህዋ፡ ሄርሜላ፡ ቅሳነት፡ ስምረት# ካብ ሰማይ ሰማያት# በረኸት")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'efbd5aef-6f90-4215-9629-4471328970ca'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 1
Natna fiቕri sihibwo
Teseቒlu ab qeranyo gobo
Adiu entay belet haቑfa zeebeyet
Feቐdo bereኻ misu zitesedet

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 2
Entay iyu geru entay’yu bedilu
Melae akalatu bigemed qosilu
Natna fiቕri sihibwo
Teseቒlu ab qeranyo gobo

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 3
Qelayat kulom zigzulu
Nideqi sebat may ts’emiuni ilu
Demn rihats’n bigets’u enawerede
Kitbeki reaya eta rihrhti ide

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 4
Natna fiቕri sihibwo
Teseቒlu ab qeranyo gobo
Mekera keyferhe ziteኸtele
Yohans beኸye weyley enabele

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 5
Kisae mewedaeta bitbat ziseabo
Eneha adeኻ ilu niyohans habo
Natna fiቕri sihibwo
Teseቒlu ab qeranyo gobo

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 1
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
ኣዲኡ እንታይ በለት ሓቑፋ ዘዕበየት
ፈቐዶ በረኻ ምስኡ ዝተሰደት

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 2
እንታይ ኢዩ ጌሩ እንታይ’ዩ በዲሉ
መላእ ኣካላቱ ብገመድ ቆሲሉ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 3
ቀላያት ኩሎም ዝግዝኡሉ
ንደቂ ሰባት ማይ ጸሚኡኒ ኢሉ
ደምን ርሃጽን ብገጹ እናወረደ
ክትበኪ ረኣያ እታ ርህርህቲ ኢደ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 4
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
መከራ ከይፈርሐ ዝተኸተለ
ዮሓንስ በኸየ ወይለይ እናበለ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 5
ክሳዕ መወዳእታ ብትብዓት ዝሰዓቦ
እነሃ ኣዴኻ ኢሉ ንዮሃንስ ሃቦ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 1
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
ኣዲኡ እንታይ በለት ሓቑፋ ዘዕበየት
ፈቐዶ በረኻ ምስኡ ዝተሰደት

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 2
እንታይ ኢዩ ጌሩ እንታይ’ዩ በዲሉ
መላእ ኣካላቱ ብገመድ ቆሲሉ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 3
ቀላያት ኩሎም ዝግዝኡሉ
ንደቂ ሰባት ማይ ጸሚኡኒ ኢሉ
ደምን ርሃጽን ብገጹ እናወረደ
ክትበኪ ረኣያ እታ ርህርህቲ ኢደ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 4
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
መከራ ከይፈርሐ ዝተኸተለ
ዮሓንስ በኸየ ወይለይ እናበለ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 5
ክሳዕ መወዳእታ ብትብዓት ዝሰዓቦ
እነሃ ኣዴኻ ኢሉ ንዮሃንስ ሃቦ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ' THEN lyrics_amharic 
          ELSE 'CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 1
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
ኣዲኡ እንታይ በለት ሓቑፋ ዘዕበየት
ፈቐዶ በረኻ ምስኡ ዝተሰደት

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 2
እንታይ ኢዩ ጌሩ እንታይ’ዩ በዲሉ
መላእ ኣካላቱ ብገመድ ቆሲሉ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 3
ቀላያት ኩሎም ዝግዝኡሉ
ንደቂ ሰባት ማይ ጸሚኡኒ ኢሉ
ደምን ርሃጽን ብገጹ እናወረደ
ክትበኪ ረኣያ እታ ርህርህቲ ኢደ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 4
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
መከራ ከይፈርሐ ዝተኸተለ
ዮሓንስ በኸየ ወይለይ እናበለ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 5
ክሳዕ መወዳእታ ብትብዓት ዝሰዓቦ
እነሃ ኣዴኻ ኢሉ ንዮሃንስ ሃቦ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ' 
        END,
        lyrics_transliteration = 'CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 1
Natna fiቕri sihibwo
Teseቒlu ab qeranyo gobo
Adiu entay belet haቑfa zeebeyet
Feቐdo bereኻ misu zitesedet

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 2
Entay iyu geru entay’yu bedilu
Melae akalatu bigemed qosilu
Natna fiቕri sihibwo
Teseቒlu ab qeranyo gobo

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 3
Qelayat kulom zigzulu
Nideqi sebat may ts’emiuni ilu
Demn rihats’n bigets’u enawerede
Kitbeki reaya eta rihrhti ide

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 4
Natna fiቕri sihibwo
Teseቒlu ab qeranyo gobo
Mekera keyferhe ziteኸtele
Yohans beኸye weyley enabele

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu

VERSE 5
Kisae mewedaeta bitbat ziseabo
Eneha adeኻ ilu niyohans habo
Natna fiቕri sihibwo
Teseቒlu ab qeranyo gobo

CHORUS
Kab semay semayat nab midri weridu
Nideqi sebat ilu tewaridu
Hat’yat zeybahriu biamlaኽnetu
Mientay teseቒlu ab maekel shefatu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'efbd5aef-6f90-4215-9629-4471328970ca'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 1
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
ኣዲኡ እንታይ በለት ሓቑፋ ዘዕበየት
ፈቐዶ በረኻ ምስኡ ዝተሰደት

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 2
እንታይ ኢዩ ጌሩ እንታይ’ዩ በዲሉ
መላእ ኣካላቱ ብገመድ ቆሲሉ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 3
ቀላያት ኩሎም ዝግዝኡሉ
ንደቂ ሰባት ማይ ጸሚኡኒ ኢሉ
ደምን ርሃጽን ብገጹ እናወረደ
ክትበኪ ረኣያ እታ ርህርህቲ ኢደ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 4
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
መከራ ከይፈርሐ ዝተኸተለ
ዮሓንስ በኸየ ወይለይ እናበለ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ

VERSE 5
ክሳዕ መወዳእታ ብትብዓት ዝሰዓቦ
እነሃ ኣዴኻ ኢሉ ንዮሃንስ ሃቦ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ

CHORUS
ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ካብ ሰማይ ሰማያት ናብ ምድሪ ወሪዱ
ንደቂ ሰባት ኢሉ ተዋሪዱ
ሓጥያት ዘይባህሪኡ ብኣምላኽነቱ
ምእንታይ ተሰቒሉ ኣብ ማእከል ሸፋቱ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
ኣዲኡ እንታይ በለት ሓቑፋ ዘዕበየት
ፈቐዶ በረኻ ምስኡ ዝተሰደት
እንታይ ኢዩ ጌሩ እንታይ’ዩ በዲሉ
መላእ ኣካላቱ ብገመድ ቆሲሉ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
ቀላያት ኩሎም ዝግዝኡሉ
ንደቂ ሰባት ማይ ጸሚኡኒ ኢሉ
ደምን ርሃጽን ብገጹ እናወረደ
ክትበኪ ረኣያ እታ ርህርህቲ ኢደ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ
መከራ ከይፈርሐ ዝተኸተለ
ዮሓንስ በኸየ ወይለይ እናበለ
ክሳዕ መወዳእታ ብትብዓት ዝሰዓቦ
እነሃ ኣዴኻ ኢሉ ንዮሃንስ ሃቦ
ናትና ፍቕሪ ስሒብዎ
ተሰቒሉ ኣብ ቀራንዮ ጎቦ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'efbd5aef-6f90-4215-9629-4471328970ca'::uuid, 'siley-tesekilu-zemeriti-di-yowuhanisi-di-kibiromi-abeli-sanidiro-yieli-s', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-3105 ("ተዓዊትካ በልዎ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ae04c781-11ee-47fa-8c0b-1000f330aca8'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 1
Hiyaw''yu bimenfes aba belu
Ts’adቕ bahtawi gebre menfes Kidus
.ts’elotu zeslt’ aba belu
Ab qidmi amlaኹ aba belu

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 2
Ts’adቕ eyu ilkum nialem sibeኹ
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 3
.kem ts’hdi libanos aba belu
Kem siye ziferi aba belu
Gebre menfes Kidus hiruy nay fet’ari
.merawi mis mets’e aba belu

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 4
Keyhafr wedኻ aba belu
Aboy adleni kab zeyti mahtotka
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 5
Aba aba aba belu kibru nigeru
.nay wengel sebaኺ aba belu
Kem p’et’ros kem p’awlos aba belu
Hadsh hewarya gebre menfes Kidus

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 6
.simka mis nits’we aba belu
Kidanka zekirna aba belu
Kab liul fet’ari mihret lemnelna
.teawitka belwo fire gibru meskru

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 7
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.kem ts’hdi libanos aba belu
Kem siye ziferi aba belu

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 8
Gebre menfes Kidus hiruy nay fet’ari
.merawi mis mets’e aba belu
Keyhafr wedኻ
Aboy adlenikab zeyti mahtotka

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 9
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 1
ሕያው''ዩ ብመንፈስ ኣባ በሉ
ጻድቕ ባሕታዊ ገብረ መንፈስ ቅዱስ
.ጸሎቱ ዘስልጥ ኣባ በሉ
ኣብ ቅድሚ ኣምላኹ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 2
ጻድቕ እዩ ኢልኩም ንዓለም ስበኹ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 3
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 4
ከይሓፍር ወድኻ ኣባ በሉ
ኣቦይ ዓድለኒ ካብ ዘይቲ ማህቶትካ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 5
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ናይ ወንጌል ሰባኺ ኣባ በሉ
ከም ጴጥሮስ ከም ጳውሎስ ኣባ በሉ
ሓድሽ ሐዋርያ ገብረ መንፈስ ቅዱስ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 6
.ስምካ ምስ ንጽውዕ ኣባ በሉ
ኪዳንካ ዘኪርና ኣባ በሉ
ካብ ልዑል ፈጣሪ ምሕረት ለምነልና
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 7
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 8
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ
ከይሓፍር ወድኻ
ኣቦይ ዓድለኒካብ ዘይቲ ማህቶትካ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 9
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 1
ሕያው''ዩ ብመንፈስ ኣባ በሉ
ጻድቕ ባሕታዊ ገብረ መንፈስ ቅዱስ
.ጸሎቱ ዘስልጥ ኣባ በሉ
ኣብ ቅድሚ ኣምላኹ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 2
ጻድቕ እዩ ኢልኩም ንዓለም ስበኹ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 3
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 4
ከይሓፍር ወድኻ ኣባ በሉ
ኣቦይ ዓድለኒ ካብ ዘይቲ ማህቶትካ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 5
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ናይ ወንጌል ሰባኺ ኣባ በሉ
ከም ጴጥሮስ ከም ጳውሎስ ኣባ በሉ
ሓድሽ ሐዋርያ ገብረ መንፈስ ቅዱስ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 6
.ስምካ ምስ ንጽውዕ ኣባ በሉ
ኪዳንካ ዘኪርና ኣባ በሉ
ካብ ልዑል ፈጣሪ ምሕረት ለምነልና
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 7
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 8
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ
ከይሓፍር ወድኻ
ኣቦይ ዓድለኒካብ ዘይቲ ማህቶትካ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 9
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ' THEN lyrics_amharic 
          ELSE 'CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 1
ሕያው''ዩ ብመንፈስ ኣባ በሉ
ጻድቕ ባሕታዊ ገብረ መንፈስ ቅዱስ
.ጸሎቱ ዘስልጥ ኣባ በሉ
ኣብ ቅድሚ ኣምላኹ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 2
ጻድቕ እዩ ኢልኩም ንዓለም ስበኹ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 3
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 4
ከይሓፍር ወድኻ ኣባ በሉ
ኣቦይ ዓድለኒ ካብ ዘይቲ ማህቶትካ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 5
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ናይ ወንጌል ሰባኺ ኣባ በሉ
ከም ጴጥሮስ ከም ጳውሎስ ኣባ በሉ
ሓድሽ ሐዋርያ ገብረ መንፈስ ቅዱስ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 6
.ስምካ ምስ ንጽውዕ ኣባ በሉ
ኪዳንካ ዘኪርና ኣባ በሉ
ካብ ልዑል ፈጣሪ ምሕረት ለምነልና
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 7
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 8
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ
ከይሓፍር ወድኻ
ኣቦይ ዓድለኒካብ ዘይቲ ማህቶትካ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 9
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ' 
        END,
        lyrics_transliteration = 'CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 1
Hiyaw''yu bimenfes aba belu
Ts’adቕ bahtawi gebre menfes Kidus
.ts’elotu zeslt’ aba belu
Ab qidmi amlaኹ aba belu

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 2
Ts’adቕ eyu ilkum nialem sibeኹ
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 3
.kem ts’hdi libanos aba belu
Kem siye ziferi aba belu
Gebre menfes Kidus hiruy nay fet’ari
.merawi mis mets’e aba belu

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 4
Keyhafr wedኻ aba belu
Aboy adleni kab zeyti mahtotka
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 5
Aba aba aba belu kibru nigeru
.nay wengel sebaኺ aba belu
Kem p’et’ros kem p’awlos aba belu
Hadsh hewarya gebre menfes Kidus

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 6
.simka mis nits’we aba belu
Kidanka zekirna aba belu
Kab liul fet’ari mihret lemnelna
.teawitka belwo fire gibru meskru

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 7
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.kem ts’hdi libanos aba belu
Kem siye ziferi aba belu

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 8
Gebre menfes Kidus hiruy nay fet’ari
.merawi mis mets’e aba belu
Keyhafr wedኻ
Aboy adlenikab zeyti mahtotka

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu

VERSE 9
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru

CHORUS
.teawitka belwo fire gibru meskru
Nay gebre menfes Kidus t’um zena nigeru
Aba aba aba belu kibru nigeru
.ziኽru nebari''yu aba belu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ae04c781-11ee-47fa-8c0b-1000f330aca8'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 1
ሕያው''ዩ ብመንፈስ ኣባ በሉ
ጻድቕ ባሕታዊ ገብረ መንፈስ ቅዱስ
.ጸሎቱ ዘስልጥ ኣባ በሉ
ኣብ ቅድሚ ኣምላኹ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 2
ጻድቕ እዩ ኢልኩም ንዓለም ስበኹ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 3
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 4
ከይሓፍር ወድኻ ኣባ በሉ
ኣቦይ ዓድለኒ ካብ ዘይቲ ማህቶትካ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 5
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ናይ ወንጌል ሰባኺ ኣባ በሉ
ከም ጴጥሮስ ከም ጳውሎስ ኣባ በሉ
ሓድሽ ሐዋርያ ገብረ መንፈስ ቅዱስ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 6
.ስምካ ምስ ንጽውዕ ኣባ በሉ
ኪዳንካ ዘኪርና ኣባ በሉ
ካብ ልዑል ፈጣሪ ምሕረት ለምነልና
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 7
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 8
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ
ከይሓፍር ወድኻ
ኣቦይ ዓድለኒካብ ዘይቲ ማህቶትካ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ

VERSE 9
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ

CHORUS
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ'
        OR lyrics_amharic IS NOT DISTINCT FROM '.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ዝኽሩ ነባሪ''ዩ ኣባ በሉ
ሕያው''ዩ ብመንፈስ ኣባ በሉ
ጻድቕ ባሕታዊ ገብረ መንፈስ ቅዱስ
.ጸሎቱ ዘስልጥ ኣባ በሉ
ኣብ ቅድሚ ኣምላኹ ኣባ በሉ
ጻድቕ እዩ ኢልኩም ንዓለም ስበኹ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ
ከይሓፍር ወድኻ ኣባ በሉ
ኣቦይ ዓድለኒ ካብ ዘይቲ ማህቶትካ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ናይ ወንጌል ሰባኺ ኣባ በሉ
ከም ጴጥሮስ ከም ጳውሎስ ኣባ በሉ
ሓድሽ ሐዋርያ ገብረ መንፈስ ቅዱስ
.ስምካ ምስ ንጽውዕ ኣባ በሉ
ኪዳንካ ዘኪርና ኣባ በሉ
ካብ ልዑል ፈጣሪ ምሕረት ለምነልና
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ
.ከም ጽሕዲ ሊባኖስ ኣባ በሉ
ከም ስየ ዝፈሪ ኣባ በሉ
ገብረ መንፈስ ቅዱስ ሕሩይ ናይ ፈጣሪ
.መርዓዊ ምስ መጸ ኣባ በሉ
ከይሓፍር ወድኻ
ኣቦይ ዓድለኒካብ ዘይቲ ማህቶትካ
.ተዓዊትካ በልዎ ፍረ ግብሩ መስክሩ
ናይ ገብረ መንፈስ ቅዱስ ጥዑም ዜና ንገሩ
ኣባ ኣባ ኣባ በሉ ክብሩ ንገሩ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ae04c781-11ee-47fa-8c0b-1000f330aca8'::uuid, 'eritrean-orthodox-tewahdo-mezmur-3105', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nu-lemisigana ("ኑ ለምስጋና")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f7fb8865-8c70-4350-925b-94ee1af0451e'::uuid
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
    WHERE import_id = 'f7fb8865-8c70-4350-925b-94ee1af0451e'::uuid
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
        'f7fb8865-8c70-4350-925b-94ee1af0451e'::uuid, 'nu-lemisigana', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- year-orthodox-mezmure ("ዘመን ሰጠን ጌታ የእንቁጣጣሽ ዝማሬ የአዲስ አመት መዝሙር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '08d0b322-bc8c-4a36-b3d0-3064d7db6a75'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 1
Yihw ezih aderesen ;
T’ebqotu sayleyen
Yadefew sibena yarejew mannet
Het’yat yashenefew yetesmamaw widqet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 2
Yeqedemew adam tinsaew derese
Beiyesus Kristos hiywetu tadese
Amet’aln adis zemen adis amet
Asebeln dagm edl dagm hiywet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 3
Endnnor ende mikru ende hesabu
Bemiyazelqew bet’ebabu menged gibu
Keante teleyayten riqen lezemenat
Sinmaqq bemot t’ar tet’emten mihret

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 4
Yegeza kindhn sededkew leyqrta
Tebedleh kasken bemebeqel fenta
Amet’aln adis zemen adis amet
Asebeln dagm edl dagm hiywet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 5
Bech’elemaw hiywetachn wet’ach jember
Lijh simot jemern egna yedl mezmur
Shi gize eyebedeln ante egnan sitmr
Ch’eknen sinsheshh sitqerben befqr

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 6
Elf amet alefen endih eyababelken
Beabatnet fiqr endeteshekemken
Amet’aln adis zemen adis amet
Asebeln dagm edl dagm hiywet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 7
Yichin amet litagesen wededena
Zemen set’en beedmeachn lay ch’emerena
Libachn ts’nu new keto aydenegt’m
Qalhn tedegfwal aynewawet’m

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 8
Shenbeqo silaydel yetemerekoznew
Tesebro ayt’lenm anten new yamnew
Amet’aln adis zemen adis amet
Asebeln dagm edl dagm hiywet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 9
Eske shbet yanorenal eyemare
Tamagn new qalu fits’um yalteshare

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 1
ይህው እዚህ አደረሰን ፤
ጠብቆቱ ሳይለየን
ያደፈው ስብዕና ያረጀው ማንነት
ሀጥያት ያሸነፈው የተስማማው ውድቀት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 2
የቀደመው አዳም ትንሳኤው ደረሰ
በኢየሱስ ክርስቶስ ህይወቱ ታደሰ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 3
እንድንኖር እንደ ምክሩ እንደ ሀሳቡ
በሚያዘልቀው በጠባቡ መንገድ ግቡ
ከአንተ ተለያይተን ርቀን ለዘመናት
ስንማቅቅ በሞት ጣር ተጠምተን ምህረት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 4
የገዛ ክንድህን ሰደድከው ለይቅርታ
ተበድለህ ካስከን በመበቀል ፈንታ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 5
በጨለማው ህይወታችን ወጣች ጀምበር
ልጅህ ሲሞት ጀመርን እኛ የድል መዝሙር
ሺ ጊዜ እየበደልን አንተ እኛን ስትምር
ጨክነን ስንሸሽህ ስትቀርበን በፍቅር

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 6
እልፍ አመት አለፈን እንዲህ እያባበልከን
በአባትነት ፍቅር እንደተሸከምከን
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 7
ይቺን አመት ሊታገሰን ወደደና
ዘመን ሰጠን በእድሜአችን ላይ ጨመረና
ልባችን ፅኑ ነው ከቶ አይደነግጥም
ቃልህን ተደግፏል አይነዋወጥም

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 8
ሸንበቆ ስላይደል የተመረኮዝነው
ተሰብሮ አይጥለንም አንተን ነው ያምነው
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 9
እስከ ሽበት ያኖረናል እየማረ
ታማኝ ነው ቃሉ ፍፁም ያልተሻረ

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 1
ይህው እዚህ አደረሰን ፤
ጠብቆቱ ሳይለየን
ያደፈው ስብዕና ያረጀው ማንነት
ሀጥያት ያሸነፈው የተስማማው ውድቀት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 2
የቀደመው አዳም ትንሳኤው ደረሰ
በኢየሱስ ክርስቶስ ህይወቱ ታደሰ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 3
እንድንኖር እንደ ምክሩ እንደ ሀሳቡ
በሚያዘልቀው በጠባቡ መንገድ ግቡ
ከአንተ ተለያይተን ርቀን ለዘመናት
ስንማቅቅ በሞት ጣር ተጠምተን ምህረት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 4
የገዛ ክንድህን ሰደድከው ለይቅርታ
ተበድለህ ካስከን በመበቀል ፈንታ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 5
በጨለማው ህይወታችን ወጣች ጀምበር
ልጅህ ሲሞት ጀመርን እኛ የድል መዝሙር
ሺ ጊዜ እየበደልን አንተ እኛን ስትምር
ጨክነን ስንሸሽህ ስትቀርበን በፍቅር

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 6
እልፍ አመት አለፈን እንዲህ እያባበልከን
በአባትነት ፍቅር እንደተሸከምከን
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 7
ይቺን አመት ሊታገሰን ወደደና
ዘመን ሰጠን በእድሜአችን ላይ ጨመረና
ልባችን ፅኑ ነው ከቶ አይደነግጥም
ቃልህን ተደግፏል አይነዋወጥም

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 8
ሸንበቆ ስላይደል የተመረኮዝነው
ተሰብሮ አይጥለንም አንተን ነው ያምነው
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 9
እስከ ሽበት ያኖረናል እየማረ
ታማኝ ነው ቃሉ ፍፁም ያልተሻረ

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን' THEN lyrics_amharic 
          ELSE 'CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 1
ይህው እዚህ አደረሰን ፤
ጠብቆቱ ሳይለየን
ያደፈው ስብዕና ያረጀው ማንነት
ሀጥያት ያሸነፈው የተስማማው ውድቀት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 2
የቀደመው አዳም ትንሳኤው ደረሰ
በኢየሱስ ክርስቶስ ህይወቱ ታደሰ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 3
እንድንኖር እንደ ምክሩ እንደ ሀሳቡ
በሚያዘልቀው በጠባቡ መንገድ ግቡ
ከአንተ ተለያይተን ርቀን ለዘመናት
ስንማቅቅ በሞት ጣር ተጠምተን ምህረት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 4
የገዛ ክንድህን ሰደድከው ለይቅርታ
ተበድለህ ካስከን በመበቀል ፈንታ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 5
በጨለማው ህይወታችን ወጣች ጀምበር
ልጅህ ሲሞት ጀመርን እኛ የድል መዝሙር
ሺ ጊዜ እየበደልን አንተ እኛን ስትምር
ጨክነን ስንሸሽህ ስትቀርበን በፍቅር

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 6
እልፍ አመት አለፈን እንዲህ እያባበልከን
በአባትነት ፍቅር እንደተሸከምከን
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 7
ይቺን አመት ሊታገሰን ወደደና
ዘመን ሰጠን በእድሜአችን ላይ ጨመረና
ልባችን ፅኑ ነው ከቶ አይደነግጥም
ቃልህን ተደግፏል አይነዋወጥም

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 8
ሸንበቆ ስላይደል የተመረኮዝነው
ተሰብሮ አይጥለንም አንተን ነው ያምነው
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 9
እስከ ሽበት ያኖረናል እየማረ
ታማኝ ነው ቃሉ ፍፁም ያልተሻረ

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን' 
        END,
        lyrics_transliteration = 'CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 1
Yihw ezih aderesen ;
T’ebqotu sayleyen
Yadefew sibena yarejew mannet
Het’yat yashenefew yetesmamaw widqet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 2
Yeqedemew adam tinsaew derese
Beiyesus Kristos hiywetu tadese
Amet’aln adis zemen adis amet
Asebeln dagm edl dagm hiywet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 3
Endnnor ende mikru ende hesabu
Bemiyazelqew bet’ebabu menged gibu
Keante teleyayten riqen lezemenat
Sinmaqq bemot t’ar tet’emten mihret

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 4
Yegeza kindhn sededkew leyqrta
Tebedleh kasken bemebeqel fenta
Amet’aln adis zemen adis amet
Asebeln dagm edl dagm hiywet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 5
Bech’elemaw hiywetachn wet’ach jember
Lijh simot jemern egna yedl mezmur
Shi gize eyebedeln ante egnan sitmr
Ch’eknen sinsheshh sitqerben befqr

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 6
Elf amet alefen endih eyababelken
Beabatnet fiqr endeteshekemken
Amet’aln adis zemen adis amet
Asebeln dagm edl dagm hiywet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 7
Yichin amet litagesen wededena
Zemen set’en beedmeachn lay ch’emerena
Libachn ts’nu new keto aydenegt’m
Qalhn tedegfwal aynewawet’m

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 8
Shenbeqo silaydel yetemerekoznew
Tesebro ayt’lenm anten new yamnew
Amet’aln adis zemen adis amet
Asebeln dagm edl dagm hiywet

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen

VERSE 9
Eske shbet yanorenal eyemare
Tamagn new qalu fits’um yalteshare

CHORUS
Aderesen degmo leadis amet leadis zemen
Bemayzlew kindw teshekmo endeyazen
Yihw ezih aderesen ;
Rihrahew eyagezen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '08d0b322-bc8c-4a36-b3d0-3064d7db6a75'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 1
ይህው እዚህ አደረሰን ፤
ጠብቆቱ ሳይለየን
ያደፈው ስብዕና ያረጀው ማንነት
ሀጥያት ያሸነፈው የተስማማው ውድቀት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 2
የቀደመው አዳም ትንሳኤው ደረሰ
በኢየሱስ ክርስቶስ ህይወቱ ታደሰ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 3
እንድንኖር እንደ ምክሩ እንደ ሀሳቡ
በሚያዘልቀው በጠባቡ መንገድ ግቡ
ከአንተ ተለያይተን ርቀን ለዘመናት
ስንማቅቅ በሞት ጣር ተጠምተን ምህረት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 4
የገዛ ክንድህን ሰደድከው ለይቅርታ
ተበድለህ ካስከን በመበቀል ፈንታ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 5
በጨለማው ህይወታችን ወጣች ጀምበር
ልጅህ ሲሞት ጀመርን እኛ የድል መዝሙር
ሺ ጊዜ እየበደልን አንተ እኛን ስትምር
ጨክነን ስንሸሽህ ስትቀርበን በፍቅር

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 6
እልፍ አመት አለፈን እንዲህ እያባበልከን
በአባትነት ፍቅር እንደተሸከምከን
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 7
ይቺን አመት ሊታገሰን ወደደና
ዘመን ሰጠን በእድሜአችን ላይ ጨመረና
ልባችን ፅኑ ነው ከቶ አይደነግጥም
ቃልህን ተደግፏል አይነዋወጥም

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 8
ሸንበቆ ስላይደል የተመረኮዝነው
ተሰብሮ አይጥለንም አንተን ነው ያምነው
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን

VERSE 9
እስከ ሽበት ያኖረናል እየማረ
ታማኝ ነው ቃሉ ፍፁም ያልተሻረ

CHORUS
አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን'
        OR lyrics_amharic IS NOT DISTINCT FROM 'አደረሰን ደግሞ ለአዲስ አመት ለአዲስ ዘመን
በማይዝለው ክንድው ተሸክሞ እንደያዘን
ይህው እዚህ አደረሰን ፤
ርህራሄው እያገዘን
ይህው እዚህ አደረሰን ፤
ጠብቆቱ ሳይለየን
ያደፈው ስብዕና ያረጀው ማንነት
ሀጥያት ያሸነፈው የተስማማው ውድቀት
የቀደመው አዳም ትንሳኤው ደረሰ
በኢየሱስ ክርስቶስ ህይወቱ ታደሰ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት
እንድንኖር እንደ ምክሩ እንደ ሀሳቡ
በሚያዘልቀው በጠባቡ መንገድ ግቡ
ከአንተ ተለያይተን ርቀን ለዘመናት
ስንማቅቅ በሞት ጣር ተጠምተን ምህረት
የገዛ ክንድህን ሰደድከው ለይቅርታ
ተበድለህ ካስከን በመበቀል ፈንታ
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት
በጨለማው ህይወታችን ወጣች ጀምበር
ልጅህ ሲሞት ጀመርን እኛ የድል መዝሙር
ሺ ጊዜ እየበደልን አንተ እኛን ስትምር
ጨክነን ስንሸሽህ ስትቀርበን በፍቅር
እልፍ አመት አለፈን እንዲህ እያባበልከን
በአባትነት ፍቅር እንደተሸከምከን
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት
ይቺን አመት ሊታገሰን ወደደና
ዘመን ሰጠን በእድሜአችን ላይ ጨመረና
ልባችን ፅኑ ነው ከቶ አይደነግጥም
ቃልህን ተደግፏል አይነዋወጥም
ሸንበቆ ስላይደል የተመረኮዝነው
ተሰብሮ አይጥለንም አንተን ነው ያምነው
አመጣልን አዲስ ዘመን አዲስ አመት
አሰበልን ዳግም እድል ዳግም ህይወት
እስከ ሽበት ያኖረናል እየማረ
ታማኝ ነው ቃሉ ፍፁም ያልተሻረ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '08d0b322-bc8c-4a36-b3d0-3064d7db6a75'::uuid, 'year-orthodox-mezmure', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yedenagil-memekiya-yenebiyat-awude-amet-orthodox-mezmur ("የደናግል መመኪያ የነቢያት ገዳም አውደ ዓመት ኦርቶዶክስ መዝሙር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'df32b71b-6000-4ca5-86d3-369f7d989c3a'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun

VERSE 1
Yednagl memekiya yenebyat gedam
Awde ametun barkiln Dingil Maryam
Teraraw ziq yibel t’emamawm yiqna
Kaltestekakele menged yelemna

CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun

VERSE 2
Yeegziabhern menged nimesrt hulachn
Malefiya endihonen lemech’w hebtachn

CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun

VERSE 3
Hulet libsoch yalut kemabzat libsn
Lelelew yadlew huletegnawn
Kebedelachnm ants’an ebakhn
Bekfu endant’efa egna barochhn

CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun

VERSE 4
Kifatna tenkol kelbachn yit’fa
Ts’dq na rihrahe beegna lay yisfafa
Sigana demhn bekbr aggntenal
Hiywet endihonen amlak temats’nenal

CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 1
የድናግል መመኪያ የነብያት ገዳም
ዐውደ አመቱን ባርኪልን ድንግል ማርያም
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 2
የእግዚአብሔርን መንገድ ንመሥርት ሁላችን
ማለፊያ እንዲሆነን ለመጭው ሀብታችን

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 3
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንፃን እባክህን
በክፉ እንዳንጠፋ እኛ ባሮችህን

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 4
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅ ና ርኅራሄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል
ሕይወት እንዲሆነን አምላክ ተማጽነናል

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 1
የድናግል መመኪያ የነብያት ገዳም
ዐውደ አመቱን ባርኪልን ድንግል ማርያም
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 2
የእግዚአብሔርን መንገድ ንመሥርት ሁላችን
ማለፊያ እንዲሆነን ለመጭው ሀብታችን

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 3
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንፃን እባክህን
በክፉ እንዳንጠፋ እኛ ባሮችህን

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 4
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅ ና ርኅራሄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል
ሕይወት እንዲሆነን አምላክ ተማጽነናል

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን' THEN lyrics_amharic 
          ELSE 'CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 1
የድናግል መመኪያ የነብያት ገዳም
ዐውደ አመቱን ባርኪልን ድንግል ማርያም
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 2
የእግዚአብሔርን መንገድ ንመሥርት ሁላችን
ማለፊያ እንዲሆነን ለመጭው ሀብታችን

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 3
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንፃን እባክህን
በክፉ እንዳንጠፋ እኛ ባሮችህን

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 4
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅ ና ርኅራሄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል
ሕይወት እንዲሆነን አምላክ ተማጽነናል

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን' 
        END,
        lyrics_transliteration = 'CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun

VERSE 1
Yednagl memekiya yenebyat gedam
Awde ametun barkiln Dingil Maryam
Teraraw ziq yibel t’emamawm yiqna
Kaltestekakele menged yelemna

CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun

VERSE 2
Yeegziabhern menged nimesrt hulachn
Malefiya endihonen lemech’w hebtachn

CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun

VERSE 3
Hulet libsoch yalut kemabzat libsn
Lelelew yadlew huletegnawn
Kebedelachnm ants’an ebakhn
Bekfu endant’efa egna barochhn

CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun

VERSE 4
Kifatna tenkol kelbachn yit’fa
Ts’dq na rihrahe beegna lay yisfafa
Sigana demhn bekbr aggntenal
Hiywet endihonen amlak temats’nenal

CHORUS
Yeawaj negeri qal beberha ayele
Yeegziabhern menged astekaklu eyale
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'df32b71b-6000-4ca5-86d3-369f7d989c3a'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 1
የድናግል መመኪያ የነብያት ገዳም
ዐውደ አመቱን ባርኪልን ድንግል ማርያም
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 2
የእግዚአብሔርን መንገድ ንመሥርት ሁላችን
ማለፊያ እንዲሆነን ለመጭው ሀብታችን

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 3
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንፃን እባክህን
በክፉ እንዳንጠፋ እኛ ባሮችህን

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 4
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅ ና ርኅራሄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል
ሕይወት እንዲሆነን አምላክ ተማጽነናል

CHORUS
የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን'
        OR lyrics_amharic IS NOT DISTINCT FROM 'የአዋጅ ነገሪ ቃል በበርሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን
የድናግል መመኪያ የነብያት ገዳም
ዐውደ አመቱን ባርኪልን ድንግል ማርያም
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና
የእግዚአብሔርን መንገድ ንመሥርት ሁላችን
ማለፊያ እንዲሆነን ለመጭው ሀብታችን
አዝ......
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንፃን እባክህን
በክፉ እንዳንጠፋ እኛ ባሮችህን
አዝ......
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅ ና ርኅራሄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል
ሕይወት እንዲሆነን አምላክ ተማጽነናል'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'df32b71b-6000-4ca5-86d3-369f7d989c3a'::uuid, 'yedenagil-memekiya-yenebiyat-awude-amet-orthodox-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- buhe-belu ("ቡሄ በሉ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '60029398-4a0a-4356-a52a-d2fd257eb350'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 1
Fitu ende ts’ehey - ho berto yetayew -ho
Libsu endebrhan -ho yants’ebareqew -ho
Dimts’hn semana bebhru demena (2)
Yebuhew birhan legna met’aln (2)

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 2
Yaeqob yohens-ho endihum p’et’ros-ho
Amlakn ayut - - ho muse elyas - ho
Abatum ale - - ho lijen simut - - ho
Qale newna - - ho yeweledkut - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 3
CHORUS
Tabor armonem-ho birhan tayebachew ho
Keqdus terara ho simh des alachew- ho
Selam selam - - ho yetabor terara - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 4
Birhene melekot - ho banchi lay abera -ho
CHORUS
Betewahdo - - ho Weld yekeberew - ho
YeEgziabher Ab lij - - ho weldemaryam new - -ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 5
Buhe belu - - ho buhe belu - - ho
Yeadam lijoch - - ho birhann - - ho teqebelu - -ho
CHORUS
Abate bet - - ho alegn leket - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 6
Enate bet - - ho alegn leket - - ho
Keagotem bet - - - ho alegn leket - ho
Tekemrwal - - ho ende kubet - - ho
CHORUS

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 7
Yeamet limdachn - - ho ket’nt yemet’aw - - ho
Ketekemerew - ho kemesobu yiwt’a - ho
Kedebre tabor - - ho Geta selemet’a - ho
Yetegagerew - ho mulmulu yimt’a - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 8
CHORUS
Ityop’yawyan - -ho tarik yalachhu - ho
Bahlachhun - ho yazu at’bqachhu - ho
Chbown abrut -ho endabatochachhu -ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 9
Mist’ir silalew -ho des yibelachhu -ho
CHORUS
Abatochachn - - ho yaweresun - - ho
Yebuhen tirgum - - ho yasawequn - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 10
Endnt’ebqew - ho leegna yeset’un - ho
Yihn newna - - ho yasrekebun - - ho
CHORUS
Ledngl Maryam ho asrat yehonsh ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 11
Kidusan ts’adqan - - ho yemolubsh - - ho
Bereketachew - - ho yaderebsh - - ho
Hulem engdoch - ho yemiyarfubsh -ho
Hegere Egziabher -ho ityop’ya nesh ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 12
CHORUS
Lehewaryat - - ho yelake menfes - - ho
Zarem leityop’ya -ho ts’egawn yafss ho
Bebego migbar - ho endntanets’ - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 13
Beqn libona - ho bet’ru menfes - - ho
Berekete buhe - ho lehulachn፹ yidres - ho
Amet awdamet digem ena amet digem ena
Begashye be digem ena amet digem ena

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 14
Yawrd bereket digem ena amet digem ena
Werq yifsesbet digem ena amet digem ena
Beemamye bet digem ena amet digem ena
Yigba bereket digem ena amet digem ena

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 15
Marna wetet digem ena amet digem ena
Yitrefref beewnet digem ena amet digem ena
Endihu endalachhu - -befqr ayleyachhu - - befqr
Lametu beselam - - befqr yadrsachhu - - befqr

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 16
Kristos beqegnu - - befqr yaqumachhu - - befqr
Yemengstu werash - - befqr yadrgachhu - - befqr
Endihu endalen - - befqr ayleyen - - befqr
Leametu beselam - - befqr yadrsen - - befqr

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 17
Amanuel beqegnu - - befqr yaqumen - - befqr
Yemengstu werash - - befqr yadrgen - - befqr
Yeqdusan melakt yets’adqan semaetat
Redet bereket yigba behulum bet

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 18
Behulum bet (2) yigba bereket (2)
Enqum behaymanot ts’enten betgat
Yeasrat ager yeabew qedemt
Yeqdusan abatoch tiwfit

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 19
Yigebalna lint’ebq beewnet
Bahlachnn yeabatoch tiwfit (3)

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 1
ፊቱ እንደ ፀሐይ - ሆ በርቶ የታየው -ሆ
ልብሱ እንደብርሃን -ሆ ያንፀባረቀው -ሆ
ድምጽህን ሰማና በብህሩ ደመና(፪)
የቡሄው ብርሃን ለኛ መጣልን(፪)

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 2
ያዕቆብ ዮሐንስ-ሆ እንዲሁም ጴጥሮስ-ሆ
አምላክን አዩት - - ሆ ሙሴ ኤልያስ - ሆ
አባቱም አለ - - ሆ ልጄን ስሙት - - ሆ
ቃሌ ነውና - - ሆ የወለድኩት - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 3
አዝ
ታቦር አርሞንኤም-ሆ ብርሃን ታየባቸው ሆ
ከቅዱስ ተራራ ሆ ስምህ ደስ አላቸው- ሆ
ሰላም ሰላም - - ሆ የታቦር ተራራ - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 4
ብርሀነ መለኮት - ሆ ባንቺ ላይ አበራ -ሆ
አዝ
በተዋህዶ - - ሆ ወልድ የከበረው - ሆ
የእግዚአብሔር አብ ልጅ - - ሆ ወልደማርያም ነው - -ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 5
ቡሄ በሉ - - ሆ ቡሄ በሉ - - ሆ
የአዳም ልጆች - - ሆ ብርሃንን - - ሆ ተቀበሉ - -ሆ
አዝ
አባቴ ቤት - - ሆ አለኝ ለከት - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 6
እናቴ ቤት - - ሆ አለኝ ለከት - - ሆ
ከአጎቴም ቤት - - - ሆ አለኝ ለከት - ሆ
ተከምሯል - - ሆ እንደ ኩበት - - ሆ
አዝ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 7
የዓመት ልምዳችን - - ሆ ከጥንት የመጣው - - ሆ
ከተከመረው - ሆ ከመሶቡ ይውጣ - ሆ
ከደብረ ታቦር - - ሆ ጌታ ሰለመጣ - ሆ
የተጋገረው - ሆ ሙልሙሉ ይምጣ - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 8
አዝ
ኢትዮጵያውያን - -ሆ ታሪክ ያላችሁ - ሆ
ባህላችሁን - ሆ ያዙ አጥብቃችሁ - ሆ
ችቦውን አብሩት -ሆ እንዳባቶቻችሁ -ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 9
ምስጢር ስላለው -ሆ ደስ ይበላችሁ -ሆ
አዝ
አባቶቻችን - - ሆ ያወረሱን - - ሆ
የቡሄን ትርጉም - - ሆ ያሳወቁን - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 10
እንድንጠብቀው - ሆ ለእኛ የሰጡን - ሆ
ይህን ነውና - - ሆ ያስረከቡን - - ሆ
አዝ
ለድንግል ማርያም ሆ አሥራት የሆንሽ ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 11
ቅዱሳን ጻድቃን - - ሆ የሞሉብሽ - - ሆ
በረከታቸው - - ሆ ያደረብሽ - - ሆ
ሁሌም እንግዶች - ሆ የሚያርፉብሽ -ሆ
ሀገረ እግዚአብሔር -ሆ ኢትዮጵያ ነሽ ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 12
አዝ
ለሐዋርያት - - ሆ የላከ መንፈስ - - ሆ
ዛሬም ለኢትዮጵያ -ሆ ጸጋውን ያፍስስ ሆ
በበጎ ምግባር - ሆ እንድንታነጽ - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 13
በቅን ልቦና - ሆ በጥሩ መንፈስ - - ሆ
በረከተ ቡሄ - ሆ ለሁላችን፹ ይድረስ - ሆ
ዓመት ዓውዳመት ድገም እና ዓመት ድገም እና
በጋሽዬ ቤ ድገም እና ዓመት ድገም እና

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 14
ያውርድ በረከት ድገም እና ዓመት ድገም እና
ወርቅ ይፍሰስበት ድገም እና ዓመት ድገም እና
በእማምዬ ቤት ድገም እና ዓመት ድገም እና
ይግባ በረከት ድገም እና ዓመት ድገም እና

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 15
ማርና ወተት ድገም እና ዓመት ድገም እና
ይትረፍረፍ በእውነት ድገም እና ዓመት ድገም እና
እንዲሁ እንዳላችሁ - -በፍቅር አይለያችሁ - - በፍቅር
ላመቱ በሰላም - - በፍቅር ያድርሳችሁ - - በፍቅር

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 16
ክርስቶስ በቀኙ - - በፍቅር ያቁማችሁ - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርጋችሁ - - በፍቅር
እንዲሁ እንዳለን - - በፍቅር አይለየን - - በፍቅር
ለዓመቱ በሰላም - - በፍቅር ያድርሰን - - በፍቅር

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 17
አማኑኤል በቀኙ - - በፍቅር ያቁመን - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርገን - - በፍቅር
የቅዱሳን መላክት የፃድቃን ሰማዕታት
ረድኤት በረከት ይግባ በሁሉም ቤት

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 18
በሁሉም ቤት(፪) ይግባ በረከት(፪)
እንቁም በሃይማኖት ፀንተን በትጋት
የአስራት አገር የአበው ቀደምት
የቅዱሳን አባቶች ትውፊት

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 19
ይገባልና ልንጠብቅ በእውነት
ባህላችንን የአባቶች ትውፊት (፫)

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 1
ፊቱ እንደ ፀሐይ - ሆ በርቶ የታየው -ሆ
ልብሱ እንደብርሃን -ሆ ያንፀባረቀው -ሆ
ድምጽህን ሰማና በብህሩ ደመና(፪)
የቡሄው ብርሃን ለኛ መጣልን(፪)

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 2
ያዕቆብ ዮሐንስ-ሆ እንዲሁም ጴጥሮስ-ሆ
አምላክን አዩት - - ሆ ሙሴ ኤልያስ - ሆ
አባቱም አለ - - ሆ ልጄን ስሙት - - ሆ
ቃሌ ነውና - - ሆ የወለድኩት - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 3
አዝ
ታቦር አርሞንኤም-ሆ ብርሃን ታየባቸው ሆ
ከቅዱስ ተራራ ሆ ስምህ ደስ አላቸው- ሆ
ሰላም ሰላም - - ሆ የታቦር ተራራ - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 4
ብርሀነ መለኮት - ሆ ባንቺ ላይ አበራ -ሆ
አዝ
በተዋህዶ - - ሆ ወልድ የከበረው - ሆ
የእግዚአብሔር አብ ልጅ - - ሆ ወልደማርያም ነው - -ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 5
ቡሄ በሉ - - ሆ ቡሄ በሉ - - ሆ
የአዳም ልጆች - - ሆ ብርሃንን - - ሆ ተቀበሉ - -ሆ
አዝ
አባቴ ቤት - - ሆ አለኝ ለከት - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 6
እናቴ ቤት - - ሆ አለኝ ለከት - - ሆ
ከአጎቴም ቤት - - - ሆ አለኝ ለከት - ሆ
ተከምሯል - - ሆ እንደ ኩበት - - ሆ
አዝ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 7
የዓመት ልምዳችን - - ሆ ከጥንት የመጣው - - ሆ
ከተከመረው - ሆ ከመሶቡ ይውጣ - ሆ
ከደብረ ታቦር - - ሆ ጌታ ሰለመጣ - ሆ
የተጋገረው - ሆ ሙልሙሉ ይምጣ - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 8
አዝ
ኢትዮጵያውያን - -ሆ ታሪክ ያላችሁ - ሆ
ባህላችሁን - ሆ ያዙ አጥብቃችሁ - ሆ
ችቦውን አብሩት -ሆ እንዳባቶቻችሁ -ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 9
ምስጢር ስላለው -ሆ ደስ ይበላችሁ -ሆ
አዝ
አባቶቻችን - - ሆ ያወረሱን - - ሆ
የቡሄን ትርጉም - - ሆ ያሳወቁን - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 10
እንድንጠብቀው - ሆ ለእኛ የሰጡን - ሆ
ይህን ነውና - - ሆ ያስረከቡን - - ሆ
አዝ
ለድንግል ማርያም ሆ አሥራት የሆንሽ ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 11
ቅዱሳን ጻድቃን - - ሆ የሞሉብሽ - - ሆ
በረከታቸው - - ሆ ያደረብሽ - - ሆ
ሁሌም እንግዶች - ሆ የሚያርፉብሽ -ሆ
ሀገረ እግዚአብሔር -ሆ ኢትዮጵያ ነሽ ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 12
አዝ
ለሐዋርያት - - ሆ የላከ መንፈስ - - ሆ
ዛሬም ለኢትዮጵያ -ሆ ጸጋውን ያፍስስ ሆ
በበጎ ምግባር - ሆ እንድንታነጽ - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 13
በቅን ልቦና - ሆ በጥሩ መንፈስ - - ሆ
በረከተ ቡሄ - ሆ ለሁላችን፹ ይድረስ - ሆ
ዓመት ዓውዳመት ድገም እና ዓመት ድገም እና
በጋሽዬ ቤ ድገም እና ዓመት ድገም እና

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 14
ያውርድ በረከት ድገም እና ዓመት ድገም እና
ወርቅ ይፍሰስበት ድገም እና ዓመት ድገም እና
በእማምዬ ቤት ድገም እና ዓመት ድገም እና
ይግባ በረከት ድገም እና ዓመት ድገም እና

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 15
ማርና ወተት ድገም እና ዓመት ድገም እና
ይትረፍረፍ በእውነት ድገም እና ዓመት ድገም እና
እንዲሁ እንዳላችሁ - -በፍቅር አይለያችሁ - - በፍቅር
ላመቱ በሰላም - - በፍቅር ያድርሳችሁ - - በፍቅር

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 16
ክርስቶስ በቀኙ - - በፍቅር ያቁማችሁ - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርጋችሁ - - በፍቅር
እንዲሁ እንዳለን - - በፍቅር አይለየን - - በፍቅር
ለዓመቱ በሰላም - - በፍቅር ያድርሰን - - በፍቅር

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 17
አማኑኤል በቀኙ - - በፍቅር ያቁመን - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርገን - - በፍቅር
የቅዱሳን መላክት የፃድቃን ሰማዕታት
ረድኤት በረከት ይግባ በሁሉም ቤት

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 18
በሁሉም ቤት(፪) ይግባ በረከት(፪)
እንቁም በሃይማኖት ፀንተን በትጋት
የአስራት አገር የአበው ቀደምት
የቅዱሳን አባቶች ትውፊት

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 19
ይገባልና ልንጠብቅ በእውነት
ባህላችንን የአባቶች ትውፊት (፫)

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ' THEN lyrics_amharic 
          ELSE 'CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 1
ፊቱ እንደ ፀሐይ - ሆ በርቶ የታየው -ሆ
ልብሱ እንደብርሃን -ሆ ያንፀባረቀው -ሆ
ድምጽህን ሰማና በብህሩ ደመና(፪)
የቡሄው ብርሃን ለኛ መጣልን(፪)

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 2
ያዕቆብ ዮሐንስ-ሆ እንዲሁም ጴጥሮስ-ሆ
አምላክን አዩት - - ሆ ሙሴ ኤልያስ - ሆ
አባቱም አለ - - ሆ ልጄን ስሙት - - ሆ
ቃሌ ነውና - - ሆ የወለድኩት - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 3
አዝ
ታቦር አርሞንኤም-ሆ ብርሃን ታየባቸው ሆ
ከቅዱስ ተራራ ሆ ስምህ ደስ አላቸው- ሆ
ሰላም ሰላም - - ሆ የታቦር ተራራ - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 4
ብርሀነ መለኮት - ሆ ባንቺ ላይ አበራ -ሆ
አዝ
በተዋህዶ - - ሆ ወልድ የከበረው - ሆ
የእግዚአብሔር አብ ልጅ - - ሆ ወልደማርያም ነው - -ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 5
ቡሄ በሉ - - ሆ ቡሄ በሉ - - ሆ
የአዳም ልጆች - - ሆ ብርሃንን - - ሆ ተቀበሉ - -ሆ
አዝ
አባቴ ቤት - - ሆ አለኝ ለከት - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 6
እናቴ ቤት - - ሆ አለኝ ለከት - - ሆ
ከአጎቴም ቤት - - - ሆ አለኝ ለከት - ሆ
ተከምሯል - - ሆ እንደ ኩበት - - ሆ
አዝ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 7
የዓመት ልምዳችን - - ሆ ከጥንት የመጣው - - ሆ
ከተከመረው - ሆ ከመሶቡ ይውጣ - ሆ
ከደብረ ታቦር - - ሆ ጌታ ሰለመጣ - ሆ
የተጋገረው - ሆ ሙልሙሉ ይምጣ - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 8
አዝ
ኢትዮጵያውያን - -ሆ ታሪክ ያላችሁ - ሆ
ባህላችሁን - ሆ ያዙ አጥብቃችሁ - ሆ
ችቦውን አብሩት -ሆ እንዳባቶቻችሁ -ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 9
ምስጢር ስላለው -ሆ ደስ ይበላችሁ -ሆ
አዝ
አባቶቻችን - - ሆ ያወረሱን - - ሆ
የቡሄን ትርጉም - - ሆ ያሳወቁን - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 10
እንድንጠብቀው - ሆ ለእኛ የሰጡን - ሆ
ይህን ነውና - - ሆ ያስረከቡን - - ሆ
አዝ
ለድንግል ማርያም ሆ አሥራት የሆንሽ ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 11
ቅዱሳን ጻድቃን - - ሆ የሞሉብሽ - - ሆ
በረከታቸው - - ሆ ያደረብሽ - - ሆ
ሁሌም እንግዶች - ሆ የሚያርፉብሽ -ሆ
ሀገረ እግዚአብሔር -ሆ ኢትዮጵያ ነሽ ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 12
አዝ
ለሐዋርያት - - ሆ የላከ መንፈስ - - ሆ
ዛሬም ለኢትዮጵያ -ሆ ጸጋውን ያፍስስ ሆ
በበጎ ምግባር - ሆ እንድንታነጽ - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 13
በቅን ልቦና - ሆ በጥሩ መንፈስ - - ሆ
በረከተ ቡሄ - ሆ ለሁላችን፹ ይድረስ - ሆ
ዓመት ዓውዳመት ድገም እና ዓመት ድገም እና
በጋሽዬ ቤ ድገም እና ዓመት ድገም እና

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 14
ያውርድ በረከት ድገም እና ዓመት ድገም እና
ወርቅ ይፍሰስበት ድገም እና ዓመት ድገም እና
በእማምዬ ቤት ድገም እና ዓመት ድገም እና
ይግባ በረከት ድገም እና ዓመት ድገም እና

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 15
ማርና ወተት ድገም እና ዓመት ድገም እና
ይትረፍረፍ በእውነት ድገም እና ዓመት ድገም እና
እንዲሁ እንዳላችሁ - -በፍቅር አይለያችሁ - - በፍቅር
ላመቱ በሰላም - - በፍቅር ያድርሳችሁ - - በፍቅር

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 16
ክርስቶስ በቀኙ - - በፍቅር ያቁማችሁ - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርጋችሁ - - በፍቅር
እንዲሁ እንዳለን - - በፍቅር አይለየን - - በፍቅር
ለዓመቱ በሰላም - - በፍቅር ያድርሰን - - በፍቅር

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 17
አማኑኤል በቀኙ - - በፍቅር ያቁመን - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርገን - - በፍቅር
የቅዱሳን መላክት የፃድቃን ሰማዕታት
ረድኤት በረከት ይግባ በሁሉም ቤት

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 18
በሁሉም ቤት(፪) ይግባ በረከት(፪)
እንቁም በሃይማኖት ፀንተን በትጋት
የአስራት አገር የአበው ቀደምት
የቅዱሳን አባቶች ትውፊት

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 19
ይገባልና ልንጠብቅ በእውነት
ባህላችንን የአባቶች ትውፊት (፫)

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ' 
        END,
        lyrics_transliteration = 'CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 1
Fitu ende ts’ehey - ho berto yetayew -ho
Libsu endebrhan -ho yants’ebareqew -ho
Dimts’hn semana bebhru demena (2)
Yebuhew birhan legna met’aln (2)

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 2
Yaeqob yohens-ho endihum p’et’ros-ho
Amlakn ayut - - ho muse elyas - ho
Abatum ale - - ho lijen simut - - ho
Qale newna - - ho yeweledkut - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 3
CHORUS
Tabor armonem-ho birhan tayebachew ho
Keqdus terara ho simh des alachew- ho
Selam selam - - ho yetabor terara - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 4
Birhene melekot - ho banchi lay abera -ho
CHORUS
Betewahdo - - ho Weld yekeberew - ho
YeEgziabher Ab lij - - ho weldemaryam new - -ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 5
Buhe belu - - ho buhe belu - - ho
Yeadam lijoch - - ho birhann - - ho teqebelu - -ho
CHORUS
Abate bet - - ho alegn leket - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 6
Enate bet - - ho alegn leket - - ho
Keagotem bet - - - ho alegn leket - ho
Tekemrwal - - ho ende kubet - - ho
CHORUS

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 7
Yeamet limdachn - - ho ket’nt yemet’aw - - ho
Ketekemerew - ho kemesobu yiwt’a - ho
Kedebre tabor - - ho Geta selemet’a - ho
Yetegagerew - ho mulmulu yimt’a - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 8
CHORUS
Ityop’yawyan - -ho tarik yalachhu - ho
Bahlachhun - ho yazu at’bqachhu - ho
Chbown abrut -ho endabatochachhu -ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 9
Mist’ir silalew -ho des yibelachhu -ho
CHORUS
Abatochachn - - ho yaweresun - - ho
Yebuhen tirgum - - ho yasawequn - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 10
Endnt’ebqew - ho leegna yeset’un - ho
Yihn newna - - ho yasrekebun - - ho
CHORUS
Ledngl Maryam ho asrat yehonsh ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 11
Kidusan ts’adqan - - ho yemolubsh - - ho
Bereketachew - - ho yaderebsh - - ho
Hulem engdoch - ho yemiyarfubsh -ho
Hegere Egziabher -ho ityop’ya nesh ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 12
CHORUS
Lehewaryat - - ho yelake menfes - - ho
Zarem leityop’ya -ho ts’egawn yafss ho
Bebego migbar - ho endntanets’ - - ho

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 13
Beqn libona - ho bet’ru menfes - - ho
Berekete buhe - ho lehulachn፹ yidres - ho
Amet awdamet digem ena amet digem ena
Begashye be digem ena amet digem ena

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 14
Yawrd bereket digem ena amet digem ena
Werq yifsesbet digem ena amet digem ena
Beemamye bet digem ena amet digem ena
Yigba bereket digem ena amet digem ena

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 15
Marna wetet digem ena amet digem ena
Yitrefref beewnet digem ena amet digem ena
Endihu endalachhu - -befqr ayleyachhu - - befqr
Lametu beselam - - befqr yadrsachhu - - befqr

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 16
Kristos beqegnu - - befqr yaqumachhu - - befqr
Yemengstu werash - - befqr yadrgachhu - - befqr
Endihu endalen - - befqr ayleyen - - befqr
Leametu beselam - - befqr yadrsen - - befqr

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 17
Amanuel beqegnu - - befqr yaqumen - - befqr
Yemengstu werash - - befqr yadrgen - - befqr
Yeqdusan melakt yets’adqan semaetat
Redet bereket yigba behulum bet

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 18
Behulum bet (2) yigba bereket (2)
Enqum behaymanot ts’enten betgat
Yeasrat ager yeabew qedemt
Yeqdusan abatoch tiwfit

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho

VERSE 19
Yigebalna lint’ebq beewnet
Bahlachnn yeabatoch tiwfit (3)

CHORUS
Buhe belu (2) - - ho lijoch hulu - - ho
Yegnama Geta - - ho yealem fet’ari - - ho
Yeselam amlak - -ho tihut meheri -ho
Bedebre tabor - - ho yetegelet’ew - ho',
        updated_at = clock_timestamp()::text
    WHERE import_id = '60029398-4a0a-4356-a52a-d2fd257eb350'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 1
ፊቱ እንደ ፀሐይ - ሆ በርቶ የታየው -ሆ
ልብሱ እንደብርሃን -ሆ ያንፀባረቀው -ሆ
ድምጽህን ሰማና በብህሩ ደመና(፪)
የቡሄው ብርሃን ለኛ መጣልን(፪)

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 2
ያዕቆብ ዮሐንስ-ሆ እንዲሁም ጴጥሮስ-ሆ
አምላክን አዩት - - ሆ ሙሴ ኤልያስ - ሆ
አባቱም አለ - - ሆ ልጄን ስሙት - - ሆ
ቃሌ ነውና - - ሆ የወለድኩት - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 3
አዝ
ታቦር አርሞንኤም-ሆ ብርሃን ታየባቸው ሆ
ከቅዱስ ተራራ ሆ ስምህ ደስ አላቸው- ሆ
ሰላም ሰላም - - ሆ የታቦር ተራራ - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 4
ብርሀነ መለኮት - ሆ ባንቺ ላይ አበራ -ሆ
አዝ
በተዋህዶ - - ሆ ወልድ የከበረው - ሆ
የእግዚአብሔር አብ ልጅ - - ሆ ወልደማርያም ነው - -ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 5
ቡሄ በሉ - - ሆ ቡሄ በሉ - - ሆ
የአዳም ልጆች - - ሆ ብርሃንን - - ሆ ተቀበሉ - -ሆ
አዝ
አባቴ ቤት - - ሆ አለኝ ለከት - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 6
እናቴ ቤት - - ሆ አለኝ ለከት - - ሆ
ከአጎቴም ቤት - - - ሆ አለኝ ለከት - ሆ
ተከምሯል - - ሆ እንደ ኩበት - - ሆ
አዝ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 7
የዓመት ልምዳችን - - ሆ ከጥንት የመጣው - - ሆ
ከተከመረው - ሆ ከመሶቡ ይውጣ - ሆ
ከደብረ ታቦር - - ሆ ጌታ ሰለመጣ - ሆ
የተጋገረው - ሆ ሙልሙሉ ይምጣ - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 8
አዝ
ኢትዮጵያውያን - -ሆ ታሪክ ያላችሁ - ሆ
ባህላችሁን - ሆ ያዙ አጥብቃችሁ - ሆ
ችቦውን አብሩት -ሆ እንዳባቶቻችሁ -ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 9
ምስጢር ስላለው -ሆ ደስ ይበላችሁ -ሆ
አዝ
አባቶቻችን - - ሆ ያወረሱን - - ሆ
የቡሄን ትርጉም - - ሆ ያሳወቁን - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 10
እንድንጠብቀው - ሆ ለእኛ የሰጡን - ሆ
ይህን ነውና - - ሆ ያስረከቡን - - ሆ
አዝ
ለድንግል ማርያም ሆ አሥራት የሆንሽ ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 11
ቅዱሳን ጻድቃን - - ሆ የሞሉብሽ - - ሆ
በረከታቸው - - ሆ ያደረብሽ - - ሆ
ሁሌም እንግዶች - ሆ የሚያርፉብሽ -ሆ
ሀገረ እግዚአብሔር -ሆ ኢትዮጵያ ነሽ ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 12
አዝ
ለሐዋርያት - - ሆ የላከ መንፈስ - - ሆ
ዛሬም ለኢትዮጵያ -ሆ ጸጋውን ያፍስስ ሆ
በበጎ ምግባር - ሆ እንድንታነጽ - - ሆ

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 13
በቅን ልቦና - ሆ በጥሩ መንፈስ - - ሆ
በረከተ ቡሄ - ሆ ለሁላችን፹ ይድረስ - ሆ
ዓመት ዓውዳመት ድገም እና ዓመት ድገም እና
በጋሽዬ ቤ ድገም እና ዓመት ድገም እና

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 14
ያውርድ በረከት ድገም እና ዓመት ድገም እና
ወርቅ ይፍሰስበት ድገም እና ዓመት ድገም እና
በእማምዬ ቤት ድገም እና ዓመት ድገም እና
ይግባ በረከት ድገም እና ዓመት ድገም እና

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 15
ማርና ወተት ድገም እና ዓመት ድገም እና
ይትረፍረፍ በእውነት ድገም እና ዓመት ድገም እና
እንዲሁ እንዳላችሁ - -በፍቅር አይለያችሁ - - በፍቅር
ላመቱ በሰላም - - በፍቅር ያድርሳችሁ - - በፍቅር

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 16
ክርስቶስ በቀኙ - - በፍቅር ያቁማችሁ - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርጋችሁ - - በፍቅር
እንዲሁ እንዳለን - - በፍቅር አይለየን - - በፍቅር
ለዓመቱ በሰላም - - በፍቅር ያድርሰን - - በፍቅር

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 17
አማኑኤል በቀኙ - - በፍቅር ያቁመን - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርገን - - በፍቅር
የቅዱሳን መላክት የፃድቃን ሰማዕታት
ረድኤት በረከት ይግባ በሁሉም ቤት

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 18
በሁሉም ቤት(፪) ይግባ በረከት(፪)
እንቁም በሃይማኖት ፀንተን በትጋት
የአስራት አገር የአበው ቀደምት
የቅዱሳን አባቶች ትውፊት

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ

VERSE 19
ይገባልና ልንጠብቅ በእውነት
ባህላችንን የአባቶች ትውፊት (፫)

CHORUS
ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ቡሄ በሉ (፪) - - ሆ ልጆች ሁሉ - - ሆ
የኛማ ጌታ - - ሆ የዓለም ፈጣሪ - - ሆ
የሰላም አምላክ - -ሆ ትሁት መሀሪ -ሆ
በደብረ ታቦር - - ሆ የተገለጠው - ሆ
ፊቱ እንደ ፀሐይ - ሆ በርቶ የታየው -ሆ
ልብሱ እንደብርሃን -ሆ ያንፀባረቀው -ሆ
ድምጽህን ሰማና በብህሩ ደመና(፪)
የቡሄው ብርሃን ለኛ መጣልን(፪)
ያዕቆብ ዮሐንስ-ሆ እንዲሁም ጴጥሮስ-ሆ
አምላክን አዩት - - ሆ ሙሴ ኤልያስ - ሆ
አባቱም አለ - - ሆ ልጄን ስሙት - - ሆ
ቃሌ ነውና - - ሆ የወለድኩት - - ሆ
አዝ======
ታቦር አርሞንኤም-ሆ ብርሃን ታየባቸው ሆ
ከቅዱስ ተራራ ሆ ስምህ ደስ አላቸው- ሆ
ሰላም ሰላም - - ሆ የታቦር ተራራ - - ሆ
ብርሀነ መለኮት - ሆ ባንቺ ላይ አበራ -ሆ
አዝ======
በተዋህዶ - - ሆ ወልድ የከበረው - ሆ
የእግዚአብሔር አብ ልጅ - - ሆ ወልደማርያም ነው - -ሆ
ቡሄ በሉ - - ሆ ቡሄ በሉ - - ሆ
የአዳም ልጆች - - ሆ ብርሃንን - - ሆ ተቀበሉ - -ሆ
አዝ======
አባቴ ቤት - - ሆ አለኝ ለከት - - ሆ
እናቴ ቤት - - ሆ አለኝ ለከት - - ሆ
ከአጎቴም ቤት - - - ሆ አለኝ ለከት - ሆ
ተከምሯል - - ሆ እንደ ኩበት - - ሆ
አዝ======
የዓመት ልምዳችን - - ሆ ከጥንት የመጣው - - ሆ
ከተከመረው - ሆ ከመሶቡ ይውጣ - ሆ
ከደብረ ታቦር - - ሆ ጌታ ሰለመጣ - ሆ
የተጋገረው - ሆ ሙልሙሉ ይምጣ - ሆ
አዝ======
ኢትዮጵያውያን - -ሆ ታሪክ ያላችሁ - ሆ
ባህላችሁን - ሆ ያዙ አጥብቃችሁ - ሆ
ችቦውን አብሩት -ሆ እንዳባቶቻችሁ -ሆ
ምስጢር ስላለው -ሆ ደስ ይበላችሁ -ሆ
አዝ======
አባቶቻችን - - ሆ ያወረሱን - - ሆ
የቡሄን ትርጉም - - ሆ ያሳወቁን - - ሆ
እንድንጠብቀው - ሆ ለእኛ የሰጡን - ሆ
ይህን ነውና - - ሆ ያስረከቡን - - ሆ
አዝ======
ለድንግል ማርያም ሆ አሥራት የሆንሽ ሆ
ቅዱሳን ጻድቃን - - ሆ የሞሉብሽ - - ሆ
በረከታቸው - - ሆ ያደረብሽ - - ሆ
ሁሌም እንግዶች - ሆ የሚያርፉብሽ -ሆ
ሀገረ እግዚአብሔር -ሆ ኢትዮጵያ ነሽ ሆ
አዝ======
ለሐዋርያት - - ሆ የላከ መንፈስ - - ሆ
ዛሬም ለኢትዮጵያ -ሆ ጸጋውን ያፍስስ ሆ
በበጎ ምግባር - ሆ እንድንታነጽ - - ሆ
በቅን ልቦና - ሆ በጥሩ መንፈስ - - ሆ
በረከተ ቡሄ - ሆ ለሁላችን፹ ይድረስ - ሆ
ዓመት ዓውዳመት ድገም እና ዓመት ድገም እና
በጋሽዬ ቤ ድገም እና ዓመት ድገም እና
ያውርድ በረከት ድገም እና ዓመት ድገም እና
ወርቅ ይፍሰስበት ድገም እና ዓመት ድገም እና
በእማምዬ ቤት ድገም እና ዓመት ድገም እና
ይግባ በረከት ድገም እና ዓመት ድገም እና
ማርና ወተት ድገም እና ዓመት ድገም እና
ይትረፍረፍ በእውነት ድገም እና ዓመት ድገም እና
እንዲሁ እንዳላችሁ - -በፍቅር አይለያችሁ - - በፍቅር
ላመቱ በሰላም - - በፍቅር ያድርሳችሁ - - በፍቅር
ክርስቶስ በቀኙ - - በፍቅር ያቁማችሁ - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርጋችሁ - - በፍቅር
እንዲሁ እንዳለን - - በፍቅር አይለየን - - በፍቅር
ለዓመቱ በሰላም - - በፍቅር ያድርሰን - - በፍቅር
አማኑኤል በቀኙ - - በፍቅር ያቁመን - - በፍቅር
የመንግስቱ ወራሽ - - በፍቅር ያድርገን - - በፍቅር
የቅዱሳን መላክት የፃድቃን ሰማዕታት
ረድኤት በረከት ይግባ በሁሉም ቤት
በሁሉም ቤት(፪) ይግባ በረከት(፪)
እንቁም በሃይማኖት ፀንተን በትጋት
የአስራት አገር የአበው ቀደምት
የቅዱሳን አባቶች ትውፊት
ይገባልና ልንጠብቅ በእውነት
ባህላችንን የአባቶች ትውፊት (፫)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '60029398-4a0a-4356-a52a-d2fd257eb350'::uuid, 'buhe-belu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nay-hadush-amet-mezimur-tigirigna ("ናይ ሓዱሽ ዓመት መዝሙር ትግርኛ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a3723ce6-001d-490d-9c56-d99b8c71e7ce'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 1
+++++++++++++++++++++++++++++
Niu nideyb nafti birhanna
Amet kab amet ziaቖrena
Biredetu aznibu mihret

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 2
Alem hadesa ab hadush amet
+++++++++++++++++++++++++++++
Zinebere zelo hiyaw nebari
Alfa omega zemen ቐyari

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 3
Beti kehali yahwe goyta
Midri lemlemet afta ameta
+++++++++++++++++++++++++++++
Kemti wetru aleኹ deqey

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 4
Niu gezaኹm beti mengedey
Binshu dequ merahi
Hat’iat zeerego hiwet hedasi
+++++++++++++++++++++++++++++

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 5
Sibuh wietu em qidme alem
Kem melaeኽtu nihna''win nezim
Fiቕru zireaye kemti zemesgn
Eneho shmኻ sibuh''yu nibl

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 6
+++++++++++++++++++++++++++++
Weladi wuladu meaz gedifu
Aygodelenan bizuh terifu
Ab qalu zirkeb hiyaway gwasa

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 7
Ts’nue metkelna hadagi abesa

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 1
+++++++++++++++++++++++++++++
ንዑ ንደይብ ናፍቲ ብርሃንና
ዓመት ካብ ዓመት ዝዓቖረና
ብረድኤቱ ኣዝኒቡ ምሕረት

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 2
ዓለም ሓደሳ ኣብ ሓዱሽ ዓመት
+++++++++++++++++++++++++++++
ዝነበረ ዘሎ ህያው ነባሪ
ኣልፋ ኦሜጋ ዘመን ቐያሪ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 3
በቲ ከሃሊ ያህዌ ጎይታ
ምድሪ ለምለመት ኣፍታ ዓመታ
+++++++++++++++++++++++++++++
ከምቲ ወትርኡ ኣለኹ ደቀይ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 4
ንዑ ገዛኹም በቲ መንገደይ
ብንስህኡ ደቁ መራሒ
ሓጢአት ዘእረጎ ሂወት ሐዳሲ
+++++++++++++++++++++++++++++

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 5
ስቡሕ ውእቱ እም ቅድመ ዓለም
ከም መላእኽቱ ንሕና''ውን ነዚም
ፍቕሩ ዝረኣየ ከምቲ ዘመስግን
እነሆ ሽምኻ ስቡሕ''ዩ ንብል

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 6
+++++++++++++++++++++++++++++
ወላዲ ዉላዱ መዓዝ ገዲፉ
ኣይጎደለናን ብዙሕ ተሪፉ
ኣብ ቃሉ ዝርከብ ሕያዋይ ጓሳ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 7
ፅኑዕ መትከልና ሓዳጊ ኣበሳ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 1
+++++++++++++++++++++++++++++
ንዑ ንደይብ ናፍቲ ብርሃንና
ዓመት ካብ ዓመት ዝዓቖረና
ብረድኤቱ ኣዝኒቡ ምሕረት

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 2
ዓለም ሓደሳ ኣብ ሓዱሽ ዓመት
+++++++++++++++++++++++++++++
ዝነበረ ዘሎ ህያው ነባሪ
ኣልፋ ኦሜጋ ዘመን ቐያሪ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 3
በቲ ከሃሊ ያህዌ ጎይታ
ምድሪ ለምለመት ኣፍታ ዓመታ
+++++++++++++++++++++++++++++
ከምቲ ወትርኡ ኣለኹ ደቀይ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 4
ንዑ ገዛኹም በቲ መንገደይ
ብንስህኡ ደቁ መራሒ
ሓጢአት ዘእረጎ ሂወት ሐዳሲ
+++++++++++++++++++++++++++++

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 5
ስቡሕ ውእቱ እም ቅድመ ዓለም
ከም መላእኽቱ ንሕና''ውን ነዚም
ፍቕሩ ዝረኣየ ከምቲ ዘመስግን
እነሆ ሽምኻ ስቡሕ''ዩ ንብል

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 6
+++++++++++++++++++++++++++++
ወላዲ ዉላዱ መዓዝ ገዲፉ
ኣይጎደለናን ብዙሕ ተሪፉ
ኣብ ቃሉ ዝርከብ ሕያዋይ ጓሳ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 7
ፅኑዕ መትከልና ሓዳጊ ኣበሳ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ' THEN lyrics_amharic 
          ELSE 'CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 1
+++++++++++++++++++++++++++++
ንዑ ንደይብ ናፍቲ ብርሃንና
ዓመት ካብ ዓመት ዝዓቖረና
ብረድኤቱ ኣዝኒቡ ምሕረት

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 2
ዓለም ሓደሳ ኣብ ሓዱሽ ዓመት
+++++++++++++++++++++++++++++
ዝነበረ ዘሎ ህያው ነባሪ
ኣልፋ ኦሜጋ ዘመን ቐያሪ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 3
በቲ ከሃሊ ያህዌ ጎይታ
ምድሪ ለምለመት ኣፍታ ዓመታ
+++++++++++++++++++++++++++++
ከምቲ ወትርኡ ኣለኹ ደቀይ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 4
ንዑ ገዛኹም በቲ መንገደይ
ብንስህኡ ደቁ መራሒ
ሓጢአት ዘእረጎ ሂወት ሐዳሲ
+++++++++++++++++++++++++++++

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 5
ስቡሕ ውእቱ እም ቅድመ ዓለም
ከም መላእኽቱ ንሕና''ውን ነዚም
ፍቕሩ ዝረኣየ ከምቲ ዘመስግን
እነሆ ሽምኻ ስቡሕ''ዩ ንብል

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 6
+++++++++++++++++++++++++++++
ወላዲ ዉላዱ መዓዝ ገዲፉ
ኣይጎደለናን ብዙሕ ተሪፉ
ኣብ ቃሉ ዝርከብ ሕያዋይ ጓሳ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 7
ፅኑዕ መትከልና ሓዳጊ ኣበሳ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ' 
        END,
        lyrics_transliteration = 'CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 1
+++++++++++++++++++++++++++++
Niu nideyb nafti birhanna
Amet kab amet ziaቖrena
Biredetu aznibu mihret

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 2
Alem hadesa ab hadush amet
+++++++++++++++++++++++++++++
Zinebere zelo hiyaw nebari
Alfa omega zemen ቐyari

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 3
Beti kehali yahwe goyta
Midri lemlemet afta ameta
+++++++++++++++++++++++++++++
Kemti wetru aleኹ deqey

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 4
Niu gezaኹm beti mengedey
Binshu dequ merahi
Hat’iat zeerego hiwet hedasi
+++++++++++++++++++++++++++++

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 5
Sibuh wietu em qidme alem
Kem melaeኽtu nihna''win nezim
Fiቕru zireaye kemti zemesgn
Eneho shmኻ sibuh''yu nibl

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 6
+++++++++++++++++++++++++++++
Weladi wuladu meaz gedifu
Aygodelenan bizuh terifu
Ab qalu zirkeb hiyaway gwasa

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes

VERSE 7
Ts’nue metkelna hadagi abesa

CHORUS
Des yibelekum des yibelena
Beti ts’ebaot hade amlaኽna
Bihadush mezmur simu kinቕds
Zits’ewuana simu yiqedes',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a3723ce6-001d-490d-9c56-d99b8c71e7ce'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 1
+++++++++++++++++++++++++++++
ንዑ ንደይብ ናፍቲ ብርሃንና
ዓመት ካብ ዓመት ዝዓቖረና
ብረድኤቱ ኣዝኒቡ ምሕረት

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 2
ዓለም ሓደሳ ኣብ ሓዱሽ ዓመት
+++++++++++++++++++++++++++++
ዝነበረ ዘሎ ህያው ነባሪ
ኣልፋ ኦሜጋ ዘመን ቐያሪ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 3
በቲ ከሃሊ ያህዌ ጎይታ
ምድሪ ለምለመት ኣፍታ ዓመታ
+++++++++++++++++++++++++++++
ከምቲ ወትርኡ ኣለኹ ደቀይ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 4
ንዑ ገዛኹም በቲ መንገደይ
ብንስህኡ ደቁ መራሒ
ሓጢአት ዘእረጎ ሂወት ሐዳሲ
+++++++++++++++++++++++++++++

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 5
ስቡሕ ውእቱ እም ቅድመ ዓለም
ከም መላእኽቱ ንሕና''ውን ነዚም
ፍቕሩ ዝረኣየ ከምቲ ዘመስግን
እነሆ ሽምኻ ስቡሕ''ዩ ንብል

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 6
+++++++++++++++++++++++++++++
ወላዲ ዉላዱ መዓዝ ገዲፉ
ኣይጎደለናን ብዙሕ ተሪፉ
ኣብ ቃሉ ዝርከብ ሕያዋይ ጓሳ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ

VERSE 7
ፅኑዕ መትከልና ሓዳጊ ኣበሳ

CHORUS
ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ደስ ይበለኩም ደስ ይበለና
በቲ ፀባኦት ሓደ ኣምላኽና
ብሓዱሽ መዝሙር ስሙ ክንቕድስ
ዝፀዉዐና ስሙ ይቀደስ
+++++++++++++++++++++++++++++
ንዑ ንደይብ ናፍቲ ብርሃንና
ዓመት ካብ ዓመት ዝዓቖረና
ብረድኤቱ ኣዝኒቡ ምሕረት
ዓለም ሓደሳ ኣብ ሓዱሽ ዓመት
+++++++++++++++++++++++++++++
ዝነበረ ዘሎ ህያው ነባሪ
ኣልፋ ኦሜጋ ዘመን ቐያሪ
በቲ ከሃሊ ያህዌ ጎይታ
ምድሪ ለምለመት ኣፍታ ዓመታ
+++++++++++++++++++++++++++++
ከምቲ ወትርኡ ኣለኹ ደቀይ
ንዑ ገዛኹም በቲ መንገደይ
ብንስህኡ ደቁ መራሒ
ሓጢአት ዘእረጎ ሂወት ሐዳሲ
+++++++++++++++++++++++++++++
ስቡሕ ውእቱ እም ቅድመ ዓለም
ከም መላእኽቱ ንሕና''ውን ነዚም
ፍቕሩ ዝረኣየ ከምቲ ዘመስግን
እነሆ ሽምኻ ስቡሕ''ዩ ንብል
+++++++++++++++++++++++++++++
ወላዲ ዉላዱ መዓዝ ገዲፉ
ኣይጎደለናን ብዙሕ ተሪፉ
ኣብ ቃሉ ዝርከብ ሕያዋይ ጓሳ
ፅኑዕ መትከልና ሓዳጊ ኣበሳ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a3723ce6-001d-490d-9c56-d99b8c71e7ce'::uuid, 'nay-hadush-amet-mezimur-tigirigna', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- he-saved-me-my-lord ("አዳነኝ ጌታ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'de56d947-4bce-472c-bff9-038b44fbe655'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 1
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 2
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 3
The hardships that seemed impossible have passed
I''m washed by my tears leaving the dark at last
Now I have become a witness to your works
I will proclaim them preaching across the earth

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 4
Your arms are steadfast for supporting the meek
You invigorate those who are drained and weak
By turning my eyes away from the dark road
I find my rest in the grounds of your abode

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 5
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 6
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
You took the garment of sorrow off my back
When I awaited death you gave life I lacked

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 7
From my sickly bed your hands have raised me high
Healed and renewed on your mercy I''ll rely
Your words are true and firm they cement with might
Give strength to those who were maimed and lost in fright

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 8
My life is made new today by your command
In graceful record I''m written by your hand
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 9
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 10
The false conviction you overturned its true
The man pushed aside now finds comfort in you
The chalice of gloom and chains are cast away
He is free at last walking in a new way

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 11
Within Haman''s square no Mordecai to find
Naboth''s blood avenged for justice isn''t blind
Lord in your return justice is abundant
False men convicted in your final judgement

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 12
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 13
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 14
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 1
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 2
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 3
The hardships that seemed impossible have passed
I''m washed by my tears leaving the dark at last
Now I have become a witness to your works
I will proclaim them preaching across the earth

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 4
Your arms are steadfast for supporting the meek
You invigorate those who are drained and weak
By turning my eyes away from the dark road
I find my rest in the grounds of your abode

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 5
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 6
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
You took the garment of sorrow off my back
When I awaited death you gave life I lacked

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 7
From my sickly bed your hands have raised me high
Healed and renewed on your mercy I''ll rely
Your words are true and firm they cement with might
Give strength to those who were maimed and lost in fright

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 8
My life is made new today by your command
In graceful record I''m written by your hand
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 9
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 10
The false conviction you overturned its true
The man pushed aside now finds comfort in you
The chalice of gloom and chains are cast away
He is free at last walking in a new way

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 11
Within Haman''s square no Mordecai to find
Naboth''s blood avenged for justice isn''t blind
Lord in your return justice is abundant
False men convicted in your final judgement

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 12
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 13
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 14
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 1
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 2
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 3
The hardships that seemed impossible have passed
I''m washed by my tears leaving the dark at last
Now I have become a witness to your works
I will proclaim them preaching across the earth

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 4
Your arms are steadfast for supporting the meek
You invigorate those who are drained and weak
By turning my eyes away from the dark road
I find my rest in the grounds of your abode

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 5
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 6
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
You took the garment of sorrow off my back
When I awaited death you gave life I lacked

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 7
From my sickly bed your hands have raised me high
Healed and renewed on your mercy I''ll rely
Your words are true and firm they cement with might
Give strength to those who were maimed and lost in fright

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 8
My life is made new today by your command
In graceful record I''m written by your hand
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 9
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 10
The false conviction you overturned its true
The man pushed aside now finds comfort in you
The chalice of gloom and chains are cast away
He is free at last walking in a new way

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 11
Within Haman''s square no Mordecai to find
Naboth''s blood avenged for justice isn''t blind
Lord in your return justice is abundant
False men convicted in your final judgement

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 12
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 13
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 14
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection' THEN lyrics_amharic 
          ELSE 'CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 1
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 2
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 3
The hardships that seemed impossible have passed
I''m washed by my tears leaving the dark at last
Now I have become a witness to your works
I will proclaim them preaching across the earth

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 4
Your arms are steadfast for supporting the meek
You invigorate those who are drained and weak
By turning my eyes away from the dark road
I find my rest in the grounds of your abode

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 5
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 6
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
You took the garment of sorrow off my back
When I awaited death you gave life I lacked

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 7
From my sickly bed your hands have raised me high
Healed and renewed on your mercy I''ll rely
Your words are true and firm they cement with might
Give strength to those who were maimed and lost in fright

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 8
My life is made new today by your command
In graceful record I''m written by your hand
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 9
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 10
The false conviction you overturned its true
The man pushed aside now finds comfort in you
The chalice of gloom and chains are cast away
He is free at last walking in a new way

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 11
Within Haman''s square no Mordecai to find
Naboth''s blood avenged for justice isn''t blind
Lord in your return justice is abundant
False men convicted in your final judgement

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 12
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 13
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 14
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection' 
        END,
        lyrics_transliteration = 'CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 1
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 2
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 3
The hardships that seemed impossible have passed
I''m washed by my tears leaving the dark at last
Now I have become a witness to your works
I will proclaim them preaching across the earth

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 4
Your arms are steadfast for supporting the meek
You invigorate those who are drained and weak
By turning my eyes away from the dark road
I find my rest in the grounds of your abode

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 5
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 6
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
You took the garment of sorrow off my back
When I awaited death you gave life I lacked

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 7
From my sickly bed your hands have raised me high
Healed and renewed on your mercy I''ll rely
Your words are true and firm they cement with might
Give strength to those who were maimed and lost in fright

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 8
My life is made new today by your command
In graceful record I''m written by your hand
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 9
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 10
The false conviction you overturned its true
The man pushed aside now finds comfort in you
The chalice of gloom and chains are cast away
He is free at last walking in a new way

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 11
Within Haman''s square no Mordecai to find
Naboth''s blood avenged for justice isn''t blind
Lord in your return justice is abundant
False men convicted in your final judgement

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 12
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 13
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 14
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'de56d947-4bce-472c-bff9-038b44fbe655'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 1
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 2
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 3
The hardships that seemed impossible have passed
I''m washed by my tears leaving the dark at last
Now I have become a witness to your works
I will proclaim them preaching across the earth

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 4
Your arms are steadfast for supporting the meek
You invigorate those who are drained and weak
By turning my eyes away from the dark road
I find my rest in the grounds of your abode

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 5
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 6
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
You took the garment of sorrow off my back
When I awaited death you gave life I lacked

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 7
From my sickly bed your hands have raised me high
Healed and renewed on your mercy I''ll rely
Your words are true and firm they cement with might
Give strength to those who were maimed and lost in fright

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 8
My life is made new today by your command
In graceful record I''m written by your hand
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 9
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 10
The false conviction you overturned its true
The man pushed aside now finds comfort in you
The chalice of gloom and chains are cast away
He is free at last walking in a new way

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 11
Within Haman''s square no Mordecai to find
Naboth''s blood avenged for justice isn''t blind
Lord in your return justice is abundant
False men convicted in your final judgement

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 12
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 13
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection

VERSE 14
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn

CHORUS
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection'
        OR lyrics_amharic IS NOT DISTINCT FROM 'He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn
The hardships that seemed impossible have passed
I''m washed by my tears leaving the dark at last
Now I have become a witness to your works
I will proclaim them preaching across the earth
Your arms are steadfast for supporting the meek
You invigorate those who are drained and weak
By turning my eyes away from the dark road
I find my rest in the grounds of your abode
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
You took the garment of sorrow off my back
When I awaited death you gave life I lacked
From my sickly bed your hands have raised me high
Healed and renewed on your mercy I''ll rely
Your words are true and firm they cement with might
Give strength to those who were maimed and lost in fright
My life is made new today by your command
In graceful record I''m written by your hand
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
The false conviction you overturned its true
The man pushed aside now finds comfort in you
The chalice of gloom and chains are cast away
He is free at last walking in a new way
Within Haman''s square no Mordecai to find
Naboth''s blood avenged for justice isn''t blind
Lord in your return justice is abundant
False men convicted in your final judgement
He saved me my Lord with compassion
He healed me my Lord with affection
He saved me my Lord with compassion
He healed me my Lord with affection
The Almighty God saved me I''m free
Though I''m a sinner He shows mercy
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Adanegn Geta adanegn
Fewesegn Geta fewesegn
Egziabher adanegn
Hatiyategnawun wededegn'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'de56d947-4bce-472c-bff9-038b44fbe655'::uuid, 'he-saved-me-my-lord', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  RAISE NOTICE 'Batch 30 executed successfully: 34 records processed.';
END $$;

COMMIT;
