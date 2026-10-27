import { readFileSync } from 'node:fs'

const content = readFileSync('C:/Users/eskew/Documents/Codex/2026-09-29/files-mentioned-by-the-user-amharic/outputs/mezmur_data.csv', 'utf8')
const lines = content.split(/\r?\n/)
for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes('yared') || lines[i].includes('nana') || lines[i].includes('share')) {
    console.log('codex:', i, lines[i].slice(0, 150))
  }
}
