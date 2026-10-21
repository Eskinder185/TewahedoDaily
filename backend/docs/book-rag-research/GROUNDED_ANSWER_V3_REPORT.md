# Grounded answer v3 — partial answers over unnecessary abstention

UNAPPROVED PRIVATE RESEARCH — not verified theology.
Citation validation was not relaxed to raise pass rates.

## Abstention root causes (v2) and v3 response

### Why did Jesus choose to be baptized in the Jordan River?
- v2: unsupported_generation_invented_bible_refs → full abstention
- v3: recover/extractive partial from Jordan symbolism + baptism-reason passages; verses still rejected
- Guardrails: citation IDs, verse ban, risky-marker checks unchanged

### ኢየሱስ ክርስቶስ ለምን ተጠመቀ?
- v2: model_terminology_amharic + low overlap after repair → abstention
- v3: term repair + recover supported claims or Amharic extractive quotes
- Guardrails: ሦስትነት still rejected; English still banned in Amharic answers

### አምስቱ ምሥጢራት ምንድን ናቸው?
- v2: unsupported heaven wording → full abstention
- v3: drop unsupported resurrection claim; keep supported mysteries as partial
- Guardrails: risky heaven marker still blocked when absent from source

## Mechanical metrics (same six questions / evidence / recorded settings)

| Metric | v1 contract | v3 |
| --- | --- | --- |
| Contract pass rate | 0.67 | 1.00 |
| Mean unsupported-claim rate | 0.37 | 0.00 |
| Mean citation precision | 0.67 | 1.00 |
| Full abstentions | (v2 had 3) | 0 |
| Partial answers | — | 3 |

Live Gemma: `{'live_gemma_available': False, 'error': '[WinError 10061] No connection could be made because the target machine actively refused it'}`

Expanded provisional questions: 43 (human_reviewed=0).

## Before / after answers

## 1. At what time was Jesus Christ baptized?

### Before (v1)

The Bible does not specify a clock time of day for the baptism of Jesus Christ. [B2]

Tradition explains that Christ was baptized at the age of thirty years to resemble Adam, who was created as a mature man of thirty years. [B5]

Mechanical contract passed: True.

### After (v3)

The Bible does not specify a clock time of day for the baptism of Jesus Christ. [B2]

Tradition explains that Christ was baptized at the age of thirty years to resemble Adam, who was created as a mature man of thirty years. [B5]

Contract: `source_bound_claims_v3` mode=v3_prior_structured_pass partial=False abstained=False.
Unsupported-claim rate: 0.00. Citation precision: 1.00.

## 2. Why did Jesus choose to be baptized in the Jordan River?

### Before (v1)

REJECTED — no answer released by the contract.

Mechanical contract passed: False.

### After (v3)

The Jordan's single source signifies the single origin of all humanity, and its division signifies the separation of Israel and the Gentiles; His baptism at the meeting point signifies the union of both peoples through one Gospel. [B1]

Jesus' baptism was an act of humility rather than exaltation, as a Master going to be baptized by His servant sets an example for others to follow. [B2]

Contract: `source_bound_partial_v3` mode=v3_recovered_attempt partial=True abstained=False.
Unsupported-claim rate: 0.00. Citation precision: 1.00.

## 3. What are the Five Mysteries?

### Before (v1)

The Mystery of the Trinity (ምሥጢረ ሥላሴ) is the eternal unity of the Father, Son, and Holy Spirit as one God in three distinct Persons. [B1]

The Mystery of the Incarnation (ምሥጢረ ሥጋዌ) is the unique event where God the Son united manhood to His Godhead without mixture, confusion, division, or separation. [B2]

The Mystery of Baptism (ምሥጢረ ጥምቀት) involves being born of water and the Spirit to enter the kingdom of God. [B3]

The Mystery of the Eucharist (ምሥጢረ ቁርባን) is the partaking of the visible bread and wine to attain invisible heavenly blessings and eternal life. [B4]

The Mystery of the Resurrection of the Dead (ምሥጢረ ትንሣኤ ሙታን) is the future event where all who are in the tombs will hear His voice and come forth. [B5]

Mechanical contract passed: True.

### After (v3)

The Mystery of the Trinity (ምሥጢረ ሥላሴ) is the eternal unity of the Father, Son, and Holy Spirit as one God in three distinct Persons. [B1]

The Mystery of the Incarnation (ምሥጢረ ሥጋዌ) is the unique event where God the Son united manhood to His Godhead without mixture, confusion, division, or separation. [B2]

The Mystery of Baptism (ምሥጢረ ጥምቀት) involves being born of water and the Spirit to enter the kingdom of God. [B3]

The Mystery of the Eucharist (ምሥጢረ ቁርባን) is the partaking of the visible bread and wine to attain invisible heavenly blessings and eternal life. [B4]

The Mystery of the Resurrection of the Dead (ምሥጢረ ትንሣኤ ሙታን) is the future event where all who are in the tombs will hear His voice and come forth. [B5]

Contract: `source_bound_claims_v3` mode=v3_prior_structured_pass partial=False abstained=False.
Unsupported-claim rate: 0.00. Citation precision: 1.00.

## 4. ሰላም፣ ስምህ ማን ነው?

### Before (v1)

ሰላም፣ እኔ የTewahedoDaily የትምህርት መተግበሪያ የፍለጋ ረዳት (Search Buddy) ነኝ። እኔ የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተክርስቲያን ትምህርቶችንና መመሪያዎችን መሠረት በማድረግ ለጥያቄዎችዎ መልስ ለመስጠት የተዘጋጀሁ የሰው ሰራሽ አስተውሎት (AI) ረዳት ነኝ።

Mechanical contract passed: True.

### After (v3)

ሰላም፣ እኔ የTewahedoDaily የትምህርት መተግበሪያ የፍለጋ ረዳት (Search Buddy) ነኝ። እኔ የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተክርስቲያን ትምህርቶችንና መመሪያዎችን መሠረት በማድረግ ለጥያቄዎችዎ መልስ ለመስጠት የተዘጋጀሁ የሰው ሰራሽ አስተውሎት (AI) ረዳት ነኝ።

Contract: `identity_no_retrieval` mode=v3_identity partial=False abstained=False.
Unsupported-claim rate: 0.00. Citation precision: 1.00.

## 5. ኢየሱስ ክርስቶስ ለምን ተጠመቀ?

### Before (v1)

REJECTED — no answer released by the contract.

Mechanical contract passed: False.

### After (v3)

ጌታችን ለትህትና፣ ለትምህርት እና ለአርአያ ተጠመቀ። [B1]

በዮርዳኖስ ወንዝ ተጥሎ የነበረውን የዕዳ ደብዳቤ ሊደመስስ ነው። [B1]

በእርሱ ጥምቀት የእኛን ጥምቀት ለመባረክ ነው። [B1]

አዳም የሠላሳ ዓለም ጎልማሳ ሆኖ ተፈጥሮ በኋላ በምክረ አጋንንት ተታሎ ያጣው ልጅነት ለመመለስ አዳምን መስሎ ዳግማዊ አዳም ሆኖ በሠላሳ ዘመነ ተጠመቀ። [B3]

Contract: `source_bound_partial_v3` mode=v3_recovered_attempt partial=True abstained=False.
Unsupported-claim rate: 0.00. Citation precision: 1.00.

## 6. አምስቱ ምሥጢራት ምንድን ናቸው?

### Before (v1)

ምሥጢረ ሥላሴ፡ አብ፣ ወልድ እና መንፈስ ቅዱስ በጊዜውም ሆነ በዘላለሙ አንድነት ያላቸውን መለኮታዊ ማንነትን የሚገልጽ ምሥጢር ነው። [B1]

ምሥጢረ ሥጋዌ፡ የእግዚአብሔር ልጅ በነፍሱ ፈቃድ ሰው በመሆን፣ መለኮትና ሰውነት ሳይቀላቀሉ፣ ሳይለዩ ወይም ሳይለዋወጡ በአንድነት የተዋሀዱበት ምሥጢር ነው። [B2]

ምሥጢረ ጥምቀት፡ በውኃና በመንፈስ በመጠመቅ ወደ እግዚአብሔር መንግሥት ለመግባት የሚያስችል ምሥጢር ሲሆን፣ ቤተክርስቲያንም እንደ ሕጉ ለወንድ ልጅ በ40 ቀን፣ ለሴት ልጅ ደግሞ በ80 ቀን ትጠምቃለች። [B3]

ምሥጢረ ቁርባን፡ የሚታየውን እንጀድና ወይን በመውሰድ የማይታየውን ሰማያዊ በረከትና የዘላለም ሕይወትን የምናገኝበት ምሥጢር ነው። [B4]

ምሥጢረ ትንሣኤ ሙታን፡ በትንሣኤ ቀን በሰማይ ያሉትንና በቁብር ያሉትን ሁሉ ወደ ሕይወት ወይም ወደ ፍርድ የሚሰነዘሩበት ምሥጢር ነው። [B5]

Mechanical contract passed: True.

### After (v3)

ምሥጢረ ሥላሴ፡ አብ፣ ወልድ እና መንፈስ ቅዱስ በጊዜውም ሆነ በዘላለሙ አንድነት ያላቸውን መለኮታዊ ማንነትን የሚገልጽ ምሥጢር ነው። [B1]

ምሥጢረ ሥጋዌ፡ የእግዚአብሔር ልጅ በነፍሱ ፈቃድ ሰው በመሆን፣ መለኮትና ሰውነት ሳይቀላቀሉ፣ ሳይለዩ ወይም ሳይለዋወጡ በአንድነት የተዋሀዱበት ምሥጢር ነው። [B2]

ምሥጢረ ጥምቀት፡ በውኃና በመንፈስ በመጠመቅ ወደ እግዚአብሔር መንግሥት ለመግባት የሚያስችል ምሥጢር ሲሆን፣ ቤተክርስቲያንም እንደ ሕጉ ለወንድ ልጅ በ40 ቀን፣ ለሴት ልጅ ደግሞ በ80 ቀን ትጠምቃለች። [B3]

ምሥጢረ ቁርባን፡ የሚታየውን እንጀድና ወይን በመውሰድ የማይታየውን ሰማያዊ በረከትና የዘላለም ሕይወትን የምናገኝበት ምሥጢር ነው። [B4]

Contract: `source_bound_partial_v3` mode=v3_recovered_prior partial=True abstained=False.
Unsupported-claim rate: 0.00. Citation precision: 1.00.

## Remaining blockers

1. **No fresh live Gemma 4 12B run** — `127.0.0.1:11439` refused connections. Offline v3 recovery used the same saved attempts/evidence/settings. Re-run `python scripts/compare_grounded_answers.py` when the local server is up (`live_gemma_v3.json` will be written).
2. **Human review still null** for theological accuracy, Amharic fluency, citation entailment, and answer relevance.
3. **Expanded set is provisional** — 43 source-linked questions with `human_reviewed=false`; not gold labels.
4. **F01 has no Amharic edition** — Amharic Five Mysteries answers stay cross-script / partial; native Amharic definitions are not available from Faith and Order alone.
5. **Gemma may still invent verse refs / bad terms** — v3 drops those claims and keeps supported ones; it does not certify residual paraphrases.
6. **Latency** — prior constrained median ~8.79s; live v3 latency not measured this run.
7. **Ops** — no production Qdrant, publish, push, approval-flag, or VM401 changes.

Private materials remain outside Pages (`content-review` stays in the original `tewahedo-ai` checkout / `CONTENT_REVIEW_ROOT`).
