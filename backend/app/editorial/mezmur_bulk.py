"""Durable, review-first Mezmur enrichment using stable import UUIDs."""
from __future__ import annotations

import hashlib
import json
import os
import re
import threading
import unicodedata
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

import httpx
from fastapi import HTTPException


PROMPT_VERSION = "mezmur-enrichment-v1"
MODEL = os.getenv("MEZMUR_ENRICHMENT_MODEL", "home-ai")
_HONORIFICS = (
    "like mezemiran", "like mezemeran", "like mezemran",
    "liqe mezemiran", "liqe mezemeran", "liqe mezemran",
    "liq mezemiran", "liq mezemeran", "liq mezemran",
    "leqe mezemiran", "leqe mezemeran",
    "mezemiran", "mezemeran", "mezemran",
    "zemarit", "zemari", "deaconess", "deacon", "priest", "father", "memher",
    "ሊቀ መዘምራን", "ሊቀ መዘምራናት", "መዘምራን", "መዘምራናት",
    "ዘማሪት", "ዘማሪ", "ዲያቆን", "ዲ/ን", "ዲ ን", "ቀሲስ", "ካህን", "መምህር", "አባ",
)


def normalize_name(value: str | None) -> str:
    text = unicodedata.normalize("NFKC", value or "").casefold()
    text = re.sub(r"[\u1361-\u1368.,;:()\[\]{}'\"‘’“”/_\-‐‑‒–—―]+", " ", text)
    previous = None
    while text and text != previous:
        previous = text
        for item in _HONORIFICS:
            text = re.sub(rf"^{re.escape(item.casefold())}(?:\s+|$)", "", text)
        text = text.strip()
    text = re.sub(r"[^\w\u1200-\u137f]+", " ", text, flags=re.UNICODE)
    text = re.sub(r"ph", "f", text)
    return " ".join(text.split())


def lyrics_text(row: dict[str, Any]) -> str:
    fields = ("lyrics_amharic", "lyrics_geez", "lyrics_oromo", "lyrics_english", "lyrics_transliteration")
    return "\n\n".join(str(row.get(key) or "").strip() for key in fields if str(row.get(key) or "").strip())


def publication_block(row: dict[str, Any]) -> str | None:
    if not str(row.get("title") or "").strip() or not str(row.get("slug") or "").strip():
        return "Title and slug are required."
    if not str(row.get("lyrics_amharic") or "").strip():
        return "Amharic lyrics are required."
    rights = row.get("rights_status") in {"owned", "licensed", "authorized_contributor", "public_domain", "display_only"}
    rights = rights and bool(row.get("publication_approved_at")) and bool(row.get("publication_approved_by"))
    external = bool(str(row.get("youtube_url") or "").strip() or str(row.get("source_url") or "").strip())
    return None if rights or external else "Verified lyrics rights or an authorized external source is required."


class MezmurBulkStore:
    _locks_guard = threading.Lock()
    _locks: dict[str, threading.Lock] = {}

    def __init__(self, client: httpx.Client | None = None):
        self.url = (os.getenv("SUPABASE_URL") or "").rstrip("/")
        self.key = (os.getenv("SUPABASE_KEY") or "").strip()
        if not self.url or not self.key:
            raise HTTPException(status_code=503, detail="Mezmur bulk processing is not configured.")
        self.client = client

    @property
    def headers(self) -> dict[str, str]:
        return {"apikey": self.key, "Authorization": f"Bearer {self.key}", "Content-Type": "application/json"}

    def request(self, method: str, path: str, **kwargs) -> httpx.Response:
        owns = self.client is None
        client = self.client or httpx.Client(timeout=90)
        try:
            return client.request(method, f"{self.url}{path}", headers=kwargs.pop("headers", self.headers), **kwargs)
        finally:
            if owns:
                client.close()

    def user_rpc(self, name: str, payload: dict[str, Any], access_token: str) -> Any:
        response = self.request(
            "POST",
            f"/rest/v1/rpc/{name}",
            json=payload,
            headers={
                "apikey": self.key,
                "Authorization": f"Bearer {access_token}",
                "Content-Type": "application/json",
            },
        )
        if response.status_code not in {200, 201}:
            try:
                failure = response.json()
            except ValueError:
                failure = {}
            code = str(failure.get("code") or "")
            detail = str(failure.get("message") or "Database operation failed.")
            status = 403 if code == "42501" else 409 if code in {"23505", "40001"} else 422 if code in {"22023", "23514"} else 502
            raise HTTPException(status_code=status, detail=detail)
        return response.json()

    def create_job_as_user(self, *, mode: str, import_ids: list[str], access_token: str) -> tuple[dict[str, Any], bool]:
        result = self.user_rpc(
            "create_mezmur_enrichment_job",
            {"p_mode": mode, "p_import_ids": import_ids},
            access_token,
        )
        if not isinstance(result, dict) or not isinstance(result.get("job"), dict):
            raise HTTPException(status_code=502, detail="Job creation returned an invalid response.")
        return result["job"], bool(result.get("created"))

    def rows(self, table: str, params: dict[str, str]) -> list[dict[str, Any]]:
        response = self.request("GET", f"/rest/v1/{table}", params=params)
        if response.status_code != 200:
            raise HTTPException(status_code=502, detail=f"Could not read {table}.")
        payload = response.json()
        return payload if isinstance(payload, list) else []

    def all_rows(self, table: str, params: dict[str, str], page_size: int = 500) -> list[dict[str, Any]]:
        """Read every row without relying on PostgREST's project row limit."""
        found: list[dict[str, Any]] = []
        for offset in range(0, 1_000_000, page_size):
            page = self.rows(table, {**params, "offset": str(offset), "limit": str(page_size)})
            found.extend(page)
            if len(page) < page_size:
                return found
        raise HTTPException(status_code=502, detail=f"The {table} catalog exceeded the safe processing limit.")

    def optional_all_rows(self, table: str, params: dict[str, str], page_size: int = 500) -> list[dict[str, Any]]:
        """Read an additive catalog that may not be installed yet; surface every other failure."""
        found: list[dict[str, Any]] = []
        for offset in range(0, 1_000_000, page_size):
            response = self.request("GET", f"/rest/v1/{table}", params={**params, "offset": str(offset), "limit": str(page_size)})
            if response.status_code != 200:
                try:
                    code = str(response.json().get("code") or "")
                except (ValueError, AttributeError):
                    code = ""
                if response.status_code == 404 or code in {"42P01", "PGRST205"}:
                    return []
                raise HTTPException(status_code=502, detail=f"Could not read {table}.")
            page = response.json()
            page = page if isinstance(page, list) else []
            found.extend(page)
            if len(page) < page_size:
                return found
        raise HTTPException(status_code=502, detail=f"The {table} catalog exceeded the safe processing limit.")

    def patch(self, table: str, filters: dict[str, str], payload: dict[str, Any]) -> None:
        response = self.request("PATCH", f"/rest/v1/{table}", params=filters, json=payload,
                                headers={**self.headers, "Prefer": "return=minimal"})
        if response.status_code not in {200, 204}:
            raise HTTPException(status_code=502, detail=f"Could not update {table}.")

    def insert(self, table: str, payload: dict[str, Any], *, upsert: bool = False) -> dict[str, Any]:
        headers = {**self.headers, "Prefer": "resolution=merge-duplicates,return=representation" if upsert else "return=representation"}
        params = {"on_conflict": "job_id,mezmur_import_id"} if upsert else None
        response = self.request("POST", f"/rest/v1/{table}", params=params, json=payload, headers=headers)
        if response.status_code not in {200, 201}:
            raise HTTPException(status_code=502, detail=f"Could not write {table}.")
        rows = response.json()
        return rows[0] if isinstance(rows, list) and rows else {}

    @classmethod
    def lock(cls, job_id: str) -> threading.Lock:
        with cls._locks_guard:
            return cls._locks.setdefault(job_id, threading.Lock())

    def create_job(self, *, mode: str, import_ids: list[str], user_id: str) -> dict[str, Any]:
        return self.insert("mezmur_enrichment_jobs", {"mode": mode, "requested_import_ids": import_ids, "created_by": user_id})

    def claim_job(self, job_id: str) -> dict[str, Any] | None:
        response = self.request(
            "PATCH", "/rest/v1/mezmur_enrichment_jobs",
            params={"id": f"eq.{job_id}", "status": "eq.queued"},
            json={"status": "running", "started_at": datetime.now(timezone.utc).isoformat(), "model_name": MODEL},
            headers={**self.headers, "Prefer": "return=representation"},
        )
        if response.status_code not in {200, 204}:
            raise HTTPException(status_code=502, detail="Could not claim enrichment job.")
        rows = response.json() if response.content else []
        return rows[0] if isinstance(rows, list) and rows else None

    def transition_job(self, job_id: str, allowed_statuses: list[str], payload: dict[str, Any]) -> dict[str, Any] | None:
        """Conditionally change one job state and report whether the row won the race."""
        response = self.request(
            "PATCH", "/rest/v1/mezmur_enrichment_jobs",
            params={"id": f"eq.{job_id}", "status": f"in.({','.join(allowed_statuses)})"},
            json=payload,
            headers={**self.headers, "Prefer": "return=representation"},
        )
        if response.status_code not in {200, 204}:
            raise HTTPException(status_code=502, detail="Could not change enrichment job state.")
        rows = response.json() if response.content else []
        return rows[0] if isinstance(rows, list) and rows else None

    def job(self, job_id: str) -> dict[str, Any]:
        rows = self.rows("mezmur_enrichment_jobs", {"id": f"eq.{job_id}", "select": "*"})
        if not rows:
            raise HTTPException(status_code=404, detail="Enrichment job not found.")
        return rows[0]

    def suggestions(self, job_id: str, offset: int, limit: int) -> list[dict[str, Any]]:
        suggestions = self.rows("mezmur_enrichment_suggestions", {"job_id": f"eq.{job_id}", "select": "*", "order": "analyzed_at.asc", "offset": str(offset), "limit": str(limit)})
        ids = [str(item["mezmur_import_id"]) for item in suggestions]
        mezmurs = self.rows("mezmur_data_import", {
            "select": "import_id,title,singer_name,zemari_id,status,updated_at",
            "import_id": f"in.({','.join(ids)})",
        }) if ids else []
        by_id = {str(item["import_id"]): item for item in mezmurs}
        return [{**item, "mezmur": by_id.get(str(item["mezmur_import_id"]))} for item in suggestions]

    def jobs(self, limit: int = 20) -> list[dict[str, Any]]:
        return self.rows("mezmur_enrichment_jobs", {"select": "*", "order": "created_at.desc", "limit": str(limit)})

    def dashboard(self) -> dict[str, int]:
        drafts = self.drafts([])
        published = self.all_rows("mezmur_data_import", {
            "select": "import_id", "status": "eq.published", "deleted_at": "is.null"
        })
        suggestions = self.all_rows("mezmur_enrichment_suggestions", {
            "select": "mezmur_import_id,zemari_id,category_slugs,occasion_slugs,requires_review,publication_eligible,status,error_code",
            "order": "analyzed_at.desc",
        })
        latest: dict[str, dict[str, Any]] = {}
        for suggestion in suggestions:
            latest.setdefault(str(suggestion["mezmur_import_id"]), suggestion)
        values = list(latest.values())
        category_links = {str(item.get("mezmur_slug")) for item in self.all_rows(
            "mezmur_category_links_import", {"select": "mezmur_slug"}
        )}
        occasion_links = {str(item.get("mezmur_slug")) for item in self.all_rows(
            "mezmur_occasion_links_import", {"select": "mezmur_slug"}
        )}
        failed_jobs = self.all_rows("mezmur_enrichment_jobs", {
            "select": "id", "status": "eq.failed"
        })
        return {
            "drafts": len(drafts),
            "with_lyrics": sum(bool(lyrics_text(row)) for row in drafts),
            "missing_lyrics": sum(not bool(lyrics_text(row)) for row in drafts),
            "matched_zemaris": sum(bool(row.get("zemari_id")) for row in drafts),
            "unmatched_zemaris": sum(not bool(row.get("zemari_id")) for row in drafts),
            "categorized": sum(str(row.get("slug")) in category_links for row in drafts),
            "missing_categories": sum(str(row.get("slug")) not in category_links for row in drafts),
            "missing_occasions": sum(str(row.get("slug")) not in occasion_links for row in drafts),
            "needs_review": sum(bool(item.get("requires_review")) for item in values),
            "eligible": sum(bool(item.get("publication_eligible")) and item.get("status") == "applied" for item in values),
            "published": len(published),
            "failed": sum(bool(item.get("error_code")) for item in values),
            "failed_jobs": len(failed_jobs),
        }

    def drafts(self, ids: list[str]) -> list[dict[str, Any]]:
        select = "import_id,slug,title,updated_at,status,deleted_at,zemari_id,singer_id,singer_slug,singer_name,lyrics_amharic,lyrics_geez,lyrics_english,lyrics_oromo,lyrics_transliteration,youtube_url,source_url,rights_status,publication_approved_at,publication_approved_by"
        found: list[dict[str, Any]] = []
        for offset in range(0, 100000, 250):
            params = {"select": select, "status": "eq.draft", "deleted_at": "is.null", "order": "import_id.asc", "offset": str(offset), "limit": "250"}
            if ids:
                params["import_id"] = f"in.({','.join(ids)})"
            page = self.rows("mezmur_data_import", params)
            found.extend(page)
            if len(page) < 250:
                break
        return found

    def catalog(self) -> dict[str, list[dict[str, Any]]]:
        return {
            "zemaris": self.all_rows("zemaris", {"select": "id,slug,name,name_amharic,status,deleted_at", "deleted_at": "is.null"}),
            "zemari_aliases": self.optional_all_rows("zemari_aliases", {"select": "zemari_id,alias,is_verified", "is_verified": "eq.true"}),
            "categories": self.all_rows("categories", {"select": "slug,name,name_amharic,description,status", "status": "neq.archived"}),
            "occasions": self.all_rows("mezmur_occasions", {"select": "slug,name,name_amharic,description,status", "status": "neq.archived"}),
            "sections": self.all_rows("mezmur_sections_import", {"select": "import_id,section_slug,title,title_amharic,description,status,deleted_at", "deleted_at": "is.null"}),
        }

    def filter_for_mode(self, rows: list[dict[str, Any]], mode: str) -> list[dict[str, Any]]:
        if mode == "missing_categories":
            linked = {str(item.get("mezmur_slug")) for item in self.all_rows(
                "mezmur_category_links_import", {"select": "mezmur_slug"}
            )}
            return [row for row in rows if str(row.get("slug")) not in linked]
        if mode == "missing_occasions":
            linked = {str(item.get("mezmur_slug")) for item in self.all_rows(
                "mezmur_occasion_links_import", {"select": "mezmur_slug"}
            )}
            return [row for row in rows if str(row.get("slug")) not in linked]
        if mode == "retry_failed":
            failed = {str(item.get("mezmur_import_id")) for item in self.all_rows(
                "mezmur_enrichment_suggestions", {"select": "mezmur_import_id", "status": "eq.failed"}
            )}
            return [row for row in rows if str(row.get("import_id")) in failed]
        return rows

    def match_zemari(self, row: dict[str, Any], zemaris: list[dict[str, Any]], aliases: list[dict[str, Any]] | None = None) -> tuple[str | None, str | None, float | None, list[str]]:
        active = [z for z in zemaris if not z.get("deleted_at")]
        existing = str(row.get("zemari_id") or "")
        if existing and any(str(z["id"]) == existing for z in active):
            return existing, "existing_uuid", 1.0, ["Existing active zemari_id"]
        raw_name = unicodedata.normalize("NFKC", str(row.get("singer_name") or "")).casefold().strip()
        exact = [z for z in active if raw_name and raw_name in {
            unicodedata.normalize("NFKC", str(z.get("name") or "")).casefold().strip(),
            unicodedata.normalize("NFKC", str(z.get("name_amharic") or "")).casefold().strip(),
        }]
        if len(exact) == 1:
            return str(exact[0]["id"]), "exact_canonical_name", 1.0, [f"Exact canonical name: {row.get('singer_name')}"]
        if len(exact) > 1:
            return None, "ambiguous", None, ["Multiple Zemaris have the same normalized name"]

        alias_ids = {
            str(item.get("zemari_id")) for item in aliases or []
            if item.get("is_verified") and raw_name
            and unicodedata.normalize("NFKC", str(item.get("alias") or "")).casefold().strip() == raw_name
        }
        alias_matches = [z for z in active if str(z.get("id")) in alias_ids]
        if len(alias_matches) == 1:
            return str(alias_matches[0]["id"]), "verified_alias", 1.0, [f"Exact verified alias: {row.get('singer_name')}"]
        if len(alias_matches) > 1:
            return None, "ambiguous", None, ["The verified alias belongs to multiple Zemaris"]

        singer_name = normalize_name(row.get("singer_name"))
        normalized = [z for z in active if singer_name and singer_name in {normalize_name(z.get("name")), normalize_name(z.get("name_amharic"))}]
        if len(normalized) == 1:
            return str(normalized[0]["id"]), "exact_normalized_name", .99, [f"Unique normalized name match: {row.get('singer_name')}"]
        if len(normalized) > 1:
            return None, "ambiguous", None, ["Multiple Zemaris have the same normalized name"]
        singer_slug = normalize_name(row.get("singer_slug"))
        alias = [z for z in active if singer_slug and singer_slug == normalize_name(z.get("slug"))]
        if len(alias) == 1:
            return str(alias[0]["id"]), "normalized_transliteration", .98, [f"Exact normalized singer slug: {row.get('singer_slug')}"]
        if len(alias) > 1:
            return None, "ambiguous", None, ["Singer slug is not unique"]
        legacy = str(row.get("singer_id") or "").strip()
        legacy_matches = [z for z in active if legacy and legacy.casefold() in {
            str(z.get("id") or "").casefold(), str(z.get("slug") or "").casefold()
        }]
        if len(legacy_matches) == 1:
            return str(legacy_matches[0]["id"]), "exact_legacy_id", 1.0, [f"Exact legacy singer identifier: {row.get('singer_id')}"]
        if len(legacy_matches) > 1:
            return None, "ambiguous", None, ["Legacy singer identifier is not unique"]
        return None, "unmatched", None, ["No unique safe Zemari match"]

    def _ai_headers(self) -> dict[str, str]:
        secrets = Path("/run/secrets/tewahedo-ai")
        try:
            return {"Authorization": f"Bearer {(secrets/'litellm.key').read_text().strip()}", "CF-Access-Client-Id": (secrets/'cf-client-id').read_text().strip(), "CF-Access-Client-Secret": (secrets/'cf-client-secret').read_text().strip()}
        except OSError as exc:
            raise HTTPException(status_code=503, detail="Multilingual AI gateway credentials are unavailable.") from exc

    def analyze(self, row: dict[str, Any], catalog: dict[str, list[dict[str, Any]]]) -> dict[str, Any]:
        lyrics = lyrics_text(row)
        if not lyrics:
            return {"primary_category": None, "additional_categories": [], "primary_occasion": None, "additional_occasions": [], "hymn_sections": [], "evidence": [], "classification_confidence": 0, "requires_review": True, "reason": "No usable lyrics."}
        allowed = {"categories": catalog["categories"], "occasions": catalog["occasions"], "sections": catalog["sections"]}
        prompt = "Analyze only the supplied hymn lyrics. Select only identifiers from the supplied taxonomy. Distinguish primary subject from incidental mentions. Return one JSON object with primary_category, additional_categories, primary_occasion, additional_occasions, hymn_sections (section import UUIDs), evidence (short lyric excerpts plus rationale), classification_confidence, requires_review, reason. Never infer rights or invent text.\nTAXONOMY=" + json.dumps(allowed, ensure_ascii=False) + "\nLYRICS=\n" + lyrics[:30000]
        response = httpx.post(
            "https://gateway.eskinder.dev/v1/chat/completions", headers=self._ai_headers(), timeout=90,
            json={"model": MODEL, "messages": [{"role": "system", "content": "You classify Ethiopian Orthodox Tewahedo hymn lyrics using supplied taxonomies. Output strict JSON only."}, {"role": "user", "content": prompt}], "temperature": 0, "max_tokens": 1800, "response_format": {"type": "json_object"}},
        )
        if response.status_code != 200:
            raise HTTPException(status_code=503, detail="The multilingual classification service is unavailable.")
        try:
            result = json.loads(response.json()["choices"][0]["message"]["content"])
        except (KeyError, IndexError, TypeError, ValueError, json.JSONDecodeError) as exc:
            raise HTTPException(status_code=502, detail="The classifier returned invalid structured JSON.") from exc
        valid_categories = {x["slug"] for x in catalog["categories"]}
        valid_occasions = {x["slug"] for x in catalog["occasions"]}
        valid_sections = {str(x["import_id"]) for x in catalog["sections"]}
        cats = [x for x in [result.get("primary_category"), *(result.get("additional_categories") or [])] if x in valid_categories]
        occasions = [x for x in [result.get("primary_occasion"), *(result.get("additional_occasions") or [])] if x in valid_occasions]
        sections = [x for x in result.get("hymn_sections") or [] if str(x) in valid_sections]
        proposed_sections = [str(x) for x in result.get("hymn_sections") or []]
        invalid = (
            len(cats) != len([x for x in [result.get("primary_category"), *(result.get("additional_categories") or [])] if x])
            or len(occasions) != len([x for x in [result.get("primary_occasion"), *(result.get("additional_occasions") or [])] if x])
            or len(sections) != len(proposed_sections)
        )
        confidence = result.get("classification_confidence")
        if not isinstance(confidence, (int, float)) or not 0 <= confidence <= 1:
            confidence = None
            invalid = True
        return {**result, "primary_category": cats[0] if cats else None, "additional_categories": cats[1:], "primary_occasion": occasions[0] if occasions else None, "additional_occasions": occasions[1:], "hymn_sections": sections, "classification_confidence": confidence, "requires_review": bool(result.get("requires_review", True) or invalid)}

    def run(self, job_id: str) -> None:
        lock = self.lock(job_id)
        if not lock.acquire(blocking=False):
            return
        try:
            job = self.claim_job(job_id)
            if not job:
                return
            drafts = self.filter_for_mode(self.drafts(job.get("requested_import_ids") or []), str(job.get("mode") or "all"))
            self.patch("mezmur_enrichment_jobs", {"id": f"eq.{job_id}"}, {"total_count": len(drafts)})
            catalog = self.catalog()
            mode = str(job.get("mode") or "all")
            previous = self.all_rows("mezmur_enrichment_suggestions", {
                "select": "mezmur_import_id,status,requires_review", "job_id": f"eq.{job_id}",
            })
            by_mezmur = {str(item["mezmur_import_id"]): item for item in previous}
            completed = {key for key, item in by_mezmur.items() if item.get("status") != "failed"}
            counts = {
                "processed_count": len(previous),
                "succeeded_count": sum(item.get("status") != "failed" and not item.get("requires_review") for item in previous),
                "review_count": sum(item.get("status") != "failed" and bool(item.get("requires_review")) for item in previous),
                "failed_count": sum(item.get("status") == "failed" for item in previous),
            }
            for row in drafts:
                row_key = str(row.get("import_id"))
                if row_key in completed:
                    continue
                if self.job(job_id)["status"] == "cancel_requested":
                    self.patch("mezmur_enrichment_jobs", {"id": f"eq.{job_id}"}, {"status": "cancelled", "completed_at": datetime.now(timezone.utc).isoformat()})
                    return
                if by_mezmur.get(row_key, {}).get("status") == "failed":
                    counts["processed_count"] -= 1
                    counts["failed_count"] -= 1
                try:
                    zemari_id, method, zconf, zevidence = self.match_zemari(row, catalog["zemaris"], catalog.get("zemari_aliases", []))
                    if mode == "zemari":
                        analysis = {"primary_category": None, "additional_categories": [], "primary_occasion": None, "additional_occasions": [], "hymn_sections": [], "evidence": [], "classification_confidence": None, "requires_review": False, "reason": "Zemari-only job."}
                    else:
                        analysis = self.analyze(row, catalog)
                    cats = list(dict.fromkeys([x for x in [analysis.get("primary_category"), *(analysis.get("additional_categories") or [])] if x]))
                    occ = list(dict.fromkeys([x for x in [analysis.get("primary_occasion"), *(analysis.get("additional_occasions") or [])] if x]))
                    review = bool(analysis.get("requires_review") or not zemari_id)
                    block = publication_block(row)
                    payload = {"job_id": job_id, "mezmur_import_id": row["import_id"], "source_updated_at": row.get("updated_at"), "input_lyrics_hash": hashlib.sha256(lyrics_text(row).encode()).hexdigest() if lyrics_text(row) else None, "model_name": MODEL, "prompt_version": PROMPT_VERSION, "zemari_id": zemari_id, "zemari_match_method": method, "zemari_confidence": zconf, "primary_category_slug": analysis.get("primary_category"), "category_slugs": cats, "primary_occasion_slug": analysis.get("primary_occasion"), "occasion_slugs": occ, "section_import_ids": analysis.get("hymn_sections") or [], "evidence": [*zevidence, *(analysis.get("evidence") or [])], "explanation": analysis.get("reason"), "classification_confidence": analysis.get("classification_confidence"), "requires_review": review, "publication_eligible": block is None, "publication_block_reason": block, "status": "suggested"}
                    self.insert("mezmur_enrichment_suggestions", payload, upsert=True)
                    counts["processed_count"] += 1; counts["review_count" if review else "succeeded_count"] += 1
                except Exception as exc:
                    counts["processed_count"] += 1; counts["failed_count"] += 1
                    self.insert("mezmur_enrichment_suggestions", {"job_id": job_id, "mezmur_import_id": row["import_id"], "source_updated_at": row.get("updated_at"), "prompt_version": PROMPT_VERSION, "requires_review": True, "status": "failed", "error_code": type(exc).__name__, "error_message": str(exc)[:1000]}, upsert=True)
                self.patch("mezmur_enrichment_jobs", {"id": f"eq.{job_id}"}, {**counts, "updated_at": datetime.now(timezone.utc).isoformat()})
            self.patch("mezmur_enrichment_jobs", {"id": f"eq.{job_id}"}, {"status": "completed", "completed_at": datetime.now(timezone.utc).isoformat(), **counts})
        except Exception as exc:
            try:
                self.patch("mezmur_enrichment_jobs", {"id": f"eq.{job_id}"}, {
                    "status": "failed", "error_message": str(exc)[:2000],
                    "completed_at": datetime.now(timezone.utc).isoformat(),
                })
            except Exception:
                pass
            raise
        finally:
            lock.release()
