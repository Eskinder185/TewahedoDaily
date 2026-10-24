"""
Evidence-based Ethiopian Orthodox Tewahedo Mezmur classification engine
and Antigravity Gemini batch classification persistence & validation.
"""
from __future__ import annotations
import json
import re
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

from .taxonomy import (
    SUPPORTED_CATEGORIES,
    SUPPORTED_FORMS,
    SUPPORTED_LANGUAGES,
    SUPPORTED_OCCASIONS,
    VALID_SECTION_SLUGS,
    canonicalize_category,
    canonicalize_form,
    canonicalize_language,
    canonicalize_occasion,
    filter_valid_sections,
    map_to_db_sections,
    validate_taxonomy_record,
)
from .transliterator import (
    clean_transliteration_title,
    has_ethiopic,
    has_latin,
    parse_source_title,
)

# Map eotcmedia language IDs -> TewahedoDaily languages
SOURCE_LANG_ID_MAP: Dict[int, str] = {
    1: "amharic",
    2: "english",
    3: "geez",
    4: "amharic",  # Tigrigna flagged for language review since CMS enum is amharic/geez/english/oromo/bilingual
    5: "oromo",
    6: "amharic",
    7: "amharic",
}

# Map eotcmedia subcategory names (Amharic/English/Oromo/Tigrigna) -> (category, primary_occasion, form, sections)
SOURCE_SUBCAT_MAP: Dict[str, Tuple[Optional[str], Optional[str], Optional[str], List[str]]] = {
    # Repentance
    "የንስሃ": ("Repentance", "Abiy Tsom", "mezmur", ["repentance", "abiy-tsom"]),
    "repentance": ("Repentance", "Abiy Tsom", "mezmur", ["repentance", "abiy-tsom"]),
    "ናይ ንስሓ": ("Repentance", "Abiy Tsom", "mezmur", ["repentance"]),
    "tawbaa": ("Repentance", "Abiy Tsom", "mezmur", ["repentance"]),
    # Wereb
    "ወረብ": (None, None, "werb", ["wereb"]),
    "wereb": (None, None, "werb", ["wereb"]),
    # Praise / Drumming / Begena
    "የከበሮ / የጭብጨባ": ("Praise Worship", "General / Anytime", "mezmur", ["general-praise"]),
    "drumming / clapping": ("Praise Worship", "General / Anytime", "mezmur", ["general-praise"]),
    "የበገና": ("Repentance", "Abiy Tsom", "mezmur", ["repentance", "general-fasting"]),
    "harp": ("Repentance", "Abiy Tsom", "mezmur", ["repentance"]),
    # Subjects
    "የእግዚአብሔር": ("Jesus Christ", "General / Anytime", "mezmur", ["christ-general", "general-praise"]),
    "god": ("Jesus Christ", "General / Anytime", "mezmur", ["christ-general", "general-praise"]),
    "የእመቤታችን": ("Virgin Mary", "General / Anytime", "mezmur", ["mary-general"]),
    "st. mary": ("Virgin Mary", "General / Anytime", "mezmur", ["mary-general"]),
    "ናይ እመቤትና": ("Virgin Mary", "General / Anytime", "mezmur", ["mary-general"]),
    "foon maryaam": ("Virgin Mary", "General / Anytime", "mezmur", ["mary-general"]),
    "የሚካኤል": ("Kidus Michael", "Annual Saint Feast", "mezmur", ["st-michael", "holy-angels"]),
    "st. michael": ("Kidus Michael", "Annual Saint Feast", "mezmur", ["st-michael", "holy-angels"]),
    "foon miikaa’eel": ("Kidus Michael", "Annual Saint Feast", "mezmur", ["st-michael", "holy-angels"]),
    "የገብርኤል": ("Kidus Gabriel", "Annual Saint Feast", "mezmur", ["st-gabriel", "holy-angels"]),
    "st. gabriel": ("Kidus Gabriel", "Annual Saint Feast", "mezmur", ["st-gabriel", "holy-angels"]),
    "foon gabireel": ("Kidus Gabriel", "Annual Saint Feast", "mezmur", ["st-gabriel", "holy-angels"]),
    "የጊዮርጊስ": ("Saints", "Annual Saint Feast", "mezmur", ["st-george", "martyrs", "general-saints"]),
    "st. george": ("Saints", "Annual Saint Feast", "mezmur", ["st-george", "martyrs", "general-saints"]),
    "የአርሴማ": ("Saints", "Annual Saint Feast", "mezmur", ["st-arsema", "martyrs", "general-saints"]),
    "st. arsema": ("Saints", "Annual Saint Feast", "mezmur", ["st-arsema", "martyrs", "general-saints"]),
    "የቤተ ክርስቲያን": ("General", "General / Anytime", "mezmur", ["church-worship", "general-worship"]),
    # Feasts
    "የአዲስ ዓመት": ("Praise Worship", "New Year / Enkutatash", "mezmur", ["enkutatash"]),
    "new year": ("Praise Worship", "New Year / Enkutatash", "mezmur", ["enkutatash"]),
    "የልደት": ("Jesus Christ", "Gena", "mezmur", ["gena", "christ-general"]),
    "nativity": ("Jesus Christ", "Gena", "mezmur", ["gena", "christ-general"]),
    "ናይ ልደት": ("Jesus Christ", "Gena", "mezmur", ["gena", "christ-general"]),
    "የጥምቀት": ("Jesus Christ", "Timket", "mezmur", ["timkat", "christ-general"]),
    "baptism": ("Jesus Christ", "Timket", "mezmur", ["timkat", "christ-general"]),
    "የትንሳኤ": ("Jesus Christ", "Tinsae", "mezmur", ["tinsae", "christ-general"]),
    "resurrection": ("Jesus Christ", "Tinsae", "mezmur", ["tinsae", "christ-general"]),
    "du'aa ka'uu": ("Jesus Christ", "Tinsae", "mezmur", ["tinsae", "christ-general"]),
    "የእርገት": ("Jesus Christ", "Erget", "mezmur", ["ascension", "christ-general"]),
    "ascension": ("Jesus Christ", "Erget", "mezmur", ["ascension", "christ-general"]),
    "የመስቀል": ("Cross", "Meskel", "mezmur", ["meskel"]),
    "finding of the true cross": ("Cross", "Meskel", "mezmur", ["meskel"]),
    "የጰራቅሊጦስ": ("Holy Spirit", "Pentecost", "mezmur", ["pentecost"]),
    "paraclete": ("Holy Spirit", "Pentecost", "mezmur", ["pentecost"]),
    "የስቅለት": ("Jesus Christ", "Siklet", "mezmur", ["good-friday", "passion", "holy-week"]),
    "crucifixion": ("Jesus Christ", "Siklet", "mezmur", ["good-friday", "passion", "holy-week"]),
}

# Specific devoted categories take precedence over generic Angels / Saints categories
SPECIFIC_DEVOTED_CATEGORIES: Set[str] = {
    "Kidus Michael",
    "Kidus Gabriel",
    "Kidus Yared",
    "Kidus Estifanos Saint Stephen",
    "Abune Tekle Haymanot",
    "Abune Gebre Menfes Kidus",
}

# Evidence-based keyword rules for Ethiopian Orthodox theological categories
# Ordered so specific archangels/saints are checked before generic Angels/Saints
_CATEGORY_EVIDENCE_RULES: List[Tuple[re.Pattern[str], str, List[str], Optional[str]]] = [
    (
        re.compile(r"(ሥላሴ|ስላሴ|ቅድስት\s*ሥላሴ|አብ\s*ወልድ\s*መንፈስ\s*ቅዱስ|trinity|selassie|silassie)", re.I),
        "Holy Trinity",
        ["holy-trinity", "general-praise", "church-worship"],
        None,
    ),
    (
        re.compile(r"(ጰራቅሊጦስ|መንፈስ\s*ቅዱስ|holy\s*spirit|paraclete)", re.I),
        "Holy Spirit",
        ["holy-spirit", "pentecost"],
        "Pentecost",
    ),
    (
        re.compile(r"(ሚካኤል|michael|mikael|ባሕራን)", re.I),
        "Kidus Michael",
        ["st-michael", "holy-angels"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(ገብርኤል|gabriel|gebriel|ቂርቆስና\s*ኢየሉጣ|ቂርቆስ|ብሥራተ\s*ገብርኤል)", re.I),
        "Kidus Gabriel",
        ["st-gabriel", "holy-angels"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(ቅዱስ\s*ያሬድ|ማኅሌታይ\s*ያሬድ|kidus\s*yared|st\.?\s*yared)", re.I),
        "Kidus Yared",
        ["saint-yared", "general-saints", "church-worship"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(እስጢፋኖስ|ቀዳሜ\s*ሰማዕት|estifanos|stephen)", re.I),
        "Kidus Estifanos Saint Stephen",
        ["saint-stephen", "martyrs", "general-saints"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(ተክለ\s*ሃይማኖት|ተክለሃይማኖት|ተክልዬ|ደብረ\s*ሊባኖስ|tekle\s*haymanot|teklehaymanot)", re.I),
        "Abune Tekle Haymanot",
        ["abune-tekle-haymanot", "general-saints"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(ገብረ\s*መንፈስ\s*ቅዱስ|አቡነ\s*አቦ|አቦ\s*ጻድቁ|ዝቋላ|gebre\s*menfes\s*kidus)", re.I),
        "Abune Gebre Menfes Kidus",
        ["abune-gebre-menfes-kidus", "general-saints"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(ዑራኤል|ኡራኤል|uriel|urael)", re.I),
        "Angels",
        ["st-uriel", "holy-angels"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(ሩፋኤል|raphael|rufael)", re.I),
        "Angels",
        ["st-raphael", "holy-angels"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(ራጉኤል|ፋኑኤል|ሳቁኤል|መላእክት|መልአክ|angels)", re.I),
        "Angels",
        ["holy-angels"],
        None,
    ),
    (
        re.compile(r"(ጊዮርጊስ|ልዳው\s*ፀሐይ|giorgis|st\.?\s*george)", re.I),
        "Saints",
        ["st-george", "martyrs", "general-saints"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(አርሴማ|arsema)", re.I),
        "Saints",
        ["st-arsema", "martyrs", "general-saints"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(ሐዋርያት|ሐዋርያው|ጴጥሮስ|ጳውሎስ|ዮሐንስ\s*ወንጌላዊ|እንድርያስ|ቶማስ|apostles)", re.I),
        "Apostles",
        ["apostles", "general-saints"],
        None,
    ),
    (
        re.compile(r"(ሰማዕታት|ሰማዕት|ጻድቃን|ቅዱሳን|ነቢያት|ዮሐንስ\s*መጥምቅ|አቡነ\s*አረጋዊ|አቡነ\s*ሀብተ\s*ማርያም|አቡነ\s*እጨጌ|ክርስቶስ\s*ሠምራ|saints|martyrs)", re.I),
        "Saints",
        ["general-saints"],
        "Annual Saint Feast",
    ),
    (
        re.compile(r"(መስቀል|መስቀሉ|ደመራ|እሌኒ|ጎልጎታ|ቀራንዮ|cross|meskel)", re.I),
        "Cross",
        ["meskel", "holy-cross"],
        "Meskel",
    ),
    (
        re.compile(
            r"(ድንግል|ማርያም|እመቤታችን|እመቤቴ|እመ\s*ብርሃን|እመ\s*አምላክ|ኪዳነ\s*ምሕረት|ኪዳነ\s*ምህረት|ጽዮን|"
            r"ወላዲተ\s*አምላክ|ፍልሰታ|ልደታ|አክሱም\s*ጽዮን|ግሸን\s*ማርያም|ደብረ\s*ቁስቋም|ሰዓሊ\s*ለነ|"
            r"ትህትናሽ|የልጅሽ|በአንቺ\s*ምልጃ|ባንቺ\s*ምልጃ|ታትመሻል|ስማፀናት|የፍቅር\s*እናት|አዛኝቷ|"
            r"ምኩራብ|ምኵራበ|ሙሽራዋ|የብርሃን\s*እናት|ማኅደረ\s*መለኮት|ሐመረ\s*ኖኅ|ኩሉ\s*ነገርሽ|"
            r"maryam|mariam|virgin\s*mary|emebetachin|emebete|dingil|tsiyon|kidane\s*mihret)",
            re.I,
        ),
        "Virgin Mary",
        ["mary-general"],
        None,
    ),
    (
        re.compile(
            r"(ንስሐ|ንስሃ|ኃጢአቴ|ኃጢአት|ኃጢአተኛው|በደሌ|ማረኝ|ይቅር\s*በለኝ|ምሕረትህን|ምህረትህን|"
            r"ተመለስ\s*ነፍሴ|አባቴ\s*ቤት|እባክህ\s*አምላኬ|አትጣለኝ|ፈራሁ|አልቅሺ\s*ነፍሴ|አጥቷል\s*ጎድሎበታል|"
            r"በጉዟችን\s*እርዳን|ኢትዮጵያ\s*ሆይ\s*ተነሽ|ሀሳቤን\s*ላትለውጥ|ይህ\s*አይገባትም|አይበቃም\s*ዎይ|"
            r"repentance|forgive\s*me)",
            re.I,
        ),
        "Repentance",
        ["repentance"],
        "Abiy Tsom",
    ),
    (
        re.compile(r"(ጸሎት|ጸልዩ|ልመናዬ|ስማኝ\s*አምላኬ|በእርሷ\s*ጸልዩ|ጸልዩ\s*በኅበ\s*ዛቲ|prayer)", re.I),
        "Prayer",
        ["prayer", "church-worship", "general-worship"],
        None,
    ),
    (
        re.compile(
            r"(ኢየሱስ|ክርስቶስ|አማኑኤል|መድኃኔዓለም|መድኃኒዓለም|መድኃኒቴ|ጌታዬ|አዳነኝ\s*ጌታ|ጌታን\s*ተቀበሉ|"
            r"አምላኬ|እግዚአብሔር|ቸሩ\s*መድኃኔዓለም|ወልደ\s*አብ|ቤተልሔም|ቤተልሄም|ሆሣዕና|ሆሳዕና|ትንሣኤ|ትንሳኤ|"
            r"ስቅለት|እረኛዬ|ቸርነትህ|ምሕረትህ|ምህረትህ|የኔ\s*መሀሪ|የታመነው\s*ሊቀ\s*ካህናት|ተነስቷል|"
            r"ወምድርኒ\s*ትገብር\s*ፋሲካ|በስምህ\s*ታምኛለሁ|ካንተ\s*የሆነ|የማትቀየር\s*አንተ\s*ብቻ|"
            r"ስለማይነገር\s*ስጦታው|አኑሮኛል\s*ቸርነትህ|jesus|christ|amanuel|medhanealem|lord)",
            re.I,
        ),
        "Jesus Christ",
        ["christ-general"],
        None,
    ),
    (
        re.compile(
            r"(ቤተ\s*ክርስቲያንን|ቤተክርስቲያንን|ኦርቶዶክስ\s*ተዋሕዶ|ተዋሕዶ|የአበውን\s*ርስት|አሐቲ\s*ሃይማኖት|"
            r"ላመስግነው|ኑ\s*ለምስጋና|ስምህ\s*ለዘለዓለም\s*ምስጉን|ኃይሌም\s*ዝማሬዬም|እልል\s*በሉ|አመስግኑት)",
            re.I,
        ),
        "Praise Worship",
        ["general-praise", "church-worship"],
        None,
    ),
]

# Evidence-based keyword rules for Liturgical Occasions
_OCCASION_EVIDENCE_RULES: List[Tuple[re.Pattern[str], str, List[str]]] = [
    (re.compile(r"(ልደት|ቤተልሔም|ቤተልሄም|ገና|ዮሴፍና\s*ሰሎሜ|በጎል\s*ተወለደ|nativity|christmas|\bgena\b)", re.I), "Gena", ["gena"]),
    (re.compile(r"(ጥምቀት|ዮርዳኖስ|ዮሐንስ\s*አጥመቆ|ተጠምቀ|epiphany|timket|timkat)", re.I), "Timket", ["timkat"]),
    (re.compile(r"(መስቀል|ደመራ|እሌኒ|\bmeskel\b|true\s*cross)", re.I), "Meskel", ["meskel"]),
    (re.compile(r"(ሆሣዕና|ሆሳዕና|ሆሳእና|hosanna|palm\s*sunday)", re.I), "Hosanna", ["hosanna"]),
    (re.compile(r"(ስቅለት|ቀራንዮ|ጎልጎታ|ተሰቅለ|good\s*friday|crucifixion|siklet)", re.I), "Siklet", ["good-friday", "passion", "holy-week"]),
    (re.compile(r"(ትንሣኤ|ትንሳኤ|ፋሲካ|ተነሣ|ተነሳ|resurrection|tinsae|fasika|easter)", re.I), "Tinsae", ["tinsae"]),
    (re.compile(r"(ዕርገት|እርገት|ዐረገ|ascension|erget)", re.I), "Erget", ["ascension"]),
    (re.compile(r"(ጰራቅሊጦስ|በዓለ\s*ሃምሳ|pentecost|paraclete)", re.I), "Pentecost", ["pentecost"]),
    (re.compile(r"(ደብረ\s*ታቦር|ቡሄ|transfiguration|debre\s*tabor)", re.I), "Debre Tabor", ["debre-tabor"]),
    (re.compile(r"(ፍልሰታ|filseta)", re.I), "Filseta", ["filseta"]),
    (re.compile(r"(ኪዳነ\s*ምሕረት|ኪዳነ\s*ምህረት|kidane\s*mihret|kidane\s*mehret)", re.I), "Kidane Mihret", ["holidays-kidane-mihret", "virgin-mary-kidane-mihret", "marian-feasts", "mary-general"]),
    (re.compile(r"(ልደታ\s*ለማርያም|ልደታ\s*ማርያም|lideta\s*maryam)", re.I), "Lideta Maryam", ["lideta-maryam", "mary-general"]),
    (re.compile(r"(ዐቢይ\s*ጾም|አብይ\s*ጾም|አብይ\s*ፆም|abiy\s*tsom|great\s*lent)", re.I), "Abiy Tsom", ["abiy-tsom", "general-fasting"]),
    (re.compile(r"(ጾመ\s*ነነዌ|ነነዌ|nineveh|tsome\s*nineveh)", re.I), "Tsome Nineveh", ["nineveh", "general-fasting"]),
    (re.compile(r"(ጾመ\s*ነቢያት|tsome\s*nebiyat)", re.I), "Tsome Nebiyat", ["general-fasting"]),
    (re.compile(r"(ጾመ\s*ሐዋርያት|tsome\s*hawariat)", re.I), "Tsome Hawariat", ["general-fasting"]),
    (re.compile(r"(ሕማማት|ህማማት|ሰሞነ\s*ሕማማት|holy\s*week|himamat)", re.I), "Holy Week", ["holy-week", "passion"]),
    (re.compile(r"(እንቁጣጣሽ|አዲስ\s*ዓመት|አዲስ\s*አመት|ቅዱስ\s*ዮሐንስ|enkutatash|new\s*year)", re.I), "New Year / Enkutatash", ["enkutatash"]),
    (re.compile(r"(ሠርግ|ሰርግ|ሙሽራ|ሙሽሪት|ቃና\s*ዘገሊላ|wedding|bride|groom)", re.I), "Wedding", ["wedding"]),
    (re.compile(r"(ቁርባን|ቅዱስ\s*ቁርባን|ሥጋውና\s*ደሙ|communion|eucharist)", re.I), "Communion", ["communion"]),
    (re.compile(r"(ፍትሐት|መታሰቢያ|funeral|memorial)", re.I), "Funeral / Memorial", ["funeral"]),
]

# Known YouTube channel / media group names that must NEVER be assigned as individual Zemaris
NON_ZEMARI_CHANNEL_OR_GROUP_NAMES: Set[str] = {
    "በህብረት",
    "ስብስብ",
    "ያልተገለጸ (anonymous)",
    "ያልተገለጸ",
    "anonymous",
    "21 media",
    "21 media ሃያ አንድ ሚዲያ",
    "mahtot tube",
    "ማኅቶት ቲዩብ mahtot tube",
    "janderebaw media",
    "menker mezmur",
    "መንክር መዝሙር",
    "ziq media",
    "ዚቅ ሚድያ ziq media",
    "hanos tube",
    "tabor media",
    "nablis media",
    "ናብሊስ ሚዲያ nablis media",
    "quanquayenesh media",
    "ቋንቋዬነሽ ሚዲያ",
    "eregnaye media",
    "እረኛዬ ሚዲያ eregnaye media",
    "ሱላማጢስ ሚዲያ",
    "ኅሩይ tube",
    "ዜማ ሰማያት zema semayat",
}

_ALBUM_EXTRACT_RE = re.compile(
    r"(?:(ቁጥር\s*\d+|ቍጥር\s*\d+|vol(?:ume)?\.?\s*\d+|አልበም\s*\d+))",
    re.IGNORECASE,
)


def extract_album_info(raw_title: str, description: str = "") -> str:
    """Extract explicit album/volume identifier when present; return empty string if unavailable."""
    m = _ALBUM_EXTRACT_RE.search(raw_title or "")
    if m:
        return re.sub(r"\s+", " ", m.group(1)).strip()
    if description:
        m2 = re.search(r"(?:አልበም\s*[:፦]?\s*([^\n|,;]{3,35}))", description)
        if m2 and "http" not in m2.group(1).lower():
            return re.sub(r"\s+", " ", m2.group(1)).strip()
    return ""


def resolve_verified_zemari(
    singers_list: Optional[List[Dict[str, object]]],
    raw_singer_field: Optional[str],
    extracted_title_singer: Optional[str],
    channel_title: Optional[str],
) -> Tuple[str, bool]:
    """
    Identify the verified Zemari without confusing YouTube channels or 'በህብረት'/'ስብስብ'
    with an individual Zemari.
    Returns (zemari_name, is_verified).
    """
    chan_norm = (channel_title or "").strip().lower()
    candidates: List[str] = []

    for s_obj in singers_list or []:
        if isinstance(s_obj, dict):
            name = str(s_obj.get("name") or "").strip()
            if name:
                candidates.append(name)

    if raw_singer_field and str(raw_singer_field).strip():
        candidates.append(str(raw_singer_field).strip())

    if extracted_title_singer and str(extracted_title_singer).strip():
        candidates.append(str(extracted_title_singer).strip())

    for cand in candidates:
        # Strip invisible bidi formatting characters (e.g. \u202a, \u202c)
        cand_clean = re.sub(r"[\u200b-\u200f\u202a-\u202e\ufeff]", "", cand).strip()
        c_low = cand_clean.lower().strip()
        if not c_low:
            continue
        if c_low in NON_ZEMARI_CHANNEL_OR_GROUP_NAMES:
            continue
        if chan_norm and c_low == chan_norm and not re.search(r"(ዘማሪ|ሊቀ\s*መዘምራን|ዲያቆን|ቀሲስ)", cand_clean):
            continue
        if re.search(r"\b(media|tube|channel|tv|studio)\b", c_low):
            continue
        return cand_clean, True

    return "", False


def classify_mezmur_record(raw: Dict[str, object]) -> Dict[str, object]:
    """
    Classify a raw crawled Mezmur record using source taxonomy facets + lyrical & title evidence
    + optional Gemini override if present in raw['gemini_classification'].
    """
    raw_title = str(raw.get("original_source_title") or raw.get("title") or "").strip()
    description = str(raw.get("description") or "").strip()
    lyrics_snippet = str(raw.get("source_lyrics_snippet") or "").strip()
    channel_title = str(raw.get("channel_title") or "").strip()
    singers_list = raw.get("singers") if isinstance(raw.get("singers"), list) else []
    raw_singer = str(raw.get("singer") or "").strip()

    known_singer_names = [
        str(s.get("name") or "") for s in singers_list if isinstance(s, dict) and s.get("name")
    ]
    parsed_titles = parse_source_title(raw_title, known_singer_names, channel_title)
    amharic_title = str(raw.get("amharic_title") or parsed_titles["amharic_title"] or "").strip()
    source_had_roman = bool(parsed_titles["transliteration_title"] and has_latin(parsed_titles["transliteration_title"]))
    translit_title = clean_transliteration_title(
        str(raw.get("transliteration_title") or ""),
        amharic_title,
        parsed_titles["transliteration_title"],
    )

    zemari, zemari_verified = resolve_verified_zemari(
        singers_list, raw_singer, parsed_titles["extracted_singer"], channel_title
    )

    # Determine language
    lang_id = raw.get("source_language_id")
    in_lang = str(raw.get("in_language") or "").strip().lower()
    review_reasons: List[str] = []

    if lang_id in (2,) or in_lang == "en" or (not has_ethiopic(raw_title) and has_latin(raw_title)):
        language = "english"
    elif lang_id in (3,) or in_lang == "gez":
        language = "geez"
    elif lang_id in (5,) or in_lang == "om":
        language = "oromo"
    elif lang_id in (4,) or in_lang == "ti":
        language = "amharic"
        review_reasons.append("source_language_tigrigna_mapped_to_amharic")
    else:
        language = "amharic"

    # Verified English title: only set when the hymn is in English or explicitly verified
    title_en = translit_title if language == "english" else str(raw.get("title_en") or "").strip()
    transliteration_verified = bool(raw.get("transliteration_verified")) or (language == "english") or source_had_roman
    if not transliteration_verified:
        review_reasons.append("transliteration_unverified_proposed")

    # Determine form (mezmur vs werb)
    form = "mezmur"
    if re.search(r"(ወረብ|\bwereb\b|\bwerb\b)", f"{raw_title} {description}", re.I):
        form = "werb"

    category: Optional[str] = None
    primary_occasion: Optional[str] = None
    additional_occasions: List[str] = []
    sections: List[str] = []
    confidence = 0.55

    # 1. Check explicit eotcmedia subcategories if collected from subcategory pages
    source_subcats: List[str] = raw.get("source_subcategories") or []  # type: ignore[assignment]
    for subcat_name in source_subcats:
        key = str(subcat_name).strip().lower()
        if key in SOURCE_SUBCAT_MAP:
            sc_cat, sc_occ, sc_form, sc_secs = SOURCE_SUBCAT_MAP[key]
            if sc_form == "werb":
                form = "werb"
            if sc_cat and not category:
                category = sc_cat
                confidence = max(confidence, 0.88)
            if sc_occ:
                if not primary_occasion or primary_occasion == "General / Anytime":
                    primary_occasion = sc_occ
                elif sc_occ != primary_occasion and sc_occ not in additional_occasions:
                    additional_occasions.append(sc_occ)
                confidence = max(confidence, 0.88)
            sections.extend(sc_secs)

    # 2. Check evidence rules in title and lyrics meaning (Phase 5 & Phase 6)
    title_only_text = f"{raw_title} {amharic_title}"
    combined_meaning_text = f"{title_only_text} {lyrics_snippet}".strip()

    for pattern, rule_cat, rule_secs, rule_occ in _CATEGORY_EVIDENCE_RULES:
        if pattern.search(title_only_text):
            sections.extend(rule_secs)
            if not category or (category in ("Angels", "Saints", "Jesus Christ", "Praise Worship", "General") and rule_cat in SPECIFIC_DEVOTED_CATEGORIES):
                category = rule_cat
                confidence = max(confidence, 0.88)
            if rule_occ:
                if not primary_occasion or primary_occasion == "General / Anytime":
                    primary_occasion = rule_occ
                elif rule_occ != primary_occasion and rule_occ not in additional_occasions:
                    additional_occasions.append(rule_occ)

    if lyrics_snippet:
        for pattern, rule_cat, rule_secs, rule_occ in _CATEGORY_EVIDENCE_RULES:
            if pattern.search(lyrics_snippet):
                sections.extend(rule_secs)
                if not category:
                    category = rule_cat
                    confidence = max(confidence, 0.82)
                    if rule_occ and (not primary_occasion or primary_occasion == "General / Anytime"):
                        primary_occasion = rule_occ
                    break
                elif category in ("Angels", "Saints", "General", "Praise Worship") and rule_cat in SPECIFIC_DEVOTED_CATEGORIES:
                    category = rule_cat
                    confidence = max(confidence, 0.85)
                    if rule_occ and (not primary_occasion or primary_occasion == "General / Anytime"):
                        primary_occasion = rule_occ
                    break

    for pattern, rule_occ, rule_secs in _OCCASION_EVIDENCE_RULES:
        if pattern.search(combined_meaning_text):
            sections.extend(rule_secs)
            matched_in_title = bool(pattern.search(title_only_text))
            if not primary_occasion or primary_occasion in ("General / Anytime", "Annual Saint Feast"):
                if matched_in_title or not primary_occasion or primary_occasion == "General / Anytime":
                    primary_occasion = rule_occ
                    confidence = max(confidence, 0.86 if matched_in_title else 0.80)
                elif rule_occ != primary_occasion and rule_occ not in additional_occasions:
                    additional_occasions.append(rule_occ)
            elif rule_occ != primary_occasion and rule_occ not in additional_occasions:
                additional_occasions.append(rule_occ)

    # 3. Apply Gemini classification override if available and valid
    gemini_cls = raw.get("gemini_classification")
    if isinstance(gemini_cls, dict):
        g_cat = canonicalize_category(str(gemini_cls.get("category") or ""))
        g_occ = canonicalize_occasion(str(gemini_cls.get("primary_occasion") or ""))
        g_lang = canonicalize_language(str(gemini_cls.get("language") or language))
        g_form = canonicalize_form(str(gemini_cls.get("form") or form))
        g_tr = str(gemini_cls.get("transliteration_title") or "").strip()
        g_secs = gemini_cls.get("hymn_sections")
        g_conf = gemini_cls.get("confidence")

        if g_cat:
            # Keep specific saint/archangel if evidenced in title/lyrics over generic Angels/Saints
            if not (category in SPECIFIC_DEVOTED_CATEGORIES and g_cat in ("Angels", "Saints", "General")):
                category = g_cat
        if g_occ:
            primary_occasion = g_occ
        if g_lang in SUPPORTED_LANGUAGES:
            language = g_lang
        if g_form in SUPPORTED_FORMS:
            form = g_form
        if g_tr and has_latin(g_tr):
            translit_title = g_tr
        if isinstance(g_secs, list):
            sections.extend([str(s) for s in g_secs])
        elif isinstance(g_secs, str) and g_secs:
            sections.extend([s.strip() for s in g_secs.split("|") if s.strip()])
        if isinstance(g_conf, (int, float)):
            confidence = max(confidence, float(g_conf))

    # 4. Defaults when no specific theological subject / feast is evidenced
    if not category:
        category = "Praise Worship"
        sections.append("general-praise")
        confidence = min(confidence, 0.60)
        review_reasons.append("category_inferred_general_praise")

    if not primary_occasion:
        primary_occasion = "General / Anytime"

    if form == "werb" and "wereb" not in sections:
        sections.append("wereb")
    if language == "english" and "english" not in sections:
        sections.append("english")
    if language == "bilingual" and "bilingual" not in sections:
        sections.append("bilingual")

    if not sections:
        sections.append("general-worship")

    valid_sections = filter_valid_sections(sections)
    db_sections = map_to_db_sections(valid_sections)
    if not db_sections:
        db_sections = ["general-mezmur"]

    additional_occasions = [
        occ
        for occ in dict.fromkeys(additional_occasions)
        if occ in SUPPORTED_OCCASIONS and occ != primary_occasion
    ]

    if not zemari_verified:
        review_reasons.append("zemari_unverified_or_group")
        confidence = min(confidence, 0.72)

    if confidence < 0.75:
        review_reasons.append("low_classification_confidence")

    lyr_kind = str(raw.get("lyrics_source_kind") or "")
    if lyr_kind == "ai_transcribed":
        review_reasons.append("lyrics_source_ai_transcribed_verify_text")
    elif lyr_kind == "community_suggestion":
        review_reasons.append("lyrics_source_community_suggestion_verify_text")

    # Lyrics status tracking
    has_source_lyrics = bool(raw.get("has_source_lyrics"))
    authorized_lyrics = bool(raw.get("authorized_lyrics"))
    if authorized_lyrics and (raw.get("amharic_lyrics") or raw.get("english_lyrics")):
        lyrics_status = "available"
    elif has_source_lyrics:
        lyrics_status = "rights_review_required"
        review_reasons.append("source_lyrics_require_rights_review")
    else:
        lyrics_status = "missing"

    review_required = "true" if review_reasons else "false"
    # Existing TewahedoDaily review_status enum in mezmur_data_import: 'needs_review' | 'ready'
    # High-confidence hymns with verified singer & verified human lyrics where only standard rights/translit note applies
    non_standard_reasons = [
        r
        for r in review_reasons
        if r not in ("source_lyrics_require_rights_review", "transliteration_unverified_proposed")
    ]
    review_status = "needs_review" if non_standard_reasons or confidence < 0.80 else "ready"

    album = extract_album_info(raw_title, description)

    result = {
        "amharic_title": amharic_title,
        "title_en": title_en,
        "transliteration_title": translit_title,
        "transliteration_verified": "true" if transliteration_verified else "false",
        "language": language,
        "form": form,
        "category": category,
        "primary_occasion": primary_occasion,
        "additional_occasions": "|".join(additional_occasions),
        "hymn_sections": "|".join(valid_sections),
        "db_hymn_sections": "|".join(db_sections),
        "zemari": zemari,
        "zemari_verified": "true" if zemari_verified else "false",
        "album": album,
        "lyrics_status": lyrics_status,
        "classification_confidence": f"{confidence:.2f}",
        "review_required": review_required,
        "review_status": review_status,
        "review_reasons": "|".join(dict.fromkeys(review_reasons)),
    }

    # Deterministic taxonomy validation check
    tax_errors = validate_taxonomy_record(result)
    if tax_errors:
        result["category"] = canonicalize_category(str(result["category"])) or "General"
        result["primary_occasion"] = (
            canonicalize_occasion(str(result["primary_occasion"])) or "General / Anytime"
        )
        result["language"] = canonicalize_language(str(result["language"]))
        result["form"] = canonicalize_form(str(result["form"]))
        result["review_required"] = "true"
        result["review_status"] = "needs_review"

    return result
