import { readFileSync } from 'node:fs'

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

const formatFile = 'C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv'
const formatLines = readFileSync(formatFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

const formatMap = new Map()
for (let i = 1; i < formatLines.length; i++) {
  const parts = formatLines[i].split(',')
  const id = parts[0].replace(/^"|"$/g, '')
  const title = parts[1]?.replace(/^"|"$/g, '')
  const status = parts[2]?.replace(/^"|"$/g, '')
  formatMap.set(id, { title, status })
}

console.log('Searching for draft records matching share or yared:')
for (let i = 1; i < classLines.length; i++) {
  const parts = classLines[i].split(',')
  const id = parts[0].replace(/^"|"$/g, '')
  const slug = parts[1]?.replace(/^"|"$/g, '')
  const title = parts[2]?.replace(/^"|"$/g, '')
  const fmt = formatMap.get(id)
  if (fmt?.status === 'draft') {
    if (slug.includes('yared') || slug.includes('share') || title.includes('ያሬድ') || title.includes('Share') || title.includes('ክፍል')) {
      console.log('Draft match:', id, slug, title)
    }
  }
}
