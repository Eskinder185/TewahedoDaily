# -*- coding: utf-8 -*-
from pathlib import Path
import re

p = Path('src/lib/speech/voiceSearchSupport.ts')
t = p.read_text(encoding='utf-8')
new_note = (
    '\u12e8\u12a0\u121b\u122d\u129b \u12f5\u121d\u1345 \u121b\u12c8\u1242\u12eb '
    '\u1260\u12a0\u1233\u123e \u12a0\u1308\u120d\u130d\u120e\u1275 \u12ed\u1320\u1240\u121b\u120d\u1362 '
    '\u12a0\u1235\u1348\u120b\u130a \u12f5\u121d\u1345 \u12a5\u1295\u12f0\u122b\u120a \u12ed\u1320\u1240\u121b\u120d\u1362'
)
parts = t.split('amharicNote:')
assert len(parts) >= 3, len(parts)
am_rest = parts[2]
am_rest2 = re.sub(r"\n\s*'[^']*'", f"\n      '{new_note}'", am_rest, count=1)
p.write_text(parts[0] + 'amharicNote:' + parts[1] + 'amharicNote:' + am_rest2, encoding='utf-8')
print('ok')
