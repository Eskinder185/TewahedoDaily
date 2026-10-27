import * as fs from 'node:fs'
import * as path from 'node:path'

function findTsxFiles(dir: string, list: string[] = []): string[] {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name)
    if (entry.isDirectory()) {
      if (entry.name !== 'node_modules' && entry.name !== '.git' && entry.name !== 'dist') {
        findTsxFiles(full, list)
      }
    } else if (entry.name.endsWith('.tsx') || entry.name.endsWith('.ts')) {
      list.push(full)
    }
  }
  return list
}

const files = findTsxFiles('src')
console.log(`Found ${files.length} tsx/ts files in src/`)

interface InlineIssue {
  file: string
  lineNum: number
  line: string
  match: string
}

const inlineIssues: InlineIssue[] = []

for (const file of files) {
  const content = fs.readFileSync(file, 'utf8')
  const lines = content.split('\n')
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i]
    if (/style\s*=\s*\{\{[^}]*(?:color|background|backgroundColor)\s*:\s*['"`](?:#|black|white|rgb|hsl)/i.test(line)) {
      inlineIssues.push({ file, lineNum: i + 1, line: line.trim(), match: line.trim() })
    }
  }
}

console.log(`Found ${inlineIssues.length} inline style color lines:`)
for (const iss of inlineIssues) {
  console.log(`  ${iss.file}:${iss.lineNum} -> ${iss.line}`)
}
