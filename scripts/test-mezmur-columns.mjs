import { supabase } from '../src/lib/supabase/client.ts'

async function run() {
  if (!supabase) return
  const { data, error } = await supabase.from('mezmur_public').select('*').limit(1)
  if (error) {
    console.error('Error selecting *:', error)
  } else {
    console.log('Columns on mezmur_public:', Object.keys(data[0] || {}))
  }
}

run().catch(console.error)
