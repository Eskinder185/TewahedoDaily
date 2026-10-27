import { readFileSync } from 'node:fs'

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

// Let's check mezmur_youtube_links.csv or similar in Downloads
const ytFile = 'C:/Users/eskew/Downloads/mezmur_youtube_links.csv'
const ytContent = readFileSync(ytFile, 'utf8')
for (const line of ytContent.split(/\r?\n/)) {
  if (line.includes('-dPoiLyBdug') || line.includes('share') || line.includes('MZHegl4Wrn4')) {
    console.log('yt line:', line)
  }
}
