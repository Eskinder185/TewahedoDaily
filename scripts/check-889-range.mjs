import { readFileSync } from 'node:fs'

const content = readFileSync('C:/Users/eskew/Downloads/tewahedodaily_mezmur_data_import_889.csv', 'utf8')
const lines = content.split(/\r?\n/)
for (let i = 30735; i <= 30750; i++) {
  console.log(i, lines[i]?.slice(0, 100))
}
