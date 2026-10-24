"""
Canonical taxonomy definitions and validators for TewahedoDaily Mezmur research.
Aligned with src/lib/publicContent/taxonomy.ts, src/pages/admin/MezmurEditor.tsx,
public.mezmur_sections_import (56 live DB sections), and mezmur_sections_final.csv.
"""
from __future__ import annotations
import re
from typing import Dict, List, Optional, Set, Tuple

# Supported theological categories (Phase 5 + public.mezmur_category_links_import)
SUPPORTED_CATEGORIES: Tuple[str, ...] = (
    "Jesus Christ",
    "Virgin Mary",
    "Holy Trinity",
    "Holy Spirit",
    "Cross",
    "Angels",
    "Apostles",
    "Saints",
    "General",
    "Prayer",
    "Repentance",
    "Praise Worship",
    "Kidus Michael",
    "Kidus Gabriel",
    "Kidus Yared",
    "Kidus Estifanos Saint Stephen",
    "Abune Tekle Haymanot",
    "Abune Gebre Menfes Kidus",
)

CATEGORY_ALIASES: Dict[str, str] = {
    "jesus christ": "Jesus Christ",
    "christ": "Jesus Christ",
    "medhanealem": "Jesus Christ",
    "amanuel": "Jesus Christ",
    "virgin mary": "Virgin Mary",
    "st mary": "Virgin Mary",
    "st. mary": "Virgin Mary",
    "mary": "Virgin Mary",
    "emebetachin": "Virgin Mary",
    "dingil maryam": "Virgin Mary",
    "kidist dingil maryam": "Virgin Mary",
    "holy trinity": "Holy Trinity",
    "trinity": "Holy Trinity",
    "silassie": "Holy Trinity",
    "kidist silassie": "Holy Trinity",
    "holy spirit": "Holy Spirit",
    "paraclete": "Holy Spirit",
    "menfes kidus": "Holy Spirit",
    "cross": "Cross",
    "holy cross": "Cross",
    "meskel": "Cross",
    "angels": "Angels",
    "holy angels": "Angels",
    "kidus uriel": "Angels",
    "st uriel": "Angels",
    "st. uriel": "Angels",
    "kidus raphael": "Angels",
    "st raphael": "Angels",
    "st. raphael": "Angels",
    "kidus raguel": "Angels",
    "kidus fanuel": "Angels",
    "apostles": "Apostles",
    "hawariat": "Apostles",
    "saints": "Saints",
    "martyrs": "Saints",
    "prophets": "Saints",
    "kidus giorgis": "Saints",
    "st george": "Saints",
    "st. george": "Saints",
    "kidist arsema": "Saints",
    "st arsema": "Saints",
    "st. arsema": "Saints",
    "yohannes metmek": "Saints",
    "yohannes metmek / john the baptist": "Saints",
    "general": "General",
    "prayer": "Prayer",
    "tselot": "Prayer",
    "repentance": "Repentance",
    "nisiha": "Repentance",
    "praise worship": "Praise Worship",
    "praise / worship": "Praise Worship",
    "praise": "Praise Worship",
    "worship": "Praise Worship",
    "general worship": "Praise Worship",
    "salvation": "Jesus Christ",
    "kidus michael": "Kidus Michael",
    "st michael": "Kidus Michael",
    "st. michael": "Kidus Michael",
    "kidus gabriel": "Kidus Gabriel",
    "st gabriel": "Kidus Gabriel",
    "st. gabriel": "Kidus Gabriel",
    "kidus yared": "Kidus Yared",
    "st yared": "Kidus Yared",
    "st. yared": "Kidus Yared",
    "kidus estifanos saint stephen": "Kidus Estifanos Saint Stephen",
    "kidus estifanos / saint stephen": "Kidus Estifanos Saint Stephen",
    "kidus estifanos": "Kidus Estifanos Saint Stephen",
    "st stephen": "Kidus Estifanos Saint Stephen",
    "abune tekle haymanot": "Abune Tekle Haymanot",
    "abune teklehaymanot": "Abune Tekle Haymanot",
    "st tekle haymanot": "Abune Tekle Haymanot",
    "abune gebre menfes kidus": "Abune Gebre Menfes Kidus",
    "abune gebremenfes kidus": "Abune Gebre Menfes Kidus",
    "abo": "Abune Gebre Menfes Kidus",
}

# Supported liturgical occasions (Phase 6 + src/lib/publicContent/taxonomy.ts)
SUPPORTED_OCCASIONS: Tuple[str, ...] = (
    "Gena",
    "Timket",
    "Meskel",
    "Hosanna",
    "Siklet",
    "Tinsae",
    "Erget",
    "Pentecost",
    "Debre Tabor",
    "Filseta",
    "Kidane Mihret",
    "Lideta Maryam",
    "Abiy Tsom",
    "Tsome Nineveh",
    "Tsome Nebiyat",
    "Tsome Hawariat",
    "Holy Week",
    "New Year / Enkutatash",
    "Annual Saint Feast",
    "Wedding",
    "Baptism",
    "Funeral / Memorial",
    "Communion",
    "General / Anytime",
)

OCCASION_ALIASES: Dict[str, str] = {
    "gena": "Gena",
    "lidet": "Gena",
    "nativity": "Gena",
    "christmas": "Gena",
    "timket": "Timket",
    "timkat": "Timket",
    "epiphany": "Timket",
    "meskel": "Meskel",
    "finding of the true cross": "Meskel",
    "hosanna": "Hosanna",
    "palm sunday": "Hosanna",
    "siklet": "Siklet",
    "good friday": "Siklet",
    "crucifixion": "Siklet",
    "tinsae": "Tinsae",
    "fasika": "Tinsae",
    "resurrection": "Tinsae",
    "easter": "Tinsae",
    "erget": "Erget",
    "ascension": "Erget",
    "pentecost": "Pentecost",
    "paraclete": "Pentecost",
    "peraklitos": "Pentecost",
    "debre tabor": "Debre Tabor",
    "transfiguration": "Debre Tabor",
    "buhe": "Debre Tabor",
    "filseta": "Filseta",
    "kidane mihret": "Kidane Mihret",
    "kidane mehret": "Kidane Mihret",
    "lideta maryam": "Lideta Maryam",
    "lideta": "Lideta Maryam",
    "abiy tsom": "Abiy Tsom",
    "great lent": "Abiy Tsom",
    "tsome nineveh": "Tsome Nineveh",
    "nineveh": "Tsome Nineveh",
    "tsome nebiyat": "Tsome Nebiyat",
    "fast of the prophets": "Tsome Nebiyat",
    "tsome hawariat": "Tsome Hawariat",
    "fast of the apostles": "Tsome Hawariat",
    "holy week": "Holy Week",
    "himamat": "Holy Week",
    "new year / enkutatash": "New Year / Enkutatash",
    "new year": "New Year / Enkutatash",
    "enkutatash": "New Year / Enkutatash",
    "annual saint feast": "Annual Saint Feast",
    "saint feast": "Annual Saint Feast",
    "wedding": "Wedding",
    "serg": "Wedding",
    "baptism": "Baptism",
    "funeral / memorial": "Funeral / Memorial",
    "funeral": "Funeral / Memorial",
    "memorial": "Funeral / Memorial",
    "communion": "Communion",
    "kurban": "Communion",
    "general / anytime": "General / Anytime",
    "general": "General / Anytime",
    "anytime": "General / Anytime",
}

SUPPORTED_LANGUAGES: Tuple[str, ...] = (
    "amharic",
    "geez",
    "english",
    "oromo",
    "bilingual",
)

SUPPORTED_FORMS: Tuple[str, ...] = (
    "mezmur",
    "werb",
)

# Exact 56 section_slug values in public.mezmur_sections_import (live Supabase database)
DB_HYMN_SECTIONS: Dict[str, Tuple[str, str, str]] = {
    "saint-michael": ("angels-saints", "St. Michael", "angel"),
    "martyrs": ("angels-saints", "Martyrs", "saint"),
    "saint-arsema": ("angels-saints", "St. Arsema", "saint"),
    "saint-george": ("angels-saints", "St. George", "saint"),
    "saint-uriel": ("angels-saints", "St. Uriel", "angel"),
    "saint-raphael": ("angels-saints", "St. Raphael", "angel"),
    "saint-gabriel": ("angels-saints", "St. Gabriel", "angel"),
    "holy-angels": ("angels-saints", "Holy Angels", "angel"),
    "apostles": ("angels-saints", "Apostles", "saint"),
    "saints-general": ("angels-saints", "Saints", "saint"),
    "saint-stephen": ("angels-saints", "St. Stephen", "saint"),
    "abune-tekle-haymanot": ("angels-saints", "Abune Tekle Haymanot", "saint"),
    "abune-gebre-menfes-kidus": ("angels-saints", "Abune Gebre Menfes Kidus", "saint"),
    "saint-yared": ("angels-saints", "St. Yared", "saint"),
    "english-language": ("english-mezmur", "English", "language"),
    "bilingual-language": ("english-mezmur", "Bilingual", "language"),
    "holidays-meskel": ("holidays-feasts", "Meskel / Holy Cross", "occasion"),
    "holidays-pentecost": ("holidays-feasts", "Pentecost", "occasion"),
    "holidays-kidane-mihret": ("holidays-feasts", "Kidane Mihret", "occasion"),
    "holidays-lideta-maryam": ("holidays-feasts", "Lideta Maryam", "occasion"),
    "holidays-annunciation": ("holidays-feasts", "Annunciation / Bisrate Gabriel", "occasion"),
    "holidays-holy-week": ("holidays-feasts", "Holy Week", "occasion"),
    "holidays-hosanna": ("holidays-feasts", "Hosanna / Palm Sunday", "occasion"),
    "holidays-new-year": ("holidays-feasts", "New Year / Enkutatash", "occasion"),
    "holidays-gena": ("holidays-feasts", "Christmas / Gena", "occasion"),
    "holidays-timket": ("holidays-feasts", "Timkat / Epiphany", "occasion"),
    "holidays-tinsae": ("holidays-feasts", "Resurrection / Tinsae", "occasion"),
    "holidays-debre-tabor": ("holidays-feasts", "Transfiguration / Debre Tabor", "occasion"),
    "holidays-filseta": ("holidays-feasts", "Filseta / Assumption", "occasion"),
    "holidays-good-friday": ("holidays-feasts", "Good Friday / Siklet", "occasion"),
    "christ-hymns": ("jesus-christ", "Christ Hymns", "subject"),
    "christ-gena": ("jesus-christ", "Gena / Nativity", "occasion"),
    "christ-timket": ("jesus-christ", "Timkat / Baptism", "occasion"),
    "christ-hosanna": ("jesus-christ", "Hosanna", "occasion"),
    "christ-passion-crucifixion": ("jesus-christ", "Passion / Crucifixion", "occasion"),
    "christ-tinsae": ("jesus-christ", "Tinsae / Resurrection", "occasion"),
    "christ-debre-tabor": ("jesus-christ", "Debre Tabor / Transfiguration", "occasion"),
    "praise-worship": ("praise-general", "Praise & Worship", "subject"),
    "general-mezmur": ("praise-general", "General / Anytime", "general"),
    "prayer": ("praise-general", "Prayer", "subject"),
    "holy-trinity": ("praise-general", "Holy Trinity", "subject"),
    "holy-spirit": ("praise-general", "Holy Spirit", "subject"),
    "holy-cross": ("praise-general", "Holy Cross", "subject"),
    "wereb": ("praise-general", "Wereb", "general"),
    "repentance": ("repentance-fasting", "Repentance", "subject"),
    "general-fasting": ("repentance-fasting", "General Fasting / Lent", "general"),
    "repentance-holy-week": ("repentance-fasting", "Holy Week", "occasion"),
    "wedding": ("sacraments-church-life", "Wedding", "sacrament"),
    "communion": ("sacraments-church-life", "Communion", "sacrament"),
    "youth": ("sacraments-church-life", "Youth", "general"),
    "virgin-mary-hymns": ("virgin-mary", "St. Mary Hymns", "subject"),
    "virgin-mary-lideta": ("virgin-mary", "Lideta Maryam", "occasion"),
    "virgin-mary-filseta": ("virgin-mary", "Filseta", "occasion"),
    "virgin-mary-kidane-mihret": ("virgin-mary", "Kidane Mihret", "occasion"),
    "virgin-mary-gena": ("virgin-mary", "Nativity / Gena", "occasion"),
    "virgin-mary-annunciation": ("virgin-mary", "Annunciation / Bisrate Gabriel", "occasion"),
}

# Local CSV sections from mezmur_sections_final.csv (combined with DB_HYMN_SECTIONS for backward compatibility)
LEGACY_CSV_HYMN_SECTIONS: Dict[str, Tuple[str, str, str]] = {
    "meskel": ("holidays-feasts", "Meskel / Holy Cross", "occasion"),
    "hosanna": ("holidays-feasts", "Hosanna / Palm Sunday", "occasion"),
    "enkutatash": ("holidays-feasts", "Enkutatash / New Year", "occasion"),
    "gena": ("holidays-feasts", "Gena / Christmas", "occasion"),
    "timkat": ("holidays-feasts", "Timkat / Epiphany", "occasion"),
    "tinsae": ("holidays-feasts", "Tinsae / Resurrection", "occasion"),
    "debre-tabor": ("holidays-feasts", "Debre Tabor / Transfiguration", "occasion"),
    "filseta": ("holidays-feasts", "Filseta", "occasion"),
    "ascension": ("holidays-feasts", "Ascension", "occasion"),
    "pentecost": ("holidays-feasts", "Pentecost", "occasion"),
    "holy-week": ("holidays-feasts", "Holy Week", "occasion"),
    "good-friday": ("holidays-feasts", "Good Friday", "occasion"),
    "bisrate-gabriel": ("holidays-feasts", "Annunciation / Bisrate Gabriel", "occasion"),
    "nineveh": ("holidays-feasts", "Nineveh", "occasion"),
    "st-michael": ("angels-saints", "St. Michael", "saint"),
    "st-gabriel": ("angels-saints", "St. Gabriel", "angel"),
    "st-uriel": ("angels-saints", "St. Uriel", "angel"),
    "st-raphael": ("angels-saints", "St. Raphael", "angel"),
    "st-george": ("angels-saints", "St. George", "saint"),
    "st-arsema": ("angels-saints", "St. Arsema", "saint"),
    "prophets": ("angels-saints", "Prophets", "saint"),
    "general-saints": ("angels-saints", "General Saints", "saint"),
    "mary-general": ("virgin-mary", "St. Mary Praise", "subject"),
    "lideta-maryam": ("virgin-mary", "Lideta Maryam", "occasion"),
    "marian-feasts": ("virgin-mary", "Other Marian Feasts", "occasion"),
    "christ-general": ("jesus-christ", "Praise of Christ", "subject"),
    "passion": ("jesus-christ", "Passion / Crucifixion", "occasion"),
    "abiy-tsom": ("repentance-fasting", "Abiy Tsom", "occasion"),
    "wednesday-friday": ("repentance-fasting", "Wednesday & Friday", "occasion"),
    "english": ("english-mezmur", "English", "language"),
    "bilingual": ("english-mezmur", "Bilingual", "language"),
    "baptism": ("sacraments-church-life", "Baptism", "sacrament"),
    "funeral": ("sacraments-church-life", "Funeral", "sacrament"),
    "sunday-school": ("sacraments-church-life", "Sunday School", "general"),
    "church-worship": ("sacraments-church-life", "Church Worship", "general"),
    "children-youth": ("sacraments-church-life", "Children & Youth", "general"),
    "general-praise": ("praise-general", "General Praise", "general"),
    "short-hymns": ("praise-general", "Short Hymns", "general"),
    "holiday-wereb": ("praise-general", "Various Holidays Wereb", "general"),
    "general-worship": ("praise-general", "General Worship", "general"),
}

HYMN_SECTIONS: Dict[str, Tuple[str, str, str]] = {
    **LEGACY_CSV_HYMN_SECTIONS,
    **DB_HYMN_SECTIONS,
}

# Map legacy CSV section slugs -> exact live Supabase public.mezmur_sections_import slugs
SECTION_TO_DB_SLUGS: Dict[str, List[str]] = {
    "meskel": ["holidays-meskel", "holy-cross"],
    "hosanna": ["holidays-hosanna", "christ-hosanna"],
    "enkutatash": ["holidays-new-year"],
    "gena": ["holidays-gena", "christ-gena"],
    "timkat": ["holidays-timket", "christ-timket"],
    "tinsae": ["holidays-tinsae", "christ-tinsae"],
    "debre-tabor": ["holidays-debre-tabor", "christ-debre-tabor"],
    "filseta": ["holidays-filseta", "virgin-mary-filseta"],
    "ascension": ["christ-hymns"],
    "pentecost": ["holidays-pentecost", "holy-spirit"],
    "holy-week": ["holidays-holy-week", "repentance-holy-week"],
    "good-friday": ["holidays-good-friday", "christ-passion-crucifixion"],
    "bisrate-gabriel": ["holidays-annunciation", "virgin-mary-annunciation"],
    "nineveh": ["general-fasting"],
    "st-michael": ["saint-michael"],
    "st-gabriel": ["saint-gabriel"],
    "st-uriel": ["saint-uriel"],
    "st-raphael": ["saint-raphael"],
    "st-george": ["saint-george"],
    "st-arsema": ["saint-arsema"],
    "prophets": ["saints-general"],
    "general-saints": ["saints-general"],
    "mary-general": ["virgin-mary-hymns"],
    "lideta-maryam": ["holidays-lideta-maryam", "virgin-mary-lideta"],
    "marian-feasts": ["virgin-mary-hymns"],
    "christ-general": ["christ-hymns"],
    "passion": ["christ-passion-crucifixion", "holidays-good-friday"],
    "abiy-tsom": ["general-fasting", "repentance"],
    "wednesday-friday": ["general-fasting"],
    "english": ["english-language"],
    "bilingual": ["bilingual-language"],
    "baptism": ["holidays-timket"],
    "funeral": ["repentance"],
    "sunday-school": ["youth"],
    "church-worship": ["praise-worship"],
    "children-youth": ["youth"],
    "general-praise": ["praise-worship"],
    "short-hymns": ["general-mezmur"],
    "holiday-wereb": ["wereb"],
    "general-worship": ["general-mezmur"],
}

VALID_DB_SECTION_SLUGS: Set[str] = set(DB_HYMN_SECTIONS.keys())
VALID_SECTION_SLUGS: Set[str] = set(HYMN_SECTIONS.keys())


def _norm_key(val: Optional[str]) -> str:
    if not val:
        return ""
    s = re.sub(r"[_/\\-]+", " ", str(val).strip().lower())
    return re.sub(r"\s+", " ", s)


def canonicalize_category(raw: Optional[str]) -> Optional[str]:
    if not raw:
        return None
    trimmed = str(raw).strip()
    if trimmed in SUPPORTED_CATEGORIES:
        return trimmed
    key = _norm_key(trimmed)
    for cat in SUPPORTED_CATEGORIES:
        if _norm_key(cat) == key:
            return cat
    return CATEGORY_ALIASES.get(key)


def canonicalize_occasion(raw: Optional[str]) -> Optional[str]:
    if not raw:
        return None
    trimmed = str(raw).strip()
    if trimmed in SUPPORTED_OCCASIONS:
        return trimmed
    key = _norm_key(trimmed)
    for occ in SUPPORTED_OCCASIONS:
        if _norm_key(occ) == key:
            return occ
    return OCCASION_ALIASES.get(key)


def occasion_to_slug(occasion: str) -> str:
    canonical = canonicalize_occasion(occasion) or occasion
    slug = re.sub(r"[^a-z0-9]+", "-", canonical.lower()).strip("-")
    return slug


def category_to_slug(category: str) -> str:
    canonical = canonicalize_category(category) or category
    slug = re.sub(r"[^a-z0-9]+", "-", canonical.lower()).strip("-")
    return slug


def canonicalize_language(raw: Optional[str]) -> str:
    if not raw:
        return "amharic"
    v = _norm_key(raw)
    if v in ("amharic", "am", "አማርኛ"):
        return "amharic"
    if v in ("geez", "ge'ez", "gez", "ግዕዝ"):
        return "geez"
    if v in ("english", "en"):
        return "english"
    if v in ("oromo", "om", "afaan oromoo", "afaan oromo"):
        return "oromo"
    if v in ("bilingual",):
        return "bilingual"
    return "amharic"


def canonicalize_form(raw: Optional[str]) -> str:
    if not raw:
        return "mezmur"
    v = _norm_key(raw)
    if v in ("werb", "wereb", "ወረብ"):
        return "werb"
    return "mezmur"


def filter_valid_sections(section_slugs: List[str]) -> List[str]:
    seen: Set[str] = set()
    out: List[str] = []
    for s in section_slugs:
        slug = str(s).strip().lower()
        if slug in VALID_SECTION_SLUGS and slug not in seen:
            seen.add(slug)
            out.append(slug)
    return out


def map_to_db_sections(section_slugs: List[str]) -> List[str]:
    """Map any section slug list to exact public.mezmur_sections_import DB slugs."""
    seen: Set[str] = set()
    out: List[str] = []
    for s in section_slugs:
        slug = str(s).strip().lower()
        if slug in VALID_DB_SECTION_SLUGS:
            if slug not in seen:
                seen.add(slug)
                out.append(slug)
        elif slug in SECTION_TO_DB_SLUGS:
            for mapped in SECTION_TO_DB_SLUGS[slug]:
                if mapped in VALID_DB_SECTION_SLUGS and mapped not in seen:
                    seen.add(mapped)
                    out.append(mapped)
    return out


def validate_taxonomy_record(record: Dict[str, object]) -> List[str]:
    """Validate that a classified record uses only canonical TewahedoDaily taxonomy."""
    errors: List[str] = []
    lang = str(record.get("language") or "")
    if lang not in SUPPORTED_LANGUAGES:
        errors.append(f"Invalid language: {lang!r}")

    form = str(record.get("form") or "")
    if form not in SUPPORTED_FORMS:
        errors.append(f"Invalid form: {form!r}")

    cat = str(record.get("category") or record.get("theological_category") or "")
    if cat and cat not in SUPPORTED_CATEGORIES:
        errors.append(f"Invalid category: {cat!r}")

    occ = str(record.get("primary_occasion") or "")
    if occ and occ not in SUPPORTED_OCCASIONS:
        errors.append(f"Invalid primary_occasion: {occ!r}")

    add_occ_raw = str(record.get("additional_occasions") or "").strip()
    if add_occ_raw:
        for part in [p.strip() for p in add_occ_raw.split("|") if p.strip()]:
            if part not in SUPPORTED_OCCASIONS:
                errors.append(f"Invalid additional_occasion: {part!r}")

    sections_raw = str(record.get("hymn_sections") or "").strip()
    if sections_raw:
        for sec in [p.strip() for p in sections_raw.split("|") if p.strip()]:
            if sec not in VALID_SECTION_SLUGS:
                errors.append(f"Invalid hymn_section: {sec!r}")

    return errors
