-- =========================================================================
-- ROLLBACK BATCH 09 of 10: 100 Hymns (801 to 900)
-- Target: public.mezmur_data_import
-- =========================================================================

DO $rollback_batch_09$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn rollback: Tiwilid Hulu (tiwilid-hulu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/

VERSE 1
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/

CHORUS
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/',
      lyrics_transliteration = 'CHORUS
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)

VERSE 1
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)

CHORUS
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tiwilid-hulu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/

VERSE 1
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)

VERSE 1
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tiwilid-hulu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: To Him Who Sits on the Throne (to-him-who-sits-on-the-throne)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
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
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'to-him-who-sits-on-the-throne'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'To Him who sits on the throne
The Lamb who is Slain to atone
Praise and Honor, Glory and power
Amen amen amen forever and ever

VERSE 1
Let every creature in heaven and on earth
With thousands of angels and twenty-four elders
With the righteous and the four living beings
Praise the Conqueror and the King of kings/x2/

VERSE 2
He became a man and, didn’t think it a loss
He was obedient up to death on the Cross
Let every knee bow, let every tongue praise
To Jesus Christ the name above all names/x2/

VERSE 3
Because the wedding of the divine Lamb has come
Let''s wash and clean our robes by the blood of the groom
And sing like the roar of rushing waters
Like a mighty wave, as loud peals of thunder/x2/

VERSE 4
He who sits on the throne will make everything new
He will wipe every tear, His words are always true
He prepared for us a place no eyes have seen
And no ears have heard, for that let us all sing/x2/'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'to-him-who-sits-on-the-throne', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: To Mother Mary (to-mother-mary)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Le Mariam
Enzemiralen lezelalem',
      lyrics_english = 'CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 1
The unblemished gate
Ezikiel’s written
She is truly pure
A twofold virgin

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 2
We call out to her
Our foundation
Praise the mother of love and compassion

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 3
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 4
Tender hearted dove
The bringer of peace
For my gloomy life
Shine your light on me

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 5
I will plead to your name
Virgin for my soul
Entrusted to you the one who consoles

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 6
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 7
It is plentiful
All my love for you
It has no limits
Unspeakable truth

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 8
Through her I''m filled with joy
By Mary I''m proud
Calling to her name I will sing aloud

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 9
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 10
I ask her come to me
Through the night and day
She is by my side
Here with me to stay

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 11
Glorifying her
They submit their praise
No words can describe her marvelous ways

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 12
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 13
Le Mariam /x2/
Enzemiralen lezelalem /x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 14
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'to-mother-mary'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Le Mariam
Enzemiralen lezelalem'
    AND lyrics_english IS NOT DISTINCT FROM 'To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 1
The unblemished gate
Ezikiel’s written
She is truly pure
A twofold virgin

VERSE 2
We call out to her
Our foundation
Praise the mother of love and compassion

VERSE 3
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 4
Tender hearted dove
The bringer of peace
For my gloomy life
Shine your light on me

VERSE 5
I will plead to your name
Virgin for my soul
Entrusted to you the one who consoles

VERSE 6
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 7
It is plentiful
All my love for you
It has no limits
Unspeakable truth

VERSE 8
Through her I''m filled with joy
By Mary I''m proud
Calling to her name I will sing aloud

VERSE 9
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 10
I ask her come to me
Through the night and day
She is by my side
Here with me to stay

VERSE 11
Glorifying her
They submit their praise
No words can describe her marvelous ways

VERSE 12
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 13
Le Mariam /x2/
Enzemiralen lezelalem /x2/

VERSE 14
To mother Mary/x2/
We will sing to her for eternity/x2/'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'to-mother-mary', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: To Receive The Lord’s Love (to-receive-the-lords-love)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሳለፍከኝ

VERSE 1
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሳለፍከኝ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሳለፍከኝ',
      lyrics_transliteration = 'CHORUS
Yewedegn geta min adrgelet new
Bezemerletim yansbetal yihiw

VERSE 1
Kewidqete anseteh dikamen yagezhegn
Sabarawun dildiy getme yasalefegn

CHORUS
Yewedegn geta min adrgelet new
Bezemerletim yansbetal yihiw',
      lyrics_english = 'CHORUS
To receive the Lord’s love what have I done for Him
Although it’s not enough I’m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 1
When I had nothing left begging in Jericho
Swallowed up by darkness I had nowhere to go
The Lord of light had heard my cries and He drew near
With His hands He healed me my vision became clear

CHORUS
To receive the Lord’s love what have I done for Him
Although it’s not enough I’m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 2
For many months and years I had been bedridden
No one came to my aid no support was given
My Lord and my Savior He came to me and said
Your sins are forgiven rise and carry your bed

CHORUS
To receive the Lord’s love what have I done for Him
Although it’s not enough I’m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 3
With twelve long years of pain blood flowing with no end
I was rejected with no one to call a friend
When Christ came near I touched the edge of His clothing
The power that came forth ended my suffering

CHORUS
To receive the Lord’s love what have I done for Him
Although it’s not enough I’m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 4
I was a drunk and thief and an adulterer
I was the chief rebel and was a murderer
But I praise God because He changed my life around
In His power and hope today I do abound

CHORUS
To receive the Lord’s love what have I done for Him
Although it’s not enough I’m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 5
To receive the Lord’s love what have I done for Him
Although it’s not enough I’m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

CHORUS
To receive the Lord’s love what have I done for Him
Although it’s not enough I’m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'to-receive-the-lords-love'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሳለፍከኝ

VERSE 1
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሳለፍከኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yewedegn geta min adrgelet new
Bezemerletim yansbetal yihiw

VERSE 1
Kewidqete anseteh dikamen yagezhegn
Sabarawun dildiy getme yasalefegn'
    AND lyrics_english IS NOT DISTINCT FROM 'To receive the Lord’s love what have I done for Him
Although it’s not enough I’m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again

VERSE 1
When I had nothing left begging in Jericho
Swallowed up by darkness I had nowhere to go
The Lord of light had heard my cries and He drew near
With His hands He healed me my vision became clear

VERSE 2
For many months and years I had been bedridden
No one came to my aid no support was given
My Lord and my Savior He came to me and said
Your sins are forgiven rise and carry your bed

VERSE 3
With twelve long years of pain blood flowing with no end
I was rejected with no one to call a friend
When Christ came near I touched the edge of His clothing
The power that came forth ended my suffering

VERSE 4
I was a drunk and thief and an adulterer
I was the chief rebel and was a murderer
But I praise God because He changed my life around
In His power and hope today I do abound

VERSE 5
To receive the Lord’s love what have I done for Him
Although it’s not enough I’m offering this hymn
Your strength lifted me up aided my weakness then
You fixed this broken bridge so I can cross again'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'to-receive-the-lords-love', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tolo Na (tolo-na)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 1
መጥፊ ዕድሌ አብቅቶ ልቤ እንዲረጋጋ
ከአይን ጥቅሻ ፈጥነህ ወደ እኔ ቤት ግባ
ቶሎ ና ገብርኤል አደራ
ላዘነ ብርታትን የምትሰብክበት

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 2
ለተጨነቀ ሰው የምትደርስበት
አርያማያዊው ካህን ይዘህ ሰናይ ዜና
ድረስ ገብርኤል ሆይ ከመቅፅበት ናና
ቶሎ ና ሩፋኤል አደራ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 3
ፈታሄ ማህፀን ሩፋኤል አባቴ
ኃጥያት ነግሶበት ፈርሶብኛል ቤቴ
ደዌን የምታርቅ ከስራት የምትፈታ
ያሳደከኝ መልዓክ በምህረት ቶሎ ና

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 4
ቶሎ ና ራጉኤል አደራ
በፈጠነ ዘመን በተከዳ ዕድሜ
ስምህን እጠራለሁ ደግሜ ደግሜ
ሰላሜ ነህና የምትደግፈኝ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 5
በሰርክ በነግህ ራጉኤል ናልኝ
ቶሎ ና ዑራኤል አደራ
የፍቅር ስንቅ ይዘህ የሰላምን ፅዋ
በቀኝህ መፅናናት በግራህ ፍስሃ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 6
ድረስ ዑራኤል ሆይ ፈጥነህ ወደኛ ና
ፍቅር ከኛ ርቆ ተጨንቃለችና

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት',
      lyrics_transliteration = 'CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 1
Met’fi edle abqto libe endiregaga
Keayn t’qsha fet’neh wede ene bet giba
Tolo na Gebriel adera
Lazene birtatn yemtsebkbet

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 2
Letech’eneqe sew yemtdersbet
Aryamayawiw kahn yizeh senay zena
Dires Gebriel hoy kemeqts’bet nana
Tolo na Rufael adera

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 3
Fetahe mahts’en Rufael abate
Hat’yat negsobet fersobgnal bete
Dewen yemtarq kesrat yemtfeta
Yasadekegn melak bemhret tolo na

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 4
Tolo na raguel adera
Befet’ene zemen betekeda edme
Simhn et’eralehu degme degme
Selame nehna yemtdegfegn

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 5
Beserk benegh raguel nalgn
Tolo na urael adera
Yefqr sinq yizeh yeselamn ts’wa
Beqegnh mets’nanat begrah fisha

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 6
Dires urael hoy fet’neh wedegna na
Fiqr kegna riqo tech’enqalechna

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tolo-na'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 1
መጥፊ ዕድሌ አብቅቶ ልቤ እንዲረጋጋ
ከአይን ጥቅሻ ፈጥነህ ወደ እኔ ቤት ግባ
ቶሎ ና ገብርኤል አደራ
ላዘነ ብርታትን የምትሰብክበት

VERSE 2
ለተጨነቀ ሰው የምትደርስበት
አርያማያዊው ካህን ይዘህ ሰናይ ዜና
ድረስ ገብርኤል ሆይ ከመቅፅበት ናና
ቶሎ ና ሩፋኤል አደራ

VERSE 3
ፈታሄ ማህፀን ሩፋኤል አባቴ
ኃጥያት ነግሶበት ፈርሶብኛል ቤቴ
ደዌን የምታርቅ ከስራት የምትፈታ
ያሳደከኝ መልዓክ በምህረት ቶሎ ና

VERSE 4
ቶሎ ና ራጉኤል አደራ
በፈጠነ ዘመን በተከዳ ዕድሜ
ስምህን እጠራለሁ ደግሜ ደግሜ
ሰላሜ ነህና የምትደግፈኝ

VERSE 5
በሰርክ በነግህ ራጉኤል ናልኝ
ቶሎ ና ዑራኤል አደራ
የፍቅር ስንቅ ይዘህ የሰላምን ፅዋ
በቀኝህ መፅናናት በግራህ ፍስሃ

VERSE 6
ድረስ ዑራኤል ሆይ ፈጥነህ ወደኛ ና
ፍቅር ከኛ ርቆ ተጨንቃለችና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 1
Met’fi edle abqto libe endiregaga
Keayn t’qsha fet’neh wede ene bet giba
Tolo na Gebriel adera
Lazene birtatn yemtsebkbet

VERSE 2
Letech’eneqe sew yemtdersbet
Aryamayawiw kahn yizeh senay zena
Dires Gebriel hoy kemeqts’bet nana
Tolo na Rufael adera

VERSE 3
Fetahe mahts’en Rufael abate
Hat’yat negsobet fersobgnal bete
Dewen yemtarq kesrat yemtfeta
Yasadekegn melak bemhret tolo na

VERSE 4
Tolo na raguel adera
Befet’ene zemen betekeda edme
Simhn et’eralehu degme degme
Selame nehna yemtdegfegn

VERSE 5
Beserk benegh raguel nalgn
Tolo na urael adera
Yefqr sinq yizeh yeselamn ts’wa
Beqegnh mets’nanat begrah fisha

VERSE 6
Dires urael hoy fet’neh wedegna na
Fiqr kegna riqo tech’enqalechna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tolo-na', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Track (track)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'track'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ
ከድንግል ማርያም ተወለደ

VERSE 1
ዓለሙን እንዲሁ ወደደና
ከሰማያት በላይ ወረደና
በአጭር ቁመት
በጠባብ ደረት

VERSE 2
ተወሰነ አምላከ አማልክት
ከሰማያት የወረደ ፍቅር ስቦት የመጣው
ወልደ አብ ወልደ ማርያም እየሱስ ፈራጅ ነው
አዝ…

VERSE 3
ቅድመ ዓለም ተወልዶ ያለ እናት
ድህረ አለምም ያለ አባት
የእግዚአብሔር ልጅ በርግጥም ሰው ሆነ
ሁሉ በርሱ ይሄው ተከናወነ

VERSE 4
ከሰማያት የወረደ ፍቅር ስቦት የመጣው
ወልደ አብ ወልደ ማርያም ክርስቶስ አምላክ ነው
አዝ….
የማይታይ ታየ በምድር

VERSE 5
ረቂቁ ገዘፈ ስለ ፍቅር
ስጋን ተዋህዶ ሆነልን ፈውስ
አማኑኤል የነገስታት ንጉስ
ከሰማያት የወረደ ፍቅር ስቦት የመጣው

VERSE 6
ወልደ አብ ወልደ ማርያም እግዚአብሔር እርሱ ነው
በርሱ ፈቃድ በአባቱ ፈቃድ
በመንፈስ ቅዱስ ፈቃድ
ከሰማያት ወረደ

VERSE 7
ከድንግል ማርያም ተወለደ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede
Kedngl Maryam tewelede

VERSE 1
Alemun endihu wededena
Kesemayat belay weredena
Beach’r qumet
Bet’ebab deret

VERSE 2
Tewesene amlake amalkt
Kesemayat yewerede fiqr sibot yemet’aw
Welde Ab welde Maryam eyesus feraj new

VERSE 3
Qidme alem teweldo yale enat
Dihre alemm yale abat
YeEgziabher lij bergt’m sew hone
Hulu bersu yihew tekenawene

VERSE 4
Kesemayat yewerede fiqr sibot yemet’aw
Welde Ab welde Maryam Kristos amlak new
Yemaytay taye bemdr

VERSE 5
Reqiqu gezefe sile fiqr
Sigan Tewahedo honeln fews
Amanuel yenegestat nigus
Kesemayat yewerede fiqr sibot yemet’aw

VERSE 6
Welde Ab welde Maryam Egziabher ersu new
Bersu feqad beabatu feqad
Bemenfes Kidus feqad
Kesemayat werede

VERSE 7
Kedngl Maryam tewelede'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'track', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Track (track-1829)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 1
ቤተ ሣይዳ ላለች ከመቅደስ ላኖርካት
በበደል ለምናዝን ምህረትን ፍለጋ
በንስሐ ማረን ከዓራተ ዝንጋኤ ከኃጥያት አልጋ
በጠበሉ ደጃፍ ለፀኑት የሚላክ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 2
ለቀድሶተ ማይ የሚወርደው መልዐክ
በመንገድ ጠብቆ ሞትን የሚያሳልፍ
ዛሬም ይድረስልን ቀድመው ከገቡት ጋር ነፍሳችን እንድታርፍ
አልጋው ተሸክሞት ደክሞ ለሚጨነቅ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 3
አልጋን አሸክመህ ህመም የምታርቅ
ደዌያችንን ነስተህ ቆስለህ የምትፈውስ
የመፃጕዕ ረዳት የነፍሳት መጠጊያ መድኃኒት ክርስቶስ
የባሰ እንዳያየው ቃሉን ያልጠበቀ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 4
እጁን ሰዶ ፀፍቶ ከደዌው ታረቀ
ሰንበትን የሻረ ከሚሉት እንዳንውል
ለትንሳኤው ደስታ የሰንበትን ጌታ ዓርብን እንከተል
ዘማሪ ዲ/ን ቀዳሜፀጋ ዮሐንስ

CHORUS
✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት',
      lyrics_transliteration = 'CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 1
Bete sayda lalech kemeqdes lanorkat
Bebedel lemnazn mihretn filega
Benshe maren kearate zingae kehat’yat alga
Bet’ebelu dejaf lets’enut yemilak

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 2
Leqedsote may yemiwerdew melak
Bemenged t’ebqo motn yemiyasalf
Zarem yidresln qedmew kegebut gar nefsachn endtarf
Algaw teshekmot dekmo lemich’eneq

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 3
Algan ashekmeh himem yemtarq
Deweyachnn nesteh qosleh yemtfews
Yemets’agwe redat yenefsat met’egiya medhanit Kristos
Yebase endayayew qalun yalt’ebeqe

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 4
Ejun sedo ts’efto kedewew tareqe
Senbetn yeshare kemilut endanwl
Letnsaew desta yesenbetn Geta arbn enketel
Zemari di/n qedamets’ega yohens

CHORUS
✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'track-1829'
    AND lyrics_amharic IS NOT DISTINCT FROM '✞ መፃጕዕ
ሰው የለኝም ያለ በሠው የተረሳ
የዳነው መፃጕዕ ያዳነውን ረሳ
በአምስቱ እርከኖች በአእማደ ምስጢራት

VERSE 1
ቤተ ሣይዳ ላለች ከመቅደስ ላኖርካት
በበደል ለምናዝን ምህረትን ፍለጋ
በንስሐ ማረን ከዓራተ ዝንጋኤ ከኃጥያት አልጋ
በጠበሉ ደጃፍ ለፀኑት የሚላክ

VERSE 2
ለቀድሶተ ማይ የሚወርደው መልዐክ
በመንገድ ጠብቆ ሞትን የሚያሳልፍ
ዛሬም ይድረስልን ቀድመው ከገቡት ጋር ነፍሳችን እንድታርፍ
አልጋው ተሸክሞት ደክሞ ለሚጨነቅ

VERSE 3
አልጋን አሸክመህ ህመም የምታርቅ
ደዌያችንን ነስተህ ቆስለህ የምትፈውስ
የመፃጕዕ ረዳት የነፍሳት መጠጊያ መድኃኒት ክርስቶስ
የባሰ እንዳያየው ቃሉን ያልጠበቀ

VERSE 4
እጁን ሰዶ ፀፍቶ ከደዌው ታረቀ
ሰንበትን የሻረ ከሚሉት እንዳንውል
ለትንሳኤው ደስታ የሰንበትን ጌታ ዓርብን እንከተል
ዘማሪ ዲ/ን ቀዳሜፀጋ ዮሐንስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM '✞ mets’agwe
Sew yelegnm yale besew yeteresa
Yedanew mets’agwe yadanewn resa
Beamstu erkenoch beaemade mist’irat

VERSE 1
Bete sayda lalech kemeqdes lanorkat
Bebedel lemnazn mihretn filega
Benshe maren kearate zingae kehat’yat alga
Bet’ebelu dejaf lets’enut yemilak

VERSE 2
Leqedsote may yemiwerdew melak
Bemenged t’ebqo motn yemiyasalf
Zarem yidresln qedmew kegebut gar nefsachn endtarf
Algaw teshekmot dekmo lemich’eneq

VERSE 3
Algan ashekmeh himem yemtarq
Deweyachnn nesteh qosleh yemtfews
Yemets’agwe redat yenefsat met’egiya medhanit Kristos
Yebase endayayew qalun yalt’ebeqe

VERSE 4
Ejun sedo ts’efto kedewew tareqe
Senbetn yeshare kemilut endanwl
Letnsaew desta yesenbetn Geta arbn enketel
Zemari di/n qedamets’ega yohens'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'track-1829', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Truly with Glory (truly-with-glory)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2/

VERSE 1
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2/

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2/',
      lyrics_transliteration = 'CHORUS
Ewnet beewnēt geta tenestual
Tenestual bekibir

VERSE 1
Motin dil adirgual

CHORUS
Ewnet beewnēt geta tenestual
Tenestual bekibir',
      lyrics_english = 'CHORUS
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 1
Through His death He subdued death and all corruption
The first fruit of the dead our Lord has risen
The first fruit of the dead our Lord has risen

CHORUS
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 2
Truly with glory the Lord is risen
Triumphant over death with His resurrection

CHORUS
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 3
They could conceal the tomb and guard it with soldiers
Even by stacking rocks boulder atop boulder
But Earth could not bear to bury her creator

CHORUS
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 4
Truly with glory the Lord is risen
Triumphant over death with His resurrection

CHORUS
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 5
The conquering lion and King of Kings Jesus
On the Sabbath He has risen victorious
On the Sabbath He has risen victorious

CHORUS
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 6
Truly with glory the Lord is risen
Triumphant over death with His resurrection

CHORUS
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 7
By His atoning blood we have been sanctified
Limitless is His love graciously He provides
For He is eternal forever magnified

CHORUS
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 8
Truly with glory the Lord is risen
Triumphant over death with His resurrection

CHORUS
Truly with glory the Lord is risen
Triumphant over death with His resurrection',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'truly-with-glory'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2/

VERSE 1
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ewnet beewnēt geta tenestual
Tenestual bekibir

VERSE 1
Motin dil adirgual'
    AND lyrics_english IS NOT DISTINCT FROM 'Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 1
Through His death He subdued death and all corruption
The first fruit of the dead our Lord has risen
The first fruit of the dead our Lord has risen

VERSE 2
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 3
They could conceal the tomb and guard it with soldiers
Even by stacking rocks boulder atop boulder
But Earth could not bear to bury her creator

VERSE 4
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 5
The conquering lion and King of Kings Jesus
On the Sabbath He has risen victorious
On the Sabbath He has risen victorious

VERSE 6
Truly with glory the Lord is risen
Triumphant over death with His resurrection

VERSE 7
By His atoning blood we have been sanctified
Limitless is His love graciously He provides
For He is eternal forever magnified

VERSE 8
Truly with glory the Lord is risen
Triumphant over death with His resurrection'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'truly-with-glory', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tsega Nesa’ene (tsega-nesaene)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ጸጋ ነሣዕነ ወህይወተ ረከብነ
በሐይለ መስቀሉ ለኢየሱስ ክርስቶስ በኃይለ መስቀሉ
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ እግዚአብሔር

VERSE 1
ጸጋን ተቀበልን ሕይወትንም አገኘን (፪)
በመስቀሉ ኃይል በኢየሱስ ክርስቶስ በመስቀሉ ኃይል (፪)
አቤቱ አንተን (፪) እናመሰግንሃለን እግዚአብሔር (፪)

CHORUS
ጸጋ ነሣዕነ ወህይወተ ረከብነ
በሐይለ መስቀሉ ለኢየሱስ ክርስቶስ በኃይለ መስቀሉ
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ እግዚአብሔር',
      lyrics_transliteration = 'CHORUS
Tsega nesa’ene we’hiwote rekebine
Behayle meskelu le’Iyesus Kiristos behayle meskelu
Kiyake egzio neakut wensebhake Egziabher

VERSE 1
Tsegan tekebeln hiwotinim agegnen (2)
Bemeskelu hayl be’Iyesus Kiristos bemeskelu hayl (2)
Abetu anten (2) enameseginihalen Egziabher (2)

CHORUS
Tsega nesa’ene we’hiwote rekebine
Behayle meskelu le’Iyesus Kiristos behayle meskelu
Kiyake egzio neakut wensebhake Egziabher',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tsega-nesaene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ጸጋ ነሣዕነ ወህይወተ ረከብነ
በሐይለ መስቀሉ ለኢየሱስ ክርስቶስ በኃይለ መስቀሉ
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ እግዚአብሔር

VERSE 1
ጸጋን ተቀበልን ሕይወትንም አገኘን (፪)
በመስቀሉ ኃይል በኢየሱስ ክርስቶስ በመስቀሉ ኃይል (፪)
አቤቱ አንተን (፪) እናመሰግንሃለን እግዚአብሔር (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tsega nesa’ene we’hiwote rekebine
Behayle meskelu le’Iyesus Kiristos behayle meskelu
Kiyake egzio neakut wensebhake Egziabher

VERSE 1
Tsegan tekebeln hiwotinim agegnen (2)
Bemeskelu hayl be’Iyesus Kiristos bemeskelu hayl (2)
Abetu anten (2) enameseginihalen Egziabher (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tsega-nesaene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tsegereda, Besimeh Tamegnalehu (tsegereda-besimeh-tamegnalehu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥ልኝ
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
በአባቶቼ በረከት የበራከኝ
የእስራኤል ታደጊያቸው ክበርልኝ
ዘልአለም ከፍ በል ተመስገንልኝ
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
፥፥፥፥
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታጽናናኝ ኖሬአለው ለብዙ ዘመን

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
ተገፍቶ መች ይወድቃል ባንተ የሚታመን
አይሞትም ይኖራል ባንተ የሚታመን
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥፥፥

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ይቅርታና ምህረትህ እነርሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሃሴት ላድርግ በንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አጽናናኝ ጌታ

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ',
      lyrics_transliteration = 'CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
::::::::::::::::::::::::::::::
::lgn
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Beabatoche bereket yeberakegn
Yeesrael tadegiyachew kiberlgn
Zelalem kef bel temesgenlgn
:::::::::::::::::::::::::::::

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
::::
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealew lebzu zemen

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Tegefto mech yiwedqal bante yemitamen
Aymotm yinoral bante yemitamen
::::::::::::::::::::::::::::::::
::::

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Yiqrtana mihreth enersu yimrugn
Wet’medna enqfatu endayadekmugn
Bets’dqh haset ladrg bente liberta
Metekez malqes yibqagn ats’nanagn Geta

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 6
Tenegro ayalqm yeamlake wileta

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tsegereda-besimeh-tamegnalehu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥ልኝ
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር

VERSE 2
በአባቶቼ በረከት የበራከኝ
የእስራኤል ታደጊያቸው ክበርልኝ
ዘልአለም ከፍ በል ተመስገንልኝ
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥

VERSE 3
፥፥፥፥
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታጽናናኝ ኖሬአለው ለብዙ ዘመን

VERSE 4
ተገፍቶ መች ይወድቃል ባንተ የሚታመን
አይሞትም ይኖራል ባንተ የሚታመን
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥፥፥

VERSE 5
ይቅርታና ምህረትህ እነርሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሃሴት ላድርግ በንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አጽናናኝ ጌታ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
::::::::::::::::::::::::::::::
::lgn
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor

VERSE 2
Beabatoche bereket yeberakegn
Yeesrael tadegiyachew kiberlgn
Zelalem kef bel temesgenlgn
:::::::::::::::::::::::::::::

VERSE 3
::::
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealew lebzu zemen

VERSE 4
Tegefto mech yiwedqal bante yemitamen
Aymotm yinoral bante yemitamen
::::::::::::::::::::::::::::::::
::::

VERSE 5
Yiqrtana mihreth enersu yimrugn
Wet’medna enqfatu endayadekmugn
Bets’dqh haset ladrg bente liberta
Metekez malqes yibqagn ats’nanagn Geta

VERSE 6
Tenegro ayalqm yeamlake wileta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tsegereda-besimeh-tamegnalehu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Tsehayin Yachelemew Tsehay (tsehayin-yachelemew-tsehay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 1
የማይሞተው ሞተ ሞትን እንዲሽር
አለምን ወደደ በዘላለም ፍቅር
እርሱ እየወደቀ እኛን አነሳን
እርሱ እየቆሰለ እኛን ፈወሰን

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 2
የብርሐን ዐይኗን ነበልባል ድንግል ማርያም ሸፍነች
አትናገርም ሲያጠጡት እያየች
አንድ ልጄ ወየው እያለች ድንግል አዘነች
አውነተኛው ጸሐይ ሳለ በመስቀል ላይ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 3
ጨረቃም ደም ሆነች እርቃኑ እንዳይታይ
ከዋክብት ረገፉ ሙታንም ተነሱ
አስገኚ ገዢያቸው ሲሰቀል ንጉሱ
ዮሐንስ ልቧን ደግፎ ከጎልጎታ ደረሰች

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 4
በጽኑ መከራ ወድቃ እየተነሳች
አንድ ልጇን በስስት አየች ድንግል አዘነች
በብርሐን ፊቱ ምራቅ ተተፋበት
የእግዚአብሔር ልጅ አይሁድ ዘበቱበት

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 5
የሞትነው ተነሳን የራቅነው ቀረብን
የቀራንዮ በግ ለኛ ተሰዋልን
ደረቷን ደቅታ ቀና አለች
ልጇን ልታየው በፍቅር

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 6
ሲደፉት ሲያዳፉት ሲጥሉት ከምድር
እርሱ እንደወንበዴ እየተቆጠረ
ቅዱሱ ተዋርዶ እኛን አከበረ
ከርስታችን ገባን በደሙ ማዕተብ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 7
ክርስቶስ እርሱ ነው የእረፍታችን ወደብ
በነፍሷ ሰይፍ አለፈ አለቀሰች ተንሰቅስቃ
በአይሁድ ጭካኔ እጅጉን ተሳቃ
በአንድ ልጇ አየች ሰቆቃ በምድር ወድቃ

CHORUS
ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ',
      lyrics_transliteration = 'CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 1
Yemaymotew mote motn endishr
Alemn wedede bezelalem fiqr
Ersu eyewedeqe egnan anesan
Ersu eyeqosele egnan fewesen

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 2
Yebrhen aynwan nebelbal Dingil Maryam shefnech
Atnagerm siyat’et’ut eyayech
And lije weyew eyalech Dingil azenech
Awnetegnaw ts’ehey sale bemesqel lay

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 3
Ch’ereqam dem honech erqanu endaytay
Kewakbt regefu mutanm tenesu
Asgegni gezhiyachew siseqel nigusu
Yohens libwan degfo kegolgota deresech

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 4
Bets’nu mekera wedqa eyetenesach
And lijwan besst ayech Dingil azenech
Bebrhen fitu miraq tetefabet
YeEgziabher lij ayhud zebetubet

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 5
Yemotnew tenesan yeraqnew qerebn
Yeqeranyo beg legna tesewaln
Deretwan deqta qena alech
Lijwan litayew befqr

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 6
Sidefut siyadafut sit’lut kemdr
Ersu endewenbede eyeteqot’ere
Qidusu tewardo egnan akebere
Kerstachn geban bedemu maeteb

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 7
Kristos ersu new yeereftachn wedeb
Benefswa seyf alefe aleqesech tenseqsqa
Beayhud ch’kane ejgun tesaqa
Beand lijwa ayech seqoqa bemdr wedqa

CHORUS
Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tsehayin-yachelemew-tsehay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ጸሐይን ያጨለመው ጸሀይ
ኤልሻዳይ ስሙ አዶናይ
እጆቹን ለህማም ዘረጋ
ኢየሱስ አልፋና ኦሜጋ

VERSE 1
የማይሞተው ሞተ ሞትን እንዲሽር
አለምን ወደደ በዘላለም ፍቅር
እርሱ እየወደቀ እኛን አነሳን
እርሱ እየቆሰለ እኛን ፈወሰን

VERSE 2
የብርሐን ዐይኗን ነበልባል ድንግል ማርያም ሸፍነች
አትናገርም ሲያጠጡት እያየች
አንድ ልጄ ወየው እያለች ድንግል አዘነች
አውነተኛው ጸሐይ ሳለ በመስቀል ላይ

VERSE 3
ጨረቃም ደም ሆነች እርቃኑ እንዳይታይ
ከዋክብት ረገፉ ሙታንም ተነሱ
አስገኚ ገዢያቸው ሲሰቀል ንጉሱ
ዮሐንስ ልቧን ደግፎ ከጎልጎታ ደረሰች

VERSE 4
በጽኑ መከራ ወድቃ እየተነሳች
አንድ ልጇን በስስት አየች ድንግል አዘነች
በብርሐን ፊቱ ምራቅ ተተፋበት
የእግዚአብሔር ልጅ አይሁድ ዘበቱበት

VERSE 5
የሞትነው ተነሳን የራቅነው ቀረብን
የቀራንዮ በግ ለኛ ተሰዋልን
ደረቷን ደቅታ ቀና አለች
ልጇን ልታየው በፍቅር

VERSE 6
ሲደፉት ሲያዳፉት ሲጥሉት ከምድር
እርሱ እንደወንበዴ እየተቆጠረ
ቅዱሱ ተዋርዶ እኛን አከበረ
ከርስታችን ገባን በደሙ ማዕተብ

VERSE 7
ክርስቶስ እርሱ ነው የእረፍታችን ወደብ
በነፍሷ ሰይፍ አለፈ አለቀሰች ተንሰቅስቃ
በአይሁድ ጭካኔ እጅጉን ተሳቃ
በአንድ ልጇ አየች ሰቆቃ በምድር ወድቃ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ts’eheyn yach’elemew ts’ehey
Elshaday simu adonay
Ejochun lehmam zerega
Iyesus alfana omega

VERSE 1
Yemaymotew mote motn endishr
Alemn wedede bezelalem fiqr
Ersu eyewedeqe egnan anesan
Ersu eyeqosele egnan fewesen

VERSE 2
Yebrhen aynwan nebelbal Dingil Maryam shefnech
Atnagerm siyat’et’ut eyayech
And lije weyew eyalech Dingil azenech
Awnetegnaw ts’ehey sale bemesqel lay

VERSE 3
Ch’ereqam dem honech erqanu endaytay
Kewakbt regefu mutanm tenesu
Asgegni gezhiyachew siseqel nigusu
Yohens libwan degfo kegolgota deresech

VERSE 4
Bets’nu mekera wedqa eyetenesach
And lijwan besst ayech Dingil azenech
Bebrhen fitu miraq tetefabet
YeEgziabher lij ayhud zebetubet

VERSE 5
Yemotnew tenesan yeraqnew qerebn
Yeqeranyo beg legna tesewaln
Deretwan deqta qena alech
Lijwan litayew befqr

VERSE 6
Sidefut siyadafut sit’lut kemdr
Ersu endewenbede eyeteqot’ere
Qidusu tewardo egnan akebere
Kerstachn geban bedemu maeteb

VERSE 7
Kristos ersu new yeereftachn wedeb
Benefswa seyf alefe aleqesech tenseqsqa
Beayhud ch’kane ejgun tesaqa
Beand lijwa ayech seqoqa bemdr wedqa'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tsehayin-yachelemew-tsehay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: TV-DEKIMWO NEBSEY (tv-dekimwo-nebsey)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tv-dekimwo-nebsey'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ደኺምዎ ነብሰይ ፍቅርኻ ልማዱ
ኣብ ውሽጠይ ከለኻ ንግዳም ከማዕዱ
ካብ ቅድሚ ገጽካ ምስ ተፈለኹ ጸልሚቱኒ ኩሉ
ምርሳሕ የእጋረይ ምኽኒት ቖጺረ ማዕጾይ ከይከፍት

VERSE 1
ፍቕሪ ከሲረ ተለመን ጎይታይ በለኒ ይቕረ።
ድምጽኻ ድምጺ ፍትወይ እዃሕኩሐ ማዕጾ
ድቃስ ሓጢያት ደቂሰ ምስ ዘይርጉእ ቀልበይ
ርእስኻ ህቦ ጎተናኻ ጠሊ እናመልኣ ኣብቲ ግዜ ለይቲ

VERSE 2
ኢድካ ሰዲድካ ምስ ከድካ ኻባይ
መፍቶ ጸላኢ ኮይና ሂወተይ
ኣየናይ ኢለዮ ፍቅርኻ ንዓይ
ኣብ ርእሰይ ተወኪለ ብሃውሪ ኪነብር

VERSE 3
ምስትውዓል ዝጎደሎ ሂወተይ ክዝክር
ግርም ይብለኒ ኣንታ ኣምላኸይ
ብዘይ ብኣኻ ክመርሓ ሂወተይ
እተዕርፈሉ ቦታ በይንኻ

VERSE 4
ኣብ ውሽጠይ ከሎ ደገ ደልየካ
ንዓ ተመለስ ናብ ቤት ባርያኻ።
ድሃይ ውሽጠይ ከዳምጺ ቃልካ ዘንጊዐዮ
ጸውጽዋይ ናይ ዓለም ቁምነገር ጌረዮ

VERSE 5
ብክልተ እግረይ ደው እንተ በልኩ
እናመሰለኒ ብርእሰይ ዝቖምኩ
ዝርጉሕ ቅልጽምካ ክድግፈኒ
ተመለስ ደኣ ዳግም ኳሕኩሓኒ

VERSE 6
ብዘይ ፍቕርኻ እንታይ ኣሎኒ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Deኺmwo nebsey fiqrኻ limadu
Ab wisht’ey keleኻ nigdam kemaedu
Kab qidmi gets’ka mis tefeleኹ ts’elmituni kulu
Mirsah yeegarey miኽnit ቖts’ire maets’oy keykeft

VERSE 1
Fiቕri kesire telemen goytay beleni yiቕre.
Dimts’ኻ dimts’i fitwey ekhwahkuhe maets’o
Diqas hat’iyat deqise mis zeyrgue qelbey
Riesኻ hibo gotenaኻ t’eli enamela abti gize leyti

VERSE 2
Idka sedidka mis kedka ኻbay
Mefto ts’elai koyna hiwetey
Ayenay ileyo fiqrኻ niay
Ab riesey tewekile bihawri kinebr

VERSE 3
Mistwal zigodelo hiwetey kizkr
Girm yibleni anta amlaኸy
Bizey biaኻ kimerha hiwetey
Eteerfelu bota beynኻ

VERSE 4
Ab wisht’ey kelo dege delyeka
Nia temeles nab bet baryaኻ.
Dihay wisht’ey kedamts’i qalka zengiayo
Ts’ewts’way nay alem qumneger gereyo

VERSE 5
Biklte egrey dew ente belku
Enameseleni biresey ziቖmku
Zirguh qilts’mka kidgfeni
Temeles dea dagm kwahkuhani

VERSE 6
Bizey fiቕrኻ entay aloni.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tv-dekimwo-nebsey', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: TV: Eyesus Yu Smu (tv-eyesus-yu-smu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 1
ወዲ ድንግል ማርያም ስጋይ ዝለበሰ
ፈራዲ ልዑል ኣምላኽ ክቡር ደሙ ዘፍሰሰ
ንስለ ፍቅሪ ሰብ ብፍቃዱ ዝተፈርደ
መከራ ንኽቕበል ካብ ሰማይ ወረደ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 2
ኢየሱስ ክርስቶስ እግዚአብሔር ባዕሉ
ንስለ ፍቕሪ ''ንድዩ ኣብ መስቀል ዉዒሉ
ዕጣን ንኣምላኽነቱ ወርቂ ንንግስነቱ
ከርበ''ዩ ዝተሓረየሉ ነቲ መሪር ሞቱ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 3
ንዓይኒ ዘገርም ዉዕለቱ ክሓስቦ
ፍቕሩ ይገርመኒ ሞሳ ዘይርከቦ
ኢየሱስ ኣምላኸይ ናይ ነፍሰይ ፈዉሲ
ክርስቶስ ክቡር ኣምላኽ ሓዘነይ ደባሲ

CHORUS
ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ',
      lyrics_transliteration = 'CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 1
Wedi Dingil Maryam sigay zilebese
Feradi liul amlaኽ kibur demu zefsese
Nisle fiqri seb bifqadu ziteferde
Mekera niኽቕbel kab semay werede

CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 2
Iyesus Kristos Egziabher baelu
Nisle fiቕri ''nidyu ab mesqel wuilu
Et’an niamlaኽnetu werqi ningsnetu
Kerbe''yu zitehareyelu neti merir motu

CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 3
Niayni zegerm wueletu kihasbo
Fiቕru yigermeni mosa zeyrkebo
Iyesus amlaኸy nay nefsey fewusi
Kristos kibur amlaኽ hazeney debasi

CHORUS
Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tv-eyesus-yu-smu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰማያዊ ኣምላኸይ ደሙ ዝኸፈለ
መብጽዓ ዉሉዱ ፍጹም ዘይጠለመ
ኢየሱስ''ዩ ስሙ ክርስቶስ''ዩ ስሙ
ኣማኑኤል''ዩ ስሙ መድሓኒ''ዩ ስሙ

VERSE 1
ወዲ ድንግል ማርያም ስጋይ ዝለበሰ
ፈራዲ ልዑል ኣምላኽ ክቡር ደሙ ዘፍሰሰ
ንስለ ፍቅሪ ሰብ ብፍቃዱ ዝተፈርደ
መከራ ንኽቕበል ካብ ሰማይ ወረደ

VERSE 2
ኢየሱስ ክርስቶስ እግዚአብሔር ባዕሉ
ንስለ ፍቕሪ ''ንድዩ ኣብ መስቀል ዉዒሉ
ዕጣን ንኣምላኽነቱ ወርቂ ንንግስነቱ
ከርበ''ዩ ዝተሓረየሉ ነቲ መሪር ሞቱ

VERSE 3
ንዓይኒ ዘገርም ዉዕለቱ ክሓስቦ
ፍቕሩ ይገርመኒ ሞሳ ዘይርከቦ
ኢየሱስ ኣምላኸይ ናይ ነፍሰይ ፈዉሲ
ክርስቶስ ክቡር ኣምላኽ ሓዘነይ ደባሲ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Semayawi amlaኸy demu ziኸfele
Mebts’a wuludu fits’um zeyt’eleme
Iyesus''yu simu Kristos''yu simu
Amanuel''yu simu medhani''yu simu

VERSE 1
Wedi Dingil Maryam sigay zilebese
Feradi liul amlaኽ kibur demu zefsese
Nisle fiqri seb bifqadu ziteferde
Mekera niኽቕbel kab semay werede

VERSE 2
Iyesus Kristos Egziabher baelu
Nisle fiቕri ''nidyu ab mesqel wuilu
Et’an niamlaኽnetu werqi ningsnetu
Kerbe''yu zitehareyelu neti merir motu

VERSE 3
Niayni zegerm wueletu kihasbo
Fiቕru yigermeni mosa zeyrkebo
Iyesus amlaኸy nay nefsey fewusi
Kristos kibur amlaኽ hazeney debasi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tv-eyesus-yu-smu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: TV: KEYARI TARIKEY (tv-keyari-tarikey)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 1
ሊዕሊ ዛ ነብሰይ ዝሓለካለይ
ወዲ ህያው ኣምላክ ቀያሪ ታሪከይ
ካብ መርኮ ሰይጣን ንብዙሕ ዘመናት
ጽድቀይ ናተቆጽረ ቀዳድ ጨርቂ ሪክሰት

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 2
ብተስፋ ኪጽበ ኪርኢ ምድሓነይ
ካብ ሰማይ ወሪድካ ሞይትካዮ ንሞትይ
ንፍቅርካ''ሞ ኪዝምር የ ጌና ማንነተይ ቀይርካዮ ኢካ
ጌታ ለፍቅርህ እዘምራለው ገና ማንኔተ ቀይረሃል አና

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 3
ማእሰርቲ ለጌዎን ምስ ጸኒዓ ነብሰይ
ለይቲ ምስ መዓልቲ መቃብር ኪከውን ስፍራይ
ከመይ ኪርስዖ ''ቲ ዚገበርካለይ
መዝሙር ቀይርካዮ ኢካ ናይ ትማል ኣውያተይ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 4
እቲ ካ ብድፍረት ንቤትካ ከሳዲድ
ኣመንቲ ደቅካ ካብ ቤቶም ኪሳጉግ
ናይ ትማሊ ሳኦል ናይ ሎሚ ግን ፓውሎስ
ሕሩይ ኣቅሓ ጌርካ ሸሙካኒ ክርስቶስ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 5
መን ዩ ዘይፍወስ ንስምካ ጸዊዑ
መንዪ ዝተነጽገ ናባካ ቀሪቡ
መንገዲን ሓቅን ሂወትን ኢካ ንዓይ
ኣብ ፍቃድካ ምንባር ኮይኑሎ ምርጫይ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 6
ጎይታ ታሪክና ቀይሩ ናብ ቤቱ ዪምለሰና

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ',
      lyrics_transliteration = 'CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 1
Lieli za nebsey zihalekaley
Wedi hiyaw amlak qeyari tarikey
Kab merko seyt’an nibzuh zemenat
Ts’dqey nateqots’re qedad ch’erqi rikset

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 2
Bitesfa kits’be kiri midhaney
Kab semay weridka moytkayo nimoty
Nifqrka''mo kizmr ye gena mannetey qeyrkayo ika
Geta lefqrh ezemralew gena mannete qeyrehal ana

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 3
Maeserti legewon mis ts’enia nebsey
Leyti mis mealti meqabr kikewn sifray
Kemey kirso ''ti zigeberkaley
Mezmur qeyrkayo ika nay timal awyatey

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 4
Eti ka bidfret nibetka kesadid
Amenti deqka kab betom kisagug
Nay timali saol nay lomi gin pawlos
Hiruy aqha gerka shemukani Kristos

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 5
Men yu zeyfwes nismka ts’ewiu
Menyi zitenets’ge nabaka qeribu
Mengedin haqn hiwetn ika niay
Ab fiqadka minbar koynulo mirch’ay

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 6
Goyta tarikna qeyru nab betu yimlesena

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tv-keyari-tarikey'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 1
ሊዕሊ ዛ ነብሰይ ዝሓለካለይ
ወዲ ህያው ኣምላክ ቀያሪ ታሪከይ
ካብ መርኮ ሰይጣን ንብዙሕ ዘመናት
ጽድቀይ ናተቆጽረ ቀዳድ ጨርቂ ሪክሰት

VERSE 2
ብተስፋ ኪጽበ ኪርኢ ምድሓነይ
ካብ ሰማይ ወሪድካ ሞይትካዮ ንሞትይ
ንፍቅርካ''ሞ ኪዝምር የ ጌና ማንነተይ ቀይርካዮ ኢካ
ጌታ ለፍቅርህ እዘምራለው ገና ማንኔተ ቀይረሃል አና

VERSE 3
ማእሰርቲ ለጌዎን ምስ ጸኒዓ ነብሰይ
ለይቲ ምስ መዓልቲ መቃብር ኪከውን ስፍራይ
ከመይ ኪርስዖ ''ቲ ዚገበርካለይ
መዝሙር ቀይርካዮ ኢካ ናይ ትማል ኣውያተይ

VERSE 4
እቲ ካ ብድፍረት ንቤትካ ከሳዲድ
ኣመንቲ ደቅካ ካብ ቤቶም ኪሳጉግ
ናይ ትማሊ ሳኦል ናይ ሎሚ ግን ፓውሎስ
ሕሩይ ኣቅሓ ጌርካ ሸሙካኒ ክርስቶስ

VERSE 5
መን ዩ ዘይፍወስ ንስምካ ጸዊዑ
መንዪ ዝተነጽገ ናባካ ቀሪቡ
መንገዲን ሓቅን ሂወትን ኢካ ንዓይ
ኣብ ፍቃድካ ምንባር ኮይኑሎ ምርጫይ

VERSE 6
ጎይታ ታሪክና ቀይሩ ናብ ቤቱ ዪምለሰና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 1
Lieli za nebsey zihalekaley
Wedi hiyaw amlak qeyari tarikey
Kab merko seyt’an nibzuh zemenat
Ts’dqey nateqots’re qedad ch’erqi rikset

VERSE 2
Bitesfa kits’be kiri midhaney
Kab semay weridka moytkayo nimoty
Nifqrka''mo kizmr ye gena mannetey qeyrkayo ika
Geta lefqrh ezemralew gena mannete qeyrehal ana

VERSE 3
Maeserti legewon mis ts’enia nebsey
Leyti mis mealti meqabr kikewn sifray
Kemey kirso ''ti zigeberkaley
Mezmur qeyrkayo ika nay timal awyatey

VERSE 4
Eti ka bidfret nibetka kesadid
Amenti deqka kab betom kisagug
Nay timali saol nay lomi gin pawlos
Hiruy aqha gerka shemukani Kristos

VERSE 5
Men yu zeyfwes nismka ts’ewiu
Menyi zitenets’ge nabaka qeribu
Mengedin haqn hiwetn ika niay
Ab fiqadka minbar koynulo mirch’ay

VERSE 6
Goyta tarikna qeyru nab betu yimlesena'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tv-keyari-tarikey', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: TV: QOLAHTA YEINTU (tv-qolahta-yeintu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 1
ኣዝ
ዊንታ ስጋይ ሓይሉ ቀቲለያ ነብሰይ
ካብ መንገዱ ኣልጊሰ ቀቢረ ሕልናይ
ዓለም መሲሉኒ ትኾነኒ ዑቁባ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 2
ባብ ከምዘይ ኣርሓወት ሕቖኣ''ዶ ሂባ
መን እሞ ቆይሙለይ ኣብታ ሰዓት ጭንቂ
ብዘካ መድሕነይ እቲ ኣምላኽ ሓቂ
ኣዝ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 3
ነገር ስጋ ከይተርፍ ክረኽበኒ ሕሰም
ከናዲ ረዳኢ ተበልኩ ቃሕ ሰም
ዘበት ኣይረከብኩን ሓደካ ዝድግፍ
ኣለኹልኪ ኢሉ ን ስለይ ዚሓለፍ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 4
ንሱ ግን ኔሩኒ ለዋህ እሙን ጓሳ
ነብሱ በጃ ሂቡ ሂወተይ ዘውሕሳ
ኣዝ
ተሰሎንቄ ኔረ ከም ናይ ትማል ዴማስ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 5
ዘሎ መሲሉኒ ''ቲ ዘይነጽፍ ሓጎስ
ዛንታ ጥፉእ ወዲ እንክድገም ኣባይ
''ነኩ ተመሊሰ ኣብ''ታ ቤት ቀደመይ
ለካ ሰናይ የለን ርሒቅካ ካብ ቤቱ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 6
ተቀቢሉኒ አዩ እምበር ብዓይኒ ምሕረቱ
ኣዝ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር',
      lyrics_transliteration = 'CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 1
Az
Winta sigay haylu qetileya nebsey
Kab mengedu algise qebire hilnay
Alem mesiluni tiኾneni uquba

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 2
Bab kemzey arhawet hiቖa''do hiba
Men emo qoymuley abta seat ch’nqi
Bizeka medhney eti amlaኽ haqi
Az

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 3
Neger siga keyterf kireኽbeni hisem
Kenadi redai tebelku qah sem
Zebet ayrekebkun hadeka zidgf
Aleኹlki ilu n siley zihalef

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 4
Nisu gin neruni lewah emun gwasa
Nebsu beja hibu hiwetey zewhsa
Az
Teselonqe nere kem nay timal demas

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 5
Zelo mesiluni ''ti zeynets’f hagos
Zanta t’fue wedi enkdgem abay
''neku temelise ab''ta bet qedemey
Leka senay yelen rihiqka kab betu

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 6
Teqebiluni ayu ember biayni mihretu
Az

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tv-qolahta-yeintu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 1
ኣዝ
ዊንታ ስጋይ ሓይሉ ቀቲለያ ነብሰይ
ካብ መንገዱ ኣልጊሰ ቀቢረ ሕልናይ
ዓለም መሲሉኒ ትኾነኒ ዑቁባ

VERSE 2
ባብ ከምዘይ ኣርሓወት ሕቖኣ''ዶ ሂባ
መን እሞ ቆይሙለይ ኣብታ ሰዓት ጭንቂ
ብዘካ መድሕነይ እቲ ኣምላኽ ሓቂ
ኣዝ

VERSE 3
ነገር ስጋ ከይተርፍ ክረኽበኒ ሕሰም
ከናዲ ረዳኢ ተበልኩ ቃሕ ሰም
ዘበት ኣይረከብኩን ሓደካ ዝድግፍ
ኣለኹልኪ ኢሉ ን ስለይ ዚሓለፍ

VERSE 4
ንሱ ግን ኔሩኒ ለዋህ እሙን ጓሳ
ነብሱ በጃ ሂቡ ሂወተይ ዘውሕሳ
ኣዝ
ተሰሎንቄ ኔረ ከም ናይ ትማል ዴማስ

VERSE 5
ዘሎ መሲሉኒ ''ቲ ዘይነጽፍ ሓጎስ
ዛንታ ጥፉእ ወዲ እንክድገም ኣባይ
''ነኩ ተመሊሰ ኣብ''ታ ቤት ቀደመይ
ለካ ሰናይ የለን ርሒቅካ ካብ ቤቱ

VERSE 6
ተቀቢሉኒ አዩ እምበር ብዓይኒ ምሕረቱ
ኣዝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 1
Az
Winta sigay haylu qetileya nebsey
Kab mengedu algise qebire hilnay
Alem mesiluni tiኾneni uquba

VERSE 2
Bab kemzey arhawet hiቖa''do hiba
Men emo qoymuley abta seat ch’nqi
Bizeka medhney eti amlaኽ haqi
Az

VERSE 3
Neger siga keyterf kireኽbeni hisem
Kenadi redai tebelku qah sem
Zebet ayrekebkun hadeka zidgf
Aleኹlki ilu n siley zihalef

VERSE 4
Nisu gin neruni lewah emun gwasa
Nebsu beja hibu hiwetey zewhsa
Az
Teselonqe nere kem nay timal demas

VERSE 5
Zelo mesiluni ''ti zeynets’f hagos
Zanta t’fue wedi enkdgem abay
''neku temelise ab''ta bet qedemey
Leka senay yelen rihiqka kab betu

VERSE 6
Teqebiluni ayu ember biayni mihretu
Az'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tv-qolahta-yeintu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: TV: Way Zema/ : Filmon Yebyo: Orthodox Tewahdo Mezmur orthodox tewahdo (tv-way-zema-filmon-yebyo-orthodox-tewahdo-mezmur-orthodox-tewahdo)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'tv-way-zema-filmon-yebyo-orthodox-tewahdo-mezmur-orthodox-tewahdo'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስብሃት ወውዳሴ ለዘብህለ ዋይዜማ
ዘሰማዕኩ ኣንሰ ዘሰማይ ዘራማ
በኣይቴ ናልዕል ወናስተማስል ሰላሞ
ለካህን ያሬድ እንተ ይጥዕም ስሞ

VERSE 1
ፊደላት ተቆጺሮም እንተፈለመ ምህሮ
ዓመታት እንክከይድ ክኸንብ ኣእምሮ
መን''ዶ ኔሩካ''ዩ ቲ''ሸውዓተ ዓመት
ብዘይካ''ቲ ጻጸ ናይ ኣንክሮ ፍጥረት

VERSE 2
ጸራጊ መንገዲ ፍኖት ቅዱስ ዓወት
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

VERSE 3
ምስጢር ሰለስትነት ናይ ዜማካ ራእይ
ግእዝ ዝፈለሞ እዝሊ ምስ ዓራራይ
ውሓዚ ቃናታቱ ሕይወትና ዝልውጥ
ብደመና ሰማይ ሰማይት ዝምስጥ

VERSE 4
ምስቶም መላእክቲ ብሓጎስ ዘቀምጥ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

VERSE 5
ኣለዎ እንዶ ምልክት ናይ ምስጋና ስልቲ
ብዓቅሚ ሰብ ዘይብጻሕ ቋንቋ መላእክቲ
ኣየናይ ኣእምሮ እዩ መርሚሩ ዝፈሊ
ግብሪ መንፈስ ቅዱስ ገሊጹ ዘለሊ

VERSE 6
ተዘይከሲትሉ እቲ ኩሉ ከኣሊ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ

VERSE 7
ክዱስ ሃሪ ብርሃን ዘንጸባርቅ ልብስኻ
ብመንፈስ ክትዝምም በቲ ናውትኻ
ሻቡ ሕልናኻ ተሰቂሉ ሰማይ
ጸናጽል ኣሰንዩ ኣርያማዊ ግናይ

VERSE 8
ዘልዓለም ዘዕቁብ ኣብ መንበር ኣዶናይ
ኣማን ብኣማን ማህሌታዊ
ያሬድ ዜማከ ሰማያዊ
ያሬድ ዜማከ ኣርያማዊ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sibhat wewdase lezebhle wayzema
Zesemaeku anse zesemay zerama
Beayte nalel wenastemasl selamo
Lekahn yared ente yit’em simo

VERSE 1
Fidelat teqots’irom entefeleme mihro
Ametat enkkeyd kiኸnb aemro
Men''do neruka''yu ti''shewate amet
Bizeyka''ti ts’ats’e nay ankro fit’ret

VERSE 2
Ts’eragi mengedi finot Kidus awet
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

VERSE 3
Mist’ir selestnet nay zemaka raey
Giez zifelemo ezli mis araray
Wihazi qanatatu hiywetna zilwt’
Bidemena semay semayt zimst’

VERSE 4
Mistom melaekti bihagos zeqemt’
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

VERSE 5
Alewo endo milkt nay misgana silti
Biaqmi seb zeybts’ah qwanqwa melaekti
Ayenay aemro eyu mermiru zifeli
Gibri menfes Kidus gelits’u zeleli

VERSE 6
Tezeykesitlu eti kulu keali
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi

VERSE 7
Kidus hari birhan zents’ebarq libsኻ
Bimenfes kitzmm beti nawtኻ
Shabu hilnaኻ teseqilu semay
Ts’enats’l asenyu aryamawi ginay

VERSE 8
Zelalem zeequb ab menber adonay
Aman biaman mahletawi
Yared zemake semayawi
Yared zemake aryamawi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'tv-way-zema-filmon-yebyo-orthodox-tewahdo-mezmur-orthodox-tewahdo', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Undeserving I Am (undeserving-i-am)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn',
      lyrics_english = 'CHORUS
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
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'undeserving-i-am'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn'
    AND lyrics_english IS NOT DISTINCT FROM 'Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 1
Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn/x2/

VERSE 2
You’ve given me all that I have so faithfully
Though you loved me I left so carelessly
Despite my sins you wait for me so patiently
Your blessing pours  into my life so endlessly

VERSE 3
I have received your precious gifts in abundance
I cannot try to count they’re limitless
In my defeat and my weakness You hear my plea
Through your mercy your grace abounds and sustains me

VERSE 4
You give your love with such passion and sacrifice
To save your flock from death you paid the price
What can we say we can''t repay our King and Lord
From shamefulness you saved us God our lives restored

VERSE 5
Undeserving I am Undeserving
Of your ultimate love You are giving
A love that is always everlasting

VERSE 6
Saygebagn Amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn/x2/'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'undeserving-i-am', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Until My Time Comes (until-my-time-comes)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 1
My hope, my supporter please don’t abandon me
My lord, don’t leave me, preserve me from hell

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 2
Merciful, forgiving, may your mercy visit me
Preserve me from sin, may your grace rescue me
My savior, my healer, please send us peace
With your endless love, lead to me righteousness

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 3
Lord, have mercy on me
I''m troubled, give me your peace
Keep me guarded, protect me from evil
Show me the righteous trail

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 4
Although I am sinful, my sins aggravating
With your holy flesh and blood, wash from my doing
I will come to you, please shelter my soul
Let my soul rest with you, grant me salvation

CHORUS
Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'until-my-time-comes'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'Until my time comes, til I come to thee
Guide me to repent, my Lord, almighty
My light, my medicine, my hope, return me back
Forget my sins my lord, give your forgiveness

VERSE 1
My hope, my supporter please don’t abandon me
My lord, don’t leave me, preserve me from hell

VERSE 2
Merciful, forgiving, may your mercy visit me
Preserve me from sin, may your grace rescue me
My savior, my healer, please send us peace
With your endless love, lead to me righteousness

VERSE 3
Lord, have mercy on me
I''m troubled, give me your peace
Keep me guarded, protect me from evil
Show me the righteous trail

VERSE 4
Although I am sinful, my sins aggravating
With your holy flesh and blood, wash from my doing
I will come to you, please shelter my soul
Let my soul rest with you, grant me salvation'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'until-my-time-comes', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Walk in the Light of God (walk-in-the-light-of-god)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
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
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'walk-in-the-light-of-god'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'Walk in the light of God(2)
Embrace the love and the hope be brought
Walk in the light of God(2)

VERSE 1
In the shadows of the almighty God
In the peaceful springs we will rest upon
For the creator of our peace and love
Let us run to him to our savior God

VERSE 2
He who held judgment and forgiveness
The lord of peace is our Jesus Christ
He who gave us life by the Holy cross
He defeated dark and opened our eyes

VERSE 3
The thoughts of fear or the darkness nights
Will flea from us if we plea tonight
Sins harmful sharp flying through the day
His peaceful words will save you come pray

VERSE 4
Don’t let yourself down you can stumble on
Be courageous brave when times get hard
Banning every curse every tragic thought
He will protect you the almighty God

VERSE 5
He who knows his name or the life he brings
They will rise above all powers of grace
A long full life in the light of God
Forever adorned they will be with love

VERSE 6
O, dear Lord our hope and peace
You fed us from the heavens of Eade
Proving us delight when you redeem our souls
A God like you cannot be replaced'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'walk-in-the-light-of-god', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: We Believe (we-believe)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Enamenalen beAb
Enamenalen beWeld
Enamenalen beMenfes Qidus',
      lyrics_english = 'CHORUS
We believe in the father and
We believe in the son(2)

VERSE 1
We also believe(4) we believe in the holy spirit

CHORUS
We believe in the father and
We believe in the son(2)',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'we-believe'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Enamenalen beAb
Enamenalen beWeld
Enamenalen beMenfes Qidus'
    AND lyrics_english IS NOT DISTINCT FROM 'We believe in the father and
We believe in the son(2)

VERSE 1
We also believe(4) we believe in the holy spirit'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'we-believe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: We Offer You Glory and Praise (we-offer-you-glory-and-praise)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ምስጋናን እናቀርባለን
ስምህን እየጠራን
በቅዳሴው ጸሎት ቆመን በአንድነት
እንደ አገልጋዮችህ እንደ መላእክት

VERSE 1
ምስጋናን እናቀርባለን
ስምህን እየጠራን
በቅዳሴው ጸሎት ቆመን በአንድነት
እንደ አገልጋዮችህ እንደ መላእክት

CHORUS
ምስጋናን እናቀርባለን
ስምህን እየጠራን
በቅዳሴው ጸሎት ቆመን በአንድነት
እንደ አገልጋዮችህ እንደ መላእክት

VERSE 2
ምስጋናን እናቀርባለን
ስምህን እየጠራን
በቅዳሴው ጸሎት ቆመን በአንድነት
እንደ አገልጋዮችህ እንደ መላእክት

CHORUS
ምስጋናን እናቀርባለን
ስምህን እየጠራን
በቅዳሴው ጸሎት ቆመን በአንድነት
እንደ አገልጋዮችህ እንደ መላእክት',
      lyrics_transliteration = 'CHORUS
Misgana enakerbalen
Simihn eyetiran

VERSE 1
Beqidasie tsilot qomen beandinet

CHORUS
Misgana enakerbalen
Simihn eyetiran

VERSE 2
Ende agelgayochih ende melaekt

CHORUS
Misgana enakerbalen
Simihn eyetiran',
      lyrics_english = 'CHORUS
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 1
You took the beatings willingly
On the cross endured patiently
Redeemed by Your atoning death
We’ll proclaim until our last breath

CHORUS
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 2
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

CHORUS
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 3
Using His strength and might alone
He left without moving the stone
Resurrected on the third day
To the ends of the Earth we’ll say

CHORUS
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 4
Our Lord rose high with songs of praise
Ascended after forty days
Accomplished His earthly purpose
At His father’s side now He sits

CHORUS
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 5
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

CHORUS
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 6
The price paid for humanity
You awoke us with a decree
Your return the second coming
Without doubt this we do believe

CHORUS
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 7
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

CHORUS
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'we-offer-you-glory-and-praise'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ምስጋናን እናቀርባለን
ስምህን እየጠራን
በቅዳሴው ጸሎት ቆመን በአንድነት
እንደ አገልጋዮችህ እንደ መላእክት

VERSE 1
ምስጋናን እናቀርባለን
ስምህን እየጠራን
በቅዳሴው ጸሎት ቆመን በአንድነት
እንደ አገልጋዮችህ እንደ መላእክት

VERSE 2
ምስጋናን እናቀርባለን
ስምህን እየጠራን
በቅዳሴው ጸሎት ቆመን በአንድነት
እንደ አገልጋዮችህ እንደ መላእክት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Misgana enakerbalen
Simihn eyetiran

VERSE 1
Beqidasie tsilot qomen beandinet

VERSE 2
Ende agelgayochih ende melaekt'
    AND lyrics_english IS NOT DISTINCT FROM 'We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 1
You took the beatings willingly
On the cross endured patiently
Redeemed by Your atoning death
We’ll proclaim until our last breath

VERSE 2
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 3
Using His strength and might alone
He left without moving the stone
Resurrected on the third day
To the ends of the Earth we’ll say

VERSE 4
Our Lord rose high with songs of praise
Ascended after forty days
Accomplished His earthly purpose
At His father’s side now He sits

VERSE 5
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine

VERSE 6
The price paid for humanity
You awoke us with a decree
Your return the second coming
Without doubt this we do believe

VERSE 7
We offer You glory and praise
While calling upon Your name
During the liturgy standing unified
Like the holy angels serving the Divine'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'we-offer-you-glory-and-praise', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: webet nesh moged simetagn zemari deacon dawit tilahun (webet-nesh-moged-simetagn-zemari-deacon-dawit-tilahun)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 1
አጎንብሻለሁኝ አፈሬ በለምፄ/2/
ወልቋል ከራሴ ላይ የብርሃን ልብሴ
ሃብቴ አንቺ ብቻ ነሽ ያለሽኝ ሞገሴ/2/
❴አዝ❵

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 2
ለአምላኬ የማቀርበው አጣሁ በጎ ስራ
ነፍሴ ተጨነቀች በምግባሬ መርራ/2/
ጥላሸቱ በዝቶ ተዳፍኖኗል ጎጆዬ
ብርሃን የለውም ካልበራ ሻማዬ/2/

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 3
❴አዝ❵
የምታመንበት አንዳች ነገር የለኝ
በነፍስም በስጋ ሁሉ የጎደለኝ/2/
እጠባበቃለሁ የእጅሽን በረከት

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 4
እቤቴ ላይ አርፎ እስክባረክበት/2/
❴አዝ❵
የጓዳዬ ክብር የቅጥሬ ድምቀት ነሽ
ዓይኔን የምትሞይው በመቅረዜ በርተሽ/2/

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 5
የፅልመት ጭላንጭል ጠፍቷል የለም ዛሬ
የብርሃን እናት ስላለች በበሬ/2/
❴አዝ❵

CHORUS
ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ',
      lyrics_transliteration = 'CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 1
Agonbshalehugn afere belemts’e (2)
Welqwal kerase lay yebrhan libse
Habte anchi bicha nesh yaleshgn mogese (2)
❴az❵

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 2
Leamlake yemaqerbew at’ahu bego sira
Nefse tech’eneqech bemgbare merra (2)
T’lashetu bezto tedafnonwal gojoye
Birhan yelewm kalbera shamaye (2)

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 3
❴az❵
Yemtamenbet andach neger yelegn
Benefsm besga hulu yegodelegn (2)
Et’ebabeqalehu yeejshn bereket

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 4
Ebete lay arfo eskbarekbet (2)
❴az❵
Yegwadaye kibir yeqt’re dimqet nesh
Aynen yemtmoyw bemeqreze bertesh (2)

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 5
Yets’lmet ch’lanch’l t’eftwal yelem zare
Yebrhan enat silalech bebere (2)
❴az❵

CHORUS
Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'webet-nesh-moged-simetagn-zemari-deacon-dawit-tilahun'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ውበት ነሽ
ውበት ነሽ ለቤቴ ለኑሮዬ ፋና
ድንግል ሆይ አትለይኝ ብቻዬን ነኝና
በሃዘን ጠቋቁራ ተከፍታለች ገፄ

VERSE 1
አጎንብሻለሁኝ አፈሬ በለምፄ/2/
ወልቋል ከራሴ ላይ የብርሃን ልብሴ
ሃብቴ አንቺ ብቻ ነሽ ያለሽኝ ሞገሴ/2/
❴አዝ❵

VERSE 2
ለአምላኬ የማቀርበው አጣሁ በጎ ስራ
ነፍሴ ተጨነቀች በምግባሬ መርራ/2/
ጥላሸቱ በዝቶ ተዳፍኖኗል ጎጆዬ
ብርሃን የለውም ካልበራ ሻማዬ/2/

VERSE 3
❴አዝ❵
የምታመንበት አንዳች ነገር የለኝ
በነፍስም በስጋ ሁሉ የጎደለኝ/2/
እጠባበቃለሁ የእጅሽን በረከት

VERSE 4
እቤቴ ላይ አርፎ እስክባረክበት/2/
❴አዝ❵
የጓዳዬ ክብር የቅጥሬ ድምቀት ነሽ
ዓይኔን የምትሞይው በመቅረዜ በርተሽ/2/

VERSE 5
የፅልመት ጭላንጭል ጠፍቷል የለም ዛሬ
የብርሃን እናት ስላለች በበሬ/2/
❴አዝ❵'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wibet nesh
Wibet nesh lebete lenuroye fana
Dingil hoy atleygn bichayen negnna
Behazen t’eqwaqura tekeftalech gets’e

VERSE 1
Agonbshalehugn afere belemts’e (2)
Welqwal kerase lay yebrhan libse
Habte anchi bicha nesh yaleshgn mogese (2)
❴az❵

VERSE 2
Leamlake yemaqerbew at’ahu bego sira
Nefse tech’eneqech bemgbare merra (2)
T’lashetu bezto tedafnonwal gojoye
Birhan yelewm kalbera shamaye (2)

VERSE 3
❴az❵
Yemtamenbet andach neger yelegn
Benefsm besga hulu yegodelegn (2)
Et’ebabeqalehu yeejshn bereket

VERSE 4
Ebete lay arfo eskbarekbet (2)
❴az❵
Yegwadaye kibir yeqt’re dimqet nesh
Aynen yemtmoyw bemeqreze bertesh (2)

VERSE 5
Yets’lmet ch’lanch’l t’eftwal yelem zare
Yebrhan enat silalech bebere (2)
❴az❵'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'webet-nesh-moged-simetagn-zemari-deacon-dawit-tilahun', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Wedanichi Yemetaw (wedanichi-yemetaw)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
በአንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሄዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባህሪሽን ባህሪ አድርጎት
ለፍጥረታት ጌታ መዓዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 3
በጥቂቱ አደገ ተልኮና ታ
ከድንግልና ጋር አንድ የሆነ ሀሊብ
በሩካቤ ሳይሆን በብስራት እንደ ንብ
ከሆድ መጥበብ ጋራ የመለኮት ስፋት

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 4
እንቺ ሆነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ህሊና የማይመረመር
እፁብ ነው ድንቅ ነው የመጽነሷ ነገር
እሳት ወነበልባል በሆድሽ ውስጥ ሲያድር

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር
መዝሙር
የሊቀ መዘምራንይልማ ኃይሉ

CHORUS
✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ',
      lyrics_transliteration = 'CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 1
Beanchi tefets’eme yesew lijoch desta
Bedeyn yetet’alech hewan tedesetech
Yedesta mefleqiya anchin silagegnech
Yebereket fire kanchi tegegneln

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 2
Yeweyn bota nesh Dingil enatachn
Weldm bahrishn bahri adrgot
Left’retat Geta meazash tesmamtot
Kanchi yiweled zend fits’um lilalaksh

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 3
Bet’qitu adege telkona ta
Kednglna gar and yehone helib
Berukabe sayhon bebsrat ende nib
Kehod met’beb gara yemelekot sifat

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 4
Enchi honesh sale tanashwa mushrit
Beft’ur hilina yemaymeremer
Ets’ub new dinq new yemets’neswa neger
Esat wenebelbal behodsh wist’ siyadr

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 5
Nede nebelbalu alfejeshm neber
Mezmur
Yeliqe mezemranylma haylu

CHORUS
✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wedanichi-yemetaw'
    AND lyrics_amharic IS NOT DISTINCT FROM '✞ ወዳንቺ የመጣው ✞
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
በአንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሄዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባህሪሽን ባህሪ አድርጎት
ለፍጥረታት ጌታ መዓዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

VERSE 3
በጥቂቱ አደገ ተልኮና ታ
ከድንግልና ጋር አንድ የሆነ ሀሊብ
በሩካቤ ሳይሆን በብስራት እንደ ንብ
ከሆድ መጥበብ ጋራ የመለኮት ስፋት

VERSE 4
እንቺ ሆነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ህሊና የማይመረመር
እፁብ ነው ድንቅ ነው የመጽነሷ ነገር
እሳት ወነበልባል በሆድሽ ውስጥ ሲያድር

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር
መዝሙር
የሊቀ መዘምራንይልማ ኃይሉ'
    AND lyrics_transliteration IS NOT DISTINCT FROM '✞ wedanchi yemet’aw ✞
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 1
Beanchi tefets’eme yesew lijoch desta
Bedeyn yetet’alech hewan tedesetech
Yedesta mefleqiya anchin silagegnech
Yebereket fire kanchi tegegneln

VERSE 2
Yeweyn bota nesh Dingil enatachn
Weldm bahrishn bahri adrgot
Left’retat Geta meazash tesmamtot
Kanchi yiweled zend fits’um lilalaksh

VERSE 3
Bet’qitu adege telkona ta
Kednglna gar and yehone helib
Berukabe sayhon bebsrat ende nib
Kehod met’beb gara yemelekot sifat

VERSE 4
Enchi honesh sale tanashwa mushrit
Beft’ur hilina yemaymeremer
Ets’ub new dinq new yemets’neswa neger
Esat wenebelbal behodsh wist’ siyadr

VERSE 5
Nede nebelbalu alfejeshm neber
Mezmur
Yeliqe mezemranylma haylu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wedanichi-yemetaw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Wedase Maryam (wedase-maryam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 1
ውዳሴ ማርያም በሰርክ ጸሎት ላይ ውዳሴ ማርያም ዜማ ስናደርስ
›› ድንግል ትመጣለች ›› በቤተ መቅደስ
›› የብርሃን ምንጣፍ ›› ከፊቷ ተነጥፏል
›› ቅዱስ ኤፍሬም ታጥቆ ›› ያመሰግናታል

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 2
ውዳሴ ማርያም አባ ህርያቆስ ውዳሴ ማርያም ምስጋና ያደርሳል
›› የቅዳሴው ዜማ ›› ልብን ይመስጣል
›› በጎ ነገር ልቤ ›› አወጣ አያለ
›› ዳዊት በገናውን ›› እየደረደረ

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 3
ውዳሴ ማርያም የንጽህናችን ውዳሴ ማርያም መሰረት ነሽና
›› አንቺን ለማመስገን ›› ልቦናዬ ይጽና
›› ተፈስሒ ድንግል ›› ኦ ቤተልሔም
›› ካንቺ ተወለደ ›› መድሃኒዓለም

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 4
ውዳሴ ማርያም ቅድሳት ሁሉ ውዳሴ ማርያም ዙሪያስን ከበዋል
›› አባ ጊዮርጊስም ›› ንኢ ድንግል ይላል
›› በወርቅ ዙፋን ላይ ›› ተቀምጠሽ ሳይሽ
›› ልቤ ተሰወረ ›› ድንግል በግርማሽ

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ',
      lyrics_transliteration = 'CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 1
Wedase Maryam beserk tselot lay wedase Maryam zema sinaders
›› Dingil timetaletch ›› bete meqdes
›› Ye birhan mint’af ›› kefitwa tenet’fwal
›› Kidus Efrem tat’ko ›› yamesegnatal

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 2
Wedase Maryam Aba Hiryaqos wedase Maryam misgana yadersal
›› Ye kidasew zema ›› libn yimest’al
›› Bego neger libe ›› aweta ayale
›› Dawit begnawn ›› eyederedere

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 3
Wedase Maryam ye nits’ihnatchin wedase Maryam meseret neshna
›› Anchin lememesgen ›› libonaye yits’na
›› Tefes’hi dingil ›› o Betlehem
›› Kanchi teweledé ›› Medhanealem

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 4
Wedase Maryam kidusat hulu wedase Maryam zuriyasin kebewal
›› Aba Giyorgis ›› ni’i dingil yilal
›› Beworq zufan lay ›› teqemtesh sayish
›› Libe tesewere ›› dingil begirmash

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wedase-maryam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 1
ውዳሴ ማርያም በሰርክ ጸሎት ላይ ውዳሴ ማርያም ዜማ ስናደርስ
›› ድንግል ትመጣለች ›› በቤተ መቅደስ
›› የብርሃን ምንጣፍ ›› ከፊቷ ተነጥፏል
›› ቅዱስ ኤፍሬም ታጥቆ ›› ያመሰግናታል

VERSE 2
ውዳሴ ማርያም አባ ህርያቆስ ውዳሴ ማርያም ምስጋና ያደርሳል
›› የቅዳሴው ዜማ ›› ልብን ይመስጣል
›› በጎ ነገር ልቤ ›› አወጣ አያለ
›› ዳዊት በገናውን ›› እየደረደረ

VERSE 3
ውዳሴ ማርያም የንጽህናችን ውዳሴ ማርያም መሰረት ነሽና
›› አንቺን ለማመስገን ›› ልቦናዬ ይጽና
›› ተፈስሒ ድንግል ›› ኦ ቤተልሔም
›› ካንቺ ተወለደ ›› መድሃኒዓለም

VERSE 4
ውዳሴ ማርያም ቅድሳት ሁሉ ውዳሴ ማርያም ዙሪያስን ከበዋል
›› አባ ጊዮርጊስም ›› ንኢ ድንግል ይላል
›› በወርቅ ዙፋን ላይ ›› ተቀምጠሽ ሳይሽ
›› ልቤ ተሰወረ ›› ድንግል በግርማሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 1
Wedase Maryam beserk tselot lay wedase Maryam zema sinaders
›› Dingil timetaletch ›› bete meqdes
›› Ye birhan mint’af ›› kefitwa tenet’fwal
›› Kidus Efrem tat’ko ›› yamesegnatal

VERSE 2
Wedase Maryam Aba Hiryaqos wedase Maryam misgana yadersal
›› Ye kidasew zema ›› libn yimest’al
›› Bego neger libe ›› aweta ayale
›› Dawit begnawn ›› eyederedere

VERSE 3
Wedase Maryam ye nits’ihnatchin wedase Maryam meseret neshna
›› Anchin lememesgen ›› libonaye yits’na
›› Tefes’hi dingil ›› o Betlehem
›› Kanchi teweledé ›› Medhanealem

VERSE 4
Wedase Maryam kidusat hulu wedase Maryam zuriyasin kebewal
›› Aba Giyorgis ›› ni’i dingil yilal
›› Beworq zufan lay ›› teqemtesh sayish
›› Libe tesewere ›› dingil begirmash'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wedase-maryam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: wede hiywet menged (wede-hiywet-menged)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wede-hiywet-menged'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ወደ ሕይወት መንገድ ይመራኛል ጌታ ፪
በጨለማው መንገድ እንዳ ንገላታ ፪
ፈጣሪዬ ብቻ ነው
ሕይወቴና ክብሬ

VERSE 1
በእርሱ ደስ ይለኛል
ሳቀርብ ዘማሬ ፪
ጉልበት ሁሉ ላንተ
በፍርሃት ይሰግዳል

VERSE 2
ጉልበት ሁሉ ላንተ
በፍራሃት ይሰግዳል
ምሕረትን አድለኝ
ፈጣሪ ቸል አትበል ፪'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wede hiywet menged yimeragnal Geta 2
Bech’elemaw menged enda nigelata 2
Fet’ariye bicha new
Hiywetena kibre

VERSE 1
Beersu des yilegnal
Saqerb zemare 2
Gulbet hulu lante
Befrhat yisegdal

VERSE 2
Gulbet hulu lante
Befrahat yisegdal
Mihretn adlegn
Fet’ari chel atbel 2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wede-hiywet-menged', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Wede Misraq Eyu (wede-misraq-eyu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 1
ወገኖች ተነሱ እናታችን መጣች
ስሟን ስንጠራ መቼ ትቀራለች
የተከዘን ልታጽናና ነይ ስንላት ትመጣለችና

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 2
የጽጌው ማኅሌት በጸሎት ሲጀመር
ማርያም ትመጣለች በደመና በአየር
ንዒ ስንል በሰዓታት
ልትባርከን ትመጣለች በእውነት

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 3
ፍልሰታ ሲጀመር ቃልኪዳን ገብታለች
የሌሊት ውዳሴ ንዒን ትሰማለች
ህፃናቱን በበረከት
ልትጎበኘን ትመጣለች በእውነት

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 4
በፍጹም ቸርነት እንዲምረን ጌታ
በአማላጅነትሽ ሁኝልን መከታ
እናታችን አለኝታችን
እንድናለን ድንግል አንቺን ይዘን

CHORUS
ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)',
      lyrics_transliteration = 'CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 1
Wegenoch tenesu enatachen metach
Seman sint’era meche tik’eralach
Yetekezen letatsnana ney sinlat timetalachna

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 2
Yetsigew mahlet bets’elot sijemer
Maryam timetalach bedemena beayer
Ni sinl kesa’at
Letebarken timetalach beewnet

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 3
Fils’eta sijemer kal kidan gebtalach
Yelelit wudase ni tisemalach
Hits’anatun bereket
Letgobenyan timetalach beewnet

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 4
Befitsum cherinet endimren geta
Beamalaajinetish hunyln meketa
Enatachen alenytachen
Endinalen dingil anchin yizen

CHORUS
Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wede-misraq-eyu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ወደ ምስራቅ እዩ ወደ ፀሀይ መውጫ
ድንግልን ክበቧት እንበል ሃሌሉያ
ለአምላክ እናት ለአዛኚት
እልል እንበል እንዘምርላት (፪)

VERSE 1
ወገኖች ተነሱ እናታችን መጣች
ስሟን ስንጠራ መቼ ትቀራለች
የተከዘን ልታጽናና ነይ ስንላት ትመጣለችና

VERSE 2
የጽጌው ማኅሌት በጸሎት ሲጀመር
ማርያም ትመጣለች በደመና በአየር
ንዒ ስንል በሰዓታት
ልትባርከን ትመጣለች በእውነት

VERSE 3
ፍልሰታ ሲጀመር ቃልኪዳን ገብታለች
የሌሊት ውዳሴ ንዒን ትሰማለች
ህፃናቱን በበረከት
ልትጎበኘን ትመጣለች በእውነት

VERSE 4
በፍጹም ቸርነት እንዲምረን ጌታ
በአማላጅነትሽ ሁኝልን መከታ
እናታችን አለኝታችን
እንድናለን ድንግል አንቺን ይዘን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wede misraq eyu wede tsehay mewcha
Dingilin kibebwat enbel haleluyah
Leamlak enat leazanīt
Ellil enbel enzemerlat (2)

VERSE 1
Wegenoch tenesu enatachen metach
Seman sint’era meche tik’eralach
Yetekezen letatsnana ney sinlat timetalachna

VERSE 2
Yetsigew mahlet bets’elot sijemer
Maryam timetalach bedemena beayer
Ni sinl kesa’at
Letebarken timetalach beewnet

VERSE 3
Fils’eta sijemer kal kidan gebtalach
Yelelit wudase ni tisemalach
Hits’anatun bereket
Letgobenyan timetalach beewnet

VERSE 4
Befitsum cherinet endimren geta
Beamalaajinetish hunyln meketa
Enatachen alenytachen
Endinalen dingil anchin yizen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wede-misraq-eyu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: wedseni byign by zemari Deacon Begna Girma (wedseni-byign-by-zemari-deacon-begna-girma)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 1
ጰጦስ የተበለች ዕፅ ያልተቃጠለለች ቁጥቋጦ
ጨለማች ተገፈፈ ብርሃን ባንቺ ተገልጦ
የእግዚአብሔር መዝገብ ነሽና ስላንቺ ብዙ እንላለን
ታናሽ ደመና ተወልደሽ ዝናብን የወለድሽልን

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 2
ሙዳዬ መና ድንግል ጠገብን በፋሲካው
ምግብ ነው ልጅሽ ኢየሱስ በእምነት ለሚበላው
ሠርግ ቤት እንልሻለን መፍሰሻ የፍቅር የደስታ
ማርያም ጣፋኝ ከመ ማር የተወደደች በጌታ

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 3
ከንፈሬን እሳት ሲነካው የመንፈስ ቅዱስ ጉጠት
ከኤፍሬም ሃገር ደርሼ እላላሁ ድንግል ብፅዕት
ወደኔ ትመጭ ዘንድ ማን ሆኜ ምድነው ቤቴ?
ፅንስ ያዘልላል ስላምታሽ ሞጉስሽ የእመቤቴ

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ',
      lyrics_transliteration = 'CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 1
P’et’os yetebelech ets’ yalteqat’elelech qut’qwat’o
Ch’elemach tegefefe birhan banchi tegelt’o
YeEgziabher mezgeb neshna silanchi bizu enlalen
Tanash demena teweldesh zinabn yeweledshln

CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 2
Mudaye mena Dingil t’egebn befasikaw
Migb new lijsh Iyesus beemnet lemibelaw
Serg bet enlshalen mefsesha yefqr yedesta
Maryam t’afagn keme mar yetewededech begeta

CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 3
Kenferen esat sinekaw yemenfes Kidus gut’et
Keefrem hager dershe elalahu Dingil bits’et
Wedene timech’ zend man hogne midnew bete?
Ts’ns yazellal silamtash mogussh yeemebete

CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wedseni-byign-by-zemari-deacon-begna-girma'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 1
ጰጦስ የተበለች ዕፅ ያልተቃጠለለች ቁጥቋጦ
ጨለማች ተገፈፈ ብርሃን ባንቺ ተገልጦ
የእግዚአብሔር መዝገብ ነሽና ስላንቺ ብዙ እንላለን
ታናሽ ደመና ተወልደሽ ዝናብን የወለድሽልን

VERSE 2
ሙዳዬ መና ድንግል ጠገብን በፋሲካው
ምግብ ነው ልጅሽ ኢየሱስ በእምነት ለሚበላው
ሠርግ ቤት እንልሻለን መፍሰሻ የፍቅር የደስታ
ማርያም ጣፋኝ ከመ ማር የተወደደች በጌታ

VERSE 3
ከንፈሬን እሳት ሲነካው የመንፈስ ቅዱስ ጉጠት
ከኤፍሬም ሃገር ደርሼ እላላሁ ድንግል ብፅዕት
ወደኔ ትመጭ ዘንድ ማን ሆኜ ምድነው ቤቴ?
ፅንስ ያዘልላል ስላምታሽ ሞጉስሽ የእመቤቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 1
P’et’os yetebelech ets’ yalteqat’elelech qut’qwat’o
Ch’elemach tegefefe birhan banchi tegelt’o
YeEgziabher mezgeb neshna silanchi bizu enlalen
Tanash demena teweldesh zinabn yeweledshln

VERSE 2
Mudaye mena Dingil t’egebn befasikaw
Migb new lijsh Iyesus beemnet lemibelaw
Serg bet enlshalen mefsesha yefqr yedesta
Maryam t’afagn keme mar yetewededech begeta

VERSE 3
Kenferen esat sinekaw yemenfes Kidus gut’et
Keefrem hager dershe elalahu Dingil bits’et
Wedene timech’ zend man hogne midnew bete?
Ts’ns yazellal silamtash mogussh yeemebete'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wedseni-byign-by-zemari-deacon-begna-girma', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Welden Fikir Sabew (welden-fikir-sabew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 1
የሱን ለኛ የኛን ለእርሱ
ክብር ይሁን ለንጉሱ(2)
ጻድቅ ፈራጅ ድንቅ ዳኛ
ክብሩን ጥሎ ግርግም ተኛ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 2
ሳይጎልበት ሆነ ባዶ
በፍጹም ፍቅር እኛን ወዶ (2)
ሁለተኛው አዳም መጣ
የማይጠልቀው ጸሀይ ወጣ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 3
የዲያብሎስ ስራ ፈርሷል
መንጋው ሁሉ ጽድቅን ለብሷል(2)
ስለ ሁሉ አንዱ ሞተ
እንድንለብስ ተራቆተ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 4
በከፈለው የደም ዋጋ
አዲስ ሆንን ባለፀጋ(2)

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ',
      lyrics_transliteration = 'CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 1
Yesun legna yegnan leersu
Kibir yihun lengusu (2)
Ts’adq feraj dinq dagna
Kibrun t’lo girgm tegna

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 2
Saygolbet hone bado
Befts’um fiqr egnan wedo (2)
Huletegnaw adam met’a
Yemayt’elqew ts’ehey wet’a

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 3
Yediyablos sira ferswal
Mengaw hulu ts’dqn lebswal (2)
Sile hulu andu mote
Endnlebs teraqote

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 4
Bekefelew yedem waga
Adis honn balets’ega (2)

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'welden-fikir-sabew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 1
የሱን ለኛ የኛን ለእርሱ
ክብር ይሁን ለንጉሱ(2)
ጻድቅ ፈራጅ ድንቅ ዳኛ
ክብሩን ጥሎ ግርግም ተኛ

VERSE 2
ሳይጎልበት ሆነ ባዶ
በፍጹም ፍቅር እኛን ወዶ (2)
ሁለተኛው አዳም መጣ
የማይጠልቀው ጸሀይ ወጣ

VERSE 3
የዲያብሎስ ስራ ፈርሷል
መንጋው ሁሉ ጽድቅን ለብሷል(2)
ስለ ሁሉ አንዱ ሞተ
እንድንለብስ ተራቆተ

VERSE 4
በከፈለው የደም ዋጋ
አዲስ ሆንን ባለፀጋ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 1
Yesun legna yegnan leersu
Kibir yihun lengusu (2)
Ts’adq feraj dinq dagna
Kibrun t’lo girgm tegna

VERSE 2
Saygolbet hone bado
Befts’um fiqr egnan wedo (2)
Huletegnaw adam met’a
Yemayt’elqew ts’ehey wet’a

VERSE 3
Yediyablos sira ferswal
Mengaw hulu ts’dqn lebswal (2)
Sile hulu andu mote
Endnlebs teraqote

VERSE 4
Bekefelew yedem waga
Adis honn balets’ega (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'welden-fikir-sabew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Welela Eyu Qalka (welela-eyu-qalka)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 1
በይነይ ከስተማስል ብዙሕ ክዳፋነቕ
ቃልካ የበርትዓ ንድኽምቲ ነፍሰይ
ሓጎስ ይመልኣኒ ይሕደስ መንፈሰይ
ሽዑስ ከም ብተይ እየ ኣዝየ ዝሰራሰር

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 2
ኣብ ኣደባባያት ንቓልካ እምስክር
ልበይ ተሓጒሱ ብዓውታ እዝምር
መቓውሐይ ኩሉ ፍፁም ይሰባበር
ንዓይ ጸግዐይ ዋልታይ ቃልካ’ዩ ኣምላኸይ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 3
ተስፋ ናይ ሕይወተይ ዘዕርፈሉ ቤተይ
ሓበነይ ኩርዓተይ ዝበለፀ ርስተይ
ዝፀነዐ ዕርደይ ሰናይ ብጽሒተይ
ሰማይ ኮነ ምድሪ ብቓልካ ተፈጥሩ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 4
ስለዚ ድማ እዮም ጸኒዖም ዝነብሩ
ኩሎም ፍጥረታት’ውን ነዚ ይምስክሩ
ትርጉም ሕይወተይ’ውን ቃልካ’ዩ ምሥጢሩ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ',
      lyrics_transliteration = 'CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 1
Beyney kestemasl bizuh kidafaneቕ
Qalka yeberta nidኽmti nefsey
Hagos yimelani yihdes menfesey
Shus kem bitey eye azye ziseraser

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 2
Ab adebabayat niቓlka emskr
Libey tehagwisu biawta ezmr
Meቓwhey kulu fits’um yisebaber
Niay ts’egay waltay qalka’yu amlaኸy

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 3
Tesfa nay hiywetey zeerfelu betey
Habeney kuratey zibelets’e ristey
Zits’enea erdey senay bits’hitey
Semay kone midri biቓlka tefet’ru

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 4
Silezi dima eyom ts’eniom zinebru
Kulom fit’retat’wn nezi yimskru
Tirgum hiywetey’wn qalka’yu mist’iru

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'welela-eyu-qalka'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 1
በይነይ ከስተማስል ብዙሕ ክዳፋነቕ
ቃልካ የበርትዓ ንድኽምቲ ነፍሰይ
ሓጎስ ይመልኣኒ ይሕደስ መንፈሰይ
ሽዑስ ከም ብተይ እየ ኣዝየ ዝሰራሰር

VERSE 2
ኣብ ኣደባባያት ንቓልካ እምስክር
ልበይ ተሓጒሱ ብዓውታ እዝምር
መቓውሐይ ኩሉ ፍፁም ይሰባበር
ንዓይ ጸግዐይ ዋልታይ ቃልካ’ዩ ኣምላኸይ

VERSE 3
ተስፋ ናይ ሕይወተይ ዘዕርፈሉ ቤተይ
ሓበነይ ኩርዓተይ ዝበለፀ ርስተይ
ዝፀነዐ ዕርደይ ሰናይ ብጽሒተይ
ሰማይ ኮነ ምድሪ ብቓልካ ተፈጥሩ

VERSE 4
ስለዚ ድማ እዮም ጸኒዖም ዝነብሩ
ኩሎም ፍጥረታት’ውን ነዚ ይምስክሩ
ትርጉም ሕይወተይ’ውን ቃልካ’ዩ ምሥጢሩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 1
Beyney kestemasl bizuh kidafaneቕ
Qalka yeberta nidኽmti nefsey
Hagos yimelani yihdes menfesey
Shus kem bitey eye azye ziseraser

VERSE 2
Ab adebabayat niቓlka emskr
Libey tehagwisu biawta ezmr
Meቓwhey kulu fits’um yisebaber
Niay ts’egay waltay qalka’yu amlaኸy

VERSE 3
Tesfa nay hiywetey zeerfelu betey
Habeney kuratey zibelets’e ristey
Zits’enea erdey senay bits’hitey
Semay kone midri biቓlka tefet’ru

VERSE 4
Silezi dima eyom ts’eniom zinebru
Kulom fit’retat’wn nezi yimskru
Tirgum hiywetey’wn qalka’yu mist’iru'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'welela-eyu-qalka', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: wemdrni tgebr fasika (wemdrni-tgebr-fasika)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3

VERSE 1
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3

CHORUS
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3',
      lyrics_transliteration = 'CHORUS
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3

VERSE 1
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3

CHORUS
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wemdrni-tgebr-fasika'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3

VERSE 1
ወምድርኒ ትገብር ፋሲካ (2)
ተሃጺባ በደመ ክርስቶስ (2)
እህ...... ተሃጺባ በደመ ክርስቶስ (2) X3'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3

VERSE 1
Wemdrni tigebr fasika (2)
Tehats’iba bedeme Kristos (2)
Eh...... tehats’iba bedeme Kristos (2) X3'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wemdrni-tgebr-fasika', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Wemidrni Tigebir Fasika (wemidrni-tigebir-fasika)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wemidrni-tigebir-fasika'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)

VERSE 1
ወምድርኒ ትገብር ፋሲካ (2)
ተሐጺባ በደመ ክርስቶስ (4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)

VERSE 1
Wemidrni tigebir fasika (2)
Tehatsiba bedeme kirstos (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wemidrni-tigebir-fasika', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: \ werasi \ Eritrean orthodox tewahdo mezmur \ zemari Bereket Tikue (werasi-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 1
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር
ጸልሚቱኒ ድነ ሞት እንክኸበኒ
ሓደኳ ክስእን ተስፋ ዝህበኒ
ብጥቓይ ክትሓልፍ ጎይታይ ሰሚዐ ድምጽኻ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 2
ወዲ ዳዊት መሓረኒ‘ለ ጸዊዐካ
ደንጊጽካለይ ግልጽ ኢልካ ንምርደእይ
ብምሕረትካ ብርሃን ልበይ ተኸፍተለይ
ዘይንጹህነተይ ሓጢኣተይ ከይከልከለካ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 3
ትሓቁፈኒ ፈናፍንተይ’ና ኣለኻ
ዓርኪ ኣመናዝርን ቀረጽትን’ና በሉኻ
ንምድሓነይ ብኣይ ሓጥእ ዘይሓፈርካ
ከምቲ ንሓኪም ዘድልይዎ’ቶም ሕሙማት

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 4
ንዓይ ክትደልስ ወሪድካለይ ካብ ሰማያት
ዓስቢ ሓጢኣት’ት ዘይፈደኽዎ ዕዳይ
ከፊልካዮ ጎዳጉደይ ደፊንካለይ
ልብሲ ጸጋ ካባ ሓጎስ ንኽለብስ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 5
ጥራይ ዝባንካ ተሰቒልካለይ ኢየሱስ
ብዘይትመን ብክቡር ደምካ ዓዲግካኒ
ውሉድ ጸጋ ወራሲ ቤትካ ጌርካኒ
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 6
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር',
      lyrics_transliteration = 'CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 1
Ab kulu kunetat iyesusey kiber
Ts’elmituni dine mot enkኸbeni
Hadekwa kisen tesfa zihbeni
Bit’ቓy kithalf goytay semia dimts’ኻ

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 2
Wedi dawit mehareni‘le ts’ewiaka
Dengits’kaley gilts’ ilka nimrdeey
Bimhretka birhan libey teኸfteley
Zeynts’uhnetey hat’iatey keykelkeleka

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 3
Tihaqufeni fenafntey’na aleኻ
Arki amenazrn qerets’tn’na beluኻ
Nimdhaney biay hat’e zeyhaferka
Kemti nihakim zedlywo’tom himumat

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 4
Niay kitdels weridkaley kab semayat
Asbi hat’iat’t zeyfedeኽwo eday
Kefilkayo godagudey definkaley
Libsi ts’ega kaba hagos niኽlebs

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 5
T’ray zibanka teseቒlkaley Iyesus
Bizeytmen bikbur demka adigkani
Wilud ts’ega werasi betka gerkani
Zerzire aywdon siley ziኾnkayo

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 6
Aboy niweletka entay’le kewryo
Kab hamed alika seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber
Ab kulu kunetat iyesusey kiber

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'werasi-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 1
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር
ጸልሚቱኒ ድነ ሞት እንክኸበኒ
ሓደኳ ክስእን ተስፋ ዝህበኒ
ብጥቓይ ክትሓልፍ ጎይታይ ሰሚዐ ድምጽኻ

VERSE 2
ወዲ ዳዊት መሓረኒ‘ለ ጸዊዐካ
ደንጊጽካለይ ግልጽ ኢልካ ንምርደእይ
ብምሕረትካ ብርሃን ልበይ ተኸፍተለይ
ዘይንጹህነተይ ሓጢኣተይ ከይከልከለካ

VERSE 3
ትሓቁፈኒ ፈናፍንተይ’ና ኣለኻ
ዓርኪ ኣመናዝርን ቀረጽትን’ና በሉኻ
ንምድሓነይ ብኣይ ሓጥእ ዘይሓፈርካ
ከምቲ ንሓኪም ዘድልይዎ’ቶም ሕሙማት

VERSE 4
ንዓይ ክትደልስ ወሪድካለይ ካብ ሰማያት
ዓስቢ ሓጢኣት’ት ዘይፈደኽዎ ዕዳይ
ከፊልካዮ ጎዳጉደይ ደፊንካለይ
ልብሲ ጸጋ ካባ ሓጎስ ንኽለብስ

VERSE 5
ጥራይ ዝባንካ ተሰቒልካለይ ኢየሱስ
ብዘይትመን ብክቡር ደምካ ዓዲግካኒ
ውሉድ ጸጋ ወራሲ ቤትካ ጌርካኒ
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ

VERSE 6
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 1
Ab kulu kunetat iyesusey kiber
Ts’elmituni dine mot enkኸbeni
Hadekwa kisen tesfa zihbeni
Bit’ቓy kithalf goytay semia dimts’ኻ

VERSE 2
Wedi dawit mehareni‘le ts’ewiaka
Dengits’kaley gilts’ ilka nimrdeey
Bimhretka birhan libey teኸfteley
Zeynts’uhnetey hat’iatey keykelkeleka

VERSE 3
Tihaqufeni fenafntey’na aleኻ
Arki amenazrn qerets’tn’na beluኻ
Nimdhaney biay hat’e zeyhaferka
Kemti nihakim zedlywo’tom himumat

VERSE 4
Niay kitdels weridkaley kab semayat
Asbi hat’iat’t zeyfedeኽwo eday
Kefilkayo godagudey definkaley
Libsi ts’ega kaba hagos niኽlebs

VERSE 5
T’ray zibanka teseቒlkaley Iyesus
Bizeytmen bikbur demka adigkani
Wilud ts’ega werasi betka gerkani
Zerzire aywdon siley ziኾnkayo

VERSE 6
Aboy niweletka entay’le kewryo
Kab hamed alika seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber
Ab kulu kunetat iyesusey kiber'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'werasi-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Werido Emeskelu (weredo-emeskelu)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'weredo-emeskelu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ

VERSE 1
ወሪዶ እመስቀሉ (2)
እመስቀሉ አብርሃ ለኩሉ
እመስቀሉ ለኩሉ አብርህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh

VERSE 1
Werido emeskelu (2)
Emeskelu abrha lekulu
Emeskelu lekulu abirh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'weredo-emeskelu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Wetibelo Yikwineni (wetibelo-yikwineni)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wetibelo-yikwineni'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬

VERSE 1
ወትቤሎ ይኩነኒ ፪
በከመ ትቤለኒ ይኩነኒ ፬'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wetbelo yikuneni 2
Bekeme tibeleni yikuneni 4

VERSE 1
Wetbelo yikuneni 2
Bekeme tibeleni yikuneni 4'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wetibelo-yikwineni', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: When Your Might''s Revealed (when-your-mights-revealed)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/

VERSE 1
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/',
      lyrics_transliteration = 'CHORUS
Haylih sigelest besemay

VERSE 1
Abet man yiqom yihon kefiteh

CHORUS
Haylih sigelest besemay',
      lyrics_english = 'CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 1
Oh Lord
When Heavenly Trumpets Are Played
When The Proclamation Is Read
When The Righteous Receive Their Prize

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 2
Where Then May Our Hope Lie

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 3
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 4
Oh Lord
When All The Angels Plow The Sky
When We Hear The Thunder''s First Cry
When A Sound Never Been Heard

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 5
Coming From Ramah Has Emerged

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 6
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 7
Oh Lord
When The Seven Winds Go Forward
And Frighten The Land They''ve Cornered
When The Sea Waves Are Commanded To Prepare The Land For Judgement

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 8
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 9
Oh Lord
When They Call All The Holy Saints
Who Have Done Great Work By Your Grace
Those Who Did Righteous On This Earth When They Praise Him And They Serve

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 10
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 11
Oh Lord
When Wicked Are Called For Judgement
To Stay In The World Of Darkness
Unhelpful Will Be Their Shouting

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 12
Only Shameful Will Be Weeping

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 13
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 14
Oh Lord
When They Call All The Holy Saints
Who Have Done Great Work By Your Grace
Those Who Did Righteous On This Earth When They Praise Him And They Serve

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 15
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 16
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 17
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

CHORUS
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'when-your-mights-revealed'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/

VERSE 1
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/
አቤት ማን ይቆም ይሆን ክፊትህ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Haylih sigelest besemay

VERSE 1
Abet man yiqom yihon kefiteh'
    AND lyrics_english IS NOT DISTINCT FROM 'When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 1
Oh Lord
When Heavenly Trumpets Are Played
When The Proclamation Is Read
When The Righteous Receive Their Prize

VERSE 2
Where Then May Our Hope Lie

VERSE 3
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 4
Oh Lord
When All The Angels Plow The Sky
When We Hear The Thunder''s First Cry
When A Sound Never Been Heard

VERSE 5
Coming From Ramah Has Emerged

VERSE 6
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 7
Oh Lord
When The Seven Winds Go Forward
And Frighten The Land They''ve Cornered
When The Sea Waves Are Commanded To Prepare The Land For Judgement

VERSE 8
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 9
Oh Lord
When They Call All The Holy Saints
Who Have Done Great Work By Your Grace
Those Who Did Righteous On This Earth When They Praise Him And They Serve

VERSE 10
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 11
Oh Lord
When Wicked Are Called For Judgement
To Stay In The World Of Darkness
Unhelpful Will Be Their Shouting

VERSE 12
Only Shameful Will Be Weeping

VERSE 13
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 14
Oh Lord
When They Call All The Holy Saints
Who Have Done Great Work By Your Grace
Those Who Did Righteous On This Earth When They Praise Him And They Serve

VERSE 15
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 16
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You

VERSE 17
When Your Might''s Revealed In Heaven
Oh Lord Who May Dare To Stand Before You'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'when-your-mights-revealed', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Who Else Do I Have (who-else-do-i-have)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
ለደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 1
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
ለደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

CHORUS
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
ለደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ',
      lyrics_transliteration = 'CHORUS
Yeliben hulu leman lamakir
Emebete hoy keanchi beqer

VERSE 1
Ledekamaw sew metegiya ekonesh
Hazen chinqeten yemresabish

CHORUS
Yeliben hulu leman lamakir
Emebete hoy keanchi beqer',
      lyrics_english = 'CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 1
The saints of the past, they called you mother (2x)
Because they escaped the fiery chamber
Like the righteous saints, who live in heaven (2x)
I will always call upon the Virgin

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 2
Chorus…..

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 3
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 4
In my darkest times, you shine with your light (2x)
You’re a spotless dove a humble servant
Your motherly love, resides in my heart (2x)
You always change my sadness to comfort

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 5
Chorus…..

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 6
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 7
The Holy Virgin, you’re loving and kind (2x)
You protected me since I was a child
I am grateful for, your intercession (2x)
Word just can’t express my adoration

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 8
Chorus…..

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 9
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 10
When I’m in distress, you’re my source of joy (2x)
You respond swiftly and so I rejoice
For the sinful soul, your name offers hope (2x)
Through your Son we live and find our way home

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 11
Chorus…..

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 12
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 13
You give me my meal, so I don’t hunger (2x)
When you see we’re sick you offer prayer
We who plead to you, with veneration (2x)
Are not let down with your intercession

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 14
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 15
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 16
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

CHORUS
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'who-else-do-i-have'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
ለደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 1
የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
ለደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeliben hulu leman lamakir
Emebete hoy keanchi beqer

VERSE 1
Ledekamaw sew metegiya ekonesh
Hazen chinqeten yemresabish'
    AND lyrics_english IS NOT DISTINCT FROM 'Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 1
The saints of the past, they called you mother (2x)
Because they escaped the fiery chamber
Like the righteous saints, who live in heaven (2x)
I will always call upon the Virgin

VERSE 2
Chorus…..

VERSE 3
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 4
In my darkest times, you shine with your light (2x)
You’re a spotless dove a humble servant
Your motherly love, resides in my heart (2x)
You always change my sadness to comfort

VERSE 5
Chorus…..

VERSE 6
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 7
The Holy Virgin, you’re loving and kind (2x)
You protected me since I was a child
I am grateful for, your intercession (2x)
Word just can’t express my adoration

VERSE 8
Chorus…..

VERSE 9
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 10
When I’m in distress, you’re my source of joy (2x)
You respond swiftly and so I rejoice
For the sinful soul, your name offers hope (2x)
Through your Son we live and find our way home

VERSE 11
Chorus…..

VERSE 12
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 13
You give me my meal, so I don’t hunger (2x)
When you see we’re sick you offer prayer
We who plead to you, with veneration (2x)
Are not let down with your intercession

VERSE 14
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 15
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you

VERSE 16
Who else do I have when I feel alone
Your compassion is what I’ve always known
When I’m weak and frail you are my refuge
My sadness is calmed all because of you'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'who-else-do-i-have', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Wibete Hoy Nii (wibete-hoy-nii)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 1
ላንቺ ነው ማርያም ማኅደረ አዶናይ
ከክርስቶስ ጋራ ነይ ሙሽራዬ
ሸክሜ ይቅለልልኝ ይክሰም መከራዬ
ወጀቡን አሻግረሽ ሰላሜን አውጂ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 2
ዕድሜዬን አስውቢ መዋዕሌን ዋጂ
ሰበንሽን ይዣለሁ ለምልክት ትእምርት
ከቶማስ በመቅሰም አማናዊን ትም''ህርት
ይታወቅ በይፋ የጽዮን መሆኔ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 3
ስምሽን እየጠራሁ ይለምልም ዘመኔ
በወንጌል አላፍርም ድንቅ እውነት ልናገር
ማርያም ብፅዕት የእግዚአብሔር ሀገር
ያንደበቴ አውታር የልቤ ቅኝቱ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 4
ይላል አማላጄ ድንግል አዛኝቱ
በኪዳን በምልጃሽ ዓለሙ ተማረ
የአበው ሱባዔ ፍጻሜው አማረ
አንዲት ነሽ ለሐና መደምደምያ ርግቤ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 5
ያደራ እናቴ የሕይወት መዝገቤ
ተጎናፅፈሽ ፃይን ላለሽው በቀኙ
አፈወ ፍጥረታት ምስጋናን ተቀኙ
መዳኒታቸውን ኃጣን አይዘነጉ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 6
ሳይጠሩሽ አያድሩ ባርምሞ አያነጉ
ዳግሚቱ ሰማይ ምድርን የማረክሻት
ወላዲተ ትንቢት ያዳም ጸሎት መሻት
ባንቺ ተመለሰ ከቀድሞው ማደሪያው

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 7
ኪዳነ ምሕረት ኾነሽው መክበሪያው::

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ',
      lyrics_transliteration = 'CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 1
Lanchi new Maryam mahdere adonay
Kekrstos gara ney mushraye
Shekme yiqlellgn yiksem mekeraye
Wejebun ashagresh selamen awji

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 2
Edmeyen aswbi mewaelen waji
Sebenshn yizhalehu lemlkt tiemrt
Ketomas bemeqsem amanawin tim''hirt
Yitaweq beyfa yets’yon mehone

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 3
Simshn eyet’erahu yilemlm zemene
Bewengel alafrm dinq ewnet linager
Maryam bits’et yeEgziabher heger
Yandebete awtar yelbe qigntu

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 4
Yilal amalaje Dingil azagntu
Bekidan bemljash alemu temare
Yeabew subae fits’amew amare
Andit nesh lehena medemdemya rigbe

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 5
Yadera enate yehywet mezgebe
Tegonats’fesh ts’ayn laleshw beqegnu
Afewe fit’retat misganan teqegnu
Medanitachewn hat’an ayzenegu

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 6
Sayt’erush ayadru barmmo ayanegu
Dagmitu semay midrn yemarekshat
Weladite tinbit yadam ts’elot meshat
Banchi temelese keqedmow maderiyaw

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 7
Kidane mihret ኾneshw mekberiyaw::

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wibete-hoy-nii'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 1
ላንቺ ነው ማርያም ማኅደረ አዶናይ
ከክርስቶስ ጋራ ነይ ሙሽራዬ
ሸክሜ ይቅለልልኝ ይክሰም መከራዬ
ወጀቡን አሻግረሽ ሰላሜን አውጂ

VERSE 2
ዕድሜዬን አስውቢ መዋዕሌን ዋጂ
ሰበንሽን ይዣለሁ ለምልክት ትእምርት
ከቶማስ በመቅሰም አማናዊን ትም''ህርት
ይታወቅ በይፋ የጽዮን መሆኔ

VERSE 3
ስምሽን እየጠራሁ ይለምልም ዘመኔ
በወንጌል አላፍርም ድንቅ እውነት ልናገር
ማርያም ብፅዕት የእግዚአብሔር ሀገር
ያንደበቴ አውታር የልቤ ቅኝቱ

VERSE 4
ይላል አማላጄ ድንግል አዛኝቱ
በኪዳን በምልጃሽ ዓለሙ ተማረ
የአበው ሱባዔ ፍጻሜው አማረ
አንዲት ነሽ ለሐና መደምደምያ ርግቤ

VERSE 5
ያደራ እናቴ የሕይወት መዝገቤ
ተጎናፅፈሽ ፃይን ላለሽው በቀኙ
አፈወ ፍጥረታት ምስጋናን ተቀኙ
መዳኒታቸውን ኃጣን አይዘነጉ

VERSE 6
ሳይጠሩሽ አያድሩ ባርምሞ አያነጉ
ዳግሚቱ ሰማይ ምድርን የማረክሻት
ወላዲተ ትንቢት ያዳም ጸሎት መሻት
ባንቺ ተመለሰ ከቀድሞው ማደሪያው

VERSE 7
ኪዳነ ምሕረት ኾነሽው መክበሪያው::'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 1
Lanchi new Maryam mahdere adonay
Kekrstos gara ney mushraye
Shekme yiqlellgn yiksem mekeraye
Wejebun ashagresh selamen awji

VERSE 2
Edmeyen aswbi mewaelen waji
Sebenshn yizhalehu lemlkt tiemrt
Ketomas bemeqsem amanawin tim''hirt
Yitaweq beyfa yets’yon mehone

VERSE 3
Simshn eyet’erahu yilemlm zemene
Bewengel alafrm dinq ewnet linager
Maryam bits’et yeEgziabher heger
Yandebete awtar yelbe qigntu

VERSE 4
Yilal amalaje Dingil azagntu
Bekidan bemljash alemu temare
Yeabew subae fits’amew amare
Andit nesh lehena medemdemya rigbe

VERSE 5
Yadera enate yehywet mezgebe
Tegonats’fesh ts’ayn laleshw beqegnu
Afewe fit’retat misganan teqegnu
Medanitachewn hat’an ayzenegu

VERSE 6
Sayt’erush ayadru barmmo ayanegu
Dagmitu semay midrn yemarekshat
Weladite tinbit yadam ts’elot meshat
Banchi temelese keqedmow maderiyaw

VERSE 7
Kidane mihret ኾneshw mekberiyaw::'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wibete-hoy-nii', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Wisite Mahitsene Dinigil (wisite-mahitsene-dinigil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤

VERSE 1
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤

CHORUS
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤',
      lyrics_transliteration = 'CHORUS
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤

VERSE 1
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤

CHORUS
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wisite-mahitsene-dinigil'
    AND lyrics_amharic IS NOT DISTINCT FROM '❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤

VERSE 1
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤'
    AND lyrics_transliteration IS NOT DISTINCT FROM '❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤

VERSE 1
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wisite-mahitsene-dinigil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: With His Love The Lord Rescued Me (with-his-love-the-lord-rescued-me)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስለወደደኝ አዳነኝ
በቸርነቱ ፈወሰኝ
አቆመኝ ስለ ክብሩ
ከሞት ነጥቆኛል ፍቅሩ

VERSE 1
ስለወደደኝ አዳነኝ
በቸርነቱ ፈወሰኝ
አቆመኝ ስለ ክብሩ
ከሞት ነጥቆኛል ፍቅሩ

CHORUS
ስለወደደኝ አዳነኝ
በቸርነቱ ፈወሰኝ
አቆመኝ ስለ ክብሩ
ከሞት ነጥቆኛል ፍቅሩ',
      lyrics_transliteration = 'CHORUS
Sileweddedegn adanenegn
Bechernetu fewesegn

VERSE 1
Aqomegn sile kibru
Kemot netqognal fikru

CHORUS
Sileweddedegn adanenegn
Bechernetu fewesegn',
      lyrics_english = 'CHORUS
With His love the Lord rescued me
His graciousness my remedy
I will stand to glorify
Snatched from death I testify

VERSE 1
Outstretching His hands taking affliction
Eternally He shows affection
In my unrest He became my peace
My gracious Lord the one who loved me

CHORUS
With His love the Lord rescued me
His graciousness my remedy
I will stand to glorify
Snatched from death I testify

VERSE 2
On death’s shoulders I triumphantly stride
Breaking my chains I''m saved from demise
With songs of praise I have filled my mouth
I''m at ease through Him without a doubt

CHORUS
With His love the Lord rescued me
His graciousness my remedy
I will stand to glorify
Snatched from death I testify

VERSE 3
The Samaritan came with compassion
With His oil my wounds were lessened
Abundant love has supported me
He paid the price and He set me free

CHORUS
With His love the Lord rescued me
His graciousness my remedy
I will stand to glorify
Snatched from death I testify

VERSE 4
With His love the Lord rescued me
His graciousness my remedy
I will stand to glorify
Snatched from death I testify

CHORUS
With His love the Lord rescued me
His graciousness my remedy
I will stand to glorify
Snatched from death I testify',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'with-his-love-the-lord-rescued-me'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስለወደደኝ አዳነኝ
በቸርነቱ ፈወሰኝ
አቆመኝ ስለ ክብሩ
ከሞት ነጥቆኛል ፍቅሩ

VERSE 1
ስለወደደኝ አዳነኝ
በቸርነቱ ፈወሰኝ
አቆመኝ ስለ ክብሩ
ከሞት ነጥቆኛል ፍቅሩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Sileweddedegn adanenegn
Bechernetu fewesegn

VERSE 1
Aqomegn sile kibru
Kemot netqognal fikru'
    AND lyrics_english IS NOT DISTINCT FROM 'With His love the Lord rescued me
His graciousness my remedy
I will stand to glorify
Snatched from death I testify

VERSE 1
Outstretching His hands taking affliction
Eternally He shows affection
In my unrest He became my peace
My gracious Lord the one who loved me

VERSE 2
On death’s shoulders I triumphantly stride
Breaking my chains I''m saved from demise
With songs of praise I have filled my mouth
I''m at ease through Him without a doubt

VERSE 3
The Samaritan came with compassion
With His oil my wounds were lessened
Abundant love has supported me
He paid the price and He set me free

VERSE 4
With His love the Lord rescued me
His graciousness my remedy
I will stand to glorify
Snatched from death I testify'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'with-his-love-the-lord-rescued-me', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: With His Mercifulness (with-his-mercifulness)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal becherinetu',
      lyrics_english = 'CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 1
Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal (2) becherinetu

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 2
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 3
How can we thank you Lord Glorious God Almighty
You granted us this life to fulfill righteously
It is always your will to save us with your grace
You are love God indeed you cannot be replaced

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 4
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 5
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 6
No one compares to Him in His love in His grace
He is patient with us He endures for our sake
He calls us to His way return to me He says
Let us pray to Him now with humble repentance

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 7
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 8
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

CHORUS
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'with-his-mercifulness'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal becherinetu'
    AND lyrics_english IS NOT DISTINCT FROM 'With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 1
Bekehalinetu beamlakinetu
Yikir yilenal yitadegenal (2) becherinetu

VERSE 2
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 3
How can we thank you Lord Glorious God Almighty
You granted us this life to fulfill righteously
It is always your will to save us with your grace
You are love God indeed you cannot be replaced

VERSE 4
God will accept us He will forgive us (2) with His righteousness

VERSE 5
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness

VERSE 6
No one compares to Him in His love in His grace
He is patient with us He endures for our sake
He calls us to His way return to me He says
Let us pray to Him now with humble repentance

VERSE 7
God will accept us He will forgive us (2) with His righteousness

VERSE 8
With His mercifulness with His loving kindness
God will accept us He will forgive us (2) with His righteousness'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'with-his-mercifulness', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: With My Unfitting (with-my-unfitting)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 1
Just thinking about her, her glory untold
The humbleness you showed is
immeasurable
You even cry for us, for the lowly people

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 2
You plea to save my soul, to relief my scares
My heart is drawn to you, Mary mother of
God
Because of this Mary, our affection is grand

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 3
We are begging you, to plead beseech for us
Your hands are stretched up to, towards our
God
To ask for forgiveness, you look up to the

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 4
lord
Seraphim Cherubim, angles blazing like fire
They couldn''t touch our God, his grace and
power

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 5
Mary embraced the lord, you kissed and
nurtured him
Oh Virgin Mary, Your love is fair and rare

CHORUS
With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'with-my-unfitting'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'With my unfitting, undeserving soul
Let me sing for her, for the mother of lord
I have survived the earth, the dark and the
cold

VERSE 1
Just thinking about her, her glory untold
The humbleness you showed is
immeasurable
You even cry for us, for the lowly people

VERSE 2
You plea to save my soul, to relief my scares
My heart is drawn to you, Mary mother of
God
Because of this Mary, our affection is grand

VERSE 3
We are begging you, to plead beseech for us
Your hands are stretched up to, towards our
God
To ask for forgiveness, you look up to the

VERSE 4
lord
Seraphim Cherubim, angles blazing like fire
They couldn''t touch our God, his grace and
power

VERSE 5
Mary embraced the lord, you kissed and
nurtured him
Oh Virgin Mary, Your love is fair and rare'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'with-my-unfitting', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Within the Sinner’s Tent (within-the-sinners-tent)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከኃጢያተኛው ድንኳን ቅዱሱ ቆመሀል
ልጄ የት ነው ብለህ እኔን ፈልገሀል
አንተ ስላለኸኝ ቀሏል መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

VERSE 1
ከኃጢያተኛው ድንኳን ቅዱሱ ቆመሀል
ልጄ የት ነው ብለህ እኔን ፈልገሀል
አንተ ስላለኸኝ ቀሏል መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

CHORUS
ከኃጢያተኛው ድንኳን ቅዱሱ ቆመሀል
ልጄ የት ነው ብለህ እኔን ፈልገሀል
አንተ ስላለኸኝ ቀሏል መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ',
      lyrics_transliteration = 'CHORUS
Ke hatiategnaw dinkwan qidus qomehal
Lije yet new bileh enen felgehal

VERSE 1
Ante selalekegn qelual mekeraye
Lene yaderekew bizu new getaye

CHORUS
Ke hatiategnaw dinkwan qidus qomehal
Lije yet new bileh enen felgehal',
      lyrics_english = 'CHORUS
Within the sinner’s tent the holy has appeared
Searching for your child my Lord you brought me near
Since you stand by my side my challenges have passed
The blessings you gave me are abundantly vast

VERSE 1
Through your fulfilling grace you have completed me
This is what my heart longs to receive your mercy
My weakening has ceased the trials I have crossed
You found me the sinner like the coin that was lost

CHORUS
Within the sinner’s tent the holy has appeared
Searching for your child my Lord you brought me near
Since you stand by my side my challenges have passed
The blessings you gave me are abundantly vast

VERSE 2
From the time you found me the fig as my cover
What I read from your face always I remember
Overcoming burdens you tell me I''ll achieve
I can tell from your eyes you will not forget me

CHORUS
Within the sinner’s tent the holy has appeared
Searching for your child my Lord you brought me near
Since you stand by my side my challenges have passed
The blessings you gave me are abundantly vast

VERSE 3
What do you see in me when knocking on my door
You are the Holy God while I am weak and poor
After this I won''t soak my carpet full of tears
Enter into my home so your word I can hear

CHORUS
Within the sinner’s tent the holy has appeared
Searching for your child my Lord you brought me near
Since you stand by my side my challenges have passed
The blessings you gave me are abundantly vast

VERSE 4
I know you are my Lord giving your love to all
Rescuing from lions deliver from the fall
I will sing to my God For my heart it has said
Jesus Christ our Savior you’re the heavenly bread

CHORUS
Within the sinner’s tent the holy has appeared
Searching for your child my Lord you brought me near
Since you stand by my side my challenges have passed
The blessings you gave me are abundantly vast',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'within-the-sinners-tent'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከኃጢያተኛው ድንኳን ቅዱሱ ቆመሀል
ልጄ የት ነው ብለህ እኔን ፈልገሀል
አንተ ስላለኸኝ ቀሏል መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ

VERSE 1
ከኃጢያተኛው ድንኳን ቅዱሱ ቆመሀል
ልጄ የት ነው ብለህ እኔን ፈልገሀል
አንተ ስላለኸኝ ቀሏል መከራዬ
ለኔ ያደረከው ብዙ ነው ጌታዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ke hatiategnaw dinkwan qidus qomehal
Lije yet new bileh enen felgehal

VERSE 1
Ante selalekegn qelual mekeraye
Lene yaderekew bizu new getaye'
    AND lyrics_english IS NOT DISTINCT FROM 'Within the sinner’s tent the holy has appeared
Searching for your child my Lord you brought me near
Since you stand by my side my challenges have passed
The blessings you gave me are abundantly vast

VERSE 1
Through your fulfilling grace you have completed me
This is what my heart longs to receive your mercy
My weakening has ceased the trials I have crossed
You found me the sinner like the coin that was lost

VERSE 2
From the time you found me the fig as my cover
What I read from your face always I remember
Overcoming burdens you tell me I''ll achieve
I can tell from your eyes you will not forget me

VERSE 3
What do you see in me when knocking on my door
You are the Holy God while I am weak and poor
After this I won''t soak my carpet full of tears
Enter into my home so your word I can hear

VERSE 4
I know you are my Lord giving your love to all
Rescuing from lions deliver from the fall
I will sing to my God For my heart it has said
Jesus Christ our Savior you’re the heavenly bread'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'within-the-sinners-tent', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Without You My Lord (without-you-my-lord)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane',
      lyrics_english = 'CHORUS
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
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'without-you-my-lord'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane'
    AND lyrics_english IS NOT DISTINCT FROM 'Without you my Lord I have no delight
Without you my God barren is my life
When I call Your name pleading for Your grace
The fires will calm from death I''ll be saved

VERSE 1
Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane

VERSE 2
As you held my hand and led me to You
I conquered the trials and misery too
I''ll leave them behind the hardships will pass
My hunger and pain I''ll forget at last

VERSE 3
With Your blessings my chalice overflowed
I was unscathed by the rival''s arrow
With thousands of words I will fill my mouth
Your marvelous deeds I will sing about

VERSE 4
If my slayer walks through the night and day
While my savior God is with me to stay
Death lost its power I shall have no fear
I''ll worship my King throughout all my years

VERSE 5
The praise of angels became daily bread
Consumed by Your love my songs I''ll extend
My despair is gone for hope is risen
The glory that''s due to you I''ve given

VERSE 6
Yalante Geta desta mech ale
Yalante Amlake hiywet mech ale
Simihin terto yetematsene
Kesatim weta kemotim dane'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'without-you-my-lord', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: WUBETE (wubete)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wubete'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ውበቴ ማርያም ደምግባቴ(2)
ዕድልነው ስለ ሆንሽ እናቴ
እናት እንደሌለው ውበቴ እንዳጣ ዘመድ
አልሆን የሚዋትት ውበቴ የቀረ መንገድ

VERSE 1
ወስጄሻለሁኝ ከመስቀሉ ስር
እነኋት ብሎኛል ጌታ በፍቅር
አንጀቴ ተጣብቆ አንሰፍስፎኝ ረሀብ
ማርያም (2) ስል ነው ሰምቶ የሚረግብ

VERSE 2
አሰሚኝ እናቴ የሰላምታሽን ቃል
ምስቅልቅሉ ኑሮ ጭንቀቴ ይበቃል
ይመካል ይፈካል ልቤም ገጽታዬ
የጌታዬን እናት ስለምል እምዬ

VERSE 3
በማዕረግ አድጌ በማዕረግ ኖራለሁ
ማን እረዳህ ቢሉኝ እናቴ እላለሁ
ለኔስ አንቺ ስጦታዬ
እናት ኩራት ሸሻጊዬ

VERSE 4
የቅርቤ ነሽ የውስጠቴ
ጌጤ ያልኩሽ ደምግባቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wibete Maryam demgbate (2)
Edlnew sile honsh enate
Enat endelelew wibete endat’a zemed
Alhon yemiwatt wibete yeqere menged

VERSE 1
Wesjeshalehugn kemesqelu sir
Enehwat bilognal Geta befqr
Anjete tet’abqo ansefsfogn reheb
Maryam (2) sil new semto yemiregb

VERSE 2
Asemign enate yeselamtashn qal
Misqlqlu nuro ch’nqete yibeqal
Yimekal yifekal libem gets’taye
Yegetayen enat sileml emye

VERSE 3
Bemaereg adge bemaereg noralehu
Man eredah bilugn enate elalehu
Lenes anchi sit’otaye
Enat kurat sheshagiye

VERSE 4
Yeqrbe nesh yewst’ete
Get’e yalkush demgbate'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wubete', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Wudase Maryam Echohalew (wudase-maryam-echohalew)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'wudase-maryam-echohalew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 1
ውዳሴ ማርያም በሰርክ ፀሎት ላይ
ውዳሴ ማርያም ዜማን ስናደርስ
ውዳሴ ማርያም ድንግል ትመጣለች
ውዳሴ ማርያም ከቤተ መቅደስ

VERSE 2
ውዳሴ ማርያም የብርሀን ምንጣፍ
ውዳሴ ማርያም ከፊቷ ተነጥፏል
ውዳሴ ማርያም ቅዱስ ኤፍሬም ታጥቆ
ውዳሴ ማርያም ያመሰግናታል

VERSE 3
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 4
ውዳሴ ማርያም አባ ሄርያቆስ
ውዳሴ ማርያም ምስጋና ያቀርባል
ውዳሴ ማርያም የቅዳሴው ዜማ
ውዳሴ ማርያም ልብን ይመስጣል

VERSE 5
ውዳሴ ማርያም በጎ ነገር ልቤ
ውዳሴ ማርያም አወጣ እያለ
ውዳሴ ማርያም ዳዊት በገናውን
ውዳሴ ማርያም እየ ደረ ደረ

VERSE 6
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 7
ውዳሴ ማርያም የንፅህናችን
ውዳሴ ማርያም መሰረት ነሽና
ውዳሴ ማርያም አንቺን ለማመስገን
ውዳሴ ማርያም ልቦናዬ ይብራ

VERSE 8
ውዳሴ ማርያም ተፈስኺ ድንግል
ውዳሴ ማርያም በቤተ ልሄም
ውዳሴ ማርያም ካንቺ ተወለደ
ውዳሴ ማርያም መድሀኒ አለም

VERSE 9
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 10
ውዳሴ ማርያም ቅዱሳኑ ሁሉ
ውዳሴ ማርያም ዙሪያሽን ከበዋል
ውዳሴ ማርያም አባ ጊወርጊስም
ውዳሴ ማርያም ንኢ ድንግል ይላል

VERSE 11
ውዳሴ ማርያም በወርቅ ዙፋን ላይ
ውዳሴ ማርያም ተቀምጠሽ ሳይሽ
ውዳሴ ማርያም ልቤ ተሰወረ
ውዳሴ ማርያም ድንግል በግርማሽ

VERSE 12
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 13
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 14
ውዳሴ ማርያም እጮሀለሁ
ድንግል እናቴን እጠራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 1
Wudase Maryam, beserk tselot lay
Wudase Maryam, zeman sinaders
Wudase Maryam, denegl timetaletch
Wudase Maryam, kebete meqdes

VERSE 2
Wudase Maryam, yebrihan minṭaf
Wudase Maryam, kefitwa tenetefwal
Wudase Maryam, qedus Efram taṭqo
Wudase Maryam, yamesegnatlal

VERSE 3
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 4
Wudase Maryam, Aba Heryaqos
Wudase Maryam, misgana yakerbal
Wudase Maryam, yeqidaséw zema
Wudase Maryam, liben yimesṭal

VERSE 5
Wudase Maryam, bego neger libe
Wudase Maryam, aweta eyale
Wudase Maryam, Dawit begenawn
Wudase Maryam, eye dere dere

VERSE 6
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 7
Wudase Maryam, yentsehnachen
Wudase Maryam, meserat neshina
Wudase Maryam, anchin le’amesgen
Wudase Maryam, libonaye yibra

VERSE 8
Wudase Maryam, tefesihi denegl
Wudase Maryam, beBetelehem
Wudase Maryam, kanchi tewelled
Wudase Maryam, medhane alem

VERSE 9
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 10
Wudase Maryam, qedusanhu hulu
Wudase Maryam, zuriyashin kebewal
Wudase Maryam, Aba Giorgism
Wudase Maryam, ni denegl yilal

VERSE 11
Wudase Maryam, bewerk zufan lay
Wudase Maryam, teqemtesh sayish
Wudase Maryam, libe tesewere
Wudase Maryam, denegl begirmash

VERSE 12
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 13
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign

VERSE 14
Wudase Maryam, echohalew
Denegl enaten eteralew
Ende Aba Efram ney barqign
Wedeseni lije beyign'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'wudase-maryam-echohalew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Xewani Goytay (xewani-goytay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 1
ሓጢኣት እና ለቀምኩ ሰሃራ በጺሐ
ስጋይ ንኸጥልል ርኽሰት ተለቒሐ
ዝ''ሩባ ድነ ሞት ዘስጥም ታኼላ
መዓስ ኣጥሊሉኒ ነፍሰይ ተቓጺላ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 2
ኣበኽራናት ትደልየኒ''ለካ ሰሚዐ
በዚ''ለኹ ዝዓወረ ልበይ እንዳ ነበዐ
ክሃድኣለይ ንልበይ ዝምሽት ንፋስ ኣውሎ
ኣድህየኒ ኦ ጎይታይ ኢየሱስ ሕጂ ተሎ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 3
ብደም ዝተጠርየ ውርሻይ ዓዲለ
የንጀርብበኒ''ሎ ሕሰም በብእብረ
ቆሲሉ ኣእጋረይ ጉዕዞይ ኣቃሪጸ
ይጽበይ ኣለኩ ፍትወይ እንተመጸ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 4
ኣብ ገዛና ክንደይ ጽጋብ እሞ ዘይሓለፈ
ናፊቀ ኣቦይ ከም ጊላካ ክቑጸር ሃሪፈ
ደንግጸለይ ውሉድካ ክበሃል ዘይበቅዕ
ኣድህየኒ መጥፍአይ ካብ ቤትና ከብቅዕ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 5
ነገር ሰብ''ዩ ዝብሎ ወልፊ ሓጢኣተይ
ርስተይ መንጢሉኒ እንታይ ሓዲጉለይ
ምስ ክሱስ ሕልናይ ኣብ ቅድሚ ሓቅካ
ከመይለ ክቀውም ኣርኪሰ ፍቕርና

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 6
መሃናየ መዓስ መኒንካዮም ጠፍኤ እምበር
በዚ''ለኩ ዕርቃነይ ረዲኤትካ ይሃርር
ንጽድቅኻ ልብሰይ ንኽገብሮ ተፈዊሰ
ኣድህየኒ ውሽጠይ ብጸላኢ ከይተወርሰ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)',
      lyrics_transliteration = 'CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 1
Hat’iat ena leqemku sehara bets’ihe
Sigay niኸt’ll riኽset teleቒhe
Z''ruba dine mot zest’m taኼla
Meas at’liluni nefsey teቓts’ila

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 2
Abeኽranat tidelyeni''leka semia
Bezi''leኹ ziawere libey enda nebea
Kihadaley nilbey zimsht nifas awlo
Adhyeni o goytay Iyesus hiji telo

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 3
Bidem zitet’erye wirshay adile
Yenjerbbeni''lo hisem bebebre
Qosilu aegarey guezoy aqarits’e
Yits’bey aleku fitwey entemets’e

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 4
Ab gezana kindey ts’gab emo zeyhalefe
Nafiqe aboy kem gilaka kiቑts’er harife
Dengts’eley wiludka kibehal zeybeqe
Adhyeni met’fay kab betna kebqe

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 5
Neger seb''yu ziblo welfi hat’iatey
Ristey ment’iluni entay hadiguley
Mis kisus hilnay ab qidmi haqka
Kemeyle kiqewm arkise fiቕrna

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 6
Mehanaye meas meninkayom t’efe ember
Bezi''leku erqaney redietka yiharr
Nits’dqኻ libsey niኽgebro tefewise
Adhyeni wisht’ey bits’elai keytewerse

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'xewani-goytay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 1
ሓጢኣት እና ለቀምኩ ሰሃራ በጺሐ
ስጋይ ንኸጥልል ርኽሰት ተለቒሐ
ዝ''ሩባ ድነ ሞት ዘስጥም ታኼላ
መዓስ ኣጥሊሉኒ ነፍሰይ ተቓጺላ

VERSE 2
ኣበኽራናት ትደልየኒ''ለካ ሰሚዐ
በዚ''ለኹ ዝዓወረ ልበይ እንዳ ነበዐ
ክሃድኣለይ ንልበይ ዝምሽት ንፋስ ኣውሎ
ኣድህየኒ ኦ ጎይታይ ኢየሱስ ሕጂ ተሎ

VERSE 3
ብደም ዝተጠርየ ውርሻይ ዓዲለ
የንጀርብበኒ''ሎ ሕሰም በብእብረ
ቆሲሉ ኣእጋረይ ጉዕዞይ ኣቃሪጸ
ይጽበይ ኣለኩ ፍትወይ እንተመጸ

VERSE 4
ኣብ ገዛና ክንደይ ጽጋብ እሞ ዘይሓለፈ
ናፊቀ ኣቦይ ከም ጊላካ ክቑጸር ሃሪፈ
ደንግጸለይ ውሉድካ ክበሃል ዘይበቅዕ
ኣድህየኒ መጥፍአይ ካብ ቤትና ከብቅዕ

VERSE 5
ነገር ሰብ''ዩ ዝብሎ ወልፊ ሓጢኣተይ
ርስተይ መንጢሉኒ እንታይ ሓዲጉለይ
ምስ ክሱስ ሕልናይ ኣብ ቅድሚ ሓቅካ
ከመይለ ክቀውም ኣርኪሰ ፍቕርና

VERSE 6
መሃናየ መዓስ መኒንካዮም ጠፍኤ እምበር
በዚ''ለኩ ዕርቃነይ ረዲኤትካ ይሃርር
ንጽድቅኻ ልብሰይ ንኽገብሮ ተፈዊሰ
ኣድህየኒ ውሽጠይ ብጸላኢ ከይተወርሰ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 1
Hat’iat ena leqemku sehara bets’ihe
Sigay niኸt’ll riኽset teleቒhe
Z''ruba dine mot zest’m taኼla
Meas at’liluni nefsey teቓts’ila

VERSE 2
Abeኽranat tidelyeni''leka semia
Bezi''leኹ ziawere libey enda nebea
Kihadaley nilbey zimsht nifas awlo
Adhyeni o goytay Iyesus hiji telo

VERSE 3
Bidem zitet’erye wirshay adile
Yenjerbbeni''lo hisem bebebre
Qosilu aegarey guezoy aqarits’e
Yits’bey aleku fitwey entemets’e

VERSE 4
Ab gezana kindey ts’gab emo zeyhalefe
Nafiqe aboy kem gilaka kiቑts’er harife
Dengts’eley wiludka kibehal zeybeqe
Adhyeni met’fay kab betna kebqe

VERSE 5
Neger seb''yu ziblo welfi hat’iatey
Ristey ment’iluni entay hadiguley
Mis kisus hilnay ab qidmi haqka
Kemeyle kiqewm arkise fiቕrna

VERSE 6
Mehanaye meas meninkayom t’efe ember
Bezi''leku erqaney redietka yiharr
Nits’dqኻ libsey niኽgebro tefewise
Adhyeni wisht’ey bits’elai keytewerse'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'xewani-goytay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ya Deha Tetara (ya-deha-tetara)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ya-deha-tetara'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያ ደሃ ተጣራ አግዚአብሔርን ሰማው
ደርሶ ስላንኳኳ ከፅባኦት አንባው
አምላክ በቸርነት በምህረት ጎበኘው
ባለቀሰ ጊዜ ግራ የገባው ሰው

VERSE 1
መሻትህ ብቻ ነው የሚፈልግብህ
እግዚአብሔርን ጥራ እመን ትድናለህ

VERSE 2
ንገረው ችግርህን የዉስጥህን ብሶት
ይሽረዋልና አስፈሬውን ሕይወት
ግራ የተጋባው የተከፋው ገፅህ
ይበራል በፀሎት አምላክህን ጠርተህ

VERSE 3
ለወገን ለዘመድ ያስቸገረው መላ
ሲቀል ታየዋለህ ካነባህ በሃላ
ሳግና ንዴትህ ይቀራል ይሻራል
በአርሱ ፋንታ ሰላም ፍቅር ይከብሃል

VERSE 4
በከንቱ መጨነቅ ራስን መጥላቱ
ነዉና የአጋንንት መግብያ ምልክቱ
ሐዘን በሕሊናህ በፈሰሰ ጊዜ
ንገረው ለአምላክህ የልብህ ትካዜ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ya deha tetara Egziabhierin semaw
Derso silankwakwa ketsebaot anbaw
Amlak becherinet bemihret gobenyew
Baleqese gize gira yegebaw sew

VERSE 1
Meshatih bicha new yemifeligibih
Egziabhierin tira amen tidinaleh

VERSE 2
Nigerew chigirihin yewostihin bisot
Yishirewalina asferiwun hiywot
Gira yetegabaw yetekefaw getsih
Yiberal betsilot Amlakihin terteh

VERSE 3
Lewogen lezemed yaschegerew mela
Siqel tayewaleh kanebah behala
Sagina nidetih yiqeral yisharal
Be-irsu fanta selam fiqir yikebihal

VERSE 4
Bekent mecheneq rasin metlatu
Newina ye aganint megbiya milkitu
Hazen behilinah befesese gize
Nigerew le-Amlakih yelibih tikaze'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ya-deha-tetara', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ya Diha Tetara (ya-diha-tetara)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 1
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 2
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 3
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 4
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 5
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 6
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 7
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 8
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 9
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 10
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 11
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 12
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 13
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 14
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 15
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 16
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 17
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 18
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 19
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 20
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 21
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 22
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 23
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው',
      lyrics_transliteration = 'CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 1
Amlak bechernet
Bemhret gobegnew
Baleqese gize
Gera yegebaw sew

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 2
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 3
Negeru chgr gin
Yewst’h hiswt
Yisherewalna
Asferiw hiywet

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 4
Gera yet’eqabaw
Yetekefaw gets’
Yiberal bets’elot
Amlakn t’erteh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 5
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 6
Lewegen lezemedh
Yaschegerew mela
Siqelt’ tayewaleh
Kanebah behwalwa

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 7
Sagena nideth
Yiqeral yisharal
Beersu fenta selam
Fiqr yigebhal

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 8
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 9
Bekentu mech’eneq
Rashn met’lath
Newna yeagannt
Megbiya milktu

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 10
Hezen bel yinhe
Befsese gize
Nigerew leamlakh
Yelbhn tikaze

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 11
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 12
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 13
Amlak bechernet
Bemhret gobegnew
Baleqese gize
Gera yegebaw sew

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 14
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 15
Negeru chgr gin
Yewst’h hiswt
Yisherewalna
Asferiw hiywet

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 16
Gera yet’eqabaw
Yetekefaw gets’
Yiberal bets’elot
Amlakn t’erteh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 17
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 18
Lewegen lezemedh
Yaschegerew mela
Siqelt’ tayewaleh
Kanebah behwalwa

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 19
Sagena nideth
Yiqeral yisharal
Beersu fenta selam
Fiqr yigebhal

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 20
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 21
Bekentu mech’eneq
Rashn met’lath
Newna yeagannt
Megbiya milktu

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 22
Hezen bel yinhe
Befsese gize
Nigerew leamlakh
Yelbhn tikaze

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 23
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ya-diha-tetara'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 1
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

VERSE 2
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

VERSE 3
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

VERSE 4
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

VERSE 5
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

VERSE 6
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

VERSE 7
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

VERSE 8
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

VERSE 9
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

VERSE 10
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

VERSE 11
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

VERSE 12
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 13
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

VERSE 14
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

VERSE 15
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

VERSE 16
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

VERSE 17
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

VERSE 18
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

VERSE 19
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

VERSE 20
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

VERSE 21
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

VERSE 22
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

VERSE 23
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 1
Amlak bechernet
Bemhret gobegnew
Baleqese gize
Gera yegebaw sew

VERSE 2
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

VERSE 3
Negeru chgr gin
Yewst’h hiswt
Yisherewalna
Asferiw hiywet

VERSE 4
Gera yet’eqabaw
Yetekefaw gets’
Yiberal bets’elot
Amlakn t’erteh

VERSE 5
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

VERSE 6
Lewegen lezemedh
Yaschegerew mela
Siqelt’ tayewaleh
Kanebah behwalwa

VERSE 7
Sagena nideth
Yiqeral yisharal
Beersu fenta selam
Fiqr yigebhal

VERSE 8
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

VERSE 9
Bekentu mech’eneq
Rashn met’lath
Newna yeagannt
Megbiya milktu

VERSE 10
Hezen bel yinhe
Befsese gize
Nigerew leamlakh
Yelbhn tikaze

VERSE 11
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

VERSE 12
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 13
Amlak bechernet
Bemhret gobegnew
Baleqese gize
Gera yegebaw sew

VERSE 14
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

VERSE 15
Negeru chgr gin
Yewst’h hiswt
Yisherewalna
Asferiw hiywet

VERSE 16
Gera yet’eqabaw
Yetekefaw gets’
Yiberal bets’elot
Amlakn t’erteh

VERSE 17
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

VERSE 18
Lewegen lezemedh
Yaschegerew mela
Siqelt’ tayewaleh
Kanebah behwalwa

VERSE 19
Sagena nideth
Yiqeral yisharal
Beersu fenta selam
Fiqr yigebhal

VERSE 20
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

VERSE 21
Bekentu mech’eneq
Rashn met’lath
Newna yeagannt
Megbiya milktu

VERSE 22
Hezen bel yinhe
Befsese gize
Nigerew leamlakh
Yelbhn tikaze

VERSE 23
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ya-diha-tetara', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yadanegn Awqewalew (yadanegn-awqewalew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 1
ጭለማዬን አስወግዶ
ያበራልኝን አውቃለሁ
ሙሉ ሰው ነኝ ከንግዲህስ
ስከተለው እኖራለሁ

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 2
የብርሃኔን ልዩ ውበት
ፊት ለፊቴ ቆሞ አየሁት
ፍቅሩ ማርኮኝ
በመቅደሱ ሰገድኩለት አመለኩት

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 3
ላመስግነው ላመስግነው ላመስግነው
ፍቅሩ ማያልቅ ነው (2)

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 4
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 5
አሳደረኝ በእቅፉ
መጠውለጌን አለምልሞ
በመስቀል ላይ ተሰቀለ
ዳንኩኝ እኔ እርሱ ታሞ

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 6
በማይዝለው ክንዶቹ ላይ
እኔን በክብር እያኖረ
እንዲመቸኝ ዝቅ ብሎ
በበረት ውስጥ እርሱ አደረ

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 7
ላመስግነው ላመስግነው ላመስግነው
ፍቅሩ ማያልቅ ነው (2)

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 8
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 9
ቅኔ ባፈስ ምን ይደንቃል
ደሙን በመስቀል አፍስሶ
ስለ ልጁ መዳን ብሎ
ነፍሱን ሳይቀር ለኔ ክሶ

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 10
ፍቅር ይዞት ከጸባኦት
በትህትና ወቶ ወርዶ
ተቀደስኩኝ በነጩ በግ
ቀራንዮ ጌታ ታርዶ

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 11
ላመስግነው ላመስግነው ላመስግነው
ፍቅሩ ማያልቅ ነው (2)

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 12
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 13
አክሊል ከሶ አጠለቀ
ግርማ ክብሩን ሁሉ ትቶ
አሻገረኝ ወደ ክብሬ
በቅዱስ ደም እኔን ዋጅቶ

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 14
አጎንብሶ ቀና አረገኝ
ፊቴን በጽድቅ እያበረ
እኖራለሁ ለዘለአለም
ካከበረኝ ጌታ ጋራ

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 15
ላመስግነው ላመስግነው ላመስግነው
ፍቅሩ ማያልቅ ነው (2)

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 16
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

CHORUS
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው',
      lyrics_transliteration = 'CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 1
Chilemayen aswogido
Yaberalignin awqalew
Mulu sew negne kengidihis

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 2
Siketilew enoralew
Yebirhanen liyu wubet
Fit lefite qomo ayehut
Fiqru markogne

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 3
Bemeqdesu segedkulet amelekut
Lamisginew lamisginew lamisginew
Fiqru mayalq new (2)

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 4
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 5
Asaderigne be-iqfu
Metowlegene alemilimo
Bemesqel lay teseqele

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 6
Dankugne ene ersu tamo
Bemayizilew kindochu lay
Enen bekibir eyanore
Endimechegn ziq bilo

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 7
Beberet wust ersu adere
Lamisginew lamisginew lamisginew
Fiqru mayalq new (2)

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 8
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 9
Qine bafes min yidenqal
Demun bemesqel afsiso
Sile liju medan bilo

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 10
Nefsun sayqer lene kiso
Fiqir yizot ketsebaot
Betitina woto werdo
Teqedeskugne benechu beg

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 11
Qeraniyo Geta tardo
Lamisginew lamisginew lamisginew
Fiqru mayalq new (2)

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 12
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 13
Aklil keso ateleqe
Girma kibrun hulu tito
Ashagerigne wede kibre

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 14
Beqidusi dem enen wajito
Agonbiso qena aregegn
Fiten betsidq eyabere
Enoralew lezelea-lem

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 15
Kakiberegn Geta gara
Lamisginew lamisginew lamisginew
Yadanegne awqewalew

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 16
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

CHORUS
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yadanegn-awqewalew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 1
ጭለማዬን አስወግዶ
ያበራልኝን አውቃለሁ
ሙሉ ሰው ነኝ ከንግዲህስ
ስከተለው እኖራለሁ

VERSE 2
የብርሃኔን ልዩ ውበት
ፊት ለፊቴ ቆሞ አየሁት
ፍቅሩ ማርኮኝ
በመቅደሱ ሰገድኩለት አመለኩት

VERSE 3
ላመስግነው ላመስግነው ላመስግነው
ፍቅሩ ማያልቅ ነው (2)

VERSE 4
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 5
አሳደረኝ በእቅፉ
መጠውለጌን አለምልሞ
በመስቀል ላይ ተሰቀለ
ዳንኩኝ እኔ እርሱ ታሞ

VERSE 6
በማይዝለው ክንዶቹ ላይ
እኔን በክብር እያኖረ
እንዲመቸኝ ዝቅ ብሎ
በበረት ውስጥ እርሱ አደረ

VERSE 7
ላመስግነው ላመስግነው ላመስግነው
ፍቅሩ ማያልቅ ነው (2)

VERSE 8
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 9
ቅኔ ባፈስ ምን ይደንቃል
ደሙን በመስቀል አፍስሶ
ስለ ልጁ መዳን ብሎ
ነፍሱን ሳይቀር ለኔ ክሶ

VERSE 10
ፍቅር ይዞት ከጸባኦት
በትህትና ወቶ ወርዶ
ተቀደስኩኝ በነጩ በግ
ቀራንዮ ጌታ ታርዶ

VERSE 11
ላመስግነው ላመስግነው ላመስግነው
ፍቅሩ ማያልቅ ነው (2)

VERSE 12
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው

VERSE 13
አክሊል ከሶ አጠለቀ
ግርማ ክብሩን ሁሉ ትቶ
አሻገረኝ ወደ ክብሬ
በቅዱስ ደም እኔን ዋጅቶ

VERSE 14
አጎንብሶ ቀና አረገኝ
ፊቴን በጽድቅ እያበረ
እኖራለሁ ለዘለአለም
ካከበረኝ ጌታ ጋራ

VERSE 15
ላመስግነው ላመስግነው ላመስግነው
ፍቅሩ ማያልቅ ነው (2)

VERSE 16
ያዳነኝን አውቀዋለው
የሞተልኝ ኢየሱስ ነው
ስለሌለኝ የምከፍለው
ስጦታዬ ምስጋና ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 1
Chilemayen aswogido
Yaberalignin awqalew
Mulu sew negne kengidihis

VERSE 2
Siketilew enoralew
Yebirhanen liyu wubet
Fit lefite qomo ayehut
Fiqru markogne

VERSE 3
Bemeqdesu segedkulet amelekut
Lamisginew lamisginew lamisginew
Fiqru mayalq new (2)

VERSE 4
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 5
Asaderigne be-iqfu
Metowlegene alemilimo
Bemesqel lay teseqele

VERSE 6
Dankugne ene ersu tamo
Bemayizilew kindochu lay
Enen bekibir eyanore
Endimechegn ziq bilo

VERSE 7
Beberet wust ersu adere
Lamisginew lamisginew lamisginew
Fiqru mayalq new (2)

VERSE 8
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 9
Qine bafes min yidenqal
Demun bemesqel afsiso
Sile liju medan bilo

VERSE 10
Nefsun sayqer lene kiso
Fiqir yizot ketsebaot
Betitina woto werdo
Teqedeskugne benechu beg

VERSE 11
Qeraniyo Geta tardo
Lamisginew lamisginew lamisginew
Fiqru mayalq new (2)

VERSE 12
Yadanegne awqewalew
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new

VERSE 13
Aklil keso ateleqe
Girma kibrun hulu tito
Ashagerigne wede kibre

VERSE 14
Beqidusi dem enen wajito
Agonbiso qena aregegn
Fiten betsidq eyabere
Enoralew lezelea-lem

VERSE 15
Kakiberegn Geta gara
Lamisginew lamisginew lamisginew
Yadanegne awqewalew

VERSE 16
Yemoteligne Eyesus new
Silelelegne yemikeflew
Sitotaye misgana new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yadanegn-awqewalew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yadanegnen Awkewalehu (yadanegnen-awkewalehu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

VERSE 1
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();',
      lyrics_transliteration = 'CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

VERSE 1
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yadanegnen-awkewalehu'
    AND lyrics_amharic IS NOT DISTINCT FROM '(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

VERSE 1
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();'
    AND lyrics_transliteration IS NOT DISTINCT FROM '(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

VERSE 1
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yadanegnen-awkewalehu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: yalante geta desta mech ale (yalante-geta-desta-mech-ale)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yalante-geta-desta-mech-ale'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያላንተ ጌታ ደስታ መች አለ
ያላንተ አምላኬ ህይወት አመች አለ
ስምህን ጠርቶ የተማፀነ
ከእሳቱም ወጣ ከሞትም ዳነ

VERSE 1
እጆቼን ይዘህ አንተ እየመራ
ስንቱን አለፍኩት ስንቱን መከራ
ለካ ሲያልፍ ቀን ሁሉም ይረሳል
ረሀብ ስደቱን ማን ያስታውሳል

VERSE 2
ፅዋዬን ባርከክ ተትረፈረፈ
የጠላቴም ጦር በላዬ አለፈ
በሺህ ቃላቶች አፌን ሞልቼ
ልዘምርልኽ ጉያኽ ገብቼ

VERSE 3
ገዳዬ ቢሮጥ በቀን በማታ
እያለ አንድዬ እያለ ጌታ
ለሞት አልተኛም ይደነቃል
ተክሎኛልና ለዘለአለም

VERSE 4
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለው በእልልታ ቤቴን

VERSE 5
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ
አላቀረቅር አልደፋ አንገቴን
እሞላዋለሁ በእልልታ ቤቴን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yalante Geta desta mech ale
Yalante amlake hiywet amech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane

VERSE 1
Ejochen yizeh ante eyemera
Sintun alefkut sintun mekera
Leka siyalf qen hulum yiresal
Reheb sidetun man yastawsal

VERSE 2
Ts’wayen barkek tetreferefe
Yet’elatem t’or belaye alefe
Beshih qalatoch afen molche
Lizemrlኽ guyaኽ gebche

VERSE 3
Gedaye birot’ beqen bemata
Eyale andye eyale Geta
Lemot altegnam yideneqal
Teklognalna lezelealem

VERSE 4
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e
Alaqereqr aldefa angeten
Emolawalew beellta beten

VERSE 5
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e
Alaqereqr aldefa angeten
Emolawalehu beellta beten'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yalante-geta-desta-mech-ale', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yalante Man Asebognal (yalante-man-asebognal)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yalante-man-asebognal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያላንተ ማን አስቦኛል
ካንተ በቀር ማን እረድቶኛል
ክብሬ ኢየሱስ ላመስግንህ
ለዘላለም መጠጊያዬ ነህ

VERSE 1
ሰው ለመዳን ሺቅዳደም
ሁሉም ሲያልፈኝ አጥቼ አቅም
ሰው የለኝም ስል ስትሰማ
ጌታ ክንድህ ሆነኝ ግርማ

VERSE 2
ቤተሳይዳ ቤቴ አይደለች
ነብሴ ጣትክን ተማመነች
ባንተ አልጋዬን ተሸክሜ
አሳረፍከኝ ከሕመሜ

VERSE 3
አስታዋሽ ነህ ለተረሳው
አጉራሹ ነህ ለተራበው
ከደጃፌ ስትመጣ
የዘንዶው ቃል ጉልበት አጣ

VERSE 4
ስንት ጊዜ አወጣኸኝ
የአይኔን እንባ አበስክልኝ
አቤት ፍቅር አቤት ምህረት
ቋንቋ ቃላት የማይገልጹት

VERSE 5
የተተወ በወገኑ
ምን ቢያነባ በዘመኑ
ወዳጅ ያሉት ሲሄድ ሸሽቶ
ስትዳስሰው ቆመ ጸንቶ

VERSE 6
ጥልቁ ኑሮ ተሸበረ
የሞት ዘንጉ ተሰበረ
ማርዳዬ ነህ ጌጥ ላንገቴ
ታየሁብህ ሰገነቴ

VERSE 7
በህሊና ታላቅ ስደት
የተመታ ነ ያሰረው ሞት
ያየኸው ለት ተፈወሰ
በደስታ ተመለሰ

VERSE 8
የነጠከው ከሞት መንገድ
የሰጠኸው ታላቅ ታላቅ ክብር
ሌላ አይደለም ይኽ ልቤ ነው
ንገስበት ዙፋንህ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yalante man asbognal
Kante beqer man eredtognal
Kibre Iyesus lamesgnh
Lezelalem met’egiyaye neh

VERSE 1
Sew lemedan shiqdadem
Hulum siyalfegn at’che aqm
Sew yelegnm sil sitsema
Geta kindh honegn girma

VERSE 2
Betesayda bete aydelech
Nebse t’atkn temamenech
Bante algayen teshekme
Asarefkegn kehmeme

VERSE 3
Astawash neh leteresaw
Agurashu neh leterabew
Kedejafe sitmet’a
Yezendow qal gulbet at’a

VERSE 4
Sint gize awet’aኸgn
Yeaynen enba abesklgn
Abet fiqr abet mihret
Qwanqwa qalat yemaygelts’ut

VERSE 5
Yetetewe bewegenu
Min biyaneba bezemenu
Wedaj yalut sihed sheshto
Sitdassew qome ts’ento

VERSE 6
T’lqu nuro teshebere
Yemot zengu tesebere
Mardaye neh get’ langete
Tayehubh segenete

VERSE 7
Behlina talaq sidet
Yetemeta ne yaserew mot
Yayeኸw let tefewese
Bedesta temelese

VERSE 8
Yenet’ekew kemot menged
Yeset’eኸw talaq talaq kibir
Lela aydelem yiኽ libe new
Nigesbet zufanh new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yalante-man-asebognal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yante Lihun Deacon Bisrat Teshome (yante-lihun-deacon-bisrat-teshome)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yante-lihun-deacon-bisrat-teshome'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያንተ ልሁን ብቻ ባይቀናም ጉዞዬ
ያንተ ልሁን ብቻ ባይሞላም ጓዳዬ
ያንተ ልሁን ብቻ ባይሰምርም መሻቴ
ለጥያቄዬ መልስ ቀን አለህ አባቴ

VERSE 1
እጠብቅሃለው አላጉረመርምም
መፃጉን አይቼ ከቶ አላማህም
ትመጣለህ ጌታ አታጥፍም ቃልህን
አትዘገይም አንተ ታውቃለህ ስራህን

VERSE 2
ለይስሐቅ ስም ሆነው የሳራ ፈገግታ
ቤቷ ተከደነ በዘላለም ደስታ
ነገር ስትለውጥ ስትቀይር እንዲህ ነው
ውብ ታደርገዋለህ ሁሉንም በጊዜው

VERSE 3
አባትነትህን ከዓለም ያስበለጡ
ምልክት ሳይሹ በእምነት ተለወጡ
ማድጋውን ሳይሆን ፍቅርህን እያዩ
መከራን ታግሰው ከፍ ብለው ታዩ

VERSE 4
የኔ ያልኩት ነገር ከእጄ ቢበተን
ተስፋ ያደረኩት ሁሉ ከንቱ ቢሆን
እኔ አላማርርም ለአመፅ አልነሳ
አንተ የሰጠኽኝን አንተ ስትነሳ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yante lihun bicha bayqenam guzoye
Yante lihun bicha baymolam gwadaye
Yante lihun bicha baysemrm meshate
Let’yaqeye mels qen aleh abate

VERSE 1
Et’ebqhalew alaguremermm
Mets’agun ayche keto alamahm
Timet’aleh Geta atat’fm qalhn
Atzegeym ante tawqaleh sirahn

VERSE 2
Leysheq sim honew yesara fegegta
Betwa tekedene bezelalem desta
Neger sitlewt’ sitqeyr endih new
Wib tadergewaleh hulunm begizew

VERSE 3
Abatnethn kealem yasbelet’u
Milkt sayshu beemnet telewet’u
Madgawn sayhon fiqrhn eyayu
Mekeran tagsew kef bilew tayu

VERSE 4
Yene yalkut neger keeje bibeten
Tesfa yaderekut hulu kentu bihon
Ene alamarrm leamets’ alnesa
Ante yeset’eኽgnn ante sitnesa'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yante-lihun-deacon-bisrat-teshome', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yared Kahenu zemre (yared-kahenu-zemre)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 1
ማኅሌት ጀመረ ያሬድ ዘመረ
ዜማውን ከመልእክት እያስተባበረ
ምስጋና አቀረበ ያሬድ ዘመረ
በዜማ መሣሪያ ያሬድ ዘመረ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 2
ጸናጽል አነሳ ከበሮ መቋሚያ
አዝ
በግዕዝ በዕዝል ያሬድ ዘመረ
በአራራይ ዜማ ያሬድ ዘመረ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 3
ከብሉይ ከሐዲስ ምስጢር እያስማማ
በዜማው ምልክት ያሬድ ዘመረ
የአምላክን መከራ ያሬድ ዘመረ
የመስቀሉን ነገር የማዳኑን ስራ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 4
አዝ
ደሙ እየፈለቀ ያሬድ ዘመረ
በጦር ተወግቶ ያሬድ ዘመረ
ሊቁ ማኅሌታይ በመንፈስ ተቃኝቶ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 5
በጥዑም ልሳኑ ያሬድ ዘመረ
በተሰጠው ጸጋ ያሬድ ዘመረ
ለንጉሥ እግዚአብሔር ለአልፋ ዖሜጋ
አዝ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 6
ድጓ ጾመድጓ ያሬድ ዘመረ
ምዕራፍ መዋሲት ያሬድ ዘመረ
ምሥጢር ተገልጦለት በሰማይ መላእክት
የዜማ መሠረት ያሬድ ዘመረ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 7
ተንበለ ዝማሬ ያሬድ ዘመረ
የኢትዮጲያ ኩራት የተዋህዶ ፍሬ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ',
      lyrics_transliteration = 'CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 1
Mahlet jemere yared zemere
Zemawn kemelekt eyastebabere
Misgana aqerebe yared zemere
Bezema mesariya yared zemere

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 2
Ts’enats’l anesa kebero meqwamiya
CHORUS
Begez beezl yared zemere
Beararay zema yared zemere

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 3
Kebluy kehedis mist’ir eyasmama
Bezemaw milkt yared zemere
Yeamlakn mekera yared zemere
Yemesqelun neger yemadanun sira

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 4
CHORUS
Demu eyefeleqe yared zemere
Bet’or tewegto yared zemere
Liqu mahletay bemenfes teqagnto

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 5
Bet’um lisanu yared zemere
Beteset’ew ts’ega yared zemere
Lengus Egziabher lealfa omega
CHORUS

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 6
Digwa ts’omedgwa yared zemere
Mieraf mewasit yared zemere
Mist’ir tegelt’olet besemay melaekt
Yezema meseret yared zemere

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 7
Tenbele zimare yared zemere
Yeityop’iya kurat yetewahdo fire

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yared-kahenu-zemre'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 1
ማኅሌት ጀመረ ያሬድ ዘመረ
ዜማውን ከመልእክት እያስተባበረ
ምስጋና አቀረበ ያሬድ ዘመረ
በዜማ መሣሪያ ያሬድ ዘመረ

VERSE 2
ጸናጽል አነሳ ከበሮ መቋሚያ
በግዕዝ በዕዝል ያሬድ ዘመረ
በአራራይ ዜማ ያሬድ ዘመረ

VERSE 3
ከብሉይ ከሐዲስ ምስጢር እያስማማ
በዜማው ምልክት ያሬድ ዘመረ
የአምላክን መከራ ያሬድ ዘመረ
የመስቀሉን ነገር የማዳኑን ስራ

VERSE 4
ደሙ እየፈለቀ ያሬድ ዘመረ
በጦር ተወግቶ ያሬድ ዘመረ
ሊቁ ማኅሌታይ በመንፈስ ተቃኝቶ

VERSE 5
በጥዑም ልሳኑ ያሬድ ዘመረ
በተሰጠው ጸጋ ያሬድ ዘመረ
ለንጉሥ እግዚአብሔር ለአልፋ ዖሜጋ

VERSE 6
ድጓ ጾመድጓ ያሬድ ዘመረ
ምዕራፍ መዋሲት ያሬድ ዘመረ
ምሥጢር ተገልጦለት በሰማይ መላእክት
የዜማ መሠረት ያሬድ ዘመረ

VERSE 7
ተንበለ ዝማሬ ያሬድ ዘመረ
የኢትዮጲያ ኩራት የተዋህዶ ፍሬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 1
Mahlet jemere yared zemere
Zemawn kemelekt eyastebabere
Misgana aqerebe yared zemere
Bezema mesariya yared zemere

VERSE 2
Ts’enats’l anesa kebero meqwamiya
Begez beezl yared zemere
Beararay zema yared zemere

VERSE 3
Kebluy kehedis mist’ir eyasmama
Bezemaw milkt yared zemere
Yeamlakn mekera yared zemere
Yemesqelun neger yemadanun sira

VERSE 4
Demu eyefeleqe yared zemere
Bet’or tewegto yared zemere
Liqu mahletay bemenfes teqagnto

VERSE 5
Bet’um lisanu yared zemere
Beteset’ew ts’ega yared zemere
Lengus Egziabher lealfa omega

VERSE 6
Digwa ts’omedgwa yared zemere
Mieraf mewasit yared zemere
Mist’ir tegelt’olet besemay melaekt
Yezema meseret yared zemere

VERSE 7
Tenbele zimare yared zemere
Yeityop’iya kurat yetewahdo fire'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yared-kahenu-zemre', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yasalefikut (yasalefikut)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 1
አንደበቴም በል ተፈታ ስለ ጽዮን ለመመስከር
ዘምርላት አመስግናት አውጅ ለዓለም ግለጥ ንገር
ትውልድ ይስማ ስለክብሯ ለምስጋና ይታደም
ማርያም(፪)የሚላትም ድንግል ፍጹም አትረሳም

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 2
መልካሞችም ተሰብሰቡ ጽድቅን ማፍራት ያቃታችሁ
ማሰሮዋ ጨው ይዛለች ሊወገድ ነው መርገማችሁ
መረጋጋት ያቃታችሁ የዳዊት ልጅ ታጽናናችሁ
መሰንቆ ናት ድንግል ማርያም ድምጿ ፈውስን ያድላችሁ

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 3
የሞትን ድምጽ ውስጤ ሰምቶ ተጨንቄ ግራ ገብቶኝ
ማምለጫውን መሸሸጊያ እንዴት እንደሆን እንኳጠፍቶኝ
ብቻየን ነኝ ድረሽልኝ ብየሽ ነበር በጭንቀቴ
አልተውሽኝም ፈጥነሽ ደርሰሽ አወጣሽኝ እመቤቴ

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 4
ንግስቲቱ የወርቅ ልብስ ተጎናጽፋ ተሸልማ
በንጉሱ በልጇ ቀኝ የአምላክ እናት በክብርቆማ
ቃልኪዷኗን አሳስባለች ሀጥአንን ልታስምር
በጽናጽል በከበሮ እናመስግን እንዘምር።

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን',
      lyrics_transliteration = 'CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 1
Andebetem bel tefeta sile ts’yon lememesker
Zemrlat amesgnat awj lealem gilet’ niger
Tiwld yisma silekbrwa lemsgana yitadem
Maryam (2)yemilatm Dingil fits’um atresam

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 2
Melkamochm tesebsebu ts’dqn mafrat yaqatachhu
Maserowa ch’ew yizalech liweged new mergemachhu
Meregagat yaqatachhu yedawit lij tats’nanachhu
Mesenqo nat Dingil Maryam dimts’wa fewsn yadlachhu

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 3
Yemotn dimts’ wist’e semto tech’enqe gira gebtogn
Mamlech’awn mesheshegiya endet endehon enkwat’eftogn
Bichayen negn direshlgn biyesh neber bech’nqete
Altewshgnm fet’nesh dersesh awet’ashgn Emebete

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 4
Nigstitu yewerq libs tegonats’fa teshelma
Bengusu beljwa qegn yeamlak enat bekbrqoma
Qalkidwanwan asasbalech het’ann litasmr
Bets’nats’l bekebero enamesgn enzemr.

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yasalefikut'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 1
አንደበቴም በል ተፈታ ስለ ጽዮን ለመመስከር
ዘምርላት አመስግናት አውጅ ለዓለም ግለጥ ንገር
ትውልድ ይስማ ስለክብሯ ለምስጋና ይታደም
ማርያም(፪)የሚላትም ድንግል ፍጹም አትረሳም

VERSE 2
መልካሞችም ተሰብሰቡ ጽድቅን ማፍራት ያቃታችሁ
ማሰሮዋ ጨው ይዛለች ሊወገድ ነው መርገማችሁ
መረጋጋት ያቃታችሁ የዳዊት ልጅ ታጽናናችሁ
መሰንቆ ናት ድንግል ማርያም ድምጿ ፈውስን ያድላችሁ

VERSE 3
የሞትን ድምጽ ውስጤ ሰምቶ ተጨንቄ ግራ ገብቶኝ
ማምለጫውን መሸሸጊያ እንዴት እንደሆን እንኳጠፍቶኝ
ብቻየን ነኝ ድረሽልኝ ብየሽ ነበር በጭንቀቴ
አልተውሽኝም ፈጥነሽ ደርሰሽ አወጣሽኝ እመቤቴ

VERSE 4
ንግስቲቱ የወርቅ ልብስ ተጎናጽፋ ተሸልማ
በንጉሱ በልጇ ቀኝ የአምላክ እናት በክብርቆማ
ቃልኪዷኗን አሳስባለች ሀጥአንን ልታስምር
በጽናጽል በከበሮ እናመስግን እንዘምር።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 1
Andebetem bel tefeta sile ts’yon lememesker
Zemrlat amesgnat awj lealem gilet’ niger
Tiwld yisma silekbrwa lemsgana yitadem
Maryam (2)yemilatm Dingil fits’um atresam

VERSE 2
Melkamochm tesebsebu ts’dqn mafrat yaqatachhu
Maserowa ch’ew yizalech liweged new mergemachhu
Meregagat yaqatachhu yedawit lij tats’nanachhu
Mesenqo nat Dingil Maryam dimts’wa fewsn yadlachhu

VERSE 3
Yemotn dimts’ wist’e semto tech’enqe gira gebtogn
Mamlech’awn mesheshegiya endet endehon enkwat’eftogn
Bichayen negn direshlgn biyesh neber bech’nqete
Altewshgnm fet’nesh dersesh awet’ashgn Emebete

VERSE 4
Nigstitu yewerq libs tegonats’fa teshelma
Bengusu beljwa qegn yeamlak enat bekbrqoma
Qalkidwanwan asasbalech het’ann litasmr
Bets’nats’l bekebero enamesgn enzemr.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yasalefikut', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yaseregnin Lemebekel (yaseregnin-lemebekel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 1
አዳኜ የምልህ ብቸ ኛው መድህኔ
ተሰቅለህ ያየሁህ ለሀጥያተኛው ለኔ
እኮ ካንተ ሌላ ከቶ ወዴት አለ
ሕይወቱን ሰውቶ ሞቴን የገደለ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 2
በአመፀኞች ሽፍቶች መሃል
ንፁሁ በግ ተገኝተሃል
ያለ ስስት ሳመልክህ
እኖራለሁ በቤትህ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 3
በደምህ ገድበህ የአይኖቼን እንባ
ትናንቴን ሻርክልኝ ገነት እንድገባ
ባርነቴ ቀርቶ የኃጢተኞች ዋና
አመስጋኝ አረከኝ አስይዘህ በገና

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 4
የታረድከው ፋሲካዬ
ያን ክፉ ቀን ማለፊያ
ምዘምርህ በመንፈስ
ክብሬ እኮ ነህ ኢየሱስ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 5
የነሐሱን እባብ በእምነት ተመልክተው
እንደተፈወሱ የሙሴን ቃል ሰምተው
ወደ ተሰቀለው ይመልከት አይናችን
አማራጭ የሌለው እርሱ ነው ቤዛችን

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 6
በደለኛ አመጸኛ
ዋና ሳለሁ ወንጀለኛ
ስምህን ይዤ በዓለም ልዞር
አስታጠቅከኝ የፅድቅን ጦር

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 7
አክሊለ ሾህ ደፍተህ በሽቶች መሃል
ተሰቅለህ ያየሁህ በእንጨት መስቀል
በልቤ መቅረዝ ላይ ለዘላለም አብራ
ሰው ሆኛለሁና በማዳንህ ስራ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 8
ቅኔ ዜማ መተንፈሴ
ቀንም ማታ ማወደሴ
አምሮልኝ ነው ባንተ ሕይወቴ
ጌታ ኢየሱስ አብርሆቴ

CHORUS
የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ',
      lyrics_transliteration = 'CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 1
Adagne yemlh biche gnaw medhne
Teseqleh yayehuh lehet’yategnaw lene
Eko kante lela keto wedet ale
Hiywetun sewto moten yegedele

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 2
Beamets’egnoch shftoch mehal
Nits’uhu beg tegegntehal
Yale sist samelkh
Enoralehu bebeth

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 3
Bedemh gedbeh yeaynochen enba
Tinanten sharklgn genet endgeba
Barnete qerto yehat’itegnoch wana
Amesgagn arekegn asyzeh begena

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 4
Yetaredkew fasikaye
Yan kifu qen malefiya
Mizemrh bemenfes
Kibre eko neh Iyesus

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 5
Yenehesun ebab beemnet temelktew
Endetefewesu yemusen qal semtew
Wede teseqelew yimelket aynachn
Amarach’ yelelew ersu new bezachn

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 6
Bedelegna amets’egna
Wana salehu wenjelegna
Simhn yizhe bealem lizor
Astat’eqkegn yets’dqn t’or

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 7
Aklile shoh defteh beshtoch mehal
Teseqleh yayehuh beench’et mesqel
Belbe meqrez lay lezelalem abra
Sew hognalehuna bemadanh sira

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 8
Qine zema metenfese
Qenm mata mawedese
Amrolgn new bante hiywete
Geta Iyesus abrhote

CHORUS
Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yaseregnin-lemebekel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የኔን በደል ለመቀበል
ከፍ ብለህ በእንጨት መስቀል
የታየኸው ጎልጎታ
አንተ ብቻ የእኔ ጌታ

VERSE 1
አዳኜ የምልህ ብቸ ኛው መድህኔ
ተሰቅለህ ያየሁህ ለሀጥያተኛው ለኔ
እኮ ካንተ ሌላ ከቶ ወዴት አለ
ሕይወቱን ሰውቶ ሞቴን የገደለ

VERSE 2
በአመፀኞች ሽፍቶች መሃል
ንፁሁ በግ ተገኝተሃል
ያለ ስስት ሳመልክህ
እኖራለሁ በቤትህ

VERSE 3
በደምህ ገድበህ የአይኖቼን እንባ
ትናንቴን ሻርክልኝ ገነት እንድገባ
ባርነቴ ቀርቶ የኃጢተኞች ዋና
አመስጋኝ አረከኝ አስይዘህ በገና

VERSE 4
የታረድከው ፋሲካዬ
ያን ክፉ ቀን ማለፊያ
ምዘምርህ በመንፈስ
ክብሬ እኮ ነህ ኢየሱስ

VERSE 5
የነሐሱን እባብ በእምነት ተመልክተው
እንደተፈወሱ የሙሴን ቃል ሰምተው
ወደ ተሰቀለው ይመልከት አይናችን
አማራጭ የሌለው እርሱ ነው ቤዛችን

VERSE 6
በደለኛ አመጸኛ
ዋና ሳለሁ ወንጀለኛ
ስምህን ይዤ በዓለም ልዞር
አስታጠቅከኝ የፅድቅን ጦር

VERSE 7
አክሊለ ሾህ ደፍተህ በሽቶች መሃል
ተሰቅለህ ያየሁህ በእንጨት መስቀል
በልቤ መቅረዝ ላይ ለዘላለም አብራ
ሰው ሆኛለሁና በማዳንህ ስራ

VERSE 8
ቅኔ ዜማ መተንፈሴ
ቀንም ማታ ማወደሴ
አምሮልኝ ነው ባንተ ሕይወቴ
ጌታ ኢየሱስ አብርሆቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yenen bedel lemeqebel
Kef bileh beench’et mesqel
Yetayeኸw golgota
Ante bicha yeene Geta

VERSE 1
Adagne yemlh biche gnaw medhne
Teseqleh yayehuh lehet’yategnaw lene
Eko kante lela keto wedet ale
Hiywetun sewto moten yegedele

VERSE 2
Beamets’egnoch shftoch mehal
Nits’uhu beg tegegntehal
Yale sist samelkh
Enoralehu bebeth

VERSE 3
Bedemh gedbeh yeaynochen enba
Tinanten sharklgn genet endgeba
Barnete qerto yehat’itegnoch wana
Amesgagn arekegn asyzeh begena

VERSE 4
Yetaredkew fasikaye
Yan kifu qen malefiya
Mizemrh bemenfes
Kibre eko neh Iyesus

VERSE 5
Yenehesun ebab beemnet temelktew
Endetefewesu yemusen qal semtew
Wede teseqelew yimelket aynachn
Amarach’ yelelew ersu new bezachn

VERSE 6
Bedelegna amets’egna
Wana salehu wenjelegna
Simhn yizhe bealem lizor
Astat’eqkegn yets’dqn t’or

VERSE 7
Aklile shoh defteh beshtoch mehal
Teseqleh yayehuh beench’et mesqel
Belbe meqrez lay lezelalem abra
Sew hognalehuna bemadanh sira

VERSE 8
Qine zema metenfese
Qenm mata mawedese
Amrolgn new bante hiywete
Geta Iyesus abrhote'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yaseregnin-lemebekel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yashagiral (yashagiral)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yashagiral'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን

VERSE 1
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ደመናዉን እያየነው አይደክምም ልቦናችን
በበረሃ መና አዝንበህ አይተንሃል በዓይናችን
በሚለወጥ በሁኔታ ዜማችንን አንቀይር

VERSE 2
ሁሉም አልፎ ሁሉም ሄዶ ቀሪያችን ነህ እግዚአብሔር !!!
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን

VERSE 3
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ቀስቱን አልፎ ይታየናል የተዘረጋው ክንድህ
ከሞት ዓይኖች ከፍላፃ ከልሎናል ሞገስህ

VERSE 4
የሸለቆ ፈሳሽ ሆነን ተራምደናል በግርማ
ሳይፈፅም አንወሰድ በኛ ያለው አላማ ፣
ያሻግራል ያድናል አንተን ማመን
እግዚአብሔር አንተን ማመን

VERSE 5
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ
ጥልቁ ባህር መድረካችን ውሃው ሰገነት ሆኖ

VERSE 6
ዘምረናል በእንባ መሐል ልባችን ባንተ ታምኖ
እስከመምጫህ ይቀጥላል ባያቆም ግፍያ ሰልፉ
ስትገለጥ ይፈፀማል የኛ ነው ማሸነፉ ፣
ያሻግራል ያድናል አንተን ማመን

VERSE 7
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

VERSE 8
ህይወት አልባ ክርስትናን አልስጠህነምና
በዝቅታም በከፍታም ዘመርን በፈተና
ከሸለቆ ጥልቀት በላይ ስላለህ አለታችን በተከሻህ ተሻግራናል ገብተናል ከርስታችን ፣
ያሻግራል ያድናል አንተን ማመን

VERSE 9
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ

VERSE 10
ደመናዉን እያየነው አይደክምም ልቦናችን
በበረሃ መና አዝንበህ አይተንሃል በዓይናችን
በሚለወጥ በሁኔታ ዜማችንን አንቀይር
ሁሉም አልፎ ሁሉም ሄዶ ቀሪያችን ነህ እግዚአብሔር !!!

VERSE 11
ህይወት አልባ ክርስትናን አልስጠህነምና
በዝቅታም በከፍታም ዘመርን በፈተና
ከሸለቆ ጥልቀት በላይ ስላለህ አለታችን በተከሻህ ተሻግራናል ገብተናል ከርስታችን ፣
ያሻግራል ያድናል አንተን ማመን

VERSE 12
እግዚአብሔር አንተን ማመን
ያሻግራል ያድናል አንተን ማመን
አምላኬ አንተን ማመን
በወጀቡም አለን ዜማ ክርስቶስ ስላንተማ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen

VERSE 1
Bewejebum alen zema Kristos silantema
Demenawun eyayenew aydekmm libonachn
Bebereha mena aznbeh aytenhal beaynachn
Bemilewet’ behuneta zemachnn anqeyr

VERSE 2
Hulum alfo hulum hedo qeriyachn neh Egziabher !!!
Yashagral yadnal anten mamen
Egziabher anten mamen
Yashagral yadnal anten mamen

VERSE 3
Amlake anten mamen
Bewejebum alen zema Kristos silantema
Qestun alfo yitayenal yetezeregaw kindh
Kemot aynoch keflats’a kellonal mogesh

VERSE 4
Yesheleqo fesash honen teramdenal begrma
Sayfets’m anwesed begna yalew alama ,
Yashagral yadnal anten mamen
Egziabher anten mamen

VERSE 5
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema
T’lqu bahr medrekachn wihaw segenet hono

VERSE 6
Zemrenal beenba mehel libachn bante tamno
Eskememch’ah yiqet’lal bayaqom gifya selfu
Sitgelet’ yifets’emal yegna new mashenefu ,
Yashagral yadnal anten mamen

VERSE 7
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema

VERSE 8
Hiywet alba kirstnan alst’ehnemna
Bezqtam bekeftam zemern befetena
Kesheleqo t’lqet belay silaleh aletachn betekeshah teshagranal gebtenal kerstachn ,
Yashagral yadnal anten mamen

VERSE 9
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema

VERSE 10
Demenawun eyayenew aydekmm libonachn
Bebereha mena aznbeh aytenhal beaynachn
Bemilewet’ behuneta zemachnn anqeyr
Hulum alfo hulum hedo qeriyachn neh Egziabher !!!

VERSE 11
Hiywet alba kirstnan alst’ehnemna
Bezqtam bekeftam zemern befetena
Kesheleqo t’lqet belay silaleh aletachn betekeshah teshagranal gebtenal kerstachn ,
Yashagral yadnal anten mamen

VERSE 12
Egziabher anten mamen
Yashagral yadnal anten mamen
Amlake anten mamen
Bewejebum alen zema Kristos silantema'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yashagiral', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yasichenekegn Ale Fichiwu (yasichenekegn-ale-fichiwu)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yasichenekegn-ale-fichiwu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አንች ብቻ ማርያም
አንች ብቻ የምታውቂው
አንች ብቻ ድንግልሆይ
አንች ብቻ የምታውቂው

VERSE 1
ያስጨነቀኝ አለ ፍችው
የከበደኝ አለ ፍችው(2)

VERSE 2
በኔ አቅም የሚፈታ አይለም
ባንች ምልጃ አገኛለሁ ሰላም
ያሰረኝን እናቴ ፍችልኝ
ፈተናውን ቀለል አድርጊልኝ

VERSE 3
ማን አለኝ ሌላ የምቀርበው
የውስጤን ብሶት የምነግረው
ከናትስ በላይ ማን ይረዳል
ስነግርሽ ድንግል ይቀለኛል

VERSE 4
ልመናውን አሳስቢልኝ ላለሽ
አዛኝቷ ምራገ ፀሎት ነሽ
የለምና ካንች የሚደበቅ
ታውቂለሽ የልቤን መጨነቅ

VERSE 5
ማን አለኝ,,,,,,,

VERSE 6
መሰወሪያ መጠጊያ ታዛዬ
የወጣብሽ አዳኘ ቤዛዬ
ወደቤ ነሽ የረፍቴ ከተማ
የማልፍብሽ የጭንቁን ጨለማ

VERSE 7
ማን አለኝ ,,,,,,,,,

VERSE 8
መደገፊያ የሲና ሀመልማል
የደረቀው በአንቺ ይለመልማል
እፎይ ልበል መልሽው ሰላሜን
ብርታት ስጭኝ አይተሽ መዳከሜን

VERSE 9
ማን አለኝ ,,,,,,,,

VERSE 10
መሰላሌ ከጥልቁ መውጫዬ
ድንግል ማርያም ቀስቱን ማለፊያዬ
ንግስቲቱ በአብ ቀኝ የቆምሽው
መልስ አሰጭኝ ለልጅሽ ነግረሽው

VERSE 11
ማን አለኝ,,,,,,,'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Anch bicha Maryam
Anch bicha yemtawqiw
Anch bicha dinglhoy
Anch bicha yemtawqiw

VERSE 1
Yasch’eneqegn ale fichw
Yekebedegn ale fichw (2)

VERSE 2
Bene aqm yemifeta aylem
Banch milja agegnalehu selam
Yaseregnn enate fichlgn
Fetenawn qelel adrgilgn

VERSE 3
Man alegn lela yemqerbew
Yewst’en bisot yemnegrew
Kenats belay man yiredal
Sinegrsh Dingil yiqelegnal

VERSE 4
Limenawn asasbilgn lalesh
Azagntwa mirage ts’elot nesh
Yelemna kanch yemidebeq
Tawqilesh yelben mech’eneq

VERSE 5
Man alegn,,,,,,,

VERSE 6
Meseweriya met’egiya tazaye
Yewet’absh adagne bezaye
Wedebe nesh yerefte ketema
Yemalfbsh yech’nqun ch’elema

VERSE 7
Man alegn ,,,,,,,,,

VERSE 8
Medegefiya yesina hemelmal
Yedereqew beanchi yilemelmal
Efoy libel melshw selamen
Birtat sich’gn aytesh medakemen

VERSE 9
Man alegn ,,,,,,,,

VERSE 10
Meselale ket’lqu mewch’aye
Dingil Maryam qestun malefiyaye
Nigstitu beab qegn yeqomshw
Mels asech’gn leljsh negreshw

VERSE 11
Man alegn,,,,,,,'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yasichenekegn-ale-fichiwu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: YeAwaj Negarit Qal (ye-awaj-negari-qal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 1
ምስክርነቱን ዮሐንስ አስረዳ
ልባችን ለጌታ መልካም መንገድ ይሁን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 2
የደናግል መመኪያ የነብያት ገዳም
አውደ ዓመቱን ባርኪልኝ ድንግል ማርያም /2/

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 3
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 4
የእግዚአብሔርን መንገድ እንመስርት ሁላችን
ማረፊያ እንዲሆነን ለመጪው ሐብታችን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 5
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅና ርህራሄ በእኛ ላይ ይስፋፋ

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 6
ስጋና ደምህን በክብር አግኝተናል
ሕይወት እንደሆነን አምላክ ተማጽነናል

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 7
ሁለት ልብሶች ያሉት ከማብዛት ልብሱን
ለሌለው ያድለው ሁለተኛውን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 8
ከበደላችንም አንጻን አደራህን
በክፉ እንዳንጠፋ እኛ ልጆችህ

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ',
      lyrics_transliteration = 'CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 1
Miskirnetun Yohannes asreda
Libachin legeta melkam menged yihun

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 2
Ye danagil memekiya ye nebiyat gedam
Awde ametun barkilign Dingil Maryam (x2)

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 3
Teraraw zik yibel t’amamawim yiqna
Kaltestekakele menged yelemna

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 4
YeEgziabherin menged enmesirt hulachin
Marefiya endihonen lemetchiw habtachin

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 5
Kifatna tenkol kelibachin yit’fa
Tsidkna rihrahe be’enya lay yisfafa

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 6
Siga na demhin bekibir agnytenal
Hiywet endehonen Amlak tematsnenal

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 7
Hulet libsoch yalut kemabzat libswn
Lelel’ew yadilew huletengnawn

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 8
Kebedelachinm antsan aderahn
Bekifu endant’efa enya lijochih

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ye-awaj-negari-qal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 1
ምስክርነቱን ዮሐንስ አስረዳ
ልባችን ለጌታ መልካም መንገድ ይሁን

VERSE 2
የደናግል መመኪያ የነብያት ገዳም
አውደ ዓመቱን ባርኪልኝ ድንግል ማርያም /2/

VERSE 3
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና

VERSE 4
የእግዚአብሔርን መንገድ እንመስርት ሁላችን
ማረፊያ እንዲሆነን ለመጪው ሐብታችን

VERSE 5
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅና ርህራሄ በእኛ ላይ ይስፋፋ

VERSE 6
ስጋና ደምህን በክብር አግኝተናል
ሕይወት እንደሆነን አምላክ ተማጽነናል

VERSE 7
ሁለት ልብሶች ያሉት ከማብዛት ልብሱን
ለሌለው ያድለው ሁለተኛውን

VERSE 8
ከበደላችንም አንጻን አደራህን
በክፉ እንዳንጠፋ እኛ ልጆችህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 1
Miskirnetun Yohannes asreda
Libachin legeta melkam menged yihun

VERSE 2
Ye danagil memekiya ye nebiyat gedam
Awde ametun barkilign Dingil Maryam (x2)

VERSE 3
Teraraw zik yibel t’amamawim yiqna
Kaltestekakele menged yelemna

VERSE 4
YeEgziabherin menged enmesirt hulachin
Marefiya endihonen lemetchiw habtachin

VERSE 5
Kifatna tenkol kelibachin yit’fa
Tsidkna rihrahe be’enya lay yisfafa

VERSE 6
Siga na demhin bekibir agnytenal
Hiywet endehonen Amlak tematsnenal

VERSE 7
Hulet libsoch yalut kemabzat libswn
Lelel’ew yadilew huletengnawn

VERSE 8
Kebedelachinm antsan aderahn
Bekifu endant’efa enya lijochih'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ye-awaj-negari-qal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: YeBirhan Gorf Nat (ye-birhan-gorf-nat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 1
ፍጥረት በሙሉ/2/ ፊትሽ ይወድቃሉ
ጸጋሽ ይድረሰን/2/ ይስጠን እያሉ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 2
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የሃጢያት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት/2/ ድንግል ትኑርበት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 3
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለሃጢያቴ የኔ እናት ምልጃ ታቀርባለች

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 4
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 5
አምላክን ይዛ ነው የምትመጣው
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን',
      lyrics_transliteration = 'CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 1
Fit’ret bemulu (x2) fitish yiwedikalu
Tsegash yidiresen (x2) yiset’en eyalu

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 2
Yene lib min ts’idik alew anchin lemastenaged
Ye hat’iyat gotera new yetemola besist
Ere endet (x2) dingil tinurbat

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 3
At’tseyefim yenen lib tasenadawalech
Sile hat’iyate yene enat milija take’raletch

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 4
Libachewn yezegu dingiln lemasgeba
Hilinaachew yimeles entseliy lezih t’ifat

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 5
Amlakn yiza new yemitemet’aw
Ershuan sinemelis getan new yeminaskeymew

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ye-birhan-gorf-nat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 1
ፍጥረት በሙሉ/2/ ፊትሽ ይወድቃሉ
ጸጋሽ ይድረሰን/2/ ይስጠን እያሉ

VERSE 2
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የሃጢያት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት/2/ ድንግል ትኑርበት

VERSE 3
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለሃጢያቴ የኔ እናት ምልጃ ታቀርባለች

VERSE 4
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

VERSE 5
አምላክን ይዛ ነው የምትመጣው
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 1
Fit’ret bemulu (x2) fitish yiwedikalu
Tsegash yidiresen (x2) yiset’en eyalu

VERSE 2
Yene lib min ts’idik alew anchin lemastenaged
Ye hat’iyat gotera new yetemola besist
Ere endet (x2) dingil tinurbat

VERSE 3
At’tseyefim yenen lib tasenadawalech
Sile hat’iyate yene enat milija take’raletch

VERSE 4
Libachewn yezegu dingiln lemasgeba
Hilinaachew yimeles entseliy lezih t’ifat

VERSE 5
Amlakn yiza new yemitemet’aw
Ershuan sinemelis getan new yeminaskeymew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ye-birhan-gorf-nat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ye Fikir Enat Ye Selam (ye-fikir-enat-ye-selam)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ye-fikir-enat-ye-selam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የፍቅር እናት የሰላም /2/
ይናፍቀኛል ስምሽ
ሳልጠራው ስቀር ማርያም

VERSE 1
በህይወቴ ውስጥ በኑሮዬ
ቅደሚ ከፊት ከኃላዬ
ተደላደለ ልቤ
አንቺ አለሽና ካጠገቤ

VERSE 2
ምኞቴም ይስመር ትልቅ ህልሜ
ልለፍ ወጀቡን ተቋቁሜ
የጌታዬ እናት ነሽ
ሀይልን ያደርጋል ፀሎትሽ

VERSE 3
እንዴት ቀራለሁ ከመንገዴ
አደራ እናቴ አስቢኝ
ለሚያስጨንቀኝ ጠላት
ለሚያሳድደኝ አትስጪኝ

VERSE 4
ትናንትም ዛሬም አመስጋኝ ነኝ
የለም ለነገ የሚያስፈራኝ
ሜዳ ይሆናል ተራራ
ልጅሽ ስላለ ከኔ ጋራ

VERSE 5
እንዴት ቀራለሁ ከመንገዴ
አደራ እናቴ አስቢኝ
ለሚያስጨንቀኝ ጠላት
ለሚያሳድደኝ አትስጪኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ye fikir enat ye selam /2/
Yinafeqenyal simish
Sal teraw seqer Maryam

VERSE 1
Behiywete wist be nuroye
Qidemi kefit kehwalaye
Tedeladele libe
Anchi aleshina katagebe

VERSE 2
Mignotem yismer tilik hilme
Lilef wejebun tequaqme
Ye getaye enat nesh
Hayiln yadergal tselotsh

VERSE 3
Endet qeralew ke mengede
Adera enate asbign
Lemiyaschenqegn telat
Lemiyasaddedegn atitshcighe

VERSE 4
Tinantem zarem amesgagn nen
Yelem leneghe yemiyasferagn
Meda yihonal terrara
Lijish silale kene gara

VERSE 5
Endet qeralew ke mengede
Adera enate asbign
Lemiyaschenqegn telat
Lemiyasaddedegn atitshcighe'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ye-fikir-enat-ye-selam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ye lejesh Cherenet (ye-lejesh-cherenet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 1
ባርኪኝ የአምላክ እናት ይራቅ ጉስቁልናዬ
አፌን በእሳት ሙይው እንዲታባስ እንባዬ
እኔ ወዳንቺ ልጠጋ ልማልል ከፊትሽ/2/
አንገትን አያስቀልስም እናቴ ልመናሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 2
ሰርጉን እንዳልገባ ልብሴን አሳድፌያለሁ
በምልጃሽ በማመን ላንቺ አሳስባለሁ
በሥላሴ ፊት ስምሽም በእውነት ሰልጥኗልና/2/
ይታረቃል እግዚአብሔር ድንግል ባንቺ ልመና/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 3
ነግረሽው ነውና ልጅሽ የታገሰኝ
እንደሃጥያቴ ብዛት ፈጥኖ ያላጠፋኝ
እውነተኛ መዝገቤ ነሽ ድህነት ያገኘሁብሽ/2/
ወደቤ ነሽ እመቤቴ በሰላም ያረፍኩብሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 4
ሃጥአን እንዲፀድቁ ምክንያት አድርጎሻል
ከሞት ወደ ህይወት አዳም ተሻግሮብሻል
በጌታ ፊት በወረደ በመረረ እንባሽ/2/
ያባቴ ቡሩካን ብሎ ይቀበለኝ ልጅሽ/2/

CHORUS
የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/',
      lyrics_transliteration = 'CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 1
Barkign yeamlak enat yiraq gusqulnaye
Afen beesat muyw enditabas enbaye
Ene wedanchi lit’ega limall kefitsh (2)
Angetn ayasqelsm enate limenash (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 2
Sergun endalgeba libsen asadfeyalehu
Bemljash bemamen lanchi asasbalehu
Beslase fit simshm beewnet selt’nwalna (2)
Yitareqal Egziabher Dingil banchi limena (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 3
Negreshw newna lijsh yetagesegn
Endehat’yate bizat fet’no yalat’efagn
Ewnetegna mezgebe nesh dihnet yagegnehubsh (2)
Wedebe nesh Emebete beselam yarefkubsh (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 4
Hat’an endits’edqu miknyat adrgoshal
Kemot wede hiywet adam teshagrobshal
Begeta fit bewerede bemerere enbash (2)
Yabate burukan bilo yiqebelegn lijsh (2)

CHORUS
Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ye-lejesh-cherenet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የልጅሽ ቸርነት ያንች ማማለድ
የልጅሽ ቸርነት ያንች ማማለድ
ድንግል ቃል ኪዳንሽ የርሱ ሰው መውደድ
አውጣኝ ከክፉ አዳነኝ ከሞት/2/

VERSE 1
ባርኪኝ የአምላክ እናት ይራቅ ጉስቁልናዬ
አፌን በእሳት ሙይው እንዲታባስ እንባዬ
እኔ ወዳንቺ ልጠጋ ልማልል ከፊትሽ/2/
አንገትን አያስቀልስም እናቴ ልመናሽ/2/

VERSE 2
ሰርጉን እንዳልገባ ልብሴን አሳድፌያለሁ
በምልጃሽ በማመን ላንቺ አሳስባለሁ
በሥላሴ ፊት ስምሽም በእውነት ሰልጥኗልና/2/
ይታረቃል እግዚአብሔር ድንግል ባንቺ ልመና/2/

VERSE 3
ነግረሽው ነውና ልጅሽ የታገሰኝ
እንደሃጥያቴ ብዛት ፈጥኖ ያላጠፋኝ
እውነተኛ መዝገቤ ነሽ ድህነት ያገኘሁብሽ/2/
ወደቤ ነሽ እመቤቴ በሰላም ያረፍኩብሽ/2/

VERSE 4
ሃጥአን እንዲፀድቁ ምክንያት አድርጎሻል
ከሞት ወደ ህይወት አዳም ተሻግሮብሻል
በጌታ ፊት በወረደ በመረረ እንባሽ/2/
ያባቴ ቡሩካን ብሎ ይቀበለኝ ልጅሽ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeljsh chernet yanch mamaled
Yeljsh chernet yanch mamaled
Dingil qal kidansh yersu sew mewded
Awt’agn kekfu adanegn kemot (2)

VERSE 1
Barkign yeamlak enat yiraq gusqulnaye
Afen beesat muyw enditabas enbaye
Ene wedanchi lit’ega limall kefitsh (2)
Angetn ayasqelsm enate limenash (2)

VERSE 2
Sergun endalgeba libsen asadfeyalehu
Bemljash bemamen lanchi asasbalehu
Beslase fit simshm beewnet selt’nwalna (2)
Yitareqal Egziabher Dingil banchi limena (2)

VERSE 3
Negreshw newna lijsh yetagesegn
Endehat’yate bizat fet’no yalat’efagn
Ewnetegna mezgebe nesh dihnet yagegnehubsh (2)
Wedebe nesh Emebete beselam yarefkubsh (2)

VERSE 4
Hat’an endits’edqu miknyat adrgoshal
Kemot wede hiywet adam teshagrobshal
Begeta fit bewerede bemerere enbash (2)
Yabate burukan bilo yiqebelegn lijsh (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ye-lejesh-cherenet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: YeTsidk Ber Nesh (ye-tsidk-ber-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 1
እመቤታችን የእኛ ምርኩዝ ነሽ እመቤታችን ከለላም ሆንሽን
›› የእሳት ሙዳይ ›› እሳት ታቀፍሽ
›› በብርሃን ተከበሽ ›› ወርቅ ለብሰሽ
›› ከሴቶች ሁሉ ›› አብ መረጠሽ

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 2
እመቤታችን ድንግል ሆይ ልጆችሽ እመቤታችን ዘውትር ይጠሩሻል
›› ስምሽን ለልጅ ልጅ ›› ያሳስቡልሻል
›› በተሰጠሽ ጸጋ ›› ባማላጅነትሽ
›› ምህረትን አሰጪን ›› ከመሃሪው ልጅሽ

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 3
እመቤታችን ያልታረሰች እርሻ እመቤታችን ዘር ያልተዘራባት
›› የህይወትን ፍሬ ›› ሰጠችን የእኛ እናት
›› የታረደው መሲ ›› እናቱን ወደዳት
›› በቀኙ ቆማለች ›› ድንግል እመቤት ናት

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 4
እመቤታችን የእውነት ደመና እመቤታችን ዝናብ የታየባት
›› ወዳናለች ድንግል ›› የታተመች ገነት
›› ክብር ለሆነችው ›› ኑ እንዘምርላት
›› ደስ ይበልሽ እንበል ›› የብርሃን እናት

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/',
      lyrics_transliteration = 'CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 1
Emebetachin ye’egna mirkuz nesh emebetachin kelela honshin
›› Ye isat muday ›› isat takefsh
›› Be birhan tekebesh ›› werq lebesh
›› Ke setoch hulu ›› Ab meretesh

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 2
Emebetachin dingil hoy lijochish emebetachin zawtir yiterushal
›› Simishin leliji lij ›› yasasbulshal
›› Betesetesh tsega ›› bemalagninetish
›› Mihretin aset’egin ›› kemahariew lijish

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 3
Emebetachin yalt’aresetch irsha emebetachin zer yalt’ezrabat
›› Ye hiywetn firé ›› setechin ye’egna enat
›› Ye taredew Mesi ›› enatun wededat
›› Be qenyu qomaletch ›› dingil emebet nat

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 4
Emebetachin ye’ewnet demena emebetachin zinab yetayebat
›› Wodanaletch dingil ›› yetatemetch genet
›› Kibir lehonetch ›› nu enzemirlât
›› Des yibelish enbel ›› ye birhan enat

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ye-tsidk-ber-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 1
እመቤታችን የእኛ ምርኩዝ ነሽ እመቤታችን ከለላም ሆንሽን
›› የእሳት ሙዳይ ›› እሳት ታቀፍሽ
›› በብርሃን ተከበሽ ›› ወርቅ ለብሰሽ
›› ከሴቶች ሁሉ ›› አብ መረጠሽ

VERSE 2
እመቤታችን ድንግል ሆይ ልጆችሽ እመቤታችን ዘውትር ይጠሩሻል
›› ስምሽን ለልጅ ልጅ ›› ያሳስቡልሻል
›› በተሰጠሽ ጸጋ ›› ባማላጅነትሽ
›› ምህረትን አሰጪን ›› ከመሃሪው ልጅሽ

VERSE 3
እመቤታችን ያልታረሰች እርሻ እመቤታችን ዘር ያልተዘራባት
›› የህይወትን ፍሬ ›› ሰጠችን የእኛ እናት
›› የታረደው መሲ ›› እናቱን ወደዳት
›› በቀኙ ቆማለች ›› ድንግል እመቤት ናት

VERSE 4
እመቤታችን የእውነት ደመና እመቤታችን ዝናብ የታየባት
›› ወዳናለች ድንግል ›› የታተመች ገነት
›› ክብር ለሆነችው ›› ኑ እንዘምርላት
›› ደስ ይበልሽ እንበል ›› የብርሃን እናት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 1
Emebetachin ye’egna mirkuz nesh emebetachin kelela honshin
›› Ye isat muday ›› isat takefsh
›› Be birhan tekebesh ›› werq lebesh
›› Ke setoch hulu ›› Ab meretesh

VERSE 2
Emebetachin dingil hoy lijochish emebetachin zawtir yiterushal
›› Simishin leliji lij ›› yasasbulshal
›› Betesetesh tsega ›› bemalagninetish
›› Mihretin aset’egin ›› kemahariew lijish

VERSE 3
Emebetachin yalt’aresetch irsha emebetachin zer yalt’ezrabat
›› Ye hiywetn firé ›› setechin ye’egna enat
›› Ye taredew Mesi ›› enatun wededat
›› Be qenyu qomaletch ›› dingil emebet nat

VERSE 4
Emebetachin ye’ewnet demena emebetachin zinab yetayebat
›› Wodanaletch dingil ›› yetatemetch genet
›› Kibir lehonetch ›› nu enzemirlât
›› Des yibelish enbel ›› ye birhan enat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ye-tsidk-ber-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ye Yared Wub Zema (ye-yared-wub-zema)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 1
በምን አደበቴ
እደትሥ ባለ ቃል
ማርያም ልበልሽ
በምን አደበቴ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 2
እደትሥ ባለ ቃል
ማርያም ልበልሽ(2)
ምድርና ሠማዩ ታምርሺን ይገሩ
ፋጥረታትበሙሉሥላች ይመሥክሩ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 3
ተነግሮ የማያልቅ ድንቅ ነው ሥራሺ
ድንግል ሆይ እናቴ አምሣያ የለሺ
ማርያም ድግል እረዳቴ
የምደርሺልኝ ነይ ሥልሺ በጭንቀቴ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 4
ተአምርሺንም በአይኔ አይቻለሁ
ፅወን ሆይ ሥልሺ ድንግል ሆይ እጠግባለሁ
"""""""አዝ""""""''
የእግዚአብሔር ጥበቡ በአንች ተገለጠ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 5
የአዳም ዘር በሙሉ ከሞት አመለጠ
የመዳን ምክንያት ማርያም አች ነሺ
ለፋጥረቱ ሁሉ መሠላል የሆሽ
ነገ ባላውቅ እኔንም ቢያሥፈራኝ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 6
አንች ካለ ሺኝ በፋፁም አልወድቅም
በፊትሺ እድቆም ለምሥጋና
ማርያም ልበልሺ በትህትና
""""""""""አዝ"""""""""""

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 7
ትውልዱ በሙሉ ለምሥጋና ይቁም
ባንች ሥለሆነ የቀረለት መርገም
አዳም ከነልጁ በሠማይ በምድር
ማርያም ማርያም ይበል ታምርሺን ይናገር

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 8
ጨለማው ከፊቴ ተገፈፈ
ማርያም በምልጃሽ ልቤ አረፈ
ከጎኔ ነይ ሥልሽ እፅናናለሁ
እሣት ገደሉን ሁሉንም አልፈዋለሁ

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 9
የያሬድ ውብ ዜማ
ድንግል እመቤቴ
ሥጦታየ ነሺ
በምን አደበቴ እደትሥ ባለ ቃል

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 10
ማርያም ልበልሺ(2)

CHORUS
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ',
      lyrics_transliteration = 'CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 1
Bemn adebete
Edets bale qal
Maryam libelsh
Bemn adebete

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 2
Edets bale qal
Maryam libelsh (2)
Midrna semayu tamrshin yigeru
Fat’retatbemuluslach yimeskru

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 3
Tenegro yemayalq dinq new sirashi
Dingil hoy enate amsaya yeleshi
Maryam digl eredate
Yemdershilgn ney silshi bech’nqete

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 4
Teamrshinm beayne aychalehu
Ts’wen hoy silshi Dingil hoy et’egbalehu
"""""""az""""""''
YeEgziabher t’bebu beanch tegelet’e

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 5
Yeadam zer bemulu kemot amelet’e
Yemedan miknyat Maryam ach neshi
Lefat’retu hulu meselal yehosh
Nege balawq enenm biyasferagn

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 6
Anch kale shign befats’um alwedqm
Befitshi edqom lemsgana
Maryam libelshi bethtna
""""""""""az"""""""""""

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 7
Tiwldu bemulu lemsgana yiqum
Banch silehone yeqerelet mergem
Adam kenelju besemay bemdr
Maryam Maryam yibel tamrshin yinager

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 8
Ch’elemaw kefite tegefefe
Maryam bemljash libe arefe
Kegone ney silsh ets’nanalehu
Esat gedelun hulunm alfewalehu

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 9
Yeyared wib zema
Dingil Emebete
Sit’otaye neshi
Bemn adebete edets bale qal

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 10
Maryam libelshi (2)

CHORUS
Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ye-yared-wub-zema'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ
የያሬድ ውብ ዜማ
ድንግል እመቤቴ ሥጦታየ ነሽ

VERSE 1
በምን አደበቴ
እደትሥ ባለ ቃል
ማርያም ልበልሽ
በምን አደበቴ

VERSE 2
እደትሥ ባለ ቃል
ማርያም ልበልሽ(2)
ምድርና ሠማዩ ታምርሺን ይገሩ
ፋጥረታትበሙሉሥላች ይመሥክሩ

VERSE 3
ተነግሮ የማያልቅ ድንቅ ነው ሥራሺ
ድንግል ሆይ እናቴ አምሣያ የለሺ
ማርያም ድግል እረዳቴ
የምደርሺልኝ ነይ ሥልሺ በጭንቀቴ

VERSE 4
ተአምርሺንም በአይኔ አይቻለሁ
ፅወን ሆይ ሥልሺ ድንግል ሆይ እጠግባለሁ
"""""""አዝ""""""''
የእግዚአብሔር ጥበቡ በአንች ተገለጠ

VERSE 5
የአዳም ዘር በሙሉ ከሞት አመለጠ
የመዳን ምክንያት ማርያም አች ነሺ
ለፋጥረቱ ሁሉ መሠላል የሆሽ
ነገ ባላውቅ እኔንም ቢያሥፈራኝ

VERSE 6
አንች ካለ ሺኝ በፋፁም አልወድቅም
በፊትሺ እድቆም ለምሥጋና
ማርያም ልበልሺ በትህትና
""""""""""አዝ"""""""""""

VERSE 7
ትውልዱ በሙሉ ለምሥጋና ይቁም
ባንች ሥለሆነ የቀረለት መርገም
አዳም ከነልጁ በሠማይ በምድር
ማርያም ማርያም ይበል ታምርሺን ይናገር

VERSE 8
ጨለማው ከፊቴ ተገፈፈ
ማርያም በምልጃሽ ልቤ አረፈ
ከጎኔ ነይ ሥልሽ እፅናናለሁ
እሣት ገደሉን ሁሉንም አልፈዋለሁ

VERSE 9
የያሬድ ውብ ዜማ
ድንግል እመቤቴ
ሥጦታየ ነሺ
በምን አደበቴ እደትሥ ባለ ቃል

VERSE 10
ማርያም ልበልሺ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeyared wib zema
Dingil Emebete sit’otaye nesh
Yeyared wib zema
Dingil Emebete sit’otaye nesh

VERSE 1
Bemn adebete
Edets bale qal
Maryam libelsh
Bemn adebete

VERSE 2
Edets bale qal
Maryam libelsh (2)
Midrna semayu tamrshin yigeru
Fat’retatbemuluslach yimeskru

VERSE 3
Tenegro yemayalq dinq new sirashi
Dingil hoy enate amsaya yeleshi
Maryam digl eredate
Yemdershilgn ney silshi bech’nqete

VERSE 4
Teamrshinm beayne aychalehu
Ts’wen hoy silshi Dingil hoy et’egbalehu
"""""""az""""""''
YeEgziabher t’bebu beanch tegelet’e

VERSE 5
Yeadam zer bemulu kemot amelet’e
Yemedan miknyat Maryam ach neshi
Lefat’retu hulu meselal yehosh
Nege balawq enenm biyasferagn

VERSE 6
Anch kale shign befats’um alwedqm
Befitshi edqom lemsgana
Maryam libelshi bethtna
""""""""""az"""""""""""

VERSE 7
Tiwldu bemulu lemsgana yiqum
Banch silehone yeqerelet mergem
Adam kenelju besemay bemdr
Maryam Maryam yibel tamrshin yinager

VERSE 8
Ch’elemaw kefite tegefefe
Maryam bemljash libe arefe
Kegone ney silsh ets’nanalehu
Esat gedelun hulunm alfewalehu

VERSE 9
Yeyared wib zema
Dingil Emebete
Sit’otaye neshi
Bemn adebete edets bale qal

VERSE 10
Maryam libelshi (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ye-yared-wub-zema', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: YEABEN BIDERAT / ORTHODOX MEZMURE LIVE NEWSONG (yeaben-biderat-orthodox-mezmure-live-newsong)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ

VERSE 1
በፃድቅ ልጅህ ፈርደሃል
አጥህ ባርያህን ምርሃል
ተበድለህም ክሰህም
አንተስ ቋንቋ ማይገልጥህ

CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ

VERSE 2
የአብን ብድራት ያን ውለታ
በደም ያጌጠውን ውብ ስጦታ
አንደበቴን ቀድሞ ዓይኔ አወራ
እንባን ስለ ፍቅሩ እየዘራ

CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ',
      lyrics_transliteration = NULL,
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeaben-biderat-orthodox-mezmure-live-newsong'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ

VERSE 1
በፃድቅ ልጅህ ፈርደሃል
አጥህ ባርያህን ምርሃል
ተበድለህም ክሰህም
አንተስ ቋንቋ ማይገልጥህ

VERSE 2
የአብን ብድራት ያን ውለታ
በደም ያጌጠውን ውብ ስጦታ
አንደበቴን ቀድሞ ዓይኔ አወራ
እንባን ስለ ፍቅሩ እየዘራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeaben-biderat-orthodox-mezmure-live-newsong', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeabewin Risit Anisetim (yeabewin-risit-anisetim)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 1
ያ ኢይዝራኤላዊ ናቡቴ በሰማርያ
የወይኑ ፋሬ ናት የማንነቱ መለያ
አክአብ ድንበርተኛው በወይኗ ጎምጅቶ
ነቃቅሎ ሊጥላት ሊያጠፋት ሽቶ

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 2
ያቺን መልካም እርሻ ባድማ ሊያደርጋት
ሊገዛት ወደደ በጥፍ ሊለውጣት
ተኩላው ለምድ ለብሶ ገብቶ ከበረትሽ
አድብቶ ቢሰራ እንዲፈርስ ስርዓትሽ

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 3
በሃይማኖት ቆመን ድል እንነሳዋለን
በርትዕት ተዋህዶ የኖሩትን ይዘን
ጠላት ቢከፋብን ያለ በደላችን
በብዙ መከራ ቢከበብ ዙሪያችን

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 4
በእመብርሃን ምልጃ ሁሉን እናልፋለን
በእግዚአብሔር ቸርነት በርስት እንኖራለን
ዛሬም በእኛ ዘመን አክአብ ተነስቷል
ርስት ድንበራችን ቀን በቀን ይገፋል

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 5
እኛም ናቡቴ ነን ሰማዕት እንሆናለን
የተዋህዶን ርስት እናስከብራለን

CHORUS
የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን',
      lyrics_transliteration = 'CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 1
Ya iyzraelawi nabute besemarya
Yeweynu fare nat yemannetu meleya
Akab dinbertegnaw beweynwa gomjto
Neqaqlo lit’lat liyat’efat shto

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 2
Yachin melkam ersha badma liyadergat
Ligezat wedede bet’f lilewt’at
Tekulaw lemd lebso gebto keberetsh
Adbto bisera endifers siratsh

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 3
Behaymanot qomen dil ennesawalen
Bertet Tewahedo yenorutn yizen
T’elat bikefabn yale bedelachn
Bebzu mekera bikebeb zuriyachn

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 4
Beemebrhan milja hulun enalfalen
BeEgziabher chernet berst ennoralen
Zarem beegna zemen akab tenestwal
Rist dinberachn qen beqen yigefal

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 5
Egnam nabute nen semaet enhonalen
Yetewahdon rist enaskebralen

CHORUS
Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeabewin-risit-anisetim'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የአበውን ርስት አንሰጥም አሳልፈን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን ጸንተን መስቀል ተሸክመን
እንኖራለን በእምነት ተደጎፍን

VERSE 1
ያ ኢይዝራኤላዊ ናቡቴ በሰማርያ
የወይኑ ፋሬ ናት የማንነቱ መለያ
አክአብ ድንበርተኛው በወይኗ ጎምጅቶ
ነቃቅሎ ሊጥላት ሊያጠፋት ሽቶ

VERSE 2
ያቺን መልካም እርሻ ባድማ ሊያደርጋት
ሊገዛት ወደደ በጥፍ ሊለውጣት
ተኩላው ለምድ ለብሶ ገብቶ ከበረትሽ
አድብቶ ቢሰራ እንዲፈርስ ስርዓትሽ

VERSE 3
በሃይማኖት ቆመን ድል እንነሳዋለን
በርትዕት ተዋህዶ የኖሩትን ይዘን
ጠላት ቢከፋብን ያለ በደላችን
በብዙ መከራ ቢከበብ ዙሪያችን

VERSE 4
በእመብርሃን ምልጃ ሁሉን እናልፋለን
በእግዚአብሔር ቸርነት በርስት እንኖራለን
ዛሬም በእኛ ዘመን አክአብ ተነስቷል
ርስት ድንበራችን ቀን በቀን ይገፋል

VERSE 5
እኛም ናቡቴ ነን ሰማዕት እንሆናለን
የተዋህዶን ርስት እናስከብራለን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeabewn rist anset’m asalfen
Ennoralen ts’enten mesqel teshekmen
Ennoralen ts’enten mesqel teshekmen
Ennoralen beemnet tedegofn

VERSE 1
Ya iyzraelawi nabute besemarya
Yeweynu fare nat yemannetu meleya
Akab dinbertegnaw beweynwa gomjto
Neqaqlo lit’lat liyat’efat shto

VERSE 2
Yachin melkam ersha badma liyadergat
Ligezat wedede bet’f lilewt’at
Tekulaw lemd lebso gebto keberetsh
Adbto bisera endifers siratsh

VERSE 3
Behaymanot qomen dil ennesawalen
Bertet Tewahedo yenorutn yizen
T’elat bikefabn yale bedelachn
Bebzu mekera bikebeb zuriyachn

VERSE 4
Beemebrhan milja hulun enalfalen
BeEgziabher chernet berst ennoralen
Zarem beegna zemen akab tenestwal
Rist dinberachn qen beqen yigefal

VERSE 5
Egnam nabute nen semaet enhonalen
Yetewahdon rist enaskebralen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeabewin-risit-anisetim', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeabiriham Dinikwan Nesh (yeabiriham-dinikwan-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 1
ኅቱም ድንግልና ፍፁም ትኅትና
በሥጋም በነፍስም ፍጽምት ነሽና
ውበትሽን ወድዶ እናቱ አደረገሽ
የሲና ሐመልማል በምን ልመስልሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 2
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
እርሱ ከመረጠሽ እርሱ ካፀናሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 3
እንዴት ይቻለኛል ከእኔ ላርቅሽ
የተስፋ ፍፃሜ ሁኚ ከእኔ ጋራ
እሻገረዋለሁ የዓለምን መከራ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 4
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
ድንግል ፍቀጂልኝ ላወድስ ስምሽን
ፀጋው ከበዛልኝ ልመስክር ክብርሽን

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 5
ያገለግልሽ ዘንድ ልቦናዬ ሻተ
በፍቅር ሞልተሽው ስለተደሰተ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 6
አዝ…(፪)

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ',
      lyrics_transliteration = 'CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 1
Hitum dingilina fits’um tihtna
Besgam benefsm fits’mt neshna
Wibetshn weddo enatu aderegesh
Yesina hemelmal bemn limeslsh

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 2
Selam leki selam leki libel lekbrsh
Degme degme lamesgnsh degme lawedssh
CHORUS
Ersu kemeret’esh ersu kats’enash

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 3
Endet yichalegnal keene larqsh
Yetesfa fits’ame hugni keene gara
Eshagerewalehu yealemn mekera
Selam leki selam leki libel lekbrsh

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 4
Degme degme lamesgnsh degme lawedssh
CHORUS
Dingil fiqejilgn laweds simshn
Ts’egaw kebezalgn limeskr kibrshn

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 5
Yageleglsh zend libonaye shate
Befqr molteshw siletedesete
Selam leki selam leki libel lekbrsh
Degme degme lamesgnsh degme lawedssh

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 6
CHORUS

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeabiriham-dinikwan-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 1
ኅቱም ድንግልና ፍፁም ትኅትና
በሥጋም በነፍስም ፍጽምት ነሽና
ውበትሽን ወድዶ እናቱ አደረገሽ
የሲና ሐመልማል በምን ልመስልሽ

VERSE 2
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
እርሱ ከመረጠሽ እርሱ ካፀናሽ

VERSE 3
እንዴት ይቻለኛል ከእኔ ላርቅሽ
የተስፋ ፍፃሜ ሁኚ ከእኔ ጋራ
እሻገረዋለሁ የዓለምን መከራ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ

VERSE 4
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
ድንግል ፍቀጂልኝ ላወድስ ስምሽን
ፀጋው ከበዛልኝ ልመስክር ክብርሽን

VERSE 5
ያገለግልሽ ዘንድ ልቦናዬ ሻተ
በፍቅር ሞልተሽው ስለተደሰተ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ

VERSE 6
አዝ…(፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 1
Hitum dingilina fits’um tihtna
Besgam benefsm fits’mt neshna
Wibetshn weddo enatu aderegesh
Yesina hemelmal bemn limeslsh

VERSE 2
Selam leki selam leki libel lekbrsh
Degme degme lamesgnsh degme lawedssh
Ersu kemeret’esh ersu kats’enash

VERSE 3
Endet yichalegnal keene larqsh
Yetesfa fits’ame hugni keene gara
Eshagerewalehu yealemn mekera
Selam leki selam leki libel lekbrsh

VERSE 4
Degme degme lamesgnsh degme lawedssh
Dingil fiqejilgn laweds simshn
Ts’egaw kebezalgn limeskr kibrshn

VERSE 5
Yageleglsh zend libonaye shate
Befqr molteshw siletedesete
Selam leki selam leki libel lekbrsh
Degme degme lamesgnsh degme lawedssh

VERSE 6'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeabiriham-dinikwan-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeaelafat Zimare Besiyatil Yemitebikegn Ayitegnam (yeaelafat-zimare-besiyatil-yemitebikegn-ayitegnam)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeaelafat-zimare-besiyatil-yemitebikegn-ayitegnam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 1
ቀን እና ለሊት ከኔ አይርቅም
ድምጸ አራዊት የለሊት ግርማ
ወደኔ አይቀርብም ድምጽህ ሲሰማ

VERSE 2
መሰናክልን ለእግሮቼ አይሰጥም
ይሰውረኛል በቀኙ ሰላም
ፀሐይም በቀን አይተኩሰኝም
የአጋንንትም ሀይል አያስፈራኝም

VERSE 3
ነፍሴን ጠበቃት ከጠላት ወጥመድ
ጌታዬ መራኝ በጽድቅ መንገድ
መውጣት መግባቴን እየጠበቀ
ለዚህ አበቃኝ እርሱ ባወቀ

VERSE 4
የሰማዩን ጠል እታገሳለው
ሰው ከጨከነ ምን እሆናለው
ለሊት በድብቅ ለሚጎበኙኝ
ለጻድቃኑ ክብር አምላክ ይስጥልኝ

VERSE 5
እንቅልፌን ባርኮ ለሰጠኝ የጌታ
በአለም ሀሳብ ሳልንገላታ
የእለት ምግቤንም ላልነሳኝ ፍጹም
ምስጋና ላቅርብ እስከ ዘለዓለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 1
Qen ena lelit kene ayrqm
Dimts’e arawit yelelit girma
Wedene ayqerbm dimts’h sisema

VERSE 2
Mesenakln leegroche ayset’m
Yisewregnal beqegnu selam
Ts’eheym beqen aytekusegnm
Yeaganntm heyl ayasferagnm

VERSE 3
Nefsen t’ebeqat ket’elat wet’med
Getaye meragn bets’dq menged
Mewt’at megbaten eyet’ebeqe
Lezih abeqagn ersu baweqe

VERSE 4
Yesemayun t’el etagesalew
Sew kech’ekene min ehonalew
Lelit bedbq lemigobegnugn
Lets’adqanu kibir amlak yist’lgn

VERSE 5
Enqlfen barko leset’egn yegeta
Bealem hesab salngelata
Yeelet migbenm lalnesagn fits’um
Misgana laqrb eske zelealem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeaelafat-zimare-besiyatil-yemitebikegn-ayitegnam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeaelafat Zimare Mezimur (yeaelafat-zimare-mezimur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
ባንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሔዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባሕርይሽን ባሕርይ አድርጎት
ለፍጥረታት ጌታ መዐዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 3
በጥቂት አደገ ተልኮና ታዞሽ
ከድንግልና ጋር አንድ የኾነ ሐሊብ
በሩካቤ ሳይሆን በብሥራት እንደ ንብ
ከሆድ መጥበብ ጋር የመለኮት ስፋት

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 4
አንቺ ኾነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ሕሊና የማይመረመር
ዕጹብ ነው ድንቅ ነው የመፅነሷ ነገር
እሳተ ነበልባል በሆድሽ ውስጥ ሲያድር

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ',
      lyrics_transliteration = 'CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 1
Banchi tefets’eme yesew lijoch desta
Bedeyn yetet’alech hewan tedesetech
Yedesta mefleqiya anchin silagegnech
Yebereket fire kanchi tegegneln

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 2
Yeweyn bota nesh Dingil enatachn
Weldm bahryshn bahry adrgot
Left’retat Geta meazash tesmamtot
Kanchi yiweled zend fits’um lilalaksh

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 3
Bet’qit adege telkona tazosh
Kednglna gar and yeኾne helib
Berukabe sayhon bebsrat ende nib
Kehod met’beb gar yemelekot sifat

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 4
Anchi ኾnesh sale tanashwa mushrit
Beft’ur hilina yemaymeremer
Ets’ub new dinq new yemets’neswa neger
Esate nebelbal behodsh wist’ siyadr

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 5
Nede nebelbalu alfejeshm neber

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeaelafat-zimare-mezimur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
ባንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሔዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባሕርይሽን ባሕርይ አድርጎት
ለፍጥረታት ጌታ መዐዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

VERSE 3
በጥቂት አደገ ተልኮና ታዞሽ
ከድንግልና ጋር አንድ የኾነ ሐሊብ
በሩካቤ ሳይሆን በብሥራት እንደ ንብ
ከሆድ መጥበብ ጋር የመለኮት ስፋት

VERSE 4
አንቺ ኾነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ሕሊና የማይመረመር
ዕጹብ ነው ድንቅ ነው የመፅነሷ ነገር
እሳተ ነበልባል በሆድሽ ውስጥ ሲያድር

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 1
Banchi tefets’eme yesew lijoch desta
Bedeyn yetet’alech hewan tedesetech
Yedesta mefleqiya anchin silagegnech
Yebereket fire kanchi tegegneln

VERSE 2
Yeweyn bota nesh Dingil enatachn
Weldm bahryshn bahry adrgot
Left’retat Geta meazash tesmamtot
Kanchi yiweled zend fits’um lilalaksh

VERSE 3
Bet’qit adege telkona tazosh
Kednglna gar and yeኾne helib
Berukabe sayhon bebsrat ende nib
Kehod met’beb gar yemelekot sifat

VERSE 4
Anchi ኾnesh sale tanashwa mushrit
Beft’ur hilina yemaymeremer
Ets’ub new dinq new yemets’neswa neger
Esate nebelbal behodsh wist’ siyadr

VERSE 5
Nede nebelbalu alfejeshm neber'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeaelafat-zimare-mezimur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeamalikit Amilak Tewelede (yeamalikit-amilak-tewelede)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeamalikit-amilak-tewelede'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የአማልክት አምላክ ተወለደ
ተወለደ መድኃኔዓለም
የጌቶች ጌታ ተወለደ መድኃኔዓለም
ከድንግል ማርያም በቤተልሔም

VERSE 1
ተወለደ አማኑኤል(፪×)
መጣ ወረደ ተወለደ አማኑኤል
ክብሩን አዋርዶ ተወለደ አማኑኤል
በበረት ተኛ ተወለደ አማኑኤል

VERSE 2
ትሕትናን ወዶ ተወለደ አማኑኤል
ጌታ ተወልዷል ተወለደ አማኑኤል
ከድንግል ማርያም ተወለደ አማኑኤል
ጠብን አርቆ ተወለደ አማኑኤል

VERSE 3
ሊሰጠን ሰላም ተወለደ አማኑኤል
/አዝ
የዲያብሎስን ተወለደ አማኑኤል
ሥልጣን ሊሽር ተወለደ አማኑኤል

VERSE 4
እሱን ሊፈታ ተወለደ አማኑኤል
በኃጢአት እስር ተወለደ አማኑኤል
ይሄው ተወልዷል ተወለደ አማኑኤል
በከብቶች በረት ተወለደ አማኑኤል

VERSE 5
አልፋ ዖሜጋ ተወለደ አማኑኤል
አምላክ አማልክት ተወለደ አማኑኤል
/አዝ
እናመስግነው ተወለደ አማኑኤል

VERSE 6
እንደ መላእክት ተወለደ አማኑኤል
ተወልዷልና ተወለደ አማኑኤል
የዓለም መድኃኒት ተወለደ አማኑኤል
ቃል ስጋ ሆነ ተወለደ አማኑኤል

VERSE 7
ከድንግል ማርያም ተወለደ አማኑኤል
የጌቶች ጌታ ተወለደ አማኑኤል
መድኃኔዓለም ተወለደ አማኑኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeamalkt amlak tewelede
Tewelede Medhanealem
Yegetoch Geta tewelede Medhanealem
Kedngl Maryam bebetelhem

VERSE 1
Tewelede Amanuel(2×)
Met’a werede tewelede Amanuel
Kibrun awardo tewelede Amanuel
Beberet tegna tewelede Amanuel

VERSE 2
Tihtnan wedo tewelede Amanuel
Geta teweldwal tewelede Amanuel
Kedngl Maryam tewelede Amanuel
T’ebn arqo tewelede Amanuel

VERSE 3
Liset’en selam tewelede Amanuel
/az
Yediyablosn tewelede Amanuel
Silt’an lishr tewelede Amanuel

VERSE 4
Esun lifeta tewelede Amanuel
Behat’iat esr tewelede Amanuel
Yihew teweldwal tewelede Amanuel
Bekebtoch beret tewelede Amanuel

VERSE 5
Alfa omega tewelede Amanuel
Amlak amalkt tewelede Amanuel
/az
Enamesgnew tewelede Amanuel

VERSE 6
Ende melaekt tewelede Amanuel
Teweldwalna tewelede Amanuel
Yealem medhanit tewelede Amanuel
Qal siga hone tewelede Amanuel

VERSE 7
Kedngl Maryam tewelede Amanuel
Yegetoch Geta tewelede Amanuel
Medhanealem tewelede Amanuel'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeamalikit-amilak-tewelede', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yebegena Mezimur Adis (yebegena-mezimur-adis)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 1
ሰው የለኝም ላልኩት አንተው ተስፋ ሁነኝ
ብዙ ቁስል አለ ለሰው የማልነግረው
በሀዘን የሞላኝ ልቤን የሰበረው
አለኝ የማወራው ከአንተ ጋራ ብቻ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 2
በውስጤ ያኖርኩት በሰዎች ፍራቻ
ይዘብትብኛል ችግሬን የሰማ
ይሳለቃል ሲያየኝ ቆሜ በጨለማ
አምላኩ የት አለ እንዳይሉ አድነኝ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 3
ነፍሴን ተስፋ ሙላት የጠፋሁ ልጅህ ነኝ
መድረሻ የሌለው ከንቱ መጻተኛ
ወገን ዘመድ ያጣ ሆኖ ስደተኛ
ተስፋ የሚያደርግህ አንተን ብቻ እኮ ነው

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 4
ምስካየ ኅዙናን ስደት የቀመስከው
የዳዊት ልጅ ማረኝ በሀዘን ልቤ ደምቷል
ዝም በል የሚለኝ ሰው በመንገዱ ሞልቷል
ሕዝቡን ገለል አርገህ ናልኝ የእኔ ጌታ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 5
ተስፋ እንደሌለው ሰው እንዳልንገላታ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ',
      lyrics_transliteration = 'CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 1
Sew yelegnm lalkut antew tesfa hunegn
Bizu qusl ale lesew yemalnegrew
Behezen yemolagn liben yeseberew
Alegn yemaweraw keante gara bicha

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 2
Bewst’e yanorkut besewoch firacha
Yizebtbgnal chgren yesema
Yisaleqal siyayegn qome bech’elema
Amlaku yet ale endaylu adnegn

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 3
Nefsen tesfa mulat yet’efahu lijh negn
Medresha yelelew kentu mets’ategna
Wegen zemed yat’a hono sidetegna
Tesfa yemiyadergh anten bicha eko new

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 4
Miskaye hizunan sidet yeqemeskew
Yedawit lij maregn behezen libe demtwal
Zim bel yemilegn sew bemengedu moltwal
Hizbun gelel argeh nalgn yeene Geta

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 5
Tesfa endelelew sew endalngelata

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yebegena-mezimur-adis'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 1
ሰው የለኝም ላልኩት አንተው ተስፋ ሁነኝ
ብዙ ቁስል አለ ለሰው የማልነግረው
በሀዘን የሞላኝ ልቤን የሰበረው
አለኝ የማወራው ከአንተ ጋራ ብቻ

VERSE 2
በውስጤ ያኖርኩት በሰዎች ፍራቻ
ይዘብትብኛል ችግሬን የሰማ
ይሳለቃል ሲያየኝ ቆሜ በጨለማ
አምላኩ የት አለ እንዳይሉ አድነኝ

VERSE 3
ነፍሴን ተስፋ ሙላት የጠፋሁ ልጅህ ነኝ
መድረሻ የሌለው ከንቱ መጻተኛ
ወገን ዘመድ ያጣ ሆኖ ስደተኛ
ተስፋ የሚያደርግህ አንተን ብቻ እኮ ነው

VERSE 4
ምስካየ ኅዙናን ስደት የቀመስከው
የዳዊት ልጅ ማረኝ በሀዘን ልቤ ደምቷል
ዝም በል የሚለኝ ሰው በመንገዱ ሞልቷል
ሕዝቡን ገለል አርገህ ናልኝ የእኔ ጌታ

VERSE 5
ተስፋ እንደሌለው ሰው እንዳልንገላታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 1
Sew yelegnm lalkut antew tesfa hunegn
Bizu qusl ale lesew yemalnegrew
Behezen yemolagn liben yeseberew
Alegn yemaweraw keante gara bicha

VERSE 2
Bewst’e yanorkut besewoch firacha
Yizebtbgnal chgren yesema
Yisaleqal siyayegn qome bech’elema
Amlaku yet ale endaylu adnegn

VERSE 3
Nefsen tesfa mulat yet’efahu lijh negn
Medresha yelelew kentu mets’ategna
Wegen zemed yat’a hono sidetegna
Tesfa yemiyadergh anten bicha eko new

VERSE 4
Miskaye hizunan sidet yeqemeskew
Yedawit lij maregn behezen libe demtwal
Zim bel yemilegn sew bemengedu moltwal
Hizbun gelel argeh nalgn yeene Geta

VERSE 5
Tesfa endelelew sew endalngelata'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yebegena-mezimur-adis', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yebegena Mezimur Di/n Abel Tesifaye Lanide Esikewediyagnawu Gitim Megabe Hadis Dokiter Tewodiros Belete Zema (yebegena-mezimur-di-n-abel-tesifaye-lanide-esikewediyagnawu-gitim-megabe)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 1
ያን የቀኝ ወንበዴ
ብመስለው ላ’ንድቀን : ባየው መንገዴ
ለመስረቅ አይደለም ንብረት ለመቀማት
አልያም ለመዝረፍ ሕይወትን ለማጥፋት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 2
በዚያ መንገድማ
ከሱስ ብበልጥ እንጂ መች ከእርሱ አንስና
እኔን ታውቀኝ የለ …
የወንበዴ አለቃ ያ’ጢኣተኞች ዋና

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 3
ያ … ጸጸት ያዘለ
በዚያች የጭንቅ ሠዓት «አስበኝ» እያለ
ከመስቀልህ ጥላ ከሥር ስለዋለ
ካ’ዳም ቀድሞ ገባ ምሕረት ተቀበለ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 4
እኔም እንደ ጥጦስ : ማታዬ እንዲያምር
ብትለኝ ምን አለ? …
«ከገነት ተጠለል: ዛሬን ከእኔ እደር»
ላንዴ እስከወዲያኛው

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 5
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ : ዛሬን ከእኔ እደር»
ደ’ሞ ይህን ተመኘሁ
ለንጊኖስን በሆንኩ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 6
ያቺን ዕለተ ዓርብ : ቀራንዮ በዋልኩ
ለአመጽ አይደለም : ከከአይሁድ ለማበር
አልያም ለመውጋት : ያንተን ጎን በጦር
በዚያ መንገድማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 7
አንተን ለማሳመም: ማን እኔን መሰለ
ስንቴ እንዳቆሰልኩህ …
ስንቴ እንደወጋሁህ : እኔን ታወቀኝ የለ!
ያ …የጲላጦስ ጭፍራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 8
በመስቀል ላይ ሳለህ በሞት በመከራ
በጦሩ ቢወጋህ ሳያዝን ሳይራራ
ከቀኝ ጎን አፍስሰህ ውኃው ከደም ጋራ
በፍቅርህ ስታስረው ዐይኑን ስታበራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 9
ትዕግስትህን ጎትቶት ባንተ እንደ ተጠራ
ምናለ እንደው ’ኔንም …
ላንተ ብቻ እንዲያድር : ልቤን ብታበራ
ላንዴ እስከወዲያኛው

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 10
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ሰው ባ’ረገኝ ፣ ያቺንም
ምነው በመሰልኳት
የቺን አመንዝራ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 11
እንደርሷ ላንድ ቀን : ከፊትህ ብጠራ
ለዝሙት አይደለም ነፍሴን ለማሳደፍ
አልያም ለመርከስ መቅደስክን ለማጉደፍ
በዚያ መንገድማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 12
ነውርን በመሸከም : መች ከእርሷ አንሳለሁ
ሕግህን በማፍረስ …
እኔን ታውቀኝ የለ : ምን እነግርሃለው
ያቺን … ድኩም ዘማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 13
በኃጢአቷ ቆስላ በበደሏ ታ’ማ
ዓለም ተሰብስቦ ሕይወቷን ሊቀማ
እንዲወግሯት ሳትፈርድ ቸርነትህ ቀድማ
መሬቱን ስትጭር ድምጽህ ሳይሰማ

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 14
ነውሯን እንደቀበርክ በከሳሽ ፊት ቆማ
ዳግም አትበድዪ : በፍቅር ሂጂ እንዳልካት
እንደው የኔንም ነፍስ …
ምናለ መልሰህ: እንዲያ በማረካት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 15
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ባ’ረገኝ ፣ ያቺንም ሴት

CHORUS
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ',
      lyrics_transliteration = 'CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 1
Yan yeqegn wenbede
Bimeslew la’ndqen : bayew mengede
Lemesreq aydelem nibret lemeqemat
Alyam lemezref hiywetn lemat’fat

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 2
Beziya mengedma
Kesus bibelt’ enji mech keersu ansna
Enen tawqegn yele …
Yewenbede aleqa ya’t’iategnoch wana

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 3
Ya … ts’ets’et yazele
Beziyach yech’nq seat «asbegn» eyale
Kemesqelh t’la kesr silewale
Ka’dam qedmo geba mihret teqebele

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 4
Enem ende t’t’os : mataye endiyamr
Bitlegn min ale? …
«kegenet tet’elel: zaren keene eder»
Lande eskewediyagnaw

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 5
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku : zaren keene eder»
De’mo yihn temegnehu
Lenginosn behonku

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 6
Yachin elete arb : qeranyo bewalku
Leamets’ aydelem : kekeayhud lemaber
Alyam lemewgat : yanten gon bet’or
Beziya mengedma

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 7
Anten lemasamem: man enen mesele
Sinte endaqoselkuh …
Sinte endewegahuh : enen taweqegn yele!
Ya …yep’ilat’os ch’fra

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 8
Bemesqel lay saleh bemot bemekera
Bet’oru biwegah sayazn sayrara
Keqegn gon afsseh wihaw kedem gara
Befqrh sitasrew aynun sitabera

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 9
Tiegsthn gottot bante ende tet’era
Minale endew ’nenm …
Lante bicha endiyadr : liben bitabera
Lande eskewediyagnaw

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 10
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku sew ba’regegn , yachinm
Minew bemeselkwat
Yechin amenzra

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 11
Enderswa land qen : kefith bit’era
Lezmut aydelem nefsen lemasadef
Alyam lemerkes meqdeskn lemagudef
Beziya mengedma

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 12
Newrn bemeshekem : mech keerswa ansalehu
Highn bemafres …
Enen tawqegn yele : min enegrhalew
Yachin … dikum zema

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 13
Behat’iatwa qosla bebedelwa ta’ma
Alem tesebsbo hiywetwan liqema
Endiwegrwat satferd cherneth qedma
Meretun sitch’r dimts’h saysema

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 14
Newrwan endeqeberk bekesash fit qoma
Dagm atbedyi : befqr hiji endalkat
Endew yenenm nefs …
Minale melseh: endiya bemarekat

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 15
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku ba’regegn , yachinm set

CHORUS
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yebegena-mezimur-di-n-abel-tesifaye-lanide-esikewediyagnawu-gitim-megabe'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ
ምነው እሱን በሆንኩ

VERSE 1
ያን የቀኝ ወንበዴ
ብመስለው ላ’ንድቀን : ባየው መንገዴ
ለመስረቅ አይደለም ንብረት ለመቀማት
አልያም ለመዝረፍ ሕይወትን ለማጥፋት

VERSE 2
በዚያ መንገድማ
ከሱስ ብበልጥ እንጂ መች ከእርሱ አንስና
እኔን ታውቀኝ የለ …
የወንበዴ አለቃ ያ’ጢኣተኞች ዋና

VERSE 3
ያ … ጸጸት ያዘለ
በዚያች የጭንቅ ሠዓት «አስበኝ» እያለ
ከመስቀልህ ጥላ ከሥር ስለዋለ
ካ’ዳም ቀድሞ ገባ ምሕረት ተቀበለ

VERSE 4
እኔም እንደ ጥጦስ : ማታዬ እንዲያምር
ብትለኝ ምን አለ? …
«ከገነት ተጠለል: ዛሬን ከእኔ እደር»
ላንዴ እስከወዲያኛው

VERSE 5
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ : ዛሬን ከእኔ እደር»
ደ’ሞ ይህን ተመኘሁ
ለንጊኖስን በሆንኩ

VERSE 6
ያቺን ዕለተ ዓርብ : ቀራንዮ በዋልኩ
ለአመጽ አይደለም : ከከአይሁድ ለማበር
አልያም ለመውጋት : ያንተን ጎን በጦር
በዚያ መንገድማ

VERSE 7
አንተን ለማሳመም: ማን እኔን መሰለ
ስንቴ እንዳቆሰልኩህ …
ስንቴ እንደወጋሁህ : እኔን ታወቀኝ የለ!
ያ …የጲላጦስ ጭፍራ

VERSE 8
በመስቀል ላይ ሳለህ በሞት በመከራ
በጦሩ ቢወጋህ ሳያዝን ሳይራራ
ከቀኝ ጎን አፍስሰህ ውኃው ከደም ጋራ
በፍቅርህ ስታስረው ዐይኑን ስታበራ

VERSE 9
ትዕግስትህን ጎትቶት ባንተ እንደ ተጠራ
ምናለ እንደው ’ኔንም …
ላንተ ብቻ እንዲያድር : ልቤን ብታበራ
ላንዴ እስከወዲያኛው

VERSE 10
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ሰው ባ’ረገኝ ፣ ያቺንም
ምነው በመሰልኳት
የቺን አመንዝራ

VERSE 11
እንደርሷ ላንድ ቀን : ከፊትህ ብጠራ
ለዝሙት አይደለም ነፍሴን ለማሳደፍ
አልያም ለመርከስ መቅደስክን ለማጉደፍ
በዚያ መንገድማ

VERSE 12
ነውርን በመሸከም : መች ከእርሷ አንሳለሁ
ሕግህን በማፍረስ …
እኔን ታውቀኝ የለ : ምን እነግርሃለው
ያቺን … ድኩም ዘማ

VERSE 13
በኃጢአቷ ቆስላ በበደሏ ታ’ማ
ዓለም ተሰብስቦ ሕይወቷን ሊቀማ
እንዲወግሯት ሳትፈርድ ቸርነትህ ቀድማ
መሬቱን ስትጭር ድምጽህ ሳይሰማ

VERSE 14
ነውሯን እንደቀበርክ በከሳሽ ፊት ቆማ
ዳግም አትበድዪ : በፍቅር ሂጂ እንዳልካት
እንደው የኔንም ነፍስ …
ምናለ መልሰህ: እንዲያ በማረካት

VERSE 15
ላንዴ እስከወዲያኛው
ያንን ሰው ባ’ረገኝ ፣ ያቺንም ሴት በሆንኩ
ላልወጣ ገብቼ ፡ ላልመለስ በሔድኩ ባ’ረገኝ ፣ ያቺንም ሴት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku
Minew esun behonku

VERSE 1
Yan yeqegn wenbede
Bimeslew la’ndqen : bayew mengede
Lemesreq aydelem nibret lemeqemat
Alyam lemezref hiywetn lemat’fat

VERSE 2
Beziya mengedma
Kesus bibelt’ enji mech keersu ansna
Enen tawqegn yele …
Yewenbede aleqa ya’t’iategnoch wana

VERSE 3
Ya … ts’ets’et yazele
Beziyach yech’nq seat «asbegn» eyale
Kemesqelh t’la kesr silewale
Ka’dam qedmo geba mihret teqebele

VERSE 4
Enem ende t’t’os : mataye endiyamr
Bitlegn min ale? …
«kegenet tet’elel: zaren keene eder»
Lande eskewediyagnaw

VERSE 5
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku : zaren keene eder»
De’mo yihn temegnehu
Lenginosn behonku

VERSE 6
Yachin elete arb : qeranyo bewalku
Leamets’ aydelem : kekeayhud lemaber
Alyam lemewgat : yanten gon bet’or
Beziya mengedma

VERSE 7
Anten lemasamem: man enen mesele
Sinte endaqoselkuh …
Sinte endewegahuh : enen taweqegn yele!
Ya …yep’ilat’os ch’fra

VERSE 8
Bemesqel lay saleh bemot bemekera
Bet’oru biwegah sayazn sayrara
Keqegn gon afsseh wihaw kedem gara
Befqrh sitasrew aynun sitabera

VERSE 9
Tiegsthn gottot bante ende tet’era
Minale endew ’nenm …
Lante bicha endiyadr : liben bitabera
Lande eskewediyagnaw

VERSE 10
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku sew ba’regegn , yachinm
Minew bemeselkwat
Yechin amenzra

VERSE 11
Enderswa land qen : kefith bit’era
Lezmut aydelem nefsen lemasadef
Alyam lemerkes meqdeskn lemagudef
Beziya mengedma

VERSE 12
Newrn bemeshekem : mech keerswa ansalehu
Highn bemafres …
Enen tawqegn yele : min enegrhalew
Yachin … dikum zema

VERSE 13
Behat’iatwa qosla bebedelwa ta’ma
Alem tesebsbo hiywetwan liqema
Endiwegrwat satferd cherneth qedma
Meretun sitch’r dimts’h saysema

VERSE 14
Newrwan endeqeberk bekesash fit qoma
Dagm atbedyi : befqr hiji endalkat
Endew yenenm nefs …
Minale melseh: endiya bemarekat

VERSE 15
Lande eskewediyagnaw
Yann sew ba’regegn , yachinm set behonku
Lalwet’a gebche lalmeles behedku ba’regegn , yachinm set'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yebegena-mezimur-di-n-abel-tesifaye-lanide-esikewediyagnawu-gitim-megabe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yebegena Mezimur Mogese Nesh (yebegena-mezimur-mogese-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 1
አመስግኘ ልጨርስ ምንም ቃል አይበቃ
መታወቂያ አርማዬ አሽ የነፍሴ ዉበት
ታምኛለሁ በምልጃሽ የቤቴ ሙላት
በልብሽ ዉስጥ አኑሪኝ ጥሪኝ በአፍሽ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 2
በንጽህናሽ አስጊጭኝ ልቁም ከፊትሽ
መሻቴን ልትሞይ ጸሎቴን ልትሰሚ
ኪዳነቃል ነይልኝ በረድኤት ቅደሚ
በእደስጋ አይደለም በእደ ህሊናየ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 3
እናቴ ይዠየሻለሁ ሁኝኝ ከለላዬ
የራሴ ጌጥ ቀጸላ ነሽና ማዕረጌ
በሰላም እኖራለሁ አንቺን ተስፋ አድርጌ
የቃልኪዳን መዝገብ ርህሩህ ልብ አለሽ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 4
ስላንቺ ይምረኛል ጽኑ ነዉ ኪዳንሽ
ስምሽ በአፌ ጣፈጠ ምግብ መጠጥ ሆነኝ
የምስጥሬ ምስጢር ነሽ ኪዳንሽ ያቆመኝ

CHORUS
ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ',
      lyrics_transliteration = 'CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 1
Amesggne lich’ers minm qal aybeqa
Metaweqiya armaye ash yenefse wubet
Tamgnalehu bemljash yebete mulat
Belbsh wust’ anurign t’rign beafsh

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 2
Bents’hnash asgich’gn liqum kefitsh
Meshaten litmoy ts’eloten litsemi
Kidaneqal neylgn beredet qidemi
Beedesga aydelem beede hilinaye

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 3
Enate yizheyeshalehu hugngn kelelaye
Yerase get’ qets’ela neshna maerege
Beselam enoralehu anchin tesfa adrge
Yeqalkidan mezgeb rihruh lib alesh

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 4
Silanchi yimregnal ts’nu newu kidansh
Simsh beafe t’afet’e migb met’et’ honegn
Yemst’re mist’ir nesh kidansh yaqomegn

CHORUS
Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yebegena-mezimur-mogese-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከአፌ የማይጠፋ ስምሽ
ኪዳነ ምኅረጽ እልሻለሁ
በነግህ በሰርክ እጠራሻለሁ 2
ሆነሽኛል ማዕረጌ የአንደበቴ ቋንቋ

VERSE 1
አመስግኘ ልጨርስ ምንም ቃል አይበቃ
መታወቂያ አርማዬ አሽ የነፍሴ ዉበት
ታምኛለሁ በምልጃሽ የቤቴ ሙላት
በልብሽ ዉስጥ አኑሪኝ ጥሪኝ በአፍሽ

VERSE 2
በንጽህናሽ አስጊጭኝ ልቁም ከፊትሽ
መሻቴን ልትሞይ ጸሎቴን ልትሰሚ
ኪዳነቃል ነይልኝ በረድኤት ቅደሚ
በእደስጋ አይደለም በእደ ህሊናየ

VERSE 3
እናቴ ይዠየሻለሁ ሁኝኝ ከለላዬ
የራሴ ጌጥ ቀጸላ ነሽና ማዕረጌ
በሰላም እኖራለሁ አንቺን ተስፋ አድርጌ
የቃልኪዳን መዝገብ ርህሩህ ልብ አለሽ

VERSE 4
ስላንቺ ይምረኛል ጽኑ ነዉ ኪዳንሽ
ስምሽ በአፌ ጣፈጠ ምግብ መጠጥ ሆነኝ
የምስጥሬ ምስጢር ነሽ ኪዳንሽ ያቆመኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Keafe yemayt’efa simsh
Kidane mihrets’ elshalehu
Benegh beserk et’erashalehu 2
Honeshgnal maerege yeandebete qwanqwa

VERSE 1
Amesggne lich’ers minm qal aybeqa
Metaweqiya armaye ash yenefse wubet
Tamgnalehu bemljash yebete mulat
Belbsh wust’ anurign t’rign beafsh

VERSE 2
Bents’hnash asgich’gn liqum kefitsh
Meshaten litmoy ts’eloten litsemi
Kidaneqal neylgn beredet qidemi
Beedesga aydelem beede hilinaye

VERSE 3
Enate yizheyeshalehu hugngn kelelaye
Yerase get’ qets’ela neshna maerege
Beselam enoralehu anchin tesfa adrge
Yeqalkidan mezgeb rihruh lib alesh

VERSE 4
Silanchi yimregnal ts’nu newu kidansh
Simsh beafe t’afet’e migb met’et’ honegn
Yemst’re mist’ir nesh kidansh yaqomegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yebegena-mezimur-mogese-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yebegena Mezimur Yanite Yihun Mirichaye Memihir Abel Tesifaye (yebegena-mezimur-yanite-yihun-mirichaye-memihir-abel-tesifaye)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yebegena-mezimur-yanite-yihun-mirichaye-memihir-abel-tesifaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከኔ ሃሳብ ይልቅ ይንተ ሃሳብ ይበልጣል
ሚጠቅመኝን ነገር ካንተ ውጪ ማን ያውቃል
ስራህ ትክክል ነው አምናለው ጌታዬ
የኔ ይቅርና የአንተ ይሁን ምርጫዬ

VERSE 1
ይጠቅመኛል ምለው መጥፊያዬ ይሆናል
ያለአንተ የያዝኩት ከእጄ ይበተናል
ምንም ብዘገይም ገብቶኛል ምስጢሩ
በአንተ እንጂ በራስ አይቻል መኖሩ

VERSE 2
. .
የሰማይ አዕዋፋትን አይቼ ይደንቀኛል
የዕለት ምግባቸውን ከአንተ አግኝተዋል
ሳይዘሩ ሳያጭዱ በአንተማ ከኖሩ

VERSE 3
ለኔ ምን ይጠቅመኛል በጭንቀት መኖሩ
በማይጠቅመው ነገር ሲባዝን ይውላል
አልሳካ ሲለው ለምን ለምን ይላል
ሚሳካው በአንተ ነው እቅድና ህልሜ

VERSE 4
በማንስ ሆነና ዛሬ ላይ መቆሜ
በአንተ እየተሰጠኝ የዕለት እንጀራ
ታድያ ለምንድን ነው ልቤ እንዲ ሚፈራ
እምነት ጎሎብኝ ነው ባክህ ጨምርልኝ

VERSE 5
በአንተ ፍቃድ እንጂ በራሴ መች ኖርኩኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kene hasab yilq yinte hasab yibelt’al
Mit’eqmegnn neger kante wich’i man yawqal
Sirah tikkl new amnalew Getaye
Yene yiqrna yeante yihun mirch’aye

VERSE 1
Yit’eqmegnal milew met’fiyaye yihonal
Yaleante yeyazkut keeje yibetenal
Minm bizegeym gebtognal mist’iru
Beante enji beras aychal menoru

VERSE 2
. .
Yesemay aewafatn ayche yidenqegnal
Yeelet migbachewn keante aggntewal
Sayzeru sayach’du beantema kenoru

VERSE 3
Lene min yit’eqmegnal bech’nqet menoru
Bemayt’eqmew neger sibazn yiwlal
Alsaka silew lemn lemn yilal
Misakaw beante new eqdna hilme

VERSE 4
Bemans honena zare lay meqome
Beante eyeteset’egn yeelet enjera
Tadya lemndn new libe endi mifera
Emnet golobgn new bakh ch’emrlgn

VERSE 5
Beante fiqad enji berase mech norkugn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yebegena-mezimur-yanite-yihun-mirichaye-memihir-abel-tesifaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yebirihan Dej Nat (yebirihan-dej-nat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን ይድረሰን ይሰጠን እያሉ
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የኀጢአት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት ኧረ እንዴት ድንግል ትኑርበት ኦኦ

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለ ኀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
/አዝ
ልባቸውን የዘጉ ድንግልን ለማስገባት

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 3
ሕሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦ
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው❨፪×❩

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ',
      lyrics_transliteration = 'CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 1
Ts’egash yidresen yidresen yiset’en eyalu
Yene lib min ts’dq alew anchin lemastenaged
Yehet’iat gotera new yetemola besst
ኧre endet ኧre endet Dingil tinurbet oo

CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 2
Atts’eyefm yenen lib tasenadawalech
Sile het’yate yeene enat milja taqerbalech
/az
Libachewn yezegu dingln lemasgebat

CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 3
Hilinachew yimeles ents’ely lezih t’fat
Amlakn yiza new Dingil yemtmet’aw oo
Erswan sinmels getan new yemnasqeymew❨2×❩

CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yebirihan-dej-nat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን ይድረሰን ይሰጠን እያሉ
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የኀጢአት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት ኧረ እንዴት ድንግል ትኑርበት ኦኦ

VERSE 2
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለ ኀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
/አዝ
ልባቸውን የዘጉ ድንግልን ለማስገባት

VERSE 3
ሕሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦ
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው❨፪×❩'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 1
Ts’egash yidresen yidresen yiset’en eyalu
Yene lib min ts’dq alew anchin lemastenaged
Yehet’iat gotera new yetemola besst
ኧre endet ኧre endet Dingil tinurbet oo

VERSE 2
Atts’eyefm yenen lib tasenadawalech
Sile het’yate yeene enat milja taqerbalech
/az
Libachewn yezegu dingln lemasgebat

VERSE 3
Hilinachew yimeles ents’ely lezih t’fat
Amlakn yiza new Dingil yemtmet’aw oo
Erswan sinmels getan new yemnasqeymew❨2×❩'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yebirihan-dej-nat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yebirihan Gorif Nat Yeoritodokis Mezimur (yebirihan-gorif-nat-yeoritodokis-mezimur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ጽድቅ አለው አንቺን ለማስተናገድ
የኃጢያት ጎተራ ነው የተሞላ በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦኦኦ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የእኔን ልብ ታሳናዳዋለች
ስለ ኃጢአቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ',
      lyrics_transliteration = 'CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 1
Ts’egash yidresen (2)yiset’en eyalu
Yeene lib min ts’dq alew anchin lemastenaged
Yehat’iyat gotera new yetemola besst
ኧre endet (2) Dingil tinurbet ooo

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 2
Atts’eyefm yeenen lib tasanadawalech
Sile hat’iate yeene enat milja taqerbalech
Libachewn yezegu dingln lemasgebat
Hilinachew yimeles ents’ely lezih t’fat

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 3
Amlakn yiza new Dingil yemtmet’aw ooo
Eswan sinmels Geta newn yemnasqeymew

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yebirihan-gorif-nat-yeoritodokis-mezimur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦኦኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ጽድቅ አለው አንቺን ለማስተናገድ
የኃጢያት ጎተራ ነው የተሞላ በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦኦኦ

VERSE 2
አትፀየፍም የእኔን ልብ ታሳናዳዋለች
ስለ ኃጢአቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen ooo
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 1
Ts’egash yidresen (2)yiset’en eyalu
Yeene lib min ts’dq alew anchin lemastenaged
Yehat’iyat gotera new yetemola besst
ኧre endet (2) Dingil tinurbet ooo

VERSE 2
Atts’eyefm yeenen lib tasanadawalech
Sile hat’iate yeene enat milja taqerbalech
Libachewn yezegu dingln lemasgebat
Hilinachew yimeles ents’ely lezih t’fat

VERSE 3
Amlakn yiza new Dingil yemtmet’aw ooo
Eswan sinmels Geta newn yemnasqeymew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yebirihan-gorif-nat-yeoritodokis-mezimur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yebrhan Gorf Nat Dingl Enatachn (yebrhan-gorf-nat-dingl-enatachn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ፅድቅ አለው አንቺ ለማስተናገድ
የሀጥያት ጎተራ ነው የተሞላው በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦ ኦ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የእኔ ልብ ታሳናዳዋለች
ስለሀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦ ኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ',
      lyrics_transliteration = 'CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 1
Ts’egash yidresen (2)yiset’en eyalu
Yeene lib min ts’dq alew anchi lemastenaged
Yehet’yat gotera new yetemolaw besst
ኧre endet (2) Dingil tinurbet o o

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 2
Atts’eyefm yeene lib tasanadawalech
Silehet’yate yeene enat milja taqerbalech
Libachewn yezegu dingln lemasgebat
Hilinachew yimeles ents’ely lezih t’fat

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 3
Amlakn yiza new Dingil yemtmet’aw o o
Eswan sinmels Geta newn yemnasqeymew

CHORUS
Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yebrhan-gorf-nat-dingl-enatachn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን ኦ ኦ
ፍጥረት በሙሉ(2)ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን(2)ይሰጠን እያሉ
የእኔ ልብ ምን ፅድቅ አለው አንቺ ለማስተናገድ
የሀጥያት ጎተራ ነው የተሞላው በስሥት
ኧረ እንዴት(2) ድንግል ትኑርበት ኦ ኦ

VERSE 2
አትፀየፍም የእኔ ልብ ታሳናዳዋለች
ስለሀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት

VERSE 3
አምላክን ይዛ ነው ድንግል የምትመጣው ኦ ኦ
እሷን ስንመልስ ጌታ ነውን የምናስቀይመው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yebrhan gorf nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshn selamshn dihnet yihunen o o
Fit’ret bemulu (2)fitsh yiwedqalu

VERSE 1
Ts’egash yidresen (2)yiset’en eyalu
Yeene lib min ts’dq alew anchi lemastenaged
Yehet’yat gotera new yetemolaw besst
ኧre endet (2) Dingil tinurbet o o

VERSE 2
Atts’eyefm yeene lib tasanadawalech
Silehet’yate yeene enat milja taqerbalech
Libachewn yezegu dingln lemasgebat
Hilinachew yimeles ents’ely lezih t’fat

VERSE 3
Amlakn yiza new Dingil yemtmet’aw o o
Eswan sinmels Geta newn yemnasqeymew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yebrhan-gorf-nat-dingl-enatachn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yedemasko Merkogna Negn (yedemasko-merkogna-negn)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yedemasko-merkogna-negn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የደማስቆ ምርኮኛ ነኝ የተሸነፋኩ
ፋቅሩ ሰብሮ የተፈወስኩ
ማሳዳጃ ደብዳቤየን ከእጄ ጥሎ
ዳሶኝ ሄደ በልቤ ላይ ወንጌል ተክሎ(2)

VERSE 1
ዛቻየን አነሳሁ ከወንድሞቸ ላይ
ጉዞየን ጀመርኩኝ በአዲሱ ምዕራፋ ላይ
ሳዖል ከነስሜ ታሪኬ ተዘግቷል
ስሙን ከአመኑት ጋር ስሜ ተቀላቅሏል

VERSE 2
።።።።።።።።።።።አዝ።።።።።።።።።።።።
የፋቅሩ ብርሀን ደማስቆ የጣለኝ
ልቤን አሸንፎ ለአገልግሎት ለየኝ
የመውጊያውን ብረት ላልቃወም ከቶ

VERSE 3
አስተምሮኝ ሄደ ፋቅሩ ልቤን መቶ
።።።።።።።።።።አዝ።።።።።።።።።።
ስሙን ያመኑትን ለመግደል ወጥቸ
ተሸንፌ መጣሁ እኔ እራሴን ሞቼ

VERSE 4
ገዳይ ነው በፋቅሩ አይተውም አቁስሎ
ሞቴን ወሰደልኝ ህይወት በእጄ ጥሎ
።።።።።።።።።።።።አዝ።።።።።።።።።።።
ለእኔ የሚረባኝን ስለእሱ ንቂያለሁ

VERSE 5
ቢሆን በሞቱ እንኳን ልመስለው እወዳለሁ
ግደል ያላቹህኝ ስሙን ያመኑትን
ከሚገደሉት ዘንድ ፈልጉት ጳውሎስን
።።።።።።።።።።።።።አዝ።።።።።።።።።።።

VERSE 6
ለእኔ የሚረባኝ ስለእሱ ንቂያለሁ
ቢሆን በሞቱ እንኳን ልመስለው እሻለሁ
ስሙን ያመኑትን ግደል ያላቹህኝ
ከሚገደሉት ዘንድ እኔኑ ፈልጉኝ

VERSE 7
።።።።።።።።።።።አዝ።።።።።።።።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yedemasqo mirkogna negn yeteshenefaku
Faqru sebro yetefewesku
Masadaja debdabeyen keeje t’lo
Dasogn hede belbe lay wengel teklo (2)

VERSE 1
Zachayen anesahu kewendmoche lay
Guzoyen jemerkugn beadisu mierafa lay
Saol kenesme tarike tezegtwal
Simun keamenut gar sime teqelaqlwal

VERSE 2
...........az............
Yefaqru birhen demasqo yet’alegn
Liben ashenfo leagelglot leyegn
Yemewgiyawn biret lalqawem keto

VERSE 3
Astemrogn hede faqru liben meto
..........az..........
Simun yamenutn lemegdel wet’che
Teshenfe met’ahu ene erasen moche

VERSE 4
Geday new befaqru aytewm aquslo
Moten wesedelgn hiywet beeje t’lo
............az...........
Leene yemirebagnn sileesu niqiyalehu

VERSE 5
Bihon bemotu enkwan limeslew ewedalehu
Gidel yalachuhgn simun yamenutn
Kemigedelut zend felgut p’awlosn
.............az...........

VERSE 6
Leene yemirebagn sileesu niqiyalehu
Bihon bemotu enkwan limeslew eshalehu
Simun yamenutn gidel yalachuhgn
Kemigedelut zend enenu felgugn

VERSE 7
...........az........'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yedemasko-merkogna-negn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yedenagil Memekiya (yedenagil-memekiya)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yedenagil-memekiya'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የደናግል መመኪያ የነቢያት ገዳም
አውደ አመቱን ባርኪልን ድንግል ማርያም
የአዋጅ ነጋሪው ቃል በበረሃ አየለ
የእግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 1
ምስክርነቱን ዮሐንስ ካስረዳን
ልባችን ለጌታ መልካም መንገድ ይሁን
ተራራው ዝቅ ይበል ጠማማውም ይቅና

VERSE 2
ካልተስተካከሉ መንገድ የለምና
የእግዚአብሔርን መንገድ እንጥረግ ሁላችን
ማለፊያ እንዲሆነን ለሰማይ ቤታችን

VERSE 3
ሁለት ልብሶች ያሉት ከማብዛት ልብስን
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንጻን አደራህ
በክፉ እንዳንጠፋ እኛ ባሮችህ

VERSE 4
ክፋትና ተንኮል ከልባችን ይጥፋ
ፍቅርና ርኅራኄ በእኛ ላይ ይስፋፋ
ሥጋና ደምህን በክብር አግኝተናል

VERSE 5
ሕይወት እንዲሆንን አምላክ ተማጽነናል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yedenagl memekiya yenebiyat gedam
Awde ametun barkiln Dingil Maryam
Yeawaj negariw qal bebereha ayele
Yeegziabhern menged astekaklu eyale

VERSE 1
Miskrnetun yohens kasredan
Libachn legeta melkam menged yihun
Teraraw ziq yibel t’emamawm yiqna

VERSE 2
Kaltestekakelu menged yelemna
Yeegziabhern menged ent’reg hulachn
Malefiya endihonen lesemay betachn

VERSE 3
Hulet libsoch yalut kemabzat libsn
Lelelew yadlew huletegnawn
Kebedelachnm ants’an aderah
Bekfu endant’efa egna barochh

VERSE 4
Kifatna tenkol kelbachn yit’fa
Fiqrna rihrahe beegna lay yisfafa
Sigana demhn bekbr aggntenal

VERSE 5
Hiywet endihonn amlak temats’nenal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yedenagil-memekiya', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeelet Yeamet Yezemenat Geta (yeelet-yeamet-yezemenat-geta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 1
ለዚህ ዕለት ለዚህ ዓመት ላደረሰን ሁላችንን/፪/
የሰው ልጆች እድሜ ጥንቱንም ሲጀመር
ምን ቢወጣ ቢወርድ ቢበዛ ቢደመር
አንድ ቀን አይሞላም እንደ አንተ አቆጣጠር /፪/

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 2
ስለዚህ አምላክ ሆይ ንዑድ ነው ክቡር ነው
ወደአንተ እንዲመለስ ቀን የሰጠኸው ሰው
ደካማ ነውና ሰው እድሜ ከራበው/፪/
እጅግ አደንቃለሁ የአምላክን ጥበብ

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 3
ምድርን በአበባ ሰማዩን በኮከብ
እንዳሸበረቀ አስተውዬ ሳስብ/፪/
ከንቱ ካሳለፍኩት ጊዜዬን በዋዛ
ምን ያደርግልኛል ዘመኔ ቢበዛ

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 4
ደግሞም በጠቅላላው ዓለምን ብገዛ/፪/
ወርኃ ክረምት አልፎ መስከረም ሲጠባ
ምድር በልምላሜ ስታጌጥ በአበባ
እናምናለን ለአንተ ምስጋና እንዲገባ/፪/

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን',
      lyrics_transliteration = 'CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 1
Lezih elet lezih amet laderesen hulachnn (2)
Yesew lijoch edme t’ntunm sijemer
Min biwet’a biwerd bibeza bidemer
And qen aymolam ende ante aqot’at’er (2)

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 2
Silezih amlak hoy niud new kibur new
Wedeante endimeles qen yeset’eኸw sew
Dekama newna sew edme kerabew (2)
Ejg adenqalehu yeamlakn t’beb

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 3
Midrn beabeba semayun bekokeb
Endashebereqe astewye sasb (2)
Kentu kasalefkut gizeyen bewaza
Min yaderglgnal zemene bibeza

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 4
Degmom bet’eqlalaw alemn bigeza (2)
Werha kiremt alfo meskerem sit’eba
Midr belmlame sitaget’ beabeba
Enamnalen leante misgana endigeba (2)

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeelet-yeamet-yezemenat-geta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 1
ለዚህ ዕለት ለዚህ ዓመት ላደረሰን ሁላችንን/፪/
የሰው ልጆች እድሜ ጥንቱንም ሲጀመር
ምን ቢወጣ ቢወርድ ቢበዛ ቢደመር
አንድ ቀን አይሞላም እንደ አንተ አቆጣጠር /፪/

VERSE 2
ስለዚህ አምላክ ሆይ ንዑድ ነው ክቡር ነው
ወደአንተ እንዲመለስ ቀን የሰጠኸው ሰው
ደካማ ነውና ሰው እድሜ ከራበው/፪/
እጅግ አደንቃለሁ የአምላክን ጥበብ

VERSE 3
ምድርን በአበባ ሰማዩን በኮከብ
እንዳሸበረቀ አስተውዬ ሳስብ/፪/
ከንቱ ካሳለፍኩት ጊዜዬን በዋዛ
ምን ያደርግልኛል ዘመኔ ቢበዛ

VERSE 4
ደግሞም በጠቅላላው ዓለምን ብገዛ/፪/
ወርኃ ክረምት አልፎ መስከረም ሲጠባ
ምድር በልምላሜ ስታጌጥ በአበባ
እናምናለን ለአንተ ምስጋና እንዲገባ/፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 1
Lezih elet lezih amet laderesen hulachnn (2)
Yesew lijoch edme t’ntunm sijemer
Min biwet’a biwerd bibeza bidemer
And qen aymolam ende ante aqot’at’er (2)

VERSE 2
Silezih amlak hoy niud new kibur new
Wedeante endimeles qen yeset’eኸw sew
Dekama newna sew edme kerabew (2)
Ejg adenqalehu yeamlakn t’beb

VERSE 3
Midrn beabeba semayun bekokeb
Endashebereqe astewye sasb (2)
Kentu kasalefkut gizeyen bewaza
Min yaderglgnal zemene bibeza

VERSE 4
Degmom bet’eqlalaw alemn bigeza (2)
Werha kiremt alfo meskerem sit’eba
Midr belmlame sitaget’ beabeba
Enamnalen leante misgana endigeba (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeelet-yeamet-yezemenat-geta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeerefite Enat (yeerefite-enat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 1
ንፅሕት ድንኻን
በእመነት ያጌጥኩብሽ
ሰላም ሆነ ብአማኒኤል ልጅስ (፪)
የብርሃን

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 2
ዝናር ባይኖረኝም
በንጉስ ፊት
ተሸልሜ በቆም
በልጅሽ ነው ውቤቴ ማማሩ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 3
ብምልጃሽ ነው
ስሜ መቀየረ
በልቤ ላይ
ተነበበ ልጅሽ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 4
አሁን ስሜ
ተጠርቷል በልጅሽ
ከታች ብምድር
እሰከሰማይ ድረስ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 5
ድርሻዬ ነው
ስምሽን ማወደስ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት',
      lyrics_transliteration = 'CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 1
Nits’ht dinኻn
Beemenet yaget’kubsh
Selam hone biamaniel lijs (2)
Yebrhan

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 2
Zinar baynoregnm
Bengus fit
Teshelme beqom
Beljsh new wibete mamaru

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 3
Bimljash new
Sime meqeyere
Belbe lay
Tenebebe lijsh

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 4
Ahun sime
Tet’ertwal beljsh
Ketach bimdr
Esekesemay dires

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 5
Dirshaye new
Simshn mawedes

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeerefite-enat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 1
ንፅሕት ድንኻን
በእመነት ያጌጥኩብሽ
ሰላም ሆነ ብአማኒኤል ልጅስ (፪)
የብርሃን

VERSE 2
ዝናር ባይኖረኝም
በንጉስ ፊት
ተሸልሜ በቆም
በልጅሽ ነው ውቤቴ ማማሩ

VERSE 3
ብምልጃሽ ነው
ስሜ መቀየረ
በልቤ ላይ
ተነበበ ልጅሽ

VERSE 4
አሁን ስሜ
ተጠርቷል በልጅሽ
ከታች ብምድር
እሰከሰማይ ድረስ

VERSE 5
ድርሻዬ ነው
ስምሽን ማወደስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 1
Nits’ht dinኻn
Beemenet yaget’kubsh
Selam hone biamaniel lijs (2)
Yebrhan

VERSE 2
Zinar baynoregnm
Bengus fit
Teshelme beqom
Beljsh new wibete mamaru

VERSE 3
Bimljash new
Sime meqeyere
Belbe lay
Tenebebe lijsh

VERSE 4
Ahun sime
Tet’ertwal beljsh
Ketach bimdr
Esekesemay dires

VERSE 5
Dirshaye new
Simshn mawedes'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeerefite-enat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yefelekegn Sitefa (yefelekegn-sitefa)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 1
ከብርልኝ ለኔስ እንዳንተ
ማንም የለኝም (2)
ካንተ ይልቅ የገዳዬን ደጅ መሻቴ
አስለቀሰኝ አንተ አሰኘኝ ሂወቴ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 2
ይገረመኛል እንዲህ አሰቀይሜህ በድዬህ
በምህረትህ ደግሞ ማቅረብህ ሰቅዬህ
አባብዬ የኔ መካሪ የማተወኝ የኔ መሃሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 3
እኔ በጦሪ ተጠራሪቼ ስወጋህ
አቀሪቅረህ ጨለማ አይኔ አነጋህ
የቤቴ እራስ መከበራያዬ ሆይ ግርማዬ
ማትረፈያዬ ሙላቴ አንተ ነህ መኩሪያዬ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 4
ወደ ሞት ጫፍ ካንተ ኮብልዬ ከአባቴ
ስንከራተት ጸጋዬ ደርቆ ዘይቴ
መዳሃኒቴ አንተ ባትመጣ ወደኔ
የእንባ ነበር የእንክርት ሂወት ዘመኔ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 5
በከንፈሬ ስምህ ተከትባል መድኔ
ካንተ በቀር ሌላ አያመልክም ልሳኔ
ካሁን በፊት ከዚህም በፊት ዘላለም
የማመልክህ አንተ ብቻ ነህ የኔ አለም

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 6
አባብዬ የኔ መካሪ የማተወኝ የኔ መሀሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት',
      lyrics_transliteration = 'CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 1
Kebrlgn lenes endante
Manm yelegnm (2)
Kante yilq yegedayen dej meshate
Asleqesegn ante asegnegn hiwete

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 2
Yigeremegnal endih aseqeymeh bedyeh
Bemhreth degmo maqrebh seqyeh
Ababye yene mekari yematewegn yene mehari
Beyqrtah degmo aqerebkegn litanoregn eyafeqerkegn

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 3
Ene bet’ori tet’erariche siwegah
Aqeriqreh ch’elema ayne anegah
Yebete eras mekeberayaye hoy girmaye
Matrefeyaye mulate ante neh mekuriyaye

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 4
Wede mot ch’af kante koblye keabate
Sinkeratet ts’egaye derqo zeyte
Medahanite ante batmet’a wedene
Yeenba neber yeenkrt hiwet zemene

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 5
Bekenfere simh teketbal medne
Kante beqer lela ayamelkm lisane
Kahun befit kezihm befit zelalem
Yemamelkh ante bicha neh yene alem

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 6
Ababye yene mekari yematewegn yene meheri
Beyqrtah degmo aqerebkegn litanoregn eyafeqerkegn

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yefelekegn-sitefa'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 1
ከብርልኝ ለኔስ እንዳንተ
ማንም የለኝም (2)
ካንተ ይልቅ የገዳዬን ደጅ መሻቴ
አስለቀሰኝ አንተ አሰኘኝ ሂወቴ

VERSE 2
ይገረመኛል እንዲህ አሰቀይሜህ በድዬህ
በምህረትህ ደግሞ ማቅረብህ ሰቅዬህ
አባብዬ የኔ መካሪ የማተወኝ የኔ መሃሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ

VERSE 3
እኔ በጦሪ ተጠራሪቼ ስወጋህ
አቀሪቅረህ ጨለማ አይኔ አነጋህ
የቤቴ እራስ መከበራያዬ ሆይ ግርማዬ
ማትረፈያዬ ሙላቴ አንተ ነህ መኩሪያዬ

VERSE 4
ወደ ሞት ጫፍ ካንተ ኮብልዬ ከአባቴ
ስንከራተት ጸጋዬ ደርቆ ዘይቴ
መዳሃኒቴ አንተ ባትመጣ ወደኔ
የእንባ ነበር የእንክርት ሂወት ዘመኔ

VERSE 5
በከንፈሬ ስምህ ተከትባል መድኔ
ካንተ በቀር ሌላ አያመልክም ልሳኔ
ካሁን በፊት ከዚህም በፊት ዘላለም
የማመልክህ አንተ ብቻ ነህ የኔ አለም

VERSE 6
አባብዬ የኔ መካሪ የማተወኝ የኔ መሀሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 1
Kebrlgn lenes endante
Manm yelegnm (2)
Kante yilq yegedayen dej meshate
Asleqesegn ante asegnegn hiwete

VERSE 2
Yigeremegnal endih aseqeymeh bedyeh
Bemhreth degmo maqrebh seqyeh
Ababye yene mekari yematewegn yene mehari
Beyqrtah degmo aqerebkegn litanoregn eyafeqerkegn

VERSE 3
Ene bet’ori tet’erariche siwegah
Aqeriqreh ch’elema ayne anegah
Yebete eras mekeberayaye hoy girmaye
Matrefeyaye mulate ante neh mekuriyaye

VERSE 4
Wede mot ch’af kante koblye keabate
Sinkeratet ts’egaye derqo zeyte
Medahanite ante batmet’a wedene
Yeenba neber yeenkrt hiwet zemene

VERSE 5
Bekenfere simh teketbal medne
Kante beqer lela ayamelkm lisane
Kahun befit kezihm befit zelalem
Yemamelkh ante bicha neh yene alem

VERSE 6
Ababye yene mekari yematewegn yene meheri
Beyqrtah degmo aqerebkegn litanoregn eyafeqerkegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yefelekegn-sitefa', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: yefkrekaye (yefkrekaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 1
ጸልማት እንክወረኒ ተስፉይ ማሲኑ ልበይ ክደሚ
ሪኡ ክፋስስ ንብዓተይ ሰማይ ሰንጢቁ
መጽዩኒ ጎይታይ ጽሓይ ኮይኑኒ ዒንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ ኣይተሰዓርኩን ጎይታይ ኣሎኒ ጉድጋድ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 2
ደፋኑስ ሂወት ሂቡኒ
ከም ኣምላኸይስ ማንም የለን ማንም የለን
ከም እግዛቢሄር ማንም የለን ማንም የለን
ከመ ፈጣሪየይ ማንም የለን ማንም የለን

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 3
ከመ ኣማኑኤል ማንም የለን ማንም የለን
ግሩም ዲንቂ ዩ ኣምላኸይ ግሩም ዲንቂ ዩ
ግሩም ዲንቂ ዩ ጎይታየይ ግሩም ዲንቂ ዩ
ሰብ ዝደርበዮ ካብ ምድሪ የልዐሎ እዩ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 4
ዝተረሰዐ ኣምላኸይ ይዝክር እዩ
ኣብቲ ብርቱዐ ማዐበል ክትኮነኒ ጸታ
ጭንቀይ እንዳ ረገጽካ መጺካኒ ጎይታ
ሓይሊ ናይ ሰብ እሞ ኣበይ ኣድሒኑኒ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 5
የማነይቲ ኢድካ እንተ ዘይትድግፈኒ
ታሪኸይ ቀያሪ መልክዐ ማንነተይ
ጸዋዐካኒ ጎይታ ንስኻ ዐረፍተይ
ተላዒለ ክውርውር ድምጺ ምስጋና

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 6
ከናፍረይ ኣፈልፉለ ተላዒለ ልሳነይ ትምስክር ኣላ
ምድሓኑ ሪእ ዓጊበ ተላዒለ እግረይ ናብ ቅዱስ መቅደስካ
እንሆ ኣንጊህ ይግስግስ ተላዒለ
ከም ብርቱዐ ገላቢ ፈረስ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 7
ብምስጋና ይመላለስ
ንዑ ንሕበር ንምስጋና
ንዑ ንሕበር ንውዳሴ
ንዑ ንሕበር ንኣምልኾ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 8
ንዑ ንሕበር ኣብ ጉባኤ

CHORUS
የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ',
      lyrics_transliteration = 'CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 1
Ts’elmat enkwereni tesfuy masinu libey kidemi
Riu kifass nibatey semay sent’iqu
Mets’yuni goytay ts’hay koynuni indi birhaney
Iyesus niay hiwet mengedey aytesearkun goytay aloni gudgad

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 2
Defanus hiwet hibuni
Kem amlaኸys manm yelen manm yelen
Kem egzabiher manm yelen manm yelen
Keme fet’ariyey manm yelen manm yelen

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 3
Keme amanuel manm yelen manm yelen
Girum dinqi yu amlaኸy girum dinqi yu
Girum dinqi yu goytayey girum dinqi yu
Seb ziderbeyo kab midri yelalo eyu

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 4
Ziteresea amlaኸy yizkr eyu
Abti birtua maabel kitkoneni ts’eta
Ch’nqey enda regets’ka mets’ikani goyta
Hayli nay seb emo abey adhinuni

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 5
Yemaneyti idka ente zeytdgfeni
Tariኸy qeyari melka mannetey
Ts’ewaakani goyta nisኻ areftey
Telaile kiwrwr dimts’i misgana

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 6
Kenafrey afelfule telaile lisaney timskr ala
Midhanu rie agibe telaile egrey nab Kidus meqdeska
Enho angih yigsgs telaile
Kem birtua gelabi feres

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 7
Bimsgana yimelales
Niu nihber nimsgana
Niu nihber niwdase
Niu nihber niamlኾ

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 8
Niu nihber ab gubae

CHORUS
Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yefkrekaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የፍቅረካ’የ ንስኻ ትፈልጥ እምበር
ይኣምነካ’የ ሰንከልከል በዚሑኒ እምበር
ክስዐበካ’የ ምሉእ ፍቅሪ ዓድለኒ
ጉድለት እምነተይ ኣርሒቅካ ተቀበለኒ

VERSE 1
ጸልማት እንክወረኒ ተስፉይ ማሲኑ ልበይ ክደሚ
ሪኡ ክፋስስ ንብዓተይ ሰማይ ሰንጢቁ
መጽዩኒ ጎይታይ ጽሓይ ኮይኑኒ ዒንዲ ብርሃነይ
ኢየሱስ ንዓይ ሂወት መንገደይ ኣይተሰዓርኩን ጎይታይ ኣሎኒ ጉድጋድ

VERSE 2
ደፋኑስ ሂወት ሂቡኒ
ከም ኣምላኸይስ ማንም የለን ማንም የለን
ከም እግዛቢሄር ማንም የለን ማንም የለን
ከመ ፈጣሪየይ ማንም የለን ማንም የለን

VERSE 3
ከመ ኣማኑኤል ማንም የለን ማንም የለን
ግሩም ዲንቂ ዩ ኣምላኸይ ግሩም ዲንቂ ዩ
ግሩም ዲንቂ ዩ ጎይታየይ ግሩም ዲንቂ ዩ
ሰብ ዝደርበዮ ካብ ምድሪ የልዐሎ እዩ

VERSE 4
ዝተረሰዐ ኣምላኸይ ይዝክር እዩ
ኣብቲ ብርቱዐ ማዐበል ክትኮነኒ ጸታ
ጭንቀይ እንዳ ረገጽካ መጺካኒ ጎይታ
ሓይሊ ናይ ሰብ እሞ ኣበይ ኣድሒኑኒ

VERSE 5
የማነይቲ ኢድካ እንተ ዘይትድግፈኒ
ታሪኸይ ቀያሪ መልክዐ ማንነተይ
ጸዋዐካኒ ጎይታ ንስኻ ዐረፍተይ
ተላዒለ ክውርውር ድምጺ ምስጋና

VERSE 6
ከናፍረይ ኣፈልፉለ ተላዒለ ልሳነይ ትምስክር ኣላ
ምድሓኑ ሪእ ዓጊበ ተላዒለ እግረይ ናብ ቅዱስ መቅደስካ
እንሆ ኣንጊህ ይግስግስ ተላዒለ
ከም ብርቱዐ ገላቢ ፈረስ

VERSE 7
ብምስጋና ይመላለስ
ንዑ ንሕበር ንምስጋና
ንዑ ንሕበር ንውዳሴ
ንዑ ንሕበር ንኣምልኾ

VERSE 8
ንዑ ንሕበር ኣብ ጉባኤ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yefqreka’ye nisኻ tifelt’ ember
Yiamneka’ye senkelkel bezihuni ember
Kisabeka’ye milue fiqri adleni
Gudlet emnetey arhiqka teqebeleni

VERSE 1
Ts’elmat enkwereni tesfuy masinu libey kidemi
Riu kifass nibatey semay sent’iqu
Mets’yuni goytay ts’hay koynuni indi birhaney
Iyesus niay hiwet mengedey aytesearkun goytay aloni gudgad

VERSE 2
Defanus hiwet hibuni
Kem amlaኸys manm yelen manm yelen
Kem egzabiher manm yelen manm yelen
Keme fet’ariyey manm yelen manm yelen

VERSE 3
Keme amanuel manm yelen manm yelen
Girum dinqi yu amlaኸy girum dinqi yu
Girum dinqi yu goytayey girum dinqi yu
Seb ziderbeyo kab midri yelalo eyu

VERSE 4
Ziteresea amlaኸy yizkr eyu
Abti birtua maabel kitkoneni ts’eta
Ch’nqey enda regets’ka mets’ikani goyta
Hayli nay seb emo abey adhinuni

VERSE 5
Yemaneyti idka ente zeytdgfeni
Tariኸy qeyari melka mannetey
Ts’ewaakani goyta nisኻ areftey
Telaile kiwrwr dimts’i misgana

VERSE 6
Kenafrey afelfule telaile lisaney timskr ala
Midhanu rie agibe telaile egrey nab Kidus meqdeska
Enho angih yigsgs telaile
Kem birtua gelabi feres

VERSE 7
Bimsgana yimelales
Niu nihber nimsgana
Niu nihber niwdase
Niu nihber niamlኾ

VERSE 8
Niu nihber ab gubae'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yefkrekaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yegebaw Yamesegen (yegebaw-yamesegen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 1
ቢያሸት ከሰማይ ሆኖ አለሙን
ሚችል መሸከም መሆን ዙፋኑ
ንጉስ ውበትሽ ስለ ወደደ
አንድያ ልጁን ወደ አንቺ ሰደደ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 2
የይስሐቅ መዓዛ የያይዕቆብ መሰላል
በሀሳብ በስጋ ፍፅምት እና ድንግል
የሳሙኤል ሽቶ መዓዛሽ ያማረ
በማህፀንሽ ፍሬ የአዳም ዘር ተማረ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 3
የኤፍሬም ድርሰቱ የያሬድ ውብ ዜማ
የአባ ህርያቆስ የቅዳሴው ግርማ
የመናኙ ፀሎት ለአይነ ስውር መሪ
ድንግል ትኖርናለሽ ፍጥረት ስታስምሪ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 4
አለም ምን ጋረደው ክብርሽን ለማየት
መሆንሽን ለአለም የመዳን ምክንያት
አንችን ጥሎ ሄዶ መዳን ስለሌለ
የገባው ያመስግን የልጅሽ ነኝ ያለ

CHORUS
ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ',
      lyrics_transliteration = 'CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 1
Biyashet kesemay hono alemun
Michl meshekem mehon zufanu
Nigus wibetsh sile wedede
Andya lijun wede anchi sedede

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 2
Yeysheq meaza yeyayeqob meselal
Behesab besga fits’mt ena Dingil
Yesamuel shto meazash yamare
Bemahts’ensh fire yeadam zer temare

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 3
Yeefrem dirsetu yeyared wib zema
Yeaba hiryaqos yeqdasew girma
Yemenagnu ts’elot leayne siwr meri
Dingil tinornalesh fit’ret sitasmri

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 4
Alem min garedew kibrshn lemayet
Mehonshn lealem yemedan miknyat
Anchn t’lo hedo medan silelele
Yegebaw yamesgn yeljsh negn yale

CHORUS
Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yegebaw-yamesegen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምሽ በአምላክ ዘንድ የሰለጠነ
ክብርሽ ለዝፋኑ የተመጠነ
የፅሀይ መውጫ ምስራቅ እናቱ
ታቦት ማደርያ ሆንሽ ለእውነቱ

VERSE 1
ቢያሸት ከሰማይ ሆኖ አለሙን
ሚችል መሸከም መሆን ዙፋኑ
ንጉስ ውበትሽ ስለ ወደደ
አንድያ ልጁን ወደ አንቺ ሰደደ

VERSE 2
የይስሐቅ መዓዛ የያይዕቆብ መሰላል
በሀሳብ በስጋ ፍፅምት እና ድንግል
የሳሙኤል ሽቶ መዓዛሽ ያማረ
በማህፀንሽ ፍሬ የአዳም ዘር ተማረ

VERSE 3
የኤፍሬም ድርሰቱ የያሬድ ውብ ዜማ
የአባ ህርያቆስ የቅዳሴው ግርማ
የመናኙ ፀሎት ለአይነ ስውር መሪ
ድንግል ትኖርናለሽ ፍጥረት ስታስምሪ

VERSE 4
አለም ምን ጋረደው ክብርሽን ለማየት
መሆንሽን ለአለም የመዳን ምክንያት
አንችን ጥሎ ሄዶ መዳን ስለሌለ
የገባው ያመስግን የልጅሽ ነኝ ያለ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simsh beamlak zend yeselet’ene
Kibrsh lezfanu yetemet’ene
Yets’hey mewch’a misraq enatu
Tabot maderya honsh leewnetu

VERSE 1
Biyashet kesemay hono alemun
Michl meshekem mehon zufanu
Nigus wibetsh sile wedede
Andya lijun wede anchi sedede

VERSE 2
Yeysheq meaza yeyayeqob meselal
Behesab besga fits’mt ena Dingil
Yesamuel shto meazash yamare
Bemahts’ensh fire yeadam zer temare

VERSE 3
Yeefrem dirsetu yeyared wib zema
Yeaba hiryaqos yeqdasew girma
Yemenagnu ts’elot leayne siwr meri
Dingil tinornalesh fit’ret sitasmri

VERSE 4
Alem min garedew kibrshn lemayet
Mehonshn lealem yemedan miknyat
Anchn t’lo hedo medan silelele
Yegebaw yamesgn yeljsh negn yale'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yegebaw-yamesegen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yegojoye Selam (yegojoye-selam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 1
ተፅናናው አንቺን አስቤ ምስጋና ሞልቶ በልቤ
ደነቀኝ ያንቺስ ውለታ በፍቅርሽ ልቤ ተረታ
እናቴ ፀጋሽ በዝቶልኝ መፅናኛ ሆንሽኝ ለቤቴ
በምልጃሽ ተደላደለ ጎስቋላ በራ ህይወቴ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 2
ስቃዬ ሸክሜ ቀለለ ፀሎትሽ አብሮኝ ስላለ
ማጎንበስ ቀረ ማፈሬ እማምላክ ገብተሽ ከበሬ
አይኖቼ ተስፋ ቢያደርጉም
ተማምነው በፍፁም ምልጃሽ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 3
በረከት ሰላም ተሞላው በረታው ደካማው ልጅ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 4
ያ ዘመን የተከዝኩበት አለፈ ሆኖ እንደዘበት
በመዳ ሲበተን ወዜ ማትረፊያ ሆንሽኝ ምርኩዜ
ምኞቴ አሁን ተሳካ ምን ልበል ስለውለታሽ
በደስታ ላፍስስ እንባዬን ገብቼ ወደ ማደሪያሽ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 5
ጥኡም ነሽ ናርዶስ ሽቶዬ ተባርኳል ባንቺ ጉዋዳዬ
የጠላት ወጥመድ ሳይጥለኝታላቁ ስምሽ ጠበቀኝ
ጉልበቴ ፀንቷል በእጆችሽ
ፈተሽው የውስጤን ችግር

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 6
ይደነቅ አለም በሙሉ ዝናሽን እኔም ልመስክር

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው',
      lyrics_transliteration = 'CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 1
Tets’nanaw anchin asbe misgana molto belbe
Deneqegn yanchis wileta befqrsh libe tereta
Enate ts’egash beztolgn mets’nagna honshgn lebete
Bemljash tedeladele gosqwala bera hiywete

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 2
Siqaye shekme qelele ts’elotsh abrogn silale
Magonbes qere mafere emamlak gebtesh kebere
Aynoche tesfa biyadergum
Temamnew befts’um miljash

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 3
Bereket selam temolaw beretaw dekamaw lij

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 4
Ya zemen yetekezkubet alefe hono endezebet
Bemeda sibeten weze matrefiya honshgn mirkuze
Mignote ahun tesaka min libel silewletash
Bedesta lafss enbayen gebche wede maderiyash

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 5
T’um nesh nardos shtoye tebarkwal banchi guwadaye
Yet’elat wet’med sayt’legntalaqu simsh t’ebeqegn
Gulbete ts’entwal beejochsh
Feteshw yewst’en chgr

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 6
Yideneq alem bemulu zinashn enem limeskr

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yegojoye-selam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 1
ተፅናናው አንቺን አስቤ ምስጋና ሞልቶ በልቤ
ደነቀኝ ያንቺስ ውለታ በፍቅርሽ ልቤ ተረታ
እናቴ ፀጋሽ በዝቶልኝ መፅናኛ ሆንሽኝ ለቤቴ
በምልጃሽ ተደላደለ ጎስቋላ በራ ህይወቴ

VERSE 2
ስቃዬ ሸክሜ ቀለለ ፀሎትሽ አብሮኝ ስላለ
ማጎንበስ ቀረ ማፈሬ እማምላክ ገብተሽ ከበሬ
አይኖቼ ተስፋ ቢያደርጉም
ተማምነው በፍፁም ምልጃሽ

VERSE 3
በረከት ሰላም ተሞላው በረታው ደካማው ልጅ

VERSE 4
ያ ዘመን የተከዝኩበት አለፈ ሆኖ እንደዘበት
በመዳ ሲበተን ወዜ ማትረፊያ ሆንሽኝ ምርኩዜ
ምኞቴ አሁን ተሳካ ምን ልበል ስለውለታሽ
በደስታ ላፍስስ እንባዬን ገብቼ ወደ ማደሪያሽ

VERSE 5
ጥኡም ነሽ ናርዶስ ሽቶዬ ተባርኳል ባንቺ ጉዋዳዬ
የጠላት ወጥመድ ሳይጥለኝታላቁ ስምሽ ጠበቀኝ
ጉልበቴ ፀንቷል በእጆችሽ
ፈተሽው የውስጤን ችግር

VERSE 6
ይደነቅ አለም በሙሉ ዝናሽን እኔም ልመስክር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 1
Tets’nanaw anchin asbe misgana molto belbe
Deneqegn yanchis wileta befqrsh libe tereta
Enate ts’egash beztolgn mets’nagna honshgn lebete
Bemljash tedeladele gosqwala bera hiywete

VERSE 2
Siqaye shekme qelele ts’elotsh abrogn silale
Magonbes qere mafere emamlak gebtesh kebere
Aynoche tesfa biyadergum
Temamnew befts’um miljash

VERSE 3
Bereket selam temolaw beretaw dekamaw lij

VERSE 4
Ya zemen yetekezkubet alefe hono endezebet
Bemeda sibeten weze matrefiya honshgn mirkuze
Mignote ahun tesaka min libel silewletash
Bedesta lafss enbayen gebche wede maderiyash

VERSE 5
T’um nesh nardos shtoye tebarkwal banchi guwadaye
Yet’elat wet’med sayt’legntalaqu simsh t’ebeqegn
Gulbete ts’entwal beejochsh
Feteshw yewst’en chgr

VERSE 6
Yideneq alem bemulu zinashn enem limeskr'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yegojoye-selam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: YeHaset Dagninet (yehaset-dagninet)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yehaset-dagninet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እውነት ስለሆን እየሱስ ክርስቶስ
ዋለ በአደባባይ ሲሰደብ ሲከሰስ

VERSE 1
የሐሰት ዳኝነት አምላክን ወቀሰው
ሕይወት ሰጠን እንጂ ጥፋቱ ምንድን ነው

VERSE 2
ከቃሉ እብለትን ባያገኙበትም
ዝምታውን አይተው አላዘኑለትም

VERSE 3
ባላወቁት መጠን ጠሉት ካለ በደል
ጥፋቱ ምን ይሆን የሚያደርስ ከመስቀል

VERSE 4
የልቡን ትህትና ፍቅሩን ሳያስተውሉ
ቸሩ ጌታችንን አቻኩለው ሰቀሉት

VERSE 5
እሩህሩሁን ጌታ አቻኩለው ገደሉት
ሞትን አስወጎዶ ቢሰጣቸው ህይወት

VERSE 6
ስለቸርለቱ ስድብን ከፈሉት
ስለርህራሄው የእሾህ አክሊል ሰጡት

VERSE 7
ሐሞትና ከርቤ ሆምጣጤ ደባልቀው
መራራ አስጎነጩት ጨክኖ ልባቸው

VERSE 8
ፈውስን ለሰጣቸው ልባቸውን ሞልተው
አሉት ወንበዴ ነው ስቀለው ስቀለው

VERSE 9
ከእጁ በረከትን የተሻሙ ሁሉ
ይጮኹ ነበር ይገደል እያሉ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ewnet silehon Eyesus Kristos
Wale beadebabay sisedeb sikeses

VERSE 1
Yehaset dagninet Amlakn weqesew
Hiywet seten enji t’ifat minidin new

VERSE 2
Keqalhu ibleten bayagenyubetim
Zimtawn aytew alazenuletim

VERSE 3
Balawkut met’en t’ellut kale bedel
T’ifat min yihon yemiyaderis kemeskel

VERSE 4
Yelibun tihit’ina fiqrun sayast’ewulu
Cheru getachinen achakulew seqelut

VERSE 5
Eruhrhun geta achakulew gedelut
Motn aswegodo bisetachew hiywet

VERSE 6
Silecherletu sidbin kefelut
Silerihrahéw ye’ishoh aklil setut

VERSE 7
Hamotna kerbe homt’agete debalqew
Merara asgonet’ut chekno libachew

VERSE 8
Fewsin lesetachew libachewn molt’ew
Alut wenbede new seqelew seqelew

VERSE 9
Kejuh bereketn yeteshamu hulu
Yichohu neber yigedel eyalu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yehaset-dagninet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yehiyiwet Meselal Amarigna Mezimur (yehiyiwet-meselal-amarigna-mezimur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 1
በቅድስና ያጌጠች የንጹሕ ዕጣን ሙዳይ ፣
ጸሎት ማሳረጊያ ወደ አምላክ አዶናይ ፣
ንጹሕ መዓዛቸው ለመላእክተ ሰማይ፣
ድንግል ሆይ /፪/ የወርቅ ማዕጠንት /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 2
ለምልማ የተገኘች የአሮን በትር ፣
ውኃ ሳያጠጧት ሳይተክሏት በምድር
አብባ ያፈራች ያለወንድ/፪/ ዘር፣
ድንግል ሆይ /፪/ የአምላክ ማኅደር /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 3
በዚያች ቤተልሔም በግርግም ስፍራ ፣
ሰብአ ሰገል ሰግደዋል ገብተው በየተራ ፣
በእቅፍሽ ስላዩ የሕይወትን/፪/ እንጀራ፣
ድንግል ሆይ /፪/ የተስፋ አዝመራ /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/',
      lyrics_transliteration = 'CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 1
Beqdsna yaget’ech yents’uh et’an muday ,
Ts’elot masaregiya wede amlak adonay ,
Nits’uh meazachew lemelaekte semay,
Dingil hoy (2) yewerq maet’ent (2)

CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 2
Lemlma yetegegnech yearon betr ,
Wiha sayat’et’wat sayteklwat bemdr
Abba yaferach yalewend (2) zer,
Dingil hoy (2) yeamlak mahder (2)

CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 3
Beziyach betelhem begrgm sifra ,
Seba segel segdewal gebtew beyetera ,
Beeqfsh silayu yehywetn (2) enjera,
Dingil hoy (2) yetesfa azmera (2)

CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yehiyiwet-meselal-amarigna-mezimur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 1
በቅድስና ያጌጠች የንጹሕ ዕጣን ሙዳይ ፣
ጸሎት ማሳረጊያ ወደ አምላክ አዶናይ ፣
ንጹሕ መዓዛቸው ለመላእክተ ሰማይ፣
ድንግል ሆይ /፪/ የወርቅ ማዕጠንት /፪/

VERSE 2
ለምልማ የተገኘች የአሮን በትር ፣
ውኃ ሳያጠጧት ሳይተክሏት በምድር
አብባ ያፈራች ያለወንድ/፪/ ዘር፣
ድንግል ሆይ /፪/ የአምላክ ማኅደር /፪/

VERSE 3
በዚያች ቤተልሔም በግርግም ስፍራ ፣
ሰብአ ሰገል ሰግደዋል ገብተው በየተራ ፣
በእቅፍሽ ስላዩ የሕይወትን/፪/ እንጀራ፣
ድንግል ሆይ /፪/ የተስፋ አዝመራ /፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 1
Beqdsna yaget’ech yents’uh et’an muday ,
Ts’elot masaregiya wede amlak adonay ,
Nits’uh meazachew lemelaekte semay,
Dingil hoy (2) yewerq maet’ent (2)

VERSE 2
Lemlma yetegegnech yearon betr ,
Wiha sayat’et’wat sayteklwat bemdr
Abba yaferach yalewend (2) zer,
Dingil hoy (2) yeamlak mahder (2)

VERSE 3
Beziyach betelhem begrgm sifra ,
Seba segel segdewal gebtew beyetera ,
Beeqfsh silayu yehywetn (2) enjera,
Dingil hoy (2) yetesfa azmera (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yehiyiwet-meselal-amarigna-mezimur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yehwanesen Yiza (yehwanesen-yiza)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 1
ያስገርም ነበረ የፈሰሰ እንባዋ(፪)
ዮሐንስ ቢደንቀው የሐዘኗ ፅናት
አነሳት ደግፎ በብርቱ ሊያፅናናት
ድንግልም አለችው ልጄ አሳዘነኝ

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 2
እህት ወንድም የለው ላልቅስለት ተወኝ (፪)
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
መግደላዊት ማርያም ሰሎሜ ዮሐና

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 3
ማርያምን አይዋት ፀንቶባት ሃዘኗ
በለቅሶዋ ጣዕም ተነክቶ ልባቸው
እንባን አፈሰሱ ውለታው ገብቷቸው
ከሁሉም ይበልጣል ያስደፋል አንገትን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 4
የማርያም ሐዘን
ራሔል አልቅሳለች ላላቀፈቻቸው
ድንግል ግን ብታለቅስ አዝላው ተሰዳ ነው
ያቆብም አልቅሷል በሌላ የሰው ደም

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 5
ማርያም ግን ብታለቅስ ፈሷል የልጇ ደም
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
ጠብቶ ስላደገ የድንግልና ጡቷን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 6
መቆም አልቻለችም ስታይ መጠማቱን
በደም ተሽፍኖ ብታየው ውበቱን
ለይልኝ አለችው ከስጋዋ ነብሷን

CHORUS
በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ',
      lyrics_transliteration = 'CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 1
Yasgerm nebere yefesese enbawa (2)
Yohens bidenqew yehezenwa ts’nat
Anesat degfo bebrtu liyats’nanat
Dinglm alechw lije asazenegn

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 2
Eht wendm yelew lalqslet tewegn (2)
Kehulum yibelt’al yasdefal angetn
YeMaryam hezen
Megdelawit Maryam selome yohena

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 3
Maryamn aywat ts’entobat hazenwa
Beleqsowa t’aem tenekto libachew
Enban afesesu wiletaw gebtwachew
Kehulum yibelt’al yasdefal angetn

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 4
YeMaryam hezen
Rahel alqsalech lalaqefechachew
Dingil gin bitaleqs azlaw teseda new
Yaqobm alqswal belela yesew dem

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 5
Maryam gin bitaleqs feswal yeljwa dem
Kehulum yibelt’al yasdefal angetn
YeMaryam hezen
T’ebto siladege yednglna t’utwan

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 6
Meqom alchalechm sitay met’ematun
Bedem teshfno bitayew wibetun
Leylgn alechw kesgawa nebswan

CHORUS
Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yehwanesen-yiza'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በእንተ ማርያም መሃረነ ክርስቶስ
ዮሐንስን ይዛ ወደ ቀራንዮ
ድንግል ማርያም ሔደች እያለች ወዮ
ስለ ልጇ ሐዘን ስለ መከራዋ

VERSE 1
ያስገርም ነበረ የፈሰሰ እንባዋ(፪)
ዮሐንስ ቢደንቀው የሐዘኗ ፅናት
አነሳት ደግፎ በብርቱ ሊያፅናናት
ድንግልም አለችው ልጄ አሳዘነኝ

VERSE 2
እህት ወንድም የለው ላልቅስለት ተወኝ (፪)
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
መግደላዊት ማርያም ሰሎሜ ዮሐና

VERSE 3
ማርያምን አይዋት ፀንቶባት ሃዘኗ
በለቅሶዋ ጣዕም ተነክቶ ልባቸው
እንባን አፈሰሱ ውለታው ገብቷቸው
ከሁሉም ይበልጣል ያስደፋል አንገትን

VERSE 4
የማርያም ሐዘን
ራሔል አልቅሳለች ላላቀፈቻቸው
ድንግል ግን ብታለቅስ አዝላው ተሰዳ ነው
ያቆብም አልቅሷል በሌላ የሰው ደም

VERSE 5
ማርያም ግን ብታለቅስ ፈሷል የልጇ ደም
ከሁሉም ይበልጣል ያስደፋል አንገትን
የማርያም ሐዘን
ጠብቶ ስላደገ የድንግልና ጡቷን

VERSE 6
መቆም አልቻለችም ስታይ መጠማቱን
በደም ተሽፍኖ ብታየው ውበቱን
ለይልኝ አለችው ከስጋዋ ነብሷን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Beente Maryam meharene Kristos
Yohensn yiza wede qeranyo
Dingil Maryam hedech eyalech weyo
Sile lijwa hezen sile mekerawa

VERSE 1
Yasgerm nebere yefesese enbawa (2)
Yohens bidenqew yehezenwa ts’nat
Anesat degfo bebrtu liyats’nanat
Dinglm alechw lije asazenegn

VERSE 2
Eht wendm yelew lalqslet tewegn (2)
Kehulum yibelt’al yasdefal angetn
YeMaryam hezen
Megdelawit Maryam selome yohena

VERSE 3
Maryamn aywat ts’entobat hazenwa
Beleqsowa t’aem tenekto libachew
Enban afesesu wiletaw gebtwachew
Kehulum yibelt’al yasdefal angetn

VERSE 4
YeMaryam hezen
Rahel alqsalech lalaqefechachew
Dingil gin bitaleqs azlaw teseda new
Yaqobm alqswal belela yesew dem

VERSE 5
Maryam gin bitaleqs feswal yeljwa dem
Kehulum yibelt’al yasdefal angetn
YeMaryam hezen
T’ebto siladege yednglna t’utwan

VERSE 6
Meqom alchalechm sitay met’ematun
Bedem teshfno bitayew wibetun
Leylgn alechw kesgawa nebswan'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yehwanesen-yiza', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeiyob Melisu (yeiyob-melisu)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeiyob-melisu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የኢዮብ መልሱ
እደምነህ ሚሉት ዘመዶች ከድተውት
ሚስቱ ትታው ሄዳ ልጆች ሞተውበት
አይኖቹ በምሬት እንባ አልፈሰሱም

VERSE 1
እግዚአብሔር ይመስገን ነበር የኢዮብ መልሱ /2×/
በህይወት ገጥሞት የበረታ ፅልመት
በአንድ ቀን ሲነጠቅ ልጆች ና ንብረት
አካሉ በቁስል ተይዞ በጠና

VERSE 2
ኢዮብ እንዴት ቻለ ለአምላኩ ምስጋና
በሰጠበት መንደር ሲቆም ለልመና
ሚስቱ ሙት ስትለው ጌታን እርገምና
የስንፍናን ነገር አየሰማም ጆሮዬ

VERSE 3
ይክሰኛል እርሱ ይችላል ጌታዬ
ቅን ነገር መናገር ለአፌ ከቸገረኝ
አምላኬ እንዳየያዝን ምነው ዝም ባልኩኝ
ልሳኔ እንዳይጠራ ሞትነና መከራ

VERSE 4
ለምስጋና ልቁም ነገን ዛሬ ልስራ
እግዚአብሔር ይመስገን ቢጎድልም ቢሞላ
ለአይኔ ሽፋሽፍት እንቅልፍ እንኳን ባጣም
ብዙ እንደ ነበረው ትላንትና ደጄ

VERSE 5
ክፉውንም ደግሞ ይቀበላል እጄ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeiyob melsu
Edemneh milut zemedoch kedtewt
Mistu titaw heda lijoch motewbet
Aynochu bemret enba alfesesum

VERSE 1
Egziabher yemesgen neber yeiyob melsu /2×/
Behywet get’mot yebereta ts’lmet
Beand qen sinet’eq lijoch na nibret
Akalu bequsl teyzo bet’ena

VERSE 2
Iyob endet chale leamlaku misgana
Beset’ebet mender siqom lelmena
Mistu mut sitlew getan ergemna
Yesnfnan neger ayesemam joroye

VERSE 3
Yiksegnal ersu yichlal Getaye
Qin neger menager leafe kechegeregn
Amlake endayeyazn minew zim balkugn
Lisane endayt’era motnena mekera

VERSE 4
Lemsgana liqum negen zare lisra
Egziabher yemesgen bigodlm bimola
Leayne shfashft enqlf enkwan bat’am
Bizu ende neberew tilantna deje

VERSE 5
Kifuwnm degmo yiqebelal eje'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeiyob-melisu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yekal Kidan Hager (yekal-kidan-hager)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 1
በከንቱ ምኞት ቃየል ተነሳሳ
በቁጣ በበቀል ድንጋዩን አነሳ
እርሱም ላይደሰት ላይቀር መቅበዝበዙ
በራሱም ይደርሳል ብዙ ነው መዘዙ

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 2
ግፍና መከራ ተፈራርቆብናል
ሰው በሰው ሲታረድ ባይናችን አይቸናል
ይብቃ ሰቆቃችን አይችል ተከሻችን
በምህረት እጅህ አብሰው እንባችን

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 3
የቀደመው ጠላት መከራን ያበዛል
በልጆቹ መሀል እንክርዳድ የዘራል
በመከር ሰብስቦ ላይቀር ማቃጠሉ
አንተ ግን ተስፋ ነህ ላመኑብህ ሁሉ

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 4
የራቀውን ማቅረብ ትችልበቻለህ
የወደቀን ማንሳት አምላኬ ታውቃለህ
እጆቿን ዘርግታ ማረኝ ትልሀለች
እማማ ኢትዮጵያ አንትን ትጣራለች

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 5
የመፅናናት አምላክ የቸርነት ጌታ
የበረከት ንጉስ ከቶ ማትረታ
መፍትሄው ካንተ ነው የሰላም አባት
እሩሩሁ ጌታ አንተው ታረቃት

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና',
      lyrics_transliteration = 'CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 1
Bekentu mignot qayel tenesasa
Bequt’a bebeqel dingayun anesa
Ersum laydeset layqer meqbezbezu
Berasum yidersal bizu new mezezu

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 2
Gifna mekera teferarqobnal
Sew besew sitared baynachn aychenal
Yibqa seqoqachn aychl tekeshachn
Bemhret ejh absew enbachn

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 3
Yeqedemew t’elat mekeran yabezal
Beljochu mehel enkrdad yezeral
Bemeker sebsbo layqer maqat’elu
Ante gin tesfa neh lamenubh hulu

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 4
Yeraqewn maqreb tichlbechaleh
Yewedeqen mansat amlake tawqaleh
Ejochwan zergta maregn tilhelech
Emama ityop’ya antn tit’aralech

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 5
Yemets’nanat amlak yechernet Geta
Yebereket nigus keto matreta
Mefthew kante new yeselam abat
Eruruhu Geta antew tareqat

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yekal-kidan-hager'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 1
በከንቱ ምኞት ቃየል ተነሳሳ
በቁጣ በበቀል ድንጋዩን አነሳ
እርሱም ላይደሰት ላይቀር መቅበዝበዙ
በራሱም ይደርሳል ብዙ ነው መዘዙ

VERSE 2
ግፍና መከራ ተፈራርቆብናል
ሰው በሰው ሲታረድ ባይናችን አይቸናል
ይብቃ ሰቆቃችን አይችል ተከሻችን
በምህረት እጅህ አብሰው እንባችን

VERSE 3
የቀደመው ጠላት መከራን ያበዛል
በልጆቹ መሀል እንክርዳድ የዘራል
በመከር ሰብስቦ ላይቀር ማቃጠሉ
አንተ ግን ተስፋ ነህ ላመኑብህ ሁሉ

VERSE 4
የራቀውን ማቅረብ ትችልበቻለህ
የወደቀን ማንሳት አምላኬ ታውቃለህ
እጆቿን ዘርግታ ማረኝ ትልሀለች
እማማ ኢትዮጵያ አንትን ትጣራለች

VERSE 5
የመፅናናት አምላክ የቸርነት ጌታ
የበረከት ንጉስ ከቶ ማትረታ
መፍትሄው ካንተ ነው የሰላም አባት
እሩሩሁ ጌታ አንተው ታረቃት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 1
Bekentu mignot qayel tenesasa
Bequt’a bebeqel dingayun anesa
Ersum laydeset layqer meqbezbezu
Berasum yidersal bizu new mezezu

VERSE 2
Gifna mekera teferarqobnal
Sew besew sitared baynachn aychenal
Yibqa seqoqachn aychl tekeshachn
Bemhret ejh absew enbachn

VERSE 3
Yeqedemew t’elat mekeran yabezal
Beljochu mehel enkrdad yezeral
Bemeker sebsbo layqer maqat’elu
Ante gin tesfa neh lamenubh hulu

VERSE 4
Yeraqewn maqreb tichlbechaleh
Yewedeqen mansat amlake tawqaleh
Ejochwan zergta maregn tilhelech
Emama ityop’ya antn tit’aralech

VERSE 5
Yemets’nanat amlak yechernet Geta
Yebereket nigus keto matreta
Mefthew kante new yeselam abat
Eruruhu Geta antew tareqat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yekal-kidan-hager', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: yelben hulu yewusten hulu (yelben-hulu-yewusten-hulu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 1
መቀመጤን መነሳቴን
መች ታያለህ አንተ ፊቴን
የልቤ ነህ የውስጥ አይኔ
ምከተልህ በዘመኔ

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 2
ምድረ በዳው ደስ ይለዋል
እግዚአብሔር ይሰራዋል
ባዶ ብሆን ባንተ ፊት
ሰጥኸኛል ሰገነት

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 3
በእግዚአብሔር ልቤ ጸና.
ደግ አድራጊ ቸር ነውና
አንስቶኛል ካፈር ትቢያ
ልበልለት ሃሌ ሉ

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 4
Estfanos mesganwe

CHORUS
የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ',
      lyrics_transliteration = 'CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 1
Meqemet’en menesaten
Mech tayaleh ante fiten
Yelbe neh yewst’ ayne
Miketelh bezemene

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 2
Midre bedaw des yilewal
Egziabher yiserawal
Bado bihon bante fit
Set’ኸgnal segenet

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 3
BeEgziabher libe ts’ena.
Deg adragi cher newna
Anstognal kafer tibiya
Libellet hale lu

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 4
Estfanos mesganwe

CHORUS
Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yelben-hulu-yewusten-hulu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የልቤን ሁሉ የውስጤን ሁሉ
የመረከመረከው በማዕበሉ
የቀና መንገድ ያሳየኸኝ
እምላኬ ሁሌ ተናገረኝ

VERSE 1
መቀመጤን መነሳቴን
መች ታያለህ አንተ ፊቴን
የልቤ ነህ የውስጥ አይኔ
ምከተልህ በዘመኔ

VERSE 2
ምድረ በዳው ደስ ይለዋል
እግዚአብሔር ይሰራዋል
ባዶ ብሆን ባንተ ፊት
ሰጥኸኛል ሰገነት

VERSE 3
በእግዚአብሔር ልቤ ጸና.
ደግ አድራጊ ቸር ነውና
አንስቶኛል ካፈር ትቢያ
ልበልለት ሃሌ ሉ

VERSE 4
Estfanos mesganwe'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yelben hulu yewst’en hulu
Yemerekemerekew bemaebelu
Yeqena menged yasayeኸgn
Emlake hule tenageregn

VERSE 1
Meqemet’en menesaten
Mech tayaleh ante fiten
Yelbe neh yewst’ ayne
Miketelh bezemene

VERSE 2
Midre bedaw des yilewal
Egziabher yiserawal
Bado bihon bante fit
Set’ኸgnal segenet

VERSE 3
BeEgziabher libe ts’ena.
Deg adragi cher newna
Anstognal kafer tibiya
Libellet hale lu

VERSE 4
Estfanos mesganwe'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yelben-hulu-yewusten-hulu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: yelem yemisanew (yelem-yemisanew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 1
አላስብም ነበር ፣ አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን ፣ እያጠበ ዕንባዬ
እየተፈጸመ ፣ ኃይሉ በድካሜ
ማዕበሉን አለፍኩት ፣ ቀለልኝ ሸክሜ ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 2
የቤቴ ራስ ነው ፣ የእቅዴ መሪ
በክፉም በደጉም ፣ ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ፣ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው ፣ ዕንባዬ ታበሰ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 3
ትናንት ባዶ ነበርኩ ፣ የለኝ የሚሰፈር
አንዳች አልነበረኝ ፣ የሚታይ የሚቆጠር
ከእርሱ የተነሳ ፣ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን ፣ አለ የማይተወኝ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 4
እየከለከለ ፣ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ፣ ደግሞ ሚረባኝን
ሁሉ በእርሱ ሆኗል ፣ አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ፣ ይድረስ ለንጉሡ ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።',
      lyrics_transliteration = 'CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 1
Alasbm neber , alfewalehu biye
Gunch’ alfo tirasen , eyat’ebe enbaye
Eyetefets’eme , haylu bedkame
Maebelun alefkut , qelelgn shekme .

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 2
Yebete ras new , yeeqde meri
Bekfum bedegum , nefsen astemari
Fet’ro yemayresagn , bezaye derese
Beten desta molaw , enbaye tabese.

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 3
Tinant bado neberku , yelegn yemisefer
Andach alneberegn , yemitay yemiqot’er
Keersu yetenesa , zare gin mulu negn
Kibir leersu yihun , ale yemaytewegn.

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 4
Eyekelekele , leene mayt’eqmegnn
Begize eyeset’e , degmo mirebagnn
Hulu beersu honwal , alhonem yale ersu
Widase misgana , yidres lengusu .

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yelem-yemisanew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 1
አላስብም ነበር ፣ አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን ፣ እያጠበ ዕንባዬ
እየተፈጸመ ፣ ኃይሉ በድካሜ
ማዕበሉን አለፍኩት ፣ ቀለልኝ ሸክሜ ።

VERSE 2
የቤቴ ራስ ነው ፣ የእቅዴ መሪ
በክፉም በደጉም ፣ ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ፣ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው ፣ ዕንባዬ ታበሰ።

VERSE 3
ትናንት ባዶ ነበርኩ ፣ የለኝ የሚሰፈር
አንዳች አልነበረኝ ፣ የሚታይ የሚቆጠር
ከእርሱ የተነሳ ፣ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን ፣ አለ የማይተወኝ።

VERSE 4
እየከለከለ ፣ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ፣ ደግሞ ሚረባኝን
ሁሉ በእርሱ ሆኗል ፣ አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ፣ ይድረስ ለንጉሡ ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 1
Alasbm neber , alfewalehu biye
Gunch’ alfo tirasen , eyat’ebe enbaye
Eyetefets’eme , haylu bedkame
Maebelun alefkut , qelelgn shekme .

VERSE 2
Yebete ras new , yeeqde meri
Bekfum bedegum , nefsen astemari
Fet’ro yemayresagn , bezaye derese
Beten desta molaw , enbaye tabese.

VERSE 3
Tinant bado neberku , yelegn yemisefer
Andach alneberegn , yemitay yemiqot’er
Keersu yetenesa , zare gin mulu negn
Kibir leersu yihun , ale yemaytewegn.

VERSE 4
Eyekelekele , leene mayt’eqmegnn
Begize eyeset’e , degmo mirebagnn
Hulu beersu honwal , alhonem yale ersu
Widase misgana , yidres lengusu .'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yelem-yemisanew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yelibe Amakari Zemarit Naridos Kasahun (yelibe-amakari-zemarit-naridos-kasahun)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 1
የኔ መሻት አንቺን ማመስገን ነው
ያከበሩሽ ሲከብሩ ስላየው
በልቤ ያለን ላንቺ በመንገሬ
ሰላም እረፍት አገኘሁኝ ዛሬ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 2
አያልቅም አያልቅም ቢነገር
ኪዳነ ምህረት እናቴ ያንቺ ነገር
ልቤን በኪዳንሽ አሳርፌ
ሰላም ነው ቤቴ ብዙ ነው ትርፌ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 3
ልቤ ጽኑ ነው ባንቺ አያፍርም
እንኳን በደስታ በሃዘን ብወድቅም
ካ''ዘኔ ጥልቅ ወጣው ባንቺ ምልጃ
ስምሽ ጉልበት ሆኖኝ መጋረጃ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 4
ከቃል በላይ ነው ለኔ የሆነው
የቱ የቃል ጉልበት ችሎ ሊገልጸው
ዓለም ክብርሽ ከቶ ባይገባው
አንቺን መውደዴ ሁሌ ጊዜ ልክ ነው

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 5
ያልተረዳማ የእናትን ጥቅም
ላንቺ የሚሆን ዜማን አያውቅም

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ',
      lyrics_transliteration = 'CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 1
Yene meshat anchin mamesgen new
Yakeberush sikebru silayew
Belbe yalen lanchi bemengere
Selam ereft agegnehugn zare

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 2
Ayalqm ayalqm bineger
Kidane mihret enate yanchi neger
Liben bekidansh asarfe
Selam new bete bizu new tirfe

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 3
Libe ts’nu new banchi ayafrm
Enkwan bedesta behazen biwedqm
Ka''zene t’lq wet’aw banchi milja
Simsh gulbet honogn megareja

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 4
Keqal belay new lene yehonew
Yetu yeqal gulbet chlo ligelts’ew
Alem kibrsh keto baygebaw
Anchin mewdede hule gize lik new

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 5
Yalteredama yeenatn t’qm
Lanchi yemihon zeman ayawqm

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yelibe-amakari-zemarit-naridos-kasahun'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 1
የኔ መሻት አንቺን ማመስገን ነው
ያከበሩሽ ሲከብሩ ስላየው
በልቤ ያለን ላንቺ በመንገሬ
ሰላም እረፍት አገኘሁኝ ዛሬ

VERSE 2
አያልቅም አያልቅም ቢነገር
ኪዳነ ምህረት እናቴ ያንቺ ነገር
ልቤን በኪዳንሽ አሳርፌ
ሰላም ነው ቤቴ ብዙ ነው ትርፌ

VERSE 3
ልቤ ጽኑ ነው ባንቺ አያፍርም
እንኳን በደስታ በሃዘን ብወድቅም
ካ''ዘኔ ጥልቅ ወጣው ባንቺ ምልጃ
ስምሽ ጉልበት ሆኖኝ መጋረጃ

VERSE 4
ከቃል በላይ ነው ለኔ የሆነው
የቱ የቃል ጉልበት ችሎ ሊገልጸው
ዓለም ክብርሽ ከቶ ባይገባው
አንቺን መውደዴ ሁሌ ጊዜ ልክ ነው

VERSE 5
ያልተረዳማ የእናትን ጥቅም
ላንቺ የሚሆን ዜማን አያውቅም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 1
Yene meshat anchin mamesgen new
Yakeberush sikebru silayew
Belbe yalen lanchi bemengere
Selam ereft agegnehugn zare

VERSE 2
Ayalqm ayalqm bineger
Kidane mihret enate yanchi neger
Liben bekidansh asarfe
Selam new bete bizu new tirfe

VERSE 3
Libe ts’nu new banchi ayafrm
Enkwan bedesta behazen biwedqm
Ka''zene t’lq wet’aw banchi milja
Simsh gulbet honogn megareja

VERSE 4
Keqal belay new lene yehonew
Yetu yeqal gulbet chlo ligelts’ew
Alem kibrsh keto baygebaw
Anchin mewdede hule gize lik new

VERSE 5
Yalteredama yeenatn t’qm
Lanchi yemihon zeman ayawqm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yelibe-amakari-zemarit-naridos-kasahun', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeliben Hulu Leman Lamakir (yeliben-hulu-leman-lamakir)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeliben-hulu-leman-lamakir'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የልቤን ሁሉ ለማን ላማክር
እመቤቴ ሆይ ከአንቺ በቀር
የደካማው ሰው መጠጊያ እኮነሽ
ሃዘን ጭንቀቴን የምረሳብሽ

VERSE 1
ቅዱሳን አበው አንቺን መረጡ /2/
ከሲኦል ዓለም ስላመለጡ
ፃድቅ በስራው ያኔ ሲድን/2/
እጠራሻለሁ ድንግል አንቺን

VERSE 2
የጭንቄ ደራሽ አክኪሌ ነሽ/2/
ቂም በቀል አያውቅ የዋህ ልብሽ
ልቤ ለፍቅርሽ ሰፊ ስፍራ አለው /2/
በአዘ ንኩኝ ሠዓት እጠራሻለው

VERSE 3
ዋሴ ነሽ ለእኔ ድንግል እናቴ/2/
ስምሽ ጠበቀኝ ከልጅነቴ
ሁልጊዜ ለእኔ በጎ ያረግሽልኝ
ምን ልበል ለአንቺ ቃላትም የለኝ

VERSE 4
ለአዘንኩኝ ለእኔ ደስታዬ ነሽ/2/
ያረጋጋሽኝ ፈጥነሽ ደርሰሽ
ስምሽ ሃጥአንን የሚቀድስ/
ከሞት ወደ ህይወት የሚመልስ

VERSE 5
የመንገዴ ስንቅ የርሃቤ መርሻ/2/
ለታመመ ሰው ነሽ መፈወሻ
የተማጸነ በስምሽ አምኖ/2/
ማን አፍሮ ያውቃል አንቺን ለምኖ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yelben hulu leman lamakr
Emebete hoy keanchi beqer
Yedekamaw sew met’egiya ekonesh
Hazen ch’nqeten yemresabsh

VERSE 1
Kidusan abew anchin meret’u (2)
Kesiol alem silamelet’u
Ts’adq besraw yane sidn (2)
Et’erashalehu Dingil anchin

VERSE 2
Yech’nqe derash akkile nesh (2)
Qim beqel ayawq yewah libsh
Libe lefqrsh sefi sifra alew (2)
Beaze nikugn seat et’erashalew

VERSE 3
Wase nesh leene Dingil enate (2)
Simsh t’ebeqegn keljnete
Hulgize leene bego yaregshlgn
Min libel leanchi qalatm yelegn

VERSE 4
Leazenkugn leene destaye nesh (2)
Yaregagashgn fet’nesh dersesh
Simsh hat’ann yemiqeds/
Kemot wede hiywet yemimels

VERSE 5
Yemengede sinq yerhabe mersha (2)
Letameme sew nesh mefewesha
Yetemats’ene besmsh amno (2)
Man afro yawqal anchin lemno'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeliben-hulu-leman-lamakir', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yemalikedash (yemalikedash)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 1
መደበቂያዬ ነሽ በከፋኝ ጊዜ
ያመለጥኩብሽ ከሀዘን ትካዜ
ገሪዛን ድንግል የምሕረት አንባ
የደረብሽልኝ የፅድቅ ካባ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 2
በረከቴ ነሽ በረከቴ
የሸለመኝ ኢየሱስ አባቴ
የቱን አንስቼ የቱን ልተወው
ያደረግሽልኝ እጅግ ብዙ ነው

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 3
ተስፋዬ ሲከስም ተስፋ የሆንሺኝ
ሰው ፊት ሲነሳኝ ፊት ያልነሳሺኝ
ያበራሺልኝ የነፍሴን ፅልመት
የፈፀምሺልኝ የልቤን ምኞት

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 4
ኪዳነ ምህረት አንቺ እኮ ነሽ
የመኖርን ጣዕም ያየሁብሽ
ጠላት በምላሱ ሰብሮ ሲጥለኝ
ወዳጅ ያደረኩት ጀርባውን ሲሰጠኝ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 5
ያልተለየሺኝ በሐዘን ደስታዬ
እመ ምህረት መሸሸጊያዬ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ',
      lyrics_transliteration = 'CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 1
Medebeqiyaye nesh bekefagn gize
Yamelet’kubsh kehezen tikaze
Gerizan Dingil yemhret anba
Yederebshlgn yets’dq kaba

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 2
Berekete nesh berekete
Yeshelemegn Iyesus abate
Yetun ansche yetun litewew
Yaderegshlgn ejg bizu new

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 3
Tesfaye sikesm tesfa yehonshign
Sew fit sinesagn fit yalnesashign
Yaberashilgn yenefsen ts’lmet
Yefets’emshilgn yelben mignot

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 4
Kidane mihret anchi eko nesh
Yemenorn t’aem yayehubsh
T’elat bemlasu sebro sit’legn
Wedaj yaderekut jerbawn siset’egn

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 5
Yalteleyeshign behezen destaye
Eme mihret mesheshegiyaye

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yemalikedash'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 1
መደበቂያዬ ነሽ በከፋኝ ጊዜ
ያመለጥኩብሽ ከሀዘን ትካዜ
ገሪዛን ድንግል የምሕረት አንባ
የደረብሽልኝ የፅድቅ ካባ

VERSE 2
በረከቴ ነሽ በረከቴ
የሸለመኝ ኢየሱስ አባቴ
የቱን አንስቼ የቱን ልተወው
ያደረግሽልኝ እጅግ ብዙ ነው

VERSE 3
ተስፋዬ ሲከስም ተስፋ የሆንሺኝ
ሰው ፊት ሲነሳኝ ፊት ያልነሳሺኝ
ያበራሺልኝ የነፍሴን ፅልመት
የፈፀምሺልኝ የልቤን ምኞት

VERSE 4
ኪዳነ ምህረት አንቺ እኮ ነሽ
የመኖርን ጣዕም ያየሁብሽ
ጠላት በምላሱ ሰብሮ ሲጥለኝ
ወዳጅ ያደረኩት ጀርባውን ሲሰጠኝ

VERSE 5
ያልተለየሺኝ በሐዘን ደስታዬ
እመ ምህረት መሸሸጊያዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 1
Medebeqiyaye nesh bekefagn gize
Yamelet’kubsh kehezen tikaze
Gerizan Dingil yemhret anba
Yederebshlgn yets’dq kaba

VERSE 2
Berekete nesh berekete
Yeshelemegn Iyesus abate
Yetun ansche yetun litewew
Yaderegshlgn ejg bizu new

VERSE 3
Tesfaye sikesm tesfa yehonshign
Sew fit sinesagn fit yalnesashign
Yaberashilgn yenefsen ts’lmet
Yefets’emshilgn yelben mignot

VERSE 4
Kidane mihret anchi eko nesh
Yemenorn t’aem yayehubsh
T’elat bemlasu sebro sit’legn
Wedaj yaderekut jerbawn siset’egn

VERSE 5
Yalteleyeshign behezen destaye
Eme mihret mesheshegiyaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yemalikedash', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yemayimotew Mote (yemayimotew-mote-3359)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 1
እጅና እግሩን ታስሮ ሄደ አደባባይ
እየተገረፈ ታግሶ ስቃይ
አለቀሰች ቆማ ድንግል ማርያም
ተሰቅሎባት ልጇ መድኀኔዓለም

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 2
በአይሁድ አደባባይ ፍርድ ተንጋደደ
ወንበዴ ተለቆ ንጹሕ በግ ታረደ
የማይሞተው ሞተ ለሰው ፍቅር ብሎ
ዋለ ቀራንዮ በእንጨት ላይ ተሰቅሎ

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 3
ዮሴፍ ኒቆዲሞስ ሥጋውን ለመኑ
እንዲፈቅድላቸው ሄደው ከመስፍኑ
ገንዘው ቀበሩት በአዲሱ መቃብር
ቅዱስ ቅዱስ ኃያል እያሉ በክብር/፪/

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/',
      lyrics_transliteration = 'CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 1
Ejna egrun tasro hede adebabay
Eyetegerefe tagso siqay
Aleqesech qoma Dingil Maryam
Teseqlobat lijwa medhenealem

CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 2
Beayhud adebabay fird tengadede
Wenbede teleqo nits’uh beg tarede
Yemaymotew mote lesew fiqr bilo
Wale qeranyo beench’et lay teseqlo

CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 3
Yosef niqodimos sigawn lemenu
Endifeqdlachew hedew kemesfnu
Genzew qeberut beadisu meqabr
Kidus Kidus hayal eyalu bekbr (2)

CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yemayimotew-mote-3359'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 1
እጅና እግሩን ታስሮ ሄደ አደባባይ
እየተገረፈ ታግሶ ስቃይ
አለቀሰች ቆማ ድንግል ማርያም
ተሰቅሎባት ልጇ መድኀኔዓለም

VERSE 2
በአይሁድ አደባባይ ፍርድ ተንጋደደ
ወንበዴ ተለቆ ንጹሕ በግ ታረደ
የማይሞተው ሞተ ለሰው ፍቅር ብሎ
ዋለ ቀራንዮ በእንጨት ላይ ተሰቅሎ

VERSE 3
ዮሴፍ ኒቆዲሞስ ሥጋውን ለመኑ
እንዲፈቅድላቸው ሄደው ከመስፍኑ
ገንዘው ቀበሩት በአዲሱ መቃብር
ቅዱስ ቅዱስ ኃያል እያሉ በክብር/፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 1
Ejna egrun tasro hede adebabay
Eyetegerefe tagso siqay
Aleqesech qoma Dingil Maryam
Teseqlobat lijwa medhenealem

VERSE 2
Beayhud adebabay fird tengadede
Wenbede teleqo nits’uh beg tarede
Yemaymotew mote lesew fiqr bilo
Wale qeranyo beench’et lay teseqlo

VERSE 3
Yosef niqodimos sigawn lemenu
Endifeqdlachew hedew kemesfnu
Genzew qeberut beadisu meqabr
Kidus Kidus hayal eyalu bekbr (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yemayimotew-mote-3359', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yemiset Bitsue /Zemarit Ruth Demelash (yemiset-bitsue-zemarit-ruth-demelash)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 1
የሚሰጥ ብጹዕ ነው ከሚቀበል ይልቅ
ቸርነት የሚያረግ ትንሽ ሳይል ትልቅ
ስንቁን ይቋጥራል ለክፉ ዘመኑ
እርሷ ናት መዳኒት መትረፊያ ኪዳኑ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 2
ትልቅ እድል አለ ከላይ የተሰጠን
አምላክ ያዘጋጀው ገብቶ ሊጎበኘን
ኑና እናበድረው ሁሉ ለሞላለት
እጆቹን ዘርግቷል ኩርማን እንጣልለት

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 3
የሰማይ የምድር የፍጥረቱ ንጉሥ
አብ ለእጟለ ማውታ ኢየሱስ ክርስቶስ
የሚሰጥ እርሱ ነው የሚሰጥም እርሱ
ሰተን እንቀበል ራሱን ከራሱ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 4
ድሆች ሆነን ሳለን ሳይንቅ የወደደን
ከኛ ጋር ተቆጥሮ በፍቅሩ የሳበን
ምጽዋት እርሱ ነው መዝገብ ለፍጥረቱ
ለአለም የተሰጠ በአንድያ በአባቱ

CHORUS
በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት',
      lyrics_transliteration = 'CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 1
Yemiset’ bits’ue new kemiqebel yilq
Chernet yemiyareg tinsh sayl tilq
Sinqun yiqwat’ral lekfu zemenu
Erswa nat medanit metrefiya kidanu

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 2
Tilq edl ale kelay yeteset’en
Amlak yazegajew gebto ligobegnen
Nuna enabedrew hulu lemolalet
Ejochun zergtwal kurman ent’allet

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 3
Yesemay yemdr yeft’retu nigus
Ab leeጟle mawta Iyesus Kristos
Yemiset’ ersu new yemiset’m ersu
Seten enqebel rasun kerasu

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 4
Dihoch honen salen saynq yewededen
Kegna gar teqot’ro befqru yesaben
Mits’wat ersu new mezgeb left’retu
Lealem yeteset’e beandya beabatu

CHORUS
Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yemiset-bitsue-zemarit-ruth-demelash'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በእራፊ ጨርቅና በውሃ ጠብታ
ያማረ መንግስቱን ይሰጠናል ጌታ
መዝገብን እናኑር በላይ በሰማያት
ድሆችን እናስብ በበጎ ቸርነት

VERSE 1
የሚሰጥ ብጹዕ ነው ከሚቀበል ይልቅ
ቸርነት የሚያረግ ትንሽ ሳይል ትልቅ
ስንቁን ይቋጥራል ለክፉ ዘመኑ
እርሷ ናት መዳኒት መትረፊያ ኪዳኑ

VERSE 2
ትልቅ እድል አለ ከላይ የተሰጠን
አምላክ ያዘጋጀው ገብቶ ሊጎበኘን
ኑና እናበድረው ሁሉ ለሞላለት
እጆቹን ዘርግቷል ኩርማን እንጣልለት

VERSE 3
የሰማይ የምድር የፍጥረቱ ንጉሥ
አብ ለእጟለ ማውታ ኢየሱስ ክርስቶስ
የሚሰጥ እርሱ ነው የሚሰጥም እርሱ
ሰተን እንቀበል ራሱን ከራሱ

VERSE 4
ድሆች ሆነን ሳለን ሳይንቅ የወደደን
ከኛ ጋር ተቆጥሮ በፍቅሩ የሳበን
ምጽዋት እርሱ ነው መዝገብ ለፍጥረቱ
ለአለም የተሰጠ በአንድያ በአባቱ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Beerafi ch’erqna bewha t’ebta
Yamare mengstun yiset’enal Geta
Mezgebn enanur belay besemayat
Dihochn enasb bebego chernet

VERSE 1
Yemiset’ bits’ue new kemiqebel yilq
Chernet yemiyareg tinsh sayl tilq
Sinqun yiqwat’ral lekfu zemenu
Erswa nat medanit metrefiya kidanu

VERSE 2
Tilq edl ale kelay yeteset’en
Amlak yazegajew gebto ligobegnen
Nuna enabedrew hulu lemolalet
Ejochun zergtwal kurman ent’allet

VERSE 3
Yesemay yemdr yeft’retu nigus
Ab leeጟle mawta Iyesus Kristos
Yemiset’ ersu new yemiset’m ersu
Seten enqebel rasun kerasu

VERSE 4
Dihoch honen salen saynq yewededen
Kegna gar teqot’ro befqru yesaben
Mits’wat ersu new mezgeb left’retu
Lealem yeteset’e beandya beabatu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yemiset-bitsue-zemarit-ruth-demelash', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yemisirach Des Yibelen Yealem Medihanit Teweledelin : Oritodokis Tewahido Mezimur (yemisirach-des-yibelen-yealem-medihanit-teweledelin-oritodokis-tewahido)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)

VERSE 1
የዓለም ቤዛ (፫) ለኛ ተወለደልን
አዝ
ንጉሥ ሄሮድስ ይህን ሲሰማ (፪)
ፈልጋችሁ አምጡት በቀን በጨለማ (፪)

CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)

VERSE 2
አዝ
ሰብዐሰገል እንደታዘዙት (፪)
በኮከብ ተመርተው ህፃኑን አገኙት (፪)
አዝ

CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)

VERSE 3
ሰገዱለት ከመሬት ወድቀው (፪)
ወርቅ እጣን ከርቤውን በረከቱን ሰጥተው (፪)

CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)',
      lyrics_transliteration = 'CHORUS
Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)

VERSE 1
Yealem beza (3) legna teweledeln
CHORUS
Nigus herods yihn sisema (2)
Felgachhu amt’ut beqen bech’elema (2)

CHORUS
Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)

VERSE 2
CHORUS
Sebasegel endetazezut (2)
Bekokeb temertew hits’anun agegnut (2)
CHORUS

CHORUS
Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)

VERSE 3
Segedulet kemeret wedqew (2)
Werq et’an kerbewn bereketun set’tew (2)

CHORUS
Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yemisirach-des-yibelen-yealem-medihanit-teweledelin-oritodokis-tewahido'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)

VERSE 1
የዓለም ቤዛ (፫) ለኛ ተወለደልን
ንጉሥ ሄሮድስ ይህን ሲሰማ (፪)
ፈልጋችሁ አምጡት በቀን በጨለማ (፪)

VERSE 2
ሰብዐሰገል እንደታዘዙት (፪)
በኮከብ ተመርተው ህፃኑን አገኙት (፪)

VERSE 3
ሰገዱለት ከመሬት ወድቀው (፪)
ወርቅ እጣን ከርቤውን በረከቱን ሰጥተው (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)

VERSE 1
Yealem beza (3) legna teweledeln
Nigus herods yihn sisema (2)
Felgachhu amt’ut beqen bech’elema (2)

VERSE 2
Sebasegel endetazezut (2)
Bekokeb temertew hits’anun agegnut (2)

VERSE 3
Segedulet kemeret wedqew (2)
Werq et’an kerbewn bereketun set’tew (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yemisirach-des-yibelen-yealem-medihanit-teweledelin-oritodokis-tewahido', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yemisirach Tewelede (yemisirach-tewelede)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 1
የሆነውን ኤልሻዳይ
ከአብ አጠገብ ሳይለይ
መጣ ሳይጎድል በላይ
የሌለው ሲሆን መጠን

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 2
ተወሰነ በማህፀን
እንደምን አላቃጠላት
ልብሱ ቀሚሱ እሳት
ገብቶ ወጣ ሳይከፍት

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 3
በማይመረመር ርቀት
አንክሮ ይገባል በእውነት
ያለ ዘርዐ ብእሲ ልደት
እንደምን ያለ ጥበብ

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 4
ከስፋት ጋር ሆድ መጥበብ
መወለዱ ምን ይደንቅ
እሳት ሲጠቀለል በጨርቅ

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ',
      lyrics_transliteration = 'CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 1
Yehonewn elshaday
Keab at’egeb sayley
Met’a saygodl belay
Yelelew sihon met’en

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 2
Tewesene bemahts’en
Endemn alaqat’elat
Libsu qemisu esat
Gebto wet’a saykeft

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 3
Bemaymeremer riqet
Ankro yigebal beewnet
Yale zera biesi lidet
Endemn yale t’beb

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 4
Kesfat gar hod met’beb
Meweledu min yidenq
Esat sit’eqelel bech’erq

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yemisirach-tewelede'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 1
የሆነውን ኤልሻዳይ
ከአብ አጠገብ ሳይለይ
መጣ ሳይጎድል በላይ
የሌለው ሲሆን መጠን

VERSE 2
ተወሰነ በማህፀን
እንደምን አላቃጠላት
ልብሱ ቀሚሱ እሳት
ገብቶ ወጣ ሳይከፍት

VERSE 3
በማይመረመር ርቀት
አንክሮ ይገባል በእውነት
ያለ ዘርዐ ብእሲ ልደት
እንደምን ያለ ጥበብ

VERSE 4
ከስፋት ጋር ሆድ መጥበብ
መወለዱ ምን ይደንቅ
እሳት ሲጠቀለል በጨርቅ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 1
Yehonewn elshaday
Keab at’egeb sayley
Met’a saygodl belay
Yelelew sihon met’en

VERSE 2
Tewesene bemahts’en
Endemn alaqat’elat
Libsu qemisu esat
Gebto wet’a saykeft

VERSE 3
Bemaymeremer riqet
Ankro yigebal beewnet
Yale zera biesi lidet
Endemn yale t’beb

VERSE 4
Kesfat gar hod met’beb
Meweledu min yidenq
Esat sit’eqelel bech’erq'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yemisirach-tewelede', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yemitebikegn Ayitegnam (yemitebikegn-ayitegnam-2354)
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
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yemitebikegn-ayitegnam-2354'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 1
ቀን እና ለሊት ከኔ አይርቅም
ድምጸ አራዊት የለሊት ግርማ
ወደኔ አይቀርብም ድምጽህ ሲሰማ

VERSE 2
መሰናክልን ለእግሮቼ አይሰጥም
ይሰውረኛል በቀኙ ሰላም
ፀሐይም በቀን አይተኩሰኝም
የአጋንንትም ሀይል አያስፈራኝም

VERSE 3
ነፍሴን ጠበቃት ከጠላት ወጥመድ
ጌታዬ መራኝ በጽድቅ መንገድ
መውጣት መግባቴን እየጠበቀ
ለዚህ አበቃኝ እርሱ ባወቀ

VERSE 4
የሰማዩን ጠል እታገሳለው
ሰው ከጨከነ ምን እሆናለው
ለሊት በድብቅ ለሚጎበኙኝ
ለጻድቃኑ ክብር አምላክ ይስጥልኝ

VERSE 5
እንቅልፌን ባርኮ ለሰጠኝ የጌታ
በአለም ሀሳብ ሳልንገላታ
የእለት ምግቤንም ላልነሳኝ ፍጹም
ምስጋና ላቅርብ እስከ ዘለዓለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 1
Qen ena lelit kene ayrqm
Dimts’e arawit yelelit girma
Wedene ayqerbm dimts’h sisema

VERSE 2
Mesenakln leegroche ayset’m
Yisewregnal beqegnu selam
Ts’eheym beqen aytekusegnm
Yeaganntm heyl ayasferagnm

VERSE 3
Nefsen t’ebeqat ket’elat wet’med
Getaye meragn bets’dq menged
Mewt’at megbaten eyet’ebeqe
Lezih abeqagn ersu baweqe

VERSE 4
Yesemayun t’el etagesalew
Sew kech’ekene min ehonalew
Lelit bedbq lemigobegnugn
Lets’adqanu kibir amlak yist’lgn

VERSE 5
Enqlfen barko leset’egn yegeta
Bealem hesab salngelata
Yeelet migbenm lalnesagn fits’um
Misgana laqrb eske zelealem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yemitebikegn-ayitegnam-2354', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 100 THEN
    RAISE EXCEPTION 'Rollback batch 09 count mismatch: expected 100, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Rollback batch 09 completed: % hymns restored.', v_total;
END $rollback_batch_09$;
