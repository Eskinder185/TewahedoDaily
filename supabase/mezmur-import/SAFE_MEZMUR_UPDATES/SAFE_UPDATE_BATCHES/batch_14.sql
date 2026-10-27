-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 14 OF 32
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
  -- mariyam-eniwedishalen ("Mariyam Eniwedishalen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '58550fa4-acc7-4c98-b8be-5272a07140d4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 1
በኃጢአት መውደቄን - - - ማርያም
ተስፋዬ አንቺዉ ነሽ - - - ማርያም
እስከ እለተ ሞቴ - - - ማርያም
ላልከዳሽ ምያለሁ - - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 2
ከስርሽ ላልጠፋ - - - ማርያም
ገፀ በረከቴ - - - ማርያም
የሕይወት ዋስትና - - - ማርያም
የምእመናን ውበት - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 3
ዘውድ አክሊላቸው - - - ማርያም
ድንግል አንቺ እኮ - - - ማርያም
ነሽ የመንገድ ስንቃቸው - - - ማርያም
ምስክር ነን ላንቺ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 4
እንደ ነቢያቱ - - - ማርያም
ስጦታ መሆንሽን - - - ማርያም
ለአዳም ልጆች ሁሉ - - - ማርያም
ሞገስና ፀጋ - - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 5
በጌታ ፊት ያለሽ - - - ማርያም
ከሰይጣን መሸሻ - - - ማርያም
ዋስ ጠበቃችን ነሽ - - - ማርያም
እንዴት ነበር ያኔ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 6
ጌታን ስትወልጂ - - - - ማርያም
የእረኞቹ ደስታ - - - ማርያም
የመላእክት ዝማሬ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 1
Behat’iat mewdeqen - - - Maryam
Tesfaye anchiwu nesh - - - Maryam
Eske elete mote - - - Maryam
Lalkedash miyalehu - - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 2
Kesrsh lalt’efa - - - Maryam
Gets’e berekete - - - Maryam
Yehywet wastna - - - Maryam
Yememenan wibet - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 3
Zewd aklilachew - - - Maryam
Dingil anchi eko - - - Maryam
Nesh yemenged sinqachew - - - Maryam
Miskr nen lanchi - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 4
Ende nebiyatu - - - Maryam
Sit’ota mehonshn - - - Maryam
Leadam lijoch hulu - - - Maryam
Mogesna ts’ega - - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 5
Begeta fit yalesh - - - Maryam
Keseyt’an meshesha - - - Maryam
Was t’ebeqachn nesh - - - Maryam
Endet neber yane - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 6
Getan sitwelji - - - - Maryam
Yeeregnochu desta - - - Maryam
Yemelaekt zimare - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 1
በኃጢአት መውደቄን - - - ማርያም
ተስፋዬ አንቺዉ ነሽ - - - ማርያም
እስከ እለተ ሞቴ - - - ማርያም
ላልከዳሽ ምያለሁ - - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 2
ከስርሽ ላልጠፋ - - - ማርያም
ገፀ በረከቴ - - - ማርያም
የሕይወት ዋስትና - - - ማርያም
የምእመናን ውበት - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 3
ዘውድ አክሊላቸው - - - ማርያም
ድንግል አንቺ እኮ - - - ማርያም
ነሽ የመንገድ ስንቃቸው - - - ማርያም
ምስክር ነን ላንቺ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 4
እንደ ነቢያቱ - - - ማርያም
ስጦታ መሆንሽን - - - ማርያም
ለአዳም ልጆች ሁሉ - - - ማርያም
ሞገስና ፀጋ - - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 5
በጌታ ፊት ያለሽ - - - ማርያም
ከሰይጣን መሸሻ - - - ማርያም
ዋስ ጠበቃችን ነሽ - - - ማርያም
እንዴት ነበር ያኔ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 6
ጌታን ስትወልጂ - - - - ማርያም
የእረኞቹ ደስታ - - - ማርያም
የመላእክት ዝማሬ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም',
        lyrics_transliteration = 'CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 1
Behat’iat mewdeqen - - - Maryam
Tesfaye anchiwu nesh - - - Maryam
Eske elete mote - - - Maryam
Lalkedash miyalehu - - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 2
Kesrsh lalt’efa - - - Maryam
Gets’e berekete - - - Maryam
Yehywet wastna - - - Maryam
Yememenan wibet - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 3
Zewd aklilachew - - - Maryam
Dingil anchi eko - - - Maryam
Nesh yemenged sinqachew - - - Maryam
Miskr nen lanchi - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 4
Ende nebiyatu - - - Maryam
Sit’ota mehonshn - - - Maryam
Leadam lijoch hulu - - - Maryam
Mogesna ts’ega - - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 5
Begeta fit yalesh - - - Maryam
Keseyt’an meshesha - - - Maryam
Was t’ebeqachn nesh - - - Maryam
Endet neber yane - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 6
Getan sitwelji - - - - Maryam
Yeeregnochu desta - - - Maryam
Yemelaekt zimare - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam',
        updated_at = clock_timestamp()::text
    WHERE import_id = '58550fa4-acc7-4c98-b8be-5272a07140d4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 1
በኃጢአት መውደቄን - - - ማርያም
ተስፋዬ አንቺዉ ነሽ - - - ማርያም
እስከ እለተ ሞቴ - - - ማርያም
ላልከዳሽ ምያለሁ - - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 2
ከስርሽ ላልጠፋ - - - ማርያም
ገፀ በረከቴ - - - ማርያም
የሕይወት ዋስትና - - - ማርያም
የምእመናን ውበት - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 3
ዘውድ አክሊላቸው - - - ማርያም
ድንግል አንቺ እኮ - - - ማርያም
ነሽ የመንገድ ስንቃቸው - - - ማርያም
ምስክር ነን ላንቺ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 4
እንደ ነቢያቱ - - - ማርያም
ስጦታ መሆንሽን - - - ማርያም
ለአዳም ልጆች ሁሉ - - - ማርያም
ሞገስና ፀጋ - - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 5
በጌታ ፊት ያለሽ - - - ማርያም
ከሰይጣን መሸሻ - - - ማርያም
ዋስ ጠበቃችን ነሽ - - - ማርያም
እንዴት ነበር ያኔ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 6
ጌታን ስትወልጂ - - - - ማርያም
የእረኞቹ ደስታ - - - ማርያም
የመላእክት ዝማሬ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '58550fa4-acc7-4c98-b8be-5272a07140d4'::uuid, 'mariyam-eniwedishalen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wubete ("WUBETE")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f0a42568-0490-480e-9a84-a2966bab2cd4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 1
ወስጄሻለሁኝ ከመስቀሉ ስር
እነኋት ብሎኛል ጌታ በፍቅር
አንጀቴ ተጣብቆ አንሰፍስፎኝ ረሀብ
ማርያም (2) ስል ነው ሰምቶ የሚረግብ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 2
አሰሚኝ እናቴ የሰላምታሽን ቃል
ምስቅልቅሉ ኑሮ ጭንቀቴ ይበቃል
ይመካል ይፈካል ልቤም ገጽታዬ
የጌታዬን እናት ስለምል እምዬ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 3
በማዕረግ አድጌ በማዕረግ ኖራለሁ
ማን እረዳህ ቢሉኝ እናቴ እላለሁ
ለኔስ አንቺ ስጦታዬ
እናት ኩራት ሸሻጊዬ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 4
የቅርቤ ነሽ የውስጠቴ
ጌጤ ያልኩሽ ደምግባቴ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged

VERSE 1
Wesjeshalehugn kemesqelu sir
Enehwat bilognal Geta befqr
Anjete tet’abqo ansefsfogn reheb
Maryam (2) sil new semto yemiregb

CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged

VERSE 2
Asemign enate yeselamtashn qal
Misqlqlu nuro ch’nqete yibeqal
Yimekal yifekal libem gets’taye
Yegetayen enat sileml emye

CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged

VERSE 3
Bemaereg adge bemaereg noralehu
Man eredah bilugn enate elalehu
Lenes anchi sit’otaye
Enat kurat sheshagiye

CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged

VERSE 4
Yeqrbe nesh yewst’ete
Get’e yalkush demgbate

CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 1
ወስጄሻለሁኝ ከመስቀሉ ስር
እነኋት ብሎኛል ጌታ በፍቅር
አንጀቴ ተጣብቆ አንሰፍስፎኝ ረሀብ
ማርያም (2) ስል ነው ሰምቶ የሚረግብ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 2
አሰሚኝ እናቴ የሰላምታሽን ቃል
ምስቅልቅሉ ኑሮ ጭንቀቴ ይበቃል
ይመካል ይፈካል ልቤም ገጽታዬ
የጌታዬን እናት ስለምል እምዬ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 3
በማዕረግ አድጌ በማዕረግ ኖራለሁ
ማን እረዳህ ቢሉኝ እናቴ እላለሁ
ለኔስ አንቺ ስጦታዬ
እናት ኩራት ሸሻጊዬ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 4
የቅርቤ ነሽ የውስጠቴ
ጌጤ ያልኩሽ ደምግባቴ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ',
        lyrics_transliteration = 'CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged

VERSE 1
Wesjeshalehugn kemesqelu sir
Enehwat bilognal Geta befqr
Anjete tet’abqo ansefsfogn reheb
Maryam (2) sil new semto yemiregb

CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged

VERSE 2
Asemign enate yeselamtashn qal
Misqlqlu nuro ch’nqete yibeqal
Yimekal yifekal libem gets’taye
Yegetayen enat sileml emye

CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged

VERSE 3
Bemaereg adge bemaereg noralehu
Man eredah bilugn enate elalehu
Lenes anchi sit’otaye
Enat kurat sheshagiye

CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged

VERSE 4
Yeqrbe nesh yewst’ete
Get’e yalkush demgbate

CHORUS
Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f0a42568-0490-480e-9a84-a2966bab2cd4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 1
ወስጄሻለሁኝ ከመስቀሉ ስር
እነኋት ብሎኛል ጌታ በፍቅር
አንጀቴ ተጣብቆ አንሰፍስፎኝ ረሀብ
ማርያም (2) ስል ነው ሰምቶ የሚረግብ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 2
አሰሚኝ እናቴ የሰላምታሽን ቃል
ምስቅልቅሉ ኑሮ ጭንቀቴ ይበቃል
ይመካል ይፈካል ልቤም ገጽታዬ
የጌታዬን እናት ስለምል እምዬ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 3
በማዕረግ አድጌ በማዕረግ ኖራለሁ
ማን እረዳህ ቢሉኝ እናቴ እላለሁ
ለኔስ አንቺ ስጦታዬ
እናት ኩራት ሸሻጊዬ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 4
የቅርቤ ነሽ የውስጠቴ
ጌጤ ያልኩሽ ደምግባቴ

CHORUS
ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f0a42568-0490-480e-9a84-a2966bab2cd4'::uuid, 'wubete', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- keminedew-esat ("Keminedew Esat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '59fd0b35-2d73-4243-80bf-bd43a35e11bc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 1
የከለዳውያን አስማት ተዘለፈ
በሰማዩ ምስጢር ገብርኤል
ህይወቴ ከሞት አተረፈ /2/
የእስረኞቹ አለቃ አስፋኒስ ተገርሞ

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 2
ሽብሸባዬን አየ ከእሳቱ ዳር ቆሞ
የአማልክትን ልጅ ባይለይም ንጉሱ
አምላክ ወሰብ መልአክ ከቶኑ
ሃያሉ ታድጎኛል እርሱ /2/

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 3
ጠላት የለኮሰው የፈተናው ችቦ
በነፍሴ አላለፈም ስጋዬን ለብልቦ
ከባቢሎን ዋዕይ ተርፍለች ህይወቴ
የጌታ ባለሟል በምልጃው

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 4
ጥላ ስር ከልሎኝ አባቴ /2/
የውሀው መፍለቅለቅ ልቤን አያዝልም
ዓለም ንዳንድ ቢሆን እምነቴን አይንድም
ቂርቆስ እየሉጣን ከፍል እንዳዳነ

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 5
ደመናን ሰንጥቆ ገብርኤል
ከጥፋት ሊያድነኝ ፈጠነ /2/

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 1
Yekeledawyan asmat tezelefe
Besemayu mist’ir Gebriel
Hiywete kemot aterefe (2)
Yeesregnochu aleqa asfanis tegermo

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 2
Shbshebayen aye keesatu dar qomo
Yeamalktn lij bayleym nigusu
Amlak weseb melak ketonu
Hayalu tadgognal ersu (2)

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 3
T’elat yelekosew yefetenaw chbo
Benefse alalefem sigayen leblbo
Kebabilon waey terflech hiywete
Yegeta balemwal bemljaw

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 4
T’la sir kellogn abate (2)
Yewhew mefleqleq liben ayazlm
Alem nidand bihon emneten ayndm
Qirqos eyelut’an kefl endadane

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 5
Demenan sent’qo Gebriel
Ket’fat liyadnegn fet’ene (2)

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 1
የከለዳውያን አስማት ተዘለፈ
በሰማዩ ምስጢር ገብርኤል
ህይወቴ ከሞት አተረፈ /2/
የእስረኞቹ አለቃ አስፋኒስ ተገርሞ

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 2
ሽብሸባዬን አየ ከእሳቱ ዳር ቆሞ
የአማልክትን ልጅ ባይለይም ንጉሱ
አምላክ ወሰብ መልአክ ከቶኑ
ሃያሉ ታድጎኛል እርሱ /2/

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 3
ጠላት የለኮሰው የፈተናው ችቦ
በነፍሴ አላለፈም ስጋዬን ለብልቦ
ከባቢሎን ዋዕይ ተርፍለች ህይወቴ
የጌታ ባለሟል በምልጃው

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 4
ጥላ ስር ከልሎኝ አባቴ /2/
የውሀው መፍለቅለቅ ልቤን አያዝልም
ዓለም ንዳንድ ቢሆን እምነቴን አይንድም
ቂርቆስ እየሉጣን ከፍል እንዳዳነ

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 5
ደመናን ሰንጥቆ ገብርኤል
ከጥፋት ሊያድነኝ ፈጠነ /2/

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል',
        lyrics_transliteration = 'CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 1
Yekeledawyan asmat tezelefe
Besemayu mist’ir Gebriel
Hiywete kemot aterefe (2)
Yeesregnochu aleqa asfanis tegermo

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 2
Shbshebayen aye keesatu dar qomo
Yeamalktn lij bayleym nigusu
Amlak weseb melak ketonu
Hayalu tadgognal ersu (2)

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 3
T’elat yelekosew yefetenaw chbo
Benefse alalefem sigayen leblbo
Kebabilon waey terflech hiywete
Yegeta balemwal bemljaw

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 4
T’la sir kellogn abate (2)
Yewhew mefleqleq liben ayazlm
Alem nidand bihon emneten ayndm
Qirqos eyelut’an kefl endadane

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal

VERSE 5
Demenan sent’qo Gebriel
Ket’fat liyadnegn fet’ene (2)

CHORUS
Keminedew esat nebelbal (2)
Yawet’agn ersu new yetadegegn fet’no Gebriel (2)
Nabukedenets’or menfesu tawkwal
Hilmun yemifeta baleraey shtwal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '59fd0b35-2d73-4243-80bf-bd43a35e11bc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 1
የከለዳውያን አስማት ተዘለፈ
በሰማዩ ምስጢር ገብርኤል
ህይወቴ ከሞት አተረፈ /2/
የእስረኞቹ አለቃ አስፋኒስ ተገርሞ

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 2
ሽብሸባዬን አየ ከእሳቱ ዳር ቆሞ
የአማልክትን ልጅ ባይለይም ንጉሱ
አምላክ ወሰብ መልአክ ከቶኑ
ሃያሉ ታድጎኛል እርሱ /2/

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 3
ጠላት የለኮሰው የፈተናው ችቦ
በነፍሴ አላለፈም ስጋዬን ለብልቦ
ከባቢሎን ዋዕይ ተርፍለች ህይወቴ
የጌታ ባለሟል በምልጃው

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 4
ጥላ ስር ከልሎኝ አባቴ /2/
የውሀው መፍለቅለቅ ልቤን አያዝልም
ዓለም ንዳንድ ቢሆን እምነቴን አይንድም
ቂርቆስ እየሉጣን ከፍል እንዳዳነ

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል

VERSE 5
ደመናን ሰንጥቆ ገብርኤል
ከጥፋት ሊያድነኝ ፈጠነ /2/

CHORUS
ከሚነደው እሳት ነበልባል /2/
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል /2/
ናቡከደነፆር መንፈሱ ታውኳል
ህልሙን የሚፈታ ባለራዕይ ሽቷል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '59fd0b35-2d73-4243-80bf-bd43a35e11bc'::uuid, 'keminedew-esat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cherinetih-new-yaderesegn-esike-zare ("Cherinetih New Yaderesegn Esike Zare")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'dd66d5aa-6d12-455b-85ec-72e92fd53bd1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
ብፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 2
በረሐብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ይቅር በለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 3
ባንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታ ለባርያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 4
ስራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሚያለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 5
እረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበከኝ በህይወቴ
ቅጥሬ አይደፈርም መድኃኒቴ
የኔን ሰራ ተወው ተግባሬንም

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 6
የመስቀሉን ነገር መርሳቴንም
አዚሜን አንሰተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 1
Mebratenm yizhe balt’ebqh
Betalaq yiqrta endatresagn
Bifqr gobgnteh kemot awt’agn
Kebeth erqe mech t’egebkugn

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 2
Bereheb beerzat techegerkugn
Amnalehu amlake endtmregn
Leyqrta met’ahu yiqr belegn
Andach endelelegn awqewalehu

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 3
Bante chernet gin emekalehu
Yekebedew shekme yiqelegnal
Yiqrta lebaryah yidersegnal
Bemeqdesh qome lemezemer

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 4
Sirahn letwld lememesker
Ene manegn biye asbalehu
Amlak chernethn adenqalehu
Besew ej memekat aqumiyalehu

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 5
Eredate ante neh awqeyalehu
Ante ket’ebekegn behywete
Qit’re aydeferm medhanite
Yenen sera tewew tegbarenm

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 6
Yemesqelun neger mersatenm
Azimen anseteh anten liyh
Eyesus Kristos amlake neh

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
ብፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 2
በረሐብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ይቅር በለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 3
ባንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታ ለባርያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 4
ስራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሚያለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 5
እረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበከኝ በህይወቴ
ቅጥሬ አይደፈርም መድኃኒቴ
የኔን ሰራ ተወው ተግባሬንም

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 6
የመስቀሉን ነገር መርሳቴንም
አዚሜን አንሰተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ',
        lyrics_transliteration = 'CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 1
Mebratenm yizhe balt’ebqh
Betalaq yiqrta endatresagn
Bifqr gobgnteh kemot awt’agn
Kebeth erqe mech t’egebkugn

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 2
Bereheb beerzat techegerkugn
Amnalehu amlake endtmregn
Leyqrta met’ahu yiqr belegn
Andach endelelegn awqewalehu

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 3
Bante chernet gin emekalehu
Yekebedew shekme yiqelegnal
Yiqrta lebaryah yidersegnal
Bemeqdesh qome lemezemer

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 4
Sirahn letwld lememesker
Ene manegn biye asbalehu
Amlak chernethn adenqalehu
Besew ej memekat aqumiyalehu

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 5
Eredate ante neh awqeyalehu
Ante ket’ebekegn behywete
Qit’re aydeferm medhanite
Yenen sera tewew tegbarenm

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 6
Yemesqelun neger mersatenm
Azimen anseteh anten liyh
Eyesus Kristos amlake neh

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'dd66d5aa-6d12-455b-85ec-72e92fd53bd1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
ብፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 2
በረሐብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ይቅር በለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 3
ባንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታ ለባርያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 4
ስራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሚያለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 5
እረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበከኝ በህይወቴ
ቅጥሬ አይደፈርም መድኃኒቴ
የኔን ሰራ ተወው ተግባሬንም

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 6
የመስቀሉን ነገር መርሳቴንም
አዚሜን አንሰተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'dd66d5aa-6d12-455b-85ec-72e92fd53bd1'::uuid, 'cherinetih-new-yaderesegn-esike-zare', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- semeshen-litraw-d-zelalem-takele-zegola ("Semeshen litraw D Zelalem Takele Zegola")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5a9474dd-affc-464e-8d58-41c6ef88968f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 1
የምሔድበት የማደርገው ሲቸግረኝ
አልጠራጠር የልቤ ነሽ እረፍቱ
አንቺ ከጎኔ እስከ አለሽ አዛኝቱ
ምልጃሽ ፈጥኖ ይደርሳል

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 2
ሥምሽ ጭንቀት ያስረሳል
ልጥራው ስምሸን ልጥራው
መጽናኛ አርጎ ነው የሠራው
እንኳን አልቅሼ ለምኜሽ ፊትሽ ቁሜ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 3
ቃልን አውጥቼ በስምሽ ተማጽኜ
የውስጤን ጉዳት ታውቄያለሽ የኔ ጥላ
አንቺ ይዤ አላፍርም የነፍሴን ነሽ ከለላ
ምልጃሽ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 4
መረጋጋትን በስምሽ አገኛለሁ
በምልጃሽ ድንግል ያንን ቀን አልፌያለሁ
ጉደለቴን ሸፋኝ ምስጥሬን አልተውሽም
መሸሸጊያን ይዣለሁ አለቅሽም

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 5
ምልጃሽ
የማትረሽኝ ማትሰለች እኔን መርዳት
ማንም ያላየው ምታይው የኔን ጉዳት
ቃላት ማይገለጹት ነገርሽ የጣፈጠ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 6
ምስጋና ለእርሱ አንቺን ለእኛ ለሰጠ
ምልጃሽ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 1
Yemhedbet yemadergew sichegregn
Alt’erat’er yelbe nesh ereftu
Anchi kegone eske alesh azagntu
Miljash fet’no yidersal

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 2
Simsh ch’nqet yasresal
Lit’raw simshen lit’raw
Mets’nagna argo new yeseraw
Enkwan alqshe lemgnesh fitsh qume

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 3
Qaln awt’che besmsh temats’gne
Yewst’en gudat tawqeyalesh yene t’la
Anchi yizhe alafrm yenefsen nesh kelela
Miljash

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 4
Meregagatn besmsh agegnalehu
Bemljash Dingil yann qen alfeyalehu
Gudeleten shefagn mist’ren altewshm
Mesheshegiyan yizhalehu aleqshm

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 5
Miljash
Yematreshgn matselech enen merdat
Manm yalayew mitayw yenen gudat
Qalat maygelets’ut negersh yet’afet’e

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 6
Misgana leersu anchin leegna leset’e
Miljash

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 1
የምሔድበት የማደርገው ሲቸግረኝ
አልጠራጠር የልቤ ነሽ እረፍቱ
አንቺ ከጎኔ እስከ አለሽ አዛኝቱ
ምልጃሽ ፈጥኖ ይደርሳል

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 2
ሥምሽ ጭንቀት ያስረሳል
ልጥራው ስምሸን ልጥራው
መጽናኛ አርጎ ነው የሠራው
እንኳን አልቅሼ ለምኜሽ ፊትሽ ቁሜ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 3
ቃልን አውጥቼ በስምሽ ተማጽኜ
የውስጤን ጉዳት ታውቄያለሽ የኔ ጥላ
አንቺ ይዤ አላፍርም የነፍሴን ነሽ ከለላ
ምልጃሽ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 4
መረጋጋትን በስምሽ አገኛለሁ
በምልጃሽ ድንግል ያንን ቀን አልፌያለሁ
ጉደለቴን ሸፋኝ ምስጥሬን አልተውሽም
መሸሸጊያን ይዣለሁ አለቅሽም

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 5
ምልጃሽ
የማትረሽኝ ማትሰለች እኔን መርዳት
ማንም ያላየው ምታይው የኔን ጉዳት
ቃላት ማይገለጹት ነገርሽ የጣፈጠ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 6
ምስጋና ለእርሱ አንቺን ለእኛ ለሰጠ
ምልጃሽ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ',
        lyrics_transliteration = 'CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 1
Yemhedbet yemadergew sichegregn
Alt’erat’er yelbe nesh ereftu
Anchi kegone eske alesh azagntu
Miljash fet’no yidersal

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 2
Simsh ch’nqet yasresal
Lit’raw simshen lit’raw
Mets’nagna argo new yeseraw
Enkwan alqshe lemgnesh fitsh qume

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 3
Qaln awt’che besmsh temats’gne
Yewst’en gudat tawqeyalesh yene t’la
Anchi yizhe alafrm yenefsen nesh kelela
Miljash

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 4
Meregagatn besmsh agegnalehu
Bemljash Dingil yann qen alfeyalehu
Gudeleten shefagn mist’ren altewshm
Mesheshegiyan yizhalehu aleqshm

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 5
Miljash
Yematreshgn matselech enen merdat
Manm yalayew mitayw yenen gudat
Qalat maygelets’ut negersh yet’afet’e

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn

VERSE 6
Misgana leersu anchin leegna leset’e
Miljash

CHORUS
Simshn lit’raw
Lazene mets’nagna letekefa met’egiya simsh
Libe yiregagal Maryam Maryam silsh
Hulu sich’elm siyasferagn yekebebegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5a9474dd-affc-464e-8d58-41c6ef88968f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 1
የምሔድበት የማደርገው ሲቸግረኝ
አልጠራጠር የልቤ ነሽ እረፍቱ
አንቺ ከጎኔ እስከ አለሽ አዛኝቱ
ምልጃሽ ፈጥኖ ይደርሳል

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 2
ሥምሽ ጭንቀት ያስረሳል
ልጥራው ስምሸን ልጥራው
መጽናኛ አርጎ ነው የሠራው
እንኳን አልቅሼ ለምኜሽ ፊትሽ ቁሜ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 3
ቃልን አውጥቼ በስምሽ ተማጽኜ
የውስጤን ጉዳት ታውቄያለሽ የኔ ጥላ
አንቺ ይዤ አላፍርም የነፍሴን ነሽ ከለላ
ምልጃሽ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 4
መረጋጋትን በስምሽ አገኛለሁ
በምልጃሽ ድንግል ያንን ቀን አልፌያለሁ
ጉደለቴን ሸፋኝ ምስጥሬን አልተውሽም
መሸሸጊያን ይዣለሁ አለቅሽም

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 5
ምልጃሽ
የማትረሽኝ ማትሰለች እኔን መርዳት
ማንም ያላየው ምታይው የኔን ጉዳት
ቃላት ማይገለጹት ነገርሽ የጣፈጠ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ

VERSE 6
ምስጋና ለእርሱ አንቺን ለእኛ ለሰጠ
ምልጃሽ

CHORUS
ስምሽን ልጥራው
ላዘነ መጽናኛ ለተከፋ መጠጊያ ስምሽ
ልቤ ይረጋጋል ማርያም ማርያም ስልሽ
ሁሉ ሲጨልም ሲያስፈራኝ የከበበኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5a9474dd-affc-464e-8d58-41c6ef88968f'::uuid, 'semeshen-litraw-d-zelalem-takele-zegola', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kemey-krseo-zemari-bereket-tikue-eritrean-orthodox-tewahdo-mezmur ("kemey krseo /zemari Bereket tikue/ eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd06c7b11-2f40-48eb-91fa-c2edd6e6667d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 1
ክሳደይ ደኒኑ ዓይነይ ዝነብዕ
ታሪኽ ስለ ዘይብለይ''ዩ ዘኹርዕ
ትማልየይ ቀይርካለይ ኢኻ''ምበር
እንታይ ጽቡቕ ግብሪ ኣሎኒ ውሉድካ ዘብል

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 2
ኣዝ//
ናተይ ኢድ የብሉን ድሕነተይ ብኣኻ''ምበር
ኣብ መስቀል ፈጺምካዮ ናተይ ነገር
ዝውድሰካ ብሓጎስ ዝዝምር

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 3
ደምካ ዝዋሕሱ ኮይነ''ንድየ ዝነብር
ዘማ//
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 4
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 1
Kisadey deninu ayney zinebe
Tariኽ sile zeybley''yu zeኹre
Timalyey qeyrkaley iኻ''miber
Entay ts’buቕ gibri aloni wiludka zebl

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 2
Az//
Natey id yeblun dihnetey biaኻ''miber
Ab mesqel fets’imkayo natey neger
Ziwdseka bihagos zizmr

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 3
Demka ziwahsu koyne''nidye zinebr
Zema//
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 4
Ab libey''yu / (3)/ kirso kemey kiኾneley

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 1
ክሳደይ ደኒኑ ዓይነይ ዝነብዕ
ታሪኽ ስለ ዘይብለይ''ዩ ዘኹርዕ
ትማልየይ ቀይርካለይ ኢኻ''ምበር
እንታይ ጽቡቕ ግብሪ ኣሎኒ ውሉድካ ዘብል

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 2
ኣዝ//
ናተይ ኢድ የብሉን ድሕነተይ ብኣኻ''ምበር
ኣብ መስቀል ፈጺምካዮ ናተይ ነገር
ዝውድሰካ ብሓጎስ ዝዝምር

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 3
ደምካ ዝዋሕሱ ኮይነ''ንድየ ዝነብር
ዘማ//
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 4
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//',
        lyrics_transliteration = 'CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 1
Kisadey deninu ayney zinebe
Tariኽ sile zeybley''yu zeኹre
Timalyey qeyrkaley iኻ''miber
Entay ts’buቕ gibri aloni wiludka zebl

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 2
Az//
Natey id yeblun dihnetey biaኻ''miber
Ab mesqel fets’imkayo natey neger
Ziwdseka bihagos zizmr

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 3
Demka ziwahsu koyne''nidye zinebr
Zema//
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//

VERSE 4
Ab libey''yu / (3)/ kirso kemey kiኾneley

CHORUS
Dem zishefeno gets’ka bifቕri zitemela
Qal hidget hat’yat dimts’ኻ ab qeranyo zitesema
Ab libey''yu / (3)/ kirso kemey kiኾneley
Az//',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd06c7b11-2f40-48eb-91fa-c2edd6e6667d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 1
ክሳደይ ደኒኑ ዓይነይ ዝነብዕ
ታሪኽ ስለ ዘይብለይ''ዩ ዘኹርዕ
ትማልየይ ቀይርካለይ ኢኻ''ምበር
እንታይ ጽቡቕ ግብሪ ኣሎኒ ውሉድካ ዘብል

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 2
ኣዝ//
ናተይ ኢድ የብሉን ድሕነተይ ብኣኻ''ምበር
ኣብ መስቀል ፈጺምካዮ ናተይ ነገር
ዝውድሰካ ብሓጎስ ዝዝምር

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 3
ደምካ ዝዋሕሱ ኮይነ''ንድየ ዝነብር
ዘማ//
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//

VERSE 4
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ

CHORUS
ደም ዝሸፈኖ ገጽካ ብፍቕሪ ዝተመልአ
ቃል ሕድገት ሓጥያት ድምጽኻ ኣብ ቀራንዮ ዝተሰምዐ
ኣብ ልበይ''ዩ //3// ክርስዖ ከመይ ክኾነለይ
ኣዝ//'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd06c7b11-2f40-48eb-91fa-c2edd6e6667d'::uuid, 'kemey-krseo-zemari-bereket-tikue-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yedenagil-memekiya ("Yedenagil Memekiya")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5ac34cdb-f390-40b3-b42d-deba87720c4f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 1
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን
አዝ
ተራራው ዝቅ ይበል ጠማማውም ይቅና

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 2
ካልተስተካከሉ መንገድ የለምና
የእግዚአብሔርን መንገድ እንጥረግ ሁላችን
ማለፊያ እንዲሆነን ለሰማይ ቤታችን
አዝ

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 3
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንጻን አደራህ
በክፉ እንዳንጠፋ እኛ ባሮችህ

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 4
አዝ
ክፋትና ተንኮል ከልባችን ይጥፋ
ፍቅርና ርኅራኄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 5
ሕይወት እንዲሆንን አምላክ ተማጽነናል

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 1
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun
CHORUS
Teraraw ziq yibel t’emamawm yiqna

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 2
Kaltestekakelu menged yelemna
Yeegziabhern menged ent’reg hulachn
Malefiya endihonen lesemay betachn
CHORUS

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 3
Hulet libsoch yalut kemabzat libsn
Lelelew yadlew huletegnawn
Kebedelachnm ants’an aderah
Bekfu endant’efa egna barochh

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 4
CHORUS
Kifatna tenkol kelbachn yit’fa
Fiqrna rihrahe beegna lay yisfafa
Sigana demhn bekbr aggntenal

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 5
Hiywet endihonn amlak temats’nenal

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 1
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን
አዝ
ተራራው ዝቅ ይበል ጠማማውም ይቅና

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 2
ካልተስተካከሉ መንገድ የለምና
የእግዚአብሔርን መንገድ እንጥረግ ሁላችን
ማለፊያ እንዲሆነን ለሰማይ ቤታችን
አዝ

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 3
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንጻን አደራህ
በክፉ እንዳንጠፋ እኛ ባሮችህ

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 4
አዝ
ክፋትና ተንኮል ከልባችን ይጥፋ
ፍቅርና ርኅራኄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 5
ሕይወት እንዲሆንን አምላክ ተማጽነናል

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ',
        lyrics_transliteration = 'CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 1
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun
CHORUS
Teraraw ziq yibel t’emamawm yiqna

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 2
Kaltestekakelu menged yelemna
Yeegziabhern menged ent’reg hulachn
Malefiya endihonen lesemay betachn
CHORUS

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 3
Hulet libsoch yalut kemabzat libsn
Lelelew yadlew huletegnawn
Kebedelachnm ants’an aderah
Bekfu endant’efa egna barochh

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 4
CHORUS
Kifatna tenkol kelbachn yit’fa
Fiqrna rihrahe beegna lay yisfafa
Sigana demhn bekbr aggntenal

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 5
Hiywet endihonn amlak temats’nenal

CHORUS
Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5ac34cdb-f390-40b3-b42d-deba87720c4f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን
አዝ======
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከሉ መንገድ የለምና
የእግዚአብሔርን መንገድ እንጥረግ ሁላችን
ማለፊያ እንዲሆነን ለሰማይ ቤታችን
አዝ= = = = =
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንጻን አደራህ
በክፉ እንዳንጠፋ እኛ ባሮችህ
አዝ= = = = =
ክፋትና ተንኮል ከልባችን ይጥፋ
ፍቅርና ርኅራኄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል
ሕይወት እንዲሆንን አምላክ ተማጽነናል

VERSE 1
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን
አዝ======
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከሉ መንገድ የለምና
የእግዚአብሔርን መንገድ እንጥረግ ሁላችን
ማለፊያ እንዲሆነን ለሰማይ ቤታችን
አዝ= = = = =
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንጻን አደራህ
በክፉ እንዳንጠፋ እኛ ባሮችህ
አዝ= = = = =
ክፋትና ተንኮል ከልባችን ይጥፋ
ፍቅርና ርኅራኄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል
ሕይወት እንዲሆንን አምላክ ተማጽነናል

CHORUS
የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን
አዝ======
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከሉ መንገድ የለምና
የእግዚአብሔርን መንገድ እንጥረግ ሁላችን
ማለፊያ እንዲሆነን ለሰማይ ቤታችን
አዝ= = = = =
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንጻን አደራህ
በክፉ እንዳንጠፋ እኛ ባሮችህ
አዝ= = = = =
ክፋትና ተንኮል ከልባችን ይጥፋ
ፍቅርና ርኅራኄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል
ሕይወት እንዲሆንን አምላክ ተማጽነናል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5ac34cdb-f390-40b3-b42d-deba87720c4f'::uuid, 'yedenagil-memekiya', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yedemasko-merkogna-negn ("Yedemasko Merkogna Negn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fa023369-e56f-4634-82eb-c108f8e2c85e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 1
ዛቻየን አነሳሁ ከወንድሞቸ ላይ
ጉዞየን ጀመርኩኝ በአዲሱ ምዕራፋ ላይ
ሳዖል ከነስሜ ታሪኬ ተዘግቷል
ስሙን ከአመኑት ጋር ስሜ ተቀላቅሏል

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 2
።።።።።።።።።።።አዝ።።።።።።።።።።።።
የፋቅሩ ብርሀን ደማስቆ የጣለኝ
ልቤን አሸንፎ ለአገልግሎት ለየኝ
የመውጊያውን ብረት ላልቃወም ከቶ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 3
አስተምሮኝ ሄደ ፋቅሩ ልቤን መቶ
።።።።።።።።።።አዝ።።።።።።።።።።
ስሙን ያመኑትን ለመግደል ወጥቸ
ተሸንፌ መጣሁ እኔ እራሴን ሞቼ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 4
ገዳይ ነው በፋቅሩ አይተውም አቁስሎ
ሞቴን ወሰደልኝ ህይወት በእጄ ጥሎ
።።።።።።።።።።።።አዝ።።።።።።።።።።።
ለእኔ የሚረባኝን ስለእሱ ንቂያለሁ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 5
ቢሆን በሞቱ እንኳን ልመስለው እወዳለሁ
ግደል ያላቹህኝ ስሙን ያመኑትን
ከሚገደሉት ዘንድ ፈልጉት ጳውሎስን
።።።።።።።።።።።።።አዝ።።።።።።።።።።።

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 6
ለእኔ የሚረባኝ ስለእሱ ንቂያለሁ
ቢሆን በሞቱ እንኳን ልመስለው እሻለሁ
ስሙን ያመኑትን ግደል ያላቹህኝ
ከሚገደሉት ዘንድ እኔኑ ፈልጉኝ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 7
።።።።።።።።።።።አዝ።።።።።።።።

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 1
Zachayen anesahu kewendmoche lay
Guzoyen jemerkugn beadisu mierafa lay
Saol kenesme tarike tezegtwal
Simun keamenut gar sime teqelaqlwal

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 2
...........az............
Yefaqru birhen demasqo yet’alegn
Liben ashenfo leagelglot leyegn
Yemewgiyawn biret lalqawem keto

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 3
Astemrogn hede faqru liben meto
..........az..........
Simun yamenutn lemegdel wet’che
Teshenfe met’ahu ene erasen moche

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 4
Geday new befaqru aytewm aquslo
Moten wesedelgn hiywet beeje t’lo
............az...........
Leene yemirebagnn sileesu niqiyalehu

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 5
Bihon bemotu enkwan limeslew ewedalehu
Gidel yalachuhgn simun yamenutn
Kemigedelut zend felgut p’awlosn
.............az...........

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 6
Leene yemirebagn sileesu niqiyalehu
Bihon bemotu enkwan limeslew eshalehu
Simun yamenutn gidel yalachuhgn
Kemigedelut zend enenu felgugn

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 7
...........az........

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 1
ዛቻየን አነሳሁ ከወንድሞቸ ላይ
ጉዞየን ጀመርኩኝ በአዲሱ ምዕራፋ ላይ
ሳዖል ከነስሜ ታሪኬ ተዘግቷል
ስሙን ከአመኑት ጋር ስሜ ተቀላቅሏል

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 2
።።።።።።።።።።።አዝ።።።።።።።።።።።።
የፋቅሩ ብርሀን ደማስቆ የጣለኝ
ልቤን አሸንፎ ለአገልግሎት ለየኝ
የመውጊያውን ብረት ላልቃወም ከቶ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 3
አስተምሮኝ ሄደ ፋቅሩ ልቤን መቶ
።።።።።።።።።።አዝ።።።።።።።።።።
ስሙን ያመኑትን ለመግደል ወጥቸ
ተሸንፌ መጣሁ እኔ እራሴን ሞቼ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 4
ገዳይ ነው በፋቅሩ አይተውም አቁስሎ
ሞቴን ወሰደልኝ ህይወት በእጄ ጥሎ
።።።።።።።።።።።።አዝ።።።።።።።።።።።
ለእኔ የሚረባኝን ስለእሱ ንቂያለሁ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 5
ቢሆን በሞቱ እንኳን ልመስለው እወዳለሁ
ግደል ያላቹህኝ ስሙን ያመኑትን
ከሚገደሉት ዘንድ ፈልጉት ጳውሎስን
።።።።።።።።።።።።።አዝ።።።።።።።።።።።

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 6
ለእኔ የሚረባኝ ስለእሱ ንቂያለሁ
ቢሆን በሞቱ እንኳን ልመስለው እሻለሁ
ስሙን ያመኑትን ግደል ያላቹህኝ
ከሚገደሉት ዘንድ እኔኑ ፈልጉኝ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 7
።።።።።።።።።።።አዝ።።።።።።።።

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)',
        lyrics_transliteration = 'CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 1
Zachayen anesahu kewendmoche lay
Guzoyen jemerkugn beadisu mierafa lay
Saol kenesme tarike tezegtwal
Simun keamenut gar sime teqelaqlwal

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 2
...........az............
Yefaqru birhen demasqo yet’alegn
Liben ashenfo leagelglot leyegn
Yemewgiyawn biret lalqawem keto

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 3
Astemrogn hede faqru liben meto
..........az..........
Simun yamenutn lemegdel wet’che
Teshenfe met’ahu ene erasen moche

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 4
Geday new befaqru aytewm aquslo
Moten wesedelgn hiywet beeje t’lo
............az...........
Leene yemirebagnn sileesu niqiyalehu

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 5
Bihon bemotu enkwan limeslew ewedalehu
Gidel yalachuhgn simun yamenutn
Kemigedelut zend felgut p’awlosn
.............az...........

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 6
Leene yemirebagn sileesu niqiyalehu
Bihon bemotu enkwan limeslew eshalehu
Simun yamenutn gidel yalachuhgn
Kemigedelut zend enenu felgugn

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 7
...........az........

CHORUS
Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fa023369-e56f-4634-82eb-c108f8e2c85e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 1
ዛቻየን አነሳሁ ከወንድሞቸ ላይ
ጉዞየን ጀመርኩኝ በአዲሱ ምዕራፋ ላይ
ሳዖል ከነስሜ ታሪኬ ተዘግቷል
ስሙን ከአመኑት ጋር ስሜ ተቀላቅሏል

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 2
።።።።።።።።።።።አዝ።።።።።።።።።።።።
የፋቅሩ ብርሀን ደማስቆ የጣለኝ
ልቤን አሸንፎ ለአገልግሎት ለየኝ
የመውጊያውን ብረት ላልቃወም ከቶ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 3
አስተምሮኝ ሄደ ፋቅሩ ልቤን መቶ
።።።።።።።።።።አዝ።።።።።።።።።።
ስሙን ያመኑትን ለመግደል ወጥቸ
ተሸንፌ መጣሁ እኔ እራሴን ሞቼ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 4
ገዳይ ነው በፋቅሩ አይተውም አቁስሎ
ሞቴን ወሰደልኝ ህይወት በእጄ ጥሎ
።።።።።።።።።።።።አዝ።።።።።።።።።።።
ለእኔ የሚረባኝን ስለእሱ ንቂያለሁ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 5
ቢሆን በሞቱ እንኳን ልመስለው እወዳለሁ
ግደል ያላቹህኝ ስሙን ያመኑትን
ከሚገደሉት ዘንድ ፈልጉት ጳውሎስን
።።።።።።።።።።።።።አዝ።።።።።።።።።።።

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 6
ለእኔ የሚረባኝ ስለእሱ ንቂያለሁ
ቢሆን በሞቱ እንኳን ልመስለው እሻለሁ
ስሙን ያመኑትን ግደል ያላቹህኝ
ከሚገደሉት ዘንድ እኔኑ ፈልጉኝ

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 7
።።።።።።።።።።።አዝ።።።።።።።።

CHORUS
የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fa023369-e56f-4634-82eb-c108f8e2c85e'::uuid, 'yedemasko-merkogna-negn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mezmur-by-besufekad-andargachew ("mezmur by Besufekad Andargachew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5d8a20f4-a975-4e00-8272-0c29bac26d1d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 1
ቸሩ አባታችን "
መች ትገኝ ነበረ "
ገነት ምድራችን "
ብርሃን ወጣላቸው እሰይእሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 2
ለመላ ሕዝቦቹ "
በጨለማው ጉዞ "
እንዲያሲሰላቹ "
እንደ ጠል ወረደ እሰይ እሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 3
ከሰማይ ወደ እኛ "
ወገኖቹን ሊያድን "
ከኃጢአት ቁራኛ "
እግዚአብሔር አብ ላከ እሰይ እሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 4
አንድያ ልጁን "
እርሱ ወዷልና "
እንዲሁ ዓለሙን "

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 1
Cheru Abatachen "
Mech tigegn nebere "
Genet midrachn "
Birhan wet’alachew eseyesey

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 2
Lemela hizbochu "
Bech’elemaw guzo "
Endiyasiselachu "
Ende t’el werede esey esey

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 3
Kesemay wede egna "
Wegenochun liyadn "
Kehat’iat quragna "
Egziabher Ab lake esey esey

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 4
Andya lijun "
Ersu wedwalna "
Endihu alemun "

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 1
ቸሩ አባታችን "
መች ትገኝ ነበረ "
ገነት ምድራችን "
ብርሃን ወጣላቸው እሰይእሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 2
ለመላ ሕዝቦቹ "
በጨለማው ጉዞ "
እንዲያሲሰላቹ "
እንደ ጠል ወረደ እሰይ እሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 3
ከሰማይ ወደ እኛ "
ወገኖቹን ሊያድን "
ከኃጢአት ቁራኛ "
እግዚአብሔር አብ ላከ እሰይ እሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 4
አንድያ ልጁን "
እርሱ ወዷልና "
እንዲሁ ዓለሙን "

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ',
        lyrics_transliteration = 'CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 1
Cheru Abatachen "
Mech tigegn nebere "
Genet midrachn "
Birhan wet’alachew eseyesey

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 2
Lemela hizbochu "
Bech’elemaw guzo "
Endiyasiselachu "
Ende t’el werede esey esey

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 3
Kesemay wede egna "
Wegenochun liyadn "
Kehat’iat quragna "
Egziabher Ab lake esey esey

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 4
Andya lijun "
Ersu wedwalna "
Endihu alemun "

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5d8a20f4-a975-4e00-8272-0c29bac26d1d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 1
ቸሩ አባታችን "
መች ትገኝ ነበረ "
ገነት ምድራችን "
ብርሃን ወጣላቸው እሰይእሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 2
ለመላ ሕዝቦቹ "
በጨለማው ጉዞ "
እንዲያሲሰላቹ "
እንደ ጠል ወረደ እሰይ እሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 3
ከሰማይ ወደ እኛ "
ወገኖቹን ሊያድን "
ከኃጢአት ቁራኛ "
እግዚአብሔር አብ ላከ እሰይ እሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 4
አንድያ ልጁን "
እርሱ ወዷልና "
እንዲሁ ዓለሙን "

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5d8a20f4-a975-4e00-8272-0c29bac26d1d'::uuid, 'mezmur-by-besufekad-andargachew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mikael-silew-mikael ("Mikael Silew Mikael")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cd5b2e99-b3c8-4d9a-b60f-65b5c95cae18'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 1
የአፎሚያ ረዳት የባህራን አባት
እስራኤል ዘስጋን የመራቸው ከፊት
ዛሬ አስምር ብለው ደጁ ለሚጠኑ
ከአምላክ የተሰጠው ፅኑ ናት ኪዳኑ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 2
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
መንገድ ለጠፋው ሰው ለሚቅበዘበዘው
አንገቱን በሐዘን ለሚወዘውዘው

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 3
ምልጃህ ነው የረዳው ጌታ ፊት መቆምህ
ለእኔም መልስ ሆነሃል ሚካኤል ሆይ ስልህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 4
ስምህክን እየጠራሁ ደጅህ አድጌያለሁ
ምልጃህ እያገዘኝ ስንቱን አልፌለሁ
ለሰው ማይነገር ላንተ የነገሬህ
ችግሬ ተፈቷል በፊቴ ቀድመህ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 5
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
የመዳንን መንገድ መንግስቱን እንድወርስ
ስደክም ያገዝከኝ ቀርበኸኝ በሞገስ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 6
ሃይላት ስልጣናትን መናፍቱን ረትተህ
በሰማይ አልፈሃል ሚካኤል ድንቅ ነህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 1
Yeafomiya redat yebahran abat
Esrael zesgan yemerachew kefit
Zare asmr bilew deju lemit’enu
Keamlak yeteset’ew ts’nu nat kidanu

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 2
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn
Menged let’efaw sew lemiqbezebezew
Angetun behezen lemiwezewzew

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 3
Miljah new yeredaw Geta fit meqomh
Leenem mels honehal Mikael hoy silh
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 4
Simhkn eyet’erahu dejh adgeyalehu
Miljah eyagezegn sintun alfelehu
Lesew mayneger lante yenegereh
Chgre tefetwal befite qedmeh

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 5
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn
Yemedann menged mengstun endwers
Sidekm yagezkegn qerbeኸgn bemoges

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 6
Haylat silt’anatn menaftun retteh
Besemay alfehal Mikael dinq neh
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 1
የአፎሚያ ረዳት የባህራን አባት
እስራኤል ዘስጋን የመራቸው ከፊት
ዛሬ አስምር ብለው ደጁ ለሚጠኑ
ከአምላክ የተሰጠው ፅኑ ናት ኪዳኑ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 2
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
መንገድ ለጠፋው ሰው ለሚቅበዘበዘው
አንገቱን በሐዘን ለሚወዘውዘው

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 3
ምልጃህ ነው የረዳው ጌታ ፊት መቆምህ
ለእኔም መልስ ሆነሃል ሚካኤል ሆይ ስልህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 4
ስምህክን እየጠራሁ ደጅህ አድጌያለሁ
ምልጃህ እያገዘኝ ስንቱን አልፌለሁ
ለሰው ማይነገር ላንተ የነገሬህ
ችግሬ ተፈቷል በፊቴ ቀድመህ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 5
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
የመዳንን መንገድ መንግስቱን እንድወርስ
ስደክም ያገዝከኝ ቀርበኸኝ በሞገስ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 6
ሃይላት ስልጣናትን መናፍቱን ረትተህ
በሰማይ አልፈሃል ሚካኤል ድንቅ ነህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል',
        lyrics_transliteration = 'CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 1
Yeafomiya redat yebahran abat
Esrael zesgan yemerachew kefit
Zare asmr bilew deju lemit’enu
Keamlak yeteset’ew ts’nu nat kidanu

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 2
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn
Menged let’efaw sew lemiqbezebezew
Angetun behezen lemiwezewzew

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 3
Miljah new yeredaw Geta fit meqomh
Leenem mels honehal Mikael hoy silh
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 4
Simhkn eyet’erahu dejh adgeyalehu
Miljah eyagezegn sintun alfelehu
Lesew mayneger lante yenegereh
Chgre tefetwal befite qedmeh

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 5
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn
Yemedann menged mengstun endwers
Sidekm yagezkegn qerbeኸgn bemoges

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 6
Haylat silt’anatn menaftun retteh
Besemay alfehal Mikael dinq neh
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cd5b2e99-b3c8-4d9a-b60f-65b5c95cae18'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 1
የአፎሚያ ረዳት የባህራን አባት
እስራኤል ዘስጋን የመራቸው ከፊት
ዛሬ አስምር ብለው ደጁ ለሚጠኑ
ከአምላክ የተሰጠው ፅኑ ናት ኪዳኑ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 2
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
መንገድ ለጠፋው ሰው ለሚቅበዘበዘው
አንገቱን በሐዘን ለሚወዘውዘው

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 3
ምልጃህ ነው የረዳው ጌታ ፊት መቆምህ
ለእኔም መልስ ሆነሃል ሚካኤል ሆይ ስልህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 4
ስምህክን እየጠራሁ ደጅህ አድጌያለሁ
ምልጃህ እያገዘኝ ስንቱን አልፌለሁ
ለሰው ማይነገር ላንተ የነገሬህ
ችግሬ ተፈቷል በፊቴ ቀድመህ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 5
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
የመዳንን መንገድ መንግስቱን እንድወርስ
ስደክም ያገዝከኝ ቀርበኸኝ በሞገስ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 6
ሃይላት ስልጣናትን መናፍቱን ረትተህ
በሰማይ አልፈሃል ሚካኤል ድንቅ ነህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cd5b2e99-b3c8-4d9a-b60f-65b5c95cae18'::uuid, 'mikael-silew-mikael', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yom-fisiha-kone ("Yom Fisiha Kone")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5d6b68cf-1143-4c7c-9839-92c0f3b7f32b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 1
ቅዱስ ያሬድ ፣ ሉቃ. 2:10
የያዕቆብ ኮከብ ፍስሐ ኮነ
የዳዊት ሆድ ፍሬ ፍስሐ ኮነ
የአብርሃም ተስፋ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 2
ተፈጸመ ዛሬ ፍስሐ ኮነ
የሰው ልጆች ሁሉ ፍስሐ ኮነ
በአንድነት ተነሡ ፍስሐ ኮነ
መድኃኒት ተወልዶአል ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 3
እልል በሉ ለእሱ ፍስሐ ኮነ
ዘኁ. 24:17 ፤ መዝ. 131:11
አንቺ ቤተልሔም ፍስሐ ኮነ
የዳዊት ከተማ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 4
ተንቀሽ አትቀሪም ፍስሐ ኮነ
ተብለሽ ባድማ ፍስሐ ኮነ
የብርሃን ድንኳን ፍስሐ ኮነ
ባንቺ ተተከለ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 5
ጎዳናሽ አበራ ፍስሐ ኮነ
ሰማይን መሰለ ፍስሐ ኮነ
ሚክ. 5:2 ፤ አርጋኖን ዘሰኑይ
እረኞች ሆይ ስሙ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 6
ተአምር ልንገራችሁ ፍስሐ ኮነ
ቤተ ልሔም ሒዱ ፍስሐ ኮነ
በጎቹን ትታችሁ ፍስሐ ኮነ
በፍጥነት ገስግሡ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 7
ማንም ሳይቀድማችሁ ፍስሐ ኮነ
ለዓለም የሚበቃ ፍስሐ ኮነ
በግ ታገኛላችሁ ፍስሐ ኮነ
ሉቃ. 2:12 ፤ ዮሐ. 1:36

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 8
ድንቅ መካር ኃያል ፍስሐ ኮነ
የሰላም አለቃ ፍስሐ ኮነ
ተወልዶ ሲገለጥ ፍስሐ ኮነ
ዕንባችን አበቃ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 9
የእኛ መድኃኔዓለም ፍስሐ ኮነ
የእኛ ንጉሥ ፍስሐ ኮነ
ተወልደህ ወለድኸን ፍስሐ ኮነ
ስምህ ይቀደስ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 10
ኢሳ. 9:6 ፤ ማቴ. 9
መላእክት ዘመሩ ፍስሐ ኮነ
ሔሮድስ ተጨነቀ ፍስሐ ኮነ
አህያ ገዢውን ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 11
አምላኩን አወቀ ፍስሐ ኮነ
ኮከብ መንገድ መራ ፍስሐ ኮነ
ነገሥታት ሰገዱ ፍስሐ ኮነ
የዚህ ድንቅ ሕፃን ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 12
ልዩ ነው መንገዱ ፍስሐ ኮነ
ማቴ. 2:3 ፤ ኢሳ. 1:3
እሳት ተሸክማ ፍስሐ ኮነ
እሳት የወለደች ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 13
እሳትን ታቅፋ ፍስሐ ኮነ
እሳት ያሳደገች ፍስሐ ኮነ
ዕፀ ጳጦስ ሆና ፍስሐ ኮነ
በሲና ያያት ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 14
አምላክን የቻለች ፍስሐ ኮነ
ድንግል ማርያም ናት ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 1
Kidus yared , luqa. 2:10
Yeyaeqob kokeb fishe kone
Yedawit hod fire fishe kone
Yeabrham tesfa fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 2
Tefets’eme zare fishe kone
Yesew lijoch hulu fishe kone
Beandnet tenesu fishe kone
Medhanit teweldoal fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 3
Ell belu leesu fishe kone
Zehu. 24:17 ; mez. 131:11
Anchi betelhem fishe kone
Yedawit ketema fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 4
Tenqesh atqerim fishe kone
Teblesh badma fishe kone
Yebrhan dinkwan fishe kone
Banchi tetekele fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 5
Godanash abera fishe kone
Semayn mesele fishe kone
Mik. 5:2 ; arganon zesenuy
Eregnoch hoy simu fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 6
Teamr lingerachhu fishe kone
Bete lihem hidu fishe kone
Begochun titachhu fishe kone
Beft’net gesgsu fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 7
Manm sayqedmachhu fishe kone
Lealem yemibeqa fishe kone
Beg tagegnalachhu fishe kone
Luqa. 2:12 ; yohe. 1:36

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 8
Dinq mekar hayal fishe kone
Yeselam aleqa fishe kone
Teweldo sigelet’ fishe kone
Enbachn abeqa fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 9
Yeegna Medhanealem fishe kone
Yeegna nigus fishe kone
Teweldeh weledኸn fishe kone
Simh yiqedes fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 10
Isa. 9:6 ; mate. 9
Melaekt zemeru fishe kone
Herods tech’eneqe fishe kone
Ahya gezhiwn fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 11
Amlakun aweqe fishe kone
Kokeb menged mera fishe kone
Negestat segedu fishe kone
Yezih dinq hits’an fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 12
Liyu new mengedu fishe kone
Mate. 2:3 ; isa. 1:3
Esat teshekma fishe kone
Esat yeweledech fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 13
Esatn taqfa fishe kone
Esat yasadegech fishe kone
Ets’e p’at’os hona fishe kone
Besina yayat fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 14
Amlakn yechalech fishe kone
Dingil Maryam nat fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 1
ቅዱስ ያሬድ ፣ ሉቃ. 2:10
የያዕቆብ ኮከብ ፍስሐ ኮነ
የዳዊት ሆድ ፍሬ ፍስሐ ኮነ
የአብርሃም ተስፋ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 2
ተፈጸመ ዛሬ ፍስሐ ኮነ
የሰው ልጆች ሁሉ ፍስሐ ኮነ
በአንድነት ተነሡ ፍስሐ ኮነ
መድኃኒት ተወልዶአል ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 3
እልል በሉ ለእሱ ፍስሐ ኮነ
ዘኁ. 24:17 ፤ መዝ. 131:11
አንቺ ቤተልሔም ፍስሐ ኮነ
የዳዊት ከተማ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 4
ተንቀሽ አትቀሪም ፍስሐ ኮነ
ተብለሽ ባድማ ፍስሐ ኮነ
የብርሃን ድንኳን ፍስሐ ኮነ
ባንቺ ተተከለ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 5
ጎዳናሽ አበራ ፍስሐ ኮነ
ሰማይን መሰለ ፍስሐ ኮነ
ሚክ. 5:2 ፤ አርጋኖን ዘሰኑይ
እረኞች ሆይ ስሙ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 6
ተአምር ልንገራችሁ ፍስሐ ኮነ
ቤተ ልሔም ሒዱ ፍስሐ ኮነ
በጎቹን ትታችሁ ፍስሐ ኮነ
በፍጥነት ገስግሡ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 7
ማንም ሳይቀድማችሁ ፍስሐ ኮነ
ለዓለም የሚበቃ ፍስሐ ኮነ
በግ ታገኛላችሁ ፍስሐ ኮነ
ሉቃ. 2:12 ፤ ዮሐ. 1:36

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 8
ድንቅ መካር ኃያል ፍስሐ ኮነ
የሰላም አለቃ ፍስሐ ኮነ
ተወልዶ ሲገለጥ ፍስሐ ኮነ
ዕንባችን አበቃ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 9
የእኛ መድኃኔዓለም ፍስሐ ኮነ
የእኛ ንጉሥ ፍስሐ ኮነ
ተወልደህ ወለድኸን ፍስሐ ኮነ
ስምህ ይቀደስ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 10
ኢሳ. 9:6 ፤ ማቴ. 9
መላእክት ዘመሩ ፍስሐ ኮነ
ሔሮድስ ተጨነቀ ፍስሐ ኮነ
አህያ ገዢውን ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 11
አምላኩን አወቀ ፍስሐ ኮነ
ኮከብ መንገድ መራ ፍስሐ ኮነ
ነገሥታት ሰገዱ ፍስሐ ኮነ
የዚህ ድንቅ ሕፃን ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 12
ልዩ ነው መንገዱ ፍስሐ ኮነ
ማቴ. 2:3 ፤ ኢሳ. 1:3
እሳት ተሸክማ ፍስሐ ኮነ
እሳት የወለደች ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 13
እሳትን ታቅፋ ፍስሐ ኮነ
እሳት ያሳደገች ፍስሐ ኮነ
ዕፀ ጳጦስ ሆና ፍስሐ ኮነ
በሲና ያያት ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 14
አምላክን የቻለች ፍስሐ ኮነ
ድንግል ማርያም ናት ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን',
        lyrics_transliteration = 'CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 1
Kidus yared , luqa. 2:10
Yeyaeqob kokeb fishe kone
Yedawit hod fire fishe kone
Yeabrham tesfa fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 2
Tefets’eme zare fishe kone
Yesew lijoch hulu fishe kone
Beandnet tenesu fishe kone
Medhanit teweldoal fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 3
Ell belu leesu fishe kone
Zehu. 24:17 ; mez. 131:11
Anchi betelhem fishe kone
Yedawit ketema fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 4
Tenqesh atqerim fishe kone
Teblesh badma fishe kone
Yebrhan dinkwan fishe kone
Banchi tetekele fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 5
Godanash abera fishe kone
Semayn mesele fishe kone
Mik. 5:2 ; arganon zesenuy
Eregnoch hoy simu fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 6
Teamr lingerachhu fishe kone
Bete lihem hidu fishe kone
Begochun titachhu fishe kone
Beft’net gesgsu fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 7
Manm sayqedmachhu fishe kone
Lealem yemibeqa fishe kone
Beg tagegnalachhu fishe kone
Luqa. 2:12 ; yohe. 1:36

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 8
Dinq mekar hayal fishe kone
Yeselam aleqa fishe kone
Teweldo sigelet’ fishe kone
Enbachn abeqa fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 9
Yeegna Medhanealem fishe kone
Yeegna nigus fishe kone
Teweldeh weledኸn fishe kone
Simh yiqedes fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 10
Isa. 9:6 ; mate. 9
Melaekt zemeru fishe kone
Herods tech’eneqe fishe kone
Ahya gezhiwn fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 11
Amlakun aweqe fishe kone
Kokeb menged mera fishe kone
Negestat segedu fishe kone
Yezih dinq hits’an fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 12
Liyu new mengedu fishe kone
Mate. 2:3 ; isa. 1:3
Esat teshekma fishe kone
Esat yeweledech fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 13
Esatn taqfa fishe kone
Esat yasadegech fishe kone
Ets’e p’at’os hona fishe kone
Besina yayat fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 14
Amlakn yechalech fishe kone
Dingil Maryam nat fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5d6b68cf-1143-4c7c-9839-92c0f3b7f32b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 1
ቅዱስ ያሬድ ፣ ሉቃ. 2:10
የያዕቆብ ኮከብ ፍስሐ ኮነ
የዳዊት ሆድ ፍሬ ፍስሐ ኮነ
የአብርሃም ተስፋ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 2
ተፈጸመ ዛሬ ፍስሐ ኮነ
የሰው ልጆች ሁሉ ፍስሐ ኮነ
በአንድነት ተነሡ ፍስሐ ኮነ
መድኃኒት ተወልዶአል ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 3
እልል በሉ ለእሱ ፍስሐ ኮነ
ዘኁ. 24:17 ፤ መዝ. 131:11
አንቺ ቤተልሔም ፍስሐ ኮነ
የዳዊት ከተማ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 4
ተንቀሽ አትቀሪም ፍስሐ ኮነ
ተብለሽ ባድማ ፍስሐ ኮነ
የብርሃን ድንኳን ፍስሐ ኮነ
ባንቺ ተተከለ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 5
ጎዳናሽ አበራ ፍስሐ ኮነ
ሰማይን መሰለ ፍስሐ ኮነ
ሚክ. 5:2 ፤ አርጋኖን ዘሰኑይ
እረኞች ሆይ ስሙ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 6
ተአምር ልንገራችሁ ፍስሐ ኮነ
ቤተ ልሔም ሒዱ ፍስሐ ኮነ
በጎቹን ትታችሁ ፍስሐ ኮነ
በፍጥነት ገስግሡ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 7
ማንም ሳይቀድማችሁ ፍስሐ ኮነ
ለዓለም የሚበቃ ፍስሐ ኮነ
በግ ታገኛላችሁ ፍስሐ ኮነ
ሉቃ. 2:12 ፤ ዮሐ. 1:36

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 8
ድንቅ መካር ኃያል ፍስሐ ኮነ
የሰላም አለቃ ፍስሐ ኮነ
ተወልዶ ሲገለጥ ፍስሐ ኮነ
ዕንባችን አበቃ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 9
የእኛ መድኃኔዓለም ፍስሐ ኮነ
የእኛ ንጉሥ ፍስሐ ኮነ
ተወልደህ ወለድኸን ፍስሐ ኮነ
ስምህ ይቀደስ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 10
ኢሳ. 9:6 ፤ ማቴ. 9
መላእክት ዘመሩ ፍስሐ ኮነ
ሔሮድስ ተጨነቀ ፍስሐ ኮነ
አህያ ገዢውን ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 11
አምላኩን አወቀ ፍስሐ ኮነ
ኮከብ መንገድ መራ ፍስሐ ኮነ
ነገሥታት ሰገዱ ፍስሐ ኮነ
የዚህ ድንቅ ሕፃን ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 12
ልዩ ነው መንገዱ ፍስሐ ኮነ
ማቴ. 2:3 ፤ ኢሳ. 1:3
እሳት ተሸክማ ፍስሐ ኮነ
እሳት የወለደች ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 13
እሳትን ታቅፋ ፍስሐ ኮነ
እሳት ያሳደገች ፍስሐ ኮነ
ዕፀ ጳጦስ ሆና ፍስሐ ኮነ
በሲና ያያት ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 14
አምላክን የቻለች ፍስሐ ኮነ
ድንግል ማርያም ናት ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5d6b68cf-1143-4c7c-9839-92c0f3b7f32b'::uuid, 'yom-fisiha-kone', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- le-abriham-endemale ("LE ABRIHAM ENDEMALE")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '005fd8bf-3e5e-4869-8de0-83012ad34b93'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 1
የማለውን መሐላ ሳይረሳ ጌታ
ሕዝቡን በጽኑ ደዌ በሞት ሳይመታ
ለአባቶቻችን እንደማለላቸው
ቃሉን ፈጸመ በቃልኪዳናቸው

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 2
እግዚአብሔር በሙሴ ሕግ ባሕር ከፈለ
ከፈርዖን ሠራዊት ሕዝቡን ከለለ
እግዚአብሔር ከኖኅ ፈጸመ መሐላ
ምድር እንዳትጠፋ ከእንግዲህ በኋላ

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 3
በጥላ በልብሳቸው ድውይ ፈወሱ
ምስክሮቹ ሆነው ተመላለሱ
ጌታ ስላለ ከቅዱሳን ጋር
ሥልጣን ሰጣቸው በሰማይ በምድር

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 4
እንደ ደመና ሰፍረው በዙሪያችን
ስላሉን ምስክሮች ለነፍሳችን
እንድንማጸን በሕያው ስማቸው
አሉ በቀኙ ስላከበራቸው

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 1
Yemalewn mehela sayresa Geta
Hizbun bets’nu dewe bemot saymeta
Leabatochachn endemalelachew
Qalun fets’eme beqalkidanachew

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 2
Egziabher bemuse hig bahr kefele
Keferon serawit hizbun kelele
Egziabher kenoh fets’eme mehela
Midr endatt’efa keengdih behwala

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 3
Bet’la belbsachew diwy fewesu
Miskrochu honew temelalesu
Geta silale keqdusan gar
Silt’an set’achew besemay bemdr

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 4
Ende demena sefrew bezuriyachn
Silalun miskroch lenefsachn
Endnmats’en behyaw simachew
Alu beqegnu silakeberachew

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 1
የማለውን መሐላ ሳይረሳ ጌታ
ሕዝቡን በጽኑ ደዌ በሞት ሳይመታ
ለአባቶቻችን እንደማለላቸው
ቃሉን ፈጸመ በቃልኪዳናቸው

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 2
እግዚአብሔር በሙሴ ሕግ ባሕር ከፈለ
ከፈርዖን ሠራዊት ሕዝቡን ከለለ
እግዚአብሔር ከኖኅ ፈጸመ መሐላ
ምድር እንዳትጠፋ ከእንግዲህ በኋላ

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 3
በጥላ በልብሳቸው ድውይ ፈወሱ
ምስክሮቹ ሆነው ተመላለሱ
ጌታ ስላለ ከቅዱሳን ጋር
ሥልጣን ሰጣቸው በሰማይ በምድር

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 4
እንደ ደመና ሰፍረው በዙሪያችን
ስላሉን ምስክሮች ለነፍሳችን
እንድንማጸን በሕያው ስማቸው
አሉ በቀኙ ስላከበራቸው

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ',
        lyrics_transliteration = 'CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 1
Yemalewn mehela sayresa Geta
Hizbun bets’nu dewe bemot saymeta
Leabatochachn endemalelachew
Qalun fets’eme beqalkidanachew

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 2
Egziabher bemuse hig bahr kefele
Keferon serawit hizbun kelele
Egziabher kenoh fets’eme mehela
Midr endatt’efa keengdih behwala

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 3
Bet’la belbsachew diwy fewesu
Miskrochu honew temelalesu
Geta silale keqdusan gar
Silt’an set’achew besemay bemdr

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 4
Ende demena sefrew bezuriyachn
Silalun miskroch lenefsachn
Endnmats’en behyaw simachew
Alu beqegnu silakeberachew

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere',
        updated_at = clock_timestamp()::text
    WHERE import_id = '005fd8bf-3e5e-4869-8de0-83012ad34b93'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 1
የማለውን መሐላ ሳይረሳ ጌታ
ሕዝቡን በጽኑ ደዌ በሞት ሳይመታ
ለአባቶቻችን እንደማለላቸው
ቃሉን ፈጸመ በቃልኪዳናቸው

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 2
እግዚአብሔር በሙሴ ሕግ ባሕር ከፈለ
ከፈርዖን ሠራዊት ሕዝቡን ከለለ
እግዚአብሔር ከኖኅ ፈጸመ መሐላ
ምድር እንዳትጠፋ ከእንግዲህ በኋላ

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 3
በጥላ በልብሳቸው ድውይ ፈወሱ
ምስክሮቹ ሆነው ተመላለሱ
ጌታ ስላለ ከቅዱሳን ጋር
ሥልጣን ሰጣቸው በሰማይ በምድር

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 4
እንደ ደመና ሰፍረው በዙሪያችን
ስላሉን ምስክሮች ለነፍሳችን
እንድንማጸን በሕያው ስማቸው
አሉ በቀኙ ስላከበራቸው

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '005fd8bf-3e5e-4869-8de0-83012ad34b93'::uuid, 'le-abriham-endemale', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lewahiyu-liba ("Lewahiyu Liba #")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '02d6c807-e34d-4603-af63-ea22d1699d74'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 1
ወዲ ሰብ ክጠፍእ ልባ ዘይገብረላ
ኪዳና ኣሚኑ ኣደይ ንዝበላ
ዓስብ ዘይትከልኦ ንዝተማሕጽና
ፍጹም እትረድኦ ብፍቅሪ ጠሚታ(3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 2
ኣብቲ ህሮሩማ ኣብቲ ሽግር ግዜ
ኣብቲ ምድረበዳ ሓዘን ምስ ትካዜ
ደቀይ ይንድያ ትብል ንብዓት ኣቀዲማ
ጸግዒ ናይ ውጹዓት ጸገምና ጸገማ (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 3
ንድኹማን ትቀውም ኣብ የማን ወዳ
ፍጹም ኸይንጠፍእ ምሕረት ዝልማዳ
ኣሕሊፋ ዘይትህብ ዘውትር ኣማሊዳ
ጽብቁና ትምነ ''ደ'' ፍቅርና ዘንድዳ (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 4
ዘይትጠፍእ ብርሃን ናይ ኩሉና ተስፋ
ጸልማትና ኣብሪሃቶ ጸሓይ ተወንዚፋ
ብርሃንዩ መንገድና ማርያምና ሒዝና
ለዋህዩ ድዩ ልባ ርህርህተ ህሊና (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 1
Wedi seb kit’efe liba zeygebrela
Kidana aminu adey nizbela
Asb zeytkelo niztemahts’na
Fits’um etredo bifqri t’emita (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 2
Abti hiroruma abti shgr gize
Abti midrebeda hazen mis tikaze
Deqey yindya tibl nibat aqedima
Ts’egi nay wits’uat ts’egemna ts’egema (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 3
Nidኹman tiqewm ab yeman weda
Fits’um ኸynt’efe mihret zilmada
Ahlifa zeythb zewtr amalida
Ts’bquna timne ''de'' fiqrna zendda (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 4
Zeytt’efe birhan nay kuluna tesfa
Ts’elmatna abrihato ts’ehay tewenzifa
Birhanyu mengedna maryamna hizna
Lewahyu diyu liba rihrhte hilina (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 1
ወዲ ሰብ ክጠፍእ ልባ ዘይገብረላ
ኪዳና ኣሚኑ ኣደይ ንዝበላ
ዓስብ ዘይትከልኦ ንዝተማሕጽና
ፍጹም እትረድኦ ብፍቅሪ ጠሚታ(3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 2
ኣብቲ ህሮሩማ ኣብቲ ሽግር ግዜ
ኣብቲ ምድረበዳ ሓዘን ምስ ትካዜ
ደቀይ ይንድያ ትብል ንብዓት ኣቀዲማ
ጸግዒ ናይ ውጹዓት ጸገምና ጸገማ (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 3
ንድኹማን ትቀውም ኣብ የማን ወዳ
ፍጹም ኸይንጠፍእ ምሕረት ዝልማዳ
ኣሕሊፋ ዘይትህብ ዘውትር ኣማሊዳ
ጽብቁና ትምነ ''ደ'' ፍቅርና ዘንድዳ (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 4
ዘይትጠፍእ ብርሃን ናይ ኩሉና ተስፋ
ጸልማትና ኣብሪሃቶ ጸሓይ ተወንዚፋ
ብርሃንዩ መንገድና ማርያምና ሒዝና
ለዋህዩ ድዩ ልባ ርህርህተ ህሊና (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ',
        lyrics_transliteration = 'CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 1
Wedi seb kit’efe liba zeygebrela
Kidana aminu adey nizbela
Asb zeytkelo niztemahts’na
Fits’um etredo bifqri t’emita (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 2
Abti hiroruma abti shgr gize
Abti midrebeda hazen mis tikaze
Deqey yindya tibl nibat aqedima
Ts’egi nay wits’uat ts’egemna ts’egema (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 3
Nidኹman tiqewm ab yeman weda
Fits’um ኸynt’efe mihret zilmada
Ahlifa zeythb zewtr amalida
Ts’bquna timne ''de'' fiqrna zendda (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 4
Zeytt’efe birhan nay kuluna tesfa
Ts’elmatna abrihato ts’ehay tewenzifa
Birhanyu mengedna maryamna hizna
Lewahyu diyu liba rihrhte hilina (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno',
        updated_at = clock_timestamp()::text
    WHERE import_id = '02d6c807-e34d-4603-af63-ea22d1699d74'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 1
ወዲ ሰብ ክጠፍእ ልባ ዘይገብረላ
ኪዳና ኣሚኑ ኣደይ ንዝበላ
ዓስብ ዘይትከልኦ ንዝተማሕጽና
ፍጹም እትረድኦ ብፍቅሪ ጠሚታ(3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 2
ኣብቲ ህሮሩማ ኣብቲ ሽግር ግዜ
ኣብቲ ምድረበዳ ሓዘን ምስ ትካዜ
ደቀይ ይንድያ ትብል ንብዓት ኣቀዲማ
ጸግዒ ናይ ውጹዓት ጸገምና ጸገማ (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 3
ንድኹማን ትቀውም ኣብ የማን ወዳ
ፍጹም ኸይንጠፍእ ምሕረት ዝልማዳ
ኣሕሊፋ ዘይትህብ ዘውትር ኣማሊዳ
ጽብቁና ትምነ ''ደ'' ፍቅርና ዘንድዳ (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 4
ዘይትጠፍእ ብርሃን ናይ ኩሉና ተስፋ
ጸልማትና ኣብሪሃቶ ጸሓይ ተወንዚፋ
ብርሃንዩ መንገድና ማርያምና ሒዝና
ለዋህዩ ድዩ ልባ ርህርህተ ህሊና (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '02d6c807-e34d-4603-af63-ea22d1699d74'::uuid, 'lewahiyu-liba', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-holy-apostle ("The Holy Apostle")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b1deebb1-6fe4-4149-9f72-dc18d53609d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 1
So God may save our souls
Out of his mercy and his compassion, for the sake of his holy name!
The Holy Apostle Saint Paul, the righteous,
The healer of the sick, your message is virtuous!

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 2
Beseech beseech and pray for all of us
So God may save our souls /x2/
The persecutor who turned out to be God’s messenger
And a pharisee yet a teacher for non-believers

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 3
We learned from you that God can change our past
Through our life if we preach the crucified Christ
You discount your status for the sake of those who are lost
Enduring many trials, you preached Jesus at any cost

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 4
For that you received a crown of righteousness
Became a role model for all the Christians
When you’re sick God’s power became perfect in your weakness
His grace was sufficient that led you to strive for greatness

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 5
Pray for us to be His chosen vessels
So we imitate you and all your lessons

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 1
So God may save our souls
Out of his mercy and his compassion, for the sake of his holy name!
The Holy Apostle Saint Paul, the righteous,
The healer of the sick, your message is virtuous!

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 2
Beseech beseech and pray for all of us
So God may save our souls /x2/
The persecutor who turned out to be God’s messenger
And a pharisee yet a teacher for non-believers

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 3
We learned from you that God can change our past
Through our life if we preach the crucified Christ
You discount your status for the sake of those who are lost
Enduring many trials, you preached Jesus at any cost

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 4
For that you received a crown of righteousness
Became a role model for all the Christians
When you’re sick God’s power became perfect in your weakness
His grace was sufficient that led you to strive for greatness

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 5
Pray for us to be His chosen vessels
So we imitate you and all your lessons

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b1deebb1-6fe4-4149-9f72-dc18d53609d5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 1
So God may save our souls
Out of his mercy and his compassion, for the sake of his holy name!
The Holy Apostle Saint Paul, the righteous,
The healer of the sick, your message is virtuous!

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 2
Beseech beseech and pray for all of us
So God may save our souls /x2/
The persecutor who turned out to be God’s messenger
And a pharisee yet a teacher for non-believers

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 3
We learned from you that God can change our past
Through our life if we preach the crucified Christ
You discount your status for the sake of those who are lost
Enduring many trials, you preached Jesus at any cost

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 4
For that you received a crown of righteousness
Became a role model for all the Christians
When you’re sick God’s power became perfect in your weakness
His grace was sufficient that led you to strive for greatness

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,

VERSE 5
Pray for us to be His chosen vessels
So we imitate you and all your lessons

CHORUS
The Holy Apostle Saint Paul, the healer of the sick
Your message is virtuous!
You who received the crown,
Beseech and pray for all of us,'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b1deebb1-6fe4-4149-9f72-dc18d53609d5'::uuid, 'the-holy-apostle', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- meskelike-yikunene-beza ("Meskelike Yikunene Beza")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '04e8fcff-0403-45e8-9d85-d9bbfda7f39e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)

VERSE 1
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)

CHORUS
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)

VERSE 1
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)

CHORUS
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)

VERSE 1
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)

CHORUS
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)',
        lyrics_transliteration = 'CHORUS
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)

VERSE 1
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)

CHORUS
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '04e8fcff-0403-45e8-9d85-d9bbfda7f39e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)

VERSE 1
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)

CHORUS
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)

VERSE 1
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)

CHORUS
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '04e8fcff-0403-45e8-9d85-d9bbfda7f39e'::uuid, 'meskelike-yikunene-beza', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nana-amanuel-mpotvgb3kcq ("Nana Amanu’el")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'faee5146-0f2d-445c-a609-af415f3bed85'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 1
ፊትህ የተመላ አማኑኤል
ሁሌ በይቅርታ አማኑኤል
ካለው ፍቅር በላይ አማኑኤል
አባት ለአንድ ልጁ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 2
አምላክ ይወደናል አማኑኤል
አይጥለንም ከእጁ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►
መድኃኒቴ ልበል አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 3
ድኛለው በሞትህ አማኑኤል
ቁስሌ ተፈውሷል አማኑኤል
በቁስልህ በሞትህ አማኑኤል
ስሸጥህ አቀፍከኝ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 4
ስወጋህ አይኔ በራ አማኑኤል
በፍቅርህ አወጣኸኝ አማኑኤል
ከዚያ ከመከራ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ አማኑኤል
ድል አርገህልኛል አማኑኤል
የጭንቄን ተራራ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 6
በጉባኤ መኃል አማኑኤል
አፌ አንተን አወጀ አማኑኤል
የከበረ ደምህ አማኑኤል
ነፍሴን ስለዋጀ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 7
አዝ▸▸▸▸▸▸▸▸▸▸►
የድንግሏ ፍሬ አማኑኤል
የብላቴናዋ አማኑኤል
የቤቴ ምሰሶ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 8
የነፍሴ ቤዛዋ አማኑኤል
መሰሬቴ አንተ ነህ አማኑኤል
ያሳደገኝ እጅህ አማኑኤል
አተወኝም አንተ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 9
ስለሆንኩኝ ልጅህ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 1
Fith yetemela Amanuel
Hule beyqrta Amanuel
Kalew fiqr belay Amanuel
Abat leand liju Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 2
Amlak yiwedenal Amanuel
Ayt’lenm keeju Amanuel
CHORUS
Medhanite libel Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 3
Dignalew bemoth Amanuel
Qusle tefewswal Amanuel
Bequslh bemoth Amanuel
Sishet’h aqefkegn Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 4
Siwegah ayne bera Amanuel
Befqrh awet’aኸgn Amanuel
Keziya kemekera Amanuel
CHORUS

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara Amanuel
Dil argehlgnal Amanuel
Yech’nqen terara Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 6
Begubae mehal Amanuel
Afe anten aweje Amanuel
Yekebere demh Amanuel
Nefsen silewaje Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 7
CHORUS
Yednglwa fire Amanuel
Yeblatenawa Amanuel
Yebete miseso Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 8
Yenefse bezawa Amanuel
Meserete ante neh Amanuel
Yasadegegn ejh Amanuel
Atewegnm ante Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 9
Silehonkugn lijh Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 1
ፊትህ የተመላ አማኑኤል
ሁሌ በይቅርታ አማኑኤል
ካለው ፍቅር በላይ አማኑኤል
አባት ለአንድ ልጁ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 2
አምላክ ይወደናል አማኑኤል
አይጥለንም ከእጁ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►
መድኃኒቴ ልበል አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 3
ድኛለው በሞትህ አማኑኤል
ቁስሌ ተፈውሷል አማኑኤል
በቁስልህ በሞትህ አማኑኤል
ስሸጥህ አቀፍከኝ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 4
ስወጋህ አይኔ በራ አማኑኤል
በፍቅርህ አወጣኸኝ አማኑኤል
ከዚያ ከመከራ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ አማኑኤል
ድል አርገህልኛል አማኑኤል
የጭንቄን ተራራ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 6
በጉባኤ መኃል አማኑኤል
አፌ አንተን አወጀ አማኑኤል
የከበረ ደምህ አማኑኤል
ነፍሴን ስለዋጀ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 7
አዝ▸▸▸▸▸▸▸▸▸▸►
የድንግሏ ፍሬ አማኑኤል
የብላቴናዋ አማኑኤል
የቤቴ ምሰሶ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 8
የነፍሴ ቤዛዋ አማኑኤል
መሰሬቴ አንተ ነህ አማኑኤል
ያሳደገኝ እጅህ አማኑኤል
አተወኝም አንተ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 9
ስለሆንኩኝ ልጅህ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል',
        lyrics_transliteration = 'CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 1
Fith yetemela Amanuel
Hule beyqrta Amanuel
Kalew fiqr belay Amanuel
Abat leand liju Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 2
Amlak yiwedenal Amanuel
Ayt’lenm keeju Amanuel
CHORUS
Medhanite libel Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 3
Dignalew bemoth Amanuel
Qusle tefewswal Amanuel
Bequslh bemoth Amanuel
Sishet’h aqefkegn Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 4
Siwegah ayne bera Amanuel
Befqrh awet’aኸgn Amanuel
Keziya kemekera Amanuel
CHORUS

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara Amanuel
Dil argehlgnal Amanuel
Yech’nqen terara Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 6
Begubae mehal Amanuel
Afe anten aweje Amanuel
Yekebere demh Amanuel
Nefsen silewaje Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 7
CHORUS
Yednglwa fire Amanuel
Yeblatenawa Amanuel
Yebete miseso Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 8
Yenefse bezawa Amanuel
Meserete ante neh Amanuel
Yasadegegn ejh Amanuel
Atewegnm ante Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 9
Silehonkugn lijh Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'faee5146-0f2d-445c-a609-af415f3bed85'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 1
ፊትህ የተመላ አማኑኤል
ሁሌ በይቅርታ አማኑኤል
ካለው ፍቅር በላይ አማኑኤል
አባት ለአንድ ልጁ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 2
አምላክ ይወደናል አማኑኤል
አይጥለንም ከእጁ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►
መድኃኒቴ ልበል አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 3
ድኛለው በሞትህ አማኑኤል
ቁስሌ ተፈውሷል አማኑኤል
በቁስልህ በሞትህ አማኑኤል
ስሸጥህ አቀፍከኝ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 4
ስወጋህ አይኔ በራ አማኑኤል
በፍቅርህ አወጣኸኝ አማኑኤል
ከዚያ ከመከራ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ አማኑኤል
ድል አርገህልኛል አማኑኤል
የጭንቄን ተራራ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 6
በጉባኤ መኃል አማኑኤል
አፌ አንተን አወጀ አማኑኤል
የከበረ ደምህ አማኑኤል
ነፍሴን ስለዋጀ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 7
አዝ▸▸▸▸▸▸▸▸▸▸►
የድንግሏ ፍሬ አማኑኤል
የብላቴናዋ አማኑኤል
የቤቴ ምሰሶ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 8
የነፍሴ ቤዛዋ አማኑኤል
መሰሬቴ አንተ ነህ አማኑኤል
ያሳደገኝ እጅህ አማኑኤል
አተወኝም አንተ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 9
ስለሆንኩኝ ልጅህ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'faee5146-0f2d-445c-a609-af415f3bed85'::uuid, 'nana-amanuel-mpotvgb3kcq', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- girum-dinik-neh-amilake-bemuhaze-sibihat ("Girum Dinik Neh Amilake *** Bemuhaze Sibihat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b204468d-ad43-4926-8555-b2f649f299b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 1
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ከኃጢያተኛው ቤት ይገባል እራት ሊበላ
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 2
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንዳማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 3
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ
ከሳምራዊው ጋር ይውላል እንደ ጓደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 4
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 5
ሰው የናቀውን አንስቶ ሾሞ ያከብራል
ዘይት አፍስሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 6
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 7
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ዳግሞ አይኖርም በቤቱ የእስራት ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 8
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 1
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kehat’iyategnaw bet yigebal erat libela
Beqel ayawqm Getaye kefqr lela

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 2
Endamlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Endamanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 3
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju
Kesamrawiw gar yiwlal ende gwadegna
Hulun befqr yemiyasb tamagn eregna

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 4
Endamlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 5
Sew yenaqewn ansto shomo yakebral
Zeyt afsso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 6
Ende amlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 7
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Dagmo aynorm bebetu yeesrat qenber
Ersun temamno yeqome kemeqdesu sir

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 8
Ende amlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 1
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ከኃጢያተኛው ቤት ይገባል እራት ሊበላ
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 2
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንዳማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 3
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ
ከሳምራዊው ጋር ይውላል እንደ ጓደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 4
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 5
ሰው የናቀውን አንስቶ ሾሞ ያከብራል
ዘይት አፍስሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 6
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 7
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ዳግሞ አይኖርም በቤቱ የእስራት ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 8
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/',
        lyrics_transliteration = 'CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 1
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kehat’iyategnaw bet yigebal erat libela
Beqel ayawqm Getaye kefqr lela

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 2
Endamlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Endamanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 3
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju
Kesamrawiw gar yiwlal ende gwadegna
Hulun befqr yemiyasb tamagn eregna

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 4
Endamlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 5
Sew yenaqewn ansto shomo yakebral
Zeyt afsso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 6
Ende amlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 7
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Dagmo aynorm bebetu yeesrat qenber
Ersun temamno yeqome kemeqdesu sir

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)

VERSE 8
Ende amlakachn #manm yelem (2)
Ende egziabher #manm yelem (2)
Ende fet’ari #manm yelem (2)
Ende Amanuel #manm yelem (2)

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b204468d-ad43-4926-8555-b2f649f299b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 1
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ከኃጢያተኛው ቤት ይገባል እራት ሊበላ
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 2
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንዳማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 3
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ
ከሳምራዊው ጋር ይውላል እንደ ጓደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 4
እንዳምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 5
ሰው የናቀውን አንስቶ ሾሞ ያከብራል
ዘይት አፍስሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 6
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 7
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ዳግሞ አይኖርም በቤቱ የእስራት ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/

VERSE 8
እንደ አምላካችን #ማንም የለም /2/
እንደ እግዚአብሄር #ማንም የለም /2/
እንደ ፈጣሪ #ማንም የለም /2/
እንደ አማኑኤል #ማንም የለም /2/

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b204468d-ad43-4926-8555-b2f649f299b5'::uuid, 'girum-dinik-neh-amilake-bemuhaze-sibihat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bedeliku-endegena-deacon-bisrat-teshome ("Bedeliku Endegena Deacon Bisrat Teshome")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '61932663-83c2-4eb5-a238-4a70911ebe14'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 1
ይነጋል ይመሻል√ ቀንና ሌሊቱ
አንተ ስትቀድሰኝ እኔ ስሆን ከንቱ
ልቤ ልብን አጣ√ ከክብር አነሰ
በ1 እግሩ ሲራመድ√ በ1ዱ እያነከሰ።

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 2
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም√ እየተመኘው
ትላንቴን አድሰህ ዛሬን ስትቸረኝ
ይኽው እንደገና ሀጥያት ሰበረኝ

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 3
ማዕበሉን እዘዘው ከሞት አስመልጠኝ
ሰጥሜ እንዳልቀር በፍቅርህ ለውጠኝ
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 4
በህግህ ባልጓዝ ብቀል በሚዛንህ
ያስቀመጥከኝ ቦታ ባልገኝ በቃልህ
ታገስከኝ አባቴ ምክርህን ስረሳ
ምረኽ ያስጣልከኝን መልሼ ሳነሳ

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 5
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 1
Yinegal yimeshal√ qenna lelitu
Ante sitqedsegn ene sihon kentu
Libe libn at’a√ kekbr anese
Be1 egru siramed√ be1du eyanekese.

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 2
Anten lemewded fits’um zegeyew
Kentuwn alem√ eyetemegnew
Tilanten adseh zaren sitcheregn
Yiኽw endegena het’yat seberegn

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 3
Maebelun ezezew kemot asmelt’egn
Set’me endalqer befqrh lewt’egn
Anten lemewded fits’um zegeyew
Kentuwn alem eyetemegnew

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 4
Behgh balgwaz biqel bemizanh
Yasqemet’kegn bota balgegn beqalh
Tageskegn abate mikrhn siresa
Mireኽ yast’alkegnn melshe sanesa

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 5
Anten lemewded fits’um zegeyew
Kentuwn alem eyetemegnew

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 1
ይነጋል ይመሻል√ ቀንና ሌሊቱ
አንተ ስትቀድሰኝ እኔ ስሆን ከንቱ
ልቤ ልብን አጣ√ ከክብር አነሰ
በ1 እግሩ ሲራመድ√ በ1ዱ እያነከሰ።

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 2
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም√ እየተመኘው
ትላንቴን አድሰህ ዛሬን ስትቸረኝ
ይኽው እንደገና ሀጥያት ሰበረኝ

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 3
ማዕበሉን እዘዘው ከሞት አስመልጠኝ
ሰጥሜ እንዳልቀር በፍቅርህ ለውጠኝ
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 4
በህግህ ባልጓዝ ብቀል በሚዛንህ
ያስቀመጥከኝ ቦታ ባልገኝ በቃልህ
ታገስከኝ አባቴ ምክርህን ስረሳ
ምረኽ ያስጣልከኝን መልሼ ሳነሳ

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 5
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና',
        lyrics_transliteration = 'CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 1
Yinegal yimeshal√ qenna lelitu
Ante sitqedsegn ene sihon kentu
Libe libn at’a√ kekbr anese
Be1 egru siramed√ be1du eyanekese.

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 2
Anten lemewded fits’um zegeyew
Kentuwn alem√ eyetemegnew
Tilanten adseh zaren sitcheregn
Yiኽw endegena het’yat seberegn

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 3
Maebelun ezezew kemot asmelt’egn
Set’me endalqer befqrh lewt’egn
Anten lemewded fits’um zegeyew
Kentuwn alem eyetemegnew

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 4
Behgh balgwaz biqel bemizanh
Yasqemet’kegn bota balgegn beqalh
Tageskegn abate mikrhn siresa
Mireኽ yast’alkegnn melshe sanesa

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 5
Anten lemewded fits’um zegeyew
Kentuwn alem eyetemegnew

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena',
        updated_at = clock_timestamp()::text
    WHERE import_id = '61932663-83c2-4eb5-a238-4a70911ebe14'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 1
ይነጋል ይመሻል√ ቀንና ሌሊቱ
አንተ ስትቀድሰኝ እኔ ስሆን ከንቱ
ልቤ ልብን አጣ√ ከክብር አነሰ
በ1 እግሩ ሲራመድ√ በ1ዱ እያነከሰ።

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 2
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም√ እየተመኘው
ትላንቴን አድሰህ ዛሬን ስትቸረኝ
ይኽው እንደገና ሀጥያት ሰበረኝ

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 3
ማዕበሉን እዘዘው ከሞት አስመልጠኝ
ሰጥሜ እንዳልቀር በፍቅርህ ለውጠኝ
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 4
በህግህ ባልጓዝ ብቀል በሚዛንህ
ያስቀመጥከኝ ቦታ ባልገኝ በቃልህ
ታገስከኝ አባቴ ምክርህን ስረሳ
ምረኽ ያስጣልከኝን መልሼ ሳነሳ

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 5
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '61932663-83c2-4eb5-a238-4a70911ebe14'::uuid, 'bedeliku-endegena-deacon-bisrat-teshome', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yalante-geta-desta-mech-ale ("yalante geta desta mech ale")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2cea4796-4ea9-4a65-884d-2bdeecea694f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 1
እጆቼን ይዘህ አንተ እየመራ
ስንቱን አለፍኩት ስንቱን መከራ
ለካ ሲያልፍ ቀን ሁሉም ይረሳል
ረሀብ ስደቱን ማን ያስታውሳል

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 2
ፅዋዬን ባርከክ ተትረፈረፈ
የጠላቴም ጦር በላዬ አለፈ
በሺህ ቃላቶች አፌን ሞልቼ
ልዘምርልኽ ጉያኽ ገብቼ

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 3
ገዳዬ ቢሮጥ በቀን በማታ
እያለ አንድዬ እያለ ጌታ
ለሞት አልተኛም ይደነቃል
ተክሎኛልና ለዘለአለም

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 4
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለው በእልልታ ቤቴን

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 5
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለሁ በእልልታ ቤቴን

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 1
Ejochen yizeh ante eyemera
Sintun alefkut sintun mekera
Leka siyalf qen hulum yiresal
Reheb sidetun man yastawsal

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 2
Ts’wayen barkek tetreferefe
Yet’elatem t’or belaye alefe
Beshih qalatoch afen molche
Lizemrlኽ guyaኽ gebche

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 3
Gedaye birot’ beqen bemata
Eyale andye eyale Geta
Lemot altegnam yideneqal
Teklognalna lezelealem

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 4
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e
Alaqereqr aldefa angeten
Emolawalew beellta beten

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 5
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e
Alaqereqr aldefa angeten
Emolawalehu beellta beten

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 1
እጆቼን ይዘህ አንተ እየመራ
ስንቱን አለፍኩት ስንቱን መከራ
ለካ ሲያልፍ ቀን ሁሉም ይረሳል
ረሀብ ስደቱን ማን ያስታውሳል

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 2
ፅዋዬን ባርከክ ተትረፈረፈ
የጠላቴም ጦር በላዬ አለፈ
በሺህ ቃላቶች አፌን ሞልቼ
ልዘምርልኽ ጉያኽ ገብቼ

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 3
ገዳዬ ቢሮጥ በቀን በማታ
እያለ አንድዬ እያለ ጌታ
ለሞት አልተኛም ይደነቃል
ተክሎኛልና ለዘለአለም

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 4
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለው በእልልታ ቤቴን

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 5
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለሁ በእልልታ ቤቴን

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ',
        lyrics_transliteration = 'CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 1
Ejochen yizeh ante eyemera
Sintun alefkut sintun mekera
Leka siyalf qen hulum yiresal
Reheb sidetun man yastawsal

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 2
Ts’wayen barkek tetreferefe
Yet’elatem t’or belaye alefe
Beshih qalatoch afen molche
Lizemrlኽ guyaኽ gebche

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 3
Gedaye birot’ beqen bemata
Eyale andye eyale Geta
Lemot altegnam yideneqal
Teklognalna lezelealem

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 4
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e
Alaqereqr aldefa angeten
Emolawalew beellta beten

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 5
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e
Alaqereqr aldefa angeten
Emolawalehu beellta beten

CHORUS
Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2cea4796-4ea9-4a65-884d-2bdeecea694f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 1
እጆቼን ይዘህ አንተ እየመራ
ስንቱን አለፍኩት ስንቱን መከራ
ለካ ሲያልፍ ቀን ሁሉም ይረሳል
ረሀብ ስደቱን ማን ያስታውሳል

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 2
ፅዋዬን ባርከክ ተትረፈረፈ
የጠላቴም ጦር በላዬ አለፈ
በሺህ ቃላቶች አፌን ሞልቼ
ልዘምርልኽ ጉያኽ ገብቼ

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 3
ገዳዬ ቢሮጥ በቀን በማታ
እያለ አንድዬ እያለ ጌታ
ለሞት አልተኛም ይደነቃል
ተክሎኛልና ለዘለአለም

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 4
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለው በእልልታ ቤቴን

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 5
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለሁ በእልልታ ቤቴን

CHORUS
ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2cea4796-4ea9-4a65-884d-2bdeecea694f'::uuid, 'yalante-geta-desta-mech-ale', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fikiriki-mesituni ("Fikiriki Mesituni")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b2c7c1be-bd87-4bb3-9fe7-59ff71bc7ee5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 1
ልመናይ ኣውሒዘ ኣይስኣንኩን ልግሲ
ትምኒተይ ክሠምር ምስ በልኩ ማርያመይ
ድላየይ ሂብክኒ ዓዚዙ ሰላመይ
ኣዝ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 2
ብማሕለካ ሕይወት ዘይውዳእ መከራ
ልበይ ክፈራረቕ ከቢድዋ ናብራ
ምረተይ ምዓሩ ብደገፍ ምልጃኪ
ውዳሴ''ካ ''ውሕዶ ማርያም ንዉዕለትኪ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 3
ኣዝ
ከም ኤልሳቤጥ ኣደይ ኣደ ጐይታይ ክብል
ሓጎስ ውሽጢ ውሽጠይ ነናሻዕ ይግንፍል
ከም ቅዱስ ገብርኤል ከም ኣበው ቅዱሳን

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 4
ስምኪ ክጽውዕ''የ ድንግል እመ ብርሃን
ኣዝ
ደቂ ሰብ ኣብ ምድሪ ሰማያዉያን ኣብ ራማ
ብጣዕመ ፍቕርኪ ቃንዮምልኪ ዜማ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 5
ልበይ ውን ምስኣቶም ክውድስ ነቂሉ
ሰለ ፍቕሪ ጽዮን ስቕ ኣይክብልን ኢሉ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 1
Limenay awhize aysankun ligsi
Timnitey kisemr mis belku maryamey
Dilayey hibkni azizu selamey
Az

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 2
Bimahleka hiywet zeywdae mekera
Libey kiferareቕ kebidwa nabra
Miretey miaru bidegef miljaki
Widase''ka ''wihdo Maryam niwueletki

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 3
Az
Kem elsabet’ adey ade gweytay kibl
Hagos wisht’i wisht’ey nenashae yignfl
Kem Kidus Gebriel kem abew Kidusan

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 4
Simki kits’we''ye Dingil eme birhan
Az
Deqi seb ab midri semayawuyan ab rama
Bit’aeme fiቕrki qanyomlki zema

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 5
Libey win misatom kiwds neqilu
Sele fiቕri ts’yon siቕ aykbln ilu

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 1
ልመናይ ኣውሒዘ ኣይስኣንኩን ልግሲ
ትምኒተይ ክሠምር ምስ በልኩ ማርያመይ
ድላየይ ሂብክኒ ዓዚዙ ሰላመይ
ኣዝ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 2
ብማሕለካ ሕይወት ዘይውዳእ መከራ
ልበይ ክፈራረቕ ከቢድዋ ናብራ
ምረተይ ምዓሩ ብደገፍ ምልጃኪ
ውዳሴ''ካ ''ውሕዶ ማርያም ንዉዕለትኪ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 3
ኣዝ
ከም ኤልሳቤጥ ኣደይ ኣደ ጐይታይ ክብል
ሓጎስ ውሽጢ ውሽጠይ ነናሻዕ ይግንፍል
ከም ቅዱስ ገብርኤል ከም ኣበው ቅዱሳን

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 4
ስምኪ ክጽውዕ''የ ድንግል እመ ብርሃን
ኣዝ
ደቂ ሰብ ኣብ ምድሪ ሰማያዉያን ኣብ ራማ
ብጣዕመ ፍቕርኪ ቃንዮምልኪ ዜማ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 5
ልበይ ውን ምስኣቶም ክውድስ ነቂሉ
ሰለ ፍቕሪ ጽዮን ስቕ ኣይክብልን ኢሉ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ',
        lyrics_transliteration = 'CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 1
Limenay awhize aysankun ligsi
Timnitey kisemr mis belku maryamey
Dilayey hibkni azizu selamey
Az

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 2
Bimahleka hiywet zeywdae mekera
Libey kiferareቕ kebidwa nabra
Miretey miaru bidegef miljaki
Widase''ka ''wihdo Maryam niwueletki

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 3
Az
Kem elsabet’ adey ade gweytay kibl
Hagos wisht’i wisht’ey nenashae yignfl
Kem Kidus Gebriel kem abew Kidusan

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 4
Simki kits’we''ye Dingil eme birhan
Az
Deqi seb ab midri semayawuyan ab rama
Bit’aeme fiቕrki qanyomlki zema

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 5
Libey win misatom kiwds neqilu
Sele fiቕri ts’yon siቕ aykbln ilu

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b2c7c1be-bd87-4bb3-9fe7-59ff71bc7ee5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 1
ልመናይ ኣውሒዘ ኣይስኣንኩን ልግሲ
ትምኒተይ ክሠምር ምስ በልኩ ማርያመይ
ድላየይ ሂብክኒ ዓዚዙ ሰላመይ
ኣዝ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 2
ብማሕለካ ሕይወት ዘይውዳእ መከራ
ልበይ ክፈራረቕ ከቢድዋ ናብራ
ምረተይ ምዓሩ ብደገፍ ምልጃኪ
ውዳሴ''ካ ''ውሕዶ ማርያም ንዉዕለትኪ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 3
ኣዝ
ከም ኤልሳቤጥ ኣደይ ኣደ ጐይታይ ክብል
ሓጎስ ውሽጢ ውሽጠይ ነናሻዕ ይግንፍል
ከም ቅዱስ ገብርኤል ከም ኣበው ቅዱሳን

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 4
ስምኪ ክጽውዕ''የ ድንግል እመ ብርሃን
ኣዝ
ደቂ ሰብ ኣብ ምድሪ ሰማያዉያን ኣብ ራማ
ብጣዕመ ፍቕርኪ ቃንዮምልኪ ዜማ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 5
ልበይ ውን ምስኣቶም ክውድስ ነቂሉ
ሰለ ፍቕሪ ጽዮን ስቕ ኣይክብልን ኢሉ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b2c7c1be-bd87-4bb3-9fe7-59ff71bc7ee5'::uuid, 'fikiriki-mesituni', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aplfana-omega ("Aplfana Omega")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '00dd1436-c05d-4c03-8f6e-e2e540a00294'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 1
ጽድቅን ስለሰራህ በወንጀል ከሰሱህ
ላዳም ቤዛ ብለህ ብዙ ተንገላታህ
አልፋና ዖሜጋ‥
ቅዱሳን እጆችህ የፊጥኝ ታስረው

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 2
እንደበግ ተጎተትክ ብትምራቸው
የትም ቦታ ያለህ ሁሉን የምታውቅ
ፊትህን ሸፈኑት ለመመጻደቅ
አልፋና ዖሜጋ……

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 3
በዓውደ ምኩናን ከጲላጦስ ዘንድ
አሳልፈው ሰጡህ አጋልጠው ለፍርድ
ከሃና ቀያፋ ከካህናቱ ደጅ
ከነሄሮድስ ዘንድ አቀረቡህ ባዋጅ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 4
አልፋና ዖሜጋ…….
ግርፋት ሕማሙ አልበቃ ብሎህ
በመስቀል ላይ ልትውል ተፈረደብህ
ሳዶርና አላዶር ዳናትና ዴራ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 5
ተፈልገው መጡ ለችንካር በተራ
አልፋና ዖሜጋ……..
የሰላም ባለቤት ደረትህ ተወጋ
ሊያያዝ በችንካር እጅህ ተዘረጋ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 6
ግፈኞች አይሁዶች ባንተ ላይ ቀለዱ
ምራቅን ተፉብህ እራስክን ሊጎዱ
አልፋና ዖሜጋ……………

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 1
Ts’dqn sileserah bewenjel kesesuh
Ladam beza bileh bizu tengelatah
Alfana omega‥
Kidusan ejochh yefit’gn tasrew

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 2
Endebeg tegotetk bitmrachew
Yetm bota yaleh hulun yemtawq
Fithn shefenut lememets’adeq
Alfana omega……

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 3
Beawde mikunan kep’ilat’os zend
Asalfew set’uh agalt’ew lefrd
Kehana qeyafa kekahnatu dej
Keneherods zend aqerebuh bawaj

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 4
Alfana omega…….
Girfat himamu albeqa biloh
Bemesqel lay litwl teferedebh
Sadorna alador danatna dera

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 5
Tefelgew met’u lechnkar betera
Alfana omega……..
Yeselam balebet dereth tewega
Liyayaz bechnkar ejh tezerega

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 6
Gifegnoch ayhudoch bante lay qeledu
Miraqn tefubh eraskn ligodu
Alfana omega……………

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 1
ጽድቅን ስለሰራህ በወንጀል ከሰሱህ
ላዳም ቤዛ ብለህ ብዙ ተንገላታህ
አልፋና ዖሜጋ‥
ቅዱሳን እጆችህ የፊጥኝ ታስረው

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 2
እንደበግ ተጎተትክ ብትምራቸው
የትም ቦታ ያለህ ሁሉን የምታውቅ
ፊትህን ሸፈኑት ለመመጻደቅ
አልፋና ዖሜጋ……

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 3
በዓውደ ምኩናን ከጲላጦስ ዘንድ
አሳልፈው ሰጡህ አጋልጠው ለፍርድ
ከሃና ቀያፋ ከካህናቱ ደጅ
ከነሄሮድስ ዘንድ አቀረቡህ ባዋጅ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 4
አልፋና ዖሜጋ…….
ግርፋት ሕማሙ አልበቃ ብሎህ
በመስቀል ላይ ልትውል ተፈረደብህ
ሳዶርና አላዶር ዳናትና ዴራ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 5
ተፈልገው መጡ ለችንካር በተራ
አልፋና ዖሜጋ……..
የሰላም ባለቤት ደረትህ ተወጋ
ሊያያዝ በችንካር እጅህ ተዘረጋ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 6
ግፈኞች አይሁዶች ባንተ ላይ ቀለዱ
ምራቅን ተፉብህ እራስክን ሊጎዱ
አልፋና ዖሜጋ……………

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ',
        lyrics_transliteration = 'CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 1
Ts’dqn sileserah bewenjel kesesuh
Ladam beza bileh bizu tengelatah
Alfana omega‥
Kidusan ejochh yefit’gn tasrew

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 2
Endebeg tegotetk bitmrachew
Yetm bota yaleh hulun yemtawq
Fithn shefenut lememets’adeq
Alfana omega……

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 3
Beawde mikunan kep’ilat’os zend
Asalfew set’uh agalt’ew lefrd
Kehana qeyafa kekahnatu dej
Keneherods zend aqerebuh bawaj

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 4
Alfana omega…….
Girfat himamu albeqa biloh
Bemesqel lay litwl teferedebh
Sadorna alador danatna dera

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 5
Tefelgew met’u lechnkar betera
Alfana omega……..
Yeselam balebet dereth tewega
Liyayaz bechnkar ejh tezerega

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 6
Gifegnoch ayhudoch bante lay qeledu
Miraqn tefubh eraskn ligodu
Alfana omega……………

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '00dd1436-c05d-4c03-8f6e-e2e540a00294'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 1
ጽድቅን ስለሰራህ በወንጀል ከሰሱህ
ላዳም ቤዛ ብለህ ብዙ ተንገላታህ
አልፋና ዖሜጋ‥
ቅዱሳን እጆችህ የፊጥኝ ታስረው

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 2
እንደበግ ተጎተትክ ብትምራቸው
የትም ቦታ ያለህ ሁሉን የምታውቅ
ፊትህን ሸፈኑት ለመመጻደቅ
አልፋና ዖሜጋ……

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 3
በዓውደ ምኩናን ከጲላጦስ ዘንድ
አሳልፈው ሰጡህ አጋልጠው ለፍርድ
ከሃና ቀያፋ ከካህናቱ ደጅ
ከነሄሮድስ ዘንድ አቀረቡህ ባዋጅ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 4
አልፋና ዖሜጋ…….
ግርፋት ሕማሙ አልበቃ ብሎህ
በመስቀል ላይ ልትውል ተፈረደብህ
ሳዶርና አላዶር ዳናትና ዴራ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 5
ተፈልገው መጡ ለችንካር በተራ
አልፋና ዖሜጋ……..
የሰላም ባለቤት ደረትህ ተወጋ
ሊያያዝ በችንካር እጅህ ተዘረጋ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 6
ግፈኞች አይሁዶች ባንተ ላይ ቀለዱ
ምራቅን ተፉብህ እራስክን ሊጎዱ
አልፋና ዖሜጋ……………

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '00dd1436-c05d-4c03-8f6e-e2e540a00294'::uuid, 'aplfana-omega', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yesemayim-yemidirim-geta-belike-lisanat-cherinet-senay ("Yesemayim Yemidirim Geta Belike Lisanat Cherinet Senay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '03086efe-2947-4727-a536-0b443cb4a1ab'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 1
አዝ…..
በማይዝሉ ጽኑ ክንዶችህ
ተደገፍን በቸርነትህ
የፍቅር አባት ላመኑት ጥላ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 2
ክርስቶስ ነህ የኛ ከለላ
አዝ…..
ፍጹም ቆምን በንጹህ ደምህ
ተፈወስን በቅዱስ ቃልህ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 3
መዛል ደካም ከቶ አይነካንም
ኃይላችን ነው ሁሌም የአንተ ስም
አዝ…..
ያጣው ሲጮህ ፊትህ ተደፍቶ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 4
ሲያማክርህ ሚስጥሩን ገልጦ
አባት ለልጁ እንደሚራራ
አወጣኸው ከሙታን ስፍራ
አዝ…..

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 5
ምስክር ነን ለዓለም ሁሉ
ስላዳነን በህያው ቃሉ
ለውለታው ምላሽ ባይኖርም
ከምስጋና ከቶ አንቦዝንም

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 1
CHORUS
Bemayzlu ts’nu kindochh
Tedegefn becherneth
Yefqr abat lamenut t’la

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 2
Kristos neh yegna kelela
CHORUS
Fits’um qomn bents’uh demh
Tefewesn beqdus qalh

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 3
Mezal dekam keto aynekanm
Haylachn new hulem yeante sim
CHORUS
Yat’aw sich’oh fith tedefto

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 4
Siyamakrh mist’run gelt’o
Abat lelju endemirara
Awet’aኸw kemutan sifra
CHORUS

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 5
Miskr nen lealem hulu
Siladanen behyaw qalu
Lewletaw milash baynorm
Kemsgana keto anboznm

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 1
አዝ…..
በማይዝሉ ጽኑ ክንዶችህ
ተደገፍን በቸርነትህ
የፍቅር አባት ላመኑት ጥላ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 2
ክርስቶስ ነህ የኛ ከለላ
አዝ…..
ፍጹም ቆምን በንጹህ ደምህ
ተፈወስን በቅዱስ ቃልህ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 3
መዛል ደካም ከቶ አይነካንም
ኃይላችን ነው ሁሌም የአንተ ስም
አዝ…..
ያጣው ሲጮህ ፊትህ ተደፍቶ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 4
ሲያማክርህ ሚስጥሩን ገልጦ
አባት ለልጁ እንደሚራራ
አወጣኸው ከሙታን ስፍራ
አዝ…..

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 5
ምስክር ነን ለዓለም ሁሉ
ስላዳነን በህያው ቃሉ
ለውለታው ምላሽ ባይኖርም
ከምስጋና ከቶ አንቦዝንም

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ',
        lyrics_transliteration = 'CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 1
CHORUS
Bemayzlu ts’nu kindochh
Tedegefn becherneth
Yefqr abat lamenut t’la

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 2
Kristos neh yegna kelela
CHORUS
Fits’um qomn bents’uh demh
Tefewesn beqdus qalh

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 3
Mezal dekam keto aynekanm
Haylachn new hulem yeante sim
CHORUS
Yat’aw sich’oh fith tedefto

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 4
Siyamakrh mist’run gelt’o
Abat lelju endemirara
Awet’aኸw kemutan sifra
CHORUS

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 5
Miskr nen lealem hulu
Siladanen behyaw qalu
Lewletaw milash baynorm
Kemsgana keto anboznm

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '03086efe-2947-4727-a536-0b443cb4a1ab'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 1
አዝ…..
በማይዝሉ ጽኑ ክንዶችህ
ተደገፍን በቸርነትህ
የፍቅር አባት ላመኑት ጥላ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 2
ክርስቶስ ነህ የኛ ከለላ
አዝ…..
ፍጹም ቆምን በንጹህ ደምህ
ተፈወስን በቅዱስ ቃልህ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 3
መዛል ደካም ከቶ አይነካንም
ኃይላችን ነው ሁሌም የአንተ ስም
አዝ…..
ያጣው ሲጮህ ፊትህ ተደፍቶ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 4
ሲያማክርህ ሚስጥሩን ገልጦ
አባት ለልጁ እንደሚራራ
አወጣኸው ከሙታን ስፍራ
አዝ…..

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 5
ምስክር ነን ለዓለም ሁሉ
ስላዳነን በህያው ቃሉ
ለውለታው ምላሽ ባይኖርም
ከምስጋና ከቶ አንቦዝንም

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '03086efe-2947-4727-a536-0b443cb4a1ab'::uuid, 'yesemayim-yemidirim-geta-belike-lisanat-cherinet-senay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidist-ethiopia ("Kidist Ethiopia")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a521db51-40bb-4478-8dc7-7615caf71612'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 1
በቃልኪዳን አጥር ያጠሩሽ ሥላሴ
አይጥፋ ከምድርሽ የሰማይ ቅዳሴ
ልጆችሽ ይደጉ በሰላም ውዳሴ2
ፍቅርን የዘሩብሽ ጥንት አባቶቻችን

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 2
መንፈሳዊት ሀገር እናት ሀገራችን
እንደተኛን አይቶ ልጆ ችሽ ሁላችን
ዛራብሽ እንክርዳድ ጥንተ ጠላታችን2
ተሰዓቱ ቅዱሳን እነ አባ ገሪማ

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 3
እነ አባ አረጋዊ እነ አባ ጽህማ
ንጽህናን ተጫምተው እንደ ወርቅ ጫማ
አርገውሽ ነበር የወንጌል ከተማ የብርሀን ከተማ
አሁን ግን ከቦሻል ሀዘንና ልቅሶ

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 4
የቀደመው አጥር ፍቅር በጠብ ፈርሶ
ቢሆንም አይጠፋም ተስፋችን ጨርሶ
የቀደመው ክብርሽ ይመታል መልሶ2

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 1
Beqalkidan at’r yat’erush Silassie
Ayt’fa kemdrsh yesemay qidase
Lijochsh yidegu beselam widase2
Fiqrn yezerubsh t’nt abatochachn

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 2
Menfesawit heger enat hegerachn
Endetegnan ayto lijo chsh hulachn
Zarabsh enkrdad t’nte t’elatachn2
Teseatu Kidusan ene aba gerima

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 3
Ene aba aregawi ene aba ts’hma
Nits’hnan tech’amtew ende werq ch’ama
Argewsh neber yewengel ketema yebrhen ketema
Ahun gin keboshal hezenna liqso

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 4
Yeqedemew at’r fiqr bet’eb ferso
Bihonm ayt’efam tesfachn ch’erso
Yeqedemew kibrsh yimetal melso2

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 1
በቃልኪዳን አጥር ያጠሩሽ ሥላሴ
አይጥፋ ከምድርሽ የሰማይ ቅዳሴ
ልጆችሽ ይደጉ በሰላም ውዳሴ2
ፍቅርን የዘሩብሽ ጥንት አባቶቻችን

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 2
መንፈሳዊት ሀገር እናት ሀገራችን
እንደተኛን አይቶ ልጆ ችሽ ሁላችን
ዛራብሽ እንክርዳድ ጥንተ ጠላታችን2
ተሰዓቱ ቅዱሳን እነ አባ ገሪማ

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 3
እነ አባ አረጋዊ እነ አባ ጽህማ
ንጽህናን ተጫምተው እንደ ወርቅ ጫማ
አርገውሽ ነበር የወንጌል ከተማ የብርሀን ከተማ
አሁን ግን ከቦሻል ሀዘንና ልቅሶ

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 4
የቀደመው አጥር ፍቅር በጠብ ፈርሶ
ቢሆንም አይጠፋም ተስፋችን ጨርሶ
የቀደመው ክብርሽ ይመታል መልሶ2

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ',
        lyrics_transliteration = 'CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 1
Beqalkidan at’r yat’erush Silassie
Ayt’fa kemdrsh yesemay qidase
Lijochsh yidegu beselam widase2
Fiqrn yezerubsh t’nt abatochachn

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 2
Menfesawit heger enat hegerachn
Endetegnan ayto lijo chsh hulachn
Zarabsh enkrdad t’nte t’elatachn2
Teseatu Kidusan ene aba gerima

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 3
Ene aba aregawi ene aba ts’hma
Nits’hnan tech’amtew ende werq ch’ama
Argewsh neber yewengel ketema yebrhen ketema
Ahun gin keboshal hezenna liqso

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 4
Yeqedemew at’r fiqr bet’eb ferso
Bihonm ayt’efam tesfachn ch’erso
Yeqedemew kibrsh yimetal melso2

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a521db51-40bb-4478-8dc7-7615caf71612'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 1
በቃልኪዳን አጥር ያጠሩሽ ሥላሴ
አይጥፋ ከምድርሽ የሰማይ ቅዳሴ
ልጆችሽ ይደጉ በሰላም ውዳሴ2
ፍቅርን የዘሩብሽ ጥንት አባቶቻችን

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 2
መንፈሳዊት ሀገር እናት ሀገራችን
እንደተኛን አይቶ ልጆ ችሽ ሁላችን
ዛራብሽ እንክርዳድ ጥንተ ጠላታችን2
ተሰዓቱ ቅዱሳን እነ አባ ገሪማ

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 3
እነ አባ አረጋዊ እነ አባ ጽህማ
ንጽህናን ተጫምተው እንደ ወርቅ ጫማ
አርገውሽ ነበር የወንጌል ከተማ የብርሀን ከተማ
አሁን ግን ከቦሻል ሀዘንና ልቅሶ

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 4
የቀደመው አጥር ፍቅር በጠብ ፈርሶ
ቢሆንም አይጠፋም ተስፋችን ጨርሶ
የቀደመው ክብርሽ ይመታል መልሶ2

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a521db51-40bb-4478-8dc7-7615caf71612'::uuid, 'kidist-ethiopia', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eyesefa-eyebeza-fikiru ("Eyesefa Eyebeza Fikiru")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a281fa45-402b-4e10-b486-bd26f96f809e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 1
ሳይፈርድብን እንደበደላችን
ሳያጠፋን ፈጥኖ በሀጢያታችን
በምሕረቱ ብዛት ጎበኘን
በማያልቀው ፍቅሩ እያየን

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 2
ስንጠይቀው አብዝቶ እየሰጠ
ስናንኳኳ በር እየከፈተ
ይሰማናል እሱ ደግ ነው
ሳይከለክል ጌታ ሰጪ ነው

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 3
በቃ ሲባል ይኸው አስቀጠለን
የኃጢአትን ሸክም እያቀለለ
በንስሐ አዲስ አድርጎናል
ስንመለስ ተቀብሎናል

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 4
አልተወንም ስለ ቅዱስ ስሙ
ጠብቆናል በጽኑዕ ሰላሙ
ከርኅራኄው ብዛት የተነሳ
የመከራው ዘመን ተረሳ

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 1
Sayferdbn endebedelachn
Sayat’efan fet’no behet’iyatachn
Bemhretu bizat gobegnen
Bemayalqew fiqru eyayen

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 2
Sint’eyqew abzto eyeset’e
Sinankwakwa ber eyekefete
Yisemanal esu deg new
Saykelekl Geta sech’i new

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 3
Beqa sibal yiኸw asqet’elen
Yehat’iatn shekm eyaqelele
Benshe adis adrgonal
Sinmeles teqeblonal

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 4
Altewenm sile Kidus simu
T’ebqonal bets’nue selamu
Kerhrahew bizat yetenesa
Yemekeraw zemen teresa

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 1
ሳይፈርድብን እንደበደላችን
ሳያጠፋን ፈጥኖ በሀጢያታችን
በምሕረቱ ብዛት ጎበኘን
በማያልቀው ፍቅሩ እያየን

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 2
ስንጠይቀው አብዝቶ እየሰጠ
ስናንኳኳ በር እየከፈተ
ይሰማናል እሱ ደግ ነው
ሳይከለክል ጌታ ሰጪ ነው

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 3
በቃ ሲባል ይኸው አስቀጠለን
የኃጢአትን ሸክም እያቀለለ
በንስሐ አዲስ አድርጎናል
ስንመለስ ተቀብሎናል

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 4
አልተወንም ስለ ቅዱስ ስሙ
ጠብቆናል በጽኑዕ ሰላሙ
ከርኅራኄው ብዛት የተነሳ
የመከራው ዘመን ተረሳ

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ',
        lyrics_transliteration = 'CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 1
Sayferdbn endebedelachn
Sayat’efan fet’no behet’iyatachn
Bemhretu bizat gobegnen
Bemayalqew fiqru eyayen

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 2
Sint’eyqew abzto eyeset’e
Sinankwakwa ber eyekefete
Yisemanal esu deg new
Saykelekl Geta sech’i new

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 3
Beqa sibal yiኸw asqet’elen
Yehat’iatn shekm eyaqelele
Benshe adis adrgonal
Sinmeles teqeblonal

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 4
Altewenm sile Kidus simu
T’ebqonal bets’nue selamu
Kerhrahew bizat yetenesa
Yemekeraw zemen teresa

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a281fa45-402b-4e10-b486-bd26f96f809e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 1
ሳይፈርድብን እንደበደላችን
ሳያጠፋን ፈጥኖ በሀጢያታችን
በምሕረቱ ብዛት ጎበኘን
በማያልቀው ፍቅሩ እያየን

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 2
ስንጠይቀው አብዝቶ እየሰጠ
ስናንኳኳ በር እየከፈተ
ይሰማናል እሱ ደግ ነው
ሳይከለክል ጌታ ሰጪ ነው

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 3
በቃ ሲባል ይኸው አስቀጠለን
የኃጢአትን ሸክም እያቀለለ
በንስሐ አዲስ አድርጎናል
ስንመለስ ተቀብሎናል

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 4
አልተወንም ስለ ቅዱስ ስሙ
ጠብቆናል በጽኑዕ ሰላሙ
ከርኅራኄው ብዛት የተነሳ
የመከራው ዘመን ተረሳ

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a281fa45-402b-4e10-b486-bd26f96f809e'::uuid, 'eyesefa-eyebeza-fikiru', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dinik-adirigolignal ("Dinik Adirigolignal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0ef73a1f-a659-49ed-9f95-9ce473e0fa85'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 1
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ
ድንቅ አድርጎልኛል በዳግም ምጻቱ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 2
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ
አ.ዝ
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 3
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 4
አ.ዝ
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 5
ድንቅ አድርጎልኛል እያሉ ሲሉኝ
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 1
Dinq adrgolgnal wedebetu t’eragn
Dinq adrgolgnal rekshe salehu
Dinq adrgolgnal lije hoy na alegn
Dinq adrgolgnal bedagm mits’atu

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 2
Dinq adrgolgnal mengstun liyawersegn
A.z
Dinq adrgolgnal keanbesa mengaga
Dinq adrgolgnal kegudgwad awet’agn

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 3
Dinq adrgolgnal bet’elatoche fit
Dinq adrgolgnal girma moges set’egn
Dinq adrgolgnal min emelsalehu
Dinq adrgolgnal endi lewededegn

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 4
A.z
Dinq adrgolgnal t’elatoche hulu
Dinq adrgolgnal sigwadedubgn
Dinq adrgolgnal man yidersletal

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 5
Dinq adrgolgnal eyalu silugn
Dinq adrgolgnal fet’neh deresklgn
Dinq adrgolgnal kemot adankegn

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 1
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ
ድንቅ አድርጎልኛል በዳግም ምጻቱ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 2
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ
አ.ዝ
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 3
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 4
አ.ዝ
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 5
ድንቅ አድርጎልኛል እያሉ ሲሉኝ
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር',
        lyrics_transliteration = 'CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 1
Dinq adrgolgnal wedebetu t’eragn
Dinq adrgolgnal rekshe salehu
Dinq adrgolgnal lije hoy na alegn
Dinq adrgolgnal bedagm mits’atu

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 2
Dinq adrgolgnal mengstun liyawersegn
A.z
Dinq adrgolgnal keanbesa mengaga
Dinq adrgolgnal kegudgwad awet’agn

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 3
Dinq adrgolgnal bet’elatoche fit
Dinq adrgolgnal girma moges set’egn
Dinq adrgolgnal min emelsalehu
Dinq adrgolgnal endi lewededegn

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 4
A.z
Dinq adrgolgnal t’elatoche hulu
Dinq adrgolgnal sigwadedubgn
Dinq adrgolgnal man yidersletal

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 5
Dinq adrgolgnal eyalu silugn
Dinq adrgolgnal fet’neh deresklgn
Dinq adrgolgnal kemot adankegn

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0ef73a1f-a659-49ed-9f95-9ce473e0fa85'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 1
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ
ድንቅ አድርጎልኛል በዳግም ምጻቱ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 2
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ
አ.ዝ
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 3
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 4
አ.ዝ
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 5
ድንቅ አድርጎልኛል እያሉ ሲሉኝ
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0ef73a1f-a659-49ed-9f95-9ce473e0fa85'::uuid, 'dinik-adirigolignal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeamalikit-amilak-tewelede ("Yeamalikit Amilak Tewelede")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '01c69e48-9131-4712-a337-b27ef471a5e2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 1
ተወለደ አማኑኤል(፪×)
መጣ ወረደ ተወለደ አማኑኤል
ክብሩን አዋርዶ ተወለደ አማኑኤል
በበረት ተኛ ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 2
ትሕትናን ወዶ ተወለደ አማኑኤል
ጌታ ተወልዷል ተወለደ አማኑኤል
ከድንግል ማርያም ተወለደ አማኑኤል
ጠብን አርቆ ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 3
ሊሰጠን ሰላም ተወለደ አማኑኤል
/አዝ
የዲያብሎስን ተወለደ አማኑኤል
ሥልጣን ሊሽር ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 4
እሱን ሊፈታ ተወለደ አማኑኤል
በኃጢአት እስር ተወለደ አማኑኤል
ይሄው ተወልዷል ተወለደ አማኑኤል
በከብቶች በረት ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 5
አልፋ ዖሜጋ ተወለደ አማኑኤል
አምላክ አማልክት ተወለደ አማኑኤል
/አዝ
እናመስግነው ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 6
እንደ መላእክት ተወለደ አማኑኤል
ተወልዷልና ተወለደ አማኑኤል
የዓለም መድኃኒት ተወለደ አማኑኤል
ቃል ስጋ ሆነ ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 7
ከድንግል ማርያም ተወለደ አማኑኤል
የጌቶች ጌታ ተወለደ አማኑኤል
መድኃኔዓለም ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 1
Tewelede Amanuel(2×)
Met’a werede tewelede Amanuel
Kibrun awardo tewelede Amanuel
Beberet tegna tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 2
Tihtnan wedo tewelede Amanuel
Geta teweldwal tewelede Amanuel
Kedngl Maryam tewelede Amanuel
T’ebn arqo tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 3
Liset’en selam tewelede Amanuel
/az
Yediyablosn tewelede Amanuel
Silt’an lishr tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 4
Esun lifeta tewelede Amanuel
Behat’iat esr tewelede Amanuel
Yihew teweldwal tewelede Amanuel
Bekebtoch beret tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 5
Alfa omega tewelede Amanuel
Amlak amalkt tewelede Amanuel
/az
Enamesgnew tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 6
Ende melaekt tewelede Amanuel
Teweldwalna tewelede Amanuel
Yealem medhanit tewelede Amanuel
Qal siga hone tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 7
Kedngl Maryam tewelede Amanuel
Yegetoch Geta tewelede Amanuel
Medhanealem tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 1
ተወለደ አማኑኤል(፪×)
መጣ ወረደ ተወለደ አማኑኤል
ክብሩን አዋርዶ ተወለደ አማኑኤል
በበረት ተኛ ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 2
ትሕትናን ወዶ ተወለደ አማኑኤል
ጌታ ተወልዷል ተወለደ አማኑኤል
ከድንግል ማርያም ተወለደ አማኑኤል
ጠብን አርቆ ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 3
ሊሰጠን ሰላም ተወለደ አማኑኤል
/አዝ
የዲያብሎስን ተወለደ አማኑኤል
ሥልጣን ሊሽር ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 4
እሱን ሊፈታ ተወለደ አማኑኤል
በኃጢአት እስር ተወለደ አማኑኤል
ይሄው ተወልዷል ተወለደ አማኑኤል
በከብቶች በረት ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 5
አልፋ ዖሜጋ ተወለደ አማኑኤል
አምላክ አማልክት ተወለደ አማኑኤል
/አዝ
እናመስግነው ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 6
እንደ መላእክት ተወለደ አማኑኤል
ተወልዷልና ተወለደ አማኑኤል
የዓለም መድኃኒት ተወለደ አማኑኤል
ቃል ስጋ ሆነ ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 7
ከድንግል ማርያም ተወለደ አማኑኤል
የጌቶች ጌታ ተወለደ አማኑኤል
መድኃኔዓለም ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም',
        lyrics_transliteration = 'CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 1
Tewelede Amanuel(2×)
Met’a werede tewelede Amanuel
Kibrun awardo tewelede Amanuel
Beberet tegna tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 2
Tihtnan wedo tewelede Amanuel
Geta teweldwal tewelede Amanuel
Kedngl Maryam tewelede Amanuel
T’ebn arqo tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 3
Liset’en selam tewelede Amanuel
/az
Yediyablosn tewelede Amanuel
Silt’an lishr tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 4
Esun lifeta tewelede Amanuel
Behat’iat esr tewelede Amanuel
Yihew teweldwal tewelede Amanuel
Bekebtoch beret tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 5
Alfa omega tewelede Amanuel
Amlak amalkt tewelede Amanuel
/az
Enamesgnew tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 6
Ende melaekt tewelede Amanuel
Teweldwalna tewelede Amanuel
Yealem medhanit tewelede Amanuel
Qal siga hone tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 7
Kedngl Maryam tewelede Amanuel
Yegetoch Geta tewelede Amanuel
Medhanealem tewelede Amanuel

CHORUS
Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem',
        updated_at = clock_timestamp()::text
    WHERE import_id = '01c69e48-9131-4712-a337-b27ef471a5e2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም
ተወለደ አማኑኤል(፪×)
መጣ ወረደ ተወለደ አማኑኤል
ክብሩን አዋርዶ ተወለደ አማኑኤል
በበረት ተኛ ተወለደ አማኑኤል
ትሕትናን ወዶ ተወለደ አማኑኤል
ጌታ ተወልዷል ተወለደ አማኑኤል
ከድንግል ማርያም ተወለደ አማኑኤል
ጠብን አርቆ ተወለደ አማኑኤል
ሊሰጠን ሰላም ተወለደ አማኑኤል
/አዝ = = = = =
የዲያብሎስን ተወለደ አማኑኤል
ሥልጣን ሊሽር ተወለደ አማኑኤል
እሱን ሊፈታ ተወለደ አማኑኤል
በኃጢአት እስር ተወለደ አማኑኤል
ይሄው ተወልዷል ተወለደ አማኑኤል
በከብቶች በረት ተወለደ አማኑኤል
አልፋ ዖሜጋ ተወለደ አማኑኤል
አምላክ አማልክት ተወለደ አማኑኤል
/አዝ = = = = =
እናመስግነው ተወለደ አማኑኤል
እንደ መላእክት ተወለደ አማኑኤል
ተወልዷልና ተወለደ አማኑኤል
የዓለም መድኃኒት ተወለደ አማኑኤል
ቃል ስጋ ሆነ ተወለደ አማኑኤል
ከድንግል ማርያም ተወለደ አማኑኤል
የጌቶች ጌታ ተወለደ አማኑኤል
መድኃኔዓለም ተወለደ አማኑኤል

VERSE 1
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም
ተወለደ አማኑኤል(፪×)
መጣ ወረደ ተወለደ አማኑኤል
ክብሩን አዋርዶ ተወለደ አማኑኤል
በበረት ተኛ ተወለደ አማኑኤል
ትሕትናን ወዶ ተወለደ አማኑኤል
ጌታ ተወልዷል ተወለደ አማኑኤል
ከድንግል ማርያም ተወለደ አማኑኤል
ጠብን አርቆ ተወለደ አማኑኤል
ሊሰጠን ሰላም ተወለደ አማኑኤል
/አዝ = = = = =
የዲያብሎስን ተወለደ አማኑኤል
ሥልጣን ሊሽር ተወለደ አማኑኤል
እሱን ሊፈታ ተወለደ አማኑኤል
በኃጢአት እስር ተወለደ አማኑኤል
ይሄው ተወልዷል ተወለደ አማኑኤል
በከብቶች በረት ተወለደ አማኑኤል
አልፋ ዖሜጋ ተወለደ አማኑኤል
አምላክ አማልክት ተወለደ አማኑኤል
/አዝ = = = = =
እናመስግነው ተወለደ አማኑኤል
እንደ መላእክት ተወለደ አማኑኤል
ተወልዷልና ተወለደ አማኑኤል
የዓለም መድኃኒት ተወለደ አማኑኤል
ቃል ስጋ ሆነ ተወለደ አማኑኤል
ከድንግል ማርያም ተወለደ አማኑኤል
የጌቶች ጌታ ተወለደ አማኑኤል
መድኃኔዓለም ተወለደ አማኑኤል

CHORUS
የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም
ተወለደ አማኑኤል(፪×)
መጣ ወረደ ተወለደ አማኑኤል
ክብሩን አዋርዶ ተወለደ አማኑኤል
በበረት ተኛ ተወለደ አማኑኤል
ትሕትናን ወዶ ተወለደ አማኑኤል
ጌታ ተወልዷል ተወለደ አማኑኤል
ከድንግል ማርያም ተወለደ አማኑኤል
ጠብን አርቆ ተወለደ አማኑኤል
ሊሰጠን ሰላም ተወለደ አማኑኤል
/አዝ = = = = =
የዲያብሎስን ተወለደ አማኑኤል
ሥልጣን ሊሽር ተወለደ አማኑኤል
እሱን ሊፈታ ተወለደ አማኑኤል
በኃጢአት እስር ተወለደ አማኑኤል
ይሄው ተወልዷል ተወለደ አማኑኤል
በከብቶች በረት ተወለደ አማኑኤል
አልፋ ዖሜጋ ተወለደ አማኑኤል
አምላክ አማልክት ተወለደ አማኑኤል
/አዝ = = = = =
እናመስግነው ተወለደ አማኑኤል
እንደ መላእክት ተወለደ አማኑኤል
ተወልዷልና ተወለደ አማኑኤል
የዓለም መድኃኒት ተወለደ አማኑኤል
ቃል ስጋ ሆነ ተወለደ አማኑኤል
ከድንግል ማርያም ተወለደ አማኑኤል
የጌቶች ጌታ ተወለደ አማኑኤል
መድኃኔዓለም ተወለደ አማኑኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '01c69e48-9131-4712-a337-b27ef471a5e2'::uuid, 'yeamalikit-amilak-tewelede', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- there-is-power-in-your-words ("There Is Power in Your Words")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b3818c67-bb3a-4658-aa9a-f37ac0c825b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 1
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
Kadesh the great frightening desert

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 2
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 3
We have passed through without feeling thirst
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 4
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 5
The walls of Jericho fell with shouts
Enemies will fall without a doubt
Marvelous how we took the city
It is by your will God almighty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 6
It is by your will Lord almighty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 7
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 8
Surpassing the trials and hardships
The marah water changed from tasteless
If we receive manna from above
Its because you are the God of Love

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 9
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 10
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty
Through your grace you changed our story

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 11
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 12
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 13
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 14
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 15
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 1
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
Kadesh the great frightening desert

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 2
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 3
We have passed through without feeling thirst
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 4
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 5
The walls of Jericho fell with shouts
Enemies will fall without a doubt
Marvelous how we took the city
It is by your will God almighty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 6
It is by your will Lord almighty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 7
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 8
Surpassing the trials and hardships
The marah water changed from tasteless
If we receive manna from above
Its because you are the God of Love

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 9
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 10
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty
Through your grace you changed our story

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 11
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 12
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 13
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 14
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 15
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim',
        lyrics_transliteration = 'Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b3818c67-bb3a-4658-aa9a-f37ac0c825b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 1
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih
Kadesh the great frightening desert

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 2
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 3
We have passed through without feeling thirst
You overthrew pharaoh to the sea
It is your name that has set us free
It is you Lord who gave Liberty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 4
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 5
The walls of Jericho fell with shouts
Enemies will fall without a doubt
Marvelous how we took the city
It is by your will God almighty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 6
It is by your will Lord almighty

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 7
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 8
Surpassing the trials and hardships
The marah water changed from tasteless
If we receive manna from above
Its because you are the God of Love

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 9
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 10
Today we will stand strong and alive
With your strength we continue to thrive
From the fields we have gained royalty
Through your grace you changed our story

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 11
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 12
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 13
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 14
Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

VERSE 15
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim

CHORUS
There is power in Your words and victory in Your name
The mountains will tremble Emmanual I proclaim
The seas will part again my Savior I proclaim'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Dil ale besimih dil ale beqalih
Teraraw yinadal Ammanuel silih
Bahir yikefelal Medhanealem silih';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b3818c67-bb3a-4658-aa9a-f37ac0c825b5'::uuid, 'there-is-power-in-your-words', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- live-1908 ("Live")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fecc8849-0037-43ce-bc51-63f9fad21ada'::uuid
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
    WHERE import_id = 'fecc8849-0037-43ce-bc51-63f9fad21ada'::uuid
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
        'fecc8849-0037-43ce-bc51-63f9fad21ada'::uuid, 'live-1908', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nu-bebirhanu-temelalesu ("Nu Bebirhanu Temelalesu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '02abcca1-e530-427f-b813-6db0e04e05f5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 1
ሁሉን በሚችል በአምላክ ጥላ
በእረፍት ውሃ ስር አርፈናልና

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 2
ሰላምና ፍቅር ህይወት በሚሰጥ
ወደ ጌታችን እንሂድ እንሩጥ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 3
ምህረትና ፍርድ በእጁ የያዘው
የሰላም አባት ወድሃኒዓለም ነው

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 4
ህይወት የሆነን በመስቀል ውሎ
ብርሃን ሰጠን ጨለማን ሽሮ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 5
የሚያስደነግጥ የሚያስጨንቀን
ይጠፋልና እርሱን ተማጽነን

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 6
በቀን ከሚበር ፍላጻ ሁሉ
ይታደገናል በቅዱስ ቃሉ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 7
እግርህ በድንጋይ እንዳይመታ
በፈተና ውስጥ እንድትበረታ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 8
መቅሰፍት ከቤትህ እንዲከለከል
ይጠብቅሃል ሌሊትና ቀን

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 9
ስሙን ያወቀ ህይወት መሆኑን
ይመላለሳል ከሃይል ወደ ሃይል

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 10
ረጅም እድሜ ይጠግባል እርሱ
ብርሃን ይሆናል የጸጋ ልብሱ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 11
አቤቱ አንተ ተስፋ ነህና
የምትመግብ የፍቅር መና

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 12
ማዳንህ እኛን አስደስቶናል
እንዲህ ያለ ክብር ከየት ይገኛል

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 1
Hulun bemichil beAmlak t’ila
Berefit wuha sir arfenalna

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 2
Selamna fiqir hiywet bemiset
Wede getachin enhid enirut

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 3
Mihretna fird be’ijju yeyazew
Yeselam abat Wedhanealem new

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 4
Hiywet yehonen bemeskel wulo
Birhan seten cheleman shiro

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 5
Yemiyasdenegit yemiyaschenk’en
Yit’efalna ersun temats’nen

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 6
Beqen kemiber filatsa hulu
Yit’adeginal beKidus qalu

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 7
Egrh bedingay endetaymeta
Befetena wist endetibereta

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 8
Meqseft kebethih endikellekel
Yit’ebikhal lelitna qen

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 9
Simun yawqe hiywet mehonun
Yimelalesal kehayl wede hayl

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 10
Rejim edme yit’egibal ersu
Birhan yihonal yetsegga libsu

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 11
Abetu ante tesfa nehna
Yemitimegib yefiqir mena

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 12
Madanih enyan asdestonal
Endih yale kibir keyet yigenyal

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 1
ሁሉን በሚችል በአምላክ ጥላ
በእረፍት ውሃ ስር አርፈናልና

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 2
ሰላምና ፍቅር ህይወት በሚሰጥ
ወደ ጌታችን እንሂድ እንሩጥ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 3
ምህረትና ፍርድ በእጁ የያዘው
የሰላም አባት ወድሃኒዓለም ነው

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 4
ህይወት የሆነን በመስቀል ውሎ
ብርሃን ሰጠን ጨለማን ሽሮ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 5
የሚያስደነግጥ የሚያስጨንቀን
ይጠፋልና እርሱን ተማጽነን

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 6
በቀን ከሚበር ፍላጻ ሁሉ
ይታደገናል በቅዱስ ቃሉ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 7
እግርህ በድንጋይ እንዳይመታ
በፈተና ውስጥ እንድትበረታ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 8
መቅሰፍት ከቤትህ እንዲከለከል
ይጠብቅሃል ሌሊትና ቀን

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 9
ስሙን ያወቀ ህይወት መሆኑን
ይመላለሳል ከሃይል ወደ ሃይል

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 10
ረጅም እድሜ ይጠግባል እርሱ
ብርሃን ይሆናል የጸጋ ልብሱ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 11
አቤቱ አንተ ተስፋ ነህና
የምትመግብ የፍቅር መና

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 12
ማዳንህ እኛን አስደስቶናል
እንዲህ ያለ ክብር ከየት ይገኛል

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ',
        lyrics_transliteration = 'CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 1
Hulun bemichil beAmlak t’ila
Berefit wuha sir arfenalna

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 2
Selamna fiqir hiywet bemiset
Wede getachin enhid enirut

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 3
Mihretna fird be’ijju yeyazew
Yeselam abat Wedhanealem new

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 4
Hiywet yehonen bemeskel wulo
Birhan seten cheleman shiro

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 5
Yemiyasdenegit yemiyaschenk’en
Yit’efalna ersun temats’nen

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 6
Beqen kemiber filatsa hulu
Yit’adeginal beKidus qalu

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 7
Egrh bedingay endetaymeta
Befetena wist endetibereta

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 8
Meqseft kebethih endikellekel
Yit’ebikhal lelitna qen

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 9
Simun yawqe hiywet mehonun
Yimelalesal kehayl wede hayl

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 10
Rejim edme yit’egibal ersu
Birhan yihonal yetsegga libsu

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 11
Abetu ante tesfa nehna
Yemitimegib yefiqir mena

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 12
Madanih enyan asdestonal
Endih yale kibir keyet yigenyal

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '02abcca1-e530-427f-b813-6db0e04e05f5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 1
ሁሉን በሚችል በአምላክ ጥላ
በእረፍት ውሃ ስር አርፈናልና

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 2
ሰላምና ፍቅር ህይወት በሚሰጥ
ወደ ጌታችን እንሂድ እንሩጥ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 3
ምህረትና ፍርድ በእጁ የያዘው
የሰላም አባት ወድሃኒዓለም ነው

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 4
ህይወት የሆነን በመስቀል ውሎ
ብርሃን ሰጠን ጨለማን ሽሮ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 5
የሚያስደነግጥ የሚያስጨንቀን
ይጠፋልና እርሱን ተማጽነን

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 6
በቀን ከሚበር ፍላጻ ሁሉ
ይታደገናል በቅዱስ ቃሉ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 7
እግርህ በድንጋይ እንዳይመታ
በፈተና ውስጥ እንድትበረታ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 8
መቅሰፍት ከቤትህ እንዲከለከል
ይጠብቅሃል ሌሊትና ቀን

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 9
ስሙን ያወቀ ህይወት መሆኑን
ይመላለሳል ከሃይል ወደ ሃይል

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 10
ረጅም እድሜ ይጠግባል እርሱ
ብርሃን ይሆናል የጸጋ ልብሱ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 11
አቤቱ አንተ ተስፋ ነህና
የምትመግብ የፍቅር መና

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 12
ማዳንህ እኛን አስደስቶናል
እንዲህ ያለ ክብር ከየት ይገኛል

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 1
Hulun bemichil beAmlak t’ila
Berefit wuha sir arfenalna

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 2
Selamna fiqir hiywet bemiset
Wede getachin enhid enirut

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 3
Mihretna fird be’ijju yeyazew
Yeselam abat Wedhanealem new

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 4
Hiywet yehonen bemeskel wulo
Birhan seten cheleman shiro

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 5
Yemiyasdenegit yemiyaschenk’en
Yit’efalna ersun temats’nen

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 6
Beqen kemiber filatsa hulu
Yit’adeginal beKidus qalu

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 7
Egrh bedingay endetaymeta
Befetena wist endetibereta

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 8
Meqseft kebethih endikellekel
Yit’ebikhal lelitna qen

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 9
Simun yawqe hiywet mehonun
Yimelalesal kehayl wede hayl

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 10
Rejim edme yit’egibal ersu
Birhan yihonal yetsegga libsu

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 11
Abetu ante tesfa nehna
Yemitimegib yefiqir mena

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 12
Madanih enyan asdestonal
Endih yale kibir keyet yigenyal

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '02abcca1-e530-427f-b813-6db0e04e05f5'::uuid, 'nu-bebirhanu-temelalesu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyam-teabi ("Mariyam Teabi")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9d3e96bc-234b-4ceb-a3e0-b096bdcb8e48'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት

VERSE 1
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት

CHORUS
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam teabi emkulu fit’ret
Iyawaya esate melekot

VERSE 1
Maryam teabi emkulu fit’ret
Iyawaya esate melekot

CHORUS
Maryam teabi emkulu fit’ret
Iyawaya esate melekot'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት

VERSE 1
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት

CHORUS
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት',
        lyrics_transliteration = 'CHORUS
Maryam teabi emkulu fit’ret
Iyawaya esate melekot

VERSE 1
Maryam teabi emkulu fit’ret
Iyawaya esate melekot

CHORUS
Maryam teabi emkulu fit’ret
Iyawaya esate melekot',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9d3e96bc-234b-4ceb-a3e0-b096bdcb8e48'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት

VERSE 1
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት

CHORUS
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9d3e96bc-234b-4ceb-a3e0-b096bdcb8e48'::uuid, 'mariyam-teabi', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- huletegna-semay ("Huletegna Semay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5b6bbbf4-5e42-44cb-a195-3404033b4374'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 1
የጽዮን ምሳሌ ሰማይ ተዘረጋ
ኃይለ ልዑል ያላት የተመላች ጸጋ
በአምላክ ሕሊና የኖረች ታስባ
ጸዋሪተ ፍሬ የገነት አበባ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 2
የተለየች ድንኳን ለሊቀ ካህናቱ
የተገለጸባት የእግዚአብሔር ምሕረቱ
ከያዕቆብ ድንኳኖች ያንቺን ውበት ወዶ
ወደ ርስቱ አገባን የሠጠንን ወስዶ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 3
የምሕረትን ዝናም ያወረድሽ ደመና
ንጽሕት መሶበ ወርቅ በውስጥ ያለሽ መና
ዓለምን ያጽናናሽ አዲስ ብሥራት ዜና
አርጋኖን ውዳሴ ላንቺ ይሁን ሞስጋና

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 4
በልማድሽ ምሕረት ባደረግሽው ምልጃ
የጭንቁን ማቅ ቀድዶ አለበሰን ግምጃ
ባንቺ ያገኘነው የሠራልን ሥራ
ዕፁብ ዕፁብ እንጂ አያልቅም ቢወራ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 1
Yets’yon misale semay tezerega
Hayle liul yalat yetemelach ts’ega
Beamlak hilina yenorech tasba
Ts’ewarite fire yegenet abeba

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 2
Yeteleyech dinkwan leliqe kahnatu
Yetegelets’ebat yeEgziabher mihretu
Keyaeqob dinkwanoch yanchin wibet wedo
Wede ristu ageban yeset’enn wesdo

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 3
Yemhretn zinam yaweredsh demena
Nits’ht mesobe werq bewst’ yalesh mena
Alemn yats’nanash adis bisrat zena
Arganon widase lanchi yihun mosgana

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 4
Belmadsh mihret baderegshw milja
Yech’nqun maq qeddo alebesen gimja
Banchi yagegnenew yeseraln sira
Ets’ub ets’ub enji ayalqm biwera

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 1
የጽዮን ምሳሌ ሰማይ ተዘረጋ
ኃይለ ልዑል ያላት የተመላች ጸጋ
በአምላክ ሕሊና የኖረች ታስባ
ጸዋሪተ ፍሬ የገነት አበባ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 2
የተለየች ድንኳን ለሊቀ ካህናቱ
የተገለጸባት የእግዚአብሔር ምሕረቱ
ከያዕቆብ ድንኳኖች ያንቺን ውበት ወዶ
ወደ ርስቱ አገባን የሠጠንን ወስዶ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 3
የምሕረትን ዝናም ያወረድሽ ደመና
ንጽሕት መሶበ ወርቅ በውስጥ ያለሽ መና
ዓለምን ያጽናናሽ አዲስ ብሥራት ዜና
አርጋኖን ውዳሴ ላንቺ ይሁን ሞስጋና

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 4
በልማድሽ ምሕረት ባደረግሽው ምልጃ
የጭንቁን ማቅ ቀድዶ አለበሰን ግምጃ
ባንቺ ያገኘነው የሠራልን ሥራ
ዕፁብ ዕፁብ እንጂ አያልቅም ቢወራ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ',
        lyrics_transliteration = 'CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 1
Yets’yon misale semay tezerega
Hayle liul yalat yetemelach ts’ega
Beamlak hilina yenorech tasba
Ts’ewarite fire yegenet abeba

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 2
Yeteleyech dinkwan leliqe kahnatu
Yetegelets’ebat yeEgziabher mihretu
Keyaeqob dinkwanoch yanchin wibet wedo
Wede ristu ageban yeset’enn wesdo

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 3
Yemhretn zinam yaweredsh demena
Nits’ht mesobe werq bewst’ yalesh mena
Alemn yats’nanash adis bisrat zena
Arganon widase lanchi yihun mosgana

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru

VERSE 4
Belmadsh mihret baderegshw milja
Yech’nqun maq qeddo alebesen gimja
Banchi yagegnenew yeseraln sira
Ets’ub ets’ub enji ayalqm biwera

CHORUS
Ankro yigebawal amlakachn gibru
Befet’erat Dingil liyadnen maderu
Huletegna semay yeEgziabher menberu
Leenatachn ts’yon fit’retat zemru',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5b6bbbf4-5e42-44cb-a195-3404033b4374'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 1
የጽዮን ምሳሌ ሰማይ ተዘረጋ
ኃይለ ልዑል ያላት የተመላች ጸጋ
በአምላክ ሕሊና የኖረች ታስባ
ጸዋሪተ ፍሬ የገነት አበባ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 2
የተለየች ድንኳን ለሊቀ ካህናቱ
የተገለጸባት የእግዚአብሔር ምሕረቱ
ከያዕቆብ ድንኳኖች ያንቺን ውበት ወዶ
ወደ ርስቱ አገባን የሠጠንን ወስዶ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 3
የምሕረትን ዝናም ያወረድሽ ደመና
ንጽሕት መሶበ ወርቅ በውስጥ ያለሽ መና
ዓለምን ያጽናናሽ አዲስ ብሥራት ዜና
አርጋኖን ውዳሴ ላንቺ ይሁን ሞስጋና

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ

VERSE 4
በልማድሽ ምሕረት ባደረግሽው ምልጃ
የጭንቁን ማቅ ቀድዶ አለበሰን ግምጃ
ባንቺ ያገኘነው የሠራልን ሥራ
ዕፁብ ዕፁብ እንጂ አያልቅም ቢወራ

CHORUS
አንክሮ ይገባዋል አምላካችን ግብሩ
በፈጠራት ድንግል ሊያድነን ማደሩ
ሁለተኛ ሰማይ የእግዚአብሔር መንበሩ
ለእናታችን ጽዮን ፍጥረታት ዘምሩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5b6bbbf4-5e42-44cb-a195-3404033b4374'::uuid, 'huletegna-semay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ken-amita ("Ken Amita")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '02f13f6e-ef71-4c98-871e-c6fb6123ad6c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 1
እባክህ ቀን አምጣ ታረቀን አቤቱ
ልብ ያለው ልብ ይበል ዘመኑን ያስተውል እንደሚገባ
ማነው ያላለቀሰ ያላነባ (x2)
መሻገሪያው በእሳት ከታጠረ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 2
ሰው በጭንቀት ብዛት ከሰከረ
የደሀው ደም መፋረጃ ካጣ
ከትላንቱም
የባሰ ከመጣ (x2)

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 3
የዋሂቱ እርግብ በዘንዶ ምላስ ላይ ጣለች ልጆቿን
ታዲያ ማን አየው ሊላት ጫጩቶቿን
እኮ ማን አየሁ ሊላት ክፋዮቿን
እረ ፍትህ ዳኛ ወዴት አለ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 4
ከተማውስ ይሄን ጉድ ምን አለ
ለማይራራው አመፅ ለተሞላ
ፍርድ የለም ወይ
አደራ ለበላ (x2)

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 5
ምነው ያለ ወትሮ ቀኑ ጨላለመ ፀና ደመናው
ታላቁ የፍርድ ቀን ገናና ነው
ታላቁ የፍርድ ቀን ሚያስፈራ ነው
አኬልዳማ ምድር ቃልዋን ሰጠች

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 6
የእግዚአብሔር ጣት ይህን አደረገች
የአመፀኞች ቅጥራቸው ፈረሰ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 1
Ebakh qen amt’a tareqen abetu
Lib yalew lib yibel zemenun yastewl endemigeba
Manew yalaleqese yalaneba (x2)
Meshageriyaw beesat ketat’ere

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 2
Sew bech’nqet bizat kesekere
Yedehew dem mefareja kat’a
Ketlantum
Yebase kemet’a (x2)

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 3
Yewahitu ergb bezendo milas lay t’alech lijochwan
Tadiya man ayew lilat ch’ach’utochwan
Eko man ayehu lilat kifayochwan
Ere fith dagna wedet ale

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 4
Ketemaws yihen gud min ale
Lemayraraw amets’ letemola
Fird yelem wey
Adera lebela (x2)

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 5
Minew yale wetro qenu ch’elaleme ts’ena demenaw
Talaqu yefrd qen genana new
Talaqu yefrd qen miyasfera new
Akeldama midr qalwan set’ech

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 6
YeEgziabher t’at yihn aderegech
Yeamets’egnoch qit’rachew ferese

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 1
እባክህ ቀን አምጣ ታረቀን አቤቱ
ልብ ያለው ልብ ይበል ዘመኑን ያስተውል እንደሚገባ
ማነው ያላለቀሰ ያላነባ (x2)
መሻገሪያው በእሳት ከታጠረ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 2
ሰው በጭንቀት ብዛት ከሰከረ
የደሀው ደም መፋረጃ ካጣ
ከትላንቱም
የባሰ ከመጣ (x2)

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 3
የዋሂቱ እርግብ በዘንዶ ምላስ ላይ ጣለች ልጆቿን
ታዲያ ማን አየው ሊላት ጫጩቶቿን
እኮ ማን አየሁ ሊላት ክፋዮቿን
እረ ፍትህ ዳኛ ወዴት አለ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 4
ከተማውስ ይሄን ጉድ ምን አለ
ለማይራራው አመፅ ለተሞላ
ፍርድ የለም ወይ
አደራ ለበላ (x2)

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 5
ምነው ያለ ወትሮ ቀኑ ጨላለመ ፀና ደመናው
ታላቁ የፍርድ ቀን ገናና ነው
ታላቁ የፍርድ ቀን ሚያስፈራ ነው
አኬልዳማ ምድር ቃልዋን ሰጠች

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 6
የእግዚአብሔር ጣት ይህን አደረገች
የአመፀኞች ቅጥራቸው ፈረሰ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ',
        lyrics_transliteration = 'CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 1
Ebakh qen amt’a tareqen abetu
Lib yalew lib yibel zemenun yastewl endemigeba
Manew yalaleqese yalaneba (x2)
Meshageriyaw beesat ketat’ere

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 2
Sew bech’nqet bizat kesekere
Yedehew dem mefareja kat’a
Ketlantum
Yebase kemet’a (x2)

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 3
Yewahitu ergb bezendo milas lay t’alech lijochwan
Tadiya man ayew lilat ch’ach’utochwan
Eko man ayehu lilat kifayochwan
Ere fith dagna wedet ale

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 4
Ketemaws yihen gud min ale
Lemayraraw amets’ letemola
Fird yelem wey
Adera lebela (x2)

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 5
Minew yale wetro qenu ch’elaleme ts’ena demenaw
Talaqu yefrd qen genana new
Talaqu yefrd qen miyasfera new
Akeldama midr qalwan set’ech

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu

VERSE 6
YeEgziabher t’at yihn aderegech
Yeamets’egnoch qit’rachew ferese

CHORUS
Ebakh Getaye ebakh qen amt’a
Ebakh yahewe ebakh tew fired
Tew fired ayqet’l amets’aw difretu
Ebakh qen amt’a tenager abetu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '02f13f6e-ef71-4c98-871e-c6fb6123ad6c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 1
እባክህ ቀን አምጣ ታረቀን አቤቱ
ልብ ያለው ልብ ይበል ዘመኑን ያስተውል እንደሚገባ
ማነው ያላለቀሰ ያላነባ (x2)
መሻገሪያው በእሳት ከታጠረ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 2
ሰው በጭንቀት ብዛት ከሰከረ
የደሀው ደም መፋረጃ ካጣ
ከትላንቱም
የባሰ ከመጣ (x2)

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 3
የዋሂቱ እርግብ በዘንዶ ምላስ ላይ ጣለች ልጆቿን
ታዲያ ማን አየው ሊላት ጫጩቶቿን
እኮ ማን አየሁ ሊላት ክፋዮቿን
እረ ፍትህ ዳኛ ወዴት አለ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 4
ከተማውስ ይሄን ጉድ ምን አለ
ለማይራራው አመፅ ለተሞላ
ፍርድ የለም ወይ
አደራ ለበላ (x2)

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 5
ምነው ያለ ወትሮ ቀኑ ጨላለመ ፀና ደመናው
ታላቁ የፍርድ ቀን ገናና ነው
ታላቁ የፍርድ ቀን ሚያስፈራ ነው
አኬልዳማ ምድር ቃልዋን ሰጠች

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ

VERSE 6
የእግዚአብሔር ጣት ይህን አደረገች
የአመፀኞች ቅጥራቸው ፈረሰ

CHORUS
እባክህ ጌታዬ እባክህ ቀን አምጣ
እባክህ ያሀዌ እባክህ ተው ፍረድ
ተው ፍረድ አይቀጥል አመፃው ድፍረቱ
እባክህ ቀን አምጣ ተናገር አቤቱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '02f13f6e-ef71-4c98-871e-c6fb6123ad6c'::uuid, 'ken-amita', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- akim-ataw-zemari-yeabikal-desalegn ("Akim Ataw Zemari Yeabikal Desalegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b4b4b601-23ca-42b9-8d61-9dfec469180e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 1
ምቾት ሆኖኝ ለሥጋዬ የኃጢአት አልጋ
የማስበው ሌላ የለ መሸም ነጋ
ልቤ ካንተ መሸፈቱን እያወከው
በሬ ቆመህ ማንኳኳትህ ለምንድን ነው

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 2
ፍቅር ስቦህ ከሰማያት ወርደህ ለኔ
ምን አዚም ነው ማስተዋልን ያጣሁ እኔ
እየሰማሁ እንዳልሰማ ዝም ማለቴ
ቢበዛ ነው ያስቀየምኩህ ነውር ኃጢአቴ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 3
ግባ ቤቴ ብዬ ልልህ አቅም አጣው
ነውሬ በዝቶ በኃጢአቴ የከረፋው
ልቤ ለዓለም አፌ ላንተ በመሆኑ
አይታይም ደምህ በሬ በመቃኑ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 4
ስትንኳኳ እንቢ ያልኩኝ ምዘገየው
በዓለም ፍቅር እኔነቴ ነዶብኝ ነው
የእንባ መባዕ ባይኔ አቅፌ ቤትህ ልምጣ
በፍቅር እንጂ በበትርህ መች ትቀጣ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 1
Michot honogn lesgaye yehat’iat alga
Yemasbew lela yele meshem nega
Libe kante meshefetun eyawekew
Bere qomeh mankwakwath lemndn new

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 2
Fiqr siboh kesemayat werdeh lene
Min azim new mastewaln yat’ahu ene
Eyesemahu endalsema zim malete
Bibeza new yasqeyemkuh newr hat’iate

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 3
Giba bete biye lilh aqm at’aw
Newre bezto behat’iate yekerefaw
Libe lealem afe lante bemehonu
Aytaym demh bere bemeqanu

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 4
Sitnkwakwa enbi yalkugn mizegeyew
Bealem fiqr enenete nedobgn new
Yeenba mebae bayne aqfe beth limt’a
Befqr enji bebetrh mech tiqet’a

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 1
ምቾት ሆኖኝ ለሥጋዬ የኃጢአት አልጋ
የማስበው ሌላ የለ መሸም ነጋ
ልቤ ካንተ መሸፈቱን እያወከው
በሬ ቆመህ ማንኳኳትህ ለምንድን ነው

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 2
ፍቅር ስቦህ ከሰማያት ወርደህ ለኔ
ምን አዚም ነው ማስተዋልን ያጣሁ እኔ
እየሰማሁ እንዳልሰማ ዝም ማለቴ
ቢበዛ ነው ያስቀየምኩህ ነውር ኃጢአቴ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 3
ግባ ቤቴ ብዬ ልልህ አቅም አጣው
ነውሬ በዝቶ በኃጢአቴ የከረፋው
ልቤ ለዓለም አፌ ላንተ በመሆኑ
አይታይም ደምህ በሬ በመቃኑ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 4
ስትንኳኳ እንቢ ያልኩኝ ምዘገየው
በዓለም ፍቅር እኔነቴ ነዶብኝ ነው
የእንባ መባዕ ባይኔ አቅፌ ቤትህ ልምጣ
በፍቅር እንጂ በበትርህ መች ትቀጣ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ',
        lyrics_transliteration = 'CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 1
Michot honogn lesgaye yehat’iat alga
Yemasbew lela yele meshem nega
Libe kante meshefetun eyawekew
Bere qomeh mankwakwath lemndn new

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 2
Fiqr siboh kesemayat werdeh lene
Min azim new mastewaln yat’ahu ene
Eyesemahu endalsema zim malete
Bibeza new yasqeyemkuh newr hat’iate

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 3
Giba bete biye lilh aqm at’aw
Newre bezto behat’iate yekerefaw
Libe lealem afe lante bemehonu
Aytaym demh bere bemeqanu

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 4
Sitnkwakwa enbi yalkugn mizegeyew
Bealem fiqr enenete nedobgn new
Yeenba mebae bayne aqfe beth limt’a
Befqr enji bebetrh mech tiqet’a

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b4b4b601-23ca-42b9-8d61-9dfec469180e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 1
ምቾት ሆኖኝ ለሥጋዬ የኃጢአት አልጋ
የማስበው ሌላ የለ መሸም ነጋ
ልቤ ካንተ መሸፈቱን እያወከው
በሬ ቆመህ ማንኳኳትህ ለምንድን ነው

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 2
ፍቅር ስቦህ ከሰማያት ወርደህ ለኔ
ምን አዚም ነው ማስተዋልን ያጣሁ እኔ
እየሰማሁ እንዳልሰማ ዝም ማለቴ
ቢበዛ ነው ያስቀየምኩህ ነውር ኃጢአቴ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 3
ግባ ቤቴ ብዬ ልልህ አቅም አጣው
ነውሬ በዝቶ በኃጢአቴ የከረፋው
ልቤ ለዓለም አፌ ላንተ በመሆኑ
አይታይም ደምህ በሬ በመቃኑ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 4
ስትንኳኳ እንቢ ያልኩኝ ምዘገየው
በዓለም ፍቅር እኔነቴ ነዶብኝ ነው
የእንባ መባዕ ባይኔ አቅፌ ቤትህ ልምጣ
በፍቅር እንጂ በበትርህ መች ትቀጣ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b4b4b601-23ca-42b9-8d61-9dfec469180e'::uuid, 'akim-ataw-zemari-yeabikal-desalegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yepetirosin-eniba ("Yepetirosin Eniba")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '62d7a44d-2ea4-401d-9213-878f3968a447'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 1
ቸርነትህ በዝቶ ምህረት ቢያሰጠኝ
እጆቼን ዘርግቼ እማጸናለሁኝ
ደምህ የፈሰሰው ለኔ ስለሆነ /2/
በኃጢአት ልትተወኝ ልብህ አልጨከነም

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 2
ዓለማዊ ምግባር ልቤ ቢከተልም
ከዚህ ሁሉ ማዳን ጌታ አይሳንህም
ኃጢአት እየሰራሁኝ ባስቀይምህም/2/
በሂሶጵ እርጨኝ ጌታ እጠበኝ እባክህ

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 3
ዲያቢሎስ ያመጣው ጸጸቴ ውድቀት ነው
የይሁዳ ምሬት የሞት ነው ፍፃሜው
ይህንን መማረር እኔ አልፈልግም /2/
የውድቀት ጉዞ እንጂ ትንሳኤ የለውም

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 4
ጴጥሮስ አባ ብሎ የተማጸነበት
ፍቅሩን በንስሀ ስቦ ያመጣበት
ፍጻሜው የሚያምር ንስሀ ስጠኝ /2/
የልቅሶ አምሐ የእንባን ህይወት ስጠኝ

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 1
Cherneth bezto mihret biyaset’egn
Ejochen zergche emats’enalehugn
Demh yefesesew lene silehone (2)
Behat’iat littewegn libh alch’ekenem

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 2
Alemawi migbar libe biketelm
Kezih hulu madan Geta aysanhm
Hat’iat eyeserahugn basqeymhm (2)
Behisop’ erch’egn Geta et’ebegn ebakh

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 3
Diyabilos yamet’aw ts’ets’ete widqet new
Yeyhuda miret yemot new fits’amew
Yihnn memarer ene alfelgm (2)
Yewdqet guzo enji tinsae yelewm

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 4
P’et’ros aba bilo yetemats’enebet
Fiqrun benshe sibo yamet’abet
Fits’amew yemiyamr nishe sit’egn (2)
Yelqso amhe yeenban hiywet sit’egn

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 1
ቸርነትህ በዝቶ ምህረት ቢያሰጠኝ
እጆቼን ዘርግቼ እማጸናለሁኝ
ደምህ የፈሰሰው ለኔ ስለሆነ /2/
በኃጢአት ልትተወኝ ልብህ አልጨከነም

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 2
ዓለማዊ ምግባር ልቤ ቢከተልም
ከዚህ ሁሉ ማዳን ጌታ አይሳንህም
ኃጢአት እየሰራሁኝ ባስቀይምህም/2/
በሂሶጵ እርጨኝ ጌታ እጠበኝ እባክህ

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 3
ዲያቢሎስ ያመጣው ጸጸቴ ውድቀት ነው
የይሁዳ ምሬት የሞት ነው ፍፃሜው
ይህንን መማረር እኔ አልፈልግም /2/
የውድቀት ጉዞ እንጂ ትንሳኤ የለውም

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 4
ጴጥሮስ አባ ብሎ የተማጸነበት
ፍቅሩን በንስሀ ስቦ ያመጣበት
ፍጻሜው የሚያምር ንስሀ ስጠኝ /2/
የልቅሶ አምሐ የእንባን ህይወት ስጠኝ

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ',
        lyrics_transliteration = 'CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 1
Cherneth bezto mihret biyaset’egn
Ejochen zergche emats’enalehugn
Demh yefesesew lene silehone (2)
Behat’iat littewegn libh alch’ekenem

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 2
Alemawi migbar libe biketelm
Kezih hulu madan Geta aysanhm
Hat’iat eyeserahugn basqeymhm (2)
Behisop’ erch’egn Geta et’ebegn ebakh

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 3
Diyabilos yamet’aw ts’ets’ete widqet new
Yeyhuda miret yemot new fits’amew
Yihnn memarer ene alfelgm (2)
Yewdqet guzo enji tinsae yelewm

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 4
P’et’ros aba bilo yetemats’enebet
Fiqrun benshe sibo yamet’abet
Fits’amew yemiyamr nishe sit’egn (2)
Yelqso amhe yeenban hiywet sit’egn

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '62d7a44d-2ea4-401d-9213-878f3968a447'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 1
ቸርነትህ በዝቶ ምህረት ቢያሰጠኝ
እጆቼን ዘርግቼ እማጸናለሁኝ
ደምህ የፈሰሰው ለኔ ስለሆነ /2/
በኃጢአት ልትተወኝ ልብህ አልጨከነም

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 2
ዓለማዊ ምግባር ልቤ ቢከተልም
ከዚህ ሁሉ ማዳን ጌታ አይሳንህም
ኃጢአት እየሰራሁኝ ባስቀይምህም/2/
በሂሶጵ እርጨኝ ጌታ እጠበኝ እባክህ

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 3
ዲያቢሎስ ያመጣው ጸጸቴ ውድቀት ነው
የይሁዳ ምሬት የሞት ነው ፍፃሜው
ይህንን መማረር እኔ አልፈልግም /2/
የውድቀት ጉዞ እንጂ ትንሳኤ የለውም

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 4
ጴጥሮስ አባ ብሎ የተማጸነበት
ፍቅሩን በንስሀ ስቦ ያመጣበት
ፍጻሜው የሚያምር ንስሀ ስጠኝ /2/
የልቅሶ አምሐ የእንባን ህይወት ስጠኝ

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '62d7a44d-2ea4-401d-9213-878f3968a447'::uuid, 'yepetirosin-eniba', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
