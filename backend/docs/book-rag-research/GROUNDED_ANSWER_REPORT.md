# Grounded answer improvements (evidence-first v2)

UNAPPROVED PRIVATE RESEARCH — not verified theology.
Automated contract pass ≠ theological correctness or Amharic fluency.

## Failure classification (from ANSWER_COMPARISONS.md)

### Why did Jesus choose to be baptized in the Jordan River?
- Primary cause: `unsupported_generation_invented_bible_refs`
- Retrieval: adequate — Jordan symbolism and baptism-reason passages retrieved
- Context: complete enough for traditional reasons; no verified Bible DB
- Prompt: insufficiently blocked invented chapter:verse forms
- Model: repeatedly invented Psalm 113:3 / Ezekiel-style numeric refs
- v1 result: contract REJECTED (no answer)

### ኢየሱስ ክርስቶስ ለምን ተጠመቀ?
- Primary cause: `model_terminology_amharic`
- Retrieval: adequate — Amharic baptism-reason chunks present
- Context: adequate
- Prompt: Trinity terminology stated but model ignored
- Model: used ሦስትነት instead of ሥላሴ
- v1 result: contract REJECTED (no answer)

### አምስቱ ምሥጢራት ምንድን ናቸው?
- Primary cause: `unsupported_generation_not_in_evidence`
- Retrieval: F01 English section routing OK; F01 has no Amharic edition
- Context: incomplete for native Amharic source wording
- Prompt: mechanical contract passed
- Model: added በሰማይ ያሉትን / heaven-style wording not in cited tombs passage
- v1 result: contract passed mechanically; unsupported claim remained

### At what time was Jesus Christ baptized?
- Primary cause: `handled`
- Retrieval: mixed relevance; age-thirty passage present
- Context: no clock time in sources
- Prompt: worked — insufficient_evidence path
- Model: mostly followed abstain-on-clock-time
- v1 result: contract passed with explicit limitation

## Mechanical metrics (same questions, evidence, recorded model settings)

| Metric | Before (v1 contract) | After (v2) |
| --- | --- | --- |
| Contract pass rate | 0.67 | 1.00 |
| Mean unsupported-claim rate | 0.37 | 0.00 |
| Mean citation precision | 0.67 | 1.00 |
| Abstentions | — | 3 |
| Prior Gemma constrained latency (median) | 8.79s | (offline v2 gate; live Gemma was down) |

Answer relevance and Amharic quality remain **null** pending human review.
Abstentions for Jordan why, Amharic baptism why, and Amharic Five Mysteries prefer
source-bound uncertainty over releasing unsupported heaven wording or invented verse refs.

## Before / after answers

## 1. At what time was Jesus Christ baptized?

### Before (v1)

The Bible does not specify a clock time of day for the baptism of Jesus Christ. [B2]

Tradition explains that Christ was baptized at the age of thirty years to resemble Adam, who was created as a mature man of thirty years. [B5]

Mechanical contract passed: True.
Unsupported-claim rate: 0.00.
Citation precision: 1.00.

### After (v2)

The Bible does not specify a clock time of day for the baptism of Jesus Christ. [B2]

Tradition explains that Christ was baptized at the age of thirty years to resemble Adam, who was created as a mature man of thirty years. [B5]

Contract: `source_bound_claims_v2` passed=True abstained=False mode=v2_prior_structured_pass.
Unsupported-claim rate: 0.00.
Citation precision: 1.00.

| Citation | Book | Paragraph IDs |
| --- | --- | --- |
| B1 | S01 | S01-P0185, S01-P0188, S01-P0189 |
| B2 | F01 | F01W-P0238, F01W-P0239, F01W-P0240, F01W-P0241, F01W-P0242, F01W-P0243 |
| B3 | F01 | F01W-P0221, F01W-P0223, F01W-P0225, F01W-P0226, F01W-P0228 |
| B4 | F01 | F01W-P0090 |
| B5 | M01 | M01-P0487, M01-P0488, M01-P0489, M01-P0491, M01-P0492, M01-P0493, M01-P0494 |

## 2. Why did Jesus choose to be baptized in the Jordan River?

### Before (v1)

REJECTED — no answer released by the contract.

Rejected: No verified Bible database verses were supplied; cite the book source only (`unsupported_generation_invented_bible_refs`)
Rejected: No verified Bible database verses were supplied; cite the book source only (`unsupported_generation_invented_bible_refs`)

Mechanical contract passed: False.
Unsupported-claim rate: 1.00.
Citation precision: 0.00.

### After (v2)

The supplied research passages do not fully establish a precise answer. Related source wording: "The Jordan has one source above, but farther down it divides around an island. The branch passing on the side of Israel is called Yor, and the branch on the side of the Gentiles is called Danos. They meet again farther downstream. The Jordan’s one source signifies the single origin of all humanity. Its division around" [B1]

Contract: `source_bound_abstention_v2` passed=True abstained=True mode=v2_abstention.
Unsupported-claim rate: 0.00.
Citation precision: 1.00.

| Citation | Book | Paragraph IDs |
| --- | --- | --- |
| B1 | S01 | S01-P0145, S01-P0146 |
| B2 | M01 | M01-P0475, M01-P0476 |
| B3 | S01 | S01-P0136, S01-P0137, S01-P0138, S01-P0140, S01-P0141, S01-P0142, S01-P0143, S01-P0144 |
| B4 | M01 | M01-P0497, M01-P0498, M01-P0499, M01-P0500, M01-P0501 |
| B5 | E01 | E01-P0178 |

## 3. What are the Five Mysteries?

### Before (v1)

The Mystery of the Trinity (ምሥጢረ ሥላሴ) is the eternal unity of the Father, Son, and Holy Spirit as one God in three distinct Persons. [B1]

The Mystery of the Incarnation (ምሥጢረ ሥጋዌ) is the unique event where God the Son united manhood to His Godhead without mixture, confusion, division, or separation. [B2]

The Mystery of Baptism (ምሥጢረ ጥምቀት) involves being born of water and the Spirit to enter the kingdom of God. [B3]

The Mystery of the Eucharist (ምሥጢረ ቁርባን) is the partaking of the visible bread and wine to attain invisible heavenly blessings and eternal life. [B4]

The Mystery of the Resurrection of the Dead (ምሥጢረ ትንሣኤ ሙታን) is the future event where all who are in the tombs will hear His voice and come forth. [B5]

Mechanical contract passed: True.
Unsupported-claim rate: 0.00.
Citation precision: 1.00.

### After (v2)

The Mystery of the Trinity (ምሥጢረ ሥላሴ) is the eternal unity of the Father, Son, and Holy Spirit as one God in three distinct Persons. [B1]

The Mystery of the Incarnation (ምሥጢረ ሥጋዌ) is the unique event where God the Son united manhood to His Godhead without mixture, confusion, division, or separation. [B2]

The Mystery of Baptism (ምሥጢረ ጥምቀት) involves being born of water and the Spirit to enter the kingdom of God. [B3]

The Mystery of the Eucharist (ምሥጢረ ቁርባን) is the partaking of the visible bread and wine to attain invisible heavenly blessings and eternal life. [B4]

The Mystery of the Resurrection of the Dead (ምሥጢረ ትንሣኤ ሙታን) is the future event where all who are in the tombs will hear His voice and come forth. [B5]

Contract: `source_bound_claims_v2` passed=True abstained=False mode=v2_prior_structured_pass.
Unsupported-claim rate: 0.00.
Citation precision: 1.00.

| Citation | Book | Paragraph IDs |
| --- | --- | --- |
| B1 | F01 | F01W-P0018 |
| B2 | F01 | F01W-P0059, F01W-P0060 |
| B3 | F01 | F01W-P0082, F01W-P0084, F01W-P0085 |
| B4 | F01 | F01W-P0097 |
| B5 | F01 | F01W-P0105, F01W-P0107, F01W-P0109 |

## 4. ሰላም፣ ስምህ ማን ነው?

### Before (v1)

ሰላም፣ እኔ የTewahedoDaily የትምህርት መተግበሪያ የፍለጋ ረዳት (Search Buddy) ነኝ። እኔ የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተክርስቲያን ትምህርቶችንና መመሪያዎችን መሠረት በማድረግ ለጥያቄዎችዎ መልስ ለመስጠት የተዘጋጀሁ የሰው ሰራሽ አስተውሎት (AI) ረዳት ነኝ።

Mechanical contract passed: True.
Unsupported-claim rate: 0.00.
Citation precision: 1.00.

### After (v2)

ሰላም፣ እኔ የTewahedoDaily የትምህርት መተግበሪያ የፍለጋ ረዳት (Search Buddy) ነኝ። እኔ የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተክርስቲያን ትምህርቶችንና መመሪያዎችን መሠረት በማድረግ ለጥያቄዎችዎ መልስ ለመስጠት የተዘጋጀሁ የሰው ሰራሽ አስተውሎት (AI) ረዳት ነኝ።

Contract: `identity_no_retrieval` passed=True abstained=False mode=v2_identity.
Unsupported-claim rate: 0.00.
Citation precision: 1.00.

## 5. ኢየሱስ ክርስቶስ ለምን ተጠመቀ?

### Before (v1)

REJECTED — no answer released by the contract.

Rejected: Use the established Trinity term ሥላሴ (`model_terminology_amharic`)
Rejected: Use the established Trinity term ሥላሴ (`model_terminology_amharic`)

Mechanical contract passed: False.
Unsupported-claim rate: 1.00.
Citation precision: 0.00.

### After (v2)

በቀረቡት የጥናት ምንጮች መሠረት፣ ጥያቄውን በቀጥታ የሚያረጋግጥ በቂ ግልጽ መግለጫ አልተገኘም። ተዛማጅ ምንጭ ቅንጭብ፦ «የጥምቀት አመሰራረት በሐዲስ ኪዳን ጥምቀትን ጌታችን በተግባር/ማቴ /፣ በትምህርት /ዮሐ /፣ በትዕዛዝ /ማቴ 28፡19 መሥርቶታል፡፡ ነገር ግን በምሥጢረ ጥምቀት ሙሉ ጸጋ የተሰጠው በበዓለ ሃምሳ መንፈስ ቅዱስ መውረድ ነው፡፡ የሐዋ 2፡1-5 ጌታ መቼ ተጠመቀ? የጌታ ጥምቀት ከእመቤታችን በተወለደ በሠላሳ ዘመነ በዘመነ ሉቃስ ጥር 1 ቀን ማክሰኞ ሌሊት 1 ሰዓት ነው። ጌታ ለምን ተጠመቀ? ሀ. ለትህትና ለትምህርት ለአርአያ ዮሐ» [B1]

Contract: `source_bound_abstention_v2` passed=True abstained=True mode=v2_abstention.
Unsupported-claim rate: 0.00.
Citation precision: 1.00.

| Citation | Book | Paragraph IDs |
| --- | --- | --- |
| B1 | S01 | S01-P0127, S01-P0128, S01-P0129, S01-P0130, S01-P0131, S01-P0132, S01-P0133, S01-P0134, S01-P0135, S01-P0136, S01-P0137 |
| B2 | S01 | S01-P0149, S01-P0150, S01-P0151, S01-P0152, S01-P0153 |
| B3 | M01 | M01-P0487, M01-P0488, M01-P0489, M01-P0491, M01-P0492, M01-P0493, M01-P0494 |
| B4 | S01 | S01-P0145, S01-P0146 |
| B5 | E01 | E01-P0178 |

## 6. አምስቱ ምሥጢራት ምንድን ናቸው?

### Before (v1)

ምሥጢረ ሥላሴ፡ አብ፣ ወልድ እና መንፈስ ቅዱስ በጊዜውም ሆነ በዘላለሙ አንድነት ያላቸውን መለኮታዊ ማንነትን የሚገልጽ ምሥጢር ነው። [B1]

ምሥጢረ ሥጋዌ፡ የእግዚአብሔር ልጅ በነፍሱ ፈቃድ ሰው በመሆን፣ መለኮትና ሰውነት ሳይቀላቀሉ፣ ሳይለዩ ወይም ሳይለዋወጡ በአንድነት የተዋሀዱበት ምሥጢር ነው። [B2]

ምሥጢረ ጥምቀት፡ በውኃና በመንፈስ በመጠመቅ ወደ እግዚአብሔር መንግሥት ለመግባት የሚያስችል ምሥጢር ሲሆን፣ ቤተክርስቲያንም እንደ ሕጉ ለወንድ ልጅ በ40 ቀን፣ ለሴት ልጅ ደግሞ በ80 ቀን ትጠምቃለች። [B3]

ምሥጢረ ቁርባን፡ የሚታየውን እንጀድና ወይን በመውሰድ የማይታየውን ሰማያዊ በረከትና የዘላለም ሕይወትን የምናገኝበት ምሥጢር ነው። [B4]

ምሥጢረ ትንሣኤ ሙታን፡ በትንሣኤ ቀን በሰማይ ያሉትንና በቁብር ያሉትን ሁሉ ወደ ሕይወት ወይም ወደ ፍርድ የሚሰነዘሩበት ምሥጢር ነው። [B5]

Mechanical contract passed: True.
Unsupported-claim rate: 0.20.
Citation precision: 1.00.

### After (v2)

በቀረቡት የጥናት ምንጮች መሠረት፣ ለዚህ ጥያቄ በአማርኛ የሚያረጋግጥ በቂ ግልጽ መግለጫ አልተገኘም። የእንግሊዝኛ ረቂቅ ምንጭ አለ፤ ትርጉም ወይም ያልተደገፈ መግለጫ አልፈጠርኩም። [B1]

Contract: `source_bound_abstention_v2` passed=True abstained=True mode=v2_abstention.
Unsupported-claim rate: 0.00.
Citation precision: 1.00.

| Citation | Book | Paragraph IDs |
| --- | --- | --- |
| B1 | F01 | F01W-P0018 |
| B2 | F01 | F01W-P0059, F01W-P0060 |
| B3 | F01 | F01W-P0082, F01W-P0084, F01W-P0085 |
| B4 | F01 | F01W-P0097 |
| B5 | F01 | F01W-P0105, F01W-P0107, F01W-P0109 |

## Human-review checkpoints

See `HUMAN_REVIEW_CHECKPOINTS.json`. Every case has pending checkpoints for:
theological accuracy, Amharic fluency, citation entailment, and answer relevance.

## Limits

- Live Gemma was not reachable on `127.0.0.1:11439` during this run; after answers use the
  v2 sanitize/validate/abstain pipeline on the same saved structured attempts and evidence.
- Source wording is preserved in abstentions; uncertainty is stated rather than inventing corrections.
- Faith and Order (F01) remains the designated English reference; five books stay private.
- No production Qdrant, publish, fine-tune, push, or VM401 deploy.
