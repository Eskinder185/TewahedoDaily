"""Measured lexical baseline and bilingual hybrid research retrieval."""
from __future__ import annotations

from collections import Counter
import math
import re

TOKEN = re.compile(r"[^\W_]+", re.UNICODE)
TERMS = [
    ("trinity","selassie","ሥላሴ","ስላሴ"),
    ("incarnation","sigawe","ሥጋዌ","ስጋዌ"),
    ("baptism","baptized","timket","timkat","ጥምቀት","ተጠመቀ"),
    ("jordan","ዮርዳኖስ"), ("eucharist","communion","qurban","ቁርባን"),
    ("penance","confession","nuzaze","ንስሐ","ኑዛዜ"),
    ("myron","confirmation","ሜሮን","ማይሮን"),
    ("resurrection","ትንሣኤ","ትንሳኤ"),
    ("andemta","andimta","አንድምታ"), ("matthew","mathew","ማቴዎስ"),
    ("frumentius","selama","ፍሬምናጦስ","ሰላማ"), ("nicaea","nicea","ኒቅያ"),
]


def tokens(text): return [s.lower() for s in TOKEN.findall(text)]


def expand_query(query):
    found = set(tokens(query))
    additions = [term for group in TERMS if found.intersection(group) for term in group if term not in found]
    return query + (" " + " ".join(additions) if additions else "")


class BM25:
    def __init__(self, chunks):
        self.chunks = chunks
        self.terms = [Counter(tokens(c["context"] + "\n" + c["text"])) for c in chunks]
        self.lengths = [sum(t.values()) for t in self.terms]
        self.average = sum(self.lengths) / max(len(chunks), 1)
        self.df = Counter(t for row in self.terms for t in row)

    def search(self, query, *, language=None, limit=40):
        q = set(tokens(query))
        scored = []
        for i, (c, terms, length) in enumerate(zip(self.chunks,self.terms,self.lengths)):
            if language and c["language"] != language: continue
            score = 0.0
            for term in q & terms.keys():
                tf = terms[term]
                idf = math.log(1 + (len(self.chunks) - self.df[term] + 0.5)/(self.df[term]+0.5))
                score += idf * tf * 2.2/(tf + 1.2*(0.25 + 0.75*length/self.average))
            if score > 0: scored.append({"id":c["id"],"score":score,"payload":c})
        return sorted(scored,key=lambda h:(-h["score"],h["id"]))[:limit]


def distinct(hits, limit=10):
    """Do not fill the result list with aligned original/translation duplicates."""
    seen, result = [], []
    for h in hits:
        ids = set(h["payload"]["paragraph_ids"])
        duplicate=False
        for previous in seen:
            old=previous["payload"]
            if not ids.intersection(old["paragraph_ids"]):continue
            if old["language"] != h["payload"]["language"]:
                duplicate=True;break
            # Distinct slices of a long paragraph may both be relevant.
            if any(a["variant_id"]==b["variant_id"] and max(a["start"],b["start"])<min(a["end"],b["end"])
                   for a in old["spans"] for b in h["payload"]["spans"]):
                duplicate=True;break
        if duplicate:continue
        seen.append(h); result.append(h)
        if len(result) == limit: break
    return result


def hybrid(dense, lexical, *, limit=10):
    scored, by_id = Counter(), {}
    for rows in (dense, lexical):
        for rank, hit in enumerate(rows,1):
            scored[hit["id"]] += 1/(60+rank)
            by_id[hit["id"]] = hit
    return distinct([{**by_id[i],"score":s} for i,s in sorted(scored.items(),key=lambda x:(-x[1],x[0]))],limit)


def aligned_hybrid(target_hits, own_language_hits, chunks, target_language, *, limit=10):
    """Use exact editorial source alignment to bridge languages, without translating text."""
    by_paragraph = {}
    for c in chunks:
        if c["language"]==target_language:
            for pid in c["paragraph_ids"]:by_paragraph.setdefault(pid,[]).append(c)
    scores, by_id = Counter(), {}
    for rank,h in enumerate(target_hits,1):
        scores[h["id"]]+=1/(60+rank);by_id[h["id"]]=h
    for rank,h in enumerate(own_language_hits,1):
        linked={c["id"]:c for pid in h["payload"]["paragraph_ids"] for c in by_paragraph.get(pid,[])}
        for cid,c in linked.items():
            scores[cid]+=1/(60+rank)
            by_id[cid]={"id":cid,"payload":c,"alignment_from":h["id"]}
    return distinct([{**by_id[cid],"score":score} for cid,score in sorted(scores.items(),key=lambda x:(-x[1],x[0]))],limit)


def select_evidence(question, candidates, chunks, *, limit=5):
    from chat_intelligence import is_five_mysteries_question, classify_question_focus
    from doctrinal_categories import is_seven_sacraments_question
    from .grounding import rank_passages_for_question
    if classify_question_focus(question) in {"greeting","identity"}:return []
    if is_five_mysteries_question(question):
        # This is section routing, not a generated/canned answer. Use actual F01
        # chapter-opening passages for each of its five foundational Mysteries.
        # Never pull the seven-sacrament inventory (F01W-P0165) into this set.
        selected=[]
        concepts={
            "F01W-S02":"one three persons father son holy spirit Godhead",
            "F01W-S03":"incarnation divinity humanity united salvation word",
            "F01W-S04":"baptism born water spirit kingdom",
            "F01W-S05":"communion flesh blood bread wine",
            "F01W-S06":"resurrection dead life judgment tombs voice",
        }
        for section,concept in concepts.items():
            section_chunks=[c for c in chunks if c["section_id"]==section and c["content_kind"]=="english_reading"]
            # Prefer definition-bearing passages over cover headings or incidental
            # practices. The concept vocabulary routes retrieval; all answer text
            # still comes from actual source chunks.
            terms=set(tokens(concept))
            c=max(section_chunks,key=lambda c:(len(terms.intersection(tokens(c["text"]))),-len(c["text"])),default=None)
            if c:selected.append({"id":c["id"],"score":1,"payload":c,"selection_method":"source_section_overview"})
        return selected[:limit]
    if is_seven_sacraments_question(question):
        # Prefer the explicit seven-sacrament list paragraph, then sacrament headings.
        selected=[]
        preferred_ids={"F01W-P0165","F01-P0165"}
        for c in chunks:
            pids=set(c.get("paragraph_ids") or [])
            if preferred_ids.intersection(pids) and c.get("content_kind")=="english_reading":
                selected.append({"id":c["id"],"score":2,"payload":c,"selection_method":"sacrament_list_anchor"})
                break
        ranked=rank_passages_for_question(question, candidates, limit=max(limit, 7))
        for h in ranked:
            if any(x["id"]==h["id"] for x in selected):
                continue
            text=(h.get("payload") or {}).get("text","").lower()
            if any(k in text for k in (
                "sacrament","baptism","confirmation","penance","communion",
                "unction","matrimony","holy orders","myron",
            )):
                selected.append({**h,"selection_method":h.get("selection_method") or "sacrament_rank"})
            if len(selected)>=limit:
                break
        return selected[:limit]
    # Evidence-first: strongest supporting passages before generation.
    return rank_passages_for_question(question, candidates, limit=limit)


def metrics(retrieved, relevant):
    gold = set(relevant)
    top5 = {p for h in retrieved[:5] for p in h["payload"]["paragraph_ids"]}
    first = next((i for i,h in enumerate(retrieved[:10],1) if gold.intersection(h["payload"]["paragraph_ids"])), None)
    return {"recall_at_5":len(gold & top5)/len(gold) if gold else None,
            "mrr_at_10":1/first if first else 0.0,
            "hit_at_5":bool(gold & top5), "gold_paragraphs":sorted(gold)}
