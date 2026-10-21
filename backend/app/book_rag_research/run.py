"""Repeatable CLI for a private real-book research index and measured evaluation."""
from __future__ import annotations

import argparse
from collections import defaultdict
import hashlib
import json
from pathlib import Path
import statistics
import threading
import time

import numpy as np
import psutil

from .corpus import build_corpus, write_json
from .embeddings import E5Encoder, MODELS
from .benchmark import provisional_questions, EXAMPLES
from .index import ResearchIndex
from .retrieval import BM25, distinct, expand_query, hybrid, aligned_hybrid, select_evidence, metrics


def read_lines(path): return [json.loads(x) for x in Path(path).read_text(encoding="utf-8").splitlines() if x.strip()]


class MemorySampler:
    def __init__(self): self.peak=0; self.stop=threading.Event()
    def __enter__(self):
        self.thread=threading.Thread(target=self.sample,daemon=True);self.thread.start();return self
    def sample(self):
        p=psutil.Process()
        while not self.stop.wait(.1): self.peak=max(self.peak,p.memory_info().rss)
    def __exit__(self,*args): self.stop.set();self.thread.join()


def prepare(args):
    from tokenizers import Tokenizer
    repo,rev=MODELS["e5_small_q8"]
    folder=args.cache/("models--"+repo.replace("/","--"))/"snapshots"/rev
    tokenizer=Tokenizer.from_file(str(folder/"tokenizer.json"))
    started=time.perf_counter()
    chunks,stats=build_corpus(args.package,tokenizer)
    args.work.mkdir(parents=True,exist_ok=True)
    with (args.work/"corpus.jsonl").open("w",encoding="utf-8") as f:
        for c in chunks:f.write(json.dumps(c,ensure_ascii=False)+"\n")
    stats["prepare_seconds"]=time.perf_counter()-started
    write_json(args.work/"corpus_stats.json",stats)
    if not (args.work/"questions.json").exists():
        write_json(args.work/"questions.json",provisional_questions())
    print(json.dumps(stats,ensure_ascii=False),flush=True)


def embed(args):
    chunks=read_lines(args.work/"corpus.jsonl")
    texts=[c["context"]+"\n"+c["text"] for c in chunks]
    with MemorySampler() as memory:
        model=E5Encoder(args.model,args.cache)
        started=time.perf_counter()
        def progress(n,total):
            if n%128==0 or n==total:print(f"{args.model}: {n}/{total} real chunks embedded",flush=True)
        vectors=model.encode(texts,progress=progress)
        seconds=time.perf_counter()-started
        np.save(args.work/(args.model+".npy"),vectors)
        meta={**model.metadata,"corpus_sha256":json.loads((args.work/"corpus_stats.json").read_text())["corpus_sha256"],
              "chunks":len(chunks),"dimension":vectors.shape[1],"embed_seconds":seconds,
              "chunks_per_second":len(chunks)/seconds,"peak_process_rss_bytes":memory.peak}
        write_json(args.work/(args.model+".model.json"),meta)
    print(json.dumps(meta),flush=True)


def collection_name(model,sha):return f"tewahedo_research_unapproved_{model}_{sha[:12]}"


def evaluate(args):
    chunks=read_lines(args.work/"corpus.jsonl")
    stats=json.loads((args.work/"corpus_stats.json").read_text())
    questions=json.loads((args.work/"questions.json").read_text(encoding="utf-8"))
    if args.require_human_review and any(q.get("human_reviewed") is not True or not q.get("reviewer") for q in questions):
        raise ValueError("Human-reviewed relevance judgments required; provisional labels cannot satisfy this mode")
    gold_ids={p for c in chunks for p in c["paragraph_ids"]}
    if any(not set(q["relevant_paragraph_ids"])<=gold_ids for q in questions):raise ValueError("Gold IDs missing")
    lexical=BM25(chunks)
    results=[]
    index=ResearchIndex(args.work/"research_index")
    name=collection_name(args.model,stats["corpus_sha256"])
    modelmeta=json.loads((args.work/(args.model+".model.json")).read_text())
    if modelmeta["corpus_sha256"] != stats["corpus_sha256"]:raise ValueError("Stale cached embeddings")
    vectors=np.load(args.work/(args.model+".npy"))
    try:
        start=time.perf_counter()
        build=index.build(name,chunks,vectors,corpus_sha256=stats["corpus_sha256"],model=modelmeta)
        build["index_seconds"]=time.perf_counter()-start
        validation=index.validate(name,chunks,vectors)
        # Re-upsert proves no duplicated IDs; all payload bytes are checked again.
        repeat=index.build(name,chunks,vectors,corpus_sha256=stats["corpus_sha256"],model=modelmeta)
        validation["repeat_upsert_count_unchanged"]=repeat["after_count"]==build["after_count"]
        cleanup_name=name+"_cleanup_probe"
        index.build(cleanup_name,chunks[:2],vectors[:2],corpus_sha256=stats["corpus_sha256"],model=modelmeta)
        validation["cleanup_rehearsal"]=index.cleanup(cleanup_name)
        with MemorySampler() as memory:
            encoder=E5Encoder(args.model,args.cache)
            for q in questions:
                start=time.perf_counter();v=encoder.encode([q["question"]],query=True)[0]
                embed_seconds=time.perf_counter()-start
                start=time.perf_counter();dense=index.search(name,v,language=q["target_language"])
                search_seconds=time.perf_counter()-start
                start=time.perf_counter();lex=lexical.search(q["question"],language=q["target_language"])
                lexical_seconds=time.perf_counter()-start
                start=time.perf_counter();expanded=lexical.search(expand_query(q["question"]),language=q["target_language"])
                fused=hybrid(dense,expanded)
                hybrid_extra_seconds=time.perf_counter()-start
                start=time.perf_counter()
                query_language=q["query_language"] if q["query_language"] in {"en","am"} else None
                if query_language and query_language!=q["target_language"]:
                    own=index.search(name,v,language=query_language)
                    own_fused=hybrid(own,lexical.search(expand_query(q["question"]),language=query_language),limit=20)
                    aligned=aligned_hybrid(fused,own_fused,chunks,q["target_language"])
                else:
                    aligned=fused
                alignment_extra_seconds=time.perf_counter()-start
                for method,hits in (("bm25",distinct(lex)),("dense",distinct(dense)),("hybrid",fused),("aligned_hybrid",aligned)):
                    results.append({"question_id":q["id"],"method":method,
                        "direction":q["query_language"]+"_to_"+q["target_language"],
                        **metrics(hits,q["relevant_paragraph_ids"]),
                        "query_embedding_seconds":embed_seconds,"qdrant_search_seconds":search_seconds,
                        "retrieval_seconds":lexical_seconds if method=="bm25" else embed_seconds+search_seconds+(hybrid_extra_seconds if method in {"hybrid","aligned_hybrid"} else 0)+(alignment_extra_seconds if method=="aligned_hybrid" else 0),
                        "hits":[{"id":h["id"],"score":h["score"],"paragraph_ids":h["payload"]["paragraph_ids"],
                                 "book":h["payload"]["document_id"],"language":h["payload"]["language"]} for h in hits]})
                print(args.model,q["id"],"evaluated",flush=True)
            # Save actual evidence for the six requested live-answer examples.
            examples=[]
            for q in EXAMPLES:
                v=encoder.encode([q],query=True)[0]
                dense=index.search(name,v)
                hits=hybrid(dense,lexical.search(expand_query(q)),limit=10)
                hits=select_evidence(q,hits,chunks,limit=5)
                examples.append({"question":q,"hits":[{"id":h["id"],"score":h["score"],"payload":h["payload"]} for h in hits]})
            write_json(args.work/(args.model+".examples.json"),examples)
            query_peak=memory.peak
        grouped=defaultdict(list)
        for row in results:grouped[(row["method"],row["direction"])].append(row)
        summary=[]
        for (method,direction),rows in sorted(grouped.items()):
            summary.append(dict(method=method,direction=direction,n=len(rows),
                recall_at_5=statistics.mean(r["recall_at_5"] for r in rows),
                mrr_at_10=statistics.mean(r["mrr_at_10"] for r in rows),
                hit_at_5=statistics.mean(r["hit_at_5"] for r in rows)))
        write_json(args.work/(args.model+".retrieval.json"),{
            "model":modelmeta,"index":build,"validation":validation,"summary":summary,"questions":results,
            "query_peak_process_rss_bytes":query_peak,
            "query_embedding_median_ms":1000*statistics.median(r["query_embedding_seconds"] for r in results),
            "qdrant_search_median_ms":1000*statistics.median(r["qdrant_search_seconds"] for r in results),
            "label_status":"provisional_agent_source_linked", "human_reviewed_questions":sum(q["human_reviewed"] for q in questions)})
        print(json.dumps(summary),flush=True)
    finally:index.close()


def answers(args):
    from .answers import LocalGemma,current_system_prompt,messages,automated_answer_checks
    examples=json.loads((args.work/(args.model+".examples.json")).read_text(encoding="utf-8"))
    provider=LocalGemma();records=[]
    try:
        info=provider.info()
        prompt=current_system_prompt(Path(__file__).resolve().parents[1]/"main.py")
        for i,example in enumerate(examples,1):
            for mode,hits in (("before_no_book_evidence",[]),("after_research_rag",example["hits"])):
                msgs,evidence=messages(example["question"],prompt,hits)
                print(f"Gemma example {i}/6 {mode}",flush=True)
                try:
                    result=provider.generate(msgs)
                    record={"id":f"example_{i}_{mode}","question":example["question"],"mode":mode,
                            **result,"evidence":evidence,"checks":automated_answer_checks(result["answer"],evidence,example["question"])}
                except Exception as exc:
                    record={"id":f"example_{i}_{mode}","question":example["question"],"mode":mode,
                            "error":type(exc).__name__,"answer":None}
                records.append(record)
                write_json(args.work/"gemma_answers.json",{"model_info":info,"records":records,
                    "baseline_limit":"Current static Search Buddy prompt and turn instructions; local Bible database/gateway unavailable. Not a production response replay.",
                    "research_only":True,"official_theology_verified":False})
    finally:provider.unload()


def refine(args):
    from .answers import LocalGemma,current_system_prompt,grounded_generate,automated_answer_checks
    examples=json.loads((args.work/(args.model+".examples.json")).read_text(encoding="utf-8"))
    provider=LocalGemma();records=[]
    try:
        info=provider.info();prompt=current_system_prompt(Path(__file__).resolve().parents[1]/"main.py")
        for i,example in enumerate(examples,1):
            print(f"Gemma constrained example {i}/6",flush=True)
            result=grounded_generate(provider,example["question"],prompt,example["hits"])
            if result.get("answer"):
                result["checks"]=automated_answer_checks(result["answer"],result["evidence"],example["question"])
            records.append({"id":f"example_{i}_constrained", "question":example["question"],**result})
            write_json(args.work/"gemma_constrained_answers.json",{"model_info":info,"records":records,
                "research_only":True,"official_theology_verified":False,
                "claim_entailment_and_amharic_fluency_require_human_review":True})
    finally:provider.unload()


def query(args):
    from chat_intelligence import detect_response_language
    if not args.question or len(args.question)>500:raise ValueError("A question of 1–500 characters is required")
    chunks=read_lines(args.work/"corpus.jsonl")
    stats=json.loads((args.work/"corpus_stats.json").read_text())
    encoder=E5Encoder(args.model,args.cache);lexical=BM25(chunks)
    index=ResearchIndex(args.work/"research_index")
    try:
        name=collection_name(args.model,stats["corpus_sha256"])
        v=encoder.encode([args.question],query=True)[0]
        hits=hybrid(index.search(name,v,language=args.target_language),
                    lexical.search(expand_query(args.question),language=args.target_language))
        own_language=detect_response_language(args.question)
        if args.target_language and own_language in {"en","am"} and own_language!=args.target_language:
            own=hybrid(index.search(name,v,language=own_language),
                       lexical.search(expand_query(args.question),language=own_language),limit=20)
            hits=aligned_hybrid(hits,own,chunks,args.target_language)
        if args.target_language!="am":hits=select_evidence(args.question,hits,chunks)
        result={"question":args.question,"research_only":True,"approved_for_ingestion":False,
                "editorial_status":"UNAPPROVED RESEARCH MATERIAL — not verified theology",
                "sources":[{"id":h["id"],"score":h["score"],"document_id":h["payload"]["document_id"],
                            "section_id":h["payload"]["section_id"],"paragraph_ids":h["payload"]["paragraph_ids"],
                            "language":h["payload"]["language"],"content_kind":h["payload"]["content_kind"],
                            "text":h["payload"]["text"]} for h in hits[:5]]}
        if args.generate:
            from .answers import LocalGemma,current_system_prompt,grounded_generate
            provider=LocalGemma()
            try:result["generation"]=grounded_generate(provider,args.question,
                    current_system_prompt(Path(__file__).resolve().parents[1]/"main.py"),hits[:5])
            finally:provider.unload()
        print(json.dumps(result,ensure_ascii=False,indent=2))
    finally:index.close()


def main():
    p=argparse.ArgumentParser();p.add_argument("command",choices=["prepare","embed","evaluate","answers","refine","query","cleanup"])
    p.add_argument("--package",type=Path);p.add_argument("--work",type=Path,required=True)
    p.add_argument("--cache",type=Path);p.add_argument("--model",choices=MODELS,default="e5_small_q8")
    p.add_argument("--require-human-review",action="store_true")
    p.add_argument("--question")
    p.add_argument("--target-language",choices=["en","am"])
    p.add_argument("--generate",action="store_true")
    args=p.parse_args()
    if args.command=="cleanup":
        idx=ResearchIndex(args.work/"research_index")
        try:
            for name in list(idx.ledger["collections"]):print(idx.cleanup(name))
        finally:idx.close()
    else:globals()[args.command](args)


if __name__=="__main__":main()
