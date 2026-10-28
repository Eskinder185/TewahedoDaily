# Faith and Order — Search Buddy retrieval tests

Run against a local PostgreSQL 16 + pgvector database built from the repository's own Church Library migrations (`20261024190000`, `20261024320000`, `20261026160000`, `20261027150000`), served through PostgREST 12 and queried with `@supabase/supabase-js` using an **anonymous** key, the same path as `src/lib/searchBuddy/churchLibrarySearch.ts`. Production was not contacted (it is not reachable from the build environment, and no production records were changed). Harness: `scripts/church-library/local-search-test/run.sh`.

## Summary

| Stage | Top result in the expected chapter | Hits are real indexed passages |
|---|---|---|
| 1. Current production RPC (`search_church_library` from 20261026160000) | 7/21 | 21/21 |
| 2. Proposed RPC, aliases loaded but still `pending` | 13/21 | 21/21 |
| 3. Proposed RPC, aliases approved | **21/21** | 21/21 |

RPC latency on the local database (47 passages, stage 3): median 10 ms, max 15 ms, including HTTP. Candidate selection uses the GIN index on `search_document` (plan below).

Why the current RPC fails most questions: it requires **every** word of the question to occur in one passage (`websearch_to_tsquery` with the `simple` config has no stop words, so “what”, “does”, “the” must match too) and the client sends `search_language = 'am'` for Amharic questions, which filters out every English passage.

“Grounded” means each of the top three hits was re-read from `church_library_passages` by id and its excerpt was found verbatim in the stored content (a query with no hits counts as grounded). Negative controls pass when nothing is returned, which is what lets Search Buddy say it lacks source evidence.

## Workflow and permission checks

| Check | Result |
|---|---|
| sha256 mismatch is refused | PASS |
| anonymous key cannot import (RLS) | PASS |
| import applied twice; replaced not duplicated | PASS |
| search_document populated by trigger | PASS |
| unreviewed book is not publicly searchable or readable | PASS |
| alias table not readable by anonymous visitors | PASS |
| disabling public retrieval hides passages immediately | PASS |

## Results with the proposed RPC and approved aliases

### PASS — What does the Ethiopian Orthodox Church teach about the Holy Trinity?
Expected: Holy Trinity · 3 hits · 9 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Mystery of the Holy Trinity | — | 2–3 | 2.087 | Father is different from the Son and the Holy Spirit only in that He alone is Father. The Son alone is Son, an… |
| 2 | The Mystery of the Holy Trinity | — | 1–2 | 1.924 | refused to accept the personal distinctions in the one Godhead and others who insisted that the three Persons … |
| 3 | The Mystery of the Holy Communion; what is Holy Communion? | — | 8–9 | 1.874 | protect themselves from sudden death and destruction. Based on this example, Jesus Christ, who is the Lamb of … |

### PASS — What is the mystery of the Incarnation?
Expected: Incarnation · 3 hits · 8 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Mystery of Incarnation | — | 3–5 | 1.844 | incarnation of God the Son is primarily for the salvation of the world. Salvation means the restoration of the… |
| 2 | The Mystery of Incarnation | — | 5–6 | 1.686 | came down through the will of His Father” and was made man. “His humanity was not inferior because He had no F… |
| 3 | The Mystery of Incarnation | — | 6–7 | 1.686 | Christ was absolutely real and perfect. But everywhere the emphasis is on the unity of Jesus Christ. It is aff… |

### PASS — What does the Church teach about Baptism?
Expected: Baptism · 8 hits · 10 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Sacrament of Baptism | Baptism of John the Baptist · Baptism by the Disciples before the Death of Christ · Institution of the Sacrament · The Visible Sign | 17–18 | 1.965 | Baptism of John the Baptist  Although it was from heaven yet it was “ the baptism of repentance for the remiss… |
| 2 | The Sacrament of Baptism | One Baptism · Baptism of Infants | 19–21 | 1.945 | Baptism  Our church teaches that those who have been validly baptized must not be baptized again. This is what… |
| 3 | The Mystery of Baptism | Few words from the Holy Scriptures that testify Baptism | 7–8 | 1.812 | unless one is born of water and the spirit he can not enter the kingdom of God”, the Ethiopian Orthodox Tewahe… |

### PASS — What is Holy Communion?
Expected: Holy Communion · 8 hits · 14 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Sacrament of the Holy Communion | The Holy Communion As a Sacrifice · Who has the Right to celebrate this? Sacrament · Who has the Right to Partake of the Holy Communion | 38–40 | 2.106 | Cross He offered a bloody sacrifice through shedding His blood, in the Holy Communion He offered an unbloody s… |
| 2 | The Sacrament of the Holy Communion | The Holy Communion As a Sacrifice | 36–38 | 2.043 | Holy Communion As a Sacrifice  We believe that this sacrament is an unbloody sacrifice offered for our salvati… |
| 3 | The Mystery of the Holy Communion; what is Holy Communion? | — | 8–9 | 1.983 | sacrament through which we are far off from the domination of sin and get nearer to attain communion with God.… |

### PASS — What are the seven sacraments?
Expected: Introduction to Church Sacraments · 8 hits · 10 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | Introduction to Church Sacraments | Number of Church Sacraments | 14–15 | 2.122 | Number of Church Sacraments  There are seven sacraments: baptism, confirmation, penance, Holy Communion, funct… |
| 2 | Introduction to Church Sacraments | Performance of Sacraments · Who has the right to perform Church Sacraments | 15–16 | 2.067 | Performance of Sacraments  Certain prayers are set for each sacrament to ask for the blessing of the Holy Ghos… |
| 3 | The Sacrament of the Unction of the Sick | Institution of the Sacrament · The Visible Sign · The Invisible Grace · Who has the Right to Celebrate the Sacrament? | 41–42 | 2 | Institution of the Sacrament.  This sacrament was instituted by the Lord Himself:  Because it was said of the … |

### PASS — ሥላሴ ምንድን ነው?
Expected: Holy Trinity · 6 hits · 10 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Mystery of the Holy Trinity | — | 2–3 | 1.1 | Spirit alone dwells in us and makes God known to us. So the priest who celebrates the Anaphora of St. John say… |
| 2 | The Mystery of the Holy Trinity | — | 1–2 | 1.074 | solitary condition, but in that of an all-inclusive perfection. So the one is also eternally three. He is, aff… |
| 3 | The Mystery of Incarnation | — | 3–5 | 0.831 | Himself the manhood taken from the human mother and was born as perfect God and perfect man in the real sense.… |

### PASS — ቁርባን ምንድን ነው?
Expected: Holy Communion · 8 hits · 11 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Sacrament of the Holy Communion | The Holy Communion As a Sacrifice | 36–38 | 1.165 | Holy Communion As a Sacrifice  We believe that this sacrament is an unbloody sacrifice offered for our salvati… |
| 2 | The Sacrament of the Holy Communion | The Holy Communion As a Sacrifice · Who has the Right to celebrate this? Sacrament · Who has the Right to Partake of the Holy Communion | 38–40 | 1.165 | Cross He offered a bloody sacrifice through shedding His blood, in the Holy Communion He offered an unbloody s… |
| 3 | The Mystery of the Holy Communion; what is Holy Communion? | — | 8–9 | 1.1 | other hand, a better hope is introduced, through which we draw near to God,” (Heb. 7:19)  The Preparation and … |

### PASS — ሥጋዌ ምን ማለት ነው?
Expected: Incarnation · 7 hits · 10 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Mystery of Incarnation | — | 3–5 | 1.124 | incarnation of God the Son is primarily for the salvation of the world. Salvation means the restoration of the… |
| 2 | The Mystery of Incarnation | — | 5–6 | 0.933 | Regarding the Person of Jesus Christ also there have been serious discussions in Ethiopia. But the Church hold… |
| 3 | The Mystery of Incarnation | — | 6–7 | 0.933 | numerous to be reproduced or even noted in the present context. They show that Jesus Christ was at once God an… |

### PASS — ስላሴ
Expected: Holy Trinity · 6 hits · 9 ms · homophone spelling ስ for ሥ

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Mystery of the Holy Trinity | — | 2–3 | 1.1 | Spirit alone dwells in us and makes God known to us. So the priest who celebrates the Anaphora of St. John say… |
| 2 | The Mystery of the Holy Trinity | — | 1–2 | 1.074 | solitary condition, but in that of an all-inclusive perfection. So the one is also eternally three. He is, aff… |
| 3 | The Mystery of Incarnation | — | 3–5 | 0.831 | Himself the manhood taken from the human mother and was born as perfect God and perfect man in the real sense.… |

### PASS — ስለ ጥምቀት አስረዳኝ
Expected: Baptism · 8 hits · 14 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Sacrament of Baptism | Baptism of John the Baptist · Baptism by the Disciples before the Death of Christ · Institution of the Sacrament · The Visible Sign | 17–18 | 1.322 | Baptism of John the Baptist  Although it was from heaven yet it was “ the baptism of repentance for the remiss… |
| 2 | The Sacrament of Baptism | One Baptism · Baptism of Infants | 19–21 | 1.267 | Baptism  Our church teaches that those who have been validly baptized must not be baptized again. This is what… |
| 3 | The Sacrament of Baptism | Baptism of Blood · Who has the Right to Baptize · Obligations of the Baptized | 21 | 1.165 | Baptism of Blood  Martyrs who shed their blood for the sake of Christ before being baptized are considered to … |

### PASS — ንስሐ ምንድን ነው?
Expected: Penance · 8 hits · 10 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Sacrament of Penance | The Outward Sign | 25 | 1.074 | Outward Sign  There are two audible sings in this sacrament:  The confession of the penitent to the priest, Tr… |
| 2 | The Sacrament of Baptism | Baptism of Blood · Who has the Right to Baptize · Obligations of the Baptized | 21 | 0.933 | Holy Ghost.” (Matt. 28:19). Then it was given to bishops, and afterwards to the priests.  Obligations of the B… |
| 3 | The Sacrament of Penance | Definition · The Institution of the Sacrament | 24–25 | 0.831 | Jacob, Moses, David, etc. in the Old Testament, Peter, John, etc in the New Testament-all these committed sin,… |

### PASS — ትንሳኤ ሙታን
Expected: Resurrection · 8 hits · 11 ms · homophone spelling ሳ for ሣ

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Mystery of Resurrection | Supporting Scriptural Words Concerning the Resurrection | 10 | 1.277 | marvel at this; for the hour is coming when all who are in the combs will hear His voice and come forth, those… |
| 2 | Human Salvation | — | 12 | 0.831 | human society is of divine creation, so that the social, economic, political and other such ties of man are di… |
| 3 | A Word in Conclusion | — | 13 | 0.831 | space has created the world in time and space. He has redeemed the world and continues His work of perfecting … |

### PASS — What is Kidist Selassie?
Expected: Holy Trinity · 6 hits · 10 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Mystery of the Holy Trinity | — | 2–3 | 1.1 | Spirit alone dwells in us and makes God known to us. So the priest who celebrates the Anaphora of St. John say… |
| 2 | The Mystery of the Holy Trinity | — | 1–2 | 1.074 | solitary condition, but in that of an all-inclusive perfection. So the one is also eternally three. He is, aff… |
| 3 | The Mystery of Incarnation | — | 3–5 | 0.831 | Himself the manhood taken from the human mother and was born as perfect God and perfect man in the real sense.… |

### PASS — Why does the church baptize infants after 40 and 80 days?
Expected: Baptism · 1 hits · 8 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Mystery of Baptism | Few words from the Holy Scriptures that testify Baptism | 7–8 | 1.489 | believes and is baptized will be saved; but he who does not believe will be condemned.” (Mk. 16:6). Truly, tru… |

### PASS — Who has the right to perform the sacraments?
Expected: Church Sacraments|Holy Orders · 8 hits · 12 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | Introduction to Church Sacraments | Performance of Sacraments · Who has the right to perform Church Sacraments | 15–16 | 2.167 | Performance of Sacraments  Certain prayers are set for each sacrament to ask for the blessing of the Holy Ghos… |
| 2 | The Sacrament of the Holy Orders | The invisible Grace · Degrees of the Holy Orders | 47–49 | 2 | gift of God, which is in thee by the putting on of my hands.” (2 Tim. 1: 6) This gift is given by the Holy Gho… |
| 3 | The Sacrament of Matrimony | The Invisible Grace · Obligations of the Husband & Wife · Who has the Right to Celebrate the Sacrament | 44–45 | 1.945 | Invisible Grace.  The function of this sacrament is:  To sanctify the matrimonial union and make it a spiritua… |

### PASS — Is the Holy Communion a sacrifice?
Expected: Holy Communion · 8 hits · 11 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Sacrament of the Holy Communion | The Holy Communion As a Sacrifice | 36–38 | 2.208 | Holy Communion As a Sacrifice  We believe that this sacrament is an unbloody sacrifice offered for our salvati… |
| 2 | The Sacrament of the Holy Communion | The Holy Communion As a Sacrifice · Who has the Right to celebrate this? Sacrament · Who has the Right to Partake of the Holy Communion | 38–40 | 2.144 | Cross He offered a bloody sacrifice through shedding His blood, in the Holy Communion He offered an unbloody s… |
| 3 | The Mystery of the Holy Communion; what is Holy Communion? | — | 8–9 | 2.043 | sacrament through which we are far off from the domination of sin and get nearer to attain communion with God.… |

### PASS — one incarnate nature Chalcedon
Expected: Incarnation · 3 hits · 15 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Mystery of Incarnation | — | 6–7 | 1.983 | numerous to be reproduced or even noted in the present context. They show that Jesus Christ was at once God an… |
| 2 | The Mystery of Incarnation | — | 3–5 | 1.805 | incarnation of God the Son is primarily for the salvation of the world. Salvation means the restoration of the… |
| 3 | The Mystery of Incarnation | — | 5–6 | 1.562 | Regarding the Person of Jesus Christ also there have been serious discussions in Ethiopia. But the Church hold… |

### PASS — What is the unction of the sick?
Expected: Unction · 2 hits · 9 ms

| # | Chapter | Section | Pages | Score | Excerpt (start) |
|---|---|---|---|---|---|
| 1 | The Sacrament of the Unction of the Sick | Definition | 40–41 | 1.924 | Definition  Function of the sick is the sacrament through which the priest anoints the body of the sick, askin… |
| 2 | The Sacrament of the Unction of the Sick | Institution of the Sacrament · The Visible Sign · The Invisible Grace · Who has the Right to Celebrate the Sacrament? | 41–42 | 1.874 | Institution of the Sacrament.  This sacrament was instituted by the Lord Himself:  Because it was said of the … |

### PASS — Who won the 2022 World Cup?
Expected: no results (not covered by the book) · 0 hits · 6 ms

No passage returned → Search Buddy shows the “no indexed passage” notice and the AI is told not to cite the library.

### PASS — What does the Church teach about cryptocurrency investing?
Expected: no results (not covered by the book) · 0 hits · 6 ms

No passage returned → Search Buddy shows the “no indexed passage” notice and the AI is told not to cite the library.

### PASS — Tell me about Saint Yared and his hymns
Expected: no results (not covered by the book) · 0 hits · 5 ms

No passage returned → Search Buddy shows the “no indexed passage” notice and the AI is told not to cite the library.

## Stage comparison per question

| Question | Current RPC | Proposed, aliases pending | Proposed, aliases approved |
|---|---|---|---|
| What does the Ethiopian Orthodox Church teach about the Holy Trinity? | FAIL (0) | PASS (3) | PASS (3) |
| What is the mystery of the Incarnation? | FAIL (0) | PASS (3) | PASS (3) |
| What does the Church teach about Baptism? | FAIL (0) | PASS (8) | PASS (8) |
| What is Holy Communion? | PASS (5) | PASS (8) | PASS (8) |
| What are the seven sacraments? | PASS (1) | PASS (8) | PASS (8) |
| ሥላሴ ምንድን ነው? | FAIL (0) | FAIL (0) | PASS (6) |
| ቁርባን ምንድን ነው? | FAIL (0) | FAIL (0) | PASS (8) |
| ሥጋዌ ምን ማለት ነው? | FAIL (0) | FAIL (0) | PASS (7) |
| ስላሴ | FAIL (0) | FAIL (0) | PASS (6) |
| ስለ ጥምቀት አስረዳኝ | FAIL (0) | FAIL (0) | PASS (8) |
| ንስሐ ምንድን ነው? | FAIL (0) | FAIL (0) | PASS (8) |
| ትንሳኤ ሙታን | FAIL (0) | FAIL (0) | PASS (8) |
| What is Kidist Selassie? | FAIL (0) | FAIL (0) | PASS (6) |
| Why does the church baptize infants after 40 and 80 days? | FAIL (0) | PASS (1) | PASS (1) |
| Who has the right to perform the sacraments? | PASS (2) | PASS (8) | PASS (8) |
| Is the Holy Communion a sacrifice? | PASS (4) | PASS (8) | PASS (8) |
| one incarnate nature Chalcedon | FAIL (0) | PASS (3) | PASS (3) |
| What is the unction of the sick? | FAIL (0) | PASS (2) | PASS (2) |
| Who won the 2022 World Cup? | PASS (0) | PASS (0) | PASS (0) |
| What does the Church teach about cryptocurrency investing? | PASS (0) | PASS (0) | PASS (0) |
| Tell me about Saint Yared and his hymns | PASS (0) | PASS (0) | PASS (0) |

## Index use

```
SET
Bitmap Heap Scan on church_library_passages  (cost=284.87..297.56 rows=8 width=16)
  Recheck Cond: (search_document @@ '''trinity'':* | ''godhead'':*'::tsquery)
  ->  Bitmap Index Scan on church_library_passages_search_document_gin  (cost=0.00..284.87 rows=8 width=0)
        Index Cond: (search_document @@ '''trinity'':* | ''godhead'':*'::tsquery)
```

## Not covered here

- The AI-written answer itself: the model gateway is not reachable from the build environment. The grounding code that feeds these passages to the model is unit-tested in `backend/tests/test_church_library_grounding.py`.
- Semantic (pgvector) ranking: no embeddings were generated, so `semantic_rank` is 0 and ranking is keyword + alias only.
