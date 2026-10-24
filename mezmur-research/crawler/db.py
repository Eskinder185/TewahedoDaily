"""
SQLite checkpoint database manager for TewahedoDaily Mezmur crawler & classifier.
Supports full resumability, incremental checkpoints every batch,
strict ግጥም lyrics verification state, and merge-on-upsert so subcategory tags
and detail-page metadata combine cleanly.
"""
from __future__ import annotations
import json
import sqlite3
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

from classifier.deduplicator import is_compilation_record


def _utc_now() -> str:
    return datetime.now(timezone.utc).isoformat()


class CheckpointDB:
    def __init__(self, db_path: Path | str) -> None:
        self.db_path = Path(db_path)
        self.db_path.parent.mkdir(parents=True, exist_ok=True)
        self.conn = sqlite3.connect(str(self.db_path))
        self.conn.row_factory = sqlite3.Row
        self._init_schema()

    def _init_schema(self) -> None:
        cur = self.conn.cursor()
        cur.executescript(
            """
            PRAGMA journal_mode = WAL;
            PRAGMA synchronous = NORMAL;

            CREATE TABLE IF NOT EXISTS raw_listings (
                source_url TEXT PRIMARY KEY,
                source_hymn_id INTEGER,
                source_slug TEXT,
                original_source_title TEXT NOT NULL,
                description TEXT,
                video_id TEXT,
                youtube_url TEXT,
                thumbnail_url TEXT,
                singer TEXT,
                singers_json TEXT,
                channel_title TEXT,
                channel_slug TEXT,
                channel_handle TEXT,
                clicks_count INTEGER DEFAULT 0,
                upload_date TEXT,
                in_language TEXT,
                source_language_id INTEGER,
                source_category_ids_json TEXT,
                source_subcategory_ids_json TEXT,
                source_subcategories_json TEXT,
                has_source_lyrics INTEGER DEFAULT 0,
                source_lyrics_snippet TEXT,
                is_detail_verified INTEGER DEFAULT 0,
                is_compilation INTEGER DEFAULT 0,
                compilation_reason TEXT,
                gemini_classification_json TEXT,
                collected_at TEXT NOT NULL,
                updated_at TEXT NOT NULL,
                lyrics_verification TEXT DEFAULT 'unverified',
                lyrics_reason TEXT DEFAULT '',
                lyrics_source_kind TEXT DEFAULT '',
                lyrics_char_count INTEGER DEFAULT 0,
                lyrics_line_count INTEGER DEFAULT 0,
                detail_inspected_at TEXT DEFAULT '',
                full_lyrics TEXT DEFAULT ''
            );

            CREATE INDEX IF NOT EXISTS idx_raw_listings_video_id ON raw_listings(video_id);
            CREATE INDEX IF NOT EXISTS idx_raw_listings_hymn_id ON raw_listings(source_hymn_id);
            CREATE INDEX IF NOT EXISTS idx_raw_listings_detail ON raw_listings(is_detail_verified);

            CREATE TABLE IF NOT EXISTS visited_urls (
                url TEXT PRIMARY KEY,
                url_type TEXT NOT NULL,
                http_status INTEGER,
                visited_at TEXT NOT NULL
            );

            CREATE TABLE IF NOT EXISTS crawl_errors (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                url TEXT NOT NULL,
                item_type TEXT NOT NULL,
                http_status INTEGER,
                error_type TEXT NOT NULL,
                error_message TEXT NOT NULL,
                retry_count INTEGER DEFAULT 0,
                occurred_at TEXT NOT NULL,
                resolved INTEGER DEFAULT 0
            );

            CREATE TABLE IF NOT EXISTS crawl_checkpoints (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                milestone_label TEXT NOT NULL,
                total_listings INTEGER NOT NULL,
                detail_verified_count INTEGER NOT NULL,
                unique_mezmurs_count INTEGER NOT NULL,
                compilations_count INTEGER NOT NULL,
                duplicates_count INTEGER NOT NULL,
                created_at TEXT NOT NULL
            );
            """
        )
        # Ensure new columns exist on older SQLite files
        existing_cols = {
            str(r["name"])
            for r in cur.execute("PRAGMA table_info(raw_listings)").fetchall()
        }
        migrations = [
            ("lyrics_verification", "TEXT DEFAULT 'unverified'"),
            ("lyrics_reason", "TEXT DEFAULT ''"),
            ("lyrics_source_kind", "TEXT DEFAULT ''"),
            ("lyrics_char_count", "INTEGER DEFAULT 0"),
            ("lyrics_line_count", "INTEGER DEFAULT 0"),
            ("detail_inspected_at", "TEXT DEFAULT ''"),
            ("full_lyrics", "TEXT DEFAULT ''"),
        ]
        for col_name, col_def in migrations:
            if col_name not in existing_cols:
                cur.execute(f"ALTER TABLE raw_listings ADD COLUMN {col_name} {col_def}")
        self.conn.commit()

    def is_url_visited(self, url: str) -> bool:
        cur = self.conn.execute("SELECT 1 FROM visited_urls WHERE url = ?", (url,))
        return cur.fetchone() is not None

    def get_visited_urls(self, url_type: Optional[str] = None) -> Set[str]:
        if url_type:
            cur = self.conn.execute(
                "SELECT url FROM visited_urls WHERE url_type = ?", (url_type,)
            )
        else:
            cur = self.conn.execute("SELECT url FROM visited_urls")
        return {str(r["url"]) for r in cur.fetchall()}

    def get_strict_inspected_detail_urls(self) -> Set[str]:
        """Return source_urls whose detail page has been inspected with the strict ግጥም detector (and full_lyrics populated when verified_true)."""
        cur = self.conn.execute(
            """
            SELECT source_url FROM raw_listings
            WHERE is_detail_verified = 1
              AND (
                lyrics_verification = 'verified_false'
                OR (lyrics_verification = 'verified_true' AND full_lyrics IS NOT NULL AND full_lyrics != '')
              )
            """
        )
        return {str(r["source_url"]) for r in cur.fetchall()}

    def get_all_known_source_urls(self) -> Set[str]:
        """Return all canonical hymn source_urls currently known in raw_listings."""
        cur = self.conn.execute("SELECT source_url FROM raw_listings")
        return {str(r["source_url"]) for r in cur.fetchall() if r["source_url"]}

    def resolve_errors_for_url(self, url: str) -> None:
        """Mark any prior temporary crawl errors for url as resolved once fetched."""
        self.conn.execute(
            "UPDATE crawl_errors SET resolved = 1 WHERE url = ? AND resolved = 0",
            (url,),
        )

    def mark_url_visited(self, url: str, url_type: str, http_status: int = 200) -> None:
        self.conn.execute(
            """
            INSERT INTO visited_urls (url, url_type, http_status, visited_at)
            VALUES (?, ?, ?, ?)
            ON CONFLICT(url) DO UPDATE SET
                url_type = excluded.url_type,
                http_status = excluded.http_status,
                visited_at = excluded.visited_at
            """,
            (url, url_type, http_status, _utc_now()),
        )

    def log_error(
        self,
        url: str,
        item_type: str,
        http_status: int,
        error_type: str,
        error_message: str,
        retry_count: int = 0,
    ) -> None:
        self.conn.execute(
            """
            INSERT INTO crawl_errors (url, item_type, http_status, error_type, error_message, retry_count, occurred_at, resolved)
            VALUES (?, ?, ?, ?, ?, ?, ?, 0)
            """,
            (url, item_type, http_status, error_type, error_message, retry_count, _utc_now()),
        )
        self.conn.commit()

    def upsert_raw_listing(self, item: Dict[str, object]) -> None:
        src_url = str(item.get("source_url") or "").strip()
        if not src_url:
            return

        now = _utc_now()
        existing = self.conn.execute(
            "SELECT * FROM raw_listings WHERE source_url = ?", (src_url,)
        ).fetchone()

        new_cat_ids = list(item.get("source_category_ids") or [])  # type: ignore[arg-type]
        new_subcat_ids = list(item.get("source_subcategory_ids") or [])  # type: ignore[arg-type]
        new_subcats = list(item.get("source_subcategories") or [])  # type: ignore[arg-type]

        is_detail = bool(item.get("is_detail_verified"))
        new_lyr_ver = str(item.get("lyrics_verification") or "unverified")
        new_lyr_reason = str(item.get("lyrics_reason") or "")
        new_lyr_kind = str(item.get("lyrics_source_kind") or "")
        new_lyr_chars = int(item.get("lyrics_char_count") or 0)
        new_lyr_lines = int(item.get("lyrics_line_count") or 0)
        inspected_at = now if is_detail and new_lyr_ver != "unverified" else ""

        if existing is not None:
            old_cat_ids = json.loads(existing["source_category_ids_json"] or "[]")
            old_subcat_ids = json.loads(existing["source_subcategory_ids_json"] or "[]")
            old_subcats = json.loads(existing["source_subcategories_json"] or "[]")
            merged_cat_ids = list(dict.fromkeys([*old_cat_ids, *new_cat_ids]))
            merged_subcat_ids = list(dict.fromkeys([*old_subcat_ids, *new_subcat_ids]))
            merged_subcats = list(dict.fromkeys([*old_subcats, *new_subcats]))

            title = str(item.get("original_source_title") or existing["original_source_title"] or "")
            slug = str(item.get("source_slug") or existing["source_slug"] or "")
            singer = str(item.get("singer") or existing["singer"] or "")
            is_comp, comp_reason = is_compilation_record(
                title, slug, singer, merged_cat_ids, merged_subcat_ids
            )
            if existing["is_compilation"]:
                is_comp = True
                comp_reason = existing["compilation_reason"] or comp_reason

            singers_list = item.get("singers")
            old_singers = json.loads(existing["singers_json"] or "[]")
            merged_singers = (
                singers_list
                if (singers_list and len(singers_list) >= len(old_singers))  # type: ignore[arg-type]
                else old_singers
            )

            old_ver = str(existing["lyrics_verification"] or "unverified")
            if new_lyr_ver in ("verified_true", "verified_false", "uncertain"):
                final_ver = new_lyr_ver
                final_reason = new_lyr_reason
                final_kind = new_lyr_kind
                final_chars = new_lyr_chars
                final_lines = new_lyr_lines
                final_has_lyr = 1 if item.get("has_source_lyrics") else 0
                final_inspected_at = inspected_at or str(existing["detail_inspected_at"] or now)
            else:
                final_ver = old_ver
                final_reason = str(existing["lyrics_reason"] or "")
                final_kind = str(existing["lyrics_source_kind"] or "")
                final_chars = int(existing["lyrics_char_count"] or 0)
                final_lines = int(existing["lyrics_line_count"] or 0)
                final_has_lyr = max(int(existing["has_source_lyrics"] or 0), 1 if item.get("has_source_lyrics") else 0)
                final_inspected_at = str(existing["detail_inspected_at"] or "")

            self.conn.execute(
                """
                UPDATE raw_listings SET
                    source_hymn_id = COALESCE(?, source_hymn_id),
                    source_slug = COALESCE(NULLIF(?, ''), source_slug),
                    original_source_title = COALESCE(NULLIF(?, ''), original_source_title),
                    description = COALESCE(NULLIF(?, ''), description),
                    video_id = COALESCE(NULLIF(?, ''), video_id),
                    youtube_url = COALESCE(NULLIF(?, ''), youtube_url),
                    thumbnail_url = COALESCE(NULLIF(?, ''), thumbnail_url),
                    singer = COALESCE(NULLIF(?, ''), singer),
                    singers_json = ?,
                    channel_title = COALESCE(NULLIF(?, ''), channel_title),
                    channel_slug = COALESCE(NULLIF(?, ''), channel_slug),
                    channel_handle = COALESCE(NULLIF(?, ''), channel_handle),
                    clicks_count = MAX(clicks_count, ?),
                    upload_date = COALESCE(NULLIF(?, ''), upload_date),
                    in_language = COALESCE(NULLIF(?, ''), in_language),
                    source_language_id = COALESCE(?, source_language_id),
                    source_category_ids_json = ?,
                    source_subcategory_ids_json = ?,
                    source_subcategories_json = ?,
                    has_source_lyrics = ?,
                    source_lyrics_snippet = COALESCE(NULLIF(?, ''), source_lyrics_snippet),
                    full_lyrics = COALESCE(NULLIF(?, ''), full_lyrics),
                    is_detail_verified = MAX(is_detail_verified, ?),
                    is_compilation = ?,
                    compilation_reason = ?,
                    updated_at = ?,
                    lyrics_verification = ?,
                    lyrics_reason = ?,
                    lyrics_source_kind = ?,
                    lyrics_char_count = ?,
                    lyrics_line_count = ?,
                    detail_inspected_at = ?
                WHERE source_url = ?
                """,
                (
                    item.get("source_hymn_id"),
                    str(item.get("source_slug") or ""),
                    title,
                    str(item.get("description") or ""),
                    str(item.get("video_id") or ""),
                    str(item.get("youtube_url") or ""),
                    str(item.get("thumbnail_url") or ""),
                    singer,
                    json.dumps(merged_singers, ensure_ascii=False),
                    str(item.get("channel_title") or ""),
                    str(item.get("channel_slug") or ""),
                    str(item.get("channel_handle") or ""),
                    int(item.get("clicks_count") or 0),
                    str(item.get("upload_date") or ""),
                    str(item.get("in_language") or ""),
                    item.get("source_language_id"),
                    json.dumps(merged_cat_ids, ensure_ascii=False),
                    json.dumps(merged_subcat_ids, ensure_ascii=False),
                    json.dumps(merged_subcats, ensure_ascii=False),
                    final_has_lyr,
                    str(item.get("source_lyrics_snippet") or ""),
                    str(item.get("full_lyrics") or ""),
                    1 if is_detail else 0,
                    1 if is_comp else 0,
                    comp_reason,
                    now,
                    final_ver,
                    final_reason,
                    final_kind,
                    final_chars,
                    final_lines,
                    final_inspected_at,
                    src_url,
                ),
            )
        else:
            title = str(item.get("original_source_title") or "")
            slug = str(item.get("source_slug") or "")
            singer = str(item.get("singer") or "")
            is_comp, comp_reason = is_compilation_record(
                title, slug, singer, new_cat_ids, new_subcat_ids
            )
            self.conn.execute(
                """
                INSERT INTO raw_listings (
                    source_url, source_hymn_id, source_slug, original_source_title,
                    description, video_id, youtube_url, thumbnail_url,
                    singer, singers_json, channel_title, channel_slug, channel_handle,
                    clicks_count, upload_date, in_language, source_language_id,
                    source_category_ids_json, source_subcategory_ids_json, source_subcategories_json,
                    has_source_lyrics, source_lyrics_snippet, is_detail_verified,
                    is_compilation, compilation_reason, gemini_classification_json,
                    collected_at, updated_at,
                    lyrics_verification, lyrics_reason, lyrics_source_kind,
                    lyrics_char_count, lyrics_line_count, detail_inspected_at, full_lyrics
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """,
                (
                    src_url,
                    item.get("source_hymn_id"),
                    slug,
                    title,
                    str(item.get("description") or ""),
                    str(item.get("video_id") or ""),
                    str(item.get("youtube_url") or ""),
                    str(item.get("thumbnail_url") or ""),
                    singer,
                    json.dumps(item.get("singers") or [], ensure_ascii=False),
                    str(item.get("channel_title") or ""),
                    str(item.get("channel_slug") or ""),
                    str(item.get("channel_handle") or ""),
                    int(item.get("clicks_count") or 0),
                    str(item.get("upload_date") or ""),
                    str(item.get("in_language") or ""),
                    item.get("source_language_id"),
                    json.dumps(new_cat_ids, ensure_ascii=False),
                    json.dumps(new_subcat_ids, ensure_ascii=False),
                    json.dumps(new_subcats, ensure_ascii=False),
                    1 if item.get("has_source_lyrics") else 0,
                    str(item.get("source_lyrics_snippet") or ""),
                    1 if is_detail else 0,
                    1 if is_comp else 0,
                    comp_reason,
                    now,
                    now,
                    new_lyr_ver,
                    new_lyr_reason,
                    new_lyr_kind,
                    new_lyr_chars,
                    new_lyr_lines,
                    inspected_at,
                    str(item.get("full_lyrics") or ""),
                ),
            )

    def save_gemini_classification(self, source_url: str, classification: Dict[str, object]) -> None:
        self.conn.execute(
            """
            UPDATE raw_listings
            SET gemini_classification_json = ?, updated_at = ?
            WHERE source_url = ?
            """,
            (json.dumps(classification, ensure_ascii=False), _utc_now(), source_url),
        )

    def record_checkpoint(
        self,
        milestone_label: str,
        total_listings: int,
        detail_verified_count: int,
        unique_mezmurs_count: int,
        compilations_count: int,
        duplicates_count: int,
    ) -> None:
        self.conn.execute(
            """
            INSERT INTO crawl_checkpoints (
                milestone_label, total_listings, detail_verified_count,
                unique_mezmurs_count, compilations_count, duplicates_count, created_at
            ) VALUES (?, ?, ?, ?, ?, ?, ?)
            """,
            (
                milestone_label,
                total_listings,
                detail_verified_count,
                unique_mezmurs_count,
                compilations_count,
                duplicates_count,
                _utc_now(),
            ),
        )
        self.conn.commit()

    def load_all_raw_listings(self) -> List[Dict[str, object]]:
        cur = self.conn.execute(
            "SELECT * FROM raw_listings ORDER BY is_detail_verified DESC, clicks_count DESC, source_url ASC"
        )
        out: List[Dict[str, object]] = []
        for r in cur.fetchall():
            out.append({
                "source_url": r["source_url"],
                "source_hymn_id": r["source_hymn_id"],
                "source_slug": r["source_slug"],
                "original_source_title": r["original_source_title"],
                "description": r["description"] or "",
                "video_id": r["video_id"] or "",
                "youtube_url": r["youtube_url"] or "",
                "thumbnail_url": r["thumbnail_url"] or "",
                "singer": r["singer"] or "",
                "singers": json.loads(r["singers_json"] or "[]"),
                "channel_title": r["channel_title"] or "",
                "channel_slug": r["channel_slug"] or "",
                "channel_handle": r["channel_handle"] or "",
                "clicks_count": r["clicks_count"] or 0,
                "upload_date": r["upload_date"] or "",
                "in_language": r["in_language"] or "",
                "source_language_id": r["source_language_id"],
                "source_category_ids": json.loads(r["source_category_ids_json"] or "[]"),
                "source_subcategory_ids": json.loads(r["source_subcategory_ids_json"] or "[]"),
                "source_subcategories": json.loads(r["source_subcategories_json"] or "[]"),
                "has_source_lyrics": bool(r["has_source_lyrics"]),
                "source_lyrics_snippet": r["source_lyrics_snippet"] or "",
                "full_lyrics": r["full_lyrics"] or "",
                "is_detail_verified": bool(r["is_detail_verified"]),
                "is_compilation": bool(r["is_compilation"]),
                "compilation_reason": r["compilation_reason"] or "",
                "gemini_classification": json.loads(r["gemini_classification_json"])
                if r["gemini_classification_json"]
                else None,
                "collected_at": r["collected_at"],
                "updated_at": r["updated_at"],
                "lyrics_verification": r["lyrics_verification"] or "unverified",
                "lyrics_reason": r["lyrics_reason"] or "",
                "lyrics_source_kind": r["lyrics_source_kind"] or "",
                "lyrics_char_count": int(r["lyrics_char_count"] or 0),
                "lyrics_line_count": int(r["lyrics_line_count"] or 0),
                "detail_inspected_at": r["detail_inspected_at"] or "",
            })
        return out

    def load_all_errors(self) -> List[Dict[str, object]]:
        cur = self.conn.execute("SELECT * FROM crawl_errors ORDER BY id ASC")
        return [dict(r) for r in cur.fetchall()]

    def load_all_checkpoints(self) -> List[Dict[str, object]]:
        cur = self.conn.execute("SELECT * FROM crawl_checkpoints ORDER BY id ASC")
        return [dict(r) for r in cur.fetchall()]

    def counts_summary(self) -> Dict[str, int]:
        total = self.conn.execute("SELECT COUNT(*) FROM raw_listings").fetchone()[0]
        detail_verified = self.conn.execute(
            "SELECT COUNT(*) FROM raw_listings WHERE is_detail_verified = 1"
        ).fetchone()[0]
        strict_inspected = self.conn.execute(
            "SELECT COUNT(*) FROM raw_listings WHERE lyrics_verification IN ('verified_true', 'verified_false', 'uncertain')"
        ).fetchone()[0]
        with_lyrics = self.conn.execute(
            "SELECT COUNT(*) FROM raw_listings WHERE lyrics_verification = 'verified_true'"
        ).fetchone()[0]
        without_lyrics = self.conn.execute(
            "SELECT COUNT(*) FROM raw_listings WHERE lyrics_verification = 'verified_false'"
        ).fetchone()[0]
        uncertain = self.conn.execute(
            "SELECT COUNT(*) FROM raw_listings WHERE lyrics_verification = 'uncertain'"
        ).fetchone()[0]
        compilations = self.conn.execute(
            "SELECT COUNT(*) FROM raw_listings WHERE is_compilation = 1"
        ).fetchone()[0]
        non_comp = self.conn.execute(
            "SELECT COUNT(*) FROM raw_listings WHERE is_compilation = 0"
        ).fetchone()[0]
        errors = self.conn.execute("SELECT COUNT(*) FROM crawl_errors WHERE resolved = 0").fetchone()[0]
        return {
            "total_listings": int(total),
            "detail_verified": int(detail_verified),
            "strict_inspected": int(strict_inspected),
            "with_lyrics": int(with_lyrics),
            "without_lyrics": int(without_lyrics),
            "uncertain": int(uncertain),
            "compilations": int(compilations),
            "individual_candidates": int(non_comp),
            "errors": int(errors),
        }

    def commit(self) -> None:
        self.conn.commit()

    def close(self) -> None:
        self.conn.close()
