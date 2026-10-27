const fs = require('fs')

// 1. Update en.json
const enPath = 'src/locales/en.json'
const en = JSON.parse(fs.readFileSync(enPath, 'utf8'))
en.calendar.page.historyHeading = 'Historical background & story'
en.calendar.page.theologyHeading = 'Theological meaning'
en.calendar.page.traditionsHeading = 'Traditions & practices'
en.calendar.page.mezmursHeading = 'Related Mezmurs'
en.calendar.page.prayersHeading = 'Related prayers & resources'
en.calendar.page.sourcesHeading = 'Authoritative sources & citations'
fs.writeFileSync(enPath, JSON.stringify(en, null, 2) + '\n', 'utf8')
console.log('Updated en.json with new calendar headings')

// 2. Update am.json
const amPath = 'src/locales/am.json'
const am = JSON.parse(fs.readFileSync(amPath, 'utf8'))
if (!am.calendar) am.calendar = {}
if (!am.calendar.page) am.calendar.page = {}
am.calendar.page.historyHeading = 'ታሪካዊ ዳራና ታሪኩ'
am.calendar.page.theologyHeading = 'ነገረ መለኮታዊ ትርጉም'
am.calendar.page.traditionsHeading = 'ባህሎችና ሥርዓታት'
am.calendar.page.mezmursHeading = 'ተዛማጅ መዝሙራት'
am.calendar.page.prayersHeading = 'ተዛማጅ ጸሎታትና ምንጮች'
am.calendar.page.sourcesHeading = 'ዋቢ መጻሕፍትና ማጣቀሻዎች'
fs.writeFileSync(amPath, JSON.stringify(am, null, 2) + '\n', 'utf8')
console.log('Updated am.json with new calendar headings')
