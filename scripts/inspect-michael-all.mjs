import { createClient } from '@supabase/supabase-js'

const url = process.env.VITE_SUPABASE_URL || process.env.SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY || process.env.SUPABASE_ANON_KEY

const supabase = createClient(url, key)

async function inspectMichael() {
  const { data: catLinks } = await supabase
    .from('mezmur_category_links_public')
    .select('*')
    .eq('category_slug', 'kidus-michael')

  const slugs = catLinks.map(l => l.mezmur_slug)
  const { data: mezmurs } = await supabase
    .from('mezmur_public')
    .select('slug, title, title_amharic, status')
    .in('slug', slugs)

  console.log(`Found ${catLinks.length} category links for kidus-michael:`)
  console.log(`Found ${mezmurs?.length} matching rows in mezmur_public:`)
  for (const m of mezmurs || []) {
    console.log(`- ${m.slug} | ${m.title} | ${m.title_amharic}`)
  }
}

inspectMichael()
