const fs = require('fs');
const cards = JSON.parse(fs.readFileSync('scripts/calendar_cards_dump.json', 'utf8'));
cards.forEach((c, i) => {
  console.log(`${i+1}. [${c.source_type}] ${c.slug} | ${c.title} (${c.title_amharic || ''})`);
});
