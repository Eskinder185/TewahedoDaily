"""Actual persistent Qdrant local collections; no network URL constructor."""
from __future__ import annotations

from pathlib import Path
import re

from .corpus import RESEARCH, write_json


class ResearchIndex:
    def __init__(self, root: Path):
        from qdrant_client import QdrantClient
        import json
        raw = str(root)
        if "://" in raw or raw.lower().startswith(("http:","https:","grpc:")):
            raise ValueError("Research index accepts a local filesystem path only")
        self.root = Path(root).resolve()
        self.marker = self.root / "RESEARCH_ONLY.json"
        self.root.mkdir(parents=True, exist_ok=True)
        if self.marker.exists():
            self.ledger = json.loads(self.marker.read_text(encoding="utf-8"))
            if self.ledger.get("namespace") != RESEARCH:
                raise ValueError("Index ownership marker mismatch")
        else:
            if any(self.root.iterdir()):
                raise ValueError("Refusing an existing unmarked directory")
            self.ledger = {"namespace":RESEARCH,"collections":{}}
            write_json(self.marker, self.ledger)
        self.client = QdrantClient(path=str(self.root / "qdrant"))

    def close(self): self.client.close()

    def owned(self, name):
        if not re.fullmatch(r"tewahedo_research_unapproved_[a-z0-9_]+", name):
            raise ValueError("Not a research collection")

    def build(self, name, chunks, vectors, *, corpus_sha256, model):
        from qdrant_client import models as qm
        import hashlib
        import numpy as np
        self.owned(name)
        if vectors.ndim!=2 or not np.isfinite(vectors).all() or np.any(np.linalg.norm(vectors,axis=1)==0):
            raise ValueError("Invalid research embedding vectors")
        if len(chunks) != len(vectors) or len({c["id"] for c in chunks}) != len(chunks):
            raise ValueError("Vector/corpus identity mismatch")
        if any(c.get("namespace") != RESEARCH or c.get("research_only") is not True
               or c.get("approved_for_ingestion") is not False or c.get("public_retrieval_eligible") is not False
               or hashlib.sha256(c["text"].encode("utf-8")).hexdigest() != c["text_sha256"] for c in chunks):
            raise ValueError("Unsafe or corrupt research payload")
        identity_model={k:v for k,v in model.items() if k not in {
            "load_seconds","embed_seconds","chunks_per_second","peak_process_rss_bytes"}}
        intended = {"corpus_sha256":corpus_sha256,"model":identity_model,"dimension":int(vectors.shape[1]),
                    "count":len(chunks),"status":"pending"}
        old = self.ledger["collections"].get(name)
        if old is not None and isinstance(old.get("model"),dict):
            old["model"]={k:v for k,v in old["model"].items() if k not in {
                "load_seconds","embed_seconds","chunks_per_second","peak_process_rss_bytes"}}
        if self.client.collection_exists(name):
            if old is None or any(old.get(k) != intended[k] for k in ("corpus_sha256","model","dimension","count")):
                raise ValueError("Existing collection manifest differs")
        else:
            self.ledger["collections"][name] = intended
            write_json(self.marker, self.ledger)
            self.client.create_collection(name, vectors_config=qm.VectorParams(size=vectors.shape[1], distance=qm.Distance.COSINE))
        before = self.client.count(name, exact=True).count
        for start in range(0, len(chunks), 64):
            self.client.upsert(name, points=[qm.PointStruct(id=c["id"], vector=v.tolist(), payload=c)
                               for c,v in zip(chunks[start:start+64], vectors[start:start+64])], wait=True)
        count = self.client.count(name, exact=True).count
        if count != len(chunks): raise ValueError("Index count mismatch")
        self.ledger["collections"][name] = {**intended,"status":"complete"}
        write_json(self.marker, self.ledger)
        return {"before_count":before,"after_count":count,"dimension":int(vectors.shape[1]),
                "persistent_local_mode":True,"network_endpoint":None}

    def search(self, name, vector, *, language=None, limit=40):
        from qdrant_client import models as qm
        self.owned(name)
        if name not in self.ledger["collections"]: raise ValueError("Collection is not owned")
        conditions = [qm.FieldCondition(key="namespace",match=qm.MatchValue(value=RESEARCH)),
                      qm.FieldCondition(key="research_only",match=qm.MatchValue(value=True)),
                      qm.FieldCondition(key="approved_for_ingestion",match=qm.MatchValue(value=False))]
        if language: conditions.append(qm.FieldCondition(key="language",match=qm.MatchValue(value=language)))
        hits = self.client.query_points(name, query=vector.tolist(), query_filter=qm.Filter(must=conditions),
                                        limit=limit, with_payload=True).points
        return [{"id":str(h.id),"score":h.score,"payload":h.payload} for h in hits]

    def validate(self, name, chunks, vectors=None):
        import hashlib
        import numpy as np
        self.owned(name)
        expected = {c["id"]:c for c in chunks}
        expected_vectors={c["id"]:v for c,v in zip(chunks,vectors)} if vectors is not None else None
        actual, offset = {}, None
        while True:
            points, offset = self.client.scroll(name, limit=128, offset=offset, with_payload=True, with_vectors=True)
            for p in points:
                payload = p.payload
                if (payload != expected.get(str(p.id)) or payload.get("approved_for_ingestion") is not False
                        or hashlib.sha256(payload["text"].encode("utf-8")).hexdigest() != payload["text_sha256"]):
                    raise ValueError("Indexed payload or approval mismatch")
                if len(p.vector) != self.ledger["collections"][name]["dimension"]:
                    raise ValueError("Vector dimension mismatch")
                if not np.isfinite(p.vector).all():raise ValueError("Nonfinite indexed vector")
                if expected_vectors is not None and not np.allclose(p.vector,expected_vectors[str(p.id)],atol=1e-5):
                    raise ValueError("Indexed vector differs from the measured model output")
                actual[str(p.id)] = True
            if offset is None: break
        if set(actual) != set(expected): raise ValueError("Indexed IDs differ")
        return {"exact_payloads":True,"all_ids":True,"all_vectors_correct_dimension":True,
                "all_unapproved":True,"verified_points":len(actual),"finite_vectors":True,
                "vectors_match_measured_embeddings":True if expected_vectors is not None else None}

    def cleanup(self, name):
        self.owned(name)
        if name not in self.ledger["collections"]: raise ValueError("Collection is not owned")
        if self.client.collection_exists(name): self.client.delete_collection(name)
        self.ledger["collections"][name]["status"] = "removed"
        write_json(self.marker, self.ledger)
        return {"collection":name,"removed":not self.client.collection_exists(name)}
