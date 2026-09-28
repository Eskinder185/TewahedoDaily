import amharic from '../../src/data/chants/amharic-chants.json'
import english from '../../src/data/chants/english-mezmur-chants.json'
// The current public fallback remains bundled JSON. Never import private CMS data here.
export function bundledMezmur(key: string) {
  const rows = [...amharic, ...english.entries] as { id: string; title: string; type: string; form?: string }[]
  return rows.findLast(row => `mezmur:${row.id}` === key && (row.type === 'mezmur' || row.form === 'mezmur'))
}
