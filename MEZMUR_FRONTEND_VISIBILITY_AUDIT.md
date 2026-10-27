# Mezmur frontend visibility audit

Date: 2026-10-27

## Public source of truth

The public browse and search catalog use the `public.mezmur_public` projection through `src/lib/publicContent/hymnBrowse.ts`. `selectAllImportRows()` requests explicit ranges of 500 rows and continues until a short page is returned; `listImportMezmurCards()` does not impose an artificial maximum when called by the catalog. Public rows are additionally required to have `status = 'published'` in the shared visibility helper.

Category, occasion, section, and singer pages start from the same published projection and then read the public relationship projections. Draft rows are not read by these paths.

## Production read-only observations

The authorized public REST audit returned:

| Check | Result |
| --- | ---: |
| Published rows in `mezmur_public` | 1,514 |
| Rows with Amharic lyrics | 1,458 |
| Rows with transliteration | 1,354 |
| Rows with YouTube URLs | 1,504 |
| Duplicate normalized slugs in the public projection | 0 |

The private-table comparison could not be completed with the configured publishable-key session. `public.mezmur_data_import` correctly returned SQLSTATE `42501` (permission denied). No public policy or RLS rule was changed to work around that result. Total imported rows, published imported rows, and the exact imported-to-public missing set require a staff or database-administrator SQL Editor session.

## Visibility risks found

1. The unified search path preferred the Search Buddy API and returned an empty result on API failure, even though the public Supabase projection was available. That made published hymns appear missing whenever the API was unavailable.
2. The local public search catalog and collection metadata were cached for five minutes and were not invalidated after a publish or return-to-draft operation.
3. Publication uses the UUID RPC when an import UUID is present and does not silently fall back to a non-unique slug. The local UUID migration remains unapplied; applying it is a separate, explicitly approved production action.

## Production follow-up SQL (read-only)

Run the following in Supabase SQL Editor as a database administrator or authorized staff role. Do not run it with the anonymous/publishable key and do not grant public access to the private table.

```sql
select 'import_total' as check_name, count(*)::bigint as value
from public.mezmur_data_import
union all
select 'import_published', count(*)
from public.mezmur_data_import
where lower(coalesce(status, '')) = 'published'
union all
select 'public_total', count(*)
from public.mezmur_public;

select lower(trim(slug)) as normalized_slug, count(*)
from public.mezmur_data_import
group by lower(trim(slug))
having count(*) > 1
order by count(*) desc, normalized_slug;

select mezmur_id, count(*)
from public.mezmur_data_import
group by mezmur_id
having count(*) > 1
order by count(*) desc, mezmur_id;

select i.import_id, i.mezmur_id, i.slug, i.title
from public.mezmur_data_import i
left join public.mezmur_public p on p.mezmur_id = i.mezmur_id
where lower(coalesce(i.status, '')) = 'published'
  and p.mezmur_id is null
order by i.updated_at nulls last, i.slug;
```

These queries are intentionally read-only and do not expose private rows to anonymous clients.
