"""Build a resumable, offline editorial proposal from manually reviewed full lyrics."""
from __future__ import annotations

import csv
import hashlib
import json
from collections import Counter
from pathlib import Path

BASE = Path('reports/mezmur-lyric-cleanup')
OUT = BASE / 'deep-classification'
SOURCE = BASE / 'mezmur_cleaned_classified.csv'
REVIEW = OUT / 'batch-001' / 'semantic_reviews.json'


def read_csv(path: Path) -> tuple[list[dict[str, str]], list[str]]:
    with path.open(encoding='utf-8-sig', newline='') as handle:
        reader = csv.DictReader(handle)
        return list(reader), list(reader.fieldnames or [])


def write_csv(name: str, headers: list[str], rows: list[dict[str, object]]) -> None:
    with (OUT / name).open('w', encoding='utf-8-sig', newline='') as handle:
        writer = csv.DictWriter(handle, fieldnames=headers, extrasaction='ignore')
        writer.writeheader()
        writer.writerows(rows)


source, source_fields = read_csv(SOURCE)
audit, _ = read_csv(BASE / 'mezmur_classification_audit.csv')
audit_by_id = {row['import_id']: row for row in audit}
manual, _ = read_csv(BASE / 'mezmur_manual_review.csv')
manual_by_id = {row['import_id']: row for row in manual}
hierarchy = json.loads((BASE / 'mezmur_category_hierarchy.json').read_text(encoding='utf-8'))
categories = {item['canonical']: item['slug'] for item in hierarchy['categories'] if item['existing']}
occasions = {item['canonical']: item['slug'] for item in hierarchy['occasions'] if item['existing']}
reviews = json.loads(REVIEW.read_text(encoding='utf-8'))
assert len(source) == len(audit) == 2531
assert len(reviews) == 25
assert len({row['import_id'] for row in source}) == 2531
assert len({review['import_id'] for review in reviews}) == len(reviews)
review_by_id = {}
for review in reviews:
    row = source[review['row']]
    assert row['import_id'] == review['import_id'], review['import_id']
    assert not row['category'].strip(), review['import_id']
    assert review['primary'] in categories, review['primary']
    assert review['confidence'] in ('high', 'medium', 'low')
    assert len(review['evidence']) >= 2
    lyric = '\n'.join(row[field] for field in ('lyrics_amharic', 'lyrics_geez', 'lyrics_transliteration', 'lyrics_english'))
    for quote in review['evidence']:
        assert quote and quote in lyric, (review['import_id'], quote)
    for secondary in review.get('secondary', []):
        assert secondary in categories
    for occasion in review.get('occasions', []):
        assert occasion in occasions
    review_by_id[review['import_id']] = review

proposal_fields = [
    'semantic_review_status', 'proposed_primary_category', 'proposed_primary_slug',
    'proposed_broad_category', 'proposed_subcategory', 'proposed_specific_subject',
    'proposed_secondary_categories', 'proposed_occasions', 'semantic_confidence',
    'semantic_reason', 'competing_categories', 'manual_review_flag',
]
master = []
primary = []
secondary = []
occasion_rows = []
evidence_rows = []
conflicts = []
review_queue = []
for index, row in enumerate(source):
    review = review_by_id.get(row['import_id'])
    extra = {field: '' for field in proposal_fields}
    if review:
        extra.update({
            'semantic_review_status': 'full_lyrics_reviewed',
            'proposed_primary_category': review['primary'],
            'proposed_primary_slug': categories[review['primary']],
            'proposed_broad_category': review['broad'],
            'proposed_subcategory': review['subcategory'],
            'proposed_specific_subject': review['subject'],
            'proposed_secondary_categories': '|'.join(review.get('secondary', [])),
            'proposed_occasions': '|'.join(review.get('occasions', [])),
            'semantic_confidence': review['confidence'],
            'semantic_reason': review['reason'],
            'competing_categories': '|'.join(review['competing']),
            'manual_review_flag': 'true',
        })
        primary.append({
            'source_row': index + 1, 'import_id': row['import_id'], 'title': row['title'],
            'current_category': row['category'], 'proposed_category': review['primary'],
            'proposed_slug': categories[review['primary']], 'broad_category': review['broad'],
            'subcategory': review['subcategory'], 'specific_subject': review['subject'],
            'confidence': review['confidence'], 'publication_status': row['status'],
            'manual_review_flag': 'true',
        })
        for item in review.get('secondary', []):
            secondary.append({'import_id': row['import_id'], 'category': item, 'slug': categories[item], 'reason': review['reason']})
        for item in review.get('occasions', []):
            occasion_rows.append({'import_id': row['import_id'], 'occasion': item, 'slug': occasions[item], 'reason': review['reason']})
        for excerpt_number, quote in enumerate(review['evidence'], 1):
            evidence_rows.append({'import_id': row['import_id'], 'excerpt_number': excerpt_number,
                                  'lyric_excerpt': quote, 'supports_category': review['primary'],
                                  'lyric_field': next(field for field in ('lyrics_amharic', 'lyrics_geez', 'lyrics_transliteration', 'lyrics_english') if quote in row[field])})
        old = audit_by_id[row['import_id']]['proposed_category']
        if old and old != review['primary']:
            conflicts.append({'import_id': row['import_id'], 'title': row['title'],
                              'conflict_type': 'earlier_automated_suggestion',
                              'current_approved_category': row['category'], 'earlier_suggestion': old,
                              'semantic_proposal': review['primary'], 'reason': review['reason'],
                              'lyric_evidence': ' | '.join(review['evidence'])})
        if row['category'] and row['category'] != review['primary']:
            conflicts.append({'import_id': row['import_id'], 'title': row['title'],
                              'conflict_type': 'existing_category', 'current_approved_category': row['category'],
                              'earlier_suggestion': old, 'semantic_proposal': review['primary'],
                              'reason': review['reason'], 'lyric_evidence': ' | '.join(review['evidence'])})
        review_queue.append({'priority': 'high' if row['status'] == 'published' or review['confidence'] != 'high' else 'medium',
                             'import_id': row['import_id'], 'title': row['title'],
                             'semantic_review_status': 'full_lyrics_reviewed',
                             'current_category': row['category'], 'proposed_category': review['primary'],
                             'confidence': review['confidence'], 'reason': review['reason']})
    elif row['import_id'] in manual_by_id:
        unresolved = not row['category'].strip()
        review_queue.append({'priority': 'medium' if unresolved else 'low', 'import_id': row['import_id'], 'title': row['title'],
                             'semantic_review_status': 'not_reviewed', 'current_category': row['category'],
                             'proposed_category': '', 'confidence': '',
                             'reason': 'Unresolved category; full lyrics not yet reviewed.' if unresolved else manual_by_id[row['import_id']]['reason']})
    master.append({**row, **extra})

review_queue.sort(key=lambda item: {'high': 0, 'medium': 1, 'low': 2}[item['priority']])

write_csv('mezmur_deep_classified.csv', source_fields + proposal_fields, master)
write_csv('mezmur_primary_categories.csv', ['source_row', 'import_id', 'title', 'current_category', 'proposed_category', 'proposed_slug', 'broad_category', 'subcategory', 'specific_subject', 'confidence', 'publication_status', 'manual_review_flag'], primary)
write_csv('mezmur_secondary_categories.csv', ['import_id', 'category', 'slug', 'reason'], secondary)
write_csv('mezmur_occasion_suggestions.csv', ['import_id', 'occasion', 'slug', 'reason'], occasion_rows)
write_csv('mezmur_classification_evidence.csv', ['import_id', 'excerpt_number', 'lyric_excerpt', 'supports_category', 'lyric_field'], evidence_rows)
write_csv('mezmur_conflicts.csv', ['import_id', 'title', 'conflict_type', 'current_approved_category', 'earlier_suggestion', 'semantic_proposal', 'reason', 'lyric_evidence'], conflicts)
write_csv('mezmur_manual_review_prioritized.csv', ['priority', 'import_id', 'title', 'semantic_review_status', 'current_category', 'proposed_category', 'confidence', 'reason'], review_queue)

coverage = {
    'total_retained': len(source), 'full_lyrics_semantically_reviewed': len(reviews),
    'not_semantically_reviewed': len(source) - len(reviews),
    'original_unresolved_categories': sum(not row['category'].strip() for row in source),
    'reviewed_unresolved_with_supported_proposal': len(primary),
    'remaining_unreviewed_unresolved': sum(not row['category'].strip() and row['import_id'] not in review_by_id for row in source),
    'proposed_primary_distribution': dict(Counter(row['proposed_category'] for row in primary)),
    'specific_named_subjects': sum(row['proposed_category'] in {'Kidus Uriel', 'Kidus Michael', 'Virgin Mary', 'Jesus Christ', 'Holy Trinity'} for row in primary),
    'secondary_proposals': len(secondary), 'occasion_suggestions': len(occasion_rows),
    'earlier_suggestion_disagreements': len(conflicts),
    'taxonomy_additions_for_review': sorted({review['proposed_taxonomy_addition'] for review in reviews if review.get('proposed_taxonomy_addition')}),
}
(OUT / 'mezmur_category_coverage.json').write_text(json.dumps(coverage, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
progress = {
    'source_sha256': hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
    'review_sha256': hashlib.sha256(REVIEW.read_bytes()).hexdigest(),
    'total_retained': len(source), 'semantic_completed': len(reviews),
    'remaining': len(source) - len(reviews), 'last_completed_batch': 'batch-001',
    'completed_batches': [{'batch_id': 'batch-001', 'count': len(reviews), 'source_rows': [review['row'] + 1 for review in reviews],
                           'import_ids': [review['import_id'] for review in reviews]}],
    'automated_candidates_are_semantic_reviews': False,
}
(OUT / 'classification_progress.json').write_text(json.dumps(progress, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')

report = f'''# Deep Mezmur classification, batch 001

This is an offline editorial proposal. No original category, occasion, lyric, ID, approval, or publication value was changed.

- Retained source records accounted for: {len(source):,}.
- Complete lyrics semantically reviewed in this batch: {len(reviews)}.
- Records awaiting semantic review: {len(source) - len(reviews):,}.
- Previously unresolved categories with a supported category proposal: {len(primary)}.
- Earlier automated category suggestions disputed after full lyric review: {len(conflicts)}.
- Secondary categories proposed: {len(secondary)}. No separate substantial evidence justified one in this batch.
- Occasions proposed: {len(occasion_rows)}. Hymn subject alone did not establish traditional use.
- Source lyric excerpts checked for literal presence: {len(evidence_rows)}.

The supported taxonomy has no dedicated Abba Kyros category. His hymn uses the supported **Saints** parent, with **Abba Kyros** recorded as the specific subject and as a proposed taxonomy addition for editorial consideration. Conceptual broad and subcategory labels are descriptive and are not database slugs.

The 25 reviewed records are published with empty existing category fields. Their current database-facing values remain blank in the master proposal; all suggested classifications require editorial approval. The earlier alias pass suggested **Angels** for a Marian hymn because the lyric calls Mary a sister of angels. Full-lyric review instead found Mary directly addressed through several biblical images.

The initial batch prioritizes unresolved categories with enough lyrics to support analysis. The unreviewed 2,506 records are explicitly marked `not_reviewed`; automated suggestions were not copied into the semantic proposal fields. Continue with a new batch of 25–50 unresolved records, review their complete lyrics, append new review entries, and regenerate the outputs. Preserve the source hash or audit any source revision before continuing.
'''
(OUT / 'deep_classification_report.md').write_text(report, encoding='utf-8')
print(json.dumps(coverage, ensure_ascii=False, indent=2))
