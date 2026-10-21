"""Download pinned public model files into an explicitly selected local cache."""
import argparse
from pathlib import Path
import sys
import os

sys.path.insert(0,str(Path(__file__).resolve().parents[1]/"app"))
from book_rag_research.embeddings import MODELS


def main():
    p=argparse.ArgumentParser();p.add_argument("--cache",type=Path,required=True)
    args=p.parse_args()
    os.environ["HF_HUB_DISABLE_TELEMETRY"]="1"
    os.environ["HF_HUB_DISABLE_XET"]="1"
    from huggingface_hub import hf_hub_download
    for repo,revision in MODELS.values():
        for name in ("tokenizer.json","config.json","onnx/model_quantized.onnx"):
            hf_hub_download(repo,name,revision=revision,cache_dir=args.cache,token=False)
            print(repo,name,"ready",flush=True)


if __name__=="__main__":main()
