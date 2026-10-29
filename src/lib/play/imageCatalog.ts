/**
 * Verified picture catalogue for Tewahedo Play.
 *
 * Every image here is an existing site asset in /public/images/calendar-web
 * (web derivatives of archive/media/calendar-png). An image is included only
 * when all three agree:
 *   1. its file name,
 *   2. the site's own calendar art mapping (src/content/calendarImageManifest.ts /
 *      nextObservancesArtPool.ts: calendar event id → image), and
 *   3. a visual check of the artwork (2026-10-29 audit).
 * Ambiguous artwork (e.g. LidetaMaryam, Gizret, DagmawiTensia, the Western-style
 * SaintMaryCommemoration) is deliberately left out of gameplay.
 *
 * Answers use the calendar's titles; explanations quote the calendar's own
 * published summary. Where the scene is biblical, the source is the Bible
 * passage on this site; otherwise it is the TewahedoDaily calendar.
 */
import type { LocalizedText, SourceReference } from './types'

export type PlayImageKind = 'feast' | 'saint' | 'angel'

export type PlayImage = {
  id: string
  kind: PlayImageKind
  /** Public path of the existing asset. */
  src: string
  width: number
  height: number
  /** CSS object-position keeping the subject in frame when cropped. */
  focus?: string
  /** Visible answer. English from the calendar; Amharic is the calendar title. */
  answer: LocalizedText
  /** Short alternative name (transliteration) shown under the answer. */
  alt: string
  /** Calendar summary (quoted), shown after answering. */
  explanation: LocalizedText
  /** Calendar date as listed in the calendar data, when it has one. */
  when?: string
  source: SourceReference
  /** Accessible description of the artwork (what is visible, not the answer). */
  description: string
}

const img = (file: string) => encodeURI(`/images/calendar-web/${file}.webp`)
const bible = (label: string, route: string): SourceReference => ({ label, route, kind: 'bible' })
const calendar = (label: string): SourceReference => ({ label: `TewahedoDaily Calendar — ${label}`, route: '/calendar', kind: 'calendar' })

export const PLAY_IMAGES: PlayImage[] = [
  // ---- Feasts (calendar event id in brackets) ----
  { id: 'gena', kind: 'feast', src: img('Gena'), width: 1196, height: 896, answer: { en: 'Gena — the Nativity of Christ', am: 'ልደት (ገና)' }, alt: 'Lidet / Gena', explanation: { en: 'Celebrates the birth of Christ in the flesh.' }, when: 'Tahsas 29', source: bible('Luke 2:7', '/bible/luke/2'), description: 'A cave stable: the Child with His Mother, kings bringing gifts, angels above, sheep, an ox and a camel.' }, // [lidet-gena]
  { id: 'timket', kind: 'feast', src: img('Timket'), width: 1200, height: 675, answer: { en: 'Timket — the Baptism of Christ', am: 'ጥምቀት' }, alt: 'Timket / Epiphany', explanation: { en: 'Celebrates the baptism of Christ and the revelation of the Holy Trinity.' }, when: 'Ter 11', source: bible('Matthew 3:16–17', '/bible/matthew/3'), description: 'A crowd in white gathered at night around a large pool of water lit by candles.' }, // [timket]
  { id: 'kana', kind: 'feast', src: img('KanaZeGalilee'), width: 900, height: 900, answer: { en: 'Kana Ze Galilee — the Wedding at Cana', am: 'ቃና ዘገሊላ' }, alt: 'Kana Ze Galilee', explanation: { en: 'Commemorates Christ’s first public miracle at Cana of Galilee.' }, when: 'Ter 12', source: bible('John 2:1–11', '/bible/john/2'), description: 'Christ speaks to servants pouring water from clay jars, with His Mother beside Him and a crowned couple seated.' }, // [kana-ze-galilee]
  { id: 'hosanna', kind: 'feast', src: img('Hosanna'), width: 1200, height: 676, answer: { en: 'Hosanna — Palm Sunday', am: 'ሆሣዕና' }, alt: 'Hosanna', explanation: { en: 'Commemorates Christ’s triumphant entry into Jerusalem.' }, source: bible('Matthew 21:8–9', '/bible/matthew/21'), description: 'Christ rides through a city gate while people wave palm branches and lay them on the road.' }, // [hosanna]
  { id: 'siqlet', kind: 'feast', src: img('Siqlet'), width: 736, height: 900, focus: 'center 30%', answer: { en: 'Siklet — Good Friday', am: 'ስቅለት' }, alt: 'Siklet', explanation: { en: 'Commemorates the crucifixion and saving passion of Christ.' }, source: bible('John 19:25–27', '/bible/john/19'), description: 'Christ on the Cross, with His Mother and a disciple standing beside it.' }, // [good-friday]
  { id: 'fasika', kind: 'feast', src: img('Fasika'), width: 909, height: 900, answer: { en: 'Fasika — the Resurrection', am: 'ፋሲካ' }, alt: 'Fasika / Tinsae', explanation: { en: 'Celebrates the resurrection of Christ and His victory over death.' }, source: bible('Matthew 28:5–6', '/bible/matthew/28'), description: 'Christ in white robes steps out of a rock tomb into bright light.' }, // [fasika]
  { id: 'erget', kind: 'feast', src: img('Erget'), width: 721, height: 900, focus: 'center 25%', answer: { en: 'Erget — the Ascension', am: 'ዕርገት' }, alt: 'Erget', explanation: { en: 'Commemorates Christ’s ascension into heaven.' }, source: bible('Acts 1:9', '/bible/acts/1'), description: 'Christ rises above clouds and angels with raised hands while people below look up.' }, // [ascension]
  { id: 'peraklitos', kind: 'feast', src: img('Peraklitos'), width: 636, height: 900, focus: 'center 30%', answer: { en: 'Peraklitos — Pentecost', am: 'ጰራቅሊጦስ' }, alt: 'Paracletos', explanation: { en: 'Celebrates the descent of the Holy Spirit upon the Apostles.' }, source: bible('Acts 2:1–4', '/bible/acts/2'), description: 'A gathering of robed figures around a seated woman in blue, with a dove shining above them.' }, // [pentecost]
  { id: 'debre-tabor', kind: 'feast', src: img('DebreTabor'), width: 591, height: 900, focus: 'center 20%', answer: { en: 'Debre Tabor — the Transfiguration', am: 'ደብረ ታቦር' }, alt: 'Debre Tabor', explanation: { en: 'Celebrates the revelation of Christ’s glory on Mount Tabor.' }, when: 'Nehase 13', source: bible('Matthew 17:1–3', '/bible/matthew/17'), description: 'Christ in shining white on a mountain between two figures, with three disciples fallen below.' }, // [debre-tabor]
  { id: 'tsinset', kind: 'feast', src: img('Tsinset'), width: 651, height: 900, focus: 'center 30%', answer: { en: 'Tsinset — the Annunciation', am: 'ጽንሰት' }, alt: 'Tsinset', explanation: { en: 'Commemorates the Annunciation and the mystery of the Word taking flesh.' }, when: 'Megabit 29', source: bible('Luke 1:26–31', '/bible/luke/1'), description: 'An angel in pink greets a woman in a blue and orange robe while a dove descends from above.' }, // [tsinset-annunciation]
  { id: 'meskel', kind: 'feast', src: img('Meskel'), width: 1200, height: 600, answer: { en: 'Meskel — the Finding of the True Cross', am: 'መስቀል' }, alt: 'Meskel', explanation: { en: 'Commemorates the finding of the True Cross and the victory of Christ through the Cross.' }, when: 'Meskerem 17', source: calendar('Meskel'), description: 'A vast crowd in white surrounds a tall decorated bonfire structure topped with a cross.' }, // [meskel-finding-of-the-true-cross]
  { id: 'tsige', kind: 'feast', src: img('TsigeSeason'), width: 721, height: 900, focus: 'center 35%', answer: { en: 'Zemene Tsige — the Season of Flowers', am: 'ዘመነ ጽጌ' }, alt: 'Zemene Tsigie', explanation: { en: 'A sacred season associated with the Flight to Egypt and the flowering of the land.' }, source: calendar('Zemene Tsige'), description: 'A mother and child ride a donkey through a desert path, guided by an elder with an angel above.' }, // [zemene-tsige]

  // ---- Angels ----
  { id: 'michael', kind: 'angel', src: img('SaintMichaelFeast'), width: 651, height: 900, focus: 'center 25%', answer: { en: 'Kidus Mikael — Archangel Michael', am: 'ቅዱስ ሚካኤል' }, alt: 'Kidus Mikael', explanation: { en: 'Major annual commemoration of Archangel Michael, protector and defender of the faithful.' }, when: 'Hedar 12', source: calendar('Archangel Michael'), description: 'A winged angel with a sword and a golden ark stands over a fallen figure on a rocky height.' }, // [saint-michael-major]
  { id: 'gabriel', kind: 'angel', src: img('SaintGabrielCommemoration'), width: 542, height: 900, focus: 'center 30%', answer: { en: 'Kidus Gebriel — Archangel Gabriel', am: 'ቅዱስ ገብርኤል' }, alt: 'Kidus Gebriel', explanation: { en: 'Major annual commemoration of Archangel Gabriel, bearer of glad tidings.' }, when: 'Tahsas 19', source: calendar('Archangel Gabriel'), description: 'A winged angel holding a cross and spear stands above three young men praying amid flames.' }, // [saint-gabriel-major]
  { id: 'raphael', kind: 'angel', src: img('ArchangelRaphael'), width: 575, height: 900, focus: 'center 30%', answer: { en: 'Kidus Rufael — Archangel Raphael', am: 'ቅዱስ ሩፋኤል' }, alt: 'Kidus Ruphael', explanation: { en: 'Commemoration of Archangel Raphael, associated with healing and guidance.' }, when: 'Pagumen 3', source: calendar('Archangel Raphael'), description: 'A winged angel with a spear stands upon a great fish in the waves.' }, // [saint-raphael-major]
  { id: 'uriel', kind: 'angel', src: img('ArchangelUriel'), width: 723, height: 900, focus: 'center 30%', answer: { en: 'Kidus Urael — Archangel Uriel', am: 'ቅዱስ ዑራኤል' }, alt: 'Kidus Urael', explanation: { en: 'Commemoration of Archangel Uriel, associated with light, wisdom, and divine service.' }, when: 'Ter 22', source: calendar('Archangel Uriel'), description: 'A winged angel offers a cup to a kneeling elder beside a tree and stream.' }, // [saint-uriel-major]

  // ---- Saints ----
  { id: 'giorgis', kind: 'saint', src: img('KidusGiorgis'), width: 774, height: 900, focus: 'center 30%', answer: { en: 'Kidus Giorgis — Saint George', am: 'ቅዱስ ጊዮርጊስ' }, alt: 'Kidus Giorgis', explanation: { en: 'Commemorates Saint Georgios, the victorious martyr and beloved intercessor.' }, when: 'Miazia 23', source: calendar('Saint Georgios'), description: 'A rider on a white horse pierces a dragon with a long cross-topped spear.' }, // [saint-george-major]
  { id: 'tekle-haymanot', kind: 'saint', src: img('AbuneTeklehaymanot'), width: 687, height: 900, focus: 'center 25%', answer: { en: 'Abune Tekle Haymanot', am: 'አቡነ ተክለ ሃይማኖት' }, alt: 'Abune Tekle Haymanot', explanation: { en: 'Commemorates Abune Tekle Haymanot, one of the greatest Ethiopian saints.' }, when: 'Tahsas 24', source: calendar('Abune Tekle Haymanot'), description: 'A bearded monastic saint with great wings holds a hand cross, with spears on either side of him.' }, // [saint-tekle-haymanot-major]
  { id: 'yared', kind: 'saint', src: img('SaintYared'), width: 1200, height: 900, answer: { en: 'Kidus Yared', am: 'ቅዱስ ያሬድ' }, alt: 'Saint Yared', explanation: { en: 'Commemorates Saint Yared, master of sacred chant and Ethiopian hymnography.' }, source: calendar('Saint Yared'), description: 'A saint in white with a prayer staff and sistrum leads chanters beside a drum, books and a stone stele.' }, // [saint-yared-major]
  { id: 'estifanos', kind: 'saint', src: img('SaintStephen'), width: 723, height: 900, focus: 'center 35%', answer: { en: 'Kidus Estifanos — Saint Stephen', am: 'ቅዱስ እስጢፋኖስ' }, alt: 'Kidus Estifanos', explanation: { en: 'Commemorates Kidus Estifanos, the first martyr of the Church.' }, when: 'Tir 17', source: bible('Acts 7:59–60', '/bible/acts/7'), description: 'A young deacon in red kneels in prayer under a beam of light as men raise stones.' }, // [saint-stephen-major]
  { id: 'yohannes', kind: 'saint', src: img('SaintJohntheBaptist'), width: 953, height: 900, answer: { en: 'Yohannes Metmiq — Saint John the Baptist', am: 'ዮሐንስ መጥምቅ' }, alt: 'Yohannes Met’miq', explanation: { en: 'Commemorates Saint John the Baptist, the forerunner of the Lord.' }, source: bible('Matthew 3:13–16', '/bible/matthew/3'), description: 'A man in a rough garment pours water over Christ in a river, with a dove above and angels holding a robe.' }, // [saint-john-the-baptist]
  { id: 'petros-pawlos', kind: 'saint', src: img('SaintsPeterandPaul'), width: 702, height: 900, focus: 'center 30%', answer: { en: 'Saints Peter and Paul', am: 'ቅዱሳን ጴጥሮስ እና ጳውሎስ' }, alt: 'Petros ena Pawlos', explanation: { en: 'Commemorates Saints Peter and Paul, pillars of apostolic witness.' }, when: 'Hamle 5', source: calendar('Saints Peter and Paul'), description: 'Two haloed apostles stand side by side, one holding a large cross, the other a book and a sword.' }, // [saint-peter-and-paul]
]

export const feastImages = () => PLAY_IMAGES.filter((i) => i.kind === 'feast')
export const holyPersonImages = () => PLAY_IMAGES.filter((i) => i.kind !== 'feast')
export const imageById = (id: string) => PLAY_IMAGES.find((i) => i.id === id)

/**
 * Card and hero artwork for each game. Every image is matched to what the game
 * is about (e.g. Saint Yared — father of Ethiopian chant — for the Mezmur game).
 */
export type PlayArt = { src: string; focus?: string; alt: LocalizedText }
const art = (file: string, en: string, am: string, focus?: string): PlayArt => ({ src: img(file), focus, alt: { en, am } })

export const GAME_ART: Record<string, PlayArt> = {
  trivia: art('TodayInChurch', 'A priest reads from a manuscript by candlelight', 'ካህን በሻማ ብርሃን መጽሐፍ ሲያነብ', 'center 40%'),
  emoji: art('KanaZeGalilee', 'Icon of the wedding at Cana', 'የቃና ዘገሊላ ሥዕል', 'center 40%'),
  'finish-the-verse': art('FeastDayPreparation', 'A priest reads from a large open book at a candlelit table', 'ካህን በሻማ ብርሃን ትልቅ መጽሐፍ ሲያነብ', 'center 40%'),
  'finish-the-mezmur': art('SaintYared', 'Icon of Saint Yared, father of sacred chant', 'የቅዱስ ያሬድ ሥዕል', 'center 35%'),
  history: art('EthiopianSaintsRemembrance', 'Clergy under ceremonial umbrellas in a rock-hewn church', 'ካህናት በዐለት ውቅር ቤተ ክርስቲያን', 'center 45%'),
  'who-am-i': art('SaintDavid', 'Icon of David playing the harp', 'ዳዊት በገና ሲደረድር', 'center 25%'),
  match: art('SaintJohntheBaptist', 'Icon of the baptism of Christ in the Jordan', 'የጌታ ጥምቀት ሥዕል', 'center 35%'),
  adventures: art('Hosanna', 'Painting of a crowd waving palm branches', 'የሆሣዕና ሥዕል', 'center 45%'),
  'game-night': art('JoyfulFeastSeason', 'A congregation celebrating with drums and candles', 'ምእመናን በከበሮና በሻማ ሲያከብሩ', 'center 40%'),
  feasts: art('Timket', 'Timket celebration around the water at night', 'የጥምቀት በዓል', 'center 50%'),
  saints: art('KidusGiorgis', 'Icon of Saint George on a white horse', 'የቅዱስ ጊዮርጊስ ሥዕል', 'center 30%'),
  'icon-memory': art('SacredCalendarContinuity', 'An illuminated icon of Christ surrounded by saints', 'በቅዱሳን የተከበበ የክርስቶስ ሥዕል', 'center 40%'),
  'faith-order': art('MonasticSaintsRemembrance', 'Monks reading in a candlelit church', 'መነኮሳት በሻማ ብርሃን ሲያነቡ', 'center 45%'),
}
