# Mezmur grouping report

## Source verification

- Source rows: **2,092**
- Original columns preserved unchanged: **40**
- Unique immutable import IDs: **2,092**
- Published rows: **1,803**
- Draft rows: **289**
- Category relationships: **2,197**
- Occasion relationships: **1,996**
- Rows requiring classification review: **466**
- Duplicate Mezmur rows created: **0**

The completed classifications were reorganized only. Lyrics, titles, singers, media, dates, identifiers, and publication states were not reclassified or rewritten.

## Category cards

| Main card | All records | Published records |
| --- | ---: | ---: |
| Jesus Christ & Salvation | 466 | 416 |
| Virgin Mary | 517 | 431 |
| Holy Trinity & Holy Spirit | 67 | 59 |
| Angels & Saints | 388 | 307 |
| Prayer & Worship | 450 | 405 |
| Repentance | 166 | 154 |

## Occasion cards

| Main card | All records | Published records |
| --- | ---: | ---: |
| Holidays & Feasts | 214 | 176 |
| Fasting Seasons | 14 | 13 |
| Church Life & Sacraments | 74 | 57 |
| Anytime Mezmurs | 1672 | 1438 |

## Taxonomy coverage

- Canonical category mappings: **25 of 25**
- Canonical occasion mappings: **24 of 24**
- Unsupported category values in the source: **0**
- Unsupported occasion values in the source: **0**

All card and subcategory counts use distinct 'import_id' values. Multi-category and multi-occasion relationships remain separate rows. General / Anytime remains an ordinary occasion and does not imply a feast.

## Database and browse integration

The relationship exports match the existing UUID-keyed 'mezmur_category_links_import' and 'mezmur_occasion_links_import' model. The source database is already populated, so these files are reconciliation inputs rather than instructions to clear or replace existing links. The website mapping is implemented in 'src/lib/publicContent/mezmurBrowseGroups.ts' and consumed by the existing paginated public category and occasion queries.

No production SQL was executed.
