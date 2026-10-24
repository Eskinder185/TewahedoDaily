"""
Resumable full-catalog crawler & strict ግጥም lyrics auditor for https://eotcmedia.com/hymns.
Enforces robots.txt, validates a small initial sample, then automatically crawls
the entire discoverable hymn catalog in checkpointed batches of 100-200 records,
saving SQLite checkpoints and updating the CSV/JSON exports in data/imports/eotcmedia/
and mezmur-research/exports/.
"""
from __future__ import annotations
import argparse
import json
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

# Ensure mezmur-research root is on sys.path
ROOT_DIR = Path(__file__).resolve().parent.parent
if str(ROOT_DIR) not in sys.path:
    sys.path.insert(0, str(ROOT_DIR))

from crawler.client import BASE_URL, PoliteCrawlerClient
from crawler.db import CheckpointDB
from crawler.parser import (
    canonicalize_hymn_url,
    parse_hymn_detail_html,
    parse_hymns_listing_html,
    parse_sitemap_xml,
)
from importer.exporter import build_and_export_all_csvs, export_eotcmedia_catalog_audit

MILESTONES = [10, 50, 250, 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4175]


class RateLimiter:
    def __init__(self, min_interval: float = 0.05) -> None:
        self.min_interval = min_interval
        self.lock = threading.Lock()
        self.last_ts = 0.0

    def wait(self) -> None:
        with self.lock:
            now = time.time()
            wait_s = self.min_interval - (now - self.last_ts)
            if wait_s > 0:
                time.sleep(wait_s)
            self.last_ts = time.time()


def _try_playwright_fallback_for_uncertain(url: str) -> Tuple[Optional[Dict[str, object]], List[Dict[str, object]], Optional[str]]:
    """
    Optional rendered-DOM fallback using Playwright when ordinary HTTP parsing
    produces lyrics_verification == 'uncertain'.
    """
    try:
        from playwright.sync_api import sync_playwright  # type: ignore[import-not-found]
    except Exception as exc:
        return None, [], f"PlaywrightUnavailable: {exc}"

    try:
        with sync_playwright() as p:
            browser = p.chromium.launch(headless=True)
            try:
                page = browser.new_page()
                page.goto(url, wait_until="networkidle", timeout=25000)
                rendered_html = page.content()
                main_h, rel_h = parse_hymn_detail_html(rendered_html, page_url=url)
                return main_h, rel_h, None
            finally:
                browser.close()
    except Exception as exc:
        return None, [], f"PlaywrightError: {exc}"


def run_crawler(
    target_unique: Optional[int] = None,
    batch_size: int = 150,
    workers: int = 8,
    min_delay: float = 0.04,
    max_records_export: Optional[int] = None,
) -> Dict[str, int]:
    """
    Crawl and inspect all discoverable individual hymn detail pages on EOTC Media.
    If target_unique is None or <= 0, inspects the ENTIRE discoverable catalog (no arbitrary cap).
    """
    data_dir = ROOT_DIR / "data"
    checkpoints_dir = ROOT_DIR / "checkpoints"
    exports_dir = ROOT_DIR / "exports"
    reports_dir = ROOT_DIR / "reports"
    eotcmedia_imports_dir = ROOT_DIR.parent / "data" / "imports" / "eotcmedia"
    for d in (data_dir, checkpoints_dir, exports_dir, reports_dir, eotcmedia_imports_dir):
        d.mkdir(parents=True, exist_ok=True)

    db_path = checkpoints_dir / "mezmur_crawl.sqlite"
    db = CheckpointDB(db_path)
    client = PoliteCrawlerClient(min_delay_seconds=min_delay)

    print("[1/6] Checking robots.txt and access rules...")
    allowed, robots_txt = client.load_robots_txt(BASE_URL)
    (data_dir / "robots.txt").write_text(robots_txt, encoding="utf-8")
    if not allowed:
        print("STOP: robots.txt disallows /hymns. Halting live crawl.")
        db.close()
        return {}
    print("  -> robots.txt verified: Allow: / (Sitemap: https://eotcmedia.com/sitemap.xml; /api/ disallowed and respected).")

    # Step 2: Load or fetch sitemap.xml
    sitemap_cache = data_dir / "sitemap.xml"
    if sitemap_cache.exists() and sitemap_cache.stat().st_size > 100_000:
        sitemap_xml = sitemap_cache.read_text(encoding="utf-8")
    else:
        print("[2/6] Fetching https://eotcmedia.com/sitemap.xml...")
        sitemap_xml, status, err, retries = client.fetch(f"{BASE_URL}/sitemap.xml")
        if not sitemap_xml or status != 200:
            db.log_error(f"{BASE_URL}/sitemap.xml", "sitemap", status, "fetch_error", err or "Failed", retries)
            raise RuntimeError(f"Failed to fetch sitemap.xml: {err}")
        sitemap_cache.write_text(sitemap_xml, encoding="utf-8")

    sitemap_info = parse_sitemap_xml(sitemap_xml)
    detail_urls = sitemap_info["detail_urls"]
    singer_urls = sitemap_info["singer_urls"]
    print(
        f"  -> Sitemap parsed: {len(detail_urls)} hymn detail URLs, "
        f"{len(singer_urls)} singer URLs, {len(sitemap_info['channel_urls'])} channel URLs."
    )

    # Step 3: Fetch root /hymns page to record source taxonomy (33 categories, 216 subcategories, 7 languages)
    taxonomy_cache = data_dir / "source_taxonomy.json"
    advertised_total = 4175
    root_html, status, err, retries = client.fetch(f"{BASE_URL}/hymns")
    if root_html and status == 200:
        listing_data = parse_hymns_listing_html(root_html)
        taxonomy = listing_data["taxonomy"]
        advertised_total = int(listing_data["initial_total"] or 4175)
        taxonomy["initial_total_reported"] = advertised_total
        taxonomy["initial_total_pages_reported"] = listing_data["initial_total_pages"]
        taxonomy_cache.write_text(json.dumps(taxonomy, ensure_ascii=False, indent=2), encoding="utf-8")
        for item in listing_data["initial_hymns"]:
            db.upsert_raw_listing(item)
        db.mark_url_visited(f"{BASE_URL}/hymns", "listing_root", 200)
        db.commit()
        print(
            f"  -> Root /hymns verified: source reports initialTotal={advertised_total} "
            f"across {listing_data['initial_total_pages']} pages."
        )
    elif taxonomy_cache.exists():
        taxonomy = json.loads(taxonomy_cache.read_text(encoding="utf-8"))
        advertised_total = int(taxonomy.get("initial_total_reported") or 4175)
    else:
        taxonomy = {"categories": [], "subCategories": [], "languages": [], "singers": []}

    # Step 4: Crawl any remaining unvisited subcategory filter pages across all languages
    visited_urls = db.get_visited_urls()
    if taxonomy.get("subCategories"):
        cat_by_id = {int(c["id"]): c for c in taxonomy.get("categories", []) if isinstance(c, dict) and "id" in c}
        subcats = [sc for sc in taxonomy.get("subCategories", []) if isinstance(sc, dict) and sc.get("id")]
        pending_subcats = []
        for sc in subcats:
            cid = int(sc.get("categoryId") or 0)
            cat_obj = cat_by_id.get(cid, {})
            lid = int(cat_obj.get("languageId") or 1)
            url = f"{BASE_URL}/hymns?language={lid}&category={cid}&subCategory={sc['id']}"
            if url not in visited_urls:
                pending_subcats.append((url, lid, cid, str(sc.get("name") or ""), int(sc["id"])))

        if pending_subcats:
            print(f"[3/6] Crawling {len(pending_subcats)} remaining subcategory listing pages for source taxonomy facets...")
            thread_local_sc = threading.local()
            limiter_sc = RateLimiter(min_interval=min_delay)

            def _fetch_subcat(task: Tuple[str, int, int, str, int]) -> Tuple[str, int, Optional[str], int, List[Dict[str, object]]]:
                u, lid, cid, sc_name, sc_id = task
                limiter_sc.wait()
                if not hasattr(thread_local_sc, "client"):
                    c = PoliteCrawlerClient(min_delay_seconds=0.0)
                    c.robots = client.robots
                    thread_local_sc.client = c
                w_client: PoliteCrawlerClient = thread_local_sc.client
                html_text, st, err_msg, r_cnt = w_client.fetch(u)
                if not html_text or st != 200:
                    return u, st, err_msg, r_cnt, []
                try:
                    parsed_l = parse_hymns_listing_html(
                        html_text,
                        source_language_id=lid,
                        source_category_id=cid,
                        source_subcategory_name=sc_name,
                        source_subcategory_id=sc_id,
                    )
                    return u, 200, None, r_cnt, parsed_l["initial_hymns"]  # type: ignore[return-value]
                except Exception as exc:
                    return u, 200, f"ParseError: {exc}", r_cnt, []

            with ThreadPoolExecutor(max_workers=max(1, workers)) as pool:
                futures = [pool.submit(_fetch_subcat, t) for t in pending_subcats]
                for fut in as_completed(futures):
                    u, st, err_msg, r_cnt, h_items = fut.result()
                    if err_msg:
                        db.log_error(u, "subcategory_listing", st, "fetch_error", err_msg, r_cnt)
                    else:
                        for h_item in h_items:
                            db.upsert_raw_listing(h_item)
                        db.mark_url_visited(u, "subcategory_listing", 200)
                        db.resolve_errors_for_url(u)
            db.commit()
            print(f"  -> Completed {len(pending_subcats)} subcategory listing pages.")

    # Step 5: Reconcile all discoverable hymn detail URLs across sitemap + listings
    all_discovered_set: Set[str] = set()
    ordered_detail_urls: List[str] = []
    for u in detail_urls:
        cu = canonicalize_hymn_url(u)
        if cu and cu not in all_discovered_set:
            all_discovered_set.add(cu)
            ordered_detail_urls.append(cu)

    for u in sorted(db.get_all_known_source_urls()):
        cu = canonicalize_hymn_url(u)
        if cu and cu not in all_discovered_set:
            all_discovered_set.add(cu)
            ordered_detail_urls.append(cu)

    strict_inspected_urls = db.get_strict_inspected_detail_urls()
    pending_detail_urls = [u for u in ordered_detail_urls if u not in strict_inspected_urls]

    print(
        f"[4/6] Catalog Discovery & Reconciliation:\n"
        f"  -> Advertised catalog size on /hymns: {advertised_total}\n"
        f"  -> Sitemap hymn detail URLs:          {len(detail_urls)}\n"
        f"  -> Total unique hymn URLs discovered: {len(ordered_detail_urls)}\n"
        f"  -> Already strictly inspected (ግጥም):  {len(strict_inspected_urls)}\n"
        f"  -> Pending detail pages to inspect:   {len(pending_detail_urls)}"
    )

    thread_local = threading.local()
    limiter = RateLimiter(min_interval=min_delay)

    def _get_worker_client() -> PoliteCrawlerClient:
        if not hasattr(thread_local, "client"):
            c = PoliteCrawlerClient(min_delay_seconds=0.0)
            c.robots = client.robots
            thread_local.client = c
        return thread_local.client

    def _fetch_and_parse_detail(
        url: str,
    ) -> Tuple[str, int, Optional[str], int, Optional[Dict[str, object]], List[Dict[str, object]]]:
        limiter.wait()
        w_client = _get_worker_client()
        html_text, st, err_msg, r_cnt = w_client.fetch(url)
        if not html_text or st != 200:
            return url, st, err_msg, r_cnt, None, []
        try:
            main_h, rel_h = parse_hymn_detail_html(html_text, page_url=url)
            return url, 200, None, r_cnt, main_h, rel_h
        except Exception as exc:
            return url, 200, f"ParseError: {exc}", r_cnt, None, []

    retry_queue: List[str] = []
    reached_milestones: Set[int] = set()
    processed_in_run = 0

    # Phase 10: If starting fresh (0 strict inspected), validate a small initial sample (15 pages) first
    if len(strict_inspected_urls) == 0 and len(pending_detail_urls) > 15:
        sample_chunk = pending_detail_urls[:15]
        pending_detail_urls = pending_detail_urls[15:]
        print(f"  -> Running initial validation sample of {len(sample_chunk)} hymn detail pages...")
        with ThreadPoolExecutor(max_workers=max(1, workers)) as pool:
            futures = [pool.submit(_fetch_and_parse_detail, u) for u in sample_chunk]
            for fut in as_completed(futures):
                u, st, err_msg, r_cnt, main_h, rel_h = fut.result()
                if err_msg or main_h is None:
                    db.log_error(u, "hymn_detail", st, "detail_error", err_msg or "Empty parse", r_cnt)
                    retry_queue.append(u)
                else:
                    db.upsert_raw_listing(main_h)
                    for r_item in rel_h:
                        db.upsert_raw_listing(r_item)
                    db.mark_url_visited(u, "hymn_detail", 200)
                    db.resolve_errors_for_url(u)
                    if main_h.get("lyrics_verification") == "uncertain":
                        retry_queue.append(u)
                processed_in_run += 1
        db.commit()
        counts = db.counts_summary()
        print(
            f"  -> Validation sample passed: strict_inspected={counts['strict_inspected']}, "
            f"with_lyrics={counts['with_lyrics']}, without_lyrics={counts['without_lyrics']}, "
            f"uncertain={counts['uncertain']}"
        )

    # Automatically continue through the entire discoverable catalog in batches of batch_size (100-200)
    idx = 0
    total_pending = len(pending_detail_urls)
    while idx < total_pending:
        if target_unique is not None and target_unique > 0:
            cur_counts = db.counts_summary()
            if cur_counts["strict_inspected"] >= target_unique:
                break

        chunk = pending_detail_urls[idx : idx + batch_size]
        idx += len(chunk)

        with ThreadPoolExecutor(max_workers=max(1, workers)) as pool:
            futures = [pool.submit(_fetch_and_parse_detail, u) for u in chunk]
            for fut in as_completed(futures):
                u, st, err_msg, r_cnt, main_h, rel_h = fut.result()
                if err_msg or main_h is None:
                    db.log_error(u, "hymn_detail", st, "detail_error", err_msg or "Empty parse", r_cnt)
                    if st != 404:
                        retry_queue.append(u)
                    else:
                        db.mark_url_visited(u, "hymn_detail_404", 404)
                else:
                    db.upsert_raw_listing(main_h)
                    for r_item in rel_h:
                        r_url = canonicalize_hymn_url(str(r_item.get("source_url") or ""))
                        if r_url and r_url not in all_discovered_set:
                            all_discovered_set.add(r_url)
                            pending_detail_urls.append(r_url)
                            total_pending = len(pending_detail_urls)
                        db.upsert_raw_listing(r_item)
                    db.mark_url_visited(u, "hymn_detail", 200)
                    db.resolve_errors_for_url(u)
                    if main_h.get("lyrics_verification") == "uncertain":
                        retry_queue.append(u)
                processed_in_run += 1

        db.commit()
        counts = db.counts_summary()
        strict_done = counts["strict_inspected"]

        # Export the 6 EOTC Media audit files after each batch
        audit_rep = export_eotcmedia_catalog_audit(
            db,
            output_dir=eotcmedia_imports_dir,
            advertised_catalog_size=advertised_total,
            sitemap_detail_urls_count=len(detail_urls),
        )

        milestone_name = f"batch_{processed_in_run}_inspected_{strict_done}"
        for m in MILESTONES:
            if strict_done >= m and m not in reached_milestones:
                reached_milestones.add(m)
                milestone_name = f"milestone_inspected_{m}"
                print(
                    f"  [MILESTONE {m}] Inspected {strict_done}/{len(all_discovered_set)} hymn pages: "
                    f"with_lyrics={counts['with_lyrics']}, without_lyrics={counts['without_lyrics']}, "
                    f"uncertain={counts['uncertain']}, import_ready={audit_rep['total_import_ready']}"
                )

        db.record_checkpoint(
            milestone_label=milestone_name,
            total_listings=counts["total_listings"],
            detail_verified_count=strict_done,
            unique_mezmurs_count=counts["with_lyrics"],
            compilations_count=counts["compilations"],
            duplicates_count=int(audit_rep["total_duplicates"]),
        )
        print(
            f"  -> Batch checkpoint saved ({idx}/{total_pending}): "
            f"strict_inspected={strict_done}/{len(all_discovered_set)}, "
            f"with_lyrics={counts['with_lyrics']}, without_lyrics={counts['without_lyrics']}, "
            f"uncertain={counts['uncertain']}, import_ready={audit_rep['total_import_ready']}, "
            f"duplicates={audit_rep['total_duplicates']}"
        )

    # Step 5b: Automated retry queue for temporary failures or uncertain pages
    still_inspected = db.get_strict_inspected_detail_urls()
    final_retry_urls = list(
        dict.fromkeys(
            [u for u in retry_queue if u not in still_inspected]
            + [u for u in all_discovered_set if u not in still_inspected]
        )
    )
    if final_retry_urls and (target_unique is None or target_unique <= 0):
        print(f"[5/6] Processing automated retry queue for {len(final_retry_urls)} unverified/uncertain URLs...")
        for r_url in final_retry_urls:
            time.sleep(max(0.2, min_delay * 2))
            u, st, err_msg, r_cnt, main_h, rel_h = _fetch_and_parse_detail(r_url)
            if not err_msg and main_h is not None and main_h.get("lyrics_verification") in ("verified_true", "verified_false"):
                db.upsert_raw_listing(main_h)
                for r_item in rel_h:
                    db.upsert_raw_listing(r_item)
                db.mark_url_visited(u, "hymn_detail", 200)
                db.resolve_errors_for_url(u)
            elif not err_msg and main_h is not None and main_h.get("lyrics_verification") == "uncertain":
                # HTTP 200 succeeded, content is genuinely ambiguous -> try Playwright if available, else keep uncertain without logging a false network error
                pw_main, pw_rel, _ = _try_playwright_fallback_for_uncertain(r_url)
                if pw_main is not None and pw_main.get("lyrics_verification") in ("verified_true", "verified_false"):
                    db.upsert_raw_listing(pw_main)
                    for r_item in pw_rel:
                        db.upsert_raw_listing(r_item)
                    db.mark_url_visited(r_url, "hymn_detail_playwright", 200)
                else:
                    db.upsert_raw_listing(main_h)
                    db.mark_url_visited(u, "hymn_detail", 200)
                db.resolve_errors_for_url(r_url)
            else:
                pw_main, pw_rel, pw_err = _try_playwright_fallback_for_uncertain(r_url)
                if pw_main is not None and pw_main.get("lyrics_verification") in ("verified_true", "verified_false"):
                    db.upsert_raw_listing(pw_main)
                    for r_item in pw_rel:
                        db.upsert_raw_listing(r_item)
                    db.mark_url_visited(r_url, "hymn_detail_playwright", 200)
                    db.resolve_errors_for_url(r_url)
                else:
                    db.log_error(
                        r_url,
                        "hymn_detail_retry",
                        st,
                        "retry_unresolved",
                        err_msg or pw_err or "Unreachable after retry",
                        r_cnt + 1,
                    )
        db.commit()

    print("[6/6] Finalizing all CSV exports (data/imports/eotcmedia/ + mezmur-research/exports/) and audit report...")
    final_summary = build_and_export_all_csvs(
        db,
        exports_dir=exports_dir,
        reports_dir=reports_dir,
        max_records=max_records_export,
        eotcmedia_imports_dir=eotcmedia_imports_dir,
    )
    db.close()
    print("Done! Final Summary:", json.dumps(final_summary, indent=2))
    return final_summary


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run TewahedoDaily full EOTC Media hymn catalog audit & CSV exporter.")
    parser.add_argument(
        "--target",
        type=int,
        default=0,
        help="Optional cap on inspected pages (0 = inspect ALL discoverable hymns in catalog)",
    )
    parser.add_argument("--batch-size", type=int, default=150, help="Checkpoint batch size (100-200 recommended)")
    parser.add_argument("--workers", type=int, default=8, help="Concurrent polite worker threads")
    parser.add_argument("--delay", type=float, default=0.04, help="Minimum global delay between requests (s)")
    parser.add_argument("--max-export", type=int, default=None, help="Optional cap on exported records")
    args = parser.parse_args()

    run_crawler(
        target_unique=args.target if args.target > 0 else None,
        batch_size=args.batch_size,
        workers=args.workers,
        min_delay=args.delay,
        max_records_export=args.max_export,
    )
