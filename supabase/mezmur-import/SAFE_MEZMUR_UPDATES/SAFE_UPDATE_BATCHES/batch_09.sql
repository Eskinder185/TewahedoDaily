-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 09 OF 32
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
  -- mikurab ("mikurab")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '53798040-0803-450d-ae05-f2c32c33d257'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 1
መዓዛ ቅዱሳን ቤተልሔም ቅድስት
ቤተክርስቲያን ናት ቀራንዮ ውድስት
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 2
አዝ…
ሰሎሞን የሠራት ይህቺ ቤተ መቅደስ
ዘለዓለም ሕያው ናት አትፈርስ አትታደስ
ክብሯን ለተረዳ ደጇ ለማለለ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 3
ከሰልሎሞን ሚበልጥ በዕውነት በእርሷ አለ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 4
በደሙ ነውና ዙሪያዋን ያጠራት
በመስቀል ሸልሞ በፍቅር ሞሸራት
ድንጋይ ሲያነሱበት ዝምታን መረጠ
ገበያ ሲያደርጓት ጅራፉን ገለጠ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 5
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
ዛሬም የርሷን ውበት በገበያ ሸማ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 6
የሚሸፍን አለ ሊያቆሽሽ ሊያደማ
ከልዑሉ መንበር ሳይወርድበት ቁጣ
በቃሉ ይታረም ጅራፉ ሳይመጣ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 7
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
መቅደስ ማለት ልቤ አንተ የምታድርበት
ተድላና ፍስሐ የሚደረግበት

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 8
ልቤን ካቆሸሸው ግብዝነት እንዳርፍ
ገርፈህ አባርልኝ በወንጌልህ ጅራፍ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 9
አዝ…

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 1
Meaza Kidusan betelhem Kidist
Bete Kristian nat qeranyo widst
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 2
CHORUS
Selomon yeserat yihchi bete meqdes
Zelealem hiyaw nat atfers attades
Kibrwan letereda dejwa lemalele

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 3
Kesellomon mibelt’ beewnet beerswa ale
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya
CHORUS

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 4
Bedemu newna zuriyawan yat’erat
Bemesqel shelmo befqr mosherat
Dingay siyanesubet zimtan meret’e
Gebeya siyadergwat jirafun gelet’e

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 5
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya
CHORUS
Zarem yerswan wibet begebeya shema

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 6
Yemishefn ale liyaqoshsh liyadema
Kelulu menber saywerdbet qut’a
Beqalu yitarem jirafu saymet’a
Beten atadrgwat sheqet’ mesheshegiya

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 7
Zufane natna ts’elot masaregiya
CHORUS
Meqdes malet libe ante yemtadrbet
Tedlana fishe yemideregbet

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 8
Liben kaqosheshew gibznet endarf
Gerfeh abarlgn bewengelh jiraf
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 9
CHORUS

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 1
መዓዛ ቅዱሳን ቤተልሔም ቅድስት
ቤተክርስቲያን ናት ቀራንዮ ውድስት
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 2
አዝ…
ሰሎሞን የሠራት ይህቺ ቤተ መቅደስ
ዘለዓለም ሕያው ናት አትፈርስ አትታደስ
ክብሯን ለተረዳ ደጇ ለማለለ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 3
ከሰልሎሞን ሚበልጥ በዕውነት በእርሷ አለ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 4
በደሙ ነውና ዙሪያዋን ያጠራት
በመስቀል ሸልሞ በፍቅር ሞሸራት
ድንጋይ ሲያነሱበት ዝምታን መረጠ
ገበያ ሲያደርጓት ጅራፉን ገለጠ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 5
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
ዛሬም የርሷን ውበት በገበያ ሸማ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 6
የሚሸፍን አለ ሊያቆሽሽ ሊያደማ
ከልዑሉ መንበር ሳይወርድበት ቁጣ
በቃሉ ይታረም ጅራፉ ሳይመጣ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 7
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
መቅደስ ማለት ልቤ አንተ የምታድርበት
ተድላና ፍስሐ የሚደረግበት

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 8
ልቤን ካቆሸሸው ግብዝነት እንዳርፍ
ገርፈህ አባርልኝ በወንጌልህ ጅራፍ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 9
አዝ…

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ',
        lyrics_transliteration = 'CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 1
Meaza Kidusan betelhem Kidist
Bete Kristian nat qeranyo widst
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 2
CHORUS
Selomon yeserat yihchi bete meqdes
Zelealem hiyaw nat atfers attades
Kibrwan letereda dejwa lemalele

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 3
Kesellomon mibelt’ beewnet beerswa ale
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya
CHORUS

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 4
Bedemu newna zuriyawan yat’erat
Bemesqel shelmo befqr mosherat
Dingay siyanesubet zimtan meret’e
Gebeya siyadergwat jirafun gelet’e

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 5
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya
CHORUS
Zarem yerswan wibet begebeya shema

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 6
Yemishefn ale liyaqoshsh liyadema
Kelulu menber saywerdbet qut’a
Beqalu yitarem jirafu saymet’a
Beten atadrgwat sheqet’ mesheshegiya

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 7
Zufane natna ts’elot masaregiya
CHORUS
Meqdes malet libe ante yemtadrbet
Tedlana fishe yemideregbet

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 8
Liben kaqosheshew gibznet endarf
Gerfeh abarlgn bewengelh jiraf
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 9
CHORUS

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera',
        updated_at = clock_timestamp()::text
    WHERE import_id = '53798040-0803-450d-ae05-f2c32c33d257'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 1
መዓዛ ቅዱሳን ቤተልሔም ቅድስት
ቤተክርስቲያን ናት ቀራንዮ ውድስት
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 2
አዝ…
ሰሎሞን የሠራት ይህቺ ቤተ መቅደስ
ዘለዓለም ሕያው ናት አትፈርስ አትታደስ
ክብሯን ለተረዳ ደጇ ለማለለ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 3
ከሰልሎሞን ሚበልጥ በዕውነት በእርሷ አለ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 4
በደሙ ነውና ዙሪያዋን ያጠራት
በመስቀል ሸልሞ በፍቅር ሞሸራት
ድንጋይ ሲያነሱበት ዝምታን መረጠ
ገበያ ሲያደርጓት ጅራፉን ገለጠ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 5
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
ዛሬም የርሷን ውበት በገበያ ሸማ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 6
የሚሸፍን አለ ሊያቆሽሽ ሊያደማ
ከልዑሉ መንበር ሳይወርድበት ቁጣ
በቃሉ ይታረም ጅራፉ ሳይመጣ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 7
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
መቅደስ ማለት ልቤ አንተ የምታድርበት
ተድላና ፍስሐ የሚደረግበት

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 8
ልቤን ካቆሸሸው ግብዝነት እንዳርፍ
ገርፈህ አባርልኝ በወንጌልህ ጅራፍ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 9
አዝ…

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '53798040-0803-450d-ae05-f2c32c33d257'::uuid, 'mikurab', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enide-elisabet-lamesiginish ("Enide Elisabet Lamesiginish")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '95d98e8a-6b0c-4d0e-928a-12177bfbd39c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 1
ርኀራኄሽ ያስደንቀኛል
ስለ ኃጢአቴ ምልጃሽ ይቀድማል
የሰላምታሽ ድምፅ ደስ ያሰኘኛል
ከትካዜዬም ያሳርፈኛል

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 2
ድምፅሽ ሲሰማኝ ልቤ ይረካል
ሃዘኔ ቀርቶ ፊቴ ይፈካል
በእናትነት አንቺን ለሰጠን
ቸሩ አምላካችን ይክበር ይመስገን

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 3
የሁሉ እመቤት የሁሉ አጽናኝ
የአበዉ መድኀኒት ከአምላክ አገናኝ
ዛሬም በልቤ ደስታን ጨምረሽ
እንደ ኤልሳቤጥ ሰላም ልበልሽ

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 4
ከሴቶች መካከል መርጦ ቀድሶሻል
ትዉልድ ሁሉ ብፅዕት ይሉሻል
በልዩ ወዳሴ ያመሰግኑሻል
ድንግል ንግሥታችን በቀኙ ቆመሻል

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 5
የሰላሞታሽ ድምፅ ልቤ ሲሰማ
ነፍሴ ደስ አላት ቀለለ ሸክሟ
ድንግል ለክብርሽ ስንበረከክ
እጅሽ ይዘርጋ ለመባረክ

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 1
Riherahesh yasdenqegnal
Sile hat’iate miljash yiqedmal
Yeselamtash dimts’ des yasegnegnal
Ketkazeyem yasarfegnal

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 2
Dimts’sh sisemagn libe yirekal
Hazene qerto fite yifekal
Beenatnet anchin leset’en
Cheru amlakachn yikber yemesgen

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 3
Yehulu emebet yehulu ats’nagn
Yeabewu medhenit keamlak agenagn
Zarem belbe destan ch’emresh
Ende elsabet’ selam libelsh

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 4
Kesetoch mekakel mert’o qedsoshal
Tiwuld hulu bits’et yilushal
Belyu wedase yamesegnushal
Dingil nigstachn beqegnu qomeshal

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 5
Yeselamotash dimts’ libe sisema
Nefse des alat qelele shekmwa
Dingil lekbrsh sinberekek
Ejsh yizerga lemebarek

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 1
ርኀራኄሽ ያስደንቀኛል
ስለ ኃጢአቴ ምልጃሽ ይቀድማል
የሰላምታሽ ድምፅ ደስ ያሰኘኛል
ከትካዜዬም ያሳርፈኛል

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 2
ድምፅሽ ሲሰማኝ ልቤ ይረካል
ሃዘኔ ቀርቶ ፊቴ ይፈካል
በእናትነት አንቺን ለሰጠን
ቸሩ አምላካችን ይክበር ይመስገን

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 3
የሁሉ እመቤት የሁሉ አጽናኝ
የአበዉ መድኀኒት ከአምላክ አገናኝ
ዛሬም በልቤ ደስታን ጨምረሽ
እንደ ኤልሳቤጥ ሰላም ልበልሽ

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 4
ከሴቶች መካከል መርጦ ቀድሶሻል
ትዉልድ ሁሉ ብፅዕት ይሉሻል
በልዩ ወዳሴ ያመሰግኑሻል
ድንግል ንግሥታችን በቀኙ ቆመሻል

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 5
የሰላሞታሽ ድምፅ ልቤ ሲሰማ
ነፍሴ ደስ አላት ቀለለ ሸክሟ
ድንግል ለክብርሽ ስንበረከክ
እጅሽ ይዘርጋ ለመባረክ

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት',
        lyrics_transliteration = 'CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 1
Riherahesh yasdenqegnal
Sile hat’iate miljash yiqedmal
Yeselamtash dimts’ des yasegnegnal
Ketkazeyem yasarfegnal

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 2
Dimts’sh sisemagn libe yirekal
Hazene qerto fite yifekal
Beenatnet anchin leset’en
Cheru amlakachn yikber yemesgen

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 3
Yehulu emebet yehulu ats’nagn
Yeabewu medhenit keamlak agenagn
Zarem belbe destan ch’emresh
Ende elsabet’ selam libelsh

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 4
Kesetoch mekakel mert’o qedsoshal
Tiwuld hulu bits’et yilushal
Belyu wedase yamesegnushal
Dingil nigstachn beqegnu qomeshal

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht

VERSE 5
Yeselamotash dimts’ libe sisema
Nefse des alat qelele shekmwa
Dingil lekbrsh sinberekek
Ejsh yizerga lemebarek

CHORUS
Ende elsabet’ lamesgnsh
Fitsh wedqe lisalemsh
Yegetaye enat yeegna emebet
Azagn nesh kelb fits’um yewaht',
        updated_at = clock_timestamp()::text
    WHERE import_id = '95d98e8a-6b0c-4d0e-928a-12177bfbd39c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 1
ርኀራኄሽ ያስደንቀኛል
ስለ ኃጢአቴ ምልጃሽ ይቀድማል
የሰላምታሽ ድምፅ ደስ ያሰኘኛል
ከትካዜዬም ያሳርፈኛል

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 2
ድምፅሽ ሲሰማኝ ልቤ ይረካል
ሃዘኔ ቀርቶ ፊቴ ይፈካል
በእናትነት አንቺን ለሰጠን
ቸሩ አምላካችን ይክበር ይመስገን

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 3
የሁሉ እመቤት የሁሉ አጽናኝ
የአበዉ መድኀኒት ከአምላክ አገናኝ
ዛሬም በልቤ ደስታን ጨምረሽ
እንደ ኤልሳቤጥ ሰላም ልበልሽ

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 4
ከሴቶች መካከል መርጦ ቀድሶሻል
ትዉልድ ሁሉ ብፅዕት ይሉሻል
በልዩ ወዳሴ ያመሰግኑሻል
ድንግል ንግሥታችን በቀኙ ቆመሻል

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት

VERSE 5
የሰላሞታሽ ድምፅ ልቤ ሲሰማ
ነፍሴ ደስ አላት ቀለለ ሸክሟ
ድንግል ለክብርሽ ስንበረከክ
እጅሽ ይዘርጋ ለመባረክ

CHORUS
እንደ ኤልሳቤጥ ላመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ እናት የእኛ እመቤት
አዛኝ ነሽ ከልብ ፍጹም የዋህት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '95d98e8a-6b0c-4d0e-928a-12177bfbd39c'::uuid, 'enide-elisabet-lamesiginish', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zik-biye-lamesiginew ("Zik Biye Lamesiginew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'aa777fa1-ba92-4dd9-98d8-2c6c12b02e2c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 1
ምን አገኘ ሰው ይለኛል ፤
ላያኖረኝ ይጨነቃል ።
መኖሪያዬ በሰማይ ፤
አባት አለኝ ኤልሻዳይ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 2
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
ተራመድኩኝ በጉልበቴ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 3
ስላቆመኝ ደጉ አባቴ ።
እሩቅ አይደል ቅርቤ ላለው ፤
ምስጋናዬ ለእርሱ ይድረሰው ።
አባት እና ንጉስ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 4
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
የከበረ የተፈራ ፤
ምሕረት ያለው የሚራራ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 5
ያገኘኝን አይቻለሁ ፤
ሞት አያዬኝ ፊቱ እያለሁ ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 6
ሕይወቴ ነው ክርስቶስ ።
ርህራሄው ስላኖረኝ ፤
ከሰው ድንኳን ሞት ትርፍ አለኝ ።
የእኔስ ጌታ ያስደንቃል ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 7
በልቤ ላይ ቤቱን ሰርቷል ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 8
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 1
Min agegne sew yilegnal ;
Layanoregn yich’eneqal .
Menoriyaye besemay ;
Abat alegn elshaday .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 2
Abat ena nigus ;
Geta Kidus lenebs ;
Hiywete new Kristos .
Teramedkugn begulbete ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 3
Silaqomegn degu abate .
Eruq aydel qirbe lalew ;
Misganaye leersu yidresew .
Abat ena nigus ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 4
Geta Kidus lenebs ;
Hiywete new Kristos .
Yekebere yetefera ;
Mihret yalew yemirara .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 5
Yagegnegnn aychalehu ;
Mot ayayegn fitu eyalehu .
Abat ena nigus ;
Geta Kidus lenebs ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 6
Hiywete new Kristos .
Rihrahew silanoregn ;
Kesew dinkwan mot tirf alegn .
Yeenes Geta yasdenqal ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 7
Belbe lay betun sertwal .
Abat ena nigus ;
Geta Kidus lenebs ;
Hiywete new Kristos .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 8
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 1
ምን አገኘ ሰው ይለኛል ፤
ላያኖረኝ ይጨነቃል ።
መኖሪያዬ በሰማይ ፤
አባት አለኝ ኤልሻዳይ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 2
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
ተራመድኩኝ በጉልበቴ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 3
ስላቆመኝ ደጉ አባቴ ።
እሩቅ አይደል ቅርቤ ላለው ፤
ምስጋናዬ ለእርሱ ይድረሰው ።
አባት እና ንጉስ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 4
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
የከበረ የተፈራ ፤
ምሕረት ያለው የሚራራ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 5
ያገኘኝን አይቻለሁ ፤
ሞት አያዬኝ ፊቱ እያለሁ ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 6
ሕይወቴ ነው ክርስቶስ ።
ርህራሄው ስላኖረኝ ፤
ከሰው ድንኳን ሞት ትርፍ አለኝ ።
የእኔስ ጌታ ያስደንቃል ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 7
በልቤ ላይ ቤቱን ሰርቷል ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 8
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።',
        lyrics_transliteration = 'CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 1
Min agegne sew yilegnal ;
Layanoregn yich’eneqal .
Menoriyaye besemay ;
Abat alegn elshaday .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 2
Abat ena nigus ;
Geta Kidus lenebs ;
Hiywete new Kristos .
Teramedkugn begulbete ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 3
Silaqomegn degu abate .
Eruq aydel qirbe lalew ;
Misganaye leersu yidresew .
Abat ena nigus ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 4
Geta Kidus lenebs ;
Hiywete new Kristos .
Yekebere yetefera ;
Mihret yalew yemirara .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 5
Yagegnegnn aychalehu ;
Mot ayayegn fitu eyalehu .
Abat ena nigus ;
Geta Kidus lenebs ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 6
Hiywete new Kristos .
Rihrahew silanoregn ;
Kesew dinkwan mot tirf alegn .
Yeenes Geta yasdenqal ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 7
Belbe lay betun sertwal .
Abat ena nigus ;
Geta Kidus lenebs ;
Hiywete new Kristos .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 8
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'aa777fa1-ba92-4dd9-98d8-2c6c12b02e2c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 1
ምን አገኘ ሰው ይለኛል ፤
ላያኖረኝ ይጨነቃል ።
መኖሪያዬ በሰማይ ፤
አባት አለኝ ኤልሻዳይ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 2
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
ተራመድኩኝ በጉልበቴ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 3
ስላቆመኝ ደጉ አባቴ ።
እሩቅ አይደል ቅርቤ ላለው ፤
ምስጋናዬ ለእርሱ ይድረሰው ።
አባት እና ንጉስ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 4
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
የከበረ የተፈራ ፤
ምሕረት ያለው የሚራራ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 5
ያገኘኝን አይቻለሁ ፤
ሞት አያዬኝ ፊቱ እያለሁ ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 6
ሕይወቴ ነው ክርስቶስ ።
ርህራሄው ስላኖረኝ ፤
ከሰው ድንኳን ሞት ትርፍ አለኝ ።
የእኔስ ጌታ ያስደንቃል ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 7
በልቤ ላይ ቤቱን ሰርቷል ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 8
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'aa777fa1-ba92-4dd9-98d8-2c6c12b02e2c'::uuid, 'zik-biye-lamesiginew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nafkot ("NAFKOT")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5579d4ac-7343-4aa9-83b1-69968652368a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 1
ምን አሳይሃለሁ ከበደሌ በቀር
ጣትህ እስኪቆስል ታንኳኳለህ አንተ
ሃጥያት ለጠፈራት የመከነች ፍሬ
ተኝቼ እንዳይመስልህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 2
ክፋት ያከረፋው አያስጠጋም ነውሬ(2)
መቼ #ትሄዳለህ
ከዳሰስኸው ቤቴ ተስፋ ማድረግ ትተህ
ካልጎደለ በረት ላንዲት ግልገል ፍቅር ምን አንከራተተህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 3
አትፈልገኝ #ልቅር
ይደብቀኝ ቤቴ ሽፍንፍኑን ታኮ
በሚሰጡ እጆች ፊት ለመቀበል ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 4
አትግለጡኝ ልቅር ይሸሸግ እርቃኔ ጨለማውን ታኮ
በሚምር ልብ ፊት ለይቅርታ ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 5
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ባንዲት ድኩን መቃን ካንተ ለመሰወር እንደማልችል ባውቅም
በእፍረት አደቀቀኝ ምህርትህ ጉልበቱ የድፍረቴን አቅም
ተመልከተኝማ ተመልከተኝ እስቲ ጥፋት እኮ ስም ቢፈልግ ኮርቶ በእኔ በተጠራ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 6
ነውር እኮ ቤት ቢኖረው ሰውነቴ የእርሱ ስፍራ
ሃጥያት እኮ አባት ቢሻ ደም አምጬ በወለድኩት
ክፋት እኮ መልክ ቢሆን ቁርጥ እርሱን በመሰልኩት
በደል እኮ ትግል ቢሻ እኔ እኮ ነኝ ጦር ጉልበቱ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 7
ዝሙት እኮ ውበት ቢሆን መልኬ ነበር ምልክቱ
ደግ አይደለህ ሁሉን ሸፋኝ ምን በገፄ ተገለጠ
መራቆቴ ምህረት አቅፎት በቸር ክንድህ ባመለጠ
እንኳን ልትፈርድ በሸሸግከው በመረሳት ዋጋ ቀለህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 8
እንደገና ለመከዳት ዛሬም በሬን ታለኳኳለህ?
ዛሬም አለህ? #ዛሬም አለህ?
አትለየኝም ወይ!
ምን ምን ፍቅር ቢያስርህ ነው እንዳትጠየፈኝ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 9
የጥፋቴ ፍሬ ካቆሰለኝ በላይ ትዕግስትህ ገረፈኝ
ስፍር አልባ ፍቅርህ ዛሬም ወደ እቅፉ ቢስበኝም ባርኮ
እንደምን ልነሳ በሚምሩ አይኖች ፊት ለመታየት ማነስ ያሳፍራል
እንጂ #ናፍቀኸኛል

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 10
በዕርያዎች መሃል ረሃብ አስተናንሶኝ
በገፋው እጥፍ ውርደት አጎናብሶኝ
በመከራው ጽናት ፍፁም ተንጠፍጥፎ የልጅነት ወዜ
የፍቅርህን እልፍኝ የእቅፍህን መዐዛ ባስታወስኩት ጊዜ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 11
አንገቴን ሰብሬ ላራቡኝ አይኖችህ ቀን ከሌት ባነባም
አባቴ ባንተ ፊት ልጅ ልባል አይገባም
አትቀፈኝ ልቅር የምህረትህ ዜማ ቢጣራኝም ማርኮ
እንደምነወ ልነሳ በንፁህ ልብ ፊት ለመፈቀር ማነስ ያሳፍራል እኮ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 12
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ያውም በጨለማ 99 በግ ምድረ በዳ ትተህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 13
መዋረድ ሳይገድህ ከጌትነት ማዕረግ አንዲት ሃ ጥል ሽተህ
ከመጓዙ ብዛት ባይዝልም አካልህ አቅፎህ እስኪረካ
እንደምን ልቅረብህ ከመልካም አባት ፈለት ለልጅነት ማነስ ያሳፍራል ለካ
እንጂ #ናፍቀኸኛል

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 14
በስምህ መስክ ላይ አጊጦ መታደስ
በምስጋናህ ውበት ዘላለም መቀደስ
በደስታ ወይን ፊት በሃሴት መዋኘት
ከሰካም እቅፍህ በክብር መገኘት

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 15
እንጂ #ናፍቀኸኛል
በጨለማ ቁስል የብቻ አለም ሙሾ ምደረድር እኔ
ቢቸግረኝ እንጂ ልክ አልባ ፍቅርህን የመሸከም ወኔ
እንጂማ እንኳንስ እንደኔ ላለ ነብስ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 16
በርኩሰት በረሻ ስምህን ተጠምቶ
ለክብርህ ምስጋና ከመቅደስ ያደረስ
መች ይጠግባል ጠርቶ
መፅፅናናቴ ሆይ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 17
የልጅነት ልቤን ትዕቢት አስኮብልሎት ከመንገድ ቢቀርም
አንተ ግን አንተ ነህ ፍቅርህ አይቀየርም
በሌት ተንከራተው ከገፋሁት በረት በፍቅር የጠሩኝ
ከፀፀቴ ገዝፈው መማር የቸኮሉት አይኖችህ ሰበሩኝ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 18
በገፋሁት ልኬት በጠፋሁት መጠን እየተከተለ
ላይተወኝን ፍቅር ላይረሳኝን ስስት ከእግሮችህ ተሳለ
በዚህ ሁሉ መጠን መጎንበስ ልብህን ያላደነደነው
በዚህ ሁሉ ልኬት መገፋት ክብርህን ያልተፈታተነው

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 19
በዚዝህ ሁሉ ስሌት መፈለግ ተስፋህን ያላመነመነው
ዛሬም ከበራፌ አምነህ ምታንኳኳኝ
እንዴት #ብትወደኝ #ነው

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 1
Min asayhalehu kebedele beqer
T’ath eskiqosl tankwakwaleh ante
Hat’yat let’eferat yemekenech fire
Tegnche endaymeslh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 2
Kifat yakerefaw ayast’egam newre (2)
Meche #thedaleh
Kedasesኸw bete tesfa madreg titeh
Kalgodele beret landit gilgel fiqr min ankerateteh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 3
Atfelgegn #lqr
Yidebqegn bete shfnfnun tako
Bemiset’u ejoch fit lemeqebel manes yasafral eko
Meche #thedaleh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 4
Atglet’ugn liqr yishesheg erqane ch’elemawn tako
Bemimr lib fit leyqrta manes yasafral eko
Meche #thedaleh
Wede kibrh elfgn maderyayen keseh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 5
Kalgodele beret landit bado gilgel min astenaneseh
Bandit dikun meqan kante lemesewer endemalchl bawqm
Beefret adeqeqegn mihrth gulbetu yedfreten aqm
Temelketegnma temelketegn esti t’fat eko sim bifelg korto beene betet’era

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 6
Newr eko bet binorew sewnete yeersu sifra
Hat’yat eko abat bisha dem amch’e beweledkut
Kifat eko melk bihon qurt’ ersun bemeselkut
Bedel eko tigl bisha ene eko negn t’or gulbetu

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 7
Zimut eko wibet bihon melke neber milktu
Deg aydeleh hulun shefagn min begets’e tegelet’e
Meraqote mihret aqfot becher kindh bamelet’e
Enkwan litferd besheshegkew bemeresat waga qeleh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 8
Endegena lemekedat zarem beren talekwakwaleh?
Zarem aleh? #zarem aleh?
Atleyegnm wey!
Min min fiqr biyasrh new endatt’eyefegn

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 9
Yet’fate fire kaqoselegn belay tiegsth gerefegn
Sifr alba fiqrh zarem wede eqfu bisbegnm barko
Endemn linesa bemimru aynoch fit lemetayet manes yasafral
Enji #nafqeኸgnal

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 10
Beeryawoch mehal rehab astenansogn
Begefaw et’f wirdet agonabsogn
Bemekeraw ts’nat fits’um tent’eft’fo yeljnet weze
Yefqrhn elfgn yeeqfhn meaza bastaweskut gize

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 11
Angeten sebre larabugn aynochh qen kelet banebam
Abate bante fit lij libal aygebam
Atqefegn liqr yemhreth zema bit’aragnm marko
Endemnewe linesa bents’uh lib fit lemefeqer manes yasafral eko

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 12
Meche #thedaleh
Wede kibrh elfgn maderyayen keseh
Kalgodele beret landit bado gilgel min astenaneseh
Yawm bech’elema 99 beg midre beda titeh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 13
Mewared saygedh kegetnet maereg andit ha t’l shteh
Kemegwazu bizat bayzlm akalh aqfoh eskireka
Endemn liqrebh kemelkam abat felet leljnet manes yasafral leka
Enji #nafqeኸgnal

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 14
Besmh mesk lay agit’o metades
Bemsganah wibet zelalem meqedes
Bedesta weyn fit behaset mewagnet
Kesekam eqfh bekbr megegnet

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 15
Enji #nafqeኸgnal
Bech’elema qusl yebcha alem musho mideredr ene
Bichegregn enji lik alba fiqrhn yemeshekem wene
Enjima enkwans endene lale nebs

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 16
Berkuset beresha simhn tet’emto
Lekbrh misgana kemeqdes yaderes
Mech yit’egbal t’erto
Mets’ts’nanate hoy

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 17
Yeljnet liben tiebit askobllot kemenged biqerm
Ante gin ante neh fiqrh ayqeyerm
Belet tenkeratew kegefahut beret befqr yet’erugn
Kets’ets’ete gezfew memar yechekolut aynochh seberugn

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 18
Begefahut liket bet’efahut met’en eyeteketele
Laytewegnn fiqr layresagnn sist keegrochh tesale
Bezih hulu met’en megonbes libhn yaladenedenew
Bezih hulu liket megefat kibrhn yaltefetatenew

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 19
Bezizh hulu silet mefeleg tesfahn yalamenemenew
Zarem keberafe amneh mitankwakwagn
Endet #btwedegn #new

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 1
ምን አሳይሃለሁ ከበደሌ በቀር
ጣትህ እስኪቆስል ታንኳኳለህ አንተ
ሃጥያት ለጠፈራት የመከነች ፍሬ
ተኝቼ እንዳይመስልህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 2
ክፋት ያከረፋው አያስጠጋም ነውሬ(2)
መቼ #ትሄዳለህ
ከዳሰስኸው ቤቴ ተስፋ ማድረግ ትተህ
ካልጎደለ በረት ላንዲት ግልገል ፍቅር ምን አንከራተተህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 3
አትፈልገኝ #ልቅር
ይደብቀኝ ቤቴ ሽፍንፍኑን ታኮ
በሚሰጡ እጆች ፊት ለመቀበል ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 4
አትግለጡኝ ልቅር ይሸሸግ እርቃኔ ጨለማውን ታኮ
በሚምር ልብ ፊት ለይቅርታ ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 5
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ባንዲት ድኩን መቃን ካንተ ለመሰወር እንደማልችል ባውቅም
በእፍረት አደቀቀኝ ምህርትህ ጉልበቱ የድፍረቴን አቅም
ተመልከተኝማ ተመልከተኝ እስቲ ጥፋት እኮ ስም ቢፈልግ ኮርቶ በእኔ በተጠራ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 6
ነውር እኮ ቤት ቢኖረው ሰውነቴ የእርሱ ስፍራ
ሃጥያት እኮ አባት ቢሻ ደም አምጬ በወለድኩት
ክፋት እኮ መልክ ቢሆን ቁርጥ እርሱን በመሰልኩት
በደል እኮ ትግል ቢሻ እኔ እኮ ነኝ ጦር ጉልበቱ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 7
ዝሙት እኮ ውበት ቢሆን መልኬ ነበር ምልክቱ
ደግ አይደለህ ሁሉን ሸፋኝ ምን በገፄ ተገለጠ
መራቆቴ ምህረት አቅፎት በቸር ክንድህ ባመለጠ
እንኳን ልትፈርድ በሸሸግከው በመረሳት ዋጋ ቀለህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 8
እንደገና ለመከዳት ዛሬም በሬን ታለኳኳለህ?
ዛሬም አለህ? #ዛሬም አለህ?
አትለየኝም ወይ!
ምን ምን ፍቅር ቢያስርህ ነው እንዳትጠየፈኝ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 9
የጥፋቴ ፍሬ ካቆሰለኝ በላይ ትዕግስትህ ገረፈኝ
ስፍር አልባ ፍቅርህ ዛሬም ወደ እቅፉ ቢስበኝም ባርኮ
እንደምን ልነሳ በሚምሩ አይኖች ፊት ለመታየት ማነስ ያሳፍራል
እንጂ #ናፍቀኸኛል

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 10
በዕርያዎች መሃል ረሃብ አስተናንሶኝ
በገፋው እጥፍ ውርደት አጎናብሶኝ
በመከራው ጽናት ፍፁም ተንጠፍጥፎ የልጅነት ወዜ
የፍቅርህን እልፍኝ የእቅፍህን መዐዛ ባስታወስኩት ጊዜ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 11
አንገቴን ሰብሬ ላራቡኝ አይኖችህ ቀን ከሌት ባነባም
አባቴ ባንተ ፊት ልጅ ልባል አይገባም
አትቀፈኝ ልቅር የምህረትህ ዜማ ቢጣራኝም ማርኮ
እንደምነወ ልነሳ በንፁህ ልብ ፊት ለመፈቀር ማነስ ያሳፍራል እኮ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 12
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ያውም በጨለማ 99 በግ ምድረ በዳ ትተህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 13
መዋረድ ሳይገድህ ከጌትነት ማዕረግ አንዲት ሃ ጥል ሽተህ
ከመጓዙ ብዛት ባይዝልም አካልህ አቅፎህ እስኪረካ
እንደምን ልቅረብህ ከመልካም አባት ፈለት ለልጅነት ማነስ ያሳፍራል ለካ
እንጂ #ናፍቀኸኛል

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 14
በስምህ መስክ ላይ አጊጦ መታደስ
በምስጋናህ ውበት ዘላለም መቀደስ
በደስታ ወይን ፊት በሃሴት መዋኘት
ከሰካም እቅፍህ በክብር መገኘት

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 15
እንጂ #ናፍቀኸኛል
በጨለማ ቁስል የብቻ አለም ሙሾ ምደረድር እኔ
ቢቸግረኝ እንጂ ልክ አልባ ፍቅርህን የመሸከም ወኔ
እንጂማ እንኳንስ እንደኔ ላለ ነብስ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 16
በርኩሰት በረሻ ስምህን ተጠምቶ
ለክብርህ ምስጋና ከመቅደስ ያደረስ
መች ይጠግባል ጠርቶ
መፅፅናናቴ ሆይ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 17
የልጅነት ልቤን ትዕቢት አስኮብልሎት ከመንገድ ቢቀርም
አንተ ግን አንተ ነህ ፍቅርህ አይቀየርም
በሌት ተንከራተው ከገፋሁት በረት በፍቅር የጠሩኝ
ከፀፀቴ ገዝፈው መማር የቸኮሉት አይኖችህ ሰበሩኝ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 18
በገፋሁት ልኬት በጠፋሁት መጠን እየተከተለ
ላይተወኝን ፍቅር ላይረሳኝን ስስት ከእግሮችህ ተሳለ
በዚህ ሁሉ መጠን መጎንበስ ልብህን ያላደነደነው
በዚህ ሁሉ ልኬት መገፋት ክብርህን ያልተፈታተነው

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 19
በዚዝህ ሁሉ ስሌት መፈለግ ተስፋህን ያላመነመነው
ዛሬም ከበራፌ አምነህ ምታንኳኳኝ
እንዴት #ብትወደኝ #ነው

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ',
        lyrics_transliteration = 'CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 1
Min asayhalehu kebedele beqer
T’ath eskiqosl tankwakwaleh ante
Hat’yat let’eferat yemekenech fire
Tegnche endaymeslh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 2
Kifat yakerefaw ayast’egam newre (2)
Meche #thedaleh
Kedasesኸw bete tesfa madreg titeh
Kalgodele beret landit gilgel fiqr min ankerateteh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 3
Atfelgegn #lqr
Yidebqegn bete shfnfnun tako
Bemiset’u ejoch fit lemeqebel manes yasafral eko
Meche #thedaleh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 4
Atglet’ugn liqr yishesheg erqane ch’elemawn tako
Bemimr lib fit leyqrta manes yasafral eko
Meche #thedaleh
Wede kibrh elfgn maderyayen keseh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 5
Kalgodele beret landit bado gilgel min astenaneseh
Bandit dikun meqan kante lemesewer endemalchl bawqm
Beefret adeqeqegn mihrth gulbetu yedfreten aqm
Temelketegnma temelketegn esti t’fat eko sim bifelg korto beene betet’era

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 6
Newr eko bet binorew sewnete yeersu sifra
Hat’yat eko abat bisha dem amch’e beweledkut
Kifat eko melk bihon qurt’ ersun bemeselkut
Bedel eko tigl bisha ene eko negn t’or gulbetu

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 7
Zimut eko wibet bihon melke neber milktu
Deg aydeleh hulun shefagn min begets’e tegelet’e
Meraqote mihret aqfot becher kindh bamelet’e
Enkwan litferd besheshegkew bemeresat waga qeleh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 8
Endegena lemekedat zarem beren talekwakwaleh?
Zarem aleh? #zarem aleh?
Atleyegnm wey!
Min min fiqr biyasrh new endatt’eyefegn

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 9
Yet’fate fire kaqoselegn belay tiegsth gerefegn
Sifr alba fiqrh zarem wede eqfu bisbegnm barko
Endemn linesa bemimru aynoch fit lemetayet manes yasafral
Enji #nafqeኸgnal

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 10
Beeryawoch mehal rehab astenansogn
Begefaw et’f wirdet agonabsogn
Bemekeraw ts’nat fits’um tent’eft’fo yeljnet weze
Yefqrhn elfgn yeeqfhn meaza bastaweskut gize

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 11
Angeten sebre larabugn aynochh qen kelet banebam
Abate bante fit lij libal aygebam
Atqefegn liqr yemhreth zema bit’aragnm marko
Endemnewe linesa bents’uh lib fit lemefeqer manes yasafral eko

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 12
Meche #thedaleh
Wede kibrh elfgn maderyayen keseh
Kalgodele beret landit bado gilgel min astenaneseh
Yawm bech’elema 99 beg midre beda titeh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 13
Mewared saygedh kegetnet maereg andit ha t’l shteh
Kemegwazu bizat bayzlm akalh aqfoh eskireka
Endemn liqrebh kemelkam abat felet leljnet manes yasafral leka
Enji #nafqeኸgnal

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 14
Besmh mesk lay agit’o metades
Bemsganah wibet zelalem meqedes
Bedesta weyn fit behaset mewagnet
Kesekam eqfh bekbr megegnet

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 15
Enji #nafqeኸgnal
Bech’elema qusl yebcha alem musho mideredr ene
Bichegregn enji lik alba fiqrhn yemeshekem wene
Enjima enkwans endene lale nebs

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 16
Berkuset beresha simhn tet’emto
Lekbrh misgana kemeqdes yaderes
Mech yit’egbal t’erto
Mets’ts’nanate hoy

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 17
Yeljnet liben tiebit askobllot kemenged biqerm
Ante gin ante neh fiqrh ayqeyerm
Belet tenkeratew kegefahut beret befqr yet’erugn
Kets’ets’ete gezfew memar yechekolut aynochh seberugn

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 18
Begefahut liket bet’efahut met’en eyeteketele
Laytewegnn fiqr layresagnn sist keegrochh tesale
Bezih hulu met’en megonbes libhn yaladenedenew
Bezih hulu liket megefat kibrhn yaltefetatenew

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 19
Bezizh hulu silet mefeleg tesfahn yalamenemenew
Zarem keberafe amneh mitankwakwagn
Endet #btwedegn #new

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5579d4ac-7343-4aa9-83b1-69968652368a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 1
ምን አሳይሃለሁ ከበደሌ በቀር
ጣትህ እስኪቆስል ታንኳኳለህ አንተ
ሃጥያት ለጠፈራት የመከነች ፍሬ
ተኝቼ እንዳይመስልህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 2
ክፋት ያከረፋው አያስጠጋም ነውሬ(2)
መቼ #ትሄዳለህ
ከዳሰስኸው ቤቴ ተስፋ ማድረግ ትተህ
ካልጎደለ በረት ላንዲት ግልገል ፍቅር ምን አንከራተተህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 3
አትፈልገኝ #ልቅር
ይደብቀኝ ቤቴ ሽፍንፍኑን ታኮ
በሚሰጡ እጆች ፊት ለመቀበል ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 4
አትግለጡኝ ልቅር ይሸሸግ እርቃኔ ጨለማውን ታኮ
በሚምር ልብ ፊት ለይቅርታ ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 5
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ባንዲት ድኩን መቃን ካንተ ለመሰወር እንደማልችል ባውቅም
በእፍረት አደቀቀኝ ምህርትህ ጉልበቱ የድፍረቴን አቅም
ተመልከተኝማ ተመልከተኝ እስቲ ጥፋት እኮ ስም ቢፈልግ ኮርቶ በእኔ በተጠራ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 6
ነውር እኮ ቤት ቢኖረው ሰውነቴ የእርሱ ስፍራ
ሃጥያት እኮ አባት ቢሻ ደም አምጬ በወለድኩት
ክፋት እኮ መልክ ቢሆን ቁርጥ እርሱን በመሰልኩት
በደል እኮ ትግል ቢሻ እኔ እኮ ነኝ ጦር ጉልበቱ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 7
ዝሙት እኮ ውበት ቢሆን መልኬ ነበር ምልክቱ
ደግ አይደለህ ሁሉን ሸፋኝ ምን በገፄ ተገለጠ
መራቆቴ ምህረት አቅፎት በቸር ክንድህ ባመለጠ
እንኳን ልትፈርድ በሸሸግከው በመረሳት ዋጋ ቀለህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 8
እንደገና ለመከዳት ዛሬም በሬን ታለኳኳለህ?
ዛሬም አለህ? #ዛሬም አለህ?
አትለየኝም ወይ!
ምን ምን ፍቅር ቢያስርህ ነው እንዳትጠየፈኝ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 9
የጥፋቴ ፍሬ ካቆሰለኝ በላይ ትዕግስትህ ገረፈኝ
ስፍር አልባ ፍቅርህ ዛሬም ወደ እቅፉ ቢስበኝም ባርኮ
እንደምን ልነሳ በሚምሩ አይኖች ፊት ለመታየት ማነስ ያሳፍራል
እንጂ #ናፍቀኸኛል

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 10
በዕርያዎች መሃል ረሃብ አስተናንሶኝ
በገፋው እጥፍ ውርደት አጎናብሶኝ
በመከራው ጽናት ፍፁም ተንጠፍጥፎ የልጅነት ወዜ
የፍቅርህን እልፍኝ የእቅፍህን መዐዛ ባስታወስኩት ጊዜ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 11
አንገቴን ሰብሬ ላራቡኝ አይኖችህ ቀን ከሌት ባነባም
አባቴ ባንተ ፊት ልጅ ልባል አይገባም
አትቀፈኝ ልቅር የምህረትህ ዜማ ቢጣራኝም ማርኮ
እንደምነወ ልነሳ በንፁህ ልብ ፊት ለመፈቀር ማነስ ያሳፍራል እኮ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 12
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ያውም በጨለማ 99 በግ ምድረ በዳ ትተህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 13
መዋረድ ሳይገድህ ከጌትነት ማዕረግ አንዲት ሃ ጥል ሽተህ
ከመጓዙ ብዛት ባይዝልም አካልህ አቅፎህ እስኪረካ
እንደምን ልቅረብህ ከመልካም አባት ፈለት ለልጅነት ማነስ ያሳፍራል ለካ
እንጂ #ናፍቀኸኛል

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 14
በስምህ መስክ ላይ አጊጦ መታደስ
በምስጋናህ ውበት ዘላለም መቀደስ
በደስታ ወይን ፊት በሃሴት መዋኘት
ከሰካም እቅፍህ በክብር መገኘት

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 15
እንጂ #ናፍቀኸኛል
በጨለማ ቁስል የብቻ አለም ሙሾ ምደረድር እኔ
ቢቸግረኝ እንጂ ልክ አልባ ፍቅርህን የመሸከም ወኔ
እንጂማ እንኳንስ እንደኔ ላለ ነብስ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 16
በርኩሰት በረሻ ስምህን ተጠምቶ
ለክብርህ ምስጋና ከመቅደስ ያደረስ
መች ይጠግባል ጠርቶ
መፅፅናናቴ ሆይ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 17
የልጅነት ልቤን ትዕቢት አስኮብልሎት ከመንገድ ቢቀርም
አንተ ግን አንተ ነህ ፍቅርህ አይቀየርም
በሌት ተንከራተው ከገፋሁት በረት በፍቅር የጠሩኝ
ከፀፀቴ ገዝፈው መማር የቸኮሉት አይኖችህ ሰበሩኝ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 18
በገፋሁት ልኬት በጠፋሁት መጠን እየተከተለ
ላይተወኝን ፍቅር ላይረሳኝን ስስት ከእግሮችህ ተሳለ
በዚህ ሁሉ መጠን መጎንበስ ልብህን ያላደነደነው
በዚህ ሁሉ ልኬት መገፋት ክብርህን ያልተፈታተነው

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 19
በዚዝህ ሁሉ ስሌት መፈለግ ተስፋህን ያላመነመነው
ዛሬም ከበራፌ አምነህ ምታንኳኳኝ
እንዴት #ብትወደኝ #ነው

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5579d4ac-7343-4aa9-83b1-69968652368a'::uuid, 'nafkot', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emebete-mariyam-emebete ("Emebete Mariyam Emebete")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ff4897b7-a347-4209-bb82-beeb8e33e4c9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 1
ሁሉንም የሚችል ያለ በአርያም
የአምላክ ማደሪያ ድንግል ማርያም
ጌታ የመረጠሽ እስከ ዘላለም /2/
ላንቺ ሊያስተላልፍ ገብርኤል ሰላሞታ

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 2
ከንጉሥ ተልኮ ከሠራዊት ጌታ
ሰላም ላንቺ ይሁን ብሎ ያበሠረሽ
እመቤቴ ማርያም ምስጋና ይድረስሽ /2/
የምድር ባለጸጎች ሲማልሉ ፊትሽ

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 3
የሰማይ መላእክት ምስጋና ያቅርቡልሽ
አሕዛብ ይንበርከኩ ለኃያሉ ልጅሽ
ክብር ይገባሻል በእናትነትሽ /2/

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 1
Hulunm yemichl yale bearyam
Yeamlak maderiya Dingil Maryam
Geta yemeret’esh eske zelalem (2)
Lanchi liyastelalf Gebriel selamota

CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 2
Kengus telko keserawit Geta
Selam lanchi yihun bilo yabeseresh
Emebete Maryam misgana yidressh (2)
Yemdr balets’egoch simallu fitsh

CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 3
Yesemay melaekt misgana yaqrbulsh
Ahzab yinberkeku lehayalu lijsh
Kibir yigebashal beenatnetsh (2)

CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 1
ሁሉንም የሚችል ያለ በአርያም
የአምላክ ማደሪያ ድንግል ማርያም
ጌታ የመረጠሽ እስከ ዘላለም /2/
ላንቺ ሊያስተላልፍ ገብርኤል ሰላሞታ

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 2
ከንጉሥ ተልኮ ከሠራዊት ጌታ
ሰላም ላንቺ ይሁን ብሎ ያበሠረሽ
እመቤቴ ማርያም ምስጋና ይድረስሽ /2/
የምድር ባለጸጎች ሲማልሉ ፊትሽ

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 3
የሰማይ መላእክት ምስጋና ያቅርቡልሽ
አሕዛብ ይንበርከኩ ለኃያሉ ልጅሽ
ክብር ይገባሻል በእናትነትሽ /2/

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም',
        lyrics_transliteration = 'CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 1
Hulunm yemichl yale bearyam
Yeamlak maderiya Dingil Maryam
Geta yemeret’esh eske zelalem (2)
Lanchi liyastelalf Gebriel selamota

CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 2
Kengus telko keserawit Geta
Selam lanchi yihun bilo yabeseresh
Emebete Maryam misgana yidressh (2)
Yemdr balets’egoch simallu fitsh

CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam

VERSE 3
Yesemay melaekt misgana yaqrbulsh
Ahzab yinberkeku lehayalu lijsh
Kibir yigebashal beenatnetsh (2)

CHORUS
Emebete Maryam Emebete (2)
Kanchi tewelede yeserawit Geta
Emebete Maryam yidressh selamota (2)
Hiywetun yeset’e fits’um leselam',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ff4897b7-a347-4209-bb82-beeb8e33e4c9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 1
ሁሉንም የሚችል ያለ በአርያም
የአምላክ ማደሪያ ድንግል ማርያም
ጌታ የመረጠሽ እስከ ዘላለም /2/
ላንቺ ሊያስተላልፍ ገብርኤል ሰላሞታ

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 2
ከንጉሥ ተልኮ ከሠራዊት ጌታ
ሰላም ላንቺ ይሁን ብሎ ያበሠረሽ
እመቤቴ ማርያም ምስጋና ይድረስሽ /2/
የምድር ባለጸጎች ሲማልሉ ፊትሽ

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም

VERSE 3
የሰማይ መላእክት ምስጋና ያቅርቡልሽ
አሕዛብ ይንበርከኩ ለኃያሉ ልጅሽ
ክብር ይገባሻል በእናትነትሽ /2/

CHORUS
እመቤቴ ማርያም እመቤቴ /2/
ካንቺ ተወለደ የሠራዊት ጌታ
እመቤቴ ማርያም ይድረስሽ ሰላሞታ /2/
ሕይወቱን የሠጠ ፍጹም ለሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ff4897b7-a347-4209-bb82-beeb8e33e4c9'::uuid, 'emebete-mariyam-emebete', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- girum-dink-neh-zemari-diacon-dawit-tilahun ("girum dink neh zemari diacon dawit tilahun")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '26592f12-88c9-4a6d-8556-44c3144eb931'::uuid
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
    WHERE import_id = '26592f12-88c9-4a6d-8556-44c3144eb931'::uuid
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
        '26592f12-88c9-4a6d-8556-44c3144eb931'::uuid, 'girum-dink-neh-zemari-diacon-dawit-tilahun', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- atual-godlobetal-by-zemari-d-n-begna-girma-ortodox-mezmur ("Atual Godlobetal by Zemari D/n Begna Girma ortodox mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '72da54d9-db3d-4cb9-9b92-16bcd6cfeeeb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 1
ሃዘን ጽልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ጸና ልቤ በእግዚአብሔር ይህን እያወቀ

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ሥራህን ስናገር

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነ ኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አረከኝ አንተ ሰው አትጥልም

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ ከዚም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለ ሥምህ መነቀፌ ክብሬ ነው ማዕረጌ
በምን መንገድ ላስደስትህ እንደምን አድርጌ

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 1
Hazen ts’lmet kifu zemen biget’megnm enkwa
Yalfal hulum tarik hono befith sileka
Man afere man godele anten yet’ebeqe
Ts’ena libe beEgziabher yihn eyaweqe

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 2
Bealem sifra baynoregnm bihonm gosqwala
Amlake hoy kante beqer alhed wede lela
Getaye hoy beflegah wet’ahu kemeqabr
Simesekr enoralehu sirahn sinager

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 3
Qen lekteh gizen ayteh sewn yematkeda
Yaleweret timet’aleh enen litreda
Kene elyab wendmoche balstekakelm
Mama honeh kef arekegn ante sew att’lm

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 4
Ende enat lij endalqot’rh kezim tibelt’aleh
Kante beqer yafeqeregn bemdr silelele
Sile simh meneqefe kibre new maerege
Bemn menged lasdesth endemn adrge

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 1
ሃዘን ጽልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ጸና ልቤ በእግዚአብሔር ይህን እያወቀ

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ሥራህን ስናገር

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነ ኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አረከኝ አንተ ሰው አትጥልም

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ ከዚም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለ ሥምህ መነቀፌ ክብሬ ነው ማዕረጌ
በምን መንገድ ላስደስትህ እንደምን አድርጌ

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ',
        lyrics_transliteration = 'CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 1
Hazen ts’lmet kifu zemen biget’megnm enkwa
Yalfal hulum tarik hono befith sileka
Man afere man godele anten yet’ebeqe
Ts’ena libe beEgziabher yihn eyaweqe

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 2
Bealem sifra baynoregnm bihonm gosqwala
Amlake hoy kante beqer alhed wede lela
Getaye hoy beflegah wet’ahu kemeqabr
Simesekr enoralehu sirahn sinager

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 3
Qen lekteh gizen ayteh sewn yematkeda
Yaleweret timet’aleh enen litreda
Kene elyab wendmoche balstekakelm
Mama honeh kef arekegn ante sew att’lm

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 4
Ende enat lij endalqot’rh kezim tibelt’aleh
Kante beqer yafeqeregn bemdr silelele
Sile simh meneqefe kibre new maerege
Bemn menged lasdesth endemn adrge

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '72da54d9-db3d-4cb9-9b92-16bcd6cfeeeb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 1
ሃዘን ጽልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ጸና ልቤ በእግዚአብሔር ይህን እያወቀ

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ሥራህን ስናገር

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነ ኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አረከኝ አንተ ሰው አትጥልም

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ ከዚም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለ ሥምህ መነቀፌ ክብሬ ነው ማዕረጌ
በምን መንገድ ላስደስትህ እንደምን አድርጌ

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '72da54d9-db3d-4cb9-9b92-16bcd6cfeeeb'::uuid, 'atual-godlobetal-by-zemari-d-n-begna-girma-ortodox-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yasichenekegn-ale-fichiwu ("Yasichenekegn Ale Fichiwu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0522a949-8d46-49ca-9de6-9e7fd34a7612'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 1
ያስጨነቀኝ አለ ፍችው
የከበደኝ አለ ፍችው(2)

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 2
በኔ አቅም የሚፈታ አይለም
ባንች ምልጃ አገኛለሁ ሰላም
ያሰረኝን እናቴ ፍችልኝ
ፈተናውን ቀለል አድርጊልኝ

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 3
ማን አለኝ ሌላ የምቀርበው
የውስጤን ብሶት የምነግረው
ከናትስ በላይ ማን ይረዳል
ስነግርሽ ድንግል ይቀለኛል

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 4
ልመናውን አሳስቢልኝ ላለሽ
አዛኝቷ ምራገ ፀሎት ነሽ
የለምና ካንች የሚደበቅ
ታውቂለሽ የልቤን መጨነቅ

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 5
ማን አለኝ,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 6
መሰወሪያ መጠጊያ ታዛዬ
የወጣብሽ አዳኘ ቤዛዬ
ወደቤ ነሽ የረፍቴ ከተማ
የማልፍብሽ የጭንቁን ጨለማ

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 7
ማን አለኝ ,,,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 8
መደገፊያ የሲና ሀመልማል
የደረቀው በአንቺ ይለመልማል
እፎይ ልበል መልሽው ሰላሜን
ብርታት ስጭኝ አይተሽ መዳከሜን

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 9
ማን አለኝ ,,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 10
መሰላሌ ከጥልቁ መውጫዬ
ድንግል ማርያም ቀስቱን ማለፊያዬ
ንግስቲቱ በአብ ቀኝ የቆምሽው
መልስ አሰጭኝ ለልጅሽ ነግረሽው

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 11
ማን አለኝ,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 1
Yasch’eneqegn ale fichw
Yekebedegn ale fichw (2)

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 2
Bene aqm yemifeta aylem
Banch milja agegnalehu selam
Yaseregnn enate fichlgn
Fetenawn qelel adrgilgn

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 3
Man alegn lela yemqerbew
Yewst’en bisot yemnegrew
Kenats belay man yiredal
Sinegrsh Dingil yiqelegnal

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 4
Limenawn asasbilgn lalesh
Azagntwa mirage ts’elot nesh
Yelemna kanch yemidebeq
Tawqilesh yelben mech’eneq

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 5
Man alegn,,,,,,,

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 6
Meseweriya met’egiya tazaye
Yewet’absh adagne bezaye
Wedebe nesh yerefte ketema
Yemalfbsh yech’nqun ch’elema

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 7
Man alegn ,,,,,,,,,

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 8
Medegefiya yesina hemelmal
Yedereqew beanchi yilemelmal
Efoy libel melshw selamen
Birtat sich’gn aytesh medakemen

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 9
Man alegn ,,,,,,,,

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 10
Meselale ket’lqu mewch’aye
Dingil Maryam qestun malefiyaye
Nigstitu beab qegn yeqomshw
Mels asech’gn leljsh negreshw

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 11
Man alegn,,,,,,,

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 1
ያስጨነቀኝ አለ ፍችው
የከበደኝ አለ ፍችው(2)

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 2
በኔ አቅም የሚፈታ አይለም
ባንች ምልጃ አገኛለሁ ሰላም
ያሰረኝን እናቴ ፍችልኝ
ፈተናውን ቀለል አድርጊልኝ

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 3
ማን አለኝ ሌላ የምቀርበው
የውስጤን ብሶት የምነግረው
ከናትስ በላይ ማን ይረዳል
ስነግርሽ ድንግል ይቀለኛል

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 4
ልመናውን አሳስቢልኝ ላለሽ
አዛኝቷ ምራገ ፀሎት ነሽ
የለምና ካንች የሚደበቅ
ታውቂለሽ የልቤን መጨነቅ

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 5
ማን አለኝ,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 6
መሰወሪያ መጠጊያ ታዛዬ
የወጣብሽ አዳኘ ቤዛዬ
ወደቤ ነሽ የረፍቴ ከተማ
የማልፍብሽ የጭንቁን ጨለማ

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 7
ማን አለኝ ,,,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 8
መደገፊያ የሲና ሀመልማል
የደረቀው በአንቺ ይለመልማል
እፎይ ልበል መልሽው ሰላሜን
ብርታት ስጭኝ አይተሽ መዳከሜን

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 9
ማን አለኝ ,,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 10
መሰላሌ ከጥልቁ መውጫዬ
ድንግል ማርያም ቀስቱን ማለፊያዬ
ንግስቲቱ በአብ ቀኝ የቆምሽው
መልስ አሰጭኝ ለልጅሽ ነግረሽው

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 11
ማን አለኝ,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው',
        lyrics_transliteration = 'CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 1
Yasch’eneqegn ale fichw
Yekebedegn ale fichw (2)

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 2
Bene aqm yemifeta aylem
Banch milja agegnalehu selam
Yaseregnn enate fichlgn
Fetenawn qelel adrgilgn

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 3
Man alegn lela yemqerbew
Yewst’en bisot yemnegrew
Kenats belay man yiredal
Sinegrsh Dingil yiqelegnal

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 4
Limenawn asasbilgn lalesh
Azagntwa mirage ts’elot nesh
Yelemna kanch yemidebeq
Tawqilesh yelben mech’eneq

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 5
Man alegn,,,,,,,

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 6
Meseweriya met’egiya tazaye
Yewet’absh adagne bezaye
Wedebe nesh yerefte ketema
Yemalfbsh yech’nqun ch’elema

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 7
Man alegn ,,,,,,,,,

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 8
Medegefiya yesina hemelmal
Yedereqew beanchi yilemelmal
Efoy libel melshw selamen
Birtat sich’gn aytesh medakemen

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 9
Man alegn ,,,,,,,,

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 10
Meselale ket’lqu mewch’aye
Dingil Maryam qestun malefiyaye
Nigstitu beab qegn yeqomshw
Mels asech’gn leljsh negreshw

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 11
Man alegn,,,,,,,

CHORUS
Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0522a949-8d46-49ca-9de6-9e7fd34a7612'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 1
ያስጨነቀኝ አለ ፍችው
የከበደኝ አለ ፍችው(2)

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 2
በኔ አቅም የሚፈታ አይለም
ባንች ምልጃ አገኛለሁ ሰላም
ያሰረኝን እናቴ ፍችልኝ
ፈተናውን ቀለል አድርጊልኝ

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 3
ማን አለኝ ሌላ የምቀርበው
የውስጤን ብሶት የምነግረው
ከናትስ በላይ ማን ይረዳል
ስነግርሽ ድንግል ይቀለኛል

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 4
ልመናውን አሳስቢልኝ ላለሽ
አዛኝቷ ምራገ ፀሎት ነሽ
የለምና ካንች የሚደበቅ
ታውቂለሽ የልቤን መጨነቅ

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 5
ማን አለኝ,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 6
መሰወሪያ መጠጊያ ታዛዬ
የወጣብሽ አዳኘ ቤዛዬ
ወደቤ ነሽ የረፍቴ ከተማ
የማልፍብሽ የጭንቁን ጨለማ

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 7
ማን አለኝ ,,,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 8
መደገፊያ የሲና ሀመልማል
የደረቀው በአንቺ ይለመልማል
እፎይ ልበል መልሽው ሰላሜን
ብርታት ስጭኝ አይተሽ መዳከሜን

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 9
ማን አለኝ ,,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 10
መሰላሌ ከጥልቁ መውጫዬ
ድንግል ማርያም ቀስቱን ማለፊያዬ
ንግስቲቱ በአብ ቀኝ የቆምሽው
መልስ አሰጭኝ ለልጅሽ ነግረሽው

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 11
ማን አለኝ,,,,,,,

CHORUS
አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0522a949-8d46-49ca-9de6-9e7fd34a7612'::uuid, 'yasichenekegn-ale-fichiwu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- silechemerkilgn-edme ("silechemerkilgn edme")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f8f669bd-7df5-4c29-93c1-899fbd44244e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 1
በሰዉ ፊት ልናገር አፍ የፈታሁብህ
እንደበት ሆነኼኝ ቆምያለሁ ለቅኔ
ንገሥ በሕይወቴ ያንተ ነዉ ዘመኔ(2)
በዓላማ ሠራኸኝ ስምህን ልቀድስ

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 2
ለይተህ ከፍጥረት ክብርህን እንድወርስ
ያስታጠቀኝ ስምህነዉ መታወቂያየዬ
አታናዉጸኝ ከዚህ እስክቋጭ እድሜዬ(2)አ
ከዘመርኩት በላይ እንድኖር ስዘምር

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 3
ጣፋጩን ሕግህን በልቤ ላይ አኑር
ከእከዛሬዉ በላይ ልኑር ሳገለግል
ፍቅር ነህና አንተ ይዘህ የማትጥል(2)
የሞት መልዐክ ቢቆም እያንኳኳ በሬን

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 4
ተጨምሮልኛል በእድሜዬ ላይ ዛሬን
እድል የሠጠኸኝ በማምሻ ዘመኔ
ምስክርህ የሆንኩ ሕዝቅያስ ነኝ እኔ(2)

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 1
Besewu fit linager af yefetahubh
Endebet honeኼgn qomyalehu leqne
Niges behywete yante newu zemene (2)
Bealama seraኸgn simhn liqeds

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 2
Leyteh keft’ret kibrhn endwers
Yastat’eqegn simhnewu metaweqiyayeye
Atanawuts’egn kezih eskqwach’ edmeye (2)a
Kezemerkut belay endnor sizemr

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 3
T’afach’un highn belbe lay anur
Keekezarewu belay linur sagelegl
Fiqr nehna ante yizeh yematt’l (2)
Yemot melak biqom eyankwakwa beren

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 4
Tech’emrolgnal beedmeye lay zaren
Edl yeset’eኸgn bemamsha zemene
Miskrh yehonku hizqyas negn ene (2)

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 1
በሰዉ ፊት ልናገር አፍ የፈታሁብህ
እንደበት ሆነኼኝ ቆምያለሁ ለቅኔ
ንገሥ በሕይወቴ ያንተ ነዉ ዘመኔ(2)
በዓላማ ሠራኸኝ ስምህን ልቀድስ

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 2
ለይተህ ከፍጥረት ክብርህን እንድወርስ
ያስታጠቀኝ ስምህነዉ መታወቂያየዬ
አታናዉጸኝ ከዚህ እስክቋጭ እድሜዬ(2)አ
ከዘመርኩት በላይ እንድኖር ስዘምር

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 3
ጣፋጩን ሕግህን በልቤ ላይ አኑር
ከእከዛሬዉ በላይ ልኑር ሳገለግል
ፍቅር ነህና አንተ ይዘህ የማትጥል(2)
የሞት መልዐክ ቢቆም እያንኳኳ በሬን

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 4
ተጨምሮልኛል በእድሜዬ ላይ ዛሬን
እድል የሠጠኸኝ በማምሻ ዘመኔ
ምስክርህ የሆንኩ ሕዝቅያስ ነኝ እኔ(2)

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ',
        lyrics_transliteration = 'CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 1
Besewu fit linager af yefetahubh
Endebet honeኼgn qomyalehu leqne
Niges behywete yante newu zemene (2)
Bealama seraኸgn simhn liqeds

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 2
Leyteh keft’ret kibrhn endwers
Yastat’eqegn simhnewu metaweqiyayeye
Atanawuts’egn kezih eskqwach’ edmeye (2)a
Kezemerkut belay endnor sizemr

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 3
T’afach’un highn belbe lay anur
Keekezarewu belay linur sagelegl
Fiqr nehna ante yizeh yematt’l (2)
Yemot melak biqom eyankwakwa beren

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh

VERSE 4
Tech’emrolgnal beedmeye lay zaren
Edl yeset’eኸgn bemamsha zemene
Miskrh yehonku hizqyas negn ene (2)

CHORUS
Silech’emrklgn edme amesegnhelewu
Zaren yayehut amlake bante newu
Qeriwu zemenen yemsgana adrgewu
Girmaye neh ante kebrn yayehubh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f8f669bd-7df5-4c29-93c1-899fbd44244e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 1
በሰዉ ፊት ልናገር አፍ የፈታሁብህ
እንደበት ሆነኼኝ ቆምያለሁ ለቅኔ
ንገሥ በሕይወቴ ያንተ ነዉ ዘመኔ(2)
በዓላማ ሠራኸኝ ስምህን ልቀድስ

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 2
ለይተህ ከፍጥረት ክብርህን እንድወርስ
ያስታጠቀኝ ስምህነዉ መታወቂያየዬ
አታናዉጸኝ ከዚህ እስክቋጭ እድሜዬ(2)አ
ከዘመርኩት በላይ እንድኖር ስዘምር

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 3
ጣፋጩን ሕግህን በልቤ ላይ አኑር
ከእከዛሬዉ በላይ ልኑር ሳገለግል
ፍቅር ነህና አንተ ይዘህ የማትጥል(2)
የሞት መልዐክ ቢቆም እያንኳኳ በሬን

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ

VERSE 4
ተጨምሮልኛል በእድሜዬ ላይ ዛሬን
እድል የሠጠኸኝ በማምሻ ዘመኔ
ምስክርህ የሆንኩ ሕዝቅያስ ነኝ እኔ(2)

CHORUS
ስለጨምርክልኝ እድሜ አመሰግንሀለዉ
ዛሬን ያየሁት አምላኬ ባንተ ነዉ
ቀሪዉ ዘመኔን የምስጋና አድርገዉ
ግርማዬ ነህ አንተ ከብርን ያየሁብህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f8f669bd-7df5-4c29-93c1-899fbd44244e'::uuid, 'silechemerkilgn-edme', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidisit ("Kidisit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '065a844f-8d23-4623-afc6-d538ebd657e5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 1
በዝማሬ እንበርታ በገናውን እንያዝና
መልካም ስራ የሚሰራባት
ሰንበት ቅድስት ናት እና
ከጨለማ ብርሀን ከመገዛት ነፃነት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 2
እግዚአብሔር ይህን ሰጠን
ደስ ይበለን በሰንበት
ለአብርሃም ተገልጣለች
ለሙሴም በደብረ ሲና

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 3
በነቢያት የታወቀች
ሰንበት ዳራዊት ናት እና
በሳምንቱ ሰለጠነች
ተሰበከች በሐዋርያት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 4
ሃሌ ሉያ ዕለተ ሰንበት
ተሰጠችን ልናርፍባት
በእልልታ እንሞላ እንደ ነቢዩ አሳፍር
በከበረች የሰንበት ቀን ኑ ለቅኔ እንሰለፍ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 5
በመቅደሱ ናቸው እና ቅዱስነትና ግርማ
ውዳሴያችን ይሰማልን
ከምድር እስከ እዮር እራማ
እግዚአብሔር አብ የባረካት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 6
እግዚአብሔር ወልድ የቀደሳት
ከእለታት ሁሉ መርጦ
መንፈስ ቅዱስ ከፍ ያደረጋት
በእርሷ ሀሴት እናድርግ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 7
እናክብራት እንድንከብር
የደጀሰላሙ ታዛ በመቅደሱ እንሰብሰብ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 1
Bezmare enberta begenawn enyazna
Melkam sira yemiserabat
Senbet Kidist nat ena
Kech’elema birhen kemegezat nets’anet

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 2
Egziabher yihn set’en
Des yibelen besenbet
Leabrham tegelt’alech
Lemusem bedebre sina

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 3
Benebiyat yetaweqech
Senbet darawit nat ena
Besamntu selet’enech
Tesebekech behewaryat

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 4
Halleluya elete senbet
Teset’echn linarfbat
Beellta enmola ende nebiyu asafr
Bekeberech yesenbet qen nu leqne enselef

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 5
Bemeqdesu nachew ena qidusnetna girma
Widaseyachn yisemaln
Kemdr eske eyor erama
Egziabher Ab yebarekat

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 6
Egziabher Weld yeqedesat
Keeletat hulu mert’o
Menfes Kidus kef yaderegat
Beerswa heset enadrg

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 7
Enakbrat endnkebr
Yedejeselamu taza bemeqdesu ensebseb

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 1
በዝማሬ እንበርታ በገናውን እንያዝና
መልካም ስራ የሚሰራባት
ሰንበት ቅድስት ናት እና
ከጨለማ ብርሀን ከመገዛት ነፃነት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 2
እግዚአብሔር ይህን ሰጠን
ደስ ይበለን በሰንበት
ለአብርሃም ተገልጣለች
ለሙሴም በደብረ ሲና

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 3
በነቢያት የታወቀች
ሰንበት ዳራዊት ናት እና
በሳምንቱ ሰለጠነች
ተሰበከች በሐዋርያት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 4
ሃሌ ሉያ ዕለተ ሰንበት
ተሰጠችን ልናርፍባት
በእልልታ እንሞላ እንደ ነቢዩ አሳፍር
በከበረች የሰንበት ቀን ኑ ለቅኔ እንሰለፍ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 5
በመቅደሱ ናቸው እና ቅዱስነትና ግርማ
ውዳሴያችን ይሰማልን
ከምድር እስከ እዮር እራማ
እግዚአብሔር አብ የባረካት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 6
እግዚአብሔር ወልድ የቀደሳት
ከእለታት ሁሉ መርጦ
መንፈስ ቅዱስ ከፍ ያደረጋት
በእርሷ ሀሴት እናድርግ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 7
እናክብራት እንድንከብር
የደጀሰላሙ ታዛ በመቅደሱ እንሰብሰብ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን',
        lyrics_transliteration = 'CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 1
Bezmare enberta begenawn enyazna
Melkam sira yemiserabat
Senbet Kidist nat ena
Kech’elema birhen kemegezat nets’anet

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 2
Egziabher yihn set’en
Des yibelen besenbet
Leabrham tegelt’alech
Lemusem bedebre sina

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 3
Benebiyat yetaweqech
Senbet darawit nat ena
Besamntu selet’enech
Tesebekech behewaryat

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 4
Halleluya elete senbet
Teset’echn linarfbat
Beellta enmola ende nebiyu asafr
Bekeberech yesenbet qen nu leqne enselef

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 5
Bemeqdesu nachew ena qidusnetna girma
Widaseyachn yisemaln
Kemdr eske eyor erama
Egziabher Ab yebarekat

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 6
Egziabher Weld yeqedesat
Keeletat hulu mert’o
Menfes Kidus kef yaderegat
Beerswa heset enadrg

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 7
Enakbrat endnkebr
Yedejeselamu taza bemeqdesu ensebseb

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan',
        updated_at = clock_timestamp()::text
    WHERE import_id = '065a844f-8d23-4623-afc6-d538ebd657e5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 1
በዝማሬ እንበርታ በገናውን እንያዝና
መልካም ስራ የሚሰራባት
ሰንበት ቅድስት ናት እና
ከጨለማ ብርሀን ከመገዛት ነፃነት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 2
እግዚአብሔር ይህን ሰጠን
ደስ ይበለን በሰንበት
ለአብርሃም ተገልጣለች
ለሙሴም በደብረ ሲና

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 3
በነቢያት የታወቀች
ሰንበት ዳራዊት ናት እና
በሳምንቱ ሰለጠነች
ተሰበከች በሐዋርያት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 4
ሃሌ ሉያ ዕለተ ሰንበት
ተሰጠችን ልናርፍባት
በእልልታ እንሞላ እንደ ነቢዩ አሳፍር
በከበረች የሰንበት ቀን ኑ ለቅኔ እንሰለፍ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 5
በመቅደሱ ናቸው እና ቅዱስነትና ግርማ
ውዳሴያችን ይሰማልን
ከምድር እስከ እዮር እራማ
እግዚአብሔር አብ የባረካት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 6
እግዚአብሔር ወልድ የቀደሳት
ከእለታት ሁሉ መርጦ
መንፈስ ቅዱስ ከፍ ያደረጋት
በእርሷ ሀሴት እናድርግ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 7
እናክብራት እንድንከብር
የደጀሰላሙ ታዛ በመቅደሱ እንሰብሰብ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '065a844f-8d23-4623-afc6-d538ebd657e5'::uuid, 'kidisit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- diyakon ("Diyakon")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '271f5a99-51f0-454e-8b7c-82664406a679'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 1
የልቤን ጥማት ተካህ በሙላት
ላክብር ስምህን ላውራ ዝናህን
ሞገስ ግርማዬ ሀር ሸማዬ
አፍሯል ከሳሼ አንተን ለብሼ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 2
ተባረክ ውዴ እውነት መንገዴ
ልውጣ ማልጄ ተከፍቶ ደጄ
ወደ ናፍቆቴ አቅንቷል ፊቴ
ድካሜን ጥዬ እልፍ ብዬ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 3
አግኝቼሀለው መች እለቅሀለው
ተባረክ ውዴ እውነት መንገዴ
ዘውዴን ላንሳልህ እጅ እንድነሳ
ክብርስ ላንተ ነው ሞቴን ለሞትከው

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 4
አልደራደር ባንተማ ነገር
ብኖር ብሞትም አንተን አልክድም
ተባረክ ውዴ እውነት መንገዴ
ብቆም ሰገነት በቤተመንግስት

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 5
አለቴ አንተ ነህ የምመካብህ
የነብሴን አውታር ቃኝተህ በፍቅር
ባታሰልፈኝ ማን ያስታውሰኝ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 1
Yelben t’mat tekah bemulat
Lakbr simhn lawra zinahn
Moges girmaye her shemaye
Afrwal kesashe anten lebshe

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 2
Tebarek wide ewnet mengede
Liwt’a malje tekefto deje
Wede nafqote aqntwal fite
Dikamen t’ye elf biye

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 3
Aggnchehelew mech eleqhelew
Tebarek wide ewnet mengede
Zewden lansalh ej endnesa
Kibrs lante new moten lemotkew

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 4
Alderader bantema neger
Binor bimotm anten alkdm
Tebarek wide ewnet mengede
Biqom segenet bebetemengst

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 5
Alete ante neh yemmekabh
Yenebsen awtar qagnteh befqr
Bataselfegn man yastawsegn

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 1
የልቤን ጥማት ተካህ በሙላት
ላክብር ስምህን ላውራ ዝናህን
ሞገስ ግርማዬ ሀር ሸማዬ
አፍሯል ከሳሼ አንተን ለብሼ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 2
ተባረክ ውዴ እውነት መንገዴ
ልውጣ ማልጄ ተከፍቶ ደጄ
ወደ ናፍቆቴ አቅንቷል ፊቴ
ድካሜን ጥዬ እልፍ ብዬ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 3
አግኝቼሀለው መች እለቅሀለው
ተባረክ ውዴ እውነት መንገዴ
ዘውዴን ላንሳልህ እጅ እንድነሳ
ክብርስ ላንተ ነው ሞቴን ለሞትከው

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 4
አልደራደር ባንተማ ነገር
ብኖር ብሞትም አንተን አልክድም
ተባረክ ውዴ እውነት መንገዴ
ብቆም ሰገነት በቤተመንግስት

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 5
አለቴ አንተ ነህ የምመካብህ
የነብሴን አውታር ቃኝተህ በፍቅር
ባታሰልፈኝ ማን ያስታውሰኝ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ',
        lyrics_transliteration = 'CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 1
Yelben t’mat tekah bemulat
Lakbr simhn lawra zinahn
Moges girmaye her shemaye
Afrwal kesashe anten lebshe

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 2
Tebarek wide ewnet mengede
Liwt’a malje tekefto deje
Wede nafqote aqntwal fite
Dikamen t’ye elf biye

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 3
Aggnchehelew mech eleqhelew
Tebarek wide ewnet mengede
Zewden lansalh ej endnesa
Kibrs lante new moten lemotkew

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 4
Alderader bantema neger
Binor bimotm anten alkdm
Tebarek wide ewnet mengede
Biqom segenet bebetemengst

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye

VERSE 5
Alete ante neh yemmekabh
Yenebsen awtar qagnteh befqr
Bataselfegn man yastawsegn

CHORUS
Yalante kibir yelegnm
Lamlkh lezelalem
Tebarek cher Getaye
Minch’ neh ledestaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '271f5a99-51f0-454e-8b7c-82664406a679'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 1
የልቤን ጥማት ተካህ በሙላት
ላክብር ስምህን ላውራ ዝናህን
ሞገስ ግርማዬ ሀር ሸማዬ
አፍሯል ከሳሼ አንተን ለብሼ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 2
ተባረክ ውዴ እውነት መንገዴ
ልውጣ ማልጄ ተከፍቶ ደጄ
ወደ ናፍቆቴ አቅንቷል ፊቴ
ድካሜን ጥዬ እልፍ ብዬ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 3
አግኝቼሀለው መች እለቅሀለው
ተባረክ ውዴ እውነት መንገዴ
ዘውዴን ላንሳልህ እጅ እንድነሳ
ክብርስ ላንተ ነው ሞቴን ለሞትከው

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 4
አልደራደር ባንተማ ነገር
ብኖር ብሞትም አንተን አልክድም
ተባረክ ውዴ እውነት መንገዴ
ብቆም ሰገነት በቤተመንግስት

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ

VERSE 5
አለቴ አንተ ነህ የምመካብህ
የነብሴን አውታር ቃኝተህ በፍቅር
ባታሰልፈኝ ማን ያስታውሰኝ

CHORUS
ያላንተ ክብር የለኝም
ላምልክህ ለዘላለም
ተባረክ ቸር ጌታዬ
ምንጭ ነህ ለደስታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '271f5a99-51f0-454e-8b7c-82664406a679'::uuid, 'diyakon', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aresat-itiyopiyan ("Aresat Itiyopiyan")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c15a03cd-864f-4f73-b356-addf70ca7c44'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 1
ኦርፈና ሰባይ
ወል እግዚአብሔር ሰው ነው ተወዳጅ በስለማ
በጥቃደባ ፈውስና ሰሎቱ ቃሉ የተሰማ
ወዬን የሰበከር ከተማ የትሳውቅ የደብረ አስቦቱ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 2
ለወንጌል ተዋጋሽ ንጽህ ወቱ
አረሳት ኢትዮጵያ በርፈን ላይ ማኖኪውን
የእግዚአብሔር ሰው ነህ ተወዳ ስማ የምርም
በጥቃደባ ፋናው እስከዛሬ ዛሬ ሲያራ የኖረው

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 3
የትሰው አባው ለእግዚ ሃሪያ ማህፀሩ ወለድሽ ቆብን ሲኦን የሚያውቅ
አረሳ ኢትዮጵያ በእርፈ መስገድ አባይ ማኖኪ ወንጌል
የእግዚአብሔር ሰው ተውዳጁ ስሟ
ታርባ ምድጋባሎስ እስካሁን ስሙ ሲጠራበት ሲረገ ይኖራል ሰንሰለት

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 4
አዲስ አዋርያ የኢትዮጵያ ደጋና ቁላውን በምስል
ባረካ ኢትዮጵያ በእውር መስቀድማኖስ
ይሁን የእግዚአብሔር ሰው ነህ ተወዳጅ
ስሟባ ምቹና ፋፏቴው ትራራው ቅዱስ ነው

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 5
የአባዳችን መስቀል ጸሎት ስለነካው
የተራመደበት የዳሰሰው ሁሉ ድው ይፈውሳል ሳርና ቅጠሉ
አረሳት ኢትዮጵያ ኢትዮጵያ በእርፈ መስገል አባት ትግላ ሰባኪ ወንጌል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 6
የተማደ በድባረሳ
ኢትዮጵያ በእርፈ መስገል አባትህ ላይኖል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ
የትምደቅህባይ የትረምድ በጽድቅባይ የትር ማምድ በድቅ ሄደባ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 1
Orfena sebay
Wel Egziabher sew new tewedaj beslema
Bet’qadeba fewsna selotu qalu yetesema
Weyen yesebeker ketema yetsawq yedebre asbotu

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 2
Lewengel tewagash nits’h wetu
Aresat ityop’ya berfen lay manokiwn
YeEgziabher sew neh teweda sima yemrm
Bet’qadeba fanaw eskezare zare siyara yenorew

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 3
Yetsew abaw leegzi hariya mahts’eru weledsh qobn sion yemiyawq
Aresa ityop’ya beerfe mesged abay manoki wengel
YeEgziabher sew tewdaju simwa
Tarba midgabalos eskahun simu sit’erabet sirege yinoral senselet

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 4
Adis awarya yeityop’ya degana qulawn bemsl
Bareka ityop’ya beewr mesqedmanos
Yihun yeEgziabher sew neh tewedaj
Simwaba michuna fafwatew tiraraw Kidus new

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 5
Yeabadachn mesqel ts’elot silenekaw
Yeteramedebet yedasesew hulu diw yifewsal sarna qit’elu
Aresat ityop’ya ityop’ya beerfe mesgel abat tigla sebaki wengel
YeEgziabher sew new tewedaj sima

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 6
Yetemade bedbaresa
Ityop’ya beerfe mesgel abath laynol
YeEgziabher sew new tewedaj sima
Yetmdeqhbay yetremd bets’dqbay yetr mamd bedq hedeba

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 1
ኦርፈና ሰባይ
ወል እግዚአብሔር ሰው ነው ተወዳጅ በስለማ
በጥቃደባ ፈውስና ሰሎቱ ቃሉ የተሰማ
ወዬን የሰበከር ከተማ የትሳውቅ የደብረ አስቦቱ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 2
ለወንጌል ተዋጋሽ ንጽህ ወቱ
አረሳት ኢትዮጵያ በርፈን ላይ ማኖኪውን
የእግዚአብሔር ሰው ነህ ተወዳ ስማ የምርም
በጥቃደባ ፋናው እስከዛሬ ዛሬ ሲያራ የኖረው

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 3
የትሰው አባው ለእግዚ ሃሪያ ማህፀሩ ወለድሽ ቆብን ሲኦን የሚያውቅ
አረሳ ኢትዮጵያ በእርፈ መስገድ አባይ ማኖኪ ወንጌል
የእግዚአብሔር ሰው ተውዳጁ ስሟ
ታርባ ምድጋባሎስ እስካሁን ስሙ ሲጠራበት ሲረገ ይኖራል ሰንሰለት

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 4
አዲስ አዋርያ የኢትዮጵያ ደጋና ቁላውን በምስል
ባረካ ኢትዮጵያ በእውር መስቀድማኖስ
ይሁን የእግዚአብሔር ሰው ነህ ተወዳጅ
ስሟባ ምቹና ፋፏቴው ትራራው ቅዱስ ነው

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 5
የአባዳችን መስቀል ጸሎት ስለነካው
የተራመደበት የዳሰሰው ሁሉ ድው ይፈውሳል ሳርና ቅጠሉ
አረሳት ኢትዮጵያ ኢትዮጵያ በእርፈ መስገል አባት ትግላ ሰባኪ ወንጌል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 6
የተማደ በድባረሳ
ኢትዮጵያ በእርፈ መስገል አባትህ ላይኖል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ
የትምደቅህባይ የትረምድ በጽድቅባይ የትር ማምድ በድቅ ሄደባ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ',
        lyrics_transliteration = 'CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 1
Orfena sebay
Wel Egziabher sew new tewedaj beslema
Bet’qadeba fewsna selotu qalu yetesema
Weyen yesebeker ketema yetsawq yedebre asbotu

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 2
Lewengel tewagash nits’h wetu
Aresat ityop’ya berfen lay manokiwn
YeEgziabher sew neh teweda sima yemrm
Bet’qadeba fanaw eskezare zare siyara yenorew

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 3
Yetsew abaw leegzi hariya mahts’eru weledsh qobn sion yemiyawq
Aresa ityop’ya beerfe mesged abay manoki wengel
YeEgziabher sew tewdaju simwa
Tarba midgabalos eskahun simu sit’erabet sirege yinoral senselet

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 4
Adis awarya yeityop’ya degana qulawn bemsl
Bareka ityop’ya beewr mesqedmanos
Yihun yeEgziabher sew neh tewedaj
Simwaba michuna fafwatew tiraraw Kidus new

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 5
Yeabadachn mesqel ts’elot silenekaw
Yeteramedebet yedasesew hulu diw yifewsal sarna qit’elu
Aresat ityop’ya ityop’ya beerfe mesgel abat tigla sebaki wengel
YeEgziabher sew new tewedaj sima

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 6
Yetemade bedbaresa
Ityop’ya beerfe mesgel abath laynol
YeEgziabher sew new tewedaj sima
Yetmdeqhbay yetremd bets’dqbay yetr mamd bedq hedeba

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c15a03cd-864f-4f73-b356-addf70ca7c44'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 1
ኦርፈና ሰባይ
ወል እግዚአብሔር ሰው ነው ተወዳጅ በስለማ
በጥቃደባ ፈውስና ሰሎቱ ቃሉ የተሰማ
ወዬን የሰበከር ከተማ የትሳውቅ የደብረ አስቦቱ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 2
ለወንጌል ተዋጋሽ ንጽህ ወቱ
አረሳት ኢትዮጵያ በርፈን ላይ ማኖኪውን
የእግዚአብሔር ሰው ነህ ተወዳ ስማ የምርም
በጥቃደባ ፋናው እስከዛሬ ዛሬ ሲያራ የኖረው

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 3
የትሰው አባው ለእግዚ ሃሪያ ማህፀሩ ወለድሽ ቆብን ሲኦን የሚያውቅ
አረሳ ኢትዮጵያ በእርፈ መስገድ አባይ ማኖኪ ወንጌል
የእግዚአብሔር ሰው ተውዳጁ ስሟ
ታርባ ምድጋባሎስ እስካሁን ስሙ ሲጠራበት ሲረገ ይኖራል ሰንሰለት

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 4
አዲስ አዋርያ የኢትዮጵያ ደጋና ቁላውን በምስል
ባረካ ኢትዮጵያ በእውር መስቀድማኖስ
ይሁን የእግዚአብሔር ሰው ነህ ተወዳጅ
ስሟባ ምቹና ፋፏቴው ትራራው ቅዱስ ነው

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 5
የአባዳችን መስቀል ጸሎት ስለነካው
የተራመደበት የዳሰሰው ሁሉ ድው ይፈውሳል ሳርና ቅጠሉ
አረሳት ኢትዮጵያ ኢትዮጵያ በእርፈ መስገል አባት ትግላ ሰባኪ ወንጌል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 6
የተማደ በድባረሳ
ኢትዮጵያ በእርፈ መስገል አባትህ ላይኖል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ
የትምደቅህባይ የትረምድ በጽድቅባይ የትር ማምድ በድቅ ሄደባ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c15a03cd-864f-4f73-b356-addf70ca7c44'::uuid, 'aresat-itiyopiyan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kibir-lesilase ("Kibir Lesilase")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '071dad7d-7c98-456f-9103-51f91ac0186e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 1
ምድርን በአፉ ቃል በዉሃ ላይ ረጋ
በርሃንን ፈጥሮ አለሙን ያበራ
ጨለማንም ሰርቶ ሌሊት ብሎ ጠራዉ
ክብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ በሰማይ በምድር ምስጋና ይፍሰስ(2)

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 2
በዉሆች መካከል ጠፈር አደረገ ከፈላቸዉና ህጉን ደነገገ የምድርቱን ዉሃ
ባአንድ ሰበሰበዉ መከማቻዉንም ስሙን ባህር አለዉ
ምድር ዘር እንትሰጥ አንድት ቃል አወጣ
አየናት ለምልማ በአበቦች አግጣ

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 3
ቀንና ለልቱን እግዝአብሔር ለየዉ አለሙን ስላሴ ፈጠረ አሳመረዉ
የሰዉን ልጅ ከአፈር ከምድር አነሳዉ
በመልኩ በአርዕያዉ በምሳለዉ ሰራዉ
ህያዉ አደረገዉ በእጁ ሰራዉና የራሱን

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 4
እስትንፋስ እፍ አለበትና
ከብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ
በሰማይ በምድር ምስጋና ይፍሴስ

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 1
Midrn beafu qal bewuha lay rega
Berhann fet’ro alemun yabera
Ch’elemanm serto lelit bilo t’erawu
Kibir leSilassie leabna leweld lemenfes Kidus besemay bemdr misgana yifses (2)

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 2
Bewuhoch mekakel t’efer aderege kefelachewuna higun denegege yemdrtun wuha
Baand sebesebewu mekemachawunm simun bahr alewu
Midr zer entset’ andt qal awet’a
Ayenat lemlma beabeboch agt’a

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 3
Qenna leltun egzabher leyewu alemun Silassie fet’ere asamerewu
Yesewun lij keafer kemdr anesawu
Bemelku beareyawu bemsalewu serawu
Hiyawu aderegewu beeju serawuna yerasun

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 4
Estnfas ef alebetna
Kebr leSilassie leabna leweld lemenfes Kidus
Besemay bemdr misgana yifses

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 1
ምድርን በአፉ ቃል በዉሃ ላይ ረጋ
በርሃንን ፈጥሮ አለሙን ያበራ
ጨለማንም ሰርቶ ሌሊት ብሎ ጠራዉ
ክብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ በሰማይ በምድር ምስጋና ይፍሰስ(2)

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 2
በዉሆች መካከል ጠፈር አደረገ ከፈላቸዉና ህጉን ደነገገ የምድርቱን ዉሃ
ባአንድ ሰበሰበዉ መከማቻዉንም ስሙን ባህር አለዉ
ምድር ዘር እንትሰጥ አንድት ቃል አወጣ
አየናት ለምልማ በአበቦች አግጣ

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 3
ቀንና ለልቱን እግዝአብሔር ለየዉ አለሙን ስላሴ ፈጠረ አሳመረዉ
የሰዉን ልጅ ከአፈር ከምድር አነሳዉ
በመልኩ በአርዕያዉ በምሳለዉ ሰራዉ
ህያዉ አደረገዉ በእጁ ሰራዉና የራሱን

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 4
እስትንፋስ እፍ አለበትና
ከብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ
በሰማይ በምድር ምስጋና ይፍሴስ

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ',
        lyrics_transliteration = 'CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 1
Midrn beafu qal bewuha lay rega
Berhann fet’ro alemun yabera
Ch’elemanm serto lelit bilo t’erawu
Kibir leSilassie leabna leweld lemenfes Kidus besemay bemdr misgana yifses (2)

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 2
Bewuhoch mekakel t’efer aderege kefelachewuna higun denegege yemdrtun wuha
Baand sebesebewu mekemachawunm simun bahr alewu
Midr zer entset’ andt qal awet’a
Ayenat lemlma beabeboch agt’a

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 3
Qenna leltun egzabher leyewu alemun Silassie fet’ere asamerewu
Yesewun lij keafer kemdr anesawu
Bemelku beareyawu bemsalewu serawu
Hiyawu aderegewu beeju serawuna yerasun

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega

VERSE 4
Estnfas ef alebetna
Kebr leSilassie leabna leweld lemenfes Kidus
Besemay bemdr misgana yifses

CHORUS
Alemat beegzabhe qal tezegaju
Fit’retat beslale teft’eru
Keft’ret mekakel yamakerewu yelem kehonewum andach yaleersu alonem
Yihun sil sinager semay tezerega',
        updated_at = clock_timestamp()::text
    WHERE import_id = '071dad7d-7c98-456f-9103-51f91ac0186e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 1
ምድርን በአፉ ቃል በዉሃ ላይ ረጋ
በርሃንን ፈጥሮ አለሙን ያበራ
ጨለማንም ሰርቶ ሌሊት ብሎ ጠራዉ
ክብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ በሰማይ በምድር ምስጋና ይፍሰስ(2)

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 2
በዉሆች መካከል ጠፈር አደረገ ከፈላቸዉና ህጉን ደነገገ የምድርቱን ዉሃ
ባአንድ ሰበሰበዉ መከማቻዉንም ስሙን ባህር አለዉ
ምድር ዘር እንትሰጥ አንድት ቃል አወጣ
አየናት ለምልማ በአበቦች አግጣ

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 3
ቀንና ለልቱን እግዝአብሔር ለየዉ አለሙን ስላሴ ፈጠረ አሳመረዉ
የሰዉን ልጅ ከአፈር ከምድር አነሳዉ
በመልኩ በአርዕያዉ በምሳለዉ ሰራዉ
ህያዉ አደረገዉ በእጁ ሰራዉና የራሱን

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ

VERSE 4
እስትንፋስ እፍ አለበትና
ከብር ለስላሴ ለአብና ለወልድ ለመንፈስ ቅዱስ
በሰማይ በምድር ምስጋና ይፍሴስ

CHORUS
አለማት በእግዝአብሔ ቃል ተዘጋጁ
ፍጥረታት በስላሌ ተፍጠሩ
ከፍጥረት መካከል ያማከረዉ የለም ከሆነዉም አንዳች ያለእርሱ አሎኔም
ይሁን ስል ስናገር ሰማይ ተዘረጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '071dad7d-7c98-456f-9103-51f91ac0186e'::uuid, 'kibir-lesilase', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sinegirush-semi-nesh ("Sinegirush Semi Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd864e5dc-9fe2-45b0-8c39-083d7fff5eec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 1
በመከራ ላለው ሁኚለት መፅናኛ
ዕንባውን አብሽው አይዘን ዳግመኛ ጉድለቱን ሙይለት በፈረሰው ቆመሽ ስለምታስምሪ በልዩ ኪዳንሽ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 2
አዝ
ይበጠስ የእጁ የወህኒው ሠንሠለት
የሞቱ ደብዳቤ ይቀየር በሕይወት
አዲስ ተስፋ ሞልተሽ አዲስ ሠው አድርጊው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 3
መቅበዝበዙን ይርሣ ድንግል አረጋጊው
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 4
በዕንባ የመጣው ይመለስ በደስታ
መጠማቱ ይቅር ይሞላ በርካታ
ስዕለቱ ሰምሮለት ይቁም ለምስጋና
የአብራኩን ክፋይ አሣቅፊው እና

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 5
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ
ተይዞ ለሚኖር በአልጋ ቁራኛ

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 6
እርጂው እመቤቴ የደዌውን ዳኛ
መንገርስ ላንቺ ነው መማፀን ወዳንቺ
ተስፋን ለምትቀጥይ ህልምን ለምትፈቺ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 7
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 1
Bemekera lalew hugnilet mets’nagna
Enbawn abshw ayzen dagmegna gudletun muylet beferesew qomesh silemtasmri belyu kidansh
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 2
CHORUS
Yibet’es yeeju yewehniw senselet
Yemotu debdabe yiqeyer behywet
Adis tesfa moltesh adis sew adrgiw

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 3
Meqbezbezun yirsa Dingil aregagiw
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new
CHORUS

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 4
Beenba yemet’aw yimeles bedesta
Met’ematu yiqr yimola berkata
Sieletu semrolet yiqum lemsgana
Yeabrakun kifay asaqfiw ena

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 5
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new
CHORUS
Teyzo leminor bealga quragna

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 6
Erjiw Emebete yedewewn dagna
Mengers lanchi new memats’en wedanchi
Tesfan lemtqet’y hilmn lemtfechi
Kekidanm belay kidansh liyu new

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 7
Enate yemilsh amlaksh lijsh new

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 1
በመከራ ላለው ሁኚለት መፅናኛ
ዕንባውን አብሽው አይዘን ዳግመኛ ጉድለቱን ሙይለት በፈረሰው ቆመሽ ስለምታስምሪ በልዩ ኪዳንሽ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 2
አዝ
ይበጠስ የእጁ የወህኒው ሠንሠለት
የሞቱ ደብዳቤ ይቀየር በሕይወት
አዲስ ተስፋ ሞልተሽ አዲስ ሠው አድርጊው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 3
መቅበዝበዙን ይርሣ ድንግል አረጋጊው
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 4
በዕንባ የመጣው ይመለስ በደስታ
መጠማቱ ይቅር ይሞላ በርካታ
ስዕለቱ ሰምሮለት ይቁም ለምስጋና
የአብራኩን ክፋይ አሣቅፊው እና

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 5
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ
ተይዞ ለሚኖር በአልጋ ቁራኛ

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 6
እርጂው እመቤቴ የደዌውን ዳኛ
መንገርስ ላንቺ ነው መማፀን ወዳንቺ
ተስፋን ለምትቀጥይ ህልምን ለምትፈቺ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት

VERSE 7
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት',
        lyrics_transliteration = 'CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 1
Bemekera lalew hugnilet mets’nagna
Enbawn abshw ayzen dagmegna gudletun muylet beferesew qomesh silemtasmri belyu kidansh
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 2
CHORUS
Yibet’es yeeju yewehniw senselet
Yemotu debdabe yiqeyer behywet
Adis tesfa moltesh adis sew adrgiw

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 3
Meqbezbezun yirsa Dingil aregagiw
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new
CHORUS

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 4
Beenba yemet’aw yimeles bedesta
Met’ematu yiqr yimola berkata
Sieletu semrolet yiqum lemsgana
Yeabrakun kifay asaqfiw ena

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 5
Kekidanm belay kidansh liyu new
Enate yemilsh amlaksh lijsh new
CHORUS
Teyzo leminor bealga quragna

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 6
Erjiw Emebete yedewewn dagna
Mengers lanchi new memats’en wedanchi
Tesfan lemtqet’y hilmn lemtfechi
Kekidanm belay kidansh liyu new

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret

VERSE 7
Enate yemilsh amlaksh lijsh new

CHORUS
Alesh liyu ts’ega alesh liyu kibir
Yehulu emebet besemay bemdr
Aqurarite meat mierage ts’elot
Sinegrush seminesh kidanemhret',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd864e5dc-9fe2-45b0-8c39-083d7fff5eec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት
በመከራ ላለው ሁኚለት መፅናኛ
ዕንባውን አብሽው አይዘን ዳግመኛ ጉድለቱን ሙይለት በፈረሰው ቆመሽ ስለምታስምሪ በልዩ ኪዳንሽ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ= = = = =
ይበጠስ የእጁ የወህኒው ሠንሠለት
የሞቱ ደብዳቤ ይቀየር በሕይወት
አዲስ ተስፋ ሞልተሽ አዲስ ሠው አድርጊው
መቅበዝበዙን ይርሣ ድንግል አረጋጊው
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ= = = = =
በዕንባ የመጣው ይመለስ በደስታ
መጠማቱ ይቅር ይሞላ በርካታ
ስዕለቱ ሰምሮለት ይቁም ለምስጋና
የአብራኩን ክፋይ አሣቅፊው እና
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ= = = = =
ተይዞ ለሚኖር በአልጋ ቁራኛ
እርጂው እመቤቴ የደዌውን ዳኛ
መንገርስ ላንቺ ነው መማፀን ወዳንቺ
ተስፋን ለምትቀጥይ ህልምን ለምትፈቺ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

VERSE 1
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት
በመከራ ላለው ሁኚለት መፅናኛ
ዕንባውን አብሽው አይዘን ዳግመኛ ጉድለቱን ሙይለት በፈረሰው ቆመሽ ስለምታስምሪ በልዩ ኪዳንሽ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ= = = = =
ይበጠስ የእጁ የወህኒው ሠንሠለት
የሞቱ ደብዳቤ ይቀየር በሕይወት
አዲስ ተስፋ ሞልተሽ አዲስ ሠው አድርጊው
መቅበዝበዙን ይርሣ ድንግል አረጋጊው
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ= = = = =
በዕንባ የመጣው ይመለስ በደስታ
መጠማቱ ይቅር ይሞላ በርካታ
ስዕለቱ ሰምሮለት ይቁም ለምስጋና
የአብራኩን ክፋይ አሣቅፊው እና
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ= = = = =
ተይዞ ለሚኖር በአልጋ ቁራኛ
እርጂው እመቤቴ የደዌውን ዳኛ
መንገርስ ላንቺ ነው መማፀን ወዳንቺ
ተስፋን ለምትቀጥይ ህልምን ለምትፈቺ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው

CHORUS
አለሽ ልዩ ፀጋ አለሽ ልዩ ክብር
የሁሉ እመቤት በሠማይ በምድር
አቁራሪተ መአት ምዕራገ ጸሎት
ሲነግሩሽ ሠሚነሽ ኪዳነምሕረት
በመከራ ላለው ሁኚለት መፅናኛ
ዕንባውን አብሽው አይዘን ዳግመኛ ጉድለቱን ሙይለት በፈረሰው ቆመሽ ስለምታስምሪ በልዩ ኪዳንሽ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ= = = = =
ይበጠስ የእጁ የወህኒው ሠንሠለት
የሞቱ ደብዳቤ ይቀየር በሕይወት
አዲስ ተስፋ ሞልተሽ አዲስ ሠው አድርጊው
መቅበዝበዙን ይርሣ ድንግል አረጋጊው
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ= = = = =
በዕንባ የመጣው ይመለስ በደስታ
መጠማቱ ይቅር ይሞላ በርካታ
ስዕለቱ ሰምሮለት ይቁም ለምስጋና
የአብራኩን ክፋይ አሣቅፊው እና
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው
አዝ= = = = =
ተይዞ ለሚኖር በአልጋ ቁራኛ
እርጂው እመቤቴ የደዌውን ዳኛ
መንገርስ ላንቺ ነው መማፀን ወዳንቺ
ተስፋን ለምትቀጥይ ህልምን ለምትፈቺ
ከኪዳንም በላይ ኪዳንሽ ልዩ ነው
እናቴ የሚልሽ አምላክሽ ልጅሽ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd864e5dc-9fe2-45b0-8c39-083d7fff5eec'::uuid, 'sinegirush-semi-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bertemiewos-eye-zemari-yonas-gebrekidan-new-mezmur ("Bertemiewos_eye_Zemari_Yonas_Gebrekidan_New_Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '282f9281-ba60-4823-96ae-1d1d980bd262'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 1
ናይ መድሕነይ ድምጺ ሰሚዐን ኣእዛነይ
''ቲ ዓይነ ልቦናይ ፈጺሙ ዓዊሩ
ኣብርህ ንኣዕይንተይ ልሳነይ ጨዲሩ
መሓረኒ ጎይታይ በርተሜዎስ ኢየ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 2
ንዓብይ ሳህልኻ ብዓይነይ ኢየ ርእየ
ንዓብይ ምሕረትካ ብዓይነይ ኢየ ርእየ
ኣዝ
ኣይሰምዓካን ኢዩ እንተበሉ ብዙሓት

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 3
ተኣሲርካ ኢኻ ብሰንሰለት ሓጢኣት
ስለዚ ኣይትድከም ሲኦል ተጸበያ
ወላ እንተበሉኒ ዕጫኻ ንሳያ
ናባኻ እጭድር ብ ዓይነይ ከይርእያ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 4
ኣዝ
ንዝኸበብዎ ግልል በሉ እናበለ
ናይ በደለይ ዋጋ ብደም ዝኸፈለ
ንስለይ ዝሞተ ጎይታይ ክመጽእ ኢዩ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 5
ንዓይነ ልቦናይ ከብርሃለይ ኢዩ
ንዓይነ ሕልናይ ከብርሃለይ ኢዩ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 1
Nay medhney dimts’i semian aezaney
''ti ayne libonay fets’imu awiru
Abrh niaeyntey lisaney ch’ediru
Mehareni goytay bertemewos iye

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 2
Niaby sahlኻ biayney iye rieye
Niaby mihretka biayney iye rieye
Az
Aysemakan iyu entebelu bizuhat

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 3
Teasirka iኻ bisenselet hat’iat
Silezi aytdkem siol tets’ebeya
Wela entebeluni ech’aኻ nisaya
Nabaኻ ech’dr b ayney keyreya

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 4
Az
Nizኸbebwo gill belu enabele
Nay bedeley waga bidem ziኸfele
Nisley zimote goytay kimets’e iyu

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 5
Niayne libonay kebrhaley iyu
Niayne hilnay kebrhaley iyu

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 1
ናይ መድሕነይ ድምጺ ሰሚዐን ኣእዛነይ
''ቲ ዓይነ ልቦናይ ፈጺሙ ዓዊሩ
ኣብርህ ንኣዕይንተይ ልሳነይ ጨዲሩ
መሓረኒ ጎይታይ በርተሜዎስ ኢየ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 2
ንዓብይ ሳህልኻ ብዓይነይ ኢየ ርእየ
ንዓብይ ምሕረትካ ብዓይነይ ኢየ ርእየ
ኣዝ
ኣይሰምዓካን ኢዩ እንተበሉ ብዙሓት

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 3
ተኣሲርካ ኢኻ ብሰንሰለት ሓጢኣት
ስለዚ ኣይትድከም ሲኦል ተጸበያ
ወላ እንተበሉኒ ዕጫኻ ንሳያ
ናባኻ እጭድር ብ ዓይነይ ከይርእያ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 4
ኣዝ
ንዝኸበብዎ ግልል በሉ እናበለ
ናይ በደለይ ዋጋ ብደም ዝኸፈለ
ንስለይ ዝሞተ ጎይታይ ክመጽእ ኢዩ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 5
ንዓይነ ልቦናይ ከብርሃለይ ኢዩ
ንዓይነ ሕልናይ ከብርሃለይ ኢዩ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ',
        lyrics_transliteration = 'CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 1
Nay medhney dimts’i semian aezaney
''ti ayne libonay fets’imu awiru
Abrh niaeyntey lisaney ch’ediru
Mehareni goytay bertemewos iye

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 2
Niaby sahlኻ biayney iye rieye
Niaby mihretka biayney iye rieye
Az
Aysemakan iyu entebelu bizuhat

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 3
Teasirka iኻ bisenselet hat’iat
Silezi aytdkem siol tets’ebeya
Wela entebeluni ech’aኻ nisaya
Nabaኻ ech’dr b ayney keyreya

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 4
Az
Nizኸbebwo gill belu enabele
Nay bedeley waga bidem ziኸfele
Nisley zimote goytay kimets’e iyu

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 5
Niayne libonay kebrhaley iyu
Niayne hilnay kebrhaley iyu

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney',
        updated_at = clock_timestamp()::text
    WHERE import_id = '282f9281-ba60-4823-96ae-1d1d980bd262'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 1
ናይ መድሕነይ ድምጺ ሰሚዐን ኣእዛነይ
''ቲ ዓይነ ልቦናይ ፈጺሙ ዓዊሩ
ኣብርህ ንኣዕይንተይ ልሳነይ ጨዲሩ
መሓረኒ ጎይታይ በርተሜዎስ ኢየ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 2
ንዓብይ ሳህልኻ ብዓይነይ ኢየ ርእየ
ንዓብይ ምሕረትካ ብዓይነይ ኢየ ርእየ
ኣዝ
ኣይሰምዓካን ኢዩ እንተበሉ ብዙሓት

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 3
ተኣሲርካ ኢኻ ብሰንሰለት ሓጢኣት
ስለዚ ኣይትድከም ሲኦል ተጸበያ
ወላ እንተበሉኒ ዕጫኻ ንሳያ
ናባኻ እጭድር ብ ዓይነይ ከይርእያ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 4
ኣዝ
ንዝኸበብዎ ግልል በሉ እናበለ
ናይ በደለይ ዋጋ ብደም ዝኸፈለ
ንስለይ ዝሞተ ጎይታይ ክመጽእ ኢዩ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 5
ንዓይነ ልቦናይ ከብርሃለይ ኢዩ
ንዓይነ ሕልናይ ከብርሃለይ ኢዩ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '282f9281-ba60-4823-96ae-1d1d980bd262'::uuid, 'bertemiewos-eye-zemari-yonas-gebrekidan-new-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tenestual-deacon-zemari-endale-dereje ("Tenestual Deacon Zemari Endale Dereje")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '08ca0a2e-98cf-4e23-9a89-1b6f4f050ce2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 1
መቃብር ኑና እዩ ፣ በዚህ የለም ጌታ
በሥልጣን ተነስቷል ፣ ከሞት የበረታ
ብርሀን ተጎናጽፎ ፣ በሰማያት አለ
በአባቱ ቀኝ ነው ፣ እነሳለው ያለ።

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 2
በሰማያት መንበር ፣ ተቀምጦ ያየነው
ሞትን ድል የነሳው ፣ ከእርሱ በቀር ማነው !
አትፍራ ቶማስ ሆይ ፣ ና ጎኑን ዳሰህ እይ
ተነስቷል በክብር ፣ ተነስቷል አዶናይ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 3
በዝግ ቤት የገባው ፣ መድኀንህ እርሱ ነው
ትንሣኤና ሕይወት ፣ ነውና እመነው።
የሐዋርያት ጆሮ ፣ የቶማስ ዓይን አለን
በጌታ ትንሣኤ ፣ እኛም እናምናለን

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 4
በፍጹም ልባችን ፣ ፀሐዩ እንዲወጣ
እንማጸናለን ፣ የትንሣኤን ጌታ።
ይኽን ቤተ መቅደስ ፣ አፍርሱት እያለ
የነገራችሁ አምላክ ፣ ምንም አልበደለ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 5
ቢፈርስም በእጃችሁ ፣ የ40 ዓመት መቅደሱ
በሦስት ቀን ታንጿል ፣ ፈርሶ አይቀርም እርሱ ።
ከኃጢአት የራቀ ፣ ይሁን አእምሮዬ
ትንሣኤ ልቡናን ፣ አትም በኑሮዬ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 6
መከራ መስቀልህን ፣ ሞትህን የሚያስብ
አድለኝ ኅሊና ፣ አትንሳኝ ያንተን ልብ።

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 1
Meqabr nuna eyu , bezih yelem Geta
Beslt’an tenestwal , kemot yebereta
Birhen tegonats’fo , besemayat ale
Beabatu qegn new , enesalew yale.

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 2
Besemayat menber , teqemt’o yayenew
Motn dil yenesaw , keersu beqer manew !
Atfra tomas hoy , na gonun daseh ey
Tenestwal bekbr , tenestwal adonay

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 3
Bezg bet yegebaw , medhenh ersu new
Tinsaena hiywet , newna emenew.
Yehewaryat joro , yetomas ayn alen
Begeta tinsae , egnam enamnalen

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 4
Befts’um libachn , ts’eheyu endiwet’a
Enmats’enalen , yetnsaen geta.
Yiኽn bete meqdes , afrsut eyale
Yenegerachhu amlak , minm albedele

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 5
Bifersm beejachhu , ye40 amet meqdesu
Besost qen tants’wal , ferso ayqerm ersu .
Kehat’iat yeraqe , yihun aemroye
Tinsae libunan , atm benuroye

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 6
Mekera mesqelhn , mothn yemiyasb
Adlegn hilina , atnsagn yanten lib.

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 1
መቃብር ኑና እዩ ፣ በዚህ የለም ጌታ
በሥልጣን ተነስቷል ፣ ከሞት የበረታ
ብርሀን ተጎናጽፎ ፣ በሰማያት አለ
በአባቱ ቀኝ ነው ፣ እነሳለው ያለ።

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 2
በሰማያት መንበር ፣ ተቀምጦ ያየነው
ሞትን ድል የነሳው ፣ ከእርሱ በቀር ማነው !
አትፍራ ቶማስ ሆይ ፣ ና ጎኑን ዳሰህ እይ
ተነስቷል በክብር ፣ ተነስቷል አዶናይ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 3
በዝግ ቤት የገባው ፣ መድኀንህ እርሱ ነው
ትንሣኤና ሕይወት ፣ ነውና እመነው።
የሐዋርያት ጆሮ ፣ የቶማስ ዓይን አለን
በጌታ ትንሣኤ ፣ እኛም እናምናለን

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 4
በፍጹም ልባችን ፣ ፀሐዩ እንዲወጣ
እንማጸናለን ፣ የትንሣኤን ጌታ።
ይኽን ቤተ መቅደስ ፣ አፍርሱት እያለ
የነገራችሁ አምላክ ፣ ምንም አልበደለ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 5
ቢፈርስም በእጃችሁ ፣ የ40 ዓመት መቅደሱ
በሦስት ቀን ታንጿል ፣ ፈርሶ አይቀርም እርሱ ።
ከኃጢአት የራቀ ፣ ይሁን አእምሮዬ
ትንሣኤ ልቡናን ፣ አትም በኑሮዬ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 6
መከራ መስቀልህን ፣ ሞትህን የሚያስብ
አድለኝ ኅሊና ፣ አትንሳኝ ያንተን ልብ።

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።',
        lyrics_transliteration = 'CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 1
Meqabr nuna eyu , bezih yelem Geta
Beslt’an tenestwal , kemot yebereta
Birhen tegonats’fo , besemayat ale
Beabatu qegn new , enesalew yale.

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 2
Besemayat menber , teqemt’o yayenew
Motn dil yenesaw , keersu beqer manew !
Atfra tomas hoy , na gonun daseh ey
Tenestwal bekbr , tenestwal adonay

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 3
Bezg bet yegebaw , medhenh ersu new
Tinsaena hiywet , newna emenew.
Yehewaryat joro , yetomas ayn alen
Begeta tinsae , egnam enamnalen

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 4
Befts’um libachn , ts’eheyu endiwet’a
Enmats’enalen , yetnsaen geta.
Yiኽn bete meqdes , afrsut eyale
Yenegerachhu amlak , minm albedele

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 5
Bifersm beejachhu , ye40 amet meqdesu
Besost qen tants’wal , ferso ayqerm ersu .
Kehat’iat yeraqe , yihun aemroye
Tinsae libunan , atm benuroye

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .

VERSE 6
Mekera mesqelhn , mothn yemiyasb
Adlegn hilina , atnsagn yanten lib.

CHORUS
Kemutan mekakel , yelem atfelgut
Behaylu tenestwal , tinsaena hiywet
Yemotn senselet , mewgiyawn sebere
Yemayt’efa ristn , lesew lij anore .',
        updated_at = clock_timestamp()::text
    WHERE import_id = '08ca0a2e-98cf-4e23-9a89-1b6f4f050ce2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 1
መቃብር ኑና እዩ ፣ በዚህ የለም ጌታ
በሥልጣን ተነስቷል ፣ ከሞት የበረታ
ብርሀን ተጎናጽፎ ፣ በሰማያት አለ
በአባቱ ቀኝ ነው ፣ እነሳለው ያለ።

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 2
በሰማያት መንበር ፣ ተቀምጦ ያየነው
ሞትን ድል የነሳው ፣ ከእርሱ በቀር ማነው !
አትፍራ ቶማስ ሆይ ፣ ና ጎኑን ዳሰህ እይ
ተነስቷል በክብር ፣ ተነስቷል አዶናይ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 3
በዝግ ቤት የገባው ፣ መድኀንህ እርሱ ነው
ትንሣኤና ሕይወት ፣ ነውና እመነው።
የሐዋርያት ጆሮ ፣ የቶማስ ዓይን አለን
በጌታ ትንሣኤ ፣ እኛም እናምናለን

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 4
በፍጹም ልባችን ፣ ፀሐዩ እንዲወጣ
እንማጸናለን ፣ የትንሣኤን ጌታ።
ይኽን ቤተ መቅደስ ፣ አፍርሱት እያለ
የነገራችሁ አምላክ ፣ ምንም አልበደለ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 5
ቢፈርስም በእጃችሁ ፣ የ40 ዓመት መቅደሱ
በሦስት ቀን ታንጿል ፣ ፈርሶ አይቀርም እርሱ ።
ከኃጢአት የራቀ ፣ ይሁን አእምሮዬ
ትንሣኤ ልቡናን ፣ አትም በኑሮዬ

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።

VERSE 6
መከራ መስቀልህን ፣ ሞትህን የሚያስብ
አድለኝ ኅሊና ፣ አትንሳኝ ያንተን ልብ።

CHORUS
ከሙታን መካከል ፣ የለም አትፈልጉት
በኃይሉ ተነሥቷል ፣ ትንሣኤና ሕይወት
የሞትን ሰንሰለት ፣ መውጊያውን ሰበረ
የማይጠፋ ርስትን ፣ ለሰው ልጅ አኖረ ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '08ca0a2e-98cf-4e23-9a89-1b6f4f050ce2'::uuid, 'tenestual-deacon-zemari-endale-dereje', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tiezazih-kebedegn ("Tiezazih Kebedegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9a6a3839-854e-45af-bd1b-5869b924786b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 1
ቀድሞ በነበረው በብሉይ ኪዳን ሥር
እንደተፃፈው ነው የለመድኩት ፍቅር
ተቸግሬ ሳለ ወዳጄን ለመውደድ
አራከው ከበደኝ የሀዲሱ መንገድ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 2
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ
ሞቴን ለሚናፍቅ እንዴት ይጸለያል
የሚረግመኝ ጠላት ለምን ይመረቃል

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 3
መጎናፀፊያዬን ከወስደብኝ ሰው
በእጥፍ መቀበል ነው እኔ ምፈልገው !
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 4
ቀኜን ለሚመታኝ ግራዬን አልሰጥም
ስለ ዓይን ዓይን ነው ልማዴን አለቅም
ጠላትህን ጥላ ወዳጅህን ውደድ
እሱ ነው ሰላሜ የለመድኩት መንገድ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 5
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 1
Qedmo beneberew bebluy kidan sir
Endetets’afew new yelemedkut fiqr
Techegre sale wedajen lemewded
Arakew kebedegn yehedisu menged

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 2
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta
Moten leminafq endet yits’eleyal
Yemiregmegn t’elat lemn yimereqal

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 3
Megonats’efiyayen kewesdebgn sew
Beet’f meqebel new ene mifelgew !
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 4
Qegnen lemimetagn girayen alset’m
Sile ayn ayn new limaden aleqm
T’elathn t’la wedajhn wided
Esu new selame yelemedkut menged

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 5
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 1
ቀድሞ በነበረው በብሉይ ኪዳን ሥር
እንደተፃፈው ነው የለመድኩት ፍቅር
ተቸግሬ ሳለ ወዳጄን ለመውደድ
አራከው ከበደኝ የሀዲሱ መንገድ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 2
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ
ሞቴን ለሚናፍቅ እንዴት ይጸለያል
የሚረግመኝ ጠላት ለምን ይመረቃል

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 3
መጎናፀፊያዬን ከወስደብኝ ሰው
በእጥፍ መቀበል ነው እኔ ምፈልገው !
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 4
ቀኜን ለሚመታኝ ግራዬን አልሰጥም
ስለ ዓይን ዓይን ነው ልማዴን አለቅም
ጠላትህን ጥላ ወዳጅህን ውደድ
እሱ ነው ሰላሜ የለመድኩት መንገድ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 5
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ',
        lyrics_transliteration = 'CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 1
Qedmo beneberew bebluy kidan sir
Endetets’afew new yelemedkut fiqr
Techegre sale wedajen lemewded
Arakew kebedegn yehedisu menged

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 2
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta
Moten leminafq endet yits’eleyal
Yemiregmegn t’elat lemn yimereqal

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 3
Megonats’efiyayen kewesdebgn sew
Beet’f meqebel new ene mifelgew !
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 4
Qegnen lemimetagn girayen alset’m
Sile ayn ayn new limaden aleqm
T’elathn t’la wedajhn wided
Esu new selame yelemedkut menged

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye

VERSE 5
Leseqeluh ayhud yelemenk yiqrta
T’elatochen mewded astemregn Geta

CHORUS
Ene mawqew fiqr wedajn mewded new
Yeene likna ewnet t’elatn met’lat new
Meremerku belbe , lekaw besgaye
T’elatochen mewded kebdognal Getaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9a6a3839-854e-45af-bd1b-5869b924786b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 1
ቀድሞ በነበረው በብሉይ ኪዳን ሥር
እንደተፃፈው ነው የለመድኩት ፍቅር
ተቸግሬ ሳለ ወዳጄን ለመውደድ
አራከው ከበደኝ የሀዲሱ መንገድ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 2
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ
ሞቴን ለሚናፍቅ እንዴት ይጸለያል
የሚረግመኝ ጠላት ለምን ይመረቃል

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 3
መጎናፀፊያዬን ከወስደብኝ ሰው
በእጥፍ መቀበል ነው እኔ ምፈልገው !
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 4
ቀኜን ለሚመታኝ ግራዬን አልሰጥም
ስለ ዓይን ዓይን ነው ልማዴን አለቅም
ጠላትህን ጥላ ወዳጅህን ውደድ
እሱ ነው ሰላሜ የለመድኩት መንገድ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ

VERSE 5
ለሰቀሉህ አይሁድ የለመንክ ይቅርታ
ጠላቶቼን መውደድ አስተምረኝ ጌታ

CHORUS
እኔ ማውቀው ፍቅር ወዳጅን መውደድ ነው
የእኔ ልክና እውነት ጠላትን መጥላት ነው
መረመርኩ በልቤ ፣ ለካው በሥጋዬ
ጠላቶቼን መውደድ ከብዶኛል ጌታዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9a6a3839-854e-45af-bd1b-5869b924786b'::uuid, 'tiezazih-kebedegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- chernetih-bizu-mihretih-bizu ("Chernetih Bizu Mihretih Bizu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '09731abf-d73b-4fc8-9719-e26741370e28'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
እስራኤል ወደቀ (እስራኤል ተነሳ(2×))
መንገዱ አልቀናውም (አምላኩን ቢረሳ(2×))
የያዕቆብን አምላክ (እግዚአብሔርን ይዞ(2×))
ምን እንዳተረፈ (አውቆታል በጉዞ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 2
መንገዱ አይታክትም (ጎዳናው የቀና(2×))
እግዚአብሔር ከፊትም (ከኋላም አለና(2×))
እርሱ ከሌለበት (ቢመችም መንገዱ(2×))
አቅጣጫው ወደሞት (አይቀርም መውሰዱ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 3
በመንገዱ ዝለን (ወድቀን መች ቀርተናል(2×))
የያዕቆብ አምላክ (ደግፎ አንስቶናል(2×))
እግዚአብሔር ሲጠራን (በቀደመው መንገድ(2×))
ጉዟችን ወዴት ነው (በሞት ለመወሰድ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 4
አምላክ ሆይ ፍቅርህን (በልባችን ሳለው(2×))
እስከሞት በመስቀል (የወደደን ማነው(2×))
በበረሀው ፅናት (ሲጸናብን ርሀቡ(2×))
በረከት ሞላልን (ተረፈልን ምግቡ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 1
srael wedeqe (srael tenesa(2×))
mengedu elqenawm (emlakun biresa(2×))
yeyaqobn emlak (gziebhern yzo(2×))
mn ndaterefe (ewqotal beguzo(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 2
mengedu eytaktm (godanaw yeqena(2×))
gziebher kefitm (kelam elena(2×))
rsu kelelebet (bimechm mengedu(2×))
eqtachaw wedemot (eyqerm mewsedu(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 3
bemengedu zlen (wedqen mech qertenal(2×))
yeyaqob emlak (degfo enstonal(2×))
gziebher siteran (beqedemew menged(2×))
guchn wedet new (bemot lemewesed(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 4
emlak hoy fqrhn (belbachn salew(2×))
skemot bemesqel (yewededen manew(2×))
beberehew tsnat (sitsenabn rhebu(2×))
bereket molaln (terefeln mgbu(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
እስራኤል ወደቀ (እስራኤል ተነሳ(2×))
መንገዱ አልቀናውም (አምላኩን ቢረሳ(2×))
የያዕቆብን አምላክ (እግዚአብሔርን ይዞ(2×))
ምን እንዳተረፈ (አውቆታል በጉዞ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 2
መንገዱ አይታክትም (ጎዳናው የቀና(2×))
እግዚአብሔር ከፊትም (ከኋላም አለና(2×))
እርሱ ከሌለበት (ቢመችም መንገዱ(2×))
አቅጣጫው ወደሞት (አይቀርም መውሰዱ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 3
በመንገዱ ዝለን (ወድቀን መች ቀርተናል(2×))
የያዕቆብ አምላክ (ደግፎ አንስቶናል(2×))
እግዚአብሔር ሲጠራን (በቀደመው መንገድ(2×))
ጉዟችን ወዴት ነው (በሞት ለመወሰድ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 4
አምላክ ሆይ ፍቅርህን (በልባችን ሳለው(2×))
እስከሞት በመስቀል (የወደደን ማነው(2×))
በበረሀው ፅናት (ሲጸናብን ርሀቡ(2×))
በረከት ሞላልን (ተረፈልን ምግቡ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ',
        lyrics_transliteration = 'CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 1
srael wedeqe (srael tenesa(2×))
mengedu elqenawm (emlakun biresa(2×))
yeyaqobn emlak (gziebhern yzo(2×))
mn ndaterefe (ewqotal beguzo(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 2
mengedu eytaktm (godanaw yeqena(2×))
gziebher kefitm (kelam elena(2×))
rsu kelelebet (bimechm mengedu(2×))
eqtachaw wedemot (eyqerm mewsedu(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 3
bemengedu zlen (wedqen mech qertenal(2×))
yeyaqob emlak (degfo enstonal(2×))
gziebher siteran (beqedemew menged(2×))
guchn wedet new (bemot lemewesed(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 4
emlak hoy fqrhn (belbachn salew(2×))
skemot bemesqel (yewededen manew(2×))
beberehew tsnat (sitsenabn rhebu(2×))
bereket molaln (terefeln mgbu(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya',
        updated_at = clock_timestamp()::text
    WHERE import_id = '09731abf-d73b-4fc8-9719-e26741370e28'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
እስራኤል ወደቀ (እስራኤል ተነሳ(2×))
መንገዱ አልቀናውም (አምላኩን ቢረሳ(2×))
የያዕቆብን አምላክ (እግዚአብሔርን ይዞ(2×))
ምን እንዳተረፈ (አውቆታል በጉዞ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 2
መንገዱ አይታክትም (ጎዳናው የቀና(2×))
እግዚአብሔር ከፊትም (ከኋላም አለና(2×))
እርሱ ከሌለበት (ቢመችም መንገዱ(2×))
አቅጣጫው ወደሞት (አይቀርም መውሰዱ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 3
በመንገዱ ዝለን (ወድቀን መች ቀርተናል(2×))
የያዕቆብ አምላክ (ደግፎ አንስቶናል(2×))
እግዚአብሔር ሲጠራን (በቀደመው መንገድ(2×))
ጉዟችን ወዴት ነው (በሞት ለመወሰድ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 4
አምላክ ሆይ ፍቅርህን (በልባችን ሳለው(2×))
እስከሞት በመስቀል (የወደደን ማነው(2×))
በበረሀው ፅናት (ሲጸናብን ርሀቡ(2×))
በረከት ሞላልን (ተረፈልን ምግቡ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 1
srael wedeqe (srael tenesa(2×))
mengedu elqenawm (emlakun biresa(2×))
yeyaqobn emlak (gziebhern yzo(2×))
mn ndaterefe (ewqotal beguzo(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 2
mengedu eytaktm (godanaw yeqena(2×))
gziebher kefitm (kelam elena(2×))
rsu kelelebet (bimechm mengedu(2×))
eqtachaw wedemot (eyqerm mewsedu(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 3
bemengedu zlen (wedqen mech qertenal(2×))
yeyaqob emlak (degfo enstonal(2×))
gziebher siteran (beqedemew menged(2×))
guchn wedet new (bemot lemewesed(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 4
emlak hoy fqrhn (belbachn salew(2×))
skemot bemesqel (yewededen manew(2×))
beberehew tsnat (sitsenabn rhebu(2×))
bereket molaln (terefeln mgbu(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '09731abf-d73b-4fc8-9719-e26741370e28'::uuid, 'chernetih-bizu-mihretih-bizu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- medafa-lay ("Medafa Lay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2977acb1-6bf6-4ca0-beb8-e2ed46c6969d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 1
ቁስሎቼ ላይ ዘይት ያኖረ እኔን የማረኝ
በትከሻው የተሸከመኝ ችሉ ያኖረኝ
ባምጽበት ምን ብበድለው
እርሱ እንደው ያው ነው

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 2
አልጠቆረም አልጠፋም ፊቱ የአባትነቱ
ደዌን የሚያውቅ ታማኙ እረኛ ለአፍታ ማይተኛ
ሲጠብቀኝ ውሎ የሚያድር በፍቅር አጥር
ባይኖቼ ላይ እንደተሳለ አሁንም አለ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 3
እግሬ በእምነት ተከታትሎታል ልቤም ወዶታል
የተቤዤኝ ህይወቱን ጥሎ ማእረጉን ጥሎ
እኔን ሊያድን እርሱ ታመመ መስቀል ላይ ቆመ
በጁ መሀል ሰንሰለት ገባ ስለኔ አነባ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 4
ባደባባይ መሰከረልኝ ሞቴን ሞተልኝ
የደም ጅረት የደም ነጠብጠብ የእግዚአብሔር ጥበብ
በዚህ መንገድ ህይወት አበዛ በደሙ ገዛ
እረፍቴ ሆይ ውዴ እለዋለሁ እኔ አምንዋለሁ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 5
ያከበረኝ የዋጀኝ እርሱ ያውም በነፍሱ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 1
Qusloche lay zeyt yanore enen yemaregn
Betkeshaw yeteshekemegn chlu yanoregn
Bamts’bet min bibedlew
Ersu endew yaw new

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 2
Alt’eqorem alt’efam fitu yeabatnetu
Dewen yemiyawq tamagnu eregna leafta maytegna
Sit’ebqegn wilo yemiyadr befqr at’r
Baynoche lay endetesale ahunm ale

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 3
Egre beemnet teketatlotal libem wedotal
Yetebezhegn hiywetun t’lo maeregun t’lo
Enen liyadn ersu tameme mesqel lay qome
Beju mehel senselet geba silene aneba

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 4
Badebabay mesekerelgn moten motelgn
Yedem jiret yedem net’ebt’eb yeEgziabher t’beb
Bezih menged hiywet abeza bedemu geza
Erefte hoy wide elewalehu ene amnwalehu

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 5
Yakeberegn yewajegn ersu yawm benefsu

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 1
ቁስሎቼ ላይ ዘይት ያኖረ እኔን የማረኝ
በትከሻው የተሸከመኝ ችሉ ያኖረኝ
ባምጽበት ምን ብበድለው
እርሱ እንደው ያው ነው

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 2
አልጠቆረም አልጠፋም ፊቱ የአባትነቱ
ደዌን የሚያውቅ ታማኙ እረኛ ለአፍታ ማይተኛ
ሲጠብቀኝ ውሎ የሚያድር በፍቅር አጥር
ባይኖቼ ላይ እንደተሳለ አሁንም አለ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 3
እግሬ በእምነት ተከታትሎታል ልቤም ወዶታል
የተቤዤኝ ህይወቱን ጥሎ ማእረጉን ጥሎ
እኔን ሊያድን እርሱ ታመመ መስቀል ላይ ቆመ
በጁ መሀል ሰንሰለት ገባ ስለኔ አነባ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 4
ባደባባይ መሰከረልኝ ሞቴን ሞተልኝ
የደም ጅረት የደም ነጠብጠብ የእግዚአብሔር ጥበብ
በዚህ መንገድ ህይወት አበዛ በደሙ ገዛ
እረፍቴ ሆይ ውዴ እለዋለሁ እኔ አምንዋለሁ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 5
ያከበረኝ የዋጀኝ እርሱ ያውም በነፍሱ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)',
        lyrics_transliteration = 'CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 1
Qusloche lay zeyt yanore enen yemaregn
Betkeshaw yeteshekemegn chlu yanoregn
Bamts’bet min bibedlew
Ersu endew yaw new

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 2
Alt’eqorem alt’efam fitu yeabatnetu
Dewen yemiyawq tamagnu eregna leafta maytegna
Sit’ebqegn wilo yemiyadr befqr at’r
Baynoche lay endetesale ahunm ale

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 3
Egre beemnet teketatlotal libem wedotal
Yetebezhegn hiywetun t’lo maeregun t’lo
Enen liyadn ersu tameme mesqel lay qome
Beju mehel senselet geba silene aneba

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 4
Badebabay mesekerelgn moten motelgn
Yedem jiret yedem net’ebt’eb yeEgziabher t’beb
Bezih menged hiywet abeza bedemu geza
Erefte hoy wide elewalehu ene amnwalehu

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 5
Yakeberegn yewajegn ersu yawm benefsu

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2977acb1-6bf6-4ca0-beb8-e2ed46c6969d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 1
ቁስሎቼ ላይ ዘይት ያኖረ እኔን የማረኝ
በትከሻው የተሸከመኝ ችሉ ያኖረኝ
ባምጽበት ምን ብበድለው
እርሱ እንደው ያው ነው

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 2
አልጠቆረም አልጠፋም ፊቱ የአባትነቱ
ደዌን የሚያውቅ ታማኙ እረኛ ለአፍታ ማይተኛ
ሲጠብቀኝ ውሎ የሚያድር በፍቅር አጥር
ባይኖቼ ላይ እንደተሳለ አሁንም አለ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 3
እግሬ በእምነት ተከታትሎታል ልቤም ወዶታል
የተቤዤኝ ህይወቱን ጥሎ ማእረጉን ጥሎ
እኔን ሊያድን እርሱ ታመመ መስቀል ላይ ቆመ
በጁ መሀል ሰንሰለት ገባ ስለኔ አነባ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 4
ባደባባይ መሰከረልኝ ሞቴን ሞተልኝ
የደም ጅረት የደም ነጠብጠብ የእግዚአብሔር ጥበብ
በዚህ መንገድ ህይወት አበዛ በደሙ ገዛ
እረፍቴ ሆይ ውዴ እለዋለሁ እኔ አምንዋለሁ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 5
ያከበረኝ የዋጀኝ እርሱ ያውም በነፍሱ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2977acb1-6bf6-4ca0-beb8-e2ed46c6969d'::uuid, 'medafa-lay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- menfes-kidus-ethiopian-orthodox-mezmure ("Menfes kidus Ethiopian Orthodox Mezmure")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9a6aede0-89ca-4720-aa7c-5932b0c81047'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ

VERSE 1
ቆርጬ እንድወጣ አበርታኝ
ከሳሼን ትጥቄን ሳያስፈታኝ
ቅዱስ መንፈስህ አይዘንብኝ
አርነት ሃጢያት አይሁንብኝ

CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ

VERSE 2
በቃኤል መንገድ መሔድ ይብቃኝ
በቃልህ ባተ ብቻ ልቃኝ

CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala

VERSE 1
Qorch’e endwet’a abertagn
Kesashen tit’qen sayasfetagn
Kidus menfesh ayzenbgn
Arnet hat’iyat ayhunbgn

CHORUS
Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala

VERSE 2
Beqael menged mehed yibqagn
Beqalh bate bicha liqagn

CHORUS
Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ

VERSE 1
ቆርጬ እንድወጣ አበርታኝ
ከሳሼን ትጥቄን ሳያስፈታኝ
ቅዱስ መንፈስህ አይዘንብኝ
አርነት ሃጢያት አይሁንብኝ

CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ

VERSE 2
በቃኤል መንገድ መሔድ ይብቃኝ
በቃልህ ባተ ብቻ ልቃኝ

CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ',
        lyrics_transliteration = 'CHORUS
Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala

VERSE 1
Qorch’e endwet’a abertagn
Kesashen tit’qen sayasfetagn
Kidus menfesh ayzenbgn
Arnet hat’iyat ayhunbgn

CHORUS
Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala

VERSE 2
Beqael menged mehed yibqagn
Beqalh bate bicha liqagn

CHORUS
Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9a6aede0-89ca-4720-aa7c-5932b0c81047'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ

VERSE 1
ቆርጬ እንድወጣ አበርታኝ
ከሳሼን ትጥቄን ሳያስፈታኝ
ቅዱስ መንፈስህ አይዘንብኝ
አርነት ሃጢያት አይሁንብኝ

CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ

VERSE 2
በቃኤል መንገድ መሔድ ይብቃኝ
በቃልህ ባተ ብቻ ልቃኝ

CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9a6aede0-89ca-4720-aa7c-5932b0c81047'::uuid, 'menfes-kidus-ethiopian-orthodox-mezmure', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyam-nitsihit ("Mariyam Nitsihit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2a5179b8-1e39-4a47-afee-bfc4a853e09c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት

VERSE 1
ማርያም ንጽሕት ድንግል ታማኝ
አምላክን የወለድሽ
የምሕረት አማላጅ ለሰው ልጆች
አማልጂን ከልጅሽ ከክርስቶስ ይቅር እንዲለን

CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት

VERSE 2
ቅድስት ሆይ ለምኚልን

CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist

VERSE 1
Maryam nits’ht Dingil tamagn
Amlakn yeweledsh
Yemhret amalaj lesew lijoch
Amaljin keljsh kekrstos yiqr endilen

CHORUS
Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist

VERSE 2
Kidist hoy lemgniln

CHORUS
Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት

VERSE 1
ማርያም ንጽሕት ድንግል ታማኝ
አምላክን የወለድሽ
የምሕረት አማላጅ ለሰው ልጆች
አማልጂን ከልጅሽ ከክርስቶስ ይቅር እንዲለን

CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት

VERSE 2
ቅድስት ሆይ ለምኚልን

CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት',
        lyrics_transliteration = 'CHORUS
Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist

VERSE 1
Maryam nits’ht Dingil tamagn
Amlakn yeweledsh
Yemhret amalaj lesew lijoch
Amaljin keljsh kekrstos yiqr endilen

CHORUS
Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist

VERSE 2
Kidist hoy lemgniln

CHORUS
Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2a5179b8-1e39-4a47-afee-bfc4a853e09c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት

VERSE 1
ማርያም ንጽሕት ድንግል ታማኝ
አምላክን የወለድሽ
የምሕረት አማላጅ ለሰው ልጆች
አማልጂን ከልጅሽ ከክርስቶስ ይቅር እንዲለን

CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት

VERSE 2
ቅድስት ሆይ ለምኚልን

CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2a5179b8-1e39-4a47-afee-bfc4a853e09c'::uuid, 'mariyam-nitsihit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beritemiyos-negn-bupmngp_p5g ("Beritemiyos Negn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2a14ff92-bf0e-4c5a-a72b-a830a76791f1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 1
Keruq yesemahut yegetaye dimts’un
Kebzu hukata gurmrmta mehal
YeKristos dimts’u beglts’ yisemagnal.
Yelbonaye ayn fets’mo tawrwal

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 2
Aynen fewslgn bert’emiyos yilal
Abzche ech’ohelew Geta maregn biye
Bewst’e eyetayegn simregn getaye.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 3
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Anten aysemahm yilugnal bizuwoch

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 4
Beht’yat senselet tasrehal egr kewerch
Silezih atlfa sioln t’ebqat
Endezih bilugnm ech’ohelew saltakt.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 5
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Yekebebewn sew gelel belu eyale

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 6
Bedelen bedemu waga eyekefele
Sileene yemotew Iyesus yimet’al
Yelbonayen ayn gelt’o yasayegnal.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 7
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Abzche ech’ohelew Geta maregn biye

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 8
Beglts’ eyetayegn simregn Getaye
Bewst’e bedels hiywete zilalech
Beamlake chernet hiywet kalagegnech.

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን',
        lyrics_transliteration = 'CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 1
Keruq yesemahut yegetaye dimts’un
Kebzu hukata gurmrmta mehal
YeKristos dimts’u beglts’ yisemagnal.
Yelbonaye ayn fets’mo tawrwal

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 2
Aynen fewslgn bert’emiyos yilal
Abzche ech’ohelew Geta maregn biye
Bewst’e eyetayegn simregn getaye.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 3
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Anten aysemahm yilugnal bizuwoch

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 4
Beht’yat senselet tasrehal egr kewerch
Silezih atlfa sioln t’ebqat
Endezih bilugnm ech’ohelew saltakt.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 5
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Yekebebewn sew gelel belu eyale

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 6
Bedelen bedemu waga eyekefele
Sileene yemotew Iyesus yimet’al
Yelbonayen ayn gelt’o yasayegnal.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 7
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Abzche ech’ohelew Geta maregn biye

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 8
Beglts’ eyetayegn simregn Getaye
Bewst’e bedels hiywete zilalech
Beamlake chernet hiywet kalagegnech.

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2a14ff92-bf0e-4c5a-a72b-a830a76791f1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2a14ff92-bf0e-4c5a-a72b-a830a76791f1'::uuid, 'beritemiyos-negn-bupmngp_p5g', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- menfes-qdus-zemari-berket-tikue-live-orthodox-worship-mezmur ("menfes qdus /zemari berket tikue / Live orthodox worship mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0903e907-def8-48e0-8210-88e4a683dcd0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 1
ፈሪሐ ከይጥምት ንድሕረይ
ቆሪጸ ክወጽእ ርድኣኒ
ከሰስተይ ዕጥቀይ ከየፍትሑኒ
ቅዱስ መንፈስካ ከይሓዝነለይ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 2
ንሓጥያት ከይከውን ሓርነተይ
ይእከለኒ መንገዲ ቃኤል
ቃንየኒ ብናይ በይንኻ ቃል
እናፈለጥኩ ኣጥፊአ ከይርከብ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 3
ግንሓኒ ሂወት ንኽረክብ
ኩለንትናይ ውረሶ ኢኻ
ካብ ልበይ ኣይንጸፍ ፉቕርኻ
ንሓላፊ ትምኔተይ ክብል

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 4
ከይወድቕ ክወርድ ንቑልቁል
ፍርሓተይ ብፍቕርኻ እሰራ
ሂወተይ ናትካ"ዶ ግበራ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 1
Ferihe keyt’mt nidhrey
Qorits’e kiwets’e ridani
Kesestey et’qey keyefthuni
Kidus menfeska keyhazneley

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 2
Nihat’yat keykewn harnetey
Yiekeleni mengedi qael
Qanyeni binay beynኻ qal
Enafelet’ku at’fia keyrkeb

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 3
Ginhani hiwet niኽrekb
Kulentnay wireso iኻ
Kab libey aynts’ef fuቕrኻ
Nihalafi timnetey kibl

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 4
Keywedቕ kiwerd niቑlqul
Firhatey bifቕrኻ esera
Hiwetey natka"do gibera

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 1
ፈሪሐ ከይጥምት ንድሕረይ
ቆሪጸ ክወጽእ ርድኣኒ
ከሰስተይ ዕጥቀይ ከየፍትሑኒ
ቅዱስ መንፈስካ ከይሓዝነለይ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 2
ንሓጥያት ከይከውን ሓርነተይ
ይእከለኒ መንገዲ ቃኤል
ቃንየኒ ብናይ በይንኻ ቃል
እናፈለጥኩ ኣጥፊአ ከይርከብ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 3
ግንሓኒ ሂወት ንኽረክብ
ኩለንትናይ ውረሶ ኢኻ
ካብ ልበይ ኣይንጸፍ ፉቕርኻ
ንሓላፊ ትምኔተይ ክብል

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 4
ከይወድቕ ክወርድ ንቑልቁል
ፍርሓተይ ብፍቕርኻ እሰራ
ሂወተይ ናትካ"ዶ ግበራ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ',
        lyrics_transliteration = 'CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 1
Ferihe keyt’mt nidhrey
Qorits’e kiwets’e ridani
Kesestey et’qey keyefthuni
Kidus menfeska keyhazneley

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 2
Nihat’yat keykewn harnetey
Yiekeleni mengedi qael
Qanyeni binay beynኻ qal
Enafelet’ku at’fia keyrkeb

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 3
Ginhani hiwet niኽrekb
Kulentnay wireso iኻ
Kab libey aynts’ef fuቕrኻ
Nihalafi timnetey kibl

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 4
Keywedቕ kiwerd niቑlqul
Firhatey bifቕrኻ esera
Hiwetey natka"do gibera

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0903e907-def8-48e0-8210-88e4a683dcd0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 1
ፈሪሐ ከይጥምት ንድሕረይ
ቆሪጸ ክወጽእ ርድኣኒ
ከሰስተይ ዕጥቀይ ከየፍትሑኒ
ቅዱስ መንፈስካ ከይሓዝነለይ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 2
ንሓጥያት ከይከውን ሓርነተይ
ይእከለኒ መንገዲ ቃኤል
ቃንየኒ ብናይ በይንኻ ቃል
እናፈለጥኩ ኣጥፊአ ከይርከብ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 3
ግንሓኒ ሂወት ንኽረክብ
ኩለንትናይ ውረሶ ኢኻ
ካብ ልበይ ኣይንጸፍ ፉቕርኻ
ንሓላፊ ትምኔተይ ክብል

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 4
ከይወድቕ ክወርድ ንቑልቁል
ፍርሓተይ ብፍቕርኻ እሰራ
ሂወተይ ናትካ"ዶ ግበራ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0903e907-def8-48e0-8210-88e4a683dcd0'::uuid, 'menfes-qdus-zemari-berket-tikue-live-orthodox-worship-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- natanem-negn ("Natanem Negn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9bede665-a3a3-411f-bd4e-6e5ce8421c93'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 1
ከነገደ ሌዊ ባልሆንም
ባልሾምም እንደ አሮን
የዜማ ጣም ባልይዝ በገና
ላመስግንህ በትህትና

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 2
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 3
ከእረኝነት ከታናሽ ስፍራ
ለንግስና ምንም ብጠራ
ከቀንዲሉ ቀርቧል ሀሳቤ
ብቀኝልህ ተነጥፎ ልቤ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ዋጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 5
ሳይከብድብኝ የአለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኒም ነኝ ይቺ ናት ቃሌ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 6
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 7
እንኳን ልቆም በፍታ ለብሼ
አፍርሀለሁ እኔ አጎንብሼ
የትምክህት ካባዬን ጥዬ
ከመቅደስህ ልግባ ጌታዬ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 8
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 1
Kenegede lewi balhonm
Balshomm ende aron
Yezema t’am balyz begena
Lamesgnh bethtna

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 2
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante ts’ega

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 3
Keeregnnet ketanash sifra
Lengsna minm bit’era
Keqendilu qerbwal hesabe
Biqegnlh tenet’fo libe

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 4
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante waga

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 5
Saykebdbgn yealem zina
Tenberkke list’h misgana
Miknyat alegn lemazenbele
Natanim negn yichi nat qale

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 6
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante ts’ega

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 7
Enkwan liqom befta lebshe
Afrhelehu ene agonbshe
Yetmkht kabayen t’ye
Kemeqdesh ligba Getaye

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 8
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn ende waga
Akeberkegn bante ts’ega

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 1
ከነገደ ሌዊ ባልሆንም
ባልሾምም እንደ አሮን
የዜማ ጣም ባልይዝ በገና
ላመስግንህ በትህትና

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 2
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 3
ከእረኝነት ከታናሽ ስፍራ
ለንግስና ምንም ብጠራ
ከቀንዲሉ ቀርቧል ሀሳቤ
ብቀኝልህ ተነጥፎ ልቤ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ዋጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 5
ሳይከብድብኝ የአለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኒም ነኝ ይቺ ናት ቃሌ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 6
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 7
እንኳን ልቆም በፍታ ለብሼ
አፍርሀለሁ እኔ አጎንብሼ
የትምክህት ካባዬን ጥዬ
ከመቅደስህ ልግባ ጌታዬ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 8
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/',
        lyrics_transliteration = 'CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 1
Kenegede lewi balhonm
Balshomm ende aron
Yezema t’am balyz begena
Lamesgnh bethtna

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 2
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante ts’ega

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 3
Keeregnnet ketanash sifra
Lengsna minm bit’era
Keqendilu qerbwal hesabe
Biqegnlh tenet’fo libe

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 4
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante waga

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 5
Saykebdbgn yealem zina
Tenberkke list’h misgana
Miknyat alegn lemazenbele
Natanim negn yichi nat qale

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 6
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante ts’ega

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 7
Enkwan liqom befta lebshe
Afrhelehu ene agonbshe
Yetmkht kabayen t’ye
Kemeqdesh ligba Getaye

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 8
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn ende waga
Akeberkegn bante ts’ega

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9bede665-a3a3-411f-bd4e-6e5ce8421c93'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 1
ከነገደ ሌዊ ባልሆንም
ባልሾምም እንደ አሮን
የዜማ ጣም ባልይዝ በገና
ላመስግንህ በትህትና

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 2
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 3
ከእረኝነት ከታናሽ ስፍራ
ለንግስና ምንም ብጠራ
ከቀንዲሉ ቀርቧል ሀሳቤ
ብቀኝልህ ተነጥፎ ልቤ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ዋጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 5
ሳይከብድብኝ የአለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኒም ነኝ ይቺ ናት ቃሌ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 6
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 7
እንኳን ልቆም በፍታ ለብሼ
አፍርሀለሁ እኔ አጎንብሼ
የትምክህት ካባዬን ጥዬ
ከመቅደስህ ልግባ ጌታዬ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 8
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9bede665-a3a3-411f-bd4e-6e5ce8421c93'::uuid, 'natanem-negn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- destan-absari-feben-eyob ("DESTAN ABSARI FEBEN EYOB")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0d838a05-878e-43b1-9ff9-07f52ca0474a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 1
የምድንበትን ምሥራች ንገረኝ
በመንገዴ ቅደም ጽድቅን አስተምረኝ
አትለየኝ ከእኔ በመውጣት በመግባቴ
ከክፉ አድነኝ ገብርኤል አባቴ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 2
''ባንተ ጥበቃ ነው ለዛሬ የደረስኩት
የመከራን ማዕበል አልፌ የቆምኩት
አንተን ተደግፌ ነገንም አልፈራ
ቀድመሀልና መንገዴን ልትመራ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 3
ያሳደግኸኝ መልአክ በእንክብካቤ
ከአፌ የማትጠፋ ገብርኤል ነህ ቅርቤ
ዙሪያዬ ረበህ ዘውትር አይሀለሁ
የልቤን ኹሉ ለአንተ እነግራለሁ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 4
ድንቅን የምታደርግ በእኔ ሕይወት
የምትቆምልኝ በእግዚአብሔር ፊት
የምትባርከኝ በሥጋም በነፍሴ
መልአከ ራማ ገብርኤል ሞገሴ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 1
Yemdnbetn misrach nigeregn
Bemengede qidem ts’dqn astemregn
Atleyegn keene bemewt’at bemegbate
Kekfu adnegn Gebriel abate

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 2
''bante t’beqa new lezare yedereskut
Yemekeran maebel alfe yeqomkut
Anten tedegfe negenm alfera
Qedmehelna mengeden litmera

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 3
Yasadegኸgn melak beenkbkabe
Keafe yematt’efa Gebriel neh qirbe
Zuriyaye rebeh zewtr ayhelehu
Yelben ኹlu leante enegralehu

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 4
Dinqn yemtaderg beene hiywet
Yemtqomlgn beEgziabher fit
Yemtbarkegn besgam benefse
Melake rama Gebriel mogese

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 1
የምድንበትን ምሥራች ንገረኝ
በመንገዴ ቅደም ጽድቅን አስተምረኝ
አትለየኝ ከእኔ በመውጣት በመግባቴ
ከክፉ አድነኝ ገብርኤል አባቴ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 2
''ባንተ ጥበቃ ነው ለዛሬ የደረስኩት
የመከራን ማዕበል አልፌ የቆምኩት
አንተን ተደግፌ ነገንም አልፈራ
ቀድመሀልና መንገዴን ልትመራ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 3
ያሳደግኸኝ መልአክ በእንክብካቤ
ከአፌ የማትጠፋ ገብርኤል ነህ ቅርቤ
ዙሪያዬ ረበህ ዘውትር አይሀለሁ
የልቤን ኹሉ ለአንተ እነግራለሁ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 4
ድንቅን የምታደርግ በእኔ ሕይወት
የምትቆምልኝ በእግዚአብሔር ፊት
የምትባርከኝ በሥጋም በነፍሴ
መልአከ ራማ ገብርኤል ሞገሴ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ',
        lyrics_transliteration = 'CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 1
Yemdnbetn misrach nigeregn
Bemengede qidem ts’dqn astemregn
Atleyegn keene bemewt’at bemegbate
Kekfu adnegn Gebriel abate

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 2
''bante t’beqa new lezare yedereskut
Yemekeran maebel alfe yeqomkut
Anten tedegfe negenm alfera
Qedmehelna mengeden litmera

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 3
Yasadegኸgn melak beenkbkabe
Keafe yematt’efa Gebriel neh qirbe
Zuriyaye rebeh zewtr ayhelehu
Yelben ኹlu leante enegralehu

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak

VERSE 4
Dinqn yemtaderg beene hiywet
Yemtqomlgn beEgziabher fit
Yemtbarkegn besgam benefse
Melake rama Gebriel mogese

CHORUS
Melkam qal tenagari
Gebriel/let’eruh fet’neh yemtders
Simh kech’nq dewe ''mifews
Ket’fat yadankegn melak',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0d838a05-878e-43b1-9ff9-07f52ca0474a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 1
የምድንበትን ምሥራች ንገረኝ
በመንገዴ ቅደም ጽድቅን አስተምረኝ
አትለየኝ ከእኔ በመውጣት በመግባቴ
ከክፉ አድነኝ ገብርኤል አባቴ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 2
''ባንተ ጥበቃ ነው ለዛሬ የደረስኩት
የመከራን ማዕበል አልፌ የቆምኩት
አንተን ተደግፌ ነገንም አልፈራ
ቀድመሀልና መንገዴን ልትመራ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 3
ያሳደግኸኝ መልአክ በእንክብካቤ
ከአፌ የማትጠፋ ገብርኤል ነህ ቅርቤ
ዙሪያዬ ረበህ ዘውትር አይሀለሁ
የልቤን ኹሉ ለአንተ እነግራለሁ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ

VERSE 4
ድንቅን የምታደርግ በእኔ ሕይወት
የምትቆምልኝ በእግዚአብሔር ፊት
የምትባርከኝ በሥጋም በነፍሴ
መልአከ ራማ ገብርኤል ሞገሴ

CHORUS
መልካም ቃል ተናጋሪ
ገብርኤል/ለጠሩህ ፈጥነህ የምትደርስ
ስምህ ከጭንቅ ደዌ ''ሚፈውስ
ከጥፋት ያዳንከኝ መልአክ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0d838a05-878e-43b1-9ff9-07f52ca0474a'::uuid, 'destan-absari-feben-eyob', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- seirkani ("Seirkani")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '10c5ec52-c272-45a4-9b5e-173604f7efcd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 1
ኣበይ''ዶ መልሲ ክረኽበልካ''የ ኣብ ዙፋን ፍርድኻ:
ቆፎ ግብረይ ጸንቂቐ ብዘይ ፍረ ዘጉሃኩኻ:
ተመስገን''ያ ምክሊት ነብሰይ ቀቢረ ኮይነ ኣማራሪ:
ካብቲ ቅዱስ ማኣድኻ ብጉጤት ተመንጣሊ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 2
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
ንራእየይ ፍጹም ዘደብዝዝ ዘይጥዓስ ልቢ ሒዘ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 3
ንጽያፍ ግብረይ ዘይመኑ ውዒለ ክሓድረሉ:
ኢልካኒ ጸሚኤ ፍቕርኻ ሓሞት ሓርማዝ ዘስተኹኻ:
ግን ትጽበየኒ እንቅዓ ዘይትርብርብ ፈቃር ኢኻ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 4
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
መሲለ ነዚ ርኹስ ዘመን ካብ ሂወት ንሞት ዝኣምን:
ንተስፋ ውሽጠይ ቀቲለ ሕልናይ ናብ ሞት ሰቒለ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 5
ዘይትቀብጽ ኣቦ ምሕረት ግብርኻ ከመይ ክቁጸር:
ኣብ ማይ የእትየዮ ውዕለትካ ግን ጌና ዝርጉሕ''ዩ ኢድካ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 1
Abey''do melsi kireኽbelka''ye ab zufan firdኻ:
Qofo gibrey ts’enqiቐ bizey fire zeguhakuኻ:
Temesgen''ya miklit nebsey qebire koyne amarari:
Kabti Kidus maadኻ bigut’et tement’ali:

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 2
[abet kem bizhi mihretka t’emitkani]
[kab kontnet za''alem ab betka awilkani.]
Az""""
Niraeyey fits’um zedebzz zeyt’as libi hize:

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 3
Nits’yaf gibrey zeymenu wiile kihadrelu:
Ilkani ts’emie fiቕrኻ hamot harmaz zesteኹኻ:
Gin tits’beyeni enqa zeytrbrb feqar iኻ:
[abet kem bizhi mihretka t’emitkani]

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 4
[kab kontnet za''alem ab betka awilkani.]
Az""""
Mesile nezi riኹs zemen kab hiwet nimot ziamn:
Nitesfa wisht’ey qetile hilnay nab mot seቒle:

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 5
Zeytqebts’ abo mihret gibrኻ kemey kiquts’er:
Ab may yeetyeyo wieletka gin gena zirguh''yu idka:
[abet kem bizhi mihretka t’emitkani]
[kab kontnet za''alem ab betka awilkani.]

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 1
ኣበይ''ዶ መልሲ ክረኽበልካ''የ ኣብ ዙፋን ፍርድኻ:
ቆፎ ግብረይ ጸንቂቐ ብዘይ ፍረ ዘጉሃኩኻ:
ተመስገን''ያ ምክሊት ነብሰይ ቀቢረ ኮይነ ኣማራሪ:
ካብቲ ቅዱስ ማኣድኻ ብጉጤት ተመንጣሊ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 2
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
ንራእየይ ፍጹም ዘደብዝዝ ዘይጥዓስ ልቢ ሒዘ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 3
ንጽያፍ ግብረይ ዘይመኑ ውዒለ ክሓድረሉ:
ኢልካኒ ጸሚኤ ፍቕርኻ ሓሞት ሓርማዝ ዘስተኹኻ:
ግን ትጽበየኒ እንቅዓ ዘይትርብርብ ፈቃር ኢኻ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 4
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
መሲለ ነዚ ርኹስ ዘመን ካብ ሂወት ንሞት ዝኣምን:
ንተስፋ ውሽጠይ ቀቲለ ሕልናይ ናብ ሞት ሰቒለ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 5
ዘይትቀብጽ ኣቦ ምሕረት ግብርኻ ከመይ ክቁጸር:
ኣብ ማይ የእትየዮ ውዕለትካ ግን ጌና ዝርጉሕ''ዩ ኢድካ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)',
        lyrics_transliteration = 'CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 1
Abey''do melsi kireኽbelka''ye ab zufan firdኻ:
Qofo gibrey ts’enqiቐ bizey fire zeguhakuኻ:
Temesgen''ya miklit nebsey qebire koyne amarari:
Kabti Kidus maadኻ bigut’et tement’ali:

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 2
[abet kem bizhi mihretka t’emitkani]
[kab kontnet za''alem ab betka awilkani.]
Az""""
Niraeyey fits’um zedebzz zeyt’as libi hize:

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 3
Nits’yaf gibrey zeymenu wiile kihadrelu:
Ilkani ts’emie fiቕrኻ hamot harmaz zesteኹኻ:
Gin tits’beyeni enqa zeytrbrb feqar iኻ:
[abet kem bizhi mihretka t’emitkani]

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 4
[kab kontnet za''alem ab betka awilkani.]
Az""""
Mesile nezi riኹs zemen kab hiwet nimot ziamn:
Nitesfa wisht’ey qetile hilnay nab mot seቒle:

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)

VERSE 5
Zeytqebts’ abo mihret gibrኻ kemey kiquts’er:
Ab may yeetyeyo wieletka gin gena zirguh''yu idka:
[abet kem bizhi mihretka t’emitkani]
[kab kontnet za''alem ab betka awilkani.]

CHORUS
Zigermeni abey nerka zeybelkani goyta:
Zeseqቐni siqay qanzaኻ niay minbaru mirseay kota:
Kigelabet’ ab zit’emeni tets’emimkani
Kemaኻ afqari fits’um yelen siirkani (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '10c5ec52-c272-45a4-9b5e-173604f7efcd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 1
ኣበይ''ዶ መልሲ ክረኽበልካ''የ ኣብ ዙፋን ፍርድኻ:
ቆፎ ግብረይ ጸንቂቐ ብዘይ ፍረ ዘጉሃኩኻ:
ተመስገን''ያ ምክሊት ነብሰይ ቀቢረ ኮይነ ኣማራሪ:
ካብቲ ቅዱስ ማኣድኻ ብጉጤት ተመንጣሊ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 2
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
ንራእየይ ፍጹም ዘደብዝዝ ዘይጥዓስ ልቢ ሒዘ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 3
ንጽያፍ ግብረይ ዘይመኑ ውዒለ ክሓድረሉ:
ኢልካኒ ጸሚኤ ፍቕርኻ ሓሞት ሓርማዝ ዘስተኹኻ:
ግን ትጽበየኒ እንቅዓ ዘይትርብርብ ፈቃር ኢኻ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 4
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]
ኣዝ""""
መሲለ ነዚ ርኹስ ዘመን ካብ ሂወት ንሞት ዝኣምን:
ንተስፋ ውሽጠይ ቀቲለ ሕልናይ ናብ ሞት ሰቒለ:

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)

VERSE 5
ዘይትቀብጽ ኣቦ ምሕረት ግብርኻ ከመይ ክቁጸር:
ኣብ ማይ የእትየዮ ውዕለትካ ግን ጌና ዝርጉሕ''ዩ ኢድካ:
[ኣቤት ከም ብዝሒ ምሕረትካ ጠሚትካኒ]
[ካብ ኮንትነት ዛ''ዓለም ኣብ ቤትካ ኣውዒልካኒ።]

CHORUS
ዝገርመኒ ኣበይ ኔርካ ዘይበልካኒ ጎይታ:
ዘሰቅቐኒ ስቃይ ቃንዛኻ ንዓይ ምንባሩ ምርሰዐይ ኮታ:
ክገላበጥ ኣብ ዝጥዕመኒ ተጸሚምካኒ
ከማኻ ኣፍቃሪ ፍጹም የለን ስዒርካኒ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '10c5ec52-c272-45a4-9b5e-173604f7efcd'::uuid, 'seirkani', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tv-way-zema-filmon-yebyo-orthodox-tewahdo-mezmur-orthodox-tewahdo ("TV: Way Zema/ : Filmon Yebyo: Orthodox Tewahdo Mezmur orthodox tewahdo")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0d748acf-1f6b-4c89-9f5f-406cbf0cecee'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 1
ፊደላት ተቆጺሮም እንተፈለመ ምህሮ
ዓመታት እንክከይድ ክኸንብ ኣእምሮ
መን''ዶ ኔሩካ''ዩ ቲ''ሸውዓተ ዓመት
ብዘይካ''ቲ ጻጸ ናይ ኣንክሮ ፍጥረት

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 2
ጸራጊ መንገዲ ፍኖት ቅዱስ ዓወት
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 3
ምስጢር ሰለስትነት ናይ ዜማካ ራእይ
ግእዝ ዝፈለሞ እዝሊ ምስ ዓራራይ
ውሓዚ ቃናታቱ ሕይወትና ዝልውጥ
ብደመና ሰማይ ሰማይት ዝምስጥ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 4
ምስቶም መላእክቲ ብሓጎስ ዘቀምጥ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 5
ኣለዎ እንዶ ምልክት ናይ ምስጋና ስልቲ
ብዓቅሚ ሰብ ዘይብጻሕ ቋንቋ መላእክቲ
ኣየናይ ኣእምሮ እዩ መርሚሩ ዝፈሊ
ግብሪ መንፈስ ቅዱስ ገሊጹ ዘለሊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 6
ተዘይከሲትሉ እቲ ኩሉ ከኣሊ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 7
ክዱስ ሃሪ ብርሃን ዘንጸባርቅ ልብስኻ
ብመንፈስ ክትዝምም በቲ ናውትኻ
ሻቡ ሕልናኻ ተሰቂሉ ሰማይ
ጸናጽል ኣሰንዩ ኣርያማዊ ግናይ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 8
ዘልዓለም ዘዕቁብ ኣብ መንበር ኣዶናይ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 1
Fidelat teqots’irom entefeleme mihro
Ametat enkkeyd kiኸnb aemro
Men''do neruka''yu ti''shewate amet
Bizeyka''ti ts’ats’e nay ankro fit’ret

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 2
Ts’eragi mengedi finot Kidus awet
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 3
Mist’ir selestnet nay zemaka raey
Giez zifelemo ezli mis araray
Wihazi qanatatu hiywetna zilwt’
Bidemena semay semayt zimst’

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 4
Mistom melaekti bihagos zeqemt’
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 5
Alewo endo milkt nay misgana silti
Biaqmi seb zeybts’ah qwanqwa melaekti
Ayenay aemro eyu mermiru zifeli
Gibri menfes Kidus gelits’u zeleli

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 6
Tezeykesitlu eti kulu keali
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 7
Kidus hari birhan zents’ebarq libsኻ
Bimenfes kitzmm beti nawtኻ
Shabu hilnaኻ teseqilu semay
Ts’enats’l asenyu aryamawi ginay

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 8
Zelalem zeequb ab menber adonay
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 1
ፊደላት ተቆጺሮም እንተፈለመ ምህሮ
ዓመታት እንክከይድ ክኸንብ ኣእምሮ
መን''ዶ ኔሩካ''ዩ ቲ''ሸውዓተ ዓመት
ብዘይካ''ቲ ጻጸ ናይ ኣንክሮ ፍጥረት

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 2
ጸራጊ መንገዲ ፍኖት ቅዱስ ዓወት
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 3
ምስጢር ሰለስትነት ናይ ዜማካ ራእይ
ግእዝ ዝፈለሞ እዝሊ ምስ ዓራራይ
ውሓዚ ቃናታቱ ሕይወትና ዝልውጥ
ብደመና ሰማይ ሰማይት ዝምስጥ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 4
ምስቶም መላእክቲ ብሓጎስ ዘቀምጥ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 5
ኣለዎ እንዶ ምልክት ናይ ምስጋና ስልቲ
ብዓቅሚ ሰብ ዘይብጻሕ ቋንቋ መላእክቲ
ኣየናይ ኣእምሮ እዩ መርሚሩ ዝፈሊ
ግብሪ መንፈስ ቅዱስ ገሊጹ ዘለሊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 6
ተዘይከሲትሉ እቲ ኩሉ ከኣሊ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 7
ክዱስ ሃሪ ብርሃን ዘንጸባርቅ ልብስኻ
ብመንፈስ ክትዝምም በቲ ናውትኻ
ሻቡ ሕልናኻ ተሰቂሉ ሰማይ
ጸናጽል ኣሰንዩ ኣርያማዊ ግናይ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 8
ዘልዓለም ዘዕቁብ ኣብ መንበር ኣዶናይ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ',
        lyrics_transliteration = 'CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 1
Fidelat teqots’irom entefeleme mihro
Ametat enkkeyd kiኸnb aemro
Men''do neruka''yu ti''shewate amet
Bizeyka''ti ts’ats’e nay ankro fit’ret

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 2
Ts’eragi mengedi finot Kidus awet
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 3
Mist’ir selestnet nay zemaka raey
Giez zifelemo ezli mis araray
Wihazi qanatatu hiywetna zilwt’
Bidemena semay semayt zimst’

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 4
Mistom melaekti bihagos zeqemt’
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 5
Alewo endo milkt nay misgana silti
Biaqmi seb zeybts’ah qwanqwa melaekti
Ayenay aemro eyu mermiru zifeli
Gibri menfes Kidus gelits’u zeleli

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 6
Tezeykesitlu eti kulu keali
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 7
Kidus hari birhan zents’ebarq libsኻ
Bimenfes kitzmm beti nawtኻ
Shabu hilnaኻ teseqilu semay
Ts’enats’l asenyu aryamawi ginay

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 8
Zelalem zeequb ab menber adonay
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

CHORUS
Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0d748acf-1f6b-4c89-9f5f-406cbf0cecee'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 1
ፊደላት ተቆጺሮም እንተፈለመ ምህሮ
ዓመታት እንክከይድ ክኸንብ ኣእምሮ
መን''ዶ ኔሩካ''ዩ ቲ''ሸውዓተ ዓመት
ብዘይካ''ቲ ጻጸ ናይ ኣንክሮ ፍጥረት

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 2
ጸራጊ መንገዲ ፍኖት ቅዱስ ዓወት
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 3
ምስጢር ሰለስትነት ናይ ዜማካ ራእይ
ግእዝ ዝፈለሞ እዝሊ ምስ ዓራራይ
ውሓዚ ቃናታቱ ሕይወትና ዝልውጥ
ብደመና ሰማይ ሰማይት ዝምስጥ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 4
ምስቶም መላእክቲ ብሓጎስ ዘቀምጥ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 5
ኣለዎ እንዶ ምልክት ናይ ምስጋና ስልቲ
ብዓቅሚ ሰብ ዘይብጻሕ ቋንቋ መላእክቲ
ኣየናይ ኣእምሮ እዩ መርሚሩ ዝፈሊ
ግብሪ መንፈስ ቅዱስ ገሊጹ ዘለሊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 6
ተዘይከሲትሉ እቲ ኩሉ ከኣሊ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 7
ክዱስ ሃሪ ብርሃን ዘንጸባርቅ ልብስኻ
ብመንፈስ ክትዝምም በቲ ናውትኻ
ሻቡ ሕልናኻ ተሰቂሉ ሰማይ
ጸናጽል ኣሰንዩ ኣርያማዊ ግናይ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 8
ዘልዓለም ዘዕቁብ ኣብ መንበር ኣዶናይ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

CHORUS
ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0d748acf-1f6b-4c89-9f5f-406cbf0cecee'::uuid, 'tv-way-zema-filmon-yebyo-orthodox-tewahdo-mezmur-orthodox-tewahdo', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- deg-degun-asayen ("Deg Degun Asayen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0da43b7d-0abb-4939-bf25-c9f165434972'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 1
ሾተል ስቦ የነበረ አበባን ይስጥ ለወንድሙ
ከመቅበዝበዝ ከጸብ ይውጣ አብሮት ይኑር በሰላሙ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 2
አዛውንቱ ህጻናቱ አለቅንብህ በሰቀቀን
መቼም ላንተ አይሳንህ አቅርብልን የሳቁን ቀን
ዳግም ያብብ በልባችን የረገፈው የፍቅር ዘር
በሚያልፍ ሃሳብ ተደግፈን ተጠላልፈን እንዳንቀር

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 3
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ማዕዳችን ሙሉ ይሁን ማዕዳችን ጥጋብ አርገው
እንዳለፈው መልካም ጊዜ አንዱ አንዱን ይደግፈው

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 4
አትረፍርፈን በበረከት ጥቂት ዘርተን ብዙ እንጨድ
የአባውን ዘመን መልስ እርስ በርስበርስም እንዋደድ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 5
የሃዘናችን ካባ ይውለቅ ደስታ አልብሰን እንደ ድሮው
እናት በሃዘን አትጎዳ አባት አይኑር አቀርቅሮ
ትናንትናን አስረስተህ በአዲስ ዘመን አዲስ አድርገን
ቂም በቀልን አርቅልን እንደገናም አስተቃቅፈን

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 6
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 1
Shotel sibo yenebere abeban yist’ lewendmu
Kemeqbezbez kets’eb yiwt’a abrot yinur beselamu
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 2
Azawntu hits’anatu aleqnbh beseqeqen
Mechem lante aysanh aqrbln yesaqun qen
Dagm yabb belbachn yeregefew yefqr zer
Bemiyalf hasab tedegfen tet’elalfen endanqer

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 3
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Maedachn mulu yihun maedachn t’gab argew
Endalefew melkam gize andu andun yidegfew

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 4
Atrefrfen bebereket t’qit zerten bizu ench’ed
Yeabawn zemen mels ers bersbersm enwaded
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 5
Yehazenachn kaba yiwleq desta albsen ende dirow
Enat behazen atgoda abat aynur aqerqro
Tinantnan asresteh beadis zemen adis adrgen
Qim beqeln arqln endegenam asteqaqfen

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 6
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 1
ሾተል ስቦ የነበረ አበባን ይስጥ ለወንድሙ
ከመቅበዝበዝ ከጸብ ይውጣ አብሮት ይኑር በሰላሙ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 2
አዛውንቱ ህጻናቱ አለቅንብህ በሰቀቀን
መቼም ላንተ አይሳንህ አቅርብልን የሳቁን ቀን
ዳግም ያብብ በልባችን የረገፈው የፍቅር ዘር
በሚያልፍ ሃሳብ ተደግፈን ተጠላልፈን እንዳንቀር

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 3
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ማዕዳችን ሙሉ ይሁን ማዕዳችን ጥጋብ አርገው
እንዳለፈው መልካም ጊዜ አንዱ አንዱን ይደግፈው

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 4
አትረፍርፈን በበረከት ጥቂት ዘርተን ብዙ እንጨድ
የአባውን ዘመን መልስ እርስ በርስበርስም እንዋደድ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 5
የሃዘናችን ካባ ይውለቅ ደስታ አልብሰን እንደ ድሮው
እናት በሃዘን አትጎዳ አባት አይኑር አቀርቅሮ
ትናንትናን አስረስተህ በአዲስ ዘመን አዲስ አድርገን
ቂም በቀልን አርቅልን እንደገናም አስተቃቅፈን

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 6
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው',
        lyrics_transliteration = 'CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 1
Shotel sibo yenebere abeban yist’ lewendmu
Kemeqbezbez kets’eb yiwt’a abrot yinur beselamu
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 2
Azawntu hits’anatu aleqnbh beseqeqen
Mechem lante aysanh aqrbln yesaqun qen
Dagm yabb belbachn yeregefew yefqr zer
Bemiyalf hasab tedegfen tet’elalfen endanqer

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 3
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Maedachn mulu yihun maedachn t’gab argew
Endalefew melkam gize andu andun yidegfew

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 4
Atrefrfen bebereket t’qit zerten bizu ench’ed
Yeabawn zemen mels ers bersbersm enwaded
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 5
Yehazenachn kaba yiwleq desta albsen ende dirow
Enat behazen atgoda abat aynur aqerqro
Tinantnan asresteh beadis zemen adis adrgen
Qim beqeln arqln endegenam asteqaqfen

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new

VERSE 6
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret

CHORUS
Deg degun asayen des yibelen beadis amet
Yiqr belen bat’efanew yefqr abat yemhret
Kemnayew kemnsemaw yikellen cherneth
Mechem egna bedlenal Egziabher gin yiqr bay new',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0da43b7d-0abb-4939-bf25-c9f165434972'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 1
ሾተል ስቦ የነበረ አበባን ይስጥ ለወንድሙ
ከመቅበዝበዝ ከጸብ ይውጣ አብሮት ይኑር በሰላሙ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 2
አዛውንቱ ህጻናቱ አለቅንብህ በሰቀቀን
መቼም ላንተ አይሳንህ አቅርብልን የሳቁን ቀን
ዳግም ያብብ በልባችን የረገፈው የፍቅር ዘር
በሚያልፍ ሃሳብ ተደግፈን ተጠላልፈን እንዳንቀር

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 3
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ማዕዳችን ሙሉ ይሁን ማዕዳችን ጥጋብ አርገው
እንዳለፈው መልካም ጊዜ አንዱ አንዱን ይደግፈው

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 4
አትረፍርፈን በበረከት ጥቂት ዘርተን ብዙ እንጨድ
የአባውን ዘመን መልስ እርስ በርስበርስም እንዋደድ
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 5
የሃዘናችን ካባ ይውለቅ ደስታ አልብሰን እንደ ድሮው
እናት በሃዘን አትጎዳ አባት አይኑር አቀርቅሮ
ትናንትናን አስረስተህ በአዲስ ዘመን አዲስ አድርገን
ቂም በቀልን አርቅልን እንደገናም አስተቃቅፈን

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው

VERSE 6
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት

CHORUS
ደግ ደጉን አሳየን ደስ ይበለን በአዲስ ዓመት
ይቅር በለን ባጠፋነው የፍቅር አባት የምህረት
ከምናየው ከምንሰማው ይከልለን ቸርነትህ
መቼም እኛ በድለናል እግዚአብሔር ግን ይቅር ባይ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0da43b7d-0abb-4939-bf25-c9f165434972'::uuid, 'deg-degun-asayen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egiziabiher-eregnaye-new ("Egiziabiher Eregnaye New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0aaeccd7-8f48-4390-b806-192b527f2567'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 1
ነፍሴን መለሳት ከጥፋት ወጥመድ
ስለስሙ መራኝ በፅድቅ መንገድ
ባለፍኩም ጊዜ በሞት ጥላ ስር
ክፉውን አልፈራም ነህና ከእኔ ጋር

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 2
በትርህ ምርኩዝህ እነሱ አዳኑኝ
በፊቴም ገበታ አዘጋጀህልኝ
በዘይት ቀባኸኝ በደስታ ፀጋ
ፅዋዬም ተረፈ ስኖር ካንተ ጋራ

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 3
ከአዳኝ ወጥመድም እርሱ ያድነኛል
በላባዎቹም ስር ይጋርደኛል
መሸሸጊያዬ ነው በርሱ እታመናለው
እርሱ መጠጊያዬ ከቶ ምን እሆናለው

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 4
ቸርነትህ እና ምህረትህ ዘወትር
ይከተሉኛል በህይወቴ ዘመን
ስለዚህ በፅናት ባንተ ቤት ኖራለው
በእግዚአብሔር ቸርነት ፍቅር እየተደገፍኩ

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 1
Nefsen melesat ket’fat wet’med
Silesmu meragn bets’dq menged
Balefkum gize bemot t’la sir
Kifuwn alferam nehna keene gar

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 2
Betrh mirkuzh enesu adanugn
Befitem gebeta azegajehlgn
Bezeyt qebaኸgn bedesta ts’ega
Ts’wayem terefe sinor kante gara

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 3
Keadagn wet’medm ersu yadnegnal
Belabawochum sir yigardegnal
Mesheshegiyaye new bersu etamenalew
Ersu met’egiyaye keto min ehonalew

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 4
Cherneth ena mihreth zewetr
Yiketelugnal behywete zemen
Silezih bets’nat bante bet noralew
BeEgziabher chernet fiqr eyetedegefku

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 1
ነፍሴን መለሳት ከጥፋት ወጥመድ
ስለስሙ መራኝ በፅድቅ መንገድ
ባለፍኩም ጊዜ በሞት ጥላ ስር
ክፉውን አልፈራም ነህና ከእኔ ጋር

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 2
በትርህ ምርኩዝህ እነሱ አዳኑኝ
በፊቴም ገበታ አዘጋጀህልኝ
በዘይት ቀባኸኝ በደስታ ፀጋ
ፅዋዬም ተረፈ ስኖር ካንተ ጋራ

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 3
ከአዳኝ ወጥመድም እርሱ ያድነኛል
በላባዎቹም ስር ይጋርደኛል
መሸሸጊያዬ ነው በርሱ እታመናለው
እርሱ መጠጊያዬ ከቶ ምን እሆናለው

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 4
ቸርነትህ እና ምህረትህ ዘወትር
ይከተሉኛል በህይወቴ ዘመን
ስለዚህ በፅናት ባንተ ቤት ኖራለው
በእግዚአብሔር ቸርነት ፍቅር እየተደገፍኩ

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል',
        lyrics_transliteration = 'CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 1
Nefsen melesat ket’fat wet’med
Silesmu meragn bets’dq menged
Balefkum gize bemot t’la sir
Kifuwn alferam nehna keene gar

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 2
Betrh mirkuzh enesu adanugn
Befitem gebeta azegajehlgn
Bezeyt qebaኸgn bedesta ts’ega
Ts’wayem terefe sinor kante gara

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 3
Keadagn wet’medm ersu yadnegnal
Belabawochum sir yigardegnal
Mesheshegiyaye new bersu etamenalew
Ersu met’egiyaye keto min ehonalew

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal

VERSE 4
Cherneth ena mihreth zewetr
Yiketelugnal behywete zemen
Silezih bets’nat bante bet noralew
BeEgziabher chernet fiqr eyetedegefku

CHORUS
Egziabher eregnaye new
Yemiyasch’enqegn keto mindn new
Belemeleme mesk yasadregnal
Beereft wiha zend yimeragnal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0aaeccd7-8f48-4390-b806-192b527f2567'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 1
ነፍሴን መለሳት ከጥፋት ወጥመድ
ስለስሙ መራኝ በፅድቅ መንገድ
ባለፍኩም ጊዜ በሞት ጥላ ስር
ክፉውን አልፈራም ነህና ከእኔ ጋር

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 2
በትርህ ምርኩዝህ እነሱ አዳኑኝ
በፊቴም ገበታ አዘጋጀህልኝ
በዘይት ቀባኸኝ በደስታ ፀጋ
ፅዋዬም ተረፈ ስኖር ካንተ ጋራ

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 3
ከአዳኝ ወጥመድም እርሱ ያድነኛል
በላባዎቹም ስር ይጋርደኛል
መሸሸጊያዬ ነው በርሱ እታመናለው
እርሱ መጠጊያዬ ከቶ ምን እሆናለው

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል

VERSE 4
ቸርነትህ እና ምህረትህ ዘወትር
ይከተሉኛል በህይወቴ ዘመን
ስለዚህ በፅናት ባንተ ቤት ኖራለው
በእግዚአብሔር ቸርነት ፍቅር እየተደገፍኩ

CHORUS
እግዚአብሔር እረኛዬ ነው
የሚያስጨንቀኝ ከቶ ምንድን ነው
በለመለመ መስክ ያሳድረኛል
በእረፍት ውሃ ዘንድ ይመራኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0aaeccd7-8f48-4390-b806-192b527f2567'::uuid, 'egiziabiher-eregnaye-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yene-geta ("Yene Geta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2bd78c0e-e483-47df-9759-561a29ec6c66'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 1
ስጋት መከራዬ ይነቀል ከልቤ
ጭንቀትን ይነቅላል እርጋታን ይተክላል
ቃልህ ስልጣን አለው ያፈርሳል ይሰራል
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 2
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሃደኝ ቃልህ
የኔ ጌታ
ችግሬ ታላቅ ነው አይበል ከንፈሬ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 3
ታላቅነትህን ልንገር ለችግሬ
ጠላቴ ፊት ስቆም ፊትህ ተንበርክኬ
የድል ነው ዘመኔ የድል ነው ታሪኬ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 4
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
ዝናብ ታመጣለህ ባይኖርም ደመና

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 5
በረከትን ልጥገብ እሽ ልበልና
ያደረክላትን ልንገራት ለነፍሴ
ልጠማ ጧት ማታ ልሰማ በመንፈሴ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 6
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
በፊትህ ምንድነው የሴረኞች ስራ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 7
ቃልህ ጉልበት አለው ይኖዳል ተራራ
በእርሱ መዶሻነት በደሌ ሲመታ
ጫጫታው ያልፍና ይሰፍናል ፀጥታ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 8
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
አያፍረኝ አይፈራኝ ቃልህ መስታወቴ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 9
ሁሌ ይነግረኛል ስለማንነቴ
ወዴት እንደወደኩ ወዴትስ እንዳለሁ
ሽንገላን በማያውቅ በቃልህ አውቃለሁ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 1
Sigat mekeraye yineqel kelbe
Ch’nqetn yineqlal ergatan yiteklal
Qalh silt’an alew yafersal yiseral
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 2
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahadegn qalh
Yene Geta
Chgre talaq new aybel kenfere

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 3
Talaqnethn linger lechgre
T’elate fit siqom fith tenberkke
Yedl new zemene yedl new tarike
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 4
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Zinab tamet’aleh baynorm demena

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 5
Bereketn lit’geb esh libelna
Yadereklatn lingerat lenefse
Lit’ema t’wat mata lisema bemenfese
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 6
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Befith mindnew yeseregnoch sira

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 7
Qalh gulbet alew yinodal terara
Beersu medoshanet bedele simeta
Ch’ach’ataw yalfna yisefnal ts’et’ta
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 8
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Ayafregn ayferagn qalh mestawete

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 9
Hule yinegregnal silemannete
Wedet endewedeku wedets endalehu
Shngelan bemayawq beqalh awqalehu

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 1
ስጋት መከራዬ ይነቀል ከልቤ
ጭንቀትን ይነቅላል እርጋታን ይተክላል
ቃልህ ስልጣን አለው ያፈርሳል ይሰራል
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 2
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሃደኝ ቃልህ
የኔ ጌታ
ችግሬ ታላቅ ነው አይበል ከንፈሬ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 3
ታላቅነትህን ልንገር ለችግሬ
ጠላቴ ፊት ስቆም ፊትህ ተንበርክኬ
የድል ነው ዘመኔ የድል ነው ታሪኬ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 4
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
ዝናብ ታመጣለህ ባይኖርም ደመና

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 5
በረከትን ልጥገብ እሽ ልበልና
ያደረክላትን ልንገራት ለነፍሴ
ልጠማ ጧት ማታ ልሰማ በመንፈሴ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 6
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
በፊትህ ምንድነው የሴረኞች ስራ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 7
ቃልህ ጉልበት አለው ይኖዳል ተራራ
በእርሱ መዶሻነት በደሌ ሲመታ
ጫጫታው ያልፍና ይሰፍናል ፀጥታ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 8
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
አያፍረኝ አይፈራኝ ቃልህ መስታወቴ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 9
ሁሌ ይነግረኛል ስለማንነቴ
ወዴት እንደወደኩ ወዴትስ እንዳለሁ
ሽንገላን በማያውቅ በቃልህ አውቃለሁ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ',
        lyrics_transliteration = 'CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 1
Sigat mekeraye yineqel kelbe
Ch’nqetn yineqlal ergatan yiteklal
Qalh silt’an alew yafersal yiseral
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 2
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahadegn qalh
Yene Geta
Chgre talaq new aybel kenfere

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 3
Talaqnethn linger lechgre
T’elate fit siqom fith tenberkke
Yedl new zemene yedl new tarike
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 4
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Zinab tamet’aleh baynorm demena

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 5
Bereketn lit’geb esh libelna
Yadereklatn lingerat lenefse
Lit’ema t’wat mata lisema bemenfese
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 6
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Befith mindnew yeseregnoch sira

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 7
Qalh gulbet alew yinodal terara
Beersu medoshanet bedele simeta
Ch’ach’ataw yalfna yisefnal ts’et’ta
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 8
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Ayafregn ayferagn qalh mestawete

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 9
Hule yinegregnal silemannete
Wedet endewedeku wedets endalehu
Shngelan bemayawq beqalh awqalehu

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2bd78c0e-e483-47df-9759-561a29ec6c66'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 1
ስጋት መከራዬ ይነቀል ከልቤ
ጭንቀትን ይነቅላል እርጋታን ይተክላል
ቃልህ ስልጣን አለው ያፈርሳል ይሰራል
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 2
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሃደኝ ቃልህ
የኔ ጌታ
ችግሬ ታላቅ ነው አይበል ከንፈሬ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 3
ታላቅነትህን ልንገር ለችግሬ
ጠላቴ ፊት ስቆም ፊትህ ተንበርክኬ
የድል ነው ዘመኔ የድል ነው ታሪኬ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 4
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
ዝናብ ታመጣለህ ባይኖርም ደመና

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 5
በረከትን ልጥገብ እሽ ልበልና
ያደረክላትን ልንገራት ለነፍሴ
ልጠማ ጧት ማታ ልሰማ በመንፈሴ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 6
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
በፊትህ ምንድነው የሴረኞች ስራ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 7
ቃልህ ጉልበት አለው ይኖዳል ተራራ
በእርሱ መዶሻነት በደሌ ሲመታ
ጫጫታው ያልፍና ይሰፍናል ፀጥታ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 8
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
አያፍረኝ አይፈራኝ ቃልህ መስታወቴ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 9
ሁሌ ይነግረኛል ስለማንነቴ
ወዴት እንደወደኩ ወዴትስ እንዳለሁ
ሽንገላን በማያውቅ በቃልህ አውቃለሁ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2bd78c0e-e483-47df-9759-561a29ec6c66'::uuid, 'yene-geta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ayinoche-madanun-ayitewalina ("Ayinoche Madanun Ayitewalina")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'dcb7800a-da20-4f0a-8c9c-90ac0ff3be6f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ሀያሉ ጌታችን ቸሩ እግዚአብሔር
ቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አዝ።።።።።።።።።።።።።።።።።።።።፡።።።።።።።

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉር አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሀሌ ሎያ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 3
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
የተናቅን ስንሆን እኛን ሊያከብር ወዶ
በፍቅሩ አከበረን እራሱን አዋርዶ
ምን አይነት ፍቅር ነው ፍጹም ምህረት

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
በንህፅና ፀንተሽ ቤተ መቅደስ የኖርሽ
በእቱም ድንግልና መድሀኒትን ወለድሽ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 5
የአለምን ሀጥያት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 1
Heyalu Getachen cheru Egziabher
Betelhem washa beziya begrgm
Tewelede zare Medhanealem
CHORUS

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 2
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet
Kebedel gurangur anesan ketbiya
Beandnet enzemr enbel hele loya

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 3
CHORUS
Yetenaqn sinhon egnan liyakebr wedo
Befqru akeberen erasun awardo
Min aynet fiqr new fits’um mihret

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 4
Yeamlak meweled bekebtoch beret
CHORUS
Benhts’na ts’entesh bete meqdes yenorsh
Beetum dingilina medhenitn weledsh

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 5
Yealemn het’yat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ሀያሉ ጌታችን ቸሩ እግዚአብሔር
ቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አዝ።።።።።።።።።።።።።።።።።።።።፡።።።።።።።

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉር አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሀሌ ሎያ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 3
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
የተናቅን ስንሆን እኛን ሊያከብር ወዶ
በፍቅሩ አከበረን እራሱን አዋርዶ
ምን አይነት ፍቅር ነው ፍጹም ምህረት

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
በንህፅና ፀንተሽ ቤተ መቅደስ የኖርሽ
በእቱም ድንግልና መድሀኒትን ወለድሽ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 5
የአለምን ሀጥያት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር',
        lyrics_transliteration = 'CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 1
Heyalu Getachen cheru Egziabher
Betelhem washa beziya begrgm
Tewelede zare Medhanealem
CHORUS

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 2
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet
Kebedel gurangur anesan ketbiya
Beandnet enzemr enbel hele loya

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 3
CHORUS
Yetenaqn sinhon egnan liyakebr wedo
Befqru akeberen erasun awardo
Min aynet fiqr new fits’um mihret

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 4
Yeamlak meweled bekebtoch beret
CHORUS
Benhts’na ts’entesh bete meqdes yenorsh
Beetum dingilina medhenitn weledsh

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 5
Yealemn het’yat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'dcb7800a-da20-4f0a-8c9c-90ac0ff3be6f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ሀያሉ ጌታችን ቸሩ እግዚአብሔር
ቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አዝ።።።።።።።።።።።።።።።።።።።።፡።።።።።።።

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉር አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሀሌ ሎያ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 3
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
የተናቅን ስንሆን እኛን ሊያከብር ወዶ
በፍቅሩ አከበረን እራሱን አዋርዶ
ምን አይነት ፍቅር ነው ፍጹም ምህረት

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
በንህፅና ፀንተሽ ቤተ መቅደስ የኖርሽ
በእቱም ድንግልና መድሀኒትን ወለድሽ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 5
የአለምን ሀጥያት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'dcb7800a-da20-4f0a-8c9c-90ac0ff3be6f'::uuid, 'ayinoche-madanun-ayitewalina', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hidu-ngeru-awru-lealem ("Hidu Ngeru")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9eb32207-0523-48f7-b8b8-7dc1f553d02e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በእርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን እምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 2
ዳንን የምንለው

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 4
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 6
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘህ ዘንድ ከቶ አልቻለም
ኃይለኛውን በኃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የእኛ ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 8
ከፍ በል በእልልታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 9
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 10
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 11
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 12
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 13
ማቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰከር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 14
ዕጹብ ያንተ ስራ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 15
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 16
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 17
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 18
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 19
መስክሩለት የምስራች ነው ታላቅ ዜና
መላዕክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሁናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወኅኒ ቤቱ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 20
ከበረውን ምቱ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 21
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 22
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 23
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 1
Gedayu mot beersu dil mensat tewatena
Senseletien qenberien tekaw bebegena
Mot hoy mewgiyah yetal eyaln emnzemrew

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 2
Mesqelh tor smh gashachn honoln new
Dann yemnlew
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 3
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 4
Az:
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 5
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 6
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 7
Teshagrenal slashagerken lezelalem
Bemeqabr mot yyzeh zend keto alchalem
Haylegnawn behayl asrekhew layfeta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 8
Zemernlh ashenafi neh yeegna gieta
Kef bel beellta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 9
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 10
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 11
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 12
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Mato madan leman techlwal kante beqer

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 13
Gietneth srah ynoral simeseker
Wedajie hoy wbeth wb new yemiyabera
Techeneqe tenqeteqete telat fera

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 14
Etsub yante sra
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 15
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 16
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 17
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 18
Mahtemun yefeta yetnsaiew gieta
Meskrulet yemsrach new talaq ziena
Melaektu nech lebsewal dl newna

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 19
Ketemawa andach hunalech belielitu
Bezmarie tenqeteqete wehni bietu
Keberewn mtu

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 20
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 21
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 22
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 23
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በእርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን እምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 2
ዳንን የምንለው

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 4
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 6
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘህ ዘንድ ከቶ አልቻለም
ኃይለኛውን በኃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የእኛ ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 8
ከፍ በል በእልልታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 9
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 10
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 11
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 12
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 13
ማቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰከር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 14
ዕጹብ ያንተ ስራ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 15
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 16
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 17
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 18
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 19
መስክሩለት የምስራች ነው ታላቅ ዜና
መላዕክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሁናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወኅኒ ቤቱ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 20
ከበረውን ምቱ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 21
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 22
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 23
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ',
        lyrics_transliteration = 'CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 1
Gedayu mot beersu dil mensat tewatena
Senseletien qenberien tekaw bebegena
Mot hoy mewgiyah yetal eyaln emnzemrew

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 2
Mesqelh tor smh gashachn honoln new
Dann yemnlew
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 3
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 4
Az:
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 5
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 6
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 7
Teshagrenal slashagerken lezelalem
Bemeqabr mot yyzeh zend keto alchalem
Haylegnawn behayl asrekhew layfeta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 8
Zemernlh ashenafi neh yeegna gieta
Kef bel beellta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 9
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 10
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 11
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 12
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Mato madan leman techlwal kante beqer

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 13
Gietneth srah ynoral simeseker
Wedajie hoy wbeth wb new yemiyabera
Techeneqe tenqeteqete telat fera

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 14
Etsub yante sra
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 15
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 16
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 17
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 18
Mahtemun yefeta yetnsaiew gieta
Meskrulet yemsrach new talaq ziena
Melaektu nech lebsewal dl newna

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 19
Ketemawa andach hunalech belielitu
Bezmarie tenqeteqete wehni bietu
Keberewn mtu

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 20
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 21
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 22
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 23
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9eb32207-0523-48f7-b8b8-7dc1f553d02e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በእርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን እምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 2
ዳንን የምንለው

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 4
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 6
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘህ ዘንድ ከቶ አልቻለም
ኃይለኛውን በኃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የእኛ ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 8
ከፍ በል በእልልታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 9
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 10
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 11
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 12
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 13
ማቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰከር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 14
ዕጹብ ያንተ ስራ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 15
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 16
አዝ፡
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 17
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 18
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 19
መስክሩለት የምስራች ነው ታላቅ ዜና
መላዕክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሁናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወኅኒ ቤቱ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 20
ከበረውን ምቱ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 21
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 22
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

VERSE 23
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ለዓለም
ተነሥቷል በዚህ የለም/፪/ መድኃኔ አለም
ሞት የማይችለው የበረታ ኃያል ነው የማይረታ
ማኅተሙን የፈታ የትንሳኤው ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 1
Gedayu mot beersu dil mensat tewatena
Senseletien qenberien tekaw bebegena
Mot hoy mewgiyah yetal eyaln emnzemrew

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 2
Mesqelh tor smh gashachn honoln new
Dann yemnlew
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 3
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 4
Az:
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 5
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 6
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 7
Teshagrenal slashagerken lezelalem
Bemeqabr mot yyzeh zend keto alchalem
Haylegnawn behayl asrekhew layfeta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 8
Zemernlh ashenafi neh yeegna gieta
Kef bel beellta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 9
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 10
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 11
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 12
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Mato madan leman techlwal kante beqer

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 13
Gietneth srah ynoral simeseker
Wedajie hoy wbeth wb new yemiyabera
Techeneqe tenqeteqete telat fera

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 14
Etsub yante sra
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 15
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Az:

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 16
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 17
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 18
Mahtemun yefeta yetnsaiew gieta
Meskrulet yemsrach new talaq ziena
Melaektu nech lebsewal dl newna

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 19
Ketemawa andach hunalech belielitu
Bezmarie tenqeteqete wehni bietu
Keberewn mtu

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 20
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 21
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 22
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta
Hidu ngeru awru lealem

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

VERSE 23
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta

CHORUS
Hidu ngeru awru lealem
Tenestwal bezih yelem /2/ Medhanie Alem
Mot yemaychilew yebereta hayal new yemayreta
Mahtemun yefeta yetnsaiew gieta';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9eb32207-0523-48f7-b8b8-7dc1f553d02e'::uuid, 'hidu-ngeru-awru-lealem', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yihichin-amet-tewegn ("Yihichin Amet Tewegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a026392e-f6c6-492f-b6ce-7ae4305ccbc4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 4
እንዳው ፈስሶ ቀረ።
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ።
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ።
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ።
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት።
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 1
Zarem salafera eshohn abqye derqe t’ebeqkugn
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem neger gin yih hulu alarmh alegn alleyegnm kealem
Yematslechegn hoy tenesche eskqom ebakh tagesegn
Yeenen kifat tewew melakhn semteh yihchin amet tewegn.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 2
Awqalehu tawqaleh qet’eron set’che endemalakebr
Bizu gize aqje bizu gize ziche bewere endemqer
Zendros endalkugn amna yihen gize semteኸgn nebere
Minm sallewet’ zendroye alfo beadis teqeyere.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 3
Fire yemaywet’agn enen bemekotkot ejochh dekemu
Ene gin alehugn zarem albeqagnm behat’iat metamemu
Yeqalhn wiha bedngay lijh lay sattakt sitafes zemen teqot’ere
Wede libe sayserg hiyweten saylewt’

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 4
Endaw fesso qere.
Qalhn t’egbe eyagesahut new leloch eskisemu
Beqalh menor gin alyazh alegn kebedegn qelemu
Bizu t’qs agegnehu keqdus mets’hefh gelch’e ayche

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 5
Kerase lay bicha and t’qs at’ahugn bebedel tegnche.
Wit’ete dekama timhrt yemayserts’egn temari bihonm
Yihchin amet tewegn degmo tinsh limar tagesegn ahunm
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 6
Yaferut Kidusan yefreachew shta meaza endidersegn.
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera
Man yitagesegnal t’elat eyehonkut ayseru sisera
Atawt’agn kebeth bizu bota alyzm fire silelelegn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn.
Botas yemiyzut bale migbarochu qidusanh nachew
Lik ende zenbaba yetenzheregege tegadlo ts’dqachew
Kelibanos zigba ejgun yebeza gedl tirufatachew.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 8
Ene aydelehum botas yemtyzew yantew enat nat
Sirochwa bemdr ch’afochwa besemay sidersu yayenat
Yihchin amet tewegn kesrwa ehonalehu bafera minalbat.
Yihchin amet tewegn ebakh amlake and amet minh nat

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 9
Shi amet and qen aydelem wey leante amet imnt nat
Yihe amet alfo dagm amet sit’egn eskemlh dires
Ebakhn Geta yihchin amet tewegn yewegun endaders.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 4
እንዳው ፈስሶ ቀረ።
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ።
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ።
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ።
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት።
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ',
        lyrics_transliteration = 'CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 1
Zarem salafera eshohn abqye derqe t’ebeqkugn
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem neger gin yih hulu alarmh alegn alleyegnm kealem
Yematslechegn hoy tenesche eskqom ebakh tagesegn
Yeenen kifat tewew melakhn semteh yihchin amet tewegn.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 2
Awqalehu tawqaleh qet’eron set’che endemalakebr
Bizu gize aqje bizu gize ziche bewere endemqer
Zendros endalkugn amna yihen gize semteኸgn nebere
Minm sallewet’ zendroye alfo beadis teqeyere.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 3
Fire yemaywet’agn enen bemekotkot ejochh dekemu
Ene gin alehugn zarem albeqagnm behat’iat metamemu
Yeqalhn wiha bedngay lijh lay sattakt sitafes zemen teqot’ere
Wede libe sayserg hiyweten saylewt’

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 4
Endaw fesso qere.
Qalhn t’egbe eyagesahut new leloch eskisemu
Beqalh menor gin alyazh alegn kebedegn qelemu
Bizu t’qs agegnehu keqdus mets’hefh gelch’e ayche

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 5
Kerase lay bicha and t’qs at’ahugn bebedel tegnche.
Wit’ete dekama timhrt yemayserts’egn temari bihonm
Yihchin amet tewegn degmo tinsh limar tagesegn ahunm
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 6
Yaferut Kidusan yefreachew shta meaza endidersegn.
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera
Man yitagesegnal t’elat eyehonkut ayseru sisera
Atawt’agn kebeth bizu bota alyzm fire silelelegn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn.
Botas yemiyzut bale migbarochu qidusanh nachew
Lik ende zenbaba yetenzheregege tegadlo ts’dqachew
Kelibanos zigba ejgun yebeza gedl tirufatachew.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 8
Ene aydelehum botas yemtyzew yantew enat nat
Sirochwa bemdr ch’afochwa besemay sidersu yayenat
Yihchin amet tewegn kesrwa ehonalehu bafera minalbat.
Yihchin amet tewegn ebakh amlake and amet minh nat

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 9
Shi amet and qen aydelem wey leante amet imnt nat
Yihe amet alfo dagm amet sit’egn eskemlh dires
Ebakhn Geta yihchin amet tewegn yewegun endaders.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a026392e-f6c6-492f-b6ce-7ae4305ccbc4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 4
እንዳው ፈስሶ ቀረ።
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ።
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ።
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ።
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት።
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a026392e-f6c6-492f-b6ce-7ae4305ccbc4'::uuid, 'yihichin-amet-tewegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wede-hiywet-menged ("wede hiywet menged")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0d825ee0-60dd-4e04-852c-6cb2475534a0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ

VERSE 1
በእርሱ ደስ ይለኛል
ሳቀርብ ዘማሬ ፪
ጉልበት ሁሉ ላንተ
በፍርሃት ይሰግዳል

CHORUS
ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ

VERSE 2
ጉልበት ሁሉ ላንተ
በፍራሃት ይሰግዳል
ምሕረትን አድለኝ
ፈጣሪ ቸል አትበል ፪

CHORUS
ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wede hiywet menged yimeragnal Geta 2
Bech’elemaw menged enda nigelata 2
Fet’ariye bicha new
Hiywetena kibre

VERSE 1
Beersu des yilegnal
Saqerb zemare 2
Gulbet hulu lante
Befrhat yisegdal

CHORUS
Wede hiywet menged yimeragnal Geta 2
Bech’elemaw menged enda nigelata 2
Fet’ariye bicha new
Hiywetena kibre

VERSE 2
Gulbet hulu lante
Befrahat yisegdal
Mihretn adlegn
Fet’ari chel atbel 2

CHORUS
Wede hiywet menged yimeragnal Geta 2
Bech’elemaw menged enda nigelata 2
Fet’ariye bicha new
Hiywetena kibre'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ

VERSE 1
በእርሱ ደስ ይለኛል
ሳቀርብ ዘማሬ ፪
ጉልበት ሁሉ ላንተ
በፍርሃት ይሰግዳል

CHORUS
ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ

VERSE 2
ጉልበት ሁሉ ላንተ
በፍራሃት ይሰግዳል
ምሕረትን አድለኝ
ፈጣሪ ቸል አትበል ፪

CHORUS
ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ',
        lyrics_transliteration = 'CHORUS
Wede hiywet menged yimeragnal Geta 2
Bech’elemaw menged enda nigelata 2
Fet’ariye bicha new
Hiywetena kibre

VERSE 1
Beersu des yilegnal
Saqerb zemare 2
Gulbet hulu lante
Befrhat yisegdal

CHORUS
Wede hiywet menged yimeragnal Geta 2
Bech’elemaw menged enda nigelata 2
Fet’ariye bicha new
Hiywetena kibre

VERSE 2
Gulbet hulu lante
Befrahat yisegdal
Mihretn adlegn
Fet’ari chel atbel 2

CHORUS
Wede hiywet menged yimeragnal Geta 2
Bech’elemaw menged enda nigelata 2
Fet’ariye bicha new
Hiywetena kibre',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0d825ee0-60dd-4e04-852c-6cb2475534a0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ

VERSE 1
በእርሱ ደስ ይለኛል
ሳቀርብ ዘማሬ ፪
ጉልበት ሁሉ ላንተ
በፍርሃት ይሰግዳል

CHORUS
ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ

VERSE 2
ጉልበት ሁሉ ላንተ
በፍራሃት ይሰግዳል
ምሕረትን አድለኝ
ፈጣሪ ቸል አትበል ፪

CHORUS
ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0d825ee0-60dd-4e04-852c-6cb2475534a0'::uuid, 'wede-hiywet-menged', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
