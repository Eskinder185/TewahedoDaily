import { supabase } from '../src/lib/supabase/client.ts';

async function main() {
  const res1 = await supabase.from('mezmur_category_links_import').select('*').limit(5);
  console.log('catLinks error:', res1.error, 'data count:', res1.data?.length);

  const res2 = await supabase.from('mezmur_data_import').select('slug, category_slug, occasion_slug').limit(5);
  console.log('data_import error:', res2.error, 'sample:', res2.data);

  process.exit(0);
}
main();
