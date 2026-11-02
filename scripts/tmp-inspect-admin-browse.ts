import { listHymnCollections, listHymnSectionsForCollection } from '../src/lib/cms/hymnBrowseAdminService.ts';

async function main() {
  const cols = await listHymnCollections(true);
  console.log(`Found ${cols.length} collections in CMS:`);
  for (const c of cols) {
    const secs = await listHymnSectionsForCollection(c.id);
    console.log(`\nCollection: "${c.title}" (slug: "${c.slug}", id: "${c.id}") - ${secs.length} sections:`);
    for (const s of secs) {
      console.log(`  - Section: "${s.title}" (${s.title_amharic || 'no amharic'}) | slug: "${s.slug}"`);
    }
  }
  process.exit(0);
}
main();

