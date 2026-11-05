# Deep Mezmur classification, batch 001

This is an offline editorial proposal. No original category, occasion, lyric, ID, approval, or publication value was changed.

- Retained source records accounted for: 2,531.
- Complete lyrics semantically reviewed in this batch: 25.
- Records awaiting semantic review: 2,506.
- Retained records in the prior manual-review queue: 1,620. The prior queue's other 22 IDs are outside the 2,531 retained source rows.
- Previously unresolved categories with a supported category proposal: 25.
- Reviewed records with a named person or divine subject in the supported category: 17.
- Unreviewed records whose current category remains unresolved: 838.
- Earlier automated category suggestions disputed after full lyric review: 5.
- Secondary categories proposed: 0. No separate substantial evidence justified one in this batch.
- Occasions proposed: 0. Hymn subject alone did not establish traditional use.
- Source lyric excerpts checked for literal presence: 50.

The supported taxonomy has no dedicated Abba Kyros category. His hymn uses the supported **Saints** parent, with **Abba Kyros** recorded as the specific subject and as a proposed taxonomy addition for editorial consideration. Conceptual broad and subcategory labels are descriptive and are not database slugs.

The 25 reviewed records are published with empty existing category fields. Their current database-facing values remain blank in the master proposal; all suggested classifications require editorial approval. The earlier alias pass suggested **Angels** for a Marian hymn because the lyric calls Mary a sister of angels. Full-lyric review instead found Mary directly addressed through several biblical images.

The initial batch prioritizes unresolved categories with enough lyrics to support analysis. The 2,506 records without human semantic review remain marked `not_reviewed`; automated suggestions were not copied into the semantic proposal fields. Continue local processing with `python scripts/mezmur-local-classification.py run --max-packs 40`, then run `verify` and rebuild this report. Preserve the source hash or audit any source revision before continuing.


## Local batch pipeline

- Unreviewed records preprocessed: 2,506; strong lexical candidates: 827. These are automated suggestions, not semantic reviews.
- Distinct original-lyric groups: 2,505; exact duplicate members: 1. Near-duplicate similarity is a review hint only.
- Reused exact-duplicate classifications: 0; reused near-duplicate classifications: 0.
- Local Ollama records: 262; supported classification proposals: 228; unresolved hymns: 2,278. Human-verified model proposals: 0.
- Local model requests: 109; measured prompt tokens: 219,007; measured output tokens: 61,432.
- Effective model-proposal confidence: {'medium': 133, 'low': 55, 'high': 74}.
- Model/current-category conflicts: 0; groups with failed validation: 34.
- Next local checkpoint: `92e40fd8fbb76c6f4cd953ec2494190431740fa73cf7facaf01217b3bdc1809f`.

Model proposals have separate provenance and require editorial review. Existing category and occasion values remain intact. Similar lyrics never authorize category reuse without a validated result for the actual record.
