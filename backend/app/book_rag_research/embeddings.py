"""Pinned real CPU ONNX E5 models; no remote inference or silent truncation."""
from __future__ import annotations

import hashlib
import time
from pathlib import Path

import numpy as np

MODELS = {
    "e5_small_q8": ("Xenova/multilingual-e5-small", "761b726dd34fb83930e26aab4e9ac3899aa1fa78"),
    "e5_base_q8": ("Xenova/multilingual-e5-base", "1ec9243030a27d1a115d5c340572074c125b58b2"),
}


class E5Encoder:
    def __init__(self, model_key: str, cache_dir: Path, *, threads=4, max_length=384):
        import onnxruntime as ort
        from tokenizers import Tokenizer
        repo, revision = MODELS[model_key]
        folder = Path(cache_dir) / ("models--" + repo.replace("/", "--")) / "snapshots" / revision
        model = folder / "onnx/model_quantized.onnx"
        self.tokenizer = Tokenizer.from_file(str(folder / "tokenizer.json"))
        self.max_length, self.key = max_length, model_key
        opts = ort.SessionOptions()
        opts.intra_op_num_threads, opts.inter_op_num_threads = threads, 1
        opts.graph_optimization_level = ort.GraphOptimizationLevel.ORT_ENABLE_BASIC
        started = time.perf_counter()
        self.session = ort.InferenceSession(str(model), sess_options=opts, providers=["CPUExecutionProvider"])
        self.input_names = {x.name for x in self.session.get_inputs()}
        self.metadata = {"key":model_key, "upstream_model":repo.replace("Xenova/", "intfloat/"),
                         "onnx_repo":repo,"revision":revision,"quantization":"int8 ONNX conversion",
                         "file_sha256":hashlib.sha256(model.read_bytes()).hexdigest(),
                         "file_bytes":model.stat().st_size,"pooling":"attention-masked mean + L2",
                         "query_prefix":"query: ","passage_prefix":"passage: ",
                         "max_length":max_length,"threads":threads,
                         "load_seconds":time.perf_counter()-started,"runtime":ort.__version__}

    def encode(self, texts, *, query=False, batch_size=8, progress=None):
        result = []
        prefix = "query: " if query else "passage: "
        for start in range(0, len(texts), batch_size):
            batch = self.tokenizer.encode_batch([prefix + t for t in texts[start:start+batch_size]])
            if any(len(e.ids) > self.max_length for e in batch):
                raise ValueError("Input exceeds token cap; contextual chunks must be split, never silently truncated")
            width = max(len(e.ids) for e in batch)
            ids = np.ones((len(batch), width), dtype=np.int64)
            mask = np.zeros_like(ids)
            types = np.zeros_like(ids)
            for i, e in enumerate(batch):
                ids[i, :len(e.ids)] = e.ids; mask[i, :len(e.ids)] = 1
            values = {"input_ids":ids,"attention_mask":mask,"token_type_ids":types}
            hidden = self.session.run(None, {k:v for k,v in values.items() if k in self.input_names})[0]
            vectors = (hidden * mask[:,:,None]).sum(1) / mask.sum(1)[:,None]
            vectors = vectors / np.maximum(np.linalg.norm(vectors, axis=1, keepdims=True), 1e-12)
            result.append(vectors.astype(np.float32))
            if progress: progress(min(start + batch_size, len(texts)), len(texts))
        return np.concatenate(result)
