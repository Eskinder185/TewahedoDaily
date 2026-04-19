import { CHANT_LIBRARY } from '../src/lib/practice/chantLibrary.js'
import { loadAllChantData } from '../src/lib/practice/chantDataLoader.js'

console.log('=== ORIGINAL STATIC SYSTEM ===')
console.log('Total entries:', CHANT_LIBRARY.length)

const mezmurCount = CHANT_LIBRARY.filter(e => e.form === 'mezmur').length
const werbCount = CHANT_LIBRARY.filter(e => e.form === 'werb').length

console.log('Mezmur entries:', mezmurCount)
console.log('Werb entries:', werbCount)
console.log('')

console.log('=== DYNAMIC LOADING SYSTEM ===')
loadAllChantData().then(({ mezmur, werb }) => {
  console.log('Loaded mezmur entries:', mezmur.length)
  console.log('Loaded werb entries:', werb.length)
  console.log('Total loaded:', mezmur.length + werb.length)
}).catch(console.error)