-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 23 OF 32
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
  -- zema-dawit-mezmur ("Zema Dawit Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e09762f7-4c69-4168-9dc1-ed639e138bc5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 1
የሰማይ ሰራዊት ኀይላት ስልጣናት
ምስጋና ይሰዋሉ ለእግዚአብሔር መንግስት
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 2
ፍርዱ የተቃና መኮንነ ጽድቅ
ዙፋኑ ተከቧል በእሳት መብረቅ
ዓለማትን ፈጥሮ ፍጥረቱን ይገዛል
ማእበል ነፋሳቱም ለእርሱ ይታዘዛል

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 3
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ
በዘመናት ሁሉ የሸመገለ ነው
መንግስቱ ለትውልድ ጽድቁም ለልጅ ልጅ ነው

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 4
የቀሚሱ ዘርፎች መቅደሱን ሞልቶታል
በረጅም ዙፋን ላይ ኢሳይያስ አይቶታል
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 5
የተርሴስ የዓረብ የሳባ ነገሥታት
አምኃ ያቀርባሉ ለፈጣሪ ስብሐት
የነገሥታት ንጉሥ የጌቶች ጌታ ነው
ከአማልእክት እርሱን የለም የሚመስለው

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 6
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 1
Yesemay serawit heylat silt’anat
Misgana yisewalu leEgziabher mengst
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 2
Firdu yeteqana mekonne ts’dq
Zufanu tekebwal beesat mebreq
Alematn fet’ro fit’retun yigezal
Maebel nefasatum leersu yitazezal

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 3
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale
Bezemenat hulu yeshemegele new
Mengstu letwld ts’dqum lelj lij new

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 4
Yeqemisu zerfoch meqdesun moltotal
Berejm zufan lay isayyas aytotal
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 5
Yeterses yeareb yesaba negestat
Amha yaqerbalu lefet’ari sibhet
Yenegestat nigus yegetoch Geta new
Keamalekt ersun yelem yemimeslew

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 6
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 1
የሰማይ ሰራዊት ኀይላት ስልጣናት
ምስጋና ይሰዋሉ ለእግዚአብሔር መንግስት
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 2
ፍርዱ የተቃና መኮንነ ጽድቅ
ዙፋኑ ተከቧል በእሳት መብረቅ
ዓለማትን ፈጥሮ ፍጥረቱን ይገዛል
ማእበል ነፋሳቱም ለእርሱ ይታዘዛል

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 3
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ
በዘመናት ሁሉ የሸመገለ ነው
መንግስቱ ለትውልድ ጽድቁም ለልጅ ልጅ ነው

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 4
የቀሚሱ ዘርፎች መቅደሱን ሞልቶታል
በረጅም ዙፋን ላይ ኢሳይያስ አይቶታል
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 5
የተርሴስ የዓረብ የሳባ ነገሥታት
አምኃ ያቀርባሉ ለፈጣሪ ስብሐት
የነገሥታት ንጉሥ የጌቶች ጌታ ነው
ከአማልእክት እርሱን የለም የሚመስለው

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 6
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም',
        lyrics_transliteration = 'CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 1
Yesemay serawit heylat silt’anat
Misgana yisewalu leEgziabher mengst
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 2
Firdu yeteqana mekonne ts’dq
Zufanu tekebwal beesat mebreq
Alematn fet’ro fit’retun yigezal
Maebel nefasatum leersu yitazezal

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 3
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale
Bezemenat hulu yeshemegele new
Mengstu letwld ts’dqum lelj lij new

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 4
Yeqemisu zerfoch meqdesun moltotal
Berejm zufan lay isayyas aytotal
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 5
Yeterses yeareb yesaba negestat
Amha yaqerbalu lefet’ari sibhet
Yenegestat nigus yegetoch Geta new
Keamalekt ersun yelem yemimeslew

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 6
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e09762f7-4c69-4168-9dc1-ed639e138bc5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 1
የሰማይ ሰራዊት ኀይላት ስልጣናት
ምስጋና ይሰዋሉ ለእግዚአብሔር መንግስት
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 2
ፍርዱ የተቃና መኮንነ ጽድቅ
ዙፋኑ ተከቧል በእሳት መብረቅ
ዓለማትን ፈጥሮ ፍጥረቱን ይገዛል
ማእበል ነፋሳቱም ለእርሱ ይታዘዛል

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 3
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ
በዘመናት ሁሉ የሸመገለ ነው
መንግስቱ ለትውልድ ጽድቁም ለልጅ ልጅ ነው

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 4
የቀሚሱ ዘርፎች መቅደሱን ሞልቶታል
በረጅም ዙፋን ላይ ኢሳይያስ አይቶታል
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 5
የተርሴስ የዓረብ የሳባ ነገሥታት
አምኃ ያቀርባሉ ለፈጣሪ ስብሐት
የነገሥታት ንጉሥ የጌቶች ጌታ ነው
ከአማልእክት እርሱን የለም የሚመስለው

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 6
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e09762f7-4c69-4168-9dc1-ed639e138bc5'::uuid, 'zema-dawit-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amilake-esirael-2414 ("Amilake Esirael")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd8ac141d-edbb-4add-abaa-d62d05b6325a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 1
> (አዝ)
> ክብርህን ሳየው እጅግ እጠግባለሁ
> በረከት ሆነህ ጓዳዬን ሞላኸው
> የአምላኬ ሥራ ሁሌም ይደንቀኛል

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 2
> እንዳንተ ያለ ከወዴት ይገኛል?
> (አዝ)
> ውለታህ ብዙ ተነግሮ አያልቅም
> ኃጢያተኛ ነው ብለህ ሰው አትንቅም

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 3
> ጠላት ሊወግረኝ ድንጋይን ቢያነሳ
> አንተ ሆንክልኝ ከባቴ አበሳ
> (አዝ)
> በደልን ከድኖ ሞገስን የሚሰጥ

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 4
> ከተኩላ መሐል ልጆቹን የሚመርጥ
> ማን እንደ ጌታ ርህሩህ አለና
> እስኪ ለስሙ ላቅርብ ምስጋና
> (አዝ)

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 5
> ምህረትህ በዝቷል ለእኔ ያደረከው
> የኃጢአቴን ቅርፈት ከእኔ አስወገድከው
> ላመስግን አንተን ባለውለታዬን
> አትረፍርፈሃል በረከት ጓዳዬን

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 1
> (az)
> kibrhn sayew ejg et’egbalehu
> bereket honeh gwadayen molaኸw
> yeamlake sira hulem yidenqegnal

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 2
> endante yale kewedet yigegnal?
> (az)
> wiletah bizu tenegro ayalqm
> hat’iyategna new bileh sew atnqm

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 3
> t’elat liwegregn dingayn biyanesa
> ante honklgn kebate abesa
> (az)
> bedeln kedno mogesn yemiset’

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 4
> ketekula mehel lijochun yemimert’
> man ende Geta rihruh alena
> eski lesmu laqrb misgana
> (az)

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 5
> mihreth beztwal leene yaderekew
> yehat’iaten qirfet keene aswegedkew
> lamesgn anten balewletayen
> atrefrfehal bereket gwadayen

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 1
> (አዝ)
> ክብርህን ሳየው እጅግ እጠግባለሁ
> በረከት ሆነህ ጓዳዬን ሞላኸው
> የአምላኬ ሥራ ሁሌም ይደንቀኛል

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 2
> እንዳንተ ያለ ከወዴት ይገኛል?
> (አዝ)
> ውለታህ ብዙ ተነግሮ አያልቅም
> ኃጢያተኛ ነው ብለህ ሰው አትንቅም

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 3
> ጠላት ሊወግረኝ ድንጋይን ቢያነሳ
> አንተ ሆንክልኝ ከባቴ አበሳ
> (አዝ)
> በደልን ከድኖ ሞገስን የሚሰጥ

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 4
> ከተኩላ መሐል ልጆቹን የሚመርጥ
> ማን እንደ ጌታ ርህሩህ አለና
> እስኪ ለስሙ ላቅርብ ምስጋና
> (አዝ)

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 5
> ምህረትህ በዝቷል ለእኔ ያደረከው
> የኃጢአቴን ቅርፈት ከእኔ አስወገድከው
> ላመስግን አንተን ባለውለታዬን
> አትረፍርፈሃል በረከት ጓዳዬን

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?',
        lyrics_transliteration = 'CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 1
> (az)
> kibrhn sayew ejg et’egbalehu
> bereket honeh gwadayen molaኸw
> yeamlake sira hulem yidenqegnal

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 2
> endante yale kewedet yigegnal?
> (az)
> wiletah bizu tenegro ayalqm
> hat’iyategna new bileh sew atnqm

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 3
> t’elat liwegregn dingayn biyanesa
> ante honklgn kebate abesa
> (az)
> bedeln kedno mogesn yemiset’

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 4
> ketekula mehel lijochun yemimert’
> man ende Geta rihruh alena
> eski lesmu laqrb misgana
> (az)

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 5
> mihreth beztwal leene yaderekew
> yehat’iaten qirfet keene aswegedkew
> lamesgn anten balewletayen
> atrefrfehal bereket gwadayen

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd8ac141d-edbb-4add-abaa-d62d05b6325a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 1
> (አዝ)
> ክብርህን ሳየው እጅግ እጠግባለሁ
> በረከት ሆነህ ጓዳዬን ሞላኸው
> የአምላኬ ሥራ ሁሌም ይደንቀኛል

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 2
> እንዳንተ ያለ ከወዴት ይገኛል?
> (አዝ)
> ውለታህ ብዙ ተነግሮ አያልቅም
> ኃጢያተኛ ነው ብለህ ሰው አትንቅም

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 3
> ጠላት ሊወግረኝ ድንጋይን ቢያነሳ
> አንተ ሆንክልኝ ከባቴ አበሳ
> (አዝ)
> በደልን ከድኖ ሞገስን የሚሰጥ

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 4
> ከተኩላ መሐል ልጆቹን የሚመርጥ
> ማን እንደ ጌታ ርህሩህ አለና
> እስኪ ለስሙ ላቅርብ ምስጋና
> (አዝ)

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 5
> ምህረትህ በዝቷል ለእኔ ያደረከው
> የኃጢአቴን ቅርፈት ከእኔ አስወገድከው
> ላመስግን አንተን ባለውለታዬን
> አትረፍርፈሃል በረከት ጓዳዬን

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd8ac141d-edbb-4add-abaa-d62d05b6325a'::uuid, 'amilake-esirael-2414', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tilant-yasalefkegn ("Tilant yasalefkegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd93d3e76-3d9d-4d17-9564-e5695dfcf4ce'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 1
መከራ ቢቆም ከፊቴ
እለት ከእለት ቢሆን ድክመቴ
ለሚያልፍ ቢያለፋን እንጂ
ባርኮቴ አይጎልም ከእጄ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 2
አለቅም አለቅም
ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 3
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ወጥኔ
ተስፋ አልቆርጥብምህ መድኔ
ፈተና ሰይፉን ቢያነሳ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 4
ጠላት በቁጣ ቢያገሳ
ጨለማ ቢደቀን ፊቴ
አንተ አተወኝም አባቴ
አለቅም አለቅም ሰላሜ ካንተ አይጎልም

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 5
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 6
ተስፋ አልቆርጥም መድኔ(2)
ስደት ብወጣ ለእንጀራ
በጣር ብጎርሰው በመከራ
ባንተ እንደሚያልፍ አውቃለሁ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 7
የሆነው ሁሉ ለበጎ ነው
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 8
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)
ተስፋ አልቆርጥም መድኔ(2)
ከጄ ቢበተን የያዝኩት

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 9
ጀርባ ቢሰጠኝ ያመንኩት
ባንተ ማለፌን አምናለሁ
ጭንቀቴን ፊትህ
ጥያለሁ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 10
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 11
ቢሆንም ባይሆንም ውጥኔ (2)
ተስፋ አልቆርጥም መድኔ(2)

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 1
Mekera biqom kefite
Elet keelet bihon dikmete
Lemiyalf biyalefan enji
Barkote aygolm keeje

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 2
Aleqm aleqm
Selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 3
Negenm alsegam eyaleh
Bihonm bayhonm wet’ne
Tesfa alqort’bmh medne
Fetena seyfun biyanesa

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 4
T’elat bequt’a biyagesa
Ch’elema bideqen fite
Ante atewegnm abate
Aleqm aleqm selame kante aygolm

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 5
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh
Negenm alsegam eyaleh
Bihonm bayhonm wit’ne (2)

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 6
Tesfa alqort’m medne (2)
Sidet biwet’a leenjera
Bet’ar bigorsew bemekera
Bante endemiyalf awqalehu

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 7
Yehonew hulu lebego new
Aleqm aleqm selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 8
Negenm alsegam eyaleh
Bihonm bayhonm wit’ne (2)
Tesfa alqort’m medne (2)
Keje bibeten yeyazkut

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 9
Jerba biset’egn yamenkut
Bante malefen amnalehu
Ch’nqeten fith
T’yalehu

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 10
Aleqm aleqm selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh
Negenm alsegam eyaleh

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 11
Bihonm bayhonm wit’ne (2)
Tesfa alqort’m medne (2)

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 1
መከራ ቢቆም ከፊቴ
እለት ከእለት ቢሆን ድክመቴ
ለሚያልፍ ቢያለፋን እንጂ
ባርኮቴ አይጎልም ከእጄ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 2
አለቅም አለቅም
ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 3
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ወጥኔ
ተስፋ አልቆርጥብምህ መድኔ
ፈተና ሰይፉን ቢያነሳ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 4
ጠላት በቁጣ ቢያገሳ
ጨለማ ቢደቀን ፊቴ
አንተ አተወኝም አባቴ
አለቅም አለቅም ሰላሜ ካንተ አይጎልም

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 5
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 6
ተስፋ አልቆርጥም መድኔ(2)
ስደት ብወጣ ለእንጀራ
በጣር ብጎርሰው በመከራ
ባንተ እንደሚያልፍ አውቃለሁ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 7
የሆነው ሁሉ ለበጎ ነው
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 8
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)
ተስፋ አልቆርጥም መድኔ(2)
ከጄ ቢበተን የያዝኩት

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 9
ጀርባ ቢሰጠኝ ያመንኩት
ባንተ ማለፌን አምናለሁ
ጭንቀቴን ፊትህ
ጥያለሁ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 10
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 11
ቢሆንም ባይሆንም ውጥኔ (2)
ተስፋ አልቆርጥም መድኔ(2)

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)',
        lyrics_transliteration = 'CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 1
Mekera biqom kefite
Elet keelet bihon dikmete
Lemiyalf biyalefan enji
Barkote aygolm keeje

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 2
Aleqm aleqm
Selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 3
Negenm alsegam eyaleh
Bihonm bayhonm wet’ne
Tesfa alqort’bmh medne
Fetena seyfun biyanesa

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 4
T’elat bequt’a biyagesa
Ch’elema bideqen fite
Ante atewegnm abate
Aleqm aleqm selame kante aygolm

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 5
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh
Negenm alsegam eyaleh
Bihonm bayhonm wit’ne (2)

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 6
Tesfa alqort’m medne (2)
Sidet biwet’a leenjera
Bet’ar bigorsew bemekera
Bante endemiyalf awqalehu

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 7
Yehonew hulu lebego new
Aleqm aleqm selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 8
Negenm alsegam eyaleh
Bihonm bayhonm wit’ne (2)
Tesfa alqort’m medne (2)
Keje bibeten yeyazkut

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 9
Jerba biset’egn yamenkut
Bante malefen amnalehu
Ch’nqeten fith
T’yalehu

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 10
Aleqm aleqm selame kante aygolm
Alama behuneta kibre neh yene Geta
Tilant yasalefkegn ante neh
Negenm alsegam eyaleh

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)

VERSE 11
Bihonm bayhonm wit’ne (2)
Tesfa alqort’m medne (2)

CHORUS
Tilant yasalefkegn ante neh
Negenm alsegam eyalek
Bihonm bayhonm wet’ne (2)
Tesfa alqort’bhm medne (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd93d3e76-3d9d-4d17-9564-e5695dfcf4ce'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 1
መከራ ቢቆም ከፊቴ
እለት ከእለት ቢሆን ድክመቴ
ለሚያልፍ ቢያለፋን እንጂ
ባርኮቴ አይጎልም ከእጄ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 2
አለቅም አለቅም
ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 3
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ወጥኔ
ተስፋ አልቆርጥብምህ መድኔ
ፈተና ሰይፉን ቢያነሳ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 4
ጠላት በቁጣ ቢያገሳ
ጨለማ ቢደቀን ፊቴ
አንተ አተወኝም አባቴ
አለቅም አለቅም ሰላሜ ካንተ አይጎልም

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 5
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 6
ተስፋ አልቆርጥም መድኔ(2)
ስደት ብወጣ ለእንጀራ
በጣር ብጎርሰው በመከራ
ባንተ እንደሚያልፍ አውቃለሁ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 7
የሆነው ሁሉ ለበጎ ነው
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 8
ነገንም አልሰጋም እያለህ
ቢሆንም ባይሆንም ውጥኔ(2)
ተስፋ አልቆርጥም መድኔ(2)
ከጄ ቢበተን የያዝኩት

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 9
ጀርባ ቢሰጠኝ ያመንኩት
ባንተ ማለፌን አምናለሁ
ጭንቀቴን ፊትህ
ጥያለሁ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 10
አለቅም አለቅም ሰላሜ ካንተ አይጎልም
አላማ በሁኔታ ክብሬ ነህ የኔ ጌታ
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለህ

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)

VERSE 11
ቢሆንም ባይሆንም ውጥኔ (2)
ተስፋ አልቆርጥም መድኔ(2)

CHORUS
ትላንት ያሳለፍከኝ አንተ ነህ
ነገንም አልሰጋም እያለክ
ቢሆንም ባይሆንም ወጥኔ(2)
ተስፋ አልቆርጥብህም መድኔ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd93d3e76-3d9d-4d17-9564-e5695dfcf4ce'::uuid, 'tilant-yasalefkegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemari-besufkad-andargacew-adis-zimare-yikirita-new-tesifaye-zemari-besu ("Zemari Besufkad Andargacew-adis Zimare_yikirita New Tesifaye Zemari Besufikad Anidarigachew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'dc6087ec-e6b0-46d3-8819-085305934191'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 1
መጣብኝ መርዶ ነጋሪ
የሃጥያት ስራ አባሪ
አንተን እንዳላይ ሊያደርገኝ
ናልኝ ጌታዬ አድነኝ

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 2
ምርኩዜ ከእጄ አምልጦ
አነባሁ በትሬ ጎብጦ
ጌታዬ እርዳኝ እባክህን
ዘመኔ አልፎ ሳላዝን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 3
አፅናኝ እሻለሁኝ ተድላ
ላግኘው የአንተን ጥላ
አድለኝ የንስሃ ኤድሜን
ልልበሰው ልዩ ምረትክን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 4
የዛሉ ክዶች ይበርቱ
ሰይጣናት ባንተ ይመቱ
ልቅመሰው ጣፋጭ ፍቅርህን
ላመስግን ላውጅ ስራህን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 5
ማእዶት ሆነልኝ ልበል
ባህሪህ ምህረት ነው ልዑል
መሀሪው ምሮኛል እዩኝ
ስባዝን በምረት አይቶኝ

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 1
Met’abgn merdo negari
Yehat’yat sira abari
Anten endalay liyadergegn
Nalgn Getaye adnegn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 2
Mirkuze keeje amlt’o
Anebahu betre gobt’o
Getaye erdagn ebakhn
Zemene alfo salazn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 3
Ats’nagn eshalehugn tedla
Laggnew yeanten t’la
Adlegn yensha edmen
Lilbesew liyu miretkn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 4
Yezalu kidoch yibertu
Seyt’anat bante yimetu
Liqmesew t’afach’ fiqrhn
Lamesgn lawj sirahn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 5
Maedot honelgn libel
Bahrih mihret new liul
Meheriw mirognal eyugn
Sibazn bemret aytogn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 1
መጣብኝ መርዶ ነጋሪ
የሃጥያት ስራ አባሪ
አንተን እንዳላይ ሊያደርገኝ
ናልኝ ጌታዬ አድነኝ

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 2
ምርኩዜ ከእጄ አምልጦ
አነባሁ በትሬ ጎብጦ
ጌታዬ እርዳኝ እባክህን
ዘመኔ አልፎ ሳላዝን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 3
አፅናኝ እሻለሁኝ ተድላ
ላግኘው የአንተን ጥላ
አድለኝ የንስሃ ኤድሜን
ልልበሰው ልዩ ምረትክን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 4
የዛሉ ክዶች ይበርቱ
ሰይጣናት ባንተ ይመቱ
ልቅመሰው ጣፋጭ ፍቅርህን
ላመስግን ላውጅ ስራህን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 5
ማእዶት ሆነልኝ ልበል
ባህሪህ ምህረት ነው ልዑል
መሀሪው ምሮኛል እዩኝ
ስባዝን በምረት አይቶኝ

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ',
        lyrics_transliteration = 'CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 1
Met’abgn merdo negari
Yehat’yat sira abari
Anten endalay liyadergegn
Nalgn Getaye adnegn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 2
Mirkuze keeje amlt’o
Anebahu betre gobt’o
Getaye erdagn ebakhn
Zemene alfo salazn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 3
Ats’nagn eshalehugn tedla
Laggnew yeanten t’la
Adlegn yensha edmen
Lilbesew liyu miretkn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 4
Yezalu kidoch yibertu
Seyt’anat bante yimetu
Liqmesew t’afach’ fiqrhn
Lamesgn lawj sirahn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 5
Maedot honelgn libel
Bahrih mihret new liul
Meheriw mirognal eyugn
Sibazn bemret aytogn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'dc6087ec-e6b0-46d3-8819-085305934191'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 1
መጣብኝ መርዶ ነጋሪ
የሃጥያት ስራ አባሪ
አንተን እንዳላይ ሊያደርገኝ
ናልኝ ጌታዬ አድነኝ

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 2
ምርኩዜ ከእጄ አምልጦ
አነባሁ በትሬ ጎብጦ
ጌታዬ እርዳኝ እባክህን
ዘመኔ አልፎ ሳላዝን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 3
አፅናኝ እሻለሁኝ ተድላ
ላግኘው የአንተን ጥላ
አድለኝ የንስሃ ኤድሜን
ልልበሰው ልዩ ምረትክን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 4
የዛሉ ክዶች ይበርቱ
ሰይጣናት ባንተ ይመቱ
ልቅመሰው ጣፋጭ ፍቅርህን
ላመስግን ላውጅ ስራህን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 5
ማእዶት ሆነልኝ ልበል
ባህሪህ ምህረት ነው ልዑል
መሀሪው ምሮኛል እዩኝ
ስባዝን በምረት አይቶኝ

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'dc6087ec-e6b0-46d3-8819-085305934191'::uuid, 'zemari-besufkad-andargacew-adis-zimare-yikirita-new-tesifaye-zemari-besu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lemaryam-negeni ("Lemaryam Negeni")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'df93e91d-c941-40ef-a990-cccb9ff0e445'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 1
ካህናት በመቅደስ የሚያገለግሏት
ታቦተ ሚስጥሩ የቅዱስ ቃል እናት
የክህነት መኣዛ የሽቷቸው ሙዳይ
የእጣኑ ማእጠንት ሰዋሰው የአዶናይ(፪)

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 2
በአሚነ ዚአሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 3
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላኤ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 4
በኣሚነ ዚኣሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 5
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትንቢቱ
ጽዮን ጽይወናችን ሐዲሲቷ ሐምር
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 6
በአሚነ ዚአሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 1
Kahnat bemeqdes yemiyageleglwat
Tabote mist’ru yeqdus qal enat
Yekhnet meaza yeshtwachew muday
Yeet’anu maet’ent sewasew yeadonay (2)

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 2
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 3
Esrael kesdet kegbts’ sidnu
Talaqun ej aytew bemuse endamenu
Kets’elae senay gizot lamelet’n
Yetamenech enat kemesqel teset’en

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 4
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 5
Leerswa kaltegeza hizbuna mengstu
Fets’mo yit’efal yilal betnbitu
Ts’yon ts’ywenachn hedisitwa hemr
Yetesfaw fits’ame sisay nat sisay nat left’ur

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 6
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 1
ካህናት በመቅደስ የሚያገለግሏት
ታቦተ ሚስጥሩ የቅዱስ ቃል እናት
የክህነት መኣዛ የሽቷቸው ሙዳይ
የእጣኑ ማእጠንት ሰዋሰው የአዶናይ(፪)

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 2
በአሚነ ዚአሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 3
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላኤ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 4
በኣሚነ ዚኣሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 5
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትንቢቱ
ጽዮን ጽይወናችን ሐዲሲቷ ሐምር
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 6
በአሚነ ዚአሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)',
        lyrics_transliteration = 'CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 1
Kahnat bemeqdes yemiyageleglwat
Tabote mist’ru yeqdus qal enat
Yekhnet meaza yeshtwachew muday
Yeet’anu maet’ent sewasew yeadonay (2)

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 2
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 3
Esrael kesdet kegbts’ sidnu
Talaqun ej aytew bemuse endamenu
Kets’elae senay gizot lamelet’n
Yetamenech enat kemesqel teset’en

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 4
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 5
Leerswa kaltegeza hizbuna mengstu
Fets’mo yit’efal yilal betnbitu
Ts’yon ts’ywenachn hedisitwa hemr
Yetesfaw fits’ame sisay nat sisay nat left’ur

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 6
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'df93e91d-c941-40ef-a990-cccb9ff0e445'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 1
ካህናት በመቅደስ የሚያገለግሏት
ታቦተ ሚስጥሩ የቅዱስ ቃል እናት
የክህነት መኣዛ የሽቷቸው ሙዳይ
የእጣኑ ማእጠንት ሰዋሰው የአዶናይ(፪)

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 2
በአሚነ ዚአሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 3
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላኤ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 4
በኣሚነ ዚኣሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 5
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትንቢቱ
ጽዮን ጽይወናችን ሐዲሲቷ ሐምር
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 6
በአሚነ ዚአሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'df93e91d-c941-40ef-a990-cccb9ff0e445'::uuid, 'lemaryam-negeni', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ete-musheraye ("Ete musheraye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'dfde91b2-5ec0-4195-a1cb-684bf9f0935d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 1
እኔም ልበልሽ እናቴ
ድንግል ሆይ ግቢ በቤቴ (2)
ሁሉም ሰው ለራሱ ወንበር ሲዘርጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 2
ድንግል እንዳባርያ ውሃ ተሸከመሽ
ጌታን በትሀትና ታገለግያለሽ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 3
እመቤታችን ርሀርተ ሀለና (2)
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሃርና በወርቅ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 4
ጌታ ግን ወደደሽ አናቴ ነሽ አለ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ ደመና
እመበታችን ርሀርተ ሀሊና (2)

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 5
ኣሳድጎሽ ሳለ መላኩ መግቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ
እጅግ በትሀትና ስላገለገልሽው
እንደ ኪሩብ መላከ ጌታን ተሸከምሽው

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 6
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመብውታችን ርሀርተ ሀሊና (2)
የባርያውን ውርደት ተመለከተልና

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 7
ለወለድሽው ነጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱ ሆኖ አይደለም
ብፅዕት እንላለን እኛም ለዘላለም

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 1
Enem libelsh enate
Dingil hoy gibi bebete (2)
Hulum sew lerasu wenber sizerga
Yekbrn shlmat lerasu siyast’ega

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 2
Dingil endabarya wiha teshekemesh
Getan bethetna tagelegyalesh
Ney bedemena ney bedemena
Ney bedemena ney bedemena

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 3
Emebetachen riherte helena (2)
Werqe zebo lebsew bebetu kemolut
Beharna bewerq ketenqot’eqot’ut
Besew fit yamaru bizu honew sale

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 4
Geta gin wededesh anate nesh ale
Ney bedemena ney bedemena
Ney bedemena ney demena
Emebetachn riherte helina (2)

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 5
Asadgosh sale melaku megbo
Teshelmesh sale beztolsh tewhbo
Ejg bethetna silagelegelshw
Ende kirub melake getan teshekemshw

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 6
Ney bedemena ney bedemena
Ney bedemena ney bedemena
Emebwtachn riherte helina (2)
Yebaryawn wirdet temeleketelna

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 7
Leweledshw negus yidresew misgana
Kelb yewet’a enji kentu hono aydelem
Bits’et enlalen egnam lezelalem

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 1
እኔም ልበልሽ እናቴ
ድንግል ሆይ ግቢ በቤቴ (2)
ሁሉም ሰው ለራሱ ወንበር ሲዘርጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 2
ድንግል እንዳባርያ ውሃ ተሸከመሽ
ጌታን በትሀትና ታገለግያለሽ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 3
እመቤታችን ርሀርተ ሀለና (2)
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሃርና በወርቅ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 4
ጌታ ግን ወደደሽ አናቴ ነሽ አለ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ ደመና
እመበታችን ርሀርተ ሀሊና (2)

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 5
ኣሳድጎሽ ሳለ መላኩ መግቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ
እጅግ በትሀትና ስላገለገልሽው
እንደ ኪሩብ መላከ ጌታን ተሸከምሽው

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 6
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመብውታችን ርሀርተ ሀሊና (2)
የባርያውን ውርደት ተመለከተልና

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 7
ለወለድሽው ነጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱ ሆኖ አይደለም
ብፅዕት እንላለን እኛም ለዘላለም

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ',
        lyrics_transliteration = 'CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 1
Enem libelsh enate
Dingil hoy gibi bebete (2)
Hulum sew lerasu wenber sizerga
Yekbrn shlmat lerasu siyast’ega

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 2
Dingil endabarya wiha teshekemesh
Getan bethetna tagelegyalesh
Ney bedemena ney bedemena
Ney bedemena ney bedemena

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 3
Emebetachen riherte helena (2)
Werqe zebo lebsew bebetu kemolut
Beharna bewerq ketenqot’eqot’ut
Besew fit yamaru bizu honew sale

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 4
Geta gin wededesh anate nesh ale
Ney bedemena ney bedemena
Ney bedemena ney demena
Emebetachn riherte helina (2)

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 5
Asadgosh sale melaku megbo
Teshelmesh sale beztolsh tewhbo
Ejg bethetna silagelegelshw
Ende kirub melake getan teshekemshw

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 6
Ney bedemena ney bedemena
Ney bedemena ney bedemena
Emebwtachn riherte helina (2)
Yebaryawn wirdet temeleketelna

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 7
Leweledshw negus yidresew misgana
Kelb yewet’a enji kentu hono aydelem
Bits’et enlalen egnam lezelalem

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'dfde91b2-5ec0-4195-a1cb-684bf9f0935d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 1
እኔም ልበልሽ እናቴ
ድንግል ሆይ ግቢ በቤቴ (2)
ሁሉም ሰው ለራሱ ወንበር ሲዘርጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 2
ድንግል እንዳባርያ ውሃ ተሸከመሽ
ጌታን በትሀትና ታገለግያለሽ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 3
እመቤታችን ርሀርተ ሀለና (2)
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሃርና በወርቅ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 4
ጌታ ግን ወደደሽ አናቴ ነሽ አለ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ ደመና
እመበታችን ርሀርተ ሀሊና (2)

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 5
ኣሳድጎሽ ሳለ መላኩ መግቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ
እጅግ በትሀትና ስላገለገልሽው
እንደ ኪሩብ መላከ ጌታን ተሸከምሽው

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 6
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመብውታችን ርሀርተ ሀሊና (2)
የባርያውን ውርደት ተመለከተልና

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 7
ለወለድሽው ነጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱ ሆኖ አይደለም
ብፅዕት እንላለን እኛም ለዘላለም

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'dfde91b2-5ec0-4195-a1cb-684bf9f0935d'::uuid, 'ete-musheraye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cheru-hoy ("Cheru Hoy")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e0cac119-525c-407f-85cf-20d1148c8c0f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 1
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል
ቸሩ ሆይ ምንም ነገር የለም

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 2
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደድከን
ቸሩ ሆይ ፈልገህ ጠራህን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 3
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 4
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 5
ቸሩ ሆይ በከብቶች ማደሪያ
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 6
ቸሩ ሆይ እልል በሉ ሰዎች
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሐት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 1
Cheru hoy leayne siwr meri
Cheru hoy mirkuz memekiya neh
Cheru hoy anten yemimesl
Cheru hoy minm neger yelem

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 2
Cheru hoy mihretna fiqrh
Cheru hoy wesen weder yelew
Cheru hoy sanwedh wededken
Cheru hoy felgeh t’erahn

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 3
Cheru hoy semteh edalsemah
Cheru hoy ayteh endalayeh
Cheru hoy hulun talfewaleh
Cheru hoy fiqrawi abat neh

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 4
Cheru hoy Amanuel Geta
Cheru hoy cheru fet’ariyachn
Cheru hoy wiletah bizu new
Cheru hoy leegna yewalkln

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 5
Cheru hoy bekebtoch maderiya
Cheru hoy beziyach tinsh girgm
Cheru hoy teweldo adanen
Cheru hoy Geta Medhanealem

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 6
Cheru hoy ell belu sewoch
Cheru hoy and lay zemeru
Cheru hoy sibhet leEgziabher
Cheru hoy bearyam belu

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 1
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል
ቸሩ ሆይ ምንም ነገር የለም

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 2
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደድከን
ቸሩ ሆይ ፈልገህ ጠራህን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 3
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 4
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 5
ቸሩ ሆይ በከብቶች ማደሪያ
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 6
ቸሩ ሆይ እልል በሉ ሰዎች
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሐት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና',
        lyrics_transliteration = 'CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 1
Cheru hoy leayne siwr meri
Cheru hoy mirkuz memekiya neh
Cheru hoy anten yemimesl
Cheru hoy minm neger yelem

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 2
Cheru hoy mihretna fiqrh
Cheru hoy wesen weder yelew
Cheru hoy sanwedh wededken
Cheru hoy felgeh t’erahn

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 3
Cheru hoy semteh edalsemah
Cheru hoy ayteh endalayeh
Cheru hoy hulun talfewaleh
Cheru hoy fiqrawi abat neh

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 4
Cheru hoy Amanuel Geta
Cheru hoy cheru fet’ariyachn
Cheru hoy wiletah bizu new
Cheru hoy leegna yewalkln

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 5
Cheru hoy bekebtoch maderiya
Cheru hoy beziyach tinsh girgm
Cheru hoy teweldo adanen
Cheru hoy Geta Medhanealem

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana

VERSE 6
Cheru hoy ell belu sewoch
Cheru hoy and lay zemeru
Cheru hoy sibhet leEgziabher
Cheru hoy bearyam belu

CHORUS
Cheru hoy cheru hoy nana
Cheru hoy Amanuel nana
Yeesrael mena cheru hoy nana
Cheru hoy Medhanealem nana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e0cac119-525c-407f-85cf-20d1148c8c0f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 1
ቸሩ ሆይ ለዓይነ ስውር መሪ
ቸሩ ሆይ ምርኩዝ መመኪያ ነህ
ቸሩ ሆይ አንተን የሚመስል
ቸሩ ሆይ ምንም ነገር የለም

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 2
ቸሩ ሆይ ምሕረትና ፍቅርህ
ቸሩ ሆይ ወሰን ወደር የለው
ቸሩ ሆይ ሳንወድህ ወደድከን
ቸሩ ሆይ ፈልገህ ጠራህን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 3
ቸሩ ሆይ ሰምተህ እዳልሰማህ
ቸሩ ሆይ አይተህ እንዳላየህ
ቸሩ ሆይ ሁሉን ታልፈዋለህ
ቸሩ ሆይ ፍቅራዊ አባት ነህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 4
ቸሩ ሆይ አማኑኤል ጌታ
ቸሩ ሆይ ቸሩ ፈጣሪያችን
ቸሩ ሆይ ውለታህ ብዙ ነው
ቸሩ ሆይ ለእኛ የዋልክልን

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 5
ቸሩ ሆይ በከብቶች ማደሪያ
ቸሩ ሆይ በዚያች ትንሽ ግርግም
ቸሩ ሆይ ተወልዶ አዳነን
ቸሩ ሆይ ጌታ መድኃኔዓለም

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና

VERSE 6
ቸሩ ሆይ እልል በሉ ሰዎች
ቸሩ ሆይ አንድ ላይ ዘመሩ
ቸሩ ሆይ ስብሐት ለእግዚአብሔር
ቸሩ ሆይ በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
ቸሩ ሆይ አማኑኤል ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔዓለም ናና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e0cac119-525c-407f-85cf-20d1148c8c0f'::uuid, 'cheru-hoy', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- melisegn-limeles ("Melisegn Limeles")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e1fb6018-1d68-4b1a-941d-74a48a0327bf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 1
ስንት ጊዜ አልተወኩም ወደ ኋላ አየዋት ደግሜ
ምንኛ ከንቱ ነኝ ሳልለወጥ ባለሁበት ቆሜ
ይነዳል ከተማው ይቃጠላል በቁጣ
እጄን ይዘህ አውጣኝ ዞር ሳልደርስ ጌታዬ እንዳልሞት

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 2
ጨው አልባ ቢሆን በምን ይጣፍጣል
አጣፍጠኝ በቃልህ ከደጅ እንዳልጣል
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 3
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ሆኛለው ተሰንቄ አስራ ያሰረችኝ
ስሸሽ አግኝታ ከባህሩ ከጥልቁ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 4
ወፎች ለቅመውትም ቅዱስ ቃልህ የታለ?
ውስጤ አዘገየኝ እንጂ ያ ጠላቴ
መልሰኝ ልመለስ በለቅሶ
አዛኝ በሩን ክፈትልኝ ወደ ቤትህ ልግባ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 5
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 6
ገንዘቤን የሰጠኝን አፍስሼ በችሮታ
ራሴን አገኘሁ አመሻሽ ላይ ከተናቀው ቦታ
ጨልሟል ዙሪያዬ ምይዘውን ነገር አጥቻለሁ
የድሮ አይደለም የኔ ጌታ ዛሬ ደክሚያለሁ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 7
መንገድ ለጠፋው ሰው ክንድ ወዳጅ የለም
ምህረትህ እራሱን ለጣለ አለ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 8
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ማለዳ ስነቃ ዘምሬልህ
ሲመሽ ግን ሌላ ነኝ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 9
ቃልህ ያላወቀኝ ያልቀየረኝ ጌታዬ
ልቤ አይወስንም ያመነታል ይሸሻል አጥብቆ
ሆይ! ዘላለም ላይ እንደላላ
እስከመቼ አንተ ተደብቀህ?

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 10
እንዲወስን እርዳኝ ይበርታ ጉልበቴ
ጠላት ጭንቅላቱን ይስፋ እቀፈኝ አባቴ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 11
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 12
የተቀበለ በቀራንዮ ያን ሁሉ መከራ
በመስቀሉ ላይ ላንቺ ሲል ነውና
ነፍሴ ሆይ ተዘጋጅተሽ ኑሪ ሁልጊዜ
በነገ በዛሬ እንዳትታለይ እንዳትታለይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 13
ነፍሴ ሆይ በንስሃ ጠምቂ ቀጥተሽ ክቡር ደሙን ጠጪ
ስጋዊን እምቢ ስጋዊን እምቢ
ነፍሴ ሆይ ዘላለም በደስታ እንድትኖሪ
ከዘላለም ቤትሽ መንግስተ ሰማይ መንግስተ ሰማይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 14
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 1
Sint gize altewekum wede hwala ayewat degme
Mingna kentu negn sallewet’ balehubet qome
Yinedal ketemaw yiqat’elal bequt’a
Ejen yizeh awt’agn zor salders Getaye endalmot

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 2
Ch’ew alba bihon bemn yit’aft’al
At’aft’egn beqalh kedej endalt’al
Tinantna keante gar
Zare degmo kelela selchtognal

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 3
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Hognalew tesenqe asra yaserechgn
Sishesh aggnta kebahru ket’lqu

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 4
Wefoch leqmewtm Kidus qalh yetale?
Wist’e azegeyegn enji ya t’elate
Melsegn limeles beleqso
Azagn berun kifetlgn wede beth ligba

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 5
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 6
Genzeben yeset’egnn afsshe bechrota
Rasen agegnehu ameshash lay ketenaqew bota
Ch’elmwal zuriyaye miyzewn neger at’chalehu
Yedro aydelem yene Geta zare dekmiyalehu

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 7
Menged let’efaw sew kind wedaj yelem
Mihreth erasun let’ale ale
Tinantna keante gar
Zare degmo kelela selchtognal

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 8
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Maleda sineqa zemrelh
Simesh gin lela negn

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 9
Qalh yalaweqegn yalqeyeregn Getaye
Libe aywesnm yamenetal yisheshal at’bqo
Hoy! zelalem lay endelala
Eskemeche ante tedebqeh?

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 10
Endiwesn erdagn yiberta gulbete
T’elat ch’nqlatun yisfa eqefegn abate
Tinantna keante gar
Zare degmo kelela selchtognal

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 11
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Nefse hoy nefse hoy
Egziabhern beqn agelgy

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 12
Yeteqebele beqeranyo yan hulu mekera
Bemesqelu lay lanchi sil newna
Nefse hoy tezegajtesh nuri hulgize
Benege bezare endattaley endattaley

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 13
Nefse hoy bensha t’emqi qet’tesh kibur demun t’ech’i
Sigawin embi sigawin embi
Nefse hoy zelalem bedesta endtnori
Kezelalem betsh mengste semay mengste semay

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 14
Nefse hoy nefse hoy
Egziabhern beqn agelgy

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 1
ስንት ጊዜ አልተወኩም ወደ ኋላ አየዋት ደግሜ
ምንኛ ከንቱ ነኝ ሳልለወጥ ባለሁበት ቆሜ
ይነዳል ከተማው ይቃጠላል በቁጣ
እጄን ይዘህ አውጣኝ ዞር ሳልደርስ ጌታዬ እንዳልሞት

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 2
ጨው አልባ ቢሆን በምን ይጣፍጣል
አጣፍጠኝ በቃልህ ከደጅ እንዳልጣል
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 3
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ሆኛለው ተሰንቄ አስራ ያሰረችኝ
ስሸሽ አግኝታ ከባህሩ ከጥልቁ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 4
ወፎች ለቅመውትም ቅዱስ ቃልህ የታለ?
ውስጤ አዘገየኝ እንጂ ያ ጠላቴ
መልሰኝ ልመለስ በለቅሶ
አዛኝ በሩን ክፈትልኝ ወደ ቤትህ ልግባ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 5
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 6
ገንዘቤን የሰጠኝን አፍስሼ በችሮታ
ራሴን አገኘሁ አመሻሽ ላይ ከተናቀው ቦታ
ጨልሟል ዙሪያዬ ምይዘውን ነገር አጥቻለሁ
የድሮ አይደለም የኔ ጌታ ዛሬ ደክሚያለሁ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 7
መንገድ ለጠፋው ሰው ክንድ ወዳጅ የለም
ምህረትህ እራሱን ለጣለ አለ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 8
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ማለዳ ስነቃ ዘምሬልህ
ሲመሽ ግን ሌላ ነኝ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 9
ቃልህ ያላወቀኝ ያልቀየረኝ ጌታዬ
ልቤ አይወስንም ያመነታል ይሸሻል አጥብቆ
ሆይ! ዘላለም ላይ እንደላላ
እስከመቼ አንተ ተደብቀህ?

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 10
እንዲወስን እርዳኝ ይበርታ ጉልበቴ
ጠላት ጭንቅላቱን ይስፋ እቀፈኝ አባቴ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 11
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 12
የተቀበለ በቀራንዮ ያን ሁሉ መከራ
በመስቀሉ ላይ ላንቺ ሲል ነውና
ነፍሴ ሆይ ተዘጋጅተሽ ኑሪ ሁልጊዜ
በነገ በዛሬ እንዳትታለይ እንዳትታለይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 13
ነፍሴ ሆይ በንስሃ ጠምቂ ቀጥተሽ ክቡር ደሙን ጠጪ
ስጋዊን እምቢ ስጋዊን እምቢ
ነፍሴ ሆይ ዘላለም በደስታ እንድትኖሪ
ከዘላለም ቤትሽ መንግስተ ሰማይ መንግስተ ሰማይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 14
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ',
        lyrics_transliteration = 'CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 1
Sint gize altewekum wede hwala ayewat degme
Mingna kentu negn sallewet’ balehubet qome
Yinedal ketemaw yiqat’elal bequt’a
Ejen yizeh awt’agn zor salders Getaye endalmot

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 2
Ch’ew alba bihon bemn yit’aft’al
At’aft’egn beqalh kedej endalt’al
Tinantna keante gar
Zare degmo kelela selchtognal

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 3
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Hognalew tesenqe asra yaserechgn
Sishesh aggnta kebahru ket’lqu

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 4
Wefoch leqmewtm Kidus qalh yetale?
Wist’e azegeyegn enji ya t’elate
Melsegn limeles beleqso
Azagn berun kifetlgn wede beth ligba

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 5
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 6
Genzeben yeset’egnn afsshe bechrota
Rasen agegnehu ameshash lay ketenaqew bota
Ch’elmwal zuriyaye miyzewn neger at’chalehu
Yedro aydelem yene Geta zare dekmiyalehu

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 7
Menged let’efaw sew kind wedaj yelem
Mihreth erasun let’ale ale
Tinantna keante gar
Zare degmo kelela selchtognal

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 8
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Maleda sineqa zemrelh
Simesh gin lela negn

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 9
Qalh yalaweqegn yalqeyeregn Getaye
Libe aywesnm yamenetal yisheshal at’bqo
Hoy! zelalem lay endelala
Eskemeche ante tedebqeh?

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 10
Endiwesn erdagn yiberta gulbete
T’elat ch’nqlatun yisfa eqefegn abate
Tinantna keante gar
Zare degmo kelela selchtognal

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 11
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Nefse hoy nefse hoy
Egziabhern beqn agelgy

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 12
Yeteqebele beqeranyo yan hulu mekera
Bemesqelu lay lanchi sil newna
Nefse hoy tezegajtesh nuri hulgize
Benege bezare endattaley endattaley

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 13
Nefse hoy bensha t’emqi qet’tesh kibur demun t’ech’i
Sigawin embi sigawin embi
Nefse hoy zelalem bedesta endtnori
Kezelalem betsh mengste semay mengste semay

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 14
Nefse hoy nefse hoy
Egziabhern beqn agelgy

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e1fb6018-1d68-4b1a-941d-74a48a0327bf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 1
ስንት ጊዜ አልተወኩም ወደ ኋላ አየዋት ደግሜ
ምንኛ ከንቱ ነኝ ሳልለወጥ ባለሁበት ቆሜ
ይነዳል ከተማው ይቃጠላል በቁጣ
እጄን ይዘህ አውጣኝ ዞር ሳልደርስ ጌታዬ እንዳልሞት

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 2
ጨው አልባ ቢሆን በምን ይጣፍጣል
አጣፍጠኝ በቃልህ ከደጅ እንዳልጣል
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 3
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ሆኛለው ተሰንቄ አስራ ያሰረችኝ
ስሸሽ አግኝታ ከባህሩ ከጥልቁ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 4
ወፎች ለቅመውትም ቅዱስ ቃልህ የታለ?
ውስጤ አዘገየኝ እንጂ ያ ጠላቴ
መልሰኝ ልመለስ በለቅሶ
አዛኝ በሩን ክፈትልኝ ወደ ቤትህ ልግባ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 5
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 6
ገንዘቤን የሰጠኝን አፍስሼ በችሮታ
ራሴን አገኘሁ አመሻሽ ላይ ከተናቀው ቦታ
ጨልሟል ዙሪያዬ ምይዘውን ነገር አጥቻለሁ
የድሮ አይደለም የኔ ጌታ ዛሬ ደክሚያለሁ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 7
መንገድ ለጠፋው ሰው ክንድ ወዳጅ የለም
ምህረትህ እራሱን ለጣለ አለ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 8
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ማለዳ ስነቃ ዘምሬልህ
ሲመሽ ግን ሌላ ነኝ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 9
ቃልህ ያላወቀኝ ያልቀየረኝ ጌታዬ
ልቤ አይወስንም ያመነታል ይሸሻል አጥብቆ
ሆይ! ዘላለም ላይ እንደላላ
እስከመቼ አንተ ተደብቀህ?

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 10
እንዲወስን እርዳኝ ይበርታ ጉልበቴ
ጠላት ጭንቅላቱን ይስፋ እቀፈኝ አባቴ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 11
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 12
የተቀበለ በቀራንዮ ያን ሁሉ መከራ
በመስቀሉ ላይ ላንቺ ሲል ነውና
ነፍሴ ሆይ ተዘጋጅተሽ ኑሪ ሁልጊዜ
በነገ በዛሬ እንዳትታለይ እንዳትታለይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 13
ነፍሴ ሆይ በንስሃ ጠምቂ ቀጥተሽ ክቡር ደሙን ጠጪ
ስጋዊን እምቢ ስጋዊን እምቢ
ነፍሴ ሆይ ዘላለም በደስታ እንድትኖሪ
ከዘላለም ቤትሽ መንግስተ ሰማይ መንግስተ ሰማይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 14
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e1fb6018-1d68-4b1a-941d-74a48a0327bf'::uuid, 'melisegn-limeles', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yebegena-mezimur-yanite-yihun-mirichaye-memihir-abel-tesifaye ("Yebegena Mezimur Yanite Yihun Mirichaye Memihir Abel Tesifaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e70ac174-71b9-418f-8bbd-8e0bd578ef05'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 1
ይጠቅመኛል ምለው መጥፊያዬ ይሆናል
ያለአንተ የያዝኩት ከእጄ ይበተናል
ምንም ብዘገይም ገብቶኛል ምስጢሩ
በአንተ እንጂ በራስ አይቻል መኖሩ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 2
. .
የሰማይ አዕዋፋትን አይቼ ይደንቀኛል
የዕለት ምግባቸውን ከአንተ አግኝተዋል
ሳይዘሩ ሳያጭዱ በአንተማ ከኖሩ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 3
ለኔ ምን ይጠቅመኛል በጭንቀት መኖሩ
በማይጠቅመው ነገር ሲባዝን ይውላል
አልሳካ ሲለው ለምን ለምን ይላል
ሚሳካው በአንተ ነው እቅድና ህልሜ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 4
በማንስ ሆነና ዛሬ ላይ መቆሜ
በአንተ እየተሰጠኝ የዕለት እንጀራ
ታድያ ለምንድን ነው ልቤ እንዲ ሚፈራ
እምነት ጎሎብኝ ነው ባክህ ጨምርልኝ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 5
በአንተ ፍቃድ እንጂ በራሴ መች ኖርኩኝ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 1
Yit’eqmegnal milew met’fiyaye yihonal
Yaleante yeyazkut keeje yibetenal
Minm bizegeym gebtognal mist’iru
Beante enji beras aychal menoru

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 2
. .
Yesemay aewafatn ayche yidenqegnal
Yeelet migbachewn keante aggntewal
Sayzeru sayach’du beantema kenoru

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 3
Lene min yit’eqmegnal bech’nqet menoru
Bemayt’eqmew neger sibazn yiwlal
Alsaka silew lemn lemn yilal
Misakaw beante new eqdna hilme

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 4
Bemans honena zare lay meqome
Beante eyeteset’egn yeelet enjera
Tadya lemndn new libe endi mifera
Emnet golobgn new bakh ch’emrlgn

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 5
Beante fiqad enji berase mech norkugn

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 1
ይጠቅመኛል ምለው መጥፊያዬ ይሆናል
ያለአንተ የያዝኩት ከእጄ ይበተናል
ምንም ብዘገይም ገብቶኛል ምስጢሩ
በአንተ እንጂ በራስ አይቻል መኖሩ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 2
. .
የሰማይ አዕዋፋትን አይቼ ይደንቀኛል
የዕለት ምግባቸውን ከአንተ አግኝተዋል
ሳይዘሩ ሳያጭዱ በአንተማ ከኖሩ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 3
ለኔ ምን ይጠቅመኛል በጭንቀት መኖሩ
በማይጠቅመው ነገር ሲባዝን ይውላል
አልሳካ ሲለው ለምን ለምን ይላል
ሚሳካው በአንተ ነው እቅድና ህልሜ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 4
በማንስ ሆነና ዛሬ ላይ መቆሜ
በአንተ እየተሰጠኝ የዕለት እንጀራ
ታድያ ለምንድን ነው ልቤ እንዲ ሚፈራ
እምነት ጎሎብኝ ነው ባክህ ጨምርልኝ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 5
በአንተ ፍቃድ እንጂ በራሴ መች ኖርኩኝ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ',
        lyrics_transliteration = 'CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 1
Yit’eqmegnal milew met’fiyaye yihonal
Yaleante yeyazkut keeje yibetenal
Minm bizegeym gebtognal mist’iru
Beante enji beras aychal menoru

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 2
. .
Yesemay aewafatn ayche yidenqegnal
Yeelet migbachewn keante aggntewal
Sayzeru sayach’du beantema kenoru

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 3
Lene min yit’eqmegnal bech’nqet menoru
Bemayt’eqmew neger sibazn yiwlal
Alsaka silew lemn lemn yilal
Misakaw beante new eqdna hilme

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 4
Bemans honena zare lay meqome
Beante eyeteset’egn yeelet enjera
Tadya lemndn new libe endi mifera
Emnet golobgn new bakh ch’emrlgn

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 5
Beante fiqad enji berase mech norkugn

CHORUS
Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e70ac174-71b9-418f-8bbd-8e0bd578ef05'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 1
ይጠቅመኛል ምለው መጥፊያዬ ይሆናል
ያለአንተ የያዝኩት ከእጄ ይበተናል
ምንም ብዘገይም ገብቶኛል ምስጢሩ
በአንተ እንጂ በራስ አይቻል መኖሩ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 2
. .
የሰማይ አዕዋፋትን አይቼ ይደንቀኛል
የዕለት ምግባቸውን ከአንተ አግኝተዋል
ሳይዘሩ ሳያጭዱ በአንተማ ከኖሩ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 3
ለኔ ምን ይጠቅመኛል በጭንቀት መኖሩ
በማይጠቅመው ነገር ሲባዝን ይውላል
አልሳካ ሲለው ለምን ለምን ይላል
ሚሳካው በአንተ ነው እቅድና ህልሜ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 4
በማንስ ሆነና ዛሬ ላይ መቆሜ
በአንተ እየተሰጠኝ የዕለት እንጀራ
ታድያ ለምንድን ነው ልቤ እንዲ ሚፈራ
እምነት ጎሎብኝ ነው ባክህ ጨምርልኝ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 5
በአንተ ፍቃድ እንጂ በራሴ መች ኖርኩኝ

CHORUS
ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e70ac174-71b9-418f-8bbd-8e0bd578ef05'::uuid, 'yebegena-mezimur-yanite-yihun-mirichaye-memihir-abel-tesifaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ep-yiheg-fetsame-4192 ("EP Yiheg Fetsame")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e1808e94-0012-4b99-a885-77a2731b7daa'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 1
ሞቱን ፥ የማይሞተው ጌታ፥
ተመልከቱ ጎልጎታ።
ማየ ሕይወት ሲጠማ ፥ ሲገረፍ መሐሪ፥
ደሙ እንደ ጎርፍ ሲወርድ ውኆችን ሰፋሪ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 2
በሚፈርደው ሲፈርድ መስፍን ፍርደ ገምድል፥
ነፍሱን ሲሰጥ እዩት ሕይወትን የሚያድል።
"ልብስህ ለምን ቀላ" ብለህ የጠየቅህ ነቢይ፥
አሻግረህ ብታየው መለስህ በቃል አቢይ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 3
"ዝም አለ ሥግው ቃል በግፍ አደባባይ፥
እያልህ "ተፈወስን በእርሱ ቁስል ሥቃይ"
የጽዮን ደናግል ውጡ ፣ ተመልከቱ፥
አክሊለ ሦክ ደፍታ እስራኤል እናቱ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 4
ሞሸረችው በሠርግ በቀይ ግምጃ ልብሱ፥
እግዚአ ሰሎሞን እነሆ ንጉሡ።
እዩት የምትወዱት ፣ አልቅሱለት ልቅሶን፥
"ለከ ኃይል ወስብሐት" ፥ በሉ "ኪርያላይሶን"፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 5
እንደ ቁጹረ ገጽ በዕንባ ሰባ ዘመን፥
ቢቻለን እንዘን ፣ ቢሳነን እንመን።

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 1
Motun : yemaymotew geta:
Temelketu golgota.
Maye hiywet sit’ema : sigeref meheri:
Demu ende gorf siwerd wihochn sefari:

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 2
Bemiferdew siferd mesfn firde gemdl:
Nefsun siset’ eyut hiywetn yemiyadl.
"libsh lemn qela" bileh yet’eyeqh nebiy:
Ashagreh bitayew melesh beqal abiy:

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 3
"zim ale sigw qal begf adebabay:
Eyalh "tefewesn beersu qusl siqay"
Yets’yon denagl wit’u , temelketu:
Aklile sok defta esrael enatu:

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 4
Mosherechw beserg beqey gimja libsu:
Egzia selomon eneho nigusu.
Eyut yemtwedut , alqsulet liqson:
"leke hayl wesbhet" : belu "kiryalayson":

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 5
Ende quts’ure gets’ beenba seba zemen:
Bichalen enzen , bisanen enmen.

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 1
ሞቱን ፥ የማይሞተው ጌታ፥
ተመልከቱ ጎልጎታ።
ማየ ሕይወት ሲጠማ ፥ ሲገረፍ መሐሪ፥
ደሙ እንደ ጎርፍ ሲወርድ ውኆችን ሰፋሪ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 2
በሚፈርደው ሲፈርድ መስፍን ፍርደ ገምድል፥
ነፍሱን ሲሰጥ እዩት ሕይወትን የሚያድል።
"ልብስህ ለምን ቀላ" ብለህ የጠየቅህ ነቢይ፥
አሻግረህ ብታየው መለስህ በቃል አቢይ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 3
"ዝም አለ ሥግው ቃል በግፍ አደባባይ፥
እያልህ "ተፈወስን በእርሱ ቁስል ሥቃይ"
የጽዮን ደናግል ውጡ ፣ ተመልከቱ፥
አክሊለ ሦክ ደፍታ እስራኤል እናቱ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 4
ሞሸረችው በሠርግ በቀይ ግምጃ ልብሱ፥
እግዚአ ሰሎሞን እነሆ ንጉሡ።
እዩት የምትወዱት ፣ አልቅሱለት ልቅሶን፥
"ለከ ኃይል ወስብሐት" ፥ በሉ "ኪርያላይሶን"፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 5
እንደ ቁጹረ ገጽ በዕንባ ሰባ ዘመን፥
ቢቻለን እንዘን ፣ ቢሳነን እንመን።

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥',
        lyrics_transliteration = 'CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 1
Motun : yemaymotew geta:
Temelketu golgota.
Maye hiywet sit’ema : sigeref meheri:
Demu ende gorf siwerd wihochn sefari:

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 2
Bemiferdew siferd mesfn firde gemdl:
Nefsun siset’ eyut hiywetn yemiyadl.
"libsh lemn qela" bileh yet’eyeqh nebiy:
Ashagreh bitayew melesh beqal abiy:

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 3
"zim ale sigw qal begf adebabay:
Eyalh "tefewesn beersu qusl siqay"
Yets’yon denagl wit’u , temelketu:
Aklile sok defta esrael enatu:

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 4
Mosherechw beserg beqey gimja libsu:
Egzia selomon eneho nigusu.
Eyut yemtwedut , alqsulet liqson:
"leke hayl wesbhet" : belu "kiryalayson":

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 5
Ende quts’ure gets’ beenba seba zemen:
Bichalen enzen , bisanen enmen.

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e1808e94-0012-4b99-a885-77a2731b7daa'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 1
ሞቱን ፥ የማይሞተው ጌታ፥
ተመልከቱ ጎልጎታ።
ማየ ሕይወት ሲጠማ ፥ ሲገረፍ መሐሪ፥
ደሙ እንደ ጎርፍ ሲወርድ ውኆችን ሰፋሪ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 2
በሚፈርደው ሲፈርድ መስፍን ፍርደ ገምድል፥
ነፍሱን ሲሰጥ እዩት ሕይወትን የሚያድል።
"ልብስህ ለምን ቀላ" ብለህ የጠየቅህ ነቢይ፥
አሻግረህ ብታየው መለስህ በቃል አቢይ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 3
"ዝም አለ ሥግው ቃል በግፍ አደባባይ፥
እያልህ "ተፈወስን በእርሱ ቁስል ሥቃይ"
የጽዮን ደናግል ውጡ ፣ ተመልከቱ፥
አክሊለ ሦክ ደፍታ እስራኤል እናቱ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 4
ሞሸረችው በሠርግ በቀይ ግምጃ ልብሱ፥
እግዚአ ሰሎሞን እነሆ ንጉሡ።
እዩት የምትወዱት ፣ አልቅሱለት ልቅሶን፥
"ለከ ኃይል ወስብሐት" ፥ በሉ "ኪርያላይሶን"፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 5
እንደ ቁጹረ ገጽ በዕንባ ሰባ ዘመን፥
ቢቻለን እንዘን ፣ ቢሳነን እንመን።

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e1808e94-0012-4b99-a885-77a2731b7daa'::uuid, 'ep-yiheg-fetsame-4192', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kab-fikri-christos ("kab Fikri Christos")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e6c25932-abb4-43a0-8943-038bb54185fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 1
ከመ ባጊዕ ዝሕረዱ
ናብ ማእሰርቲ ከም ዝወርዱ
ምእንትኡ ተቀቲልና
ግን ትፍቅሩ ኣይለቀና

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 2
ዘሎ ኮነ ተዝመፅእ
በዓል ሓይሊ ትዝገዝእ
ዘይተርኣየ ካሊእ ፍጥረት
ከቶ የለን ፀልማት ወይ ሞት

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 3
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 4
በታ ጎይታ ዘፍቀረና
ካብ ሰዓርቲ በሊፅና ኢና
አብድካምና ሓይልና ኣሎ
በቲ አብ መሰቀል ዝወዓሎ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 5
ፀልማት ኣብኡ አይፅልምትን
ድካም ሰዕረት አይምልከቶን
ሰሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 6
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 7
ፅዬን እያ ኸተማና
ክንኣና እውን ታርሰትና
ብዘይአምኑ ተከቢብና
ጎይታ እግዚአብሔር ነምልኮ ኢና

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 8
ብናይ አበው ቅኑዕ ፍኖት
ሂውታቶም ጌርና አብነት
ንሶም እዬም ዝሰዓሩ
ብእምነቶም ዝነበሩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 9
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 10
በታ ጎይታ ዘፍቀረና
ካብ ስዓርቲበሊፅና ኢና
አብ ድካምና ሓይልና ኣሎ
በቲ አብ መስቀል ዝዋዓሎ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 11
ፀልማት ኣብኡ ኣይፅልምትን
ድካም ስዕረት ኣይምልከቶን
ስሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 1
Keme bagie zihredu
Nab maeserti kem ziwerdu
Mientu teqetilna
Gin tifqru ayleqena

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 2
Zelo kone tezmets’e
Beal hayli tizgeze
Zeyteraye kalie fit’ret
Keto yelen ts’elmat wey mot

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 3
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 4
Beta goyta zefqerena
Kab searti belits’na ina
Abdkamna haylna alo
Beti Ab meseqel ziwealo

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 5
Ts’elmat abu ayts’lmtn
Dikam seeret aymlketon
Semu walta koynna eyu
Baal milue hayli eyu

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 6
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 7
Ts’yen eya ኸtemana
Kinana ewn tarsetna
Bizeyamnu tekebibna
Goyta Egziabher nemlko ina

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 8
Binay abew qinue finot
Hiwtatom gerna abnet
Nisom eyem zisearu
Biemnetom zineberu

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 9
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 10
Beta goyta zefqerena
Kab siartibelits’na ina
Ab dikamna haylna alo
Beti Ab mesqel ziwaalo

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 11
Ts’elmat abu ayts’lmtn
Dikam sieret aymlketon
Simu walta koynna eyu
Baal milue hayli eyu

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 1
ከመ ባጊዕ ዝሕረዱ
ናብ ማእሰርቲ ከም ዝወርዱ
ምእንትኡ ተቀቲልና
ግን ትፍቅሩ ኣይለቀና

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 2
ዘሎ ኮነ ተዝመፅእ
በዓል ሓይሊ ትዝገዝእ
ዘይተርኣየ ካሊእ ፍጥረት
ከቶ የለን ፀልማት ወይ ሞት

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 3
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 4
በታ ጎይታ ዘፍቀረና
ካብ ሰዓርቲ በሊፅና ኢና
አብድካምና ሓይልና ኣሎ
በቲ አብ መሰቀል ዝወዓሎ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 5
ፀልማት ኣብኡ አይፅልምትን
ድካም ሰዕረት አይምልከቶን
ሰሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 6
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 7
ፅዬን እያ ኸተማና
ክንኣና እውን ታርሰትና
ብዘይአምኑ ተከቢብና
ጎይታ እግዚአብሔር ነምልኮ ኢና

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 8
ብናይ አበው ቅኑዕ ፍኖት
ሂውታቶም ጌርና አብነት
ንሶም እዬም ዝሰዓሩ
ብእምነቶም ዝነበሩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 9
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 10
በታ ጎይታ ዘፍቀረና
ካብ ስዓርቲበሊፅና ኢና
አብ ድካምና ሓይልና ኣሎ
በቲ አብ መስቀል ዝዋዓሎ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 11
ፀልማት ኣብኡ ኣይፅልምትን
ድካም ስዕረት ኣይምልከቶን
ስሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)',
        lyrics_transliteration = 'CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 1
Keme bagie zihredu
Nab maeserti kem ziwerdu
Mientu teqetilna
Gin tifqru ayleqena

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 2
Zelo kone tezmets’e
Beal hayli tizgeze
Zeyteraye kalie fit’ret
Keto yelen ts’elmat wey mot

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 3
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 4
Beta goyta zefqerena
Kab searti belits’na ina
Abdkamna haylna alo
Beti Ab meseqel ziwealo

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 5
Ts’elmat abu ayts’lmtn
Dikam seeret aymlketon
Semu walta koynna eyu
Baal milue hayli eyu

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 6
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 7
Ts’yen eya ኸtemana
Kinana ewn tarsetna
Bizeyamnu tekebibna
Goyta Egziabher nemlko ina

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 8
Binay abew qinue finot
Hiwtatom gerna abnet
Nisom eyem zisearu
Biemnetom zineberu

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 9
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Kabta natu fiqriy ayfelyenay eyu (2)

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 10
Beta goyta zefqerena
Kab siartibelits’na ina
Ab dikamna haylna alo
Beti Ab mesqel ziwaalo

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)

VERSE 11
Ts’elmat abu ayts’lmtn
Dikam sieret aymlketon
Simu walta koynna eyu
Baal milue hayli eyu

CHORUS
Kab fiqri kirsetose zifelyena menyu
Kab fiqri Egziabher zifelyena men yu
Ch’nqet do ts’ebeba weyse sedet diyu
Motkwa entekone ayfelyenan eyu (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e6c25932-abb4-43a0-8943-038bb54185fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 1
ከመ ባጊዕ ዝሕረዱ
ናብ ማእሰርቲ ከም ዝወርዱ
ምእንትኡ ተቀቲልና
ግን ትፍቅሩ ኣይለቀና

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 2
ዘሎ ኮነ ተዝመፅእ
በዓል ሓይሊ ትዝገዝእ
ዘይተርኣየ ካሊእ ፍጥረት
ከቶ የለን ፀልማት ወይ ሞት

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 3
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 4
በታ ጎይታ ዘፍቀረና
ካብ ሰዓርቲ በሊፅና ኢና
አብድካምና ሓይልና ኣሎ
በቲ አብ መሰቀል ዝወዓሎ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 5
ፀልማት ኣብኡ አይፅልምትን
ድካም ሰዕረት አይምልከቶን
ሰሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 6
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 7
ፅዬን እያ ኸተማና
ክንኣና እውን ታርሰትና
ብዘይአምኑ ተከቢብና
ጎይታ እግዚአብሔር ነምልኮ ኢና

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 8
ብናይ አበው ቅኑዕ ፍኖት
ሂውታቶም ጌርና አብነት
ንሶም እዬም ዝሰዓሩ
ብእምነቶም ዝነበሩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 9
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ካብታ ናቱ ፍቅሪይ አይፈልየናይ እዩ(2)

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 10
በታ ጎይታ ዘፍቀረና
ካብ ስዓርቲበሊፅና ኢና
አብ ድካምና ሓይልና ኣሎ
በቲ አብ መስቀል ዝዋዓሎ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)

VERSE 11
ፀልማት ኣብኡ ኣይፅልምትን
ድካም ስዕረት ኣይምልከቶን
ስሙ ዋልታ ኮይንና እዩ
ባዓል ምሉእ ሓይሊ እዩ

CHORUS
ካብ ፍቅሪ ክርሰቶሰ ዝፈልየና መንዩ
ካብ ፍቅሪ እግዚአብሔር ዝፈልየና መን ዩ
ጭንቀት ዶ ፀበባ ወይሰ ሰደት ድዩ
ሞትኳ እንተኮነ ኣይፈልየናን እዩ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e6c25932-abb4-43a0-8943-038bb54185fe'::uuid, 'kab-fikri-christos', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ayinoche-madanun-ayitewalina-7zh3ww1ossu ("Ayinoche Madanun Ayitewalina")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e6c4ed83-c27e-4fa1-a3b4-e1159c9a7e19'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ኃያሉ ጌታቸን ቸሩ እግዚአበሔር
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አ.ዝ //

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሎያ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 3
አ.ዝ //
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አ.ዝ //
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 5
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 1
Hayalu getachen cheru egziabeher
Bebetelhem washa beziya begrgm
Tewelede zare Medhanealem
A.z //

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 2
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet
Kebedel gurangun anesan ketbiya
Beandnet enzemr enbel hale loya

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 3
A.z //
Yetenaqn senhon egnan liyakebr wedo
Befqr akeberen erasun awardo
Min aynet fiqr new fits’um mihret

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 4
Yeamlak meweled bekebtoch beret
A.z //
Bents’hna ts’entesh betemeqdes yenorsh
Behetum dingilina medhanitn weledsh

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 5
Yealemn hat’iat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ኃያሉ ጌታቸን ቸሩ እግዚአበሔር
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አ.ዝ //

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሎያ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 3
አ.ዝ //
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አ.ዝ //
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 5
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር',
        lyrics_transliteration = 'CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 1
Hayalu getachen cheru egziabeher
Bebetelhem washa beziya begrgm
Tewelede zare Medhanealem
A.z //

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 2
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet
Kebedel gurangun anesan ketbiya
Beandnet enzemr enbel hale loya

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 3
A.z //
Yetenaqn senhon egnan liyakebr wedo
Befqr akeberen erasun awardo
Min aynet fiqr new fits’um mihret

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 4
Yeamlak meweled bekebtoch beret
A.z //
Bents’hna ts’entesh betemeqdes yenorsh
Behetum dingilina medhanitn weledsh

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 5
Yealemn hat’iat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e6c4ed83-c27e-4fa1-a3b4-e1159c9a7e19'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ኃያሉ ጌታቸን ቸሩ እግዚአበሔር
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አ.ዝ //

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሎያ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 3
አ.ዝ //
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አ.ዝ //
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 5
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e6c4ed83-c27e-4fa1-a3b4-e1159c9a7e19'::uuid, 'ayinoche-madanun-ayitewalina-7zh3ww1ossu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hayalineh-neh-anite-hayal-degu-meliak-gebiriel ("Hayalineh Neh Anite Hayal Degu Meliak Gebiriel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e183f6c2-d9c8-4259-9317-b622c6a7431d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 1
ሊያመልኩት ወደዱ ገብርኤል
አዲስ አዋጅ ወጥቶ ገብርኤል
ሲድራቅና ሚሳቅ አብድናጎብ ጸኑ
ጣዖቱን ረግጠው በእግዚአብሔር አመኑ

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 2
ተቆጣ ንጉሱ ገብርኤል
በሦስቱ ህጻናት ገብርኤል
ጨምሯቸው አለ ገብርኤል
ወደ እቶኑ እሳት ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 3
ከሰማይ ተልኮ ደረሰ መልአኩ
ከሞት አዳናቸው በእሳት ሳይነኩ
ከዕቶኑ ስር ሆነው ገብርኤል
ዝማሬ ተሞሉ ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 4
ገፍተው የጣሏቸው ገብርኤል
በእሳቱ ሲበሉ ገብርኤል
አልተቃጠለችም የራሳቸው ፀጉር
አዩ መኳንንቱ የእግዚአብሔርን ክብር

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 5
ናቡከደነጾር ገብርኤል
እጁን በአፉ ጫነ ገብርኤል
ሠለስቱ ደቂቅን ገብርኤል
ከእሳት ስላዳነ ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 6
ይክበር ጌታ አለ የላከ መላኩን
ሊያመልከው ወደደ ስላየ ማዳኑን

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 1
Liyamelkut wededu Gebriel
Adis awaj wet’to Gebriel
Sidraqna misaq abdnagob ts’enu
T’aotun regt’ew beEgziabher amenu

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 2
Teqot’a nigusu Gebriel
Besostu hits’anat Gebriel
Ch’emrwachew ale Gebriel
Wede etonu esat Gebriel

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 3
Kesemay telko derese melaku
Kemot adanachew beesat sayneku
Keetonu sir honew Gebriel
Zimare temolu Gebriel

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 4
Geftew yet’alwachew Gebriel
Beesatu sibelu Gebriel
Alteqat’elechm yerasachew ts’egur
Ayu mekwanntu yeegziabhern kibir

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 5
Nabukedenets’or Gebriel
Ejun beafu ch’ane Gebriel
Selestu deqiqn Gebriel
Keesat siladane Gebriel

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 6
Yikber Geta ale yelake melakun
Liyamelkew wedede silaye madanun

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 1
ሊያመልኩት ወደዱ ገብርኤል
አዲስ አዋጅ ወጥቶ ገብርኤል
ሲድራቅና ሚሳቅ አብድናጎብ ጸኑ
ጣዖቱን ረግጠው በእግዚአብሔር አመኑ

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 2
ተቆጣ ንጉሱ ገብርኤል
በሦስቱ ህጻናት ገብርኤል
ጨምሯቸው አለ ገብርኤል
ወደ እቶኑ እሳት ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 3
ከሰማይ ተልኮ ደረሰ መልአኩ
ከሞት አዳናቸው በእሳት ሳይነኩ
ከዕቶኑ ስር ሆነው ገብርኤል
ዝማሬ ተሞሉ ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 4
ገፍተው የጣሏቸው ገብርኤል
በእሳቱ ሲበሉ ገብርኤል
አልተቃጠለችም የራሳቸው ፀጉር
አዩ መኳንንቱ የእግዚአብሔርን ክብር

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 5
ናቡከደነጾር ገብርኤል
እጁን በአፉ ጫነ ገብርኤል
ሠለስቱ ደቂቅን ገብርኤል
ከእሳት ስላዳነ ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 6
ይክበር ጌታ አለ የላከ መላኩን
ሊያመልከው ወደደ ስላየ ማዳኑን

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል',
        lyrics_transliteration = 'CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 1
Liyamelkut wededu Gebriel
Adis awaj wet’to Gebriel
Sidraqna misaq abdnagob ts’enu
T’aotun regt’ew beEgziabher amenu

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 2
Teqot’a nigusu Gebriel
Besostu hits’anat Gebriel
Ch’emrwachew ale Gebriel
Wede etonu esat Gebriel

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 3
Kesemay telko derese melaku
Kemot adanachew beesat sayneku
Keetonu sir honew Gebriel
Zimare temolu Gebriel

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 4
Geftew yet’alwachew Gebriel
Beesatu sibelu Gebriel
Alteqat’elechm yerasachew ts’egur
Ayu mekwanntu yeegziabhern kibir

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 5
Nabukedenets’or Gebriel
Ejun beafu ch’ane Gebriel
Selestu deqiqn Gebriel
Keesat siladane Gebriel

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel

VERSE 6
Yikber Geta ale yelake melakun
Liyamelkew wedede silaye madanun

CHORUS
Hayal neh ante hayal degu melake Gebriel (2)
Yiwdeq yishenef t’elat ante teradan beewnet (2)
Bedura meda lay Gebriel
T’aot tezegajto Gebriel',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e183f6c2-d9c8-4259-9317-b622c6a7431d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 1
ሊያመልኩት ወደዱ ገብርኤል
አዲስ አዋጅ ወጥቶ ገብርኤል
ሲድራቅና ሚሳቅ አብድናጎብ ጸኑ
ጣዖቱን ረግጠው በእግዚአብሔር አመኑ

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 2
ተቆጣ ንጉሱ ገብርኤል
በሦስቱ ህጻናት ገብርኤል
ጨምሯቸው አለ ገብርኤል
ወደ እቶኑ እሳት ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 3
ከሰማይ ተልኮ ደረሰ መልአኩ
ከሞት አዳናቸው በእሳት ሳይነኩ
ከዕቶኑ ስር ሆነው ገብርኤል
ዝማሬ ተሞሉ ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 4
ገፍተው የጣሏቸው ገብርኤል
በእሳቱ ሲበሉ ገብርኤል
አልተቃጠለችም የራሳቸው ፀጉር
አዩ መኳንንቱ የእግዚአብሔርን ክብር

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 5
ናቡከደነጾር ገብርኤል
እጁን በአፉ ጫነ ገብርኤል
ሠለስቱ ደቂቅን ገብርኤል
ከእሳት ስላዳነ ገብርኤል

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል

VERSE 6
ይክበር ጌታ አለ የላከ መላኩን
ሊያመልከው ወደደ ስላየ ማዳኑን

CHORUS
ኃያል ነህ አንተ ኃያል ደጉ መልአከ ገብርኤል/2/
ይውደቅ ይሸነፍ ጠላት አንተ ተራዳን በእውነት/2/
በዱራ ሜዳ ላይ ገብርኤል
ጣዖት ተዘጋጅቶ ገብርኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e183f6c2-d9c8-4259-9317-b622c6a7431d'::uuid, 'hayalineh-neh-anite-hayal-degu-meliak-gebiriel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- new-ethiopia-orthodox-tewahedo-mezmur-kine-keafe-fesese-by-zemarit-kidis ("NEW,ethiopia.orthodox Tewahedo Mezmur KINE KEAFE FESESE By Zemarit Kidist Mitiku")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e849dd0e-7f09-4bd3-8239-50f05360c1dc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 1
ህይወት በሞት ተደምድሞ
ሥጋ በነፍሴ ተሹሞ
ጠላት በሴራው ሳይጥለኝ
ድንግል ምልጃሽ ነው ያዳነኝ

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 2
ነጋ ያ ክፋ ጨለማ
ጥልቁ ስምሽን ሲሰማ
መቼም ጠርቼሽ አላፍርም
ጸንቷል ኪዳንሽ ዘለዓለም

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 3
ጎድሎ አያውቅም መዳፌ
ላንቺ ቅኔ ተሰልፌ
ትርፌ በረከቴ ነሽ
አምሳል ወደር የሌለሽ

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 4
ዛሬ ሚያስፈራኝ የለም
ከቦኝ የልጅሽ ሰላም
ትምክህት ጋሻ ሆንሽኛል
ግርማሽ ዙሪያዬን ከቦኛል

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 1
Hiywet bemot tedemdmo
Siga benefse teshumo
T’elat beseraw sayt’legn
Dingil miljash new yadanegn

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 2
Nega ya kifa ch’elema
T’lqu simshn sisema
Mechem t’erchesh alafrm
Ts’entwal kidansh zelealem

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 3
Godlo ayawqm medafe
Lanchi qine teselfe
Tirfe berekete nesh
Amsal weder yelelesh

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 4
Zare miyasferagn yelem
Kebogn yeljsh selam
Timkht gasha honshgnal
Girmash zuriyayen kebognal

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 1
ህይወት በሞት ተደምድሞ
ሥጋ በነፍሴ ተሹሞ
ጠላት በሴራው ሳይጥለኝ
ድንግል ምልጃሽ ነው ያዳነኝ

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 2
ነጋ ያ ክፋ ጨለማ
ጥልቁ ስምሽን ሲሰማ
መቼም ጠርቼሽ አላፍርም
ጸንቷል ኪዳንሽ ዘለዓለም

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 3
ጎድሎ አያውቅም መዳፌ
ላንቺ ቅኔ ተሰልፌ
ትርፌ በረከቴ ነሽ
አምሳል ወደር የሌለሽ

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 4
ዛሬ ሚያስፈራኝ የለም
ከቦኝ የልጅሽ ሰላም
ትምክህት ጋሻ ሆንሽኛል
ግርማሽ ዙሪያዬን ከቦኛል

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ',
        lyrics_transliteration = 'CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 1
Hiywet bemot tedemdmo
Siga benefse teshumo
T’elat beseraw sayt’legn
Dingil miljash new yadanegn

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 2
Nega ya kifa ch’elema
T’lqu simshn sisema
Mechem t’erchesh alafrm
Ts’entwal kidansh zelealem

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 3
Godlo ayawqm medafe
Lanchi qine teselfe
Tirfe berekete nesh
Amsal weder yelelesh

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 4
Zare miyasferagn yelem
Kebogn yeljsh selam
Timkht gasha honshgnal
Girmash zuriyayen kebognal

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e849dd0e-7f09-4bd3-8239-50f05360c1dc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 1
ህይወት በሞት ተደምድሞ
ሥጋ በነፍሴ ተሹሞ
ጠላት በሴራው ሳይጥለኝ
ድንግል ምልጃሽ ነው ያዳነኝ

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 2
ነጋ ያ ክፋ ጨለማ
ጥልቁ ስምሽን ሲሰማ
መቼም ጠርቼሽ አላፍርም
ጸንቷል ኪዳንሽ ዘለዓለም

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 3
ጎድሎ አያውቅም መዳፌ
ላንቺ ቅኔ ተሰልፌ
ትርፌ በረከቴ ነሽ
አምሳል ወደር የሌለሽ

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 4
ዛሬ ሚያስፈራኝ የለም
ከቦኝ የልጅሽ ሰላም
ትምክህት ጋሻ ሆንሽኛል
ግርማሽ ዙሪያዬን ከቦኛል

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e849dd0e-7f09-4bd3-8239-50f05360c1dc'::uuid, 'new-ethiopia-orthodox-tewahedo-mezmur-kine-keafe-fesese-by-zemarit-kidis', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- abel-mekibib-weret-yelelew ("Abel Mekibib Weret Yelelew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e8f4797e-a84e-4cde-9231-2e6b8b426059'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 1
ያለው እግዚአብሔር /2/
ዘመን የማይዘው ጊዜ የማይገድበው
ያንተ ፍቅር ብቻ ቀን በቀን አዲስ ነው
ከዴማስ ጋር ስሄድ ትቼው የአንተን መንገድ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 2
ከቶ መች ቀነሰ ለእኔ ያለህ መውደድ
በአመጽ ብጠፋም ከመንጋህ መካከል
ይመሻል ይነጋል እኔን ስትከተል
እንደወጣ ይቅር ብለህ መቼ ተውከኝ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 3
ሴኬም ድረስ ወርደህ ልጅህን ፈለከኝ
በዝናዬም ዘመን ባለጸጋ እያለሁ
ቤቴ በወዳጆች ቀን በቀን ሙሉ ነው
እንደ ጤዛ ሲረግፍ ሃብትና ንብረቴ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 4
ያላንተ ማን ነበር በፈርሰው ቤቴ
የታመንኩባቸው ወዳጆች ሲከዱኝ
ሕመሜ ስር ሆነው ደጋግመው ሲወጉኝ
ላንተ ጊዜ ባጣም ለኔ ጊዜ አለህ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 5
ገፋህ ክፉ ቀኔን ከኔ ጋራ አብረህ
ዘማሪ ዲያቆን አቤል መክብብ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 1
Yalew Egziabher (2)
Zemen yemayzew gize yemaygedbew
Yante fiqr bicha qen beqen adis new
Kedemas gar sihed tichew yeanten menged

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 2
Keto mech qenese leene yaleh mewded
Beamets’ bit’efam kemengah mekakel
Yimeshal yinegal enen sitketel
Endewet’a yiqr bileh meche tewkegn

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 3
Sekem dires werdeh lijhn felekegn
Beznayem zemen balets’ega eyalehu
Bete bewedajoch qen beqen mulu new
Ende t’eza siregf habtna nibrete

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 4
Yalante man neber befersew bete
Yetamenkubachew wedajoch sikedugn
Himeme sir honew degagmew siwegugn
Lante gize bat’am lene gize aleh

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 5
Gefah kifu qenen kene gara abreh
Zemari diyaqon abel mekbb

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 1
ያለው እግዚአብሔር /2/
ዘመን የማይዘው ጊዜ የማይገድበው
ያንተ ፍቅር ብቻ ቀን በቀን አዲስ ነው
ከዴማስ ጋር ስሄድ ትቼው የአንተን መንገድ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 2
ከቶ መች ቀነሰ ለእኔ ያለህ መውደድ
በአመጽ ብጠፋም ከመንጋህ መካከል
ይመሻል ይነጋል እኔን ስትከተል
እንደወጣ ይቅር ብለህ መቼ ተውከኝ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 3
ሴኬም ድረስ ወርደህ ልጅህን ፈለከኝ
በዝናዬም ዘመን ባለጸጋ እያለሁ
ቤቴ በወዳጆች ቀን በቀን ሙሉ ነው
እንደ ጤዛ ሲረግፍ ሃብትና ንብረቴ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 4
ያላንተ ማን ነበር በፈርሰው ቤቴ
የታመንኩባቸው ወዳጆች ሲከዱኝ
ሕመሜ ስር ሆነው ደጋግመው ሲወጉኝ
ላንተ ጊዜ ባጣም ለኔ ጊዜ አለህ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 5
ገፋህ ክፉ ቀኔን ከኔ ጋራ አብረህ
ዘማሪ ዲያቆን አቤል መክብብ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው',
        lyrics_transliteration = 'CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 1
Yalew Egziabher (2)
Zemen yemayzew gize yemaygedbew
Yante fiqr bicha qen beqen adis new
Kedemas gar sihed tichew yeanten menged

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 2
Keto mech qenese leene yaleh mewded
Beamets’ bit’efam kemengah mekakel
Yimeshal yinegal enen sitketel
Endewet’a yiqr bileh meche tewkegn

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 3
Sekem dires werdeh lijhn felekegn
Beznayem zemen balets’ega eyalehu
Bete bewedajoch qen beqen mulu new
Ende t’eza siregf habtna nibrete

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 4
Yalante man neber befersew bete
Yetamenkubachew wedajoch sikedugn
Himeme sir honew degagmew siwegugn
Lante gize bat’am lene gize aleh

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 5
Gefah kifu qenen kene gara abreh
Zemari diyaqon abel mekbb

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e8f4797e-a84e-4cde-9231-2e6b8b426059'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 1
ያለው እግዚአብሔር /2/
ዘመን የማይዘው ጊዜ የማይገድበው
ያንተ ፍቅር ብቻ ቀን በቀን አዲስ ነው
ከዴማስ ጋር ስሄድ ትቼው የአንተን መንገድ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 2
ከቶ መች ቀነሰ ለእኔ ያለህ መውደድ
በአመጽ ብጠፋም ከመንጋህ መካከል
ይመሻል ይነጋል እኔን ስትከተል
እንደወጣ ይቅር ብለህ መቼ ተውከኝ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 3
ሴኬም ድረስ ወርደህ ልጅህን ፈለከኝ
በዝናዬም ዘመን ባለጸጋ እያለሁ
ቤቴ በወዳጆች ቀን በቀን ሙሉ ነው
እንደ ጤዛ ሲረግፍ ሃብትና ንብረቴ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 4
ያላንተ ማን ነበር በፈርሰው ቤቴ
የታመንኩባቸው ወዳጆች ሲከዱኝ
ሕመሜ ስር ሆነው ደጋግመው ሲወጉኝ
ላንተ ጊዜ ባጣም ለኔ ጊዜ አለህ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 5
ገፋህ ክፉ ቀኔን ከኔ ጋራ አብረህ
ዘማሪ ዲያቆን አቤል መክብብ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e8f4797e-a84e-4cde-9231-2e6b8b426059'::uuid, 'abel-mekibib-weret-yelelew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- jireenyadha-m-k-o-t-itoophiyaatti-faarfannaa-afaan-oromoo-hangafa-far-d ("JIREENYADHA. M/K/O/T/ Itoophiyaatti Faarfannaa Afaan Oromoo Hangafa Far.D/N Firaanol Moosisaatiin")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '00dbae2f-32c7-415c-84af-14e855d10a94'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 1
Guddinni kee jecha koo irra caala
Dur kanan si beeku madaaf dhiigaani michuu koo
Qoma keetti siqee siwaliin oolee bulu koo
Fuula mootii lafaa qullaa dhaabbachuu kee

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 2
Dirraa madooftee du''aaf kennamuu kee
Miti har''a garu (2) kan caaluunan si''arge (2)
Huursaa akka bishaanii sagalee nabutu
Albee arraba lamaan abidda darbatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 3
Addaataa akka cabbii qajjisi mataa kee
Furtuun du''aaf si''ool lachuu jira harka kee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu
Sagalee xumuraan Eelohim yemmuu ati jetttu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 4
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Xumura jaalalaa du''aan gaafa mul''ifte
Miti har''a garu (2) kan caaluunan si''arge (2)
Baattuu ibsaa warqee gidduu kan dhaabbattuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 5
Xiyyoo ija abiddaa calaqqee darbattu
Urjiilee gurguddoos quba keetu lakkaa''ee
Abbaa keen qixxaateee ulfinaan sittu taa''ee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 6
Sagalee xumuraan Eelohim yemmuu ati jetttu
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Dirraa madooftee du''a kan nabaraarte
Miti har''a garu (2) kan caaluunan si''arge (2)

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 7
Utubaa qilleensaa kan galmicha baatu
Simboo ardiif samii bakka Aarsaa guutuu
Leenca Saawwa Risaa Namas kan fakkaatu
Mootii moototaa kiruub irra jiraatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 1
Guddinni kee jecha koo irra caala
Dur kanan si beeku madaaf dhiigaani michuu koo
Qoma keetti siqee siwaliin oolee bulu koo
Fuula mootii lafaa qullaa dhaabbachuu kee

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 2
Dirraa madooftee du''aaf kennamuu kee
Miti har''a garu (2) kan caaluunan si''arge (2)
Huursaa akka bishaanii sagalee nabutu
Albee arraba lamaan abidda darbatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 3
Addaataa akka cabbii qajjisi mataa kee
Furtuun du''aaf si''ool lachuu jira harka kee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu
Sagalee xumuraan Eelohim yemmuu ati jetttu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 4
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Xumura jaalalaa du''aan gaafa mul''ifte
Miti har''a garu (2) kan caaluunan si''arge (2)
Baattuu ibsaa warqee gidduu kan dhaabbattuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 5
Xiyyoo ija abiddaa calaqqee darbattu
Urjiilee gurguddoos quba keetu lakkaa''ee
Abbaa keen qixxaateee ulfinaan sittu taa''ee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 6
Sagalee xumuraan Eelohim yemmuu ati jetttu
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Dirraa madooftee du''a kan nabaraarte
Miti har''a garu (2) kan caaluunan si''arge (2)

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 7
Utubaa qilleensaa kan galmicha baatu
Simboo ardiif samii bakka Aarsaa guutuu
Leenca Saawwa Risaa Namas kan fakkaatu
Mootii moototaa kiruub irra jiraatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 1
Guddinni kee jecha koo irra caala
Dur kanan si beeku madaaf dhiigaani michuu koo
Qoma keetti siqee siwaliin oolee bulu koo
Fuula mootii lafaa qullaa dhaabbachuu kee

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 2
Dirraa madooftee du''aaf kennamuu kee
Miti har''a garu (2) kan caaluunan si''arge (2)
Huursaa akka bishaanii sagalee nabutu
Albee arraba lamaan abidda darbatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 3
Addaataa akka cabbii qajjisi mataa kee
Furtuun du''aaf si''ool lachuu jira harka kee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu
Sagalee xumuraan Eelohim yemmuu ati jetttu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 4
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Xumura jaalalaa du''aan gaafa mul''ifte
Miti har''a garu (2) kan caaluunan si''arge (2)
Baattuu ibsaa warqee gidduu kan dhaabbattuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 5
Xiyyoo ija abiddaa calaqqee darbattu
Urjiilee gurguddoos quba keetu lakkaa''ee
Abbaa keen qixxaateee ulfinaan sittu taa''ee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 6
Sagalee xumuraan Eelohim yemmuu ati jetttu
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Dirraa madooftee du''a kan nabaraarte
Miti har''a garu (2) kan caaluunan si''arge (2)

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 7
Utubaa qilleensaa kan galmicha baatu
Simboo ardiif samii bakka Aarsaa guutuu
Leenca Saawwa Risaa Namas kan fakkaatu
Mootii moototaa kiruub irra jiraatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala',
        lyrics_transliteration = 'CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 1
Guddinni kee jecha koo irra caala
Dur kanan si beeku madaaf dhiigaani michuu koo
Qoma keetti siqee siwaliin oolee bulu koo
Fuula mootii lafaa qullaa dhaabbachuu kee

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 2
Dirraa madooftee du''aaf kennamuu kee
Miti har''a garu (2) kan caaluunan si''arge (2)
Huursaa akka bishaanii sagalee nabutu
Albee arraba lamaan abidda darbatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 3
Addaataa akka cabbii qajjisi mataa kee
Furtuun du''aaf si''ool lachuu jira harka kee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu
Sagalee xumuraan Eelohim yemmuu ati jetttu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 4
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Xumura jaalalaa du''aan gaafa mul''ifte
Miti har''a garu (2) kan caaluunan si''arge (2)
Baattuu ibsaa warqee gidduu kan dhaabbattuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 5
Xiyyoo ija abiddaa calaqqee darbattu
Urjiilee gurguddoos quba keetu lakkaa''ee
Abbaa keen qixxaateee ulfinaan sittu taa''ee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 6
Sagalee xumuraan Eelohim yemmuu ati jetttu
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Dirraa madooftee du''a kan nabaraarte
Miti har''a garu (2) kan caaluunan si''arge (2)

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 7
Utubaa qilleensaa kan galmicha baatu
Simboo ardiif samii bakka Aarsaa guutuu
Leenca Saawwa Risaa Namas kan fakkaatu
Mootii moototaa kiruub irra jiraatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala',
        updated_at = clock_timestamp()::text
    WHERE import_id = '00dbae2f-32c7-415c-84af-14e855d10a94'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 1
Guddinni kee jecha koo irra caala
Dur kanan si beeku madaaf dhiigaani michuu koo
Qoma keetti siqee siwaliin oolee bulu koo
Fuula mootii lafaa qullaa dhaabbachuu kee

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 2
Dirraa madooftee du''aaf kennamuu kee
Miti har''a garu (2) kan caaluunan si''arge (2)
Huursaa akka bishaanii sagalee nabutu
Albee arraba lamaan abidda darbatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 3
Addaataa akka cabbii qajjisi mataa kee
Furtuun du''aaf si''ool lachuu jira harka kee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu
Sagalee xumuraan Eelohim yemmuu ati jetttu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 4
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Xumura jaalalaa du''aan gaafa mul''ifte
Miti har''a garu (2) kan caaluunan si''arge (2)
Baattuu ibsaa warqee gidduu kan dhaabbattuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 5
Xiyyoo ija abiddaa calaqqee darbattu
Urjiilee gurguddoos quba keetu lakkaa''ee
Abbaa keen qixxaateee ulfinaan sittu taa''ee
Dheebuutiin wargamtee yemmu dhugdu hadhooftuu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 6
Sagalee xumuraan Eelohim yemmuu ati jetttu
Bakka hoolaaf gugee dhibaayyuu gaafa taate
Dirraa madooftee du''a kan nabaraarte
Miti har''a garu (2) kan caaluunan si''arge (2)

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala

VERSE 7
Utubaa qilleensaa kan galmicha baatu
Simboo ardiif samii bakka Aarsaa guutuu
Leenca Saawwa Risaa Namas kan fakkaatu
Mootii moototaa kiruub irra jiraatu

CHORUS
Gaafa dhiphuu sana miti har''a immoo Ulfinaanin si arge
Si''ilaaluu dadhabeen du''uudhaafan wargee
Aayyaana keen eenyutu si''ilaala
Ulfina keen eenyutu si''ilaala'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '00dbae2f-32c7-415c-84af-14e855d10a94'::uuid, 'jireenyadha-m-k-o-t-itoophiyaatti-faarfannaa-afaan-oromoo-hangafa-far-d', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enidemin-beretach ("Enidemin Beretach")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e2fef61e-070c-4835-9e6a-4f30f8fdb136'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 1
የአሕዛብን ፈቃድ ያደረኩበት ቀን
እንደምን ይቆጠር ገብቶ በኔ ዘመን
ካየሁ ጀምሮ ይቆጠር እድሜዬ
ሳላውቅህ የኖርኩት የኔ አይደል ጌታዬ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 2
የትዕግስትህ መጠን ስፋቱ ጥልቅ ነው
ሁሌ እያጠፋሁ ቃልህ የፍቅር ነው
ረቡኒ ተናገር ላድምጥ በዝምታ
እስራቴ ይውለቅ ስትናገር ጌታ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 3
በኔ ውስጥ ምሰሶ እያለ ተጋርዶ
ዓይኔ ያያል የሰው የበደልን ነዶ
አልታዘዝ ብዬ ልቤን ሳትታዘብ
ሰው እየከሰስኩም አደረከኝ ገንዘብ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 4
ሰው ፊትን እያየ ሞገስን ሲያበዛ
ሚዛንህ ልብ ነው የዓለሙ ቤዛ
ከአገር የሰፋውን የእኔን እዳ ምረህ
ለትንሽ ስጨክን ይቅር አለኝ ልብህ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 5
ስላልተውከኝ ክበር ስላልተውከኝ ንገስ
የልቤ መድኃኒት ተስፋዬ ኢየሱስ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 1
Yeahzabn feqad yaderekubet qen
Endemn yiqot’er gebto bene zemen
Kayehu jemro yiqot’er edmeye
Salawqh yenorkut yene aydel Getaye

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 2
Yetegsth met’en sifatu t’lq new
Hule eyat’efahu qalh yefqr new
Rebuni tenager ladmt’ bezmta
Esrate yiwleq sitnager Geta

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 3
Bene wist’ miseso eyale tegardo
Ayne yayal yesew yebedeln nedo
Altazez biye liben sattazeb
Sew eyekeseskum aderekegn genzeb

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 4
Sew fitn eyaye mogesn siyabeza
Mizanh lib new yealemu beza
Keager yesefawn yeenen eda mireh
Letnsh sich’ekn yiqr alegn libh

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 5
Silaltewkegn kiber silaltewkegn niges
Yelbe medhanit tesfaye Iyesus

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 1
የአሕዛብን ፈቃድ ያደረኩበት ቀን
እንደምን ይቆጠር ገብቶ በኔ ዘመን
ካየሁ ጀምሮ ይቆጠር እድሜዬ
ሳላውቅህ የኖርኩት የኔ አይደል ጌታዬ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 2
የትዕግስትህ መጠን ስፋቱ ጥልቅ ነው
ሁሌ እያጠፋሁ ቃልህ የፍቅር ነው
ረቡኒ ተናገር ላድምጥ በዝምታ
እስራቴ ይውለቅ ስትናገር ጌታ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 3
በኔ ውስጥ ምሰሶ እያለ ተጋርዶ
ዓይኔ ያያል የሰው የበደልን ነዶ
አልታዘዝ ብዬ ልቤን ሳትታዘብ
ሰው እየከሰስኩም አደረከኝ ገንዘብ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 4
ሰው ፊትን እያየ ሞገስን ሲያበዛ
ሚዛንህ ልብ ነው የዓለሙ ቤዛ
ከአገር የሰፋውን የእኔን እዳ ምረህ
ለትንሽ ስጨክን ይቅር አለኝ ልብህ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 5
ስላልተውከኝ ክበር ስላልተውከኝ ንገስ
የልቤ መድኃኒት ተስፋዬ ኢየሱስ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ',
        lyrics_transliteration = 'CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 1
Yeahzabn feqad yaderekubet qen
Endemn yiqot’er gebto bene zemen
Kayehu jemro yiqot’er edmeye
Salawqh yenorkut yene aydel Getaye

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 2
Yetegsth met’en sifatu t’lq new
Hule eyat’efahu qalh yefqr new
Rebuni tenager ladmt’ bezmta
Esrate yiwleq sitnager Geta

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 3
Bene wist’ miseso eyale tegardo
Ayne yayal yesew yebedeln nedo
Altazez biye liben sattazeb
Sew eyekeseskum aderekegn genzeb

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 4
Sew fitn eyaye mogesn siyabeza
Mizanh lib new yealemu beza
Keager yesefawn yeenen eda mireh
Letnsh sich’ekn yiqr alegn libh

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn

VERSE 5
Silaltewkegn kiber silaltewkegn niges
Yelbe medhanit tesfaye Iyesus

CHORUS
Endemn beretach danech sewnete
Bitodegn eko new abet medhanite
Yichn amet degmo ante bittewegn
Wedaje mewdedh fiqrh asleqesegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e2fef61e-070c-4835-9e6a-4f30f8fdb136'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 1
የአሕዛብን ፈቃድ ያደረኩበት ቀን
እንደምን ይቆጠር ገብቶ በኔ ዘመን
ካየሁ ጀምሮ ይቆጠር እድሜዬ
ሳላውቅህ የኖርኩት የኔ አይደል ጌታዬ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 2
የትዕግስትህ መጠን ስፋቱ ጥልቅ ነው
ሁሌ እያጠፋሁ ቃልህ የፍቅር ነው
ረቡኒ ተናገር ላድምጥ በዝምታ
እስራቴ ይውለቅ ስትናገር ጌታ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 3
በኔ ውስጥ ምሰሶ እያለ ተጋርዶ
ዓይኔ ያያል የሰው የበደልን ነዶ
አልታዘዝ ብዬ ልቤን ሳትታዘብ
ሰው እየከሰስኩም አደረከኝ ገንዘብ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 4
ሰው ፊትን እያየ ሞገስን ሲያበዛ
ሚዛንህ ልብ ነው የዓለሙ ቤዛ
ከአገር የሰፋውን የእኔን እዳ ምረህ
ለትንሽ ስጨክን ይቅር አለኝ ልብህ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ

VERSE 5
ስላልተውከኝ ክበር ስላልተውከኝ ንገስ
የልቤ መድኃኒት ተስፋዬ ኢየሱስ

CHORUS
እንደምን በረታች ዳነች ሰውነቴ
ብቶደኝ እኮ ነው አቤት መድኃኒቴ
ይችን ዓመት ደግሞ አንተ ብትተወኝ
ወዳጄ መውደድህ ፍቅርህ አስለቀሰኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e2fef61e-070c-4835-9e6a-4f30f8fdb136'::uuid, 'enidemin-beretach', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- di-n-zemari-behayilu-tebeje-eregnaye-adis-mezimur-bevidiyo-diacon-zemari ("Di/n Zemari Behayilu Tebeje Eregnaye Adis Mezimur Bevidiyo Diacon Zemari Behailu Tebeje Neworthodox Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0d404b06-a2a3-4e5f-8488-ab58e80459c0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 1
ህይወት በምድር ላይ ብትሆን ከባድ
ወጥመዷን ማምለጫ ጌታ ለኝ መንገድ
እጠባበቃለውህ ተስፋዬን አጥብቄ
ለዓለም አትተወኝም ኣልቀርም ወድቄ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 2
በእጅህ ተፈጥሬ ክቡር አድርገኸኝ
ከቶ ያለ አላማ መቼ መጣሁኝ [2]
በኔ ላይ ሰልጥኖ ሓጥያት ከነ ቤቱ
መሽቶ ይነጋብኛል ስባዝን በከንቱ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 3
ሰጠኸኝ ነበረ ጊዜ ለንስሓ
ትንሽ ኣድርጌ እንጂ ትልቁን አምሃ
ይነቀል ከልቤ የተተበተበው
አንተ ብቻ ልዪ ጠላቴን ጥለኸው[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 4
የበጎች እረኛ ቸሩ ጌታችን
ያድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 5
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2)
ካገሬም ብሰደድ ጽናቱን አጥቼ
ገባው ተሰሎንቄ መቅደስህን ትቼ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 6
ጌታዬ መልሰኝ እኜ እመለሳለው
ልቤን ካንተ ሌላ ለማን እሰጣለው
ዓይኖቼም ይመሉ የፀፀትን እንባ
ደግሞም ተመልሼ ወደ እቅፍህ ልግባ[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 7
የበጎች እረኛ ቸሩ ጌታችን
የድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 8
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 1
Hiywet bemdr lay bithon kebad
Wet’medwan mamlech’a Geta legn menged
Et’ebabeqalewh tesfayen at’bqe
Lealem attewegnm alqerm wedqe

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 2
Beejh tefet’re kibur adrgeኸgn
Keto yale alama meche met’ahugn [2]
Bene lay selt’no hat’yat kene betu
Meshto yinegabgnal sibazn bekentu

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 3
Set’eኸgn nebere gize lensha
Tinsh adrge enji tilqun amha
Yineqel kelbe yetetebetebew
Ante bicha liyi t’elaten t’leኸw[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 4
Yebegoch eregna cheru Getachen
Yadnewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 5
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2)
Kagerem biseded ts’natun at’che
Gebaw teselonqe meqdeshn tiche

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 6
Getaye melsegn egne emelesalew
Liben kante lela leman eset’alew
Aynochem yimelu yets’ets’etn enba
Degmom temelshe wede eqfh ligba[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 7
Yebegoch eregna cheru Getachen
Yednewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 8
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 1
ህይወት በምድር ላይ ብትሆን ከባድ
ወጥመዷን ማምለጫ ጌታ ለኝ መንገድ
እጠባበቃለውህ ተስፋዬን አጥብቄ
ለዓለም አትተወኝም ኣልቀርም ወድቄ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 2
በእጅህ ተፈጥሬ ክቡር አድርገኸኝ
ከቶ ያለ አላማ መቼ መጣሁኝ [2]
በኔ ላይ ሰልጥኖ ሓጥያት ከነ ቤቱ
መሽቶ ይነጋብኛል ስባዝን በከንቱ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 3
ሰጠኸኝ ነበረ ጊዜ ለንስሓ
ትንሽ ኣድርጌ እንጂ ትልቁን አምሃ
ይነቀል ከልቤ የተተበተበው
አንተ ብቻ ልዪ ጠላቴን ጥለኸው[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 4
የበጎች እረኛ ቸሩ ጌታችን
ያድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 5
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2)
ካገሬም ብሰደድ ጽናቱን አጥቼ
ገባው ተሰሎንቄ መቅደስህን ትቼ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 6
ጌታዬ መልሰኝ እኜ እመለሳለው
ልቤን ካንተ ሌላ ለማን እሰጣለው
ዓይኖቼም ይመሉ የፀፀትን እንባ
ደግሞም ተመልሼ ወደ እቅፍህ ልግባ[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 7
የበጎች እረኛ ቸሩ ጌታችን
የድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 8
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ',
        lyrics_transliteration = 'CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 1
Hiywet bemdr lay bithon kebad
Wet’medwan mamlech’a Geta legn menged
Et’ebabeqalewh tesfayen at’bqe
Lealem attewegnm alqerm wedqe

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 2
Beejh tefet’re kibur adrgeኸgn
Keto yale alama meche met’ahugn [2]
Bene lay selt’no hat’yat kene betu
Meshto yinegabgnal sibazn bekentu

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 3
Set’eኸgn nebere gize lensha
Tinsh adrge enji tilqun amha
Yineqel kelbe yetetebetebew
Ante bicha liyi t’elaten t’leኸw[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 4
Yebegoch eregna cheru Getachen
Yadnewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 5
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2)
Kagerem biseded ts’natun at’che
Gebaw teselonqe meqdeshn tiche

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 6
Getaye melsegn egne emelesalew
Liben kante lela leman eset’alew
Aynochem yimelu yets’ets’etn enba
Degmom temelshe wede eqfh ligba[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 7
Yebegoch eregna cheru Getachen
Yednewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 8
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0d404b06-a2a3-4e5f-8488-ab58e80459c0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 1
ህይወት በምድር ላይ ብትሆን ከባድ
ወጥመዷን ማምለጫ ጌታ ለኝ መንገድ
እጠባበቃለውህ ተስፋዬን አጥብቄ
ለዓለም አትተወኝም ኣልቀርም ወድቄ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 2
በእጅህ ተፈጥሬ ክቡር አድርገኸኝ
ከቶ ያለ አላማ መቼ መጣሁኝ [2]
በኔ ላይ ሰልጥኖ ሓጥያት ከነ ቤቱ
መሽቶ ይነጋብኛል ስባዝን በከንቱ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 3
ሰጠኸኝ ነበረ ጊዜ ለንስሓ
ትንሽ ኣድርጌ እንጂ ትልቁን አምሃ
ይነቀል ከልቤ የተተበተበው
አንተ ብቻ ልዪ ጠላቴን ጥለኸው[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 4
የበጎች እረኛ ቸሩ ጌታችን
ያድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 5
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2)
ካገሬም ብሰደድ ጽናቱን አጥቼ
ገባው ተሰሎንቄ መቅደስህን ትቼ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 6
ጌታዬ መልሰኝ እኜ እመለሳለው
ልቤን ካንተ ሌላ ለማን እሰጣለው
ዓይኖቼም ይመሉ የፀፀትን እንባ
ደግሞም ተመልሼ ወደ እቅፍህ ልግባ[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 7
የበጎች እረኛ ቸሩ ጌታችን
የድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 8
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0d404b06-a2a3-4e5f-8488-ab58e80459c0'::uuid, 'di-n-zemari-behayilu-tebeje-eregnaye-adis-mezimur-bevidiyo-diacon-zemari', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- libe-yawikewal ("Libe Yawikewal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ea5153e7-9ef0-4d7b-8f25-fae4b8b0b9f2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 1
መስቀል ተሸክመል በደም ርሰህ
እኔን በመከራ ዳግም ወልድህ
በክብር ተሻገርኩ ክስህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 2
የበደሌን ጥር አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኽው ጌታ መዳን ሆነ
እርቃኔ በእርቃንህ ተሸፈነ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 3
በፍቅርህ መኣዛ ረክቷል ልቤ
በማይቆም መዉደድህ ተከብቤ
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብና ንፋስ የማይነቅለው

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 4
የሾህ አክሊል ደፍተህ ኤልሻዳይ
እፎይ አለ ልብ ከስቃይ
ሆኖልኛል መዳን አንተ ታማህ
ነፃ ወጣሁ ሸክሜን ተሽክመህ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 5
ዙፍንህን አሰተውህ የኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየህ ስትፍልጉኝ ልጅ ብልህ
ፈራጅና አፅዳቂ አምላኬ ነህ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 1
Mesqel teshekmel bedem riseh
Enen bemekera dagm weldh
Bekbr teshagerku kishlgn
Behywet aqomkegn wedqehlgn

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 2
Yebedelen t’r aqebetun
Yebarnet sened eda kisun
At’fteኽw Geta medan hone
Erqane beerqanh teshefene

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 3
Befqrh meaza rektwal libe
Bemayqom mewudedh tekebbe
Yehywete wedeb mesqelh new
Wejebna nifas yemayneqlew

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 4
Yeshoh aklil defteh elshaday
Efoy ale lib kesqay
Honolgnal medan ante tamah
Nets’a wet’ahu shekmen teshkmeh

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 5
Zufnhn asetewh yene fiqr
Kesemay hegerh met’ah kemdr
Tayeh sitflgugn lij bilh
Ferajna ats’daqi amlake neh

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 1
መስቀል ተሸክመል በደም ርሰህ
እኔን በመከራ ዳግም ወልድህ
በክብር ተሻገርኩ ክስህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 2
የበደሌን ጥር አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኽው ጌታ መዳን ሆነ
እርቃኔ በእርቃንህ ተሸፈነ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 3
በፍቅርህ መኣዛ ረክቷል ልቤ
በማይቆም መዉደድህ ተከብቤ
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብና ንፋስ የማይነቅለው

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 4
የሾህ አክሊል ደፍተህ ኤልሻዳይ
እፎይ አለ ልብ ከስቃይ
ሆኖልኛል መዳን አንተ ታማህ
ነፃ ወጣሁ ሸክሜን ተሽክመህ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 5
ዙፍንህን አሰተውህ የኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየህ ስትፍልጉኝ ልጅ ብልህ
ፈራጅና አፅዳቂ አምላኬ ነህ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ',
        lyrics_transliteration = 'CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 1
Mesqel teshekmel bedem riseh
Enen bemekera dagm weldh
Bekbr teshagerku kishlgn
Behywet aqomkegn wedqehlgn

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 2
Yebedelen t’r aqebetun
Yebarnet sened eda kisun
At’fteኽw Geta medan hone
Erqane beerqanh teshefene

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 3
Befqrh meaza rektwal libe
Bemayqom mewudedh tekebbe
Yehywete wedeb mesqelh new
Wejebna nifas yemayneqlew

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 4
Yeshoh aklil defteh elshaday
Efoy ale lib kesqay
Honolgnal medan ante tamah
Nets’a wet’ahu shekmen teshkmeh

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 5
Zufnhn asetewh yene fiqr
Kesemay hegerh met’ah kemdr
Tayeh sitflgugn lij bilh
Ferajna ats’daqi amlake neh

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ea5153e7-9ef0-4d7b-8f25-fae4b8b0b9f2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 1
መስቀል ተሸክመል በደም ርሰህ
እኔን በመከራ ዳግም ወልድህ
በክብር ተሻገርኩ ክስህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 2
የበደሌን ጥር አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኽው ጌታ መዳን ሆነ
እርቃኔ በእርቃንህ ተሸፈነ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 3
በፍቅርህ መኣዛ ረክቷል ልቤ
በማይቆም መዉደድህ ተከብቤ
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብና ንፋስ የማይነቅለው

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 4
የሾህ አክሊል ደፍተህ ኤልሻዳይ
እፎይ አለ ልብ ከስቃይ
ሆኖልኛል መዳን አንተ ታማህ
ነፃ ወጣሁ ሸክሜን ተሽክመህ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 5
ዙፍንህን አሰተውህ የኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየህ ስትፍልጉኝ ልጅ ብልህ
ፈራጅና አፅዳቂ አምላኬ ነህ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ea5153e7-9ef0-4d7b-8f25-fae4b8b0b9f2'::uuid, 'libe-yawikewal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tesifa-atikoritimina ("Tesifa Atikoritimina")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '175552b7-9b7b-4ae5-a1c7-46eb4de33782'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 1
አባቴ አይተወኝም ስለሆንኩኝ ልጁ
አዝ…
በከንቱ ምኞት በዓለም ዳንኪራ
ኃጢአትን ባደረግ አንተን ሳልፈራ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 2
የመንፈስ ፍሬ ከእኔ ቢታጣ
ሸክሜ ከብዶብኝ ብሆን ጎባጣ
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 3
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 4
ዳግም ላልገኝ ከኃጢአት መንደር
ቃል ገብቼልህ እንደ ቃልህ ልኖር
ቃሌን አጥፌ ፍቅርህን ንቄ
ዳግም ብገኝም በኃጢአት ወድቄ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 5
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 6
በድንግል ማርያም በጌታዬ እናት
በአቁራሪተ መዓት ምዕራገ ጸሎት
በእናትነት ፍቅሯ ጹኑ ነው ተስፋዬ
ምህረት እንደማገኝ ከቸር ፈጣሪዬ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 7
ስለ ቃልኪዳኗ አይለኝም ችላ
ጌታ ያሳርፈኛል በምህረቱ ጥላ
የአምላክ ባለሟሎች ቅዱሳኑ ሁሉ
ስለ እኔ ድኅነት ፊቱ ይቆማሉ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 1
Abate aytewegnm silehonkugn liju
CHORUS
Bekentu mignot bealem dankira
Hat’iatn badereg anten salfera

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 2
Yemenfes fire keene bitat’a
Shekme kebdobgn bihon gobat’a
Tesfa atqort’mna amlak beft’reth
Ayleym keene mihret cherneth

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 3
Biwedq enesalehu dagm benshe
Endihu besemay yihonal fishe

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 4
Dagm lalgegn kehat’iat mender
Qal gebchelh ende qalh linor
Qalen at’fe fiqrhn niqe
Dagm bigegnm behat’iat wedqe

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 5
Tesfa atqort’mna amlak beft’reth
Ayleym keene mihret cherneth
Biwedq enesalehu dagm benshe
Endihu besemay yihonal fishe

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 6
Bedngl Maryam begetaye enat
Beaqurarite meat mierage ts’elot
Beenatnet fiqrwa ts’unu new tesfaye
Mihret endemagegn kecher fet’ariye

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 7
Sile qalkidanwa aylegnm chla
Geta yasarfegnal bemhretu t’la
Yeamlak balemwaloch qidusanu hulu
Sile ene dihnet fitu yiqomalu

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 1
አባቴ አይተወኝም ስለሆንኩኝ ልጁ
አዝ…
በከንቱ ምኞት በዓለም ዳንኪራ
ኃጢአትን ባደረግ አንተን ሳልፈራ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 2
የመንፈስ ፍሬ ከእኔ ቢታጣ
ሸክሜ ከብዶብኝ ብሆን ጎባጣ
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 3
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 4
ዳግም ላልገኝ ከኃጢአት መንደር
ቃል ገብቼልህ እንደ ቃልህ ልኖር
ቃሌን አጥፌ ፍቅርህን ንቄ
ዳግም ብገኝም በኃጢአት ወድቄ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 5
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 6
በድንግል ማርያም በጌታዬ እናት
በአቁራሪተ መዓት ምዕራገ ጸሎት
በእናትነት ፍቅሯ ጹኑ ነው ተስፋዬ
ምህረት እንደማገኝ ከቸር ፈጣሪዬ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 7
ስለ ቃልኪዳኗ አይለኝም ችላ
ጌታ ያሳርፈኛል በምህረቱ ጥላ
የአምላክ ባለሟሎች ቅዱሳኑ ሁሉ
ስለ እኔ ድኅነት ፊቱ ይቆማሉ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ',
        lyrics_transliteration = 'CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 1
Abate aytewegnm silehonkugn liju
CHORUS
Bekentu mignot bealem dankira
Hat’iatn badereg anten salfera

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 2
Yemenfes fire keene bitat’a
Shekme kebdobgn bihon gobat’a
Tesfa atqort’mna amlak beft’reth
Ayleym keene mihret cherneth

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 3
Biwedq enesalehu dagm benshe
Endihu besemay yihonal fishe

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 4
Dagm lalgegn kehat’iat mender
Qal gebchelh ende qalh linor
Qalen at’fe fiqrhn niqe
Dagm bigegnm behat’iat wedqe

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 5
Tesfa atqort’mna amlak beft’reth
Ayleym keene mihret cherneth
Biwedq enesalehu dagm benshe
Endihu besemay yihonal fishe

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 6
Bedngl Maryam begetaye enat
Beaqurarite meat mierage ts’elot
Beenatnet fiqrwa ts’unu new tesfaye
Mihret endemagegn kecher fet’ariye

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju

VERSE 7
Sile qalkidanwa aylegnm chla
Geta yasarfegnal bemhretu t’la
Yeamlak balemwaloch qidusanu hulu
Sile ene dihnet fitu yiqomalu

CHORUS
Ende midr ashewa bibeza hat’iate
Tesfa alqort’m keto ene behywete
Bedele bibeza alrqm kedeju
Amlak yanesagnal bemhret eju',
        updated_at = clock_timestamp()::text
    WHERE import_id = '175552b7-9b7b-4ae5-a1c7-46eb4de33782'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 1
አባቴ አይተወኝም ስለሆንኩኝ ልጁ
አዝ…
በከንቱ ምኞት በዓለም ዳንኪራ
ኃጢአትን ባደረግ አንተን ሳልፈራ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 2
የመንፈስ ፍሬ ከእኔ ቢታጣ
ሸክሜ ከብዶብኝ ብሆን ጎባጣ
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 3
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 4
ዳግም ላልገኝ ከኃጢአት መንደር
ቃል ገብቼልህ እንደ ቃልህ ልኖር
ቃሌን አጥፌ ፍቅርህን ንቄ
ዳግም ብገኝም በኃጢአት ወድቄ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 5
ተስፋ አትቆርጥምና አምላክ በፍጥረትህ
አይለይም ከእኔ ምህረት ቸርነትህ
ብወድቅ እነሳለሁ ዳግም በንስሐ
እንዲሁ በሰማይ ይሆናል ፍስሐ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 6
በድንግል ማርያም በጌታዬ እናት
በአቁራሪተ መዓት ምዕራገ ጸሎት
በእናትነት ፍቅሯ ጹኑ ነው ተስፋዬ
ምህረት እንደማገኝ ከቸር ፈጣሪዬ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ

VERSE 7
ስለ ቃልኪዳኗ አይለኝም ችላ
ጌታ ያሳርፈኛል በምህረቱ ጥላ
የአምላክ ባለሟሎች ቅዱሳኑ ሁሉ
ስለ እኔ ድኅነት ፊቱ ይቆማሉ

CHORUS
እንደ ምድር አሸዋ ቢበዛ ኃጢአቴ
ተስፋ አልቆርጥም ከቶ እኔ በሕይወቴ
በደሌ ቢበዛ አልርቅም ከደጁ
አምላክ ያነሳኛል በምህረት እጁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '175552b7-9b7b-4ae5-a1c7-46eb4de33782'::uuid, 'tesifa-atikoritimina', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lord-it-is-your-grace ("Lord it is your grace")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e584793d-2026-4b50-8944-95af578c4a86'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)

VERSE 1
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare

VERSE 1
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare

CHORUS
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)

VERSE 1
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)',
        lyrics_transliteration = 'CHORUS
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare

VERSE 1
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare

CHORUS
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e584793d-2026-4b50-8944-95af578c4a86'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)

VERSE 1
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare

VERSE 1
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare

CHORUS
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e584793d-2026-4b50-8944-95af578c4a86'::uuid, 'lord-it-is-your-grace', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mikael-730 ("Mikael")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '01950211-7117-4e11-a78e-9d5c25ca9d20'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 1
የሰው ልጅ እንዳይሞት እንዳያልፍ በከንቱ
ለልመና ምትቆም ከአምላካችን ፊቱ
ወተአዛዚ ወተአዛዚ ለሰብእ በዲበ ሰናይቱ
ለምሕረት ስትላክ ባለም ግዞት ላሉ

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 2
በምልጃህ ረድኤት ተስፋ ሚጠለሉ
እየተደሰቱ ኃጥዓን ነፍሳት ሁሉ
መጻእከኑ መጻእከኑ ሀቤነ ሚካኤል ይብሉ
በመስቀል ማዕተብ የምታስርድ ጠላት

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 3
የትጉሃን ወዳጅ የድኩማን ረዳት
የርግብ ዓይኖች ያሉኽ የዋህ ሊቀ ኃይላት
ሰአል ሚካኤል ሰአል ሚካኤል ለነፍሰ ኵሉ ፍጥረት

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 1
Yesew lij endaymot endayalf bekentu
Lelmena mitqom keamlakachn fitu
Weteazazi weteazazi lesebe bedibe senaytu
Lemhret sitlak balem gizot lalu

CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 2
Bemljah redet tesfa mit’elelu
Eyetedesetu hat’an nefsat hulu
Mets’aekenu mets’aekenu hebene Mikael yiblu
Bemesqel maeteb yemtasrd t’elat

CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 3
Yetguhan wedaj yedkuman redat
Yergb aynoch yaluኽ yewah liqe haylat
Seal Mikael seal Mikael lenefse kwlu fit’ret

CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 1
የሰው ልጅ እንዳይሞት እንዳያልፍ በከንቱ
ለልመና ምትቆም ከአምላካችን ፊቱ
ወተአዛዚ ወተአዛዚ ለሰብእ በዲበ ሰናይቱ
ለምሕረት ስትላክ ባለም ግዞት ላሉ

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 2
በምልጃህ ረድኤት ተስፋ ሚጠለሉ
እየተደሰቱ ኃጥዓን ነፍሳት ሁሉ
መጻእከኑ መጻእከኑ ሀቤነ ሚካኤል ይብሉ
በመስቀል ማዕተብ የምታስርድ ጠላት

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 3
የትጉሃን ወዳጅ የድኩማን ረዳት
የርግብ ዓይኖች ያሉኽ የዋህ ሊቀ ኃይላት
ሰአል ሚካኤል ሰአል ሚካኤል ለነፍሰ ኵሉ ፍጥረት

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ',
        lyrics_transliteration = 'CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 1
Yesew lij endaymot endayalf bekentu
Lelmena mitqom keamlakachn fitu
Weteazazi weteazazi lesebe bedibe senaytu
Lemhret sitlak balem gizot lalu

CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 2
Bemljah redet tesfa mit’elelu
Eyetedesetu hat’an nefsat hulu
Mets’aekenu mets’aekenu hebene Mikael yiblu
Bemesqel maeteb yemtasrd t’elat

CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 3
Yetguhan wedaj yedkuman redat
Yergb aynoch yaluኽ yewah liqe haylat
Seal Mikael seal Mikael lenefse kwlu fit’ret

CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '01950211-7117-4e11-a78e-9d5c25ca9d20'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 1
የሰው ልጅ እንዳይሞት እንዳያልፍ በከንቱ
ለልመና ምትቆም ከአምላካችን ፊቱ
ወተአዛዚ ወተአዛዚ ለሰብእ በዲበ ሰናይቱ
ለምሕረት ስትላክ ባለም ግዞት ላሉ

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 2
በምልጃህ ረድኤት ተስፋ ሚጠለሉ
እየተደሰቱ ኃጥዓን ነፍሳት ሁሉ
መጻእከኑ መጻእከኑ ሀቤነ ሚካኤል ይብሉ
በመስቀል ማዕተብ የምታስርድ ጠላት

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 3
የትጉሃን ወዳጅ የድኩማን ረዳት
የርግብ ዓይኖች ያሉኽ የዋህ ሊቀ ኃይላት
ሰአል ሚካኤል ሰአል ሚካኤል ለነፍሰ ኵሉ ፍጥረት

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '01950211-7117-4e11-a78e-9d5c25ca9d20'::uuid, 'mikael-730', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egziabheren-terahut ("Egziabheren Terahut")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1f73aad6-d603-44e5-b23a-d73de25f1218'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 1
የልመናዬን ድምጽ እርሱ ሰምቷልና
ጆሮውን ወደ እኔ አዘንብሏልና
በዘመኔ ሁሉ ስጠራው እኖራለሁ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 2
ጎስቋላ ብሆንም ምስጋና አቀርባለሁ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 3
እንደ ቃልህ መጓዝ መራመድ አቅቶኝ
የሃጢያት መንገድ ማዕበሉ ገፍቶኝ
ወደ እርሱ ስማጸን ደግሞ ስጸጸት /2/
አላሳፈረኝም መጣ በምህረት /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 4
ኖህን እንዳዳንከው እኛንም አድነን
ከቀስቱ እንድናመልጥ ምልክትን ስጠን

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 5
በትርህ ምርኩዝህ እነሱ ያጽናኑኝ /2/
አንተ ከኔ ጋር ነህ አልፈራም ክፉውን /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 6
በበዛ ምህረቱ ያለፈውን ትቶ
በፍቅሩ ጎበኘኝ አልተወኝም ከቶ

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 7
ሊቀበለኝ ወዶ ፊቱን አበራልኝ /2/
ማን ይቃወመኛል እግዚአብሔር ካለልኝ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 1
Yelemenayen dimts ersu semtwalna
Jorown wede ené azembilwalna
Bezemené hulu sit’raw enoralew (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 2
Goskwala bihonem misgana aqerbalew (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 3
Ende qalih meguwaz meramed aqtoñ
Yehatiyat menged ma’ebalu geftoñ
Wede ersu simats’en degmo sits’etset (x2)
Alasaferegnim meta bemihret (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 4
Nohn endadanekew enyanem adnen
Keqest’u endetamelit milikitin set’en

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 5
Betrih mirkuzih enesu yats’nanugn (x2)
Ante kené gara neh alferam kifun (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 6
Bebeza mihretu yalefewn t’ito
Befiqru gobegnegn alt’ewognim k’eto

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 7
Liqebelégn wodo fitun aberalgn (x2)
Man yiqawemegn Egziabher kalelgn (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 1
የልመናዬን ድምጽ እርሱ ሰምቷልና
ጆሮውን ወደ እኔ አዘንብሏልና
በዘመኔ ሁሉ ስጠራው እኖራለሁ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 2
ጎስቋላ ብሆንም ምስጋና አቀርባለሁ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 3
እንደ ቃልህ መጓዝ መራመድ አቅቶኝ
የሃጢያት መንገድ ማዕበሉ ገፍቶኝ
ወደ እርሱ ስማጸን ደግሞ ስጸጸት /2/
አላሳፈረኝም መጣ በምህረት /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 4
ኖህን እንዳዳንከው እኛንም አድነን
ከቀስቱ እንድናመልጥ ምልክትን ስጠን

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 5
በትርህ ምርኩዝህ እነሱ ያጽናኑኝ /2/
አንተ ከኔ ጋር ነህ አልፈራም ክፉውን /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 6
በበዛ ምህረቱ ያለፈውን ትቶ
በፍቅሩ ጎበኘኝ አልተወኝም ከቶ

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 7
ሊቀበለኝ ወዶ ፊቱን አበራልኝ /2/
ማን ይቃወመኛል እግዚአብሔር ካለልኝ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/',
        lyrics_transliteration = 'CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 1
Yelemenayen dimts ersu semtwalna
Jorown wede ené azembilwalna
Bezemené hulu sit’raw enoralew (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 2
Goskwala bihonem misgana aqerbalew (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 3
Ende qalih meguwaz meramed aqtoñ
Yehatiyat menged ma’ebalu geftoñ
Wede ersu simats’en degmo sits’etset (x2)
Alasaferegnim meta bemihret (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 4
Nohn endadanekew enyanem adnen
Keqest’u endetamelit milikitin set’en

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 5
Betrih mirkuzih enesu yats’nanugn (x2)
Ante kené gara neh alferam kifun (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 6
Bebeza mihretu yalefewn t’ito
Befiqru gobegnegn alt’ewognim k’eto

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 7
Liqebelégn wodo fitun aberalgn (x2)
Man yiqawemegn Egziabher kalelgn (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1f73aad6-d603-44e5-b23a-d73de25f1218'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 1
የልመናዬን ድምጽ እርሱ ሰምቷልና
ጆሮውን ወደ እኔ አዘንብሏልና
በዘመኔ ሁሉ ስጠራው እኖራለሁ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 2
ጎስቋላ ብሆንም ምስጋና አቀርባለሁ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 3
እንደ ቃልህ መጓዝ መራመድ አቅቶኝ
የሃጢያት መንገድ ማዕበሉ ገፍቶኝ
ወደ እርሱ ስማጸን ደግሞ ስጸጸት /2/
አላሳፈረኝም መጣ በምህረት /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 4
ኖህን እንዳዳንከው እኛንም አድነን
ከቀስቱ እንድናመልጥ ምልክትን ስጠን

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 5
በትርህ ምርኩዝህ እነሱ ያጽናኑኝ /2/
አንተ ከኔ ጋር ነህ አልፈራም ክፉውን /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 6
በበዛ ምህረቱ ያለፈውን ትቶ
በፍቅሩ ጎበኘኝ አልተወኝም ከቶ

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/

VERSE 7
ሊቀበለኝ ወዶ ፊቱን አበራልኝ /2/
ማን ይቃወመኛል እግዚአብሔር ካለልኝ /2/

CHORUS
እግዚአብሔርን ጠራሁት በሀዘኔ ጊዜ
እግዚአብሔርን ጠራሁት በጭንቀቴ ጊዜ
አወጣኝ ከጭንቀት ከሀዘን ከትካዜ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 1
Yelemenayen dimts ersu semtwalna
Jorown wede ené azembilwalna
Bezemené hulu sit’raw enoralew (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 2
Goskwala bihonem misgana aqerbalew (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 3
Ende qalih meguwaz meramed aqtoñ
Yehatiyat menged ma’ebalu geftoñ
Wede ersu simats’en degmo sits’etset (x2)
Alasaferegnim meta bemihret (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 4
Nohn endadanekew enyanem adnen
Keqest’u endetamelit milikitin set’en

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 5
Betrih mirkuzih enesu yats’nanugn (x2)
Ante kené gara neh alferam kifun (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 6
Bebeza mihretu yalefewn t’ito
Befiqru gobegnegn alt’ewognim k’eto

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)

VERSE 7
Liqebelégn wodo fitun aberalgn (x2)
Man yiqawemegn Egziabher kalelgn (x2)

CHORUS
Egziabheren terahut behazene gize
Egziabheren terahut bechinqete gize
Awet’agn kechinqet kehazen ketikazé (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1f73aad6-d603-44e5-b23a-d73de25f1218'::uuid, 'egziabheren-terahut', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeramaw-gebriel ("Yeramaw Le’ul Gebriel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2932e3b1-348f-4f8e-8d89-4d300a93aace'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 1
ብርሃን ልብሱ እሳታዊ መልአክ
አንተ አማልደን ከመሃሪው አምላክ /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 2
የምስራች ነጋሪ ድንቅ ልደት አብሳሪ
የጽድቅ ፋና የምህረት ጎዳና /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 3
ላመኑብህ ለተማጸኑብህ
ፈጥኖ ደራሽ አለኝታቸው ነህ /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 4
የአናንያ የአዛርያ የሚሳኤል ከለላቸው
ከእሳት ነበልባል ያዳንካቸው /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 5
ምሰሶ አምባችን መጠጊያችን
ቅዱስ ገብርኤል ጠባቂያችን /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 6
ዕለት ዕለት የምንማልድህ
ልጀችህን ይምራን መንፈስህ

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 1
Birhan libsu esatawi mel’ak
Ante amalden ke-mehariw amlak (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 2
Yemesrach negari dinq lidet absari
Yetsidk fana yemihret godana (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 3
Lamenubih letemats’enubih
Fet’eno derash aleñtachew neh (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 4
YeAnanya yeAzarya yeMisa’el kelelatchew
Ke’esat nebelbal yadanekatchew (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 5
Miseso ambachin metegiyachin
Qidus Gebriel tebaqiyachin (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 6
Elet elet yeminmaldih
Lijetchihin yimran menfesih

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 1
ብርሃን ልብሱ እሳታዊ መልአክ
አንተ አማልደን ከመሃሪው አምላክ /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 2
የምስራች ነጋሪ ድንቅ ልደት አብሳሪ
የጽድቅ ፋና የምህረት ጎዳና /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 3
ላመኑብህ ለተማጸኑብህ
ፈጥኖ ደራሽ አለኝታቸው ነህ /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 4
የአናንያ የአዛርያ የሚሳኤል ከለላቸው
ከእሳት ነበልባል ያዳንካቸው /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 5
ምሰሶ አምባችን መጠጊያችን
ቅዱስ ገብርኤል ጠባቂያችን /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 6
ዕለት ዕለት የምንማልድህ
ልጀችህን ይምራን መንፈስህ

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/',
        lyrics_transliteration = 'CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 1
Birhan libsu esatawi mel’ak
Ante amalden ke-mehariw amlak (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 2
Yemesrach negari dinq lidet absari
Yetsidk fana yemihret godana (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 3
Lamenubih letemats’enubih
Fet’eno derash aleñtachew neh (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 4
YeAnanya yeAzarya yeMisa’el kelelatchew
Ke’esat nebelbal yadanekatchew (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 5
Miseso ambachin metegiyachin
Qidus Gebriel tebaqiyachin (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 6
Elet elet yeminmaldih
Lijetchihin yimran menfesih

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2932e3b1-348f-4f8e-8d89-4d300a93aace'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 1
ብርሃን ልብሱ እሳታዊ መልአክ
አንተ አማልደን ከመሃሪው አምላክ /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 2
የምስራች ነጋሪ ድንቅ ልደት አብሳሪ
የጽድቅ ፋና የምህረት ጎዳና /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 3
ላመኑብህ ለተማጸኑብህ
ፈጥኖ ደራሽ አለኝታቸው ነህ /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 4
የአናንያ የአዛርያ የሚሳኤል ከለላቸው
ከእሳት ነበልባል ያዳንካቸው /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 5
ምሰሶ አምባችን መጠጊያችን
ቅዱስ ገብርኤል ጠባቂያችን /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 6
ዕለት ዕለት የምንማልድህ
ልጀችህን ይምራን መንፈስህ

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 1
Birhan libsu esatawi mel’ak
Ante amalden ke-mehariw amlak (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 2
Yemesrach negari dinq lidet absari
Yetsidk fana yemihret godana (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 3
Lamenubih letemats’enubih
Fet’eno derash aleñtachew neh (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 4
YeAnanya yeAzarya yeMisa’el kelelatchew
Ke’esat nebelbal yadanekatchew (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 5
Miseso ambachin metegiyachin
Qidus Gebriel tebaqiyachin (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 6
Elet elet yeminmaldih
Lijetchihin yimran menfesih

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2932e3b1-348f-4f8e-8d89-4d300a93aace'::uuid, 'yeramaw-gebriel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- elel-belu ("Elel Belu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '34be9ac7-2bf3-41b8-a608-10731398321f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
ዐይቶ ዝም ላለን ጠላቶቹ ሳለን
ውለታው ብዙ ነው ክብር ለእርሱ ይሁን /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 2
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም
ምስጋና ይድረሰው ለመድኃኔዓለም /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 3
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልጆች ብሎ በመስቀል የዋለ
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያት ወርዶ ሆነ ከእኛ ጋራ /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 4
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 1
Be-hatiat barnet sin-nor tegezten
Ke-betu sin-rik tizazun afrisen
Ayito zim lalen telatochu salen
Wuletaw bizu new kibir le-irsu yihun (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 2
Rasun awardo ignan akiberen
Sigawn-na demun bilu tetu alen
Melkam eregna new yemiyasatan yelem
Misgana yidresew le-Medhane’alem (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 3
Hiywotun yesewa ende amlak man ale
Le-sew lijoch bilo be-meskel yewale
Fikru ayileka ayalkim biwora
Ke-semayat werdo hone ke-igna gara (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 4
Sirawn enadink indih le-wededen
Ke-mayalkew fikru bereket ladelen
Le-mayinegerew le-amlak sitota
Widase’n enakrib inzemir be-elelta (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
ዐይቶ ዝም ላለን ጠላቶቹ ሳለን
ውለታው ብዙ ነው ክብር ለእርሱ ይሁን /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 2
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም
ምስጋና ይድረሰው ለመድኃኔዓለም /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 3
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልጆች ብሎ በመስቀል የዋለ
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያት ወርዶ ሆነ ከእኛ ጋራ /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 4
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ',
        lyrics_transliteration = 'CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 1
Be-hatiat barnet sin-nor tegezten
Ke-betu sin-rik tizazun afrisen
Ayito zim lalen telatochu salen
Wuletaw bizu new kibir le-irsu yihun (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 2
Rasun awardo ignan akiberen
Sigawn-na demun bilu tetu alen
Melkam eregna new yemiyasatan yelem
Misgana yidresew le-Medhane’alem (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 3
Hiywotun yesewa ende amlak man ale
Le-sew lijoch bilo be-meskel yewale
Fikru ayileka ayalkim biwora
Ke-semayat werdo hone ke-igna gara (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 4
Sirawn enadink indih le-wededen
Ke-mayalkew fikru bereket ladelen
Le-mayinegerew le-amlak sitota
Widase’n enakrib inzemir be-elelta (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '34be9ac7-2bf3-41b8-a608-10731398321f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
ዐይቶ ዝም ላለን ጠላቶቹ ሳለን
ውለታው ብዙ ነው ክብር ለእርሱ ይሁን /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 2
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም
ምስጋና ይድረሰው ለመድኃኔዓለም /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 3
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልጆች ብሎ በመስቀል የዋለ
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያት ወርዶ ሆነ ከእኛ ጋራ /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ

VERSE 4
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /x2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩም ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 1
Be-hatiat barnet sin-nor tegezten
Ke-betu sin-rik tizazun afrisen
Ayito zim lalen telatochu salen
Wuletaw bizu new kibir le-irsu yihun (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 2
Rasun awardo ignan akiberen
Sigawn-na demun bilu tetu alen
Melkam eregna new yemiyasatan yelem
Misgana yidresew le-Medhane’alem (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 3
Hiywotun yesewa ende amlak man ale
Le-sew lijoch bilo be-meskel yewale
Fikru ayileka ayalkim biwora
Ke-semayat werdo hone ke-igna gara (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu

VERSE 4
Sirawn enadink indih le-wededen
Ke-mayalkew fikru bereket ladelen
Le-mayinegerew le-amlak sitota
Widase’n enakrib inzemir be-elelta (x2)

CHORUS
Elel belu be-andinet zemiru
Amesginu le-kibrum zemiru-let
Ende Igziabeher yale manim yelem belu';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '34be9ac7-2bf3-41b8-a608-10731398321f'::uuid, 'elel-belu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- maryam-argalech ("Maryam Argalech")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e846eca1-fd51-4481-be3b-f5899d08db3f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 1
የአባቱዋን ዳዊትን ትንቢት ልትፈፅም
ወርቁን ተጎናጽፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገች በእልልታ ድንግል የእኛ እናት

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 2
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 3
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 4
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 5
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 6
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 7
የአምላክ ማደሪያ ያ ቅዱስ ስጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 8
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 9
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 10
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 11
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 12
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 1
Ye abatuwa Dawitin tenbit litfetsm
Werqun tegonatsfa beqeghu litqom
Wede Amlak maderiya wede semayat

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 2
Aregech be ellilta Dengel yegna Enat
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 3
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 4
Semayat yiqefet demenam yizerga
Zimtam aynorm Eme Amlak arga
Andebet yiqefet Maryamin yamesgn

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 5
Ke zelalem tfat bemiljawa endendn
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 6
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 7
Ye Amlak maderiya ya qidus segash
Amlakn yaqefut inezya ejochish
Musna meqabir yizo alasqerachew

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 8
Tenestewal be kibr be emnet ayenachew
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 9
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 10
Hawaryat abew enkwan des alachu
Be kibr aregech Maryam mogesachu
Wede alemem wotu sebenuwan yizachu

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 11
Ye Dengel ergetwan nigeru tegtachu
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 12
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 1
የአባቱዋን ዳዊትን ትንቢት ልትፈፅም
ወርቁን ተጎናጽፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገች በእልልታ ድንግል የእኛ እናት

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 2
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 3
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 4
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 5
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 6
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 7
የአምላክ ማደሪያ ያ ቅዱስ ስጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 8
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 9
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 10
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 11
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 12
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች',
        lyrics_transliteration = 'CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 1
Ye abatuwa Dawitin tenbit litfetsm
Werqun tegonatsfa beqeghu litqom
Wede Amlak maderiya wede semayat

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 2
Aregech be ellilta Dengel yegna Enat
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 3
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 4
Semayat yiqefet demenam yizerga
Zimtam aynorm Eme Amlak arga
Andebet yiqefet Maryamin yamesgn

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 5
Ke zelalem tfat bemiljawa endendn
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 6
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 7
Ye Amlak maderiya ya qidus segash
Amlakn yaqefut inezya ejochish
Musna meqabir yizo alasqerachew

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 8
Tenestewal be kibr be emnet ayenachew
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 9
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 10
Hawaryat abew enkwan des alachu
Be kibr aregech Maryam mogesachu
Wede alemem wotu sebenuwan yizachu

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 11
Ye Dengel ergetwan nigeru tegtachu
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 12
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e846eca1-fd51-4481-be3b-f5899d08db3f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 1
የአባቱዋን ዳዊትን ትንቢት ልትፈፅም
ወርቁን ተጎናጽፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገች በእልልታ ድንግል የእኛ እናት

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 2
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 3
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 4
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 5
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 6
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 7
የአምላክ ማደሪያ ያ ቅዱስ ስጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 8
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 9
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 10
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 11
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 12
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 1
Ye abatuwa Dawitin tenbit litfetsm
Werqun tegonatsfa beqeghu litqom
Wede Amlak maderiya wede semayat

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 2
Aregech be ellilta Dengel yegna Enat
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 3
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 4
Semayat yiqefet demenam yizerga
Zimtam aynorm Eme Amlak arga
Andebet yiqefet Maryamin yamesgn

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 5
Ke zelalem tfat bemiljawa endendn
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 6
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 7
Ye Amlak maderiya ya qidus segash
Amlakn yaqefut inezya ejochish
Musna meqabir yizo alasqerachew

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 8
Tenestewal be kibr be emnet ayenachew
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 9
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 10
Hawaryat abew enkwan des alachu
Be kibr aregech Maryam mogesachu
Wede alemem wotu sebenuwan yizachu

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 11
Ye Dengel ergetwan nigeru tegtachu
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 12
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e846eca1-fd51-4481-be3b-f5899d08db3f'::uuid, 'maryam-argalech', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tigrigna-mezmur-zemari-kibrom-berhe-aytfeleyeniii ("Tigrigna Mezmur _ Zemari Kibrom Berhe _ Aytfeleyeniii")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e99d9e09-5022-4ae6-8c7f-426746cee69e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 1
ቃንዛይ ከቢዱ ኮይኑ ልዕሊ ልሳን
ሻቕሎት በዚሑ ኣብዩኒ ልበይ ምቕሳን
ዘለላ ንብዓተይ ካብ ኣርያም ጠሚትካ
" ኣጆኻ" በለኒ ብዘዕርፍ ቃልካ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 2
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ
ኣብ መስርሕ ሂወት ግድን''ዩ ምልኣት ጉድለት
ሕጊ ተፈጥሮ''ዩ ሕጊ ምንባር ምሟት

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 3
ንስኻ አይትጋገን ዋላ ሽሕ እንተጓሃኹ
ካብ ከርሲ ኣደይ''ውን ጥራየይ ወጻኹ
ኦ መንፈስቅዱስ ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 4
ዓቕሚ ፍጠረለይ ጎይታ ደጊመ ኸይነብዕ
ሂቡ ወሲዱ ኢለ ከም ኢዮብ ክጸንዕ
ኣዒንተይ ኣልዒለ ናብቲ ኣብ ኢደይ ዘሎ
ተመስገን ዝብለሉ ንኹሉ ዝኽእሎ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 5
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 1
Qanzay kebidu koynu lieli lisan
Shaቕlot bezihu abyuni libey miቕsan
Zelela nibatey kab aryam t’emitka
" ajoኻ" beleni bizeerf qalka

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 2
O Egziabher hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani
Ab mesrh hiwet gidn''yu milat gudlet
Higi tefet’ro''yu higi minbar mimwat

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 3
Nisኻ aytgagen wala shh entegwahaኹ
Kab kersi adey''win t’rayey wets’aኹ
O Menfes Kidus hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 4
Aቕmi fit’ereley goyta degime ኸynebe
Hibu wesidu ile kem iyob kits’ene
Aintey alile nabti ab idey zelo
Temesgen ziblelu niኹlu ziኽelo

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 5
O Egziabher hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 1
ቃንዛይ ከቢዱ ኮይኑ ልዕሊ ልሳን
ሻቕሎት በዚሑ ኣብዩኒ ልበይ ምቕሳን
ዘለላ ንብዓተይ ካብ ኣርያም ጠሚትካ
" ኣጆኻ" በለኒ ብዘዕርፍ ቃልካ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 2
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ
ኣብ መስርሕ ሂወት ግድን''ዩ ምልኣት ጉድለት
ሕጊ ተፈጥሮ''ዩ ሕጊ ምንባር ምሟት

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 3
ንስኻ አይትጋገን ዋላ ሽሕ እንተጓሃኹ
ካብ ከርሲ ኣደይ''ውን ጥራየይ ወጻኹ
ኦ መንፈስቅዱስ ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 4
ዓቕሚ ፍጠረለይ ጎይታ ደጊመ ኸይነብዕ
ሂቡ ወሲዱ ኢለ ከም ኢዮብ ክጸንዕ
ኣዒንተይ ኣልዒለ ናብቲ ኣብ ኢደይ ዘሎ
ተመስገን ዝብለሉ ንኹሉ ዝኽእሎ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 5
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ',
        lyrics_transliteration = 'CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 1
Qanzay kebidu koynu lieli lisan
Shaቕlot bezihu abyuni libey miቕsan
Zelela nibatey kab aryam t’emitka
" ajoኻ" beleni bizeerf qalka

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 2
O Egziabher hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani
Ab mesrh hiwet gidn''yu milat gudlet
Higi tefet’ro''yu higi minbar mimwat

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 3
Nisኻ aytgagen wala shh entegwahaኹ
Kab kersi adey''win t’rayey wets’aኹ
O Menfes Kidus hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 4
Aቕmi fit’ereley goyta degime ኸynebe
Hibu wesidu ile kem iyob kits’ene
Aintey alile nabti ab idey zelo
Temesgen ziblelu niኹlu ziኽelo

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey

VERSE 5
O Egziabher hayley aytfeleyeni:aytfeleyeni
Gulbetey debesey ats’enanani : ats’enanani

CHORUS
Ainti ኹlom niaኻ yits’beya
Bibrtue bahgi midhanka kireya
Tesfa seniቐ ts’bah kiኾn senay
Yits’bey aleኹ niaኻ debesey',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e99d9e09-5022-4ae6-8c7f-426746cee69e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 1
ቃንዛይ ከቢዱ ኮይኑ ልዕሊ ልሳን
ሻቕሎት በዚሑ ኣብዩኒ ልበይ ምቕሳን
ዘለላ ንብዓተይ ካብ ኣርያም ጠሚትካ
" ኣጆኻ" በለኒ ብዘዕርፍ ቃልካ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 2
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ
ኣብ መስርሕ ሂወት ግድን''ዩ ምልኣት ጉድለት
ሕጊ ተፈጥሮ''ዩ ሕጊ ምንባር ምሟት

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 3
ንስኻ አይትጋገን ዋላ ሽሕ እንተጓሃኹ
ካብ ከርሲ ኣደይ''ውን ጥራየይ ወጻኹ
ኦ መንፈስቅዱስ ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 4
ዓቕሚ ፍጠረለይ ጎይታ ደጊመ ኸይነብዕ
ሂቡ ወሲዱ ኢለ ከም ኢዮብ ክጸንዕ
ኣዒንተይ ኣልዒለ ናብቲ ኣብ ኢደይ ዘሎ
ተመስገን ዝብለሉ ንኹሉ ዝኽእሎ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ

VERSE 5
ኦ እግዚአብሔር ሓይለይ አይትፈለየኒ:አይትፈለየኒ
ጉልበተይ ደበሰይ አጸናንዐኒ : አጸናንዐኒ

CHORUS
ኣዒንቲ ኹሎም ንዓኻ ይጽበያ
ብብርቱዕ ባህጊ ምድሓንካ ክርእያ
ተስፋ ሰኒቐ ፅባሕ ክኾን ሰናይ
ይጽበይ ኣለኹ ንዓኻ ደበሰይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e99d9e09-5022-4ae6-8c7f-426746cee69e'::uuid, 'tigrigna-mezmur-zemari-kibrom-berhe-aytfeleyeniii', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tv-dekimwo-nebsey ("TV-DEKIMWO NEBSEY")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2dc4dcd1-f718-454a-88be-9d6aac303b09'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 1
ፍቕሪ ከሲረ ተለመን ጎይታይ በለኒ ይቕረ።
ድምጽኻ ድምጺ ፍትወይ እዃሕኩሐ ማዕጾ
ድቃስ ሓጢያት ደቂሰ ምስ ዘይርጉእ ቀልበይ
ርእስኻ ህቦ ጎተናኻ ጠሊ እናመልኣ ኣብቲ ግዜ ለይቲ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 2
ኢድካ ሰዲድካ ምስ ከድካ ኻባይ
መፍቶ ጸላኢ ኮይና ሂወተይ
ኣየናይ ኢለዮ ፍቅርኻ ንዓይ
ኣብ ርእሰይ ተወኪለ ብሃውሪ ኪነብር

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 3
ምስትውዓል ዝጎደሎ ሂወተይ ክዝክር
ግርም ይብለኒ ኣንታ ኣምላኸይ
ብዘይ ብኣኻ ክመርሓ ሂወተይ
እተዕርፈሉ ቦታ በይንኻ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 4
ኣብ ውሽጠይ ከሎ ደገ ደልየካ
ንዓ ተመለስ ናብ ቤት ባርያኻ።
ድሃይ ውሽጠይ ከዳምጺ ቃልካ ዘንጊዐዮ
ጸውጽዋይ ናይ ዓለም ቁምነገር ጌረዮ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 5
ብክልተ እግረይ ደው እንተ በልኩ
እናመሰለኒ ብርእሰይ ዝቖምኩ
ዝርጉሕ ቅልጽምካ ክድግፈኒ
ተመለስ ደኣ ዳግም ኳሕኩሓኒ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 6
ብዘይ ፍቕርኻ እንታይ ኣሎኒ።

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 1
Fiቕri kesire telemen goytay beleni yiቕre.
Dimts’ኻ dimts’i fitwey ekhwahkuhe maets’o
Diqas hat’iyat deqise mis zeyrgue qelbey
Riesኻ hibo gotenaኻ t’eli enamela abti gize leyti

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 2
Idka sedidka mis kedka ኻbay
Mefto ts’elai koyna hiwetey
Ayenay ileyo fiqrኻ niay
Ab riesey tewekile bihawri kinebr

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 3
Mistwal zigodelo hiwetey kizkr
Girm yibleni anta amlaኸy
Bizey biaኻ kimerha hiwetey
Eteerfelu bota beynኻ

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 4
Ab wisht’ey kelo dege delyeka
Nia temeles nab bet baryaኻ.
Dihay wisht’ey kedamts’i qalka zengiayo
Ts’ewts’way nay alem qumneger gereyo

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 5
Biklte egrey dew ente belku
Enameseleni biresey ziቖmku
Zirguh qilts’mka kidgfeni
Temeles dea dagm kwahkuhani

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 6
Bizey fiቕrኻ entay aloni.

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 1
ፍቕሪ ከሲረ ተለመን ጎይታይ በለኒ ይቕረ።
ድምጽኻ ድምጺ ፍትወይ እዃሕኩሐ ማዕጾ
ድቃስ ሓጢያት ደቂሰ ምስ ዘይርጉእ ቀልበይ
ርእስኻ ህቦ ጎተናኻ ጠሊ እናመልኣ ኣብቲ ግዜ ለይቲ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 2
ኢድካ ሰዲድካ ምስ ከድካ ኻባይ
መፍቶ ጸላኢ ኮይና ሂወተይ
ኣየናይ ኢለዮ ፍቅርኻ ንዓይ
ኣብ ርእሰይ ተወኪለ ብሃውሪ ኪነብር

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 3
ምስትውዓል ዝጎደሎ ሂወተይ ክዝክር
ግርም ይብለኒ ኣንታ ኣምላኸይ
ብዘይ ብኣኻ ክመርሓ ሂወተይ
እተዕርፈሉ ቦታ በይንኻ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 4
ኣብ ውሽጠይ ከሎ ደገ ደልየካ
ንዓ ተመለስ ናብ ቤት ባርያኻ።
ድሃይ ውሽጠይ ከዳምጺ ቃልካ ዘንጊዐዮ
ጸውጽዋይ ናይ ዓለም ቁምነገር ጌረዮ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 5
ብክልተ እግረይ ደው እንተ በልኩ
እናመሰለኒ ብርእሰይ ዝቖምኩ
ዝርጉሕ ቅልጽምካ ክድግፈኒ
ተመለስ ደኣ ዳግም ኳሕኩሓኒ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 6
ብዘይ ፍቕርኻ እንታይ ኣሎኒ።

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት',
        lyrics_transliteration = 'CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 1
Fiቕri kesire telemen goytay beleni yiቕre.
Dimts’ኻ dimts’i fitwey ekhwahkuhe maets’o
Diqas hat’iyat deqise mis zeyrgue qelbey
Riesኻ hibo gotenaኻ t’eli enamela abti gize leyti

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 2
Idka sedidka mis kedka ኻbay
Mefto ts’elai koyna hiwetey
Ayenay ileyo fiqrኻ niay
Ab riesey tewekile bihawri kinebr

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 3
Mistwal zigodelo hiwetey kizkr
Girm yibleni anta amlaኸy
Bizey biaኻ kimerha hiwetey
Eteerfelu bota beynኻ

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 4
Ab wisht’ey kelo dege delyeka
Nia temeles nab bet baryaኻ.
Dihay wisht’ey kedamts’i qalka zengiayo
Ts’ewts’way nay alem qumneger gereyo

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 5
Biklte egrey dew ente belku
Enameseleni biresey ziቖmku
Zirguh qilts’mka kidgfeni
Temeles dea dagm kwahkuhani

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 6
Bizey fiቕrኻ entay aloni.

CHORUS
Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2dc4dcd1-f718-454a-88be-9d6aac303b09'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 1
ፍቕሪ ከሲረ ተለመን ጎይታይ በለኒ ይቕረ።
ድምጽኻ ድምጺ ፍትወይ እዃሕኩሐ ማዕጾ
ድቃስ ሓጢያት ደቂሰ ምስ ዘይርጉእ ቀልበይ
ርእስኻ ህቦ ጎተናኻ ጠሊ እናመልኣ ኣብቲ ግዜ ለይቲ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 2
ኢድካ ሰዲድካ ምስ ከድካ ኻባይ
መፍቶ ጸላኢ ኮይና ሂወተይ
ኣየናይ ኢለዮ ፍቅርኻ ንዓይ
ኣብ ርእሰይ ተወኪለ ብሃውሪ ኪነብር

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 3
ምስትውዓል ዝጎደሎ ሂወተይ ክዝክር
ግርም ይብለኒ ኣንታ ኣምላኸይ
ብዘይ ብኣኻ ክመርሓ ሂወተይ
እተዕርፈሉ ቦታ በይንኻ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 4
ኣብ ውሽጠይ ከሎ ደገ ደልየካ
ንዓ ተመለስ ናብ ቤት ባርያኻ።
ድሃይ ውሽጠይ ከዳምጺ ቃልካ ዘንጊዐዮ
ጸውጽዋይ ናይ ዓለም ቁምነገር ጌረዮ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 5
ብክልተ እግረይ ደው እንተ በልኩ
እናመሰለኒ ብርእሰይ ዝቖምኩ
ዝርጉሕ ቅልጽምካ ክድግፈኒ
ተመለስ ደኣ ዳግም ኳሕኩሓኒ

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 6
ብዘይ ፍቕርኻ እንታይ ኣሎኒ።

CHORUS
ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2dc4dcd1-f718-454a-88be-9d6aac303b09'::uuid, 'tv-dekimwo-nebsey', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- the-purest-of-the-pure ("The Purest of the Pure")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ebc896bf-e2aa-424a-8b39-be7a8fc56c40'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 1
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 2
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 3
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 4
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 5
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 6
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 7
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 8
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 9
The adorned temple of God
The queen who will stand upon God''s right side
When Eve sinned, we were exiled
But we''re given a mother who''s our pride

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 10
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 11
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 12
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 13
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 14
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 15
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 16
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 17
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 18
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 1
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 2
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 3
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 4
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 5
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 6
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 7
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 8
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 9
The adorned temple of God
The queen who will stand upon God''s right side
When Eve sinned, we were exiled
But we''re given a mother who''s our pride

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 10
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 11
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 12
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 13
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 14
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 15
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 16
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 17
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 18
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ebc896bf-e2aa-424a-8b39-be7a8fc56c40'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 1
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 2
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 3
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 4
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 5
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 6
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 7
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 8
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 9
The adorned temple of God
The queen who will stand upon God''s right side
When Eve sinned, we were exiled
But we''re given a mother who''s our pride

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 10
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 11
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 12
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 13
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 14
The unborn bow down to you
The angels astonished by your meekness
And the elders praise you too
For you''ve begotten their Master Jesus

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 15
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 16
The purest of the pure you are
The holiest of the holies by far
The shiniest of all the stars
The purest of the pure you are

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 17
The holiest of the holies by far
The shiniest of all the stars

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

VERSE 18
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish

CHORUS
The garden enclosed my dove
There is no spot unto you or blemish
A fountain sealed from above
Intercede for us so we won''t perish'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ebc896bf-e2aa-424a-8b39-be7a8fc56c40'::uuid, 'the-purest-of-the-pure', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ende-egziabher-yale-manem-yelemna ("Ende Egziabher Yale Manem Yelemna")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1d60b8e3-416f-4348-b73a-725fd67ed4df'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 1
ባሕር ተከፈለ እስኪታይ መሬቱ
ፈርዖን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ጸንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኸው ፈራርሶ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንጸናለን በእርሱ ተደግፈን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 3
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን
ተሸነፈ አዳኝ ጠላታችን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 4
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ
የድንግል ልጅ እኛ የምናመልከው
መድሃኒአለም የለም የሚሳነው

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 1
Baher tekefele eskitay meretu
Fereon wedeke alseram timkhetu
Dekamochum tsentew teramedu
Haylegnochum yehew tewaredu

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 2
Yeyariko kiter yemaydeferew
Yehew ferarese yesew ej saynekaw
Haylegnochum bibertatuben
Entsenalen bersu tedegfen

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 3
Yetewerewerew yetelatachen tor
Meda lay wedeke gasha hono Egziabher
LeSilassie yedres mesganachen
Teshenefe adagn telatachen

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 4
Baher lay siramed moges alew ersu
Begrmaw sinesa tset yelal nifasu
YeDingel lij egna menamelkew
Medhanialem yelem misanew

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 1
ባሕር ተከፈለ እስኪታይ መሬቱ
ፈርዖን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ጸንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኸው ፈራርሶ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንጸናለን በእርሱ ተደግፈን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 3
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን
ተሸነፈ አዳኝ ጠላታችን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 4
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ
የድንግል ልጅ እኛ የምናመልከው
መድሃኒአለም የለም የሚሳነው

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/',
        lyrics_transliteration = 'CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 1
Baher tekefele eskitay meretu
Fereon wedeke alseram timkhetu
Dekamochum tsentew teramedu
Haylegnochum yehew tewaredu

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 2
Yeyariko kiter yemaydeferew
Yehew ferarese yesew ej saynekaw
Haylegnochum bibertatuben
Entsenalen bersu tedegfen

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 3
Yetewerewerew yetelatachen tor
Meda lay wedeke gasha hono Egziabher
LeSilassie yedres mesganachen
Teshenefe adagn telatachen

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 4
Baher lay siramed moges alew ersu
Begrmaw sinesa tset yelal nifasu
YeDingel lij egna menamelkew
Medhanialem yelem misanew

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1d60b8e3-416f-4348-b73a-725fd67ed4df'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 1
ባሕር ተከፈለ እስኪታይ መሬቱ
ፈርዖን ወደቀ አልሰራም ትምክህቱ
ደካሞቹም ጸንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 2
የኢያሪኮ ቅጥር የማይደፈረው
ይኸው ፈራርሶ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን
እንጸናለን በእርሱ ተደግፈን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 3
የተወረወረው የጠላታችን ጦር
ሜዳ ላይ ወደቀ ጋሻ ሆኖ እግዚአብሔር
ለሥላሴ ይድረስ ምስጋናችን
ተሸነፈ አዳኝ ጠላታችን

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/

VERSE 4
ባሕር ላይ ሲራመድ ሞገስ አለው እርሱ
በግርማው ሲነሳ ጸጥ ይላል ነፋሱ
የድንግል ልጅ እኛ የምናመልከው
መድሃኒአለም የለም የሚሳነው

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 1
Baher tekefele eskitay meretu
Fereon wedeke alseram timkhetu
Dekamochum tsentew teramedu
Haylegnochum yehew tewaredu

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 2
Yeyariko kiter yemaydeferew
Yehew ferarese yesew ej saynekaw
Haylegnochum bibertatuben
Entsenalen bersu tedegfen

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 3
Yetewerewerew yetelatachen tor
Meda lay wedeke gasha hono Egziabher
LeSilassie yedres mesganachen
Teshenefe adagn telatachen

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/

VERSE 4
Baher lay siramed moges alew ersu
Begrmaw sinesa tset yelal nifasu
YeDingel lij egna menamelkew
Medhanialem yelem misanew

CHORUS
Ende Egziabher yale manem yelemna
Elel belu kumu lemesgana /2/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1d60b8e3-416f-4348-b73a-725fd67ed4df'::uuid, 'ende-egziabher-yale-manem-yelemna', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidanish-megbiya-bare-orthodox ("Kidanish megbiya bare Orthodox")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '353fbb7c-1a96-4589-a5df-3399628fb063'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 1
መልካሟ እርግብ እመቤቴ
አትለይኝ ነይ ከቤቴ
ያላንቺ እኔን ማን ያውቀኛል
ምልክቴ ሆነሽኛል

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 2
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
ምን እምነት ነው እል ነበረ
ቅዱሳኑን ያመነነ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 3
መከራ ውስጥ ለካ ሚያዩሽ
የማጠፊ ብርሀን ነሽ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 4
፨ለዘላለም ካንቺ ጋራ
እንድጸና በምስጋና
በኪዳንሽ ታምኛለዉ
ይህን አለም ንቄዋለዉ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 5
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨ካከበሩሽ አባቶቼ
በፍቅር ቃል ተሞልቼ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 6
ሰዓሊለነ እልሻለዉ
እንዴልጎድል እኔም ከመንጋዉ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 7
፨ባታይብኝ መልካም ፍሬ
በትህትና ተሰብሬ
የእምነትሽን ጥሩር ልልበስ
በቀዳሹ እንድቀደስ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 8
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨በወንጌል ቃል ተጫምቼ
የእምነትን ጋሻ አንስቼ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 9
በጽድቅ ፍኖት እንድራመድ
ምርኩዝ ሁኚኝ ስንገዳገድ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 1
Melkamwa ergb Emebete
Atleygn ney kebete
Yalanchi enen man yawqegnal
Milkte honeshgnal

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 2
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Min emnet new el nebere
Qidusanun yamenene

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 3
Mekera wist’ leka miyayush
Yemat’efi birhen nesh
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 4
Lezelalem kanchi gara
Endts’ena bemsgana
Bekidansh tamgnalewu
Yihn alem niqewalewu

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 5
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Kakeberush abatoche
Befqr qal temolche

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 6
Sealilene elshalewu
Endelgodl enem kemengawu
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 7
Bataybgn melkam fire
Bethtna tesebre
Yeemnetshn t’rur lilbes
Beqedashu endqedes

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 8
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Bewengel qal tech’amche
Yeemnetn gasha ansche

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 9
Bets’dq finot endramed
Mirkuz hugnign singedaged
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 1
መልካሟ እርግብ እመቤቴ
አትለይኝ ነይ ከቤቴ
ያላንቺ እኔን ማን ያውቀኛል
ምልክቴ ሆነሽኛል

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 2
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
ምን እምነት ነው እል ነበረ
ቅዱሳኑን ያመነነ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 3
መከራ ውስጥ ለካ ሚያዩሽ
የማጠፊ ብርሀን ነሽ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 4
፨ለዘላለም ካንቺ ጋራ
እንድጸና በምስጋና
በኪዳንሽ ታምኛለዉ
ይህን አለም ንቄዋለዉ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 5
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨ካከበሩሽ አባቶቼ
በፍቅር ቃል ተሞልቼ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 6
ሰዓሊለነ እልሻለዉ
እንዴልጎድል እኔም ከመንጋዉ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 7
፨ባታይብኝ መልካም ፍሬ
በትህትና ተሰብሬ
የእምነትሽን ጥሩር ልልበስ
በቀዳሹ እንድቀደስ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 8
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨በወንጌል ቃል ተጫምቼ
የእምነትን ጋሻ አንስቼ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 9
በጽድቅ ፍኖት እንድራመድ
ምርኩዝ ሁኚኝ ስንገዳገድ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ',
        lyrics_transliteration = 'CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 1
Melkamwa ergb Emebete
Atleygn ney kebete
Yalanchi enen man yawqegnal
Milkte honeshgnal

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 2
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Min emnet new el nebere
Qidusanun yamenene

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 3
Mekera wist’ leka miyayush
Yemat’efi birhen nesh
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 4
Lezelalem kanchi gara
Endts’ena bemsgana
Bekidansh tamgnalewu
Yihn alem niqewalewu

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 5
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Kakeberush abatoche
Befqr qal temolche

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 6
Sealilene elshalewu
Endelgodl enem kemengawu
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 7
Bataybgn melkam fire
Bethtna tesebre
Yeemnetshn t’rur lilbes
Beqedashu endqedes

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 8
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)
Bewengel qal tech’amche
Yeemnetn gasha ansche

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re

VERSE 9
Bets’dq finot endramed
Mirkuz hugnign singedaged
Kidanemhret emebet
Matrefiyaye nesh yesemayun rist (2)

CHORUS
Emnetsh emnete new
Kidansh megbiya bere
Yalanchi erst yelegn
Bichayen teqot’re',
        updated_at = clock_timestamp()::text
    WHERE import_id = '353fbb7c-1a96-4589-a5df-3399628fb063'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 1
መልካሟ እርግብ እመቤቴ
አትለይኝ ነይ ከቤቴ
ያላንቺ እኔን ማን ያውቀኛል
ምልክቴ ሆነሽኛል

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 2
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
ምን እምነት ነው እል ነበረ
ቅዱሳኑን ያመነነ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 3
መከራ ውስጥ ለካ ሚያዩሽ
የማጠፊ ብርሀን ነሽ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 4
፨ለዘላለም ካንቺ ጋራ
እንድጸና በምስጋና
በኪዳንሽ ታምኛለዉ
ይህን አለም ንቄዋለዉ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 5
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨ካከበሩሽ አባቶቼ
በፍቅር ቃል ተሞልቼ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 6
ሰዓሊለነ እልሻለዉ
እንዴልጎድል እኔም ከመንጋዉ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 7
፨ባታይብኝ መልካም ፍሬ
በትህትና ተሰብሬ
የእምነትሽን ጥሩር ልልበስ
በቀዳሹ እንድቀደስ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 8
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)
፨በወንጌል ቃል ተጫምቼ
የእምነትን ጋሻ አንስቼ

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ

VERSE 9
በጽድቅ ፍኖት እንድራመድ
ምርኩዝ ሁኚኝ ስንገዳገድ
ኪዳነምህረት እመቤት
ማትረፊያዬ ነሽ የሰማዩን ርስት(2)

CHORUS
እምነትሽ እምነቴ ነው
ኪዳንሽ መግቢያ በሬ
ያላንቺ እርስት የለኝ
ብቻዬን ተቆጥሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '353fbb7c-1a96-4589-a5df-3399628fb063'::uuid, 'kidanish-megbiya-bare-orthodox', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- without-you-my-lord ("Without You My Lord")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2789ea5e-125f-40a3-817d-97063ab05380'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 1
Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 2
As you held my hand and led me to You
I conquered the trials and misery too
I''ll leave them behind the hardships will pass
My hunger and pain I''ll forget at last

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 3
With Your blessings my chalice overflowed
I was unscathed by the rival''s arrow
With thousands of words I will fill my mouth
Your marvelous deeds I will sing about

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 4
If my slayer walks through the night and day
While my savior God is with me to stay
Death lost its power I shall have no fear
I''ll worship my King throughout all my years

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 5
The praise of angels became daily bread
Consumed by Your love my songs I''ll extend
My despair is gone for hope is risen
The glory that''s due to you I''ve given

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 6
Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 1
Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 2
As you held my hand and led me to You
I conquered the trials and misery too
I''ll leave them behind the hardships will pass
My hunger and pain I''ll forget at last

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 3
With Your blessings my chalice overflowed
I was unscathed by the rival''s arrow
With thousands of words I will fill my mouth
Your marvelous deeds I will sing about

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 4
If my slayer walks through the night and day
While my savior God is with me to stay
Death lost its power I shall have no fear
I''ll worship my King throughout all my years

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 5
The praise of angels became daily bread
Consumed by Your love my songs I''ll extend
My despair is gone for hope is risen
The glory that''s due to you I''ve given

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 6
Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved',
        lyrics_transliteration = 'Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2789ea5e-125f-40a3-817d-97063ab05380'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 1
Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 2
As you held my hand and led me to You
I conquered the trials and misery too
I''ll leave them behind the hardships will pass
My hunger and pain I''ll forget at last

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 3
With Your blessings my chalice overflowed
I was unscathed by the rival''s arrow
With thousands of words I will fill my mouth
Your marvelous deeds I will sing about

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 4
If my slayer walks through the night and day
While my savior God is with me to stay
Death lost its power I shall have no fear
I''ll worship my King throughout all my years

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 5
The praise of angels became daily bread
Consumed by Your love my songs I''ll extend
My despair is gone for hope is risen
The glory that''s due to you I''ve given

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 6
Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane

CHORUS
Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2789ea5e-125f-40a3-817d-97063ab05380'::uuid, 'without-you-my-lord', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kirisitiyaniyu-simey-new-eritrean-orthodox-tewahdo-mezmur-zemari-bereket ("#kirisitiyaniyu_simey_new_eritrean_orthodox_tewahdo_mezmur_zemari_Bereket_tikue_2021_2014")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2b593c1e-092e-485f-9545-9522f248b850'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 1
ደገይ ጻዕዳ ጌይረ ብውሽጠይ ግን ጸላም
ስመይ ናይ ክርስቶስ ግብረይ ግን ናይ ዓለም
ከም ልቚሉቚ መቃብር በድኒ ተሸኪመ
ብሙስሉይ መንገዲ ክንደይ ድየ ሳጒመ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 2
ውሻጠ ውሻጠይ ንስኻ''ኻ ትፈልጦ
ሓደራኻ ጎይታይ ሂወተይ ለውጦ
ይኣክል ሎሚ''ሲ በቃ ይእከለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 3
ብሓቀኛ መንነት ኣነ ከኽብረካ
ብስጋ ብነፍሲ ክግዛእ ንዓኻ
በደለይ ረሲዕካ ይቕረ በለኒ''ኻ‘ሞ
ዘመነይ ኣብ ቤትካ ኮይነ ክዛዝሞ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 1
Degey ts’aeda geyre biwsht’ey gin ts’elam
Simey nay Kristos gibrey gin nay alem
Kem liቚluቚ meqabr bedni teshekime
Bimusluy mengedi kindey diye sagwime

CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 2
Wishat’e wishat’ey nisኻ''ኻ tifelt’o
Haderaኻ goytay hiwetey lewt’o
Yiakl lomi''si beqa yiekeleni
Zeynsey mimsaley ts’oru kebiduni

CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 3
Bihaqegna mennet ane keኽbreka
Bisga binefsi kigzae niaኻ
Bedeley resieka yiቕre beleni''ኻ‘mo
Zemeney ab betka koyne kizazmo

CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 1
ደገይ ጻዕዳ ጌይረ ብውሽጠይ ግን ጸላም
ስመይ ናይ ክርስቶስ ግብረይ ግን ናይ ዓለም
ከም ልቚሉቚ መቃብር በድኒ ተሸኪመ
ብሙስሉይ መንገዲ ክንደይ ድየ ሳጒመ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 2
ውሻጠ ውሻጠይ ንስኻ''ኻ ትፈልጦ
ሓደራኻ ጎይታይ ሂወተይ ለውጦ
ይኣክል ሎሚ''ሲ በቃ ይእከለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 3
ብሓቀኛ መንነት ኣነ ከኽብረካ
ብስጋ ብነፍሲ ክግዛእ ንዓኻ
በደለይ ረሲዕካ ይቕረ በለኒ''ኻ‘ሞ
ዘመነይ ኣብ ቤትካ ኮይነ ክዛዝሞ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)',
        lyrics_transliteration = 'CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 1
Degey ts’aeda geyre biwsht’ey gin ts’elam
Simey nay Kristos gibrey gin nay alem
Kem liቚluቚ meqabr bedni teshekime
Bimusluy mengedi kindey diye sagwime

CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 2
Wishat’e wishat’ey nisኻ''ኻ tifelt’o
Haderaኻ goytay hiwetey lewt’o
Yiakl lomi''si beqa yiekeleni
Zeynsey mimsaley ts’oru kebiduni

CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 3
Bihaqegna mennet ane keኽbreka
Bisga binefsi kigzae niaኻ
Bedeley resieka yiቕre beleni''ኻ‘mo
Zemeney ab betka koyne kizazmo

CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2b593c1e-092e-485f-9545-9522f248b850'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 1
ደገይ ጻዕዳ ጌይረ ብውሽጠይ ግን ጸላም
ስመይ ናይ ክርስቶስ ግብረይ ግን ናይ ዓለም
ከም ልቚሉቚ መቃብር በድኒ ተሸኪመ
ብሙስሉይ መንገዲ ክንደይ ድየ ሳጒመ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 2
ውሻጠ ውሻጠይ ንስኻ''ኻ ትፈልጦ
ሓደራኻ ጎይታይ ሂወተይ ለውጦ
ይኣክል ሎሚ''ሲ በቃ ይእከለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 3
ብሓቀኛ መንነት ኣነ ከኽብረካ
ብስጋ ብነፍሲ ክግዛእ ንዓኻ
በደለይ ረሲዕካ ይቕረ በለኒ''ኻ‘ሞ
ዘመነይ ኣብ ቤትካ ኮይነ ክዛዝሞ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2b593c1e-092e-485f-9545-9522f248b850'::uuid, 'kirisitiyaniyu-simey-new-eritrean-orthodox-tewahdo-mezmur-zemari-bereket', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- talaku-melaek-mikaiel-yinegesal ("Talaku Melaek Mikaiel Yinegesal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1f7bcfd9-d2f6-4b80-b4e5-6111595e66f4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 1
የማይቋረጥ ልዩ ምስጋና
አለኝ ሚካኤል ለክብርህ ገና
ንገስ በእልልታ ታላቅ ነህ እና
ህዝቤን ልትረዳ ወጥተሃል እና

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 2
ታላቁ መልዐክ ሚካኤል ይነግሳል
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 3
መጣ ከሰማይ በልዩ ግርማ
አህያ አየችው ከበልዓም ቀድማ
ለታላቅ ክብሩ ሰገደችለት
አየ በልዓም አይኑ ሲከፈት

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 4
አይሰራም መርገም በአምላክ ህዝብ ላይ
አንተን ሊቋቋም መጥቷል ከሰማይ
ቃሉ በአማረ ልዩ ምስጋና
ታላቁ መልዐክ ሚካኤል ይነግሳልና

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 5
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 1
Yemaykwaret liyu misgana
Alegn Mikaiel lekibirih gena
Niges be''illilta talak neh ena
Hizbien litreda wetahaleh ena

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 2
Talaku melaek Mikaiel yinegesal
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 3
Meta kesemay beliyu girma
Ahiya aychew kebelam qedma
Letalak kbiru segedechilet
Aye belam aynu sikfet

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 4
Ayseram mergem beamalak hizb lay
Ante litqaqwam metah kesemay
Qalu beamare liyu misgana
Talaku melaek Mikaiel yinegesalna

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 5
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 1
የማይቋረጥ ልዩ ምስጋና
አለኝ ሚካኤል ለክብርህ ገና
ንገስ በእልልታ ታላቅ ነህ እና
ህዝቤን ልትረዳ ወጥተሃል እና

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 2
ታላቁ መልዐክ ሚካኤል ይነግሳል
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 3
መጣ ከሰማይ በልዩ ግርማ
አህያ አየችው ከበልዓም ቀድማ
ለታላቅ ክብሩ ሰገደችለት
አየ በልዓም አይኑ ሲከፈት

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 4
አይሰራም መርገም በአምላክ ህዝብ ላይ
አንተን ሊቋቋም መጥቷል ከሰማይ
ቃሉ በአማረ ልዩ ምስጋና
ታላቁ መልዐክ ሚካኤል ይነግሳልና

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 5
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል',
        lyrics_transliteration = 'CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 1
Yemaykwaret liyu misgana
Alegn Mikaiel lekibirih gena
Niges be''illilta talak neh ena
Hizbien litreda wetahaleh ena

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 2
Talaku melaek Mikaiel yinegesal
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 3
Meta kesemay beliyu girma
Ahiya aychew kebelam qedma
Letalak kbiru segedechilet
Aye belam aynu sikfet

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 4
Ayseram mergem beamalak hizb lay
Ante litqaqwam metah kesemay
Qalu beamare liyu misgana
Talaku melaek Mikaiel yinegesalna

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 5
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1f7bcfd9-d2f6-4b80-b4e5-6111595e66f4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 1
የማይቋረጥ ልዩ ምስጋና
አለኝ ሚካኤል ለክብርህ ገና
ንገስ በእልልታ ታላቅ ነህ እና
ህዝቤን ልትረዳ ወጥተሃል እና

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 2
ታላቁ መልዐክ ሚካኤል ይነግሳል
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 3
መጣ ከሰማይ በልዩ ግርማ
አህያ አየችው ከበልዓም ቀድማ
ለታላቅ ክብሩ ሰገደችለት
አየ በልዓም አይኑ ሲከፈት

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 4
አይሰራም መርገም በአምላክ ህዝብ ላይ
አንተን ሊቋቋም መጥቷል ከሰማይ
ቃሉ በአማረ ልዩ ምስጋና
ታላቁ መልዐክ ሚካኤል ይነግሳልና

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

VERSE 5
ይነግሳል በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል

CHORUS
ታላቁ መልዐክ ሚካኤል ይነግሳል
በእልልታ ይንግሳል በዝማሬ ይነግሳል
ታላቁ መልዐክ ሚካኤል ይነግሳል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 1
Yemaykwaret liyu misgana
Alegn Mikaiel lekibirih gena
Niges be''illilta talak neh ena
Hizbien litreda wetahaleh ena

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 2
Talaku melaek Mikaiel yinegesal
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 3
Meta kesemay beliyu girma
Ahiya aychew kebelam qedma
Letalak kbiru segedechilet
Aye belam aynu sikfet

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 4
Ayseram mergem beamalak hizb lay
Ante litqaqwam metah kesemay
Qalu beamare liyu misgana
Talaku melaek Mikaiel yinegesalna

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

VERSE 5
Yinegesal be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal

CHORUS
Talaku melaek Mikaiel yinegesal
Be''illilta yingesal bezemare yinegesal
Talaku melaek Mikaiel yinegesal';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1f7bcfd9-d2f6-4b80-b4e5-6111595e66f4'::uuid, 'talaku-melaek-mikaiel-yinegesal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
