import { readFileSync } from 'node:fs'

const content = readFileSync('data/imports/eotcmedia/eotcmedia_supabase_mezmurs_with_lyrics.csv', 'utf8')
const lines = content.split(/\r?\n/)
for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes('nana-amanuel') || lines[i].includes(',share,')) {
    console.log(i, lines[i].slice(0, 150))
  }
}
