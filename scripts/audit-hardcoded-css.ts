import * as fs from 'node:fs'
import * as path from 'node:path'

function findCssFiles(dir: string, list: string[] = []): string[] {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name)
    if (entry.isDirectory()) {
      if (entry.name !== 'node_modules' && entry.name !== '.git' && entry.name !== 'dist') {
        findCssFiles(full, list)
      }
    } else if (entry.name.endsWith('.css')) {
      list.push(full)
    }
  }
  return list
}

const cssFiles = findCssFiles('src')
console.log(`Found ${cssFiles.length} CSS files in src/`)

interface Issue {
  file: string
  lineNum: number
  line: string
  type: string
}

const issues: Issue[] = []

for (const file of cssFiles) {
  const content = fs.readFileSync(file, 'utf8')
  const lines = content.split('\n')
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i]
    // Check for hardcoded dark text colors
    if (/color:\s*(#000|#111|#222|#333|#1e252d|#132238|#2d3748|#1a202c|#4a5568|#374151|#1f2937|black\b)/i.test(line)) {
      issues.push({ file, lineNum: i + 1, line: line.trim(), type: 'hardcoded-dark-text' })
    }
    // Check for hardcoded white or near-white background
    if (/(?:background|background-color):\s*(#fff|#ffffff|white|#f8f9fa|#fcfcfc|#fafafa)\b/i.test(line)) {
      issues.push({ file, lineNum: i + 1, line: line.trim(), type: 'hardcoded-white-bg' })
    }
    // Check for hardcoded light backgrounds that might have dark text on them
    if (/(?:background|background-color):\s*(#f5f0e5|#faf7f0|#efe5d4|#fbf6ea|#fff8f0|#fff8e1|#fffdf5)\b/i.test(line)) {
      issues.push({ file, lineNum: i + 1, line: line.trim(), type: 'hardcoded-cream-bg' })
    }
  }
}

console.log(`Found ${issues.length} potential hardcoded color lines:`)
const byType: Record<string, Issue[]> = {}
for (const iss of issues) {
  byType[iss.type] = byType[iss.type] || []
  byType[iss.type].push(iss)
}

for (const [t, list] of Object.entries(byType)) {
  console.log(`\n--- Type: ${t} (${list.length}) ---`)
  for (const item of list) {
    console.log(`  ${item.file}:${item.lineNum} -> ${item.line}`)
  }
}
