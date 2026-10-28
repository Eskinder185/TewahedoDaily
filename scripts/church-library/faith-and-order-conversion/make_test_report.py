"""Render church_faith_and_order_search_tests.md from the local e2e report.json."""
import json
import sys
from pathlib import Path


def esc(s):
    return (s or "").replace("|", "\\|").replace("\n", " ")


def main(report_path: Path, out: Path) -> None:
    R = json.loads(report_path.read_text(encoding="utf-8"))
    def score(rs):
        return sum(r["pass"] for r in rs), len(rs), sum(r["grounded"] for r in rs)
    b, p, a = score(R["baseline"]), score(R["pendingAliases"]), score(R["approved"])
    ms = sorted(r["ms"] for r in R["approved"])
    md = ["# Faith and Order — Search Buddy retrieval tests", "",
          "Run against a local PostgreSQL 16 + pgvector database built from the repository's own Church Library "
          "migrations (`20261024190000`, `20261024320000`, `20261026160000`, `20261027150000`), served through "
          "PostgREST 12 and queried with `@supabase/supabase-js` using an **anonymous** key, the same path as "
          "`src/lib/searchBuddy/churchLibrarySearch.ts`. Production was not contacted (it is not reachable from the "
          "build environment, and no production records were changed). Harness: "
          "`scripts/church-library/local-search-test/run.sh`.", "",
          "## Summary", "",
          "| Stage | Top result in the expected chapter | Hits are real indexed passages |", "|---|---|---|",
          f"| 1. Current production RPC (`search_church_library` from 20261026160000) | {b[0]}/{b[1]} | {b[2]}/{b[1]} |",
          f"| 2. Proposed RPC, aliases loaded but still `pending` | {p[0]}/{p[1]} | {p[2]}/{p[1]} |",
          f"| 3. Proposed RPC, aliases approved | **{a[0]}/{a[1]}** | {a[2]}/{a[1]} |", "",
          f"RPC latency on the local database (47 passages, stage 3): median {ms[len(ms)//2]} ms, max {ms[-1]} ms, "
          "including HTTP. Candidate selection uses the GIN index on `search_document` (plan below).", "",
          "Why the current RPC fails most questions: it requires **every** word of the question to occur in one passage "
          "(`websearch_to_tsquery` with the `simple` config has no stop words, so “what”, “does”, “the” must match too) "
          "and the client sends `search_language = 'am'` for Amharic questions, which filters out every English passage.", "",
          "“Grounded” means each of the top three hits was re-read from `church_library_passages` by id and its excerpt "
          "was found verbatim in the stored content (a query with no hits counts as grounded). Negative controls pass when nothing is returned, which is what "
          "lets Search Buddy say it lacks source evidence.", "",
          "## Workflow and permission checks", "", "| Check | Result |", "|---|---|"]
    for s in R["steps"]:
        md.append(f"| {esc(s['step'])} | {'PASS' if s['pass'] else 'FAIL'} |")
    md += ["", "## Results with the proposed RPC and approved aliases", ""]
    for r in R["approved"]:
        exp = "no results (not covered by the book)" if r["expect"] is None else ", ".join(e.strip('/') for e in r["expect"])
        md += [f"### {'PASS' if r['pass'] else 'FAIL'} — {r['q']}",
               f"Expected: {exp} · {r['count']} hits · {r['ms']} ms" + (f" · {r['note']}" if r.get("note") else ""), ""]
        if r["top"]:
            md += ["| # | Chapter | Section | Pages | Score | Excerpt (start) |", "|---|---|---|---|---|---|"]
            for i, t in enumerate(r["top"], 1):
                pages = f"{t['pages'][0]}–{t['pages'][1]}" if t["pages"][0] != t["pages"][1] else str(t["pages"][0])
                md.append(f"| {i} | {esc(t['chapter'])} | {esc(t['section']) or '—'} | {pages} | {t['rank']} | {esc(t['excerpt'][:110])}… |")
        else:
            md.append("No passage returned → Search Buddy shows the “no indexed passage” notice and the AI is told not to cite the library.")
        md.append("")
    md += ["## Stage comparison per question", "", "| Question | Current RPC | Proposed, aliases pending | Proposed, aliases approved |", "|---|---|---|---|"]
    for x, y, z in zip(R["baseline"], R["pendingAliases"], R["approved"]):
        md.append(f"| {esc(x['q'])} | {'PASS' if x['pass'] else 'FAIL'} ({x['count']}) | {'PASS' if y['pass'] else 'FAIL'} ({y['count']}) | {'PASS' if z['pass'] else 'FAIL'} ({z['count']}) |")
    md += ["", "## Index use", "", "```", R["plan"].strip(), "```", "",
           "## Not covered here", "",
           "- The AI-written answer itself: the model gateway is not reachable from the build environment. The grounding "
           "code that feeds these passages to the model is unit-tested in `backend/tests/test_church_library_grounding.py`.",
           "- Semantic (pgvector) ranking: no embeddings were generated, so `semantic_rank` is 0 and ranking is keyword + alias only.", ""]
    out.write_text("\n".join(md), encoding="utf-8")
    print("written", out)


if __name__ == "__main__":
    main(Path(sys.argv[1]), Path(sys.argv[2]))
