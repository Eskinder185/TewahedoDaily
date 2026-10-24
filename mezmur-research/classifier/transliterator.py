"""
Ethiopic (Amharic / Ge'ez) transliteration, title cleaning, singer separation,
homophone normalization, and slug generation for TewahedoDaily.
"""
from __future__ import annotations
import html
import re
import unicodedata
from typing import Dict, List, Optional, Set, Tuple

# Base consonants for standard Ethiopic rows (U+1200 to U+1357)
_ETHIOPIC_ROWS: List[Tuple[int, str]] = [
    (0x1200, "h"),
    (0x1208, "l"),
    (0x1210, "h"),
    (0x1218, "m"),
    (0x1220, "s"),
    (0x1228, "r"),
    (0x1230, "s"),
    (0x1238, "sh"),
    (0x1240, "k"),
    (0x1250, "k"),
    (0x1260, "b"),
    (0x1268, "v"),
    (0x1270, "t"),
    (0x1278, "ch"),
    (0x1280, "h"),
    (0x1290, "n"),
    (0x1298, "gn"),
    (0x12A0, ""),    # Glottal / vowel carrier (a, u, i, a, e, e, o)
    (0x12A8, "k"),
    (0x12B8, "h"),
    (0x12C8, "w"),
    (0x12D0, ""),    # Pharyngeal vowel carrier
    (0x12D8, "z"),
    (0x12E0, "zh"),
    (0x12E8, "y"),
    (0x12F0, "d"),
    (0x12F8, "d"),
    (0x1300, "j"),
    (0x1308, "g"),
    (0x1318, "g"),
    (0x1320, "t"),
    (0x1328, "ch"),
    (0x1330, "p"),
    (0x1338, "ts"),
    (0x1340, "ts"),
    (0x1348, "f"),
    (0x1350, "p"),
]

_VOWELS_STANDARD = ["e", "u", "i", "a", "e", "i", "o", "wa"]
_VOWELS_H_GLOTTAL = ["a", "u", "i", "a", "e", "i", "o", "wa"]

_CHAR_MAP: Dict[str, str] = {}
_SIXTH_ORDER_CONSONANT_MAP: Dict[str, str] = {}

for base_cp, cons in _ETHIOPIC_ROWS:
    is_vowel_carrier = cons == "" or base_cp in (0x1200, 0x1210, 0x1280)
    vowels = _VOWELS_H_GLOTTAL if is_vowel_carrier else _VOWELS_STANDARD
    for order in range(8):
        ch = chr(base_cp + order)
        v = vowels[order]
        if cons == "" and order == 5:
            _CHAR_MAP[ch] = "e"
        else:
            _CHAR_MAP[ch] = f"{cons}{v}"
            if order == 5 and cons:
                _SIXTH_ORDER_CONSONANT_MAP[ch] = cons

# Labiovelars (ቈ, ቘ, ኈ, ኰ, ዀ, ጐ)
_LABIOVELARS: List[Tuple[int, str]] = [
    (0x1248, "kw"),
    (0x1258, "kw"),
    (0x1288, "hw"),
    (0x12B0, "kw"),
    (0x12C0, "hw"),
    (0x1310, "gw"),
]
_LV_VOWELS = ["e", "", "i", "a", "e", "i"]
for base_cp, cons in _LABIOVELARS:
    for idx, v in enumerate(_LV_VOWELS):
        if v:
            ch = chr(base_cp + idx)
            _CHAR_MAP[ch] = f"{cons}{v}"
            if idx == 5:
                _SIXTH_ORDER_CONSONANT_MAP[ch] = cons

# Ethiopic punctuation -> space or standard punctuation
_PUNCT_MAP: Dict[str, str] = {
    "፡": " ",
    "።": ".",
    "፣": ",",
    "፤": ";",
    "፥": ":",
    "፦": ":",
    "፧": "?",
    "፨": " ",
}

# Homophone canonicalization map for Amharic deduplication
_HOMOPHONE_GROUPS: List[Tuple[int, List[int]]] = [
    (0x1200, [0x1210, 0x1280]),  # ሀ <- ሐ, ኀ
    (0x1230, [0x1220]),          # ሰ <- ሠ
    (0x12A0, [0x12D0]),          # አ <- ዐ
    (0x1338, [0x1340]),          # ጸ <- ፀ
]
_HOMOPHONE_MAP: Dict[str, str] = {}
for target_base, source_bases in _HOMOPHONE_GROUPS:
    for order in range(8):
        target_ch = chr(target_base + order)
        for src_base in source_bases:
            _HOMOPHONE_MAP[chr(src_base + order)] = target_ch
    _HOMOPHONE_MAP[chr(target_base + 3)] = chr(target_base)
    for src_base in source_bases:
        _HOMOPHONE_MAP[chr(src_base + 3)] = chr(target_base)


def has_ethiopic(text: Optional[str]) -> bool:
    if not text:
        return False
    return any(0x1200 <= ord(c) <= 0x137F for c in text)


def has_latin(text: Optional[str]) -> bool:
    if not text:
        return False
    return bool(re.search(r"[A-Za-z]{2,}", text))


def strip_emojis_and_symbols(text: str) -> str:
    """Remove emojis, dingbats, variation selectors, and decorative symbols while preserving Ethiopic, Latin, and basic punctuation."""
    out: List[str] = []
    for ch in text:
        cp = ord(ch)
        if 0xFE00 <= cp <= 0xFE0F or 0x200B <= cp <= 0x200F or cp == 0xFEFF:
            continue
        cat = unicodedata.category(ch)
        if cat in ("So", "Sk", "Cs", "Co", "Cn", "Cf") or ch in ("‼", "⁉", "❓", "❗", "•", "·", "★", "☆"):
            out.append(" ")
        else:
            out.append(ch)
    return "".join(out)


def transliterate_ethiopic(text: Optional[str]) -> str:
    """Deterministically transliterate Ethiopic script to readable English/Latin phonetics."""
    if not text:
        return ""
    cleaned = strip_emojis_and_symbols(html.unescape(text))
    n = len(cleaned)
    out: List[str] = []
    for idx, ch in enumerate(cleaned):
        next_ch = cleaned[idx + 1] if idx + 1 < n else " "
        is_word_end = not (0x1200 <= ord(next_ch) <= 0x137F or next_ch.isalnum())
        if is_word_end and ch in _SIXTH_ORDER_CONSONANT_MAP and idx > 0:
            # Word-final 6th-order consonant is silent in Amharic/Ge'ez (e.g. አማኑኤል -> Amanuel)
            out.append(_SIXTH_ORDER_CONSONANT_MAP[ch])
        elif ch in _CHAR_MAP:
            out.append(_CHAR_MAP[ch])
        elif ch in _PUNCT_MAP:
            out.append(_PUNCT_MAP[ch])
        elif 0x1200 <= ord(ch) <= 0x137F:
            out.append("")
        else:
            out.append(ch)
    joined = "".join(out)
    joined = re.sub(r"\s+", " ", joined).strip()
    words = []
    for w in joined.split(" "):
        w_clean = w.strip("-_|•/\\")
        if not w_clean:
            continue
        if w_clean.islower():
            words.append(w_clean.capitalize())
        else:
            words.append(w_clean)
    return " ".join(words)


def normalize_amharic_for_dedupe(text: Optional[str]) -> str:
    """Normalize Amharic text (homophones, punctuation, whitespace) for duplicate detection."""
    if not text:
        return ""
    s = strip_emojis_and_symbols(html.unescape(text)).strip()
    out: List[str] = []
    for ch in s:
        mapped = _HOMOPHONE_MAP.get(ch, ch)
        if 0x1200 <= ord(mapped) <= 0x137F or mapped.isalnum():
            out.append(mapped.lower())
        else:
            out.append(" ")
    return re.sub(r"\s+", " ", "".join(out)).strip()


_CHANNEL_NOISE_RE = re.compile(
    r"(?:@[\w\-\u1200-\u137F]+|#[\w\-\u1200-\u137F]+|"
    r"\b(?:21\s*media|21media\d*|mahtot\s*tube|mahtot|janderebaw\s*media|menker\s*mezmur\d*|"
    r"ziq\s*media|hanos\s*tube|tabor\s*media|nablis\s*media|quanquayenesh\s*media|"
    r"eregnaye\s*media|kendil\s*media|kendilmedia|azaria\s*tube|zema\s*semayat|"
    r"official\s*video|official\s*audio|official|new\s*orthodox\s*mezmur|ethiopian\s*orthodox\s*mezmur|"
    r"ethiopian\s*orthodox\s*tewahedo\s*mezmur|eotc\s*mezmur|new\s*mezmur|new|video|audio|lyrics|hd|4k)\b|"
    r"ማኅቶት\s*ቲዩብ|ሃያ\s*አንድ\s*ሚዲያ|ዚቅ\s*ሚዲያ|ዚቅ\s*ሚድያ|መንክር\s*መዝሙር|"
    r"ናብሊስ\s*ሚዲያ|ቋንቋዬነሽ\s*ሚዲያ|እረኛዬ\s*ሚዲያ|ሱላማጢስ\s*ሚዲያ|አዛርያ\s*tube|"
    r"አዲስ\s*መዝሙር|አዲስ\s*ዝማሬ|ድንቅ\s*ዝማሬ|ድንቅ\s*መዝሙር|ተወዳጁ\s*መዝሙር|የማይቆም\s*ዝማሬ|በኦዲዮ)",
    re.IGNORECASE,
)

_SINGER_PREFIX_RE = re.compile(
    r"^(?:በ)?(?:ሊቀ\s*መዘምራን|ዘማሪት|ዘማሪ|ዲያቆን|ዲ[/\\]ን|ቀሲስ|መጋቤ\s*ምሥጢር|መጋቤ\s*ምስጢር|መምህር|ሲስተር|አርቲስት|"
    r"zemarit|zemari|liqe\s*mezemran|like\s*mezemran|deacon|d[/\\]n|kesis|qesis|artist|by\s+zemari)\b",
    re.IGNORECASE,
)


def parse_source_title(
    raw_title: str,
    known_singers: Optional[List[str]] = None,
    channel_title: Optional[str] = None,
) -> Dict[str, str]:
    """
    Parse an eotcmedia / YouTube hymn title into:
      - amharic_title
      - transliteration_title
      - extracted_singer (if identifiable from title and not a channel)
    """
    if not raw_title:
        return {"amharic_title": "", "transliteration_title": "", "extracted_singer": ""}

    unescaped = html.unescape(raw_title)
    unescaped = unescaped.replace('\\"', '"').replace("\\'", "'")
    unescaped = strip_emojis_and_symbols(unescaped)

    # First check if there's an explicitly quoted hymn title, e.g. "እመቤታችን ባንቺ ምልጃ" or «...»
    quoted_amharic = ""
    for q_match in re.finditer(r'["“”«»\']([^"“”«»\']{3,80})["“”«»\']', unescaped):
        candidate = _CHANNEL_NOISE_RE.sub(" ", q_match.group(1)).strip(" -_|•.,:?!")
        if has_ethiopic(candidate) and not _SINGER_PREFIX_RE.search(candidate):
            quoted_amharic = re.sub(r"\s+", " ", candidate).strip()
            break

    # Split by pipe, double-pipe, question/exclamation delimiters, spaced Ethiopic colon/period, or spaced dash
    segments = [
        seg.strip()
        for seg in re.split(r"\s*(?:\|\||\|+|—|–|\s-\s|\s+፡\s+|።|\(|\)|\?|!)\s*", unescaped)
        if seg.strip()
    ]

    amharic_parts: List[str] = []
    latin_parts: List[str] = []
    extracted_singer = ""

    known_set = {s.strip().lower() for s in (known_singers or []) if s and s.strip()}
    chan_lower = (channel_title or "").strip().lower()
    generic_words = {"አዲስ", "መዝሙር", "ዝማሬ", "በኦዲዮ", "mezmur", "zemare"}

    for seg in segments:
        cleaned_seg = _CHANNEL_NOISE_RE.sub(" ", seg)
        cleaned_seg = re.sub(r'["“”«»]', " ", cleaned_seg)
        cleaned_seg = re.sub(r"\b20[12]\d\b", " ", cleaned_seg)
        cleaned_seg = re.sub(r"\s+", " ", cleaned_seg).strip(" -_|•.,:?!፡")
        if not cleaned_seg or cleaned_seg.lower() in generic_words:
            continue
        if chan_lower and cleaned_seg.lower() == chan_lower:
            continue

        # Check if this segment is primarily a singer attribution
        if _SINGER_PREFIX_RE.search(cleaned_seg) or cleaned_seg.lower() in known_set:
            if not extracted_singer and has_ethiopic(cleaned_seg):
                extracted_singer = re.sub(r"^በ(?=ዘማሪ|ሊቀ|ዲያቆን|ዲ/ን|ቀሲስ)", "", cleaned_seg).strip()
            continue

        # Check if segment contains inline "በዘማሪ ..." or "ዘማሪ ..." after the hymn title
        inline_singer_m = re.search(
            r"\s+(?:በ)?((?:ሊቀ\s*መዘምራን|ዘማሪት|ዘማሪ|ዲያቆን|ዲ/ን|ቀሲስ)\s+[\u1200-\u137F\s/]{3,45})$",
            cleaned_seg,
        )
        if inline_singer_m:
            if not extracted_singer:
                extracted_singer = inline_singer_m.group(1).strip()
            cleaned_seg = cleaned_seg[: inline_singer_m.start()].strip(" -_|•.,:?!")

        if not cleaned_seg:
            continue

        if has_ethiopic(cleaned_seg):
            if has_latin(cleaned_seg):
                eth_only = re.sub(r"[A-Za-z0-9@_/\\-]+", " ", cleaned_seg)
                eth_only = re.sub(r"\s+", " ", eth_only).strip(" -_|•.,:?!")
                lat_only = re.sub(r"[\u1200-\u137F]+", " ", cleaned_seg)
                lat_only = _CHANNEL_NOISE_RE.sub(" ", lat_only)
                lat_only = re.sub(r"\s+", " ", lat_only).strip(" -_|•.,:?!")
                if eth_only:
                    amharic_parts.append(eth_only)
                if lat_only and len(lat_only) >= 4:
                    latin_parts.append(lat_only)
            else:
                amharic_parts.append(cleaned_seg)
        elif has_latin(cleaned_seg) and len(cleaned_seg) >= 4:
            if not re.search(
                r"\b(zemari|zemarit|deacon|liqe|like\s+mezemran|by\s+|tube|media)\b",
                cleaned_seg,
                re.I,
            ):
                latin_parts.append(cleaned_seg)

    if quoted_amharic:
        amharic_title = quoted_amharic
    elif amharic_parts:
        amharic_title = amharic_parts[0]
    else:
        amharic_title = ""

    if latin_parts:
        translit_title = latin_parts[0]
    elif amharic_title:
        translit_title = transliterate_ethiopic(amharic_title)
    else:
        translit_title = transliterate_ethiopic(unescaped) or unescaped.strip()

    amharic_title = re.sub(r"\s+", " ", amharic_title).strip(" -_|•.,:?!/*';\"")
    translit_title = re.sub(r"\s+", " ", translit_title).strip(" -_|•.,:?!/*';\"")
    if (not translit_title or len(translit_title) < 3) and amharic_title:
        translit_title = transliterate_ethiopic(amharic_title)

    return {
        "amharic_title": amharic_title,
        "transliteration_title": translit_title,
        "extracted_singer": extracted_singer,
    }


_NOISY_LATIN_TITLE_RE = re.compile(
    r"^(?:eotc|ethiopi?an?\s*orthodox(?:\s*tewahedo)?(?:\s*mezmur)?|ortodox\s*mezemur|"
    r"orthodox\s*mezmur|new\s*mezmur|mezmur|by\s+[\w\s]+|"
    r"(?:deacon|di/?n|zemari|zemarit|kesis|qesis|liqe\s*mezemran|like\s*mezemran|track\s*\d+)\b.*)$",
    re.IGNORECASE,
)


def clean_transliteration_title(
    raw_translit: Optional[str],
    amharic_title: Optional[str],
    parsed_translit: Optional[str] = None,
) -> str:
    """
    Clean a candidate Latin/transliteration title and fall back to phonetic
    Ethiopic transliteration when the source Latin title is noisy or generic.
    """
    cand = strip_emojis_and_symbols(html.unescape(raw_translit or "")).strip()
    cand = re.sub(r"^[\s/*\"'«»\-_|•.,:;?!()\[\]]+|[\s/*\"'«»\-_|•.,:;?!()\[\]]+$", "", cand)
    cand = re.sub(r"\s+", " ", cand).strip()

    am = (amharic_title or "").strip()
    if am:
        if not cand or len(cand) < 3 or has_ethiopic(cand) or _NOISY_LATIN_TITLE_RE.match(cand):
            fallback = (parsed_translit or "").strip()
            if fallback and not _NOISY_LATIN_TITLE_RE.match(fallback) and len(fallback) >= 3:
                return fallback
            return transliterate_ethiopic(am)
    if not cand and parsed_translit:
        return parsed_translit.strip()
    return cand


SLUG_REGEX = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")


def generate_slug(
    transliteration_title: Optional[str],
    amharic_title: Optional[str] = None,
    fallback_id: Optional[str] = None,
    used_slugs: Optional[Set[str]] = None,
) -> str:
    """
    Generate a unique lowercase ASCII slug matching ^[a-z0-9]+(-[a-z0-9]+)*$
    (compatible with MezmurEditor.tsx and public.hymn_collections slug constraint).
    """
    source = (transliteration_title or "").strip()
    if not source or has_ethiopic(source) or len(source) < 3:
        source = transliterate_ethiopic(amharic_title or source)

    normalized = unicodedata.normalize("NFKD", source)
    ascii_str = normalized.encode("ascii", "ignore").decode("ascii").lower()
    slug = re.sub(r"[^a-z0-9]+", "-", ascii_str).strip("-")
    slug = re.sub(r"-{2,}", "-", slug)

    if not slug or len(slug) < 2:
        slug = f"mezmur-{re.sub(r'[^a-z0-9]+', '-', str(fallback_id or 'item').lower()).strip('-') or 'item'}"

    if len(slug) > 72:
        slug = slug[:72].rstrip("-")

    if used_slugs is not None:
        base = slug
        counter = 2
        if slug in used_slugs and fallback_id:
            fb = re.sub(r"[^a-z0-9]+", "-", str(fallback_id).lower()).strip("-")
            if fb:
                candidate = f"{base[:64].rstrip('-')}-{fb[:12].rstrip('-')}"
                if candidate not in used_slugs:
                    slug = candidate
        while slug in used_slugs:
            slug = f"{base[:68].rstrip('-')}-{counter}"
            counter += 1
        used_slugs.add(slug)

    return slug


def is_valid_slug(slug: Optional[str]) -> bool:
    if not slug:
        return False
    return bool(SLUG_REGEX.match(slug))
