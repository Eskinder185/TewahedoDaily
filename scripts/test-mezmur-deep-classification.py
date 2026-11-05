"""Independent invariants for the offline deep-classification proposal."""
import csv
import hashlib
import json
from pathlib import Path

base = Path('reports/mezmur-lyric-cleanup')
out = base / 'deep-classification'


def rows(path):
    with path.open(encoding='utf-8-sig', newline='') as handle:
        return list(csv.DictReader(handle))


source_path = base / 'mezmur_cleaned_classified.csv'
source = rows(source_path)
master = rows(out / 'mezmur_deep_classified.csv')
primary = rows(out / 'mezmur_primary_categories.csv')
evidence = rows(out / 'mezmur_classification_evidence.csv')
manual = rows(out / 'mezmur_manual_review_prioritized.csv')
progress = json.loads((out / 'classification_progress.json').read_text(encoding='utf-8'))
hierarchy = json.loads((base / 'mezmur_category_hierarchy.json').read_text(encoding='utf-8'))
supported = {item['canonical']: item['slug'] for item in hierarchy['categories'] if item['existing']}
assert len(source) == len(master) == 2531
assert len(primary) == progress['semantic_completed'] == 25
original_manual_ids = {row['import_id'] for row in rows(base / 'mezmur_manual_review.csv')}
assert len(manual) == len(original_manual_ids & {row['import_id'] for row in source}) == 1620
assert progress['remaining'] == 2506
assert progress['source_sha256'] == hashlib.sha256(source_path.read_bytes()).hexdigest()
assert len({row['import_id'] for row in master}) == 2531
for old, new in zip(source, master):
    assert all(new[key] == value for key, value in old.items()), old['import_id']
    assert new['semantic_review_status'] in ('not_reviewed', 'full_lyrics_reviewed')
assert sum(row['semantic_review_status'] == 'full_lyrics_reviewed' for row in master) == 25
assert sum(row['semantic_review_status'] == 'not_reviewed' for row in master) == 2506
by_id = {row['import_id']: row for row in source}
for item in primary:
    assert item['proposed_category'] in supported
    assert item['proposed_slug'] == supported[item['proposed_category']]
    assert item['current_category'] == by_id[item['import_id']]['category']
for item in evidence:
    assert item['lyric_excerpt'] in by_id[item['import_id']][item['lyric_field']]
assert len(evidence) == 50
assert len(rows(out / 'mezmur_secondary_categories.csv')) == 0
assert len(rows(out / 'mezmur_occasion_suggestions.csv')) == 0
assert len(rows(out / 'mezmur_conflicts.csv')) == 5
local = out / 'local-pipeline'
queue = [json.loads(line) for line in (local / 'classification_queue.jsonl').read_text(encoding='utf-8').splitlines()]
candidates = rows(local / 'automated_candidates.csv')
models = rows(local / 'model_proposals.csv')
local_review = rows(local / 'review_queue.csv')
verification = json.loads((local / 'verification.json').read_text(encoding='utf-8'))
summary = json.loads((local / 'preprocess_summary.json').read_text(encoding='utf-8'))
assert len(queue) == 2505
assert len(candidates) == 2506
assert len(local_review) == 2506
assert {row['import_id'] for row in local_review} == {row['import_id'] for row in candidates}
assert all(row['human_verified'] == 'false' and row['review_reason'] for row in local_review)
assert len({row['import_id'] for row in candidates}) == 2506
assert not ({row['import_id'] for row in candidates} & {row['import_id'] for row in primary})
assert summary['source_sha256'] == progress['source_sha256']
assert summary['retained_source_records'] == verification['source_records'] == 2531
assert summary['human_semantic_reviews_preserved'] == verification['human_semantic_reviews'] == 25
assert verification['unresolved_total'] == 2506 - verification['local_model_classification_proposals']
assert verification['local_model_proposal_records'] == len(models)
assert progress['local_pipeline']['human_verified_model_proposals'] == 0
assert progress['local_pipeline']['local_model_proposal_records'] == len(models)
assert {row['import_id'] for row in models} <= {row['import_id'] for row in candidates}
for row in models:
    assert row['human_verified'] == 'false' and row['review_kind'] == 'local_model_proposal'
    assert not row['primary_slug'] or row['primary_slug'] in supported.values()
    assert row['effective_confidence'] in ('high', 'medium', 'low')
    if row['primary_slug']:
        assert row['evidence']
    assert all(excerpt in '\n'.join(by_id[row['import_id']][field] for field in
               ('lyrics_amharic', 'lyrics_geez', 'lyrics_transliteration', 'lyrics_english', 'lyrics_oromo'))
               for excerpt in row['evidence'].split(' | ') if excerpt)
for old, new in zip(source, master):
    assert old['category'] == new['category'] and old['primary_occasion'] == new['primary_occasion']
    if new['semantic_review_status'] == 'not_reviewed':
        assert not new['proposed_primary_category']
print('Deep Mezmur batch 001: 2,531 source rows preserved, 25 semantic reviews and 50 literal excerpts verified.')
print(f'Local pipeline: {len(candidates)} candidate rows, {len(models)} model records, '
      f"{verification['unresolved_total']} unresolved; model evidence and taxonomy verified.")
