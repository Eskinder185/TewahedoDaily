"""Qdrant REST adapter restricted to numeric loopback and a dedicated collection."""
from __future__ import annotations

from urllib.parse import urlsplit
import re
import httpx


def validate_collection(name):
    if not re.fullmatch(r"tewahedo_editorial_books_local(?:_[a-z0-9_]{1,64})?", name):
        raise ValueError("Only dedicated local collection names are allowed")


class LocalQdrantSink:
    def __init__(self, url: str, *, transport=None):
        parsed = urlsplit(url)
        if (parsed.scheme != "http" or parsed.hostname not in {"127.0.0.1", "::1"}
                or parsed.port != 6333 or parsed.username or parsed.password
                or parsed.path not in {"", "/"} or parsed.query or parsed.fragment):
            raise ValueError("Only http://127.0.0.1:6333 or http://[::1]:6333 is allowed")
        self._client = httpx.Client(base_url=url.rstrip("/"), timeout=30,
                                    follow_redirects=False, trust_env=False, transport=transport)

    def close(self):
        self._client.close()

    def _request(self, method, collection, path, body):
        validate_collection(collection)
        response = self._client.request(method, f"/collections/{collection}/points{path}", json=body)
        response.raise_for_status()
        data = response.json()
        if data.get("status") != "ok":
            raise ValueError("Qdrant did not report success")
        return data["result"]

    def retrieve(self, collection, point_ids):
        result = []
        for start in range(0, len(point_ids), 100):
            result.extend(self._request("POST", collection, "", {
                "ids": point_ids[start:start + 100], "with_payload": True, "with_vector": True}))
        return result

    def upsert(self, *, collection_name, points):
        for start in range(0, len(points), 100):
            result = self._request("PUT", collection_name, "?wait=true", {"points": points[start:start + 100]})
            if result.get("status") != "completed":
                raise ValueError("Qdrant upsert was not completed")

    def delete(self, *, collection_name, point_ids, batch_id):
        for start in range(0, len(point_ids), 100):
            result = self._request("POST", collection_name, "/delete?wait=true", {
                "filter": {"must": [{"has_id": point_ids[start:start + 100]},
                                     {"key": "batch_id", "match": {"value": batch_id}}]}})
            if result.get("status") != "completed":
                raise ValueError("Qdrant deletion was not completed")
