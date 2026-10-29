#!/usr/bin/env python3
"""Translate extracted Amharic paragraphs with a local Ollama model.

The script checkpoints after every batch and can be safely resumed.  It sends no
content to an external service.
"""
from __future__ import annotations

import json
import os
import sys
import time
import urllib.request
from pathlib import Path


MODEL = "gemma4:12b"
BATCH = 16
URL = "http://" + os.environ.get("OLLAMA_HOST", "127.0.0.1:11434").removeprefix("http://").removeprefix("https://") + "/api/generate"

SYSTEM = """You are translating an Ethiopian Orthodox Tewahedo Church history textbook from Amharic into English.
Translate every supplied item completely and faithfully. Never summarize, omit, expand, or add external history. Preserve the author's theological interpretation, quotations, names, dates, list numbering, and Scripture references. Use professional English suitable for religious education. Preserve Ethiopian Orthodox Tewahedo terminology; transliterate Geʽez terms that lack an exact equivalent. Use Saint, Abba, Holy Synod, Patriarch, Metropolitan, Archbishop, Bishop, Priest, Deacon, Apostles, Church Fathers, Martyrs, and Church Councils consistently. Do not insert Islamic formulas, honorifics, claims, or wording unless they are explicitly present in the Amharic item. Do not turn Christian passages into Islamic passages. Return exactly one translation for every input id, in the same order. Output only JSON matching the required schema."""

SCHEMA = {
    "type": "object",
    "properties": {
        "translations": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {"id": {"type": "integer"}, "text": {"type": "string"}},
                "required": ["id", "text"],
                "additionalProperties": False,
            },
        }
    },
    "required": ["translations"],
    "additionalProperties": False,
}


def call(items: list[dict], attempt: int = 1) -> list[dict]:
    compact = [{"id": p["index"], "amharic": p["text"]} for p in items]
    prompt = SYSTEM + "\n\nINPUT:\n" + json.dumps(compact, ensure_ascii=False)
    body = json.dumps({
        "model": MODEL,
        "prompt": prompt,
        "stream": False,
        "think": False,
        "format": SCHEMA,
        "options": {"temperature": 0.05, "num_ctx": 16384},
        "keep_alive": "30m",
    }, ensure_ascii=False).encode("utf-8")
    req = urllib.request.Request(URL, data=body, headers={"Content-Type": "application/json"})
    try:
        with urllib.request.urlopen(req, timeout=600) as response:
            result = json.loads(response.read().decode("utf-8"))
        translations = json.loads(result["response"])["translations"]
        expected = [p["index"] for p in items]
        got = [p["id"] for p in translations]
        if got != expected or any(not p["text"].strip() for p in translations):
            raise ValueError(f"IDs/content mismatch: expected {expected}, got {got}")
        return translations
    except Exception:
        if attempt >= 3:
            if len(items) == 1:
                raise
            mid = len(items) // 2
            return call(items[:mid], 1) + call(items[mid:], 1)
        time.sleep(attempt * 2)
        return call(items, attempt + 1)


def main() -> int:
    source = Path(sys.argv[1])
    target = Path(sys.argv[2])
    src = json.loads(source.read_text(encoding="utf-8"))
    existing = json.loads(target.read_text(encoding="utf-8")) if target.exists() else {"paragraphs": []}
    translated = {p["index"]: p for p in existing.get("paragraphs", [])}
    pending = [p for p in src["paragraphs"] if p["index"] not in translated]
    total = len(src["paragraphs"])
    for start in range(0, len(pending), BATCH):
        batch = pending[start:start + BATCH]
        results = call(batch)
        for original, result in zip(batch, results):
            translated[original["index"]] = {"index": original["index"], "style": original["style"], "text": result["text"].strip()}
        output = {
            "source": str(source),
            "model": MODEL,
            "source_sha256": src.get("sha256"),
            "translation_status": "ai_translated_pending_review",
            "paragraphs": [translated[i] for i in sorted(translated)],
        }
        target.write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print(f"{target.name}: {len(translated)}/{total}", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
