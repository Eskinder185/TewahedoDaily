# -*- coding: utf-8 -*-
from pathlib import Path
import json

msgs = json.loads(Path('src/lib/speech/voiceSearchMessages.json').read_text(encoding='utf-8'))
body = json.dumps(msgs, ensure_ascii=False, indent=2)
ts = (
    '/** Localized voice-search copy. Keep Amharic recognition claims unverified. */\n'
    f'const messages = {body} as const\n\n'
    'export default messages\n'
)
Path('src/lib/speech/voiceSearchMessages.ts').write_text(ts, encoding='utf-8')
print('wrote voiceSearchMessages.ts')
