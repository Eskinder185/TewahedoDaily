import fs from 'fs';
import path from 'path';
import zlib from 'zlib';

function createSimpleZip(entries) {
  // entries: Array of { name: string, data: Buffer }
  const localHeaders = [];
  const centralHeaders = [];
  let offset = 0;

  for (const entry of entries) {
    const nameBuf = Buffer.from(entry.name, 'utf8');
    const isMime = entry.name === 'mimetype';
    let compData;
    let method;

    if (isMime) {
      compData = entry.data;
      method = 0; // stored
    } else {
      compData = zlib.deflateRawSync(entry.data);
      method = 8; // deflate
    }

    const crc = 0; // simplified for test fixture
    const compSize = compData.length;
    const uncompSize = entry.data.length;

    // Local Header (30 bytes + name + data)
    const lh = Buffer.alloc(30);
    lh.writeUInt32LE(0x04034b50, 0); // signature
    lh.writeUInt16LE(20, 4); // version needed
    lh.writeUInt16LE(0, 6); // flags
    lh.writeUInt16LE(method, 8); // method
    lh.writeUInt16LE(0, 10); // time
    lh.writeUInt16LE(0, 12); // date
    lh.writeUInt32LE(crc, 14); // crc
    lh.writeUInt32LE(compSize, 18); // comp size
    lh.writeUInt32LE(uncompSize, 22); // uncomp size
    lh.writeUInt16LE(nameBuf.length, 26); // name length
    lh.writeUInt16LE(0, 28); // extra length

    localHeaders.push(lh, nameBuf, compData);

    // Central Directory Header (46 bytes + name)
    const cd = Buffer.alloc(46);
    cd.writeUInt32LE(0x02014b50, 0); // signature
    cd.writeUInt16LE(20, 4); // version made by
    cd.writeUInt16LE(20, 6); // version needed
    cd.writeUInt16LE(0, 8); // flags
    cd.writeUInt16LE(method, 10); // method
    cd.writeUInt16LE(0, 12); // time
    cd.writeUInt16LE(0, 14); // date
    cd.writeUInt32LE(crc, 16); // crc
    cd.writeUInt32LE(compSize, 20); // comp size
    cd.writeUInt32LE(uncompSize, 24); // uncomp size
    cd.writeUInt16LE(nameBuf.length, 28); // name length
    cd.writeUInt16LE(0, 30); // extra length
    cd.writeUInt16LE(0, 32); // comment length
    cd.writeUInt16LE(0, 34); // disk num
    cd.writeUInt16LE(0, 36); // internal attr
    cd.writeUInt32LE(0, 38); // external attr
    cd.writeUInt32LE(offset, 42); // local header offset

    centralHeaders.push(cd, nameBuf);

    offset += 30 + nameBuf.length + compSize;
  }

  const cdStart = offset;
  let cdSize = 0;
  for (const b of centralHeaders) cdSize += b.length;

  // End of Central Directory Record (22 bytes)
  const eocd = Buffer.alloc(22);
  eocd.writeUInt32LE(0x06054b50, 0); // signature
  eocd.writeUInt16LE(0, 4); // disk num
  eocd.writeUInt16LE(0, 6); // start disk
  eocd.writeUInt16LE(entries.length, 8); // entries on disk
  eocd.writeUInt16LE(entries.length, 10); // total entries
  eocd.writeUInt32LE(cdSize, 12); // size of CD
  eocd.writeUInt32LE(cdStart, 16); // offset of CD
  eocd.writeUInt16LE(0, 20); // comment length

  return Buffer.concat([...localHeaders, ...centralHeaders, eocd]);
}

const outDir = 'scripts/fixtures/reader';

// 3. EPUB Fixture
const containerXml = `<?xml version="1.0"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
  <rootfiles>
    <rootfile full-path="OEBPS/package.opf" media-type="application/oebps-package+xml"/>
  </rootfiles>
</container>`;

const packageOpf = `<?xml version="1.0" encoding="utf-8"?>
<package xmlns="http://www.idpf.org/2007/opf" unique-identifier="BookID" version="2.0">
  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
    <dc:title>Faith of the Fathers</dc:title>
    <dc:creator>Saint Athanasius of Alexandria</dc:creator>
    <dc:language>en</dc:language>
  </metadata>
  <manifest>
    <item id="ch1" href="chapter1.xhtml" media-type="application/xhtml+xml"/>
    <item id="ch2" href="chapter2.xhtml" media-type="application/xhtml+xml"/>
  </manifest>
  <spine>
    <itemref idref="ch1"/>
    <itemref idref="ch2"/>
  </spine>
</package>`;

const chapter1Xhtml = `<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Chapter 1: The Incarnation</title></head>
<body>
  <h1>Chapter 1: The Incarnation of the Word</h1>
  <p>The Word of God, incorporeal and incorruptible, entered human history to redeem creation.</p>
  <p>በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን። እግዚአብሔር ቃል ሥጋ ሆነ በእኛም አደረ።</p>
</body>
</html>`;

const chapter2Xhtml = `<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Chapter 2: The Victory over Death</title></head>
<body>
  <h1>Chapter 2: The Victory over Death</h1>
  <p>By His death on the Cross, Christ has vanquished death and bestowed life eternal.</p>
  <p>በሞቱ ሞትን ሻረው፤ በትንሣኤውም ሕይወትን ሰጠን።</p>
</body>
</html>`;

const epubBuffer = createSimpleZip([
  { name: 'mimetype', data: Buffer.from('application/epub+zip', 'utf8') },
  { name: 'META-INF/container.xml', data: Buffer.from(containerXml, 'utf8') },
  { name: 'OEBPS/package.opf', data: Buffer.from(packageOpf, 'utf8') },
  { name: 'OEBPS/chapter1.xhtml', data: Buffer.from(chapter1Xhtml, 'utf8') },
  { name: 'OEBPS/chapter2.xhtml', data: Buffer.from(chapter2Xhtml, 'utf8') },
]);

fs.writeFileSync(path.join(outDir, 'sample-faith.epub'), epubBuffer);
console.log('✓ Created sample-faith.epub');

// 4. DOCX Fixture
const docxDocumentXml = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    <w:p>
      <w:pPr><w:pStyle w:val="Heading1"/></w:pPr>
      <w:r><w:t>The Ethiopian Orthodox Church Liturgical Canon</w:t></w:r>
    </w:p>
    <w:p>
      <w:r><w:t>This document contains the foundational liturgical theology and liturgical calendar observances of the Ethiopian Orthodox Tewahedo Church.</w:t></w:r>
    </w:p>
    <w:p>
      <w:pPr><w:pStyle w:val="Heading2"/></w:pPr>
      <w:r><w:t>ቅዱስ ቁርባንና የጸሎት ሥርዓት</w:t></w:r>
    </w:p>
    <w:p>
      <w:r><w:t>በየቀኑና በሰንበት የሚፈጸመው ሥርዓተ ቅዳሴ መንፈሳዊ ምግብ ነው።</w:t></w:r>
    </w:p>
  </w:body>
</w:document>`;

const docxBuffer = createSimpleZip([
  { name: 'word/document.xml', data: Buffer.from(docxDocumentXml, 'utf8') },
]);

fs.writeFileSync(path.join(outDir, 'sample-faith.docx'), docxBuffer);
console.log('✓ Created sample-faith.docx');
