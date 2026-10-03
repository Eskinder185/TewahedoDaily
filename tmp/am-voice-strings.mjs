const strings = {
  insecure: 'የድምፅ ፍለጋ ለደህንነት ምክንያት በ HTTPS ብቻ ይገኛል። በጽሑፍ ይ�ገኛል። በጽሑፍ ይፈልጉ።',
  unsupported: 'በዚህ አሳሽ የድምፅ ፍለጋ አይገኝም። እባክዎ በጽሑፍ ይፈልጉ።',
  notAllowed: 'የማይክሮፎን ፈቃድ አልተሰጠም። በጽሑፍ መፈለግ ይችላሉ።',
  noSpeech: 'ድምፅ አልተሰማም። እባክዎ እንደገና ይሞክ�� ወይም በጽሑፍ ይፈልጉ።',
  audioCapture: 'ማይክ�። እባክዎ እንደገና ይሞክሩ ወይም በጽሑፍ ይፈልጉ።',
  audioCapture: 'ማይክሮፎን አልተገኘም ወይም ድምፅ ማንሳት አልተሳካም። በጽሑፍ መፈለግ ይችላሉ።',
  network: 'የድምፅ ፍለጋ ከኔትወርክ ጋር መገናኘት አል�ወርክ ጋር መገናኘት አልቻለም። ግንኙነትዎን ይፈትሹ ወይም በጽሑፍ ይፈልጉ።',
  langUnsupported: 'ይህ አሳሽ የተመረጠውን ቋንቋ አይደግፍም። እንግሊ� ቋንቋ አይደግፍም። እንግሊዝኛ ይሞክሩ ወይም በጽሑፍ ይፈልጉ።',
  badGrammar: 'የድምፅ ግብዓቱ አልተረዳም። እንደገና ይሞክሩ ወይም በጽሑፍ ይፈልጉ።',
  aborted: 'የድምፅ ፍለጋ ተቋር�ጽሑፍ ይፈልጉ።',
  aborted: 'የድምፅ ፍለጋ ተቋርጧል።',
  failed: 'የድምፅ ፍለጋ አልተሳካም። በጽሑፍ ይሞክሩ።',
  listening: '��የሰማ ነው…',
  stopped: 'ፍለጋው ተ��ርጧል።',
  startFailed: 'የድምፅ ፍለጋ ሊ�ተሳካም። በጽሑፍ ይሞክሩ።',
  listening: 'እየሰማ ነው…',
  stopped: 'ፍለጋው ተቋርጧል።',
  startFailed: 'የድምፅ ፍለጋ ሊጀምር አልቻለም።',
  amharicNote:
    'የአማርኛ ድምፅ ማወቂያ በአሳሽዎ ላይ የተመካ ነው፤ እዚህ ላይ አልተረጋገጠም። ጽሑፍ ማስገባት ይቻላል።',
  voiceLang: '��ድምፅ ቋንቋ',
  searchByVoice: 'በድምፅ ፈልግ',
  stop: 'አ�ፍ ማስገባት ይቻላል።',
  voiceLang: 'የድምፅ ቋንቋ',
  searchByVoice: 'በድምፅ ፈልግ',
  stop: 'አቁም',
}

function toEscapes(s) {
  return [...s].map((ch) => {
    const cp = ch.codePointAt(0)
    if (cp > 0xffff) return `\\u{${cp.toString(16)}}`
    if (cp < 128 && ch !== '\\' && ch !== "'") return ch
    return `\\u${cp.toString(16).padStart(4, '0')}`
  }).join('')
}

for (const [k, v] of Object.entries(strings)) {
  console.log(`${k}: '${toEscapes(v)}'`)
}
console.log('listeningWith template prefix:', toEscapes('�k}: '${toEscapes(v)}'`)
}
console.log('listeningWith template prefix:', toEscapes('እየሰማ… '))
console.log('heard template prefix:', toEscapes('የተሰማው፦ '))
