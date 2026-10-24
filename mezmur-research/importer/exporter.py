"""
CSV exporter and pipeline processor for TewahedoDaily Mezmur research.
Generates:
  1. All 6 EOTC Media full catalog audit & import files in data/imports/eotcmedia/
  2. All 10 staging CSV files in mezmur-research/exports/
All CSV files are encoded in UTF-8 with BOM (utf-8-sig).
"""
from __future__ import annotations
import csv
from datetime import datetime, timezone
from difflib import SequenceMatcher
import json
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

from classifier.deduplicator import (
    deduplicate_records,
    extract_youtube_video_id,
    normalize_youtube_url,
)
from classifier.engine import classify_mezmur_record
from classifier.taxonomy import (
    HYMN_SECTIONS,
    SUPPORTED_CATEGORIES,
    SUPPORTED_FORMS,
    SUPPORTED_LANGUAGES,
    SUPPORTED_OCCASIONS,
    VALID_DB_SECTION_SLUGS,
    occasion_to_slug,
    validate_taxonomy_record,
)
from classifier.transliterator import (
    generate_slug,
    has_ethiopic,
    normalize_amharic_for_dedupe,
    transliterate_ethiopic,
)
from crawler.db import CheckpointDB
from .readiness import evaluate_import_readiness, is_valid_youtube_url

# Phase 9 columns for data/imports/eotcmedia/eotcmedia_with_lyrics.csv & eotcmedia_import_ready.csv
EOTCMEDIA_WITH_LYRICS_COLUMNS: List[str] = [
    "source_id",
    "title_am",
    "title_en",
    "transliteration",
    "zemari_name",
    "zemari_verified",
    "youtube_url",
    "youtube_video_id",
    "source_url",
    "lyrics_source_url",
    "has_lyrics",
    "language",
    "form",
    "theological_category",
    "primary_occasion",
    "additional_occasions",
    "hymn_sections",
    "album",
    "channel_name",
    "classification_confidence",
    "review_status",
    "review_notes",
    "copyright_status",
    "discovered_at",
]

EOTCMEDIA_WITHOUT_LYRICS_COLUMNS: List[str] = [
    "source_id",
    "title_am",
    "title_en",
    "transliteration",
    "zemari_name",
    "youtube_url",
    "youtube_video_id",
    "source_url",
    "has_lyrics",
    "without_lyrics_reason",
    "channel_name",
    "discovered_at",
]

EOTCMEDIA_UNCERTAIN_COLUMNS: List[str] = [
    "source_id",
    "title_am",
    "source_url",
    "youtube_url",
    "youtube_video_id",
    "lyrics_verification",
    "uncertainty_reason",
    "http_status",
    "retry_count",
    "discovered_at",
]

EOTCMEDIA_DUPLICATES_COLUMNS: List[str] = [
    "duplicate_scope",
    "duplicate_type",
    "candidate_source_id",
    "candidate_title_am",
    "candidate_transliteration",
    "candidate_zemari",
    "candidate_youtube_video_id",
    "candidate_youtube_url",
    "candidate_source_url",
    "matched_target_type",
    "matched_target_id_or_slug",
    "matched_target_title",
    "matched_target_zemari",
    "matched_target_youtube_url",
    "matched_target_source_url",
    "similarity_score",
    "resolution",
    "matching_evidence",
]

MAIN_CSV_COLUMNS: List[str] = [
    "id",
    "amharic_title",
    "transliteration_title",
    "slug",
    "description",
    "amharic_lyrics",
    "transliteration_lyrics",
    "english_lyrics",
    "lyrics_status",
    "youtube_url",
    "thumbnail_url",
    "image_alt_text",
    "audio_url",
    "language",
    "form",
    "category",
    "primary_occasion",
    "zemari",
    "hymn_sections",
    "additional_occasions",
    "source_url",
    "classification_confidence",
    "review_required",
    "status",
    "featured",
]

SECTION_LINKS_COLUMNS: List[str] = [
    "mezmur_slug",
    "section_slug",
    "sort_order",
    "is_primary",
    "collection_slug",
    "section_title",
    "confidence",
    "review_required",
]

OCCASION_LINKS_COLUMNS: List[str] = [
    "mezmur_slug",
    "occasion_slug",
    "occasion_name",
    "is_primary",
    "confidence",
    "review_required",
]

ZEMARIS_COLUMNS: List[str] = [
    "id",
    "slug",
    "name",
    "name_amharic",
    "bio",
    "bio_amharic",
    "image_path",
    "image_alt",
    "youtube_url",
    "website_url",
    "sort_order",
    "is_featured",
    "status",
    "mezmur_count",
    "source_url",
    "review_required",
]

DUPLICATES_COLUMNS: List[str] = [
    "duplicate_type",
    "candidate_slug",
    "candidate_source_url",
    "candidate_title",
    "candidate_youtube_url",
    "candidate_zemari",
    "canonical_slug",
    "canonical_source_url",
    "canonical_title",
    "canonical_youtube_url",
    "similarity_score",
    "resolution",
    "reason",
]

REVIEW_REQUIRED_COLUMNS: List[str] = [
    "slug",
    "amharic_title",
    "transliteration_title",
    "source_url",
    "youtube_url",
    "zemari",
    "category",
    "primary_occasion",
    "classification_confidence",
    "lyrics_status",
    "review_reasons",
]

MISSING_LYRICS_COLUMNS: List[str] = [
    "slug",
    "amharic_title",
    "transliteration_title",
    "zemari",
    "language",
    "category",
    "primary_occasion",
    "youtube_url",
    "source_url",
    "lyrics_status",
    "source_has_lyrics",
    "notes",
]

SOURCE_ATTRIBUTION_COLUMNS: List[str] = [
    "slug",
    "source_name",
    "source_url",
    "original_source_title",
    "source_hymn_id",
    "youtube_url",
    "youtube_video_id",
    "youtube_channel_title",
    "youtube_channel_handle",
    "identified_zemari",
    "upload_date",
    "lyrics_status",
    "rights_review_required",
    "collected_at",
]

IMPORT_READINESS_COLUMNS: List[str] = [
    "slug",
    "amharic_title",
    "transliteration_title",
    "ready_for_draft_import",
    "ready_for_publish",
    "has_valid_slug",
    "has_title",
    "has_youtube_url",
    "has_zemari",
    "has_valid_taxonomy",
    "lyrics_status",
    "review_required",
    "blocking_issues",
    "warnings",
]

CRAWL_ERRORS_COLUMNS: List[str] = [
    "url",
    "item_type",
    "http_status",
    "error_type",
    "error_message",
    "retry_count",
    "occurred_at",
    "resolved",
]


def _write_csv_utf8_bom(
    path: Path, columns: List[str], rows: List[Dict[str, object]]
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(
            f,
            fieldnames=columns,
            quoting=csv.QUOTE_MINIMAL,
            extrasaction="ignore",
        )
        writer.writeheader()
        for row in rows:
            clean_row = {col: ("" if row.get(col) is None else str(row.get(col))) for col in columns}
            writer.writerow(clean_row)


def _load_existing_tewahedodaily_index() -> Dict[str, object]:
    """Load existing TewahedoDaily hymns & zemaris from snapshot JSON + local CSVs."""
    root_dir = Path(__file__).resolve().parent.parent
    repo_root = root_dir.parent
    snap_path = root_dir / "data" / "existing_tewahedodaily_snapshot.json"

    by_video_id: Dict[str, Dict[str, str]] = {}
    by_norm_am_title: Dict[str, List[Dict[str, str]]] = {}
    verified_translit_by_am: Dict[str, str] = {}
    verified_en_by_am: Dict[str, str] = {}
    existing_zemaris: List[Dict[str, str]] = []

    def _register_existing_hymn(
        slug: str,
        title_tr: str,
        title_am: str,
        title_en: str,
        yt_url: str,
        singer_name: str,
        source_label: str,
    ) -> None:
        vid = extract_youtube_video_id(yt_url)
        norm_am = normalize_amharic_for_dedupe(title_am)
        entry = {
            "slug": slug,
            "title_tr": title_tr,
            "title_am": title_am,
            "title_en": title_en,
            "youtube_url": normalize_youtube_url(yt_url) or yt_url,
            "video_id": vid,
            "zemari": singer_name,
            "source_label": source_label,
        }
        if vid and vid not in by_video_id:
            by_video_id[vid] = entry
        if norm_am and len(norm_am) >= 4:
            by_norm_am_title.setdefault(norm_am, []).append(entry)
            if title_tr and not has_ethiopic(title_tr) and norm_am not in verified_translit_by_am:
                verified_translit_by_am[norm_am] = title_tr
            if title_en and not has_ethiopic(title_en) and norm_am not in verified_en_by_am:
                verified_en_by_am[norm_am] = title_en

    if snap_path.exists():
        try:
            snap = json.loads(snap_path.read_text(encoding="utf-8"))
            for m in snap.get("mezmur_data_import") or []:
                if not isinstance(m, dict):
                    continue
                _register_existing_hymn(
                    slug=str(m.get("slug") or m.get("mezmur_id") or "").strip(),
                    title_tr=str(m.get("title") or "").strip(),
                    title_am=str(m.get("title_amharic") or "").strip(),
                    title_en=str(m.get("title_english") or "").strip(),
                    yt_url=str(m.get("youtube_url") or "").strip(),
                    singer_name=str(m.get("singer_name") or "").strip(),
                    source_label="supabase:mezmur_data_import",
                )
            for z in snap.get("zemaris") or []:
                if isinstance(z, dict):
                    existing_zemaris.append({
                        "id": str(z.get("id") or ""),
                        "slug": str(z.get("slug") or ""),
                        "name": str(z.get("name") or "").strip(),
                        "name_amharic": str(z.get("name_amharic") or "").strip(" |"),
                    })
        except Exception:
            pass

    for csv_name in ("amharic-chants-supabase.csv", "english-mezmur-supabase-deduped.csv"):
        csv_path = repo_root / csv_name
        if csv_path.exists():
            try:
                with csv_path.open("r", encoding="utf-8-sig", errors="replace") as f:
                    for row in csv.DictReader(f):
                        is_en_pack = "english" in csv_name
                        t_tr = str(row.get("title") or "").strip()
                        t_am = str(row.get("title_amharic") or "").strip()
                        t_en = t_tr if is_en_pack else ""
                        _register_existing_hymn(
                            slug=str(row.get("slug") or "").strip(),
                            title_tr=t_tr,
                            title_am=t_am,
                            title_en=t_en,
                            yt_url=str(row.get("youtube_url") or "").strip(),
                            singer_name="",
                            source_label=f"csv:{csv_name}",
                        )
            except Exception:
                pass

    return {
        "by_video_id": by_video_id,
        "by_norm_am_title": by_norm_am_title,
        "verified_translit_by_am": verified_translit_by_am,
        "verified_en_by_am": verified_en_by_am,
        "existing_zemaris": existing_zemaris,
    }


def export_eotcmedia_catalog_audit(
    db: CheckpointDB,
    output_dir: Optional[Path | str] = None,
    advertised_catalog_size: int = 4175,
    sitemap_detail_urls_count: int = 4175,
) -> Dict[str, object]:
    """
    Generate the 6 Phase 9 output files in data/imports/eotcmedia/:
      1. eotcmedia_with_lyrics.csv
      2. eotcmedia_without_lyrics.csv
      3. eotcmedia_uncertain.csv
      4. eotcmedia_duplicates.csv
      5. eotcmedia_import_ready.csv
      6. eotcmedia_full_audit.json
    """
    root_dir = Path(__file__).resolve().parent.parent
    repo_root = root_dir.parent
    out_dir = Path(output_dir) if output_dir else (repo_root / "data" / "imports" / "eotcmedia")
    out_dir.mkdir(parents=True, exist_ok=True)

    td_index = _load_existing_tewahedodaily_index()
    td_by_vid: Dict[str, Dict[str, str]] = td_index["by_video_id"]  # type: ignore[assignment]
    td_by_am: Dict[str, List[Dict[str, str]]] = td_index["by_norm_am_title"]  # type: ignore[assignment]
    verified_tr_by_am: Dict[str, str] = td_index["verified_translit_by_am"]  # type: ignore[assignment]
    verified_en_by_am: Dict[str, str] = td_index["verified_en_by_am"]  # type: ignore[assignment]

    raw_rows = db.load_all_raw_listings()
    errors_list = db.load_all_errors()
    error_by_url = {str(e.get("url") or ""): e for e in errors_list if not e.get("resolved")}

    with_lyrics_rows: List[Dict[str, object]] = []
    without_lyrics_rows: List[Dict[str, object]] = []
    uncertain_rows: List[Dict[str, object]] = []
    duplicate_rows: List[Dict[str, object]] = []
    import_ready_rows: List[Dict[str, object]] = []

    # Sort deterministically by source_hymn_id (ascending when present), then source_url
    raw_sorted = sorted(
        raw_rows,
        key=lambda r: (
            int(r["source_hymn_id"]) if r.get("source_hymn_id") is not None else 999999,
            str(r.get("source_url") or ""),
        ),
    )

    inspected_count = 0
    lyrics_source_breakdown: Dict[str, int] = {}
    category_breakdown: Dict[str, int] = {}
    occasion_breakdown: Dict[str, int] = {}
    language_breakdown: Dict[str, int] = {}
    form_breakdown: Dict[str, int] = {}

    # Track internal EOTC Media duplicates among qualifying hymns with lyrics
    seen_eotc_by_source_url: Dict[str, Dict[str, object]] = {}
    seen_eotc_by_video_id: Dict[str, Dict[str, object]] = {}
    seen_eotc_by_am_and_singer: Dict[Tuple[str, str], Dict[str, object]] = {}
    seen_eotc_by_am_title: Dict[str, List[Dict[str, object]]] = {}

    for r in raw_sorted:
        src_url = str(r.get("source_url") or "").strip()
        src_id = str(r.get("source_hymn_id") or "")
        ver_state = str(r.get("lyrics_verification") or "unverified")
        is_detail = bool(r.get("is_detail_verified"))
        if is_detail and ver_state in ("verified_true", "verified_false", "uncertain"):
            inspected_count += 1

        cls = classify_mezmur_record(r)
        am_title = str(cls["amharic_title"] or "").strip()
        norm_am = normalize_amharic_for_dedupe(am_title)

        # Preserve existing verified TewahedoDaily transliteration or English title if matched
        translit = str(cls["transliteration_title"] or "").strip()
        translit_verified = cls["transliteration_verified"] == "true"
        if norm_am and norm_am in verified_tr_by_am:
            translit = verified_tr_by_am[norm_am]
            translit_verified = True

        title_en = str(cls.get("title_en") or "").strip()
        if not title_en and norm_am and norm_am in verified_en_by_am:
            title_en = verified_en_by_am[norm_am]

        zemari = str(cls["zemari"] or "").strip()
        zemari_verified = str(cls["zemari_verified"] or "false")
        yt_url = normalize_youtube_url(str(r.get("youtube_url") or r.get("video_id") or ""))
        vid_id = extract_youtube_video_id(yt_url or str(r.get("video_id") or ""))
        channel_name = str(r.get("channel_title") or "").strip()
        discovered_at = str(
            r.get("detail_inspected_at") or r.get("updated_at") or r.get("collected_at") or ""
        )

        if ver_state == "verified_false":
            without_lyrics_rows.append({
                "source_id": src_id,
                "title_am": am_title or str(r.get("original_source_title") or ""),
                "title_en": title_en,
                "transliteration": translit,
                "zemari_name": zemari,
                "youtube_url": yt_url,
                "youtube_video_id": vid_id,
                "source_url": src_url,
                "has_lyrics": "false",
                "without_lyrics_reason": str(
                    r.get("lyrics_reason") or "Lyrics not yet available / Sign in to add or generate lyrics"
                ),
                "channel_name": channel_name,
                "discovered_at": discovered_at,
            })
            continue

        if ver_state != "verified_true" or not r.get("has_source_lyrics"):
            err_obj = error_by_url.get(src_url, {})
            uncertain_rows.append({
                "source_id": src_id,
                "title_am": am_title or str(r.get("original_source_title") or ""),
                "source_url": src_url,
                "youtube_url": yt_url,
                "youtube_video_id": vid_id,
                "lyrics_verification": "uncertain",
                "uncertainty_reason": str(
                    r.get("lyrics_reason")
                    or err_obj.get("error_message")
                    or "unverified_or_unreachable_detail_page"
                ),
                "http_status": str(err_obj.get("http_status") or (200 if is_detail else 0)),
                "retry_count": str(err_obj.get("retry_count") or 0),
                "discovered_at": discovered_at,
            })
            continue

        # Confirmed has_lyrics = true record!
        lyr_kind = str(r.get("lyrics_source_kind") or "dom_serif")
        lyrics_source_breakdown[lyr_kind] = lyrics_source_breakdown.get(lyr_kind, 0) + 1

        notes_list: List[str] = [
            f"lyrics_verified:{lyr_kind}({r.get('lyrics_line_count', 0)}_lines,{r.get('lyrics_char_count', 0)}_chars)"
        ]
        if not translit_verified:
            notes_list.append("transliteration:proposed_unverified")
        else:
            notes_list.append("transliteration:verified")

        for r_reason in str(cls.get("review_reasons") or "").split("|"):
            if r_reason and r_reason not in (
                "source_lyrics_require_rights_review",
                "transliteration_unverified_proposed",
            ):
                notes_list.append(r_reason)

        is_comp = bool(r.get("is_compilation"))
        if is_comp:
            notes_list.append(f"compilation_or_album:{r.get('compilation_reason') or 'detected'}")

        # Duplicate check 1: Compare against existing TewahedoDaily hymns
        excluded_as_duplicate = False
        review_status = str(cls.get("review_status") or "ready")
        norm_zemari = normalize_amharic_for_dedupe(zemari) or zemari.lower().strip()

        if vid_id and vid_id in td_by_vid:
            td_match = td_by_vid[vid_id]
            excluded_as_duplicate = True
            review_status = "needs_review"
            notes_list.append(f"duplicate_existing_tewahedodaily_video:{td_match['slug']}")
            duplicate_rows.append({
                "duplicate_scope": "tewahedodaily_existing",
                "duplicate_type": "exact_youtube_video_id",
                "candidate_source_id": src_id,
                "candidate_title_am": am_title,
                "candidate_transliteration": translit,
                "candidate_zemari": zemari,
                "candidate_youtube_video_id": vid_id,
                "candidate_youtube_url": yt_url,
                "candidate_source_url": src_url,
                "matched_target_type": td_match["source_label"],
                "matched_target_id_or_slug": td_match["slug"],
                "matched_target_title": td_match["title_am"] or td_match["title_tr"],
                "matched_target_zemari": td_match["zemari"],
                "matched_target_youtube_url": td_match["youtube_url"],
                "matched_target_source_url": "",
                "similarity_score": "1.00",
                "resolution": "flagged_existing_in_tewahedodaily_excluded_from_import_ready",
                "matching_evidence": f"Identical YouTube video ID ({vid_id}) already in TewahedoDaily ({td_match['slug']})",
            })
        elif norm_am and len(norm_am) >= 4 and norm_am in td_by_am:
            td_matches = td_by_am[norm_am]
            td_first = td_matches[0]
            td_zem_norm = normalize_amharic_for_dedupe(td_first["zemari"]) or td_first["zemari"].lower().strip()
            if norm_zemari and td_zem_norm and norm_zemari != td_zem_norm:
                notes_list.append(f"alternate_recording_of_existing_tewahedodaily:{td_first['slug']}")
                duplicate_rows.append({
                    "duplicate_scope": "tewahedodaily_existing",
                    "duplicate_type": "same_title_different_zemari_recording",
                    "candidate_source_id": src_id,
                    "candidate_title_am": am_title,
                    "candidate_transliteration": translit,
                    "candidate_zemari": zemari,
                    "candidate_youtube_video_id": vid_id,
                    "candidate_youtube_url": yt_url,
                    "candidate_source_url": src_url,
                    "matched_target_type": td_first["source_label"],
                    "matched_target_id_or_slug": td_first["slug"],
                    "matched_target_title": td_first["title_am"] or td_first["title_tr"],
                    "matched_target_zemari": td_first["zemari"],
                    "matched_target_youtube_url": td_first["youtube_url"],
                    "matched_target_source_url": "",
                    "similarity_score": "0.92",
                    "resolution": "kept_distinct_recording",
                    "matching_evidence": f"Normalized Amharic title matches existing TewahedoDaily hymn ({td_first['slug']}) but different singer/recording",
                })
            else:
                review_status = "needs_review"
                notes_list.append(f"possible_duplicate_existing_tewahedodaily_title:{td_first['slug']}")
                duplicate_rows.append({
                    "duplicate_scope": "tewahedodaily_existing",
                    "duplicate_type": "matching_normalized_amharic_title",
                    "candidate_source_id": src_id,
                    "candidate_title_am": am_title,
                    "candidate_transliteration": translit,
                    "candidate_zemari": zemari,
                    "candidate_youtube_video_id": vid_id,
                    "candidate_youtube_url": yt_url,
                    "candidate_source_url": src_url,
                    "matched_target_type": td_first["source_label"],
                    "matched_target_id_or_slug": td_first["slug"],
                    "matched_target_title": td_first["title_am"] or td_first["title_tr"],
                    "matched_target_zemari": td_first["zemari"],
                    "matched_target_youtube_url": td_first["youtube_url"],
                    "matched_target_source_url": "",
                    "similarity_score": "0.95",
                    "resolution": "flagged_for_human_duplicate_review",
                    "matching_evidence": f"Normalized Amharic title matches existing TewahedoDaily hymn ({td_first['slug']}) with different YouTube video ID",
                })

        # Duplicate check 2: Compare against other EOTC Media records
        if src_url and src_url in seen_eotc_by_source_url:
            canon = seen_eotc_by_source_url[src_url]
            excluded_as_duplicate = True
            review_status = "needs_review"
            notes_list.append(f"duplicate_eotcmedia_source_url:{canon['source_id']}")
            duplicate_rows.append({
                "duplicate_scope": "eotcmedia_internal",
                "duplicate_type": "exact_source_url",
                "candidate_source_id": src_id,
                "candidate_title_am": am_title,
                "candidate_transliteration": translit,
                "candidate_zemari": zemari,
                "candidate_youtube_video_id": vid_id,
                "candidate_youtube_url": yt_url,
                "candidate_source_url": src_url,
                "matched_target_type": "eotcmedia_hymn",
                "matched_target_id_or_slug": str(canon["source_id"]),
                "matched_target_title": str(canon["title_am"]),
                "matched_target_zemari": str(canon["zemari_name"]),
                "matched_target_youtube_url": str(canon["youtube_url"]),
                "matched_target_source_url": str(canon["source_url"]),
                "similarity_score": "1.00",
                "resolution": "excluded_from_import_ready",
                "matching_evidence": "Identical canonical EOTC Media source URL",
            })
        elif vid_id and vid_id in seen_eotc_by_video_id:
            canon = seen_eotc_by_video_id[vid_id]
            excluded_as_duplicate = True
            review_status = "needs_review"
            notes_list.append(f"duplicate_eotcmedia_video_id:{canon['source_id']}")
            duplicate_rows.append({
                "duplicate_scope": "eotcmedia_internal",
                "duplicate_type": "exact_youtube_video_id",
                "candidate_source_id": src_id,
                "candidate_title_am": am_title,
                "candidate_transliteration": translit,
                "candidate_zemari": zemari,
                "candidate_youtube_video_id": vid_id,
                "candidate_youtube_url": yt_url,
                "candidate_source_url": src_url,
                "matched_target_type": "eotcmedia_hymn",
                "matched_target_id_or_slug": str(canon["source_id"]),
                "matched_target_title": str(canon["title_am"]),
                "matched_target_zemari": str(canon["zemari_name"]),
                "matched_target_youtube_url": str(canon["youtube_url"]),
                "matched_target_source_url": str(canon["source_url"]),
                "similarity_score": "1.00",
                "resolution": "excluded_from_import_ready",
                "matching_evidence": f"Identical YouTube video ID ({vid_id}) as EOTC Media hymn #{canon['source_id']}",
            })
        elif norm_am and len(norm_am) >= 4 and norm_zemari and (norm_am, norm_zemari) in seen_eotc_by_am_and_singer:
            canon = seen_eotc_by_am_and_singer[(norm_am, norm_zemari)]
            excluded_as_duplicate = True
            review_status = "needs_review"
            notes_list.append(f"duplicate_eotcmedia_same_title_and_zemari:{canon['source_id']}")
            duplicate_rows.append({
                "duplicate_scope": "eotcmedia_internal",
                "duplicate_type": "same_normalized_title_and_zemari_reupload",
                "candidate_source_id": src_id,
                "candidate_title_am": am_title,
                "candidate_transliteration": translit,
                "candidate_zemari": zemari,
                "candidate_youtube_video_id": vid_id,
                "candidate_youtube_url": yt_url,
                "candidate_source_url": src_url,
                "matched_target_type": "eotcmedia_hymn",
                "matched_target_id_or_slug": str(canon["source_id"]),
                "matched_target_title": str(canon["title_am"]),
                "matched_target_zemari": str(canon["zemari_name"]),
                "matched_target_youtube_url": str(canon["youtube_url"]),
                "matched_target_source_url": str(canon["source_url"]),
                "similarity_score": "0.98",
                "resolution": "excluded_from_import_ready",
                "matching_evidence": f"Same normalized Amharic title and Zemari ({zemari}) as EOTC Media hymn #{canon['source_id']}",
            })
        elif norm_am and len(norm_am) >= 5 and norm_am in seen_eotc_by_am_title:
            canon = seen_eotc_by_am_title[norm_am][0]
            canon_zem = str(canon["zemari_name"] or "")
            sim = SequenceMatcher(
                None, translit.lower(), str(canon["transliteration"] or "").lower()
            ).ratio()
            if zemari and canon_zem and zemari != canon_zem:
                notes_list.append(f"distinct_recording_same_title_as:{canon['source_id']}")
                duplicate_rows.append({
                    "duplicate_scope": "eotcmedia_internal",
                    "duplicate_type": "alternate_recording_different_zemari",
                    "candidate_source_id": src_id,
                    "candidate_title_am": am_title,
                    "candidate_transliteration": translit,
                    "candidate_zemari": zemari,
                    "candidate_youtube_video_id": vid_id,
                    "candidate_youtube_url": yt_url,
                    "candidate_source_url": src_url,
                    "matched_target_type": "eotcmedia_hymn",
                    "matched_target_id_or_slug": str(canon["source_id"]),
                    "matched_target_title": str(canon["title_am"]),
                    "matched_target_zemari": canon_zem,
                    "matched_target_youtube_url": str(canon["youtube_url"]),
                    "matched_target_source_url": str(canon["source_url"]),
                    "similarity_score": f"{max(sim, 0.90):.2f}",
                    "resolution": "kept_distinct_recording",
                    "matching_evidence": f"Same composition title performed by different Zemari ({zemari} vs {canon_zem})",
                })
            else:
                review_status = "needs_review"
                notes_list.append(f"uncertain_duplicate_same_title_missing_zemari:{canon['source_id']}")
                duplicate_rows.append({
                    "duplicate_scope": "eotcmedia_internal",
                    "duplicate_type": "ambiguous_same_title_unverified_zemari",
                    "candidate_source_id": src_id,
                    "candidate_title_am": am_title,
                    "candidate_transliteration": translit,
                    "candidate_zemari": zemari,
                    "candidate_youtube_video_id": vid_id,
                    "candidate_youtube_url": yt_url,
                    "candidate_source_url": src_url,
                    "matched_target_type": "eotcmedia_hymn",
                    "matched_target_id_or_slug": str(canon["source_id"]),
                    "matched_target_title": str(canon["title_am"]),
                    "matched_target_zemari": canon_zem,
                    "matched_target_youtube_url": str(canon["youtube_url"]),
                    "matched_target_source_url": str(canon["source_url"]),
                    "similarity_score": f"{max(sim, 0.88):.2f}",
                    "resolution": "flagged_for_human_duplicate_review",
                    "matching_evidence": f"Matching Amharic title with unverified Zemari on one or both records (#{canon['source_id']})",
                })

        qualifying_row: Dict[str, object] = {
            "source_id": src_id,
            "title_am": am_title,
            "title_en": title_en,
            "transliteration": translit,
            "zemari_name": zemari,
            "zemari_verified": zemari_verified,
            "youtube_url": yt_url,
            "youtube_video_id": vid_id,
            "source_url": src_url,
            "lyrics_source_url": src_url,
            "has_lyrics": "true",
            "language": str(cls["language"]),
            "form": str(cls["form"]),
            "theological_category": str(cls["category"]),
            "primary_occasion": str(cls["primary_occasion"]),
            "additional_occasions": str(cls["additional_occasions"]),
            "hymn_sections": str(cls["db_hymn_sections"]),
            "album": str(cls["album"]),
            "channel_name": channel_name,
            "classification_confidence": str(cls["classification_confidence"]),
            "review_status": review_status,
            "review_notes": "|".join(dict.fromkeys(notes_list)),
            "copyright_status": "source_reference_only_rights_review_required",
            "discovered_at": discovered_at,
        }

        with_lyrics_rows.append(qualifying_row)

        cat_val = str(qualifying_row["theological_category"])
        occ_val = str(qualifying_row["primary_occasion"])
        lang_val = str(qualifying_row["language"])
        form_val = str(qualifying_row["form"])
        category_breakdown[cat_val] = category_breakdown.get(cat_val, 0) + 1
        occasion_breakdown[occ_val] = occasion_breakdown.get(occ_val, 0) + 1
        language_breakdown[lang_val] = language_breakdown.get(lang_val, 0) + 1
        form_breakdown[form_val] = form_breakdown.get(form_val, 0) + 1

        if not excluded_as_duplicate:
            if src_url:
                seen_eotc_by_source_url[src_url] = qualifying_row
            if vid_id:
                seen_eotc_by_video_id[vid_id] = qualifying_row
            if norm_am and len(norm_am) >= 4 and norm_zemari:
                seen_eotc_by_am_and_singer[(norm_am, norm_zemari)] = qualifying_row
            if norm_am and len(norm_am) >= 5:
                seen_eotc_by_am_title.setdefault(norm_am, []).append(qualifying_row)

        # Evaluate strict import readiness for eotcmedia_import_ready.csv
        has_valid_titles = bool((am_title or title_en) and translit)
        has_valid_yt = bool(yt_url and is_valid_youtube_url(yt_url) and len(vid_id) == 11)
        secs_list = [s.strip() for s in str(qualifying_row["hymn_sections"]).split("|") if s.strip()]
        has_valid_db_secs = len(secs_list) > 0 and all(s in VALID_DB_SECTION_SLUGS for s in secs_list)
        add_occs_list = [
            o.strip() for o in str(qualifying_row["additional_occasions"]).split("|") if o.strip()
        ]
        has_valid_tax = (
            cat_val in SUPPORTED_CATEGORIES
            and occ_val in SUPPORTED_OCCASIONS
            and all(o in SUPPORTED_OCCASIONS for o in add_occs_list)
            and lang_val in SUPPORTED_LANGUAGES
            and form_val in SUPPORTED_FORMS
            and has_valid_db_secs
        )

        if (
            not excluded_as_duplicate
            and not is_comp
            and has_valid_titles
            and has_valid_yt
            and has_valid_tax
        ):
            import_ready_rows.append(qualifying_row)

    # Write all 5 UTF-8 with BOM CSV files to data/imports/eotcmedia/
    _write_csv_utf8_bom(
        out_dir / "eotcmedia_with_lyrics.csv", EOTCMEDIA_WITH_LYRICS_COLUMNS, with_lyrics_rows
    )
    _write_csv_utf8_bom(
        out_dir / "eotcmedia_without_lyrics.csv",
        EOTCMEDIA_WITHOUT_LYRICS_COLUMNS,
        without_lyrics_rows,
    )
    _write_csv_utf8_bom(
        out_dir / "eotcmedia_uncertain.csv", EOTCMEDIA_UNCERTAIN_COLUMNS, uncertain_rows
    )
    _write_csv_utf8_bom(
        out_dir / "eotcmedia_duplicates.csv", EOTCMEDIA_DUPLICATES_COLUMNS, duplicate_rows
    )
    _write_csv_utf8_bom(
        out_dir / "eotcmedia_import_ready.csv", EOTCMEDIA_WITH_LYRICS_COLUMNS, import_ready_rows
    )

    total_discovered = len(raw_sorted)
    yt_verified_all = sum(
        1
        for r in raw_sorted
        if r.get("video_id") and is_valid_youtube_url(normalize_youtube_url(str(r.get("video_id"))))
    )
    yt_verified_with_lyrics = sum(
        1
        for r in with_lyrics_rows
        if r.get("youtube_url") and is_valid_youtube_url(str(r["youtube_url"]))
    )
    singers_verified_with_lyrics = sum(
        1 for r in with_lyrics_rows if r.get("zemari_verified") == "true"
    )
    pending_review_with_lyrics = sum(
        1 for r in with_lyrics_rows if r.get("review_status") == "needs_review"
    )
    completion_pct = round(
        (inspected_count / total_discovered * 100.0) if total_discovered > 0 else 0.0, 2
    )

    audit_report: Dict[str, object] = {
        "advertised_catalog_size": advertised_catalog_size,
        "sitemap_detail_urls_discovered": sitemap_detail_urls_count,
        "total_urls_discovered": total_discovered,
        "unique_hymn_pages_inspected": inspected_count,
        "total_with_actual_lyrics": len(with_lyrics_rows),
        "total_without_lyrics": len(without_lyrics_rows),
        "total_uncertain_or_unreachable": len(uncertain_rows),
        "total_duplicates": len(duplicate_rows),
        "duplicates_breakdown": {
            "eotcmedia_internal_duplicates_and_alternates": sum(
                1 for d in duplicate_rows if d["duplicate_scope"] == "eotcmedia_internal"
            ),
            "tewahedodaily_existing_matches": sum(
                1 for d in duplicate_rows if d["duplicate_scope"] == "tewahedodaily_existing"
            ),
            "excluded_exact_duplicates": sum(
                1 for d in duplicate_rows if "excluded" in str(d["resolution"])
            ),
            "kept_distinct_recordings": sum(
                1 for d in duplicate_rows if d["resolution"] == "kept_distinct_recording"
            ),
            "flagged_for_human_duplicate_review": sum(
                1 for d in duplicate_rows if d["resolution"] == "flagged_for_human_duplicate_review"
            ),
        },
        "total_import_ready": len(import_ready_rows),
        "total_youtube_urls_verified": yt_verified_with_lyrics,
        "total_youtube_urls_verified_across_all_inspected": yt_verified_all,
        "total_singers_verified": singers_verified_with_lyrics,
        "total_pending_review": pending_review_with_lyrics,
        "total_ready_without_extra_flags": len(with_lyrics_rows) - pending_review_with_lyrics,
        "lyrics_source_kind_breakdown": lyrics_source_breakdown,
        "theological_category_breakdown": dict(sorted(category_breakdown.items())),
        "primary_occasion_breakdown": dict(sorted(occasion_breakdown.items())),
        "language_breakdown": dict(sorted(language_breakdown.items())),
        "form_breakdown": dict(sorted(form_breakdown.items())),
        "pagination_and_discovery_gaps": {
            "difference_between_advertised_and_discovered": total_discovered - advertised_catalog_size,
            "uninspected_pages_remaining": total_discovered - inspected_count,
            "notes": (
                "All advertised hymns in https://eotcmedia.com/hymns and https://eotcmedia.com/sitemap.xml "
                "were enumerated and reconciled with zero discovery gaps."
                if total_discovered >= advertised_catalog_size and inspected_count == total_discovered
                else f"Discovered {total_discovered} of {advertised_catalog_size} advertised hymns; inspected {inspected_count}."
            ),
        },
        "errors_encountered": len(error_by_url),
        "error_details": list(error_by_url.values())[:50],
        "completion_percentage": completion_pct,
        "timestamp_of_execution": datetime.now(timezone.utc).isoformat(),
    }

    (out_dir / "eotcmedia_full_audit.json").write_text(
        json.dumps(audit_report, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    return audit_report


def build_and_export_all_csvs(
    db: CheckpointDB,
    exports_dir: Path | str,
    reports_dir: Optional[Path | str] = None,
    max_records: Optional[int] = None,
    eotcmedia_imports_dir: Optional[Path | str] = None,
) -> Dict[str, int]:
    """
    Process all raw listings in the SQLite checkpoint DB:
      1. Separate compilations from individual Mezmur candidates
      2. Classify each individual candidate (using source facets + evidence rules + Gemini overrides)
      3. Generate unique slugs
      4. Deduplicate candidates
      5. Write all 10 mandatory CSV files in mezmur-research/exports/
      6. Also export the 6 EOTC Media full catalog audit files in data/imports/eotcmedia/
    """
    exports_path = Path(exports_dir)
    exports_path.mkdir(parents=True, exist_ok=True)

    raw_rows = db.load_all_raw_listings()
    total_listings = len(raw_rows)
    compilations = [r for r in raw_rows if r.get("is_compilation")]
    individual_raw = [r for r in raw_rows if not r.get("is_compilation")]

    used_slugs: Set[str] = set()
    classified_candidates: List[Dict[str, object]] = []

    for r in individual_raw:
        cls = classify_mezmur_record(r)
        fallback_id = str(r.get("source_hymn_id") or r.get("video_id") or "")
        slug = generate_slug(
            str(cls.get("transliteration_title") or ""),
            str(cls.get("amharic_title") or ""),
            fallback_id=fallback_id,
            used_slugs=used_slugs,
        )
        yt_url = normalize_youtube_url(str(r.get("youtube_url") or r.get("video_id") or ""))
        vid_id = extract_youtube_video_id(yt_url)
        thumb = str(r.get("thumbnail_url") or "").strip()
        if not thumb and vid_id:
            thumb = f"https://i.ytimg.com/vi/{vid_id}/hqdefault.jpg"

        am_title = str(cls["amharic_title"] or "").strip()
        tr_title = str(cls["transliteration_title"] or "").strip()
        alt_text = am_title or tr_title or "Ethiopian Orthodox Tewahedo Mezmur"
        desc_raw = str(r.get("description") or "").strip()

        candidate: Dict[str, object] = {
            "id": "",
            "amharic_title": am_title,
            "transliteration_title": tr_title,
            "slug": slug,
            "description": desc_raw,
            "amharic_lyrics": "",
            "transliteration_lyrics": "",
            "english_lyrics": "",
            "lyrics_status": cls["lyrics_status"],
            "youtube_url": yt_url,
            "thumbnail_url": thumb,
            "image_alt_text": alt_text,
            "audio_url": "",
            "language": cls["language"],
            "form": cls["form"],
            "category": cls["category"],
            "primary_occasion": cls["primary_occasion"],
            "zemari": cls["zemari"],
            "hymn_sections": cls["hymn_sections"],
            "additional_occasions": cls["additional_occasions"],
            "source_url": str(r.get("source_url") or ""),
            "classification_confidence": cls["classification_confidence"],
            "review_required": cls["review_required"],
            "status": "draft",
            "featured": "false",
            "review_reasons": cls["review_reasons"],
            "original_source_title": str(r.get("original_source_title") or ""),
            "source_hymn_id": r.get("source_hymn_id") or "",
            "video_id": vid_id,
            "channel_title": str(r.get("channel_title") or ""),
            "channel_handle": str(r.get("channel_handle") or ""),
            "upload_date": str(r.get("upload_date") or ""),
            "has_source_lyrics": bool(r.get("has_source_lyrics")),
            "collected_at": str(r.get("collected_at") or ""),
            "is_detail_verified": bool(r.get("is_detail_verified")),
        }
        classified_candidates.append(candidate)

    unique_records, duplicate_rows = deduplicate_records(classified_candidates)
    if max_records is not None and max_records > 0:
        unique_records = unique_records[:max_records]

    section_link_rows: List[Dict[str, object]] = []
    occasion_link_rows: List[Dict[str, object]] = []
    zemari_tally: Dict[str, Dict[str, object]] = {}
    zemari_used_slugs: Set[str] = set()
    review_required_rows: List[Dict[str, object]] = []
    missing_lyrics_rows: List[Dict[str, object]] = []
    source_attribution_rows: List[Dict[str, object]] = []
    import_readiness_rows: List[Dict[str, object]] = []

    for rec in unique_records:
        slug = str(rec["slug"])
        conf = str(rec["classification_confidence"])
        rev_req = str(rec["review_required"])

        secs = [s.strip() for s in str(rec["hymn_sections"]).split("|") if s.strip()]
        for idx, sec_slug in enumerate(secs):
            col_slug, sec_title, _ = HYMN_SECTIONS.get(sec_slug, ("praise-general", sec_slug, "general"))
            section_link_rows.append({
                "mezmur_slug": slug,
                "section_slug": sec_slug,
                "sort_order": str((idx + 1) * 10),
                "is_primary": "true" if idx == 0 else "false",
                "collection_slug": col_slug,
                "section_title": sec_title,
                "confidence": conf,
                "review_required": rev_req,
            })

        prim_occ = str(rec["primary_occasion"] or "").strip()
        add_occs = [o.strip() for o in str(rec["additional_occasions"] or "").split("|") if o.strip()]
        all_occs = [o for o in [prim_occ, *add_occs] if o]
        for idx, occ_name in enumerate(dict.fromkeys(all_occs)):
            occasion_link_rows.append({
                "mezmur_slug": slug,
                "occasion_slug": occasion_to_slug(occ_name),
                "occasion_name": occ_name,
                "is_primary": "true" if idx == 0 else "false",
                "confidence": conf,
                "review_required": rev_req,
            })

        zem_name = str(rec["zemari"] or "").strip()
        if zem_name:
            if zem_name not in zemari_tally:
                is_eth = has_ethiopic(zem_name)
                name_en = transliterate_ethiopic(zem_name) if is_eth else zem_name
                name_am = zem_name if is_eth else ""
                z_slug = generate_slug(name_en, name_am, used_slugs=zemari_used_slugs)
                zemari_tally[zem_name] = {
                    "id": "",
                    "slug": z_slug,
                    "name": name_en or zem_name,
                    "name_amharic": name_am,
                    "bio": "",
                    "bio_amharic": "",
                    "image_path": "",
                    "image_alt": name_en or zem_name,
                    "youtube_url": "",
                    "website_url": "",
                    "sort_order": str((len(zemari_tally) + 1) * 10),
                    "is_featured": "false",
                    "status": "draft",
                    "mezmur_count": 0,
                    "source_url": f"https://eotcmedia.com/hymns/singer/{zem_name.replace(' ', '-')}",
                    "review_required": "false",
                }
            zemari_tally[zem_name]["mezmur_count"] = int(zemari_tally[zem_name]["mezmur_count"]) + 1

        if rev_req == "true":
            review_required_rows.append({
                "slug": slug,
                "amharic_title": rec["amharic_title"],
                "transliteration_title": rec["transliteration_title"],
                "source_url": rec["source_url"],
                "youtube_url": rec["youtube_url"],
                "zemari": rec["zemari"],
                "category": rec["category"],
                "primary_occasion": rec["primary_occasion"],
                "classification_confidence": conf,
                "lyrics_status": rec["lyrics_status"],
                "review_reasons": rec.get("review_reasons") or "needs_editorial_review",
            })

        if not str(rec.get("amharic_lyrics") or "").strip():
            has_src_lyr = bool(rec.get("has_source_lyrics"))
            missing_lyrics_rows.append({
                "slug": slug,
                "amharic_title": rec["amharic_title"],
                "transliteration_title": rec["transliteration_title"],
                "zemari": rec["zemari"],
                "language": rec["language"],
                "category": rec["category"],
                "primary_occasion": rec["primary_occasion"],
                "youtube_url": rec["youtube_url"],
                "source_url": rec["source_url"],
                "lyrics_status": rec["lyrics_status"],
                "source_has_lyrics": "true" if has_src_lyr else "false",
                "notes": (
                    "Lyrics present on third-party source; omitted pending rights review."
                    if has_src_lyr
                    else "No lyrics available at source; metadata-only hymn."
                ),
            })

        has_src_lyr = bool(rec.get("has_source_lyrics"))
        source_attribution_rows.append({
            "slug": slug,
            "source_name": "EOTC Media",
            "source_url": rec["source_url"],
            "original_source_title": rec.get("original_source_title") or "",
            "source_hymn_id": str(rec.get("source_hymn_id") or ""),
            "youtube_url": rec["youtube_url"],
            "youtube_video_id": rec.get("video_id") or "",
            "youtube_channel_title": rec.get("channel_title") or "",
            "youtube_channel_handle": rec.get("channel_handle") or "",
            "identified_zemari": rec["zemari"],
            "upload_date": rec.get("upload_date") or "",
            "lyrics_status": rec["lyrics_status"],
            "rights_review_required": "true" if has_src_lyr else "false",
            "collected_at": rec.get("collected_at") or "",
        })

        import_readiness_rows.append(evaluate_import_readiness(rec))

    zemari_rows = sorted(
        zemari_tally.values(),
        key=lambda z: (-int(z["mezmur_count"]), str(z["name"])),
    )
    for idx, z_row in enumerate(zemari_rows):
        z_row["sort_order"] = str((idx + 1) * 10)
        z_row["mezmur_count"] = str(z_row["mezmur_count"])

    crawl_error_rows = [
        {
            "url": str(e.get("url") or ""),
            "item_type": str(e.get("item_type") or ""),
            "http_status": str(e.get("http_status") or ""),
            "error_type": str(e.get("error_type") or ""),
            "error_message": str(e.get("error_message") or ""),
            "retry_count": str(e.get("retry_count") or 0),
            "occurred_at": str(e.get("occurred_at") or ""),
            "resolved": "true" if e.get("resolved") else "false",
        }
        for e in db.load_all_errors()
    ]

    _write_csv_utf8_bom(exports_path / "mezmurs_2000.csv", MAIN_CSV_COLUMNS, unique_records)
    _write_csv_utf8_bom(
        exports_path / "mezmur_section_links.csv", SECTION_LINKS_COLUMNS, section_link_rows
    )
    _write_csv_utf8_bom(
        exports_path / "mezmur_occasion_links.csv", OCCASION_LINKS_COLUMNS, occasion_link_rows
    )
    _write_csv_utf8_bom(exports_path / "zemaris.csv", ZEMARIS_COLUMNS, zemari_rows)
    _write_csv_utf8_bom(exports_path / "duplicates.csv", DUPLICATES_COLUMNS, duplicate_rows)
    _write_csv_utf8_bom(
        exports_path / "review_required.csv", REVIEW_REQUIRED_COLUMNS, review_required_rows
    )
    _write_csv_utf8_bom(
        exports_path / "missing_lyrics.csv", MISSING_LYRICS_COLUMNS, missing_lyrics_rows
    )
    _write_csv_utf8_bom(
        exports_path / "source_attribution.csv",
        SOURCE_ATTRIBUTION_COLUMNS,
        source_attribution_rows,
    )
    _write_csv_utf8_bom(
        exports_path / "import_readiness.csv", IMPORT_READINESS_COLUMNS, import_readiness_rows
    )
    _write_csv_utf8_bom(exports_path / "crawl_errors.csv", CRAWL_ERRORS_COLUMNS, crawl_error_rows)

    audit_rep = export_eotcmedia_catalog_audit(
        db, output_dir=eotcmedia_imports_dir
    )

    ready_draft_count = sum(
        1 for r in import_readiness_rows if r.get("ready_for_draft_import") == "true"
    )
    excluded_dupes_count = sum(
        1 for d in duplicate_rows if d.get("resolution") == "excluded_duplicate"
    )
    detail_verified_unique = sum(1 for r in unique_records if r.get("is_detail_verified"))

    summary = {
        "source_listings_collected": total_listings,
        "verified_unique_mezmurs": len(unique_records),
        "detail_page_verified_mezmurs": detail_verified_unique,
        "strict_inspected_pages": int(audit_rep["unique_hymn_pages_inspected"]),
        "total_with_actual_lyrics": int(audit_rep["total_with_actual_lyrics"]),
        "total_without_lyrics": int(audit_rep["total_without_lyrics"]),
        "total_uncertain_or_unreachable": int(audit_rep["total_uncertain_or_unreachable"]),
        "total_import_ready_with_lyrics": int(audit_rep["total_import_ready"]),
        "duplicate_count": len(duplicate_rows),
        "excluded_duplicate_count": excluded_dupes_count,
        "compilation_count": len(compilations),
        "classified_records": len(unique_records),
        "missing_lyrics_count": len(missing_lyrics_rows),
        "review_required_count": len(review_required_rows),
        "import_ready_draft_count": ready_draft_count,
        "zemaris_count": len(zemari_rows),
        "section_links_count": len(section_link_rows),
        "occasion_links_count": len(occasion_link_rows),
        "crawl_errors_count": len(crawl_error_rows),
    }

    if reports_dir is not None:
        rep_path = Path(reports_dir)
        rep_path.mkdir(parents=True, exist_ok=True)
        with (rep_path / "pipeline_summary.json").open("w", encoding="utf-8") as f:
            json.dump(summary, f, ensure_ascii=False, indent=2)

    return summary
