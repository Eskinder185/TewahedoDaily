import { readFileSync } from 'node:fs'

const content = readFileSync('C:/Users/eskew/Downloads/supabase-mezmur-library-v2.csv', 'utf8')
const lines = content.split(/\r?\n/)
for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes(',share,') || lines[i].includes('nana-amanuel')) {
    console.log(i, lines[i].slice(0, 150))
  }
}
