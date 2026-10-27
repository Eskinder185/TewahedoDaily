import { readFileSync } from 'node:fs'

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

for (let i = 1; i < classLines.length; i++) {
  const line = classLines[i]
  if (line.includes('ክፍል') || line.includes('ማኀበር') || line.includes('guba') || line.includes('kifil') || line.includes('gubae')) {
    console.log('Found:', line)
  }
}
