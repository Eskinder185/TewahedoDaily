-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 21 OF 32
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
  -- nitsuh-bahetawi-deacon-zemari-endale-dereje ("nitsuh bahetawi deacon zemari endale dereje")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9a4b09ca-77a4-41d8-9b5c-081dd969118f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 1
ንጹህ ባህታዊ እውነተኛ አገልጋይ
ገብረ መንፈስ ቅዱስ ሆነ ለእኛ ሲሳይ
ኢትዮጵያን ማርልኝ ብለህ እየለመንክ
በዝቋላ ባህር መቶ ዓመት ጸለይክ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 2
የእምነት ወታደር የፀሎት ወዳጅ
የአቅሌስያ ፀጋ የስምዖን ልጅ
ዝናህ እጅግ ሰፍቶ ተሰማ በአለም
ጻድቅ ሐዋርያ የፍቅር የሠላም

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 3
ፀበልህን ጠጣሁ ከደጅህ ደርሼ
ከህመሜ ዳንኩኝ በእምነትህ ታብሼ
አንበሳና ነብር የሚታዘዙልህ
ገብረ መንፈስ ቅዱስ ልዩ ነው ተጋድሎህ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 4
ግብፅም ትናገረው ታላቋ በህንሳ
የወንጌል መምህር የተዋህዶ አንበሳ
ምስራች ነጋሪ የጽድቅ ባለሙያ
በረከትህ በዝቷል በኢትዮጵያ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 1
Nits’uh bahtawi ewnetegna agelgay
Gebre menfes Kidus hone leegna sisay
Ityop’yan marlgn bileh eyelemenk
Bezqwala bahr meto amet ts’eleyk

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 2
Yeemnet wetader yets’elot wedaj
Yeaqlesya ts’ega yesmon lij
Zinah ejg sefto tesema bealem
Ts’adq hewarya yefqr yeselam

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 3
Ts’ebelhn t’et’ahu kedejh dershe
Kehmeme dankugn beemneth tabshe
Anbesana nebr yemitazezulh
Gebre menfes Kidus liyu new tegadloh

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 4
Gibts’m tinagerew talaqwa behnsa
Yewengel memhr yetewahdo anbesa
Misrach negari yets’dq balemuya
Bereketh beztwal beityop’ya

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 1
ንጹህ ባህታዊ እውነተኛ አገልጋይ
ገብረ መንፈስ ቅዱስ ሆነ ለእኛ ሲሳይ
ኢትዮጵያን ማርልኝ ብለህ እየለመንክ
በዝቋላ ባህር መቶ ዓመት ጸለይክ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 2
የእምነት ወታደር የፀሎት ወዳጅ
የአቅሌስያ ፀጋ የስምዖን ልጅ
ዝናህ እጅግ ሰፍቶ ተሰማ በአለም
ጻድቅ ሐዋርያ የፍቅር የሠላም

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 3
ፀበልህን ጠጣሁ ከደጅህ ደርሼ
ከህመሜ ዳንኩኝ በእምነትህ ታብሼ
አንበሳና ነብር የሚታዘዙልህ
ገብረ መንፈስ ቅዱስ ልዩ ነው ተጋድሎህ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 4
ግብፅም ትናገረው ታላቋ በህንሳ
የወንጌል መምህር የተዋህዶ አንበሳ
ምስራች ነጋሪ የጽድቅ ባለሙያ
በረከትህ በዝቷል በኢትዮጵያ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል',
        lyrics_transliteration = 'CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 1
Nits’uh bahtawi ewnetegna agelgay
Gebre menfes Kidus hone leegna sisay
Ityop’yan marlgn bileh eyelemenk
Bezqwala bahr meto amet ts’eleyk

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 2
Yeemnet wetader yets’elot wedaj
Yeaqlesya ts’ega yesmon lij
Zinah ejg sefto tesema bealem
Ts’adq hewarya yefqr yeselam

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 3
Ts’ebelhn t’et’ahu kedejh dershe
Kehmeme dankugn beemneth tabshe
Anbesana nebr yemitazezulh
Gebre menfes Kidus liyu new tegadloh

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 4
Gibts’m tinagerew talaqwa behnsa
Yewengel memhr yetewahdo anbesa
Misrach negari yets’dq balemuya
Bereketh beztwal beityop’ya

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9a4b09ca-77a4-41d8-9b5c-081dd969118f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 1
ንጹህ ባህታዊ እውነተኛ አገልጋይ
ገብረ መንፈስ ቅዱስ ሆነ ለእኛ ሲሳይ
ኢትዮጵያን ማርልኝ ብለህ እየለመንክ
በዝቋላ ባህር መቶ ዓመት ጸለይክ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 2
የእምነት ወታደር የፀሎት ወዳጅ
የአቅሌስያ ፀጋ የስምዖን ልጅ
ዝናህ እጅግ ሰፍቶ ተሰማ በአለም
ጻድቅ ሐዋርያ የፍቅር የሠላም

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 3
ፀበልህን ጠጣሁ ከደጅህ ደርሼ
ከህመሜ ዳንኩኝ በእምነትህ ታብሼ
አንበሳና ነብር የሚታዘዙልህ
ገብረ መንፈስ ቅዱስ ልዩ ነው ተጋድሎህ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 4
ግብፅም ትናገረው ታላቋ በህንሳ
የወንጌል መምህር የተዋህዶ አንበሳ
ምስራች ነጋሪ የጽድቅ ባለሙያ
በረከትህ በዝቷል በኢትዮጵያ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9a4b09ca-77a4-41d8-9b5c-081dd969118f'::uuid, 'nitsuh-bahetawi-deacon-zemari-endale-dereje', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nana-yemesegana-gieta ("Nana yemesegana gieta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1c5b6e03-7831-4faf-ab49-3f57f721a644'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 1
ኢየሩሳሌም ሆይ
ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ
ሰላምሽ ታውጇል መዳንሽም ቀርቧል

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 2
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር
ጌርጌስዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 3
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጣቶ
ምስጋና ጀመረ አምላኩን ለይቶ

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 4
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 5
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 1
Iyerusalem hoy
Misgana jemri
Meleketn nifi negarit gosmi
Selamsh tawjwal medanshm qerbwal

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 2
Geta ligobegnsh keberafsh qomwal
Yaltadelshw heger
Gergesyon hoy
Lemn teqawemshw amlakshn sitayiw

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 3
Yeketemawn ber mezgiyawn qolfesh
Keruq yeshegneshw simet’a selamsh
Yebitanya dingay andebet awt’ato
Misgana jemere amlakun leyto

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 4
Sarna qit’elu zenbabaw segede
Fit’ret liyamesegn amlakun wedede
Hits’an shmaglew misgana siyaqerbu
Teqolfo neber ferisawi libu

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 5
Zarem lemsgana libachn yilewet’
Hosaena Geta yimelalesbet

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 1
ኢየሩሳሌም ሆይ
ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ
ሰላምሽ ታውጇል መዳንሽም ቀርቧል

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 2
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር
ጌርጌስዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 3
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጣቶ
ምስጋና ጀመረ አምላኩን ለይቶ

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 4
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 5
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና',
        lyrics_transliteration = 'CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 1
Iyerusalem hoy
Misgana jemri
Meleketn nifi negarit gosmi
Selamsh tawjwal medanshm qerbwal

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 2
Geta ligobegnsh keberafsh qomwal
Yaltadelshw heger
Gergesyon hoy
Lemn teqawemshw amlakshn sitayiw

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 3
Yeketemawn ber mezgiyawn qolfesh
Keruq yeshegneshw simet’a selamsh
Yebitanya dingay andebet awt’ato
Misgana jemere amlakun leyto

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 4
Sarna qit’elu zenbabaw segede
Fit’ret liyamesegn amlakun wedede
Hits’an shmaglew misgana siyaqerbu
Teqolfo neber ferisawi libu

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 5
Zarem lemsgana libachn yilewet’
Hosaena Geta yimelalesbet

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1c5b6e03-7831-4faf-ab49-3f57f721a644'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 1
ኢየሩሳሌም ሆይ
ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ
ሰላምሽ ታውጇል መዳንሽም ቀርቧል

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 2
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር
ጌርጌስዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 3
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጣቶ
ምስጋና ጀመረ አምላኩን ለይቶ

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 4
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 5
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1c5b6e03-7831-4faf-ab49-3f57f721a644'::uuid, 'nana-yemesegana-gieta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- feyatawi-zeyeman-2396 ("Feyatawi Zeyeman")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9b3173a3-4bb5-4d4c-90f1-fd8a9c9f97d6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 1
አልሰማሁም እኔ የነቢያትን ቃል
አላወቅኩም በእርግጥ አብሮኝ እስኪሰቀል
ኢሳይያስ ሲናገር ዳዊት ሲመሰክር
የመሲሁን መምጣት አልሰማሁም ነበር

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 2
አዝ
በመስቀል ላይ ሳለ አምላኬን ለየሁት
ትሁት ነበር ፍጹም በደል የሌለበት
ስለ በደላችን እኛ ተሰቅለናል

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 3
እሱ ግን በማን ላይ ወንጀልን ፈጽሟል
አዝ
ጨረቃ ደም ሆና ፀሐይዋ ስትጨልም
ከዋክብት ረግፈው ሰማይ ሲያጉረመርም

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 4
አምላክ መሰቀሉን ተፈጥሮ ነግራኝ ነው
በመንግሥትህ ጌታ አስበኝ የምለው
አዝ
አወይ ቀያፋ ሆይ አወይ ሀና ሆይ

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 5
ደስ ብሏችሁ ዋለ በጌታ ስቃይ
ተፈጥሮ ምስክር ሆኖ ሲያስተምራችሁ
እንዴት አላመነም ደንዳናው ልባችሁ

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 1
Alsemahum ene yenebiyatn qal
Alaweqkum beergt’ abrogn eskiseqel
Isayyas sinager dawit simesekr
Yemesihun memt’at alsemahum neber

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 2
CHORUS
Bemesqel lay sale amlaken leyehut
Tihut neber fits’um bedel yelelebet
Sile bedelachn egna teseqlenal

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 3
Esu gin beman lay wenjeln fets’mwal
CHORUS
Ch’ereqa dem hona ts’eheywa sitch’elm
Kewakbt regfew semay siyaguremerm

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 4
Amlak meseqelun tefet’ro negragn new
Bemengsth Geta asbegn yemlew
CHORUS
Awey qeyafa hoy awey hena hoy

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 5
Des bilwachhu wale begeta siqay
Tefet’ro miskr hono siyastemrachhu
Endet alamenem dendanaw libachhu

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 1
አልሰማሁም እኔ የነቢያትን ቃል
አላወቅኩም በእርግጥ አብሮኝ እስኪሰቀል
ኢሳይያስ ሲናገር ዳዊት ሲመሰክር
የመሲሁን መምጣት አልሰማሁም ነበር

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 2
አዝ
በመስቀል ላይ ሳለ አምላኬን ለየሁት
ትሁት ነበር ፍጹም በደል የሌለበት
ስለ በደላችን እኛ ተሰቅለናል

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 3
እሱ ግን በማን ላይ ወንጀልን ፈጽሟል
አዝ
ጨረቃ ደም ሆና ፀሐይዋ ስትጨልም
ከዋክብት ረግፈው ሰማይ ሲያጉረመርም

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 4
አምላክ መሰቀሉን ተፈጥሮ ነግራኝ ነው
በመንግሥትህ ጌታ አስበኝ የምለው
አዝ
አወይ ቀያፋ ሆይ አወይ ሀና ሆይ

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 5
ደስ ብሏችሁ ዋለ በጌታ ስቃይ
ተፈጥሮ ምስክር ሆኖ ሲያስተምራችሁ
እንዴት አላመነም ደንዳናው ልባችሁ

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ',
        lyrics_transliteration = 'CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 1
Alsemahum ene yenebiyatn qal
Alaweqkum beergt’ abrogn eskiseqel
Isayyas sinager dawit simesekr
Yemesihun memt’at alsemahum neber

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 2
CHORUS
Bemesqel lay sale amlaken leyehut
Tihut neber fits’um bedel yelelebet
Sile bedelachn egna teseqlenal

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 3
Esu gin beman lay wenjeln fets’mwal
CHORUS
Ch’ereqa dem hona ts’eheywa sitch’elm
Kewakbt regfew semay siyaguremerm

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 4
Amlak meseqelun tefet’ro negragn new
Bemengsth Geta asbegn yemlew
CHORUS
Awey qeyafa hoy awey hena hoy

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 5
Des bilwachhu wale begeta siqay
Tefet’ro miskr hono siyastemrachhu
Endet alamenem dendanaw libachhu

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9b3173a3-4bb5-4d4c-90f1-fd8a9c9f97d6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ
አልሰማሁም እኔ የነቢያትን ቃል
አላወቅኩም በእርግጥ አብሮኝ እስኪሰቀል
ኢሳይያስ ሲናገር ዳዊት ሲመሰክር
የመሲሁን መምጣት አልሰማሁም ነበር
አዝ= = = = =
በመስቀል ላይ ሳለ አምላኬን ለየሁት
ትሁት ነበር ፍጹም በደል የሌለበት
ስለ በደላችን እኛ ተሰቅለናል
እሱ ግን በማን ላይ ወንጀልን ፈጽሟል
አዝ= = = = =
ጨረቃ ደም ሆና ፀሐይዋ ስትጨልም
ከዋክብት ረግፈው ሰማይ ሲያጉረመርም
አምላክ መሰቀሉን ተፈጥሮ ነግራኝ ነው
በመንግሥትህ ጌታ አስበኝ የምለው
አዝ= = = = =
አወይ ቀያፋ ሆይ አወይ ሀና ሆይ
ደስ ብሏችሁ ዋለ በጌታ ስቃይ
ተፈጥሮ ምስክር ሆኖ ሲያስተምራችሁ
እንዴት አላመነም ደንዳናው ልባችሁ

VERSE 1
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ
አልሰማሁም እኔ የነቢያትን ቃል
አላወቅኩም በእርግጥ አብሮኝ እስኪሰቀል
ኢሳይያስ ሲናገር ዳዊት ሲመሰክር
የመሲሁን መምጣት አልሰማሁም ነበር
አዝ= = = = =
በመስቀል ላይ ሳለ አምላኬን ለየሁት
ትሁት ነበር ፍጹም በደል የሌለበት
ስለ በደላችን እኛ ተሰቅለናል
እሱ ግን በማን ላይ ወንጀልን ፈጽሟል
አዝ= = = = =
ጨረቃ ደም ሆና ፀሐይዋ ስትጨልም
ከዋክብት ረግፈው ሰማይ ሲያጉረመርም
አምላክ መሰቀሉን ተፈጥሮ ነግራኝ ነው
በመንግሥትህ ጌታ አስበኝ የምለው
አዝ= = = = =
አወይ ቀያፋ ሆይ አወይ ሀና ሆይ
ደስ ብሏችሁ ዋለ በጌታ ስቃይ
ተፈጥሮ ምስክር ሆኖ ሲያስተምራችሁ
እንዴት አላመነም ደንዳናው ልባችሁ

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ
አልሰማሁም እኔ የነቢያትን ቃል
አላወቅኩም በእርግጥ አብሮኝ እስኪሰቀል
ኢሳይያስ ሲናገር ዳዊት ሲመሰክር
የመሲሁን መምጣት አልሰማሁም ነበር
አዝ= = = = =
በመስቀል ላይ ሳለ አምላኬን ለየሁት
ትሁት ነበር ፍጹም በደል የሌለበት
ስለ በደላችን እኛ ተሰቅለናል
እሱ ግን በማን ላይ ወንጀልን ፈጽሟል
አዝ= = = = =
ጨረቃ ደም ሆና ፀሐይዋ ስትጨልም
ከዋክብት ረግፈው ሰማይ ሲያጉረመርም
አምላክ መሰቀሉን ተፈጥሮ ነግራኝ ነው
በመንግሥትህ ጌታ አስበኝ የምለው
አዝ= = = = =
አወይ ቀያፋ ሆይ አወይ ሀና ሆይ
ደስ ብሏችሁ ዋለ በጌታ ስቃይ
ተፈጥሮ ምስክር ሆኖ ሲያስተምራችሁ
እንዴት አላመነም ደንዳናው ልባችሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9b3173a3-4bb5-4d4c-90f1-fd8a9c9f97d6'::uuid, 'feyatawi-zeyeman-2396', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bete-qene-3234 ("Bete Qene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9b8b4d41-609e-4f53-89f2-1ad079dc0fe6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 1
ሊረዳ ይመጣል ባለ ድሉ ጌታ
ባርኮ ይባርካል ይሆናል ከፍታ
በእሳቱ ውስጥም አለ ከህጻናቱ ጋር
በአሳንበሪ ሆድ ይችላል ሊያስተምር

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 2
ከሞት ጋር የቆመች ነፍስን ይመልሳል
አይችልም ተብሎ እንዴት ይከሰሳል
አትነዋወጡ አይድከም ልባችሁ
ተስፋን አትቁረጡ በእርሱ ባምላካችሁ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 3
በመቃብር ያሉ ታምራቱን ካዩ
ምድር አሜን ትበል ልክ እንደ ሰማዩ
ጊዜ ሲንሸራተት ያመነ ሲከዳ
ውበትም ሲረግፍ ሲሆን ምድረ በዳ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 4
ደምግባትን አይቶ አይጥል አያነሳ
ልባችሁ ይታዘዝ እግዚአብሔር ሲነሳ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 1
Lireda yimet’al bale dilu Geta
Barko yibarkal yihonal kefta
Beesatu wist’m ale kehts’anatu gar
Beasanberi hod yichlal liyastemr

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 2
Kemot gar yeqomech nefsn yimelsal
Aychlm teblo endet yikesesal
Atnewawet’u aydkem libachhu
Tesfan atquret’u beersu bamlakachhu

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 3
Bemeqabr yalu tamratun kayu
Midr Amen tibel lik ende semayu
Gize sinsheratet yamene sikeda
Wibetm siregf sihon midre beda

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 4
Demgbatn ayto ayt’l ayanesa
Libachhu yitazez Egziabher sinesa

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 1
ሊረዳ ይመጣል ባለ ድሉ ጌታ
ባርኮ ይባርካል ይሆናል ከፍታ
በእሳቱ ውስጥም አለ ከህጻናቱ ጋር
በአሳንበሪ ሆድ ይችላል ሊያስተምር

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 2
ከሞት ጋር የቆመች ነፍስን ይመልሳል
አይችልም ተብሎ እንዴት ይከሰሳል
አትነዋወጡ አይድከም ልባችሁ
ተስፋን አትቁረጡ በእርሱ ባምላካችሁ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 3
በመቃብር ያሉ ታምራቱን ካዩ
ምድር አሜን ትበል ልክ እንደ ሰማዩ
ጊዜ ሲንሸራተት ያመነ ሲከዳ
ውበትም ሲረግፍ ሲሆን ምድረ በዳ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 4
ደምግባትን አይቶ አይጥል አያነሳ
ልባችሁ ይታዘዝ እግዚአብሔር ሲነሳ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም',
        lyrics_transliteration = 'CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 1
Lireda yimet’al bale dilu Geta
Barko yibarkal yihonal kefta
Beesatu wist’m ale kehts’anatu gar
Beasanberi hod yichlal liyastemr

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 2
Kemot gar yeqomech nefsn yimelsal
Aychlm teblo endet yikesesal
Atnewawet’u aydkem libachhu
Tesfan atquret’u beersu bamlakachhu

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 3
Bemeqabr yalu tamratun kayu
Midr Amen tibel lik ende semayu
Gize sinsheratet yamene sikeda
Wibetm siregf sihon midre beda

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 4
Demgbatn ayto ayt’l ayanesa
Libachhu yitazez Egziabher sinesa

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9b8b4d41-609e-4f53-89f2-1ad079dc0fe6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 1
ሊረዳ ይመጣል ባለ ድሉ ጌታ
ባርኮ ይባርካል ይሆናል ከፍታ
በእሳቱ ውስጥም አለ ከህጻናቱ ጋር
በአሳንበሪ ሆድ ይችላል ሊያስተምር

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 2
ከሞት ጋር የቆመች ነፍስን ይመልሳል
አይችልም ተብሎ እንዴት ይከሰሳል
አትነዋወጡ አይድከም ልባችሁ
ተስፋን አትቁረጡ በእርሱ ባምላካችሁ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 3
በመቃብር ያሉ ታምራቱን ካዩ
ምድር አሜን ትበል ልክ እንደ ሰማዩ
ጊዜ ሲንሸራተት ያመነ ሲከዳ
ውበትም ሲረግፍ ሲሆን ምድረ በዳ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 4
ደምግባትን አይቶ አይጥል አያነሳ
ልባችሁ ይታዘዝ እግዚአብሔር ሲነሳ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9b8b4d41-609e-4f53-89f2-1ad079dc0fe6'::uuid, 'bete-qene-3234', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- orthodox-tewahido-mezmur ("Orthodox Tewahido Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9b434422-951b-4fd6-8dfd-bb01258ac280'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 1
ባንተ ለመወደድ ምትክ ናት
ሰበብ ባይኖረኝ ደንግባት
እንዴው መውደድ ማይከብድ
በንፁህ ማፍቀር ማይከብድ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 2
በጻድቅ ልጅህ ፈርዳሃ
አጥባ ባሪያህን ምረሃ
ተበድለህን ክሳህ
አንተስ ማን ቋንቋ አይገጥም

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 3
ኤሎሄ ኤሎሄ እያለ
በመስቀል ሲቃተተው አለ
ለወጉት ምህረት ማለደ
ለፋ ሲቃ እየታረደ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 4
የኔን ምትክ እሱ ሆነው
በአንዱ ልጅ ላይ ወሰነ
ወይኔ ለሰውት ኢየሱስ
ደሙ ሽርያለሁ በደምህ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 5
አንድስ እንኳን ያየኝ የለም
ምስሌ ሊቀርብ አልቻለም
ልጄ ባይተረክ ከኖሮ
ማን ነበር የሚያየኝ ለፍሮ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 6
በደሙ ከደም ጽፎልኝ
በአጥንቱ በእረፍት ጽፎልኝ
እያቃሰተ ነገረ
ፍቅሩን በፍቅር አሰረ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 1
Bante lemeweded mitk nat
Sebeb baynoregn dengbat
Endew mewded maykebd
Bents’uh mafqer maykebd

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 2
Bets’adq lijh ferdaha
At’ba bariyahn mireha
Tebedlehn kisah
Antes man qwanqwa ayget’m

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 3
Elohe elohe eyale
Bemesqel siqatetew ale
Lewegut mihret malede
Lefa siqa eyetarede

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 4
Yenen mitk esu honew
Beandu lij lay wesene
Weyne lesewt Iyesus
Demu shryalehu bedemh

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 5
Ands enkwan yayegn yelem
Misle liqerb alchalem
Lije bayterek kenoro
Man neber yemiyayegn lefro

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 6
Bedemu kedem ts’folgn
Beat’ntu beereft ts’folgn
Eyaqasete negere
Fiqrun befqr asere

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 1
ባንተ ለመወደድ ምትክ ናት
ሰበብ ባይኖረኝ ደንግባት
እንዴው መውደድ ማይከብድ
በንፁህ ማፍቀር ማይከብድ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 2
በጻድቅ ልጅህ ፈርዳሃ
አጥባ ባሪያህን ምረሃ
ተበድለህን ክሳህ
አንተስ ማን ቋንቋ አይገጥም

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 3
ኤሎሄ ኤሎሄ እያለ
በመስቀል ሲቃተተው አለ
ለወጉት ምህረት ማለደ
ለፋ ሲቃ እየታረደ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 4
የኔን ምትክ እሱ ሆነው
በአንዱ ልጅ ላይ ወሰነ
ወይኔ ለሰውት ኢየሱስ
ደሙ ሽርያለሁ በደምህ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 5
አንድስ እንኳን ያየኝ የለም
ምስሌ ሊቀርብ አልቻለም
ልጄ ባይተረክ ከኖሮ
ማን ነበር የሚያየኝ ለፍሮ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 6
በደሙ ከደም ጽፎልኝ
በአጥንቱ በእረፍት ጽፎልኝ
እያቃሰተ ነገረ
ፍቅሩን በፍቅር አሰረ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ',
        lyrics_transliteration = 'CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 1
Bante lemeweded mitk nat
Sebeb baynoregn dengbat
Endew mewded maykebd
Bents’uh mafqer maykebd

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 2
Bets’adq lijh ferdaha
At’ba bariyahn mireha
Tebedlehn kisah
Antes man qwanqwa ayget’m

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 3
Elohe elohe eyale
Bemesqel siqatetew ale
Lewegut mihret malede
Lefa siqa eyetarede

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 4
Yenen mitk esu honew
Beandu lij lay wesene
Weyne lesewt Iyesus
Demu shryalehu bedemh

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 5
Ands enkwan yayegn yelem
Misle liqerb alchalem
Lije bayterek kenoro
Man neber yemiyayegn lefro

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 6
Bedemu kedem ts’folgn
Beat’ntu beereft ts’folgn
Eyaqasete negere
Fiqrun befqr asere

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9b434422-951b-4fd6-8dfd-bb01258ac280'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 1
ባንተ ለመወደድ ምትክ ናት
ሰበብ ባይኖረኝ ደንግባት
እንዴው መውደድ ማይከብድ
በንፁህ ማፍቀር ማይከብድ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 2
በጻድቅ ልጅህ ፈርዳሃ
አጥባ ባሪያህን ምረሃ
ተበድለህን ክሳህ
አንተስ ማን ቋንቋ አይገጥም

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 3
ኤሎሄ ኤሎሄ እያለ
በመስቀል ሲቃተተው አለ
ለወጉት ምህረት ማለደ
ለፋ ሲቃ እየታረደ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 4
የኔን ምትክ እሱ ሆነው
በአንዱ ልጅ ላይ ወሰነ
ወይኔ ለሰውት ኢየሱስ
ደሙ ሽርያለሁ በደምህ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 5
አንድስ እንኳን ያየኝ የለም
ምስሌ ሊቀርብ አልቻለም
ልጄ ባይተረክ ከኖሮ
ማን ነበር የሚያየኝ ለፍሮ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 6
በደሙ ከደም ጽፎልኝ
በአጥንቱ በእረፍት ጽፎልኝ
እያቃሰተ ነገረ
ፍቅሩን በፍቅር አሰረ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9b434422-951b-4fd6-8dfd-bb01258ac280'::uuid, 'orthodox-tewahido-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bayinoche-efeligishalew ("Bayinoche Efeligishalew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f19f9b6f-0258-4ade-ba6c-ea2b81eee8d6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 1
አይሰግድም ጉልበቴ ለሐማ
ስለእኔ እመቤቴ ቆማ
አልፈራም እጠፋለሁ ብዬ
መስቀሉን በጀርባዬ አዝዬ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 2
ሎዛ ናት የጎኔ ማረፊያ
አልሰጋም ከደጀዋ ስተኛ
ማርያም ማርያም እያልኩኝ
በስሟ መች ተርቤ አየሁኝ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 3
አናብስት ይታዘዙላታል
መላእክት ያገለግልዋታል
እኔ ግን ስእልዋን በደረቴ
ታቅፌው ተባርኳዋል ሕይወቴ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 4
ልቤ ላይ ተስሏል ያው ፍቅሯ
እኖራለሁ ሁሌም በምልጃዋ
ሰቶኛል አድርጓት መመኪያ
ዘመኔን አልፋለሁ ከእርሷ ጋር

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 1
Aysegdm gulbete lehema
Sileene Emebete qoma
Alferam et’efalehu biye
Mesqelun bejerbaye azye

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 2
Loza nat yegone marefiya
Alsegam kedejewa sitegna
Maryam Maryam eyalkugn
Besmwa mech terbe ayehugn

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 3
Anabst yitazezulatal
Melaekt yageleglwatal
Ene gin sielwan bederete
Taqfew tebarkwawal hiywete

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 4
Libe lay teslwal yaw fiqrwa
Enoralehu hulem bemljawa
Setognal adrgwat memekiya
Zemenen alfalehu keerswa gar

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 1
አይሰግድም ጉልበቴ ለሐማ
ስለእኔ እመቤቴ ቆማ
አልፈራም እጠፋለሁ ብዬ
መስቀሉን በጀርባዬ አዝዬ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 2
ሎዛ ናት የጎኔ ማረፊያ
አልሰጋም ከደጀዋ ስተኛ
ማርያም ማርያም እያልኩኝ
በስሟ መች ተርቤ አየሁኝ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 3
አናብስት ይታዘዙላታል
መላእክት ያገለግልዋታል
እኔ ግን ስእልዋን በደረቴ
ታቅፌው ተባርኳዋል ሕይወቴ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 4
ልቤ ላይ ተስሏል ያው ፍቅሯ
እኖራለሁ ሁሌም በምልጃዋ
ሰቶኛል አድርጓት መመኪያ
ዘመኔን አልፋለሁ ከእርሷ ጋር

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)',
        lyrics_transliteration = 'CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 1
Aysegdm gulbete lehema
Sileene Emebete qoma
Alferam et’efalehu biye
Mesqelun bejerbaye azye

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 2
Loza nat yegone marefiya
Alsegam kedejewa sitegna
Maryam Maryam eyalkugn
Besmwa mech terbe ayehugn

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 3
Anabst yitazezulatal
Melaekt yageleglwatal
Ene gin sielwan bederete
Taqfew tebarkwawal hiywete

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 4
Libe lay teslwal yaw fiqrwa
Enoralehu hulem bemljawa
Setognal adrgwat memekiya
Zemenen alfalehu keerswa gar

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f19f9b6f-0258-4ade-ba6c-ea2b81eee8d6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 1
አይሰግድም ጉልበቴ ለሐማ
ስለእኔ እመቤቴ ቆማ
አልፈራም እጠፋለሁ ብዬ
መስቀሉን በጀርባዬ አዝዬ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 2
ሎዛ ናት የጎኔ ማረፊያ
አልሰጋም ከደጀዋ ስተኛ
ማርያም ማርያም እያልኩኝ
በስሟ መች ተርቤ አየሁኝ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 3
አናብስት ይታዘዙላታል
መላእክት ያገለግልዋታል
እኔ ግን ስእልዋን በደረቴ
ታቅፌው ተባርኳዋል ሕይወቴ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 4
ልቤ ላይ ተስሏል ያው ፍቅሯ
እኖራለሁ ሁሌም በምልጃዋ
ሰቶኛል አድርጓት መመኪያ
ዘመኔን አልፋለሁ ከእርሷ ጋር

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f19f9b6f-0258-4ade-ba6c-ea2b81eee8d6'::uuid, 'bayinoche-efeligishalew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tigrigna-orthodox-tewahdo-mezmur-2583 ("Tigrigna Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f2696d80-b68c-499a-9082-6ea56cd329b1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 1
ሰላም ለኪ ሰላም ለኪ|፪|
ወላዲተ ኣምላኽ ልዑል''ዩ ክብርኺ
ፀጋ ተዓደለ መን''ሎ ከማኺ
ትሕትናኺ ሪኡ መሪፁ ንዓኺ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 2
ክርስቶስ ኢየሱስ ሓዲሩ ኣባኺ
ከመይ ክኢልክዮ ንልዑል ፈጣሪ
ሰማይ ዘይስከሞ ዘይትፆሮ ምድሪ
ሰማያዊ ክብሩ ገዲፉ ዙፋኑ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 3
ድንግል ኣብ ማህፀንኪ ከመይ ተወሲኑ
ዝተባረኸ''ዩ ቅዱስ''ዩ ማህፀንኪ
ፅንሲ ናይ ኤልሳቤጥ ይመስክር ክብርኺ
ድምፅኺ ሰሚዑ ዘሊሉ ብደስታ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 4
ንፅህተ ንፁሃን ድንግል ኣደ ጎይታ
ብገብርኤል ሰላም ሰላምታ የቕርበልኪ
ቤዛ ዓለም መድሕን ስለዝወለድኪ
ክፅውዖ ስምኪ ማርያም ተምበርኪኸ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 5
ብግርማ ክብርኺ ምሒር ተማሪኸ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 1
Selam leki selam leki|2|
Weladite amlaኽ liul''yu kibrኺ
Ts’ega teadele men''lo kemaኺ
Tihtnaኺ riu merits’u niaኺ

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 2
Kristos Iyesus hadiru abaኺ
Kemey kiilkyo nilul fet’ari
Semay zeyskemo zeytts’oro midri
Semayawi kibru gedifu zufanu

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 3
Dingil ab mahts’enki kemey tewesinu
Zitebareኸ''yu Kidus''yu mahts’enki
Ts’nsi nay elsabet’ yimeskr kibrኺ
Dimts’ኺ semiu zelilu bidesta

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 4
Nits’hte nits’uhan Dingil ade goyta
Bigebrel selam selamta yeቕrbelki
Beza alem medhn silezweledki
Kits’wo simki Maryam temberkiኸ

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 5
Bigrma kibrኺ mihir temariኸ

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 1
ሰላም ለኪ ሰላም ለኪ|፪|
ወላዲተ ኣምላኽ ልዑል''ዩ ክብርኺ
ፀጋ ተዓደለ መን''ሎ ከማኺ
ትሕትናኺ ሪኡ መሪፁ ንዓኺ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 2
ክርስቶስ ኢየሱስ ሓዲሩ ኣባኺ
ከመይ ክኢልክዮ ንልዑል ፈጣሪ
ሰማይ ዘይስከሞ ዘይትፆሮ ምድሪ
ሰማያዊ ክብሩ ገዲፉ ዙፋኑ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 3
ድንግል ኣብ ማህፀንኪ ከመይ ተወሲኑ
ዝተባረኸ''ዩ ቅዱስ''ዩ ማህፀንኪ
ፅንሲ ናይ ኤልሳቤጥ ይመስክር ክብርኺ
ድምፅኺ ሰሚዑ ዘሊሉ ብደስታ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 4
ንፅህተ ንፁሃን ድንግል ኣደ ጎይታ
ብገብርኤል ሰላም ሰላምታ የቕርበልኪ
ቤዛ ዓለም መድሕን ስለዝወለድኪ
ክፅውዖ ስምኪ ማርያም ተምበርኪኸ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 5
ብግርማ ክብርኺ ምሒር ተማሪኸ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም',
        lyrics_transliteration = 'CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 1
Selam leki selam leki|2|
Weladite amlaኽ liul''yu kibrኺ
Ts’ega teadele men''lo kemaኺ
Tihtnaኺ riu merits’u niaኺ

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 2
Kristos Iyesus hadiru abaኺ
Kemey kiilkyo nilul fet’ari
Semay zeyskemo zeytts’oro midri
Semayawi kibru gedifu zufanu

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 3
Dingil ab mahts’enki kemey tewesinu
Zitebareኸ''yu Kidus''yu mahts’enki
Ts’nsi nay elsabet’ yimeskr kibrኺ
Dimts’ኺ semiu zelilu bidesta

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 4
Nits’hte nits’uhan Dingil ade goyta
Bigebrel selam selamta yeቕrbelki
Beza alem medhn silezweledki
Kits’wo simki Maryam temberkiኸ

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam

VERSE 5
Bigrma kibrኺ mihir temariኸ

CHORUS
Maryam Maryam
Selam leki selam
Maryam Maryam
Selam leki selam selam',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f2696d80-b68c-499a-9082-6ea56cd329b1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 1
ሰላም ለኪ ሰላም ለኪ|፪|
ወላዲተ ኣምላኽ ልዑል''ዩ ክብርኺ
ፀጋ ተዓደለ መን''ሎ ከማኺ
ትሕትናኺ ሪኡ መሪፁ ንዓኺ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 2
ክርስቶስ ኢየሱስ ሓዲሩ ኣባኺ
ከመይ ክኢልክዮ ንልዑል ፈጣሪ
ሰማይ ዘይስከሞ ዘይትፆሮ ምድሪ
ሰማያዊ ክብሩ ገዲፉ ዙፋኑ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 3
ድንግል ኣብ ማህፀንኪ ከመይ ተወሲኑ
ዝተባረኸ''ዩ ቅዱስ''ዩ ማህፀንኪ
ፅንሲ ናይ ኤልሳቤጥ ይመስክር ክብርኺ
ድምፅኺ ሰሚዑ ዘሊሉ ብደስታ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 4
ንፅህተ ንፁሃን ድንግል ኣደ ጎይታ
ብገብርኤል ሰላም ሰላምታ የቕርበልኪ
ቤዛ ዓለም መድሕን ስለዝወለድኪ
ክፅውዖ ስምኪ ማርያም ተምበርኪኸ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም

VERSE 5
ብግርማ ክብርኺ ምሒር ተማሪኸ

CHORUS
ማርያም ማርያም
ሰላም ለኪ ሰላም
ማርያም ማርያም
ሰላም ለኪ ሰላም ሰላም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f2696d80-b68c-499a-9082-6ea56cd329b1'::uuid, 'tigrigna-orthodox-tewahdo-mezmur-2583', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- orthodox ("orthodox")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f40e5822-66f2-469b-800a-f1da8e326d9f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 1
ተራቁቼ በአለም ጥጋት
ኃጢአትን ዘወትር ስጋት
ግን ፈተልሽው የሕይወቱ ሸማ
እኔ ልጅሽ እንድለብስ ግርማ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 2
ይንቆርቆር ዜማዬ
ለክብርሽ እምዬ
ልፍለቅለቅ በፊትሽ
ሸፍኖኝ ከውርደት ቀሚስሽ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 3
ገጼ ከስሞ አቀርቅሬ ሳለሁ
ልጄ ስትዪኝ በርታ ቀና እላለሁ
እንስፍስፍ ነሽ ለእኔማ አብሶ
ደጅሽ መጣሁ ሞቴ ተቀልብሶ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 4
ሰመረ ጸሎቴ
ደረሰ ስለቴ
ተባልኩኝ ዘማሪ
የልጅሽ የፍቅርሽ መስካሪ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 5
ታጥኖ ዕጣኑ ሲነበብ ታምርሽ
ያፈልሰኛል ከምድር ክብርሽ
አትለዪኝ ከጎን ከዙሪያዬ
ኦና አይደል ወይ ያለ አንቺ ኑሮዬ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 6
ማርማ ማርያም ነሽ
እምዬ የምልሽ
የጓዳ ሚስጥሬ
ያስተማርሽኝ ወልድን መምህሬ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 1
Teraquche bealem t’gat
Hat’iatn zewetr sigat
Gin fetelshw yehywetu shema
Ene lijsh endlebs girma

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 2
Yinqorqor zemaye
Lekbrsh emye
Lifleqleq befitsh
Shefnogn kewrdet qemissh

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 3
Gets’e kesmo aqerqre salehu
Lije sityign berta qena elalehu
Ensfsf nesh leenema abso
Dejsh met’ahu mote teqelbso

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 4
Semere ts’elote
Derese silete
Tebalkugn zemari
Yeljsh yefqrsh meskari

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 5
Tat’no et’anu sinebeb tamrsh
Yafelsegnal kemdr kibrsh
Atleyign kegon kezuriyaye
Ona aydel wey yale anchi nuroye

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 6
Marma Maryam nesh
Emye yemlsh
Yegwada mist’re
Yastemarshgn weldn memhre

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 1
ተራቁቼ በአለም ጥጋት
ኃጢአትን ዘወትር ስጋት
ግን ፈተልሽው የሕይወቱ ሸማ
እኔ ልጅሽ እንድለብስ ግርማ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 2
ይንቆርቆር ዜማዬ
ለክብርሽ እምዬ
ልፍለቅለቅ በፊትሽ
ሸፍኖኝ ከውርደት ቀሚስሽ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 3
ገጼ ከስሞ አቀርቅሬ ሳለሁ
ልጄ ስትዪኝ በርታ ቀና እላለሁ
እንስፍስፍ ነሽ ለእኔማ አብሶ
ደጅሽ መጣሁ ሞቴ ተቀልብሶ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 4
ሰመረ ጸሎቴ
ደረሰ ስለቴ
ተባልኩኝ ዘማሪ
የልጅሽ የፍቅርሽ መስካሪ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 5
ታጥኖ ዕጣኑ ሲነበብ ታምርሽ
ያፈልሰኛል ከምድር ክብርሽ
አትለዪኝ ከጎን ከዙሪያዬ
ኦና አይደል ወይ ያለ አንቺ ኑሮዬ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 6
ማርማ ማርያም ነሽ
እምዬ የምልሽ
የጓዳ ሚስጥሬ
ያስተማርሽኝ ወልድን መምህሬ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ',
        lyrics_transliteration = 'CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 1
Teraquche bealem t’gat
Hat’iatn zewetr sigat
Gin fetelshw yehywetu shema
Ene lijsh endlebs girma

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 2
Yinqorqor zemaye
Lekbrsh emye
Lifleqleq befitsh
Shefnogn kewrdet qemissh

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 3
Gets’e kesmo aqerqre salehu
Lije sityign berta qena elalehu
Ensfsf nesh leenema abso
Dejsh met’ahu mote teqelbso

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 4
Semere ts’elote
Derese silete
Tebalkugn zemari
Yeljsh yefqrsh meskari

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 5
Tat’no et’anu sinebeb tamrsh
Yafelsegnal kemdr kibrsh
Atleyign kegon kezuriyaye
Ona aydel wey yale anchi nuroye

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 6
Marma Maryam nesh
Emye yemlsh
Yegwada mist’re
Yastemarshgn weldn memhre

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f40e5822-66f2-469b-800a-f1da8e326d9f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 1
ተራቁቼ በአለም ጥጋት
ኃጢአትን ዘወትር ስጋት
ግን ፈተልሽው የሕይወቱ ሸማ
እኔ ልጅሽ እንድለብስ ግርማ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 2
ይንቆርቆር ዜማዬ
ለክብርሽ እምዬ
ልፍለቅለቅ በፊትሽ
ሸፍኖኝ ከውርደት ቀሚስሽ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 3
ገጼ ከስሞ አቀርቅሬ ሳለሁ
ልጄ ስትዪኝ በርታ ቀና እላለሁ
እንስፍስፍ ነሽ ለእኔማ አብሶ
ደጅሽ መጣሁ ሞቴ ተቀልብሶ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 4
ሰመረ ጸሎቴ
ደረሰ ስለቴ
ተባልኩኝ ዘማሪ
የልጅሽ የፍቅርሽ መስካሪ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 5
ታጥኖ ዕጣኑ ሲነበብ ታምርሽ
ያፈልሰኛል ከምድር ክብርሽ
አትለዪኝ ከጎን ከዙሪያዬ
ኦና አይደል ወይ ያለ አንቺ ኑሮዬ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 6
ማርማ ማርያም ነሽ
እምዬ የምልሽ
የጓዳ ሚስጥሬ
ያስተማርሽኝ ወልድን መምህሬ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f40e5822-66f2-469b-800a-f1da8e326d9f'::uuid, 'orthodox', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yene-mehari ("Yene Mehari")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'daebc4a3-9257-4475-9dd5-50fb6662efd2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 1
ለፅድቁ ባርያ ሆኛለው
ሳገለግለው እኖራለሁ
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 2
ደልዳዩ መዳፍ ደርሶልኝ
ተራራው ሜዳ ሆነልኝ
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በጁ ይዞልኝ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 3
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 4
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 5
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኖአል መንገዱ
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 6
የኢየሱስ ሁኝኜ ምን አጣው
ሁሉን በስሙ ተወጣሁ
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 7
ማይገባኝን አድርጎ
ያሳለፈኝን ሸሽጎ
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 8
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በሕይወት አስውቦ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 1
Lets’dqu barya hognalew
Sageleglew enoralehu
Yeenba zelelan yaqefew
Aynem ellta terefew

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 2
Deldayu medaf dersolgn
Teraraw meda honelgn
Aynochen kegud gardolgn
Kindochen beju yizolgn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 3
Keegre betach new wejebu
Ahun taytognal wedebu
Selam yinefsal zuriyaye
Ereft honolgn Getaye

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 4
Yebarekegnn barke
Telewet’elgn tarike
Birhanh gefwal diqdqun
Belbe teklwal sendequn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 5
Teqot’at’rognal mewdedu
Mengede honoal mengedu
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 6
Yeiyesus hugngne min at’aw
Hulun besmu tewet’ahu
Endene mann tagswal
Yiqrta fiqrun albswal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 7
Maygebagnn adrgo
Yasalefegnn sheshgo
Melkam new lenes melkam
Ts’egaw yagezegn sidekm

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 8
Motkugn sil mihret derbo
Aqomegn behywet aswbo

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 1
ለፅድቁ ባርያ ሆኛለው
ሳገለግለው እኖራለሁ
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 2
ደልዳዩ መዳፍ ደርሶልኝ
ተራራው ሜዳ ሆነልኝ
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በጁ ይዞልኝ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 3
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 4
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 5
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኖአል መንገዱ
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 6
የኢየሱስ ሁኝኜ ምን አጣው
ሁሉን በስሙ ተወጣሁ
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 7
ማይገባኝን አድርጎ
ያሳለፈኝን ሸሽጎ
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 8
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በሕይወት አስውቦ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ',
        lyrics_transliteration = 'CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 1
Lets’dqu barya hognalew
Sageleglew enoralehu
Yeenba zelelan yaqefew
Aynem ellta terefew

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 2
Deldayu medaf dersolgn
Teraraw meda honelgn
Aynochen kegud gardolgn
Kindochen beju yizolgn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 3
Keegre betach new wejebu
Ahun taytognal wedebu
Selam yinefsal zuriyaye
Ereft honolgn Getaye

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 4
Yebarekegnn barke
Telewet’elgn tarike
Birhanh gefwal diqdqun
Belbe teklwal sendequn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 5
Teqot’at’rognal mewdedu
Mengede honoal mengedu
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 6
Yeiyesus hugngne min at’aw
Hulun besmu tewet’ahu
Endene mann tagswal
Yiqrta fiqrun albswal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 7
Maygebagnn adrgo
Yasalefegnn sheshgo
Melkam new lenes melkam
Ts’egaw yagezegn sidekm

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 8
Motkugn sil mihret derbo
Aqomegn behywet aswbo

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'daebc4a3-9257-4475-9dd5-50fb6662efd2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 1
ለፅድቁ ባርያ ሆኛለው
ሳገለግለው እኖራለሁ
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 2
ደልዳዩ መዳፍ ደርሶልኝ
ተራራው ሜዳ ሆነልኝ
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በጁ ይዞልኝ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 3
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 4
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 5
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኖአል መንገዱ
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 6
የኢየሱስ ሁኝኜ ምን አጣው
ሁሉን በስሙ ተወጣሁ
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 7
ማይገባኝን አድርጎ
ያሳለፈኝን ሸሽጎ
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 8
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በሕይወት አስውቦ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'daebc4a3-9257-4475-9dd5-50fb6662efd2'::uuid, 'yene-mehari', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- shefani-gudey-new-eritrean-orthodox-mezmur-shefani-gudey-by-zemari-berek ("#shefani_gudey_new_eritrean_orthodox_mezmur#shefani_gudey_by_zemari_Bereket_tikue 2021")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9d2c8a50-122d-4e06-89b1-adef22911a64'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 1
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
ካባይ ብዙሕ ሓጢኣት ካባኻ''ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 2
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
በደለይ ከም ከቢድ ጾር ኣዝዪ ይኸብደኒ ኣሎ
ኣዋርሕ ከንቱነተይ ሰላመይ እናመንጠሎ
ቀትሪ ኮይኑ ለይተይ ለይቲ ኮይኑ ቀትረይ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 3
ብሰሪ ሓጢኣተይ "ደኺመን ኣዕጽምተይ(2)"
ብምሕረትካ (2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ኣብቅዓኒ
ካባይ ብዙሕ ሓጢኣት

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 4
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህ
ከባቴ ኣበሳ ሸፋኒ ንጉደይ ኣማኑኤል

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 5
ካብ ቅድሜኻ ኣይክወልን ግሁድ እንድዪ ንዓኻ
ጎይታይ ንዕሽነተይ ትፈልጦ ኢኻ ንስኻ
ሓጢኣት በደለይ''ውን "ካባኻ ኣይተሓብአን(2)"
ቤትካ ክኸውን ቤተይ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 6
ሎሚ ባርያኻ ኣድሕን
ሎሚ ወድኻ ኣድሕን
ብምሕረትካ(2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ዕድመ ሃበኒ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 7
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 8
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 1
Kebate abesay shefani nigudey amanuel
Kabay bizuh hat’iat kabaኻ''win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhh

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 2
Kebate abesay shefani nigudey amanuel
Bedeley kem kebid ts’or azyi yiኸbdeni alo
Awarh kentunetey selamey enament’elo
Qetri koynu leytey leyti koynu qetrey

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 3
Biseri hat’iatey "deኺmen aets’mtey (2)"
Bimhretka (2) t’emteni
Kemzi ile keynebr ninsha abqani
Kabay bizuh hat’iat

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 4
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhh
Kebate abesa shefani nigudey amanuel

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 5
Kab qidmeኻ aykweln gihud endyi niaኻ
Goytay nieshnetey tifelt’o iኻ nisኻ
Hat’iat bedeley''win "kabaኻ aytehaban (2)"
Betka kiኸwn betey

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 6
Lomi baryaኻ adhn
Lomi wedኻ adhn
Bimhretka (2) t’emteni
Kemzi ile keynebr ninsha edme habeni

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 7
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 8
Kebate abesay shefani nigudey amanuel

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 1
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
ካባይ ብዙሕ ሓጢኣት ካባኻ''ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 2
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
በደለይ ከም ከቢድ ጾር ኣዝዪ ይኸብደኒ ኣሎ
ኣዋርሕ ከንቱነተይ ሰላመይ እናመንጠሎ
ቀትሪ ኮይኑ ለይተይ ለይቲ ኮይኑ ቀትረይ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 3
ብሰሪ ሓጢኣተይ "ደኺመን ኣዕጽምተይ(2)"
ብምሕረትካ (2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ኣብቅዓኒ
ካባይ ብዙሕ ሓጢኣት

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 4
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህ
ከባቴ ኣበሳ ሸፋኒ ንጉደይ ኣማኑኤል

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 5
ካብ ቅድሜኻ ኣይክወልን ግሁድ እንድዪ ንዓኻ
ጎይታይ ንዕሽነተይ ትፈልጦ ኢኻ ንስኻ
ሓጢኣት በደለይ''ውን "ካባኻ ኣይተሓብአን(2)"
ቤትካ ክኸውን ቤተይ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 6
ሎሚ ባርያኻ ኣድሕን
ሎሚ ወድኻ ኣድሕን
ብምሕረትካ(2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ዕድመ ሃበኒ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 7
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 8
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ',
        lyrics_transliteration = 'CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 1
Kebate abesay shefani nigudey amanuel
Kabay bizuh hat’iat kabaኻ''win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhh

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 2
Kebate abesay shefani nigudey amanuel
Bedeley kem kebid ts’or azyi yiኸbdeni alo
Awarh kentunetey selamey enament’elo
Qetri koynu leytey leyti koynu qetrey

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 3
Biseri hat’iatey "deኺmen aets’mtey (2)"
Bimhretka (2) t’emteni
Kemzi ile keynebr ninsha abqani
Kabay bizuh hat’iat

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 4
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhh
Kebate abesa shefani nigudey amanuel

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 5
Kab qidmeኻ aykweln gihud endyi niaኻ
Goytay nieshnetey tifelt’o iኻ nisኻ
Hat’iat bedeley''win "kabaኻ aytehaban (2)"
Betka kiኸwn betey

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 6
Lomi baryaኻ adhn
Lomi wedኻ adhn
Bimhretka (2) t’emteni
Kemzi ile keynebr ninsha edme habeni

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 7
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh

VERSE 8
Kebate abesay shefani nigudey amanuel

CHORUS
Kabay bizuh hat’iat
Kabaኻ win mihret
Aygodln eyi''mo mehareni taos
Ehhhhhhh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9d2c8a50-122d-4e06-89b1-adef22911a64'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 1
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
ካባይ ብዙሕ ሓጢኣት ካባኻ''ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 2
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል
በደለይ ከም ከቢድ ጾር ኣዝዪ ይኸብደኒ ኣሎ
ኣዋርሕ ከንቱነተይ ሰላመይ እናመንጠሎ
ቀትሪ ኮይኑ ለይተይ ለይቲ ኮይኑ ቀትረይ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 3
ብሰሪ ሓጢኣተይ "ደኺመን ኣዕጽምተይ(2)"
ብምሕረትካ (2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ኣብቅዓኒ
ካባይ ብዙሕ ሓጢኣት

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 4
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህ
ከባቴ ኣበሳ ሸፋኒ ንጉደይ ኣማኑኤል

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 5
ካብ ቅድሜኻ ኣይክወልን ግሁድ እንድዪ ንዓኻ
ጎይታይ ንዕሽነተይ ትፈልጦ ኢኻ ንስኻ
ሓጢኣት በደለይ''ውን "ካባኻ ኣይተሓብአን(2)"
ቤትካ ክኸውን ቤተይ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 6
ሎሚ ባርያኻ ኣድሕን
ሎሚ ወድኻ ኣድሕን
ብምሕረትካ(2) ጠምተኒ
ከምዚ ኢለ ከይነብር ንንስሓ ዕድመ ሃበኒ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 7
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ

VERSE 8
ከባቴ ኣበሳይ ሸፋኒ ንጉደይ ኣማኑኤል

CHORUS
ካባይ ብዙሕ ሓጢኣት
ካባኻ ውን ምሕረት
ኣይጎድልን እዪ''ሞ መሓረኒ ታኦስ
እህህህህህህህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9d2c8a50-122d-4e06-89b1-adef22911a64'::uuid, 'shefani-gudey-new-eritrean-orthodox-mezmur-shefani-gudey-by-zemari-berek', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sealu-lene-kidusan-melaekit ("Sealu Lene Kidusan Melaekit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9eebc761-5da8-48fc-82d9-10242266b216'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 1
ያጸደክውን ማን ይወቅሳለ
ለሚገባው ክብርን መስጠት
ታዝዟልና በመጻሕፍት
ያከበርካቸው ባርያዎችህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 2
እናከብራለን ቅዱሳንህን
።።።።።።
ሁሉ መዳንን እንዲይዙ
የሚላኩ የሚያግዙ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 3
ሠርክ በፊትህ እየቆሙ
ጥዑም ቅዳሴን እያሰሙ
በምስጋናቸው የሚያከብሩህን
እናከብራለን መላእክትህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 4
።።።።።።
ጤዛ ልሰው ዳዋ ለብሰው
ዋእይ ቁሩንም ታግስው
በየፍርክታው በየዱሩ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 5
ሌጦ ለብሰው እየዞሩ
በጽናታቸው የሚያከብሩህን
እናከብራለን ጻድቃንህን ፪
።።።።።።

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 6
እንደሚታረዱ በጎች ሆነው
አንገታቸውን ለስፍ ሰጥተው
ስለ ስምህ እየተጠሉ
ከአንበሳ ጋር እየታገሉ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 7
በተጋድሏዋቸው የሚያከብሩህን
እናከብራለን ሰማዕታትህን ፪
።።።።።።
ከሕያው ቃልህ እየጠቀሱ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 8
መናፍቃንን ድል የነሱ
በገዛ ደምህ የዋጀኃትን
ቤተክርስቲያን የጠበቋትን
በሕይወታቸው ያስደሰቱህን

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 9
እናከብራለን ሐዋርያትህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 1
Yats’edekwn man yiweqsale
Lemigebaw kibrn mest’et
Tazzwalna bemets’ahft
Yakeberkachew baryawochhn 2

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 2
Enakebralen qidusanhn
......
Hulu medann endiyzu
Yemilaku yemiyagzu

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 3
Serk befith eyeqomu
T’um qidasen eyasemu
Bemsganachew yemiyakebruhn
Enakebralen melaekthn 2

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 4
......
T’eza lisew dawa lebsew
Waey qurunm tagsw
Beyefrktaw beyeduru

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 5
Let’o lebsew eyezoru
Bets’natachew yemiyakebruhn
Enakebralen ts’adqanhn 2
......

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 6
Endemitaredu begoch honew
Angetachewn lesf set’tew
Sile simh eyetet’elu
Keanbesa gar eyetagelu

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 7
Betegadlwawachew yemiyakebruhn
Enakebralen semaetathn 2
......
Kehyaw qalh eyet’eqesu

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 8
Menafqann dil yenesu
Begeza demh yewajehatn
Bete Kristian yet’ebeqwatn
Behywetachew yasdesetuhn

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 9
Enakebralen hewaryathn 2

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 1
ያጸደክውን ማን ይወቅሳለ
ለሚገባው ክብርን መስጠት
ታዝዟልና በመጻሕፍት
ያከበርካቸው ባርያዎችህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 2
እናከብራለን ቅዱሳንህን
።።።።።።
ሁሉ መዳንን እንዲይዙ
የሚላኩ የሚያግዙ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 3
ሠርክ በፊትህ እየቆሙ
ጥዑም ቅዳሴን እያሰሙ
በምስጋናቸው የሚያከብሩህን
እናከብራለን መላእክትህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 4
።።።።።።
ጤዛ ልሰው ዳዋ ለብሰው
ዋእይ ቁሩንም ታግስው
በየፍርክታው በየዱሩ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 5
ሌጦ ለብሰው እየዞሩ
በጽናታቸው የሚያከብሩህን
እናከብራለን ጻድቃንህን ፪
።።።።።።

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 6
እንደሚታረዱ በጎች ሆነው
አንገታቸውን ለስፍ ሰጥተው
ስለ ስምህ እየተጠሉ
ከአንበሳ ጋር እየታገሉ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 7
በተጋድሏዋቸው የሚያከብሩህን
እናከብራለን ሰማዕታትህን ፪
።።።።።።
ከሕያው ቃልህ እየጠቀሱ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 8
መናፍቃንን ድል የነሱ
በገዛ ደምህ የዋጀኃትን
ቤተክርስቲያን የጠበቋትን
በሕይወታቸው ያስደሰቱህን

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 9
እናከብራለን ሐዋርያትህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ',
        lyrics_transliteration = 'CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 1
Yats’edekwn man yiweqsale
Lemigebaw kibrn mest’et
Tazzwalna bemets’ahft
Yakeberkachew baryawochhn 2

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 2
Enakebralen qidusanhn
......
Hulu medann endiyzu
Yemilaku yemiyagzu

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 3
Serk befith eyeqomu
T’um qidasen eyasemu
Bemsganachew yemiyakebruhn
Enakebralen melaekthn 2

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 4
......
T’eza lisew dawa lebsew
Waey qurunm tagsw
Beyefrktaw beyeduru

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 5
Let’o lebsew eyezoru
Bets’natachew yemiyakebruhn
Enakebralen ts’adqanhn 2
......

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 6
Endemitaredu begoch honew
Angetachewn lesf set’tew
Sile simh eyetet’elu
Keanbesa gar eyetagelu

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 7
Betegadlwawachew yemiyakebruhn
Enakebralen semaetathn 2
......
Kehyaw qalh eyet’eqesu

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 8
Menafqann dil yenesu
Begeza demh yewajehatn
Bete Kristian yet’ebeqwatn
Behywetachew yasdesetuhn

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 9
Enakebralen hewaryathn 2

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9eebc761-5da8-48fc-82d9-10242266b216'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 1
ያጸደክውን ማን ይወቅሳለ
ለሚገባው ክብርን መስጠት
ታዝዟልና በመጻሕፍት
ያከበርካቸው ባርያዎችህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 2
እናከብራለን ቅዱሳንህን
።።።።።።
ሁሉ መዳንን እንዲይዙ
የሚላኩ የሚያግዙ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 3
ሠርክ በፊትህ እየቆሙ
ጥዑም ቅዳሴን እያሰሙ
በምስጋናቸው የሚያከብሩህን
እናከብራለን መላእክትህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 4
።።።።።።
ጤዛ ልሰው ዳዋ ለብሰው
ዋእይ ቁሩንም ታግስው
በየፍርክታው በየዱሩ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 5
ሌጦ ለብሰው እየዞሩ
በጽናታቸው የሚያከብሩህን
እናከብራለን ጻድቃንህን ፪
።።።።።።

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 6
እንደሚታረዱ በጎች ሆነው
አንገታቸውን ለስፍ ሰጥተው
ስለ ስምህ እየተጠሉ
ከአንበሳ ጋር እየታገሉ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 7
በተጋድሏዋቸው የሚያከብሩህን
እናከብራለን ሰማዕታትህን ፪
።።።።።።
ከሕያው ቃልህ እየጠቀሱ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 8
መናፍቃንን ድል የነሱ
በገዛ ደምህ የዋጀኃትን
ቤተክርስቲያን የጠበቋትን
በሕይወታቸው ያስደሰቱህን

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 9
እናከብራለን ሐዋርያትህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9eebc761-5da8-48fc-82d9-10242266b216'::uuid, 'sealu-lene-kidusan-melaekit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-2024 ("Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9d3fa71c-8a64-49da-bfc2-d3b036fddf29'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 1
ዘይከምቲ ባርያኻ ፈሊጡ ድኻሙ
ብጻዩ ዝሰትር ከፊኡ ሓሲሙ
ወይነይ ኣነ ምግዱር ብሓወይ ዝውዕል
ከማሙቅ ንእዝኒ ወረ ዝፈታትል

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 2
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ናብ ዉሽጠይ ከስተብህል
ምኽርኻ ሰሚዐ ቤተይ ክኾሳትር
ምስ ኣልገሰ ዓይነይ ካብ ናይ ሓወይ በሰር
ሃሰስ ኢለ ዉሽጠይ ረኺበዮ ጉዳ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 3
ኣነ ይሓይሽ ዝብል ትዕኑን ተሪር ጉንዳ
ኣዝ….
ኣንታ መድሕን ነፍሰይ ስምካ ተቀኒተ
ከም ዝሕረድ ገንሸል ኣፍካ ዘይተኸፍተ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 4
ምሳኻ እናበልኩ ብግርህቲ ልቢ
ኩላዕ በደል ብጻይ ምጻሩ ክኣቢ
ምሓረኒ ጎይታይ ኣብ ሕድገት ክዓቢ
ብጭጉራፍ ናይ ሓወይ ጉህዩ ንኸይ ደንን

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 5
ርድኣዮ ንልበይ ጭጉራፍካ ከስተንትን
ሳዕሪ ሓንኵልዎ ምሒር ካብ ዝናወጽ
ንዓይስ ካብ ምባል ኣሜን ንኽመርጽ
ኣዝ……

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 6
እቲ ልዑል ክብርኻ ማሕደር ስጋይ ሓርዩ
ካብ ዙፋን ክብርኻ ምዉራድካ ደልዩ
ስሉም ኣዳራሻት ዘይበቅዓካ ንጉስ
በጭርቅቲ ማᎁቅካስ ኣብ ሓሰር ክትድቅስ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 7
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ንዉሽጠይ ክፍዉስ
ፍሉይ ትሕትናኻ ምብጽሑ ስኢኑ
ዝተሰቅለ ልበይ ጠቀር ተኸዲኑ
ብኸምቲ ዘለዎ ሓደራ ኣይትግደፎ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 8
ኣብ ባይታ ኣዉሪድካ ኡፍ ኢልካ ንገፎ
ኣዝ……
ሓደ ኣብ ልዕሊ ሓደ ዘይጠቅመኒ ሓሳብ
ዘመን ምሉእ ዕድመይ ኣብ ዉሽጠይ ክእክብ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 9
ዘይከም ዓይኒ ማይካ ብመንፈስ ዘጥልል
ነዛ ምስኪን ነፍሰይ እናሻዕ ከቁስል
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ኣብ ቃልካ ክትከል
ከምቶም ዘፍቅሩኻ ዕድል እንተ ረኸበ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 10
ነዚ ድሩቅ ልበይ ቃልካ ዘይጸገበ
ንቁጽ ጨንፈር’ዩሞ ዝቀልል ምስባሩ
እስኪ በል ስበሮ ሓንሳእ ንሓዋሩ
ኣዝ …

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 1
Zeykemti baryaኻ felit’u diኻmu
Bits’ayu zisetr kefiu hasimu
Weyney ane migdur bihawey ziwel
Kemamuq niezni were zifetatl

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 2
Mehareni goytay nilbey athite nab wusht’ey kestebhl
Miኽrኻ semia betey kiኾsatr
Mis algese ayney kab nay hawey beser
Hases ile wusht’ey reኺbeyo guda

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 3
Ane yihaysh zibl tienun terir gunda
Az….
Anta medhn nefsey simka teqenite
Kem zihred genshel afka zeyteኸfte

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 4
Misaኻ enabelku bigrhti libi
Kulae bedel bits’ay mits’aru kiabi
Mihareni goytay ab hidget kiabi
Bich’guraf nay hawey guhyu niኸy denn

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 5
Ridayo nilbey ch’gurafka kestentn
Saeri hankwlwo mihir kab zinawets’
Niays kab mibal amen niኽmerts’
Az……

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 6
Eti liul kibrኻ mahder sigay haryu
Kab zufan kibrኻ miwuradka delyu
Silum adarashat zeybeqaka nigus
Bech’rqti maᎁqkas ab haser kitdqs

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 7
Mehareni goytay nilbey athite niwusht’ey kifwus
Filuy tihtnaኻ mibts’hu siinu
Ziteseqle libey t’eqer teኸdinu
Biኸmti zelewo hadera aytgdefo

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 8
Ab bayta awuridka uf ilka nigefo
Az……
Hade ab lieli hade zeyt’eqmeni hasab
Zemen milue edmey ab wusht’ey kiekb

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 9
Zeykem ayni mayka bimenfes zet’ll
Neza miskin nefsey enashae kequsl
Mehareni goytay nilbey athite ab qalka kitkel
Kemtom zefqruኻ edl ente reኸbe

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 10
Nezi diruq libey qalka zeyts’egebe
Niquts’ ch’enfer’yumo ziqell misbaru
Eski bel sibero hansae nihawaru
Az …

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 1
ዘይከምቲ ባርያኻ ፈሊጡ ድኻሙ
ብጻዩ ዝሰትር ከፊኡ ሓሲሙ
ወይነይ ኣነ ምግዱር ብሓወይ ዝውዕል
ከማሙቅ ንእዝኒ ወረ ዝፈታትል

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 2
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ናብ ዉሽጠይ ከስተብህል
ምኽርኻ ሰሚዐ ቤተይ ክኾሳትር
ምስ ኣልገሰ ዓይነይ ካብ ናይ ሓወይ በሰር
ሃሰስ ኢለ ዉሽጠይ ረኺበዮ ጉዳ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 3
ኣነ ይሓይሽ ዝብል ትዕኑን ተሪር ጉንዳ
ኣዝ….
ኣንታ መድሕን ነፍሰይ ስምካ ተቀኒተ
ከም ዝሕረድ ገንሸል ኣፍካ ዘይተኸፍተ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 4
ምሳኻ እናበልኩ ብግርህቲ ልቢ
ኩላዕ በደል ብጻይ ምጻሩ ክኣቢ
ምሓረኒ ጎይታይ ኣብ ሕድገት ክዓቢ
ብጭጉራፍ ናይ ሓወይ ጉህዩ ንኸይ ደንን

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 5
ርድኣዮ ንልበይ ጭጉራፍካ ከስተንትን
ሳዕሪ ሓንኵልዎ ምሒር ካብ ዝናወጽ
ንዓይስ ካብ ምባል ኣሜን ንኽመርጽ
ኣዝ……

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 6
እቲ ልዑል ክብርኻ ማሕደር ስጋይ ሓርዩ
ካብ ዙፋን ክብርኻ ምዉራድካ ደልዩ
ስሉም ኣዳራሻት ዘይበቅዓካ ንጉስ
በጭርቅቲ ማᎁቅካስ ኣብ ሓሰር ክትድቅስ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 7
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ንዉሽጠይ ክፍዉስ
ፍሉይ ትሕትናኻ ምብጽሑ ስኢኑ
ዝተሰቅለ ልበይ ጠቀር ተኸዲኑ
ብኸምቲ ዘለዎ ሓደራ ኣይትግደፎ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 8
ኣብ ባይታ ኣዉሪድካ ኡፍ ኢልካ ንገፎ
ኣዝ……
ሓደ ኣብ ልዕሊ ሓደ ዘይጠቅመኒ ሓሳብ
ዘመን ምሉእ ዕድመይ ኣብ ዉሽጠይ ክእክብ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 9
ዘይከም ዓይኒ ማይካ ብመንፈስ ዘጥልል
ነዛ ምስኪን ነፍሰይ እናሻዕ ከቁስል
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ኣብ ቃልካ ክትከል
ከምቶም ዘፍቅሩኻ ዕድል እንተ ረኸበ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 10
ነዚ ድሩቅ ልበይ ቃልካ ዘይጸገበ
ንቁጽ ጨንፈር’ዩሞ ዝቀልል ምስባሩ
እስኪ በል ስበሮ ሓንሳእ ንሓዋሩ
ኣዝ …

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)',
        lyrics_transliteration = 'CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 1
Zeykemti baryaኻ felit’u diኻmu
Bits’ayu zisetr kefiu hasimu
Weyney ane migdur bihawey ziwel
Kemamuq niezni were zifetatl

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 2
Mehareni goytay nilbey athite nab wusht’ey kestebhl
Miኽrኻ semia betey kiኾsatr
Mis algese ayney kab nay hawey beser
Hases ile wusht’ey reኺbeyo guda

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 3
Ane yihaysh zibl tienun terir gunda
Az….
Anta medhn nefsey simka teqenite
Kem zihred genshel afka zeyteኸfte

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 4
Misaኻ enabelku bigrhti libi
Kulae bedel bits’ay mits’aru kiabi
Mihareni goytay ab hidget kiabi
Bich’guraf nay hawey guhyu niኸy denn

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 5
Ridayo nilbey ch’gurafka kestentn
Saeri hankwlwo mihir kab zinawets’
Niays kab mibal amen niኽmerts’
Az……

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 6
Eti liul kibrኻ mahder sigay haryu
Kab zufan kibrኻ miwuradka delyu
Silum adarashat zeybeqaka nigus
Bech’rqti maᎁqkas ab haser kitdqs

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 7
Mehareni goytay nilbey athite niwusht’ey kifwus
Filuy tihtnaኻ mibts’hu siinu
Ziteseqle libey t’eqer teኸdinu
Biኸmti zelewo hadera aytgdefo

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 8
Ab bayta awuridka uf ilka nigefo
Az……
Hade ab lieli hade zeyt’eqmeni hasab
Zemen milue edmey ab wusht’ey kiekb

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 9
Zeykem ayni mayka bimenfes zet’ll
Neza miskin nefsey enashae kequsl
Mehareni goytay nilbey athite ab qalka kitkel
Kemtom zefqruኻ edl ente reኸbe

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 10
Nezi diruq libey qalka zeyts’egebe
Niquts’ ch’enfer’yumo ziqell misbaru
Eski bel sibero hansae nihawaru
Az …

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9d3fa71c-8a64-49da-bfc2-d3b036fddf29'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 1
ዘይከምቲ ባርያኻ ፈሊጡ ድኻሙ
ብጻዩ ዝሰትር ከፊኡ ሓሲሙ
ወይነይ ኣነ ምግዱር ብሓወይ ዝውዕል
ከማሙቅ ንእዝኒ ወረ ዝፈታትል

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 2
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ናብ ዉሽጠይ ከስተብህል
ምኽርኻ ሰሚዐ ቤተይ ክኾሳትር
ምስ ኣልገሰ ዓይነይ ካብ ናይ ሓወይ በሰር
ሃሰስ ኢለ ዉሽጠይ ረኺበዮ ጉዳ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 3
ኣነ ይሓይሽ ዝብል ትዕኑን ተሪር ጉንዳ
ኣዝ….
ኣንታ መድሕን ነፍሰይ ስምካ ተቀኒተ
ከም ዝሕረድ ገንሸል ኣፍካ ዘይተኸፍተ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 4
ምሳኻ እናበልኩ ብግርህቲ ልቢ
ኩላዕ በደል ብጻይ ምጻሩ ክኣቢ
ምሓረኒ ጎይታይ ኣብ ሕድገት ክዓቢ
ብጭጉራፍ ናይ ሓወይ ጉህዩ ንኸይ ደንን

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 5
ርድኣዮ ንልበይ ጭጉራፍካ ከስተንትን
ሳዕሪ ሓንኵልዎ ምሒር ካብ ዝናወጽ
ንዓይስ ካብ ምባል ኣሜን ንኽመርጽ
ኣዝ……

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 6
እቲ ልዑል ክብርኻ ማሕደር ስጋይ ሓርዩ
ካብ ዙፋን ክብርኻ ምዉራድካ ደልዩ
ስሉም ኣዳራሻት ዘይበቅዓካ ንጉስ
በጭርቅቲ ማᎁቅካስ ኣብ ሓሰር ክትድቅስ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 7
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ንዉሽጠይ ክፍዉስ
ፍሉይ ትሕትናኻ ምብጽሑ ስኢኑ
ዝተሰቅለ ልበይ ጠቀር ተኸዲኑ
ብኸምቲ ዘለዎ ሓደራ ኣይትግደፎ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 8
ኣብ ባይታ ኣዉሪድካ ኡፍ ኢልካ ንገፎ
ኣዝ……
ሓደ ኣብ ልዕሊ ሓደ ዘይጠቅመኒ ሓሳብ
ዘመን ምሉእ ዕድመይ ኣብ ዉሽጠይ ክእክብ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 9
ዘይከም ዓይኒ ማይካ ብመንፈስ ዘጥልል
ነዛ ምስኪን ነፍሰይ እናሻዕ ከቁስል
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ኣብ ቃልካ ክትከል
ከምቶም ዘፍቅሩኻ ዕድል እንተ ረኸበ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 10
ነዚ ድሩቅ ልበይ ቃልካ ዘይጸገበ
ንቁጽ ጨንፈር’ዩሞ ዝቀልል ምስባሩ
እስኪ በል ስበሮ ሓንሳእ ንሓዋሩ
ኣዝ …

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9d3fa71c-8a64-49da-bfc2-d3b036fddf29'::uuid, 'eritrean-orthodox-tewahdo-mezmur-2024', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kehatiategnaw-dinikwan ("Kehatiategnaw Dinikwan")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9f9f2735-1783-4fb0-b1ce-bc3ba319ccda'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 1
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 2
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 3
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 4
እንኳንስ አድርገኝ ጌታዬ ሙሉ ሰው
እንዲሁም ይሄን ነው ልቤ የሚናፍቀው
የዘመን አሸከር ጠረጉስኩህና
የጠፋውን ድሪ ባገኘሁህና

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 5
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 6
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 7
ባገኘኸኝ ጊዜ ሸፈነኝ በለስዋ
ከፊት ያነበቡት ፍጹም አይረሳ
ከዚህም የበለጠ ታያለህ የምትለኝ
አይንህ ይናገራል እንደማትረሳ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 8
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 9
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 10
ምን አለኝ ብለህ ደጃፌን የምትመታ
እኔ ደካማ ነኝ አንተ ቅዱስ ጌታ
ከእንግዲህ አልረሳው ምንጣፌን በእንባ
ምልጦ ላይቴን ከፍተው በሁለት ግባ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 11
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 12
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 13
እኔ እኮ አውቀሃለሁ ሁሉን ስታፈቅረኝ
የአናብስትህን ጉርጓድ ከቦታው አሰሽ
እንዲህ እያለ ነው የሚቀኘው ውስጤ
እየሱስ ክርስቶስ ምግቤና መጠጤ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 14
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 15
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 1
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 2
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 3
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 4
Enkwans adrgegn Getaye mulu sew
Endihum yihen new libe yeminafqew
Yezemen asheker t’ereguskuhna
Yet’efawn diri bagegnehuhna

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 5
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 6
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 7
Bagegneኸgn gize shefenegn beleswa
Kefit yanebebut fits’um ayresa
Kezihm yebelet’e tayaleh yemtlegn
Aynh yinageral endematresa

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 8
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 9
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 10
Min alegn bileh dejafen yemtmeta
Ene dekama negn ante Kidus Geta
Keengdih alresaw mint’afen beenba
Milt’o layten keftew behulet giba

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 11
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 12
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 13
Ene eko awqehalehu hulun sitafeqregn
Yeanabsthn gurgwad kebotaw asesh
Endih eyale new yemiqegnew wist’e
Eyesus Kristos migbena met’et’e

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 14
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 15
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 1
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 2
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 3
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 4
እንኳንስ አድርገኝ ጌታዬ ሙሉ ሰው
እንዲሁም ይሄን ነው ልቤ የሚናፍቀው
የዘመን አሸከር ጠረጉስኩህና
የጠፋውን ድሪ ባገኘሁህና

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 5
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 6
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 7
ባገኘኸኝ ጊዜ ሸፈነኝ በለስዋ
ከፊት ያነበቡት ፍጹም አይረሳ
ከዚህም የበለጠ ታያለህ የምትለኝ
አይንህ ይናገራል እንደማትረሳ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 8
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 9
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 10
ምን አለኝ ብለህ ደጃፌን የምትመታ
እኔ ደካማ ነኝ አንተ ቅዱስ ጌታ
ከእንግዲህ አልረሳው ምንጣፌን በእንባ
ምልጦ ላይቴን ከፍተው በሁለት ግባ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 11
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 12
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 13
እኔ እኮ አውቀሃለሁ ሁሉን ስታፈቅረኝ
የአናብስትህን ጉርጓድ ከቦታው አሰሽ
እንዲህ እያለ ነው የሚቀኘው ውስጤ
እየሱስ ክርስቶስ ምግቤና መጠጤ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 14
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 15
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ',
        lyrics_transliteration = 'CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 1
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 2
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 3
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 4
Enkwans adrgegn Getaye mulu sew
Endihum yihen new libe yeminafqew
Yezemen asheker t’ereguskuhna
Yet’efawn diri bagegnehuhna

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 5
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 6
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 7
Bagegneኸgn gize shefenegn beleswa
Kefit yanebebut fits’um ayresa
Kezihm yebelet’e tayaleh yemtlegn
Aynh yinageral endematresa

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 8
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 9
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 10
Min alegn bileh dejafen yemtmeta
Ene dekama negn ante Kidus Geta
Keengdih alresaw mint’afen beenba
Milt’o layten keftew behulet giba

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 11
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 12
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 13
Ene eko awqehalehu hulun sitafeqregn
Yeanabsthn gurgwad kebotaw asesh
Endih eyale new yemiqegnew wist’e
Eyesus Kristos migbena met’et’e

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 14
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye

VERSE 15
Lene yaderekew bizu new Getaye
Ante silalehgn
Kebad mekeraye
Lene yaderekew bizu new Getaye

CHORUS
Hat’iategnaw dinkwan qidusu qome
Lije yet new bileh sitfelgegn
Ante silalehgn
Kebad mekeraye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9f9f2735-1783-4fb0-b1ce-bc3ba319ccda'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 1
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 2
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 3
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 4
እንኳንስ አድርገኝ ጌታዬ ሙሉ ሰው
እንዲሁም ይሄን ነው ልቤ የሚናፍቀው
የዘመን አሸከር ጠረጉስኩህና
የጠፋውን ድሪ ባገኘሁህና

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 5
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 6
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 7
ባገኘኸኝ ጊዜ ሸፈነኝ በለስዋ
ከፊት ያነበቡት ፍጹም አይረሳ
ከዚህም የበለጠ ታያለህ የምትለኝ
አይንህ ይናገራል እንደማትረሳ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 8
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 9
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 10
ምን አለኝ ብለህ ደጃፌን የምትመታ
እኔ ደካማ ነኝ አንተ ቅዱስ ጌታ
ከእንግዲህ አልረሳው ምንጣፌን በእንባ
ምልጦ ላይቴን ከፍተው በሁለት ግባ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 11
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 12
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 13
እኔ እኮ አውቀሃለሁ ሁሉን ስታፈቅረኝ
የአናብስትህን ጉርጓድ ከቦታው አሰሽ
እንዲህ እያለ ነው የሚቀኘው ውስጤ
እየሱስ ክርስቶስ ምግቤና መጠጤ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 14
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ

VERSE 15
ለኔ ያደረከው ብዙ ነው ጌታዬ
አንተ ስላለህኝ
ከባድ መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ኃጢአተኛው ድንኳን ቅዱሱ ቆመ
ልጄ የት ነው ብለህ ስትፈልገኝ
አንተ ስላለህኝ
ከባድ መከራዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9f9f2735-1783-4fb0-b1ce-bc3ba319ccda'::uuid, 'kehatiategnaw-dinikwan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemeljash-komiyalehu-zemarit-betselot-asmare ("Bemeljash komiyalehu Zemarit Betselot Asmare")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a1081d3c-f19e-4672-a1f2-f7b8fbfa72ad'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 1
ጉድለቴን ታውቂያለሽ ገና ሳልነግርሽ
ሸክሜን ማሶገጃ ሆኖኛል ጸሎትሽ
ስዕልሽ ፊት ቆሜ የልቤን ስነግርሽ
ሁሉን አርጎልኛል የታመነው ልጅሽ

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 2
በምልጃሽ ቆሚያለው በምልጃሽ
ሰላሜ ነሽ ማርያም ሰላሜ ነሽ
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 3
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘሁሽ በመከራው እለት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 4
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው
በጭንቀቴ ግዜ በሃዘኔ ሰዓት
የምታረጋጊኝ የሆንሽኝ መጽናናት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 5
የመማጸኛዬ ከተማ ነሽ ማርያም
ዘምርልሻለው ለዓለም ለዘላለም
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 6
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘውሽ በመከራው እለት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 7
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 1
Gudleten tawqiyalesh gena salnegrsh
Shekmen masogeja honognal ts’elotsh
Sielsh fit qome yelben sinegrsh
Hulun argolgnal yetamenew lijsh

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 2
Bemljash qomiyalew bemljash
Selame nesh Maryam selame nesh
Yenegerkush hulu meche kentu qertwal
Wit’ne tesakto godoloye moltwal

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 3
T’lash shefnognal bebaed hager
Lene bezu adrgwal dingel yanchi fiqr
Beza bemot sifra bemesqelu daget
Sit’ota yagegnehush bemekeraw elet

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 4
Fitsh tenberkke kibrn set’shalew
Fiqrsh t’g yelewm yihenn awqalew
Bech’nqete gize behazene seat
Yemtaregagign yehonshgn mets’nanat

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 5
Yememats’egnaye ketema nesh Maryam
Zemrlshalew lealem lezelalem
Yenegerkush hulu meche kentu qertwal
Wit’ne tesakto godoloye moltwal

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 6
T’lash shefnognal bebaed hager
Lene bezu adrgwal dingel yanchi fiqr
Beza bemot sifra bemesqelu daget
Sit’ota yagegnewsh bemekeraw elet

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 7
Fitsh tenberkke kibrn set’shalew
Fiqrsh t’g yelewm yihenn awqalew

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 1
ጉድለቴን ታውቂያለሽ ገና ሳልነግርሽ
ሸክሜን ማሶገጃ ሆኖኛል ጸሎትሽ
ስዕልሽ ፊት ቆሜ የልቤን ስነግርሽ
ሁሉን አርጎልኛል የታመነው ልጅሽ

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 2
በምልጃሽ ቆሚያለው በምልጃሽ
ሰላሜ ነሽ ማርያም ሰላሜ ነሽ
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 3
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘሁሽ በመከራው እለት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 4
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው
በጭንቀቴ ግዜ በሃዘኔ ሰዓት
የምታረጋጊኝ የሆንሽኝ መጽናናት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 5
የመማጸኛዬ ከተማ ነሽ ማርያም
ዘምርልሻለው ለዓለም ለዘላለም
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 6
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘውሽ በመከራው እለት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 7
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ',
        lyrics_transliteration = 'CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 1
Gudleten tawqiyalesh gena salnegrsh
Shekmen masogeja honognal ts’elotsh
Sielsh fit qome yelben sinegrsh
Hulun argolgnal yetamenew lijsh

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 2
Bemljash qomiyalew bemljash
Selame nesh Maryam selame nesh
Yenegerkush hulu meche kentu qertwal
Wit’ne tesakto godoloye moltwal

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 3
T’lash shefnognal bebaed hager
Lene bezu adrgwal dingel yanchi fiqr
Beza bemot sifra bemesqelu daget
Sit’ota yagegnehush bemekeraw elet

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 4
Fitsh tenberkke kibrn set’shalew
Fiqrsh t’g yelewm yihenn awqalew
Bech’nqete gize behazene seat
Yemtaregagign yehonshgn mets’nanat

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 5
Yememats’egnaye ketema nesh Maryam
Zemrlshalew lealem lezelalem
Yenegerkush hulu meche kentu qertwal
Wit’ne tesakto godoloye moltwal

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 6
T’lash shefnognal bebaed hager
Lene bezu adrgwal dingel yanchi fiqr
Beza bemot sifra bemesqelu daget
Sit’ota yagegnewsh bemekeraw elet

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 7
Fitsh tenberkke kibrn set’shalew
Fiqrsh t’g yelewm yihenn awqalew

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a1081d3c-f19e-4672-a1f2-f7b8fbfa72ad'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 1
ጉድለቴን ታውቂያለሽ ገና ሳልነግርሽ
ሸክሜን ማሶገጃ ሆኖኛል ጸሎትሽ
ስዕልሽ ፊት ቆሜ የልቤን ስነግርሽ
ሁሉን አርጎልኛል የታመነው ልጅሽ

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 2
በምልጃሽ ቆሚያለው በምልጃሽ
ሰላሜ ነሽ ማርያም ሰላሜ ነሽ
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 3
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘሁሽ በመከራው እለት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 4
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው
በጭንቀቴ ግዜ በሃዘኔ ሰዓት
የምታረጋጊኝ የሆንሽኝ መጽናናት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 5
የመማጸኛዬ ከተማ ነሽ ማርያም
ዘምርልሻለው ለዓለም ለዘላለም
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 6
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘውሽ በመከራው እለት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 7
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a1081d3c-f19e-4672-a1f2-f7b8fbfa72ad'::uuid, 'bemeljash-komiyalehu-zemarit-betselot-asmare', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yetegnaw-siraye ("Yetegnaw Siraye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a119f92b-608d-4dbf-a6b6-5898cdb04f6e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 1
በመዳፍህ ቀርፀህ ሁሌ ታየኛለህ
መድሀኒቴ ኢየሱስ በደሌን እረስተህ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 2
የአብርሀምን ምግባር የዮሴፍን እምነት
ፅድቅን ባልኳለው ባላደርግ መቀነት
ማህተቡን ይዣለሁ የደሙን ጠብታ
መድሀኒቴ ኢየሱስ አክብሮኛል ጌታ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 3
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ
እንዳልፈው የረዳኝ የእሳቱን ባህር
ምን ምግባር ኖሮኝ ነው ከፅድቅ የሚቆጠር

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 4
የልቤ ኩራት ነው የአይኔ ከፍታ
መድሀኒቴ ኢየሱስ የሠራዊት ጌታ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 5
ዘይቱ እንዴት ፈላ በራሴ ያፈሰስከው
ዙፋን ልታወርሰኝ ልቤን የመረጥከው
የኔ የተወደደው ከኤልያም ደም ግባት
መድሀኒቴ ኢየሱስ ሆነኸኝ ነው ውበት

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 6
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ/2/

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 1
Bemedafh qerts’eh hule tayegnaleh
Medhenite Iyesus bedelen eresteh
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 2
Yeabrhemn migbar yeyosefn emnet
Ts’dqn balkwalew baladerg meqenet
Mahtebun yizhalehu yedemun t’ebta
Medhenite Iyesus akbrognal Geta

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 3
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn
Endalfew yeredagn yeesatun bahr
Min migbar norogn new kets’dq yemiqot’er

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 4
Yelbe kurat new yeayne kefta
Medhenite Iyesus yeserawit Geta
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 5
Zeytu endet fela berase yafeseskew
Zufan litawersegn liben yemeret’kew
Yene yetewededew keelyam dem gibat
Medhenite Iyesus honeኸgn new wibet

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 6
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn (2)

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 1
በመዳፍህ ቀርፀህ ሁሌ ታየኛለህ
መድሀኒቴ ኢየሱስ በደሌን እረስተህ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 2
የአብርሀምን ምግባር የዮሴፍን እምነት
ፅድቅን ባልኳለው ባላደርግ መቀነት
ማህተቡን ይዣለሁ የደሙን ጠብታ
መድሀኒቴ ኢየሱስ አክብሮኛል ጌታ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 3
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ
እንዳልፈው የረዳኝ የእሳቱን ባህር
ምን ምግባር ኖሮኝ ነው ከፅድቅ የሚቆጠር

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 4
የልቤ ኩራት ነው የአይኔ ከፍታ
መድሀኒቴ ኢየሱስ የሠራዊት ጌታ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 5
ዘይቱ እንዴት ፈላ በራሴ ያፈሰስከው
ዙፋን ልታወርሰኝ ልቤን የመረጥከው
የኔ የተወደደው ከኤልያም ደም ግባት
መድሀኒቴ ኢየሱስ ሆነኸኝ ነው ውበት

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 6
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ/2/

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት',
        lyrics_transliteration = 'CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 1
Bemedafh qerts’eh hule tayegnaleh
Medhenite Iyesus bedelen eresteh
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 2
Yeabrhemn migbar yeyosefn emnet
Ts’dqn balkwalew baladerg meqenet
Mahtebun yizhalehu yedemun t’ebta
Medhenite Iyesus akbrognal Geta

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 3
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn
Endalfew yeredagn yeesatun bahr
Min migbar norogn new kets’dq yemiqot’er

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 4
Yelbe kurat new yeayne kefta
Medhenite Iyesus yeserawit Geta
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 5
Zeytu endet fela berase yafeseskew
Zufan litawersegn liben yemeret’kew
Yene yetewededew keelyam dem gibat
Medhenite Iyesus honeኸgn new wibet

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 6
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn (2)

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a119f92b-608d-4dbf-a6b6-5898cdb04f6e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 1
በመዳፍህ ቀርፀህ ሁሌ ታየኛለህ
መድሀኒቴ ኢየሱስ በደሌን እረስተህ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 2
የአብርሀምን ምግባር የዮሴፍን እምነት
ፅድቅን ባልኳለው ባላደርግ መቀነት
ማህተቡን ይዣለሁ የደሙን ጠብታ
መድሀኒቴ ኢየሱስ አክብሮኛል ጌታ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 3
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ
እንዳልፈው የረዳኝ የእሳቱን ባህር
ምን ምግባር ኖሮኝ ነው ከፅድቅ የሚቆጠር

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 4
የልቤ ኩራት ነው የአይኔ ከፍታ
መድሀኒቴ ኢየሱስ የሠራዊት ጌታ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 5
ዘይቱ እንዴት ፈላ በራሴ ያፈሰስከው
ዙፋን ልታወርሰኝ ልቤን የመረጥከው
የኔ የተወደደው ከኤልያም ደም ግባት
መድሀኒቴ ኢየሱስ ሆነኸኝ ነው ውበት

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 6
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ/2/

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a119f92b-608d-4dbf-a6b6-5898cdb04f6e'::uuid, 'yetegnaw-siraye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fikirih-marekegn-selam-leki ("Fikirih Marekegn : Selam Leki")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a0a4e273-31b4-46ac-a263-3d4cdc5263d9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)
ሰላም ለኪ ማርያም ሰላም
ሰላም ለኪ ፈጽሞ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 7
ሰላም ለኪ ማርያም ሰላም
የህይወት መሰረት የፍጥረት አለኝታ
ግንባር አደራሽልን መከታ
ሰላም ለኪ ማርያም ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 8
ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም
ብዙ ነፍስ አጥፍቶ
ያንቺ ስም ለጠራ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 9
ሰላም ለኪ ስትል
ሰላም ለኪ ሰላም
ለኪ ማርያም ሰላም
ለኪ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 10
ለኪ ማርያም ሰላም
ሰላም ለአንደበሻ አማላጅ አማላክ ድንግል ሆይ
አደራሽን ከልጅሽ
ሰላም ለኪ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 11
ሰላም ለኪ ማርያም ሰላም
እኛ ብንከተል ብንከተል በጎ መንገድ
በሰላም በጤና ሰላም ለኪ እንኖራለን
ሰላም ለኪ ሰላም ለኪ ማርያም ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 12
ለኪ ሰላም ማርያም ሰላም ለኪ
ማርያም ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም ለኪ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ ድል ላይ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 13
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 14
ሰማይተ ኢየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ
ሰማይተ እየሱስ መርቆርዮስ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 15
ጌታ ተነስቷል
እልልልልልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 16
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችንም ክርስቶስ ተነስቶ
አዳምን ለማዳን ቃልኪዳን ገብቶልን

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 17
ዘመኑን ጠብቆ
ከአሳዳሪው ከሰማያት ወርዶ
የተሰቀለው ሞትን በሞት ሽሮ
ይህው ጌታ ተነስቷል በሉ አምላክ ተነስቷል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 18
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ
ደቀመዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በሃዘን ተመተው

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 19
በተዘጋ ደጃፍ ተሰብስበው
እጆቹን ዘርግቶ ሰላም ለናንተ አለ
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 20
ሁላችን አየነው ክርስቶስ ተነስቶ
ማርያም መግደላዊት እየቀሰቀሰች
በሌሊት ተነስታ ወደ አምላኳ ሄደች
አይሁዳን ገድለው የሰቀሉት ጌታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 21
ተነስቶ አግኝታው ተሞላች በደስታ
ጌታ ተነስቷል እልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ሃይሉን አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቷል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)
Selam leki Maryam selam
Selam leki fets’mo selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 7
Selam leki Maryam selam
Yehywet meseret yeft’ret alegnta
Ginbar aderashln meketa
Selam leki Maryam selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 8
Selam leki selam
Selam leki Maryam selam
Bizu nefs at’fto
Yanchi sim let’era

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 9
Selam leki sitl
Selam leki selam
Leki Maryam selam
Leki selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 10
Leki Maryam selam
Selam leandebesha amalaj amalak Dingil hoy
Aderashn keljsh
Selam leki selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 11
Selam leki Maryam selam
Egna binketel binketel bego menged
Beselam bet’ena selam leki ennoralen
Selam leki selam leki Maryam selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 12
Leki selam Maryam selam leki
Maryam selam leki selam
Selam leki Maryam selam leki
Semayte eyesus semayte Iyesus merqoryos dil lay

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 13
Semayte eyesus semayte Iyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus merqoryos

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 14
Semayte Iyesus semayte Iyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus semayte Iyesus
Semayte eyesus merqoryos

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 15
Geta tenestwal
Ellllll belu amlak tenestwal
Misrach belu motn meqabr at’fto
Hulachn ayenew Kristos tenesto

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 16
Geta tenestwal belu amlak tenestwal
Misrach belu motn meqabr kehaylu at’fto
Hulachnm Kristos tenesto
Adamn lemadan qalkidan gebtoln

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 17
Zemenun t’ebqo
Keasadariw kesemayat werdo
Yeteseqelew motn bemot shro
Yihw Geta tenestwal belu amlak tenestwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 18
Misrach belu motn meqabr kehaylu at’fto
Hulachn ayenew Kristos tenesto
Deqemezamurtu ejgun tech’enqew
Begetachew memot behazen temetew

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 19
Betezega dejaf tesebsbew
Ejochun zergto selam lenante ale
Geta tenestwal belu amlak tenestwal
Misrach belu motn meqabr kehaylu at’fto

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 20
Hulachn ayenew Kristos tenesto
Maryam megdelawit eyeqeseqesech
Belelit tenesta wede amlakwa hedech
Ayhudan gedlew yeseqelut Geta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 21
Tenesto aggntaw temolach bedesta
Geta tenestwal ell belu amlak tenestwal
Misrach belu motn meqabr haylun at’fto
Hulachn ayenew Kristos tenestwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)
ሰላም ለኪ ማርያም ሰላም
ሰላም ለኪ ፈጽሞ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 7
ሰላም ለኪ ማርያም ሰላም
የህይወት መሰረት የፍጥረት አለኝታ
ግንባር አደራሽልን መከታ
ሰላም ለኪ ማርያም ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 8
ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም
ብዙ ነፍስ አጥፍቶ
ያንቺ ስም ለጠራ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 9
ሰላም ለኪ ስትል
ሰላም ለኪ ሰላም
ለኪ ማርያም ሰላም
ለኪ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 10
ለኪ ማርያም ሰላም
ሰላም ለአንደበሻ አማላጅ አማላክ ድንግል ሆይ
አደራሽን ከልጅሽ
ሰላም ለኪ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 11
ሰላም ለኪ ማርያም ሰላም
እኛ ብንከተል ብንከተል በጎ መንገድ
በሰላም በጤና ሰላም ለኪ እንኖራለን
ሰላም ለኪ ሰላም ለኪ ማርያም ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 12
ለኪ ሰላም ማርያም ሰላም ለኪ
ማርያም ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም ለኪ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ ድል ላይ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 13
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 14
ሰማይተ ኢየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ
ሰማይተ እየሱስ መርቆርዮስ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 15
ጌታ ተነስቷል
እልልልልልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 16
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችንም ክርስቶስ ተነስቶ
አዳምን ለማዳን ቃልኪዳን ገብቶልን

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 17
ዘመኑን ጠብቆ
ከአሳዳሪው ከሰማያት ወርዶ
የተሰቀለው ሞትን በሞት ሽሮ
ይህው ጌታ ተነስቷል በሉ አምላክ ተነስቷል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 18
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ
ደቀመዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በሃዘን ተመተው

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 19
በተዘጋ ደጃፍ ተሰብስበው
እጆቹን ዘርግቶ ሰላም ለናንተ አለ
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 20
ሁላችን አየነው ክርስቶስ ተነስቶ
ማርያም መግደላዊት እየቀሰቀሰች
በሌሊት ተነስታ ወደ አምላኳ ሄደች
አይሁዳን ገድለው የሰቀሉት ጌታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 21
ተነስቶ አግኝታው ተሞላች በደስታ
ጌታ ተነስቷል እልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ሃይሉን አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቷል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)',
        lyrics_transliteration = 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)
Selam leki Maryam selam
Selam leki fets’mo selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 7
Selam leki Maryam selam
Yehywet meseret yeft’ret alegnta
Ginbar aderashln meketa
Selam leki Maryam selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 8
Selam leki selam
Selam leki Maryam selam
Bizu nefs at’fto
Yanchi sim let’era

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 9
Selam leki sitl
Selam leki selam
Leki Maryam selam
Leki selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 10
Leki Maryam selam
Selam leandebesha amalaj amalak Dingil hoy
Aderashn keljsh
Selam leki selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 11
Selam leki Maryam selam
Egna binketel binketel bego menged
Beselam bet’ena selam leki ennoralen
Selam leki selam leki Maryam selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 12
Leki selam Maryam selam leki
Maryam selam leki selam
Selam leki Maryam selam leki
Semayte eyesus semayte Iyesus merqoryos dil lay

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 13
Semayte eyesus semayte Iyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus merqoryos

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 14
Semayte Iyesus semayte Iyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus semayte Iyesus
Semayte eyesus merqoryos

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 15
Geta tenestwal
Ellllll belu amlak tenestwal
Misrach belu motn meqabr at’fto
Hulachn ayenew Kristos tenesto

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 16
Geta tenestwal belu amlak tenestwal
Misrach belu motn meqabr kehaylu at’fto
Hulachnm Kristos tenesto
Adamn lemadan qalkidan gebtoln

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 17
Zemenun t’ebqo
Keasadariw kesemayat werdo
Yeteseqelew motn bemot shro
Yihw Geta tenestwal belu amlak tenestwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 18
Misrach belu motn meqabr kehaylu at’fto
Hulachn ayenew Kristos tenesto
Deqemezamurtu ejgun tech’enqew
Begetachew memot behazen temetew

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 19
Betezega dejaf tesebsbew
Ejochun zergto selam lenante ale
Geta tenestwal belu amlak tenestwal
Misrach belu motn meqabr kehaylu at’fto

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 20
Hulachn ayenew Kristos tenesto
Maryam megdelawit eyeqeseqesech
Belelit tenesta wede amlakwa hedech
Ayhudan gedlew yeseqelut Geta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 21
Tenesto aggntaw temolach bedesta
Geta tenestwal ell belu amlak tenestwal
Misrach belu motn meqabr haylun at’fto
Hulachn ayenew Kristos tenestwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a0a4e273-31b4-46ac-a263-3d4cdc5263d9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)
ሰላም ለኪ ማርያም ሰላም
ሰላም ለኪ ፈጽሞ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 7
ሰላም ለኪ ማርያም ሰላም
የህይወት መሰረት የፍጥረት አለኝታ
ግንባር አደራሽልን መከታ
ሰላም ለኪ ማርያም ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 8
ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም
ብዙ ነፍስ አጥፍቶ
ያንቺ ስም ለጠራ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 9
ሰላም ለኪ ስትል
ሰላም ለኪ ሰላም
ለኪ ማርያም ሰላም
ለኪ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 10
ለኪ ማርያም ሰላም
ሰላም ለአንደበሻ አማላጅ አማላክ ድንግል ሆይ
አደራሽን ከልጅሽ
ሰላም ለኪ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 11
ሰላም ለኪ ማርያም ሰላም
እኛ ብንከተል ብንከተል በጎ መንገድ
በሰላም በጤና ሰላም ለኪ እንኖራለን
ሰላም ለኪ ሰላም ለኪ ማርያም ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 12
ለኪ ሰላም ማርያም ሰላም ለኪ
ማርያም ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም ለኪ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ ድል ላይ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 13
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 14
ሰማይተ ኢየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ
ሰማይተ እየሱስ መርቆርዮስ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 15
ጌታ ተነስቷል
እልልልልልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 16
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችንም ክርስቶስ ተነስቶ
አዳምን ለማዳን ቃልኪዳን ገብቶልን

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 17
ዘመኑን ጠብቆ
ከአሳዳሪው ከሰማያት ወርዶ
የተሰቀለው ሞትን በሞት ሽሮ
ይህው ጌታ ተነስቷል በሉ አምላክ ተነስቷል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 18
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ
ደቀመዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በሃዘን ተመተው

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 19
በተዘጋ ደጃፍ ተሰብስበው
እጆቹን ዘርግቶ ሰላም ለናንተ አለ
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 20
ሁላችን አየነው ክርስቶስ ተነስቶ
ማርያም መግደላዊት እየቀሰቀሰች
በሌሊት ተነስታ ወደ አምላኳ ሄደች
አይሁዳን ገድለው የሰቀሉት ጌታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 21
ተነስቶ አግኝታው ተሞላች በደስታ
ጌታ ተነስቷል እልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ሃይሉን አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቷል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a0a4e273-31b4-46ac-a263-3d4cdc5263d9'::uuid, 'fikirih-marekegn-selam-leki', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- maranata ("MARANATA")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a234e848-b41d-4984-91c6-5ebf0c37c068'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 1
ሕይወት ጸልሚታ ብርሃና ሓቢኣ
ክፍኣት ተጎልቢባ ረሲሓ ሓጢኣ
ፋኑስ መብራህትና መንገዲ ሓጎስና
ማራናታ ጎይታ ክርስቶስ ምጸና

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 2
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ሓጎስን ሓዘንን ብኽያት ምስ ፍሽኽታ
ስሓቕን ብኽያትን ኣዉያት ምስ እልልታ
እንዳተቐያየሩ ስቓይና ኣብዚሖም

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 3
ማራናታ ጎይታ ንዓ መድሕን ዓለም
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
መንገዲ ጸበባ ዓለም ብጸልማታ
ተረሲዑ ሓጎስ ሓዘን ብወጋሕታ

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 4
ተስፋ ኣይንቖርጽን ጸልሚቱና ኢልና
ማራናታ ጎይታ ንብል ብርሃን ክትኮነልና
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ዘይትግመት ህይወት ሃንደበት ሓቒፋ

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 5
እንዳ ዓንቀፈት ተፀነትና ተስፋ
ተስፋና ኣብ ዓለም ፈጺሙ ኣይኮነን
ንረኽበላን ንኸስበላን ወላሓደ የለን
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 1
Hiywet ts’elmita birhana habia
Kifat tegolbiba resiha hat’ia
Fanus mebrahtna mengedi hagosna
Maranata goyta Kristos mits’ena

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 2
“maranata goyta Kristos mits’ena (2)”
Hagosn hazenn biኽyat mis fishኽta
Sihaቕn biኽyatn awuyat mis ellta
Endateቐyayeru siቓyna abzihom

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 3
Maranata goyta nia medhn alem
“maranata goyta Kristos mits’ena (2)”
Mengedi ts’ebeba alem bits’elmata
Teresiu hagos hazen biwegahta

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 4
Tesfa aynቖrts’n ts’elmituna ilna
Maranata goyta nibl birhan kitkonelna
“maranata goyta Kristos mits’ena (2)”
Zeytgmet hiywet handebet haቒfa

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 5
Enda anqefet tets’enetna tesfa
Tesfana ab alem fets’imu aykonen
Nireኽbelan niኸsbelan welahade yelen
“maranata goyta Kristos mits’ena (2)”

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 1
ሕይወት ጸልሚታ ብርሃና ሓቢኣ
ክፍኣት ተጎልቢባ ረሲሓ ሓጢኣ
ፋኑስ መብራህትና መንገዲ ሓጎስና
ማራናታ ጎይታ ክርስቶስ ምጸና

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 2
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ሓጎስን ሓዘንን ብኽያት ምስ ፍሽኽታ
ስሓቕን ብኽያትን ኣዉያት ምስ እልልታ
እንዳተቐያየሩ ስቓይና ኣብዚሖም

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 3
ማራናታ ጎይታ ንዓ መድሕን ዓለም
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
መንገዲ ጸበባ ዓለም ብጸልማታ
ተረሲዑ ሓጎስ ሓዘን ብወጋሕታ

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 4
ተስፋ ኣይንቖርጽን ጸልሚቱና ኢልና
ማራናታ ጎይታ ንብል ብርሃን ክትኮነልና
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ዘይትግመት ህይወት ሃንደበት ሓቒፋ

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 5
እንዳ ዓንቀፈት ተፀነትና ተስፋ
ተስፋና ኣብ ዓለም ፈጺሙ ኣይኮነን
ንረኽበላን ንኸስበላን ወላሓደ የለን
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ',
        lyrics_transliteration = 'CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 1
Hiywet ts’elmita birhana habia
Kifat tegolbiba resiha hat’ia
Fanus mebrahtna mengedi hagosna
Maranata goyta Kristos mits’ena

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 2
“maranata goyta Kristos mits’ena (2)”
Hagosn hazenn biኽyat mis fishኽta
Sihaቕn biኽyatn awuyat mis ellta
Endateቐyayeru siቓyna abzihom

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 3
Maranata goyta nia medhn alem
“maranata goyta Kristos mits’ena (2)”
Mengedi ts’ebeba alem bits’elmata
Teresiu hagos hazen biwegahta

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 4
Tesfa aynቖrts’n ts’elmituna ilna
Maranata goyta nibl birhan kitkonelna
“maranata goyta Kristos mits’ena (2)”
Zeytgmet hiywet handebet haቒfa

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 5
Enda anqefet tets’enetna tesfa
Tesfana ab alem fets’imu aykonen
Nireኽbelan niኸsbelan welahade yelen
“maranata goyta Kristos mits’ena (2)”

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a234e848-b41d-4984-91c6-5ebf0c37c068'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 1
ሕይወት ጸልሚታ ብርሃና ሓቢኣ
ክፍኣት ተጎልቢባ ረሲሓ ሓጢኣ
ፋኑስ መብራህትና መንገዲ ሓጎስና
ማራናታ ጎይታ ክርስቶስ ምጸና

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 2
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ሓጎስን ሓዘንን ብኽያት ምስ ፍሽኽታ
ስሓቕን ብኽያትን ኣዉያት ምስ እልልታ
እንዳተቐያየሩ ስቓይና ኣብዚሖም

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 3
ማራናታ ጎይታ ንዓ መድሕን ዓለም
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
መንገዲ ጸበባ ዓለም ብጸልማታ
ተረሲዑ ሓጎስ ሓዘን ብወጋሕታ

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 4
ተስፋ ኣይንቖርጽን ጸልሚቱና ኢልና
ማራናታ ጎይታ ንብል ብርሃን ክትኮነልና
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ዘይትግመት ህይወት ሃንደበት ሓቒፋ

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 5
እንዳ ዓንቀፈት ተፀነትና ተስፋ
ተስፋና ኣብ ዓለም ፈጺሙ ኣይኮነን
ንረኽበላን ንኸስበላን ወላሓደ የለን
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a234e848-b41d-4984-91c6-5ebf0c37c068'::uuid, 'maranata', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emebetachin-banichi-milija ("Emebetachin Banichi Milija")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a3cdae2f-d233-4a65-8d0c-5e5d8004674a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና',
        lyrics_transliteration = 'CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a3cdae2f-d233-4a65-8d0c-5e5d8004674a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a3cdae2f-d233-4a65-8d0c-5e5d8004674a'::uuid, 'emebetachin-banichi-milija', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sidiben-arikesh-newiren-shefenishiw ("Sidiben Arikesh Newiren Shefenishiw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a22c8929-0ef5-4773-b68a-0757789fde12'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 1
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሐዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 2
እንደ ሃና ሆኜ ከቤተ መቅደስ
በመረረ ሐዘን ነው እኔ የማለቅስ
ፍረጅልኝና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 3
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ
አዝ
መከራው በዝቶ ግራ ገብቶኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 4
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 5
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጠራሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 6
ከመከራ ሁሉ ታወጪኛለሽ
አዝ
በምርኮ ሳለሁ በሰው ሀገር
ግፍ ጥለውብኝ ስኖር በእስር

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 7
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በተአምራትሽ እኔ ድኛለሁ
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 8
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኸው ባረከችኝ
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዝልኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 9
አዝ
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅ ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 10
ይሞላልና የጎደለው
ግራ የገባው የቸገረው
ድንግልን ይጥራት እንድትረዳው
ሳዝን ስተክዝ የምታጽናና

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 11
እናት አለችኝ ርኅርኂተ ልቦና
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 1
Newr alebgn bizu sidb
Anjet yemilt’ lib yemiyaqosl
Simen lewt’ew biyanqwashshugn
Behezen beleqso Dingil met’ahugn

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 2
Ende hana hogne kebete meqdes
Bemerere hezen new ene yemaleqs
Firejlgnna limeles kebete
Hezenen bedesta lewch’iw enate

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 3
Begram beqegnm t’elat bikebegn
Abzche ech’ohalew enate simign
CHORUS
Mekeraw bezto gira gebtognal

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 4
Dimts’shn lisma yaregagagnal
Yesew hiywetu birtu self new
Destana hezen yemayleyew
Beejachn wedqwal silugn t’elatoche

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 5
Amelet’kwachew simshn t’erche
Sew yezerawn yannu yach’dal
Beqoferew gudgwad rasu yigebal
Enate Emebete biye sit’erash

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 6
Kemekera hulu tawech’ignalesh
CHORUS
Bemrko salehu besew heger
Gif t’lewbgn sinor beesr

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 7
Miljash dersolgn tefetchalehu
Beteamratsh ene dignalehu
Qalshn semto ts’nsu segede
Bilalech elsabet’ newre tewegede

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 8
Yegetaye enat enen asebechgn
Tariken qeyra yiኸw barekechgn
Yeemebete kehonku man yiqawemegnal
Wejebum maebelum yitazezlgnal

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 9
CHORUS
Weynko alqwal yedokimas bet
Dingil amalj ney yeegna emebet
Simsh sit’era beyebotaw

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 10
Yimolalna yegodelew
Gira yegebaw yechegerew
Dingln yit’rat endtredaw
Sazn sitekz yemtats’nana

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 11
Enat alechgn rihrhite libona
Enate Emebete biye sit’erash
Kemekera hulu tawech’ignalesh

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 1
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሐዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 2
እንደ ሃና ሆኜ ከቤተ መቅደስ
በመረረ ሐዘን ነው እኔ የማለቅስ
ፍረጅልኝና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 3
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ
አዝ
መከራው በዝቶ ግራ ገብቶኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 4
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 5
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጠራሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 6
ከመከራ ሁሉ ታወጪኛለሽ
አዝ
በምርኮ ሳለሁ በሰው ሀገር
ግፍ ጥለውብኝ ስኖር በእስር

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 7
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በተአምራትሽ እኔ ድኛለሁ
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 8
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኸው ባረከችኝ
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዝልኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 9
አዝ
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅ ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 10
ይሞላልና የጎደለው
ግራ የገባው የቸገረው
ድንግልን ይጥራት እንድትረዳው
ሳዝን ስተክዝ የምታጽናና

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ

VERSE 11
እናት አለችኝ ርኅርኂተ ልቦና
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ',
        lyrics_transliteration = 'CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 1
Newr alebgn bizu sidb
Anjet yemilt’ lib yemiyaqosl
Simen lewt’ew biyanqwashshugn
Behezen beleqso Dingil met’ahugn

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 2
Ende hana hogne kebete meqdes
Bemerere hezen new ene yemaleqs
Firejlgnna limeles kebete
Hezenen bedesta lewch’iw enate

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 3
Begram beqegnm t’elat bikebegn
Abzche ech’ohalew enate simign
CHORUS
Mekeraw bezto gira gebtognal

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 4
Dimts’shn lisma yaregagagnal
Yesew hiywetu birtu self new
Destana hezen yemayleyew
Beejachn wedqwal silugn t’elatoche

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 5
Amelet’kwachew simshn t’erche
Sew yezerawn yannu yach’dal
Beqoferew gudgwad rasu yigebal
Enate Emebete biye sit’erash

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 6
Kemekera hulu tawech’ignalesh
CHORUS
Bemrko salehu besew heger
Gif t’lewbgn sinor beesr

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 7
Miljash dersolgn tefetchalehu
Beteamratsh ene dignalehu
Qalshn semto ts’nsu segede
Bilalech elsabet’ newre tewegede

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 8
Yegetaye enat enen asebechgn
Tariken qeyra yiኸw barekechgn
Yeemebete kehonku man yiqawemegnal
Wejebum maebelum yitazezlgnal

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 9
CHORUS
Weynko alqwal yedokimas bet
Dingil amalj ney yeegna emebet
Simsh sit’era beyebotaw

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 10
Yimolalna yegodelew
Gira yegebaw yechegerew
Dingln yit’rat endtredaw
Sazn sitekz yemtats’nana

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu

VERSE 11
Enat alechgn rihrhite libona
Enate Emebete biye sit’erash
Kemekera hulu tawech’ignalesh

CHORUS
Sidben arqesh newren shefenshw
Emeamlak beanchi mechem alafrm
Simshn t’erche ets’nanalehu
Hezenen beanchi eresalehu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a22c8929-0ef5-4773-b68a-0757789fde12'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሐዘን በለቅሶ ድንግል መጣሁኝ
እንደ ሃና ሆኜ ከቤተ መቅደስ
በመረረ ሐዘን ነው እኔ የማለቅስ
ፍረጅልኝና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ
አዝ= = = = =
መከራው በዝቶ ግራ ገብቶኛል
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ
አዝ = = = = =
በምርኮ ሳለሁ በሰው ሀገር
ግፍ ጥለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በተአምራትሽ እኔ ድኛለሁ
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኸው ባረከችኝ
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዝልኛል
አዝ= = = = =
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅ ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው
ይሞላልና የጎደለው
ግራ የገባው የቸገረው
ድንግልን ይጥራት እንድትረዳው
ሳዝን ስተክዝ የምታጽናና
እናት አለችኝ ርኅርኂተ ልቦና
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

VERSE 1
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሐዘን በለቅሶ ድንግል መጣሁኝ
እንደ ሃና ሆኜ ከቤተ መቅደስ
በመረረ ሐዘን ነው እኔ የማለቅስ
ፍረጅልኝና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ
አዝ= = = = =
መከራው በዝቶ ግራ ገብቶኛል
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ
አዝ = = = = =
በምርኮ ሳለሁ በሰው ሀገር
ግፍ ጥለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በተአምራትሽ እኔ ድኛለሁ
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኸው ባረከችኝ
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዝልኛል
አዝ= = = = =
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅ ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው
ይሞላልና የጎደለው
ግራ የገባው የቸገረው
ድንግልን ይጥራት እንድትረዳው
ሳዝን ስተክዝ የምታጽናና
እናት አለችኝ ርኅርኂተ ልቦና
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመአምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁ
ሐዘኔን በአንቺ እረሳለሁ
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሐዘን በለቅሶ ድንግል መጣሁኝ
እንደ ሃና ሆኜ ከቤተ መቅደስ
በመረረ ሐዘን ነው እኔ የማለቅስ
ፍረጅልኝና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ
አዝ= = = = =
መከራው በዝቶ ግራ ገብቶኛል
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ
አዝ = = = = =
በምርኮ ሳለሁ በሰው ሀገር
ግፍ ጥለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በተአምራትሽ እኔ ድኛለሁ
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኸው ባረከችኝ
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዝልኛል
አዝ= = = = =
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅ ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው
ይሞላልና የጎደለው
ግራ የገባው የቸገረው
ድንግልን ይጥራት እንድትረዳው
ሳዝን ስተክዝ የምታጽናና
እናት አለችኝ ርኅርኂተ ልቦና
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a22c8929-0ef5-4773-b68a-0757789fde12'::uuid, 'sidiben-arikesh-newiren-shefenishiw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anichi-yewerik-mekija-nesh-2654 ("Anichi Yewerik Mekija Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a4e47ee1-163a-4603-99cc-d90bda57b65c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 1
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 2
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 3
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 4
እኔ እርቃኔ ነኝ
ከጸጋው ርቄ
በክፉ ግብር
በሀጥያት ወድቄ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 5
ማርያም አንቺ ነሽ
የሽማኔ ካባ
ልጅሽ ልብስ ነው
ለሁሌም ይበቃ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 6
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 7
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 8
አንቺ መርከቤ
እኔም ነጋዴ
ልጅሽ እንቁ ነው
ትርፌ ዘመዴ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 9
ለእኔ ለደሃው
ማከማቻዬ
የከበረ ጌጥ
ልጅሽ ቤዛዬ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 10
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 11
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 12
እኔ ተጓዥ ነኝ
አንቺ መግዣ
ልጅሽ ወደብ ነው
የሕይወት ማረፍያ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 13
አንቺ ፊደል ነሽ
እኔ ተማሪ
ልጅሽ ወንጌል ነው
ቸር አስታማሪ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 14
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 15
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 1
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 2
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 3
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 4
Ene erqane negn
Kets’egaw riqe
Bekfu gibr
Behet’yat wedqe

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 5
Maryam anchi nesh
Yeshmane kaba
Lijsh libs new
Lehulem yibeqa

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 6
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 7
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 8
Anchi merkebe
Enem negade
Lijsh enqu new
Tirfe zemede

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 9
Leene ledehaw
Makemachaye
Yekebere get’
Lijsh bezaye

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 10
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 11
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 12
Ene tegwazh negn
Anchi megzha
Lijsh wedeb new
Yehywet marefya

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 13
Anchi fidel nesh
Ene temari
Lijsh wengel new
Cher astamari

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 14
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 15
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 1
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 2
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 3
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 4
እኔ እርቃኔ ነኝ
ከጸጋው ርቄ
በክፉ ግብር
በሀጥያት ወድቄ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 5
ማርያም አንቺ ነሽ
የሽማኔ ካባ
ልጅሽ ልብስ ነው
ለሁሌም ይበቃ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 6
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 7
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 8
አንቺ መርከቤ
እኔም ነጋዴ
ልጅሽ እንቁ ነው
ትርፌ ዘመዴ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 9
ለእኔ ለደሃው
ማከማቻዬ
የከበረ ጌጥ
ልጅሽ ቤዛዬ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 10
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 11
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 12
እኔ ተጓዥ ነኝ
አንቺ መግዣ
ልጅሽ ወደብ ነው
የሕይወት ማረፍያ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 13
አንቺ ፊደል ነሽ
እኔ ተማሪ
ልጅሽ ወንጌል ነው
ቸር አስታማሪ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 14
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 15
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ',
        lyrics_transliteration = 'CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 1
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 2
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 3
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 4
Ene erqane negn
Kets’egaw riqe
Bekfu gibr
Behet’yat wedqe

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 5
Maryam anchi nesh
Yeshmane kaba
Lijsh libs new
Lehulem yibeqa

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 6
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 7
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 8
Anchi merkebe
Enem negade
Lijsh enqu new
Tirfe zemede

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 9
Leene ledehaw
Makemachaye
Yekebere get’
Lijsh bezaye

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 10
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 11
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 12
Ene tegwazh negn
Anchi megzha
Lijsh wedeb new
Yehywet marefya

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 13
Anchi fidel nesh
Ene temari
Lijsh wengel new
Cher astamari

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 14
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 15
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a4e47ee1-163a-4603-99cc-d90bda57b65c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 1
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 2
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 3
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 4
እኔ እርቃኔ ነኝ
ከጸጋው ርቄ
በክፉ ግብር
በሀጥያት ወድቄ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 5
ማርያም አንቺ ነሽ
የሽማኔ ካባ
ልጅሽ ልብስ ነው
ለሁሌም ይበቃ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 6
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 7
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 8
አንቺ መርከቤ
እኔም ነጋዴ
ልጅሽ እንቁ ነው
ትርፌ ዘመዴ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 9
ለእኔ ለደሃው
ማከማቻዬ
የከበረ ጌጥ
ልጅሽ ቤዛዬ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 10
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 11
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 12
እኔ ተጓዥ ነኝ
አንቺ መግዣ
ልጅሽ ወደብ ነው
የሕይወት ማረፍያ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 13
አንቺ ፊደል ነሽ
እኔ ተማሪ
ልጅሽ ወንጌል ነው
ቸር አስታማሪ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 14
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 15
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a4e47ee1-163a-4603-99cc-d90bda57b65c'::uuid, 'anichi-yewerik-mekija-nesh-2654', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeselame-sew-yalkut ("Yeselame sew yalkut")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a5a34cfe-0451-4871-9cb9-85c69c7e27e6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 1
ወዳጄ ብዬ ያልኩት ታዲያ ዛሬ የት አለ፡
የታል ወዳጄ የታል አምጡልኝ የልቤን ሰው፡
ፍቅሩ ቢጎድልብኝ ነው እንባዬን የማፈሰው፡፡
በጭራሽ እንዳልከፋዉ ስሲቅ ሲጫወት ውሎ፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 2
አመሻሹ ላይ ወጣ አቤት የቀን ጎደሎ፡
አቤት የቀን ክፋቱ ማን ይህን ጠረጠረ፡
ወዳጄ ማነው ታዲያ ገንዘብ ሰው ከቀየረ፡፡
መሃላ ቃልኪዳኑ ያ ሁሉ ብዙ ቃላት፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 3
ዛሬ ሁሉም ተረሳ ተዘነጋ እንደዘበት፡
የት አለ መዋደዳችን የት አለ የጥንቱ ፍቅር፡
ቀና ማለት ይሻላል በድሎ ከማቀርቀር፡፡
ሰላሳ ዲናር ወስዶ ይሳምም ይንከሰኝ፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 4
አፈር ስሆን እያለ አፈር የሚያስበላኝ፡
እርሱን ሰው ይቅር በለው እርሱን ሰው ማርልኝ፡
ይቅር ማለት ሳውቅ ነው ይቅር የምትለኝ፡፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 1
Wedaje biye yalkut tadiya zare yet ale
Yetal wedaje yetal amt’ulgn yelben sew
Fiqru bigodlbgn new enbayen yemafesew
Bech’rash endalkefawu sisiq sich’awet wilo

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 2
Ameshashu lay wet’a abet yeqen godelo
Abet yeqen kifatu man yihn t’eret’ere
Wedaje manew tadiya genzeb sew keqeyere
Mehala qalkidanu ya hulu bizu qalat

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 3
Zare hulum teresa tezenega endezebet
Yet ale mewadedachn yet ale yet’ntu fiqr
Qena malet yishalal bedlo kemaqerqer
Selasa dinar wesdo yisamm yinkesegn

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 4
Afer sihon eyale afer yemiyasbelagn
Ersun sew yiqr belew ersun sew marlgn
Yiqr malet sawq new yiqr yemtlegn

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 1
ወዳጄ ብዬ ያልኩት ታዲያ ዛሬ የት አለ፡
የታል ወዳጄ የታል አምጡልኝ የልቤን ሰው፡
ፍቅሩ ቢጎድልብኝ ነው እንባዬን የማፈሰው፡፡
በጭራሽ እንዳልከፋዉ ስሲቅ ሲጫወት ውሎ፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 2
አመሻሹ ላይ ወጣ አቤት የቀን ጎደሎ፡
አቤት የቀን ክፋቱ ማን ይህን ጠረጠረ፡
ወዳጄ ማነው ታዲያ ገንዘብ ሰው ከቀየረ፡፡
መሃላ ቃልኪዳኑ ያ ሁሉ ብዙ ቃላት፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 3
ዛሬ ሁሉም ተረሳ ተዘነጋ እንደዘበት፡
የት አለ መዋደዳችን የት አለ የጥንቱ ፍቅር፡
ቀና ማለት ይሻላል በድሎ ከማቀርቀር፡፡
ሰላሳ ዲናር ወስዶ ይሳምም ይንከሰኝ፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 4
አፈር ስሆን እያለ አፈር የሚያስበላኝ፡
እርሱን ሰው ይቅር በለው እርሱን ሰው ማርልኝ፡
ይቅር ማለት ሳውቅ ነው ይቅር የምትለኝ፡፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡',
        lyrics_transliteration = 'CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 1
Wedaje biye yalkut tadiya zare yet ale
Yetal wedaje yetal amt’ulgn yelben sew
Fiqru bigodlbgn new enbayen yemafesew
Bech’rash endalkefawu sisiq sich’awet wilo

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 2
Ameshashu lay wet’a abet yeqen godelo
Abet yeqen kifatu man yihn t’eret’ere
Wedaje manew tadiya genzeb sew keqeyere
Mehala qalkidanu ya hulu bizu qalat

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 3
Zare hulum teresa tezenega endezebet
Yet ale mewadedachn yet ale yet’ntu fiqr
Qena malet yishalal bedlo kemaqerqer
Selasa dinar wesdo yisamm yinkesegn

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 4
Afer sihon eyale afer yemiyasbelagn
Ersun sew yiqr belew ersun sew marlgn
Yiqr malet sawq new yiqr yemtlegn

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a5a34cfe-0451-4871-9cb9-85c69c7e27e6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 1
ወዳጄ ብዬ ያልኩት ታዲያ ዛሬ የት አለ፡
የታል ወዳጄ የታል አምጡልኝ የልቤን ሰው፡
ፍቅሩ ቢጎድልብኝ ነው እንባዬን የማፈሰው፡፡
በጭራሽ እንዳልከፋዉ ስሲቅ ሲጫወት ውሎ፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 2
አመሻሹ ላይ ወጣ አቤት የቀን ጎደሎ፡
አቤት የቀን ክፋቱ ማን ይህን ጠረጠረ፡
ወዳጄ ማነው ታዲያ ገንዘብ ሰው ከቀየረ፡፡
መሃላ ቃልኪዳኑ ያ ሁሉ ብዙ ቃላት፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 3
ዛሬ ሁሉም ተረሳ ተዘነጋ እንደዘበት፡
የት አለ መዋደዳችን የት አለ የጥንቱ ፍቅር፡
ቀና ማለት ይሻላል በድሎ ከማቀርቀር፡፡
ሰላሳ ዲናር ወስዶ ይሳምም ይንከሰኝ፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 4
አፈር ስሆን እያለ አፈር የሚያስበላኝ፡
እርሱን ሰው ይቅር በለው እርሱን ሰው ማርልኝ፡
ይቅር ማለት ሳውቅ ነው ይቅር የምትለኝ፡፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a5a34cfe-0451-4871-9cb9-85c69c7e27e6'::uuid, 'yeselame-sew-yalkut', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sayegebagn ("Sayegebagn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a7b3232c-c44d-4559-bdc5-cf5b6774f77e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 1
ምን ያላረክልኝ አለ ጌታ ለኔ
ምንም ባሳዝንህ በምግባሬ
ኃጢአቴን ተመልክተህ ቸል ያላልከኝ
በህይወቴ ብዙ ነገር ስራህልኝ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 2
አ.ዝ //
ውለታህ ብዙ ነው ያንተ ወስን የለው
ተናግሬ እኔ አልጨርስው
ውድቀቴንም ድክመቴንም እኔ አውቃለሁ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 3
የጠበቀኝ ቸርነትህ ምሕረትህ ነው
አ.ዝ //
ለማይነገረው ፍቅርህ ግሩም ሥራ
ልጆችህን የምጠብቅ ከመከራ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 4
ምን እንመልሳለን ላንተ ላምላካችን
ከመዋረድ አድነኸን ላከበርከን

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 1
Min yalareklgn ale Geta lene
Minm basaznh bemgbare
Hat’iaten temelkteh chel yalalkegn
Behywete bizu neger sirahlgn

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 2
A.z //
Wiletah bizu new yante wesn yelew
Tenagre ene alch’ersw
Widqetenm dikmetenm ene awqalehu

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 3
Yet’ebeqegn cherneth mihreth new
A.z //
Lemaynegerew fiqrh girum sira
Lijochhn yemt’ebq kemekera

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 4
Min enmelsalen lante lamlakachn
Kemewared adneኸn lakeberken

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 1
ምን ያላረክልኝ አለ ጌታ ለኔ
ምንም ባሳዝንህ በምግባሬ
ኃጢአቴን ተመልክተህ ቸል ያላልከኝ
በህይወቴ ብዙ ነገር ስራህልኝ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 2
አ.ዝ //
ውለታህ ብዙ ነው ያንተ ወስን የለው
ተናግሬ እኔ አልጨርስው
ውድቀቴንም ድክመቴንም እኔ አውቃለሁ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 3
የጠበቀኝ ቸርነትህ ምሕረትህ ነው
አ.ዝ //
ለማይነገረው ፍቅርህ ግሩም ሥራ
ልጆችህን የምጠብቅ ከመከራ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 4
ምን እንመልሳለን ላንተ ላምላካችን
ከመዋረድ አድነኸን ላከበርከን

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //',
        lyrics_transliteration = 'CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 1
Min yalareklgn ale Geta lene
Minm basaznh bemgbare
Hat’iaten temelkteh chel yalalkegn
Behywete bizu neger sirahlgn

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 2
A.z //
Wiletah bizu new yante wesn yelew
Tenagre ene alch’ersw
Widqetenm dikmetenm ene awqalehu

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 3
Yet’ebeqegn cherneth mihreth new
A.z //
Lemaynegerew fiqrh girum sira
Lijochhn yemt’ebq kemekera

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 4
Min enmelsalen lante lamlakachn
Kemewared adneኸn lakeberken

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a7b3232c-c44d-4559-bdc5-cf5b6774f77e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 1
ምን ያላረክልኝ አለ ጌታ ለኔ
ምንም ባሳዝንህ በምግባሬ
ኃጢአቴን ተመልክተህ ቸል ያላልከኝ
በህይወቴ ብዙ ነገር ስራህልኝ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 2
አ.ዝ //
ውለታህ ብዙ ነው ያንተ ወስን የለው
ተናግሬ እኔ አልጨርስው
ውድቀቴንም ድክመቴንም እኔ አውቃለሁ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 3
የጠበቀኝ ቸርነትህ ምሕረትህ ነው
አ.ዝ //
ለማይነገረው ፍቅርህ ግሩም ሥራ
ልጆችህን የምጠብቅ ከመከራ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 4
ምን እንመልሳለን ላንተ ላምላካችን
ከመዋረድ አድነኸን ላከበርከን

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a7b3232c-c44d-4559-bdc5-cf5b6774f77e'::uuid, 'sayegebagn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeteshale-neger-3977 ("Yeteshale Neger")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a87f4616-0e4f-4096-84ab-bd4e10b25e90'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል',
        lyrics_transliteration = 'CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a87f4616-0e4f-4096-84ab-bd4e10b25e90'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a87f4616-0e4f-4096-84ab-bd4e10b25e90'::uuid, 'yeteshale-neger-3977', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bersua-tseleyu ("Bersua Tseleyu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a94778bf-24f1-4c45-a481-169d8daaa46a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 1
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ
ሐዋርያት በሰበኳት
ድል ነሽዎች በሞቱላት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 2
ደናግላን በመነኑላት
ስለእርሷ በኖሩላት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 3
ወማህበረነ ውስቴታ
የሰማይ ደጅ በሆነች
ከጽንፍ እስከ ጽንፍ በተሰራች
የምስጋና ዥረት በሚፈስባት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 4
ጸልዩ በርሷ በእውነት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 5
ስጋውና ደሙ በሚሰዋባት
መላዕክቱ በሚረቡባት
ከፍ ብላ በተሰራች
በመስቀሉ ድል ባረገች

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 6
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 1
Bete Kristian Kidist
Wemahberene wisteta
Hewaryat besebekwat
Dil neshwoch bemotulat

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 2
Denaglan bemenenulat
Sileerswa benorulat
Ts’elyu behebe zati
Bete Kristian Kidist

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 3
Wemahberene wisteta
Yesemay dej behonech
Kets’nf eske ts’nf beteserach
Yemsgana zhret bemifesbat

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 4
Ts’elyu berswa beewnet
Ts’elyu behebe zati
Bete Kristian Kidist
Wemahberene wisteta

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 5
Sigawna demu bemisewabat
Melaektu bemirebubat
Kef bila beteserach
Bemesqelu dil baregech

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 6
Ts’elyu behebe zati
Bete Kristian Kidist
Wemahberene wisteta

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 1
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ
ሐዋርያት በሰበኳት
ድል ነሽዎች በሞቱላት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 2
ደናግላን በመነኑላት
ስለእርሷ በኖሩላት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 3
ወማህበረነ ውስቴታ
የሰማይ ደጅ በሆነች
ከጽንፍ እስከ ጽንፍ በተሰራች
የምስጋና ዥረት በሚፈስባት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 4
ጸልዩ በርሷ በእውነት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 5
ስጋውና ደሙ በሚሰዋባት
መላዕክቱ በሚረቡባት
ከፍ ብላ በተሰራች
በመስቀሉ ድል ባረገች

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 6
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ',
        lyrics_transliteration = 'CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 1
Bete Kristian Kidist
Wemahberene wisteta
Hewaryat besebekwat
Dil neshwoch bemotulat

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 2
Denaglan bemenenulat
Sileerswa benorulat
Ts’elyu behebe zati
Bete Kristian Kidist

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 3
Wemahberene wisteta
Yesemay dej behonech
Kets’nf eske ts’nf beteserach
Yemsgana zhret bemifesbat

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 4
Ts’elyu berswa beewnet
Ts’elyu behebe zati
Bete Kristian Kidist
Wemahberene wisteta

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 5
Sigawna demu bemisewabat
Melaektu bemirebubat
Kef bila beteserach
Bemesqelu dil baregech

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 6
Ts’elyu behebe zati
Bete Kristian Kidist
Wemahberene wisteta

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a94778bf-24f1-4c45-a481-169d8daaa46a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 1
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ
ሐዋርያት በሰበኳት
ድል ነሽዎች በሞቱላት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 2
ደናግላን በመነኑላት
ስለእርሷ በኖሩላት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 3
ወማህበረነ ውስቴታ
የሰማይ ደጅ በሆነች
ከጽንፍ እስከ ጽንፍ በተሰራች
የምስጋና ዥረት በሚፈስባት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 4
ጸልዩ በርሷ በእውነት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 5
ስጋውና ደሙ በሚሰዋባት
መላዕክቱ በሚረቡባት
ከፍ ብላ በተሰራች
በመስቀሉ ድል ባረገች

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 6
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a94778bf-24f1-4c45-a481-169d8daaa46a'::uuid, 'bersua-tseleyu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mendo-alo-eyu-zemarit-biruktawit-gebremedhin-tigrigna-orthodox-mezmur ("Mendo Alo Eyu Zemarit Biruktawit Gebremedhin Tigrigna Orthodox Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'aa0b0e8d-637e-4712-9b70-ce4e7211d9a8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 1
ከም ጭካነ ናይ ሰባት ደኣ መዝገብና ተዓጽዩ እንድዩ
ግን ንስኻ ዘይሰመርካዮ ምኽሪ
ዋላ ይደርደር ከቶ የብሉን ዕምሪ
ከንቱ ኢኻ ትገብሮ ከምዘየፍሪ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 2
ኣዝ
ዕምቆቱን ስፍሓቱን ልክዕ መጠኑ ብምርዳእ
ስቡር ልብና ክትዝንኖ ንምልዓልና ትትንስእ
እዚ እምበኣር''ዩ ውሽጥና ዘህድኦ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 3
ጸዓቱ ኮይኑ ከይደክም ዘበርትዖ
ኣብዚ ፈታኒ ግዜ ፍጹም ዘጽንዖ
ኣዝ
ሞት ናይ ሓደ እኳ ኣይትፈቱን ኢኻ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 4
እቲ በዳሊ ንኽጠዓስ ንሱ''ዩ ትባህግኻ
አዒንቱ ክፈት ነቲ ኣብ ሓዉ ዝለዓል
ካብ ክፉእ ግብሩ ክምለስ ሃብ ምስትውዓል
ሓድሕድካ ምጥፍፋእ ደጊምስ ይእከል

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 1
Kem ch’kane nay sebat dea mezgebna teats’yu endyu
Gin nisኻ zeysemerkayo miኽri
Wala yiderder keto yeblun emri
Kentu iኻ tigebro kemzeyefri

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 2
Az
Emqotun sifhatun like met’enu bimrdae
Sibur libna kitznno nimlalna titnse
Ezi embear''yu wisht’na zehdo

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 3
Ts’eatu koynu keydekm zeberto
Abzi fetani gize fits’um zets’no
Az
Mot nay hade ekwa aytfetun iኻ

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 4
Eti bedali niኽt’eas nisu''yu tibahgኻ
Aintu kifet neti ab hawu zileal
Kab kifue gibru kimles hab mistwal
Hadhdka mit’ffae degims yiekel

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 1
ከም ጭካነ ናይ ሰባት ደኣ መዝገብና ተዓጽዩ እንድዩ
ግን ንስኻ ዘይሰመርካዮ ምኽሪ
ዋላ ይደርደር ከቶ የብሉን ዕምሪ
ከንቱ ኢኻ ትገብሮ ከምዘየፍሪ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 2
ኣዝ
ዕምቆቱን ስፍሓቱን ልክዕ መጠኑ ብምርዳእ
ስቡር ልብና ክትዝንኖ ንምልዓልና ትትንስእ
እዚ እምበኣር''ዩ ውሽጥና ዘህድኦ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 3
ጸዓቱ ኮይኑ ከይደክም ዘበርትዖ
ኣብዚ ፈታኒ ግዜ ፍጹም ዘጽንዖ
ኣዝ
ሞት ናይ ሓደ እኳ ኣይትፈቱን ኢኻ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 4
እቲ በዳሊ ንኽጠዓስ ንሱ''ዩ ትባህግኻ
አዒንቱ ክፈት ነቲ ኣብ ሓዉ ዝለዓል
ካብ ክፉእ ግብሩ ክምለስ ሃብ ምስትውዓል
ሓድሕድካ ምጥፍፋእ ደጊምስ ይእከል

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ',
        lyrics_transliteration = 'CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 1
Kem ch’kane nay sebat dea mezgebna teats’yu endyu
Gin nisኻ zeysemerkayo miኽri
Wala yiderder keto yeblun emri
Kentu iኻ tigebro kemzeyefri

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 2
Az
Emqotun sifhatun like met’enu bimrdae
Sibur libna kitznno nimlalna titnse
Ezi embear''yu wisht’na zehdo

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 3
Ts’eatu koynu keydekm zeberto
Abzi fetani gize fits’um zets’no
Az
Mot nay hade ekwa aytfetun iኻ

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 4
Eti bedali niኽt’eas nisu''yu tibahgኻ
Aintu kifet neti ab hawu zileal
Kab kifue gibru kimles hab mistwal
Hadhdka mit’ffae degims yiekel

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'aa0b0e8d-637e-4712-9b70-ce4e7211d9a8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 1
ከም ጭካነ ናይ ሰባት ደኣ መዝገብና ተዓጽዩ እንድዩ
ግን ንስኻ ዘይሰመርካዮ ምኽሪ
ዋላ ይደርደር ከቶ የብሉን ዕምሪ
ከንቱ ኢኻ ትገብሮ ከምዘየፍሪ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 2
ኣዝ
ዕምቆቱን ስፍሓቱን ልክዕ መጠኑ ብምርዳእ
ስቡር ልብና ክትዝንኖ ንምልዓልና ትትንስእ
እዚ እምበኣር''ዩ ውሽጥና ዘህድኦ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 3
ጸዓቱ ኮይኑ ከይደክም ዘበርትዖ
ኣብዚ ፈታኒ ግዜ ፍጹም ዘጽንዖ
ኣዝ
ሞት ናይ ሓደ እኳ ኣይትፈቱን ኢኻ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 4
እቲ በዳሊ ንኽጠዓስ ንሱ''ዩ ትባህግኻ
አዒንቱ ክፈት ነቲ ኣብ ሓዉ ዝለዓል
ካብ ክፉእ ግብሩ ክምለስ ሃብ ምስትውዓል
ሓድሕድካ ምጥፍፋእ ደጊምስ ይእከል

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'aa0b0e8d-637e-4712-9b70-ce4e7211d9a8'::uuid, 'mendo-alo-eyu-zemarit-biruktawit-gebremedhin-tigrigna-orthodox-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yalante-man-asebognal ("Yalante Man Asebognal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'aa3e9a4c-454d-4649-ab08-487026e20958'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 1
ሰው ለመዳን ሺቅዳደም
ሁሉም ሲያልፈኝ አጥቼ አቅም
ሰው የለኝም ስል ስትሰማ
ጌታ ክንድህ ሆነኝ ግርማ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 2
ቤተሳይዳ ቤቴ አይደለች
ነብሴ ጣትክን ተማመነች
ባንተ አልጋዬን ተሸክሜ
አሳረፍከኝ ከሕመሜ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 3
አስታዋሽ ነህ ለተረሳው
አጉራሹ ነህ ለተራበው
ከደጃፌ ስትመጣ
የዘንዶው ቃል ጉልበት አጣ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 4
ስንት ጊዜ አወጣኸኝ
የአይኔን እንባ አበስክልኝ
አቤት ፍቅር አቤት ምህረት
ቋንቋ ቃላት የማይገልጹት

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 5
የተተወ በወገኑ
ምን ቢያነባ በዘመኑ
ወዳጅ ያሉት ሲሄድ ሸሽቶ
ስትዳስሰው ቆመ ጸንቶ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 6
ጥልቁ ኑሮ ተሸበረ
የሞት ዘንጉ ተሰበረ
ማርዳዬ ነህ ጌጥ ላንገቴ
ታየሁብህ ሰገነቴ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 7
በህሊና ታላቅ ስደት
የተመታ ነ ያሰረው ሞት
ያየኸው ለት ተፈወሰ
በደስታ ተመለሰ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 8
የነጠከው ከሞት መንገድ
የሰጠኸው ታላቅ ታላቅ ክብር
ሌላ አይደለም ይኽ ልቤ ነው
ንገስበት ዙፋንህ ነው

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 1
Sew lemedan shiqdadem
Hulum siyalfegn at’che aqm
Sew yelegnm sil sitsema
Geta kindh honegn girma

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 2
Betesayda bete aydelech
Nebse t’atkn temamenech
Bante algayen teshekme
Asarefkegn kehmeme

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 3
Astawash neh leteresaw
Agurashu neh leterabew
Kedejafe sitmet’a
Yezendow qal gulbet at’a

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 4
Sint gize awet’aኸgn
Yeaynen enba abesklgn
Abet fiqr abet mihret
Qwanqwa qalat yemaygelts’ut

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 5
Yetetewe bewegenu
Min biyaneba bezemenu
Wedaj yalut sihed sheshto
Sitdassew qome ts’ento

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 6
T’lqu nuro teshebere
Yemot zengu tesebere
Mardaye neh get’ langete
Tayehubh segenete

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 7
Behlina talaq sidet
Yetemeta ne yaserew mot
Yayeኸw let tefewese
Bedesta temelese

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 8
Yenet’ekew kemot menged
Yeset’eኸw talaq talaq kibir
Lela aydelem yiኽ libe new
Nigesbet zufanh new

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 1
ሰው ለመዳን ሺቅዳደም
ሁሉም ሲያልፈኝ አጥቼ አቅም
ሰው የለኝም ስል ስትሰማ
ጌታ ክንድህ ሆነኝ ግርማ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 2
ቤተሳይዳ ቤቴ አይደለች
ነብሴ ጣትክን ተማመነች
ባንተ አልጋዬን ተሸክሜ
አሳረፍከኝ ከሕመሜ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 3
አስታዋሽ ነህ ለተረሳው
አጉራሹ ነህ ለተራበው
ከደጃፌ ስትመጣ
የዘንዶው ቃል ጉልበት አጣ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 4
ስንት ጊዜ አወጣኸኝ
የአይኔን እንባ አበስክልኝ
አቤት ፍቅር አቤት ምህረት
ቋንቋ ቃላት የማይገልጹት

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 5
የተተወ በወገኑ
ምን ቢያነባ በዘመኑ
ወዳጅ ያሉት ሲሄድ ሸሽቶ
ስትዳስሰው ቆመ ጸንቶ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 6
ጥልቁ ኑሮ ተሸበረ
የሞት ዘንጉ ተሰበረ
ማርዳዬ ነህ ጌጥ ላንገቴ
ታየሁብህ ሰገነቴ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 7
በህሊና ታላቅ ስደት
የተመታ ነ ያሰረው ሞት
ያየኸው ለት ተፈወሰ
በደስታ ተመለሰ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 8
የነጠከው ከሞት መንገድ
የሰጠኸው ታላቅ ታላቅ ክብር
ሌላ አይደለም ይኽ ልቤ ነው
ንገስበት ዙፋንህ ነው

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ',
        lyrics_transliteration = 'CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 1
Sew lemedan shiqdadem
Hulum siyalfegn at’che aqm
Sew yelegnm sil sitsema
Geta kindh honegn girma

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 2
Betesayda bete aydelech
Nebse t’atkn temamenech
Bante algayen teshekme
Asarefkegn kehmeme

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 3
Astawash neh leteresaw
Agurashu neh leterabew
Kedejafe sitmet’a
Yezendow qal gulbet at’a

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 4
Sint gize awet’aኸgn
Yeaynen enba abesklgn
Abet fiqr abet mihret
Qwanqwa qalat yemaygelts’ut

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 5
Yetetewe bewegenu
Min biyaneba bezemenu
Wedaj yalut sihed sheshto
Sitdassew qome ts’ento

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 6
T’lqu nuro teshebere
Yemot zengu tesebere
Mardaye neh get’ langete
Tayehubh segenete

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 7
Behlina talaq sidet
Yetemeta ne yaserew mot
Yayeኸw let tefewese
Bedesta temelese

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 8
Yenet’ekew kemot menged
Yeset’eኸw talaq talaq kibir
Lela aydelem yiኽ libe new
Nigesbet zufanh new

CHORUS
Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'aa3e9a4c-454d-4649-ab08-487026e20958'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 1
ሰው ለመዳን ሺቅዳደም
ሁሉም ሲያልፈኝ አጥቼ አቅም
ሰው የለኝም ስል ስትሰማ
ጌታ ክንድህ ሆነኝ ግርማ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 2
ቤተሳይዳ ቤቴ አይደለች
ነብሴ ጣትክን ተማመነች
ባንተ አልጋዬን ተሸክሜ
አሳረፍከኝ ከሕመሜ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 3
አስታዋሽ ነህ ለተረሳው
አጉራሹ ነህ ለተራበው
ከደጃፌ ስትመጣ
የዘንዶው ቃል ጉልበት አጣ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 4
ስንት ጊዜ አወጣኸኝ
የአይኔን እንባ አበስክልኝ
አቤት ፍቅር አቤት ምህረት
ቋንቋ ቃላት የማይገልጹት

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 5
የተተወ በወገኑ
ምን ቢያነባ በዘመኑ
ወዳጅ ያሉት ሲሄድ ሸሽቶ
ስትዳስሰው ቆመ ጸንቶ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 6
ጥልቁ ኑሮ ተሸበረ
የሞት ዘንጉ ተሰበረ
ማርዳዬ ነህ ጌጥ ላንገቴ
ታየሁብህ ሰገነቴ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 7
በህሊና ታላቅ ስደት
የተመታ ነ ያሰረው ሞት
ያየኸው ለት ተፈወሰ
በደስታ ተመለሰ

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 8
የነጠከው ከሞት መንገድ
የሰጠኸው ታላቅ ታላቅ ክብር
ሌላ አይደለም ይኽ ልቤ ነው
ንገስበት ዙፋንህ ነው

CHORUS
ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'aa3e9a4c-454d-4649-ab08-487026e20958'::uuid, 'yalante-man-asebognal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anichi-yewerik-mekija-nesh ("Anichi Yewerik Mekija Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ab3d7794-7a77-4eba-afd3-3501acd61da4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 1
እኔ እርቃኔን ነኝ ከጸጋው እርቄ
በክፉ ግብር በኃጥያት ወድቄ
ማርያም አንቺ ነሽ የሸማኔ እቃ
ልጅሽ ልብስ ነው ለሁሉ የሚበቃ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 2
አንቺ መርከቤ እኔም ነጋዴ
ልጅሽ ዕንቁዬ ትርፌ ዘመዴ
ለእኔ ለድሃው ማከማቻዬ
የከበር ጌጥ ልጅሽ ቤዛዬ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 3
እኔ ተጓዥ አንቺ መቅዘፊያ
ልጅሽ ወደብ ነው የህይወት ማረፊያ
አንቺ ፊደል ነሽ እኔ ተማሪ
ልጅሽ ወንጌል ነው ቸር አስተማሪ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 1
Ene erqanen negn kets’egaw erqe
Bekfu gibr behat’yat wedqe
Maryam anchi nesh yeshemane eqa
Lijsh libs new lehulu yemibeqa (2)

CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 2
Anchi merkebe enem negade
Lijsh enquye tirfe zemede
Leene ledhaw makemachaye
Yekeber get’ lijsh bezaye (2)

CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 3
Ene tegwazh anchi meqzefiya
Lijsh wedeb new yehywet marefiya
Anchi fidel nesh ene temari
Lijsh wengel new cher astemari (2)

CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 1
እኔ እርቃኔን ነኝ ከጸጋው እርቄ
በክፉ ግብር በኃጥያት ወድቄ
ማርያም አንቺ ነሽ የሸማኔ እቃ
ልጅሽ ልብስ ነው ለሁሉ የሚበቃ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 2
አንቺ መርከቤ እኔም ነጋዴ
ልጅሽ ዕንቁዬ ትርፌ ዘመዴ
ለእኔ ለድሃው ማከማቻዬ
የከበር ጌጥ ልጅሽ ቤዛዬ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 3
እኔ ተጓዥ አንቺ መቅዘፊያ
ልጅሽ ወደብ ነው የህይወት ማረፊያ
አንቺ ፊደል ነሽ እኔ ተማሪ
ልጅሽ ወንጌል ነው ቸር አስተማሪ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ',
        lyrics_transliteration = 'CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 1
Ene erqanen negn kets’egaw erqe
Bekfu gibr behat’yat wedqe
Maryam anchi nesh yeshemane eqa
Lijsh libs new lehulu yemibeqa (2)

CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 2
Anchi merkebe enem negade
Lijsh enquye tirfe zemede
Leene ledhaw makemachaye
Yekeber get’ lijsh bezaye (2)

CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 3
Ene tegwazh anchi meqzefiya
Lijsh wedeb new yehywet marefiya
Anchi fidel nesh ene temari
Lijsh wengel new cher astemari (2)

CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ab3d7794-7a77-4eba-afd3-3501acd61da4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 1
እኔ እርቃኔን ነኝ ከጸጋው እርቄ
በክፉ ግብር በኃጥያት ወድቄ
ማርያም አንቺ ነሽ የሸማኔ እቃ
ልጅሽ ልብስ ነው ለሁሉ የሚበቃ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 2
አንቺ መርከቤ እኔም ነጋዴ
ልጅሽ ዕንቁዬ ትርፌ ዘመዴ
ለእኔ ለድሃው ማከማቻዬ
የከበር ጌጥ ልጅሽ ቤዛዬ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 3
እኔ ተጓዥ አንቺ መቅዘፊያ
ልጅሽ ወደብ ነው የህይወት ማረፊያ
አንቺ ፊደል ነሽ እኔ ተማሪ
ልጅሽ ወንጌል ነው ቸር አስተማሪ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ab3d7794-7a77-4eba-afd3-3501acd61da4'::uuid, 'anichi-yewerik-mekija-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ete-musheraye-mezmur-cover-dawit-tilahun ("ete musheraye mezmur cover dawit tilahun")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ab716890-c0e8-4820-981e-63698b318a68'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 1
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 2
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከእንባ ከለቅሶ ከልክዬ
ልብሽ ይራራልኝ ወደ እኔ አዘንብዬ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 3
እናት አለኝ የምታብስ እንባ
አያት አለች ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 4
ሔዋን ሰታኝ ከበለሱ ፍሬ
እራቁቴን ብቆም አላፍሬ
ልብሴን ይዘሽ ወደ እኔ የመጣሽ
ደጓ እናቴ ቤቴን አድምቀሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 5
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት
በእናትነት ህይወቴን ጎብኝተሽ
ልቤ አረፈ ተነቅሎ ህመሙ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 6
ሰንሰለቴ ከእጅ ተቆረጠ
ምራራዬ በልጅሽ ጣፈጠ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 7
ቤቴ ሙሽራዬ
ሰሎሞንያ አለሽ
ማርያም አበበ ባዬ
ሰሎሞንያ አለሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 8
እኔም ልበልሽ እናቴ
ማርያም ግቢ ከቤቴ
እኔም ልበልሽ እናቴ
እማአምላክ ግቢ ከቤቴ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 9
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስተካ
ድንገል እንደ ማርያም ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 10
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመቤታችን የህሊና ፀጋ
ጽላት ዘሙሴ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 11
ጽላት ዘሲና
ጽላት ዘሙሴ
ጽላት ዘሲና
ጽላት ጽላት ጽላት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 12
ጽላት ጽላት ጽላት ለአሮን ካህን
ጽላት ጽላት ጽላት
ጽላት ጽላት ጽላት ለአሮን ካህን

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 1
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 2
Emebete biye simshn met’rate
Biraqotbgn new bado bihon bete
Aynochen keenba keleqso kelkye
Libsh yiraralgn wede ene azenbye

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 3
Enat alegn yemtabs enba
Ayat alech siwet’a sigeba
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 4
Hewan setagn kebelesu fire
Eraquten biqom alafre
Libsen yizesh wede ene yemet’ash
Degwa enate beten admqesh

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 5
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat
Beenatnet hiyweten gobgntesh
Libe arefe teneqlo himemu

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 6
Senselete keej teqoret’e
Miraraye beljsh t’afet’e
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 7
Bete mushraye
Selomonya alesh
Maryam abebe baye
Selomonya alesh

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 8
Enem libelsh enate
Maryam gibi kebete
Enem libelsh enate
Emaamlak gibi kebete

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 9
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyasteka
Dingel ende Maryam wiha teshekmesh
Getan bethtna tagelegyalesh

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 10
Ney bedemena ney bedemena
Ney bedemena ney bedemena
Emebetachen yehlina ts’ega
Ts’lat zemuse

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 11
Ts’lat zesina
Ts’lat zemuse
Ts’lat zesina
Ts’lat ts’lat ts’lat

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 12
Ts’lat ts’lat ts’lat learon kahn
Ts’lat ts’lat ts’lat
Ts’lat ts’lat ts’lat learon kahn

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 1
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 2
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከእንባ ከለቅሶ ከልክዬ
ልብሽ ይራራልኝ ወደ እኔ አዘንብዬ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 3
እናት አለኝ የምታብስ እንባ
አያት አለች ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 4
ሔዋን ሰታኝ ከበለሱ ፍሬ
እራቁቴን ብቆም አላፍሬ
ልብሴን ይዘሽ ወደ እኔ የመጣሽ
ደጓ እናቴ ቤቴን አድምቀሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 5
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት
በእናትነት ህይወቴን ጎብኝተሽ
ልቤ አረፈ ተነቅሎ ህመሙ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 6
ሰንሰለቴ ከእጅ ተቆረጠ
ምራራዬ በልጅሽ ጣፈጠ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 7
ቤቴ ሙሽራዬ
ሰሎሞንያ አለሽ
ማርያም አበበ ባዬ
ሰሎሞንያ አለሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 8
እኔም ልበልሽ እናቴ
ማርያም ግቢ ከቤቴ
እኔም ልበልሽ እናቴ
እማአምላክ ግቢ ከቤቴ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 9
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስተካ
ድንገል እንደ ማርያም ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 10
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመቤታችን የህሊና ፀጋ
ጽላት ዘሙሴ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 11
ጽላት ዘሲና
ጽላት ዘሙሴ
ጽላት ዘሲና
ጽላት ጽላት ጽላት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 12
ጽላት ጽላት ጽላት ለአሮን ካህን
ጽላት ጽላት ጽላት
ጽላት ጽላት ጽላት ለአሮን ካህን

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ',
        lyrics_transliteration = 'CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 1
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 2
Emebete biye simshn met’rate
Biraqotbgn new bado bihon bete
Aynochen keenba keleqso kelkye
Libsh yiraralgn wede ene azenbye

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 3
Enat alegn yemtabs enba
Ayat alech siwet’a sigeba
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 4
Hewan setagn kebelesu fire
Eraquten biqom alafre
Libsen yizesh wede ene yemet’ash
Degwa enate beten admqesh

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 5
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat
Beenatnet hiyweten gobgntesh
Libe arefe teneqlo himemu

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 6
Senselete keej teqoret’e
Miraraye beljsh t’afet’e
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 7
Bete mushraye
Selomonya alesh
Maryam abebe baye
Selomonya alesh

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 8
Enem libelsh enate
Maryam gibi kebete
Enem libelsh enate
Emaamlak gibi kebete

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 9
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyasteka
Dingel ende Maryam wiha teshekmesh
Getan bethtna tagelegyalesh

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 10
Ney bedemena ney bedemena
Ney bedemena ney bedemena
Emebetachen yehlina ts’ega
Ts’lat zemuse

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 11
Ts’lat zesina
Ts’lat zemuse
Ts’lat zesina
Ts’lat ts’lat ts’lat

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 12
Ts’lat ts’lat ts’lat learon kahn
Ts’lat ts’lat ts’lat
Ts’lat ts’lat ts’lat learon kahn

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ab716890-c0e8-4820-981e-63698b318a68'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 1
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 2
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከእንባ ከለቅሶ ከልክዬ
ልብሽ ይራራልኝ ወደ እኔ አዘንብዬ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 3
እናት አለኝ የምታብስ እንባ
አያት አለች ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 4
ሔዋን ሰታኝ ከበለሱ ፍሬ
እራቁቴን ብቆም አላፍሬ
ልብሴን ይዘሽ ወደ እኔ የመጣሽ
ደጓ እናቴ ቤቴን አድምቀሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 5
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት
በእናትነት ህይወቴን ጎብኝተሽ
ልቤ አረፈ ተነቅሎ ህመሙ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 6
ሰንሰለቴ ከእጅ ተቆረጠ
ምራራዬ በልጅሽ ጣፈጠ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 7
ቤቴ ሙሽራዬ
ሰሎሞንያ አለሽ
ማርያም አበበ ባዬ
ሰሎሞንያ አለሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 8
እኔም ልበልሽ እናቴ
ማርያም ግቢ ከቤቴ
እኔም ልበልሽ እናቴ
እማአምላክ ግቢ ከቤቴ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 9
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስተካ
ድንገል እንደ ማርያም ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 10
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመቤታችን የህሊና ፀጋ
ጽላት ዘሙሴ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 11
ጽላት ዘሲና
ጽላት ዘሙሴ
ጽላት ዘሲና
ጽላት ጽላት ጽላት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 12
ጽላት ጽላት ጽላት ለአሮን ካህን
ጽላት ጽላት ጽላት
ጽላት ጽላት ጽላት ለአሮን ካህን

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ab716890-c0e8-4820-981e-63698b318a68'::uuid, 'ete-musheraye-mezmur-cover-dawit-tilahun', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ale-bemenigisitu-sinigefa-yemiyay ("Ale Bemenigisitu Sinigefa Yemiyay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ab9b6542-aaa0-451c-b21e-0d7de0ee539a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 1
አይፈርድም ለምን ትላላችሁ
ጭካኔው ሲብስ እያያችሁ
ዝምታው የስራው ጊዜ ነው
ምሳሩ ከዛፉ በታች ነው

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 2
በራሱ የጊዜ ቀመር
ይሰራል ከማንም ሳይመክር
ፈራጅ ነው እውነተኛ ዳኛ
ዘላለም ማይደክም የማይተኛ

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 3
ናቡቴ ቢሞት ደሙ ፈሶ
በግፍ ዘንግ እርስቱ ተወርሶ
ሲፈርድ አይተናል በቶሎ
አክአብ ኤልዛቤልን ገድሎ

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 4
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 5
ቢጥሉት በአንበሶች ጉድጓድ
ቅንነት በጎደለው ፍርድ
በጠሉት ሞት ተፈረደና
ዳንኤል ቆመ ለምስጋና

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 6
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 7
ሳር ግጧል ናቡ ከደነፆር
ፈርኦን ተዘርቷል በባህር
ግፈኞች ቢኖሩም ዛሬ ነው
እመኑ ነገ የጌታ ነው

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 8
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 1
Ayferdm lemn tilalachhu
Ch’kanew sibs eyayachhu
Zimtaw yesraw gize new
Misaru kezafu betach new

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 2
Berasu yegize qemer
Yiseral kemanm saymekr
Feraj new ewnetegna dagna
Zelalem maydekm yemaytegna

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 3
Nabute bimot demu feso
Begf zeng erstu tewerso
Siferd aytenal betolo
Akab elzabeln gedlo

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 4
Berasu yegize qemer

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 5
Bit’lut beanbesoch gudgwad
Qinnet begodelew fird
Bet’elut mot teferedena
Danel qome lemsgana

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 6
Berasu yegize qemer

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 7
Sar git’wal nabu kedenets’or
Feron tezertwal bebahr
Gifegnoch binorum zare new
Emenu nege yegeta new

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 8
Berasu yegize qemer

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 1
አይፈርድም ለምን ትላላችሁ
ጭካኔው ሲብስ እያያችሁ
ዝምታው የስራው ጊዜ ነው
ምሳሩ ከዛፉ በታች ነው

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 2
በራሱ የጊዜ ቀመር
ይሰራል ከማንም ሳይመክር
ፈራጅ ነው እውነተኛ ዳኛ
ዘላለም ማይደክም የማይተኛ

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 3
ናቡቴ ቢሞት ደሙ ፈሶ
በግፍ ዘንግ እርስቱ ተወርሶ
ሲፈርድ አይተናል በቶሎ
አክአብ ኤልዛቤልን ገድሎ

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 4
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 5
ቢጥሉት በአንበሶች ጉድጓድ
ቅንነት በጎደለው ፍርድ
በጠሉት ሞት ተፈረደና
ዳንኤል ቆመ ለምስጋና

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 6
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 7
ሳር ግጧል ናቡ ከደነፆር
ፈርኦን ተዘርቷል በባህር
ግፈኞች ቢኖሩም ዛሬ ነው
እመኑ ነገ የጌታ ነው

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 8
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ',
        lyrics_transliteration = 'CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 1
Ayferdm lemn tilalachhu
Ch’kanew sibs eyayachhu
Zimtaw yesraw gize new
Misaru kezafu betach new

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 2
Berasu yegize qemer
Yiseral kemanm saymekr
Feraj new ewnetegna dagna
Zelalem maydekm yemaytegna

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 3
Nabute bimot demu feso
Begf zeng erstu tewerso
Siferd aytenal betolo
Akab elzabeln gedlo

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 4
Berasu yegize qemer

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 5
Bit’lut beanbesoch gudgwad
Qinnet begodelew fird
Bet’elut mot teferedena
Danel qome lemsgana

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 6
Berasu yegize qemer

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 7
Sar git’wal nabu kedenets’or
Feron tezertwal bebahr
Gifegnoch binorum zare new
Emenu nege yegeta new

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 8
Berasu yegize qemer

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ab9b6542-aaa0-451c-b21e-0d7de0ee539a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 1
አይፈርድም ለምን ትላላችሁ
ጭካኔው ሲብስ እያያችሁ
ዝምታው የስራው ጊዜ ነው
ምሳሩ ከዛፉ በታች ነው

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 2
በራሱ የጊዜ ቀመር
ይሰራል ከማንም ሳይመክር
ፈራጅ ነው እውነተኛ ዳኛ
ዘላለም ማይደክም የማይተኛ

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 3
ናቡቴ ቢሞት ደሙ ፈሶ
በግፍ ዘንግ እርስቱ ተወርሶ
ሲፈርድ አይተናል በቶሎ
አክአብ ኤልዛቤልን ገድሎ

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 4
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 5
ቢጥሉት በአንበሶች ጉድጓድ
ቅንነት በጎደለው ፍርድ
በጠሉት ሞት ተፈረደና
ዳንኤል ቆመ ለምስጋና

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 6
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 7
ሳር ግጧል ናቡ ከደነፆር
ፈርኦን ተዘርቷል በባህር
ግፈኞች ቢኖሩም ዛሬ ነው
እመኑ ነገ የጌታ ነው

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 8
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ab9b6542-aaa0-451c-b21e-0d7de0ee539a'::uuid, 'ale-bemenigisitu-sinigefa-yemiyay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kena-arekegn-deacon-endale-dereje ("Kena Arekegn Deacon Endale Dereje")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'db048f37-9409-405a-ae24-82b653957ba3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 1
በጡጫ ተመተህ ምራቅ ተተፋብህ
በአይሁድ ሸንጎ ፊት ቆመህ ተከሰህ
በደል ሳይኖርብህ የኔን በደል ወስደህ
እኔን ነጻ አደረግከኝ አንተ ተጎንብሰህ

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 2
በሸላቾቹ ፊት ዝም እንደሚል በግ
ዝም አለ ጌታዬ እንዳገኝ ማዕረግ 2×
ገፍትረው ሲጥሉህ ወደቅህ በእግሮችህ
እኔ እንድራመድ ደካማው ልጅህ

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 3
ተጠማህ ስለኔ እኔ እንዳልጠማ
አንተ ደማህልኝ ልጅህ እንዳልደማ
የእሾህ አክሊል ደፍተህ ለኔ ክብር አክሊል
ከለሜዳ ለብሰህ ለበስኩኝ ካባን

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 4
ሸክሜን አቀለልከው የዘመናት ነውሬን
እንባዬን አብሰህ መለስክልኝ ሳቄን

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 1
Bet’uch’a temeteh miraq tetefabh
Beayhud shengo fit qomeh tekeseh
Bedel saynorbh yenen bedel wesdeh
Enen nets’a aderegkegn ante tegonbseh

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 2
Beshelachochu fit zim endemil beg
Zim ale Getaye endagegn maereg 2×
Geftrew sit’luh wedeqh beegrochh
Ene endramed dekamaw lijh

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 3
Tet’emah silene ene endalt’ema
Ante demahlgn lijh endaldema
Yeeshoh aklil defteh lene kibir aklil
Kelemeda lebseh lebeskugn kaban

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 4
Shekmen aqelelkew yezemenat newren
Enbayen abseh melesklgn saqen

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 1
በጡጫ ተመተህ ምራቅ ተተፋብህ
በአይሁድ ሸንጎ ፊት ቆመህ ተከሰህ
በደል ሳይኖርብህ የኔን በደል ወስደህ
እኔን ነጻ አደረግከኝ አንተ ተጎንብሰህ

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 2
በሸላቾቹ ፊት ዝም እንደሚል በግ
ዝም አለ ጌታዬ እንዳገኝ ማዕረግ 2×
ገፍትረው ሲጥሉህ ወደቅህ በእግሮችህ
እኔ እንድራመድ ደካማው ልጅህ

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 3
ተጠማህ ስለኔ እኔ እንዳልጠማ
አንተ ደማህልኝ ልጅህ እንዳልደማ
የእሾህ አክሊል ደፍተህ ለኔ ክብር አክሊል
ከለሜዳ ለብሰህ ለበስኩኝ ካባን

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 4
ሸክሜን አቀለልከው የዘመናት ነውሬን
እንባዬን አብሰህ መለስክልኝ ሳቄን

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ',
        lyrics_transliteration = 'CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 1
Bet’uch’a temeteh miraq tetefabh
Beayhud shengo fit qomeh tekeseh
Bedel saynorbh yenen bedel wesdeh
Enen nets’a aderegkegn ante tegonbseh

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 2
Beshelachochu fit zim endemil beg
Zim ale Getaye endagegn maereg 2×
Geftrew sit’luh wedeqh beegrochh
Ene endramed dekamaw lijh

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 3
Tet’emah silene ene endalt’ema
Ante demahlgn lijh endaldema
Yeeshoh aklil defteh lene kibir aklil
Kelemeda lebseh lebeskugn kaban

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote

VERSE 4
Shekmen aqelelkew yezemenat newren
Enbayen abseh melesklgn saqen

CHORUS
Gonbes bileh qena aderegkegn
Zim bileh anagerkegn
Mogese neh ante abate
Ante moteh qertwal mote',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'db048f37-9409-405a-ae24-82b653957ba3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 1
በጡጫ ተመተህ ምራቅ ተተፋብህ
በአይሁድ ሸንጎ ፊት ቆመህ ተከሰህ
በደል ሳይኖርብህ የኔን በደል ወስደህ
እኔን ነጻ አደረግከኝ አንተ ተጎንብሰህ

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 2
በሸላቾቹ ፊት ዝም እንደሚል በግ
ዝም አለ ጌታዬ እንዳገኝ ማዕረግ 2×
ገፍትረው ሲጥሉህ ወደቅህ በእግሮችህ
እኔ እንድራመድ ደካማው ልጅህ

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 3
ተጠማህ ስለኔ እኔ እንዳልጠማ
አንተ ደማህልኝ ልጅህ እንዳልደማ
የእሾህ አክሊል ደፍተህ ለኔ ክብር አክሊል
ከለሜዳ ለብሰህ ለበስኩኝ ካባን

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ

VERSE 4
ሸክሜን አቀለልከው የዘመናት ነውሬን
እንባዬን አብሰህ መለስክልኝ ሳቄን

CHORUS
ጎንበስ ብለህ ቀና አደረግከኝ
ዝም ብለህ አናገርከኝ
ሞገሴ ነህ አንተ አባቴ
አንተ ሞተህ ቀርቷል ሞቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'db048f37-9409-405a-ae24-82b653957ba3'::uuid, 'kena-arekegn-deacon-endale-dereje', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian-orthodox-song-2476 ("Ethiopian Orthodox Song")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ad2eb28f-697c-4965-abeb-e5db746d524d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 1
በክብር ተቀምጠሻል ዘበአማን
ታላቁን በረከት ዘበአማን
በእጅሽ ጨብጠሻል ዘበአማን
እንሰግድልሻለን ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 2
የጸጋ ስግደት ዘበአማን
እመቤቴ ማርያም ዘበአማን
የጌታዬ እናት ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 3
የዓቢ ክብራ ለማርያም
ልሂድ ወደ አንባሰል ዘበአማን
ወደ ግሸን ዓንባ ዘበአማን
አድርጊኝ እንደ ሕጻን ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 4
ወደ ቤትሽ ልግባ ዘበአማን
ልረፍ በመስቀሉ ዘበአማን
ከደጅሽ መጥቼ ዘበአማን
የዓለምን ጫጫታ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 5
ሁሉንም ረስቼ ዘበአማን
ሩቅ ነው መንገዴ ዘበአማን
ብርቱ ነው ዳገቱ ዘበአማን
ንገሪው ለልጅሽ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 6
እርሱ ነው ጉልበቱ ዘበአማን
ሳልረግፍ እንደ አበባ ዘበአማን
ሳልመጣ በአልጋዬ ዘበአማን
ሕይወቴን አደራ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 7
ነፍስ እና ሥጋዬ ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ስምሽ ይጣፍጣል ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 8
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 9
እድሜ እና በረከት ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ሥምሽ ይጣፍጣል ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 10
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 11
ዕድሜ እና በረከት ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 1
Bekbr teqemt’eshal zebeaman
Talaqun bereket zebeaman
Beejsh ch’ebt’eshal zebeaman
Ensegdlshalen zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 2
Yets’ega sigdet zebeaman
Emebete Maryam zebeaman
Yegetaye enat zebeaman
Rekebki ts’ega gibre Dingil

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 3
Yeabi kibra leMaryam
Lihid wede anbasel zebeaman
Wede gishen anba zebeaman
Adrgign ende hits’an zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 4
Wede betsh ligba zebeaman
Liref bemesqelu zebeaman
Kedejsh met’che zebeaman
Yealemn ch’ach’ata zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 5
Hulunm resche zebeaman
Ruq new mengede zebeaman
Birtu new dagetu zebeaman
Nigeriw leljsh zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 6
Ersu new gulbetu zebeaman
Salregf ende abeba zebeaman
Salmet’a bealgaye zebeaman
Hiyweten adera zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 7
Nefs ena sigaye zebeaman
Yamesegnushal zebeaman
Alem zelealem zebeaman
Simsh yit’aft’al zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 8
Dingil Maryam zebeaman
Beteset’esh ts’ega zebeaman
Beanchi amalajnet zebeaman
Leljochsh yibza zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 9
Edme ena bereket zebeaman
Yamesegnushal zebeaman
Alem zelealem zebeaman
Simsh yit’aft’al zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 10
Dingil Maryam zebeaman
Beteset’esh ts’ega zebeaman
Beanchi amalajnet zebeaman
Leljochsh yibza zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 11
Edme ena bereket zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 1
በክብር ተቀምጠሻል ዘበአማን
ታላቁን በረከት ዘበአማን
በእጅሽ ጨብጠሻል ዘበአማን
እንሰግድልሻለን ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 2
የጸጋ ስግደት ዘበአማን
እመቤቴ ማርያም ዘበአማን
የጌታዬ እናት ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 3
የዓቢ ክብራ ለማርያም
ልሂድ ወደ አንባሰል ዘበአማን
ወደ ግሸን ዓንባ ዘበአማን
አድርጊኝ እንደ ሕጻን ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 4
ወደ ቤትሽ ልግባ ዘበአማን
ልረፍ በመስቀሉ ዘበአማን
ከደጅሽ መጥቼ ዘበአማን
የዓለምን ጫጫታ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 5
ሁሉንም ረስቼ ዘበአማን
ሩቅ ነው መንገዴ ዘበአማን
ብርቱ ነው ዳገቱ ዘበአማን
ንገሪው ለልጅሽ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 6
እርሱ ነው ጉልበቱ ዘበአማን
ሳልረግፍ እንደ አበባ ዘበአማን
ሳልመጣ በአልጋዬ ዘበአማን
ሕይወቴን አደራ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 7
ነፍስ እና ሥጋዬ ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ስምሽ ይጣፍጣል ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 8
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 9
እድሜ እና በረከት ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ሥምሽ ይጣፍጣል ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 10
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 11
ዕድሜ እና በረከት ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን',
        lyrics_transliteration = 'CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 1
Bekbr teqemt’eshal zebeaman
Talaqun bereket zebeaman
Beejsh ch’ebt’eshal zebeaman
Ensegdlshalen zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 2
Yets’ega sigdet zebeaman
Emebete Maryam zebeaman
Yegetaye enat zebeaman
Rekebki ts’ega gibre Dingil

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 3
Yeabi kibra leMaryam
Lihid wede anbasel zebeaman
Wede gishen anba zebeaman
Adrgign ende hits’an zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 4
Wede betsh ligba zebeaman
Liref bemesqelu zebeaman
Kedejsh met’che zebeaman
Yealemn ch’ach’ata zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 5
Hulunm resche zebeaman
Ruq new mengede zebeaman
Birtu new dagetu zebeaman
Nigeriw leljsh zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 6
Ersu new gulbetu zebeaman
Salregf ende abeba zebeaman
Salmet’a bealgaye zebeaman
Hiyweten adera zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 7
Nefs ena sigaye zebeaman
Yamesegnushal zebeaman
Alem zelealem zebeaman
Simsh yit’aft’al zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 8
Dingil Maryam zebeaman
Beteset’esh ts’ega zebeaman
Beanchi amalajnet zebeaman
Leljochsh yibza zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 9
Edme ena bereket zebeaman
Yamesegnushal zebeaman
Alem zelealem zebeaman
Simsh yit’aft’al zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 10
Dingil Maryam zebeaman
Beteset’esh ts’ega zebeaman
Beanchi amalajnet zebeaman
Leljochsh yibza zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 11
Edme ena bereket zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ad2eb28f-697c-4965-abeb-e5db746d524d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 1
በክብር ተቀምጠሻል ዘበአማን
ታላቁን በረከት ዘበአማን
በእጅሽ ጨብጠሻል ዘበአማን
እንሰግድልሻለን ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 2
የጸጋ ስግደት ዘበአማን
እመቤቴ ማርያም ዘበአማን
የጌታዬ እናት ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 3
የዓቢ ክብራ ለማርያም
ልሂድ ወደ አንባሰል ዘበአማን
ወደ ግሸን ዓንባ ዘበአማን
አድርጊኝ እንደ ሕጻን ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 4
ወደ ቤትሽ ልግባ ዘበአማን
ልረፍ በመስቀሉ ዘበአማን
ከደጅሽ መጥቼ ዘበአማን
የዓለምን ጫጫታ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 5
ሁሉንም ረስቼ ዘበአማን
ሩቅ ነው መንገዴ ዘበአማን
ብርቱ ነው ዳገቱ ዘበአማን
ንገሪው ለልጅሽ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 6
እርሱ ነው ጉልበቱ ዘበአማን
ሳልረግፍ እንደ አበባ ዘበአማን
ሳልመጣ በአልጋዬ ዘበአማን
ሕይወቴን አደራ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 7
ነፍስ እና ሥጋዬ ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ስምሽ ይጣፍጣል ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 8
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 9
እድሜ እና በረከት ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ሥምሽ ይጣፍጣል ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 10
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 11
ዕድሜ እና በረከት ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ad2eb28f-697c-4965-abeb-e5db746d524d'::uuid, 'ethiopian-orthodox-song-2476', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- jesus-you-are-better-zemari-bereket-tikue ("Jesus, You Are Better // // Zemari Bereket Tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ade5adea-91bb-4f69-b804-ec218cc1a7ae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 1
1፣ ዕዬ ናይ ኣእዳወይ ቀኒዑለይ
ንእሽቶይ ምስ ዓቢ እንተዉረየለይ
ግን ንስኻ ተዘየሎኻ ኣባይ
ትርፎ ድኻም’ዩ እንታይ ይዓብሰለይ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 2
2፣ ምርካብ ምስኣን ንሱስ ጊዛዊ’ዪ
ትርጉም ሂወት ብኡ ኣይልካዕን’ዪ
ህላዉነትካ’ዪ ምንጪ ደስታይ
ዘይጣዐሰሉ ንስኻ ኢኻ ምርጫይ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 3
3፣ ትምክሕቲ ዘበለ ካባይ ይርሓቅ
ኣብ ስጋ ምድጋፍ ካባይ ይርሓቅ
ተማሂረ ኣለኹ ከም ዘወድቅ
ብኣኻ ጥራይ’ዪ ነገረይ ዝጽብቅ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 1
1, eye nay aedawey qeniuley
Nieshtoy mis abi entewureyeley
Gin nisኻ tezeyeloኻ abay
Tirfo diኻm’yu entay yiabseley

CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 2
2, mirkab misan nisus gizawi’yi
Tirgum hiwet biu aylkaen’yi
Hilawunetka’yi minch’i destay
Zeyt’aaselu nisኻ iኻ mirch’ay

CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 3
3, timkhti zebele kabay yirhaq
Ab siga midgaf kabay yirhaq
Temahire aleኹ kem zewedq
Biaኻ t’ray’yi negerey zits’bq

CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 1
1፣ ዕዬ ናይ ኣእዳወይ ቀኒዑለይ
ንእሽቶይ ምስ ዓቢ እንተዉረየለይ
ግን ንስኻ ተዘየሎኻ ኣባይ
ትርፎ ድኻም’ዩ እንታይ ይዓብሰለይ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 2
2፣ ምርካብ ምስኣን ንሱስ ጊዛዊ’ዪ
ትርጉም ሂወት ብኡ ኣይልካዕን’ዪ
ህላዉነትካ’ዪ ምንጪ ደስታይ
ዘይጣዐሰሉ ንስኻ ኢኻ ምርጫይ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 3
3፣ ትምክሕቲ ዘበለ ካባይ ይርሓቅ
ኣብ ስጋ ምድጋፍ ካባይ ይርሓቅ
ተማሂረ ኣለኹ ከም ዘወድቅ
ብኣኻ ጥራይ’ዪ ነገረይ ዝጽብቅ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2',
        lyrics_transliteration = 'CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 1
1, eye nay aedawey qeniuley
Nieshtoy mis abi entewureyeley
Gin nisኻ tezeyeloኻ abay
Tirfo diኻm’yu entay yiabseley

CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 2
2, mirkab misan nisus gizawi’yi
Tirgum hiwet biu aylkaen’yi
Hilawunetka’yi minch’i destay
Zeyt’aaselu nisኻ iኻ mirch’ay

CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2

VERSE 3
3, timkhti zebele kabay yirhaq
Ab siga midgaf kabay yirhaq
Temahire aleኹ kem zewedq
Biaኻ t’ray’yi negerey zits’bq

CHORUS
Eyesus tibelts’ lieli ኹlu
Nisኻ iኻ niay lieli ኽlu
Aboye tibelts’ lieli ኹlu
Bijekaኻs yelen tesfa zigebrelu x2',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ade5adea-91bb-4f69-b804-ec218cc1a7ae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 1
1፣ ዕዬ ናይ ኣእዳወይ ቀኒዑለይ
ንእሽቶይ ምስ ዓቢ እንተዉረየለይ
ግን ንስኻ ተዘየሎኻ ኣባይ
ትርፎ ድኻም’ዩ እንታይ ይዓብሰለይ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 2
2፣ ምርካብ ምስኣን ንሱስ ጊዛዊ’ዪ
ትርጉም ሂወት ብኡ ኣይልካዕን’ዪ
ህላዉነትካ’ዪ ምንጪ ደስታይ
ዘይጣዐሰሉ ንስኻ ኢኻ ምርጫይ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2

VERSE 3
3፣ ትምክሕቲ ዘበለ ካባይ ይርሓቅ
ኣብ ስጋ ምድጋፍ ካባይ ይርሓቅ
ተማሂረ ኣለኹ ከም ዘወድቅ
ብኣኻ ጥራይ’ዪ ነገረይ ዝጽብቅ

CHORUS
እየሱስ ትበልጽ ልዕሊ ኹሉ
ንስኻ ኢኻ ንዓይ ልዕሊ ኽሉ
ኣቦየ ትበልጽ ልዕሊ ኹሉ
ብጀካኻስ የለን ተስፋ ዝገብረሉ x2'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ade5adea-91bb-4f69-b804-ec218cc1a7ae'::uuid, 'jesus-you-are-better-zemari-bereket-tikue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian-ortodoxtewahido-mezmur-zemary-abel-mekbib-agatami-aydelem ("Ethiopian OrtodoxTewahido mezmur Zemary Abel mekbib agatami aydelem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b00ffd52-db96-4b19-8a57-a585893d0a6e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 1
ማን ነው በዛ በረሃ ያበላኝ መና ያጠጣኝ ውሃ
ማን ነው የደገፈኝ ጥልቁን ሸለቆ ያሻገረኝ
አንተ ነህ ለእኔ እናት አባቴ
ንጹህ ወዳጄ ስጋ እና አጥንቴ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 2
አይኔ አይነቀል ከዙፋንህ
ፊት አያዞርም ፍቅር አይንህ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 3
ወሮኝ ድቅድቅ ጨለማ
ተስፋዬ ከስሞ ልቤ ሲደማ
አይቶኝ ሲፈስ እንባዬ
ደመና ጠቅሶ መጣ ጌታዬ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 4
ፀሀይ ነው እና የብርሃን አምዴ
ኢየሱስ ለእኔ ህይወት መንገዴ
አልተሸነፍኩም ውዴ አግዞኛል
መቃብር ከፍሎ ህይወት ሰጥቶኛል

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 5
ሲለይ ነፍሴ ከስጋ በጨለማ ቀን በክፉ አደጋ
ዳንኩኝ ሞት እያየኝ የንሰሃ እድሜ ጨመረልኝ
በጽድቄ አይደለም የተረፍኩት
በእሱ ፍቅር ነው በእሱ ምህረት

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 6
ብቻዬን ሆኘ ሁሌ የማለቅሰው
እየበደልኩት ስላዳነኝ ነው

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 7
ሞት ሆይ መውጊያ የታለ
ብሎ ጥሎኃል እየታገለ
ሲኦል ድል መግዛትህ
ባዶ ቀርተሃል ተበዝብዘህ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 8
በእራሱ መንግስት ፈጥሮኝ በዓላማ
የልጁን ህይወት ማንም አይቀማ
መቃብር ያርፋል በአገልግሎቴ
ተከፍቶልኛል ደጁ የአባቴ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 1
Man new beza bereha yabelagn mena yat’et’agn wiha
Man new yedegefegn t’lqun sheleqo yashageregn
Ante neh leene enat abate
Nits’uh wedaje siga ena at’nte

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 2
Ayne ayneqel kezufanh
Fit ayazorm fiqr aynh

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 3
Werogn diqdq ch’elema
Tesfaye kesmo libe sidema
Aytogn sifes enbaye
Demena t’eqso met’a Getaye

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 4
Ts’ehey new ena yebrhan amde
Iyesus leene hiywet mengede
Alteshenefkum wide agzognal
Meqabr keflo hiywet set’tognal

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 5
Siley nefse kesga bech’elema qen bekfu adega
Dankugn mot eyayegn yenseha edme ch’emerelgn
Bets’dqe aydelem yeterefkut
Beesu fiqr new beesu mihret

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 6
Bichayen hogne hule yemaleqsew
Eyebedelkut siladanegn new

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 7
Mot hoy mewgiya yetale
Bilo t’lohal eyetagele
Siol dil megzath
Bado qertehal tebezbzeh

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 8
Beerasu mengst fet’rogn bealama
Yeljun hiywet manm ayqema
Meqabr yarfal beagelglote
Tekeftolgnal deju yeabate

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 1
ማን ነው በዛ በረሃ ያበላኝ መና ያጠጣኝ ውሃ
ማን ነው የደገፈኝ ጥልቁን ሸለቆ ያሻገረኝ
አንተ ነህ ለእኔ እናት አባቴ
ንጹህ ወዳጄ ስጋ እና አጥንቴ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 2
አይኔ አይነቀል ከዙፋንህ
ፊት አያዞርም ፍቅር አይንህ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 3
ወሮኝ ድቅድቅ ጨለማ
ተስፋዬ ከስሞ ልቤ ሲደማ
አይቶኝ ሲፈስ እንባዬ
ደመና ጠቅሶ መጣ ጌታዬ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 4
ፀሀይ ነው እና የብርሃን አምዴ
ኢየሱስ ለእኔ ህይወት መንገዴ
አልተሸነፍኩም ውዴ አግዞኛል
መቃብር ከፍሎ ህይወት ሰጥቶኛል

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 5
ሲለይ ነፍሴ ከስጋ በጨለማ ቀን በክፉ አደጋ
ዳንኩኝ ሞት እያየኝ የንሰሃ እድሜ ጨመረልኝ
በጽድቄ አይደለም የተረፍኩት
በእሱ ፍቅር ነው በእሱ ምህረት

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 6
ብቻዬን ሆኘ ሁሌ የማለቅሰው
እየበደልኩት ስላዳነኝ ነው

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 7
ሞት ሆይ መውጊያ የታለ
ብሎ ጥሎኃል እየታገለ
ሲኦል ድል መግዛትህ
ባዶ ቀርተሃል ተበዝብዘህ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 8
በእራሱ መንግስት ፈጥሮኝ በዓላማ
የልጁን ህይወት ማንም አይቀማ
መቃብር ያርፋል በአገልግሎቴ
ተከፍቶልኛል ደጁ የአባቴ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ',
        lyrics_transliteration = 'CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 1
Man new beza bereha yabelagn mena yat’et’agn wiha
Man new yedegefegn t’lqun sheleqo yashageregn
Ante neh leene enat abate
Nits’uh wedaje siga ena at’nte

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 2
Ayne ayneqel kezufanh
Fit ayazorm fiqr aynh

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 3
Werogn diqdq ch’elema
Tesfaye kesmo libe sidema
Aytogn sifes enbaye
Demena t’eqso met’a Getaye

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 4
Ts’ehey new ena yebrhan amde
Iyesus leene hiywet mengede
Alteshenefkum wide agzognal
Meqabr keflo hiywet set’tognal

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 5
Siley nefse kesga bech’elema qen bekfu adega
Dankugn mot eyayegn yenseha edme ch’emerelgn
Bets’dqe aydelem yeterefkut
Beesu fiqr new beesu mihret

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 6
Bichayen hogne hule yemaleqsew
Eyebedelkut siladanegn new

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 7
Mot hoy mewgiya yetale
Bilo t’lohal eyetagele
Siol dil megzath
Bado qertehal tebezbzeh

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 8
Beerasu mengst fet’rogn bealama
Yeljun hiywet manm ayqema
Meqabr yarfal beagelglote
Tekeftolgnal deju yeabate

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b00ffd52-db96-4b19-8a57-a585893d0a6e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 1
ማን ነው በዛ በረሃ ያበላኝ መና ያጠጣኝ ውሃ
ማን ነው የደገፈኝ ጥልቁን ሸለቆ ያሻገረኝ
አንተ ነህ ለእኔ እናት አባቴ
ንጹህ ወዳጄ ስጋ እና አጥንቴ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 2
አይኔ አይነቀል ከዙፋንህ
ፊት አያዞርም ፍቅር አይንህ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 3
ወሮኝ ድቅድቅ ጨለማ
ተስፋዬ ከስሞ ልቤ ሲደማ
አይቶኝ ሲፈስ እንባዬ
ደመና ጠቅሶ መጣ ጌታዬ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 4
ፀሀይ ነው እና የብርሃን አምዴ
ኢየሱስ ለእኔ ህይወት መንገዴ
አልተሸነፍኩም ውዴ አግዞኛል
መቃብር ከፍሎ ህይወት ሰጥቶኛል

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 5
ሲለይ ነፍሴ ከስጋ በጨለማ ቀን በክፉ አደጋ
ዳንኩኝ ሞት እያየኝ የንሰሃ እድሜ ጨመረልኝ
በጽድቄ አይደለም የተረፍኩት
በእሱ ፍቅር ነው በእሱ ምህረት

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 6
ብቻዬን ሆኘ ሁሌ የማለቅሰው
እየበደልኩት ስላዳነኝ ነው

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 7
ሞት ሆይ መውጊያ የታለ
ብሎ ጥሎኃል እየታገለ
ሲኦል ድል መግዛትህ
ባዶ ቀርተሃል ተበዝብዘህ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 8
በእራሱ መንግስት ፈጥሮኝ በዓላማ
የልጁን ህይወት ማንም አይቀማ
መቃብር ያርፋል በአገልግሎቴ
ተከፍቶልኛል ደጁ የአባቴ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b00ffd52-db96-4b19-8a57-a585893d0a6e'::uuid, 'ethiopian-ortodoxtewahido-mezmur-zemary-abel-mekbib-agatami-aydelem', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nahu-weteniku ("Nahu Weteniku")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b11db480-f838-45b7-9a9c-f662ad531913'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 1
የምትለምን አንተን ድኅነት እንዲመጣ
ለኃጥእ ለጻድቅ ዘወትር በምትወጣ
ልመሰልህ ወደድኩ በፀሐይ ጸአዳ
ቀን የታየች ፀሐይ ማታ ትጠልቃለች

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 2
የአንተ ልመና ግን ዘወትር ታሰምራለች
በነፍስ በሥጋ ዘወትር ስንቸገር
ፈጥነህ እየደረስክ ከክፉ የምትሰውር
መመኪያ ማረፊያ ተራዳኢ ነህና

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 3
የድርቅ ወር ዝናም በሐሩርም ደመና
በምልጃህ ልጠለል ከዓለም ፈተና
በመልካም መዓዛ መቅደሱን በሚያውድ
ከቅዱሳን ጸሎት ተዋሕዶ በሚያርግ

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 4
በንፁሕ ዕጣን አምሳል ልመስልህ ብወድ
የኃጢአትን ሽታ ከሰው የሚሳድድ
የምልጃህ ሽቱነት ሁሉን ስለሚያውድ
በማያልፈው ዓለም በክብር እንድኖር

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 5
የቀድሞ በደሌ በፍርድ እንዳይታሰብ
በምሕረት እንዲያየኝ የፈጠረኛ አምላክ
በመጠራቴ ቀን በዚያች ጭንቅ ሰዓት
ለነፍሴ ዋስ ሆነህ በአምላክ ፊት ቁምላት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 6
ለሥጋችን ጽናት ዋስ ጠበቃ ለነፍስ
የምሕረት አማላጅ ሰማዕት ጊዮርጊስ
ለስምህም ዝክር ለክብርህ ስብሐት
ያቀረበችን ነፍስ ሆና በፍርሃት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 7
የመድኅን ልጁን በምልጃህ አስባት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 1
Yemtlemn anten dihnet endimet’a
Lehat’e lets’adq zewetr bemtwet’a
Limeselh wededku bets’ehey ts’eada
Qen yetayech ts’ehey mata tit’elqalech

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 2
Yeante limena gin zewetr tasemralech
Benefs besga zewetr sincheger
Fet’neh eyederesk kekfu yemtsewr
Memekiya marefiya teradai nehna

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 3
Yedrq wer zinam beherurm demena
Bemljah lit’elel kealem fetena
Bemelkam meaza meqdesun bemiyawd
Keqdusan ts’elot Tewahedo bemiyarg

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 4
Bents’uh et’an amsal limeslh biwed
Yehat’iatn shta kesew yemisadd
Yemljah shtunet hulun silemiyawd
Bemayalfew alem bekbr endnor

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 5
Yeqedmo bedele befrd endaytaseb
Bemhret endiyayegn yefet’eregna amlak
Bemet’erate qen beziyach ch’nq seat
Lenefse was honeh beamlak fit qumlat

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 6
Lesgachn ts’nat was t’ebeqa lenefs
Yemhret amalaj semaet Giyorgis
Lesmhm zikr lekbrh sibhet
Yaqerebechn nefs hona befrhat

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 7
Yemedhn lijun bemljah asbat

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 1
የምትለምን አንተን ድኅነት እንዲመጣ
ለኃጥእ ለጻድቅ ዘወትር በምትወጣ
ልመሰልህ ወደድኩ በፀሐይ ጸአዳ
ቀን የታየች ፀሐይ ማታ ትጠልቃለች

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 2
የአንተ ልመና ግን ዘወትር ታሰምራለች
በነፍስ በሥጋ ዘወትር ስንቸገር
ፈጥነህ እየደረስክ ከክፉ የምትሰውር
መመኪያ ማረፊያ ተራዳኢ ነህና

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 3
የድርቅ ወር ዝናም በሐሩርም ደመና
በምልጃህ ልጠለል ከዓለም ፈተና
በመልካም መዓዛ መቅደሱን በሚያውድ
ከቅዱሳን ጸሎት ተዋሕዶ በሚያርግ

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 4
በንፁሕ ዕጣን አምሳል ልመስልህ ብወድ
የኃጢአትን ሽታ ከሰው የሚሳድድ
የምልጃህ ሽቱነት ሁሉን ስለሚያውድ
በማያልፈው ዓለም በክብር እንድኖር

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 5
የቀድሞ በደሌ በፍርድ እንዳይታሰብ
በምሕረት እንዲያየኝ የፈጠረኛ አምላክ
በመጠራቴ ቀን በዚያች ጭንቅ ሰዓት
ለነፍሴ ዋስ ሆነህ በአምላክ ፊት ቁምላት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 6
ለሥጋችን ጽናት ዋስ ጠበቃ ለነፍስ
የምሕረት አማላጅ ሰማዕት ጊዮርጊስ
ለስምህም ዝክር ለክብርህ ስብሐት
ያቀረበችን ነፍስ ሆና በፍርሃት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 7
የመድኅን ልጁን በምልጃህ አስባት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ',
        lyrics_transliteration = 'CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 1
Yemtlemn anten dihnet endimet’a
Lehat’e lets’adq zewetr bemtwet’a
Limeselh wededku bets’ehey ts’eada
Qen yetayech ts’ehey mata tit’elqalech

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 2
Yeante limena gin zewetr tasemralech
Benefs besga zewetr sincheger
Fet’neh eyederesk kekfu yemtsewr
Memekiya marefiya teradai nehna

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 3
Yedrq wer zinam beherurm demena
Bemljah lit’elel kealem fetena
Bemelkam meaza meqdesun bemiyawd
Keqdusan ts’elot Tewahedo bemiyarg

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 4
Bents’uh et’an amsal limeslh biwed
Yehat’iatn shta kesew yemisadd
Yemljah shtunet hulun silemiyawd
Bemayalfew alem bekbr endnor

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 5
Yeqedmo bedele befrd endaytaseb
Bemhret endiyayegn yefet’eregna amlak
Bemet’erate qen beziyach ch’nq seat
Lenefse was honeh beamlak fit qumlat

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 6
Lesgachn ts’nat was t’ebeqa lenefs
Yemhret amalaj semaet Giyorgis
Lesmhm zikr lekbrh sibhet
Yaqerebechn nefs hona befrhat

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 7
Yemedhn lijun bemljah asbat

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b11db480-f838-45b7-9a9c-f662ad531913'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 1
የምትለምን አንተን ድኅነት እንዲመጣ
ለኃጥእ ለጻድቅ ዘወትር በምትወጣ
ልመሰልህ ወደድኩ በፀሐይ ጸአዳ
ቀን የታየች ፀሐይ ማታ ትጠልቃለች

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 2
የአንተ ልመና ግን ዘወትር ታሰምራለች
በነፍስ በሥጋ ዘወትር ስንቸገር
ፈጥነህ እየደረስክ ከክፉ የምትሰውር
መመኪያ ማረፊያ ተራዳኢ ነህና

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 3
የድርቅ ወር ዝናም በሐሩርም ደመና
በምልጃህ ልጠለል ከዓለም ፈተና
በመልካም መዓዛ መቅደሱን በሚያውድ
ከቅዱሳን ጸሎት ተዋሕዶ በሚያርግ

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 4
በንፁሕ ዕጣን አምሳል ልመስልህ ብወድ
የኃጢአትን ሽታ ከሰው የሚሳድድ
የምልጃህ ሽቱነት ሁሉን ስለሚያውድ
በማያልፈው ዓለም በክብር እንድኖር

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 5
የቀድሞ በደሌ በፍርድ እንዳይታሰብ
በምሕረት እንዲያየኝ የፈጠረኛ አምላክ
በመጠራቴ ቀን በዚያች ጭንቅ ሰዓት
ለነፍሴ ዋስ ሆነህ በአምላክ ፊት ቁምላት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 6
ለሥጋችን ጽናት ዋስ ጠበቃ ለነፍስ
የምሕረት አማላጅ ሰማዕት ጊዮርጊስ
ለስምህም ዝክር ለክብርህ ስብሐት
ያቀረበችን ነፍስ ሆና በፍርሃት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 7
የመድኅን ልጁን በምልጃህ አስባት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b11db480-f838-45b7-9a9c-f662ad531913'::uuid, 'nahu-weteniku', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
