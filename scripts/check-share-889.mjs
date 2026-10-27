import { readFileSync } from 'node:fs'

const content = readFileSync('C:/Users/eskew/Downloads/tewahedodaily_mezmur_data_import_889.csv', 'utf8')
const lines = content.split(/\r?\n/)
for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes('ያሬድ ካህኑ ዘመረ') || lines[i].includes('የዜማ ቅዱስ ያሬድ ማኀበር')) {
    console.log(i, lines[i].slice(0, 150))
  }
}
