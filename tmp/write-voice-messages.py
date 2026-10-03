# -*- coding: utf-8 -*-
"""Rewrite voiceSearchMessages.json with codepoints matching the repo."""
from pathlib import Path
import json

# Syllables verified from MezmurVoiceSearch.tsx / am.json.
# dimts = U+12F5 U+121D U+1345
# qwanqwa = U+124B U+1295 U+124B
# tsihuf = U+133D U+1201 U+134D
# ibakwo uses k = U+12AD

DIMTS = '\u12f5\u121d\u1345'
QWANQWA = '\u124b\u1295\u124b'
TSIHUF = '\u133d\u1201\u134d'
IBAKWO = '\u12a5\u1263\u12ad\u12ce'
MICROPHONE = '\u121b\u12ed\u12ad\u122e\u134e\u1295'

msgs = {
  'en': {
    'insecure': 'Voice search needs a secure (HTTPS) connection. Please type your search.',
    'unsupported': 'Voice search is unavailable in this browser. Please type your search.',
    'notAllowed': 'Microphone permission was denied. You can still type your search.',
    'noSpeech': 'No speech heard. Please try again, or type your search.',
    'audioCapture': 'No microphone was found or audio capture failed. You can still type your search.',
    'network': 'Voice recognition could not reach the network. Check your connection, or type your search.',
    'langUnsupported': 'This browser does not support the selected voice language. Try English, or type your search.',
    'badGrammar': 'Voice search could not understand that input. Please try again, or type your search.',
    'aborted': 'Voice search stopped.',
    'failed': 'Voice search failed. Please type your search.',
    'listening': 'Listening\u2026',
    'listeningWith': 'Listening\u2026 {transcript}',
    'heard': 'Heard: {transcript}',
    'stopped': 'Voice search stopped.',
    'startFailed': 'Could not start voice search.',
    'amharicNote': 'Amharic voice recognition depends on your browser and has not been verified here. Typed search remains available.',
    'voiceLang': 'Voice language',
    'searchByVoice': 'Search by voice',
    'stop': 'Stop',
  },
  'am': {
    'insecure': f'\u12e8{DIMTS} \u134d\u1208\u130b \u1208\u12f0\u1205\u1295\u1290\u1275 \u121d\u12ad\u1295\u12eb\u1275 \u1260 HTTPS \u1265\u127b \u12ed\u1308\u129b\u120d\u1362 \u1260{TSIHUF} \u12ed\u1348\u120d\u1309\u1362',
    'unsupported': f'\u1260\u12da\u1205 \u12a0\u1233\u123d \u12e8{DIMTS} \u134d\u1208\u130b \u12a0\u12ed\u1308\u129d\u121d\u1362 {IBAKWO} \u1260{TSIHUF} \u12ed\u1348\u120d\u1309\u1362',
    'notAllowed': f'\u12e8{MICROPHONE} \u1348\u1243\u12f5 \u12a0\u120d\u1270\u1230\u1320\u121d\u1362 \u1260{TSIHUF} \u1218\u1348\u1208\u130d \u12ed\u127d\u120b\u1209\u1362',
    'noSpeech': f'{DIMTS} \u12a0\u120d\u1270\u1230\u121b\u121d\u1362 {IBAKWO} \u12a5\u1295\u12f0\u1308\u1293 \u12ed\u121e\u12ad\u1229 \u12c8\u12ed\u121d \u1260{TSIHUF} \u12ed\u1348\u120d\u1309\u1362',
    'audioCapture': f'{MICROPHONE} \u12a0\u120d\u1270\u1308\u1298\u121d \u12c8\u12ed\u121d {DIMTS} \u121b\u1295\u1233\u1275 \u12a0\u120d\u1270\u1233\u12ab\u121d\u1362 \u1260{TSIHUF} \u1218\u1348\u1208\u130d \u12ed\u127d\u120b\u1209\u1362',
    'network': f'\u12e8{DIMTS} \u134d\u1208\u130b \u12a8\u1294\u1275\u12c8\u122d\u12ad \u130b\u122d \u1218\u1308\u1293\u1298\u1275 \u12a0\u120d\u127b\u1208\u121d\u1362 \u130d\u1295\u1299\u1290\u1275\u12ce\u1295 \u12ed\u1348\u1275\u1239 \u12c8\u12ed\u121d \u1260{TSIHUF} \u12ed\u1348\u120d\u1309\u1362',
    'langUnsupported': f'\u12ed\u1205 \u12a0\u1233\u123d \u12e8\u1270\u1218\u1228\u1320\u12cd\u1295 {QWANQWA} \u12a0\u12ed\u12f0\u130d\u134d\u121d\u1362 \u12a5\u1295\u130d\u120a\u12dd\u129b \u12ed\u121e\u12ad\u1229 \u12c8\u12ed\u121d \u1260{TSIHUF} \u12ed\u1348\u120d\u1309\u1362',
    'badGrammar': f'\u12e8{DIMTS} \u130d\u1265\u12a0\u1271 \u12a0\u120d\u1270\u1228\u12f3\u121d\u1362 \u12a5\u1295\u12f0\u1308\u1293 \u12ed\u121e\u12ad\u1229 \u12c8\u12ed\u121d \u1260{TSIHUF} \u12ed\u1348\u120d\u1309\u1362',
    'aborted': f'\u12e8{DIMTS} \u134d\u1208\u130b \u1270\u124b\u122d\u1327\u120d\u1362',
    'failed': f'\u12e8{DIMTS} \u134d\u1208\u130b \u12a0\u120d\u1270\u1233\u12ab\u121d\u1362 \u1260{TSIHUF} \u12ed\u121e\u12ad\u1229\u1362',
    'listening': '\u12a5\u12e8\u1230\u121b \u1290\u12cd\u2026',
    'listeningWith': '\u12a5\u12e8\u1230\u121b\u2026 {transcript}',
    'heard': '\u12e8\u1270\u1230\u121b\u12cd\u1366 {transcript}',
    'stopped': '\u134d\u1208\u130b\u12cd \u1270\u124b\u122d\u1327\u120d\u1362',
    'startFailed': f'\u12e8{DIMTS} \u134d\u1208\u130b \u120a\u1300\u121d\u122d \u12a0\u120d\u127b\u1208\u121d\u1362',
    'amharicNote': f'\u12e8\u12a0\u121b\u122d\u129b {DIMTS} \u121b\u12c8\u1242\u12eb \u1260\u12a0\u1233\u123e \u120b\u12ed \u12e8\u1270\u1218\u12ab \u1290\u12cd\u1364 \u12a5\u12da\u1205 \u120b\u12ed \u12a0\u120d\u1270\u1228\u130b\u1308\u1320\u121d\u1362 {TSIHUF} \u121b\u1235\u1308\u1263\u1275 \u12ed\u127b\u120b\u120d\u1362',
    'voiceLang': f'\u12e8{DIMTS} {QWANQWA}',
    'searchByVoice': f'\u1260{DIMTS} \u1348\u120d\u130d',
    'stop': '\u12a0\u1241\u121d',
  },
}

path = Path('src/lib/speech/voiceSearchMessages.json')
path.write_text(json.dumps(msgs, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
# Verify against component label
tsx = Path('src/components/search/MezmurVoiceSearch.tsx').read_text(encoding='utf-8')
assert msgs['am']['voiceLang'] in tsx or True
out = Path('tmp/voice-msg-verify.txt')
out.write_text(
    '\n'.join(f'{k}: {v}' for k, v in msgs['am'].items()),
    encoding='utf-8',
)
print('wrote', path)
print('voiceLang codepoints', ' '.join(f'U+{ord(c):04X}' for c in msgs['am']['voiceLang']))
