import fs from 'fs';
import path from 'path';

const outDir = 'scripts/fixtures/reader';

// 1. Sample UTF-8 TXT with Amharic & Ge'ez
const txtContent = `በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን።

መቅድመ መጽሐፍ — የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን ታሪክና እምነት

ምዕራፍ ፩፡ ሃይማኖተ አበው
የቀናች የቀደመች ሃይማኖት በእግዚአብሔር ቸርነትና በአባቶቻችን ጸሎት የጸናች ናት።
በዚህ መጽሐፍ ውስጥ ስለ ቅዱሳን አበው ሕይወት፣ ስለ ቤተ ክርስቲያን ሥርዓትና ትውፊት በሰፊው ተጽፏል።

Chapter 1: The Orthodox Tewahedo Tradition
The Ethiopian Orthodox Tewahedo Church upholds the Apostolic faith delivered once for all to the saints.
Through fasting, prayer, liturgical worship, and canonical scripture, believers are nurtured in truth and love.

ምዕራፍ ፪፡ ጸሎትና ምጽዋት
ዘወትር ወደ እግዚአብሔር መጸለይና ለድሆች መመጽወት መንፈሳዊ ፍሬን ያፈራል።
`;

fs.writeFileSync(path.join(outDir, 'sample-faith.txt'), txtContent, 'utf8');
console.log('✓ Created sample-faith.txt');

// 2. Minimal Valid Multi-Page PDF
// Valid PDF 1.4 syntax with 2 pages
const pdfContent = `%PDF-1.4
1 0 obj
<< /Type /Catalog /Pages 2 0 R >>
endobj
2 0 obj
<< /Type /Pages /Kids [3 0 R 4 0 R] /Count 2 >>
endobj
3 0 obj
<< /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Contents 5 0 R /Resources << /Font << /F1 7 0 R >> >> >>
endobj
4 0 obj
<< /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Contents 6 0 R /Resources << /Font << /F1 7 0 R >> >> >>
endobj
5 0 obj
<< /Length 73 >>
stream
BT
/F1 24 Tf
100 700 Td
(TewahedoDaily Church Library - Page 1) Tj
ET
endstream
endobj
6 0 obj
<< /Length 73 >>
stream
BT
/F1 24 Tf
100 700 Td
(TewahedoDaily Church Library - Page 2) Tj
ET
endstream
endobj
7 0 obj
<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>
endobj
xref
0 8
0000000000 65535 f 
0000000009 00000 n 
0000000058 00000 n 
0000000115 00000 n 
0000000224 00000 n 
0000000333 00000 n 
0000000455 00000 n 
0000000577 00000 n 
trailer
<< /Size 8 /Root 1 0 R >>
startxref
654
%%EOF`;

fs.writeFileSync(path.join(outDir, 'sample-document.pdf'), pdfContent, 'binary');
console.log('✓ Created sample-document.pdf');
