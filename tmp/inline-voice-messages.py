from pathlib import Path

msgs = Path('src/lib/speech/voiceSearchMessages.ts').read_text(encoding='utf-8')
support = Path('src/lib/speech/voiceSearchSupport.ts').read_text(encoding='utf-8')
support = support.replace("import messages from './voiceSearchMessages'\n\n", '')
marker = '/** Shared Web Speech API helpers for Mezmur + Search Buddy voice input. */\n\n'
assert marker in support
start = msgs.index('const messages')
end = msgs.index('export default messages')
block = msgs[start:end].rstrip() + '\n\n'
Path('src/lib/speech/voiceSearchSupport.ts').write_text(
    marker + block + support[len(marker) :],
    encoding='utf-8',
)
Path('src/lib/speech/voiceSearchMessages.ts').unlink(missing_ok=True)
Path('src/lib/speech/voiceSearchMessages.json').unlink(missing_ok=True)
print('inlined ok')
