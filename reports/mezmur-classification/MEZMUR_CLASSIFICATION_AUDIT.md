# Deep Mezmur classification audit

- Accessible public snapshot analyzed: **1728** records.
- Records with non-empty lyrics: **1723**.
- Records with complete-length lyrics (>=120 normalized characters): **1542**.
- Supported primary categories from dominant lyric cues: **243**.
- Directly supported occasions: **23**.
- Classification-ready but identity unresolved: **55**.
- Genuine theological/editorial review: **1487**.
- Insufficient content: **186**.
- Verified production updates: **0**; public projection exposes no immutable import_id.

The first pass placed all rows in review because it conflated missing database identity with theological uncertainty. This pass separates those concerns. Identity remains unresolved until the authorized private export is supplied. Lyrics-only cues are evidence triage, not theological approval; title-only matches and corrupted index entries are never sufficient.
