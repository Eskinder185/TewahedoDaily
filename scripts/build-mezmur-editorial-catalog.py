"""Build a private, offline CMS review fixture. Never writes source CSV or Supabase."""
import csv
import hashlib
import json
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'reports/mezmur-lyric-cleanup/mezmur_cleaned_classified.csv'
DEEP = ROOT / 'reports/mezmur-lyric-cleanup/deep-classification'
VERSION = ROOT / 'artifacts/mezmur-version-audit/0febda69e2cb/audit-index.json'
OUTPUT = ROOT / 'artifacts/mezmur-editorial-studio/catalog.json'

def rows(path):
    with path.open(encoding='utf-8-sig', newline='') as stream:
        return list(csv.DictReader(stream))

def main():
    source_hash = hashlib.sha256(SOURCE.read_bytes()).hexdigest()
    progress = json.loads((DEEP / 'classification_progress.json').read_text(encoding='utf-8'))
    assert source_hash == progress['source_sha256'], 'Source CSV changed; reconcile before building.'
    original = {row['import_id']: row for row in rows(SOURCE)}
    classified = rows(DEEP / 'mezmur_deep_classified.csv')
    assert len(original) == len(classified) == progress['total_retained'] == 2531
    assert set(original) == {row['import_id'] for row in classified}
    completed = {item for batch in progress['completed_batches'] for item in batch['import_ids']}
    assert len(completed) == progress['semantic_completed'] == 25
    evidence = defaultdict(list)
    for item in rows(DEEP / 'mezmur_classification_evidence.csv'):
        evidence[item['import_id']].append({'text': item['lyric_excerpt'], 'field': item['lyric_field']})
    conflicts = {item['import_id'] for item in rows(DEEP / 'mezmur_conflicts.csv')}
    duplicates = set()
    if VERSION.exists():
        version = json.loads(VERSION.read_text(encoding='utf-8'))
        if version['sourceSha256'] == source_hash:
            for proposal in version['proposals']:
                if proposal['relationship'] != 'distinct-hymn':
                    duplicates.update((proposal['leftImportId'], proposal['rightImportId']))
    catalog = []
    lyric_fields = ('lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_transliteration', 'lyrics_oromo')
    for row in classified:
        base = original[row['import_id']]
        assert all(row[key] == base[key] for key in lyric_fields), f"Original lyric changed: {row['import_id']}"
        semantic = row['semantic_review_status'] == 'full_lyrics_reviewed'
        assert semantic == (row['import_id'] in completed), f"Semantic progress mismatch: {row['import_id']}"
        snippets = evidence[row['import_id']]
        assert all(item['text'] in row[item['field']] for item in snippets), f"Nonliteral evidence: {row['import_id']}"
        lyrics = {key: row[key] for key in lyric_fields if row[key]}
        lyric_hash = hashlib.sha256(json.dumps(lyrics, ensure_ascii=False, sort_keys=True).encode('utf-8')).hexdigest()
        catalog.append({
            'importId': row['import_id'], 'sourceId': row['mezmur_id'], 'slug': row['slug'],
            'title': row['title'], 'titleAmharic': row['title_amharic'], 'titleEnglish': row['title_english'],
            'lyrics': lyrics, 'originalTextHash': lyric_hash, 'currentCategory': row['category'],
            'currentOccasion': row['primary_occasion'], 'reviewStatus': row['review_status'],
            'semanticReviewed': semantic, 'proposedCategorySlug': row['proposed_primary_slug'] if semantic else '',
            'proposedCategory': row['proposed_primary_category'] if semantic else '',
            'broadCategory': row['proposed_broad_category'] if semantic else '',
            'subcategory': row['proposed_subcategory'] if semantic else '',
            'specificSubject': row['proposed_specific_subject'] if semantic else '',
            'reason': row['semantic_reason'] if semantic else '',
            'competingCategories': row['competing_categories'] if semantic else '',
            'confidence': row['semantic_confidence'] if semantic else row['local_model_confidence'],
            'modelCategorySlug': row['local_model_slug'],
            'modelProvenance': row['local_model_provenance'],
            'modelEvidence': row['local_model_evidence'],
            'modelUncertain': row['local_model_uncertain'],
            'modelQualityFlags': row['local_model_quality_flags'],
            'evidence': snippets, 'conflict': row['import_id'] in conflicts,
            'possibleDuplicate': row['import_id'] in duplicates,
        })
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    payload = {'schema': 'mezmur-editorial-catalog-v1', 'sourceSha256': source_hash,
               'semanticCompleted': len(completed), 'rows': catalog}
    OUTPUT.write_text(json.dumps(payload, ensure_ascii=False, separators=(',', ':')) + '\n', encoding='utf-8')
    print(json.dumps({'output': str(OUTPUT), 'rows': len(catalog), 'semanticCompleted': len(completed),
                      'possibleDuplicateRows': len(duplicates), 'bytes': OUTPUT.stat().st_size}))

if __name__ == '__main__':
    main()
