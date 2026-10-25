import { parseCsvText } from './mezmurCsvImport'
import {
  findZemariBySlug,
  saveZemari,
  slugifyZemari,
  type ZemariRow,
} from './zemariAdminService'

export type ZemariImportRowState = 'pending' | 'importing' | 'imported' | 'failed' | 'skipped'

export type StagedZemariCsvRow = {
  rowNumber: number
  stagingId: string
  slug: string
  name: string
  name_amharic: string
  bio: string
  bio_amharic: string
  youtube_url: string
  website_url: string
  source_status: string
  sort_order: number
  mezmur_count: number
  mezmurs_with_lyrics_count: number
  selected: boolean
  alreadyExists: boolean
  duplicateInBatch: boolean
  potentialDuplicate: boolean
  duplicateMatches: string[]
  reviewWarnings: string[]
  validationError: string | null
  importState: ZemariImportRowState
  importError: string | null
}

export const PRESET_ZEMARIS_WITH_LYRICS: Array<{
  slug: string
  name: string
  name_amharic: string
  sort_order: number
  mezmur_count: number
  mezmurs_with_lyrics_count: number
}> = [
  {
    "slug": "like-mezemiran-tewodiros-yosef",
    "name": "Like Mezemiran Tewodiros Yosef",
    "name_amharic": "ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ",
    "sort_order": 10,
    "mezmur_count": 211,
    "mezmurs_with_lyrics_count": 64
  },
  {
    "slug": "jan-yared",
    "name": "Jan Yared",
    "name_amharic": "ጃን ያሬድ",
    "sort_order": 20,
    "mezmur_count": 86,
    "mezmurs_with_lyrics_count": 53
  },
  {
    "slug": "zemari-berehet-tikue",
    "name": "Zemari Berehet Tikue",
    "name_amharic": "ዘማሪ በረኸት ትኩእ",
    "sort_order": 30,
    "mezmur_count": 51,
    "mezmurs_with_lyrics_count": 33
  },
  {
    "slug": "zemari-kesis-minidaye-birihanu",
    "name": "Zemari Kesis Minidaye Birihanu",
    "name_amharic": "ዘማሪ ቀሲስ ምንዳዬ ብርሃኑ",
    "sort_order": 40,
    "mezmur_count": 48,
    "mezmurs_with_lyrics_count": 26
  },
  {
    "slug": "zemari-diyakon-abel-mekibib",
    "name": "Zemari Diyakon Abel Mekibib",
    "name_amharic": "ዘማሪ ዲያቆን አቤል መክብብ",
    "sort_order": 50,
    "mezmur_count": 119,
    "mezmurs_with_lyrics_count": 26
  },
  {
    "slug": "zemarit-miritinesh-tilahun",
    "name": "Zemarit Miritinesh Tilahun",
    "name_amharic": "ዘማሪት ምርትነሽ ጥላሁን",
    "sort_order": 60,
    "mezmur_count": 120,
    "mezmurs_with_lyrics_count": 19
  },
  {
    "slug": "zemari-yeabikal-desalegn",
    "name": "Zemari Yeabikal Desalegn",
    "name_amharic": "ዘማሪ የአብቃል ደሳለኝ",
    "sort_order": 70,
    "mezmur_count": 42,
    "mezmurs_with_lyrics_count": 19
  },
  {
    "slug": "mahibere-kidusan",
    "name": "Mahibere Kidusan",
    "name_amharic": "ማኅበረ ቅዱሳን",
    "sort_order": 80,
    "mezmur_count": 47,
    "mezmurs_with_lyrics_count": 16
  },
  {
    "slug": "zemari-diyakon-kedametsega-yohanis",
    "name": "Zemari Diyakon Kedametsega Yohanis",
    "name_amharic": "ዘማሪ ዲያቆን ቀዳሜጸጋ ዮሐንስ",
    "sort_order": 90,
    "mezmur_count": 57,
    "mezmurs_with_lyrics_count": 15
  },
  {
    "slug": "like-mezemiran-yilima-hayilu",
    "name": "Like Mezemiran Yilima Hayilu",
    "name_amharic": "ሊቀ መዘምራን ይልማ ኃይሉ",
    "sort_order": 100,
    "mezmur_count": 123,
    "mezmurs_with_lyrics_count": 14
  },
  {
    "slug": "zemari-diyakon-enidale-dereje",
    "name": "Zemari Diyakon Enidale Dereje",
    "name_amharic": "ዘማሪ ዲያቆን እንዳለ ደረጀ",
    "sort_order": 110,
    "mezmur_count": 40,
    "mezmurs_with_lyrics_count": 14
  },
  {
    "slug": "kesis-zemari-ashenafi-gebire-mariyam",
    "name": "Kesis Zemari Ashenafi Gebire Mariyam",
    "name_amharic": "ቀሲስ ዘማሪ አሸናፊ ገብረ ማርያም",
    "sort_order": 120,
    "mezmur_count": 91,
    "mezmurs_with_lyrics_count": 13
  },
  {
    "slug": "zemarit-sisiter-fasika-mekonin",
    "name": "Zemarit Sisiter Fasika Mekonin",
    "name_amharic": "ዘማሪት ሲስተር ፋሲካ መኮንን",
    "sort_order": 130,
    "mezmur_count": 38,
    "mezmurs_with_lyrics_count": 13
  },
  {
    "slug": "zemari-adam-mulugeta",
    "name": "Zemari Adam Mulugeta",
    "name_amharic": "",
    "sort_order": 140,
    "mezmur_count": 20,
    "mezmurs_with_lyrics_count": 12
  },
  {
    "slug": "muhaze-sibihat-zemari-dagimawi-deribe",
    "name": "Muhaze Sibihat Zemari Dagimawi Deribe",
    "name_amharic": "ሙሐዘ ስብሀት ዘማሪ ዳግማዊ ደርቤ",
    "sort_order": 150,
    "mezmur_count": 50,
    "mezmurs_with_lyrics_count": 11
  },
  {
    "slug": "zemari-diyakon-firezer-desalegn",
    "name": "Zemari Diyakon Firezer Desalegn",
    "name_amharic": "ዘማሪ ዲያቆን ፍሬዘር ደሳለኝ",
    "sort_order": 160,
    "mezmur_count": 45,
    "mezmurs_with_lyrics_count": 10
  },
  {
    "slug": "like-lisanat-cherinet-senay",
    "name": "Like Lisanat Cherinet Senay",
    "name_amharic": "ሊቀ ልሣናት ቸርነት ሰናይ",
    "sort_order": 170,
    "mezmur_count": 46,
    "mezmurs_with_lyrics_count": 10
  },
  {
    "slug": "zemarit-sisiter-hiyiwet-teferi",
    "name": "Zemarit Sisiter Hiyiwet Teferi",
    "name_amharic": "ዘማሪት ሲስተር ሕይወት ተፈሪ",
    "sort_order": 180,
    "mezmur_count": 89,
    "mezmurs_with_lyrics_count": 10
  },
  {
    "slug": "zemarit-fanitu-welide",
    "name": "Zemarit Fanitu Welide",
    "name_amharic": "ዘማሪት ፋንቱ ወልዴ",
    "sort_order": 190,
    "mezmur_count": 26,
    "mezmurs_with_lyrics_count": 10
  },
  {
    "slug": "zemari-diyakon-ezira-ha-mikael",
    "name": "Zemari Diyakon Ezira Ha/mikael",
    "name_amharic": "ዘማሪ ዲያቆን እዝራ ኃ/ሚካኤል",
    "sort_order": 200,
    "mezmur_count": 44,
    "mezmurs_with_lyrics_count": 9
  },
  {
    "slug": "zemari-diyakon-begna-girima",
    "name": "Zemari Diyakon Begna Girima",
    "name_amharic": "ዘማሪ ዲያቆን ቤኛ ግርማ",
    "sort_order": 210,
    "mezmur_count": 15,
    "mezmurs_with_lyrics_count": 9
  },
  {
    "slug": "zemarit-sara-menigisitu",
    "name": "Zemarit Sara Menigisitu",
    "name_amharic": "ዘማሪት ሳራ መንግስቱ",
    "sort_order": 220,
    "mezmur_count": 16,
    "mezmurs_with_lyrics_count": 9
  },
  {
    "slug": "zemari-diyakon-hawaz-tegegn",
    "name": "Zemari Diyakon Hawaz Tegegn",
    "name_amharic": "ዘማሪ ዲያቆን ሐዋዝ ተገኝ",
    "sort_order": 230,
    "mezmur_count": 34,
    "mezmurs_with_lyrics_count": 9
  },
  {
    "slug": "zemari-diyakon-abiriham-mehari",
    "name": "Zemari Diyakon Abiriham Mehari",
    "name_amharic": "ዘማሪ ዲያቆን ኣብርሃም መሃሪ",
    "sort_order": 240,
    "mezmur_count": 12,
    "mezmurs_with_lyrics_count": 9
  },
  {
    "slug": "zemari-diyakon-bisirat-chebisi",
    "name": "Zemari Diyakon Bisirat Chebisi",
    "name_amharic": "ዘማሪ ዲያቆን ብስራት ጨብሲ",
    "sort_order": 250,
    "mezmur_count": 48,
    "mezmurs_with_lyrics_count": 8
  },
  {
    "slug": "zemari-gebireyohanis-gebiretsadik",
    "name": "Zemari Gebireyohanis Gebiretsadik",
    "name_amharic": "ዘማሪ ገብረዮሐንስ ገብረፃድቅ",
    "sort_order": 260,
    "mezmur_count": 63,
    "mezmurs_with_lyrics_count": 8
  },
  {
    "slug": "zemari-diyakon-yosef-girima",
    "name": "Zemari Diyakon Yosef Girima",
    "name_amharic": "ዘማሪ ዲያቆን ዮሴፍ ግርማ",
    "sort_order": 270,
    "mezmur_count": 20,
    "mezmurs_with_lyrics_count": 7
  },
  {
    "slug": "zemari-besufikad-anidarigachew",
    "name": "Zemari Besufikad Anidarigachew",
    "name_amharic": "ዘማሪ በሱፍቃድ አንዳርጋቸው",
    "sort_order": 280,
    "mezmur_count": 29,
    "mezmurs_with_lyrics_count": 6
  },
  {
    "slug": "zemarit-lemilem-kebede",
    "name": "Zemarit Lemilem Kebede",
    "name_amharic": "ዘማሪት ለምለም ከበደ",
    "sort_order": 290,
    "mezmur_count": 21,
    "mezmurs_with_lyrics_count": 6
  },
  {
    "slug": "zemarit-rut-demelash",
    "name": "Zemarit Rut Demelash",
    "name_amharic": "ዘማሪት ሩት ደመላሽ",
    "sort_order": 300,
    "mezmur_count": 21,
    "mezmurs_with_lyrics_count": 6
  },
  {
    "slug": "zemari-keshi-teame-segid",
    "name": "Zemari Keshi Teame Segid",
    "name_amharic": "ዘማሪ ቀሺ ጠዓመ ሰጊድ",
    "sort_order": 310,
    "mezmur_count": 7,
    "mezmurs_with_lyrics_count": 6
  },
  {
    "slug": "zemari-diyakon-dawit-tilahun",
    "name": "Zemari Diyakon Dawit Tilahun",
    "name_amharic": "ዘማሪ ዲያቆን ዳዊት ጥላሁን",
    "sort_order": 320,
    "mezmur_count": 13,
    "mezmurs_with_lyrics_count": 5
  },
  {
    "slug": "zemarit-naridos-kasahun",
    "name": "Zemarit Naridos Kasahun",
    "name_amharic": "ዘማሪት ናርዶስ ካሳሁን",
    "sort_order": 330,
    "mezmur_count": 18,
    "mezmurs_with_lyrics_count": 5
  },
  {
    "slug": "zemarit-lidya-webetu",
    "name": "Zemarit Lidya Webetu",
    "name_amharic": "",
    "sort_order": 340,
    "mezmur_count": 10,
    "mezmurs_with_lyrics_count": 5
  },
  {
    "slug": "like-mezemiran-kinetibeb-welidekirikos",
    "name": "Like Mezemiran Kinetibeb Welidekirikos",
    "name_amharic": "ሊቀ መዘምራን ኪነጥበብ ወልደቂርቆስ",
    "sort_order": 350,
    "mezmur_count": 23,
    "mezmurs_with_lyrics_count": 5
  },
  {
    "slug": "zemarit-betselot-asimare",
    "name": "Zemarit Betselot Asimare",
    "name_amharic": "ዘማሪት በፀሎት አስማረ",
    "sort_order": 360,
    "mezmur_count": 25,
    "mezmurs_with_lyrics_count": 5
  },
  {
    "slug": "zemari-mikiyas-aregawi",
    "name": "Zemari Mikiyas Aregawi",
    "name_amharic": "ዘማሪ ሚክያስ አረጋዊ",
    "sort_order": 370,
    "mezmur_count": 14,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemarit-etsegenet-kebede",
    "name": "Zemarit Etsegenet Kebede",
    "name_amharic": "ዘማሪት እፀገነት ከበደ",
    "sort_order": 380,
    "mezmur_count": 11,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemarit-eden-neway",
    "name": "Zemarit Eden Neway",
    "name_amharic": "ዘማሪት ኤደን ነዋይ",
    "sort_order": 390,
    "mezmur_count": 5,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemari-henok-fekadu",
    "name": "Zemari Henok Fekadu",
    "name_amharic": "ዘማሪ ሄኖክ ፈቃዱ",
    "sort_order": 400,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemarit-gellila-yohannes",
    "name": "Zemarit Gellila Yohannes",
    "name_amharic": "",
    "sort_order": 410,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemarit-selamawit-sorisa",
    "name": "Zemarit Selamawit Sorisa",
    "name_amharic": "ዘማሪት ሰላማዊት ሶርሳ",
    "sort_order": 420,
    "mezmur_count": 6,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemari-diyakon-zelealem-takele",
    "name": "Zemari Diyakon Zelealem Takele",
    "name_amharic": "ዘማሪ ዲያቆን ዘለዓለም ታከለ",
    "sort_order": 430,
    "mezmur_count": 21,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemari-deacon-samuel-teshome",
    "name": "Zemari Deacon Samuel Teshome",
    "name_amharic": "",
    "sort_order": 440,
    "mezmur_count": 5,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemari-diyakon-abel-tesifaye",
    "name": "Zemari Diyakon Abel Tesifaye",
    "name_amharic": "ዘማሪ ዲያቆን አቤል ተስፋዬ",
    "sort_order": 450,
    "mezmur_count": 7,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemarit-rahiwa-tehesite",
    "name": "Zemarit Rahiwa Tehesite",
    "name_amharic": "ዘማሪት ራህዋ ተኸስተ",
    "sort_order": 460,
    "mezmur_count": 11,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemari-diyakon-tadiyos-girima",
    "name": "Zemari Diyakon Tadiyos Girima",
    "name_amharic": "ዘማሪ ዲያቆን ታድዮስ ግርማ",
    "sort_order": 470,
    "mezmur_count": 14,
    "mezmurs_with_lyrics_count": 4
  },
  {
    "slug": "zemari-diyakon-behayilu-tebeje",
    "name": "Zemari Diyakon Behayilu Tebeje",
    "name_amharic": "ዘማሪ ዲያቆን በሀይሉ ተበጀ",
    "sort_order": 480,
    "mezmur_count": 21,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-birukitawit-nigatu",
    "name": "Zemarit Birukitawit Nigatu",
    "name_amharic": "ዘማሪት ብሩክታዊት ንጋቱ",
    "sort_order": 490,
    "mezmur_count": 13,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-hana-tefera",
    "name": "Zemarit Hana Tefera",
    "name_amharic": "",
    "sort_order": 500,
    "mezmur_count": 5,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-sebilewenigel-eshete",
    "name": "Zemarit Sebilewenigel Eshete",
    "name_amharic": "ዘማሪት ሰብለወንጌል እሸቴ",
    "sort_order": 510,
    "mezmur_count": 7,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-selamawit-melaku",
    "name": "Zemarit Selamawit Melaku",
    "name_amharic": "ዘማሪት ሰላማዊት መላኩ",
    "sort_order": 520,
    "mezmur_count": 11,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-tsigereda-tilahun",
    "name": "Zemarit Tsigereda Tilahun",
    "name_amharic": "ዘማሪት ጽጌረዳ ጥላሁን",
    "sort_order": 530,
    "mezmur_count": 22,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemari-ze-fanuel-aleka",
    "name": "Zemari Ze-fanuel Aleka",
    "name_amharic": "ዘማሪ ዘ-ፋኑኤል አለቃ",
    "sort_order": 540,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-tsedale-gobeze",
    "name": "Zemarit Tsedale Gobeze",
    "name_amharic": "ዘማሪት ፀዳለ ጎበዜ",
    "sort_order": 550,
    "mezmur_count": 12,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-birukitawit-ge-medihin",
    "name": "Zemarit Birukitawit Ge/medihin",
    "name_amharic": "ዘማሪት ብሩክታዊት ገ/መድህን",
    "sort_order": 560,
    "mezmur_count": 7,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemari-abel-semeriab",
    "name": "Zemari Abel Semeriab",
    "name_amharic": "ዘማሪ ኣቤል ሰመርኣብ",
    "sort_order": 570,
    "mezmur_count": 5,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-egeziharya-yilma",
    "name": "Zemarit Egeziharya Yilma",
    "name_amharic": "",
    "sort_order": 580,
    "mezmur_count": 8,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-kiyaki-ha-gebiriel",
    "name": "Zemarit Kiyaki Ha/gebiriel",
    "name_amharic": "ዘማሪት ኪያኪ ሃ/ገብርኤል",
    "sort_order": 590,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemari-diyakon-kiros-yiheyis",
    "name": "Zemari Diyakon Kiros Yiheyis",
    "name_amharic": "ዘማሪ ዲያቆን ኪሮስ ይኄይስ",
    "sort_order": 600,
    "mezmur_count": 7,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemari-daniel-tibebesilase",
    "name": "Zemari Daniel Tibebesilase",
    "name_amharic": "ዘማሪ ዳንኤል ጥበበሥላሴ",
    "sort_order": 610,
    "mezmur_count": 28,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemari-diyakon-yitibarek-tegegn",
    "name": "Zemari Diyakon Yitibarek Tegegn",
    "name_amharic": "ዘማሪ ዲያቆን ይትባረክ ተገኝ",
    "sort_order": 620,
    "mezmur_count": 25,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-betty-woldeyohanes",
    "name": "Zemarit Betty Woldeyohanes",
    "name_amharic": "",
    "sort_order": 630,
    "mezmur_count": 8,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-azeb-kebede",
    "name": "Zemarit Azeb Kebede",
    "name_amharic": "ዘማሪት አዜብ ከበደ",
    "sort_order": 640,
    "mezmur_count": 17,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "meliake-selam-kesis-enigidawerik-bekele",
    "name": "Meliake Selam Kesis Enigidawerik Bekele",
    "name_amharic": "መልአከ ሰላም ቀሲስ እንግዳወርቅ በቀለ",
    "sort_order": 650,
    "mezmur_count": 34,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "like-mezemiran-diyakon-firanol-mosisa",
    "name": "Like Mezemiran Diyakon Firanol Mosisa",
    "name_amharic": "ሊቀ መዘምራን ዲያቆን ፍራኖል ሞሲሳ",
    "sort_order": 660,
    "mezmur_count": 18,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemari-alemayehu-urige",
    "name": "Zemari Alemayehu Urige",
    "name_amharic": "ዘማሪ አለማየሁ ኡርጌ",
    "sort_order": 670,
    "mezmur_count": 13,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-tiegisit-sileshi",
    "name": "Zemarit Tiegisit Sileshi",
    "name_amharic": "ዘማሪት ትዕግስት ስለሺ",
    "sort_order": 680,
    "mezmur_count": 8,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemarit-tenaye-asefa",
    "name": "Zemarit Tenaye Asefa",
    "name_amharic": "ዘማሪት ጤናዬ አሰፋ",
    "sort_order": 690,
    "mezmur_count": 9,
    "mezmurs_with_lyrics_count": 3
  },
  {
    "slug": "zemari-kesis-esikinidir-welidemariyam",
    "name": "Zemari Kesis Esikinidir Welidemariyam",
    "name_amharic": "ዘማሪ ቀሲስ እስክንድር ወልደማርያም",
    "sort_order": 700,
    "mezmur_count": 5,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "like-diyakonat-nebiyu-samuel",
    "name": "Like Diyakonat Nebiyu Samuel",
    "name_amharic": "ሊቀ ዲያቆናት ነቢዩ ሳሙኤል",
    "sort_order": 710,
    "mezmur_count": 20,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-kenenisa-tabor",
    "name": "Zemari Kenenisa Tabor",
    "name_amharic": "ዘማሪ ቀነኒሳ ታቦር",
    "sort_order": 720,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-bezawerik-asifaw",
    "name": "Zemarit Bezawerik Asifaw",
    "name_amharic": "ዘማሪት በዛወርቅ አስፋው",
    "sort_order": 730,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-gebireamilak-desalegn",
    "name": "Zemari Gebireamilak Desalegn",
    "name_amharic": "ዘማሪ ገብረአምላክ ደሳለኝ",
    "sort_order": 740,
    "mezmur_count": 13,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-edilawit-firew",
    "name": "Zemarit Edilawit Firew",
    "name_amharic": "ዘማሪት እድላዊት ፍሬው",
    "sort_order": 750,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-kesis-wenidiwesen-belay",
    "name": "Zemari Kesis Wenidiwesen Belay",
    "name_amharic": "ዘማሪ ቀሲስ ወንድወሰን በላይ",
    "sort_order": 760,
    "mezmur_count": 16,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-beeminet",
    "name": "Zemari Diyakon Beeminet",
    "name_amharic": "ዘማሪ ዲያቆን በእምነት",
    "sort_order": 770,
    "mezmur_count": 5,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-samuel-tediros",
    "name": "Zemari Samuel Tediros",
    "name_amharic": "ዘማሪ ሳሙኤል ቴድሮስ",
    "sort_order": 780,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-herimela-yihisho",
    "name": "Zemarit Herimela Yihisho",
    "name_amharic": "ዘማሪት ሄርሜላ ይሕሾ",
    "sort_order": 790,
    "mezmur_count": 5,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-sibuh-felege",
    "name": "Zemari Diyakon Sibuh Felege",
    "name_amharic": "ዘማሪ ዲያቆን ስቡሕ ፈለገ",
    "sort_order": 800,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-kisanet-kibirom",
    "name": "Zemarit Kisanet Kibirom",
    "name_amharic": "ዘማሪት ቅሳነት ክብሮም",
    "sort_order": 810,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-lebeza-alemu",
    "name": "Zemarit Lebeza Alemu",
    "name_amharic": "",
    "sort_order": 820,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-tirihas-gebireegiziabiher",
    "name": "Zemarit Tirihas Gebireegiziabiher",
    "name_amharic": "ዘማሪት ትርሃስ ገብረእግዚአብሔር",
    "sort_order": 830,
    "mezmur_count": 22,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-deacon-brook-argaw",
    "name": "Zemari Deacon Brook Argaw",
    "name_amharic": "",
    "sort_order": 840,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-firaol-chebisi",
    "name": "Zemari Diyakon Firaol Chebisi",
    "name_amharic": "ዘማሪ ዲያቆን ፍራኦል ጨብሲ",
    "sort_order": 850,
    "mezmur_count": 8,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-bisirat-teshome",
    "name": "Zemari Diyakon Bisirat Teshome",
    "name_amharic": "ዘማሪ ዲያቆን ብስራት ተሾመ",
    "sort_order": 860,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-kibirom-mehari",
    "name": "Zemari Diyakon Kibirom Mehari",
    "name_amharic": "ዘማሪ ዲያቆን ክብሮም መሓሪ",
    "sort_order": 870,
    "mezmur_count": 12,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-feven-eyob",
    "name": "Zemarit Feven Eyob",
    "name_amharic": "ዘማሪት ፌቨን እዮብ",
    "sort_order": 880,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-kidisit-mitiku",
    "name": "Zemarit Kidisit Mitiku",
    "name_amharic": "ዘማሪት ቅድስት ምትኩ",
    "sort_order": 890,
    "mezmur_count": 6,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-hizikiyas-birihanu",
    "name": "Zemari Diyakon Hizikiyas Birihanu",
    "name_amharic": "ዘማሪ ዲያቆን ህዝቅያስ ብርሀኑ",
    "sort_order": 900,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-natinael-abebe",
    "name": "Zemari Diyakon Natinael Abebe",
    "name_amharic": "ዘማሪ ዲያቆን ናትናኤል አበበ",
    "sort_order": 910,
    "mezmur_count": 9,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-samison-negash",
    "name": "Zemari Diyakon Samison Negash",
    "name_amharic": "ዘማሪ ዲያቆን ሳምሶን ነጋሽ",
    "sort_order": 920,
    "mezmur_count": 10,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-mekides-mariye",
    "name": "Zemarit Mekides Mariye",
    "name_amharic": "ዘማሪት መቅደስ ማርዬ",
    "sort_order": 930,
    "mezmur_count": 6,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-zelalem-takele",
    "name": "Zemari Diyakon Zelalem Takele",
    "name_amharic": "ዘማሪ ዲያቆን ዘላለም ታከለ",
    "sort_order": 940,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemarit-sisiter-lidiya-tadese",
    "name": "Zemarit Sisiter Lidiya Tadese",
    "name_amharic": "ዘማሪት ሲስተር ልድያ ታደሰ",
    "sort_order": 950,
    "mezmur_count": 21,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "riese-mezemiran-esitifanos-sahile",
    "name": "Riese Mezemiran Esitifanos Sahile",
    "name_amharic": "ርዕሰ መዘምራን እስጢፋኖስ ሣህሌ",
    "sort_order": 960,
    "mezmur_count": 18,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-fikadu-amare",
    "name": "Zemari Fikadu Amare",
    "name_amharic": "ዘማሪ ፍቃዱ አማረ",
    "sort_order": 970,
    "mezmur_count": 16,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-mahidereliul-fiseha",
    "name": "Zemari Diyakon Mahidereliul Fiseha",
    "name_amharic": "ዘማሪ ዲያቆን ማኅደረልዑል ፍሰሃ",
    "sort_order": 980,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-mahidereliul-fisiha",
    "name": "Zemari Diyakon Mahidereliul Fisiha",
    "name_amharic": "ዘማሪ ዲያቆን ማኅደረልዑል ፍስሃ",
    "sort_order": 990,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-yonas-gebirekidan",
    "name": "Zemari Yonas Gebirekidan",
    "name_amharic": "ዘማሪ ዮናስ ገብረኪዳን",
    "sort_order": 1000,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 2
  },
  {
    "slug": "zemari-diyakon-kidus-dawit",
    "name": "Zemari Diyakon Kidus Dawit",
    "name_amharic": "ዘማሪ ዲያቆን ቅዱስ ዳዊት",
    "sort_order": 1010,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-kidisit-muluneh",
    "name": "Zemarit Kidisit Muluneh",
    "name_amharic": "ዘማሪት ቅድስት ሙሉነህ",
    "sort_order": 1020,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-tadele-degif",
    "name": "Zemari Diyakon Tadele Degif",
    "name_amharic": "ዘማሪ ዲያቆን ታደለ ደግፍ",
    "sort_order": 1030,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-mesikerem-welide",
    "name": "Zemarit Mesikerem Welide",
    "name_amharic": "ዘማሪት መስከረም ወልዴ",
    "sort_order": 1040,
    "mezmur_count": 14,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-yohanis-adimasu",
    "name": "Zemari Diyakon Yohanis Adimasu",
    "name_amharic": "ዘማሪ ዲያቆን ዮሐንስ አድማሱ",
    "sort_order": 1050,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-fana-tewelide",
    "name": "Zemarit Fana Tewelide",
    "name_amharic": "ዘማሪት ፋና ተወልደ",
    "sort_order": 1060,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-arisemawit-asichalew",
    "name": "Zemarit Arisemawit Asichalew",
    "name_amharic": "ዘማሪት አርሴማዊት አስቻለው",
    "sort_order": 1070,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-tiegisit-hayile",
    "name": "Zemarit Tiegisit Hayile",
    "name_amharic": "ዘማሪት ትዕግስት ኃይሌ",
    "sort_order": 1080,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-tiegisit-getachewu",
    "name": "Zemarit Tiegisit Getachewu",
    "name_amharic": "ዘማሪት ትእግስት ጌታቸዉ",
    "sort_order": 1090,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-marita-hayilesilase",
    "name": "Zemarit Marita Hayilesilase",
    "name_amharic": "ዘማሪት ማርታ ኃይለሥላሴ",
    "sort_order": 1100,
    "mezmur_count": 5,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "merigeta-tsehay-birihanu",
    "name": "Merigeta Tsehay Birihanu",
    "name_amharic": "መሪጌታ ፀሐይ ብርሃኑ",
    "sort_order": 1110,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-fireweyin-berihun",
    "name": "Zemarit Fireweyin Berihun",
    "name_amharic": "ዘማሪት ፍሬወይን በሪሁን",
    "sort_order": 1120,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-sidona-samuel",
    "name": "Zemarit Sidona Samuel",
    "name_amharic": "",
    "sort_order": 1130,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "aba-birihane-iyesus-shimelis",
    "name": "Aba Birihane Iyesus Shimelis",
    "name_amharic": "አባ ብርሃነ ኢየሱስ ሽመልስ",
    "sort_order": 1140,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-filimon-yeebiyo",
    "name": "Zemari Diyakon Filimon Yeebiyo",
    "name_amharic": "ዘማሪ ዲያቆን ፊልሞን የዕብዮ",
    "sort_order": 1150,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-zeriadawit-enidalikachew",
    "name": "Zemari Diyakon Zeriadawit Enidalikachew",
    "name_amharic": "ዘማሪ ዲያቆን ዘርዓዳዊት እንዳልካቸው",
    "sort_order": 1160,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-fisiha-zeleke",
    "name": "Zemari Fisiha Zeleke",
    "name_amharic": "ዘማሪ ፍስሃ ዘለቀ",
    "sort_order": 1170,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-aritisit-meseret-mebirate",
    "name": "Zemarit Aritisit Meseret Mebirate",
    "name_amharic": "ዘማሪት አርቲስት መሰረት መብራቴ",
    "sort_order": 1180,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-tsige-asiteriaye",
    "name": "Zemari Diyakon Tsige Asiteriaye",
    "name_amharic": "ዘማሪ ዲያቆን ፅጌ አስተርዐየ",
    "sort_order": 1190,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-esubalewu-alemu",
    "name": "Zemari Diyakon Esubalewu Alemu",
    "name_amharic": "ዘማሪ ዲያቆን እሱባለዉ አለሙ",
    "sort_order": 1200,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "like-siyuman-tsige-asiteraye",
    "name": "Like Siyuman Tsige Asiteraye",
    "name_amharic": "ሊቀ ስዩማን ፅጌ አስተራየ",
    "sort_order": 1210,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-senayit-demise",
    "name": "Zemarit Senayit Demise",
    "name_amharic": "ዘማሪት ሰናይት ደምሴ",
    "sort_order": 1220,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-enikusilase-gosa",
    "name": "Zemarit Enikusilase Gosa",
    "name_amharic": "ዘማሪት ዕንቁሥላሴ ጎሳ",
    "sort_order": 1230,
    "mezmur_count": 11,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-betelihem-bizuayehu",
    "name": "Zemarit Betelihem Bizuayehu",
    "name_amharic": "ዘማሪት ቤተልሄም ብዙአየሁ",
    "sort_order": 1240,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-enigidu-wenidimu",
    "name": "Zemari Diyakon Enigidu Wenidimu",
    "name_amharic": "ዘማሪ ዲያቆን እንግዱ ወንድሙ",
    "sort_order": 1250,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-winita-atsibiha",
    "name": "Zemarit Winita Atsibiha",
    "name_amharic": "ዘማሪት ዊንታ አጽብሐ",
    "sort_order": 1260,
    "mezmur_count": 15,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-selomon-abubeker",
    "name": "Zemari Selomon Abubeker",
    "name_amharic": "ዘማሪ ሰሎሞን አቡበከር",
    "sort_order": 1270,
    "mezmur_count": 71,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "diyakon-kesate-birihan-ge-iyesus",
    "name": "Diyakon Kesate Birihan Ge/iyesus",
    "name_amharic": "ዲያቆን ከሣቴ ብርሃን ገ/ኢየሱስ",
    "sort_order": 1280,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "diyakon-seboka-gudeta",
    "name": "Diyakon Seboka Gudeta",
    "name_amharic": "ዲያቆን ሰቦቃ ጉደታ",
    "sort_order": 1290,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-helidana-debebe",
    "name": "Zemarit Helidana Debebe",
    "name_amharic": "ዘማሪት ሄልዳና ደበበ",
    "sort_order": 1300,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-abel-yibabe",
    "name": "Zemari Diyakon Abel Yibabe",
    "name_amharic": "ዘማሪ ዲያቆን ኣቤል ይባቤ",
    "sort_order": 1310,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-robel-matiyas",
    "name": "Zemari Diyakon Robel Matiyas",
    "name_amharic": "ዘማሪ ዲያቆን ሮቤል ማትያስ",
    "sort_order": 1320,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-awet-mesifin",
    "name": "Zemari Awet Mesifin",
    "name_amharic": "ዘማሪ ዓወት መስፍን",
    "sort_order": 1330,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-meron-selomon",
    "name": "Zemari Meron Selomon",
    "name_amharic": "ዘማሪ ሜሮን ሰሎሞን",
    "sort_order": 1340,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-saron-yohanis",
    "name": "Zemarit Saron Yohanis",
    "name_amharic": "ዘማሪት ሳሮን ዮሃንስ",
    "sort_order": 1350,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-hana-adihanom",
    "name": "Zemarit Hana Adihanom",
    "name_amharic": "ዘማሪት ሃና ኣድሃኖም",
    "sort_order": 1360,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-hayilu-menigisite",
    "name": "Zemari Diyakon Hayilu Menigisite",
    "name_amharic": "ዘማሪ ዲያቆን ሀይሉ መንግስቴ",
    "sort_order": 1370,
    "mezmur_count": 6,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-filimona-gebiru",
    "name": "Zemari Diyakon Filimona Gebiru",
    "name_amharic": "ዘማሪ ዲያቆን ፊልሞና ገብሩ",
    "sort_order": 1380,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-mariyamawit-samison",
    "name": "Zemarit Mariyamawit Samison",
    "name_amharic": "ዘማሪት ማርያማዊት ሳምሶን",
    "sort_order": 1390,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "memihir-erimiyas-hayilay",
    "name": "Memihir Erimiyas Hayilay",
    "name_amharic": "መምህር ኤርምያስ ኃይላይ",
    "sort_order": 1400,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-sanidiro-girimay",
    "name": "Zemari Sanidiro Girimay",
    "name_amharic": "ዘማሪ ሳንድሮ ግርማይ",
    "sort_order": 1410,
    "mezmur_count": 8,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-kibirom-beriha",
    "name": "Zemari Kibirom Beriha",
    "name_amharic": "ዘማሪ ክብሮም በርሀ",
    "sort_order": 1420,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-kidist-taye",
    "name": "Zemarit Kidist Taye",
    "name_amharic": "",
    "sort_order": 1430,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "f-taa-dn-kaaleb-geetaachootiin",
    "name": "F/taa Dn Kaaleb Geetaachootiin",
    "name_amharic": "",
    "sort_order": 1440,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-dawit-asifahale",
    "name": "Zemari Dawit Asifahale",
    "name_amharic": "ዘማሪ ዳዊት አስፋሃለ",
    "sort_order": 1450,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-muluken-kebede",
    "name": "Zemari Diyakon Muluken Kebede",
    "name_amharic": "ዘማሪ ዲያቆን ሙሉቀን ከበደ",
    "sort_order": 1460,
    "mezmur_count": 11,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-betelihem-birihane",
    "name": "Zemarit Betelihem Birihane",
    "name_amharic": "ዘማሪት ቤተልሔም ብርሃነ",
    "sort_order": 1470,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-lidet-birihanu",
    "name": "Zemarit Lidet Birihanu",
    "name_amharic": "ዘማሪት ልደት ብርሃኑ",
    "sort_order": 1480,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-kasahun-welide",
    "name": "Zemari Diyakon Kasahun Welide",
    "name_amharic": "ዘማሪ ዲያቆን ካሳሁን ወልዴ",
    "sort_order": 1490,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-natinael-samuel",
    "name": "Zemari Diyakon Natinael Samuel",
    "name_amharic": "ዘማሪ ዲያቆን ናትናኤል ሣሙኤል",
    "sort_order": 1500,
    "mezmur_count": 6,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "kesis-dawit-fanitaye",
    "name": "Kesis Dawit Fanitaye",
    "name_amharic": "ቀሲስ ዳዊት ፋንታዬ",
    "sort_order": 1510,
    "mezmur_count": 9,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-yohanis-mohamed",
    "name": "Zemari Yohanis Mohamed",
    "name_amharic": "ዘማሪ ዮሃንስ ሞሃመድ",
    "sort_order": 1520,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-adis-mesifin",
    "name": "Zemari Adis Mesifin",
    "name_amharic": "ዘማሪ አዲስ መስፍን",
    "sort_order": 1530,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-enidalikachew-dagnew",
    "name": "Zemari Diyakon Enidalikachew Dagnew",
    "name_amharic": "ዘማሪ ዲያቆን እንዳልካቸው ዳኘው",
    "sort_order": 1540,
    "mezmur_count": 7,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-rufitalem-tsigab",
    "name": "Zemarit Rufitalem Tsigab",
    "name_amharic": "ዘማሪት ሩፍታሌም ጽጋብ",
    "sort_order": 1550,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-hitsan-lulibahiri-fisehaye",
    "name": "Zemarit Hitsan Lulibahiri Fisehaye",
    "name_amharic": "ዘማሪት ህጻን ሉልባሕሪ ፍሰሃየ",
    "sort_order": 1560,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-heaven-desalegn",
    "name": "Zemarit Heaven Desalegn",
    "name_amharic": "",
    "sort_order": 1570,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-berisi-selam",
    "name": "Zemarit Berisi Selam",
    "name_amharic": "ዘማሪት ቤርሲ ሠላም",
    "sort_order": 1580,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "deacon-noah-fisseha",
    "name": "Deacon Noah Fisseha",
    "name_amharic": "",
    "sort_order": 1590,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-efirem-asefa",
    "name": "Zemari Efirem Asefa",
    "name_amharic": "ዘማሪ ኤፍሬም አሰፋ",
    "sort_order": 1600,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-kidisit-tesema",
    "name": "Zemarit Kidisit Tesema",
    "name_amharic": "ዘማሪት ቅድስት ተሰማ",
    "sort_order": 1610,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-banichiayehu-seyifu",
    "name": "Zemarit Banichiayehu Seyifu",
    "name_amharic": "ዘማሪት ባንቺአየሁ ሰይፉ",
    "sort_order": 1620,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-benyam-muluneh",
    "name": "Zemari Benyam Muluneh",
    "name_amharic": "",
    "sort_order": 1630,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-birihanu-terefe",
    "name": "Zemari Birihanu Terefe",
    "name_amharic": "ዘማሪ ብርሃኑ ተረፈ",
    "sort_order": 1640,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-yohana-kifile",
    "name": "Zemarit Yohana Kifile",
    "name_amharic": "ዘማሪት ዮሃና ክፍለ",
    "sort_order": 1650,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-mekidelawit-nigatu",
    "name": "Zemarit Mekidelawit Nigatu",
    "name_amharic": "ዘማሪት መቅደላዊት ንጋቱ",
    "sort_order": 1660,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-meri-alem",
    "name": "Zemarit Meri Alem",
    "name_amharic": "ዘማሪት ሜሪ ኣለም",
    "sort_order": 1670,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-erimiyas-girima",
    "name": "Zemari Diyakon Erimiyas Girima",
    "name_amharic": "ዘማሪ ዲያቆን ኤርሚያስ ግርማ",
    "sort_order": 1680,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-dokiter-helen-tesifaye",
    "name": "Zemarit Dokiter Helen Tesifaye",
    "name_amharic": "ዘማሪት ዶክተር ሄለን ተስፋዬ",
    "sort_order": 1690,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-liuliseged-getachew",
    "name": "Zemari Diyakon Liuliseged Getachew",
    "name_amharic": "ዘማሪ ዲያቆን ልዑልሰገድ ጌታቸው",
    "sort_order": 1700,
    "mezmur_count": 19,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-kesis-wenidiwesen-bekele",
    "name": "Zemari Kesis Wenidiwesen Bekele",
    "name_amharic": "ዘማሪ ቀሲስ ወንድወሰን በቀለ",
    "sort_order": 1710,
    "mezmur_count": 8,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-yisihak-negasi",
    "name": "Zemari Diyakon Yisihak Negasi",
    "name_amharic": "ዘማሪ ዲያቆን ይስሓቅ ነጋሲ",
    "sort_order": 1720,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-sara-tadese",
    "name": "Zemarit Sara Tadese",
    "name_amharic": "ዘማሪት ሳራ ታደሰ",
    "sort_order": 1730,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-mikael-zebire",
    "name": "Zemari Mikael Zebire",
    "name_amharic": "ዘማሪ ሚካኤል ዘብሬ",
    "sort_order": 1740,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-hewan-gebiremariyam",
    "name": "Zemarit Hewan Gebiremariyam",
    "name_amharic": "ዘማሪት ሄዋን ገብረማርያም",
    "sort_order": 1750,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-etsubidinik-sisay",
    "name": "Zemarit Etsubidinik Sisay",
    "name_amharic": "ዘማሪት እጹብድንቅ ሲሳይ",
    "sort_order": 1760,
    "mezmur_count": 3,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-mikiyas-tsegaye",
    "name": "Zemari Mikiyas Tsegaye",
    "name_amharic": "ዘማሪ ሚኪያስ ፀጋዬ",
    "sort_order": 1770,
    "mezmur_count": 4,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-mekilit-iyob",
    "name": "Zemarit Mekilit Iyob",
    "name_amharic": "ዘማሪት መክሊት ኢዮብ",
    "sort_order": 1780,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-tsiyon-alemiseged",
    "name": "Zemarit Tsiyon Alemiseged",
    "name_amharic": "ዘማሪት ጽዮን ዓለምሰገድ",
    "sort_order": 1790,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-meri-temeliso",
    "name": "Zemarit Meri Temeliso",
    "name_amharic": "ዘማሪት ሜሪ ተመልሶ",
    "sort_order": 1800,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-ariyam-asimerom",
    "name": "Zemarit Ariyam Asimerom",
    "name_amharic": "ዘማሪት ኣርያም አስመሮም",
    "sort_order": 1810,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemarit-delina-hayile",
    "name": "Zemarit Delina Hayile",
    "name_amharic": "ዘማሪት ደሊና ሃይለ",
    "sort_order": 1820,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-yonas-menicho",
    "name": "Zemari Diyakon Yonas Menicho",
    "name_amharic": "ዘማሪ ዲያቆን ዮናስ መንቾ",
    "sort_order": 1830,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-asimamaw",
    "name": "Zemari Diyakon Asimamaw",
    "name_amharic": "ዘማሪ ዲያቆን አስማማው",
    "sort_order": 1840,
    "mezmur_count": 1,
    "mezmurs_with_lyrics_count": 1
  },
  {
    "slug": "zemari-diyakon-misigina-beyene",
    "name": "Zemari Diyakon Misigina Beyene",
    "name_amharic": "ዘማሪ ዲያቆን ምስግና በየነ",
    "sort_order": 1850,
    "mezmur_count": 2,
    "mezmurs_with_lyrics_count": 1
  }
]

const SLUG_PATTERN = /^[a-z0-9]+(?:-[a-z0-9]+)*$/
const ETHIOPIC_PATTERN = /\p{Script=Ethiopic}/u
const IDENTITY_STOP_WORDS = new Set([
  'zemari', 'zemarit', 'diyakon', 'deacon', 'kesis', 'like', 'mezemiran', 'sister', 'sisiter',
])

function normalizedIdentity(value: string): string {
  return value
    .normalize('NFKD')
    .toLowerCase()
    .replace(/\p{Mark}/gu, '')
    .replace(/[^\p{Letter}\p{Number}]+/gu, ' ')
    .trim()
    .split(/\s+/)
    .filter((part) => part && !IDENTITY_STOP_WORDS.has(part))
    .join(' ')
}

function bigrams(value: string): Set<string> {
  const compact = value.replace(/\s+/g, ' ')
  if (compact.length < 2) return new Set(compact ? [compact] : [])
  return new Set(Array.from({ length: compact.length - 1 }, (_, index) => compact.slice(index, index + 2)))
}

export function zemariNameSimilarity(left: string, right: string): number {
  const a = bigrams(normalizedIdentity(left))
  const b = bigrams(normalizedIdentity(right))
  if (!a.size || !b.size) return 0
  let overlap = 0
  for (const pair of a) if (b.has(pair)) overlap += 1
  return (2 * overlap) / (a.size + b.size)
}

function displayMatch(row: Pick<ZemariRow, 'name' | 'name_amharic' | 'slug'>): string {
  return `${row.name}${row.name_amharic ? ` / ${row.name_amharic}` : ''} (${row.slug})`
}

export function validateStagedZemariRows(
  rows: StagedZemariCsvRow[],
  existingZemaris: ZemariRow[] = [],
): StagedZemariCsvRow[] {
  const existingSlugs = new Set(existingZemaris.map((z) => z.slug.trim().toLowerCase()))
  const existingNames = new Set(existingZemaris.map((z) => z.name.trim().toLowerCase()))
  const existingAmharic = new Set(
    existingZemaris.map((z) => (z.name_amharic || '').trim()).filter(Boolean),
  )

  const seenSlugs = new Set<string>()
  const seenNames = new Set<string>()
  const seenAmharic = new Set<string>()

  return rows.map((row, rowIndex) => {
    const slug = slugifyZemari(row.slug || row.name)
    const name = row.name.trim()
    const amharic = row.name_amharic.trim()
    const sourceStatus = row.source_status.trim().toLowerCase()
    const normalizedName = normalizedIdentity(name)

    const alreadyExists = row.importState === 'imported' ||
      (Boolean(slug) && existingSlugs.has(slug.toLowerCase())) ||
      (Boolean(name) && existingNames.has(name.toLowerCase())) ||
      (Boolean(amharic) && existingAmharic.has(amharic))

    const duplicateInBatch =
      (Boolean(slug) && seenSlugs.has(slug.toLowerCase())) ||
      (Boolean(normalizedName) && seenNames.has(normalizedName)) ||
      (Boolean(amharic) && seenAmharic.has(amharic))
    if (slug) seenSlugs.add(slug.toLowerCase())
    if (normalizedName) seenNames.add(normalizedName)
    if (amharic) seenAmharic.add(amharic)

    const duplicateMatches = new Set<string>()
    const candidates = [
      ...existingZemaris,
      ...rows.slice(0, rowIndex).map((candidate) => ({
        name: candidate.name,
        name_amharic: candidate.name_amharic,
        slug: candidate.slug,
      })),
    ]
    for (const candidate of candidates) {
      const sameExactIdentity =
        candidate.slug.trim().toLowerCase() === slug.toLowerCase() ||
        normalizedIdentity(candidate.name) === normalizedName ||
        (Boolean(amharic) && candidate.name_amharic?.trim() === amharic)
      if (sameExactIdentity) continue
      const latinSimilarity = zemariNameSimilarity(name, candidate.name)
      const amharicSimilarity = amharic && candidate.name_amharic
        ? zemariNameSimilarity(amharic, candidate.name_amharic)
        : 0
      if (latinSimilarity >= 0.86 || amharicSimilarity >= 0.88) {
        duplicateMatches.add(displayMatch(candidate))
      }
    }

    const reviewWarnings: string[] = []
    if (!amharic) reviewWarnings.push('Amharic name is missing; confirm the identity manually.')
    else if (!ETHIOPIC_PATTERN.test(amharic) || amharic.includes('\uFFFD')) {
      reviewWarnings.push('Amharic name does not contain valid Ethiopic Unicode text.')
    }
    const existingByName = existingZemaris.find(
      (candidate) => normalizedIdentity(candidate.name) === normalizedName,
    )
    if (
      existingByName?.name_amharic &&
      amharic &&
      existingByName.name_amharic.trim() !== amharic
    ) {
      reviewWarnings.push(
        `Transliterated name matches an existing profile, but the Amharic name differs: ${displayMatch(existingByName)}.`,
      )
    }
    if (duplicateMatches.size) {
      reviewWarnings.push('Possible spelling duplicate; review before importing.')
    }

    let validationError: string | null = null
    if (!name) validationError = 'Name is required.'
    else if (!slug || !SLUG_PATTERN.test(slug)) validationError = 'Valid lowercase ASCII slug is required.'
    else if (sourceStatus && !['draft', 'published', 'archived'].includes(sourceStatus)) {
      validationError = `Invalid source status "${row.source_status}".`
    }
    else if (duplicateInBatch) validationError = `Duplicate slug "${slug}" in batch.`

    const potentialDuplicate = duplicateMatches.size > 0
    const canSelect =
      !alreadyExists && !validationError && !potentialDuplicate && reviewWarnings.length === 0

    return {
      ...row,
      slug,
      alreadyExists,
      duplicateInBatch,
      potentialDuplicate,
      duplicateMatches: [...duplicateMatches].slice(0, 3),
      reviewWarnings,
      validationError,
      selected: canSelect ? row.selected : false,
    }
  })
}

export function buildStagedZemarisFromCsvText(
  csvText: string,
  existingZemaris: ZemariRow[] = [],
): StagedZemariCsvRow[] {
  const { rows } = parseCsvText(csvText)
  const initial: StagedZemariCsvRow[] = rows.map((raw, idx) => {
    const name = (raw.name || raw.transliteration_name || raw.zemari || '').trim()
    const name_amharic = (raw.name_amharic || raw.amharic_name || '').trim()
    const slug = slugifyZemari(raw.slug || name || `zemari-${idx + 1}`)
    return {
      rowNumber: idx + 1,
      stagingId: `z-row-${idx + 1}`,
      slug,
      name: name || name_amharic,
      name_amharic,
      bio: (raw.bio || '').trim(),
      bio_amharic: (raw.bio_amharic || '').trim(),
      youtube_url: (raw.youtube_url || '').trim(),
      website_url: (raw.website_url || '').trim(),
      source_status: (raw.status || '').trim(),
      sort_order: Number.parseInt(raw.sort_order || '', 10) || (idx + 1) * 10,
      mezmur_count: Number.parseInt(raw.mezmur_count || '0', 10) || 0,
      mezmurs_with_lyrics_count: Number.parseInt(raw.mezmurs_with_lyrics_count || '0', 10) || 0,
      selected: true,
      alreadyExists: false,
      duplicateInBatch: false,
      potentialDuplicate: false,
      duplicateMatches: [],
      reviewWarnings: [],
      validationError: null,
      importState: 'pending',
      importError: null,
    }
  })
  return validateStagedZemariRows(initial, existingZemaris)
}

export function buildPresetStagedZemarisWithLyrics(
  existingZemaris: ZemariRow[] = [],
): StagedZemariCsvRow[] {
  const initial: StagedZemariCsvRow[] = PRESET_ZEMARIS_WITH_LYRICS.map((item, idx) => ({
    rowNumber: idx + 1,
    stagingId: `z-preset-${idx + 1}`,
    slug: item.slug,
    name: item.name,
    name_amharic: item.name_amharic,
    bio: '',
    bio_amharic: '',
    youtube_url: '',
    website_url: '',
    source_status: 'draft',
    sort_order: item.sort_order,
    mezmur_count: item.mezmur_count,
    mezmurs_with_lyrics_count: item.mezmurs_with_lyrics_count,
    selected: true,
    alreadyExists: false,
    duplicateInBatch: false,
    potentialDuplicate: false,
    duplicateMatches: [],
    reviewWarnings: [],
    validationError: null,
    importState: 'pending',
    importError: null,
  }))
  return validateStagedZemariRows(initial, existingZemaris)
}

export type ZemariImportDryRunSummary = {
  total: number
  valid: number
  alreadyInDatabase: number
  potentialDuplicates: number
  invalid: number
  manualReview: number
  ready: number
  targetStatus: 'draft' | 'published'
}

export function summarizeZemariImportDryRun(
  rows: StagedZemariCsvRow[],
  targetStatus: 'draft' | 'published',
): ZemariImportDryRunSummary {
  return {
    total: rows.length,
    valid: rows.filter((row) => !row.validationError).length,
    alreadyInDatabase: rows.filter((row) => row.alreadyExists).length,
    potentialDuplicates: rows.filter((row) => row.potentialDuplicate).length,
    invalid: rows.filter((row) => Boolean(row.validationError)).length,
    manualReview: rows.filter((row) => row.reviewWarnings.length > 0).length,
    ready: rows.filter(
      (row) =>
        !row.alreadyExists &&
        !row.potentialDuplicate &&
        !row.validationError &&
        row.reviewWarnings.length === 0,
    ).length,
    targetStatus,
  }
}

export type ZemariImportOutcome = {
  imported: string[]
  skipped: { name: string; reason: string }[]
  failed: { name: string; slug: string; error: string }[]
  cancelled: boolean
}

function retryableImportError(message: string): boolean {
  return /429|rate limit|timeout|timed out|network|failed to fetch|\b50[0234]\b/i.test(message)
}

function waitForRetry(milliseconds: number, signal?: AbortSignal): Promise<void> {
  return new Promise((resolve, reject) => {
    if (signal?.aborted) {
      reject(new DOMException('Import cancelled.', 'AbortError'))
      return
    }
    const timer = setTimeout(resolve, milliseconds)
    signal?.addEventListener('abort', () => {
      clearTimeout(timer)
      reject(new DOMException('Import cancelled.', 'AbortError'))
    }, { once: true })
  })
}

export async function importSelectedStagedZemaris(
  rowsToImport: StagedZemariCsvRow[],
  options: {
    targetStatus: 'draft' | 'published'
    signal?: AbortSignal
    maxRetries?: number
    findExisting?: (slug: string) => Promise<Pick<ZemariRow, 'slug'> | null>
    save?: typeof saveZemari
    onProgress?: (
      completed: number,
      total: number,
      currentName: string,
      state: ZemariImportRowState,
      row: StagedZemariCsvRow,
    ) => void
  },
): Promise<ZemariImportOutcome> {
  const imported: string[] = []
  const skipped: { name: string; reason: string }[] = []
  const failed: { name: string; slug: string; error: string }[] = []
  const maxRetries = Math.max(0, options.maxRetries ?? 2)
  const findExisting = options.findExisting || findZemariBySlug
  const save = options.save || saveZemari

  for (let i = 0; i < rowsToImport.length; i += 1) {
    const row = rowsToImport[i]
    if (options.signal?.aborted) {
      return { imported, skipped, failed, cancelled: true }
    }
    options.onProgress?.(i, rowsToImport.length, row.name, 'importing', row)
    if (row.alreadyExists || row.potentialDuplicate || row.validationError) {
      const reason = row.alreadyExists
        ? 'Already in database.'
        : row.potentialDuplicate
          ? 'Potential duplicate requires review.'
          : row.validationError || 'Not ready.'
      skipped.push({ name: row.name || row.slug, reason })
      options.onProgress?.(i + 1, rowsToImport.length, row.name, 'skipped', row)
      continue
    }

    let lastError = ''
    for (let attempt = 0; attempt <= maxRetries; attempt += 1) {
      try {
        const existing = await findExisting(row.slug)
        if (existing) {
          skipped.push({ name: row.name || row.slug, reason: 'Slug already exists in database.' })
          options.onProgress?.(i + 1, rowsToImport.length, row.name, 'skipped', row)
          lastError = ''
          break
        }
        const saved = await save({
          name: row.name.trim(),
          name_amharic: row.name_amharic.trim() || null,
          slug: row.slug.trim(),
          bio: row.bio.trim() || null,
          bio_amharic: row.bio_amharic.trim() || null,
          image_alt: row.name.trim(),
          youtube_url: row.youtube_url.trim() || null,
          website_url: row.website_url.trim() || null,
          sort_order: row.sort_order,
          is_featured: false,
          status: options.targetStatus,
        })
        imported.push(saved.slug)
        options.onProgress?.(i + 1, rowsToImport.length, row.name, 'imported', row)
        lastError = ''
        break
      } catch (err) {
        if (err instanceof DOMException && err.name === 'AbortError') {
          return { imported, skipped, failed, cancelled: true }
        }
        lastError = err instanceof Error ? err.message : String(err)
        if (attempt >= maxRetries || !retryableImportError(lastError)) break
        await waitForRetry(300 * 2 ** attempt, options.signal)
      }
    }
    if (lastError) {
      failed.push({ name: row.name || row.slug, slug: row.slug, error: lastError })
      options.onProgress?.(i + 1, rowsToImport.length, row.name, 'failed', row)
    }
  }

  return { imported, skipped, failed, cancelled: false }
}
