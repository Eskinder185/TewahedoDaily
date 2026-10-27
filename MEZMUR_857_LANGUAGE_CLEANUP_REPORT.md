# Mezmur 857 language cleanup report

Generated locally on 2026-10-26. Production Supabase was not accessed or modified.

## Summary

- Records processed: 857
- Amharic lyric fields changed: 12
- Transliteration lyric fields changed: 856
- Formatting improvements: 868
- Standalone chorus headings removed: 0
- Deterministic repeated chorus blocks removed: 0
- Verse-alignment cases retained for review: 17
- Transliteration rows retaining Ethiopic characters because no reliable Latin rendering was established: 35
- Accidental Ethiopic characters converted using the standard syllabary map: 4811
- Existing wording with uncertain meaning was retained; no English translations or invented lyrics were added.

## File validation

- mezmur_import_ready_WITH_youtube_CORRECTED.csv: 488 records, exactly 25 columns, UTF-8 BOM, IDs/slugs/YouTube URLs preserved. Backup: mezmur-cleanup-output\original-857-backups\mezmur_import_ready_WITH_youtube.csv
- mezmur_import_ready_without_youtube_CORRECTED.csv: 369 records, exactly 25 columns, UTF-8 BOM, IDs/slugs/YouTube URLs preserved. Backup: mezmur-cleanup-output\original-857-backups\mezmur_import_ready_without_youtube.csv

## Before/after examples

### 1. trgum-barkln-abietu-yhnn-yem-ret (transliteration_lyrics)

Before:

~~~text
ዓmetachnn becherneth bzat
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
nዒ maryam lemhret weሣlh/2/
~~~

After:

~~~text
Ametachnn becherneth bzat
Lehzbochh ityophya endngeza leqdus
Smh (2)
Andihonln nuroachn beselam
VERSE 1
Bedekhna bezih amet (2)
35. weanteni wereb zmamie tsfat
Halie luya weanteni htsan nebiye lul tsemey
Arko lemerawi tsemey weazmadu besga
VERSE 2
Tsemey tefenoke tearwu anaqtse tsdq
Bemenfes yehawr webekhayle ielyas
Albo zeyeabl yole yohans
Wereb
VERSE 3
Weantini htsan nebiye lul/ri/
Arko lemerawi tsemey (2) nebiyelul (2)
Selam
Tesealke egzio mdreke zalie luya
VERSE 4
Yohans kbur nebiye lul basie selam zenbretu
Gedam (2)
3. rəse awde amet
Rəse awdeamet yohans weladi mexqə (2)
VERSE 5
Weladie mexqətsə (2) weabeqtie (2)
Rəse awdeamet yohans weladie mexqe (2)
Weladie mexqts (2) yohans
4. awde amet
VERSE 6
Awde amet lebarko barko awde amet (2)
Ni maryam lemhret wesalh (2)
~~~

### 2. kezih-let-kezih-met-laderesen-hulachnn-2 (transliteration_lyrics)

Before:

~~~text
yesew ljoch admie xntunm sijemer
mn biwexa biwerd bibeza bidemer
and qen aymolam endeante aqoxaxer /2/
~~~

After:

~~~text
Yesew ljoch admie xntunm sijemer
Mn biwexa biwerd bibeza bidemer
And qen aymolam endeante aqoxaxer (2)
~~~

### 3. abebayosh (transliteration_lyrics)

Before:

~~~text
asey des des ybelachhu/2/
qdus yoሐns mexalachhu
des des ybelachhu
des blon mexan des blon/2/

VERSE 1
gieta ale blen des blon
des blon mexan des blon/2/
dngl alech blen des blun
~~~

After:

~~~text
Asey des des ybelachhu (2)
Qdus yohans mexalachhu
Des des ybelachhu
Des blon mexan des blon (2)
VERSE 1
Gieta ale blen des blon
Des blon mexan des blon (2)
Dngl alech blen des blun
~~~

### 4. dngl-maryamn-qdst (transliteration_lyrics)

Before:

~~~text
anlemnat qdst
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
yqerbal selam. qdst ›
~~~

After:

~~~text
Anlemnat qdst
Mhret yemiyasax qdst
Qalkidan alat qdst
Cnqet yrqal qdst
VERSE 1
Yqerbal selam qdest ›
Dngl maryamn qdst
Anlemnat qdst
Mhret yemiyasax qdst
VERSE 2
Qalkidan alat qdst
Cnqet yrqal qdst
Yqerbal selam. qdst ›
~~~

### 5. ityophya-des-ybelsh-tlq-tsega-alesh-2 (transliteration_lyrics)

Before:

~~~text
slefetsemsh ሦstun ሕggat yefexarishn
kalefew shtet hulachn
ityophya des ybelsh tlq tsega alesh/2/
slefetsemsh ሦstun ሕggat yefexarishn

VERSE 1
kalefew shtet hulachn
~~~

After:

~~~text
Slefetsemsh sostun hggat yefexarishn
Kalefew shtet hulachn
Ityophya des ybelsh tlq tsega alesh (2)
Slefetsemsh sostun hggat yefexarishn
VERSE 1
Kalefew shtet hulachn
~~~

### 6. ityophya-bahl-quanquash-yemiyakorash-2 (transliteration_lyrics)

Before:

~~~text
ityophya bahl quanquash yemiyakorash/2/
~~~

After:

~~~text
Ityophya bahl quanquash yemiyakorash (2)
~~~

### 7. kebrew-yqoyu-kebrew (transliteration_lyrics)

Before:

~~~text
kebrew yqoyu kebrew
kebrew yqoyu kebrew
abebaw lemlem qiexiemaw lemlem
kebrew yqoyu kebrew

VERSE 1
kebrew yqoyu kebrew
keዓmet eske ዓmet dersew
kebrew yqoyu kebrew
abebaw lemlem qiexiemaw lemlem
~~~

After:

~~~text
Kebrew yqoyu kebrew
Kebrew yqoyu kebrew
Abebaw lemlem qiexiemaw lemlem
Kebrew yqoyu kebrew
VERSE 1
Kebrew yqoyu kebrew
Keamet eske amet dersew
Kebrew yqoyu kebrew
Abebaw lemlem qiexiemaw lemlem
~~~

### 8. yeawaj-negari-qal-bebereha-ayele (transliteration_lyrics)

Before:

~~~text
yeagziabሔrn menged astekaklu eyale
mskrnetun yoሐns kasredan
yeawaj negari qal bebereha ayele
yeagziabሔrn menged astekaklu eyale

VERSE 1
mskrnetun yoሐns kasredan
~~~

After:

~~~text
Yeagziabhern menged astekaklu eyale
Mskrnetun yohans kasredan
Yeawaj negari qal bebereha ayele
Yeagziabhern menged astekaklu eyale
VERSE 1
Mskrnetun yohans kasredan
~~~

### 9. lbachn-legieta-melkam-menged-yhun (transliteration_lyrics)

Before:

~~~text
lbachn legieta melkam menged yhun
~~~

After:

~~~text
Lbachn legieta melkam menged yhun
~~~

### 10. teraraw-zq-ybel-xemamawm-yqna (transliteration_lyrics)

Before:

~~~text
kaltestekakele menged yelemna
yeagziabሔrn menged anxreg hulachn
malefiya endihonen wede amlakachn
teraraw zq ybel xemamawm yqna

VERSE 1
kaltestekakele menged yelemna
yeagziabሔrn menged enxreg hulachn
malefiya andihonen wede amlakachn
~~~

After:

~~~text
Kaltestekakele menged yelemna
Yeagziabhern menged anxreg hulachn
Malefiya endihonen wede amlakachn
Teraraw zq ybel xemamawm yqna
VERSE 1
Kaltestekakele menged yelemna
Yeagziabhern menged enxreg hulachn
Malefiya andihonen wede amlakachn
~~~

### 11. be-xiat-celema-tewxen-salen (transliteration_lyrics)

Before:

~~~text
yekrstos mesqel brሃፃn honeln/2/
~~~

After:

~~~text
Yekrstos mesqel brhatsan honeln (2)
~~~

### 12. mesqel-abeba (transliteration_lyrics)

Before:

~~~text
mesqel abeba neh wb abeba
adey abeba neshe wb abeba
~~~

After:

~~~text
Mesqel abeba neh wb abeba
Adey abeba neshe wb abeba
~~~

### 13. 21-mesqel (transliteration_lyrics)

Before:

~~~text
ፅፀ mesqel yekbr mewresha
seyxann dl mensha
yekbr balebiet ዕፀ mesqel yeteሠwabet ዕፀ mesqel
ፅፀ mesqelu new ዕፀ mesqel yeዓlem medኃnit ዕፀ mesqel
~~~

After:

~~~text
Tstsa mesqel yekbr mewresha
Seyxann dl mensha
Yekbr balebiet ətsa mesqel yetesawabet ətsa mesqel
Tstsa mesqelu new ətsa mesqel yealem medkhanit ətsa mesqel
~~~

### 14. ytqedes-smke (transliteration_lyrics)

Before:

~~~text
ytqedes smke beኃyle mesqelke beዕፀ mesqelke kbur
zeaዕbeyko lesmke /2/
sbሐt leke lebahtitke lዑl /qie
~~~

After:

~~~text
Ytqedes smke bekhayle mesqelke beətsa mesqelke kbur
Zeaəbeyko lesmke (2)
Sbhat leke lebahtitke lul /qie
~~~

### 15. yomse (transliteration_lyrics)

Before:

~~~text
yomse lealiyaye /2/
aberh bemesqelye /qie
~~~

After:

~~~text
Yomse lealiyaye (2)
Aberh bemesqelye /qie
~~~

## Scope and limitations

The cleanup is deterministic and text-supported: Unicode NFC normalization, line-ending and stanza normalization, punctuation spacing, verse-heading normalization, standalone chorus-label removal, known Fidel-to-Latin repairs, and conservative sacred-name spelling normalization. Repeated chorus content was not deleted unless its identity was deterministic; no such block was removed by this run. Rows with uncertain Amharic/transliteration alignment remain unchanged in wording and are flagged above.
