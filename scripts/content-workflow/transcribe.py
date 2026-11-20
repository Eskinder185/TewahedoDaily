"""Local recorded-audio transcription for the content workflow (faster-whisper; no cloud calls).

Processes the recording in fixed chunks and writes one JSON file per chunk, so an interrupted run resumes where it
stopped. For each chunk it runs Amharic transcription and, optionally, Whisper's own Amharic->English translation pass.

The "signals" on each segment are the model's own raw outputs (average log-probability, no-speech probability,
compression ratio, low-probability words). They are NOT accuracy scores; they only tell a reviewer where to listen again.

Usage: python transcribe.py --audio FILE --out DIR [--model large-v3] [--chunk-seconds 300] [--language am] [--translate]
"""
from __future__ import annotations

import argparse
import json
import os
import sys
import time
from pathlib import Path

SAMPLE_RATE = 16000


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--audio", required=True)
    parser.add_argument("--out", required=True)
    parser.add_argument("--model", default="large-v3")
    parser.add_argument("--chunk-seconds", type=int, default=300)
    parser.add_argument("--language", default="am")
    parser.add_argument("--translate", action="store_true")
    parser.add_argument("--max-chunks", type=int, default=0, help="stop after N new chunks (0 = all); for testing resume")
    args = parser.parse_args()

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)

    from faster_whisper import WhisperModel
    from faster_whisper.audio import decode_audio

    offline = os.getenv("CONTENT_WORKFLOW_ALLOW_DOWNLOAD") != "1"  # never download a model unless explicitly allowed
    try:
        if os.getenv("CONTENT_WORKFLOW_DEVICE") == "cpu":
            raise RuntimeError("CPU requested")
        import numpy as np
        model = WhisperModel(args.model, device="cuda", compute_type="float16", local_files_only=offline)
        # A GPU can be listed while its CUDA libraries are missing; that only shows at the first inference, so try one.
        list(model.transcribe(np.zeros(SAMPLE_RATE, dtype=np.float32), language="en")[0])
        device = "cuda/float16"
    except Exception as exc:  # no usable GPU: fall back to CPU
        print(f"GPU unavailable ({type(exc).__name__}); using CPU", file=sys.stderr)
        model = WhisperModel(args.model, device="cpu", compute_type="int8", cpu_threads=4, local_files_only=offline)
        device = "cpu/int8"

    samples = decode_audio(args.audio, sampling_rate=SAMPLE_RATE)
    total_seconds = len(samples) / SAMPLE_RATE
    chunk = args.chunk_seconds * SAMPLE_RATE
    count = max(1, -(-len(samples) // chunk))
    (out / "meta.json").write_text(json.dumps({
        "audio": os.path.abspath(args.audio), "durationSeconds": round(total_seconds, 2), "chunks": count,
        "chunkSeconds": args.chunk_seconds, "model": args.model, "device": device, "language": args.language,
        "translate": bool(args.translate), "engine": "faster-whisper",
    }, indent=1), encoding="utf-8")

    def run(piece, task: str, offset: float):
        segments, _ = model.transcribe(piece, language=args.language, task=task, vad_filter=True,
                                       condition_on_previous_text=False, word_timestamps=(task == "transcribe"))
        rows = []
        for seg in segments:
            row = {
                "start": round(offset + seg.start, 2), "end": round(offset + seg.end, 2), "text": seg.text.strip(),
                "signals": {"avgLogProb": round(seg.avg_logprob, 3), "noSpeechProb": round(seg.no_speech_prob, 3),
                            "compressionRatio": round(seg.compression_ratio, 2)},
            }
            if task == "transcribe" and seg.words:
                row["signals"]["lowProbabilityWords"] = [
                    {"word": w.word.strip(), "start": round(offset + w.start, 2), "probability": round(w.probability, 2)}
                    for w in seg.words if w.probability < 0.5]
            rows.append(row)
        return rows

    done_now = 0
    for index in range(count):
        target = out / f"chunk-{index:04d}.json"
        if target.exists():
            print(f"chunk {index + 1}/{count}: already done, skipping", flush=True)
            continue
        if args.max_chunks and done_now >= args.max_chunks:
            print(f"stopping after {done_now} new chunk(s) as requested", flush=True)
            return 3
        piece = samples[index * chunk:(index + 1) * chunk]
        offset = index * args.chunk_seconds
        started = time.time()
        data = {"index": index, "offsetSeconds": offset, "transcript": run(piece, "transcribe", offset)}
        if args.translate:
            try:
                data["translation"] = run(piece, "translate", offset)
            except Exception as exc:  # keep the transcript even when translation fails
                data["translationError"] = f"{type(exc).__name__}: {exc}"
        data["seconds"] = round(time.time() - started, 1)
        temp = target.with_suffix(".tmp")
        temp.write_text(json.dumps(data, ensure_ascii=False, indent=1), encoding="utf-8")
        temp.replace(target)  # atomic: a chunk file exists only when it is complete
        done_now += 1
        print(f"chunk {index + 1}/{count}: {len(data['transcript'])} segments in {data['seconds']}s", flush=True)
    print("done", flush=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
