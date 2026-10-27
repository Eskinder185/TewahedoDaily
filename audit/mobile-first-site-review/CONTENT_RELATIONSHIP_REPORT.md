# CONTENT QUALITY & INTERCONNECTED RELATIONSHIP REPORT

## 1. Relational Knowledge Graph Audit

TewahedoDaily is designed as an interconnected liturgical knowledge system connecting:
`Date ↔ Feast ↔ Saint ↔ Scripture ↔ Prayer ↔ Mezmur`

---

## 2. Integrity Status of Core Relationships

| Knowledge Connection | Audit Finding | Status |
|---|---|:---:|
| **Date ↔ Feast & Saint** | Daily calendar queries accurately associate Ethiopian dates with Synaxarium saints and feasts. | **VERIFIED** |
| **Date ↔ Daily Scripture** | Daily readings link to the Bible book and chapter. | **VERIFIED** |
| **Date ↔ Prayer** | Morning, midday, and evening prayer recommendations correlate with seasonal rhythms. | **VERIFIED** |
| **Mezmur ↔ Category** | Category cards load published Mezmurs (e.g. Kidus Michael: 32 Mezmurs, Jesus Christ: 274 Mezmurs). | **VERIFIED** |
| **Mezmur ↔ Occasion** | Occasion cards load published Mezmurs (e.g. Gena: 67 Mezmurs, Communion: 2 Mezmurs). | **VERIFIED** |
| **Mezmur ↔ Zemari Attribution** | Zemari name and YouTube links display on Mezmur cards and lyrics reader. | **VERIFIED** |
| **Search Buddy ↔ Synaxarium** | Search queries for saints (e.g., "Saint Michael") return corresponding Synaxarium commemorations. | **VERIFIED** |
| **Search Buddy ↔ Church Library Passages** | Disabled pending VM401 backend router update and minimal Supabase schema migration. | **BLOCKED** |

---

## 3. Discovered Relationship Disconnects

1. **Zemari Counts View Privilege:**
   - Anonymous users querying `zemaris_with_counts` receive HTTP 401 (`42501 permission denied`).
   - Although `getHymnSingers` contains fallback code to read `public.zemaris`, granting `SELECT` on `zemaris_with_counts` to `anon` will eliminate error logs and ensure count synchronization.
2. **Church Library Integration Gate:**
   - Church Library passages remain unlinked to public search until the minimal upload repair SQL is applied and the backend router is deployed on VM401.
