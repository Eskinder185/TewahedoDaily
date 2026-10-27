import { readFileSync } from 'node:fs'

const content = readFileSync('C:/Users/eskew/Downloads/tewahedodaily_mezmur_data_import_889.csv', 'utf8')
const lines = content.split(/\r?\n/)
console.log('Line 19054:', lines[19054]?.slice(0, 100))
console.log('Line 19055:', lines[19055]?.slice(0, 100))

// Let's check mezmur_id or import_id in that file
const header = lines[0].split(',')
console.log('Header:', header)
