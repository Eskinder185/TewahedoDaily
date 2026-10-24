"""
Comprehensive deterministic unit and integration tests for mezmur-research pipeline:
1. Crawler extraction tests (detail HTML, JSON-LD, Next.js Flight, sitemap)
2. Pagination & listing extraction tests
3. Resume / SQLite checkpoint tests
4. Duplicate detection & compilation exclusion tests
5. Amharic & Ge'ez Unicode preservation tests
6. Slug validation tests
7. Taxonomy validation tests
8. CSV UTF-8-BOM & multiline encoding tests
9. Classification output & Gemini override validation tests
10. Import-readiness validation tests
"""
from __future__ import annotations
import csv
import json
import sys
import tempfile
import unittest
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parent.parent
if str(ROOT_DIR) not in sys.path:
    sys.path.insert(0, str(ROOT_DIR))

from classifier.deduplicator import (
    deduplicate_records,
    extract_youtube_video_id,
    is_compilation_record,
    normalize_youtube_url,
)
from classifier.engine import classify_mezmur_record, resolve_verified_zemari
from classifier.taxonomy import (
    SUPPORTED_CATEGORIES,
    SUPPORTED_FORMS,
    SUPPORTED_LANGUAGES,
    SUPPORTED_OCCASIONS,
    VALID_DB_SECTION_SLUGS,
    VALID_SECTION_SLUGS,
    canonicalize_category,
    canonicalize_occasion,
    validate_taxonomy_record,
)
from classifier.transliterator import (
    generate_slug,
    has_ethiopic,
    is_valid_slug,
    normalize_amharic_for_dedupe,
    parse_source_title,
    transliterate_ethiopic,
)
from crawler.client import PoliteCrawlerClient
from crawler.db import CheckpointDB
from crawler.parser import (
    canonicalize_hymn_url,
    inspect_hymn_lyrics_section,
    parse_hymn_detail_html,
    parse_hymns_listing_html,
    parse_sitemap_xml,
)
from importer.exporter import (
    EOTCMEDIA_DUPLICATES_COLUMNS,
    EOTCMEDIA_UNCERTAIN_COLUMNS,
    EOTCMEDIA_WITHOUT_LYRICS_COLUMNS,
    EOTCMEDIA_WITH_LYRICS_COLUMNS,
    MAIN_CSV_COLUMNS,
    build_and_export_all_csvs,
    export_eotcmedia_catalog_audit,
)
from importer.readiness import evaluate_import_readiness, is_valid_youtube_url


class TestMezmurPipeline(unittest.TestCase):
    def test_01_crawler_detail_and_sitemap_extraction(self) -> None:
        sitemap_fixture = """<?xml version="1.0" encoding="UTF-8"?>
        <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
            <url><loc>https://eotcmedia.com/hymns</loc></url>
            <url><loc>https://eotcmedia.com/hymns/channels/Janderebaw-Media</loc></url>
            <url><loc>https://eotcmedia.com/hymns/singer/ጃን-ያሬድ</loc></url>
            <url><loc>https://eotcmedia.com/hymns/ናና-አማኑኤል-ዘማሪት-ሲስተር-ሕይወት-ተፈሪ</loc></url>
        </urlset>
        """
        parsed_sm = parse_sitemap_xml(sitemap_fixture)
        self.assertEqual(len(parsed_sm["detail_urls"]), 1)
        self.assertEqual(len(parsed_sm["singer_urls"]), 1)
        self.assertEqual(len(parsed_sm["channel_urls"]), 1)

        detail_html_fixture = """<!DOCTYPE html><html><head>
        <meta property="og:title" content="ናና አማኑኤል | ዘማሪት ሲስተር ሕይወት ተፈሪ — Mezmur | መዝሙር" />
        <script type="application/ld+json">
        {"@context":"https://schema.org","@type":"VideoObject","name":"ናና አማኑኤል | ዘማሪት ሲስተር ሕይወት ተፈሪ","description":"የአእላፋት ዝማሬ","thumbnailUrl":["https://i.ytimg.com/vi/kIcgYRXfPn0/hqdefault.jpg"],"uploadDate":"2024-12-07T00:00:00.000Z","embedUrl":"https://www.youtube.com/embed/kIcgYRXfPn0","inLanguage":"am","byArtist":[{"@type":"Person","name":"ዘማሪት ሲስተር ሕይወት ተፈሪ"}]}
        </script>
        </head><body>
        <div><h2>ግጥም</h2><div class="font-serif"><p>ናና አማኑኤል ና መድኃኒቴ<br/>የነፍሴ ተስፋ ነህ የሕይወቴ ቤቴ<br/>አዝማች፦ ናና አማኑኤል ና መድኃኒቴ</p></div></div>
        <script>self.__next_f.push([1,"20:T40,<blockquote>ናና አማኑኤል ና መድኃኒቴ የነፍሴ ተስፋ ነህ የሕይወቴ ቤቴ</blockquote>1c:[\\"$\\",\\"div\\",null,{\\"videoId\\":\\"kIcgYRXfPn0\\",\\"slug\\":\\"ናና-አማኑኤል\\",\\"thumbnailCandidates\\":[],\\"lyrics\\":\\"$20\\",\\"lyricsSuggestion\\":null,\\"aiLyrics\\":null,\\"hymnId\\":1266}]\\n24:[\\"$\\",\\"a\\",null,{\\"href\\":\\"/hymns/channels/Janderebaw-Media\\",\\"alt\\":\\"Janderebaw Media\\"}]\\n25:[\\"$\\",\\"a\\",null,{\\"href\\":\\"/hymns/singer/ሲስተር-ሕይወት-ተፈሪ\\",\\"className\\":\\"x\\",\\"children\\":\\"ዘማሪት ሲስተር ሕይወት ተፈሪ\\"}]\\n26:[\\"$\\",\\"span\\",null,{\\"children\\":[\\"6,698\\",\\" clicks\\"]}]"])</script>
        </body></html>
        """
        main_h, rel_h = parse_hymn_detail_html(
            detail_html_fixture, "https://eotcmedia.com/hymns/ናና-አማኑኤል"
        )
        self.assertIsNotNone(main_h)
        assert main_h is not None
        self.assertEqual(main_h["source_hymn_id"], 1266)
        self.assertEqual(main_h["video_id"], "kIcgYRXfPn0")
        self.assertEqual(main_h["youtube_url"], "https://www.youtube.com/watch?v=kIcgYRXfPn0")
        self.assertTrue(main_h["has_source_lyrics"])
        self.assertEqual(main_h["clicks_count"], 6698)
        self.assertEqual(main_h["singer"], "ዘማሪት ሲስተር ሕይወት ተፈሪ")

    def test_02_pagination_and_listing_extraction(self) -> None:
        listing_payload = {
            "initialHymns": [
                {
                    "id": 101,
                    "slug": "እመቤታችን-ባንቺ-ምልጃ",
                    "videoId": "nH-dDKcEnmQ",
                    "title": '🔴 " እመቤታችን ባንቺ ምልጃ " ዘማሪ ቀሲስ እስክንድር ወልደ ማርያም @-mahtot',
                    "singer": "ዘማሪ ቀሲስ እስክንድር ወልደ ማርያም",
                    "singers": [{"id": 12, "name": "ዘማሪ ቀሲስ እስክንድር ወልደ ማርያም", "slug": "እስክንድር"}],
                    "channel": {"id": 3, "title": "Mahtot Tube", "slug": "mahtot", "handle": "@mahtot"},
                    "clicksCount": 1400,
                    "publishedAt": "$D2024-09-10T00:00:00.000Z",
                }
            ],
            "initialTotal": 4175,
            "initialTotalPages": 174,
            "categories": [{"id": 2, "languageId": 1, "name": "በመዝሙሩ ይዘት", "slug": "በመዝሙሩ-ይዘት"}],
            "subCategories": [{"id": 8, "categoryId": 2, "name": "የእመቤታችን", "slug": "የእመቤታችን"}],
            "languages": [{"id": 1, "name": "አማርኛ", "slug": "አማርኛ"}],
            "singers": [{"id": 12, "name": "ዘማሪ ቀሲስ እስክንድር ወልደ ማርያም", "slug": "እስክንድር"}],
        }
        escaped = json.dumps(listing_payload).replace("\\", "\\\\").replace('"', '\\"')
        html_fixture = f'<script>self.__next_f.push([1,"17:{escaped}"])</script>'
        parsed = parse_hymns_listing_html(
            html_fixture,
            source_language_id=1,
            source_category_id=2,
            source_subcategory_name="የእመቤታችን",
            source_subcategory_id=8,
        )
        self.assertEqual(parsed["initial_total"], 4175)
        self.assertEqual(parsed["initial_total_pages"], 174)
        self.assertEqual(len(parsed["initial_hymns"]), 1)
        self.assertEqual(parsed["initial_hymns"][0]["source_subcategories"], ["የእመቤታችን"])

    def test_03_resume_and_sqlite_checkpoint_merge(self) -> None:
        with tempfile.TemporaryDirectory() as tmpdir:
            db_path = Path(tmpdir) / "test.sqlite"
            db = CheckpointDB(db_path)
            u = canonicalize_hymn_url("ናና-አማኑኤል")
            # First insert from subcategory listing (has subcategory, no detail verification)
            db.upsert_raw_listing({
                "source_url": u,
                "source_hymn_id": 1266,
                "source_slug": "ናና-አማኑኤል",
                "original_source_title": "ናና አማኑኤል | ዘማሪት ሲስተር ሕይወት ተፈሪ",
                "video_id": "kIcgYRXfPn0",
                "youtube_url": "https://www.youtube.com/watch?v=kIcgYRXfPn0",
                "source_subcategories": ["የእግዚአብሔር"],
                "is_detail_verified": False,
            })
            # Second upsert from detail page (adds description & lyrics presence, keeps subcategory)
            db.upsert_raw_listing({
                "source_url": u,
                "source_hymn_id": 1266,
                "source_slug": "ናና-አማኑኤል",
                "original_source_title": "ናና አማኑኤል | ዘማሪት ሲስተር ሕይወት ተፈሪ",
                "description": "የአእላፋት ዝማሬ",
                "video_id": "kIcgYRXfPn0",
                "youtube_url": "https://www.youtube.com/watch?v=kIcgYRXfPn0",
                "has_source_lyrics": True,
                "is_detail_verified": True,
            })
            db.mark_url_visited(u, "hymn_detail", 200)
            db.record_checkpoint("milestone_10", 1, 1, 1, 0, 0)
            db.close()

            # Re-open to verify persistence & resume state
            db2 = CheckpointDB(db_path)
            self.assertTrue(db2.is_url_visited(u))
            rows = db2.load_all_raw_listings()
            self.assertEqual(len(rows), 1)
            self.assertTrue(rows[0]["is_detail_verified"])
            self.assertTrue(rows[0]["has_source_lyrics"])
            self.assertEqual(rows[0]["source_subcategories"], ["የእግዚአብሔር"])
            self.assertEqual(rows[0]["description"], "የአእላፋት ዝማሬ")
            db2.close()

    def test_04_duplicate_and_compilation_detection(self) -> None:
        is_comp, reason = is_compilation_record(
            "Non Stop - ሊቀ መዘምራን ይልማ ኃይሉ - ቁጥር 2 አልበም", "non-stop-album", "ይልማ ኃይሉ"
        )
        self.assertTrue(is_comp)
        self.assertIn("title_compilation_keyword", reason)

        records = [
            {
                "slug": "nana-amanuel-1",
                "source_url": "https://eotcmedia.com/hymns/1",
                "youtube_url": "https://www.youtube.com/watch?v=kIcgYRXfPn0",
                "amharic_title": "ናና አማኑኤል",
                "transliteration_title": "Nana Amanuel",
                "zemari": "ዘማሪት ሲስተር ሕይወት ተፈሪ",
            },
            # Exact YouTube video ID duplicate -> excluded
            {
                "slug": "nana-amanuel-dup-video",
                "source_url": "https://eotcmedia.com/hymns/2",
                "youtube_url": "https://www.youtube.com/watch?v=kIcgYRXfPn0",
                "amharic_title": "ናና አማኑኤል",
                "transliteration_title": "Nana Amanuel",
                "zemari": "ዘማሪት ሲስተር ሕይወት ተፈሪ",
            },
            # Same Amharic title & same Zemari re-upload with different video ID -> excluded
            {
                "slug": "nana-amanuel-reupload",
                "source_url": "https://eotcmedia.com/hymns/3",
                "youtube_url": "https://www.youtube.com/watch?v=AbCdEfGhIjK",
                "amharic_title": "ናና አማኑኤል!",
                "transliteration_title": "Nana Amanuel",
                "zemari": "ዘማሪት ሲስተር ሕይወት ተፈሪ",
            },
            # Same Amharic title performed by a DIFFERENT Zemari -> kept as distinct performance AND logged
            {
                "slug": "nana-amanuel-yilma",
                "source_url": "https://eotcmedia.com/hymns/4",
                "youtube_url": "https://www.youtube.com/watch?v=XyZ12345678",
                "amharic_title": "ናና አማኑኤል",
                "transliteration_title": "Nana Amanuel",
                "zemari": "ሊቀ መዘምራን ይልማ ኃይሉ",
            },
        ]
        unique, dupes = deduplicate_records(records)
        self.assertEqual(len(unique), 2)
        self.assertEqual(len(dupes), 3)
        resolutions = [d["resolution"] for d in dupes]
        self.assertIn("excluded_duplicate", resolutions)
        self.assertIn("kept_distinct_performance", resolutions)

    def test_05_amharic_unicode_preservation_and_homophones(self) -> None:
        title = "ቅድስት ሥላሴ፤ ኀይሌና መድኃኒቴ"
        self.assertTrue(has_ethiopic(title))
        # Homophone normalization equates ሥላሴ and ስላሴ, ኀይሌ and ሀይሌ
        self.assertEqual(
            normalize_amharic_for_dedupe("ቅድስት ሥላሴ ኀይሌ"),
            normalize_amharic_for_dedupe("ቅድስት ስላሴ ሀይሌ"),
        )
        translit = transliterate_ethiopic("ናና አማኑኤል")
        self.assertTrue(len(translit) > 0)
        self.assertFalse(has_ethiopic(translit))

    def test_06_slug_validation(self) -> None:
        used = set()
        s1 = generate_slug("Nana Amanuel!", "ናና አማኑኤል", fallback_id="100", used_slugs=used)
        s2 = generate_slug("Nana Amanuel!", "ናና አማኑኤል", fallback_id="101", used_slugs=used)
        self.assertTrue(is_valid_slug(s1))
        self.assertTrue(is_valid_slug(s2))
        self.assertNotEqual(s1, s2)
        self.assertFalse(is_valid_slug("Invalid_Slug_With_Caps"))
        self.assertFalse(is_valid_slug("-leading-hyphen"))

    def test_07_taxonomy_validation(self) -> None:
        self.assertEqual(canonicalize_category("Virgin Mary"), "Virgin Mary")
        self.assertEqual(canonicalize_category("st. mary"), "Virgin Mary")
        self.assertEqual(canonicalize_occasion("Fasika"), "Tinsae")
        self.assertEqual(canonicalize_occasion("Enkutatash"), "New Year / Enkutatash")

        valid_rec = {
            "language": "amharic",
            "form": "mezmur",
            "category": "Virgin Mary",
            "primary_occasion": "Filseta",
            "additional_occasions": "Kidane Mihret",
            "hymn_sections": "mary-general|filseta",
        }
        self.assertEqual(validate_taxonomy_record(valid_rec), [])

        invalid_rec = {
            "language": "french",
            "form": "chant",
            "category": "Unknown Category",
            "primary_occasion": "Unknown Occasion",
            "additional_occasions": "",
            "hymn_sections": "non-existent-section",
        }
        errs = validate_taxonomy_record(invalid_rec)
        self.assertEqual(len(errs), 5)

    def test_08_csv_utf8_bom_and_multiline_encoding(self) -> None:
        with tempfile.TemporaryDirectory() as tmpdir:
            db = CheckpointDB(Path(tmpdir) / "test.sqlite")
            db.upsert_raw_listing({
                "source_url": "https://eotcmedia.com/hymns/test-1",
                "source_hymn_id": 55,
                "source_slug": "test-1",
                "original_source_title": 'ናና አማኑኤል | ዘማሪት ሲስተር ሕይወት ተፈሪ',
                "description": "መስመር አንድ\nመስመር ሁለት፣ \"ጥቅስ\" ያለው",
                "video_id": "kIcgYRXfPn0",
                "youtube_url": "https://www.youtube.com/watch?v=kIcgYRXfPn0",
                "singers": [{"id": 1, "name": "ዘማሪት ሲስተር ሕይወት ተፈሪ", "slug": "hiwot"}],
                "channel_title": "Janderebaw Media",
                "has_source_lyrics": True,
                "is_detail_verified": True,
            })
            exports_dir = Path(tmpdir) / "exports"
            eotc_tmp_dir = Path(tmpdir) / "eotcmedia"
            summary = build_and_export_all_csvs(
                db, exports_dir, eotcmedia_imports_dir=eotc_tmp_dir
            )
            db.close()

            self.assertEqual(summary["verified_unique_mezmurs"], 1)
            main_csv = exports_dir / "mezmurs_2000.csv"
            raw_bytes = main_csv.read_bytes()
            # Must start with UTF-8 BOM (EF BB BF)
            self.assertTrue(raw_bytes.startswith(b"\xef\xbb\xbf"))

            with main_csv.open("r", encoding="utf-8-sig", newline="") as f:
                reader = list(csv.DictReader(f))
            self.assertEqual(len(reader), 1)
            row = reader[0]
            self.assertEqual(list(row.keys()), MAIN_CSV_COLUMNS)
            self.assertEqual(row["amharic_title"], "ናና አማኑኤል")
            self.assertEqual(row["status"], "draft")
            self.assertEqual(row["featured"], "false")
            self.assertEqual(row["amharic_lyrics"], "")  # Unlicensed lyrics never reproduced
            self.assertEqual(row["lyrics_status"], "rights_review_required")
            self.assertIn("\n", row["description"])

    def test_09_classification_and_channel_separation(self) -> None:
        # Ensure YouTube channel "21 MEDIA" or group "በህብረት" is never confused with a Zemari
        zem, ok = resolve_verified_zemari(
            [{"name": "በህብረት"}], "በህብረት", "", "21 MEDIA ሃያ አንድ ሚዲያ"
        )
        self.assertEqual(zem, "")
        self.assertFalse(ok)

        cls = classify_mezmur_record({
            "original_source_title": "ድንግል ማርያም እመ ብርሃን | ሊቀ መዘምራን ይልማ ኃይሉ",
            "singers": [{"name": "ሊቀ መዘምራን ይልማ ኃይሉ"}],
            "channel_title": "Mahtot Tube",
            "source_subcategories": ["የእመቤታችን"],
            "has_source_lyrics": False,
        })
        self.assertEqual(cls["category"], "Virgin Mary")
        self.assertEqual(cls["zemari"], "ሊቀ መዘምራን ይልማ ኃይሉ")
        self.assertEqual(cls["lyrics_status"], "missing")
        self.assertEqual(validate_taxonomy_record(cls), [])

    def test_10_import_readiness_validation(self) -> None:
        draft_row = {
            "slug": "nana-amanuel",
            "amharic_title": "ናና አማኑኤል",
            "transliteration_title": "Nana Amanuel",
            "youtube_url": "https://www.youtube.com/watch?v=kIcgYRXfPn0",
            "zemari": "ሊቀ መዘምራን ይልማ ኃይሉ",
            "amharic_lyrics": "",
            "lyrics_status": "missing",
            "language": "amharic",
            "form": "mezmur",
            "category": "Jesus Christ",
            "primary_occasion": "General / Anytime",
            "additional_occasions": "",
            "hymn_sections": "christ-general",
            "review_required": "false",
        }
        rep = evaluate_import_readiness(draft_row)
        self.assertEqual(rep["ready_for_draft_import"], "true")
        self.assertEqual(rep["ready_for_publish"], "false")  # Missing lyrics blocks publish, not draft

    def test_11_live_2000_csv_exports_validation(self) -> None:
        exports_dir = ROOT_DIR / "exports"
        mandatory_files = [
            "mezmurs_2000.csv",
            "mezmur_section_links.csv",
            "mezmur_occasion_links.csv",
            "zemaris.csv",
            "duplicates.csv",
            "review_required.csv",
            "missing_lyrics.csv",
            "source_attribution.csv",
            "import_readiness.csv",
            "crawl_errors.csv",
        ]
        for fname in mandatory_files:
            fpath = exports_dir / fname
            self.assertTrue(fpath.exists(), f"Missing mandatory export file: {fname}")
            raw_bytes = fpath.read_bytes()
            self.assertTrue(
                raw_bytes.startswith(b"\xef\xbb\xbf"),
                f"File {fname} must be encoded as UTF-8 with BOM",
            )

        main_csv_path = exports_dir / "mezmurs_2000.csv"
        with main_csv_path.open("r", encoding="utf-8-sig", newline="") as f:
            rows = list(csv.DictReader(f))

        self.assertGreaterEqual(len(rows), 2000, "Must contain at least 2,000 verified unique Mezmurs")
        self.assertEqual(list(rows[0].keys()), MAIN_CSV_COLUMNS)

        seen_slugs = set()
        for r in rows:
            self.assertEqual(r["id"], "")
            self.assertEqual(r["status"], "draft")
            self.assertEqual(r["featured"], "false")
            self.assertTrue(is_valid_slug(r["slug"]), f"Invalid slug: {r['slug']}")
            self.assertNotIn(r["slug"], seen_slugs, f"Duplicate slug in main CSV: {r['slug']}")
            seen_slugs.add(r["slug"])
            self.assertEqual(validate_taxonomy_record(r), [], f"Invalid taxonomy on {r['slug']}")

    def test_12_strict_lyrics_detection_all_cases(self) -> None:
        # 1. Full human-verified lyrics in ግጥም section
        html_full = """
        <div class="rounded-xl border">
          <div class="border-b"><h2>ግጥም</h2></div>
          <div class="p-6"><div class="font-serif"><p>ቅዱስ ሚካኤል ሊቀ መላእክት<br/>ለምንልን ለእኛ ለኃጥአን በእውነት<br/>አዝማች፦ ቅዱስ ሚካኤል ረዳታችን</p></div></div>
        </div>
        """
        r1 = inspect_hymn_lyrics_section(html_full)
        self.assertTrue(r1["has_lyrics"])
        self.assertEqual(r1["lyrics_verification"], "verified_true")
        self.assertGreaterEqual(int(r1["lyrics_line_count"]), 3)

        # 2. AI-transcribed / suggested lyrics banner stripped cleanly while keeping verses
        html_ai = """
        <div class="rounded-xl border">
          <div class="border-b"><h2>ግጥም</h2><span>በ AI የተጻፈ፣ እባክዎን "Edit" የሚለውን ተጭነው ጽሁፉን በማስተካከል ያግዙን</span></div>
          <div class="p-6"><div class="font-serif"><p>ገብርኤል ኃያል መልአከ ብሥራት<br/>ቆሞ የሚያማልድ በእግዚአብሔር ፊት</p></div></div>
        </div>
        """
        r2 = inspect_hymn_lyrics_section(html_ai)
        self.assertTrue(r2["has_lyrics"])
        self.assertEqual(r2["lyrics_verification"], "verified_true")
        self.assertEqual(r2["lyrics_source_kind"], "ai_transcribed")
        self.assertNotIn("በ AI የተጻፈ", str(r2["lyrics_snippet"]))

        # 3. Page without lyrics ("Lyrics not yet available" / "Sign in to add or generate lyrics")
        html_missing = """
        <div class="rounded-xl border">
          <div class="border-b"><h2>ግጥም</h2></div>
          <div class="p-6">
            <div><p>Lyrics not yet available</p><a href="/login">Sign in to add or generate lyrics</a></div>
          </div>
        </div>
        """
        r3 = inspect_hymn_lyrics_section(html_missing)
        self.assertFalse(r3["has_lyrics"])
        self.assertEqual(r3["lyrics_verification"], "verified_false")

        # 4. Duplicate ግጥም sections (e.g. mobile + desktop containers)
        html_dup = html_full + html_full
        r4 = inspect_hymn_lyrics_section(html_dup)
        self.assertTrue(r4["has_lyrics"])
        self.assertEqual(r4["lyrics_verification"], "verified_true")

        # 5. Malformed page lacking both ግጥም heading and Flight props -> uncertain
        html_malformed = "<html><body><h1>502 Bad Gateway</h1></body></html>"
        r5 = inspect_hymn_lyrics_section(html_malformed)
        self.assertFalse(r5["has_lyrics"])
        self.assertEqual(r5["lyrics_verification"], "uncertain")

    def test_13_missing_artist_and_missing_youtube_handling(self) -> None:
        with tempfile.TemporaryDirectory() as tmpdir:
            db = CheckpointDB(Path(tmpdir) / "test_edge.sqlite")
            # Hymn 1: Has lyrics & YouTube, but missing artist (only channel name present)
            db.upsert_raw_listing({
                "source_url": "https://eotcmedia.com/hymns/missing-artist",
                "source_hymn_id": 9001,
                "source_slug": "missing-artist",
                "original_source_title": "እመቤታችን ማርያም",
                "video_id": "Zz99Xx88Yy1",
                "youtube_url": "https://www.youtube.com/watch?v=Zz99Xx88Yy1",
                "singer": "",
                "singers": [],
                "channel_title": "Mahibere Kidusan TV",
                "has_source_lyrics": True,
                "source_lyrics_snippet": "እመቤታችን ማርያም የዓለም ሁሉ መድኃኒት፣ ለምኝልን ለእኛ ለልጆችሽ",
                "is_detail_verified": True,
                "lyrics_verification": "verified_true",
                "lyrics_reason": "verified_lyrics_in_dom_serif",
                "lyrics_source_kind": "dom_serif",
                "lyrics_char_count": 48,
                "lyrics_line_count": 2,
            })
            # Hymn 2: Has lyrics & artist, but missing YouTube link
            db.upsert_raw_listing({
                "source_url": "https://eotcmedia.com/hymns/missing-yt",
                "source_hymn_id": 9002,
                "source_slug": "missing-yt",
                "original_source_title": "ቅዱስ ሚካኤል | ሊቀ መዘምራን ይልማ ኃይሉ",
                "video_id": "",
                "youtube_url": "",
                "singer": "ሊቀ መዘምራን ይልማ ኃይሉ",
                "singers": [{"name": "ሊቀ መዘምራን ይልማ ኃይሉ"}],
                "channel_title": "EOTC Channel",
                "has_source_lyrics": True,
                "source_lyrics_snippet": "ቅዱስ ሚካኤል ሊቀ መላእክት ለምንልን ለእኛ ለኃጥአን",
                "is_detail_verified": True,
                "lyrics_verification": "verified_true",
                "lyrics_reason": "verified_lyrics_in_dom_serif",
                "lyrics_source_kind": "dom_serif",
                "lyrics_char_count": 40,
                "lyrics_line_count": 2,
            })
            out_dir = Path(tmpdir) / "eotcmedia"
            audit = export_eotcmedia_catalog_audit(
                db, output_dir=out_dir, advertised_catalog_size=2, sitemap_detail_urls_count=2
            )
            db.close()

            self.assertEqual(audit["total_with_actual_lyrics"], 2)
            # Only Hymn 1 has a valid YouTube URL so only 1 enters eotcmedia_import_ready.csv
            self.assertEqual(audit["total_import_ready"], 1)

            with (out_dir / "eotcmedia_with_lyrics.csv").open("r", encoding="utf-8-sig") as f:
                rows = list(csv.DictReader(f))
            self.assertEqual(len(rows), 2)
            # Hymn 1 must NOT confuse channel_name with zemari_name
            self.assertEqual(rows[0]["zemari_name"], "")
            self.assertEqual(rows[0]["zemari_verified"], "false")
            self.assertEqual(rows[0]["channel_name"], "Mahibere Kidusan TV")
            self.assertEqual(rows[0]["review_status"], "needs_review")
            # Hymn 2 has verified Zemari and Kidus Michael classification
            self.assertEqual(rows[1]["zemari_name"], "ሊቀ መዘምራን ይልማ ኃይሉ")
            self.assertEqual(rows[1]["zemari_verified"], "true")
            self.assertEqual(rows[1]["theological_category"], "Kidus Michael")

    def test_14_eotcmedia_six_deliverable_files_validation(self) -> None:
        eotc_dir = ROOT_DIR.parent / "data" / "imports" / "eotcmedia"
        csv_specs = [
            ("eotcmedia_with_lyrics.csv", EOTCMEDIA_WITH_LYRICS_COLUMNS),
            ("eotcmedia_with_full_lyrics.csv", EOTCMEDIA_WITH_LYRICS_COLUMNS),
            ("eotcmedia_without_lyrics.csv", EOTCMEDIA_WITHOUT_LYRICS_COLUMNS),
            ("eotcmedia_uncertain.csv", EOTCMEDIA_UNCERTAIN_COLUMNS),
            ("eotcmedia_duplicates.csv", EOTCMEDIA_DUPLICATES_COLUMNS),
            ("eotcmedia_import_ready.csv", EOTCMEDIA_WITH_LYRICS_COLUMNS),
            ("eotcmedia_import_ready_with_full_lyrics.csv", EOTCMEDIA_WITH_LYRICS_COLUMNS),
        ]
        for fname, expected_cols in csv_specs:
            fpath = eotc_dir / fname
            self.assertTrue(fpath.exists(), f"Missing deliverable CSV: {fpath}")
            raw_bytes = fpath.read_bytes()
            self.assertTrue(raw_bytes.startswith(b"\xef\xbb\xbf"), f"{fname} must have UTF-8 BOM")
            with fpath.open("r", encoding="utf-8-sig", newline="") as f:
                reader = csv.DictReader(f)
                self.assertEqual(list(reader.fieldnames or []), expected_cols)
                rows = list(reader)

            if "with_lyrics" in fname or "import_ready" in fname:
                for r in rows:
                    self.assertEqual(r["has_lyrics"], "true")
                    self.assertTrue(len(r["lyrics_am"].strip()) >= 15, f"Empty lyrics_am on {r['source_id']}")
                    self.assertIn(r["theological_category"], SUPPORTED_CATEGORIES)
                    self.assertIn(r["primary_occasion"], SUPPORTED_OCCASIONS)
                    for occ in [o.strip() for o in r["additional_occasions"].split("|") if o.strip()]:
                        self.assertIn(occ, SUPPORTED_OCCASIONS)
                    self.assertIn(r["language"], SUPPORTED_LANGUAGES)
                    self.assertIn(r["form"], SUPPORTED_FORMS)
                    secs = [s.strip() for s in r["hymn_sections"].split("|") if s.strip()]
                    self.assertGreater(len(secs), 0)
                    for s in secs:
                        self.assertIn(s, VALID_DB_SECTION_SLUGS)
                    if fname == "eotcmedia_import_ready.csv":
                        self.assertTrue(is_valid_youtube_url(r["youtube_url"]))
                        self.assertEqual(len(r["youtube_video_id"]), 11)

        audit_json_path = eotc_dir / "eotcmedia_full_audit.json"
        self.assertTrue(audit_json_path.exists())
        audit_data = json.loads(audit_json_path.read_text(encoding="utf-8"))
        self.assertEqual(audit_data["advertised_catalog_size"], 4175)
        self.assertEqual(audit_data["total_urls_discovered"], 4175)
        self.assertEqual(audit_data["unique_hymn_pages_inspected"], 4175)
        self.assertGreaterEqual(audit_data["total_with_actual_lyrics"], 900)
        self.assertEqual(
            audit_data["total_with_actual_lyrics"]
            + audit_data["total_without_lyrics"]
            + audit_data["total_uncertain_or_unreachable"],
            audit_data["total_urls_discovered"],
        )


if __name__ == "__main__":
    unittest.main()
