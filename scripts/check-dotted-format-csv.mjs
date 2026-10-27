import { readFileSync } from 'node:fs'

const ids = [
  'dc02e125-e168-4e31-98ff-970a7aa0299b',
  'a70a38af-579f-44f5-94a9-a37e7faa2851',
  '801cc2bf-8109-4738-a79b-3ffc5e841fe8',
  'ab668ecf-bcdd-4cba-b421-e9377f0a4459'
]

for (const fn of [
  'C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv',
  'C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25 (1).csv'
]) {
  console.log('--- FILE:', fn, '---')
  const content = readFileSync(fn, 'utf8')
  for (const line of content.split(/\r?\n/)) {
    for (const id of ids) {
      if (line.includes(id)) {
        console.log(line)
      }
    }
  }
}
