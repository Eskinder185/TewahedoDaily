import re, os

uuid_re = re.compile(r'[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}', re.I)

for root, dirs, files in os.walk('.'):
    # skip node_modules and .git
    if 'node_modules' in root or '.git' in root or 'dist' in root:
        continue
    for f in files:
        if not (f.endswith('.csv') or f.endswith('.json') or f.endswith('.sql') or f.endswith('.jsonl') or f.endswith('.txt') or f.endswith('.mjs') or f.endswith('.ts')):
            continue
        p = os.path.join(root, f)
        try:
            with open(p, 'r', encoding='utf-8', errors='ignore') as fh:
                content = fh.read()
                matches = uuid_re.findall(content)
                if '23f8f202-aba6-4d90-8e5f-e462e0568691' in content:
                    print(f'*** MATCH 23f8f202 in {p} ***')
                if len(matches) > 100:
                    print(f'{p}: found {len(matches)} UUIDs (sample: {matches[0]})')
        except Exception as e:
            pass
