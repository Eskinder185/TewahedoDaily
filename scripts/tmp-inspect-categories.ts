import { supabase } from '../src/lib/supabase/client.ts';

async function main() {
  const { data: cols } = await supabase.from('mezmur_collections_import').select('*').limit(1);
  console.log('Collection keys:', Object.keys(cols?.[0] || {}));
  console.log('Collection sample row:', cols?.[0]);

  const { data: secs } = await supabase.from('mezmur_sections_import').select('*').limit(1);
  console.log('Section keys:', Object.keys(secs?.[0] || {}));
  console.log('Section sample row:', secs?.[0]);

  process.exit(0);
}
main();
