-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 11 OF 32
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
  -- tabiswal-enibaye ("Tabiswal Enibaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '172a63bd-f570-4fe9-a3a6-21e3aaf3d916'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 1
ነፍሴን ያስጨነቃት ያዘን ወላፍኑ
ማልቀስ ብቻ ሁኖ ዘወትር ስራዬ
ኣናግርሻለሁ ሁኜ ለብቻዬ//፪//
ድንግል ደርሽልኝ ህልሜን ፋታሽልኝ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 2
ኣልኩኝ ቀና ቀና ያም ቀን ኣለፈና
ኣዝማች
መቆሼሼን ኣይቶ ከሳሼ ቢከሰኝ
እማምላክ ግን ምልጃሽ ኣድስ ኣደርገኝ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 3
ነጩን ኣለበሽኝ ወርቃማውን በፍታ
እንዴት ዘነጋለሁ ያንችንስ ውለታ//፪//
በቀኙ ባትቆሚይ ጸሎቴን ባትሰሚይ
ኣይቀናም ጉዞዬ ጽልመት ነው ተስፋዬ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 4
ኣዝማች
እንደናት ኣባብለሽኣሳድገሽኛል
ኑሮዬ ሲጨልም ብርሀን ሁነሽኛል
የተማመንኩበት ሲሸሸኝ ወዳጄ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 5
ኣንች ግን ተገኜሽ በጓዳ በዴጄ//፪//
ኣፍራች በለሴ ተደሰተች ነፍሴ
ለምን ላቀርቅር ኣሁን ልዘምር
ኣዝማች

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 6
ትላንት ያዩኝ ሁሉ ዛሬ ይገርማሉ
እንዴት በግሩ ቆመ እየተባባሉ
ለሰው የማይቻል ለልጅሽ ተችሏል
እንዳያላፉት የለም ሁሉም ነገር አልፏል//፪//

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 7
ከቤቴ የማጠፊይ ችግሬን ምትቀርፊይ
እንድንችል ማን ኣለ ጭንቀትን የጣለ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 1
Nefsen yasch’eneqat yazen welafnu
Malqes bicha huno zewetr siraye
Anagrshalehu hugne lebchaye/ (2)/
Dingil dershlgn hilmen fatashlgn

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 2
Alkugn qena qena yam qen alefena
Azmach
Meqosheshen ayto kesashe bikesegn
Emamlak gin miljash ads adergegn

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 3
Nech’un alebeshgn werqamawn befta
Endet zenegalehu yanchns wileta/ (2)/
Beqegnu batqomiy ts’eloten batsemiy
Ayqenam guzoye ts’lmet new tesfaye

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 4
Azmach
Endenat abableshasadgeshgnal
Nuroye sich’elm birhen huneshgnal
Yetemamenkubet sisheshegn wedaje

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 5
Anch gin tegegnesh begwada bedeje/ (2)/
Afrach belese tedesetech nefse
Lemn laqerqr ahun lizemr
Azmach

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 6
Tilant yayugn hulu zare yigermalu
Endet begru qome eyetebabalu
Lesew yemaychal leljsh techlwal
Endayalafut yelem hulum neger alfwal/ (2)/

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 7
Kebete yemat’efiy chgren mitqerfiy
Endnchl man ale ch’nqetn yet’ale

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 1
ነፍሴን ያስጨነቃት ያዘን ወላፍኑ
ማልቀስ ብቻ ሁኖ ዘወትር ስራዬ
ኣናግርሻለሁ ሁኜ ለብቻዬ//፪//
ድንግል ደርሽልኝ ህልሜን ፋታሽልኝ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 2
ኣልኩኝ ቀና ቀና ያም ቀን ኣለፈና
ኣዝማች
መቆሼሼን ኣይቶ ከሳሼ ቢከሰኝ
እማምላክ ግን ምልጃሽ ኣድስ ኣደርገኝ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 3
ነጩን ኣለበሽኝ ወርቃማውን በፍታ
እንዴት ዘነጋለሁ ያንችንስ ውለታ//፪//
በቀኙ ባትቆሚይ ጸሎቴን ባትሰሚይ
ኣይቀናም ጉዞዬ ጽልመት ነው ተስፋዬ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 4
ኣዝማች
እንደናት ኣባብለሽኣሳድገሽኛል
ኑሮዬ ሲጨልም ብርሀን ሁነሽኛል
የተማመንኩበት ሲሸሸኝ ወዳጄ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 5
ኣንች ግን ተገኜሽ በጓዳ በዴጄ//፪//
ኣፍራች በለሴ ተደሰተች ነፍሴ
ለምን ላቀርቅር ኣሁን ልዘምር
ኣዝማች

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 6
ትላንት ያዩኝ ሁሉ ዛሬ ይገርማሉ
እንዴት በግሩ ቆመ እየተባባሉ
ለሰው የማይቻል ለልጅሽ ተችሏል
እንዳያላፉት የለም ሁሉም ነገር አልፏል//፪//

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 7
ከቤቴ የማጠፊይ ችግሬን ምትቀርፊይ
እንድንችል ማን ኣለ ጭንቀትን የጣለ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ',
        lyrics_transliteration = 'CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 1
Nefsen yasch’eneqat yazen welafnu
Malqes bicha huno zewetr siraye
Anagrshalehu hugne lebchaye/ (2)/
Dingil dershlgn hilmen fatashlgn

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 2
Alkugn qena qena yam qen alefena
Azmach
Meqosheshen ayto kesashe bikesegn
Emamlak gin miljash ads adergegn

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 3
Nech’un alebeshgn werqamawn befta
Endet zenegalehu yanchns wileta/ (2)/
Beqegnu batqomiy ts’eloten batsemiy
Ayqenam guzoye ts’lmet new tesfaye

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 4
Azmach
Endenat abableshasadgeshgnal
Nuroye sich’elm birhen huneshgnal
Yetemamenkubet sisheshegn wedaje

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 5
Anch gin tegegnesh begwada bedeje/ (2)/
Afrach belese tedesetech nefse
Lemn laqerqr ahun lizemr
Azmach

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 6
Tilant yayugn hulu zare yigermalu
Endet begru qome eyetebabalu
Lesew yemaychal leljsh techlwal
Endayalafut yelem hulum neger alfwal/ (2)/

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu

VERSE 7
Kebete yemat’efiy chgren mitqerfiy
Endnchl man ale ch’nqetn yet’ale

CHORUS
Tabswal enbaye sheshtwal mekeraye
Maryam Maryam eyalku ere sintun alefku/ (2)/
Azmach
Enes meslogn neber maygefa qenu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '172a63bd-f570-4fe9-a3a6-21e3aaf3d916'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 1
ነፍሴን ያስጨነቃት ያዘን ወላፍኑ
ማልቀስ ብቻ ሁኖ ዘወትር ስራዬ
ኣናግርሻለሁ ሁኜ ለብቻዬ//፪//
ድንግል ደርሽልኝ ህልሜን ፋታሽልኝ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 2
ኣልኩኝ ቀና ቀና ያም ቀን ኣለፈና
ኣዝማች
መቆሼሼን ኣይቶ ከሳሼ ቢከሰኝ
እማምላክ ግን ምልጃሽ ኣድስ ኣደርገኝ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 3
ነጩን ኣለበሽኝ ወርቃማውን በፍታ
እንዴት ዘነጋለሁ ያንችንስ ውለታ//፪//
በቀኙ ባትቆሚይ ጸሎቴን ባትሰሚይ
ኣይቀናም ጉዞዬ ጽልመት ነው ተስፋዬ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 4
ኣዝማች
እንደናት ኣባብለሽኣሳድገሽኛል
ኑሮዬ ሲጨልም ብርሀን ሁነሽኛል
የተማመንኩበት ሲሸሸኝ ወዳጄ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 5
ኣንች ግን ተገኜሽ በጓዳ በዴጄ//፪//
ኣፍራች በለሴ ተደሰተች ነፍሴ
ለምን ላቀርቅር ኣሁን ልዘምር
ኣዝማች

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 6
ትላንት ያዩኝ ሁሉ ዛሬ ይገርማሉ
እንዴት በግሩ ቆመ እየተባባሉ
ለሰው የማይቻል ለልጅሽ ተችሏል
እንዳያላፉት የለም ሁሉም ነገር አልፏል//፪//

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ

VERSE 7
ከቤቴ የማጠፊይ ችግሬን ምትቀርፊይ
እንድንችል ማን ኣለ ጭንቀትን የጣለ

CHORUS
ታብሷል እንባዬ ሸሽቷል መከራዬ
ማርያም ማርያም እያልኩ እረ ስንቱን ኣለፍኩ//፪//
ኣዝማች
እኔስ መስሎኝ ነበር ማይገፋ ቀኑ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '172a63bd-f570-4fe9-a3a6-21e3aaf3d916'::uuid, 'tabiswal-enibaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amilake-esirael-kiberilign-bemuhaze-sibihat ("Amilake Esirael Kiberilign *** Bemuhaze Sibihat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '17c6e5e9-b4e3-4138-ab2b-367b3896a61b'::uuid
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
    WHERE import_id = '17c6e5e9-b4e3-4138-ab2b-367b3896a61b'::uuid
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
        '17c6e5e9-b4e3-4138-ab2b-367b3896a61b'::uuid, 'amilake-esirael-kiberilign-bemuhaze-sibihat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lemititeragn-leanite ("Lemititeragn Leanite")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5f6374ad-722d-4b77-9921-228333cec573'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 1
ለምትጠራኝ ላንተ ኃጢያቴን በሙሉ በአንተ ላይ ጥያለሁ
ለምትጠራኝ ላንተ በደሌን ክፋቴን እኔ እናዘዛለሁ
ለምትጠራኝ ላንተ የማትዘነጋኝ ነህ በዘመኔ ሁሉ
ለምትጠራኝ ላንተ ማረኝ ይቅር በለኝ ይብቃኝ መበደሉ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 2
ለምትጠራኝ ላንተ ከአፍህ የወጣው ቃል ያረሰርሰኛል
ለምትጠራኝ ላንተ ህግህን አድምጬ ህይወት ሆኖልኛል
ለምትጠራኝ ላንተ እንደ አንበሳ አድብቷል ያ ክፉ ጠላቴ
ለምትጠራኝ ላንተ ከልቤ እንዳይነቅለው ጠብቀኝ አባቴ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 3
ለምትጠራኝ ላንተ ወጀብ ቢያይልብኝ ቢከብደኝ ፈተና
ለምትጠራኝ ላንተ አምላኬ የአንተ ምክር ትጸናለችና
ለምትጠራኝ ላንተ ጌታውን የጠበቀ ይከብራል ብለሃል
ለምትጠራኝ ላንተ ነቅ የሌለው እምነት ከልቤ ተክለሃል

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 4
ለምትጠራኝ ላንተ ድምጽህን ሰምቼ ልቤ እንዳይከብድብኝ
ለምትጠራኝ ላንተ ያስተማርከኝ ሁሉ ፍርድ እንዳይሆንብኝ
ለምትጠራኝ ላንተ በሰጠኸኝ ጸጋ እጠነቀቃለሁ
ለምትጠራኝ ላንተ ከቶ እንዳትወስድብኝ በእንባ ደምደሜያለሁ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 1
Lemtt’eragn lante hat’iyaten bemulu beante lay t’yalehu
Lemtt’eragn lante bedelen kifaten ene enazezalehu
Lemtt’eragn lante yematzenegagn neh bezemene hulu
Lemtt’eragn lante maregn yiqr belegn yibqagn mebedelu

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 2
Lemtt’eragn lante keafh yewet’aw qal yaresersegnal
Lemtt’eragn lante highn admch’e hiywet honolgnal
Lemtt’eragn lante ende anbesa adbtwal ya kifu t’elate
Lemtt’eragn lante kelbe endayneqlew t’ebqegn abate

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 3
Lemtt’eragn lante wejeb biyaylbgn bikebdegn fetena
Lemtt’eragn lante amlake yeante mikr tits’enalechna
Lemtt’eragn lante getawn yet’ebeqe yikebral bilehal
Lemtt’eragn lante neq yelelew emnet kelbe teklehal

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 4
Lemtt’eragn lante dimts’hn semche libe endaykebdbgn
Lemtt’eragn lante yastemarkegn hulu fird endayhonbgn
Lemtt’eragn lante beset’eኸgn ts’ega et’eneqeqalehu
Lemtt’eragn lante keto endatwesdbgn beenba demdemeyalehu

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 1
ለምትጠራኝ ላንተ ኃጢያቴን በሙሉ በአንተ ላይ ጥያለሁ
ለምትጠራኝ ላንተ በደሌን ክፋቴን እኔ እናዘዛለሁ
ለምትጠራኝ ላንተ የማትዘነጋኝ ነህ በዘመኔ ሁሉ
ለምትጠራኝ ላንተ ማረኝ ይቅር በለኝ ይብቃኝ መበደሉ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 2
ለምትጠራኝ ላንተ ከአፍህ የወጣው ቃል ያረሰርሰኛል
ለምትጠራኝ ላንተ ህግህን አድምጬ ህይወት ሆኖልኛል
ለምትጠራኝ ላንተ እንደ አንበሳ አድብቷል ያ ክፉ ጠላቴ
ለምትጠራኝ ላንተ ከልቤ እንዳይነቅለው ጠብቀኝ አባቴ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 3
ለምትጠራኝ ላንተ ወጀብ ቢያይልብኝ ቢከብደኝ ፈተና
ለምትጠራኝ ላንተ አምላኬ የአንተ ምክር ትጸናለችና
ለምትጠራኝ ላንተ ጌታውን የጠበቀ ይከብራል ብለሃል
ለምትጠራኝ ላንተ ነቅ የሌለው እምነት ከልቤ ተክለሃል

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 4
ለምትጠራኝ ላንተ ድምጽህን ሰምቼ ልቤ እንዳይከብድብኝ
ለምትጠራኝ ላንተ ያስተማርከኝ ሁሉ ፍርድ እንዳይሆንብኝ
ለምትጠራኝ ላንተ በሰጠኸኝ ጸጋ እጠነቀቃለሁ
ለምትጠራኝ ላንተ ከቶ እንዳትወስድብኝ በእንባ ደምደሜያለሁ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ',
        lyrics_transliteration = 'CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 1
Lemtt’eragn lante hat’iyaten bemulu beante lay t’yalehu
Lemtt’eragn lante bedelen kifaten ene enazezalehu
Lemtt’eragn lante yematzenegagn neh bezemene hulu
Lemtt’eragn lante maregn yiqr belegn yibqagn mebedelu

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 2
Lemtt’eragn lante keafh yewet’aw qal yaresersegnal
Lemtt’eragn lante highn admch’e hiywet honolgnal
Lemtt’eragn lante ende anbesa adbtwal ya kifu t’elate
Lemtt’eragn lante kelbe endayneqlew t’ebqegn abate

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 3
Lemtt’eragn lante wejeb biyaylbgn bikebdegn fetena
Lemtt’eragn lante amlake yeante mikr tits’enalechna
Lemtt’eragn lante getawn yet’ebeqe yikebral bilehal
Lemtt’eragn lante neq yelelew emnet kelbe teklehal

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 4
Lemtt’eragn lante dimts’hn semche libe endaykebdbgn
Lemtt’eragn lante yastemarkegn hulu fird endayhonbgn
Lemtt’eragn lante beset’eኸgn ts’ega et’eneqeqalehu
Lemtt’eragn lante keto endatwesdbgn beenba demdemeyalehu

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5f6374ad-722d-4b77-9921-228333cec573'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 1
ለምትጠራኝ ላንተ ኃጢያቴን በሙሉ በአንተ ላይ ጥያለሁ
ለምትጠራኝ ላንተ በደሌን ክፋቴን እኔ እናዘዛለሁ
ለምትጠራኝ ላንተ የማትዘነጋኝ ነህ በዘመኔ ሁሉ
ለምትጠራኝ ላንተ ማረኝ ይቅር በለኝ ይብቃኝ መበደሉ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 2
ለምትጠራኝ ላንተ ከአፍህ የወጣው ቃል ያረሰርሰኛል
ለምትጠራኝ ላንተ ህግህን አድምጬ ህይወት ሆኖልኛል
ለምትጠራኝ ላንተ እንደ አንበሳ አድብቷል ያ ክፉ ጠላቴ
ለምትጠራኝ ላንተ ከልቤ እንዳይነቅለው ጠብቀኝ አባቴ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 3
ለምትጠራኝ ላንተ ወጀብ ቢያይልብኝ ቢከብደኝ ፈተና
ለምትጠራኝ ላንተ አምላኬ የአንተ ምክር ትጸናለችና
ለምትጠራኝ ላንተ ጌታውን የጠበቀ ይከብራል ብለሃል
ለምትጠራኝ ላንተ ነቅ የሌለው እምነት ከልቤ ተክለሃል

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 4
ለምትጠራኝ ላንተ ድምጽህን ሰምቼ ልቤ እንዳይከብድብኝ
ለምትጠራኝ ላንተ ያስተማርከኝ ሁሉ ፍርድ እንዳይሆንብኝ
ለምትጠራኝ ላንተ በሰጠኸኝ ጸጋ እጠነቀቃለሁ
ለምትጠራኝ ላንተ ከቶ እንዳትወስድብኝ በእንባ ደምደሜያለሁ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5f6374ad-722d-4b77-9921-228333cec573'::uuid, 'lemititeragn-leanite', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nefise-hoy ("Nefise Hoy")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a286b804-f3a1-49bd-912f-51e8ae63c432'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 1
ጽጥታና ሰላም አድሎሻልና
መሰንቆውን አንሺ ቅኔ ተቀኚለት
ለውጦሻልና በደስታ ዘይት
ነፍሴ ሆይ(3) እግዚአብሔር ባርኪ(3)

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 2
አጥንቶቼም ሁሉ( 3)
የተቀደሰ ስሙ
ሀሴትን አድርጊ ነፍሴ ለእግዚአብሔርም
ይሰጥሻልና በክብር ላይ ክብር

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 3
ደሴቶች ሲያወሩ በቅድስት መንፈስ
እየተወያዩ ስሉስ ቅዱስ
ነፍሴ ሆይ( 3)እግዚአብሔር ባርኪ

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 1
Ts’t’tana selam adloshalna
Mesenqown anshi qine teqegnilet
Lewt’oshalna bedesta zeyt
Nefse hoy (3) Egziabher barki (3)

CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 2
At’ntochem hulu (3)
Yeteqedese simu
Hesetn adrgi nefse leegziabherm
Yiset’shalna bekbr lay kibir

CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 3
Desetoch siyaweru beqdst menfes
Eyeteweyayu silus Kidus
Nefse hoy (3)Egziabher barki

CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 1
ጽጥታና ሰላም አድሎሻልና
መሰንቆውን አንሺ ቅኔ ተቀኚለት
ለውጦሻልና በደስታ ዘይት
ነፍሴ ሆይ(3) እግዚአብሔር ባርኪ(3)

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 2
አጥንቶቼም ሁሉ( 3)
የተቀደሰ ስሙ
ሀሴትን አድርጊ ነፍሴ ለእግዚአብሔርም
ይሰጥሻልና በክብር ላይ ክብር

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 3
ደሴቶች ሲያወሩ በቅድስት መንፈስ
እየተወያዩ ስሉስ ቅዱስ
ነፍሴ ሆይ( 3)እግዚአብሔር ባርኪ

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና',
        lyrics_transliteration = 'CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 1
Ts’t’tana selam adloshalna
Mesenqown anshi qine teqegnilet
Lewt’oshalna bedesta zeyt
Nefse hoy (3) Egziabher barki (3)

CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 2
At’ntochem hulu (3)
Yeteqedese simu
Hesetn adrgi nefse leegziabherm
Yiset’shalna bekbr lay kibir

CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 3
Desetoch siyaweru beqdst menfes
Eyeteweyayu silus Kidus
Nefse hoy (3)Egziabher barki

CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a286b804-f3a1-49bd-912f-51e8ae63c432'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 1
ጽጥታና ሰላም አድሎሻልና
መሰንቆውን አንሺ ቅኔ ተቀኚለት
ለውጦሻልና በደስታ ዘይት
ነፍሴ ሆይ(3) እግዚአብሔር ባርኪ(3)

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 2
አጥንቶቼም ሁሉ( 3)
የተቀደሰ ስሙ
ሀሴትን አድርጊ ነፍሴ ለእግዚአብሔርም
ይሰጥሻልና በክብር ላይ ክብር

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 3
ደሴቶች ሲያወሩ በቅድስት መንፈስ
እየተወያዩ ስሉስ ቅዱስ
ነፍሴ ሆይ( 3)እግዚአብሔር ባርኪ

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a286b804-f3a1-49bd-912f-51e8ae63c432'::uuid, 'nefise-hoy', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enide-yosef ("Enide Yosef")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bb4ee56c-6948-4446-9305-340b283b4867'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን

VERSE 1
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን

CHORUS
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen

VERSE 1
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen

CHORUS
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን

VERSE 1
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን

CHORUS
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን',
        lyrics_transliteration = 'CHORUS
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen

VERSE 1
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen

CHORUS
Ende yosef ende seba segel behon behon
Ende yosef ende seba segel behon behon
Eyerusalem3 behon amlak siweled bayen
Eyerusalem3 behon Geta siweled bayen',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bb4ee56c-6948-4446-9305-340b283b4867'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን

VERSE 1
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን

CHORUS
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እንደ ዮሴፍ እንደ ሰባ ሰገል በሆን በሆን
እየሩሳሌም፫ በሆን አምላክ ሲወለድ ባየን
እየሩሳሌም፫ በሆን ጌታ ሲወለድ ባየን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bb4ee56c-6948-4446-9305-340b283b4867'::uuid, 'enide-yosef', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- theotokos ("Theotokos")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '183f835f-0576-4602-93dd-8ceb1d3d1815'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 1
Isaiah saw this mystery (Isaiah 7:14)
About your virginity
When you read his prophecy
You showed your humility

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 2
You shall rejoice O God bearer! (Luke 1:28)
Since you gave us the redeemer
We lift our eyes to you and pray
For your compassion today

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 3
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 4
You are the true censer of gold (Exodus 30:1-9) (Leviticus 16:12)
Since you carried the burning coal
You are also like Aarons rod (Numbers 17:8)
Without seed you brought us God

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 5
O! Mary joy of angels
The Virgin foretold by the prophets
Rejoice for you have found favor (Luke 1:28)
God’s grace is yours forever

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 6
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 1
Isaiah saw this mystery (Isaiah 7:14)
About your virginity
When you read his prophecy
You showed your humility

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 2
You shall rejoice O God bearer! (Luke 1:28)
Since you gave us the redeemer
We lift our eyes to you and pray
For your compassion today

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 3
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 4
You are the true censer of gold (Exodus 30:1-9) (Leviticus 16:12)
Since you carried the burning coal
You are also like Aarons rod (Numbers 17:8)
Without seed you brought us God

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 5
O! Mary joy of angels
The Virgin foretold by the prophets
Rejoice for you have found favor (Luke 1:28)
God’s grace is yours forever

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 6
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = '183f835f-0576-4602-93dd-8ceb1d3d1815'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 1
Isaiah saw this mystery (Isaiah 7:14)
About your virginity
When you read his prophecy
You showed your humility

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 2
You shall rejoice O God bearer! (Luke 1:28)
Since you gave us the redeemer
We lift our eyes to you and pray
For your compassion today

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 3
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 4
You are the true censer of gold (Exodus 30:1-9) (Leviticus 16:12)
Since you carried the burning coal
You are also like Aarons rod (Numbers 17:8)
Without seed you brought us God

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 5
O! Mary joy of angels
The Virgin foretold by the prophets
Rejoice for you have found favor (Luke 1:28)
God’s grace is yours forever

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

VERSE 6
Theotokos (4)
You’re truly full of wonder
You’re truly our mother

CHORUS
Theotokos (4)
You’re truly full of wonder
You’re truly our mother'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '183f835f-0576-4602-93dd-8ceb1d3d1815'::uuid, 'theotokos', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enes-tesifa-alikoritim ("Enes Tesifa Alikoritim")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '32ec9ab8-a94d-4476-9307-b08b2be95bb7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 1
ወዳጅም ሲከዳኝ አለው አልሽኝ /2/
ሕይወቴን ከጥልቁ ማን መለሰው
ቀና ቀና ያልኩት በምልጃሽ ነው /2/
ጠላቴም ሲፎክር ከቶ አልፈራ

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 2
እናት አለኝ እና የምትራራ /2/
በረከት አገኘሁ ፍፁም ሰላም
ፍቅርሽ ስላገዘኝ ድንግል ማርያም /2/
አትውጣ አክአብ ተው አትድከም

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 3
ድንግልን ይዣለሁ አልረታም /2/
በቃልህ ማህሌት ተስፋ አድርጌ
ክብሬ ተቀየረ ማእረጌ /2/
ሰሎሞን ላይፈታው የእኔን ችግር

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 4
መጣሁኝ ከደጅሽ ለአንቺው ልናገር /2/
ዘወትር የማዜመው ስለ ክብርሽ
መልስ ሁነሽኝ ነው በኪዳንሽ /2/

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 1
Wedajm sikedagn alew alshgn (2)
Hiyweten ket’lqu man melesew
Qena qena yalkut bemljash new (2)
T’elatem sifokr keto alfera

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 2
Enat alegn ena yemtrara (2)
Bereket agegnehu fits’um selam
Fiqrsh silagezegn Dingil Maryam (2)
Atwt’a akab tew atdkem

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 3
Dingln yizhalehu alretam (2)
Beqalh mahlet tesfa adrge
Kibre teqeyere maerege (2)
Selomon layfetaw yeenen chgr

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 4
Met’ahugn kedejsh leanchiw linager (2)
Zewetr yemazemew sile kibrsh
Mels huneshgn new bekidansh (2)

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 1
ወዳጅም ሲከዳኝ አለው አልሽኝ /2/
ሕይወቴን ከጥልቁ ማን መለሰው
ቀና ቀና ያልኩት በምልጃሽ ነው /2/
ጠላቴም ሲፎክር ከቶ አልፈራ

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 2
እናት አለኝ እና የምትራራ /2/
በረከት አገኘሁ ፍፁም ሰላም
ፍቅርሽ ስላገዘኝ ድንግል ማርያም /2/
አትውጣ አክአብ ተው አትድከም

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 3
ድንግልን ይዣለሁ አልረታም /2/
በቃልህ ማህሌት ተስፋ አድርጌ
ክብሬ ተቀየረ ማእረጌ /2/
ሰሎሞን ላይፈታው የእኔን ችግር

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 4
መጣሁኝ ከደጅሽ ለአንቺው ልናገር /2/
ዘወትር የማዜመው ስለ ክብርሽ
መልስ ሁነሽኝ ነው በኪዳንሽ /2/

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ',
        lyrics_transliteration = 'CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 1
Wedajm sikedagn alew alshgn (2)
Hiyweten ket’lqu man melesew
Qena qena yalkut bemljash new (2)
T’elatem sifokr keto alfera

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 2
Enat alegn ena yemtrara (2)
Bereket agegnehu fits’um selam
Fiqrsh silagezegn Dingil Maryam (2)
Atwt’a akab tew atdkem

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 3
Dingln yizhalehu alretam (2)
Beqalh mahlet tesfa adrge
Kibre teqeyere maerege (2)
Selomon layfetaw yeenen chgr

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn

VERSE 4
Met’ahugn kedejsh leanchiw linager (2)
Zewetr yemazemew sile kibrsh
Mels huneshgn new bekidansh (2)

CHORUS
Enes tesfa alqort’m hule et’erashalehu (2)
Amalaje anchin yizhalehu
Azagntu anchin yizhalehu
Zuryaye sich’elm birhan honshgn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '32ec9ab8-a94d-4476-9307-b08b2be95bb7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 1
ወዳጅም ሲከዳኝ አለው አልሽኝ /2/
ሕይወቴን ከጥልቁ ማን መለሰው
ቀና ቀና ያልኩት በምልጃሽ ነው /2/
ጠላቴም ሲፎክር ከቶ አልፈራ

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 2
እናት አለኝ እና የምትራራ /2/
በረከት አገኘሁ ፍፁም ሰላም
ፍቅርሽ ስላገዘኝ ድንግል ማርያም /2/
አትውጣ አክአብ ተው አትድከም

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 3
ድንግልን ይዣለሁ አልረታም /2/
በቃልህ ማህሌት ተስፋ አድርጌ
ክብሬ ተቀየረ ማእረጌ /2/
ሰሎሞን ላይፈታው የእኔን ችግር

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ

VERSE 4
መጣሁኝ ከደጅሽ ለአንቺው ልናገር /2/
ዘወትር የማዜመው ስለ ክብርሽ
መልስ ሁነሽኝ ነው በኪዳንሽ /2/

CHORUS
እኔስ ተስፋ አልቆርጥም ሁሌ እጠራሻለሁ /2/
አማላጄ አንቺን ይዣለሁ
አዛኝቱ አንቺን ይዣለሁ
ዙርያዬ ሲጨልም ብርሃን ሆንሽኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '32ec9ab8-a94d-4476-9307-b08b2be95bb7'::uuid, 'enes-tesifa-alikoritim', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- our-lord-and-king-of-peace ("Our Lord and King of Peace")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a2d451bf-a29f-4504-ae57-b4456b8dc170'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 1
Amlak tewelede tetemeke legna
Seeing the sins of the world oppression of mankind
He came down leaving 99 legions behind
To fulfill righteousness and free us from our bind

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 2
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The mighty King whom the highest heavens could not bear
For when He was born and baptized to make us pure

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 3
The mountains skipped like rams trembling out of fear
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The waters became troubled the Jordan turned to flee

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 4
Before the Lord’s face it could not stand to be seen
Just as David foretold within his prophecy
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 5
As he founded righteousness in the Jordan River
Came from the clouds above the Heavenly Father
Testifying to His Son’s true divine nature
Our Lord and King of Peace and our judge full of grace

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 6
Jesus Christ is truly born and baptized for our sake
Just as we find it written in the Holy Gospel
The Holy Spirit came upon Him as a dove
Pointing His wings to the Son and Father above

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 7
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Witnessing the waters flee and the mountains leaping
The heavens were opened and the clouds were speaking

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 8
On this day the world has seen this great mystery
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Yeselamu meri yeselamu dagna

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 9
Amlak tewelede tetemeke legna

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna
Amlak tewelede tetemeke legna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 1
Amlak tewelede tetemeke legna
Seeing the sins of the world oppression of mankind
He came down leaving 99 legions behind
To fulfill righteousness and free us from our bind

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 2
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The mighty King whom the highest heavens could not bear
For when He was born and baptized to make us pure

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 3
The mountains skipped like rams trembling out of fear
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The waters became troubled the Jordan turned to flee

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 4
Before the Lord’s face it could not stand to be seen
Just as David foretold within his prophecy
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 5
As he founded righteousness in the Jordan River
Came from the clouds above the Heavenly Father
Testifying to His Son’s true divine nature
Our Lord and King of Peace and our judge full of grace

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 6
Jesus Christ is truly born and baptized for our sake
Just as we find it written in the Holy Gospel
The Holy Spirit came upon Him as a dove
Pointing His wings to the Son and Father above

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 7
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Witnessing the waters flee and the mountains leaping
The heavens were opened and the clouds were speaking

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 8
On this day the world has seen this great mystery
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Yeselamu meri yeselamu dagna

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 9
Amlak tewelede tetemeke legna

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna',
        lyrics_transliteration = 'Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna
Amlak tewelede tetemeke legna',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a2d451bf-a29f-4504-ae57-b4456b8dc170'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 1
Amlak tewelede tetemeke legna
Seeing the sins of the world oppression of mankind
He came down leaving 99 legions behind
To fulfill righteousness and free us from our bind

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 2
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The mighty King whom the highest heavens could not bear
For when He was born and baptized to make us pure

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 3
The mountains skipped like rams trembling out of fear
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The waters became troubled the Jordan turned to flee

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 4
Before the Lord’s face it could not stand to be seen
Just as David foretold within his prophecy
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 5
As he founded righteousness in the Jordan River
Came from the clouds above the Heavenly Father
Testifying to His Son’s true divine nature
Our Lord and King of Peace and our judge full of grace

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 6
Jesus Christ is truly born and baptized for our sake
Just as we find it written in the Holy Gospel
The Holy Spirit came upon Him as a dove
Pointing His wings to the Son and Father above

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 7
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Witnessing the waters flee and the mountains leaping
The heavens were opened and the clouds were speaking

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 8
On this day the world has seen this great mystery
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Yeselamu meri yeselamu dagna

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 9
Amlak tewelede tetemeke legna

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna
Amlak tewelede tetemeke legna';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a2d451bf-a29f-4504-ae57-b4456b8dc170'::uuid, 'our-lord-and-king-of-peace', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bewisit-sewinete ("Bewisit Sewinete")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '18dda021-b378-4ffe-bbda-c277c9fc5996'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 1
መልካሙን ለማድረግ አስብና እነሳለው
ክፉም በሚያሰራ በሌላ ህግ እያዛለው
በውስጥ ሰውነቴ ለትእዛዝህ ተገዝቼ
በስጋ ደክማለው ቃልህንም እረስቼ

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 2
ያነበብኩትና የሰማሁት ቅዱስ ቃልህ
የቀመስኩትና ያጣጣምኩት ይህ ፍቅርህ
በዚ መኖር ለኔ መልካም ነውም ያሰኘኛል
ብዙም ሳልቆይ ፈጥኖ ስምህንም ያስክደኛል

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 3
ፍቅርህን አስቤ ሁሉን ንቄ ሁሉን ትቼ
በውሀ ላይ ልሂድ ለመራመድ ተነስቼ
አንተ ጋራም ሳልደርስ በፍጥነትም እሰጥማለው
መጥፋቴ ነው ጌታ አንተ አድነኝ እልሀለው

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 4
አምላክ ሆይ እባክህ ፍፃሜዬን አሳምረው
የሚያድነኝ ቸርነትህና ምህረትህ ነው
ስለ እመ አምላክ ብለህ ድል መንሳትን አድለኝ
ለምኞቴ እና ለፈቃዴም አትስጠኝ

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 5
አዝ …

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 1
Melkamun lemadreg asbna enesalew
Kifum bemiyasera belela hig eyazalew
Bewst’ sewnete letezazh tegezche
Besga dekmalew qalhnm eresche

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 2
Yanebebkutna yesemahut Kidus qalh
Yeqemeskutna yat’at’amkut yih fiqrh
Bezi menor lene melkam newm yasegnegnal
Bizum salqoy fet’no simhnm yaskdegnal

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 3
Fiqrhn asbe hulun niqe hulun tiche
Bewhe lay lihid lemeramed tenesche
Ante garam salders beft’netm eset’malew
Met’fate new Geta ante adnegn elhelew

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 4
Amlak hoy ebakh fits’ameyen asamrew
Yemiyadnegn chernethna mihreth new
Sile eme amlak bileh dil mensatn adlegn
Lemgnote ena lefeqadem atst’egn

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 5
CHORUS

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 1
መልካሙን ለማድረግ አስብና እነሳለው
ክፉም በሚያሰራ በሌላ ህግ እያዛለው
በውስጥ ሰውነቴ ለትእዛዝህ ተገዝቼ
በስጋ ደክማለው ቃልህንም እረስቼ

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 2
ያነበብኩትና የሰማሁት ቅዱስ ቃልህ
የቀመስኩትና ያጣጣምኩት ይህ ፍቅርህ
በዚ መኖር ለኔ መልካም ነውም ያሰኘኛል
ብዙም ሳልቆይ ፈጥኖ ስምህንም ያስክደኛል

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 3
ፍቅርህን አስቤ ሁሉን ንቄ ሁሉን ትቼ
በውሀ ላይ ልሂድ ለመራመድ ተነስቼ
አንተ ጋራም ሳልደርስ በፍጥነትም እሰጥማለው
መጥፋቴ ነው ጌታ አንተ አድነኝ እልሀለው

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 4
አምላክ ሆይ እባክህ ፍፃሜዬን አሳምረው
የሚያድነኝ ቸርነትህና ምህረትህ ነው
ስለ እመ አምላክ ብለህ ድል መንሳትን አድለኝ
ለምኞቴ እና ለፈቃዴም አትስጠኝ

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 5
አዝ …

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ',
        lyrics_transliteration = 'CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 1
Melkamun lemadreg asbna enesalew
Kifum bemiyasera belela hig eyazalew
Bewst’ sewnete letezazh tegezche
Besga dekmalew qalhnm eresche

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 2
Yanebebkutna yesemahut Kidus qalh
Yeqemeskutna yat’at’amkut yih fiqrh
Bezi menor lene melkam newm yasegnegnal
Bizum salqoy fet’no simhnm yaskdegnal

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 3
Fiqrhn asbe hulun niqe hulun tiche
Bewhe lay lihid lemeramed tenesche
Ante garam salders beft’netm eset’malew
Met’fate new Geta ante adnegn elhelew

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 4
Amlak hoy ebakh fits’ameyen asamrew
Yemiyadnegn chernethna mihreth new
Sile eme amlak bileh dil mensatn adlegn
Lemgnote ena lefeqadem atst’egn

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 5
CHORUS

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete',
        updated_at = clock_timestamp()::text
    WHERE import_id = '18dda021-b378-4ffe-bbda-c277c9fc5996'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 1
መልካሙን ለማድረግ አስብና እነሳለው
ክፉም በሚያሰራ በሌላ ህግ እያዛለው
በውስጥ ሰውነቴ ለትእዛዝህ ተገዝቼ
በስጋ ደክማለው ቃልህንም እረስቼ

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 2
ያነበብኩትና የሰማሁት ቅዱስ ቃልህ
የቀመስኩትና ያጣጣምኩት ይህ ፍቅርህ
በዚ መኖር ለኔ መልካም ነውም ያሰኘኛል
ብዙም ሳልቆይ ፈጥኖ ስምህንም ያስክደኛል

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 3
ፍቅርህን አስቤ ሁሉን ንቄ ሁሉን ትቼ
በውሀ ላይ ልሂድ ለመራመድ ተነስቼ
አንተ ጋራም ሳልደርስ በፍጥነትም እሰጥማለው
መጥፋቴ ነው ጌታ አንተ አድነኝ እልሀለው

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 4
አምላክ ሆይ እባክህ ፍፃሜዬን አሳምረው
የሚያድነኝ ቸርነትህና ምህረትህ ነው
ስለ እመ አምላክ ብለህ ድል መንሳትን አድለኝ
ለምኞቴ እና ለፈቃዴም አትስጠኝ

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 5
አዝ …

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '18dda021-b378-4ffe-bbda-c277c9fc5996'::uuid, 'bewisit-sewinete', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emebete-zarem-barikign ("Emebete Zarem Barikign")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '721f3bb4-456f-4752-a331-9224325ac510'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 1
ጸሎቴን እያሳረግሽ ልመናዬን ስትሰሚ
ከጎኔ ሳትለይ ተቆጠሩ ዘመናት
ይሀዉ ለዝህ ደረስኩኝ ከእናትም በላይ ሆነሽ እናት
እዝ።።።።።።።

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 2
በጎጆዬ ስላለሽ መጉደልን አላዉቅም
የአንደበቴ ቃንቃ ነዉ እናቴ ያንቺ ስም
ሰንደቄና አርማየ የኔ መታወቂያ ነሽ
ከእግረ መስቀሉ ሥር ቀራንዮ ላይ ያገኘሁሽ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 3
እዝ።።።።።።።
ፈዉስን የቀዳሁብሽ የበረከት አዘቅት
ለዝህ ቀን የደረስኩት ሆነሽኝ ነዉ ብርታት
ስንቱን አለፍኩት ባንቺ ወጣሁ ስንቱን ተራራ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 4
መከታ ጋሻየ ነሽ የከሳሹን ቀስት እንዳልፈራ
እዝ።።።።።።።
ጌታየን ከእቅፍሽ ፍቅርን ከመቅደስሽን
ትህትናን ተምሬያለዉ ፍደሌ ስለሆንሽ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 5
ከቶ ነግቶ አይመሽም ለዉዳሴሽ ሳልቆም
ብዙ ነዉ ምስጥራችን የኔ እና ያንች ማርያም
እዝ።።።።።

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 1
Ts’eloten eyasaregsh limenayen sitsemi
Kegone satley teqot’eru zemenat
Yihewu lezh dereskugn keenatm belay honesh enat
Ez.......

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 2
Begojoye silalesh megudeln alawuqm
Yeandebete qanqa newu enate yanchi sim
Sendeqena armaye yene metaweqiya nesh
Keegre mesqelu sir qeranyo lay yagegnehush

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 3
Ez.......
Fewusn yeqedahubsh yebereket azeqt
Lezh qen yedereskut honeshgn newu birtat
Sintun alefkut banchi wet’ahu sintun terara

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 4
Meketa gashaye nesh yekesashun qest endalfera
Ez.......
Getayen keeqfsh fiqrn kemeqdesshn
Tihtnan temreyalewu fidele silehonsh

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 5
Keto negto aymeshm lewudasesh salqom
Bizu newu mist’rachn yene ena yanch Maryam
Ez.....

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 1
ጸሎቴን እያሳረግሽ ልመናዬን ስትሰሚ
ከጎኔ ሳትለይ ተቆጠሩ ዘመናት
ይሀዉ ለዝህ ደረስኩኝ ከእናትም በላይ ሆነሽ እናት
እዝ።።።።።።።

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 2
በጎጆዬ ስላለሽ መጉደልን አላዉቅም
የአንደበቴ ቃንቃ ነዉ እናቴ ያንቺ ስም
ሰንደቄና አርማየ የኔ መታወቂያ ነሽ
ከእግረ መስቀሉ ሥር ቀራንዮ ላይ ያገኘሁሽ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 3
እዝ።።።።።።።
ፈዉስን የቀዳሁብሽ የበረከት አዘቅት
ለዝህ ቀን የደረስኩት ሆነሽኝ ነዉ ብርታት
ስንቱን አለፍኩት ባንቺ ወጣሁ ስንቱን ተራራ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 4
መከታ ጋሻየ ነሽ የከሳሹን ቀስት እንዳልፈራ
እዝ።።።።።።።
ጌታየን ከእቅፍሽ ፍቅርን ከመቅደስሽን
ትህትናን ተምሬያለዉ ፍደሌ ስለሆንሽ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 5
ከቶ ነግቶ አይመሽም ለዉዳሴሽ ሳልቆም
ብዙ ነዉ ምስጥራችን የኔ እና ያንች ማርያም
እዝ።።።።።

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ',
        lyrics_transliteration = 'CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 1
Ts’eloten eyasaregsh limenayen sitsemi
Kegone satley teqot’eru zemenat
Yihewu lezh dereskugn keenatm belay honesh enat
Ez.......

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 2
Begojoye silalesh megudeln alawuqm
Yeandebete qanqa newu enate yanchi sim
Sendeqena armaye yene metaweqiya nesh
Keegre mesqelu sir qeranyo lay yagegnehush

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 3
Ez.......
Fewusn yeqedahubsh yebereket azeqt
Lezh qen yedereskut honeshgn newu birtat
Sintun alefkut banchi wet’ahu sintun terara

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 4
Meketa gashaye nesh yekesashun qest endalfera
Ez.......
Getayen keeqfsh fiqrn kemeqdesshn
Tihtnan temreyalewu fidele silehonsh

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi

VERSE 5
Keto negto aymeshm lewudasesh salqom
Bizu newu mist’rachn yene ena yanch Maryam
Ez.....

CHORUS
And armja salramed anchn yⶴ tenesahu (2)
Emebete zarem barkign wudaseshn abezalewu
Yeamlake enat zarem barkign wudaseshn abezalewu
Miljash eyedegefegn begeta fit sitqomi',
        updated_at = clock_timestamp()::text
    WHERE import_id = '721f3bb4-456f-4752-a331-9224325ac510'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 1
ጸሎቴን እያሳረግሽ ልመናዬን ስትሰሚ
ከጎኔ ሳትለይ ተቆጠሩ ዘመናት
ይሀዉ ለዝህ ደረስኩኝ ከእናትም በላይ ሆነሽ እናት
እዝ።።።።።።።

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 2
በጎጆዬ ስላለሽ መጉደልን አላዉቅም
የአንደበቴ ቃንቃ ነዉ እናቴ ያንቺ ስም
ሰንደቄና አርማየ የኔ መታወቂያ ነሽ
ከእግረ መስቀሉ ሥር ቀራንዮ ላይ ያገኘሁሽ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 3
እዝ።።።።።።።
ፈዉስን የቀዳሁብሽ የበረከት አዘቅት
ለዝህ ቀን የደረስኩት ሆነሽኝ ነዉ ብርታት
ስንቱን አለፍኩት ባንቺ ወጣሁ ስንቱን ተራራ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 4
መከታ ጋሻየ ነሽ የከሳሹን ቀስት እንዳልፈራ
እዝ።።።።።።።
ጌታየን ከእቅፍሽ ፍቅርን ከመቅደስሽን
ትህትናን ተምሬያለዉ ፍደሌ ስለሆንሽ

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ

VERSE 5
ከቶ ነግቶ አይመሽም ለዉዳሴሽ ሳልቆም
ብዙ ነዉ ምስጥራችን የኔ እና ያንች ማርያም
እዝ።።።።።

CHORUS
አንድ አርምጃ ሳልራመድ አንችን ይⶴ ተነሳሁ(2)
እመቤቴ ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
የአምላኬ እናት ዛሬም ባርኪኝ ዉዳሴሽን አበዛለዉ
ምልጃሽ እየደገፈኝ በጌታ ፍት ስትቆሚ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '721f3bb4-456f-4752-a331-9224325ac510'::uuid, 'emebete-zarem-barikign', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beritemiyos-negn ("Beritemiyos Negn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ec0fa4e1-100f-48a6-83ef-8181628e8a6c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 1
Keruq yesemahut yegetaye dimts’un
Kebzu hukata gurmrmta mehal
YeKristos dimts’u beglts’ yisemagnal.
Yelbonaye ayn fets’mo tawrwal

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 2
Aynen fewslgn bert’emiyos yilal
Abzche ech’ohelew Geta maregn biye
Bewst’e eyetayegn simregn getaye.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 3
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Anten aysemahm yilugnal bizuwoch

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 4
Beht’yat senselet tasrehal egr kewerch
Silezih atlfa sioln t’ebqat
Endezih bilugnm ech’ohelew saltakt.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 5
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Yekebebewn sew gelel belu eyale

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 6
Bedelen bedemu waga eyekefele
Sileene yemotew Iyesus yimet’al
Yelbonayen ayn gelt’o yasayegnal.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 7
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Abzche ech’ohelew Geta maregn biye

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 8
Beglts’ eyetayegn simregn Getaye
Bewst’e bedels hiywete zilalech
Beamlake chernet hiywet kalagegnech.

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን',
        lyrics_transliteration = 'CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 1
Keruq yesemahut yegetaye dimts’un
Kebzu hukata gurmrmta mehal
YeKristos dimts’u beglts’ yisemagnal.
Yelbonaye ayn fets’mo tawrwal

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 2
Aynen fewslgn bert’emiyos yilal
Abzche ech’ohelew Geta maregn biye
Bewst’e eyetayegn simregn getaye.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 3
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Anten aysemahm yilugnal bizuwoch

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 4
Beht’yat senselet tasrehal egr kewerch
Silezih atlfa sioln t’ebqat
Endezih bilugnm ech’ohelew saltakt.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 5
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Yekebebewn sew gelel belu eyale

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 6
Bedelen bedemu waga eyekefele
Sileene yemotew Iyesus yimet’al
Yelbonayen ayn gelt’o yasayegnal.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 7
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Abzche ech’ohelew Geta maregn biye

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 8
Beglts’ eyetayegn simregn Getaye
Bewst’e bedels hiywete zilalech
Beamlake chernet hiywet kalagegnech.

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ec0fa4e1-100f-48a6-83ef-8181628e8a6c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ec0fa4e1-100f-48a6-83ef-8181628e8a6c'::uuid, 'beritemiyos-negn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zelesegna-mezmur ("Zelesegna Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e5c7810a-6814-4aca-be3b-0513f81b6d5d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 1
እድልን ስጠኝ እንደገና
በቸርነትህ እየኝና
እድልን ስጠኝ እንደገና
… በምህረትህ ብዛት ማረኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 2
ይህችን ዓመት ደግሞ ተወኝ
ፍሬ እስካፈራ ታገሰኝ
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 3
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ
… በምህረትህ ብዛት ማረኝ
ብበድልህም እለት እለት

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 4
ባስመርርህም በሃጥያት
አትቆርጥብኝም በኔ ተስፋ
ምንም ብቆሽሽ ምን ብከፋ
አትቆርጥብኝም በኔ ተስፋ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 5
ምንም ብቆሽሽ ምን ብከፋ
… በምህረትህ ብዛት ማረኝ
ጌታ ለእኔ አለህ
ፍቅር ነውና አላማህ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 6
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 7
… በምህረትህ ብዛት ማረኝ
ይገለጽ በኔ ሃይልህ
ጌታየ አብዝቼ ልውደድህ
አንጻኝ እጠበኝ ቀድሰኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 8
በደሌን ከድነህ አቁመኝ
አንጻኝ እጠበኝ ቀድሰኝ
በደሌን ከድነህ አቁመኝ
… በምህረትህ ብዛት ማረኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 1
Edln sit’egn endegena
Becherneth eyegnna
Edln sit’egn endegena
… bemhreth bizat maregn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 2
Yihchn amet degmo tewegn
Fire eskafera tagesegn
Melakum enen yit’ebqegn
Yehywet qalhn yimegbegn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 3
Melakum enen yit’ebqegn
Yehywet qalhn yimegbegn
… bemhreth bizat maregn
Bibedlhm elet elet

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 4
Basmerrhm behat’yat
Atqort’bgnm bene tesfa
Minm biqoshsh min bikefa
Atqort’bgnm bene tesfa

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 5
Minm biqoshsh min bikefa
… bemhreth bizat maregn
Geta leene aleh
Fiqr newna alamah

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 6
Atwedmna yenen malqes
Hulem tishaleh endmeles
Atwedmna yenen malqes
Hulem tishaleh endmeles

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 7
… bemhreth bizat maregn
Yigelets’ bene haylh
Getaye abzche liwdedh
Ants’agn et’ebegn qedsegn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 8
Bedelen kedneh aqumegn
Ants’agn et’ebegn qedsegn
Bedelen kedneh aqumegn
… bemhreth bizat maregn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 1
እድልን ስጠኝ እንደገና
በቸርነትህ እየኝና
እድልን ስጠኝ እንደገና
… በምህረትህ ብዛት ማረኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 2
ይህችን ዓመት ደግሞ ተወኝ
ፍሬ እስካፈራ ታገሰኝ
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 3
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ
… በምህረትህ ብዛት ማረኝ
ብበድልህም እለት እለት

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 4
ባስመርርህም በሃጥያት
አትቆርጥብኝም በኔ ተስፋ
ምንም ብቆሽሽ ምን ብከፋ
አትቆርጥብኝም በኔ ተስፋ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 5
ምንም ብቆሽሽ ምን ብከፋ
… በምህረትህ ብዛት ማረኝ
ጌታ ለእኔ አለህ
ፍቅር ነውና አላማህ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 6
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 7
… በምህረትህ ብዛት ማረኝ
ይገለጽ በኔ ሃይልህ
ጌታየ አብዝቼ ልውደድህ
አንጻኝ እጠበኝ ቀድሰኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 8
በደሌን ከድነህ አቁመኝ
አንጻኝ እጠበኝ ቀድሰኝ
በደሌን ከድነህ አቁመኝ
… በምህረትህ ብዛት ማረኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና',
        lyrics_transliteration = 'CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 1
Edln sit’egn endegena
Becherneth eyegnna
Edln sit’egn endegena
… bemhreth bizat maregn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 2
Yihchn amet degmo tewegn
Fire eskafera tagesegn
Melakum enen yit’ebqegn
Yehywet qalhn yimegbegn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 3
Melakum enen yit’ebqegn
Yehywet qalhn yimegbegn
… bemhreth bizat maregn
Bibedlhm elet elet

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 4
Basmerrhm behat’yat
Atqort’bgnm bene tesfa
Minm biqoshsh min bikefa
Atqort’bgnm bene tesfa

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 5
Minm biqoshsh min bikefa
… bemhreth bizat maregn
Geta leene aleh
Fiqr newna alamah

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 6
Atwedmna yenen malqes
Hulem tishaleh endmeles
Atwedmna yenen malqes
Hulem tishaleh endmeles

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 7
… bemhreth bizat maregn
Yigelets’ bene haylh
Getaye abzche liwdedh
Ants’agn et’ebegn qedsegn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 8
Bedelen kedneh aqumegn
Ants’agn et’ebegn qedsegn
Bedelen kedneh aqumegn
… bemhreth bizat maregn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e5c7810a-6814-4aca-be3b-0513f81b6d5d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 1
እድልን ስጠኝ እንደገና
በቸርነትህ እየኝና
እድልን ስጠኝ እንደገና
… በምህረትህ ብዛት ማረኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 2
ይህችን ዓመት ደግሞ ተወኝ
ፍሬ እስካፈራ ታገሰኝ
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 3
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ
… በምህረትህ ብዛት ማረኝ
ብበድልህም እለት እለት

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 4
ባስመርርህም በሃጥያት
አትቆርጥብኝም በኔ ተስፋ
ምንም ብቆሽሽ ምን ብከፋ
አትቆርጥብኝም በኔ ተስፋ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 5
ምንም ብቆሽሽ ምን ብከፋ
… በምህረትህ ብዛት ማረኝ
ጌታ ለእኔ አለህ
ፍቅር ነውና አላማህ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 6
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 7
… በምህረትህ ብዛት ማረኝ
ይገለጽ በኔ ሃይልህ
ጌታየ አብዝቼ ልውደድህ
አንጻኝ እጠበኝ ቀድሰኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 8
በደሌን ከድነህ አቁመኝ
አንጻኝ እጠበኝ ቀድሰኝ
በደሌን ከድነህ አቁመኝ
… በምህረትህ ብዛት ማረኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e5c7810a-6814-4aca-be3b-0513f81b6d5d'::uuid, 'zelesegna-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- goyitay-bejaha ("Goyitay_bejaha")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1ba56bc4-27cc-4c2f-a99d-dfea199daad4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 1
መቅደስ ልበይ ፈሪሳ
ብባቢሎናውያን ሓጥያት ፍጹም ረኺሳ
ወኻሩ ፍትወት ዉሻጤኣ ይሕንብጣሉ
ሰይጣን ብልሳጥር ንኣቅሓኣ ይግልገለሉ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 2
ከምቲ ንኽዳንካ ንልበይ ተማቐልዎ
ገለ ክፍሉ በቲ ገለ ክፍሉ ኣብቲ
ንገለ ኸኣ በቲ ደርበይዎ
ብሰንኪ ምዕናወይ እሾኽ ተኾርባ በቍሉኒ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 3
ግርማ ሻኻ ነብሰይ ሰቲ ንጽህናይ ነቂጹኒ
ጸላእትኻ ጸላእቲ ስምካ ኣንጻረይ ይለዓሉ
ተኣኪቦም ከምዚ ይብሉ
ሓይሊ እቲ ልዑል ስለ ዝደኸመ፡ እዛ ከተማ ወዲቓያ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 4
መን ከይረድኣ ንዑ ንተኣከብ መመሊስና ንውቅዓያ
ታሪኻ ከይዝከር ዝረኣያ ከይድንግጸላ
እምኒ ኣብ ልዕሊ እምኒ ከቶ ከይንገድፈላ
ጎይታይ በጃኻ ንጸሎተይ ተመልከቶ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 5
ምስባርያኻ ኣብ ፍርዲ ኣይትእቶ
መቅደስ ልበይ ብቃልካ ሓድሶ
እሾኽ ሓልዮት ዓለም ካብ ዉሻጠ ልበይ በንቁሶ
መቅደስ ልበይ ብቃልካ ኣሐድስ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 6
እሾኽ ሓልዮት ዓለም ካብ ዉሽጢ ልበይ በንቁስ
ንንብረት ልበይ ባዕልኻ ማርኸለይ
ንኹሉ ስዒርካስ ልበይ ኣክበለይ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 1
Meqdes libey ferisa
Bibabilonawyan hat’yat fits’um reኺsa
Weኻru fitwet wushat’ea yihnbt’alu
Seyt’an bilsat’r niaqhaa yiglgelelu

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 2
Kemti niኽdanka nilbey temaቐlwo
Gele kiflu beti gele kiflu abti
Nigele ኸa beti derbeywo
Bisenki mienawey eshoኽ teኾrba beqwluni

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 3
Girma shaኻ nebsey seti nits’hnay neqits’uni
Ts’elaetኻ ts’elaeti simka ants’arey yilealu
Teakibom kemzi yiblu
Hayli eti liul sile zideኸme eza ketema wediቓya

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 4
Men keyreda niu niteakeb memelisna niwqaya
Tariኻ keyzker zireaya keydngts’ela
Emni ab lieli emni keto keyngedfela
Goytay bejaኻ nits’elotey temelketo

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 5
Misbaryaኻ ab firdi ayteto
Meqdes libey biqalka hadso
Eshoኽ halyot alem kab wushat’e libey benquso
Meqdes libey biqalka aheds

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 6
Eshoኽ halyot alem kab wusht’i libey benqus
Ninbret libey baelኻ marኸley
Niኹlu siirkas libey akbeley

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 1
መቅደስ ልበይ ፈሪሳ
ብባቢሎናውያን ሓጥያት ፍጹም ረኺሳ
ወኻሩ ፍትወት ዉሻጤኣ ይሕንብጣሉ
ሰይጣን ብልሳጥር ንኣቅሓኣ ይግልገለሉ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 2
ከምቲ ንኽዳንካ ንልበይ ተማቐልዎ
ገለ ክፍሉ በቲ ገለ ክፍሉ ኣብቲ
ንገለ ኸኣ በቲ ደርበይዎ
ብሰንኪ ምዕናወይ እሾኽ ተኾርባ በቍሉኒ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 3
ግርማ ሻኻ ነብሰይ ሰቲ ንጽህናይ ነቂጹኒ
ጸላእትኻ ጸላእቲ ስምካ ኣንጻረይ ይለዓሉ
ተኣኪቦም ከምዚ ይብሉ
ሓይሊ እቲ ልዑል ስለ ዝደኸመ፡ እዛ ከተማ ወዲቓያ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 4
መን ከይረድኣ ንዑ ንተኣከብ መመሊስና ንውቅዓያ
ታሪኻ ከይዝከር ዝረኣያ ከይድንግጸላ
እምኒ ኣብ ልዕሊ እምኒ ከቶ ከይንገድፈላ
ጎይታይ በጃኻ ንጸሎተይ ተመልከቶ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 5
ምስባርያኻ ኣብ ፍርዲ ኣይትእቶ
መቅደስ ልበይ ብቃልካ ሓድሶ
እሾኽ ሓልዮት ዓለም ካብ ዉሻጠ ልበይ በንቁሶ
መቅደስ ልበይ ብቃልካ ኣሐድስ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 6
እሾኽ ሓልዮት ዓለም ካብ ዉሽጢ ልበይ በንቁስ
ንንብረት ልበይ ባዕልኻ ማርኸለይ
ንኹሉ ስዒርካስ ልበይ ኣክበለይ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ',
        lyrics_transliteration = 'CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 1
Meqdes libey ferisa
Bibabilonawyan hat’yat fits’um reኺsa
Weኻru fitwet wushat’ea yihnbt’alu
Seyt’an bilsat’r niaqhaa yiglgelelu

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 2
Kemti niኽdanka nilbey temaቐlwo
Gele kiflu beti gele kiflu abti
Nigele ኸa beti derbeywo
Bisenki mienawey eshoኽ teኾrba beqwluni

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 3
Girma shaኻ nebsey seti nits’hnay neqits’uni
Ts’elaetኻ ts’elaeti simka ants’arey yilealu
Teakibom kemzi yiblu
Hayli eti liul sile zideኸme eza ketema wediቓya

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 4
Men keyreda niu niteakeb memelisna niwqaya
Tariኻ keyzker zireaya keydngts’ela
Emni ab lieli emni keto keyngedfela
Goytay bejaኻ nits’elotey temelketo

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 5
Misbaryaኻ ab firdi ayteto
Meqdes libey biqalka hadso
Eshoኽ halyot alem kab wushat’e libey benquso
Meqdes libey biqalka aheds

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos

VERSE 6
Eshoኽ halyot alem kab wusht’i libey benqus
Ninbret libey baelኻ marኸley
Niኹlu siirkas libey akbeley

CHORUS
Libey akbeley
Nay aminey kurat hamoy (gweytay) zehderet
Sefer menfes Kidus wagaa dem Kristos
Ts’elai afriswa ane keyhgos',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1ba56bc4-27cc-4c2f-a99d-dfea199daad4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 1
መቅደስ ልበይ ፈሪሳ
ብባቢሎናውያን ሓጥያት ፍጹም ረኺሳ
ወኻሩ ፍትወት ዉሻጤኣ ይሕንብጣሉ
ሰይጣን ብልሳጥር ንኣቅሓኣ ይግልገለሉ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 2
ከምቲ ንኽዳንካ ንልበይ ተማቐልዎ
ገለ ክፍሉ በቲ ገለ ክፍሉ ኣብቲ
ንገለ ኸኣ በቲ ደርበይዎ
ብሰንኪ ምዕናወይ እሾኽ ተኾርባ በቍሉኒ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 3
ግርማ ሻኻ ነብሰይ ሰቲ ንጽህናይ ነቂጹኒ
ጸላእትኻ ጸላእቲ ስምካ ኣንጻረይ ይለዓሉ
ተኣኪቦም ከምዚ ይብሉ
ሓይሊ እቲ ልዑል ስለ ዝደኸመ፡ እዛ ከተማ ወዲቓያ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 4
መን ከይረድኣ ንዑ ንተኣከብ መመሊስና ንውቅዓያ
ታሪኻ ከይዝከር ዝረኣያ ከይድንግጸላ
እምኒ ኣብ ልዕሊ እምኒ ከቶ ከይንገድፈላ
ጎይታይ በጃኻ ንጸሎተይ ተመልከቶ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 5
ምስባርያኻ ኣብ ፍርዲ ኣይትእቶ
መቅደስ ልበይ ብቃልካ ሓድሶ
እሾኽ ሓልዮት ዓለም ካብ ዉሻጠ ልበይ በንቁሶ
መቅደስ ልበይ ብቃልካ ኣሐድስ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ

VERSE 6
እሾኽ ሓልዮት ዓለም ካብ ዉሽጢ ልበይ በንቁስ
ንንብረት ልበይ ባዕልኻ ማርኸለይ
ንኹሉ ስዒርካስ ልበይ ኣክበለይ

CHORUS
ልበይ ኣክበለይ
ናይ ኣሚነይ ኩርዓት ሓሞይ (ጐይታይ) ዘሕደረት
ሰፈር መንፈስ ቅዱስ ዋጋኣ ደም ክርስቶስ
ጸላኢ ኣፍሪስዋ ኣነ ከይሕጎስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1ba56bc4-27cc-4c2f-a99d-dfea199daad4'::uuid, 'goyitay-bejaha', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gebiriel-kesemay ("Gebiriel Kesemay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1fe2a32c-1df5-47d8-902f-bf9ae8634746'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 1
ይሁንልኝ አልሸው ትውልድ እንዲፅናና
ከገብርኤል ሰምተው መላአክቱ ሁሉ
ለበጉ ማደሪያ ክብርን ይሰሻሉ
ብፅአት እንላለን እንኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 2
የራማውን ለዑል አብነት አድርገን
ስርሽ በምድር ነው ሐረግሽ በሰማይ
ንፁህ መሶበ ወርቅ የተምላሽ ሲሳይ
ይማይፅንሽ ፍሬን በላነው ጠጣነው

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 3
በኤፍራታ ሰምትን በዱር አግኝተነው
የተሰወረውን መና በልተነዋል
ከተመርጣት ጋር ብፅአት ብለናል
ከተፈxሮ በላይ ፅንስን ያዘለለ

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 4
የእሳት ምሶሶ ባንቺ ተተከለ
የእግዚአብሔር ሃገሩ የእንጀራ ቤታችን
ምንኛ ድንቅ ነው ክብርሽ እናታችን
ብፅዕት እንላለን እኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 5
ቅድስት ኤልሳቤትን አብነት አድርገን
ተወልዶ በግርግም ተኝቶ ስላዩት
ሰውና መላአክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 6
ብዳግሚት ሔዋን የአዳም ዘር ተካሰ
እጅ እንነሳለን ሆነን በትሕትና
ክብርሽን መመስከር ክብራችን ነው እና
ትወልዶ በግርግም ተኝቶ ስላዩት

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 7
ሰውና መላእክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ
በዳግሚት ሔዋን የአዳም ዘር ተካሰ
ብፅአት እንላለን እኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 8
ቅዱስ ገብርኤልን አብነት አድርግን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 1
Yihunlgn alshew tiwld endits’nana
Kegebrel semtew melaaktu hulu
Lebegu maderiya kibrn yiseshalu
Bits’at enlalen engnam adegdgen

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 2
Yeramawn leul abnet adrgen
Sirsh bemdr new heregsh besemay
Nits’uh mesobe werq yetemlash sisay
Yimayts’nsh firen belanew t’et’anew

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 3
Beefrata semtn bedur aggntenew
Yetesewerewn mena beltenewal
Ketemert’at gar bits’at bilenal
Ketefexro belay ts’nsn yazelele

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 4
Yeesat misoso banchi tetekele
YeEgziabher hageru yeenjera betachn
Mingna dinq new kibrsh enatachn
Bits’et enlalen egnam adegdgen

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 5
Kidist elsabetn abnet adrgen
Teweldo begrgm tegnto silayut
Sewna melaakt abrew akeberut
Yet’lu gidgda biljsh ferese

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 6
Bidagmit hewan yeadam zer tekase
Ej ennesalen honen bethtna
Kibrshn memesker kibrachn new ena
Tiweldo begrgm tegnto silayut

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 7
Sewna melaekt abrew akeberut
Yet’lu gidgda biljsh ferese
Bedagmit hewan yeadam zer tekase
Bits’at enlalen egnam adegdgen

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 8
Kidus gebreln abnet adrgn

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 1
ይሁንልኝ አልሸው ትውልድ እንዲፅናና
ከገብርኤል ሰምተው መላአክቱ ሁሉ
ለበጉ ማደሪያ ክብርን ይሰሻሉ
ብፅአት እንላለን እንኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 2
የራማውን ለዑል አብነት አድርገን
ስርሽ በምድር ነው ሐረግሽ በሰማይ
ንፁህ መሶበ ወርቅ የተምላሽ ሲሳይ
ይማይፅንሽ ፍሬን በላነው ጠጣነው

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 3
በኤፍራታ ሰምትን በዱር አግኝተነው
የተሰወረውን መና በልተነዋል
ከተመርጣት ጋር ብፅአት ብለናል
ከተፈxሮ በላይ ፅንስን ያዘለለ

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 4
የእሳት ምሶሶ ባንቺ ተተከለ
የእግዚአብሔር ሃገሩ የእንጀራ ቤታችን
ምንኛ ድንቅ ነው ክብርሽ እናታችን
ብፅዕት እንላለን እኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 5
ቅድስት ኤልሳቤትን አብነት አድርገን
ተወልዶ በግርግም ተኝቶ ስላዩት
ሰውና መላአክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 6
ብዳግሚት ሔዋን የአዳም ዘር ተካሰ
እጅ እንነሳለን ሆነን በትሕትና
ክብርሽን መመስከር ክብራችን ነው እና
ትወልዶ በግርግም ተኝቶ ስላዩት

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 7
ሰውና መላእክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ
በዳግሚት ሔዋን የአዳም ዘር ተካሰ
ብፅአት እንላለን እኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 8
ቅዱስ ገብርኤልን አብነት አድርግን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ',
        lyrics_transliteration = 'CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 1
Yihunlgn alshew tiwld endits’nana
Kegebrel semtew melaaktu hulu
Lebegu maderiya kibrn yiseshalu
Bits’at enlalen engnam adegdgen

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 2
Yeramawn leul abnet adrgen
Sirsh bemdr new heregsh besemay
Nits’uh mesobe werq yetemlash sisay
Yimayts’nsh firen belanew t’et’anew

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 3
Beefrata semtn bedur aggntenew
Yetesewerewn mena beltenewal
Ketemert’at gar bits’at bilenal
Ketefexro belay ts’nsn yazelele

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 4
Yeesat misoso banchi tetekele
YeEgziabher hageru yeenjera betachn
Mingna dinq new kibrsh enatachn
Bits’et enlalen egnam adegdgen

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 5
Kidist elsabetn abnet adrgen
Teweldo begrgm tegnto silayut
Sewna melaakt abrew akeberut
Yet’lu gidgda biljsh ferese

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 6
Bidagmit hewan yeadam zer tekase
Ej ennesalen honen bethtna
Kibrshn memesker kibrachn new ena
Tiweldo begrgm tegnto silayut

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 7
Sewna melaekt abrew akeberut
Yet’lu gidgda biljsh ferese
Bedagmit hewan yeadam zer tekase
Bits’at enlalen egnam adegdgen

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 8
Kidus gebreln abnet adrgn

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1fe2a32c-1df5-47d8-902f-bf9ae8634746'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 1
ይሁንልኝ አልሸው ትውልድ እንዲፅናና
ከገብርኤል ሰምተው መላአክቱ ሁሉ
ለበጉ ማደሪያ ክብርን ይሰሻሉ
ብፅአት እንላለን እንኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 2
የራማውን ለዑል አብነት አድርገን
ስርሽ በምድር ነው ሐረግሽ በሰማይ
ንፁህ መሶበ ወርቅ የተምላሽ ሲሳይ
ይማይፅንሽ ፍሬን በላነው ጠጣነው

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 3
በኤፍራታ ሰምትን በዱር አግኝተነው
የተሰወረውን መና በልተነዋል
ከተመርጣት ጋር ብፅአት ብለናል
ከተፈxሮ በላይ ፅንስን ያዘለለ

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 4
የእሳት ምሶሶ ባንቺ ተተከለ
የእግዚአብሔር ሃገሩ የእንጀራ ቤታችን
ምንኛ ድንቅ ነው ክብርሽ እናታችን
ብፅዕት እንላለን እኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 5
ቅድስት ኤልሳቤትን አብነት አድርገን
ተወልዶ በግርግም ተኝቶ ስላዩት
ሰውና መላአክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 6
ብዳግሚት ሔዋን የአዳም ዘር ተካሰ
እጅ እንነሳለን ሆነን በትሕትና
ክብርሽን መመስከር ክብራችን ነው እና
ትወልዶ በግርግም ተኝቶ ስላዩት

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 7
ሰውና መላእክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ
በዳግሚት ሔዋን የአዳም ዘር ተካሰ
ብፅአት እንላለን እኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 8
ቅዱስ ገብርኤልን አብነት አድርግን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1fe2a32c-1df5-47d8-902f-bf9ae8634746'::uuid, 'gebiriel-kesemay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- letaot-anisegidim-bilew ("Letaot Anisegidim Bilew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1bca8c71-881c-45a7-9836-05bf6de79475'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 1
በንጉሱ ቁጣ ልባቸው ሳይርድ
አንዳችም ሣይፈሩ በእሣቱ መንደድ
በእምነት በርትተው መከራን ታገሱ
የታመኑት ጌታ ፈረደ ለነሱ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 2
በመካከል ታየ ከእነሱ ጋር
መላኩ ገብርኤል ታዞ ከእግዚአብሔር
በእሳቱ መካከል ምስጋናን ጀመሩ
ስቡህ እኔ ብለው ለስሙ ዘመሩ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 3
የሳቱን ነበልባል ውሀ እያደረገ
የእግዚአብሔር መላክ ነብሳቱን ታደገ
አንዳች ሳይነኩ ከእሳቱ ወጡ
የእግዚአብሔርን ክብር ለዓለም ገለጡ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 4
ተመላልሰው ታዩ በእሳቱ መሀል
ከራሳቸው ፀጉር አንዲቶአ ሳትጎል
የቀለዳውያን የእሳት ምድጃቸው
ህፃናቱን ትቶ እነሱን በላቸው

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 1
Bengusu qut’a libachew sayrd
Andachm sayferu beesatu mended
Beemnet berttew mekeran tagesu
Yetamenut Geta ferede lenesu

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 2
Bemekakel taye keenesu gar
Melaku Gebriel tazo keegziabher
Beesatu mekakel misganan jemeru
Sibuh ene bilew lesmu zemeru

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 3
Yesatun nebelbal wihe eyaderege
YeEgziabher melak nebsatun tadege
Andach sayneku keesatu wet’u
Yeegziabhern kibir lealem gelet’u

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 4
Temelalsew tayu beesatu mehel
Kerasachew ts’egur anditoa satgol
Yeqeledawyan yeesat midjachew
Hits’anatun tito enesun belachew

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 1
በንጉሱ ቁጣ ልባቸው ሳይርድ
አንዳችም ሣይፈሩ በእሣቱ መንደድ
በእምነት በርትተው መከራን ታገሱ
የታመኑት ጌታ ፈረደ ለነሱ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 2
በመካከል ታየ ከእነሱ ጋር
መላኩ ገብርኤል ታዞ ከእግዚአብሔር
በእሳቱ መካከል ምስጋናን ጀመሩ
ስቡህ እኔ ብለው ለስሙ ዘመሩ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 3
የሳቱን ነበልባል ውሀ እያደረገ
የእግዚአብሔር መላክ ነብሳቱን ታደገ
አንዳች ሳይነኩ ከእሳቱ ወጡ
የእግዚአብሔርን ክብር ለዓለም ገለጡ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 4
ተመላልሰው ታዩ በእሳቱ መሀል
ከራሳቸው ፀጉር አንዲቶአ ሳትጎል
የቀለዳውያን የእሳት ምድጃቸው
ህፃናቱን ትቶ እነሱን በላቸው

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/',
        lyrics_transliteration = 'CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 1
Bengusu qut’a libachew sayrd
Andachm sayferu beesatu mended
Beemnet berttew mekeran tagesu
Yetamenut Geta ferede lenesu

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 2
Bemekakel taye keenesu gar
Melaku Gebriel tazo keegziabher
Beesatu mekakel misganan jemeru
Sibuh ene bilew lesmu zemeru

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 3
Yesatun nebelbal wihe eyaderege
YeEgziabher melak nebsatun tadege
Andach sayneku keesatu wet’u
Yeegziabhern kibir lealem gelet’u

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 4
Temelalsew tayu beesatu mehel
Kerasachew ts’egur anditoa satgol
Yeqeledawyan yeesat midjachew
Hits’anatun tito enesun belachew

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1bca8c71-881c-45a7-9836-05bf6de79475'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 1
በንጉሱ ቁጣ ልባቸው ሳይርድ
አንዳችም ሣይፈሩ በእሣቱ መንደድ
በእምነት በርትተው መከራን ታገሱ
የታመኑት ጌታ ፈረደ ለነሱ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 2
በመካከል ታየ ከእነሱ ጋር
መላኩ ገብርኤል ታዞ ከእግዚአብሔር
በእሳቱ መካከል ምስጋናን ጀመሩ
ስቡህ እኔ ብለው ለስሙ ዘመሩ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 3
የሳቱን ነበልባል ውሀ እያደረገ
የእግዚአብሔር መላክ ነብሳቱን ታደገ
አንዳች ሳይነኩ ከእሳቱ ወጡ
የእግዚአብሔርን ክብር ለዓለም ገለጡ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 4
ተመላልሰው ታዩ በእሳቱ መሀል
ከራሳቸው ፀጉር አንዲቶአ ሳትጎል
የቀለዳውያን የእሳት ምድጃቸው
ህፃናቱን ትቶ እነሱን በላቸው

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1bca8c71-881c-45a7-9836-05bf6de79475'::uuid, 'letaot-anisegidim-bilew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- esat-tsirihu ("Esat Tsirihu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '342519f0-7eb6-4f1c-b75b-7a2b830d712d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/

VERSE 1
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/

CHORUS
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)

VERSE 1
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)

CHORUS
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/

VERSE 1
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/

CHORUS
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/',
        lyrics_transliteration = 'CHORUS
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)

VERSE 1
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)

CHORUS
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '342519f0-7eb6-4f1c-b75b-7a2b830d712d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/

VERSE 1
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/

CHORUS
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '342519f0-7eb6-4f1c-b75b-7a2b830d712d'::uuid, 'esat-tsirihu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- befiker-lazimeh ("Befiker Lazimeh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8be97736-d161-4647-ba78-762643adb7b3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 1
አዝማች
በልቤ ትከሻ በቀል ተሸክሜ
ወንድሜን ጠልቼ ካንተ ፊት መቆሜ
ጻድቅ ቢያስመስለኝ በሰዎች እይታ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 2
ጉዴን ስለምታውቅ እስራቴን ፍታ (2)
አዝ
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበከቴ መዝሙሬ ሆኗል የቃል ብቻ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 3
ማረኝ እና ይብቃኝ ለሐጥያት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
አዝ
አሸንፈህልኝ እኔ ግን ተሸነፍኩ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 4
በእጄ ማልነካዉን ለሰው እያሸከምኩ
በቃሌ ጠርቼህ በግብሬ ረገምኩህ
ባስመሳይ ማንነት እየሸነገልኩ (2)
አዝ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 5
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበክቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጢአት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 6
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ይገዛህኝ ባለውለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ(2)

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 1
CHORUS
Belbe tikesha beqel teshekme
Wendmen t’elche kante fit meqome
Ts’adq biyasmeslegn besewoch eyta

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 2
Guden silemtawq esraten fita (2)
CHORUS
Zuryawn tekebo beeshoh t’lacha
Sibekete mezmure honwal yeqal bicha

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 3
Maregn ena yibqagn lehet’yat mezmetu
Fiqr yelelew sew new yekentu kentu (2)
CHORUS
Ashenfehlgn ene gin teshenefku

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 4
Beeje malnekawun lesew eyashekemku
Beqale t’ercheh begbre regemkuh
Basmesay mannet eyeshenegelku (2)
CHORUS

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 5
Zuryawn tekebo beeshoh t’lacha
Sibekte mezmure honwal yeqal bicha
Maregn ena yibqagn lehet’iat mezmetu
Fiqr yelelew sew new yekentu kentu (2)

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 6
Befqr lazimh fiqr neh Getaye
Bedem yigezahgn balewletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 1
አዝማች
በልቤ ትከሻ በቀል ተሸክሜ
ወንድሜን ጠልቼ ካንተ ፊት መቆሜ
ጻድቅ ቢያስመስለኝ በሰዎች እይታ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 2
ጉዴን ስለምታውቅ እስራቴን ፍታ (2)
አዝ
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበከቴ መዝሙሬ ሆኗል የቃል ብቻ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 3
ማረኝ እና ይብቃኝ ለሐጥያት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
አዝ
አሸንፈህልኝ እኔ ግን ተሸነፍኩ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 4
በእጄ ማልነካዉን ለሰው እያሸከምኩ
በቃሌ ጠርቼህ በግብሬ ረገምኩህ
ባስመሳይ ማንነት እየሸነገልኩ (2)
አዝ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 5
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበክቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጢአት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 6
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ይገዛህኝ ባለውለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ(2)

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)',
        lyrics_transliteration = 'CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 1
CHORUS
Belbe tikesha beqel teshekme
Wendmen t’elche kante fit meqome
Ts’adq biyasmeslegn besewoch eyta

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 2
Guden silemtawq esraten fita (2)
CHORUS
Zuryawn tekebo beeshoh t’lacha
Sibekete mezmure honwal yeqal bicha

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 3
Maregn ena yibqagn lehet’yat mezmetu
Fiqr yelelew sew new yekentu kentu (2)
CHORUS
Ashenfehlgn ene gin teshenefku

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 4
Beeje malnekawun lesew eyashekemku
Beqale t’ercheh begbre regemkuh
Basmesay mannet eyeshenegelku (2)
CHORUS

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 5
Zuryawn tekebo beeshoh t’lacha
Sibekte mezmure honwal yeqal bicha
Maregn ena yibqagn lehet’iat mezmetu
Fiqr yelelew sew new yekentu kentu (2)

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 6
Befqr lazimh fiqr neh Getaye
Bedem yigezahgn balewletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8be97736-d161-4647-ba78-762643adb7b3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)
አዝማች==============
በልቤ ትከሻ በቀል ተሸክሜ
ወንድሜን ጠልቼ ካንተ ፊት መቆሜ
ጻድቅ ቢያስመስለኝ በሰዎች እይታ
ጉዴን ስለምታውቅ እስራቴን ፍታ (2)
አዝ===============
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበከቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጥያት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
አዝ================
አሸንፈህልኝ እኔ ግን ተሸነፍኩ
በእጄ ማልነካዉን ለሰው እያሸከምኩ
በቃሌ ጠርቼህ በግብሬ ረገምኩህ
ባስመሳይ ማንነት እየሸነገልኩ (2)
አዝ================
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበክቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጢአት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ይገዛህኝ ባለውለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ(2)

VERSE 1
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)
አዝማች==============
በልቤ ትከሻ በቀል ተሸክሜ
ወንድሜን ጠልቼ ካንተ ፊት መቆሜ
ጻድቅ ቢያስመስለኝ በሰዎች እይታ
ጉዴን ስለምታውቅ እስራቴን ፍታ (2)
አዝ===============
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበከቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጥያት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
አዝ================
አሸንፈህልኝ እኔ ግን ተሸነፍኩ
በእጄ ማልነካዉን ለሰው እያሸከምኩ
በቃሌ ጠርቼህ በግብሬ ረገምኩህ
ባስመሳይ ማንነት እየሸነገልኩ (2)
አዝ================
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበክቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጢአት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ይገዛህኝ ባለውለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ(2)

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)
አዝማች==============
በልቤ ትከሻ በቀል ተሸክሜ
ወንድሜን ጠልቼ ካንተ ፊት መቆሜ
ጻድቅ ቢያስመስለኝ በሰዎች እይታ
ጉዴን ስለምታውቅ እስራቴን ፍታ (2)
አዝ===============
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበከቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጥያት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
አዝ================
አሸንፈህልኝ እኔ ግን ተሸነፍኩ
በእጄ ማልነካዉን ለሰው እያሸከምኩ
በቃሌ ጠርቼህ በግብሬ ረገምኩህ
ባስመሳይ ማንነት እየሸነገልኩ (2)
አዝ================
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበክቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጢአት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ይገዛህኝ ባለውለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8be97736-d161-4647-ba78-762643adb7b3'::uuid, 'befiker-lazimeh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- maedote ("Maedote")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '38ab2fed-2f6b-497e-a87c-b0dbd84a18cf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 1
በመስቀሉ ጉዞ በእድካሚው ተራራ
ዘንጌን አንቺን ይዤ ዳገቱን ሳልፈራ
ስንቅ ነው እያልኩኝ ስምሽ ለመንገዴ
ካየልኝ ገባለሁ የብርሃን አምዴ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 2
መንፈሳዊት መርከብ ድንግላዊት መጾር
የመለኮት አትሮንስ የሰላሜ ቅጥር
የመድኃኒቴ ደጅ ከሰርጉ መግቢያዬ
የድህነት ማህተሜ ሞትን ማለፊያዬ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 3
ምድር ወፍጮ ሆና መጅ ቢሆን ሰማዩ
ተራሮች ተንደው ቢነደል ቀላዩ
የሚያደርጉኝ የለም አልፈው የእርሷን ስም
አልሰጋ አልደነግጥ አልፈራም ፍጹም

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 4
የረአብ ቀይ ፈትል ከሞት እንዳስጣላት
ምልክት ሆኖኛል የልጅሽ ደም ቅላት
እሳት በዳሰሱት ቅዱሳት እጆችሽ
ከሚመጣው መቅሰፍት እድናለሁ ልጅሽ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 1
Bemesqelu guzo beedkamiw terara
Zengen anchin yizhe dagetun salfera
Sinq new eyalkugn simsh lemengede
Kayelgn gebalehu yebrhan amde

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 2
Menfesawit merkeb dinglawit mets’or
Yemelekot atrons yeselame qit’r
Yemedhanite dej kesergu megbiyaye
Yedhnet mahteme motn malefiyaye

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 3
Midr wefch’o hona mej bihon semayu
Teraroch tendew binedel qelayu
Yemiyadergugn yelem alfew yeerswan sim
Alsega aldenegt’ alferam fits’um

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 4
Yereab qey fetl kemot endast’alat
Milkt honognal yeljsh dem qilat
Esat bedasesut qidusat ejochsh
Kemimet’aw meqseft ednalehu lijsh

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 1
በመስቀሉ ጉዞ በእድካሚው ተራራ
ዘንጌን አንቺን ይዤ ዳገቱን ሳልፈራ
ስንቅ ነው እያልኩኝ ስምሽ ለመንገዴ
ካየልኝ ገባለሁ የብርሃን አምዴ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 2
መንፈሳዊት መርከብ ድንግላዊት መጾር
የመለኮት አትሮንስ የሰላሜ ቅጥር
የመድኃኒቴ ደጅ ከሰርጉ መግቢያዬ
የድህነት ማህተሜ ሞትን ማለፊያዬ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 3
ምድር ወፍጮ ሆና መጅ ቢሆን ሰማዩ
ተራሮች ተንደው ቢነደል ቀላዩ
የሚያደርጉኝ የለም አልፈው የእርሷን ስም
አልሰጋ አልደነግጥ አልፈራም ፍጹም

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 4
የረአብ ቀይ ፈትል ከሞት እንዳስጣላት
ምልክት ሆኖኛል የልጅሽ ደም ቅላት
እሳት በዳሰሱት ቅዱሳት እጆችሽ
ከሚመጣው መቅሰፍት እድናለሁ ልጅሽ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ',
        lyrics_transliteration = 'CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 1
Bemesqelu guzo beedkamiw terara
Zengen anchin yizhe dagetun salfera
Sinq new eyalkugn simsh lemengede
Kayelgn gebalehu yebrhan amde

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 2
Menfesawit merkeb dinglawit mets’or
Yemelekot atrons yeselame qit’r
Yemedhanite dej kesergu megbiyaye
Yedhnet mahteme motn malefiyaye

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 3
Midr wefch’o hona mej bihon semayu
Teraroch tendew binedel qelayu
Yemiyadergugn yelem alfew yeerswan sim
Alsega aldenegt’ alferam fits’um

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 4
Yereab qey fetl kemot endast’alat
Milkt honognal yeljsh dem qilat
Esat bedasesut qidusat ejochsh
Kemimet’aw meqseft ednalehu lijsh

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '38ab2fed-2f6b-497e-a87c-b0dbd84a18cf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 1
በመስቀሉ ጉዞ በእድካሚው ተራራ
ዘንጌን አንቺን ይዤ ዳገቱን ሳልፈራ
ስንቅ ነው እያልኩኝ ስምሽ ለመንገዴ
ካየልኝ ገባለሁ የብርሃን አምዴ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 2
መንፈሳዊት መርከብ ድንግላዊት መጾር
የመለኮት አትሮንስ የሰላሜ ቅጥር
የመድኃኒቴ ደጅ ከሰርጉ መግቢያዬ
የድህነት ማህተሜ ሞትን ማለፊያዬ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 3
ምድር ወፍጮ ሆና መጅ ቢሆን ሰማዩ
ተራሮች ተንደው ቢነደል ቀላዩ
የሚያደርጉኝ የለም አልፈው የእርሷን ስም
አልሰጋ አልደነግጥ አልፈራም ፍጹም

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 4
የረአብ ቀይ ፈትል ከሞት እንዳስጣላት
ምልክት ሆኖኛል የልጅሽ ደም ቅላት
እሳት በዳሰሱት ቅዱሳት እጆችሽ
ከሚመጣው መቅሰፍት እድናለሁ ልጅሽ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '38ab2fed-2f6b-497e-a87c-b0dbd84a18cf'::uuid, 'maedote', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sebihiwo-leamilakine ("Sebihiwo Leamilakine")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6115e955-c530-4452-ba6b-ba1a1ad793fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 1
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 2
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 3
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 4
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 1
Yitayal yaberal Geta zarem besraw
Misgun new serawit hulu yamesegenew

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 2
Mihretu yiqrtaw bizu kewesen yesefa
Abat new birtu met’egiya yesew lijoch tesfa
Megabi left’ret alem talaq balets’ega
Yabbal yilemelmal ersun yetet’ega

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 3
Temesgen temesgen yilal yetegobegne sew
Ket’fat kegusqulna kemot yemelesew
Yiqebal ketach ansto keregnnet bota
Yiqrtaw ts’egaw bizunew mihretu yegeta

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 4
Melaekt belay besemay yizemruletal
Dawitm kebegenaw gar beqne tenestwal
Bemdrm egna lijochu enbel nisebho
Yigebal leamlake esrael widase amlko

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 1
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 2
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 3
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 4
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን',
        lyrics_transliteration = 'CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 1
Yitayal yaberal Geta zarem besraw
Misgun new serawit hulu yamesegenew

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 2
Mihretu yiqrtaw bizu kewesen yesefa
Abat new birtu met’egiya yesew lijoch tesfa
Megabi left’ret alem talaq balets’ega
Yabbal yilemelmal ersun yetet’ega

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 3
Temesgen temesgen yilal yetegobegne sew
Ket’fat kegusqulna kemot yemelesew
Yiqebal ketach ansto keregnnet bota
Yiqrtaw ts’egaw bizunew mihretu yegeta

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun

VERSE 4
Melaekt belay besemay yizemruletal
Dawitm kebegenaw gar beqne tenestwal
Bemdrm egna lijochu enbel nisebho
Yigebal leamlake esrael widase amlko

CHORUS
Sebhwo leamlakne Halleluya leEgziabher (2)
Besemay bemdr/6/
Semayun yalmsoso ats’ntwal beqalu
Meretn bewhoch mehal mesrtwal dinberun',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6115e955-c530-4452-ba6b-ba1a1ad793fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 1
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 2
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 3
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን

VERSE 4
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ

CHORUS
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር/፮/
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6115e955-c530-4452-ba6b-ba1a1ad793fc'::uuid, 'sebihiwo-leamilakine', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- track ("Track")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c2f076a6-e29b-40cf-9aa1-9e98e619da02'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 1
ዓለሙን እንዲሁ ወደደና
ከሰማያት በላይ ወረደና
በአጭር ቁመት
በጠባብ ደረት

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 2
ተወሰነ አምላከ አማልክት
ከሰማያት የወረደ ፍቅር ስቦት የመጣው
ወልደ አብ ወልደ ማርያም እየሱስ ፈራጅ ነው
አዝ…

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 3
ቅድመ ዓለም ተወልዶ ያለ እናት
ድህረ አለምም ያለ አባት
የእግዚአብሔር ልጅ በርግጥም ሰው ሆነ
ሁሉ በርሱ ይሄው ተከናወነ

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 4
ከሰማያት የወረደ ፍቅር ስቦት የመጣው
ወልደ አብ ወልደ ማርያም ክርስቶስ አምላክ ነው
አዝ….
የማይታይ ታየ በምድር

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 5
ረቂቁ ገዘፈ ስለ ፍቅር
ስጋን ተዋህዶ ሆነልን ፈውስ
አማኑኤል የነገስታት ንጉስ
ከሰማያት የወረደ ፍቅር ስቦት የመጣው

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 6
ወልደ አብ ወልደ ማርያም እግዚአብሔር እርሱ ነው
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 7
ከድንግል ማርያም ተወለደ

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 1
Alemun endihu wededena
Kesemayat belay weredena
Beach’r qumet
Bet’ebab deret

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 2
Tewesene amlake amalkt
Kesemayat yewerede fiqr sibot yemet’aw
Welde Ab welde Maryam eyesus feraj new
CHORUS

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 3
Qidme alem teweldo yale enat
Dihre alemm yale abat
YeEgziabher lij bergt’m sew hone
Hulu bersu yihew tekenawene

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 4
Kesemayat yewerede fiqr sibot yemet’aw
Welde Ab welde Maryam Kristos amlak new
CHORUS
Yemaytay taye bemdr

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 5
Reqiqu gezefe sile fiqr
Sigan Tewahedo honeln fews
Amanuel yenegestat nigus
Kesemayat yewerede fiqr sibot yemet’aw

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 6
Welde Ab welde Maryam Egziabher ersu new
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 7
Kedngl Maryam tewelede

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 1
ዓለሙን እንዲሁ ወደደና
ከሰማያት በላይ ወረደና
በአጭር ቁመት
በጠባብ ደረት

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 2
ተወሰነ አምላከ አማልክት
ከሰማያት የወረደ ፍቅር ስቦት የመጣው
ወልደ አብ ወልደ ማርያም እየሱስ ፈራጅ ነው
አዝ…

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 3
ቅድመ ዓለም ተወልዶ ያለ እናት
ድህረ አለምም ያለ አባት
የእግዚአብሔር ልጅ በርግጥም ሰው ሆነ
ሁሉ በርሱ ይሄው ተከናወነ

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 4
ከሰማያት የወረደ ፍቅር ስቦት የመጣው
ወልደ አብ ወልደ ማርያም ክርስቶስ አምላክ ነው
አዝ….
የማይታይ ታየ በምድር

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 5
ረቂቁ ገዘፈ ስለ ፍቅር
ስጋን ተዋህዶ ሆነልን ፈውስ
አማኑኤል የነገስታት ንጉስ
ከሰማያት የወረደ ፍቅር ስቦት የመጣው

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 6
ወልደ አብ ወልደ ማርያም እግዚአብሔር እርሱ ነው
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 7
ከድንግል ማርያም ተወለደ

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ',
        lyrics_transliteration = 'CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 1
Alemun endihu wededena
Kesemayat belay weredena
Beach’r qumet
Bet’ebab deret

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 2
Tewesene amlake amalkt
Kesemayat yewerede fiqr sibot yemet’aw
Welde Ab welde Maryam eyesus feraj new
CHORUS

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 3
Qidme alem teweldo yale enat
Dihre alemm yale abat
YeEgziabher lij bergt’m sew hone
Hulu bersu yihew tekenawene

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 4
Kesemayat yewerede fiqr sibot yemet’aw
Welde Ab welde Maryam Kristos amlak new
CHORUS
Yemaytay taye bemdr

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 5
Reqiqu gezefe sile fiqr
Sigan Tewahedo honeln fews
Amanuel yenegestat nigus
Kesemayat yewerede fiqr sibot yemet’aw

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 6
Welde Ab welde Maryam Egziabher ersu new
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 7
Kedngl Maryam tewelede

CHORUS
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c2f076a6-e29b-40cf-9aa1-9e98e619da02'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 1
ዓለሙን እንዲሁ ወደደና
ከሰማያት በላይ ወረደና
በአጭር ቁመት
በጠባብ ደረት

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 2
ተወሰነ አምላከ አማልክት
ከሰማያት የወረደ ፍቅር ስቦት የመጣው
ወልደ አብ ወልደ ማርያም እየሱስ ፈራጅ ነው
አዝ…

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 3
ቅድመ ዓለም ተወልዶ ያለ እናት
ድህረ አለምም ያለ አባት
የእግዚአብሔር ልጅ በርግጥም ሰው ሆነ
ሁሉ በርሱ ይሄው ተከናወነ

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 4
ከሰማያት የወረደ ፍቅር ስቦት የመጣው
ወልደ አብ ወልደ ማርያም ክርስቶስ አምላክ ነው
አዝ….
የማይታይ ታየ በምድር

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 5
ረቂቁ ገዘፈ ስለ ፍቅር
ስጋን ተዋህዶ ሆነልን ፈውስ
አማኑኤል የነገስታት ንጉስ
ከሰማያት የወረደ ፍቅር ስቦት የመጣው

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 6
ወልደ አብ ወልደ ማርያም እግዚአብሔር እርሱ ነው
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 7
ከድንግል ማርያም ተወለደ

CHORUS
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c2f076a6-e29b-40cf-9aa1-9e98e619da02'::uuid, 'track', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emnet-kab-msmae-ya ("Emnet Kab Msmae'ya")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1cec4f44-59b0-4bd5-a6c8-a346578e2cd3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 1
ብጽኑዕ ኣብ ልበይ ግዲ ዘይሰፈረ ትጥዑም ብስራት
ክንዲ ዝዓርፈሉ ኣሻቡ ይጠፍእ ይጎድለኒ እምነት
ሰሚዑ ዝርስዕ ጸላኢ ዝሰርቆ ኮይነ ከይተርፍ
ደጊምካ ኣንቅሓኒ ጎይታ መንፈስቅዱስ ንድኻመይ ደግፍ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 2
እምነት ካብ ምስማዕ''ያ
ቃልካ ምስ ሰማዕኩ ዋኒነይ ገዲፈ ንቤትካ ይጠብቆ
ግን ድማ ኣይጸንሕን ሓልዮት ናይ''ዛ ስጋይ ንልበይ ይሓንቆ
ነቲ ሓዲግ ጌሩ ንድሕሪት ዝጎተኒ ፍርሒ ናይ መጻኢ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 3
ስዒረ ክወጽእ ኣዒንተይ ክፈተን ጸጋኻ ክርኢ
እምነት ካብ ምስማዕ''ያ
ጽን ኢለ ክሰምዖ ሓጎስ ይወረኒ ነቲ ዝተባህለ
ሽግር ምስ መጸ ግን ጸኒዐ ኣይጸንዕን ካብ ስፍራይ ይእለ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 4
ሕጂ ግን እምነተይ ሱሩ ንኽድልድል ምትባዕ ኣላምዶ
ክእመን ንስምካ ወትሩ ንኽእውጅ ኣብ ኩሉ ዝኸዶ
እምነት ካብ ምስማዕ''ያ
ከምቶም ዝተናእዱ ናይ ምድሓኖም ወንጌል ብህድኣት ዝሰምዑ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 5
ኣብቲ ዱዃ ልቦሙ ሚእቲ ዝፈረየ ትቃል ተዘሪኡ
ኣነ ውን ከምኣቶም ንዓካ ዘኽብር ንኽርከበኒ
እነኹ ኣብቅድሜኻ ንነብሰይ የቅርባ ብቃልካ ስርሓኒ
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 6
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 1
Bits’nue ab libey gidi zeysefere tit’um bisrat
Kindi ziarfelu ashabu yit’efe yigodleni emnet
Semiu zirse ts’elai ziserqo koyne keyterf
Degimka anqhani goyta Menfes Kidus nidኻmey degf

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 2
Emnet kab mismae''ya
Qalka mis semaeku waniney gedife nibetka yit’ebqo
Gin dima ayts’enhn halyot nay''za sigay nilbey yihanqo
Neti hadig geru nidhrit zigoteni firhi nay mets’ai

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 3
Siire kiwets’e aintey kifeten ts’egaኻ kiri
Emnet kab mismae''ya
Ts’n ile kisemo hagos yiwereni neti zitebahle
Shgr mis mets’e gin ts’enia ayts’enen kab sifray yiele

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 4
Hiji gin emnetey suru niኽdldl mitbae alamdo
Kiemen nismka wetru niኽewj ab kulu ziኸdo
Emnet kab mismae''ya
Kemtom zitenaedu nay midhanom wengel bihdat zisemu

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 5
Abti dukhwa libomu mieti zifereye tiqal tezeriu
Ane win kematom niaka zeኽbr niኽrkebeni
Eneኹ abqdmeኻ ninebsey yeqrba biqalka sirhani
Emnet kab mismae''ya mismae win biqal nay Kristos

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 6
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 1
ብጽኑዕ ኣብ ልበይ ግዲ ዘይሰፈረ ትጥዑም ብስራት
ክንዲ ዝዓርፈሉ ኣሻቡ ይጠፍእ ይጎድለኒ እምነት
ሰሚዑ ዝርስዕ ጸላኢ ዝሰርቆ ኮይነ ከይተርፍ
ደጊምካ ኣንቅሓኒ ጎይታ መንፈስቅዱስ ንድኻመይ ደግፍ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 2
እምነት ካብ ምስማዕ''ያ
ቃልካ ምስ ሰማዕኩ ዋኒነይ ገዲፈ ንቤትካ ይጠብቆ
ግን ድማ ኣይጸንሕን ሓልዮት ናይ''ዛ ስጋይ ንልበይ ይሓንቆ
ነቲ ሓዲግ ጌሩ ንድሕሪት ዝጎተኒ ፍርሒ ናይ መጻኢ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 3
ስዒረ ክወጽእ ኣዒንተይ ክፈተን ጸጋኻ ክርኢ
እምነት ካብ ምስማዕ''ያ
ጽን ኢለ ክሰምዖ ሓጎስ ይወረኒ ነቲ ዝተባህለ
ሽግር ምስ መጸ ግን ጸኒዐ ኣይጸንዕን ካብ ስፍራይ ይእለ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 4
ሕጂ ግን እምነተይ ሱሩ ንኽድልድል ምትባዕ ኣላምዶ
ክእመን ንስምካ ወትሩ ንኽእውጅ ኣብ ኩሉ ዝኸዶ
እምነት ካብ ምስማዕ''ያ
ከምቶም ዝተናእዱ ናይ ምድሓኖም ወንጌል ብህድኣት ዝሰምዑ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 5
ኣብቲ ዱዃ ልቦሙ ሚእቲ ዝፈረየ ትቃል ተዘሪኡ
ኣነ ውን ከምኣቶም ንዓካ ዘኽብር ንኽርከበኒ
እነኹ ኣብቅድሜኻ ንነብሰይ የቅርባ ብቃልካ ስርሓኒ
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 6
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×',
        lyrics_transliteration = 'CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 1
Bits’nue ab libey gidi zeysefere tit’um bisrat
Kindi ziarfelu ashabu yit’efe yigodleni emnet
Semiu zirse ts’elai ziserqo koyne keyterf
Degimka anqhani goyta Menfes Kidus nidኻmey degf

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 2
Emnet kab mismae''ya
Qalka mis semaeku waniney gedife nibetka yit’ebqo
Gin dima ayts’enhn halyot nay''za sigay nilbey yihanqo
Neti hadig geru nidhrit zigoteni firhi nay mets’ai

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 3
Siire kiwets’e aintey kifeten ts’egaኻ kiri
Emnet kab mismae''ya
Ts’n ile kisemo hagos yiwereni neti zitebahle
Shgr mis mets’e gin ts’enia ayts’enen kab sifray yiele

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 4
Hiji gin emnetey suru niኽdldl mitbae alamdo
Kiemen nismka wetru niኽewj ab kulu ziኸdo
Emnet kab mismae''ya
Kemtom zitenaedu nay midhanom wengel bihdat zisemu

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 5
Abti dukhwa libomu mieti zifereye tiqal tezeriu
Ane win kematom niaka zeኽbr niኽrkebeni
Eneኹ abqdmeኻ ninebsey yeqrba biqalka sirhani
Emnet kab mismae''ya mismae win biqal nay Kristos

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×

VERSE 6
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu

CHORUS
Emnet kab mismae''ya mismae win biqal nay Kristos
Endabele ab aezaney qalatka wetru yimelales
Neti zedhyeni wetru endakwahkuhe wisht’ey kiኸftelu
Bihaqi kilwet’ nits’elmat hiwetey birhan abrhalu 2×',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1cec4f44-59b0-4bd5-a6c8-a346578e2cd3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 1
ብጽኑዕ ኣብ ልበይ ግዲ ዘይሰፈረ ትጥዑም ብስራት
ክንዲ ዝዓርፈሉ ኣሻቡ ይጠፍእ ይጎድለኒ እምነት
ሰሚዑ ዝርስዕ ጸላኢ ዝሰርቆ ኮይነ ከይተርፍ
ደጊምካ ኣንቅሓኒ ጎይታ መንፈስቅዱስ ንድኻመይ ደግፍ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 2
እምነት ካብ ምስማዕ''ያ
ቃልካ ምስ ሰማዕኩ ዋኒነይ ገዲፈ ንቤትካ ይጠብቆ
ግን ድማ ኣይጸንሕን ሓልዮት ናይ''ዛ ስጋይ ንልበይ ይሓንቆ
ነቲ ሓዲግ ጌሩ ንድሕሪት ዝጎተኒ ፍርሒ ናይ መጻኢ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 3
ስዒረ ክወጽእ ኣዒንተይ ክፈተን ጸጋኻ ክርኢ
እምነት ካብ ምስማዕ''ያ
ጽን ኢለ ክሰምዖ ሓጎስ ይወረኒ ነቲ ዝተባህለ
ሽግር ምስ መጸ ግን ጸኒዐ ኣይጸንዕን ካብ ስፍራይ ይእለ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 4
ሕጂ ግን እምነተይ ሱሩ ንኽድልድል ምትባዕ ኣላምዶ
ክእመን ንስምካ ወትሩ ንኽእውጅ ኣብ ኩሉ ዝኸዶ
እምነት ካብ ምስማዕ''ያ
ከምቶም ዝተናእዱ ናይ ምድሓኖም ወንጌል ብህድኣት ዝሰምዑ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 5
ኣብቲ ዱዃ ልቦሙ ሚእቲ ዝፈረየ ትቃል ተዘሪኡ
ኣነ ውን ከምኣቶም ንዓካ ዘኽብር ንኽርከበኒ
እነኹ ኣብቅድሜኻ ንነብሰይ የቅርባ ብቃልካ ስርሓኒ
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×

VERSE 6
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ

CHORUS
እምነት ካብ ምስማዕ''ያ ምስማዕ ውን ብቃል ናይ ክርስቶስ
እንዳበለ ኣብ ኣእዛነይ ቃላትካ ወትሩ ይመላለስ
ነቲ ዘድህየኒ ወትሩ እንዳኳሕኩሐ ውሽጠይ ክኸፍተሉ
ብሓቂ ክልወጥ ንጸልማት ሂወተይ ብርሃን ኣብርሃሉ 2×'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1cec4f44-59b0-4bd5-a6c8-a346578e2cd3'::uuid, 'emnet-kab-msmae-ya', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- altewegnm-zemarit-fasika-mekonen ("Altewegnm Zemarit Fasika Mekonen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '235d4f7f-1997-48aa-ad9d-efc4cfa46455'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 1
ብጠፋበት እንኳን አልተወኝም ለካ
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል
ለካስ አልጠላኝም ጌታ ይወደኛል
አዝ፡፡፡፡

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 2
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ብረሳው
ለእኔ ያለው ፍቅር አልቀነሰብኝም
ዛሬም ይወደኛል ጌታ አልጠላኝም

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 3
ዛሬም ይወደኛል ጌታ አልጠላኝም
አዝ፡፡፡፡
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 4
በሕይወቴ ሁሉ ፍፁም ለመራኝ
ክብርና ምስጋናን አቀርባለሁኝ

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 1
Bit’efabet enkwan altewegnm leka
Zarem lije bilo dagm yit’eragnal
Lekas alt’elagnm Geta yiwedegnal
CHORUS

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 2
Leslt’an lekbre biye sikdew
Legenzeb adlche ene biresaw
Leene yalew fiqr alqenesebgnm
Zarem yiwedegnal Geta alt’elagnm

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 3
Zarem yiwedegnal Geta alt’elagnm
CHORUS
Tadiya lezih fiqru lelelew wesen
Kech’nch’a meqabr lawet’agn enen

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 4
Behywete hulu fits’um lemeragn
Kibrna misganan aqerbalehugn

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 1
ብጠፋበት እንኳን አልተወኝም ለካ
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል
ለካስ አልጠላኝም ጌታ ይወደኛል
አዝ፡፡፡፡

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 2
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ብረሳው
ለእኔ ያለው ፍቅር አልቀነሰብኝም
ዛሬም ይወደኛል ጌታ አልጠላኝም

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 3
ዛሬም ይወደኛል ጌታ አልጠላኝም
አዝ፡፡፡፡
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 4
በሕይወቴ ሁሉ ፍፁም ለመራኝ
ክብርና ምስጋናን አቀርባለሁኝ

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ',
        lyrics_transliteration = 'CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 1
Bit’efabet enkwan altewegnm leka
Zarem lije bilo dagm yit’eragnal
Lekas alt’elagnm Geta yiwedegnal
CHORUS

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 2
Leslt’an lekbre biye sikdew
Legenzeb adlche ene biresaw
Leene yalew fiqr alqenesebgnm
Zarem yiwedegnal Geta alt’elagnm

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 3
Zarem yiwedegnal Geta alt’elagnm
CHORUS
Tadiya lezih fiqru lelelew wesen
Kech’nch’a meqabr lawet’agn enen

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 4
Behywete hulu fits’um lemeragn
Kibrna misganan aqerbalehugn

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka',
        updated_at = clock_timestamp()::text
    WHERE import_id = '235d4f7f-1997-48aa-ad9d-efc4cfa46455'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 1
ብጠፋበት እንኳን አልተወኝም ለካ
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል
ለካስ አልጠላኝም ጌታ ይወደኛል
አዝ፡፡፡፡

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 2
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ብረሳው
ለእኔ ያለው ፍቅር አልቀነሰብኝም
ዛሬም ይወደኛል ጌታ አልጠላኝም

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 3
ዛሬም ይወደኛል ጌታ አልጠላኝም
አዝ፡፡፡፡
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 4
በሕይወቴ ሁሉ ፍፁም ለመራኝ
ክብርና ምስጋናን አቀርባለሁኝ

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '235d4f7f-1997-48aa-ad9d-efc4cfa46455'::uuid, 'altewegnm-zemarit-fasika-mekonen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dingl-enate-ney ("Dingl Enate Ney")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a32531f4-49ab-4a1a-a273-b245ebfc2722'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 1
በሀዘን በሰቆቃ ጉልበቴ ደቆ
በረከት አልባ ሆኜ እንዳልከፋ
ድረሽልኝ እናቴ ነይ የእኔ ተስፋ
ብቸኝነት ክፉ ነው አንገት ያስደፋል

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 2
ጭንቀትን አባብሶ ለክፉ ይሰጣል
አንቺ ከጎኔ ካለሽ አልሸነፍም
ለዚህ ዓለም ሞኝነት እጄን አልሰጥም
እንኳን ለደካማው ሰው ለእኔ ለባሪያሽ

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 3
ለዓለም ይተርፋል ፀሎት ልመናሽ
በዚያ በፍርድ ሰዓት ጥላ ሁኚኝ
ክፉ ግብሬን መዝኖ እንዳያቀለኝ
እረፍዶብኛል ጉዞው የሠርጉ ቤት

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 4
ሙሽራው ሊገባ ነው ሳልይዝ መብራት
አፍጥኚኝ እናት ዓለም ለመልካም ሥራ
የእሳት ሲሳይ እንዳልሆን ድንግል አደራ

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 1
Behezen beseqoqa gulbete deqo
Bereket alba hogne endalkefa
Direshlgn enate ney yeene tesfa
Bichegnnet kifu new anget yasdefal

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 2
Ch’nqetn ababso lekfu yiset’al
Anchi kegone kalesh alshenefm
Lezih alem mognnet ejen alset’m
Enkwan ledekamaw sew leene lebariyash

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 3
Lealem yiterfal ts’elot limenash
Beziya befrd seat t’la hugnign
Kifu gibren mezno endayaqelegn
Erefdobgnal guzow yesergu bet

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 4
Mushraw ligeba new salyz mebrat
Aft’gnign enat alem lemelkam sira
Yeesat sisay endalhon Dingil adera

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 1
በሀዘን በሰቆቃ ጉልበቴ ደቆ
በረከት አልባ ሆኜ እንዳልከፋ
ድረሽልኝ እናቴ ነይ የእኔ ተስፋ
ብቸኝነት ክፉ ነው አንገት ያስደፋል

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 2
ጭንቀትን አባብሶ ለክፉ ይሰጣል
አንቺ ከጎኔ ካለሽ አልሸነፍም
ለዚህ ዓለም ሞኝነት እጄን አልሰጥም
እንኳን ለደካማው ሰው ለእኔ ለባሪያሽ

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 3
ለዓለም ይተርፋል ፀሎት ልመናሽ
በዚያ በፍርድ ሰዓት ጥላ ሁኚኝ
ክፉ ግብሬን መዝኖ እንዳያቀለኝ
እረፍዶብኛል ጉዞው የሠርጉ ቤት

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 4
ሙሽራው ሊገባ ነው ሳልይዝ መብራት
አፍጥኚኝ እናት ዓለም ለመልካም ሥራ
የእሳት ሲሳይ እንዳልሆን ድንግል አደራ

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ',
        lyrics_transliteration = 'CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 1
Behezen beseqoqa gulbete deqo
Bereket alba hogne endalkefa
Direshlgn enate ney yeene tesfa
Bichegnnet kifu new anget yasdefal

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 2
Ch’nqetn ababso lekfu yiset’al
Anchi kegone kalesh alshenefm
Lezih alem mognnet ejen alset’m
Enkwan ledekamaw sew leene lebariyash

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 3
Lealem yiterfal ts’elot limenash
Beziya befrd seat t’la hugnign
Kifu gibren mezno endayaqelegn
Erefdobgnal guzow yesergu bet

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo

VERSE 4
Mushraw ligeba new salyz mebrat
Aft’gnign enat alem lemelkam sira
Yeesat sisay endalhon Dingil adera

CHORUS
Dingil enate ney direshlgn
Wegen yelegnm qerbo yemits’nanagn
Keat’egebe hugnna alehu beygn
Yiqoylgnal yalkut keeje lay alqo',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a32531f4-49ab-4a1a-a273-b245ebfc2722'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 1
በሀዘን በሰቆቃ ጉልበቴ ደቆ
በረከት አልባ ሆኜ እንዳልከፋ
ድረሽልኝ እናቴ ነይ የእኔ ተስፋ
ብቸኝነት ክፉ ነው አንገት ያስደፋል

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 2
ጭንቀትን አባብሶ ለክፉ ይሰጣል
አንቺ ከጎኔ ካለሽ አልሸነፍም
ለዚህ ዓለም ሞኝነት እጄን አልሰጥም
እንኳን ለደካማው ሰው ለእኔ ለባሪያሽ

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 3
ለዓለም ይተርፋል ፀሎት ልመናሽ
በዚያ በፍርድ ሰዓት ጥላ ሁኚኝ
ክፉ ግብሬን መዝኖ እንዳያቀለኝ
እረፍዶብኛል ጉዞው የሠርጉ ቤት

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ

VERSE 4
ሙሽራው ሊገባ ነው ሳልይዝ መብራት
አፍጥኚኝ እናት ዓለም ለመልካም ሥራ
የእሳት ሲሳይ እንዳልሆን ድንግል አደራ

CHORUS
ድንግል እናቴ ነይ ድረሽልኝ
ወገን የለኝም ቀርቦ የሚጽናናኝ
ከአጠገቤ ሁኝና አለሁ በይኝ
ይቆይልኛል ያልኩት ከእጄ ላይ አልቆ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a32531f4-49ab-4a1a-a273-b245ebfc2722'::uuid, 'dingl-enate-ney', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bebetelihem-tewelide ("Bebetelihem Tewelide")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3a014913-64b4-4fd1-b228-97148f0dbed6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል

VERSE 1
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል

CHORUS
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel

VERSE 1
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel

CHORUS
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል

VERSE 1
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል

CHORUS
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል',
        lyrics_transliteration = 'CHORUS
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel

VERSE 1
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel

CHORUS
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3a014913-64b4-4fd1-b228-97148f0dbed6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል

VERSE 1
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል

CHORUS
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3a014913-64b4-4fd1-b228-97148f0dbed6'::uuid, 'bebetelihem-tewelide', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- libonaye-yawita ("Libonaye Yawita")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ac30a919-75c7-4e4e-87d8-7b121b24d0a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 1
ስላንቺ የሚነገር አለን ድንቅ ነገር/2/
የነቢያት ድንግል የአበው ምሳሌ
እናቴ እልሻለሁ ቢበዛም በደሌ
ከቅዱሳን ሁሉ ያንቺ ክብር ይበልጣል

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 2
አምላክን ልጄ ነው ማንስ ብሎት ያውቃል
ሄዋን ባትታዘዝ ለእግዚአብሔር ቃል
ሞትና መርገሙ በዓለም ገብቷል
የመላኩን ብስራት በእምነት ብትሰሚ

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 3
ሞገስን ተቀበልሽ በቀኙ እንድትቆሚ
ፍቅርሽ ጉልበት አለው ባህሩን ያሻግራል
ልመናሽ ፅኑ ነው ግዳጅ ይፈፅማል
ስለዚህ ድንግል ሆይ እንወድሻለን

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 4
ስምሽን ለልጅ ልጅ እንዘክራለን
ቀድሞም አልነበረም ወደፊትም አይኖር
ከፍጥረታት ሁሉ በሰማይ በምድር
ከእግዚአብሔር በታች ዛሬም ተሞሸራ

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 5
ድንግል ትታያለች ከከበሩት ከብራ
ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ
┈┈┈┈◉❖◉┈┈┈
@Yemezmurgtm

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 6
┈┈┈┈◉❖◉┈┈┈

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 1
Silanchi yemineger alen dinq neger (2)
Yenebiyat Dingil yeabew misale
Enate elshalehu bibezam bedele
Keqdusan hulu yanchi kibir yibelt’al

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 2
Amlakn lije new mans bilot yawqal
Hewan battazez leEgziabher qal
Motna mergemu bealem gebtwal
Yemelakun bisrat beemnet bitsemi

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 3
Mogesn teqebelsh beqegnu endtqomi
Fiqrsh gulbet alew bahrun yashagral
Limenash ts’nu new gidaj yifets’mal
Silezih Dingil hoy enwedshalen

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 4
Simshn lelj lij enzekralen
Qedmom alneberem wedefitm aynor
Keft’retat hulu besemay bemdr
Keegziabher betach zarem temoshera

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 5
Dingil titayalech kekeberut kebra
Liqe mezemran tewodros yosef
┈┈┈┈◉❖◉┈┈┈
@Yemezmurgtm

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 6
┈┈┈┈◉❖◉┈┈┈

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 1
ስላንቺ የሚነገር አለን ድንቅ ነገር/2/
የነቢያት ድንግል የአበው ምሳሌ
እናቴ እልሻለሁ ቢበዛም በደሌ
ከቅዱሳን ሁሉ ያንቺ ክብር ይበልጣል

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 2
አምላክን ልጄ ነው ማንስ ብሎት ያውቃል
ሄዋን ባትታዘዝ ለእግዚአብሔር ቃል
ሞትና መርገሙ በዓለም ገብቷል
የመላኩን ብስራት በእምነት ብትሰሚ

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 3
ሞገስን ተቀበልሽ በቀኙ እንድትቆሚ
ፍቅርሽ ጉልበት አለው ባህሩን ያሻግራል
ልመናሽ ፅኑ ነው ግዳጅ ይፈፅማል
ስለዚህ ድንግል ሆይ እንወድሻለን

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 4
ስምሽን ለልጅ ልጅ እንዘክራለን
ቀድሞም አልነበረም ወደፊትም አይኖር
ከፍጥረታት ሁሉ በሰማይ በምድር
ከእግዚአብሔር በታች ዛሬም ተሞሸራ

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 5
ድንግል ትታያለች ከከበሩት ከብራ
ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ
┈┈┈┈◉❖◉┈┈┈
@Yemezmurgtm

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 6
┈┈┈┈◉❖◉┈┈┈

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር',
        lyrics_transliteration = 'CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 1
Silanchi yemineger alen dinq neger (2)
Yenebiyat Dingil yeabew misale
Enate elshalehu bibezam bedele
Keqdusan hulu yanchi kibir yibelt’al

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 2
Amlakn lije new mans bilot yawqal
Hewan battazez leEgziabher qal
Motna mergemu bealem gebtwal
Yemelakun bisrat beemnet bitsemi

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 3
Mogesn teqebelsh beqegnu endtqomi
Fiqrsh gulbet alew bahrun yashagral
Limenash ts’nu new gidaj yifets’mal
Silezih Dingil hoy enwedshalen

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 4
Simshn lelj lij enzekralen
Qedmom alneberem wedefitm aynor
Keft’retat hulu besemay bemdr
Keegziabher betach zarem temoshera

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 5
Dingil titayalech kekeberut kebra
Liqe mezemran tewodros yosef
┈┈┈┈◉❖◉┈┈┈
@Yemezmurgtm

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 6
┈┈┈┈◉❖◉┈┈┈

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ac30a919-75c7-4e4e-87d8-7b121b24d0a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 1
ስላንቺ የሚነገር አለን ድንቅ ነገር/2/
የነቢያት ድንግል የአበው ምሳሌ
እናቴ እልሻለሁ ቢበዛም በደሌ
ከቅዱሳን ሁሉ ያንቺ ክብር ይበልጣል

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 2
አምላክን ልጄ ነው ማንስ ብሎት ያውቃል
ሄዋን ባትታዘዝ ለእግዚአብሔር ቃል
ሞትና መርገሙ በዓለም ገብቷል
የመላኩን ብስራት በእምነት ብትሰሚ

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 3
ሞገስን ተቀበልሽ በቀኙ እንድትቆሚ
ፍቅርሽ ጉልበት አለው ባህሩን ያሻግራል
ልመናሽ ፅኑ ነው ግዳጅ ይፈፅማል
ስለዚህ ድንግል ሆይ እንወድሻለን

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 4
ስምሽን ለልጅ ልጅ እንዘክራለን
ቀድሞም አልነበረም ወደፊትም አይኖር
ከፍጥረታት ሁሉ በሰማይ በምድር
ከእግዚአብሔር በታች ዛሬም ተሞሸራ

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 5
ድንግል ትታያለች ከከበሩት ከብራ
ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ
┈┈┈┈◉❖◉┈┈┈
@Yemezmurgtm

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 6
┈┈┈┈◉❖◉┈┈┈

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ac30a919-75c7-4e4e-87d8-7b121b24d0a1'::uuid, 'libonaye-yawita', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hailemichel-ethiopian-orthodox-mezmure ("Hailemichel Ethiopian Orthodox mezmure")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3b8ec531-ebc9-40ea-937d-9ed5d433d6d9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 1
የተፅናናንብሽ የድሆች ማረፊያ
ነፋስ ውቅያኖሱን ወጀቡን፣ መቅዘፊያ
ወርሰናል ስምሽን፣ ከወርቁ መዝገብ ላይ
ወለድሽልን ድንግል የህይወትን ፀሃይ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 2
ቀስተ ደመናዬ ሆነሽ ምልክቴ
አለሁ እስከ ዛሬ ባንቺው በእመቤቴ
ልጅሽን አምኜ ምን ይጎድልብኛል
ያስጨነቀኝ ሁሉ ይታዘዝልኛል

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 3
ተከቧል ተራራው በብሩህ ደመና
የአብ ልጅ ክርስቶስ ባንቺ ወርዷልና
ይባቤ ምስጋና አፋችን ይሞላ
መቅደስ አላየኝም ድንግል ካንቺ ሌላ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 4
የከሳሼኝ ጉልበት ፅናቱን ሰብረሻል
የአዳም ልጅ ከሲኦል ከሞት ወቶብሻል
ጣፈጣት ለነፍሴ የማህፀንሽ ፍሬ
ስጠራሽ እኖራለሁ በያሬድ ዝማሬ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 1
Yetets’nananbsh yedhoch marefiya
Nefas wiqyanosun wejebun, meqzefiya
Wersenal simshn, kewerqu mezgeb lay
Weledshln Dingil yehywetn ts’ehay

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 2
Qeste demenaye honesh milkte
Alehu eske zare banchiw beemebete
Lijshn amgne min yigodlbgnal
Yasch’eneqegn hulu yitazezlgnal

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 3
Tekebwal teraraw bebruh demena
Yeab lij Kristos banchi werdwalna
Yibabe misgana afachn yimola
Meqdes alayegnm Dingil kanchi lela

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 4
Yekesashegn gulbet ts’natun sebreshal
Yeadam lij kesiol kemot wetobshal
T’afet’at lenefse yemahts’ensh fire
Sit’erash enoralehu beyared zimare

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 1
የተፅናናንብሽ የድሆች ማረፊያ
ነፋስ ውቅያኖሱን ወጀቡን፣ መቅዘፊያ
ወርሰናል ስምሽን፣ ከወርቁ መዝገብ ላይ
ወለድሽልን ድንግል የህይወትን ፀሃይ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 2
ቀስተ ደመናዬ ሆነሽ ምልክቴ
አለሁ እስከ ዛሬ ባንቺው በእመቤቴ
ልጅሽን አምኜ ምን ይጎድልብኛል
ያስጨነቀኝ ሁሉ ይታዘዝልኛል

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 3
ተከቧል ተራራው በብሩህ ደመና
የአብ ልጅ ክርስቶስ ባንቺ ወርዷልና
ይባቤ ምስጋና አፋችን ይሞላ
መቅደስ አላየኝም ድንግል ካንቺ ሌላ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 4
የከሳሼኝ ጉልበት ፅናቱን ሰብረሻል
የአዳም ልጅ ከሲኦል ከሞት ወቶብሻል
ጣፈጣት ለነፍሴ የማህፀንሽ ፍሬ
ስጠራሽ እኖራለሁ በያሬድ ዝማሬ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ',
        lyrics_transliteration = 'CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 1
Yetets’nananbsh yedhoch marefiya
Nefas wiqyanosun wejebun, meqzefiya
Wersenal simshn, kewerqu mezgeb lay
Weledshln Dingil yehywetn ts’ehay

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 2
Qeste demenaye honesh milkte
Alehu eske zare banchiw beemebete
Lijshn amgne min yigodlbgnal
Yasch’eneqegn hulu yitazezlgnal

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 3
Tekebwal teraraw bebruh demena
Yeab lij Kristos banchi werdwalna
Yibabe misgana afachn yimola
Meqdes alayegnm Dingil kanchi lela

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre

VERSE 4
Yekesashegn gulbet ts’natun sebreshal
Yeadam lij kesiol kemot wetobshal
T’afet’at lenefse yemahts’ensh fire
Sit’erash enoralehu beyared zimare

CHORUS
Tatmeshal besew libona
Yedekamoch mirkuz neshna
Lamesgnsh beadis zimare
Emebete gena new fiqre',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3b8ec531-ebc9-40ea-937d-9ed5d433d6d9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 1
የተፅናናንብሽ የድሆች ማረፊያ
ነፋስ ውቅያኖሱን ወጀቡን፣ መቅዘፊያ
ወርሰናል ስምሽን፣ ከወርቁ መዝገብ ላይ
ወለድሽልን ድንግል የህይወትን ፀሃይ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 2
ቀስተ ደመናዬ ሆነሽ ምልክቴ
አለሁ እስከ ዛሬ ባንቺው በእመቤቴ
ልጅሽን አምኜ ምን ይጎድልብኛል
ያስጨነቀኝ ሁሉ ይታዘዝልኛል

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 3
ተከቧል ተራራው በብሩህ ደመና
የአብ ልጅ ክርስቶስ ባንቺ ወርዷልና
ይባቤ ምስጋና አፋችን ይሞላ
መቅደስ አላየኝም ድንግል ካንቺ ሌላ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ

VERSE 4
የከሳሼኝ ጉልበት ፅናቱን ሰብረሻል
የአዳም ልጅ ከሲኦል ከሞት ወቶብሻል
ጣፈጣት ለነፍሴ የማህፀንሽ ፍሬ
ስጠራሽ እኖራለሁ በያሬድ ዝማሬ

CHORUS
ታትመሻል በሰው ልቦና
የደካሞች ምርኩዝ ነሽና
ላመስግንሽ በአዲስ ዝማሬ
እመቤቴ ገና ነው ፍቅሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3b8ec531-ebc9-40ea-937d-9ed5d433d6d9'::uuid, 'hailemichel-ethiopian-orthodox-mezmure', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sobe-semaene-zenake ("Sobe Semaene Zenake")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3cae0ddb-c4ed-4e0f-9ef0-38895dfe3054'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 1
ልጅም ተሰጠን ሕፃን ተወለደ
አስጨናቂዉ ዘመን በእርሱ ተወገደ
ሰዉና መዋእክት በአንድነት ዘመሩ
የእግዚአብሔርን ክብር ለዓለም መሰከሩ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 2
ምስጋና በሰማይ ለእግዚአብሔር ይሁን
ሰላም ለሰዉ ልጆች በምድር ይስፈን
እናቲቱ ሰማይ ሕፃኗ ፀሐይ
እጅግ ደስ ይለናል ይህንን ስናይ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 3
በኮከብ ተመርተዉ ነገስታት ማለዱ
ለሕፃኑ ንጉስ በፍቅር ሰገዱ
ድንቅ መካር ኃያል የሰላም አለቃ
ጌታ ሆይ በስምህ ግዞቱ አበቃ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 4
ሰላምን የሚሠጥ አልፋና ኦሜጋ
የእስራኤል ንጉስ ተገልጦአል በሥጋ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 1
Lijm teset’en hits’an tewelede
Asch’enaqiwu zemen beersu tewegede
Sewuna mewaekt beandnet zemeru
Yeegziabhern kibir lealem mesekeru

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 2
Misgana besemay leEgziabher yihun
Selam lesewu lijoch bemdr yisfen
Enatitu semay hits’anwa ts’ehey
Ejg des yilenal yihnn sinay

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 3
Bekokeb temertewu negestat maledu
Lehts’anu nigus befqr segedu
Dinq mekar hayal yeselam aleqa
Geta hoy besmh gizotu abeqa

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 4
Selamn yemiset’ alfana omega
Yeesrael nigus tegelt’oal besga

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 1
ልጅም ተሰጠን ሕፃን ተወለደ
አስጨናቂዉ ዘመን በእርሱ ተወገደ
ሰዉና መዋእክት በአንድነት ዘመሩ
የእግዚአብሔርን ክብር ለዓለም መሰከሩ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 2
ምስጋና በሰማይ ለእግዚአብሔር ይሁን
ሰላም ለሰዉ ልጆች በምድር ይስፈን
እናቲቱ ሰማይ ሕፃኗ ፀሐይ
እጅግ ደስ ይለናል ይህንን ስናይ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 3
በኮከብ ተመርተዉ ነገስታት ማለዱ
ለሕፃኑ ንጉስ በፍቅር ሰገዱ
ድንቅ መካር ኃያል የሰላም አለቃ
ጌታ ሆይ በስምህ ግዞቱ አበቃ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 4
ሰላምን የሚሠጥ አልፋና ኦሜጋ
የእስራኤል ንጉስ ተገልጦአል በሥጋ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ',
        lyrics_transliteration = 'CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 1
Lijm teset’en hits’an tewelede
Asch’enaqiwu zemen beersu tewegede
Sewuna mewaekt beandnet zemeru
Yeegziabhern kibir lealem mesekeru

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 2
Misgana besemay leEgziabher yihun
Selam lesewu lijoch bemdr yisfen
Enatitu semay hits’anwa ts’ehey
Ejg des yilenal yihnn sinay

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 3
Bekokeb temertewu negestat maledu
Lehts’anu nigus befqr segedu
Dinq mekar hayal yeselam aleqa
Geta hoy besmh gizotu abeqa

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema

VERSE 4
Selamn yemiset’ alfana omega
Yeesrael nigus tegelt’oal besga

CHORUS
Sobe semaene zenake mets’aene hebeke
Mets’aene (4×)
Anch betelhem yedawit ketema
Yemsrach qalu bean bet tesema',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3cae0ddb-c4ed-4e0f-9ef0-38895dfe3054'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 1
ልጅም ተሰጠን ሕፃን ተወለደ
አስጨናቂዉ ዘመን በእርሱ ተወገደ
ሰዉና መዋእክት በአንድነት ዘመሩ
የእግዚአብሔርን ክብር ለዓለም መሰከሩ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 2
ምስጋና በሰማይ ለእግዚአብሔር ይሁን
ሰላም ለሰዉ ልጆች በምድር ይስፈን
እናቲቱ ሰማይ ሕፃኗ ፀሐይ
እጅግ ደስ ይለናል ይህንን ስናይ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 3
በኮከብ ተመርተዉ ነገስታት ማለዱ
ለሕፃኑ ንጉስ በፍቅር ሰገዱ
ድንቅ መካር ኃያል የሰላም አለቃ
ጌታ ሆይ በስምህ ግዞቱ አበቃ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ

VERSE 4
ሰላምን የሚሠጥ አልፋና ኦሜጋ
የእስራኤል ንጉስ ተገልጦአል በሥጋ

CHORUS
ሶበ ሰማዕነ ዜናከ መጻእነ ኀቤከ
መጻእነ (4×)
አንች ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአን ቤት ተሰማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3cae0ddb-c4ed-4e0f-9ef0-38895dfe3054'::uuid, 'sobe-semaene-zenake', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beberet-yetegnaw ("Beberet Yetegnaw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f718c9c7-ea70-4f78-8c69-640df74060ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በበረት የተኛው ቅዱሱ ሕፃን
ልብስም አልለበሰም ነበረ ዕርቃኑን(፪×)
በጨርቅ ጠቅልላ ስታቅፈው እናቱ
ትንፋሽ አለበሱት ከብበው እንስሳቱ(፪×)

VERSE 1
እሰይ የምሥራች ሀሌ ሀሌ ሉያ
ጌታ ተወለደ ሊሆነን አርአያ(፪×)

CHORUS
በበረት የተኛው ቅዱሱ ሕፃን
ልብስም አልለበሰም ነበረ ዕርቃኑን(፪×)
በጨርቅ ጠቅልላ ስታቅፈው እናቱ
ትንፋሽ አለበሱት ከብበው እንስሳቱ(፪×)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beberet yetegnaw qidusu hits’an
Libsm allebesem nebere erqanun(2×)
Bech’erq t’eqlla sitaqfew enatu
Tinfash alebesut kebbew enssatu(2×)

VERSE 1
Esey yemsrach hele hele luya
Geta tewelede lihonen araya(2×)

CHORUS
Beberet yetegnaw qidusu hits’an
Libsm allebesem nebere erqanun(2×)
Bech’erq t’eqlla sitaqfew enatu
Tinfash alebesut kebbew enssatu(2×)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በበረት የተኛው ቅዱሱ ሕፃን
ልብስም አልለበሰም ነበረ ዕርቃኑን(፪×)
በጨርቅ ጠቅልላ ስታቅፈው እናቱ
ትንፋሽ አለበሱት ከብበው እንስሳቱ(፪×)

VERSE 1
እሰይ የምሥራች ሀሌ ሀሌ ሉያ
ጌታ ተወለደ ሊሆነን አርአያ(፪×)

CHORUS
በበረት የተኛው ቅዱሱ ሕፃን
ልብስም አልለበሰም ነበረ ዕርቃኑን(፪×)
በጨርቅ ጠቅልላ ስታቅፈው እናቱ
ትንፋሽ አለበሱት ከብበው እንስሳቱ(፪×)',
        lyrics_transliteration = 'CHORUS
Beberet yetegnaw qidusu hits’an
Libsm allebesem nebere erqanun(2×)
Bech’erq t’eqlla sitaqfew enatu
Tinfash alebesut kebbew enssatu(2×)

VERSE 1
Esey yemsrach hele hele luya
Geta tewelede lihonen araya(2×)

CHORUS
Beberet yetegnaw qidusu hits’an
Libsm allebesem nebere erqanun(2×)
Bech’erq t’eqlla sitaqfew enatu
Tinfash alebesut kebbew enssatu(2×)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f718c9c7-ea70-4f78-8c69-640df74060ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በበረት የተኛው ቅዱሱ ሕፃን
ልብስም አልለበሰም ነበረ ዕርቃኑን(፪×)
በጨርቅ ጠቅልላ ስታቅፈው እናቱ
ትንፋሽ አለበሱት ከብበው እንስሳቱ(፪×)

VERSE 1
እሰይ የምሥራች ሀሌ ሀሌ ሉያ
ጌታ ተወለደ ሊሆነን አርአያ(፪×)

CHORUS
በበረት የተኛው ቅዱሱ ሕፃን
ልብስም አልለበሰም ነበረ ዕርቃኑን(፪×)
በጨርቅ ጠቅልላ ስታቅፈው እናቱ
ትንፋሽ አለበሱት ከብበው እንስሳቱ(፪×)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f718c9c7-ea70-4f78-8c69-640df74060ec'::uuid, 'beberet-yetegnaw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yante-lihun-deacon-bisrat-teshome ("Yante Lihun Deacon Bisrat Teshome")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1f38f9a7-d88b-4f8e-8a08-ce3fe6b51c60'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 1
እጠብቅሃለው አላጉረመርምም
መፃጉን አይቼ ከቶ አላማህም
ትመጣለህ ጌታ አታጥፍም ቃልህን
አትዘገይም አንተ ታውቃለህ ስራህን

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 2
ለይስሐቅ ስም ሆነው የሳራ ፈገግታ
ቤቷ ተከደነ በዘላለም ደስታ
ነገር ስትለውጥ ስትቀይር እንዲህ ነው
ውብ ታደርገዋለህ ሁሉንም በጊዜው

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 3
አባትነትህን ከዓለም ያስበለጡ
ምልክት ሳይሹ በእምነት ተለወጡ
ማድጋውን ሳይሆን ፍቅርህን እያዩ
መከራን ታግሰው ከፍ ብለው ታዩ

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 4
የኔ ያልኩት ነገር ከእጄ ቢበተን
ተስፋ ያደረኩት ሁሉ ከንቱ ቢሆን
እኔ አላማርርም ለአመፅ አልነሳ
አንተ የሰጠኽኝን አንተ ስትነሳ

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate

VERSE 1
Et’ebqhalew alaguremermm
Mets’agun ayche keto alamahm
Timet’aleh Geta atat’fm qalhn
Atzegeym ante tawqaleh sirahn

CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate

VERSE 2
Leysheq sim honew yesara fegegta
Betwa tekedene bezelalem desta
Neger sitlewt’ sitqeyr endih new
Wib tadergewaleh hulunm begizew

CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate

VERSE 3
Abatnethn kealem yasbelet’u
Milkt sayshu beemnet telewet’u
Madgawn sayhon fiqrhn eyayu
Mekeran tagsew kef bilew tayu

CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate

VERSE 4
Yene yalkut neger keeje bibeten
Tesfa yaderekut hulu kentu bihon
Ene alamarrm leamets’ alnesa
Ante yeset’eኽgnn ante sitnesa

CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 1
እጠብቅሃለው አላጉረመርምም
መፃጉን አይቼ ከቶ አላማህም
ትመጣለህ ጌታ አታጥፍም ቃልህን
አትዘገይም አንተ ታውቃለህ ስራህን

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 2
ለይስሐቅ ስም ሆነው የሳራ ፈገግታ
ቤቷ ተከደነ በዘላለም ደስታ
ነገር ስትለውጥ ስትቀይር እንዲህ ነው
ውብ ታደርገዋለህ ሁሉንም በጊዜው

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 3
አባትነትህን ከዓለም ያስበለጡ
ምልክት ሳይሹ በእምነት ተለወጡ
ማድጋውን ሳይሆን ፍቅርህን እያዩ
መከራን ታግሰው ከፍ ብለው ታዩ

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 4
የኔ ያልኩት ነገር ከእጄ ቢበተን
ተስፋ ያደረኩት ሁሉ ከንቱ ቢሆን
እኔ አላማርርም ለአመፅ አልነሳ
አንተ የሰጠኽኝን አንተ ስትነሳ

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ',
        lyrics_transliteration = 'CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate

VERSE 1
Et’ebqhalew alaguremermm
Mets’agun ayche keto alamahm
Timet’aleh Geta atat’fm qalhn
Atzegeym ante tawqaleh sirahn

CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate

VERSE 2
Leysheq sim honew yesara fegegta
Betwa tekedene bezelalem desta
Neger sitlewt’ sitqeyr endih new
Wib tadergewaleh hulunm begizew

CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate

VERSE 3
Abatnethn kealem yasbelet’u
Milkt sayshu beemnet telewet’u
Madgawn sayhon fiqrhn eyayu
Mekeran tagsew kef bilew tayu

CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate

VERSE 4
Yene yalkut neger keeje bibeten
Tesfa yaderekut hulu kentu bihon
Ene alamarrm leamets’ alnesa
Ante yeset’eኽgnn ante sitnesa

CHORUS
Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1f38f9a7-d88b-4f8e-8a08-ce3fe6b51c60'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 1
እጠብቅሃለው አላጉረመርምም
መፃጉን አይቼ ከቶ አላማህም
ትመጣለህ ጌታ አታጥፍም ቃልህን
አትዘገይም አንተ ታውቃለህ ስራህን

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 2
ለይስሐቅ ስም ሆነው የሳራ ፈገግታ
ቤቷ ተከደነ በዘላለም ደስታ
ነገር ስትለውጥ ስትቀይር እንዲህ ነው
ውብ ታደርገዋለህ ሁሉንም በጊዜው

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 3
አባትነትህን ከዓለም ያስበለጡ
ምልክት ሳይሹ በእምነት ተለወጡ
ማድጋውን ሳይሆን ፍቅርህን እያዩ
መከራን ታግሰው ከፍ ብለው ታዩ

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 4
የኔ ያልኩት ነገር ከእጄ ቢበተን
ተስፋ ያደረኩት ሁሉ ከንቱ ቢሆን
እኔ አላማርርም ለአመፅ አልነሳ
አንተ የሰጠኽኝን አንተ ስትነሳ

CHORUS
ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1f38f9a7-d88b-4f8e-8a08-ce3fe6b51c60'::uuid, 'yante-lihun-deacon-bisrat-teshome', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bo-gize-lekulu ("Bo Gize Lekulu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a8cf3360-93e4-49fb-a994-ced43d4b38e3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 1
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 2
የደስታ ምንጩ፣ ሳዝን መጽናኛዬ
በብርዱ ሙቀት፣ በሃሩሩ ጥላዬ
"ሞልቶልሃል" "ጎድሎብሃል" ብሎ
ፊቱ የማይለወጥ፣ ያኖረኝ የማይለወጥ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 3
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 4
በሚለወጥ ኑሮ፣ የማይለወጥ አምላክ
ዙሪያዬን አጥሮታል በጠባቂ መልአክ
ልጁ ነኝ እኔ፣ ከአብራኩ ክፋይ ነኝ
ከእስከሌለው ፍቅር ነው ታሪኩ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 5
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 6
የሰው ዘመን ሲያረጅ አያረጅ ዘመኑ
በማንም አይሻር ቋሚ ነው ስልጣኑ
ቢለዋወጥም የህይወት ገጽታ
ትላንትናም ዛሬም እርሱ ነው ጌታ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 7
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 8
በቁልቁለት ጉዞ ሰው ይሰጣል ጀርባ
እርሱ ግን አብሮኛል
የስኬት ፀሐይ መውጣቷ አይቀርም
በግርምት ይተካል የስንፍና ለዛ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 9
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 10
እግዚአብሔር ይመስገን፣ ሳለሁ በከፍታ
እግዚአብሔር ይመስገን፣ ሆኜ በዝቅታ
ለምሽት ጊዜ፣ ለንጋት ጊዜ ያለው
ጊዜን የሚያፈራርስ እግዚአብሔር ብቻ ነው

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 11
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 12
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 13
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 1
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 2
Yedesta minch’u, sazn mets’nagnaye
Bebrdu muqet, beharuru t’laye
"moltolhal" "godlobhal" bilo
Fitu yemaylewet’, yanoregn yemaylewet’

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 3
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 4
Bemilewet’ nuro, yemaylewet’ amlak
Zuriyayen at’rotal bet’ebaqi melak
Liju negn ene, keabraku kifay negn
Keeskelelew fiqr new tariku

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 5
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 6
Yesew zemen siyarej ayarej zemenu
Bemanm ayshar qwami new silt’anu
Bilewawet’m yehywet gets’ta
Tilantnam zarem ersu new Geta

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 7
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 8
Bequlqulet guzo sew yiset’al jerba
Ersu gin abrognal
Yesket ts’ehey mewt’atwa ayqerm
Begrmt yitekal yesnfna leza

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 9
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 10
Egziabher yimesgen, salehu bekefta
Egziabher yimesgen, hogne bezqta
Lemsht gize, lengat gize yalew
Gizen yemiyaferars Egziabher bicha new

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 11
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 12
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 13
Egziabher bicha kene gar yiqeral
Egziabher bicha kene gar yiqeral
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 1
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 2
የደስታ ምንጩ፣ ሳዝን መጽናኛዬ
በብርዱ ሙቀት፣ በሃሩሩ ጥላዬ
"ሞልቶልሃል" "ጎድሎብሃል" ብሎ
ፊቱ የማይለወጥ፣ ያኖረኝ የማይለወጥ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 3
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 4
በሚለወጥ ኑሮ፣ የማይለወጥ አምላክ
ዙሪያዬን አጥሮታል በጠባቂ መልአክ
ልጁ ነኝ እኔ፣ ከአብራኩ ክፋይ ነኝ
ከእስከሌለው ፍቅር ነው ታሪኩ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 5
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 6
የሰው ዘመን ሲያረጅ አያረጅ ዘመኑ
በማንም አይሻር ቋሚ ነው ስልጣኑ
ቢለዋወጥም የህይወት ገጽታ
ትላንትናም ዛሬም እርሱ ነው ጌታ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 7
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 8
በቁልቁለት ጉዞ ሰው ይሰጣል ጀርባ
እርሱ ግን አብሮኛል
የስኬት ፀሐይ መውጣቷ አይቀርም
በግርምት ይተካል የስንፍና ለዛ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 9
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 10
እግዚአብሔር ይመስገን፣ ሳለሁ በከፍታ
እግዚአብሔር ይመስገን፣ ሆኜ በዝቅታ
ለምሽት ጊዜ፣ ለንጋት ጊዜ ያለው
ጊዜን የሚያፈራርስ እግዚአብሔር ብቻ ነው

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 11
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 12
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 13
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል',
        lyrics_transliteration = 'CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 1
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 2
Yedesta minch’u, sazn mets’nagnaye
Bebrdu muqet, beharuru t’laye
"moltolhal" "godlobhal" bilo
Fitu yemaylewet’, yanoregn yemaylewet’

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 3
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 4
Bemilewet’ nuro, yemaylewet’ amlak
Zuriyayen at’rotal bet’ebaqi melak
Liju negn ene, keabraku kifay negn
Keeskelelew fiqr new tariku

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 5
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 6
Yesew zemen siyarej ayarej zemenu
Bemanm ayshar qwami new silt’anu
Bilewawet’m yehywet gets’ta
Tilantnam zarem ersu new Geta

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 7
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 8
Bequlqulet guzo sew yiset’al jerba
Ersu gin abrognal
Yesket ts’ehey mewt’atwa ayqerm
Begrmt yitekal yesnfna leza

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 9
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 10
Egziabher yimesgen, salehu bekefta
Egziabher yimesgen, hogne bezqta
Lemsht gize, lengat gize yalew
Gizen yemiyaferars Egziabher bicha new

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 11
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 12
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 13
Egziabher bicha kene gar yiqeral
Egziabher bicha kene gar yiqeral
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a8cf3360-93e4-49fb-a994-ced43d4b38e3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 1
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 2
የደስታ ምንጩ፣ ሳዝን መጽናኛዬ
በብርዱ ሙቀት፣ በሃሩሩ ጥላዬ
"ሞልቶልሃል" "ጎድሎብሃል" ብሎ
ፊቱ የማይለወጥ፣ ያኖረኝ የማይለወጥ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 3
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 4
በሚለወጥ ኑሮ፣ የማይለወጥ አምላክ
ዙሪያዬን አጥሮታል በጠባቂ መልአክ
ልጁ ነኝ እኔ፣ ከአብራኩ ክፋይ ነኝ
ከእስከሌለው ፍቅር ነው ታሪኩ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 5
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 6
የሰው ዘመን ሲያረጅ አያረጅ ዘመኑ
በማንም አይሻር ቋሚ ነው ስልጣኑ
ቢለዋወጥም የህይወት ገጽታ
ትላንትናም ዛሬም እርሱ ነው ጌታ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 7
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 8
በቁልቁለት ጉዞ ሰው ይሰጣል ጀርባ
እርሱ ግን አብሮኛል
የስኬት ፀሐይ መውጣቷ አይቀርም
በግርምት ይተካል የስንፍና ለዛ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 9
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 10
እግዚአብሔር ይመስገን፣ ሳለሁ በከፍታ
እግዚአብሔር ይመስገን፣ ሆኜ በዝቅታ
ለምሽት ጊዜ፣ ለንጋት ጊዜ ያለው
ጊዜን የሚያፈራርስ እግዚአብሔር ብቻ ነው

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 11
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 12
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 13
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a8cf3360-93e4-49fb-a994-ced43d4b38e3'::uuid, 'bo-gize-lekulu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selam-leitiyopiya ("Selam Leitiyopiya")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2318ac5e-8fe2-4400-b86d-b18a09d57437'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 1
አቅናት ፈጣሪዋ ስርአት እንደገና
የሰቀለችሁን ታውርድ ያን በገና
ያቼ ዳቦ ምድር ያዘነች አዝመራ
እንዴት ስለችግር ስለረሃብ ታውራ ተመልከታት አምላክ ምህረትህ ይድረሳት ጩኸቷ ተሰምቶ በረከት አርሳት

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 2
የገዛ ውሀችን በዋጋ ገዝተናል
በራሳችን ምድር ባለእዳር ሆነናል
ትሁፊት ታሪካችን ባህሉም ተረሳ የሰዶምን ኃጢያት ምድራችን ተላብሳ
እንሆ እግሮቻችን ለስደት ተነሱ

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 3
የናቁት እርስቶች በደም ተወረሱ
አንተ ብቻ አብሰው የዓይናችን ለቅሶ ወድቀናል ከደጅ ሀዘናችን ብሶ

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 1
Aqnat fet’ariwa sirat endegena
Yeseqelechhun tawrd yan begena
Yache dabo midr yazenech azmera
Endet silechgr silerehab tawra temelketat amlak mihreth yidresat ch’uኸtwa tesemto bereket arsat

CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 2
Yegeza wihechn bewaga geztenal
Berasachn midr baleedar honenal
Tihufit tarikachn bahlum teresa yesedomn hat’iyat midrachn telabsa
Enho egrochachn lesdet tenesu

CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 3
Yenaqut erstoch bedem teweresu
Ante bicha absew yeaynachn leqso wedqenal kedej hezenachn biso

CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 1
አቅናት ፈጣሪዋ ስርአት እንደገና
የሰቀለችሁን ታውርድ ያን በገና
ያቼ ዳቦ ምድር ያዘነች አዝመራ
እንዴት ስለችግር ስለረሃብ ታውራ ተመልከታት አምላክ ምህረትህ ይድረሳት ጩኸቷ ተሰምቶ በረከት አርሳት

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 2
የገዛ ውሀችን በዋጋ ገዝተናል
በራሳችን ምድር ባለእዳር ሆነናል
ትሁፊት ታሪካችን ባህሉም ተረሳ የሰዶምን ኃጢያት ምድራችን ተላብሳ
እንሆ እግሮቻችን ለስደት ተነሱ

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 3
የናቁት እርስቶች በደም ተወረሱ
አንተ ብቻ አብሰው የዓይናችን ለቅሶ ወድቀናል ከደጅ ሀዘናችን ብሶ

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ',
        lyrics_transliteration = 'CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 1
Aqnat fet’ariwa sirat endegena
Yeseqelechhun tawrd yan begena
Yache dabo midr yazenech azmera
Endet silechgr silerehab tawra temelketat amlak mihreth yidresat ch’uኸtwa tesemto bereket arsat

CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 2
Yegeza wihechn bewaga geztenal
Berasachn midr baleedar honenal
Tihufit tarikachn bahlum teresa yesedomn hat’iyat midrachn telabsa
Enho egrochachn lesdet tenesu

CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare

VERSE 3
Yenaqut erstoch bedem teweresu
Ante bicha absew yeaynachn leqso wedqenal kedej hezenachn biso

CHORUS
Selam leityop’ya (2)
Selam lehegerachn (2)
Yilakln (3)cheru amlakachn
Ityop’ya tabets’ nebere yazmare aqt’ach’awn sitwal siratwa zare',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2318ac5e-8fe2-4400-b86d-b18a09d57437'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 1
አቅናት ፈጣሪዋ ስርአት እንደገና
የሰቀለችሁን ታውርድ ያን በገና
ያቼ ዳቦ ምድር ያዘነች አዝመራ
እንዴት ስለችግር ስለረሃብ ታውራ ተመልከታት አምላክ ምህረትህ ይድረሳት ጩኸቷ ተሰምቶ በረከት አርሳት

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 2
የገዛ ውሀችን በዋጋ ገዝተናል
በራሳችን ምድር ባለእዳር ሆነናል
ትሁፊት ታሪካችን ባህሉም ተረሳ የሰዶምን ኃጢያት ምድራችን ተላብሳ
እንሆ እግሮቻችን ለስደት ተነሱ

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ

VERSE 3
የናቁት እርስቶች በደም ተወረሱ
አንተ ብቻ አብሰው የዓይናችን ለቅሶ ወድቀናል ከደጅ ሀዘናችን ብሶ

CHORUS
ሰላም ለኢትዮጵያ /2/
ሰላም ለሀገራችን /2/
ይላክልን /3/ቸሩ አምላካችን
ኢትዮጵያ ታበጽ ነበረ ያዝማሬ አቅጣጫውን ስቷል ስርአቷ ዛሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2318ac5e-8fe2-4400-b86d-b18a09d57437'::uuid, 'selam-leitiyopiya', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeiyob-melisu ("Yeiyob Melisu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b9b92f4e-812b-461c-87bf-0e301d4ca41c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 1
እግዚአብሔር ይመስገን ነበር የኢዮብ መልሱ /2×/
በህይወት ገጥሞት የበረታ ፅልመት
በአንድ ቀን ሲነጠቅ ልጆች ና ንብረት
አካሉ በቁስል ተይዞ በጠና

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 2
ኢዮብ እንዴት ቻለ ለአምላኩ ምስጋና
በሰጠበት መንደር ሲቆም ለልመና
ሚስቱ ሙት ስትለው ጌታን እርገምና
የስንፍናን ነገር አየሰማም ጆሮዬ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 3
ይክሰኛል እርሱ ይችላል ጌታዬ
ቅን ነገር መናገር ለአፌ ከቸገረኝ
አምላኬ እንዳየያዝን ምነው ዝም ባልኩኝ
ልሳኔ እንዳይጠራ ሞትነና መከራ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 4
ለምስጋና ልቁም ነገን ዛሬ ልስራ
እግዚአብሔር ይመስገን ቢጎድልም ቢሞላ
ለአይኔ ሽፋሽፍት እንቅልፍ እንኳን ባጣም
ብዙ እንደ ነበረው ትላንትና ደጄ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 5
ክፉውንም ደግሞ ይቀበላል እጄ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 1
Egziabher yemesgen neber yeiyob melsu /2×/
Behywet get’mot yebereta ts’lmet
Beand qen sinet’eq lijoch na nibret
Akalu bequsl teyzo bet’ena

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 2
Iyob endet chale leamlaku misgana
Beset’ebet mender siqom lelmena
Mistu mut sitlew getan ergemna
Yesnfnan neger ayesemam joroye

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 3
Yiksegnal ersu yichlal Getaye
Qin neger menager leafe kechegeregn
Amlake endayeyazn minew zim balkugn
Lisane endayt’era motnena mekera

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 4
Lemsgana liqum negen zare lisra
Egziabher yemesgen bigodlm bimola
Leayne shfashft enqlf enkwan bat’am
Bizu ende neberew tilantna deje

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 5
Kifuwnm degmo yiqebelal eje

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 1
እግዚአብሔር ይመስገን ነበር የኢዮብ መልሱ /2×/
በህይወት ገጥሞት የበረታ ፅልመት
በአንድ ቀን ሲነጠቅ ልጆች ና ንብረት
አካሉ በቁስል ተይዞ በጠና

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 2
ኢዮብ እንዴት ቻለ ለአምላኩ ምስጋና
በሰጠበት መንደር ሲቆም ለልመና
ሚስቱ ሙት ስትለው ጌታን እርገምና
የስንፍናን ነገር አየሰማም ጆሮዬ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 3
ይክሰኛል እርሱ ይችላል ጌታዬ
ቅን ነገር መናገር ለአፌ ከቸገረኝ
አምላኬ እንዳየያዝን ምነው ዝም ባልኩኝ
ልሳኔ እንዳይጠራ ሞትነና መከራ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 4
ለምስጋና ልቁም ነገን ዛሬ ልስራ
እግዚአብሔር ይመስገን ቢጎድልም ቢሞላ
ለአይኔ ሽፋሽፍት እንቅልፍ እንኳን ባጣም
ብዙ እንደ ነበረው ትላንትና ደጄ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 5
ክፉውንም ደግሞ ይቀበላል እጄ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም',
        lyrics_transliteration = 'CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 1
Egziabher yemesgen neber yeiyob melsu /2×/
Behywet get’mot yebereta ts’lmet
Beand qen sinet’eq lijoch na nibret
Akalu bequsl teyzo bet’ena

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 2
Iyob endet chale leamlaku misgana
Beset’ebet mender siqom lelmena
Mistu mut sitlew getan ergemna
Yesnfnan neger ayesemam joroye

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 3
Yiksegnal ersu yichlal Getaye
Qin neger menager leafe kechegeregn
Amlake endayeyazn minew zim balkugn
Lisane endayt’era motnena mekera

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 4
Lemsgana liqum negen zare lisra
Egziabher yemesgen bigodlm bimola
Leayne shfashft enqlf enkwan bat’am
Bizu ende neberew tilantna deje

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 5
Kifuwnm degmo yiqebelal eje

CHORUS
Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b9b92f4e-812b-461c-87bf-0e301d4ca41c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 1
እግዚአብሔር ይመስገን ነበር የኢዮብ መልሱ /2×/
በህይወት ገጥሞት የበረታ ፅልመት
በአንድ ቀን ሲነጠቅ ልጆች ና ንብረት
አካሉ በቁስል ተይዞ በጠና

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 2
ኢዮብ እንዴት ቻለ ለአምላኩ ምስጋና
በሰጠበት መንደር ሲቆም ለልመና
ሚስቱ ሙት ስትለው ጌታን እርገምና
የስንፍናን ነገር አየሰማም ጆሮዬ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 3
ይክሰኛል እርሱ ይችላል ጌታዬ
ቅን ነገር መናገር ለአፌ ከቸገረኝ
አምላኬ እንዳየያዝን ምነው ዝም ባልኩኝ
ልሳኔ እንዳይጠራ ሞትነና መከራ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 4
ለምስጋና ልቁም ነገን ዛሬ ልስራ
እግዚአብሔር ይመስገን ቢጎድልም ቢሞላ
ለአይኔ ሽፋሽፍት እንቅልፍ እንኳን ባጣም
ብዙ እንደ ነበረው ትላንትና ደጄ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 5
ክፉውንም ደግሞ ይቀበላል እጄ

CHORUS
የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b9b92f4e-812b-461c-87bf-0e301d4ca41c'::uuid, 'yeiyob-melisu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amilaken-salifera ("Amilaken Salifera")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b6d9ff0a-e852-4526-8c20-46bc6f63812c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 1
ከትዕዛዙ ርቄ
ብታይ ባደባባይ
መች ሆንኩኝ አገልጋይ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 2
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ወንጌልን ተምሬ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 3
ማህተሙን አስሬ
ራሴን ከጣልኩኝ
ገና መች አመንኩኝ
ፆምን እየፆምኩኝ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 4
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 5
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ለቤቱ ክብር ቆሜ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 6
በብዙ ደክሜ
ከዘመትኩ ለኃጢአት
ጌታን አልሰማሁት
እርቅን የማልሰማ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 7
ከሆንኩኝ ደካማ
ካላወኩ ይቅርታ
የለኝም ስጦታ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 8
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ፆምን እየጾምኩኝ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 9
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
የእግዚአብሔርን ምህረት

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 10
አውጄ በሰው ፊት
ከክፉ ስራዬ
ካድኩት በኑሮዬ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 11
ሰውንም ሳላፈራ
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር (2)

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 1
Ketezazu riqe
Bitay badebabay
Mech honkugn agelgay
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 2
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Wengeln temre

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 3
Mahtemun asre
Rasen ket’alkugn
Gena mech amenkugn
Ts’omn eyets’omkugn

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 4
Fiqrn keresahugn
Yishalal bibela
Sewn kemt’ela
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 5
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Lebetu kibir qome

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 6
Bebzu dekme
Kezemetku lehat’iat
Getan alsemahut
Erqn yemalsema

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 7
Kehonkugn dekama
Kalaweku yiqrta
Yelegnm sit’ota
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 8
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Ts’omn eyets’omkugn

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 9
Fiqrn keresahugn
Yishalal bibela
Sewn kemt’ela
Yeegziabhern mihret

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 10
Awje besew fit
Kekfu siraye
Kadkut benuroye
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 11
Sewnm salafera
Yasalefkut zemen ejgun siyasafr (2)

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 1
ከትዕዛዙ ርቄ
ብታይ ባደባባይ
መች ሆንኩኝ አገልጋይ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 2
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ወንጌልን ተምሬ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 3
ማህተሙን አስሬ
ራሴን ከጣልኩኝ
ገና መች አመንኩኝ
ፆምን እየፆምኩኝ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 4
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 5
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ለቤቱ ክብር ቆሜ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 6
በብዙ ደክሜ
ከዘመትኩ ለኃጢአት
ጌታን አልሰማሁት
እርቅን የማልሰማ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 7
ከሆንኩኝ ደካማ
ካላወኩ ይቅርታ
የለኝም ስጦታ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 8
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ፆምን እየጾምኩኝ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 9
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
የእግዚአብሔርን ምህረት

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 10
አውጄ በሰው ፊት
ከክፉ ስራዬ
ካድኩት በኑሮዬ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 11
ሰውንም ሳላፈራ
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር (2)

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ',
        lyrics_transliteration = 'CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 1
Ketezazu riqe
Bitay badebabay
Mech honkugn agelgay
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 2
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Wengeln temre

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 3
Mahtemun asre
Rasen ket’alkugn
Gena mech amenkugn
Ts’omn eyets’omkugn

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 4
Fiqrn keresahugn
Yishalal bibela
Sewn kemt’ela
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 5
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Lebetu kibir qome

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 6
Bebzu dekme
Kezemetku lehat’iat
Getan alsemahut
Erqn yemalsema

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 7
Kehonkugn dekama
Kalaweku yiqrta
Yelegnm sit’ota
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 8
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Ts’omn eyets’omkugn

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 9
Fiqrn keresahugn
Yishalal bibela
Sewn kemt’ela
Yeegziabhern mihret

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 10
Awje besew fit
Kekfu siraye
Kadkut benuroye
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 11
Sewnm salafera
Yasalefkut zemen ejgun siyasafr (2)

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b6d9ff0a-e852-4526-8c20-46bc6f63812c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 1
ከትዕዛዙ ርቄ
ብታይ ባደባባይ
መች ሆንኩኝ አገልጋይ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 2
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ወንጌልን ተምሬ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 3
ማህተሙን አስሬ
ራሴን ከጣልኩኝ
ገና መች አመንኩኝ
ፆምን እየፆምኩኝ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 4
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 5
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ለቤቱ ክብር ቆሜ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 6
በብዙ ደክሜ
ከዘመትኩ ለኃጢአት
ጌታን አልሰማሁት
እርቅን የማልሰማ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 7
ከሆንኩኝ ደካማ
ካላወኩ ይቅርታ
የለኝም ስጦታ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 8
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ፆምን እየጾምኩኝ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 9
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
የእግዚአብሔርን ምህረት

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 10
አውጄ በሰው ፊት
ከክፉ ስራዬ
ካድኩት በኑሮዬ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 11
ሰውንም ሳላፈራ
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር (2)

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b6d9ff0a-e852-4526-8c20-46bc6f63812c'::uuid, 'amilaken-salifera', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zarem-alesh-belibe ("Zarem Alesh Belibe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '26ee52a7-d2d6-4ef2-a4e3-401a95057702'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 1
እደ ሀፃቴ ብዛት እደበደሌማ
የጥልቁ ሰንሰለት ሲያንሰኝ ነው ጨለማ
ግን ያንቺ ሆንኩና ሁሉንም አለፍኩት
ያንን የሞት ባህር በምልጃሽ ቀዘፍኩት

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 2
አዝማች""""""""
አርፏል ልቤ ባንቺ ባዛኝቷ ማርያም
ውስጤ እያፈሰሰ ፍቅር እና ሰላም
ህመሜን ቢያስረሳኝ የውዳሴሽ ቃና

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 3
እመቤቴ እላለሁ ዛሬም እንደገና
አዝማች"""""""""
እናታችን ፅዮን ሰው ሁሉ ይልሻል
ዳዋት በበገና ያመሰግንሻል

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 4
ያሴቦን ነገስታት ለክብርሽ ዘምሩ
የማትፈርሽ መቅደስ የእዛአብሄር ሀገሩ
አዝማች"""""""""""
እጅግ ብዙ ነገር አድርገሽልኛል

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 5
ይቅር ባዩም ልጅሽ በፍቅር አይቶኛል
እኔስ እኖራለሁ ድንግል ባንቺ ጥላ
ጨለማን አላይም ከእንግዲህ በኋላ

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 1
Ede hets’ate bizat edebedelema
Yet’lqu senselet siyansegn new ch’elema
Gin yanchi honkuna hulunm alefkut
Yann yemot bahr bemljash qezefkut

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 2
CHORUS
Arfwal libe banchi bazagntwa Maryam
Wist’e eyafesese fiqr ena selam
Himemen biyasresagn yewdasesh qana

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 3
Emebete elalehu zarem endegena
CHORUS
Enatachn ts’yon sew hulu yilshal
Dawat bebegena yamesegnshal

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 4
Yasebon negestat lekbrsh zemru
Yematfersh meqdes yeezaabher hegeru
CHORUS
Ejg bizu neger adrgeshlgnal

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 5
Yiqr bayum lijsh befqr aytognal
Enes enoralehu Dingil banchi t’la
Ch’eleman alaym keengdih behwala

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 1
እደ ሀፃቴ ብዛት እደበደሌማ
የጥልቁ ሰንሰለት ሲያንሰኝ ነው ጨለማ
ግን ያንቺ ሆንኩና ሁሉንም አለፍኩት
ያንን የሞት ባህር በምልጃሽ ቀዘፍኩት

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 2
አዝማች""""""""
አርፏል ልቤ ባንቺ ባዛኝቷ ማርያም
ውስጤ እያፈሰሰ ፍቅር እና ሰላም
ህመሜን ቢያስረሳኝ የውዳሴሽ ቃና

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 3
እመቤቴ እላለሁ ዛሬም እንደገና
አዝማች"""""""""
እናታችን ፅዮን ሰው ሁሉ ይልሻል
ዳዋት በበገና ያመሰግንሻል

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 4
ያሴቦን ነገስታት ለክብርሽ ዘምሩ
የማትፈርሽ መቅደስ የእዛአብሄር ሀገሩ
አዝማች"""""""""""
እጅግ ብዙ ነገር አድርገሽልኛል

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 5
ይቅር ባዩም ልጅሽ በፍቅር አይቶኛል
እኔስ እኖራለሁ ድንግል ባንቺ ጥላ
ጨለማን አላይም ከእንግዲህ በኋላ

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""',
        lyrics_transliteration = 'CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 1
Ede hets’ate bizat edebedelema
Yet’lqu senselet siyansegn new ch’elema
Gin yanchi honkuna hulunm alefkut
Yann yemot bahr bemljash qezefkut

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 2
CHORUS
Arfwal libe banchi bazagntwa Maryam
Wist’e eyafesese fiqr ena selam
Himemen biyasresagn yewdasesh qana

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 3
Emebete elalehu zarem endegena
CHORUS
Enatachn ts’yon sew hulu yilshal
Dawat bebegena yamesegnshal

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 4
Yasebon negestat lekbrsh zemru
Yematfersh meqdes yeezaabher hegeru
CHORUS
Ejg bizu neger adrgeshlgnal

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 5
Yiqr bayum lijsh befqr aytognal
Enes enoralehu Dingil banchi t’la
Ch’eleman alaym keengdih behwala

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS',
        updated_at = clock_timestamp()::text
    WHERE import_id = '26ee52a7-d2d6-4ef2-a4e3-401a95057702'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 1
እደ ሀፃቴ ብዛት እደበደሌማ
የጥልቁ ሰንሰለት ሲያንሰኝ ነው ጨለማ
ግን ያንቺ ሆንኩና ሁሉንም አለፍኩት
ያንን የሞት ባህር በምልጃሽ ቀዘፍኩት

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 2
አዝማች""""""""
አርፏል ልቤ ባንቺ ባዛኝቷ ማርያም
ውስጤ እያፈሰሰ ፍቅር እና ሰላም
ህመሜን ቢያስረሳኝ የውዳሴሽ ቃና

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 3
እመቤቴ እላለሁ ዛሬም እንደገና
አዝማች"""""""""
እናታችን ፅዮን ሰው ሁሉ ይልሻል
ዳዋት በበገና ያመሰግንሻል

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 4
ያሴቦን ነገስታት ለክብርሽ ዘምሩ
የማትፈርሽ መቅደስ የእዛአብሄር ሀገሩ
አዝማች"""""""""""
እጅግ ብዙ ነገር አድርገሽልኛል

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 5
ይቅር ባዩም ልጅሽ በፍቅር አይቶኛል
እኔስ እኖራለሁ ድንግል ባንቺ ጥላ
ጨለማን አላይም ከእንግዲህ በኋላ

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '26ee52a7-d2d6-4ef2-a4e3-401a95057702'::uuid, 'zarem-alesh-belibe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
