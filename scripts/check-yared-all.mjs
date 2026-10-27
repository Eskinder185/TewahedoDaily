import { readFileSync } from 'node:fs'

const content = readFileSync('C:/Users/eskew/Downloads/supabase-mezmur-library-v2.csv', 'utf8')
const lines = content.split(/\r?\n/)
for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes('yared-kahenu-zemre') || lines[i].includes('Yared Kahenu')) {
    console.log('v2:', i, lines[i].slice(0, 150))
  }
}

const c889 = readFileSync('C:/Users/eskew/Downloads/tewahedodaily_mezmur_data_import_889.csv', 'utf8')
const l889 = c889.split(/\r?\n/)
for (let i = 0; i < l889.length; i++) {
  if (l889[i].includes('yared-kahenu-zemre') || l889[i].includes('Yared Kahenu')) {
    console.log('889:', i, l889[i].slice(0, 150))
  }
}
