"""Offline, resumable Mezmur candidate queue and optional Ollama review.

Usage: python scripts/mezmur-local-classification.py prepare
       python scripts/mezmur-local-classification.py run --max-packs 4
       python scripts/mezmur-local-classification.py verify
"""
from __future__ import annotations

import argparse
import csv
import difflib
import hashlib
import json
import os
import re
import time
import unicodedata
import urllib.request
from collections import Counter, defaultdict
from pathlib import Path

BASE = Path('reports/mezmur-lyric-cleanup')
OUT = BASE / 'deep-classification'
LOCAL = OUT / 'local-pipeline'
CACHE = LOCAL / 'model-cache'
RAW = LOCAL / 'raw-responses'
SOURCE = BASE / 'mezmur_cleaned_classified.csv'
FIELDS = ('lyrics_amharic', 'lyrics_geez', 'lyrics_transliteration', 'lyrics_english', 'lyrics_oromo')
MODEL = 'qwen3.5:9b'
VERSION = 'local-classification-v1'
MAX_FULL_LYRIC_CHARS = 12000  # Conservative limit for the configured 8192-token model context.


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding='utf-8-sig', newline='') as file:
        return list(csv.DictReader(file))


def write_csv(path: Path, fields: list[str], rows: list[dict]) -> None:
    with path.open('w', encoding='utf-8-sig', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=fields, extrasaction='ignore')
        writer.writeheader()
        writer.writerows(rows)


def atomic_json(path: Path, value: object) -> None:
    temp = path.with_suffix(path.suffix + '.tmp')
    temp.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    temp.replace(path)


def source_lyrics(row: dict[str, str]) -> str:
    return '\n'.join(f'{field}:\n{row[field]}' for field in FIELDS if row[field].strip())


def original_lyric_hash(row: dict[str, str]) -> str:
    return digest(json.dumps([row[field] for field in FIELDS], ensure_ascii=False, separators=(',', ':')).encode())


def normalize(text: str) -> str:
    """Comparison only. Never write this value back into a lyric field."""
    text = unicodedata.normalize('NFKC', text).casefold()
    text = re.sub(r'[/\\][0-9፩-፲]+[/\\]|\([0-9]+\)', ' ', text)
    text = ''.join(char if char.isalnum() else ' ' for char in text)
    return ' '.join(text.split())


def grams(text: str) -> set[str]:
    value = text.replace(' ', '')
    return {value[index:index + 5] for index in range(max(0, len(value) - 4))}


def simhash(tokens: set[str]) -> int:
    vector = [0] * 64
    for token in tokens:
        value = int.from_bytes(hashlib.blake2b(token.encode(), digest_size=8).digest(), 'big')
        for index in range(64):
            vector[index] += 1 if value & (1 << index) else -1
    return sum(1 << index for index, score in enumerate(vector) if score > 0)


def taxonomy_version() -> str:
    return digest((BASE / 'mezmur_category_hierarchy.json').read_bytes() + (BASE / 'mezmur_category_aliases.json').read_bytes())


def catalogs() -> tuple[dict[str, str], list[dict]]:
    hierarchy = json.loads((BASE / 'mezmur_category_hierarchy.json').read_text(encoding='utf-8'))
    categories = {item['slug']: item['canonical'] for item in hierarchy['categories'] if item['existing']}
    aliases = json.loads((BASE / 'mezmur_category_aliases.json').read_text(encoding='utf-8'))['aliases']
    return categories, [item for item in aliases if item['kind'] == 'category' and
                        item['slug'] in categories and not item['ambiguous'] and not item['search_only'] and
                        int(item['strength']) >= 4 and len(normalize(item['alias'])) >= 4]


def candidate_rank(row: dict[str, str], aliases: list[dict], categories: dict[str, str]) -> tuple[list[dict], str]:
    lyrics = source_lyrics(row)
    normalized = normalize(lyrics)
    scores: dict[str, float] = defaultdict(float)
    hits: dict[str, list[str]] = defaultdict(list)
    for item in aliases:
        alias = normalize(item['alias'])
        count = normalized.count(alias)
        if not count:
            continue
        slug = item['slug']
        scores[slug] += min(count, 3) * int(item['strength'])
        if len(hits[slug]) < 4:
            for line in lyrics.splitlines():
                if len(hits[slug]) >= 4:
                    break
                if len(line.strip()) >= 12 and alias in normalize(line) and line.strip() not in hits[slug]:
                    hits[slug].append(line.strip()[:240])
    ranked = [{'slug': slug, 'category': categories[slug], 'score': round(score, 1), 'excerpts': hits[slug][:2]}
              for slug, score in sorted(scores.items(), key=lambda pair: (-pair[1], pair[0]))[:3]]
    tier = 'ambiguous'
    if ranked and ranked[0]['score'] >= 15 and len(ranked[0]['excerpts']) >= 2 and (len(ranked) == 1 or ranked[0]['score'] >= ranked[1]['score'] * 1.7):
        tier = 'strong_automated_candidate'
    return ranked, tier


def build_preprocess() -> dict:
    LOCAL.mkdir(parents=True, exist_ok=True)
    CACHE.mkdir(exist_ok=True)
    source = read_csv(SOURCE)
    reviewed = json.loads((OUT / 'classification_progress.json').read_text(encoding='utf-8'))['completed_batches']
    completed = {item for batch in reviewed for item in batch['import_ids']}
    assert len(source) == 2531 and len(completed) == 25
    assert len({row['import_id'] for row in source}) == len(source)
    source_by_id = {row['import_id']: row for row in source}
    categories, aliases = catalogs()
    groups: dict[str, dict] = {}
    for index, row in enumerate(source):
        if row['import_id'] in completed:
            continue
        key = original_lyric_hash(row)
        if key not in groups:
            groups[key] = {'original_lyric_hash': key, 'representative_id': row['import_id'],
                           'source_row': index + 1, 'lyrics': source_lyrics(row), 'member_ids': [],
                           'normalized_hash': digest(normalize(source_lyrics(row)).encode()),
                           'current_category': row['category'], 'current_occasion': row['primary_occasion'],
                           'approved_category': row['category'] if row['publication_approved_at'] else '',
                           'title': row['title']}
        groups[key]['member_ids'].append(row['import_id'])
    ordered = sorted(groups.values(), key=lambda group: group['source_row'])
    for group in ordered:
        row = source[group['source_row'] - 1]
        ranked, tier = candidate_rank(row, aliases, categories)
        group['ranked_candidates'] = ranked
        group['candidate_tier'] = tier
        group['near_cluster'] = ''
    # SimHash only nominates close pairs. A second full comparison gates the cluster.
    buckets: dict[tuple[int, int], list[int]] = defaultdict(list)
    token_sets = [grams(normalize(group['lyrics'])) for group in ordered]
    hashes = [simhash(tokens) for tokens in token_sets]
    parent = list(range(len(ordered)))

    def root(index: int) -> int:
        while parent[index] != index:
            parent[index] = parent[parent[index]]
            index = parent[index]
        return index

    near_pairs = 0
    for index, group in enumerate(ordered):
        if len(group['lyrics']) < 120:
            continue
        value = hashes[index]
        possible = set()
        for band in range(4):
            possible.update(buckets[(band, (value >> (band * 16)) & 0xffff)])
        for other in possible:
            if len(ordered[other]['lyrics']) < 120:
                continue
            left, right = token_sets[index], token_sets[other]
            if min(len(left), len(right)) / max(len(left), len(right)) < .82:
                continue
            if len(left & right) / len(left | right) < .88:
                continue
            if difflib.SequenceMatcher(None, normalize(group['lyrics']), normalize(ordered[other]['lyrics']), autojunk=False).ratio() < .93:
                continue
            parent[root(index)] = root(other)
            near_pairs += 1
        for band in range(4):
            buckets[(band, (value >> (band * 16)) & 0xffff)].append(index)
    for index, group in enumerate(ordered):
        cluster = root(index)
        group['near_cluster'] = ordered[cluster]['original_lyric_hash'] if cluster != index else ''
    queue = sorted(ordered, key=lambda group: (bool(group['current_category']), group['source_row']))
    with (LOCAL / 'classification_queue.jsonl').open('w', encoding='utf-8') as file:
        for group in queue:
            file.write(json.dumps(group, ensure_ascii=False) + '\n')
    candidate_rows = []
    for group in queue:
        for member in group['member_ids']:
            top = group['ranked_candidates'][0] if group['ranked_candidates'] else {}
            candidate_rows.append({'import_id': member, 'original_lyric_hash': group['original_lyric_hash'],
                                   'representative_id': group['representative_id'], 'near_cluster': group['near_cluster'],
                                   'candidate_status': group['candidate_tier'] if top else 'no_lexical_candidate',
                                   'candidate_slug': top.get('slug', ''), 'candidate_score': top.get('score', ''),
                                   'candidate_evidence': ' | '.join(top.get('excerpts', [])),
                                   'current_category_preserved': source_by_id[member]['category'],
                                   'semantic_review_status': 'not_reviewed'})
    write_csv(LOCAL / 'automated_candidates.csv', list(candidate_rows[0]), candidate_rows)
    summary = {'source_sha256': digest(SOURCE.read_bytes()), 'taxonomy_sha256': taxonomy_version(),
               'retained_source_records': len(source), 'human_semantic_reviews_preserved': len(completed),
               'remaining_records': len(source) - len(completed), 'unique_original_lyric_groups': len(queue),
               'exact_duplicate_members_reusable_after_validation': sum(len(group['member_ids']) - 1 for group in queue),
               'near_duplicate_pairs_for_review_only': near_pairs,
               'strong_automated_candidates': sum(row['candidate_status'] == 'strong_automated_candidate' for row in candidate_rows),
               'ambiguous_or_no_lexical_candidates': sum(row['candidate_status'] != 'strong_automated_candidate' for row in candidate_rows),
               'model': MODEL, 'checkpoint': 'classification_queue.jsonl'}
    atomic_json(LOCAL / 'preprocess_summary.json', summary)
    return summary


def read_queue() -> list[dict]:
    return [json.loads(line) for line in (LOCAL / 'classification_queue.jsonl').read_text(encoding='utf-8').splitlines() if line]


def cache_path(group: dict, taxonomy_hash: str) -> Path:
    key = digest(f"{VERSION}|{taxonomy_hash}|{MODEL}|{group['original_lyric_hash']}".encode())
    return CACHE / f'{key}.json'


def validate_item(item: dict, group: dict, categories: dict[str, str]) -> tuple[bool, str]:
    if item.get('hash') != group['original_lyric_hash']:
        return False, 'hash_mismatch'
    slug = item.get('primary_slug')
    if slug is not None and slug not in categories:
        return False, 'unsupported_slug'
    if item.get('confidence') not in ('high', 'medium', 'low') or not isinstance(item.get('uncertain'), bool):
        return False, 'invalid_confidence'
    if slug is None and not item['uncertain']:
        return False, 'unresolved_without_uncertainty'
    evidence = item.get('evidence')
    if not isinstance(evidence, list) or (slug and not evidence):
        return False, 'missing_evidence'
    if any(not isinstance(quote, str) or len(quote.strip()) < 10 or quote.startswith('lyrics_') or quote not in group['lyrics'] for quote in evidence):
        return False, 'nonliteral_evidence'
    if not isinstance(item.get('reason'), str) or len(item['reason'].strip()) < 12:
        return False, 'missing_reason'
    if any(candidate not in categories for candidate in item.get('competing_slugs', [])):
        return False, 'unsupported_competing_slug'
    return True, ''


def pack_queue(queue: list[dict], limit: int = 3, chars: int = 3800) -> list[list[dict]]:
    packs = []
    current = []
    size = 0
    for group in queue:
        length = len(group['lyrics'])
        if current and (len(current) >= limit or size + length > chars):
            packs.append(current)
            current, size = [], 0
        current.append(group)
        size += length
    if current:
        packs.append(current)
    return packs


def ollama_chat(pack: list[dict], categories: dict[str, str]) -> tuple[dict, dict]:
    host = os.environ.get('OLLAMA_HOST', '127.0.0.1:11434')
    if not host.startswith(('http://', 'https://')):
        host = 'http://' + host
    taxonomy = ', '.join(f'{slug}={label}' for slug, label in categories.items())
    records = [{'hash': group['original_lyric_hash'], 'lyrics': group['lyrics'],
                'title_for_corroboration_only': group['title']} for group in pack]
    prompt = ('Classify each hymn from its COMPLETE lyrics. Choose the dominant subject, not an isolated name, title, or word count. '
              'Use only these category slugs: ' + taxonomy + '. Return JSON object with items array, one per input, '
              'each {hash,primary_slug,confidence,uncertain,evidence,reason,competing_slugs}. '
              'primary_slug may be null if unresolved. confidence high|medium|low. evidence: 1-2 exact literal lyric excerpts '
              'of at least 10 characters. Copy a complete short line exactly, with original spelling and punctuation. '
              'If no literal excerpt supports a category, use primary_slug=null, uncertain=true, evidence=[]. '
              'uncertain is true for ambiguity or insufficient context. '
              'No occasions or invented slugs. Keep reasons under 35 words.\n'
              + json.dumps(records, ensure_ascii=False, separators=(',', ':')))
    body = {'model': MODEL, 'stream': False, 'think': False, 'format': 'json', 'keep_alive': '30m',
            'options': {'temperature': 0, 'num_predict': 1500, 'num_ctx': 8192},
            'messages': [{'role': 'user', 'content': prompt}]}
    request = urllib.request.Request(host.rstrip('/') + '/api/chat',
                                     data=json.dumps(body, ensure_ascii=False).encode('utf-8'),
                                     headers={'Content-Type': 'application/json'}, method='POST')
    opener = urllib.request.build_opener(urllib.request.ProxyHandler({}))
    with opener.open(request, timeout=240) as response:
        result = json.load(response)
    return json.loads(result['message']['content']), {
        'model': result.get('model', MODEL), 'prompt_eval_count': result.get('prompt_eval_count'),
        'eval_count': result.get('eval_count'), 'total_duration_ns': result.get('total_duration'),
        'runner': 'ollama', 'taxonomy_sha256': taxonomy_version(), 'version': VERSION,
    }


def run_model(max_packs: int) -> dict:
    categories, _ = catalogs()
    summary = json.loads((LOCAL / 'preprocess_summary.json').read_text(encoding='utf-8'))
    if summary['source_sha256'] != digest(SOURCE.read_bytes()) or summary['taxonomy_sha256'] != taxonomy_version():
        raise RuntimeError('Source or taxonomy changed; rerun prepare before model execution.')
    taxonomy_hash = summary['taxonomy_sha256']
    queue = read_queue()
    previous = json.loads((LOCAL / 'model_progress.json').read_text(encoding='utf-8')) if (LOCAL / 'model_progress.json').exists() else {}
    failed = previous.get('failed_groups', {})
    attempts = previous.get('failure_attempts', {})
    oversized = [group for group in queue if len(group['lyrics']) > MAX_FULL_LYRIC_CHARS and
                 not cache_path(group, taxonomy_hash).exists()]
    for group in oversized:
        failed[group['original_lyric_hash']] = 'requires_larger_full_lyric_context'
        attempts[group['original_lyric_hash']] = 2
    pending = [group for group in queue if not cache_path(group, taxonomy_hash).exists() and attempts.get(group['original_lyric_hash'], 0) < 2]
    packs = pack_queue(pending)[:max_packs]
    stats = {'model_requests': previous.get('model_requests', 0), 'prompt_tokens': previous.get('prompt_tokens', 0),
             'output_tokens': previous.get('output_tokens', 0), 'failed_groups': failed,
             'failure_attempts': attempts}
    RAW.mkdir(exist_ok=True)
    for pack in packs:
        output = None
        provenance = None
        for attempt in range(2):
            try:
                stats['model_requests'] += 1
                output, provenance = ollama_chat(pack, categories)
                break
            except Exception as error:  # bounded retry; move to independent groups afterward
                if attempt == 1:
                    for group in pack:
                        failed[group['original_lyric_hash']] = str(error)[:200]
                        attempts[group['original_lyric_hash']] = attempts.get(group['original_lyric_hash'], 0) + 1
        if output is None or provenance is None:
            atomic_json(LOCAL / 'model_progress.json', stats)
            continue
        stats['prompt_tokens'] += provenance.get('prompt_eval_count') or 0
        stats['output_tokens'] += provenance.get('eval_count') or 0
        atomic_json(RAW / f"request-{stats['model_requests']:06d}.json", {'group_hashes': [group['original_lyric_hash'] for group in pack], 'output': output, 'provenance': provenance})
        by_hash = {item.get('hash'): item for item in output.get('items', []) if isinstance(item, dict)}
        for group in pack:
            item = by_hash.get(group['original_lyric_hash'])
            valid, reason = validate_item(item or {}, group, categories)
            if not valid:
                failed[group['original_lyric_hash']] = reason
                attempts[group['original_lyric_hash']] = attempts.get(group['original_lyric_hash'], 0) + 1
                continue
            record = {'group': group['original_lyric_hash'], 'member_ids': group['member_ids'],
                      'item': item, 'provenance': provenance, 'review_kind': 'local_model_proposal',
                      'human_verified': False}
            atomic_json(cache_path(group, taxonomy_hash), record)
            failed.pop(group['original_lyric_hash'], None)
            attempts.pop(group['original_lyric_hash'], None)
        stats['cached_groups'] = sum(cache_path(group, taxonomy_hash).exists() for group in queue)
        stats['next_group_hash'] = next((group['original_lyric_hash'] for group in queue if not cache_path(group, taxonomy_hash).exists() and attempts.get(group['original_lyric_hash'], 0) < 2), None)
        atomic_json(LOCAL / 'model_progress.json', stats)
    return stats


def verify() -> dict:
    source = read_csv(SOURCE)
    queue = read_queue()
    categories, _ = catalogs()
    summary = json.loads((LOCAL / 'preprocess_summary.json').read_text(encoding='utf-8'))
    assert len(source) == 2531 and summary['source_sha256'] == digest(SOURCE.read_bytes())
    assert summary['taxonomy_sha256'] == taxonomy_version()
    assert sum(len(group['member_ids']) for group in queue) == 2506
    assert len({member for group in queue for member in group['member_ids']}) == 2506
    by_id = {row['import_id']: row for row in source}
    model_rows = []
    for group in queue:
        for member in group['member_ids']:
            assert original_lyric_hash(by_id[member]) == group['original_lyric_hash']
        path = cache_path(group, summary['taxonomy_sha256'])
        if not path.exists():
            continue
        record = json.loads(path.read_text(encoding='utf-8'))
        valid, reason = validate_item(record['item'], group, categories)
        assert valid, (path, reason)
        flags = []
        if len(normalize(group['lyrics'])) < 120:
            flags.append('short_lyrics')
        if record['item']['uncertain']:
            flags.append('model_uncertain')
        if record['item']['primary_slug'] and record['item']['primary_slug'] not in [item['slug'] for item in group['ranked_candidates']]:
            flags.append('category_not_supported_by_alias_candidates')
        if any(by_id[member]['category'] and record['item']['primary_slug'] and
               categories[record['item']['primary_slug']] != by_id[member]['category'] for member in group['member_ids']):
            flags.append('conflicts_with_current_category')
        if any(flag in flags for flag in ('short_lyrics', 'model_uncertain', 'conflicts_with_current_category')):
            effective_confidence = 'low'
        elif 'category_not_supported_by_alias_candidates' in flags or len(record['item']['evidence']) < 2:
            effective_confidence = 'medium' if record['item']['confidence'] == 'high' else record['item']['confidence']
        else:
            effective_confidence = record['item']['confidence']
        for member in group['member_ids']:
            model_rows.append({'import_id': member, 'primary_slug': record['item']['primary_slug'] or '',
                               'model_confidence': record['item']['confidence'], 'effective_confidence': effective_confidence,
                               'uncertain': str(record['item']['uncertain'] or bool(flags)).lower(),
                               'quality_flags': '|'.join(flags),
                               'evidence': ' | '.join(record['item']['evidence']), 'reason': record['item']['reason'],
                               'model': record['provenance']['model'], 'taxonomy_sha256': summary['taxonomy_sha256'],
                               'human_verified': 'false', 'review_kind': 'local_model_proposal'})
    write_csv(LOCAL / 'model_proposals.csv', ['import_id', 'primary_slug', 'model_confidence', 'effective_confidence', 'uncertain', 'quality_flags', 'evidence', 'reason', 'model', 'taxonomy_sha256', 'human_verified', 'review_kind'], model_rows)
    progress = json.loads((LOCAL / 'model_progress.json').read_text(encoding='utf-8')) if (LOCAL / 'model_progress.json').exists() else {}
    model_by_id = {row['import_id']: row for row in model_rows}
    review_rows = []
    for candidate in read_csv(LOCAL / 'automated_candidates.csv'):
        member = candidate['import_id']
        model_row = model_by_id.get(member)
        if not model_row:
            issue = progress.get('failed_groups', {}).get(candidate['original_lyric_hash'], '')
            reason = issue or 'awaiting_local_model'
        elif not model_row['primary_slug']:
            reason = 'model_unresolved'
        elif model_row['quality_flags']:
            reason = model_row['quality_flags']
        else:
            reason = 'editorial_review_required'
        review_rows.append({'import_id': member, 'candidate_slug': candidate['candidate_slug'],
                            'candidate_status': candidate['candidate_status'],
                            'model_slug': model_row['primary_slug'] if model_row else '',
                            'review_reason': reason, 'original_lyric_hash': candidate['original_lyric_hash'],
                            'human_verified': 'false'})
    write_csv(LOCAL / 'review_queue.csv', ['import_id', 'candidate_slug', 'candidate_status', 'model_slug',
                                          'review_reason', 'original_lyric_hash', 'human_verified'], review_rows)
    classified_proposals = sum(bool(row['primary_slug']) for row in model_rows)
    result = {'source_records': 2531, 'human_semantic_reviews': 25,
              'automated_candidate_records': 2506, 'local_model_proposal_records': len(model_rows),
              'local_model_classification_proposals': classified_proposals,
              'local_model_uncertain_or_unclassified': len(model_rows) - classified_proposals,
              'exact_duplicate_reused_records': len(model_rows) - sum(cache_path(group, summary['taxonomy_sha256']).exists() for group in queue),
              'unresolved_without_model_proposal': 2506 - len(model_rows),
              'unresolved_total': 2506 - classified_proposals,
              'model_requests': progress.get('model_requests', 0),
              'prompt_tokens': progress.get('prompt_tokens', 0), 'output_tokens': progress.get('output_tokens', 0),
              'effective_confidence_distribution': dict(Counter(row['effective_confidence'] for row in model_rows)),
              'failed_groups': progress.get('failed_groups', {}),
              'next_group_hash': progress.get('next_group_hash', queue[0]['original_lyric_hash'] if queue else None)}
    atomic_json(LOCAL / 'verification.json', result)
    return result


parser = argparse.ArgumentParser()
parser.add_argument('command', choices=['prepare', 'run', 'verify'])
parser.add_argument('--max-packs', type=int, default=4)
arguments = parser.parse_args()
if arguments.command == 'prepare':
    print(json.dumps(build_preprocess(), ensure_ascii=False, indent=2))
elif arguments.command == 'run':
    print(json.dumps(run_model(arguments.max_packs), ensure_ascii=False, indent=2))
else:
    print(json.dumps(verify(), ensure_ascii=False, indent=2))
