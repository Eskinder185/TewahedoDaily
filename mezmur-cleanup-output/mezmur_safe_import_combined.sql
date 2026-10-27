-- =============================================================================
-- TEWAHEDODAILY — COMBINED SAFE IMPORT SCRIPT (857 HYMNS + 7 SAFE ENRICHMENTS)
-- Target Project: tgvhpibzzkqxkcumrivh (Supabase)
-- Batch Contents:
--   1. 379 New Hymns with verified YouTube URLs
--   2. 478 New Clean-Format Hymns (lyrics & metadata complete, YouTube pending)
--   3. 7 Non-destructive Enrichments for Existing Records
-- Generated: 2026-10-26
-- =============================================================================

BEGIN;

-- -----------------------------------------------------------------------------
-- SECTION 1: SAFE ENRICHMENTS FOR EXISTING RECORDS (7 hymns)
-- -----------------------------------------------------------------------------
-- Enrichment for tewedaj-mezimur (Add missing Latin transliteration lyrics from exact_youtube_id (lOcABJ07_Ec))
UPDATE public.mezmur_data_import SET lyrics_transliteration = 'bark lene egzio zente ዓmete mሕretke
bebzኃ girutke leሕzbke ityophya
kemengeni lesmke qdus/2/
bekeme ykun nbretne beselam

VERSE 1
webedaኅna lezntu ዓmet/2/...', updated_at = NOW() WHERE slug = 'tewedaj-mezimur' AND (lyrics_transliteration IS NULL OR lyrics_transliteration = '');
-- Enrichment for yedenagil-memekiya-yenebiyat-awude-amet-orthodox-mezmur (Add missing Latin transliteration lyrics from exact_youtube_id (QJYv9pprYL0))
UPDATE public.mezmur_data_import SET lyrics_transliteration = 'ዐwde ዓmetun barkiln dngl maryam
yedenagl memekiya yenebiyat gedam
ዐwde ዓmetun barkiln dngl maryam...', updated_at = NOW() WHERE slug = 'yedenagil-memekiya-yenebiyat-awude-amet-orthodox-mezmur' AND (lyrics_transliteration IS NULL OR lyrics_transliteration = '');
-- Enrichment for des-yebelene-elel-belu (Add missing Latin transliteration lyrics from exact_youtube_id (HaxhNswSv08))
UPDATE public.mezmur_data_import SET lyrics_transliteration = 'bewኃ texemeqe dagmegna bemenfes qdus
bexmqet weleden
227.amsemayat
amsemayat werede weemmaryam tewelde /2/

VERSE 1
kemeykun bieza /2/ lekulu ዓlem/2/
lebse ሥga maryam /riga/
trgum፡
kesemayat werede ke...', updated_at = NOW() WHERE slug = 'des-yebelene-elel-belu' AND (lyrics_transliteration IS NULL OR lyrics_transliteration = '');
-- Enrichment for our-bride-and-groom (Add missing Latin transliteration lyrics from exact_amharic_title (ሙሽራዬ))
UPDATE public.mezmur_data_import SET lyrics_transliteration = 'mushrayu/3/ abebayie
keጐnh yemthon eht agegneh
yegnama musra enkuan des aleh
yeagziabሔr feqadu lezih kabeqachhu

VERSE 1
bietachhu ymereq befqr yatsnachhu...', updated_at = NOW() WHERE slug = 'our-bride-and-groom' AND (lyrics_transliteration IS NULL OR lyrics_transliteration = '');
-- Enrichment for wemako-ethiopian-orthodox-mezmur (Add missing Latin transliteration lyrics from exact_amharic_title (ወእመ አኮ))
UPDATE public.mezmur_data_import SET lyrics_transliteration = 'weame ako keme werieza ኃyel/ri2/
twiedso merዓt enze tbl/4/
352. nsiebho
nsiebሖ /2/ leamlake ዕzra

VERSE 1
arsun lefexere ersuanm leሠra
nsiebሖ leamlake azra
353. all ell
all all des ybelen/2/

VERSE 2
...', updated_at = NOW() WHERE slug = 'wemako-ethiopian-orthodox-mezmur' AND (lyrics_transliteration IS NULL OR lyrics_transliteration = '');
-- Enrichment for come-all-and-then-marvel (Add missing Latin transliteration lyrics from exact_amharic_title (ኑ ተመልከቱልኝ))
UPDATE public.mezmur_data_import SET lyrics_transliteration = 'mushrochu honu abrፃm weሣra/2/
ሐnana iyaqiem betselot sitegu
befexariyachew melkamun biyadergu
beqdus gabcha tsentew biramedu

VERSE 1
yeamlakn anat dngln weledu/2/
nu temelketulgn
nu temelketulgn yeam...', updated_at = NOW() WHERE slug = 'come-all-and-then-marvel' AND (lyrics_transliteration IS NULL OR lyrics_transliteration = '');
-- Enrichment for tehetenashe-girum (Add missing Latin transliteration lyrics from exact_youtube_id (o4Wh8G9UG9E))
UPDATE public.mezmur_data_import SET lyrics_transliteration = 'anatu honeshal lemedኃnieዓlem/2/
ntsሕt slehonsh..... amebietie /2/
enken yelielebsh ...... emebietie /2/
yefxretat nta....... amebietie /2/

VERSE 1
beanchi yaderebsh....... amebietie /2/
yedngl memere...', updated_at = NOW() WHERE slug = 'tehetenashe-girum' AND (lyrics_transliteration IS NULL OR lyrics_transliteration = '');

-- -----------------------------------------------------------------------------
-- SECTION 2: NEW DRAFT HYMNS INSERTION (857 hymns)
-- -----------------------------------------------------------------------------
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-barkln-abietu-yhnn-yem-ret', 'ትርጉም፡- ባርክልን አቤቱ ይህንን የምሕረት', 'ትርጉም፡- ባርክልን አቤቱ ይህንን የምሕረት', 'trgum፡- barkln abietu yhnn yemሕret', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- ባርክልን አቤቱ ይህንን የምሕረት', 'ዓመታችንን በቸርነትህ ብዛት
ለሕዝቦችህ ኢትዮጵያ እንድንገዛ ለቅዱስ
ስምህ /2/
አንዲሆንልን ኑሮአችን በሰላም

VERSE 1
በደኅና በዚህ ዓመት /2/
35. ወአንተኒ ወረብ ዝማሜ ጽፋት
ሃሌ ሉያ ወአንተኒ ሕፃን ነቢየ ልዑል ትሰመይ
አርኮ ለመርዓዊ ትሰመይ ወአዝማዱ በሥጋ

VERSE 2
ትሰመይ ተፈኖከ ተዐርዉ አናቅጸ ጽድቅ
በመንፈስ የሐውር ወበኃይለ ኤልያስ
አልቦ ዘየአብል ዮለ ዮሐንስ
ወረብ

VERSE 3
ወአንቲኒ ሕፃን ነቢየ ልዑል/ሪ/
አርኮ ለመርዓዊ ትሰመይ/2/ ነቢየልዑል/2/
ሰላም
ተሰአልከ እግዚኦ ምድረከ ዛሌ ሉያ

VERSE 4
ዮሐንስ ክቡር ነቢየ ልዑል ብአሴ ሰላም ዘንብረቱ
ገዳም/2/
3. ርዕሰ አውደ አመት
ርዕሰ ዐውደዓመት ዮሐንስ ወላዲ መጥቅዕ/2/

VERSE 5
ወላዴ መጥቅዕፅዕ/2/ ወአበቅቴ/2/
ርዕሰ ዐውደዓመት ዮሐንስ ወላዴ መጥቅእ/2/
ወላዴ መጥቅፅ/2/ ዮሐንስ
4. ዐውደ ዓመት

VERSE 6
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት/2/
ንዒ ማርያም ለምህረት ወሣልህ/2/', 'ዓmetachnn becherneth bzat
leሕzbochh ityophya endngeza leqdus
smh /2/
andihonln nuroachn beselam

VERSE 1
bedeኅna bezih ዓmet /2/
35. weanteni wereb zmamie tsfat
ሃlie luya weanteni ሕፃn nebiye lዑl tsemey
arko lemerዓwi tsemey weazmadu beሥga

VERSE 2
tsemey tefenoke teዐrwu anaqtse tsdq
bemenfes yeሐwr webeኃyle ielyas
albo zeyeabl yole yoሐns
wereb

VERSE 3
weantini ሕፃn nebiye lዑl/ri/
arko lemerዓwi tsemey/2/ nebiyelዑl/2/
selam
tesealke egzio mdreke zalie luya

VERSE 4
yoሐns kbur nebiye lዑl basie selam zenbretu
gedam/2/
3. rዕse awde amet
rዕse ዐwdeዓmet yoሐns weladi mexqዕ/2/

VERSE 5
weladie mexqዕፅዕ/2/ weabeqtie/2/
rዕse ዐwdeዓmet yoሐns weladie mexqe/2/
weladie mexqፅ/2/ yoሐns
4. ዐwde ዓmet

VERSE 6
ዐwde ዓmet lebarko barko ዐwde ዓmet/2/
nዒ maryam lemhret weሣlh/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=azgzeb93HHU', 'draft', 'pending', 'https://www.youtube.com/watch?v=azgzeb93HHU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kezih-let-kezih-met-laderesen-hulachnn-2', 'ከዚህ ዕለት ከዚህ ዓመት ላደረሰን ሁላችንን /2/', 'ከዚህ ዕለት ከዚህ ዓመት ላደረሰን ሁላችንን /2/', 'kezih ዕlet kezih ዓmet laderesen hulachnn /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ከዚህ ዕለት ከዚህ ዓመት ላደረሰን ሁላችንን /2/', 'የሰው ልጆች አድሜ ጥንቱንም ሲጀመር
ምን ቢወጣ ቢወርድ ቢበዛ ቢደመር
አንድ ቀን አይሞላም እንደአንተ አቆጣጠር /2/', 'yesew ljoch admie xntunm sijemer
mn biwexa biwerd bibeza bidemer
and qen aymolam endeante aqoxaxer /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=89c46sW_IrY', 'draft', 'pending', 'https://www.youtube.com/watch?v=89c46sW_IrY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abebayosh', 'አበባዮሽ', 'አበባዮሽ', 'abebayosh', 'Ethiopian Orthodox Tewahedo Mezmur - አበባዮሽ', 'አሰይ ደስ ደስ ይበላችሁ/2/
ቅዱስ ዮሐንስ መጣላችሁ
ደስ ደስ ይበላችሁ
ደስ ብሎን መጣን ደስ ብሎን/2/

VERSE 1
ጌታ አለ ብለን ደስ ብሎን
ደስ ብሎን መጣን ደስ ብሎን/2/
ድንግል አለች ብለን ደስ ብሉን', 'asey des des ybelachhu/2/
qdus yoሐns mexalachhu
des des ybelachhu
des blon mexan des blon/2/

VERSE 1
gieta ale blen des blon
des blon mexan des blon/2/
dngl alech blen des blun', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Lan9wVLZG74', 'draft', 'pending', 'https://www.youtube.com/watch?v=Lan9wVLZG74', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-maryamn-qdst', 'ድንግል ማርያምን ቅድስት', 'ድንግል ማርያምን ቅድስት', 'dngl maryamn qdst', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል ማርያምን ቅድስት', 'አንለምናት ቅድስት
ምሕረት የሚያሠጥ ቅድስት
ቃልኪዳን አላት ቅድስት
ጭንቀት ይርቃል ቅድስት

VERSE 1
ይቀርባል ሰላም ቅደስት ›
ድንግል ማርያምን ቅድስት
አንለምናት ቅድስት
ምሕረት የሚያሠጥ ቅድስት

VERSE 2
ቃልኪዳን አላት ቅድስት
ጭንቀት ይርቃል ቅድስት
ይቀርባል ሰላም. ቅድስት ›', 'anlemnat qdst
mሕret yemiyaሠx qdst
qalkidan alat qdst
cnqet yrqal qdst

VERSE 1
yqerbal selam qdest ›
dngl maryamn qdst
anlemnat qdst
mሕret yemiyaሠx qdst

VERSE 2
qalkidan alat qdst
cnqet yrqal qdst
yqerbal selam. qdst ›', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=vvDNiiAjpJs', 'draft', 'pending', 'https://www.youtube.com/watch?v=vvDNiiAjpJs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ityophya-des-ybelsh-tlq-tsega-alesh-2', 'ኢትዮጵያ ደስ ይበልሽ ትልቅ ጸጋ አለሽ/2/', 'ኢትዮጵያ ደስ ይበልሽ ትልቅ ጸጋ አለሽ/2/', 'ityophya des ybelsh tlq tsega alesh/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ኢትዮጵያ ደስ ይበልሽ ትልቅ ጸጋ አለሽ/2/', 'ስለፈጸምሽ ሦስቱን ሕግጋት የፈጣሪሽን
ካለፈው ስህተት ሁላችን
ኢትዮጵያ ደስ ይበልሽ ትልቅ ጸጋ አለሽ/2/
ስለፈጸምሽ ሦስቱን ሕግጋት የፈጣሪሽን

VERSE 1
ካለፈው ስህተት ሁላችን', 'slefetsemsh ሦstun ሕggat yefexarishn
kalefew shtet hulachn
ityophya des ybelsh tlq tsega alesh/2/
slefetsemsh ሦstun ሕggat yefexarishn

VERSE 1
kalefew shtet hulachn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=wpwDzx-8d3M', 'draft', 'pending', 'https://www.youtube.com/watch?v=wpwDzx-8d3M', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ityophya-bahl-quanquash-yemiyakorash-2', 'ኢትዮጵያ ባህል ቋንቋሽ የሚያኮራሽ/2/', 'ኢትዮጵያ ባህል ቋንቋሽ የሚያኮራሽ/2/', 'ityophya bahl quanquash yemiyakorash/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ኢትዮጵያ ባህል ቋንቋሽ የሚያኮራሽ/2/', 'ኢትዮጵያ ባህል ቋንቋሽ የሚያኮራሽ/2/', 'ityophya bahl quanquash yemiyakorash/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=pmhRgv-2xZ8', 'draft', 'pending', 'https://www.youtube.com/watch?v=pmhRgv-2xZ8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kebrew-yqoyu-kebrew', 'ከብረው ይቆዩ ከብረው', 'ከብረው ይቆዩ ከብረው', 'kebrew yqoyu kebrew', 'Ethiopian Orthodox Tewahedo Mezmur - ከብረው ይቆዩ ከብረው', 'ከብረው ይቆዩ ከብረው
ከብረው ይቆዩ ከብረው
አበባው ለምለም ቄጤማው ለምለም
ከብረው ይቆዩ ከብረው

VERSE 1
ከብረው ይቆዩ ከብረው
ከዓመት እስከ ዓመት ደርሰው
ከብረው ይቆዩ ከብረው
አበባው ለምለም ቄጤማው ለምለም', 'kebrew yqoyu kebrew
kebrew yqoyu kebrew
abebaw lemlem qiexiemaw lemlem
kebrew yqoyu kebrew

VERSE 1
kebrew yqoyu kebrew
keዓmet eske ዓmet dersew
kebrew yqoyu kebrew
abebaw lemlem qiexiemaw lemlem', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=OKndI6eNl_Y', 'draft', 'pending', 'https://www.youtube.com/watch?v=OKndI6eNl_Y', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeawaj-negari-qal-bebereha-ayele', 'የአዋጅ ነጋሪ ቃል በበረሀ አየለ', 'የአዋጅ ነጋሪ ቃል በበረሀ አየለ', 'yeawaj negari qal bebereha ayele', 'Ethiopian Orthodox Tewahedo Mezmur - የአዋጅ ነጋሪ ቃል በበረሀ አየለ', 'የአግዚአብሔርን መንገድ አስተካክሉ እያለ
ምስክርነቱን ዮሐንስ ካስረዳን
የአዋጅ ነጋሪ ቃል በበረሀ አየለ
የአግዚአብሔርን መንገድ አስተካክሉ እያለ

VERSE 1
ምስክርነቱን ዮሐንስ ካስረዳን', 'yeagziabሔrn menged astekaklu eyale
mskrnetun yoሐns kasredan
yeawaj negari qal bebereha ayele
yeagziabሔrn menged astekaklu eyale

VERSE 1
mskrnetun yoሐns kasredan', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=kqKKkoimyy0', 'draft', 'pending', 'https://www.youtube.com/watch?v=kqKKkoimyy0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lbachn-legieta-melkam-menged-yhun', 'ልባችን ለጌታ መልካም መንገድ ይሁን', 'ልባችን ለጌታ መልካም መንገድ ይሁን', 'lbachn legieta melkam menged yhun', 'Ethiopian Orthodox Tewahedo Mezmur - ልባችን ለጌታ መልካም መንገድ ይሁን', 'ልባችን ለጌታ መልካም መንገድ ይሁን', 'lbachn legieta melkam menged yhun', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=hDFRXxDj3C8', 'draft', 'pending', 'https://www.youtube.com/watch?v=hDFRXxDj3C8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('lbachn-legieta-melkam-menged-yhun', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('teraraw-zq-ybel-xemamawm-yqna', 'ተራራው ዝቅ ይበል ጠማማውም ይቅና', 'ተራራው ዝቅ ይበል ጠማማውም ይቅና', 'teraraw zq ybel xemamawm yqna', 'Ethiopian Orthodox Tewahedo Mezmur - ተራራው ዝቅ ይበል ጠማማውም ይቅና', 'ካልተስተካከለ መንገድ የለምና
የአግዚአብሔርን መንገድ አንጥረግ ሁላችን
ማለፊያ እንዲሆነን ወደ አምላካችን
ተራራው ዝቅ ይበል ጠማማውም ይቅና

VERSE 1
ካልተስተካከለ መንገድ የለምና
የአግዚአብሔርን መንገድ እንጥረግ ሁላችን
ማለፊያ አንዲሆነን ወደ አምላካችን', 'kaltestekakele menged yelemna
yeagziabሔrn menged anxreg hulachn
malefiya endihonen wede amlakachn
teraraw zq ybel xemamawm yqna

VERSE 1
kaltestekakele menged yelemna
yeagziabሔrn menged enxreg hulachn
malefiya andihonen wede amlakachn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=zb3slu4_1H8', 'draft', 'pending', 'https://www.youtube.com/watch?v=zb3slu4_1H8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-xiat-celema-tewxen-salen', 'በኃጢአት ጨለማ ተውጠን ሳለን', 'በኃጢአት ጨለማ ተውጠን ሳለን', 'beኃxiat celema tewxen salen', 'Ethiopian Orthodox Tewahedo Mezmur - በኃጢአት ጨለማ ተውጠን ሳለን', 'የክርስቶስ መስቀል ብርሃፃን ሆነልን/2/', 'yekrstos mesqel brሃፃn honeln/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=EaIZw_zaQsk', 'draft', 'pending', 'https://www.youtube.com/watch?v=EaIZw_zaQsk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mesqel-abeba', 'መስቀል አበባ', 'መስቀል አበባ', 'mesqel abeba', 'Ethiopian Orthodox Tewahedo Mezmur - መስቀል አበባ', 'መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሸ ውብ አበባ', 'mesqel abeba neh wb abeba
adey abeba neshe wb abeba', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=rwwnBtRVG20', 'draft', 'pending', 'https://www.youtube.com/watch?v=rwwnBtRVG20', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('21-mesqel', '21].ዕፀ መስቀል', '21].ዕፀ መስቀል', '21].ዕፀ mesqel', 'Ethiopian Orthodox Tewahedo Mezmur - 21].ዕፀ መስቀል', 'ፅፀ መስቀል የክብር መውረሻ
ሰይጣንን ድል መንሻ
የክብር ባለቤት ዕፀ መስቀል የተሠዋበት ዕፀ መስቀል
ፅፀ መስቀሉ ነው ዕፀ መስቀል የዓለም መድኃኒት ዕፀ መስቀል', 'ፅፀ mesqel yekbr mewresha
seyxann dl mensha
yekbr balebiet ዕፀ mesqel yeteሠwabet ዕፀ mesqel
ፅፀ mesqelu new ዕፀ mesqel yeዓlem medኃnit ዕፀ mesqel', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=rZ3UaUwYOCE', 'draft', 'pending', 'https://www.youtube.com/watch?v=rZ3UaUwYOCE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ytqedes-smke', 'ይትቀደስ ስምከ', 'ይትቀደስ ስምከ', 'ytqedes smke', 'Ethiopian Orthodox Tewahedo Mezmur - ይትቀደስ ስምከ', 'ይትቀደስ ስምከ በኃይለ መስቀልከ በዕፀ መስቀልከ ክቡር
ዘአዕበይኮ ለስምከ /2/
ስብሐት ለከ ለባህቲትከ ልዑል /ቄ', 'ytqedes smke beኃyle mesqelke beዕፀ mesqelke kbur
zeaዕbeyko lesmke /2/
sbሐt leke lebahtitke lዑl /qie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Bms3_REeSDA', 'draft', 'pending', 'https://www.youtube.com/watch?v=Bms3_REeSDA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yomse', 'ዮምሰ', 'ዮምሰ', 'yomse', 'Ethiopian Orthodox Tewahedo Mezmur - ዮምሰ', 'ዮምሰ ለአሊያየ /2/
አበርህ በመስቀልየ /ቄ', 'yomse lealiyaye /2/
aberh bemesqelye /qie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=3rnp60MErXI', 'draft', 'pending', 'https://www.youtube.com/watch?v=3rnp60MErXI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('xln-bemesqelu', 'ጥልን በመስቀሉ', 'ጥልን በመስቀሉ', 'xln bemesqelu', 'Ethiopian Orthodox Tewahedo Mezmur - ጥልን በመስቀሉ', 'ጥልን በመስቀሉ ገደለ /2/
በመስቀሉ ለሰው ልጅ ሰላምን አደለ /2/
34 መስቀል ሕይወት
መስቀል ሕይወት

VERSE 1
መግቢያ ለገነት
ዲያብሎስ በመስቀል
ተመቶ ወድቋል
ዲያብሎስ ድል ተመታ

VERSE 2
በመስቀል ተረታ
ዲያብሎስ ኃይልም የለው
መስቀል አስጨነቀው', 'xln bemesqelu gedele /2/
bemesqelu lesew lj selamn adele /2/
34 mesqel ሕywet
mesqel ሕywet

VERSE 1
megbiya legenet
diyablos bemesqel
temeto wedqual
diyablos dl temeta

VERSE 2
bemesqel tereta
diyablos ኃylm yelew
mesqel asceneqew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=5wrV0bra1RE', 'draft', 'pending', 'https://www.youtube.com/watch?v=5wrV0bra1RE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('krstos-bedemu-qedsotalna-2', 'ክርስቶስ በደሙ ቀድሶታልና /2/', 'ክርስቶስ በደሙ ቀድሶታልና /2/', 'krstos bedemu qedsotalna /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ክርስቶስ በደሙ ቀድሶታልና /2/', 'ጎልጎታ ሲኖር አፈር ተንተርሶ /2/
ይኸው ተገኘልን በዕሌኒ ልቅሶ /2/
አጋንንት አይቀርቡም ከሩቅ ይሸሻሉ /2/
አኛ ስንባረክ በዕፀ መስቀሉ /2/', 'golgota sinor afer tenterso /2/
yኸw tegegneln beዕlieni lqso /2/
agannt ayqerbum keruq ysheshalu /2/
agna snbarek beዕፀ mesqelu /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ZB_6YN6oLTs', 'draft', 'pending', 'https://www.youtube.com/watch?v=ZB_6YN6oLTs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('l-l-egziab-r', 'ልዑል እግዚአብሔር', 'ልዑል እግዚአብሔር', 'lዑl egziabሔr', 'Ethiopian Orthodox Tewahedo Mezmur - ልዑል እግዚአብሔር', 'ልዑል እግዚአብሔር (2) ምስጋና ይገባሃል /2/
ለመስቀል በዓል (2) በሰላም በጤና አደረስከን /2/
42 እንተ ተሐንፀት
አንተ ተሐንፀት በስሙ ወተቀደሰት በደሙ

VERSE 1
ቤተክርስቲያን /2/
ወተአትበት (2) በዕፀ መስቀሉ አስመ ኃይለ
አግዚአብሔር ላዕሌዛፃ /2/', 'lዑl egziabሔr (2) msgana ygebaሃl /2/
lemesqel beዓl (2) beselam bexiena aderesken /2/
42 ente teሐnፀt
ante teሐnፀt besmu weteqedeset bedemu

VERSE 1
bietekrstiyan /2/
weteatbet (2) beዕፀ mesqelu asme ኃyle
agziabሔr laዕliezaፃ /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=PkXRlPb73t8', 'draft', 'pending', 'https://www.youtube.com/watch?v=PkXRlPb73t8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mer-befnot', 'መርሕ በፍኖት', 'መርሕ በፍኖት', 'merሕ befnot', 'Ethiopian Orthodox Tewahedo Mezmur - መርሕ በፍኖት', 'ፃሌ ሉያ መርሕ በፍኖት ሞገሶሙ ለጻድቃን ሞገስ
ዝንቱ መስቀል ለአዳም ዘአግብኦ ውስተ ገነት /2/
ፃሌ ሉያ መሪ ነው በመንገድ ሞገሳቸው ለጻድቃን
ሞገስ /2/

VERSE 1
ይኸ መስቀል ነው አዳምን የመለሰው ወደ ገነት', 'ፃlie luya merሕ befnot mogesomu letsadqan moges
/2/
/2/
zntu mesqel leadam zeagbo wste genet /2/

VERSE 1
ፃlie luya meri new bemenged mogesachew letsadqan
moges /2/
yኸ mesqel new adamn yemelesew wede genet
/2/

VERSE 2
/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=gR2LWsd3-G8', 'draft', 'pending', 'https://www.youtube.com/watch?v=gR2LWsd3-G8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kbebe-2-giera-werq', 'ክበበ /2/ ጌራ ወርቅ', 'ክበበ /2/ ጌራ ወርቅ', 'kbebe /2/ giera werq', 'Ethiopian Orthodox Tewahedo Mezmur - ክበበ /2/ ጌራ ወርቅ', 'ክበበ /2/ ጌራ ወርቅ
አክሊለ ጽጌ ማርያም /4', 'kbebe /2/ giera werq
aklile tsgie maryam /4', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=QNPOyVK9IMw', 'draft', 'pending', 'https://www.youtube.com/watch?v=QNPOyVK9IMw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('stzor', 'ስትዞር', 'ስትዞር', 'stzor', 'Ethiopian Orthodox Tewahedo Mezmur - ስትዞር', 'ብቻዋን በግብጽ በርዛ እንደወፍ /2/
88. አዘክሪ ድንግል
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ

VERSE 1
ለኃጥአን አኮ ለጻድቃን /2/', 'bchawan begbts berza endewef /2/
88. azekri dngl
azekri dngl azekri
leljsh asasbi azekri

VERSE 1
leኃxan ako letsadqan /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=k5kjgzr6NC8', 'draft', 'pending', 'https://www.youtube.com/watch?v=k5kjgzr6NC8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kanchi-meweledun-azekri', 'ካንቺ መወለዱን አዘክሪ', 'ካንቺ መወለዱን አዘክሪ', 'kanchi meweledun azekri', 'Ethiopian Orthodox Tewahedo Mezmur - ካንቺ መወለዱን አዘክሪ', 'በቤተልሔም »
በጨርቅ መጠቅለሉን ›»
መኝታው ግርግም »
ካንቺ መወለዱን አዘክሪ

VERSE 1
በቤቴልሔም አዘክሪ
በጨርቅ መጠቅለሉን አዘክሪ
መኝታው ግርግም አዘክሪ', 'bebietelሔm »
becerq mexeqlelun ›»
megntaw grgm »
kanchi meweledun azekri

VERSE 1
bebietielሔm azekri
becerq mexeqlelun azekri
megntaw grgm azekri', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=zCwKHl_SOIQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=zCwKHl_SOIQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beziya-bebrd-werat-azekri', 'በዚያ በብርድ ወራት አዘክሪ', 'በዚያ በብርድ ወራት አዘክሪ', 'beziya bebrd werat azekri', 'Ethiopian Orthodox Tewahedo Mezmur - በዚያ በብርድ ወራት አዘክሪ', 'የገበሩለትን »
የአድግና የላም »
አስትንፋሣቸውን »
በዚያ በብርድ ወራት አዘክሪ

VERSE 1
የገበሩለትን አዘክሪ
የአድግና የላም አዘክሪ
አስትንፋሳቸውን አዘክሪ
ለኃጥአን አኮ ለጻድቃን

VERSE 2
በግብፅ በረሀ አዘክሪ
መሰደድሽን አዘክሪ', 'yegeberuletn »
yeadgna yelam »
astnfaሣchewn »
beziya bebrd werat azekri

VERSE 1
yegeberuletn azekri
yeadgna yelam azekri
astnfasachewn azekri
leኃxan ako letsadqan

VERSE 2
begbፅ bereha azekri
mesededshn azekri', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=xzCY-6mrmlw', 'draft', 'pending', 'https://www.youtube.com/watch?v=xzCY-6mrmlw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemeqabru-zend-azekri', 'በመቃብሩ ዘንድ አዘክሪ', 'በመቃብሩ ዘንድ አዘክሪ', 'bemeqabru zend azekri', 'Ethiopian Orthodox Tewahedo Mezmur - በመቃብሩ ዘንድ አዘክሪ', 'ባነባሸው አንባ »
አሳስቢ ድንግል ሆይ »
ገነት እንድንገባ »
በመቃብሩ ዘንድ አዘክሪ

VERSE 1
ባለቀሽው እንባ አዘክሪ
አሳስቢ ድንግል ሆይ አዘክሪ
ገነት አንድንገባ አዘክሪ
ለኃጥአን አኮ ለጻድቃን

VERSE 2
932.እንደ ኤልሳበጥ
አንደ ኤልሳቤጥ ለመስግንሽ
ፊትሽ ወድቄ ልሳለምሽ
የጌታዬ አናት የእኛ አመቤት

VERSE 3
አዛኝ ነሽ ከልብ ፍጹም የዋህት
ርኅራጌሽ ያስደስተኛል
ስለ ኃጢአቴ ምልጃሽ ይቀድማል
የሰላምታሽ ድምፅ ደስ ያሰኘኛል

VERSE 4
ከትካዜዬም ያሳርፈኛል
ድምጽሽ ሲሰማኝ ልቤ ይረካል
ሐዘኔ ቀርቶ ፊቴ ይፈካል
በእናትነት አንቺን ለሰጠን

VERSE 5
ቸሩ አምላካችን ይከበር ይመሰገን
የሁሉ አቤት የሁሉ አጽናኝ
የዓለም መድኃኒት ከአምላክ አገናኝ
ዛሬም በልቤ ደስታ ጨምረሽ

VERSE 6
አንደ ኤልሳቤጥ ሰላም ልበልሽ
ከሴቶች መካከል መርጦ ቀድሶሻል
ትውልድ ሁሉ ብጽዕት ይሉሻል
በልዩ ውዳሴ ያመሰግኑሻል

VERSE 7
ድንግል ንግሥታችን በቀኝ ቆመሻል
የሰላምታሽ ድምጽ ልቤ ሲሰማ
ነፍሴን ደስ አላት ቀለላት ሽክሟ
ድንግል ለክብርሽ ስንበረከክ

VERSE 8
እጅሽ ይዘርጋ ለመባረክ
933.ትኅትናሽ ግሩም ነው', 'banebashew anba »
asasbi dngl hoy »
genet endngeba »
bemeqabru zend azekri

VERSE 1
baleqeshw enba azekri
asasbi dngl hoy azekri
genet andngeba azekri
leኃxan ako letsadqan

VERSE 2
932.ende ielsabex
ande ielsabiex lemesgnsh
fitsh wedqie lsalemsh
yegietayie anat yeegna amebiet

VERSE 3
azagn nesh kelb ftsum yewaht
rኅragiesh yasdestegnal
sle ኃxiatie mljash yqedmal
yeselamtash dmፅ des yasegnegnal

VERSE 4
ketkazieyiem yasarfegnal
dmtssh sisemagn lbie yrekal
ሐzenie qerto fitie yfekal
beenatnet anchin lesexen

VERSE 5
cheru amlakachn ykeber ymesegen
yehulu abiet yehulu atsnagn
yeዓlem medኃnit keamlak agenagn
zariem belbie desta cemresh

VERSE 6
ande ielsabiex selam lbelsh
kesietoch mekakel merxo qedsoshal
twld hulu btsዕt ylushal
belyu wdasie yamesegnushal

VERSE 7
dngl ngሥtachn beqegn qomeshal
yeselamtash dmts lbie sisema
nefsien des alat qelelat shkmua
dngl lekbrsh snberekek

VERSE 8
ejsh yzerga lemebarek
933.tኅtnash grum new', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Nqy7MGSnc6Q', 'draft', 'pending', 'https://www.youtube.com/watch?v=Nqy7MGSnc6Q', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-mekerashn', 'ድንግል መከራሽን', 'ድንግል መከራሽን', 'dngl mekerashn', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል መከራሽን', 'ድንግል መከራሽን ጥቂት ላስታሰው
በሄሮድስ ዘመን ፍጥረት ያለቀሰው
አንቺ የአምላክ አናት ደግሞም አመቤት
አንደ ችግረኛ ተነሳሽ ስደት', 'dngl mekerashn xqit lastasew
beherods zemen fxret yaleqesew
anchi yeamlak anat degmom amebiet
ande chgregna tenesash sdet', 'amharic', 'mezmur', 'ሊቀ መዘምራን  ይልማ ኃይሉ', 'https://www.youtube.com/watch?v=XKlcUiP9YwY', 'draft', 'pending', 'https://www.youtube.com/watch?v=XKlcUiP9YwY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('azagntua-maryam-bexerahush-gizie', 'አዛኝቷ ማርያም በጠራሁሽ ጊዜ', 'አዛኝቷ ማርያም በጠራሁሽ ጊዜ', 'azagntua maryam bexerahush gizie', 'Ethiopian Orthodox Tewahedo Mezmur - አዛኝቷ ማርያም በጠራሁሽ ጊዜ', 'አንድትደርሽልኝ በመከራ ጊዜ', 'andtdershlgn bemekera gizie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=cYlU8_Mu8OI', 'draft', 'pending', 'https://www.youtube.com/watch?v=cYlU8_Mu8OI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mekeran-yaye-sew-mechiem-ayceknm', 'መከራን ያየ ሰው መቼም አይጨክንም', 'መከራን ያየ ሰው መቼም አይጨክንም', 'mekeran yaye sew mechiem ayceknm', 'Ethiopian Orthodox Tewahedo Mezmur - መከራን ያየ ሰው መቼም አይጨክንም', 'አትጨክኝብኝ አደራሽን ማርያም /2/
መከራን ያየ ሰው መቼም አይጨክንም
አትጨክኝብኝ አደራሽን ማርያም /2/
90. ሰቆቃወ ድንግል

VERSE 1
ሰቆቃወ ድንግል /
ርእዮ ለይብኪ አዳነ ልብ ዘቦ /4', 'atcekgnbgn aderashn maryam /2/
mekeran yaye sew mechiem ayceknm
atcekgnbgn aderashn maryam /2/
90. seqoqawe dngl

VERSE 1
seqoqawe dngl /
reyo leybki adane lb zebo /4', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ZxPdZdypdJc', 'draft', 'pending', 'https://www.youtube.com/watch?v=ZxPdZdypdJc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('flseta-sijemer-qal-kidan-gebtalech', 'ፍልሰታ ሲጀመር ቃል ኪዳን ገብታለች', 'ፍልሰታ ሲጀመር ቃል ኪዳን ገብታለች', 'flseta sijemer qal kidan gebtalech', 'Ethiopian Orthodox Tewahedo Mezmur - ፍልሰታ ሲጀመር ቃል ኪዳን ገብታለች', 'የሌሊት ውዳሴን ንዒን ትሰማለች
ሕጻናትን በበረከት ልትጎበኝ', 'yelielit wdasien nዒn tsemalech
ሕtsanatn bebereket ltgobegn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=HYLYAA1Kgso', 'draft', 'pending', 'https://www.youtube.com/watch?v=HYLYAA1Kgso', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tmexalech-beewnet-2', 'ትመጣለች በእውነት /2/', 'ትመጣለች በእውነት /2/', 'tmexalech beewnet /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ትመጣለች በእውነት /2/', 'ትመጣለች በእውነት /2/
ትመጣለች በእውነት /2/', 'tmexalech beewnet /2/
tmexalech beewnet /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=3Mtk6qLkrfE', 'draft', 'pending', 'https://www.youtube.com/watch?v=3Mtk6qLkrfE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('tmexalech-beewnet-2', 'prayer', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('msle-mikaiel', 'ምስለ ሚካኤል', 'ምስለ ሚካኤል', 'msle mikaiel', 'Ethiopian Orthodox Tewahedo Mezmur - ምስለ ሚካኤል', 'ምስለ ሚካኤል ወገብርኤል ንኢ ሠናይትየ', 'msle mikaiel wegebriel ni ሠnaytye', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Vn-yJkG7y-M', 'draft', 'pending', 'https://www.youtube.com/watch?v=Vn-yJkG7y-M', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beziya-yefqr-bota', '» በዚያ የፍቅር ቦታ', '» በዚያ የፍቅር ቦታ', '» beziya yefqr bota', 'Ethiopian Orthodox Tewahedo Mezmur - » በዚያ የፍቅር ቦታ', '» በአግረ መስቀሉ ስር
ከክርስቶስ ጌታ
» በዚያ የፍቅር ቦታ
» በአግረ መስቀሉ ስር

VERSE 1
» ከክርስቶስ ጌታ
» ለአኛ ተሰጥተሻል
» አናት እንድትሆኝን
» ልጆችሽ ነንና

VERSE 2
» ምልጃሽ አይለየን', '» beagre mesqelu sr
kekrstos gieta
» beziya yefqr bota
» beagre mesqelu sr

VERSE 1
» kekrstos gieta
» leagna tesexteshal
» anat endthognn
» ljochsh nenna

VERSE 2
» mljash ayleyen', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=--Ns90c15NY', 'draft', 'pending', 'https://www.youtube.com/watch?v=--Ns90c15NY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemsgana-mlaw', 'በምስጋና ምላው', 'በምስጋና ምላው', 'bemsgana mlaw', 'Ethiopian Orthodox Tewahedo Mezmur - በምስጋና ምላው', 'ደስ ይበልሽ ብዬ
አጌም ላመስግናት
አንደበቴን ጌታ
በምስጋና ምላው

VERSE 1
ደስ ይበልሽ ብዬ
አጌም ላመስግናት', 'des ybelsh byie
agiem lamesgnat
andebetien gieta
bemsgana mlaw

VERSE 1
des ybelsh byie
agiem lamesgnat', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=MUmCNJxOk10', 'draft', 'pending', 'https://www.youtube.com/watch?v=MUmCNJxOk10', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('bemsgana-mlaw', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('n-rgbye-weni-naytye-2', 'ንዒ ርግብየ ወንኢ ሠናይትየ /2/', 'ንዒ ርግብየ ወንኢ ሠናይትየ /2/', 'nዒ rgbye weni ሠnaytye /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ንዒ ርግብየ ወንኢ ሠናይትየ /2/', 'ትናዝዘኒ /2/ ሐዘነ ልብየ /2/
ትርጉም ፡- ከልቤ ሐዘን ታረጋጊኝ ዘንድ
መልካምዋ ርግብ ሆያ ነይ፡፡', 'tnazzeni /2/ ሐzene lbye /2/
trgum ፡- kelbie ሐzen taregagign zend
melkamwa rgb hoya ney፡፡', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=UOgwoJbSYOQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=UOgwoJbSYOQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('regeweyn-3-anti-maryam', 'ሐረገወይን /3/ አንቲ ማርያም', 'ሐረገወይን /3/ አንቲ ማርያም', 'ሐregeweyn /3/ anti maryam', 'Ethiopian Orthodox Tewahedo Mezmur - ሐረገወይን /3/ አንቲ ማርያም', 'አጸደ ወይን /3/ አንቲ ማርያም
ሐረገወይን /3/ አንቲ ማርያም
አጸደ ወይን /3/ አንቲ ማርያም
ትመስሊ ፊደለ ወትወልዲ ወንጌለ ወታገምሪ መስቀለ', 'atsede weyn /3/ anti maryam
ሐregeweyn /3/ anti maryam
atsede weyn /3/ anti maryam
tmesli fidele wetweldi wengiele wetagemri mesqele', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=1aIDN7ijwdM', 'draft', 'pending', 'https://www.youtube.com/watch?v=1aIDN7ijwdM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tmesli-m-raqe-wetweldi-mebreqe-wetalebsi', 'ትመስሊ ምሥራቀ ወትወልዲ መብረቀ ወታለብሲ', 'ትመስሊ ምሥራቀ ወትወልዲ መብረቀ ወታለብሲ', 'tmesli mሥraqe wetweldi mebreqe wetalebsi', 'Ethiopian Orthodox Tewahedo Mezmur - ትመስሊ ምሥራቀ ወትወልዲ መብረቀ ወታለብሲ', 'ርሁቁ
ትመስሊ ምሥራቀ ወትወልዲ መብረቀ ወታለብሲ
ርሁቁ', 'rhuqu
tmesli mሥraqe wetweldi mebreqe wetalebsi
rhuqu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=-DkDYQ1dX_U', 'draft', 'pending', 'https://www.youtube.com/watch?v=-DkDYQ1dX_U', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amanuiel-gieta-hoy', 'አማኑኤል ጌታ ሆይ', 'አማኑኤል ጌታ ሆይ', 'amanuiel gieta hoy', 'Ethiopian Orthodox Tewahedo Mezmur - አማኑኤል ጌታ ሆይ', 'አማኑኤል ጌታ ሆይ በምሕረትህ ተቀበለኝ /2/
ኃጢአት አኔን ልጀህን ዳግም እንዳይገዛኝ /2/
ኃይልህን አንተ አልብሰኝ /2/', 'amanuiel gieta hoy bemሕreth teqebelegn /2/
ኃxiat anien ljehn dagm endaygezagn /2/
ኃylhn ante albsegn /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=xujgEByv5zY', 'draft', 'pending', 'https://www.youtube.com/watch?v=xujgEByv5zY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-semayn-yezerega-merietn-yatsena-2', 'ትርጉም፡- ሰማይን የዘረጋ መሬትን ያጸና /2/', 'ትርጉም፡- ሰማይን የዘረጋ መሬትን ያጸና /2/', 'trgum፡- semayn yezerega merietn yatsena /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- ሰማይን የዘረጋ መሬትን ያጸና /2/', 'ኃያል ጌታ ሕያው አምላክ ያለአንተ
ማን አለና /2/', 'ኃyal gieta ሕyaw amlak yaleante
man alena /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=MPP88MdmvsM', 'draft', 'pending', 'https://www.youtube.com/watch?v=MPP88MdmvsM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('legietayie-leegziab-r', 'ለጌታዬ ለእግዚአብሔር', 'ለጌታዬ ለእግዚአብሔር', 'legietayie leegziabሔr', 'Ethiopian Orthodox Tewahedo Mezmur - ለጌታዬ ለእግዚአብሔር', 'ለጌታዬ ለአግዚአብሔር ስላደረገልኝ ምን
አከፍለዋለሁ /2/
ምስጋና ነው እንጂ /2/ ሌላ ምን አላለሁ /4', 'legietayie leagziabሔr sladeregelgn mn
akeflewalehu /2/
msgana new enji /2/ liela mn alalehu /4', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=jHQP_noO4i8', 'draft', 'pending', 'https://www.youtube.com/watch?v=jHQP_noO4i8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beyedeqiqaw-xiat-s-ra', 'በየደቂቃው ኃጢአት ስሠራ', 'በየደቂቃው ኃጢአት ስሠራ', 'beyedeqiqaw ኃxiat sሠra', 'Ethiopian Orthodox Tewahedo Mezmur - በየደቂቃው ኃጢአት ስሠራ', 'ስሠርቅ ስበድል አንተን ሳልፈራ
አንተ ግን ፊትህ ምንም ቢቀየም
በቁጣህ በትር አልገረፍከኝም', 'sሠrq sbedl anten salfera
ante gn fith mnm biqeyem
bequxah betr algerefkegnm', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=PZikhT-9IQI', 'draft', 'pending', 'https://www.youtube.com/watch?v=PZikhT-9IQI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-xiat-guzo-xafac-bimeslm', 'የኃጢአት ጉዞ ጣፋጭ ቢመስልም', 'የኃጢአት ጉዞ ጣፋጭ ቢመስልም', 'yeኃxiat guzo xafac bimeslm', 'Ethiopian Orthodox Tewahedo Mezmur - የኃጢአት ጉዞ ጣፋጭ ቢመስልም', 'ውጤቱ መርሮ ፍጹም አይጥምም', 'wxietu merro ftsum ayxmm', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=9t8SEy38RF8', 'draft', 'pending', 'https://www.youtube.com/watch?v=9t8SEy38RF8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('ye-xiat-guzo-xafac-bimeslm', 'repentance', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-selamn-sxen', 'ትርጉም፡- ሰላምን ስጠን /#', 'ትርጉም፡- ሰላምን ስጠን /#', 'trgum፡- selamn sxen /#', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- ሰላምን ስጠን /#', 'አምላካችን /3/ ሰላም ስጠን /2/
113. ዝንቱ ኩሉ
ዝንቱ ኩሉ ኮነ /2/ በማኅደረ ስብሐት', 'amlakachn /3/ selam sxen /2/
113. zntu kulu
zntu kulu kone /2/ bemaኅdere sbሐt', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=W6YXz0lJWI8', 'draft', 'pending', 'https://www.youtube.com/watch?v=W6YXz0lJWI8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('cheru-med-nie-lem', 'ቸሩ መድኃኔዓለም', 'ቸሩ መድኃኔዓለም', 'cheru medኃnieዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - ቸሩ መድኃኔዓለም', 'ቸሩ መድኃኔዓለም አንተ ቅረበን ተለመነን /2/
በምሕረትህና በቸርነትህ እንዳትለየን /4
11ኩሎ ዘፈቀደ', 'cheru medኃnieዓlem ante qreben telemenen /2/
bemሕrethna becherneth endatleyen /4
11kulo zefeqede', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=bkzgL-hvw-g', 'draft', 'pending', 'https://www.youtube.com/watch?v=bkzgL-hvw-g', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('besemayni-webemdrni-webeba-rni-webekulu', 'በሰማይኒ ወበምድርኒ ወበባሕርኒ ወበኩሉ', 'በሰማይኒ ወበምድርኒ ወበባሕርኒ ወበኩሉ', 'besemayni webemdrni webebaሕrni webekulu', 'Ethiopian Orthodox Tewahedo Mezmur - በሰማይኒ ወበምድርኒ ወበባሕርኒ ወበኩሉ', 'በሰማይኒ ወበምድርኒ ወበባሕርኒ ወበኩሉ ቀላያት
ቀላያት /2/
ትርጉም :- እግዚአብሔር በሰማይና በምድር
በባሕርም በፈሳሾችም ሁሉ የወደደውን አደረገ

VERSE 1
1910.የሥላሴን መንበር
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሩቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሐል ሚካኤልንከፊት

VERSE 2
አአላፍ መላእክት ሲሰግዱ በፍርሃት
አዩ ተመልከቱት የሰማዩን አባት /2/
የሥላሴን መንበር ቅዱሳን ከበውት
አያሸበሸቡ የሰማይ መላእክት

VERSE 3
ካህናተ ሰማይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ታላቅ ክብር ሊያዩ የታደሉ
በጽድቅ ሥራቸው ደምቀው ይታያሉ /2/', 'besemayni webemdrni webebaሕrni webekulu qelayat
qelayat /2/
trgum :- egziabሔr besemayna bemdr
bebaሕrm befesashochm hulu yewededewn aderege

VERSE 1
1910.yeሥlasien menber
yeሥlasien menber qdusan kebewt
kirubiel bedemena zufanun yzewt
dngln kemeሐl mikaielnkefit

VERSE 2
aalaf melaekt sisegdu befrሃt
ayu temelketut yesemayun abat /2/
yeሥlasien menber qdusan kebewt
ayashebeshebu yesemay melaekt

VERSE 3
kahnate semay qdus qdus qdus silu
yhn talaq kbr liyayu yetadelu
betsdq ሥrachew demqew ytayalu /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=6rwZaHgqn34', 'draft', 'pending', 'https://www.youtube.com/watch?v=6rwZaHgqn34', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-besemayna-bemdr-beba-rna', 'ትርጉም፡- በሰማይና በምድር በባሕርና', 'ትርጉም፡- በሰማይና በምድር በባሕርና', 'trgum፡- besemayna bemdr bebaሕrna', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- በሰማይና በምድር በባሕርና', 'በፈሳሾች አግዚአብሔር
የወደደውን አደረገ', 'befesashoch agziabሔr
yewededewn aderege', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=zGqurTd8YtE', 'draft', 'pending', 'https://www.youtube.com/watch?v=zGqurTd8YtE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-abietu-attewen-atxalen-yeselam', 'ትርጉም፡- አቤቱ አትተወን አትጣለን የሰላም', 'ትርጉም፡- አቤቱ አትተወን አትጣለን የሰላም', 'trgum፡- abietu attewen atxalen yeselam', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- አቤቱ አትተወን አትጣለን የሰላም', 'አምላክ ሆይ ተራዳን ፡፡
አመቤታችን ሆይ ወደ አኛ ተመልከቺ
የልጅሽም ሰላም ከእኛ ጋር ይሁን', 'amlak hoy teradan ፡፡
amebietachn hoy wede agna temelkechi
yeljshm selam keegna gar yhun', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=WBuegNDvNyE', 'draft', 'pending', 'https://www.youtube.com/watch?v=WBuegNDvNyE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('trgum-abietu-attewen-atxalen-yeselam', 'prayer', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('fqr-s-bo', 'ፍቅር ስሐቦ', 'ፍቅር ስሐቦ', 'fqr sሐbo', 'Ethiopian Orthodox Tewahedo Mezmur - ፍቅር ስሐቦ', 'ፍቅር ስሐቦ ለወልድ ኃያል እመንበሩ /2/
ወአብጽሖ /2/ እስከ ለሞት / 2/
ትርጉም፣ ፍቅር ሳበው ኃያል ወልድን
ከዙፋኑ /2/

VERSE 1
አደረሰው /3/ አስከ መሞት /2/', 'fqr sሐbo leweld ኃyal emenberu /2/
weabtsሖ /2/ eske lemot / 2/
trgum፣ fqr sabew ኃyal weldn
kezufanu /2/

VERSE 1
aderesew /3/ aske memot /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Q5KCJBAcQ1E', 'draft', 'pending', 'https://www.youtube.com/watch?v=Q5KCJBAcQ1E', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-ye-lasie-meng-t-lezele-lem-new', 'ትርጉም፣ የሥላሴ መንግሥት ለዘለዓለም ነው', 'ትርጉም፣ የሥላሴ መንግሥት ለዘለዓለም ነው', 'trgum፣ yeሥlasie mengሥt lezeleዓlem new', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፣ የሥላሴ መንግሥት ለዘለዓለም ነው', 'አያሉ በማያቋርጥ አንደበት ይዘምራሉ', 'ayalu bemayaquarx andebet yzemralu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=_dcf6m6U2Qs', 'draft', 'pending', 'https://www.youtube.com/watch?v=_dcf6m6U2Qs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('trgum-ye-lasie-meng-t-lezele-lem-new', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-bechgrna-be-zen-gizie-yale-ante', 'ትርጉም፣ በችግርና በሐዘን ጊዜ ያለ አንተ', 'ትርጉም፣ በችግርና በሐዘን ጊዜ ያለ አንተ', 'trgum፣ bechgrna beሐzen gizie yale ante', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፣ በችግርና በሐዘን ጊዜ ያለ አንተ', 'የሚረዳን ዘመድ አናውቅም(የለንም)', 'yemiredan zemed anawqm(yelenm)', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=1ylAhlRoJyg', 'draft', 'pending', 'https://www.youtube.com/watch?v=1ylAhlRoJyg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-sew-hulu-kemiwedat', 'ትርጉም፣ ሰው ሁሉ ከሚወዳት', 'ትርጉም፣ ሰው ሁሉ ከሚወዳት', 'trgum፣ sew hulu kemiwedat', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፣ ሰው ሁሉ ከሚወዳት', 'በደብረ መድኃኒትና በማኅደረ
ስብሐት አግዚአብሔር አደረ፡:', 'bedebre medኃnitna bemaኅdere
sbሐt agziabሔr adere፡:', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=TaZme5UfPMs', 'draft', 'pending', 'https://www.youtube.com/watch?v=TaZme5UfPMs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('menkre-grma', 'መንክረ ግርማ', 'መንክረ ግርማ', 'menkre grma', 'Ethiopian Orthodox Tewahedo Mezmur - መንክረ ግርማ', 'መንክረ ግርማ ኃይለ ልዑል ጸለላ /2/
አማን /2/ መላእክት ይኬልልዋ /4
ትርጉም፣ በሚያስደንቅ ግርማ የልዑል
ኃይል ጋረዳት /2/

VERSE 1
በአውነት /2/ መላአክት አመሰገኗት /2/', 'menkre grma ኃyle lዑl tselela /2/
aman /2/ melaekt ykiellwa /4
trgum፣ bemiyasdenq grma yelዑl
ኃyl garedat /2/

VERSE 1
beawnet /2/ melaakt amesegenuat /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=bw5ITZhlY80', 'draft', 'pending', 'https://www.youtube.com/watch?v=bw5ITZhlY80', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kule-kentu', 'ኩለ ከንቱ', 'ኩለ ከንቱ', 'kule kentu', 'Ethiopian Orthodox Tewahedo Mezmur - ኩለ ከንቱ', 'ኩሉ ከንቱ ከንቱ ንብረቱ እስመ ኩሉ ኃላፊ ውእቱ /2/', 'kulu kentu kentu nbretu esme kulu ኃlafi wetu /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=PfrAWhA4jcY', 'draft', 'pending', 'https://www.youtube.com/watch?v=PfrAWhA4jcY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-endeante-yqr-bay-man-ale', 'ትርጉም፣ እንደአንተ ይቅር ባይ ማን አለ', 'ትርጉም፣ እንደአንተ ይቅር ባይ ማን አለ', 'trgum፣ endeante yqr bay man ale', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፣ እንደአንተ ይቅር ባይ ማን አለ', 'ሰው ሁሉ አንተን ተስፋ ያደርጋልና
141. መድኃኔዓለም', 'sew hulu anten tesfa yadergalna
141. medኃnieዓlem', 'amharic', 'mezmur', 'ዘማሪ ዲያቆን አቤል', 'https://www.youtube.com/watch?v=0fTNQXu061E', 'draft', 'pending', 'https://www.youtube.com/watch?v=0fTNQXu061E', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amanuiel-adanen', 'አማኑኤል አዳነን', 'አማኑኤል አዳነን', 'amanuiel adanen', 'Ethiopian Orthodox Tewahedo Mezmur - አማኑኤል አዳነን', 'አማኤል አዳነን በማይሻር ቃሉ /2/
ኸኸ ደስ ይበለን /2/ እልል በሉ /2/
አዳነን በማይሻር ቃሉ /2/', 'amaiel adanen bemayshar qalu /2/
ኸኸ des ybelen /2/ ell belu /2/
adanen bemayshar qalu /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=UTFlYCuohJY', 'draft', 'pending', 'https://www.youtube.com/watch?v=UTFlYCuohJY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beleni-me-rkuke', 'በለኒ መሐርኩከ', 'በለኒ መሐርኩከ', 'beleni meሐrkuke', 'Ethiopian Orthodox Tewahedo Mezmur - በለኒ መሐርኩከ', 'በለኒ መሐርኩከ /2/ በአንተ ማርያም
አስመ አልቦ ዘአንበሌከ ዘይሜሕር ቃል', 'beleni meሐrkuke /2/ beante maryam
asme albo zeanbelieke zeymieሕr qal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=pK6comVzDSQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=pK6comVzDSQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wetu-liqomu', 'ውእቱ ሊቆሙ', 'ውእቱ ሊቆሙ', 'wetu liqomu', 'Ethiopian Orthodox Tewahedo Mezmur - ውእቱ ሊቆሙ', 'ውእቱ ሊቆሙ ለመላእክት ወመልአኮሙ
ስሙ ሜካኤል /2/
ልብሱ ዘመብረቅ ዓይኑ ዘርግብ ሊቀ መላእክት /2/
ትርጉም፣ ለመላእክት አለቃቸው እርሱ ነው

VERSE 1
ስሙ ሚካኤል ነው የሚካኤል
ልብሱ የመብረቅ አይኖቹም የርግብ
ዓይኖቹ ይመስላሉ', 'wetu liqomu lemelaekt wemelakomu
smu miekaiel /2/
lbsu zemebreq ዓynu zergb liqe melaekt /2/
trgum፣ lemelaekt aleqachew ersu new

VERSE 1
smu mikaiel new yemikaiel
lbsu yemebreq aynochum yergb
ዓynochu ymeslalu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=EIT7JcuGnes', 'draft', 'pending', 'https://www.youtube.com/watch?v=EIT7JcuGnes', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('liqe-melaekt', 'ሊቀ መላእክት', 'ሊቀ መላእክት', 'liqe melaekt', 'Ethiopian Orthodox Tewahedo Mezmur - ሊቀ መላእክት', 'ሊቀ መላአክት ሚካኤል መልአክ ምክሩ ለልዑል
ኃያል /2/ ሰዳዴ ሳጥናኤል ኃይል ገባሬ ኃይል /2/
ትርጉም፣ የመላእክት አለቃ ሚካኤል ለልዑል', 'liqe melaakt mikaiel melak mkru lelዑl
/2/
/2/
ኃyal /2/ sedadie saxnaiel ኃyl gebarie ኃyl /2/

VERSE 1
trgum፣ yemelaekt aleqa mikaiel lelዑl', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=YVBs1aXA_6I', 'draft', 'pending', 'https://www.youtube.com/watch?v=YVBs1aXA_6I', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('melmale-werq-2', 'ሐመልማለ ወርቅ /2/', 'ሐመልማለ ወርቅ /2/', 'ሐmelmale werq /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሐመልማለ ወርቅ /2/', 'ሐመልማለ ወርቅ /2/
ልብሱ ዘመብረቅ /2/
ነፍስና ሥጋዬ በምግብ ተጣልተው
መልአኩ ዑራኤል ቆሞ አስታረቃቸው

VERSE 1
ለሰዎች ደኅንነት ጽድቅን የሚሰብከው
ነውና ዑራኤል የሰላም መልአክ
አጅና አግሬ ታስሮ ሽባ የነበርኩኝ
ይኸው ተጠምቄ በጠበሉ ዳንኩኝ

VERSE 2
ስአለቴ ሰምሮልኝ ሁሉን አግኝቻለሁ
ለአምላክ ዑራኤል አመሰክራለሁ
አልፈልግም ሐኪም ምን ያደርግልኛል
አምላከ ዑራኤል ፈጥኖ ያድነኛል

VERSE 3
ሕሙማን ለምኑ ስንፍና አይያዛችሁ
ኑና ተጠመቁ ጠበሉ አለላችሁ
ያመናችሁ ሰዎች ኑና ተጠመቁ
አማላጅነቱን በግልጽ አሳውቁ

VERSE 4
አምላከ ዑራኤል አንተ ችላ አትበለኝ
መጥቻለሁና በችሎታህ አረዳኝ
53. - ምድር ጸዳች
ምድር ጸዳች ሐሴት አደረገች

VERSE 5
ምድር ጸዳች ከእድፍም ነጻች
በክርስቶስ ደም በአውነት ታጠበች''/2/
ሴቶች ትንሣኤውን ሲያወሩ በደስታ/''/2/
ጮሐ ስትመሰክር ምድር አፍዋን ከፍታ/2/

VERSE 6
የተዘጋው ዓለም ሲገለባበጥ''2/
ምን ተናገሩ አይሁድ ከፍርድ ለማምለጥ''2/
አያልቅባቸውም የአነርሱ ፈሊጥ/2/
መግነዙ ተገኘ ከመቃብር ወድፃዋ/2/

VERSE 7
ምልክት እንዲሆን ተወላቸው አውቀ/2/
አሑድ በማለዳ መቃብሩን ሲያዩ
ሁሉም ተለውጦ ልቅሶው ደስታ ሆነነ/2/
ሁለቱ መላእክት ብርሃን የለበሱ''2/

VERSE 8
ተነሥቷል አሏቸው ሴቶቹ ሲደርሱ/2/', 'ሐmelmale werq /2/
lbsu zemebreq /2/
nefsna ሥgayie bemgb texaltew
melaku ዑraiel qomo astareqachew

VERSE 1
lesewoch deኅnnet tsdqn yemisebkew
newna ዑraiel yeselam melak
ajna agrie tasro shba yeneberkugn
yኸw texemqie bexebelu dankugn

VERSE 2
saletie semrolgn hulun aggnchalehu
leamlak ዑraiel amesekralehu
alfelgm ሐkim mn yaderglgnal
amlake ዑraiel fexno yadnegnal

VERSE 3
ሕmuman lemnu snfna ayyazachhu
nuna texemequ xebelu alelachhu
yamenachhu sewoch nuna texemequ
amalajnetun beglts asawqu

VERSE 4
amlake ዑraiel ante chla atbelegn
mexchalehuna bechlotah aredagn
53. - mdr tsedach
mdr tsedach ሐsiet aderegech

VERSE 5
mdr tsedach keedfm netsach
bekrstos dem beawnet taxebech''/2/
sietoch tnሣiewn siyaweru bedesta/''/2/
coሐ stmesekr mdr afwan kefta/2/

VERSE 6
yetezegaw ዓlem sigelebabex''2/
mn tenageru ayhud kefrd lemamlex''2/
ayalqbachewm yeanersu felix/2/
megnezu tegegne kemeqabr wedፃwa/2/

VERSE 7
mlkt endihon tewelachew awqe/2/
aሑd bemaleda meqabrun siyayu
hulum telewxo lqsow desta honene/2/
huletu melaekt brሃn yelebesu''2/

VERSE 8
teneሥtual aluachew sietochu sidersu/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=kvQVyKNLebk', 'draft', 'pending', 'https://www.youtube.com/watch?v=kvQVyKNLebk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-aleqa-yehone-mikaiel-lbsu-mebreq', 'ትርጉም፤ አለቃ የሆነ ሚካኤል ልብሱ መብረቅ', 'ትርጉም፤ አለቃ የሆነ ሚካኤል ልብሱ መብረቅ', 'trgum፤ aleqa yehone mikaiel lbsu mebreq', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፤ አለቃ የሆነ ሚካኤል ልብሱ መብረቅ', 'ነው ዓይኖቹም የርግብ ዓይን ይመስላሉ
ሚካኤል የወርቅ ሐመልማል ነው', 'new ዓynochum yergb ዓyn ymeslalu
mikaiel yewerq ሐmelmal new', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=cO8miGVeZH0', 'draft', 'pending', 'https://www.youtube.com/watch?v=cO8miGVeZH0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ynu-zergbe', '.ዓይኑ ዘርግበ', '.ዓይኑ ዘርግበ', '.ዓynu zergbe', 'Ethiopian Orthodox Tewahedo Mezmur - .ዓይኑ ዘርግበ', 'ዓይኑ ዘርግብ ልብሱ ዘመብረቅ /2/
ሐመልማለ ወርቅ /3/ ሚካኤል ሊቅ /2/
ትርጉም፣- ሊቀመላእክት ቅዱስ ሚካኤል ዓይኑ
የርግብ ልብሱም የመብረቅ ነው፡፡

VERSE 1
162. ነዋ ሚካኤል', 'ዓynu zergb lbsu zemebreq /2/
ሐmelmale werq /3/ mikaiel liq /2/
trgum፣- liqemelaekt qdus mikaiel ዓynu
yergb lbsum yemebreq new፡፡

VERSE 1
162. newa mikaiel', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=KZRjyCCjeiU', 'draft', 'pending', 'https://www.youtube.com/watch?v=KZRjyCCjeiU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zkie-wetu-mikaiel-bste-mena-zeawredke-2', 'ዝኬ ውእቱ ሚካኤል ኅብስተ መና ዘአውረድከ /2/', 'ዝኬ ውእቱ ሚካኤል ኅብስተ መና ዘአውረድከ /2/', 'zkie wetu mikaiel ኅbste mena zeawredke /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ዝኬ ውእቱ ሚካኤል ኅብስተ መና ዘአውረድከ /2/', 'ወከመ አያያተ መአር /2/ ጥዑም ፈድፋደ ሊቀ
መላአክት /2/
ትርጉም፣', 'wekeme ayayate mear /2/ xዑm fedfade liqe
melaakt /2/
trgum፣', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=xnpFAhTITOw', 'draft', 'pending', 'https://www.youtube.com/watch?v=xnpFAhTITOw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kel-l-zend-leyqrta-2-ylakalu', 'ከልዑል ዘንድ ለይቅርታ /2/ ይላካሉ', 'ከልዑል ዘንድ ለይቅርታ /2/ ይላካሉ', 'kelዑl zend leyqrta /2/ ylakalu', 'Ethiopian Orthodox Tewahedo Mezmur - ከልዑል ዘንድ ለይቅርታ /2/ ይላካሉ', 'ከልዑል
175. ውእቱ ሚካኤል
ውእቱ ሚካኤል ኃይል ልዑል ውእቱ ልዑል
መንበር /2/

VERSE 1
ከልዑል ዘንድ ለይቅርታ /2/ ይላካሉ
ከልዑል/2/
717.ይቀልል
ይቀልል ሩጸቶሙ//2/

VERSE 2
አም ነፍሳት ሑረቶሙ/ሪ2/', 'kelዑl
175. wetu mikaiel
wetu mikaiel ኃyl lዑl wetu lዑl
menber /2/

VERSE 1
kelዑl zend leyqrta /2/ ylakalu
kelዑl/2/
717.yqell
yqell rutsetomu//2/

VERSE 2
am nefsat ሑretomu/ri2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=IMFNHJI9phQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=IMFNHJI9phQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ante-slehonk-mikaiel', 'አንተ ስለሆንክ ሚካኤል', 'አንተ ስለሆንክ ሚካኤል', 'ante slehonk mikaiel', 'Ethiopian Orthodox Tewahedo Mezmur - አንተ ስለሆንክ ሚካኤል', 'የአምላክ ባለሟል »
ልመናን ፈጥኖ »
ከአምላክ ያቀርባል »
የዋኀ መልአክ ነህ አዛኝ ለሰው

VERSE 1
ምልጃህ ፈጣን ነው ለምናምነው /2/
አንተ ስለሆንክ ሚካኤል
ያአምላክ ባለሟል »
ልመናን ፈጥኖ »

VERSE 2
ከአምላክ ያቀርባል »
የዋህ መልአክ ነህ አዛኝ ለሰው
ምልጃህ ፈጣን ነው ለምናምነው /2/', 'yeamlak balemual »
lmenan fexno »
keamlak yaqerbal »
yewaኀ melak neh azagn lesew

VERSE 1
mljah fexan new lemnamnew /2/
ante slehonk mikaiel
yaamlak balemual »
lmenan fexno »

VERSE 2
keamlak yaqerbal »
yewah melak neh azagn lesew
mljah fexan new lemnamnew /2/', 'amharic', 'mezmur', 'ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ', 'https://www.youtube.com/watch?v=SqCPH1W8Jw0', 'draft', 'pending', 'https://www.youtube.com/watch?v=SqCPH1W8Jw0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ante-qdus-mikaiel', 'አንተ ቅዱስ ሚካኤል', 'አንተ ቅዱስ ሚካኤል', 'ante qdus mikaiel', 'Ethiopian Orthodox Tewahedo Mezmur - አንተ ቅዱስ ሚካኤል', 'አንተ ቅዱስ ሚካኤል ሊቀ መላእክት የአምላክ
ባለሟል /2/
አገራችንን ጠብቅልን ዛሬም በአማላጅነትህ ፈጥነህ
ድረስላት ለኢትዮጵያ /2/

VERSE 1
18]. ኃያል ሀኃያል
ኃያል /8/ ሰዳዴ ሳጥናኤል
ኃያል ገባሪ ኃይል /2/
ባሕራንን የረዳው ከተላፊለኖስ እጅ ያዳነው/2/

VERSE 2
መልአኩ ሚካኤል ነው /2/
የሞቱን ደብዳቤ የለወጠው
ከዕደ ረበናት /4 ሶስናን ያዳናት
ሚካኤል መልአክ ምሕረት

VERSE 3
ዳያቢሎስን ያዋረድከው በአሳት ሰይፍ
የቀጣኸው 2/ ሚዛንህ ትክክል ነው /2/
ሚካኤል ክብርህ ድንቅ ነው
ምሐዘን በትካዜ ያለሁትን ብላቴና

VERSE 4
አጽናናኝ አረጋጋኝ /2/ ሚካኤል ሊቀ ደብረ ሲና
182. ፈተና ቢገጥማት
ፈተና ቢገጥማት /2/ ቅድስት አፎምያ
ሜካኤል /2/ ብላ ስትጠራ /2/ ፈጥኖ አዳናት

VERSE 5
ከጭንቅ ከመከራ /2/
ነውና እምነቷ /2/ ጽኑ ከምግባራ
ሚካኤል መጣላት /2/ ተአምሩን ሊሠራ
ሚካኤል መጣላት /2/ ለአፎምያ

VERSE 6
ተአምሩን ሊሠራ
ፍጡነ ረድኤት መጣላት /2/ ገስግሶ /2/
አንደ ኃያልነቱ ኃይሉን አፈራርሶ /2/
በመጣበት ፄደ ተመልሶ

VERSE 7
በአምነት ለጠሩህ /2/ ጸንተው በሄህይማኖት', 'ante qdus mikaiel liqe melaekt yeamlak
balemual /2/
agerachnn xebqln zariem beamalajneth fexneh
dreslat leityophya /2/

VERSE 1
18]. ኃyal haኃyal
ኃyal /8/ sedadie saxnaiel
ኃyal gebari ኃyl /2/
baሕrann yeredaw ketelafilenos ej yadanew/2/

VERSE 2
melaku mikaiel new /2/
yemotun debdabie yelewexew
keዕde rebenat /4 sosnan yadanat
mikaiel melak mሕret

VERSE 3
dayabilosn yawaredkew beasat seyf
yeqexaኸw 2/ mizanh tkkl new /2/
mikaiel kbrh dnq new
mሐzen betkazie yalehutn blatiena

VERSE 4
atsnanagn aregagagn /2/ mikaiel liqe debre sina
182. fetena bigexmat
fetena bigexmat /2/ qdst afomya
miekaiel /2/ bla stxera /2/ fexno adanat

VERSE 5
kecnq kemekera /2/
newna emnetua /2/ tsnu kemgbara
mikaiel mexalat /2/ teamrun liሠra
mikaiel mexalat /2/ leafomya

VERSE 6
teamrun liሠra
fxune rediet mexalat /2/ gesgso /2/
ande ኃyalnetu ኃylun aferarso /2/
bemexabet ፄde temelso

VERSE 7
beamnet lexeruh /2/ tsentew behehymanot', 'amharic', 'mezmur', 'ዘማሪ ገብረዮሐንስ ገብረፃድቅ', 'https://www.youtube.com/watch?v=zpM-uDYjHpg', 'draft', 'pending', 'https://www.youtube.com/watch?v=zpM-uDYjHpg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tolo-yderslnal-fxune-rediet-2', 'ቶሎ ይደርስልናል ፍጡነ ረድኤት /2/', 'ቶሎ ይደርስልናል ፍጡነ ረድኤት /2/', 'tolo yderslnal fxune rediet /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ቶሎ ይደርስልናል ፍጡነ ረድኤት /2/', 'ሚካኤል ሊቀ መላእክት
183. ከሚካኤል በቀር
ከሚካኤል በቀር የሚያጽናናኝ የለም
ረዳቴ አርሱ ነው በመከራዬ ቀን /2/

VERSE 1
ቶሎ ይደርስልናል ፍጡነ ረድኤት /2/
ሚካኤል ሊቀ መላእክት
10ዐ66.የኃያላን ኃይል', 'mikaiel liqe melaekt
183. kemikaiel beqer
kemikaiel beqer yemiyatsnanagn yelem
redatie arsu new bemekerayie qen /2/

VERSE 1
tolo yderslnal fxune rediet /2/
mikaiel liqe melaekt
10ዐ66.yeኃyalan ኃyl', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=DOTZ-Tc1Amc', 'draft', 'pending', 'https://www.youtube.com/watch?v=DOTZ-Tc1Amc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-dar-tsyon-mezmur', 'የኅዳር ጽዮን መዝሙር', 'የኅዳር ጽዮን መዝሙር', 'yeኅdar tsyon mezmur', 'Ethiopian Orthodox Tewahedo Mezmur - የኅዳር ጽዮን መዝሙር', '165.አብርሒ ጽዮን
አብርሒ ጽ፳ዮን', '165.abrሒ tsyon
abrሒ ts፳yon', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Fmhr41s-MPI', 'draft', 'pending', 'https://www.youtube.com/watch?v=Fmhr41s-MPI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tabote-gu', 'ታቦተ ሕጉ', 'ታቦተ ሕጉ', 'tabote ሕgu', 'Ethiopian Orthodox Tewahedo Mezmur - ታቦተ ሕጉ', 'ታቦተ ሕጉ ለአግዚአብሔር በካህናት
ሕጽርት ወበመንፈስቅዱስ ክልልት /2/
ንጉሥኪ ጽዮን ኢይትመዋፅ ለፀር  ወኢየኃደጋ
ለሀገር/2/', 'tabote ሕgu leagziabሔr bekahnat
ሕtsrt webemenfesqdus kllt /2/
nguሥki tsyon iytmewaፅ leፀr  weiyeኃdega
lehager/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=5rKNRG945ys', 'draft', 'pending', 'https://www.youtube.com/watch?v=5rKNRG945ys', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ente-krstos', 'እንተ ክርስቶስ', 'እንተ ክርስቶስ', 'ente krstos', 'Ethiopian Orthodox Tewahedo Mezmur - እንተ ክርስቶስ', 'አንተ ክርስቶስ መሠረት ፀሐየ ጽድቅ ያበርህ
ለኪ ፀሐየ ፅድቅ/2/
ለሰማዕት ሥርጉት በስብሐት ሥርጉት
በስብሐት /2/', 'ante krstos meሠret ፀሐye tsdq yaberh
leki ፀሐye ፅdq/2/
lesemaዕt ሥrgut besbሐt ሥrgut
besbሐt /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Fxi88iDlp-U', 'draft', 'pending', 'https://www.youtube.com/watch?v=Fxi88iDlp-U', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abrhi-tsyon-2-tsyon-abrhi-2', 'አብርሂ ጽዮን/2/ ጽዮን አብርሂ/2/', 'አብርሂ ጽዮን/2/ ጽዮን አብርሂ/2/', 'abrhi tsyon/2/ tsyon abrhi/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አብርሂ ጽዮን/2/ ጽዮን አብርሂ/2/', 'አንቁ ዘጳዝዮን ዘጎረየኪ ሰሉሞን
ንጉሥ/ሪ/', 'anqu zephazyon zegoreyeki selumon
nguሥ/ri/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=3oYDowSuYBo', 'draft', 'pending', 'https://www.youtube.com/watch?v=3oYDowSuYBo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemn-2-enmeslat-dngl-maryam-2', 'በምን /2/ እንመስላት ድንግል ማርያም/2/', 'በምን /2/ እንመስላት ድንግል ማርያም/2/', 'bemn /2/ enmeslat dngl maryam/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በምን /2/ እንመስላት ድንግል ማርያም/2/', 'ምሳሌ የላትም /2/ ክብራን የሚመጥን/2/
የሙሴ ጽላት ነሽ የምሕረት ቃል ኪዳን
የያፅቆብ መሰላል የአብርሃም ድንኳን
የብርሃን መውጫ የኖኅ ድንቅ መርከብ

VERSE 1
የመላዕክት አኅት የርኅሩኃን ርግብ/2/', 'msalie yelatm /2/ kbran yemimexn/2/
yemusie tslat nesh yemሕret qal kidan
yeyaፅqob meselal yeabrሃm dnkuan
yebrሃn mewca yenoኅ dnq merkeb

VERSE 1
yemelaዕkt aኅt yerኅruኃn rgb/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Aky10yR_Etw', 'draft', 'pending', 'https://www.youtube.com/watch?v=Aky10yR_Etw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-beberet-tegna-becerq-texeqelele', 'ትርጉም፡- በበረት ተኛ በጨርቅ ተጠቀለለ', 'ትርጉም፡- በበረት ተኛ በጨርቅ ተጠቀለለ', 'trgum፡- beberet tegna becerq texeqelele', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- በበረት ተኛ በጨርቅ ተጠቀለለ', 'የዓለም መድኃኒት/2/ ዛሬ ተወለደ/2/
215.ሖረ ኢየሱስ
ሖረ ኢየሱስ /4/
እምገሊላ /3/ ኀበ ዮሐንስ /2/

VERSE 1
ትርጉም፡ሄደ ኢየሱስ''/2/
ከገሊላ/3/ ወደ ዮሐንስ
216.ምድርኒ ርአይቶ
ምድርኒ ርእይቶ ወአኮቴቶ/2/

VERSE 2
ባሕርኒ ሰገደት ሎቱ/4/', 'yeዓlem medኃnit/2/ zarie tewelede/2/
215.ሖre iyesus
ሖre iyesus /4/
emgelila /3/ ኀbe yoሐns /2/

VERSE 1
trgum፡hede iyesus''/2/
kegelila/3/ wede yoሐns
216.mdrni rayto
mdrni reyto weakotieto/2/

VERSE 2
baሕrni segedet lotu/4/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=pX2WnHoc91k', 'draft', 'pending', 'https://www.youtube.com/watch?v=pX2WnHoc91k', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('werede-weld-6', 'ወረደ ወልድ/6/', 'ወረደ ወልድ/6/', 'werede weld/6/', 'Ethiopian Orthodox Tewahedo Mezmur - ወረደ ወልድ/6/', 'አምሰማያት ውስተ ምጥማቃት/4/', 'amsemayat wste mxmaqat/4/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=KiMdB2QFU1A', 'draft', 'pending', 'https://www.youtube.com/watch?v=KiMdB2QFU1A', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('werede-weld-6', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-lemn-bedel-yesewn-gf-ayto', 'የዓለምን በደል የሰውን ግፍ አይቶ', 'የዓለምን በደል የሰውን ግፍ አይቶ', 'yeዓlemn bedel yesewn gf ayto', 'Ethiopian Orthodox Tewahedo Mezmur - የዓለምን በደል የሰውን ግፍ አይቶ', 'ዘጠና ዘጠነኙን መላእክቱን ትቶ
ጽድቅን ለመፈጸም በደልን አጥፍቶ', 'zexena zexenegnun melaektun tto
tsdqn lemefetsem bedeln axfto', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=EhEUgKQ5hgI', 'draft', 'pending', 'https://www.youtube.com/watch?v=EhEUgKQ5hgI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('ye-lemn-bedel-yesewn-gf-ayto', 'repentance', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlak-tewelede-texemeqe-leegna-2', 'አምላክ ተወለደ ተጠመቀ ለእኛ/2/', 'አምላክ ተወለደ ተጠመቀ ለእኛ/2/', 'amlak tewelede texemeqe leegna/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አምላክ ተወለደ ተጠመቀ ለእኛ/2/', 'የሰማዮች ሰማይ የማይችለው ንጉሥ
ተወለደ ሲጠመቅ እኛ ለመቀደስ
ተራሮች ደንግጠው ዘለሉ እንደፈረስ
ባሕር ተጨነቀች ጠበባት መሬቱ', 'yesemayoch semay yemaychlew nguሥ
tewelede sixemeq egna lemeqedes
teraroch dengxew zelelu endeferes
baሕr teceneqech xebebat merietu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=IUb9SJBhWI4', 'draft', 'pending', 'https://www.youtube.com/watch?v=IUb9SJBhWI4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ledngl-des-ybelsh-alat-2-2', 'ለድንግል ደስ ይበልሽ አላት/2/ ኸኸ/2/', 'ለድንግል ደስ ይበልሽ አላት/2/ ኸኸ/2/', 'ledngl des ybelsh alat/2/ ኸኸ/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ለድንግል ደስ ይበልሽ አላት/2/ ኸኸ/2/', 'ከጌታ ተልኮ ድንግልን ለማብሰር
ክንፋን እያማታ ምስራች ሲናገር
ድምጽን እያሰማ እስከ ሊባኖስ
በፍጥነት ወረደ መልእከት ለማድረስ', 'kegieta telko dngln lemabser
knfan eyamata msrach sinager
dmtsn eyasema eske libanos
befxnet werede meleket lemadres', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=7ecyizZ9rkc', 'draft', 'pending', 'https://www.youtube.com/watch?v=7ecyizZ9rkc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('ledngl-des-ybelsh-alat-2-2', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('melakum-melso-endih-alat-ledngl', 'መልአኩም መልሶ እንዲህ አላት ለድንግል', 'መልአኩም መልሶ እንዲህ አላት ለድንግል', 'melakum melso endih alat ledngl', 'Ethiopian Orthodox Tewahedo Mezmur - መልአኩም መልሶ እንዲህ አላት ለድንግል', 'መንፈስ ቅዱስም በአንቺ ላይ ይመጣል
የልዑል ሀይልም ይጸልልሻል
የእግዚአብሔር አብ ልጅ ከአንቺ ይወለዳል
ለእግዚአብሔር አይሳነውም', 'menfes qdusm beanchi lay ymexal
yelዑl haylm ytsellshal
yeegziabሔr ab lj keanchi yweledal
leegziabሔr aysanewm', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=b7A1wZFxVhQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=b7A1wZFxVhQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wsete-mxmaqat-3-werede-weld', 'ውሰተ ምጥማቃት /3/ ወረደ ወልድ', 'ውሰተ ምጥማቃት /3/ ወረደ ወልድ', 'wsete mxmaqat /3/ werede weld', 'Ethiopian Orthodox Tewahedo Mezmur - ውሰተ ምጥማቃት /3/ ወረደ ወልድ', '258.ተነሱ አዘምር
ተነሥ እንዘምር አልል እአንበል/ሪ/
በመልአኩ በገብርኤል ቃል/ሪ/
ተወልዶልናል ተጠምቆልናል /2/

VERSE 1
አስይ አሰይ የዓለም ቤዛ አማኑኤል /2/
259. ሖረ ኢየሱስ
ሖረ ኢየሱስ እምገሊላ ኀበ ዮሐንስ/2/
ከመ ያጥምቆ /2/ ፈለገ ዮርዳኖስ /2/

VERSE 2
260. በመንፈስ የሐውር
በመንፈስ የሐውር እምኃይል ውስተ ኃይል/ሪ/
ካህን ካህን ወነብይ/2 ዮሐንስ መጥምቅ /2/', '258.tenesu azemr
teneሥ enzemr all eanbel/ri/
bemelaku begebriel qal/ri/
teweldolnal texemqolnal /2/

VERSE 1
asy asey yeዓlem bieza amanuiel /2/
259. ሖre iyesus
ሖre iyesus emgelila ኀbe yoሐns/2/
keme yaxmqo /2/ felege yordanos /2/

VERSE 2
260. bemenfes yeሐwr
bemenfes yeሐwr emኃyl wste ኃyl/ri/
kahn kahn weneby/2 yoሐns mexmq /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=gmOPUv_SNJw', 'draft', 'pending', 'https://www.youtube.com/watch?v=gmOPUv_SNJw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gieta-beyo-ns-asey-esey', 'ጌታ በዮሐንስ አሰይ እሰይ', 'ጌታ በዮሐንስ አሰይ እሰይ', 'gieta beyoሐns asey esey', 'Ethiopian Orthodox Tewahedo Mezmur - ጌታ በዮሐንስ አሰይ እሰይ', 'ሊጠመቅ ሲል ገና አሰይ አሰይ
ወደ ጊላ ሸሸ አሰይ አሰይ
ዮርዳኖስ ፈራና አሰይ አሰይ', 'lixemeq sil gena asey asey
wede gila sheshe asey asey
yordanos ferana asey asey', 'amharic', 'mezmur', 'ዘማሪት ፋንቱ ወልዴ', 'https://www.youtube.com/watch?v=V-kDllN-t8w', 'draft', 'pending', 'https://www.youtube.com/watch?v=V-kDllN-t8w', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ybiela-melak-wegebewati-ni', 'ይቤላ መልአክ ወገበዋቲሃኒ', 'ይቤላ መልአክ ወገበዋቲሃኒ', 'ybiela melak wegebewatiሃni', 'Ethiopian Orthodox Tewahedo Mezmur - ይቤላ መልአክ ወገበዋቲሃኒ', 'ይቤላ መልአክ ሐመልማለ ወርቅ
ይቤላ መልአክ ትበርሂ አምፀሐይ
ይቤላ መልአክ ፕኅተ ምሥራቅ
ይቤላ መልአክ ሰላም ለኪ ድንግል

VERSE 1
ይቤላ መልአክ በአልባሰ ወርቅ', 'ybiela melak ሐmelmale werq
ybiela melak tberhi amፀሐy
ybiela melak pኅte mሥraq
ybiela melak selam leki dngl

VERSE 1
ybiela melak bealbase werq', 'amharic', 'mezmur', 'Zemarit Azeb Kebede', 'https://www.youtube.com/watch?v=DgvRiBRT2UM', 'draft', 'pending', 'https://www.youtube.com/watch?v=DgvRiBRT2UM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('welde-egziab-r-mexa-kelay-kesemay', 'ወልደ እግዚአብሔር መጣ ከላይ ከሰማይ', 'ወልደ እግዚአብሔር መጣ ከላይ ከሰማይ', 'welde egziabሔr mexa kelay kesemay', 'Ethiopian Orthodox Tewahedo Mezmur - ወልደ እግዚአብሔር መጣ ከላይ ከሰማይ', 'ፍቅር አወረደው ከመንበሩ ላይ /2/
አልተጸየፈውም መሆን ከግርግም
ትኅትናው ደነቀኝ የመድኃኔዓለም /2/', 'fqr aweredew kemenberu lay /2/
altetseyefewm mehon kegrgm
tኅtnaw deneqegn yemedኃnieዓlem /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=FKQQwQoI8Bg', 'draft', 'pending', 'https://www.youtube.com/watch?v=FKQQwQoI8Bg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bebietel-m-tewelede-2-amanuiel-2', 'በቤተልሔም ተወለደ /2/ አማኑኤል /2/', 'በቤተልሔም ተወለደ /2/ አማኑኤል /2/', 'bebietelሔm tewelede /2/ amanuiel /2/', 'Ethiopian Orthodox Tewahedo Mezmur - በቤተልሔም ተወለደ /2/ አማኑኤል /2/', 'አምዘርዓ ዳዊት /4/ ተወልደ አማኑኤል/2/
274.የምስራች ተወለደ', 'amzerዓ dawit /4/ tewelde amanuiel/2/
274.yemsrach tewelede', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=7iTt3StHSCM', 'draft', 'pending', 'https://www.youtube.com/watch?v=7iTt3StHSCM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('arko-lemer-wi-tsemey-2-nebiye-l-l', 'አርኮ ለመርዓዊ ትሰመይ/2/ ነቢየ ልዑል', 'አርኮ ለመርዓዊ ትሰመይ/2/ ነቢየ ልዑል', 'arko lemerዓwi tsemey/2/ nebiye lዑl', 'Ethiopian Orthodox Tewahedo Mezmur - አርኮ ለመርዓዊ ትሰመይ/2/ ነቢየ ልዑል', '276.በወንጌሉ ያመናችሁ', '276.bewengielu yamenachhu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=7u2ghdSJPKY', 'draft', 'pending', 'https://www.youtube.com/watch?v=7u2ghdSJPKY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('iyesus-krstos-ywedenal-yxebqenal-2', 'ኢየሱስ ክርስቶስ ይወደናል ይጠብቀናል/2/', 'ኢየሱስ ክርስቶስ ይወደናል ይጠብቀናል/2/', 'iyesus krstos ywedenal yxebqenal/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ኢየሱስ ክርስቶስ ይወደናል ይጠብቀናል/2/', 'በጥምቀቱ ልጅነት ሰጥቶናል/4/', 'bexmqetu ljnet sextonal/4/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=opDGryIcbMs', 'draft', 'pending', 'https://www.youtube.com/watch?v=opDGryIcbMs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('egzio-mer', 'እግዚኦ መርሐ', 'እግዚኦ መርሐ', 'egzio merሐ', 'Ethiopian Orthodox Tewahedo Mezmur - እግዚኦ መርሐ', 'አግዚኡ መርሐ ዮርዳኖስ አብፅሀ/ሪ/
ወበህየ ዮሐንስ ወበህየ ፍጹመ ተፈሥሐ//ሪ/', 'agziu merሐ yordanos abፅha/ri/
webehye yoሐns webehye ftsume tefeሥሐ//ri/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=O0H9nZY2teY', 'draft', 'pending', 'https://www.youtube.com/watch?v=O0H9nZY2teY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-zarie-tewelede-ye-lem-med-nit-2', 'ትርጉም፡- ዛሬ ተወለደ የዓለም መድኃኒት/2/', 'ትርጉም፡- ዛሬ ተወለደ የዓለም መድኃኒት/2/', 'trgum፡- zarie tewelede yeዓlem medኃnit/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- ዛሬ ተወለደ የዓለም መድኃኒት/2/', 'ደስታ ነውና ለሚያምኑት/''4/', 'desta newna lemiyamnut/''4/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=vQTLIdR5ExA', 'draft', 'pending', 'https://www.youtube.com/watch?v=vQTLIdR5ExA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bietekrstiyan-ba-re-xbebat-2', 'ቤተክርስቲያን ባሕረ ጥበባት/2/', 'ቤተክርስቲያን ባሕረ ጥበባት/2/', 'bietekrstiyan baሕre xbebat/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ቤተክርስቲያን ባሕረ ጥበባት/2/', 'አትመረመርም /2/ እጅግ ጥልቅ ናተት/2/
በሥጋዊ ጥበብ ለማወቅ ቢቃጣ', 'atmeremerm /2/ ejg xlq natet/2/
beሥgawi xbeb lemaweq biqaxa', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=WoXlP8mIRs8', 'draft', 'pending', 'https://www.youtube.com/watch?v=WoXlP8mIRs8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('aman-aman-melaekt-ykiellwa-2', 'አማን አማን መላእክት ይኬልልዋ/2/', 'አማን አማን መላእክት ይኬልልዋ/2/', 'aman aman melaekt ykiellwa/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አማን አማን መላእክት ይኬልልዋ/2/', 'ኸኸ በሚያስደንቅ ግርማ
የልዑል ኃይል የጋረዳት/2/
በእውነት /2/ መላእክት አመሰገኗት/2/', 'ኸኸ bemiyasdenq grma
yelዑl ኃyl yegaredat/2/
beewnet /2/ melaekt amesegenuat/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ytbJSPJN1BA', 'draft', 'pending', 'https://www.youtube.com/watch?v=ytbJSPJN1BA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beqana-zegelila-2', 'በቃና ዘገሊላ /2/', 'በቃና ዘገሊላ /2/', 'beqana zegelila /2/', 'Ethiopian Orthodox Tewahedo Mezmur - በቃና ዘገሊላ /2/', 'በቃና ዘገሊላ /2/ ከብካብ ኮነ /4/', 'beqana zegelila /2/ kebkab kone /4/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=KfBVSmc36Ik', 'draft', 'pending', 'https://www.youtube.com/watch?v=KfBVSmc36Ik', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('enamesgnash-yeamlak-enat-bezmarie-2', 'እናመስግናሽ የአምላክ እናት በዝማሬ /2/', 'እናመስግናሽ የአምላክ እናት በዝማሬ /2/', 'enamesgnash yeamlak enat bezmarie /2/', 'Ethiopian Orthodox Tewahedo Mezmur - እናመስግናሽ የአምላክ እናት በዝማሬ /2/', 'የዓለም ቤዛ ነውና የማኅፀንሽ ፍሬ/4/', 'yeዓlem bieza newna yemaኅፀnsh frie/4/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=HUazMrIm_9o', 'draft', 'pending', 'https://www.youtube.com/watch?v=HUazMrIm_9o', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('enamesgnash-yeamlak-enat-bezmarie-2', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yegietachn-enat-maryam-dngl-hoy-anchi-nesh', 'የጌታችን እናት ማርያም ድንግል ሆይ አንቺ ነሽ', 'የጌታችን እናት ማርያም ድንግል ሆይ አንቺ ነሽ', 'yegietachn enat maryam dngl hoy anchi nesh', 'Ethiopian Orthodox Tewahedo Mezmur - የጌታችን እናት ማርያም ድንግል ሆይ አንቺ ነሽ', 'የጌታችን እናት ማርያም ድንግል ሆይ አንቺ ነሽ', 'yegietachn enat maryam dngl hoy anchi nesh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=jm5eh01ZeYc', 'draft', 'pending', 'https://www.youtube.com/watch?v=jm5eh01ZeYc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yegietachn-enat-maryam-nts-t-hoy-anchi-nesh', 'የጌታችን እናት ማርያም ንጽሕት ሆይ አንቺ ነሽ', 'የጌታችን እናት ማርያም ንጽሕት ሆይ አንቺ ነሽ', 'yegietachn enat maryam ntsሕt hoy anchi nesh', 'Ethiopian Orthodox Tewahedo Mezmur - የጌታችን እናት ማርያም ንጽሕት ሆይ አንቺ ነሽ', 'ድንግልናሽ ሳይለወጥ ወልድን የወለድሽ /፳/
የጌታችን እናት ማርያም ንጽሕት ሆይ አንቺ ነሽ', 'dnglnash saylewex weldn yeweledsh /፳/
yegietachn enat maryam ntsሕt hoy anchi nesh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=MPAN8__XczY', 'draft', 'pending', 'https://www.youtube.com/watch?v=MPAN8__XczY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('teamre-wemenkre-gebre-med-nine-2', 'ተአምረ ወመንክረ ገብረ መድኃኒነ/2/', 'ተአምረ ወመንክረ ገብረ መድኃኒነ/2/', 'teamre wemenkre gebre medኃnine/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ተአምረ ወመንክረ ገብረ መድኃኒነ/2/', 'ተአምረ ወመንክረ ገብረ መድኃኒነ/2/
በቃና ዘገሊላ ዘገሊላ ከብከብ ኮነ/4
አሐዱ
አሐዱ አከል ገብረ ሥላሴ ወመርዓቱ ወለተ', 'teamre wemenkre gebre medኃnine/2/
beqana zegelila zegelila kebkeb kone/4
aሐdu
aሐdu akel gebre ሥlasie wemerዓtu welete', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=GNYNwlpZCs0', 'draft', 'pending', 'https://www.youtube.com/watch?v=GNYNwlpZCs0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('teamre-wemenkre-gebre-med-nine-2', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ganm-nesto-keenatachn-2', 'ሥጋንም ነስቶ ከእናታችን/2/', 'ሥጋንም ነስቶ ከእናታችን/2/', 'ሥganm nesto keenatachn/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሥጋንም ነስቶ ከእናታችን/2/', 'ኃጢአታችንን ሊያስወግድልን', 'ኃxiatachnn liyaswegdln', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=WtvTBgch0G0', 'draft', 'pending', 'https://www.youtube.com/watch?v=WtvTBgch0G0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('anchi-yordanos-mngna-tadelsh-2-2', 'አንቺ ዮርዳኖስ ምንኛ ታደልሽ/2/(2)', 'አንቺ ዮርዳኖስ ምንኛ ታደልሽ/2/(2)', 'anchi yordanos mngna tadelsh/2/(2)', 'Ethiopian Orthodox Tewahedo Mezmur - አንቺ ዮርዳኖስ ምንኛ ታደልሽ/2/(2)', 'የአግዚአብሔር መንፈስ ከለይ ወርዶብሽ
የዓለም መድኃኒት ተጠመቀብሽ /2/
295.ዮሐንስ አጥምቆ', 'yeagziabሔr menfes keley werdobsh
yeዓlem medኃnit texemeqebsh /2/
295.yoሐns axmqo', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=-gZU2E48mf8', 'draft', 'pending', 'https://www.youtube.com/watch?v=-gZU2E48mf8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('asey-esey-tetemeqe-2', 'አሰይ እሰይ', 'አሰይ እሰይ', 'asey esey tetemeqe/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አሰይ እሰይ', 'ከሰማየ ሰማይ ወረደ/ሪ/
በቅዱስ ዮሐንስ ተጠመቀ
አብም መሰከረ አሰይ አሰይ
ቃሉን አላበየም እሰይ አሰይ

VERSE 1
የምወደው ልጄ አሰይ እሰይ
ይሄ ነው እያለ አሰይ እሰይ
አሰይ እሰይ
አሰይ እሰይ -------------

VERSE 2
እግዚአብሔር አብ ላከ አሰይ እሰይ
አንድያ ልጁን እሰይ እሰይ
አሰይ እሰይ ተወለደ /2/
ከሰማየ ሰማያት ወረደ

VERSE 3
ከድንግል ማርያም ተወለደ
አሱ ባይወለድ አሰይ አሰይ ቸሩ አባታችን አሰይ
አሰይ
መች ትገኝ ነበር አሰይ እሰይ ገነት ምድራችን

VERSE 4
አሰይ እሰይ
አሰይ እሰይ
በጨለማ ጉዞ አሰይ አሰይ እንዲያ ሲሰላቹ አሰይ
አሰይ

VERSE 5
አሰይ እሰይ
ወገኖቹን ሊያድን አሰይ አሰይ ከኃጢያት ቁራኛ
አሰይ እሰይ
አሰይ እሰይ

VERSE 6
አርሱ ወዷልና እሰይ አሰይ እንዲሁ ዓለሙን
አሰይ እሰይ', 'kesemaye semay werede/ri/
beqdus yoሐns texemeqe
abm mesekere asey asey
qalun alabeyem esey asey

VERSE 1
yemwedew ljie asey esey
yhe new eyale asey esey
asey esey
asey esey -------------

VERSE 2
egziabሔr ab lake asey esey
andya ljun esey esey
asey esey tewelede /2/
kesemaye semayat werede

VERSE 3
kedngl maryam tewelede
asu bayweled asey asey cheru abatachn asey
asey
mech tgegn neber asey esey genet mdrachn

VERSE 4
asey esey
asey esey
becelema guzo asey asey endiya siselachu asey
asey

VERSE 5
asey esey
wegenochun liyadn asey asey keኃxiyat quragna
asey esey
asey esey

VERSE 6
arsu wedualna esey asey endihu ዓlemun
asey esey', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=8AVG1A4n8VU', 'draft', 'pending', 'https://www.youtube.com/watch?v=8AVG1A4n8VU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('seba-segel-mexu-lisegdu-bemulu-3', 'ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ', 'ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ', 'seba segel mexu lisegdu bemulu/:3/', 'Ethiopian Orthodox Tewahedo Mezmur - ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ', 'አስራኤል ንጉሥ ወዴት ነው እያሉ
ሰብአ ሰገል መጡ ይዘው እጅ መንሻ /3/
ወርቅ አጣን ከርቤውን ለማርያም እጅ መንሻ/3/
ሕፃናት እንሂድ ከልደቱ ቤት/3/

VERSE 1
ውኃው ሆኗልና ማርና ወተት/3/
251.አንቺ አንቺ
አንቺ አንቺ ቤተልሔም የይሁዳ መሬት
ባንቺ ተወለደ የአለም መድኃኒት /2/

VERSE 2
አዳም ክብር ሲሻ ቤተልሔም
ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ
ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ /2/
የአስራኤል ንጉሥ ወዴት ነው እያሉ /2/

VERSE 3
አጅ መንሻውን ሰጡት እንደየሥርዓቱ /2/
አጣኑን ለክህነት ወርቁን ለመንግሥቱ /2/', 'asraiel nguሥ wediet new eyalu
seba segel mexu yzew ej mensha /3/
werq axan kerbiewn lemaryam ej mensha/3/
ሕፃnat enhid keldetu biet/3/

VERSE 1
wኃw honualna marna wetet/3/
251.anchi anchi
anchi anchi bietelሔm yeyhuda meriet
banchi tewelede yealem medኃnit /2/

VERSE 2
adam kbr sisha bietelሔm
seba segel mexu lisegdu bemulu
seba segel mexu lisegdu bemulu /2/
yeasraiel nguሥ wediet new eyalu /2/

VERSE 3
aj menshawn sexut endeyeሥrዓtu /2/
axanun lekhnet werqun lemengሥtu /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=W_mBb6SQywQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=W_mBb6SQywQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('maryam-3-des-ybelsh-begebriel-selamta-2', 'ማርያም/3/ ደስ ይበልሽ በገብርኤል ሰላምታ/2/', 'ማርያም/3/ ደስ ይበልሽ በገብርኤል ሰላምታ/2/', 'maryam/3/ des ybelsh begebriel selamta/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ማርያም/3/ ደስ ይበልሽ በገብርኤል ሰላምታ/2/', 'ባንቺ ስላደረ የዓለም ሁሉ ጌታ /2/', 'banchi sladere yeዓlem hulu gieta /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=QU8dUYP1Ou0', 'draft', 'pending', 'https://www.youtube.com/watch?v=QU8dUYP1Ou0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeamlak-chernetu-feqadu-sihon', 'የአምላክ ቸርነቱ ፈቃዱ ሲሆን', 'የአምላክ ቸርነቱ ፈቃዱ ሲሆን', 'yeamlak chernetu feqadu sihon', 'Ethiopian Orthodox Tewahedo Mezmur - የአምላክ ቸርነቱ ፈቃዱ ሲሆን', 'የአምላክ ቸርነቱ ፈቃዱ ሲሆን
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማ ተገፎ ሲወጣ ብርዛን', 'yeamlak chernetu feqadu sihon
yeamlak chernetu feqadu sihon
celema tegefo siwexa brzan', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=h5fvUY5OGik', 'draft', 'pending', 'https://www.youtube.com/watch?v=h5fvUY5OGik', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-teqemxa-bebiete-meqdes', 'ድንግል ተቀምጣ በቤተ መቅደስ', 'ድንግል ተቀምጣ በቤተ መቅደስ', 'dngl teqemxa bebiete meqdes', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል ተቀምጣ በቤተ መቅደስ', 'ሐር ወር አስማምታ ስትፈትል ንግሥት
ድንግል ተቀምጣ በቤተ መቅደስ
ሐር ወርቅ አስማምታ ስትፈትል ንግሥት', 'ሐr wer asmamta stfetl ngሥt
dngl teqemxa bebiete meqdes
ሐr werq asmamta stfetl ngሥt', 'amharic', 'mezmur', 'ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ', 'https://www.youtube.com/watch?v=rNaRCxXuV50', 'draft', 'pending', 'https://www.youtube.com/watch?v=rNaRCxXuV50', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gebriel-2-zienawi-dis', 'ገብርኤል /2/ ዜናዊ ሐዲስ', 'ገብርኤል /2/ ዜናዊ ሐዲስ', 'gebriel /2/ zienawi ሐdis', 'Ethiopian Orthodox Tewahedo Mezmur - ገብርኤል /2/ ዜናዊ ሐዲስ', 'የአምላክን መወለድ ሥጋ በመልበስ
ገብርኤል /2/ ዜናዊ ሐዲስ
የአምላክ መወለድ ሥጋ በመልበስ', 'yeamlakn meweled ሥga bemelbes
gebriel /2/ zienawi ሐdis
yeamlak meweled ሥga bemelbes', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=h0kog2lD3LY', 'draft', 'pending', 'https://www.youtube.com/watch?v=h0kog2lD3LY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('andit-blatiena-yea-ra-amst-met-lj', 'አንዲት ብላቴና የአሥራ አምስት ዓመት ልጅ', 'አንዲት ብላቴና የአሥራ አምስት ዓመት ልጅ', 'andit blatiena yeaሥra amst ዓmet lj', 'Ethiopian Orthodox Tewahedo Mezmur - አንዲት ብላቴና የአሥራ አምስት ዓመት ልጅ', 'ጌታን ወለደችው በመላእክት አዋጅ', 'gietan weledechw bemelaekt awaj', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ycsaSon1kNA', 'draft', 'pending', 'https://www.youtube.com/watch?v=ycsaSon1kNA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gizie-erefta', 'ጊዜ እረፍታ', 'ጊዜ እረፍታ', 'gizie erefta', 'Ethiopian Orthodox Tewahedo Mezmur - ጊዜ እረፍታ', 'ጊዜ አረፍታ ለድንግል ለማርያም/2/
በልፅልና ወረደ አግዚአብሔር
በልዕልና ወረደ አግዚአብሔር /2/
ሞትሰ', 'gizie arefta ledngl lemaryam/2/
belፅlna werede agziabሔr
belዕlna werede agziabሔr /2/
motse', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=o5ADZ66edQ0', 'draft', 'pending', 'https://www.youtube.com/watch?v=o5ADZ66edQ0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('motse-lemewati-ydelu-2', 'ሞትሰ ለመዋቲ ይደሉ/2/', 'ሞትሰ ለመዋቲ ይደሉ/2/', 'motse lemewati ydelu/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሞትሰ ለመዋቲ ይደሉ/2/', 'ሞታ ለማርያም የአጽብ ለኩሉ/4/', 'mota lemaryam yeatsb lekulu/4/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=qloXy31QYGU', 'draft', 'pending', 'https://www.youtube.com/watch?v=qloXy31QYGU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amuamuatsh-bexr-ne-sie-meqabr-dngl', 'አሟሟትሽ በጥር ነሐሴ መቃብር ድንግል', 'አሟሟትሽ በጥር ነሐሴ መቃብር ድንግል', 'amuamuatsh bexr neሐsie meqabr dngl', 'Ethiopian Orthodox Tewahedo Mezmur - አሟሟትሽ በጥር ነሐሴ መቃብር ድንግል', 'የአንቺስ ለብቻ ነው ትንሣኤሽ ሲነገር ድንግል
ሥጋሽ በምድር ላይ የታለ እንደ ፍጡር
አርጓል ወደ ሰማይ ከክርስቶስ መንበር', 'yeanchis lebcha new tnሣiesh sineger dngl
ሥgash bemdr lay yetale ende fxur
argual wede semay kekrstos menber', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=8eyF4fd8pKI', 'draft', 'pending', 'https://www.youtube.com/watch?v=8eyF4fd8pKI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tn-ieshn-shtew-gra-sigebachew-dngl', 'ትንሣኤሽን ሽተው ግራ ሲገባቸው ድንግል', 'ትንሣኤሽን ሽተው ግራ ሲገባቸው ድንግል', 'tnሣieshn shtew gra sigebachew dngl', 'Ethiopian Orthodox Tewahedo Mezmur - ትንሣኤሽን ሽተው ግራ ሲገባቸው ድንግል', 'ሐዋርያት ጾመው ተገለጥልሻላቸው ድንግል
ተቀብራ አልቀረችው በምድር ከደጂ ድንግል
ወደላይ አረገች እሷም አንደልጂ ድንግል', 'ሐwaryat tsomew tegelexlshalachew dngl
teqebra alqerechw bemdr kedeji dngl
wedelay aregech esuam andelji dngl', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=E3TNyOLM36I', 'draft', 'pending', 'https://www.youtube.com/watch?v=E3TNyOLM36I', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yezemene-mer-wi-mezmur', 'የዘመነ መርዓዊ መዝሙር', 'የዘመነ መርዓዊ መዝሙር', 'yezemene merዓwi mezmur', 'Ethiopian Orthodox Tewahedo Mezmur - የዘመነ መርዓዊ መዝሙር', '315. መጽአ ዘመጽአ
መጽአ ዘመጽአ እአምላዕሉ/2/
መርዓዊ መጽአ /2/ተቀበሎ ጻኡ ተቀበሎ/2/
316. ደስ አላት ቤ/ክ

VERSE 1
ደስ አላት ቤ/ክ በጣም ደስ አላት /2/
ሙሽሪት ሙሽራው ልጆቿ/2/
በተክሊል በቁርባን ተዋሐዱላት /2/
317. ህገ ስብአናሁ

VERSE 2
ሕገ ስብዕናሁ ዐቀበ /2/በተደንግሎ/2/
በወንጌል ዘሀሎ/2/ወፈጸመ በወንጌል ዘሀሎ/2/
318. መርዓዊ ሰማያዊ
መርዓዊ ሰማያዊ /2/ ለእመ ገብረ በዓለ/2/

VERSE 3
ይኑሩ በሰላም /3/ ጸንተው ዘለዓለም/2/
ደናግል ተነሥ ያዙ መብራቱን
ሙሽሪው ደረሰ አጉል አንዳንሆን', '315. metsa zemetsa
metsa zemetsa eamlaዕlu/2/
merዓwi metsa /2/teqebelo tsau teqebelo/2/
316. des alat bie/k

VERSE 1
des alat bie/k bexam des alat /2/
mushrit mushraw ljoቿ/2/
beteklil bequrban tewaሐdulat /2/
317. hge sbanahu

VERSE 2
ሕge sbዕnahu ዐqebe /2/betedenglo/2/
bewengiel zehalo/2/wefetseme bewengiel zehalo/2/
318. merዓwi semayawi
merዓwi semayawi /2/ leeme gebre beዓle/2/

VERSE 3
ynuru beselam /3/ tsentew zeleዓlem/2/
denagl teneሥ yazu mebratun
mushriw derese agul andanhon', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=EUCptT6ISiU', 'draft', 'pending', 'https://www.youtube.com/watch?v=EUCptT6ISiU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yedkam-wagachew-2', 'የድካም ዋጋቸው /2/', 'የድካም ዋጋቸው /2/', 'yedkam wagachew /2/', 'Ethiopian Orthodox Tewahedo Mezmur - የድካም ዋጋቸው /2/', 'ብርሃኑ ያበራል ለተከታያቸው', 'brሃnu yaberal leteketayachew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=asGo7avlukE', 'draft', 'pending', 'https://www.youtube.com/watch?v=asGo7avlukE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yemushraw-ywet-melkam-endihon', 'የሙሽራው ሕይወት መልካም እንዲሆን', 'የሙሽራው ሕይወት መልካም እንዲሆን', 'yemushraw ሕywet melkam endihon', 'Ethiopian Orthodox Tewahedo Mezmur - የሙሽራው ሕይወት መልካም እንዲሆን', 'ካህኑ ይባርኳት ቡርክት ሰው ትሁን', 'kahnu ybarkuat burkt sew thun', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=pp-_SCDnPQA', 'draft', 'pending', 'https://www.youtube.com/watch?v=pp-_SCDnPQA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlakie-gulbetie-ylie-memekiyayie', 'አምላኬ ጉልበቴ ኃይሌ መመኪያዬ', 'አምላኬ ጉልበቴ ኃይሌ መመኪያዬ', 'amlakie gulbetie ኃylie memekiyayie', 'Ethiopian Orthodox Tewahedo Mezmur - አምላኬ ጉልበቴ ኃይሌ መመኪያዬ', 'ጠላት ማሳፈሪያ የእምነት ጋሻዬ
አንደማትተወኝ አሁን አውቄአለሁ
ካለኝ ነገር ይልቅ በአንተ ታምኛለሁ
አምላኬ ጉልበቴ ኃይሌ መመኪያዬ

VERSE 1
ጠላት ማሳፈሪያ የእምነት ጋሻዬ
አንደማትተወኝ አሁን አውቄአለሁ
ካለኝ ነገር ይልቅ በአንተ ታምኛለሁ', 'xelat masaferiya yeemnet gashayie
andemattewegn ahun awqiealehu
kalegn neger ylq beante tamgnalehu
amlakie gulbetie ኃylie memekiyayie

VERSE 1
xelat masaferiya yeemnet gashayie
andemattewegn ahun awqiealehu
kalegn neger ylq beante tamgnalehu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=EvUl-z6e0P0', 'draft', 'pending', 'https://www.youtube.com/watch?v=EvUl-z6e0P0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beqenm-belietm-hulie-lemiyabera', 'በቀንም በሌትም ሁሌ ለሚያበራ', 'በቀንም በሌትም ሁሌ ለሚያበራ', 'beqenm belietm hulie lemiyabera', 'Ethiopian Orthodox Tewahedo Mezmur - በቀንም በሌትም ሁሌ ለሚያበራ', 'መንክር ለባሕርይ ዕፁብ ለአንተ ሥራ
በቀንም በሌትም ሁሌ ለሚያበራ
መንክር ለባሕርይህ እጹብ ለአንተ ሥራ', 'menkr lebaሕry ዕፁb leante ሥra
beqenm belietm hulie lemiyabera
menkr lebaሕryh etsub leante ሥra', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=W8Uw2RBqkoI', 'draft', 'pending', 'https://www.youtube.com/watch?v=W8Uw2RBqkoI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dnq-new-bexam', 'ድንቅ ነው በጣም', 'ድንቅ ነው በጣም', 'dnq new bexam', 'Ethiopian Orthodox Tewahedo Mezmur - ድንቅ ነው በጣም', 'ድንቅ ነው በጣም ድንቅ ነው /2/
በሠርጋችሁ ዕለት ተገኘ መድኃኔዓለም
በሠርጋችሁ ዕለት ተገኘች ድንግል ማርያም', 'dnq new bexam dnq new /2/
beሠrgachhu ዕlet tegegne medኃnieዓlem
beሠrgachhu ዕlet tegegnech dngl maryam', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=9d69WwZLGd4', 'draft', 'pending', 'https://www.youtube.com/watch?v=9d69WwZLGd4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('and-akal-honewal-amlak-axamroachew', 'አንድ አካል ሆነዋል አምላክ አጣምሮአቸው', 'አንድ አካል ሆነዋል አምላክ አጣምሮአቸው', 'and akal honewal amlak axamroachew', 'Ethiopian Orthodox Tewahedo Mezmur - አንድ አካል ሆነዋል አምላክ አጣምሮአቸው', 'በምንም ምክንያት ማንም አይለያቸው
በጣም ይወዳታል ባል ክብርት ሚስቱን
ስለ አርስዋ አሳልፎ ይሰጣል ነፍሱን', 'bemnm mknyat manm ayleyachew
bexam ywedatal bal kbrt mistun
sle arswa asalfo ysexal nefsun', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=BDPdeEt5vjM', 'draft', 'pending', 'https://www.youtube.com/watch?v=BDPdeEt5vjM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qana-zegelila', 'ቃና ዘገሊላ', 'ቃና ዘገሊላ', 'qana zegelila', 'Ethiopian Orthodox Tewahedo Mezmur - ቃና ዘገሊላ', 'ቃና ዘገሊላ/2/በዚያ በሠርግ ቤት
ተገኝተሻል ድንግል ከልጅሽ ጋራ
ተገኝተፃል ጌታ ከእናትህ ጋራ
አድምተኞች ሞልተው የጋበዙት', 'qana zegelila/2/beziya beሠrg biet
tegegnteshal dngl keljsh gara
tegegnteፃl gieta keenath gara
admtegnoch moltew yegabezut', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=nphMfIRlz_s', 'draft', 'pending', 'https://www.youtube.com/watch?v=nphMfIRlz_s', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sibelu-sixexu-weynu-alqobet', 'ሲበሉ ሲጠጡ ወይኑ አልቆበት', 'ሲበሉ ሲጠጡ ወይኑ አልቆበት', 'sibelu sixexu weynu alqobet', 'Ethiopian Orthodox Tewahedo Mezmur - ሲበሉ ሲጠጡ ወይኑ አልቆበት', 'ድንግል እናታችን ቤዛዊት ዓለም
አንቺ ደረስሽለት ሆነሽው አማላጅ', 'dngl enatachn biezawit ዓlem
anchi deresshlet honeshw amalaj', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ULG-pMeB2aY', 'draft', 'pending', 'https://www.youtube.com/watch?v=ULG-pMeB2aY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('hulu-ychal-l-weynun-mulalachew', 'ሁሉ ይቻልሃል ወይኑን ሙላላቸው', 'ሁሉ ይቻልሃል ወይኑን ሙላላቸው', 'hulu ychalሃl weynun mulalachew', 'Ethiopian Orthodox Tewahedo Mezmur - ሁሉ ይቻልሃል ወይኑን ሙላላቸው', 'ማድጋው ባዶ ነው ብለሽ የተናገርሽ
ጌታን ያሳሰብሽው አመቤታችን ነሽ', 'madgaw bado new blesh yetenagersh
gietan yasasebshw amebietachn nesh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=h4ylQ_SyMnM', 'draft', 'pending', 'https://www.youtube.com/watch?v=h4ylQ_SyMnM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('w-w-telewxo-yeweyn-xej-sihon', 'ውኃው ተለውጦ የወይን ጠጅ ሲሆን', 'ውኃው ተለውጦ የወይን ጠጅ ሲሆን', 'wኃw telewxo yeweyn xej sihon', 'Ethiopian Orthodox Tewahedo Mezmur - ውኃው ተለውጦ የወይን ጠጅ ሲሆን', 'በቃና ገሊላ ሁላችን አየን
አግዚአብሔር ከኖረ በመካከላችን
ሁሉ ይሰጠናል ይህን መሰል ወይን
326. አጅቡት በዕልልታ

VERSE 1
አጅቡት በዕልልታ ሲመጣ ሙሽራው
ፍጹም የሚያስደስት የሠርጉ ዕለት ነው
ዘመዶቹ ሁሉ ተቀበሉት ውጡ
የሙሽራው መምጫ አሁን ነው ሰዓቱ

VERSE 2
ፅልል /2/ እንዘምር በዕልልታ
ይህን ላደረገ ለሠራዊት ጌታ
ሁሉንም በጊዜው ይፈጽማልና
ይኸው አበቃቸው ለዚህ መልካም ዜና

VERSE 3
ሙሽሪት ተደሰች ዝምታው ምንድነው
የዳግም ልደትሽ የሠርግሽ ዕለት ነው
አዳም ጐንሽ ቆሞ ሔዋን ሆይ ሲልሽ
መንፈሳዊ ሐሴት ይሙላ በልብሽ', 'beqana gelila hulachn ayen
agziabሔr kenore bemekakelachn
hulu ysexenal yhn mesel weyn
326. ajbut beዕllta

VERSE 1
ajbut beዕllta simexa mushraw
ftsum yemiyasdest yeሠrgu ዕlet new
zemedochu hulu teqebelut wxu
yemushraw memca ahun new seዓtu

VERSE 2
ፅll /2/ enzemr beዕllta
yhn laderege leሠrawit gieta
hulunm begiziew yfetsmalna
yኸw abeqachew lezih melkam ziena

VERSE 3
mushrit tedesech zmtaw mndnew
yedagm ldetsh yeሠrgsh ዕlet new
adam ጐnsh qomo ሔwan hoy silsh
menfesawi ሐsiet ymula belbsh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=iDedOLRxrfY', 'draft', 'pending', 'https://www.youtube.com/watch?v=iDedOLRxrfY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeegnama-mushra-enkuan-des-alesh', 'የእኛማ ሙሽራ እንኳን ደስ አለሽ', 'የእኛማ ሙሽራ እንኳን ደስ አለሽ', 'yeegnama mushra enkuan des alesh', 'Ethiopian Orthodox Tewahedo Mezmur - የእኛማ ሙሽራ እንኳን ደስ አለሽ', 'አግዚአብሔር ይመስገን እኛም ደስ ብሉናል
በቤተክርስቲያን ሠርጋችሁ ውብ ሆኖአል', 'agziabሔr ymesgen egnam des blunal
bebietekrstiyan ሠrgachhu wb honoal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=P_Godc3AD9g', 'draft', 'pending', 'https://www.youtube.com/watch?v=P_Godc3AD9g', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('andenefsh-argeh-endtwedat', 'አንደነፍስህ አርገህ እንድትወዳት', 'አንደነፍስህ አርገህ እንድትወዳት', 'andenefsh argeh endtwedat', 'Ethiopian Orthodox Tewahedo Mezmur - አንደነፍስህ አርገህ እንድትወዳት', 'አደራ ሰጠንህ በጌታችን ፊት
አእንድታስቢለት አንቺም ለአካልሽ
አደራ ትላለች ወንጌል እናትሽ', 'adera sexenh begietachn fit
aendtasbilet anchim leakalsh
adera tlalech wengiel enatsh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=XQRaHF8TdpQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=XQRaHF8TdpQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-rgachn-let-endtbarken', 'በሠርጋችን ዕለት እንድትባርከን', 'በሠርጋችን ዕለት እንድትባርከን', 'beሠrgachn ዕlet endtbarken', 'Ethiopian Orthodox Tewahedo Mezmur - በሠርጋችን ዕለት እንድትባርከን', 'ጌታ ጠርተንፃሃል በእምነት ሆነን
ከእናትህ ጋራ ከእመቤታችን
ከመላእክትህ ጋር ና በሠርጋችን
ከሐዋርያት ጋር ና በሠርጋችን

VERSE 1
ከወዳጆችህ ጋር ና በሠርጋችን
በገሊላ መንደር አንደተገኘህ
ና በእኛ ድንኳንም ጌታ ሰንጠራህ
የጥሪ ወረቀት ልከናል እንዳትቀር

VERSE 2
አንተነህ ክብራችን የቤታችን ፍቅር
ነይ ከልጅሽ ጋራ እመቤታችን
አንድታሟይልን የጎደለውን
ንገሪው ለልጅሽ ባዶው አንዲሞላ

VERSE 3
በረከት የእርሱ ነው ቤታችንን ይሙላ', 'gieta xertenፃሃl beemnet honen
keenath gara keemebietachn
kemelaekth gar na beሠrgachn
keሐwaryat gar na beሠrgachn

VERSE 1
kewedajochh gar na beሠrgachn
begelila mender andetegegneh
na beegna dnkuanm gieta senxerah
yexri wereqet lkenal endatqer

VERSE 2
anteneh kbrachn yebietachn fqr
ney keljsh gara emebietachn
andtamuayln yegodelewn
ngeriw leljsh badow andimola

VERSE 3
bereket yeersu new bietachnn ymula', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=4asqsSGzgNM', 'draft', 'pending', 'https://www.youtube.com/watch?v=4asqsSGzgNM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wendna-siet-adr-endefexerachew', 'ወንድና ሴት አድርጐ እንደፈጠራቸው', 'ወንድና ሴት አድርጐ እንደፈጠራቸው', 'wendna siet adrጐ endefexerachew', 'Ethiopian Orthodox Tewahedo Mezmur - ወንድና ሴት አድርጐ እንደፈጠራቸው', 'ኋላም ለኑሮአቸው ጋብቻን ሰጣቸው
አንዴ ከተጋቡ አንድ ሥጋ ናቸው
ከእንግዲህ ወደፊት ይጸናል ፍቅራቸው
ደስ ይበለን ሙሽሪት ሙሽራው/2/

VERSE 1
ወንድና ሴት አድርጐ እንደፈጠራቸው
በኋላም በቃሉ አንድ አደረጋቸው
አናትና አባቱን የአዳም ልጅ ይተዋል
ከሚስቱ ጋር በሰላም በአንድ ይተባበራል', 'hualam lenuroachew gabchan sexachew
andie ketegabu and ሥga nachew
keengdih wedefit ytsenal fqrachew
des ybelen mushrit mushraw/2/

VERSE 1
wendna siet adrጐ endefexerachew
behualam beqalu and aderegachew
anatna abatun yeadam lj ytewal
kemistu gar beselam beand ytebaberal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=0KJ1P5RHQtQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=0KJ1P5RHQtQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('des-alew-gieta', 'ደስ አለው ጌታ', 'ደስ አለው ጌታ', 'des alew gieta', 'Ethiopian Orthodox Tewahedo Mezmur - ደስ አለው ጌታ', 'ደስ አለው ጌታ በሙሽሮች ደስ አለው ጌታ/2/
በቅዱስ ቁርባን ተወስነው ደስ አለው ጌታ/2/
ደስ አላት ድንግል በሙሽሮች ደስ አላት ድንግል
በቅዱስ ቁርባን ተወስነው ደስ አላት ድንግል /2/

VERSE 1
335. መጽዓ መርዓዊ
መጽዓ መርዓዊ ፍሥሐ ለኩሉ/2/
በሰላም ጻኡ ተቀበሉ/2/
አንድ ያደረገውን ጌታችን በቃሉ/2/

VERSE 2
ሊለየው አየችልም የሰው ልጅ በኃይሉ/2/
ሙሽሪት ሙሽራው የሃይማኖት ፍሬ/2/
በቅዱስ ጋብቻ አንድ ሆኑ ዛሬ /2/', 'des alew gieta bemushroch des alew gieta/2/
beqdus qurban tewesnew des alew gieta/2/
des alat dngl bemushroch des alat dngl
/2/

VERSE 1
/2/
beqdus qurban tewesnew des alat dngl /2/
335. metsዓ merዓwi
metsዓ merዓwi fሥሐ lekulu/2/

VERSE 2
beselam tsau teqebelu/2/
and yaderegewn gietachn beqalu/2/
lileyew ayechlm yesew lj beኃylu/2/
mushrit mushraw yeሃymanot frie/2/

VERSE 3
beqdus gabcha and honu zarie /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=3A_yj8nxHrI', 'draft', 'pending', 'https://www.youtube.com/watch?v=3A_yj8nxHrI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('des-alachew-mushraw-mushrit-2', 'ደስ አላቸው ሙሽራው ሙሽሪት/2/', 'ደስ አላቸው ሙሽራው ሙሽሪት/2/', 'des alachew mushraw mushrit/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ደስ አላቸው ሙሽራው ሙሽሪት/2/', 'አግዚአብሔር ስላባረካቸው//2/
ደስ አላቸው የልባቸው ምክር
የብቻቸው ምሥጢር
ዛሬ ተፈጽሟል

VERSE 1
በቤተክርስቲያን
አርሱ በፈቀደ
አገናኝቷቸዋል
ደስ አላቸው ቅዳሴው ሲቀደስ

VERSE 2
ዝማሬው ሲዘመር
ሲባረኩ በአምላክ
ለዚህ ክብር በቅተው
ተክሊል ሲቀዳጁ

VERSE 3
ቁርባን ተቀብለው', 'agziabሔr slabarekachew//2/
des alachew yelbachew mkr
yebchachew mሥxir
zarie tefetsmual

VERSE 1
bebietekrstiyan
arsu befeqede
agenagntuachewal
des alachew qdasiew siqedes

VERSE 2
zmariew sizemer
sibareku beamlak
lezih kbr beqtew
teklil siqedaju

VERSE 3
qurban teqeblew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=3dNO_7j7FkA', 'draft', 'pending', 'https://www.youtube.com/watch?v=3dNO_7j7FkA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('des-alachew-mushraw-mushrit-2', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bewengiel-t-zaz-be-waryat-qal', 'በወንጌል ትዕዛዝ በሐዋርያት ቃል', 'በወንጌል ትዕዛዝ በሐዋርያት ቃል', 'bewengiel tዕzaz beሐwaryat qal', 'Ethiopian Orthodox Tewahedo Mezmur - በወንጌል ትዕዛዝ በሐዋርያት ቃል', 'በእመብርሃን ፊት ጋብቻቸው ሰምሮአል/2/
በአምላክ ሥጋና ደም ሁለቱም ታተሙ
የኅብረት ቃልኪዳን በአንድ ላይ አሰሙ//2/', 'beemebrሃn fit gabchachew semroal/2/
beamlak ሥgana dem huletum tatemu
yeኅbret qalkidan beand lay asemu//2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=znf_fU1KDwE', 'draft', 'pending', 'https://www.youtube.com/watch?v=znf_fU1KDwE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('bewengiel-t-zaz-be-waryat-qal', 'apostles', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tekle-ymanotn-tsadqun-yaferut', 'ተክለሃይማኖትን ጻድቁን ያፈሩት', 'ተክለሃይማኖትን ጻድቁን ያፈሩት', 'tekleሃymanotn tsadqun yaferut', 'Ethiopian Orthodox Tewahedo Mezmur - ተክለሃይማኖትን ጻድቁን ያፈሩት', 'ቀን ከሌት ተግተው ነው በጾምና ጸሎት/2/', 'qen keliet tegtew new betsomna tselot/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=3Ux7o2HKNC8', 'draft', 'pending', 'https://www.youtube.com/watch?v=3Ux7o2HKNC8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('tekle-ymanotn-tsadqun-yaferut', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeityophya-ortodoks', 'የኢትዮጵያ ኦርቶዶክስ', 'የኢትዮጵያ ኦርቶዶክስ', 'yeityophya ortodoks', 'Ethiopian Orthodox Tewahedo Mezmur - የኢትዮጵያ ኦርቶዶክስ', 'የኢትዮጳያ ኦርቶዶከስ ተዋሕዶ
ቤተከርስቲያን ልጆች ናቸው
አንቀበላቸው ሙሽሮች ናቸው
አንቀበላቸው', 'yeityophaya ortodokes tewaሕdo
bietekerstiyan ljoch nachew
anqebelachew mushroch nachew
anqebelachew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=4Pp-xFRcXMY', 'draft', 'pending', 'https://www.youtube.com/watch?v=4Pp-xFRcXMY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-joachewn-qedsesh', 'ድንግል ጐጆአቸውን ቀድሰሽ', 'ድንግል ጐጆአቸውን ቀድሰሽ', 'dngl ጐjoachewn qedsesh', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል ጐጆአቸውን ቀድሰሽ', 'አውነተኛ ፍቅር መሥርተሽ
በመካከላቸው ተገኝተሽ', 'awnetegna fqr meሥrtesh
bemekakelachew tegegntesh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=iMYSScYgrmI', 'draft', 'pending', 'https://www.youtube.com/watch?v=iMYSScYgrmI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qana-zegelila-tegegntesh', 'ቃና ዘገሊላ ተገኝተሽ', 'ቃና ዘገሊላ ተገኝተሽ', 'qana zegelila tegegntesh', 'Ethiopian Orthodox Tewahedo Mezmur - ቃና ዘገሊላ ተገኝተሽ', 'መልካሙን ጋብቻ የባረክሽ
ዛሬም ከልጅሽ ጋር በሠርጋቸው
ነይ ተመላለሽ መሃላቸው', 'melkamun gabcha yebareksh
zariem keljsh gar beሠrgachew
ney temelalesh meሃlachew', 'amharic', 'mezmur', 'ዘማሪ ቀሲስ ምንዳዬ ብርሃኑ', 'https://www.youtube.com/watch?v=zGpX04ofBZg', 'draft', 'pending', 'https://www.youtube.com/watch?v=zGpX04ofBZg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('qana-zegelila-tegegntesh', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yehabke-yom-yehabke-med-nie-lem', 'የሀብከ ዮም የሀብከ መድኃኔዓለም', 'የሀብከ ዮም የሀብከ መድኃኔዓለም', 'yehabke yom yehabke medኃnieዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - የሀብከ ዮም የሀብከ መድኃኔዓለም', 'የሀብከ ዮም የሀብከ መድኃኔዓለም /2/
ዕድሜ ማቱሳላ ወአብርሃም /2/', 'yehabke yom yehabke medኃnieዓlem /2/
ዕdmie matusala weabrሃm /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=dZLVr2YlNtA', 'draft', 'pending', 'https://www.youtube.com/watch?v=dZLVr2YlNtA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ysxachhu-zarie-ysxachhu-med-nie-lem', 'ይስጣችሁ ዛሬ ይስጣችሁ መድኃኔዓለም', 'ይስጣችሁ ዛሬ ይስጣችሁ መድኃኔዓለም', 'ysxachhu zarie ysxachhu medኃnieዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - ይስጣችሁ ዛሬ ይስጣችሁ መድኃኔዓለም', 'ይስጣችሁ ዛሬ ይስጣችሁ መድኃኔዓለም /2/
ዕድሜ ማቱሳላ የአብርሃም/2/
በቅዱስ ጋብቻ ሙሽሮች የተወሰናችሁ /2/
ክርስቶስ ተገኝቷል በመካከላችሁ /2/

VERSE 1
የድንጋዮቹን ጋን ወይኑን ወይን ሊሞላበት /2/
ከድንግል ማርያም ጋር ተገኝቷል ከዚህ ቤት /2/
ደስታውን አይቶ አምላክም ፍጹም ተደስቷል /2/
ሊባርካችሁም እጆቹን ዘርግቷል /2/

VERSE 2
በሕይወታችሁም ፍቅር ፍቅር ቅመም ሆኖ /2/
ትሕትናን ይሰጣችሁ እግዚአብሔር በቶሎ /2/', 'ysxachhu zarie ysxachhu medኃnieዓlem /2/
ዕdmie matusala yeabrሃm/2/
beqdus gabcha mushroch yetewesenachhu /2/
krstos tegegntual bemekakelachhu /2/

VERSE 1
yedngayochun gan weynun weyn limolabet /2/
kedngl maryam gar tegegntual kezih biet /2/
destawn ayto amlakm ftsum tedestual /2/
libarkachhum ejochun zergtual /2/

VERSE 2
beሕywetachhum fqr fqr qmem hono /2/
tሕtnan ysexachhu egziabሔr betolo /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=UK_gOGz1voM', 'draft', 'pending', 'https://www.youtube.com/watch?v=UK_gOGz1voM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('destawn-ayto-amlak-ftsum-tedestual', 'ደስታውን አይቶ አምላክ ፍጹም ተደስቷል', 'ደስታውን አይቶ አምላክ ፍጹም ተደስቷል', 'destawn ayto amlak ftsum tedestual', 'Ethiopian Orthodox Tewahedo Mezmur - ደስታውን አይቶ አምላክ ፍጹም ተደስቷል', 'ሊባርካችሁ እጆቹን ዘርግቷል/2/ በሕጠአይወታችሁም
ፍቅር/2/ቅመም ሆና''2/', 'libarkachhu ejochun zergtual/2/ beሕxeaywetachhum
fqr/2/qmem hona''2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=U2dLjNcbInw', 'draft', 'pending', 'https://www.youtube.com/watch?v=U2dLjNcbInw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('asme-le-lem-m-retu-asme-le-lem-4', 'አስመ ለዓለም ምሕረቱ አስመ ለዓለም/4/', 'አስመ ለዓለም ምሕረቱ አስመ ለዓለም/4/', 'asme leዓlem mሕretu asme leዓlem/4/', 'Ethiopian Orthodox Tewahedo Mezmur - አስመ ለዓለም ምሕረቱ አስመ ለዓለም/4/', 'አናመስግንሽ የአምላክ አናት በዝማሬ/ሪ2/', 'anamesgnsh yeamlak anat bezmarie/ri2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=mzNeo5sOkjQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=mzNeo5sOkjQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('asme-le-lem-m-retu-asme-le-lem-4', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beamlak-melkam-feqad', 'በአምላክ መልካም ፈቃድ ..', 'በአምላክ መልካም ፈቃድ ..', 'beamlak melkam feqad ..', 'Ethiopian Orthodox Tewahedo Mezmur - በአምላክ መልካም ፈቃድ ..', 'በፍቅር ተሳስረው
አንድ አካል ሆነዋል ማንም አይለያቸው
361. ሙሽራዋ/4/ እጹብ ነው ደስታው
ሙሽራው//ሪ/

VERSE 1
ሙሽራው/4/ አጹብ ነው ደስታው ሙሽራው
ሙሽራዋ/4/ አጹብነው ደስታዋ ሙሽራዋ/2/', 'befqr tesasrew
and akal honewal manm ayleyachew
361. mushrawa/4/ etsub new destaw
mushraw//ri/

VERSE 1
mushraw/4/ atsub new destaw mushraw
mushrawa/4/ atsubnew destawa mushrawa/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ydhjd-qs7Pw', 'draft', 'pending', 'https://www.youtube.com/watch?v=ydhjd-qs7Pw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zewetr-ynuru-me-kelachhu', 'ዘወትር ይኑሩ መሃከላችሁ', 'ዘወትር ይኑሩ መሃከላችሁ', 'zewetr ynuru meሃkelachhu', 'Ethiopian Orthodox Tewahedo Mezmur - ዘወትር ይኑሩ መሃከላችሁ', 'ጌታዬ በይው ውድሽ ነውና
አህቴ በላት ሥጋህ ናትና
ጽድቅ የተሞላ ፍሬ ይስጣችሁ
አብርሃም ሣራን ሁኑ ጸንታችሁ', 'gietayie beyw wdsh newna
ahtie belat ሥgah natna
tsdq yetemola frie ysxachhu
abrሃm ሣran hunu tsentachhu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=2bFeJXGehpA', 'draft', 'pending', 'https://www.youtube.com/watch?v=2bFeJXGehpA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tefe-bietekrstiyan-tefe-biete-lasie', 'ተፈሥሒ ቤተክርስቲያን ተፈሥሒ ቤተ ሥላሴ', 'ተፈሥሒ ቤተክርስቲያን ተፈሥሒ ቤተ ሥላሴ', 'tefeሥሒ bietekrstiyan tefeሥሒ biete ሥlasie', 'Ethiopian Orthodox Tewahedo Mezmur - ተፈሥሒ ቤተክርስቲያን ተፈሥሒ ቤተ ሥላሴ', 'ያሳደግሻቸው ልጆችሽ አብርፃም ሣራን ሲሆኑልሽ
ያሳደግሻቸው ሙሽሮችሽ አብርፃም ሣራን
ሲሆኑልሽ', 'yasadegshachew ljochsh abrፃm ሣran sihonulsh
yasadegshachew mushrochsh abrፃm ሣran
sihonulsh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=SPsfgVcsMWo', 'draft', 'pending', 'https://www.youtube.com/watch?v=SPsfgVcsMWo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('tefe-bietekrstiyan-tefe-biete-lasie', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yezerashw-masa-friewn-sishekem', 'የዘራሽው ማሳ ፍሬውን ሲሸከም', 'የዘራሽው ማሳ ፍሬውን ሲሸከም', 'yezerashw masa friewn sishekem', 'Ethiopian Orthodox Tewahedo Mezmur - የዘራሽው ማሳ ፍሬውን ሲሸከም', 'የዘራሽው ማሳ ፍሬውን ሲሸከም', 'yezerashw masa friewn sishekem', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=jByIAhjSZ0c', 'draft', 'pending', 'https://www.youtube.com/watch?v=jByIAhjSZ0c', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ywetie-nech-bleh-hid-wede-misth', 'ሕይወቴ ነች ብለህ ሂድ ወደ ሚስትህ', 'ሕይወቴ ነች ብለህ ሂድ ወደ ሚስትህ', 'ሕywetie nech bleh hid wede misth', 'Ethiopian Orthodox Tewahedo Mezmur - ሕይወቴ ነች ብለህ ሂድ ወደ ሚስትህ', '370. ሙሽራው ደስ ይበልህ', '370. mushraw des ybelh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=R8vVNM_nPnM', 'draft', 'pending', 'https://www.youtube.com/watch?v=R8vVNM_nPnM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-asasbiln-2', 'ድንግል አሳስቢልን/2/', 'ድንግል አሳስቢልን/2/', 'dngl asasbiln/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል አሳስቢልን/2/', 'በሠራኘታ ምድር ታምራት ያደረገ
በኤልያስ አድሮ ሕዝቡን የባረከ
ዛሬም አርሱ ነው የቤቱ ሰላም
አምላክ መድኃኔዓለም/2/

VERSE 1
ጭንቀትን አይተሽ የልብን ሐዘን
ታሳስቢያለሽ አንዲጎበኘን
አኛም አንቺን ጠርተን ከእፍረት ድነናል
ድንግል ክብር ይገባሻል/2/

VERSE 2
373. ቤታችን ይቀደስ
ቤታችን ይቀደስ በረከት ይሙሳ/2/
ፍቅር አንድነትን አድለን ጌታ
ቤታችን ይቀደስ የማያልቅበት

VERSE 3
ለሥጋ አምላክነህ
ገበናችንን', 'beሠragneta mdr tamrat yaderege
beielyas adro ሕzbun yebareke
zariem arsu new yebietu selam
amlak medኃnieዓlem/2/

VERSE 1
cnqetn aytesh yelbn ሐzen
tasasbiyalesh andigobegnen
agnam anchin xerten keefret dnenal
dngl kbr ygebashal/2/

VERSE 2
373. bietachn yqedes
bietachn yqedes bereket ymusa/2/
fqr andnetn adlen gieta
bietachn yqedes yemayalqbet

VERSE 3
leሥga amlakneh
gebenachnn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Sl9Akd7IzHU', 'draft', 'pending', 'https://www.youtube.com/watch?v=Sl9Akd7IzHU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mn-ykefel-lezih-rah', 'ምን ይከፈል ለዚህ ሥራህ', 'ምን ይከፈል ለዚህ ሥራህ', 'mn ykefel lezih ሥrah', 'Ethiopian Orthodox Tewahedo Mezmur - ምን ይከፈል ለዚህ ሥራህ', 'ምን ይከፈል ለዚህ ሥራህ', 'mn ykefel lezih ሥrah', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=69N3PYVzP2k', 'draft', 'pending', 'https://www.youtube.com/watch?v=69N3PYVzP2k', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('neger-hulu-beersu-tekenawene-2', 'ነገር ሁሉ በእርሱ ተከናወነ/2/', 'ነገር ሁሉ በእርሱ ተከናወነ/2/', 'neger hulu beersu tekenawene/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ነገር ሁሉ በእርሱ ተከናወነ/2/', 'ሰማይና ምድር ክብሩን ተናገሩ
ፈጥሮአቸዋልና እንዲገለጥ ክብሩ
በፈጠረው ፍጥረት የሚታወቅ እርሱ
እግዚአብሔር ይመስገን ስሙን አወድሱ', 'semayna mdr kbrun tenageru
fexroachewalna endigelex kbru
befexerew fxret yemitaweq ersu
egziabሔr ymesgen smun awedsu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=a_MhCi32Tqo', 'draft', 'pending', 'https://www.youtube.com/watch?v=a_MhCi32Tqo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ajg-des-ybelsh', 'አጅግ ደስ ይበልሽ', 'አጅግ ደስ ይበልሽ', 'ajg des ybelsh', 'Ethiopian Orthodox Tewahedo Mezmur - አጅግ ደስ ይበልሽ', 'ልጆችሽ ለተክሊል
ስለደረሱልሽ
በስርሽ ተምረው
በቃልሽ ታንጸው

VERSE 1
ለዚህ ክብር በቁ
አበሩ ደመቁ
አልል በይ መልካሙን ቃልሽን', 'ljochsh leteklil
slederesulsh
besrsh temrew
beqalsh tantsew

VERSE 1
lezih kbr bequ
aberu demequ
all bey melkamun qalshn', 'amharic', 'mezmur', 'ዘማሪት ማርታ ኃይለሥላሴ', 'https://www.youtube.com/watch?v=O6veUVp_aZc', 'draft', 'pending', 'https://www.youtube.com/watch?v=O6veUVp_aZc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('ajg-des-ybelsh', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-ymanot-friewoch', 'የሃይማኖት ፍሬዎች', 'የሃይማኖት ፍሬዎች', 'yeሃymanot friewoch', 'Ethiopian Orthodox Tewahedo Mezmur - የሃይማኖት ፍሬዎች', 'አልል በይ ከክፋ ጠብቀሽ
አልል በይ ሠላምን ስጫቸው
በትዳራቸው
ከህግ እንዳይወጡ

VERSE 1
በዓለም ተስበው
ቤተክርስቲያን ሆይ
እንግዲህ ባርኪያቸው
377.ዑ. ሙሽራው ከሙሽሪት ጋር

VERSE 2
ሙሸራው ከሙሽሪት ጋር
በአደባባይ ደምቀው ታይተዋል', 'all bey kekfa xebqesh
all bey ሠlamn scachew
betdarachew
kehg endaywexu

VERSE 1
beዓlem tesbew
bietekrstiyan hoy
engdih barkiyachew
377.ዑ. mushraw kemushrit gar

VERSE 2
musheraw kemushrit gar
beadebabay demqew taytewal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=7OqH44kEDXQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=7OqH44kEDXQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yhnn-awqen-new', 'ይህንን አውቀን ነው', 'ይህንን አውቀን ነው', 'yhnn awqen new', 'Ethiopian Orthodox Tewahedo Mezmur - ይህንን አውቀን ነው', 'በሥርዓት ማደጓን
ዓለም መሰከረ
አለል ዘለል ሳትል
መኖራ ታወቀ

VERSE 1
አንግዲህ ሙሽራው
ኩራ ደስ ይበልህ
ደግ ጨዋ መርጦ
አግዚአብሔር አደለህ', 'beሥrዓt madeguan
ዓlem mesekere
alel zelel satl
menora taweqe

VERSE 1
angdih mushraw
kura des ybelh
deg cewa merxo
agziabሔr adeleh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=1ebRIPKSK00', 'draft', 'pending', 'https://www.youtube.com/watch?v=1ebRIPKSK00', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeityophya-ortodoks-tewa-do-biete-krstiyan', 'የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን', 'የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን', 'yeityophya ortodoks tewaሕdo biete krstiyan', 'Ethiopian Orthodox Tewahedo Mezmur - የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን', 'ልጆች ናቸው እንቀበላቸው ሙሽሮች ናቸው
አንዘምርላቸው', 'ljoch nachew enqebelachew mushroch nachew
anzemrlachew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Qjl4j21JVFQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=Qjl4j21JVFQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-rods-yexmqetu-astemari', 'ትርጉም፡-', 'ትርጉም፡-', 'trgum፡- ሔrods yexmqetu astemari', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡-', '/መምህር/ የዮሐንስ ራስን ከሚያስቆርጥ ይልቅ
መሐላውን ቢበላ በተሻለው ነበር
12.ለዮሐንስ አንገት
ለዮሐንስ አንገት ለተቆረጠው

VERSE 1
ሳይበድል ታስሮ ለተሰቃየው
ትርጉም፡- የሄሮድያዳ ልጅ መጣችና እንዲህ
አለችው ክቡር የሆነውን የወንጌላዊው የዮሐንስን
ራስ በወጪት አድርገህ ስጠኝ አለችው

VERSE 2
ትርጉም፡- የከበረ የልዑል ነቢይ ዮሐንስ ሆይ
መኖሪያው በገዳም የሆነ የሰላም ሰው ነው
የመስቀል መዝሙራት
/ለመስከረም 16 - 25 ቀን/

VERSE 3
ትርጉም፡- ከመስቀሉ ወርዶ ለሁሉ አበራ
ትርጉም፡-
26.በመስቀልከ
ትርጉም፡- በመስቀልህ አርዳን በኃይልህ ተማጽነናልና

VERSE 4
ትርጉም፡- ክቡር የሆነ ዕፀ መስቀልህ በመስቀልህ ኃይል
ስምህ ይመሰገን ዘንድ ልዑል አምላክ ሆይ ለአንተ
ለብቻህ ምስጋና የሚገባው ስምህን ከፍ ከፍ አደርገዋለሁ
ትርጉም፡- ነቢዩ እንባቆም ተአምራቱን ያደነቀው

VERSE 5
መስቀል ንግሥት ዕሌኒ ፈለገችው
ትርጉም፡- ዛሬ ለወገኖቼ በመስቀሌ አበራለሁ
ትርጉም፡- መስቀል ኃይላችን ነው መስቀል ብርታታችን
ነው መስቀል ቤዛችን ነው ለእኛ ለምናምነው

VERSE 6
መድኃኒታችን ነው
ትርጉም፡- አጣኑ ያመለከተው መስቀል በጎልጎታ ተገኘ
370በመስቀሉ ወበቃሉ
በመስቀሉ ወበቃሉ /2/

VERSE 7
አዕበዮሙ ለአበዊነ /4
ትርጉም፡- በመስቀሉና በቃሉ አባቶቻችንን ከፍ ከፍ
አደረጋቸው
38በወንጌሉ ያመናችሁ

VERSE 8
በወንጌሉ ያመናችሁ /2/
እንካን ለብርፃነ መስቀሉ አደረሳችሁ /2/
39. ይቤሎሙ ኢየሱስ
ይቤሉሎሙ ኢየሱስ ለአይሁድ አመኑ ብየ

VERSE 9
ወእአመኑ በአቡየ አበርህ /2/ በመስቀልየ
ትርጉም፡- ኢየሱስ አይሁድን ዛሬስ በመስቀሌ ለወገኖቼ
አበራለሁና በአኔ አመኑ በአባቴም አመኑ አላቸው
49. ኃይልነ ወጸወንነ

VERSE 10
ኃይልነ ወጸወንነ ወሞገስነ (2) /2/
ትርጉም፡- ኃይላችን መጠጊያችን መኪያችን ይህ
መስቀል ነው
‹«. በኃይለ መስቀሉ

VERSE 11
በኃይለ መስቀሉ /4
ድል ሆነው ወደቁ አጋንንት በሙሉ
ዘምሩ ሁላችሁ ለኃይለ መስቀሉ
ድል መንሻ ነውና ላመነበት ሁሉ

VERSE 12
ትርጉም፡- ቤተክርስቲያን የክርስቶስ መስቀል ለእኛ
ለምናምን የባሕር ጸጥታ የመርከቦች ወደብ ነው
ትላለች
44ፋኀበሩ ቃል

VERSE 13
ኀበሩ ቃለ ነቢያተ/2/
ወይቤሎ መስቀል ብርሃነ /2/ ለኩሉ ዓለም /2/
ትርጉም፡- ነቢያት በአንድ ቃል ተናግረው
መስቀል ለዓለም ሁሉ ብርዛን ነው አሉ

VERSE 14
45. ዮም በዓለ መስቀሉ
ዮም በዓለ መስቀሉ በሰማያት በላዕሉ /2/
ወዘነግሠ በምድር (2) ለአሕዛብ /2/
ትርጉም፡- ዛሬ ከምድር ከፍ ባለ በሰማያት

VERSE 15
የመስቀል በዓል ነው በምድርም ለአሕዛብ
የነገሠበት ነው
ትርጉም፡-
ትርጉም፡-

VERSE 16
ትርጉም፡-
ትርጉም፡-
ትርጉም፡- የሰማይና ምድር ንግሥት
የሆንሸ የአመቤታችን የጽጌ

VERSE 17
መዝሙር ተፈጸመ:፡:
72. ከማሀ ኀዘን
ከማኀ ሐዘን ወተስዶ ሶበ በኩለቴ ረከቦ /2/
ርእዮ ለይብኪ አይነ ልብ ዘቦ /#/

VERSE 18
ትርጉም፡- እንደእርሷ ሐዘን መከራ ቢያገኘው ኖሮ ልብ
ያለው ሰው ከኀዘኑ ባልተቆጠበ
ነበር፡፡
73. ዮም ጸለሉ

VERSE 19
ዮም ጸለሉ መላእክት ላዕለ ማርያም ወላዕለ
ወልዳ ክርስቶስ በደብረ ቁስቋም /2/
አንዘይብሉ ስብሐት /2/ በአርያም
ስብሐት በአርያም /2/

VERSE 20
ትርጉም፡- እነሆ መላእክት ማርያም ከልጂ
ጋር በቁስቋም ተራራ ላይ ከለሏት
በአግዚአብሔር በሰማይ ምስጋና
አውነትም በምድር ይሁን

VERSE 21
74 መአዛሆሙ ለቅዱሳን
መአዛሆሙ ለቅዱሳን ከመጽጌ ደጎላት ዘውስተ ቆላት /2/
ጸገዩ ቀንሞስ ሞስለ ናርዶስ /4
75. ንዒ ርግብየ

VERSE 22
ንዒ ርግብየ ወንዒ ሠናይትየ /2/
ትርጉም፡- ማርያም በጊዮርጊስ ንግሥ /ክብሩ/
ጊዜ የአበባ ዘውዱ ናት የክብ
የንግሥና አክሊል ናት የአበባ

VERSE 23
ዘውድ አሷ ክብነት ያለው
የወርቅ ስቁር ናት፡:
77. እምነ እምነ ንኢ
አምነ አምነ ንኢ /4

VERSE 24
በሰላም /2/ ንኢ ማርያም /2/
አናታችን ነይ ነይ /
በሰላም /2/ ነይ ማርያም /2/
78. አሠርገዋ

VERSE 25
አሠርገዋ ለምድር አሠርገዋ ለጽጌ /2/
አስመ ውአቱ ክብሮሙ ለቅዱሳን
ትርጉም፡- ምድርን በአበባ አስጊጣት
ትርጉም፡- ምድርን በአበባ አስጌጣት

VERSE 26
ትርጉም፡- በነቢያት አፍ የተመሰገንሽ
በሐዋርያትም የተመሰገንሽ ነሽ
84 ንግሥተ ሰማያት
ንግሥተ ሰማያት ወምድር ማርያም ድንግል /2/

VERSE 27
ተፈጸመ/ 4 ማኅሌተ ጽጌ /2/
ትርጉም፡- የሰማይ የምድር ንግሥት የሆንሽ
አመቤታችን ሆይ የአንቺ ማኅሌት
ጽጌ ተፈጸመ::

VERSE 28
ትርጉም፡- በወርቅ አክል የተሸለመች አመቤታችን
የጊዮርጊስ የሰማዕትነቱ አክሊል አበባ ናት::
86. ከመጽጌ ሮማን
ከመጽጌ ሮማን ከመጽጌ /2/

VERSE 29
አበባዬ /2/ ወላዲተ አምላክ ሲሣይ /2/
ትርጉም፡- እንደ ሮማን አበባ ያማረች የአምላክ
አናት ማርያም ሲሣይ ናት፡፡
87. ብክዩ ኅዙናን

VERSE 30
ብክዩ ኅዙናን ዛልየክሙ ስደታ ለማርያም /2/
ትርጉም፡- አልቅሱ ምዕመናን አስባችሁ
የማርያምን ስደቷን /2/ ማርያም
ትርጉም፡- ልብ ዓይን ያለው ሰው የድንግልን

VERSE 31
ልቅሶ አይቶ ቢያለቅስ አግባብ ነው፡:
9. ወደ ምሥራቅ እዩ
ወደ ምሥራቅ እዩ ወደ ፀሐይ መውጫ
ድንግልን ክበቧት አንበል ሃሌ ሉያ

VERSE 32
ለአምላክ እናት ለአዛኝት /2/
ትርጉም፡-
93. አፈንብ
አፈንብ ማቱሳላ ወልደ ፄኖክ አመአፈ ልምላሜ

VERSE 33
ቡሩክ አፈ መላእክት /2/
ቀስመ ጽጌ ጽጌ /2/
ጽጌኪ አመ አምሳክ /2/
ትርጉም፣፤ የአምላክ አናት እመቤታችን ሆይ

VERSE 34
የንብ አፍ የፄኖክ ልጅ የሚሆን
ማቱሳላ ከተባረከ (ከተቀደሰ) ልምላሜ
መልአክ አፍ ልጀሽ አበባን ቀሰመ
94 ኦ ድንግል

VERSE 35
ኦ ድንግል አዘክሪ ርዛፃበ ወጽምዓ /2/
ትርጉም፡- ከእንቁ በሚያበራ አክሊል የተሸለመች
አመቤታችን የጊዮርጊስ አክሊል
ትርጉም፡- አንድ ጊዜ በጀርባሽ አንድ ጊዜ በጎንሽ

VERSE 36
ሕፃንን በማዘል /ሇ ደከምሽ ማርያም በብዙ /2/
ትርጉም፡-
ትርጉም፡-
ትርጉም፡- የኦሪት ቃል ያለባት ታቦትን

VERSE 37
ፈጽመው በወርቅ ይጋርዲታል፡፡
ትርጉም፡- በካህናት የታጠረች
በመንፈስ ቅዱስ
የተከለለች የእግዚአብሔር የሕጉ

VERSE 38
ታቦት ጽዮን ሆይ
ንጉሥሽ ለጠላት
አይሸነፍም ሀገርንም
አይተዋትም፡፡

VERSE 39
ትርጉም፡- ንጉሥ ዳዊት ዓይንን የሚንፀባርቅ
የክብር ልብስ ሰብሶ ከሕግ
ታቦት ፊት አመሰገነ፡፡
ትርጉም፡- ክርስቶስ መሠረትሽ የሆነ ቤ/ክ

VERSE 40
የጽድቅ ፀሐይ ያበራልሻል
ለሰማዕት በስብከት
የተሸለምሽላቸው፡፡
ትርጉም፡- የሙሴ ጽላት የሲና እፀ ጳጦስ

VERSE 41
የአሮን
ትርጉም፡- ሙሴ ያያት
በደብረ ሲና የለመለመች ዕፅ/2/
ትርጉም፡- ሰላማዊት የሆነች

VERSE 42
ቅድስት ጽዮንን ሙሴ አያት፡፡
ትርጉም፡- አለም ሳይፈጠር የነበረ
ዓለምን አሳልፎ የሚኖር
ትርጉም፡- በሰማይም በምድርም

VERSE 43
በዳዊት ቃል ያመሰግናሉ፡፡
ትርጉም፡- እስከ ዓለም መጨረሻ ድረስ በላያቸው
ይመስገን ዘንድ የተለዮ ነቢያት
ትርጉም፡- ጽዮን የተባለች ቅድስት

VERSE 44
ድንግል ማርያም የሰማዕታት አናታቸው
የመላዕክት አኅታቸው ናት፡፡
208.እዝራኒ ተናገራ/2/
አዝራኒ ተናገራ/2/

VERSE 45
ተናገራ ዳዊት ዘመራ ተናገራ ዳዊት/2/
209ዘርዕየ
ዘርዕየ ተቅዋመ ማኅቶት/2/
ዘካርያስ ካህን ነቢይ ወሰማዕት/2/

VERSE 46
ትርጉም፡- መቅረዝን ያየ ነቢያት ካህን የሆነ
ትርጉም፡-የጥበብ ሰዎች
ለአማኑኤል ይሰግዱ ዘንድ
በኮከብ አየተመሩ መጡ

VERSE 47
211.በጎለ እንስሳ
በጎለ እንስሳ /2/
በጎለ እንስሳ ተወለደ አማኑኤል/4/
ትርጉም፡

VERSE 48
በእንስሳት በረት አማኑኤል ተወለደ
212.ውስተ ማኅፀነ
ውስተ ማኅፀነ ድንግል ኀደረ ማኅፀነ
ድንግል/ሪ/

VERSE 49
ሰማይ ወምድር ዘኢያገምሮ ሰማይ ወምድር
በማይ ተጠመቀ
ትርጉም፡-
ሰማይና ምድር የሟይችሉት አምላክ

VERSE 50
በአመቤታችን ማኅፀን አደረ በውኃም
ተጠመቀ
ትርጉም፡-
ዓለምን ለማዳን መጣ አንድነቱንም

VERSE 51
ይስጠን ዘንድ አጅ መንሻም ያቀርቡ
ዘንድ
ትርጉም፡- ምድርም አየችው አመሰገነቸው
ባሕርም ሰገደችለት

VERSE 52
ትርጉም፡- የበኩር ልጂን ወለደች
የደመና መጋረጃ ጋረዳት
ትርጉም፡-
ወልድ ክርስቶስ ወደ ወንዝ ሊጠመቅ ወረደ

VERSE 53
220.ወቅድሳት
ወቅድሳት መንፈስ
ወሀበነ ማየ መንጽኤ ዚአነ
ትርጉም፡ መንፈስ ቅዱስ በመቅደስ

VERSE 54
ለኃጢአታችን ማንጫ ውኃን ሰጠን
221.በእደ ዮሐንስ
ትርጉም፡- ናዝራዊ ኢየሱስ ክርስቶስ
በዮሐንስ እጅ ተጠመቀ

VERSE 55
ትርጉም፡- ኢየሱስ ወደ አሴይ ሀገር ሄደ
ዮሐንስም በውኃ አጠመቀው
አኛንም ከውኃ ዳግመኛ ወለደን
ትርጉም፡- እንደ ሕፃን ሆኖ በትንሽ

VERSE 56
በትንሹ አደገ በዮርዳኖስ
ወንዝ በዮሐንስ እጅ ተጠመቀ
ትርጉም፡- ዘጠና ዘጠኙን ነገደ መላእክትን ትቶ
በባሕር መካከል ቆመ

VERSE 57
ትርጉም፡- መድኃኒታችን እነሆ ተወለደ
መድኃኒታችን ተጠመቀ
አሁንም እነሆ ሰላምን እንከተላት
229.አማን በአማን

VERSE 58
ትርጉም፡-አእውነት እውነት የክርስቶስ
መወለድ መጠመቅ አስደናቂ ነው
ትርጉም፡- የነበረ በማዕከለ ዓለም ያለ
ትርጉም፡- ጌታችን መድኃኒታችን ከእኛ ተሰውሮ

VERSE 59
የነበረው አሁን ተገለጠ በቃና ገሊላ
ውኃውን ወይን ጠጅ
በማድረግ ተአምራትን አደረገ
232.ክርስቶስ ተወለደ

VERSE 60
ክርስቶስ ተወልደ ወተጠመቀ /2/
አስተርአዮቱ አማን አሰትርእዮቱ /4/
ትርጉም፡- ኢየሱስ ክረትስቶስ ተወለደ
ተጠመቀም በአውነት መገለጽ አውነት ነው

VERSE 61
233.ዮሐንስኒ
ዮሐንስኒ ሃሎ ያጠምቅ/2/
በፄኖን በቅሩበ ሣሌም/4/
ትርጉም፡- በዮሐንስ በኢየሩሳሌም አቅራቢያ

VERSE 62
በዮርዳኖስ ያጠምቅ ነበር
234.ሶበ መጽአ
ሶበ መጽአ ቃል አምሰማይ ለተናብቦ''2/
ከበቦ /4/ ለማይ ባሕር ነድ በማይ ከበበ/4/

VERSE 63
ትርጉም፡- ቃል ከሰማይ ለመናገር በመጣ
ጊዜ እሳት የዮርዳኖስን ባሕር ከበበው
ውኃውም የሚሄድበት ቦታ ጠበበው
235.ዮም ሰማያዊ

VERSE 64
ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እምቅድስት ደንግል/2/
ርእይዎ ኖሎት/2/ አእኩትዎ መላእክት /2/
ትርጉም፡- እነሆ ዛሬ ሰማያዊ ንጉሥ

VERSE 65
በበረት ተኛ ከቅድስት ድንግል
ትርጉም፡- በሰማያት ለአግዚአብሔር
በምድርም ለሰው ልጆች ሰላም ይሁን
237.ወጽአ ወገብአ

VERSE 66
ወጽአ ወገብአ በሰላም /ሪ2/ ወገብአ በሰላም/2/
ትርጉም፡-በሰላም ወጥቶ በሰላም ገባ
238.ንኡ ናንሶሱ
በብርሃኑ ንኡ ናንሶሱ

VERSE 67
በብርሃኑ ንኡ ናንሶሱ
ትርጉም፡- በብርሃኑ እንመላለስ
239.መጽአ ቃል
መጽአ ቃል እምደመና ዘይብል/2(/(2)

VERSE 68
ዝንቱ ውአቱ ወልድየ ዘአፈቅር/4/
ትርጉም፡ የምወደው ልጄ ይህ ነው
የሚል ቃል ከደመና መጣ
240.ፈለገ ዮርዳኖስ

VERSE 69
ፈለገ ዮርዳኖስ የእምነታችን ጣአሙ
ለክርስቲያን ታሪክ አንቺ ነሽ መቅድሙ
ቅድስት/3/ ዮርዳኖስ ሆይ የጌታ ሀገሩ
አብ ወልድ መንፈስቅዱስ በአንቺ ላይ አደሩ

VERSE 70
241.ቅዱስ
ቅዱስ /3/ አልፋ ሕያው አምላካችን ክብሩ
ይስፋ/2/
አስይ ተጠመቀልን አኛ አንዳጠፋ

VERSE 71
242.የምስራች
የምሥራች ተጠመቀ እስይ /2/(2)
የዓምለም ቤዛ /2/ የጽድቅ ፀሐይ /2/
ተጠመቀ አምላክ አዶናይ /2/

VERSE 72
ትርጉም፡- አየዋት ቤተክርስቲያንን
ትርጉም፡- ካህንና ነቢይ የሆነ ዮሐንስ
መጥምቅ ከኃይል ወደ ኃይል
በመንፈስ ይሸጋገራል

VERSE 73
261.ኑኑ እንደሰት
ኑ ኑ አንደሰት/2/
ጌታ ተጠመቀ/4/ ተጠመቀ በማየ ዮርዳኖስ/2/
262.ኢየሩሳሌም

VERSE 74
ኢየሩሳሌም/3/ በሆን ጌታ ሲወለድ ባየን
አንደ ዮሴፍ ወይ እንደ ሰሎሜ በሆን/2/
አንድ አረኞች ወይ ሰብአ ሰገልን በሆን/2/
263.ዮም ፍሥሐ

VERSE 75
ዮም ፍሥሐ ኮነ በአንተ ልደቱ ለክርስቶስ/2/
አም ቅድስት ድንግል/2/ ውእቱ ኢየሱስ
ክርስቶስ/ኃ/
264.ተወልደ

VERSE 76
ተወልደ ኢየሱስ በቤተልሔም/2/ ዘይሁዳ
በቤተልሔም/ሪ2/
ትርጉም፡- በፍርድ እንደማያዳላ እወቁ
ትርጉም፡-ሞትማ ለሚሞተው ሰው ይገባዋል

VERSE 77
የማርያም ሞት ግን /2/
በጣም ያስገርማል/2/
ትርጉም፡-
ትርጉም፡-

VERSE 78
ትርጉም፡-አውነት በእውነት/4/
አያልቅም ቃልኪዳንሽ/4/
397. አማልጂን ከልጅሽ
ትርጉም፡- ያለበጎ ሥራ የምንጸድቅ መንግሥተ

VERSE 79
ሰማያትን የምንወርስ ካልሆነ አመቤቴ ቅድስት
ድንግል ማርያም ሆይ ቃል ኪዳን ኪዳንሽ ለከንቱ
ነበርን
400. ኪዳንኪ ኮነ

VERSE 80
ኪዳነኪ ኮነ/4/
ለኃጥአን ተስፋነ/2/ ኪዳንኪ ኮነ/4/
ትርጉም፡- የምሕረት ኪዳን ያለሽ አመቤታችን
ለኃጥአን ተስፋቸው ነሽ፡፡

VERSE 81
ትርጉም፡- በአለተ ምፅአት ጊዜ ኪዳንሽ
በፈጣሪ ፊት ቤዛ ይሁን፡፡
402. ነይ ነይ ማርያም
ነይ ማርያም ወላዲተ አምላክ የጻድቃን

VERSE 82
አመቤት የመላእክት እህት/2/
ሁላችሁ አመኗት ከልብ አማላጅ ናትና በእውነት
አናመስግናት አናወድሳት አማላጅ ኪዳነምሕረት/ሪ2/
ትርጉም፡- የታወቀች የድኅነት ቀን የምትመጣይቱ

VERSE 83
የአባታችን ዳዊት መንግሥት ቡርክት ናት
ትርጉም፡-ከሕፃናት አንደበት ምስጋናን አዘጋጅህ የጠላት
ዲያብሎስ ምክሩን ታፈርስ ዘንድ
ትርጉም፡-ከሚነደው አሳት ከነበልባሉ አወጣን/2/

VERSE 84
ትርጉም፡- ትንሣኤህን ለምናምን ለእኛ ብርፃንን
ላክልን
ትርጉም፡- ክርስቶስ ለእኛ ለኃጥአን መድኃኒታችን
ትርጉም፡- ክርስቶስ ተነሣ ከሙታን በታላቅ ኃይል

VERSE 85
በታላቅ ሥልጣን ሰይጣን አስሮ አዳምን ነጻ አወጣው
ከእንግዲህ ይሁን ሰላም
ትርጉም፡- ወደ አባቱ አረገ መንፈስቅዱስንም ላከልን
650.ዐረገ በስብሐት

VERSE 86
ዐረገ በስብሐት /2 ውስተ ሠማያት /2
ወነበረ በየማነ አቡሁ ዳግም ይመጽእ በስብሐት
ትርጉም፡- እገባለሁና ወደቦታዋ ማኅደረ ስብሐት
ቤተ አግዚአብሔር በእምነትም ቃል

VERSE 87
በደስታም ዘምሩ የማርያም ቅድስት
ልደቷን የሚያከብሩ
673.አምሐና ወኢያቄም /4/
አላ በሩካቤ ዘበሕግ /2

VERSE 88
674.ዓምደ እሳት ጾርኪ /4/
ኦ ማርያም /3/ መንክር ልደትኪ
675.አማን በአማን /4/
ተወልደት አመብርሃን /4/

VERSE 89
676.የምስራች ተወለደች እሰይ እሰይ
ትርጉም፡- የለብሽም ነውር ምንም በላይሽ ላይ/2
ውጪ ከሊባኖስ እኅትየ መርዓት /4
681.ከሊባኖስ

VERSE 90
ከሊባኖስ ከሊባኖስ ከልጅሽ ጋር ነይ
አመ አዶናይ ከሊባኖስ ወደእኛ ነይ
ጥበቃሽ ዘወትር ከሊባኖስ
አንዳይለየኝ ››

VERSE 91
በሔድኩበት ሁሉ ››
ትርጉም፡- የኢያቄም ልጅ የዳዊት ዘመድ ናት
685.ሐመልማላዊት /6
ሙሴ ዝዘርእያ/2 በደብረ ሲና /2 ማኅደረ ስብሐት /2

VERSE 92
686.. ኢያቄም ወኸና እናት አባትሽ ቤተ እግዚአብሔር
ወስደው ስእለት የሰጡሽ መና ከደመና
የወረደልሽ ፍጹም ድንግል የሆነሽ
ትርጉም፡- ማርያም ንጽሕት ድንግል ታማኝ

VERSE 93
አምላክን የወለድሽ የምሕረት አማላጅ ነሽ
ለሰው ልጅ ሁሉ /2/
ትርጉም፡- ለምኝልን ማርያም ለምኝልን/2/
የንጹሐን አክሊል/2/ ለምኝልን/2/

VERSE 94
700.ሰላም እለኪ/6
ሰላማዊት ማኅደረ ስብሐት
ሰላማዊት ደብረመድኃኒት
701. ኮነ ዮም/2/ በእንተ ልደታ ለማርያም/2/

VERSE 95
ከመ ትቤዙ ነቢያተ ወጻድቃን ነቢያተ ከመ ትቤኩ/ቋ2/
7025. ዮም ፍሥሐ ኮነ በአንተ ልደታ ለማርያም
አምሐና ወኢያቄም ከመ ትቤዙ ነቢያተ ወጻድቃነ አማን
ተወልደት አመብርፃን

VERSE 96
702 -ሀ-. ሰአሉለነ ሐና ወኢያቄም/2/
ዘወለድክምዋ ለድንግል ማርያምሃ''4/
ለምኑልን ሐና ወኢያቄም/2/
አናትና አባቷ የድንግል ማርያም

VERSE 97
702-ለ-አሰይ ተወለደች በዛሬዋ ዕለት ድንግል ማርያም
የአምላክ እናት /2/
የምስራች እልል በሉ የአዳም ልጆች ሁሉ
የምስራች እልል በሉ ክርስቲያኖች ሁሉ

VERSE 98
702 -ሐ- ሐናና ኢያቄም በስለት ያገኙሽ/2/
ድንግል እናታችን በጣም ደስ ይበልሽ /2/
ለመዳን ምክንያት የሆነችው እናት /2/
ትርጉም፡- ለእመቤታችን ገብርኤል

VERSE 99
አበሠራት
አንዲህም አላት ንጉሥ ትወልጃለሽ
706.ውእቱ ሩፋኤል
ውእቱ ሩፋኤል ውእቱ መልአከ ኃይል

VERSE 100
ልዑል ውአቱ ልዑል መንበር
ይስአል ለነ ይስአል ለኢትዮጵያ
ትርጉም፡- የኃይል መልአክ ሩፋኤል ነው
አኛን ይጠብቀን ሀገራችንን ኢትዮጵያ

VERSE 101
ይርዳልን
ትርጉም፡- ቃልህ አረጋጋኝ አጸናኝ ስለዚህ አውቄ
አንተን ፈለኩህ
709.ሩህሩህ

VERSE 102
ሩኅሩኅ መልአክ ነህና ለሁሉ የምትራራ/ሪ2/
ገብርኤል አዛኙ እንተ አውጣን ከመከራ/4/
የሚያሳድዱኝ ገብርኤል ሲቆሙ ከፊቴ
ትርጉም፡- ገብርኤል ለመናገር ትሩ ልሣን

VERSE 103
ስጠኝ /አንደበት ስጠኝ/ መንፈስ
ቅዱስን አሳድርብኝ የብርፃን
መጎናፀፊያ አድንጎናፀፍ በመልጃህ
ተራዳን

VERSE 104
711.ገብርኤል
ገብርኤል አማልደን ከአምላካችን /2/
አንዳንጠፋ እንዳንሞት በነፍሳችን
አደራህን ቁምልን ከጎናችን /2/

VERSE 105
712. የብርሃናት አለቃ
የብርሃናት አለቃ የጌታ ባለሟል ሊቀ
መላእክት /2/
ንዓ ራጉኤል /4/ ራጉኤል መጋቤ

VERSE 106
ብርሃናት/2/ ኸኸ/2/
ትርጉም፡- ሩጫቸው ከነፋስ ይፈጥናል
718.ገብርኤል ምልአኒ
ትርጉም፡- ዓውደ ዐመቱ ይባረክ ዘንድ ራጉኤል

VERSE 107
መልአክ ወደ አምላክ ጸልየ /ለምን/
ትርጉም፡- ዑራኤል ወሩፋኤል ሆይ በትሕትናና
በጸሎት ወደ እግዚአብሔር ለምኑልን
የቅዱሳን ጻድቃን መዝሙራት

VERSE 108
726.ሐዋርያው
ትርጉም፡- አባቶቼ ነአኩቶ ለአብ
ይምርሃነ ክርስቶስ
ቅዱስ ላሊበላ ከነጣቂ አንበሳና ተኩላ

VERSE 109
ጠብቁኝ
743. የቅዱሳን በዓት
ልቡና የሚመስጥ መዓዛ አጣኗ
ኅሊናን ይገዛል ዝማሬ ድጓዋ

VERSE 110
ትርጉም፡- በምድር የዋሃን የሆኑ የብርዛን
ልጆች
ትርጉም፡- የገብረ መንፈስ ቅዱስ ልብሳቸው እንደ ሽቱ
ያማረ ነው ደግሞም ልብሳቸው እንደነጭ ሐር

VERSE 111
ነው እርሱም ወደ ገነት የወረደ ነው
752. ያሬድ ማኅሌታይ
ያሬድ ማኅሌታይ ለአግዚአብሔር ካህኑ ስብሐተ ትንሣኤ
ዘይአዜኑ ኦሪት ቶታህኑ ወወንጌል አሳዕኑ (2)

VERSE 112
ትርድአነ ነአ በህየ መካኑ ከመ ፀበል ግዑዛነ ፀርነ ይኩኑ
ትርጉም፡- የጫማህ ማዘቢያ /ማሰሪያ /ኦሪት የእግርህ
መጫሚያ ወንጌል የሆነና የትንሣኤን ክብር
የምታስተምር የእግዚአብሔር አገልጋይ

VERSE 113
ማኅሌታዊ ያሬድ በዚህ ቦታ ትረዳን ዘንድ ና
753.ሰማየ በአብ
ሰማየ በአብ ወበወልድ አርያመ ወበመንፈስ ቅዱስ ኀበ
ዓረጉ አነ (2

VERSE 114
ሰማዕኩ አመላአክት ዝማሬ በአድንኖ ወበአትሕቶ ቦ
ዘያጽሕሱ ወቦ ዘይዜምሩ (2)
ትርጉም ፡- በአብ በወልድ በመንፈስ ቅዱስም ቸርነት
ሰማይ ወጥቼ ጽርሐ አርያም ደርሼ

VERSE 115
ከመላእክት
ዝማሬ (ምስጋና) ሰማሁ ከእነርሱም
በዝቅታና በትኅትና የሚያሸበሽቡ አሉ
ዙሪያውንም

VERSE 116
ቆመው የሚዘምሩ አሉ
ትርጉም፡- ኃይልን ተአምርን የምታደርግ ገብረ
መንፈስቅዱስ
ቅዱስ ሆይ ክንፋቸው በነበልባል የሆነ

VERSE 117
የሚያስፈሩ
መላእክት ሱራፌልና ኪሩቤል እውነት በማለት
ይቀበለህ ዘንድ ዛሬ ወረዱ
የሰማዕታት መዝሙር

VERSE 118
763.አማን በአማን
ትርጉም፡- እውነት በአውነት ጊዮርጊስ
ቅዱስ ነው እንደ ነፋስ ትቢያ በይድረስ
ተራራ በተኑት

VERSE 119
ትርጉም፡- የእሳቱ ነጎድጓድ ያላስፈራህ ሕፃኑ ቂርቆስ
ሆይ የእያንዳንዳችንን ማኅበር ዛሬ ባርክ
ትርጉም፡- ለቂርቆስ የድንኳን ሥራ አሳየው በብርፃን
ምሰሶ ተነጋገረው የመላእክት እህታቸው የሰማዕታት

VERSE 120
አናታቸው የደመና ብርፃንናት
783. አፀደ ወይን
አፀደ ወይን ዘያፈርህ አስካለ ሕይወት /2/
ከመ ጽጌሬዳ /4/ አስጢፋኖስ ምሉአ ፍቅር ከመ

VERSE 121
ጽጌረዳ /2/
784. ሰአለ
ትርጉም፡-
ትርጉም፡- አቤቱ ስማኝ ጸሎቴን ጩኸቴም ወደአንተ

VERSE 122
ትድረስ ፊትህን ከእኔ ዘንድ
አትመልስብኝ በመከራዬ ቀን ስማኝ
ጆሮህንም  ወደአኔክ  በጠራሁህም
ፅለትም በፍጥነት ስማኝ

VERSE 123
818.የሥላሴን መንበር
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሩቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሐል ሚካኤልን ከፊት

VERSE 124
አእላፍ መላዕክት ሲሰግዱ በፍርፃት
አዩት ተመልከቱት የሰማዩን ድምቀት
አዩት ተመልከቱት የሰማዩን አባት
የሥላሴን መንበር ቅዱሳን ከበውት

VERSE 125
እያሸበሸቡ የሰማይ መላዕክት
ካህናተ ሰማይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ታላቅ ክብር ሊያዩ የታደሉ
በጽድቅ ሥራቸው በምድር ይታያሉ/2/

VERSE 126
619.ሥላሴን አመስግኑ
ሥላሴን አመሥግኑ/2/
የምድር ፍጥረታት ዘምሩ አልል በሉ/2/
በስመ አብ ወወልድ ወመንፈስቅዱስ

VERSE 127
ምስጋና ይገባል ከምንም በፊት
ዓለማትን ሁሉ ለፈጠረ ጌታ
ምስጋና ይገባል ከጠዋት እስከ ማታ
ኪሩቤል ሱራፊል የሚያመሰግኑት

VERSE 128
መላእክት ከሰማይ የሚዘምሩልህ
አኛም የአዳም ልጆች እንዘምራለን
በሰማይም በምድር አንጠራዛለን
ብራብ በሥላሴ እአጠግባለሁኝ

VERSE 129
ብጠማም በአምላኬ እረካለሁኝ
ትርጉም፡- ምስጋና ይገባል ለአብ ዓለምን ሁሉ ለያዘ
ምስጋና ይገባል ለወልድ ዓለሙን ሁሉ ለፈጠረ/2/
ምስጋና ይገባል ለመንፈስ ቅዱስ በየዓመቱ

VERSE 130
ክረምትን ለሚከፍት/2/
850.አውነተኛ ሰላም
አውነተኛ ሰላም ያለው ከቤትህ ነው
አርደኝ አልናወጽ አለምንፃለሁ/2/

VERSE 131
ኃጢአቴን ሳስበው ልቤ ይጨነቃል
ከአንተ መለየቴ ነፍሴን አድክሟታል
ወደአንተ መልሰኝ አኔ አመለሳለሁ
አውነተኝ ሰላም ያለው ከቤትህ ነው

VERSE 132
ለቅዳሴው ጸሎት ዘወትር እንዳልተጋሁ
በአደባባይ ቆሜ ስምህን አንዳልጠራሁ
ተሰነካክዬ ወድቄአለሁና
አርዳኝ አማኑኤል በሃይማኖት ልጽና

VERSE 133
ዓይኔ ዕንባ ያመንጭ ላልቅስ ስለ ኃጢአቴ
የንስሓ ትሁን ቀሪዋ ሕይወቴ
በመዳኔ ሰዓት በዛሬዋ ዕለት
ፍቅርህን አስቤ መጣሁ ከአንተ ፊት

VERSE 134
ጌታ ሆይ ጸጸቴን ዕንባዬን ተቀበል
አባትህ ነኝ በለኝ አኔም ልጅ ነኝ ልበል
ዘይት ሳላዘጋጅ ድንገት መጥተኸብኝ
በርህን በመዝጋት ከደጅህ አታስቀረኝ

VERSE 135
651.ጌታ ሆይ ለስምህ
ጌታ ሆይ ለስምህ አዘምራለሁ
ልዑል ሆይ ለክብርህ አልል አላለሁ
በአንተ ደስ ይለኝል ሐሴት አደርጋለሁ /2/

VERSE 136
የበዛው ምሕረትህ በእኔ ላይ ተገልጦ
የትናንቱ ስሜ በአንተ ተለውጦ
ሞገስ ስለሆንከኝ ከፊትህ ቆሜያለሁ
በአውደ ምሕረትህ ስምክን አጠራለሁ

VERSE 137
ያለቀውን ነገር የተቀጠረውን
ትርጉም፡- አናንተ የክርስቲያን ወገኖች ሆይ በዚህ ቀን
ትርጉም፡-
ደንግል ማርያም መሠረቶቿዋ በምድር ቅርንጫፎቿ

VERSE 138
በሰማይ የሆነች ሐረግ ናት
897.ስምሽን ጠርቼ
ስምሽን ጠርቼ መቼ አፍራለሁ
ትርጉም፡-

VERSE 139
ትርጉም፡-ማርያም ንጽሕት ድንግል ታማኝ
አምላክን የወለድሽ የምሕረት አማላጅ ነሽ ለሰው
ልጅ ሁሉ/2/
ትርጉም፡- ማርያም ትበልጣለች ከሁሉ ፍጥረት

VERSE 140
ስለያዘች አሳተ መለኮትን/4/ (ስላላቃጠላት)
944.የኖኅ ቃል ኪዳኑ
የኖኅ ቃል ኪዳኑ ምልክት ዓርማው
የመዳኑ ምሥጢር የሰላም ተስፋው

VERSE 141
አመቤቴ አንቺ ነሸ ቀስተደመናው/2/
አንቺ የአሮን በትር ሳይተክላት ያደገች
የማክሰኞ እርሻ ያለዘር ያፈራች
የሲና ሐመልማል የተዋሕዶ ምሥጢር

VERSE 142
ክብርት አምቤቴ ሀገረ እግዚአብሔር/2/
የዳዊት መሰንቆ ያሬድ ጽናጽል
የደካሞች ምርኩዝ የሰሎምን አኪሊል
ሰላሜ ተስፋዬ የሐዘኔ ደራሽ

VERSE 143
የጽዮን ተራራ መሸሸጊዬ ነሽ/2/
የኤልሳዕ ማሠሮ ጨው የተገኘብሽ
የሕዝቅኤል ራዕይ ንጽሕት አዳራሽ
አንቺ የአዳም ተስፋ የመዳኔ ብስራት

VERSE 144
ትርጉም፡- ዘወትር በቤተ አግዚአብሔር
እየተቀመጠች
ሳለ እንደ ፊተኛው ያልሆነ መልአክ ታያት
965.መሶበ ወርቅ

VERSE 145
መሶበ ወርቅ ዘመና እግዝአትና ማርያም ቅድስት
ቅድስተ ቅዱሳን ይብልዋ ካህናት /4/
ትርጉም መና ያለባት የወርቅ መሶብ የሆነችውን
አመቤታችንን ማርያምን ካህናት

VERSE 146
ከቅዱሳን ይልቅ ቅድስት ነሽ እያሉ
ያመሠግኗታል፡፡
966. አመቤቴ ማርያም
አመቤቴ ማርያም ሆይ አለምንሻለሁ

VERSE 147
ከልጅሽ አማልጅን /3/ ከፊትሽ ቆሜአለሁ
አባክሽ አማልጅኝ የአምላክ አናት ድንግል
ምን ጊዜም አይጠፋም/3/ ከአዳም ልጅ በደል
በደላች ብዙ ነው ልመናችን ትንሽ

VERSE 148
ምሕረትን ጠይቁልን /3/ ድንግል ከልጅሽ
967.ወዳጄ ሆይ
ወደጄ ሆይ እነሆ ውብ ነሽ
ትርጉም፡- ንግሥቲቱ የወርቅ ልብስ ተጎናጽፋ

VERSE 149
በቀኝህ ትቆማለች
973. ስአሊ ለነ ማርያም
ትርጉም፡- ከንጹሐን ንጹሕ ሆና በሲና እንደነበረች ታቦት
በንጽሕና በቤተ መቅደስ ውስጥ ኖረች ምግቧም

VERSE 150
ትርጉም፡- መና ያለብሽ የወርቅ መሶብ ቅድስት
አመቤታችን ማርያምን ካህናት ከተለዩ የተለየች
ይሏታል፡፡
985 ወእንዘ ትፈትል

VERSE 151
ወእንዘ ትፈትል /2/ ወርቀ ወሜላተ አስተርአያ
ገብርኤል ግብተ /2/
ወይቤላ ወይቤላ አስመ ረከብኪ ሞገሰ በኀበ
አግዚአብሔር

VERSE 152
986. እመቤታችን ለአንቺ
አመቤታችን ለአንቺ ሰላምታ ይገባሻል/2/
ከሴቶች ሁሉ /3/ ተመርጠሻል
አያረጋጓት የሠማይ መላእክት /2/

VERSE 153
ቤተ መቅደስ ኖረች /3/ አሥራ ሁለት ዓመት
ትርጉም፡- ድንግል ሆይ የሐዋርያት ሞገስ የነቢያት
ትንቢት አንቺ ነሽ
1079..ማርያም

VERSE 154
ትርጉም፡- ለሰዎች አዛኝ ልብ ያላት አመቤቴ
1080.በመኑ በአምሳለ መኑ
በመኑ በአምሳለ መኑ ናስተማስልኪ/2
አመቤቴ የእኛ አማላጅ አዛኝቷ ኦ ድንግል

VERSE 155
ምልዕተ ውዳሴ /2
1081.ማርያም ተዐቢ
ትርጉም፡- ማርያም ትበልጣለች ከሁሉ ፍጥረት /2/
ስለያዘች እሳተ መለኮትን/4/

VERSE 156
(ስላላቃጠላት)
1082.ተወልዳለችና
ተወልዳለችና የጌታ እናት የእኛ መደኃኒት
አናወድሳት እናመስግትናት እንውደዳት/2/

VERSE 157
የአዳምን ሕይወት /4/ ኸኸ
አዳም ሲሠደድ ከጥንት ርስቱ
ትርጉም፡- አንተ ነህ አባታችን አንዲሁም
አናታችን በቤትህ ውስጥ ያሳደከን በአርዓያህና

VERSE 158
በምሣሌህ  ስለፈጠርከን  በወንጌልሀም ቃል
አንደነገርከንና- አንዳስተማርከን አቤቱ ዛሬም
ትርጉም፡- የዜማን መሠረት ጀመረ ያሬድ ካህን ያሬድ
ካህን ድምጽ ያማረ ነው

VERSE 159
ዜኖኩ ጸድቀከ
ትርጉም፡-', '/memhr/ yeyoሐns rasn kemiyasqorx ylq
meሐlawn bibela beteshalew neber
12.leyoሐns anget
leyoሐns anget leteqorexew

VERSE 1
saybedl tasro leteseqayew
trgum፡- yeherodyada lj mexachna endih
alechw kbur yehonewn yewengielawiw yeyoሐnsn
ras bewecit adrgeh sxegn alechw

VERSE 2
trgum፡- yekebere yelዑl nebiy yoሐns hoy
menoriyaw begedam yehone yeselam sew new
yemesqel mezmurat
/lemeskerem 16 - 25 qen/

VERSE 3
trgum፡- kemesqelu werdo lehulu abera
trgum፡-
26.bemesqelke
trgum፡- bemesqelh ardan beኃylh tematsnenalna

VERSE 4
trgum፡- kbur yehone ዕፀ mesqelh bemesqelh ኃyl
smh ymesegen zend lዑl amlak hoy leante
lebchah msgana yemigebaw smhn kef kef adergewalehu
trgum፡- nebiyu enbaqom teamratun yadeneqew

VERSE 5
mesqel ngሥt ዕlieni felegechw
trgum፡- zarie lewegenochie bemesqelie aberalehu
trgum፡- mesqel ኃylachn new mesqel brtatachn
new mesqel biezachn new leegna lemnamnew

VERSE 6
medኃnitachn new
trgum፡- axanu yameleketew mesqel begolgota tegegne
370bemesqelu webeqalu
bemesqelu webeqalu /2/

VERSE 7
aዕbeyomu leabewine /4
trgum፡- bemesqeluna beqalu abatochachnn kef kef
aderegachew
38bewengielu yamenachhu

VERSE 8
bewengielu yamenachhu /2/
enkan lebrፃne mesqelu aderesachhu /2/
39. ybielomu iyesus
ybielulomu iyesus leayhud amenu bye

VERSE 9
weeamenu beabuye aberh /2/ bemesqelye
trgum፡- iyesus ayhudn zaries bemesqelie lewegenochie
aberalehuna beanie amenu beabatiem amenu alachew
49. ኃylne wetsewenne

VERSE 10
ኃylne wetsewenne wemogesne (2) /2/
trgum፡- ኃylachn mexegiyachn mekiyachn yh
mesqel new
‹«. beኃyle mesqelu

VERSE 11
beኃyle mesqelu /4
dl honew wedequ agannt bemulu
zemru hulachhu leኃyle mesqelu
dl mensha newna lamenebet hulu

VERSE 12
trgum፡- bietekrstiyan yekrstos mesqel leegna
lemnamn yebaሕr tsexta yemerkeboch wedeb new
tlalech
44faኀberu qal

VERSE 13
ኀberu qale nebiyate/2/
weybielo mesqel brሃne /2/ lekulu ዓlem /2/
trgum፡- nebiyat beand qal tenagrew
mesqel leዓlem hulu brzan new alu

VERSE 14
45. yom beዓle mesqelu
yom beዓle mesqelu besemayat belaዕlu /2/
wezenegሠ bemdr (2) leaሕzab /2/
trgum፡- zarie kemdr kef bale besemayat

VERSE 15
yemesqel beዓl new bemdrm leaሕzab
yenegeሠbet new
trgum፡-
trgum፡-

VERSE 16
trgum፡-
trgum፡-
trgum፡- yesemayna mdr ngሥt
yehonshe yeamebietachn yetsgie

VERSE 17
mezmur tefetseme:፡:
72. kemaha ኀzen
kemaኀ ሐzen wetesdo sobe bekuletie rekebo /2/
reyo leybki ayne lb zebo /#/

VERSE 18
trgum፡- endeersua ሐzen mekera biyagegnew noro lb
yalew sew keኀzenu balteqoxebe
neber፡፡
73. yom tselelu

VERSE 19
yom tselelu melaekt laዕle maryam welaዕle
welda krstos bedebre qusquam /2/
anzeyblu sbሐt /2/ bearyam
sbሐt bearyam /2/

VERSE 20
trgum፡- eneho melaekt maryam kelji
gar bequsquam terara lay keleluat
beagziabሔr besemay msgana
awnetm bemdr yhun

VERSE 21
74 meazahomu leqdusan
meazahomu leqdusan kemetsgie degolat zewste qolat /2/
tsegeyu qenmos mosle nardos /4
75. nዒ rgbye

VERSE 22
nዒ rgbye wenዒ ሠnaytye /2/
trgum፡- maryam begiyorgis ngሥ /kbru/
gizie yeabeba zewdu nat yekb
yengሥna aklil nat yeabeba

VERSE 23
zewd asua kbnet yalew
yewerq squr nat፡:
77. emne emne ni
amne amne ni /4

VERSE 24
beselam /2/ ni maryam /2/
anatachn ney ney /
beselam /2/ ney maryam /2/
78. aሠrgewa

VERSE 25
aሠrgewa lemdr aሠrgewa letsgie /2/
asme watu kbromu leqdusan
trgum፡- mdrn beabeba asgixat
trgum፡- mdrn beabeba asgiexat

VERSE 26
trgum፡- benebiyat af yetemesegensh
beሐwaryatm yetemesegensh nesh
84 ngሥte semayat
ngሥte semayat wemdr maryam dngl /2/

VERSE 27
tefetseme/ 4 maኅliete tsgie /2/
trgum፡- yesemay yemdr ngሥt yehonsh
amebietachn hoy yeanchi maኅliet
tsgie tefetseme::

VERSE 28
trgum፡- bewerq akl yeteshelemech amebietachn
yegiyorgis yesemaዕtnetu aklil abeba nat::
86. kemetsgie roman
kemetsgie roman kemetsgie /2/

VERSE 29
abebayie /2/ weladite amlak siሣy /2/
trgum፡- ende roman abeba yamarech yeamlak
anat maryam siሣy nat፡፡
87. bkyu ኅzunan

VERSE 30
bkyu ኅzunan zalyekmu sdeta lemaryam /2/
trgum፡- alqsu mዕmenan asbachhu
yemaryamn sdetuan /2/ maryam
trgum፡- lb ዓyn yalew sew yedngln

VERSE 31
lqso ayto biyaleqs agbab new፡:
9. wede mሥraq eyu
wede mሥraq eyu wede ፀሐy mewca
dngln kbebuat anbel ሃlie luya

VERSE 32
leamlak enat leazagnt /2/
trgum፡-
93. afenb
afenb matusala welde ፄnok ameafe lmlamie

VERSE 33
buruk afe melaekt /2/
qesme tsgie tsgie /2/
tsgieki ame amsak /2/
trgum፣፤ yeamlak anat emebietachn hoy

VERSE 34
yenb af yeፄnok lj yemihon
matusala ketebareke (keteqedese) lmlamie
melak af ljesh abeban qeseme
94 o dngl

VERSE 35
o dngl azekri rzaፃbe wetsmዓ /2/
trgum፡- keenqu bemiyabera aklil yeteshelemech
amebietachn yegiyorgis aklil
trgum፡- and gizie bejerbash and gizie begonsh

VERSE 36
/2/
/2/
ሕፃnn bemazel /ሇ dekemsh maryam bebzu /2/
trgum፡-

VERSE 37
trgum፡-
trgum፡- yeorit qal yalebat tabotn
fetsmew bewerq ygardital፡፡
trgum፡- bekahnat yetaxerech

VERSE 38
bemenfes qdus
yetekelelech yeegziabሔr yeሕgu
tabot tsyon hoy
nguሥsh lexelat

VERSE 39
ayshenefm hagernm
aytewatm፡፡
trgum፡- nguሥ dawit ዓynn yeminፀbarq
yekbr lbs sebso keሕg

VERSE 40
tabot fit amesegene፡፡
trgum፡- krstos meሠretsh yehone bie/k
yetsdq ፀሐy yaberalshal
lesemaዕt besbket

VERSE 41
yeteshelemshlachew፡፡
trgum፡- yemusie tslat yesina eፀ phaxos
yearon
trgum፡- musie yayat

VERSE 42
bedebre sina yelemelemech ዕፅ/2/
trgum፡- selamawit yehonech
qdst tsyonn musie ayat፡፡
trgum፡- alem sayfexer yenebere

VERSE 43
ዓlemn asalfo yeminor
trgum፡- besemaym bemdrm
bedawit qal yamesegnalu፡፡
trgum፡- eske ዓlem meceresha dres belayachew

VERSE 44
ymesgen zend yeteleyo nebiyat
trgum፡- tsyon yetebalech qdst
dngl maryam yesemaዕtat anatachew
yemelaዕkt aኅtachew nat፡፡

VERSE 45
208.ezrani tenagera/2/
azrani tenagera/2/
tenagera dawit zemera tenagera dawit/2/
209zerዕye

VERSE 46
zerዕye teqwame maኅtot/2/
zekaryas kahn nebiy wesemaዕt/2/
trgum፡- meqrezn yaye nebiyat kahn yehone
trgum፡-yexbeb sewoch

VERSE 47
leamanuiel ysegdu zend
bekokeb ayetemeru mexu
211.begole enssa
begole enssa /2/

VERSE 48
begole enssa tewelede amanuiel/4/
trgum፡
beenssat beret amanuiel tewelede
212.wste maኅፀne

VERSE 49
wste maኅፀne dngl ኀdere maኅፀne
dngl/ri/
semay wemdr zeiyagemro semay wemdr
bemay texemeqe

VERSE 50
trgum፡-
semayna mdr yemuaychlut amlak
beamebietachn maኅፀn adere bewኃm
texemeqe

VERSE 51
trgum፡-
ዓlemn lemadan mexa andnetunm
ysxen zend aj mensham yaqerbu
zend

VERSE 52
trgum፡- mdrm ayechw amesegenechew
baሕrm segedechlet
trgum፡- yebekur ljin weledech
yedemena megareja garedat

VERSE 53
trgum፡-
weld krstos wede wenz lixemeq werede
220.weqdsat
weqdsat menfes

VERSE 54
wehabene maye mentsie ziane
trgum፡ menfes qdus bemeqdes
leኃxiatachn manca wኃn sexen
221.beede yoሐns

VERSE 55
trgum፡- nazrawi iyesus krstos
beyoሐns ej texemeqe
trgum፡- iyesus wede asiey hager hede
yoሐnsm bewኃ axemeqew

VERSE 56
agnanm kewኃ dagmegna weleden
trgum፡- ende ሕፃn hono betnsh
betnshu adege beyordanos
wenz beyoሐns ej texemeqe

VERSE 57
trgum፡- zexena zexegnun negede melaektn tto
bebaሕr mekakel qome
trgum፡- medኃnitachn eneho tewelede
medኃnitachn texemeqe

VERSE 58
ahunm eneho selamn enketelat
229.aman beaman
trgum፡-aewnet ewnet yekrstos
meweled mexemeq asdenaqi new

VERSE 59
trgum፡- yenebere bemaዕkele ዓlem yale
trgum፡- gietachn medኃnitachn keegna tesewro
yeneberew ahun tegelexe beqana gelila
wኃwn weyn xej

VERSE 60
bemadreg teamratn aderege
232.krstos tewelede
krstos tewelde wetexemeqe /2/
asterayotu aman asetreyotu /4/

VERSE 61
trgum፡- iyesus kretstos tewelede
texemeqem beawnet megelets awnet new
233.yoሐnsni
yoሐnsni ሃlo yaxemq/2/

VERSE 62
beፄnon beqrube ሣliem/4/
trgum፡- beyoሐns beiyerusaliem aqrabiya
beyordanos yaxemq neber
234.sobe metsa

VERSE 63
sobe metsa qal amsemay letenabbo''2/
kebebo /4/ lemay baሕr ned bemay kebebe/4/
trgum፡- qal kesemay lemenager bemexa
gizie esat yeyordanosn baሕr kebebew

VERSE 64
wኃwm yemihedbet bota xebebew
235.yom semayawi
yom semayawi begol sekebe
lezetewelde emqdst dengl/2/

VERSE 65
reywo nolot/2/ aekutwo melaekt /2/
trgum፡- eneho zarie semayawi nguሥ
beberet tegna keqdst dngl
trgum፡- besemayat leagziabሔr

VERSE 66
bemdrm lesew ljoch selam yhun
237.wetsa wegeba
wetsa wegeba beselam /ri2/ wegeba beselam/2/
trgum፡-beselam wexto beselam geba

VERSE 67
238.nu nansosu
bebrሃnu nu nansosu
bebrሃnu nu nansosu
trgum፡- bebrሃnu enmelales

VERSE 68
239.metsa qal
metsa qal emdemena zeybl/2(/(2)
zntu watu weldye zeafeqr/4/
trgum፡ yemwedew ljie yh new

VERSE 69
yemil qal kedemena mexa
240.felege yordanos
felege yordanos yeemnetachn xaamu
lekrstiyan tarik anchi nesh meqdmu

VERSE 70
qdst/3/ yordanos hoy yegieta hageru
ab weld menfesqdus beanchi lay aderu
241.qdus
qdus /3/ alfa ሕyaw amlakachn kbru

VERSE 71
ysfa/2/
asy texemeqeln agna andaxefa
242.yemsrach
yemሥrach texemeqe esy /2/(2)

VERSE 72
yeዓmlem bieza /2/ yetsdq ፀሐy /2/
texemeqe amlak adonay /2/
trgum፡- ayewat bietekrstiyann
trgum፡- kahnna nebiy yehone yoሐns

VERSE 73
mexmq keኃyl wede ኃyl
bemenfes yshegageral
261.nunu endeset
nu nu andeset/2/

VERSE 74
gieta texemeqe/4/ texemeqe bemaye yordanos/2/
262.iyerusaliem
iyerusaliem/3/ behon gieta siweled bayen
ande yosief wey ende selomie behon/2/

VERSE 75
and aregnoch wey seba segeln behon/2/
263.yom fሥሐ
yom fሥሐ kone beante ldetu lekrstos/2/
am qdst dngl/2/ wetu iyesus

VERSE 76
krstos/ኃ/
264.tewelde
tewelde iyesus bebietelሔm/2/ zeyhuda
bebietelሔm/ri2/

VERSE 77
trgum፡- befrd endemayadala ewequ
trgum፡-motma lemimotew sew ygebawal
yemaryam mot gn /2/
bexam yasgermal/2/

VERSE 78
trgum፡-
trgum፡-
trgum፡-awnet beewnet/4/
ayalqm qalkidansh/4/

VERSE 79
397. amaljin keljsh
trgum፡- yalebego ሥra yemntsedq mengሥte
semayatn yemnwers kalhone amebietie qdst
dngl maryam hoy qal kidan kidansh lekentu

VERSE 80
nebern
400. kidanki kone
kidaneki kone/4/
leኃxan tesfane/2/ kidanki kone/4/

VERSE 81
trgum፡- yemሕret kidan yalesh amebietachn
leኃxan tesfachew nesh፡፡
trgum፡- bealete mፅat gizie kidansh
befexari fit bieza yhun፡፡

VERSE 82
402. ney ney maryam
ney maryam weladite amlak yetsadqan
amebiet yemelaekt eht/2/
hulachhu amenuat kelb amalaj natna beewnet

VERSE 83
anamesgnat anawedsat amalaj kidanemሕret/ri2/
trgum፡- yetaweqech yedኅnet qen yemtmexaytu
yeabatachn dawit mengሥt burkt nat
trgum፡-keሕፃnat andebet msganan azegajh yexelat

VERSE 84
diyablos mkrun tafers zend
trgum፡-keminedew asat kenebelbalu awexan/2/
trgum፡- tnሣiehn lemnamn leegna brፃnn
lakln

VERSE 85
trgum፡- krstos leegna leኃxan medኃnitachn
trgum፡- krstos teneሣ kemutan betalaq ኃyl
betalaq ሥlxan seyxan asro adamn netsa awexaw
keengdih yhun selam

VERSE 86
trgum፡- wede abatu arege menfesqdusnm lakeln
650.ዐrege besbሐt
ዐrege besbሐt /2 wste ሠmayat /2
wenebere beyemane abuhu dagm ymetse besbሐt

VERSE 87
trgum፡- egebalehuna wedebotawa maኅdere sbሐt
biete agziabሔr beemnetm qal
bedestam zemru yemaryam qdst
ldetuan yemiyakebru

VERSE 88
673.amሐna weiyaqiem /4/
ala berukabie zebeሕg /2
674.ዓmde esat tsorki /4/
o maryam /3/ menkr ldetki

VERSE 89
675.aman beaman /4/
teweldet amebrሃn /4/
676.yemsrach teweledech esey esey
trgum፡- yelebshm newr mnm belaysh lay/2

VERSE 90
wci kelibanos eኅtye merዓt /4
681.kelibanos
kelibanos kelibanos keljsh gar ney
ame adonay kelibanos wedeegna ney

VERSE 91
xbeqash zewetr kelibanos
andayleyegn ››
beሔdkubet hulu ››
trgum፡- yeiyaqiem lj yedawit zemed nat

VERSE 92
685.ሐmelmalawit /6
musie zzereya/2 bedebre sina /2 maኅdere sbሐt /2
686.. iyaqiem weኸna enat abatsh biete egziabሔr
wesdew selet yesexush mena kedemena

VERSE 93
yeweredelsh ftsum dngl yehonesh
trgum፡- maryam ntsሕt dngl tamagn
amlakn yeweledsh yemሕret amalaj nesh
lesew lj hulu /2/

VERSE 94
trgum፡- lemgnln maryam lemgnln/2/
yentsuሐn aklil/2/ lemgnln/2/
700.selam eleki/6
selamawit maኅdere sbሐt

VERSE 95
selamawit debremedኃnit
701. kone yom/2/ beente ldeta lemaryam/2/
keme tbiezu nebiyate wetsadqan nebiyate keme tbieku/qua2/
7025. yom fሥሐ kone beante ldeta lemaryam

VERSE 96
amሐna weiyaqiem keme tbiezu nebiyate wetsadqane aman
teweldet amebrፃn
702 -ha-. sealulene ሐna weiyaqiem/2/
zeweledkmwa ledngl maryamሃ''4/

VERSE 97
lemnuln ሐna weiyaqiem/2/
anatna abatua yedngl maryam
702-le-asey teweledech bezariewa ዕlet dngl maryam
yeamlak enat /2/

VERSE 98
yemsrach ell belu yeadam ljoch hulu
yemsrach ell belu krstiyanoch hulu
702 -ሐ- ሐnana iyaqiem beslet yagegnush/2/
dngl enatachn bexam des ybelsh /2/

VERSE 99
lemedan mknyat yehonechw enat /2/
trgum፡- leemebietachn gebriel
abeሠrat
andihm alat nguሥ tweljalesh

VERSE 100
706.wetu rufaiel
wetu rufaiel wetu melake ኃyl
lዑl watu lዑl menber
ysal lene ysal leityophya

VERSE 101
trgum፡- yeኃyl melak rufaiel new
agnan yxebqen hagerachnn ityophya
yrdaln
trgum፡- qalh aregagagn atsenagn slezih awqie

VERSE 102
anten felekuh
709.ruhruh
ruኅruኅ melak nehna lehulu yemtrara/ri2/
gebriel azagnu ente awxan kemekera/4/

VERSE 103
yemiyasaddugn gebriel siqomu kefitie
trgum፡- gebriel lemenager tru lሣn
sxegn /andebet sxegn/ menfes
qdusn asadrbgn yebrፃn

VERSE 104
megonaፀfiya adngonaፀf bemeljah
teradan
711.gebriel
gebriel amalden keamlakachn /2/

VERSE 105
andanxefa endanmot benefsachn
aderahn qumln kegonachn /2/
712. yebrሃnat aleqa
yebrሃnat aleqa yegieta balemual liqe

VERSE 106
melaekt /2/
nዓ raguiel /4/ raguiel megabie
brሃnat/2/ ኸኸ/2/
trgum፡- rucachew kenefas yfexnal

VERSE 107
718.gebriel mlani
trgum፡- ዓwde ዐmetu ybarek zend raguiel
melak wede amlak tselye /lemn/
trgum፡- ዑraiel werufaiel hoy betሕtnana

VERSE 108
betselot wede egziabሔr lemnuln
yeqdusan tsadqan mezmurat
726.ሐwaryaw
trgum፡- abatochie neakuto leab

VERSE 109
ymrሃne krstos
qdus lalibela kenexaqi anbesana tekula
xebqugn
743. yeqdusan beዓt

VERSE 110
lbuna yemimesx meዓza axanua
ኅlinan ygezal zmarie dguawa
trgum፡- bemdr yewaሃn yehonu yebrzan
ljoch

VERSE 111
trgum፡- yegebre menfes qdus lbsachew ende shtu
yamare new degmom lbsachew endenec ሐr
new ersum wede genet yewerede new
752. yaried maኅlietay

VERSE 112
yaried maኅlietay leagziabሔr kahnu sbሐte tnሣie
zeyazienu orit totahnu wewengiel asaዕnu (2)
trdane nea behye mekanu keme ፀbel gዑzane ፀrne ykunu
(2

VERSE 113
(2
trgum፡- yecamah mazebiya /maseriya /orit yeegrh
mecamiya wengiel yehonena yetnሣien kbr
yemtastemr yeegziabሔr agelgay

VERSE 114
maኅlietawi yaried bezih bota tredan zend na
753.semaye beab
semaye beab webeweld aryame webemenfes qdus ኀbe
ዓregu ane (2

VERSE 115
semaዕku amelaakt zmarie beadnno webeatሕto bo
zeyatsሕsu webo zeyziemru (2)
trgum ፡- beab beweld bemenfes qdusm chernet
semay wexchie tsrሐ aryam dershie

VERSE 116
kemelaekt
zmarie (msgana) semahu keenersum
bezqtana betኅtna yemiyashebeshbu alu
zuriyawnm

VERSE 117
qomew yemizemru alu
trgum፡- ኃyln teamrn yemtaderg gebre
menfesqdus
qdus hoy knfachew benebelbal yehone

VERSE 118
yemiyasferu
melaekt surafielna kirubiel ewnet bemalet
yqebeleh zend zarie weredu
yesemaዕtat mezmur

VERSE 119
763.aman beaman
trgum፡- ewnet beawnet giyorgis
qdus new ende nefas tbiya beydres
terara betenut

VERSE 120
trgum፡- yeesatu negodguad yalasferah ሕፃnu qirqos
hoy yeeyandandachnn maኅber zarie bark
trgum፡- leqirqos yednkuan ሥra asayew bebrፃn
mseso tenegagerew yemelaekt ehtachew yesemaዕtat

VERSE 121
anatachew yedemena brፃnnat
783. aፀde weyn
aፀde weyn zeyaferh askale ሕywet /2/
keme tsgierieda /4/ asxifanos mlua fqr keme

VERSE 122
tsgiereda /2/
784. seale
trgum፡-
trgum፡- abietu smagn tselotien cuኸtiem wedeante

VERSE 123
tdres fithn keenie zend
atmelsbgn bemekerayie qen smagn
jorohnm  wedeaniek  bexerahuhm
ፅletm befxnet smagn

VERSE 124
818.yeሥlasien menber
yeሥlasien menber qdusan kebewt
kirubiel bedemena zufanun yzewt
dngln kemeሐl mikaieln kefit

VERSE 125
aelaf melaዕkt sisegdu befrፃt
ayut temelketut yesemayun dmqet
ayut temelketut yesemayun abat
yeሥlasien menber qdusan kebewt

VERSE 126
eyashebeshebu yesemay melaዕkt
kahnate semay qdus qdus qdus silu
yhn talaq kbr liyayu yetadelu
betsdq ሥrachew bemdr ytayalu/2/

VERSE 127
619.ሥlasien amesgnu
ሥlasien ameሥgnu/2/
yemdr fxretat zemru all belu/2/
besme ab weweld wemenfesqdus

VERSE 128
msgana ygebal kemnm befit
ዓlematn hulu lefexere gieta
msgana ygebal kexewat eske mata
kirubiel surafil yemiyamesegnut

VERSE 129
melaekt kesemay yemizemrulh
agnam yeadam ljoch enzemralen
besemaym bemdr anxerazalen
brab beሥlasie eaxegbalehugn

VERSE 130
bxemam beamlakie erekalehugn
trgum፡- msgana ygebal leab ዓlemn hulu leyaze
msgana ygebal leweld ዓlemun hulu lefexere/2/
msgana ygebal lemenfes qdus beyeዓmetu

VERSE 131
kremtn lemikeft/2/
850.awnetegna selam
awnetegna selam yalew kebieth new
ardegn alnawets alemnፃlehu/2/

VERSE 132
ኃxiatien sasbew lbie yceneqal
keante meleyetie nefsien adkmuatal
wedeante melsegn anie amelesalehu
awnetegn selam yalew kebieth new

VERSE 133
leqdasiew tselot zewetr endaltegahu
beadebabay qomie smhn andalxerahu
tesenekakyie wedqiealehuna
ardagn amanuiel beሃymanot ltsna

VERSE 134
ዓynie ዕnba yamenc lalqs sle ኃxiatie
yensሓ thun qeriwa ሕywetie
bemedanie seዓt bezariewa ዕlet
fqrhn asbie mexahu keante fit

VERSE 135
gieta hoy tsetsetien ዕnbayien teqebel
abath negn belegn aniem lj negn lbel
zeyt salazegaj dnget mexteኸbgn
berhn bemezgat kedejh atasqeregn

VERSE 136
651.gieta hoy lesmh
gieta hoy lesmh azemralehu
lዑl hoy lekbrh all alalehu
beante des ylegnl ሐsiet adergalehu /2/

VERSE 137
yebezaw mሕreth beenie lay tegelxo
yetnantu smie beante telewxo
moges slehonkegn kefith qomieyalehu
beawde mሕreth smkn axeralehu

VERSE 138
yaleqewn neger yeteqexerewn
trgum፡- anante yekrstiyan wegenoch hoy bezih qen
trgum፡-
dengl maryam meሠretoቿwa bemdr qrncafoቿ

VERSE 139
besemay yehonech ሐreg nat
897.smshn xerchie
smshn xerchie mechie afralehu
trgum፡-

VERSE 140
trgum፡-maryam ntsሕt dngl tamagn
amlakn yeweledsh yemሕret amalaj nesh lesew
lj hulu/2/
trgum፡- maryam tbelxalech kehulu fxret

VERSE 141
/2/
/2/
sleyazech asate melekotn/4/ (slalaqaxelat)
944.yenoኅ qal kidanu

VERSE 142
yenoኅ qal kidanu mlkt ዓrmaw
yemedanu mሥxir yeselam tesfaw
amebietie anchi neshe qestedemenaw/2/
anchi yearon betr sayteklat yadegech

VERSE 143
yemaksegno ersha yalezer yaferach
yesina ሐmelmal yetewaሕdo mሥxir
kbrt ambietie hagere egziabሔr/2/
yedawit mesenqo yaried tsnatsl

VERSE 144
yedekamoch mrkuz yeselomn akilil
selamie tesfayie yeሐzenie derash
yetsyon terara mesheshegiyie nesh/2/
yeielsaዕ maሠro cew yetegegnebsh

VERSE 145
yeሕzqiel raዕy ntsሕt adarash
anchi yeadam tesfa yemedanie bsrat
trgum፡- zewetr bebiete agziabሔr
eyeteqemexech

VERSE 146
sale ende fitegnaw yalhone melak tayat
965.mesobe werq
mesobe werq zemena egzatna maryam qdst
2.

VERSE 147
2.
qdste qdusan yblwa kahnat /4/
trgum mena yalebat yewerq mesob yehonechwn
amebietachnn maryamn kahnat

VERSE 148
keqdusan ylq qdst nesh eyalu
yameሠgnuatal፡፡
966. amebietie maryam
amebietie maryam hoy alemnshalehu

VERSE 149
keljsh amaljn /3/ kefitsh qomiealehu
abaksh amaljgn yeamlak anat dngl
mn giziem ayxefam/3/ keadam lj bedel
bedelach bzu new lmenachn tnsh

VERSE 150
mሕretn xeyquln /3/ dngl keljsh
967.wedajie hoy
wedejie hoy eneho wb nesh
trgum፡- ngሥtitu yewerq lbs tegonatsfa

VERSE 151
beqegnh tqomalech
973. sali lene maryam
trgum፡- kentsuሐn ntsuሕ hona besina endeneberech tabot
bentsሕna bebiete meqdes wsx norech mgbuam

VERSE 152
trgum፡- mena yalebsh yewerq mesob qdst
amebietachn maryamn kahnat keteleyu yeteleyech
yluatal፡፡
985 weenze tfetl

VERSE 153
weenze tfetl /2/ werqe wemielate asteraya
gebriel gbte /2/
weybiela weybiela asme rekebki mogese beኀbe
agziabሔr

VERSE 154
986. emebietachn leanchi
amebietachn leanchi selamta ygebashal/2/
kesietoch hulu /3/ temerxeshal
ayaregaguat yeሠmay melaekt /2/

VERSE 155
biete meqdes norech /3/ aሥra hulet ዓmet
trgum፡- dngl hoy yeሐwaryat moges yenebiyat
tnbit anchi nesh
1079..maryam

VERSE 156
trgum፡- lesewoch azagn lb yalat amebietie
1080.bemenu beamsale menu
bemenu beamsale menu nastemaslki/2
amebietie yeegna amalaj azagntua o dngl

VERSE 157
mlዕte wdasie /2
1081.maryam teዐbi
trgum፡- maryam tbelxalech kehulu fxret /2/
sleyazech esate melekotn/4/

VERSE 158
(slalaqaxelat)
1082.teweldalechna
teweldalechna yegieta enat yeegna medeኃnit
anawedsat enamesgtnat enwdedat/2/

VERSE 159
yeadamn ሕywet /4/ ኸኸ
adam siሠded kexnt rstu
trgum፡- ante neh abatachn andihum
anatachn bebieth wsx yasadeken bearዓyahna

VERSE 160
bemሣlieh  slefexerken  bewengielham qal
andenegerkenna- andastemarken abietu zariem
trgum፡- yezieman meሠret jemere yaried kahn yaried
kahn dmts yamare new

VERSE 161
zienoku tsedqeke
trgum፡-', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=nU9Bqi4_ZPk', 'draft', 'pending', 'https://www.youtube.com/watch?v=nU9Bqi4_ZPk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('knefe-rgb', 'ክነፈ ርግብ', 'ክነፈ ርግብ', 'knefe rgb', 'Ethiopian Orthodox Tewahedo Mezmur - ክነፈ ርግብ', 'ፃሌ ሃሌ ሉያ ክነፈርግብ በብሩር ዘግቡር /2/
ወገበዋቲሃኒ ሐመልማለ ወርቅ በሐመልማለ ወርቅ /2/
ትርጉም ፡:-', 'ፃlie ሃlie luya knefergb bebrur zegbur /2/
wegebewatiሃni ሐmelmale werq beሐmelmale werq /2/
trgum ፡:-', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=swmbn9kXWls', 'draft', 'pending', 'https://www.youtube.com/watch?v=swmbn9kXWls', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('knefe-rgb', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('rgeta-lemaryam-rgeta-wste-semayat', 'ዕርገታ ለማርያም ዕርገታ ውስተ ሰማያት', 'ዕርገታ ለማርያም ዕርገታ ውስተ ሰማያት', 'ዕrgeta lemaryam ዕrgeta wste semayat', 'Ethiopian Orthodox Tewahedo Mezmur - ዕርገታ ለማርያም ዕርገታ ውስተ ሰማያት', 'ወበዓታ ወበዓታ ውስተ ገነት /4/
ገነዝዋ ሐዋርያት/4/', 'webeዓta webeዓta wste genet /4/
genezwa ሐwaryat/4/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=KDHyQ3NkSBA', 'draft', 'pending', 'https://www.youtube.com/watch?v=KDHyQ3NkSBA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bebr-n-zufan-lay-yeqomut-egrochu-2', 'በብርሃን ዙፋን ላይ የቆሙት እግሮቹ /2/', 'በብርሃን ዙፋን ላይ የቆሙት እግሮቹ /2/', 'bebrሃn zufan lay yeqomut egrochu /2/', 'Ethiopian Orthodox Tewahedo Mezmur - በብርሃን ዙፋን ላይ የቆሙት እግሮቹ /2/', 'በችንካር ላይ ቆሙ ምንም ሳይሰለቹ /2/
የብርሃን አክሊልን ለሰማዕት ያደለ/2/
የሾክ አክሊል ደፍቶ ቀራንዮ ዋለ /2/
415. መስክሪ ቀራንዮ (1)

VERSE 1
መስክሪ ቀራንዮ መስክሪ ጎልጎታ
›› ›› ›› ሊቶስጥራ
የተቀበለውን የአምላክን መከራ/2/
ሊሰቅሉት ሲወስዱት መስቀል አሸክመው

VERSE 2
ስምዖን ቀሬናዊ ከመንገድ አገኘው(2)
ከድካሙ ብዛት ሳይሰሉት እንዳይሞት
ለቀሬናዊ ሰው ስሞዖን መስቀል አሸክሙት/2/
የአምላክን ትዕግሥት በማየት ተደንቆ

VERSE 3
ጴላጦስ ጠየቀው እንዲፈታው አውቆ /2/
ጌታም መለሰለት ከላይ ካልተሰጠ
በአኔ ላይ ልትፈርድ አንዳች ኃይል የለህ/2/
ስቀለው እያሉ ባንድ ላይ ሲጮሁ

VERSE 4
ጴላጦስ ጨነቀው የሚያደርገው ጠፋው//ሪ2/
ከደሙ ንጽሕ ነኝ በማለት ታጠበ
የጌታን ንግግር ቃሉንም አሰበ/2/
መከራ መስቀልህ ሲነገር ይጨንቃል ነፍስም

VERSE 5
ትርዳለች ሥጋንም ይዳከማል/2/
ድካምህን ሁሉ ከንቱ እንዳላደርገው
በንስሓ እንባ ኃጢአቴን እጠበው /
416.መስክሪ ቀራንዮ /2/

VERSE 6
መስክሪ ቀራንዮ ንገሪን ጎልጎታ
ካሳ እንደሆነልን እንዳዳነን ጌታ/2/
በአምላክነቱ ፈጥሮ ዓለማትን
ሥጋን መዋሐዱን ሰዎችን ለማዳን

VERSE 7
ክብሩን ዝቅ አደርጎ በታላቅ ትኅትና
ለፍርድ ሲወስዱት ሊቀበል መከራ
መስቀል ተሸክሞ ሲወጣ ተራራ
አይሁድ በየተራ ሲገርፉት ሲያዳፉት', 'bechnkar lay qomu mnm sayselechu /2/
yebrሃn akliln lesemaዕt yadele/2/
yeshok aklil defto qeranyo wale /2/
415. meskri qeranyo (1)

VERSE 1
meskri qeranyo meskri golgota
›› ›› ›› litosxra
yeteqebelewn yeamlakn mekera/2/
liseqlut siwesdut mesqel ashekmew

VERSE 2
smዖn qerienawi kemenged agegnew(2)
kedkamu bzat sayselut endaymot
leqerienawi sew smoዖn mesqel ashekmut/2/
yeamlakn tዕgሥt bemayet tedenqo

VERSE 3
phielaxos xeyeqew endifetaw awqo /2/
gietam meleselet kelay kaltesexe
beanie lay ltferd andach ኃyl yeleh/2/
sqelew eyalu band lay sicohu

VERSE 4
phielaxos ceneqew yemiyadergew xefaw//ri2/
kedemu ntsሕ negn bemalet taxebe
yegietan nggr qalunm asebe/2/
mekera mesqelh sineger ycenqal nefsm

VERSE 5
trdalech ሥganm ydakemal/2/
dkamhn hulu kentu endaladergew
bensሓ enba ኃxiatien exebew /
416.meskri qeranyo /2/

VERSE 6
meskri qeranyo ngerin golgota
kasa endehoneln endadanen gieta/2/
beamlaknetu fexro ዓlematn
ሥgan mewaሐdun sewochn lemadan

VERSE 7
kbrun zq adergo betalaq tኅtna
lefrd siwesdut liqebel mekera
mesqel teshekmo siwexa terara
ayhud beyetera sigerfut siyadafut', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=hsnTjwnrWJ4', 'draft', 'pending', 'https://www.youtube.com/watch?v=hsnTjwnrWJ4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gbzoch-enderasachew-mesluachew', 'ግብዞች እንደራሳቸው መስሏቸው', 'ግብዞች እንደራሳቸው መስሏቸው', 'gbzoch enderasachew mesluachew', 'Ethiopian Orthodox Tewahedo Mezmur - ግብዞች እንደራሳቸው መስሏቸው', 'ምራቅ እየተፉ በፊትህ ቀለዱ አንተን ሊጎዱ/2/
በመሰቀል ላይ ተጠማሁ ስትል ታላቅ በደል
ሀሞትና ከርቤ ሰጡህ ቀላቅለው ጠጣ ብለው/2/
ይቅር ባይ ግልጽ በደላችንን ሁሉ ሳታይ

VERSE 1
አንተ ቅር በለን በእኛ ሳትከፋ እንዳንጠፋ /2/
422. በዕጸ መስቀል ላይ
በዕጸ መስቀል ላይ በዚያ አደባባይ
አምላክ ሆይ ጌታ ሆይ ተንገላታ ወይ

VERSE 2
መከራ አየህ ወይ
መስቀል አስይዘው ኪራያላይሶን
ወደ ጎልጎታ
ሲገራፉ ሲዳፉ

VERSE 3
ስትንገላታ
ያንን አቀበት ኪርያላይሶን
ያንን ዳገት
ጀርባህ ተገርፎ

VERSE 4
ስትቃትት
አንተን እያዩ ኪርያላይሶን
ሴቶች ሲያለቅሱ
አናቶች ቀርበው

VERSE 5
ላብህን ዳበሱ
መስቀል አስይዘው ኪያላይሶን
አንዲያ ሲያዳፉህ
የቀሬናው ሰው

VERSE 6
ስምኦን አገዘው
423. ለእኛ ብሎ ተንገላታ
ለእኛ ብሎ ተንገላታ የሁላቸን ጌታ
አዳም ቅጠል በልቶ ባመጣው በሽታ/2/

VERSE 7
አምላክ ዋለ ቀራንዩ ለብሶ ከለሜዳ
አዳም ሕግ አፍርሶ በጎተተው ዕዳ/2/
ለመስቀሉ ተሰለፈ እየተገረፈ
በዕጽ ሊፈውሰው በዕጽ ላይ አረፈ/2/', 'mraq eyetefu befith qeledu anten ligodu/2/
bemeseqel lay texemahu stl talaq bedel
hamotna kerbie sexuh qelaqlew xexa blew/2/
yqr bay glts bedelachnn hulu satay

VERSE 1
ante qr belen beegna satkefa endanxefa /2/
422. beዕtse mesqel lay
beዕtse mesqel lay beziya adebabay
amlak hoy gieta hoy tengelata wey

VERSE 2
mekera ayeh wey
mesqel asyzew kirayalayson
wede golgota
sigerafu sidafu

VERSE 3
stngelata
yann aqebet kiryalayson
yann daget
jerbah tegerfo

VERSE 4
stqatt
anten eyayu kiryalayson
sietoch siyaleqsu
anatoch qerbew

VERSE 5
labhn dabesu
mesqel asyzew kiyalayson
andiya siyadafuh
yeqerienaw sew

VERSE 6
smon agezew
423. leegna blo tengelata
leegna blo tengelata yehulachen gieta
adam qxel belto bamexaw beshta/2/

VERSE 7
amlak wale qeranyu lebso kelemieda
adam ሕg afrso begotetew ዕda/2/
lemesqelu teselefe eyetegerefe
beዕts lifewsew beዕts lay arefe/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=XKrexNh9CFs', 'draft', 'pending', 'https://www.youtube.com/watch?v=XKrexNh9CFs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wey-gudat-wey-gudat', 'ወይ ጉዳት ወይ ጉዳት', 'ወይ ጉዳት ወይ ጉዳት', 'wey gudat wey gudat', 'Ethiopian Orthodox Tewahedo Mezmur - ወይ ጉዳት ወይ ጉዳት', 'ንጊዜ ከገነት ሲወጡ በጥፋት
ሲገፈፍ ክብራቸው
መጣላት ጀመሩ እርስ በራሳቸው
አንቺ ነሽ አንተ ነህ ሆነ ነገራቸው

VERSE 1
ነገር ግን አይጠቅምም መነዛነዛቸው
ወይ በደል ወይ ጉዳት', 'ngizie kegenet siwexu bexfat
sigefef kbrachew
mexalat jemeru ers berasachew
anchi nesh ante neh hone negerachew

VERSE 1
neger gn ayxeqmm menezanezachew
wey bedel wey gudat', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=MeBvEdCQLVo', 'draft', 'pending', 'https://www.youtube.com/watch?v=MeBvEdCQLVo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('wey-gudat-wey-gudat', 'repentance', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemesqel-lay-hono-ljsh-singegelata-2', 'በመስቀል ላይ ሆኖ ልጅሽ ሲንገገላታ/2/', 'በመስቀል ላይ ሆኖ ልጅሽ ሲንገገላታ/2/', 'bemesqel lay hono ljsh singegelata/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በመስቀል ላይ ሆኖ ልጅሽ ሲንገገላታ/2/', 'የግፍ ግፍ ደርሶበት የዛን ጊዜ', 'yegf gf dersobet yezan gizie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=czaTE1TC6FQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=czaTE1TC6FQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('staleqsh-bemayet-yeziyan-gzie-rarto-ljsh', 'ስታለቅሽ በማየት የዚያን ግዜ ራርቶ ልጅሽ', 'ስታለቅሽ በማየት የዚያን ግዜ ራርቶ ልጅሽ', 'staleqsh bemayet yeziyan gzie rarto ljsh', 'Ethiopian Orthodox Tewahedo Mezmur - ስታለቅሽ በማየት የዚያን ግዜ ራርቶ ልጅሽ', 'ዮሐንስን አጽናኝ እንደልጅ ሠጠሽ /2/
428. አለምን ለማዳን', 'yoሐnsn atsnagn endelj ሠxesh /2/
428. alemn lemadan', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=TvvRy_hxf6A', 'draft', 'pending', 'https://www.youtube.com/watch?v=TvvRy_hxf6A', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nefsun-lewedaju-yemisex-bigegnm', 'ነፍሱን ለወዳጁ የሚሰጥ ቢገኝም', 'ነፍሱን ለወዳጁ የሚሰጥ ቢገኝም', 'nefsun lewedaju yemisex bigegnm', 'Ethiopian Orthodox Tewahedo Mezmur - ነፍሱን ለወዳጁ የሚሰጥ ቢገኝም', 'ነፍሱን ለወዳጁ የሚሰጥ ቢገኝም', 'nefsun lewedaju yemisex bigegnm', 'amharic', 'mezmur', 'ዘማሪት ፋንቱ ወልዴ', 'https://www.youtube.com/watch?v=AxsFSgjPwMc', 'draft', 'pending', 'https://www.youtube.com/watch?v=AxsFSgjPwMc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('med-nit-krstos-beanchi-tengelata-2', 'መድኃኒት ክርስቶስ በአንቺ ተንገላታ/2/', 'መድኃኒት ክርስቶስ በአንቺ ተንገላታ/2/', 'medኃnit krstos beanchi tengelata/2/', 'Ethiopian Orthodox Tewahedo Mezmur - መድኃኒት ክርስቶስ በአንቺ ተንገላታ/2/', 'መስክሪ አንቺ ምድር ግዑዚቷ ሥፍራ
መድኃኒት ክርስቶስ ያየብሽን መከራ/2/
ደሙ እንደውኃ ሲፈስ መስቀሉኃ2/
በቀራንዮ ቦታ መከራውን ሲያይ/2/

VERSE 1
ፀሐይ ከለከለች ደማቅ ብርሃኗን /2/
ለመሸፈን ብላ የአምላክን እርቃን/2/
በመስቀል ተሰቅሎ ፍቅሩን ገለጸው /2/
በመስቀል ላይ ሆኖ ተጠማሁ አያለ /2/

VERSE 2
የሾህ አክሊል ደፍቶ ቀራንዮ ዋለ /2/
አጆቹን እግሮቹን በችንካር ተመተው/2/
ቸሩ መድኃኔዓም አባክህ ማረን/2//
ደካሞች ነንና እንዳንቀር ጠፍተን/2/

VERSE 3
በቆረሰከው ስጋ ባፈሰሰከው ደም/2/
አቤቱ ተራዳ እስከ ዘላለም/2/', 'meskri anchi mdr gዑzitua ሥfra
medኃnit krstos yayebshn mekera/2/
demu endewኃ sifes mesqeluኃ2/
beqeranyo bota mekerawn siyay/2/

VERSE 1
ፀሐy kelekelech demaq brሃnuan /2/
lemeshefen bla yeamlakn erqan/2/
bemesqel teseqlo fqrun geletsew /2/
bemesqel lay hono texemahu ayale /2/

VERSE 2
yeshoh aklil defto qeranyo wale /2/
ajochun egrochun bechnkar temetew/2/
cheru medኃnieዓm abakh maren/2//
dekamoch nenna endanqer xeften/2/

VERSE 3
beqoresekew sga bafesesekew dem/2/
abietu terada eske zelalem/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=hq8LkobA178', 'draft', 'pending', 'https://www.youtube.com/watch?v=hq8LkobA178', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdusan-ejochh-yefixgn-tasrew', 'ቅዱሳን እጆችህ የፊጥኝ ታስረው', 'ቅዱሳን እጆችህ የፊጥኝ ታስረው', 'qdusan ejochh yefixgn tasrew', 'Ethiopian Orthodox Tewahedo Mezmur - ቅዱሳን እጆችህ የፊጥኝ ታስረው', 'አደበግ ጎተቱህ ልትምራቸው
የትም ቦታ ያለህ ሁሉን የምታውቅ
ፊትህን ሸፈኑህ ለመመጻደቅ', 'adebeg gotetuh ltmrachew
yetm bota yaleh hulun yemtawq
fithn shefenuh lememetsadeq', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=xNQdLgu5JtA', 'draft', 'pending', 'https://www.youtube.com/watch?v=xNQdLgu5JtA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dnq-rawnm-lea-zab-ngeru', 'ድንቅ ሥራውንም ለአሕዛብ ንገሩ', 'ድንቅ ሥራውንም ለአሕዛብ ንገሩ', 'dnq ሥrawnm leaሕzab ngeru', 'Ethiopian Orthodox Tewahedo Mezmur - ድንቅ ሥራውንም ለአሕዛብ ንገሩ', 'ድንቅ ሥራውንም ለአሕዛብ ንገሩ
በዝናብ አብቅሎ በፀሐይ አብስሎ
ይመግባልና ሁሉን አስተካክሎ
አትወድምና የሰው ልጆችን ጥፋት

VERSE 1
አቤቱ ጸሎቴን ስማ በያሬዳዊ ዜማ
1016.ተናገሩ
ተናገሩ ድንቅ ሥራውን መስክሩ /2/
ተአምሩን ለዓለም ንገሩ (23) ድንቅ ሥራውን

VERSE 2
መስክሩ /2/
1017ለጌታዬ ለእግዚአብሔር
ለጌታዬ ለአግዚአብሔር ስላደረገልኝ ምን
አከፍለዋለሁ /2/

VERSE 3
ተመስገን ነው አንጂ /2/ ሌላ ምን አላለሁ /4
101.የተዘጋች መቅደስ
ወዳጄ ሆይ እነሆ ውብ ነሽ', 'dnq ሥrawnm leaሕzab ngeru
beznab abqlo beፀሐy abslo
ymegbalna hulun astekaklo
atwedmna yesew ljochn xfat

VERSE 1
abietu tselotien sma beyariedawi ziema
1016.tenageru
tenageru dnq ሥrawn meskru /2/
teamrun leዓlem ngeru (23) dnq ሥrawn

VERSE 2
meskru /2/
1017legietayie leegziabሔr
legietayie leagziabሔr sladeregelgn mn
akeflewalehu /2/

VERSE 3
temesgen new anji /2/ liela mn alalehu /4
101.yetezegach meqdes
wedajie hoy eneho wb nesh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=uso2qQWYN60', 'draft', 'pending', 'https://www.youtube.com/watch?v=uso2qQWYN60', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bebedelie-bzat-2-ayteh-atxalegn-2', 'በበደሌ ብዛት /2/ አይተህ አትጣለኝ/2/', 'በበደሌ ብዛት /2/ አይተህ አትጣለኝ/2/', 'bebedelie bzat /2/ ayteh atxalegn/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በበደሌ ብዛት /2/ አይተህ አትጣለኝ/2/', 'ሳስበው በደሌ ብዙ ነው/ሪ/
በጨለማ ነፍሴን በላት ውድማ/2/', 'sasbew bedelie bzu new/ri/
becelema nefsien belat wdma/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ezoKsDcDhu0', 'draft', 'pending', 'https://www.youtube.com/watch?v=ezoKsDcDhu0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lem-amrot-hede-tsegawn-tewena-2', 'ዓለም አምሮት ሄደ ጸጋውን ተወና''2/', 'ዓለም አምሮት ሄደ ጸጋውን ተወና''2/', 'ዓlem amrot hede tsegawn tewena''2/', 'Ethiopian Orthodox Tewahedo Mezmur - ዓለም አምሮት ሄደ ጸጋውን ተወና''2/', 'የአግዚአብሔር ስጦታ ኅብስቱ ስልችቶት/2/
ዓለም አምሮት ሄደ ከተወው ባርነት/2/
የፈርዖን ጅራፍ አልታየው አለ
የአህል አምሮቱን ውርደቱን ከለለ/2/

VERSE 1
ግብፅ ልፄድ ብሎ አመጸ በአግዚአብሔር
መድርሱ አልገባውም ከከነዓን ሀገር/2/
የኪዳኑ ታቦት የሙሴ ገጽታ
ዓለም ስላማረው አደረገው ተርታ /2/

VERSE 2
የአምላክን ካህነት የአሮን ሥርዓት
በዓለም ለወጠው ትልቁን አምኃ/2/
የኅብረቱን ጉዞ በፍቅር የፄደው
የማኅሌት ደስታ አስራኤል ታከተው/2/

VERSE 3
የአግዚአብሔርን ድንኳን ደመና ያጀባት
የኪዳኑን አርማ በበረፃ ተዋት/2/
ዛሬም ይህ ትውልድ እስራኤልን ሆኗል
ቤክርስቲያኑን አምላኩን አረስቷል/2/

VERSE 4
ግብጽና ባቢሎን አጓጉተው ወስደውት
ወርቁን ከእጁ ጣለ መዳብ አስጎምጀጅቶት/2/
466. አዝናለሁ አለቅሳለሁ
አዝናለሁ አለቅሳለሁ

VERSE 5
ስለ በደሌ ሁልጊዜ አለቅሳለሁ
አዝናለሁ አለቅሳለሁ
ስለጥፋቴ ሁለጊዜ አለቅሳለሁ
ነገር ግን መሐሪ ነህና እንደምታድነኝ

VERSE 6
አምናለሁ/2/
ሥጋዬ ለራሱ እያታለለኝ/2/
ሁለን በመፈለግ ወሰደና ለጥፋት ሰጠኝ
ከመሬት ተገኝታ እመሬት ልትገባ/2/

VERSE 7
ከንቱ አስቀረችኝ ያሳሳች ሥጋ ሰገብጋባ /2/
ትቻት ልመጣ ነው አፈር ሥጋዬን
›»»› ›› መሬት ሥጋዬን', 'yeagziabሔr sxota ኅbstu slchtot/2/
ዓlem amrot hede ketewew barnet/2/
yeferዖn jraf altayew ale
yeahl amrotun wrdetun kelele/2/

VERSE 1
gbፅ lፄd blo ametse beagziabሔr
medrsu algebawm kekeneዓn hager/2/
yekidanu tabot yemusie getsta
ዓlem slamarew aderegew terta /2/

VERSE 2
yeamlakn kahnet yearon ሥrዓt
beዓlem lewexew tlqun amኃ/2/
yeኅbretun guzo befqr yeፄdew
yemaኅliet desta asraiel taketew/2/

VERSE 3
yeagziabሔrn dnkuan demena yajebat
yekidanun arma bebereፃ tewat/2/
zariem yh twld esraieln honual
biekrstiyanun amlakun arestual/2/

VERSE 4
gbtsna babilon aguagutew wesdewt
werqun keeju xale medab asgomjejtot/2/
466. aznalehu aleqsalehu
aznalehu aleqsalehu

VERSE 5
sle bedelie hulgizie aleqsalehu
aznalehu aleqsalehu
slexfatie hulegizie aleqsalehu
neger gn meሐri nehna endemtadnegn

VERSE 6
amnalehu/2/
ሥgayie lerasu eyatalelegn/2/
hulen bemefeleg wesedena lexfat sexegn
kemeriet tegegnta emeriet ltgeba/2/

VERSE 7
kentu asqerechgn yasasach ሥga segebgaba /2/
tchat lmexa new afer ሥgayien
›»»› ›› meriet ሥgayien', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=2d5H-c4qZjM', 'draft', 'pending', 'https://www.youtube.com/watch?v=2d5H-c4qZjM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemayneger-sxotah-temesgen-enl-len-2', 'ለማይነገር ስጦታህ ተመስገን እንልፃለን/2/', 'ለማይነገር ስጦታህ ተመስገን እንልፃለን/2/', 'lemayneger sxotah temesgen enlፃlen/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ለማይነገር ስጦታህ ተመስገን እንልፃለን/2/', 'ማቃችንን ቀይረህ አዲስ ላለበስከን
ቁስላችንን አጥበህ ዘይት ለቀባኸን
ጠላት ሲያዋርደን አንተ ላከበርከን
ለዚህ ሁሉ ውለታህ ምን አእንከፍልፃለን', 'maqachnn qeyreh adis lalebesken
quslachnn axbeh zeyt leqebaኸn
xelat siyawarden ante lakeberken
lezih hulu wletah mn aenkeflፃlen', 'amharic', 'mezmur', 'ዘማሪ ዲያቆን አቤል', 'https://www.youtube.com/watch?v=4yzgH9uRSyk', 'draft', 'pending', 'https://www.youtube.com/watch?v=4yzgH9uRSyk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('lemayneger-sxotah-temesgen-enl-len-2', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('altsenahumna', 'አልጸናሁምና', 'አልጸናሁምና', 'altsenahumna', 'Ethiopian Orthodox Tewahedo Mezmur - አልጸናሁምና', 'ሥራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ
ጽኑ መሠረት ነህ የሕይወት አለት
አየተናወጽኩኝ አቃተተኝ መትጋት', 'ሥrayiena qalh algenagn alugn
bexemamaw lbie anten asazenkugn
tsnu meሠret neh yeሕywet alet
ayetenawetskugn aqatetegn metgat', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=2cvxFPHHdgk', 'draft', 'pending', 'https://www.youtube.com/watch?v=2cvxFPHHdgk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemekera-tsena-alkadem-amlakun', 'በመከራ ጸና አልካደም አምላኩን', 'በመከራ ጸና አልካደም አምላኩን', 'bemekera tsena alkadem amlakun', 'Ethiopian Orthodox Tewahedo Mezmur - በመከራ ጸና አልካደም አምላኩን', 'መፈተን መልካም ነው ያነጻል እንደወርቅ
በመጨረሻው ቀን በክብረ እንድትደምቅ
አንዱን ሳትሻገር ሌላው ቢተካብህ
በሕይወትህ ዘመን ፈተና ቢያጠቃህ', 'mefeten melkam new yanetsal endewerq
bemecereshaw qen bekbre endtdemq
andun satshager lielaw bitekabh
beሕyweth zemen fetena biyaxeqah', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=G9uDPVlM40E', 'draft', 'pending', 'https://www.youtube.com/watch?v=G9uDPVlM40E', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemalqes-gizie-alew-amlakie-derso-lemesaq', 'ለማልቀስ ጊዜ አለው አምላኬ ደርሶ ለመሳቅ', 'ለማልቀስ ጊዜ አለው አምላኬ ደርሶ ለመሳቅ', 'lemalqes gizie alew amlakie derso lemesaq', 'Ethiopian Orthodox Tewahedo Mezmur - ለማልቀስ ጊዜ አለው አምላኬ ደርሶ ለመሳቅ', 'ከራሣችን ፀጉር አንዲቷን ጥቂቱን ሣናውቅ
የአኛስ ተግባር ሆኗል ለሁሉም ደርሶ
መጨነቅ/2/
478. አቤቱ ልንበርከክ

VERSE 1
አቤቱ ልንበርከክ ልማር
ህግን አስተምረኝ ወድቂ እንዳቀር/2/
አቤቱ ለመማር ስፈልግ ደጀህን ስጠና
ተመለስ ይለኛል የሥጋ ፈተና

VERSE 2
አቤቱ በልቤ አርሻ ላይ የዘራኸውን ቃል
ዲያብሎስ ወፍ ሆኖ ከልቤ ይለቅማል
አቤቱ ይህንንም ያንን ሁሉን ነገር ስመኝ
ከቤትህ እንዳልርቅ ቃልህ ይመልሰኝ

VERSE 3
አቤቱ አባት ላንድ ልጁ አንደሚራራለት
በቁጣህ አትቅሰፈኝ በደሌን በማየት
አቤቱ ውለታህ ምን ያህል ጌታ የአንተ ፍቅር
ምን ይከፈለዋል ሲያጠፋ ለሚምር

VERSE 4
አቤቱ ቁስሌን አጥበህልኝ ማቄን ለቀየርከው
ተአምርህን እኔ ዘርዝሬም አልዘልቀው
አቤቱ ኃያል ነህ ገናና አማካሪም የለህ
ፍርድህ ሚዛናዊ የእውነት አባት ነህ

VERSE 5
አቤቱ የተዋረደውን አንተ ታከብራለህ
መልክና ቁመና መች ትመዝናለህ
479. ላይቀር መሞት', 'keraሣchn ፀgur andituan xqitun ሣnawq
yeagnas tegbar honual lehulum derso
meceneq/2/
478. abietu lnberkek

VERSE 1
abietu lnberkek lmar
hgn astemregn wedqi endaqer/2/
abietu lememar sfelg dejehn sxena
temeles ylegnal yeሥga fetena

VERSE 2
abietu belbie arsha lay yezeraኸwn qal
diyablos wef hono kelbie yleqmal
abietu yhnnm yann hulun neger smegn
kebieth endalrq qalh ymelsegn

VERSE 3
abietu abat land lju andemiraralet
bequxah atqsefegn bedelien bemayet
abietu wletah mn yahl gieta yeante fqr
mn ykefelewal siyaxefa lemimr

VERSE 4
abietu quslien axbehlgn maqien leqeyerkew
teamrhn enie zerzriem alzelqew
abietu ኃyal neh genana amakarim yeleh
frdh mizanawi yeewnet abat neh

VERSE 5
abietu yetewaredewn ante takebraleh
melkna qumena mech tmeznaleh
479. layqer memot', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=HlJlC4v_pRo', 'draft', 'pending', 'https://www.youtube.com/watch?v=HlJlC4v_pRo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yefexariwn-sm-bekentu-yemayxera', 'የፈጣሪውን ስም በከንቱ የማይጠራ', 'የፈጣሪውን ስም በከንቱ የማይጠራ', 'yefexariwn sm bekentu yemayxera', 'Ethiopian Orthodox Tewahedo Mezmur - የፈጣሪውን ስም በከንቱ የማይጠራ', 'ይጎበኛል በምድር ከሰማዩ ስፍራ
በቀኝ ይቀመጣል ከቅዱሳን ጋራ', 'ygobegnal bemdr kesemayu sfra
beqegn yqemexal keqdusan gara', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=MPjObd1Fbrw', 'draft', 'pending', 'https://www.youtube.com/watch?v=MPjObd1Fbrw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('yefexariwn-sm-bekentu-yemayxera', 'prayer', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bezih-bcha-aybeqam-terguami-yashawal-2', 'በዚህ ብቻ አይበቃም ተርጓሚ ያሻዋል/2/', 'በዚህ ብቻ አይበቃም ተርጓሚ ያሻዋል/2/', 'bezih bcha aybeqam terguami yashawal/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በዚህ ብቻ አይበቃም ተርጓሚ ያሻዋል/2/', 'አንደፈቃዳችን ብንተረጉመው/2/
በውጥን የሚልቀው ስህተቱ ብዙ ነው/2/
ከቶ በሰው ፈቃድ ትንቢት እንዳልመጣ /2/
ይነግረናል መጽሐፍ ከሕግ እንዳንወጣ

VERSE 1
ይመክረናል መጽሐፍ ከሕግ እንዳንወጣ
እንጠይቅ መምህራን ያሉት በደረጃ /2/
አናንብብ መጽሐፍት ይሁኑን ማስረጃ/2/', 'andefeqadachn bnteregumew/2/
bewxn yemilqew shtetu bzu new/2/
keto besew feqad tnbit endalmexa /2/
ynegrenal metsሐf keሕg endanwexa

VERSE 1
ymekrenal metsሐf keሕg endanwexa
enxeyq memhran yalut bedereja /2/
ananbb metsሐft yhunun masreja/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=LtuFD21eVNI', 'draft', 'pending', 'https://www.youtube.com/watch?v=LtuFD21eVNI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdst-anatachn-bietekrstiyan', 'ቅድስት አናታችን ቤተክርስቲያን', 'ቅድስት አናታችን ቤተክርስቲያን', 'qdst anatachn bietekrstiyan', 'Ethiopian Orthodox Tewahedo Mezmur - ቅድስት አናታችን ቤተክርስቲያን', 'ትመግበናለች ሥጋና ደሙን
የአማኑኤል ሥጋ ይኸው ተዘጋጀ
ለግብዣ ተጠራን አዋጁ ታወጀ', 'tmegbenalech ሥgana demun
yeamanuiel ሥga yኸw tezegaje
legbzha texeran awaju taweje', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=68MqVrVrrME', 'draft', 'pending', 'https://www.youtube.com/watch?v=68MqVrVrrME', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lem-teygn-nqie-tchieshalehu', 'ዓለም ተይኝ ንቄ ትቼሻለሁ', 'ዓለም ተይኝ ንቄ ትቼሻለሁ', 'ዓlem teygn nqie tchieshalehu', 'Ethiopian Orthodox Tewahedo Mezmur - ዓለም ተይኝ ንቄ ትቼሻለሁ', 'ጥበበኛው ሰይጣን በመጣው ቢመጣ
ዳግም ተመልሼ ከአእቅፍህ ላልወጣ
በመስቀሉ ግርጌ አርፌ አኖራለሁ
ዓለም ተይኝ የእግዚአብሔር ሆኛለው', 'xbebegnaw seyxan bemexaw bimexa
dagm temelshie keaeqfh lalwexa
bemesqelu grgie arfie anoralehu
ዓlem teygn yeegziabሔr hognalew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=9gUUKGnW10g', 'draft', 'pending', 'https://www.youtube.com/watch?v=9gUUKGnW10g', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('leenie-endew-desta-new-zenm-yelegn', 'ለእኔ እንደው ደስታ ነው ሐዘንም የለኝ', 'ለእኔ እንደው ደስታ ነው ሐዘንም የለኝ', 'leenie endew desta new ሐzenm yelegn', 'Ethiopian Orthodox Tewahedo Mezmur - ለእኔ እንደው ደስታ ነው ሐዘንም የለኝ', 'ሰይጣን እፈር የክርስቶስ ነኝ', 'seyxan efer yekrstos negn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=U2v9nGffhuE', 'draft', 'pending', 'https://www.youtube.com/watch?v=U2v9nGffhuE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yetal-anuanuarie-anten-yemimeslew-2', 'የታል አኗኗሬ አንተን የሚመስለው/2/', 'የታል አኗኗሬ አንተን የሚመስለው/2/', 'yetal anuanuarie anten yemimeslew/2/', 'Ethiopian Orthodox Tewahedo Mezmur - የታል አኗኗሬ አንተን የሚመስለው/2/', 'በልማድ ሕይወት ነው የምመላለሰው/2/', 'belmad ሕywet new yemmelalesew/2/', 'amharic', 'mezmur', 'ዘማሪት ፋንቱ ወልዴ', 'https://www.youtube.com/watch?v=-ylfq3g_zM8', 'draft', 'pending', 'https://www.youtube.com/watch?v=-ylfq3g_zM8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yh-andebetiema-beqalh-lxnual-ri2', 'ይህ አንደበቴማ በቃልህ ሠልጥኗል/ሪ2/', 'ይህ አንደበቴማ በቃልህ ሠልጥኗል/ሪ2/', 'yh andebetiema beqalh ሠlxnual/ri2/', 'Ethiopian Orthodox Tewahedo Mezmur - ይህ አንደበቴማ በቃልህ ሠልጥኗል/ሪ2/', 'ልቦናዬ ካንተ ከፊትህ ኮብልሏል/2/', 'lbonayie kante kefith kobllual/2/', 'amharic', 'mezmur', 'ዘማሪት ፋንቱ ወልዴ', 'https://www.youtube.com/watch?v=RmWOCWLUfW8', 'draft', 'pending', 'https://www.youtube.com/watch?v=RmWOCWLUfW8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('hlmm-honobgnal-yesew-hulu-tesfa', 'ህልምም ሆኖብኛል የሰው ሁሉ ተስፋ', 'ህልምም ሆኖብኛል የሰው ሁሉ ተስፋ', 'hlmm honobgnal yesew hulu tesfa', 'Ethiopian Orthodox Tewahedo Mezmur - ህልምም ሆኖብኛል የሰው ሁሉ ተስፋ', 'ቃልህን የማታጥፍ አንተ ከእኔ አትጥፋ /2/
496. እግዚአብሔር መልካም ነው
እግዚአብሔር መልካም ነው
በመከራ ቀንም መሸሸጊያ ነው/2/

VERSE 1
ከገነት ሲሰደድ አዳም አባታችን
ሞት ነግሶብን ሳለ በእኛ በሁላችን
ቃል እንደገባለት ተወልዶ ሊያድነው
በመከራ ጊዜ መሸሸጊያ ሆነው/2/', 'qalhn yemataxf ante keenie atxfa /2/
496. egziabሔr melkam new
egziabሔr melkam new
bemekera qenm mesheshegiya new/2/

VERSE 1
kegenet siseded adam abatachn
mot negsobn sale beegna behulachn
qal endegebalet teweldo liyadnew
bemekera gizie mesheshegiya honew/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=5wwpR9pYMVI', 'draft', 'pending', 'https://www.youtube.com/watch?v=5wwpR9pYMVI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-zen-bechgr-bemekera-gizie', 'በሐዘን በችግር በመከራ ጊዜ', 'በሐዘን በችግር በመከራ ጊዜ', 'beሐzen bechgr bemekera gizie', 'Ethiopian Orthodox Tewahedo Mezmur - በሐዘን በችግር በመከራ ጊዜ', 'ጭንቀቴን የሚያርቅ ነው የፍሴን ትካዜ
የቀደመው አባብ ሰላሜን ሲነሳኝ
እግዚአብሔር መልካም ነው ሐዘኔን
አስረሳኝ

VERSE 1
የቀደመው አባብ ሰላሜን ቢነሳኝ
ክርስቶስ ኢየሱስ ሐዘኔን አስረሳኝ
497. አታውኪኝ ነፍሴ
አታውኪኝ ነፍሴ አታስጨንቂኝ /2/

VERSE 2
በዓለም መድኃኒት በእግዚአብሔር ታመኘፒ/2/
ዋልያ እንደሚናፍቅ ወደ ውኃ ምንጮች/2/
ጌታዬን ለማየት ነፍሴ ናፈቀች/2/
የሕይወትን ውኃ እያስታወሰችኝ /2/

VERSE 3
ወደሕያው አምላክ ነፍሴ ተጠማቸ/2/', 'cnqetien yemiyarq new yefsien tkazie
yeqedemew abab selamien sinesagn
egziabሔr melkam new ሐzenien
asresagn

VERSE 1
yeqedemew abab selamien binesagn
krstos iyesus ሐzenien asresagn
497. atawkign nefsie
atawkign nefsie atascenqign /2/

VERSE 2
beዓlem medኃnit beegziabሔr tamegnepi/2/
walya endeminafq wede wኃ mncoch/2/
gietayien lemayet nefsie nafeqech/2/
yeሕywetn wኃ eyastawesechgn /2/

VERSE 3
wedeሕyaw amlak nefsie texemache/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=rYtejH_DrnY', 'draft', 'pending', 'https://www.youtube.com/watch?v=rYtejH_DrnY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('fqrna-selamn-taferalech-tsom-2', 'ፍቅርና ሰላምን ታፈራለች ጾም /2/', 'ፍቅርና ሰላምን ታፈራለች ጾም /2/', 'fqrna selamn taferalech tsom /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ፍቅርና ሰላምን ታፈራለች ጾም /2/', 'ፍቅርና ሰላምን ታፈራለች ጾም /2/', 'fqrna selamn taferalech tsom /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=w7kLUb9ZTNw', 'draft', 'pending', 'https://www.youtube.com/watch?v=w7kLUb9ZTNw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('o-nts-t-des-ybelsh', 'ኦ ንጽሕት ደስ ይበልሽ', 'ኦ ንጽሕት ደስ ይበልሽ', 'o ntsሕt des ybelsh', 'Ethiopian Orthodox Tewahedo Mezmur - ኦ ንጽሕት ደስ ይበልሽ', 'ኦ ንጽሕት ደስ ይበልሽ
ከፍጡራን ሁሉ በላይ ስለሆንሽ
ኦ ንጽሕት ደስ ይበልሽ
ኦ ንጽሕት ደስ ይበልሽ', 'o ntsሕt des ybelsh
kefxuran hulu belay slehonsh
o ntsሕt des ybelsh
o ntsሕt des ybelsh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=PFI3VXdZOho', 'draft', 'pending', 'https://www.youtube.com/watch?v=PFI3VXdZOho', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kesietoch-hulu-lyu-nat-eyaln', 'ከሴቶች ሁሉ ልዩ ናት እያልን', 'ከሴቶች ሁሉ ልዩ ናት እያልን', 'kesietoch hulu lyu nat eyaln', 'Ethiopian Orthodox Tewahedo Mezmur - ከሴቶች ሁሉ ልዩ ናት እያልን', 'በሁለቱም ወገን በፍጹም ድንግል
የብርሃን አናቱ ማርያም ስትባል
በደካሞች ዘንድ ምነው ተዘነጋች
አዳ አለብን/2/ ከፈጣሪያችን/2/

VERSE 1
ቃና ዘገሊላ ከልጅዋ ጋር ሳለች
ከሠርግ ቤት ገብታ ድንግል አማልዳለች
አንኳንስ አመአምላክ ቤዛዊተ ኩሉ
ጻድቃን ሰማዕታት በአውነት ያማልዳሉ

VERSE 2
አዳ አለብን/2/ ከፈጣሪያችን/2/
505. ከፈጣሪ በታች
ከፈጣሪ በታች ከፍጡራን በላይ/2/
ማን አለ እንዳንቺ ድንግል ንፁህ በአለም ላይ /2/

VERSE 3
ኦ ድንግል ማርያም ዘላለም''2/
መኩሪያ ነሽ መመኪያ
አምላክ ለማደሪያ መርጦ ያዘጋጀሽ/2/
ጽዮን የተባለች ሀገር ድንግል ሆይ አንቺው

VERSE 4
ነሽ/2/
በሐሳብሽ ድንግል ድንግል በስጋሽ/2/
ከፍጥረታት ሁሉ ላንቺ ምሣሌም የለሽ/2/
ፍቅሩ ለዘላለም የማይጠገበው/2/

VERSE 5
ከስም ሁሉ በላይ ጣፋጭ ድንግል የአንቺ ስም
ነው/2/
በአዝራ መሰንቆ በዳዊት በገና''2/
ይገባሻል ላንቺ ድንግል ሁልጊዜ ምስጋና', 'behuletum wegen beftsum dngl
yebrሃn anatu maryam stbal
bedekamoch zend mnew tezenegach
ada alebn/2/ kefexariyachn/2/

VERSE 1
qana zegelila keljwa gar salech
keሠrg biet gebta dngl amaldalech
ankuans ameamlak biezawite kulu
tsadqan semaዕtat beawnet yamaldalu

VERSE 2
ada alebn/2/ kefexariyachn/2/
505. kefexari betach
kefexari betach kefxuran belay/2/
man ale endanchi dngl nፁh bealem lay /2/

VERSE 3
o dngl maryam zelalem''2/
mekuriya nesh memekiya
amlak lemaderiya merxo yazegajesh/2/
tsyon yetebalech hager dngl hoy anchiw

VERSE 4
nesh/2/
beሐsabsh dngl dngl besgash/2/
kefxretat hulu lanchi mሣliem yelesh/2/
fqru lezelalem yemayxegebew/2/

VERSE 5
kesm hulu belay xafac dngl yeanchi sm
new/2/
beazra mesenqo bedawit begena''2/
ygebashal lanchi dngl hulgizie msgana', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Ok6RwjaA3us', 'draft', 'pending', 'https://www.youtube.com/watch?v=Ok6RwjaA3us', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nefsie-gietayien-takebrewalech', 'ነፍሴ ጌታዬን ታከብረዋለች', 'ነፍሴ ጌታዬን ታከብረዋለች', 'nefsie gietayien takebrewalech', 'Ethiopian Orthodox Tewahedo Mezmur - ነፍሴ ጌታዬን ታከብረዋለች', 'ነፍሴ ጌታዬን ታከብረዋለች', 'nefsie gietayien takebrewalech', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=zpjhKZwukZI', 'draft', 'pending', 'https://www.youtube.com/watch?v=zpjhKZwukZI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('menfesiem-beamlakie-siet-tadergalech', 'መንፈሴም በአምላኬ ሐሴት ታደርጋለች', 'መንፈሴም በአምላኬ ሐሴት ታደርጋለች', 'menfesiem beamlakie ሐsiet tadergalech', 'Ethiopian Orthodox Tewahedo Mezmur - መንፈሴም በአምላኬ ሐሴት ታደርጋለች', 'መንፈሴም በአምላኬ ሐሴት ታደርጋለች
የእኔን የባሪያውን ትኅትና
የአስራኤል አምላክ ተመልክቷልና/2/
ትውልድ ሁሉ ብፅዕት ይሉኛል

VERSE 1
አርሱ ታላቅ ሥራ አድርጎልኛል
ስሙም ቅዱስ ነው ምሕረቱም
ለትውልድ ትውልድ ለዘለዓለም/2/', 'menfesiem beamlakie ሐsiet tadergalech
yeenien yebariyawn tኅtna
yeasraiel amlak temelktualna/2/
twld hulu bፅዕt ylugnal

VERSE 1
arsu talaq ሥra adrgolgnal
smum qdus new mሕretum
letwld twld lezeleዓlem/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=V4Wo-hDM2nQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=V4Wo-hDM2nQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yl-adrgual-gieta-bekndu', 'ኃይል አድርጓል ጌታ በክንዱ', 'ኃይል አድርጓል ጌታ በክንዱ', 'ኃyl adrgual gieta bekndu', 'Ethiopian Orthodox Tewahedo Mezmur - ኃይል አድርጓል ጌታ በክንዱ', 'ትፅቢተኞች ተዋረዱ
ገዢዎች ከዙፋን ስለተጣሉ
ትሁታን ደግሞ ከፍ ከፍ አሉ /2/
ባለጠጐች ሲጠሙ ሲራቡ

VERSE 1
ድሆች በምሕረት ጥቂት ጠገቡ
ለአባቶቻችን እንደማለ
ምሕረቱን አስቦ እኛን ተቀበለ /2/', 'tፅbitegnoch tewaredu
gezhiwoch kezufan sletexalu
thutan degmo kef kef alu /2/
balexeጐch sixemu sirabu

VERSE 1
dhoch bemሕret xqit xegebu
leabatochachn endemale
mሕretun asbo egnan teqebele /2/', 'amharic', 'mezmur', 'ዘማሪ ገብረዮሐንስ ገብረፃድቅ', 'https://www.youtube.com/watch?v=VXfKmVH7oaI', 'draft', 'pending', 'https://www.youtube.com/watch?v=VXfKmVH7oaI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lexelat-kndu-brtu-yal-new', 'ለጠላት ክንዱ ብርቱ ኃያል ነው', 'ለጠላት ክንዱ ብርቱ ኃያል ነው', 'lexelat kndu brtu ኃyal new', 'Ethiopian Orthodox Tewahedo Mezmur - ለጠላት ክንዱ ብርቱ ኃያል ነው', 'ሕዝቡን ሲመግብ አዱ ሰፊ ነው
የማያልቅበት ቸር እረኛ ነው
ሰማይና ምድርን የፈጠረ
ክዋክብትን በሕም. ያረ', 'ሕzbun simegb adu sefi new
yemayalqbet cher eregna new
semayna mdrn yefexere
kwakbtn beሕm. yare', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=6prIrn7v6RE', 'draft', 'pending', 'https://www.youtube.com/watch?v=6prIrn7v6RE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('man-new-ersu', 'ማን ነው እርሱ', 'ማን ነው እርሱ', 'man new ersu', 'Ethiopian Orthodox Tewahedo Mezmur - ማን ነው እርሱ', 'ማን ነው እርሱ
በፍትሕ በእውነት ለጽድቅ የሚፈርድ
ማን ነው እርሱ
ማን ነው እርሱ

VERSE 1
ማን ነው እርሱ
ማን ነው እርሱ
ማን ነው እርሱ
ማን ነው እርሱ', 'man new ersu
beftሕ beewnet letsdq yemiferd
man new ersu
man new ersu

VERSE 1
man new ersu
man new ersu
man new ersu
man new ersu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=3reXonPrPMs', 'draft', 'pending', 'https://www.youtube.com/watch?v=3reXonPrPMs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wendm-wendmun-eyekesese-lefrd-aqumo', 'ወንድም ወንድሙን እየከሰሰ ለፍርድ አቁሞ', 'ወንድም ወንድሙን እየከሰሰ ለፍርድ አቁሞ', 'wendm wendmun eyekesese lefrd aqumo', 'Ethiopian Orthodox Tewahedo Mezmur - ወንድም ወንድሙን እየከሰሰ ለፍርድ አቁሞ', 'አሕዛብ ያያል በንትርኩ እጅግ ተገርሞ', 'aሕzab yayal bentrku ejg tegermo', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=0rcmj09Fzn0', 'draft', 'pending', 'https://www.youtube.com/watch?v=0rcmj09Fzn0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tewa-do-aqrbi-leamlak-msgana', 'ተዋሕዶ አቅርቢ ለአምላክ ምስጋና', 'ተዋሕዶ አቅርቢ ለአምላክ ምስጋና', 'tewaሕdo aqrbi leamlak msgana', 'Ethiopian Orthodox Tewahedo Mezmur - ተዋሕዶ አቅርቢ ለአምላክ ምስጋና', 'በዕዝራ መሰንቆ በዳዊት በገና
ዜማውን ከያሬድ ተምረሻልና', 'beዕzra mesenqo bedawit begena
ziemawn keyaried temreshalna', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=0W2k0VmaCro', 'draft', 'pending', 'https://www.youtube.com/watch?v=0W2k0VmaCro', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('andih-alew-phiexros-iyesusn', 'አንዲህ አለው ጴጥሮስ ኢየሱስን', 'አንዲህ አለው ጴጥሮስ ኢየሱስን', 'andih alew phiexros iyesusn', 'Ethiopian Orthodox Tewahedo Mezmur - አንዲህ አለው ጴጥሮስ ኢየሱስን', 'ምሥጢር ገህድ ሲሆን በዚያ በተራራ
ባንድ ላይ አንኑር ሦስት ዳስ አንስራ
አንዲህ አለው ጴጥሮስ ኢየሱስን
አንዲህ አለው ጴጥሮስ ኢየሱስን', 'mሥxir gehd sihon beziya beterara
band lay annur ሦst das ansra
andih alew phiexros iyesusn
andih alew phiexros iyesusn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=N0BnUvaRuHI', 'draft', 'pending', 'https://www.youtube.com/watch?v=N0BnUvaRuHI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('werdo-kelelachew-demena-tse-da', 'ወርዶ ከለላቸው ደመና ጸዓዳ', 'ወርዶ ከለላቸው ደመና ጸዓዳ', 'werdo kelelachew demena tseዓda', 'Ethiopian Orthodox Tewahedo Mezmur - ወርዶ ከለላቸው ደመና ጸዓዳ', 'ወርዶ ከለላቸው ደመና ጸዓዳ
ወርዶ ከለላቸው ደመና ጸዓዳ', 'werdo kelelachew demena tseዓda
werdo kelelachew demena tseዓda', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=FkO7jeIuggw', 'draft', 'pending', 'https://www.youtube.com/watch?v=FkO7jeIuggw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('werdo-kelelachew-demena-tse-da', 'apostles', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlakachn-qdus-new', 'አምላካችን ቅዱስ ነው', 'አምላካችን ቅዱስ ነው', 'amlakachn qdus new', 'Ethiopian Orthodox Tewahedo Mezmur - አምላካችን ቅዱስ ነው', 'አምላካችን ቅዱስ ነህ
ፊጣሪያችን ቡሩክ ነህ
የዘለዓለም አምላክ ነህ/2/', 'amlakachn qdus neh
fixariyachn buruk neh
yezeleዓlem amlak neh/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=6kCgcq7_FQ0', 'draft', 'pending', 'https://www.youtube.com/watch?v=6kCgcq7_FQ0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('asteraye-gebriel-gbte', 'አስተርአየ ገብርኤል ግብተ', 'አስተርአየ ገብርኤል ግብተ', 'asteraye gebriel gbte', 'Ethiopian Orthodox Tewahedo Mezmur - አስተርአየ ገብርኤል ግብተ', 'ወእንዘ ትፈትል /ቴ/ ወርቀ ወሜላት', 'weenze tfetl /tie/ werqe wemielat', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=PCchxvSlIkA', 'draft', 'pending', 'https://www.youtube.com/watch?v=PCchxvSlIkA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('meng-te-semay-meng-te-semay-nefsie-hoy', 'መንግሥተ ሰማይ መንግሥተ ሰማይ ነፍሴ ሆይ', 'መንግሥተ ሰማይ መንግሥተ ሰማይ ነፍሴ ሆይ', 'mengሥte semay mengሥte semay nefsie hoy', 'Ethiopian Orthodox Tewahedo Mezmur - መንግሥተ ሰማይ መንግሥተ ሰማይ ነፍሴ ሆይ', '535... እግዚአብሔርን ጥራው
አግዚአብሔርን ጥራው በመከራ ጊዜ
ያድንፃልና ከሐዘን ከትካዜ
ጋሻና ጦሬ ብለህ ምርኩዜ

VERSE 1
አመስግንህ ዘንድ አነሣለሁ በአኩለ ሌሊት
አንዳመሰገነህ ነብዩ ዳዊት
በንጹሕ ልቡና እንደ መላእክት
አግዚአብሔርን ጥራው

VERSE 2
በቅድስናው ሥፍራ ለእግዚአብሔር ስገዱ
አርስ በርሳችሁም ተዋደዱ
ጸብና ክርክር እንዲወገዱ
አግዚአብሔርን ጥራው

VERSE 3
አምነትን ከሥራ አስተባብረህ ከልብ
በወጣትነህ ፈጣሪህን አስብ
ሥራህም በሰው ፊት ይብራ
አንደ ፀሐይ ይብራ እንደ ኮከብ

VERSE 4
አግዚአብሔርን ጥራው
በቤተ ክርስቲያን ጸሎት በድንግል ኪዳን
አቤቱ ጠብቃት ኢትዮጵያን
ለሕዝቧም ስጣቸው ፍቅር አንድነትን

VERSE 5
አግዚአብሔርን ጥራው
አለምንሃለሁ አምላኬ ሆይ አንዲት ነገር
ከቤትህ ገብቼ በደስታ አንድኖር
ከባለሟሎችህ ከአብርፃም ከይስሐቅ

VERSE 6
ከያዕቆብ ጋር
አግዚአብሔርን ጥራው
ደርሶልኛልና በመከራ ቀን
አከብረዋለሁኝ ቅዱስ አምላኬን

VERSE 7
አጆቼንም ይዞ የሚመራኝን
አግዚአብሔርን ጥራው
ኑሮዬ ሲጨልም ግራ ሲገባኝ
ያለ ፈጣሪዬ ዘመድም የለኝ

VERSE 8
ብወድቅ የሚያነሳኝ የሚደግፈኝ
536. አምላክ ሆይ
አምላክ ሆይ አደራ ያን ጊዜ እንድትራራ
አምላክ ሆይ አደራ ስለአኛ አንድትራሪ', '535... egziabሔrn xraw
agziabሔrn xraw bemekera gizie
yadnፃlna keሐzen ketkazie
gashana xorie bleh mrkuzie

VERSE 1
amesgnh zend aneሣlehu beakule lielit
andamesegeneh nebyu dawit
bentsuሕ lbuna ende melaekt
agziabሔrn xraw

VERSE 2
beqdsnaw ሥfra leegziabሔr sgedu
ars bersachhum tewadedu
tsebna krkr endiwegedu
agziabሔrn xraw

VERSE 3
amnetn keሥra astebabreh kelb
bewexatneh fexarihn asb
ሥrahm besew fit ybra
ande ፀሐy ybra ende kokeb

VERSE 4
agziabሔrn xraw
bebiete krstiyan tselot bedngl kidan
abietu xebqat ityophyan
leሕzbuam sxachew fqr andnetn

VERSE 5
agziabሔrn xraw
alemnሃlehu amlakie hoy andit neger
kebieth gebchie bedesta andnor
kebalemualochh keabrፃm keysሐq

VERSE 6
keyaዕqob gar
agziabሔrn xraw
dersolgnalna bemekera qen
akebrewalehugn qdus amlakien

VERSE 7
ajochienm yzo yemimeragnn
agziabሔrn xraw
nuroyie sicelm gra sigebagn
yale fexariyie zemedm yelegn

VERSE 8
bwedq yemiyanesagn yemidegfegn
536. amlak hoy
amlak hoy adera yan gizie endtrara
amlak hoy adera sleagna andtrari', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=c5GsBiPbiss', 'draft', 'pending', 'https://www.youtube.com/watch?v=c5GsBiPbiss', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('endalmeles-wedehuala', 'እንዳልመለስ ወደኋላ', 'እንዳልመለስ ወደኋላ', 'endalmeles wedehuala', 'Ethiopian Orthodox Tewahedo Mezmur - እንዳልመለስ ወደኋላ', 'የኃጢአትን ፍሬ አንዳልበላ
ጠብቀኝ እንጂ በኃይልህ
አንዳልወድቅብህ ልጅህ
ኃጢአቴን አጥበህ አሣርፈኝ

VERSE 1
አምላኬ አንተነህ ሌላም የለኝ
አኔነቴን ሳስብ አሳዘነኝ
ልኑር ከአንተጋር አዘንልኝ
539... ተይ ተመከሪ

VERSE 2
ተይ ተመከሪ ነፍሴ ሆይ ተይ ተመክከሪ /2/
በዓለም መድኃኒት ነፍሴ ሆይ
በአግዚአብሔር ታመፒ
ለሥጋ መገዛት ነፍሴ ሆይ

VERSE 3
ምንው ቢቀርብሽሸ
ውርደት ነው ፍጻሜው " "
የሚያከናንብሽ
መልካም የሆነውን " "

VERSE 4
ጽድቁን ተከተይ
ክርስቶስን መስለሽ " "
ቸርነትን ሥሪ /2/
ሞትን ማን ይመርጣል ነፍሴ ሆይ

VERSE 5
ሕይወትን በመጥላት
ከእንግዲህ መራቅ ነው " "
ከስርቆት ከዝሙት
ጸጋ አንዲበዛልሽ " "

VERSE 6
የቃሉ በረከት
ከቤቱ አትጥፊ " "
ፍቅር ከሞላበት /2/
ለአንቺ ነበር ጌታ ነፍሴ ሆይ

VERSE 7
ደሙን ያፈሰሰው
ተሰቅሎ ሞቶ ነው " "
ፍቅሩን የገለጸው
በፍቅሩ ለሳበኝ " "', 'yeኃxiatn frie andalbela
xebqegn enji beኃylh
andalwedqbh ljh
ኃxiatien axbeh aሣrfegn

VERSE 1
amlakie anteneh lielam yelegn
anienetien sasb asazenegn
lnur keantegar azenlgn
539... tey temekeri

VERSE 2
tey temekeri nefsie hoy tey temekkeri /2/
beዓlem medኃnit nefsie hoy
beagziabሔr tamepi
leሥga megezat nefsie hoy

VERSE 3
mnw biqerbshshe
wrdet new ftsamiew " "
yemiyakenanbsh
melkam yehonewn " "

VERSE 4
tsdqun teketey
krstosn meslesh " "
chernetn ሥri /2/
motn man ymerxal nefsie hoy

VERSE 5
ሕywetn bemexlat
keengdih meraq new " "
kesrqot kezmut
tsega andibezalsh " "

VERSE 6
yeqalu bereket
kebietu atxfi " "
fqr kemolabet /2/
leanchi neber gieta nefsie hoy

VERSE 7
demun yafesesew
teseqlo moto new " "
fqrun yegeletsew
befqru lesabegn " "', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=HNgs9dLGTbI', 'draft', 'pending', 'https://www.youtube.com/watch?v=HNgs9dLGTbI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gasha-yhonegnal', 'ጋሻ ይሆነኛል', 'ጋሻ ይሆነኛል', 'gasha yhonegnal', 'Ethiopian Orthodox Tewahedo Mezmur - ጋሻ ይሆነኛል', 'ጋሻ ይሆነኛል ገብርኤል ›»› ጠባቂው አባቴ
አሳተ ነበልባል ገብርኤል›› ኃያል መልአክ ነህ
ስምህን ሲጠሩ ›ገብርኤል› ፈጥነህ ትደርሳለህ', 'gasha yhonegnal gebriel ›»› xebaqiw abatie
asate nebelbal gebriel›› ኃyal melak neh
smhn sixeru ›gebriel› fexneh tdersaleh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=CmC8QApkaUU', 'draft', 'pending', 'https://www.youtube.com/watch?v=CmC8QApkaUU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-maryam-hoy-dreshlgn-2', 'ድንግል ማርያም ሆይ ድረሽልኝ /2/', 'ድንግል ማርያም ሆይ ድረሽልኝ /2/', 'dngl maryam hoy dreshlgn /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል ማርያም ሆይ ድረሽልኝ /2/', 'በዚያች በጠባብ በር ነይ ነይ
ማንስ ይወስደኛል " "
ይህ ደካማ ሥጋ " "
ሰፊውን ይለኛል ነይ ነይ

VERSE 1
በሰፊውም ሄጄ " "
አሁን ወድቄያለሁ " "', 'beziyach bexebab ber ney ney
mans ywesdegnal " "
yh dekama ሥga " "
sefiwn ylegnal ney ney

VERSE 1
besefiwm hejie " "
ahun wedqieyalehu " "', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=CQhmaYQORt0', 'draft', 'pending', 'https://www.youtube.com/watch?v=CQhmaYQORt0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yemiyashagrewn', 'የሚያሻግረውን " "', 'የሚያሻግረውን " "', 'yemiyashagrewn " "', 'Ethiopian Orthodox Tewahedo Mezmur - የሚያሻግረውን " "', 'ኃጢአትና በደል ነይ ነይ
በላዬ ላይ ሰፍሮ " "
ጽድቅን አንዳልሠራ " "
ይዞኛል ቀስፎ " "

VERSE 1
ዓለማዊ ነገር " "
የጠቀመኝ መስሉኝ " "
በዲያብሎስ ታንቄ ቀረሁ " "
ከዲያብሎስ ገመድ " "

VERSE 2
ኸረ አንቺው አውጪኝ " "
አዛፒት ነሽና " "
አተትጨክፒብኝ " "', 'ኃxiatna bedel ney ney
belayie lay sefro " "
tsdqn andalሠra " "
yzognal qesfo " "

VERSE 1
ዓlemawi neger " "
yexeqemegn meslugn " "
bediyablos tanqie qerehu " "
kediyablos gemed " "

VERSE 2
ኸre anchiw awcign " "
azapit neshna " "
atetcekpibgn " "', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=-CaXgCm8rKg', 'draft', 'pending', 'https://www.youtube.com/watch?v=-CaXgCm8rKg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('yemiyashagrewn', 'repentance', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wedante-emexalehu-adera-nefsien', 'ወዳንተ እመጣለሁ አደራ ነፍሴን', 'ወዳንተ እመጣለሁ አደራ ነፍሴን', 'wedante emexalehu adera nefsien', 'Ethiopian Orthodox Tewahedo Mezmur - ወዳንተ እመጣለሁ አደራ ነፍሴን', 'በሰማያዊ ቤት አኑር ሕይወቴን', 'besemayawi biet anur ሕywetien', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=7S3PgjVtkmY', 'draft', 'pending', 'https://www.youtube.com/watch?v=7S3PgjVtkmY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gieta-yalew', 'ጌታ ያለው', 'ጌታ ያለው', 'gieta yalew', 'Ethiopian Orthodox Tewahedo Mezmur - ጌታ ያለው', 'ጌታ ያለው ሁሉም አለው
የዘለዓለም ሕይወት ባለቤት ነው
እመኑ በጌታ ይህ ብቻ ይበቃል
የቀረውን እርሱ በፍቅሩ ይሰጣል', 'gieta yalew hulum alew
yezeleዓlem ሕywet balebiet new
emenu begieta yh bcha ybeqal
yeqerewn ersu befqru ysexal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Uf67chvOJNM', 'draft', 'pending', 'https://www.youtube.com/watch?v=Uf67chvOJNM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('selam-laxu-selam-fqrn-laxu-fqrn', 'ሰላም ላጡ ሰላም ፍቅርን ላጡ ፍቅርን', 'ሰላም ላጡ ሰላም ፍቅርን ላጡ ፍቅርን', 'selam laxu selam fqrn laxu fqrn', 'Ethiopian Orthodox Tewahedo Mezmur - ሰላም ላጡ ሰላም ፍቅርን ላጡ ፍቅርን', 'ለታረዙት ልብስን ለተራቡት እንጀራን
ለተጠሙት ውኃን ለታመሙት ፈውሰን
ተስፋ ላጡ ተስፋን ለደካሞች ኃይልን፡፡', 'letarezut lbsn leterabut enjeran
letexemut wኃn letamemut fewsen
tesfa laxu tesfan ledekamoch ኃyln፡፡', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=uZwTNuZrSzo', 'draft', 'pending', 'https://www.youtube.com/watch?v=uZwTNuZrSzo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yemnmekabsh-meselal-anchi-nesh-2', 'የምንመካብሽ መሰላል አንቺ ነሽ /2/', 'የምንመካብሽ መሰላል አንቺ ነሽ /2/', 'yemnmekabsh meselal anchi nesh /2/', 'Ethiopian Orthodox Tewahedo Mezmur - የምንመካብሽ መሰላል አንቺ ነሽ /2/', 'ቅድስና ላንቺ ጽድቅም ላንቺ ሆኖ
ዓለምን የፈጠረ በአንቺ ተወስኖ
የገነት ፍሬ ነሽ ሕይወትን ያፈራሽ
አንቺን ለመረጠ አንቺን ላነጻሽ

VERSE 1
ምስጋና ይድረሰው ለቸሩ አምላክሽ /2/', 'qdsna lanchi tsdqm lanchi hono
ዓlemn yefexere beanchi tewesno
yegenet frie nesh ሕywetn yaferash
anchin lemerexe anchin lanetsash

VERSE 1
msgana ydresew lecheru amlaksh /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=n_aRltG-c6M', 'draft', 'pending', 'https://www.youtube.com/watch?v=n_aRltG-c6M', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('yemnmekabsh-meselal-anchi-nesh-2', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlakie-sileyegn-ysemagnal', 'አምላኬ ሲለየኝ ይሰማኛል', 'አምላኬ ሲለየኝ ይሰማኛል', 'amlakie sileyegn ysemagnal', 'Ethiopian Orthodox Tewahedo Mezmur - አምላኬ ሲለየኝ ይሰማኛል', 'አምላኬ ሲለየኝ ይሰማኛል', 'amlakie sileyegn ysemagnal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=fSfhM3MgsLc', 'draft', 'pending', 'https://www.youtube.com/watch?v=fSfhM3MgsLc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-xiat-bemenor-bezih-lem', 'በኃጢአት በመኖር በዚህ ዓለም', 'በኃጢአት በመኖር በዚህ ዓለም', 'beኃxiat bemenor bezih ዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - በኃጢአት በመኖር በዚህ ዓለም', 'የአምላክን ትዕዛዝ በማጣመም
በስርቆት በዝሙት በሰካር
በዲያብሎስ ፈቃድ ስንኖር
የኋላ የኋላ ውድቀት ነው

VERSE 1
አምላክ በክንዶቹ ያልያዘው
የጨለማ ጉዞ ምን ይጥማል
ዓይን እያሳወረ ያዋርዳል', 'yeamlakn tዕzaz bemaxamem
besrqot bezmut besekar
bediyablos feqad snnor
yehuala yehuala wdqet new

VERSE 1
amlak bekndochu yalyazew
yecelema guzo mn yxmal
ዓyn eyasawere yawardal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=PNtVPK4pPNA', 'draft', 'pending', 'https://www.youtube.com/watch?v=PNtVPK4pPNA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('be-xiat-bemenor-bezih-lem', 'repentance', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yezemenu-xa-t-genzeb-eyasaten', 'የዘመኑ ጣዖት ገንዘብ እያሳተን', 'የዘመኑ ጣዖት ገንዘብ እያሳተን', 'yezemenu xaዖt genzeb eyasaten', 'Ethiopian Orthodox Tewahedo Mezmur - የዘመኑ ጣዖት ገንዘብ እያሳተን', 'ይህ ደካማ ሥጋ አምላክን አስተወን
ግብዝነት ሞልቶት ፈራሹ አካል
በነፍስ በሽታ ሕዝባችን ታሟል/2/', 'yh dekama ሥga amlakn astewen
gbznet moltot ferashu akal
benefs beshta ሕzbachn tamual/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=KkRXLgPbswk', 'draft', 'pending', 'https://www.youtube.com/watch?v=KkRXLgPbswk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('knfachn-temetto-mebrer-aqtonal', 'ክንፋችን ተመትቶ መብረር አቅቶናል', 'ክንፋችን ተመትቶ መብረር አቅቶናል', 'knfachn temetto mebrer aqtonal', 'Ethiopian Orthodox Tewahedo Mezmur - ክንፋችን ተመትቶ መብረር አቅቶናል', 'በመንፈስ በሽታ ሕዝባችን ታውኳል
ምግባር የጐጉደለን ተራ ሰው ስለሆን
እባክህ ጌታችን በፍጥነት ታረቀን /2/', 'bemenfes beshta ሕzbachn tawkual
mgbar yeጐgudelen tera sew slehon
ebakh gietachn befxnet tareqen /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=1pD_-YGvUhQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=1pD_-YGvUhQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zbhn-bark-lezelalem-xebqachew-2', 'ሕዝብህን ባርክ ለዘላለም ጠብቃቸው /2/', 'ሕዝብህን ባርክ ለዘላለም ጠብቃቸው /2/', 'ሕzbhn bark lezelalem xebqachew /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሕዝብህን ባርክ ለዘላለም ጠብቃቸው /2/', 'በፍቅርህም ከፍ አድርጋቸው /3/', 'befqrhm kef adrgachew /3/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ku8JzJM3m1U', 'draft', 'pending', 'https://www.youtube.com/watch?v=ku8JzJM3m1U', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('egziab-r-lyu-new', 'እግዚአብሔር ልዩ ነው', 'እግዚአብሔር ልዩ ነው', 'egziabሔr lyu new', 'Ethiopian Orthodox Tewahedo Mezmur - እግዚአብሔር ልዩ ነው', 'እግዚአብሔር ልዩ ነው ኃያል አምላካችን ልዩ ነው /3/
ሞትን ድል የነሳው ልዩ ነው /2/
ከክብርና ሞገስ ሞልቶ የተረፈው ልዩ ነው
ብርሃንን እንደ ልብስ የተጐናፀፈው ልዩ ነው

VERSE 1
በትዕዛዝ ብቻ ዓለምን ያቆመው ልዩ ነው
እኛን የተቤዣ በእውነት ልዩ ነው /2/', 'egziabሔr lyu new ኃyal amlakachn lyu new /3/
motn dl yenesaw lyu new /2/
kekbrna moges molto yeterefew lyu new
brሃnn ende lbs yeteጐnaፀfew lyu new

VERSE 1
betዕzaz bcha ዓlemn yaqomew lyu new
egnan yetebiezha beewnet lyu new /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=fcYpMuLWzOU', 'draft', 'pending', 'https://www.youtube.com/watch?v=fcYpMuLWzOU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('esey-esey', 'እሰይ እሰይ', 'እሰይ እሰይ', 'esey esey', 'Ethiopian Orthodox Tewahedo Mezmur - እሰይ እሰይ', 'እስቲ እሰይ እሰይ እሰይ እሰይ
አምላክ ከእኔ ጋር ነው እሰይ እሰይ
ያጣ ሰው ብመስል እሰይ እሰይ ንብረት ባይኖረኝ እሰይ
አሰይ

VERSE 1
የአምላኬ ፊትህ እሰይ እሰይ ትቶቃስ አያውቅ እሰይ
አሰይ
ደኻ ሰው መስዬ እሰይ እሰይ የሰው ዓይን ሲጠላኝ', 'esti esey esey esey esey
amlak keenie gar new esey esey
yaxa sew bmesl esey esey nbret baynoregn esey
asey

VERSE 1
yeamlakie fith esey esey ttoqas ayawq esey
asey
deኻ sew mesyie esey esey yesew ዓyn sixelagn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=mH9zK-x3_Mk', 'draft', 'pending', 'https://www.youtube.com/watch?v=mH9zK-x3_Mk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('esey-esey', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kenetenkolua-lem-muach-nech', 'ከነተንኮሏ ዓለም ሟች ነች', 'ከነተንኮሏ ዓለም ሟች ነች', 'kenetenkolua ዓlem muach nech', 'Ethiopian Orthodox Tewahedo Mezmur - ከነተንኮሏ ዓለም ሟች ነች', 'እሾህ በቅሎባት እሾህ ሆና
በመተላለፍ ሰው ሊያልቅ ነዋ', 'eshoh beqlobat eshoh hona
bemetelalef sew liyalq newa', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=QeKbiJQQucg', 'draft', 'pending', 'https://www.youtube.com/watch?v=QeKbiJQQucg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keegna-gar-yalew-yl-new', 'ከእኛ ጋር ያለው ኃይል ነው', 'ከእኛ ጋር ያለው ኃይል ነው', 'keegna gar yalew ኃyl new', 'Ethiopian Orthodox Tewahedo Mezmur - ከእኛ ጋር ያለው ኃይል ነው', 'በሥጋዊው ዓይን ባናየው
የጦሩ ብዛት መቼ ያድናል
የዓለም ጥንስስ ተዋሕዷል', 'beሥgawiw ዓyn banayew
yexoru bzat mechie yadnal
yeዓlem xnss tewaሕdual', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=zIo-asuj8uk', 'draft', 'pending', 'https://www.youtube.com/watch?v=zIo-asuj8uk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ende-lem-gulbet-gulbetegna', 'እንደ ዓለም ጉልበት ጉልበተኛ', 'እንደ ዓለም ጉልበት ጉልበተኛ', 'ende ዓlem gulbet gulbetegna', 'Ethiopian Orthodox Tewahedo Mezmur - እንደ ዓለም ጉልበት ጉልበተኛ', 'በአምላክ ፊት ሲታይ ሕመምተኛ', 'beamlak fit sitay ሕmemtegna', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=MzapG3vMrIg', 'draft', 'pending', 'https://www.youtube.com/watch?v=MzapG3vMrIg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yehodien-zen-yelbien-m-xir', 'የሆዴን ሐዘን የልቤን ምሥጢር', 'የሆዴን ሐዘን የልቤን ምሥጢር', 'yehodien ሐzen yelbien mሥxir', 'Ethiopian Orthodox Tewahedo Mezmur - የሆዴን ሐዘን የልቤን ምሥጢር', 'እነግርሻለሁ አንድም ሳይቀር
የምትሸሸጊ የሕዝብን ኃጢአት
ለእኔስ ልዩ ነሽ ድንግል አዛት', 'enegrshalehu andm sayqer
yemtsheshegi yeሕzbn ኃxiat
leenies lyu nesh dngl azat', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=IxXUTzkLfug', 'draft', 'pending', 'https://www.youtube.com/watch?v=IxXUTzkLfug', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('xa-mu-lyu-new-keanchi-gar-menor', 'ጣዕሙ ልዩ ነው ከአንቺ ጋር መኖር', 'ጣዕሙ ልዩ ነው ከአንቺ ጋር መኖር', 'xaዕmu lyu new keanchi gar menor', 'Ethiopian Orthodox Tewahedo Mezmur - ጣዕሙ ልዩ ነው ከአንቺ ጋር መኖር', 'ድንግልን ይፔ መቼም አላፍር', 'dngln ypie mechiem alafr', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=4AJIpDH35XU', 'draft', 'pending', 'https://www.youtube.com/watch?v=4AJIpDH35XU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ke-xiat-edf-ntsu-mehognayie', 'ከኃጢአት እድፍ ንጹሕ መሆኛዬ', 'ከኃጢአት እድፍ ንጹሕ መሆኛዬ', 'keኃxiat edf ntsuሕ mehognayie', 'Ethiopian Orthodox Tewahedo Mezmur - ከኃጢአት እድፍ ንጹሕ መሆኛዬ', 'አንቺ ነሽ ለአኔ የኔስ መጽናኛዬ', 'anchi nesh leanie yenies metsnagnayie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=quyAAUfF5Aw', 'draft', 'pending', 'https://www.youtube.com/watch?v=quyAAUfF5Aw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('ke-xiat-edf-ntsu-mehognayie', 'repentance', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-xiat-qusl-yaleanchi-ayxegm', 'የኃጢአት ቁስል ያለአንቺ አይጠግም', 'የኃጢአት ቁስል ያለአንቺ አይጠግም', 'yeኃxiat qusl yaleanchi ayxegm', 'Ethiopian Orthodox Tewahedo Mezmur - የኃጢአት ቁስል ያለአንቺ አይጠግም', 'ልቤ ሳይፈቅድ በሕይወት አልኖርም
ከልጅሽ ሌላ ምደኅን የለኝም
ከጸሎት በቀር ፍጹም አልድንም', 'lbie sayfeqd beሕywet alnorm
keljsh liela mdeኅn yelegnm
ketselot beqer ftsum aldnm', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=x2QVNfvwVzU', 'draft', 'pending', 'https://www.youtube.com/watch?v=x2QVNfvwVzU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('ye-xiat-qusl-yaleanchi-ayxegm', 'repentance', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('motual-blew-qebrewgn-sewoch', 'ሞቷል ብለው ቀብረውኝ ሰዎች', 'ሞቷል ብለው ቀብረውኝ ሰዎች', 'motual blew qebrewgn sewoch', 'Ethiopian Orthodox Tewahedo Mezmur - ሞቷል ብለው ቀብረውኝ ሰዎች', 'ምስኪን ሆጌ ሳይኖረኝ አንዳች
ከመቃብር ቆፋሮ አወጣኝ', 'mskin hogie saynoregn andach
kemeqabr qofaro awexagn', 'amharic', 'mezmur', 'ሊቀ መዘምራን  ይልማ ኃይሉ', 'https://www.youtube.com/watch?v=SxPu1RLeQ-k', 'draft', 'pending', 'https://www.youtube.com/watch?v=SxPu1RLeQ-k', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lbie-afeleqe-ale-melkam-neger', 'ልቤ አፈለቀ አለ መልካም ነገር', 'ልቤ አፈለቀ አለ መልካም ነገር', 'lbie afeleqe ale melkam neger', 'Ethiopian Orthodox Tewahedo Mezmur - ልቤ አፈለቀ አለ መልካም ነገር', 'ከእመቤቴ ጋራ ሲነጋገር
ከድንግል ማርያም ጋር ሲነጋገር', 'keemebietie gara sinegager
kedngl maryam gar sinegager', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=4QM5Xn1ZHIw', 'draft', 'pending', 'https://www.youtube.com/watch?v=4QM5Xn1ZHIw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('and-welda-smun-abezachw', 'አንድ ወልዳ ስሙን አበዛችው', 'አንድ ወልዳ ስሙን አበዛችው', 'and welda smun abezachw', 'Ethiopian Orthodox Tewahedo Mezmur - አንድ ወልዳ ስሙን አበዛችው', 'ተዋሐደ ስትል አማኑኤል አለችው
ሕሙማን ሲፈውስ ኢየሱስ አለችው
ንጉሥ ነውም ብላ ክርስቶስ አለችው
ተሰቅለ ስታየው መደኅኑ አለችው

VERSE 1
ለመናጌኔጌው ጸሎት ልዩ ዕጣን
የዋሻው ሻማ ነሽ እመብርሃን
መዓዛሽ ሸተተኝ ከግሸን /ከጽዮን/
ትናፍቂኛለሽ ምን ልሁን

VERSE 2
ትርቢኝማለሽ ምን ልሁን', 'tewaሐde stl amanuiel alechw
ሕmuman sifews iyesus alechw
nguሥ newm bla krstos alechw
teseqle stayew medeኅnu alechw

VERSE 1
lemenagieniegiew tselot lyu ዕxan
yewashaw shama nesh emebrሃn
meዓzash shetetegn kegshen /ketsyon/
tnafqignalesh mn lhun

VERSE 2
trbignmalesh mn lhun', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=IaQnETd2mfQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=IaQnETd2mfQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('and-welda-smun-abezachw', 'abune-gebre-menfes-kidus', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-emebietie-yeenie-eredat', 'ድንግል እመቤቴ የእኔ እረዳት', 'ድንግል እመቤቴ የእኔ እረዳት', 'dngl emebietie yeenie eredat', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል እመቤቴ የእኔ እረዳት', 'ዳዊት በመዝሙሩ ያነሳሻል
የያዕቆብ ድንኳን ነሽ ይልሻል
የእግዚአብሔር ሀገር የሚሉሽ
እመቤቴ ማርያም አንቺ ነሽ /2/

VERSE 1
ቤተልሔም ስሄድ አይሻለሁ
ቀራንዮ ስሔድ አይሻለሁ', 'dawit bemezmuru yanesashal
yeyaዕqob dnkuan nesh ylshal
yeegziabሔr hager yemilush
emebietie maryam anchi nesh /2/

VERSE 1
bietelሔm shed ayshalehu
qeranyo sሔd ayshalehu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=5xmNETbqgGE', 'draft', 'pending', 'https://www.youtube.com/watch?v=5xmNETbqgGE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ftsum-atleym-keljsh', 'ፍጹም አትለይም ከልጅሽ', 'ፍጹም አትለይም ከልጅሽ', 'ftsum atleym keljsh', 'Ethiopian Orthodox Tewahedo Mezmur - ፍጹም አትለይም ከልጅሽ', 'የአንቺስ ልዩ ነው ፍቅርሽ /2/', 'yeanchis lyu new fqrsh /2/', 'amharic', 'mezmur', 'ዘማሪ ቀሲስ ምንዳዬ ብርሃኑ', 'https://www.youtube.com/watch?v=7SfMzqHEPgk', 'draft', 'pending', 'https://www.youtube.com/watch?v=7SfMzqHEPgk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kewegenie-gara-ezemralehugn', 'ከወገኔ ጋራ እዘምራለሁኝ', 'ከወገኔ ጋራ እዘምራለሁኝ', 'kewegenie gara ezemralehugn', 'Ethiopian Orthodox Tewahedo Mezmur - ከወገኔ ጋራ እዘምራለሁኝ', 'በደስታ በሐሴት ስሙን እጠራለሁኝ
ምግብና መጠጤ አምላኬ ነውና', 'bedesta beሐsiet smun exeralehugn
mgbna mexexie amlakie newna', 'amharic', 'mezmur', 'ሊቀ መዘምራን  ይልማ ኃይሉ', 'https://www.youtube.com/watch?v=M4f6KwIa-U8', 'draft', 'pending', 'https://www.youtube.com/watch?v=M4f6KwIa-U8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('kewegenie-gara-ezemralehugn', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kesemayawit-iyerusaliem', 'ከሰማያዊት ኢየሩሳሌም', 'ከሰማያዊት ኢየሩሳሌም', 'kesemayawit iyerusaliem', 'Ethiopian Orthodox Tewahedo Mezmur - ከሰማያዊት ኢየሩሳሌም', 'ዛሬ ብንገባ እናገኛለን የአምላክን ሰላም
577. ኪዳነ ምሕረት ሩኀሩኀ
ኪዳነምሕረት ርኅሩኅ ተይ አታቁሚኝ ከበሩ
የሲዖል አለንጋ መራራ ነው አሉ

VERSE 1
አንቺ አማልጅኝ እግዝእትነ ኩሉ ሰጊድ ሰላም /2/
ኃያል እንዲህ ነው ኃያል ቅዱስ ሚካኤል ኃያል
የለበሰው ልብሱ የወርቅ ሐመልማል
የታጠቀው ሰይፉ የእሳት ነበልባል

VERSE 2
ይህም ተጽፏል በቅዱስ ቃል ሰጊድ ሰላም/2/
ኃያል እንዲህ ነው ኃያል ቅዱስ ገብርኤል ኃያል
ሠለስቱ ደቂቅን ከእቶን ያዳናቸው
ቂርቆስ ኢየሉጣን ከእሳት ያወጣቸው

VERSE 3
የሚረዳን ፈጥኖ ደራሽ ቅዱስ ገብርኤል ነው /2/
ሰማዕት እንዲህ ነው ሰማዕት
ቅዱሰ ጊዮርጊስ ሰማዕት
ለወዳጆቹ ፈጥኖ ሲደርስ

VERSE 4
ጣላቶቹንም ሲደመስስ
ጊዮርጊስ ዘልዳው ንጉሥ
ጻድቅ እንዲህ ነው ጻድቅ ተክለ ሃይማኖት
ጻድቅ

VERSE 5
በአንድ እግራቸው ቆመው ለሰባት ዓመት
ጠላትን ድል ነሱ በጾምና በጸሎት /2/', 'zarie bngeba enagegnalen yeamlakn selam
577. kidane mሕret ruኀruኀ
kidanemሕret rኅruኅ tey ataqumign keberu
yesiዖl alenga merara new alu

VERSE 1
anchi amaljgn egzetne kulu segid selam /2/
ኃyal endih new ኃyal qdus mikaiel ኃyal
yelebesew lbsu yewerq ሐmelmal
yetaxeqew seyfu yeesat nebelbal

VERSE 2
yhm tetsfual beqdus qal segid selam/2/
ኃyal endih new ኃyal qdus gebriel ኃyal
ሠlestu deqiqn keeton yadanachew
qirqos iyeluxan keesat yawexachew

VERSE 3
yemiredan fexno derash qdus gebriel new /2/
semaዕt endih new semaዕt
qduse giyorgis semaዕt
lewedajochu fexno siders

VERSE 4
xalatochunm sidemess
giyorgis zeldaw nguሥ
tsadq endih new tsadq tekle ሃymanot
tsadq

VERSE 5
beand egrachew qomew lesebat ዓmet
xelatn dl nesu betsomna betselot /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=kcWWoLStxqc', 'draft', 'pending', 'https://www.youtube.com/watch?v=kcWWoLStxqc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('kesemayawit-iyerusaliem', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yesemay-yemdr-yearyam-ng-t', 'የሰማይ የምድር የአርያም ንግሥት', 'የሰማይ የምድር የአርያም ንግሥት', 'yesemay yemdr yearyam ngሥt', 'Ethiopian Orthodox Tewahedo Mezmur - የሰማይ የምድር የአርያም ንግሥት', 'የሰማይ የምድር የአርያም ንግሥት
የሰማይ የምድር የአርያም ንግሥት
አንቺ ነሸ አመቤት አምላክ አናት
ክኸ /2/ ድንግል አማልጅን

VERSE 1
አኸ /2/ ቅድስት ተራጅኝ
የሰማይ የምድር የአርያም ንግሥት
አንቺ ነሸ እመቤት አምላክ እናት', 'yesemay yemdr yearyam ngሥt
yesemay yemdr yearyam ngሥt
anchi neshe amebiet amlak anat
kኸ /2/ dngl amaljn

VERSE 1
aኸ /2/ qdst terajgn
yesemay yemdr yearyam ngሥt
anchi neshe emebiet amlak enat', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=TLJJh1mKrHE', 'draft', 'pending', 'https://www.youtube.com/watch?v=TLJJh1mKrHE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeabr-m-ersha-yem-xir-washaw', 'የአብርሃም እርሻ የምሥጢር ዋሻው', 'የአብርሃም እርሻ የምሥጢር ዋሻው', 'yeabrሃm ersha yemሥxir washaw', 'Ethiopian Orthodox Tewahedo Mezmur - የአብርሃም እርሻ የምሥጢር ዋሻው', 'እናትና ድንግል ሁለቱን ሆንሽው', 'enatna dngl huletun honshw', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=F4B3WoPqqnU', 'draft', 'pending', 'https://www.youtube.com/watch?v=F4B3WoPqqnU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('xiatiem-bereta-selexenebgn', 'ኃጢአቴም በረታ ሰለጠነብኝ', 'ኃጢአቴም በረታ ሰለጠነብኝ', 'ኃxiatiem bereta selexenebgn', 'Ethiopian Orthodox Tewahedo Mezmur - ኃጢአቴም በረታ ሰለጠነብኝ', 'ከቃልህ አስወጣኝ ሕግህን ጣስኩኝ
እንደነነዌ ሕዝብ ንስሓን ስጠኝ
ምሕረትህን ልከህ ልቤን ስበርልኝ', 'keqalh aswexagn ሕghn xaskugn
endenenewie ሕzb nsሓn sxegn
mሕrethn lkeh lbien sberlgn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=hwBYjONHqFQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=hwBYjONHqFQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('giyorgis-beziyach-qen-kefetenaw-antsar', 'ጊዮርጊስ በዚያች ቀን ከፈተናው አንጻር', 'ጊዮርጊስ በዚያች ቀን ከፈተናው አንጻር', 'giyorgis beziyach qen kefetenaw antsar', 'Ethiopian Orthodox Tewahedo Mezmur - ጊዮርጊስ በዚያች ቀን ከፈተናው አንጻር', 'ሰለሃይማኖቱ የታየው ምን ነበር
ያመነው አምላክ አላውቀውም እንዲል
በሥልጣን በገንዘብ እርሱን ለመሸንገል
ነገር ሲሸርቡበት የዱዲያኖስ ጭፍሮች

VERSE 1
ለመሥዋዕት ሲቀርብ መንፈሱ ምን አለች', 'seleሃymanotu yetayew mn neber
yamenew amlak alawqewm endil
beሥlxan begenzeb ersun lemeshengel
neger sisherbubet yedudiyanos cfroch

VERSE 1
lemeሥwaዕt siqerb menfesu mn alech', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=_Ourr1kAosA', 'draft', 'pending', 'https://www.youtube.com/watch?v=_Ourr1kAosA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlakachn-temesgen-2-lezih-qen-yaderesken', 'አምላካችን ተመስገን /2/ ለዚህ ቀን ያደረስከን', 'አምላካችን ተመስገን /2/ ለዚህ ቀን ያደረስከን', 'amlakachn temesgen /2/ lezih qen yaderesken', 'Ethiopian Orthodox Tewahedo Mezmur - አምላካችን ተመስገን /2/ ለዚህ ቀን ያደረስከን', 'በኃጢአት ስንማቅቅ በምሕረትህ ጠራኸን', 'beኃxiat snmaqq bemሕreth xeraኸn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=xGYQQe8a0pg', 'draft', 'pending', 'https://www.youtube.com/watch?v=xGYQQe8a0pg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('amlakachn-temesgen-2-lezih-qen-yaderesken', 'repentance', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-hoy-bemljash-keljsh-astarqin', 'ድንግል ሆይ በምልጃሽ ከልጅሽ አስታርቂን', 'ድንግል ሆይ በምልጃሽ ከልጅሽ አስታርቂን', 'dngl hoy bemljash keljsh astarqin', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል ሆይ በምልጃሽ ከልጅሽ አስታርቂን', 'ጥሪህን ስንሰማ ወደአንተ እንድንመጣ
በሕግህ ልንኖር ከቤትህ ሳንወጣ
በሕይወት ስንደክም እንዳንጠፋ በዓለም
እርዳን ፈጣሪያችን ቸሩ መድኃኔዓለም', 'xrihn snsema wedeante endnmexa
beሕgh lnnor kebieth sanwexa
beሕywet sndekm endanxefa beዓlem
erdan fexariyachn cheru medኃnieዓlem', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=YP7Y0eMFJrc', 'draft', 'pending', 'https://www.youtube.com/watch?v=YP7Y0eMFJrc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('r-r-te-lina-qdst-enatachn', 'ርኅርኅተ ኅሊና ቅድስት እናታችን', 'ርኅርኅተ ኅሊና ቅድስት እናታችን', 'rኅrኅte ኅlina qdst enatachn', 'Ethiopian Orthodox Tewahedo Mezmur - ርኅርኅተ ኅሊና ቅድስት እናታችን', 'አሳስቢ ሁል ጊዜ ስለ ኃጢአታችን
ሊያድነን ነውና ክርስቶስ መሞቱ
አሳስቢ እመአምላክ ድንግል ወላዲቱ
584. የቅዱሳን አምላክ

VERSE 1
አብርሃምን ከካራን የጠራኸው ጌታ
ለሙሴ በሲና የሆንከው መከታ
ልጠፋ ነውና በሥጋ ፍላጎት
የይስሐቅም ጌታ ሕይወቴን ታደጋት /2/

VERSE 2
የኤርትራን ባሕር በኃይልህ የከፈልክ
በሲና በረሃ ሕዝብህን የመገብክ
ኖኅ ከጥፋት ውኃ የዳነብህ አምላክ
ሎጥን እንዳዳንከው ፍጹም ምሕረትን ሳክ /2/

VERSE 3
የተነበዩልህ ነቢያት በሙሉ
አምላክ ሰው ይሆናል ይወለዳል ሲሉ
ከዓሣ አንበሪ ሆድ ዮናስን ያወጣህ
ዓለም ልትውጠኝ ነው አይለየኝ ጸጋህ /2/

VERSE 4
ሥጋን ተዋሕደህ በወሰንከው ሰዓት
የሞትክልኝ አምላክ ያዳንከኝ ከሞት ሞት
እንደወንጌልህ ሕግ የምኖር አድርገኝ
በመጨረሻው ቀን በቀኝህ አድርገኝ /2/

VERSE 5
አልቻልኩኝምና ልፈጽ፳ም ሕግህን
የሐዋርያት አጽናኝ ስጠኝ ብርታትህን
ምግባረ ጎደሎ ሆኛለሁኝና
የቅዱሳን አምላክ እርዳኝ እንድጸና /2/

VERSE 6
585. ድንግል ሆይ
ወላዲተ አምላክ የሁሉ እመቤት
ለምኝልን ለእኛ ከልጅሽ ምሕረት
በአንቺ አማላጅነት በእርሱ ቸርነት

VERSE 7
እንዲያወጣን ነጻ ከፍርድ ቅጣት
ድንግል ሆይ ለምኝልን /2/
በበደል ተዳክሞ ፈቃደ ነፍሳችን
በምድራዊ ምኞት ናውዞ ልቦናችን

VERSE 8
ፍቅርና ትሕትና ጠፍቶ ከፊታችን
ለሞት እንዳይሰጠን ይህ ክፉ ሥራችን', 'asasbi hul gizie sle ኃxiatachn
liyadnen newna krstos memotu
asasbi emeamlak dngl weladitu
584. yeqdusan amlak

VERSE 1
abrሃmn kekaran yexeraኸw gieta
lemusie besina yehonkew meketa
lxefa newna beሥga flagot
yeysሐqm gieta ሕywetien tadegat /2/

VERSE 2
yeiertran baሕr beኃylh yekefelk
besina bereሃ ሕzbhn yemegebk
noኅ kexfat wኃ yedanebh amlak
loxn endadankew ftsum mሕretn sak /2/

VERSE 3
yetenebeyulh nebiyat bemulu
amlak sew yhonal yweledal silu
keዓሣ anberi hod yonasn yawexah
ዓlem ltwxegn new ayleyegn tsegah /2/

VERSE 4
ሥgan tewaሕdeh bewesenkew seዓt
yemotklgn amlak yadankegn kemot mot
endewengielh ሕg yemnor adrgegn
bemecereshaw qen beqegnh adrgegn /2/

VERSE 5
alchalkugnmna lfets፳m ሕghn
yeሐwaryat atsnagn sxegn brtathn
mgbare godelo hognalehugnna
yeqdusan amlak erdagn endtsena /2/

VERSE 6
585. dngl hoy
weladite amlak yehulu emebiet
lemgnln leegna keljsh mሕret
beanchi amalajnet beersu chernet

VERSE 7
endiyawexan netsa kefrd qxat
dngl hoy lemgnln /2/
bebedel tedakmo feqade nefsachn
bemdrawi mgnot nawzo lbonachn

VERSE 8
fqrna tሕtna xefto kefitachn
lemot endaysexen yh kfu ሥrachn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=XA4kRebRcpk', 'draft', 'pending', 'https://www.youtube.com/watch?v=XA4kRebRcpk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ell-belu-yegobegnachhu', 'እልል በሉ የጎበኛችሁ', 'እልል በሉ የጎበኛችሁ', 'ell belu yegobegnachhu', 'Ethiopian Orthodox Tewahedo Mezmur - እልል በሉ የጎበኛችሁ', 'በምሕረቱ አምላክ ያያችሁ
በችግር ቀን ያሰበን ሁሉ አመስግኑ ዝምም
አትበሉ
ድንግል ማርያም ትጸልያለች

VERSE 1
ኃጥኡን ሰው ማረው እያለች
በድንግል ክብር እንኖራለን
በጽኑ ፍቅር አንዴ እንዲያድነን
588. ዴማስ ሆይ ተመለስ

VERSE 2
የይሁዳ ጉዞ አያዋጣምና
ዴማስ ወደ ሕይወት እባክህ ቶሎ ና /2/
ከወንጌል ገበታ መመገብ ጀምረህ
ወንድሜ ተመለስ ወዴት ትሄዳለህ

VERSE 3
ይጠራሃልና መስቀሉን ተመልከት
የወንጌል ቡቃያ አውነተኛ ሕይወት /2/', 'bemሕretu amlak yayachhu
bechgr qen yaseben hulu amesgnu zmm
atbelu
dngl maryam ttselyalech

VERSE 1
ኃxun sew marew eyalech
bedngl kbr ennoralen
betsnu fqr andie endiyadnen
588. diemas hoy temeles

VERSE 2
yeyhuda guzo ayawaxamna
diemas wede ሕywet ebakh tolo na /2/
kewengiel gebeta memegeb jemreh
wendmie temeles wediet thedaleh

VERSE 3
yxeraሃlna mesqelun temelket
yewengiel buqaya awnetegna ሕywet /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=iJWCdu1h03I', 'draft', 'pending', 'https://www.youtube.com/watch?v=iJWCdu1h03I', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('basemat-gizie-qalun-qdus-gebriel-beleza', 'ባሰማት ጊዜ ቃሉን ቅዱስ ገብርኤል በለዛ', 'ባሰማት ጊዜ ቃሉን ቅዱስ ገብርኤል በለዛ', 'basemat gizie qalun qdus gebriel beleza', 'Ethiopian Orthodox Tewahedo Mezmur - ባሰማት ጊዜ ቃሉን ቅዱስ ገብርኤል በለዛ', 'ድንግል ቀረበች ወደ አርሱ ፍጹም ትኅትናን ይዛ
ተፀንሻለሽ ሲላት መልአኩ ፍጹም በልቧ ሳትመካ
እንደ ቃልህ ይን አለችው በቃሉ ተማርካ /2/', 'dngl qerebech wede arsu ftsum tኅtnan yza
teፀnshalesh silat melaku ftsum belbua satmeka
ende qalh yn alechw beqalu temarka /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=vlKJzLbhDtc', 'draft', 'pending', 'https://www.youtube.com/watch?v=vlKJzLbhDtc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abatachn', 'አባታችን', 'አባታችን', 'abatachn', 'Ethiopian Orthodox Tewahedo Mezmur - አባታችን', 'አባታችን ሆይ የምትኖር በሰማይ
መንግሥትህ ትምጣልን ክብርህን እንድናይ/2/
ፈቃድህ በሰማይ ሕይወት እንደሆነ
አንዲሁም በምድር ስላምን ስጠን/2/

VERSE 1
ስጠን ለዛሬ የዕለት ምግባችንን
በደላችንንም ይቅር እንድትለን''/2/
ጌታ ሆይ አታግባን ከክፉ ፈተና
አንተ ካልረዳኸን ኃይል የለንምና/2/

VERSE 2
ኃይልና ምስጋና መንግሥትም የአንተው ናት
አሜን ለዘለዓለም ይሁንልን ዕረፍት /2/
591.ሰላም ላንቺ ይሁን
ሰላም ላንቺ ይሁን (3) ማርያም ድንግል (2)

VERSE 3
የሴቶች መመኪያ የሴቶች አክሊል (2)
ሰላም ላንቺ ይሁን (3) የሁሉ አመቤት /2/
የኃጥአን ተስፋ የጻድቃን(2) ሕይወት /2/
ሰላም ላንቺ ይሁን/3/ የሁሉ ወዳጀጅ/2/

VERSE 4
የጽድቅ መሰላል የዓለም /2/ አማላጀጅ/2/', 'abatachn hoy yemtnor besemay
mengሥth tmxaln kbrhn endnay/2/
feqadh besemay ሕywet endehone
andihum bemdr slamn sxen/2/

VERSE 1
sxen lezarie yeዕlet mgbachnn
bedelachnnm yqr endtlen''/2/
gieta hoy atagban kekfu fetena
ante kalredaኸn ኃyl yelenmna/2/

VERSE 2
ኃylna msgana mengሥtm yeantew nat
amien lezeleዓlem yhunln ዕreft /2/
591.selam lanchi yhun
selam lanchi yhun (3) maryam dngl (2)

VERSE 3
yesietoch memekiya yesietoch aklil (2)
selam lanchi yhun (3) yehulu amebiet /2/
yeኃxan tesfa yetsadqan(2) ሕywet /2/
selam lanchi yhun/3/ yehulu wedajej/2/

VERSE 4
yetsdq meselal yeዓlem /2/ amalajej/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=OplRam5hvYs', 'draft', 'pending', 'https://www.youtube.com/watch?v=OplRam5hvYs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('krstos-besmh-yzenal-qenona', 'ክርስቶስ በስምህ ይዘናል ቀኖና', 'ክርስቶስ በስምህ ይዘናል ቀኖና', 'krstos besmh yzenal qenona', 'Ethiopian Orthodox Tewahedo Mezmur - ክርስቶስ በስምህ ይዘናል ቀኖና', 'ስቅለት ትንሣኤህን እናያለንና', 'sqlet tnሣiehn enayalenna', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=bK11i_QaFuc', 'draft', 'pending', 'https://www.youtube.com/watch?v=bK11i_QaFuc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('waryat-tsomew-leegna-abereketu', 'ሐዋርያት ጾመው ለእኛ አበረከቱ', 'ሐዋርያት ጾመው ለእኛ አበረከቱ', 'ሐwaryat tsomew leegna abereketu', 'Ethiopian Orthodox Tewahedo Mezmur - ሐዋርያት ጾመው ለእኛ አበረከቱ', 'ነፍስና ሥጋችን በመብል ተጣልተው
ሸማግሌ ሆኖ ጾም አስታረቃቸው
አብርው እያደሩ አብረው አይዋሉ', 'nefsna ሥgachn bemebl texaltew
shemaglie hono tsom astareqachew
abrw eyaderu abrew aywalu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=X2WMK6JQ7rA', 'draft', 'pending', 'https://www.youtube.com/watch?v=X2WMK6JQ7rA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('betsom-besubaie-tnoralech-taxqa', 'በጾም በሱባኤ ትኖራለች ታጥቃ፡፡', 'በጾም በሱባኤ ትኖራለች ታጥቃ፡፡', 'betsom besubaie tnoralech taxqa፡፡', 'Ethiopian Orthodox Tewahedo Mezmur - በጾም በሱባኤ ትኖራለች ታጥቃ፡፡', 'ነፍስም ለሥጋዋ ትመክረው ጀመረች
በብዙ ምሳሌ አያመሳሰለች', 'nefsm leሥgawa tmekrew jemerech
bebzu msalie ayamesaselech', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=mFc1QqyshO4', 'draft', 'pending', 'https://www.youtube.com/watch?v=mFc1QqyshO4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gayien-bluna-demien-xextachhu', 'ሥጋዬን ብሉና ደሜን ጠጥታችሁ', 'ሥጋዬን ብሉና ደሜን ጠጥታችሁ', 'ሥgayien bluna demien xextachhu', 'Ethiopian Orthodox Tewahedo Mezmur - ሥጋዬን ብሉና ደሜን ጠጥታችሁ', 'ዘለዓለማዊ ሕይወት ይኑራችሁ', 'zeleዓlemawi ሕywet ynurachhu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ZqvRXXAboMs', 'draft', 'pending', 'https://www.youtube.com/watch?v=ZqvRXXAboMs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('blo-neber-ersu-yemisemaw-xefa', 'ብሎ ነበር እርሱ የሚሰማው ጠፋ', 'ብሎ ነበር እርሱ የሚሰማው ጠፋ', 'blo neber ersu yemisemaw xefa', 'Ethiopian Orthodox Tewahedo Mezmur - ብሎ ነበር እርሱ የሚሰማው ጠፋ', 'ሁሉም በየድርሻው ምኛቱን ሲያስፋፋ', 'hulum beyedrshaw mgnatun siyasfafa', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Lk0S6E2TdOc', 'draft', 'pending', 'https://www.youtube.com/watch?v=Lk0S6E2TdOc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yhn-qdus-ga-yhn-kbur-dem', 'ይህን ቅዱስ ሥጋ ይህን ክቡር ደም', 'ይህን ቅዱስ ሥጋ ይህን ክቡር ደም', 'yhn qdus ሥga yhn kbur dem', 'Ethiopian Orthodox Tewahedo Mezmur - ይህን ቅዱስ ሥጋ ይህን ክቡር ደም', 'እንዴት ልጆች ብቻ በልተውት ይፈጸም', 'endiet ljoch bcha beltewt yfetsem', 'amharic', 'mezmur', 'ሊቀ መዘምራን ኪነጥበብ ወልደቂርቆስ', 'https://www.youtube.com/watch?v=0zyugm8H7EE', 'draft', 'pending', 'https://www.youtube.com/watch?v=0zyugm8H7EE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('asme-le-lem-m-retu-2', 'አስመ ለዓለም ምሕረቱ /2/', 'አስመ ለዓለም ምሕረቱ /2/', 'asme leዓlem mሕretu /2/', 'Ethiopian Orthodox Tewahedo Mezmur - አስመ ለዓለም ምሕረቱ /2/', 'አስመ ለዓለም ምሕረቱ /2/
የምይሞተው ሞቶ የተቀበረው/2/
ከገሀነም አሳት እኛን ሊያድን ነው/2/
አስመ ለዓለም -----------', 'asme leዓlem mሕretu /2/
yemymotew moto yeteqeberew/2/
kegehanem asat egnan liyadn new/2/
asme leዓlem -----------', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=AWmmx07EUqg', 'draft', 'pending', 'https://www.youtube.com/watch?v=AWmmx07EUqg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('setoch-tn-iehn-defrew-tenageru', 'ሰቶች ትንሣኤህን ደፍረው ተናገሩ', 'ሰቶች ትንሣኤህን ደፍረው ተናገሩ', 'setoch tnሣiehn defrew tenageru', 'Ethiopian Orthodox Tewahedo Mezmur - ሰቶች ትንሣኤህን ደፍረው ተናገሩ', 'አንሞታለን ብለው ማንንም ሳይፈሩ/2/
አናምናለን ----------', 'anmotalen blew mannm sayferu/2/
anamnalen ----------', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=QFPTdX9TtSk', 'draft', 'pending', 'https://www.youtube.com/watch?v=QFPTdX9TtSk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('selam-selam-maryam-dngl', 'ሰላም ሰላም ማርያም ድንግል', 'ሰላም ሰላም ማርያም ድንግል', 'selam selam maryam dngl', 'Ethiopian Orthodox Tewahedo Mezmur - ሰላም ሰላም ማርያም ድንግል', 'ሰላም ሰላም /2/ ማርያም ድንግል
ልመናሽ ለሚያምኑት ድኅነት ያስጣል /2/
ደቀ መዛሙርቱ በሐሣብ ሲዋኙ
ይኸው በቅርብ ቀን ምልክት አገኙ

VERSE 1
ሰላም ሰላም ----------', 'selam selam /2/ maryam dngl
lmenash lemiyamnut dኅnet yasxal /2/
deqe mezamurtu beሐሣb siwagnu
yኸw beqrb qen mlkt agegnu

VERSE 1
selam selam ----------', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=3le22lqnexg', 'draft', 'pending', 'https://www.youtube.com/watch?v=3le22lqnexg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemot-xla-wedqen-snkeratet-2', 'በሞት ጥላ ወድቀን ስንከራተት/2/', 'በሞት ጥላ ወድቀን ስንከራተት/2/', 'bemot xla wedqen snkeratet/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በሞት ጥላ ወድቀን ስንከራተት/2/', 'በረቀቀው ፍቅሩ ዋጀን ከጥፋት /2/
በጎልጎታ የታይ ፍጹም መድኃኒት', 'bereqeqew fqru wajen kexfat /2/
begolgota yetay ftsum medኃnit', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=JxtLIP_Bfo8', 'draft', 'pending', 'https://www.youtube.com/watch?v=JxtLIP_Bfo8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdst-enatachn-bietekrstiyan', 'ቅድስት እናታችን ቤተክርስቲያን', 'ቅድስት እናታችን ቤተክርስቲያን', 'qdst enatachn bietekrstiyan', 'Ethiopian Orthodox Tewahedo Mezmur - ቅድስት እናታችን ቤተክርስቲያን', 'ትጋብዘናለች ሥጋና ደሙን
የአማኑኤል ሥጋ ይኸው ተዘጋጀ
ከግብዣው ተጠራን አዋጁ ታወጀ
መጥቁ ተደወለ አንቅረብ በዕልልታ

VERSE 1
በኋላ አይረባንም ዋይታና ጫጫታ', 'tgabzenalech ሥgana demun
yeamanuiel ሥga yኸw tezegaje
kegbzhaw texeran awaju taweje
mexqu tedewele anqreb beዕllta

VERSE 1
behuala ayrebanm waytana cacata', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=srN1PknwPs8', 'draft', 'pending', 'https://www.youtube.com/watch?v=srN1PknwPs8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('layqer-memot-afer-melbes-megbat-kemeqabr', 'ላይቀር መሞት አፈር መልበስ መግባት ከመቃብር', 'ላይቀር መሞት አፈር መልበስ መግባት ከመቃብር', 'layqer memot afer melbes megbat kemeqabr', 'Ethiopian Orthodox Tewahedo Mezmur - ላይቀር መሞት አፈር መልበስ መግባት ከመቃብር', 'መስሉኝ ቋሚ ይህ ሥጋዬ ለእርሱ ብቻ ስጥር
ዘመን መቁጠር አለት ወራት ክረምት በጋ
ሌሊትና ቀን ሲፈራረቅ ሲጨልም ሲነጋ
በማየቴ ሆነ መደሰቴ/2/

VERSE 1
ኽረ ወዲያ ወዲልኝ ዋይ ብለሽ ለነፍሴ
አድርጎኛል የኃጢአት ምንጭ ደካማው መንፈስ
መሐሪ አምላክ ለጋሰ ጌታ ቸሩ ፈጣሪዬ
አንተ እኮ ነህ ለዘላለም ለአፄ መመኪያዬ

VERSE 2
ላይቀር መሞት አፈር መልበስ መግባት ከመቃብር
መስሎኝ ቋሚ ይህ ሥጋዬ ለእርሱ ብቻ ስጥር
ግን ለነፍሴ ቀረ ማስታወሴ/ሪ2/', 'meslugn quami yh ሥgayie leersu bcha sxr
zemen mequxer alet werat kremt bega
lielitna qen siferareq sicelm sinega
bemayetie hone medesetie/2/

VERSE 1
ኽre wediya wedilgn way blesh lenefsie
adrgognal yeኃxiat mnc dekamaw menfes
meሐri amlak legase gieta cheru fexariyie
ante eko neh lezelalem leaፄ memekiyayie

VERSE 2
layqer memot afer melbes megbat kemeqabr
meslogn quami yh ሥgayie leersu bcha sxr
gn lenefsie qere mastawesie/ri2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=dGAGUhdaen0', 'draft', 'pending', 'https://www.youtube.com/watch?v=dGAGUhdaen0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('layqer-memot-afer-melbes-megbat-kemeqabr', 'repentance', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeselomon-aklil-yearon-betr', 'የሰሎሞን አክሊል የአሮን በትር', 'የሰሎሞን አክሊል የአሮን በትር', 'yeselomon aklil yearon betr', 'Ethiopian Orthodox Tewahedo Mezmur - የሰሎሞን አክሊል የአሮን በትር', 'የአዝራ መስንቆ የጌድዮን ፀምር
ድንግል እመቤት ናት የጻድቃን በር
ሆና የተገኘች የአምላክ ማኅደር/2/
የቅዱሳን እናት የዓለም ንግሥት

VERSE 1
ችላ ተሸከመች መለኮት እሳት
ብርሃን ትሁነን ጨላማን ገላልጣ
አማልዳ ታስምረን ከዚህ ዓለም ጣጣ/2/
206.የኅዳር ጽዮን አንገርጋሪ

VERSE 2
ፃሌ ሉያ አይቲ ዛቲ እንተ
ታስተርኢ አምርሁቅ
ከመ ማኅቶት ብርህት ከመፀሐይ
ሙሴኒ ርእያ ሀገር ቅድስት

VERSE 3
ፅዝራኒ ተናገራ ዳዊት ዘመራ
207.፳ዮን
ጽዮን ቅድስት እሞሙ ለሰማዕት//2/
ወአኅቶሙ ለመላዕክተ/4/

VERSE 4
የሰሎሞን አክሊል የአሮን በትር
የሰሎሞን አክሊል የአሮን በትር
የዕዝራ መስንቆ የጌዴዎን ፀምር
ድንግል እመቤት ናት የጻድቃን በር

VERSE 5
ሆና የታገኘች የአምላክ ማኅደር/2
የቅዱሳን እናት የዓለም ንግሥት
የሰሎሞን አክሊል የአሮን በትር
የፅዝራ መሰንቆ የጌዴዎን ጸምር

VERSE 6
ድንግል አመቤት ናት የጻድቃን በር', 'yeazra mesnqo yegiedyon ፀmr
dngl emebiet nat yetsadqan ber
hona yetegegnech yeamlak maኅder/2/
yeqdusan enat yeዓlem ngሥt

VERSE 1
chla teshekemech melekot esat
brሃn thunen celaman gelalxa
amalda tasmren kezih ዓlem xaxa/2/
206.yeኅdar tsyon angergari

VERSE 2
ፃlie luya ayti zati ente
tasteri amrhuq
keme maኅtot brht kemeፀሐy
musieni reya hager qdst

VERSE 3
ፅzrani tenagera dawit zemera
207.፳yon
tsyon qdst emomu lesemaዕt//2/
weaኅtomu lemelaዕkte/4/

VERSE 4
yeselomon aklil yearon betr
yeselomon aklil yearon betr
yeዕzra mesnqo yegiediewon ፀmr
dngl emebiet nat yetsadqan ber

VERSE 5
hona yetagegnech yeamlak maኅder/2
yeqdusan enat yeዓlem ngሥt
yeselomon aklil yearon betr
yeፅzra mesenqo yegiediewon tsemr

VERSE 6
dngl amebiet nat yetsadqan ber', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=kVBoBmZoSJs', 'draft', 'pending', 'https://www.youtube.com/watch?v=kVBoBmZoSJs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('hona-yetegegnech-yeamlak-ma-der-2', 'ሆና የተገኘች የአምላክ ማኅደር /2/', 'ሆና የተገኘች የአምላክ ማኅደር /2/', 'hona yetegegnech yeamlak maኅder /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሆና የተገኘች የአምላክ ማኅደር /2/', 'ሆና የተገኘች የአምላክ ማኅደር /2/', 'hona yetegegnech yeamlak maኅder /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=IU_S_1tEFPs', 'draft', 'pending', 'https://www.youtube.com/watch?v=IU_S_1tEFPs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdst-enatachn-sb-t-weburkt', 'ቅድስት እናታችን ስብሐት ወቡርክት', 'ቅድስት እናታችን ስብሐት ወቡርክት', 'qdst enatachn sbሐt weburkt', 'Ethiopian Orthodox Tewahedo Mezmur - ቅድስት እናታችን ስብሐት ወቡርክት', 'አንቀጸ ብርሃን ማዕርገ ሕይወት
አዘክሪ ድንግል ለልጅሽ በዕውነት', 'anqetse brሃn maዕrge ሕywet
azekri dngl leljsh beዕwnet', 'amharic', 'mezmur', 'ዘማሪ ቀሲስ ምንዳዬ ብርሃኑ', 'https://www.youtube.com/watch?v=FjcieJsqf_c', 'draft', 'pending', 'https://www.youtube.com/watch?v=FjcieJsqf_c', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('befitu-endalafr-yetexerahu-leta', 'በፊቱ እንዳላፍር የተጠራሁ ለታ', 'በፊቱ እንዳላፍር የተጠራሁ ለታ', 'befitu endalafr yetexerahu leta', 'Ethiopian Orthodox Tewahedo Mezmur - በፊቱ እንዳላፍር የተጠራሁ ለታ', 'አለምነዋለሁ ከአሁኑ ይቅርታ', 'alemnewalehu keahunu yqrta', 'amharic', 'mezmur', 'ቀሲስ ዳዊት ፋንታዬ', 'https://www.youtube.com/watch?v=Ap5-yTIHygA', 'draft', 'pending', 'https://www.youtube.com/watch?v=Ap5-yTIHygA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tsadqan-sema-tat-enante-hulachhu', 'ጻድቃን ሰማዕታት እናንተ ሁላችሁ', 'ጻድቃን ሰማዕታት እናንተ ሁላችሁ', 'tsadqan semaዕtat enante hulachhu', 'Ethiopian Orthodox Tewahedo Mezmur - ጻድቃን ሰማዕታት እናንተ ሁላችሁ', 'አማልዱኝ ከአምላኬ ከአምላካችሁ
ድንግል ሆይ --------------፦--
613.ድንግል ማርያም እናታችን
ድንግል ማርያም እናታችን /2/

VERSE 1
የጌታችን እናት ለምፒልን /2/', 'amaldugn keamlakie keamlakachhu
dngl hoy --------------፦--
613.dngl maryam enatachn
dngl maryam enatachn /2/

VERSE 1
yegietachn enat lempiln /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=1OS0WKHktVI', 'draft', 'pending', 'https://www.youtube.com/watch?v=1OS0WKHktVI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kirubiel-menberun-yemishekemulet-2', 'ኪሩቤል መንበሩን የሚሸከሙለት/2/', 'ኪሩቤል መንበሩን የሚሸከሙለት/2/', 'kirubiel menberun yemishekemulet/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ኪሩቤል መንበሩን የሚሸከሙለት/2/', 'መስቀል ተሸከመ ሊሆነን መድኃኒት /2', 'mesqel teshekeme lihonen medኃnit /2', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=7hDANqCud8w', 'draft', 'pending', 'https://www.youtube.com/watch?v=7hDANqCud8w', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeiyesusn-mam-denaglm-aytew-2', 'የኢየሱስን ሕማም ደናግልም አይተው/2/', 'የኢየሱስን ሕማም ደናግልም አይተው/2/', 'yeiyesusn ሕmam denaglm aytew/2/', 'Ethiopian Orthodox Tewahedo Mezmur - የኢየሱስን ሕማም ደናግልም አይተው/2/', 'እያለቀሱለት ሄዱ ተከትለው/2/', 'eyaleqesulet hedu teketlew/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=bVS3zylpm3k', 'draft', 'pending', 'https://www.youtube.com/watch?v=bVS3zylpm3k', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beahya-lay-hono-wede-anchi-yemexaw', 'በአህያ ላይ ሆኖ ወደ አንቺ የመጣው', 'በአህያ ላይ ሆኖ ወደ አንቺ የመጣው', 'beahya lay hono wede anchi yemexaw', 'Ethiopian Orthodox Tewahedo Mezmur - በአህያ ላይ ሆኖ ወደ አንቺ የመጣው', 'ኢየሱስ ክርስቶስ የዓለም መድኃኒት ነው', 'iyesus krstos yeዓlem medኃnit new', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=9QLviA-Ybs0', 'draft', 'pending', 'https://www.youtube.com/watch?v=9QLviA-Ybs0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ho-na-bearyam', 'ሆሣዕና በአርያም', 'ሆሣዕና በአርያም', 'hoሣዕna bearyam', 'Ethiopian Orthodox Tewahedo Mezmur - ሆሣዕና በአርያም', 'ድኅነት ሆነ ለሁላችን ዛሬ በዓለም
አክብሮናል ፈጣሪያችን በኢየሩሳሌም', 'dኅnet hone lehulachn zarie beዓlem
akbronal fexariyachn beiyerusaliem', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=XlD6l8mrtrs', 'draft', 'pending', 'https://www.youtube.com/watch?v=XlD6l8mrtrs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yba-ngu-sb-t-4', 'ይባዕ ንጉሠ ስብሐት /4/', 'ይባዕ ንጉሠ ስብሐት /4/', 'ybaዕ nguሠ sbሐt /4/', 'Ethiopian Orthodox Tewahedo Mezmur - ይባዕ ንጉሠ ስብሐት /4/', '623.አርዉ ፕኀኅተ መኳንንት
አርዉ ፕኀተ መኳንንት /2/
ይባዕ አምላከ ምሕረት
624.ሆሣዕና በአርያም ሆሣዕና

VERSE 1
ሆሣፅና ብለን እናቅርብ ምስጋና', '623.arwu pኀኅte mekuannt
arwu pኀte mekuannt /2/
ybaዕ amlake mሕret
624.hoሣዕna bearyam hoሣዕna

VERSE 1
hoሣፅna blen enaqrb msgana', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=B3BH2ufRdLg', 'draft', 'pending', 'https://www.youtube.com/watch?v=B3BH2ufRdLg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('yba-ngu-sb-t-4', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ho-na-belu', 'ሆሣዕና በሉ ››', 'ሆሣዕና በሉ ››', 'hoሣዕna belu ››', 'Ethiopian Orthodox Tewahedo Mezmur - ሆሣዕና በሉ ››', 'ለሰማይ ንጉሥ ››
ግርማን ለብሶ መጣ ››
አኛን ሊቀድስ ››
ሆሣዕና በሉ ››

VERSE 1
ለአምላከ ምሕረት ››
ተወልዶ ከድንግል ››
አንደ ሕጻናት ››
አረኞች በዋሻ ››

VERSE 2
የሰገዱለት ››
የአዳም ልጆች ሁሉ ››
ደግሞም መላእክት ››', 'lesemay nguሥ ››
grman lebso mexa ››
agnan liqeds ››
hoሣዕna belu ››

VERSE 1
leamlake mሕret ››
teweldo kedngl ››
ande ሕtsanat ››
aregnoch bewasha ››

VERSE 2
yesegedulet ››
yeadam ljoch hulu ››
degmom melaekt ››', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=FUBXyXOjNQ8', 'draft', 'pending', 'https://www.youtube.com/watch?v=FUBXyXOjNQ8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ho-na-belu-ho-na', 'ሆሣዕና በሉ ሆሣዕና', 'ሆሣዕና በሉ ሆሣዕና', 'hoሣዕna belu hoሣዕna', 'Ethiopian Orthodox Tewahedo Mezmur - ሆሣዕና በሉ ሆሣዕና', 'ሆሣዕና በሉ ሆሣዕና
ለወልደ ዳዊት ››', 'hoሣዕna belu hoሣዕna
lewelde dawit ››', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=JFUrHUXBs2A', 'draft', 'pending', 'https://www.youtube.com/watch?v=JFUrHUXBs2A', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kesemayat-werdo-yeteseqelew', 'ከሰማያት ወርዶ የተሰቀለው', 'ከሰማያት ወርዶ የተሰቀለው', 'kesemayat werdo yeteseqelew', 'Ethiopian Orthodox Tewahedo Mezmur - ከሰማያት ወርዶ የተሰቀለው', 'ሞትን በሞት ሽሮ ይኸው አየነው
ደቀመዛሙርቱ አጅጉን ተጨንቀው
በጌታችን መሞት በሐዘን ተሞልተው
በተዘጋ ደጃፍ ተሰብስበው ሳለ

VERSE 1
አጀቹን ዘርዓቶ ሰላም ለእናንተ አለ', 'motn bemot shro yኸw ayenew
deqemezamurtu ajgun tecenqew
begietachn memot beሐzen temoltew
betezega dejaf tesebsbew sale

VERSE 1
ajechun zerዓto selam leenante ale', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=nR3cmavyaKY', 'draft', 'pending', 'https://www.youtube.com/watch?v=nR3cmavyaKY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('enantes-atfru-krstos-tene', 'እናንተስ አትፍሩ ክርስቶስ ተነሣ', 'እናንተስ አትፍሩ ክርስቶስ ተነሣ', 'enantes atfru krstos teneሣ', 'Ethiopian Orthodox Tewahedo Mezmur - እናንተስ አትፍሩ ክርስቶስ ተነሣ', 'አነግራችሏላው ››
የተሠቀለውን ››
አንድትሽ አውቃለው. ››
ሕያዉን ከሙታን ››

VERSE 1
ለምን ፈለጋችሁ ››
አንደተናገረው ››
ተነሥቷል ጌታችሁ ››', 'anegrachlualaw ››
yeteሠqelewn ››
andtsh awqalew. ››
ሕyawun kemutan ››

VERSE 1
lemn felegachhu ››
andetenagerew ››
teneሥtual gietachhu ››', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=U9NXyapeL6c', 'draft', 'pending', 'https://www.youtube.com/watch?v=U9NXyapeL6c', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keegna-gara-newna-ye-rawit-gieta', 'ከእኛ ጋራ ነውና የሠራዊት ጌታ', 'ከእኛ ጋራ ነውና የሠራዊት ጌታ', 'keegna gara newna yeሠrawit gieta', 'Ethiopian Orthodox Tewahedo Mezmur - ከእኛ ጋራ ነውና የሠራዊት ጌታ', 'ጨለማውን ኑሮ የሰደት ሕይወት
በአግዚአብሔር ፍቅር ብርሃን በራበት
ባርነት ቀርቶ ነጻነት ወጣን
ልመናችንን አግዚአብሔር ሰማን', 'celemawn nuro yesedet ሕywet
beagziabሔr fqr brሃn berabet
barnet qerto netsanet wexan
lmenachnn agziabሔr seman', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=2sSBihfYdcI', 'draft', 'pending', 'https://www.youtube.com/watch?v=2sSBihfYdcI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('keegna-gara-newna-ye-rawit-gieta', 'prayer', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tezkare-tnsaiehu-lemed-nine-4', 'ተዝካረ ትንሳኤሁ ለመድኃኒነ/4/', 'ተዝካረ ትንሳኤሁ ለመድኃኒነ/4/', 'tezkare tnsaiehu lemedኃnine/4/', 'Ethiopian Orthodox Tewahedo Mezmur - ተዝካረ ትንሳኤሁ ለመድኃኒነ/4/', '646.4ተንሥአ ወአንሥአ ኩሎ ሙታን
ተንሥአ ወአንሥአ ኩሎ ሙታን/2/
ተንሥአ ወፈትሆሙ ለሙቁሐን
ጵራቅሊጦስ መዝሙር

VERSE 1
647.ሸአንትሙስ ንበሩ ሀገረ ኢየሩሳሌም/
አንትሙስ ንበሩ ሀገረ ኢየሩሳሌም/2
አስከትለብሱ ኃይለ እምአርያም /4/
አናንተ ግን ቆዩ በኢየሩሳሌም ሀገር /2

VERSE 2
አስክምታገኙ ኃይል ከሰማይ /2
648.አምላካችን ዐረገ
648.አምላካችን ዐረገ /2/ ወደ ሠማያት /2
የሠማይ መላእክት በደስታ እያጀቡት ዐረገ ወደሰማያት

VERSE 3
649.ኃበ አቡሁ ዐርገ ሠማያት ዐርገ ሠማያት
ኀበ አቡሁ ዐርገ ሰማያት ዐርገ ሰማያት /2
ጳራቅሊጦስዛ መንፈሰጽድቅ አውረደ /4', '646.4tenሥa weanሥa kulo mutan
tenሥa weanሥa kulo mutan/2/
tenሥa wefethomu lemuquሐn
phraqlixos mezmur

VERSE 1
647.sheantmus nberu hagere iyerusaliem/
antmus nberu hagere iyerusaliem/2
asketlebsu ኃyle emaryam /4/
anante gn qoyu beiyerusaliem hager /2

VERSE 2
askmtagegnu ኃyl kesemay /2
648.amlakachn ዐrege
648.amlakachn ዐrege /2/ wede ሠmayat /2
yeሠmay melaekt bedesta eyajebut ዐrege wedesemayat

VERSE 3
/2/
/2/
649.ኃbe abuhu ዐrge ሠmayat ዐrge ሠmayat
ኀbe abuhu ዐrge semayat ዐrge semayat /2

VERSE 4
pharaqlixosza menfesetsdq awrede /4', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=97fiJTiWFBk', 'draft', 'pending', 'https://www.youtube.com/watch?v=97fiJTiWFBk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-lem-tslmet-letewaxew', 'በዓለም ጽልመት ለተዋጠው', 'በዓለም ጽልመት ለተዋጠው', 'beዓlem tslmet letewaxew', 'Ethiopian Orthodox Tewahedo Mezmur - በዓለም ጽልመት ለተዋጠው', 'የአውነት መንገድ ብርሃን ለጠፋበት
በሁለንተናው ፈንጥቁበት', 'yeawnet menged brሃn lexefabet
behulentenaw fenxqubet', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=9ma1YSsrr0M', 'draft', 'pending', 'https://www.youtube.com/watch?v=9ma1YSsrr0M', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('weybelomu-ru-weme-ru-lezeyeamn-2', 'ወይበሎሙ ሑሩ ወመሐሩ ለዘየአምን /2', 'ወይበሎሙ ሑሩ ወመሐሩ ለዘየአምን /2', 'weybelomu ሑru wemeሐru lezeyeamn /2', 'Ethiopian Orthodox Tewahedo Mezmur - ወይበሎሙ ሑሩ ወመሐሩ ለዘየአምን /2', 'ወንጌል መንግሥተ ሰማያት /4
657.መንፈስ ቅዱስ ወረደ ላዕለ ሐዋርያት /2
ተመሲሎ /5 በነደ እሳት /2
መንፈስ ቅዱስ በሐዋርያት ላይ በእሳት

VERSE 1
አምሣል ወረደ
6568.አየባረካቸው ወደ ላይ አቀና/2', 'wengiel mengሥte semayat /4
657.menfes qdus werede laዕle ሐwaryat /2
temesilo /5 benede esat /2
menfes qdus beሐwaryat lay beesat

VERSE 1
amሣl werede
6568.ayebarekachew wede lay aqena/2', 'amharic', 'mezmur', 'ማኅበረ ቅዱሳን', 'https://www.youtube.com/watch?v=xSfJyHgVhFQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=xSfJyHgVhFQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('weybelomu-ru-weme-ru-lezeyeamn-2', 'apostles', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beandnet-honew-iyerusaliem', 'በአንድነት ሆነው ኢየሩሳሌም', 'በአንድነት ሆነው ኢየሩሳሌም', 'beandnet honew iyerusaliem', 'Ethiopian Orthodox Tewahedo Mezmur - በአንድነት ሆነው ኢየሩሳሌም', 'ተስፋ ሲጠብቁ ከላይ ከአርያም', 'tesfa sixebqu kelay kearyam', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=t1xBki280HE', 'draft', 'pending', 'https://www.youtube.com/watch?v=t1xBki280HE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yegnbot-ldeta', 'የግንቦት ልደታ', 'የግንቦት ልደታ', 'yegnbot ldeta', 'Ethiopian Orthodox Tewahedo Mezmur - የግንቦት ልደታ', '671.ዮም ኮነ ፍሥሐ
ዮም ኮነ ፍስሐ በእንተ ልደታ ለማርያም /2/
አማን አማን በአማን ተወልደት /2 እአመብርሃነን/2/
672. እስመ እአበውእ ውስተ

VERSE 1
አስመ አበውአእአ ውስተ መካን ማኅደረ ስብሐት
ቤተ እግዚአብሔር
በቃለ አሚን ወበትፍሥሕት ደምጽ
አለ ይገብሩ በዓለ ልደታ ለማርያም

VERSE 2
የግንቦት ልደታ ወረብ
ጽፋት
ዮም ፍሥሐ ኮነ በእንተ ልደታ ለማርያም
አምሐና

VERSE 3
ወኢያቄም ከመትቤዙ ነቢያተ ወጻድቃን አማን
ተወልደት አመብርፃዛን', '671.yom kone fሥሐ
yom kone fsሐ beente ldeta lemaryam /2/
aman aman beaman teweldet /2 eamebrሃnen/2/
672. esme eabewe wste

VERSE 1
asme abewaea wste mekan maኅdere sbሐt
biete egziabሔr
beqale amin webetfሥሕt demts
ale ygebru beዓle ldeta lemaryam

VERSE 2
yegnbot ldeta wereb
tsfat
yom fሥሐ kone beente ldeta lemaryam
amሐna

VERSE 3
weiyaqiem kemetbiezu nebiyate wetsadqan aman
teweldet amebrፃzan', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=dIPDpkdDVqg', 'draft', 'pending', 'https://www.youtube.com/watch?v=dIPDpkdDVqg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeamlak-enat-2-yemed-nie-lem-2-2', 'የአምላክ እናት /2/ የመድኃኔዓለም /2/2', 'የአምላክ እናት /2/ የመድኃኔዓለም /2/2', 'yeamlak enat /2/ yemedኃnieዓlem /2/2', 'Ethiopian Orthodox Tewahedo Mezmur - የአምላክ እናት /2/ የመድኃኔዓለም /2/2', 'ተወለደች ድንግል ማርያም', 'teweledech dngl maryam', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=akIaNHirbGM', 'draft', 'pending', 'https://www.youtube.com/watch?v=akIaNHirbGM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keanbesoch-menoriya', 'ከአንበሶች መኖሪያ', 'ከአንበሶች መኖሪያ', 'keanbesoch menoriya', 'Ethiopian Orthodox Tewahedo Mezmur - ከአንበሶች መኖሪያ', 'ከነብሮች ተራራ
መጥተሸ አስደስቺኝ
አናቴ ሙሽራ
ከአንበሶች መኖሪያ ከሊባኖስ ከነብሮች ተራራ

VERSE 1
መጥተሸ አስደስቺኝ ከሊባኖስ አናቴ ሙሽራ
የልብስሽ መዓዛ ከሊባኖስ የሊባኖስ ሽታ
ሮማን ናርዶስ ነው ከሊባኖስ እናቱ ለጌታ', 'kenebroch terara
mexteshe asdeschign
anatie mushra
keanbesoch menoriya kelibanos kenebroch terara

VERSE 1
mexteshe asdeschign kelibanos anatie mushra
yelbssh meዓza kelibanos yelibanos shta
roman nardos new kelibanos enatu legieta', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=S-kJtjemLcU', 'draft', 'pending', 'https://www.youtube.com/watch?v=S-kJtjemLcU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('keanbesoch-menoriya', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('xiatene-seali-lene-qdst', 'ኃጢአተነ ሰአሊ ለነ ቅድስት', 'ኃጢአተነ ሰአሊ ለነ ቅድስት', 'ኃxiatene seali lene qdst', 'Ethiopian Orthodox Tewahedo Mezmur - ኃጢአተነ ሰአሊ ለነ ቅድስት', 'ኃጢአተነ ሰአሊ ለነ ቅድስት
ኃጢአተነ ሰአሊ ለነ ቅድስት /2/', 'ኃxiatene seali lene qdst
ኃxiatene seali lene qdst /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=H6P5ko6fNo8', 'draft', 'pending', 'https://www.youtube.com/watch?v=H6P5ko6fNo8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bedngl-meweled', 'በድንግል መወለድ', 'በድንግል መወለድ', 'bedngl meweled', 'Ethiopian Orthodox Tewahedo Mezmur - በድንግል መወለድ', 'በድንግል መወለድ የአሳት ባሕር በንቺ ተሻግረዋል
ቀረልን አበሳ ለሰማያዊው ክብር በቅተዋል/2/', 'bedngl meweled yeasat baሕr benchi teshagrewal
qereln abesa lesemayawiw kbr beqtewal/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=wOo1yY2VS_E', 'draft', 'pending', 'https://www.youtube.com/watch?v=wOo1yY2VS_E', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yedawit-tnbitu', 'የዳዊት ትንቢቱ', 'የዳዊት ትንቢቱ', 'yedawit tnbitu', 'Ethiopian Orthodox Tewahedo Mezmur - የዳዊት ትንቢቱ', 'የዳዊት ትንቢቱ ሕይወታቸውም በአንቺ ትድናለች', 'yedawit tnbitu ሕywetachewm beanchi tdnalech', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=hSa1eTR6tRs', 'draft', 'pending', 'https://www.youtube.com/watch?v=hSa1eTR6tRs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-wan-mknyat', 'በሔዋን ምክንያት', 'በሔዋን ምክንያት', 'beሔwan mknyat', 'Ethiopian Orthodox Tewahedo Mezmur - በሔዋን ምክንያት', 'ያጣነውን ሰላም
ዛሬ አገኘነው
በድንግል ማርያም
የምሥራች እንበል

VERSE 1
በሔዋን ምክንያት ፍሥሐ ኮነ
ያጣነውን ሰላም >> >>
ዛሬ አገኘነው >> >>
በድንግል ማርያም >> >>

VERSE 2
የምሥራች እንበል >> >>', 'yaxanewn selam
zarie agegnenew
bedngl maryam
yemሥrach enbel

VERSE 1
beሔwan mknyat fሥሐ kone
yaxanewn selam >> >>
zarie agegnenew >> >>
bedngl maryam >> >>

VERSE 2
yemሥrach enbel >> >>', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=gPBM-TfI-o8', 'draft', 'pending', 'https://www.youtube.com/watch?v=gPBM-TfI-o8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mikaiel-melmale-werq', 'ሚካኤል ሐመልማለ ወርቅ', 'ሚካኤል ሐመልማለ ወርቅ', 'mikaiel ሐmelmale werq', 'Ethiopian Orthodox Tewahedo Mezmur - ሚካኤል ሐመልማለ ወርቅ', 'ሚካኤል ሐመልማለ ወርቅ /2/ ልብሱ ዘመብረቅ
ሚካኤል ሐመልማለ ወርቅ የወርቅ ልምላሜ /2/
ና /3/ ስለምንህ ቆሜ
ገብርኤል ሊቀ መላእክት /2/', 'mikaiel ሐmelmale werq /2/ lbsu zemebreq
/2/
/2/
mikaiel ሐmelmale werq yewerq lmlamie /2/

VERSE 1
na /3/ slemnh qomie
gebriel liqe melaekt /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=R4od8g6ECOg', 'draft', 'pending', 'https://www.youtube.com/watch?v=R4od8g6ECOg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('waryaw-menekusie-yemerexut-lasie-2', 'ሐዋርያው መነኩሴ የመረጡት ሥላሴ/2/', 'ሐዋርያው መነኩሴ የመረጡት ሥላሴ/2/', 'ሐwaryaw menekusie yemerexut ሥlasie/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሐዋርያው መነኩሴ የመረጡት ሥላሴ/2/', 'ተክለሃይማኖት ሆኗል ጠበቃ ለነፍሴ /2/', 'tekleሃymanot honual xebeqa lenefsie /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=nICNe9PVmbg', 'draft', 'pending', 'https://www.youtube.com/watch?v=nICNe9PVmbg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('waryaw-menekusie-yemerexut-lasie-2', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dagmawi-yo-ns-xefer-yetaxeqe', 'ዳግማዊ ዮሐንስ ጠፈር የታጠቀ', 'ዳግማዊ ዮሐንስ ጠፈር የታጠቀ', 'dagmawi yoሐns xefer yetaxeqe', 'Ethiopian Orthodox Tewahedo Mezmur - ዳግማዊ ዮሐንስ ጠፈር የታጠቀ', 'ንጹሕ ባህታዊ ጠላት ያስጨነቀ
የጸጋ ዘአብ ፍሬ ዛፍ ሆኖ በቀለ
በደብረ ሊባኖስ መናኝ አስከተለ', 'ntsuሕ bahtawi xelat yasceneqe
yetsega zeab frie zaf hono beqele
bedebre libanos menagn asketele', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=VtozJ8yxIcQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=VtozJ8yxIcQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('dagmawi-yo-ns-xefer-yetaxeqe', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yebarekew-w-yeregexkew-meriet', 'የባረከው ውኃ የረገጥከው መሬት', 'የባረከው ውኃ የረገጥከው መሬት', 'yebarekew wኃ yeregexkew meriet', 'Ethiopian Orthodox Tewahedo Mezmur - የባረከው ውኃ የረገጥከው መሬት', 'ጥላህ ያረፈበት ሆንዋል ጸበል አምነት
ኩና ተመልከቱ ድውያን ሲፈቱ
ይሰብካል ተክለአብ ዛሬም አንደጥንቱ', 'xlah yarefebet honwal tsebel amnet
kuna temelketu dwyan sifetu
ysebkal tekleab zariem andexntu', 'amharic', 'mezmur', 'ዘማሪት ፋንቱ ወልዴ', 'https://www.youtube.com/watch?v=tCMbySo6Lfo', 'draft', 'pending', 'https://www.youtube.com/watch?v=tCMbySo6Lfo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tenegro-yemayalq-new-tsegah-2', 'ተነግሮ የማያልቅ ነው ጸጋህ /2/', 'ተነግሮ የማያልቅ ነው ጸጋህ /2/', 'tenegro yemayalq new tsegah /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ተነግሮ የማያልቅ ነው ጸጋህ /2/', 'በጸሎት የተጋህ የሄህይማኖት ፍሬ
ተክለ ሃይማኖት የወንጌል ገበሬ', 'betselot yetegah yehehymanot frie
tekle ሃymanot yewengiel geberie', 'amharic', 'mezmur', 'ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ', 'https://www.youtube.com/watch?v=_sANgGSKgqo', 'draft', 'pending', 'https://www.youtube.com/watch?v=_sANgGSKgqo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('tenegro-yemayalq-new-tsegah-2', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('aba-abune', 'አባ አቡነ', 'አባ አቡነ', 'aba abune', 'Ethiopian Orthodox Tewahedo Mezmur - አባ አቡነ', 'አባ አቡነ/2/ መምህርነ አባ ተክለሃይማኖት/2/
አእምአአላፍ ኅሩይ/ሪ2/ አባ /6/
አቡነ ተክለሃይማኖት /2/
731.ለሳዉል ወኬፋ

VERSE 1
ለሳዉል ወኬፋ/ሪ/
አክሊሎሙ ተትኩነነ ተስፋ/4/
732.የአምላክን በረከት', 'aba abune/2/ memhrne aba tekleሃymanot/2/
aemaalaf ኅruy/ri2/ aba /6/
abune tekleሃymanot /2/
731.lesawul wekiefa

VERSE 1
lesawul wekiefa/ri/
aklilomu tetkunene tesfa/4/
732.yeamlakn bereket', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Z2hQRIZAp2Q', 'draft', 'pending', 'https://www.youtube.com/watch?v=Z2hQRIZAp2Q', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('aba-abune', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zele-lem-ynoral-tekle-ymanot', 'ዘለዓለም ይኖራል ተክለ ሃይማኖት', 'ዘለዓለም ይኖራል ተክለ ሃይማኖት', 'zeleዓlem ynoral tekle ሃymanot', 'Ethiopian Orthodox Tewahedo Mezmur - ዘለዓለም ይኖራል ተክለ ሃይማኖት', 'በዓለም ሲያሰጠራህ ተክለ ሃይማኖት', 'beዓlem siyasexerah tekle ሃymanot', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=y6i_Pyp0yN0', 'draft', 'pending', 'https://www.youtube.com/watch?v=y6i_Pyp0yN0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('zele-lem-ynoral-tekle-ymanot', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemenfesqdus-debre-libanos', 'በመንፈስቅዱስ ደብረ ሊባኖስ', 'በመንፈስቅዱስ ደብረ ሊባኖስ', 'bemenfesqdus debre libanos', 'Ethiopian Orthodox Tewahedo Mezmur - በመንፈስቅዱስ ደብረ ሊባኖስ', 'በቅዱሳን ጸሎት ደብረ ሊባኖስ
ስለተቀደሠች ደብረ ሊባኖስ
ለአድባራት ሁሉ ደብረ ሊባኖስ
በክብር ትበልጣለች ደብረ ሊባኖስ', 'beqdusan tselot debre libanos
sleteqedeሠch debre libanos
leadbarat hulu debre libanos
bekbr tbelxalech debre libanos', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=hr2dvwF9TmY', 'draft', 'pending', 'https://www.youtube.com/watch?v=hr2dvwF9TmY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('bemenfesqdus-debre-libanos', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeqdusan-be-t-yetselot-washachew', 'የቅዱሳን በዓት የጸሎት ዋሻቸው', 'የቅዱሳን በዓት የጸሎት ዋሻቸው', 'yeqdusan beዓt yetselot washachew', 'Ethiopian Orthodox Tewahedo Mezmur - የቅዱሳን በዓት የጸሎት ዋሻቸው', 'ቤ/ክ ናት አምባ መጠጊያቸው', 'bie/k nat amba mexegiyachew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=1r25wlcjeF0', 'draft', 'pending', 'https://www.youtube.com/watch?v=1r25wlcjeF0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('yeqdusan-be-t-yetselot-washachew', 'prayer', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tekle-ymanot-y-yeityophya-si-y', 'ተክለሃይማኖት ፀሐይ የኢትዮጵያ ሲሣይ', 'ተክለሃይማኖት ፀሐይ የኢትዮጵያ ሲሣይ', 'tekleሃymanot ፀሐy yeityophya siሣy', 'Ethiopian Orthodox Tewahedo Mezmur - ተክለሃይማኖት ፀሐይ የኢትዮጵያ ሲሣይ', 'ምፅራፈ ቅዱሳን /2/ በነፍስም በስጋ አትለየኝ
የቅዱሳን አርእስት የዋሻው ብርፃን', 'mፅrafe qdusan /2/ benefsm besga atleyegn
yeqdusan arest yewashaw brፃn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=hhs-MoMg2IQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=hhs-MoMg2IQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('tekle-ymanot-y-yeityophya-si-y', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gena-be-st-qen-be-nneth', 'ገና በሦስት ቀን በሕፃንነትህ', 'ገና በሦስት ቀን በሕፃንነትህ', 'gena beሦst qen beሕፃnneth', 'Ethiopian Orthodox Tewahedo Mezmur - ገና በሦስት ቀን በሕፃንነትህ', 'ጌታን አወደሰው ቅዱስ አንደበትህ
ደግሞም አግዚአብሔር አስቦፃልና
በወጣትነትህ ወጣህ ለምነና/2/', 'gietan awedesew qdus andebeth
degmom agziabሔr asboፃlna
bewexatneth wexah lemnena/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=kLsG1lCbhRc', 'draft', 'pending', 'https://www.youtube.com/watch?v=kLsG1lCbhRc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('gena-be-st-qen-be-nneth', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tekleab', 'ተክለአብ', 'ተክለአብ', 'tekleab', 'Ethiopian Orthodox Tewahedo Mezmur - ተክለአብ', 'ተክለአብ ሐዲስ ሐዋርያ /4/
ሐዲስ ሐዋርያ /2/ ዘኢትዮጵያ /2/', 'tekleab ሐdis ሐwarya /4/
ሐdis ሐwarya /2/ zeityophya /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=aBkIeaYOPAg', 'draft', 'pending', 'https://www.youtube.com/watch?v=aBkIeaYOPAg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('emne-adbarat-kulon-zetelealet-besmu', 'እምነ አድባራት ኩሎን ዘተለአለት በስሙ', 'እምነ አድባራት ኩሎን ዘተለአለት በስሙ', 'emne adbarat kulon zetelealet besmu', 'Ethiopian Orthodox Tewahedo Mezmur - እምነ አድባራት ኩሎን ዘተለአለት በስሙ', 'ትዌድሶ
ኢየሱስ ክርስቶሰ እንተ ቀደሰ በደሙ', 'twiedso
iyesus krstose ente qedese bedemu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=qBL5TrVb2Q4', 'draft', 'pending', 'https://www.youtube.com/watch?v=qBL5TrVb2Q4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('emne-adbarat-kulon-zetelealet-besmu', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('begietachn-mesqel-2', 'በጌታችን መስቀል /2/', 'በጌታችን መስቀል /2/', 'begietachn mesqel /2/', 'Ethiopian Orthodox Tewahedo Mezmur - በጌታችን መስቀል /2/', 'ሁለቱም ሰማዕታት ተጎናጸፉ ድል/2/', 'huletum semaዕtat tegonatsefu dl/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=j_zh6OotpVc', 'draft', 'pending', 'https://www.youtube.com/watch?v=j_zh6OotpVc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sebat-aklilatn', 'ሰባት አክሊላትን ››', 'ሰባት አክሊላትን ››', 'sebat aklilatn ››', 'Ethiopian Orthodox Tewahedo Mezmur - ሰባት አክሊላትን ››', 'ጌታ የሸለመህ አድነኒ /2/ ጊዮርጊሰ አሞተ
አዳ', 'gieta yeshelemeh adneni /2/ giyorgise amote
ada', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=R_K0wgSJOok', 'draft', 'pending', 'https://www.youtube.com/watch?v=R_K0wgSJOok', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('n-qirqos-le-hrt-zeiyafarhoke-negodguad-2', 'ሕፃን ቂርቆስ ለፅህርት ዘኢያፋርሆከ ነጎድጓድ/2/', 'ሕፃን ቂርቆስ ለፅህርት ዘኢያፋርሆከ ነጎድጓድ/2/', 'ሕፃn qirqos leፅhrt zeiyafarhoke negodguad/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሕፃን ቂርቆስ ለፅህርት ዘኢያፋርሆከ ነጎድጓድ/2/', 'ዮም ባርክ ማኅበረከ/2/ ለአለ አሐዱ አሐዱ/ሪ//', 'yom bark maኅbereke/2/ leale aሐdu aሐdu/ri//', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=-OYjHfbjmMQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=-OYjHfbjmMQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sema-tat', 'ሰማዕታት', 'ሰማዕታት', 'semaዕtat', 'Ethiopian Orthodox Tewahedo Mezmur - ሰማዕታት', 'ሰላም ለአንተ ይሁን ፍጡነ ረድኤት
የልዳው ፀሐይ ፍጡነ ረድኤት
በጨካኝ ንጉሥ ፊት ቆምክ አደባባይ
ታማኝ አገልጋይ ነህ ፍጡነ ረድኤት

VERSE 1
ስቃይ ያልበገረህ ፍጡነ ረድኤት
ሰማዕታት
ሰላም ለአንተ ይሁን ፍጡነ ረድኤት
የልዳው ፀሐይ ፍጡነ ረድኤት

VERSE 2
በጨካኝ ንጉሥ ፊት ቆምክ አደባባይ
ታማኝ አገልጋይ ነህ ፍጡነ ረድኤት
ስቃይ ያልበገረህ ፍጡነ ረድኤት
አክሊልን አገኘህ መከራን ታግሠህ/2/', 'selam leante yhun fxune rediet
yeldaw ፀሐy fxune rediet
becekagn nguሥ fit qomk adebabay
tamagn agelgay neh fxune rediet

VERSE 1
sqay yalbegereh fxune rediet
semaዕtat
selam leante yhun fxune rediet
yeldaw ፀሐy fxune rediet

VERSE 2
becekagn nguሥ fit qomk adebabay
tamagn agelgay neh fxune rediet
sqay yalbegereh fxune rediet
akliln agegneh mekeran tagሠh/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=xJnsDBQBppo', 'draft', 'pending', 'https://www.youtube.com/watch?v=xJnsDBQBppo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('sema-tat', 'martyrs', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tewa-do-nts-t-qdst-emnetachn-2', 'ተዋሕዶ ንጽሕት ቅድስት እምነታችን /2/', 'ተዋሕዶ ንጽሕት ቅድስት እምነታችን /2/', 'tewaሕdo ntsሕt qdst emnetachn /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ተዋሕዶ ንጽሕት ቅድስት እምነታችን /2/', 'ኑሪ ለዘለዓለም ተከብረሽ በሁላችን (2) /2/', 'nuri lezeleዓlem tekebresh behulachn (2) /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=7VqxeTupUIk', 'draft', 'pending', 'https://www.youtube.com/watch?v=7VqxeTupUIk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tewa-do-ymanot', 'ተዋሕዶ ሃይማኖት', 'ተዋሕዶ ሃይማኖት', 'tewaሕdo ሃymanot', 'Ethiopian Orthodox Tewahedo Mezmur - ተዋሕዶ ሃይማኖት', 'ተዋሕዶ ሃይማኖት እንከን የሌላት /2/
አንከተላት /2/ አስከ ሞት /2/ በአውነት
ያለፍርሃት /2/
811. ጽንዑ በተዋሕዶ

VERSE 1
ጽንዑ በተዋሕዶ እምነት /2/
መሠረት /2/ ናትና ሕይወት /2/
812. እግዚአብሔር ይሀበነ
አግዚአብሔር የሀበነ ልሳነ ጥበብ /2/

VERSE 2
ከመ ናእምር ሕገ /2/ ለቤተክርስቲያን /2/
ትርጉም ፡:- እግዚአብሔር ሆይ የቤተ ክርስቲያንን
ሕግ አናውቅ ዘንድ አውቀትን ስጠን
813. በሃይማኖት

VERSE 3
በጭራሽ እንዳይደርቅ የሄይማኖት ሥሩ
መበርታት አለበት ሁሉም በተግባሩ
በሃይማኖት አለብን መጽናት
አንሁን በመንፈስ አንሁን ልበ መንታ

VERSE 4
አንዲከፈትልን በሩን ስንመታ', 'tewaሕdo ሃymanot enken yelielat /2/
anketelat /2/ aske mot /2/ beawnet
yalefrሃt /2/
811. tsnዑ betewaሕdo

VERSE 1
tsnዑ betewaሕdo emnet /2/
meሠret /2/ natna ሕywet /2/
812. egziabሔr yhabene
agziabሔr yehabene lsane xbeb /2/

VERSE 2
keme naemr ሕge /2/ lebietekrstiyan /2/
trgum ፡:- egziabሔr hoy yebiete krstiyann
ሕg anawq zend awqetn sxen
813. beሃymanot

VERSE 3
becrash endayderq yeheymanot ሥru
mebertat alebet hulum betegbaru
beሃymanot alebn metsnat
anhun bemenfes anhun lbe menta

VERSE 4
andikefetln berun snmeta', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=tasyROcAqm4', 'draft', 'pending', 'https://www.youtube.com/watch?v=tasyROcAqm4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('and-emnet-new-2-tsnu-ymanot-new-2', 'አንድ እምነት ነው /2/ ጽኑ ሃይማኖት ነው /2/', 'አንድ እምነት ነው /2/ ጽኑ ሃይማኖት ነው /2/', 'and emnet new /2/ tsnu ሃymanot new /2/', 'Ethiopian Orthodox Tewahedo Mezmur - አንድ እምነት ነው /2/ ጽኑ ሃይማኖት ነው /2/', 'ነቢያትን በትንቢት ሲያናግር የኖረው', 'nebiyatn betnbit siyanagr yenorew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=m4dYB65wDXw', 'draft', 'pending', 'https://www.youtube.com/watch?v=m4dYB65wDXw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ytbarek', 'ይትባረክ', 'ይትባረክ', 'ytbarek', 'Ethiopian Orthodox Tewahedo Mezmur - ይትባረክ', 'ይትባረክ እግዚአብሔር አምላኮሙ ለአበዊነ/2/
ዘገብረ ዐቢየ ወመንክረ/2/ እግዚአብሔር/2/
824.አንደ እግዚአብሔር ያለ
አንደ እግዚአብሔር ያለ ማንም የለምና

VERSE 1
አልል በሉ ቁሙ ለምስጋና/ሪ2/', 'ytbarek egziabሔr amlakomu leabewine/2/
zegebre ዐbiye wemenkre/2/ egziabሔr/2/
824.ande egziabሔr yale
ande egziabሔr yale manm yelemna

VERSE 1
all belu qumu lemsgana/ri2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=4nAAqQ_Hu7w', 'draft', 'pending', 'https://www.youtube.com/watch?v=4nAAqQ_Hu7w', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeiyareko-qxr-yemaydeferew', 'የኢያረኮ ቅጥር የማይደፈረው', 'የኢያረኮ ቅጥር የማይደፈረው', 'yeiyareko qxr yemaydeferew', 'Ethiopian Orthodox Tewahedo Mezmur - የኢያረኮ ቅጥር የማይደፈረው', 'ይኸው ፈራረሰ የሰው እጅ ሳይነካው
ኃይለኞቹም ቢበረታቱብን', 'yኸw ferarese yesew ej saynekaw
ኃylegnochum biberetatubn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=rCQ3Wy0UUZ8', 'draft', 'pending', 'https://www.youtube.com/watch?v=rCQ3Wy0UUZ8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mieda-lay-wedeqe-gasha-hono-agziab-r', 'ሜዳ ላይ ወደቀ ጋሻ ሆኖ አግዚአብሔር', 'ሜዳ ላይ ወደቀ ጋሻ ሆኖ አግዚአብሔር', 'mieda lay wedeqe gasha hono agziabሔr', 'Ethiopian Orthodox Tewahedo Mezmur - ሜዳ ላይ ወደቀ ጋሻ ሆኖ አግዚአብሔር', 'ለሥላሴ ይድረስ ምስጋናችን', 'leሥlasie ydres msganachn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ZC23_uYnY9w', 'draft', 'pending', 'https://www.youtube.com/watch?v=ZC23_uYnY9w', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('mieda-lay-wedeqe-gasha-hono-agziab-r', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('anamnalen-bemenfes-qdus', 'አናምናለን በመንፈስ ቅዱስ', 'አናምናለን በመንፈስ ቅዱስ', 'anamnalen bemenfes qdus', 'Ethiopian Orthodox Tewahedo Mezmur - አናምናለን በመንፈስ ቅዱስ', 'ኸኸ ፍጹም ጥርጣሬ ሳይኖር አንድ
እግዚአብሔር ብለን/2/
የሥላሴን ቸርነት የሥላሴን ጥበብ
ልቡናችን ይረዳ ኅሊናቸን ይማር

VERSE 1
ኸኸ አንደ አምላክነቱ አንመነው/
ከአውነት ሁሉ የሚበልጥ ነው
በስም በአካል በግብር
ሦስትነቱን አምነን

VERSE 2
በመለኮት አንድ አምላክ ብለን እናምናለን
አናምናለን በአብ አናምናለን በወልድ
አናምናለን በመንፈስ ቅዱስ', 'ኸኸ ftsum xrxarie saynor and
egziabሔr blen/2/
yeሥlasien chernet yeሥlasien xbeb
lbunachn yreda ኅlinachen ymar

VERSE 1
ኸኸ ande amlaknetu anmenew/
keawnet hulu yemibelx new
besm beakal begbr
ሦstnetun amnen

VERSE 2
bemelekot and amlak blen enamnalen
anamnalen beab anamnalen beweld
anamnalen bemenfes qdus', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=mbMBR2A42mg', 'draft', 'pending', 'https://www.youtube.com/watch?v=mbMBR2A42mg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('anamnalen-bemenfes-qdus', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dnq-adrgolgnal-lj-hoy-na-alegn', 'ድንቅ አድርጎልኛል ልጅ ሆይ ና አለኝ', 'ድንቅ አድርጎልኛል ልጅ ሆይ ና አለኝ', 'dnq adrgolgnal lj hoy na alegn', 'Ethiopian Orthodox Tewahedo Mezmur - ድንቅ አድርጎልኛል ልጅ ሆይ ና አለኝ', 'ድንቅ አድርጎልኛል በዳግም ምጽዐቱ', 'dnq adrgolgnal bedagm mtsዐtu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=1zyXg_zYNjk', 'draft', 'pending', 'https://www.youtube.com/watch?v=1zyXg_zYNjk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dnq-adrgolgnal-dnq-adrgolgnal', 'ድንቅ አድርጎልኛል ድንቅ አድርጎልኛል', 'ድንቅ አድርጎልኛል ድንቅ አድርጎልኛል', 'dnq adrgolgnal dnq adrgolgnal', 'Ethiopian Orthodox Tewahedo Mezmur - ድንቅ አድርጎልኛል ድንቅ አድርጎልኛል', 'ድንቅ አድርጎልኛል ጠላቶቼን ሁሉ
ድንቅ አድርጎልኛል  ሲዋደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል
ድንቅ አድርጎልኛል እያሉ ሲሉኝ

VERSE 1
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ
836.ስሙ በክብር
ስሙ በክብር ክፍ ከፍ በሏልና', 'dnq adrgolgnal xelatochien hulu
dnq adrgolgnal  siwadedubgn
dnq adrgolgnal man ydersletal
dnq adrgolgnal eyalu silugn

VERSE 1
dnq adrgolgnal fexneh deresklgn
dnq adrgolgnal kemot adankegn
836.smu bekbr
smu bekbr kf kef belualna', 'amharic', 'mezmur', 'ዘማሪ ቀሲስ ምንዳዬ ብርሃኑ', 'https://www.youtube.com/watch?v=X8oFwUIwdY4', 'draft', 'pending', 'https://www.youtube.com/watch?v=X8oFwUIwdY4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('msgana-le-lasie', 'ምስጋና ለሥላሴ', 'ምስጋና ለሥላሴ', 'msgana leሥlasie', 'Ethiopian Orthodox Tewahedo Mezmur - ምስጋና ለሥላሴ', 'ምስጋና ለሥላሴ ለዓለሙ ሁሉ ፈጣሪ/2/
በመላእክቱ ነውና ሲመሰገን ኗሪ/4/', 'msgana leሥlasie leዓlemu hulu fexari/2/
bemelaektu newna simesegen nuari/4/', 'amharic', 'mezmur', 'ዘማሪት ፋንቱ ወልዴ', 'https://www.youtube.com/watch?v=E7kDkKROCEU', 'draft', 'pending', 'https://www.youtube.com/watch?v=E7kDkKROCEU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('msgana-le-lasie', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('letalaq-smu-leqdus-smu-ydresw-msgana', 'ለታላቅ ስሙ ለቅዱስ ስሙ', 'ለታላቅ ስሙ ለቅዱስ ስሙ', 'letalaq smu leqdus smu ydresw msgana', 'Ethiopian Orthodox Tewahedo Mezmur - ለታላቅ ስሙ ለቅዱስ ስሙ', 'ለታላቅ ስሙ ለቅዱስ ስሙ ይድረሰው ምስጋና
ሕዝቡን አየመራ ያሻገረ
ባሕረ ኤርትራን የከፈለ
ጠላቶችን ውኃ ከዳናቸው

VERSE 1
ሕዝብህም በደስታ አልል አለ
ለታላቅ ስሙ ለቅዱስ ስሙ
ለታላቅ ስሙ ለቅዱስ ስሙ
ለታላቅ ስሙ ለቅዱስ ስሙ

VERSE 2
ለታላቅ ስሙ ለቅዱስ ስሙ', 'letalaq smu leqdus smu ydresew msgana
/2/
/2/
ሕzbun ayemera yashagere

VERSE 1
baሕre iertran yekefele
xelatochn wኃ kedanachew
ሕzbhm bedesta all ale
letalaq smu leqdus smu

VERSE 2
letalaq smu leqdus smu
letalaq smu leqdus smu
letalaq smu leqdus smu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=sfxl2PLVqso', 'draft', 'pending', 'https://www.youtube.com/watch?v=sfxl2PLVqso', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('letalaq-smu-leqdus-smu-ydresw-msgana', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdus-fexariyien-anten-tamlkh', 'ቅዱስ ፈጣሪዬን አንተን ታምልክህ', 'ቅዱስ ፈጣሪዬን አንተን ታምልክህ', 'qdus fexariyien anten tamlkh', 'Ethiopian Orthodox Tewahedo Mezmur - ቅዱስ ፈጣሪዬን አንተን ታምልክህ', 'በመሐሪነትህ ጠብቀህ ያኖርከኝ
በማዳን ችሎታህ ለዚህ ያደረስከኝ
ለአንተ ለአምላኬ ምስጋና አቀርባለሁ
ስምህን ለዘለዓለም ሁሌም እጠራለሁ', 'bemeሐrineth xebqeh yanorkegn
bemadan chlotah lezih yadereskegn
leante leamlakie msgana aqerbalehu
smhn lezeleዓlem huliem exeralehu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=4EoFK2hIUKQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=4EoFK2hIUKQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('qdus-fexariyien-anten-tamlkh', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gosquala-bhonm-msgana-aqerbalehu-2', 'ጎስቋላ ብሆንም ምስጋና አቀርባለሁ/2/', 'ጎስቋላ ብሆንም ምስጋና አቀርባለሁ/2/', 'gosquala bhonm msgana aqerbalehu/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ጎስቋላ ብሆንም ምስጋና አቀርባለሁ/2/', 'አንደ ቃልህ መሄድ መራመድ አቅቶኝ
የኃጢአቱ መንገድ ማዕበሉ ገፍቶኝ
ወደ አርሱ ስማጸን ደግሞም ስጸጸት
አላሳፈረኝም መጣ በምሕረት /2/', 'ande qalh mehed meramed aqtogn
yeኃxiatu menged maዕbelu geftogn
wede arsu smatsen degmom stsetset
alasaferegnm mexa bemሕret /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=DIf6ncBzijM', 'draft', 'pending', 'https://www.youtube.com/watch?v=DIf6ncBzijM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('gosquala-bhonm-msgana-aqerbalehu-2', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemnuln-tsadqan-sema-tat', 'ለምኑልን ጻድቃን ሰማዕታት', 'ለምኑልን ጻድቃን ሰማዕታት', 'lemnuln tsadqan semaዕtat', 'Ethiopian Orthodox Tewahedo Mezmur - ለምኑልን ጻድቃን ሰማዕታት', 'ወደ አምላከ ምሕረት ለምኑልን
የመረጥከውን ማን ይከሳል', 'wede amlake mሕret lemnuln
yemerexkewn man ykesal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=sRg_LyzvnRw', 'draft', 'pending', 'https://www.youtube.com/watch?v=sRg_LyzvnRw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('lemnuln-tsadqan-sema-tat', 'martyrs', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemigebaw-kbrn-mesxet', 'ለሚገባው ክብርን መስጠት', 'ለሚገባው ክብርን መስጠት', 'lemigebaw kbrn mesxet', 'Ethiopian Orthodox Tewahedo Mezmur - ለሚገባው ክብርን መስጠት', 'ታዝዚል አና በመጻሕፍት
ያከብርካቸውን ባሪያዎችህን
አንከብራልን ቅዱሳንህን /2/
ጽኑ መዳን አንዲይዙ

VERSE 1
የሚላኩ የሚታዘዙ
ሠርክ በፊትህ አየቆሙ
ጥዑም ቅዳሴን አያሰሙ
በምስጋናቸው የሚየከብሩህን

VERSE 2
አናከብራለን መላእክትህን''/2/
ጤዛ ልሰው ዳዋ ጥሰው
ዋዕይ ቁሩንም ታግሰው
በየፍርክታው በየዱሩ

VERSE 3
ሌጦ ለብሰው እየዞሩ
በሥርዓታቸው ያከበሩህን
እናከብራለን ጻድቃንህን''/2/
አንደሚታረዱ በጎች ሆነው

VERSE 4
አንገታቸውን ለሰይፍ ሰጥተው
ስለ ስምህ እየተጣሉ
ከአንበሳ ጋር እየታገሉ
በተጋድሏቸው ያከበሩህን

VERSE 5
አናከብራለን ሰማዕታትን/2/
ከሕያው ቃልህ እየጠቀሱ
መናፍቃንን ድል አየነሱ
በገዛ ደምህ የዋጀሀትን

VERSE 6
ቤተ ክርስቲያንን የጠበቋትን
በሕይወታቸው ያስደሰቱህን
እናከብራለን ቅዱሳንህን''/2/', 'tazzil ana bemetsaሕft
yakebrkachewn bariyawochhn
ankebraln qdusanhn /2/
tsnu medan andiyzu

VERSE 1
yemilaku yemitazezu
ሠrk befith ayeqomu
xዑm qdasien ayasemu
bemsganachew yemiyekebruhn

VERSE 2
anakebralen melaekthn''/2/
xieza lsew dawa xsew
waዕy qurunm tagsew
beyefrktaw beyeduru

VERSE 3
liexo lebsew eyezoru
beሥrዓtachew yakeberuhn
enakebralen tsadqanhn''/2/
andemitaredu begoch honew

VERSE 4
angetachewn leseyf sextew
sle smh eyetexalu
keanbesa gar eyetagelu
betegadluachew yakeberuhn

VERSE 5
anakebralen semaዕtatn/2/
keሕyaw qalh eyexeqesu
menafqann dl ayenesu
begeza demh yewajehatn

VERSE 6
biete krstiyann yexebequatn
beሕywetachew yasdesetuhn
enakebralen qdusanhn''/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=KzJKgfUgt5o', 'draft', 'pending', 'https://www.youtube.com/watch?v=KzJKgfUgt5o', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('lemigebaw-kbrn-mesxet', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('le-lem-lem-amanuiel', 'ለዓለም ዓለም አማኑኤል', 'ለዓለም ዓለም አማኑኤል', 'leዓlem ዓlem amanuiel', 'Ethiopian Orthodox Tewahedo Mezmur - ለዓለም ዓለም አማኑኤል', 'አገዛልህለሁ መድኃኔዓለም /2/
ቀኑ ጨለሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደኩኖ
ረዳት ያጣሁኝ በመሰለኝ ጊዜ

VERSE 1
ፈጽሞ አራቅኽልኝ የልቤን ትካዜ', 'agezalhlehu medኃnieዓlem /2/
qenu celemobgn zuriyaw gedel hono
yechgr arenqua fitie tedekuno
redat yaxahugn bemeselegn gizie

VERSE 1
fetsmo araqኽlgn yelbien tkazie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=MVWO8nRSwww', 'draft', 'pending', 'https://www.youtube.com/watch?v=MVWO8nRSwww', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlak-hoy-msgana-leante-ygebahal', 'አምላክ ሆይ ምስጋና ለአንተ ይገባሀል', 'አምላክ ሆይ ምስጋና ለአንተ ይገባሀል', 'amlak hoy msgana leante ygebahal', 'Ethiopian Orthodox Tewahedo Mezmur - አምላክ ሆይ ምስጋና ለአንተ ይገባሀል', 'ለምስኪኗ ጎጆ በረከት ሠጥፃል', 'lemskinua gojo bereket ሠxፃl', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=T4n_dYMnCOk', 'draft', 'pending', 'https://www.youtube.com/watch?v=T4n_dYMnCOk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('amlak-hoy-msgana-leante-ygebahal', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kekbr-belay-kbrh-genene', 'ከክብር በላይ ክብርህ ገነነ', 'ከክብር በላይ ክብርህ ገነነ', 'kekbr belay kbrh genene', 'Ethiopian Orthodox Tewahedo Mezmur - ከክብር በላይ ክብርህ ገነነ', 'ከክብር በላይ ክብርህ ገነነ', 'kekbr belay kbrh genene', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Yy8WedSLb1A', 'draft', 'pending', 'https://www.youtube.com/watch?v=Yy8WedSLb1A', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('smhn-makber-gbrachn-honual', 'ስምህን ማክበር ግብራችን ሆኗል', 'ስምህን ማክበር ግብራችን ሆኗል', 'smhn makber gbrachn honual', 'Ethiopian Orthodox Tewahedo Mezmur - ስምህን ማክበር ግብራችን ሆኗል', 'አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከሕፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የእኛ እጣ /2/

VERSE 1
በምግብ አጦት ብንሰቃይም
ማኅሌትህን አናቋርጥም
የመከራ ዶፍ ቢወርድብንም
አንዘምራለን ለአምላካችን ስም /2/

VERSE 2
ሰማዩ ዝናብ ደመና ሲያጣ
ፍቅርህ በአኛ ውስጥ አላቋረጠም
ቸርነትህን አንጠብቃለን
ከአንተ ደጅ ጌታ የት እንሄዳለን /2/

VERSE 3
523. ማን ነው እርሱ
ማን ነው አርሱ ማን ነው እርሱ/2/
ምድርን የሠራ በኃያል ቃሉ ማን ነው እርሱ
ሕይወትን የሰጠ ለፍጥረት ሁሉ ማን ነው አርሱ

VERSE 4
የባሕርን ሞገድ የሚገስጸው ማን ነው አርሱ
የኃይላት ጌታ ጌታችን ማን ነው ማን ነው አርሱ ማን
ነው አርሱ /2/
ከጥልቀት በታች ከምጥቀት በላይ

VERSE 5
ማነው ጌታችን ሁሉንም የሚያይ
ማን ነው አርሱ ማን ነው አርሱ
ከፈሳሾች ውስጥ ወንዙን የሚያፈስ
ማን ነው አርሱ

VERSE 6
ምድርን ልምላሜ ፍጹም የሚያለብስ
ማን ነው አርሱ
ጥቃቅን ነፍሳት የሚመግበው
ማን ነው አርሱ

VERSE 7
ስምህን ማክበር ግብራችን ሆኗል
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከሕፃናት አፍ ምስጋና ይውጣ

VERSE 8
አንተን ማመስገን ይሁን የእኛ እአጣ/2/
በምግብ እጦት ብንሰቃይም
ማኅሌትህን አናቋርጥም
የመከራ ዶፍ ቢወርድብንም

VERSE 9
አንዘምራለን ለአምላካችን ስም/2/', 'amlak temesgen besemayat
smh ywedes befxretat
keሕፃnat af msgana ywxa
anten mamesgen yhun yeegna exa /2/

VERSE 1
bemgb axot bnseqaym
maኅliethn anaquarxm
yemekera dof biwerdbnm
anzemralen leamlakachn sm /2/

VERSE 2
semayu znab demena siyaxa
fqrh beagna wsx alaquarexem
chernethn anxebqalen
keante dej gieta yet enhedalen /2/

VERSE 3
523. man new ersu
man new arsu man new ersu/2/
mdrn yeሠra beኃyal qalu man new ersu
ሕywetn yesexe lefxret hulu man new arsu

VERSE 4
yebaሕrn moged yemigestsew man new arsu
yeኃylat gieta gietachn man new man new arsu man
new arsu /2/
kexlqet betach kemxqet belay

VERSE 5
manew gietachn hulunm yemiyay
man new arsu man new arsu
kefesashoch wsx wenzun yemiyafes
man new arsu

VERSE 6
mdrn lmlamie ftsum yemiyalebs
man new arsu
xqaqn nefsat yemimegbew
man new arsu

VERSE 7
smhn makber gbrachn honual
amlak temesgen besemayat
smh ywedes befxretat
keሕፃnat af msgana ywxa

VERSE 8
anten mamesgen yhun yeegna eaxa/2/
bemgb exot bnseqaym
maኅliethn anaquarxm
yemekera dof biwerdbnm

VERSE 9
anzemralen leamlakachn sm/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=gy_cUVvo97w', 'draft', 'pending', 'https://www.youtube.com/watch?v=gy_cUVvo97w', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('smhn-makber-gbrachn-honual', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('semayu-znab-demena-biyaxa', 'ሰማዩ ዝናብ ደመና ቢያጣ', 'ሰማዩ ዝናብ ደመና ቢያጣ', 'semayu znab demena biyaxa', 'Ethiopian Orthodox Tewahedo Mezmur - ሰማዩ ዝናብ ደመና ቢያጣ', 'ፍቅርህ በአኛ ውስጥ አላቋረጠም
ቸርነትህን አንጠብቃለን
ከአንተ ደጅ ጌታ የት እንሄዳለን/2/
857.አንደበቴም ያወጣ

VERSE 1
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
ወጥመድ ተሰበረ አጌም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስትን አፍ በኃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኔ ጋር

VERSE 3
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋራ ልዘምር አብሬ
አርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክበር እዘምራለሁኝ

VERSE 4
አስፈሪው ነበልባል አሳቱ ቢነድም
ለጣዖት እንድንሰግድ ነገሥታት ቢያውጁም
ሁሉ ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃኔዓለም

VERSE 5
859.ወደ ቤተ እግዚአብሔር
ወደ ቤተ እግዚአብሔር እንሂድ', 'fqrh beagna wsx alaquarexem
chernethn anxebqalen
keante dej gieta yet enhedalen/2/
857.andebetiem yawexa

VERSE 1
andebetiem yawxa yemsgana qnie
yeamlakien madan aychalehu beዓynie
begebaዖn semay ፀሐyn yaqome
zariem gobgntognal eyedegageme

VERSE 2
wexmed tesebere agiem amelexkugn
keኃxiat flaፃ kemot aterefegn
yeanabstn af beኃylu yezega
yedaniel amlak ynoral keenie gar

VERSE 3
bedawit msgana beyaried zmarie
keqdusan gara lzemr abrie
arsun samesegn mielkol btsqbgn
legietayie kber ezemralehugn

VERSE 4
asferiw nebelbal asatu binedm
lexaዖt endnsegd negeሥtat biyawjum
hulu bitewegnm bixelagnm ዓlem
tsnat yhonegnal gieta medኃnieዓlem

VERSE 5
859.wede biete egziabሔr
wede biete egziabሔr enhid', 'amharic', 'mezmur', 'ዘማሪት ፋንቱ ወልዴ', 'https://www.youtube.com/watch?v=0Jdz0ggSZjI', 'draft', 'pending', 'https://www.youtube.com/watch?v=0Jdz0ggSZjI', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ke-lem-befit-yenebere', 'ከዓለም በፊት የነበረ', 'ከዓለም በፊት የነበረ', 'keዓlem befit yenebere', 'Ethiopian Orthodox Tewahedo Mezmur - ከዓለም በፊት የነበረ', 'ፍጥረታትን ሁሉ የፈጠረ
በምድር ክብብ የሚቀመጥ
ሁሉን ሲለውጥ የማይለወጥ /2/', 'fxretatn hulu yefexere
bemdr kbb yemiqemex
hulun silewx yemaylewex /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=NDPdSKvCzoQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=NDPdSKvCzoQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tnantnam-zariem-ante-yaw-anteneh', 'ትናንትናም ዛሬም አንተ ያው አንተነህ', 'ትናንትናም ዛሬም አንተ ያው አንተነህ', 'tnantnam zariem ante yaw anteneh', 'Ethiopian Orthodox Tewahedo Mezmur - ትናንትናም ዛሬም አንተ ያው አንተነህ', 'ፍቅርህ አይቀየር ወረትም የለብህ
ስምህን መጥራቴ ሞገስ ይሆነኛል
ጠላቴ ቢፎክር መቼ ያሸንፈኛል', 'fqrh ayqeyer weretm yelebh
smhn mexratie moges yhonegnal
xelatie bifokr mechie yashenfegnal', 'amharic', 'mezmur', 'Gebreyohannes Gebretsadik', 'https://www.youtube.com/watch?v=VxUDRtqK6Q8', 'draft', 'pending', 'https://www.youtube.com/watch?v=VxUDRtqK6Q8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('met-dem-sifessh', '12 ዓመት ደም ሲፈስሽ', '12 ዓመት ደም ሲፈስሽ', 'ዓmet dem sifessh', 'Ethiopian Orthodox Tewahedo Mezmur - 12 ዓመት ደም ሲፈስሽ', 'ሰዎች ሲንቁሽ ሲያንቋሸሹሽ
ማን ፈወሠሽ አንቺ ሴት', 'sewoch sinqush siyanquasheshush
man feweሠsh anchi siet', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Q88_y5hYs6k', 'draft', 'pending', 'https://www.youtube.com/watch?v=Q88_y5hYs6k', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yabeqash-manew-lede-net', 'ያበቃሽ ማነው ለደኅነት', 'ያበቃሽ ማነው ለደኅነት', 'yabeqash manew ledeኅnet', 'Ethiopian Orthodox Tewahedo Mezmur - ያበቃሽ ማነው ለደኅነት', 'አምነትሽ አዳነሽ አለኝና
ኃይል ከእርሱ ወጣ የሚያጽናና
የጌታ ልብሱን ብዳብሰው
ደሜ ቀጥ አለ ላወድሰው

VERSE 1
በቤተ ሳይዳ በአልጋ ስትኖር
በመጠመቂያው በወንዙ ዳር
ደውይ ስትሆን በሽተኛ
አንዴት ተፈወስክ አውጋን ለእኛ

VERSE 2
አልጋ ታቅፌ ስንገላታ
መዳን ትሻለህ አለኝ ጌታ
አምላኬ አርሱ ፈወሰኝ
አልጋህን ይዘህ ሂድ አለኝ

VERSE 3
898.እግዚአብሔር ሆይ እርዳኝ
አግዚአብሔር ሆይ አርዳኝ ቸርነት አድርገህ/2/
አድሜ ለንስሓ እንደ ሕዝቅያስ ሠጥተህ
ጠማማውን ልቤን በቃልህ አቃንተህ

VERSE 4
አላውቀውም ብሉ ሲጠይቅ ያመፀው
ዶሮ እስኪጮህ ድረስ ሦስት ጊዜ የካደው
የጅረት ወንዝ ነው የሰጠኸው አንባ
ጴጥሮስ ተጸጸቶ ንስሓ እንዲገባ

VERSE 5
ጽዋው እንዳይደርስኝ የይሁዳ እድል
ልጆች ሆኖ ውሎ ኃላ መኮብለል
ጴጥሮስ እድለኛ አልቅሶ ተማረ
በትፅቢቱ ይሁዳ እንዲወጣ ቀረ

VERSE 6
ዘመኗን በሙሉ በዝሙት አቃጥላ
በንስሓ ጠራት ጌታ በገሊላ
ታድሳ ተነሣች በእንባዋ ብዛት
አግሩ ስር ተደፍታ ማርያም እንተ እፍረት

VERSE 7
አመፀኛው ልቤ ዛሬስ መቼ ይተኛል
በኃጢአት በዝሙት በሥርቆት ይዋኛል
ወደ ቀድሞ ግብሩ እንዳይመለስ
ፍቅርህ በእኔ ሰርዖ ኃጢአቴን ደምስስ', 'amnetsh adanesh alegnna
ኃyl keersu wexa yemiyatsnana
yegieta lbsun bdabsew
demie qex ale lawedsew

VERSE 1
bebiete sayda bealga stnor
bemexemeqiyaw bewenzu dar
dewy sthon beshtegna
andiet tefewesk awgan leegna

VERSE 2
alga taqfie sngelata
medan tshaleh alegn gieta
amlakie arsu fewesegn
algahn yzeh hid alegn

VERSE 3
898.egziabሔr hoy erdagn
agziabሔr hoy ardagn chernet adrgeh/2/
admie lensሓ ende ሕzqyas ሠxteh
xemamawn lbien beqalh aqanteh

VERSE 4
alawqewm blu sixeyq yameፀw
doro eskicoh dres ሦst gizie yekadew
yejret wenz new yesexeኸw anba
phiexros tetsetseto nsሓ endigeba

VERSE 5
tswaw endaydersgn yeyhuda edl
ljoch hono wlo ኃla mekoblel
phiexros edlegna alqso temare
betፅbitu yhuda endiwexa qere

VERSE 6
zemenuan bemulu bezmut aqaxla
bensሓ xerat gieta begelila
tadsa teneሣch beenbawa bzat
agru sr tedefta maryam ente efret

VERSE 7
ameፀgnaw lbie zaries mechie ytegnal
beኃxiat bezmut beሥrqot ywagnal
wede qedmo gbru endaymeles
fqrh beenie serዖ ኃxiatien demss', 'amharic', 'mezmur', 'ዘማሪ ዳግማዊ ደርቤ', 'https://www.youtube.com/watch?v=ZTdI1W7Z-mg', 'draft', 'pending', 'https://www.youtube.com/watch?v=ZTdI1W7Z-mg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mengedu-aytaktm-godanaw-yeqena-2', 'መንገዱ አይታክትም ጎዳናው የቀና /2/', 'መንገዱ አይታክትም ጎዳናው የቀና /2/', 'mengedu aytaktm godanaw yeqena /2/', 'Ethiopian Orthodox Tewahedo Mezmur - መንገዱ አይታክትም ጎዳናው የቀና /2/', 'አግዚአብሔር ከፊትም ከ3ላም አለና /2/
አርሱ የሌለበት ቢመችም መንገዱ/2/
አቅጣጫው ወደ ሞት አይቀርም መውሰዱ/ሪ2/', 'agziabሔr kefitm ke3lam alena /2/
arsu yelielebet bimechm mengedu/2/
aqxacaw wede mot ayqerm mewsedu/ri2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=7SSdVge0y04', 'draft', 'pending', 'https://www.youtube.com/watch?v=7SSdVge0y04', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('mengedu-aytaktm-godanaw-yeqena-2', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('n-n-amanuiel-n-n-med-nie-lem', 'ንዓ ንዓ አማኑኤል', 'ንዓ ንዓ አማኑኤል', 'nዓ nዓ amanuiel nዓ nዓ medኃnieዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - ንዓ ንዓ አማኑኤል', 'በፍሥሐ ወበሰላም ና ወደ አኛ መድኃኔዓለም
ንዓ ንዓ አማኑኤል', 'befሥሐ webeselam na wede agna medኃnieዓlem
nዓ nዓ amanuiel', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=tbk0bF3W-Yw', 'draft', 'pending', 'https://www.youtube.com/watch?v=tbk0bF3W-Yw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kemahu-yastegabaekmu-bedebre-tsyon-qdst', 'ከማሁ ያስተጋባእክሙ በደብረ ጽዮን ቅድስት', 'ከማሁ ያስተጋባእክሙ በደብረ ጽዮን ቅድስት', 'kemahu yastegabaekmu bedebre tsyon qdst', 'Ethiopian Orthodox Tewahedo Mezmur - ከማሁ ያስተጋባእክሙ በደብረ ጽዮን ቅድስት', 'ወበኢየሩሳሌም ኢየሩሳሌም አጋእአዚት/2/', 'webeiyerusaliem iyerusaliem agaeazit/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=tHgKdGSClrU', 'draft', 'pending', 'https://www.youtube.com/watch?v=tHgKdGSClrU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nolawi-tgu-zeitnewm-2', 'ኖላዊ ትጉኅ ዘኢትነውም /2/', 'ኖላዊ ትጉኅ ዘኢትነውም /2/', 'nolawi tguኅ zeitnewm /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ኖላዊ ትጉኅ ዘኢትነውም /2/', 'ማኅበረነ /2/ እቀብ በሰላም /4/
881.ያከብረዋ
ያከብርዋ ለሰንበት መላእክት
በሰማያት ጻድቃን በውስተ ገነት/2

VERSE 1
ወኩሉ ፍጥረት ዓሳት ወአናብርት/2/
አለውስተ ደይን ያእረፉ ባቲ
አስመ ባቲ አእረፈ እምኩሉ ግብሩ /2/
ያከብራታል ሰንበትን መላአክት በሰማያት

VERSE 2
ጻድቃን በገነት
ፍጥረታት በሙሉ አሳዎችና አንበሬዎች
በመቃብር ያሉ ያከብራታል አምላክ /2/
በአርሷ እንዳረፈ ከሥራው ሁሉ

VERSE 3
882.ሀበነ
ሀበነ እግዚኦ አዕምሮ አእይንተ አፅምሮ
ወትረ ኪያከ ይርአይ/2/
ወአእዛንነሂ ቃለ ዘባሕቲትከ ይስምዕ/2/

VERSE 4
883.እንዘ ኢየምር
እንዘ የአምር እምቅድመ ኅሊና ዘይሄሊ ልበ
የአምር የአምር/2/
አርዓየ ኃይሎ በላዕሌነ ወጸገወነ ኸ

VERSE 5
ሠናይቶ እግዚአብሔር/2/
884.ያልጠፋነው
ያልጠፋነው ከእግዚአብሔር ምሕረት የተነሣ
ነው/ሪ/

VERSE 6
ምሕረቱ ከቶ አያልቅምና ርኅራነጌው ከቶ
አያልቅምና ይገባዋል ክብርና ምስጋና/''/2/
885.8ሰማይ ገብረ
ዘሰማየ ገብረ ሰማየ ገብረ ወምድረ ሳረረ/2/

VERSE 7
አልቦ ዘይመስሎ ለአምላክነ/4/
ሰማይን የዘረጋ መሬትን ያጸና/2/', 'maኅberene /2/ eqeb beselam /4/
881.yakebrewa
yakebrwa lesenbet melaekt
besemayat tsadqan bewste genet/2

VERSE 1
wekulu fxret ዓsat weanabrt/2/
alewste deyn yaerefu bati
asme bati aerefe emkulu gbru /2/
yakebratal senbetn melaakt besemayat

VERSE 2
/2/
/2/
tsadqan begenet
fxretat bemulu asawochna anberiewoch

VERSE 3
bemeqabr yalu yakebratal amlak /2/
bearsua endarefe keሥraw hulu
882.habene
habene egzio aዕmro aeynte aፅmro

VERSE 4
wetre kiyake yray/2/
weaezannehi qale zebaሕtitke ysmዕ/2/
883.enze iyemr
enze yeamr emqdme ኅlina zeyheli lbe

VERSE 5
yeamr yeamr/2/
arዓye ኃylo belaዕliene wetsegewene ኸ
ሠnayto egziabሔr/2/
884.yalxefanew

VERSE 6
yalxefanew keegziabሔr mሕret yeteneሣ
new/ri/
mሕretu keto ayalqmna rኅranegiew keto
ayalqmna ygebawal kbrna msgana/''/2/

VERSE 7
885.8semay gebre
zesemaye gebre semaye gebre wemdre sarere/2/
albo zeymeslo leamlakne/4/
semayn yezerega merietn yatsena/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=xLJUFZ2p5uY', 'draft', 'pending', 'https://www.youtube.com/watch?v=xLJUFZ2p5uY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('nolawi-tgu-zeitnewm-2', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yelbachn-desta-endnalen', 'የልባችን ደስታ እንድናለን', 'የልባችን ደስታ እንድናለን', 'yelbachn desta endnalen', 'Ethiopian Orthodox Tewahedo Mezmur - የልባችን ደስታ እንድናለን', 'የልባችን ደስታ እንድናለን', 'yelbachn desta endnalen', 'amharic', 'mezmur', 'ዘማሪት ፋንቱ ወልዴ', 'https://www.youtube.com/watch?v=Y8vWeTBpfds', 'draft', 'pending', 'https://www.youtube.com/watch?v=Y8vWeTBpfds', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('xewat-mata-qdst-hoy-ylalu', 'ጠዋት ማታ ቅድስት ሆይ ይላሉ', 'ጠዋት ማታ ቅድስት ሆይ ይላሉ', 'xewat mata qdst hoy ylalu', 'Ethiopian Orthodox Tewahedo Mezmur - ጠዋት ማታ ቅድስት ሆይ ይላሉ', 'ዓለም ሥትዋጋን በምኞት ስለት
ነፍሳችን ስትደክም ሲከብዳት ኃጢአት
መንገድ ጠፍቶን ግራ ሲገባን
ብርፃሃናቸን ነይ እናታችን', 'ዓlem ሥtwagan bemgnot slet
nefsachn stdekm sikebdat ኃxiat
menged xefton gra sigeban
brፃሃnachen ney enatachn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Bgdbh1TvJ7E', 'draft', 'pending', 'https://www.youtube.com/watch?v=Bgdbh1TvJ7E', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yemnmekabat', 'የምንመካባት', 'የምንመካባት', 'yemnmekabat', 'Ethiopian Orthodox Tewahedo Mezmur - የምንመካባት', 'በሷም ተማጽነን የምንድንባት', 'besuam tematsnen yemndnbat', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=dm6NWa4lOP4', 'draft', 'pending', 'https://www.youtube.com/watch?v=dm6NWa4lOP4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('alaquarxm-yeanchin-msgana', 'አላቋርጥም የአንቺን ምስጋና', 'አላቋርጥም የአንቺን ምስጋና', 'alaquarxm yeanchin msgana', 'Ethiopian Orthodox Tewahedo Mezmur - አላቋርጥም የአንቺን ምስጋና', 'ውለታሽ ድንግል አለብኝና
አላቋርጥም የአንቺን ምስጋና
ውለታሽ ድንግል አለብኝና', 'wletash dngl alebgnna
alaquarxm yeanchin msgana
wletash dngl alebgnna', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=mEDdUZmxcPU', 'draft', 'pending', 'https://www.youtube.com/watch?v=mEDdUZmxcPU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kfuwoch-drsew-biztubgn', 'ክፉዎች ድርሰው ቢዝቱብኝ', 'ክፉዎች ድርሰው ቢዝቱብኝ', 'kfuwoch drsew biztubgn', 'Ethiopian Orthodox Tewahedo Mezmur - ክፉዎች ድርሰው ቢዝቱብኝ', 'መከራ አብዝተው ቢያሠቃዩኝ
አንቺ ካለሽኝ ምን እሆናለሁ
አውሎ ነፋሱን ባሕሩን አልፋለሁ
ጠላቴ ደርሶ በያሠቃየኝ', 'mekera abztew biyaሠqayugn
anchi kaleshgn mn ehonalehu
awlo nefasun baሕrun alfalehu
xelatie derso beyaሠqayegn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=gzcew8dArCU', 'draft', 'pending', 'https://www.youtube.com/watch?v=gzcew8dArCU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('chla-satyn-zebeaman', 'ችላ ሳትይን ዘበአማን', 'ችላ ሳትይን ዘበአማን', 'chla satyn zebeaman', 'Ethiopian Orthodox Tewahedo Mezmur - ችላ ሳትይን ዘበአማን', 'ምሕረት አሠጪን ዘበአማን
ድንግል አትርሺን
የመመኪያችን ዘውድ ዘበአማን
አመብርሃን

VERSE 1
ከልጅሽ አስታሪቂኝ ዘበአማን
አንዳንቀር ወድቀን
902. በክብር ዙፋኑ
በክቡር ዙፋኑ መርጦ ያስቀመጠሽ

VERSE 2
ለእኛ ለኃጢአተኞች ተስፋቸን አንቺ ነሽ
በፍጹም ትኅትና ቤተመቅደስ ያደግሽ
የአማኑኤል የጌታዬ የፈጣሪዬ እናት በምን እንመስልሽ', 'mሕret aሠcin zebeaman
dngl atrshin
yememekiyachn zewd zebeaman
amebrሃn

VERSE 1
keljsh astariqign zebeaman
andanqer wedqen
902. bekbr zufanu
bekbur zufanu merxo yasqemexesh

VERSE 2
leegna leኃxiategnoch tesfachen anchi nesh
beftsum tኅtna bietemeqdes yadegsh
yeamanuiel yegietayie yefexariyie enat bemn enmeslsh', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ri1JcwZM82g', 'draft', 'pending', 'https://www.youtube.com/watch?v=ri1JcwZM82g', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lewdasiesh-qelem', 'ለውዳሴሽ ቀለም', 'ለውዳሴሽ ቀለም', 'lewdasiesh qelem', 'Ethiopian Orthodox Tewahedo Mezmur - ለውዳሴሽ ቀለም', 'የክርስቶስ እናት
የመድኃኔዓለም
ትውልድ ሁሉ አንቺን ለመዘከር
ይትጋ ኅሊናዬ

VERSE 1
በውዳሴሽ ቅኔ
ይሙላ ልቡናዬ
ልቀበል በረከት
ስምሽን ጠርቼ

VERSE 2
አንቺ ባለሽበት
ይቁሙ አግሮቼ
907.አንቀፀ በርፃን
አንቀፀ ብርፃን ድንግል ማርያም

VERSE 3
ሰማያዊ ዙፋን የመድኃኔዓለም/ሪ/', 'yekrstos enat
yemedኃnieዓlem
twld hulu anchin lemezeker
ytga ኅlinayie

VERSE 1
bewdasiesh qnie
ymula lbunayie
lqebel bereket
smshn xerchie

VERSE 2
anchi baleshbet
yqumu agrochie
907.anqeፀ berፃn
anqeፀ brፃn dngl maryam

VERSE 3
semayawi zufan yemedኃnieዓlem/ri/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=k0xTKIFbuIg', 'draft', 'pending', 'https://www.youtube.com/watch?v=k0xTKIFbuIg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mesheshegiya-taza', 'መሸሸጊያ ታዛ', 'መሸሸጊያ ታዛ', 'mesheshegiya taza', 'Ethiopian Orthodox Tewahedo Mezmur - መሸሸጊያ ታዛ', 'የሰላም ሠገነት
የነፍሳችን ቤዛ
አናመሥግናት የተስፋ ፀሐይ ናት
>> >> ሸልማቴ ዘውዴ

VERSE 1
>> >> የዓይኔ ብርሃን
>> >> አጽናኝ ናት ዘመዴ
>> >> የርግብ ምልክት
>> >> የአዲስ ዘመን ብሥራት

VERSE 2
>> >> የድኅነት ዓርማ
>> >> ትንቢተ ነቢያት
እናመስግናት የአዳም በረከት
>> >> የዘለዓለም ቤቱ

VERSE 3
>> >> የሐዘኑ መርሻ
>> >> ማረፊያ ርስቱ
ይገባታልና
ወዳሴና ክብር', 'yeselam ሠgenet
yenefsachn bieza
anameሥgnat yetesfa ፀሐy nat
>> >> shelmatie zewdie

VERSE 1
>> >> yeዓynie brሃn
>> >> atsnagn nat zemedie
>> >> yergb mlkt
>> >> yeadis zemen bሥrat

VERSE 2
>> >> yedኅnet ዓrma
>> >> tnbite nebiyat
enamesgnat yeadam bereket
>> >> yezeleዓlem bietu

VERSE 3
>> >> yeሐzenu mersha
>> >> marefiya rstu
ygebatalna
wedasiena kbr', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Nhjm5zRaNzY', 'draft', 'pending', 'https://www.youtube.com/watch?v=Nhjm5zRaNzY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bechgr-gizie', 'በችግር ጊዜ', 'በችግር ጊዜ', 'bechgr gizie', 'Ethiopian Orthodox Tewahedo Mezmur - በችግር ጊዜ', 'መንገድ መሪያቸው
ምን ብዬ ልጥራሽ
ላወድስሽ
የምግባር ደህ

VERSE 1
ባዶ ልጆሽ
አመብርሃን የቅዱሳኑ
ጣዕመ ዜማቸው
አንቺ ነሽና

VERSE 2
ውብ ደርስታቸው
የአኛ ሥጦታ
የድል አክሊል ነሽ
በአማልጅነት

VERSE 3
ለታመነብሽ
አምብርሃን የይስሐቅ መዓዛ
በፍኖተ ሉዛ
የያዕቆብ መሰላል

VERSE 4
የአቤል የዋኅት
የሴት ቸርነት
የኢያሱ ሐውልት
የሕይወት ውኃ

VERSE 5
የሳሙኤል ዘይት
ርግብ ሠናይት
ንግሥተ ሰማይ
አመብርሃን መልካሟ ርግብ

VERSE 6
የኖሕ መልክቱ
የኀጥአን ተስፋ
የልብ ብርታቱ
ምሥራቻቸን

VERSE 7
ውስጣችን ያለሽ
በምድር በሰማይ
አምሳያም የለሽ
909.ቃልን ለመውለድ', 'menged meriyachew
mn byie lxrash
lawedssh
yemgbar deh

VERSE 1
bado ljosh
amebrሃn yeqdusanu
xaዕme ziemachew
anchi neshna

VERSE 2
wb derstachew
yeagna ሥxota
yedl aklil nesh
beamaljnet

VERSE 3
letamenebsh
ambrሃn yeysሐq meዓza
befnote luza
yeyaዕqob meselal

VERSE 4
yeabiel yewaኅt
yesiet chernet
yeiyasu ሐwlt
yeሕywet wኃ

VERSE 5
yesamuiel zeyt
rgb ሠnayt
ngሥte semay
amebrሃn melkamua rgb

VERSE 6
yenoሕ melktu
yeኀxan tesfa
yelb brtatu
mሥrachachen

VERSE 7
wsxachn yalesh
bemdr besemay
amsayam yelesh
909.qaln lemewled', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=d_zAqOBS3x8', 'draft', 'pending', 'https://www.youtube.com/watch?v=d_zAqOBS3x8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keme-riw-ljsh', 'ከመሐሪው ልጅሽ', 'ከመሐሪው ልጅሽ', 'kemeሐriw ljsh', 'Ethiopian Orthodox Tewahedo Mezmur - ከመሐሪው ልጅሽ', 'አመቤታችን ያልታረሰች እርሻ
ዘር ያልተዘራባት
የሕይወትን ፍሬ
ሰጠችን የእኛ እናት

VERSE 1
የተሠዋው መሲህ
አናቱን ወደዳት
በቀኙ ቆማለች
ድንግል እመቤት ናት', 'amebietachn yaltaresech ersha
zer yaltezerabat
yeሕywetn frie
sexechn yeegna enat

VERSE 1
yeteሠwaw mesih
anatun wededat
beqegnu qomalech
dngl emebiet nat', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Jq8MpKq0tik', 'draft', 'pending', 'https://www.youtube.com/watch?v=Jq8MpKq0tik', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('celemaw-tegefo-siwexa-br-n', 'ጨለማው ተገፎ ሲወጣ ብርሃን', 'ጨለማው ተገፎ ሲወጣ ብርሃን', 'celemaw tegefo siwexa brሃn', 'Ethiopian Orthodox Tewahedo Mezmur - ጨለማው ተገፎ ሲወጣ ብርሃን', 'ጨለማው ተገፎ ሲወጣ ብርሃን', 'celemaw tegefo siwexa brሃn', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=xQpXWMT3Pow', 'draft', 'pending', 'https://www.youtube.com/watch?v=xQpXWMT3Pow', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nastemasleki-teqwame-ma-tot', 'ናስተማስለኪ ተቅዋመ ማኅቶት', 'ናስተማስለኪ ተቅዋመ ማኅቶት', 'nastemasleki teqwame maኅtot', 'Ethiopian Orthodox Tewahedo Mezmur - ናስተማስለኪ ተቅዋመ ማኅቶት', 'አንቺ እግዝአተ ኩሉ የሁሉ አመቤት', 'anchi egzate kulu yehulu amebiet', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=cP5Z9JpsAJM', 'draft', 'pending', 'https://www.youtube.com/watch?v=cP5Z9JpsAJM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('xla-kelelayie-amebietie-2', 'ጥላ ከለላዬ አመቤቴ /2/', 'ጥላ ከለላዬ አመቤቴ /2/', 'xla kelelayie amebietie /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ጥላ ከለላዬ አመቤቴ /2/', 'ጋሻዬ ነሽ አንቺ አመቤቴ
ለእኔ መመኪያዬ
በዓለም አንዳልጠፋ እመቤቴ
ሕይወቴ መሮብኝ አመቤቴ

VERSE 1
እንደ ወይን አጣፍጭው እመቤቴ', 'gashayie nesh anchi amebietie
leenie memekiyayie
beዓlem andalxefa emebietie
ሕywetie merobgn amebietie

VERSE 1
ende weyn axafcw emebietie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=VTFRX_oDQ3o', 'draft', 'pending', 'https://www.youtube.com/watch?v=VTFRX_oDQ3o', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('o-dngl', 'ኦ ድንግል', 'ኦ ድንግል', 'o dngl', 'Ethiopian Orthodox Tewahedo Mezmur - ኦ ድንግል', 'ኦ ድንግል አምሳል ወትንቢት /2/ ለነቢያት /2/
ሞገሶሙ ለሐዋርያት /4/
ትርጉም- ድንግል ሆይ የሐዋርያት ሞገስ
የነቢያት ትንቢት አንቺ ነሽ

VERSE 1
941.ማርያም', 'o dngl amsal wetnbit /2/ lenebiyat /2/
mogesomu leሐwaryat /4/
trgum- dngl hoy yeሐwaryat moges
yenebiyat tnbit anchi nesh

VERSE 1
941.maryam', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=gyviGTJihMU', 'draft', 'pending', 'https://www.youtube.com/watch?v=gyviGTJihMU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ma-dere-lus', 'ማኅደረ', 'ማኅደረ', 'maኅdere ሥlus', 'Ethiopian Orthodox Tewahedo Mezmur - ማኅደረ', 'ሥሉስ ቅዱስ ተብሎ ዘበአማን
የሚመሰገነው -
የፍጥረታት ገዥ ዘበአማን
የአንቺ ልጅ እኮ ነው -

VERSE 1
የምታምሪ ርግብ ዘበአማን
ሰላምን ያስገኘሽ ዘበአማን
ንጽሕናሽን አይቶ ዘበአማን
ወልድ መረጠሽ

VERSE 2
አትርሺኝ ድንግል ሆይ ዘበአማን
አኛ ልጆችሽን
ከአምላክ አስታሪቂን ዘበአማን
አኛ ደካሞችን

VERSE 3
ስለ በደላን ዘበአማን
ማኅደረ
ስምሽን
ማኅደረ

VERSE 4
ማኅደረ
ማኅደረ
ማኅደረ
ማኅደረ

VERSE 5
ማኅደረ
ማኅደረ መለኮት አሸብሸቡላት ለድንግል
ማኅደረ መለኮት ፍቀር ያላችሁ በእውነት
ማኅደረ መለኮት ትመጣለች ልትባርከን

VERSE 6
ማኅደረ መለኮት ድንግል ሆይ ባርኪን ስንላት
ማኅደረ መለኮት አፌም ይከፈት ለዝማሪ
ማኅደረ መለኮት ለአምላክ እናት ለእመቤቴ
ማኅደረ መለኮት ትምክህት ናት ለሁሉም

VERSE 7
ማኅደረ መለኮት ጸዓዳ ርግብ የሠላም
ማኅደረ መለኮት ምን ብዬ ልጥራሽ ላመስግንሽ
ማኅደረ መለኮት ከፍጥረት ሁሉ ነሽ የከበርሽ
ማኅደረ መለኮት በንጽሕና የተሸለምሽ

VERSE 8
ማኅደረ መለኮት ወላዲተ ቃል
ያለ ዘርአ ብእሲ በኅቱም ድንግልና
አምላክን የወለድሽ ሐመልማለ ሲና
ማኅደረ መለኮት /2/', 'ሥlus qdus teblo zebeaman
yemimesegenew -
yefxretat gezh zebeaman
yeanchi lj eko new -

VERSE 1
yemtamri rgb zebeaman
selamn yasgegnesh zebeaman
ntsሕnashn ayto zebeaman
weld merexesh

VERSE 2
atrshign dngl hoy zebeaman
agna ljochshn
keamlak astariqin zebeaman
agna dekamochn

VERSE 3
sle bedelan zebeaman
maኅdere
smshn
maኅdere

VERSE 4
maኅdere
maኅdere
maኅdere
maኅdere

VERSE 5
maኅdere
maኅdere melekot ashebshebulat ledngl
maኅdere melekot fqer yalachhu beewnet
maኅdere melekot tmexalech ltbarken

VERSE 6
maኅdere melekot dngl hoy barkin snlat
maኅdere melekot afiem ykefet lezmari
maኅdere melekot leamlak enat leemebietie
maኅdere melekot tmkht nat lehulum

VERSE 7
maኅdere melekot tseዓda rgb yeሠlam
maኅdere melekot mn byie lxrash lamesgnsh
maኅdere melekot kefxret hulu nesh yekebersh
maኅdere melekot bentsሕna yeteshelemsh

VERSE 8
maኅdere melekot weladite qal
yale zera besi beኅtum dnglna
amlakn yeweledsh ሐmelmale sina
maኅdere melekot /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Lby6sMPawSk', 'draft', 'pending', 'https://www.youtube.com/watch?v=Lby6sMPawSk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mahdere-melekot', 'ማህደረ መለኮት', 'ማህደረ መለኮት', 'mahdere melekot', 'Ethiopian Orthodox Tewahedo Mezmur - ማህደረ መለኮት', 'መለኮት የአምላክ አናት አመቤት
ጠርቶ ያፈረ ማነው', 'melekot yeamlak anat amebiet
xerto yafere manew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=w8tl0BxhodE', 'draft', 'pending', 'https://www.youtube.com/watch?v=w8tl0BxhodE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('melekot-dejsh-lay-qomie-slemn', 'መለኮት ደጅሽ ላይ ቆሜ ስለምን', 'መለኮት ደጅሽ ላይ ቆሜ ስለምን', 'melekot dejsh lay qomie slemn', 'Ethiopian Orthodox Tewahedo Mezmur - መለኮት ደጅሽ ላይ ቆሜ ስለምን', 'መለኮት አመብርሃን ነይ ድንግል
መለኮት መጽናኛዬ ነሽ ረዳቴ
መለኮት ጋሻና ጦሬ መከታዬ
መለኮት ስዘምርልሽ ደስ ይለኛል

VERSE 1
መለኮት ከልጆሽ ጸጋ ይሰጠኛል', 'melekot amebrሃn ney dngl
melekot metsnagnayie nesh redatie
melekot gashana xorie meketayie
melekot szemrlsh des ylegnal

VERSE 1
melekot keljosh tsega ysexegnal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=HRy4YnGUY0w', 'draft', 'pending', 'https://www.youtube.com/watch?v=HRy4YnGUY0w', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('astarqign-gefchie-wexchie', 'አስታርቂኝ ገፍቼ ወጥቼ', 'አስታርቂኝ ገፍቼ ወጥቼ', 'astarqign gefchie wexchie', 'Ethiopian Orthodox Tewahedo Mezmur - አስታርቂኝ ገፍቼ ወጥቼ', 'አስታርቂኝ የቤቴን ገበታ
አስታርቂኝ ልበላ ተመኘሁ
አስታርቂኝ የአንስሳት ገፈራ', 'astarqign yebietien gebeta
astarqign lbela temegnehu
astarqign yeanssat gefera', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=V4JA20otgGc', 'draft', 'pending', 'https://www.youtube.com/watch?v=V4JA20otgGc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('az', 'አዝ ---', 'አዝ ---', 'az ---', 'Ethiopian Orthodox Tewahedo Mezmur - አዝ ---', 'አዝ ---
አስታርቁኝ ገና ሩቅ ሳለው
አስታርቂኝ አባቴ አይቶኝ
አስታርቂኝ ወደእኔ ሮጦ

VERSE 1
አስታርቂኝ አቅፎ ነው የሳመኝ
አስታርቂኝ ጠፍቶ የነበረው
አስታርቂኝ ተገኘልኝ አለ
አስታርቂኝ ሞቶ የነበረው

VERSE 2
አስታርቂኝ ደግሞ ሕያው ሆነ
949. ደስ ይበለን
አዝ ---፦፦-
አዝ ---፦

VERSE 3
አዝ ---፦
አዝ ---፦
አዝ ---፦', 'az ---
az ---
astarqugn gena ruq salew
astarqign abatie aytogn

VERSE 1
astarqign wedeenie roxo
astarqign aqfo new yesamegn
astarqign xefto yeneberew
astarqign tegegnelgn ale

VERSE 2
astarqign moto yeneberew
astarqign degmo ሕyaw hone
949. des ybelen
az ---፦፦-

VERSE 3
az ---፦
az ---፦
az ---፦
az ---፦', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=YJs3HiBCb-g', 'draft', 'pending', 'https://www.youtube.com/watch?v=YJs3HiBCb-g', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yezele-lem-bietie', 'የዘለዓለም ቤቴ', 'የዘለዓለም ቤቴ', 'yezeleዓlem bietie', 'Ethiopian Orthodox Tewahedo Mezmur - የዘለዓለም ቤቴ', 'የዘለዓለም ቤቴ ድንግል አመቤቴ
መንገድ ስፄድ ስንቄ ድንግል እመቤቴ
መጠነሽ ምግቤ ድንግል አመቤቴ
እአምአምላክ ስጠራሽ ድንግል አመቤቴ

VERSE 1
ይጠፋል ረሀቤ ድንግል አመቤቴ', 'yezeleዓlem bietie dngl amebietie
menged sፄd snqie dngl emebietie
mexenesh mgbie dngl amebietie
eamamlak sxerash dngl amebietie

VERSE 1
yxefal rehabie dngl amebietie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=bycXZPK3gBs', 'draft', 'pending', 'https://www.youtube.com/watch?v=bycXZPK3gBs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('maryam-anchi-nesh', 'ማርያም አንቺ ነሽ', 'ማርያም አንቺ ነሽ', 'maryam anchi nesh', 'Ethiopian Orthodox Tewahedo Mezmur - ማርያም አንቺ ነሽ', 'ኦ አመ ክርስቶስ ማርያም አንቺ ነሽ
ኦ የክርስቶስ እናት ማርያም አንቺ ነሽ
687. ማኅደረ መለኮት /2/
ማርያም አንቺ ነሽ/3/ የመዳን ተስፋቸው

VERSE 1
የአግዚአብሔር አብ ሙሽራ ወልድን የወለድሽ
የአግዚአብሔር መንፈስቅዱስ ንጽሕት አዳራሽ
የሰሎሞን አክሊል የታጠረች ተክል
የአሮን ካህን ልብስ/3/ የወርቅ ጸናጽል

VERSE 2
930.ወደ ምሥራቅ እዩ
ወደ ምሥራቅ አዩ ወደ ፀሐይ መውጫ
ድንግልን ክበቧት እንበል ሃሌ ሊያ
ማርያም አንቺ ነሽ', 'o ame krstos maryam anchi nesh
o yekrstos enat maryam anchi nesh
687. maኅdere melekot /2/
maryam anchi nesh/3/ yemedan tesfachew

VERSE 1
yeagziabሔr ab mushra weldn yeweledsh
yeagziabሔr menfesqdus ntsሕt adarash
yeselomon aklil yetaxerech tekl
yearon kahn lbs/3/ yewerq tsenatsl

VERSE 2
930.wede mሥraq eyu
wede mሥraq ayu wede ፀሐy mewca
dngln kbebuat enbel ሃlie liya
maryam anchi nesh', 'amharic', 'mezmur', 'ዘማሪ ዲያቆን ፍሬዘር ደሳለኝ', 'https://www.youtube.com/watch?v=VHOioMRg_Tc', 'draft', 'pending', 'https://www.youtube.com/watch?v=VHOioMRg_Tc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tesfayie-anchi-nesh-maryam', 'ተስፋዬ አንቺ ነሽ ማርያም', 'ተስፋዬ አንቺ ነሽ ማርያም', 'tesfayie anchi nesh maryam', 'Ethiopian Orthodox Tewahedo Mezmur - ተስፋዬ አንቺ ነሽ ማርያም', 'እስከ አለተ ሞቴ ማርያም
ላልጠላሽ ምያለሁ ማርያም
ከስርሽ ላልጠፋ ማርያም
ገጸ በረከቴ ማርያም

VERSE 1
የሕይወቴ ዋስትና ማርያም
የምእመናን ውበት ማርያም
ዘወድ አክሊላችው ማርያም
ድንግል አንቺ እኮ ነሽ ማርያም

VERSE 2
የመንገድ ስንቃቸው ማርያም
ምሥክር ነኝ ለአንቺ ማርያም
አንደ ነቢያቱ ማርያም
ስጦታ መሆንሽን ማርያም

VERSE 3
ለአዳም ልጆች ሁሉ ማርያም
ሞገስና ጸጋ ማርያም
በጌታ ፊት ያለሽ ማርያም
ከሰይጣን መሸሻ ማርያም

VERSE 4
ዋስ ጠበቃቸን ነሸ ማርያም
አንዴት ነበር ያኔ ማርያም
ጌታን ስተወልጂው ማርያም
የአረኞቹ ደስታ ማርያም

VERSE 5
የመላእክት ዝማሬ ማርያም
954.ለወዳሴሽ ልትጋ
ለውሳሴሽ ልትጋ ስምሽ ግርማ ያለው/2/
አመቤቴ ኸኸ አመቤቴ ስልሽ አውላለሁ

VERSE 6
ከልቤ አቀርባለሁ ምስጋና ለስምሽ
መለመኛዬ ነው ጽኑዕ ቃል ኪዳንሽ
በሰላምታ ድምጽሽ ያልጸና ማን አለ
ጽንሱ በማኅፀን በደስታ ዘለለ

VERSE 7
ማርና ወተት ነው የስምሽ ስያሜ', 'eske alete motie maryam
lalxelash myalehu maryam
kesrsh lalxefa maryam
getse bereketie maryam

VERSE 1
yeሕywetie wastna maryam
yememenan wbet maryam
zewed aklilachw maryam
dngl anchi eko nesh maryam

VERSE 2
yemenged snqachew maryam
mሥkr negn leanchi maryam
ande nebiyatu maryam
sxota mehonshn maryam

VERSE 3
leadam ljoch hulu maryam
mogesna tsega maryam
begieta fit yalesh maryam
keseyxan meshesha maryam

VERSE 4
was xebeqachen neshe maryam
andiet neber yanie maryam
gietan steweljiw maryam
yearegnochu desta maryam

VERSE 5
yemelaekt zmarie maryam
954.lewedasiesh ltga
lewsasiesh ltga smsh grma yalew/2/
amebietie ኸኸ amebietie slsh awlalehu

VERSE 6
kelbie aqerbalehu msgana lesmsh
melemegnayie new tsnuዕ qal kidansh
beselamta dmtssh yaltsena man ale
tsnsu bemaኅፀn bedesta zelele

VERSE 7
marna wetet new yesmsh syamie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Yrx3jHJ_nAc', 'draft', 'pending', 'https://www.youtube.com/watch?v=Yrx3jHJ_nAc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeteceneqachhu-yazenachhu-hulu', 'የተጨነቃችሁ ያዘናችሁ ሁሉ', 'የተጨነቃችሁ ያዘናችሁ ሁሉ', 'yeteceneqachhu yazenachhu hulu', 'Ethiopian Orthodox Tewahedo Mezmur - የተጨነቃችሁ ያዘናችሁ ሁሉ', 'ቅድስት ማርያምን አዘኝቷን ጥሩ
የጌታዬ እናትን አዛኝቷን ጥሩ
ነይ በሏት ትመጣለች /2/
ሐዘን ጭንቀት ትገላግላለች

VERSE 1
ደንግል ማርያም ፀምረ ጌድዬን
የታቦት ተራራ ደንግል ማርያም
የአባ ጊዮርጊስ ደንግል ማርያም
የአርጋኖን ሙሽራ ደንግል ማርያም

VERSE 2
በአዛኝነትሸ ደንግል ማርያም
ስንቅ የሆንሽኝ ደንግል ማርያም
ዛሬም ፈጥነሽ ስሚኝ ድንግል ማርያም
ድንግል አትርሺኝ ደንግል ማርያም

VERSE 3
ድንግል ማርያም ብሥራተ ገብርኤል
የሚካኤል ፋና ደንግል ማርያም
አክሊለ ጊዮርጊስ ደንግል ማርያም
የሱራፊል ፋና ደንግል ማርያም

VERSE 4
ነይ ፈጥነሽ ደረሺ ደንግል ማርያም
ተጨንቀናልና ደንግል ማርያም
ድንግል ማርያም ፍጥረታት በሙሉ
ያመሰግኑሻል ደንግል ማርያም

VERSE 5
የሕይወታችን በር ደንግል ማርያም
ድንግል ናት ይሉሻል ደንግል ማርያም
አኛ እንጠራሻለን ደንግል ማርያም
ሲጨንቀን ሲጠበን ደንግል ማርያም

VERSE 6
ለአንቺ ልጆች አድርጎ ደንግል ማርያም
ጌታ ስለሰጠን ደንግል ማርያም
958. ማርያም ኩኒ', 'qdst maryamn azegntuan xru
yegietayie enatn azagntuan xru
ney beluat tmexalech /2/
ሐzen cnqet tgelaglalech

VERSE 1
dengl maryam ፀmre giedyien
yetabot terara dengl maryam
yeaba giyorgis dengl maryam
yearganon mushra dengl maryam

VERSE 2
beazagnnetshe dengl maryam
snq yehonshgn dengl maryam
zariem fexnesh smign dngl maryam
dngl atrshign dengl maryam

VERSE 3
dngl maryam bሥrate gebriel
yemikaiel fana dengl maryam
aklile giyorgis dengl maryam
yesurafil fana dengl maryam

VERSE 4
ney fexnesh dereshi dengl maryam
tecenqenalna dengl maryam
dngl maryam fxretat bemulu
yamesegnushal dengl maryam

VERSE 5
yeሕywetachn ber dengl maryam
dngl nat ylushal dengl maryam
agna enxerashalen dengl maryam
sicenqen sixeben dengl maryam

VERSE 6
leanchi ljoch adrgo dengl maryam
gieta slesexen dengl maryam
958. maryam kuni', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=3hloSBvDnrs', 'draft', 'pending', 'https://www.youtube.com/watch?v=3hloSBvDnrs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('huletunm-yehonsh-enatna-dngl', 'ሁለቱንም የሆንሽ እናትና ድንግል', 'ሁለቱንም የሆንሽ እናትና ድንግል', 'huletunm yehonsh enatna dngl', 'Ethiopian Orthodox Tewahedo Mezmur - ሁለቱንም የሆንሽ እናትና ድንግል', 'ማኀደረ መለኮት ወላዲተ ቃል
ያለዘርአ ብእሲ በኅቱም ድንግልና
አምላክን የወለድሽ ሐመልማለ ሲና', 'maኀdere melekot weladite qal
yalezera besi beኅtum dnglna
amlakn yeweledsh ሐmelmale sina', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=IgvT6N2VvLc', 'draft', 'pending', 'https://www.youtube.com/watch?v=IgvT6N2VvLc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('maryam-tbelxalech-kehulu-fxret', 'ማርያም ትበልጣለች ከሁሉ ፍጥረት', 'ማርያም ትበልጣለች ከሁሉ ፍጥረት', 'maryam tbelxalech kehulu fxret', 'Ethiopian Orthodox Tewahedo Mezmur - ማርያም ትበልጣለች ከሁሉ ፍጥረት', 'ስለያዘች አሳተ መለኮት/4/
በመኑ በመኑ በአምሳለ መኑ ናስተማስልኪ /2/
አምቤቴ የአምላክ እናት አዛኝቷ
ኦ ድንግል ምልዕተ ውዳሴ/2/

VERSE 1
970. ነይ ነይ
ነይ ነይ ማርያም ወላዲተ አምላክ
የጻድቃን አመቤት
የመላእክት እህት/''/2/

VERSE 2
ሁላችሁ አመኗት ከልብ አማላጅ ናትና
በአውነት እናመስግናት እናወድሳት
አማላጅ ኪዳነምሕረት/2/
971 በለዑል መጠጊያ

VERSE 3
በልዑል መጠጊያ የሚኖር በልዑል መጠጊያ/2/
ይከልላል ከክፉ/2/
አንደበቱን ከኃጢአት ከልክሎ አምላኩን ካሰበ
ካልተመጻደቀ በሥራው ራሱን ካልካበ

VERSE 4
ይከለላል ከክፉ/ሪ/
ጨርቄን ማቄን ሳይል ራሱን ለአምላኩ
ከሰጠ
በዓለም ምደራዊ ሀብት ተታሎ አምላኩን

VERSE 5
ካልሸጠ
ይከለላል ከክፉ /ሪ2/
አስከመጨረሻው ለመኖር በአምነቱ ከጸና
ካላፈገፈገ ከአምላኩ ሲገጥመው ፈተና

VERSE 6
ይከለላል ከክፉ/ሪ/
972 ወትቀውም ንግሥት
ውትቀውም ንግሥት /2/ በየማንከ /2
ኸኸ በአልበስ ወርቅ /3/ ዑጽፍት በአልባሰ ወርቅ', 'sleyazech asate melekot/4/
bemenu bemenu beamsale menu nastemaslki /2/
ambietie yeamlak enat azagntua
o dngl mlዕte wdasie/2/

VERSE 1
970. ney ney
ney ney maryam weladite amlak
yetsadqan amebiet
yemelaekt eht/''/2/

VERSE 2
hulachhu amenuat kelb amalaj natna
beawnet enamesgnat enawedsat
amalaj kidanemሕret/2/
971 beleዑl mexegiya

VERSE 3
belዑl mexegiya yeminor belዑl mexegiya/2/
ykellal kekfu/2/
andebetun keኃxiat kelklo amlakun kasebe
kaltemetsadeqe beሥraw rasun kalkabe

VERSE 4
ykelelal kekfu/ri/
cerqien maqien sayl rasun leamlaku
kesexe
beዓlem mderawi habt tetalo amlakun

VERSE 5
kalshexe
ykelelal kekfu /ri2/
askemecereshaw lemenor beamnetu ketsena
kalafegefege keamlaku sigexmew fetena

VERSE 6
ykelelal kekfu/ri/
972 wetqewm ngሥt
wtqewm ngሥt /2/ beyemanke /2
ኸኸ bealbes werq /3/ ዑtsft bealbase werq

VERSE 7
/2/
/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=qpOtBPqo5hQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=qpOtBPqo5hQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lehulum-selam-bietel-m', 'ለሁሉም ሰላም ቤተልሔም', 'ለሁሉም ሰላም ቤተልሔም', 'lehulum selam bietelሔm', 'Ethiopian Orthodox Tewahedo Mezmur - ለሁሉም ሰላም ቤተልሔም', 'ጌታ ተወለደ ቤተልሔም
ለሁሉም ሰላም ቤተልሔም', 'gieta tewelede bietelሔm
lehulum selam bietelሔm', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=JtKKw83YcR0', 'draft', 'pending', 'https://www.youtube.com/watch?v=JtKKw83YcR0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('melake-selamne-liqe-melaekt-raiel-2', 'መልአከ ሰላምነ ሊቀ መላእክት ዑራኤል /2/', 'መልአከ ሰላምነ ሊቀ መላእክት ዑራኤል /2/', 'melake selamne liqe melaekt ዑraiel /2/', 'Ethiopian Orthodox Tewahedo Mezmur - መልአከ ሰላምነ ሊቀ መላእክት ዑራኤል /2/', 'ሰአል ወጸሊ በእንቲአነ አዕርግ ጸሉተነ
ቅድመ መንበሩ ለመድኃኔዓለም
ትርጉም ፡:- የሰላም መልአክ ቅዱስ ዑራኤል ስለ እኛ
ለምንልን ጸሎታችንነም በመድኃኔዓለም ፊት አሳርግልን

VERSE 1
24. ዑራኤል ወሩፋኤል
ዑራኤል ወሩፋኤል /4/
መልአከ ሰላምነ ሊቀ መላእክት ዑራኤል /2/
ሰአል ወጸሊ በእንቲአነ አዕርግ ጸሎተነ

VERSE 2
ቅድመ መንበሩ ለመድኃኔዓለም
ትርጉም ፡:- የሰላም መልአክ ቅዱስ ዑራኤል ስለ እኛ
ለምንልን ጸሎታችንንም በመድኃኔዓለምፊት አሳርግልን
1044ኃያል ኃያል

VERSE 3
ኃያል ኃያል /2/
ሰዳዴ ሳጥናኤል /2/
ኃያል ገባሬ ኃይል
ባሕራን ያዳነው

VERSE 4
ተላፊኖስን የረዳው /2/
መልአኩ ሚካኤል ነው
የሞቱን ደብዳቤ የለወጠው', 'seal wetseli beentiane aዕrg tselutene
qdme menberu lemedኃnieዓlem
trgum ፡:- yeselam melak qdus ዑraiel sle egna
lemnln tselotachnnem bemedኃnieዓlem fit asargln

VERSE 1
24. ዑraiel werufaiel
ዑraiel werufaiel /4/
melake selamne liqe melaekt ዑraiel /2/
seal wetseli beentiane aዕrg tselotene

VERSE 2
qdme menberu lemedኃnieዓlem
trgum ፡:- yeselam melak qdus ዑraiel sle egna
lemnln tselotachnnm bemedኃnieዓlemfit asargln
1044ኃyal ኃyal

VERSE 3
ኃyal ኃyal /2/
sedadie saxnaiel /2/
ኃyal gebarie ኃyl
baሕran yadanew

VERSE 4
telafinosn yeredaw /2/
melaku mikaiel new
yemotun debdabie yelewexew', 'amharic', 'mezmur', 'ሊቀ መዘምራን  ይልማ ኃይሉ', 'https://www.youtube.com/watch?v=dgSmtNJpsMA', 'draft', 'pending', 'https://www.youtube.com/watch?v=dgSmtNJpsMA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('le-xan-3-aydelem-letsadqan-2', 'ለኃጥአን /3/ አይደለም ለጻድቃን /2/', 'ለኃጥአን /3/ አይደለም ለጻድቃን /2/', 'leኃxan /3/ aydelem letsadqan /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ለኃጥአን /3/ አይደለም ለጻድቃን /2/', 'ለኃጥአን /3/ አይደለም ለጻድቃን /2/', 'leኃxan /3/ aydelem letsadqan /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=vWBEmVllahk', 'draft', 'pending', 'https://www.youtube.com/watch?v=vWBEmVllahk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('o-mikaiel', 'ኦ ሚካኤል', 'ኦ ሚካኤል', 'o mikaiel', 'Ethiopian Orthodox Tewahedo Mezmur - ኦ ሚካኤል', 'ኦ ሚካኤል /2/ ሊቀ መላእክት
በኃጢአት እንዳንወድቅ እንዳንሞት ፈጥነህ
ተራዳን አጽናን በእምነት /2/', 'o mikaiel /2/ liqe melaekt
beኃxiat endanwedq endanmot fexneh
teradan atsnan beemnet /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=uEen43R92sY', 'draft', 'pending', 'https://www.youtube.com/watch?v=uEen43R92sY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keamlak-telkeh', 'ከአምላክ ተልከህ »', 'ከአምላክ ተልከህ »', 'keamlak telkeh »', 'Ethiopian Orthodox Tewahedo Mezmur - ከአምላክ ተልከህ »', 'ህዝበ አስራኤልን »
ነጻ ያወጣህ »
በአዲስ ኪዳንም ድንቅ ሥራ አለህ
በተአምራትህ ትፈውሳለህ /2/

VERSE 1
ባለ መድኃኒት ሚካኤል
ያቃተውን »
ፈዋሽ ጠበልህ »
ሆኖኛል ኃይል »

VERSE 2
አንደ መጻጉ ድኅነት አገኘን
ከአምላክ ተልከህ »', 'hzbe asraieln »
netsa yawexah »
beadis kidanm dnq ሥra aleh
beteamrath tfewsaleh /2/

VERSE 1
bale medኃnit mikaiel
yaqatewn »
fewash xebelh »
honognal ኃyl »

VERSE 2
ande metsagu dኅnet agegnen
keamlak telkeh »', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=_EstK3FZoMU', 'draft', 'pending', 'https://www.youtube.com/watch?v=_EstK3FZoMU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdus-gieta-amanuiel-cher-amlak', 'ቅዱስ ጌታ አማኑኤል ቸር አምላክ', 'ቅዱስ ጌታ አማኑኤል ቸር አምላክ', 'qdus gieta amanuiel cher amlak', 'Ethiopian Orthodox Tewahedo Mezmur - ቅዱስ ጌታ አማኑኤል ቸር አምላክ', 'ቅዱስ ጌታ አማኑኤል ቸር አምላክ', 'qdus gieta amanuiel cher amlak', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=Re8We9EqZ6k', 'draft', 'pending', 'https://www.youtube.com/watch?v=Re8We9EqZ6k', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-maryam-2', 'ድንግል ማርያም /2/', 'ድንግል ማርያም /2/', 'dngl maryam /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል ማርያም /2/', 'ታማልዳለች ከልጂ ከመድኃኔዓለም /2/
ታማልዳለች ከልጂ /2/ ከመድኃኔዓለም
ታማልዳለች/ ልጄ ሆይ ይቅር በል እያለች
አባቶቻችን ነቢያት ወሐዋርያት/''/2/

VERSE 1
ድንግል ማርያም /2/', 'tamaldalech kelji kemedኃnieዓlem /2/
tamaldalech kelji /2/ kemedኃnieዓlem
tamaldalech/ ljie hoy yqr bel eyalech
abatochachn nebiyat weሐwaryat/''/2/

VERSE 1
dngl maryam /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=fUdn8wMItC4', 'draft', 'pending', 'https://www.youtube.com/watch?v=fUdn8wMItC4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yamaldalu-beewnet-2-yamaldalu', 'ያማልዳሉ በእውነት /2/ ያማልዳሉ', 'ያማልዳሉ በእውነት /2/ ያማልዳሉ', 'yamaldalu beewnet /2/ yamaldalu', 'Ethiopian Orthodox Tewahedo Mezmur - ያማልዳሉ በእውነት /2/ ያማልዳሉ', 'ያማልዳሉ በእውነት /2/ ያማልዳሉ', 'yamaldalu beewnet /2/ yamaldalu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=VqyMzv4l_Pw', 'draft', 'pending', 'https://www.youtube.com/watch?v=VqyMzv4l_Pw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('yamaldalu-beewnet-2-yamaldalu', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('rawitochachewm-hulu', 'ሠራዊቶቻቸውም ሁሉ', 'ሠራዊቶቻቸውም ሁሉ', 'ሠrawitochachewm hulu', 'Ethiopian Orthodox Tewahedo Mezmur - ሠራዊቶቻቸውም ሁሉ', 'ሰባቱ ሊቃናት መላዕክት አፍኒን ራጉኤልና
ሳቁኤል
ሠራዊቶቻቸውም ሁሉ
ሠራዊቶቻቸውም ሁሉ

VERSE 1
ሠራዊቶቻቸውም ሁሉ', 'sebatu liqanat melaዕkt afnin raguielna
saquiel
ሠrawitochachewm hulu
ሠrawitochachewm hulu

VERSE 1
ሠrawitochachewm hulu', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=KJUV52pbxTM', 'draft', 'pending', 'https://www.youtube.com/watch?v=KJUV52pbxTM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ke-let-yefeleqe-w-xextenal', 'ከዓለት የፈለቀ ውኃ ጠጥተናል', 'ከዓለት የፈለቀ ውኃ ጠጥተናል', 'keዓlet yefeleqe wኃ xextenal', 'Ethiopian Orthodox Tewahedo Mezmur - ከዓለት የፈለቀ ውኃ ጠጥተናል', 'ከዓለት የፈለቀ ውኃ ጠጥተናል', 'keዓlet yefeleqe wኃ xextenal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=bPZIUSON67s', 'draft', 'pending', 'https://www.youtube.com/watch?v=bPZIUSON67s', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('semayawi-mena-amlak-megbonal', 'ሰማያዊ መና አምላክ መግቦናል', 'ሰማያዊ መና አምላክ መግቦናል', 'semayawi mena amlak megbonal', 'Ethiopian Orthodox Tewahedo Mezmur - ሰማያዊ መና አምላክ መግቦናል', 'ሰማያዊ መና አምላክ መግቦናል', 'semayawi mena amlak megbonal', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=6_2EAXfE7jQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=6_2EAXfE7jQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('br-nn-agegnen-bedngl-maryam', 'ብርሃንን አገኘን በድንግል ማርያም', 'ብርሃንን አገኘን በድንግል ማርያም', 'brሃnn agegnen bedngl maryam', 'Ethiopian Orthodox Tewahedo Mezmur - ብርሃንን አገኘን በድንግል ማርያም', 'ብርሃንን አገኘን በድንግል ማርያም', 'brሃnn agegnen bedngl maryam', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=mjR6KeHMlNg', 'draft', 'pending', 'https://www.youtube.com/watch?v=mjR6KeHMlNg', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beegziab-r-feqad-teweledech-zarie', 'በእግዚአብሔር ፈቃድ ተወለደች ዛሬ', 'በእግዚአብሔር ፈቃድ ተወለደች ዛሬ', 'beegziabሔr feqad teweledech zarie', 'Ethiopian Orthodox Tewahedo Mezmur - በእግዚአብሔር ፈቃድ ተወለደች ዛሬ', 'የኢያቄም ስአእለቱ የሐና አምነት
ለምፒልን ለእኛ ኪዳነምሕረት
821.ኩሉ ዘፈቀደ
ኩሉ ዘፈቀደ ገብረ አግዚአብሔር /2/

VERSE 1
በሰማይኒ ወበምድኒ ወበባሕርኒነ/ሪ2/
ወበኩሉ ቀላያት /4/
822.ይትባረክ እግዚአብሔር
ይትባረክ እግዚአብሔር አምላከ አበዊነ /2/

VERSE 2
በእግዚአብሔር ፈቃድ ተወለደች ዛሬ', 'yeiyaqiem saeletu yeሐna amnet
lempiln leegna kidanemሕret
821.kulu zefeqede
kulu zefeqede gebre agziabሔr /2/

VERSE 1
besemayni webemdni webebaሕrnine/ri2/
webekulu qelayat /4/
822.ytbarek egziabሔr
ytbarek egziabሔr amlake abewine /2/

VERSE 2
beegziabሔr feqad teweledech zarie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=h0bfYcsP1wo', 'draft', 'pending', 'https://www.youtube.com/watch?v=h0bfYcsP1wo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('maryam-goyeki-am-getse-herods-2', 'ማርያም', 'ማርያም', 'maryam goyeki am getse herods /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ማርያም', 'ለአርእዩ /4 ተአምረ ግፍኪ /2/
ማርያም ሸሸች ከሄሮድስ ፊት /2/
ለማሳየት /4 የግፍ ተአምርሽን /2/
80. አስመ ውአቱ

VERSE 1
አስመ ውአቱ ክብሮሙ ለቅዱሳን መድኃኔዓለም
/2/ አሠርገዋ ለምድር አሰርገዋ ለጽጌፃ /2 /
ማርያም ተአይን ባህቲታ ውስተ አድባረ ግብጽ
ከመ ኦፍ /2/

VERSE 2
ማርያም /2/
ንኢ /6/ አመ አምላክ ንኢ ማርያም /2/
ማርያም /3/ አብርሒ ጽዮን/2/
186.. ዘካርያስ ርእየ

VERSE 3
ዘካርያስ ርእየ ተቅዋመ ማኅቶት ኩለንተፃ
ወርቅ በየማና ወበጸጋማ አዕጽቀ ዘይት/2/
ነቢያት ይትፌሥሑ ሐዋርያት ይትሐሰዮ
በውስቴታ ወዳዊት ይዜምር በውስተ

VERSE 4
ማኅፈዲሀ /2/
ማርያም
ያደረው የአግዚአብሔር ልጁ ነው/ሪ2/
ማርያም ቅድስት/2/

VERSE 5
194. ዘይሃይድ ዓይነ
ማርያም የተወለደውን ሰማያዊ
ማርያም ትጠብቅሽ አጆቿን ዘርግታ/2/
343 በክብር ዙፋኑ

VERSE 6
በክብር ዙፋኑ መርጦ ያስቀመጠሽ
ለእኛ ለኃጢአተኞች ተስፋችን አንቺው ነሽ
በፍጹም ንጽሕና ቤተመቅደስ ያደግሽ
የአማኑኤል የጌታዬ የፈጣሪ አናት በምን አንመስልሽ/2/

VERSE 7
ቃና ዘገሊላ ሠርግ ደግሰው
ማርያም
3855. ይትባረክ
ይትባረክ እንደአብርፃም/2/

VERSE 8
አኸ ዘለዓለም/4/ይትባረክ እንደአብርፃም/2/
ሙሽሪት ሙሽራው አንደአብርፃም
እንኳን ደስ አላችሁ
ተከበረ ዛሬ

VERSE 9
ቅዱስ ጋብቻችሁ
ማርያም /2/ ድንግል ማርያም /2/
አማልጅን ከልጅሽ /2/ ከመድኃኔዓለም /2/
ኃጢአተኞች ከኃጢአት እንፈውስ

VERSE 10
በማርያም ድንግል /2/ ክብርን አገኘን
በማርያም ድንግል /2/ አክሊል አገኘን
398.አዳም ንባብኪ
አዳም ንባብኪ ርግብ ሠናይት/2/

VERSE 11
በልባስ ወርቅ/2/ ንኢ/2/ ኪዳነምሕረት /2/
ማርያምሰ እንተ በምድር ታንሶሱ
ማርያም ዐረገች /2/ ወደ ገነት
የሰማይ መላእክት በደስታ አያጀቧት

VERSE 12
ዐረገች ወደ ገነት/2/
408. ጴጥሮስ
ጴጥሮስ ወጳውሎስ አጠኑ ሥጋሃፃ/2/
ለማርያም/2/ በማዕጠንተ ወርቅ

VERSE 13
409. አእረግዋ
አአረግዋ መላእክት ውስተ ሰማያት/2/
አአረግዋ መላእክት ውስተ ሰማያት/4/
አሳረጓት መላአክት ወደ ሰማያት/2/

VERSE 14
አሳረጓት መላአክት ወደ ሰማያት/4/
410. እኸ ማርያምሰ
አኸ ማርያምሰ እኸ እንተ በምድር/2/
አኸ በሰማያት ታንሶሶ በሰማያት/2/

VERSE 15
411. ኦ ምርአግ
ኦ ምርአግ እምድር ውስተ ሰማይ /2/
ወብኪ ተሐደሰ ጊዮርጊስ ሰማዕት
412. ኦ ርኅርቲተ

VERSE 16
ኦ ርኅርጊቲተ ሕሊና አፍቅሮተ ሰብእ ልማዳ
ለአለ ጌሰሙ/4/ ትመስል/2/ አንግዳ
ኪዳነምህረት እመቤት
ኪዳነምሕረት አመቤት

VERSE 17
የዓለም ሁሉ መድኃኒት
ማርያምም እንዲህ እያለች /2/
ማርያም ባርኪኝ አመቤቴ አሰግድ ለኪ፡፡
አንዳልንገላታ ጠብቂኝ በኃጢአት ዓለም ጎዳና

VERSE 18
ደግሞም እንድመገብ ሰማያዊ መና
ማርያም የአዳም ጤና እሰግድ ለኪ፡፡
ተሸጩ ስኖር ልጅሽ በኃጢአት ከተማ ዓለም
የሚያወጣኝ ጠፍቶ የእናት ልጅ ወንድም

VERSE 19
ወጣኹኝ በልጀሽ ደም አሰግድ ለኪ፡፡
ከቅድስት ቦታ ሀገር ከቤተልሔም ተነሥተሸ
ምድረ ግብፅ አውራጃ ፈጥነሽ ስትደርሺ
ማርያም መከራን አየሽ አስግድ ለኪ

VERSE 20
ያ ምቀኛ ሰይጣን ንጉሥ ተንኮል የተመላው
ልጅሽን ሊገለው ደሙንም ለማፍሰስ
ተሯራሯራጠ በአግር በፈረስ አስግድ ለኪ፡፡
ያንቺ መንገላታት ሁልጊዜ ያሳዝነኛል ሲወራ

VERSE 21
በምድረ ግብፅ ሁሉ ያየሽው መከራ
ማርያም ነፍሴን አደራ አሰግድ ለኪ፡፡ /2/
593.አመቤታችን ላንቺ
አመቤታችን ላንቺ ስላምታ ይገባሻል/2/

VERSE 22
ከሴቶች ሁሉ /3/ ተመርጠሻል
ሐርና ወርቁን እያስማማች ስትፈትል /2/
ተዘጋጀላት/3/ የመመረጥ ዕድል
አመቤታችን --------፦

VERSE 23
አያረጓጓት የሰማይ መላእክት /2/
ማርያም አመቤቴ -------“፦-
595.የዓለም መድኃኒት የተወለደብሽ
የዓለም መድኃኒት የተወለደብሽ

VERSE 24
አንቺ ቤተልሔም የተቀደስሽ ነሽ
የአማልክት አምላክ ንጉሠ ነገሥት
ኃያላን በሙሉ የሚሰግዱለት
በጨርቅ ተጠቅልሎ ተኛ በበረት

VERSE 25
የዓለም መድኃኒት ---------”፦-፦--
አዋቂዎች ሁሉ በቅን አሳባቸው
ወደአንቺ ተጓዙ ኮከብ ሲመራቸው/ሪ2/
የዓለም መድኃኒት ------------

VERSE 26
ለተከታይ ትውልድ ምሣሌ ለመሆን
ሰግደው ገበሩለት ወርቅ ዕጣን ከርቤን /2/
የዓለም መድኃኒት ---------”፦----
የሚያድለው ጌታ አውቀት ለሕፃናት

VERSE 27
የሚመሰገን ነው በአፈ መላእክት
ከእንስሳት ጋራ አደረ በበረት
ማርያም መግደላዊት እየገሠገሠች
በሌሊት ተነሥታ ወደ አምላኳ ሄደች

VERSE 28
አይሁድ አንገላተው የሰቀሉት ጌታን
ተነሥቶ አግኝታ ተመላች በደስታ
ማርያም መግደላዊት ››
ምንኛ ታደለች ››

VERSE 29
ማርያም ኢያቄም ወለዳት
680.አልብኪ ነውር ወኢምንትኒ በላዕሌኪ /2
ጻኢ እም ሊባኖስ አኅትየ መርዓት 4/
ማርያም አመብዙኃን /4

VERSE 30
688.ኢያቄም ወሐና /4
ድንግል ማርያም ወልደዋቷልና
ይድረሳቸው ክብርና ምስጋና
689. ኦ ድንግል አምሣል ወትንቢት /2 የሐዋርያት

VERSE 31
ሞገሶሙ ለሐዋርያት /4
ድንግል ሆይ የነቢያት ትንቢት የሐዋርያት
ሞገሣቸው አንቺ ነሽ
690.የሐና ልጅ ነሽ የኢያቄም በረክት /2/

VERSE 32
ማርያም/2/ ቤዛዊት ዓለም/4/
ሚካኤል መልአክ ሊቀመላእአክት/2
ዘአወረድከ/2/ መና ከደመና/4/
ገብርኤል መልአክ አብሣሬ ትስብእት /2/

VERSE 33
ዘአብሠራ/2/ ለማርያም ንጽሕተት/4/
ሩፋኤል መልአክ ሊቀመላእክት/ሪ2/
ዘአብርፃ/2/ አይኑ ለጦቢት/4/
ዑራኤል መልክአክ ለእዝራ ነቢይ /2/

VERSE 34
ዘአስተዮ/2/ ጽዋዓ ልቡና/4/
ሰሉሞን ይቤላ/4/
ርግብየ ሠናይትየ ሰሎሞን ይቤላ/4/
ገብረመንፈስቅዱስ /4/

VERSE 35
ሐዋርያ /2/ ዘአስክንድርያ/4/
ተክለሃይማኖት /4/
ሐዋርያ/2/ ዘኢትዮጵያ /4/
ብርሃናተ ዓለም ጴጥሮስ ወጳውሉስ/2/

VERSE 36
ማርያምሰ ተሀቱ እምትካት ውስተ ከርሱ/2
ለአዳም ከመባሕርይ ጸዓዳ
አስመ በእንቲአሃ ወበእንተ አዝማዲፃ
ተሰቀልኩ ዲበ ዕጽ ይቤ መድኃኔዓለም /2

VERSE 37
ትርጉም
ማርያምማ ታበራለች ከጥንት ጀምሮ በአዳም ባሕርይ
ውስጥ እንደ ነጭ ዕንቄ በአዳም ባሕርይ እርሷን ደስ
ይበላት ብሎ ስለወገኖቿ ተሰቀልኩ አለ በእንጨት

VERSE 38
መስቀል ላይ መድኃኒዓለም
894.ሥዛሬም አለችኝ መማጸኛ
ማርያም ብዬ መቼ እወድቃለሁ
የምጽናናበት ስምሽ ነውና

VERSE 39
ድንግል ሆይ ላቅርብ ለአንቺ ምስጋና
ጨለማ ውጦኝ በጠላት ሀገር
ለዘመናትም ስጨነቅ ስኖር
ዲያብሎስ ማርኮ ሲሠቃየኝ

VERSE 40
የዓለምን መድኅን ወለድሽልኝ
ከአባቶቼ ርስት ከሀገር ወጥቼ
በአሕዛብ ሀገር ስኖር ሽሸቼ
ደረሰሽ አጽናንተሸ አከበርሽኝ

VERSE 41
ብቸኝነቴን አስረሳሽኝ
ድንኳኑ ሞልቶ ሰው ታድሞ
አስተናባሪው በጭንቀት ቆሞ
ምን አቀርባለሁ ብዬ ስቸገር

VERSE 42
ምልጃሽ ደርሶልኝ ዳንኩኝ ከማፈር
ያሠብኩት ሐሳብ ደመና ሆኖ
ቢበተንብኝ እንደ ጉም ተንኖ
ይሆናል ያልኩት ሳይሆን ቢቀር

VERSE 43
በአመአምላክ አጌ መቼም አላፍር
አናት አባቴ ባያስታውሱኝ
ማርያም ድንግል መመኪያቸው የደናግል አርሷም
አኮ የምልጃ ቤት ናት የሚያሰጨንቀውን

VERSE 44
የምታቃልል
ለፍጥረት ሁሉ ትማልዳለች በመላእክት ክንፎችም
ትጋረዳለች እርሷ ትበልጣለች ከኪሩቤል ደግሞ
ትበልጣለች ከሱራፌል

VERSE 45
914.አሰይ ተከበረች
አሰይ ተከበረች በዛሬዋ ዕለት ድንግል ማርያም
የአምላክ እናት /2/
የምሥራች አልል በሉ የአዳም ልጆች ሁሉ

VERSE 46
የምሥራች አልል በሉ ክርስቲያኖች ሁሉ /2
ማርያም ንጽሕት ደንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊ ለነ ኀበ ክርስቶስ ወልድኪ ይሥረይ

VERSE 47
ማርያም ቅድስት የሕይወት ብርፃን
ማርያምም እንዲህ እያለች/2/
ማርያም ትመጣለች በደመና በአየር
ንዒ ስንል በሰዓታት

VERSE 48
ልታባርከን ትመጣለች በእአውነት/2/
ማርያም ድረሽልኝ አመቤቴ
የምሥራቅ ደጃፍ ነሽ አመቤቴ /2/
የሁላችን ደስታ

VERSE 49
አሙ ለፀሐየ ጽድቅ አመቤቴ
የሁሉ ጠበቃ አመቤቴ
ድንግል የድል አክሊል አመቤቴ
ድንግል የጽድቅ ሥራ

VERSE 50
ድንግል መሰላል ነሽ አመቤቴ
የተዋሕዶ ተስፋ አመቤቴ
934. ለማርያም
ለማርያም/2/

VERSE 51
እንዘምራለን ለዘለዓለም/ሪ2/
የተዘጋች ደጅ ለዘለዓለም
ሕዝቅኤል ብሏል
ንጽሕት ናት በእውነት

VERSE 52
በፍጹም ድንግል
ማርያም /2/ ድንግል ማርያም /2/
ርኅርቲተ ኅሊና /4/ ማርያም/4/
942.ጀበመኑ በአምሣለ መት

VERSE 53
በመኑ በአምሳለ መኑ ናስተማስለኪ/2
አመቤቴ የአኛ አማላጅ አዛኝቷ ኦ ድንግል
ምልዕተ ውዳሴ /2
43.ማርያም ተዐቢ

VERSE 54
ማርያም ተዐቢ አምኩሉ ፍጥረት /2/
ኢያውአያ እሳተ መለኮት /4/
ማርያም ፊደል የሁሉ መማሪያ /2/
በንጽሕና በንጽሕና ተጽፋለችና /2/

VERSE 55
947.ሰላም ለኪ
ሠላም ለኪ /2/ ለኖኅ ሐመሩ
ሠላም ለኪ ለአሮን በትሩ
ሠላም ለኪ ለቅዱስ ዳዊት መሰንቆ መዝሙሩ

VERSE 56
ሠላም ለኪ ለጌዴዎን ፀምሩ
ማርያም አመቤቴ
አለምንሻለሁ
ማርያም እንወድሻለን/2/

VERSE 57
ስለወለድሽ የሕይወት ምግብን /2/
ማርያም አንወድሻለን
ማርያም ትጠብቀን አጆቿን ዘርግታ/2/
956. በሐዘኔ በጭንቀቴ

VERSE 58
በሐዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
አመአምላክ አደራ ድንግል አመቤቴ /2/
ለዓለም ተዘርግቶ እጄ ባዶ ሆናል
የራሴ ላይ አክሊል ተሸቀንጥሮ ወድቋል

VERSE 59
ከኤልዛቤል ሸሸቼ መጣሁኝ ወደአንቺ
የጎሰቆልኩትን አኔን ተመልከቺ
የአግሬ መሰናልክ ለዓለም ደስታ ነው
ተስፋ ቢስ መሆኔ ለጠላቴ ድል ነው

VERSE 60
የደስታ መመንጫ የኤሳቤጥ ዘመድ
አንዳልሠናከል ምሪኝ በመንገድ
ምድር ትለኛለች ተስፋ ቢስ ብቸኛ
ሳለቅስ ሳነባ አይታናለችና

VERSE 61
ከቤተ መቅደሱ ለአኔ ዘመድ አለኝ
በሐዘኔ ሰዓት አይዞህ የምትለኝ
ከአመድ የወደቀ ትንሽ ገንዘብ አለሽ
ልብሽ ራርቶልኝ ፈልጊኝ አጥብቀሽ

VERSE 62
አምነቴ እንዳይደክም እንዳልጠፋ ልጅሽ
አድጌአለሁና ከደጀ ሰላምሽ
957. ማርያም ማርያም በሉ
ማርያም /2/ በሉ

VERSE 63
ማርያም ኩኒ ለሕይወትየ ጸወኖ/2/
አስመ ተማኅጸንኩ አንሰ ተማኅጸንኩ/2/
በኪዳንኪ /2/ ተማኅጸንኩ
ማርያም ሁፒ ለሕይወቴ አምባ በምልጃሽ

VERSE 64
አማጸንሻለሁ ተማጽፔሻለሁ//2/
ማርያም በስምሽ በቃል ኪዳንሽ
አምጌ ቆሜአለሁኝ ኃጥኡ ባርያሽ
ንስሓ ሣልገባ አንዳልሞት አደራሽ

VERSE 65
ለዚህ ዕድል አብቂኝ ከልጅሽ አማልጀሽ
በቃል ኪዳንሽ አምጌ ስጠራሽ
ድንግል አትለይኝ በረድኤትሽ
ፍቅርሽን በልቤ ጣዕምሽ በአንደበቴ

VERSE 66
እንዲያድር አደርጊ ፅዩን አመቤቴ
959. እመቤታችን
አመቤታችን ማርያም ሀገራቸንን ጠብቂልን
በምልጃሽ /2/

VERSE 67
ከመናፍቃን ኪከሀድያን ከጠላት ሰይጣን ሠውረሽ
አንድትጠብቂን በምልጃሸ/2/
960. ሰላም ለኪ ማርያም አመአምላክ/2/
ማርያም ተዐቢ እምኩሉ ፍጥረት /2/

VERSE 68
ኢያውአያ እሳተ መለኮተ/4/
ማርያም ስንልሽ ደረሽልን ፈጥነሽ
ማርያም ድንግል በረድኤት ነይ
1925. እንተ በምድር

VERSE 69
አንተ በምድር ሥረዊፃ ወበሰማይ አዕፁቂዛ /2/
ሐረገ ወይን /2/ ድንግል ሐረገ ወይን /2/
ትርጉም :፦- አመቤታችን ሥራ በምድር
ቅርንጫፏ በሰማይ የሆነ የወይን ሐረግ ናት

VERSE 70
1926 ማርያም ንጽሕት
ማርያም ንጽሕት ድንግል ማእምንት ወላዲተ
አምላክ ሰአሊተ ምሕረት ለዉሉደ ሰብእ /2/
ሰአሊ ለነ ኀበ ክርስቶስ ወልድኪ ይሥረይ

VERSE 71
ማርያም ንጽሕት ድንግል ታማኝ አምላክን
የወለድሽ የምሕረት አማላጅ ለሰው ልጆች /2/
አማልጅን ከልጅሽ ከክርስቶስ ይቅር እንዲለን
ቅድስት ሆይ ለምኝልን /2/

VERSE 72
1027የኪዳን ጽላት
የኪዳን ጽላት የተሠወረ መና ያለብሽ ደብተራ
ድንካን አንቺ ነሽ /2/
ይኸውም መና የተባለው /2/ በድንግል ማርያም

VERSE 73
ያደረው የእግዚአብሔር ልጁ ነው /2/
ማርያም ተዐቢ እም ኩሉ ፍጥረት /2/
ኢያውአያ እሳተ መለኮት /4
ትርጉም ፡:-

VERSE 74
ማርያም ትጠብቀን አጆቿን ዘር
ድንግል ትጠብቀን አጆቿን ዘርግታ. /2/
ማርያም ማርያም ድንግል ማርያም /2/
ርኅርኅተ ኅሊና /ቴ ማርያም /2/

VERSE 75
1935 ማርያም ፊደል
ማርያም ፊደል የሁሉ መማሪያ /2/
በንጽሕና በንጽሕና ተጽፋለችና /2/
1936, ማኅደረ መለኮት

VERSE 76
ማርያም አመ ብዜጋኃን /4
ትርጉም :- የመለኮት ማደሪያ የሆንሽ አመቤታችን
ማርያም የብዙኃን አናት ነሽ
1937በመኑ

VERSE 77
በመኑ በአምሳለ መኑ ናስተማስለኪ /2/
አመቤቴ የእኔ አማላጅ አዝኝቷ ኦ ድንግል
ምልዕተ ውዳሴ
ትርጉም :-ማን በተመሰለው ምሳሌ አመስልሻለሁ

VERSE 78
አመቤቴ የእኔ አማላጅ አዛኝቷ ምስጋናን የተመላሽ
ነሽ፡፡
1938በምን በምን እንመስላት
በምን በምን እንመስላት ድንግል ማርያምን /2/

VERSE 79
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /2/
የሙሴ ጽላት ነሽ የምሕረት ቃል ኪዳን
የያዕቆብ መሠላል የአብርሃም ድንካን
የብርፃዛን መውጫ የኖኅ ድንቅ መርከብ

VERSE 80
የመላአክት አህት የሩኅሩኃን ርግብ /2/
ማርያም /2/ቤዛዊት ዓለም /2/
ሚካኤል መልአክ ሊቀ መላእክት /2/
ዘአውረደ /2/ መና ከደመና''2/

VERSE 81
ገብርኤል መልአክ አብሣሬ ትስብዕት
ዘአብሠራ /2/ ለማርያም ንጽሕት /2/
ሩፋኤል መልአክ ሊቀ መላእክት /2/
ዘአብርፃ /2/ ዓይኑ ለጦቢት /2/

VERSE 82
ሰሉሞን ይቤላ /2/ ርግብየ ሠናይትየ
ሰሎሞን ይቤላ
ርግብየ ሰናይትየ ሰሎሞን ይቤላ
ዑራኤል መልአክ ለዕዝራ ነቢይ /2/

VERSE 83
ዘአስተዮ /2/ ጽዋዐ ልቡና
ማርያም
ወዳሴ ማርያም አጮኸለሁ
ደንግል አናቴን አጣራለሁ

VERSE 84
አንደ አባ ኤፍሬም ነይ ባርኪኝ
ማርያም /2/ ድንግል ማርያም /2/
ርኅርኅተ ኅሊና /4/ ማርያም/4/
ማርያም ተዐቢ አምኩሉ ፍጥረት /2/

VERSE 85
ኢያውዓያ እሳተ መለኮት /4/
ማርያም አንዱ ልጂ ነው
ድምጽህን ሰማና በብሩህ ደመና/2ጋ/
የቡሄው ብርሃን ለአኛ አበራልን

VERSE 86
ማርያም ሰላም/2/
ሰላም ለላዕየኪ አዳም/4/
ናዝሬት ሠላም ዘአሕጉር
አም ደብረታቦር ሰላም/2/

VERSE 87
ሰላም ለላዕየከ አዳም/4/
1092. አሐደ ሌከ
አሐደ ለከ ወአሐደ ለሙሴ/2/
ወአሐደ ለኤልያስ ንግበር ማኅደረ/4/

VERSE 88
አንዱንም ለአንተ አንዱንም ለሙሴ/2/
አንዱንም ለኤልያስ እንሥራ ቤትን/4/
1093.አማን በአማን
ማርያም አንዱ ልጂነው

VERSE 89
ማርያም ተዐይን ባህቲታ ውስተ አድባረ ግብጽ ከመ
ዖፍ/2/
ማርያም/''/2/
ዘአስተጻመረ/2/ አግዚአብሔር?/2/

VERSE 90
ወእመአኮ
ወአመአኮ ከመወሬዛ ኃየል/2/
ትዌድሶ መርዓት እንዘ ትብል/ቄ
አንሶሰወ

VERSE 91
አንሶሰወ ከመሰብ አሙነ ኮነ/2/
ማርያም መንክር ልደትኪ ወእጹብ ግብርኪ,/2/
ጾርኪ/3/ ዓምደ አሳት መድኃኔዓለም/2/
የሰኔ ቅዱስ ሚካኤል ወረብ

VERSE 92
ባሕራንኒ
ባሕራንኒ ባሕራን ይቤ ዘነገደ ባሕር/2/
ርኢኩዎ/2/ ለሚካኤል ወስዕንኩ ጠይፃ/2/
መልአከ ሰላምነ

VERSE 93
መልአከ ሰላምነ/4
ሊቀ መላአክት ሚካኤል ሰአል ወጸሊ በአእንቲአነ/2/
አመ ይሰቅልዎ
አመ ይሰቅልዎ አይሁድ ለእግዚእ/2/

VERSE 94
ሚካኤል አርመመ ወገብርኤል ተደመ/2/
ወሪዶ
ወሪዶ አመስቀሉ''/2/
አመስቀሉ አብርሃ ለኩሉ አመስቀሉ ለኩሉ አብርፃ/2/

VERSE 95
ማርያምሰ አንተ በምድር ታንሶሱ/2/
ፅርገታ
ዕርገታ ውስተ ሰማያት ወበአታ ውስተ ገነት/2/
ማርያም (3) ወላዲተ አምላክ (2)

VERSE 96
895.ይዌድስዋ መላእክት
ይዌድስዋ መላክት /2/ ለማርያም /2/
ውስተ ውሳጤ መንጠላዕት ወይብልዋ
በሐኪ ማርያም ሐዳስዩ በዕዋ (2)

VERSE 97
አመቤታችን በቀኝ ቆማለች
አመቤታችን በቀኝ ቆማለች
የብርሃን ልብሷን ተጎናፅፋለች
ሰአሊነ ምሕረት መዝገበ ፀሎት

VERSE 98
አቁራሪተ መዓት የጌታዬ እናት /2/
ማርያም/3/ ሐመልማለ ወርቅ/2/
የወርቅ ልማላሜ/4/
ማርያም /3 የወርቅ ልማላሜ/2', 'leareyu /4 teamre gfki /2/
maryam sheshech keherods fit /2/
lemasayet /4 yegf teamrshn /2/
80. asme watu

VERSE 1
asme watu kbromu leqdusan medኃnieዓlem
/2/ aሠrgewa lemdr asergewa letsgieፃ /2 /
maryam teayn bahtita wste adbare gbts
keme of /2/

VERSE 2
maryam /2/
ni /6/ ame amlak ni maryam /2/
maryam /3/ abrሒ tsyon/2/
186.. zekaryas reye

VERSE 3
zekaryas reye teqwame maኅtot kulenteፃ
werq beyemana webetsegama aዕtsqe zeyt/2/
nebiyat ytfieሥሑ ሐwaryat ytሐseyo
bewstieta wedawit yziemr bewste

VERSE 4
maኅfediha /2/
maryam
yaderew yeagziabሔr lju new/ri2/
maryam qdst/2/

VERSE 5
194. zeyሃyd ዓyne
maryam yeteweledewn semayawi
maryam txebqsh ajoቿn zergta/2/
343 bekbr zufanu

VERSE 6
bekbr zufanu merxo yasqemexesh
leegna leኃxiategnoch tesfachn anchiw nesh
beftsum ntsሕna bietemeqdes yadegsh
yeamanuiel yegietayie yefexari anat bemn anmeslsh/2/

VERSE 7
qana zegelila ሠrg degsew
maryam
3855. ytbarek
ytbarek endeabrፃm/2/

VERSE 8
aኸ zeleዓlem/4/ytbarek endeabrፃm/2/
mushrit mushraw andeabrፃm
enkuan des alachhu
tekebere zarie

VERSE 9
qdus gabchachhu
maryam /2/ dngl maryam /2/
amaljn keljsh /2/ kemedኃnieዓlem /2/
ኃxiategnoch keኃxiat enfews

VERSE 10
bemaryam dngl /2/ kbrn agegnen
bemaryam dngl /2/ aklil agegnen
398.adam nbabki
adam nbabki rgb ሠnayt/2/

VERSE 11
belbas werq/2/ ni/2/ kidanemሕret /2/
maryamse ente bemdr tansosu
maryam ዐregech /2/ wede genet
yesemay melaekt bedesta ayajebuat

VERSE 12
ዐregech wede genet/2/
408. phiexros
phiexros wephawlos axenu ሥgaሃፃ/2/
lemaryam/2/ bemaዕxente werq

VERSE 13
409. aeregwa
aaregwa melaekt wste semayat/2/
aaregwa melaekt wste semayat/4/
asareguat melaakt wede semayat/2/

VERSE 14
asareguat melaakt wede semayat/4/
410. eኸ maryamse
aኸ maryamse eኸ ente bemdr/2/
aኸ besemayat tansoso besemayat/2/

VERSE 15
411. o mrag
o mrag emdr wste semay /2/
webki teሐdese giyorgis semaዕt
412. o rኅrtite

VERSE 16
o rኅrgitite ሕlina afqrote sebe lmada
leale giesemu/4/ tmesl/2/ angda
kidanemhret emebiet
kidanemሕret amebiet

VERSE 17
yeዓlem hulu medኃnit
maryamm endih eyalech /2/
maryam barkign amebietie asegd leki፡፡
andalngelata xebqign beኃxiat ዓlem godana

VERSE 18
degmom endmegeb semayawi mena
maryam yeadam xiena esegd leki፡፡
teshecu snor ljsh beኃxiat ketema ዓlem
yemiyawexagn xefto yeenat lj wendm

VERSE 19
wexaኹgn beljesh dem asegd leki፡፡
keqdst bota hager kebietelሔm teneሥteshe
mdre gbፅ awraja fexnesh stdershi
maryam mekeran ayesh asgd leki

VERSE 20
ya mqegna seyxan nguሥ tenkol yetemelaw
ljshn ligelew demunm lemafses
teruararuaraxe beagr beferes asgd leki፡፡
yanchi mengelatat hulgizie yasaznegnal siwera

VERSE 21
bemdre gbፅ hulu yayeshw mekera
maryam nefsien adera asegd leki፡፡ /2/
593.amebietachn lanchi
amebietachn lanchi slamta ygebashal/2/

VERSE 22
kesietoch hulu /3/ temerxeshal
ሐrna werqun eyasmamach stfetl /2/
tezegajelat/3/ yememerex ዕdl
amebietachn --------፦

VERSE 23
ayareguaguat yesemay melaekt /2/
maryam amebietie -------“፦-
595.yeዓlem medኃnit yeteweledebsh
yeዓlem medኃnit yeteweledebsh

VERSE 24
anchi bietelሔm yeteqedessh nesh
yeamalkt amlak nguሠ negeሥt
ኃyalan bemulu yemisegdulet
becerq texeqllo tegna beberet

VERSE 25
yeዓlem medኃnit ---------”፦-፦--
awaqiwoch hulu beqn asabachew
wedeanchi teguazu kokeb simerachew/ri2/
yeዓlem medኃnit ------------

VERSE 26
leteketay twld mሣlie lemehon
segdew geberulet werq ዕxan kerbien /2/
yeዓlem medኃnit ---------”፦----
yemiyadlew gieta awqet leሕፃnat

VERSE 27
yemimesegen new beafe melaekt
keenssat gara adere beberet
maryam megdelawit eyegeሠgeሠch
belielit teneሥta wede amlakua hedech

VERSE 28
ayhud angelatew yeseqelut gietan
teneሥto aggnta temelach bedesta
maryam megdelawit ››
mngna tadelech ››

VERSE 29
maryam iyaqiem weledat
680.albki newr weimntni belaዕlieki /2
tsai em libanos aኅtye merዓt 4/
maryam amebzuኃn /4

VERSE 30
688.iyaqiem weሐna /4
dngl maryam weldewatualna
ydresachew kbrna msgana
689. o dngl amሣl wetnbit /2 yeሐwaryat

VERSE 31
mogesomu leሐwaryat /4
dngl hoy yenebiyat tnbit yeሐwaryat
mogeሣchew anchi nesh
690.yeሐna lj nesh yeiyaqiem berekt /2/

VERSE 32
maryam/2/ biezawit ዓlem/4/
mikaiel melak liqemelaeakt/2
zeaweredke/2/ mena kedemena/4/
gebriel melak abሣrie tsbet /2/

VERSE 33
zeabሠra/2/ lemaryam ntsሕtet/4/
rufaiel melak liqemelaekt/ri2/
zeabrፃ/2/ aynu lexobit/4/
ዑraiel melkak leezra nebiy /2/

VERSE 34
zeasteyo/2/ tswaዓ lbuna/4/
selumon ybiela/4/
rgbye ሠnaytye selomon ybiela/4/
gebremenfesqdus /4/

VERSE 35
ሐwarya /2/ zeaskndrya/4/
tekleሃymanot /4/
ሐwarya/2/ zeityophya /4/
brሃnate ዓlem phiexros wephawlus/2/

VERSE 36
maryamse tehatu emtkat wste kersu/2
leadam kemebaሕry tseዓda
asme beentiaሃ webeente azmadiፃ
teseqelku dibe ዕts ybie medኃnieዓlem /2

VERSE 37
trgum
maryamma taberalech kexnt jemro beadam baሕry
wsx ende nec ዕnqie beadam baሕry ersuan des
ybelat blo slewegenoቿ teseqelku ale beencet

VERSE 38
mesqel lay medኃniዓlem
894.ሥzariem alechgn mematsegna
maryam byie mechie ewedqalehu
yemtsnanabet smsh newna

VERSE 39
dngl hoy laqrb leanchi msgana
celema wxogn bexelat hager
lezemenatm sceneq snor
diyablos marko siሠqayegn

VERSE 40
yeዓlemn medኅn weledshlgn
keabatochie rst kehager wexchie
beaሕzab hager snor shshechie
deresesh atsnanteshe akebershgn

VERSE 41
bchegnnetien asresashgn
dnkuanu molto sew tadmo
astenabariw becnqet qomo
mn aqerbalehu byie scheger

VERSE 42
mljash dersolgn dankugn kemafer
yaሠbkut ሐsab demena hono
bibetenbgn ende gum tenno
yhonal yalkut sayhon biqer

VERSE 43
beameamlak agie mechiem alafr
anat abatie bayastawsugn
maryam dngl memekiyachew yedenagl arsuam
ako yemlja biet nat yemiyasecenqewn

VERSE 44
yemtaqall
lefxret hulu tmaldalech bemelaekt knfochm
tgaredalech ersua tbelxalech kekirubiel degmo
tbelxalech kesurafiel

VERSE 45
914.asey tekeberech
asey tekeberech bezariewa ዕlet dngl maryam
yeamlak enat /2/
yemሥrach all belu yeadam ljoch hulu

VERSE 46
yemሥrach all belu krstiyanoch hulu /2
maryam ntsሕt dengl maemnt
weladite amlak sealite mሕret lewlude sebe
seali lene ኀbe krstos weldki yሥrey

VERSE 47
maryam qdst yeሕywet brፃn
maryamm endih eyalech/2/
maryam tmexalech bedemena beayer
nዒ snl beseዓtat

VERSE 48
ltabarken tmexalech beeawnet/2/
maryam dreshlgn amebietie
yemሥraq dejaf nesh amebietie /2/
yehulachn desta

VERSE 49
amu leፀሐye tsdq amebietie
yehulu xebeqa amebietie
dngl yedl aklil amebietie
dngl yetsdq ሥra

VERSE 50
dngl meselal nesh amebietie
yetewaሕdo tesfa amebietie
934. lemaryam
lemaryam/2/

VERSE 51
enzemralen lezeleዓlem/ri2/
yetezegach dej lezeleዓlem
ሕzqiel blual
ntsሕt nat beewnet

VERSE 52
beftsum dngl
maryam /2/ dngl maryam /2/
rኅrtite ኅlina /4/ maryam/4/
942.jebemenu beamሣle met

VERSE 53
bemenu beamsale menu nastemasleki/2
amebietie yeagna amalaj azagntua o dngl
mlዕte wdasie /2
43.maryam teዐbi

VERSE 54
maryam teዐbi amkulu fxret /2/
iyawaya esate melekot /4/
maryam fidel yehulu memariya /2/
bentsሕna bentsሕna tetsfalechna /2/

VERSE 55
947.selam leki
ሠlam leki /2/ lenoኅ ሐmeru
ሠlam leki learon betru
ሠlam leki leqdus dawit mesenqo mezmuru

VERSE 56
ሠlam leki legiediewon ፀmru
maryam amebietie
alemnshalehu
maryam enwedshalen/2/

VERSE 57
sleweledsh yeሕywet mgbn /2/
maryam anwedshalen
maryam txebqen ajoቿn zergta/2/
956. beሐzenie becnqetie

VERSE 58
beሐzenie becnqetie metsnagnayie nesh redatie
ameamlak adera dngl amebietie /2/
leዓlem tezergto ejie bado honal
yerasie lay aklil tesheqenxro wedqual

VERSE 59
keielzabiel sheshechie mexahugn wedeanchi
yegoseqolkutn anien temelkechi
yeagrie mesenalk leዓlem desta new
tesfa bis mehonie lexelatie dl new

VERSE 60
yedesta memenca yeiesabiex zemed
andalሠnakel mrign bemenged
mdr tlegnalech tesfa bis bchegna
saleqs saneba aytanalechna

VERSE 61
kebiete meqdesu leanie zemed alegn
beሐzenie seዓt ayzoh yemtlegn
keamed yewedeqe tnsh genzeb alesh
lbsh rartolgn felgign axbqesh

VERSE 62
amnetie endaydekm endalxefa ljsh
adgiealehuna kedeje selamsh
957. maryam maryam belu
maryam /2/ belu

VERSE 63
maryam kuni leሕywetye tseweno/2/
asme temaኅtsenku anse temaኅtsenku/2/
bekidanki /2/ temaኅtsenku
maryam hupi leሕywetie amba bemljash

VERSE 64
amatsenshalehu tematspieshalehu//2/
maryam besmsh beqal kidansh
amgie qomiealehugn ኃxu baryash
nsሓ ሣlgeba andalmot aderash

VERSE 65
lezih ዕdl abqign keljsh amaljesh
beqal kidansh amgie sxerash
dngl atleygn beredietsh
fqrshn belbie xaዕmsh beandebetie

VERSE 66
endiyadr adergi ፅyun amebietie
959. emebietachn
amebietachn maryam hagerachenn xebqiln
bemljash /2/

VERSE 67
kemenafqan kikehadyan kexelat seyxan ሠwresh
andtxebqin bemljashe/2/
960. selam leki maryam ameamlak/2/
maryam teዐbi emkulu fxret /2/

VERSE 68
iyawaya esate melekote/4/
maryam snlsh dereshln fexnesh
maryam dngl berediet ney
1925. ente bemdr

VERSE 69
ante bemdr ሥrewiፃ webesemay aዕፁqiza /2/
ሐrege weyn /2/ dngl ሐrege weyn /2/
trgum :፦- amebietachn ሥra bemdr
qrncafua besemay yehone yeweyn ሐreg nat

VERSE 70
1926 maryam ntsሕt
maryam ntsሕt dngl maemnt weladite
amlak sealite mሕret lewulude sebe /2/
seali lene ኀbe krstos weldki yሥrey

VERSE 71
maryam ntsሕt dngl tamagn amlakn
yeweledsh yemሕret amalaj lesew ljoch /2/
amaljn keljsh kekrstos yqr endilen
qdst hoy lemgnln /2/

VERSE 72
1027yekidan tslat
yekidan tslat yeteሠwere mena yalebsh debtera
dnkan anchi nesh /2/
yኸwm mena yetebalew /2/ bedngl maryam

VERSE 73
yaderew yeegziabሔr lju new /2/
maryam teዐbi em kulu fxret /2/
iyawaya esate melekot /4
trgum ፡:-

VERSE 74
maryam txebqen ajoቿn zer
dngl txebqen ajoቿn zergta. /2/
maryam maryam dngl maryam /2/
rኅrኅte ኅlina /tie maryam /2/

VERSE 75
1935 maryam fidel
maryam fidel yehulu memariya /2/
bentsሕna bentsሕna tetsfalechna /2/
1936, maኅdere melekot

VERSE 76
maryam ame bziegaኃn /4
trgum :- yemelekot maderiya yehonsh amebietachn
maryam yebzuኃn anat nesh
1937bemenu

VERSE 77
bemenu beamsale menu nastemasleki /2/
amebietie yeenie amalaj azgntua o dngl
mlዕte wdasie
trgum :-man betemeselew msalie ameslshalehu

VERSE 78
amebietie yeenie amalaj azagntua msganan yetemelash
nesh፡፡
1938bemn bemn enmeslat
bemn bemn enmeslat dngl maryamn /2/

VERSE 79
msalie yelatm yelatm kbruan yemimexn /2/
yemusie tslat nesh yemሕret qal kidan
yeyaዕqob meሠlal yeabrሃm dnkan
yebrፃzan mewca yenoኅ dnq merkeb

VERSE 80
yemelaakt aht yeruኅruኃn rgb /2/
maryam /2/biezawit ዓlem /2/
mikaiel melak liqe melaekt /2/
zeawrede /2/ mena kedemena''2/

VERSE 81
gebriel melak abሣrie tsbዕt
zeabሠra /2/ lemaryam ntsሕt /2/
rufaiel melak liqe melaekt /2/
zeabrፃ /2/ ዓynu lexobit /2/

VERSE 82
selumon ybiela /2/ rgbye ሠnaytye
selomon ybiela
rgbye senaytye selomon ybiela
ዑraiel melak leዕzra nebiy /2/

VERSE 83
zeasteyo /2/ tswaዐ lbuna
maryam
wedasie maryam acoኸlehu
dengl anatien axaralehu

VERSE 84
ande aba iefriem ney barkign
maryam /2/ dngl maryam /2/
rኅrኅte ኅlina /4/ maryam/4/
maryam teዐbi amkulu fxret /2/

VERSE 85
iyawዓya esate melekot /4/
maryam andu lji new
dmtshn semana bebruh demena/2ga/
yebuhew brሃn leagna aberaln

VERSE 86
maryam selam/2/
selam lelaዕyeki adam/4/
nazriet ሠlam zeaሕgur
am debretabor selam/2/

VERSE 87
selam lelaዕyeke adam/4/
1092. aሐde lieke
aሐde leke weaሐde lemusie/2/
weaሐde leielyas ngber maኅdere/4/

VERSE 88
andunm leante andunm lemusie/2/
andunm leielyas enሥra bietn/4/
1093.aman beaman
maryam andu ljinew

VERSE 89
maryam teዐyn bahtita wste adbare gbts keme
ዖf/2/
maryam/''/2/
zeastetsamere/2/ agziabሔr?/2/

VERSE 90
weemeako
weameako kemewerieza ኃyel/2/
twiedso merዓt enze tbl/qie
ansosewe

VERSE 91
ansosewe kemeseb amune kone/2/
maryam menkr ldetki weetsub gbrki,/2/
tsorki/3/ ዓmde asat medኃnieዓlem/2/
yesenie qdus mikaiel wereb

VERSE 92
baሕranni
baሕranni baሕran ybie zenegede baሕr/2/
rikuwo/2/ lemikaiel wesዕnku xeyፃ/2/
melake selamne

VERSE 93
melake selamne/4
liqe melaakt mikaiel seal wetseli beaentiane/2/
ame yseqlwo
ame yseqlwo ayhud leegzie/2/

VERSE 94
mikaiel armeme wegebriel tedeme/2/
werido
werido amesqelu''/2/
amesqelu abrሃ lekulu amesqelu lekulu abrፃ/2/

VERSE 95
maryamse ante bemdr tansosu/2/
ፅrgeta
ዕrgeta wste semayat webeata wste genet/2/
maryam (3) weladite amlak (2)

VERSE 96
895.ywiedswa melaekt
ywiedswa melakt /2/ lemaryam /2/
wste wsaxie menxelaዕt weyblwa
beሐki maryam ሐdasyu beዕwa (2)

VERSE 97
amebietachn beqegn qomalech
amebietachn beqegn qomalech
yebrሃn lbsuan tegonaፅfalech
sealine mሕret mezgebe ፀlot

VERSE 98
aqurarite meዓt yegietayie enat /2/
maryam/3/ ሐmelmale werq/2/
yewerq lmalamie/4/
maryam /3 yewerq lmalamie/2', 'amharic', 'mezmur', 'ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ', 'https://www.youtube.com/watch?v=QlyjmvT4VzY', 'draft', 'pending', 'https://www.youtube.com/watch?v=QlyjmvT4VzY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ydres-msgana-qdst', 'ይድረስ ምስጋና ቅድስት', 'ይድረስ ምስጋና ቅድስት', 'ydres msgana qdst', 'Ethiopian Orthodox Tewahedo Mezmur - ይድረስ ምስጋና ቅድስት', 'አደይ የብርሃን ጮራ በማርቆስ በራ
ይድረስ ምስጋና ቅድስት', 'adey yebrሃn cora bemarqos bera
ydres msgana qdst', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=5tCsY3TUrkE', 'draft', 'pending', 'https://www.youtube.com/watch?v=5tCsY3TUrkE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('ydres-msgana-qdst', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qalun-semaw-admxw-bla-eyie-qdst', 'ቃሉን ሰማው አድምጥው ብላ እዬ ቅድስት', 'ቃሉን ሰማው አድምጥው ብላ እዬ ቅድስት', 'qalun semaw admxw bla eyie qdst', 'Ethiopian Orthodox Tewahedo Mezmur - ቃሉን ሰማው አድምጥው ብላ እዬ ቅድስት', 'አናቴ
አዬ ቅድስት እናቴ አዬ ቅ. እናቴ/2/
ይሸታል የእጣኑ ጢስ ሲታጠን ከመቅደሱ
በመላእክት ዜማ ካህናት ሲቀድሱ ሲታጠን

VERSE 1
ከመቅደሱ/2/
ቃሉን ሰማው አድምጥው ብላ እዬ ቅድስት
አናቴ', 'anatie
ayie qdst enatie ayie q. enatie/2/
yshetal yeexanu xis sitaxen kemeqdesu
bemelaekt ziema kahnat siqedsu sitaxen

VERSE 1
kemeqdesu/2/
qalun semaw admxw bla eyie qdst
anatie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=5tSjQ8Ip5n4', 'draft', 'pending', 'https://www.youtube.com/watch?v=5tSjQ8Ip5n4', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kebrew-yqoyun-kebrw', 'ከብረው ይቆዩን ከብርው', 'ከብረው ይቆዩን ከብርው', 'kebrew yqoyun kebrw', 'Ethiopian Orthodox Tewahedo Mezmur - ከብረው ይቆዩን ከብርው', 'ከዓመት ዐውደ ዓመት ደርሰው
በአምነት በምግባር ጸንተው
ነጽተው ንስሓ ገብተው
ለሥጋ ወደሙ በቅተው

VERSE 1
ከብረው ይቆዩን ከብርው
ከዓመት ዐውደ ዓመት ደርሰው
በእምነት በምግባር ጸንተው
ነጽተው ንስሓ ገብተው

VERSE 2
ለሥጋ ወደሙ በቅተው', 'keዓmet ዐwde ዓmet dersew
beamnet bemgbar tsentew
netstew nsሓ gebtew
leሥga wedemu beqtew

VERSE 1
kebrew yqoyun kebrw
keዓmet ዐwde ዓmet dersew
beemnet bemgbar tsentew
netstew nsሓ gebtew

VERSE 2
leሥga wedemu beqtew', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=gztZfKx4_DU', 'draft', 'pending', 'https://www.youtube.com/watch?v=gztZfKx4_DU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('hulet-lbsoch-yalut-kemabzat-lbsn', 'ሁለት ልብሶች ያሉት ከማብዛት ልብስን', 'ሁለት ልብሶች ያሉት ከማብዛት ልብስን', 'hulet lbsoch yalut kemabzat lbsn', 'Ethiopian Orthodox Tewahedo Mezmur - ሁለት ልብሶች ያሉት ከማብዛት ልብስን', 'ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንጻን አደራህ
በክፉ አንዳንጠፋ እኛ ባሮችህ
ሁለት ልብሶች ያሉት ከማብዛት ልብስን

VERSE 1
ለሌለው ያድለው ሁለተኛውን
ከበደላችንም አንጻን አደራህ', 'lelielew yadlew huletegnawn
kebedelachnm antsan aderah
bekfu andanxefa egna barochh
hulet lbsoch yalut kemabzat lbsn

VERSE 1
lelielew yadlew huletegnawn
kebedelachnm antsan aderah', 'amharic', 'mezmur', 'ዘማሪ ዲያቆን እንዳለ ደረጀ', 'https://www.youtube.com/watch?v=tbQ1CR2OVTU', 'draft', 'pending', 'https://www.youtube.com/watch?v=tbQ1CR2OVTU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abatm-ale-ljien-smut', 'አባትም አለ ልጄን ስሙት', 'አባትም አለ ልጄን ስሙት', 'abatm ale ljien smut', 'Ethiopian Orthodox Tewahedo Mezmur - አባትም አለ ልጄን ስሙት', 'አባትም አለ ልጄን ስሙት', 'abatm ale ljien smut', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=YJ8gGOjilyw', 'draft', 'pending', 'https://www.youtube.com/watch?v=YJ8gGOjilyw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('smua-sixera-yedngl-maryam', 'ስሟ ሲጠራ የድንግል ማርያም', 'ስሟ ሲጠራ የድንግል ማርያም', 'smua sixera yedngl maryam', 'Ethiopian Orthodox Tewahedo Mezmur - ስሟ ሲጠራ የድንግል ማርያም', 'ስሟ ሲጠራ የድንግል ማርያም', 'smua sixera yedngl maryam', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=bcGXn7iOsfU', 'draft', 'pending', 'https://www.youtube.com/watch?v=bcGXn7iOsfU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abatochachn-yaweresun', 'አባቶቻችን ያወረሱን', 'አባቶቻችን ያወረሱን', 'abatochachn yaweresun', 'Ethiopian Orthodox Tewahedo Mezmur - አባቶቻችን ያወረሱን', 'የቡሄን ትርጉም የሣወቁን
እንድንጠብቀው ለእኛ የሠጡን
ይሄ ነውና ያስረከቡን
አባቶቻችን ያወረሱን

VERSE 1
የቡሄን ትርጉም የሣወቁን
እንድንጠብቀው ለኛ የሠጡን
ይሄ ነውና ያስረከቡን', 'yebuhen trgum yeሣwequn
endnxebqew leegna yeሠxun
yhe newna yasrekebun
abatochachn yaweresun

VERSE 1
yebuhen trgum yeሣwequn
endnxebqew legna yeሠxun
yhe newna yasrekebun', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=b_YwCF-7OcM', 'draft', 'pending', 'https://www.youtube.com/watch?v=b_YwCF-7OcM', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tabor-armoniem-br-n-tayebachew', 'ታቦር አርሞንኤም ብርሃን ታየባቸው', 'ታቦር አርሞንኤም ብርሃን ታየባቸው', 'tabor armoniem brሃn tayebachew', 'Ethiopian Orthodox Tewahedo Mezmur - ታቦር አርሞንኤም ብርሃን ታየባቸው', 'ለቅዱስ ተራራ ስምህ ደስ አላቸው
ሰላም ሰላም የታቦር ተራራ
ብርሃነ መለኮት በአንቺ ላይ አበራ
ታቦር አርሞንኤም ብርሃን ታየባቸው

VERSE 1
ለቅዱስ ተራራ ስምህ ደስ አላቸው
ሰላም ሰላም የታቦር ተራራ
ብርሃነ መለኮት በአንቺ ላይ አበራ', 'leqdus terara smh des alachew
selam selam yetabor terara
brሃne melekot beanchi lay abera
tabor armoniem brሃn tayebachew

VERSE 1
leqdus terara smh des alachew
selam selam yetabor terara
brሃne melekot beanchi lay abera', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=1m_T8k-U1C8', 'draft', 'pending', 'https://www.youtube.com/watch?v=1m_T8k-U1C8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('tabor-armoniem-br-n-tayebachew', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kezendo-asxalat-bierutawitn-qdus-giyorgis', 'ከዘንዶ አስጣላት ቤሩታዊትን ቅዱስ ጊዮርጊስ', 'ከዘንዶ አስጣላት ቤሩታዊትን ቅዱስ ጊዮርጊስ', 'kezendo asxalat bierutawitn qdus giyorgis', 'Ethiopian Orthodox Tewahedo Mezmur - ከዘንዶ አስጣላት ቤሩታዊትን ቅዱስ ጊዮርጊስ', '1089. ጊዮርጊስ ብርፃኑን
ጊዮርጊስ ብርሃኑን አበራ/2/
ዱድያኖስ አፈረ ከጣዖቱ ጋራ
ጊዮርጊስ ብርሃኑን አበራ /2/

VERSE 1
ለዲያብሎስ ያልሠገደ ጀግናው ጊዮርጊስ
ደግሞ ባይን ታየ ክብሩ ሲወደስ
ከሞት አፍ ያወጣት ቤሩታይትን
በሰማእቱ ገድል ድል ሆነ ሠይጣን

VERSE 2
ቅዱሱ ስማዕት ጊዮርጊስ አባታችን
አሳየ ሥልጣኑን ከሞት እንደሚያድን
መድኃኒት ክርስቶስ የገለጠው ብርሃን
አኛም እንድንድን ከዘመኑ አውሬ

VERSE 3
አስቲ አንግለጽለት ክብሩን በዝማሬ
ተዋሕዶ አበራ ደግሞ እንደገና
ደራጎን ድልሆኖ ሞቶ ቀርቷልና
ለአሸናፊ ጌታ ለእግዚአብሔር ልዑል

VERSE 4
ምስጋና እናቅርብ አንበል አልል
ጊዮርጊስ አበራ ብፃን/2/
ሠው በላውም አውሬ ሞተ ደራጎን/2/
ጊዮርጊስ አበራ ብርፃን

VERSE 5
1090ቤተክርስቲያን ባሕረ ጥበባት
ቤተክርስቲያን ባሕረ ጥበባት /2/
አትመረመርም /2/ እጅግ ጥልቅ ናት''/2/
በሥጋዊ ጥበብ ለማወቅ ቢቃጣ /2/

VERSE 6
የእምነት መነጽሩን ይዞ ስላልመጣ /2/
ሰው ሁሉ በክህደት/2/ ፈጣሪውን አጣ(/2/
አንመሰክራለለን ፈጣሪያችን አለ
አንመሰክራለን አማኑኤል አለ/2/

VERSE 7
አንድአንዱ ቢክደው /2/ አየተታለለ /2/', '1089. giyorgis brፃnun
giyorgis brሃnun abera/2/
dudyanos afere kexaዖtu gara
giyorgis brሃnun abera /2/

VERSE 1
lediyablos yalሠgede jegnaw giyorgis
degmo bayn taye kbru siwedes
kemot af yawexat bierutaytn
besemaetu gedl dl hone ሠyxan

VERSE 2
qdusu smaዕt giyorgis abatachn
asaye ሥlxanun kemot endemiyadn
medኃnit krstos yegelexew brሃn
agnam endndn kezemenu awrie

VERSE 3
asti angletslet kbrun bezmarie
tewaሕdo abera degmo endegena
deragon dlhono moto qertualna
leashenafi gieta leegziabሔr lዑl

VERSE 4
msgana enaqrb anbel all
giyorgis abera bፃn/2/
ሠw belawm awrie mote deragon/2/
giyorgis abera brፃn

VERSE 5
1090bietekrstiyan baሕre xbebat
bietekrstiyan baሕre xbebat /2/
atmeremerm /2/ ejg xlq nat''/2/
beሥgawi xbeb lemaweq biqaxa /2/

VERSE 6
yeemnet menetsrun yzo slalmexa /2/
sew hulu bekhdet/2/ fexariwn axa(/2/
anmesekralelen fexariyachn ale
anmesekralen amanuiel ale/2/

VERSE 7
andandu bikdew /2/ ayetetalele /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=aXPakMkgnmo', 'draft', 'pending', 'https://www.youtube.com/watch?v=aXPakMkgnmo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yedebre-tabor', 'የደብረ ታቦር', 'የደብረ ታቦር', 'yedebre tabor', 'Ethiopian Orthodox Tewahedo Mezmur - የደብረ ታቦር', '1091.ደብረ መቅደሱ
ደብረ መቅደሱ ለአግዚአብሔር
የደብረ ታቦር ወረብ
ወሪዶ', '1091.debre meqdesu
debre meqdesu leagziabሔr
yedebre tabor wereb
werido', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=hVv-Z3jYlmc', 'draft', 'pending', 'https://www.youtube.com/watch?v=hVv-Z3jYlmc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('andun-leante-andunm-lemusie-andun', 'አንዱን ለአንተ አንዱንም ለሙሴ', 'አንዱን ለአንተ አንዱንም ለሙሴ', 'andun leante andunm lemusie andun', 'Ethiopian Orthodox Tewahedo Mezmur - አንዱን ለአንተ አንዱንም ለሙሴ', 'ለኤልያስ
አንዱን ለአንተ አንዱንም ለሙሴ አንዱን
ለኤልያስ
ተለወጠ ገጹ ከመ ፅጌሬዳ

VERSE 1
አንዱን ለአንተ አንዱንም ለሙሴ', 'leielyas
andun leante andunm lemusie andun
leielyas
telewexe getsu keme ፅgierieda

VERSE 1
andun leante andunm lemusie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=4onkAHq3Xn8', 'draft', 'pending', 'https://www.youtube.com/watch?v=4onkAHq3Xn8', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yo-ns-kbur-nebiye-l-l-besie-selam', 'ዮሐንስ ክቡር ነቢየ ልዑል ብእሴ ሰላም', 'ዮሐንስ ክቡር ነቢየ ልዑል ብእሴ ሰላም', 'yoሐns kbur nebiye lዑl besie selam', 'Ethiopian Orthodox Tewahedo Mezmur - ዮሐንስ ክቡር ነቢየ ልዑል ብእሴ ሰላም', 'ዘንብረቱ ገዳም/2/
ወረብ
ወአንተኒ ሕፃን ነቢየ ልዑል/2/
አርኮ ለመርዓዊ ትሰመይ/2/

VERSE 1
ነቢየልዑል/2/
ርዕሰ ዐውደ ዓመት
ርዕሰ ዐውደ ዓመት ዮሐንስ ወላዴ መጥቅዕ /2/
ወላዴ መጥቅዕ/ 2/ ወአበቅቴ/ቴ

VERSE 2
ዐውደ ዓመት
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት/2/
ንዒ ማርያም በምሕረት ወሳህል/2/', 'zenbretu gedam/2/
wereb
weanteni ሕፃn nebiye lዑl/2/
arko lemerዓwi tsemey/2/

VERSE 1
nebiyelዑl/2/
rዕse ዐwde ዓmet
rዕse ዐwde ዓmet yoሐns weladie mexqዕ /2/
weladie mexqዕ/ 2/ weabeqtie/tie

VERSE 2
ዐwde ዓmet
ዐwde ዓmet lebarko barko ዐwde ዓmet/2/
nዒ maryam bemሕret wesahl/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=c7X4VG3dQFY', 'draft', 'pending', 'https://www.youtube.com/watch?v=c7X4VG3dQFY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('enze-te-qfiyo', 'እንዘ ተሐቅፊዮ', 'እንዘ ተሐቅፊዮ', 'enze teሐqfiyo', 'Ethiopian Orthodox Tewahedo Mezmur - እንዘ ተሐቅፊዮ', 'አንዘ ተሐቅፊዮ ለሕፃንኪ/2/ ጽጌ ጸዓዳ ወቀይሕ''/2/
ንዒ ርግብየ ምስለ ገብርኤል ወንዒ ሠናይትየ ምስለ
ሚከኤል/2/
ትመስል', 'anze teሐqfiyo leሕፃnki/2/ tsgie tseዓda weqeyሕ''/2/
nዒ rgbye msle gebriel wenዒ ሠnaytye msle
mikeiel/2/
tmesl', 'amharic', 'mezmur', 'ዘማሪት ትዕግስት ስለሺ', 'https://www.youtube.com/watch?v=H6B5V-1b4Iw', 'draft', 'pending', 'https://www.youtube.com/watch?v=H6B5V-1b4Iw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('aba-aba-barkeni-patryark', 'አባ አባ', 'አባ አባ', 'aba aba barkeni ------ patryark', 'Ethiopian Orthodox Tewahedo Mezmur - አባ አባ', 'አባ አባ
አባአባ ባርከኒ መብአ ጽዮን በትረ ማርያም/2/
ከመ ባርኮ አብርፃም ለይስሐቅ ወልዱ/4', 'aba aba
abaaba barkeni meba tsyon betre maryam/2/
keme barko abrፃm leysሐq weldu/4', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=1FCIkXbkXJY', 'draft', 'pending', 'https://www.youtube.com/watch?v=1FCIkXbkXJY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('antenu-mikaiel-mena-mena-zeawredke-2', 'አንተኑ ሚካኤል መና መና ዘአውረድከ/2/', 'አንተኑ ሚካኤል መና መና ዘአውረድከ/2/', 'antenu mikaiel mena mena zeawredke/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አንተኑ ሚካኤል መና መና ዘአውረድከ/2/', 'ወአንተኑ ለእስራኤል መና ዘአውረድከ/2/
ሰፊሆ
ሰፊሆ ክነፊሆ /2/
ክነፊሆ ይጴጹልል ዲቤነ /#', 'weantenu leesraiel mena zeawredke/2/
sefiho
sefiho knefiho /2/
knefiho yphietsull dibiene /#', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=6r7cGnXfZMw', 'draft', 'pending', 'https://www.youtube.com/watch?v=6r7cGnXfZMw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('newa-mikaiel-melakekmu-2', 'ነዋ ሚካኤል', 'ነዋ ሚካኤል', 'newa mikaiel melakekmu /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ነዋ ሚካኤል', 'ይስአል ለክሙ በእንተ ምሕረት /2/
ትርጉም፣ አነሆ ሚካኤል መልአካችሁ
ይለምንላችሁ፡፡
163. አንተኑ

VERSE 1
አንተኑ ሚካኤል መና ዘአውርድከክ /2/
ወአንተኑ ለአስራኤል መና ዘአውድርከ /2/
ትርጉም፣፤ ለእስራኤል መናን ያወደርክ አንተ ነህ
164 መልአከ ሰላምነ

VERSE 2
መልአከ ሰላምነ ሊቀ መላአክት ሚካኤል /2/
ሰአል ወጸሊ በእንቲአነ አዕርግ ጸሎትነ
ቅድመ መንበሩ ለመድኃኔዓለም /2/
ትርጉም፣ የይቅርታ መልአክ ሚካኤል

VERSE 3
ሆይ በመድኃኔዓለም ፊት ስለኛ
ለምንልን
165. አመ ይስቅልዎ
አመ ይስቅልዎ አይሁድ ለእግዚእነ /2/

VERSE 4
ሚካኤል አርመመ ወገብርኤል ተደመ /2/
ትርጉም፣ አይሁድ ጌታን በሰቀሉት ጊዜ
ሚካኤል ዝም አለ ገብርኤልም ተደነቀ
166. በአደ መልአኩ

VERSE 5
በአደ መልአኩ /2/ ይዕቀበነ /2/
በአደ መልአኩ /3/ ይዕቀበነ /2/
ትርጉም፣ በመልአኩ እጅ ይጠብቀን
167.ዓይኑ ዘርግብ

VERSE 6
ዓይኑ ዘርግብ ዓይኑ/''2/
ነዋ ሚካኤል
ነዋ ሚካኤል መልአከክሙ//2/', 'ysal lekmu beente mሕret /2/
trgum፣ aneho mikaiel melakachhu
ylemnlachhu፡፡
163. antenu

VERSE 1
antenu mikaiel mena zeawrdkek /2/
weantenu leasraiel mena zeawdrke /2/
trgum፣፤ leesraiel menan yawederk ante neh
164 melake selamne

VERSE 2
melake selamne liqe melaakt mikaiel /2/
seal wetseli beentiane aዕrg tselotne
qdme menberu lemedኃnieዓlem /2/
trgum፣ yeyqrta melak mikaiel

VERSE 3
hoy bemedኃnieዓlem fit slegna
lemnln
165. ame ysqlwo
ame ysqlwo ayhud leegziene /2/

VERSE 4
mikaiel armeme wegebriel tedeme /2/
trgum፣ ayhud gietan beseqelut gizie
mikaiel zm ale gebrielm tedeneqe
166. beade melaku

VERSE 5
beade melaku /2/ yዕqebene /2/
beade melaku /3/ yዕqebene /2/
trgum፣ bemelaku ej yxebqen
167.ዓynu zergb

VERSE 6
ዓynu zergb ዓynu/''2/
newa mikaiel
newa mikaiel melakekmu//2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=5C8Uk6Hbmfc', 'draft', 'pending', 'https://www.youtube.com/watch?v=5C8Uk6Hbmfc', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ysal-lene-redaie-ykunene-ysal-lene-ame-mndabie-2', 'ይስአል ለነ ረዳኤ ይኩነነ ይስአል ለነ አመ', 'ይስአል ለነ ረዳኤ ይኩነነ ይስአል ለነ አመ', 'ysal lene redaie ykunene ysal lene ame mndabie /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ይስአል ለነ ረዳኤ ይኩነነ ይስአል ለነ አመ', 'ትርጉም፣ ይህ መቀመጫው ከፍ ያለ ኃይል
መልአክ ሚካኤል በችግራችን ጊዜ
ይልምንልን ረዳት ይሁነን፡፡
176በአምሳለ ርግብ

VERSE 1
በአምሳለ ርግብ ወረደ መልአክ ወረደ /2/
ወረደ /ቴ ሚካኤል መልአክ ወረደ /2/
ትርጉም፣ መልአኩ ሜካኤል በርግብ አምሳያ
ወረደ አነሆ ወረደ መልአኩ ወረደ

VERSE 2
177. ኦ ሚካኤል
ኦ ሚካኤል /2/ ሊቀ መላእክት
በኃጢአት እንዳንወድቅ አንዳንሞት ፈጥነህ
ተራዳን አጽናን በእምነት /2/

VERSE 3
ይስአል ለነ ረዳኤ ይኩነነ ይስአል ለነ አመ
ምንዳቤ /2/', 'trgum፣ yh meqemecaw kef yale ኃyl
melak mikaiel bechgrachn gizie
ylmnln redat yhunen፡፡
176beamsale rgb

VERSE 1
beamsale rgb werede melak werede /2/
werede /tie mikaiel melak werede /2/
trgum፣ melaku miekaiel bergb amsaya
werede aneho werede melaku werede

VERSE 2
177. o mikaiel
o mikaiel /2/ liqe melaekt
beኃxiat endanwedq andanmot fexneh
teradan atsnan beemnet /2/

VERSE 3
ysal lene redaie ykunene ysal lene ame
mndabie /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=6nsyAMGXA5s', 'draft', 'pending', 'https://www.youtube.com/watch?v=6nsyAMGXA5s', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dar-2-tsyon-maryam', 'ኅዳር 2] ጽዮን ማርያም', 'ኅዳር 2] ጽዮን ማርያም', 'ኅdar 2] tsyon maryam', 'Ethiopian Orthodox Tewahedo Mezmur - ኅዳር 2] ጽዮን ማርያም', 'ጽፋት
አይ ይእቲ ዛቲ እንተ ታስተርኢ እምርሁቅ ከመ
ማኅቶት ብርህት ከመፀሐይ ሙሴኒ ርእያ ሀገር
ቅድስት አዝራኒ ተናገራ ዳዊት ዘመራ

VERSE 1
ሙሴኒ ርእያ', 'tsfat
ay yeti zati ente tasteri emrhuq keme
maኅtot brht kemeፀሐy musieni reya hager
qdst azrani tenagera dawit zemera

VERSE 1
musieni reya', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=tYqAUD5J12A', 'draft', 'pending', 'https://www.youtube.com/watch?v=tYqAUD5J12A', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('musieni-reya-2-hager-qdst-ityophya-2', 'ሙሴኒ ርእያ/2/ሀገር ቅድስት ኢትዮጵያ''2/', 'ሙሴኒ ርእያ/2/ሀገር ቅድስት ኢትዮጵያ''2/', 'musieni reya/2/hager qdst ityophya''2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሙሴኒ ርእያ/2/ሀገር ቅድስት ኢትዮጵያ''2/', 'አዝራኒ ተናገራ ተናገራ ዘመራ ዳዊት/2/', 'azrani tenagera tenagera zemera dawit/2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=L1HT-XBfiQo', 'draft', 'pending', 'https://www.youtube.com/watch?v=L1HT-XBfiQo', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeldet-ena-yexmqet-wereb', 'የልደት እና የጥምቀት ወረብ', 'የልደት እና የጥምቀት ወረብ', 'yeldet ena yexmqet wereb', 'Ethiopian Orthodox Tewahedo Mezmur - የልደት እና የጥምቀት ወረብ', 'አንገርጋሪ
ውአቱ ኢየሱስ በቤተልፄም ዘይሁዳ አዋልደ
ጢሮስ አሜሀ ይሰግዳ ሰብአ ሰገል አምጽኡ ሎቱ
ጋዳ ወይትሐሠያ አዋልደ ይሁዳ

VERSE 1
ዝማሜ', 'angergari
watu iyesus bebietelፄm zeyhuda awalde
xiros amieha ysegda seba segel amtsu lotu
gada weytሐሠya awalde yhuda

VERSE 1
zmamie', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=qVmnTdFeulE', 'draft', 'pending', 'https://www.youtube.com/watch?v=qVmnTdFeulE', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wereb-wetu-iyesus', 'ወረብ /ውእቱ ኢየሱስ/', 'ወረብ /ውእቱ ኢየሱስ/', 'wereb /wetu iyesus/', 'Ethiopian Orthodox Tewahedo Mezmur - ወረብ /ውእቱ ኢየሱስ/', 'ውዕቱ ኢየሱስ/3/ እምቅድስት ድንግል/2/
በአንተ ልደቱ ለክርስቶስ ዮም ፍሥሐ ኮነ በእንተ ልደቱ
ለክርስቶስ/2/
ሰላም

VERSE 1
ተሰአልከ አግዚኦ ምድረከ ዛሌ ሉያ/2/ ዮም ተወልደ
አግዚአ ወመድኅን በፍሥሀ ወበሰላም', 'wዕtu iyesus/3/ emqdst dngl/2/
beante ldetu lekrstos yom fሥሐ kone beente ldetu
lekrstos/2/
selam

VERSE 1
tesealke agzio mdreke zalie luya/2/ yom tewelde
agzia wemedኅn befሥha webeselam', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=PTu7dLajknA', 'draft', 'pending', 'https://www.youtube.com/watch?v=PTu7dLajknA', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zeyeamn-bye', 'ዘየአምን ብየ', 'ዘየአምን ብየ', 'zeyeamn bye', 'Ethiopian Orthodox Tewahedo Mezmur - ዘየአምን ብየ', 'ዘየአምን ብየ በትንሣኤየ ወበዕርገተየ''/2//
ቦ ዘለዓለም ሕይወተ/4
ዐርገ', 'zeyeamn bye betnሣieye webeዕrgeteye''/2//
bo zeleዓlem ሕywete/4
ዐrge', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=dbSCBq8ozBk', 'draft', 'pending', 'https://www.youtube.com/watch?v=dbSCBq8ozBk', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('melmalawit-melmalawit-melmelawit-2', 'ሐመልማላዊት', 'ሐመልማላዊት', 'ሐmelmalawitሐmelmalawit ሐmelmelawit /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሐመልማላዊት', 'ሙሴ ዘርእያ ዘርእያ በደብረ ሲና ማኅደረ
ስብሐት/2/
193. ጽላት ዘሙሴ
ጽላት ዘሙሴ ጽላት/2/

VERSE 1
ጽላት ዘሙሴ ጽላት /2/ ማርያም ቅድስት/2/
ሙሴ ከፈጣሪው የተቀበላት አሠርቱ
ትዕዛዛት የተጻፈባት ጽላት ዘሙሴ ጽላት/2/
ይዕቲ ዕፀ መድኃኒት /2/ ይዕቲ ዕፀ መድኃኒት

VERSE 2
ሐመልማላዊት ዕፅ /2/( ሐመልማላዊት/4/
ሐመልማላዊት
ሐመልማላዊት/ዕ/
ሙሴ  ዘርእያ/2/ በደብረ ሲና ደብረሲና ማኅደረ

VERSE 3
ስብሐት//2/
ኮነ ዮም
ኮነ ዮም/2/ በእንተ ልደታ ለማርያም/2/
ከመትቤዙ ነቢያተ ወጸድቃነ

VERSE 4
ነቢያተ ከመ ትቤዙ''/2/
ኦ ማርያም', 'musie zereya zereya bedebre sina maኅdere
sbሐt/2/
193. tslat zemusie
tslat zemusie tslat/2/

VERSE 1
tslat zemusie tslat /2/ maryam qdst/2/
musie kefexariw yeteqebelat aሠrtu
tዕzazat yetetsafebat tslat zemusie tslat/2/
yዕti ዕፀ medኃnit /2/ yዕti ዕፀ medኃnit

VERSE 2
ሐmelmalawit ዕፅ /2/( ሐmelmalawit/4/
ሐmelmalawit
ሐmelmalawit/ዕ/
musie  zereya/2/ bedebre sina debresina maኅdere

VERSE 3
sbሐt//2/
kone yom
kone yom/2/ beente ldeta lemaryam/2/
kemetbiezu nebiyate wetsedqane

VERSE 4
nebiyate keme tbiezu''/2/
o maryam', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=tqhL_wsDC8o', 'draft', 'pending', 'https://www.youtube.com/watch?v=tqhL_wsDC8o', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('besb-t-lemaryam-waryat-genezwa', 'በስብሐት ለማርያም ሐዋርያት ገነዝዋ', 'በስብሐት ለማርያም ሐዋርያት ገነዝዋ', 'besbሐt lemaryam ሐwaryat genezwa', 'Ethiopian Orthodox Tewahedo Mezmur - በስብሐት ለማርያም ሐዋርያት ገነዝዋ', 'በስብሐት//2/
የሥላሴ ወረብ
ስብሐት ለአብ', 'besbሐt//2/
yeሥlasie wereb
sbሐt leab', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=ZD80NMVH0ok', 'draft', 'pending', 'https://www.youtube.com/watch?v=ZD80NMVH0ok', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('besb-t-lemaryam-waryat-genezwa', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sb-t-leab-lea-zie-kulu-lem-2', 'ስብሐት ለአብ ለአኃዜ ኩሉ ዓለም/2/', 'ስብሐት ለአብ ለአኃዜ ኩሉ ዓለም/2/', 'sbሐt leab leaኃzie kulu ዓlem/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ስብሐት ለአብ ለአኃዜ ኩሉ ዓለም/2/', 'ስብሐት ለወልደ ለገባሬ ኩሉ ፍጥረት', 'sbሐt lewelde legebarie kulu fxret', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=jvJjr3azCfU', 'draft', 'pending', 'https://www.youtube.com/watch?v=jvJjr3azCfU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yezewetr-wereb', 'የዘወትር ወረብ', 'የዘወትር ወረብ', 'yezewetr wereb', 'Ethiopian Orthodox Tewahedo Mezmur - የዘወትር ወረብ', 'ንሴብሖ
ንሴብሖ/2/ ለእግዚአብሔር//2/
ስቡሐ ዘተሰብሐ/ቄ
አንሰ

VERSE 1
አንሰ ወቤትየ እግዚአብሔርዛፃ ናመልክ/2/
አስመ ቅዱስ ውእቱ አእግዚአብሔር/4', 'nsiebሖ
nsiebሖ/2/ leegziabሔr//2/
sbuሐ zetesebሐ/qie
anse

VERSE 1
anse webietye egziabሔrzaፃ namelk/2/
asme qdus wetu aegziabሔr/4', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=YVW8HZ1W_zs', 'draft', 'pending', 'https://www.youtube.com/watch?v=YVW8HZ1W_zs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('yezewetr-wereb', 'holy-trinity', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ntsum-tsome-wenafqr-bitsene-wentfaqer-bebeynatine', 'ንጹም ጾመ ወናፍቅር ቢጸነ ወንትፋቀር በበይናቲነ', 'ንጹም ጾመ ወናፍቅር ቢጸነ ወንትፋቀር በበይናቲነ', 'ntsum tsome wenafqr bitsene wentfaqer bebeynatine', 'Ethiopian Orthodox Tewahedo Mezmur - ንጹም ጾመ ወናፍቅር ቢጸነ ወንትፋቀር በበይናቲነ', 'አስመ ከማሁ አዘዘዘነ/3/
ንጹም ጾመ ወናፍቅር ቢጸነ ወንትፋቀር በበይናቲነ
አስመ ለሊሁ መድኃኒነ ጾመ', 'asme kemahu azezezene/3/
ntsum tsome wenafqr bitsene wentfaqer bebeynatine
asme lelihu medኃnine tsome', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=_1xTGGZa1XU', 'draft', 'pending', 'https://www.youtube.com/watch?v=_1xTGGZa1XU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zienoku-tsdqeke-wenegerku-ad-noteke-ke-tku-qalatike', 'ዜኖኩ ጽድቀከ ወነገርኩ አድኅኖተከ ከሠትኩ ቃላቲከ', 'ዜኖኩ ጽድቀከ ወነገርኩ አድኅኖተከ ከሠትኩ ቃላቲከ', 'zienoku tsdqeke wenegerku adኅnoteke keሠtku qalatike', 'Ethiopian Orthodox Tewahedo Mezmur - ዜኖኩ ጽድቀከ ወነገርኩ አድኅኖተከ ከሠትኩ ቃላቲከ', 'ለሕዝብከ ኢትዮጵያ /2/
በጸጋሁ ለመንፈስቅዱስ ወመሀርክዎሙ አነ ይቤ ያሬድ
ጥዑመ ልሳን (23', 'leሕzbke ityophya /2/
betsegahu lemenfesqdus wemeharkwomu ane ybie yaried
xዑme lsan (23', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=LB7IThgOvC0', 'draft', 'pending', 'https://www.youtube.com/watch?v=LB7IThgOvC0', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ityophya-endanchi-yelem', 'ኢትዮጵያ', 'ኢትዮጵያ', 'ityophya endanchi yelem', 'Ethiopian Orthodox Tewahedo Mezmur - ኢትዮጵያ', 'አበባው ለምለም ቄጤማው ለምለም
ተዋሕዶ እንዳንቺ የለም
አበባው ለምለም ድንግል ማርያም
ኢትዮጵያ /2/

VERSE 1
አዝራኒ ተናግራ ተናግራ ዘምራ ዳዊት/2/
ኢትዮጵያ ታበፅህ አደዊሀ ኀበ
እግዚአብሔር:.2/
አንዘ ትብል አምላኪየ/2/ ነጽረኒ ወአድኅነኒ

VERSE 2
እምኃይል ፀላኢ ወፀር/2/
ኢትዮጵያንም ታደግ ተዋሕዶንም ጠብቅ
ሊቀመልአክት በል ቁምልን ሰይፍህንም ታጠቅ
ሠራዊትህ ከበው እነርሱ ያጽናኑን

VERSE 3
ዘወትር ሳትርቀን ሰላምን ለግሠን
ኢትዮጵያዊው ቅዱስ አባ ተክለሄህይማኖት
ወልድ ዋሕድ ብለህ ምድሪቱን ቀደስካት
ኢትዮጵያን አስማርካት በጾምና ጸሎት

VERSE 4
ታማኝ አገልጋይ ነህ ለኅብረተሰብህ
ልጆችህን አስተምረን እንጓዝ በአንተ እግር
ጻድቁ አባታችን ታማኝ አገልጋይ
አቡነ አረገዊ ደስ ያሰኛል ሥራህ

VERSE 5
አንደ አምላክህ ፈቃድ በሕጉ ተመርተህ
በዘንዶ ጀርባ ላይ ደብረ ዳሞ አየንህ
ቅዱስ የሦስት ዓመት ሕፃኑ ቂርቆስ
ገድልህ አስደናቂ የህሙማን ፈውስ

VERSE 6
አናትህ ኢየሉጣን በርቺ አይዞሽ እንዳልክ
ልጆችህን ጠብቀን ከዲያብሎስ ተውሣክ
ኢትዮጵያ እንደአንቺ የለም
አበባው ለምለም ቄጤማው ለምለም

VERSE 7
ተዋሕዶ እንደአንቺ የለም
አበባው ለምለም ድንግል ማርያም
ያለ አንቺ እመቤት የለም
1085. የአዋጅ ነጋሪ ቃል

VERSE 8
ኢትዮጵያ
ለኢትዮጵያ /2/
አሠርገዋ/3/ ለኢትዮጵያ', 'abebaw lemlem qiexiemaw lemlem
tewaሕdo endanchi yelem
abebaw lemlem dngl maryam
ityophya /2/

VERSE 1
azrani tenagra tenagra zemra dawit/2/
ityophya tabeፅh adewiha ኀbe
egziabሔr:.2/
anze tbl amlakiye/2/ netsreni weadኅneni

VERSE 2
emኃyl ፀlai weፀr/2/
ityophyanm tadeg tewaሕdonm xebq
liqemelakt bel qumln seyfhnm taxeq
ሠrawith kebew enersu yatsnanun

VERSE 3
zewetr satrqen selamn legሠn
ityophyawiw qdus aba teklehehymanot
weld waሕd bleh mdritun qedeskat
ityophyan asmarkat betsomna tselot

VERSE 4
tamagn agelgay neh leኅbretesebh
ljochhn astemren enguaz beante egr
tsadqu abatachn tamagn agelgay
abune aregewi des yasegnal ሥrah

VERSE 5
ande amlakh feqad beሕgu temerteh
bezendo jerba lay debre damo ayenh
qdus yeሦst ዓmet ሕፃnu qirqos
gedlh asdenaqi yehmuman fews

VERSE 6
anath iyeluxan berchi ayzosh endalk
ljochhn xebqen kediyablos tewሣk
ityophya endeanchi yelem
abebaw lemlem qiexiemaw lemlem

VERSE 7
tewaሕdo endeanchi yelem
abebaw lemlem dngl maryam
yale anchi emebiet yelem
1085. yeawaj negari qal

VERSE 8
ityophya
leityophya /2/
aሠrgewa/3/ leityophya', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=2VNvWghJJFs', 'draft', 'pending', 'https://www.youtube.com/watch?v=2VNvWghJJFs', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('weteqebelwo', 'ወተቀበልዎ', 'ወተቀበልዎ', 'weteqebelwo', 'Ethiopian Orthodox Tewahedo Mezmur - ወተቀበልዎ', 'ወተቀበልዎ መላአክት በስብሐት ወበማኅሌት /2/
ወአብጽህዎ ኢየሩሳሌም ኢየሩሳሌም ሰማያዊት /2/', 'weteqebelwo melaakt besbሐt webemaኅliet /2/
weabtshwo iyerusaliem iyerusaliem semayawit /2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=5NaG1hQJP9U', 'draft', 'pending', 'https://www.youtube.com/watch?v=5NaG1hQJP9U', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gebre-menfes-qdus-4', 'ገብረ መንፈስ ቅዱስ', 'ገብረ መንፈስ ቅዱስ', 'gebre menfes qdus /4/', 'Ethiopian Orthodox Tewahedo Mezmur - ገብረ መንፈስ ቅዱስ', 'ሐዋርያ /2/ ዘእስክንድርያ(2)
ተክለሃይማኖት /4/
ሐዋርያ /2/ ዘኢትዮጵያ
ገብረ መንፈስ ቅዱስ /4

VERSE 1
ሐዋርያ /2/ ዘአስክንድርያ /2/
ተክለ ፃይማኖት /
ሐዋርያ /2/ ዘኢትጵያ /2/
ገብረ መንፈስ ቅዱስ ዘአም አቅሌሲያ

VERSE 2
ወተክለሃይማኖት ዘኢትዮጵያ
ወማርቆስ አብ ዘአስክንድርያ
1094.ምስጋና ጀመረ
ምሥጋና ጀመረ ብሎ ዛሌ ሉያ

VERSE 3
ማኅሌታይ ያሬድ ዘኢትዮጵያ
ምሥጋና ጀመረ ብሎ ዛሌ ሉያ
ይበል /3/ ዛሌ ሉያ
ጥዑመ ልሳን ያሬድ /3/

VERSE 4
ዘኢትዮጵያ
ገብረ መንፈስ ቅዱስ
ገብረ መንፈስ ቅዱስ ዘይሠርር በአክናፉ /2/
ኀበ ዓምደ ወርቅ /2/ ስሙ ጽሑፍ /2/', 'ሐwarya /2/ zeeskndrya(2)
tekleሃymanot /4/
ሐwarya /2/ zeityophya
gebre menfes qdus /4

VERSE 1
ሐwarya /2/ zeaskndrya /2/
tekle ፃymanot /
ሐwarya /2/ zeitphya /2/
gebre menfes qdus zeam aqliesiya

VERSE 2
wetekleሃymanot zeityophya
wemarqos ab zeaskndrya
1094.msgana jemere
mሥgana jemere blo zalie luya

VERSE 3
maኅlietay yaried zeityophya
mሥgana jemere blo zalie luya
ybel /3/ zalie luya
xዑme lsan yaried /3/

VERSE 4
zeityophya
gebre menfes qdus
gebre menfes qdus zeyሠrr beaknafu /2/
ኀbe ዓmde werq /2/ smu tsሑf /2/', 'amharic', 'mezmur', 'ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ', 'https://www.youtube.com/watch?v=GpSc9QcWCqQ', 'draft', 'pending', 'https://www.youtube.com/watch?v=GpSc9QcWCqQ', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('gebre-menfes-qdus-4', 'abune-tekle-haymanot', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yetsadqan-me-za', 'የጻድቃን መዓዛ', 'የጻድቃን መዓዛ', 'yetsadqan meዓza', 'Ethiopian Orthodox Tewahedo Mezmur - የጻድቃን መዓዛ', 'የጻድቃን መዓዛ ደስ ይላል እንደ ጽጌረዳ /2/
ያድነናል (3 ከኃጢአት ፍዳ /2/
መዓዛ አፈዋት
መዓዛ አፈዋት ማርያም ማርያም ጽጌ መንግሥት

VERSE 1
ቡርክት /2/
ጽጌ ጽጌ ዘሰሎሞን ወዳዊት አብርፃ ወአጽብሐ /2/
እስመአልብነ
አስመ አልበነ ረዲኒ በጊዜ ምንዳቤ ወሐዘን/2/

VERSE 2
እስመ ዘእንበሌከ ባአደ ኢነአምር/4/', 'yetsadqan meዓza des ylal ende tsgiereda /2/
yadnenal (3 keኃxiat fda /2/
meዓza afewat
meዓza afewat maryam maryam tsgie mengሥt

VERSE 1
burkt /2/
tsgie tsgie zeselomon wedawit abrፃ weatsbሐ /2/
esmealbne
asme albene redini begizie mndabie weሐzen/2/

VERSE 2
esme zeenbelieke baade ineamr/4/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=9Za53B1FWbw', 'draft', 'pending', 'https://www.youtube.com/watch?v=9Za53B1FWbw', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zewetr-xewat-mata', 'ዘወትር ጠዋት ማታ', 'ዘወትር ጠዋት ማታ', 'zewetr xewat mata', 'Ethiopian Orthodox Tewahedo Mezmur - ዘወትር ጠዋት ማታ', 'ምስጋና አቀርባለሁ " "
ዘወትር ጠዋት ማታ " 7/2/
ብወድቅ ምርኩዝ ድጋፍ ነፍሴ ሆይ
ዘወትር ጠዋት ማታ

VERSE 1
እንማልዳለን', 'msgana aqerbalehu " "
zewetr xewat mata " 7/2/
bwedq mrkuz dgaf nefsie hoy
zewetr xewat mata

VERSE 1
enmaldalen', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=NFA2Vwb6aAU', 'draft', 'pending', 'https://www.youtube.com/watch?v=NFA2Vwb6aAU', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_section_links_import (mezmur_slug, section_slug, sort_order, is_primary) VALUES ('zewetr-xewat-mata', 'praise-worship', 10, true) ON CONFLICT DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ende-weyn-2-ende-zelela-2', 'እንደ ወይን/2/ እንደ ዘለላ/2/', 'እንደ ወይን/2/ እንደ ዘለላ/2/', 'ende weyn/2/ ende zelela/2/', 'Ethiopian Orthodox Tewahedo Mezmur - እንደ ወይን/2/ እንደ ዘለላ/2/', 'አንደ ወይን/2/ እንደ ዘለላ/2/
ስምሽ የጣፈጠ ተአምርሽ ያማረ/2/
ያማረ ደንግል ማርያም/2/
ወእንዘ ትፈትል/2/ ወርቀ ወሜላተ

VERSE 1
ወእንዘ ትፈትል/2/ ወርቀ ወሜላተ
አስተርአያ ገብርኤል ግብተ/ሪ/
ወይቤላ/2/ አስመ ረከብኪ ሞገሰ ኸኸ በኀበ
እግዚአብሔር /ሪ2/', 'ande weyn/2/ ende zelela/2/
smsh yexafexe teamrsh yamare/2/
yamare dengl maryam/2/
weenze tfetl/2/ werqe wemielate

VERSE 1
weenze tfetl/2/ werqe wemielate
asteraya gebriel gbte/ri/
weybiela/2/ asme rekebki mogese ኸኸ beኀbe
egziabሔr /ri2/', 'amharic', 'mezmur', NULL, 'https://www.youtube.com/watch?v=9NugCqYepcY', 'draft', 'pending', 'https://www.youtube.com/watch?v=9NugCqYepcY', NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-let-ye-met', 'የዕለት የዓመት', 'የዕለት የዓመት', 'yeዕlet yeዓmet', 'Ethiopian Orthodox Tewahedo Mezmur - የዕለት የዓመት', 'የዕለት የዓመት የዘመናት ጌታ
ከዚህ ካደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃለሁ የክብር ሰላምታ ያክብሮት ሰላምታ
ኑ እናመስግን ከልባችን

VERSE 1
የሰማዩን አባታችን', 'yeዕlet yeዓmet yezemenat gieta
kezih kadereskegn zemenien satgeta
aqerblሃlehu yekbr selamta yakbrot selamta
nu enamesgn kelbachn

VERSE 1
yesemayun abatachn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zemenatn-bezemenat-yaferarqal', 'ዘመናትን በዘመናት ያፈራርቃል', 'ዘመናትን በዘመናት ያፈራርቃል', 'zemenatn bezemenat yaferarqal', 'Ethiopian Orthodox Tewahedo Mezmur - ዘመናትን በዘመናት ያፈራርቃል', 'ስለ ሁሉ ሁሉ ያውቃል
ሳንለምነው የወደድነውን ይሰጠናል
ከፈቃዱ ይሰማናል', 'sle hulu hulu yawqal
sanlemnew yewedednewn ysexenal
kefeqadu ysemanal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('smua-sixera-qdst', 'ስሟ ሲጠራ ቅድስት', 'ስሟ ሲጠራ ቅድስት', 'smua sixera qdst', 'Ethiopian Orthodox Tewahedo Mezmur - ስሟ ሲጠራ ቅድስት', 'የድንግል ማርያም ቅድስት
አደይ የብርሃን ጮራ በኢትዮጵያ በራ/2/
ስሟ ሲጠራ ቅድስት
የድንግል ማርያም ቅድስት

VERSE 1
አደይ የብርሃን ጮራ በኢትዮጵያ በራ/2/', 'yedngl maryam qdst
adey yebrሃn cora beityophya bera/2/
smua sixera qdst
yedngl maryam qdst

VERSE 1
adey yebrሃn cora beityophya bera/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-ge-lbuna-xntun', 'በሕገ ልቡና ጥንቱን', 'በሕገ ልቡና ጥንቱን', 'beሕge lbuna xntun', 'Ethiopian Orthodox Tewahedo Mezmur - በሕገ ልቡና ጥንቱን', 'ፈጣሪን አውቀሸ ጥንቱን
ሕገ ነቢያት ከዓለም
ቀድመሽ ተቀበልሽ ከዓለም
በብሉይ ኪዳን ለጌታ

VERSE 1
መሥዋዕት አቀረብሽ ለጌታ
ተስፋ ካደረጉት ከአይሁድ
ከአስራኤል ቀድመሽ ከአይሁድ
ሕገ ወንጌልን በፊት

VERSE 2
ይዘሽ ተገኘሽ በፊት
በሕገ ልቡና ጥንቱን
ፈጣሪን አውቀሸ ጥንቱን
ሕገ ነቢያት ከአለም

VERSE 3
ቀድመሽ ተቀበልሽ ከአለም
በብሉይ ኪዳን ለጌታ
መሥዋዕት አቀረብሽ ለጌታ
ተስፋ ካደረጉት ከአይሁድ

VERSE 4
ከአስራኤል ቀድመሽ ከአይሁድ
ሕገ ወንጌልን በፊት
ይዘሽ ተገኘሽ በፊት', 'fexarin awqeshe xntun
ሕge nebiyat keዓlem
qedmesh teqebelsh keዓlem
bebluy kidan legieta

VERSE 1
meሥwaዕt aqerebsh legieta
tesfa kaderegut keayhud
keasraiel qedmesh keayhud
ሕge wengieln befit

VERSE 2
yzesh tegegnesh befit
beሕge lbuna xntun
fexarin awqeshe xntun
ሕge nebiyat kealem

VERSE 3
qedmesh teqebelsh kealem
bebluy kidan legieta
meሥwaዕt aqerebsh legieta
tesfa kaderegut keayhud

VERSE 4
keasraiel qedmesh keayhud
ሕge wengieln befit
yzesh tegegnesh befit', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('weyolsh-lanchi-phierodyada', 'ወዮልሽ ላንቺ ጴሮድያዳ', 'ወዮልሽ ላንቺ ጴሮድያዳ', 'weyolsh lanchi phierodyada', 'Ethiopian Orthodox Tewahedo Mezmur - ወዮልሽ ላንቺ ጴሮድያዳ', 'ደም አፍስሰሻል ፄሮድያዳ ወለተ ሄሮድያዳ /2/
ወዮልሽ አንቺ ዘፈንሽበት
በዮሐንስ ላይ ልትከብሪበት', 'dem afsseshal ፄrodyada welete herodyada /2/
weyolsh anchi zefenshbet
beyoሐns lay ltkebribet', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('metsat-weleta', 'መጽአት ወለታ', 'መጽአት ወለታ', 'metsat weleta', 'Ethiopian Orthodox Tewahedo Mezmur - መጽአት ወለታ', 'መጽአት ወለታ ለፄሮድያዳ ኀበ ንጉሥ ወትቤሎ
ሀበኒ በጻሕል /2/
ሀበኒ በጻሕል ርፅሰ ዮሐንስ ወንጌላዊ (3 ክቡር', 'metsat weleta leፄrodyada ኀbe nguሥ wetbielo
habeni betsaሕl /2/
habeni betsaሕl rፅse yoሐns wengielawi (3 kbur
/2/

VERSE 1
/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mesqelun-teshekmen-beamnet-anramed', 'መስቀሉን ተሸክመን በአምነት አንራመድ', 'መስቀሉን ተሸክመን በአምነት አንራመድ', 'mesqelun teshekmen beamnet anramed', 'Ethiopian Orthodox Tewahedo Mezmur - መስቀሉን ተሸክመን በአምነት አንራመድ', 'ለሰማያዊው ክብር እንጓዝ (2) ወደእርሱ ዘንድ
አግዚአብሔር አብ ላከ አንድያ ልጁን /2/
አርሱ ወዷልና አንዲሁ ዓለሙን(/2/', 'lesemayawiw kbr enguaz (2) wedeersu zend
agziabሔr ab lake andya ljun /2/
arsu wedualna andihu ዓlemun(/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mesqel-temerkuzen', 'መስቀል ተመርኩዘን', 'መስቀል ተመርኩዘን', 'mesqel temerkuzen', 'Ethiopian Orthodox Tewahedo Mezmur - መስቀል ተመርኩዘን', 'መስቀል ተመርኩዘን ወንጌል ተጫምተን
ሃይማኖትን ሰብከን በክርስቶስ አምነን
ማን ያሸንፈናል አኛ ክርስቲያን
ክርስቶስ አለልን', 'mesqel temerkuzen wengiel tecamten
ሃymanotn sebken bekrstos amnen
man yashenfenal agna krstiyan
krstos aleln', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('go-be-qeranyo', 'ጎኅበ ቀራንዮ', 'ጎኅበ ቀራንዮ', 'goኅbe qeranyo', 'Ethiopian Orthodox Tewahedo Mezmur - ጎኅበ ቀራንዮ', 'ንበ ቀራንዮ ደብረ መድኃኒት
ቀራንዮ (2) ኀበ ቀራንዮ
የመስቀሉ ቃል ለአኛ የአግዚአብሔር ኃይል ነው
ለማያምኑት ሞኝነት ነው ለእኛ ግን ሕይወት ነው

VERSE 1
አንመሰክራለን ፈጣሪያችን አለ
አንመሰክራለን አማኑኤል አለ
አንመነው አንካደው ፈጣሪያችን ቸር ነው /2/
አንመሰክራለን ድንግል አማላጅ ናት

VERSE 2
አንመሰክራለን ማርያም አማላጅ ናት
አንመናት አንካዳት የአማኑኤል እናት ናት /2/
ኀበ ጥበባት ኀበ ልሳናት /ቄ
ዮሐንስ /2/ ወንጌለ ስብከት /2/', 'nbe qeranyo debre medኃnit
qeranyo (2) ኀbe qeranyo
yemesqelu qal leagna yeagziabሔr ኃyl new
/2/

VERSE 1
/2/
lemayamnut mognnet new leegna gn ሕywet new
/2/
/2/

VERSE 2
anmesekralen fexariyachn ale
anmesekralen amanuiel ale
anmenew ankadew fexariyachn cher new /2/
anmesekralen dngl amalaj nat

VERSE 3
anmesekralen maryam amalaj nat
anmenat ankadat yeamanuiel enat nat /2/
ኀbe xbebat ኀbe lsanat /qie
yoሐns /2/ wengiele sbket /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemesqel-anmenlen-andnbetalen', 'በመስቀል አንመንለን አንድንበታለን', 'በመስቀል አንመንለን አንድንበታለን', 'bemesqel anmenlen andnbetalen', 'Ethiopian Orthodox Tewahedo Mezmur - በመስቀል አንመንለን አንድንበታለን', 'የክርስቲያን ጋሻ መስቀል ኃይላችን የክርስቲያን
ጦር መስቀል ኃላችን
አፀ መስቀሉ ነው መስቀል ኃይላችን የማያስደፍር
መስቀል ኃይላችን', 'yekrstiyan gasha mesqel ኃylachn yekrstiyan
xor mesqel ኃlachn
aፀ mesqelu new mesqel ኃylachn yemayasdefr
mesqel ኃylachn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tsega-ne-ene', 'ጸጋ ነሣእነ', 'ጸጋ ነሣእነ', 'tsega neሣene', 'Ethiopian Orthodox Tewahedo Mezmur - ጸጋ ነሣእነ', 'ጸጋ ነሣእነ ወሕይወተ ረከብነ በኃይለ መስቀሉ ለኢየሱስ
ክርስቶስ በኃይለ መስቀሉ /2/
ኪያከ እግዚኦ ነአኩት ወንሴብሐከ አግዚአብሔር /2/
ጸጋን ተቀበልን ሕይወትንም አገኘን በመስቀሉ ኃይል

VERSE 1
በኢየሱስ ክርስቶስ በመስቀሉ ኃይል /2/
አቤቱ አንተን (2) እናመሰግንፃለን አግዚአብሔር /2/', 'tsega neሣene weሕywete rekebne beኃyle mesqelu leiyesus
krstos beኃyle mesqelu /2/
kiyake egzio neakut wensiebሐke agziabሔr /2/
tsegan teqebeln ሕywetnm agegnen bemesqelu ኃyl

VERSE 1
beiyesus krstos bemesqelu ኃyl /2/
abietu anten (2) enamesegnፃlen agziabሔr /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('br-n-new-le-lem-yegieta-mesqel-2', 'ብርፃን ነው ለዓለም የጌታ መስቀል /2/', 'ብርፃን ነው ለዓለም የጌታ መስቀል /2/', 'brፃn new leዓlem yegieta mesqel /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ብርፃን ነው ለዓለም የጌታ መስቀል /2/', 'የድሆች መጽናኛ የደካሞች ኃይል /2/
አይሁድ ይክዱታል የጌታን መስቀል /2/
ለምናምን ድኅነት የሚሆነን ኃይል /2/', 'yedhoch metsnagna yedekamoch ኃyl /2/
ayhud ykdutal yegietan mesqel /2/
lemnamn dኅnet yemihonen ኃyl /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('48r-yu-ebeyu', '48ርዕዩ እበዩ', '48ርዕዩ እበዩ', '48rዕyu ebeyu', 'Ethiopian Orthodox Tewahedo Mezmur - 48ርዕዩ እበዩ', 'ርእዩ ዕበዩ ለቅዱስ ዕፀ መስቀል /2/
አውራን ይሬአዩ ወጽሙማን ይሰምዑ አለ ለምጽ
ይነጽሑ አለመጹ ሀቤሁ /2/
ኑ እዩ የመስቀሉን ተአምራት/2/

VERSE 1
አውሮችም ያያሉ ደንቆሮዎች ይሰማሉ ለምጻሞችም
ይነጻሉ ወደእርሱም ይመጣሉ /2/', 'reyu ዕbeyu leqdus ዕፀ mesqel /2/
awran yrieayu wetsmuman ysemዑ ale lemts
ynetsሑ alemetsu habiehu /2/
nu eyu yemesqelun teamrat/2/

VERSE 1
awrochm yayalu denqorowoch ysemalu lemtsamochm
ynetsalu wedeersum ymexalu /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('5-mesqel-br-ne', '5፲. መስቀል ብርሃነ', '5፲. መስቀል ብርሃነ', '5፲. mesqel brሃne', 'Ethiopian Orthodox Tewahedo Mezmur - 5፲. መስቀል ብርሃነ', 'መስቀል ብርሃነ ለኩሉ ዓለም መሠረተ ቤተክርስቲያን
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ
ነአምን /2/
መስቀል ብርፃን ነው ለመላው ዓለም መሠረት ነው

VERSE 1
የቤተክርስቲያን /2/
ሰላምን ሰጪ ነው መድኃኔዓለም መስቀል አዳኝ ነው
ለምናምን ሰዎች /2/', 'mesqel brሃne lekulu ዓlem meሠrete bietekrstiyan
/2/
/2/
wehabie selam medኃnieዓlem mesqel medኅn leዕle

VERSE 1
neamn /2/
mesqel brፃn new lemelaw ዓlem meሠret new
yebietekrstiyan /2/
selamn seci new medኃnieዓlem mesqel adagn new

VERSE 2
lemnamn sewoch /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('54sobese-a-mere', '54ሶበሰ አዕመረ', '54ሶበሰ አዕመረ', '54sobese aዕmere', 'Ethiopian Orthodox Tewahedo Mezmur - 54ሶበሰ አዕመረ', 'አስመ ለዓለም ምሕረቱ ሶበሰ አዕመረ ሰይጣነ
በመስቀሉ
ለወልድ ከመይሰደድ አም ኢያመከሮሙ ለአይሁድ
ዕፀ መስቀል ከመይትክሉ ናዝራዊ ከመይስቅሉ

VERSE 1
ማሕየዊ
ከመይስቀሉ በዘመከረ ተአኩረ ወበዘአትከለ ተሰደ
ወዕምዝ
ኀለየ ከመይሰውር ፀሐየ ግበ አሙቀ ለጸፊነ

VERSE 2
መስቀል አፍረየ
መስቀል ብርፃዛን ከመይሰውርዎ ኀቤየ
ዝንቱ መስቀል ኅብስተ ሕይወት አፍረየ አውኃዘ
ለነ ደመ ወማየ ጽዋዓ መድኃኒት ጽሩይ

VERSE 3
ዘኢይነጽፍ ቀላይ ከመ ጌራወርቅ
ጽሩይ ሥርግው በባሕርሂ መስቀል ነቢሮ ላዕለ
ርዕስየ
ታስተርኢ ጊዜ ትወጽዕ ነፍስየ

VERSE 4
55.የመስቀል አመላለስ /ወረብ/
ዝንቱ መስቀል ሕብስተ ሕይወት አፍረየ አውኃዘ
ለነ ደመ ወማየ አውኃዘ ለነ /2/
ከመ ጌራወረቅ ጽሩይ ሥርግው በባሕርይ መስቀል

VERSE 5
ነቢሮ ያስተርኢ ላዕለ ርዕስያ /2/
ትርጉም ፡:-', 'asme leዓlem mሕretu sobese aዕmere seyxane
bemesqelu
leweld kemeyseded am iyamekeromu leayhud
ዕፀ mesqel kemeytklu nazrawi kemeysqlu

VERSE 1
maሕyewi
kemeysqelu bezemekere teakure webezeatkele tesede
weዕmz
ኀleye kemeysewr ፀሐye gbe amuqe letsefine

VERSE 2
mesqel afreye
mesqel brፃzan kemeysewrwo ኀbieye
zntu mesqel ኅbste ሕywet afreye awኃze
lene deme wemaye tswaዓ medኃnit tsruy

VERSE 3
zeiynetsf qelay keme gierawerq
tsruy ሥrgw bebaሕrhi mesqel nebiro laዕle
rዕsye
tasteri gizie twetsዕ nefsye

VERSE 4
55.yemesqel amelales /wereb/
zntu mesqel ሕbste ሕywet afreye awኃze
lene deme wemaye awኃze lene /2/
keme gierawereq tsruy ሥrgw bebaሕry mesqel

VERSE 5
nebiro yasteri laዕle rዕsya /2/
trgum ፡:-', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yle-mesqelu-abrza-2-beityophya-2', 'ኃይለ መስቀሉ አብርዛፃ (2) በኢትዮጵያ /2/', 'ኃይለ መስቀሉ አብርዛፃ (2) በኢትዮጵያ /2/', 'ኃyle mesqelu abrzaፃ (2) beityophya /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ኃይለ መስቀሉ አብርዛፃ (2) በኢትዮጵያ /2/', 'አስመ መስቀል ሞአ ሞተ ተሞአ /2/
ትርጉም :- የመስቀል ኃይል በኢትዮጵያ አበራ መስቀል
ድል ነስቷልና ሞት ድል ተነሣ
መስቀል አሸንፏልና ሞት ተሸነፈ

VERSE 1
57ብርሃን ወጣ
ብርፃን ወጣ ከመስቀሉ የሚያንጸባርቅ
የአምላክና የሰው ልጆች አውነተኛ እርቅ
ደስ ይበለን በመስቀሉ ብርፃን

VERSE 2
አልል አንበል በአንድነት ሆነን
ድኅነት ሆነ ለመላው ዓለም
ከፊት ለፊት በመሳሉ የመስቀሉ ነገር
የሚወደው ሐዋርያ የወንጌል መምህር

VERSE 3
ዮሐንስም ስቅለቱን በማየቱ
ሲያዝን ኖረ በምድራዊ ሕይወቱ
ቢያሰቅቀው ሞቱ ግርፋቱ', 'asme mesqel moa mote temoa /2/
trgum :- yemesqel ኃyl beityophya abera mesqel
dl nestualna mot dl teneሣ
mesqel ashenfualna mot teshenefe

VERSE 1
57brሃn wexa
brፃn wexa kemesqelu yemiyantsebarq
yeamlakna yesew ljoch awnetegna erq
des ybelen bemesqelu brፃn

VERSE 2
all anbel beandnet honen
dኅnet hone lemelaw ዓlem
kefit lefit bemesalu yemesqelu neger
yemiwedew ሐwarya yewengiel memhr

VERSE 3
yoሐnsm sqletun bemayetu
siyazn nore bemdrawi ሕywetu
biyaseqqew motu grfatu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kuni-fenoni-gadisada-qorchada-2', 'ኩኒ ፈኖኒ ጋዲሳዳ ቆርቻዳ /2/', 'ኩኒ ፈኖኒ ጋዲሳዳ ቆርቻዳ /2/', 'kuni fenoni gadisada qorchada /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ኩኒ ፈኖኒ ጋዲሳዳ ቆርቻዳ /2/', 'ኩኒ ፈኖኒ ጋዲሳዳ ቆርቻዳ /2/
6]. አርሳቱ አገርሲሴ (በእጣን አንፀዐረ)
አርሳቱ አገርሲሴ (4
ጎልጎታቲ አርገሜ ፈኖን ዋቀዮ /ቄ

VERSE 1
62.ኮታላላ (ርእዩ ዕበዩ )
ኮታላላ ፈኖ ዋቀዮ ራጂሳ /2/
ጀዋማኒ ኒአርገኒ ጉሪ ኢነኔኝፄ ኒደጋኒ ዱኩባ ጎጋ
ኒቁልቁላ /2/

VERSE 2
63.ፈኖራ (በመስቀሉ ወበቃሉ)
ፈኖራ ቡኤቶ /2/
ፈኖሳቲን ሁንዳፋ ኢብሴ /4
6ፋ4ፈኖ ኢፋ (መስቀል ብርሃን ረጅሙ

VERSE 3
ፈኖ ኢፋ አዱኛ ሁንዳፊ ቡሁራዳ ወልዳ ኬኛፊ /2/
ነገኢ ኬኛዳ ፈይሳ አዱኛ ፈኖ ፈይሳዳ ኒማቲ
ሁንዱፍቲ /2/
65ፈኖ ኬተኒ (በመስቀልከ ርድአነ)

VERSE 4
ፈኖ ኬተኒ ኑገርጋሪ /2/
ሁምና ኬተኒ ሲከደና /2/
66ፈኖ ኢፋ መስቀል አብርሃነ )
ፈኖ ኢፋ ኡርጂዳኒ ዋቃ በሬቼ ኢትዮጵያ /2/

VERSE 5
ሁንዱ መራ ዋቀዮ አአዱ አገርሲሳዳ /2/
67.ኤዮ ፈኖዳኒ (ጸኸ በመስቀልከ )
ኤዮ ፈኖዳኒ ኤዮ ዱንና ኤብሴቴ /2/
ኤዮ ፈኖዳኒ ኤዮ ዱአዋና ናሰቴ

VERSE 6
ኤዮን ነማረከቴ ፈኖዳኒ ኒቀርቃርቴ /2/
68እም ገቦ
አምገቦከ ውጊዘ ነቅዓ ማይ - ዘቀደሶ
ለፈያታይ/ሪ2/

VERSE 7
ለነዳይ ምስካይ መስቀልከ አግዚኦ ለነዳይ
ምስካይ
የወርፃ ጽጌ መዝሙራት
69. ርፃበ ወጽምአ

VERSE 8
ርሃበ ወጽምዓ አዘክሪ ድንግል ርዛበ ወጽምዓ /2/
ምንዳቤ ኀዘን አዘክሪ ድንግል /2/', 'kuni fenoni gadisada qorchada /2/
6]. arsatu agersisie (beexan anፀዐre)
arsatu agersisie (4
golgotati argemie fenon waqeyo /qie

VERSE 1
62.kotalala (reyu ዕbeyu )
kotalala feno waqeyo rajisa /2/
jewamani niargeni guri ineniegnፄ nidegani dukuba goga
niqulqula /2/

VERSE 2
63.fenora (bemesqelu webeqalu)
fenora buieto /2/
fenosatin hundafa ibsie /4
6fa4feno ifa (mesqel brሃn rejmu

VERSE 3
)
)
feno ifa adugna hundafi buhurada welda kiegnafi /2/
negei kiegnada feysa adugna feno feysada nimati

VERSE 4
hundufti /2/
65feno kieteni (bemesqelke rdane)
feno kieteni nugergari /2/
humna kieteni sikedena /2/

VERSE 5
66feno ifa mesqel abrሃne )
feno ifa urjidani waqa beriechie ityophya /2/
hundu mera waqeyo aadu agersisada /2/
67.ieyo fenodani (tseኸ bemesqelke )

VERSE 6
ieyo fenodani ieyo dunna iebsietie /2/
ieyo fenodani ieyo duawana nasetie
ieyon nemareketie fenodani niqerqartie /2/
68em gebo

VERSE 7
amgeboke wgize neqዓ may - zeqedeso
lefeyatay/ri2/
leneday mskay mesqelke agzio leneday
mskay

VERSE 8
yewerፃ tsgie mezmurat
69. rፃbe wetsma
rሃbe wetsmዓ azekri dngl rzabe wetsmዓ /2/
mndabie ኀzen azekri dngl /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-r-bunna-xmun-chgrunna-zenun', 'ትርጉም፡- ርፃሃቡንና ጥሙን ችግሩንና ሐዘኑን', 'ትርጉም፡- ርፃሃቡንና ጥሙን ችግሩንና ሐዘኑን', 'trgum፡- rፃሃbunna xmun chgrunna ሐzenun', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- ርፃሃቡንና ጥሙን ችግሩንና ሐዘኑን', 'አመቤታችን አሳስቢልን
70. እስከ ማአዜኑ
አስከ ማዕዜኑ አግዝእትየ ውስተ ምድረ ነኪር ትሄፄልዊ
ገሊላ አትዊ /4 ሀገረኪ ገሊላ እትዊ /2/

VERSE 1
ተርጉም፡- አስከ መቼ ድረስ አመቤቴ ሆይ
በባዕድ ሀገር ትኖሪያለሽ ወደ
ሀገርሽ /ቴ/ ወደ ገሊላ ግቢ፡፡:
71. ተፈጸመ

VERSE 2
ተፈጸመ ማኅሌተ ጽጌ ስሙር /2/
ንግሥተ ሰማይ /3/ ወምድር /ቁ', 'amebietachn asasbiln
70. eske maazienu
aske maዕzienu agzetye wste mdre nekir theፄlwi
/2/

VERSE 1
/2/
gelila atwi /4 hagereki gelila etwi /2/
tergum፡- aske mechie dres amebietie hoy
bebaዕd hager tnoriyalesh wede

VERSE 2
hagersh /tie/ wede gelila gbi፡፡:
71. tefetseme
tefetseme maኅliete tsgie smur /2/
ngሥte semay /3/ wemdr /qu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kemikaielna-kegebriel-gar-ney', 'ከሚካኤልና ከገብርኤል ጋር ነይ፡፡', 'ከሚካኤልና ከገብርኤል ጋር ነይ፡፡', 'kemikaielna kegebriel gar ney፡፡', 'Ethiopian Orthodox Tewahedo Mezmur - ከሚካኤልና ከገብርኤል ጋር ነይ፡፡', '76. አክሊለ ጽጌ
አክሊለ ጽጌ ማርያም ቀጸላ
መንግስቱ ለጊዮርጊስ /2/
ክበበ ጌራ ወርቅ /2/ አክሊለ ፅጌ /4', '76. aklile tsgie
aklile tsgie maryam qetsela
mengstu legiyorgis /2/
kbebe giera werq /2/ aklile ፅgie /4', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kemikaielna-kegebriel-gar', 'ከሚካኤልና ከገብርኤል ጋር', 'ከሚካኤልና ከገብርኤል ጋር', 'kemikaielna kegebriel gar', 'Ethiopian Orthodox Tewahedo Mezmur - ከሚካኤልና ከገብርኤል ጋር', '82. ምንም ሳትበድል
ምንም ሳትበድል ኃጢአት ሳይኖርባት
አንድዬ ልጂን ሄሮድስ ሊገድልባት
ሀገር እንደሌለው ከሀገር ሲያሳድዳት ምን በድላ ይሆን

VERSE 1
ምን ኃጢአት ኖሮባት', '82. mnm satbedl
mnm satbedl ኃxiat saynorbat
andyie ljin herods ligedlbat
hager endelielew kehager siyasaddat mn bedla yhon

VERSE 1
mn ኃxiat norobat', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeadam-medagna-dngl-maryam', 'የአዳም መዳኛ ድንግል ማርያም', 'የአዳም መዳኛ ድንግል ማርያም', 'yeadam medagna dngl maryam', 'Ethiopian Orthodox Tewahedo Mezmur - የአዳም መዳኛ ድንግል ማርያም', 'አንድ ልጂን ይዛ ዞረች በዓለም ''/2/
ሄድሮስ ምቀኛ የዲያብሎስ ወዳጅ
ሊገድለው አስቦ የድንግልን ልጅ
መቼ ለእርሷ አዘነ ጨከነባት እንጂ

VERSE 1
ስትሆን ለፍጥረት የዓለም አማላጅ', 'and ljin yza zorech beዓlem ''/2/
hedros mqegna yediyablos wedaj
ligedlew asbo yedngln lj
mechie leersua azene cekenebat enji

VERSE 1
sthon lefxret yeዓlem amalaj', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abiet-mekerash-abiet-sdetsh', 'አቤት መከራሽ አቤት ስደትሽ', 'አቤት መከራሽ አቤት ስደትሽ', 'abiet mekerash abiet sdetsh', 'Ethiopian Orthodox Tewahedo Mezmur - አቤት መከራሽ አቤት ስደትሽ', 'አኔ ልካፈለው ወራዳው ልጅሽ
መሰደድ ያለብኝ አኔ ነበርኩኝ
የእግዚአብሔርን ትአዛዝ የተላለፍኩኝ', 'anie lkafelew weradaw ljsh
meseded yalebgn anie neberkugn
yeegziabሔrn tazaz yetelalefkugn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('le-xan-ako-letsadqan', 'ለኃጥአን አኮ ለጻድቃን »', 'ለኃጥአን አኮ ለጻድቃን »', 'leኃxan ako letsadqan »', 'Ethiopian Orthodox Tewahedo Mezmur - ለኃጥአን አኮ ለጻድቃን »', 'ለኃጥአን አኮ ለጻድቃን »
ለኃጥአን አኮ ለጻድቃን »
ለኃጥአን አኮ ለጻድቃን »', 'leኃxan ako letsadqan »
leኃxan ako letsadqan »
leኃxan ako letsadqan »', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('re-lemehonu-endiet-aleqelsh', 'ኸረ ለመሆኑ እንዴት አለቀልሽ', 'ኸረ ለመሆኑ እንዴት አለቀልሽ', 'ኸre lemehonu endiet aleqelsh', 'Ethiopian Orthodox Tewahedo Mezmur - ኸረ ለመሆኑ እንዴት አለቀልሽ', 'ስትንከራተቺ በረፃውን አቋርጠሸ
ይገሉታል ብለሽ ለልጅሽ አስበሽ
በሔሮድስ ዘመን መከራሽን አየሽ /2/', 'stnkeratechi bereፃwn aquarxeshe
ygelutal blesh leljsh asbesh
beሔrods zemen mekerashn ayesh /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lempi-talaq-sxotayie', 'ለምፒ ታላቅ ስጦታዬ', 'ለምፒ ታላቅ ስጦታዬ', 'lempi talaq sxotayie', 'Ethiopian Orthodox Tewahedo Mezmur - ለምፒ ታላቅ ስጦታዬ', '› አዛኝ ሩኅሩኅ ነሽ
» የጌታዬ እናት
» ጸጋን የተሞላሽ
» የአምላክ ማደሪያ

VERSE 1
» ለምነሽ አስምሪን
» አማናዊት ጽዮን
› ከእኔ አትለይኝ
ለምፒ ታላቅ ስጦታዬ

VERSE 2
› አዛኝ እሩሩ ነሽ
» የጌታዬ እናት
» ጸጋን የተሞላሽ
» የአምላክ ማደርያ

VERSE 3
» ለምነሽ አስምሪን
» አማናዊት ጽዮን
› ከአኔ አትለይኝ', '› azagn ruኅruኅ nesh
» yegietayie enat
» tsegan yetemolash
» yeamlak maderiya

VERSE 1
» lemnesh asmrin
» amanawit tsyon
› keenie atleygn
lempi talaq sxotayie

VERSE 2
› azagn eruru nesh
» yegietayie enat
» tsegan yetemolash
» yeamlak maderya

VERSE 3
» lemnesh asmrin
» amanawit tsyon
› keanie atleygn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('me-za-afewat', 'መዓዛ አፈዋት', 'መዓዛ አፈዋት', 'meዓza afewat', 'Ethiopian Orthodox Tewahedo Mezmur - መዓዛ አፈዋት', 'መዓዛ አፈዋት ማርያም /2/ ጽጌ መንግሥት
ቡርክት /2/
ጽጌ ጽጌ ዘሰሎሞን ወዳዊት አብርሐ ወአጽብሐ', 'meዓza afewat maryam /2/ tsgie mengሥt
burkt /2/
tsgie tsgie zeselomon wedawit abrሐ weatsbሐ
/2/

VERSE 1
/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('anze-teaqefiyo-wereb', 'አንዘ ተአቀፊዮ (ወረብ)', 'አንዘ ተአቀፊዮ (ወረብ)', 'anze teaqefiyo (wereb)', 'Ethiopian Orthodox Tewahedo Mezmur - አንዘ ተአቀፊዮ (ወረብ)', 'አንዘ ተዓቀፊየ ለሕፃንኪ ጽጌ ጸዓዳ ወቀይሕ /2/
ንዒ ርግብየ ምስለ ገብርኤል ንዒ ሠናይትየ ምስለ
ሜካኤል /2/', 'anze teዓqefiye leሕፃnki tsgie tseዓda weqeyሕ /2/
nዒ rgbye msle gebriel nዒ ሠnaytye msle
miekaiel /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('10-tmesl-emki', '10[ትመስል እምኪ', '10[ትመስል እምኪ', '10[tmesl emki', 'Ethiopian Orthodox Tewahedo Mezmur - 10[ትመስል እምኪ', 'ትመስል እምኪ ማርያም ዕለተ ሣልስተ
ወርሀብአእተ ትመስል እምኪ /2/
ዘወለደት ጽጌ /3/ ወፀሐየ ዓለም', 'tmesl emki maryam ዕlete ሣlste
werhabaete tmesl emki /2/
zeweledet tsgie /3/ weፀሐye ዓlem', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amebietie-yeamlak-enat', 'አመቤቴ የአምላክ እናት', 'አመቤቴ የአምላክ እናት', 'amebietie yeamlak enat', 'Ethiopian Orthodox Tewahedo Mezmur - አመቤቴ የአምላክ እናት', 'አመቤቴ የአምላክ እናት
ላመስግንሽ ቀን ከሌሊት
ለልጅሽም ክብር ውዳሴ
ታቀርባለች ዘወትር ነፍሴ /2/', 'amebietie yeamlak enat
lamesgnsh qen kelielit
leljshm kbr wdasie
taqerbalech zewetr nefsie /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lbie-tene-teqegne-lekbrsh', 'ልቤ ተነሣሣ ተቀኘ ለክብርሽ', 'ልቤ ተነሣሣ ተቀኘ ለክብርሽ', 'lbie teneሣሣ teqegne lekbrsh', 'Ethiopian Orthodox Tewahedo Mezmur - ልቤ ተነሣሣ ተቀኘ ለክብርሽ', 'በፍጹም ትኅትና ሊያመሰግንሽ
ጽዮን መጠጊያ ነሽ የአብርፃም ድንኳን
የታጠረች ተክል አመብርዛን
የለመለመች መስክ አምላክ የመረጣት

VERSE 1
የጽላቱ ኪዳን ታቦቱ ድንግል ናት
የሰማይ የምድር ንግሥት ናትና
ክብር ይገባታል ዘወትር ጠዋት ማታ
አደራሽን ማርያም የሁሉ እናት

VERSE 2
በምልጃሽ አስቢኝ ኋላ ስራቆት
ያንን የአሳት ባሕር አሻግሪኝ ድንግል ሆይ
አንዳልወድቅ እንዳልሞት ከቶ እንዳላይ ስቃይ', 'beftsum tኅtna liyamesegnsh
tsyon mexegiya nesh yeabrፃm dnkuan
yetaxerech tekl amebrzan
yelemelemech mesk amlak yemerexat

VERSE 1
yetslatu kidan tabotu dngl nat
yesemay yemdr ngሥt natna
kbr ygebatal zewetr xewat mata
aderashn maryam yehulu enat

VERSE 2
bemljash asbign huala sraqot
yann yeasat baሕr ashagrign dngl hoy
andalwedq endalmot keto endalay sqay', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tmesli-demena-wetwelda-bsete-mena', 'ትመስሊ ደመና ወትወልዳ ሕብሰተ መና', 'ትመስሊ ደመና ወትወልዳ ሕብሰተ መና', 'tmesli demena wetwelda ሕbsete mena', 'Ethiopian Orthodox Tewahedo Mezmur - ትመስሊ ደመና ወትወልዳ ሕብሰተ መና', 'መታገምሪ ጥኢና
ትመስሊ ደመና ወትወልዳ ሕብሰተ መና መታገም
ጥኢና', 'metagemri xina
tmesli demena wetwelda ሕbsete mena metagem
xina', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('leab-mer-tu-leweldu-weladitu-lemenfes-qdus', 'ለአብ መርዓቱ ለወልዱ ወላዲቱ ለመንፈስ ቅዱስ', 'ለአብ መርዓቱ ለወልዱ ወላዲቱ ለመንፈስ ቅዱስ', 'leab merዓtu leweldu weladitu lemenfes qdus', 'Ethiopian Orthodox Tewahedo Mezmur - ለአብ መርዓቱ ለወልዱ ወላዲቱ ለመንፈስ ቅዱስ', 'ጽርሐ ቤቱ
ለአብ መርዓቱ ለወልዱ ወላዲቱ ለመንፈስ ቅዱስ
ጽርሐ ቤቱ', 'tsrሐ bietu
leab merዓtu leweldu weladitu lemenfes qdus
tsrሐ bietu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nu-des-ybelen', 'ኑ ደስ ይበለን', 'ኑ ደስ ይበለን', 'nu des ybelen', 'Ethiopian Orthodox Tewahedo Mezmur - ኑ ደስ ይበለን', 'ኑ ደስ ይበለን በአምላካችን /2/
አማኑኤል ሰምቷል ልመናችንን ኸኸ
ደስ ይበለን /2/', 'nu des ybelen beamlakachn /2/
amanuiel semtual lmenachnn ኸኸ
des ybelen /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-ma-dere-sb-t-bedebremed-nit', 'ትርጉም፡- ማኅደረ ስብሐት በደብረመድኃኒት', 'ትርጉም፡- ማኅደረ ስብሐት በደብረመድኃኒት', 'trgum፡- maኅdere sbሐt bedebremedኃnit', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- ማኅደረ ስብሐት በደብረመድኃኒት', 'በአግዚአብሔር ፈቃድ ይህ
ሁሉ ነገር ሆነ
114 እግዚአብሔር ይመስገን
አግዚአብሔር ይመስገን ይህቺን ቀን ቀድሶ

VERSE 1
የሠጠን /2/
ከእያለንበት ሰብስቦ /2/ ለዚህ ያደረሰን /4
115ቆ.አሳተ ጽሩህ
አሳተ ጽሩህ ማየ ጠፈሩ /2/

VERSE 2
ደመና መንኮራኩሩ ለመድኃኔዓለም /4', 'beagziabሔr feqad yh
hulu neger hone
114 egziabሔr ymesgen
agziabሔr ymesgen yhchin qen qedso

VERSE 1
yeሠxen /2/
keeyalenbet sebsbo /2/ lezih yaderesen /4
115qo.asate tsruh
asate tsruh maye xeferu /2/

VERSE 2
demena menkorakuru lemedኃnieዓlem /4', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-lb-yemiyasbewn-kemasebu-befit', 'ትርጉም፡- ልብ የሚያስበውን ከማሰቡ በፊት', 'ትርጉም፡- ልብ የሚያስበውን ከማሰቡ በፊት', 'trgum፡- lb yemiyasbewn kemasebu befit', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- ልብ የሚያስበውን ከማሰቡ በፊት', 'የሚውያቅ አግዚአብሔር ኃይሉን
አየን አየን በጎ ሥራን በላያችን
ላይ ገለጠ (አሣየ)', 'yemiwyaq agziabሔr ኃylun
ayen ayen bego ሥran belayachn
lay gelexe (aሣye)', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-yalan-yal-2-l-l-agziab-r-2', 'የኃያላን ኃያል /2/ ልዑል አግዚአብሔር /2/', 'የኃያላን ኃያል /2/ ልዑል አግዚአብሔር /2/', 'yeኃyalan ኃyal /2/ lዑl agziabሔr /2/', 'Ethiopian Orthodox Tewahedo Mezmur - የኃያላን ኃያል /2/ ልዑል አግዚአብሔር /2/', 'የኃያላን ኃያል /2/ ልዑል አግዚአብሔር /2/
ተአምራተ ብዙ በሰማይ /2/ በምድር /#
ለአብና ለወልድ /2/ ለመንፈስቅዱስ /2/
መስገድ ይገባናል በሥጋ /2/ በነፍስ /4

VERSE 1
ለአግዝእትነ ማርያም /2/ ለአምላክ እናት /2/
መስገድ ይገባናል የጸጋ /2/ ስግደት /2/
ለጻድቁ አባት /2/ ለተክለሃይማኖት /2/
መስገድ ይገባናል የጸጋ /2/ ስግደት /2/

VERSE 2
ለጻድቁ አባት /2/ ለአቡነ አረጋዊ /2/
መስገድ ይገባናል የጸጋ /2/ ስግደት /ቄ
1ዐ96.ንአ ንአ አማኑኤል
ንአ ንአ አማኑኤል ንአ ንአ መድኃኔዓለም

VERSE 3
በፍሥሐ ወበሰላም ና ወደ አኛ መድኃኔዓለም', 'yeኃyalan ኃyal /2/ lዑl agziabሔr /2/
teamrate bzu besemay /2/ bemdr /#
leabna leweld /2/ lemenfesqdus /2/
mesged ygebanal beሥga /2/ benefs /4

VERSE 1
leagzetne maryam /2/ leamlak enat /2/
mesged ygebanal yetsega /2/ sgdet /2/
letsadqu abat /2/ letekleሃymanot /2/
mesged ygebanal yetsega /2/ sgdet /2/

VERSE 2
letsadqu abat /2/ leabune aregawi /2/
mesged ygebanal yetsega /2/ sgdet /qie
1ዐ96.na na amanuiel
na na amanuiel na na medኃnieዓlem

VERSE 3
befሥሐ webeselam na wede agna medኃnieዓlem', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemesqelu-webeqalu', 'በመስቀሉ ወበቃሉ', 'በመስቀሉ ወበቃሉ', 'bemesqelu webeqalu', 'Ethiopian Orthodox Tewahedo Mezmur - በመስቀሉ ወበቃሉ', 'በመስቀሉ ወበቃሉ /2/
አዕበዮሙ ለአበዊነ /4
ትርጉም፣ በመስቀሉ ቃል
አባቶቻችንን ከፍ አረደጋቸው', 'bemesqelu webeqalu /2/
aዕbeyomu leabewine /4
trgum፣ bemesqelu qal
abatochachnn kef aredegachew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('selam-lezkre-mke', 'ሰላም ለዝክረ ሥምከ', 'ሰላም ለዝክረ ሥምከ', 'selam lezkre ሥmke', 'Ethiopian Orthodox Tewahedo Mezmur - ሰላም ለዝክረ ሥምከ', 'ሰላም ሰላም ለዝክረ ስምከ /2/
ጥዑመ ዜና /6'' መድኃኔዓለም ጥዑመ ዜና /2/
ትርጉም፣፤፣ ጥሩ ጣፋጭ ነገርን ለሆነው
ስምህ ሰላም ይሁን', 'selam selam lezkre smke /2/
xዑme ziena /6'' medኃnieዓlem xዑme ziena /2/
trgum፣፤፣ xru xafac negern lehonew
smh selam yhun', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('egziab-r-brzaneniena', '.. እግዚአብሔር ብርዛነኔና', '.. እግዚአብሔር ብርዛነኔና', '.. egziabሔr brzaneniena', 'Ethiopian Orthodox Tewahedo Mezmur - .. እግዚአብሔር ብርዛነኔና', 'አግዚአብሔር ብርሃኔና መድኃኒቴ ነው /2/
የሚያስደነግጠኝ የሚያስፈራኝ ማን ነው /2/
አምላኬ መመኪያዬ ነው /2/', 'agziabሔr brሃniena medኃnitie new /2/
yemiyasdenegxegn yemiyasferagn man new /2/
amlakie memekiyayie new /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('med-nie-lem-krstos-beqeranyo-squl-2', 'መድኃኔዓለም ክርስቶስ በቀራንዮ ስቁል /2/', 'መድኃኔዓለም ክርስቶስ በቀራንዮ ስቁል /2/', 'medኃnieዓlem krstos beqeranyo squl /2/', 'Ethiopian Orthodox Tewahedo Mezmur - መድኃኔዓለም ክርስቶስ በቀራንዮ ስቁል /2/', 'በለኒ መሐርኩከ በለኒ መሐርኩኪ /2/
በእንተ ማርያም ድንግል እስመ /2/
ሔር አልቦ አእንበሌከ ቃል /2/', 'beleni meሐrkuke beleni meሐrkuki /2/
beente maryam dngl esme /2/
ሔr albo aenbelieke qal /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('156sefiho-knefehu', '156ሰፊሆ ክነፈሁ', '156ሰፊሆ ክነፈሁ', '156sefiho knefehu', 'Ethiopian Orthodox Tewahedo Mezmur - 156ሰፊሆ ክነፈሁ', 'ሰፊሆ ክነፈሆ /2/
ክንፈሆ ይጸልል ዲቤነ /2/
ተርጉም፣ ክንፉን ዘርግቶ እኛን ይጋደን ይጠብቀን
157ከመትባርከነ

VERSE 1
ከመትባርከነ በመስቀልከ ዘወርቅ /2/
ተዋነይ በጽድቅ /ቴ ሚካኤል ሐመልማል ወርቅ /2/
ተትርጉም፣ የወርቅ ሐመልማል ሚካኤል ሆይ በወርቅ
መስቀልህ ትባርከን ዘንድ በአውነት

VERSE 2
በመካከላችን ተገኝ
158ሐመልማለ ወርቅ
ሐመልማለ ወርቅ /6/
ሜካኤል /3/ ሐመልማለ ወርቅ /2/

VERSE 3
159.ባሕራንኒ
ባሕራንኒ ይቤ ዘነገደ ባሕር /2/
ርኢኩዎ /2/ ለሚካኤል ወስእንኩ ጠይቆ /2/
ትርጉም፣ ባሕርን አቋርጦ የሄደ ባህራን

VERSE 4
ሚካኤልን ለይቼ መረዳት ተሳነኝ አለ፡፡', 'sefiho knefeho /2/
knfeho ytsell dibiene /2/
tergum፣ knfun zergto egnan ygaden yxebqen
157kemetbarkene

VERSE 1
kemetbarkene bemesqelke zewerq /2/
tewaney betsdq /tie mikaiel ሐmelmal werq /2/
tetrgum፣ yewerq ሐmelmal mikaiel hoy bewerq
mesqelh tbarken zend beawnet

VERSE 2
bemekakelachn tegegn
158ሐmelmale werq
ሐmelmale werq /6/
miekaiel /3/ ሐmelmale werq /2/

VERSE 3
159.baሕranni
baሕranni ybie zenegede baሕr /2/
rikuwo /2/ lemikaiel wesenku xeyqo /2/
trgum፣ baሕrn aquarxo yehede bahran

VERSE 4
mikaieln leychie meredat tesanegn ale፡፡', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mikaiel-mets-yrdane-weyad-nene-2', 'ሚካኤል መጽዓ ይርድአነ ወያድኅነነ /2/', 'ሚካኤል መጽዓ ይርድአነ ወያድኅነነ /2/', 'mikaiel metsዓ yrdane weyadኅnene /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሚካኤል መጽዓ ይርድአነ ወያድኅነነ /2/', 'ተፈኒዎ /2/ እምአርያም /2/ ከመ ያድኅነነ /2/
ትርጉም፣ ሚካኤል መጣ ሊረዳን ሊያድነን /2/
ተልኮ /2/ ከሰማይ /2/ እኛን ሊያድነን /2/
169. ዘአውረድከ መና', 'tefeniwo /2/ emaryam /2/ keme yadኅnene /2/
trgum፣ mikaiel mexa liredan liyadnen /2/
telko /2/ kesemay /2/ egnan liyadnen /2/
169. zeawredke mena', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tewekef-tselotene', 'ተወከፍ ጸሎተነ', 'ተወከፍ ጸሎተነ', 'tewekef tselotene', 'Ethiopian Orthodox Tewahedo Mezmur - ተወከፍ ጸሎተነ', 'ተወከፍ ጸሎተነ ውስተ ኑኃ ሰማይ /2/
ከመ መዓዛ ሠናይ /4 ሊቀ መላእክት /2/
ትርጉም፣', 'tewekef tselotene wste nuኃ semay /2/
keme meዓza ሠnay /4 liqe melaekt /2/
trgum፣', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdus-mikaiel', '.ቅዱስ ሚካኤል', '.ቅዱስ ሚካኤል', '.qdus mikaiel', 'Ethiopian Orthodox Tewahedo Mezmur - .ቅዱስ ሚካኤል', 'ቅዱስ ሚካኤል መልአከ ልዑል /2/
መኑ ከመ አግዚአብሔር ሜካኤል ኃይል /#
ትርጉም፣ የልዑል መልአክ ቅዱስ ሚካኤል
የስምህ ትርጓሜ ማን

VERSE 1
አንደ አግዚአብሔር ነው', 'qdus mikaiel melake lዑl /2/
menu keme agziabሔr miekaiel ኃyl /#
trgum፣ yelዑl melak qdus mikaiel
yesmh trguamie man

VERSE 1
ande agziabሔr new', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('fqrn-adlen-m-ret-qdus-mikaiel', 'ፍቅርን አድለን ምሕረት ቅዱስ ሚካኤል', 'ፍቅርን አድለን ምሕረት ቅዱስ ሚካኤል', 'fqrn adlen mሕret qdus mikaiel', 'Ethiopian Orthodox Tewahedo Mezmur - ፍቅርን አድለን ምሕረት ቅዱስ ሚካኤል', 'ፍቅርን አድለን ምሕረት ቅዱስ ሚካኤል
ፍቅርን አድለን ምሕረት ቅዱስ ሚካኤል
ፍቅርን አድለን ምሕረት ቅዱስ ሚካኤል የእኛ
አባት /2/

VERSE 1
ፍቅርን አድለን ምሕረት ቅዱስ ሚካኤል
ፍቅርን አድለን ምሕረት ቅዱስ ሚካኤል', 'fqrn adlen mሕret qdus mikaiel
fqrn adlen mሕret qdus mikaiel
fqrn adlen mሕret qdus mikaiel yeegna
abat /2/

VERSE 1
fqrn adlen mሕret qdus mikaiel
fqrn adlen mሕret qdus mikaiel', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mikaiel-amalden', 'ሚካኤል አማልደን', 'ሚካኤል አማልደን', 'mikaiel amalden', 'Ethiopian Orthodox Tewahedo Mezmur - ሚካኤል አማልደን', 'ሚካኤል አማልደን ከአምላካችን /2/
አንዳንጠፋ እንዳንሞት በነፍሳችን
አደራህን አማልደን ከአምላካችን', 'mikaiel amalden keamlakachn /2/
andanxefa endanmot benefsachn
aderahn amalden keamlakachn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-beqejim-begrawam-yezeyt-caf-yalat', 'ትርጉም፡- በቀጂም በግራዋም የዘይት ጫፍ ያላት', 'ትርጉም፡- በቀጂም በግራዋም የዘይት ጫፍ ያላት', 'trgum፡- beqejim begrawam yezeyt caf yalat', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡- በቀጂም በግራዋም የዘይት ጫፍ ያላት', 'የመብራት መቅረዝ
ዘካርያስ አየ ነቢያትና ሐዋርያት
በውስጧ ደስ ይላቸዋል
ዳዊትም በውስጧ ያመሰግናል', 'yemebrat meqrez
zekaryas aye nebiyatna ሐwaryat
bewsxua des ylachewal
dawitm bewsxua yamesegnal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yekidan-lat', 'የኪዳን ፅላት', 'የኪዳን ፅላት', 'yekidan ፅlat', 'Ethiopian Orthodox Tewahedo Mezmur - የኪዳን ፅላት', 'የኪዳን ፅላት የተሠወረ መና ያለብሽ ደብተራ
ድንኳን አንቺ ነሽ /2/
ይህውም መና የተባለው. /2/- በድንግል', 'yekidan ፅlat yeteሠwere mena yalebsh debtera
dnkuan anchi nesh /2/
yhwm mena yetebalew. /2/- bedngl', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tabote-ente-wstieta', 'ታቦተ እንተ ውስቴታ', 'ታቦተ እንተ ውስቴታ', 'tabote ente wstieta', 'Ethiopian Orthodox Tewahedo Mezmur - ታቦተ እንተ ውስቴታ', 'ታቦተ እንተ ውስቴታ ኦሪት እንተ ውስቴታ
ውቱረ ይኬልልዋ በወርቅ ውቱረ ይኬልልዋ
በወርቅ ይኬልልዋ', 'tabote ente wstieta orit ente wstieta
/2/
/2/
wture ykiellwa bewerq wture ykiellwa

VERSE 1
bewerq ykiellwa', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bef-webeselam', 'በፍሥሐ ወበሰላም', 'በፍሥሐ ወበሰላም', 'befሥሐ webeselam', 'Ethiopian Orthodox Tewahedo Mezmur - በፍሥሐ ወበሰላም', 'በፍሥሐ /2/ ወበሰላም/ሪ2/
ወረደ ወልድ/4/ ወልድ ውስተ ምጥማቃት
ትርጉም፡ ወልድ ክርስቶስ
ሊጠመቅ ወደ ወንዝ ወረደ', 'befሥሐ /2/ webeselam/ri2/
werede weld/4/ weld wste mxmaqat
trgum፡ weld krstos
lixemeq wede wenz werede', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wetemeslo', 'ወተመስሎ', 'ወተመስሎ', 'wetemeslo', 'Ethiopian Orthodox Tewahedo Mezmur - ወተመስሎ', 'ወተመስሎ ስብአ ዓይን አባግዓ ላባ ወማይ/2/
ወጥምቀተ አባይ/2/ አባይ/2/
መጥምቀተ አባይ /2/
ትርጉም፡ ውኃን የጠጡ የላባ በጎች ምልክትን

VERSE 1
አይተው አንድ እንደሆኑ በጥምቀት አንድ ሆኑ
ለተባሉ ለዛሬዎቹም ምዕመናን ምሳሌ ሆኑ
226.ክርስቶስ ተወልደ
ክርስቶስ ተወልደ አሰይ

VERSE 2
ክርስቶስ ተጠምቀ በማይ /2/
ወለደነ ዳግመ አማይ /2/
ደግመ /2/ ወለደነ ዳግመ አማይ /2', 'wetemeslo sba ዓyn abagዓ laba wemay/2/
wexmqete abay/2/ abay/2/
mexmqete abay /2/
trgum፡ wኃn yexexu yelaba begoch mlktn

VERSE 1
aytew and endehonu bexmqet and honu
letebalu lezariewochum mዕmenan msalie honu
226.krstos tewelde
krstos tewelde asey

VERSE 2
krstos texemqe bemay /2/
weledene dagme amay /2/
degme /2/ weledene dagme amay /2', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemn-asalfo-yeminor-semayawi', 'ዓለምን አሳልፎ የሚኖር ሰማያዊ', 'ዓለምን አሳልፎ የሚኖር ሰማያዊ', 'ዓlemn asalfo yeminor semayawi', 'Ethiopian Orthodox Tewahedo Mezmur - ዓለምን አሳልፎ የሚኖር ሰማያዊ', 'ክርስቶስ በምድራዊ እጅ ተጠመቀ
231.እንዘስውር
እንዘስውር እምኔነ ይአዜሰ ክሱተ ኮነ /2/
ተአምረ ወመንክር ገብረ መድኃኒነ በቃና /2/

VERSE 1
ዘገሊላ ከብካበ ኮነ ማየ ረስየ ወይነ', 'krstos bemdrawi ej texemeqe
231.enzeswr
enzeswr emniene yaziese ksute kone /2/
teamre wemenkr gebre medኃnine beqana /2/

VERSE 1
zegelila kebkabe kone maye resye weyne', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ngu-eregnoch-ayut', 'ንጉሥ እረኞች አዩት', 'ንጉሥ እረኞች አዩት', 'nguሥ eregnoch ayut', 'Ethiopian Orthodox Tewahedo Mezmur - ንጉሥ እረኞች አዩት', 'መላአክትም አመሰገኑት
236.ስብሐት ለእግዚአብሔር
ስብሐት ለእግዚአብሔር በሰማያት
ወበሰላም በምድር ስምረቱ ለሰብእአ/2/

VERSE 1
ሃሌሉያ/3/ አሜን ሃሌሉያ', 'melaaktm amesegenut
236.sbሐt leegziabሔr
sbሐt leegziabሔr besemayat
webeselam bemdr smretu lesebea/2/

VERSE 1
ሃlieluya/3/ amien ሃlieluya', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('andetenagerew-dawit-betnbitu', 'አንደተናገረው ዳዊት በትንቢቱ', 'አንደተናገረው ዳዊት በትንቢቱ', 'andetenagerew dawit betnbitu', 'Ethiopian Orthodox Tewahedo Mezmur - አንደተናገረው ዳዊት በትንቢቱ', 'አንደምናነበው በወንጌል ተጽፎ
መንፈስቅዱስ ታየ በራሱ ላይ አርፎ
በርግብ ምሳሌ ክንፋን አሰይፎ', 'andemnanebew bewengiel tetsfo
menfesqdus taye berasu lay arfo
bergb msalie knfan aseyfo', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ayemesekere-yeljun-gietnet', 'አየመሰከረ የልጁን ጌትነት', 'አየመሰከረ የልጁን ጌትነት', 'ayemesekere yeljun gietnet', 'Ethiopian Orthodox Tewahedo Mezmur - አየመሰከረ የልጁን ጌትነት', 'ባሕር ስትጨነቅ ተራራው ሲጨፍር
ሰማይ ሲከፍት ደመናው ሲናገር
ዓለም በዛሬው ቀን አየች ይህን ምስጢር
247.የምስራች', 'baሕr stceneq teraraw sicefr
semay sikeft demenaw sinager
ዓlem bezariew qen ayech yhn msxir
247.yemsrach', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlak-texemeqe-lihonen-ar-ya-2', 'አምላክ ተጠመቀ ሊሆነን አርዓያ/2/', 'አምላክ ተጠመቀ ሊሆነን አርዓያ/2/', 'amlak texemeqe lihonen arዓya/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አምላክ ተጠመቀ ሊሆነን አርዓያ/2/', 'አምላክ ተጠመቀ ከዚህ ሁሉ ክብሩ
ስለእኛ ነውና እንዘምር ዘምሩ
ከድንግል ተወለዶ ወልድ ሲጠመቅ
ተራሮች ዘለሉ ዮሐንስ ሲያጠምቅ

VERSE 1
ዮርዳኖስም ሸሸ አልቆመም ከፊቱ
ወልድ አምላክነቱ በግልጽ መታየቱ
ከገሊላ ወንዝ ወደ ዮርዳኖስ
ሊጠመቅ ወደደ በአደ ዮሐንስ

VERSE 2
አንዴት ይቻለኛል አንተ ለማጥመቅ
ብሎ መለሰለት ዮሐንስ መጥምቅ
248ደስ ይበለን
የምስራች ደስ ይበለን/2/

VERSE 3
የዓለም መደኃኒት ተወለደልን/2/
የምስራች ደስ ይበለን
አዳም ሆይ ደስ ይበለህ
የዓለም መድኃኒት ተወለደልህ

VERSE 4
ሔዋን ሆይ ደስ ይበልሽ
የዓለም መድኃኒት ተወለደልሽ
ሰብአ ሰገል እንደታዘዙት /2/
በኮከብ ተመርተው ሕፃኑን አገኙት

VERSE 5
ሰግዱለት ከመሬት ወድቀው
ወርቅ እጣኑን ከርቤ በረከቱን ሰጥተው
ንጉሥ ፄሮድስ ይህንን ሲሰማ', 'amlak texemeqe kezih hulu kbru
sleegna newna enzemr zemru
kedngl teweledo weld sixemeq
teraroch zelelu yoሐns siyaxemq

VERSE 1
yordanosm sheshe alqomem kefitu
weld amlaknetu beglts metayetu
kegelila wenz wede yordanos
lixemeq wedede beade yoሐns

VERSE 2
andiet ychalegnal ante lemaxmeq
blo meleselet yoሐns mexmq
248des ybelen
yemsrach des ybelen/2/

VERSE 3
yeዓlem medeኃnit teweledeln/2/
yemsrach des ybelen
adam hoy des ybeleh
yeዓlem medኃnit teweledelh

VERSE 4
ሔwan hoy des ybelsh
yeዓlem medኃnit teweledelsh
seba segel endetazezut /2/
bekokeb temertew ሕፃnun agegnut

VERSE 5
segdulet kemeriet wedqew
werq exanun kerbie bereketun sextew
nguሥ ፄrods yhnn sisema', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beziyach-qen-beziyach-wer-lemlem-yeneberew', 'በዚያች ቀን በዚያች ወር ለምለም የነበረው', 'በዚያች ቀን በዚያች ወር ለምለም የነበረው', 'beziyach qen beziyach wer lemlem yeneberew', 'Ethiopian Orthodox Tewahedo Mezmur - በዚያች ቀን በዚያች ወር ለምለም የነበረው', 'አልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምስራች ሰምተው
አልል በይ ቤተልሔም ዛሌ ዛሌ ሉያ
የፍቅር የሰላም ነሽና ገበያ /2/

VERSE 1
ያ ትትት እረኛ ያ ትጉት አባት
ብርሃንን ለበሰ በአኩለ ለሊት
ጥሪ ተልኮለት ከሰማይ ሠራዊት
ለመመልከት በቃ የጌታውን ልደት

VERSE 2
አረኝነት ትንሽ የወራዳ ግብር
ብሎ ሰው በግምት ተናግሮ ነበር
የብዙ ሰው ራስ መሆኑን እረኛ
ክርስቶስ ሲወለድ ተረዳነው አኛ

VERSE 3
250.እስይ ተወለደ
አሰይ ተወለደ የአለም መድሀኒት /3/
ይኸው ተወለደ የአለም መድኃኒት/3/
ትንቢት ተናገሩ ነቢያቱ ሁሉ/3/

VERSE 4
አምላክ ቀዳማዊ ይመጣል እያሉ/3/', 'allta zemeru bedesta temoltew
gieta meweledun yemsrach semtew
all bey bietelሔm zalie zalie luya
yefqr yeselam neshna gebeya /2/

VERSE 1
ya ttt eregna ya tgut abat
brሃnn lebese beakule lelit
xri telkolet kesemay ሠrawit
lememelket beqa yegietawn ldet

VERSE 2
aregnnet tnsh yewerada gbr
blo sew begmt tenagro neber
yebzu sew ras mehonun eregna
krstos siweled teredanew agna

VERSE 3
250.esy tewelede
asey tewelede yealem medhanit /3/
yኸw tewelede yealem medኃnit/3/
tnbit tenageru nebiyatu hulu/3/

VERSE 4
amlak qedamawi ymexal eyalu/3/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeasraiel-ngu-tegeltsoal-be-ga', 'የአስራኤል ንጉሥ ተገልጾአል በሥጋ', 'የአስራኤል ንጉሥ ተገልጾአል በሥጋ', 'yeasraiel nguሥ tegeltsoal beሥga', 'Ethiopian Orthodox Tewahedo Mezmur - የአስራኤል ንጉሥ ተገልጾአል በሥጋ', '254.ተልኮ መቶ
ተልኮ መጥቶ /2/ ገብርኤል/2/
አንዲህ ብሎ አላት ለድንግል/4/
የማሕፀንሽ ፍሬ/2/ ኢየሱስ /2/

VERSE 1
የተባረከ ነው ቅዱስ/4/
255.በክንፉ ጋረዲት', '254.telko meto
telko mexto /2/ gebriel/2/
andih blo alat ledngl/4/
yemaሕፀnsh frie/2/ iyesus /2/

VERSE 1
yetebareke new qdus/4/
255.beknfu garedit', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlakn-lemewled-sletemerexsh', 'አምላክን ለመውለድ ስለተመረጥሽ', 'አምላክን ለመውለድ ስለተመረጥሽ', 'amlakn lemewled sletemerexsh', 'Ethiopian Orthodox Tewahedo Mezmur - አምላክን ለመውለድ ስለተመረጥሽ', 'ድንግልም መልሳ አለችው ለገብርኤል
ወንድ ስለማላውቅ ይህ አንዴት ይሆናል
መሬትም ያለዘር ማፍራት እንደማትችል
አንዴትስ አምጌ የአንተን ቃል ልቀበል', 'dnglm melsa alechw legebriel
wend slemalawq yh andiet yhonal
merietm yalezer mafrat endematchl
andiets amgie yeanten qal lqebel', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('awalde-xiros-amie-ysegda-2-bebietel-m-ri', 'አዋልደ ጢሮስ አሜሃ ይሰግዳ/2/በቤተልሔም//ሪ/', 'አዋልደ ጢሮስ አሜሃ ይሰግዳ/2/በቤተልሔም//ሪ/', 'awalde xiros amieሃ ysegda/2/bebietelሔm//ri/', 'Ethiopian Orthodox Tewahedo Mezmur - አዋልደ ጢሮስ አሜሃ ይሰግዳ/2/በቤተልሔም//ሪ/', '265.ቤዛ ኩሉ
ቤዛ ኩሉ ዓለም ዮም ተወልደ/ሪ2/
ቤዛ ኩሉ ዓለም ዮም ተወልደ/ሪ2/
266.ወነዋ ተወልደ

VERSE 1
ወነዋ ተወልደ መድኃኔዓለም/ሪ2/
ፍሥሐ ለኩሉ ዘየአምን/2/
ወነዋ ተጠምወ መድኃኔዓለም/ሪ2/
ናስሥ ለኩሉ ዘየአምን/ሪ2/

VERSE 2
ትርጉም-
ዛሬ ተወለደ የዓለም መድንኀኒት/2/
ደስታ ነውና ለሚያምኑት/2/
ዛሬ ተጠመቀ የዓለም መድንኀኒት/2/

VERSE 3
ደስታ ነውና ለሚያምኑት/2/
267.ለዘ ተወልደ
ለዘተወልደ እምቅድስት ድንግል ምንተ ንብሎ
ናስተማስሎ ለመድኃኒነ/2/

VERSE 4
አርዌ ገዳምኑ አንበሳ ወሚመ /2/ ከራድዮን/2/
266.ቤዛ ኩሉ
ቤዛ ኩሉ ዓለም ዮም ተጠምዋቀ/ሪ2/
ቤዛ ኩሉ ዓለም ዮም ተጠምቀ/2

VERSE 5
269.ልበዛሬው ጥምቀቱ
በዛሬው ጥምቀቱ አሰይ አሰይ
ተነግሮ አዋጅ አሰይ አሰይ
ነጻነት አገኘን አሰይ አሰይ

VERSE 6
በአግዚአብሔር አብ ልጅ አሰይ እሰይ', '265.bieza kulu
bieza kulu ዓlem yom tewelde/ri2/
bieza kulu ዓlem yom tewelde/ri2/
266.wenewa tewelde

VERSE 1
wenewa tewelde medኃnieዓlem/ri2/
fሥሐ lekulu zeyeamn/2/
wenewa texemwe medኃnieዓlem/ri2/
nasሥ lekulu zeyeamn/ri2/

VERSE 2
trgum-
zarie tewelede yeዓlem mednኀnit/2/
desta newna lemiyamnut/2/
zarie texemeqe yeዓlem mednኀnit/2/

VERSE 3
desta newna lemiyamnut/2/
267.leze tewelde
lezetewelde emqdst dngl mnte nblo
nastemaslo lemedኃnine/2/

VERSE 4
arwie gedamnu anbesa wemime /2/ keradyon/2/
266.bieza kulu
bieza kulu ዓlem yom texemwaqe/ri2/
bieza kulu ዓlem yom texemqe/2

VERSE 5
269.lbezariew xmqetu
bezariew xmqetu asey asey
tenegro awaj asey asey
netsanet agegnen asey asey

VERSE 6
beagziabሔr ab lj asey esey', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('w-n-weyn-arege-asey-asey', 'ውኃን ወይን አረገ አሰይ አሰይ', 'ውኃን ወይን አረገ አሰይ አሰይ', 'wኃn weyn arege asey asey', 'Ethiopian Orthodox Tewahedo Mezmur - ውኃን ወይን አረገ አሰይ አሰይ', 'በተጠራበት ቤት እሰይ አሰይ
የብርሃናት ጌታ አሰይ እሰይ
የዓለም መድኃኒት አሰይ እሰይ', 'betexerabet biet esey asey
yebrሃnat gieta asey esey
yeዓlem medኃnit asey esey', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ybiela-melak-kegieta-telko', 'ይቤላ መልአክ ከጌታ ተልኮ', 'ይቤላ መልአክ ከጌታ ተልኮ', 'ybiela melak kegieta telko', 'Ethiopian Orthodox Tewahedo Mezmur - ይቤላ መልአክ ከጌታ ተልኮ', 'ይቤላ መልአክ ቅዱስ ገብርኤል
ይቤላ መልአክ ሰላምታ አቅርቦላት
ይቤላ መልአክ ለማርያም ድንግል
ይቤላ መልአክ ትወልጃለሽ አላት

VERSE 1
ይቤላ መልአክ ቀዳሚውን ቃል', 'ybiela melak qdus gebriel
ybiela melak selamta aqrbolat
ybiela melak lemaryam dngl
ybiela melak tweljalesh alat

VERSE 1
ybiela melak qedamiwn qal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zalie-lie-luya-amien-zalie-luya', 'ዛሌ ሃሌ ሉያ አሜን ዛሌ ሉያ', 'ዛሌ ሃሌ ሉያ አሜን ዛሌ ሉያ', 'zalie ሃlie luya amien zalie luya', 'Ethiopian Orthodox Tewahedo Mezmur - ዛሌ ሃሌ ሉያ አሜን ዛሌ ሉያ', 'መላእክት ዘመሩ አመሰገኑት
አየተደነቁ በአምላክ ቸርነት/2/
ስብሐት ለእግዚአብሔር በሰማያት አሉ
አረኞችም አብረው እሱን አከበሩ/2/', 'melaekt zemeru amesegenut
ayetedenequ beamlak chernet/2/
sbሐt leegziabሔr besemayat alu
aregnochm abrew esun akeberu/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemn-lemefxer-ketexebebebet', 'ዓለምን ለመፍጠር ከተጠበበበት', 'ዓለምን ለመፍጠር ከተጠበበበት', 'ዓlemn lemefxer ketexebebebet', 'Ethiopian Orthodox Tewahedo Mezmur - ዓለምን ለመፍጠር ከተጠበበበት', 'ይበልጣል ከሁሉም እኛን ያዳነበት /2/
ከዳግማዊት ሔዋን ከእመቤታችን
በረቂቅ ጥበቡ ተወልዶ አዳነን/2/', 'ybelxal kehulum egnan yadanebet /2/
kedagmawit ሔwan keemebietachn
bereqiq xbebu teweldo adanen/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeamnet-menetsrun-yzo-slalmexa', 'የአምነት መነጽሩን ይዞ ስላልመጣ', 'የአምነት መነጽሩን ይዞ ስላልመጣ', 'yeamnet menetsrun yzo slalmexa', 'Ethiopian Orthodox Tewahedo Mezmur - የአምነት መነጽሩን ይዞ ስላልመጣ', 'የአምነት መነጽሩን ይዞ ስላልመጣ /2/
ሰው ሁሉ በክህደት/2/ ፈጣሪውን አጣ /2/
አንመሰክራለለን ፈጣሪያችን አለ
አንመሰክራለን አማኑኤል አለ/2/

VERSE 1
አንዳንዱ ቢክደው /2/ እየተታለለ /2/', 'yeamnet menetsrun yzo slalmexa /2/
sew hulu bekhdet/2/ fexariwn axa /2/
anmesekralelen fexariyachn ale
anmesekralen amanuiel ale/2/

VERSE 1
andandu bikdew /2/ eyetetalele /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sew-hulu-beshtet-2-fexariwn-axa-2', 'ሰው ሁሉ በስህተት/2/ ፈጣሪውን አጣ/2/', 'ሰው ሁሉ በስህተት/2/ ፈጣሪውን አጣ/2/', 'sew hulu beshtet/2/ fexariwn axa/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሰው ሁሉ በስህተት/2/ ፈጣሪውን አጣ/2/', 'አንመሰክራለን ፈጣሪያችን አለ
አንመሰክራለን አማኑኤል አለ /2/
እንመነው አንካደው አማኩኤል ቸር ነው/2/
አንመሰክራለን ድንግል አማላጅ ናት

VERSE 1
አንመሰክራለን ማርያም አማላጅ ናት
አንመናት አንካዳት የአምላክ እናት ናት/2/
ንበ ጥበባት ኀበ ልሳናት''/4/', 'anmesekralen fexariyachn ale
anmesekralen amanuiel ale /2/
enmenew ankadew amakuiel cher new/2/
anmesekralen dngl amalaj nat

VERSE 1
anmesekralen maryam amalaj nat
anmenat ankadat yeamlak enat nat/2/
nbe xbebat ኀbe lsanat''/4/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-amebietie-selamta-ydressh', 'ድንግል አመቤቴ ሰላምታ ይድረስሽ', 'ድንግል አመቤቴ ሰላምታ ይድረስሽ', 'dngl amebietie selamta ydressh', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል አመቤቴ ሰላምታ ይድረስሽ', 'ለአምላክ ወገኖች መመኪያቸው የሆንሽ
ከአንቺ ተወለደ የዓለም መድኅን
ኩነኔን አጥፍቶ ጽድቅን ሊያወርሰን
ድንግል አመቤቴ ሰላምታ ይድረስሽ /2/

VERSE 1
ለአምላክ ወገኖች መመኪያቸው የሆንሽ /2/
ከአንቺ ተወለደ የዓለም መድኅን /2/
ኩነኔን አጥፍቶ ክብርን ሊያወርሰን /2/', 'leamlak wegenoch memekiyachew yehonsh
keanchi tewelede yeዓlem medኅn
kunenien axfto tsdqn liyawersen
dngl amebietie selamta ydressh /2/

VERSE 1
leamlak wegenoch memekiyachew yehonsh /2/
keanchi tewelede yeዓlem medኅn /2/
kunenien axfto kbrn liyawersen /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gietachn-siweled-bebietel-m', 'ጌታችን ሲወለድ በቤተልሔም', 'ጌታችን ሲወለድ በቤተልሔም', 'gietachn siweled bebietelሔm', 'Ethiopian Orthodox Tewahedo Mezmur - ጌታችን ሲወለድ በቤተልሔም', 'ሐዘን ተደምስሶ ሰፈነ ሰላም
አንጨቶች አፈሩ ፍሬ በረከት
ወንዞች ሁሉ ሆኑ ማርና ወተት
ጌታችን ሲወለድ በቤተልሔም /2/

VERSE 1
ኀዘን ተደምስሶ ሰፈነ ሰላም /2/
አንጨቶች አፈሩ ፍሬ በረከት''2/
ወንዞች ሁሉ ሆኑ ማርና ወተት /2/', 'ሐzen tedemsso sefene selam
ancetoch aferu frie bereket
wenzoch hulu honu marna wetet
gietachn siweled bebietelሔm /2/

VERSE 1
ኀzen tedemsso sefene selam /2/
ancetoch aferu frie bereket''2/
wenzoch hulu honu marna wetet /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('awnetegna-melak-mehonun-slayech', 'አውነተኛ መልአክ መሆኑን ስላየች', 'አውነተኛ መልአክ መሆኑን ስላየች', 'awnetegna melak mehonun slayech', 'Ethiopian Orthodox Tewahedo Mezmur - አውነተኛ መልአክ መሆኑን ስላየች', 'ይሁንልኝ ብላ ቃሉን ተቀበለች
302.ከነቢያት ሀገር
አውነተኛ መልአክ መሆኑን ስላየች
ይሁንልኝ ብላ ቃሉን ተቀበለች

VERSE 1
920.በምን በምን
በምን በምን እንመስላት ድንግል ማርያምን/2/
ምሳሌ የላትም የላትም ክብራን የሚመጥን/2
የሙሴ ጸላት ነሽ የምሕረት ቃል ኪዳን

VERSE 2
የያፅቆብ መሠላል የአብርሃም ድንኳን
የብርሃን መውጫ የኖኅ ድንቅ መርከብ
የመላእክት እህት የሩኅሩኀን ርግብ /2/
አውነተኛ መልአክ መሆኑን ስላየች

VERSE 3
ይሁንልኝ ብላ ቃሉን ተቀበለች
990አመቤቴ ጥላ ከለላዬ
አመቤቴ ጥላ ከለላዬ ረዳቴ የገነት ሙሽራ
የገነት ሙሽራ /3/ ማርያም የልዑል

VERSE 4
ማደሪያ
መጣ በነቢያት ቃለ አብ ተሰብኮ
በስድስተኛው ወር ገብርኤል ተልኮ
ቤተመቅደስ ሳለች ሳለች በፍጹም ትኅትና

VERSE 5
ደሽ ይበልሽ አላት መልአኩ መጣና
በጥዑም ቃል እርሷን እያጽናና /2/', 'yhunlgn bla qalun teqebelech
302.kenebiyat hager
awnetegna melak mehonun slayech
yhunlgn bla qalun teqebelech

VERSE 1
920.bemn bemn
bemn bemn enmeslat dngl maryamn/2/
msalie yelatm yelatm kbran yemimexn/2
yemusie tselat nesh yemሕret qal kidan

VERSE 2
yeyaፅqob meሠlal yeabrሃm dnkuan
yebrሃn mewca yenoኅ dnq merkeb
yemelaekt eht yeruኅruኀn rgb /2/
awnetegna melak mehonun slayech

VERSE 3
yhunlgn bla qalun teqebelech
990amebietie xla kelelayie
amebietie xla kelelayie redatie yegenet mushra
/2/

VERSE 4
/2/
yegenet mushra /3/ maryam yelዑl
maderiya
mexa benebiyat qale ab tesebko

VERSE 5
besdstegnaw wer gebriel telko
bietemeqdes salech salech beftsum tኅtna
desh ybelsh alat melaku mexana
bexዑm qal ersuan eyatsnana /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yh-lem-beqalu-ketefexerebet', 'ይህ ዓለም በቃሉ ከተፈጠረበት', 'ይህ ዓለም በቃሉ ከተፈጠረበት', 'yh ዓlem beqalu ketefexerebet', 'Ethiopian Orthodox Tewahedo Mezmur - ይህ ዓለም በቃሉ ከተፈጠረበት', 'ይበልጣል ልደቱ አምላክ ሰው የሆነበት
አንደምን ይገርማል ይፄ ተዋሕዶ
አየነው አምላክን ከድንግል ተወልዶ', 'ybelxal ldetu amlak sew yehonebet
andemn ygermal yፄ tewaሕdo
ayenew amlakn kedngl teweldo', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('aenbey-nez-aemru', 'አእንበይ ነዝ አእምሩ', 'አእንበይ ነዝ አእምሩ', 'aenbey nez aemru', 'Ethiopian Orthodox Tewahedo Mezmur - አእንበይ ነዝ አእምሩ', 'አንበይ ነዝ አእምሩ በውስተ ፍትሕ
ከመ ኢያደሉ/2/
አመ ወእመ ኩሉ ጥጥዓም ሞት አዘዘ
ወልድ በርቱዕ ቃሉ/2/', 'anbey nez aemru bewste ftሕ
keme iyadelu/2/
ame weeme kulu xxዓm mot azeze
weld bertuዕ qalu/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tenagera-zra', 'ተናገራ ዕዝራ', 'ተናገራ ዕዝራ', 'tenagera ዕzra', 'Ethiopian Orthodox Tewahedo Mezmur - ተናገራ ዕዝራ', 'ተናገራ ፅዝራ ተናገራ ዳዊት ዘመራ/2/
ተናገራ ፅዝራ በመሠንቆ ዳዊት ዘመራ/2/
ተናገራ እያጫወታት ዳዊት ዘመራ
ተናገራ ሳታውቀው አለፈ ዳዊት ዘመራ

VERSE 1
ተናገራ ያ መልአከ ሞት ዳዊት ዘመራ
ተናገራ ፅዝራ ተናጋራ ዳዊት ዘመራ/2/
ተናገራ ውጥች ቀለም ሆነው ዳዊት ዘመራ
ተናገራ እንጨቶች ብዕር ዳዊት ዘመራ

VERSE 2
ተናገራ ፅዝራ ተናገራ ዳዊት ዘመራ/2/
ተናገራ ቢጽፉት አያልቅም ዳዊት ዘመራ
ተናገራ የማርያምን ክብር ዳዊት ዘመራ', 'tenagera ፅzra tenagera dawit zemera/2/
tenagera ፅzra bemeሠnqo dawit zemera/2/
tenagera eyacawetat dawit zemera
tenagera satawqew alefe dawit zemera

VERSE 1
tenagera ya melake mot dawit zemera
tenagera ፅzra tenagara dawit zemera/2/
tenagera wxch qelem honew dawit zemera
tenagera encetoch bዕr dawit zemera

VERSE 2
tenagera ፅzra tenagera dawit zemera/2/
tenagera bitsfut ayalqm dawit zemera
tenagera yemaryamn kbr dawit zemera', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-ga-wedemu-ftsm-andazezew-wengielu-e', 'በሥጋ ወደሙ ፍጽም አንዳዘዘው ወንጌሉ እኸ', 'በሥጋ ወደሙ ፍጽም አንዳዘዘው ወንጌሉ እኸ', 'beሥga wedemu ftsm andazezew wengielu eኸ', 'Ethiopian Orthodox Tewahedo Mezmur - በሥጋ ወደሙ ፍጽም አንዳዘዘው ወንጌሉ እኸ', 'በሙሽሪት ነው ያማረው /2/ሥርዓተ ተክሊሉ/2/
320. ካህናት ተንሥኡ
ካህናት ተንሥኡ/2/ለተናብቦ /2/
አንዘ ይብሎ ንሴብጦ/2/እንዘ ይብሎ ንሴብሖ/2/

VERSE 1
321. አድርገህልኛልና
አድርገህልኛልና በቸርነትህ
አመሰግንሃለሁ አልል አልል
ለዓለመ ዓለም አማኑኤል

VERSE 2
አገዛልህለሁ መድኃኔዓለም/2/
ቀነ ጨልሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደቅኖ
ረዳት ያጣሁኝ በመሰለኝ ጊዜ

VERSE 3
ፈጽሞ አራቅክልኝ የልቤን ትካዜ', 'bemushrit new yamarew /2/ሥrዓte teklilu/2/
320. kahnat tenሥu
kahnat tenሥu/2/letenabbo /2/
anze yblo nsiebxo/2/enze yblo nsiebሖ/2/

VERSE 1
321. adrgehlgnalna
adrgehlgnalna becherneth
amesegnሃlehu all all
leዓleme ዓlem amanuiel

VERSE 2
agezalhlehu medኃnieዓlem/2/
qene celmobgn zuriyaw gedel hono
yechgr arenqua fitie tedeqno
redat yaxahugn bemeselegn gizie

VERSE 3
fetsmo araqklgn yelbien tkazie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlak-hoy-msgana-leante-ygeba-l', 'አምላክ ሆይ ምስጋና ለአንተ ይገባሃል', 'አምላክ ሆይ ምስጋና ለአንተ ይገባሃል', 'amlak hoy msgana leante ygebaሃl', 'Ethiopian Orthodox Tewahedo Mezmur - አምላክ ሆይ ምስጋና ለአንተ ይገባሃል', 'ለምስኪንዋ ጐጆ በረከት ሰጥተፃል
ድሀ ነኝ አልልም ሀብቴ አንተ ነህና
ማሰሮዬ ሞልቷል ላይጐድል እንደገና', 'lemskinwa ጐjo bereket sexteፃl
dha negn allm habtie ante nehna
maseroyie moltual layጐdl endegena', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beqalh-temertew-lezih-qen-beqtewal', 'በቃልህ ተመርተው ለዚህ ቀን በቅተዋል', 'በቃልህ ተመርተው ለዚህ ቀን በቅተዋል', 'beqalh temertew lezih qen beqtewal', 'Ethiopian Orthodox Tewahedo Mezmur - በቃልህ ተመርተው ለዚህ ቀን በቅተዋል', 'በፊትህ ጋብቻን ይኸው ፈጽመዋል
በፈሰሰው ደምህ ኅብረት መስርተዋል
በሥጋም በነፍስም /2/የአንተ ነን ብለዋል', 'befith gabchan yኸw fetsmewal
befesesew demh ኅbret mesrtewal
beሥgam benefsm /2/yeante nen blewal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keadam-and-axnt-ke-nu-wesdeh', 'ከአዳም አንድ አጥንት ከጐኑ ወስደህ', 'ከአዳም አንድ አጥንት ከጐኑ ወስደህ', 'keadam and axnt keጐnu wesdeh', 'Ethiopian Orthodox Tewahedo Mezmur - ከአዳም አንድ አጥንት ከጐኑ ወስደህ', 'አጋር እንድትሆነው ሔዋንን ሰጠህ
ሁለቱንም ባርከህ እንደፈጠርካቸው
ዛሬም ለሙሽሮች/2/ ሰላምን ስጣቸው', 'agar endthonew ሔwann sexeh
huletunm barkeh endefexerkachew
zariem lemushroch/2/ selamn sxachew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gieta-hoy-be-gh-beqalh-me-ret', 'ጌታ ሆይ በሕግህ በቃልህ መሠረት', 'ጌታ ሆይ በሕግህ በቃልህ መሠረት', 'gieta hoy beሕgh beqalh meሠret', 'Ethiopian Orthodox Tewahedo Mezmur - ጌታ ሆይ በሕግህ በቃልህ መሠረት', 'አንድ ሆነዋልና በዚህ ቅዱስ ዕለት
አርሱንም እሷንም ባርከህ ቀድሳቸው
ዘለዓለማዊ ፍቅር /2/ ጽናትን ስጣቸው', 'and honewalna bezih qdus ዕlet
arsunm esuanm barkeh qedsachew
zeleዓlemawi fqr /2/ tsnatn sxachew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tewa-doalna-honeshal-ywetie-2', 'ተዋሕዶአልና ሆነሻል ሕይወቴ/2/', 'ተዋሕዶአልና ሆነሻል ሕይወቴ/2/', 'tewaሕdoalna honeshal ሕywetie/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ተዋሕዶአልና ሆነሻል ሕይወቴ/2/', 'በአመብርፃን ምልጃ በጌታ ቸርነት
በቃልህ ከታመንኩ በዚህ ቅዱስ ዕለት
የአጥንትህ ክፋይ አካልህ ነኝና
ጌታዬ ልበልህ ክብሬ አንተ ነህና/2/', 'beamebrፃn mlja begieta chernet
beqalh ketamenku bezih qdus ዕlet
yeaxnth kfay akalh negnna
gietayie lbelh kbrie ante nehna/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beqalu-ameralehu-anbbie-wengieln-2', 'በቃሉ አመራለሁ አንብቤ ወንጌልን/2/', 'በቃሉ አመራለሁ አንብቤ ወንጌልን/2/', 'beqalu ameralehu anbbie wengieln/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በቃሉ አመራለሁ አንብቤ ወንጌልን/2/', 'አግዚአብሔር ሆይ ስማን ቃልኪዳናችንን
ጋብቻችንን ባርክ ቀድስ ጐጆአችንን
ከዲያብሎስ ሴራ ጠብቀህ እኛን
አስከመጨረሻው በቃልህ አጽናን/2/', 'agziabሔr hoy sman qalkidanachnn
gabchachnn bark qeds ጐjoachnn
kediyablos siera xebqeh egnan
askemecereshaw beqalh atsnan/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('leabr-m-le-ra-andesexe-tdar', 'ለአብርሃም ለሣራ አንደሰጠ ትዳር', 'ለአብርሃም ለሣራ አንደሰጠ ትዳር', 'leabrሃm leሣra andesexe tdar', 'Ethiopian Orthodox Tewahedo Mezmur - ለአብርሃም ለሣራ አንደሰጠ ትዳር', 'ለእናንተም ይለግስ የዘለዓለም ፍቅር
ኣንቺም እንደሣራ አንተም እንደ አብርፃም
ተፋቅራችሁ ኑሩ አስከ ዘለዓለም', 'leenantem ylegs yezeleዓlem fqr
ኣnchim endeሣra antem ende abrፃm
tefaqrachhu nuru aske zeleዓlem', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wede-adis-jowa-shgnuat-bezmarie', 'ወደ አዲስ ጐጆዋ ሽኙአት በዝማሬ', 'ወደ አዲስ ጐጆዋ ሽኙአት በዝማሬ', 'wede adis ጐjowa shgnuat bezmarie', 'Ethiopian Orthodox Tewahedo Mezmur - ወደ አዲስ ጐጆዋ ሽኙአት በዝማሬ', 'አዝቤተሰቦችሽን ሁሉንም ትተሽ
መፄድሽ ነውና ወደ መኖሪያሽ
ከአማኑኤል ጋራ ባልሽን ይዘሽ
ተነሽ ሙሽራዬ ደርሰዋል ሰዓትሽ

VERSE 1
ከድንግልም ጋራ ሚስትህን ይዘህ
ተነሥ ወንድሜ ሆይ ደርስዋል ሰዓትህ', 'azbietesebochshn hulunm ttesh
meፄdsh newna wede menoriyash
keamanuiel gara balshn yzesh
tenesh mushrayie dersewal seዓtsh

VERSE 1
kednglm gara misthn yzeh
teneሥ wendmie hoy derswal seዓth', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-gaw-wedemu-ywet-aggntachhu', 'በሥጋው ወደሙ ሕይወት አግኝታችሁ', 'በሥጋው ወደሙ ሕይወት አግኝታችሁ', 'beሥgaw wedemu ሕywet aggntachhu', 'Ethiopian Orthodox Tewahedo Mezmur - በሥጋው ወደሙ ሕይወት አግኝታችሁ', 'ፍሬአችሁም ይብዛ ይባረክ ጓዳችሁ
አምላክ ያለበት ነው ይፄ ጋብቻችሁ
አስከ መጨረሻው ኑሩ ደስ ብሎአችሁ', 'frieachhum ybza ybarek guadachhu
amlak yalebet new yፄ gabchachhu
aske mecereshaw nuru des bloachhu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-delew-hulu-ayecemersheln', 'በጐደለው ሁሉ አየጨመርሸልን', 'በጐደለው ሁሉ አየጨመርሸልን', 'beጐdelew hulu ayecemersheln', 'Ethiopian Orthodox Tewahedo Mezmur - በጐደለው ሁሉ አየጨመርሸልን', 'ቤታችንን ሁሉ ሙይው እናታችን
ለአገልጋዬቹም ድንግል ንግሪአቸው
ጠርተን እንዳናፍር ጋኖቹን ይሙላቸው', 'bietachnn hulu muyw enatachn
leagelgayiechum dngl ngriachew
xerten endanafr ganochun ymulachew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeteraraqe-akal-and-hone-beteklil', 'የተራራቀ አካል አንድ ሆነ በተክሊል', 'የተራራቀ አካል አንድ ሆነ በተክሊል', 'yeteraraqe akal and hone beteklil', 'Ethiopian Orthodox Tewahedo Mezmur - የተራራቀ አካል አንድ ሆነ በተክሊል', 'አግዚአብሔር ይመስገን እልል/2/ እንበል
አጥንትሽ ከአጥንቴ ሥጋሽ ከሥጋዬ
አዳም የሰበከው ይኸው ዛሬ ታዬ', 'agziabሔr ymesgen ell/2/ enbel
axntsh keaxntie ሥgash keሥgayie
adam yesebekew yኸw zarie tayie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mer-wi-sbuh', 'መርዓዊ ስቡህ', 'መርዓዊ ስቡህ', 'merዓwi sbuh', 'Ethiopian Orthodox Tewahedo Mezmur - መርዓዊ ስቡህ', 'መርዓዊ ስቡሕ ዘለዓለም/2/
ወአስከ ለዓለም /2/ ንጉሥ ውእቱ /ሪ2/
በገሊላ አውራጃ ከሠርግ ቤት ገብቶ/2/
ጋብቻን ባርኮታል ቀድሶ አዘጋጅቶ/2/

VERSE 1
አዳምን ብቻውን አትኑር ሲለው
ከጐነ በመፍጠር ሔዋንን ሰጠው/2/
በግላዊ ኑሮ የትም ከመኮብለል
በአንድ አካል አንድ አምሳል ጋብቻ ይሻላል/2/

VERSE 2
331. ዳዊት ይሴብሕ
ዳዊት ይሴብሕ ወይዜምር ዕዝራ/2/
አንዘይብሉ ሙሽሪት ሙሽራ/2/
332. መጽአ መርዓዊ

VERSE 3
መጽአ መርዓዊ ፍሥሐ ለኩሉ/2/
በሰላም ጻኡ ተቀበሉ/2/
ትርጉም፣፤፣መጣ ሙሽራው ደስታ ለሁሉ/2/
በሰላም ውጡ ተቀበሉ/2/

VERSE 4
333. ሁለቱም አንድ ሆኑ ዛሬ
ሁለቱም አንድ ሆኑ ዛሬ/2/
በአግዚአብሔር በሕያው ቃሉ
ሁለቱም አንድ ሆኑ ዛሬ /2/', 'merዓwi sbuሕ zeleዓlem/2/
weaske leዓlem /2/ nguሥ wetu /ri2/
begelila awraja keሠrg biet gebto/2/
gabchan barkotal qedso azegajto/2/

VERSE 1
adamn bchawn atnur silew
keጐne bemefxer ሔwann sexew/2/
beglawi nuro yetm kemekoblel
beand akal and amsal gabcha yshalal/2/

VERSE 2
331. dawit ysiebሕ
dawit ysiebሕ weyziemr ዕzra/2/
anzeyblu mushrit mushra/2/
332. metsa merዓwi

VERSE 3
metsa merዓwi fሥሐ lekulu/2/
beselam tsau teqebelu/2/
trgum፣፤፣mexa mushraw desta lehulu/2/
beselam wxu teqebelu/2/

VERSE 4
333. huletum and honu zarie
huletum and honu zarie/2/
beagziabሔr beሕyaw qalu
huletum and honu zarie /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('huletum-and-ga-honew-ynoralu', 'ሁለቱም አንድ ሥጋ ሆነው ይኖራሉ', 'ሁለቱም አንድ ሥጋ ሆነው ይኖራሉ', 'huletum and ሥga honew ynoralu', 'Ethiopian Orthodox Tewahedo Mezmur - ሁለቱም አንድ ሥጋ ሆነው ይኖራሉ', 'ብሎ አስተምሮናል ጌታችን በቃሉ
አንድ ሥጋ ናቸው አይደሉም ሁለት
የባልና የሚስት ሕይወት ወደፊት', 'blo astemronal gietachn beqalu
and ሥga nachew aydelum hulet
yebalna yemist ሕywet wedefit', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mnxafachhu-bruh-megntachhu-ntsh', 'ምንጣፋችሁ ብሩህ መኝታችሁ ንጽህ', 'ምንጣፋችሁ ብሩህ መኝታችሁ ንጽህ', 'mnxafachhu bruh megntachhu ntsh', 'Ethiopian Orthodox Tewahedo Mezmur - ምንጣፋችሁ ብሩህ መኝታችሁ ንጽህ', 'ስለሆነላችሁ እንኳን ደስ አላችሁ
ዓለም እንዲደነቅ ሰይጣን እንዲያፍር
በሐዘን በደስታ ይኑራችሁ ፍቅር', 'slehonelachhu enkuan des alachhu
ዓlem endideneq seyxan endiyafr
beሐzen bedesta ynurachhu fqr', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ashebrqo-wale-mushroch-rgachhu-2', 'አሸብርቆ ዋለ ሙሽሮች ሠርጋችሁ/2/', 'አሸብርቆ ዋለ ሙሽሮች ሠርጋችሁ/2/', 'ashebrqo wale mushroch ሠrgachhu/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አሸብርቆ ዋለ ሙሽሮች ሠርጋችሁ/2/', 'ሕይወታችሁ ሰላማዊ ፍጽም ፍቅር/2/
አንደ ጽጌረዳ እንደአደይ ፈክቶ የሚኖር
አማኑኤል ያድርገው መልካም ትሥሥር', 'ሕywetachhu selamawi ftsm fqr/2/
ande tsgiereda endeadey fekto yeminor
amanuiel yadrgew melkam tሥሥr', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('des-alachew-kezmut-xebqo', 'ደስ አላቸው ከዝሙት ጠብቆ', 'ደስ አላቸው ከዝሙት ጠብቆ', 'des alachew kezmut xebqo', 'Ethiopian Orthodox Tewahedo Mezmur - ደስ አላቸው ከዝሙት ጠብቆ', 'ከዓለም ፈተና
ወደቤቱ ጠርቶ
ለቅዱስ ጋብቻ
ስለመረጣቸው

VERSE 1
የወንጌልንም ቃል
በመፈጸማቸው
538. ትዌድሶ መርዓት
ትዌድሶ መርዓት ወትብሎ/2/

VERSE 2
ወልድ እጉየ ቃልከ አዳም/4/
940.ሙሽሮች አበበ ፍሬያችሁ
ሙሽሮች አበበ ፍሬአችሁ/2/
ለዚህ ቀን ይኸው ደረሳችሁ

VERSE 3
በአምላክ ፊት አጅግ ከበራችሁ/2/
በአግዚአብሔር ቸርነት በመልካም ፈቃዱ
በቅዱስ ቁርባኑ ዛሬ ተዋሐዱ/2/', 'keዓlem fetena
wedebietu xerto
leqdus gabcha
slemerexachew

VERSE 1
yewengielnm qal
bemefetsemachew
538. twiedso merዓt
twiedso merዓt wetblo/2/

VERSE 2
weld eguye qalke adam/4/
940.mushroch abebe frieyachhu
mushroch abebe frieachhu/2/
lezih qen yኸw deresachhu

VERSE 3
beamlak fit ajg keberachhu/2/
beagziabሔr chernet bemelkam feqadu
beqdus qurbanu zarie tewaሐdu/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tsento-yemiyazelqachew-yemayleyayachew', 'ጸንቶ የሚያዘልቃቸው የማይለያያቸው', 'ጸንቶ የሚያዘልቃቸው የማይለያያቸው', 'tsento yemiyazelqachew yemayleyayachew', 'Ethiopian Orthodox Tewahedo Mezmur - ጸንቶ የሚያዘልቃቸው የማይለያያቸው', 'ክቡር ቃል ስላለ በመካከላቸው/2/
አስከመጨረሻው አንድ አካል ሆነዋል
የአማኑኤል ሥጋ አስተሳስሮአቸዋል/2/', 'kbur qal slale bemekakelachew/2/
askemecereshaw and akal honewal
yeamanuiel ሥga astesasroachewal/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yemanu-te-qefeni', 'የማኑ ተሐቀፈኒ', 'የማኑ ተሐቀፈኒ', 'yemanu teሐqefeni', 'Ethiopian Orthodox Tewahedo Mezmur - የማኑ ተሐቀፈኒ', 'የማኑ ተሐቅፈኒ ወጸጋሙ ታኅተ ርአእስየ/2/
ትብሉ መርዓት ትብሎ/4/መርዓት ለመርዓዊዛፃ
342 በምድራዊ ህይወት
በምድራዊ ሕይወት

VERSE 1
በምድራዊ ሕይወተ/2/በፈተና ቦታ/2/
ድንግል ትጠብቅህ አጆቿን ዘርግታ', 'yemanu teሐqfeni wetsegamu taኅte raesye/2/
tblu merዓt tblo/4/merዓt lemerዓwizaፃ
342 bemdrawi hywet
bemdrawi ሕywet

VERSE 1
bemdrawi ሕywete/2/befetena bota/2/
dngl txebqh ajoቿn zergta', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('weynu-beme-l-lay-malequn-semtesh', 'ወይኑ በመሃል ላይ ማለቁን ሰምተሽ', 'ወይኑ በመሃል ላይ ማለቁን ሰምተሽ', 'weynu bemeሃl lay malequn semtesh', 'Ethiopian Orthodox Tewahedo Mezmur - ወይኑ በመሃል ላይ ማለቁን ሰምተሽ', 'ድንጋጤአቸውን እመበቴ አይተሽ
ወደ ልጅሸ ፄደሽ ብትጠይቂላቸው
ጋኑን ውኃ ሙሉት ብሎ አዘዛቸው', 'dngaxieachewn emebetie aytesh
wede ljshe ፄdesh btxeyqilachew
ganun wኃ mulut blo azezachew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('w-wn-wedeweyn-axafxo-qeyro', 'ውኃውን ወደወይን አጣፍጦ ቀይሮ', 'ውኃውን ወደወይን አጣፍጦ ቀይሮ', 'wኃwn wedeweyn axafxo qeyro', 'Ethiopian Orthodox Tewahedo Mezmur - ውኃውን ወደወይን አጣፍጦ ቀይሮ', 'የዶኪማስንም አፍረቱን ሰውሮ
አድምተኞች ሁሉ እስከሚደነቁ
አምላክ ከአእነአርሱ ጋር መሆኑን አወቁ', 'yedokimasnm afretun sewro
admtegnoch hulu eskemidenequ
amlak keaenearsu gar mehonun awequ', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beqana-zegelila-qu-1', 'በቃና ዘገሊላ ቁ.1', 'በቃና ዘገሊላ ቁ.1', 'beqana zegelila qu.1', 'Ethiopian Orthodox Tewahedo Mezmur - በቃና ዘገሊላ ቁ.1', 'በቃና ዘገሊላ/2/
ዘገሊላ ከብካብ ኮነ/2/
345 በቃና ዘገሊላ ቁ.2
በቃና ዘገሊላ ማየ ወይነ ረሰየ /2/

VERSE 1
መዓዛ ቃልከ ይትወከፍ ጸሉሎትየ/2/
346. ኑ ተመልከቱልኝ
ነኑ ተመልከቱልኝ የአማኑኤልን ሥራ/2/', 'beqana zegelila/2/
zegelila kebkab kone/2/
345 beqana zegelila qu.2
beqana zegelila maye weyne reseye /2/

VERSE 1
meዓza qalke ytwekef tselulotye/2/
346. nu temelketulgn
nenu temelketulgn yeamanuieln ሥra/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qen-keliet-sitsely-zekaryas-kahn', 'ቀን ከሌት ሲጸልይ ዘካርያስ ካህን', 'ቀን ከሌት ሲጸልይ ዘካርያስ ካህን', 'qen keliet sitsely zekaryas kahn', 'Ethiopian Orthodox Tewahedo Mezmur - ቀን ከሌት ሲጸልይ ዘካርያስ ካህን', 'ኤልሣቤጥም ተግታ ፈጣሪን ብትለምን
በአግዚአብሔር ጥበብ በስተአርጅናቸው
ቅዱስ ዩሐንስን አክብሮ ሠጣቸው/2/', 'ielሣbiexm tegta fexarin btlemn
beagziabሔr xbeb bestearjnachew
qdus yuሐnsn akbro ሠxachew/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lasie-ybarkuachhu', 'ሥላሴ ይባርኳችሁ', 'ሥላሴ ይባርኳችሁ', 'ሥlasie ybarkuachhu', 'Ethiopian Orthodox Tewahedo Mezmur - ሥላሴ ይባርኳችሁ', 'ሥላሴ ይባርኳችሁ /2/
በሥጋ ወደሙ ዛሬ የከበራችሁ/2/
ሥላሴ ይባርኳችሁ/2/
አመአምላክ ትከተልህ/4/

VERSE 1
ፈተና እንዳይገጥምህ ድንግል ትከተልህ
አመአምላክ ትከተልህ
ሜካኤል በኑሮአችሁ/2/
አርምሞ ማስተዋል ትዕግስቱን ይስጣችሁ

VERSE 2
ሜካኤል በኑሮአችሁ
ገብርኤል ከላይ ወርዶ/4/
አርሱ ይራዳችሁ በክንፎቹ ጋርዶ
ገብርኤል ከላይ ወርዶ

VERSE 3
ዑራኤል በምልጃው/4/
የአውቀተን ጥበብ ይስጥህ/ሸ/ በጽዋው
ዑራኤል በምልጃው
ጊዮርጊስ አይለያችሁ/4/

VERSE 4
በፈተና ጊዜ ጽናት ያሳያችሁ
ጊዮርጊስ አይለያችሁ', 'ሥlasie ybarkuachhu /2/
beሥga wedemu zarie yekeberachhu/2/
ሥlasie ybarkuachhu/2/
ameamlak tketelh/4/

VERSE 1
fetena endaygexmh dngl tketelh
ameamlak tketelh
miekaiel benuroachhu/2/
armmo mastewal tዕgstun ysxachhu

VERSE 2
miekaiel benuroachhu
gebriel kelay werdo/4/
arsu yradachhu beknfochu gardo
gebriel kelay werdo

VERSE 3
ዑraiel bemljaw/4/
yeawqeten xbeb ysxh/she/ betswaw
ዑraiel bemljaw
giyorgis ayleyachhu/4/

VERSE 4
befetena gizie tsnat yasayachhu
giyorgis ayleyachhu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('all-belu-miziewochu', 'አልል በሉ ሚዜዎቹ', 'አልል በሉ ሚዜዎቹ', 'all belu miziewochu', 'Ethiopian Orthodox Tewahedo Mezmur - አልል በሉ ሚዜዎቹ', 'አብሮ አድጉ ጓደኞቹ
አልል በሉ ሚዜዎቿ
አብሮ አደጓ ጓደኞቿ
349 ያስደስታል

VERSE 1
ያስደስታል/2/ የአኛ እምነታችን
የኦርቶዶክስ ተዋሕዶ የጋብቻ ሥርዓታችን/2/
ተፈጸመ/2/ ዛሬ ሠርጋችሁ
ምስጋና ይግባው አንላለን /2/

VERSE 2
ቸሩ አምላካችንን
350. ንፅህት ድንግል
ንጽህት ድንግል ብርክት
የአምላክ አናት አመቤት

VERSE 3
ልጆችሽ ሙሽሮች ሁለቱም አንድ ሆኑ
ተዋሀዱ ተጣመሩ በቅዱስ ቁርባኑ/2/
ፍጹም መንፈሳዊ ልዩ ፍቅር
አንቺ ያለሽበት መልካም ትዳር

VERSE 4
መሠረቱ ዛሬ ልጆችሽ
ቅድስት ሆይ ባርኪያቸው ተገኝተሽ
አልል በሉ ሚዜዎቹ /ሚዜዎቿ/
የደስታ ተካፋዩቹ/ተካፋዩቿ/

VERSE 5
አልል በሉ ሚዜዎቹ አብሮ አደጉ ጓደኞቹ', 'abro adgu guadegnochu
all belu miziewoቿ
abro adegua guadegnoቿ
349 yasdestal

VERSE 1
yasdestal/2/ yeagna emnetachn
yeortodoks tewaሕdo yegabcha ሥrዓtachn/2/
tefetseme/2/ zarie ሠrgachhu
msgana ygbaw anlalen /2/

VERSE 2
cheru amlakachnn
350. nፅht dngl
ntsht dngl brkt
yeamlak anat amebiet

VERSE 3
ljochsh mushroch huletum and honu
tewahadu texameru beqdus qurbanu/2/
ftsum menfesawi lyu fqr
anchi yaleshbet melkam tdar

VERSE 4
meሠretu zarie ljochsh
qdst hoy barkiyachew tegegntesh
all belu miziewochu /miziewoቿ/
yedesta tekafayuchu/tekafayuቿ/

VERSE 5
all belu miziewochu abro adegu guadegnochu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ell-all', 'እልል አልል', 'እልል አልል', 'ell all', 'Ethiopian Orthodox Tewahedo Mezmur - እልል አልል', 'አልል አልል ደስ ይበለን/ቋ2/
አጅበን መጣን ሙሽሮችን /2/
አልል ብላችሁ ተቀበሉን /2/
አናንተ ሙሽሮች እንኳን ደስ አላችሁ/2/

VERSE 1
የአብርሃም የሣራ ይሁን ጋብቻችሁ/2/
መልካም መተሣሳብ ክርስቶስ ይስጣችሁ/ሪ/
ሣራና አብርፃም ሁሉም የሚያውቋቸው/2/
ሁለቱም ቅዱሳን ናቸው/2/

VERSE 2
ፍቅራቸውን አይቶ አምላክ ባረካቸው/2/
ለአናት ለአባት ታዛዥ ግሩም ልጅ ሠጣቸው/2/
ለጌታ መሥዋዕት አኔ ልቅረብ ያለው/2/
ይስሐቅን ለአብርሃም የሠጠው/2/', 'all all des ybelen/qua2/
ajben mexan mushrochn /2/
all blachhu teqebelun /2/
anante mushroch enkuan des alachhu/2/

VERSE 1
yeabrሃm yeሣra yhun gabchachhu/2/
melkam meteሣsab krstos ysxachhu/ri/
ሣrana abrፃm hulum yemiyawquachew/2/
huletum qdusan nachew/2/

VERSE 2
fqrachewn ayto amlak barekachew/2/
leanat leabat tazazh grum lj ሠxachew/2/
legieta meሥwaዕt anie lqreb yalew/2/
ysሐqn leabrሃm yeሠxew/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemelkam-gabcha-bexru-tdar-new-2', 'በመልካም ጋብቻ በጥሩ ትዳር ነው/2/', 'በመልካም ጋብቻ በጥሩ ትዳር ነው/2/', 'bemelkam gabcha bexru tdar new/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በመልካም ጋብቻ በጥሩ ትዳር ነው/2/', 'ቅዱስ አባታችን ፈጣሪያችን ሆይ
ጌታችን አምላካችን ሆይ |
በአብርሃም ጎጆ እንደገባህበት 2 |
በሙሽሮቹም ቤት በረከት ሙላበት

VERSE 1
በቃናዋ መንደር የጠራኽ ሠርገኛ/2/
አምላክ ተገኘልህ ሆነህ አድላኛ /2/
በቃናዋ መንደር የጠራሽ ሠርገኛ''/2
ድንግል ጎበኘችሽ ሆነሽ አድለኛ', 'qdus abatachn fexariyachn hoy
gietachn amlakachn hoy |
beabrሃm gojo endegebahbet 2 |
bemushrochum biet bereket mulabet

VERSE 1
beqanawa mender yexeraኽ ሠrgegna/2/
amlak tegegnelh honeh adlagna /2/
beqanawa mender yexerash ሠrgegna''/2
dngl gobegnechsh honesh adlegna', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-r-te-teklil-be-ga-wedemu', 'በሥርዓተ ተክሊል', 'በሥርዓተ ተክሊል', 'beሥrዓte teklil beሥga wedemu', 'Ethiopian Orthodox Tewahedo Mezmur - በሥርዓተ ተክሊል', 'በመድኃኔዓለም ፊት ጋብቻን ፈጸሙ/2/
በሥርዓተ ተክሊል
ከተጣመራችሁ
ደስታ ሰላም ይሙላ

VERSE 1
ይመር ትዳራችሁ', 'bemedኃnieዓlem fit gabchan fetsemu/2/
beሥrዓte teklil
ketexamerachhu
desta selam ymula

VERSE 1
ymer tdarachhu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dmie-yematusalan-yeabr-m', 'ፅድሜ የማቱሳላን የአብርፃም', 'ፅድሜ የማቱሳላን የአብርፃም', 'ፅdmie yematusalan yeabrፃm', 'Ethiopian Orthodox Tewahedo Mezmur - ፅድሜ የማቱሳላን የአብርፃም', 'በቅዱስ ጋብቻ ሙሽሮች ተወስናችሁ
ክርስቶስ ተገኝቷል በመሃከላችሁ
የድንጋዮቹን ጋን ወይኑን/2/ሊሞላበት/2/
ከድንግል ማርያም ጋር ተገኝቷል ከዚህ ቤት', 'beqdus gabcha mushroch tewesnachhu
krstos tegegntual bemeሃkelachhu
yedngayochun gan weynun/2/limolabet/2/
kedngl maryam gar tegegntual kezih biet', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-ga-wedemu-egziab-r', 'በሥጋ ወደሙ እግዚአብሔር', 'በሥጋ ወደሙ እግዚአብሔር', 'beሥga wedemu egziabሔr', 'Ethiopian Orthodox Tewahedo Mezmur - በሥጋ ወደሙ እግዚአብሔር', 'ስለመረጣችሁ/2/
የመንፈስ ቅዱስም ሕፃናቶች ናችሁ/ኃ/
357. አፁብ ድንቅ ስራ
አጹብ ድንቅ ስራ/2/

VERSE 1
በአውነት የታደለ የእግዚአብሔር ሙሽራ
በአውነት የታደለች የአግዚአብሔር ሙሸራ
ነፍሳችሁ በሰማይ ርግብ ትመስላለች
ከመላእክት ጋራ ዛሬ ዘምራለች/2/

VERSE 2
አልል/2/ በሉ ክርስቲያኖች ሁሉ
ያበራ ጀመረ ሙሽራው ፀዳሉ
ታበራ ጀመረ ሙሽሪት ፀዳሏ
ከክርስቶስ ፍቅር እንዴት ይርቃል ሰው

VERSE 3
ሥጋና ደሙን ሳይሳሳ ለሰጠው/2/
የመንፈስ ቅዱስ ሕፃናት በመሆን
በሥጋ ወደሙ መቀደስ አለብን
በሥጋ ወደሙ መቀደስ አለብን

VERSE 4
በሥጋ ወደሙ እግዚአብሔር ስለመረጣችሁ /2/
የመንፈስቅዱስም ሕፃናቶች ናችሁ /2/', 'slemerexachhu/2/
yemenfes qdusm ሕፃnatoch nachhu/ኃ/
357. aፁb dnq sra
atsub dnq sra/2/

VERSE 1
beawnet yetadele yeegziabሔr mushra
beawnet yetadelech yeagziabሔr mushera
nefsachhu besemay rgb tmeslalech
kemelaekt gara zarie zemralech/2/

VERSE 2
all/2/ belu krstiyanoch hulu
yabera jemere mushraw ፀdalu
tabera jemere mushrit ፀdalua
kekrstos fqr endiet yrqal sew

VERSE 3
ሥgana demun saysasa lesexew/2/
yemenfes qdus ሕፃnat bemehon
beሥga wedemu meqedes alebn
beሥga wedemu meqedes alebn

VERSE 4
beሥga wedemu egziabሔr slemerexachhu /2/
yemenfesqdusm ሕፃnatoch nachhu /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beagziab-r-tebarko-yemenor-msxir', 'በአግዚአብሔር ተባርኮ የመኖር ምስጢር', 'በአግዚአብሔር ተባርኮ የመኖር ምስጢር', 'beagziabሔr tebarko yemenor msxir', 'Ethiopian Orthodox Tewahedo Mezmur - በአግዚአብሔር ተባርኮ የመኖር ምስጢር', 'የዘላላም ሕይወት ይሠጣል ፍቅር/2/
ሥጋውን ፍሪዳ ደሙን መጠጥ አድርጎ
ሰጥቶናል አማኑኦል ሕይወቱን ሰውቶ/2/
358. ዘተመነያ', 'yezelalam ሕywet yሠxal fqr/2/
ሥgawn frida demun mexex adrgo
sextonal amanuol ሕywetun sewto/2/
358. zetemeneya', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-ga-wedemu-ljochsh-and-honewal-zarie-2', 'በሥጋ ወደሙ ልጆችሽ አንድ ሆነዋል ዛሬ/2/', 'በሥጋ ወደሙ ልጆችሽ አንድ ሆነዋል ዛሬ/2/', 'beሥga wedemu ljochsh and honewal zarie/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በሥጋ ወደሙ ልጆችሽ አንድ ሆነዋል ዛሬ/2/', 'በሥጋ ወደሙ በተክሊሉ የተሳሰረ/ሪ2/
በመንግሥተ ሰማይ ይኖራል እንደተከበረ/4/
አመቤታችን አናታችን ማርያም//2/', 'beሥga wedemu beteklilu yetesasere/ri2/
bemengሥte semay ynoral endetekebere/4/
amebietachn anatachn maryam//2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gneyu-leegziab-r-asme-r-2', 'ግነዩ ለእግዚአብሔር አስመሔር/2/', 'ግነዩ ለእግዚአብሔር አስመሔር/2/', 'gneyu leegziabሔr asmeሔr/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ግነዩ ለእግዚአብሔር አስመሔር/2/', 'እስመ ለዓለም ምሕረቱ አእስከለዓለም/4/
360. ደስ አላቸው
ደስ አላቸው ሙሸራው ሙሽሪት
በዝማሬ

VERSE 1
ደምቆ ታይቷል
ጋብቻቸው
አግዚአብሔር ይመስገን ሙሽራው ሙሽሪት
ኃያሉ ጌታቸው

VERSE 2
ለዚህ ላበቃቸው ሙሽራው ሙሽሪት
ወንድም እህታችንን ..
ጋብቻ ቅዱስ ነው
ብሏል አምላካችን

VERSE 3
እንደዚህ ሲፈጸም በቤተክርስቲያን', 'esme leዓlem mሕretu aeskeleዓlem/4/
360. des alachew
des alachew musheraw mushrit
bezmarie

VERSE 1
demqo taytual
gabchachew
agziabሔr ymesgen mushraw mushrit
ኃyalu gietachew

VERSE 2
lezih labeqachew mushraw mushrit
wendm ehtachnn ..
gabcha qdus new
blual amlakachn

VERSE 3
endezih sifetsem bebietekrstiyan', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('merxo-aht-sexew-leadam-mushraw', 'መርጦ አህት ሰጠው ለአዳም ሙሽራው', 'መርጦ አህት ሰጠው ለአዳም ሙሽራው', 'merxo aht sexew leadam mushraw', 'Ethiopian Orthodox Tewahedo Mezmur - መርጦ አህት ሰጠው ለአዳም ሙሽራው', 'ሔዋን ጉኑ ሆና
አዳም ሆይ ስትለው
በረዳትነቷ
አዳም ደስ ደስ አለው', 'ሔwan gunu hona
adam hoy stlew
beredatnetua
adam des des alew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ande-aday-abeba-mushroch-fektachhu', 'አንደ አዳይ አበባ ሙሽሮች ፈክታችሁ', 'አንደ አዳይ አበባ ሙሽሮች ፈክታችሁ', 'ande aday abeba mushroch fektachhu', 'Ethiopian Orthodox Tewahedo Mezmur - አንደ አዳይ አበባ ሙሽሮች ፈክታችሁ', 'በለመለመ መስክ ያለ ፍሬ መስላችሁ
ልክ እንደ ጨረቃ እንደሰማይ ፀሐይ
መልካሙ ሥራችሁ በራ በአደባባይ
ካባዋን ደርባ በጥበቡ ላይ

VERSE 1
የተዋሕዶ ልጅ ደምቃ ስትታይ
በቤተክርስቲያን ሥርዓት በማደጓ
ይኸው መሠከረ የሙሽሪት ሠርጓ
መልካም ስነምግባር ፍቅር የከበበህ

VERSE 2
የአመብርፃን ልጅ አቤት ማማርህ
ከመቼውም በላይ ዛሬ ተውበፃሃል
የአማኑኤል ግርማ ዙሪያህን ከቦዛል
መልካም ሥነምግባር ፍቅር የከበበሽ

VERSE 3
የአመብርፃሃን ልጅ አቤት ማማርሽሸ
ከመቼውም በላይ ዛሬ ተውበሻል
የአማኑኤል ግርማ ዙሪያሽን ከቦሻል
የአመቤቴ ፀዳል ዙሪያሽን ከቦሻል', 'belemeleme mesk yale frie meslachhu
lk ende cereqa endesemay ፀሐy
melkamu ሥrachhu bera beadebabay
kabawan derba bexbebu lay

VERSE 1
yetewaሕdo lj demqa sttay
bebietekrstiyan ሥrዓt bemadegua
yኸw meሠkere yemushrit ሠrgua
melkam snemgbar fqr yekebebeh

VERSE 2
yeamebrፃn lj abiet mamarh
kemechiewm belay zarie tewbeፃሃl
yeamanuiel grma zuriyahn kebozal
melkam ሥnemgbar fqr yekebebesh

VERSE 3
yeamebrፃሃn lj abiet mamarshshe
kemechiewm belay zarie tewbeshal
yeamanuiel grma zuriyashn keboshal
yeamebietie ፀdal zuriyashn keboshal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('and-akal-mushroch-eyuachew-siyaberu', 'አንድ አካል ሙሽሮች እዩአቸው ሲያበሩ', 'አንድ አካል ሙሽሮች እዩአቸው ሲያበሩ', 'and akal mushroch eyuachew siyaberu', 'Ethiopian Orthodox Tewahedo Mezmur - አንድ አካል ሙሽሮች እዩአቸው ሲያበሩ', 'በወንጌሉ በተክሊሉ ፄዱ አየተመሩ
አንግዳቸው ብዙ ድንኳናቸው ሙሉ
ጌታ ከእናቱ ጋር አለ በመፃሉ
የወይን ጋኖቹ ዛሬ ሙሉ ናቸው

VERSE 1
አማኑኤል ድንግል ማርያም ስላሉ ቤታቸው
በክብር ታጅቦ ሲመጣ መርዓዊ
አጅግ ያስደስታል አይደለም ምድራዊ
ዛሬም በዚህ ድንኳን ደስታ ተደረገ

VERSE 2
በአማነኑኤ በአምለካችን ስለተባረከ
በተክሊል በቁርባን የሆነው አንድነት
አይነጣጠልም ዳግም ወደ ሁለት
ሙሽሪት ሙሽራው ተደሰቱ ዛሬ

VERSE 3
በሠርጋቸው ተገለጠ የእምነታችሁ ፍሬ
363. ሶበ ሠማይነ
ሶበ ሰማእነ ዜናከ መጻእነ ኀቤከ/2/
መጻእነ/4/

VERSE 4
አንደ ሰብአ ሰገል ነገሥተ ምሥራቅ
ዝናህን ለመስማት መጣን ልንጠየቅ
አንደ ሰብአ ሰገል ነገሥተ ምሥራቅ
ዝናሽን ለመስማት መጣን ልንጣይቅሽ

VERSE 5
ብቻህን ስላየህ ቢወድህ ፈጣሪ
ፈጠረልህ ለአንተ አጽናኝ አማካሪ
የወንጌልን ትዕዛዝ በመፈጸምህ
ለዚህ ክብር በቃህ በድንግልናህ

VERSE 6
የወንጌልን ትዕዛዝ በመፈጸምሽ
ለዚህ ክብር በቃሽ በድንግልናሽ
አንቺ ቤተልሔም ቤተክርስቲያን
ሁለቱን አዋሐድሽ በቅዱስ ቁርባን

VERSE 7
364. አንደ አብርፃም
አንደ አብርፃም እንደሣራ/2/
ሥላሴ ይኑሩ ከአናንተ ጋራ/ጋ/
ቤታችሁ ይባረክ በረከት ይሙላ', 'bewengielu beteklilu ፄdu ayetemeru
angdachew bzu dnkuanachew mulu
gieta keenatu gar ale bemeፃlu
yeweyn ganochu zarie mulu nachew

VERSE 1
amanuiel dngl maryam slalu bietachew
bekbr tajbo simexa merዓwi
ajg yasdestal aydelem mdrawi
zariem bezih dnkuan desta tederege

VERSE 2
beamanenuie beamlekachn sletebareke
beteklil bequrban yehonew andnet
aynexaxelm dagm wede hulet
mushrit mushraw tedesetu zarie

VERSE 3
beሠrgachew tegelexe yeemnetachhu frie
363. sobe ሠmayne
sobe semaene zienake metsaene ኀbieke/2/
metsaene/4/

VERSE 4
ande seba segel negeሥte mሥraq
znahn lemesmat mexan lnxeyeq
ande seba segel negeሥte mሥraq
znashn lemesmat mexan lnxayqsh

VERSE 5
bchahn slayeh biwedh fexari
fexerelh leante atsnagn amakari
yewengieln tዕzaz bemefetsemh
lezih kbr beqah bednglnah

VERSE 6
yewengieln tዕzaz bemefetsemsh
lezih kbr beqash bednglnash
anchi bietelሔm bietekrstiyan
huletun awaሐdsh beqdus qurban

VERSE 7
364. ande abrፃm
ande abrፃm endeሣra/2/
ሥlasie ynuru keanante gara/ga/
bietachhu ybarek bereket ymula', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amro-siyabera', 'አምሮ ሲያበራ', 'አምሮ ሲያበራ', 'amro siyabera', 'Ethiopian Orthodox Tewahedo Mezmur - አምሮ ሲያበራ', 'አምሮ ሲያበራ ኑ ተመልከቱ/2/
በአግዚአብሔር ክብር ሲሞላ ቤቱ/2/
ማነው የገባው በዚህ ጣሪያ ስር
ለሙሽሮቹ ደስታ ሊያበስር

VERSE 1
ቤቱ ተሞላ ሰላም ፍስሐ
አናቅርብለት ምስጋና አምኃ
በአብርሃም ቤት የተገለጠው
በአላዘር ቤት አራት የበላው

VERSE 2
ከእናቱ ጋራ ገባ ከአቤቱ
ቤተዘመዱ ኑ ተደሰቱ
የአኛ ሙሸራ ደስ ይበልህ
ታላቅ እንግዳ ገብቷል ከቤትህ

VERSE 3
ሙሽራችን ሆይ ደስ ይበልሽ
የሰማይ ንግስት ጎባኘችሽ
ለእድምተኞቹ መልካም ወይን አለን
የቃናው ጌታ የጠመቀልን

VERSE 4
አናፍርም እኛ አንግዳ ጠርተን
አምላክ ከኛ ጋር ስለሆነልን
367. እሰይ እሰይ', 'amro siyabera nu temelketu/2/
beagziabሔr kbr simola bietu/2/
manew yegebaw bezih xariya sr
lemushrochu desta liyabesr

VERSE 1
bietu temola selam fsሐ
anaqrblet msgana amኃ
beabrሃm biet yetegelexew
bealazer biet arat yebelaw

VERSE 2
keenatu gara geba keabietu
bietezemedu nu tedesetu
yeagna mushera des ybelh
talaq engda gebtual kebieth

VERSE 3
mushrachn hoy des ybelsh
yesemay ngst gobagnechsh
leedmtegnochu melkam weyn alen
yeqanaw gieta yexemeqeln

VERSE 4
anafrm egna angda xerten
amlak kegna gar slehoneln
367. esey esey', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('asey-asey-beadam-tejemro', 'አሰይ አሰይ በአዳም ተጀምሮ', 'አሰይ አሰይ በአዳም ተጀምሮ', 'asey asey beadam tejemro', 'Ethiopian Orthodox Tewahedo Mezmur - አሰይ አሰይ በአዳም ተጀምሮ', 'የአንድ አካል ምስጢር
በገነት ሲኖሩ
በጽድቅ ምድር
አካሌ ናት አላት ሔዋንን በፍቅር

VERSE 1
አሰይ አሰይ መካን ሆነው ሣለ
ሐናና እያቄም
የጸናው አንድነት
አልተነጣጠለም

VERSE 2
በእምነት ቢቆሙ
በጾም በጸሎት
ድንግል ተወለደች ልትሆን መድኃኒት
አሰይ አሰይ ዛሬም በሙሽሮች

VERSE 3
ይህንን አይተናል
በቅዱስ ጋብቻ
በማይነጣጠል
ምሥጢር ተፈጸመ በሥርዓተ ተክሊል', 'yeand akal msxir
begenet sinoru
betsdq mdr
akalie nat alat ሔwann befqr

VERSE 1
asey asey mekan honew ሣle
ሐnana eyaqiem
yetsenaw andnet
altenexaxelem

VERSE 2
beemnet biqomu
betsom betselot
dngl teweledech lthon medኃnit
asey asey zariem bemushroch

VERSE 3
yhnn aytenal
beqdus gabcha
bemaynexaxel
mሥxir tefetseme beሥrዓte teklil', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kegonu-tefexresh-be-lasie-xbeb', 'ከጎኑ ተፈጥረሽ በሥላሴ ጥበብ', 'ከጎኑ ተፈጥረሽ በሥላሴ ጥበብ', 'kegonu tefexresh beሥlasie xbeb', 'Ethiopian Orthodox Tewahedo Mezmur - ከጎኑ ተፈጥረሽ በሥላሴ ጥበብ', 'አክብሪው ባልሽን ተዋደዱ ከልብ
አዳም ከጎንሽ ነው የሚያስብልሽ
የአምላክን ስጦታ ውሰጅው ፈቅደሽ', 'akbriw balshn tewadedu kelb
adam kegonsh new yemiyasblsh
yeamlakn sxota wsejw feqdesh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('atsub-bereket-sexesh', 'አጹብ በረከት ሰጠሽ', 'አጹብ በረከት ሰጠሽ', 'atsub bereket sexesh', 'Ethiopian Orthodox Tewahedo Mezmur - አጹብ በረከት ሰጠሽ', 'ሁለት አይደለም ቃላቸው
ዘወትር አንድ ነው ድምጻቸው
የኑሮን ሕይወት እንዲገፉ
በአንድነት ሆነው ተሰለፉ', 'hulet aydelem qalachew
zewetr and new dmtsachew
yenuron ሕywet endigefu
beandnet honew teselefu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-ga-wedemu-and-honew', 'በሥጋ ወደሙ አንድ ሆነው', 'በሥጋ ወደሙ አንድ ሆነው', 'beሥga wedemu and honew', 'Ethiopian Orthodox Tewahedo Mezmur - በሥጋ ወደሙ አንድ ሆነው', 'ሙሽሪትና ሙሽራው
ሁለት አይደለም ኑሮአቸው
ከአንግዲህ አንድ ነው ጎጆአቸው
መሠረት ጣሪያ ግድግዳው

VERSE 1
እግዚአብሔር ነው ምሰሶው', 'mushritna mushraw
hulet aydelem nuroachew
keangdih and new gojoachew
meሠret xariya gdgdaw

VERSE 1
egziabሔr new msesow', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nsieb-le-lasie', 'ንሴብሖ ለሥላሴ', 'ንሴብሖ ለሥላሴ', 'nsiebሖ leሥlasie', 'Ethiopian Orthodox Tewahedo Mezmur - ንሴብሖ ለሥላሴ', 'ንሴብሖ ለሥላሴ/2/
ክበር ተመስገን አምላከ ሙሴ/2/
የአኛ አማላጅ አናታችን/2/
ነይ ነይ ወደኛ እመቤታችን/2/

VERSE 1
ፈጥነሽ ተገፒ በመፃላችን
ና ወደኛ ሚካኤል/2/
መልአከ ምክሩ ለልዑል
ከአግራችን ይውደቅ ሳጥናኤል

VERSE 2
ና ወደኛ ገብርኤል/2/
ከአሳቱ አውጣን ከነበልባል
በክንፍህ ጥላ አንከለል
ና ወደኛ ዑራኤል/2/

VERSE 3
አንደ ቅዱስ አዝራ ሱቱኤል
ጥበብን ስጠን ማስተዋል
ና ወደኛ በፈረስ/2/
የልደው ፀሐይ ጊዮርጊስ ገድልህን ሰምተን

VERSE 4
እንፈወስ/ሪ/
ና ወደኛ ተክለሃይማኖት/2/
ይጠብቀን ያንተ ጸሎት ጸንተን አንድንቆም
በሃይማኖት/2/

VERSE 5
372. የቤታችን ራስ
የቤታችን ራስ ልጅሽ ነው
አማላጅነትሽ የሚያድነን ነው/2
አመብርሃን/2/ሰላም አንቺ እኮ ነሽ ለቤታችን/2/

VERSE 6
ምን አለንና እኛ በጓዳችን
የጎደለ ነው ይኸው ማድጋችን
ነይ ከልጅሽ ጋር እንድትሞይልን
ድንግል እመቤታችን/2/

VERSE 7
ያለን ውኃ ነው ከባዶ ጋን ጋራ
የጓሮውም ወይን ብዙም አላፈራ
የደፃ ጎጆአችን እንዲባረክልን', 'nsiebሖ leሥlasie/2/
kber temesgen amlake musie/2/
yeagna amalaj anatachn/2/
ney ney wedegna emebietachn/2/

VERSE 1
fexnesh tegepi bemeፃlachn
na wedegna mikaiel/2/
melake mkru lelዑl
keagrachn ywdeq saxnaiel

VERSE 2
na wedegna gebriel/2/
keasatu awxan kenebelbal
beknfh xla ankelel
na wedegna ዑraiel/2/

VERSE 3
ande qdus azra sutuiel
xbebn sxen mastewal
na wedegna beferes/2/
yeldew ፀሐy giyorgis gedlhn semten

VERSE 4
enfewes/ri/
na wedegna tekleሃymanot/2/
yxebqen yante tselot tsenten andnqom
beሃymanot/2/

VERSE 5
372. yebietachn ras
yebietachn ras ljsh new
amalajnetsh yemiyadnen new/2
amebrሃn/2/selam anchi eko nesh lebietachn/2/

VERSE 6
mn alenna egna beguadachn
yegodele new yኸw madgachn
ney keljsh gar endtmoyln
dngl emebietachn/2/

VERSE 7
yalen wኃ new kebado gan gara
yeguarowm weyn bzum alafera
yedeፃ gojoachn endibarekln', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yemtsewriw', 'የምትሰውሪው', 'የምትሰውሪው', 'yemtsewriw', 'Ethiopian Orthodox Tewahedo Mezmur - የምትሰውሪው', 'በጎጆአችን ውስጥ
ሁሌ የምትኖረው
ቤታችን ይቀደስ ለጾም ለጸሎት
አንድንተጋ

VERSE 1
ለሠናይ ምግባር
አንድንነሣ
ዘወትር ጧት ማታ
አንድናስብህ

VERSE 2
በትዳራችን
ከእኛ አትለየን
ቤታችን ይቀደስ የምናመልከው
አንተን ብቻ ነው

VERSE 3
ተስፋችን በአንተ
አጅግ ጽኑ ነው
ማን ይመስልፃል
በምድር በሰማይ

VERSE 4
ወረት የሌለህ', 'begojoachn wsx
hulie yemtnorew
bietachn yqedes letsom letselot
andntega

VERSE 1
leሠnay mgbar
andnneሣ
zewetr xuat mata
andnasbh

VERSE 2
betdarachn
keegna atleyen
bietachn yqedes yemnamelkew
anten bcha new

VERSE 3
tesfachn beante
ajg tsnu new
man ymeslፃl
bemdr besemay

VERSE 4
weret yelieleh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('genana-new-amlak-kbrh', 'ገናና ነው አምላክ ክብርህ', 'ገናና ነው አምላክ ክብርህ', 'genana new amlak kbrh', 'Ethiopian Orthodox Tewahedo Mezmur - ገናና ነው አምላክ ክብርህ', 'አልልታ ነው በሰማያት
በሙሽሮች ብሩህ መብራት
በአግዚአብሔር ፊት ተንበርክካችሁ
የክብር አክሊሊ ስለሰጣችሁ

VERSE 1
ገናና ነው አምላክ ክብርህ
ምሕረቱን አይተናልና
አድርሶናል አምላክ በጤና
ይህችን እድሜ የጨመረልን

VERSE 2
ለንስሓ ጊዜ የሰጠን', 'allta new besemayat
bemushroch bruh mebrat
beagziabሔr fit tenberkkachhu
yekbr aklili slesexachhu

VERSE 1
genana new amlak kbrh
mሕretun aytenalna
adrsonal amlak bexiena
yhchn edmie yecemereln

VERSE 2
lensሓ gizie yesexen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beagziab-r-biet-hone-rgachhu', 'በአግዚአብሔር ቤት ሆነ ሠርጋችሁ', 'በአግዚአብሔር ቤት ሆነ ሠርጋችሁ', 'beagziabሔr biet hone ሠrgachhu', 'Ethiopian Orthodox Tewahedo Mezmur - በአግዚአብሔር ቤት ሆነ ሠርጋችሁ', 'ለዚህች ዕለት አደረሳችሁ
በአምላክ አቅፍ ሆነ ነፍሳችሁ
የዘለዓለም ሙሽሮች ናችሁ
ለመዳን ቀን የተጠራችሁ', 'lezihch ዕlet aderesachhu
beamlak aqf hone nefsachhu
yezeleዓlem mushroch nachhu
lemedan qen yetexerachhu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('asti-zemrulet-lemushraw', 'አስቲ ዘምሩለት ለሙሽራው', 'አስቲ ዘምሩለት ለሙሽራው', 'asti zemrulet lemushraw', 'Ethiopian Orthodox Tewahedo Mezmur - አስቲ ዘምሩለት ለሙሽራው', 'በአንድነት ሆናችሁ
ወደ አዲሱ ቤት ለሙሽራው
መግባቱን አይታችሁ
አስቲ ዘምሩላት ለሙሽሪት

VERSE 1
በአንድነት ሆናችሁ
ረዳት አገኘች የእኛ ሙሽራ
ጥሩ ወንድምን', 'beandnet honachhu
wede adisu biet lemushraw
megbatun aytachhu
asti zemrulat lemushrit

VERSE 1
beandnet honachhu
redat agegnech yeegna mushra
xru wendmn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('stbequ-lekbr-lemushrochu', 'ስትበቁ ለክብር ለሙሽሮቹ', 'ስትበቁ ለክብር ለሙሽሮቹ', 'stbequ lekbr lemushrochu', 'Ethiopian Orthodox Tewahedo Mezmur - ስትበቁ ለክብር ለሙሽሮቹ', 'ለመልካም ትዳር
ጎጆ ስትቀልሱ ለሙሽሮቹ
በአግዚአብሔር ፈቃድ
አብነት ለመሆን የእኛ ሙሽሮች

VERSE 1
ለጓደኞቻችሁ
ወልዳችሁ ለመክበድ የአኛ ሙሽሮች
አግዚአብሔር ይርዳችሁ
37686. የክብሯ መግለጫ

VERSE 2
የክብራ መግለጫ የድንግልናዋ/2/
ይኸው ዛሬ ታየ በተክሊሉ ደምቃ
ይኸው ዛሬ ታየ ካባዋን ደርባ
የክብራ መግለጫ ከሆኑት ነገሮች

VERSE 3
ቅዱስ ጋብቻ ነው
የክብራ መግለጫ ክብራን መጠበቋ', 'lemelkam tdar
gojo stqelsu lemushrochu
beagziabሔr feqad
abnet lemehon yeegna mushroch

VERSE 1
leguadegnochachhu
weldachhu lemekbed yeagna mushroch
agziabሔr yrdachhu
37686. yekbrua megleca

VERSE 2
yekbra megleca yednglnawa/2/
yኸw zarie taye beteklilu demqa
yኸw zarie taye kabawan derba
yekbra megleca kehonut negeroch

VERSE 3
qdus gabcha new
yekbra megleca kbran mexebequa', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yefqrun-bereket-dnq-teamratun', 'የፍቅሩን በረከት ድንቅ ተአምራቱን', 'የፍቅሩን በረከት ድንቅ ተአምራቱን', 'yefqrun bereket dnq teamratun', 'Ethiopian Orthodox Tewahedo Mezmur - የፍቅሩን በረከት ድንቅ ተአምራቱን', 'በቤትህ የገባው አንተ የጠራኸው
አልፋና ዖሜጋ ሁሉን አድራጊ ነው
ተአምራት ያደርጋል በእጆቹ ሥራ
መድኅን ክርስቶስ ከእናቱ ጋራ', 'bebieth yegebaw ante yexeraኸw
alfana ዖmiega hulun adragi new
teamrat yadergal beejochu ሥra
medኅn krstos keenatu gara', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keme-gie', 'ከመፅጌ', 'ከመፅጌ', 'kemeፅgie', 'Ethiopian Orthodox Tewahedo Mezmur - ከመፅጌ', 'ከመ ጽጌ ሮማን ከመ ጽጊገጌ/2/
ሙሽራዩ/ሪ/----------””-””--
ሲሳዬ/2/', 'keme tsgie roman keme tsgigegie/2/
mushrayu/ri/----------””-””--
sisayie/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lezih-adl-tezegaju', 'ለዚህ አድል ተዘጋጁ', 'ለዚህ አድል ተዘጋጁ', 'lezih adl tezegaju', 'Ethiopian Orthodox Tewahedo Mezmur - ለዚህ አድል ተዘጋጁ', 'የክብር አክሊል ተቀዳጁ
ለዚህ አድል ተዘጋጁ
የክብር አክሊል ተቀዳጁ', 'yekbr aklil teqedaju
lezih adl tezegaju
yekbr aklil teqedaju', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amaakuki', 'አማአኩኪ', 'አማአኩኪ', 'amaakuki', 'Ethiopian Orthodox Tewahedo Mezmur - አማአኩኪ', 'አማአኩኪ ቅድስት ቤተክርስቲያን
ከብካብ ኮነ በቃና ዘገሊላ/2/
ድምጸ እንዚራ ውስተ ቤተ እአግዚአብሔር/2/
386. ወአንቲኒ

VERSE 1
ወአንቲኒ መርዓት አም ኀበኒ መጻእኪ
ወገበኒ ተሐውሪ መድኃኒተ ኩኒ/2/
መርዓተ ሕጉ ለመርዓዊ ዐቢይ/4/
የኪዳነምሕረት መዝሙር

VERSE 2
387. አምላክ ለእኛ ብሎ
አምላክ ለእኛ ብሎ ቃል ኪዳን የሰጣት /2/
የኃጥአን አማላጅ ድንግል ማርያም ናት /4
አንደ አማለድሽው በላዔ ሰብእን /2/

VERSE 3
አኛንም እባክሽ አደራ አማልጅን /4
ምሕረት እንድናገኝ ከአምላካችን /2/
አማላጅ ሁኝልን አመቤታችን /4', 'amaakuki qdst bietekrstiyan
kebkab kone beqana zegelila/2/
dmtse enzira wste biete eagziabሔr/2/
386. weantini

VERSE 1
weantini merዓt am ኀbeni metsaeki
wegebeni teሐwri medኃnite kuni/2/
merዓte ሕgu lemerዓwi ዐbiy/4/
yekidanemሕret mezmur

VERSE 2
387. amlak leegna blo
amlak leegna blo qal kidan yesexat /2/
yeኃxan amalaj dngl maryam nat /4
ande amaledshw belaዔ seben /2/

VERSE 3
agnanm ebaksh adera amaljn /4
mሕret endnagegn keamlakachn /2/
amalaj hugnln amebietachn /4', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('anti-m-raq', 'አንቲ ምሥራቅ', 'አንቲ ምሥራቅ', 'anti mሥraq', 'Ethiopian Orthodox Tewahedo Mezmur - አንቲ ምሥራቅ', 'ክነፈ ርግብ በብሩር ዘግቡር ወገበዋቲሃኒ ሐመልማለ
ወርቅ /2/
አንቲ ምሥራቅ ወወልድኪ ፀሐየ ጽድቅ አማን በአማን', 'knefe rgb bebrur zegbur wegebewatiሃni ሐmelmale
werq /2/
anti mሥraq weweldki ፀሐye tsdq aman beaman', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ande-rgb-knf-bebrm-endete-ra-gonochshm', 'አንደ ርግብ ክንፍ በብርም እንደተሠራ ጎኖችሽም', 'አንደ ርግብ ክንፍ በብርም እንደተሠራ ጎኖችሽም', 'ande rgb knf bebrm endeteሠra gonochshm', 'Ethiopian Orthodox Tewahedo Mezmur - አንደ ርግብ ክንፍ በብርም እንደተሠራ ጎኖችሽም', 'የወርቅ ሐመልማል /2/
አንቺ ምሥራቅ ልጅሽም የጽድቅ ፀሐይ ነው
አውነት በእውነት (3) አያልቅም ቃል ኪዳንሽ
የአምላክ አናት /2/

VERSE 1
391. ሶበሰ ኪዳንኪ
ሶበሰ ኪዳንኪ ምክንያተ ድጊን ኢሀሎ /2/
ፈለገ አሳት ወደይን አም አስጠመ ኩሎ
ፈለገ አሳት ወደይን ወደይን አም አስጠመ ኩሎ

VERSE 2
ትርጉም :- የመዳን ምክንያት የሆነው ቃል
ኪዳንሽ ባይኖር ኖሮ የአሳት ማዕበል ሁሉን
ባሰጠመ ነበር
392. አንቺ ነሽ ተስፋው

VERSE 3
አንቺ ነሽ ተስፋው ለአዳም ኪዳነምሕረት/2/
በተሰደደ ጊዜ ከገነት /2/
393.መርሕ ዘገነት
መርሕ ዘገነት መርሕ ዘገነት /2/

VERSE 4
አንቺ ነሽ /2/ ኪዳነምሕረት
ቅድስት አመቤቴ የጌታዬ አናት
ሆነሽ የተገኘሽ ንጽሕት ቅድስት
አንቺ ነሽ...

VERSE 5
የሲና ሐመልማል የሰው ልጅ ሕይወት
አንቺን የመረጠ ይክበር መለኮት
አንቺ ነሽ
አዘክሪ ድንግል ለልጅሽ በአውነት

VERSE 6
በደኅና አንዲያደርሰን ለመጪው ዓመት
አንቺ ነሽ
394 ተናዘዘብኪ
ተናዘዘ ብኪ አኮኑ ኅሊና ቀዳማይ አብ /2/

VERSE 7
ኪዳነምሕረት ማርያም ኪዳነምሕረት
ኪዳነምሕረት ማርያም ኪዳነአምላክ
ትርጉም ፡:-', 'yewerq ሐmelmal /2/
anchi mሥraq ljshm yetsdq ፀሐy new
awnet beewnet (3) ayalqm qal kidansh
yeamlak anat /2/

VERSE 1
391. sobese kidanki
sobese kidanki mknyate dgin ihalo /2/
felege asat wedeyn am asxeme kulo
felege asat wedeyn wedeyn am asxeme kulo

VERSE 2
/2/
/2/
trgum :- yemedan mknyat yehonew qal
kidansh baynor noro yeasat maዕbel hulun

VERSE 3
basexeme neber
392. anchi nesh tesfaw
anchi nesh tesfaw leadam kidanemሕret/2/
betesedede gizie kegenet /2/

VERSE 4
393.merሕ zegenet
merሕ zegenet merሕ zegenet /2/
anchi nesh /2/ kidanemሕret
qdst amebietie yegietayie anat

VERSE 5
honesh yetegegnesh ntsሕt qdst
anchi nesh...
yesina ሐmelmal yesew lj ሕywet
anchin yemerexe ykber melekot

VERSE 6
anchi nesh
azekri dngl leljsh beawnet
bedeኅna andiyadersen lemeciw ዓmet
anchi nesh

VERSE 7
394 tenazezebki
tenazeze bki akonu ኅlina qedamay ab /2/
kidanemሕret maryam kidanemሕret
kidanemሕret maryam kidaneamlak

VERSE 8
trgum ፡:-', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-aderashn-selam-leki', 'ድንግል አደራሽን ሰላም ለኪ', 'ድንግል አደራሽን ሰላም ለኪ', 'dngl aderashn selam leki', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል አደራሽን ሰላም ለኪ', 'ሁኝልን መከታ ሰላም ለኪ
ድንግል አደራሽን ሰላም ለኪ
ሁኝልን መከታ ሰላም ለኪ', 'hugnln meketa selam leki
dngl aderashn selam leki
hugnln meketa selam leki', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ame-wer-negid', 'አመ ወርኃ ነጊድ', 'አመ ወርኃ ነጊድ', 'ame werኃ negid', 'Ethiopian Orthodox Tewahedo Mezmur - አመ ወርኃ ነጊድ', 'አመ ወርኃ ነጊድ የኀልቅ ወይፀራህ ሴጥ/2/
በገጸ ፈጣሪ ቤዛ ይኩነኒ ኪዳንኪ
በገጸ ፈጣሪ ቤዛ ይኩነኒ ኪዳን/4/', 'ame werኃ negid yeኀlq weyፀrah siex/2/
begetse fexari bieza ykuneni kidanki
begetse fexari bieza ykuneni kidan/4/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lbien-anesasto', 'ልቤን አነሳስቶ', 'ልቤን አነሳስቶ', 'lbien anesasto', 'Ethiopian Orthodox Tewahedo Mezmur - ልቤን አነሳስቶ', 'ልቤን አነሣሥቶ ያመለክተኛል
የአምላክን እናት እመናት ይለኛል/2/
አመን /4/ የአምላክ እናት አዛኝቷን /2/
404. ዕርገታ', 'lbien aneሣሥto yamelektegnal
yeamlakn enat emenat ylegnal/2/
amen /4/ yeamlak enat azagntuan /2/
404. ዕrgeta', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('regech', 'ዐረገች', 'ዐረገች', 'ዐregech', 'Ethiopian Orthodox Tewahedo Mezmur - ዐረገች', 'ዐረገች በስብሐት ዐረገች በልልታ
በስብሐት በልልታ ዐረገች/2/ በዕልልታ/2/
ከሙታን ተነሥታ ዐረገች በዕልልታ/2/
ዐረገች/2/ በዕልልታ/2/', 'ዐregech besbሐt ዐregech bellta
besbሐt bellta ዐregech/2/ beዕllta/2/
kemutan teneሥta ዐregech beዕllta/2/
ዐregech/2/ beዕllta/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdste-qdusan-nts-t', 'ቅድስተ ቅዱሳን ንጽሕት', 'ቅድስተ ቅዱሳን ንጽሕት', 'qdste qdusan ntsሕt', 'Ethiopian Orthodox Tewahedo Mezmur - ቅድስተ ቅዱሳን ንጽሕት', 'አንቺ ነሽ የአምላካችን እናት
ጌታ አንቺን መረጠሸ ልዩ አድርጎ
በሚያስደንቅ ምስጢሩ ተዋሕዶ
ለልዑል ማደሪያነት የተመረጥሽ

VERSE 1
ያለሕማም ወለድሽው ድንግል ሆነሽ
አናትነት ድንግልና አስተባብረሽ ይዘሻልና/2/
ድንግልም እናትም እመብርፃን ቅድስተ ቅዱሳን
አኛን አማልጅን /2/', 'anchi nesh yeamlakachn enat
gieta anchin merexeshe lyu adrgo
bemiyasdenq msxiru tewaሕdo
lelዑl maderiyanet yetemerexsh

VERSE 1
yaleሕmam weledshw dngl honesh
anatnet dnglna astebabresh yzeshalna/2/
dnglm enatm emebrፃn qdste qdusan
agnan amaljn /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('begietie-semanie', 'በጌቴ ሰማኔ', 'በጌቴ ሰማኔ', 'begietie semanie', 'Ethiopian Orthodox Tewahedo Mezmur - በጌቴ ሰማኔ', 'በጌቴ ሰማኔ በአትክልቱ ቦታ /2/
ለእኛ ሲል ጌታችን በዓለም ተንገላታ/2/
አዳምና ሔዋን ባጠፉት ጥፋት /2/
በአኛ ላይ ደረሰ የዘለዓለም ሞት/2/

VERSE 1
መስቀል ተሸክሞ ሲወጣ ተራራ/2
ይገርፉት ነበረ ሁሉም በየተራ (2)
ተጠማሁ/3/ ሲላቸው/2/
ኦምጣጤ አመጡለት በሃሞት ቀላቅለው/2/

VERSE 2
ድንግል አልቻለችም ዕንባዋን ልትገታ/2/
እያየች በመስቀል ልጂ ሲንገላታ/2/
በአምላክነቱ ሳይፈርድባቸው /2/
እንዲህ ሲል ጸለየ አባት ሆይ ማራቸው/2/

VERSE 3
በረቂቅ ሥልጣኑ ሁሉን የፈጠረ (2)
በሰዎች ተገርፎ ሞተ ተቀበረ/2/', 'begietie semanie beatkltu bota /2/
leegna sil gietachn beዓlem tengelata/2/
adamna ሔwan baxefut xfat /2/
beagna lay derese yezeleዓlem mot/2/

VERSE 1
mesqel teshekmo siwexa terara/2
ygerfut nebere hulum beyetera (2)
texemahu/3/ silachew/2/
omxaxie amexulet beሃmot qelaqlew/2/

VERSE 2
dngl alchalechm ዕnbawan ltgeta/2/
eyayech bemesqel lji singelata/2/
beamlaknetu sayferdbachew /2/
endih sil tseleye abat hoy marachew/2/

VERSE 3
bereqiq ሥlxanu hulun yefexere (2)
besewoch tegerfo mote teqebere/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yegietayien-arqan-enie-alaym-alech', 'የጌታዬን አርቃን እኔ አላይም አለች', 'የጌታዬን አርቃን እኔ አላይም አለች', 'yegietayien arqan enie alaym alech', 'Ethiopian Orthodox Tewahedo Mezmur - የጌታዬን አርቃን እኔ አላይም አለች', 'የሰማይ ከዋክብት የአምላክን ሞት አይተው
ወየው/2/ አሉ ከመሬት ተደፍተው
በይበልጥ ጨረቃ እርር ክስል አለች
ይህንን ስትሰማ መልኳን አጠቆረች', 'yesemay kewakbt yeamlakn mot aytew
weyew/2/ alu kemeriet tedeftew
beybelx cereqa err ksl alech
yhnn stsema melkuan axeqorech', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mote-lna-sleenie-mnm-saynorbh-xfat', 'ሞተፃልና ስለእኔ ምንም ሳይኖርብህ ጥፋት', 'ሞተፃልና ስለእኔ ምንም ሳይኖርብህ ጥፋት', 'moteፃlna sleenie mnm saynorbh xfat', 'Ethiopian Orthodox Tewahedo Mezmur - ሞተፃልና ስለእኔ ምንም ሳይኖርብህ ጥፋት', 'ተከሰህ ተወቅሰህ በሏጴላጦስ ፊት
ኢየሱስ አማለከ ምሕረት ስብሐት ለከክከ/2/
የአንተ መንገላታት ሁልጊዜ ያሳዝነኛል ሲወራ
በመስቀል ላይ ሆነህ ያየኸው መከራ

VERSE 1
ኢየሱስ የህይወት እጀራ ስብሐት ለከ.2/
ከልዑል ቦታ ዝቅ ብለህ ፈጣሪ ፍጡራን አምላክ
በሰው ፊት ተዋርደህ ስለሰው የሞትክ
በመስቀል ላይ ተጠማሁ እያልክ ስብሐት ለከ/2

VERSE 2
መሐሪ ንታ ሆይ አሁንም እንደ ቸርነትህ ብዛት
የአኛን በደል ሁሉ ሳትመለከት
አድነን ከዳግመኛ ሞት ስብሐት ሰከ/2/
419. ዘጠኝ ሠዓት ሲሆን

VERSE 3
ዘጠኝ ሰዓት ሲሆን አባት ሆይ
በመስቀል ሆነህ ›› ››
ድምፅህን በማሰማት ›› ››
ነፍስህን ሠጥተህ ›› ››

VERSE 4
ክዋክብት ከሰማይ በሙሉ አረገፉ
ጨረቀና ፀሐይ ደም አጎረፉ
ብርሃናት ጨለሙ ከሠው ተለያዩ
ሥጋ በመስቀል ላይ ተጋልጦ ስላዩ

VERSE 5
ጌታችን ክርስቶስ በመስቀል ላይ ሳለ
አሰምቶ ጮኸ ተጠማው እያለ
ማርና ወተትን ለሚመግበው
ሀሞት አመጡለት ይቅመሰው ብለው

VERSE 6
አካሉ ሲውጋ ውኃ ደም ፈሰሰ
በምድር ተረጭቶ ዓለምን ቀደሰ
የአስራኤል ሴቶች ዋይ ዋይ ሲሉልህ
ለእነርሱ አሰብክ እንጂ ለአንተስ አላሰብክ

VERSE 7
አናቱ ስታለቅስ በመስቀል ስር ሆና
ዮሐንስን ሰጠ ጠብቆ እንዲያጽናና
መላአክትም ታዩ አጋንንትም ሸሹ
የአይሁድ ሠራዊት ፈርተው ተረበሹ', 'tekeseh teweqseh beluaphielaxos fit
iyesus amaleke mሕret sbሐt lekekke/2/
yeante mengelatat hulgizie yasaznegnal siwera
bemesqel lay honeh yayeኸw mekera

VERSE 1
iyesus yehywet ejera sbሐt leke.2/
kelዑl bota zq bleh fexari fxuran amlak
besew fit tewardeh slesew yemotk
bemesqel lay texemahu eyalk sbሐt leke/2

VERSE 2
meሐri nta hoy ahunm ende cherneth bzat
yeagnan bedel hulu satmeleket
adnen kedagmegna mot sbሐt seke/2/
419. zexegn ሠዓt sihon

VERSE 3
zexegn seዓt sihon abat hoy
bemesqel honeh ›› ››
dmፅhn bemasemat ›› ››
nefshn ሠxteh ›› ››

VERSE 4
kwakbt kesemay bemulu aregefu
cereqena ፀሐy dem agorefu
brሃnat celemu keሠw teleyayu
ሥga bemesqel lay tegalxo slayu

VERSE 5
gietachn krstos bemesqel lay sale
asemto coኸ texemaw eyale
marna wetetn lemimegbew
hamot amexulet yqmesew blew

VERSE 6
akalu siwga wኃ dem fesese
bemdr terecto ዓlemn qedese
yeasraiel sietoch way way silulh
leenersu asebk enji leantes alasebk

VERSE 7
anatu staleqs bemesqel sr hona
yoሐnsn sexe xebqo endiyatsnana
melaaktm tayu aganntm sheshu
yeayhud ሠrawit fertew terebeshu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kiryalayson', 'ኪርያላይሶን', 'ኪርያላይሶን', 'kiryalayson', 'Ethiopian Orthodox Tewahedo Mezmur - ኪርያላይሶን', 'ኪራያላይሶን (3)
በሰማይ በምድር ሥልጣኑ ያለህ ኪያላይሶን
በፍርድ አደባባይ አንተን አቆሙህ
አኛን አድን ብለህ መራቅ ተፋብህ

VERSE 1
በአክሊል አሾህ ላይ በመቃ መቱህ
የተንኮልን ነገር አንዳች ቢያጡብህ
ይህስ ይሳደባል ብለው ከሰሱህ
አሳተ መለኮት ዓለምን የፈጠርክ

VERSE 2
ሥጋ በመልበስህ በሰይፍ ተመታህ
በአኛ አመጽ ግርፋት የተገረፍክል ኪርያላይሶን
በሸንጎ አእንዳንቀርብ የተሰቀልክልን
ኤሎፄ (2) የሲቃ ድምጽ

VERSE 3
ዛሬም ይሰማናል ይህ ጥሪ ቃልህ
ስቃይህን አስታውስን እናነባለን ኪያላይሶን
የምሕረት እጆችህ እንዲዳብሱን
ስለአኛ መከራ ስለተቀበልህ

VERSE 4
አሁንም ደግፈን እንዳንጠፋብህ
በአጆችህ ቀድሰህ አንዳልሰጠሃፃቸው
አስቲ በአሳት አጅህ ተከላከላቸው
አንተ በባሕርይህ ሁሉን ቻይ ሆነህ

VERSE 5
በመስቀል ቸንክረው ቀራንዮ አዋሉህ
421. ጌታ ሆይ
ጌታ ሆይ አይሁድ አማጽያን ሰቀሉህ ወይ
የዓለም መድኃኒት የዓለም ሲሳይ ሰቀሉህ ወይ /2/

VERSE 6
የአዳም በደል አደረሰህ አንተን ለመሰቀል
የሔዋን ስህተት አበቃህ ለሞት ቸሩ
አባት/2/
ንጹሕ ክርስቶስ ሆነ ወንጀለኛ ብለህኛ ስለእኛ

VERSE 7
መሰቀል አሸክመው አስረው ገፈፉህ እያዳፉህ/2/
አጅና አግርህን በብረት ተመታ የዓለም ጌታ
የሾህ አክሊል ደፍተህ ጎንህን ተወጋህ አልፋ
ኦሜጋ/2/', 'kirayalayson (3)
besemay bemdr ሥlxanu yaleh kiyalayson
befrd adebabay anten aqomuh
agnan adn bleh meraq tefabh

VERSE 1
beaklil ashoh lay bemeqa metuh
yetenkoln neger andach biyaxubh
yhs ysadebal blew kesesuh
asate melekot ዓlemn yefexerk

VERSE 2
ሥga bemelbesh beseyf temetah
beagna amets grfat yetegerefkl kiryalayson
beshengo aendanqerb yeteseqelkln
ieloፄ (2) yesiqa dmts

VERSE 3
zariem ysemanal yh xri qalh
sqayhn astawsn enanebalen kiyalayson
yemሕret ejochh endidabsun
sleagna mekera sleteqebelh

VERSE 4
ahunm degfen endanxefabh
beajochh qedseh andalsexeሃፃchew
asti beasat ajh tekelakelachew
ante bebaሕryh hulun chay honeh

VERSE 5
bemesqel chenkrew qeranyo awaluh
421. gieta hoy
gieta hoy ayhud amatsyan seqeluh wey
yeዓlem medኃnit yeዓlem sisay seqeluh wey /2/

VERSE 6
yeadam bedel adereseh anten lemeseqel
yeሔwan shtet abeqah lemot cheru
abat/2/
ntsuሕ krstos hone wenjelegna blehgna sleegna

VERSE 7
meseqel ashekmew asrew gefefuh eyadafuh/2/
ajna agrhn bebret temeta yeዓlem gieta
yeshoh aklil defteh gonhn tewegah alfa
omiega/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('fdan-teqebele-lesew-ljoch-d-net-2', 'ፍዳን ተቀበለ ለሰው ልጆች ድኅነት/2/', 'ፍዳን ተቀበለ ለሰው ልጆች ድኅነት/2/', 'fdan teqebele lesew ljoch dኅnet/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ፍዳን ተቀበለ ለሰው ልጆች ድኅነት/2/', 'በመሬት ላይ ተንገላታ ሩኅሩኅ ጌታ
አዳም ቅጠል በልቶ ባመጣው በሽታ/2/
424. ኦ የማይሞተው ሞተ
ኦ የሞይሞተው ሞተ/2/

VERSE 1
ፄደ ቀራንዮ እየተጎተተ
ወድቆ እየተነሣ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞት ሞተ/2/
አጅና እግሩን ታስሮ ሄደ አደባባይ

VERSE 2
እየተገረፈ ታግሶ ስቃይ
አለቀሰች ቆማ ድንግል ማርያም
አለቀሰች ቆማ ድንግል ማርያም
ተሰቅሎባት ልጂ መድኃኔዓለም

VERSE 3
በአሁይድ አደባባይ ፍርድ ተንጋደደ
ወንበዴ ተለቆ ንጹሕ ሰው ታረደ
የማይሞተው ሞተ ለሰው ፍቅር ብሎ
ዋለ ቀራንዮ በአረንጨት ላይ ተሰቅሎ

VERSE 4
ዮሴፍ ኒቆዲሞስ ሥጋውን ለመኑ
እንዲፈቅዱላቸው ፄደው መቃብር
ገንዘው ቀበሩት በአዲስ መቃብር
ቅዱስ ቅዱስ ኃያል በክብር

VERSE 5
425. በትዕግሥቱ ብዛት
በትዕግሥቱ ብዛት ባይገለጥ ኃይሉ
ስቀለው ስቀለው አይሁድ ተባባሉ/2/
የኃያላን አምላክ አልፋና ኦሜጋ

VERSE 6
አንድኛ ታመመ በለበሰው ሥጋ
ኅብስት አበርክቶ የሚመግብ ጌታ
ታሰሮ ተገረፈ እንደክፉ ሽፍታ
አጅና እሮቹ ታሰረው ብታይ

VERSE 7
ድንግል አለቀሰች አለች ዋይ ዋይ
የሚንቀጠቀጡለት መላዕእክት በፈቱ
እንደምን በችንካር ተወጋ ደረቱ
ፍዳን ተቀበለ ለሰው ልጆች ድኅነት/2/

VERSE 8
በመሬት ላይ ተንገላታ እሩህሩሁ ንታ /2/', 'bemeriet lay tengelata ruኅruኅ gieta
adam qxel belto bamexaw beshta/2/
424. o yemaymotew mote
o yemoymotew mote/2/

VERSE 1
ፄde qeranyo eyetegotete
wedqo eyeteneሣ endiya eyeqatete
motn yshrew zend yemaymot mote/2/
ajna egrun tasro hede adebabay

VERSE 2
eyetegerefe tagso sqay
aleqesech qoma dngl maryam
aleqesech qoma dngl maryam
teseqlobat lji medኃnieዓlem

VERSE 3
beahuyd adebabay frd tengadede
wenbedie teleqo ntsuሕ sew tarede
yemaymotew mote lesew fqr blo
wale qeranyo bearencet lay teseqlo

VERSE 4
yosief niqodimos ሥgawn lemenu
endifeqdulachew ፄdew meqabr
genzew qeberut beadis meqabr
qdus qdus ኃyal bekbr

VERSE 5
425. betዕgሥtu bzat
betዕgሥtu bzat baygelex ኃylu
sqelew sqelew ayhud tebabalu/2/
yeኃyalan amlak alfana omiega

VERSE 6
andgna tameme belebesew ሥga
ኅbst aberkto yemimegb gieta
tasero tegerefe endekfu shfta
ajna erochu taserew btay

VERSE 7
dngl aleqesech alech way way
yeminqexeqexulet melaዕekt befetu
endemn bechnkar tewega deretu
fdan teqebele lesew ljoch dኅnet/2/

VERSE 8
bemeriet lay tengelata eruhruhu nta /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yentsu-n-amlak-wenjelegna-teblo', 'የንጹሐን አምላክ ወንጀለኛ ተብሎ', 'የንጹሐን አምላክ ወንጀለኛ ተብሎ', 'yentsuሐn amlak wenjelegna teblo', 'Ethiopian Orthodox Tewahedo Mezmur - የንጹሐን አምላክ ወንጀለኛ ተብሎ', 'ዋለ ቀረንዮ እርቃኑን ተሰቅሎ
በደል ሳይኖርበት ተሰቀለልን
ሞታችንን ሞቶ ሕይወትን ሰጠን
426. በእለተ አርብ

VERSE 1
በአለተ ዓርብ ሥላሴ ሰውን ፈጠሩ ልክብራቸው
የተፈጠሩትም አዳም ሔዋን ናቸው
ለጠቅላላው ዓለም ኃይል እንዲሰጣቸው
አፍርሰው ወደቁ በሰይጣን ተሳስተው

VERSE 2
ወይ በደል ወይ ጉዳት
የሁላችን አባት አዳም ያን ግዜ
ጀመረ ልቅሶውን
ተሳስተቶ በመብለት እአእጸ-በለስን

VERSE 3
ሊወርስ ፈልጎ አምላክነትን
ባልሆነ መካሪ በክፉ ሰይጣን
ወይ በደል ወይ ጉዳት
ይህችን እፀ በለስ ባትቆርጫት

VERSE 4
ከሰይጣን ጋር ተማክረሽ
የምድሩ ሳይበቃሽ የሰማይ ሽተሸ
አኔን አዋረድሽኝ አንቺም ተዋረድሽ
ከእንግዲህ ይጥቀምሽ ከንቱ ምኞትሽ

VERSE 5
ወይ በደል ወይ ጉዳት
አትውቀሰኝ እንጂ አዳም
ምን ላድርግ ብለህ ነው ጌታዬ
ሰይጣን አስቶኝ ነው አዬ መከራዬ

VERSE 6
ከእንግዲህ ወዲህ አሳት ነው ኑሮዬ
ስለተጣላሁኝ ከቸር ፈጣሪዬ
ወይ በደል ወይ ጉዳት
ከጎኔ ተፈጥረሽ ሔዋን

VERSE 7
አንኳን ልትረጂኝ ጎዳሽኝ
አንቺን ሳስተሸ እኔን አሳትሸኝ
በማስመሰል ነገርሽ ስላበላሸበኝ
አስከመቼ ድርስ ሞቼ ቀረሁኝ', 'wale qerenyo erqanun teseqlo
bedel saynorbet teseqeleln
motachnn moto ሕywetn sexen
426. beelete arb

VERSE 1
bealete ዓrb ሥlasie sewn fexeru lkbrachew
yetefexerutm adam ሔwan nachew
lexeqlalaw ዓlem ኃyl endisexachew
afrsew wedequ beseyxan tesastew

VERSE 2
wey bedel wey gudat
yehulachn abat adam yan gzie
jemere lqsown
tesasteto bemeblet eaetse-belesn

VERSE 3
liwers felgo amlaknetn
balhone mekari bekfu seyxan
wey bedel wey gudat
yhchn eፀ beles batqorcat

VERSE 4
keseyxan gar temakresh
yemdru saybeqash yesemay shteshe
anien awaredshgn anchim tewaredsh
keengdih yxqemsh kentu mgnotsh

VERSE 5
wey bedel wey gudat
atwqesegn enji adam
mn ladrg bleh new gietayie
seyxan astogn new ayie mekerayie

VERSE 6
keengdih wedih asat new nuroyie
sletexalahugn kecher fexariyie
wey bedel wey gudat
kegonie tefexresh ሔwan

VERSE 7
ankuan ltrejign godashgn
anchin sasteshe enien asatshegn
bemasmesel negersh slabelashebegn
askemechie drs mochie qerehugn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('iyesus-krstos-egziab-r-new', 'ኢየሱስ ክርስቶስ እግዚአብሔር ነው', 'ኢየሱስ ክርስቶስ እግዚአብሔር ነው', 'iyesus krstos egziabሔr new', 'Ethiopian Orthodox Tewahedo Mezmur - ኢየሱስ ክርስቶስ እግዚአብሔር ነው', 'ጌታችን ተሰቅሎ ቢያዩት መላእክት
በዝማሬ ፋንታ አለቀሱለት
ኢየሱስ ክርስቶስ እግዚአብሔር ነው /2/
ጌታችን ተሰቅሎ ቢያዩት መላእክት

VERSE 1
በዝማሬ ፈንታ አለቀሱለት
ሚካኤል ዝም አለ ገብርኤል ገረመው
አምላኩ አርቃኑን ተሰቅሎ ስላየው /2/', 'gietachn teseqlo biyayut melaekt
bezmarie fanta aleqesulet
iyesus krstos egziabሔr new /2/
gietachn teseqlo biyayut melaekt

VERSE 1
bezmarie fenta aleqesulet
mikaiel zm ale gebriel geremew
amlaku arqanun teseqlo slayew /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('krstos-lyo-new-wederm-yelew-2', 'ክርስቶስ ልዮ ነው ወደርም የለው/2/', 'ክርስቶስ ልዮ ነው ወደርም የለው/2/', 'krstos lyo new wederm yelew/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ክርስቶስ ልዮ ነው ወደርም የለው/2/', 'ውራን ቢያበራ የሞተን ቢያስነሣ
በመመስገን ፈንገታ ሆነበት አበሳ
ሰማያዊው ዳኛ ሊፈረድበት
ተኮስ ቀረበ በሏላጦስ ፊት /2/', 'wran biyabera yemoten biyasneሣ
bememesgen fengeta honebet abesa
semayawiw dagna liferedbet
tekos qerebe belualaxos fit /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('y-kelekelech-demaq-br-zanuan', 'ፀሐይ ከለከለች ደማቅ ብርፃዛኗን', 'ፀሐይ ከለከለች ደማቅ ብርፃዛኗን', 'ፀሐy kelekelech demaq brፃzanuan', 'Ethiopian Orthodox Tewahedo Mezmur - ፀሐይ ከለከለች ደማቅ ብርፃዛኗን', 'በመስቀል ላይ ዋለ በኢየሩሳሌም
አዩት ተመልከቱት መስቀሉ ማማሩ
ለተመራመረው ብዙ ነው ምሥጢሩ
ቢገርፋት ቢሰቅሉት በያላግጡበት

VERSE 1
ምንም አላገኙም በእርሱ ላይ ስህተት
ፈጣሪ መኖኑ ምሥጥሩ ገብቷት
ጌታን አልይዝ አለች ግዑዚ መሬት
ይህ ታላቅ ንጉሥ ሲገለጥ በሰማይ

VERSE 2
የናቁት ሁሉ ይሉለታል ዋይ ዋይ
ምድርና ሰማይ ከፊቱ ሲሸሹ የት ልግባ ይላል', 'bemesqel lay wale beiyerusaliem
ayut temelketut mesqelu mamaru
letemeramerew bzu new mሥxiru
bigerfat biseqlut beyalagxubet

VERSE 1
mnm alagegnum beersu lay shtet
fexari menonu mሥxru gebtuat
gietan alyz alech gዑzi meriet
yh talaq nguሥ sigelex besemay

VERSE 2
yenaqut hulu yluletal way way
mdrna semay kefitu sisheshu yet lgba ylal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bekehadiwoch-ej-teyzeh-qerebk-2', 'በከሀዲዎች እጅ ተይዘህ ቀረብክ/2/', 'በከሀዲዎች እጅ ተይዘህ ቀረብክ/2/', 'bekehadiwoch ej teyzeh qerebk/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በከሀዲዎች እጅ ተይዘህ ቀረብክ/2/', 'ተገፋህ ተደፋህ በጥፊ ተመታህ
አየደበደቡ ክርስቶስ ሆይ አሉህ
ጽድቅን ስለሠራህ በወንጀል ከሰሱህ
ለአደም ቤዛ ልትሆን ብዙ ተንገላታህ', 'tegefah tedefah bexfi temetah
ayedebedebu krstos hoy aluh
tsdqn sleሠrah bewenjel kesesuh
leadem bieza lthon bzu tengelatah', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beziya-adebabay-belualaxos-zend', 'በዚያ አደባባይ በሏላጦስ ዘንድ', 'በዚያ አደባባይ በሏላጦስ ዘንድ', 'beziya adebabay belualaxos zend', 'Ethiopian Orthodox Tewahedo Mezmur - በዚያ አደባባይ በሏላጦስ ዘንድ', 'አሳልፈው ሰጡህ አጋልጠው ለፍርድ
ከሐና ቀያፋ ከካህናቱ ደጅ
ከእነፄሮድስ ዘንድ አቀረቡህ በአወጅ
ግርፋት ሕማሙ አልበቃ ብሉህ

VERSE 1
በመስቀል ላይ ልትውል ተፈረደብህ', 'asalfew sexuh agalxew lefrd
keሐna qeyafa kekahnatu dej
keeneፄrods zend aqerebuh beawej
grfat ሕmamu albeqa bluh

VERSE 1
bemesqel lay ltwl teferedebh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tefelgew-mexu-lechnkar-mekera', 'ተፈልገው መጡ ለችንካር መከራ', 'ተፈልገው መጡ ለችንካር መከራ', 'tefelgew mexu lechnkar mekera', 'Ethiopian Orthodox Tewahedo Mezmur - ተፈልገው መጡ ለችንካር መከራ', 'አምስቱ ችክካሮች ቅንዋት መስቀል
አይሁዶች አመጡ ገላህን ለማቁሰል
ሊየያዝ በችንካር እጅህ ተዘረጋ
የሰላም ባለቤት ደረትህ ተወጋ', 'amstu chkkaroch qnwat mesqel
ayhudoch amexu gelahn lemaqusel
liyeyaz bechnkar ejh tezerega
yeselam balebiet dereth tewega', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeasraiel-amlak-qdus', 'የአስራኤል አምላክ ቅዱስ', 'የአስራኤል አምላክ ቅዱስ', 'yeasraiel amlak qdus', 'Ethiopian Orthodox Tewahedo Mezmur - የአስራኤል አምላክ ቅዱስ', 'የአስራኤል አምላክ ቅዱስ
የአስራኤል አምላክ ቅዱስ
የአስራኤል አምላክ ቅዱስ
የአስራኤል አምላክ ቅዱስ /3/

VERSE 1
በጠራንህ ጊዜ ፈጥነህ ድረስ /3/
ተገዙ ለአግዚአብሔር ስሙንም ጥሩ', 'yeasraiel amlak qdus
yeasraiel amlak qdus
yeasraiel amlak qdus
yeasraiel amlak qdus /3/

VERSE 1
bexeranh gizie fexneh dres /3/
tegezu leagziabሔr smunm xru', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abatachn-hoy-yehulachn-gieta-2', 'አባታችን ሆይ የሁላችን ጌታ /2/', 'አባታችን ሆይ የሁላችን ጌታ /2/', 'abatachn hoy yehulachn gieta /2/', 'Ethiopian Orthodox Tewahedo Mezmur - አባታችን ሆይ የሁላችን ጌታ /2/', 'አባታችን ሆይ የሁላችን ጌታ /2/
ቅዱስ መንፈስህን ስጠን በተርታ/2/
ወደአንተ መልሰው የሰውን ልቦና /2/
ባላወቀው መንገድ እርሱ ሄዲልና

VERSE 1
እዝነ ምሕረትህን ወደኛ አዘንብል /2/
ይቅርታን ልንጠይቅ ከፊትህ ቆመናል
ይቅርታን ልንጠይቅ ከፊትህ የቆምነው /2/
ምሐሪ መሆንክን ስለምናውቅ ነው', 'abatachn hoy yehulachn gieta /2/
qdus menfeshn sxen beterta/2/
wedeante melsew yesewn lbona /2/
balaweqew menged ersu hedilna

VERSE 1
ezne mሕrethn wedegna azenbl /2/
yqrtan lnxeyq kefith qomenal
yqrtan lnxeyq kefith yeqomnew /2/
mሐri mehonkn slemnawq new', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdus-menfesn-sxen-beterta-2', 'ቅዱስ መንፈስን ስጠን በተርታ /2/', 'ቅዱስ መንፈስን ስጠን በተርታ /2/', 'qdus menfesn sxen beterta /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ቅዱስ መንፈስን ስጠን በተርታ /2/', 'ወደአንተ መልስ የሰውን ልቡና''/2/
ባላወቀው መንገድ አርሱ ሄዷጻልና''2/
አዝነ ልቡናችንን ወደአንተ አዘንብለን/ቋ2/
ይቅርታን ልንጠይቅ ከፊትህ የቆምነው/2/

VERSE 1
መሐሪ መሆንህን ስለምናውቅ ነው /2/
አይተህ አንዳላየ ታልፈዋለህ ሁሉንም//ሪ2/
መዓቱም ምሕረቱም ሁሉም የአንተ ሲሆን
ሥልጣንህ ረቂቅ ነው አይመረመርም//2/

VERSE 2
ዘመንና ወራት ሊሺሩት አይችሉም/2/
የፍቅር ባለቤት ቸሩ አምላካችን /2/
አድሜ ለንስሓ ስጠን ለሁላችን/ቋ2/
አንማልድዛለን በልቅሶ በሐዘን/2/

VERSE 3
የይቀርታ ብዛት ከእኛ ጋር እንዲሆን''/2/
የሰማይ መላዕከት የምድር ሰራዊት /2
ያመሰግኑሃል በቀንና ሌሊት /2/', 'wedeante mels yesewn lbuna''/2/
balaweqew menged arsu heduatsalna''2/
azne lbunachnn wedeante azenblen/qua2/
yqrtan lnxeyq kefith yeqomnew/2/

VERSE 1
meሐri mehonhn slemnawq new /2/
ayteh andalaye talfewaleh hulunm//ri2/
meዓtum mሕretum hulum yeante sihon
/2/

VERSE 2
/2/
ሥlxanh reqiq new aymeremerm//2/
zemenna werat lishirut aychlum/2/
yefqr balebiet cheru amlakachn /2/

VERSE 3
admie lensሓ sxen lehulachn/qua2/
anmaldzalen belqso beሐzen/2/
yeyqerta bzat keegna gar endihon''/2/
yesemay melaዕket yemdr serawit /2

VERSE 4
yamesegnuሃl beqenna lielit /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('adam-g-afrso-bamexaw-beshta-2', 'አዳም ሕግ አፍርሶ ባመጣው በሽታ/2/', 'አዳም ሕግ አፍርሶ ባመጣው በሽታ/2/', 'adam ሕg afrso bamexaw beshta/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አዳም ሕግ አፍርሶ ባመጣው በሽታ/2/', 'አቤት ፍቅሩ የእግዚአሔር/2/
ግሩም ፍቅሩ ›› ››
ኃያል ፍቅሩ -››››
ግሩም ፍቅሩ  ››››

VERSE 1
አስበኝ ስላልኩት አሰበኝ ጌታዬ
ወንበዴ ነበርኩኝ ስርቆት ነው ሙያዬ
በመስቀል ላይ ሆኖ ሕዝቡን ያስብ ነበር
አኔስ አላየሁም /2/ እንዲህ ያለ ፍቅር

VERSE 2
አልታይም ብዬ ኃጢአትን ስሠራ
ተመለስ ይለኛል ስሜን አየጠራ
አንዳልሞትበት ነው በኃጢአት ታስሬ
ፍቀሩን አልዘልቀውም/2/ እንደዚህ ዘርዝሬ

VERSE 3
መከራ ሲከበኝ መጥቶ ያጽናናኛል
በሐዘኔ ጊዜ እግዚአብሔርም ያዝናል
ዓይኑ ከእኔ አይርቅም ጥበቃው አይጠፋም
ስሙን እጠራለሁ/2/ በጌታዬ አላፍርም

VERSE 4
456. በኢየሩሳሌም
በኢየሩሳሌም በበጎች በር በቤተ ሳይዳ እኖር ነበር
ማን ያድነኛል እያልኩኝ አልጋህን ይዘህ ሂድ አለኝ
‹‹ ‹‹ አምነትህ አዳንህ አለኝ

VERSE 5
‹‹ ‹‹ አምላኬ መጥቶ ፈወሰኝ
በአልጋ ላይ ከዋልኩ ስንብቻለሁ
ሰውነቴ አልቆ መንምኛለሁ
ውኃውን ሳያማታ ቅዳሜ

VERSE 6
ቀደመው የዳኑ አኔ ቆሜ
አይዞህ የሚለኝ የሚያጽናናበኝ
ደገፊም የለኝ ብቸኛ ነኝ
ሠላሳ ስምንት ዓመት እያሉ

VERSE 7
ተሳለቁብኝ መፃጉዕ እያሉ
አዘንልኝና አድነኝ
ሙሉ ጤነኛ አድርገኝ
ልትድን ትወዳለህ ሲለኝ

VERSE 8
አዳም ሕግ አፍርሶ ባመጣው በሽታ/2/
›› ›› ›› በጎተተው እዳ
464. ነነዌን ሊያቃጥል
ነነዌን ሊያቃጥል የወረደው እሳት/2/

VERSE 9
ተመልሶ አረገ/2/ በጾምና ጸሎት/2/
ስለሆነ ከልብ የሐዘናቸው ምንጩ
ነበር አንደ ራሄል/2/ ዕንባ እየረጩ
ለነነዌ ሰዎች ደስታን ያበሰረ

VERSE 10
ጋሻና ጦራቸው/ሪ2/ ጾም ፀሎት ነበረ
አንኳን የሰው ልጆች አንስሳት ሳይቀሩ
በዮናስ ስብከት/2/ ጾም ፀሎት ተማሩ
465. አስራኤል ሠለቸው

VERSE 11
አስራኤል ሰለቸው የሰማዩ መና''/2/', 'abiet fqru yeegziaሔr/2/
grum fqru ›› ››
ኃyal fqru -››››
grum fqru  ››››

VERSE 1
asbegn slalkut asebegn gietayie
wenbedie neberkugn srqot new muyayie
bemesqel lay hono ሕzbun yasb neber
anies alayehum /2/ endih yale fqr

VERSE 2
altaym byie ኃxiatn sሠra
temeles ylegnal smien ayexera
andalmotbet new beኃxiat tasrie
fqerun alzelqewm/2/ endezih zerzrie

VERSE 3
mekera sikebegn mexto yatsnanagnal
beሐzenie gizie egziabሔrm yaznal
ዓynu keenie ayrqm xbeqaw ayxefam
smun exeralehu/2/ begietayie alafrm

VERSE 4
456. beiyerusaliem
beiyerusaliem bebegoch ber bebiete sayda enor neber
man yadnegnal eyalkugn algahn yzeh hid alegn
‹‹ ‹‹ amneth adanh alegn

VERSE 5
‹‹ ‹‹ amlakie mexto fewesegn
bealga lay kewalku snbchalehu
sewnetie alqo menmgnalehu
wኃwn sayamata qdamie

VERSE 6
qedemew yedanu anie qomie
ayzoh yemilegn yemiyatsnanabegn
degefim yelegn bchegna negn
ሠlasa smnt ዓmet eyalu

VERSE 7
tesalequbgn meፃguዕ eyalu
azenlgnna adnegn
mulu xienegna adrgegn
ltdn twedaleh silegn

VERSE 8
adam ሕg afrso bamexaw beshta/2/
›› ›› ›› begotetew eda
464. nenewien liyaqaxl
nenewien liyaqaxl yeweredew esat/2/

VERSE 9
temelso arege/2/ betsomna tselot/2/
slehone kelb yeሐzenachew mncu
neber ande rahel/2/ ዕnba eyerecu
lenenewie sewoch destan yabesere

VERSE 10
gashana xorachew/ri2/ tsom ፀlot nebere
ankuan yesew ljoch anssat sayqeru
beyonas sbket/2/ tsom ፀlot temaru
465. asraiel ሠlechew

VERSE 11
asraiel selechew yesemayu mena''/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('awnetm-awnet-almeselelegn', 'አውነትም አውነት አልመሰለለኝ', 'አውነትም አውነት አልመሰለለኝ', 'awnetm awnet almeselelegn', 'Ethiopian Orthodox Tewahedo Mezmur - አውነትም አውነት አልመሰለለኝ', 'አም አወዳለሁ ስለው ጌታ
ፈወሰኝ አምላክ የአኔ አለኝታ
ስማኝ አምላኬ አጮሃለሁ
ኃጢአቱ በዝቶ አለቅሳለሁ

VERSE 1
በመብል ጠፍቶ ልጅነቱ
ባሪያህ አድረገኝ ውድ አባቴ
አንደእኔ ታማሚ የሆናችሁ
አምናችሁ ጌታ ያድናችሁ

VERSE 2
አነደአኔ ድውይ የሆናችሁ
የጌታ እናት ታመልዳችሁ
457. የዳዊት ሀዘኑ
የዳዊት ሐዘኑ የጴጥሮስ ንስሓ/2/

VERSE 3
አኛን ያነጻናል እንደ ንጹሕ ውኃ/2/
ይቅር ባይ ነህና የሰውን በደል
የአኔን አበሳዬን አሁን ይቅር በል
የዳዊት ሐዘን የጴጥሮስ ለቅሶ''/2/

VERSE 4
የተቀበለ አምላክ ተበድሎ ክሶ
የዛሬም ይቅር በል የሕዝቡን አበሳ/2/
አንተ የከፈልክልን የእኛ ሁሉ አበሳ
በደለኛው እኔ የአንተን ሕግ ጥሼ /2/

VERSE 5
ንጹሀ ስጋዬን በጭቃ ለውሼ /
በንስሓ ውፃ አጥቤና ስድሼ/ሪ2/
አሁን ይቅር በለኝ መጣሁ ተመልሼ', 'am awedalehu slew gieta
fewesegn amlak yeanie alegnta
smagn amlakie acoሃlehu
ኃxiatu bezto aleqsalehu

VERSE 1
bemebl xefto ljnetu
bariyah adregegn wd abatie
andeenie tamami yehonachhu
amnachhu gieta yadnachhu

VERSE 2
anedeanie dwy yehonachhu
yegieta enat tameldachhu
457. yedawit hazenu
yedawit ሐzenu yephiexros nsሓ/2/

VERSE 3
agnan yanetsanal ende ntsuሕ wኃ/2/
yqr bay nehna yesewn bedel
yeanien abesayien ahun yqr bel
yedawit ሐzen yephiexros leqso''/2/

VERSE 4
yeteqebele amlak tebedlo kso
yezariem yqr bel yeሕzbun abesa/2/
ante yekefelkln yeegna hulu abesa
bedelegnaw enie yeanten ሕg xshie /2/

VERSE 5
ntsuha sgayien becqa lewshie /
bensሓ wፃ axbiena sdshie/ri2/
ahun yqr belegn mexahu temelshie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('hun-chay-nehna-fxrethn-yematnq', 'ሁን ቻይ ነህና ፍጥረትህን የማትንቅ', 'ሁን ቻይ ነህና ፍጥረትህን የማትንቅ', 'hun chay nehna fxrethn yematnq', 'Ethiopian Orthodox Tewahedo Mezmur - ሁን ቻይ ነህና ፍጥረትህን የማትንቅ', 'አለቅሳለሁ ዘወትር አነባለሁ
አውቃለሁ አምላኬን ብዙ በድለሁ
ልቅሶና ጩኸቴን ተቀበለኝ', 'aleqsalehu zewetr anebalehu
awqalehu amlakien bzu bedlehu
lqsona cuኸtien teqebelegn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('menged-telalfie-fexari-asqeyemkuh', 'መንገድ ተላልፌ ፈጣሪ አስቀየምኩህ', 'መንገድ ተላልፌ ፈጣሪ አስቀየምኩህ', 'menged telalfie fexari asqeyemkuh', 'Ethiopian Orthodox Tewahedo Mezmur - መንገድ ተላልፌ ፈጣሪ አስቀየምኩህ', 'በሚጠፋ ንብረት አምላኬን ለወጥኩህ
አሁን ግን አምጌ ብዙ እንደበደልኩህ
በረከሰ አንደበት ይቅርታን ለመንኩህ
የኃጢአት ጉዞ እኔን ሰልችቶኛል

VERSE 1
ኃጢአቴ በዝቶብኝ መቆም ተስኖኛል
ነሽና በፊቱ ክብር ሞገስ ያለሽ
ድንግል ልመናዬን አድርሺ ከልጅሽ
459. አቤቱ አቤት ኃጢአቴ

VERSE 2
አቤቱ አቤት ኃጢአቴ ብዛቱ/2/
መስፊሪያም የለውም እርስ ካልተወኝ በቸርነቱ
ከእኔ ኃጢአት ይልቅ ይበዛል ምሕረትህ
አደራ እንድትምረኝ ጌታ በቸርነትህ/2/

VERSE 3
አስከ አንገቴ ደርሶ የኃጢአቴ ብዛት
ሊውጠኝ ነውና አውጣኝ የአኔ አባት/2/
ለአግሬ መቆሚያ ከሌለው ባሕር
ድረስልኝ ጌታዬ ወድቄ አእንዳልቀር/2/

VERSE 4
ወደአንተ ስጣራ በጩኸት ደክሜ
ተስፋ ሊያስቆርጠኝ የኃጢአት ሸክሜ/2/
ወደ ኃላ ልቤ እንዳይመልስኝ
መልካም አረኛዬ አንተ ጠብቀኝ/2/

VERSE 5
የሠራሁት ሁሉ ከአንተ አይሰወርም
ይቅር ትለኛለህ አልጠራጠርም/2/
መመለሴን አንጂ መሞቴን አትወድም
በዚህ አጽናናለሁ ከፍቅርህ አልርቅም/2/

VERSE 6
አንተን ስበድልህ ይቅር እንዳልከኝ
የሚበድሉኝን ይቅር በልልኝ /2/
ይቅርታ ለማድረግ እኔን ቢከብደኝ
አንተ አይቸግርህም ይቅርታ ስጠኝ /2/

VERSE 7
460.አደባባይ ቆሜ
አደባበይ ቀሜ ስምህን ከመሰበክ
መጀመሪያ ልቤ ከፊትህ ይንበርከክ
ከአገልግሎት በፊት አንተን ልወቅህ', 'bemixefa nbret amlakien lewexkuh
ahun gn amgie bzu endebedelkuh
berekese andebet yqrtan lemenkuh
yeኃxiat guzo enien selchtognal

VERSE 1
ኃxiatie beztobgn meqom tesnognal
neshna befitu kbr moges yalesh
dngl lmenayien adrshi keljsh
459. abietu abiet ኃxiatie

VERSE 2
abietu abiet ኃxiatie bzatu/2/
mesfiriyam yelewm ers kaltewegn bechernetu
keenie ኃxiat ylq ybezal mሕreth
adera endtmregn gieta becherneth/2/

VERSE 3
aske angetie derso yeኃxiatie bzat
liwxegn newna awxagn yeanie abat/2/
leagrie meqomiya kelielew baሕr
dreslgn gietayie wedqie aendalqer/2/

VERSE 4
wedeante sxara becuኸt dekmie
tesfa liyasqorxegn yeኃxiat shekmie/2/
wede ኃla lbie endaymelsgn
melkam aregnayie ante xebqegn/2/

VERSE 5
yeሠrahut hulu keante aysewerm
yqr tlegnaleh alxeraxerm/2/
memelesien anji memotien atwedm
bezih atsnanalehu kefqrh alrqm/2/

VERSE 6
anten sbedlh yqr endalkegn
yemibedlugnn yqr bellgn /2/
yqrta lemadreg enien bikebdegn
ante aychegrhm yqrta sxegn /2/

VERSE 7
460.adebabay qomie
adebabey qemie smhn kemesebek
mejemeriya lbie kefith ynberkek
keagelglot befit anten lweqh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('me-waet-kemaqreb-ltazezlh-2', 'መሥዋእት ከማቅረብ ልታዘዝልህ/2/', 'መሥዋእት ከማቅረብ ልታዘዝልህ/2/', 'meሥwaet kemaqreb ltazezlh/2/', 'Ethiopian Orthodox Tewahedo Mezmur - መሥዋእት ከማቅረብ ልታዘዝልህ/2/', 'አሐዱ አብ ብዬ ስምህን ብቀድስ
ለድሆች ብሰጥ ቤትህ ብገሰግስ
በመላአክት ልሳን ብዘምር በእልልታ
ምን አጠቅማፃለሁ ካልፈራሁ ጌታ/2/

VERSE 1
ተራራ እስካፈልስ እምነት ቢኖረኝ
ሥራ ከሌለበት ምንም አይጠቀመኝም
ልቤን ስትመረምር ከሆንኩኝ ቀላል
ክርስቲያን መባሉ ምን ይጠቅመኛ/2/

VERSE 2
ጨው አልጫ ቢሆን በምን ይጣፍጣል
ከውጭ ተጥሎ በእግር ይረጋገጣል
አንተን ለሚከተል እንዳልሆን እንቅፋት
አምልኮቴ ይሁን በፍቅር በፍርፃት/2/

VERSE 3
የአውቀት ሰው መሆን አይጠቅመኝ
አኔስ መስቀልህ ነው ፍቅርህ ያሸነፈኝ
ከእምነቴ የተነሳ መታዘዝ ይሁነኝ
ስምህን መፍራት ነው በእምነት የሚያኖረኝ/2/

VERSE 4
461. በከሃሊነቱ
በከሃሊነቱ በአምላክነቱ /2/
ይቅር ይለናል ይታደገናል/2/ በቸርነቱ
ምን ይከፈለዋል ምን ይሆን ዋጋው

VERSE 5
ለፈጠረን ጌታ ለይቅር ባዩ
የድኅነትን መንገድ ንስሓን የሠራ
አንዳንጠፋበት ነው ዳግም በመከራ
ይቅር ይለናል ይታደገናል/2/ በቸርነቱ

VERSE 6
የሰው ልጅ ከኃጢአት እስኪመለሰ ድረስ
አይቸኩልም እርሱ መዓትን ለማድረስ
ትአግሥቱ ሰፊ ነው ሥራው አረቂቅ
ቸርነት ገንዘቡ ቢሰጠው አልያቅ

VERSE 7
ይቅር ይለናል ይታደገናል/2/ በቸርነቱ
462. ወደ ሕይወት መንገድ
ወደ ሕይወት መንገድ ይመራኛል ጌታ/2/
በጨለማ ሕይወት እንዳልንገላታ/2/', 'aሐdu ab byie smhn bqeds
ledhoch bsex bieth bgesegs
bemelaakt lsan bzemr beellta
mn axeqmaፃlehu kalferahu gieta/2/

VERSE 1
terara eskafels emnet binoregn
ሥra kelielebet mnm ayxeqemegnm
lbien stmeremr kehonkugn qelal
krstiyan mebalu mn yxeqmegna/2/

VERSE 2
cew alca bihon bemn yxafxal
kewc texlo beegr yregagexal
anten lemiketel endalhon enqfat
amlkotie yhun befqr befrፃt/2/

VERSE 3
yeawqet sew mehon ayxeqmegn
anies mesqelh new fqrh yashenefegn
keemnetie yetenesa metazez yhunegn
smhn mefrat new beemnet yemiyanoregn/2/

VERSE 4
461. bekeሃlinetu
bekeሃlinetu beamlaknetu /2/
yqr ylenal ytadegenal/2/ bechernetu
mn ykefelewal mn yhon wagaw

VERSE 5
lefexeren gieta leyqr bayu
yedኅnetn menged nsሓn yeሠra
andanxefabet new dagm bemekera
yqr ylenal ytadegenal/2/ bechernetu

VERSE 6
yesew lj keኃxiat eskimelese dres
aychekulm ersu meዓtn lemadres
tagሥtu sefi new ሥraw areqiq
chernet genzebu bisexew alyaq

VERSE 7
yqr ylenal ytadegenal/2/ bechernetu
462. wede ሕywet menged
wede ሕywet menged ymeragnal gieta/2/
becelema ሕywet endalngelata/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('fexari-bcha-new-ywetiena-kbrie-2', 'ፈጣሪ ብቻ ነው ሕይወቴና ክብሬ /2/', 'ፈጣሪ ብቻ ነው ሕይወቴና ክብሬ /2/', 'fexari bcha new ሕywetiena kbrie /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ፈጣሪ ብቻ ነው ሕይወቴና ክብሬ /2/', 'በአርሱ ደስ ይለናል ሳቀርብ ዝማሬ/2/
ጉልበት ሁሉ ለአንገተ በፍርሃት ይስግዳል/2/
ምሕረትን አድለን ፈጣሪ ቸል አተትበል/2/
ለኃያሉ ጌታ በአንተ ይረካል/2/

VERSE 1
በምሕረትህ ማረን አቤቱ ፈጣሪን/2/
ሰላምን አድላት ለኢትዮጵያ /2/
አጆችዋን ዘርግታ ስትል ሃሌ ሉያ/2/
463. ለእኛ ብሎ

VERSE 2
ለእኛ ብሎ ተንገላታ የሁላችን ጌታ/2/
አዳም ቅጠል በልቶ ባመጣው በሽታ /2/
አምላክ ዋለ ቀራንዮ ለብሶ ከለሜዳ/''2/
አዳም ሕግ አፍርሶ በጎተተው አእዳ/2/

VERSE 3
ለመስቀሉ ተሰለፈ እየተገረፈ/2/
በእጽ ሊፈውሰው በአጽ ላይ አረፈ/2/
በመስቀል ላይ የዋለውን አናመስግን/2/
በአጽ የሞተው በእጽ አዳነው

VERSE 4
ምንም በደል ሳይኖርነት አልም መድኃኒት/2/', 'bearsu des ylenal saqerb zmarie/2/
gulbet hulu leangete befrሃt ysgdal/2/
mሕretn adlen fexari chel atetbel/2/
leኃyalu gieta beante yrekal/2/

VERSE 1
bemሕreth maren abietu fexarin/2/
selamn adlat leityophya /2/
ajochwan zergta stl ሃlie luya/2/
463. leegna blo

VERSE 2
leegna blo tengelata yehulachn gieta/2/
adam qxel belto bamexaw beshta /2/
amlak wale qeranyo lebso kelemieda/''2/
adam ሕg afrso begotetew aeda/2/

VERSE 3
lemesqelu teselefe eyetegerefe/2/
beets lifewsew beats lay arefe/2/
bemesqel lay yewalewn anamesgn/2/
beats yemotew beets adanew

VERSE 4
mnm bedel saynornet alm medኃnit/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('endtqebelat-amlakie-hoy-adera-nefsien-2', 'እንድትቀበላት አምላኬ ሆይ አደራ ነፍሴን/2/', 'እንድትቀበላት አምላኬ ሆይ አደራ ነፍሴን/2/', 'endtqebelat amlakie hoy adera nefsien/2/', 'Ethiopian Orthodox Tewahedo Mezmur - እንድትቀበላት አምላኬ ሆይ አደራ ነፍሴን/2/', '467. ሞቼ ስለማልቀር
ሞቼ ስለማልቀር ትንሣኤ ስላለኝ
በተስፋ ቤታችን ስለምንገኛኝ
ወዳጅ ዘመዶቼ አታልቅሱ በቃኝ/2/

VERSE 1
አቀናለሁና ገና አዲስ ኑሮ
አምላክን አስቡት ይብቃችሁ እሮርሃ/2/
ይልቅ ጸልዮላት ለነፍሴ አረፍት
ዓለም አታላይ ናት ዘላቁ አይደለች

VERSE 2
ለሥጋ ነው እንጂ ለነፍስ አትመች/2/
ግን ከሥጋ ጋር ስንኖር ትእዛዙን ከጠበቅን
ለተዘጋጀው ቤት ወራሾች እኛው ነን''2/
መቼም ከማያልቀው በረከት ያደልከን

VERSE 3
ዘላለማዊ ሕይወት ለሰጠኽኝ
ምስጋናችን ይድረስህ ጸጋህ አይለየን
አኛ በድለን ትህዛዝህን ጥሰን', '467. mochie slemalqer
mochie slemalqer tnሣie slalegn
betesfa bietachn slemngegnagn
wedaj zemedochie atalqsu beqagn/2/

VERSE 1
aqenalehuna gena adis nuro
amlakn asbut ybqachhu erorሃ/2/
ylq tselyolat lenefsie areft
ዓlem atalay nat zelaqu aydelech

VERSE 2
leሥga new enji lenefs atmech/2/
gn keሥga gar snnor tezazun kexebeqn
letezegajew biet werashoch egnaw nen''2/
mechiem kemayalqew bereket yadelken

VERSE 3
zelalemawi ሕywet lesexeኽgn
msganachn ydresh tsegah ayleyen
agna bedlen thzazhn xsen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('aneho-biet-rach-seba-amd-aqomech-2', 'አነሆ ቤት ሠራች ሰባ አምድ አቆመች/2/', 'አነሆ ቤት ሠራች ሰባ አምድ አቆመች/2/', 'aneho biet ሠrach seba amd aqomech/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አነሆ ቤት ሠራች ሰባ አምድ አቆመች/2/', 'ጥበብ ግን እርሱ ነው መድኃኒታችን
በሥጋ ተገልጦ እኛን አዳነን
በደሙ ፈወሶ ተወዳጅን
ለእርሱ የመረጠን ይክበር ይመስገን /2/

VERSE 1
469. አማኑኤል ሆይ
አማኑኤል ሆይ መድኃኒቴ ሆይ
አትተወኝ አንተ ሞትን አእንዳላይ/2/
የግብፅ ከተማ ደምቃ ስትታየኝ

VERSE 2
ተስሎንቄ አድጋ ለዓይኔ ስትስብኝ
ኤልሻዳይ ኢየሱስ ልቤን መልስልኝ/2/
መታመን በሰው ላይ ምንም አይጠቅምም
መከታነት በሰው ለእኔ አይሆንም

VERSE 3
አትተወኝ አንተ አምላክ ዘለዓለም/2/
የሚያጽናናኝ የለም እኔ እንዲህ ስከፋ
ህምልምም ሆነብኛል የሰው ሁሉ ተስፋ
ቃልህን የሚታጥፈው አንተ ከእኔ

VERSE 4
አትጥፋ/2/
470. ዋ ለነፍሴ
ዋ ለነፍሴ ምንም ስንቅ አልያዝኩኝ /2/
አዬ ለእኔሰ ወዮልኝ ዋ ለነፍሴ

VERSE 5
ምንም ስንቅ አልያዝኩ
ነፍሴን አየጎዳሁ ሳስብ ስለሥጋ
ዓለም ስትሰበኝ አዳላገኝ ዋጋ
መንፈስህን ስጠኝ ከበደል እንጻኝ

VERSE 6
ቃልህን አሰማለሁ ማስተዋል የለኝም
ፍጹም ሆኖ መቆም ጌታ ሆይ አቃተኝ
ታዲያ እንደፈቀድህ እንዴት ብዬ ልገኝ
ድካሜን ታውቃለህ አምላክ ሆይ አበርታኝ

VERSE 7
አለቅሳለሁ ጌታ ከእግርህ ስር ወድቄ
ሕይወቴ ተዛብቶ በኃጢአት ማቅቄ
ዘመኔን ጨረስኩኝ መልካምን ሳልሠራ
ቸርነትህ ይርዳኝ ልኑር ከአንተ ጋራ', 'xbeb gn ersu new medኃnitachn
beሥga tegelxo egnan adanen
bedemu feweso tewedajn
leersu yemerexen ykber ymesgen /2/

VERSE 1
469. amanuiel hoy
amanuiel hoy medኃnitie hoy
attewegn ante motn aendalay/2/
yegbፅ ketema demqa sttayegn

VERSE 2
teslonqie adga leዓynie stsbgn
ielshaday iyesus lbien melslgn/2/
metamen besew lay mnm ayxeqmm
meketanet besew leenie ayhonm

VERSE 3
attewegn ante amlak zeleዓlem/2/
yemiyatsnanagn yelem enie endih skefa
hmlmm honebgnal yesew hulu tesfa
qalhn yemitaxfew ante keenie

VERSE 4
atxfa/2/
470. wa lenefsie
wa lenefsie mnm snq alyazkugn /2/
ayie leeniese weyolgn wa lenefsie

VERSE 5
mnm snq alyazku
nefsien ayegodahu sasb sleሥga
ዓlem stsebegn adalagegn waga
menfeshn sxegn kebedel entsagn

VERSE 6
qalhn asemalehu mastewal yelegnm
ftsum hono meqom gieta hoy aqategn
tadiya endefeqedh endiet byie lgegn
dkamien tawqaleh amlak hoy abertagn

VERSE 7
aleqsalehu gieta keegrh sr wedqie
ሕywetie tezabto beኃxiat maqqie
zemenien cereskugn melkamn salሠra
cherneth yrdagn lnur keante gara', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('le-ga-megezat-nefsie-hoy-mnew-biqerbsh', 'ለሥጋ መገዛት ነፍሴ ሆይ ምነው ቢቀርብሽ', 'ለሥጋ መገዛት ነፍሴ ሆይ ምነው ቢቀርብሽ', 'leሥga megezat nefsie hoy mnew biqerbsh', 'Ethiopian Orthodox Tewahedo Mezmur - ለሥጋ መገዛት ነፍሴ ሆይ ምነው ቢቀርብሽ', 'ውረደት ነው ፍጻሜ ነፍሴ ሆይ የሚከያናንብሸ
መልካም የሆነወን ነፍሴ ሆይ
ጽድቁን ተከተይ
ክርሰቶስን መስለሽ ነፍሴ ሆይ

VERSE 1
ቸርነትን ሥሪ
ሞትን ማን ይመርጣል ነፍሴ ሆይ ሕይወትን
በመጥላት
ከእንግዲህ መራቅ ነው ነፍሴ ሆይ

VERSE 2
ከስርቆት ከዝሙት
ጸጋህ እንዲበዛልሽ ነፍሴ ሆይ
የቃሉ በረከት
ከቤቱ አትጥፊ ነፍሴ ሆይ ፍቅር ከሞላበት/2/

VERSE 3
ለአንቺ ነበር ጌታ ነፍሴ ሆይ
ደሙን ያፈሰሰው
ተሰቅሎ ሞቶ ነው ነፍሴ ሆይ
ፍቅርን የገለጸው

VERSE 4
በፍቅሩ ሳሰበኝ ነፍሴ ሆይ
ላፈቀረኝ ጌታ
ምስጋና አቀርባለሁ ነፍሴ ሆይ ዘወትር ጠዋት ማታ /2/
ብወድቅ ምርኩዝ ድጋፍ ነፍሴ ሆይ ጋሻ ይሆነኛል

VERSE 5
ለፍርድ አይቸኩልም ነፍሴ ሆይ', 'wredet new ftsamie nefsie hoy yemikeyananbshe
melkam yehonewen nefsie hoy
tsdqun teketey
krsetosn meslesh nefsie hoy

VERSE 1
chernetn ሥri
motn man ymerxal nefsie hoy ሕywetn
bemexlat
keengdih meraq new nefsie hoy

VERSE 2
kesrqot kezmut
tsegah endibezalsh nefsie hoy
yeqalu bereket
kebietu atxfi nefsie hoy fqr kemolabet/2/

VERSE 3
leanchi neber gieta nefsie hoy
demun yafesesew
teseqlo moto new nefsie hoy
fqrn yegeletsew

VERSE 4
befqru sasebegn nefsie hoy
lafeqeregn gieta
msgana aqerbalehu nefsie hoy zewetr xewat mata /2/
bwedq mrkuz dgaf nefsie hoy gasha yhonegnal

VERSE 5
lefrd aychekulm nefsie hoy', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ante-bemesqel-lay-demh-feseseln', 'አንተ በመስቀል ላይ ደምህ ፈሰሰልን', 'አንተ በመስቀል ላይ ደምህ ፈሰሰልን', 'ante bemesqel lay demh feseseln', 'Ethiopian Orthodox Tewahedo Mezmur - አንተ በመስቀል ላይ ደምህ ፈሰሰልን', 'ፍቅርህን ስናስብ እጅግ ይደንቀናል
ለዚህ ሁሉ ውለታህ ምን እንከፍላለን
468.የጥበብ ፃገሯ
የጥበብ ዛፃገራ ወዴት ነው

VERSE 1
ማደሪያዋስ ወዴት ነው/2/
በውኑ ጎዳናዋ ከወዴት ተቃኘ
ዝናና ወሬዋ ከወዴት ተገኘ
ፈልጎ የገዛት ማነው በቀይ ወርቅ

VERSE 2
ባሕሩን ታሻግሮ ስሟን በማወቅ
ማነው ያወረዳት ከደመና በላይ
ድምጺንስ የሰማ ከላይ ከሰማይ
አርሷን የሚጠሉ ናቸውና ከንቱ

VERSE 3
አይቀርላቸውም ኃላ የሞት ሞቱ/2/
ሁሉን የሚያውቅ አርሱ ያውቃታል
የአውቀት ጎዳናዋ ያስተምርላታል
በክርሰቶስ ፈቃድ ምድር ላይ ታየች

VERSE 4
አንተ በመስቀል ላይ ደምህ ፈሰሰልን', 'fqrhn snasb ejg ydenqenal
lezih hulu wletah mn enkeflalen
468.yexbeb ፃgerua
yexbeb zaፃgera wediet new

VERSE 1
maderiyawas wediet new/2/
bewnu godanawa kewediet teqagne
znana weriewa kewediet tegegne
felgo yegezat manew beqey werq

VERSE 2
baሕrun tashagro smuan bemaweq
manew yaweredat kedemena belay
dmtsins yesema kelay kesemay
arsuan yemixelu nachewna kentu

VERSE 3
ayqerlachewm ኃla yemot motu/2/
hulun yemiyawq arsu yawqatal
yeawqet godanawa yastemrlatal
bekrsetos feqad mdr lay tayech

VERSE 4
ante bemesqel lay demh feseseln', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lezih-hulie-wletah-mn-ykefelzal', 'ለዚህ ሁሌ ውለታህ ምን ይከፈልዛል', 'ለዚህ ሁሌ ውለታህ ምን ይከፈልዛል', 'lezih hulie wletah mn ykefelzal', 'Ethiopian Orthodox Tewahedo Mezmur - ለዚህ ሁሌ ውለታህ ምን ይከፈልዛል', 'የአኛ ፍቅር ስቦህ ከሰማይ ወርደህ
ደካማ ሥጋችንን ተዋርደህ አክብረህ
አግራችንን አጥብህ ፍቅር ላስተማርከን
ውለታህ ከብዶናል ምን እንከፍልዛለን/2/', 'yeagna fqr sboh kesemay werdeh
dekama ሥgachnn tewardeh akbreh
agrachnn axbh fqr lastemarken
wletah kebdonal mn enkeflzalen/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zarie-tesnognal-aqtognal-metgat', 'ዛሬ ተስኖኛል አቅቶኛል መትጋት', 'ዛሬ ተስኖኛል አቅቶኛል መትጋት', 'zarie tesnognal aqtognal metgat', 'Ethiopian Orthodox Tewahedo Mezmur - ዛሬ ተስኖኛል አቅቶኛል መትጋት', 'ጨንቆኝ አጣራለሁ ጸጋ አጣ ሕይወቴ
አባክህ አርመኝ እርዳኝ መድኃኒቴ
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የአጅህን ሥራ ጌታዬ አስተካክለው', 'cenqogn axaralehu tsega axa ሕywetie
abakh armegn erdagn medኃnitie
lbie dngay hono qalh alseberew
yeajhn ሥra gietayie astekaklew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ynienm-feweskegn-zarie-mayet-chalkugn-2', 'ዓይኔንም ፈወስከኝ ዛሬ ማየት ቻልኩኝ/2/', 'ዓይኔንም ፈወስከኝ ዛሬ ማየት ቻልኩኝ/2/', 'ዓynienm feweskegn zarie mayet chalkugn/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ዓይኔንም ፈወስከኝ ዛሬ ማየት ቻልኩኝ/2/', 'አንተን እንዳላይ ቁመቴ አጠረብኝ
ከፊት እየሮጥኩ ከዛፍ ላይ ወጣሁኝ
ጌታ ሆይ ጠረኸኝ ዘኬዎስ ሆይ አልከኝ
ቤቴ አንድትገባ ፍቃድህ ሆነልኝ/2/', 'anten endalay qumetie axerebgn
kefit eyeroxku kezaf lay wexahugn
gieta hoy xereኸgn zekiewos hoy alkegn
bietie andtgeba fqadh honelgn/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('agziab-r-hoy-ybza-m-reth', 'አግዚአብሔር ሆይ ይብዛ ምሕረትህ', 'አግዚአብሔር ሆይ ይብዛ ምሕረትህ', 'agziabሔr hoy ybza mሕreth', 'Ethiopian Orthodox Tewahedo Mezmur - አግዚአብሔር ሆይ ይብዛ ምሕረትህ', 'ሕፃናት ሲያለቅሱ እናት አባት አጥተው
ተስፋቸው ሲጨልም አዛውንት ጧሪ አተው
አትጨክን አምላክ ቁጣህን መልሰው
የዘመኑን ንዳድ እሳቱን አብርደው', 'ሕፃnat siyaleqsu enat abat axtew
tesfachew sicelm azawnt xuari atew
atcekn amlak quxahn melsew
yezemenun ndad esatun abrdew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('enkuan-yetamemew-yeqomew-sisega', 'እንኳን የታመመው የቆመው ሲሰጋ', 'እንኳን የታመመው የቆመው ሲሰጋ', 'enkuan yetamemew yeqomew sisega', 'Ethiopian Orthodox Tewahedo Mezmur - እንኳን የታመመው የቆመው ሲሰጋ', 'የሥጋዊ ጥበብ መላም አጥቷል ዋጋ
ከሰው ወገን የለም አንዳች ቅንጣት ተስፋ
ምሕረትህ ይብዛልን በሞት እንዳንጠፋ', 'yeሥgawi xbeb melam axtual waga
kesew wegen yelem andach qnxat tesfa
mሕreth ybzaln bemot endanxefa', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ceneqegn-xebebegn-nefsie-wediyalgn-2', 'ጨነቀኝ ጠበበኝ ነፍሴ ወዲያልኝ/2/', 'ጨነቀኝ ጠበበኝ ነፍሴ ወዲያልኝ/2/', 'ceneqegn xebebegn nefsie wediyalgn/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ጨነቀኝ ጠበበኝ ነፍሴ ወዲያልኝ/2/', 'ተሸክሜ የኃጥያት ክምር/2/
ይመሻል ይነጋል በከንቱ ስዞር/2/
ገሰገሰ ቀኑ ጨለመብኝ /2
በድያለሁ ወደ አንተ አጮሣሃለሁ/ሪጋ/

VERSE 1
ይቅር በለኝ አማጸንፃለሁ
ችላ አትበለኝ ከፊትህ ቆሜአለሁ/ሪ2/', 'teshekmie yeኃxyat kmr/2/
ymeshal ynegal bekentu szor/2/
gesegese qenu celemebgn /2
bedyalehu wede ante acoሣሃlehu/riga/

VERSE 1
yqr belegn amatsenፃlehu
chla atbelegn kefith qomiealehu/ri2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('awnetegna-amlak-selamhn-sxegn-2', 'አውነተኛ አምላክ ሰላምህን ስጠኝ/2/', 'አውነተኛ አምላክ ሰላምህን ስጠኝ/2/', 'awnetegna amlak selamhn sxegn/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አውነተኛ አምላክ ሰላምህን ስጠኝ/2/', 'ክርስቲያኖች ሁሉ ትዕዛዙን አክብሩ
ምስጋናን አቅርቡ ስገዱ ዘምሩ
የጌታን አመጣጥ ለዓለም ንገሩ
ደቀመዛሙርቱ ወንጌል አስተምሩ', 'krstiyanoch hulu tዕzazun akbru
msganan aqrbu sgedu zemru
yegietan amexax leዓlem ngeru
deqemezamurtu wengiel astemru', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('guadegnochie-xelugn-telewcubachew', 'ጓደኞቼ ጠሉኝ ተለውጩባቸው', 'ጓደኞቼ ጠሉኝ ተለውጩባቸው', 'guadegnochie xelugn telewcubachew', 'Ethiopian Orthodox Tewahedo Mezmur - ጓደኞቼ ጠሉኝ ተለውጩባቸው', 'የጥንቱን ፀባዬን ስለነፈግኹአቸው
ብቻዬን የሆንኩኝ ቢመስለኝም ለእኔ
ጌታ እንደሆን አለልኝ ከጎኔ', 'yexntun ፀbayien slenefegኹachew
bchayien yehonkugn bimeslegnm leenie
gieta endehon alelgn kegonie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('askemechienew', 'አስከመቼነው', 'አስከመቼነው', 'askemechienew', 'Ethiopian Orthodox Tewahedo Mezmur - አስከመቼነው', 'አስከ መቼ ነው የማልለወጠው
ባልተሰበረ ልብ የምመላለሰው/ሪ/
በሰጠኸኝ ጸጋ ድካሜ ተከድኖ
ዓለም ይክበኛል አልቆና አግኖ

VERSE 1
ይህን ከንቱ ወጥመድ ጣለው ከ፲ኋጊላዬ
ትንሽ ሰው መሆኔን ይወቅ ህሊናዬ /2/', 'aske mechie new yemallewexew
baltesebere lb yemmelalesew/ri/
besexeኸgn tsega dkamie tekedno
ዓlem ykbegnal alqona agno

VERSE 1
yhn kentu wexmed xalew ke፲huagilayie
tnsh sew mehonien yweq hlinayie /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('y-stqela-kewakbt-siregfu', 'ፀሐይ ስትቀላ ከዋክብት ሲረግፉ', 'ፀሐይ ስትቀላ ከዋክብት ሲረግፉ', 'ፀሐy stqela kewakbt siregfu', 'Ethiopian Orthodox Tewahedo Mezmur - ፀሐይ ስትቀላ ከዋክብት ሲረግፉ', 'ለገናናው ክብርህ ወድቀው ሲሸነፉ
ለሁለት ሲከፈል ድንጋያማው አለት
የእኔ ልብ መቼ ይሆን የሚሸነፍለት/2/
ቃልህን ስስማ ልቤን ይነካኛል', 'legenanaw kbrh wedqew sishenefu
lehulet sikefel dngayamaw alet
yeenie lb mechie yhon yemisheneflet/2/
qalhn ssma lbien ynekagnal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tstaqn-asbalehu-zen-ysemagnal', 'ጽታቅን አስባለሁ ሐዘን ይሰማኛል', 'ጽታቅን አስባለሁ ሐዘን ይሰማኛል', 'tstaqn asbalehu ሐzen ysemagnal', 'Ethiopian Orthodox Tewahedo Mezmur - ጽታቅን አስባለሁ ሐዘን ይሰማኛል', 'ወዲያው ተመልሼ ሁሉን አረሳለሁ
ለዚህ ዓለም ስብከት ልቤን አከፍታለሁ/2/
493. ከወገኔ ጋራ', 'wediyaw temelshie hulun aresalehu
lezih ዓlem sbket lbien akeftalehu/2/
493. kewegenie gara', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zbu-tesbsbo-bebiete-krstiyan', 'ሕዝቡ ተስብስቦ በቤተ ክርስቲያን', 'ሕዝቡ ተስብስቦ በቤተ ክርስቲያን', 'ሕzbu tesbsbo bebiete krstiyan', 'Ethiopian Orthodox Tewahedo Mezmur - ሕዝቡ ተስብስቦ በቤተ ክርስቲያን', 'ሲዘምር ደስ ይላል በአንድነት ሆነን
በረከት የሞላው ዝማሬ ይገርማል
ከአጣኑ ጋር ወደ ላይ ይወጣል/2/', 'sizemr des ylal beandnet honen
bereket yemolaw zmarie ygermal
keaxanu gar wede lay ywexal/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qesawstu-lielit-ma-liet-siyaqerbu', 'ቀሳውስቱ ሌሊት ማኅሌት ሲያቀርቡ', 'ቀሳውስቱ ሌሊት ማኅሌት ሲያቀርቡ', 'qesawstu lielit maኅliet siyaqerbu', 'Ethiopian Orthodox Tewahedo Mezmur - ቀሳውስቱ ሌሊት ማኅሌት ሲያቀርቡ', 'ከመላእክት ጋራ ወርብ ሲወርቡ
ብርሃን ለብሰዩ በድሰታ ስንዘምር
ትዝታው ልዬ ነው ህሊና ሲሰውር', 'kemelaekt gara werb siwerbu
brሃn lebseyu bedseta snzemr
tztaw lyie new hlina sisewr', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('eyalefe-new-zemenie', 'እያለፈ ነው ዘመኔ', 'እያለፈ ነው ዘመኔ', 'eyalefe new zemenie', 'Ethiopian Orthodox Tewahedo Mezmur - እያለፈ ነው ዘመኔ', 'አያለፈ ነው ዘመኔ ትእዛዙን ሳልፈጽም ወየው ለእኔ/2/
በጠራኝ ጊዜ ምን አላለሁ ና ብሎ ወደእኔ/2/
በጠራኝ ጊዜ ምን አላለው ነይ ብሎ ወደ አኔ
በወጣትነቴ ሳልሠራ እያየሁ አለፈኝ ብዙ

VERSE 1
አዝመራ/ሪኃ/
ከእንግዲህ በመሥራት ጌታ ሆይ ልትር ከአንተ
ጋራ/ሪጋ/
የማስብበት በየለዕቱ ንጹሕ ልብን ስጠኝ አቤቱ /2/

VERSE 2
ከትአዛዝህ ወጪ በመሆን እዳልቀር በከንቱ /2/
አንደየሥራው ለመስጠት በግርማ መንግሥቱ
ሲመጣ/ሪ/
ማን ይሆን የሚቆም ከፊቱ ፊተናን የወጣ/2/

VERSE 3
አንዳያስቷችሁ ተጠንቀቁ አየተማራችሁ ከቃሉ//2/
ይመጣሉና በአርሱ ስም አምላክ ነን የሚሉ/2/
ትፅግሥትን በመያዝ ሁላችሁ አስከመጨረሻው
ጠንክሩ/2/

VERSE 4
ያን ጊዜ ይሆናል በእርሱ ዘንድ የማዳን ተግባሩ/2/
495. አማኑኤል ሆይ
አማኑኤል ሆይ መድኃኒቴ ሆይ
አትተወኝ አንተ ሞትን እንዳላይ /2/

VERSE 5
የግብፅ ከተማ ደምቃ ስትታየ
ተሰሎንቄ አደጋ ላይኔ ስትሰበኝ
ኤልሻዳይ ኢየሱስ ልቤን መልስልኝ/2/
መታምን በሰው ላይ ምንም አይጠቀምም

VERSE 6
መከታነት በሰው ለእፄ አይሆንም
አትተወኝ አንተ አምላክ ዘለዓለም/2/', 'ayalefe new zemenie tezazun salfetsm weyew leenie/2/
bexeragn gizie mn alalehu na blo wedeenie/2/
bexeragn gizie mn alalew ney blo wede anie
bewexatnetie salሠra eyayehu alefegn bzu

VERSE 1
azmera/riኃ/
keengdih bemeሥrat gieta hoy ltr keante
gara/riga/
yemasbbet beyeleዕtu ntsuሕ lbn sxegn abietu /2/

VERSE 2
ketazazh weci bemehon edalqer bekentu /2/
andeyeሥraw lemesxet begrma mengሥtu
simexa/ri/
man yhon yemiqom kefitu fitenan yewexa/2/

VERSE 3
andayastuachhu texenqequ ayetemarachhu keqalu//2/
ymexaluna bearsu sm amlak nen yemilu/2/
tፅgሥtn bemeyaz hulachhu askemecereshaw
xenkru/2/

VERSE 4
yan gizie yhonal beersu zend yemadan tegbaru/2/
495. amanuiel hoy
amanuiel hoy medኃnitie hoy
attewegn ante motn endalay /2/

VERSE 5
yegbፅ ketema demqa sttaye
teselonqie adega laynie stsebegn
ielshaday iyesus lbien melslgn/2/
metamn besew lay mnm ayxeqemm

VERSE 6
meketanet besew leeፄ ayhonm
attewegn ante amlak zeleዓlem/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abr-m-kekaran-keenat-keabatu-biet', 'አብርሃም ከካራን ከእናት ከአባቱ ቤት', 'አብርሃም ከካራን ከእናት ከአባቱ ቤት', 'abrሃm kekaran keenat keabatu biet', 'Ethiopian Orthodox Tewahedo Mezmur - አብርሃም ከካራን ከእናት ከአባቱ ቤት', 'ከነአን ሲገባ ሲሰደድ በእምነት
ከተሰጠው ተስፋ አንዳች ሳይጎልበት
አንደ ምድር አሸዋ ዘሩን አበዛለት/2/', 'kenean sigeba siseded beemnet
ketesexew tesfa andach saygolbet
ande mdr ashewa zerun abezalet/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yegexeme-new-ya-msxiru', 'የገጠመ ነው ያ ምስጢሩ', 'የገጠመ ነው ያ ምስጢሩ', 'yegexeme new ya msxiru', 'Ethiopian Orthodox Tewahedo Mezmur - የገጠመ ነው ያ ምስጢሩ', '502. ኦ. ድንግል ደስ ይበልሽ
ኦ ድንግል ደስ ይበልሽ
ኦ ቅድስት ደስ ይበልሽ
ገብርኤል በቃሉ ደስታን ያሰማሽ', '502. o. dngl des ybelsh
o dngl des ybelsh
o qdst des ybelsh
gebriel beqalu destan yasemash', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yed-netie-rma-lyu-mlktie', 'የድኅነቴ ዓርማ ልዩ ምልክቴ', 'የድኅነቴ ዓርማ ልዩ ምልክቴ', 'yedኅnetie ዓrma lyu mlktie', 'Ethiopian Orthodox Tewahedo Mezmur - የድኅነቴ ዓርማ ልዩ ምልክቴ', 'ለእኔም ነሸ እናቴ አመቤቴ
የድኅነቴ ዓርማ ልዩ ምልክቴ
ልዩ ነሽ እናቴ እመቤቴ
የምታማልጆጀን ከቸሩ አባታችን

VERSE 1
ለአኛም አናታችን አመቤታችን/2/
የምታማልጅጆጅን ከቸሩ አምላካችን
ለአኛም አናታችን አስታራቂያችን
ስለ ውድ ሀገርሽ ስለ ኢትዮጵያ

VERSE 2
ለልጆችሽ አሳሳቢ ብለሽ ሃሌ ሉያ
ድንግል ሆይ አሳሳቢ ብለሽ ዛሌ ሉያ/2/
ስለ ውድ ሀገርሽ ስለ ኢትዮጵያ
ለልጂሽ አሳሳቢ ብለሽ ሃሌ ሉያ

VERSE 3
503... እኔስ በምግባሬ
አኔስ በምግባሬ ደካማ ሆኛለሁ
አዘኝልኝ ድንግል አለምንሻለሁ /2/
ያንን የአሳት ባሕር እንዳላይ አደራ

VERSE 4
ድረሽልኝ ድንግል ስምሽን ስጠራ /2/
የዳዊት መሰንቆ የኤልያስ መና
የናሆም መጽኃኒት ነይ በደመና''/2/
አንቺ ነሽ ጉልበቴ በደከመኝ ጊዜ

VERSE 5
የልቤ መጽናኛ ረዳት ምርኩዜ /2/
አፈሳለሁ አንባ በጣም ተጨንቄ
አማጸንሻለሁ በደሌን አውቄ/2/
504. የአመቤታችን አማላጅነቷን

VERSE 6
የአመቤታችን አማላጅነቷን ክብራን
የቀነሰ ያዋረደ
አዳ አለብን /2/ ከፈጣሪያችን/2/
የተሰጣት ሙሉ ሥልጣን

VERSE 7
ክብር ያገኘች በቃል ኪዳን
ስሟን የጠራ እንደሚድን
በመጽሐፍ ሲነገር
አዳ አለብን/2/ ከፈጣሪያችን/2/

VERSE 8
ሬዛዊተ ኩሉ የተባለች
በነቅዱስ ኤፍሬም የተመሰገነች
በአነ አባ ጊዮርጊስ ምስጋናን ያገኘች
በመናፍቃን ዘንድ ምነው ተዘነጋች

VERSE 9
አዳ አለብን/2/ ከፈጣሪያችን /2/
የድኅነቴ ዓርማ ልዩ ምልክቴ
ለአኔም ነሽ አናቴ አመቤቴ
የድኅነቴ ዓርማ ልዩ ምልክት', 'leeniem neshe enatie amebietie
yedኅnetie ዓrma lyu mlktie
lyu nesh enatie emebietie
yemtamaljojen kecheru abatachn

VERSE 1
leagnam anatachn amebietachn/2/
yemtamaljjojn kecheru amlakachn
leagnam anatachn astaraqiyachn
sle wd hagersh sle ityophya

VERSE 2
leljochsh asasabi blesh ሃlie luya
dngl hoy asasabi blesh zalie luya/2/
sle wd hagersh sle ityophya
leljish asasabi blesh ሃlie luya

VERSE 3
503... enies bemgbarie
anies bemgbarie dekama hognalehu
azegnlgn dngl alemnshalehu /2/
yann yeasat baሕr endalay adera

VERSE 4
dreshlgn dngl smshn sxera /2/
yedawit mesenqo yeielyas mena
yenahom metsኃnit ney bedemena''/2/
anchi nesh gulbetie bedekemegn gizie

VERSE 5
yelbie metsnagna redat mrkuzie /2/
afesalehu anba bexam tecenqie
amatsenshalehu bedelien awqie/2/
504. yeamebietachn amalajnetuan

VERSE 6
yeamebietachn amalajnetuan kbran
yeqenese yawarede
ada alebn /2/ kefexariyachn/2/
yetesexat mulu ሥlxan

VERSE 7
kbr yagegnech beqal kidan
smuan yexera endemidn
bemetsሐf sineger
ada alebn/2/ kefexariyachn/2/

VERSE 8
riezawite kulu yetebalech
beneqdus iefriem yetemesegenech
beane aba giyorgis msganan yagegnech
bemenafqan zend mnew tezenegach

VERSE 9
ada alebn/2/ kefexariyachn /2/
yedኅnetie ዓrma lyu mlktie
leaniem nesh anatie amebietie
yedኅnetie ዓrma lyu mlkt', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('taweqognal-xfatie-bzu-andebedelkugn', 'ታወቆኛል ጥፋቴ ብዙ አንደበደልኩኝ', 'ታወቆኛል ጥፋቴ ብዙ አንደበደልኩኝ', 'taweqognal xfatie bzu andebedelkugn', 'Ethiopian Orthodox Tewahedo Mezmur - ታወቆኛል ጥፋቴ ብዙ አንደበደልኩኝ', 'አንተ ክቡር መልአክ ልደቱን አብሣሪ
አማልደኝ ከአምላክ ከፈጣሪ
በፊቱ አንዳላፍር የተጠራው ለታ
ጻድቃን ሰማዕታት እናንተም ሁላችሁ

VERSE 1
አማልዱኝ ከአምላኬ ከአምላካችሁ
507... እናት አለኝ
አናት አለኝ አኔስ እናት አለኝ
ሲጨንቀኝ ሲጠበኝ የምታጽናናኝ

VERSE 2
አናት አለኝ እኔስ አናት አለኝ
የተቀኘላት አዝራ በመስንቆ
እናትነቷን ንጽሕናዋን አውቆ
ያመሰገናት ዳዊት በበገና

VERSE 3
አትለየኝም እናቴ ናትና /2/
ለቅስ ስተክዝ ወድቄ ከፊቷ
አቅፋ አጽናናችኝ እኔን ከደረቷ
ታስታርቃለች ሁሌ ለኃጥአን

VERSE 4
ትማጸናለች በዕንባ ዝክር ልጀን''2/
የአዳም ተስፋ ናት ድንግል እናታችን
መርጦ ያደረባት ክርስቶስ ጌታችን
ታማልዳለች ዛሬም ለዘላለም

VERSE 5
የአምላክ አናት የፍጥረታት ሰላም/2/
508. አድኝኝ እናቴ
አድኝኝ እናቴ ከሥጋ ፈተና
ሥጋዬ ከኃጠአት ከቶ አልራቀምና

VERSE 6
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እአልሻለሁ/2/', 'ante kbur melak ldetun abሣri
amaldegn keamlak kefexari
befitu andalafr yetexeraw leta
tsadqan semaዕtat enantem hulachhu

VERSE 1
amaldugn keamlakie keamlakachhu
507... enat alegn
anat alegn anies enat alegn
sicenqegn sixebegn yemtatsnanagn

VERSE 2
anat alegn enies anat alegn
yeteqegnelat azra bemesnqo
enatnetuan ntsሕnawan awqo
yamesegenat dawit bebegena

VERSE 3
atleyegnm enatie natna /2/
leqs stekz wedqie kefitua
aqfa atsnanachgn enien kederetua
tastarqalech hulie leኃxan

VERSE 4
tmatsenalech beዕnba zkr ljen''2/
yeadam tesfa nat dngl enatachn
merxo yaderebat krstos gietachn
tamaldalech zariem lezelalem

VERSE 5
yeamlak anat yefxretat selam/2/
508. adgngn enatie
adgngn enatie keሥga fetena
ሥgayie keኃxeat keto alraqemna

VERSE 6
shekmie yekebedegn bchegna hognalehu
atleygn dngl adera ealshalehu/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeamanuiel-anat-yetewa-do-aklil', 'የአማኑኤል አናት የተዋሕዶ አክሊል', 'የአማኑኤል አናት የተዋሕዶ አክሊል', 'yeamanuiel anat yetewaሕdo aklil', 'Ethiopian Orthodox Tewahedo Mezmur - የአማኑኤል አናት የተዋሕዶ አክሊል', 'አትጥፊ ከመሀል አንድትሆኝን ኃይል
ምንም ቢበዛብሽ የእኛ ጉስቁልና
ከእኛ ጋር ከሆንሽ አለን ቅድስና''2/', 'atxfi kemehal andthognn ኃyl
mnm bibezabsh yeegna gusqulna
keegna gar kehonsh alen qdsna''2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-ga-dekmie-benefs-endalxefa', 'በሥጋ ደክሜ በነፍስ እንዳልጠፋ', 'በሥጋ ደክሜ በነፍስ እንዳልጠፋ', 'beሥga dekmie benefs endalxefa', 'Ethiopian Orthodox Tewahedo Mezmur - በሥጋ ደክሜ በነፍስ እንዳልጠፋ', 'አማጸንሻለሁ ድንግል የአኔ ተስፋ
የመንግሥቱ ወራሽ አንድሆን አድርጊኝ
መልካም ሥራ መሥራት አኔን አስተምሪኝ/2/', 'amatsenshalehu dngl yeanie tesfa
yemengሥtu werash andhon adrgign
melkam ሥra meሥrat anien astemrign/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('haxiyatie-beza', 'ሀጢያቴ በዛ', 'ሀጢያቴ በዛ', 'haxiyatie beza', 'Ethiopian Orthodox Tewahedo Mezmur - ሀጢያቴ በዛ', 'ኃጢአቴ በዛ አመቤቴ
ምሕረት ላኪልኝ ለሕይወቴ
የፈጣሪ እናት አዛኝት
በአንቺ ነው ማግኘት የጽድቅ ሕይወት''2/

VERSE 1
ከሲዖል አውጪኝ አዛኝት
የጻድቃን አናት አመቤት
ሰላማዊት ናት ሀገረ እግዚአብሔር
በአንቺ ነው መወጣት ከኃጢአት ቀንበር/2/

VERSE 2
የሚሰግዱልሸ ጻድቃን ሰማዕታት
የሚላኩልሽ ቅዱሳን መላዕክት
ከእነርሱ ጋር ነይ አመቤቴ
አንዲታረቀኝ ሰማያዊው አባቴ''2/

VERSE 3
አስታርቂኝ እኔን ከልጅሽ
አማልዳለው ከፊትሸ
ስምሽን ጠርቶ ያፈረ ማነው
የአዳም ተሰፋ ስራሽ ድንቅ ነው//2/

VERSE 4
የፍቅር እናት እመቤታችን
አስታርቂን እኛን ከጌታችን
ዘወትር ነይልን አናቴ ማርያም
ላንቺ ቅርብ ነው መድኃኔዓለም

VERSE 5
511. ነፍሴ ሆይ
ነፍሴ ሆይ /2/ አግዚአብሔርን በቅን አገልግይ /2/
ምስጋናውንም ሁሉ አትርሺ
አግዚአብሔርን በቅን አገልግይ

VERSE 6
በምሕረቱና በቸርነቱ የሚጠብቅሽ የሚከልልሽ
ምኞትሽን በበረከቱ የሚያጠግባት', 'ኃxiatie beza amebietie
mሕret lakilgn leሕywetie
yefexari enat azagnt
beanchi new maggnet yetsdq ሕywet''2/

VERSE 1
kesiዖl awcign azagnt
yetsadqan anat amebiet
selamawit nat hagere egziabሔr
beanchi new mewexat keኃxiat qenber/2/

VERSE 2
yemisegdulshe tsadqan semaዕtat
yemilakulsh qdusan melaዕkt
keenersu gar ney amebietie
anditareqegn semayawiw abatie''2/

VERSE 3
astarqign enien keljsh
amaldalew kefitshe
smshn xerto yafere manew
yeadam tesefa srash dnq new//2/

VERSE 4
yefqr enat emebietachn
astarqin egnan kegietachn
zewetr neyln anatie maryam
lanchi qrb new medኃnieዓlem

VERSE 5
511. nefsie hoy
nefsie hoy /2/ agziabሔrn beqn agelgy /2/
msganawnm hulu atrshi
agziabሔrn beqn agelgy

VERSE 6
bemሕretuna bechernetu yemixebqsh yemikellsh
mgnotshn bebereketu yemiyaxegbat', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nefsie-hoy-agziab-rn-beqn-agelgy', 'ነፍሴ ሆይ አግዚአብሔርን በቅን አገልግይ', 'ነፍሴ ሆይ አግዚአብሔርን በቅን አገልግይ', 'nefsie hoy agziabሔrn beqn agelgy', 'Ethiopian Orthodox Tewahedo Mezmur - ነፍሴ ሆይ አግዚአብሔርን በቅን አገልግይ', 'ኃጢአትሽን ሁሉ ይቅር የሚልሽ ደዌሽንም ሁሉ
የሚፈውስ
ሕይወትሽን ከጥፋት የሚያድናት
ነፍሴ ሆይ አግዚአብሔርን በቅን አገልግይ

VERSE 1
ምስጋናውንም ሁሉ አትርሺ
አግዚአብሔርን በቅን አገልግይ
ሕይወትሽን ከጥፋት የሚያድናት
ነፍሴ ሆይ አግዚአብሔርን በቅን አገልግይ

VERSE 2
512. ዓይኑ ዘርግብ
ዓይኑ ዘርግብ ዓይኑ /2/', 'ኃxiatshn hulu yqr yemilsh dewieshnm hulu
yemifews
ሕywetshn kexfat yemiyadnat
nefsie hoy agziabሔrn beqn agelgy

VERSE 1
msganawnm hulu atrshi
agziabሔrn beqn agelgy
ሕywetshn kexfat yemiyadnat
nefsie hoy agziabሔrn beqn agelgy

VERSE 2
512. ዓynu zergb
ዓynu zergb ዓynu /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('waryat-semtew-ziena-tn-iewn-2-alachew', 'ሐዋርያት ሰምተው ዜና ትንሣኤውን/2/ አላቸው', 'ሐዋርያት ሰምተው ዜና ትንሣኤውን/2/ አላቸው', 'ሐwaryat semtew ziena tnሣiewn/2/ alachew', 'Ethiopian Orthodox Tewahedo Mezmur - ሐዋርያት ሰምተው ዜና ትንሣኤውን/2/ አላቸው', 'በድንገት ሰላም ለአናንተ ይሁን/2/
51ፈ. እንደተቆጣኝ አልቀረም
እንደተቆጣኝ አልቀረም በርኅራጌው ማረኝ
ቁጣውን መልሶ ለነፍሴ ለልቤ መጽናኛ ሰጠኝ

VERSE 1
ምን ልክፈለው ለአምላክ ለወደደኝ
ልስገድለት ላመስግነው ኃይል ይስጠኝ/2/
ዳገት ቁልቁለት በዛብኝ ለጽድቅ ወደአንተ ስጓዝ
ጠላት ተጠምጥሞ ከአንገቴ ጎንጎኔን ነደፈኝ በመርዝ

VERSE 2
መፍትሔው- ጠፋብኝ ስቃይ በዛብኝ
አምላኬ ሆይ በጥበብህ አላቀኝ /2/
ብቻኛ ነኝ ጭንቅ የያዘኝ የጠበበኝ
የዓለም ነፋስ ማአበሉ ያንገላታኝ

VERSE 3
መላም የለኝ አኔ ተክፔ ቆሜአለሁ
ኃይሌ ጉልበቴ መድኃኒቴ በለኝ አለሁ/2/
ቆሜ ሳየው ፊት ጋኋላዬን ቀኝ ግራዬን
ረዳት የለኝ ምርኩዝ የለኝ ነኝ ብቻዬን

VERSE 4
የውስጥ የውጭውን ዘርዝሬ የምነግረው
አንደነፍሴ የምቆጥረው የማዋየው/2/
አይተህ ይህን መጨነቂን መገፋቴን
ላክልኝ ለኔ ድንግልን አመቤቴን

VERSE 5
ቅዱሳን ሰማእታት ጻድቃን መላዕክትን
ፍጥረትህ ነኝ እንዳልጠፋ አትጨከን /2/
የነበርክ ያለክ ለዘለዓለም የምትኖር
ከሥራዬ ባሳዝንህ ዘወትር

VERSE 6
ያለረዳት አጽናኝ ብቻዬን ያልተውከኝ
ተስፋ አልቆርጥም ላመሰግንህ ፍቀድልኝ(/2/
515... ስለ አኔ የሞተው
ቤዛ የሆነልኝ ስለአኔ የሞተው

VERSE 7
በፍቅሩ ማረከኝ ጠራኝ በይቅርታው
ሰዎች ሲጸየፉኝ ሊወግሩኝ ሲያስቡ
አርሱ ተቀበለኝ በሚራራ ልቡ
ቀረብኩኝ ወደ አርሱ ሸክሜን ተሸክሜ

VERSE 8
ጭነቴ ተራግፎ እንዲቀየር ስሜ
ከእግሩ ሥር ተደፋሁኝ አምጌ በደሌን
በዕንባዬ አጠብኩት ንጽሕ ቅዱስ
ኃጢአተኛ ሳለሁ አርሱ ግን ወደደኝ', 'bednget selam leanante yhun/2/
51fe. endeteqoxagn alqerem
endeteqoxagn alqerem berኅragiew maregn
quxawn melso lenefsie lelbie metsnagna sexegn

VERSE 1
mn lkfelew leamlak lewededegn
lsgedlet lamesgnew ኃyl ysxegn/2/
daget qulqulet bezabgn letsdq wedeante sguaz
xelat texemxmo keangetie gongonien nedefegn bemerz

VERSE 2
meftሔw- xefabgn sqay bezabgn
amlakie hoy bexbebh alaqegn /2/
bchagna negn cnq yeyazegn yexebebegn
yeዓlem nefas maabelu yangelatagn

VERSE 3
melam yelegn anie tekpie qomiealehu
ኃylie gulbetie medኃnitie belegn alehu/2/
qomie sayew fit gahualayien qegn grayien
redat yelegn mrkuz yelegn negn bchayien

VERSE 4
yewsx yewcwn zerzrie yemnegrew
andenefsie yemqoxrew yemawayew/2/
ayteh yhn meceneqin megefatien
laklgn lenie dngln amebietien

VERSE 5
qdusan semaetat tsadqan melaዕktn
fxreth negn endalxefa atceken /2/
yeneberk yalek lezeleዓlem yemtnor
keሥrayie basaznh zewetr

VERSE 6
yaleredat atsnagn bchayien yaltewkegn
tesfa alqorxm lamesegnh fqedlgn(/2/
515... sle anie yemotew
bieza yehonelgn sleanie yemotew

VERSE 7
befqru marekegn xeragn beyqrtaw
sewoch sitseyefugn liwegrugn siyasbu
arsu teqebelegn bemirara lbu
qerebkugn wede arsu shekmien teshekmie

VERSE 8
cnetie teragfo endiqeyer smie
keegru ሥr tedefahugn amgie bedelien
beዕnbayie axebkut ntsሕ qdus
ኃxiategna salehu arsu gn wededegn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('arsu-gn-tadegegn-anetsagn-befqr', 'አርሱ ግን ታደገኝ አነጻኝ በፍቅር', 'አርሱ ግን ታደገኝ አነጻኝ በፍቅር', 'arsu gn tadegegn anetsagn befqr', 'Ethiopian Orthodox Tewahedo Mezmur - አርሱ ግን ታደገኝ አነጻኝ በፍቅር', 'ሽቱውን ቀባሁት ሰጠሁት መባዬን
አርሱም ተቀበለኝ ለወጠው ታሪኬን
የኃጢአት ኑሮ ጨለማ ሕይወቴን
ብርፃን ሆነልኝ ቃሉን በመስማቴ', 'shtuwn qebahut sexehut mebayien
arsum teqebelegn lewexew tarikien
yeኃxiat nuro celema ሕywetien
brፃn honelgn qalun bemesmatie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeasraiel-amlak-temelktualna-2', 'የአስራኤል አምላክ ተመልክቷልና /2/', 'የአስራኤል አምላክ ተመልክቷልና /2/', 'yeasraiel amlak temelktualna /2/', 'Ethiopian Orthodox Tewahedo Mezmur - የአስራኤል አምላክ ተመልክቷልና /2/', 'ትውልድ ሁሉ ብጽዕት ይሉኛል
አርሱ ታላቅ ሥራ አድርጐልኛል
ስሙም ቅዱስ ነው ምሕረቱም
ለትውልድ ትውልድ ለዘላለም /2/', 'twld hulu btsዕt ylugnal
arsu talaq ሥra adrጐlgnal
smum qdus new mሕretum
letwld twld lezelalem /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('chernetu-bezto-gn-amebietachnn-sexen', 'ቸርነቱ በዝቶ ግን አመቤታችንን ሰጠን', 'ቸርነቱ በዝቶ ግን አመቤታችንን ሰጠን', 'chernetu bezto gn amebietachnn sexen', 'Ethiopian Orthodox Tewahedo Mezmur - ቸርነቱ በዝቶ ግን አመቤታችንን ሰጠን', 'ፀሐይ ክርስቶስ ወጣ ከቤተልሔም ሀገር
የእንጀራ ቤት ነችና የእኛ የፍቅር ባሕር
ተበልቶ አይጠግብም የማኅፀንሽ ፍሬ
ሕይወት ሆኖን በላነው የማኅፀንሽን ፍሬ

VERSE 1
ግርማዋ የሚያስፈራ የሙሴ ቤተመቅደስ
ተገናኙብሽ በሰላም ሰውና ሥሉስ ቅዱስ
የወርቅ መንበር ነሽና ደመና የከበበሽ
የሥላሴ ሙሽራ ዕፀፁብ/2/ ድንቅ ነሽ', 'ፀሐy krstos wexa kebietelሔm hager
yeenjera biet nechna yeegna yefqr baሕr
tebelto ayxegbm yemaኅፀnsh frie
ሕywet honon belanew yemaኅፀnshn frie

VERSE 1
grmawa yemiyasfera yemusie bietemeqdes
tegenagnubsh beselam sewna ሥlus qdus
yewerq menber neshna demena yekebebesh
yeሥlasie mushra ዕፀፁb/2/ dnq nesh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yetedebedebew-akalien-slaye', 'የተደበደበው አካሌን ስላየ', 'የተደበደበው አካሌን ስላየ', 'yetedebedebew akalien slaye', 'Ethiopian Orthodox Tewahedo Mezmur - የተደበደበው አካሌን ስላየ', 'ስለአጌ መዋረድ አምላክ ተሰቃየ
አወጣኝ ከድንጋይ ከቀያፋ በትር
ለአኔ ያደረገውን አረ እንዴት ልዘርዝር /4', 'sleagie mewared amlak teseqaye
awexagn kedngay keqeyafa betr
leanie yaderegewn are endiet lzerzr /4', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tkeshaw-sefi-new-egnan-teshekmual', 'ትከሻው ሰፊ ነው እኛን ተሸክሟል /ሇ', 'ትከሻው ሰፊ ነው እኛን ተሸክሟል /ሇ', 'tkeshaw sefi new egnan teshekmual /ሇ', 'Ethiopian Orthodox Tewahedo Mezmur - ትከሻው ሰፊ ነው እኛን ተሸክሟል /ሇ', 'ከኃጢአት ስወድቅ በሕይወት ዘመኔ
ቸርነቱ በዝቷል በረከቱ ለአኔ
መሐሪ መሆኑን ጌታ ሲገልጽላት
በልዩ ቸርነት ዘማዊቷን ጠራት /', 'keኃxiat swedq beሕywet zemenie
chernetu beztual bereketu leanie
meሐri mehonun gieta sigeltslat
belyu chernet zemawituan xerat /', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('newr-yalebachhu-tesebsebu-bearsu', 'ነውር ያለባችሁ ተሰብሰቡ በአርሱ', 'ነውር ያለባችሁ ተሰብሰቡ በአርሱ', 'newr yalebachhu tesebsebu bearsu', 'Ethiopian Orthodox Tewahedo Mezmur - ነውር ያለባችሁ ተሰብሰቡ በአርሱ', 'ከውርደት ያድናል መሐሪ ነው እርሱ
ለበሽተኞች ነው የመጣሁት ብሏል
ነፍስና ቁስልህን ደዌህን የድናል /ቄ', 'kewrdet yadnal meሐri new ersu
lebeshtegnoch new yemexahut blual
nefsna quslhn dewiehn yednal /qie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('teseqelk-wey', 'ተሰቀልክ ወይ', 'ተሰቀልክ ወይ', 'teseqelk wey', 'Ethiopian Orthodox Tewahedo Mezmur - ተሰቀልክ ወይ', 'ኦ ጌታ ሆይ ተሰቀልክ ወይ /2/
ምድር አለቀሰች እያለች ዋይ ዋይ
ኦ ጌታ ሆይ ተሰቀልክ ወይ
ኮረብቶች ደንግጠው መድረሻ ጠፋታቸው

VERSE 1
ከዋክብትም ፈርተው ጨለማ ዋጣቸው
አጅግ አይደንቅም ወይ ጌታ መሰቀሉ
የጌቶቹ ጌታ ችንካር ላይ መዋሉ
ሰማይና ምድርን በፈጠረበት

VERSE 2
ጨለማና ብርሃነን ባደረገበት
ችንካር ተከሉበት መትተው በብረት /2/
ድንግል አለቀሰች ዕንባዋ ፈሰሰ
ስደተኛ ልጅዋ መከራን ቀመሰ

VERSE 3
ሕማሙን ሳስበው አለቅሳለሁኝ
የስቃዩን ነገር አስባለሁኝ
ዕንባዬን ጠራርጐ ርህዛቤን ተካፍሎ
ሞተልኝ ጌታዬ ስለ ሞቴ ብሎ

VERSE 4
አኔ ልሙትልህ ሲለኝ ሰማሁት
አንዲህ የወደደኝ ምን አደረኩለት
521. ዛሬ ተይዣለሁ
ዛሬ ተይዣለሁ በፍቅሩ ስጦታ

VERSE 5
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሣኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/
ያልሰጠኸኝ ነገር በዚህ ምድር የለም

VERSE 6
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳስብ ምንድን ነኝ አላለሁ
ፍቅርህን ሳስተውል ሁል ጊዜ አለቅሳለሁ
ለብቻዬ ሆፔቕጌ አምላኬን ሳስበው

VERSE 7
ከኅሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል', 'o gieta hoy teseqelk wey /2/
mdr aleqesech eyalech way way
o gieta hoy teseqelk wey
korebtoch dengxew medresha xefatachew

VERSE 1
kewakbtm fertew celema waxachew
ajg aydenqm wey gieta meseqelu
yegietochu gieta chnkar lay mewalu
semayna mdrn befexerebet

VERSE 2
celemana brሃnen baderegebet
chnkar tekelubet mettew bebret /2/
dngl aleqesech ዕnbawa fesese
sdetegna ljwa mekeran qemese

VERSE 3
ሕmamun sasbew aleqsalehugn
yesqayun neger asbalehugn
ዕnbayien xerarጐ rhzabien tekaflo
motelgn gietayie sle motie blo

VERSE 4
anie lmutlh silegn semahut
andih yewededegn mn aderekulet
521. zarie teyzhalehu
zarie teyzhalehu befqru sxota

VERSE 5
wletah markognal yeሠrawit gieta
keamed yaneሣኸgn ketbiya texyie
wletah kebedegn marekegn gietayie /2/
yalsexeኸgn neger bezih mdr yelem

VERSE 6
fqrh wesen yelew dnq new zelalem
enienetien sasb mndn negn alalehu
fqrhn sastewl hul gizie aleqsalehu
/2/

VERSE 7
/2/
lebchayie hopieቕgie amlakien sasbew
keኅlina belay wletah bzu new
yetexalewn sew mansat yawqbetal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mskinun-siyatsnana-kehulu-ybelxal-2', 'ምስኪኑን ሲያጽናና ከሁሉ ይበልጣል/2/', 'ምስኪኑን ሲያጽናና ከሁሉ ይበልጣል/2/', 'mskinun siyatsnana kehulu ybelxal/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ምስኪኑን ሲያጽናና ከሁሉ ይበልጣል/2/', 'ሰው ነህ ተብያለሁ አንተ ሰው ስላልከኝ
ማን ያስታውሰኛል አንተ ባታከብረኝ
አትጣለኝ አንተ ሁሉም ያከብሩኛል
ኃጢአቴን ባትቆጥር ለእኔ ይበቃኛል

VERSE 1
522. ስምህ በሁሉ ተመሰገነ
ስምህ በሁሎ ተመሰገነ', 'sew neh tebyalehu ante sew slalkegn
man yastawsegnal ante batakebregn
atxalegn ante hulum yakebrugnal
ኃxiatien batqoxr leenie ybeqagnal

VERSE 1
522. smh behulu temesegene
smh behulo temesegene', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sbrathn-yemixegnew-man-new-arsu', 'ስብራትህን የሚጠግነው ማን ነው አርሱ', 'ስብራትህን የሚጠግነው ማን ነው አርሱ', 'sbrathn yemixegnew man new arsu', 'Ethiopian Orthodox Tewahedo Mezmur - ስብራትህን የሚጠግነው ማን ነው አርሱ', 'ትንሽነትህን የማይጸየፍ ማን ነው አርሱ
አድሎን የማያውቅ ለሰዎች ፊት " "
ለሁሉ የሚሰጥ የጽድቅ ሕይወት " "', 'tnshnethn yemaytseyef man new arsu
adlon yemayawq lesewoch fit " "
lehulu yemisex yetsdq ሕywet " "', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('asasbiln-endimren-med-nie-lem', 'አሳስቢልን እንዲምረን መድኃኔዓለም', 'አሳስቢልን እንዲምረን መድኃኔዓለም', 'asasbiln endimren medኃnieዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - አሳስቢልን እንዲምረን መድኃኔዓለም', 'በንጽሕናሽ በመመረጥሽ
ድንግል በአውነት አጽብ ድንቅ ነሽ
አሳስቢልን አንዲምረን መድኃኔዓለም
ፍጥረታት አንቺን ይማጸኑሻል

VERSE 1
ከሲዖል ዓለም አውጪን ይሉሻል
አሳስቢልን እንዲምረን መድኃኔዓለም
አስራትሽን ኢትዮጵያን
ጠቢቅልን ድንግል ሕዝቧን

VERSE 2
አሳስቢልን እንዲምረን መድኃኔዓለም
525... በዘር አንድ የሆነው
በዘር አንድ የሆነው ሌዋዊው ትቶኛል
ባዕዱ ሳምራዊ ከሞት አድኖኛል

VERSE 3
በቁስሌ ላይ ዘይት የሚያስ ፍቅረኛ
የሰላም ሰው ስጠኝ ሁነኛ ዓደኛ /2/', 'bentsሕnash bememerexsh
dngl beawnet atsb dnq nesh
asasbiln andimren medኃnieዓlem
fxretat anchin ymatsenushal

VERSE 1
kesiዖl ዓlem awcin ylushal
asasbiln endimren medኃnieዓlem
asratshn ityophyan
xebiqln dngl ሕzbuan

VERSE 2
asasbiln endimren medኃnieዓlem
525... bezer and yehonew
bezer and yehonew liewawiw ttognal
baዕdu samrawi kemot adnognal

VERSE 3
bequslie lay zeyt yemiyas fqregna
yeselam sew sxegn hunegna ዓdegna /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kemayxefaw-twld-sleteweledn', 'ከማይጠፋው ትውልድ ስለተወለድን', 'ከማይጠፋው ትውልድ ስለተወለድን', 'kemayxefaw twld sleteweledn', 'Ethiopian Orthodox Tewahedo Mezmur - ከማይጠፋው ትውልድ ስለተወለድን', 'አይቀርም አመኑ በምድር ዘራችን
ከአግዚአብሔር ተወልደን ልጆች ተብለናል
ባሮች አይደለንም ነጻነት ወጥተናል /2/
አንተን የሚመስል ቀናና የዋኅ ሰው

VERSE 1
ወንጌልኽን ነገረኝ ሕይወቴን ለወጠው
ዓለም የሰጠችን ሞት ነበረ ድሮ
ክርስቲያን አዳነኝ ወንጌልን አስተምሮ /2/
በሥጋና በደም የማልዛመደው

VERSE 2
በክርስቶስ ጥምቀት ዘሩ ከእኔ ጋር ነው
ጓደኛዬ አርሱ ነው ሕይወት የሚሰጠኝ
በቃሉ በፍቅሩ ተመስጫለሁኝ /2/
ልቡ ቅን የሆነ ጓደኛ መርጩ

VERSE 3
ሰላሜ ልዩ ነው ዛሬ ተለውጩ
ክርስቲያን በሙሉ በዚህ ያስታውቃል
ፍቅሩ ይለውጣል ሥራው ይማርካል/2/
ከዓለም ጉድጓድ ውስጥ መስዬ ወድቄ

VERSE 4
ይኸው ሰላም ሆንኩኝ ከአምላከ ታርቄ
አውነተኛ ፍቅር አስተማረኝና
አዲስ አደረገኝ እኔን ክርስትና /2/
526. ተስፋ አለኝ

VERSE 5
ተስፋ አለኝ በአምላኬ
ተስፋ አለኝ በእግዚአብሔር
ምናምንቴ ሆፔ በዚህች ምድር ብኖር
ተስፋ አለኝ በእግዚአብሔር

VERSE 6
ጥበብ የተሞሉ ታላላቅ ኃይለኞች
ሥልጣን የጨበጡ የምድር ብርቱዎች
ስላልተመረጡ በሀብታቸው ብዛት
ተስፋ አለኝ ለጽድቁ ለሰማያዊ ቤት/2/

VERSE 7
የአምላክ ዓይን ልዩ ነው አያዳላም ለሰው
ፍቅሩ ለፍጥረቱ ምንጊዜም አኩል ነው', 'ayqerm amenu bemdr zerachn
keagziabሔr tewelden ljoch teblenal
baroch aydelenm netsanet wextenal /2/
anten yemimesl qenana yewaኅ sew

VERSE 1
wengielኽn negeregn ሕywetien lewexew
ዓlem yesexechn mot nebere dro
krstiyan adanegn wengieln astemro /2/
beሥgana bedem yemalzamedew

VERSE 2
bekrstos xmqet zeru keenie gar new
guadegnayie arsu new ሕywet yemisexegn
beqalu befqru temescalehugn /2/
lbu qn yehone guadegna mercu

VERSE 3
selamie lyu new zarie telewcu
krstiyan bemulu bezih yastawqal
fqru ylewxal ሥraw ymarkal/2/
keዓlem gudguad wsx mesyie wedqie

VERSE 4
yኸw selam honkugn keamlake tarqie
awnetegna fqr astemaregnna
adis aderegegn enien krstna /2/
526. tesfa alegn

VERSE 5
tesfa alegn beamlakie
tesfa alegn beegziabሔr
mnamntie hopie bezihch mdr bnor
tesfa alegn beegziabሔr

VERSE 6
xbeb yetemolu talalaq ኃylegnoch
ሥlxan yecebexu yemdr brtuwoch
slaltemerexu behabtachew bzat
tesfa alegn letsdqu lesemayawi biet/2/

VERSE 7
yeamlak ዓyn lyu new ayadalam lesew
fqru lefxretu mngiziem akul new', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tsadqna-xe-kfu-sew-new-sayl-2', 'ጻድቅና ኃጥእ ክፉ ሰው ነው ሳይል/2/', 'ጻድቅና ኃጥእ ክፉ ሰው ነው ሳይል/2/', 'tsadqna ኃxe kfu sew new sayl/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ጻድቅና ኃጥእ ክፉ ሰው ነው ሳይል/2/', 'በኃጢአት ብወድቅም ሕይወቴ ቢጉጐድፍ
በንስሓ ዳንኩኝ አኔ ሳልቀሰፍ
አምላክ ቸርነቱ ምሕረቱ አድኖኝ
አዲሲቷን ምድር እናፍቃለሁኝ /2/', 'beኃxiat bwedqm ሕywetie biguጐdf
bensሓ dankugn anie salqesef
amlak chernetu mሕretu adnogn
adisituan mdr enafqalehugn /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('alferdm-enie', 'አልፈርድም እኔ', 'አልፈርድም እኔ', 'alferdm enie', 'Ethiopian Orthodox Tewahedo Mezmur - አልፈርድም እኔ', 'አልፈርድም እኔ በማንም በደል በማንም ኃጢአት
በፈረድኩበት አንዳልመዘን ጌታ ሲመጣ በኃይል
በሥልጣን
በቸርነቱ አምላክ ባይተወው በደሌን ሁሉ

VERSE 1
ውስጤ ቢፈተሽ በተሰጠኝ ሕግ በቅዱስ ቃሉ
በምን ምግባሬ በሰው ፈርዳለሁ ዓይኔን አቅንቼ
በደል በዝቶ ለራሴ ሳላውቅ በኃጢአት ሞቼ', 'alferdm enie bemanm bedel bemanm ኃxiat
beferedkubet andalmezen gieta simexa beኃyl
beሥlxan
bechernetu amlak baytewew bedelien hulu

VERSE 1
wsxie bifetesh betesexegn ሕg beqdus qalu
bemn mgbarie besew ferdalehu ዓynien aqnchie
bedel bezto lerasie salawq beኃxiat mochie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('krstiyan-hono-kewendmu-gar-eyetexala', 'ክርስቲያን ሆኖ ከወንድሙ ጋር እየተጣላ', 'ክርስቲያን ሆኖ ከወንድሙ ጋር እየተጣላ', 'krstiyan hono kewendmu gar eyetexala', 'Ethiopian Orthodox Tewahedo Mezmur - ክርስቲያን ሆኖ ከወንድሙ ጋር እየተጣላ', 'ዓለም ዳኘችን በጸብ ፍርድ ቤት ታረቁ ብላ
ክርስቲያን ሆነን በአሕዛብ መሃል እየተካሰስን
አምላክ አዘነ የመስቀሉን ዓላማ ትተን', 'ዓlem dagnechn betseb frd biet tarequ bla
krstiyan honen beaሕzab meሃl eyetekasesn
amlak azene yemesqelun ዓlama tten', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('aytenal-enji-lexelatochu-m-ret-silemn', 'አይተናል እንጂ ለጠላቶቹ ምሕረት ሲለምን', 'አይተናል እንጂ ለጠላቶቹ ምሕረት ሲለምን', 'aytenal enji lexelatochu mሕret silemn', 'Ethiopian Orthodox Tewahedo Mezmur - አይተናል እንጂ ለጠላቶቹ ምሕረት ሲለምን', 'ለጽድቅ ሥራ ለአውነት ብለን መጥተናል እንጂ
ማን ነው የሾመን በወንድሞች ላይ አርጐ ፈራጅ
አይተናል እንጂ ለጠላቶቹ ምሕረት ሲለምን
በጽድቅ ሥራ ለእውነት ብለን መጥተናል አንጂ

VERSE 1
ማነው የሾመን በወንድሞች ላይ አድርጐ ፈራጅ', 'letsdq ሥra leawnet blen mextenal enji
man new yeshomen bewendmoch lay arጐ feraj
aytenal enji lexelatochu mሕret silemn
betsdq ሥra leewnet blen mextenal anji

VERSE 1
manew yeshomen bewendmoch lay adrጐ feraj', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('msgana-jemere', '.. ምስጋና ጀመረ', '.. ምስጋና ጀመረ', '.. msgana jemere', 'Ethiopian Orthodox Tewahedo Mezmur - .. ምስጋና ጀመረ', 'ምስጋና ጀመረ ብሎ ዛሌ ሉያ
ማኅሌታይ ያሬድ ዘኢትዮጵያ
ምስጋና ጀመረ ብሎ ዛሌ ሉያ', 'msgana jemere blo zalie luya
maኅlietay yaried zeityophya
msgana jemere blo zalie luya', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bluyn-ke-dis-disn-kebluy', 'ብሉይን ከሐዲስ ሐዲስን ከብሉይ', 'ብሉይን ከሐዲስ ሐዲስን ከብሉይ', 'bluyn keሐdis ሐdisn kebluy', 'Ethiopian Orthodox Tewahedo Mezmur - ብሉይን ከሐዲስ ሐዲስን ከብሉይ', 'አስተባብሮ ቃኘው ያሬድ ማኅሌታይ
ምሥጢር ተገልጾለት ከምድር እስከ ሰማይ
ብሉይን ከሐዲስ ሐዲስን ከብሉይ
አስተባብሮ ይዞ ያሬድ ማኅሌታይ

VERSE 1
ምሥጢር ተገልጦለት ከምድር እስከ ሰማይ
ብሉይን ከሐዲስ ሐዲስን ከብሉይ
አስተባብሮ ይዞ ያሬድ ማኅሌታይ
ምሥጢር ተገልጦለት ከምድር እስከ ሰማይ', 'astebabro qagnew yaried maኅlietay
mሥxir tegeltsolet kemdr eske semay
bluyn keሐdis ሐdisn kebluy
astebabro yzo yaried maኅlietay

VERSE 1
mሥxir tegelxolet kemdr eske semay
bluyn keሐdis ሐdisn kebluy
astebabro yzo yaried maኅlietay
mሥxir tegelxolet kemdr eske semay', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemenfes-qdus-yl-m-xir-ayasmama', 'በመንፈስ ቅዱስ ኃይል ምሥጢር አያስማማ', 'በመንፈስ ቅዱስ ኃይል ምሥጢር አያስማማ', 'bemenfes qdus ኃyl mሥxir ayasmama', 'Ethiopian Orthodox Tewahedo Mezmur - በመንፈስ ቅዱስ ኃይል ምሥጢር አያስማማ', 'ምስጋና ጀመረ በጽዮን ከተማ
ለቅድስት ሥላሴ በሦስት ዓይነት ዜማ
በመንፈስ ቅዱስ ኃይል ምሥጢር አያስማማ
ምስጋና ጀመረ በእነዚህ ከተማ

VERSE 1
ለቅድስት ሥላሴ በሦስት ዓይነት ዜማ', 'msgana jemere betsyon ketema
leqdst ሥlasie beሦst ዓynet ziema
bemenfes qdus ኃyl mሥxir ayasmama
msgana jemere beenezih ketema

VERSE 1
leqdst ሥlasie beሦst ዓynet ziema', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yo-ns-de-yordanose', 'ዮሐንስ ሔደ ዮርዳኖሰ', 'ዮሐንስ ሔደ ዮርዳኖሰ', 'yoሐns ሔde yordanose', 'Ethiopian Orthodox Tewahedo Mezmur - ዮሐንስ ሔደ ዮርዳኖሰ', 'ዮሐንስ /2/ ሔደ ዮርዳኖስ
የበደለውን ሕዝብ ጠረቶ ለንስሓ
ያስተምር ጀመረ ገብቶ ከበረሐ
አባጣ ጎባጣ ጠማማ ኮረብታ

VERSE 1
ይስተካከል አለ ሁሉም በየቦታ', 'yoሐns /2/ ሔde yordanos
yebedelewn ሕzb xereto lensሓ
yastemr jemere gebto kebereሐ
abaxa gobaxa xemama korebta

VERSE 1
ystekakel ale hulum beyebota', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ba-r-teceneqech-sheshechm-befr-t', 'ባሕር ተጨነቀች ሸሸችም በፍርፃት', 'ባሕር ተጨነቀች ሸሸችም በፍርፃት', 'baሕr teceneqech sheshechm befrፃt', 'Ethiopian Orthodox Tewahedo Mezmur - ባሕር ተጨነቀች ሸሸችም በፍርፃት', 'አሳተ መለኮት እንዳያቃጥላት
መንፈስቅዱስ መጣ ሊሆነው ምስክር
ከአብ መወለዱን ልጅነቱን ሊያከብር', 'asate melekot endayaqaxlat
menfesqdus mexa lihonew mskr
keab meweledun ljnetun liyakebr', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keherods-wede-phielaxos', 'ከሄሮድስ ወደ ጴላጦስ', 'ከሄሮድስ ወደ ጴላጦስ', 'keherods wede phielaxos', 'Ethiopian Orthodox Tewahedo Mezmur - ከሄሮድስ ወደ ጴላጦስ', 'ከሄሮድስ ወደ ሏላጦስ /2/
ተንገላታህ ላብህ እስኪፈስ
አመላለሱህ አስረው ገረፋህ
ፊትህን ሸፍነው በብትር መቱህ', 'keherods wede lualaxos /2/
tengelatah labh eskifes
amelalesuh asrew gerefah
fithn shefnew bebtr metuh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kesemay-qal-mexa-andezih-yemil', 'ከሰማይ ቃል መጣ አንደዚህ የሚል', 'ከሰማይ ቃል መጣ አንደዚህ የሚል', 'kesemay qal mexa andezih yemil', 'Ethiopian Orthodox Tewahedo Mezmur - ከሰማይ ቃል መጣ አንደዚህ የሚል', 'የምወደው ልጄ እርሱን ስሙት ሲል
ከሰማይ ቃል መጣ አንደዚህ የሚል
የምወደው ልጄ እርሱን ስሙት ሲል
ኤልያስም ሄደ በሰረገላው

VERSE 1
ሙሴም ከመቃብር ወደ መኖሪያው
ስለአስደነቃቸው ግሩም ታመራቱ
ይህን ምሥጢር አይተው ተሰነባበቱ
]07ፋ4መልእክተ ወንጌል

VERSE 2
መልእክተ ወንጌል በደሙ የጻፈ
ስቃዩን ታግሶ ችሎ ያሣለፈ
በርሃብ በግርፋት በግዞት አብዝቶ
በገድል በትሩፋት ጠላትን ድል ነሥቶ

VERSE 3
ንዋየ ኅሩይ ነው ለዓለም ያበራ
ሐዋርያው ጳውሎስ ለጽድቅ የተጠራ /2/
አንቅልፋን እያጣ ሌት ተቀን ሳይታክት
የኋላውን ትቶ ተጓዘ ወደፊት

VERSE 4
በድካም ተጠምዶ በገድል እያረሠ
ከደማስቆ እስከ ሮም ቃሉን አዳረሠ
አውነትን መናገር ከቶ ያላፈረ
ሕዝብን ከአሕዛብ በአንድ ያስተባበረ

VERSE 5
አምላኩ እንዳይናቅ ከልቡ የተጋ
ጸንቶ የተጓዘ ለምትበልጠው ጸጋ
ከሰማይ ቃል መጣ አንደዚህ የሚል
የምወደው ልጄ እርሱን ስሙት ሲል', 'yemwedew ljie ersun smut sil
kesemay qal mexa andezih yemil
yemwedew ljie ersun smut sil
ielyasm hede beseregelaw

VERSE 1
musiem kemeqabr wede menoriyaw
sleasdeneqachew grum tameratu
yhn mሥxir aytew tesenebabetu
]07fa4melekte wengiel

VERSE 2
melekte wengiel bedemu yetsafe
sqayun tagso chlo yaሣlefe
berሃb begrfat begzot abzto
begedl betrufat xelatn dl neሥto

VERSE 3
nwaye ኅruy new leዓlem yabera
ሐwaryaw phawlos letsdq yetexera /2/
anqlfan eyaxa liet teqen saytakt
yehualawn tto teguaze wedefit

VERSE 4
bedkam texemdo begedl eyareሠ
kedemasqo eske rom qalun adareሠ
awnetn menager keto yalafere
ሕzbn keaሕzab beand yastebabere

VERSE 5
amlaku endaynaq kelbu yetega
tsento yeteguaze lemtbelxew tsega
kesemay qal mexa andezih yemil
yemwedew ljie ersun smut sil', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeadam-lj-ketbiya-2-wede-neberebet', 'የአዳም ልጅ ከትቢያ/2/ ወደ ነበረበት', 'የአዳም ልጅ ከትቢያ/2/ ወደ ነበረበት', 'yeadam lj ketbiya/2/ wede neberebet', 'Ethiopian Orthodox Tewahedo Mezmur - የአዳም ልጅ ከትቢያ/2/ ወደ ነበረበት', 'መልሶም ከአፈር እንዲሆን ከመሬት
በተናገርከው ቃል ባዘዝከው መሠረት
አንደ ጐርፍ መጥተህ ትወስዳለህ ድንገት', 'melsom keafer endihon kemeriet
betenagerkew qal bazezkew meሠret
ande ጐrf mexteh twesdaleh dnget', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dmieyachn-seba-met-bibeza-semanya', 'ፅድሜያችን ሰባ ዓመት ቢበዛ ሰማንያ', 'ፅድሜያችን ሰባ ዓመት ቢበዛ ሰማንያ', 'ፅdmieyachn seba ዓmet bibeza semanya', 'Ethiopian Orthodox Tewahedo Mezmur - ፅድሜያችን ሰባ ዓመት ቢበዛ ሰማንያ', 'በመከራ ያልቃል አርሱም በዓለም ዙሪያ
አኛም አእናልፋለን በጭራሽ ሳንሠራ
በራስ ተሸክመን የኃጢአት አዝመራ', 'bemekera yalqal arsum beዓlem zuriya
agnam aenalfalen becrash sanሠra
beras teshekmen yeኃxiat azmera', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keadam-lj-mekakel-keenedawit-zer', 'ከአዳም ልጅ መካከል ከእነዳዊት ዘር', 'ከአዳም ልጅ መካከል ከእነዳዊት ዘር', 'keadam lj mekakel keenedawit zer', 'Ethiopian Orthodox Tewahedo Mezmur - ከአዳም ልጅ መካከል ከእነዳዊት ዘር', 'መርጦ ተወለደ ከድንግል በክብር
ዘጠና ዘጠኙን መላእክትን ትቶ
አዳምን ሊያድነው ስላየው ተራቁቶ
ሐር አየፈተለች ቤተመቅደስ ሆኖ

VERSE 1
ገብርኤል ነገራት ሰማያዊ ዜና
ትፀንሲ ብሎ በድንቅ ሰላምታ
ከማኅፀኗ አደረ ቃሉ ሳይፈታ
ከልዑል ዙፋኑ ከመንበሩ ወርዶ

VERSE 2
አዳነን ከፍዳ ከማርያም ተወልዶ
የነገሥታት ንጉሥ ቤዛ ኩሉ ዓለም
ሥጋዋን ለበሰ መድኃኔዓለም
ንጉሥ መወለዱን ሰብአሰገል ሰምተው

VERSE 3
አምኃ አቀረቡ ከሩቅ ምሥራቅ መጥተው
የዳዊት መዝሙሩ ተፈጸመለት
የሳባ ነገሥታት ወርቅ አመጡለት
534. ነፍሴ ሆይ

VERSE 4
ነፍሴ ሆይ /2/ እግዚአብሔርን በቅን አገልግይ/2/
የተቀበለው በቀራንዮ ያን ሁሉ መከራ በመስቀሉ
ላይ
ለአንቺ ሲል ነውና ነፍሴ ሆይ

VERSE 5
ተዘጋጅተሽ ኑሪ ሁል ጊዜ በነገ በዛሬ
አንዳትታለይ /2/ ነፍሴ ሆይ
በንስሓ ጥምቀት ታጠቢና ክቡር ደሙን ጠጪ
ሥጋውንም ብይ /2/ ነፍሴ ሆይ

VERSE 6
ዘለዓለም በደስታ አንድትኖሪ ከዘለዓለም
ቤትሽ', 'merxo tewelede kedngl bekbr
zexena zexegnun melaektn tto
adamn liyadnew slayew teraquto
ሐr ayefetelech bietemeqdes hono

VERSE 1
gebriel negerat semayawi ziena
tፀnsi blo bednq selamta
kemaኅፀnua adere qalu sayfeta
kelዑl zufanu kemenberu werdo

VERSE 2
adanen kefda kemaryam teweldo
yenegeሥtat nguሥ bieza kulu ዓlem
ሥgawan lebese medኃnieዓlem
nguሥ meweledun sebasegel semtew

VERSE 3
amኃ aqerebu keruq mሥraq mextew
yedawit mezmuru tefetsemelet
yesaba negeሥtat werq amexulet
534. nefsie hoy

VERSE 4
nefsie hoy /2/ egziabሔrn beqn agelgy/2/
yeteqebelew beqeranyo yan hulu mekera bemesqelu
lay
leanchi sil newna nefsie hoy

VERSE 5
tezegajtesh nuri hul gizie benege bezarie
andattaley /2/ nefsie hoy
bensሓ xmqet taxebina kbur demun xeci
ሥgawnm by /2/ nefsie hoy

VERSE 6
zeleዓlem bedesta andtnori kezeleዓlem
bietsh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wede-afernet-fexneh-satmeles', 'ወደ አፈርነት ፈጥነህ ሳትመለስ', 'ወደ አፈርነት ፈጥነህ ሳትመለስ', 'wede afernet fexneh satmeles', 'Ethiopian Orthodox Tewahedo Mezmur - ወደ አፈርነት ፈጥነህ ሳትመለስ', 'የሰው ልጅ ተዘጋጅ በንስሓ ታጥበህ
ነውና ዕድሜያችን አንደ አደይ አበባ
ነገ ሳይሆን ዛሬ ንስሓ እንግባ
ሰው በአፉ ቢያምን በልቦናው ክዶ

VERSE 1
ምንም ጥቅም የለው ያለ ተዋሕዶ
ፈራሹ ሥጋዬ ለማትፈርሰው ነፍሴ
አባክህ ተገዛ ለቅድስት ሥላሴ
ምንም ብበድልህ ቢበዛ ኃጢአቴ

VERSE 2
አቤቱ አትቅሰፈኝ በወጣትነቴ
ለፍርድ ስትመጣ በአለተ ምጽዓት
ምን አመልስ ይሆን አምላክ ከአንተ ፊት
537. ሞትን ድል አድርጐ

VERSE 3
ሞትን ድል አድርጐ ተነሣ ክርስቶስ ተነሣ
አሰይ/2/
አኛንም ከሞት ሊያስነሣ
ክርስቶስ ከሙታን ተነሣ

VERSE 4
ሰላም ሰላም ለሰው ልጆች በምድር ሆነ ሰላም
ነፍሳትን ነጻ አወጣ ከጨለማ ጓሮ አሰይ /2/
የሲኦልን በር ሰብሮ
ኃይሉንም በኃይሉ ሽሮ

VERSE 5
ሞት በትንሣኤ ተሻረ የሰው ልጅ ከበረ
አሰይ/2/
ጠላት ዲያብሎስ አፈረ
እጅና አግሩንም ታሰረ

VERSE 6
አንዳይኖር ለዘለዓለም ሞት በአዳም ላይ ነግሶ
አሰይ/2/
ክርስቶስ ተነሣ ሞትን ደምስሶ
ግርማ መለኩቱን ለብሶ

VERSE 7
538... አንጻኝ
አንጻኝ አጠበኝ ከኃጢአቴ /2/
አንተ ነህና መድኃኒቴ
አንተ ነህና ረዳቴ አንጻኝ እጠበኝ ከኃጢአቴ /2/

VERSE 8
ላንተ ይገዛ ሰውነቴ
ይቅር ከእንግዲህ መዋተቴ
ፊትህን መልስ ራራልኝ
ል', 'yesew lj tezegaj bensሓ taxbeh
newna ዕdmieyachn ande adey abeba
nege sayhon zarie nsሓ engba
sew beafu biyamn belbonaw kdo

VERSE 1
mnm xqm yelew yale tewaሕdo
ferashu ሥgayie lematfersew nefsie
abakh tegeza leqdst ሥlasie
mnm bbedlh bibeza ኃxiatie

VERSE 2
abietu atqsefegn bewexatnetie
lefrd stmexa bealete mtsዓt
mn amels yhon amlak keante fit
537. motn dl adrጐ

VERSE 3
motn dl adrጐ teneሣ krstos teneሣ
asey/2/
agnanm kemot liyasneሣ
krstos kemutan teneሣ

VERSE 4
selam selam lesew ljoch bemdr hone selam
nefsatn netsa awexa kecelema guaro asey /2/
yesioln ber sebro
ኃylunm beኃylu shro

VERSE 5
mot betnሣie teshare yesew lj kebere
asey/2/
xelat diyablos afere
ejna agrunm tasere

VERSE 6
andaynor lezeleዓlem mot beadam lay negso
asey/2/
krstos teneሣ motn demsso
grma melekutun lebso

VERSE 7
538... antsagn
antsagn axebegn keኃxiatie /2/
ante nehna medኃnitie
ante nehna redatie antsagn exebegn keኃxiatie /2/

VERSE 8
lante ygeza sewnetie
yqr keengdih mewatetie
fithn mels raralgn
l', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('befqru-yayegnal', 'በፍቅሩ ያየኛል', 'በፍቅሩ ያየኛል', 'befqru yayegnal', 'Ethiopian Orthodox Tewahedo Mezmur - በፍቅሩ ያየኛል', 'ማን አንደርሱ አለ ነፍሴ ሆይ
ውለታው የበዛ
መሐሪ ይቅር ባይ ነው ነፍሴ ሆይ የሕይወቴ ቤዛ/2/
በፍቅሩ ያየኛል', 'man andersu ale nefsie hoy
wletaw yebeza
meሐri yqr bay new nefsie hoy yeሕywetie bieza/2/
befqru yayegnal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeielyas-mena', 'የኤልያስ መና " "', 'የኤልያስ መና " "', 'yeielyas mena " "', 'Ethiopian Orthodox Tewahedo Mezmur - የኤልያስ መና " "', 'አናቴ ልበልሽ " "
አዛኝት ነሽና " "
አንቺንም ተማጽኖ " "
ያጣ የለምና " "

VERSE 1
አንቺው አርቂልኝ "ዝቲ "
ያን ሰይጣን መሰሪ " "
ከእኔ ሳትለይ " "
ከእኛው ጋር ኑሪ " "

VERSE 2
541. ስምሽ ጣዕም አለው
ስምሽ ጣዕም አለው ኪዳነምሕረት /2/
በላኤሰብእም ይህን አሰበ
ከጥርኝ ውኃ አንጠባጠበ

VERSE 3
ልቤ በልጅሽ ላይ ሲያምጽ በጭካኔ
ይህን ዓለም አይቶ ሲንከራተት ዓይኔ
በልቤ ጽላት ተሣይብኝ
ጣዕምሽ ከዓለም እንዲለየኝ/2/

VERSE 4
ጠላት ሲፈትነኝ ሊጥለኝ በሥጋ
በክፋ ምኞቴ ነፍሴ ስትወጋ
አንደ አባቶቼ ልጥራሽ እኔም
ማን አለኝና በዚህ ዓለም/2/

VERSE 5
በስምሽ ተማጽነው ነፍሳት ተምረዋል
ከቅዱሳን ዓለም ምሕረት አግኝተዋል
ወደብ ነሽ አንቺ ማረፊያ ቦታ
አየወደድኩሽ ልኑር በደስታ

VERSE 6
542. አመቤቴ ስልሸ
አመቤቴ ስልሸ ፊትሽ ተንበርክኬ/2/
አማልጆኝ ከልጅሽ ከቸሩ አምላኬ
ሳለቅስ ስተክዝ ስወድቅ ከደጅሽ /2/

VERSE 7
አይዞህ አለሁ በይኝ ድንግል ስለምንሸ
ሲጨንቀኝ ሲጠበኝ ሲርድ ሰውነቴ
ባዶነት ሲሰማኝ ጠፍቶኝ እኔነቴ
ድረሽልኝ ድንግል መጽናኛ እናቴ

VERSE 8
የዓለም ስደተኛ ሆኝ ቀርቻለሁ
የዓለም መጻተኛ ሆኝ ቀርቻለሁ
ድንግል በስደትሽ አማልጅኝ እላለሁ', 'anatie lbelsh " "
azagnt neshna " "
anchinm tematsno " "
yaxa yelemna " "

VERSE 1
anchiw arqilgn "zti "
yan seyxan meseri " "
keenie satley " "
keegnaw gar nuri " "

VERSE 2
541. smsh xaዕm alew
smsh xaዕm alew kidanemሕret /2/
belaiesebem yhn asebe
kexrgn wኃ anxebaxebe

VERSE 3
lbie beljsh lay siyamts beckanie
yhn ዓlem ayto sinkeratet ዓynie
belbie tslat teሣybgn
xaዕmsh keዓlem endileyegn/2/

VERSE 4
xelat sifetnegn lixlegn beሥga
bekfa mgnotie nefsie stwega
ande abatochie lxrash eniem
man alegnna bezih ዓlem/2/

VERSE 5
besmsh tematsnew nefsat temrewal
keqdusan ዓlem mሕret aggntewal
wedeb nesh anchi marefiya bota
ayewededkush lnur bedesta

VERSE 6
542. amebietie slshe
amebietie slshe fitsh tenberkkie/2/
amaljogn keljsh kecheru amlakie
saleqs stekz swedq kedejsh /2/

VERSE 7
ayzoh alehu beygn dngl slemnshe
sicenqegn sixebegn sird sewnetie
badonet sisemagn xeftogn enienetie
dreshlgn dngl metsnagna enatie

VERSE 8
yeዓlem sdetegna hogn qerchalehu
yeዓlem metsategna hogn qerchalehu
dngl besdetsh amaljgn elalehu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemu-zergto-xlawn-beenie-lay', 'ዓለሙ ዘርግቶ ጥላውን በእኔ ላይ', 'ዓለሙ ዘርግቶ ጥላውን በእኔ ላይ', 'ዓlemu zergto xlawn beenie lay', 'Ethiopian Orthodox Tewahedo Mezmur - ዓለሙ ዘርግቶ ጥላውን በእኔ ላይ', 'አልቻልኩትምና ይኸን ሁሉ ስቃይ
ሰላማዊት እናት ድንግል ሆይ
ሰላምን ሕይወትን ከሚሰጠው አምላክ
ፍቅርን ቸርነትን ከሚያድለው አምላክ

VERSE 1
በአንቺ አማላጅነት ሕይወቴ ትባረክ
543. መልእእአተ ወንጌል
መልእክተ ወንጌል በደሙ የጻፈ
ስቃዩን ታግሶ ችሎ ያሣለፈ

VERSE 2
በርሀብ በግርፋት በግዞት አብዝቶ
በገድል በትሩፋት ጠላትን ድል ነሰቶ
ንዋየ ኅሩይ ነው ለዓለም ያበራ
ሐዋርያው ጳውሎስ ለጽድቅ የተጠራ /2/

VERSE 3
አንቅልፋን አያጣ ሌት ተቀን ሳይታክት
የኋላውን ትቶ ተጓዘ ወደፊት
በድካም ተጠምዶ በገድል እያረሠ
ከደማስቆ እስከ ሮም ቃሉን አዳረሠ

VERSE 4
አውነትን መናገር ከቶ ያላፈረ
ሕዝብን ከአሕዛብ በአንድ ያስተባበረ
አምላኩ አንዳይናቅ ከልቡ የተጋ
ጸንቶ የተጓዘ ለምትበልጠው ጸጋ', 'alchalkutmna yኸn hulu sqay
selamawit enat dngl hoy
selamn ሕywetn kemisexew amlak
fqrn chernetn kemiyadlew amlak

VERSE 1
beanchi amalajnet ሕywetie tbarek
543. meleeate wengiel
melekte wengiel bedemu yetsafe
sqayun tagso chlo yaሣlefe

VERSE 2
berhab begrfat begzot abzto
begedl betrufat xelatn dl neseto
nwaye ኅruy new leዓlem yabera
ሐwaryaw phawlos letsdq yetexera /2/

VERSE 3
anqlfan ayaxa liet teqen saytakt
yehualawn tto teguaze wedefit
bedkam texemdo begedl eyareሠ
kedemasqo eske rom qalun adareሠ

VERSE 4
awnetn menager keto yalafere
ሕzbn keaሕzab beand yastebabere
amlaku andaynaq kelbu yetega
tsento yeteguaze lemtbelxew tsega', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('berom-adebabay-sema-t-yehone', 'በሮም አደባባይ ሰማዕት የሆነ', 'በሮም አደባባይ ሰማዕት የሆነ', 'berom adebabay semaዕt yehone', 'Ethiopian Orthodox Tewahedo Mezmur - በሮም አደባባይ ሰማዕት የሆነ', 'የተዋሕዶ አርበኛ ለአምላክ የታመነ
በጣዕመ ስብከቱ ዓለሙን አጣፋጦ
አክሊል ተቀዳጀ ሳይታክት ሮጦ
በሮም አደባባይ ሰማዕት የሆነ

VERSE 1
የተዋሕዶ አርበኛ ለአምላክ የታመነ
በጣዕመ ስብከቱ ዓለሙን አጣፋጦ
አክሊል ተቀዳጀ ሳይታክት ዕሮጦ
1075. ንሴብሖ

VERSE 2
ንሴብሖ /2/ ለአምላክ ዕዝራ /2/', 'yetewaሕdo arbegna leamlak yetamene
bexaዕme sbketu ዓlemun axafaxo
aklil teqedaje saytakt roxo
berom adebabay semaዕt yehone

VERSE 1
yetewaሕdo arbegna leamlak yetamene
bexaዕme sbketu ዓlemun axafaxo
aklil teqedaje saytakt ዕroxo
1075. nsiebሖ

VERSE 2
nsiebሖ /2/ leamlak ዕzra /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('t-g-th-sefi-new-ayalqm-m-reth-2', 'ትዕግሥትህ ሰፊ ነው አያልቅም ምሕረትህ /2/', 'ትዕግሥትህ ሰፊ ነው አያልቅም ምሕረትህ /2/', 'tዕgሥth sefi new ayalqm mሕreth /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ትዕግሥትህ ሰፊ ነው አያልቅም ምሕረትህ /2/', 'የፍቅር ባለቤት ይቅር ባይ አንተ ነህ
አይቶ እንዳላየ ታልፈዋለህ ሁሉን /2/
መዓቱም ምሕረቱም ሁሉም ያንተ ሲሆን
ሥልጣንህ ረቂቅ ነው አይመረመርም /2/

VERSE 1
ዘመንና ወራት ሊሽሩት አይችሉም
የፍቅር ባቤት ቸሩ አምላካችን /2/
እድሜን ለንስሓ ስጠን ለሁላችን/2/
እንማልድሃለን በለቅሶ በሐዘን /2/

VERSE 2
የይቅርታህ ብዛት ከእኛ ጋር እንዲሆን
የሰማይ መላእክት የምድር ሠራዊት /2/
ያመሰግኑሃል በቀንና ሌሊት፡፡', 'yefqr balebiet yqr bay ante neh
ayto endalaye talfewaleh hulun /2/
meዓtum mሕretum hulum yante sihon
ሥlxanh reqiq new aymeremerm /2/

VERSE 1
zemenna werat lishrut aychlum
yefqr babiet cheru amlakachn /2/
edmien lensሓ sxen lehulachn/2/
enmaldሃlen beleqso beሐzen /2/

VERSE 2
yeyqrtah bzat keegna gar endihon
yesemay melaekt yemdr ሠrawit /2/
yamesegnuሃl beqenna lielit፡፡', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yesew-lj-hul-gizie', 'የሰው ልጅ ሁል ጊዜ', 'የሰው ልጅ ሁል ጊዜ', 'yesew lj hul gizie', 'Ethiopian Orthodox Tewahedo Mezmur - የሰው ልጅ ሁል ጊዜ', 'የሰው ልጅ ሁል ጊዜ በጣም ደስ ቢለው /2/
ደግሞ የጭንቁን ቀን ማሰብ ተገቢ ነው /2/
ምንም ቢደሰቱ ቢበዛ ምቾች /2/
ድኻም ሆነ ሀብታም እኩል ነው በሞት /2/

VERSE 1
ሰው ሆይ አትጨነቅ ለዓለም ጉዳና /2/
ዓለሙም ንብረቱም ኃላፊ ነውና /2/
ሀብት አገኘሁ ብለህ በጣም ደስ አይበልህ /2/
ድኸየሁም ብለህ አይዘን ልቦናህ /2/

VERSE 2
ይፈራረቃሉ አይኖሩም አብረውህ /2/', 'yesew lj hul gizie bexam des bilew /2/
degmo yecnqun qen maseb tegebi new /2/
mnm bidesetu bibeza mchoch /2/
dኻm hone habtam ekul new bemot /2/

VERSE 1
sew hoy atceneq leዓlem gudana /2/
ዓlemum nbretum ኃlafi newna /2/
habt agegnehu bleh bexam des aybelh /2/
dኸyehum bleh ayzen lbonah /2/

VERSE 2
yferareqalu aynorum abrewh /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('da-alebn-2-kefexariyachn-2', 'ዕዳ አለብን /2/ ከፈጣሪያችን /2/', 'ዕዳ አለብን /2/ ከፈጣሪያችን /2/', 'ዕda alebn /2/ kefexariyachn /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ዕዳ አለብን /2/ ከፈጣሪያችን /2/', 'የተሰጣት ሙሉ ሥልጣን
ክብርን ያገኘች በቃልኪዳን
ስሟን የጠራ እንደሚድን
በመጽሐፍ ሲነገረን፡፡', 'yetesexat mulu ሥlxan
kbrn yagegnech beqalkidan
smuan yexera endemidn
bemetsሐf sinegeren፡፡', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('biezawite-kulu-yetebach', 'ቤዛዊተ ኩሉ የተባች', 'ቤዛዊተ ኩሉ የተባች', 'biezawite kulu yetebach', 'Ethiopian Orthodox Tewahedo Mezmur - ቤዛዊተ ኩሉ የተባች', 'በእነ ቅዱስ ኤፍሬም የተመሰገነች
በእነ አባ ጊዮርጊስ ውዳሴን ያገኘች
በመናፍቃን ዘንድ ምነው ተዘነጋች፡:', 'beene qdus iefriem yetemesegenech
beene aba giyorgis wdasien yagegnech
bemenafqan zend mnew tezenegach፡:', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bear-yaw-fexronal-hulu-beeju-new', 'በአርዓያው ፈጥሮናል ሁሉ በእጁ ነው::', 'በአርዓያው ፈጥሮናል ሁሉ በእጁ ነው::', 'bearዓyaw fexronal hulu beeju new::', 'Ethiopian Orthodox Tewahedo Mezmur - በአርዓያው ፈጥሮናል ሁሉ በእጁ ነው::', 'ከእኛ የሚፈለገው ማመን
ከእኛ የሚጠበቀው መታመን
አፍም ይጹም ከማውራት ይከልከል
ጆሮም ይጹም ከመስማት ይከልከል

VERSE 1
ዓይን ይከልከል ከማየት ይቆጠብ', 'keegna yemifelegew mamen
keegna yemixebeqew metamen
afm ytsum kemawrat ykelkel
jorom ytsum kemesmat ykelkel

VERSE 1
ዓyn ykelkel kemayet yqoxeb', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gizieyie-eskiders', 'ጊዜዬ እስኪደርስ', 'ጊዜዬ እስኪደርስ', 'gizieyie eskiders', 'Ethiopian Orthodox Tewahedo Mezmur - ጊዜዬ እስኪደርስ', 'ጊዜዬ እስኪደርስ ወደአንተ መምጫዬ ለለ
ለንሰሓ አብቃኝ አቤቱ ጌታዬ አቤቱ ጌታዬ
ብርሃኔ መድኃኒቴ ተስፋህ ይመልሰኝ
ጥፋቴን ደምስሰህ ይቅርታ አድርግልኝ

VERSE 1
ተስፋዬ እረዳቴ አንተ አትጣለኝ
አምላኬ አታጥፋኝ ከሲኦል አድነኝ', 'gizieyie eskiders wedeante memcayie lele
lenseሓ abqagn abietu gietayie abietu gietayie
brሃnie medኃnitie tesfah ymelsegn
xfatien demsseh yqrta adrglgn

VERSE 1
tesfayie eredatie ante atxalegn
amlakie ataxfagn kesiol adnegn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('me-ri-yqr-bay-m-reth-ygobgnegn', 'መሐሪ ይቅር ባይ ምሕረትህ ይጎብኘኝ', 'መሐሪ ይቅር ባይ ምሕረትህ ይጎብኘኝ', 'meሐri yqr bay mሕreth ygobgnegn', 'Ethiopian Orthodox Tewahedo Mezmur - መሐሪ ይቅር ባይ ምሕረትህ ይጎብኘኝ', 'ከኃጢአት ፍላጻ ጸጋህ ይታደገኝ
አዳሼ መድኃኒቴ ሰላምን ላክልኝ
ይደኅነት ደጆችህን በፍቅር ክፈትልኝ', 'keኃxiat flatsa tsegah ytadegegn
adashie medኃnitie selamn laklgn
ydeኅnet dejochhn befqr kfetlgn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ywet-mot-d-net-menorachewn-bamnm', 'ሕይወት ሞት ድኅነት መኖራቸውን ባምንም', 'ሕይወት ሞት ድኅነት መኖራቸውን ባምንም', 'ሕywet mot dኅnet menorachewn bamnm', 'Ethiopian Orthodox Tewahedo Mezmur - ሕይወት ሞት ድኅነት መኖራቸውን ባምንም', 'ኃጢአት ውድቀት ጥፋት አያዘናጋኝም
ሥርየት እንደማገኝ ተስፋ ቢኖረኝም
ትምክህቴ አንተ ነህ በሌላ አልመካም', 'ኃxiat wdqet xfat ayazenagagnm
ሥryet endemagegn tesfa binoregnm
tmkhtie ante neh beliela almekam', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeljsh-t-tna-yanchi-degnet', 'የልጅሽ ትሕትና ያንቺ ደግነት', 'የልጅሽ ትሕትና ያንቺ ደግነት', 'yeljsh tሕtna yanchi degnet', 'Ethiopian Orthodox Tewahedo Mezmur - የልጅሽ ትሕትና ያንቺ ደግነት', 'የክርስተያን ምርኩዝ የሆንሽ እመቤት
እንዴት ላመስግንሽ የልቤ እንዲደርስ
የትሕትና እናት የፍቅር ውቅያኖስ', 'yekrsteyan mrkuz yehonsh emebiet
endiet lamesgnsh yelbie endiders
yetሕtna enat yefqr wqyanos', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kre-endienet-bihonew-yemstekakelew', 'ክረ እንዴነት ቢሆነው የምስተካከለው', 'ክረ እንዴነት ቢሆነው የምስተካከለው', 'kre endienet bihonew yemstekakelew', 'Ethiopian Orthodox Tewahedo Mezmur - ክረ እንዴነት ቢሆነው የምስተካከለው', 'ዓይንሽን በዓይኖቼ እመቤት የማየው
አንቺን የማይበት ምንም ዓይን የለኝ
እንቅልፍ ሲወስደኝ በህልሜ ጥሪኝ', 'ዓynshn beዓynochie emebiet yemayew
anchin yemaybet mnm ዓyn yelegn
enqlf siwesdegn behlmie xrign', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nsieb-leamlak-zra', 'ንሴብሖ ለአምላክ ዕዝራ', 'ንሴብሖ ለአምላክ ዕዝራ', 'nsiebሖ leamlak ዕzra', 'Ethiopian Orthodox Tewahedo Mezmur - ንሴብሖ ለአምላክ ዕዝራ', 'ለምስጋና ቀሰቀስከኝ በእኩለ ሌሊት
በተመስጦ ስለፍቅርህ ልጀምር ማኅሌት
ንሴብሖ ለአምላክ ዕዝራ
ንሴብሖ ለአምላክ ዕዝራ

VERSE 1
ንሴብሖ ለአምላክ ዕዝራ
ለምስጋና ቀሰቀስከኝ በእኩለ ሌሊት
በተመስጦ ስለፍቅርህ ልጀምር ማኅሌት
ንሴብሖ ለአምላክ ዕዝራ

VERSE 2
ንሴብሖ ለአምላክ ዕዝራ', 'lemsgana qeseqeskegn beekule lielit
betemesxo slefqrh ljemr maኅliet
nsiebሖ leamlak ዕzra
nsiebሖ leamlak ዕzra

VERSE 1
nsiebሖ leamlak ዕzra
lemsgana qeseqeskegn beekule lielit
betemesxo slefqrh ljemr maኅliet
nsiebሖ leamlak ዕzra

VERSE 2
nsiebሖ leamlak ዕzra', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('belju-qalnet-abm-akeberesh-2', 'በልጁ ቃልነት አብም አከበረሽ /2/', 'በልጁ ቃልነት አብም አከበረሽ /2/', 'belju qalnet abm akeberesh /2/', 'Ethiopian Orthodox Tewahedo Mezmur - በልጁ ቃልነት አብም አከበረሽ /2/', 'መዓዛሽን ወዶ ወልድ ዋሕድ ዋጀሽ
አብም በሰማያት በኅሊናው ጻፈሽ
መንፈስቅዱስ መጥቶ አንቺን አከበረሽ
እመካብሻለሁ እመቤቴ ስልሽ /2/', 'meዓzashn wedo weld waሕd wajesh
abm besemayat beኅlinaw tsafesh
menfesqdus mexto anchin akeberesh
emekabshalehu emebietie slsh /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beshbsheba-leamlaksh-zemrilet-2', 'በሽብሸባ ለአምላክሽ ዘምሪለት /2/', 'በሽብሸባ ለአምላክሽ ዘምሪለት /2/', 'beshbsheba leamlaksh zemrilet /2/', 'Ethiopian Orthodox Tewahedo Mezmur - በሽብሸባ ለአምላክሽ ዘምሪለት /2/', 'ስብራትሽን ይጠግናል በምሕረት /2/
ለሕዝብሽ እግዚአብሔር ኃይላቸው ነው /2/
በስቃይ የጐበኘ መመኪያቸው /2/', 'sbratshn yxegnal bemሕret /2/
leሕzbsh egziabሔr ኃylachew new /2/
besqay yeጐbegne memekiyachew /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bebereket-kndu-axbqo-yeyazen-lyu-new', 'በበረከት ክንዱ አጥብቆ የያዘን ልዩ ነው', 'በበረከት ክንዱ አጥብቆ የያዘን ልዩ ነው', 'bebereket kndu axbqo yeyazen lyu new', 'Ethiopian Orthodox Tewahedo Mezmur - በበረከት ክንዱ አጥብቆ የያዘን ልዩ ነው', 'እራሱን የሠዋው የዓለም ብርሃን ልዩ ነው
እካሉን መድኃነት አድርጐ የሰጠን ልዩ ነው
የፈውሳችን ፀሐይ የጽድቃችን ጮራ ልዩ ነው', 'erasun yeሠwaw yeዓlem brሃn lyu new
ekalun medኃnet adrጐ yesexen lyu new
yefewsachn ፀሐy yetsdqachn cora lyu new', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('leenies-lyu-nat', 'ለእኔስ ልዩ ናት', 'ለእኔስ ልዩ ናት', 'leenies lyu nat', 'Ethiopian Orthodox Tewahedo Mezmur - ለእኔስ ልዩ ናት', 'ለእኔስ ልዩ ነች ድንግል ማርያም
ለእኔስ ልዩ ነች እመብርሃን
ፈልጌ /4/ ለአንቺ ምስጋና አላገኘሁም /2/
ልቤ ሲያበቅል የኃጢአት አረም

VERSE 1
ውስጤ ሲሸፍት አልተወችኝም
ከቤተመቅደስ እጂን ዘርግታ
ትጠራኛለች የእኔ መከታ', 'leenies lyu nech dngl maryam
leenies lyu nech emebrሃn
felgie /4/ leanchi msgana alagegnehum /2/
lbie siyabeql yeኃxiat arem

VERSE 1
wsxie sisheft altewechgnm
kebietemeqdes ejin zergta
txeragnalech yeenie meketa', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('egziab-r-hoy-ewed-lehu', 'እግዚአብሔር ሆይ እወድሃለሁ', 'እግዚአብሔር ሆይ እወድሃለሁ', 'egziabሔr hoy ewedሃlehu', 'Ethiopian Orthodox Tewahedo Mezmur - እግዚአብሔር ሆይ እወድሃለሁ', 'እግዚአብሔር ሆይ እወድሃለሁ
ስለ ስምህ አቃጠላለሁ
ፍቅርህ እኔን ይመስጠኛል
እንደ እግዚአብሔር ከየት ይገኛል

VERSE 1
ዓለም ሁሉ በጠራኝ ጊዜ
ስንገላታ ይዞኝ ትካዜ
አንተ ከኔ አልተለየህም
እግዚአብሔር ሆይ ወደር የለህም', 'egziabሔr hoy ewedሃlehu
sle smh aqaxelalehu
fqrh enien ymesxegnal
ende egziabሔr keyet ygegnal

VERSE 1
ዓlem hulu bexeragn gizie
sngelata yzogn tkazie
ante kenie alteleyehm
egziabሔr hoy weder yelehm', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('emebietachnn-enayatalen', 'እመቤታችንን እናያታለን', 'እመቤታችንን እናያታለን', 'emebietachnn enayatalen', 'Ethiopian Orthodox Tewahedo Mezmur - እመቤታችንን እናያታለን', 'የመስቀሉ ፍቅር የገባቸው /4/
እመቤታችን አለች ከጎናቸው
አባ ሕርያቆስ አባታችን
የመስቀሉ ነገር ቢገባው', 'yemesqelu fqr yegebachew /4/
emebietachn alech kegonachew
aba ሕryaqos abatachn
yemesqelu neger bigebaw', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('fr-t-keenie-lay-celemam-teweged', 'ፍርሃት ከእኔ ላይ ጨለማም ተወገድ', 'ፍርሃት ከእኔ ላይ ጨለማም ተወገድ', 'frሃt keenie lay celemam teweged', 'Ethiopian Orthodox Tewahedo Mezmur - ፍርሃት ከእኔ ላይ ጨለማም ተወገድ', 'በጌታዬ ትምክህት እንደልቤ ልሂድ
የሞት አበጋዞች ተስፋችሁ ጨልሟል
እግዚአብሔር ሊያድነኝ አጠገቤ ቆሟል', 'begietayie tmkht endelbie lhid
yemot abegazoch tesfachhu celmual
egziabሔr liyadnegn axegebie qomual', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdusan-bemulu-leenie-zeb-qomewal', 'ቅዱሳን በሙሉ ለእኔ ዘብ ቆመዋል', 'ቅዱሳን በሙሉ ለእኔ ዘብ ቆመዋል', 'qdusan bemulu leenie zeb qomewal', 'Ethiopian Orthodox Tewahedo Mezmur - ቅዱሳን በሙሉ ለእኔ ዘብ ቆመዋል', 'ውደእነርሱ ኅብረት ሊስቡኝ ጓጉተዋል
ዘወትር በመዓልት ድንግል ትመጣለች
በብርሃን እጆቿ ትባርከኛለች', 'wdeenersu ኅbret lisbugn guagutewal
zewetr bemeዓlt dngl tmexalech
bebrሃn ejoቿ tbarkegnalech', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zbu-tesebsbo-bebietekrstiyan', 'ሕዝቡ ተሰብስቦ በቤተክርስቲያን', 'ሕዝቡ ተሰብስቦ በቤተክርስቲያን', 'ሕzbu tesebsbo bebietekrstiyan', 'Ethiopian Orthodox Tewahedo Mezmur - ሕዝቡ ተሰብስቦ በቤተክርስቲያን', 'ሲዘምር ደስ ይላል በአንድነት ሆነን
በረከት ይሞላል ዝማሬው ይገርማል
ከእጣኑ ጋራ ወደላይ ይወጣል', 'sizemr des ylal beandnet honen
bereket ymolal zmariew ygermal
keexanu gara wedelay ywexal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qesawstu-lielit-ma-liet-siyaqerbu-2', 'ቀሳውስቱ ሌሊት ማኀሌት ሲያቀርቡ', 'ቀሳውስቱ ሌሊት ማኀሌት ሲያቀርቡ', 'qesawstu lielit maኀliet siyaqerbu', 'Ethiopian Orthodox Tewahedo Mezmur - ቀሳውስቱ ሌሊት ማኀሌት ሲያቀርቡ', 'ከመላእክቱ ጋር ወረብ ሲወርቡ
ብርሃኑን ለብሰን በደስታ ስንዘምር
ትዝታው ልዩ ነው ሕሊና ሲሰውር /2/', 'kemelaektu gar wereb siwerbu
brሃnun lebsen bedesta snzemr
tztaw lyu new ሕlina sisewr /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('raay-newna-nuna-temelketu', 'ራአይ ነውና ኑና ተመልከቱ', 'ራአይ ነውና ኑና ተመልከቱ', 'raay newna nuna temelketu', 'Ethiopian Orthodox Tewahedo Mezmur - ራአይ ነውና ኑና ተመልከቱ', 'ሰዎች ሲዘምሩ እንደመላእክቱ
የጽጌው ማኅሌት የትንሣኤው ደስታ /2/
ልዩ ዝማሬ ነው እንዳይመስለን ተርታ /2/
576. ከካራን ውጡ

VERSE 1
ከጣራን ውጡ ከነዓን ግቡ
ወደ ፳ድቅ ሕይወት ዛሬ ቅረቡ
ካራን ጣዖት ነው የሚመለከው
የአሕዛብ ሀገር የሙት መንደር ነው /2/

VERSE 2
እንደአባታችን እንደ አብርሃም
ወገኖች ውጡ ከካራን ዓለም
የግፍ እንጀራ ይብቃችሁና
ከካራን ውጡ በአምላክ ጉዳና', 'sewoch sizemru endemelaektu
yetsgiew maኅliet yetnሣiew desta /2/
lyu zmarie new endaymeslen terta /2/
576. kekaran wxu

VERSE 1
kexaran wxu keneዓn gbu
wede ፳dq ሕywet zarie qrebu
karan xaዖt new yemimelekew
yeaሕzab hager yemut mender new /2/

VERSE 2
endeabatachn ende abrሃm
wegenoch wxu kekaran ዓlem
yegf enjera ybqachhuna
kekaran wxu beamlak gudana', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yexa-t-msl-kemishexbet', 'የጣዖት ምስል ከሚሸጥበት', 'የጣዖት ምስል ከሚሸጥበት', 'yexaዖt msl kemishexbet', 'Ethiopian Orthodox Tewahedo Mezmur - የጣዖት ምስል ከሚሸጥበት', 'ዓለም በዝሙት ከሚነድበት
ከሰዶም መንደር ከካራ ውጡ
የኃጢአትን ሰንሰል ዛሬ ቁረጡ', 'ዓlem bezmut keminedbet
kesedom mender kekara wxu
yeኃxiatn sensel zarie qurexu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-xiat-lem-zarie-ybqana', 'የኃጢአት ዓለም ዛሬ ይብቃና', 'የኃጢአት ዓለም ዛሬ ይብቃና', 'yeኃxiat ዓlem zarie ybqana', 'Ethiopian Orthodox Tewahedo Mezmur - የኃጢአት ዓለም ዛሬ ይብቃና', 'የፍቅር ሕይወት እንልበስና
ከካራን መንደር በፍጥነት ወጥተን
ከነዓን ገብተን ማደር አለብን', 'yefqr ሕywet enlbesna
kekaran mender befxnet wexten
keneዓn gebten mader alebn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('k-dngl-amalajn-ek-qdst-terajin', 'ክኸ ድንግል አማላጅን እክኸ ቅድስት ተራጂን', 'ክኸ ድንግል አማላጅን እክኸ ቅድስት ተራጂን', 'kኸ dngl amalajn ekኸ qdst terajin', 'Ethiopian Orthodox Tewahedo Mezmur - ክኸ ድንግል አማላጅን እክኸ ቅድስት ተራጂን', 'ለሔዋን ተስፋዋ ለአዳም ዘር ሕይወት
ለደኅነቱ ምክንያት አንቺ ነሽ በአውነት
የኦሪት መጽናኛ ለሐዲስ ኪዳን በር
የወንጌል መሠረት የአምላክ ማኅደር', 'leሔwan tesfawa leadam zer ሕywet
ledeኅnetu mknyat anchi nesh beawnet
yeorit metsnagna leሐdis kidan ber
yewengiel meሠret yeamlak maኅder', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lens-mot-abqagn', 'ለንስሐ ሞት አብቃኝ', 'ለንስሐ ሞት አብቃኝ', 'lensሐ mot abqagn', 'Ethiopian Orthodox Tewahedo Mezmur - ለንስሐ ሞት አብቃኝ', 'ለንስሓ ሞት አብቃኝ /2/
በሂሶኘ እርጨኝ እጠበኝ
እንደ በረዶ አንጻኝ /2/', 'lensሓ mot abqagn /2/
behisogne ercegn exebegn
ende beredo antsagn /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qirqos-iyeluxan-kemeqaxel-wajto', 'ቂርቆስ ኢየሉጣን ከመቃጠል ዋጅቶ', 'ቂርቆስ ኢየሉጣን ከመቃጠል ዋጅቶ', 'qirqos iyeluxan kemeqaxel wajto', 'Ethiopian Orthodox Tewahedo Mezmur - ቂርቆስ ኢየሉጣን ከመቃጠል ዋጅቶ', 'ያቀዘቀዘውን ፍሉ ን ውኃ አጥፍቶ
አስታውሷል ጊዮርጊስ ያንን ኃይል ጌታ
መስቀል መሸከሙን በዚያች በጎልጎታ', 'yaqezeqezewn flu n wኃ axfto
astawsual giyorgis yann ኃyl gieta
mesqel meshekemun beziyach begolgota', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('phiexrosna-phawlos-abatochun-mesle', 'ጴጥሮስና ጳውሎስ አባቶቹን መስለ', 'ጴጥሮስና ጳውሎስ አባቶቹን መስለ', 'phiexrosna phawlos abatochun mesle', 'Ethiopian Orthodox Tewahedo Mezmur - ጴጥሮስና ጳውሎስ አባቶቹን መስለ', 'ሞትን አሸነፈ በእምነቱ ተጋድለ
እንድንጸና በእምነት ይህችን ዓለም ንቀን
በሰማዕቱ ምልጃ አምላክ ይጠብቀን፡፡', 'motn ashenefe beemnetu tegadle
endntsena beemnet yhchn ዓlem nqen
besemaዕtu mlja amlak yxebqen፡፡', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bebedel-gurangur-be-xiat-caka', 'በበደል ጉራንጉር በኃጢአት ጫካ', 'በበደል ጉራንጉር በኃጢአት ጫካ', 'bebedel gurangur beኃxiat caka', 'Ethiopian Orthodox Tewahedo Mezmur - በበደል ጉራንጉር በኃጢአት ጫካ', 'ብጠፋበት እንኳን አልተወኝም ለካ
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል
ለካስ አልጠላኝም ጌታ ይወደኛል', 'bxefabet enkuan altewegnm leka
zariem ljie blo dagm yxeragnal
lekas alxelagnm gieta ywedegnal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('le-lxan-lekbr-byie-skdew', 'ለሥልጣን ለክብር ብዬ ስክደው', 'ለሥልጣን ለክብር ብዬ ስክደው', 'leሥlxan lekbr byie skdew', 'Ethiopian Orthodox Tewahedo Mezmur - ለሥልጣን ለክብር ብዬ ስክደው', 'ለገንዘብ አድልቼ እኔ ስረሳው
ለእኔ ያለው ፍቅር አልቀነሰብኝም
ዛሬም ይወደኛል ጌታ አልጠላኝም', 'legenzeb adlchie enie sresaw
leenie yalew fqr alqenesebgnm
zariem ywedegnal gieta alxelagnm', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tadiya-lezih-fqru-lelielew-wesen', 'ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን', 'ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን', 'tadiya lezih fqru lelielew wesen', 'Ethiopian Orthodox Tewahedo Mezmur - ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን', 'ከጭንጫ መቃብር ላወጣኝ እኔን
በሕይወቴ ሁሉ ፍጹም ለመራኝ
ክብርና ምስጋና አቀርባለሁኝ', 'kecnca meqabr lawexagn enien
beሕywetie hulu ftsum lemeragn
kbrna msgana aqerbalehugn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlak-hoy-temesgen', 'አምላክ ሆይ ተመስገን', 'አምላክ ሆይ ተመስገን', 'amlak hoy temesgen', 'Ethiopian Orthodox Tewahedo Mezmur - አምላክ ሆይ ተመስገን', 'ትእግሥትህ ብዙ ነው አያልቅም ርኀራጌህ
የምንከፍልህ ምን ይሆን ብዙ ነው ውለታህ
አምላክ ሆይ ተመስገን
አምላክ ሆይ ተመስገን

VERSE 1
አምላክ ሆይ ተመስገን
አምላክ ሆይ ተመስገን', 'tegሥth bzu new ayalqm rኀragieh
yemnkeflh mn yhon bzu new wletah
amlak hoy temesgen
amlak hoy temesgen

VERSE 1
amlak hoy temesgen
amlak hoy temesgen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dngl-hoy-hul-gizie-ayleyen-mljashe', 'ድንግል ሆይ ሁል ጊዜ አይለየን ምልጃሸ፡:', 'ድንግል ሆይ ሁል ጊዜ አይለየን ምልጃሸ፡:', 'dngl hoy hul gizie ayleyen mljashe፡:', 'Ethiopian Orthodox Tewahedo Mezmur - ድንግል ሆይ ሁል ጊዜ አይለየን ምልጃሸ፡:', 'አንድነት ስናጣ ፍቅር ስትመነምን
በምግባር ስንደክም ሲጐድል እምነታችን
በሥጋችን ፈቃድ ወድቀን እንዳንጠፋ
በምሕረትህ ጉብኘን አንተ ሁነን ተስፋ', 'andnet snaxa fqr stmenemn
bemgbar sndekm siጐdl emnetachn
beሥgachn feqad wedqen endanxefa
bemሕreth gubgnen ante hunen tesfa', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ftsum-endanazn-endanafr-huala', 'ፍጹም እንዳናዝን እንዳናፍር ኋላ', 'ፍጹም እንዳናዝን እንዳናፍር ኋላ', 'ftsum endanazn endanafr huala', 'Ethiopian Orthodox Tewahedo Mezmur - ፍጹም እንዳናዝን እንዳናፍር ኋላ', 'ተነጥቀን እንዳንቀር ከዘለዓለም ተድላ
በፍቅርሽ መልሺን ከሲኦል ጎዳና
ድንግል መመኪያችን ተስፋችን ነሸና
586. ስለድንግል ብሎ

VERSE 1
ስለድንግል ብሎ ኢትዮጵያን ይጎበኛት
ድሮስ ከአምላክ በቀር ይህች ሀገር ማን አላት
በሠራዊት ብዛት መች ትጠበቃለች
በቅዱሳን ጸሎት አሳት ካልታጠረች

VERSE 2
ዓለም ሸምቆባት አሕዛብ ይስቃል
በልጆችሽ እንባ አውሬው ይቀልዳል
ታላቅ ሕዝብ መሆኑን ማን በነገራቸው
ከዘመናት በፊት አምሳክ የጎበኘው /2/

VERSE 3
እውነተኛ እንባ ፈለቀ ከምድር
በፍጡራን ዋይታ ፍጹም ብታማርር
እንባና ደማችን ተደባልቆ ፈሷል
አምላክ ቅጣት ይብቃ አቤቱ ይቅር በለን /2/

VERSE 4
ቅዱሳንን መንቀፍ ወገኔ ተውና
ይልቅ ስለአነርሱ የጽድቅ ጎዳና
በረድኤታቸው በክብራቸው ጥላ
እንከተላቸው ከፍቅራቸው ኋላ /2/

VERSE 5
587. አምላክ አለ መሃላችን
ደስ ይበለን ደስ ይበለን
አምላክ አለ መሃላችን', 'tenexqen endanqer kezeleዓlem tedla
befqrsh melshin kesiol godana
dngl memekiyachn tesfachn neshena
586. sledngl blo

VERSE 1
sledngl blo ityophyan ygobegnat
dros keamlak beqer yhch hager man alat
beሠrawit bzat mech txebeqalech
beqdusan tselot asat kaltaxerech

VERSE 2
ዓlem shemqobat aሕzab ysqal
beljochsh enba awriew yqeldal
talaq ሕzb mehonun man benegerachew
kezemenat befit amsak yegobegnew /2/

VERSE 3
ewnetegna enba feleqe kemdr
befxuran wayta ftsum btamarr
enbana demachn tedebalqo fesual
amlak qxat ybqa abietu yqr belen /2/

VERSE 4
qdusann menqef wegenie tewna
ylq sleanersu yetsdq godana
beredietachew bekbrachew xla
enketelachew kefqrachew huala /2/

VERSE 5
587. amlak ale meሃlachn
des ybelen des ybelen
amlak ale meሃlachn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('biete-meqdes-norech-3-a-ra-hulet-met', 'ቤተ መቅደስ ኖረች/3/ አሥራ ሁለት ዓመት', 'ቤተ መቅደስ ኖረች/3/ አሥራ ሁለት ዓመት', 'biete meqdes norech/3/ aሥra hulet ዓmet', 'Ethiopian Orthodox Tewahedo Mezmur - ቤተ መቅደስ ኖረች/3/ አሥራ ሁለት ዓመት', 'አመቤታችን ላንቺፒ------
መንፈስ ቅዱስ እንደቀረባት አውቆ
ሰገደላት /3/ ዘካርያስ ታጥቆ
አመቤታችን ላንቺ ------፦፦

VERSE 1
መንፈስ ቅዱስ እንደቀረባት አውቃ
ተሳለመቻት /3/ ኤልሣቤጥም ታጥቃ
አመቤታችን ላንቺ -----፦፦---፦
አያስደንቅም ወይ የማርያም ትኅትና

VERSE 2
ውኃ ስትቀዳ/3/ የአምላክ እናት ሁና
አመቤታችን ላንቺ -----------
የምንጭ ውኃ ምሥጢር የሚያመለክተው/ሪ//
የአምላክ መገኛ ምንጭ /3/ እርሷ መሆንዋን ነው

VERSE 3
አመቤታችን ላንቺ -------', 'amebietachn lanchipi------
menfes qdus endeqerebat awqo
segedelat /3/ zekaryas taxqo
amebietachn lanchi ------፦፦

VERSE 1
menfes qdus endeqerebat awqa
tesalemechat /3/ ielሣbiexm taxqa
amebietachn lanchi -----፦፦---፦
ayasdenqm wey yemaryam tኅtna

VERSE 2
wኃ stqeda/3/ yeamlak enat huna
amebietachn lanchi -----------
yemnc wኃ mሥxir yemiyamelektew/ri//
yeamlak megegna mnc /3/ ersua mehonwan new

VERSE 3
amebietachn lanchi -------', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('semayna-mdr-yemaychlutn-2', 'ሰማይና ምድር የማይችሉትን', 'ሰማይና ምድር የማይችሉትን', 'semayna mdr yemaychlutn/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሰማይና ምድር የማይችሉትን', 'ሰላም አመቤት /3/ አምላክን የወለድሽ/2/
የሰማይ መላእክት የሚያመሰግኑነሽ /2/
ሰላም ለመቤቴ /3/ አምላክ የመረጠሸ/2/
ከሴቶች ሁሉ የተባረክሽ /2/ ነሽ/2/

VERSE 1
592.የዓለም ንግሥት የሆንሽው
የዓለም ንግሥት የሆነሽው ድንግል ማርያም
አናቴ
ታመሰግንሽ አንቺን ሁልጊዜ ሕይወቴ

VERSE 2
ሰማይና ምድር የማይችሉትን
ሰማይና ምድር የማይችሉትን', 'selam amebiet /3/ amlakn yeweledsh/2/
yesemay melaekt yemiyamesegnunesh /2/
selam lemebietie /3/ amlak yemerexeshe/2/
kesietoch hulu yetebareksh /2/ nesh/2/

VERSE 1
592.yeዓlem ngሥt yehonshw
yeዓlem ngሥt yehoneshw dngl maryam
anatie
tamesegnsh anchin hulgizie ሕywetie

VERSE 2
semayna mdr yemaychlutn
semayna mdr yemaychlutn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qdusan-begenet-siyamesegnush', 'ቅዱሳን በገነት ሲያመሰግኑሽ', 'ቅዱሳን በገነት ሲያመሰግኑሽ', 'qdusan begenet siyamesegnush', 'Ethiopian Orthodox Tewahedo Mezmur - ቅዱሳን በገነት ሲያመሰግኑሽ', 'መላእክት በሰማይ ሲያገለግሉሽ
አኛም የአዳም ልጆች ከመሬት ሆነን
ሰአሊ ለነ ቅድስት አንልሻለን', 'melaekt besemay siyageleglush
agnam yeadam ljoch kemeriet honen
seali lene qdst anlshalen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-lem-med-nit', 'የዓለም መድኃኒት -----------፦--', 'የዓለም መድኃኒት -----------፦--', 'yeዓlem medኃnit -----------፦--', 'Ethiopian Orthodox Tewahedo Mezmur - የዓለም መድኃኒት -----------፦--', 'ሥጋ ለብሶ ቢታይ ረቂቅ መለኮት
በአንድ ላይ ዘመሩ ሰውና መላእክት /2/
የዓለም መድኃኒት -------“-”-፦፦፦----=>
597.ክርስቶስ በስምህ', 'ሥga lebso bitay reqiq melekot
beand lay zemeru sewna melaekt /2/
yeዓlem medኃnit -------“-”-፦፦፦----=>
597.krstos besmh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tegerfo-teseqlo-yemotew-anbesa', 'ተገርፎ ተሰቅሎ የሞተው አንበሳ', 'ተገርፎ ተሰቅሎ የሞተው አንበሳ', 'tegerfo teseqlo yemotew anbesa', 'Ethiopian Orthodox Tewahedo Mezmur - ተገርፎ ተሰቅሎ የሞተው አንበሳ', 'ተገንዞ በጨርቅ ተቀብሮ እንደሬሳ
በሞት እጅ ተይዞ አልቀረም ተነሣ/2/
አናምለን ትንሣኤህን', 'tegenzo becerq teqebro enderiesa
bemot ej teyzo alqerem teneሣ/2/
anamlen tnሣiehn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('afer-birebereb-xn-bidereder', 'አፈር ቢረበረብ ሣጥን ቢደረደር', 'አፈር ቢረበረብ ሣጥን ቢደረደር', 'afer birebereb ሣxn bidereder', 'Ethiopian Orthodox Tewahedo Mezmur - አፈር ቢረበረብ ሣጥን ቢደረደር', 'ድንጋይ በድንጋይ ላይ ደግሞም ቢነባበር
ምድር አልቻለችም አምላክን ለመቅበር /2/
እናምናለን ---------', 'dngay bedngay lay degmom binebaber
mdr alchalechm amlakn lemeqber /2/
enamnalen ---------', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sb-t-leab', 'ስብሐት ለአብ --------', 'ስብሐት ለአብ --------', 'sbሐt leab ----------', 'Ethiopian Orthodox Tewahedo Mezmur - ስብሐት ለአብ --------', 'ስብሐት ለአብ ---------------
ያልከውን አስበህ እናንተ ሁላችሁ
ስሜን ከጠራችሁ ሁለት ሦስት ሁናችሁ
አኔም እገኛለሁ በመካከላችሁ

VERSE 1
ስብሐት ለአብ --------', 'sbሐt leab ---------------
yalkewn asbeh enante hulachhu
smien kexerachhu hulet ሦst hunachhu
aniem egegnalehu bemekakelachhu

VERSE 1
sbሐt leab --------', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abietu-amlak-hoy-enlemn-len', 'አቤቱ አምላክ ሆይ እንለምንፃለን', 'አቤቱ አምላክ ሆይ እንለምንፃለን', 'abietu amlak hoy enlemnፃlen', 'Ethiopian Orthodox Tewahedo Mezmur - አቤቱ አምላክ ሆይ እንለምንፃለን', 'አንድትገኝልን በመካከላችን /2/
ይኸው ተገኝተናል ሁለት ሦስት ሆነን
ስብሐት ለአብ -----', 'andtgegnln bemekakelachn /2/
yኸw tegegntenal hulet ሦst honen
sbሐt leab -----', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bnqorb-anqerm-yhn-gizie-enberta', 'ብንቆርብ አንቀርም ይህን ጊዜ እንበርታ', 'ብንቆርብ አንቀርም ይህን ጊዜ እንበርታ', 'bnqorb anqerm yhn gizie enberta', 'Ethiopian Orthodox Tewahedo Mezmur - ብንቆርብ አንቀርም ይህን ጊዜ እንበርታ', 'መቆረብ በሕይወት ነው ንስሓ መግባት
ይህ ሁሉ አይገኝም ከገቡ መሬት
ሰዎች ተጠንቀቁ እወቁ ሁላችሁ', 'meqoreb beሕywet new nsሓ megbat
yh hulu aygegnm kegebu meriet
sewoch texenqequ ewequ hulachhu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('besterjna-aydelem-bewexatnet-new', 'በስተርጅና አይደለም በወጣትነት ነው', 'በስተርጅና አይደለም በወጣትነት ነው', 'besterjna aydelem bewexatnet new', 'Ethiopian Orthodox Tewahedo Mezmur - በስተርጅና አይደለም በወጣትነት ነው', 'ጨረቃና ፀሐይ ደም የለበሱት
ከዋክብት በሰማይ የተነጠፉት
በስተርጅና አይደለም በወጣትነት ነው', 'cereqana ፀሐy dem yelebesut
kewakbt besemay yetenexefut
besterjna aydelem bewexatnet new', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yh-lem-xefi-new-behabt-atmeku', 'ይህ ዓለም ጠፊ ነው በሀብት አትመኩ', 'ይህ ዓለም ጠፊ ነው በሀብት አትመኩ', 'yh ዓlem xefi new behabt atmeku', 'Ethiopian Orthodox Tewahedo Mezmur - ይህ ዓለም ጠፊ ነው በሀብት አትመኩ', 'ብሏል አምላካችን ተስፋችሁን እንኩ
488. ነፍሴ ሆይ
ነፍሴ ሆይ እግዚአብሔርን በቅን አገልግይ/2/
የተቀበለው በቀራንዮ

VERSE 1
ያን ሁሉ መከራ በመስቀሉ ላይ
ለአንቺ ሲል ነውና ነፍሴ ሆይ
ተዘጋጅተሽ ኑሪ ሁልጊዜ
በነገ በዛሬ አንዳትታለዩ/2/ ነፍሴ ሆይ

VERSE 2
በንስሓ ጥምቀት ታጠቢና
ክቡር ደሙን ጠጪ ሥጋውንም ብይ/2/
ነፍሴ ሆይ
ዘላለም በደስታ እንድትኖሪ

VERSE 3
ከዘላለም ቤትሽ መንግሥተ ሰማይ/2/
ነፍሴ ሆይ
489. ወደአንተ እስግዳለሁ
ወደአንተ አሰግዳለሁ ሳለሁ በሕይወቴ

VERSE 4
ላንተም አገዛለሁ እስከ አለተ ሞቴ
አንተ ነህና መድኃኒቴ የዘላለም ቤቴ /2/
ሳይመሽብኝ ቀኑ ሳይጨልም ድንገት
በጽድቅ ጎዳና ልጓዝ ወደፊት

VERSE 5
ምራኝ መንገዱን አሳየኝ እንዳልሳሳት
የነፍስ የሥጋዬ የሕይወቴ ቤዛ
አትበለኝ ችላ በደሌ ቢበዛ
አንተን አምጌፄ እኖራለሁ ወዴት አፄዳለሁ/2/

VERSE 6
490. አንድ ጊዜ
አንድ ጊዜ የእግዚአብሔር ሆኛለሁ/2/
ይህ ዓለም ጠፊ ነው በሀብት አትመኩ
ብሏል አምላካችን ተስፋችሁን እንኩ

VERSE 7
ኑ እንቅረብ --------------', 'blual amlakachn tesfachhun enku
488. nefsie hoy
nefsie hoy egziabሔrn beqn agelgy/2/
yeteqebelew beqeranyo

VERSE 1
yan hulu mekera bemesqelu lay
leanchi sil newna nefsie hoy
tezegajtesh nuri hulgizie
benege bezarie andattaleyu/2/ nefsie hoy

VERSE 2
bensሓ xmqet taxebina
kbur demun xeci ሥgawnm by/2/
nefsie hoy
zelalem bedesta endtnori

VERSE 3
kezelalem bietsh mengሥte semay/2/
nefsie hoy
489. wedeante esgdalehu
wedeante asegdalehu salehu beሕywetie

VERSE 4
lantem agezalehu eske alete motie
ante nehna medኃnitie yezelalem bietie /2/
saymeshbgn qenu saycelm dnget
betsdq godana lguaz wedefit

VERSE 5
mragn mengedun asayegn endalsasat
yenefs yeሥgayie yeሕywetie bieza
atbelegn chla bedelie bibeza
anten amgieፄ enoralehu wediet aፄdalehu/2/

VERSE 6
490. and gizie
and gizie yeegziabሔr hognalehu/2/
yh ዓlem xefi new behabt atmeku
blual amlakachn tesfachhun enku

VERSE 7
nu enqreb --------------', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yesew-ljoch-hulachn-enmar', 'የሰው ልጆች ሁላችን እንማር', 'የሰው ልጆች ሁላችን እንማር', 'yesew ljoch hulachn enmar', 'Ethiopian Orthodox Tewahedo Mezmur - የሰው ልጆች ሁላችን እንማር', 'የሰው ልጆች ሁላችን እንማር
አስተባብረን ሄይማኖት ከምግባር
የሰው ልጆች ሁላችን አንማር
መልካም ሥራን በመሥራት እንኑር', 'yesew ljoch hulachn enmar
astebabren heymanot kemgbar
yesew ljoch hulachn anmar
melkam ሥran bemeሥrat ennur', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeseyxan-dl-mensha-yekbr-mewresha', 'የሰይጣን ድል መንሻ የክብር መውረሻ', 'የሰይጣን ድል መንሻ የክብር መውረሻ', 'yeseyxan dl mensha yekbr mewresha', 'Ethiopian Orthodox Tewahedo Mezmur - የሰይጣን ድል መንሻ የክብር መውረሻ', 'ፃይማኖት ናትና እውነተኛ ጋሻ
የሰይጣን ድል መንሻ የክብር መውረሻ
ፃይማኖት ናትና እውነተኛ ጋሻ', 'ፃymanot natna ewnetegna gasha
yeseyxan dl mensha yekbr mewresha
ፃymanot natna ewnetegna gasha', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mn-yebeza-neber-t-tna-t-g-th-yemaylewex', 'ምን የበዛ ነበር ትኅትና ትዕግሥትህ የማይለወጥ', 'ምን የበዛ ነበር ትኅትና ትዕግሥትህ የማይለወጥ', 'mn yebeza neber tኅtna tዕgሥth yemaylewex', 'Ethiopian Orthodox Tewahedo Mezmur - ምን የበዛ ነበር ትኅትና ትዕግሥትህ የማይለወጥ', 'የሾክ አክሊል ደፍተው በራስህ ጎንህን ሲወጉ በጦር
አንተ ግን ለአነርሱ ከአባትህ ምሕረትን ትለመን ነበር
ግን መቼ ዐወቁ እነርሱ በኃጢአት ደንድኖ ልባቸው
መድኃኒታቸውን ገረፉህ ሰቀሉህ አንተም ሞትክላቸው

VERSE 1
ዳግም ስትመጣ ለፍርድ ከዓለም ፍጻሜ በኋላ', 'yeshok aklil deftew berash gonhn siwegu bexor
ante gn leanersu keabath mሕretn tlemen neber
gn mechie ዐwequ enersu beኃxiat dendno lbachew
medኃnitachewn gerefuh seqeluh antem motklachew

VERSE 1
dagm stmexa lefrd keዓlem ftsamie behuala', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('re-andiet-dlegnoch-nachew-befith-yemiyagegnu-tedla', 'ኸረ አንዴት ዕድለኞች ናቸው በፊትህ የሚያገኙ ተድላ', 'ኸረ አንዴት ዕድለኞች ናቸው በፊትህ የሚያገኙ ተድላ', 'ኸre andiet ዕdlegnoch nachew befith yemiyagegnu tedla', 'Ethiopian Orthodox Tewahedo Mezmur - ኸረ አንዴት ዕድለኞች ናቸው በፊትህ የሚያገኙ ተድላ', 'በዚያች በደብረ ዘይት ቦታ ደስታና ልቅሶ ሲፈልቅ
ከቶ ከየት ይሆን እጣዬ ያን ጊዜ የእኔ አወዳደቅ
የፀፀት እሮሮ በፊህ እንዲያቃጥለኝ እኔን', 'beziyach bedebre zeyt bota destana lqso sifelq
keto keyet yhon exayie yan gizie yeenie awedadeq
yeፀፀt eroro befih endiyaqaxlegn enien', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('aae-qe-beqelt-abr-m-nesa-4', 'አአእፀቀ በቀልት አብርፃም ነስአ/4/', 'አአእፀቀ በቀልት አብርፃም ነስአ/4/', 'aaeፀqe beqelt abrፃm nesa/4/', 'Ethiopian Orthodox Tewahedo Mezmur - አአእፀቀ በቀልት አብርፃም ነስአ/4/', '621.በትፍሥሕት ወበሐሴት
በትፍሥሕት ወበሐሴት /2/
ይሁቦሙ ኃይለ ወሥልጣን /4/
622.ይባዕ ንጉሠ ስብሐት', '621.betfሥሕt webeሐsiet
betfሥሕt webeሐsiet /2/
yhubomu ኃyle weሥlxan /4/
622.ybaዕ nguሠ sbሐt', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nebiyat-betnbit', 'ነቢያት በትንቢት ›', 'ነቢያት በትንቢት ›', 'nebiyat betnbit ›', 'Ethiopian Orthodox Tewahedo Mezmur - ነቢያት በትንቢት ›', 'የተናገሩለት ››
ሐዋርያት በወንጌል ›
የሰበኩለት ››
እሪ

VERSE 1
እሪ', 'yetenagerulet ››
ሐwaryat bewengiel ›
yesebekulet ››
eri

VERSE 1
eri', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('am-etone-asat-zeynedd-angefene-2', 'አም እቶነ አሳት ዘይነድድ አንገፈነ /2/', 'አም እቶነ አሳት ዘይነድድ አንገፈነ /2/', 'am etone asat zeynedd angefene /2/', 'Ethiopian Orthodox Tewahedo Mezmur - አም እቶነ አሳት ዘይነድድ አንገፈነ /2/', 'አም እቶነ አሳት ዘይነድድ አንገፈነ /2/
ብርሃናተ ዘይትአጸፍ ተንሥአ ለነ /2/
ከሚነደው አሳት ከነበልባሉ አወጣን /2/
ብርሃናትን ተጎናጽፎ ተነሣልን /2/

VERSE 1
190የድሆች መጠጊያ
የድሆች መጠጊያ ቤተ ክርስቲያን
ለመማር መጥተናል ሰምተን ቃልሽን /2/
ሰላም ሰላም የዘለዓለም ቤቴ /2/

VERSE 2
ከአንቺ አልለይም እስከዕለተ ሞቴ
ሰላም ለአንቺ ይሁን ቤተክርስቲያን
በደሙ ያጸናሽ ኢየሱስ መድኅን /2/', 'am etone asat zeynedd angefene /2/
brሃnate zeytatsef tenሥa lene /2/
keminedew asat kenebelbalu awexan /2/
brሃnatn tegonatsfo teneሣln /2/

VERSE 1
190yedhoch mexegiya
yedhoch mexegiya biete krstiyan
lememar mextenal semten qalshn /2/
selam selam yezeleዓlem bietie /2/

VERSE 2
keanchi alleym eskeዕlete motie
selam leanchi yhun bietekrstiyan
bedemu yatsenash iyesus medኅn /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('br-n-wexa-kemesqelu-yemiyan-barq', 'ብርሃን ወጣ ከመስቀሉ የሚያንፀባርቅ', 'ብርሃን ወጣ ከመስቀሉ የሚያንፀባርቅ', 'brሃn wexa kemesqelu yemiyanፀbarq', 'Ethiopian Orthodox Tewahedo Mezmur - ብርሃን ወጣ ከመስቀሉ የሚያንፀባርቅ', 'የአምላክና የሰው ልጆች አውነተኛ አርቅ
ደስ ይበለን በትንሣኤው ብርፃን
አልል እንበል በአንድነት ሆነን
ተነሣልን መድሃኒታችን

VERSE 1
ከፊት ለፊት በመሣሉ የመስቀሉ ነገር
የሚወደው ሐዋርያ የወንጌል መምህር
ዮሐንስም ስቅለቱን በማየቱ
ሲያዝን ኖረ በምድራዊ ሕይወቱ

VERSE 2
ቢያሠቅቀው ሞቱ ግርፋሩ
ሞኝነት ነው ለሚጠፋት መሠናከያቸው
በዓለም ጥበብ ለሚኖሩት አውነት ተስኗቸው
ለጠቢብ ሰው በመንፈስ ለሚኖረው

VERSE 3
አውነተኛ የመዳን ቀን ዓርማ ነው
ከገዛነም አሳት የሚያደን ነው
አሰከመሞት ላስተለየው ቅዱስ ሐዋርያ
ለዮሐንስ የወንጌል ሰው ለፅድቅ ባለሙያ

VERSE 4
ምስጋናችን በምድር ይድረሰው
አንላለን በሰጠን ምሣሌው
ሰዎች ሁሉ እንከተለው
638.የሕያዋን አመላክ ሙታንን ሊያስነሳ

VERSE 5
በአኩለ ሌሊት ክርስቶስ ተነሣ /2/
ሙታን ይደለንም ክርስቶስ ተነሣ
ሕያዋን ነን እኛ ክርስቶስ ተነሣ
በመስቀሉ የዳንን ››

VERSE 6
ከኃጢአት ቁራኛ ››
የተዋረደውን ››
ሊያከብር ዳግመኛ ››
ሞትን አሽንፎ ››

VERSE 7
ተነሣልን ለእኛ ››', 'yeamlakna yesew ljoch awnetegna arq
des ybelen betnሣiew brፃn
all enbel beandnet honen
teneሣln medሃnitachn

VERSE 1
kefit lefit bemeሣlu yemesqelu neger
yemiwedew ሐwarya yewengiel memhr
yoሐnsm sqletun bemayetu
siyazn nore bemdrawi ሕywetu

VERSE 2
biyaሠqqew motu grfaru
mognnet new lemixefat meሠnakeyachew
beዓlem xbeb leminorut awnet tesnuachew
lexebib sew bemenfes leminorew

VERSE 3
awnetegna yemedan qen ዓrma new
kegezanem asat yemiyaden new
asekememot lasteleyew qdus ሐwarya
leyoሐns yewengiel sew leፅdq balemuya

VERSE 4
msganachn bemdr ydresew
anlalen besexen mሣliew
sewoch hulu enketelew
638.yeሕyawan amelak mutann liyasnesa

VERSE 5
beakule lielit krstos teneሣ /2/
mutan ydelenm krstos teneሣ
ሕyawan nen egna krstos teneሣ
bemesqelu yedann ››

VERSE 6
keኃxiat quragna ››
yetewaredewn ››
liyakebr dagmegna ››
motn ashnfo ››

VERSE 7
teneሣln leegna ››', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('krstos-sine-kerstos-tene', 'ክርስቶስ ሲነሣ ከርስቶስ ተነሣ', 'ክርስቶስ ሲነሣ ከርስቶስ ተነሣ', 'krstos sineሣ kerstos teneሣ', 'Ethiopian Orthodox Tewahedo Mezmur - ክርስቶስ ሲነሣ ከርስቶስ ተነሣ', 'በሰንበት ሌሊት ››
አስቀድሞ ታየ ››
ለመግደላዊት ››
አርሷም ትንሣኤውን ››

VERSE 1
ለዓለም አበሠረች ››
ጌታዬን አየሁት ››
ተንስቶአል እያለች ››', 'besenbet lielit ››
asqedmo taye ››
lemegdelawit ››
arsuam tnሣiewn ››

VERSE 1
leዓlem abeሠrech ››
gietayien ayehut ››
tenstoal eyalech ››', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ell-amanuiel-tene-lnem', 'እልል አማኑኤል ተነሣልነም', 'እልል አማኑኤል ተነሣልነም', 'ell amanuiel teneሣlnem', 'Ethiopian Orthodox Tewahedo Mezmur - እልል አማኑኤል ተነሣልነም', 'አልል /6 አማኑኤል ተነሣልን
ደስ ይበልን ሁላችንን
የሲዖል ደጆች ተከፈቱ አልል
የሰይጣንም ሠራዊቶች አፈሩ አልል

VERSE 1
በጨለማው ዓለም ተወጠን ሳለን
ጌታ በትንሣኤው ዛሬ አበራልን', 'all /6 amanuiel teneሣln
des ybeln hulachnn
yesiዖl dejoch tekefetu all
yeseyxanm ሠrawitoch aferu all

VERSE 1
becelemaw ዓlem tewexen salen
gieta betnሣiew zarie aberaln', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('meqabrat-hulu-tekefetu-all', 'መቃብራት ሁሉ ተከፈቱ አልል', 'መቃብራት ሁሉ ተከፈቱ አልል', 'meqabrat hulu tekefetu all', 'Ethiopian Orthodox Tewahedo Mezmur - መቃብራት ሁሉ ተከፈቱ አልል', 'የታሠሩ ነፍሳት ከግዞት ተፈቱ እልል
መግደላዊት ማርያም ትንሣኤውን አይታ
ነገረች ለሐዋርያት በደስታ ተሞልታ', 'yetaሠru nefsat kegzot tefetu ell
megdelawit maryam tnሣiewn ayta
negerech leሐwaryat bedesta temolta', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('krstos-tene', 'ክርስቶስ ተነሣ', 'ክርስቶስ ተነሣ', 'krstos teneሣ', 'Ethiopian Orthodox Tewahedo Mezmur - ክርስቶስ ተነሣ', 'ክርስቶስ ተነሣ ከሙታን በታላቅ ኃይል በታላቅ
ስልጣን /2/
ሰይጣንን አስሮ /2/ ነባ አወጣን አዳምን /2
641.እንዘምር ሁላችን ለቸሩ ፈጣሪ /2

VERSE 1
በትንሣኤው ኃይሉ ሞትን አሣፋሪ /4
አሰይ አገኘነው ሕይወታችንን /2 ደስ ይበለን
ትጉህ የማይተኛ ጊዜውን አክብሮ /2
ነፍሳትን አወጣ ከሲኦል በርብር”''2/', 'krstos teneሣ kemutan betalaq ኃyl betalaq
slxan /2/
seyxann asro /2/ neba awexan adamn /2
641.enzemr hulachn lecheru fexari /2

VERSE 1
betnሣiew ኃylu motn aሣfari /4
asey agegnenew ሕywetachnn /2 des ybelen
/2
/2

VERSE 2
tguh yemaytegna giziewn akbro /2
nefsatn awexa kesiol berbr”''2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('me-naklun-kfuwn-fetena', 'መሠናክሉን ክፉውን ፈተና', 'መሠናክሉን ክፉውን ፈተና', 'meሠnaklun kfuwn fetena', 'Ethiopian Orthodox Tewahedo Mezmur - መሠናክሉን ክፉውን ፈተና', 'አልፈነው ወጣን በአምላክ ጎዳና
አምላክ ከኛ ጋር ስለነበር
ዲያብሎስ አፍሮ ተዋርዶ ቀረ', 'alfenew wexan beamlak godana
amlak kegna gar sleneber
diyablos afro tewardo qere', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-bemsgana-wede-semay-arege-beabatum-qegn', 'ትርጉም በምስጋና ወደ ሰማይ አረገ በአባቱም ቀኝ', 'ትርጉም በምስጋና ወደ ሰማይ አረገ በአባቱም ቀኝ', 'trgum bemsgana wede semay arege beabatum qegn', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም በምስጋና ወደ ሰማይ አረገ በአባቱም ቀኝ', 'ተቀመጠ ዳግመኛም በምስጋና ይመጣል
651.ዮም ፍሥሐ ኮነ በእንተ ዕርገቱ ለክርስቶስ
እምድኅረ ተንሥአ አሙታን በአርብዓ ዕለት
በይባቤ ወበቃለ ቀርን አማን መንክር ስብሐተ

VERSE 1
ፅርገቱ', 'teqemexe dagmegnam bemsgana ymexal
651.yom fሥሐ kone beente ዕrgetu lekrstos
emdኅre tenሥa amutan bearbዓ ዕlet
beybabie webeqale qern aman menkr sbሐte

VERSE 1
ፅrgetu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ayaleqese-genetn-siyaxa', 'አያለቀሰ ገነትን ሲያጣ', 'አያለቀሰ ገነትን ሲያጣ', 'ayaleqese genetn siyaxa', 'Ethiopian Orthodox Tewahedo Mezmur - አያለቀሰ ገነትን ሲያጣ', 'አያለቀሰ ገነትን ሲያጣ
ተስፋ አንቺ ሆነሽው የመዳን አጣ /2/
ሊባኖስ ተራራ ተሠማ ዜና
ምሥራቅ ወለዱ ኢያቄም ወሐና

VERSE 1
ዳግማዊት ሔዋን ምክንያተ ድኅነት
ልደታን ሰማን በቅድስት አለት
የልደትሽ ቀን ልደታችን ነው
በአንቺ ነውና ልጅ የተባልነው

VERSE 2
ፋራን የተባልሽ ቅድስት ተራራ
በአንቺ መወለድ ዓለሙ በራ
906. ትውልድ ሁሉ
ትውልድ ሁሉ የሚማጸኑሽ

VERSE 3
በመላእክት የተመሠገንሽ
ክብር አክሊሌ ሰላም ልበልሽ
ትውልድ ሁሉ ዓለም ሣይፈጠር
ትውልድ ሁሉ በለምጽ የነደደው

VERSE 4
ይቀደስ ከንፈሬ
አንደ አባ ጊዬርጊስ
ላምስግንሽ ክብሬ
ዓይኖቼ ይታገሉ

VERSE 5
ዳግማዊት ሔዋን ምክንያተ ድኅነት
ልደትዋን ሰማን በቅድስት አለት
የልደትሽ ቀን ልደታችን ነው
በአንቺ ነውና ልጅ የተባልነው

VERSE 6
ፋራን የተባልሽ ቅድስት ተራራ
በአንቺ መወለድ ዓለሙ በራ
1083. የዕለት የዓመት
የፅለት የዓመት የዘመናት ጌታ

VERSE 7
ከዚህ ካደረስከኝ ዘመኔን ሳትገታ
አቀርብልዛፃለሁ የክብር ሰላምታ የአክብሮት
ሰላምታ
ኑ እናመስግን ከልባችን

VERSE 8
የሰማዩን አባታችን
ከዚህ ዕለት ከዚህ ዓመት ላደረሰን
ሁላችንን /2/
የሰው ልጆች አድሜ ጥንቱንም ሲጀመር

VERSE 9
ምን ቢወጣ ቢወርድ ቢበዛ ቢደመር
አንድ ቀን አይሞላም እንደአንተ አቆጣጠር /2/', 'ayaleqese genetn siyaxa
tesfa anchi honeshw yemedan axa /2/
libanos terara teሠma ziena
mሥraq weledu iyaqiem weሐna

VERSE 1
dagmawit ሔwan mknyate dኅnet
ldetan seman beqdst alet
yeldetsh qen ldetachn new
beanchi newna lj yetebalnew

VERSE 2
faran yetebalsh qdst terara
beanchi meweled ዓlemu bera
906. twld hulu
twld hulu yemimatsenush

VERSE 3
bemelaekt yetemeሠgensh
kbr aklilie selam lbelsh
twld hulu ዓlem ሣyfexer
twld hulu belemts yenededew

VERSE 4
yqedes kenferie
ande aba giyiergis
lamsgnsh kbrie
ዓynochie ytagelu

VERSE 5
dagmawit ሔwan mknyate dኅnet
ldetwan seman beqdst alet
yeldetsh qen ldetachn new
beanchi newna lj yetebalnew

VERSE 6
faran yetebalsh qdst terara
beanchi meweled ዓlemu bera
1083. yeዕlet yeዓmet
yeፅlet yeዓmet yezemenat gieta

VERSE 7
kezih kadereskegn zemenien satgeta
aqerblzaፃlehu yekbr selamta yeakbrot
selamta
nu enamesgn kelbachn

VERSE 8
yesemayun abatachn
kezih ዕlet kezih ዓmet laderesen
hulachnn /2/
yesew ljoch admie xntunm sijemer

VERSE 9
mn biwexa biwerd bibeza bidemer
and qen aymolam endeante aqoxaxer /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tesfa-anchi-honeshw-yemeden-axa', 'ተስፋ አንቺ ሆነሽው የመደን አጣ', 'ተስፋ አንቺ ሆነሽው የመደን አጣ', 'tesfa anchi honeshw yemeden axa', 'Ethiopian Orthodox Tewahedo Mezmur - ተስፋ አንቺ ሆነሽው የመደን አጣ', 'ሊባኖስ ተራራ ተሰማ ዜና
ምሥራቅ ወለዱ አያቄም ወሐና
ዳግማዊት ሔዋን ምክንያተ ድኅነት
ልደቷን ሰማን በቅድስት ዕለት

VERSE 1
የልደትሽ ቀን ልደታቸን ነው
በአንቺ ነውና ልጅ የተባልነው
ፋራን የተባልሽ ቅድስት ተራራ
በአንቺ መወለድ አለሙ በራ

VERSE 2
679. አፅይንታ ዘርግብ/ 2/ኢያቄም ወለዳ
ኢያቄም ቀለዳ /6 ዘርግብ ኢያቄም ወለዳ/2/
ትርጉም ፡- አይኖቿ የርግብ ዓይን የመሠለ', 'libanos terara tesema ziena
mሥraq weledu ayaqiem weሐna
dagmawit ሔwan mknyate dኅnet
ldetuan seman beqdst ዕlet

VERSE 1
yeldetsh qen ldetachen new
beanchi newna lj yetebalnew
faran yetebalsh qdst terara
beanchi meweled alemu bera

VERSE 2
679. aፅynta zergb/ 2/iyaqiem weleda
iyaqiem qeleda /6 zergb iyaqiem weleda/2/
trgum ፡- aynoቿ yergb ዓyn yemeሠle', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('betsdq-lieda', 'በጽድቅ ሠሌዳ', 'በጽድቅ ሠሌዳ', 'betsdq ሠlieda', 'Ethiopian Orthodox Tewahedo Mezmur - በጽድቅ ሠሌዳ', 'ስሜን ጻፊልኝ
በጽድቅ ሠሌዳ ከሊባኖስ ሰሜን ጻፊልኝ
ነፍሴና ሥጋዬን ከሊባኖስ አደራ አልሻለው
በልጅሽ ጽኑ ፍቅር ከሊባኖስ ተማጽፔሻለው', 'smien tsafilgn
betsdq ሠlieda kelibanos semien tsafilgn
nefsiena ሥgayien kelibanos adera alshalew
beljsh tsnu fqr kelibanos tematspieshalew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nefsna-sgayie', 'ነፍስና ስጋዬ', 'ነፍስና ስጋዬ', 'nefsna sgayie', 'Ethiopian Orthodox Tewahedo Mezmur - ነፍስና ስጋዬ', 'አደራ እልሻለሁ
በልጅሽ ጽኑ ፍቅር
ተማጽፔጌሻለሁ
በልጅሽ ጽኑ ፍቅር

VERSE 1
ተማጽፔጌሻለሁ', 'adera elshalehu
beljsh tsnu fqr
tematspiegieshalehu
beljsh tsnu fqr

VERSE 1
tematspiegieshalehu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amebietie-slsh', 'አመቤቴ ስልሽ', 'አመቤቴ ስልሽ', 'amebietie slsh', 'Ethiopian Orthodox Tewahedo Mezmur - አመቤቴ ስልሽ', 'ስምሽን ስጠራ
አመቤቴ ስልሽ ከሊባኖስ ስምሽን ስጠራ
አመቤቴ ስልሽ ይቀላል ሽክሜ
ቅኔ ማኀኅኀሌቴ ሰዓታት መዝሙሩ

VERSE 1
ያመሰግኑሻል ምድርና ጠፈሩ', 'smshn sxera
amebietie slsh kelibanos smshn sxera
amebietie slsh yqelal shkmie
qnie maኀኅኀlietie seዓtat mezmuru

VERSE 1
yamesegnushal mdrna xeferu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('fexnesh-dreshilgn', 'ፈጥነሽ ድረሺልኝ', 'ፈጥነሽ ድረሺልኝ', 'fexnesh dreshilgn', 'Ethiopian Orthodox Tewahedo Mezmur - ፈጥነሽ ድረሺልኝ', 'ከቅዱሳን ጋራ
ፈጥነሽ ድረሺልኝ
ከሚካኤል ጋራ
ፈጥነሽ ድረሺልኝ

VERSE 1
ከገብርኤል ጋራ
ፈጥነሽ ደረሺልኝ
ከዑራኤል ጋራ
682. አማን በአማን /4/

VERSE 2
አምብርፃሃን ተወለደት /4/
683. እኅትየ መርዓት ማርያም ቅድስት /2/
አምዘመዶሙ ለካህናት /4
አኸ እኅትየ ይብልዋ መላእክት በክብር /2/

VERSE 3
ለማርያም ድንግል /4/
684.. ኢያቄም ወለዳ ኢያቄም /2
ዳዊት ዘመዳ ኢያቄም ወለዳ /4
ፈጥነሽ ድረሺልኝ ከሊበኖስ ከቅዱሳንጋር

VERSE 4
ፈጥነሽ ድረሺልኝ ከሚካኤል ጋር
ፈጥነሽ ድረሺልኝ ከገብርኤል ጋር
ፈጥነሽ ድረሺልኝ ከዑራኤል ጋር
938.ያመሰገናት

VERSE 5
ያመሰገናት /3/ እዝራ በመሰንቆ
አናትነቷ ንጽሕናዋን አውቆ
ያመሰገናት /3/ ዳዊት በመዝሙር
አምባ መጠጊያችን የአምላክ ማኅደር

VERSE 6
ያመሰገናት /3/ ኤፍሬም በውዳሴው
ለምፒልን አላት ፍቀሯ ስለገባው
ያመሰገናት/3/ አባ ሕርያቆስ
ምሳሌ ኣጣለት በመንፈስ ሲቀድስ

VERSE 7
ያመሰገናት /3/ አባ ጊዮርጊስ
አናትነትዋን ፍቅራን ሊያስታውስ
ያመሰገኗት /3/ ካህናት በከበሮ
ልብን በሚመስጥ በሐዘን እሮሮ

VERSE 8
አናመስግናት /3/ ሆነን በአንድነት
አመቤታችንን አመምሕረት
አማላጃቸንን አመምሕረት
939ውዳሴ ማርያም

VERSE 9
ውዳሴ ማርያም አጮኸለሁ
ድንግል እናቴን እጣራለሁ
አንደ አባ ኤፍሬም ነይ ባርኪኝ', 'keqdusan gara
›»
›»
fexnesh dreshilgn

VERSE 1
kemikaiel gara
fexnesh dreshilgn
kegebriel gara
fexnesh dereshilgn

VERSE 2
keዑraiel gara
682. aman beaman /4/
ambrፃሃn teweledet /4/
683. eኅtye merዓt maryam qdst /2/

VERSE 3
amzemedomu lekahnat /4
aኸ eኅtye yblwa melaekt bekbr /2/
lemaryam dngl /4/
684.. iyaqiem weleda iyaqiem /2

VERSE 4
dawit zemeda iyaqiem weleda /4
fexnesh dreshilgn kelibenos keqdusangar
fexnesh dreshilgn kemikaiel gar
fexnesh dreshilgn kegebriel gar

VERSE 5
fexnesh dreshilgn keዑraiel gar
938.yamesegenat
yamesegenat /3/ ezra bemesenqo
anatnetua ntsሕnawan awqo

VERSE 6
yamesegenat /3/ dawit bemezmur
amba mexegiyachn yeamlak maኅder
yamesegenat /3/ iefriem bewdasiew
lempiln alat fqerua slegebaw

VERSE 7
yamesegenat/3/ aba ሕryaqos
msalie ኣxalet bemenfes siqeds
yamesegenat /3/ aba giyorgis
anatnetwan fqran liyastaws

VERSE 8
yamesegenuat /3/ kahnat bekebero
lbn bemimesx beሐzen eroro
anamesgnat /3/ honen beandnet
amebietachnn amemሕret

VERSE 9
amalajachenn amemሕret
939wdasie maryam
wdasie maryam acoኸlehu
dngl enatien exaralehu

VERSE 10
ande aba iefriem ney barkign', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-na-lj-nesh-ye-y-enatu-agziab-r-tareqen', 'የሐና ልጅ ነሽ የፀሐይ እናቱ አግዚአብሔር ታረቀን', 'የሐና ልጅ ነሽ የፀሐይ እናቱ አግዚአብሔር ታረቀን', 'yeሐna lj nesh yeፀሐy enatu agziabሔr tareqen', 'Ethiopian Orthodox Tewahedo Mezmur - የሐና ልጅ ነሽ የፀሐይ እናቱ አግዚአብሔር ታረቀን', 'የሐና ልጅ ነሽ ድንግል የምሥራቅ ደጅ ሁሉ በአንቺ ሆነ
ቅድስት ቅዱሳን 691.ማርያምስ ተሐቱ እም ትካት ውስተ ከርሱ
የፍጥረት አማላጅ ለአዳም ከመ ባሕርይ ፀዓዳ /2
ለእናቷ አንዲት ናት አሰመ በእንቲአሃ ወበእንተ አዝማዲዛ

VERSE 1
ለወለደቻት ተሰቀልኩ ዲበ እፅ ይቤ መድኃኔዓለም /2
የኢያቄም ስጦታ ትርጉም፡- ማርያምማ ታበራለች በአዳም ባሕርይ
ምሣሌም የላት ውስጥ እነደ ነጭ እንቁ በአዳም ባሕርይ ውስጥ /2', 'yeሐna lj nesh dngl yemሥraq dej hulu beanchi hone
qdst qdusan 691.maryams teሐtu em tkat wste kersu
yefxret amalaj leadam keme baሕry ፀዓda /2
leenatua andit nat aseme beentiaሃ webeente azmadiza

VERSE 1
leweledechat teseqelku dibe eፅ ybie medኃnieዓlem /2
yeiyaqiem sxota trgum፡- maryamma taberalech beadam baሕry
mሣliem yelat wsx enede nec enqu beadam baሕry wsx /2', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemgnln-keljsh-kekrstos-yqr-endilen', 'ለምኝልን ከልጅሽ ከክርስቶስ ይቅር እንዲለን', 'ለምኝልን ከልጅሽ ከክርስቶስ ይቅር እንዲለን', 'lemgnln keljsh kekrstos yqr endilen', 'Ethiopian Orthodox Tewahedo Mezmur - ለምኝልን ከልጅሽ ከክርስቶስ ይቅር እንዲለን', 'ቅድስት ሆይ ለምኝልን /2
ለምኝልን ከልጅሽ ከክርስቶስ ይቅር እንዲለን
ቅድስት ሆይ ለምኘፒልን''2/', 'qdst hoy lemgnln /2
lemgnln keljsh kekrstos yqr endilen
qdst hoy lemgnepiln''2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-wan-tesfawa', 'የሔዋን ተስፋዋ', 'የሔዋን ተስፋዋ', 'yeሔwan tesfawa', 'Ethiopian Orthodox Tewahedo Mezmur - የሔዋን ተስፋዋ', 'የአዳም ሕይወት
የኢያቄም የሐና
ፍሬ በረከት
ምክንያተ ድኅነት

VERSE 1
ኪዳነምሕረት
ድንግል ተወለደች
የአምላክ እናት
የሔዋን ተስፋዋ ድንግል ሆይ አትጣይኝ ትላለች/2/

VERSE 2
የአዳም ሕይወት አዝ ----------
የኢያቄም የሐና አኔም በአንቺ እታመናለሁ
ፍሬ በረከት የአምላክ እናት አሳስቢኝ እላለሁ
ምክንያተ ድኅነት በአማላጅነትሽ እድናለሁ/2/

VERSE 3
ኪዳነ ምህረት አዝ -------፦
ድንግል ተወለደች አኛም በአንቺ እንታመናለን
የአምላክ እናት የአምላክ አሳስቢ እንላለን
የሔዋን ተስፋዋ የአዳም ዘር ሕይወት

VERSE 4
የሔዋን ተስፋዋ ለአዳም ዘር ሕይወት', 'yeadam ሕywet
yeiyaqiem yeሐna
frie bereket
mknyate dኅnet

VERSE 1
kidanemሕret
dngl teweledech
yeamlak enat
yeሔwan tesfawa dngl hoy atxaygn tlalech/2/

VERSE 2
yeadam ሕywet az ----------
yeiyaqiem yeሐna aniem beanchi etamenalehu
frie bereket yeamlak enat asasbign elalehu
mknyate dኅnet beamalajnetsh ednalehu/2/

VERSE 3
kidane mhret az -------፦
dngl teweledech agnam beanchi entamenalen
yeamlak enat yeamlak asasbi enlalen
yeሔwan tesfawa yeadam zer ሕywet

VERSE 4
yeሔwan tesfawa leadam zer ሕywet', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zenachn-yxfa', 'ሐዘናችን ይጥፋ', 'ሐዘናችን ይጥፋ', 'ሐzenachn yxfa', 'Ethiopian Orthodox Tewahedo Mezmur - ሐዘናችን ይጥፋ', 'ተወልዳለችና
የዓለም ሁሉ ተስፋ
ሐዘናችን ይጥፋ >> >>
ተወልዳለችና >> >>

VERSE 1
የዓለም ሁሉ ተስፋ >> >>
899. ወእንዘ ትፈትል
ወአንዘ ትፈትል /2/ ወርቅ ወሜላተ ገብርኤል ግብተ/2/
ወይቤላ /2/ አስመ ረከብኪ ሞገሰ በኀበ አግዚአብሔር

VERSE 2
900.የጠሩሽ አንቺን ተማጽነው
የጠሩሽ አንቺን ተማጽነው የዳነኑብሽ
የበላኤ ሰብእ አመቤት የአምላክ አናት
ድንግል አዛኝት ማርያም ቅድስት /2/', 'teweldalechna
yeዓlem hulu tesfa
ሐzenachn yxfa >> >>
teweldalechna >> >>

VERSE 1
yeዓlem hulu tesfa >> >>
899. weenze tfetl
weanze tfetl /2/ werq wemielate gebriel gbte/2/
weybiela /2/ asme rekebki mogese beኀbe agziabሔr

VERSE 2
900.yexerush anchin tematsnew
yexerush anchin tematsnew yedanenubsh
yebelaie sebe amebiet yeamlak anat
dngl azagnt maryam qdst /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ente-bemdr-rewi', 'እንተ በምድር ሥረዊፃ/', 'እንተ በምድር ሥረዊፃ/', 'ente bemdr ሥrewiፃ/', 'Ethiopian Orthodox Tewahedo Mezmur - እንተ በምድር ሥረዊፃ/', 'ወበሰማይ አአጹቂፃ/
ሐረገወይን ሐረገወይን
ድንግል ሐረገወይን
698. አማን በአማን/4/

VERSE 1
አመብርፃዛን ተወልደት/4/
699. ሰአሊ ለነ ማርያም ሰአሊ ለነ 2/
አክሊለ ንጽሐን/2/ ሰአሊ ለነ 4/', 'webesemay aatsuqiፃ/
ሐregeweyn ሐregeweyn
dngl ሐregeweyn
698. aman beaman/4/

VERSE 1
amebrፃzan teweldet/4/
699. seali lene maryam seali lene 2/
aklile ntsሐn/2/ seali lene 4/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nts-t-qdst-eyaln-enamesgnat-2', 'ንጽሕት ቅድስት እያልን እናመስግናት/2/', 'ንጽሕት ቅድስት እያልን እናመስግናት/2/', 'ntsሕt qdst eyaln enamesgnat/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ንጽሕት ቅድስት እያልን እናመስግናት/2/', 'በቤተመቅደስ ኖርሽ በቅድስና/2/
አየተመገብሽ ሰማያዊ መና/2/
አጹብ ነው ድንቅ ነው የአምላካችን ሥራ/2/
የሰጠን ድንግልን አንዳናይ መከራ/2

VERSE 1
የቅዱሳን መላዕክት መዝሙራት
703. እንደአናንያ
አንደ አናንያ አንደአዛርያ እንደ ሚሳኤል
አጽናን እኛን/2/

VERSE 2
አጽናን እኛን/3/ በአምነታችን/2/
704.ሚካኤል
ሚካኤል ገብርኤል ዑራኤል ሱርያል ወፋኑኤል/ሪ/
ሚካኤል ሊቀ መላእክት አማልደን በምሕረትህ

VERSE 3
ልመናችን ቀርቧል ፊተትህ/2/
ገብርኤል ሊቀ መላእክት ሠለስቱ ዲቂቅን ከእሳት
ያወጣህ በእአውነት/2/
በሐዘናችን በመከራችን ቁምልን ከፊታችን

VERSE 4
ዑራኤል ነህ አለኝታችን/ቋ2/
ወላጆችን ሲጨንቃቸው አንዲፈታ ማኅፀናቸው
ሩፋኤል ነህ ረዳታቸው
705.ገብርኤል

VERSE 5
ገብርኤል አብሠራ ለድንግል ወይቤላ:/ሪ2/
ትወለዲ ንጉሥ ገብርኤል ይቤሳላ/2/', 'bebietemeqdes norsh beqdsna/2/
ayetemegebsh semayawi mena/2/
atsub new dnq new yeamlakachn ሥra/2/
yesexen dngln andanay mekera/2

VERSE 1
yeqdusan melaዕkt mezmurat
703. endeananya
ande ananya andeazarya ende misaiel
atsnan egnan/2/

VERSE 2
atsnan egnan/3/ beamnetachn/2/
704.mikaiel
mikaiel gebriel ዑraiel suryal wefanuiel/ri/
mikaiel liqe melaekt amalden bemሕreth

VERSE 3
lmenachn qerbual fiteth/2/
gebriel liqe melaekt ሠlestu diqiqn keesat
yawexah beeawnet/2/
beሐzenachn bemekerachn qumln kefitachn

VERSE 4
ዑraiel neh alegntachn/qua2/
welajochn sicenqachew andifeta maኅፀnachew
rufaiel neh redatachew
705.gebriel

VERSE 5
gebriel abሠra ledngl weybiela:/ri2/
tweledi nguሥ gebriel ybiesala/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amalden-snlh', 'አማልደን ስንልህ', 'አማልደን ስንልህ', 'amalden snlh', 'Ethiopian Orthodox Tewahedo Mezmur - አማልደን ስንልህ', 'አማልደን ስንልህ ስማን እዘንልን/2/
አጽናን አረጋጋን/2/ ገብርኤል
የእኛ መመኪያ አባታችን
አግዚአብሔር ራሱ ክብርን አቀዳጅቶህ

VERSE 1
ለተልዕኮ እንድትፈጥን አድርጎ የሾመህ
አንደ ሦስቱ ሕፃናት አንተን አንደጠሩ
ዛሬም አውጣን ገብርኤል ሆይ ከነፍሳችን ጠላት
አምነት አለን እያልን የቀና ምግባር

VERSE 2
አባክህን ሊቀመላእክት እንድስት ርዳን
መላእክትን ሁሉ ያረጋጋሀቸው
እንተኮ ነህ ኃያል መልአክ ጽኑ ቁሙ ያልካቸው
አኛስ አናምናለን በአማላጅነትህ

VERSE 3
በተሠጠህ በአምላክ ጸጋ ኃይላችን አንተ ነህ
የምሥራች መልአክ ተብለፃሃልና
ደስ አሰኘን ደስታ ስጠን ተጨንቀናልና', 'amalden snlh sman ezenln/2/
atsnan aregagan/2/ gebriel
yeegna memekiya abatachn
agziabሔr rasu kbrn aqedajtoh

VERSE 1
letelዕko endtfexn adrgo yeshomeh
ande ሦstu ሕፃnat anten andexeru
zariem awxan gebriel hoy kenefsachn xelat
amnet alen eyaln yeqena mgbar

VERSE 2
abakhn liqemelaekt endst rdan
melaektn hulu yaregagahachew
enteko neh ኃyal melak tsnu qumu yalkachew
agnas anamnalen beamalajneth

VERSE 3
beteሠxeh beamlak tsega ኃylachn ante neh
yemሥrach melak tebleፃሃlna
des asegnen desta sxen tecenqenalna', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('leene-misaiel-gebriel-leene-ananya', 'ለእነ ሚሳኤል ገብርኤል ለእነ አናንያ', 'ለእነ ሚሳኤል ገብርኤል ለእነ አናንያ', 'leene misaiel gebriel leene ananya', 'Ethiopian Orthodox Tewahedo Mezmur - ለእነ ሚሳኤል ገብርኤል ለእነ አናንያ', 'ረዳት ሆንካቸው ገብርኤል›› ለእነ
አዛርያ
ለኛም መድኃኒት ነህ ገብርኤል፡››
በአምነት ለለመንህ

VERSE 1
ሁሌ ትደርሳለህ ›ገብርኤል›
በአማላጅነትህ
710.የራማው ልዑል
የራማው ልዑል ገብርኤል /4/

VERSE 2
ተመላለስ መሀለችን ስምህን ጠርተን ና
ስንልህ/ሪ/', 'redat honkachew gebriel›› leene
azarya
legnam medኃnit neh gebriel፡››
beamnet lelemenh

VERSE 1
hulie tdersaleh ›gebriel›
beamalajneth
710.yeramaw lዑl
yeramaw lዑl gebriel /4/

VERSE 2
temelales mehalechn smhn xerten na
snlh/ri/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kewakbtn-ltmegb-yn-ltmera', 'ከዋክብትን ልትመግብ ፀሐይን ልትመራ', 'ከዋክብትን ልትመግብ ፀሐይን ልትመራ', 'kewakbtn ltmegb ፀሐyn ltmera', 'Ethiopian Orthodox Tewahedo Mezmur - ከዋክብትን ልትመግብ ፀሐይን ልትመራ', 'ሥልጣን የተሠጠህ
ሥራህ የደመቀ ራጉኤል አንተ ነህ /2/
ራጉኤል መጋቢ ብርሃን/2/ ኸኸ
አዝርእት አብበው ፈክተው

VERSE 1
የሚታዩት አጀጉን ለምልምው/ኸከዝ/ 2/
በፀሐይ ብርሃን በአንተ አጋዥነት ነው /2/
ራጉኤል መጋቤ ብርሃነን /2/ ኸኸ
713.ቅዱስ ገብርኤል ርዳን

VERSE 2
ቅዱስ ገብርኤል ርዳን ሊቀ መላእክት /2/
ልጆችህን አውጣን ከሚነድ እሳት
ልጆችህን አውጣን ከዓለም አሳት
ከማይጠፋው አሳት ከዚያ ነበልባል

VERSE 3
ከጨለማው ሥርዓት ከክፉ ሲኦል
ነፍሳችንን ነጥቆ ሰይጣን እንዳይጎዳን
ዋስ ጠበቃ ሁነን ቅዱስ ገብርኤል ርዳን/2/
ረድኤት በረከትን ጸጋህ አይለየን

VERSE 4
አንለምንሃለን አደራ አእንዳትርቀን
የቀደመው ጠላት ዙሪያችን ከቦናል
ቅዱስ ገብርኤል ድረስ የእግዚአብሔር
ባለሟል/2/

VERSE 5
ናቡከደነጾር ገደል ሲከታች
አሳቱን አንድዶ ከአሳት ቢጥላቸው
ከራሳቸው ፀጉር አንድ እንኳን ሳይጠፋ
ቅዱስ ገብርኤል ደርሶ ሆነላቸው

VERSE 6
ተስፋ/2/
ብቸኝነት ከብዶን ሐዘን ሲያስጨንቀን
አኛ አንጠራፃለን ቅዱስ ገብርኤል ብለን
በፈጣሪያችን ፊት ስለአኛ ቆመሀል

VERSE 7
የነደደብንን እሳት አብርደፃል/2/
ሥልጣንህ ግሩም ነው በአምላክህ ፊት
እንሠግድልሀለን የጸጋ ስግደት
ፈጥነህ የምትሰማን ወዳንተ ስንጮህ', 'ሥlxan yeteሠxeh
ሥrah yedemeqe raguiel ante neh /2/
raguiel megabi brሃn/2/ ኸኸ
azret abbew fektew

VERSE 1
yemitayut ajegun lemlmw/ኸkez/ 2/
beፀሐy brሃn beante agazhnet new /2/
raguiel megabie brሃnen /2/ ኸኸ
713.qdus gebriel rdan

VERSE 2
qdus gebriel rdan liqe melaekt /2/
ljochhn awxan kemined esat
ljochhn awxan keዓlem asat
kemayxefaw asat keziya nebelbal

VERSE 3
kecelemaw ሥrዓt kekfu siol
nefsachnn nexqo seyxan endaygodan
was xebeqa hunen qdus gebriel rdan/2/
rediet bereketn tsegah ayleyen

VERSE 4
anlemnሃlen adera aendatrqen
yeqedemew xelat zuriyachn kebonal
qdus gebriel dres yeegziabሔr
balemual/2/

VERSE 5
nabukedenetsor gedel siketach
asatun anddo keasat bixlachew
kerasachew ፀgur and enkuan sayxefa
qdus gebriel derso honelachew

VERSE 6
tesfa/2/
bchegnnet kebdon ሐzen siyascenqen
agna anxeraፃlen qdus gebriel blen
befexariyachn fit sleagna qomehal

VERSE 7
yenededebnn esat abrdeፃl/2/
ሥlxanh grum new beamlakh fit
enሠgdlhalen yetsega sgdet
fexneh yemtseman wedante sncoh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('719raguiel-kesemayat', '719ራጉኤል ከሰማያት', '719ራጉኤል ከሰማያት', '719raguiel kesemayat', 'Ethiopian Orthodox Tewahedo Mezmur - 719ራጉኤል ከሰማያት', 'ራጉኤል ከሰማያት እኸ
በልዕልና ወረዳ በልዕልና /2/
ፈጣሪያችን አማኑኤል እኸ
ልመናችንን ተቀበል በራጉኤል

VERSE 1
ልመናችን ተቀበል በሩፋኤል
ልመናችን ተቀበል በሚካኤል
ልመናችን ተቀበል በገብርኤል
ሜካኤል ከሰማያት እኸ

VERSE 2
በልዕልና ወረደ በልዕልና
ፈጣሪያችን አማኑኤል እኸ
ልመናችን ተቀበል በሚካኤል
ልመናችን ተቀበል በገብርኤል

VERSE 3
ልመናችን ተቀበል በዑራኤል
ልመናችን ተቀበል በሳቁኤል
ፈጣሪያችን አማኑኤል እኸ
ልመናችን ተቀበል በራጉኤል

VERSE 4
ልመናችን ተቀበል በፋኑኤል
ልመናችን ተቀበል በሚካኤል
ልመናችን ተቀበል በገብርኤል
ገብርኤል ከሰማያት', 'raguiel kesemayat eኸ
belዕlna wereda belዕlna /2/
fexariyachn amanuiel eኸ
lmenachnn teqebel beraguiel

VERSE 1
lmenachn teqebel berufaiel
lmenachn teqebel bemikaiel
lmenachn teqebel begebriel
miekaiel kesemayat eኸ

VERSE 2
belዕlna werede belዕlna
fexariyachn amanuiel eኸ
lmenachn teqebel bemikaiel
lmenachn teqebel begebriel

VERSE 3
lmenachn teqebel beዑraiel
lmenachn teqebel besaquiel
fexariyachn amanuiel eኸ
lmenachn teqebel beraguiel

VERSE 4
lmenachn teqebel befanuiel
lmenachn teqebel bemikaiel
lmenachn teqebel begebriel
gebriel kesemayat', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('belalna-werede-belalna-2', 'በልአልና ወረደ በልአልና''/2/', 'በልአልና ወረደ በልአልና''/2/', 'belalna werede belalna''/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በልአልና ወረደ በልአልና''/2/', 'ምልጃውን ሰምተህ የራጉኤልን/2/
አድነን ጌታ ልጆችህ እንዳንባዝን/2/
ተስፋ ስናደርግ ምሕረትህን/2/
ስለ ወዳጅህ ሕዝብህን አድንልን', 'mljawn semteh yeraguieln/2/
adnen gieta ljochh endanbazn/2/
tesfa snaderg mሕrethn/2/
sle wedajh ሕzbhn adnln', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nqum-bebehlawiene', 'ንቁም በበህላዌነ', 'ንቁም በበህላዌነ', 'nqum bebehlawiene', 'Ethiopian Orthodox Tewahedo Mezmur - ንቁም በበህላዌነ', 'ንቁም በበህላዌነ /2/ እስከ ንረክቦ
ለአምላክነ /2/
ጌታችንን አስክናውቀው በልዕልና
ባለንበት እንጽና

VERSE 1
ይህን ብለህ መላእክትን እንዳረጋጋህ
ቅዱስ ገብርኤል አጽናን በምልጃህ', 'nqum bebehlawiene /2/ eske nrekbo
leamlakne /2/
gietachnn asknawqew belዕlna
balenbet entsna

VERSE 1
yhn bleh melaektn endaregagah
qdus gebriel atsnan bemljah', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lestu-deqiqn-yawexa-keesat', 'ሠለስቱ ደቂቅን ያወጣ ከእሳት', 'ሠለስቱ ደቂቅን ያወጣ ከእሳት', 'ሠlestu deqiqn yawexa keesat', 'Ethiopian Orthodox Tewahedo Mezmur - ሠለስቱ ደቂቅን ያወጣ ከእሳት', 'በሠልስቱ ደቂቅ ናቡከደነጾር ተቆጣ
አሳቱ ነደደ ነበልባሉ ወጣ
ግን ኃያል ገብርኤል ሊያድናቸው መጣ
ገብርኤል ሊቀመላእክት /2/

VERSE 1
ሠለስቱ ደቂቅን ያወጣ ከእሳት
ሠለስቱ ደቂቅ ይባርክዎ ለእግዚአብሔር
ስቡሕኒ ውእቱ ወልዑልኒ ውእቱ ብለው
ምስጋና አቀረቡ ከአሳቱ ላይ ሆነው

VERSE 2
ገብርኤል ሊቀ መላእክት /2/
ሠለስቱ ደቂቅን ያወጣ ከእሳት
ራጉኤል ሊቀ መላእክት /2/
አመ ኀበ ልዑል ወረደ /2/

VERSE 3
መጋቤ ብርዛናት አንሶሳዌ ፋና
ራጉኤል ና /5/ አማላጅ ነህና
ራጉኤል ሊቀ መላእክት /2/
አመ ኀበ ላዕለ ወረደ /2/

VERSE 4
ዑራኤል ሊቀ መላእክት /2/
ለዕዝራ ያጠጣህ ፅዋዐ ሕይወት
በዓለም ፈተና በስቃይ ኩነኔ
ስባዝን ስጨነቅ ስጠበብ ወይ እፄ

VERSE 5
ዑራኤል የእኔ ኃይል ቁምልኝ ከጎኔ
ዑራኤል ሊቀ መላእክት /2/
ለዕዝራ ያጠጣህ ፅዋዐ ሕይወት
724አዕርግ ጸሎተነ

VERSE 6
አፅርግ ጸሎተነ ውስተ ኑኃ ሰማይ /2/
ከመ መዓዛ ፀሐይ /ሇቴ ሊቀ መላእክት /2/
ትርጉም ፡:-', 'beሠlstu deqiq nabukedenetsor teqoxa
asatu nedede nebelbalu wexa
gn ኃyal gebriel liyadnachew mexa
gebriel liqemelaekt /2/

VERSE 1
ሠlestu deqiqn yawexa keesat
ሠlestu deqiq ybarkwo leegziabሔr
sbuሕni wetu welዑlni wetu blew
msgana aqerebu keasatu lay honew

VERSE 2
gebriel liqe melaekt /2/
ሠlestu deqiqn yawexa keesat
raguiel liqe melaekt /2/
ame ኀbe lዑl werede /2/

VERSE 3
megabie brzanat ansosawie fana
raguiel na /5/ amalaj nehna
raguiel liqe melaekt /2/
ame ኀbe laዕle werede /2/

VERSE 4
ዑraiel liqe melaekt /2/
leዕzra yaxexah ፅwaዐ ሕywet
beዓlem fetena besqay kunenie
sbazn sceneq sxebeb wey eፄ

VERSE 5
ዑraiel yeenie ኃyl qumlgn kegonie
ዑraiel liqe melaekt /2/
leዕzra yaxexah ፅwaዐ ሕywet
724aዕrg tselotene

VERSE 6
aፅrg tselotene wste nuኃ semay /2/
keme meዓza ፀሐy /ሇtie liqe melaekt /2/
trgum ፡:-', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dekama-mesluachew-beand-egru-biyayut', 'ደካማ መስሏቸው በአንድ እግሩ ቢያዩት', 'ደካማ መስሏቸው በአንድ እግሩ ቢያዩት', 'dekama mesluachew beand egru biyayut', 'Ethiopian Orthodox Tewahedo Mezmur - ደካማ መስሏቸው በአንድ እግሩ ቢያዩት', 'ባላስድስት ክንፉ ጻድቁ የእኔ አባት
አርሱስ አንበሳ ነው ትናገር ደብረ አስቦ
ሌጌዎን ሲዋረድ አፍረት ተከናንቦ', 'balasdst knfu tsadqu yeenie abat
arsus anbesa new tnager debre asbo
liegiewon siwared afret tekenanbo', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bewengiel-br-n-zbun-yemera-w', 'በወንጌል ብርሃን ሕዝቡን የመራኸው', 'በወንጌል ብርሃን ሕዝቡን የመራኸው', 'bewengiel brሃn ሕzbun yemeraኸw', 'Ethiopian Orthodox Tewahedo Mezmur - በወንጌል ብርሃን ሕዝቡን የመራኸው', 'የኃጢአቱን ባሕር ከፍለህ ያሻገርከው
ኢትዮሏያዊው ሙሴ በመስቀልህ ባርከን
ፍሬ አንድናፈራ ንጽሕ አድርገን/2/', 'yeኃxiatun baሕr kefleh yashagerkew
ityoluayawiw musie bemesqelh barken
frie andnafera ntsሕ adrgen/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemaxen-yebeqah-ye-lasien-menber', 'ለማጠን የበቃህ የሥላሴን መንበር', 'ለማጠን የበቃህ የሥላሴን መንበር', 'lemaxen yebeqah yeሥlasien menber', 'Ethiopian Orthodox Tewahedo Mezmur - ለማጠን የበቃህ የሥላሴን መንበር', 'ሰይጣን ከቶም አይደርስ በፄድክበት ሀገር
ለህሙማን ሁሉ የሆነካቸው ፈውስ
ጠብቀን አቡዬ በሥጋም በነፍስ', 'seyxan ketom ayders beፄdkbet hager
lehmuman hulu yehonekachew fews
xebqen abuyie beሥgam benefs', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeamlakn-bereket-tsegawnm-shtew', 'የአምላክን በረከት ጸጋውንም ሽተው', 'የአምላክን በረከት ጸጋውንም ሽተው', 'yeamlakn bereket tsegawnm shtew', 'Ethiopian Orthodox Tewahedo Mezmur - የአምላክን በረከት ጸጋውንም ሽተው', 'በመከራ ጸኑ ከዲያብሎስ ታግለው
በእምነታቸው ጽናት በአግዚአብሔር ጸጋ
ቅዱሳን አባቶች አግኝታዋል ዋጋ
የእምነቱ ገበሬ ተክለሃይማኖት

VERSE 1
በአምላክህ ታምነህ ድል አደረግኽ', 'bemekera tsenu kediyablos taglew
beemnetachew tsnat beagziabሔr tsega
qdusan abatoch aggntawal waga
yeemnetu geberie tekleሃymanot

VERSE 1
beamlakh tamneh dl aderegኽ', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ande-gebre-ywet-letsdq-enne-2', 'አንደ ገብረሕይወት ለጽድቅ እንነሣ /2/', 'አንደ ገብረሕይወት ለጽድቅ እንነሣ /2/', 'ande gebreሕywet letsdq enneሣ /2/', 'Ethiopian Orthodox Tewahedo Mezmur - አንደ ገብረሕይወት ለጽድቅ እንነሣ /2/', 'ማግኘት ከፈለግን የዘለዓለም ሕይወት
ለጽድቅ እንነሣ አንደ ገብረሕይወት
734.ማርቆስ ዘአንበሳ', 'maggnet kefelegn yezeleዓlem ሕywet
letsdq enneሣ ande gebreሕywet
734.marqos zeanbesa', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mar-was-2-sebakie-wengiel', 'ማርፃዋስ /2/ ሰባኬ ወንጌል', 'ማርፃዋስ /2/ ሰባኬ ወንጌል', 'marፃwas /2/ sebakie wengiel', 'Ethiopian Orthodox Tewahedo Mezmur - ማርፃዋስ /2/ ሰባኬ ወንጌል', 'የምታመልኩትን ኑ ዛሬ ምረጡ
የምስጋናን መሥዋዕት ወደ ኢያሱ አምጡ
የቀለጠውን ወርቅ ጥጃውን ትታችሁ/2/
አግዚአብሔርን ያዙ ይሁን አምላካችሁ/2/

VERSE 1
735.ተክለሄዛይማኖት
ተክለሃይማኖት ተክለ አብ ተክለ ወልድ
ተክለ መንፈስቅዱስ
አባታችን አማልደን አስታርቀን

VERSE 2
ከፈጣሪ ጋር ከአምላካችን/2/
በሦስት ቀን ሥላሴን ያመስገንህ
ከጭንጫ ድንጋይ ውኃ ያፈለቅህ
አባታችን ተክለሃይማኖት

VERSE 3
አማልደን በኃጢአት
አንዳንሞት/2/
አንደ መላእከት ክንፍ የተሠጠህ
ሰማዕት ነቢይ አንድም ካህን ነህ

VERSE 4
መምህራችን ሐዲስ ሐዋርያ /2/
አስተምረን የጽድቅ ባለሞያ/2/', 'yemtamelkutn nu zarie mrexu
yemsganan meሥwaዕt wede iyasu amxu
yeqelexewn werq xjawn ttachhu/2/
agziabሔrn yazu yhun amlakachhu/2/

VERSE 1
735.teklehezaymanot
tekleሃymanot tekle ab tekle weld
tekle menfesqdus
abatachn amalden astarqen

VERSE 2
kefexari gar keamlakachn/2/
beሦst qen ሥlasien yamesgenh
kecnca dngay wኃ yafeleqh
abatachn tekleሃymanot

VERSE 3
amalden beኃxiat
andanmot/2/
ande melaeket knf yeteሠxeh
semaዕt nebiy andm kahn neh

VERSE 4
memhrachn ሐdis ሐwarya /2/
astemren yetsdq balemoya/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ande-surafiel-besemay-siyaxn', 'አንደ ሱራፌል በሰማይ ሲያጥን', 'አንደ ሱራፌል በሰማይ ሲያጥን', 'ande surafiel besemay siyaxn', 'Ethiopian Orthodox Tewahedo Mezmur - አንደ ሱራፌል በሰማይ ሲያጥን', 'በምድር ላይ ረድእ ሆኖ ማገልገሉን
በተሠጠው ጸጋ ሲያስነሣ ሙታን
ክህነቱ ከአንተ ዘንድ ናት', 'bemdr lay rede hono magelgelun
beteሠxew tsega siyasneሣ mutan
khnetu keante zend nat', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bedebr-3-zquala-gedam-ri', 'በደብር/3/ ዝቋላ ገዳም/ሪ/', 'በደብር/3/ ዝቋላ ገዳም/ሪ/', 'bedebr/3/ zquala gedam/ri/', 'Ethiopian Orthodox Tewahedo Mezmur - በደብር/3/ ዝቋላ ገዳም/ሪ/', '737.ማርቆስ ሐዋርያ
ማርቆስ ሐዋርያ ወንጌላዊ ሰማእት/2/
ሰበከ በግብዕ በመላው ዓለም
ሰበከ በአስክንደርያ በመላው ግብዕ /2/

VERSE 1
738.ባርከን አባታችን
ባርከን አባታችን ጻድቅ መነኩሴ
/2/ተክለሃያማኖት
ባርከን አባታችን ጻድቁ መነኩሴ ገብረመንፈስ

VERSE 2
ቅዱስ
ባርከን አባታችን ጻድቁ መነኩሴ አቡነ አረጋዊ
ተወከፍ/3/ ስምዐነ ጸሎታችንን /2/
739.ታማልደናለች

VERSE 3
ታማልደናለች /2/', '737.marqos ሐwarya
marqos ሐwarya wengielawi semaet/2/
sebeke begbዕ bemelaw ዓlem
sebeke beasknderya bemelaw gbዕ /2/

VERSE 1
738.barken abatachn
barken abatachn tsadq menekusie
/2/tekleሃyamanot
barken abatachn tsadqu menekusie gebremenfes

VERSE 2
qdus
barken abatachn tsadqu menekusie abune aregawi
tewekef/3/ smዐne tselotachnn /2/
739.tamaldenalech

VERSE 3
tamaldenalech /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keagziab-r-telkeh-kemot-werkachew', 'ከአግዚአብሔር ተልከህ', 'ከአግዚአብሔር ተልከህ', 'keagziabሔr telkeh ›› kemot ሠwerkachew', 'Ethiopian Orthodox Tewahedo Mezmur - ከአግዚአብሔር ተልከህ', 'ከአግዚአብሔር ተልከህ
ወደ ጋዛ ምድረ በዳ ወረድህ
ተንቢተ ወንጌልን የሠጠህ አንተ ነህ', 'keagziabሔr telkeh
wede gaza mdre beda weredh
tenbite wengieln yeሠxeh ante neh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemekera-gizie-tekle-ymanot', 'በመከራ ጊዜ ተክለ ሃይማኖት', 'በመከራ ጊዜ ተክለ ሃይማኖት', 'bemekera gizie tekle ሃymanot', 'Ethiopian Orthodox Tewahedo Mezmur - በመከራ ጊዜ ተክለ ሃይማኖት', 'በችግሯ ቀን ተክለ ሃይማኖት
አንደ ደረስክላት ተክለ ሃይማኖት
እግዚእ ኀረያንን ተክለ
ሃይማኖት', 'bechgrua qen tekle ሃymanot
ande deresklat tekle ሃymanot
egzie ኀreyann tekle
ሃymanot', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keamlak-bete-xeh-tekle-ymanot', 'ከአምላክ በተሠጠህ ተክለሃይማኖት', 'ከአምላክ በተሠጠህ ተክለሃይማኖት', 'keamlak beteሠxeh tekleሃymanot', 'Ethiopian Orthodox Tewahedo Mezmur - ከአምላክ በተሠጠህ ተክለሃይማኖት', 'በቃል ኪዳንህ ተክለ ሃይማኖት
ህሙማን የሚያድን ተክለ ሃይማኖት
የንፈሮ ውኃህ ተክለ ሃይማኖት
ድውይ የሚፈውስ ተክለ ሃይማኖት

VERSE 1
ግሩም ጸበልህ ተክለ ሃይማኖት', 'beqal kidanh tekle ሃymanot
hmuman yemiyadn tekle ሃymanot
yenfero wኃh tekle ሃymanot
dwy yemifews tekle ሃymanot

VERSE 1
grum tsebelh tekle ሃymanot', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('selamn-a-xugn-kefexari-astarqachhu', 'ሰላምን አሠጡኝ ከፈጣሪ አስታርቃችሁ', 'ሰላምን አሠጡኝ ከፈጣሪ አስታርቃችሁ', 'selamn aሠxugn kefexari astarqachhu', 'Ethiopian Orthodox Tewahedo Mezmur - ሰላምን አሠጡኝ ከፈጣሪ አስታርቃችሁ', 'በሀገራችን ላይ ይደር በረከት ጸጋችሁ
አምላክ በበደላችን በእኛ እዳይከፋ
ምልጃችሁ አይለየን በኃጢአት እንዳንጠፋ
ሰላም ለእናንተ ይሁን ቅዱሳን አባቶች

VERSE 1
ከዓለም ርቃችሁ በጾም ጸሎት የጸናችሁ
በገድል በትሩፋት ዲያብሎስን የረታችሁ
ቅዱሳን አባቶች በአኛ ላይ ይደር ጸጋችሁ
ውርጭ ሀሩሩን ሣትሰለቹ በጸሎት

VERSE 2
የጸናችሁ', 'behagerachn lay yder bereket tsegachhu
amlak bebedelachn beegna edaykefa
mljachhu ayleyen beኃxiat endanxefa
selam leenante yhun qdusan abatoch

VERSE 1
keዓlem rqachhu betsom tselot yetsenachhu
begedl betrufat diyablosn yeretachhu
qdusan abatoch beagna lay yder tsegachhu
wrc harurun ሣtselechu betselot

VERSE 2
yetsenachhu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kexfat-xebqo-aganntnm-ywagal', 'ከጥፋት ጠብቆ አጋንንትንም ይዋጋል', 'ከጥፋት ጠብቆ አጋንንትንም ይዋጋል', 'kexfat xebqo aganntnm ywagal', 'Ethiopian Orthodox Tewahedo Mezmur - ከጥፋት ጠብቆ አጋንንትንም ይዋጋል', 'የእናንተን ጽናት አይቶ እኛንም ታግሶናል
በኃጢአት ስንረታ በምሕረት ጎብኘቶናል
750.ትዌድሶ', 'yeenanten tsnat ayto egnanm tagsonal
beኃxiat snreta bemሕret gobgnetonal
750.twiedso', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('trgum-tsadqu-tekle-ymanot-bzu-hmam', 'ትርጉም፡ ጻድቁ ተክለሃይማኖት ብዙ ህማም', 'ትርጉም፡ ጻድቁ ተክለሃይማኖት ብዙ ህማም', 'trgum፡ tsadqu tekleሃymanot bzu hmam', 'Ethiopian Orthodox Tewahedo Mezmur - ትርጉም፡ ጻድቁ ተክለሃይማኖት ብዙ ህማም', 'የተቀበለባት ቅዱስ አጽሙ ያረፈባት በስሙ
ከታነጹት አድባራት ሁሉ ከፍያለች ኢየሱስ
ክርስቶስ በደሙ የቀደሳት ደብረ ሊባኖስ
ታመሰግነዋለች

VERSE 1
751.ጹና አልባሲሁ
ጴና አልባሲሁ /2/
ለገብረመንፈስቅዱስ ከመጴና ስሄን /2/
አልባሲሁ ዘሜላት /2/

VERSE 2
ዘወረደ ውስተ ገነት /2/', 'yeteqebelebat qdus atsmu yarefebat besmu
ketanetsut adbarat hulu kefyalech iyesus
krstos bedemu yeqedesat debre libanos
tamesegnewalech

VERSE 1
751.tsuna albasihu
phiena albasihu /2/
legebremenfesqdus kemephiena shen /2/
albasihu zemielat /2/

VERSE 2
zewerede wste genet /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beityophya-mdr-yezork-yezieman-tmhrt', 'በኢትዮጵያ ምድር የዞርክ የዜማን ትምህርት', 'በኢትዮጵያ ምድር የዞርክ የዜማን ትምህርት', 'beityophya mdr yezork yezieman tmhrt', 'Ethiopian Orthodox Tewahedo Mezmur - በኢትዮጵያ ምድር የዞርክ የዜማን ትምህርት', 'ያስተማርክ (2)
የክህነትን ሥራ በክብር የፈጸምክ ብጹዕ ነህ /2/
ቅዱስ ያሬድ ብጽዕ ነህ (2)
755 የጻድቃን ከተማ

VERSE 1
የጻድቃን ከተማ ሆነች መንግሥትህ
አምላክ የፈጠርካት ለወገኖችህ /2/
የአራዊት ድምጽ የሌሊቱ ግርማ
በትዕግሥት አለፈ ያን ሁሉ ጨለማ /2/

VERSE 2
ሀብት ንብረትን ተድላን ሁሉ ናቁ
መንግሥትን ብቻ ለማየት ናፈቁ /2/
ቅዱሳን እጆችህ ሰውን የፈጠሩ
ለሰው ልጆች ሲሉ በሐብል ታሠሩ /2/

VERSE 3
ይህንን ሁሉ ነፍስ ቅዱሳንም አይተው
በኀዘን አለፈ መላ ሕይወታቸው /2/
ምሕረትህ የበዛ ቸሩ አምላካችን
በምህረትህ ጎብኛት ኢትዮጵያን /2/

VERSE 4
756.ጸጻድቃንሰ ኢሞቱ', 'yastemark (2)
yekhnetn ሥra bekbr yefetsemk btsuዕ neh /2/
qdus yaried btsዕ neh (2)
755 yetsadqan ketema

VERSE 1
yetsadqan ketema honech mengሥth
amlak yefexerkat lewegenochh /2/
yearawit dmts yelielitu grma
betዕgሥt alefe yan hulu celema /2/

VERSE 2
habt nbretn tedlan hulu naqu
mengሥtn bcha lemayet nafequ /2/
qdusan ejochh sewn yefexeru
lesew ljoch silu beሐbl taሠru /2/

VERSE 3
yhnn hulu nefs qdusanm aytew
beኀzen alefe mela ሕywetachew /2/
mሕreth yebeza cheru amlakachn
bemhreth gobgnat ityophyan /2/

VERSE 4
756.tsetsadqanse imotu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wede-amlak-aqrbum-betsnu-mljachhu-4', 'ወደ አምላክ አቅርቡም በጽኑ ምልጃችሁ /4', 'ወደ አምላክ አቅርቡም በጽኑ ምልጃችሁ /4', 'wede amlak aqrbum betsnu mljachhu /4', 'Ethiopian Orthodox Tewahedo Mezmur - ወደ አምላክ አቅርቡም በጽኑ ምልጃችሁ /4', 'ድንግል አናታችን ከዳነ ምሕረት /2/
ቅድስተ ቅዱሳን የጻድቃን አናት /4
ርኅርኅተ ኅሊና አሳስቢ ከልጀጅሽ /2/
ይቅርታ እንድናገኝ በፍጹም ልመናሽ /4

VERSE 1
758.ቅዱሣን መስክሩ', 'dngl anatachn kedane mሕret /2/
qdste qdusan yetsadqan anat /4
rኅrኅte ኅlina asasbi keljejsh /2/
yqrta endnagegn beftsum lmenash /4

VERSE 1
758.qduሣn meskru', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('fqrun-chernetun-le-lem-ngeru-2', 'ፍቅሩን ቸርነቱን ለዓለም ንገሩ /2/', 'ፍቅሩን ቸርነቱን ለዓለም ንገሩ /2/', 'fqrun chernetun leዓlem ngeru /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ፍቅሩን ቸርነቱን ለዓለም ንገሩ /2/', 'በየዋህ ልቡና ንጹሕ መሥዋዕት
አቤል ግለጽልን ለጽድቅ መሞትን
ኖኅም ተናገረው ለአንተ የታየህን
ዛሬን ብቻ ትተህ ነገን ማሰብህን', 'beyewah lbuna ntsuሕ meሥwaዕt
abiel gletsln letsdq memotn
noኅm tenagerew leante yetayehn
zarien bcha tteh negen masebhn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeys-q-abeba-me-r-re-qal-yetawklya-frie', 'የይስሐቅ አበባ መዓርዒረ ቃል የታውክልያ ፍሬ', 'የይስሐቅ አበባ መዓርዒረ ቃል የታውክልያ ፍሬ', 'yeysሐq abeba meዓrዒre qal yetawklya frie', 'Ethiopian Orthodox Tewahedo Mezmur - የይስሐቅ አበባ መዓርዒረ ቃል የታውክልያ ፍሬ', 'መዓርዒረ ቃል
በኢትዮጵያ ፈካ ደምቆ ሊታይ ዛሬ
ከካህናተ ሰማይ መዓርዒረ ቃል ከሱራፌል ጋራ
መዓርዒረ ቃል

VERSE 1
ስውር ምሥጢር አየህ በምድር ልታፈራ /2/
የይስሐቅ አበባ መዓርዒረ ቃል የታውክልያ ፍሬ
መዓርዒረ ቃል
በኢትዮጵያ ፈካ ደምቆ ሊታይ ዛሬ

VERSE 2
ከካህናተ ሰማይ መዓርዒረ ቃል ከሱራፌል ጋራ
መዓርዒረ ቃል
ስውር ምሥጢር አየህ በምድር ልታፈራ /2/', 'meዓrዒre qal
beityophya feka demqo litay zarie
kekahnate semay meዓrዒre qal kesurafiel gara
meዓrዒre qal

VERSE 1
swr mሥxir ayeh bemdr ltafera /2/
yeysሐq abeba meዓrዒre qal yetawklya frie
meዓrዒre qal
beityophya feka demqo litay zarie

VERSE 2
kekahnate semay meዓrዒre qal kesurafiel gara
meዓrዒre qal
swr mሥxir ayeh bemdr ltafera /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tsdq-te-ymanot-zedebru-sina', 'ጽድቅ ተ/ፃይማኖት ዘደብሩ ሲና', 'ጽድቅ ተ/ፃይማኖት ዘደብሩ ሲና', 'tsdq te/ፃymanot zedebru sina', 'Ethiopian Orthodox Tewahedo Mezmur - ጽድቅ ተ/ፃይማኖት ዘደብሩ ሲና', 'ወኢቲሣ ግሩም መዋኢ አንበሳ
ኸኸ ይበል ኸኸ /2/
ጻድቅ ገብረመንፈስቅዱስ በምድረ ዝቋላ
ወዘምድረ ከብድ መለኮት መንፈሣዊ/2/

VERSE 1
ነበልባላዊ ባሕረ ገዳማዊ
762.ግሩማን መላዕክት
ግሩማን መላእክት /2/ ሱራፊል ወኪሩቤል/2/
ወረዱ ዮም ይትቀበሉከ በብሔር አማን/2/

VERSE 2
ገብረመንፈስቅዱስ ገባሬ ኃይል /2/', 'weitiሣ grum mewai anbesa
ኸኸ ybel ኸኸ /2/
tsadq gebremenfesqdus bemdre zquala
wezemdre kebd melekot menfeሣwi/2/

VERSE 1
nebelbalawi baሕre gedamawi
762.gruman melaዕkt
gruman melaekt /2/ surafil wekirubiel/2/
weredu yom ytqebeluke bebሔr aman/2/

VERSE 2
gebremenfesqdus gebarie ኃyl /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sema-tat-yezihchn-lem-xa-m-beewnet', 'ሰማዕታት የዚህችን ዓለም ጣዕም በእውነት', 'ሰማዕታት የዚህችን ዓለም ጣዕም በእውነት', 'semaዕtat yezihchn ዓlem xaዕm beewnet', 'Ethiopian Orthodox Tewahedo Mezmur - ሰማዕታት የዚህችን ዓለም ጣዕም በእውነት', 'ናቁ/2/
ደማቸውን ስለ እግዚአብሔር አፈሰሱ/2/
ስለ መንግሥተ ሰማያት መራራ ሞትን
ታገሱ/4/', 'naqu/2/
demachewn sle egziabሔr afesesu/2/
sle mengሥte semayat merara motn
tagesu/4/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bereketh-yder-begna-ywet-4', 'በረከትህ ይደር በኛ ሕይወት/4/', 'በረከትህ ይደር በኛ ሕይወት/4/', 'bereketh yder begna ሕywet/4/', 'Ethiopian Orthodox Tewahedo Mezmur - በረከትህ ይደር በኛ ሕይወት/4/', '766.ቅዱስ ጊዮርጊስ/1/
ቅዱሰ ጊዮርጊስ አማለደን/ቋ2/
ከመድኃኔዓለም አስታረቀን/2/
ፈጣሪ አምላካችን ማረን /4/

VERSE 1
በአውነት ይቅር አለን /4/
767.ሕፃን መእሙ
ሕፃን ወአሙ /4/
ክልዔሆሙ ፈጸሙ ገድሎሙ/4/›

VERSE 2
768.,በአምነታቸው
በአምነታቸው ዳኑ ከዚያ ነበልባል/2/
አናንያ አዛርያ ሚሳኤል/ሪ/
ናቡከደነፆር ጨካኙ ንጉሥ

VERSE 3
በባቢሎን ሀገር ጣዖት የሚነግሥ
አያለ ስገዱ አማኙን ሲያምጽ
ወጣቶች ተነሥ በቅናት መንፈስ
አናንያ አዛርያ ሚሳኤል/ሪ/', '766.qdus giyorgis/1/
qduse giyorgis amaleden/qua2/
kemedኃnieዓlem astareqen/2/
fexari amlakachn maren /4/

VERSE 1
beawnet yqr alen /4/
767.ሕፃn meemu
ሕፃn weamu /4/
klዔhomu fetsemu gedlomu/4/›

VERSE 2
768.,beamnetachew
beamnetachew danu keziya nebelbal/2/
ananya azarya misaiel/ri/
nabukedeneፆr cekagnu nguሥ

VERSE 3
bebabilon hager xaዖt yeminegሥ
ayale sgedu amagnun siyamts
wexatoch teneሥ beqnat menfes
ananya azarya misaiel/ri/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('le-ra-w-xayat-ansegdm-eyalu', 'ለሠራኸው ጣያት አንሰግድም እያሉ', 'ለሠራኸው ጣያት አንሰግድም እያሉ', 'leሠraኸw xayat ansegdm eyalu', 'Ethiopian Orthodox Tewahedo Mezmur - ለሠራኸው ጣያት አንሰግድም እያሉ', 'በመንፍስ ቅዱስ ኃይል ልባቸው ሞሉ
የፈጠረን አምላክ ያድናል ሲሉ
ዘናንያን አዛርያ ሚሳኤል /ሪ2/', 'bemenfs qdus ኃyl lbachew molu
yefexeren amlak yadnal silu
zenanyan azarya misaiel /ri2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nebelbal-nedidu-eyaqaxelachew', 'ነበልባል ነዲዱ እያቃጠላቸው', 'ነበልባል ነዲዱ እያቃጠላቸው', 'nebelbal nedidu eyaqaxelachew', 'Ethiopian Orthodox Tewahedo Mezmur - ነበልባል ነዲዱ እያቃጠላቸው', 'በጭካኔ መንፈስ አስወረወራቸው
ገብተው ሲፀልዩ ፍህሙ ሳይነካቸው
መልአኩን ልኮ አበረደላቸው
ገብርኤል /2/ በመስቀል /2/', 'beckanie menfes aswerewerachew
gebtew siፀlyu fhmu saynekachew
melakun lko aberedelachew
gebriel /2/ bemesqel /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('giyorgis-br-nun', 'ጊዮርጊስ ብርፃኑን', 'ጊዮርጊስ ብርፃኑን', 'giyorgis brፃnun', 'Ethiopian Orthodox Tewahedo Mezmur - ጊዮርጊስ ብርፃኑን', 'ጊዮርጊስ ብርሃኑን አበራ/2/
ዱድያኖስ አፈረ ከጣዖቱ ጋራ
ጊዮርጊስ ብርሃኑን አበራ /2/
ለዲያብሎስ ያልሠገደ ጀግናው ጊዮርጊስ

VERSE 1
ደግሞ በዓይን ታየ ክብሩ ሲወደስ
ከሞት አፍ ያወጣት ቤሩታይትን
በሰማእቱ ገድል ድል ሆነ ሠይጣን
ቅዱሱ ሰማዕት ጊዮርጊስ አባታችን

VERSE 2
አሳየ ሥልጣኑን ከሞት እንደሚያድን
መድኃኒት ክርስቶስ የገለጠው ብርዛን
አኛም እንድንድን ከዘመኑ አውሬ
አስቲ አንግለጽለት ክብሩን በዝማሬ

VERSE 3
ተዋሕዶ አበራ ደግሞ እንደገና
ደራጎን ድል ሆኖ ሞቶ ቀርቷልና
ለአሸናፊ ጌታ ለእግዚአብሔር ልዑል
ምስጋና እናቅርብ አንበል አልል

VERSE 4
ጊዮርጊስ አበራ ብርፃን/2/
ሰው በላውም አውሬ ሞተ ደራጎን/2/
ጊዮርጊስ አበራ ብርፃን
770.ምስክረነቱን ገለፀ

VERSE 5
ምስክርነቱን ገለጸ ቂርቆስ ሕፃን/2/
በአሳት ተፈተኖ አለፈኸኸ ፈተና ደስ ይበለን/2/
ቂርቆስ ኢየሉጣን ሁለቱም በአንድ ልብ ምን
ጨከኑት/ሪ2/

VERSE 6
ተቃቅፈው ሲገቡ ወደ አሳት ጋኑ/2/
ሕፃኑ እና አናቱ በአሳት ውስጥ ሲወኙ
ያለ ምንም ፍርሀት/2/
ገብርኤል ተላከ አነርሱን ለማውጣት /2/

VERSE 7
በርዶና ቀዝቅዞ የእሳቱ ነበልባል', 'giyorgis brሃnun abera/2/
dudyanos afere kexaዖtu gara
giyorgis brሃnun abera /2/
lediyablos yalሠgede jegnaw giyorgis

VERSE 1
degmo beዓyn taye kbru siwedes
kemot af yawexat bierutaytn
besemaetu gedl dl hone ሠyxan
qdusu semaዕt giyorgis abatachn

VERSE 2
asaye ሥlxanun kemot endemiyadn
medኃnit krstos yegelexew brzan
agnam endndn kezemenu awrie
asti angletslet kbrun bezmarie

VERSE 3
tewaሕdo abera degmo endegena
deragon dl hono moto qertualna
leashenafi gieta leegziabሔr lዑl
msgana enaqrb anbel all

VERSE 4
giyorgis abera brፃn/2/
sew belawm awrie mote deragon/2/
giyorgis abera brፃn
770.mskrenetun geleፀ

VERSE 5
mskrnetun geletse qirqos ሕፃn/2/
beasat tefeteno alefeኸኸ fetena des ybelen/2/
qirqos iyeluxan huletum beand lb mn
cekenut/ri2/

VERSE 6
teqaqfew sigebu wede asat ganu/2/
ሕፃnu ena anatu beasat wsx siwegnu
yale mnm frhat/2/
gebriel telake anersun lemawxat /2/

VERSE 7
berdona qezqzo yeesatu nebelbal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mexmeqe-melekot', 'መጥመቀ መለኮት', 'መጥመቀ መለኮት', 'mexmeqe melekot', 'Ethiopian Orthodox Tewahedo Mezmur - መጥመቀ መለኮት', 'መጥምቀ መለኮት ዮሐንስ /2/
መንገድ ጠረገ ለኢየሱስ መምጫው
ሊደርስ
ተክለሃይማኖት በጸሎት/2/

VERSE 1
ተክለሃይማኖት በጸሉት የእኛ አባት
ገብረመንፈስቅዱስ ሐዋርያ /2/
ከንሒሳ መጥተው ጸለዩላት ለኢትዮጵያ
ዜና ማርቆስ በጽኑ እምነት/2/

VERSE 2
ፀሐይ አቆሙ እንደ ኢያሱ በደብረ
ብስራት/2/
አመቤታችን ድንግል ማርያም /2/
ምሕረት አሰጭን ከመለኮት

VERSE 3
ከመድኃኔዓለም
መሰቀሉን ይዞ በፈረስ/2/
ከዘንዶ አስጣላት ቤሩታዊትን ቅዱስ
ጊዮርጊስ', 'mexmqe melekot yoሐns /2/
menged xerege leiyesus memcaw
liders
tekleሃymanot betselot/2/

VERSE 1
tekleሃymanot betselut yeegna abat
gebremenfesqdus ሐwarya /2/
kenሒsa mextew tseleyulat leityophya
ziena marqos betsnu emnet/2/

VERSE 2
ፀሐy aqomu ende iyasu bedebre
bsrat/2/
amebietachn dngl maryam /2/
mሕret asecn kemelekot

VERSE 3
kemedኃnieዓlem
meseqelun yzo beferes/2/
kezendo asxalat bierutawitn qdus
giyorgis', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('arsiema', 'አርሴማ', 'አርሴማ', 'arsiema', 'Ethiopian Orthodox Tewahedo Mezmur - አርሴማ', 'አርሴማ አርሴማ ቅድስት ሰማዕት /2/
ምሕረት ለምኝልኝ ከዓለም መድኃኒት
የዓለም አሽንክታብ ሳይስብሽ ጽድቅን
የመረጥሽ የጌታ አገልጋይ አርሴማ

VERSE 1
ቅድስት አንቺ ነሽ
መስቀል ተመርኩዘሽ በዓላማሽሸ የጸናሽ
አርሴማ ቅድስት', 'arsiema arsiema qdst semaዕt /2/
mሕret lemgnlgn keዓlem medኃnit
yeዓlem ashnktab saysbsh tsdqn
yemerexsh yegieta agelgay arsiema

VERSE 1
qdst anchi nesh
mesqel temerkuzesh beዓlamashshe yetsenash
arsiema qdst', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mets-fe-zienahu-leqirqos-menfesawi-wezemenkro', 'መጽሐፈ ዜናሁ ለቂርቆስ መንፈሳዊ ወዘመንክሮ', 'መጽሐፈ ዜናሁ ለቂርቆስ መንፈሳዊ ወዘመንክሮ', 'metsሐfe zienahu leqirqos menfesawi wezemenkro', 'Ethiopian Orthodox Tewahedo Mezmur - መጽሐፈ ዜናሁ ለቂርቆስ መንፈሳዊ ወዘመንክሮ', 'ሰላም/2/
ጸሐፍ ውስተ ልብየ/2/ እንዘ ትገብር ከለመ
ደመክከ አምላካዊ በመስቀል ዘዘነበ/2/
እንተ ቅዱስ ቂርቆስ ሕፃን ለአምላክ ሆንክ

VERSE 1
ምስክር/2/
በአኛም ልብ ጻፍልን /2/ የአምላክን ፍቅር/2/
በአስክንድሮስ ዘመን ነበርክ ታላቅ
አስተዋይ ሕፃን

VERSE 2
አምላክህም ሰጠህ /2/ የክብር አክሊልን/2/
ያ ሁሉ መሣሪያ ሣይስፈራህ የመሥከርክ
የአምላክን ክብር
ድንቅ ነው የአምላክ ሥራ/2/ ለዚህ ሕፃን

VERSE 3
ሰጠው እንዲኖር ሣይፈራ/ሪ/
አትፍሪ እዳልካት እናትህን እኛንም አድነን
ከመከራ/ሪ2/
አንድንድን ርዳን ከዲያብሎስ ጭፍራ

VERSE 4
በጽድቅህ አድለን እንኑር በሥራ/2/
774.ፀሐይ ዘልዳ
ፀሐይ ዘልዳ ኮከብ ዘልዳ/2/
አድነኒ /2/ ጊዮርጊስ እሞተ እዳ/2/

VERSE 5
ከሰው ወገን ያለ አድነኒ
ልክ እንደአንተ ያለ ››
ሰባት ዓመት ሙሉ .››
መከራን የቻለ አድነኒ/2/ ጊዮርጊሰ አሞተ

VERSE 6
አዳ', 'selam/2/
tseሐf wste lbye/2/ enze tgebr keleme
demekke amlakawi bemesqel zezenebe/2/
ente qdus qirqos ሕፃn leamlak honk

VERSE 1
mskr/2/
beagnam lb tsafln /2/ yeamlakn fqr/2/
beaskndros zemen neberk talaq
asteway ሕፃn

VERSE 2
amlakhm sexeh /2/ yekbr akliln/2/
ya hulu meሣriya ሣysferah yemeሥkerk
yeamlakn kbr
dnq new yeamlak ሥra/2/ lezih ሕፃn

VERSE 3
sexew endinor ሣyfera/ri/
atfri edalkat enathn egnanm adnen
kemekera/ri2/
andndn rdan kediyablos cfra

VERSE 4
betsdqh adlen ennur beሥra/2/
774.ፀሐy zelda
ፀሐy zelda kokeb zelda/2/
adneni /2/ giyorgis emote eda/2/

VERSE 5
kesew wegen yale adneni
lk endeante yale ››
sebat ዓmet mulu .››
mekeran yechale adneni/2/ giyorgise amote

VERSE 6
ada', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sb-t-leab-weweld-wemenfesqdus-2', 'ስብሐት ለአብ ወወልድ ወመንፈስቅዱስ/2/', 'ስብሐት ለአብ ወወልድ ወመንፈስቅዱስ/2/', 'sbሐt leab weweld wemenfesqdus/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ስብሐት ለአብ ወወልድ ወመንፈስቅዱስ/2/', 'ዘአንበሩ ብየ አክሊለ ሞገሰ/2/
መዘምረ እኩን ለጊዮርጊስ /6/
776.ከመ ፀብል', 'zeanberu bye aklile mogese/2/
mezemre ekun legiyorgis /6/
776.keme ፀbl', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mekbbe', 'መክብበ', 'መክብበ', 'mekbbe', 'Ethiopian Orthodox Tewahedo Mezmur - መክብበ', 'መክብብ ሰማዕት አለቃ ቅዱስ ጊዮርጊስ ነው
ከመካከላችን አባርልኝ አርቅልን አስወግድልን
778.ቅዱስ ጊዮርጊስ
ቅዱስ ጊዮርጊስ አማላደን/2/ ከመድኃኔለም

VERSE 1
አስታርቀን/2/
ማረን ይቅር አለን/2/ አማኑኤል ታረቀን/2/
ሹመት ለመፈለግ ቅዱስ ጊዮርጊስ
ነገሥታት ዘንድ ፄዶ ››››

VERSE 2
ጣዖት ሲያመልኩ አየ ›› ››
አምላኩ ተክዶ ›› ››
ክርስቲያን ነኝ የሚል ቅዱስ ጊዮርጊስ
በዓለም ሁሉ ጠፍቶ ›› ››

VERSE 3
አኔ አምናለው አለ ›› ››
የአምላኩን ስም ጠርቶ ›› ››
የዓለም ግሣንግሱ ቅዱስ ጊዮርጊስ
ጸባይዋ ሣይገዛህ ››  ››

VERSE 4
ስለ ጌታ ፍቅር ›› ››
ከእናትህ ተለየህ ›› ››
የመፍጫው መሣሪያ ቅዱስ ጊዮርጊስ
በዓይነት ተደቅኖ ›› ››

VERSE 5
አኔ አልፈራም አለ ›› ››
በአምላኩ ተማምኖ ›› ››', 'mekbb semaዕt aleqa qdus giyorgis new
kemekakelachn abarlgn arqln aswegdln
778.qdus giyorgis
qdus giyorgis amaladen/2/ kemedኃnielem

VERSE 1
astarqen/2/
maren yqr alen/2/ amanuiel tareqen/2/
shumet lemefeleg qdus giyorgis
negeሥtat zend ፄdo ››››

VERSE 2
xaዖt siyamelku aye ›› ››
amlaku tekdo ›› ››
krstiyan negn yemil qdus giyorgis
beዓlem hulu xefto ›› ››

VERSE 3
anie amnalew ale ›› ››
yeamlakun sm xerto ›› ››
yeዓlem gሣngsu qdus giyorgis
tsebaywa ሣygezah ››  ››

VERSE 4
sle gieta fqr ›› ››
keenath teleyeh ›› ››
yemefcaw meሣriya qdus giyorgis
beዓynet tedeqno ›› ››

VERSE 5
anie alferam ale ›› ››
beamlaku temamno ›› ››', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yewegieln-tmhrt-qedamie-sema-t', 'የወጌልን ትምህርት ቀዳሜ ሰማዕት', 'የወጌልን ትምህርት ቀዳሜ ሰማዕት', 'yewegieln tmhrt qedamie semaዕt', 'Ethiopian Orthodox Tewahedo Mezmur - የወጌልን ትምህርት ቀዳሜ ሰማዕት', 'ስለመገብካቸው ቀዳሜ ሰማዕት
አይሁዶች ወገሩህ ጨክኖ ልባቸው
በድንጋይ ሲወግሩት ቀዳሜ ሰማዕት
በጣም ተጨነቀ ቀዳሜ ሰማዕት

VERSE 1
ለሚወግሩት ሰዎች ይቅርታን ጠየቀ /2/
የወጌልን ትምህርት ቀዳሜ ሰማዕት
ስለመገብካቸው ቀዳሜ ሰማዕት
አይሁዶች ወገሩህ ጨክኖ ልባቸው

VERSE 2
በድንጋይ ሲወግሩት ቀዳሜ ሰማዕት
በጣም ተጨነቀ ቀዳሜ ሰማዕት
ለሚወግሩት ሰዎች ይቅርታን ጠየቀ /2/', 'slemegebkachew qedamie semaዕt
ayhudoch wegeruh cekno lbachew
bedngay siwegrut qedamie semaዕt
bexam teceneqe qedamie semaዕt

VERSE 1
lemiwegrut sewoch yqrtan xeyeqe /2/
yewegieln tmhrt qedamie semaዕt
slemegebkachew qedamie semaዕt
ayhudoch wegeruh cekno lbachew

VERSE 2
bedngay siwegrut qedamie semaዕt
bexam teceneqe qedamie semaዕt
lemiwegrut sewoch yqrtan xeyeqe /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('seale-rey-le-xiat-leale-wegerwo-2', 'ሰአለ ሥረይ ለኃጢአት ለአለ ወገርዎ /2/', 'ሰአለ ሥረይ ለኃጢአት ለአለ ወገርዎ /2/', 'seale ሥrey leኃxiat leale wegerwo /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሰአለ ሥረይ ለኃጢአት ለአለ ወገርዎ /2/', 'ወይቤ ሥረይ ሎሙ ዘንተ ኃጢአቶሙ
785. ይቤላ ሕፃን ለእሙ
ይቤላ ሕፃን ለአሙ ኢትፍርሂ እም /2/ ነበልባለ
አሳት /2/

VERSE 1
ለአናንያ ወአዛርያ ወሚሳኤል ዘአድጎኖሙ ውአቱ
ያድኅነነ /2/
ሕፃኑ እናቱን አላት እናቴ ሆይ አትፍሪ /2/
የአሳቱን ነበልባል /2/

VERSE 2
አናንያን አዛርያን ሚሳኤልንም ያዳናቸው አኛንም
ያድነናል /2/
786.አምላኮሙ ለክርስቲያን
አምላኮሙ ለክርስቲያን ተመሲሎ ሰብአ መጽአ

VERSE 3
ኀቤየ ወይቤላ ቅዱስ ጊዮርጊስ /2/', 'weybie ሥrey lomu zente ኃxiatomu
/2/
/2/
785. ybiela ሕፃn leemu

VERSE 1
ybiela ሕፃn leamu itfrhi em /2/ nebelbale
asat /2/
leananya weazarya wemisaiel zeadgonomu watu
yadኅnene /2/

VERSE 2
ሕፃnu enatun alat enatie hoy atfri /2/
yeasatun nebelbal /2/
ananyan azaryan misaielnm yadanachew agnanm
yadnenal /2/

VERSE 3
786.amlakomu lekrstiyan
amlakomu lekrstiyan temesilo seba metsa
ኀbieye weybiela qdus giyorgis /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('78-gebarie-menkrat', '78፲ገባሬ መንክራት', '78፲ገባሬ መንክራት', '78፲gebarie menkrat', 'Ethiopian Orthodox Tewahedo Mezmur - 78፲ገባሬ መንክራት', 'ገባሬ መንክራት ጊዮርጊስ በአቁጽሉ ይቡስ
ዓምድ/2/
ተራድአነ በገሀድ ተራድአነ /4', 'gebarie menkrat giyorgis beaqutslu ybus
ዓmd/2/
teradane begehad teradane /4', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('788giyorgis-grum', '788ጊዮርጊስ ግሩም', '788ጊዮርጊስ ግሩም', '788giyorgis grum', 'Ethiopian Orthodox Tewahedo Mezmur - 788ጊዮርጊስ ግሩም', 'ጊዮርጊስ ግሩም በመንፈስቅዱስ ኅቱም /2/
መዓዛ ቅዳሴከ ጥዑም ከመ ጽጌ ገዳም ጊዮርጊስ
ግሩም /2/', 'giyorgis grum bemenfesqdus ኅtum /2/
meዓza qdasieke xዑm keme tsgie gedam giyorgis
grum /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gizie-reftu', 'ጊዜ ዕረፍቱ', 'ጊዜ ዕረፍቱ', 'gizie ዕreftu', 'Ethiopian Orthodox Tewahedo Mezmur - ጊዜ ዕረፍቱ', 'ጊዜ አረፍቱ ለአስጢፋኖስ/2/
አም ልዕልና ወረዳ እግዚአብሔር/ቄ
ለቤተክርስቲያን እና ለአባቶችች የሚዘመሩ', 'gizie areftu leasxifanos/2/
am lዕlna wereda egziabሔr/qie
lebietekrstiyan ena leabatochch yemizemeru', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wesenphier-webekerkedin-be-nqu-we-nphier-2', 'ወሰንጴር ወበከርከዲን በዕንቁ ወሠንጴር/2/', 'ወሰንጴር ወበከርከዲን በዕንቁ ወሠንጴር/2/', 'wesenphier webekerkedin beዕnqu weሠnphier/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ወሰንጴር ወበከርከዲን በዕንቁ ወሠንጴር/2/', 'አረፋቲሃኒ በኢየሩሳሌም ወማኅደፈዲሃኒ በወርቅ
ንጹሕ ወመርህባስ ለኢየሩሳሌም/2/
791.ሃ8ሌ ፃሌ ሃሌ ሉያ/2/
ዛሌ ሃሌ ዛሌ ሉያ/2/

VERSE 1
ሀባ ሰላመከ ለኢትዮጵያ/2/
ዛሌ ሃሌ ዛሌ ሉያ/2/
ስጣት ሰላምን ለኢትዮጵያ', 'arefatiሃni beiyerusaliem wemaኅdefediሃni bewerq
ntsuሕ wemerhbas leiyerusaliem/2/
791.ሃ8lie ፃlie ሃlie luya/2/
zalie ሃlie zalie luya/2/

VERSE 1
haba selameke leityophya/2/
zalie ሃlie zalie luya/2/
sxat selamn leityophya', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zntu-kulu', 'ዝንቱ ኩሉ', 'ዝንቱ ኩሉ', 'zntu kulu', 'Ethiopian Orthodox Tewahedo Mezmur - ዝንቱ ኩሉ', 'ዝንቱ ኩሉ ኮነ ኮነ በማኅደረ ስብሐት//2/
በደብረመድኃኒት/2/
በፈቃደ/4/ እግዚአብሔር /2/', 'zntu kulu kone kone bemaኅdere sbሐt//2/
bedebremedኃnit/2/
befeqade/4/ egziabሔr /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('selam-lekmu', 'ሰላም ለክሙ', 'ሰላም ለክሙ', 'selam lekmu', 'Ethiopian Orthodox Tewahedo Mezmur - ሰላም ለክሙ', 'ሰላም ለክሙ ኦ ማኅበራኒሁ ለክርስቶስ
አለ ተጋባአክሙ ውስተ ዛቲ ማኅደረ ስብፃት/2/
ጳጳሳት ቀሳውስት ወዲያቆናት መሃይምናን
ወመፃሃይምንት ሕዝበ ክርስቲያን/2', 'selam lekmu o maኅberanihu lekrstos
ale tegabaakmu wste zati maኅdere sbፃt/2/
phaphasat qesawst wediyaqonat meሃymnan
wemeፃሃymnt ሕzbe krstiyan/2', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keme-barko-abr-m-leys-q-weldu-2', 'ከመ ባርኮ አብርሃም ለይስሐቅ ወልዱ /2/', 'ከመ ባርኮ አብርሃም ለይስሐቅ ወልዱ /2/', 'keme barko abrሃm leysሐq weldu /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ከመ ባርኮ አብርሃም ለይስሐቅ ወልዱ /2/', '797.ኦ አባ ቅዱስ
ኦ አባ ቅዱስ አቀቦሙ /2/ ለስምከ ወበኃይልክ
እቀቦሙ//ሪ/
ከመይኩኑ አሐደ ብነ ከማነ/2/ ከመ ይኩን/4/

VERSE 1
798. ከጌታዬ ፍቅር
ከጌታዬ ፍቅር የሚለየኝ ማን ነው /2/', '797.o aba qdus
o aba qdus aqebomu /2/ lesmke webeኃylk
eqebomu//ri/
kemeykunu aሐde bne kemane/2/ keme ykun/4/

VERSE 1
798. kegietayie fqr
kegietayie fqr yemileyegn man new /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('agziab-r-keegna-gara-ynoral-lezele-lem-2', 'አግዚአብሔር ከእኛ ጋራ ይኖራል ለዘለዓለም /2/', 'አግዚአብሔር ከእኛ ጋራ ይኖራል ለዘለዓለም /2/', 'agziabሔr keegna gara ynoral lezeleዓlem /2/', 'Ethiopian Orthodox Tewahedo Mezmur - አግዚአብሔር ከእኛ ጋራ ይኖራል ለዘለዓለም /2/', 'የሰማይ ቤታችን አማኑኤል የሠራው /2/
ግንቡ ንጽሕ ውኃ መሠረቱ ደም ነው /2/
ሳይነጋ ተራምደን አንግባ ቤታችን /2/
በደሙ መሥርቶ ከሠራልን ቤት /2/

VERSE 1
ከቶ የት ይገኛል እንዲህ ያለ ቤት /2/
የውኃ ግድግዳ የደም መሠረት//2/
የውኃ ግድግዳ የደም መሠረት /2/
ይኸው አዚህ አለ የሥላሴ ቤት /2/

VERSE 2
ጠላት ቢተባበር ዲያብሎስ ቢያብር /2/
ሊለየን አይችልም ከእግዚአብሔር ፍቅር /2/
799. ቤተክርስቲያን
ቤተክርስቲያን ባሕረ ጥበባት /2/

VERSE 3
አትመረመርም /2/ እጅግ ጥልቅ ናት
በሥጋዊ ጥበብ ለማወቅ ቢቃጣ /2/', 'yesemay bietachn amanuiel yeሠraw /2/
gnbu ntsሕ wኃ meሠretu dem new /2/
saynega teramden angba bietachn /2/
bedemu meሥrto keሠraln biet /2/

VERSE 1
keto yet ygegnal endih yale biet /2/
yewኃ gdgda yedem meሠret//2/
yewኃ gdgda yedem meሠret /2/
yኸw azih ale yeሥlasie biet /2/

VERSE 2
xelat bitebaber diyablos biyabr /2/
lileyen aychlm keegziabሔr fqr /2/
799. bietekrstiyan
bietekrstiyan baሕre xbebat /2/

VERSE 3
atmeremerm /2/ ejg xlq nat
/2/
/2/
beሥgawi xbeb lemaweq biqaxa /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yesew-lj-defaru-amlak-yelem-ale-2', 'የሰው ልጅ ደፋሩ አምላክ የለም አለ /2/', 'የሰው ልጅ ደፋሩ አምላክ የለም አለ /2/', 'yesew lj defaru amlak yelem ale /2/', 'Ethiopian Orthodox Tewahedo Mezmur - የሰው ልጅ ደፋሩ አምላክ የለም አለ /2/', 'በዝናብ አብቅሉ ሚመግብህን
አምላክ የለም ብለህ ካድከው ፈጣሪህን /2/
አእምሮ አለኝ ማለት አእምሮ ማጣት
አንክርዳድ ለመዝራት በሰው ጭንቅላት /2/', 'beznab abqlu mimegbhn
amlak yelem bleh kadkew fexarihn /2/
aemro alegn malet aemro maxat
ankrdad lemezrat besew cnqlat /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ba-r-tekefele-asikitay-merietu', 'ባሕር ተከፈለ አሲኪታይ መሬቱ', 'ባሕር ተከፈለ አሲኪታይ መሬቱ', 'baሕr tekefele asikitay merietu', 'Ethiopian Orthodox Tewahedo Mezmur - ባሕር ተከፈለ አሲኪታይ መሬቱ', 'ፈርዖን ወደቀ አልሠራም ትምክህቱ
ደካሞቹም ጸንተው ተራመዱ
ኃይለኞቹም ይኸው ተዋረዱ', 'ferዖn wedeqe alሠram tmkhtu
dekamochum tsentew teramedu
ኃylegnochum yኸw tewaredu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amlakie-memekiyayie-new-ri', 'አምላኬ መመኪያዬ ነው/ሪ/', 'አምላኬ መመኪያዬ ነው/ሪ/', 'amlakie memekiyayie new/ri/', 'Ethiopian Orthodox Tewahedo Mezmur - አምላኬ መመኪያዬ ነው/ሪ/', '827.እንደ አባቶቻችን
አንደ አባቶቻችን እናቅርብ ምስጋና
ስሙን ለማመስገን ተፈጥረናልና/2/
ዲቦራና ባርቅ ማለዳ ሲቀኙ

VERSE 1
ለምስጋና ቆመው ከአምላክ ሲገናኙ
የአሳፍም ልጆች ጸናጽሉን ይዘው
ይዘምሩ ነበር በአንድነት ሆነው
የዚህ ዓለም ጉድፍ ያልተጨመረበት

VERSE 2
ንጹሑን ምስጋና ለአምላክ አእንሰዋለት
በሰዓትት በማኅሌት ያሬዳዊ ዜማ
አንዘምር ሁላችን ድምጻችን ይሰማ
በምስጋና እንቅረብ ወደ ሰማዩ ክብር

VERSE 3
ዳዊት በሃይማኖት ባለበት ማኅበር
ከበሮ ይመታ በገና ይደርደር
ለስሙ አንቀኝ በምሥጢር አንዘምር
የሰማይ ካህናት ሲዘምሩ አይቶ

VERSE 4
ምሥጢር ተገልጾለት በመንፈስ ተቀኝቶ
በመዝሙረ ዳዊትን ሐዲስና ብሉይ
ይዘምር ነበረ ያሬድ ማኅሌታይ
828.እናምናልን በአብ

VERSE 5
አናምናለን በአብ እናምናለን በወልድ', '827.ende abatochachn
ande abatochachn enaqrb msgana
smun lemamesgen tefexrenalna/2/
diborana barq maleda siqegnu

VERSE 1
lemsgana qomew keamlak sigenagnu
yeasafm ljoch tsenatslun yzew
yzemru neber beandnet honew
yezih ዓlem gudf yaltecemerebet

VERSE 2
ntsuሑn msgana leamlak aensewalet
beseዓtt bemaኅliet yariedawi ziema
anzemr hulachn dmtsachn ysema
bemsgana enqreb wede semayu kbr

VERSE 3
dawit beሃymanot balebet maኅber
kebero ymeta begena yderder
lesmu anqegn bemሥxir anzemr
yesemay kahnat sizemru ayto

VERSE 4
mሥxir tegeltsolet bemenfes teqegnto
bemezmure dawitn ሐdisna bluy
yzemr nebere yaried maኅlietay
828.enamnaln beab

VERSE 5
anamnalen beab enamnalen beweld', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('neger-hulu-bearsu-tekenawene-2', 'ነገር ሁሉ በአርሱ ተከናወነ/2/', 'ነገር ሁሉ በአርሱ ተከናወነ/2/', 'neger hulu bearsu tekenawene/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ነገር ሁሉ በአርሱ ተከናወነ/2/', 'ሰማይና ምድር ክብሩን ተናገሩ
ፈጥሮአቸዋልና አንዲገለጥ ክብሩ
በፈጠረው ፍጥረት የሚታወቅ እርሱ
አግዚአብሔር ይመስገን ስሙን አወድሱ', 'semayna mdr kbrun tenageru
fexroachewalna andigelex kbru
befexerew fxret yemitaweq ersu
agziabሔr ymesgen smun awedsu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('chgrna-desta-lebego-newna', 'ችግርና ደስታ ለበጎ ነውና', 'ችግርና ደስታ ለበጎ ነውና', 'chgrna desta lebego newna', 'Ethiopian Orthodox Tewahedo Mezmur - ችግርና ደስታ ለበጎ ነውና', 'ይህን ያስተማረን ይድረሰው ምስጋና
376. አልል በይ
አልል በይ/4/ ቤተክርስቲያን ሆይ አልል ባይ
አልል ባይ ቅድስት ቤተክርስቲያን

VERSE 1
ችግርና ደስታ ለበጎ ነውና', 'yhn yastemaren ydresew msgana
376. all bey
all bey/4/ bietekrstiyan hoy all bay
all bay qdst bietekrstiyan

VERSE 1
chgrna desta lebego newna', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wletaw-grum-new-kbr-learsu-yhun-2', 'ውለታው ግሩም ነው ክብር ለአርሱ ይሁን/2/', 'ውለታው ግሩም ነው ክብር ለአርሱ ይሁን/2/', 'wletaw grum new kbr learsu yhun/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ውለታው ግሩም ነው ክብር ለአርሱ ይሁን/2/', 'ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም
ምስጋና ይድረሰው ለመድኃኔዓለም/2/', 'rasun awardo egnan akeberen
ሥgawna demun blu xexu alen
melkam eregna new yemiyasaxan yelem
msgana ydresew lemedኃnieዓlem/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('metamegnayie-ersu-newna-ygebawal-kbrna', 'መታመኛዬ እርሱ ነውና ይገባዋል ክብርና', 'መታመኛዬ እርሱ ነውና ይገባዋል ክብርና', 'metamegnayie ersu newna ygebawal kbrna', 'Ethiopian Orthodox Tewahedo Mezmur - መታመኛዬ እርሱ ነውና ይገባዋል ክብርና', 'ምስጋና/2/
ሕጉን እያሰቡን እንቅረብ ወደ እርሱ
ይምረናልና መሐሪ ነው እርሱ
በልባች ይንገሥ ይግባ ከቤታችን

VERSE 1
የሕይወታችን ዋልታ አርሱ ነው
ተስፋችን/2/
ከቶ አላገኝም እርሱን የሚመስል
ነፍሴን የሚያከብራት የሚሠጠኝ ኃይል

VERSE 2
በመከራ ሰዓት ከክፉ የሚያድነኝ
ከየት አገኛለሁ መጠጊያ የሚሆነኝ/2/
በለመለመ መስክ መሸሸጊያዬ ነው
በሰላም ወጥቼ ሰላም እገባለሁ

VERSE 3
ተስፋዬ አርሱ ነው ይመራኛለና
ዘወትር አቀርባለሁ ክብርና ምስጋና
ዘወትር አቀርባለሁ ለአምላኬ ምስጋና
ለአጌስ ይሻለኛል መቅረብ ወደጌታ

VERSE 4
ጋሻዬ ነውና የነፍሴ አለኝታ
ስለዚህ አቀርባለሁ አልርቅም ከደጁ
ጠግቤ አኖራለሁ በበረከት እጁ /2/
835.ድንቅ አደርጎልኛል

VERSE 5
ድንቅ አድርጎልኛል የሠራዊት ንታ /2/
አልረሳኝም አምላክ አነሳኝ ከትቢያ', 'msgana/2/
ሕgun eyasebun enqreb wede ersu
ymrenalna meሐri new ersu
belbach yngeሥ ygba kebietachn

VERSE 1
yeሕywetachn walta arsu new
tesfachn/2/
keto alagegnm ersun yemimesl
nefsien yemiyakebrat yemiሠxegn ኃyl

VERSE 2
bemekera seዓt kekfu yemiyadnegn
keyet agegnalehu mexegiya yemihonegn/2/
belemeleme mesk mesheshegiyayie new
beselam wexchie selam egebalehu

VERSE 3
tesfayie arsu new ymeragnalena
zewetr aqerbalehu kbrna msgana
zewetr aqerbalehu leamlakie msgana
leagies yshalegnal meqreb wedegieta

VERSE 4
gashayie newna yenefsie alegnta
slezih aqerbalehu alrqm kedeju
xegbie anoralehu bebereket eju /2/
835.dnq adergolgnal

VERSE 5
dnq adrgolgnal yeሠrawit nta /2/
alresagnm amlak anesagn ketbiya', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ydresew-msgana-2', 'ይድረሰው ምስጋና', 'ይድረሰው ምስጋና', 'ydresew msgana/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ይድረሰው ምስጋና', 'ፈረሰኛውና ፈረሶቹ
አልቻሉም ባሕሩን ለመሻገር
አርሱ ቆሞአልና ከፊታቸው
ድንቅን የሚሠራ አግዚአብሔር

VERSE 1
ይድረሰው ምስጋና
ጉልበቴ ነህ ኃይሌ ዝማሬዬ ብለው
ተቀኙለት እነ ሙሴ
ይድረሰው ምስጋና

VERSE 2
ተዋጊ ነው አሉት ድል አድራጊ
አግዚአብሔር ለሕዝቡ የሚራራ
ቀላያትን ከድኖ የሚያሰጥም
ልጆቹን በቃዴስ የሚመራ

VERSE 3
ይድረሰው ምስጋና
637.በገና አንሥተን', 'feresegnawna feresochu
alchalum baሕrun lemeshager
arsu qomoalna kefitachew
dnqn yemiሠra agziabሔr

VERSE 1
ydresew msgana
gulbetie neh ኃylie zmarieyie blew
teqegnulet ene musie
ydresew msgana

VERSE 2
tewagi new alut dl adragi
agziabሔr leሕzbu yemirara
qelayatn kedno yemiyasexm
ljochun beqadies yemimera

VERSE 3
ydresew msgana
637.begena anሥten', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ykber-ymesgen-lezele-lem', 'ይክበር ይመስገን ለዘለዓለም/ኃ/', 'ይክበር ይመስገን ለዘለዓለም/ኃ/', 'ykber ymesgen lezeleዓlem/ኃ/', 'Ethiopian Orthodox Tewahedo Mezmur - ይክበር ይመስገን ለዘለዓለም/ኃ/', 'ዓለም ሞኝነት ይመስለዋል
ለአንተ መንበርከክ ይከብደዋል
ፍቅርህን ቀምሰን ዝም አንልም
እንዘምራለን ለዘለዓለም/ሪ2/', 'ዓlem mognnet ymeslewal
leante menberkek ykebdewal
fqrhn qemsen zm anlm
enzemralen lezeleዓlem/ri2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mn-sxota-alen-leersu-yemnkeflew', 'ምን ስጦታ አለን ለእርሱ የምንከፍለው', 'ምን ስጦታ አለን ለእርሱ የምንከፍለው', 'mn sxota alen leersu yemnkeflew', 'Ethiopian Orthodox Tewahedo Mezmur - ምን ስጦታ አለን ለእርሱ የምንከፍለው', 'ምስጋና ነውና ከአኛ የሚፈልገው
ቸሩ አምላካችንን ተመስገን አንበለው
ዓለም እስኪደነቅ ድንቅ አድርጎልናል
እንዲህ ያለዋጋ ጸጋውን ሰጥቶናል

VERSE 1
ትናንት ለእስራኤል ሞገስ የሆናቸው
ስሙን እናመስግን ዛሬም ከእኛ ጋር ነው
አፋችን ይመላ በታላቅ ምስጋና
ከኃጢአቱ ባሕር ተሻግረናል

VERSE 2
ክቡር ሞስጉን አምላክ ቅዱስ እንበለው
ኢሳይያስም በክብር በራእይ እንዳየው
ከቶ ለአግዚአብሔር ምን ይከፈለዋል
ሁሉም የራሱ ነው ማን ምን ይሰጠዋል

VERSE 3
አምስጋኝ ቢቀኝም ክብር ላራሱ ነው
አርሱ በባሕርዩ ዘለዓለም ምስጉን ነው
ሙሴም ዝም አላለም ዳዊትም አልተኛም
በጎቹ ዘመሩ ለመልካሙ አረኛ

VERSE 4
ያሬድ ተመሠጠ ወደ ሰማይ ዓለም
አኛም ከእነርሱ ጋር አንዘምር ዘለዓለም
839.ሳይገባኝ አምላክ
ሳይገባኝ አምላክ ሳይገባን

VERSE 5
ለዚህ ያደረሰከኝ እኔ ማነኝ/2/
ምን ያላደረክልኝ አለ ጌታ ለአኔ
ምንም ባሳዝንህ በምግባሬ
ኃጢአቴን ተመልክተህ ቸል ያላልከኝ

VERSE 6
በሕይወቴ ብዙ ነገር ሠራኸልኝ
ውለታህ ብዙ ነው የአንተ ወሰን የለው
ተናግሬ አኔስ አልጨርሰው
ውድቀቴንም ድክመቴንም አኔ አውቃለሁ

VERSE 7
የጠበቀኝ ቸርነትህ ምሕረትህ ነው
ለማይነገረው ፍቅርህ ግሩም ሥራህ
ልጆችህን የምትጠብቅ ከመከራ
ምን አንመልሳለን ለአንተ ለአምላካችን', 'msgana newna keagna yemifelgew
cheru amlakachnn temesgen anbelew
ዓlem eskideneq dnq adrgolnal
endih yalewaga tsegawn sextonal

VERSE 1
tnant leesraiel moges yehonachew
smun enamesgn zariem keegna gar new
afachn ymela betalaq msgana
keኃxiatu baሕr teshagrenal

VERSE 2
kbur mosgun amlak qdus enbelew
isayyasm bekbr beraey endayew
keto leagziabሔr mn ykefelewal
hulum yerasu new man mn ysexewal

VERSE 3
amsgagn biqegnm kbr larasu new
arsu bebaሕryu zeleዓlem msgun new
musiem zm alalem dawitm altegnam
begochu zemeru lemelkamu aregna

VERSE 4
yaried temeሠxe wede semay ዓlem
agnam keenersu gar anzemr zeleዓlem
839.saygebagn amlak
saygebagn amlak saygeban

VERSE 5
lezih yaderesekegn enie manegn/2/
mn yaladereklgn ale gieta leanie
mnm basaznh bemgbarie
ኃxiatien temelkteh chel yalalkegn

VERSE 6
beሕywetie bzu neger ሠraኸlgn
wletah bzu new yeante wesen yelew
tenagrie anies alcersew
wdqetienm dkmetienm anie awqalehu

VERSE 7
yexebeqegn cherneth mሕreth new
lemaynegerew fqrh grum ሥrah
ljochhn yemtxebq kemekera
mn anmelsalen leante leamlakachn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kemewared-adne-n-lakeberken', 'ከመዋረድ አድነኸን ላከበርከን', 'ከመዋረድ አድነኸን ላከበርከን', 'kemewared adneኸn lakeberken', 'Ethiopian Orthodox Tewahedo Mezmur - ከመዋረድ አድነኸን ላከበርከን', '840.አምላካችን
አምላካችን መድኃኔዓለም ነው
መመኪያችን መድኃኔዓለም ነው
በእልልታ እናመስግነው

VERSE 1
በጨለማው መንደር ስንኖር ታሰረን
ከጥፋት ረግረግ ዲያብሎስ ዘፍቆን
በመስቀል ላይ ሆኖ ከሞት ያዳነን
ምስጋና ይድረሰው መድኃኒታችን

VERSE 2
ከሞት ባሕር ወጣን በእርሱ ቸርነት
በድለን የነበርን አገኘን ምሕረት
በፍቅሩ አረጋጋን አደለን ሰላም
የሰላም ባለቤት መድኃኔዓለም

VERSE 3
ራሱን ሰዋልን ለእኛ በደል ካሣ
ገና ጠላት ሳለን ኃጢአት በዓለም ነግሣ
ያንን የሞት ባሕር አሻግሮናልና
ውለታው ግሩም ነው ይድረሰው ምስጋና

VERSE 4
841.ዘመኔ በከንቱ
ዘመኔ በከንቱ አንዳይፈጸም
መልካም አንድሠራ አርዳኝ መድኃኔዓለም
ኃጢአቴ በዝቶብኝ መኖር አቅቶኛል

VERSE 5
በቤትህ ውስጥ ልጣል ሰላም ይሻለኛል
ድንገት ስትጠራኝ ግራ እንዳይገባኝ
በሕይወት ዘመኔ ለንስሓ አብቃኝ
አንተ የወሰንከው አድሜዬ ሲያበቃ

VERSE 6
ለነፍሴ የሚቆም አድለኝ ጠበቃ/2/
በሞት ሣልገታ ሳይደክሞ ጉልበቴ
አንደምትወደው ልኑር መድኃኒቴ
በሰማይ መንግሥትህ አስበኝ አደራ

VERSE 7
አቁመኝ በቀኝህ ከቅዱሳን ጋራ /2/
642.እኔስ እዘምራለሁ
አኔስ አዘምራለሁ ለሥላሴ /2/
ፈጥሮኛለና እና በሥጋ በነፍሴ', '840.amlakachn
amlakachn medኃnieዓlem new
memekiyachn medኃnieዓlem new
beellta enamesgnew

VERSE 1
becelemaw mender snnor taseren
kexfat regreg diyablos zefqon
bemesqel lay hono kemot yadanen
msgana ydresew medኃnitachn

VERSE 2
kemot baሕr wexan beersu chernet
bedlen yenebern agegnen mሕret
befqru aregagan adelen selam
yeselam balebiet medኃnieዓlem

VERSE 3
rasun sewaln leegna bedel kaሣ
gena xelat salen ኃxiat beዓlem negሣ
yann yemot baሕr ashagronalna
wletaw grum new ydresew msgana

VERSE 4
841.zemenie bekentu
zemenie bekentu andayfetsem
melkam andሠra ardagn medኃnieዓlem
ኃxiatie beztobgn menor aqtognal

VERSE 5
bebieth wsx lxal selam yshalegnal
dnget stxeragn gra endaygebagn
beሕywet zemenie lensሓ abqagn
ante yewesenkew admieyie siyabeqa

VERSE 6
lenefsie yemiqom adlegn xebeqa/2/
bemot ሣlgeta saydekmo gulbetie
andemtwedew lnur medኃnitie
besemay mengሥth asbegn adera

VERSE 7
aqumegn beqegnh keqdusan gara /2/
642.enies ezemralehu
anies azemralehu leሥlasie /2/
fexrognalena ena beሥga benefsie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('hulun-beej-adrgew-hulun-asgezulet', 'ሁሉን በእጅ አድርገው ሁሉን አስገዙለት', 'ሁሉን በእጅ አድርገው ሁሉን አስገዙለት', 'hulun beej adrgew hulun asgezulet', 'Ethiopian Orthodox Tewahedo Mezmur - ሁሉን በእጅ አድርገው ሁሉን አስገዙለት', 'የፍቅር የደስታ አማን በአማን
የበረከት አባት -›› ››
መንግሥቱ ዘለዓለም ኅልፈት የሌለበት
በአፈ መላዕክት የሚመሰገኑት', 'yefqr yedesta aman beaman
yebereket abat -›› ››
mengሥtu zeleዓlem ኅlfet yelielebet
beafe melaዕkt yemimesegenut', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeziyan-yedeg-abat-aman-beaman', 'የዚያን የደግ አባት አማን በአማን', 'የዚያን የደግ አባት አማን በአማን', 'yeziyan yedeg abat aman beaman', 'Ethiopian Orthodox Tewahedo Mezmur - የዚያን የደግ አባት አማን በአማን', 'የአብርሃምን ቤት ›› ››
አንደባረኩለት የእኛንም ባርኩልን
የቤታችን ዋልታ መሠረት ሁኑልን
በመከራ ጊዜ አማን በአማን

VERSE 1
ከጭንቅ የሚያወጡኝ
ስሙን ሳመሰግን ትረካለች ነፍሴ
የአነሙሴን አምላክ የአብርሃሙን ሥላሴ', 'yeabrሃmn biet ›› ››
andebarekulet yeegnanm barkuln
yebietachn walta meሠret hunuln
bemekera gizie aman beaman

VERSE 1
kecnq yemiyawexugn
smun samesegn trekalech nefsie
yeanemusien amlak yeabrሃmun ሥlasie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('man-yqawemegnal-egziab-r-kalelgn-2', 'ማን ይቃወመኛል እግዚአብሔር ካለልኝ/2/', 'ማን ይቃወመኛል እግዚአብሔር ካለልኝ/2/', 'man yqawemegnal egziabሔr kalelgn/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ማን ይቃወመኛል እግዚአብሔር ካለልኝ/2/', 'ኖኅን አንዳዳንከው እኛንም አድነን
ከቀስቱ እንድናመልጥ ምልክትን ስጠን
በትርህ ምርኩዝህ አነርሱ ያጽናኑን
አንተ ከአኛ ጋር ነህ አንፈራም ክፉውን/2/

VERSE 1
845.ኑ ወደ ቤቴል
ኑ ወደ ቤቴል ወደ ሰማያዊት/''/4/
ማደሪያ ነችና ዘለዓለማዊ ቤት ኑ ወደ
ሰማያዊት', 'noኅn andadankew egnanm adnen
keqestu endnamelx mlktn sxen
betrh mrkuzh anersu yatsnanun
ante keagna gar neh anferam kfuwn/2/

VERSE 1
845.nu wede bietiel
nu wede bietiel wede semayawit/''/4/
maderiya nechna zeleዓlemawi biet nu wede
semayawit', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lem-zele-lem', 'ዓለም ዘለዓለም ››', 'ዓለም ዘለዓለም ››', 'ዓlem zeleዓlem ››', 'Ethiopian Orthodox Tewahedo Mezmur - ዓለም ዘለዓለም ››', 'ይህች ቤተ እግዚአብሔር ናት
መምህረ ወንጌል
የምትመግበን የሕይወትን ቃል', 'yhch biete egziabሔr nat
memhre wengiel
yemtmegben yeሕywetn qal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yesema-tat-gedl', 'የሰማዕታት ገድል ››', 'የሰማዕታት ገድል ››', 'yesemaዕtat gedl ››', 'Ethiopian Orthodox Tewahedo Mezmur - የሰማዕታት ገድል ››', 'የሚነገርባት ››
መሠረቷ ማይፈርስ ቅድስት ተዋሕዶ ናት
ተንተርሶ ያያት ሰማያዊት
ያዕቆብ በቤቴል ››

VERSE 1
ዘይቱን የቀባት
የሕይወት መሠላል
ጉልላቷ ኢየሱስ
ከላይ ስለሆነ

VERSE 2
እንገባለን እኛ በእርሱ ሰላመንን
የምስጋና መሥዋዕት ሰማያዊት
በልባች ይዘን ››
ጋሻ ጦር ጾማችን

VERSE 3
ጸሎትን አንግበን
አንሠዋ መሥዋዕቱን በአንድነት ሆነን
846.ተነሥ እንዘምር
ተነሠ እንዘምር በአንድነት ሆነን በአልልታ/2/

VERSE 4
ኸኸኸ ምስጋና በሰማይ ምስጋና በምድር /2/
ለኃያሉ ጌታ ለልዑል አግዚአብሔር
አስፊሪ ነው ያልነው ብዙ ነገር ነበር
ሁሉንም አለፍነው አግዚአብሔር ይመስገን

VERSE 5
ሕዝቦች ደስ ይበለን ሕይወታችን ድኗል
ሰይጣን ጠላታችን አፍሮ ተመልሶአል
አምላክ ሆይ ስምህን ብንጠራው /2/
አልጠገብ አለ ምንኛ ጣፋጭ ነው

VERSE 6
አቤት ያንተ ሥራ ያንገተ ልግስና
ቢነገር አያልቅም ስምህ ነው ገናና
ሰማይ ዙፋንህ ነው ምድር መረገጫ
በዚህም በዚያም ቢሆን በሁሉም አንተ ነህ

VERSE 7
በፄድንበት ሁሉ ትከተለናለህ
ከእንቅፋት ከድንጋይ ትሰውረናለህ
ስለመልካም ሥራህ አለብን ውለት
ሰለማይነገረው የማዳን ስጦታ', 'yeminegerbat ››
meሠretua mayfers qdst tewaሕdo nat
tenterso yayat semayawit
yaዕqob bebietiel ››

VERSE 1
zeytun yeqebat
yeሕywet meሠlal
gullatua iyesus
kelay slehone

VERSE 2
engebalen egna beersu selamenn
yemsgana meሥwaዕt semayawit
belbach yzen ››
gasha xor tsomachn

VERSE 3
tselotn angben
anሠwa meሥwaዕtun beandnet honen
846.teneሥ enzemr
teneሠ enzemr beandnet honen beallta/2/

VERSE 4
ኸኸኸ msgana besemay msgana bemdr /2/
leኃyalu gieta lelዑl agziabሔr
asfiri new yalnew bzu neger neber
hulunm alefnew agziabሔr ymesgen

VERSE 5
ሕzboch des ybelen ሕywetachn dnual
seyxan xelatachn afro temelsoal
amlak hoy smhn bnxeraw /2/
alxegeb ale mngna xafac new

VERSE 6
abiet yante ሥra yangete lgsna
bineger ayalqm smh new genana
semay zufanh new mdr meregeca
bezihm beziyam bihon behulum ante neh

VERSE 7
beፄdnbet hulu tketelenaleh
keenqfat kedngay tsewrenaleh
slemelkam ሥrah alebn wlet
selemaynegerew yemadan sxota', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('liela-mnm-yelem-yemnkefleh-gieta', 'ሌላ ምንም የለም የምንከፍለህ ጌታ', 'ሌላ ምንም የለም የምንከፍለህ ጌታ', 'liela mnm yelem yemnkefleh gieta', 'Ethiopian Orthodox Tewahedo Mezmur - ሌላ ምንም የለም የምንከፍለህ ጌታ', 'መልስ እንድናዘጋጅ ቶሎ ሳንጠራ
ሳለ አንደበታቸን ምስጋናህን ያውራ
ምስጋና በሰማይ ምስጋና በምድር
እስከ ዘለዓለም ለስምህ እንዘምር', 'mels endnazegaj tolo sanxera
sale andebetachen msganahn yawra
msgana besemay msgana bemdr
eske zeleዓlem lesmh enzemr', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemtqer-lem', 'ለምትቀር ዓለም', 'ለምትቀር ዓለም', 'lemtqer ዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - ለምትቀር ዓለም', 'ለምትቀር ዓለም/2/
ለምትቀር ዓለም መታከት መድከም
በዓለም በረሀ ወድቀን አእዳንጠፋ
መጽናት ገባልናል በፍቅር በደስታ

VERSE 1
አምነት ተስፋ ፍቅር እነዚህን ይዘን
ድል ማድረግ አለብን የምትቀር ዓለምን', 'lemtqer ዓlem/2/
lemtqer ዓlem metaket medkem
beዓlem bereha wedqen aedanxefa
metsnat gebalnal befqr bedesta

VERSE 1
amnet tesfa fqr enezihn yzen
dl madreg alebn yemtqer ዓlemn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('besi-l-bereha-endanqer-wedqen', 'በሲዖል በረሀ እንዳንቀር ወድቀን', 'በሲዖል በረሀ እንዳንቀር ወድቀን', 'besiዖl bereha endanqer wedqen', 'Ethiopian Orthodox Tewahedo Mezmur - በሲዖል በረሀ እንዳንቀር ወድቀን', 'ልንቆም ይገባናል በአምነት ተደግፈን
ጌታችን ሲመጣ በግራ ከመቆም
ካሁኑ እንዘጋጅ ነገ የእኛ አይደለም', 'lnqom ygebanal beamnet tedegfen
gietachn simexa begra kemeqom
kahunu enzegaj nege yeegna aydelem', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sealu-lene', 'ሰአሉ ለነ', 'ሰአሉ ለነ', 'sealu lene', 'Ethiopian Orthodox Tewahedo Mezmur - ሰአሉ ለነ', 'ሰአሉ ለነ ቅዱሳን መላእክት/2/
ሰአሉ ለነ ጻድቃን ሰማዕታት
ኀበ አምላክ ምሕረት ሰአሉ ለነ', 'sealu lene qdusan melaekt/2/
sealu lene tsadqan semaዕtat
ኀbe amlak mሕret sealu lene', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tqexlewaleh-leante-aysanhm', 'ትቀጥለዋለህ ለአንተ አይሳንህም', 'ትቀጥለዋለህ ለአንተ አይሳንህም', 'tqexlewaleh leante aysanhm', 'Ethiopian Orthodox Tewahedo Mezmur - ትቀጥለዋለህ ለአንተ አይሳንህም', 'መቃብሩን ከፍተህ መግነዝ የምትፈታ
የሞትም ጌታ ነህ የድሆች አለኝታ
አንተ የመረጥከውን ማነው የሚከሰው
ያከበርከውንስ ማነው የሚቃወመው

VERSE 1
በሰው ፊት የሚታይ ደም ግባት ባይኖረኝ
ጸጋህ ይበቃኛል አዘምራለሁኝ
አኔስ ቀንቻለሁ አምላኬ ለክብርህ
በልቡናዬ ውስጥ እስኪሳል መስቀልህ

VERSE 2
የተጋረደውን አዚሙን አጥፋልኝ
ውለታህን አውቄ በአንተ ደስ አንዲለኝ
852ዓይኖቼ
ዓይኖቼ ማዳኑን አይተዋልና/2/

VERSE 3
ይገበዋል /2/ ክብርና ምስጋና
ከሰማይ ወረደ ሰውን በማፍቀር
ኃያሉ ጌታቸን ቸሩ አግዚአብሔር
በቤቴልሔም ዋሻ በዚያ በግርግም

VERSE 4
ተወለደ ዛሬ መድኃኔዓለም
የተነበዩለት ብዙ ነቢያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉር አነሣን ከትቢያ

VERSE 5
በአንድነት እንዘምር አንበል ሃሌ ሉያ
የተናቅን ስንሆን አኛን ሊያከብር ወድዶ
በፍቅር አከበረን አራሱን አዋርዶ
ምን አይነት ፍቅር ነው ፍጹም ምሕረት

VERSE 6
የአምላክ መወለድ በከብቶች በረት
በንጽሕና ጸንተሸ ቤተ መቅደስ የኖርሽ
በኅቱም ድንግልና መድኃኒትን ወለድሽ
የዓለምን ኃጥአት የሚያስተሠርይ ጌታ

VERSE 7
ተወልዲል ከድንግል የሰዎች አለኝታ
853.አደርገህልኛልና
አደርገህልኛለና በቸርነትህ/2/
አመስግንዛለሁ እልል እልል /2', 'meqabrun kefteh megnez yemtfeta
yemotm gieta neh yedhoch alegnta
ante yemerexkewn manew yemikesew
yakeberkewns manew yemiqawemew

VERSE 1
besew fit yemitay dem gbat baynoregn
tsegah ybeqagnal azemralehugn
anies qenchalehu amlakie lekbrh
belbunayie wsx eskisal mesqelh

VERSE 2
yetegaredewn azimun axfalgn
wletahn awqie beante des andilegn
852ዓynochie
ዓynochie madanun aytewalna/2/

VERSE 3
ygebewal /2/ kbrna msgana
kesemay werede sewn bemafqer
ኃyalu gietachen cheru agziabሔr
bebietielሔm washa beziya begrgm

VERSE 4
tewelede zarie medኃnieዓlem
yetenebeyulet bzu nebiyat
kedngl teweldo adanen beewnet
kebedel gurangur aneሣn ketbiya

VERSE 5
beandnet enzemr anbel ሃlie luya
yetenaqn snhon agnan liyakebr weddo
befqr akeberen arasun awardo
mn aynet fqr new ftsum mሕret

VERSE 6
yeamlak meweled bekebtoch beret
bentsሕna tsenteshe biete meqdes yenorsh
beኅtum dnglna medኃnitn weledsh
yeዓlemn ኃxat yemiyasteሠry gieta

VERSE 7
teweldil kedngl yesewoch alegnta
853.adergehlgnalna
adergehlgnalena becherneth/2/
amesgnzalehu ell ell /2', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keto-endeante-manew-ru-ru-abat-2', 'ከቶ እንደአንተ ማነው ሩኅሩኅ አባት/2/', 'ከቶ እንደአንተ ማነው ሩኅሩኅ አባት/2/', 'keto endeante manew ruኅruኅ abat/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ከቶ እንደአንተ ማነው ሩኅሩኅ አባት/2/', 'ከቶ እንደአንተ ማነው ሩኅሩኅ አባት/2/
ከቶ እንደአንተ ማነው ሩኅሩኅ አባት/2/
ከቶ እንደአንተ ማነው ሩኅሩኅ አባት/2/
ከቶ እንደአንተ ማነው ሩኅሩኅ አባት/2/', 'keto endeante manew ruኅruኅ abat/2/
keto endeante manew ruኅruኅ abat/2/
keto endeante manew ruኅruኅ abat/2/
keto endeante manew ruኅruኅ abat/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('adfeni-kege-nem-asat-xefto-kemayxefaw', 'አድፈኒ ከገፃነም አሳት ጠፍቶ ከማይጠፋው', 'አድፈኒ ከገፃነም አሳት ጠፍቶ ከማይጠፋው', 'adfeni kegeፃnem asat xefto kemayxefaw', 'Ethiopian Orthodox Tewahedo Mezmur - አድፈኒ ከገፃነም አሳት ጠፍቶ ከማይጠፋው', 'ከዚያ አስፈሪ አውሬ ከሚንቀላፋው
ከሰይጣን አሥራት ከዳግመኛ ሞት
አግዚአብሔር ሆይ ርዳኝ እንዳልቀር ከቤትህ', 'keziya asferi awrie keminqelafaw
keseyxan aሥrat kedagmegna mot
agziabሔr hoy rdagn endalqer kebieth', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('adfeni', 'አድፈኒ', 'አድፈኒ', 'adfeni', 'Ethiopian Orthodox Tewahedo Mezmur - አድፈኒ', 'ማዕበሉ አወኮኝ አንዳልንገላታ
ሞገድ እንዳይጥለኝ ርዳኝ የአኔ ጌታ
ከክፉ ፈተና ከምማረርበት
አድፈኒ ከሐሜት ከስርቆት ከኃጢአት ባርነት

VERSE 1
ከጨለማ መንገድ ሕይወት ከሌለበት
ከድፍረተ ኃጢአት አምላክ ከሚያዝንበት
ከተንኮል ከበቀል ቁጣ ከበዛበት
አድፈኒ ዛሬ ካለሁበት ከኃጢአት ወጥመድ

VERSE 2
በዚያ በምጽዓት ቀን በእኔ ከመርፈድ
የኃጢአት በሽታ አዳልጦ እንዳይጥለኝ
አግዚአብሔር አምላክ ሆይ አደራ ደግፈኝ', 'maዕbelu awekogn andalngelata
moged endayxlegn rdagn yeanie gieta
kekfu fetena kemmarerbet
adfeni keሐmiet kesrqot keኃxiat barnet

VERSE 1
kecelema menged ሕywet kelielebet
kedfrete ኃxiat amlak kemiyaznbet
ketenkol kebeqel quxa kebezabet
adfeni zarie kalehubet keኃxiat wexmed

VERSE 2
beziya bemtsዓt qen beenie kemerfed
yeኃxiat beshta adalxo endayxlegn
agziabሔr amlak hoy adera degfegn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lus-qdus-belu', 'ሥሉስ ቅዱስ በሉ', 'ሥሉስ ቅዱስ በሉ', 'ሥlus qdus belu', 'Ethiopian Orthodox Tewahedo Mezmur - ሥሉስ ቅዱስ በሉ', 'የሙሴ እህት ማርያም ከበሮውን እንሺ
በምስጋና መዝሙር እስራኤልን ጥሪው
አምላክን እናክብር እንዘምር በእልልታ
ከእኛ ጋር ይሆናል የሠራዊት ጌታ /2/', 'yemusie eht maryam keberown enshi
bemsgana mezmur esraieln xriw
amlakn enakbr enzemr beellta
keegna gar yhonal yeሠrawit gieta /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keberow-ymeta-begenaw-yderder-2', 'ከበሮው ይመታ በገናው ይደርደር /2/', 'ከበሮው ይመታ በገናው ይደርደር /2/', 'keberow ymeta begenaw yderder /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ከበሮው ይመታ በገናው ይደርደር /2/', 'ወገኖች እንዘምር ለእግዚአብሔር ክብር
ውለታው ብዙ ነው ለእኛ ያለው ፍቅር
ማዳኑን ያያችሁ ዘምሩ በእልልታ
ለጌታ ለእግዚአብሔር ለሠራዊት ጌታ /2/', 'wegenoch enzemr leegziabሔr kbr
wletaw bzu new leegna yalew fqr
madanun yayachhu zemru beellta
legieta leegziabሔr leሠrawit gieta /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-xiat-shekmie-qelelegn-2', 'የኃጢአት ሸክሜ ቀለለኝ/2/', 'የኃጢአት ሸክሜ ቀለለኝ/2/', 'yeኃxiat shekmie qelelegn/2/', 'Ethiopian Orthodox Tewahedo Mezmur - የኃጢአት ሸክሜ ቀለለኝ/2/', 'አስቲ ላነሣሣው የዳዊትን መዝሙር
አምላኬን ላመስገን በደስታ በፍቅር
በልቤ አያሠብኩኝ ለኔ ያለውን ፍቅር/.2.', 'asti laneሣሣw yedawitn mezmur
amlakien lamesgen bedesta befqr
belbie ayaሠbkugn lenie yalewn fqr/.2.', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beante-tamgnalew-zelalem-alfer', 'በአንተ ታምኛለው ዘላለም አልፈር', 'በአንተ ታምኛለው ዘላለም አልፈር', 'beante tamgnalew zelalem alfer', 'Ethiopian Orthodox Tewahedo Mezmur - በአንተ ታምኛለው ዘላለም አልፈር', 'በጽድቅ ልመራ በፍቅር እንድኖር
ጆሮህን አዘንብልህ ፈጥነህ አድነኝ
መንገዴን አቅንተህ በሕይወት ምራኝ', 'betsdq lmera befqr endnor
jorohn azenblh fexneh adnegn
mengedien aqnteh beሕywet mragn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ambana-mexegiya-mesheshegiya-hunegn', 'አምባና መጠጊያ መሸሸጊያ ሁነኝ', 'አምባና መጠጊያ መሸሸጊያ ሁነኝ', 'ambana mexegiya mesheshegiya hunegn', 'Ethiopian Orthodox Tewahedo Mezmur - አምባና መጠጊያ መሸሸጊያ ሁነኝ', 'በድካሜ ጊዜ የለም የሚረዳኝ
የእውነት አምላክነህ አቤቱ ተቤዥን
ከአንተ በቀር ለእኛ ምንም ተስፋ የለን', 'bedkamie gizie yelem yemiredagn
yeewnet amlakneh abietu tebiezhn
keante beqer leegna mnm tesfa yelen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-ywetie-br-n-metamegnayie-neh', 'የሕይወቴ ብርሃን መታመኛዬ ነህ', 'የሕይወቴ ብርሃን መታመኛዬ ነህ', 'yeሕywetie brሃn metamegnayie neh', 'Ethiopian Orthodox Tewahedo Mezmur - የሕይወቴ ብርሃን መታመኛዬ ነህ', 'ዝም አትበለኝ አንተ አቤቱ ስጠራህ
በመከራዬ ቀን አቤቱ ሠውረኝ
በቃልህ አንድኖር በምሕረትህ ጎብኘኝ', 'zm atbelegn ante abietu sxerah
bemekerayie qen abietu ሠwregn
beqalh andnor bemሕreth gobgnegn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('andashnf-erdagn-ye-lemn-fetena', 'አንዳሽንፍ እርዳኝ የዓለምን ፈተና', 'አንዳሽንፍ እርዳኝ የዓለምን ፈተና', 'andashnf erdagn yeዓlemn fetena', 'Ethiopian Orthodox Tewahedo Mezmur - አንዳሽንፍ እርዳኝ የዓለምን ፈተና', 'ጠላቴ እንዲያፍር በእምነት እንድጸና
አንተ ተዋጋና አንዳልወድቅ እርዳኝ
ከጎኔ አትለየኝ ብርታትን ስጠኝ', 'xelatie endiyafr beemnet endtsena
ante tewagana andalwedq erdagn
kegonie atleyegn brtatn sxegn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('br-n-yelebesew', 'ብርሃን የለበሰው', 'ብርሃን የለበሰው', 'brሃn yelebesew', 'Ethiopian Orthodox Tewahedo Mezmur - ብርሃን የለበሰው', 'ብርሃን የለበሰው በሰማያት ያለው/2/
እንደ እግዚአብሔር ከቶ ማንም የለም/2/
ውዣችን በአፍኙ የሠፈረ
ተራሮችን በሚዛን የመዘነ

VERSE 1
ሰማይን በስንዝር የሚለካ
ዘመንን በዘመን የሚተካ/2/', 'brሃn yelebesew besemayat yalew/2/
ende egziabሔr keto manm yelem/2/
wzhachn beafgnu yeሠfere
terarochn bemizan yemezene

VERSE 1
semayn besnzr yemileka
zemenn bezemen yemiteka/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kehali-kulu-hulunm-yemiyawq', 'ከሀሊ ኩሉ ሁሉንም የሚያውቅ', 'ከሀሊ ኩሉ ሁሉንም የሚያውቅ', 'kehali kulu hulunm yemiyawq', 'Ethiopian Orthodox Tewahedo Mezmur - ከሀሊ ኩሉ ሁሉንም የሚያውቅ', 'ፈታፄ በጽድቅ ሥራው ረቂቅ
ዓለምን የመላ ፈጥሮ የሚገዛ
መዓቱ የራቀ ምሕረቱ የበዛ/2/', 'fetaፄ betsdq ሥraw reqiq
ዓlemn yemela fexro yemigeza
meዓtu yeraqe mሕretu yebeza/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sheahuns-tesfayie-manew', 'ሸአሁንስ ተስፋዬ ማነው', 'ሸአሁንስ ተስፋዬ ማነው', 'sheahuns tesfayie manew', 'Ethiopian Orthodox Tewahedo Mezmur - ሸአሁንስ ተስፋዬ ማነው', 'አሁንስ ተስፋ ማነው/2/
አግዚአብሔር አይደለምን /2/
በአንደበቴ እንዳልስት መንገዴን ጠበቅህ
ለአፌ ጠባቂ አንዳለ አውቅሁ

VERSE 1
ከኃጢአቴ ሁሉ አንተ አድነኝ
ለሰነፎች ስድብ ከቶ አታድርገኝ
የባሪያህን ጩኸት አቤቱ ስማኝ
የነጻ ልቦና አምላኬ ሆይ አድለኝ

VERSE 2
በቃልህ ሰባብረው ድንጋዩን ልቤን
ሕግን እንድፈፅም ስጠኝ ፍቃድህን
ተስፋዬ ስለሆንክ ከማንም በላይ
ወደ አኔ ተመልከት አምላክ አዶናይ

VERSE 3
ተስፋ ስላደረኩ አንተ አምላኬን
የልመናዬም ድምጽ ይሰማ አሁን', 'ahuns tesfa manew/2/
agziabሔr aydelemn /2/
beandebetie endalst mengedien xebeqh
leafie xebaqi andale awqhu

VERSE 1
keኃxiatie hulu ante adnegn
lesenefoch sdb keto atadrgegn
yebariyahn cuኸt abietu smagn
yenetsa lbona amlakie hoy adlegn

VERSE 2
beqalh sebabrew dngayun lbien
ሕgn endfeፅm sxegn fqadhn
tesfayie slehonk kemanm belay
wede anie temelket amlak adonay

VERSE 3
tesfa sladereku ante amlakien
yelmenayiem dmts ysema ahun', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mot-new-rehab-2', 'ሞት ነው ረሀብ', 'ሞት ነው ረሀብ', 'mot new rehab', 'Ethiopian Orthodox Tewahedo Mezmur - ሞት ነው ረሀብ', 'ሞት ነው ረሀብ ከክርስቶስ ፍቅር የሚለየኝ /2/
ኃይሉ በእኛ ላይ አድሮ እንበረታለን
ጸጋው በእና ላይ አድሮ እንበረታለን
ከአንተ ርቀው ሸሽተው የፄዱ

VERSE 1
ጠፋባቸው የጽድቅ መንገዱ
በሥጋዊ ጥበብ ሲፈልጉህ
በመታለል ስንቶቹ አንተን አጡህ
በተዋሕዶ የከበርከው ጌታ', 'mot new rehab kekrstos fqr yemileyegn /2/
ኃylu beegna lay adro enberetalen
tsegaw beena lay adro enberetalen
keante rqew sheshtew yeፄdu

VERSE 1
xefabachew yetsdq mengedu
beሥgawi xbeb sifelguh
bemetalel sntochu anten axuh
betewaሕdo yekeberkew gieta', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('slefqrh-fesese-demachew', 'ስለፍቅርህ ፈሰሰ ደማቸው', 'ስለፍቅርህ ፈሰሰ ደማቸው', 'slefqrh fesese demachew', 'Ethiopian Orthodox Tewahedo Mezmur - ስለፍቅርህ ፈሰሰ ደማቸው', 'ዛሬም ለእኛ ጸጋህን አብዛልን
አንዳንደክም ፈተና ሲገጥመን
ጋሻ ሆነህ እንድትመክትልን
ቸር አምላክ ሆይ ወደ እንተ እንጮፃለን

VERSE 1
ቢገጥመንም ችግር ወይ መከራ
አትለየን ጌታ ከእኛ ጋራ
864.ክሌ ሉያ
ፃሌ ሉያ በሰማያት ላለው

VERSE 2
ዓለማትን ፈጥሮ ለሚገዛው
አንዘምራለሁ አእቀኝለታለሁ
ጌትነቱን ክብሩን አደንቃለሁ
ገናና ነው ክብርን የተመላ

VERSE 3
ድንቅ የሚያደርግ የለም ከእርሱ ሌላ
ጉልበት ሁሉ ለስሙ ይሰግዳል
ከአማልክት እርሱን ማን ይመስላል
ልብሱ ዘርፍ መቅደሱ ተሞልቶ

VERSE 4
ስለክብሩ በገና ተቃኝቶ
ምስጋናችን በእጣኑ ጢስ ሲያርግ
ይመስጣል ያ የሰማዩን ሠርግ
ሲቀኝለት ዳዊት በማኅሌት

VERSE 5
ቅዱስ ሲሉ ሱራፊል በኅብረት
ከዙፋኑ ምሕረት ይታወጃል
በምድራቸን ሰላም ፍቅር ይሰፍናል
መሰወሪያው የአሳት ነበልባል ነው

VERSE 6
ሠረገላው ነፋስ ደመና ነው
የአግዚአብሔር ስም የጸና ግንብ ነው
ለሚፈሩት ኃይልና ብርታት ነው
865.እንደአብርፃም እንሁን

VERSE 7
አንደ አብርፃም እንሁን አንደሣራ/2/
አንግዳ አንቀበል በየተራ
የተራበ አናብላ እንደአብርፃም
የታረዘ አናልብስ እንደሣራ', 'zariem leegna tsegahn abzaln
andandekm fetena sigexmen
gasha honeh endtmektln
cher amlak hoy wede ente encoፃlen

VERSE 1
bigexmenm chgr wey mekera
atleyen gieta keegna gara
864.klie luya
ፃlie luya besemayat lalew

VERSE 2
ዓlematn fexro lemigezaw
anzemralehu aeqegnletalehu
gietnetun kbrun adenqalehu
genana new kbrn yetemela

VERSE 3
dnq yemiyaderg yelem keersu liela
gulbet hulu lesmu ysegdal
keamalkt ersun man ymeslal
lbsu zerf meqdesu temolto

VERSE 4
slekbru begena teqagnto
msganachn beexanu xis siyarg
ymesxal ya yesemayun ሠrg
siqegnlet dawit bemaኅliet

VERSE 5
qdus silu surafil beኅbret
kezufanu mሕret ytawejal
bemdrachen selam fqr ysefnal
meseweriyaw yeasat nebelbal new

VERSE 6
ሠregelaw nefas demena new
yeagziabሔr sm yetsena gnb new
lemiferut ኃylna brtat new
865.endeabrፃm enhun

VERSE 7
ande abrፃm enhun andeሣra/2/
angda anqebel beyetera
yeterabe anabla endeabrፃm
yetareze analbs endeሣra', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yetexemu-yxexu-endeabr-m', 'የተጠሙ ይጠጡ እንደአብርሃም', 'የተጠሙ ይጠጡ እንደአብርሃም', 'yetexemu yxexu endeabrሃm', 'Ethiopian Orthodox Tewahedo Mezmur - የተጠሙ ይጠጡ እንደአብርሃም', 'ይብሉ የተራቡ አንደሣራ
አንደአብርሃፃም ቤት አእንደአብርፃም
ሥላሴ አንዲገቡ እንደሣራ', 'yblu yeterabu andeሣra
andeabrሃፃm biet aendeabrፃm
ሥlasie andigebu endeሣra', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ande-abatochachn-andeabr-m', 'አንደ አባቶቻችን አንደአብርፃም', 'አንደ አባቶቻችን አንደአብርፃም', 'ande abatochachn andeabrፃm', 'Ethiopian Orthodox Tewahedo Mezmur - አንደ አባቶቻችን አንደአብርፃም', 'የዋሆች ሆነን አንደ ሣራ
እንግዳ እንቀበል አንደ አብርሃም
በማጠብ አግርን እንደ ሣራ
866.ኃይልን በሚሠጠኝ

VERSE 1
ኃይልን በሚሠጠኝ በክርስቶስ ሁሉን አችላለሁ/2/
ፈተና ቢገጠግመኝ ለበጎ ነው ብዬ አልፋለሁ/2/
በሠንሠለት አስረው በወኅኒ ቢጥሉኝ
መከራን አብዝተው አጅግ ቢያስጨንቁኝ

VERSE 2
ለበጎ ነው ብዬ ተስፋ አድርጌሃለሁ
ይሁን አንተ ያልከው አገዛልህፃዛለሁ', 'yewahoch honen ande ሣra
engda enqebel ande abrሃm
bemaxeb agrn ende ሣra
866.ኃyln bemiሠxegn

VERSE 1
ኃyln bemiሠxegn bekrstos hulun achlalehu/2/
fetena bigexegmegn lebego new byie alfalehu/2/
beሠnሠlet asrew beweኅni bixlugn
mekeran abztew ajg biyascenqugn

VERSE 2
lebego new byie tesfa adrgieሃlehu
yhun ante yalkew agezalhፃzalehu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('swoch-anzemr', 'ስዎች አንዘምር', 'ስዎች አንዘምር', 'swoch anzemr', 'Ethiopian Orthodox Tewahedo Mezmur - ስዎች አንዘምር', 'ሰዎች አንዘምር ለአምላካችን
ከሞት ላወጣን ለአዳኛችን
አናመስግነው እንደአቅማችን
ምሕረት ለሠጠን ለሁላችን

VERSE 1
አምላክ ተአምሩን የሠራብህ
ጩኸት ድምጽህን ለሰማልህ
በርጠሜዎስ ሆይ አትተወው
አዳኝ ጌታህን ተከተለው

VERSE 2
አውርነቴን ላስቀረልኝ
ለዓይኔ ብርሃን የሠጠኝ
ሁሌም ከአርሱ ጋር አኖራለሁ
አዳጌን ትቼ የትእፄዳለሁ', 'sewoch anzemr leamlakachn
kemot lawexan leadagnachn
anamesgnew endeaqmachn
mሕret leሠxen lehulachn

VERSE 1
amlak teamrun yeሠrabh
cuኸt dmtshn lesemalh
berxemiewos hoy attewew
adagn gietahn teketelew

VERSE 2
awrnetien lasqerelgn
leዓynie brሃn yeሠxegn
huliem kearsu gar anoralehu
adagien tchie yeteፄdalehu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ewr-yehonew-ynh-bera', 'እውር የሆነው ዓይንህ በራ', 'እውር የሆነው ዓይንህ በራ', 'ewr yehonew ዓynh bera', 'Ethiopian Orthodox Tewahedo Mezmur - እውር የሆነው ዓይንህ በራ', 'ይሄን ጌታዬን ምን ልበለው
ለውለታውስ ምን ልክፈለው
ስሙን ላወድስ ላመስግነው
ለአምላክ ክፍያ ይህ ብቻ ነው', 'yhen gietayien mn lbelew
lewletaws mn lkfelew
smun laweds lamesgnew
leamlak kfya yh bcha new', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bedelachn-hulu-stasb-tteh', 'በደላችን ሁሉ ስታስብ ትተህ', 'በደላችን ሁሉ ስታስብ ትተህ', 'bedelachn hulu stasb tteh', 'Ethiopian Orthodox Tewahedo Mezmur - በደላችን ሁሉ ስታስብ ትተህ', 'በምጽዓትህ ሰዓት ከጻድቃን ቆጥረህ
ነጭ ልብስ ለብሰን ሆነን ከአንተ ጋራ
በሩ ሳይዘጋ አስገባን አደራ
869.አትተወኝ አትጣለኝ

VERSE 1
አትተወኝ አትጣለኝ/4/
ወድቄአለሁና ጌታ ሆይ አንሣኝኘ/2/
ቸሩ መድኃኒቴ የአልዓዛር ቤት
አራት

VERSE 2
የኑሮዬ ጣዕም የሕይወቴ
መብራት
በኃጢአት ጭቃ ላይ
ወድቄአለሁና

VERSE 3
ጌዬ ሆይ አንሣኝ እጅህን', 'bemtsዓth seዓt ketsadqan qoxreh
nec lbs lebsen honen keante gara
beru sayzega asgeban adera
869.attewegn atxalegn

VERSE 1
attewegn atxalegn/4/
wedqiealehuna gieta hoy anሣgngne/2/
cheru medኃnitie yealዓzar biet
arat

VERSE 2
yenuroyie xaዕm yeሕywetie
mebrat
beኃxiat cqa lay
wedqiealehuna

VERSE 3
gieyie hoy anሣgn ejhn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zergana-2', 'ዘርጋና/2/', 'ዘርጋና/2/', 'zergana/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ዘርጋና/2/', 'የሰጠኸኝ ክብር ይልጅነት ሥልጣን
አንደ ሶምሶን ዝሙት ከደሊላ ጋራ
አርቃኔን ቀረሁኝ ተላልፌ ሕግህን
አምላኬ ዘርጋልኝ የምሕረት እጅህን/2/

VERSE 1
ዘወትር እየበደልኩ ከሕግህ ርቄ
በኃጢአት ጭቃ ላይ ክፉኛ ወድቄ
በበደል እሥራት ተይዣለሁና
አባቴ ሆይ ማረኝ መሐሪ ነህና/2/

VERSE 2
870.ስለይማይነገር ስጦታው
ስላማይነገር ስጦታው እግዚአብሔር ይመስገን
ቸል ያላላን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለማይነገረው ስጦታው አግዚአብሔር ይመስገን

VERSE 3
የሕይወት እስትንፋስ ዘራብን ሕያው
አንድንሆን
ይህን ያደረገ አምላካችን እግዚአብሔር
ይመስገን ሰለማይነገር ስጦታው

VERSE 4
አግዚአብሔር ይመስገን
ንፋሱን ገስፆ ማዕበል አቁሞ የሚያሻግር', 'yesexeኸgn kbr yljnet ሥlxan
ande somson zmut kedelila gara
arqanien qerehugn telalfie ሕghn
amlakie zergalgn yemሕret ejhn/2/

VERSE 1
zewetr eyebedelku keሕgh rqie
beኃxiat cqa lay kfugna wedqie
bebedel eሥrat teyzhalehuna
abatie hoy maregn meሐri nehna/2/

VERSE 2
870.sleymayneger sxotaw
slamayneger sxotaw egziabሔr ymesgen
chel yalalan amlak snguaz maዕbelun aquarxen
slemaynegerew sxotaw agziabሔr ymesgen

VERSE 3
yeሕywet estnfas zerabn ሕyaw
andnhon
yhn yaderege amlakachn egziabሔr
ymesgen selemayneger sxotaw

VERSE 4
agziabሔr ymesgen
nfasun gesፆ maዕbel aqumo yemiyashagr', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-lem-fetena-sibeza-arsu-mexegiyachn', 'የዓለም ፈተና ሲበዛ አርሱ መጠጊያችን', 'የዓለም ፈተና ሲበዛ አርሱ መጠጊያችን', 'yeዓlem fetena sibeza arsu mexegiyachn', 'Ethiopian Orthodox Tewahedo Mezmur - የዓለም ፈተና ሲበዛ አርሱ መጠጊያችን', 'ሰለማይነገር ስጦታው አግዚአብሔር ይመስገን
ዳግሞ እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ ሰላምን ለሰጠን
ሰለማይነገር ስጦታው እገዚአብሔር ይመስገን

VERSE 1
ከሲዖል እሥራት ተፈተን ነጻ የወጣንበት
መስቀሉን ለሰጠን ለአምላካችን እንዘምር በእውነት
ሰለማይነገር ስጦታው አግዚአብሔር ይመስገን
871.ቸርነትህ ብዙ

VERSE 2
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዞአችን ርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ
ለኛ ድንቅ ነው ለኛ

VERSE 3
አንተ ነህ መልካም እረኛ
እስራኤል ወደቀ አስራኤል ተነሣ/ሪ/
መንገድ አልቀናውም አምላኩን ቢረሣ/2/
የያዕቆብን አምላክ እግዚአብሔርን ይዞ/2/

VERSE 4
ምን እንዳተረፈ አውቆታል በጎዞ /2/', 'selemayneger sxotaw agziabሔr ymesgen
dagmo endanmot bemotu motn yeretaln
yemnmekabet tnሣie selamn lesexen
selemayneger sxotaw egeziabሔr ymesgen

VERSE 1
kesiዖl eሥrat tefeten netsa yewexanbet
mesqelun lesexen leamlakachn enzemr beewnet
selemayneger sxotaw agziabሔr ymesgen
871.cherneth bzu

VERSE 2
cherneth bzu mሕreth bzu
beguzoachn rdan xebab new mengedu
dnq new amlak hoy fqrh
legna dnq new legna

VERSE 3
ante neh melkam eregna
esraiel wedeqe asraiel teneሣ/ri/
menged alqenawm amlakun bireሣ/2/
yeyaዕqobn amlak egziabሔrn yzo/2/

VERSE 4
mn endaterefe awqotal begozo /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bemenged-zlen-wedqen-mechie-qertenal-2', 'በመንገድ ዝለን ወድቀን መቼ ቀርተናል/2/', 'በመንገድ ዝለን ወድቀን መቼ ቀርተናል/2/', 'bemenged zlen wedqen mechie qertenal/2/', 'Ethiopian Orthodox Tewahedo Mezmur - በመንገድ ዝለን ወድቀን መቼ ቀርተናል/2/', 'የያዕቀብ አምላክ ደግፎ አንስቶናል/2/
እግዚአብሔር ሲጠራን በቀደመው መንገድ/2/
ጉዞአችን ወዴት ነው በሞት ለመወሰድ/2/', 'yeyaዕqeb amlak degfo anstonal/2/
egziabሔr sixeran beqedemew menged/2/
guzoachn wediet new bemot lemewesed/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('cher-amlak-med-nie-lem', 'ቸር አምላክ መድኃኔዓለም', 'ቸር አምላክ መድኃኔዓለም', 'cher amlak medኃnieዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - ቸር አምላክ መድኃኔዓለም', 'ለእኛ ብለህ አማኑኤል
ተሠቀልክ መድኃኔዓለም
ልትባርከን አማኑኤል', 'leegna bleh amanuiel
teሠqelk medኃnieዓlem
ltbarken amanuiel', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gahna-amanuiel-demhn-med-nie-lem', 'ሥጋህና አማኑኤል', 'ሥጋህና አማኑኤል', 'ሥgahna amanuiel demhn medኃnieዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - ሥጋህና አማኑኤል', 'ብሉ ብለህ አማኑኤል ሰጠኸን መድኃኔዓለም
ህይወት ሆኖ አማኑኤል አዳነን /2/
ሥጋህና አማኑኤል
ደምህን መድኃኔዓለም

VERSE 1
ብሉ ብለህ አማኑኤል
ሠጠኸን መድኃኔዓለም
ሕይወትህ ሆኖ አማኑኤል
አዳነን መድኃኔዓለም /2/

VERSE 2
ሥጋህና አማኑኤል ደምህን መድኃኔዓለም
ብሉ ብለህ አማኑኤል ሰጠኸን መድኃኔዓለም
ሕይወት ሆኖ አማኑኤል አዳነን /2/', 'blu bleh amanuiel sexeኸn medኃnieዓlem
hywet hono amanuiel adanen /2/
ሥgahna amanuiel
demhn medኃnieዓlem

VERSE 1
blu bleh amanuiel
ሠxeኸn medኃnieዓlem
ሕyweth hono amanuiel
adanen medኃnieዓlem /2/

VERSE 2
ሥgahna amanuiel demhn medኃnieዓlem
blu bleh amanuiel sexeኸn medኃnieዓlem
ሕywet hono amanuiel adanen /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('be-xiat-mot-amanuiel', 'በኃጢአት ሞት አማኑኤል', 'በኃጢአት ሞት አማኑኤል', 'beኃxiat mot amanuiel', 'Ethiopian Orthodox Tewahedo Mezmur - በኃጢአት ሞት አማኑኤል', 'ወድቀን ሣለ መድኃኔዓለም
ከጥንት ሀገር አማኑኤል
ኩኑ አልከን መድኃኔዓለም
ምንስ አንበል አማኑኤል

VERSE 1
ምን አናውራ መድኃኔዓለም
ግሩም ብቻ አማኑኤል
ያንተ ስራ መድኃኔዓለም/ሪ/
በኃጢአት ሞት አማኑኤል ወድቀን ሳለን', 'wedqen ሣle medኃnieዓlem
kexnt hager amanuiel
kunu alken medኃnieዓlem
mns anbel amanuiel

VERSE 1
mn anawra medኃnieዓlem
grum bcha amanuiel
yante sra medኃnieዓlem/ri/
beኃxiat mot amanuiel wedqen salen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('emkulu-ygieys-be-lasiekke-teamne-ri2', 'እምኩሉ ይጌይስ በሥላሴክከ ተአምነ/ሪ2/', 'እምኩሉ ይጌይስ በሥላሴክከ ተአምነ/ሪ2/', 'emkulu ygieys beሥlasiekke teamne/ri2/', 'Ethiopian Orthodox Tewahedo Mezmur - እምኩሉ ይጌይስ በሥላሴክከ ተአምነ/ሪ2/', 'ወላዲትከ/2/ ወልድ ወላዲትከ ተማኅጸኑ /2/
ከሁሉ ከሁሉ ሥላሴን ነው ማመን ማመስገን /2/
ወልድን በወለደች/2/ ድንግል አማላጃችን በእርሷ
አንማጸን/2/', 'weladitke/2/ weld weladitke temaኅtsenu /2/
kehulu kehulu ሥlasien new mamen mamesgen /2/
weldn beweledech/2/ dngl amalajachn beersua
anmatsen/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sb-t-le-lasie', 'ስብሐት ለሥላሴ', 'ስብሐት ለሥላሴ', 'sbሐt leሥlasie', 'Ethiopian Orthodox Tewahedo Mezmur - ስብሐት ለሥላሴ', 'ስብሐት ለሥላሴ ለፈጣሬ ኩሉ ዓለም/2/
በመላአክቲሁ ስቡሕ ዘለዓለም/2/
በመላእክቲሁ እኩት ዘለዓለም/2/', 'sbሐt leሥlasie lefexarie kulu ዓlem/2/
bemelaaktihu sbuሕ zeleዓlem/2/
bemelaektihu ekut zeleዓlem/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('legietayie', 'ለጌታዬ', 'ለጌታዬ', 'legietayie', 'Ethiopian Orthodox Tewahedo Mezmur - ለጌታዬ', 'ለጌታዬ ለእግዚአብሔር ስላደረገልኝ ምን አከፍለዋለው
ምስጋና ነው እንጂ /2/ ሌላ ምን እላለው/4/
ለመቤቴ ለድንግል ማርያም ስለውለታዋ ምን', 'legietayie leegziabሔr sladeregelgn mn akeflewalew
/2
/2
msgana new enji /2/ liela mn elalew/4/

VERSE 1
lemebietie ledngl maryam slewletawa mn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('anse-webietye', 'አንሰ ወቤትየ', 'አንሰ ወቤትየ', 'anse webietye', 'Ethiopian Orthodox Tewahedo Mezmur - አንሰ ወቤትየ', 'አንሰ ወቤትየ እግዚአብሔርፃ ናመልክ/2/
አስመ ቅዱስ ውእቱ አግዚአብሔር/4/
አኔና ቤቴ ግን እግዚአብሔርን እናመልካለን/2/
አርሱ ቅዱስ ነውና አግዚአብሔር/2/

VERSE 1
667.ሊተስ
ሊተሰ ይጌይሰኒ ተሊወ እግዚአብሔር /ሪ2/
ወትውክልትየኒ/4/ ላዕለ እግዚአብሔር
ለእኔ ግን ወደ እግዚአብሔር መቅረብ ይሻለኛል /2/

VERSE 2
መታመኛዬ ነው/4/ እግዚአብሔር እርሱ ነው/2/
866.የአብ ጸጋ
የአብ ጸጋ የወልድ ቸርነት የመንፈስቅዱስ አንድነት/2/
ጸጋ በረከት ይደር በሁላችን ሕይወት /2/

VERSE 3
889.አንቺ የወይን ሐረግ
አንቺ የወይን ሐረግ ድንግል ልማላሜሽ የበዛ
ምግብ ሆኖ ተሰጠን ፍሬሽ ለእኛ ቤዛ
በአንቺ ሰማይነት ድንግል የወጣው ፀሐይ

VERSE 4
ብርፃን ነው(2) ለጻድቃን ስሙም አዶናይ
ፊደል ትመሥያለሽ ድንግል ወንጌል ትወልጂያለሽ
ለመላእክት የማይቻል ነበልባሉን የቻልሽ
የመሶብ ምሳሌ ድንግል የኮከብ መገኛ

VERSE 5
በሥጋችን በነፍሳችን እንዳንራብ አንቺ አለሽን
ለእኛ
890.የአምላክ እናት
የአምላክ እናት ነይልን እኛ ልጆችሽን ባርኪን

VERSE 6
ከአንዱ ልጅሽ(2) ፈጥነሽ አማልጅን(2', 'anse webietye egziabሔrፃ namelk/2/
asme qdus wetu agziabሔr/4/
aniena bietie gn egziabሔrn enamelkalen/2/
arsu qdus newna agziabሔr/2/

VERSE 1
667.lites
litese ygieyseni teliwe egziabሔr /ri2/
wetwkltyeni/4/ laዕle egziabሔr
leenie gn wede egziabሔr meqreb yshalegnal /2/

VERSE 2
metamegnayie new/4/ egziabሔr ersu new/2/
866.yeab tsega
yeab tsega yeweld chernet yemenfesqdus andnet/2/
tsega bereket yder behulachn ሕywet /2/

VERSE 3
889.anchi yeweyn ሐreg
anchi yeweyn ሐreg dngl lmalamiesh yebeza
mgb hono tesexen friesh leegna bieza
beanchi semaynet dngl yewexaw ፀሐy

VERSE 4
brፃn new(2) letsadqan smum adonay
fidel tmeሥyalesh dngl wengiel tweljiyalesh
lemelaekt yemaychal nebelbalun yechalsh
yemesob msalie dngl yekokeb megegna

VERSE 5
beሥgachn benefsachn endanrab anchi aleshn
leegna
890.yeamlak enat
yeamlak enat neyln egna ljochshn barkin

VERSE 6
keandu ljsh(2) fexnesh amaljn(2', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beamaljnetua-endnalen', 'በአማልጅነቷ እንድናለን', 'በአማልጅነቷ እንድናለን', 'beamaljnetua endnalen', 'Ethiopian Orthodox Tewahedo Mezmur - በአማልጅነቷ እንድናለን', 'ፈጣሪ ምሮናል እንድናለን
ምርኩዝ አንቺን ይዘን አድንናለን
ስንቃችን ሠንቀን
በድንግል መሪነት

VERSE 1
ጽድቅን አንወርሳለን', 'fexari mronal endnalen
mrkuz anchin yzen adnnalen
snqachn ሠnqen
bedngl merinet

VERSE 1
tsdqn anwersalen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemhiln-emebietachn', 'ለምሂልን እመቤታችን', 'ለምሂልን እመቤታችን', 'lemhiln emebietachn', 'Ethiopian Orthodox Tewahedo Mezmur - ለምሂልን እመቤታችን', 'ተስፋቸው እንቺ ነሽ ለፍጥረት ዓለም
አየተመኩብሽ እስከ ዘለዓለም
ኃጢአታቸው ተደምስሶላቸው
በአንቺ ጸሎት ዳነች ሕይወታቸው', 'tesfachew enchi nesh lefxret ዓlem
ayetemekubsh eske zeleዓlem
ኃxiatachew tedemssolachew
beanchi tselot danech ሕywetachew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeagna-mesheshegiya', 'የአኛ መሸሸጊያ >> >>', 'የአኛ መሸሸጊያ >> >>', 'yeagna mesheshegiya >> >>', 'Ethiopian Orthodox Tewahedo Mezmur - የአኛ መሸሸጊያ >> >>', 'ምርኩዝ ድጋፋችን >> >>
የማትተወን እኛን >> >>
አመቤት አለችኝ >> >>', 'mrkuz dgafachn >> >>
yemattewen egnan >> >>
amebiet alechgn >> >>', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('leqal-maderiya-lemehon-yebeqash', 'ለቃል ማደሪያ ለመሆን የበቃሽ', 'ለቃል ማደሪያ ለመሆን የበቃሽ', 'leqal maderiya lemehon yebeqash', 'Ethiopian Orthodox Tewahedo Mezmur - ለቃል ማደሪያ ለመሆን የበቃሽ', 'ኸኸ/3/
ኸኸ/3/
ለቃል ማደሪያ ለመሆን የበቃሽ /2/ እኸ
አሥራ ሁለት ዓመት በቤተመቅደስ የኖርሽ

VERSE 1
የመመረጥ ጸጋ ከጌታ አገኘሽ
በአብሣሪው መልአክ አጹጽብ ድንቅ ዜና
ከሰማይ መጣልሽ አቋርጦ ደመና
በስድስተኛው ወር ተልኮ ገብርኤል

VERSE 2
ቤተ መቅደስ ገባ ሊያበሥራት ለድንግል
በልዩ ሰላምታ ሰላም ለኪ ያለሽ
የክርስቶስ አናት በጣም ደስ ይበልሽ
መላእክት በሰማይ ያመሰግኑሻል', 'leqal maderiya lemehon yebeqash /2/ eኸ
aሥra hulet ዓmet bebietemeqdes yenorsh
yememerex tsega kegieta agegnesh
beabሣriw melak atsutsb dnq ziena

VERSE 1
kesemay mexalsh aquarxo demena
besdstegnaw wer telko gebriel
biete meqdes geba liyabeሥrat ledngl
belyu selamta selam leki yalesh

VERSE 2
yekrstos anat bexam des ybelsh
melaekt besemay yamesegnushal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beab-riw-melak-tsb-dnq-ziena', 'በአብሣሪው መልአክ ዕጽብ ድንቅ ዜና', 'በአብሣሪው መልአክ ዕጽብ ድንቅ ዜና', 'beabሣriw melak ዕtsb dnq ziena', 'Ethiopian Orthodox Tewahedo Mezmur - በአብሣሪው መልአክ ዕጽብ ድንቅ ዜና', 'ከሰማይ መጣልሽ አቋርጦ ደመና
በ6ኛው ወር ተልኮ ገብርኤል
ቤተመቅደስ ገባ ሊያበስራት ለድንግል', 'kesemay mexalsh aquarxo demena
be6gnaw wer telko gebriel
bietemeqdes geba liyabesrat ledngl', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kbr-leamlak-anat-ydresat-ylushal', 'ክብር ለአምላክ አናት ይድረሳት ይሉሻል', 'ክብር ለአምላክ አናት ይድረሳት ይሉሻል', 'kbr leamlak anat ydresat ylushal', 'Ethiopian Orthodox Tewahedo Mezmur - ክብር ለአምላክ አናት ይድረሳት ይሉሻል', 'ክብር ለአምላክ አናት ይድረሳት ይሉሻል
በማኅፀንሸ ቢያድር የሠራዊት ጌታ
ለመሆን ተመረጥሽ የአምላክ ቅዱስ ቦታ
የፈጣሪ አናት መሆንሽን ተረድቶ

VERSE 1
ሰላም ለአንቺ ይሁን አለሽ እጅ ነሥቶ
ከፍጡራን ሁሉ አንቺ ትበልጫለሽ
ገብርኤል ተልኮ ደስታን አበሠረሽ
ምንኛ ድንቅ ነው ድንግል የአንቺ ብሥራት

VERSE 2
ጌታን ትወልጃለሽ የሚል ቃልን መስማት
ይሁንልኝ ብለሽ ቃሉን የተቀበልሽ
ድንግል ሆይ እናቴ እጆግ ልዩ አኮ ነሽ
988ተልኮ መጥቶ

VERSE 3
ተልኮ መጥቶ ገብርኤል /2/
ደስ ይበልሽ አላት ለድንግል /2/', 'kbr leamlak anat ydresat ylushal
bemaኅፀnshe biyadr yeሠrawit gieta
lemehon temerexsh yeamlak qdus bota
yefexari anat mehonshn teredto

VERSE 1
selam leanchi yhun alesh ej neሥto
kefxuran hulu anchi tbelcalesh
gebriel telko destan abeሠresh
mngna dnq new dngl yeanchi bሥrat

VERSE 2
gietan tweljalesh yemil qaln mesmat
yhunlgn blesh qalun yeteqebelsh
dngl hoy enatie ejog lyu ako nesh
988telko mexto

VERSE 3
telko mexto gebriel /2/
des ybelsh alat ledngl /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yhch-lem-nqa-gefta-bttewegn', 'ይህች ዓለም ንቃ ገፍታ ብትተወኝ', 'ይህች ዓለም ንቃ ገፍታ ብትተወኝ', 'yhch ዓlem nqa gefta bttewegn', 'Ethiopian Orthodox Tewahedo Mezmur - ይህች ዓለም ንቃ ገፍታ ብትተወኝ', 'አንቺ ካለሽኝ ምን እሆናለሁ
አውሎ ነፋሱን ባሕሩን አልፋልሁ
ጠላቴ ደርሶ ቢያንገላታኝ', 'anchi kaleshgn mn ehonalehu
awlo nefasun baሕrun alfalhu
xelatie derso biyangelatagn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yom-f-kone-az', 'ዮም ፍሥሐ ኮነ አዝ ---------', 'ዮም ፍሥሐ ኮነ አዝ ---------', 'yom fሥሐ kone az ---------', 'Ethiopian Orthodox Tewahedo Mezmur - ዮም ፍሥሐ ኮነ አዝ ---------', 'ዮም ፍሥሐ ኮነ (2) በቃል ኪዳንሽ ብዙዎች ድነዋል
በአንተ ልደታ ለማርያም /2/ በምልጃሸ ጽድቅን አግኝተዋል
በባርነት ሳለን ፍሥሐ ኮነ የአምላክ ቸርነቱን አይተዋል/2/', 'yom fሥሐ kone (2) beqal kidansh bzuwoch dnewal
beante ldeta lemaryam /2/ bemljashe tsdqn aggntewal
bebarnet salen fሥሐ kone yeamlak chernetun aytewal/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('anchin-keneljsh-bekbr-xertew', 'አንቺን ከነልጅሽ በክብር ጠርተው', 'አንቺን ከነልጅሽ በክብር ጠርተው', 'anchin keneljsh bekbr xertew', 'Ethiopian Orthodox Tewahedo Mezmur - አንቺን ከነልጅሽ በክብር ጠርተው', 'ሰዎች ተረብሸው በጣም ተደናግጠው
ወይኑ በማለቁ በፍርሃት ተውጠው
አንቺን ከነልጅሽ በክብር ጠርተው
ሰዎች ተረብሽው በጣም ተደናግጠው

VERSE 1
ወይኑ በማለቁ በፍርሃት ተውጠው', 'sewoch terebshew bexam tedenagxew
weynu bemalequ befrሃt tewxew
anchin keneljsh bekbr xertew
sewoch terebshw bexam tedenagxew

VERSE 1
weynu bemalequ befrሃt tewxew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('weynu-bemehal-lay-malequn-semteshe', 'ወይኑ በመሀል ላይ ማለቁን ሰምተሸ', 'ወይኑ በመሀል ላይ ማለቁን ሰምተሸ', 'weynu bemehal lay malequn semteshe', 'Ethiopian Orthodox Tewahedo Mezmur - ወይኑ በመሀል ላይ ማለቁን ሰምተሸ', 'ድንጋጤአቸውን አምቤቴ አይተሽ
ወደ ልጅሽ ፄድሽ ብጠይቂላቸው
ጋኑን ውኃ ሙሉ ብሎ አዘዛቸው', 'dngaxieachewn ambietie aytesh
wede ljsh ፄdsh bxeyqilachew
ganun wኃ mulu blo azezachew', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bednglna-gietan-weledech', 'በድንግልና ጌታን ወለደች', 'በድንግልና ጌታን ወለደች', 'bednglna gietan weledech', 'Ethiopian Orthodox Tewahedo Mezmur - በድንግልና ጌታን ወለደች', 'መሶበ ወርቅ የመና ሙዳይ
ቤቴልሔም ሆይ አሙ ለፀሐይ
የካህናቱ ወርቅ ማዕጠንት
ይጣን መያዣ ነሽ ልዩ ፍጥረት', 'mesobe werq yemena muday
bietielሔm hoy amu leፀሐy
yekahnatu werq maዕxent
yxan meyazha nesh lyu fxret', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yewerq-meqrez-yeaminadab-seregela', 'የወርቅ መቅረዝ የአሚናዳብ ሰረገላ', 'የወርቅ መቅረዝ የአሚናዳብ ሰረገላ', 'yewerq meqrez yeaminadab seregela', 'Ethiopian Orthodox Tewahedo Mezmur - የወርቅ መቅረዝ የአሚናዳብ ሰረገላ', 'ንጹሕ የሠርግ ቤት የአብርፃም ድንኳን
የአምላክ ማደርያ ታቦተ ጽዮን
የአቤል የዋኅት የሴም ቸርነት
የዮሴፍ አጽናኝ ርግብ የዋህት

VERSE 1
የአቤል ፀናፅል የጌድዮን ፀምር
የሠሎሞን ጥበብ የዳዊት መዘሙር
905.ተወልዳለችና
ተወልዳለችና የጌታ እናት የእኛ መደኃኒት

VERSE 2
አናወድሳት እናመስግናት እንወደዳት/2/
የአዳምን ሕይወት /4/ ኸኸ
አዳም ሲሠደድ ከጥንት ርስቱ
ፊቱን ሸፈነው ጭንቀት ፍርሀቱ', 'ntsuሕ yeሠrg biet yeabrፃm dnkuan
yeamlak maderya tabote tsyon
yeabiel yewaኅt yesiem chernet
yeyosief atsnagn rgb yewaht

VERSE 1
yeabiel ፀnaፅl yegiedyon ፀmr
yeሠlomon xbeb yedawit mezemur
905.teweldalechna
teweldalechna yegieta enat yeegna medeኃnit

VERSE 2
anawedsat enamesgnat enwededat/2/
yeadamn ሕywet /4/ ኸኸ
adam siሠded kexnt rstu
fitun shefenew cnqet frhatu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeasat-megareja-wediet-tegarede', 'የአሳት መጋረጃ ወዴት ተጋረደ', 'የአሳት መጋረጃ ወዴት ተጋረደ', 'yeasat megareja wediet tegarede', 'Ethiopian Orthodox Tewahedo Mezmur - የአሳት መጋረጃ ወዴት ተጋረደ', 'ልዑል በጥበቡ ካንቺ ተዋሐደ/2/
የኪሩቤል አምሳል አመብርሃን ናት
ሰማያዊ ንጉሥ የከተመባት
የመለኮት ዙፋን ድንግል በመሆን

VERSE 1
ሜካኤል ገብርኤል ሰግደው ዘመሩልሽ
ሩፋኤል ራጉኤል ሰግደው ዘመሩልሽ
908.ልዩ ክብር
ልዩ ክብር የተሰጠሸ ንጽሕት ወቡርክት

VERSE 2
የነብያት ሀገራቸው እህተ መላእክት
አናመስግናት /2/ እናወድሳት
ከሴቶች ሁሉ ደንግል ልዩ ናት
አናመስግናት ክብራ የበዛ ነው

VERSE 3
ፍጹም ነው ኪዳኗ
ለምና ታሰታርቀን
ርኅርቲተ ኅሊና
የክፉ ቀን ደራሽ', 'lዑl bexbebu kanchi tewaሐde/2/
yekirubiel amsal amebrሃn nat
semayawi nguሥ yeketemebat
yemelekot zufan dngl bemehon

VERSE 1
miekaiel gebriel segdew zemerulsh
rufaiel raguiel segdew zemerulsh
908.lyu kbr
lyu kbr yetesexeshe ntsሕt weburkt

VERSE 2
yenebyat hagerachew ehte melaekt
anamesgnat /2/ enawedsat
kesietoch hulu dengl lyu nat
anamesgnat kbra yebeza new

VERSE 3
ftsum new kidanua
lemna tasetarqen
rኅrtite ኅlina
yekfu qen derash', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('qaln-lemewled-keab-zend-mogesn-yagegnesh-2', 'ቃልን ለመውለድ ከአብ ዘንድ ሞገስን ያገኘሽ /2/', 'ቃልን ለመውለድ ከአብ ዘንድ ሞገስን ያገኘሽ /2/', 'qaln lemewled keab zend mogesn yagegnesh /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ቃልን ለመውለድ ከአብ ዘንድ ሞገስን ያገኘሽ /2/', 'የሐና ልጅ ነሽ የኢያቄም እጽብ ድነቅ ነሽ /4/
አሾህ ኩርንችት ሆነ ኑሮዬ
የልጅሽ ፍጥረት ተጎሣቁዬ
ሞገድ ማዕበል እንዳይውጠኝ

VERSE 1
ሰላላ ክንዴን ደግፊልኝ
ቆሜ ልሳለም በስዕልሽ ፊት
ፍቅር ትኅትናን አንድማርበት
ላደግድና ልሳለምሽ

VERSE 2
የጌታዬ እናት ልሁን ባርያሽ
የዳዊት ልጅ ሆይ ቁሚ ከጎኔ
ወደ መስቀሉ ይመልከት ዓይኔ
የሌዊ ልጅ ሆይ አይዞህ በይኝ

VERSE 3
የሥጋ ድካም አዳይጎደኝ
910.አመብርፃን
ትምክህቴ መድኃኒቴ አንቺው ነሽ /2
አመብርሃን /4/ ምርኩዛችን

VERSE 4
ሸክም የከበደኝ ደካም ነኝ አኔ
ረዳትም የለኝ ከአንቺ በቀር ለአኔ
አመአምላክ ደግፊኝ ቁሚልኝ ከጎኔ
አመብርሃን (4) ምርኩዛችን

VERSE 5
የኃጢአትን ቋጥኝ በጅርባዬ አዝዬ
አቀበዛበዛለሁ ተገፎ ጸጋዬ
በአንቺ አማጸናለሁ ነፍሴን በእጅሽ ጥዬ
ምርኩዝ መሠላሌ ጥላ ከለላዬ

VERSE 6
አመብርሃን (4) ምርኩዛችን
ልዩነሸ አናቴ ማርያም ድንግል
ማን አዛኝ አንደአንቺ ግራ ቀኝ ቢባል
በአንቺ ላይ አረፋ ልቤ ተረጋጋ

VERSE 7
የሕይወቴ ተስፋ በአንቺ ተዘረጋ
አምብሃን (4) ምርኩዛችን
ፍጽሞ አርቁልኝ የእኔን ክፉ ሽታ
በሽቱሽሸ መዓዛ አድይኝ አርካታ', 'yeሐna lj nesh yeiyaqiem etsb dneq nesh /4/
ashoh kurncht hone nuroyie
yeljsh fxret tegoሣquyie
moged maዕbel endaywxegn

VERSE 1
selala kndien degfilgn
qomie lsalem besዕlsh fit
fqr tኅtnan andmarbet
ladegdna lsalemsh

VERSE 2
yegietayie enat lhun baryash
yedawit lj hoy qumi kegonie
wede mesqelu ymelket ዓynie
yeliewi lj hoy ayzoh beygn

VERSE 3
yeሥga dkam adaygodegn
910.amebrፃn
tmkhtie medኃnitie anchiw nesh /2
amebrሃn /4/ mrkuzachn

VERSE 4
shekm yekebedegn dekam negn anie
redatm yelegn keanchi beqer leanie
ameamlak degfign qumilgn kegonie
amebrሃn (4) mrkuzachn

VERSE 5
yeኃxiatn quaxgn bejrbayie azyie
aqebezabezalehu tegefo tsegayie
beanchi amatsenalehu nefsien beejsh xyie
mrkuz meሠlalie xla kelelayie

VERSE 6
amebrሃn (4) mrkuzachn
lyuneshe anatie maryam dngl
man azagn andeanchi gra qegn bibal
beanchi lay arefa lbie teregaga

VERSE 7
yeሕywetie tesfa beanchi tezerega
ambሃn (4) mrkuzachn
ftsmo arqulgn yeenien kfu shta
beshtushshe meዓza adygn arkata', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yekirubiel-eknaf-yenefsie-wastna', 'የኪሩቤል እክናፍ የነፍሴ ዋስትና', 'የኪሩቤል እክናፍ የነፍሴ ዋስትና', 'yekirubiel eknaf yenefsie wastna', 'Ethiopian Orthodox Tewahedo Mezmur - የኪሩቤል እክናፍ የነፍሴ ዋስትና', 'ነይ ነይ አመቤቴ መርኩዛችን
አምብርሃን (4) ምርኩዛችን
ከፍቅርሽ ምስጋና ዝም አንዳልል ድንግል
አንደቤቴን ፍቺው ኅሊናዬም ይቁሠል

VERSE 1
የፍቅርሽ ማእበል ይፍሰስ በሕይወቴ
በእቅፍሽ ድርጊኝ እንደልጅነቴ
አመብርሃን /4/ ምርኩዛቸን
911.ጎሥዓ ልብየ

VERSE 2
ጎሥዓ ልብየ ቃለ ሠናየ /2/
ወአነ አይድአእ ቅዳሴዛ ለማርያም /4/
አኔስ የማርያምን ውዳሴዋን እናገራለሁ
አንደ አባቴ ዳዊት በበገና አዘምራለሁ

VERSE 3
ቀን ከሌሊት ሳልል ለምስጋና እተጋለሁ
ምርኩዜ ነሽና አመቤቴ በአንቺ እመካለሁ
ኦ አመቤቴ በአውነት አንወድሻለን
የእውነተኛ መብልን ክርስቶስን ወለደሽልን

VERSE 4
ምክንያተ ድቲን ሆይ ድንግል ማርያም የአምላክ
መገኛ', 'ney ney amebietie merkuzachn
ambrሃn (4) mrkuzachn
kefqrsh msgana zm andall dngl
andebietien fchiw ኅlinayiem yquሠl

VERSE 1
yefqrsh maebel yfses beሕywetie
beeqfsh drgign endeljnetie
amebrሃn /4/ mrkuzachen
911.goሥዓ lbye

VERSE 2
goሥዓ lbye qale ሠnaye /2/
weane aydae qdasieza lemaryam /4/
anies yemaryamn wdasiewan enageralehu
ande abatie dawit bebegena azemralehu

VERSE 3
qen kelielit sall lemsgana etegalehu
mrkuzie neshna amebietie beanchi emekalehu
o amebietie beawnet anwedshalen
yeewnetegna mebln krstosn weledeshln

VERSE 4
mknyate dtin hoy dngl maryam yeamlak
megegna', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('maryam-dngl-mkhon-ledenagl', 'ማርያም ድንግል ምክሆን ለደናግል', 'ማርያም ድንግል ምክሆን ለደናግል', 'maryam dngl mkhon ledenagl', 'Ethiopian Orthodox Tewahedo Mezmur - ማርያም ድንግል ምክሆን ለደናግል', 'ይእቲኪ በቴ ምስአል ዘአስተዐፀቡ ታቀልል
ለኩሉ ፍጥረት ትተነብል በአክናፈ መላእክት
ትኬለል
ይእቲ ተዐቢ እም ኪሩቤል ወትፈደፋድ እም

VERSE 1
ሱራፊል', 'yetiki betie msal zeasteዐፀbu taqell
lekulu fxret ttenebl beaknafe melaekt
tkielel
yeti teዐbi em kirubiel wetfedefad em

VERSE 1
surafil', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yetsdq-br-nesh', 'የጽድቅ ብር ነሽ', 'የጽድቅ ብር ነሽ', 'yetsdq br nesh', 'Ethiopian Orthodox Tewahedo Mezmur - የጽድቅ ብር ነሽ', 'የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹሕ አክሊላችን', 'yetsdq ber nesh yemusie tslat
aklile semaዕtat mዕrage tselot
yegietayie enat ntsuሕ aklilachn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('melmale-sina-amebietachn-2', 'ሐመልማለ ሲና አመቤታችን /2', 'ሐመልማለ ሲና አመቤታችን /2', 'ሐmelmale sina amebietachn /2', 'Ethiopian Orthodox Tewahedo Mezmur - ሐመልማለ ሲና አመቤታችን /2', 'አመቤታቸን ለእኛ መርኩዝ ነሽ
ከለላም ሆንሽ
የአሳት ሙዳይ
አሳት ታቀፍሽ

VERSE 1
በብርሃን ተከበሽ
ወርቅ ለብሰሽ
ከሴቶች ሁሉ
አብ መረጠሽ', 'amebietachen leegna merkuz nesh
kelelam honsh
yeasat muday
asat taqefsh

VERSE 1
bebrሃn tekebesh
werq lebsesh
kesietoch hulu
ab merexesh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beamalajnetsh-huln-meketa', 'በአማላጅነትሽ', 'በአማላጅነትሽ', 'beamalajnetsh huln meketa', 'Ethiopian Orthodox Tewahedo Mezmur - በአማላጅነትሽ', 'አናታችን አለኝታችን እንድናለን
ድንግል አንቺን ይዘን /2/
በአማላጅነትሽ ሰላም ለኪ
ድንግል ሆይ አደራ ሰላም ለኪ

VERSE 1
አማልጅን ከልጅሽ ሰላም ለኪ
በአማላጅነትሽ ይድናሉ/2/
በአማላጅነትሽ በመታመን አእንጮነፃለን እኛ
ምሕረትን አድይን ኪዳነምሕረት የዓለም መዳኛ

VERSE 2
ስለቸርነትሽ አመቤቴ ለእኔ እናቴ ነሽ
ስለ ንግሥትነትሽም አምቤቴ ነሸ
ዝናባት ሳያጠጡት አየራትም ሳያሳድጉት
ሰማያዊ እንጀራ የሰጠሸን ቤተልሔማዊት

VERSE 3
ቃና ዘገሊላ በሠርግ ቤት በዚያ ተገኝተሸ ሳለሽ
ውኃውን ወደ ወይን በአንቺ ምልጃ እንዳስለወጥሽ
ዛሬም የእኔ ሕይወት ወይኑ አልቆ ባዶ ሆኗልና
አንቺ የአምላክ እናት ንጽሕት ቅድስት ርኅርጊተ

VERSE 4
ኅሊና
ሕይወቴን ቀድሰሽ አመቤቴ ሙይው በምስጋና
912. የሐና ልጅ ነሽ
የሐና ልጅ ነሽ የኢያቄም በረከት /2/

VERSE 5
በአማላጅነትሽ
በአማላጅነትሽ ሁፒልን መከታ
በአናታቸን አለኝታችን
አንድናለን ደንግል አንቺን ይዘን

VERSE 6
ፃሌ ሃሌ ሉያ(2)
በአማላጅነትሽ ሰላም ለኪ
ድንግል ሆይ አደራ ሰላም ለኪ
አማልጅን ከልጅሽ ሰላም ለኪ

VERSE 7
በአማላጅነትሽ አድናለሁ /2/
በአማላጅነትሽ እንድናለን /2/
በአማላጅነትሽ ይድናሉ /2/
በአማላጅነትሽ ሁልን መከታ

VERSE 8
እናታችን አለኝታችን እንድናለን', 'anatachn alegntachn endnalen
dngl anchin yzen /2/
beamalajnetsh selam leki
dngl hoy adera selam leki

VERSE 1
amaljn keljsh selam leki
beamalajnetsh ydnalu/2/
beamalajnetsh bemetamen aenconeፃlen egna
mሕretn adyn kidanemሕret yeዓlem medagna

VERSE 2
slechernetsh amebietie leenie enatie nesh
sle ngሥtnetshm ambietie neshe
znabat sayaxexut ayeratm sayasadgut
semayawi enjera yesexeshen bietelሔmawit

VERSE 3
qana zegelila beሠrg biet beziya tegegnteshe salesh
wኃwn wede weyn beanchi mlja endaslewexsh
zariem yeenie ሕywet weynu alqo bado honualna
anchi yeamlak enat ntsሕt qdst rኅrgite

VERSE 4
ኅlina
ሕywetien qedsesh amebietie muyw bemsgana
912. yeሐna lj nesh
yeሐna lj nesh yeiyaqiem bereket /2/

VERSE 5
beamalajnetsh
beamalajnetsh hupiln meketa
beanatachen alegntachn
andnalen dengl anchin yzen

VERSE 6
ፃlie ሃlie luya(2)
beamalajnetsh selam leki
dngl hoy adera selam leki
amaljn keljsh selam leki

VERSE 7
beamalajnetsh adnalehu /2/
beamalajnetsh endnalen /2/
beamalajnetsh ydnalu /2/
beamalajnetsh huln meketa

VERSE 8
enatachn alegntachn endnalen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lemaryam-dngl', 'ለማርያም ድንግል', 'ለማርያም ድንግል', 'lemaryam dngl', 'Ethiopian Orthodox Tewahedo Mezmur - ለማርያም ድንግል', 'ለማርያም ደንግል መንበረ ተድላ (2)
ወሪዶ ገብርኤል ምደረ ገሊላ
ትወልዲ ወልድ ለድንግል ይቤላ
አዲስ ዜና ለማርያም ድንግል

VERSE 1
ሰማያት ሠንጥቆ መጣ ገብርኤል
ድንግል ከአንቺ ጋር አምላክ ስለሆነ
ምክንያት አንቺ ሆነሽ ዓለም ሁሉ ዳነ
መዝገበ ጽድቅ ነሽ ምስጋና ይገባሻል

VERSE 2
ሰማያዊ ጌታ ድንግል ሆይ ወልደሻል
መመኪያ ሞገስ ለእኛ ልትሆኝን
በስለት ወለዱሽ ሐናና ኢያቄም
በማይደክም ልሳን በመላእክት ዜማ

VERSE 3
ትመሰገናለች የእኛ እናት በራማ
ጌታችን ተፀንሶ በማኅፀኗ ሳለ
የመላአክት ዝማሬ ትሠማ ነበር
የነቢያት ትንቢት ፍጻሜ አገኘ

VERSE 4
ገብርኤል ተልኮ መድኃኒት ተገኘ
ንጹሕ ዘር ከሆነች ከእመቤታችን
በፍቃዱ ወርዶ ተወለደልን
918.ደስ ይበልሽ

VERSE 5
ደስ ይበልሽ /2/ ማርያም ንጽሕት ድንግል
ደስ ይበልሽ ከሴቶቹ ሁሉ የተባረከሽ ነሽ /2
ሰላም አልሻለሁ ማርያም ደንግል
አንደ ብሥራታዊው እንደ ገብርኤል

VERSE 6
ለአንቺ የተሰጠሸ ሁለት ድንግልና
አንደኛው በሥጋ ሌላው በኅሊና', 'lemaryam dengl menbere tedla (2)
werido gebriel mdere gelila
tweldi weld ledngl ybiela
adis ziena lemaryam dngl

VERSE 1
semayat ሠnxqo mexa gebriel
dngl keanchi gar amlak slehone
mknyat anchi honesh ዓlem hulu dane
mezgebe tsdq nesh msgana ygebashal

VERSE 2
semayawi gieta dngl hoy weldeshal
memekiya moges leegna lthognn
beslet weledush ሐnana iyaqiem
bemaydekm lsan bemelaekt ziema

VERSE 3
tmesegenalech yeegna enat berama
gietachn teፀnso bemaኅፀnua sale
yemelaakt zmarie tሠma neber
yenebiyat tnbit ftsamie agegne

VERSE 4
gebriel telko medኃnit tegegne
ntsuሕ zer kehonech keemebietachn
befqadu werdo teweledeln
918.des ybelsh

VERSE 5
des ybelsh /2/ maryam ntsሕt dngl
des ybelsh kesietochu hulu yetebarekesh nesh /2
selam alshalehu maryam dengl
ande bሥratawiw ende gebriel

VERSE 6
leanchi yetesexeshe hulet dnglna
andegnaw beሥga lielaw beኅlina', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ke-lem-hulu-sietoch-nts-t-bemehonsh', 'ከዓለም ሁሉ ሴቶች ንጽሕት በመሆንሽ', 'ከዓለም ሁሉ ሴቶች ንጽሕት በመሆንሽ', 'keዓlem hulu sietoch ntsሕt bemehonsh', 'Ethiopian Orthodox Tewahedo Mezmur - ከዓለም ሁሉ ሴቶች ንጽሕት በመሆንሽ', 'ሰማያዊው ምሥጢር የተገለጸልሽ
ለልዑል ማደሪያ ለመሆን የበቃሽ
የጌታችን እናት በጣም ደስ የበልሽ', 'semayawiw mሥxir yetegeletselsh
lelዑl maderiya lemehon yebeqash
yegietachn enat bexam des yebelsh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('med-nit-simexa-seyxan-andafere', 'መድኃኒት ሲመጣ ሰይጣን አንዳፈረ', 'መድኃኒት ሲመጣ ሰይጣን አንዳፈረ', 'medኃnit simexa seyxan andafere', 'Ethiopian Orthodox Tewahedo Mezmur - መድኃኒት ሲመጣ ሰይጣን አንዳፈረ', 'የዜናው አብሳሪ ገብርኤል ነበር
መድኃኒት ሲመጣ ሰይጣን አንዳፈረ
የዜናው አብሣሪ ገብርኤል ነበረ', 'yezienaw absari gebriel neber
medኃnit simexa seyxan andafere
yezienaw abሣri gebriel nebere', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('chla-teshekemech-behulet-eji-yza', 'ችላ ተሸከመች በሁለት እጂ ይዛ', 'ችላ ተሸከመች በሁለት እጂ ይዛ', 'chla teshekemech behulet eji yza', 'Ethiopian Orthodox Tewahedo Mezmur - ችላ ተሸከመች በሁለት እጂ ይዛ', 'ብርሃን ትሁነን ጨለማን ገላልጣ
አማልዳ ታስምረን ከዚህ ዓለም ጣጣ/2/
ከማር ይጣፍጣል የድንግል መዓዛ
አምላክን አቅፋለች በሁለት አጸ የዛ

VERSE 1
ዓለም ሁሉ የዳነው በልጅሽ ነውና
አናታችን ጽዮን ይድረስሽ ምስጋና /2
921.ድንግል እመቤቴ
ድንግል አመቤቴ የሕይወቴ ረዳት

VERSE 2
የኑሮዬ ጣዕም ዋልታ መሠረት
አለምንሻለሁ/2/ ፍጹም በረከት/2/
ትኅትናሽ ሲታሰብ ድንግል አመቤቴ
በሰዎች ልቡና ድንግል አመቤቴ

VERSE 3
ግርምትን ይፈጥራል
ልብ ይመስጥና
ጽዮን መጠጊያ ነሽ
የአብርሃም ድንኳን

VERSE 4
የታጠረች ተክል
አመብዙኃን
ከሚካኤል ጋር ድንግል አመቤቴ
ፈጥነሽ ደርሺልኝ

VERSE 5
ቅዱስ ገብርኤል ይምጣ
ክበርሽን ያብስረን
ከድንግል ጋር ሆነህ
ዑራኤል ፈጥነህ ና

VERSE 6
ሩፋኤል፤ ራጉኤል
ንዑ በደመና
በደማችን ሰርጸጺል
ፍቅሯ የማርያም

VERSE 7
ምስክር ነን እኛ
እስከዘለዓለም
በአባቶችሽ ፈንታ
ልጆች ስላለን', 'brሃn thunen celeman gelalxa
amalda tasmren kezih ዓlem xaxa/2/
kemar yxafxal yedngl meዓza
amlakn aqfalech behulet atse yeza

VERSE 1
ዓlem hulu yedanew beljsh newna
anatachn tsyon ydressh msgana /2
921.dngl emebietie
dngl amebietie yeሕywetie redat

VERSE 2
yenuroyie xaዕm walta meሠret
alemnshalehu/2/ ftsum bereket/2/
tኅtnash sitaseb dngl amebietie
besewoch lbuna dngl amebietie

VERSE 3
grmtn yfexral
lb ymesxna
tsyon mexegiya nesh
yeabrሃm dnkuan

VERSE 4
yetaxerech tekl
amebzuኃn
kemikaiel gar dngl amebietie
fexnesh dershilgn

VERSE 5
qdus gebriel ymxa
kbershn yabsren
kedngl gar honeh
ዑraiel fexneh na

VERSE 6
rufaiel፤ raguiel
nዑ bedemena
bedemachn sertsetsil
fqrua yemaryam

VERSE 7
mskr nen egna
eskezeleዓlem
beabatochsh fenta
ljoch slalen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tamaldenalech', 'ታማልደናለች', 'ታማልደናለች', 'tamaldenalech', 'Ethiopian Orthodox Tewahedo Mezmur - ታማልደናለች', 'ታማልደናለች /4/ ማርያም /2 ቤዛዊተ ዓለም/2/
ሚካኤል መልአከ ሊቀ መላእክት /2/
ዘአውረድከ (2) መና ከደመና:(2)
ገብርኤል መልአክ አብሣሬ ትስብእት/2/

VERSE 1
ዘአብሠራ /2/ ለማርያም ንጽሕት(2)
ሩፋኤል መልአክ ሊቀመላእክት(2)
ዘአብርሀ (2) ዓይኑ ለጦቢት(2)
ዑራኤል መልአክ ለእዝራ ነቢይ(2)

VERSE 2
ዘአስተዮ (2) ጽዋዐ ልቡና(2)
ሰሎሞን ይቤላ /4/
ርግብየ ሠናይትየ ሰሎሞን ይቤላ /2', 'tamaldenalech /4/ maryam /2 biezawite ዓlem/2/
mikaiel melake liqe melaekt /2/
zeawredke (2) mena kedemena:(2)
gebriel melak abሣrie tsbet/2/

VERSE 1
zeabሠra /2/ lemaryam ntsሕt(2)
rufaiel melak liqemelaekt(2)
zeabrha (2) ዓynu lexobit(2)
ዑraiel melak leezra nebiy(2)

VERSE 2
zeasteyo (2) tswaዐ lbuna(2)
selomon ybiela /4/
rgbye ሠnaytye selomon ybiela /2', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('929bezmena-nts-ki', '929በዝመና ንጽሕኪ', '929በዝመና ንጽሕኪ', '929bezmena ntsሕki', 'Ethiopian Orthodox Tewahedo Mezmur - 929በዝመና ንጽሕኪ', 'በዝናበ ንጽሕኪ ሐረገወይን ፀገየ /2/
ወሮማን /2/ወሮማን ሐዋዘ ፈረየ/2/
አመቤቴ ማርያም ሆይ አንቺን የማይበት/2/
ምን ዓይን አለኝ /5/ ፍቅርሽ አይለየኝ/2/

VERSE 1
ለአዳም ተስፋ የሆንሽው ማርያም አመቤቴ /2/
አማልጅን ቶሎ ብለሽ/3/ ሻልጠፋብሽ ልጅሽ /2/
የዳዊት መሰንቆ ነሽ የኢያሱ ሐውልት
በምን እንመስልሽ /3/ ወደርም የለሽ /2/

VERSE 2
አመቤቴ ጥላዬ ሁፒልኝ ከለላዬ /2
ያለአንቺ ማን አለኝ /3/ አለሁሽ በይኝ /2/
አዳምና ሔዋን ከገነት ተሰደው/2/', 'beznabe ntsሕki ሐregeweyn ፀgeye /2/
weroman /2/weroman ሐwaze fereye/2/
amebietie maryam hoy anchin yemaybet/2/
mn ዓyn alegn /5/ fqrsh ayleyegn/2/

VERSE 1
leadam tesfa yehonshw maryam amebietie /2/
amaljn tolo blesh/3/ shalxefabsh ljsh /2/
yedawit mesenqo nesh yeiyasu ሐwlt
bemn enmeslsh /3/ wederm yelesh /2/

VERSE 2
amebietie xlayie hupilgn kelelayie /2
yaleanchi man alegn /3/ alehush beygn /2/
adamna ሔwan kegenet tesedew/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('leamlak-enat-leazagnt-all-enbel-enzemrlet-2', 'ለአምላክ እናት ለአዛኝት አልል እንበል እንዘምርለት/2/', 'ለአምላክ እናት ለአዛኝት አልል እንበል እንዘምርለት/2/', 'leamlak enat leazagnt all enbel enzemrlet/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ለአምላክ እናት ለአዛኝት አልል እንበል እንዘምርለት/2/', 'ወገኖች ተነሥ አናታችን መጣች
ሰሟን ስንጠራ መቼ ትቀራለች
የተከዘን ልታጽናና ነይ ስንላት ትመጣለችና/2/', 'wegenoch teneሥ anatachn mexach
semuan snxera mechie tqeralech
yetekezen ltatsnana ney snlat tmexalechna/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('adera-qdst-anchi-nesh-wasie-2', 'አደራ ቅድስት አንቺ ነሽ ዋሴ /2/', 'አደራ ቅድስት አንቺ ነሽ ዋሴ /2/', 'adera qdst anchi nesh wasie /2/', 'Ethiopian Orthodox Tewahedo Mezmur - አደራ ቅድስት አንቺ ነሽ ዋሴ /2/', 'አጅግ የበዛ ነው ለዘለዓለም
ያለኝ ፍቀር ለዘለዓለም
አይወሰንም ለዘለዓለም
አይነገርም ለዘለዓለም

VERSE 1
በእርሷ ደስ ይለኛል ለዘለዓለም
ሐሴት አደርጋለሁ ለዘለዓለም
ሰሟን አየጠራሁ አዘምራለሁ/ሪ2/', 'ajg yebeza new lezeleዓlem
yalegn fqer lezeleዓlem
aywesenm lezeleዓlem
aynegerm lezeleዓlem

VERSE 1
beersua des ylegnal lezeleዓlem
ሐsiet adergalehu lezeleዓlem
semuan ayexerahu azemralehu/ri2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-xiatien-mexmed-be-xiat-yadefe', 'የኃጢአቴን መጥመድ በኃጢአት ያደፈ', 'የኃጢአቴን መጥመድ በኃጢአት ያደፈ', 'yeኃxiatien mexmed beኃxiat yadefe', 'Ethiopian Orthodox Tewahedo Mezmur - የኃጢአቴን መጥመድ በኃጢአት ያደፈ', 'ድንግል ሆይ አማልጅኝ በኃጢአት ያደፈ
አርቂኝ ከዚህ ጉድ በኃጢአት ያደፈ
በኃጢአት ያደፈ መቆም አቅቶናል
በደሌ በዝቶብኝ በኃጢአት ያደፈ

VERSE 1
አማፀንሻለሁ በኃጢአት ያደፈ
ልመናየን ስሚኝ በኃጢአት ያደፈ
ኃጢአቴን መሽከም በኃጢአት ያደፈ
አጌ አልቻልኩምና በኃጢአት ያደፈ

VERSE 2
አናቴ ሆይ ስሚኝ በኃጢአት ያደፈ
ድንግል በጽሞና በኃጢአት ያደፈ
936.እመቤቴ የአምላክ እናት
አመቤቴ የአምላክ እናት

VERSE 3
ላመስግንሽ ቀን ከሌሊት
ለልጅሽም ክብር ወዳሴ
ታቀርባለች ዘውትር ነፍሴ/4/
ልቤ ተነሣሣ ተቀኝ ለክበርሽ

VERSE 4
በፍጹም ትኅትና ሊያመሰግንሽ
ጽዮን መጠጊያ ነሽ የአብርሃም ድንኳን
የታጠረች ተክል አመብርፃዛን
የለመለመች መስክ አምላክ የመረጣት

VERSE 5
የጽላቱ ኪዳን ታቦቱ ድንግል ናት
የሰማይ የምድር ንግሥት ናትና
ክብር ይገባሻል ዘወትር ጠዋት ማታ
አደራሽን ማርያም የሁሉ እናት

VERSE 6
በምልጃሽ አስቢኝ ኋላ ስራቆት
ያንን የእሳት ባሕር አሻግረኝ ድንግል ሆይ
አንዳልወድቅ እንዳልሞት ከቶ አንዳላይ ስቃይ
937.ከሊባኖስ

VERSE 7
ከሊባኖስ /2/ ከልጅሽ ጋር ነይ
አመ አዶናይ ከሊባኖስ ወደ እኛ ነይ
ጥበቃሽ ዘወትር ከሊባኖስ እንዳይለየኝ
በሔድኩበት ሁሉ ከሊባኖስ ማረፊያ ሁፒኝ', 'dngl hoy amaljgn beኃxiat yadefe
arqign kezih gud beኃxiat yadefe
beኃxiat yadefe meqom aqtonal
bedelie beztobgn beኃxiat yadefe

VERSE 1
amaፀnshalehu beኃxiat yadefe
lmenayen smign beኃxiat yadefe
ኃxiatien meshkem beኃxiat yadefe
agie alchalkumna beኃxiat yadefe

VERSE 2
anatie hoy smign beኃxiat yadefe
dngl betsmona beኃxiat yadefe
936.emebietie yeamlak enat
amebietie yeamlak enat

VERSE 3
lamesgnsh qen kelielit
leljshm kbr wedasie
taqerbalech zewtr nefsie/4/
lbie teneሣሣ teqegn lekbersh

VERSE 4
beftsum tኅtna liyamesegnsh
tsyon mexegiya nesh yeabrሃm dnkuan
yetaxerech tekl amebrፃzan
yelemelemech mesk amlak yemerexat

VERSE 5
yetslatu kidan tabotu dngl nat
yesemay yemdr ngሥt natna
kbr ygebashal zewetr xewat mata
aderashn maryam yehulu enat

VERSE 6
bemljash asbign huala sraqot
yann yeesat baሕr ashagregn dngl hoy
andalwedq endalmot keto andalay sqay
937.kelibanos

VERSE 7
kelibanos /2/ keljsh gar ney
ame adonay kelibanos wede egna ney
xbeqash zewetr kelibanos endayleyegn
beሔdkubet hulu kelibanos marefiya hupign', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wedseni-ljie-beygn', 'ወድሰኒ ልጄ በይኝ', 'ወድሰኒ ልጄ በይኝ', 'wedseni ljie beygn', 'Ethiopian Orthodox Tewahedo Mezmur - ወድሰኒ ልጄ በይኝ', 'በሠርክ ጸሎት ላይ ውዳሴ ማርያም
ዜማ ስናደርስ ውዳሴ ማርያም
ድንግል ትመጣለች ውዳሴ ማርያም
በቤተመቅደስ ውዳሴ ማርያም

VERSE 1
የብርፃዛን ምንጣፍ ውዳሴ ማርያም
ከፊቷ ተነጥፏል ውዳሴ ማርያም
ቅዱስ ኤፍሬም ታጥቆ ውዳሴ ማርያም
ያመሰግናታል ውዳሴ ማርያም

VERSE 2
ወድሰኒ ልጄ በይኝ
በሠርክ ጸሎት ላይ ውዳሴ ማርያም
ዜማ ስናደርስ ውዳሴ ማርያም
ድንግል ትመጣለች ውዳሴ ማርያም

VERSE 3
በቤተ መቅደስ ውዳሴ ማርያም
የብርፃዛን ምንጣፍ ውዳሴ ማርያም
ከፊቷ ተነጥፏል ውዳሴ ማርያም
ቅዱስ ኤፍሬም ታጥቆ ውዳሴ ማርያም

VERSE 4
ያመሰግናታል ውዳሴ ማርያም', 'beሠrk tselot lay wdasie maryam
ziema snaders wdasie maryam
dngl tmexalech wdasie maryam
bebietemeqdes wdasie maryam

VERSE 1
yebrፃzan mnxaf wdasie maryam
kefitua tenexfual wdasie maryam
qdus iefriem taxqo wdasie maryam
yamesegnatal wdasie maryam

VERSE 2
wedseni ljie beygn
beሠrk tselot lay wdasie maryam
ziema snaders wdasie maryam
dngl tmexalech wdasie maryam

VERSE 3
bebiete meqdes wdasie maryam
yebrፃzan mnxaf wdasie maryam
kefitua tenexfual wdasie maryam
qdus iefriem taxqo wdasie maryam

VERSE 4
yamesegnatal wdasie maryam', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dawit-begenawn-wdasie-maryam', 'ዳዊት በገናውን ውዳሴ ማርያም', 'ዳዊት በገናውን ውዳሴ ማርያም', 'dawit begenawn wdasie maryam', 'Ethiopian Orthodox Tewahedo Mezmur - ዳዊት በገናውን ውዳሴ ማርያም', 'ዳዊት በገናውን ውዳሴ ማርያም
እየደረደረ ውዳሴ ማርያም
የንጽሕናችንን ውዳሴ ማርያም
መሠረት ነሽና ውዳሴ ማርያም

VERSE 1
አንቺን ለማመስገን ውዳሴ ማርያም
ልቡናዬ ይብራ ውዳሴ ማርያም
ተፈሥሒ ደንገል ውዳሴ ማርያም
ኦ ቤተልሔም ውዳሴ ማርያም

VERSE 2
ከአንቺ ተወለደ ውዳሴ ማርያም', 'dawit begenawn wdasie maryam
eyederedere wdasie maryam
yentsሕnachnn wdasie maryam
meሠret neshna wdasie maryam

VERSE 1
anchin lemamesgen wdasie maryam
lbunayie ybra wdasie maryam
tefeሥሒ dengel wdasie maryam
o bietelሔm wdasie maryam

VERSE 2
keanchi tewelede wdasie maryam', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ayederedere-wdasie-maryam', 'አየደረደረ ውዳሴ ማርያም', 'አየደረደረ ውዳሴ ማርያም', 'ayederedere wdasie maryam', 'Ethiopian Orthodox Tewahedo Mezmur - አየደረደረ ውዳሴ ማርያም', 'የንጽሕናችንን ውዳሴ ማርያም
መሠረት ነሽና ውዳሴ ማርያም
አንቺን ለማመስገን ውዳሴ ማርያም
ልቡናዬ ይብራ ውዳሴ ማርያም

VERSE 1
ተፈሥሒ ድንግል ውዳሴ ማርያም
ኦ ቤተልሔም ውዳሴ ማርያም
ከአንቺ ተወለደ ውዳሴ ማርያም', 'yentsሕnachnn wdasie maryam
meሠret neshna wdasie maryam
anchin lemamesgen wdasie maryam
lbunayie ybra wdasie maryam

VERSE 1
tefeሥሒ dngl wdasie maryam
o bietelሔm wdasie maryam
keanchi tewelede wdasie maryam', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('teqemxeshe-saysh-wdasie-maryam', 'ተቀምጠሸ ሳይሽ ውዳሴ ማርያም', 'ተቀምጠሸ ሳይሽ ውዳሴ ማርያም', 'teqemxeshe saysh wdasie maryam', 'Ethiopian Orthodox Tewahedo Mezmur - ተቀምጠሸ ሳይሽ ውዳሴ ማርያም', 'ተቀምጠሸ ሳይሽ ውዳሴ ማርያም
ልቤ ተሰወረ ውዳሴ ማርያም
ድንግል ተሰወረ ውዳሴ ማርያም', 'teqemxeshe saysh wdasie maryam
lbie tesewere wdasie maryam
dngl tesewere wdasie maryam', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('dengl-begrmash-wdasie-maryam', 'ደንግል በግርማሽ ውዳሴ ማርያም', 'ደንግል በግርማሽ ውዳሴ ማርያም', 'dengl begrmash wdasie maryam', 'Ethiopian Orthodox Tewahedo Mezmur - ደንግል በግርማሽ ውዳሴ ማርያም', 'ደንግል በግርማሽ ውዳሴ ማርያም
1078.. ኦ ድንግል
ኦ ድንግል አምሳል ወትንቢት /2/ ለነቢያት /2/
ሞገሶሙ ለሐዋርያት /4/', 'dengl begrmash wdasie maryam
1078.. o dngl
o dngl amsal wetnbit /2/ lenebiyat /2/
mogesomu leሐwaryat /4/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lam-leki-yeselomon-menbere-kbru', 'ሠላም ለኪ የሰሎሞን መንበረ ክብሩ', 'ሠላም ለኪ የሰሎሞን መንበረ ክብሩ', 'ሠlam leki yeselomon menbere kbru', 'Ethiopian Orthodox Tewahedo Mezmur - ሠላም ለኪ የሰሎሞን መንበረ ክብሩ', 'ሠላም ለኪ ለፍሬ ስብሐት መጾሩ /2
አመ አግዚአብሔር ፀባኦት ሰላም
ለኪ/2/
ሠላም ለኪ ሰረገላሁ ለአሚናዳብ', 'ሠlam leki lefrie sbሐt metsoru /2
ame agziabሔr ፀbaot selam
leki/2/
ሠlam leki seregelahu leaminadab', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('hona-tegegntalech', 'ሆና ተገኝታለች', 'ሆና ተገኝታለች', 'hona tegegntalech', 'Ethiopian Orthodox Tewahedo Mezmur - ሆና ተገኝታለች', 'ሀገረ እግዚአብሔር
አናመሥግናት የልዑል ዘፋኑ
መንበረ ጸባኦት
የኪሩቤል ሞገስ

VERSE 1
መንፈሳዊ ታቦት
በልዩ ዝማሬ
አንደ መላእክት
ስሟን እናወድስ

VERSE 2
አንበላት ቅድስት
9086.አመብርፃን መመኪያአችን
አምብርሃን መመኪያችን/2/
የአዳም ተስፋው አለኝታችን

VERSE 3
አመብርሃን መመኪያችን
አመብርዛፃን የአባቶቻችን
ቃና ለዛቸው
ሆና ተገኝታለች

VERSE 4
ለሚመኩባት', 'hagere egziabሔr
anameሥgnat yelዑl zefanu
menbere tsebaot
yekirubiel moges

VERSE 1
menfesawi tabot
belyu zmarie
ande melaekt
smuan enaweds

VERSE 2
anbelat qdst
9086.amebrፃn memekiyaachn
ambrሃn memekiyachn/2/
yeadam tesfaw alegntachn

VERSE 3
amebrሃn memekiyachn
amebrzaፃn yeabatochachn
qana lezachew
hona tegegntalech

VERSE 4
lemimekubat', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('da-emebietie-des-ybeln', 'ፀዓዳ እመቤቴ ደስ ይበልን', 'ፀዓዳ እመቤቴ ደስ ይበልን', 'ፀዓda emebietie des ybeln', 'Ethiopian Orthodox Tewahedo Mezmur - ፀዓዳ እመቤቴ ደስ ይበልን', 'ሐመልማለ ሲና ደስ ይበለን
የሕዝቅኤል ደጃፍ
የሙሴ ደመና
የተዋበች እንቁ

VERSE 1
የደጎች አዝመራ
በማኅፀንሽ ፍሬ
ሕይወታችን በራ
950.በሀዘኔ

VERSE 2
በሐዘኔ ደራሽ ነሽ በጭነቀቴ
በችግሬ ደራሽ ነሽ
የአምላኬ አናት የጌታዬ አናት
ድንግል አመቤቴ ወላዲተ ቃል /2

VERSE 3
መላካሚቱ ርግብ ድንግል አመቤቴ', 'ሐmelmale sina des ybelen
yeሕzqiel dejaf
yemusie demena
yetewabech enqu

VERSE 1
yedegoch azmera
bemaኅፀnsh frie
ሕywetachn bera
950.behazenie

VERSE 2
beሐzenie derash nesh becneqetie
bechgrie derash nesh
yeamlakie anat yegietayie anat
dngl amebietie weladite qal /2

VERSE 3
melakamitu rgb dngl amebietie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('maryam-anatienesh-dngl-amebietie', 'ማርያም አናቴነሽ ድንግል አመቤቴ', 'ማርያም አናቴነሽ ድንግል አመቤቴ', 'maryam anatienesh dngl amebietie', 'Ethiopian Orthodox Tewahedo Mezmur - ማርያም አናቴነሽ ድንግል አመቤቴ', 'ከፍጥረታት ሁሉ ድንግል አመቤቴ
ገናና ነው ክብርሽ ድንግል አመቤቴ
የሐዘኔ መጽናኛ ድንግል አመቤቴ
እንባን አባሽነሽ ድንግል አመቤቴ', 'kefxretat hulu dngl amebietie
genana new kbrsh dngl amebietie
yeሐzenie metsnagna dngl amebietie
enban abashnesh dngl amebietie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeenatnetsh-dngl-amebietie', 'የእናትነትሽ ድንግል አመቤቴ', 'የእናትነትሽ ድንግል አመቤቴ', 'yeenatnetsh dngl amebietie', 'Ethiopian Orthodox Tewahedo Mezmur - የእናትነትሽ ድንግል አመቤቴ', 'ፍቅርሽን አየሁት ድንግል እመቤቴ
ጎጆዬን ስትሞይው ድንግል እመቤቴ
ባዶ የሆነውን ድንግል አመቤቴ
አንቺ እያለሸልኝ ድንግል አመቤቴ

VERSE 1
ምን እሆናለሁኝ ድንግል አመቤቴ', 'fqrshn ayehut dngl emebietie
gojoyien stmoyw dngl emebietie
bado yehonewn dngl amebietie
anchi eyaleshelgn dngl amebietie

VERSE 1
mn ehonalehugn dngl amebietie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beqebitse-tesfa-dngl-emebietie', 'በቀቢጸ ተስፋ ድንግል እመቤቴ', 'በቀቢጸ ተስፋ ድንግል እመቤቴ', 'beqebitse tesfa dngl emebietie', 'Ethiopian Orthodox Tewahedo Mezmur - በቀቢጸ ተስፋ ድንግል እመቤቴ', 'እንዳልወደልቅብሽ ድንግል እመቤቴ
በቀንም በሌሊት ድንግል አመቤቴ
ተስፋዬ አንቺ ነሽ ድንግል አመቤቴ
የለም ያተረፍኩት ድንግል እመቤቴ

VERSE 1
ወጥቼ ወርጄ /2/ ድንግል እመቤቴ
ትርፌ አንቺ ብቻ ነሽ ድንግል አመቤቴ
ጽዮን አማላጄ ድንግል አመቤቴ
952የገነት ደጃፍ

VERSE 2
የገነት ደጃፍ ማርያም ነሽ
የወርቅ መሰላል ድንግል ነሽ
የአምላክ እናት ማርያም ነሽ
ክብርና ውዳሴ ለአንቺ ይገባሻል

VERSE 3
አምላክ አንቺን ወዶ ባርኮ ቅድሶሻል
የተዘጋች በር የታተመች ገነት
ድንግል እና እናት ሰማያዊት ንግሥት
የመለኮት እናት እሳትን ያዘለች

VERSE 4
የአደራ እናታቸን እመቤታችን ናች
የሰማይ መላዕክት እያሸበሸቡ', 'endalwedelqbsh dngl emebietie
beqenm belielit dngl amebietie
tesfayie anchi nesh dngl amebietie
yelem yaterefkut dngl emebietie

VERSE 1
wexchie werjie /2/ dngl emebietie
trfie anchi bcha nesh dngl amebietie
tsyon amalajie dngl amebietie
952yegenet dejaf

VERSE 2
yegenet dejaf maryam nesh
yewerq meselal dngl nesh
yeamlak enat maryam nesh
kbrna wdasie leanchi ygebashal

VERSE 3
amlak anchin wedo barko qdsoshal
yetezegach ber yetatemech genet
dngl ena enat semayawit ngሥt
yemelekot enat esatn yazelech

VERSE 4
yeadera enatachen emebietachn nach
yesemay melaዕkt eyashebeshebu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('anatu-neshna-anchi-leadonay', 'አናቱ ነሽና አንቺ ለአዶናይ', 'አናቱ ነሽና አንቺ ለአዶናይ', 'anatu neshna anchi leadonay', 'Ethiopian Orthodox Tewahedo Mezmur - አናቱ ነሽና አንቺ ለአዶናይ', 'ማለድኩኝ ከፊትሽ ይቅርታውን እንዳይ
ሰአሊነ ብዬ ይኸው ተምሬአለሁ
በአንቺ ተደግፌ ነገም አኖራለሁ
ነይ ነይ እልሻለሁ አንደ ካህናቱ

VERSE 1
በሰዓታት ጸሎት ቆሜ በሌሊቱ
ዝም አልልም አኔ አወድስሻለሁ
የዓለምን መከራ አረሳብሻለሁ
955 በምድራዊ

VERSE 2
በምድራዊ ሕይወት/2/ በፈተና ቦታ/2/
ድንግል ትጠብቀን እጆቿን ዘርግታ', 'maledkugn kefitsh yqrtawn enday
sealine byie yኸw temriealehu
beanchi tedegfie negem anoralehu
ney ney elshalehu ande kahnatu

VERSE 1
beseዓtat tselot qomie belielitu
zm allm anie awedsshalehu
yeዓlemn mekera aresabshalehu
955 bemdrawi

VERSE 2
bemdrawi ሕywet/2/ befetena bota/2/
dngl txebqen ejoቿn zergta', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beqal-kidansh-2-bemiyadnew-qal-kidansh', 'በቃል ኪዳንሽ/2/ በሚያድነው ቃል ኪዳንሽ', 'በቃል ኪዳንሽ/2/ በሚያድነው ቃል ኪዳንሽ', 'beqal kidansh/2/ bemiyadnew qal kidansh', 'Ethiopian Orthodox Tewahedo Mezmur - በቃል ኪዳንሽ/2/ በሚያድነው ቃል ኪዳንሽ', 'አምላክ ስለሰጠሸ የምሕረት ቃል ኪዳን
ጻድቃንን ለማትጋት ኃጥኡን ለማዳን
የምሕረትን ምጽዋት አለምንሻለሁ
ይቅርታን ለማግኘት አጄን ዘርግቻለሁ

VERSE 1
የሊቀካህናቱ የክርስቶስ እናት
ለምፒልን ቅድስት ለኃጢአቴ ሥርየት
በሥጋም በነፍስም ይቅር አስብይኝ
ከበደሌ ዕዳ ንጹሕ አድርጊኝ', 'amlak slesexeshe yemሕret qal kidan
tsadqann lematgat ኃxun lemadan
yemሕretn mtswat alemnshalehu
yqrtan lemaggnet ajien zergchalehu

VERSE 1
yeliqekahnatu yekrstos enat
lempiln qdst leኃxiatie ሥryet
beሥgam benefsm yqr asbygn
kebedelie ዕda ntsuሕ adrgign', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeiedom-wenz-yegenat-fesash', 'የኤዶም ወንዝ የገናት ፈሳሽ', 'የኤዶም ወንዝ የገናት ፈሳሽ', 'yeiedom wenz yegenat fesash', 'Ethiopian Orthodox Tewahedo Mezmur - የኤዶም ወንዝ የገናት ፈሳሽ', 'ምክንያተ ድኅነት ሰው የዳነብሽ
ንጹሑን በግ ጌታን ያስገኘሽ
አብርሃም ያየሽ እፀ ሣቤቅ ነሽ', 'mknyate dኅnet sew yedanebsh
ntsuሑn beg gietan yasgegnesh
abrሃm yayesh eፀ ሣbieq nesh', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gelilawit-dngl-yegenet-fe-sh', 'ገሊላዊት ድንግል የገነት ፈሣሽ', 'ገሊላዊት ድንግል የገነት ፈሣሽ', 'gelilawit dngl yegenet feሣsh', 'Ethiopian Orthodox Tewahedo Mezmur - ገሊላዊት ድንግል የገነት ፈሣሽ', 'የቆሠለችውን ሕይወቴን ፈውሽ
ሰአሊ ለነ ቅድስት በቀን በሌሊት
ለአፌ ጥበብ ነሽ ቅኔ ማኅሌት', 'yeqoሠlechwn ሕywetien fewsh
seali lene qdst beqen belielit
leafie xbeb nesh qnie maኅliet', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('l-l-mra', 'ልዑል ሠምራ', 'ልዑል ሠምራ', 'lዑl ሠmra', 'Ethiopian Orthodox Tewahedo Mezmur - ልዑል ሠምራ', 'ልዑል ሠምራ ዳዊት ዘመራ/2/
በቤተመቅደስ ተወክፋዋ/2/
ልዑል መረጣት ዳዊት ዘመረላት/2/
በቤተመቅደስ ተቀበሏት/''4/

VERSE 1
964.አንዘ ዘልፈ
አንዘ ዘልፈ ትነበር ውስተ ቤተ እግዚአብሔር/2/
አስተርዓየ መልአከ ዘኢኮነ /2/ ከመቀዲሙ ኢኮነ /2/', 'lዑl ሠmra dawit zemera/2/
bebietemeqdes tewekfawa/2/
lዑl merexat dawit zemerelat/2/
bebietemeqdes teqebeluat/''4/

VERSE 1
964.anze zelfe
anze zelfe tneber wste biete egziabሔr/2/
asterዓye melake zeikone /2/ kemeqedimu ikone /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('manm-yalgebabat-keamlak-besteqer', 'ማንም ያልገባባት ከአምላክ በስተቀር', 'ማንም ያልገባባት ከአምላክ በስተቀር', 'manm yalgebabat keamlak besteqer', 'Ethiopian Orthodox Tewahedo Mezmur - ማንም ያልገባባት ከአምላክ በስተቀር', 'የልዑል ማደሪያው አማናዊት መቅደስ
ስለንጽሕናሽ ምስጋናን እናቅርብ
ማንም ያልገባባት ከአምላክ በስተቀር
የልዑል ማደሪያ አማናዊት መቅደስ

VERSE 1
ስለ ንጽሕናሽ ምስጋናን እናድርስ', 'yelዑl maderiyaw amanawit meqdes
slentsሕnash msganan enaqrb
manm yalgebabat keamlak besteqer
yelዑl maderiya amanawit meqdes

VERSE 1
sle ntsሕnash msganan enadrs', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('m-raqe-m-raqat-dngl-hoy-anchi-nesh', 'ምሥራቀ ምሥራቃት ድንግል ሆይ አንቺ ነሽ', 'ምሥራቀ ምሥራቃት ድንግል ሆይ አንቺ ነሽ', 'mሥraqe mሥraqat dngl hoy anchi nesh', 'Ethiopian Orthodox Tewahedo Mezmur - ምሥራቀ ምሥራቃት ድንግል ሆይ አንቺ ነሽ', 'ጨረቃን የምታመስይ ፀሐይን የወለድሽ
የማለዳ ብርሃን ለዓይን የምታሣሺ
ምሥራቀ ምሥራቃት ድንግል ሆይ አንቺ ነሽ
ጨረቃን የምትመስይ ፀሐይን የወለድሽ

VERSE 1
የማለዳ ብርፃን ለዓይን የምታሳሺ
ጽዮን እናቴ ሆይ ከጎኔ አትሽሺ', 'cereqan yemtamesy ፀሐyn yeweledsh
yemaleda brሃn leዓyn yemtaሣshi
mሥraqe mሥraqat dngl hoy anchi nesh
cereqan yemtmesy ፀሐyn yeweledsh

VERSE 1
yemaleda brፃn leዓyn yemtasashi
tsyon enatie hoy kegonie atshshi', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('sali-lene-maryam-sealilene-ri', 'ስአሊ ለነ ማርያም ሰአሊለነ /ሪ/', 'ስአሊ ለነ ማርያም ሰአሊለነ /ሪ/', 'sali lene maryam sealilene /ri/', 'Ethiopian Orthodox Tewahedo Mezmur - ስአሊ ለነ ማርያም ሰአሊለነ /ሪ/', 'አክሊለ ንጹሐን /2 ሰአሊለነ /4
ለምኝልን ማርያም ለምኝልን /2
የንጹሐን አክሊል /2 ለምኝልን /4
974. ንጽሕተ ንጹሐን', 'aklile ntsuሐn /2 sealilene /4
lemgnln maryam lemgnln /2
yentsuሐn aklil /2 lemgnln /4
974. ntsሕte ntsuሐn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('aqedm-aekutoto', 'አቀድም አእኩቶቶ', 'አቀድም አእኩቶቶ', 'aqedm aekutoto', 'Ethiopian Orthodox Tewahedo Mezmur - አቀድም አእኩቶቶ', 'አቀድም አአእኩቶቶ ለእግዚአብሔር /2/
በእንተ እግዚእነ ኢየሱስ ክርስቶስ /2/
976..ሰላም ሰላም
ሰላም ሰላም /2/ ማርያም ድንግል

VERSE 1
ልመናሽ ለሚያምኑት ድኅነት ያሰጣል /2/
ደቀ መዛሙርቱ በሐሳብ ሲዋኙ
በጽኑ ጾማቸው ምልክት አገኙ', 'aqedm aaekutoto leegziabሔr /2/
beente egziene iyesus krstos /2/
976..selam selam
selam selam /2/ maryam dngl

VERSE 1
lmenash lemiyamnut dኅnet yasexal /2/
deqe mezamurtu beሐsab siwagnu
betsnu tsomachew mlkt agegnu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('aj-mensha-aqerebu-bietel-m', 'አጅ መንሻ አቀረቡ ቤተልሔም', 'አጅ መንሻ አቀረቡ ቤተልሔም', 'aj mensha aqerebu bietelሔm', 'Ethiopian Orthodox Tewahedo Mezmur - አጅ መንሻ አቀረቡ ቤተልሔም', 'የምስራች ነገስታት ቤተልሔም
ህፃኑን ከእናቱ ቤተልሔም
ተኝቶ አገኙት ቤተልሔም
ቅዱሳን መላእክት ቤተልሔም

VERSE 1
ያሸበሸቡለት ቤተልሔም
ስብሀት ለእግዚአብሔር ቤተልሔም
ብለው ዘመሩለት ቤተልሔም
252.እስመ አምዘርዓ

VERSE 2
ዳዊት
አስመ እምዘርዓ ዳዊት ዘመጽአ/2/
በቤተልሔም ዘይሁዳ በቤተልሔም እንዘይ/2/
253.ሶበ ሰማዕነ

VERSE 3
ሶበ ሰማዕነ ዜናከ መጽአነ ኀቤከ/2/
መጽአነ/4/
አንቺ ቤተልሔም የዳዊት ከተማ
የምስራች ቃሉ በአንቺ ቤት ተሰማ

VERSE 4
ወልድም ተሰጠን ሕፃን ተወለደ
አስጨናቂው ዘመን በአርሱ ተወገደ
ሰውና መላእክት በአንድ ላይ ዘመሩ
የአግዚአብሔርን ክብር ለዓለም መሰከሩ

VERSE 5
ምስጋና በሰማይ ለአግዚአብሔር ይሁን
ሰላም ለሰው ልጆች በምድር ላይ ይስፈን
አናትና ልጅ ፀሐይ ሳይነካቸው
የእግዚአብሔር መላእክት ከፊታቸው

VERSE 6
ወድቀው
በከብቶች በረት አምላክ ተወለደ
የነገሥታት ንሥስ ሞትን አስወገደ
ድንቅ መካር ሀያል የሰላም አለቃ

VERSE 7
ጌታ ሆይ በስምህ ግዛቱ አበቃ
ሰላምን የሚሰጥ አልፋና ዖሜጋ
አጅ መንሻ አቀረቡ ቤተልሔም
የምሥራቅ ነገሥታት ቤተልሔም', 'yemsrach negestat bietelሔm
hፃnun keenatu bietelሔm
tegnto agegnut bietelሔm
qdusan melaekt bietelሔm

VERSE 1
yashebeshebulet bietelሔm
sbhat leegziabሔr bietelሔm
blew zemerulet bietelሔm
252.esme amzerዓ

VERSE 2
dawit
asme emzerዓ dawit zemetsa/2/
bebietelሔm zeyhuda bebietelሔm enzey/2/
253.sobe semaዕne

VERSE 3
sobe semaዕne zienake metsane ኀbieke/2/
metsane/4/
anchi bietelሔm yedawit ketema
yemsrach qalu beanchi biet tesema

VERSE 4
weldm tesexen ሕፃn tewelede
ascenaqiw zemen bearsu tewegede
sewna melaekt beand lay zemeru
yeagziabሔrn kbr leዓlem mesekeru

VERSE 5
msgana besemay leagziabሔr yhun
selam lesew ljoch bemdr lay ysfen
anatna lj ፀሐy saynekachew
yeegziabሔr melaekt kefitachew

VERSE 6
wedqew
bekebtoch beret amlak tewelede
yenegeሥtat nሥs motn aswegede
dnq mekar hayal yeselam aleqa

VERSE 7
gieta hoy besmh gzatu abeqa
selamn yemisex alfana ዖmiega
aj mensha aqerebu bietelሔm
yemሥraq negeሥtat bietelሔm', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('y-reqe-krstos-texemqe-4', 'ፀሐይ ሠረቀ ክርስቶስ ተጠምቀ /4', 'ፀሐይ ሠረቀ ክርስቶስ ተጠምቀ /4', 'ፀሐy ሠreqe krstos texemqe /4', 'Ethiopian Orthodox Tewahedo Mezmur - ፀሐይ ሠረቀ ክርስቶስ ተጠምቀ /4', 'አንቺ ዮርዳኖስ ምንኛ ታደልሽ /ቴ
የአግዚአብሔር መንፈስ ከላይ ወርዶልሽ
የዓለም መድኃኒት ተጠመቀብሽ
ድንግል ማርያም ንጽሕት ቅድስት /4

VERSE 1
የጌታ አናት ምስጋና ይገባሻል
ከሴቶች ሁሉ አንቺን መርጦሻል
አልል አልል ደስ ይበለን /2/
ወልድ ተወልዶ ነጻ ወጣን

VERSE 2
ዮሐንስ ሲያጠምቀው ድል አገኘን
998አምላክ ለእኛ ብሎ
አምላክ ለእኛ ብሎ ቃል ኪዳን የሰጣት /2/
የኃጥአን አማላጅ ድንግል ማርያም ናት /

VERSE 3
አንደ አማለድሽው በላዔ ሰብእን /2/
አኛንም አባክህ አደራ አማልጅን /4
ምሕረት እንድናገኝ ከአምላካችን /2/
አማላጅ ሁኝልን አመቤታችን /4', 'anchi yordanos mngna tadelsh /tie
yeagziabሔr menfes kelay werdolsh
yeዓlem medኃnit texemeqebsh
dngl maryam ntsሕt qdst /4

VERSE 1
yegieta anat msgana ygebashal
kesietoch hulu anchin merxoshal
all all des ybelen /2/
weld teweldo netsa wexan

VERSE 2
yoሐns siyaxemqew dl agegnen
998amlak leegna blo
amlak leegna blo qal kidan yesexat /2/
yeኃxan amalaj dngl maryam nat /

VERSE 3
ande amaledshw belaዔ seben /2/
agnanm abakh adera amaljn /4
mሕret endnagegn keamlakachn /2/
amalaj hugnln amebietachn /4', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('keanchi-betegegnew-bemelkamu-frie-2', 'ከአንቺ በተገኘው በመልካሙ ፍሬ /2/', 'ከአንቺ በተገኘው በመልካሙ ፍሬ /2/', 'keanchi betegegnew bemelkamu frie /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ከአንቺ በተገኘው በመልካሙ ፍሬ /2/', 'ዓለም ተቀድሷል ነጻ ወጥቷል ዛሬ /4#
ከአንቺ በተገኘው በመልካሙ ፍሬ /2/
ዓለም ተቀድሷል ነጻ ወጥቷል ዛሬ /#', 'ዓlem teqedsual netsa wextual zarie /4#
keanchi betegegnew bemelkamu frie /2/
ዓlem teqedsual netsa wextual zarie /#', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeabr-m-amlak-yeys-qm-bieza-2', 'የአብርሃም አምላክ የይስሐቅም ቤዛ', 'የአብርሃም አምላክ የይስሐቅም ቤዛ', 'yeabrሃm amlak yeysሐqm bieza /2/', 'Ethiopian Orthodox Tewahedo Mezmur - የአብርሃም አምላክ የይስሐቅም ቤዛ', 'ወገኖቹን ሁሉ በራሱ ደም ገዛ/2/
የሐስት ምስክር አቁመው ከሰሱት /2/
በሞት እንዲቀጣ ሁሉም ፈረዱበት/2/
ጴላጦስ ገረፈው በሰንሰለት አስር''2/

VERSE 1
ከሮማዊው መንግሥት እንዲኖር ተፋቅሮ/2/
ድንግል አልቻለችም እንባዋን ልትገታ /2/
እያየች በመስቀል ልጂ ሲንገላታ /2/
የአብርሃም አምላክ የይስሐቅም ቤዛ', 'wegenochun hulu berasu dem geza/2/
yeሐst mskr aqumew kesesut /2/
bemot endiqexa hulum feredubet/2/
phielaxos gerefew besenselet asr''2/

VERSE 1
keromawiw mengሥt endinor tefaqro/2/
dngl alchalechm enbawan ltgeta /2/
eyayech bemesqel lji singelata /2/
yeabrሃm amlak yeysሐqm bieza', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('wegenochun-hulu-berasu-dem-geza-ye-set-mskr', 'ወገኖቹን ሁሉ በራሱ ደም ገዛ የሐሰት ምስክር', 'ወገኖቹን ሁሉ በራሱ ደም ገዛ የሐሰት ምስክር', 'wegenochun hulu berasu dem geza yeሐset mskr', 'Ethiopian Orthodox Tewahedo Mezmur - ወገኖቹን ሁሉ በራሱ ደም ገዛ የሐሰት ምስክር', 'አቁመው ከሰሱት
በሞት እንዲቀጣ ሁሉም ፈረዱበት
ጴላጦስ ገረፈው በሠንሠለት አሥሮ
በአይሁድ መካከል እንዲኖር ተከብሮ

VERSE 1
ድንግል አልቻለችም እንባዋን ልትገታ
አያየች በመስቀል ልጂ ሲንገላታ
በብርዛን ዙፋን ላይ የቆሙት እግሮቹ
በችንካር ላይ ቆሙ ምንም አልሰለቹ

VERSE 2
የብርሃን አክሊልን ለሰማዕት ያደለ
የሾህ አክሊል ደፍቶ ቀራንዮ ዋለ
1906.አም እቶነ አሳት', 'aqumew kesesut
bemot endiqexa hulum feredubet
phielaxos gerefew beሠnሠlet aሥro
beayhud mekakel endinor tekebro

VERSE 1
dngl alchalechm enbawan ltgeta
ayayech bemesqel lji singelata
bebrzan zufan lay yeqomut egrochu
bechnkar lay qomu mnm alselechu

VERSE 2
yebrሃn akliln lesemaዕt yadele
yeshoh aklil defto qeranyo wale
1906.am etone asat', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yakebratal-senbetn-melaekt-besemayat-tsadqanm', 'ያከብራታል ሰንበትን መላእክት በሰማያት ጻድቃንም', 'ያከብራታል ሰንበትን መላእክት በሰማያት ጻድቃንም', 'yakebratal senbetn melaekt besemayat tsadqanm', 'Ethiopian Orthodox Tewahedo Mezmur - ያከብራታል ሰንበትን መላእክት በሰማያት ጻድቃንም', 'በገነት /2/
ፍጥረታት በሙሉ ዓሳዎችና አንበሪዎች በመቃብር ያሉ
ያከብራታል አምላክ በእርሷ እንዳረፈ ከሥራው ሁሉ /2/
1009. ኩሎ ዘፈቀደ

VERSE 1
ኩሎ ዘፈቀደ ገብረ አግዚአብሔር /2/', 'begenet /2/
fxretat bemulu ዓsawochna anberiwoch bemeqabr yalu
yakebratal amlak beersua endarefe keሥraw hulu /2/
1009. kulo zefeqede

VERSE 1
kulo zefeqede gebre agziabሔr /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('motn-bemotu-shareln-endanreta-2', 'ሞትን በሞቱ ሻረልን እንዳንረታ /2/', 'ሞትን በሞቱ ሻረልን እንዳንረታ /2/', 'motn bemotu shareln endanreta /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ሞትን በሞቱ ሻረልን እንዳንረታ /2/', '191]ፈ4ወደ ቤተ አግዚአብሔር
ወደ ቤተ አግዚአብሔር እንሒድ ሲሉኝ /2/
አንደ ዳዊት አንደ ንጉሥ ተደሰትኩኝ /4
መላእክት በሰማይ የሚያመሰግነህ /2/

VERSE 1
አምላካችን ፈቃድህ ይሁን እንዘምርልህ /ቁ
ሞትን አሸንፎ ለተነሣው ጌታ /2/
ዘምሩለት ተቀኙለት ጠዋትና ማታ/ሇቴ
በመስቀል ላይ ሆኖ ሲወጋ ጎኑን /2/

VERSE 2
ውኃና ደም በአንድ ላይ ሆኖ ፈሰሰልን /4#
በውኃው ተጠምቀን ደሙን ጠጥተን
መንግሥቱን እንድንወርስ ስላደረገን
ስሙ ይመስገን የጌታችን

VERSE 3
ስሙ ይመስገን የአምላካችን
191ፈ.ቅዱስ
ቅዱስ ቅዱስ ቅዱስ አግዚአብሔር
ለአማልክት አምላክ እናቅርብለት ምስጋና

VERSE 4
ምሕረቱ ለዘለዓለም ነውና
ለነገሥታት ንጉሥ እናቅርብለት
ምስጋና', '191]fe4wede biete agziabሔr
wede biete agziabሔr enሒd silugn /2/
ande dawit ande nguሥ tedesetkugn /4
melaekt besemay yemiyamesegneh /2/

VERSE 1
amlakachn feqadh yhun enzemrlh /qu
motn ashenfo leteneሣw gieta /2/
zemrulet teqegnulet xewatna mata/ሇtie
bemesqel lay hono siwega gonun /2/

VERSE 2
wኃna dem beand lay hono feseseln /4#
bewኃw texemqen demun xexten
mengሥtun endnwers sladeregen
smu ymesgen yegietachn

VERSE 3
smu ymesgen yeamlakachn
191fe.qdus
qdus qdus qdus agziabሔr
leamalkt amlak enaqrblet msgana

VERSE 4
mሕretu lezeleዓlem newna
lenegeሥtat nguሥ enaqrblet
msgana', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeys-q-me-za-2', 'የይስሐቅ መዓዛ', 'የይስሐቅ መዓዛ', 'yeysሐq meዓza /2/', 'Ethiopian Orthodox Tewahedo Mezmur - የይስሐቅ መዓዛ', 'አንዘ ንሴፎ ለበረከትኪ ዘምስለ
አምኃ ንሰግድ ለኪ/ሪ2/
ሠላም ለኪ ኅብስተ መና ዘእአስራኤል
ሠላም ለኪ የሰማዕታት ንጹሕ አክሊል

VERSE 1
ሠላም እፀ ጳጦስ ዘሲና
የይስሐቅ መዓዛ', 'anze nsiefo lebereketki zemsle
amኃ nsegd leki/ri2/
ሠlam leki ኅbste mena zeeasraiel
ሠlam leki yesemaዕtat ntsuሕ aklil

VERSE 1
ሠlam eፀ phaxos zesina
yeysሐq meዓza', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('amne-emne-ni', 'አምነ እምነ ንኢ', 'አምነ እምነ ንኢ', 'amne emne ni', 'Ethiopian Orthodox Tewahedo Mezmur - አምነ እምነ ንኢ', 'አምነ እምነ ንኢ /
በሰላም /2/ ንኢ ማርያም /2/
አምላክ ንአ ንአ /2/
በሰላም /2/ አምላክ ንአ /2/', 'amne emne ni /
beselam /2/ ni maryam /2/
amlak na na /2/
beselam /2/ amlak na /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yexerush', 'የጠሩሽ', 'የጠሩሽ', 'yexerush', 'Ethiopian Orthodox Tewahedo Mezmur - የጠሩሽ', 'የጠሩሽ አንቺን ተማጽው የዳትኑብሽ
የበላኤ ሰብአ አመቤት የአምላክ እናት
ድንግል አዛኝቱ ማርያም ቅድስት
በቃል ኪዳንሽ ብዙዎች ድነዋል

VERSE 1
በምልጃሽም ጽድቅን አግኝተዋል
የአምላክ ቸርነቱን አውቀዋል /2/', 'yexerush anchin tematsw yedatnubsh
yebelaie seba amebiet yeamlak enat
dngl azagntu maryam qdst
beqal kidansh bzuwoch dnewal

VERSE 1
bemljashm tsdqn aggntewal
yeamlak chernetun awqewal /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kidane-m-ret-amebiet', 'ኪዳነ ምሕረት አመቤት', 'ኪዳነ ምሕረት አመቤት', 'kidane mሕret amebiet', 'Ethiopian Orthodox Tewahedo Mezmur - ኪዳነ ምሕረት አመቤት', 'ኪዳነ ምሕረት አመቤት
ለዓለም ሁሉ መድኃኒት
ቅድስተ ቅዱሳን ብፅዕት
አንቺ ነሽ ለአምላካችን እናት

VERSE 1
ጌታችን ፈጠረሽ ልዩ አድርጎ
በሚያስደንቅ ምሥጢሩ ተዋሕዶ
ለልዑል ማደሪያነት የተመረጥሽ
ያለ ሕማም ወለድሽው ድንግል ሆነሽ

VERSE 2
አናትነት ድንግልና
አስተባብረሽ ይዘሻልና
ድንግልም አናትም አመብርፃነን
ንጽሕተ ንጹሐን እኛን አማልጂን

VERSE 3
193ፈማርያም ድንግል', 'kidane mሕret amebiet
leዓlem hulu medኃnit
qdste qdusan bፅዕt
anchi nesh leamlakachn enat

VERSE 1
gietachn fexeresh lyu adrgo
bemiyasdenq mሥxiru tewaሕdo
lelዑl maderiyanet yetemerexsh
yale ሕmam weledshw dngl honesh

VERSE 2
anatnet dnglna
astebabresh yzeshalna
dnglm anatm amebrፃnen
ntsሕte ntsuሐn egnan amaljin

VERSE 3
193femaryam dngl', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yed-netu-mknyat-anchi-nesh-nts-t', 'የድኅነቱ ምክንያት አንቺ ነሽ ንጽሕት', 'የድኅነቱ ምክንያት አንቺ ነሽ ንጽሕት', 'yedኅnetu mknyat anchi nesh ntsሕt', 'Ethiopian Orthodox Tewahedo Mezmur - የድኅነቱ ምክንያት አንቺ ነሽ ንጽሕት', 'የኦሪት መጽናኛ የሐዲስ ኪዳን ብር
የወንጌል መሠረት የአምላክ ማኅደር
የድኅነቱ ምክንያት አንቺ ነሽ ንጽሕት
የኦሪት መጽናኛ የአዲስ ኪዳን በር

VERSE 1
የወንጌል መሠረት የአምላክ ማኅደር', 'yeorit metsnagna yeሐdis kidan br
yewengiel meሠret yeamlak maኅder
yedኅnetu mknyat anchi nesh ntsሕt
yeorit metsnagna yeadis kidan ber

VERSE 1
yewengiel meሠret yeamlak maኅder', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('tsadqan-burukan', 'ጻድቃን ቡሩካን', 'ጻድቃን ቡሩካን', 'tsadqan burukan', 'Ethiopian Orthodox Tewahedo Mezmur - ጻድቃን ቡሩካን', 'ጻድቃን ብሩካን ዓለምን ንቃችሁ
የክርስቶስን ፈለግ የተከተላችሁ
በመንግሥተ ሰማይ አጥፍ ነው ዋጋችሁ
ሰአሉ ለነ አስተምሕሩ ለነ', 'tsadqan brukan ዓlemn nqachhu
yekrstosn feleg yeteketelachhu
bemengሥte semay axf new wagachhu
sealu lene astemሕru lene', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('asme-betselote-tsadq-ttsa-n-weitmasn', 'አስመ በጸሎተ ጻድቅ ትጻኅን ወኢትማስን', 'አስመ በጸሎተ ጻድቅ ትጻኅን ወኢትማስን', 'asme betselote tsadq ttsaኅn weitmasn', 'Ethiopian Orthodox Tewahedo Mezmur - አስመ በጸሎተ ጻድቅ ትጻኅን ወኢትማስን', 'ሀገረ
ቀዳሜ ሰማዕት አስጢፋኖስ ዲያቆን
ወቅዱስ ጊዮርጊስ መክብበ አሜን
ምስለ ኢየሉጣ ወቁርቆስ ሕፃን', 'hagere
qedamie semaዕt asxifanos diyaqon
weqdus giyorgis mekbbe amien
msle iyeluxa wequrqos ሕፃn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('memenan-enaqrb-leamlak-msgana', 'ምእመናን እናቅርብ ለአምላክ ምስጋና', 'ምእመናን እናቅርብ ለአምላክ ምስጋና', 'memenan enaqrb leamlak msgana', 'Ethiopian Orthodox Tewahedo Mezmur - ምእመናን እናቅርብ ለአምላክ ምስጋና', 'በአዝራ መሰንቆ በዳዊት በገና
ዜማውን ከያሬድ ተምረናልና
760.መዓርዒረ ቃል
ምእመናን እናቅርብ ለአምላክ ምስጋና

VERSE 1
በአዝራ መሰንቆ በዳዊት በገና
ዜማውን ከያሬድ ተምረናልና', 'beazra mesenqo bedawit begena
ziemawn keyaried temrenalna
760.meዓrዒre qal
memenan enaqrb leamlak msgana

VERSE 1
beazra mesenqo bedawit begena
ziemawn keyaried temrenalna', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ye-yawan-yaw-me-r-re-qal-yeqdusan', 'የሕያዋን ሕያው መዓርዒረ ቃል የቅዱሳን', 'የሕያዋን ሕያው መዓርዒረ ቃል የቅዱሳን', 'yeሕyawan ሕyaw meዓrዒre qal yeqdusan', 'Ethiopian Orthodox Tewahedo Mezmur - የሕያዋን ሕያው መዓርዒረ ቃል የቅዱሳን', 'መኩሪያ መዓርዒረ ቃል
ትኮራብሀለች እናት ኢትዮጵያ /2/
761.ጽድቅ ተክለ አልፋ
የሕያዋን ሕያው መዓርዒረ ቃል የቅዱሳን

VERSE 1
መኩሪያ መዓርዒረ ቃል
ትኮራብሀለች እናት ኢትዮጵያ /2/', 'mekuriya meዓrዒre qal
tkorabhalech enat ityophya /2/
761.tsdq tekle alfa
yeሕyawan ሕyaw meዓrዒre qal yeqdusan

VERSE 1
mekuriya meዓrዒre qal
tkorabhalech enat ityophya /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('msalie-yhonal-lehulu-fxret', 'ምሳሌ ይሆናል ለሁሉ ፍጥረት', 'ምሳሌ ይሆናል ለሁሉ ፍጥረት', 'msalie yhonal lehulu fxret', 'Ethiopian Orthodox Tewahedo Mezmur - ምሳሌ ይሆናል ለሁሉ ፍጥረት', 'ገድልህ ይናገራል ፍጡነ ረድኤት
ክብር አንደተሰጠህ ፍጡነ ረድኤት
ጊዜ የማይሽረው ምግባር ዛይማናኖት /2/
ምሳሌ ይሆናል ለሁሉ ፍጥረት

VERSE 1
ገድልህ ይናገራል ፍጡነ ረድኤት
ክብር አንደተሰጠህ ፍጡነ ረድኤት
ጊዜ የማይሽረው ምግባር ዛይማኖት /2/', 'gedlh ynageral fxune rediet
kbr andetesexeh fxune rediet
gizie yemayshrew mgbar zaymananot /2/
msalie yhonal lehulu fxret

VERSE 1
gedlh ynageral fxune rediet
kbr andetesexeh fxune rediet
gizie yemayshrew mgbar zaymanot /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('learsu-des-ylegnal-baqerb-zmarie', 'ለአርሱ ደስ ይለኛል ባቀርብ ዝማሬ', 'ለአርሱ ደስ ይለኛል ባቀርብ ዝማሬ', 'learsu des ylegnal baqerb zmarie', 'Ethiopian Orthodox Tewahedo Mezmur - ለአርሱ ደስ ይለኛል ባቀርብ ዝማሬ', 'ጉልበት ሁሉ ላንተ በፍርሃት ይሰግዳል
ምሕረትን አድለን ፈጣሪ ቸል አትበል
የምህረትን ወኃ የተጠሙ ሁሉ
ከኃያሉ ጌታ ከአንተ ይረካሉ

VERSE 1
በምሕረትህ ማረን አቤቱ ፈጣሪ
ለፍጥረታት ሁሉ ነህና መሐሪ /2/
ሰላምን አድላት ለኢትዮጵያ
አጆቿን ዘርግታ ስትል ዛሌ ሉያ /2/

VERSE 2
1052የሰው ልጅ በኃይልህ
የሰው ልጅ በኃልህ ፈጽሞ አትመካ /2/
አንድ አምላክ አለና በኃይሉ ኃይልን የሚሰካ /2/
ኃይል እንደ ሶምሶን ከአምላክ ቢሰጥ እንጂ /2/

VERSE 3
በጉልበት መመካት ለማንም አይበጅ /2/
ሰናክሬም ቢነሣ በሕዝቅያስ ላይ /2/
የደረሰበትን አልሰማህም ወይ /2/
ጎልያድ በኃይሉ ዳዊትን ቢንቀው /2/

VERSE 4
አዋረደው አንጂ ኃይሉ መች ጠቀመው /2/
አንደ ዳታንና እንደ አቤሮን አይሆንም በግድ /2/
ተመርጦ ነው እንጂ ለክብር በአምላክ ፈቃድ /2/', 'gulbet hulu lante befrሃt ysegdal
mሕretn adlen fexari chel atbel
yemhretn weኃ yetexemu hulu
keኃyalu gieta keante yrekalu

VERSE 1
bemሕreth maren abietu fexari
lefxretat hulu nehna meሐri /2/
selamn adlat leityophya
ajoቿn zergta stl zalie luya /2/

VERSE 2
1052yesew lj beኃylh
yesew lj beኃlh fetsmo atmeka /2/
and amlak alena beኃylu ኃyln yemiseka /2/
ኃyl ende somson keamlak bisex enji /2/

VERSE 3
begulbet memekat lemanm aybej /2/
senakriem bineሣ beሕzqyas lay /2/
yederesebetn alsemahm wey /2/
golyad beኃylu dawitn binqew /2/

VERSE 4
awaredew anji ኃylu mech xeqemew /2/
ande datanna ende abieron ayhonm begd /2/
temerxo new enji lekbr beamlak feqad /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('bewexaxneth-fexarihn-asb', 'በወጣጥነትህ ፈጣሪህን አስብ', 'በወጣጥነትህ ፈጣሪህን አስብ', 'bewexaxneth fexarihn asb', 'Ethiopian Orthodox Tewahedo Mezmur - በወጣጥነትህ ፈጣሪህን አስብ', 'ሥራህም በሰው ፊት ይብራ እንደ ፀሐይ ይብራ እንደ
ኮከብ
አግዚአብሔርን ጥራ
በቤተ ክርስቲያን ጸሎት በድንግል ኪዳን

VERSE 1
አቤቱ ጠብቃት ኢትዮጵያን
ለሕዝቧም ስጣቸው ፍቅር አንድነትን
አግዚአብሔርን ጥራ
አለምንሃለሁ አምላኬ ሆይ አንዲት ነገር

VERSE 2
ከቤትህ ገብቼ በደስታ እንድኖር
ከባለማሎችህ ከአብርሃም ከይስሐቅ ከያዕቆብ ጋር
አግዚአብሔርን ጥራ
ኑሮዬ ሲጨልም ግራ ሲገባኝ

VERSE 3
ያለ ፈጣሪዬ ዘመድም የለኝ
ስወድቅ የሚያነሳኝ የሚደግፈኝ
አግዚአብሔርን ጥራ
ደርሶልኛልና በመከራ ቀን

VERSE 4
አከብረዋለው ቅዱስ አምላኬን
አጆቼንም ይዞ የሚመራኝን
አግዚአብሔርን ጥራ
አግዚአብሔርን ጥራ በመከራ ጊዜ

VERSE 5
ያድንሃልና በኀዘን በትካዜ
ጋሻና ጦሬ ብለህ ምርኩዜ
1954ይህንን ጉባኤ
ይህንን ጉባኤ ባርክልን ጌታችን /2/

VERSE 6
ሰላም ስጠን ፍቅርን ስጠን ዛሬ ለሁላችን /2/
10955ቆ.ቃልህ ሲነገር ልስማ
ቃልህ ሲነገር ልስማ ጌታሆይ አባክህ /2/
ልቤን ክፈተው /ሇ የልድያን ልብ እንደከፈትከ

VERSE 7
1956.ሰዓሊ ለነ ማርያም
ሰአሊ ለነ ማርያም ሰአሊ ለነ
አክሊለ ንጹሐን /3/ ሰአሊ ለነ
ለምኝልን ማርያም ለምኝልን

VERSE 8
የንፀጹሐን አክሊል /3/ ለምኝልን
1057. ወደ ምሥራቅ እዩ
ወደ ምሥራቅ እዩ ወደ ፀሐይ መውጫ
ድንግልን ክበቧት እንበል ዛሌ ሉያ

VERSE 9
ለአምላክ እናት ለአዛኝት /2/', 'ሥrahm besew fit ybra ende ፀሐy ybra ende
kokeb
agziabሔrn xra
bebiete krstiyan tselot bedngl kidan

VERSE 1
abietu xebqat ityophyan
leሕzbuam sxachew fqr andnetn
agziabሔrn xra
alemnሃlehu amlakie hoy andit neger

VERSE 2
kebieth gebchie bedesta endnor
kebalemalochh keabrሃm keysሐq keyaዕqob gar
agziabሔrn xra
nuroyie sicelm gra sigebagn

VERSE 3
yale fexariyie zemedm yelegn
swedq yemiyanesagn yemidegfegn
agziabሔrn xra
dersolgnalna bemekera qen

VERSE 4
akebrewalew qdus amlakien
ajochienm yzo yemimeragnn
agziabሔrn xra
agziabሔrn xra bemekera gizie

VERSE 5
yadnሃlna beኀzen betkazie
gashana xorie bleh mrkuzie
1954yhnn gubaie
yhnn gubaie barkln gietachn /2/

VERSE 6
selam sxen fqrn sxen zarie lehulachn /2/
10955qo.qalh sineger lsma
qalh sineger lsma gietahoy abakh /2/
lbien kfetew /ሇ yeldyan lb endekefetke

VERSE 7
1956.seዓli lene maryam
seali lene maryam seali lene
aklile ntsuሐn /3/ seali lene
lemgnln maryam lemgnln

VERSE 8
yenፀtsuሐn aklil /3/ lemgnln
1057. wede mሥraq eyu
wede mሥraq eyu wede ፀሐy mewca
dngln kbebuat enbel zalie luya

VERSE 9
leamlak enat leazagnt /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('all-anbel-anzemrlat-2', 'አልል አንበል አንዘምርላት /2/', 'አልል አንበል አንዘምርላት /2/', 'all anbel anzemrlat /2/', 'Ethiopian Orthodox Tewahedo Mezmur - አልል አንበል አንዘምርላት /2/', 'ወገኖች ተነሥ አናታችን መጣች
ስሟን ስንጠራ መቼ ትቀራለች
የተከዘን ልታጽናና ነይ ሰንላት ትመጣለችና /2/
አልል አንበል አንዘምርላት /2/

VERSE 1
ወገኖች ተነሥ አናታችን መጣች
ስሟን ስንጠራ መቼ ትቀራለች
የተከዘ ልታጽናና ነይ ሰንላት ትመጣችና /2/
የፅጌው ማኅሌት በጸሎት ሲጀመር', 'wegenoch teneሥ anatachn mexach
smuan snxera mechie tqeralech
yetekezen ltatsnana ney senlat tmexalechna /2/
all anbel anzemrlat /2/

VERSE 1
wegenoch teneሥ anatachn mexach
smuan snxera mechie tqeralech
yetekeze ltatsnana ney senlat tmexachna /2/
yeፅgiew maኅliet betselot sijemer', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('fl-ta-sijemer-qal-kidan-gebtalech', 'ፍልሠታ ሲጀመር ቃል ኪዳን ገብታለች', 'ፍልሠታ ሲጀመር ቃል ኪዳን ገብታለች', 'flሠta sijemer qal kidan gebtalech', 'Ethiopian Orthodox Tewahedo Mezmur - ፍልሠታ ሲጀመር ቃል ኪዳን ገብታለች', 'የሌሊት ውዳሴን ንዒን ትሰማለች
ሕፃናቱን በበረከት ልትጎበኘን ትመጣለች በዕውነት
በፍጽም ቸርነት አንዲምረን ጌታ
ፍልሠታ ሲጀመር ቃል ኪዳን ገብታለች

VERSE 1
የሌሊት ውዳሴን ንዒን ትሰማለች
ሕጻናትን በበረከት ልትጎበኝ', 'yelielit wdasien nዒn tsemalech
ሕፃnatun bebereket ltgobegnen tmexalech beዕwnet
beftsm chernet andimren gieta
flሠta sijemer qal kidan gebtalech

VERSE 1
yelielit wdasien nዒn tsemalech
ሕtsanatn bebereket ltgobegn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('asme-zntu-raiel-esme-zntu-le-lem', 'አስመ ዝንቱ ዑራኤል', 'አስመ ዝንቱ ዑራኤል', 'asme zntu ዑraiel esme zntu leዓlem', 'Ethiopian Orthodox Tewahedo Mezmur - አስመ ዝንቱ ዑራኤል', 'ብርሃን /2/
አስመ ዝንቱ ዑራኤል
አስመ ዝንቱ ለዓለም ብርሃዛኑ(2)
931.አዘክሪ ድንግል

VERSE 1
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
አስመ ዝንቱ ዑራኤል', 'brሃn /2/
asme zntu ዑraiel
asme zntu leዓlem brሃzanu(2)
931.azekri dngl

VERSE 1
azekri dngl azekri
leljsh asasbi azekri
leኃxan ako letsadqan
asme zntu ዑraiel', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yeegna-abat-2', 'የእኛ አባት /2/', 'የእኛ አባት /2/', 'yeegna abat /2/', 'Ethiopian Orthodox Tewahedo Mezmur - የእኛ አባት /2/', 'የእኛ አባት /2/
በስአልህ ፊት ሚካኤል
አቆማለሁ ›
የእኛ አባት /2/

VERSE 1
178. ቅዱስ ሚካኤል
ቅዱስ ሚካኤል /3/ ነፍሴ ሲጨነቅ ሲዝል ሥጋዬ
ፈጥነህ ተራዳኝ ዋስ ጠበቃዬ
የእኛ አባት /2/

VERSE 2
በስአል ፊት ሚካኤል
አቆማለሁ »
የእኛ አባት /2/
1062. ቅዱስ ሚካኤል

VERSE 3
ቅዱስ ሚካኤል /3/ ነፍሴ ሲጨነቅ ሲዝል ሥጋዬ
ፈጥነህ ተራዳኝ ዋስ ጠበቃዬ', 'yeegna abat /2/
besalh fit mikaiel
aqomalehu ›
yeegna abat /2/

VERSE 1
178. qdus mikaiel
qdus mikaiel /3/ nefsie siceneq sizl ሥgayie
fexneh teradagn was xebeqayie
yeegna abat /2/

VERSE 2
besal fit mikaiel
aqomalehu »
yeegna abat /2/
1062. qdus mikaiel

VERSE 3
qdus mikaiel /3/ nefsie siceneq sizl ሥgayie
fexneh teradagn was xebeqayie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beqalkidanh-ywetu-dane-2', 'በቃልኪዳንህ ሕይወቱ ዳነ /2/', 'በቃልኪዳንህ ሕይወቱ ዳነ /2/', 'beqalkidanh ሕywetu dane /2/', 'Ethiopian Orthodox Tewahedo Mezmur - በቃልኪዳንህ ሕይወቱ ዳነ /2/', 'ከአምላክ ተሰጥቶህ ሚካኤል
ክብርህ ያበራል »
ለጎስቋላው ሰው »
መጠጊያ ሆኗል »

VERSE 1
ትልቅ ትንሹ ደሃው ሀብታሙ
ለምኖ አግኝቷል ከአምላክ በስሙ /2/
በቃልኪዳንህ ሕይወቱ ዳነ /2/
ከአምላክ ተሰጥቶህ ሚካኤል

VERSE 2
ክብርህ ያበራል »
ለጎስቷቋላው ሰው »
መጠጊያ ሆኗል ››
ትልቅ ትንሹ ደሃው ሀብታሙ

VERSE 3
ለምኖ አግኝቷል ከአምላክ በስሙ /2/', 'keamlak tesextoh mikaiel
kbrh yaberal »
legosqualaw sew »
mexegiya honual »

VERSE 1
tlq tnshu deሃw habtamu
lemno aggntual keamlak besmu /2/
beqalkidanh ሕywetu dane /2/
keamlak tesextoh mikaiel

VERSE 2
kbrh yaberal »
legostuaqualaw sew »
mexegiya honual ››
tlq tnshu deሃw habtamu

VERSE 3
lemno aggntual keamlak besmu /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zbe-asraieln', 'ሕዝበ አስራኤልን »', 'ሕዝበ አስራኤልን »', 'ሕzbe asraieln »', 'Ethiopian Orthodox Tewahedo Mezmur - ሕዝበ አስራኤልን »', 'ነጻ ያወጣህ »
ምሐዲስ ኪዳንም ድንቅ ሥራ አለህ
በተአምራትህ ትፈውሳለህ /2/
ባለ መድኃኒት ሚካኤል

VERSE 1
ያቃተውን »
ፈዋሽ ጸበልህ »
ሆኖኛል ኃይል ንን
አንደ መፃጉዕ ድኅነት አገኘን

VERSE 2
ፈውሰኸኛል በአንተ ተመካን /2/', 'netsa yawexah »
mሐdis kidanm dnq ሥra aleh
beteamrath tfewsaleh /2/
bale medኃnit mikaiel

VERSE 1
yaqatewn »
fewash tsebelh »
honognal ኃyl nn
ande meፃguዕ dኅnet agegnen

VERSE 2
fewseኸgnal beante temekan /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yamaldalu-beawnet-yamaldalu-2', 'ያማልዳሉ በአውነት ያማልዳሉ /2/', 'ያማልዳሉ በአውነት ያማልዳሉ /2/', 'yamaldalu beawnet yamaldalu /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ያማልዳሉ በአውነት ያማልዳሉ /2/', 'የማልዳሉ በእውነት /2/ ያማልዳሉ
ያማልዳሉ /4 አምላክ ሆይ ይቅር በል አያሉ
ሰባቱ ሊቃነ መላአክት ሚካኤል ወገብርኤል
ያማልዳሉ በአውነት ያማልዳሉ /2/

VERSE 1
ያማልዳሉ በአውነት /2/ ያማልዳሉ
ያማልዳሉ /4 አምላክ ሆይ ይቅር በል እያሉ
ያማልዳሉ በአውነት ያማልዳሉ /2/
ያማልዳሉ በአውነት ያማልዳሉ /2/', 'yemaldalu beewnet /2/ yamaldalu
yamaldalu /4 amlak hoy yqr bel ayalu
sebatu liqane melaakt mikaiel wegebriel
yamaldalu beawnet yamaldalu /2/

VERSE 1
yamaldalu beawnet /2/ yamaldalu
yamaldalu /4 amlak hoy yqr bel eyalu
yamaldalu beawnet yamaldalu /2/
yamaldalu beawnet yamaldalu /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('krstos-lyu-new-wederm-yelielew-2', 'ክርስቶስ ልዩ ነው ወደርም የሌለው /2/', 'ክርስቶስ ልዩ ነው ወደርም የሌለው /2/', 'krstos lyu new wederm yelielew /2/', 'Ethiopian Orthodox Tewahedo Mezmur - ክርስቶስ ልዩ ነው ወደርም የሌለው /2/', 'ዕውርን ቢያበራ የሞተን ቢያስነሳ
በመመስገን ፈንታ ሆነበት አበሳ
ሰማያዊው ዳኛ ሊፈረድበት
ተከሶ ቀረበ በሏላጦስ ፊት /2/', 'ዕwrn biyabera yemoten biyasnesa
bememesgen fenta honebet abesa
semayawiw dagna liferedbet
tekeso qerebe belualaxos fit /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nsieb-leamlake-zra', 'ንሴብሖ ለአምላከ ዕዝራ', 'ንሴብሖ ለአምላከ ዕዝራ', 'nsiebሖ leamlake ዕzra', 'Ethiopian Orthodox Tewahedo Mezmur - ንሴብሖ ለአምላከ ዕዝራ', 'ንሴብሖ ለአምላከ ዕዝራ
ንሴብሖ ለአምላከ ዕዝራ
ንሴብሖ ለአምላከ ዕዝራ', 'nsiebሖ leamlake ዕzra
nsiebሖ leamlake ዕzra
nsiebሖ leamlake ዕzra', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kbero-hoy-tsenatsl-hoy-lemsgana-tene', 'ክበሮ ሆይ ጸናጽል ሆይ ለምስጋና ተነሥ', 'ክበሮ ሆይ ጸናጽል ሆይ ለምስጋና ተነሥ', 'kbero hoy tsenatsl hoy lemsgana teneሥ', 'Ethiopian Orthodox Tewahedo Mezmur - ክበሮ ሆይ ጸናጽል ሆይ ለምስጋና ተነሥ', 'በማለዳ ለጌታችን ምስጋና እናድርስ
ንሴብሆ ለአምላክ ዕዝራ
ክበሮ ሆይ ጸናጽል ሆይ ለምስጋና ተነሥ', 'bemaleda legietachn msgana enadrs
nsiebho leamlak ዕzra
kbero hoy tsenatsl hoy lemsgana teneሥ', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('kemot-wede-ywet-yashegageren', 'ከሞት ወደ ሕይወት ያሸጋገረን', 'ከሞት ወደ ሕይወት ያሸጋገረን', 'kemot wede ሕywet yashegageren', 'Ethiopian Orthodox Tewahedo Mezmur - ከሞት ወደ ሕይወት ያሸጋገረን', 'ኑ በአግዚአብሔር ኑ በድንግል ደስ ይበለን/2/
የሰማዩን መንግሥት ርስቱን ለሰጠን
ከጨለማ አውጥቶ ብርሃንን ላሰየን
ለዚህ ድንቅ ውለታው ምስጋና ያንሰዋል

VERSE 1
በአርሱ ደስ ይበለን ክብር ይገባዋል
ከሞት ወደ ሕይወት ያሸጋገረን', 'nu beagziabሔr nu bedngl des ybelen/2/
yesemayun mengሥt rstun lesexen
kecelema awxto brሃnn laseyen
lezih dnq wletaw msgana yansewal

VERSE 1
bearsu des ybelen kbr ygebawal
kemot wede ሕywet yashegageren', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('nu-beagziab-r-nu-bednl-des-ybelen-2', 'ኑ በአግዚአብሔር ኑ በድንል ደስ ይበለን/2/', 'ኑ በአግዚአብሔር ኑ በድንል ደስ ይበለን/2/', 'nu beagziabሔr nu bednl des ybelen/2/', 'Ethiopian Orthodox Tewahedo Mezmur - ኑ በአግዚአብሔር ኑ በድንል ደስ ይበለን/2/', 'የሰማዩን መንግሥት ርስቱን ለሰጠን
ከጨለማ አውጥቶ ብርሃንን ላሰየን
ለዚህ ድንቅ ውለታው ምሰጋና ያንሰዋል
በአርሱ ደስ ይበለን ክብር ይገባዋል', 'yesemayun mengሥt rstun lesexen
kecelema awxto brሃnn laseyen
lezih dnq wletaw msegana yansewal
bearsu des ybelen kbr ygebawal', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('smhn-lamesgenew-kexewat-eske-mata', 'ስምህን ላመስገነው ከጠዋት እስከ ማታ', 'ስምህን ላመስገነው ከጠዋት እስከ ማታ', 'smhn lamesgenew kexewat eske mata', 'Ethiopian Orthodox Tewahedo Mezmur - ስምህን ላመስገነው ከጠዋት እስከ ማታ', 'በቃዴስ በረፃ ምንም በሌለበት
በኤርትራ ባሕር ወጀብ በበዛበት
ለአርሱ መንገድ አለው ከቶ ምን ተስኖት
ልባችሁ አይፍራ በፍጹም አመኑት

VERSE 1
ስምህን ላመስገነው ከጠዋት እስከ ማታ
በቃዴስ በረሀ ምንም በሌለበት
በኤርትራ ባሕር ወጀብ በበዛበት
ለአርሱ መንገድ አለው ከቶ ምን ተስኖት

VERSE 2
ልባችሁ አይፍራ በፍጹም አመኑት', 'beqadies bereፃ mnm belielebet
beiertra baሕr wejeb bebezabet
learsu menged alew keto mn tesnot
lbachhu ayfra beftsum amenut

VERSE 1
smhn lamesgenew kexewat eske mata
beqadies bereha mnm belielebet
beiertra baሕr wejeb bebezabet
learsu menged alew keto mn tesnot

VERSE 2
lbachhu ayfra beftsum amenut', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('abebayosh-qdst-2', 'አበባዮሽ ቅድስት/2/', 'አበባዮሽ ቅድስት/2/', 'abebayosh qdst/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አበባዮሽ ቅድስት/2/', 'ባለእንደሮሄ ቅድስት
ቁሙ በተራ - ›ቅድስት ›
በጎ ምግባርን  ››ቅድስት
አበባዮሽ ቅድስት/2/

VERSE 1
ባለአንደሮቼሄ ቅድስት
ቁሙ በተራ ›ቅድስት ›
በጎ ምግባርን ››ቅድስት', 'baleenderohe qdst
qumu betera - ›qdst ›
bego mgbarn  ››qdst
abebayosh qdst/2/

VERSE 1
baleanderochiehe qdst
qumu betera ›qdst ›
bego mgbarn ››qdst', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('beamnet-en-ra-qdst', 'በአምነት እንሥራ ቅድስት ››', 'በአምነት እንሥራ ቅድስት ››', 'beamnet enሥra qdst ››', 'Ethiopian Orthodox Tewahedo Mezmur - በአምነት እንሥራ ቅድስት ››', 'ዛሬ ነው ቀኑ ቅድስት ›
መመለሻችን ቅድስት ››
ይቅር እንዲለን ቅድስት ››
ቸሩ አምላካችን ቅድስት ››

VERSE 1
በአምነት እንሥራ ቅድስት ››
ዛሬ ነው ቀኑ ቅድስት ›
መመለሻችን ቅድስት ››
ይቅር እንዲለን ቅድስት ››

VERSE 2
ቸሩ አምላካችን ቅድስት ››', 'zarie new qenu qdst ›
memeleshachn qdst ››
yqr endilen qdst ››
cheru amlakachn qdst ››

VERSE 1
beamnet enሥra qdst ››
zarie new qenu qdst ›
memeleshachn qdst ››
yqr endilen qdst ››

VERSE 2
cheru amlakachn qdst ››', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('le-xen-xiena-qdst', 'ለሠጠን ጤና ቅድስት', 'ለሠጠን ጤና ቅድስት', 'leሠxen xiena qdst', 'Ethiopian Orthodox Tewahedo Mezmur - ለሠጠን ጤና ቅድስት', 'ለመድንኔዓለም ቅድሰት
ለሠጠን ጤና ቅድስት
ለመድኃኔዓለም ቅድሰት', 'lemednnieዓlem qdset
leሠxen xiena qdst
lemedኃnieዓlem qdset', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('atie-abeba-atie-abebayie-ayie-qdst-enatie', 'አቴ አበባ አቴ አበባዬ አዬ ቅድስት እናቴ', 'አቴ አበባ አቴ አበባዬ አዬ ቅድስት እናቴ', 'atie abeba atie abebayie ayie qdst enatie', 'Ethiopian Orthodox Tewahedo Mezmur - አቴ አበባ አቴ አበባዬ አዬ ቅድስት እናቴ', 'አቴ አበባ ስትለኝ ከርማ አዬ ቅድስት እናቴ
መከረችኝ ደግማ ደጋግማ አዬ ቅድስት
አናቴ
አቴ አበባ አቴ አበባዬ አዬ ቅድስት እናቴ

VERSE 1
አቴ አበባ ስትለኝ ከርማ አዬ ቅድስት እናቴ
መከረችኝ ደግማ ደጋግማ አዬ ቅድስት
አናቴ', 'atie abeba stlegn kerma ayie qdst enatie
mekerechgn degma degagma ayie qdst
anatie
atie abeba atie abebayie ayie qdst enatie

VERSE 1
atie abeba stlegn kerma ayie qdst enatie
mekerechgn degma degagma ayie qdst
anatie', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ayie-qdst-enatie-ayie-qdst-aenatie-2', 'አዬ ቅድስት እናቴ አዬ ቅድስት አእናቴ/2/', 'አዬ ቅድስት እናቴ አዬ ቅድስት አእናቴ/2/', 'ayie qdst enatie ayie qdst aenatie/2/', 'Ethiopian Orthodox Tewahedo Mezmur - አዬ ቅድስት እናቴ አዬ ቅድስት አእናቴ/2/', 'ይሸታል የእጣኑ ጢስ ሲታጠን ከመቅደሱ
በመላእክት ዜማ ካህናት ሲቀድሱ ሲታጠን
ከመቅደሱ/2/', 'yshetal yeexanu xis sitaxen kemeqdesu
bemelaekt ziema kahnat siqedsu sitaxen
kemeqdesu/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('barko-ye-xeshe-ityophyan-asrat', 'ባርኮ የሠጠሸ ኢትዮጵያን አስራት', 'ባርኮ የሠጠሸ ኢትዮጵያን አስራት', 'barko yeሠxeshe ityophyan asrat', 'Ethiopian Orthodox Tewahedo Mezmur - ባርኮ የሠጠሸ ኢትዮጵያን አስራት', 'ጭንቀት ይርቃል ይቀርባል ሰላም
ባርኮ የሠጠሸ ኢትዮጵያን አስራት
ጭንቀት ይርቃል ይቀርበላ ሠላም', 'cnqet yrqal yqerbal selam
barko yeሠxeshe ityophyan asrat
cnqet yrqal yqerbela ሠlam', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('betewa-do-weld-yekeberew', 'በተዋሕዶ ወልድ የከበረው', 'በተዋሕዶ ወልድ የከበረው', 'betewaሕdo weld yekeberew', 'Ethiopian Orthodox Tewahedo Mezmur - በተዋሕዶ ወልድ የከበረው', 'የአግዚአብሔር አብ ልጅ. ወልደ ማርያም ነው
ቡሄ በሉ ቡሄ በሉ
የአዳም ልጆች ብርሃን ተቀበሉ
በተዋሕዶ ወልድ የከበረው

VERSE 1
የአግዚአብሔር አብ ልጅ . ወልደ ማርያም ነው
ቡሄ በሉ ቡሄ በሉ የአዳም
ልጆች ብርፃሃን ተቀበሉ', 'yeagziabሔr ab lj. welde maryam new
buhe belu buhe belu
yeadam ljoch brሃn teqebelu
betewaሕdo weld yekeberew

VERSE 1
yeagziabሔr ab lj . welde maryam new
buhe belu buhe belu yeadam
ljoch brፃሃn teqebelu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ityophyawiyan-tarik-yalachhu', 'ኢትዮጵያዊያን ታሪክ ያላችሁ', 'ኢትዮጵያዊያን ታሪክ ያላችሁ', 'ityophyawiyan tarik yalachhu', 'Ethiopian Orthodox Tewahedo Mezmur - ኢትዮጵያዊያን ታሪክ ያላችሁ', 'ባሕላችሁን ያዙ አጥብቃችሁ
ብርሃንን አብሩ ችቦ ይዛችሁ
ምሥጢር ስላለው ደስ ይበላችሁ
ኢትዮጵያዊያን ታሪክ ያላችሁ

VERSE 1
ባሕላችሁን ያዙ አጥብቃችሁ
ብርሃንን አብሩ ችቦ ይዛችሁ
ምሥጢር ስላለው ደስ ይበላችሁ', 'baሕlachhun yazu axbqachhu
brሃnn abru chbo yzachhu
mሥxir slalew des ybelachhu
ityophyawiyan tarik yalachhu

VERSE 1
baሕlachhun yazu axbqachhu
brሃnn abru chbo yzachhu
mሥxir slalew des ybelachhu', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('zariem-beagna-lay-tsegawn-yafss', 'ዛሬም በአኛ ላይ ጸጋውን ያፍስስ', 'ዛሬም በአኛ ላይ ጸጋውን ያፍስስ', 'zariem beagna lay tsegawn yafss', 'Ethiopian Orthodox Tewahedo Mezmur - ዛሬም በአኛ ላይ ጸጋውን ያፍስስ', 'በጥሩ ምግባር እንድንታደስ
ዛሬም በአኛ ላይ ጸጋውን ያፍስስ
በጥሩ ምግባር እንድንታደስ', 'bexru mgbar endntades
zariem beagna lay tsegawn yafss
bexru mgbar endntades', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('mskrenetun-geletse', 'ምስክረነቱን ገለጸ', 'ምስክረነቱን ገለጸ', 'mskrenetun geletse', 'Ethiopian Orthodox Tewahedo Mezmur - ምስክረነቱን ገለጸ', 'ምስክርነቱን ገለጸ ቂርቆስ ሕዛፃን/2/
በአሳት ተፈተኖ አለፈኸኸ ፈተና ደስ
ይበለን/2/
ቂርቆስ ኢየሉጣን ሁለቱም በአንድ ልብ ምን

VERSE 1
ጨከኑት/ሪ2/
ተቃቅፈው ሲገቡ ወደ እሳት ጋኑ/2/
ሕፃኑ እና አናቱ በአሳት ውስጥ ሲዋኙ
ያለ ምንም ፍርሀት/2/

VERSE 2
ገብርኤል ተላከ እነርሱን ለማውጣት /2/
በርዶና ቀዝቅዞ የእሳቱ ነበልባል በጌታችን
መስቀል /2/
ሁለቱም ሰማዕታት ተጎናጸፉ ድል/2/

VERSE 3
1088. መጥመቀ መለኮት
መጥምቀ መለኮት ዮሐንስ /2/
መንገድ ጠረገ ለኢየሱስ መምጫው
ሊደርስ

VERSE 4
ተክለሃይማኖት በጸሎት/2/
ተክለሃይማኖት በጸሉት የእኛ አባት
ገብረመንፈስቅዱሰ ሐዋርያ /2/
ኪንሒሳ መጥተው ጸለዩላት ለኢትዮጵያ

VERSE 5
ዜና ማርቆስ በጽኑ እምነት/2/
ፀሐይ አቆሙ እንደ ኢያሱ በደብረ
ብሥራት/2/
አመቤታችን ድንግል ማርያም /2/

VERSE 6
ምሕረት አስጭን ከመለኮት
ከመድኃኔዓለም
መስቀሉን ይዞ በፈረስ/2/', 'mskrnetun geletse qirqos ሕzaፃn/2/
beasat tefeteno alefeኸኸ fetena des
ybelen/2/
qirqos iyeluxan huletum beand lb mn

VERSE 1
cekenut/ri2/
teqaqfew sigebu wede esat ganu/2/
ሕፃnu ena anatu beasat wsx siwagnu
yale mnm frhat/2/

VERSE 2
gebriel telake enersun lemawxat /2/
berdona qezqzo yeesatu nebelbal begietachn
mesqel /2/
huletum semaዕtat tegonatsefu dl/2/

VERSE 3
1088. mexmeqe melekot
mexmqe melekot yoሐns /2/
menged xerege leiyesus memcaw
liders

VERSE 4
tekleሃymanot betselot/2/
tekleሃymanot betselut yeegna abat
gebremenfesqduse ሐwarya /2/
kinሒsa mextew tseleyulat leityophya

VERSE 5
ziena marqos betsnu emnet/2/
ፀሐy aqomu ende iyasu bedebre
bሥrat/2/
amebietachn dngl maryam /2/

VERSE 6
mሕret ascn kemelekot
kemedኃnieዓlem
mesqelun yzo beferes/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('anmesekralen-dngl-amalaj-nat-2', 'አንመሰክራለን ድንግል አማላጅ ናት /2/', 'አንመሰክራለን ድንግል አማላጅ ናት /2/', 'anmesekralen dngl amalaj nat /2/', 'Ethiopian Orthodox Tewahedo Mezmur - አንመሰክራለን ድንግል አማላጅ ናት /2/', 'አንመሰክራለን ማርያም አማላጅ ናት
አንመናት አንካዳት የአማኑኤል እናት ናት /2/
800. ለዛቲ ቤት
ለዛቲ ቤት ሐነፃ ወልድ /2/

VERSE 1
ወፈጸማ መንፈስቅዱስ /4
801. ይትባረክ
ይትባረክ አግዚአብሔር /4
ዘአልዓላ ለጽዮን እምኩሉ ዓለማት /4

VERSE 2
802. እንኳን ደህና
አንካን ደኅና መጣችሁ /2/
ወደ እኔ ወደ አናታችሁ
አጄን ዘርግቼ ስጠብቃችሁ

VERSE 3
ወላጆቻችሁን እንድታከብሩ
አምላካችን መናገሩ /2/
አንድትጠብቁ ትአዛዙን
አንመሰክራለን ድንግል አማላጅ ናት /2/

VERSE 4
አንመሰክራለን ማርያም አማላጅ ናት ፦
አንመናት አንካዳት የአማኑኤል እናት''/2/
1091. ስአሊ ለነ ማርያም', 'anmesekralen maryam amalaj nat
anmenat ankadat yeamanuiel enat nat /2/
800. lezati biet
lezati biet ሐneፃ weld /2/

VERSE 1
wefetsema menfesqdus /4
801. ytbarek
ytbarek agziabሔr /4
zealዓla letsyon emkulu ዓlemat /4

VERSE 2
802. enkuan dehna
ankan deኅna mexachhu /2/
wede enie wede anatachhu
ajien zergchie sxebqachhu

VERSE 3
welajochachhun endtakebru
amlakachn menageru /2/
andtxebqu tazazun
anmesekralen dngl amalaj nat /2/

VERSE 4
anmesekralen maryam amalaj nat ፦
anmenat ankadat yeamanuiel enat''/2/
1091. sali lene maryam', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('yemesqel-wereb', 'የመስቀል ወረብ', 'የመስቀል ወረብ', 'yemesqel wereb', 'Ethiopian Orthodox Tewahedo Mezmur - የመስቀል ወረብ', 'በመስቀሉ
በመስቀሉ ወበቃሉ''/2/
አአበዮሙ ለአበዊነ/4/
ዝንቱ

VERSE 1
ዝንቱ መስቀል ቤዛነ መድኃኒትነነ/2/
ዝንቱ መስቀል ቤዛነ መድኃኒትነ/4
እምገቦ
አምገቦከ ውጊቲዘ ነቅዐ ማየ ዘቀደሶ

VERSE 2
ለፈያታ''/2/
ለነዳይ ምስካይ
ለነዳይ ምስከይ/2
ኃይለ መስቀሉ

VERSE 3
ኃይለ መስቀሉ አብርፃ/2/ ለኢትዮጵያ/2/
አስመ መስቀል ሞዓ ሞተ ተሞዓ/2/
ተሰአልከ/ጽፋት/
ተሰአልከ አግዚኦ ዛሌ ሉያ መስቀል ብርሃን

VERSE 4
ለኩሉ ዓለም መሠረተ ቤተክርስቲያን
ወሀቤ ሰላም መድኃኔዓለም መስቀል ለአለ
ነአምን መድኅን
የስደት ወረብ

VERSE 5
ረሀበ ወጽምዐ አዘክሪ ድንግል ረሀበ ወጽምዓ /2/', 'bemesqelu
bemesqelu webeqalu''/2/
aabeyomu leabewine/4/
zntu

VERSE 1
zntu mesqel biezane medኃnitnene/2/
zntu mesqel biezane medኃnitne/4
emgebo
amgeboke wgitize neqዐ maye zeqedeso

VERSE 2
lefeyata''/2/
leneday mskay
leneday mskey/2
ኃyle mesqelu

VERSE 3
ኃyle mesqelu abrፃ/2/ leityophya/2/
asme mesqel moዓ mote temoዓ/2/
tesealke/tsfat/
tesealke agzio zalie luya mesqel brሃn

VERSE 4
lekulu ዓlem meሠrete bietekrstiyan
wehabie selam medኃnieዓlem mesqel leale
neamn medኅn
yesdet wereb

VERSE 5
rehabe wetsmዐ azekri dngl rehabe wetsmዓ /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('gizie-refta-lemaryam-gizie-3-arefta', 'ጊዜ ዕረፍታ ለማርያም ጊዜ/3/ አረፍታ', 'ጊዜ ዕረፍታ ለማርያም ጊዜ/3/ አረፍታ', 'gizie ዕrefta lemaryam gizie/3/ arefta', 'Ethiopian Orthodox Tewahedo Mezmur - ጊዜ ዕረፍታ ለማርያም ጊዜ/3/ አረፍታ', 'ለማርያምሃ''/2/
ወረደ ወልድ ዲበ አም ዲበ ልዕልና ወረደ/2/
አስመ እምዘርዓ
አስመ እምዘርዓ ዳዊት ዘመጽአ/2

VERSE 1
በቤተልሔም ዘይሁዳ
በቤተልሔም እንዘ ይሁዳ/2
የዘመነ መርዓዊ እና የቃና ዘገሊላ ወረብ
በቃና ዘገሊሳላ/2/

VERSE 2
በቃና ዘገሊላ
ዘገሊለ ከብከብ ኮነ/ቴ
ተአምረ', 'lemaryamሃ''/2/
werede weld dibe am dibe lዕlna werede/2/
asme emzerዓ
asme emzerዓ dawit zemetsa/2

VERSE 1
bebietelሔm zeyhuda
bebietelሔm enze yhuda/2
yezemene merዓwi ena yeqana zegelila wereb
beqana zegelisala/2/

VERSE 2
beqana zegelila
zegelile kebkeb kone/tie
teamre', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('teqebelu-mer-wi-med-nine-werede-4tie', 'ተቀበሉ መርዓዊ መድኃኒነ ወረደ/4ቴ', 'ተቀበሉ መርዓዊ መድኃኒነ ወረደ/4ቴ', 'teqebelu merዓwi medኃnine werede/4tie', 'Ethiopian Orthodox Tewahedo Mezmur - ተቀበሉ መርዓዊ መድኃኒነ ወረደ/4ቴ', 'ዘድንግል መናስግተ
ዘድንግል መናሥግተ ኢያሪሆ/2/
ኢያሪሆ ዘኪሩቤል ኢርእዮ
ኢያሪሆ ኢርእዮ ዘኪሩብ

VERSE 1
የመጋቢት27 መድኃኔዓለም
መስቀል ብርዛነ ለኩሉ ዓለም''/2/
ወሀቤ ሰላም መድኃኔዓለም//2/
በለኒ መሐርኩከ

VERSE 2
በለኒ መሐርኩከ/2/ በእንተ መርያም/2/
አስመ አልቦ ዘእንበሌከ ዘይሜሕር ቃለ', 'zedngl menasgte
zedngl menaሥgte iyariho/2/
iyariho zekirubiel ireyo
iyariho ireyo zekirub

VERSE 1
yemegabit27 medኃnieዓlem
mesqel brzane lekulu ዓlem''/2/
wehabie selam medኃnieዓlem//2/
beleni meሐrkuke

VERSE 2
beleni meሐrkuke/2/ beente meryam/2/
asme albo zeenbelieke zeymieሕr qale', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('agziab-r-astegabomu', 'አግዚአብሔር አስተጋብኦሙ', 'አግዚአብሔር አስተጋብኦሙ', 'agziabሔr astegabomu', 'Ethiopian Orthodox Tewahedo Mezmur - አግዚአብሔር አስተጋብኦሙ', 'አግዚአብሔር አስተጋብኦሙ አምበሐውርት አምጽባሕ
ወአምዓረብ ወመስዕ ወባሕር በማኅደረ ስብሐት/2/
በዕፀ መስቀሉ አተቦሙ በጸሎታ ለማርያም/2/
ፃበነ እግዚኦ

VERSE 1
ሀበነ እግዚኦ አእምሮ አእይንተ አእምሮ ወትረ ኪያከ
ይርአይ/2/
ወአእዛንነሂ ቃለ ዘባሕቲትከ ይስምአ/2/
ኢይታጸዉ

VERSE 2
ኢይታጸዉ አናቅጽኪ ክቡራት ዕንቁ መሠረትኪ/2/ኦ
ሰናይት ሠላማዊት ሠናይት ማኅደረ ስብሐት''/2/
ሊተሰ
ሊተሰ ይቴይሰኒ ተሊወ አግዚአብሔር!/2/

VERSE 3
ወትውክልትየኒ/2/ ላዕለ አግዚአብሔር?/2/
ሰላም ለክሙ
ሰላም ለክሙ ኦ ማኅበራኒሁ ለክርስቶስ አለ
ተጋብአአክሙ ውስተ ዛቲ ማኅደረ ስብሐት/2/

VERSE 4
ጳጳሳት ቀሳውስት ወዲያቆናት መፃይምናን
ወመፃይምንት ሕዝበ ክርስቲያን/2/', 'agziabሔr astegabomu ambeሐwrt amtsbaሕ
weamዓreb wemesዕ webaሕr bemaኅdere sbሐt/2/
beዕፀ mesqelu atebomu betselota lemaryam/2/
ፃbene egzio

VERSE 1
habene egzio aemro aeynte aemro wetre kiyake
yray/2/
weaezannehi qale zebaሕtitke ysma/2/
iytatsewu

VERSE 2
iytatsewu anaqtski kburat ዕnqu meሠretki/2/o
senayt ሠlamawit ሠnayt maኅdere sbሐt''/2/
litese
litese ytieyseni teliwe agziabሔr!/2/

VERSE 3
wetwkltyeni/2/ laዕle agziabሔr?/2/
selam lekmu
selam lekmu o maኅberanihu lekrstos ale
tegabaakmu wste zati maኅdere sbሐt/2/

VERSE 4
phaphasat qesawst wediyaqonat meፃymnan
wemeፃymnt ሕzbe krstiyan/2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ybielulome-iyesus-leardaihu-n-sm-ni-engrkmu', 'ይቤሉሎመ ኢየሱስ ለአርዳኢሁ ንዑ ስምዑኒ እንግርክሙ', 'ይቤሉሎመ ኢየሱስ ለአርዳኢሁ ንዑ ስምዑኒ እንግርክሙ', 'ybielulome iyesus leardaihu nዑ smዑni engrkmu', 'Ethiopian Orthodox Tewahedo Mezmur - ይቤሉሎመ ኢየሱስ ለአርዳኢሁ ንዑ ስምዑኒ እንግርክሙ', 'ተለዉ ድኅሬሁ ወተምኅሩ ምግባረ ቪአሁ ወይቤሎሙ
ሰላም ለክሙ ሰላመ ዚአየ አሁበክሙ
ወረብ
ኢየሱስርቹክ ክርስቶስ ይቤሎሙ ለአርዳኢሁ ንዑ ስሙዑኒ

VERSE 1
እንግርክሙ (2)', 'telewu dኅriehu wetemኅru mgbare viahu weybielomu
selam lekmu selame ziaye ahubekmu
wereb
iyesusrchuk krstos ybielomu leardaihu nዑ smuዑni

VERSE 1
engrkmu (2)', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('lie-luya-2-enamesgnew-amlakachnn-kedagmawi', 'ፃሌ ሉያ /2/ እናመስግነው አምላካችንን ከዳግማዊ', 'ፃሌ ሉያ /2/ እናመስግነው አምላካችንን ከዳግማዊ', 'ፃlie luya /2/ enamesgnew amlakachnn kedagmawi', 'Ethiopian Orthodox Tewahedo Mezmur - ፃሌ ሉያ /2/ እናመስግነው አምላካችንን ከዳግማዊ', 'ሞት ያዳነን ከሰይጣን ባርነት ያወጣን
አናመስግነው አምላካችንን በመስቀል ተሰቅሎ
ፍቅሩን የገለጸልን አጥብቀን ብንሸሰው አብዝቶ
የፈለገን እናመስግነው አምላካችንን ምንም ቢበዛ

VERSE 1
ኃጢአታችን በምሕረቱ የጎበኘን አናመስግነው
አምላካችንን ዛሬም በመንግሥቱ አንዲያስበን
አንደፈያታ ዘየማን አናመስግነው አምላካችንን
አርሱ ነውና መድኃኒታችን', 'mot yadanen keseyxan barnet yawexan
anamesgnew amlakachnn bemesqel teseqlo
fqrun yegeletseln axbqen bnshesew abzto
yefelegen enamesgnew amlakachnn mnm bibeza

VERSE 1
ኃxiatachn bemሕretu yegobegnen anamesgnew
amlakachnn zariem bemengሥtu andiyasben
andefeyata zeyeman anamesgnew amlakachnn
arsu newna medኃnitachn', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('agzio-agziane-egziab-r-tese-lene', 'አግዚኦ  አግዚአነ እግዚአብሔር - ተሰፃለነ', 'አግዚኦ  አግዚአነ እግዚአብሔር - ተሰፃለነ', 'agzio  agziane egziabሔr - teseፃlene', 'Ethiopian Orthodox Tewahedo Mezmur - አግዚኦ  አግዚአነ እግዚአብሔር - ተሰፃለነ', 'ለአግብርቲከ አስመ አልቦ ባዕድ አምላክ ዘአንበሌከ
ስብሐት ወአኮቴተ ንፌኑ ለስምከ ኢየሱስ ክርስቶስ
ዘአብጻአከነ አስከ ዛቲ ሰዓት በብዘወኃ ሣህልከ
ቁም ዜማ

VERSE 1
-፡- እግዚኦ እግዚእነ አግዚአብሔር ተሠነፃለነ
ለአግብርቲከ አስመ አልቦ ባዕድ አምላክ ዘአበሌከ
ስብሐተ ወአኮቴት ንፌኑ ለስምከ ኢየሱስ ክርስቶስ
ዘአብጻከነ አስከ ዛቲ ሰዓት በብዝኃ ሣህልከ

VERSE 2
- አንተ አቡነ ወአንተ አምነ ውስተ ቤትከ
ዘአጸንእአከነ ከመ ቀደሙ በአርዓያከ ወበአምሣልከ
ፈጠርከነ በፈቃድከ ለወንጌልከ መከ ነገርከነ
ወመሀርከነ ይእዜኒ እግዚእ እግዚኦ ባርክ ጉባኤነ

VERSE 3
/ማኅበረነ/ ወሀሎ ማእከሌነ', 'leagbrtike asme albo baዕd amlak zeanbelieke
sbሐt weakotiete nfienu lesmke iyesus krstos
zeabtsaakene aske zati seዓt bebzeweኃ ሣhlke
qum ziema

VERSE 1
-፡- egzio egziene agziabሔr teሠneፃlene
leagbrtike asme albo baዕd amlak zeabelieke
sbሐte weakotiet nfienu lesmke iyesus krstos
zeabtsakene aske zati seዓt bebzኃ ሣhlke

VERSE 2
- ante abune weante amne wste bietke
zeatseneakene keme qedemu bearዓyake webeamሣlke
fexerkene befeqadke lewengielke meke negerkene
wemeharkene yezieni egzie egzio bark gubaiene

VERSE 3
/maኅberene/ wehalo maekeliene', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('hulun-kemichl-alfana-miega', 'ሁሉን ከሚችል አልፋና ዖሜጋ', 'ሁሉን ከሚችል አልፋና ዖሜጋ', 'hulun kemichl alfana ዖmiega', 'Ethiopian Orthodox Tewahedo Mezmur - ሁሉን ከሚችል አልፋና ዖሜጋ', 'የሥላሴ መዝገብ የምሥጢር ሰሌዳ
ተጽፎብህ ያለ የምስጋና ጋዳ /እጅ መንሻ/
አንተ ታላቅ መሪ አውነተኛ አረኛ
ለኢትዮጵያ ጴጥሮስ ነህ ለበጎቹ ዳኛ', 'yeሥlasie mezgeb yemሥxir selieda
tetsfobh yale yemsgana gada /ej mensha/
ante talaq meri awnetegna aregna
leityophya phiexros neh lebegochu dagna', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('xmqete-ants', 'ጥምቀተ አንጽሐ', 'ጥምቀተ አንጽሐ', 'xmqete antsሐ', 'Ethiopian Orthodox Tewahedo Mezmur - ጥምቀተ አንጽሐ', 'ጥምቀተ አንጽሐ ሕጽው ወንግሥት ለአሊፃሁ
አም ሀበ ፊሊጾደስ ድህረ ተጠምቀ ለሊሁ /2/
ሰላማ አቡነ አንጽሐ ለነ በቅድሜሁ ለመድኃኒነ
ምሥጢረ ደሙ ወሥጋሁ /2/', 'xmqete antsሐ ሕtsw wengሥt lealiፃhu
am habe filitsodes dhre texemqe lelihu /2/
selama abune antsሐ lene beqdmiehu lemedኃnine
mሥxire demu weሥgahu /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ru-wetlwo', 'ሑሩ ወትልዎ', 'ሑሩ ወትልዎ', 'ሑru wetlwo', 'Ethiopian Orthodox Tewahedo Mezmur - ሑሩ ወትልዎ', 'ይቡሎ መንፈስቅዱስ ለፊልጾስ ሑር ወትልዎ
ለዝንቱ ሰረገላ ዘአፍራስ''/2/
ፊልጸስ መሀሮ ለባኮስ በእንተ ክርስቶስ
ወአጥመቆ በማየ ጥምቀት ሐዲስ /2/

VERSE 1
አለው መንፈስ ቅዱስ ፊልጾስን ሂድና ተከተለው
ይህንን የአፍራስ ሠረገላ /2/
ፊልጸስ አስተማረው ለባኮስ ስለክርስቶስ
አጠመቀው በማየ ጥምቀት ሐዲስ /2/', 'ybulo menfesqdus lefiltsos ሑr wetlwo
lezntu seregela zeafras''/2/
filtses meharo lebakos beente krstos
weaxmeqo bemaye xmqet ሐdis /2/

VERSE 1
alew menfes qdus filtsosn hidna teketelew
yhnn yeafras ሠregela /2/
filtses astemarew lebakos slekrstos
axemeqew bemaye xmqet ሐdis /2/', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;
INSERT INTO public.mezmur_data_import (slug, title, title_amharic, title_english, description, lyrics_amharic, lyrics_transliteration, primary_language, form, singer_name, youtube_url, status, review_status, source_url, created_at, updated_at) VALUES ('ke-stu-akal-andun', 'ከሦስቱ አካል አንዱን', 'ከሦስቱ አካል አንዱን', 'keሦstu akal andun', 'Ethiopian Orthodox Tewahedo Mezmur - ከሦስቱ አካል አንዱን', 'አመቤታችን ወልድን ስለወልደሽ
ስለዚህ ድንግል ሆይ እመቤታችን
አንወድሻለን', 'amebietachn weldn sleweldesh
slezih dngl hoy emebietachn
anwedshalen', 'amharic', 'mezmur', NULL, NULL, 'draft', 'pending', NULL, NOW(), NOW()) ON CONFLICT (slug) DO NOTHING;

-- -----------------------------------------------------------------------------
-- SECTION 3: VERIFICATION ASSERTIONS
-- -----------------------------------------------------------------------------
DO $$
DECLARE
  v_total_drafts integer;
BEGIN
  SELECT COUNT(*) INTO v_total_drafts FROM public.mezmur_data_import WHERE status = 'draft';
  RAISE NOTICE 'Import validation check complete. Total draft hymns: %', v_total_drafts;
END $$;

COMMIT;
-- =============================================================================
-- END OF COMBINED SAFE IMPORT SCRIPT
-- =============================================================================