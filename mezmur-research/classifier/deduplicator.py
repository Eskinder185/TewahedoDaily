"""
Compilation detector and multi-signal duplicate detector for TewahedoDaily Mezmurs.
"""
from __future__ import annotations
import re
from difflib import SequenceMatcher
from typing import Dict, List, Optional, Set, Tuple
from urllib.parse import parse_qs, urlparse

from .transliterator import normalize_amharic_for_dedupe

# Compilation / album / non-stop mix patterns
_COMPILATION_TITLE_RE = re.compile(
    r"(?:\bnon[\s\-]*stop\b|"
    r"\bfull\s*album\b|"
    r"\bmezmur\s*album\b|"
    r"\bcollection\s*of\b|"
    r"\bbest\s*of\b|"
    r"\b1\s*hour\b|\b2\s*hours?\b|"
    r"\bplaylist\b|"
    r"ሙሉ\s*አልበም|"
    r"ቁጥር\s*\d+\s*አልበም|"
    r"የመዝሙር\s*ስብስብ|"
    r"የንስሐ\s*መዝሙሮች\s*ስብስብ|"
    r"ተወዳጅ\s*መዝሙሮች\s*ስብስብ|"
    r"ምርጥ\s*መዝሙሮች|"
    r"አልበም\s*ሙሉ)",
    re.IGNORECASE,
)

# eotcmedia category IDs that explicitly mean "Compilation / Collection / Album"
# (21: ስብስብ, 22: እኩብ, 23: ስብስብ, 24: Collection, 25: Qabuu)
COMPILATION_SOURCE_CATEGORY_IDS: Set[int] = {21, 22, 23, 24, 25}
# eotcmedia subcategory IDs that mean "Album" (128: ኣልበም, 148: Album, 155: Albaama)
COMPILATION_SOURCE_SUBCATEGORY_IDS: Set[int] = {128, 148, 155}
# Singer names that mean "Compilation" (note: በህብረት means choir/group performance, NOT a compilation album)
COMPILATION_SINGER_NAMES: Set[str] = {"ስብስብ", "collection", "album", "አልበም"}


def extract_youtube_video_id(url_or_id: Optional[str]) -> str:
    """Extract canonical 11-char YouTube video ID from URL or raw videoId."""
    if not url_or_id:
        return ""
    raw = str(url_or_id).strip()
    if re.match(r"^[A-Za-z0-9_-]{11}$", raw):
        return raw
    try:
        parsed = urlparse(raw)
        host = (parsed.hostname or "").lower()
        if host == "youtu.be":
            candidate = parsed.path.strip("/").split("/")[0]
            if re.match(r"^[A-Za-z0-9_-]{11}$", candidate):
                return candidate
        if host in ("youtube.com", "www.youtube.com", "m.youtube.com"):
            qs = parse_qs(parsed.query)
            if "v" in qs and qs["v"]:
                candidate = qs["v"][0]
                if re.match(r"^[A-Za-z0-9_-]{11}$", candidate):
                    return candidate
            m = re.match(r"^/(?:embed|shorts|v)/([A-Za-z0-9_-]{11})", parsed.path)
            if m:
                return m.group(1)
    except Exception:
        pass
    return ""


def normalize_youtube_url(url_or_id: Optional[str]) -> str:
    vid = extract_youtube_video_id(url_or_id)
    return f"https://www.youtube.com/watch?v={vid}" if vid else ""


def is_compilation_record(
    raw_title: str,
    slug: str = "",
    singer: str = "",
    source_category_ids: Optional[List[int]] = None,
    source_subcategory_ids: Optional[List[int]] = None,
) -> Tuple[bool, str]:
    """
    Determine whether a listing is a multi-song compilation/album/mix
    rather than an individual Mezmur.
    """
    for cid in source_category_ids or []:
        if int(cid) in COMPILATION_SOURCE_CATEGORY_IDS:
            return True, f"source_category_compilation:{cid}"
    for scid in source_subcategory_ids or []:
        if int(scid) in COMPILATION_SOURCE_SUBCATEGORY_IDS:
            return True, f"source_subcategory_album:{scid}"

    singer_norm = (singer or "").strip().lower()
    if singer_norm in COMPILATION_SINGER_NAMES:
        return True, f"singer_marked_as_compilation:{singer}"

    text = f"{raw_title or ''} {slug or ''}"
    m = _COMPILATION_TITLE_RE.search(text)
    if m:
        return True, f"title_compilation_keyword:{m.group(0)}"

    return False, ""


def _norm_translit(text: Optional[str]) -> str:
    if not text:
        return ""
    return re.sub(r"[^a-z0-9]+", " ", text.lower()).strip()


def deduplicate_records(
    records: List[Dict[str, object]],
) -> Tuple[List[Dict[str, object]], List[Dict[str, object]]]:
    """
    Analyze a list of candidate individual Mezmur records and separate:
      - unique_records: verified unique hymns (including distinct performances by different Zemaris)
      - duplicate_report_rows: rows for duplicates.csv (exact duplicates dropped + alternate performances flagged)
    """
    unique_records: List[Dict[str, object]] = []
    duplicate_rows: List[Dict[str, object]] = []

    by_source_url: Dict[str, Dict[str, object]] = {}
    by_video_id: Dict[str, Dict[str, object]] = {}
    by_amharic_and_singer: Dict[Tuple[str, str], Dict[str, object]] = {}
    by_amharic_title: Dict[str, List[Dict[str, object]]] = {}

    for rec in records:
        src_url = str(rec.get("source_url") or "").strip()
        yt_url = str(rec.get("youtube_url") or "").strip()
        vid_id = extract_youtube_video_id(yt_url or str(rec.get("video_id") or ""))
        am_title = str(rec.get("amharic_title") or "").strip()
        tr_title = str(rec.get("transliteration_title") or "").strip()
        zemari = str(rec.get("zemari") or "").strip()
        slug = str(rec.get("slug") or "").strip()

        norm_am = normalize_amharic_for_dedupe(am_title)
        norm_tr = _norm_translit(tr_title)
        norm_zemari = normalize_amharic_for_dedupe(zemari) or _norm_translit(zemari)

        # 1. Exact canonical source URL duplicate
        if src_url and src_url in by_source_url:
            canon = by_source_url[src_url]
            duplicate_rows.append({
                "duplicate_type": "exact_source_url",
                "candidate_slug": slug,
                "candidate_source_url": src_url,
                "candidate_title": am_title or tr_title,
                "candidate_youtube_url": yt_url,
                "candidate_zemari": zemari,
                "canonical_slug": str(canon.get("slug") or ""),
                "canonical_source_url": str(canon.get("source_url") or ""),
                "canonical_title": str(canon.get("amharic_title") or canon.get("transliteration_title") or ""),
                "canonical_youtube_url": str(canon.get("youtube_url") or ""),
                "similarity_score": "1.00",
                "resolution": "excluded_duplicate",
                "reason": "Identical canonical source URL",
            })
            continue

        # 2. Exact YouTube video ID duplicate
        if vid_id and vid_id in by_video_id:
            canon = by_video_id[vid_id]
            duplicate_rows.append({
                "duplicate_type": "exact_youtube_video_id",
                "candidate_slug": slug,
                "candidate_source_url": src_url,
                "candidate_title": am_title or tr_title,
                "candidate_youtube_url": yt_url,
                "candidate_zemari": zemari,
                "canonical_slug": str(canon.get("slug") or ""),
                "canonical_source_url": str(canon.get("source_url") or ""),
                "canonical_title": str(canon.get("amharic_title") or canon.get("transliteration_title") or ""),
                "canonical_youtube_url": str(canon.get("youtube_url") or ""),
                "similarity_score": "1.00",
                "resolution": "excluded_duplicate",
                "reason": f"Identical YouTube video ID ({vid_id})",
            })
            continue

        # 3. Same normalized Amharic title + same Zemari (re-upload of same singer's hymn)
        if norm_am and len(norm_am) >= 4 and norm_zemari:
            key_am_zem = (norm_am, norm_zemari)
            if key_am_zem in by_amharic_and_singer:
                canon = by_amharic_and_singer[key_am_zem]
                duplicate_rows.append({
                    "duplicate_type": "same_title_and_zemari_reupload",
                    "candidate_slug": slug,
                    "candidate_source_url": src_url,
                    "candidate_title": am_title or tr_title,
                    "candidate_youtube_url": yt_url,
                    "candidate_zemari": zemari,
                    "canonical_slug": str(canon.get("slug") or ""),
                    "canonical_source_url": str(canon.get("source_url") or ""),
                    "canonical_title": str(canon.get("amharic_title") or canon.get("transliteration_title") or ""),
                    "canonical_youtube_url": str(canon.get("youtube_url") or ""),
                    "similarity_score": "0.98",
                    "resolution": "excluded_duplicate",
                    "reason": "Normalized Amharic title and Zemari match existing record (re-upload)",
                })
                continue

        # 4. Check if same composition performed by a DIFFERENT Zemari (alternate performance)
        # We DO NOT silently merge different performances of the same composition;
        # we keep the distinct performance AND log it in duplicates.csv as alternate_performance_kept_for_review.
        if norm_am and len(norm_am) >= 5 and norm_am in by_amharic_title:
            prior_list = by_amharic_title[norm_am]
            canon = prior_list[0]
            canon_tr = _norm_translit(str(canon.get("transliteration_title") or ""))
            sim = SequenceMatcher(None, norm_tr, canon_tr).ratio() if (norm_tr and canon_tr) else 0.90
            canon_zemari = str(canon.get("zemari") or "").strip()
            if not norm_zemari or not canon_zemari:
                # Ambiguous singer: flag for review
                rec["review_required"] = "true"
                reasons = str(rec.get("review_reasons") or "")
                rec["review_reasons"] = "|".join(
                    filter(None, [reasons, f"ambiguous_same_title_as:{canon.get('slug')}"])
                )
                duplicate_rows.append({
                    "duplicate_type": "ambiguous_same_title_missing_zemari",
                    "candidate_slug": slug,
                    "candidate_source_url": src_url,
                    "candidate_title": am_title or tr_title,
                    "candidate_youtube_url": yt_url,
                    "candidate_zemari": zemari,
                    "canonical_slug": str(canon.get("slug") or ""),
                    "canonical_source_url": str(canon.get("source_url") or ""),
                    "canonical_title": str(canon.get("amharic_title") or canon.get("transliteration_title") or ""),
                    "canonical_youtube_url": str(canon.get("youtube_url") or ""),
                    "similarity_score": f"{sim:.2f}",
                    "resolution": "kept_flagged_for_review",
                    "reason": "Matching Amharic title with missing Zemari on one or both records; not silently merged",
                })
            else:
                duplicate_rows.append({
                    "duplicate_type": "alternate_performance_different_zemari",
                    "candidate_slug": slug,
                    "candidate_source_url": src_url,
                    "candidate_title": am_title or tr_title,
                    "candidate_youtube_url": yt_url,
                    "candidate_zemari": zemari,
                    "canonical_slug": str(canon.get("slug") or ""),
                    "canonical_source_url": str(canon.get("source_url") or ""),
                    "canonical_title": str(canon.get("amharic_title") or canon.get("transliteration_title") or ""),
                    "canonical_youtube_url": str(canon.get("youtube_url") or ""),
                    "similarity_score": f"{sim:.2f}",
                    "resolution": "kept_distinct_performance",
                    "reason": f"Different Zemari performance ({zemari} vs {canon_zemari})",
                })

        # Register as kept unique record
        if src_url:
            by_source_url[src_url] = rec
        if vid_id:
            by_video_id[vid_id] = rec
        if norm_am and len(norm_am) >= 4 and norm_zemari:
            by_amharic_and_singer[(norm_am, norm_zemari)] = rec
        if norm_am and len(norm_am) >= 5:
            by_amharic_title.setdefault(norm_am, []).append(rec)

        unique_records.append(rec)

    return unique_records, duplicate_rows
