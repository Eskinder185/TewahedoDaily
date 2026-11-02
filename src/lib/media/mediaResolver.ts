import { resolveContentMediaUrl } from '../cms/contentMedia';
import type { CalendarCard } from '../synaxarium/synaxariumService';
import { isLocalAssetAvailable } from './localAssetAvailability';

export type MediaDomain =
  | 'calendar'
  | 'hymn-collection'
  | 'hymn-section'
  | 'zemari'
  | 'play'
  | 'fallback';

export type MediaMatchSource =
  | 'explicit-new-media'
  | 'verified-relationship'
  | 'exact-title'
  | 'verified-alias'
  | 'legacy-fallback'
  | 'none';

export interface VerifiedMediaEntry {
  /** Canonical subject/entry identifier */
  id: string;
  /** Storage path inside the `content-media` public bucket */
  storagePath: string;
  /** Domain scope (zemari portraits are strictly isolated to 'zemari') */
  domain: MediaDomain;
  /** Optional source_type from calendar_cards */
  sourceType?: string;
  /** Optional source_id from calendar_cards */
  sourceId?: string;
  /** Optional source_slug from calendar_cards / mezmur tables */
  sourceSlug?: string;
  /** Card or section slug */
  slug?: string;
  /** Original English title (preserved) */
  title: string;
  /** Original Amharic title (preserved) */
  titleAmharic?: string;
  /** Original alt text from media_assets */
  altText?: string;
  /** Original uploaded filename from media_assets */
  fileName?: string;
  /** Optional object-position CSS value */
  imagePosition?: string | null;
  /** Deterministic priority/timestamp for duplicate resolution (higher wins) */
  updatedAtMs?: number;
  /** Explicit verified aliases (English, Amharic, bilingual, liturgical) */
  aliases?: readonly string[];
  /** Explicit verified source IDs or slugs that map to this media entry */
  relatedIds?: readonly string[];
}

export interface MediaResolutionQuery {
  /** Content or entity ID (e.g. observance id, section slug, play image id) */
  id?: string | null;
  /** Content slug */
  slug?: string | null;
  /** Source type (e.g. 'observance', 'fast', 'season', 'monthly', 'zemari') */
  sourceType?: string | null;
  /** English or bilingual title */
  title?: string | null;
  /** Amharic title */
  titleAmharic?: string | null;
  /** Additional candidate titles or alt texts */
  altText?: string | null;
  /** Explicit storage path or URL already attached to the record */
  explicitPath?: string | null;
  /** Explicit fallback URL (e.g. legacy `/images/calendar-web/*.webp`) */
  legacyFallbackUrl?: string | null;
  /** Optional domain restriction (defaults to excluding 'zemari' unless 'zemari' is requested) */
  domain?: MediaDomain | 'any';
  /** Optional runtime calendar cards to include in resolution */
  cards?: readonly CalendarCard[] | null;
  /** Whether to allow legacy `/images/calendar-web/*` fallback when no new media matches */
  allowLegacyFallback?: boolean;
}

export interface MediaResolutionResult {
  hasImage: boolean;
  /** Resolved public URL (either Supabase `content-media` URL or legacy fallback) */
  imageUrl: string | null;
  /** Storage path in `content-media` if resolved from new uploaded media */
  storagePath: string | null;
  /** Preserved English title */
  title: string | null;
  /** Preserved Amharic title */
  titleAmharic: string | null;
  /** Optional CSS object-position */
  imagePosition: string | null;
  /** How the image was matched */
  matchSource: MediaMatchSource;
  /** Matched catalog entry ID if matched from verified catalog */
  matchedEntryId: string | null;
  /** Legacy fallback URL if available for `<img onError>` */
  fallbackUrl: string | null;
}

/**
 * Known mislabeled early uploads in `media_assets` where a file was uploaded with
 * a mismatched filename or replaced by a canonical upload for the same subject.
 * These paths are deprioritized / excluded from automatic title/filename matching
 * when canonical uploads exist.
 */
const DEPRIORITIZED_STORAGE_PATHS = new Set<string>([
  // Uploaded with file_name `ArchangelUriel.webp` under `annunciation` path; replaced by canonical `annunciation-4ff2109c-1790970788849.webp`
  'calendar/mary/annunciation-e695e78a-1790963029629.webp',
  // Uploaded with file_name `Kidus-Michael.webp` under `demera` path; replaced by canonical `demera-42d44792-1790968174923.webp`
  'calendar/cross/demera-1790953956789.webp',
]);

/**
 * Stored `image_path` values that answered HTTP 400 from the public `content-media` bucket in a read-only
 * audit (2026-11-01). Rows still carrying one of these are treated as having no usable image so a verified
 * catalog match can be used instead. The CMS rows themselves are not modified here.
 */
const KNOWN_MISSING_STORAGE_PATHS = new Set<string>([
  'calendar/christ/ketera-8266580b-1792011322259.webp',
  'hymns/zemaris/muhaze-sibihat-zemari-dagimawi-deribe-1793159399237.webp',
  'hymns/zemaris/yosph-1792789779639.webp',
]);

export function isKnownMissingStoragePath(path: string | null | undefined): boolean {
  return Boolean(path && KNOWN_MISSING_STORAGE_PATHS.has(path.trim()));
}

/**
 * Different storage paths proven byte-identical (same MD5) in the audit; they are one image, so two cards that
 * use them are not an "ambiguous" title match. Maps duplicate path -> canonical path.
 */
const IDENTICAL_UPLOAD_CANONICAL = new Map<string, string>([
  ['calendar/saints/yared-ginbot-58251eac-1792614254840.webp', 'calendar/general/yared-96548f68-1792449396141.webp'],
]);
const canonicalUploadPath = (path: string) => IDENTICAL_UPLOAD_CANONICAL.get(path) ?? path;

/**
 * Ethiopic homophone / orthographic variant normalization map.
 * Maps historically distinct Ge'ez/Amharic fidel series that are used interchangeably
 * in modern Amharic titles (ሐ/ኀ -> ሀ, ሠ -> ሰ, ዐ -> አ, ፀ -> ጸ, ዉ -> ው, ዪ -> ይ, 4th-order laryngeal ሃ/ሓ/ኃ/ዓ/ኣ -> ሀ/አ).
 * Note: This is used ONLY for internal comparison keys; original Amharic titles are always preserved.
 */
const ETHIOPIC_CANONICAL_CHAR_MAP: Record<string, string> = {
  // ሐ series -> ሀ series
  ሐ: 'ሀ', ሑ: 'ሁ', ሒ: 'ሂ', ሓ: 'ሀ', ሔ: 'ሄ', ሕ: 'ህ', ሖ: 'ሆ', ሗ: 'ኋ',
  // ኀ series -> ሀ series
  ኀ: 'ሀ', ኁ: 'ሁ', ኂ: 'ሂ', ኃ: 'ሀ', ኄ: 'ሄ', ኅ: 'ህ', ኆ: 'ሆ', ኋ: 'ኋ',
  // ሀ 4th order (ሃ) -> ሀ (handles ዮሐንስ/ዮሃንስ, ብርሃን/ብርሀን, መድኃኔ/መድሃኔ)
  ሃ: 'ሀ',
  // ሠ series -> ሰ series (handles ሥላሴ/ስላሴ, ትንሣኤ/ትንሳኤ, ሆሣዕና/ሆሳዕና, ብሥራተ/ብስራተ)
  ሠ: 'ሰ', ሡ: 'ሱ', ሢ: 'ሲ', ሣ: 'ሳ', ሤ: 'ሴ', ሥ: 'ስ', ሦ: 'ሶ', ሧ: 'ሷ',
  // ዐ series & ኣ -> አ series (handles ዓለም/አለም, ዐቢይ/አብይ, በዓለ/በአለ, ሆሣዕና/ሆሳእና)
  ዐ: 'አ', ዑ: 'ኡ', ዒ: 'ኢ', ዓ: 'አ', ዔ: 'ኤ', ዕ: 'እ', ዖ: 'ኦ',
  ኣ: 'አ',
  // ፀ series -> ጸ series (handles ፅንሰት/ጽንሰት, ፀሎተ/ጸሎተ, ፅዮን/ጽዮን, ፀደኒያ/ፀደንያ, ሕንፀተ/ሕንጸተ)
  ፀ: 'ጸ', ፁ: 'ጹ', ጺ: 'ጺ', ፃ: 'ጻ', ፄ: 'ጼ', ፅ: 'ጽ', ፆ: 'ጾ',
  // Common vowel/glide orthographic variants in Amharic names
  ዉ: 'ው',
  ዪ: 'ይ',
};

/**
 * Common English and Amharic honorific prefixes that may be present on one record
 * (`Saint George`, `ቅዱስ ጊዮርጊስ`, `Archangel Michael`) and omitted on another (`ጊዮርጊስ`, `Michael`).
 */
const ENGLISH_HONORIFIC_PREFIXES = [
  'archangel ',
  'saint ',
  'saints ',
  'st. ',
  'st ',
  'apostle ',
  'prophet ',
  'martyr ',
  'righteous ',
  'abune ',
  'abba ',
  'aba ',
  'kidus ',
  'kidist ',
  'kidan ',
  'feast of the ',
  'feast of ',
  'commemoration of ',
];

const AMHARIC_HONORIFIC_PREFIXES = [
  'ሊቀ መላእክት ቅዱስ ',
  'ሊቀ መላእክት ',
  'ቅዱሳን ',
  'ቅዱስ ',
  'ቅድስት ',
  'ጻድቅ አቡነ ',
  'ጻድቅ ',
  'አቡነ ',
  'አባ ',
  'ሐዋርያው ቅዱስ ',
  'ሐዋርያው ',
  'ነቢዩ ቅዱስ ',
  'ነቢዩ ',
  'ሰማዕቱ ቅዱስ ',
  'ሰማዕቷ ቅድስት ',
  'ሰማዕት ',
  'በዓለ ',
];

/**
 * Normalizes Unicode text consistently:
 * - Applies NFC normalization
 * - Strips zero-width and bidirectional control characters (e.g. U+202C in uploaded filenames)
 * - Replaces Ethiopic punctuation (፡ ። ፣ ፤ ፥ ፦ ፧ ፨) and ASCII punctuation/hyphens with spaces
 * - Collapses whitespace and lowercases Latin characters while preserving Ethiopic script
 */
export function normalizeUnicodeText(input: string | null | undefined): string {
  if (!input) return '';
  return input
    .normalize('NFC')
    // Strip zero-width & bidi control characters
    .replace(/[\u200B-\u200F\u202A-\u202E\u2060-\u2069\uFEFF]/g, '')
    // Normalize curly quotes/apostrophes
    .replace(/['’‘`´]/g, '')
    // Convert Ethiopic wordspace/punctuation and common separators to spaces
    .replace(/[፡።፣፤፥፦፧፨/_—–\-.,:;!?()[\]{}"“”|·+]+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
    .toLowerCase();
}

/**
 * Produces a canonical Amharic/Ethiopic comparison key that normalizes
 * homophone character series (ሀ/ሐ/ኀ, ሰ/ሠ, አ/ዐ, ጸ/ፀ) and common orthographic
 * variations (e.g., `ፀደኒያ` vs `ፀደንያ`, `ዐቢይ` vs `አብይ`, `ሆሳዕና` vs `ሆሣዕና`, `ትንሳኤ` vs `ትንሣኤ`).
 */
export function normalizeAmharicCanonical(input: string | null | undefined): string {
  const base = normalizeUnicodeText(input);
  if (!base) return '';

  let mapped = '';
  for (const ch of base) {
    mapped += ETHIOPIC_CANONICAL_CHAR_MAP[ch] ?? ch;
  }

  // Handle common Amharic medial vowel/consonant spelling variants:
  // - ኒያ -> ንያ (e.g. ፀደኒያ -> ፀደንያ)
  // - ቢይ -> ብይ (e.g. ዐቢይ -> አብይ)
  // - ዲያቆን -> ድያቆን
  mapped = mapped
    .replace(/ኒያ/g, 'ንያ')
    .replace(/ቢይ/g, 'ብይ')
    .replace(/ዲያ/g, 'ድያ');

  return mapped.replace(/\s+/g, ' ').trim();
}

/**
 * Produces a space-collapsed canonical key to match compound Amharic/English titles
 * regardless of word spacing (e.g. `በአታለማርያም` vs `በአታ ለማርያም`, `በዓለወልድ` vs `በዓለ ወልድ`,
 * `መድሐኔአለም` vs `መድኃኔዓለም`, `ሕንፀተቤተክርስቲያን` vs `ሕንፀተ ቤተ ክርስቲያን`).
 */
export function normalizeCompactCanonical(input: string | null | undefined): string {
  return normalizeAmharicCanonical(input).replace(/\s+/g, '');
}

/**
 * Conservative comparison key for Latin-script Amharic transliterations, so common spelling variants of the
 * same name compare equal (`Qidus Giyorgis` = `Kidus Giorgis`, `Kidist Mariam` = `Qidist Maryam`,
 * `Genna` = `Gena`). Returns '' for Ethiopic text and for keys shorter than 6 letters. It is only ever applied
 * against verified aliases, never against free text or filenames.
 */
export function normalizeTransliterationKey(input: string | null | undefined): string {
  const base = normalizeUnicodeText(input).normalize('NFD').replace(/[\u0300-\u036f]/g, '');
  if (!base || /[\u1200-\u137F]/.test(base)) return '';
  const key = base
    .replace(/[^a-z]/g, '')
    .replace(/q/g, 'k')
    .replace(/kh/g, 'k')
    .replace(/iy/g, 'y')
    .replace(/i(?=[aeou])/g, 'y')
    .replace(/(.)\1+/g, '$1');
  return key.length >= 6 ? key : '';
}

/**
 * Strips storage extensions, upload copy suffixes (` (2)`), and content-media hash/timestamp suffixes
 * (`-4ff2109c-1790970788849.webp`, `-1790969755396.webp`) from a filename or path segment.
 */
export function cleanMediaFileNameStem(fileNameOrPath: string | null | undefined): string {
  if (!fileNameOrPath) return '';
  const baseName = fileNameOrPath.split('/').pop() ?? fileNameOrPath;
  return baseName
    .normalize('NFC')
    .replace(/[\u200B-\u200F\u202A-\u202E\u2060-\u2069\uFEFF]/g, '')
    .replace(/\.(webp|png|jpe?g|avif|gif|svg)$/i, '')
    .replace(/-[0-9a-f]{8}-\d{10,15}$/i, '')
    .replace(/-\d{10,15}$/i, '')
    .replace(/\s*\(\d+\)\s*$/, '')
    .trim();
}

/**
 * Extracts deterministic title candidates from a potentially bilingual or composite title
 * (e.g., `"Timket / Baptism of Christ"`, `"Saint Uriel — Hamle"`, `"ልደት (ገና)"`, `"Good Friday / Siklet"`).
 * Does NOT perform loose word tokenization that could cause false positives.
 */
export function extractTitleCandidates(
  raw: string | null | undefined,
  options?: { includeHonorificStripped?: boolean }
): string[] {
  if (!raw) return [];
  const cleaned = raw
    .normalize('NFC')
    .replace(/[\u200B-\u200F\u202A-\u202E\u2060-\u2069\uFEFF]/g, '')
    .trim();
  if (!cleaned) return [];

  const candidates = new Set<string>();
  const addCandidate = (value: string) => {
    const trimmed = value.trim();
    if (trimmed.length >= 2) {
      candidates.add(trimmed);
    }
  };

  addCandidate(cleaned);

  // Extract parenthetical alternate titles: e.g. "ልደት (ገና)" -> "ልደት" and "ገና"
  const parenMatches = [...cleaned.matchAll(/\(([^()]+)\)/g)];
  if (parenMatches.length > 0) {
    const withoutParens = cleaned.replace(/\([^()]*\)/g, ' ').replace(/\s+/g, ' ').trim();
    addCandidate(withoutParens);
    for (const match of parenMatches) {
      const inner = match[1]?.trim();
      // Only add parenthetical if it's not a month/date disambiguator like "(ግንቦት)" or "(2)"
      if (inner && !/^\d+$/.test(inner)) {
        addCandidate(inner);
      }
    }
  }

  // Split composite / bilingual titles separated by `/`, `—`, `–`, `|`
  const segments = cleaned.split(/\s*(?:\/|—|–|\|)\s*/);
  if (segments.length > 1) {
    // For "Saint Uriel — Hamle", the first segment "Saint Uriel" is the subject,
    // while the second segment might be a month ("Hamle", "Hidar", "Tahsas", "Miyazia", "Ginbot", "Sene", "Meskerem", "Tikimt", "Tir", "Yekatit", "Megabit", "Nehase", "Pagumen").
    const ethiopianMonths = new Set([
      'meskerem', 'tikimt', 'hidar', 'tahsas', 'tir', 'yekatit',
      'megabit', 'miyazia', 'ginbot', 'sene', 'hamle', 'nehase', 'pagumen',
      'መስከረም', 'ጥቅምት', 'ኅዳር', 'ህዳር', 'ታኅሣሥ', 'ታህሳስ', 'ጥር', 'የካቲት',
      'መጋቢት', 'ሚያዝያ', 'ግንቦት', 'ሰኔ', 'ሐምሌ', 'ሀምሌ', 'ነሐሴ', 'ነሀሴ', 'ጳጉሜን', 'ጳጉሜ',
    ]);
    for (const segment of segments) {
      const segNorm = normalizeUnicodeText(segment);
      if (segNorm && !ethiopianMonths.has(segNorm)) {
        addCandidate(segment);
      }
    }
  }

  if (options?.includeHonorificStripped !== false) {
    for (const current of [...candidates]) {
      const lower = current.toLowerCase();
      for (const prefix of ENGLISH_HONORIFIC_PREFIXES) {
        if (lower.startsWith(prefix)) {
          const stripped = current.slice(prefix.length).trim();
          if (stripped.length >= 3) {
            addCandidate(stripped);
          }
        }
      }
      for (const prefix of AMHARIC_HONORIFIC_PREFIXES) {
        if (current.startsWith(prefix)) {
          const stripped = current.slice(prefix.length).trim();
          if (stripped.length >= 2) {
            addCandidate(stripped);
          }
        }
      }
    }
  }

  return [...candidates];
}

/**
 * Checks whether a path or URL points to legacy local calendar artwork (`/images/calendar-web/*` or `/images/calendar/*` or `/images/chants/*`).
 */
export function isLegacyLocalMediaPath(pathOrUrl: string | null | undefined): boolean {
  if (!pathOrUrl) return false;
  const trimmed = pathOrUrl.trim();
  return (
    trimmed.startsWith('/images/calendar-web/') ||
    trimmed.startsWith('/images/calendar/') ||
    trimmed.startsWith('/images/chants/') ||
    trimmed.startsWith('images/calendar-web/') ||
    trimmed.startsWith('images/calendar/')
  );
}

/**
 * Verified catalog of new uploaded media in the public `content-media` Supabase Storage bucket.
 * Sourced directly from `public.calendar_cards`, `public.media_assets`, `public.mezmur_collections_import`,
 * `public.mezmur_sections_import`, and `public.zemaris`.
 */
export const VERIFIED_CONTENT_MEDIA_INDEX: readonly VerifiedMediaEntry[] = [
  // ─── Major Feasts of the Lord (Christ) ───────────────────────────────
  {
    id: 'observance-gena',
    storagePath: 'calendar/christ/gena-255444ca-1790968314647.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'gena',
    sourceSlug: 'gena',
    slug: 'observance-gena',
    title: 'Genna / Nativity of Christ',
    titleAmharic: 'ልደተ ክርስቶስ (ገና)',
    altText: 'Nativity of Christ / Genna',
    fileName: 'Nativity-of-Christ.webp',
    updatedAtMs: 1790968314647,
    relatedIds: ['gena', 'observance-gena', 'gena-eve', 'lidet', 'monthly-lideta-maryam-christ-nativity', 'holidays-nativity'],
    aliases: [
      'Genna', 'Gena', 'Nativity of Christ', 'Ethiopian Christmas', 'Feast of the Nativity',
      'Genna / Nativity Eve', 'Gena / Nativity of Christ', 'ልደት', 'ልደተ ክርስቶስ', 'ገና', 'ልደት (ገና)', 'ዋዜማ ልደት',
    ],
  },
  {
    id: 'observance-timket',
    storagePath: 'calendar/christ/timket-436e0376-1792010746233.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'timket',
    sourceSlug: 'timket',
    slug: 'observance-timket',
    title: 'Timket / Baptism of Christ',
    titleAmharic: 'ጥምቀት',
    altText: 'Baptism of Christ / Timket',
    fileName: 'Baptism-of-Christ.webp',
    updatedAtMs: 1790968339151,
    relatedIds: ['timket', 'observance-timket', 'ketetera', 'ketera', 'holidays-timket'],
    aliases: [
      'Timket', 'Timqat', 'Epiphany', 'Theophany', 'Baptism of Christ', 'Baptism of the Lord',
      'Ketera / Eve of Timket', 'Ketetera', 'ጥምቀት', 'በዓለ ጥምቀት', 'ከተራ', 'ዋዜማ ጥምቀት',
    ],
  },
  {
    id: 'observance-kana-ze-galila',
    storagePath: 'calendar/christ/kana-ze-galila-ac50eb32-1792011352115.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'kana-ze-galila',
    sourceSlug: 'kana-ze-galila',
    slug: 'observance-kana-ze-galila',
    title: 'Kana ze-Galila / Miracle at Cana',
    titleAmharic: 'ቃና ዘገሊላ',
    altText: 'Wedding at Cana / Kana ze-Galila',
    fileName: 'Kana-ze-Galila.webp',
    updatedAtMs: 1790969934507,
    relatedIds: ['kana-ze-galila', 'observance-kana-ze-galila', 'kana', 'cana', 'holidays-kana-ze-galila'],
    aliases: [
      'Kana ze-Galila', 'Kana ZeGalila', 'Miracle at Cana', 'Wedding at Cana', 'Cana of Galilee',
      'ቃና ዘገሊላ',
    ],
  },
  {
    id: 'observance-debre-tabor',
    storagePath: 'calendar/christ/debre-tabor-a813bbad-1790968436996.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'debre-tabor',
    sourceSlug: 'debre-tabor',
    slug: 'observance-debre-tabor',
    title: 'Debre Tabor / Transfiguration (Buhe)',
    titleAmharic: 'ደብረ ታቦር (ቡሄ)',
    altText: 'Transfiguration / Debre Tabor',
    fileName: 'Debre-Tabor.webp',
    updatedAtMs: 1790968436996,
    relatedIds: ['debre-tabor', 'observance-debre-tabor', 'buhe', 'holidays-debre-tabor'],
    aliases: [
      'Debre Tabor', 'Transfiguration', 'Transfiguration of Christ', 'Buhe', 'Mount Tabor',
      'ደብረ ታቦር', 'ቡሄ', 'ደብረ ታቦር (ቡሄ)',
    ],
  },
  {
    id: 'observance-ascension',
    storagePath: 'calendar/christ/ascension-ef91be6c-1790968478137.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'ascension',
    sourceSlug: 'ascension',
    slug: 'observance-ascension',
    title: 'Ascension of Christ',
    titleAmharic: 'ዕርገት',
    altText: 'Ascension of Christ',
    fileName: 'Ascension.webp',
    updatedAtMs: 1790968478137,
    relatedIds: ['ascension', 'observance-ascension', 'erget', 'holidays-ascension'],
    aliases: [
      'Ascension', 'Ascension of Christ', 'Erget', 'Feast of the Ascension',
      'ዕርገት', 'እርገት', 'በዓለ ዕርገት',
    ],
  },
  {
    id: 'hymn-section-holidays-hosanna',
    storagePath: 'hymns/sections/holidays-feasts/holidays-hosanna.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'hosanna',
    sourceSlug: 'hosanna',
    slug: 'holidays-hosanna',
    title: 'Hosanna / Palm Sunday',
    titleAmharic: 'ሆሣዕና',
    altText: 'Hosanna / Palm Sunday',
    fileName: 'ሆሣዕና.webp',
    updatedAtMs: 1793165000000,
    relatedIds: ['hosanna', 'observance-hosanna', 'palm-sunday', 'holidays-hosanna'],
    aliases: [
      'Hosanna', 'Hosanna / Palm Sunday', 'Palm Sunday', 'Entry into Jerusalem',
      'ሆሣዕና', 'ሆሳዕና', 'ሆሳእና', 'በዓለ ሆሣዕና',
    ],
  },
  {
    id: 'hymn-section-holidays-good-friday',
    storagePath: 'hymns/sections/holidays-feasts/holidays-good-friday.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'siklet',
    sourceSlug: 'siklet',
    slug: 'holidays-good-friday',
    title: 'Siklet / Good Friday',
    titleAmharic: 'ስቅለት',
    altText: 'Good Friday / Siklet',
    fileName: 'ሕማማት.webp',
    updatedAtMs: 1793165000000,
    relatedIds: ['siklet', 'siqlet', 'observance-siklet', 'good-friday', 'holidays-good-friday'],
    aliases: [
      'Siklet', 'Siqlet', 'Siklet / Good Friday', 'Good Friday / Siklet', 'Good Friday', 'Crucifixion of Christ',
      'ስቅለት', 'ስቅለተ ክርስቶስ',
    ],
  },
  {
    id: 'hymn-section-holidays-tinsae',
    storagePath: 'hymns/sections/holidays-feasts/holidays-tinsae.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'tinsae',
    sourceSlug: 'tinsae',
    slug: 'holidays-tinsae',
    title: 'Tinsae / Fasika / Pascha',
    titleAmharic: 'ትንሣኤ',
    altText: 'Resurrection / Tinsae',
    fileName: 'ትንሣኤ.webp',
    updatedAtMs: 1793165000000,
    relatedIds: ['tinsae', 'fasika', 'observance-tinsae', 'pascha', 'holidays-tinsae'],
    aliases: [
      'Tinsae', 'Tinsae / Fasika / Pascha', 'Fasika', 'Pascha', 'Resurrection', 'Resurrection of Christ', 'Easter',
      'ትንሣኤ', 'ትንሳኤ', 'ፋሲካ', 'በዓለ ትንሣኤ',
    ],
  },
  {
    id: 'hymn-section-holidays-pentecost',
    storagePath: 'hymns/sections/holidays-feasts/holidays-pentecost.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'pentecost',
    sourceSlug: 'pentecost',
    slug: 'holidays-pentecost',
    title: 'Pentecost / Descent of the Holy Spirit',
    titleAmharic: 'ጰራቅሊጦስ (ጰንጠቆስጤ)',
    altText: 'Pentecost',
    fileName: 'ጰንጠቆስጤ.webp',
    updatedAtMs: 1793165000000,
    relatedIds: ['pentecost', 'peraklitos', 'observance-pentecost', 'holidays-pentecost'],
    aliases: [
      'Pentecost', 'Pentecost / Descent of the Holy Spirit', 'Peraklitos', 'Paraclete', 'Descent of the Holy Spirit',
      'ጰራቅሊጦስ', 'ጰንጠቆስጤ', 'በዓለ ጰራቅሊጦስ',
    ],
  },
  {
    id: 'observance-tselote-hamus',
    storagePath: 'calendar/christ/tselote-hamus-72efbc21-1792451060248.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'tselote-hamus',
    sourceSlug: 'tselote-hamus',
    slug: 'observance-tselote-hamus',
    title: 'Tselote Hamus / Maundy Thursday',
    titleAmharic: 'ጸሎተ ሐሙስ',
    altText: 'Maundy Thursday / Tselote Hamus',
    fileName: 'Tselote-Hamus.webp',
    updatedAtMs: 1792451060248,
    relatedIds: ['tselote-hamus', 'observance-tselote-hamus', 'maundy-thursday'],
    aliases: [
      'Tselote Hamus', 'Tselote Hamus / Maundy Thursday', 'Maundy Thursday', 'Holy Thursday', 'Last Supper',
      'ጸሎተ ሐሙስ', 'ፀሎተ ሐሙስ', 'ጸሎተ ሀሙስ',
    ],
  },
  {
    id: 'observance-qadam-sihur',
    storagePath: 'calendar/general/qadam-sihur-27a07867-1792604327358.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'qadam-sihur',
    sourceSlug: 'qadam-sihur',
    slug: 'observance-qadam-sihur',
    title: 'Qadam Sihur / Holy Saturday',
    titleAmharic: 'ቀዳም ሥዑር',
    altText: 'Holy Saturday / Qadam Sihur',
    fileName: 'Qadam-Sihur.webp',
    updatedAtMs: 1792604327358,
    relatedIds: ['qadam-sihur', 'observance-qadam-sihur', 'holy-saturday'],
    aliases: [
      'Qadam Sihur', 'Qadam Sihur / Holy Saturday', 'Holy Saturday', 'Kadam Siur',
      'ቀዳም ሥዑር', 'ቀዳም ስዑር', 'ቅዳሜ ሥዑር',
    ],
  },
  {
    id: 'observance-new-tinsae',
    storagePath: 'calendar/general/new-tinsae-d5a7c0b7-1792604523828.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'new-tinsae',
    sourceSlug: 'new-tinsae',
    slug: 'observance-new-tinsae',
    title: 'Dagim Tinsae / Thomas Sunday',
    titleAmharic: 'ዳግም ትንሣኤ',
    altText: 'Dagim Tinsae / Thomas Sunday',
    fileName: 'Dagim-Tinsae.webp',
    updatedAtMs: 1792604523828,
    relatedIds: ['new-tinsae', 'observance-new-tinsae', 'dagim-tinsae', 'thomas-sunday'],
    aliases: [
      'Dagim Tinsae', 'New Tinsae', 'Thomas Sunday', 'Second Sunday of Pascha',
      'ዳግም ትንሣኤ', 'ዳግም ትንሳኤ',
    ],
  },
  {
    id: 'observance-debre-zeit',
    storagePath: 'calendar/general/debre-zeit-c73e9e49-1792604386662.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'debre-zeit',
    sourceSlug: 'debre-zeit',
    slug: 'observance-debre-zeit',
    title: 'Debre Zeit / Mount of Olives',
    titleAmharic: 'ደብረ ዘይት',
    altText: 'Debre Zeit',
    fileName: 'Debre-Zeit.webp',
    updatedAtMs: 1792604386662,
    relatedIds: ['debre-zeit', 'observance-debre-zeit'],
    aliases: ['Debre Zeit', 'Mount of Olives', 'ደብረ ዘይት'],
  },
  {
    id: 'observance-flight-into-egypt',
    storagePath: 'calendar/christ/flight-into-egypt-20fb9933-1792604481600.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'flight-into-egypt',
    sourceSlug: 'flight-into-egypt',
    slug: 'observance-flight-into-egypt',
    title: 'Entry of the Holy Family into Egypt / Kuskuam',
    titleAmharic: 'ቁስቋም (ስደተ ቅድስት ቤተሰብ)',
    altText: 'Flight into Egypt / Kuskuam',
    fileName: 'Flight-into-Egypt.webp',
    updatedAtMs: 1792604481600,
    relatedIds: ['flight-into-egypt', 'observance-flight-into-egypt', 'kuskuam'],
    aliases: [
      'Flight into Egypt', 'Entry of the Holy Family into Egypt', 'Kuskuam', 'Debre Kuskuam',
      'ቁስቋም', 'ደብረ ቁስቋም',
    ],
  },
  {
    id: 'observance-circumcision-of-christ',
    storagePath: 'calendar/general/circumcision-of-christ-6f101ca5-1792604850606.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'circumcision-of-christ',
    sourceSlug: 'circumcision-of-christ',
    slug: 'observance-circumcision-of-christ',
    title: 'Circumcision of Christ / Gizret',
    titleAmharic: 'ግዝረት',
    altText: 'Circumcision of Christ',
    fileName: 'Circumcision-of-Christ.webp',
    updatedAtMs: 1792604850606,
    relatedIds: ['circumcision-of-christ', 'observance-circumcision-of-christ', 'gizret'],
    aliases: ['Circumcision of Christ', 'Gizret', 'ግዝረት', 'በዓለ ግዝረት'],
  },
  {
    id: 'observance-sibket',
    storagePath: 'calendar/prophets/sibket-0fd13b08-1792613712179.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'sibket',
    sourceSlug: 'sibket',
    slug: 'observance-sibket',
    title: 'Sibket / Preaching of the Prophets',
    titleAmharic: 'ስብከት',
    altText: 'Sibket / Preaching of the Prophets',
    fileName: 'Sibket.webp',
    updatedAtMs: 1792613712179,
    relatedIds: ['sibket', 'observance-sibket', 'season-advent-sibket'],
    aliases: ['Sibket', 'Sibket / Preaching of the Prophets', 'ስብከት'],
  },
  {
    id: 'season-berhan-period',
    storagePath: 'calendar/general/berhan-period-60fabba7-1792613762086.webp',
    domain: 'calendar',
    sourceType: 'season',
    sourceId: 'berhan-period',
    sourceSlug: 'berhan-period',
    slug: 'season-berhan-period',
    title: 'Berhan / Light',
    titleAmharic: 'ብርሃን',
    altText: 'Berhan / Light',
    fileName: 'Berhan.webp',
    updatedAtMs: 1792613762086,
    relatedIds: ['berhan-period', 'season-berhan-period', 'berhan', 'observance-berhan'],
    aliases: ['Berhan', 'Berhan / Light', 'Sunday of Light', 'ብርሃን', 'ብርሀን'],
  },
  {
    id: 'season-nolawi-period',
    storagePath: 'calendar/general/nolawi-period-222cff4c-1792613794485.webp',
    domain: 'calendar',
    sourceType: 'season',
    sourceId: 'nolawi-period',
    sourceSlug: 'nolawi-period',
    slug: 'season-nolawi-period',
    title: 'Nolawi / Good Shepherd',
    titleAmharic: 'ኖላዊ',
    altText: 'Nolawi / Good Shepherd',
    fileName: 'Nolawi.webp',
    updatedAtMs: 1792613794485,
    relatedIds: ['nolawi-period', 'season-nolawi-period', 'nolawi', 'observance-nolawi'],
    aliases: ['Nolawi', 'Nolawi / Good Shepherd', 'Good Shepherd', 'ኖላዊ'],
  },
  {
    id: 'monthly-medhane-alem-monthly',
    storagePath: 'calendar/christ/medhane-alem-c1534a94-1792449312575.webp',
    domain: 'calendar',
    sourceType: 'monthly',
    sourceId: 'medhane-alem-monthly',
    sourceSlug: 'medhane-alem-monthly',
    slug: 'monthly-medhane-alem-monthly',
    title: 'Medhane Alem / Savior of the World',
    titleAmharic: 'መድኃኔዓለም',
    altText: 'Medhane Alem',
    fileName: 'Medhane-Alem.webp',
    updatedAtMs: 1792449312575,
    relatedIds: [
      'medhane-alem-monthly', 'monthly-medhane-alem-monthly', 'medhane-alem',
      'medhane-alem-tikimt', 'medhane-alem-megabit', 'observance-medhane-alem-tikimt', 'observance-medhane-alem-megabit',
    ],
    aliases: [
      'Medhane Alem', 'MedhaneAlem', 'Savior of the World', 'Saviour of the World',
      'መድኃኔዓለም', 'መድኃኔ ዓለም', 'መድሐኔአለም', 'መድሃኔአለም',
    ],
  },
  {
    id: 'monthly-baale-weld-monthly',
    storagePath: 'calendar/christ/baale-weld-68d658a2-1792604570632.webp',
    domain: 'calendar',
    sourceType: 'monthly',
    sourceId: 'baale-weld-monthly',
    sourceSlug: 'baale-weld-monthly',
    slug: 'monthly-baale-weld-monthly',
    title: 'Baale Weld / Feast of the Son',
    titleAmharic: 'በዓለ ወልድ',
    altText: 'Baale Weld / Feast of the Son',
    fileName: 'Baale-Weld.webp',
    updatedAtMs: 1792604570632,
    relatedIds: ['baale-weld-monthly', 'monthly-baale-weld-monthly', 'baale-weld', 'beale-egziabher'],
    aliases: ['Baale Weld', 'Beale Weld', 'Feast of the Son', 'Beale Egziabher', 'በዓለ ወልድ', 'በዓለወልድ', 'በዓለ እግዚአብሔር'],
  },
  {
    id: 'monthly-ammanuel-monthly',
    storagePath: 'calendar/christ/ammanuel-6ca92513-1792604556224.webp',
    domain: 'calendar',
    sourceType: 'monthly',
    sourceId: 'ammanuel-monthly',
    sourceSlug: 'ammanuel-monthly',
    slug: 'monthly-ammanuel-monthly',
    title: 'Emmanuel / Amanuel',
    titleAmharic: 'አማኑኤል',
    altText: 'Amanuel',
    fileName: 'Amanuel.webp',
    updatedAtMs: 1792604556224,
    relatedIds: ['ammanuel-monthly', 'monthly-ammanuel-monthly', 'amanuel', 'emmanuel'],
    aliases: ['Amanuel', 'Ammanuel', 'Emmanuel', 'አማኑኤል'],
  },

  // ─── Cross & New Year Feasts ─────────────────────────────────────────
  {
    id: 'observance-meskel',
    storagePath: 'calendar/cross/meskel-5d81e2c5-1790968227490.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'meskel',
    sourceSlug: 'meskel',
    slug: 'observance-meskel',
    title: 'Meskel / Finding of the True Cross',
    titleAmharic: 'መስቀል',
    altText: 'Finding of the True Cross / Meskel',
    fileName: 'Meskel.webp',
    updatedAtMs: 1790968227490,
    relatedIds: ['meskel', 'observance-meskel', 'meskel-megabit', 'holidays-meskel'],
    aliases: [
      'Meskel', 'Mesqel', 'Finding of the True Cross', 'Exaltation of the Holy Cross', 'Feast of the Cross',
      'መስቀል', 'በዓለ መስቀል',
    ],
  },
  {
    id: 'observance-demera',
    storagePath: 'calendar/cross/demera-42d44792-1790968174923.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'demera',
    sourceSlug: 'demera',
    slug: 'observance-demera',
    title: 'Demera / Eve of Meskel',
    titleAmharic: 'ደመራ',
    altText: 'Demera / Meskel Bonfire',
    fileName: 'Demera.webp',
    updatedAtMs: 1790968174923,
    relatedIds: ['demera', 'observance-demera'],
    aliases: ['Demera', 'Demera / Eve of Meskel', 'Meskel Eve', 'ደመራ', 'ዋዜማ መስቀል'],
  },
  {
    id: 'observance-tekle-meskel',
    storagePath: 'calendar/cross/tekle-meskel-4cf3f0c4-1792604610953.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'tekle-meskel',
    sourceSlug: 'tekle-meskel',
    slug: 'observance-tekle-meskel',
    title: 'Atse Meskel / Feast of the Cross (Megabit 10)',
    titleAmharic: 'ዐፄ መስቀል',
    altText: 'Tekle Meskel / Atse Meskel',
    fileName: 'Tekle-Meskel.webp',
    updatedAtMs: 1792604610953,
    relatedIds: ['tekle-meskel', 'observance-tekle-meskel'],
    aliases: ['Tekle Meskel', 'Atse Meskel', 'ዐፄ መስቀል', 'ተክለ መስቀል'],
  },
  {
    id: 'observance-enkutatash',
    storagePath: 'calendar/general/enkutatash-62834003-1790968116758.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'enkutatash',
    sourceSlug: 'enkutatash',
    slug: 'observance-enkutatash',
    title: 'Enkutatash / Ethiopian New Year',
    titleAmharic: 'እንቁጣጣሽ (አዲስ ዓመት)',
    altText: 'Enkutatash / Ethiopian New Year',
    fileName: 'Enkutatash.webp',
    updatedAtMs: 1790968116758,
    relatedIds: ['enkutatash', 'observance-enkutatash', 'new-year', 'holidays-new-year'],
    aliases: [
      'Enkutatash', 'Ethiopian New Year', 'New Year', 'Inqutatash', 'Feast of Saint John the Baptist (New Year)',
      'እንቁጣጣሽ', 'አዲስ ዓመት', 'አዲስ አመት', 'ቅዱስ ዮሐንስ (አዲስ ዓመት)',
    ],
  },

  // ─── Virgin Mary (St. Mary / Kidist Maryam) ──────────────────────────
  {
    id: 'observance-annunciation',
    storagePath: 'calendar/mary/annunciation-4ff2109c-1790970788849.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'annunciation',
    sourceSlug: 'annunciation',
    slug: 'observance-annunciation',
    title: 'Annunciation / Tsinset (Bisrate Gabriel)',
    titleAmharic: 'ፅንሰት (ብሥራተ ገብርኤል)',
    altText: 'Annunciation / Bisrate Gabriel',
    fileName: 'Annunciation.webp',
    updatedAtMs: 1790970788849,
    relatedIds: ['annunciation', 'observance-annunciation', 'tsinset', 'observance-tsinset'],
    aliases: [
      'Annunciation', 'Tsinset', 'Tsinset / Annunciation and Incarnation', 'Annunciation of the Lord',
      'Bisrate Gabriel', 'Feast of the Annunciation',
      'ፅንሰት', 'ጽንሰት', 'ብሥራት', 'ብሥራተ ገብርኤል',
    ],
  },
  {
    id: 'observance-lideta-maryam',
    storagePath: 'calendar/mary/lideta-maryam-79ab533b-1790969802685.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'lideta-maryam',
    sourceSlug: 'lideta-maryam',
    slug: 'observance-lideta-maryam',
    title: 'Lideta Maryam / Nativity of Saint Mary',
    titleAmharic: 'ልደታ ለማርያም',
    altText: 'Nativity of Mary / Lideta Maryam',
    fileName: 'Lideta-Maryam.webp',
    updatedAtMs: 1790969802685,
    relatedIds: ['lideta-maryam', 'observance-lideta-maryam', 'monthly-lideta-maryam-monthly'],
    aliases: [
      'Lideta Maryam', 'Lideta le-Maryam', 'Nativity of Saint Mary', 'Nativity of the Virgin Mary', 'Birth of Saint Mary',
      'ልደታ', 'ልደታ ለማርያም', 'ልደታ ማርያም',
    ],
  },
  {
    id: 'observance-baeta-maryam',
    storagePath: 'calendar/mary/baeta-maryam-205b5cf8-1790969844808.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'baeta-maryam',
    sourceSlug: 'baeta-maryam',
    slug: 'observance-baeta-maryam',
    title: 'Baeta le-Maryam / Presentation of Mary in the Temple',
    titleAmharic: 'በአታ ለማርያም',
    altText: 'Presentation of Mary / Baeta Maryam',
    fileName: 'Baeta-Maryam.webp',
    updatedAtMs: 1790969844808,
    relatedIds: ['baeta-maryam', 'observance-baeta-maryam', 'monthly-baeta-maryam-monthly'],
    aliases: [
      'Baeta Maryam', 'Baeta le-Maryam', 'Beata le-Maryam', 'Presentation of Saint Mary', 'Presentation of the Virgin Mary',
      'በአታ', 'በአታ ለማርያም', 'በአታለማርያም', 'በዓታ ለማርያም',
    ],
  },
  {
    id: 'observance-kidane-mihret',
    storagePath: 'calendar/mary/kidane-mihret-811b63ee-1790968637146.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'kidane-mihret',
    sourceSlug: 'kidane-mihret',
    slug: 'observance-kidane-mihret',
    title: 'Kidane Mihret / Covenant of Mercy',
    titleAmharic: 'ኪዳነ ምሕረት',
    altText: 'Kidane Mihret / Covenant of Mercy',
    fileName: 'Kidane-Mihret.webp',
    updatedAtMs: 1790968637146,
    relatedIds: [
      'kidane-mihret', 'observance-kidane-mihret', 'monthly-kidane-mihret-monthly',
      'mary-kidane-mihret', 'hymn-section-mary-kidane-mihret',
    ],
    aliases: [
      'Kidane Mihret', 'Kidanemihret', 'Covenant of Mercy', 'Our Lady of the Covenant of Mercy',
      'ኪዳነ ምሕረት', 'ኪዳነ ምህረት',
    ],
  },
  {
    id: 'observance-asteriyo-maryam',
    storagePath: 'calendar/mary/asteriyo-maryam-856091e2-1790968674108.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'asteriyo-maryam',
    sourceSlug: 'asteriyo-maryam',
    slug: 'observance-asteriyo-maryam',
    title: 'Asteriyo Maryam / Dormition of Saint Mary',
    titleAmharic: 'አስተርእዮ ማርያም (ዕረፍታ ለማርያም)',
    altText: 'Dormition of Mary / Asteriyo Maryam',
    fileName: 'Asteriyo-Maryam.webp',
    updatedAtMs: 1790968674108,
    relatedIds: ['asteriyo-maryam', 'observance-asteriyo-maryam'],
    aliases: [
      'Asteriyo Maryam', 'Asteryo Maryam', 'Dormition of Saint Mary', 'Dormition of the Theotokos',
      'አስተርእዮ ማርያም', 'አስተርዮ ማርያም', 'ዕረፍታ ለማርያም',
    ],
  },
  {
    id: 'observance-filseta',
    storagePath: 'calendar/mary/filseta-324be60f-1790968590717.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'filseta',
    sourceSlug: 'filseta',
    slug: 'observance-filseta',
    title: 'Filseta / Assumption of Saint Mary',
    titleAmharic: 'ፍልሰታ ለማርያም',
    altText: 'Assumption of Mary / Filseta',
    fileName: 'Filseta.webp',
    updatedAtMs: 1790968590717,
    relatedIds: ['filseta', 'observance-filseta', 'mary-filseta'],
    aliases: [
      'Filseta', 'Filseta le-Maryam', 'Assumption of Saint Mary', 'Assumption of the Virgin Mary',
      'ፍልሰታ', 'ፍልሰታ ለማርያም',
    ],
  },
  {
    id: 'observance-tsion-maryam',
    storagePath: 'calendar/mary/tsion-maryam-7905dc7c-1790969725483.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'tsion-maryam',
    sourceSlug: 'tsion-maryam',
    slug: 'observance-tsion-maryam',
    title: 'Hidar Tsion / Saint Mary of Zion',
    titleAmharic: 'ኅዳር ጽዮን (ማርያም ጽዮን)',
    altText: 'Saint Mary of Zion / Hidar Tsion',
    fileName: 'Tsion-Maryam.webp',
    updatedAtMs: 1790969725483,
    relatedIds: ['tsion-maryam', 'observance-tsion-maryam', 'hidar-tsion', 'monthly-maryam-monthly'],
    aliases: [
      'Tsion Maryam', 'Hidar Tsion', 'Saint Mary of Zion', 'Our Lady Mary of Zion', 'Axum Tsion',
      'ኅዳር ጽዮን', 'ህዳር ጽዮን', 'ማርያም ጽዮን', 'ጽዮን ማርያም', 'ቅድስት ድንግል ማርያም',
    ],
  },
  {
    id: 'monthly-tsedenya-maryam-monthly',
    storagePath: 'calendar/mary/virgin-mary-5b77113d-1792449159957.webp',
    domain: 'calendar',
    sourceType: 'monthly',
    sourceId: 'tsedenya-maryam-monthly',
    sourceSlug: 'tsedenya-maryam-monthly',
    slug: 'monthly-tsedenya-maryam-monthly',
    title: 'Tsedenya Maryam / Our Lady of Tsedenya',
    titleAmharic: 'ፀደንያ ማርያም',
    altText: 'Tsedenya Maryam / Virgin Mary',
    fileName: 'Tsedenya-Maryam.webp',
    updatedAtMs: 1792449159957,
    relatedIds: [
      'tsedenya-maryam-monthly', 'monthly-tsedenya-maryam-monthly',
      'tsedenya-maryam', 'observance-tsedenya-maryam',
    ],
    aliases: [
      'Tsedenya Maryam', 'Tsedeniya Maryam', 'Our Lady of Tsedenya',
      'ፀደንያ ማርያም', 'ፀደኒያ ማርያም', 'ጸደንያ ማርያም', 'ጸደኒያ ማርያም',
    ],
  },
  {
    id: 'monthly-maryam-church-monthly',
    storagePath: 'calendar/mary/maryam-church-9052ab4f-1792604546463.webp',
    domain: 'calendar',
    sourceType: 'monthly',
    sourceId: 'maryam-church-monthly',
    sourceSlug: 'maryam-church-monthly',
    slug: 'monthly-maryam-church-monthly',
    title: 'Hintsete Bete Kristiyan / First Church Dedicated to Mary',
    titleAmharic: 'ሕንፀተ ቤተ ክርስቲያን',
    altText: 'First Church Dedicated to Mary',
    fileName: 'Maryam-Church.webp',
    updatedAtMs: 1792604546463,
    relatedIds: [
      'maryam-church-monthly', 'monthly-maryam-church-monthly',
      'maryam-church-dedication', 'observance-maryam-church-dedication',
    ],
    aliases: [
      'First Church Dedicated to Mary', 'Dedication of the Church of Saint Mary', 'Hintsete Bete Kristiyan',
      'ሕንፀተ ቤተ ክርስቲያን', 'ሕንጸተ ቤተ ክርስቲያን', 'ህንጸተ ቤተ ክርስቲያን',
    ],
  },
  {
    id: 'observance-debre-mitmaq',
    storagePath: 'calendar/mary/debre-mitmaq-64e6f81c-1792449202330.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'debre-mitmaq',
    sourceSlug: 'debre-mitmaq',
    slug: 'observance-debre-mitmaq',
    title: 'Debre Mitmaq / Apparition of Saint Mary',
    titleAmharic: 'ደብረ ምጥማቅ',
    altText: 'Debre Mitmaq',
    fileName: 'Debre-Mitmaq.webp',
    updatedAtMs: 1792449202330,
    relatedIds: ['debre-mitmaq', 'observance-debre-mitmaq'],
    aliases: ['Debre Mitmaq', 'Debre Mitmak', 'ደብረ ምጥማቅ'],
  },
  {
    id: 'observance-gishen-maryam',
    storagePath: 'calendar/mary/gishen-maryam-5be22c1f-1792449240560.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'gishen-maryam',
    sourceSlug: 'gishen-maryam',
    slug: 'observance-gishen-maryam',
    title: 'Gishen Maryam / Debre Kerbe',
    titleAmharic: 'ግሸን ማርያም (ደብረ ከርቤ)',
    altText: 'Gishen Maryam',
    fileName: 'Gishen-Maryam.webp',
    updatedAtMs: 1792449240560,
    relatedIds: ['gishen-maryam', 'observance-gishen-maryam', 'debre-kerbe'],
    aliases: ['Gishen Maryam', 'Gishen Debre Kerbe', 'Debre Kerbe', 'ግሸን ማርያም', 'ደብረ ከርቤ', 'ግሸን ደብረ ከርቤ'],
  },

  // ─── Holy Trinity ───────────────────────────────────────────────────
  {
    id: 'observance-holy-trinity',
    storagePath: 'calendar/trinity/holy-trinity-c6334d74-1790968715701.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'holy-trinity',
    sourceSlug: 'holy-trinity',
    slug: 'observance-holy-trinity',
    title: 'Holy Trinity / Kidist Selassie',
    titleAmharic: 'ቅድስት ሥላሴ',
    altText: 'Holy Trinity / Kidist Selassie',
    fileName: 'Holy-Trinity.webp',
    updatedAtMs: 1790968715701,
    relatedIds: [
      'holy-trinity', 'observance-holy-trinity', 'trinity-tir', 'trinity-hamle',
      'observance-trinity-tir', 'observance-trinity-hamle', 'monthly-selassie-monthly', 'selassie',
    ],
    aliases: [
      'Holy Trinity', 'Kidist Selassie', 'Kidist Sillase', 'Selassie', 'Trinity',
      'Holy Trinity — Tir', 'Holy Trinity — Hamle',
      'ቅድስት ሥላሴ', 'ቅድስት ስላሴ', 'ሥላሴ', 'ስላሴ', 'አብ ወወልድ ወመንፈስ ቅዱስ',
    ],
  },

  // ─── Archangels & Heavenly Hosts ────────────────────────────────────
  {
    id: 'observance-michael-hidar',
    storagePath: 'calendar/angels/michael-hidar-85b42130-1790968789526.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'michael-hidar',
    sourceSlug: 'michael-hidar',
    slug: 'observance-michael-hidar',
    title: 'Archangel Saint Michael',
    titleAmharic: 'ቅዱስ ሚካኤል',
    altText: 'Archangel Michael',
    fileName: 'Archangel-Michael.webp',
    updatedAtMs: 1790968789526,
    relatedIds: [
      'michael-hidar', 'observance-michael-hidar', 'michael-sene', 'observance-michael-sene',
      'monthly-michael-monthly', 'michael', 'archangel-michael', 'angels-archangels',
    ],
    aliases: [
      'Archangel Michael', 'Saint Michael', 'St. Michael', 'Kidus Michael', 'Michael',
      'Saint Michael — Hidar', 'Saint Michael — Sene',
      'ቅዱስ ሚካኤል', 'ሊቀ መላእክት ቅዱስ ሚካኤል', 'ሚካኤል', 'ኅዳር ሚካኤል', 'ሰኔ ሚካኤል',
    ],
  },
  {
    id: 'observance-gabriel-tahsas',
    storagePath: 'calendar/angels/gabriel-tahsas-2c6f4704-1790968831797.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'gabriel-tahsas',
    sourceSlug: 'gabriel-tahsas',
    slug: 'observance-gabriel-tahsas',
    title: 'Archangel Saint Gabriel',
    titleAmharic: 'ቅዱስ ገብርኤል',
    altText: 'Archangel Gabriel',
    fileName: 'Archangel-Gabriel.webp',
    updatedAtMs: 1790968831797,
    relatedIds: [
      'gabriel-tahsas', 'observance-gabriel-tahsas', 'gabriel-hamle', 'observance-gabriel-hamle',
      'monthly-gabriel-monthly', 'gabriel', 'archangel-gabriel',
    ],
    aliases: [
      'Archangel Gabriel', 'Saint Gabriel', 'St. Gabriel', 'Kidus Gabriel', 'Gabriel',
      'Saint Gabriel — Tahsas', 'Saint Gabriel — Hamle', 'Kulubi Gabriel',
      'ቅዱስ ገብርኤል', 'ሊቀ መላእክት ቅዱስ ገብርኤል', 'ገብርኤል', 'ታኅሣሥ ገብርኤል', 'ሐምሌ ገብርኤል',
    ],
  },
  {
    id: 'observance-raphael-pagumen',
    storagePath: 'calendar/general/raphael-14b3d177-1792450616283.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'raphael-pagumen',
    sourceSlug: 'raphael-pagumen',
    slug: 'observance-raphael-pagumen',
    title: 'Archangel Saint Raphael',
    titleAmharic: 'ቅዱስ ሩፋኤል',
    altText: 'Archangel Raphael',
    fileName: 'Archangel-Raphael.webp',
    updatedAtMs: 1792450616283,
    relatedIds: [
      'raphael-pagumen', 'observance-raphael-pagumen', 'raphael-tahsas', 'observance-raphael-tahsas',
      'monthly-raphael-monthly', 'raphael', 'archangel-raphael',
    ],
    aliases: [
      'Archangel Raphael', 'Saint Raphael', 'St. Raphael', 'Kidus Rufael', 'Kidus Raphael', 'Raphael', 'Rufael',
      'Saint Raphael — Pagumen', 'Saint Raphael — Tahsas',
      'ቅዱስ ሩፋኤል', 'ሊቀ መላእክት ቅዱስ ሩፋኤል', 'ሩፋኤል', 'ጳጉሜ ሩፋኤል',
    ],
  },
  {
    id: 'observance-uriel-tir',
    storagePath: 'calendar/angels/uriel-79df65b6-1790969567919.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'uriel-tir',
    sourceSlug: 'uriel-tir',
    slug: 'observance-uriel-tir',
    title: 'Archangel Saint Uriel',
    titleAmharic: 'ቅዱስ ዑራኤል',
    altText: 'Archangel Uriel',
    fileName: 'Archangel-Uriel.webp',
    updatedAtMs: 1790969567919,
    relatedIds: [
      'uriel-tir', 'observance-uriel-tir', 'uriel-hamle', 'observance-uriel-hamle',
      'monthly-uriel-monthly', 'uriel', 'archangel-uriel',
    ],
    aliases: [
      'Archangel Uriel', 'Saint Uriel', 'St. Uriel', 'Kidus Urael', 'Kidus Uriel', 'Uriel', 'Urael',
      'Saint Uriel — Tir', 'Saint Uriel — Hamle',
      'ቅዱስ ዑራኤል', 'ቅዱስ ኡራኤል', 'ሊቀ መላእክት ቅዱስ ዑራኤል', 'ዑራኤል', 'ኡራኤል',
    ],
  },
  {
    id: 'monthly-raguel-monthly',
    storagePath: 'calendar/angels/raguel-c3a25f13-1792604714855.webp',
    domain: 'calendar',
    sourceType: 'monthly',
    sourceId: 'raguel-monthly',
    sourceSlug: 'raguel-monthly',
    slug: 'monthly-raguel-monthly',
    title: 'Archangel Saint Raguel',
    titleAmharic: 'ቅዱስ ራጉኤል',
    altText: 'Archangel Raguel',
    fileName: 'Archangel-Raguel.webp',
    updatedAtMs: 1792604714855,
    relatedIds: ['raguel-monthly', 'monthly-raguel-monthly', 'raguel', 'raguel-meskerem'],
    aliases: ['Archangel Raguel', 'Saint Raguel', 'Raguel', 'ቅዱስ ራጉኤል', 'ራጉኤል'],
  },
  {
    id: 'monthly-phanuel-monthly',
    storagePath: 'calendar/angels/phanuel-0901db5f-1792604868121.webp',
    domain: 'calendar',
    sourceType: 'monthly',
    sourceId: 'phanuel-monthly',
    sourceSlug: 'phanuel-monthly',
    slug: 'monthly-phanuel-monthly',
    title: 'Archangel Saint Phanuel',
    titleAmharic: 'ቅዱስ ፋኑኤል',
    altText: 'Archangel Phanuel',
    fileName: 'Archangel-Phanuel.webp',
    updatedAtMs: 1792604868121,
    relatedIds: ['phanuel-monthly', 'monthly-phanuel-monthly', 'phanuel', 'fanuel'],
    aliases: ['Archangel Phanuel', 'Saint Phanuel', 'Phanuel', 'Fanuel', 'ቅዱስ ፋኑኤል', 'ፋኑኤል'],
  },
  {
    id: 'monthly-cherubim-monthly',
    storagePath: 'calendar/angels/cherubim-2b4ee793-1790969602032.webp',
    domain: 'calendar',
    sourceType: 'monthly',
    sourceId: 'cherubim-monthly',
    sourceSlug: 'cherubim-monthly',
    slug: 'monthly-cherubim-monthly',
    title: 'Four Living Creatures / Cherubim (Arbaetu Ensisa)',
    titleAmharic: 'አርባዕቱ እንስሳ (ኪሩቤል)',
    altText: 'Four Living Creatures / Cherubim',
    fileName: 'Cherubim.webp',
    updatedAtMs: 1790969602032,
    relatedIds: [
      'cherubim-monthly', 'monthly-cherubim-monthly', 'cherubim-hidar', 'observance-cherubim-hidar',
      'four-living-creatures', 'arbaetu-ensisa',
    ],
    aliases: [
      'Four Living Creatures', 'Four Living Creatures / Cherubim', 'Cherubim', 'Arbaetu Ensisa',
      'ኪሩቤል', 'አርባዕቱ እንስሳ', 'አርባእቱ እንስሳ', 'ኪሩቤል አርባእቱ እንስሳ',
    ],
  },
  {
    id: 'monthly-heavenly-priests-monthly',
    storagePath: 'calendar/saints/heavenly-priests-59888cef-1792604796361.webp',
    domain: 'calendar',
    sourceType: 'monthly',
    sourceId: 'heavenly-priests-monthly',
    sourceSlug: 'heavenly-priests-monthly',
    slug: 'monthly-heavenly-priests-monthly',
    title: 'Twenty-Four Heavenly Priests (Kahinate Semay)',
    titleAmharic: '24ቱ ካህናተ ሰማይ',
    altText: 'Twenty-four Heavenly Priests',
    fileName: 'Heavenly-Priests.webp',
    updatedAtMs: 1792604796361,
    relatedIds: [
      'heavenly-priests-monthly', 'monthly-heavenly-priests-monthly',
      'heavenly-priests-hidar', 'observance-heavenly-priests-hidar',
    ],
    aliases: [
      'Twenty-four Heavenly Priests', 'Twenty-Four Heavenly Priests', '24 Heavenly Priests', 'Kahinate Semay',
      '24ቱ ካህናተ ሰማይ', 'ካህናተ ሰማይ', 'ሃያ አራቱ ካህናተ ሰማይ',
    ],
  },

  // ─── Martyrs, Saints, Apostles & Prophets ───────────────────────────
  {
    id: 'observance-george-tir',
    storagePath: 'calendar/martyrs/george-tir-24af9cbc-1792614300549.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'george-tir',
    sourceSlug: 'george-tir',
    slug: 'observance-george-tir',
    title: 'Saint George / Kidus Giorgis',
    titleAmharic: 'ቅዱስ ጊዮርጊስ',
    altText: 'Saint George / Kidus Giorgis',
    fileName: 'Saint-George.webp',
    updatedAtMs: 1792614300549,
    relatedIds: [
      'george-tir', 'observance-george-tir', 'george-hidar', 'observance-george-hidar',
      'george-miyazia', 'observance-george-miyazia', 'monthly-giorgis-monthly',
      'giorgis', 'saint-george', 'saint-george-major',
    ],
    aliases: [
      'Saint George', 'St. George', 'Kidus Giorgis', 'Giorgis', 'George',
      'Saint George — Tir', 'Saint George — Hidar', 'Saint George — Miyazia',
      'ቅዱስ ጊዮርጊስ', 'ሰማዕቱ ቅዱስ ጊዮርጊስ', 'ጊዮርጊስ',
    ],
  },
  {
    id: 'observance-tekle-haymanot-nehase',
    storagePath: 'calendar/saints/tekle-haymanot-c586cb64-1790969017981.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'tekle-haymanot-nehase',
    sourceSlug: 'tekle-haymanot-nehase',
    slug: 'observance-tekle-haymanot-nehase',
    title: 'Abune Tekle Haymanot',
    titleAmharic: 'አቡነ ተክለ ሃይማኖት',
    altText: 'Abune Tekle Haymanot',
    fileName: 'Abune-Tekle-Haymanot.webp',
    updatedAtMs: 1790969017981,
    relatedIds: [
      'tekle-haymanot-nehase', 'observance-tekle-haymanot-nehase',
      'tekle-haymanot-tir', 'observance-tekle-haymanot-tir',
      'tekle-haymanot-ginbot', 'observance-tekle-haymanot-ginbot',
      'monthly-tekle-haymanot-monthly', 'tekle-haymanot',
    ],
    aliases: [
      'Abune Tekle Haymanot', 'Saint Tekle Haymanot', 'Tekle Haymanot', 'Teklehaymanot',
      'አቡነ ተክለ ሃይማኖት', 'ቅዱስ ተክለ ሃይማኖት', 'ተክለ ሃይማኖት', 'ተክለ ሀይማኖት',
    ],
  },
  {
    id: 'observance-gebre-menfes-kidus',
    storagePath: 'calendar/saints/gebre-menfes-kidus-c309b0e0-1790969056776.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'gebre-menfes-kidus-megabit',
    sourceSlug: 'gebre-menfes-kidus-megabit',
    slug: 'observance-gebre-menfes-kidus-megabit',
    title: 'Abune Gebre Menfes Kidus (Abo)',
    titleAmharic: 'አቡነ ገብረ መንፈስ ቅዱስ (አቦ)',
    altText: 'Abune Gebre Menfes Kidus',
    fileName: 'Abune-Gebre-Menfes-Kidus.webp',
    updatedAtMs: 1790969056776,
    relatedIds: [
      'gebre-menfes-kidus-megabit', 'observance-gebre-menfes-kidus-megabit',
      'gebre-menfes-kidus-tikimt', 'observance-gebre-menfes-kidus-tikimt',
      'monthly-gebre-menfes-kidus-monthly', 'gebre-menfes-kidus', 'abo',
    ],
    aliases: [
      'Abune Gebre Menfes Kidus', 'Saint Gebre Menfes Kidus', 'Gebre Menfes Kidus', 'Abo',
      'አቡነ ገብረ መንፈስ ቅዱስ', 'ገብረ መንፈስ ቅዱስ', 'አቦ',
    ],
  },
  {
    id: 'observance-stephen',
    storagePath: 'calendar/general/stephen-cb367ff9-1792604352556.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'stephen',
    sourceSlug: 'stephen',
    slug: 'observance-stephen',
    title: 'Saint Stephen the Protomartyr / Kidus Estifanos',
    titleAmharic: 'ቅዱስ እስጢፋኖስ',
    altText: 'Saint Stephen / Estifanos',
    fileName: 'Saint-Stephen.webp',
    updatedAtMs: 1792604352556,
    relatedIds: [
      'stephen', 'observance-stephen', 'stephen-relics', 'observance-stephen-relics',
      'monthly-estifanos-monthly', 'estifanos',
    ],
    aliases: [
      'Saint Stephen', 'St. Stephen', 'Kidus Estifanos', 'Estifanos', 'Stephen the Protomartyr',
      'Saint Stephen (Relics)', 'Translation of the Relics of Saint Stephen',
      'ቅዱስ እስጢፋኖስ', 'ሊቀ ዲያቆናት ቅዱስ እስጢፋኖስ', 'እስጢፋኖስ',
    ],
  },
  {
    id: 'observance-arsema',
    storagePath: 'calendar/martyrs/arsema-dc66b440-1792014229003.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'arsema-tahsas',
    sourceSlug: 'arsema-tahsas',
    slug: 'observance-arsema-tahsas',
    title: 'Saint Arsema / Kidist Arsema',
    titleAmharic: 'ቅድስት አርሴማ',
    altText: 'Saint Arsema',
    fileName: 'Saint-Arsema.webp',
    updatedAtMs: 1792014229003,
    relatedIds: [
      'arsema-tahsas', 'observance-arsema-tahsas', 'arsema-meskerem', 'observance-arsema-meskerem',
      'monthly-arsema-monthly', 'arsema', 'saint-arsema',
    ],
    aliases: [
      'Saint Arsema', 'St. Arsema', 'Kidist Arsema', 'Arsema', 'Martyr Arsema',
      'ቅድስት አርሴማ', 'ሰማዕቷ ቅድስት አርሴማ', 'አርሴማ',
    ],
  },
  {
    id: 'observance-john-baptist',
    storagePath: 'calendar/general/john-baptist-58467b79-1792604896517.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'john-baptist-martyrdom',
    sourceSlug: 'john-baptist-martyrdom',
    slug: 'observance-john-baptist-martyrdom',
    title: 'Saint John the Baptist / Kidus Yohannes Metmik',
    titleAmharic: 'ቅዱስ ዮሐንስ መጥምቅ',
    altText: 'John the Baptist',
    fileName: 'John-the-Baptist.webp',
    updatedAtMs: 1792604896517,
    relatedIds: [
      'john-baptist-martyrdom', 'observance-john-baptist-martyrdom',
      'john-baptist-birth', 'observance-john-baptist-birth',
      'monthly-yohannes-metmik-monthly', 'yohannes', 'john-the-baptist',
    ],
    aliases: [
      'John the Baptist', 'Saint John the Baptist', 'St. John the Baptist', 'Yohannes Metmik', 'Kidus Yohannes',
      'ዮሐንስ መጥምቅ', 'ቅዱስ ዮሐንስ መጥምቅ', 'ዮሀንስ መጥምቅ',
    ],
  },
  {
    id: 'observance-peter-paul',
    storagePath: 'calendar/apostles/peter-and-paul-31de5bd0-1790969203892.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'peter-and-paul',
    sourceSlug: 'peter-and-paul',
    slug: 'observance-peter-and-paul',
    title: 'Saints Peter and Paul / Petros we-Pawlos',
    titleAmharic: 'ቅዱሳን ጴጥሮስ ወጳውሎስ',
    altText: 'Saints Peter and Paul',
    fileName: 'Saints-Peter-and-Paul.webp',
    updatedAtMs: 1790969203892,
    relatedIds: ['peter-and-paul', 'observance-peter-and-paul', 'petros-pawlos', 'hamle-5'],
    aliases: [
      'Saints Peter and Paul', 'Peter and Paul', 'Petros we-Pawlos', 'Petros and Pawlos',
      'ቅዱሳን ጴጥሮስ ወጳውሎስ', 'ጴጥሮስ ወጳውሎስ', 'ጴጥሮስና ጳውሎስ',
    ],
  },
  {
    id: 'observance-lalibela',
    storagePath: 'calendar/saints/lalibela-da6a4cd9-1792604886806.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'lalibela',
    sourceSlug: 'lalibela',
    slug: 'observance-lalibela',
    title: 'Saint King Lalibela',
    titleAmharic: 'ቅዱስ ላሊበላ',
    altText: 'Saint Lalibela',
    fileName: 'Saint-Lalibela.webp',
    updatedAtMs: 1792604886806,
    relatedIds: [
      'lalibela', 'observance-lalibela', 'lalibela-birth', 'observance-lalibela-birth',
      'lalibela-departure', 'observance-lalibela-departure', 'monthly-lalibela-monthly',
    ],
    aliases: [
      'Saint Lalibela', 'St. Lalibela', 'King Lalibela', 'Kidus Lalibela', 'Lalibela',
      'ቅዱስ ላሊበላ', 'ንጉሥ ቅዱስ ላሊበላ', 'ላሊበላ',
    ],
  },
  {
    id: 'observance-abune-aregawi',
    storagePath: 'calendar/saints/abune-aregawi-77a91ca3-1790969103235.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'abune-aregawi',
    sourceSlug: 'abune-aregawi',
    slug: 'observance-abune-aregawi',
    title: 'Abune Aregawi (Za-Mikael)',
    titleAmharic: 'አቡነ አረጋዊ (ዘሚካኤል)',
    altText: 'Abune Aregawi',
    fileName: 'Abune-Aregawi.webp',
    updatedAtMs: 1790969103235,
    relatedIds: ['abune-aregawi', 'observance-abune-aregawi', 'monthly-aregawi-monthly'],
    aliases: ['Abune Aregawi', 'Saint Aregawi', 'Za-Mikael Aregawi', 'አቡነ አረጋዊ', 'አረጋዊ'],
  },
  {
    id: 'observance-samuel-waldba',
    storagePath: 'calendar/saints/samuel-waldba-37e58255-1792604651936.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'samuel-waldba',
    sourceSlug: 'samuel-waldba',
    slug: 'observance-samuel-waldba',
    title: 'Abune Samuel of Waldba',
    titleAmharic: 'አቡነ ሳሙኤል ዘዋልድባ',
    altText: 'Abune Samuel of Waldba',
    fileName: 'Samuel-Waldba.webp',
    updatedAtMs: 1792604651936,
    relatedIds: ['samuel-waldba', 'observance-samuel-waldba'],
    aliases: ['Abune Samuel of Waldba', 'Samuel of Waldba', 'አቡነ ሳሙኤል ዘዋልድባ', 'ሳሙኤል ዘዋልድባ'],
  },
  {
    id: 'observance-kiros',
    storagePath: 'calendar/saints/kiros-5016bc36-1792604841450.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'kiros',
    sourceSlug: 'kiros',
    slug: 'observance-kiros',
    title: 'Abba Kiros',
    titleAmharic: 'አባ ኪሮስ',
    altText: 'Abba Kiros',
    fileName: 'Abba-Kiros.webp',
    updatedAtMs: 1792604841450,
    relatedIds: ['kiros', 'observance-kiros', 'abba-kiros'],
    aliases: ['Abba Kiros', 'Abune Kiros', 'Saint Kiros', 'አባ ኪሮስ', 'አቡነ ኪሮስ'],
  },
  {
    id: 'observance-kristos-semra',
    storagePath: 'calendar/saints/kristos-semra-8a8e36fb-1792449354533.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'kristos-semra',
    sourceSlug: 'kristos-semra',
    slug: 'observance-kristos-semra',
    title: 'Saint Kristos Semra',
    titleAmharic: 'ቅድስት ክርስቶስ ሠምራ',
    altText: 'Saint Kristos Semra',
    fileName: 'Kristos-Semra.webp',
    updatedAtMs: 1792449354533,
    relatedIds: ['kristos-semra', 'observance-kristos-semra', 'monthly-kristos-semra-monthly'],
    aliases: ['Kristos Semra', 'Saint Kristos Semra', 'ቅድስት ክርስቶስ ሠምራ', 'ክርስቶስ ሠምራ', 'ክርስቶስ ሰምራ'],
  },
  {
    id: 'observance-abraham-isaac-jacob',
    storagePath: 'calendar/prophets/abraham-isaac-jacob-99d80ab7-1792604422548.webp',
    domain: 'calendar',
    sourceType: 'observance',
    sourceId: 'abraham-isaac-jacob',
    sourceSlug: 'abraham-isaac-jacob',
    slug: 'observance-abraham-isaac-jacob',
    title: 'Patriarchs Abraham, Isaac, and Jacob',
    titleAmharic: 'አብርሃም፣ ይስሐቅና ያዕቆብ',
    altText: 'Abraham, Isaac, and Jacob',
    fileName: 'Abraham-Isaac-Jacob.webp',
    updatedAtMs: 1792604422548,
    relatedIds: ['abraham-isaac-jacob', 'observance-abraham-isaac-jacob', 'monthly-abraham-isaac-jacob-monthly'],
    aliases: [
      'Abraham, Isaac, and Jacob', 'Patriarchs Abraham, Isaac, and Jacob', 'Abraham Isaac and Jacob',
      'አብርሃም ይስሐቅ ያዕቆብ', 'አብርሃም፣ ይስሐቅና ያዕቆብ',
    ],
  },

  // ─── Liturgical Fasts & Seasons ─────────────────────────────────────
  {
    id: 'season-great-lent',
    storagePath: 'calendar/general/great-lent-6feda2f3-1792558641939.webp',
    domain: 'calendar',
    sourceType: 'season',
    sourceId: 'great-lent',
    sourceSlug: 'great-lent',
    slug: 'season-great-lent',
    title: 'Abiy Tsom / Great Lent',
    titleAmharic: 'ዐቢይ ጾም (ሁዳዴ)',
    altText: 'Abiy Tsom / Great Lent',
    fileName: 'Great-Lent.webp',
    updatedAtMs: 1792558641939,
    relatedIds: ['great-lent', 'season-great-lent', 'abiy-tsom', 'fast-abiy-tsom', 'hudade'],
    aliases: [
      'Abiy Tsom', 'Abiy Tsom / Great Lent', 'Great Lent', 'Hudade', 'Fast of Great Lent',
      'ዐቢይ ጾም', 'አብይ ጾም', 'ሁዳዴ',
    ],
  },
  {
    id: 'fast-nineveh',
    storagePath: 'calendar/fasts/nineveh-234e4cf5-1790969435139.webp',
    domain: 'calendar',
    sourceType: 'fast',
    sourceId: 'nineveh',
    sourceSlug: 'nineveh',
    slug: 'fast-nineveh',
    title: 'Tsome Nenewe / Fast of Nineveh',
    titleAmharic: 'ጾመ ነነዌ',
    altText: 'Fast of Nineveh / Tsome Nenewe',
    fileName: 'Fast-of-Nineveh.webp',
    updatedAtMs: 1790969435139,
    relatedIds: ['nineveh', 'fast-nineveh', 'tsome-nenewe', 'season-nineveh-period'],
    aliases: ['Fast of Nineveh', 'Tsome Nenewe', 'Nineveh Fast', 'ጾመ ነነዌ', 'ነነዌ'],
  },
  {
    id: 'fast-prophets',
    storagePath: 'calendar/fasts/prophets-fast-5df8a293-1790969487914.webp',
    domain: 'calendar',
    sourceType: 'fast',
    sourceId: 'prophets-fast',
    sourceSlug: 'prophets-fast',
    slug: 'fast-prophets-fast',
    title: 'Tsome Nebiyat / Fast of the Prophets (Advent Fast)',
    titleAmharic: 'ጾመ ነቢያት',
    altText: 'Fast of the Prophets / Tsome Nebiyat',
    fileName: 'Fast-of-the-Prophets.webp',
    updatedAtMs: 1790969487914,
    relatedIds: ['prophets-fast', 'fast-prophets-fast', 'tsome-nebiyat'],
    aliases: ['Fast of the Prophets', 'Tsome Nebiyat', 'Advent Fast', 'Nativity Fast', 'ጾመ ነቢያት'],
  },
  {
    id: 'season-apostles-fast-period',
    storagePath: 'calendar/fasts/apostles-fast-period-63c264dd-1792558554083.webp',
    domain: 'calendar',
    sourceType: 'season',
    sourceId: 'apostles-fast-period',
    sourceSlug: 'apostles-fast-period',
    slug: 'season-apostles-fast-period',
    title: 'Tsome Hawariat / Apostles Fast',
    titleAmharic: 'ጾመ ሐዋርያት',
    altText: 'Apostles Fast / Tsome Hawariat',
    fileName: 'Apostles-Fast.webp',
    updatedAtMs: 1792558554083,
    relatedIds: ['apostles-fast-period', 'season-apostles-fast-period', 'tsome-hawariat', 'fast-tsome-hawariat', 'apostles-fast'],
    aliases: ['Tsome Hawariat', 'Tsome Hawariat / Apostles Fast', 'Apostles Fast', 'Fast of the Apostles', 'ጾመ ሐዋርያት', 'ጾመ ሀዋርያት'],
  },
  {
    id: 'season-filseta-period',
    storagePath: 'calendar/general/filseta-period-33091a0f-1792558585130.webp',
    domain: 'calendar',
    sourceType: 'season',
    sourceId: 'filseta-period',
    sourceSlug: 'filseta-period',
    slug: 'season-filseta-period',
    title: 'Tsome Filseta / Filseta Fast',
    titleAmharic: 'ጾመ ፍልሰታ',
    altText: 'Filseta Fast / Tsome Filseta',
    fileName: 'Filseta-Fast.webp',
    updatedAtMs: 1792558585130,
    relatedIds: ['filseta-period', 'season-filseta-period', 'filseta-fast', 'fast-filseta-fast'],
    aliases: ['Filseta Fast', 'Tsome Filseta', 'Fast of the Assumption', 'ጾመ ፍልሰታ'],
  },
  {
    id: 'season-heraclius-week',
    storagePath: 'calendar/fasts/heraclius-week-5508302c-1792613290763.webp',
    domain: 'calendar',
    sourceType: 'season',
    sourceId: 'heraclius-week',
    sourceSlug: 'heraclius-week',
    slug: 'season-heraclius-week',
    title: 'Tsome Herqal / Fast of Heraclius',
    titleAmharic: 'ጾመ ሕርቃል',
    altText: 'Fast of Heraclius / Tsome Herqal',
    fileName: 'Heraclius-Fast.webp',
    updatedAtMs: 1792613290763,
    relatedIds: ['heraclius-week', 'season-heraclius-week', 'heraclius-fast', 'fast-heraclius-fast'],
    aliases: ['Fast of Heraclius', 'Tsome Herqal', 'Heraclius Week', 'ጾመ ሕርቃል', 'ጾመ ህርቃል'],
  },
  {
    id: 'season-holy-week',
    storagePath: 'calendar/general/holy-week-d4d03282-1792613342360.webp',
    domain: 'calendar',
    sourceType: 'season',
    sourceId: 'holy-week',
    sourceSlug: 'holy-week',
    slug: 'season-holy-week',
    title: 'Semone Himamat / Passion Week (Holy Week)',
    titleAmharic: 'ሰሞነ ሕማማት',
    altText: 'Holy Week / Semone Himamat',
    fileName: 'Holy-Week.webp',
    updatedAtMs: 1792613342360,
    relatedIds: ['holy-week', 'season-holy-week', 'holy-week-fast', 'fast-holy-week-fast', 'himamat'],
    aliases: [
      'Passion Week', 'Passion Week Fast', 'Holy Week', 'Semone Himamat', 'Himamat',
      'ሰሞነ ሕማማት', 'ሰሞነ ህማማት', 'ሕማማት', 'ህማማት',
    ],
  },
  {
    id: 'season-paschal-season',
    storagePath: 'calendar/general/paschal-season-36f961c8-1792613675146.webp',
    domain: 'calendar',
    sourceType: 'season',
    sourceId: 'paschal-season',
    sourceSlug: 'paschal-season',
    slug: 'season-paschal-season',
    title: 'Measure of Fifty Days / Paschal Season (Metke Tinsae)',
    titleAmharic: 'ዘመነ ትንሣኤ (ኀምሳ ዕለታት)',
    altText: 'Paschal Season',
    fileName: 'Paschal-Season.webp',
    updatedAtMs: 1792613675146,
    relatedIds: ['paschal-season', 'season-paschal-season', 'paschal-fifty-days', 'fast-paschal-fifty-days'],
    aliases: ['Paschal Season', 'Paschal Fifty Days', 'Season of Resurrection', 'ዘመነ ትንሣኤ', 'ዘመነ ትንሳኤ'],
  },
  {
    id: 'season-zemene-tsige',
    storagePath: 'calendar/general/zemene-tsige-17fd12fb-1790969515443.webp',
    domain: 'calendar',
    sourceType: 'season',
    sourceId: 'zemene-tsige',
    sourceSlug: 'zemene-tsige',
    slug: 'season-zemene-tsige',
    title: 'Zemene Tsige / Season of the Flower',
    titleAmharic: 'ዘመነ ጽጌ',
    altText: 'Zemene Tsige / Season of Flowers',
    fileName: 'Zemene-Tsige.webp',
    updatedAtMs: 1790969515443,
    relatedIds: ['zemene-tsige', 'season-zemene-tsige', 'tsige', 'mary-zemene-tsige'],
    aliases: ['Zemene Tsige', 'Season of Flowers', 'Season of the Flower', 'Tsige', 'ዘመነ ጽጌ', 'ጽጌ'],
  },
  {
    id: 'fast-wednesday-friday',
    storagePath: 'calendar/fasts/wednesday-friday-fast-e3f3a00b-1790969386058.webp',
    domain: 'calendar',
    sourceType: 'fast',
    sourceId: 'wednesday-friday',
    sourceSlug: 'wednesday-friday',
    slug: 'fast-wednesday-friday',
    title: 'Tsome Dihnet / Wednesday & Friday Fast',
    titleAmharic: 'ጾመ ድኅነት (ረቡዕና ዓርብ)',
    altText: 'Wednesday and Friday Fast / Tsome Dihnet',
    fileName: 'Wednesday-Friday-Fast.webp',
    updatedAtMs: 1790969386058,
    relatedIds: ['wednesday-friday', 'fast-wednesday-friday', 'tsome-dihnet', 'dihnet'],
    aliases: ['Tsome Dihnet', 'Wednesday and Friday Fast', 'Fast of Salvation', 'ጾመ ድኅነት', 'ጾመ ድህነት'],
  },
  {
    id: 'fast-gehadi',
    storagePath: 'calendar/fasts/gehadi-20fc8f13-1792558612809.webp',
    domain: 'calendar',
    sourceType: 'fast',
    sourceId: 'gehadi',
    sourceSlug: 'gehadi',
    slug: 'fast-gehadi',
    title: 'Tsome Gehad / Vigil Fast of Nativity and Theophany',
    titleAmharic: 'ጾመ ገሃድ',
    altText: 'Tsome Gehad',
    fileName: 'Gehad-Fast.webp',
    updatedAtMs: 1792558612809,
    relatedIds: ['gehadi', 'fast-gehadi', 'gehad', 'gena-fast', 'timket-fast'],
    aliases: ['Tsome Gehad', 'Gehad Fast', 'Gena Fast', 'Timket Fast', 'ጾመ ገሃድ', 'ጾመ ገሀድ', 'ገሃድ'],
  },

  // ─── Hymn Major Collections (content-media `hymns/collections/*`) ───
  {
    id: 'hymn-collection-virgin-mary',
    storagePath: 'hymns/collections/virgin-mary.webp',
    domain: 'hymn-collection',
    sourceSlug: 'virgin-mary',
    slug: 'virgin-mary',
    title: 'Virgin Mary',
    titleAmharic: 'የእመቤታችን ቅድስት ድንግል ማርያም መዝሙራት',
    altText: 'Virgin Mary Mezmur Collection',
    fileName: 'virgin-mary.webp',
    updatedAtMs: 1790969000000,
    relatedIds: ['virgin-mary', 'collection-virgin-mary'],
    aliases: ['Virgin Mary', 'Saint Mary Hymns', 'የእመቤታችን መዝሙራት', 'የቅድስት ድንግል ማርያም መዝሙራት'],
  },
  {
    id: 'hymn-collection-jesus-christ',
    storagePath: 'hymns/collections/jesus-christ.webp',
    domain: 'hymn-collection',
    sourceSlug: 'jesus-christ',
    slug: 'jesus-christ',
    title: 'Jesus Christ / MedhaneAlem',
    titleAmharic: 'የጌታችን የመድኃኔዓለም መዝሙራት',
    altText: 'Jesus Christ Mezmur Collection',
    fileName: 'jesus-christ.webp',
    updatedAtMs: 1790969000000,
    relatedIds: ['jesus-christ', 'collection-jesus-christ'],
    aliases: ['Jesus Christ / MedhaneAlem', 'Jesus Christ', 'የጌታችን መዝሙራት'],
  },
  {
    id: 'hymn-collection-holidays-feasts',
    storagePath: 'hymns/collections/holidays-feasts-1790969755396.webp',
    domain: 'hymn-collection',
    sourceSlug: 'holidays-feasts',
    slug: 'holidays-feasts',
    title: 'Holidays & Feasts',
    titleAmharic: 'የበዓላት መዝሙራት',
    altText: 'Holidays and Feasts Mezmur Collection',
    fileName: 'holidays-feasts-1790969755396.webp',
    updatedAtMs: 1790969755396,
    relatedIds: ['holidays-feasts', 'collection-holidays-feasts'],
    aliases: ['Holidays & Feasts', 'Feasts & Seasons', 'የበዓላት መዝሙራት', 'የዐውደ ዓመትና የበዓላት መዝሙራት'],
  },
  {
    id: 'hymn-collection-angels-saints',
    storagePath: 'hymns/collections/angels-saints.webp',
    domain: 'hymn-collection',
    sourceSlug: 'angels-saints',
    slug: 'angels-saints',
    title: 'Angels & Saints',
    titleAmharic: 'የቅዱሳን መላእክትና የቅዱሳን መዝሙራት',
    altText: 'Angels and Saints Mezmur Collection',
    fileName: 'angels-saints.webp',
    updatedAtMs: 1790969000000,
    relatedIds: ['angels-saints', 'collection-angels-saints'],
    aliases: ['Angels & Saints', 'የቅዱሳን መላእክትና የጻድቃን ሰማዕታት መዝሙራት'],
  },
  {
    id: 'hymn-collection-repentance-fasting',
    storagePath: 'hymns/collections/repentance-fasting-1793162386004.webp',
    domain: 'hymn-collection',
    sourceSlug: 'repentance-fasting',
    slug: 'repentance-fasting',
    title: 'Repentance & Fasting',
    titleAmharic: 'የንስሐና የጾም መዝሙራት',
    altText: 'Repentance and Fasting Mezmur Collection',
    fileName: 'repentance-fasting-1793162386004.webp',
    updatedAtMs: 1793162386004,
    relatedIds: ['repentance-fasting', 'collection-repentance-fasting'],
    aliases: ['Repentance & Fasting', 'የንስሐና የጾም መዝሙራት', 'ንስሐ'],
  },
  {
    id: 'hymn-collection-sacraments-church-life',
    storagePath: 'hymns/collections/sacraments-church-life-1793162624070.webp',
    domain: 'hymn-collection',
    sourceSlug: 'sacraments-church-life',
    slug: 'sacraments-church-life',
    title: 'Sacraments & Church Life',
    titleAmharic: 'የምሥጢራተ ቤተ ክርስቲያን መዝሙራት',
    altText: 'Sacraments and Church Life Mezmur Collection',
    fileName: 'sacraments-church-life-1793162624070.webp',
    updatedAtMs: 1793162624070,
    relatedIds: ['sacraments-church-life', 'collection-sacraments-church-life'],
    aliases: ['Sacraments & Church Life', 'Church & Spiritual Life', 'የቤተ ክርስቲያንና የምሥጢራት መዝሙራት'],
  },
  {
    id: 'hymn-collection-praise-general',
    storagePath: 'hymns/collections/praise-general.webp',
    domain: 'hymn-collection',
    sourceSlug: 'praise-general',
    slug: 'praise-general',
    title: 'Praise & General',
    titleAmharic: 'የምስጋናና ልዩ ልዩ መዝሙራት',
    altText: 'Praise and General Mezmur Collection',
    fileName: 'praise-general.webp',
    updatedAtMs: 1790969000000,
    relatedIds: ['praise-general', 'collection-praise-general'],
    aliases: ['Praise & General', 'Praise & Thanksgiving', 'የምስጋና መዝሙራት'],
  },
  {
    id: 'hymn-collection-english-mezmur',
    storagePath: 'hymns/collections/english-mezmur.webp',
    domain: 'hymn-collection',
    sourceSlug: 'english-mezmur',
    slug: 'english-mezmur',
    title: 'English Mezmur',
    titleAmharic: 'የእንግሊዝኛ መዝሙራት',
    altText: 'English Mezmur Collection',
    fileName: 'english-mezmur.webp',
    updatedAtMs: 1790969000000,
    relatedIds: ['english-mezmur', 'collection-english-mezmur'],
    aliases: ['English Mezmur', 'English Hymns', 'የእንግሊዝኛ መዝሙራት'],
  },
  {
    id: 'hymn-collection-zemari-singers',
    storagePath: 'hymns/collections/zemari-singers-1793162587835.webp',
    domain: 'hymn-collection',
    sourceSlug: 'zemari-singers',
    slug: 'zemari-singers',
    title: 'Zemari / Singers',
    titleAmharic: 'ዘማርያን',
    altText: 'Zemari Singers Collection',
    fileName: 'zemari-singers-1793162587835.webp',
    updatedAtMs: 1793162587835,
    relatedIds: ['zemari-singers', 'collection-zemari-singers'],
    aliases: ['Zemari / Singers', 'By Singer (Zemari)', 'ዘማርያን', 'በዘማርያን'],
  },
  // ─── Saint Yared (two CMS cards share one byte-identical upload; canonical path is the general card's) ───
  {
    id: 'yared',
    storagePath: 'calendar/general/yared-96548f68-1792449396141.webp',
    domain: 'calendar',
    sourceType: 'monthly_commemoration',
    sourceSlug: 'yared-monthly',
    slug: 'monthly-yared-monthly',
    title: 'Saint Yared',
    titleAmharic: 'ቅዱስ ያሬድ',
    altText: 'Saint Yared',
    fileName: 'Saint Yared.webp',
    updatedAtMs: 1792449396141,
    relatedIds: ['yared', 'saint-yared', 'yared-monthly', 'yared-ginbot', 'observance-yared-ginbot', 'monthly-yared-monthly'],
    aliases: ['Saint Yared', 'St. Yared', 'Kidus Yared', 'Qidus Yared', 'ቅዱስ ያሬድ', 'ያሬድ'],
  },
  // ─── Zemari portraits whose CMS row points at a missing file; the replacement is the same person's upload ───
  {
    id: 'zemari-muhaze-sibihat-zemari-dagimawi-deribe',
    storagePath: 'hymns/zemaris/muhaze-sibihat-zemari-dagimawi-deribe-1793159386778.webp',
    domain: 'zemari',
    slug: 'muhaze-sibihat-zemari-dagimawi-deribe',
    title: 'Muhaze Sibihat Zemari Dagimawi Deribe',
    titleAmharic: 'ሙሐዘ ስብሀት ዘማሪ ዳግማዊ ደርቤ',
    altText: 'Muhaze Sibihat Zemari Dagimawi Deribe',
    fileName: 'Zemari Dagimawi Deribe.webp',
    updatedAtMs: 1793159386778,
  },
  {
    id: 'zemari-like-mezemiran-tewodros-yoseph',
    storagePath: 'hymns/zemaris/4b59d618-ef00-4d48-9fac-251b1004668c-Tewodros-Yoseph.webp',
    domain: 'zemari',
    slug: 'like-mezemiran-tewodros-yoseph',
    title: 'Like Mezemiran Tewodros Yoseph',
    titleAmharic: 'ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ',
    fileName: 'Tewodros Yoseph.webp',
    updatedAtMs: 1792789766836,
  },

  // ─── Key Hymn Sections (content-media `hymns/sections/*`) ───────────
  {
    id: 'hymn-section-repentance-general',
    storagePath: 'hymns/sections/repentance-fasting/repentance-general-1793162511334.webp',
    domain: 'hymn-section',
    sourceSlug: 'repentance-general',
    slug: 'repentance-general',
    title: 'Repentance / Nisiha',
    titleAmharic: 'ንስሐ',
    altText: 'Repentance / Nisiha',
    fileName: 'ንስሐ.webp',
    updatedAtMs: 1793162511334,
    relatedIds: ['repentance-general', 'nisiha'],
    aliases: ['Repentance', 'Nisiha', 'ንስሐ', 'የንስሐ መዝሙር'],
  },
  {
    id: 'hymn-section-sacraments-holy-communion',
    storagePath: 'hymns/sections/sacraments-church-life/sacraments-holy-communion-1793162742388.webp',
    domain: 'hymn-section',
    sourceSlug: 'sacraments-holy-communion',
    slug: 'sacraments-holy-communion',
    title: 'Holy Communion / Kidus Kurban',
    titleAmharic: 'ቅዱስ ቁርባን',
    altText: 'Holy Communion / Kidus Kurban',
    fileName: 'ቅዱስ ቁርባን.webp',
    updatedAtMs: 1793162742388,
    relatedIds: ['sacraments-holy-communion', 'holy-communion', 'kidus-kurban'],
    aliases: ['Holy Communion', 'Kidus Kurban', 'Eucharist', 'ቅዱስ ቁርባን', 'ሥጋውና ደሙ'],
  },
  {
    id: 'hymn-section-sacraments-matrimony',
    storagePath: 'hymns/sections/sacraments-church-life/sacraments-matrimony-1793162779831.webp',
    domain: 'hymn-section',
    sourceSlug: 'sacraments-matrimony',
    slug: 'sacraments-matrimony',
    title: 'Holy Matrimony / Wedding (Serg)',
    titleAmharic: 'ሰርግ (ምሥጢረ ተክሊል)',
    altText: 'Holy Matrimony / Serg',
    fileName: 'ሰርግ.webp',
    updatedAtMs: 1793162779831,
    relatedIds: ['sacraments-matrimony', 'wedding', 'serg'],
    aliases: ['Holy Matrimony', 'Matrimony & Wedding', 'Serg', 'ሰርግ', 'ሠርግ', 'ምሥጢረ ተክሊል'],
  },
];

/**
 * Runtime registry for linked calendar cards and media paths already in the catalog.
 * Newly uploaded assets without a cataloged relationship stay in admin review.
 */
const runtimeEntriesById = new Map<string, VerifiedMediaEntry>();

/**
 * Registers runtime `CalendarCard` records into the shared media resolver index.
 */
export function registerCalendarCardsForMedia(cards: readonly CalendarCard[] | null | undefined): void {
  if (!cards || cards.length === 0) return;
  for (const card of cards) {
    if (!card.imagePath || isLegacyLocalMediaPath(card.imagePath)) continue;
    if (DEPRIORITIZED_STORAGE_PATHS.has(card.imagePath)) continue;

    const entryId = `runtime-card:${card.id || card.slug}`;
    const updatedAtMs = card.updatedAt ? Date.parse(card.updatedAt) || Date.now() : 1793000000000;
    const relatedIds: string[] = [];
    if (card.id) relatedIds.push(card.id);
    if (card.slug) relatedIds.push(card.slug);
    if (card.sourceId) relatedIds.push(card.sourceId);
    if (card.sourceSlug) relatedIds.push(card.sourceSlug);

    runtimeEntriesById.set(entryId, {
      id: entryId,
      storagePath: card.imagePath,
      domain: 'calendar',
      sourceType: card.sourceType,
      sourceId: card.sourceId ?? undefined,
      sourceSlug: card.sourceSlug ?? undefined,
      slug: card.slug,
      title: card.title,
      titleAmharic: card.titleAmharic ?? undefined,
      imagePosition: card.imagePosition ?? null,
      updatedAtMs,
      relatedIds,
    });
  }
}

export interface RuntimeMediaAssetRecord {
  id: string;
  file_name?: string | null;
  storage_bucket?: string | null;
  storage_path: string;
  alt_text?: string | null;
  caption?: string | null;
  created_at?: string | null;
  media_type?: string | null;
  mime_type?: string | null;
}

/** Metadata gate for media that may be previewed through the public bucket. */
export function isPublicCmsImage(asset: RuntimeMediaAssetRecord): boolean {
  return asset.storage_bucket === 'content-media' &&
    Boolean(asset.storage_path) &&
    !asset.storage_path.startsWith('/') &&
    !asset.storage_path.includes('..') &&
    !asset.storage_path.includes('://') &&
    !isLegacyLocalMediaPath(asset.storage_path) &&
    !DEPRIORITIZED_STORAGE_PATHS.has(asset.storage_path) &&
    (!asset.media_type || asset.media_type === 'image') &&
    (!asset.mime_type || /^image\/(?:jpeg|png|webp|avif|gif)$/i.test(asset.mime_type));
}

/**
 * Only refreshes media already present in the public catalog. An upload's
 * filename or alt text alone is not evidence for automatic public assignment.
 */
export function registerMediaAssets(assets: readonly RuntimeMediaAssetRecord[] | null | undefined): void {
  if (!assets || assets.length === 0) return;
  for (const asset of assets) {
    if (!isPublicCmsImage(asset)) continue;
    const reviewed = VERIFIED_CONTENT_MEDIA_INDEX.find((entry) => entry.storagePath === asset.storage_path);
    if (!reviewed) continue;

    const updatedAtMs = asset.created_at ? Date.parse(asset.created_at) || Date.now() : 1790000000000;

    runtimeEntriesById.set(`runtime-asset:${asset.id}`, {
      ...reviewed,
      id: `runtime-asset:${asset.id}`,
      updatedAtMs,
    });
  }
}

export interface MediaSuggestion<T extends RuntimeMediaAssetRecord = RuntimeMediaAssetRecord> {
  asset: T;
  title: string;
  reason: string;
  relatedContentId: string | null;
  matchSource: 'verified-relationship' | 'exact-title' | 'verified-alias' | 'admin-review';
}

/** Suggests only public-bucket image rows already loaded by the admin picker.
 * Suggestions never enter the automatic resolver or save a relationship.
 */
export function suggestMediaAssets<T extends RuntimeMediaAssetRecord>(
  query: MediaResolutionQuery & { intentionallyNoImage?: boolean },
  assets: readonly T[],
): MediaSuggestion<T>[] {
  if (query.intentionallyNoImage || query.explicitPath?.trim()) return [];
  const titles = [query.title, query.titleAmharic]
    .flatMap((title) => extractTitleCandidates(title, { includeHonorificStripped: false }))
    .map(normalizeAmharicCanonical)
    .filter(Boolean);
  const titleKeys = new Set(titles);
  if (!titleKeys.size && !query.id && !query.slug) return [];

  const resolved = resolveMedia({ ...query, allowLegacyFallback: false });
  const suggestions: MediaSuggestion<T>[] = [];
  for (const asset of assets) {
    if (!isPublicCmsImage(asset)) continue;
    const verified = VERIFIED_CONTENT_MEDIA_INDEX.find((entry) => entry.storagePath === asset.storage_path);
    const verifiedMatch = verified && resolved.storagePath === asset.storage_path &&
      (resolved.matchSource === 'verified-relationship' || resolved.matchSource === 'exact-title' || resolved.matchSource === 'verified-alias')
      ? resolved.matchSource : null;
    const altMatches = asset.alt_text && extractTitleCandidates(asset.alt_text, { includeHonorificStripped: false })
      .some((title) => titleKeys.has(normalizeAmharicCanonical(title)));
    if (!verifiedMatch && !altMatches) continue;
    suggestions.push({
      asset,
      title: verified?.title || asset.alt_text || cleanMediaFileNameStem(asset.file_name),
      reason: verifiedMatch === 'verified-relationship' ? 'Cataloged content relationship' :
        verifiedMatch === 'exact-title' ? 'Unique cataloged title match' :
        verifiedMatch === 'verified-alias' ? 'Cataloged subject alias' :
        'CMS alt text matches exactly; verify subject and rights before selecting',
      relatedContentId: query.id || query.slug || null,
      matchSource: verifiedMatch || 'admin-review',
    });
  }
  if (suggestions.length > 1) {
    return suggestions.map((suggestion) => suggestion.matchSource === 'admin-review'
      ? { ...suggestion, reason: 'Multiple exact CMS alt-text matches; review each image' }
      : suggestion);
  }
  return suggestions;
}

function getAllActiveEntries(queryCards?: readonly CalendarCard[] | null): VerifiedMediaEntry[] {
  if (queryCards && queryCards.length > 0) {
    registerCalendarCardsForMedia(queryCards);
  }
  const combined = [...runtimeEntriesById.values(), ...VERIFIED_CONTENT_MEDIA_INDEX];
  // Sort by updatedAtMs descending so newer canonical uploads win on duplicate subjects
  combined.sort((a, b) => (b.updatedAtMs ?? 0) - (a.updatedAtMs ?? 0));
  return combined;
}

function isDomainCompatible(entryDomain: MediaDomain, queryDomain?: MediaDomain | 'any'): boolean {
  // Never match a singer portrait (`zemari`) unless explicitly querying for `zemari`
  if (queryDomain === 'zemari') {
    return entryDomain === 'zemari';
  }
  if (entryDomain === 'zemari') {
    return false;
  }
  if (!queryDomain || queryDomain === 'any' || queryDomain === 'play') {
    return true;
  }
  if (queryDomain === 'calendar') {
    return entryDomain === 'calendar' || entryDomain === 'hymn-section';
  }
  return entryDomain === queryDomain || entryDomain === 'calendar';
}

/**
 * Resolves the highest-priority image for any TewahedoDaily content item, observance,
 * feast, saint, fast, hymn collection/section, or game prompt.
 *
 * Selection Priority:
 * 1. `explicit-new-media`: Direct `content-media` storage path or public URL on the item.
 * 2. `verified-relationship`: Exact `sourceType + sourceId/sourceSlug` or verified `relatedIds`/`slug` match.
 * 3. `exact-title`: Exact Unicode-normalized or canonical Amharic title match (English, Amharic, or bilingual segment).
 * 4. `verified-alias`: Match against verified liturgical/bilingual alias list or honorific-stripped canonical title.
 * 5. `legacy-fallback`: Falls back to `/images/calendar-web/*.webp` ONLY when no new uploaded media matches.
 * 6. `none`: Cleanly returns `hasImage: false, imageUrl: null` when no match and no fallback exist.
 */
export function resolveMedia(query: MediaResolutionQuery): MediaResolutionResult {
  const allowLegacy = query.allowLegacyFallback !== false;
  const requestedFallback = query.legacyFallbackUrl?.trim() || null;
  const fallbackUrl = requestedFallback && isLocalAssetAvailable(requestedFallback) ? requestedFallback : null;
  const preservedTitle = query.title?.trim() || null;
  const preservedTitleAmharic = query.titleAmharic?.trim() || null;

  // ── Priority 1: Explicit new uploaded media path on the record ───────
  const explicitPath = query.explicitPath?.trim() || null;
  if (explicitPath && !isLegacyLocalMediaPath(explicitPath) && !DEPRIORITIZED_STORAGE_PATHS.has(explicitPath)) {
    const resolvedUrl = resolveContentMediaUrl(explicitPath);
    if (resolvedUrl) {
      return {
        hasImage: true,
        imageUrl: resolvedUrl,
        storagePath: explicitPath,
        title: preservedTitle,
        titleAmharic: preservedTitleAmharic,
        imagePosition: null,
        matchSource: 'explicit-new-media',
        matchedEntryId: query.id ?? null,
        fallbackUrl,
      };
    }
  }

  const entries = getAllActiveEntries(query.cards);
  const compatibleEntries = entries.filter((entry) =>
    isDomainCompatible(entry.domain, query.domain)
  );

  // ── Priority 2: Verified relationship / explicit content identifier ──
  const idCandidates = new Set<string>();
  if (query.id) idCandidates.add(normalizeUnicodeText(query.id));
  if (query.slug) idCandidates.add(normalizeUnicodeText(query.slug));
  if (query.sourceType && query.id) {
    idCandidates.add(normalizeUnicodeText(`${query.sourceType}-${query.id}`));
  }
  if (query.sourceType && query.slug) {
    idCandidates.add(normalizeUnicodeText(`${query.sourceType}-${query.slug}`));
  }

  if (idCandidates.size > 0) {
    for (const entry of compatibleEntries) {
      const entryIds = new Set<string>();
      entryIds.add(normalizeUnicodeText(entry.id));
      if (entry.sourceId) entryIds.add(normalizeUnicodeText(entry.sourceId));
      if (entry.sourceSlug) entryIds.add(normalizeUnicodeText(entry.sourceSlug));
      if (entry.slug) entryIds.add(normalizeUnicodeText(entry.slug));
      if (entry.relatedIds) {
        for (const relId of entry.relatedIds) {
          entryIds.add(normalizeUnicodeText(relId));
        }
      }

      for (const candidateId of idCandidates) {
        if (candidateId && entryIds.has(candidateId)) {
          const resolvedUrl = resolveContentMediaUrl(entry.storagePath);
          if (resolvedUrl) {
            return {
              hasImage: true,
              imageUrl: resolvedUrl,
              storagePath: entry.storagePath,
              title: preservedTitle ?? entry.title,
              titleAmharic: preservedTitleAmharic ?? entry.titleAmharic ?? null,
              imagePosition: entry.imagePosition ?? null,
              matchSource: 'verified-relationship',
              matchedEntryId: entry.id,
              fallbackUrl,
            };
          }
        }
      }
    }
  }

  // Gather candidate title phrases from query
  const rawQueryPhrases = [
    query.title,
    query.titleAmharic,
    query.altText,
  ].filter((v): v is string => Boolean(v && v.trim()));

  if (rawQueryPhrases.length > 0) {
    // ── Priority 3: Exact normalized title match (English, Amharic, or bilingual segment) ──
    const primaryCandidates = new Set<string>();
    const primaryAmharicCandidates = new Set<string>();
    const primaryCompactCandidates = new Set<string>();

    for (const phrase of rawQueryPhrases) {
      for (const candidate of extractTitleCandidates(phrase, { includeHonorificStripped: false })) {
        const norm = normalizeUnicodeText(candidate);
        const amhNorm = normalizeAmharicCanonical(candidate);
        const compactNorm = normalizeCompactCanonical(candidate);
        if (norm.length >= 2) primaryCandidates.add(norm);
        if (amhNorm.length >= 2) primaryAmharicCandidates.add(amhNorm);
        if (compactNorm.length >= 3) primaryCompactCandidates.add(compactNorm);
      }
    }

    const exactMatches = new Map<string, VerifiedMediaEntry>();
    for (const entry of compatibleEntries) {
      const entryPrimaryTitles = [
        entry.title,
        entry.titleAmharic,
        entry.altText,
      ].filter((v): v is string => Boolean(v && v.trim()));

      for (const entryPhrase of entryPrimaryTitles) {
        for (const entryCandidate of extractTitleCandidates(entryPhrase, { includeHonorificStripped: false })) {
          const entryNorm = normalizeUnicodeText(entryCandidate);
          const entryAmh = normalizeAmharicCanonical(entryCandidate);
          const entryCompact = normalizeCompactCanonical(entryCandidate);

          if (
            (entryNorm && primaryCandidates.has(entryNorm)) ||
            (entryAmh && primaryAmharicCandidates.has(entryAmh)) ||
            (entryCompact.length >= 4 && primaryCompactCandidates.has(entryCompact))
          ) {
            exactMatches.set(canonicalUploadPath(entry.storagePath), entry);
          }
        }
      }
    }
    if (exactMatches.size === 1) {
      const entry = exactMatches.values().next().value!;
      const resolvedUrl = resolveContentMediaUrl(entry.storagePath);
      if (resolvedUrl) return {
        hasImage: true, imageUrl: resolvedUrl, storagePath: entry.storagePath,
        title: preservedTitle ?? entry.title,
        titleAmharic: preservedTitleAmharic ?? entry.titleAmharic ?? null,
        imagePosition: entry.imagePosition ?? null, matchSource: 'exact-title',
        matchedEntryId: entry.id, fallbackUrl,
      };
    }
    // Several different images with the same title need an editor's decision.
    if (exactMatches.size > 1) {
      const ambiguousFallback = fallbackUrl ??
        (explicitPath && isLegacyLocalMediaPath(explicitPath) && isLocalAssetAvailable(explicitPath) ? explicitPath : null);
      return {
        hasImage: Boolean(allowLegacy && ambiguousFallback),
        imageUrl: allowLegacy ? ambiguousFallback : null,
        storagePath: null, title: preservedTitle, titleAmharic: preservedTitleAmharic,
        imagePosition: null, matchSource: allowLegacy && ambiguousFallback ? 'legacy-fallback' : 'none',
        matchedEntryId: null, fallbackUrl,
      };
    }

    // ── Priority 4: Verified alias & honorific-normalized canonical match ──
    const allQueryKeys = new Set<string>();
    const allQueryCompactKeys = new Set<string>();
    const allQueryTranslitKeys = new Set<string>();

    for (const phrase of rawQueryPhrases) {
      for (const candidate of extractTitleCandidates(phrase, { includeHonorificStripped: true })) {
        const amhNorm = normalizeAmharicCanonical(candidate);
        const compactNorm = normalizeCompactCanonical(candidate);
        const translitNorm = normalizeTransliterationKey(candidate);
        if (amhNorm.length >= 2) allQueryKeys.add(amhNorm);
        if (compactNorm.length >= 3) allQueryCompactKeys.add(compactNorm);
        if (translitNorm) allQueryTranslitKeys.add(translitNorm);
      }
    }

    for (const entry of compatibleEntries) {
      const aliasPool = [
        entry.title,
        entry.titleAmharic,
        entry.altText,
        cleanMediaFileNameStem(entry.fileName),
        ...(entry.aliases ?? []),
      ].filter((v): v is string => Boolean(v && v.trim()));

      for (const aliasPhrase of aliasPool) {
        for (const aliasCandidate of extractTitleCandidates(aliasPhrase, { includeHonorificStripped: true })) {
          const aliasAmh = normalizeAmharicCanonical(aliasCandidate);
          const aliasCompact = normalizeCompactCanonical(aliasCandidate);
          const aliasTranslit = normalizeTransliterationKey(aliasCandidate);

          if (
            (aliasAmh && allQueryKeys.has(aliasAmh)) ||
            (aliasCompact.length >= 4 && allQueryCompactKeys.has(aliasCompact)) ||
            (aliasTranslit && allQueryTranslitKeys.has(aliasTranslit))
          ) {
            const resolvedUrl = resolveContentMediaUrl(entry.storagePath);
            if (resolvedUrl) {
              return {
                hasImage: true,
                imageUrl: resolvedUrl,
                storagePath: entry.storagePath,
                title: preservedTitle ?? entry.title,
                titleAmharic: preservedTitleAmharic ?? entry.titleAmharic ?? null,
                imagePosition: entry.imagePosition ?? null,
                matchSource: 'verified-alias',
                matchedEntryId: entry.id,
                fallbackUrl,
              };
            }
          }
        }
      }
    }
  }

  // ── Priority 5: Legacy fallback (`/images/calendar-web/*` or explicit fallback) ──
  // A legacy local path whose file no longer ships is never selected (primary or fallback).
  const legacyRaw =
    fallbackUrl ??
    (explicitPath && isLegacyLocalMediaPath(explicitPath) ? explicitPath : null);
  const legacyCandidate = legacyRaw && isLocalAssetAvailable(legacyRaw) ? legacyRaw : null;

  if (allowLegacy && legacyCandidate) {
    return {
      hasImage: true,
      imageUrl: legacyCandidate,
      storagePath: null,
      title: preservedTitle,
      titleAmharic: preservedTitleAmharic,
      imagePosition: null,
      matchSource: 'legacy-fallback',
      matchedEntryId: null,
      fallbackUrl: legacyCandidate,
    };
  }

  // ── Priority 6: Graceful missing ────────────────────────────────────
  return {
    hasImage: false,
    imageUrl: null,
    storagePath: null,
    title: preservedTitle,
    titleAmharic: preservedTitleAmharic,
    imagePosition: null,
    matchSource: 'none',
    matchedEntryId: null,
    fallbackUrl,
  };
}

/**
 * Keeps a record's own stored image path (including an explicitly blank one) unless that path is a known-missing
 * upload, in which case the verified
 * catalog is consulted (never legacy art). Used by cards whose CMS row still points at a missing file.
 */
export function resolveRecordImagePath(
  storedPath: string | null | undefined,
  query: Omit<MediaResolutionQuery, 'explicitPath' | 'allowLegacyFallback'>,
): string | null {
  const stored = storedPath?.trim() || null;
  if (!stored || !isKnownMissingStoragePath(stored)) return stored; // blank paths stay blank (explicit editorial state)
  const resolved = resolveMedia({ ...query, allowLegacyFallback: false });
  return resolved.storagePath && !isKnownMissingStoragePath(resolved.storagePath) ? resolved.storagePath : stored;
}

/**
 * Convenience helper that returns the resolved image URL string (or fallback / empty string).
 */
export function resolveMediaUrl(query: MediaResolutionQuery): string | null {
  return resolveMedia(query).imageUrl;
}
