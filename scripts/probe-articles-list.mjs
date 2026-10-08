/**
 * Verify Learn catalog listContent survives missing articles.description (TD-01).
 * Run: npx tsx --env-file-if-exists=.env.local scripts/probe-articles-list.mjs
 */
import { listContent } from '../src/lib/cms/contentService.ts'

const result = await listContent('articles', '', 'published', 1, '')
console.log(
  JSON.stringify({
    ok: true,
    total: result.total,
    items: result.items.length,
    sample: result.items[0]
      ? {
          slug: result.items[0].slug,
          title: result.items[0].title,
          description: result.items[0].description ?? null,
          teaching_category: result.items[0].teaching_category ?? null,
        }
      : null,
  }),
)
