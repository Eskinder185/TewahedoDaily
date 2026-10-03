from pathlib import Path
import json
import re

tsx = Path('src/components/search/MezmurVoiceSearch.tsx').read_text(encoding='utf-8')
for m in re.findall(r"'([^']*[\u1200-\u137F][^']*)'", tsx):
    print(m, '=>', ' '.join(f'U+{ord(c):04X}' for c in m))

needles = [
    '\u12f5\u121d\u1335',  # dImITS
    '\u133d\u1201\u134d',  # TShuf
    '\u12a5\u1263\u12ae\u12ce',  # ibakwo
    '\u1249\u1295\u1243',  # qwanqwa
    '\u121b\u12ed\u12ad\u122e\u134e\u1295',  # microphone
]
root = Path('src')
for needle in needles:
    hits = []
    for path in root.rglob('*'):
        if path.suffix not in {'.tsx', '.ts', '.json', '.md'}:
            continue
        try:
            text = path.read_text(encoding='utf-8')
        except Exception:
            continue
        if needle in text:
            hits.append(str(path))
    print(
        needle,
        'codepoints',
        ' '.join(f'U+{ord(c):04X}' for c in needle),
        'hits',
        len(hits),
        hits[:3],
    )

# Print what we currently have in voiceSearchMessages.json
msgs = json.loads(Path('src/lib/speech/voiceSearchMessages.json').read_text(encoding='utf-8'))
for key, value in msgs['am'].items():
    print(key, '=>', ' '.join(f'U+{ord(c):04X}' for c in value[:12]), '|', value)
