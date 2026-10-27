-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 06 OF 32
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
  -- to-him-who-sits-on-the-throne ("To Him Who Sits on the Throne")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b0b80796-56bc-4205-be3f-c1748fcf0646'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 1
Let every creature in heaven and on earth
With thousands of angels and twenty-four elders
With the righteous and the four living beings
Praise the Conqueror and the King of kings/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 2
He became a man and, didn’t think it a loss
He was obedient up to death on the Cross
Let every knee bow, let every tongue praise
To Jesus Christ the name above all names/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 3
Because the wedding of the divine Lamb has come
Let''s wash and clean our robes by the blood of the groom
And sing like the roar of rushing waters
Like a mighty wave, as loud peals of thunder/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 4
He who sits on the throne will make everything new
He will wipe every tear, His words are always true
He prepared for us a place no eyes have seen
And no ears have heard, for that let us all sing/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 1
Let every creature in heaven and on earth
With thousands of angels and twenty-four elders
With the righteous and the four living beings
Praise the Conqueror and the King of kings/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 2
He became a man and, didn’t think it a loss
He was obedient up to death on the Cross
Let every knee bow, let every tongue praise
To Jesus Christ the name above all names/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 3
Because the wedding of the divine Lamb has come
Let''s wash and clean our robes by the blood of the groom
And sing like the roar of rushing waters
Like a mighty wave, as loud peals of thunder/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 4
He who sits on the throne will make everything new
He will wipe every tear, His words are always true
He prepared for us a place no eyes have seen
And no ears have heard, for that let us all sing/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b0b80796-56bc-4205-be3f-c1748fcf0646'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 1
Let every creature in heaven and on earth
With thousands of angels and twenty-four elders
With the righteous and the four living beings
Praise the Conqueror and the King of kings/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 2
He became a man and, didn’t think it a loss
He was obedient up to death on the Cross
Let every knee bow, let every tongue praise
To Jesus Christ the name above all names/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 3
Because the wedding of the divine Lamb has come
Let''s wash and clean our robes by the blood of the groom
And sing like the roar of rushing waters
Like a mighty wave, as loud peals of thunder/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 4
He who sits on the throne will make everything new
He will wipe every tear, His words are always true
He prepared for us a place no eyes have seen
And no ears have heard, for that let us all sing/x2/

CHORUS
To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b0b80796-56bc-4205-be3f-c1748fcf0646'::uuid, 'to-him-who-sits-on-the-throne', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- undeserving-i-am ("Undeserving I Am")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'daf6e78b-c31a-4376-b88b-6891a519dc98'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 1
Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn/x2/

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 2
You’ve given me all that I have so faithfully
Though you loved me I left so carelessly
Despite my sins you wait for me so patiently
Your blessing pours  into my life so endlessly

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 3
I have received your precious gifts in abundance
I cannot try to count they’re limitless
In my defeat and my weakness You hear my plea
Through your mercy your grace abounds and sustains me

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 4
You give your love with such passion and sacrifice
To save your flock from death you paid the price
What can we say we can''t repay our King and Lord
From shamefulness you saved us God our lives restored

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 5
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 6
Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn/x2/

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 1
Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn/x2/

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 2
You’ve given me all that I have so faithfully
Though you loved me I left so carelessly
Despite my sins you wait for me so patiently
Your blessing pours  into my life so endlessly

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 3
I have received your precious gifts in abundance
I cannot try to count they’re limitless
In my defeat and my weakness You hear my plea
Through your mercy your grace abounds and sustains me

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 4
You give your love with such passion and sacrifice
To save your flock from death you paid the price
What can we say we can''t repay our King and Lord
From shamefulness you saved us God our lives restored

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 5
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 6
Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn/x2/

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting',
        lyrics_transliteration = 'Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'daf6e78b-c31a-4376-b88b-6891a519dc98'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 1
Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn/x2/

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 2
You’ve given me all that I have so faithfully
Though you loved me I left so carelessly
Despite my sins you wait for me so patiently
Your blessing pours  into my life so endlessly

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 3
I have received your precious gifts in abundance
I cannot try to count they’re limitless
In my defeat and my weakness You hear my plea
Through your mercy your grace abounds and sustains me

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 4
You give your love with such passion and sacrifice
To save your flock from death you paid the price
What can we say we can''t repay our King and Lord
From shamefulness you saved us God our lives restored

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 5
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 6
Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn/x2/

CHORUS
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'daf6e78b-c31a-4376-b88b-6891a519dc98'::uuid, 'undeserving-i-am', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- le-gebriel-yenegerkut ("Le Gebriel Yenegerkut")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '648068af-10b3-442d-8963-4f7d7ef2e5b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 1
ተንከባሎ በዓይኔ አየሁት (2ጊዜ)
ከዓይን ጠቅሻ ቀድመህ
ፈጥነህ ትደርሳለህ
በምልጃህ ጸሎትህ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 2
ከእኔ ጋር አለህ
ገብርኤል ግብርኤል
ገብርኤል የምለው
እጄን ስዘረጋ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 3
ብዙ ሰጥተኸን ነው
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 4
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
የደስታን ዜና
ዘዋል እጆችህ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 5
የአምላክን ውዳሴ
ተሞልቷል ከንፈርህ
ችግሬን አትሻም
አትፈቅድም ጥፋቴን

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 6
እንዳሰናከል
አቁመሀል እግሬን
በእግዚአብሔር ፊት
ለሚቆመው

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 7
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
በእሳቱ መሀል

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 8
ምስጋና አስተምረኝ
በእቶንም መካከል
ውዳሴን አሳየኝ
እንዳላጉረመርም

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 9
በሆነው በአልሆነው
ገብርኤል አሳየኝ
አመስግኜ እንዳልፈው
በእግዚአብሔር ፊት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 10
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 11
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት
ከእቶኑ ተጥለው

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 12
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ
በብዙ ምስጋና

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 13
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 14
ተንከባሎ በዓይኔ አየሁት
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 15
ከእቶኑ ተጥለው
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 16
በብዙ ምስጋና
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 17
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 1
Tenkebalo beayne ayehut (2gize)
Keayn t’eqsha qedmeh
Fet’neh tidersaleh
Bemljah ts’eloth

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 2
Keene gar aleh
Gebriel gibrel
Gebriel yemlew
Ejen sizerega

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 3
Bizu set’teኸn new
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 4
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut
Yedestan zena
Zewal ejochh

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 5
Yeamlakn widase
Temoltwal kenferh
Chgren atsham
Atfeqdm t’faten

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 6
Endasenakel
Aqumehel egren
BeEgziabher fit
Lemiqomew

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 7
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut
Beesatu mehel

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 8
Misgana astemregn
Beetonm mekakel
Widasen asayegn
Endalaguremerm

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 9
Behonew bealhonew
Gebriel asayegn
Amesggne endalfew
BeEgziabher fit

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 10
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 11
Sidraq ena misaq
Abdnagon honew
Beminedew esat
Keetonu tet’lew

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 12
Gebriel derese
Linegrachew zena
Chgr endemirq
Bebzu misgana

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 13
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 14
Tenkebalo beayne ayehut
Sidraq ena misaq
Abdnagon honew
Beminedew esat

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 15
Keetonu tet’lew
Gebriel derese
Linegrachew zena
Chgr endemirq

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 16
Bebzu misgana
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 17
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 1
ተንከባሎ በዓይኔ አየሁት (2ጊዜ)
ከዓይን ጠቅሻ ቀድመህ
ፈጥነህ ትደርሳለህ
በምልጃህ ጸሎትህ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 2
ከእኔ ጋር አለህ
ገብርኤል ግብርኤል
ገብርኤል የምለው
እጄን ስዘረጋ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 3
ብዙ ሰጥተኸን ነው
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 4
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
የደስታን ዜና
ዘዋል እጆችህ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 5
የአምላክን ውዳሴ
ተሞልቷል ከንፈርህ
ችግሬን አትሻም
አትፈቅድም ጥፋቴን

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 6
እንዳሰናከል
አቁመሀል እግሬን
በእግዚአብሔር ፊት
ለሚቆመው

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 7
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
በእሳቱ መሀል

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 8
ምስጋና አስተምረኝ
በእቶንም መካከል
ውዳሴን አሳየኝ
እንዳላጉረመርም

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 9
በሆነው በአልሆነው
ገብርኤል አሳየኝ
አመስግኜ እንዳልፈው
በእግዚአብሔር ፊት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 10
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 11
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት
ከእቶኑ ተጥለው

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 12
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ
በብዙ ምስጋና

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 13
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 14
ተንከባሎ በዓይኔ አየሁት
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 15
ከእቶኑ ተጥለው
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 16
በብዙ ምስጋና
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 17
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ',
        lyrics_transliteration = 'CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 1
Tenkebalo beayne ayehut (2gize)
Keayn t’eqsha qedmeh
Fet’neh tidersaleh
Bemljah ts’eloth

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 2
Keene gar aleh
Gebriel gibrel
Gebriel yemlew
Ejen sizerega

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 3
Bizu set’teኸn new
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 4
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut
Yedestan zena
Zewal ejochh

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 5
Yeamlakn widase
Temoltwal kenferh
Chgren atsham
Atfeqdm t’faten

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 6
Endasenakel
Aqumehel egren
BeEgziabher fit
Lemiqomew

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 7
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut
Beesatu mehel

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 8
Misgana astemregn
Beetonm mekakel
Widasen asayegn
Endalaguremerm

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 9
Behonew bealhonew
Gebriel asayegn
Amesggne endalfew
BeEgziabher fit

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 10
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 11
Sidraq ena misaq
Abdnagon honew
Beminedew esat
Keetonu tet’lew

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 12
Gebriel derese
Linegrachew zena
Chgr endemirq
Bebzu misgana

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 13
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 14
Tenkebalo beayne ayehut
Sidraq ena misaq
Abdnagon honew
Beminedew esat

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 15
Keetonu tet’lew
Gebriel derese
Linegrachew zena
Chgr endemirq

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 16
Bebzu misgana
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 17
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay',
        updated_at = clock_timestamp()::text
    WHERE import_id = '648068af-10b3-442d-8963-4f7d7ef2e5b5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 1
ተንከባሎ በዓይኔ አየሁት (2ጊዜ)
ከዓይን ጠቅሻ ቀድመህ
ፈጥነህ ትደርሳለህ
በምልጃህ ጸሎትህ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 2
ከእኔ ጋር አለህ
ገብርኤል ግብርኤል
ገብርኤል የምለው
እጄን ስዘረጋ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 3
ብዙ ሰጥተኸን ነው
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 4
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
የደስታን ዜና
ዘዋል እጆችህ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 5
የአምላክን ውዳሴ
ተሞልቷል ከንፈርህ
ችግሬን አትሻም
አትፈቅድም ጥፋቴን

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 6
እንዳሰናከል
አቁመሀል እግሬን
በእግዚአብሔር ፊት
ለሚቆመው

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 7
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
በእሳቱ መሀል

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 8
ምስጋና አስተምረኝ
በእቶንም መካከል
ውዳሴን አሳየኝ
እንዳላጉረመርም

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 9
በሆነው በአልሆነው
ገብርኤል አሳየኝ
አመስግኜ እንዳልፈው
በእግዚአብሔር ፊት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 10
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 11
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት
ከእቶኑ ተጥለው

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 12
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ
በብዙ ምስጋና

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 13
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 14
ተንከባሎ በዓይኔ አየሁት
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 15
ከእቶኑ ተጥለው
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 16
በብዙ ምስጋና
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 17
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '648068af-10b3-442d-8963-4f7d7ef2e5b5'::uuid, 'le-gebriel-yenegerkut', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yiberal-bekinfu ("Yiberal Be-kinfu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '64bcc433-6fb2-47e9-bc82-c036e4d8e174'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 1
ከፊቴ ቀደመ ደመናን ዘርግቶ
እንዳልደናቀፍ ጉድባዎቼን ሞልቶ
ዛሬ ላለሁበት ብሩቱ ጉልበት ሆነኝ
ሰው ለመባል በቃሁ ሚካኤል ደገፈኝ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 2
በእናቴ እቅፍ ገብቼ መቅደሱ
አለሁ እስከዛሬ አጥሮኝ በመንፈሱ
የህይወቴን ሰልፎች አለፍኩ ከርሱ ጋራ
ተፅፏል በልቤ የሚካኤል ስራ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 3
በዙሪያዬ ተክሎ የእሳት ምሰሶውን
ፅድቅ እየመገበ ኣሳደገኝ ልጁን
የአምላኬን ምስጋና ዘውትር እያስጠናኝ
እርሱ ነው ሚካኤል በመዝሙር የሞላኝ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 4
ፊት ለፊት ተተክሎ ከታናሿ መንደር
ይስማኝ ነበረ ቅኔው ሲደረደር
ይወስደኛል ደጁ እየቀሰቀሰ
ታላቁን በረከት በውስጤ አፈሰሰ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 5
ሴኬምን እንዳላይ ክንፎቹን ጋረደ
መራኝ ወደ ህይወት መዳኔን ወደደ
የሞአብን ቋንቋ ከአፌ ላይ አጥፍቶ
በፀጋው ቃል ቃኘኝ በበረከት ሞል

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 1
Ke-fitie qedeme demenan zergito
Indal-denaqef gudbawochien molto
Zare lalluhubet burtu gulbet honnegn
Sew le-mebal beqahu Mika''el degeffegn

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 2
Be-innate iqif gebichie meqdesu
Allehu iskezare atirogn be-menfesu
Ye-hiywotie’n selfoch alefku kersu gara
Tesfiwal be-libie ye-Mika''el sira

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 3
Be-zuriya-yie teklo ye-isat misesown
Tsidq iyemigebe asadegign lijun
Ye-amlakien misgana zewtir iyastenyegn
Irsu new Mika''el be-mezmur ye-mollagn

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 4
Fit le-fit teteklo ke-tanashwa mender
Yisman nebere qiniew si-dereder
Yiwsedegnal deju iye-qeseqese
Talaqun bereket be-wustie afessese

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 5
Sekiemin indalay kinfochun garede
Meragn wede hiywot medanien wedede
Ye-Moabin quanqua ke-afie lay atfito
Be-tsegaw qal kagonegn be-bereket molto

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 1
ከፊቴ ቀደመ ደመናን ዘርግቶ
እንዳልደናቀፍ ጉድባዎቼን ሞልቶ
ዛሬ ላለሁበት ብሩቱ ጉልበት ሆነኝ
ሰው ለመባል በቃሁ ሚካኤል ደገፈኝ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 2
በእናቴ እቅፍ ገብቼ መቅደሱ
አለሁ እስከዛሬ አጥሮኝ በመንፈሱ
የህይወቴን ሰልፎች አለፍኩ ከርሱ ጋራ
ተፅፏል በልቤ የሚካኤል ስራ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 3
በዙሪያዬ ተክሎ የእሳት ምሰሶውን
ፅድቅ እየመገበ ኣሳደገኝ ልጁን
የአምላኬን ምስጋና ዘውትር እያስጠናኝ
እርሱ ነው ሚካኤል በመዝሙር የሞላኝ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 4
ፊት ለፊት ተተክሎ ከታናሿ መንደር
ይስማኝ ነበረ ቅኔው ሲደረደር
ይወስደኛል ደጁ እየቀሰቀሰ
ታላቁን በረከት በውስጤ አፈሰሰ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 5
ሴኬምን እንዳላይ ክንፎቹን ጋረደ
መራኝ ወደ ህይወት መዳኔን ወደደ
የሞአብን ቋንቋ ከአፌ ላይ አጥፍቶ
በፀጋው ቃል ቃኘኝ በበረከት ሞል

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/',
        lyrics_transliteration = 'CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 1
Ke-fitie qedeme demenan zergito
Indal-denaqef gudbawochien molto
Zare lalluhubet burtu gulbet honnegn
Sew le-mebal beqahu Mika''el degeffegn

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 2
Be-innate iqif gebichie meqdesu
Allehu iskezare atirogn be-menfesu
Ye-hiywotie’n selfoch alefku kersu gara
Tesfiwal be-libie ye-Mika''el sira

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 3
Be-zuriya-yie teklo ye-isat misesown
Tsidq iyemigebe asadegign lijun
Ye-amlakien misgana zewtir iyastenyegn
Irsu new Mika''el be-mezmur ye-mollagn

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 4
Fit le-fit teteklo ke-tanashwa mender
Yisman nebere qiniew si-dereder
Yiwsedegnal deju iye-qeseqese
Talaqun bereket be-wustie afessese

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 5
Sekiemin indalay kinfochun garede
Meragn wede hiywot medanien wedede
Ye-Moabin quanqua ke-afie lay atfito
Be-tsegaw qal kagonegn be-bereket molto

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '64bcc433-6fb2-47e9-bc82-c036e4d8e174'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 1
ከፊቴ ቀደመ ደመናን ዘርግቶ
እንዳልደናቀፍ ጉድባዎቼን ሞልቶ
ዛሬ ላለሁበት ብሩቱ ጉልበት ሆነኝ
ሰው ለመባል በቃሁ ሚካኤል ደገፈኝ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 2
በእናቴ እቅፍ ገብቼ መቅደሱ
አለሁ እስከዛሬ አጥሮኝ በመንፈሱ
የህይወቴን ሰልፎች አለፍኩ ከርሱ ጋራ
ተፅፏል በልቤ የሚካኤል ስራ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 3
በዙሪያዬ ተክሎ የእሳት ምሰሶውን
ፅድቅ እየመገበ ኣሳደገኝ ልጁን
የአምላኬን ምስጋና ዘውትር እያስጠናኝ
እርሱ ነው ሚካኤል በመዝሙር የሞላኝ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 4
ፊት ለፊት ተተክሎ ከታናሿ መንደር
ይስማኝ ነበረ ቅኔው ሲደረደር
ይወስደኛል ደጁ እየቀሰቀሰ
ታላቁን በረከት በውስጤ አፈሰሰ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 5
ሴኬምን እንዳላይ ክንፎቹን ጋረደ
መራኝ ወደ ህይወት መዳኔን ወደደ
የሞአብን ቋንቋ ከአፌ ላይ አጥፍቶ
በፀጋው ቃል ቃኘኝ በበረከት ሞል

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 1
Ke-fitie qedeme demenan zergito
Indal-denaqef gudbawochien molto
Zare lalluhubet burtu gulbet honnegn
Sew le-mebal beqahu Mika''el degeffegn

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 2
Be-innate iqif gebichie meqdesu
Allehu iskezare atirogn be-menfesu
Ye-hiywotie’n selfoch alefku kersu gara
Tesfiwal be-libie ye-Mika''el sira

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 3
Be-zuriya-yie teklo ye-isat misesown
Tsidq iyemigebe asadegign lijun
Ye-amlakien misgana zewtir iyastenyegn
Irsu new Mika''el be-mezmur ye-mollagn

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 4
Fit le-fit teteklo ke-tanashwa mender
Yisman nebere qiniew si-dereder
Yiwsedegnal deju iye-qeseqese
Talaqun bereket be-wustie afessese

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 5
Sekiemin indalay kinfochun garede
Meragn wede hiywot medanien wedede
Ye-Moabin quanqua ke-afie lay atfito
Be-tsegaw qal kagonegn be-bereket molto

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '64bcc433-6fb2-47e9-bc82-c036e4d8e174'::uuid, 'yiberal-bekinfu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- walk-in-the-light-of-god ("Walk in the Light of God")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7a597c4d-0edc-4472-9508-ce9bd4b448cb'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 1
In the shadows of the almighty God
In the peaceful springs we will rest upon
For the creator of our peace and love
Let us run to him to our savior God

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 2
He who held judgment and forgiveness
The lord of peace is our Jesus Christ
He who gave us life by the Holy cross
He defeated dark and opened our eyes

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 3
The thoughts of fear or the darkness nights
Will flea from us if we plea tonight
Sins harmful sharp flying through the day
His peaceful words will save you come pray

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 4
Don’t let yourself down you can stumble on
Be courageous brave when times get hard
Banning every curse every tragic thought
He will protect you the almighty God

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 5
He who knows his name or the life he brings
They will rise above all powers of grace
A long full life in the light of God
Forever adorned they will be with love

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 6
O, dear Lord our hope and peace
You fed us from the heavens of Eade
Proving us delight when you redeem our souls
A God like you cannot be replaced

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 1
In the shadows of the almighty God
In the peaceful springs we will rest upon
For the creator of our peace and love
Let us run to him to our savior God

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 2
He who held judgment and forgiveness
The lord of peace is our Jesus Christ
He who gave us life by the Holy cross
He defeated dark and opened our eyes

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 3
The thoughts of fear or the darkness nights
Will flea from us if we plea tonight
Sins harmful sharp flying through the day
His peaceful words will save you come pray

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 4
Don’t let yourself down you can stumble on
Be courageous brave when times get hard
Banning every curse every tragic thought
He will protect you the almighty God

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 5
He who knows his name or the life he brings
They will rise above all powers of grace
A long full life in the light of God
Forever adorned they will be with love

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 6
O, dear Lord our hope and peace
You fed us from the heavens of Eade
Proving us delight when you redeem our souls
A God like you cannot be replaced

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = '7a597c4d-0edc-4472-9508-ce9bd4b448cb'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 1
In the shadows of the almighty God
In the peaceful springs we will rest upon
For the creator of our peace and love
Let us run to him to our savior God

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 2
He who held judgment and forgiveness
The lord of peace is our Jesus Christ
He who gave us life by the Holy cross
He defeated dark and opened our eyes

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 3
The thoughts of fear or the darkness nights
Will flea from us if we plea tonight
Sins harmful sharp flying through the day
His peaceful words will save you come pray

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 4
Don’t let yourself down you can stumble on
Be courageous brave when times get hard
Banning every curse every tragic thought
He will protect you the almighty God

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 5
He who knows his name or the life he brings
They will rise above all powers of grace
A long full life in the light of God
Forever adorned they will be with love

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 6
O, dear Lord our hope and peace
You fed us from the heavens of Eade
Proving us delight when you redeem our souls
A God like you cannot be replaced

CHORUS
Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7a597c4d-0edc-4472-9508-ce9bd4b448cb'::uuid, 'walk-in-the-light-of-god', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wemidrni-tigebir-fasika ("Wemidrni Tigebir Fasika")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '43419c63-82fa-4e1b-9720-830c50e1c7d2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)

VERSE 1
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)

CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)

VERSE 1
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)

CHORUS
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)

VERSE 1
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)

CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)',
        lyrics_transliteration = 'CHORUS
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)

VERSE 1
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)

CHORUS
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '43419c63-82fa-4e1b-9720-830c50e1c7d2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)

VERSE 1
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)

CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)

VERSE 1
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)

CHORUS
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '43419c63-82fa-4e1b-9720-830c50e1c7d2'::uuid, 'wemidrni-tigebir-fasika', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- we-believe ("We Believe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a0506c6d-c274-4ef5-9e39-3544d08805b3'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
We believe in the father and
We believe in the son(2)

VERSE 1
We also believe(4) we believe in the holy spirit

CHORUS
We believe in the father and
We believe in the son(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Enamenalen beAb
Enamenalen beWeld
Enamenalen beMenfes Qidus'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
We believe in the father and
We believe in the son(2)

VERSE 1
We also believe(4) we believe in the holy spirit

CHORUS
We believe in the father and
We believe in the son(2)',
        lyrics_transliteration = 'Enamenalen beAb
Enamenalen beWeld
Enamenalen beMenfes Qidus',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a0506c6d-c274-4ef5-9e39-3544d08805b3'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
We believe in the father and
We believe in the son(2)

VERSE 1
We also believe(4) we believe in the holy spirit

CHORUS
We believe in the father and
We believe in the son(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Enamenalen beAb
Enamenalen beWeld
Enamenalen beMenfes Qidus';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a0506c6d-c274-4ef5-9e39-3544d08805b3'::uuid, 'we-believe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- covenant-of-mercy ("Covenant of Mercy")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e3c30b76-4892-49c5-b983-3e3d46cddb51'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 1
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 2
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 3
The times of misery, with ease I left behind
Drawing nearer to you, redemption of mankind
The grace of your Child and your benevolence
Protected your servant from a worrisome death

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 4
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 5
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 6
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 7
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 8
My heart grew firm by you and it became lifted
Upon my enemies, my mouth spoke convicted
By your healing wonders, your servant is happy
Your child has broken arrows of the mighty

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 9
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 10
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 11
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 12
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 13
My loved ones fled when my hands weren’t full and sufficed
When they tried to divide with their cursed advice
I told them that He had taken what He first gave
But I have my Lady, they were quickly ashamed

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 14
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 15
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 16
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 17
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 18
As I stood on the stage, calling her name to praise
With gentle compassion, towards me she had gazed
No one mirrors your rare and unique thoughtfulness
Through you Mother Mary, I found my true solace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 19
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 20
Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 21
Selam leki

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 22
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 23
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 24
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 25
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 26
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese
Selam leki'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 1
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 2
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 3
The times of misery, with ease I left behind
Drawing nearer to you, redemption of mankind
The grace of your Child and your benevolence
Protected your servant from a worrisome death

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 4
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 5
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 6
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 7
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 8
My heart grew firm by you and it became lifted
Upon my enemies, my mouth spoke convicted
By your healing wonders, your servant is happy
Your child has broken arrows of the mighty

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 9
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 10
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 11
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 12
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 13
My loved ones fled when my hands weren’t full and sufficed
When they tried to divide with their cursed advice
I told them that He had taken what He first gave
But I have my Lady, they were quickly ashamed

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 14
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 15
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 16
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 17
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 18
As I stood on the stage, calling her name to praise
With gentle compassion, towards me she had gazed
No one mirrors your rare and unique thoughtfulness
Through you Mother Mary, I found my true solace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 19
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 20
Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 21
Selam leki

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 22
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 23
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 24
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 25
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 26
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me',
        lyrics_transliteration = 'Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese
Selam leki',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e3c30b76-4892-49c5-b983-3e3d46cddb51'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 1
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 2
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 3
The times of misery, with ease I left behind
Drawing nearer to you, redemption of mankind
The grace of your Child and your benevolence
Protected your servant from a worrisome death

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 4
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 5
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 6
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 7
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 8
My heart grew firm by you and it became lifted
Upon my enemies, my mouth spoke convicted
By your healing wonders, your servant is happy
Your child has broken arrows of the mighty

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 9
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 10
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 11
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 12
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 13
My loved ones fled when my hands weren’t full and sufficed
When they tried to divide with their cursed advice
I told them that He had taken what He first gave
But I have my Lady, they were quickly ashamed

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 14
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 15
My mother, as I called your name
All of my torments I overcame
In front of, you tears fell down my face
You dried them, for I’m in your embrace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 16
Peace be unto you

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 17
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 18
As I stood on the stage, calling her name to praise
With gentle compassion, towards me she had gazed
No one mirrors your rare and unique thoughtfulness
Through you Mother Mary, I found my true solace

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 19
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 20
Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 21
Selam leki

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 22
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 23
Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 24
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 25
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

VERSE 26
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me

CHORUS
For Covenant of Mercy patiently I waited
I was consoled all my sorrows faded
Mother of God our Lady Mary
For all my days bestow grace upon me'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Dej tenahu qoyiche Kidane Mehretin
Tetsnanahugn resahu hazenen
Yamlak enat Emebetachin
Moges hugnign qeriw zemenen

Enate simshin sitera
Alefe ya hulu mekera
Enbaye kefitish fesese
Emiye banchi yetabese
Selam leki';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e3c30b76-4892-49c5-b983-3e3d46cddb51'::uuid, 'covenant-of-mercy', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anite-aleh-bekibir ("Anite Aleh Bekibir")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6735409f-3dae-4841-9cf0-1fcfcea3fecc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 1
ሳይታይ የየብስ ፊቱ
ቀላያት ሳይከፈቱ
ሰማይና ምድር ሳይኖሩ
ብርሃናት ሁሉ ሳይበሩ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 2
ኮረብቶች ፊቱ ሳይቆሙ
አበቦች ሳይለመልሙ
ሳይመዘዙ መባርቅት
ሳይንጓደዱ ብርሃናት

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 3
ነጎድጓድ ድምፅ ሳይሰጡ
ከዋክብት ሳይፈነጥቁ
ከፍ ብለህ ከፍታ
ብቻህን ነበርክ ጌታ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 4
የወንዝ ጎርፎች ሳይፈሱ
ነፋሳት ገና ሳይነፍሱ
የውሃ ምንጮች ሳይፈሉ
ሁኑ ሳይላቸው በቃሉ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 5
ደመናው ግዘፍ ሳይሳብ
ሳይበጅ የምድርም ክበብ
መዓልቱ ገና ሳይኖር
ሌሊትም ሳይፈጠር

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 6
ጨለማው ሳይጋረድ
ሳጥናኤል ሳይዋረድ
መላእክት ሳይፈጠሩ
ያህዌ ነበር በክብሩ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 7
ከሁሉ የተሰወርክ
በክብርህ ከክረህ የኖርክ
ማይደረስብህ ጥልቅ
ማትመረመር ምጡቅ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 8
ኮረብቶችን የመዘንክ
ውኆችንም የሰፈርክ
ሁሉን የምትመረምር
ግሩም ነህ ማትደፈር

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 9
በባሕሪይህ ከብረህ
በምስጋና ተከበህ
የነበርክ በዘላለም
ያህዌ እንዳንተ የለም

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 10
ሳትደክም ምትሸከም
ሳታጎድል ምትሰጥ ሰላም
ሳትተኛ ምትጠብቅ
ሳትነጥፍ ሁሉንታውቅ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 11
በፍቅር ምትገዛ ንጉስ
ነቅ የሌለብህ ቅዱስ
ሁሉን ምትፈውስ መድህን
የጠበቅከን በዘመን

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 12
ምታስብ ሳትዘነጋ
ምትሰጥ ለሁሉ ዋጋ
ምትተው ሳትቀበል
አምላክ ነህ ጌታ ልዑል

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 13
የመመኪያችን ዘውድ
የተ ዛመድከን ዘመድ
የደኅንነታችን ፋና
የመኖራችን ዋስትና

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 14
የሕይወታችን መሠረት፤
የቤታችን ጉልላት፤
የማንነታችን ውበት
ለመኖራችን ድምቀት

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 15
አልጫውን ያጣፈጥክ
ጨለማውን ያሳደድክ
አለሙን ያበራህ ፋና
ከፍ በል በምስጋና

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 1
Saytay yeyebs fitu
Qelayat saykefetu
Semayna midr saynoru
Birhanat hulu sayberu

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 2
Korebtoch fitu sayqomu
Abeboch saylemelmu
Saymezezu mebarqt
Sayngwadedu birhanat

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 3
Negodgwad dimts’ sayset’u
Kewakbt sayfenet’qu
Kef bileh kefta
Bichahn neberk Geta

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 4
Yewenz gorfoch sayfesu
Nefasat gena saynefsu
Yewha minch’och sayfelu
Hunu saylachew beqalu

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 5
Demenaw gizef saysab
Saybej yemdrm kibeb
Mealtu gena saynor
Lelitm sayfet’er

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 6
Ch’elemaw saygared
Sat’nael saywared
Melaekt sayfet’eru
Yahwe neber bekbru

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 7
Kehulu yetesewerk
Bekbrh kekreh yenork
Mayderesbh t’lq
Matmeremer mit’uq

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 8
Korebtochn yemezenk
Wihochnm yeseferk
Hulun yemtmeremr
Girum neh matdefer

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 9
Bebahriyh kebreh
Bemsgana tekebeh
Yeneberk bezelalem
Yahwe endante yelem

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 10
Satdekm mitshekem
Satagodl mitset’ selam
Sattegna mitt’ebq
Satnet’f huluntawq

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 11
Befqr mitgeza nigus
Neq yelelebh Kidus
Hulun mitfews medhn
Yet’ebeqken bezemen

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 12
Mitasb satzenega
Mitset’ lehulu waga
Mittew satqebel
Amlak neh Geta liul

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 13
Yememekiyachn zewd
Yete zamedken zemed
Yedehnnetachn fana
Yemenorachn wastna

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 14
Yehywetachn meseret;
Yebetachn gullat;
Yemannetachn wibet
Lemenorachn dimqet

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 15
Alch’awn yat’afet’k
Ch’elemawn yasadedk
Alemun yaberah fana
Kef bel bemsgana

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 1
ሳይታይ የየብስ ፊቱ
ቀላያት ሳይከፈቱ
ሰማይና ምድር ሳይኖሩ
ብርሃናት ሁሉ ሳይበሩ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 2
ኮረብቶች ፊቱ ሳይቆሙ
አበቦች ሳይለመልሙ
ሳይመዘዙ መባርቅት
ሳይንጓደዱ ብርሃናት

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 3
ነጎድጓድ ድምፅ ሳይሰጡ
ከዋክብት ሳይፈነጥቁ
ከፍ ብለህ ከፍታ
ብቻህን ነበርክ ጌታ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 4
የወንዝ ጎርፎች ሳይፈሱ
ነፋሳት ገና ሳይነፍሱ
የውሃ ምንጮች ሳይፈሉ
ሁኑ ሳይላቸው በቃሉ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 5
ደመናው ግዘፍ ሳይሳብ
ሳይበጅ የምድርም ክበብ
መዓልቱ ገና ሳይኖር
ሌሊትም ሳይፈጠር

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 6
ጨለማው ሳይጋረድ
ሳጥናኤል ሳይዋረድ
መላእክት ሳይፈጠሩ
ያህዌ ነበር በክብሩ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 7
ከሁሉ የተሰወርክ
በክብርህ ከክረህ የኖርክ
ማይደረስብህ ጥልቅ
ማትመረመር ምጡቅ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 8
ኮረብቶችን የመዘንክ
ውኆችንም የሰፈርክ
ሁሉን የምትመረምር
ግሩም ነህ ማትደፈር

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 9
በባሕሪይህ ከብረህ
በምስጋና ተከበህ
የነበርክ በዘላለም
ያህዌ እንዳንተ የለም

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 10
ሳትደክም ምትሸከም
ሳታጎድል ምትሰጥ ሰላም
ሳትተኛ ምትጠብቅ
ሳትነጥፍ ሁሉንታውቅ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 11
በፍቅር ምትገዛ ንጉስ
ነቅ የሌለብህ ቅዱስ
ሁሉን ምትፈውስ መድህን
የጠበቅከን በዘመን

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 12
ምታስብ ሳትዘነጋ
ምትሰጥ ለሁሉ ዋጋ
ምትተው ሳትቀበል
አምላክ ነህ ጌታ ልዑል

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 13
የመመኪያችን ዘውድ
የተ ዛመድከን ዘመድ
የደኅንነታችን ፋና
የመኖራችን ዋስትና

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 14
የሕይወታችን መሠረት፤
የቤታችን ጉልላት፤
የማንነታችን ውበት
ለመኖራችን ድምቀት

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 15
አልጫውን ያጣፈጥክ
ጨለማውን ያሳደድክ
አለሙን ያበራህ ፋና
ከፍ በል በምስጋና

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ',
        lyrics_transliteration = 'CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 1
Saytay yeyebs fitu
Qelayat saykefetu
Semayna midr saynoru
Birhanat hulu sayberu

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 2
Korebtoch fitu sayqomu
Abeboch saylemelmu
Saymezezu mebarqt
Sayngwadedu birhanat

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 3
Negodgwad dimts’ sayset’u
Kewakbt sayfenet’qu
Kef bileh kefta
Bichahn neberk Geta

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 4
Yewenz gorfoch sayfesu
Nefasat gena saynefsu
Yewha minch’och sayfelu
Hunu saylachew beqalu

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 5
Demenaw gizef saysab
Saybej yemdrm kibeb
Mealtu gena saynor
Lelitm sayfet’er

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 6
Ch’elemaw saygared
Sat’nael saywared
Melaekt sayfet’eru
Yahwe neber bekbru

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 7
Kehulu yetesewerk
Bekbrh kekreh yenork
Mayderesbh t’lq
Matmeremer mit’uq

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 8
Korebtochn yemezenk
Wihochnm yeseferk
Hulun yemtmeremr
Girum neh matdefer

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 9
Bebahriyh kebreh
Bemsgana tekebeh
Yeneberk bezelalem
Yahwe endante yelem

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 10
Satdekm mitshekem
Satagodl mitset’ selam
Sattegna mitt’ebq
Satnet’f huluntawq

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 11
Befqr mitgeza nigus
Neq yelelebh Kidus
Hulun mitfews medhn
Yet’ebeqken bezemen

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 12
Mitasb satzenega
Mitset’ lehulu waga
Mittew satqebel
Amlak neh Geta liul

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 13
Yememekiyachn zewd
Yete zamedken zemed
Yedehnnetachn fana
Yemenorachn wastna

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 14
Yehywetachn meseret;
Yebetachn gullat;
Yemannetachn wibet
Lemenorachn dimqet

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 15
Alch’awn yat’afet’k
Ch’elemawn yasadedk
Alemun yaberah fana
Kef bel bemsgana

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6735409f-3dae-4841-9cf0-1fcfcea3fecc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 1
ሳይታይ የየብስ ፊቱ
ቀላያት ሳይከፈቱ
ሰማይና ምድር ሳይኖሩ
ብርሃናት ሁሉ ሳይበሩ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 2
ኮረብቶች ፊቱ ሳይቆሙ
አበቦች ሳይለመልሙ
ሳይመዘዙ መባርቅት
ሳይንጓደዱ ብርሃናት

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 3
ነጎድጓድ ድምፅ ሳይሰጡ
ከዋክብት ሳይፈነጥቁ
ከፍ ብለህ ከፍታ
ብቻህን ነበርክ ጌታ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 4
የወንዝ ጎርፎች ሳይፈሱ
ነፋሳት ገና ሳይነፍሱ
የውሃ ምንጮች ሳይፈሉ
ሁኑ ሳይላቸው በቃሉ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 5
ደመናው ግዘፍ ሳይሳብ
ሳይበጅ የምድርም ክበብ
መዓልቱ ገና ሳይኖር
ሌሊትም ሳይፈጠር

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 6
ጨለማው ሳይጋረድ
ሳጥናኤል ሳይዋረድ
መላእክት ሳይፈጠሩ
ያህዌ ነበር በክብሩ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 7
ከሁሉ የተሰወርክ
በክብርህ ከክረህ የኖርክ
ማይደረስብህ ጥልቅ
ማትመረመር ምጡቅ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 8
ኮረብቶችን የመዘንክ
ውኆችንም የሰፈርክ
ሁሉን የምትመረምር
ግሩም ነህ ማትደፈር

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 9
በባሕሪይህ ከብረህ
በምስጋና ተከበህ
የነበርክ በዘላለም
ያህዌ እንዳንተ የለም

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 10
ሳትደክም ምትሸከም
ሳታጎድል ምትሰጥ ሰላም
ሳትተኛ ምትጠብቅ
ሳትነጥፍ ሁሉንታውቅ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 11
በፍቅር ምትገዛ ንጉስ
ነቅ የሌለብህ ቅዱስ
ሁሉን ምትፈውስ መድህን
የጠበቅከን በዘመን

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 12
ምታስብ ሳትዘነጋ
ምትሰጥ ለሁሉ ዋጋ
ምትተው ሳትቀበል
አምላክ ነህ ጌታ ልዑል

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 13
የመመኪያችን ዘውድ
የተ ዛመድከን ዘመድ
የደኅንነታችን ፋና
የመኖራችን ዋስትና

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 14
የሕይወታችን መሠረት፤
የቤታችን ጉልላት፤
የማንነታችን ውበት
ለመኖራችን ድምቀት

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 15
አልጫውን ያጣፈጥክ
ጨለማውን ያሳደድክ
አለሙን ያበራህ ፋና
ከፍ በል በምስጋና

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6735409f-3dae-4841-9cf0-1fcfcea3fecc'::uuid, 'anite-aleh-bekibir', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ende-egziabeher-yale-manim-yelem-na ("Ende Igziabeher Yale Manim Yelem-na")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e2b419e2-4417-433f-819b-f207ff57b8fb'::uuid
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
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 1
Bahir tekefele iskitay meretu
Far’on wedeqe alseram timkihtu
Dekamochim tsentew teramedu
Hayilegnonchim yihew tewaredu

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 2
Ye-Iyariko qitir yemayedefferew
Yihew ferars-o ye-sew ij sayinekaw
Hayilegnonchim bibertatubin
Intsenalen be-irsu tedegfen

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 3
Ye-teworewerew ye-telatachin tor
Mieda lay wedeqe gasha hono Igziabeher
Le-Sillassie yidres misganachin
Teshenefe adagn telatachin

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 4
Bahir lay siramed moges alew irsu
Be-girmaw sinessa tsett yilal nefasu
Ye-Dingil lij igna yeminnamlkew
Medhanealem yelem yemisanew

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)'
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
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 1
Bahir tekefele iskitay meretu
Far’on wedeqe alseram timkihtu
Dekamochim tsentew teramedu
Hayilegnonchim yihew tewaredu

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 2
Ye-Iyariko qitir yemayedefferew
Yihew ferars-o ye-sew ij sayinekaw
Hayilegnonchim bibertatubin
Intsenalen be-irsu tedegfen

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 3
Ye-teworewerew ye-telatachin tor
Mieda lay wedeqe gasha hono Igziabeher
Le-Sillassie yidres misganachin
Teshenefe adagn telatachin

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 4
Bahir lay siramed moges alew irsu
Be-girmaw sinessa tsett yilal nefasu
Ye-Dingil lij igna yeminnamlkew
Medhanealem yelem yemisanew

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e2b419e2-4417-433f-819b-f207ff57b8fb'::uuid
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
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 1
Bahir tekefele iskitay meretu
Far’on wedeqe alseram timkihtu
Dekamochim tsentew teramedu
Hayilegnonchim yihew tewaredu

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 2
Ye-Iyariko qitir yemayedefferew
Yihew ferars-o ye-sew ij sayinekaw
Hayilegnonchim bibertatubin
Intsenalen be-irsu tedegfen

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 3
Ye-teworewerew ye-telatachin tor
Mieda lay wedeqe gasha hono Igziabeher
Le-Sillassie yidres misganachin
Teshenefe adagn telatachin

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)

VERSE 4
Bahir lay siramed moges alew irsu
Be-girmaw sinessa tsett yilal nefasu
Ye-Dingil lij igna yeminnamlkew
Medhanealem yelem yemisanew

CHORUS
Ende Igziabeher yale manim yelem-na
Elel belu qumu le-misgana (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e2b419e2-4417-433f-819b-f207ff57b8fb'::uuid, 'ende-egziabeher-yale-manim-yelem-na', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- weredo-emeskelu ("Werido Emeskelu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '245927a7-f3a0-4d16-b96c-cab0932e5dcf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ

VERSE 1
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ

CHORUS
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh

VERSE 1
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh

CHORUS
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ

VERSE 1
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ

CHORUS
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ',
        lyrics_transliteration = 'CHORUS
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh

VERSE 1
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh

CHORUS
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '245927a7-f3a0-4d16-b96c-cab0932e5dcf'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ

VERSE 1
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ

CHORUS
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh

VERSE 1
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh

CHORUS
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '245927a7-f3a0-4d16-b96c-cab0932e5dcf'::uuid, 'weredo-emeskelu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ya-deha-tetara ("Ya Deha Tetara")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c204eac6-4f0f-4584-b9ae-686d9d4f2528'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 1
መሻትህ ብቻ ነው የሚፈልግብህ
እግዚአብሔርን ጥራ እመን ትድናለህ

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 2
ንገረው ችግርህን የዉስጥህን ብሶት
ይሽረዋልና አስፈሬውን ሕይወት
ግራ የተጋባው የተከፋው ገፅህ
ይበራል በፀሎት አምላክህን ጠርተህ

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 3
ለወገን ለዘመድ ያስቸገረው መላ
ሲቀል ታየዋለህ ካነባህ በሃላ
ሳግና ንዴትህ ይቀራል ይሻራል
በአርሱ ፋንታ ሰላም ፍቅር ይከብሃል

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 4
በከንቱ መጨነቅ ራስን መጥላቱ
ነዉና የአጋንንት መግብያ ምልክቱ
ሐዘን በሕሊናህ በፈሰሰ ጊዜ
ንገረው ለአምላክህ የልብህ ትካዜ

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 1
Meshatih bicha new yemifeligibih
Egziabhierin tira amen tidinaleh

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 2
Nigerew chigirihin yewostihin bisot
Yishirewalina asferiwun hiywot
Gira yetegabaw yetekefaw getsih
Yiberal betsilot Amlakihin terteh

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 3
Lewogen lezemed yaschegerew mela
Siqel tayewaleh kanebah behala
Sagina nidetih yiqeral yisharal
Be-irsu fanta selam fiqir yikebihal

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 4
Bekent mecheneq rasin metlatu
Newina ye aganint megbiya milkitu
Hazen behilinah befesese gize
Nigerew le-Amlakih yelibih tikaze

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 1
መሻትህ ብቻ ነው የሚፈልግብህ
እግዚአብሔርን ጥራ እመን ትድናለህ

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 2
ንገረው ችግርህን የዉስጥህን ብሶት
ይሽረዋልና አስፈሬውን ሕይወት
ግራ የተጋባው የተከፋው ገፅህ
ይበራል በፀሎት አምላክህን ጠርተህ

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 3
ለወገን ለዘመድ ያስቸገረው መላ
ሲቀል ታየዋለህ ካነባህ በሃላ
ሳግና ንዴትህ ይቀራል ይሻራል
በአርሱ ፋንታ ሰላም ፍቅር ይከብሃል

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 4
በከንቱ መጨነቅ ራስን መጥላቱ
ነዉና የአጋንንት መግብያ ምልክቱ
ሐዘን በሕሊናህ በፈሰሰ ጊዜ
ንገረው ለአምላክህ የልብህ ትካዜ

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው',
        lyrics_transliteration = 'CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 1
Meshatih bicha new yemifeligibih
Egziabhierin tira amen tidinaleh

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 2
Nigerew chigirihin yewostihin bisot
Yishirewalina asferiwun hiywot
Gira yetegabaw yetekefaw getsih
Yiberal betsilot Amlakihin terteh

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 3
Lewogen lezemed yaschegerew mela
Siqel tayewaleh kanebah behala
Sagina nidetih yiqeral yisharal
Be-irsu fanta selam fiqir yikebihal

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 4
Bekent mecheneq rasin metlatu
Newina ye aganint megbiya milkitu
Hazen behilinah befesese gize
Nigerew le-Amlakih yelibih tikaze

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c204eac6-4f0f-4584-b9ae-686d9d4f2528'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 1
መሻትህ ብቻ ነው የሚፈልግብህ
እግዚአብሔርን ጥራ እመን ትድናለህ

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 2
ንገረው ችግርህን የዉስጥህን ብሶት
ይሽረዋልና አስፈሬውን ሕይወት
ግራ የተጋባው የተከፋው ገፅህ
ይበራል በፀሎት አምላክህን ጠርተህ

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 3
ለወገን ለዘመድ ያስቸገረው መላ
ሲቀል ታየዋለህ ካነባህ በሃላ
ሳግና ንዴትህ ይቀራል ይሻራል
በአርሱ ፋንታ ሰላም ፍቅር ይከብሃል

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 4
በከንቱ መጨነቅ ራስን መጥላቱ
ነዉና የአጋንንት መግብያ ምልክቱ
ሐዘን በሕሊናህ በፈሰሰ ጊዜ
ንገረው ለአምላክህ የልብህ ትካዜ

CHORUS
ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 1
Meshatih bicha new yemifeligibih
Egziabhierin tira amen tidinaleh

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 2
Nigerew chigirihin yewostihin bisot
Yishirewalina asferiwun hiywot
Gira yetegabaw yetekefaw getsih
Yiberal betsilot Amlakihin terteh

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 3
Lewogen lezemed yaschegerew mela
Siqel tayewaleh kanebah behala
Sagina nidetih yiqeral yisharal
Be-irsu fanta selam fiqir yikebihal

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 4
Bekent mecheneq rasin metlatu
Newina ye aganint megbiya milkitu
Hazen behilinah befesese gize
Nigerew le-Amlakih yelibih tikaze

CHORUS
Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c204eac6-4f0f-4584-b9ae-686d9d4f2528'::uuid, 'ya-deha-tetara', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emebetachin-beanichi-milija ("Emebetachin Beanichi Milija")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '687ec93e-0710-440d-b50f-fce7cde434d8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና',
        lyrics_transliteration = 'CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanealem tamr sera bemaye qana x2
Legetachn teamr bemaye qana',
        updated_at = clock_timestamp()::text
    WHERE import_id = '687ec93e-0710-440d-b50f-fce7cde434d8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኔዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '687ec93e-0710-440d-b50f-fce7cde434d8'::uuid, 'emebetachin-beanichi-milija', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wudase-maryam-echohalew ("Wudase Maryam Echohalew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1c6e7ff4-0d2c-47f4-aab0-db921eb28d5a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 1
ውዳሴ ማርያም በሰርክ ፀሎት ላይ
ውዳሴ ማርያም ዜማን ስናደርስ
ውዳሴ ማርያም ድንግል ትመጣለች
ውዳሴ ማርያም ከቤተ መቅደስ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 2
ውዳሴ ማርያም የብርሀን ምንጣፍ
ውዳሴ ማርያም ከፊቷ ተነጥፏል
ውዳሴ ማርያም ቅዱስ ኤፍሬም ታጥቆ
ውዳሴ ማርያም ያመሰግናታል

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 3
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 4
ውዳሴ ማርያም አባ ሄርያቆስ
ውዳሴ ማርያም ምስጋና ያቀርባል
ውዳሴ ማርያም የቅዳሴው ዜማ
ውዳሴ ማርያም ልብን ይመስጣል

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 5
ውዳሴ ማርያም በጎ ነገር ልቤ
ውዳሴ ማርያም አወጣ እያለ
ውዳሴ ማርያም ዳዊት በገናውን
ውዳሴ ማርያም እየ ደረ ደረ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 6
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 7
ውዳሴ ማርያም የንፅህናችን
ውዳሴ ማርያም መሰረት ነሽና
ውዳሴ ማርያም አንቺን ለማመስገን
ውዳሴ ማርያም ልቦናዬ ይብራ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 8
ውዳሴ ማርያም ተፈስኺ ድንግል
ውዳሴ ማርያም በቤተ ልሄም
ውዳሴ ማርያም ካንቺ ተወለደ
ውዳሴ ማርያም መድሀኒ አለም

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 9
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 10
ውዳሴ ማርያም ቅዱሳኑ ሁሉ
ውዳሴ ማርያም ዙሪያሽን ከበዋል
ውዳሴ ማርያም አባ ጊወርጊስም
ውዳሴ ማርያም ንኢ ድንግል ይላል

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 11
ውዳሴ ማርያም በወርቅ ዙፋን ላይ
ውዳሴ ማርያም ተቀምጠሽ ሳይሽ
ውዳሴ ማርያም ልቤ ተሰወረ
ውዳሴ ማርያም ድንግል በግርማሽ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 12
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 13
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 14
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 1
Wudase Maryam, beserk tselot lay
Wudase Maryam, zeman sinaders
Wudase Maryam, denegl timetaletch
Wudase Maryam, kebete meqdes

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 2
Wudase Maryam, yebrihan minṭaf
Wudase Maryam, kefitwa tenetefwal
Wudase Maryam, qedus Efram taṭqo
Wudase Maryam, yamesegnatlal

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 3
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 4
Wudase Maryam, Aba Heryaqos
Wudase Maryam, misgana yakerbal
Wudase Maryam, yeqidaséw zema
Wudase Maryam, liben yimesṭal

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 5
Wudase Maryam, bego neger libe
Wudase Maryam, aweta eyale
Wudase Maryam, Dawit begenawn
Wudase Maryam, eye dere dere

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 6
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 7
Wudase Maryam, yentsehnachen
Wudase Maryam, meserat neshina
Wudase Maryam, anchin le’amesgen
Wudase Maryam, libonaye yibra

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 8
Wudase Maryam, tefesihi denegl
Wudase Maryam, beBetelehem
Wudase Maryam, kanchi tewelled
Wudase Maryam, medhane alem

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 9
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 10
Wudase Maryam, qedusanhu hulu
Wudase Maryam, zuriyashin kebewal
Wudase Maryam, Aba Giorgism
Wudase Maryam, ni denegl yilal

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 11
Wudase Maryam, bewerk zufan lay
Wudase Maryam, teqemtesh sayish
Wudase Maryam, libe tesewere
Wudase Maryam, denegl begirmash

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 12
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 13
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 14
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 1
ውዳሴ ማርያም በሰርክ ፀሎት ላይ
ውዳሴ ማርያም ዜማን ስናደርስ
ውዳሴ ማርያም ድንግል ትመጣለች
ውዳሴ ማርያም ከቤተ መቅደስ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 2
ውዳሴ ማርያም የብርሀን ምንጣፍ
ውዳሴ ማርያም ከፊቷ ተነጥፏል
ውዳሴ ማርያም ቅዱስ ኤፍሬም ታጥቆ
ውዳሴ ማርያም ያመሰግናታል

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 3
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 4
ውዳሴ ማርያም አባ ሄርያቆስ
ውዳሴ ማርያም ምስጋና ያቀርባል
ውዳሴ ማርያም የቅዳሴው ዜማ
ውዳሴ ማርያም ልብን ይመስጣል

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 5
ውዳሴ ማርያም በጎ ነገር ልቤ
ውዳሴ ማርያም አወጣ እያለ
ውዳሴ ማርያም ዳዊት በገናውን
ውዳሴ ማርያም እየ ደረ ደረ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 6
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 7
ውዳሴ ማርያም የንፅህናችን
ውዳሴ ማርያም መሰረት ነሽና
ውዳሴ ማርያም አንቺን ለማመስገን
ውዳሴ ማርያም ልቦናዬ ይብራ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 8
ውዳሴ ማርያም ተፈስኺ ድንግል
ውዳሴ ማርያም በቤተ ልሄም
ውዳሴ ማርያም ካንቺ ተወለደ
ውዳሴ ማርያም መድሀኒ አለም

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 9
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 10
ውዳሴ ማርያም ቅዱሳኑ ሁሉ
ውዳሴ ማርያም ዙሪያሽን ከበዋል
ውዳሴ ማርያም አባ ጊወርጊስም
ውዳሴ ማርያም ንኢ ድንግል ይላል

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 11
ውዳሴ ማርያም በወርቅ ዙፋን ላይ
ውዳሴ ማርያም ተቀምጠሽ ሳይሽ
ውዳሴ ማርያም ልቤ ተሰወረ
ውዳሴ ማርያም ድንግል በግርማሽ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 12
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 13
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 14
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ',
        lyrics_transliteration = 'CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 1
Wudase Maryam, beserk tselot lay
Wudase Maryam, zeman sinaders
Wudase Maryam, denegl timetaletch
Wudase Maryam, kebete meqdes

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 2
Wudase Maryam, yebrihan minṭaf
Wudase Maryam, kefitwa tenetefwal
Wudase Maryam, qedus Efram taṭqo
Wudase Maryam, yamesegnatlal

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 3
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 4
Wudase Maryam, Aba Heryaqos
Wudase Maryam, misgana yakerbal
Wudase Maryam, yeqidaséw zema
Wudase Maryam, liben yimesṭal

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 5
Wudase Maryam, bego neger libe
Wudase Maryam, aweta eyale
Wudase Maryam, Dawit begenawn
Wudase Maryam, eye dere dere

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 6
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 7
Wudase Maryam, yentsehnachen
Wudase Maryam, meserat neshina
Wudase Maryam, anchin le’amesgen
Wudase Maryam, libonaye yibra

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 8
Wudase Maryam, tefesihi denegl
Wudase Maryam, beBetelehem
Wudase Maryam, kanchi tewelled
Wudase Maryam, medhane alem

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 9
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 10
Wudase Maryam, qedusanhu hulu
Wudase Maryam, zuriyashin kebewal
Wudase Maryam, Aba Giorgism
Wudase Maryam, ni denegl yilal

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 11
Wudase Maryam, bewerk zufan lay
Wudase Maryam, teqemtesh sayish
Wudase Maryam, libe tesewere
Wudase Maryam, denegl begirmash

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 12
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 13
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 14
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1c6e7ff4-0d2c-47f4-aab0-db921eb28d5a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 1
ውዳሴ ማርያም በሰርክ ፀሎት ላይ
ውዳሴ ማርያም ዜማን ስናደርስ
ውዳሴ ማርያም ድንግል ትመጣለች
ውዳሴ ማርያም ከቤተ መቅደስ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 2
ውዳሴ ማርያም የብርሀን ምንጣፍ
ውዳሴ ማርያም ከፊቷ ተነጥፏል
ውዳሴ ማርያም ቅዱስ ኤፍሬም ታጥቆ
ውዳሴ ማርያም ያመሰግናታል

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 3
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 4
ውዳሴ ማርያም አባ ሄርያቆስ
ውዳሴ ማርያም ምስጋና ያቀርባል
ውዳሴ ማርያም የቅዳሴው ዜማ
ውዳሴ ማርያም ልብን ይመስጣል

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 5
ውዳሴ ማርያም በጎ ነገር ልቤ
ውዳሴ ማርያም አወጣ እያለ
ውዳሴ ማርያም ዳዊት በገናውን
ውዳሴ ማርያም እየ ደረ ደረ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 6
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 7
ውዳሴ ማርያም የንፅህናችን
ውዳሴ ማርያም መሰረት ነሽና
ውዳሴ ማርያም አንቺን ለማመስገን
ውዳሴ ማርያም ልቦናዬ ይብራ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 8
ውዳሴ ማርያም ተፈስኺ ድንግል
ውዳሴ ማርያም በቤተ ልሄም
ውዳሴ ማርያም ካንቺ ተወለደ
ውዳሴ ማርያም መድሀኒ አለም

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 9
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 10
ውዳሴ ማርያም ቅዱሳኑ ሁሉ
ውዳሴ ማርያም ዙሪያሽን ከበዋል
ውዳሴ ማርያም አባ ጊወርጊስም
ውዳሴ ማርያም ንኢ ድንግል ይላል

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 11
ውዳሴ ማርያም በወርቅ ዙፋን ላይ
ውዳሴ ማርያም ተቀምጠሽ ሳይሽ
ውዳሴ ማርያም ልቤ ተሰወረ
ውዳሴ ማርያም ድንግል በግርማሽ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 12
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 13
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 14
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

CHORUS
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 1
Wudase Maryam, beserk tselot lay
Wudase Maryam, zeman sinaders
Wudase Maryam, denegl timetaletch
Wudase Maryam, kebete meqdes

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 2
Wudase Maryam, yebrihan minṭaf
Wudase Maryam, kefitwa tenetefwal
Wudase Maryam, qedus Efram taṭqo
Wudase Maryam, yamesegnatlal

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 3
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 4
Wudase Maryam, Aba Heryaqos
Wudase Maryam, misgana yakerbal
Wudase Maryam, yeqidaséw zema
Wudase Maryam, liben yimesṭal

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 5
Wudase Maryam, bego neger libe
Wudase Maryam, aweta eyale
Wudase Maryam, Dawit begenawn
Wudase Maryam, eye dere dere

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 6
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 7
Wudase Maryam, yentsehnachen
Wudase Maryam, meserat neshina
Wudase Maryam, anchin le’amesgen
Wudase Maryam, libonaye yibra

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 8
Wudase Maryam, tefesihi denegl
Wudase Maryam, beBetelehem
Wudase Maryam, kanchi tewelled
Wudase Maryam, medhane alem

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 9
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 10
Wudase Maryam, qedusanhu hulu
Wudase Maryam, zuriyashin kebewal
Wudase Maryam, Aba Giorgism
Wudase Maryam, ni denegl yilal

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 11
Wudase Maryam, bewerk zufan lay
Wudase Maryam, teqemtesh sayish
Wudase Maryam, libe tesewere
Wudase Maryam, denegl begirmash

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 12
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 13
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 14
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

CHORUS
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1c6e7ff4-0d2c-47f4-aab0-db921eb28d5a'::uuid, 'wudase-maryam-echohalew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yesilonidis-tibeb ("Yesilonidis Tibeb")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '50186a4e-09d2-4c62-b8af-15cf64c8654d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 1
ተጨንቄሃለሁ ልንገርሽ
ምስጢረኛዬ እናቴ ነሽ
ሰው ያልሰማውን ብርቱ ምስጢር
ድንግል ሆይ ላንቺ ላማክር

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 2
ለቁስለኛውም መድኃኒቱ
የአዳም ዘር ሁሉ ነሽ ሕይወቱ
መፍትዬ አለ በእጅሽ
ተንበርክኬ ነው ምማጸንሽ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 3
አዝ የሲሎንዲስ ጥበብ
ሳልናገረው ይገባሻል
የውስጤ ሁሉ ይታይሻል
ድረሽ እናቴ ተራዲኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 4
ያላንቺ ለኔ ማን አለኝ
ደስታዬ ደስታ የሚሆነው
በአዘኔም የምጽናናሁ
አንቺ ከእኔ ጋር ስለሆንሽ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 5
ተጽናንቼሃለሁ በስምሽ
አዝ የሲሎንዲስ ጥበብ
ወንድሞቼ እንኩአ ቢሸጡኝ
ሰው ሁሉ ጠላት ቢሆነኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 6
በእመአምላክ ሃይል ተምሬሃለሁ
በጠላቴ ላይ ሰልጥኜሃለሁ
የረሱኝ በሙሉ ያስቡኛል
የተጣሉኝም ያከብሩኛል

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 7
አዝ የሲሎንዲስ ጥበብ
መንገዴ እረዝሞ ደክሜብሽ
መከራው በዝቶ ታምሜብሽ
ወድቄ ሳዝን ድረሺልኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 8
ለባሪያሽ ሃይሉን እንድትሰጪኝ
ፍቅርሽ በውስጤ ተንሰራፋ
በእናትነትሽ ልቤ ሰፋ
የሚለያየን ማንም የለም

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 9
ማርያም ልበልሽ ለዘለአለም

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 1
Tech’enqehalehu lingersh
Mist’iregnaye enate nesh
Sew yalsemawn birtu mist’ir
Dingil hoy lanchi lamakr

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 2
Lequslegnawm medhanitu
Yeadam zer hulu nesh hiywetu
Meftye ale beejsh
Tenberkke new mimats’ensh

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 3
CHORUS
Salnagerew yigebashal
Yewst’e hulu yitayshal
Diresh enate teradign

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 4
Yalanchi lene man alegn
Destaye desta yemihonew
Beazenem yemts’nanahu
Anchi keene gar silehonsh

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 5
Tets’nanchehalehu besmsh
CHORUS
Wendmoche enkua bishet’ugn
Sew hulu t’elat bihonegn

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 6
Beemeamlak hayl temrehalehu
Bet’elate lay selt’gnehalehu
Yeresugn bemulu yasbugnal
Yetet’alugnm yakebrugnal

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 7
CHORUS
Mengede erezmo dekmebsh
Mekeraw bezto tammebsh
Wedqe sazn direshilgn

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 8
Lebariyash haylun endtsech’ign
Fiqrsh bewst’e tenserafa
Beenatnetsh libe sefa
Yemileyayen manm yelem

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 9
Maryam libelsh lezelealem

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 1
ተጨንቄሃለሁ ልንገርሽ
ምስጢረኛዬ እናቴ ነሽ
ሰው ያልሰማውን ብርቱ ምስጢር
ድንግል ሆይ ላንቺ ላማክር

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 2
ለቁስለኛውም መድኃኒቱ
የአዳም ዘር ሁሉ ነሽ ሕይወቱ
መፍትዬ አለ በእጅሽ
ተንበርክኬ ነው ምማጸንሽ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 3
አዝ የሲሎንዲስ ጥበብ
ሳልናገረው ይገባሻል
የውስጤ ሁሉ ይታይሻል
ድረሽ እናቴ ተራዲኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 4
ያላንቺ ለኔ ማን አለኝ
ደስታዬ ደስታ የሚሆነው
በአዘኔም የምጽናናሁ
አንቺ ከእኔ ጋር ስለሆንሽ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 5
ተጽናንቼሃለሁ በስምሽ
አዝ የሲሎንዲስ ጥበብ
ወንድሞቼ እንኩአ ቢሸጡኝ
ሰው ሁሉ ጠላት ቢሆነኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 6
በእመአምላክ ሃይል ተምሬሃለሁ
በጠላቴ ላይ ሰልጥኜሃለሁ
የረሱኝ በሙሉ ያስቡኛል
የተጣሉኝም ያከብሩኛል

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 7
አዝ የሲሎንዲስ ጥበብ
መንገዴ እረዝሞ ደክሜብሽ
መከራው በዝቶ ታምሜብሽ
ወድቄ ሳዝን ድረሺልኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 8
ለባሪያሽ ሃይሉን እንድትሰጪኝ
ፍቅርሽ በውስጤ ተንሰራፋ
በእናትነትሽ ልቤ ሰፋ
የሚለያየን ማንም የለም

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 9
ማርያም ልበልሽ ለዘለአለም

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/',
        lyrics_transliteration = 'CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 1
Tech’enqehalehu lingersh
Mist’iregnaye enate nesh
Sew yalsemawn birtu mist’ir
Dingil hoy lanchi lamakr

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 2
Lequslegnawm medhanitu
Yeadam zer hulu nesh hiywetu
Meftye ale beejsh
Tenberkke new mimats’ensh

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 3
CHORUS
Salnagerew yigebashal
Yewst’e hulu yitayshal
Diresh enate teradign

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 4
Yalanchi lene man alegn
Destaye desta yemihonew
Beazenem yemts’nanahu
Anchi keene gar silehonsh

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 5
Tets’nanchehalehu besmsh
CHORUS
Wendmoche enkua bishet’ugn
Sew hulu t’elat bihonegn

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 6
Beemeamlak hayl temrehalehu
Bet’elate lay selt’gnehalehu
Yeresugn bemulu yasbugnal
Yetet’alugnm yakebrugnal

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 7
CHORUS
Mengede erezmo dekmebsh
Mekeraw bezto tammebsh
Wedqe sazn direshilgn

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 8
Lebariyash haylun endtsech’ign
Fiqrsh bewst’e tenserafa
Beenatnetsh libe sefa
Yemileyayen manm yelem

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 9
Maryam libelsh lezelealem

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '50186a4e-09d2-4c62-b8af-15cf64c8654d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 1
ተጨንቄሃለሁ ልንገርሽ
ምስጢረኛዬ እናቴ ነሽ
ሰው ያልሰማውን ብርቱ ምስጢር
ድንግል ሆይ ላንቺ ላማክር

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 2
ለቁስለኛውም መድኃኒቱ
የአዳም ዘር ሁሉ ነሽ ሕይወቱ
መፍትዬ አለ በእጅሽ
ተንበርክኬ ነው ምማጸንሽ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 3
አዝ የሲሎንዲስ ጥበብ
ሳልናገረው ይገባሻል
የውስጤ ሁሉ ይታይሻል
ድረሽ እናቴ ተራዲኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 4
ያላንቺ ለኔ ማን አለኝ
ደስታዬ ደስታ የሚሆነው
በአዘኔም የምጽናናሁ
አንቺ ከእኔ ጋር ስለሆንሽ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 5
ተጽናንቼሃለሁ በስምሽ
አዝ የሲሎንዲስ ጥበብ
ወንድሞቼ እንኩአ ቢሸጡኝ
ሰው ሁሉ ጠላት ቢሆነኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 6
በእመአምላክ ሃይል ተምሬሃለሁ
በጠላቴ ላይ ሰልጥኜሃለሁ
የረሱኝ በሙሉ ያስቡኛል
የተጣሉኝም ያከብሩኛል

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 7
አዝ የሲሎንዲስ ጥበብ
መንገዴ እረዝሞ ደክሜብሽ
መከራው በዝቶ ታምሜብሽ
ወድቄ ሳዝን ድረሺልኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 8
ለባሪያሽ ሃይሉን እንድትሰጪኝ
ፍቅርሽ በውስጤ ተንሰራፋ
በእናትነትሽ ልቤ ሰፋ
የሚለያየን ማንም የለም

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 9
ማርያም ልበልሽ ለዘለአለም

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '50186a4e-09d2-4c62-b8af-15cf64c8654d'::uuid, 'yesilonidis-tibeb', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sar-kitelu-seridow ("Sar Kitelu Seridow")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6b0f6cbe-8422-4923-90f0-d7d33625dd23'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 1
እልል በይ ቤተልሔም ሃሌ ሃሌ ሉያ
የፍቅር የሰላም ነሽና ገበያ /2/
ያ ትሁት እረኛ ሳለ በታጋት
ብርሃንን ለበሰ በዕኩለ ሌሊት

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 2
ጥሪ ተደርጎለት ከሰማይ ሠራዊት
ለመመልከት በቃ የጌታውን ልደት
አዝ …………………..
የእረኝነት ሥራ ተንቆ እንዲቀር

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 3
ብሎ ሰው በልማድ ደንግጎ ነበር
የብዙ ሰው እራስ መሆኑን እረኛ
ክርስቶስ ሲወለድ ተረዳነው እኛ
አዝ ………………………

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 4
የሩቅ ምስራቅ ሰዎች ሰብአሰገል ሰምተው
ሊሰግዱለት መጡ በኮከብ ተመርተው
እጣንና ከርቤ ወርቁንም አመጡ
እንደየሥርዓቱ እጅ መንሻ ሰጡ

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 5
አዝ ……………………….
ስለተወለደ መድህን የኛ ተስፋ
በደል ተወገደ ሀጥያትም ጠፋ

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 1
Ell bey betelhem hale Halleluya
Yefqr yeselam neshna gebeya (2)
Ya tihut eregna sale betagat
Birhann lebese beekule lelit

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 2
T’ri tedergolet kesemay serawit
Lememelket beqa yegetawn lidet
CHORUS
Yeeregnnet sira tenqo endiqer

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 3
Bilo sew belmad denggo neber
Yebzu sew eras mehonun eregna
Kristos siweled teredanew egna
CHORUS

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 4
Yeruq misraq sewoch sebasegel semtew
Lisegdulet met’u bekokeb temertew
Et’anna kerbe werqunm amet’u
Endeyesratu ej mensha set’u

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 5
CHORUS
Siletewelede medhn yegna tesfa
Bedel tewegede het’yatm t’efa

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 1
እልል በይ ቤተልሔም ሃሌ ሃሌ ሉያ
የፍቅር የሰላም ነሽና ገበያ /2/
ያ ትሁት እረኛ ሳለ በታጋት
ብርሃንን ለበሰ በዕኩለ ሌሊት

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 2
ጥሪ ተደርጎለት ከሰማይ ሠራዊት
ለመመልከት በቃ የጌታውን ልደት
አዝ …………………..
የእረኝነት ሥራ ተንቆ እንዲቀር

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 3
ብሎ ሰው በልማድ ደንግጎ ነበር
የብዙ ሰው እራስ መሆኑን እረኛ
ክርስቶስ ሲወለድ ተረዳነው እኛ
አዝ ………………………

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 4
የሩቅ ምስራቅ ሰዎች ሰብአሰገል ሰምተው
ሊሰግዱለት መጡ በኮከብ ተመርተው
እጣንና ከርቤ ወርቁንም አመጡ
እንደየሥርዓቱ እጅ መንሻ ሰጡ

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 5
አዝ ……………………….
ስለተወለደ መድህን የኛ ተስፋ
በደል ተወገደ ሀጥያትም ጠፋ

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው',
        lyrics_transliteration = 'CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 1
Ell bey betelhem hale Halleluya
Yefqr yeselam neshna gebeya (2)
Ya tihut eregna sale betagat
Birhann lebese beekule lelit

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 2
T’ri tedergolet kesemay serawit
Lememelket beqa yegetawn lidet
CHORUS
Yeeregnnet sira tenqo endiqer

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 3
Bilo sew belmad denggo neber
Yebzu sew eras mehonun eregna
Kristos siweled teredanew egna
CHORUS

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 4
Yeruq misraq sewoch sebasegel semtew
Lisegdulet met’u bekokeb temertew
Et’anna kerbe werqunm amet’u
Endeyesratu ej mensha set’u

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 5
CHORUS
Siletewelede medhn yegna tesfa
Bedel tewegede het’yatm t’efa

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6b0f6cbe-8422-4923-90f0-d7d33625dd23'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 1
እልል በይ ቤተልሔም ሃሌ ሃሌ ሉያ
የፍቅር የሰላም ነሽና ገበያ /2/
ያ ትሁት እረኛ ሳለ በታጋት
ብርሃንን ለበሰ በዕኩለ ሌሊት

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 2
ጥሪ ተደርጎለት ከሰማይ ሠራዊት
ለመመልከት በቃ የጌታውን ልደት
አዝ …………………..
የእረኝነት ሥራ ተንቆ እንዲቀር

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 3
ብሎ ሰው በልማድ ደንግጎ ነበር
የብዙ ሰው እራስ መሆኑን እረኛ
ክርስቶስ ሲወለድ ተረዳነው እኛ
አዝ ………………………

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 4
የሩቅ ምስራቅ ሰዎች ሰብአሰገል ሰምተው
ሊሰግዱለት መጡ በኮከብ ተመርተው
እጣንና ከርቤ ወርቁንም አመጡ
እንደየሥርዓቱ እጅ መንሻ ሰጡ

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 5
አዝ ……………………….
ስለተወለደ መድህን የኛ ተስፋ
በደል ተወገደ ሀጥያትም ጠፋ

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6b0f6cbe-8422-4923-90f0-d7d33625dd23'::uuid, 'sar-kitelu-seridow', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeliben-hulu-leman-lamakir ("Yeliben Hulu Leman Lamakir")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7b905a37-adf4-4505-a01b-e98a9a268e1b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 1
ቅዱሳን አበው አንቺን መረጡ /2/
ከሲኦል ዓለም ስላመለጡ
ፃድቅ በስራው ያኔ ሲድን/2/
እጠራሻለሁ ድንግል አንቺን

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 2
የጭንቄ ደራሽ አክኪሌ ነሽ/2/
ቂም በቀል አያውቅ የዋህ ልብሽ
ልቤ ለፍቅርሽ ሰፊ ስፍራ አለው /2/
በአዘ ንኩኝ ሠዓት እጠራሻለው

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 3
ዋሴ ነሽ ለእኔ ድንግል እናቴ/2/
ስምሽ ጠበቀኝ ከልጅነቴ
ሁልጊዜ ለእኔ በጎ ያረግሽልኝ
ምን ልበል ለአንቺ ቃላትም የለኝ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 4
ለአዘንኩኝ ለእኔ ደስታዬ ነሽ/2/
ያረጋጋሽኝ ፈጥነሽ ደርሰሽ
ስምሽ ሃጥአንን የሚቀድስ/
ከሞት ወደ ህይወት የሚመልስ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 5
የመንገዴ ስንቅ የርሃቤ መርሻ/2/
ለታመመ ሰው ነሽ መፈወሻ
የተማጸነ በስምሽ አምኖ/2/
ማን አፍሮ ያውቃል አንቺን ለምኖ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 1
Kidusan abew anchin meret’u (2)
Kesiol alem silamelet’u
Ts’adq besraw yane sidn (2)
Et’erashalehu Dingil anchin

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 2
Yech’nqe derash akkile nesh (2)
Qim beqel ayawq yewah libsh
Libe lefqrsh sefi sifra alew (2)
Beaze nikugn seat et’erashalew

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 3
Wase nesh leene Dingil enate (2)
Simsh t’ebeqegn keljnete
Hulgize leene bego yaregshlgn
Min libel leanchi qalatm yelegn

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 4
Leazenkugn leene destaye nesh (2)
Yaregagashgn fet’nesh dersesh
Simsh hat’ann yemiqeds/
Kemot wede hiywet yemimels

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 5
Yemengede sinq yerhabe mersha (2)
Letameme sew nesh mefewesha
Yetemats’ene besmsh amno (2)
Man afro yawqal anchin lemno

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 1
ቅዱሳን አበው አንቺን መረጡ /2/
ከሲኦል ዓለም ስላመለጡ
ፃድቅ በስራው ያኔ ሲድን/2/
እጠራሻለሁ ድንግል አንቺን

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 2
የጭንቄ ደራሽ አክኪሌ ነሽ/2/
ቂም በቀል አያውቅ የዋህ ልብሽ
ልቤ ለፍቅርሽ ሰፊ ስፍራ አለው /2/
በአዘ ንኩኝ ሠዓት እጠራሻለው

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 3
ዋሴ ነሽ ለእኔ ድንግል እናቴ/2/
ስምሽ ጠበቀኝ ከልጅነቴ
ሁልጊዜ ለእኔ በጎ ያረግሽልኝ
ምን ልበል ለአንቺ ቃላትም የለኝ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 4
ለአዘንኩኝ ለእኔ ደስታዬ ነሽ/2/
ያረጋጋሽኝ ፈጥነሽ ደርሰሽ
ስምሽ ሃጥአንን የሚቀድስ/
ከሞት ወደ ህይወት የሚመልስ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 5
የመንገዴ ስንቅ የርሃቤ መርሻ/2/
ለታመመ ሰው ነሽ መፈወሻ
የተማጸነ በስምሽ አምኖ/2/
ማን አፍሮ ያውቃል አንቺን ለምኖ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ',
        lyrics_transliteration = 'CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 1
Kidusan abew anchin meret’u (2)
Kesiol alem silamelet’u
Ts’adq besraw yane sidn (2)
Et’erashalehu Dingil anchin

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 2
Yech’nqe derash akkile nesh (2)
Qim beqel ayawq yewah libsh
Libe lefqrsh sefi sifra alew (2)
Beaze nikugn seat et’erashalew

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 3
Wase nesh leene Dingil enate (2)
Simsh t’ebeqegn keljnete
Hulgize leene bego yaregshlgn
Min libel leanchi qalatm yelegn

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 4
Leazenkugn leene destaye nesh (2)
Yaregagashgn fet’nesh dersesh
Simsh hat’ann yemiqeds/
Kemot wede hiywet yemimels

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 5
Yemengede sinq yerhabe mersha (2)
Letameme sew nesh mefewesha
Yetemats’ene besmsh amno (2)
Man afro yawqal anchin lemno

CHORUS
Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7b905a37-adf4-4505-a01b-e98a9a268e1b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 1
ቅዱሳን አበው አንቺን መረጡ /2/
ከሲኦል ዓለም ስላመለጡ
ፃድቅ በስራው ያኔ ሲድን/2/
እጠራሻለሁ ድንግል አንቺን

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 2
የጭንቄ ደራሽ አክኪሌ ነሽ/2/
ቂም በቀል አያውቅ የዋህ ልብሽ
ልቤ ለፍቅርሽ ሰፊ ስፍራ አለው /2/
በአዘ ንኩኝ ሠዓት እጠራሻለው

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 3
ዋሴ ነሽ ለእኔ ድንግል እናቴ/2/
ስምሽ ጠበቀኝ ከልጅነቴ
ሁልጊዜ ለእኔ በጎ ያረግሽልኝ
ምን ልበል ለአንቺ ቃላትም የለኝ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 4
ለአዘንኩኝ ለእኔ ደስታዬ ነሽ/2/
ያረጋጋሽኝ ፈጥነሽ ደርሰሽ
ስምሽ ሃጥአንን የሚቀድስ/
ከሞት ወደ ህይወት የሚመልስ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 5
የመንገዴ ስንቅ የርሃቤ መርሻ/2/
ለታመመ ሰው ነሽ መፈወሻ
የተማጸነ በስምሽ አምኖ/2/
ማን አፍሮ ያውቃል አንቺን ለምኖ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7b905a37-adf4-4505-a01b-e98a9a268e1b'::uuid, 'yeliben-hulu-leman-lamakir', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemarit-mirtineshi-tilahun-kana-ze-gelila-ye-d-daniel-wendimu-ye-sergi-m ("Zemarit Mirtineshi Tilahun//kana Ze Gelila//ye D.daniel Wendimu Ye Sergi Mereha Gibir Lay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6b1ee3e0-4614-46a9-92fd-7ed0bcb53e92'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 1
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
ከእናንተ ጋር
እጀገነሽ ቆመሽ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 2
የጠማበዙበት
ሲበሉ ሲጠጡ
ወይን ደርቆ ገጨ
ድንግል እናታችን

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 3
የእግዚአብሔር ታአምር
ባንቺ ተደረሸ
በእሾክ አማለደ
ከእናት ጋራ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 4
አና
ዘገሊላ
አና
ዘገሊላ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 5
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ
ተነግተሻል ጌታ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 6
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት
ሁሉ ይቻልሻል

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 7
ወይን ምን አላት
ማአትግያው ባዶነ
በነሸ ተናገር
የገላን አሳሰብሽ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 8
እመቤታችን
አና
ዘገሊላ
አና

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 9
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 10
ተነግተሻል ጌታ
ከእናንተ ጋራ
የጌታ አምላክነት
የተገለጠባት

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 11
መኔም የላት
የመዶቂ ማስብ
ዛሬ ህብረት
በፀቀል ሁልጊዜ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 12
ከከን በስጋ ነው
አና
ዘገሊላ
አና

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 13
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 14
ተነግተሻል ጌታ
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 15
ሁሉ ይቻልሻል
ወይን ምን አላት
በአደካው ባዶ ነው
ብነሸ ተናገር

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 16
የገላን አሳሰብሽ
እመቤታችን

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 1
Beza beserg gibzha
Tegegnteshal Dingil
Keenante gar
Ejegenesh qomesh

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 2
Yet’emabezubet
Sibelu sit’et’u
Weyn derqo gech’e
Dingil enatachn

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 3
YeEgziabher taamr
Banchi tedereshe
Beeshok amalede
Keenat gara

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 4
Ana
Zegelila
Ana
Zegelila

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 5
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare
Tenegteshal Geta

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 6
Keenante gara
Anchi yallesh
Weger yelebat
Hulu yichalshal

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 7
Weyn min alat
Maatgyaw badone
Beneshe tenager
Yegelan asasebsh

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 8
Emebetachen
Ana
Zegelila
Ana

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 9
Zegelila
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 10
Tenegteshal Geta
Keenante gara
Yegeta amlaknet
Yetegelet’ebat

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 11
Menem yelat
Yemedoqi masb
Zare hibret
Bets’eqel hulgize

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 12
Keken besga new
Ana
Zegelila
Ana

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 13
Zegelila
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 14
Tenegteshal Geta
Keenante gara
Anchi yallesh
Weger yelebat

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 15
Hulu yichalshal
Weyn min alat
Beadekaw bado new
Bineshe tenager

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 16
Yegelan asasebsh
Emebetachen

CHORUS
Ana
Zegelila
Ana
Zegelila'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 1
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
ከእናንተ ጋር
እጀገነሽ ቆመሽ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 2
የጠማበዙበት
ሲበሉ ሲጠጡ
ወይን ደርቆ ገጨ
ድንግል እናታችን

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 3
የእግዚአብሔር ታአምር
ባንቺ ተደረሸ
በእሾክ አማለደ
ከእናት ጋራ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 4
አና
ዘገሊላ
አና
ዘገሊላ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 5
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ
ተነግተሻል ጌታ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 6
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት
ሁሉ ይቻልሻል

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 7
ወይን ምን አላት
ማአትግያው ባዶነ
በነሸ ተናገር
የገላን አሳሰብሽ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 8
እመቤታችን
አና
ዘገሊላ
አና

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 9
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 10
ተነግተሻል ጌታ
ከእናንተ ጋራ
የጌታ አምላክነት
የተገለጠባት

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 11
መኔም የላት
የመዶቂ ማስብ
ዛሬ ህብረት
በፀቀል ሁልጊዜ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 12
ከከን በስጋ ነው
አና
ዘገሊላ
አና

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 13
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 14
ተነግተሻል ጌታ
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 15
ሁሉ ይቻልሻል
ወይን ምን አላት
በአደካው ባዶ ነው
ብነሸ ተናገር

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 16
የገላን አሳሰብሽ
እመቤታችን

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ',
        lyrics_transliteration = 'CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 1
Beza beserg gibzha
Tegegnteshal Dingil
Keenante gar
Ejegenesh qomesh

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 2
Yet’emabezubet
Sibelu sit’et’u
Weyn derqo gech’e
Dingil enatachn

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 3
YeEgziabher taamr
Banchi tedereshe
Beeshok amalede
Keenat gara

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 4
Ana
Zegelila
Ana
Zegelila

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 5
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare
Tenegteshal Geta

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 6
Keenante gara
Anchi yallesh
Weger yelebat
Hulu yichalshal

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 7
Weyn min alat
Maatgyaw badone
Beneshe tenager
Yegelan asasebsh

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 8
Emebetachen
Ana
Zegelila
Ana

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 9
Zegelila
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 10
Tenegteshal Geta
Keenante gara
Yegeta amlaknet
Yetegelet’ebat

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 11
Menem yelat
Yemedoqi masb
Zare hibret
Bets’eqel hulgize

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 12
Keken besga new
Ana
Zegelila
Ana

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 13
Zegelila
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 14
Tenegteshal Geta
Keenante gara
Anchi yallesh
Weger yelebat

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 15
Hulu yichalshal
Weyn min alat
Beadekaw bado new
Bineshe tenager

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 16
Yegelan asasebsh
Emebetachen

CHORUS
Ana
Zegelila
Ana
Zegelila',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6b1ee3e0-4614-46a9-92fd-7ed0bcb53e92'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 1
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
ከእናንተ ጋር
እጀገነሽ ቆመሽ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 2
የጠማበዙበት
ሲበሉ ሲጠጡ
ወይን ደርቆ ገጨ
ድንግል እናታችን

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 3
የእግዚአብሔር ታአምር
ባንቺ ተደረሸ
በእሾክ አማለደ
ከእናት ጋራ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 4
አና
ዘገሊላ
አና
ዘገሊላ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 5
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ
ተነግተሻል ጌታ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 6
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት
ሁሉ ይቻልሻል

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 7
ወይን ምን አላት
ማአትግያው ባዶነ
በነሸ ተናገር
የገላን አሳሰብሽ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 8
እመቤታችን
አና
ዘገሊላ
አና

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 9
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 10
ተነግተሻል ጌታ
ከእናንተ ጋራ
የጌታ አምላክነት
የተገለጠባት

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 11
መኔም የላት
የመዶቂ ማስብ
ዛሬ ህብረት
በፀቀል ሁልጊዜ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 12
ከከን በስጋ ነው
አና
ዘገሊላ
አና

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 13
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 14
ተነግተሻል ጌታ
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 15
ሁሉ ይቻልሻል
ወይን ምን አላት
በአደካው ባዶ ነው
ብነሸ ተናገር

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 16
የገላን አሳሰብሽ
እመቤታችን

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6b1ee3e0-4614-46a9-92fd-7ed0bcb53e92'::uuid, 'zemarit-mirtineshi-tilahun-kana-ze-gelila-ye-d-daniel-wendimu-ye-sergi-m', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yehaset-dagninet ("YeHaset Dagninet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '150f510f-c61d-4ba9-a3b1-bddadb9b6b0e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 1
የሐሰት ዳኝነት አምላክን ወቀሰው
ሕይወት ሰጠን እንጂ ጥፋቱ ምንድን ነው

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 2
ከቃሉ እብለትን ባያገኙበትም
ዝምታውን አይተው አላዘኑለትም

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 3
ባላወቁት መጠን ጠሉት ካለ በደል
ጥፋቱ ምን ይሆን የሚያደርስ ከመስቀል

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 4
የልቡን ትህትና ፍቅሩን ሳያስተውሉ
ቸሩ ጌታችንን አቻኩለው ሰቀሉት

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 5
እሩህሩሁን ጌታ አቻኩለው ገደሉት
ሞትን አስወጎዶ ቢሰጣቸው ህይወት

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 6
ስለቸርለቱ ስድብን ከፈሉት
ስለርህራሄው የእሾህ አክሊል ሰጡት

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 7
ሐሞትና ከርቤ ሆምጣጤ ደባልቀው
መራራ አስጎነጩት ጨክኖ ልባቸው

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 8
ፈውስን ለሰጣቸው ልባቸውን ሞልተው
አሉት ወንበዴ ነው ስቀለው ስቀለው

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 9
ከእጁ በረከትን የተሻሙ ሁሉ
ይጮኹ ነበር ይገደል እያሉ

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 1
Yehaset dagninet Amlakn weqesew
Hiywet seten enji t’ifat minidin new

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 2
Keqalhu ibleten bayagenyubetim
Zimtawn aytew alazenuletim

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 3
Balawkut met’en t’ellut kale bedel
T’ifat min yihon yemiyaderis kemeskel

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 4
Yelibun tihit’ina fiqrun sayast’ewulu
Cheru getachinen achakulew seqelut

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 5
Eruhrhun geta achakulew gedelut
Motn aswegodo bisetachew hiywet

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 6
Silecherletu sidbin kefelut
Silerihrahéw ye’ishoh aklil setut

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 7
Hamotna kerbe homt’agete debalqew
Merara asgonet’ut chekno libachew

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 8
Fewsin lesetachew libachewn molt’ew
Alut wenbede new seqelew seqelew

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 9
Kejuh bereketn yeteshamu hulu
Yichohu neber yigedel eyalu

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 1
የሐሰት ዳኝነት አምላክን ወቀሰው
ሕይወት ሰጠን እንጂ ጥፋቱ ምንድን ነው

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 2
ከቃሉ እብለትን ባያገኙበትም
ዝምታውን አይተው አላዘኑለትም

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 3
ባላወቁት መጠን ጠሉት ካለ በደል
ጥፋቱ ምን ይሆን የሚያደርስ ከመስቀል

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 4
የልቡን ትህትና ፍቅሩን ሳያስተውሉ
ቸሩ ጌታችንን አቻኩለው ሰቀሉት

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 5
እሩህሩሁን ጌታ አቻኩለው ገደሉት
ሞትን አስወጎዶ ቢሰጣቸው ህይወት

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 6
ስለቸርለቱ ስድብን ከፈሉት
ስለርህራሄው የእሾህ አክሊል ሰጡት

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 7
ሐሞትና ከርቤ ሆምጣጤ ደባልቀው
መራራ አስጎነጩት ጨክኖ ልባቸው

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 8
ፈውስን ለሰጣቸው ልባቸውን ሞልተው
አሉት ወንበዴ ነው ስቀለው ስቀለው

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 9
ከእጁ በረከትን የተሻሙ ሁሉ
ይጮኹ ነበር ይገደል እያሉ

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ',
        lyrics_transliteration = 'CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 1
Yehaset dagninet Amlakn weqesew
Hiywet seten enji t’ifat minidin new

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 2
Keqalhu ibleten bayagenyubetim
Zimtawn aytew alazenuletim

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 3
Balawkut met’en t’ellut kale bedel
T’ifat min yihon yemiyaderis kemeskel

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 4
Yelibun tihit’ina fiqrun sayast’ewulu
Cheru getachinen achakulew seqelut

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 5
Eruhrhun geta achakulew gedelut
Motn aswegodo bisetachew hiywet

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 6
Silecherletu sidbin kefelut
Silerihrahéw ye’ishoh aklil setut

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 7
Hamotna kerbe homt’agete debalqew
Merara asgonet’ut chekno libachew

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 8
Fewsin lesetachew libachewn molt’ew
Alut wenbede new seqelew seqelew

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 9
Kejuh bereketn yeteshamu hulu
Yichohu neber yigedel eyalu

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses',
        updated_at = clock_timestamp()::text
    WHERE import_id = '150f510f-c61d-4ba9-a3b1-bddadb9b6b0e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 1
የሐሰት ዳኝነት አምላክን ወቀሰው
ሕይወት ሰጠን እንጂ ጥፋቱ ምንድን ነው

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 2
ከቃሉ እብለትን ባያገኙበትም
ዝምታውን አይተው አላዘኑለትም

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 3
ባላወቁት መጠን ጠሉት ካለ በደል
ጥፋቱ ምን ይሆን የሚያደርስ ከመስቀል

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 4
የልቡን ትህትና ፍቅሩን ሳያስተውሉ
ቸሩ ጌታችንን አቻኩለው ሰቀሉት

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 5
እሩህሩሁን ጌታ አቻኩለው ገደሉት
ሞትን አስወጎዶ ቢሰጣቸው ህይወት

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 6
ስለቸርለቱ ስድብን ከፈሉት
ስለርህራሄው የእሾህ አክሊል ሰጡት

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 7
ሐሞትና ከርቤ ሆምጣጤ ደባልቀው
መራራ አስጎነጩት ጨክኖ ልባቸው

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 8
ፈውስን ለሰጣቸው ልባቸውን ሞልተው
አሉት ወንበዴ ነው ስቀለው ስቀለው

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 9
ከእጁ በረከትን የተሻሙ ሁሉ
ይጮኹ ነበር ይገደል እያሉ

CHORUS
እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 1
Yehaset dagninet Amlakn weqesew
Hiywet seten enji t’ifat minidin new

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 2
Keqalhu ibleten bayagenyubetim
Zimtawn aytew alazenuletim

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 3
Balawkut met’en t’ellut kale bedel
T’ifat min yihon yemiyaderis kemeskel

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 4
Yelibun tihit’ina fiqrun sayast’ewulu
Cheru getachinen achakulew seqelut

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 5
Eruhrhun geta achakulew gedelut
Motn aswegodo bisetachew hiywet

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 6
Silecherletu sidbin kefelut
Silerihrahéw ye’ishoh aklil setut

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 7
Hamotna kerbe homt’agete debalqew
Merara asgonet’ut chekno libachew

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 8
Fewsin lesetachew libachewn molt’ew
Alut wenbede new seqelew seqelew

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 9
Kejuh bereketn yeteshamu hulu
Yichohu neber yigedel eyalu

CHORUS
Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '150f510f-c61d-4ba9-a3b1-bddadb9b6b0e'::uuid, 'yehaset-dagninet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ye-fikir-enat-ye-selam ("Ye Fikir Enat Ye Selam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '352ca3b1-ab77-45b6-bf94-d2ddc05baedc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 1
በህይወቴ ውስጥ በኑሮዬ
ቅደሚ ከፊት ከኃላዬ
ተደላደለ ልቤ
አንቺ አለሽና ካጠገቤ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 2
ምኞቴም ይስመር ትልቅ ህልሜ
ልለፍ ወጀቡን ተቋቁሜ
የጌታዬ እናት ነሽ
ሀይልን ያደርጋል ፀሎትሽ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 3
እንዴት ቀራለሁ ከመንገዴ
አደራ እናቴ አስቢኝ
ለሚያስጨንቀኝ ጠላት
ለሚያሳድደኝ አትስጪኝ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 4
ትናንትም ዛሬም አመስጋኝ ነኝ
የለም ለነገ የሚያስፈራኝ
ሜዳ ይሆናል ተራራ
ልጅሽ ስላለ ከኔ ጋራ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 5
እንዴት ቀራለሁ ከመንገዴ
አደራ እናቴ አስቢኝ
ለሚያስጨንቀኝ ጠላት
ለሚያሳድደኝ አትስጪኝ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 1
Behiywete wist be nuroye
Qidemi kefit kehwalaye
Tedeladele libe
Anchi aleshina katagebe

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 2
Mignotem yismer tilik hilme
Lilef wejebun tequaqme
Ye getaye enat nesh
Hayiln yadergal tselotsh

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 3
Endet qeralew ke mengede
Adera enate asbign
Lemiyaschenqegn telat
Lemiyasaddedegn atitshcighe

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 4
Tinantem zarem amesgagn nen
Yelem leneghe yemiyasferagn
Meda yihonal terrara
Lijish silale kene gara

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 5
Endet qeralew ke mengede
Adera enate asbign
Lemiyaschenqegn telat
Lemiyasaddedegn atitshcighe

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 1
በህይወቴ ውስጥ በኑሮዬ
ቅደሚ ከፊት ከኃላዬ
ተደላደለ ልቤ
አንቺ አለሽና ካጠገቤ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 2
ምኞቴም ይስመር ትልቅ ህልሜ
ልለፍ ወጀቡን ተቋቁሜ
የጌታዬ እናት ነሽ
ሀይልን ያደርጋል ፀሎትሽ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 3
እንዴት ቀራለሁ ከመንገዴ
አደራ እናቴ አስቢኝ
ለሚያስጨንቀኝ ጠላት
ለሚያሳድደኝ አትስጪኝ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 4
ትናንትም ዛሬም አመስጋኝ ነኝ
የለም ለነገ የሚያስፈራኝ
ሜዳ ይሆናል ተራራ
ልጅሽ ስላለ ከኔ ጋራ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 5
እንዴት ቀራለሁ ከመንገዴ
አደራ እናቴ አስቢኝ
ለሚያስጨንቀኝ ጠላት
ለሚያሳድደኝ አትስጪኝ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም',
        lyrics_transliteration = 'CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 1
Behiywete wist be nuroye
Qidemi kefit kehwalaye
Tedeladele libe
Anchi aleshina katagebe

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 2
Mignotem yismer tilik hilme
Lilef wejebun tequaqme
Ye getaye enat nesh
Hayiln yadergal tselotsh

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 3
Endet qeralew ke mengede
Adera enate asbign
Lemiyaschenqegn telat
Lemiyasaddedegn atitshcighe

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 4
Tinantem zarem amesgagn nen
Yelem leneghe yemiyasferagn
Meda yihonal terrara
Lijish silale kene gara

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 5
Endet qeralew ke mengede
Adera enate asbign
Lemiyaschenqegn telat
Lemiyasaddedegn atitshcighe

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam',
        updated_at = clock_timestamp()::text
    WHERE import_id = '352ca3b1-ab77-45b6-bf94-d2ddc05baedc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 1
በህይወቴ ውስጥ በኑሮዬ
ቅደሚ ከፊት ከኃላዬ
ተደላደለ ልቤ
አንቺ አለሽና ካጠገቤ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 2
ምኞቴም ይስመር ትልቅ ህልሜ
ልለፍ ወጀቡን ተቋቁሜ
የጌታዬ እናት ነሽ
ሀይልን ያደርጋል ፀሎትሽ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 3
እንዴት ቀራለሁ ከመንገዴ
አደራ እናቴ አስቢኝ
ለሚያስጨንቀኝ ጠላት
ለሚያሳድደኝ አትስጪኝ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 4
ትናንትም ዛሬም አመስጋኝ ነኝ
የለም ለነገ የሚያስፈራኝ
ሜዳ ይሆናል ተራራ
ልጅሽ ስላለ ከኔ ጋራ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 5
እንዴት ቀራለሁ ከመንገዴ
አደራ እናቴ አስቢኝ
ለሚያስጨንቀኝ ጠላት
ለሚያሳድደኝ አትስጪኝ

CHORUS
የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 1
Behiywete wist be nuroye
Qidemi kefit kehwalaye
Tedeladele libe
Anchi aleshina katagebe

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 2
Mignotem yismer tilik hilme
Lilef wejebun tequaqme
Ye getaye enat nesh
Hayiln yadergal tselotsh

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 3
Endet qeralew ke mengede
Adera enate asbign
Lemiyaschenqegn telat
Lemiyasaddedegn atitshcighe

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 4
Tinantem zarem amesgagn nen
Yelem leneghe yemiyasferagn
Meda yihonal terrara
Lijish silale kene gara

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 5
Endet qeralew ke mengede
Adera enate asbign
Lemiyaschenqegn telat
Lemiyasaddedegn atitshcighe

CHORUS
Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '352ca3b1-ab77-45b6-bf94-d2ddc05baedc'::uuid, 'ye-fikir-enat-ye-selam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yetamenk-yenefs-wodaj ("Yetamenk YeNefs Wodaj")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4f8b517c-2e96-4244-afca-6def3a891bb2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 1
ነበልባሉን ውሀ አደረግኸው
ሰንሰለቱን በጣጠስከው
የነደደው እሳት ጠፍቷል
ከእኛ ጋር ገብርኤል ቆሟል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 2
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 3
አዝ፡
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 4
ለድንግል ነገርህ ገብርኤል
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 5
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 6
ለድንግል ነገርህ ገብርኤል
አዝ፡
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 7
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 8
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 9
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ፡
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 10
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
በመዐልትና በሌሊት

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 11
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 12
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 1
Nebelbalun wuha aderegkew
Senseletun betateskew
Yenededew isat tefitwal
Ke-igna gar Gebriel qomal

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 2
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 3
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 4
Le-dingil negerih Gebriel
Ye-anabistun af zegahew
Wehiniwun anawetsikew
Be-hiywot menged yemitimera

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 5
Le-Igziabher hizb yemitirara
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 6
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 7
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Tselot yizo yemiweta
Mihiret yizo yemimeta

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 8
Zewetir yemiyay ye-amlakun fit
Qidus Gebriel liqe melaikt
Melaiktun besemay Gebriel
Indaregagah Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 9
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 10
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Bemealtina belelit

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 11
Yemiyadinen ketifat
Zuriyachinin yemisefir
Yemiyamalid ke-Igziabher
Melaiktun besemay Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 12
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 1
ነበልባሉን ውሀ አደረግኸው
ሰንሰለቱን በጣጠስከው
የነደደው እሳት ጠፍቷል
ከእኛ ጋር ገብርኤል ቆሟል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 2
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 3
አዝ፡
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 4
ለድንግል ነገርህ ገብርኤል
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 5
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 6
ለድንግል ነገርህ ገብርኤል
አዝ፡
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 7
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 8
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 9
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ፡
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 10
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
በመዐልትና በሌሊት

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 11
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 12
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር',
        lyrics_transliteration = 'CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 1
Nebelbalun wuha aderegkew
Senseletun betateskew
Yenededew isat tefitwal
Ke-igna gar Gebriel qomal

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 2
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 3
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 4
Le-dingil negerih Gebriel
Ye-anabistun af zegahew
Wehiniwun anawetsikew
Be-hiywot menged yemitimera

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 5
Le-Igziabher hizb yemitirara
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 6
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 7
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Tselot yizo yemiweta
Mihiret yizo yemimeta

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 8
Zewetir yemiyay ye-amlakun fit
Qidus Gebriel liqe melaikt
Melaiktun besemay Gebriel
Indaregagah Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 9
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 10
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Bemealtina belelit

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 11
Yemiyadinen ketifat
Zuriyachinin yemisefir
Yemiyamalid ke-Igziabher
Melaiktun besemay Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 12
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4f8b517c-2e96-4244-afca-6def3a891bb2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 1
ነበልባሉን ውሀ አደረግኸው
ሰንሰለቱን በጣጠስከው
የነደደው እሳት ጠፍቷል
ከእኛ ጋር ገብርኤል ቆሟል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 2
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 3
አዝ፡
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 4
ለድንግል ነገርህ ገብርኤል
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 5
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 6
ለድንግል ነገርህ ገብርኤል
አዝ፡
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 7
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 8
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 9
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ፡
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 10
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
በመዐልትና በሌሊት

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 11
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 12
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 1
Nebelbalun wuha aderegkew
Senseletun betateskew
Yenededew isat tefitwal
Ke-igna gar Gebriel qomal

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 2
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 3
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 4
Le-dingil negerih Gebriel
Ye-anabistun af zegahew
Wehiniwun anawetsikew
Be-hiywot menged yemitimera

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 5
Le-Igziabher hizb yemitirara
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 6
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 7
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Tselot yizo yemiweta
Mihiret yizo yemimeta

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 8
Zewetir yemiyay ye-amlakun fit
Qidus Gebriel liqe melaikt
Melaiktun besemay Gebriel
Indaregagah Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 9
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 10
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Bemealtina belelit

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 11
Yemiyadinen ketifat
Zuriyachinin yemisefir
Yemiyamalid ke-Igziabher
Melaiktun besemay Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 12
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4f8b517c-2e96-4244-afca-6def3a891bb2'::uuid, 'yetamenk-yenefs-wodaj', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yesimu-tirguame ("Yesimu Tirguame")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '359230d3-1bd1-409b-9947-2bbf8dc3de65'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 1
እኛን የሚረዳን ዘወትር በምልጃው
የመላዕክት አለቃ ቅዱስ ሚካኤል ነው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 2
ከጉድጓድ ተጥሎ ፍጹም ከሚያስፈራው
ከተራቡ አናብስት ዳንኤልን ያዳንከው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 3
እኛንም ተራዳን ቸል አትበለን
ሰይጣን በተንኮሉ ወጥመድ ሳይጥለን

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 4
የክፉ ሰው ስራው ክፉ ሐሳብ ነውና
በቅንነት መንገድ ከቶ አይሄድምና

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 5
የሞቱን ደብዳቤ ለባህራን ሲሰጠው
ሚካኤል አጥፍቶ በደስታ ለወጠው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 6
ገና ብላቴና ሳለሁ አንድ ፍሬ
ሰው ሁሉ ሲንቀኝ ምስጋናን ጀምሬ

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 7
ጸጋዬን አብዝቶ ያበቃኝ ለዚህ ክብር
የሚካኤል አምላክ ይመስገን እግዚአብሔር

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 1
Enyan yemiredan zawit’r bemilijaw
Yemela’ikt aleqa Kidus Mikael new

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 2
Kegudgwad tet’lo fits’um kemiyasferaw
Keterabu anabist Danieln yadanekew

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 3
Enyanem teradan chel at’belen
Seytan betenkolu wet’med sayit’len

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 4
Yekifu sew siraw kifu hasab newna
Beqinnet menged keto ayhedimna

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 5
Yemotun debdabe lebahran siset’ew
Mikael at’fito bedest’a lewet’ew

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 6
Gena bilatena salehu and firé
Sew hulu sinqegn misganan jemré

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 7
Tsegayen abzito yabekagn lezih kibir
YeMikael Amlak yimesgen Egziabher

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 1
እኛን የሚረዳን ዘወትር በምልጃው
የመላዕክት አለቃ ቅዱስ ሚካኤል ነው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 2
ከጉድጓድ ተጥሎ ፍጹም ከሚያስፈራው
ከተራቡ አናብስት ዳንኤልን ያዳንከው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 3
እኛንም ተራዳን ቸል አትበለን
ሰይጣን በተንኮሉ ወጥመድ ሳይጥለን

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 4
የክፉ ሰው ስራው ክፉ ሐሳብ ነውና
በቅንነት መንገድ ከቶ አይሄድምና

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 5
የሞቱን ደብዳቤ ለባህራን ሲሰጠው
ሚካኤል አጥፍቶ በደስታ ለወጠው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 6
ገና ብላቴና ሳለሁ አንድ ፍሬ
ሰው ሁሉ ሲንቀኝ ምስጋናን ጀምሬ

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 7
ጸጋዬን አብዝቶ ያበቃኝ ለዚህ ክብር
የሚካኤል አምላክ ይመስገን እግዚአብሔር

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው',
        lyrics_transliteration = 'CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 1
Enyan yemiredan zawit’r bemilijaw
Yemela’ikt aleqa Kidus Mikael new

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 2
Kegudgwad tet’lo fits’um kemiyasferaw
Keterabu anabist Danieln yadanekew

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 3
Enyanem teradan chel at’belen
Seytan betenkolu wet’med sayit’len

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 4
Yekifu sew siraw kifu hasab newna
Beqinnet menged keto ayhedimna

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 5
Yemotun debdabe lebahran siset’ew
Mikael at’fito bedest’a lewet’ew

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 6
Gena bilatena salehu and firé
Sew hulu sinqegn misganan jemré

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 7
Tsegayen abzito yabekagn lezih kibir
YeMikael Amlak yimesgen Egziabher

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '359230d3-1bd1-409b-9947-2bbf8dc3de65'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 1
እኛን የሚረዳን ዘወትር በምልጃው
የመላዕክት አለቃ ቅዱስ ሚካኤል ነው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 2
ከጉድጓድ ተጥሎ ፍጹም ከሚያስፈራው
ከተራቡ አናብስት ዳንኤልን ያዳንከው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 3
እኛንም ተራዳን ቸል አትበለን
ሰይጣን በተንኮሉ ወጥመድ ሳይጥለን

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 4
የክፉ ሰው ስራው ክፉ ሐሳብ ነውና
በቅንነት መንገድ ከቶ አይሄድምና

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 5
የሞቱን ደብዳቤ ለባህራን ሲሰጠው
ሚካኤል አጥፍቶ በደስታ ለወጠው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 6
ገና ብላቴና ሳለሁ አንድ ፍሬ
ሰው ሁሉ ሲንቀኝ ምስጋናን ጀምሬ

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 7
ጸጋዬን አብዝቶ ያበቃኝ ለዚህ ክብር
የሚካኤል አምላክ ይመስገን እግዚአብሔር

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 1
Enyan yemiredan zawit’r bemilijaw
Yemela’ikt aleqa Kidus Mikael new

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 2
Kegudgwad tet’lo fits’um kemiyasferaw
Keterabu anabist Danieln yadanekew

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 3
Enyanem teradan chel at’belen
Seytan betenkolu wet’med sayit’len

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 4
Yekifu sew siraw kifu hasab newna
Beqinnet menged keto ayhedimna

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 5
Yemotun debdabe lebahran siset’ew
Mikael at’fito bedest’a lewet’ew

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 6
Gena bilatena salehu and firé
Sew hulu sinqegn misganan jemré

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 7
Tsegayen abzito yabekagn lezih kibir
YeMikael Amlak yimesgen Egziabher

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '359230d3-1bd1-409b-9947-2bbf8dc3de65'::uuid, 'yesimu-tirguame', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yibae ("Yibae")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a318fe95-1e92-48b0-b570-d7b42a3ea036'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/

VERSE 1
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/

CHORUS
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
yba nguse sbhet /2/
yba emlake mhret /4/

VERSE 1
yba nguse sbhet /2/
yba emlake mhret /4/

CHORUS
yba nguse sbhet /2/
yba emlake mhret /4/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/

VERSE 1
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/

CHORUS
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/',
        lyrics_transliteration = 'CHORUS
yba nguse sbhet /2/
yba emlake mhret /4/

VERSE 1
yba nguse sbhet /2/
yba emlake mhret /4/

CHORUS
yba nguse sbhet /2/
yba emlake mhret /4/',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a318fe95-1e92-48b0-b570-d7b42a3ea036'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/

VERSE 1
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/

CHORUS
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
yba nguse sbhet /2/
yba emlake mhret /4/

VERSE 1
yba nguse sbhet /2/
yba emlake mhret /4/

CHORUS
yba nguse sbhet /2/
yba emlake mhret /4/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a318fe95-1e92-48b0-b570-d7b42a3ea036'::uuid, 'yibae', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- you-are-without-fault ("You Are Without Fault")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3aa79379-e4f2-485b-bd92-3c9433054416'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)

VERSE 1
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)

CHORUS
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat

VERSE 1
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat

CHORUS
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)

VERSE 1
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)

CHORUS
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)',
        lyrics_transliteration = 'CHORUS
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat

VERSE 1
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat

CHORUS
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3aa79379-e4f2-485b-bd92-3c9433054416'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3aa79379-e4f2-485b-bd92-3c9433054416'::uuid, 'you-are-without-fault', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yomse-leiliyaye ("Yomse Le’iliyaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '156480b2-4c55-4e3f-992d-46d6e8c65b3c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)

VERSE 1
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)

CHORUS
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)

VERSE 1
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)

CHORUS
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)

VERSE 1
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)

CHORUS
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)',
        lyrics_transliteration = 'CHORUS
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)

VERSE 1
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)

CHORUS
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '156480b2-4c55-4e3f-992d-46d6e8c65b3c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)

VERSE 1
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)

CHORUS
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)

VERSE 1
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)

CHORUS
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '156480b2-4c55-4e3f-992d-46d6e8c65b3c'::uuid, 'yomse-leiliyaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yom-fisha-kone ("Yom Fisha Kone")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8433e161-f5ba-460f-9659-e97f0a0289c6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)

VERSE 1
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)

CHORUS
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)

VERSE 1
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)

CHORUS
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)

VERSE 1
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)

CHORUS
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)',
        lyrics_transliteration = 'CHORUS
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)

VERSE 1
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)

CHORUS
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8433e161-f5ba-460f-9659-e97f0a0289c6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)

VERSE 1
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)

CHORUS
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)

VERSE 1
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)

CHORUS
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8433e161-f5ba-460f-9659-e97f0a0289c6'::uuid, 'yom-fisha-kone', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- o-fitune-rediet-leberutawit-yederese ("O Fitune Rediet Leberutawit Yederese")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6d6572c4-27d4-4648-ada8-24248c51dfb8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 1
ስጋው ሲመተር አልፈራም እሱ
ሰባት አክሊላት ጭኗል በራሱ
በደብረ ይድራስ በዛ ተራራ
የልዳው ፀሐይ ተብሎ ተጠራ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 2
አለምን ስትዞር በነጭ ፈረስ
አንድ ጊዜ እርዳኝ ጊዮርጊስ ድረስ
ስሙን ለጠራ አምላከ ጊዮርጊስ
ስደርስ ይፈጥናል ከአውሎ ነፋስ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 3
ለእሳት ለግለት ስጋውን ሲሰጥ
ፍርሃት የለበት ወይም መደንገጥ
ኡዲያኖስ አፍሮ ጣኦት ወደቀ
በጊዮርጊስ ፅናት ጌታ ታወቀ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 4
ከሹመት ይልቅ መርጠህ መከራ
ወንጌሉን ሰበክ አንዳች ሳትፈራ
በጭንቀት ሆነ ላንተ ንግስት
ብድራትህን አይተሃል እና

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 5
መስተጋድል ነህ ሃያል ገናና
መክብበ ሰማዕት የእምነት ጀግና
ስምክን ስጠራ ከቤትህ ቆሜ
ይቀልልኛል የኃጥያት ሸክሜ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 1
Sigaw simeter alferam esu
Sebat aklilat ch’nwal berasu
Bedebre yidras beza terara
Yeldaw ts’ehey teblo tet’era

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 2
Alemn sitzor benech’ feres
And gize erdagn Giyorgis dires
Simun let’era amlake Giyorgis
Siders yifet’nal keawlo nefas

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 3
Leesat leglet sigawn siset’
Firhat yelebet weym medenget’
Udiyanos afro t’aot wedeqe
Begiyorgis ts’nat Geta taweqe

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 4
Keshumet yilq mert’eh mekera
Wengelun sebek andach satfera
Bech’nqet hone lante nigst
Bidrathn aytehal ena

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 5
Mestegadl neh hayal genana
Mekbbe semaet yeemnet jegna
Simkn sit’era kebeth qome
Yiqellgnal yehat’yat shekme

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 1
ስጋው ሲመተር አልፈራም እሱ
ሰባት አክሊላት ጭኗል በራሱ
በደብረ ይድራስ በዛ ተራራ
የልዳው ፀሐይ ተብሎ ተጠራ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 2
አለምን ስትዞር በነጭ ፈረስ
አንድ ጊዜ እርዳኝ ጊዮርጊስ ድረስ
ስሙን ለጠራ አምላከ ጊዮርጊስ
ስደርስ ይፈጥናል ከአውሎ ነፋስ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 3
ለእሳት ለግለት ስጋውን ሲሰጥ
ፍርሃት የለበት ወይም መደንገጥ
ኡዲያኖስ አፍሮ ጣኦት ወደቀ
በጊዮርጊስ ፅናት ጌታ ታወቀ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 4
ከሹመት ይልቅ መርጠህ መከራ
ወንጌሉን ሰበክ አንዳች ሳትፈራ
በጭንቀት ሆነ ላንተ ንግስት
ብድራትህን አይተሃል እና

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 5
መስተጋድል ነህ ሃያል ገናና
መክብበ ሰማዕት የእምነት ጀግና
ስምክን ስጠራ ከቤትህ ቆሜ
ይቀልልኛል የኃጥያት ሸክሜ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ',
        lyrics_transliteration = 'CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 1
Sigaw simeter alferam esu
Sebat aklilat ch’nwal berasu
Bedebre yidras beza terara
Yeldaw ts’ehey teblo tet’era

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 2
Alemn sitzor benech’ feres
And gize erdagn Giyorgis dires
Simun let’era amlake Giyorgis
Siders yifet’nal keawlo nefas

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 3
Leesat leglet sigawn siset’
Firhat yelebet weym medenget’
Udiyanos afro t’aot wedeqe
Begiyorgis ts’nat Geta taweqe

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 4
Keshumet yilq mert’eh mekera
Wengelun sebek andach satfera
Bech’nqet hone lante nigst
Bidrathn aytehal ena

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 5
Mestegadl neh hayal genana
Mekbbe semaet yeemnet jegna
Simkn sit’era kebeth qome
Yiqellgnal yehat’yat shekme

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6d6572c4-27d4-4648-ada8-24248c51dfb8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 1
ስጋው ሲመተር አልፈራም እሱ
ሰባት አክሊላት ጭኗል በራሱ
በደብረ ይድራስ በዛ ተራራ
የልዳው ፀሐይ ተብሎ ተጠራ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 2
አለምን ስትዞር በነጭ ፈረስ
አንድ ጊዜ እርዳኝ ጊዮርጊስ ድረስ
ስሙን ለጠራ አምላከ ጊዮርጊስ
ስደርስ ይፈጥናል ከአውሎ ነፋስ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 3
ለእሳት ለግለት ስጋውን ሲሰጥ
ፍርሃት የለበት ወይም መደንገጥ
ኡዲያኖስ አፍሮ ጣኦት ወደቀ
በጊዮርጊስ ፅናት ጌታ ታወቀ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 4
ከሹመት ይልቅ መርጠህ መከራ
ወንጌሉን ሰበክ አንዳች ሳትፈራ
በጭንቀት ሆነ ላንተ ንግስት
ብድራትህን አይተሃል እና

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 5
መስተጋድል ነህ ሃያል ገናና
መክብበ ሰማዕት የእምነት ጀግና
ስምክን ስጠራ ከቤትህ ቆሜ
ይቀልልኛል የኃጥያት ሸክሜ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6d6572c4-27d4-4648-ada8-24248c51dfb8'::uuid, 'o-fitune-rediet-leberutawit-yederese', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- you-who-saved-from-fire ("You Who Saved From Fire")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bb1f81b9-9fdf-4bfe-bca1-fba1a2fce2fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange

VERSE 1
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange

CHORUS
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange

VERSE 1
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange

CHORUS
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bb1f81b9-9fdf-4bfe-bca1-fba1a2fce2fc'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange

VERSE 1
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange

CHORUS
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bb1f81b9-9fdf-4bfe-bca1-fba1a2fce2fc'::uuid, 'you-who-saved-from-fire', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- your-love-allured-me ("Your Love Allured Me")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '50b88f2f-47cf-4f76-9d52-63a8feeb7490'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ

VERSE 1
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

VERSE 1
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

CHORUS
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ

VERSE 1
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ',
        lyrics_transliteration = 'CHORUS
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

VERSE 1
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

CHORUS
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene',
        updated_at = clock_timestamp()::text
    WHERE import_id = '50b88f2f-47cf-4f76-9d52-63a8feeb7490'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ

VERSE 1
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

VERSE 1
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

CHORUS
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '50b88f2f-47cf-4f76-9d52-63a8feeb7490'::uuid, 'your-love-allured-me', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zeawredke-mena ("Ze’awredke Mena")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3b5ee95c-5480-4fe3-adf5-8ca982516e5b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተኑ ሚካኤል መና መና ዘአውረድከ፣
ወአንተኑ ለእስራኤል መና ዘአውረድከ።

VERSE 1
ዘአውረድከ መና (፪)
ሚካኤል (፪) ዘአውረድከ መና።

CHORUS
አንተኑ ሚካኤል መና መና ዘአውረድከ፣
ወአንተኑ ለእስራኤል መና ዘአውረድከ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Antenu Mika’el mena mena ze’awredke,
We antenu le’Isra’el mena ze’awredke.

VERSE 1
Ze’awredke mena (x2)
Mika’el (x2) ze’awredke mena.

CHORUS
Antenu Mika’el mena mena ze’awredke,
We antenu le’Isra’el mena ze’awredke.'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንተኑ ሚካኤል መና መና ዘአውረድከ፣
ወአንተኑ ለእስራኤል መና ዘአውረድከ።

VERSE 1
ዘአውረድከ መና (፪)
ሚካኤል (፪) ዘአውረድከ መና።

CHORUS
አንተኑ ሚካኤል መና መና ዘአውረድከ፣
ወአንተኑ ለእስራኤል መና ዘአውረድከ።',
        lyrics_transliteration = 'CHORUS
Antenu Mika’el mena mena ze’awredke,
We antenu le’Isra’el mena ze’awredke.

VERSE 1
Ze’awredke mena (x2)
Mika’el (x2) ze’awredke mena.

CHORUS
Antenu Mika’el mena mena ze’awredke,
We antenu le’Isra’el mena ze’awredke.',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3b5ee95c-5480-4fe3-adf5-8ca982516e5b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተኑ ሚካኤል መና መና ዘአውረድከ፣
ወአንተኑ ለእስራኤል መና ዘአውረድከ።

VERSE 1
ዘአውረድከ መና (፪)
ሚካኤል (፪) ዘአውረድከ መና።

CHORUS
አንተኑ ሚካኤል መና መና ዘአውረድከ፣
ወአንተኑ ለእስራኤል መና ዘአውረድከ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Antenu Mika’el mena mena ze’awredke,
We antenu le’Isra’el mena ze’awredke.

VERSE 1
Ze’awredke mena (x2)
Mika’el (x2) ze’awredke mena.

CHORUS
Antenu Mika’el mena mena ze’awredke,
We antenu le’Isra’el mena ze’awredke.';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3b5ee95c-5480-4fe3-adf5-8ca982516e5b'::uuid, 'zeawredke-mena', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- youre-the-soul-for-my-soul ("You’re the Soul for My Soul")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6458f959-735c-41c9-a775-0abc1f1c9adb'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 1
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 2
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 3
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 4
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 5
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 6
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Lenefese nefeswa nesh, lemengede fana
Endaltefa amnalew, yanchi lij negna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 1
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 2
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 3
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 4
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 5
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 6
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna',
        lyrics_transliteration = 'Lenefese nefeswa nesh, lemengede fana
Endaltefa amnalew, yanchi lij negna',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6458f959-735c-41c9-a775-0abc1f1c9adb'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 1
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 2
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 3
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 4
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 5
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 6
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Lenefese nefeswa nesh, lemengede fana
Endaltefa amnalew, yanchi lij negna';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6458f959-735c-41c9-a775-0abc1f1c9adb'::uuid, 'youre-the-soul-for-my-soul', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- natti-dumessus-samini-faarfattu-fasika-makonin-orthodox ("Natti Dumessus Samini Faarfattu Fasika Makonin Orthodox")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e8804742-e7d2-4b7c-89a8-42691b13b61c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 1
Qileensaani kan hin dhaamne dungoon koo
Kiristoosi afuurri jireenyako
+++
Isatti of kennetan ba’aa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 2
Isatti hirkadheetan galaa
Egdu dhoksaa qaba naafu
Bara kootti anaan kan na egu
Anaaf ifakooti waaqayyooni

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 3
Kan na sodaachisu Kan na naassisu enyu?
++++
Biyya ormaa ta’ee qofaakoo
Fira naaf ta’e abbaankoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 4
Kiristoos anaf jirenyadhaa
Isatti of kennetan jiraadhaa
Kan sodhaadhu hin jiru barakootti
Ifa jireenyakoo anaaf waaqa kooti

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 5
++++
Anaan hin kennu dinatti
Hin angomu duti narratti
Mara Kan na egu goftaadhaa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 6
Kan natti darbu dina kamidhaa
Dhigatu mullataa saanqaa manakooirratti
kan addan na baasu enyu waaqakoo irra
+++++

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 7
Kunoo na dhaabe manasaa anan na ege afuurrisaa
Anan kabajuuf inni of kenne
Na bite goftaan du’a koo du’e
Maqaasaaf haa bitamu fonkoof afurkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 8
Isaan waan ta’efi yonaanis ga’unkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 1
Qileensaani kan hin dhaamne dungoon koo
Kiristoosi afuurri jireenyako
+++
Isatti of kennetan ba’aa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 2
Isatti hirkadheetan galaa
Egdu dhoksaa qaba naafu
Bara kootti anaan kan na egu
Anaaf ifakooti waaqayyooni

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 3
Kan na sodaachisu Kan na naassisu enyu?
++++
Biyya ormaa ta’ee qofaakoo
Fira naaf ta’e abbaankoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 4
Kiristoos anaf jirenyadhaa
Isatti of kennetan jiraadhaa
Kan sodhaadhu hin jiru barakootti
Ifa jireenyakoo anaaf waaqa kooti

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 5
++++
Anaan hin kennu dinatti
Hin angomu duti narratti
Mara Kan na egu goftaadhaa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 6
Kan natti darbu dina kamidhaa
Dhigatu mullataa saanqaa manakooirratti
Kan addan na baasu enyu waaqakoo irra
+++++

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 7
Kunoo na dhaabe manasaa anan na ege afuurrisaa
Anan kabajuuf inni of kenne
Na bite goftaan du’a koo du’e
Maqaasaaf haa bitamu fonkoof afurkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 8
Isaan waan ta’efi yonaanis ga’unkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 1
Qileensaani kan hin dhaamne dungoon koo
Kiristoosi afuurri jireenyako
+++
Isatti of kennetan ba’aa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 2
Isatti hirkadheetan galaa
Egdu dhoksaa qaba naafu
Bara kootti anaan kan na egu
Anaaf ifakooti waaqayyooni

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 3
Kan na sodaachisu Kan na naassisu enyu?
++++
Biyya ormaa ta’ee qofaakoo
Fira naaf ta’e abbaankoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 4
Kiristoos anaf jirenyadhaa
Isatti of kennetan jiraadhaa
Kan sodhaadhu hin jiru barakootti
Ifa jireenyakoo anaaf waaqa kooti

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 5
++++
Anaan hin kennu dinatti
Hin angomu duti narratti
Mara Kan na egu goftaadhaa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 6
Kan natti darbu dina kamidhaa
Dhigatu mullataa saanqaa manakooirratti
kan addan na baasu enyu waaqakoo irra
+++++

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 7
Kunoo na dhaabe manasaa anan na ege afuurrisaa
Anan kabajuuf inni of kenne
Na bite goftaan du’a koo du’e
Maqaasaaf haa bitamu fonkoof afurkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 8
Isaan waan ta’efi yonaanis ga’unkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako',
        lyrics_transliteration = 'CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 1
Qileensaani kan hin dhaamne dungoon koo
Kiristoosi afuurri jireenyako
+++
Isatti of kennetan ba’aa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 2
Isatti hirkadheetan galaa
Egdu dhoksaa qaba naafu
Bara kootti anaan kan na egu
Anaaf ifakooti waaqayyooni

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 3
Kan na sodaachisu Kan na naassisu enyu?
++++
Biyya ormaa ta’ee qofaakoo
Fira naaf ta’e abbaankoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 4
Kiristoos anaf jirenyadhaa
Isatti of kennetan jiraadhaa
Kan sodhaadhu hin jiru barakootti
Ifa jireenyakoo anaaf waaqa kooti

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 5
++++
Anaan hin kennu dinatti
Hin angomu duti narratti
Mara Kan na egu goftaadhaa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 6
Kan natti darbu dina kamidhaa
Dhigatu mullataa saanqaa manakooirratti
Kan addan na baasu enyu waaqakoo irra
+++++

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 7
Kunoo na dhaabe manasaa anan na ege afuurrisaa
Anan kabajuuf inni of kenne
Na bite goftaan du’a koo du’e
Maqaasaaf haa bitamu fonkoof afurkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 8
Isaan waan ta’efi yonaanis ga’unkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e8804742-e7d2-4b7c-89a8-42691b13b61c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 1
Qileensaani kan hin dhaamne dungoon koo
Kiristoosi afuurri jireenyako
+++
Isatti of kennetan ba’aa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 2
Isatti hirkadheetan galaa
Egdu dhoksaa qaba naafu
Bara kootti anaan kan na egu
Anaaf ifakooti waaqayyooni

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 3
Kan na sodaachisu Kan na naassisu enyu?
++++
Biyya ormaa ta’ee qofaakoo
Fira naaf ta’e abbaankoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 4
Kiristoos anaf jirenyadhaa
Isatti of kennetan jiraadhaa
Kan sodhaadhu hin jiru barakootti
Ifa jireenyakoo anaaf waaqa kooti

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 5
++++
Anaan hin kennu dinatti
Hin angomu duti narratti
Mara Kan na egu goftaadhaa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 6
Kan natti darbu dina kamidhaa
Dhigatu mullataa saanqaa manakooirratti
kan addan na baasu enyu waaqakoo irra
+++++

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 7
Kunoo na dhaabe manasaa anan na ege afuurrisaa
Anan kabajuuf inni of kenne
Na bite goftaan du’a koo du’e
Maqaasaaf haa bitamu fonkoof afurkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 8
Isaan waan ta’efi yonaanis ga’unkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e8804742-e7d2-4b7c-89a8-42691b13b61c'::uuid, 'natti-dumessus-samini-faarfattu-fasika-makonin-orthodox', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- meskel-abeba-wub-abeba ("Meskel Abeba Neh Wub Abeba")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '415072aa-8e10-419c-9afa-709b9cdfc7a7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 1
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 2
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 3
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 4
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 5
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 6
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 7
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 8
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 1
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 2
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 3
Meskel abeba tiragiwun moltew
Adey abeba Ayihud be-kifat
Meskel abeba tisu segede
Adey abeba Meskel kalebet

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 4
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 5
Meskel abeba wenzu jiretu
Adey abeba sheleqo duru
Meskel abeba ashebirqew demqew
Adey abeba lante mesekeru

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 6
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 7
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 8
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 1
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 2
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 3
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 4
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 5
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 6
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 7
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 8
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ',
        lyrics_transliteration = 'CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 1
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 2
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 3
Meskel abeba tiragiwun moltew
Adey abeba Ayihud be-kifat
Meskel abeba tisu segede
Adey abeba Meskel kalebet

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 4
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 5
Meskel abeba wenzu jiretu
Adey abeba sheleqo duru
Meskel abeba ashebirqew demqew
Adey abeba lante mesekeru

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 6
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 7
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 8
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba',
        updated_at = clock_timestamp()::text
    WHERE import_id = '415072aa-8e10-419c-9afa-709b9cdfc7a7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 1
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 2
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 3
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 4
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 5
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 6
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 7
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 8
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 1
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 2
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 3
Meskel abeba tiragiwun moltew
Adey abeba Ayihud be-kifat
Meskel abeba tisu segede
Adey abeba Meskel kalebet

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 4
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 5
Meskel abeba wenzu jiretu
Adey abeba sheleqo duru
Meskel abeba ashebirqew demqew
Adey abeba lante mesekeru

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 6
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 7
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 8
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '415072aa-8e10-419c-9afa-709b9cdfc7a7'::uuid, 'meskel-abeba-wub-abeba', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariam-aregalech ("Mariam Aregalech")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6ee06eb2-88e8-44f2-afd2-45a421726850'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 1
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
ዐርገች በእልልታ ድንግል የእኛ እናት
ዐርጋለች ማርያም ተነሥታለች

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 2
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ ዐርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 3
ዐርጋለች ማርያም ተነሥታለች
የአምላክ ማደሪያ ያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 4
ተነሥተዋል በክብር በእምነት አየናቸው
ዐርጋለች ማርያም ተነሥታለች
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር ዐረገች ማርያም ሞገሳችሁ

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 5
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል ዕርገቱዋን ንገሩ ተግታችሁ
ዐርጋለች ማርያም ተነሥታለች

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 1
Werqun tegonats’fa beqegnu litqom
Wede amlak maderiya wede semayat
Argech beellta Dingil yeegna enat
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 2
Semayat yikefet demenam yizerga
Zimtam aynorm eme amlak arga
Andebet yikefet Maryamn yamesgn
Kezelealem t’fat bemljawa endndn

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 3
Argalech Maryam tenestalech
Yeamlak maderiya ya Kidus sigash
Amlakn yaqefut eneziya ejochsh
Musna meqabr yizo alasqerachew

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 4
Tenestewal bekbr beemnet ayenachew
Argalech Maryam tenestalech
Hewaryat abew enkwan des alachhu
Bekbr aregech Maryam mogesachhu

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 5
Wede alemm wit’u sebenuwan yizachhu
Yedngl ergetuwan nigeru tegtachhu
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 1
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
ዐርገች በእልልታ ድንግል የእኛ እናት
ዐርጋለች ማርያም ተነሥታለች

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 2
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ ዐርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 3
ዐርጋለች ማርያም ተነሥታለች
የአምላክ ማደሪያ ያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 4
ተነሥተዋል በክብር በእምነት አየናቸው
ዐርጋለች ማርያም ተነሥታለች
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር ዐረገች ማርያም ሞገሳችሁ

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 5
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል ዕርገቱዋን ንገሩ ተግታችሁ
ዐርጋለች ማርያም ተነሥታለች

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም',
        lyrics_transliteration = 'CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 1
Werqun tegonats’fa beqegnu litqom
Wede amlak maderiya wede semayat
Argech beellta Dingil yeegna enat
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 2
Semayat yikefet demenam yizerga
Zimtam aynorm eme amlak arga
Andebet yikefet Maryamn yamesgn
Kezelealem t’fat bemljawa endndn

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 3
Argalech Maryam tenestalech
Yeamlak maderiya ya Kidus sigash
Amlakn yaqefut eneziya ejochsh
Musna meqabr yizo alasqerachew

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 4
Tenestewal bekbr beemnet ayenachew
Argalech Maryam tenestalech
Hewaryat abew enkwan des alachhu
Bekbr aregech Maryam mogesachhu

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 5
Wede alemm wit’u sebenuwan yizachhu
Yedngl ergetuwan nigeru tegtachhu
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6ee06eb2-88e8-44f2-afd2-45a421726850'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 1
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
ዐርገች በእልልታ ድንግል የእኛ እናት
ዐርጋለች ማርያም ተነሥታለች

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 2
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ ዐርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 3
ዐርጋለች ማርያም ተነሥታለች
የአምላክ ማደሪያ ያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 4
ተነሥተዋል በክብር በእምነት አየናቸው
ዐርጋለች ማርያም ተነሥታለች
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር ዐረገች ማርያም ሞገሳችሁ

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 5
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል ዕርገቱዋን ንገሩ ተግታችሁ
ዐርጋለች ማርያም ተነሥታለች

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6ee06eb2-88e8-44f2-afd2-45a421726850'::uuid, 'mariam-aregalech', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
