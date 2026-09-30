-- Generated from local YeKidane / Meharene backup content.
-- Idempotent inserts: skip when slug already exists for the collection.
begin;

-- YeKidane Tselot prayers (one per existing section)

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'opening-acclamations',
  'Opening acclamations',
  null,
  null,
  'Opening acclamations',
  'ቅዱስ እግዚአብሔር ቅዱስ ኃያል ቅዱስ ሕያው የማይሞት ከቅድስት
ድንግል ማርያም የተወለደ አቤቱ ይቅር በለን።

ቅዱስ እግዚአብሔር ቅዱስ ኃያል ቅዱስ ሕያው የማይሞት
በዮርዳኖስ የተጠመቀ በመስቀል ላይ የተሰቀለ አቤቱ ይቅር
በለን፡፡

ቅዱስ እግዚአብሔር ቅዱስ ኃያል ቅዱስ ሕያው የማይሞት
በሦስተኛው ቀን ከሙታን ተለይቶ የተነሣ በምስጋና ወደ ሰማይ ወጣ
በአባቱም ቀኝ ተቀመጠ ዳግመኛም በጌትነት ይመጣል በሕያዋንና
በሙታን ይፈርድ ዘንድ አቤቱ ይቅር በለን፡፡

ለአብ ምስጋና ይሁን ለወልድ ምስጋና ይሁን ለመንፈስ
ቅዱስ ምስጋና ይሁን ዛሬም ዘወትርም ለዘላለሙ አሜን
አሜን ይሁን ይሁን፡፡

ልዩ ሦስት ሕያው እግዚአብሔር ሆይ ይቅር በለን፡፡

ለእግዚአብሔር ምስጋና ይሁን፡፡
እውነት ነው ይገባል፡፡',
  'ቅዱስ እግዚአብሔር ቅዱስ ኃያል ቅዱስ ሕያው ዘኢይመውት
ዘተወልደ እማርያም እምቅድስት ድንግል ተሣሃለነ እግዚኦ፡፡

ቅዱስ እግዚአብሔር ቅዱስ ኃያል ቅዱስ ሕያው
ዘኢይመውት ዘተጠምቀ በዮርዳኖስ ወተሰቅለ ዲበ ዕፀ
መስቀል ተሣሃለነ እግዚኦ፡፡

ቅዱስ እግዚአብሔር ቅዱስ ኃያል ቅዱስ ሕያው ዘኢይመውት
ዘተንሥአ እሙታን አመ ሣልስት ዕለት ዐርገ በስብሐት ውስተ
ሰማያት ወነበረ በየማነ አቡሁ ዳግመ ይመጽእ በስብሐት ይኮንን
ሕያዋነ ወሙታነ ተሣሃለነ እግዚኦ፡፡

ስብሐት ለአብ ስብሐት ለወልድ ስብሐት ለመንፈስ
ቅዱስ ይእዜኒ ወዘልፈኒ ወለዓለመ ዓለም አሜን
ወአሜን ለይኩን ለይኩን፡፡

ቅዱስ ሥሉስ እግዚአብሔር ሕያው ተሣሃለነ፡፡

ስብሐት ለእግዚአብሔር፡፡
ርቱዕ ይደሉ፡፡',
  'God, Holy Mighty, Holy Living, Immortal, who was born from the Holy Virgin Mary, have mercy upon us, Lord.

God, Holy Mighty, Holy Living, Immortal, who was baptized in Jordan and crucified on the tree of the cross, have mercy upon us, Lord.

God, Holy Mighty, Holy Living, Immortal, who rose from the dead on the third day, ascended into heaven in glory, sat at the right hand of the Father, and will come again in glory to judge the living and the dead, have mercy upon us, Lord.

Glory be to the Father, glory be to the Son, glory be to the Holy Spirit, both now and ever and world without end. Amen and Amen, so be it, so be it.

O Holy Trinity, Living God, have mercy upon us.

Glory be to God.
It is right, it is just.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'opening-acclamations'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'opening-acclamations'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'morning-offering-of-praise',
  'Morning offering of praise',
  null,
  null,
  'Morning offering of praise',
  'አቤቱ ሁሉን ለፈጠርህ ለማትመረመር አምላክ ለአንተ
ሰውነታችንን እናስገዛለን፤ አቤቱ የነግህ ምስጋናን
እናቀርብልሃለን፡፡ የሁሉ ዕውቀት ኃያል የምትሆን፤ ይቅርታህ
የበዛ አምላክ፤ ነፍስን የፈጠርሃት።

ከዓለም አስቀድሞ ከአብ የተወለድህ አንተን እናመሰግንሃለን፡፡
የብቻው ቃል የምትሆን በቅዱሳን አድሮባቸው የሚኖር፤ አርምሞ
በሌለበት ምስጋና አለቆች ካሏቸው ሠራዊተ መላእክትም
የምትመሰገን።

በእጅ ያልተፈጠርህ የተሠወሩትን የፈጠርህ፤ የማትታይ
ንጹሕ ቅዱስ የምስጋናህን ኅቡእ ጥበብን ያስረዳንን
የተናገርህ፡፡

የማይጠፋ ብርሃንን ለኛ ተስፋ ያስደረግከን፡፡ አቤቱ ፍጹም ምስጋናን
ንጹሕ ምስጋናንም ለአንተ እናቀርባለን፡፡ እኛ የአንተ አገልጋዮች
እናመሰግንሃለን፡፡ ሕዝቡም አንተን ያመሰግናሉ፡፡

አቤቱ አንተን እናመሰግናለን፡፡',
  'ለከ እግዚኦ ለገባሬ ኵሉ ለዘኢታስተርኢ አምላክ ንሰፍሕ ነፍሰነ፡፡
ወስብሐተ ዘነግህ ንፌኑ ለከ እግዚኦ ለጥበበ ኵሉ ኃያል ብዙኀ
ሣህል አምላክ ሣራሪሃ ለነፍስ፡፡

ንሴብሐከ ለዘእምቅድመ ዓለም ተወልደ እምአብ፡፡ ቃል ዘባሕቲቱ
በቅዱሳኒሁ ዕሩፍ ኪያከ ዘትሴባሕ እምስብሐታት ዘኢያረምም
ወእምሠራዊተ ሊቃነ መላእክት፡፡

ኪያከ ዘኢተገብረ በእድ ፈጣሬ ኅቡአት ኪያከ ዘኢተገብረ
በእድ ፈጣሬ ኅቡአት ዘኢታስተርኢ ንጹሕ ወቅዱስ ዜናዊ
ዘነገረነ ጥበበ ኅቡኣተ ቅድሳቲከ፡፡

ብርሃነ ለነ ዘኢይጠፍእ እሰፎከነ ስብሐተ ወአኰቴተ ንፌኑ ወቅድሳተ
ንጹሐ ንብል ንሕነ እሊኣከ አግብርት ወሕዝብኒ ኪያከ ይሴብሑ፡፡

ኪያከ ንሴብሕ እግዚኦ፡፡',
  'O Lord, maker of all, invisible God, we stretch out our soul to You and offer morning prayer unto You. O Lord, the powerful wisdom of all, God plenteous in mercy, the maker of the soul.

We glorify You, begotten from the Father before the creation of the world; You, who are the only Word and rest in Your saints, are praised by the archangels with ceaseless glories.

You were not created with hands but are creator of the hidden things; You are the invisible, pure, and holy One who told us the wisdom of Your hidden glory.

You have made us hope for the unquenchable light; and we, Your servants, offer unto You glory, thanksgiving, and holiness; and the people glorify You.

O Lord, we glorify You.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'morning-offering-of-praise'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'morning-offering-of-praise'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'prayer-to-the-god-of-light',
  'Prayer to the God of light',
  null,
  null,
  'Prayer to the God of light',
  'የብርሃን አምላክ ሆይ የሕይወት መገኛ የዕውቀት መጀመሪያ
ጸጋን በፍጹም ጸጋ የሚሰጥ፤ ነፍስን የፈጠረ መንፈስ ቅዱስን
በመስጠት የሚጠቅም።

የጥበብ መገኛ የቅዱሳን መምህርና የዓለም መሠረት የንጹሓንን ጸሎት
የሚቀበል ወልድ ዋሕድ አንተን እናመሰግናለን፡፡ ቀዳሜ በኩር የምትሆን
የአብ ቃል ለምንጠራህ ለእኛ ለሁሉ የሚሆን የአንተን ፀጋ የሰጠኸን።

ነውር የሌለብህ ንጹህ አባት ብል ነቀዝ የማያበላሸው ገንዘብ ያለህ
በፍጹም ልቦናቸው ለሚያምኑብህ የምትሰጥ፡፡ ዓለም ሳይፈጠር
የነበረውን ብርሃን ያዩት ዘንድ መላእክት ደስ የሚያሰኛቸው።

የማይለወጥ ጠባቂያችን በእኛ የነበረዉን ጨለማ በአባትህ ፈቃድ አራቅህልን፤
ከጨለማ ወደ ብርሃን አወጣኸን ከሞት አድነህ ሕይወትን ሰጠኸን
ከመገዘት ነጻ አወጣኸን በመስቀልህ በሰማይ ወዳለዉ ወደ አባትህ
ያቀረብከን አቤቱ በወንጌል መራኸን፡፡

በነቢያት አረጋጋኸን ያቀረብከን አምላክ አንተ ነህ ዳግመኛ አቤቱ
ዕውቀትን ግለጽልን ለአንተ ለአምላካችን ምስጋናን እናቀርባለን
አርምሞ በሌለበት ምስጋና እኛ ያንተ አገልጋዮች እናመሰግንሃለን
ሕዝቡም አንተን ያመሰግናሉ፡፡

አቤቱ አንተን እናመሰግናለን፡፡',
  'አምላከ ብርሃን ወላዴ ሕይወት ርእሱ ለአእምሮ ወሀቤ ጸጋ
ዘእምጸጋ ፍጹም ገባሬ ነፍስ በቋዒ ጸጋዌ መንፈስ ቅዱስ፡፡

መዘገበ ጥበብ ረዳኢ መምህረ ቅዱሳን ወመሠረተ ዓለም ዘይትዌከፍ
ጸሎተ ንጹሐን፡፡ ለከ ንሴብሕ ወልድ ዋሕድ ቀዳሜ በኵር ቃለ አብ
ዘለኵሉ ዚአከ ጸጋ ዘወሀብከነ ለእለ ንጼውአከ፡፡

አብ ንጹሕ ዘአልቦ ነውር ዘቦቱ ጥሪት ኀበ ፃፄ ወቊንቊኔ ኢያማስኖ
ለዘበኵሉ ሕሊና ለእለ ይትዌከሉ ብከ ትሁብ፡፡ ዘያፈትዎሙ
ለመላእክት የሐውፅዎ ለዘእምቅድመ ዓለም ብርሃን፡፡

ዐቃቢነ ዘኢይማስን መዝገበ ጽልመት እንተ ብነ በሥምረተ አቡከ አብራህከ ለነ
ዘአውፃእከነ እማዕምቅ ውስተ ብርሃን ወወሀብከነ ሕይወተ እሞት ወጸጎከነ
እምግብርናት ግዕዛነ ዘበመስቀልከ አቅረብከነ ኀበ አቡከ መልዕልተ ዓለም
ሰማያት በወንጌል መራሕከነ፡፡

ወበነቢያት ናዘዝከነ ዘለሊከ አቅረብከነ አምላክ አላ ብርሃነ ሀበነ
እግዚኦ ለከ ለአምላክነ ንዌድስ ከመ ወትር በዘኢያረምም አኰቴት
ንብል ንሕነ እሊአከ አግብርት፡፡ ወሕዝብኒ ኪያከ ይዌድሱ፡፡

ኪያከ ንዌድስ እግዚኦ፡፡',
  'O God of light, You are the source of life, the head of knowledge, the giver of grace from the perfect grace, the maker of the soul, giver of good, giver of the Holy Spirit.

Treasure of wisdom, helper, teacher of saints, foundation of the world, and One who accepts the prayer of the holy ones: we glorify You, O only-begotten Son, first-born Word of the Father, who have granted Your universal grace to us who call upon You.

O pure and blameless Father, You have treasures which moth and rust do not corrupt, and of which You give to those who trust upon You in all their thoughts. You make the angels desire to behold the light which was before the world.

You are our unchangeable guardian. Through Your Father’s pleasure You enlightened us who had treasured darkness, brought us from darkness to light, granted us life after death, granted us freedom from slavery, brought us near to Your Father in heaven by Your Cross, and led us by the Gospel.

You comforted us through the prophets and brought us near, O God. Give us light, O Lord our God, that with ceaseless thanksgiving we may say we are Your servants; and the people praise You.

O Lord, we praise You.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'prayer-to-the-god-of-light'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'prayer-to-the-god-of-light'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'praise-to-christ-the-deliverer',
  'Praise to Christ the deliverer',
  null,
  null,
  'Praise to Christ the deliverer',
  'ከሁሉ በላይ የምትሆን የእግዚአብሔር ልጁ ኢየሱስ ክርስቶስ ሆይ
ጌትነትህ ለዘላለም ከሚሆን መንግሥትህ ጋራ በቃላችን ይህነን
ምስጋና ሦስተኛ ጊዜ ለአንተ እናቀርባለን።

ፍጥረት ሁሉ በመራድ በመፍራት ያመሰግንሃል፤ ነፍስ ሁሉ
የሚፈራው የሚያመልከው የጻድቃን ነፍሳት በአንተ
ጸንተው ይኖራሉ፡፡

መናፍስት ያመጡትን የጐርፉን ፈሳሽነት ከእኛ ጸጥ ያደረግህልን፤
ከጥፋት አድነህ የሕይወት ወደብ የሆንከን፤ የዘላለም ድኅነት አለኝታ
ያለበት መሸሻ የሆንከን በባህር የተጨነቁትን የምታድን በምድረ
በዳም ያሉትንም የምታድን።

በጽኑ እስራት ካሉትም ጋራ አብረሃቸው የምትኖር ከሞት ማሰሪያ
የፈታኸን፤ ችጋረኞችንና የሚያለቅሱትን የሚያረጋጋቸው፡፡ የደከሙትን
በመስቀሉ የሚያድን ከአመንበት ከእኛ መዓቱን ሁሉ የሚያርቅ፤
ነቢያትና ሐዋርያት በኅቡእ ያመሰገኑህን አንተን አቤቱ እናመሰግናለን፡፡

ለአንተ ምስጋና እናቀርባለን፡፡ አንተን አምነን በመንግስተ ሰማያት
እናርፍ ዘንድ፡፡ ፈቃድህንም እየሰራን በትእዛዝህ እንድንሄድ አድርገን
ሁሉንም በቸርነትህ ጐብኝ፡፡ ትንንሾችንም ትልልቆችንም፤
ገዢውንና ሕዝቡን ጠባቂውንና መንጋውን፡፡

አቤቱ አምላካችን ሆይ ክቡር መንግሥት የአንተ ነውና ከዓለም
አስቀድሞ ምስጋና ለአብ ለወልድ ለመንፈስ ቅዱስ ይገባል ዛሬም
ዘወትርም ለልጅ ልጅ ለዘላለሙ የማይፈጸም፡፡

አሜን፡፡',
  'ንሤልስ ለከ ዘንተ ስብሐት እምአፉነ ዘምስለ መንግሥትከ ዘለዓለም
ኢየሱስ ወልደ እግዚአብሔር ዘመልዕልተ ኵሉ ምስለ አብ ኵሉ
ፍጥረት ይሴብሐከ፡፡

በረዓድ ወበፍርሃተ መንፈስ ዘኵሉ ነፍስ ይፈርሆ ወኵሎሙ
ነፍሳተ ጻድቃን ብከ ይፂወኑ ዘአዝኀንከ እምኔነ፡፡

ማዕበላተ ውኂዛተ መናፍስት ዘኮንከነ መርሶ ሕይወት እሙስና
ወዘኮንከነ ምጕያየ ዘቦቱ ተስፋ መድኀኒት ዘለዓለም በባሕር እለ
ይትመነደቡ ታድኅን ወለእለ በበድው በጸጋ ትፌውስ፡፡

ወለእለ በመዋቅሕት ጽኑዓን ዘምስሌሆሙ ትሄሉ ዘእማእሰረ ሞት ፈትሐነ
ዘለምስኪናን ወለልህዋን ይናዝዞሙ፡፡ ወለእለ ፃመው በመስቀሉ ይባልሕ
ዘኵሎ መዓተ ይመይጥ ወያሴስል እምኔነ ለእለ ቦቱ ተወከልነ ዘነቢያት
ወሐዋርያት አእኰቱከ በኅቡእ ኪያከ ንዌድስ እግዚኦ፡፡

ወንሴብሐከ ከመ ለቢወነ ብከ ናዕርፍ በማኅደረ ሕይወት እንዘ
ንገብር ፈቃደከ ሀበነ ንሑር በትእዛዝከ ወኵሎ እግዚኦ በምሕረትከ
ሐውጽ ንኡሳነ ወዐቢያነ መኰንነ ወሕዝቦ ኖላዌ ወመርዔቶ፡፡

እስመ ዚአከ መንግሥት ቡሩክ እግዚኦ አምላክነ ስብሐት ለአብ
ወወልድ ወመንፈስ ቅዱስ እምቅድመ ዓለም ይእዜኒ ወዘልፈኒ
ለዓለም ወለትውልድ ትዉልድ ዘኢየኀልቅ ለዓለመ ዓለም፡፡

አሜን፡፡',
  'O Jesus, Son of God who are above all, thrice over we offer thanksgiving unto You with Your Father in Your eternal kingdom.

All creatures glorify You in trembling and fear. Every soul fears You, and the souls of the righteous trust in You.

You quieted the stormy floods of evil spirits for our sake and became for us life from destruction, a refuge wherein there is the hope of eternal salvation. You save those in distress at sea and refresh those in the wilderness.

You accompany those under hard imprisonment and loosen us from the bond of death. You comfort the miserable and the weeping, save the weak with Your Cross, remove wrath from us who trust in You. O Lord, whom prophets and apostles thanked secretly, we thank You.

We glorify You so that, believing in You and fulfilling Your will, we may rest in the abode of life. Grant us to walk according to Your command. Through Your mercy visit all, small and great, rulers and people, shepherd and flock.

For Yours is the kingdom, O blessed Lord our God. Glory be to the Father, the Son, and the Holy Spirit, before the creation of the world, both now and ever, and from generation to endless generations, and world without end.

Amen.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'praise-to-christ-the-deliverer'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'praise-to-christ-the-deliverer'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'grace-and-lifting-up-the-heart',
  'Grace and lifting up the heart',
  null,
  null,
  'Grace and lifting up the heart',
  'የእግዚአብሔር ጸጋ ከናንተ ጋራ ይሁን፡፡
ከመንፈስህ ጋራ፡፡

ፈጣሪያችንን እናመስግነው፡፡
እውነት ነው ይገባል፡፡

የልቡናችሁን አሳብ አጽኑ፡፡
ከእግዚአብሔር ዘንድ አለን አባታችን ሆይ አባታችን ሆይ አባታችን
ሆይ አቤቱ ወደፈተና አታግባን፡፡',
  'ጸጋ ዘእግዚአብሔር የሀሉ ምስሌክሙ፡፡
ምስለ መንፈስከ፡፡

ንሰብሖ ለአምላክነ፡፡
ርቱዕ ይደሉ፡፡

አጽንዑ ሕሊና ልብክሙ፡፡
ብነ ኀበ እግዚአብሔር አቡነ ዘበሰማያት አቡነ ዘበሰማያት አቡነ
ዘበሰማያት ኢታብአነ እግዚኦ ውስተ መንሱት፡፡',
  'The grace of God be with you.
And with your spirit.

Let us glorify our God.
It is right, it is just.

Strengthen the thought of your heart.
We lift them unto the Lord. Our Father who art in Heaven, Our Father who art in Heaven, Our Father who art in Heaven, lead us not into temptation.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'grace-and-lifting-up-the-heart'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'grace-and-lifting-up-the-heart'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'prayer-to-the-father-giver-of-light',
  'Prayer to the Father, giver of light',
  null,
  null,
  'Prayer to the Father, giver of light',
  'ብርሃንን የሚሰጥ እግዚአብሔር አብ ለሁሉ ኃይል የሚሆን
ነፍስን ሁሉ የሚጐበኝ ከቀድሞ ጀምሮ የነበረ ብርሃን ዓለምን
የፈጠረ ወደ ሕይወት የሚመራ የማያልፈውን ተድላ የሚሰጥ ነው።

ከጨለማ መሰናክል አውጥተህ የማይገኝ ብርሃንን የሰጠኸን
ያመንብህ እኛን ከማዕሠረ ክህደት አውጥተህ በሃይማኖት
ያከበርከን፡፡

ከአገልጋዮቹ የማይርቅ የማይለይ፤ ዘወትር ከነርሱ ጋራ የሚኖር
በፍርሃት በረዓድ የምትለምውን ነፍስ ቸል የማይል ከሕሊና
አስቀድሞ ሁሉን የሚያውቅ ከአሳብ አስቀድሞ የሚመረምር።

ሳንለምነው የምንሻውን ዐውቆ የሚሰጠን ሳንጠራጠር የምንለምነውን
የሚሰማን የማይመረመር ብርሃን፡፡ በሰማያት ያሉ የመላእክት ንጉሥ
አድሮባቸው የሚኖር ሊቃነ መላእክት ያቀረቡትን ምስጋና የሚቀበል
አቤቱ የምንለምንህን ስማን።

አርምሞ የሌለበትን ቃል በሃይማኖት ስጠን አንተን ፈጽሞ
እናመሰግን ዘንድ አንተን እናከብር ዘንድ በአንተም ጸንተን
እንኖር ዘንድ፤ አቤቱ እኛ አገልጋዮችህ እናመሰግንሃለን፡፡

አቤቱ አንተን እናመሰግንሃለን፡፡',
  'እግዚአብሔር አብ ወሀቤ ብርሃን ዘለኵሉ ኃይል ወለኵሉ ነፍስ
ሐዋፂ ብርሃን ዘእምቅድም ዓለም ኃታሚ መራሔ ሕይወት
ወበቋዔ ተድላ ዘኢይመውት፡፡

ዘአውፃእከነ እምዕቅፍተ ጽልመት ወብርሃነ ዘኢይትረከብ
ጸጎከነ ዘእማእሠር ለእለ የአምኑ ብከ ፈቲሐከ በሃይማኖት
ከለልከነ፡፡

ዘኢይርኅቅ እምአግብርቲሁ ወትረ ዘምስሌሆሙ ይሄሉ ዘኢይጸመም
ለዘበፍርሃት ወበረዓድ ትስእሎ ነፍስ እምቅድመ ሕሊና ኵሎ የአምር
ወእምቅድመ ሕሊና ይፈትን፡፡

ወዘእንበለ ንስአሎ ይሁብ ፍትወተነ ዘእፈቃዱ ወይሰምዐነ እለ እንበለ
ኑፋቄ ንጼውዖ ዘኢይትነገር ብርሃን፡፡ ንጉሠ ሠራዊተ ሰማያት ሰማዒ
ስብሐተ ማኅሌት ዘሊቃነ መላእክት ዘዲቤሆሙ የዐርፍ ስምዐነ ንስእለከ
እግዚኦ፡፡

ሀበነ በትውክልት ቃለ ዘኢያረምም ኪያከ ንሰብሕ ኪያከ
ናእኵት ወኪያከ ንባርክ ወከመ ብከ ንጸወን ንሕነ አግብርቲከ
ንሴብሐከ እግዚኦ፡፡

ኪያከ ንሴብሕ እግዚኦ፡፡',
  'O God the Father, giver of light, power of all, visitor of every soul, light which was before the world, creator of the world, leader of life, and giver of immortal happiness:

You have taken us out of the snares of darkness and granted us the unsearchable light. You loosed us who believe in You from the chains of unbelief and covered us with faith.

You are not far from Your servants but are always with them. You do not neglect the soul that supplicates You with fear and trembling. You know all before the thought and examine all before the thought.

Before we ask, You supply our needs through Your will. You hear those who call upon You without doubting, O unsearchable light, King of heavenly hosts and hearer of the glorious song of the archangels. O Lord, hear us.

Grant us the unceasing word in trust. We glorify You, thank You, and bless You. O Lord, we, Your servants, glorify You because we depend upon You.

O Lord, we glorify You.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'prayer-to-the-father-giver-of-light'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'prayer-to-the-father-giver-of-light'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'prayer-to-jesus-the-healer-and-light',
  'Prayer to Jesus the healer and light',
  null,
  null,
  'Prayer to Jesus the healer and light',
  'አቤቱ ኢየሱስ ክርስቶስ ሆይ ቊርጥ ልመናችንን ስማን፤ ድዳ ለነበሩት
ቃል ለተሰበሩት ምርጕዝ ለዕዉራን ብርሃን ለሐንካሶች መሄጃ
ለምጻሙን የሚያነጻ ሆናቸው በደዌ የተያዙትን አቤቱ አዳንህ
ደንቆሮችን ፈወስክ፡፡

ሞትን ዘለፈዉ፤ ጨለማንም ሣቀየው ብርሃንን የፈጠረ
ኅልፈት የሌለበት ፀሓይ የማይጠፋ ፋኖስ በቅዱሳን ላይ
ዘወትር የሚያበራ ፀሓይ።

በተወሰነ በቊርጥ ፈቃድ ለዓለም ጌጥ ሁሉን የፈጠረ ሰውን ለማዳን
ለሁሉ ተገለጽህ ነፍስን የመለስሃት አንተ ነህ ሁሉን እንደሚገባ
ማሰብን አስቀደምህ፡፡

መላእክትን የፈጠርህ የሁሉ አባት የሁሉ ጌታ የኣለም ጌጥ ምድርን
የፈጠርሃት ዓለም ሳይፈጠር የነበረ ጥበብና ዕውቀት ከአብ ወደዚህ
ዓለም ተላከ ይህ አኗናር የማይለወጥ የማይፈርስ የማይመረመር ነው
የማይታይ መንፈስ ነው።

ይህን የተናገርክ አንተ ምስጉን ነህ ምስክርነትህም የተደነቀ ነው
ስለዚህ እኛ አገልጋዮችህ እናመሰግንሃለን፡፡

አቤቱ አንተን እናመሰግናለን፡፡',
  'እግዚኦ ኢየሱስ ክርስቶስ ሰምዐነ ቅዱሰ ለበሐማን ኮኖሙ ቃለ
ለስቡራን ምርጕዘ ወለዕዉራን ብርሃነ ለሐንካሳን ፍኖተ ወለዘለምጽ
መንጽሒ እኁዛተ ሕማማት እግዚእ ፈወስከ ለጽሙማን መፈውስ፡፡

ለሞት ዘለፎ ወለጽልመት ሣቀዮ ዘገብረ ብርሃነ ፀሐይ
ዘኢየዐርብ ወማኅቶት ዘኢይጠፍእ ፀሐይ ዘዘልፈ ያበርህ ዲበ
ቅዱሳን፡፡

ወኵሎ ተከለ ለሠርጐ ዓለም በሥምረት እቁም ገሃደ ለኵሉ ሠረቀ
ለሰብእ መድኃኒተ መያጢሃ ለነፍስ ወኵሎ በዘይደሉ አቅደምከ
ሐልዮ፡፡

ገባሬ መላእክት አበ ኵሉ ሠርጎ ዓለም ሣራሪሃ ለምድር ጥበብ
ወአእምሮ እምአብ ዘሀሎ እምቅድም ውስተ ዓለም ተፈነወ ዝ ህሉና
ዘኢይትነሠት ወዘኢይተረጐም መንፈስ ዘኢያስተርኢ፡፡

ዜናዊ ስብሕ አንተ ወመንክር ስምከ፤ ወበእንተ ዝንቱ ንሕነ
አግብርቲከ ንዌድሰከ እግዚኦ፡፡

ኪያከ ንዌድስ እግዚኦ፡፡',
  'O Lord Jesus Christ, holy One, hear us. You became a word to the dumb, a staff to the broken, light to the blind, a way to the lame, and purifier of the lepers. O Lord, You healed the sick and cured the deaf.

You rebuked death and destroyed darkness. You created the light of the sun which does not set, the unquenchable light, the Sun which always shines over the holy ones.

By Your fixed will You established all for the adornment of the world. You appeared clearly to all for the salvation of mankind, restored the soul, and determined all things rightly beforehand.

O Creator of angels, Father of all, adornment of the world and maker of earth, wisdom and knowledge were sent to the world by the Father who was before. This existence is unchangeable, unsearchable, and invisible Spirit.

You are the glorious announcer, and Your name is wonderful. For this reason we, Your servants, praise You, O Lord.

O Lord, we praise You.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'prayer-to-jesus-the-healer-and-light'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'prayer-to-jesus-the-healer-and-light'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'holy-faith-and-reconciliation',
  'Holy faith and reconciliation',
  null,
  null,
  'Holy faith and reconciliation',
  'የማይለወጥ ባንተ ማመንን የሰጠኸን አቤቱ ይህን ክቡር ምስጋና
ሦስተኛ ጊዜ እናቀርብልሃለን፤ የሞት ማሰሪያ ክህደትን በሃይማኖት
ድል እንድንነሣው ያደረክህልን ለሚያምኑብህ ቅን ልቡናን
የፈጠርህ፡፡

ከሰው ወገን አማልክት ይባሉ ዘንድ በመንፈስ የጠላትን ኃይል ሁሉ
እንረግጥ ዘንድ የሰጠኸን የማይፈታውን እንፈታ ዘንድ ከአባትህ
ዘንድ ፍቅርን አደረግህልን በመካከላችንም ሆነህ አስታረቅኽን።

አቤቱ የሚለምኑህን ስማቸው፤ አቤቱ የምንለምንህ እኛ አንከሰስ
በመከሰስ ጊዜ በጠላታችን ላይ እንኑርበት እንጂ፡፡ ዘወትር
እንድንጸልይ አድርገን ከጠላታችን ማታለል እንጠበቅ ዘንድ
የዘለዓለም ንጉሥ ሆይ ስማ።

ባልቴቲቱን አረጋጋት አባት እናት የሞቱበትን ልጅ ተቀበል፤
የታለሉትን በቸርነትህ አንጻ፤ ሰነፎችን አስብ አዋቂ አድርጋቸው፤
የጠፉትን መልስ፤ በግዞት ያሉትን አድናቸው፤ ለሁላችንም መጠጊያ
ሁነን አቤቱ አምላካችን ክቡር መንግሥትህ ያንተ ነውና፡፡

አሜን፡፡',
  'ንሤልስ ለከ ዘንተ ቅዱሰ ስብሐተ ዘወሀብከነ ዚአከ ሃይማኖተ
ዘኢይትነሠት ወቦቱ ገበርከ ለነ ንማዕ ማዕሠሪሁ ለሞት ፈጠርከ
ሕሊናተ ርቱዓተ ለእለ የአምኑ ብከ፡፡

ብከ ከመ እምሰብእ ይኩኑ አማልክተ ዘወሀብከነ በመንፈስ ንኪድ
ኵሎ ኀይሎ ለጸላኢ ከመ ንፍታሕ ዘኢይትፈታሕ ፍቅረ ለነ ኀበ
አቡከ ገበርከ ወዐረቀ ማእከሌነ፡፡

ስማዕ እግዚኦ እለ ኪያከ ይስእሉ እግዚኦ እለ ዘንስእለከ ኢንሰተት አላ
በስክየት ዲበ ጸላኢ ንዕሉ ጸላኢነ ሀሉ ጸላኢ ነሀሉ፡፡ ሀበነ ዘወትር
ጸሎተነ እምኂጠተ ጸላኢ ንትዐቀብ ስማዕ ዘለዓለም ንጉሥ፡፡

መዓስበ ናዝዝ እጓለ ማውታ ተወከፍ ሲሩያነ በምሕረትከ አንጽሕ
ዓብዳነ አጥበብ ወኅጕላነ ሚጥ እለ ውስተ ሞቅሕ አድኅን ወለኵልነ
ኩን ፀወነ እስመ ለከ እግዚኦ አምላክነ መንግሥት ቡሩክ፡፡

አሜን፡፡',
  'Thrice over we offer this holy glory to You, who have given us Your unchangeable faith, by which You made us break the bonds of death and created upright minds for those who believe in You.

You granted us through the Spirit to tread down all the power of the enemy, to loosen what cannot be loosened, and You established love toward Your Father for us, making reconciliation in our midst.

O Lord, hear those who supplicate You. Let us not, who supplicate You, fall into sin, but vindicate us against our enemies and accusers. Grant us continuous prayer that we may be kept from being swallowed up by the enemy. O eternal King, hear us.

Comfort the widows, accept the orphans, purify the unclean through Your mercy, grant wisdom to the foolish, restore the lost, save the prisoners, and be a refuge to all of us, for Yours is the blessed kingdom, O Lord our God.

Amen.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'holy-faith-and-reconciliation'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'holy-faith-and-reconciliation'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'prayer-to-the-immortal-father',
  'Prayer to the immortal Father',
  null,
  null,
  'Prayer to the immortal Father',
  'የማትለወጥ አንተን አብን የነፍሳችን መድኃኒት የምትሆን የጥበባት
መሠረት፤ የልቡናችን ጠባቂ ውስጣዊ ዓይናችንን ብሩህ ያደረግህልን
የሕሊናችንን ጨለማ አርቀህ ከአንተ በሚገኝ ዕውቀት አከበርከን።

ለጥፋት የተሰጠ የቀደመ ሰው አዳምን በልጅህ መስቀል አዳንህ
በማይለወጥ አደስከው፡፡ ስሕተቶች በትእዛዝህ ጠፉ በልጅህ ሞት አዳንህ
የጠፋውን ፈለግህ ስለዚህ እኛ አገልጋዮችህ እናመሰግንሃለን፡፡

አቤቱ አንተን እናመሰግናለን፡፡',
  'ለከ ለአብ ዘኢይማስን መድኃኔ ነፍስነ ወመሠረተ ጥበባት ዐቃቤ
አልባቢነ ዘእንተ ውስጥ ዓይነነ አብራህከ ወጽልመተ ሕሊናነ
በዘዚአከ አእምሮ ከለልከነ፡፡

አንተ ዘተውህበ ለሙስና ዘትካት ብእሴ አድኀንከ በመስቀሉ ለዋሕድከ
ወሐደስኮ በዘኢይማስን፡፡ ዘስሕተታት በጠላ በትእዛዝከ ወበሞተ
ወልድከ ቤዘውከ ወዘተገድፈ ኀሠሥከ ወበእንተ ዝንቱ ንሕነ አግብርቲከ
ንሴብሐከ እግዚኦ፡፡

ንሴብሐከ እግዚኦ፡፡',
  'O immortal Father, Saviour of our souls, foundation of wisdom, keeper of our hearts, You granted light to our inward eyes and covered us with Your knowledge against the darkness of our mind.

You saved the first man, Adam, who was given to destruction, by the Cross of Your Only-begotten and renewed him by immortal things. Iniquities vanished through Your commandment; by the death of Your Son You made redemption and searched for the lost one. For this reason we, Your servants, glorify You, O Lord.

We glorify You, O Lord.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'prayer-to-the-immortal-father'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'prayer-to-the-immortal-father'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'unceasing-song-with-the-archangels',
  'Unceasing song with the archangels',
  null,
  null,
  'Unceasing song with the archangels',
  'ሳናቋርጥ አርምሞ ጽርዓት በሌለበት ቃል ሊቃነ መላእክት
ለሚያመሰግኑህ ለአንተ ከምስጋና የሚበልጥ ምስጋናን
እናቀርብልሃለን ያውም መላእክት የሚያመሰግኑት ምስጋና ነው።

አቤቱ አንተን በማኅሌት ያመሰግኑሃል፤ ያንተ ምክር ያንተ ቃል ያንተ
ጥበብ ያንተ መጐብኘት የላክኸው ወልድ ከቀድሞ ጀምሮ ካንተ ጋራ
የነበረ ዓለም ሳይፈጠር ያልተፈጠረ።

ባሕርየ ሰብእን ለማዳን በሥጋ የተገለጸ ቃል ልጅህ ወዳጅህ ጌታችን
ኢየሱስ ከኃጢአት ቀንበር ነጻ አደረገን አቤቱ ስለዚህ እኛ
አገልጋዮችህ እናመሰግንሃለን፡፡

አቤቱ እናመሰግናለን፡፡',
  'ንዌድሰከ እግዚኦ ዘወትረ ይሴብሑ ስብሐተ ማኅሌት ዘሊቃነ
መላእክት በኢያርምሞ እንበለ ዕረፍት ውዳሴ ስብሐት ወአኰቴት
ዘአጋዕዝት በመኃልይ፡፡

ይሴብሑከ እግዚኦ ዘፈኖከ ምክረከ ዚአከ ቃለ ዚአከ ጥበበ
ወዘዚአከ ሕዋጼ ዘሀሎ ምስሌከ፡፡ እምቅድም ዓለም እንበለ
ይትገበር ዘኢተገብረ፡፡

ዘተርእየ በሥጋ ለመድኃኒተ ትዝምደ ሰብእ ወልድከ ወፍቁርከ
እግዚእነ ኢየሱስ ዘአግዐዘነ እምአርዑተ ኃጢአት ወበእንተ ዝንቱ
ንሕነ አግብርቲከ ንዌድሰከ እግዚኦ፡፡

ንዌድሰከ እግዚኦ፡፡',
  'We praise You, O Lord, with the glorious song by which the archangels glorify You always, unceasingly and without rest, with praise of glory and thanksgiving.

O Lord, they praise You for Your counsel, Your Word, Your Wisdom, and Your visitation which was with You before the world began, without being created.

That Word appeared in the flesh for the salvation of mankind. Your beloved Son, our Lord Jesus, has set us free from the yoke of sin. For this reason we, Your servants, praise You, O Lord.

We praise You, O Lord.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'unceasing-song-with-the-archangels'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'unceasing-song-with-the-archangels'
  );

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'life-for-the-humble-and-refuge-for-all',
  'Life for the humble and refuge for all',
  null,
  null,
  'Life for the humble and refuge for all',
  'ምስጋናን ሦስተኛ ጊዜ ከልባችን ለአንተ እናቀርባለን፤ ሕይወትን
የምትሰጥ አቤቱ የትሑታንን ሰውነት የሚጐበኝ የተቸገረውን ሰውነት
ቸል የማይል ከሀገራቸው የተሰደዱትን የሚቀበላቸው የሚረዳቸው።

በመከራ ያሉትን የሚያድን ለተራቡት የሚያስብላቸው ለተበደሉት
የሚበቀልላቸው የምእመናን ወዳጅ፡፡ ለጻድቃን የሚመሰክርላቸው
የንጹሓን ማደሪያቸው በእውነት የሚለምኑትን የሚሰማ።

ባልቴቲቱን የሚሠውር አባት እናት የሞቱበትን የሚያድን
የሃይማኖት ክብር ምስጋና ማረፊያ ላደረጋት ለቤተ ክርስቲያን ቅን
መሪ የሚሰጥ ሀብት ጸጋ ኃይልም የመንፈስ ቅዱስ ጉባኤ
የምትሆን።

አንተን ስናመሰግን ዘወትርም ሳናርፍ የመንግሥትህን ነገር
በልቡናችን እናውቃለን አንተ ስለ ገለጽህልን ልጅህ ወዳጅህ ጌታችን
ኢየሱስም ስለ ገለጸልን ምስጋና ጽንዕ ያለዉ ለዘላለሙ፡፡

አሜን፡፡
ቡራኬ፡፡',
  'ለከ ዘእምልብነ ውዳሴ ንሤልስ ወሀቤ ሕይወት እግዚኦ ሐዋፂ ነፍሰ
ትሑታን መንፈሰ ምንዱበ ኢተኀየየ ዘይትዌከፎሙ ለእለ ይሰደዱ
ረዳኢ፡፡

ወለእለ ውስተ ሠርም ይትመነደቡ መድኅን ለርኁባን ዘይሔሊ
ወይትቤቀል ለግፉዓን ዐርከ መሐይምናን መስተናግር፡፡ ለጻድቃን
ወማኅደር ለንጹሓን ወለእለ በጽድቅ ይጼውዕዎ ሰማዒ፡፡

ለመበለት ከዳኒ ወባላሒ ለእጓለ ማውታ ዘይሁብ መርሐ ርቱዐ
ለቤተ ክርስቲያን ዘተከላ ላቲ ምዕራፈ ስብሐተ ሃይማኖት ጉባኤ
መንፈስ ሀብተ ጸጋ ወኀይል፡፡

ለከ እንዘ ንዌድስ ወኢናዐርፍ ለዝሉፉ በአልባቢነ ናስተማስል አምሳለ
መንግሥትከ ቦቱ በእንቲአከ ወበእንተ ፍቁር ወልድ እግዚእነ ኢየሱስ
ዘቦቱ ለከ ስብሐት ወእኂዝ ለዓለመ ዓለም፡፡

አሜን፡፡
ቡራኬ፡፡',
  'From our hearts we offer to You thrice over praise, O Lord, giver of life. You visit the humble soul, do not despise the troubled spirit, receive those who are driven away, and help them.

You save those in difficulty, think of the hungry, avenge those who are wronged, and are the friend of the faithful. You testify for the righteous, are the dwelling place of the pure, and hear those who call upon You in righteousness.

You protect the widow, save the orphan, and grant right leadership to the Church, which You have made a dwelling place of glorious faith, the council of the Spirit, and the gift of grace and power.

While we praise You without rest, we know in our hearts Your kingdom, which was declared unto us by You and by Your beloved Son, our Lord Jesus, through whom be glory and dominion unto You forever and ever.

Amen.
Benediction.',
  c.id,
  s.id,
  c.slug,
  s.slug,
  s.sort_order,
  'published',
  now()
from public.prayer_collections c
join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'life-for-the-humble-and-refuge-for-all'
where c.slug = 'yekidane-tselot'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'life-for-the-humble-and-refuge-for-all'
  );

-- Meharene Ab full prayer

insert into public.prayers (
  slug, title, title_amharic, title_geez, title_english,
  text_amharic, text_geez, text_english, transliteration,
  collection_id, section_id, collection_slug, section_slug,
  sort_order, status, published_at
)
select
  'full-prayer',
  'መሐረነ አብ ሙሉ ጸሎቱ',
  'መሐረነ አብ ሙሉ ጸሎቱ',
  null,
  'Meharene Ab Mulu Tselotu',
  'አባት ሆይ ማረን ሃሌ ሉያ
ወልድ ሆይ ማረን ሃሌ ሉያ
መሐሪ መንፈስ ቅዱስ ሆይ በይቅርታህ አስበን (3 ጊዜ)
ላንተ ምሥጋናን እንልካለን ላንተም ምሥጋናን እናሳርጋለን
ይቅር ባይ ይቅር በለን ኃጢአታችንንም አስተስርይልን
አድነንም
ነፍሳችንንና ሥጋችንን ጠብቅ
የእግዚአብሔር ልጅ ክርስቶስ ሆይ
አምላካችን መድኃኒታችን ኢየሱስ ክርስቶስ ሆይ ይቅር በለን
በምህረትህ ብዛት
በደላችንን አጥፋልን
ይቅርታህንም ወደኛ ላክልን
ባንተ ዘንድ ነውና
ይቅርታ
ሃሌ ሉያ ይቅር ባይ አባት ሆይ ማረን
ይቅርም በለን
ይቅር ባይ ሆይ ይቅርታህን ላክ
ያለፈው በደላችንን አስበህ አታጥፋን
በይቅርታህ
አንተ ይቅር ባይ ነህና
ለሚጠሩህ ሁሉ ይቅርታህ ብዙ ነው
በእውነት ለሚጠሩህ
ሁልጊዜ ሰሚ ነህ
በማዳን ጊዜ ቻይ ነህ
ቻይ
በማዳን ጊዜ
ለአምላካችን ቃሉ እውነት ነው፡፡
አብን እንለምነው ምሕረቱን ይላክልን
አብ ለለመነው ሁሉ ይበቃልና
ሃሌ ሉያ
ለርሱ ምስጋና ይገባል
ሃሌ ሉያ ለርሱ ምስጋና ይገባል
ሃሌ ሉያ
ለሁሉ ጌታ ለክርስቶስ
ሃሌ ሉያ ሃሌ ሃሌ ሉያ
አሁንስ
ተስፋየ ማን ነው
እግዚአብሔር አይደለምን
አቤቱ ነፍሴን በእጅህ አደራ እሰጣለሁ
ወደ ምህረት አምላክ
ነፍስየን አደራ እሰጣለሁ
ወደ ምስጋና ንጉሥ
ነፍስየን አደራ እሰጣለሁ
በጌታየና በአምላኬ
ነፍስየን አስጠብቃለሁ
ነፍሴን ከክፉ ሥራ ሁሉ አድናት
ስጡ
እንለምነው
ራራልን እንበለው
እውነተኛ የሆነው አምላካችን ቃሉ እውነት ነውና
ሁሉን የሚችል የሚሳነው ነገር የሌለ
የድሆች አምላክ የተቸገሩትን የምትረዳ
እኛ ባንተ ተማጽነናል
ሁሉን የሚችል የሚሳነው ነገር የሌለ
የድሆች አምላክ ያዘኑትን የምታጽናና ሆይ
እኛ በአንተ ተማጽነናል
ሁሉን የሚችል የሚሳነው ነገር የሌለ
የድሆች እና ተሥፋ ለቆረጡ አምላካቸው
እኛ ባንተ ተማጽነናል
ከጧት ጀምሮ እስከማታ እንደጠበቅከን ከማታ እሰከ ጧት ጠብቀን (3 ጊዜ የሚባል)
አቤቱ ርስትህን ይቅር በል ሃሌ ሉያ ጸሎታችንን እና አስተብቁኦታችንን ስማ ኃጢአታችንንም ሁሉ አስተስርይልን የዕዝራ ፀሎትና ልመና የሰማህ ሆይ ምህላችንን ተቀበል ሰላምህን ስጠን ከመካከላችንም አትራቅ
አቤቱ ከኛ መዓትህን መልስ ሃሌ ሉያ ያማርሽ ርግብየ እንደ እንኮይ የአፏ ሽታያማረ ንግግሯም ሀሉ ሰላም የሆነ ርግቤየ ሆይ ወደ እኔ ነይ
አቤቱ ይቅርታህን አሳየን ሃሌ ሉያ፣ የሰላማችን ማደርያ ደብተራ ኦሪት የሰማዕታት እናታቸው የመላእክት እህታቸው ኑ ሁላችንም ወደ ድንግል ማርያም እንስገድ
የሰላማችን መልአክ የመላእክት አለቃ ቅዱስ ሚካኤል ሆይ ስለኛ ለምን፡፡ ጸሎታችንንም ከታላቁ ንጉሥ መንበር ፊት አሳርግልን፡፡
ቅዱስ ገብርኤል ድንግል ማርያምን አበሠራት እንዲህ አላት ልጅን ትወልጃለሽ ለዘለዓለሙ ለያዕቆብ ቤት ይነግሣል ለመንግቱም ፍጻሜ የለውም
ቅዱስ ጊዮርጊስ ሆይ ወደ እግዚአብሔር ለምንልን ስለኛ ለምን፡፡ አረዱት ቆራረጡት ስጋውን ፈጭተው እንደ ትቢያ በተኑት፡፡ ወደ ሰባ ነገሥታት ወሰዱት ምድርን ተረገጠ ሙታንን አስነሣ፡፡ አባታችን ጊዮርጊስ በሰላም ከሞት ወደ ሕይወት ተሻገረ ርስት መንግሥተ ሰማያትንም ወረሰ፡፡
ብፁዕ አባታችን አቡነ ተክለሃይማኖት በጌታው ዘንድ ዋጋን ያገኝ ዘንድ ወደ ገዳማት የገሠገሠ፡፡ ወደ ደብረ ሊባኖስ ገዳም ገባ በታላቅ ደስታና በሰላም ገባ፡፡
አባ ሳሙኤል ሆይ በረከትህን እቀበል ዘንድ ባርከኝ ስለ ቅድስት ቤተ ክርስቲያን ሰላም ስትል ባርከኝ በረከትህንም እቀበላለሁ
ለዓለምና ለዘለዓለም ሃሌሉያ
የአብ ሰላም የወልድ ሰላም የመንፈስ ቅዱስ ሰላም በናንተ በወንድሞቻችንና በእህቶቻችን መካከል ይኑር
አቤቱ ክርስቶስ ሆይ ማረን',
  'መሐረነ አብ ሃሌ ሉያ
ተሣሃለነ ወልድ ሃሌ ሉያ
መንፈስ ቅዱስ መሐሪ ተዘከረነ በሣህልከ
ለከ ንፌኑ ስብሐተ ወለከ ነዓርግ አኮቴተ
መሐረነ መሐሪ ኃጢአተነ አስተሥሪ
ወአድኅነነ
ወተማህፀን ነፍሰነ ወሥጋነ
ክርስቶስ ወልደ እግዚአብሔር
አምላክነ ወመድኃኒነ ኢየሱስ ክርስቶስ ተሣሃለነ
በብዝኃ ምህረትከ
ደምስስ አበሳነ
ወፈኑ ሣህለከ ዲቤነ
እስመ እምኀቤከ
ውእቱ ሣህል
ሃሌ ሉያ መሐረነ አብ መሐሪ
ወተሣሃለነ
ሀብ ሣህለከ መሐሪ
ኢታጥፍአነ ተዘኪረከ ዘትካት
በምህረትከ
እስመ መሐሪ አንተ
ወብዙህ ሣህልከ ለኩሎሙ እለ ይጼውዑከ
ይጼውዑከ በጽድቅ
ሰማዒ ወትረ
ከሃሊ ዘውስተ አድኅኖ
ከሃሊ
ዘውስተ አድህኖ
ለአምላክነ እስመ ጽድቅ ቃሉ
ንስአሎ ለአብ ይፈኑ ለነ ሣህሎ
እስመ አብ የአክል ለዘሰአሎ
ሃሌ ሉያ
ስብሐት ሎቱ ይደሉ
ሃሌ ሉያ አኮቴት ሎቱ ይደሉ
ሃሌ ሉያ
ለክርስቶስ ለእግዚአ ኩሉ
ሃሌ ሉያ ሃሌ ሃሌ ሉያ
ወይእዜኒ
መኑ ተስፋየ
አኮኑ እግዚአብሔር
ውስተ እዴከ እግዚኦ አመኀጽን ነፍስየ
ኀበ አምላከ ምህረት
አመኀፅን ነፍስየ
ኀበ ንጉሠ ስብሐት
አመኀጽን ነፍስየ
በእግዚእየ ወአምላኪየ
አመኀጽን ነፍስየ
እምኩሉ ምግባረ እኩይ አድኅና ለኀፍስየ
ሀቡ
ንስአሎ
ናስተምህሮ
ለአምላክነ ጻድቅ እስመ ጽድቅ ቃሉ
ዘይክል ኩሎ ወአልቦ ዘይሰአኖ
አምላከ ነዳያን ረዳኤ ምንዱባን
ነህነ ኀቤከ ተማኅፀነ
ዘይክል ኩሎ ወአልቦ ዘይሰአኖ
አምላከ ነዳያን ናዛዜ ኅዙናን
ንህነ ኀቤከ ተማኅፀነ
ዘይክል ኩሎ ወአልቦ ዘይሰአኖ
አምላከ ነዳያን ወተስፋ ቅቡፃን
ንህነ ኀቤከ ተማኅፀነ
ወበከመ ዐቀብከነ እምነግህ እስከ ሠርክ ዕቀበነ እግዚኦ እምሠርክ እስከ ነግህ
ተሣሃልከ እግዚኦ ምድረከ ሃሌ ሉያ ስማዕ ጸሎተነ ወስዕለተነ ወስረይ ኩሎ ኃጢአተነ ስማዕ ጸሎተነ ወስዕለተነ ዘሰማዕኮ ጸሎቶ ወስዕለቶ ለዕዝራ ተወከፍ ምህላነ ሰላመከ ኀበነ ወእማዕከሌነ ኢትርሐቅ
ወሚጥ መዓተከ እምኔነ ሃሌ ሉያ፤ ንዒ ኀቤየ እንቲአየ ሠናይት ርግብየ መዓዛ አፉሃ ከመ ኮል ወኩሉ ነገራ በሰላም
አርእየነ እግዚኦ ሣህለከ ሃሌ ሉያ፤ ማህደረ ሰላምነ ቅድስት ደብተራ እሞሙ ለሰማዕት ወእኅቶሙ ለመላእክት ንዑ ንስግድ ኩልነ ኀበ ማርያም እምነ
መልአከ ሰላምነ ሊቀ መላእክት ሚካኤል፣ ሰአል ወጸሊ በእንቲአነ አዕርግ ጸሎተነ ቅድመ መንበሩ ለንጉሥ አቢይ
ገብርኤል አብሠራ ለማርያም ወይቤላ ትወልዲ ወልደ ወይነግሥ ለቤተ ያዕቆብ ለዓለም ወአልቦ ማኅለቅት ለሰላሙ።
ሰዓል ለነ ጊዮርጊስ ኀበ እግዚአብሔር ወጸሊ በእንቲአነ ሀረድዎ ወገመድዎ ወዘረዉ ሥጋሁ ከመ ሐመድ ወወሰድዎ ኀበ ሰብዓ ነገሥት ረገጸ ምድረ አንስአ ሙታነ አባ ጊዮርጊስ በሰላም አደወ መንግሥተ ክብር ወረሰ
ብፁዐ አባ አቡነ ተክለ ሃይማኖት ዘኤለ ገዳማተ በኀበ እግዚኡ ይንሳእ እሴተ ቦአ ገዳመ ደብረ ሊባኖስ በፍስሐ ወበሰላም
ባርከኒ አባ እንሣእ በረከተከ በእንተ ሰላማ ለቅድስት ቤተ ክርስቲያን ሳሙኤል አባ ባርከኒ እንሣእ በረከተከ
ለዓለም ወለዓለመ ዓለም ሃሌ ሉያ
ሰላመ አብ ወሰላመ ወልድ ወሰላመ መንፈስ ቅዱስ የሃሉ ማዕከሌክሙ አኀው
እግዚኦ መሐረነ ክርስቶስ',
  null,
  null,
  c.id,
  s.id,
  c.slug,
  s.slug,
  coalesce(s.sort_order, 1),
  'published',
  now()
from public.prayer_collections c
left join public.prayer_sections s
  on s.collection_id = c.id and s.slug = 'meharene-ab-full-prayer'
where c.slug = 'meharene-ab'
  and not exists (
    select 1 from public.prayers p
    where p.collection_id = c.id and p.slug = 'full-prayer'
  );

commit;