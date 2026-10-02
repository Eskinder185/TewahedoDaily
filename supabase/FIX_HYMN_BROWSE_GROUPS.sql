-- Hymns Practice Level-1 browse groups + Level-2 item mappings.
-- Depends on categories / singers / mezmur_occasions (see 20261002150000).
-- Safe to re-run via FIX_HYMN_BROWSE_GROUPS.sql.

begin;

create table if not exists public.hymn_browse_groups (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique
    check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null,
  title_amharic text,
  description text,
  description_amharic text,
  image_path text,
  image_alt text,
  sort_order integer not null default 0,
  status text not null default 'draft'
    check (status in ('draft', 'published', 'archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.hymn_browse_group_items (
  id uuid primary key default gen_random_uuid(),
  browse_group_id uuid not null
    references public.hymn_browse_groups(id) on delete cascade,
  item_type text not null
    check (item_type in ('occasion', 'category', 'singer', 'language', 'tag', 'manual')),
  item_id uuid,
  item_slug text,
  display_title text,
  display_title_amharic text,
  description text,
  description_amharic text,
  image_path text,
  image_alt text,
  sort_order integer not null default 0,
  status text not null default 'published'
    check (status in ('draft', 'published', 'archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists hymn_browse_group_items_group_idx
  on public.hymn_browse_group_items (browse_group_id, sort_order);

create unique index if not exists hymn_browse_group_items_unique_link_idx
  on public.hymn_browse_group_items (browse_group_id, item_type, item_slug)
  where item_slug is not null and status <> 'archived';

drop trigger if exists hymn_browse_groups_updated on public.hymn_browse_groups;
create trigger hymn_browse_groups_updated
  before update on public.hymn_browse_groups
  for each row execute function public.set_updated_at();

drop trigger if exists hymn_browse_group_items_updated on public.hymn_browse_group_items;
create trigger hymn_browse_group_items_updated
  before update on public.hymn_browse_group_items
  for each row execute function public.set_updated_at();

alter table public.hymn_browse_groups enable row level security;
alter table public.hymn_browse_group_items enable row level security;

grant select on public.hymn_browse_groups to anon, authenticated;
grant select on public.hymn_browse_group_items to anon, authenticated;
grant insert, update, delete on public.hymn_browse_groups to authenticated;
grant insert, update, delete on public.hymn_browse_group_items to authenticated;
grant all on public.hymn_browse_groups to service_role;
grant all on public.hymn_browse_group_items to service_role;

drop policy if exists hymn_browse_groups_public_read on public.hymn_browse_groups;
create policy hymn_browse_groups_public_read
  on public.hymn_browse_groups for select to anon, authenticated
  using (
    status = 'published'
    or coalesce(public.is_staff(), false)
    or cms_private.current_role() in ('editor', 'admin', 'super_admin')
  );

drop policy if exists hymn_browse_groups_staff_write on public.hymn_browse_groups;
create policy hymn_browse_groups_staff_write
  on public.hymn_browse_groups for all to authenticated
  using (
    coalesce(public.is_staff(), false)
    or cms_private.current_role() in ('editor', 'admin', 'super_admin')
  )
  with check (
    coalesce(public.is_staff(), false)
    or cms_private.current_role() in ('editor', 'admin', 'super_admin')
  );

drop policy if exists hymn_browse_group_items_public_read on public.hymn_browse_group_items;
create policy hymn_browse_group_items_public_read
  on public.hymn_browse_group_items for select to anon, authenticated
  using (
    status = 'published'
    or coalesce(public.is_staff(), false)
    or cms_private.current_role() in ('editor', 'admin', 'super_admin')
  );

drop policy if exists hymn_browse_group_items_staff_write on public.hymn_browse_group_items;
create policy hymn_browse_group_items_staff_write
  on public.hymn_browse_group_items for all to authenticated
  using (
    coalesce(public.is_staff(), false)
    or cms_private.current_role() in ('editor', 'admin', 'super_admin')
  )
  with check (
    coalesce(public.is_staff(), false)
    or cms_private.current_role() in ('editor', 'admin', 'super_admin')
  );

-- Seed major browse groups
insert into public.hymn_browse_groups (slug, title, title_amharic, description, sort_order, status, image_alt)
values
  ('holidays-feasts', 'Holidays & Feasts', null, 'Browse hymns for major feasts and holy days.', 10, 'published', 'Holidays and Feasts'),
  ('angels-saints', 'Angels & Saints', null, 'Hymns for holy angels, apostles, martyrs, and saints.', 20, 'published', 'Angels and Saints'),
  ('virgin-mary', 'Virgin Mary', null, 'Marian praise and feast hymns.', 30, 'published', 'Virgin Mary'),
  ('jesus-christ', 'Jesus Christ', null, 'Hymns of Christ — nativity, passion, and glory.', 40, 'published', 'Jesus Christ'),
  ('repentance-fasting', 'Repentance & Fasting', null, 'Hymns for fasting seasons and repentance.', 50, 'published', 'Repentance and Fasting'),
  ('english-mezmur', 'English Mezmur', null, 'English-language Mezmur for practice and learning.', 60, 'published', 'English Mezmur'),
  ('sacraments-church-life', 'Sacraments & Church Life', null, 'Wedding, communion, baptism, and parish life.', 70, 'published', 'Sacraments and Church Life'),
  ('praise-general', 'Praise & General', null, 'General praise, short hymns, and everyday worship.', 80, 'published', 'Praise and General'),
  ('zemari-singers', 'Zemari / Singers', null, 'Browse Mezmur by singer (zemari).', 90, 'published', 'Zemari and Singers')
on conflict (slug) do update set
  title = excluded.title,
  description = coalesce(public.hymn_browse_groups.description, excluded.description),
  sort_order = excluded.sort_order,
  status = case
    when public.hymn_browse_groups.status = 'archived' then public.hymn_browse_groups.status
    else excluded.status
  end,
  updated_at = now();

-- Helper: upsert a group item by group slug + item type/slug
create or replace function cms_private.upsert_hymn_browse_item(
  p_group_slug text,
  p_item_type text,
  p_item_slug text,
  p_sort integer,
  p_display_title text default null,
  p_display_amharic text default null
) returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  g_id uuid;
  linked_id uuid;
begin
  select id into g_id from public.hymn_browse_groups where slug = p_group_slug;
  if g_id is null then
    return;
  end if;

  linked_id := null;
  if p_item_type = 'occasion' then
    select id into linked_id from public.mezmur_occasions where slug = p_item_slug limit 1;
  elsif p_item_type = 'category' then
    select id into linked_id from public.categories where slug = p_item_slug limit 1;
  elsif p_item_type = 'singer' then
    select id into linked_id from public.singers where slug = p_item_slug limit 1;
  elsif p_item_type = 'tag' then
    select id into linked_id from public.tags where slug = p_item_slug limit 1;
  end if;

  -- Skip occasion/category/singer/tag mappings when the target taxonomy row is missing
  if p_item_type in ('occasion', 'category', 'singer', 'tag') and linked_id is null then
    return;
  end if;

  update public.hymn_browse_group_items i
  set
    item_id = coalesce(linked_id, i.item_id),
    display_title = coalesce(i.display_title, p_display_title),
    display_title_amharic = coalesce(i.display_title_amharic, p_display_amharic),
    sort_order = p_sort,
    status = 'published',
    updated_at = now()
  where i.browse_group_id = g_id
    and i.item_type = p_item_type
    and i.item_slug = p_item_slug;

  if not found then
    insert into public.hymn_browse_group_items (
      browse_group_id, item_type, item_id, item_slug,
      display_title, display_title_amharic, sort_order, status
    )
    values (
      g_id, p_item_type, linked_id, p_item_slug,
      p_display_title, p_display_amharic, p_sort, 'published'
    );
  end if;
end;
$$;

revoke all on function cms_private.upsert_hymn_browse_item(text, text, text, integer, text, text) from public;
grant execute on function cms_private.upsert_hymn_browse_item(text, text, text, integer, text, text) to authenticated, service_role;

-- Holidays & Feasts (occasions with real feast data)
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'meskel', 10);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'hosanna', 20);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'new-year', 30);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'gena', 40);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'timket', 50);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'tinsae', 60);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'debre-tabor', 70);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'filseta', 80);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'siklet', 90);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'erget', 100);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'pentecost', 110);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'holy-week', 120);
select cms_private.upsert_hymn_browse_item('holidays-feasts', 'occasion', 'kidane-mihret', 130);

-- Angels & Saints (category slugs from published mezmur.category text)
select cms_private.upsert_hymn_browse_item('angels-saints', 'category', 'kidus-michael', 10);
select cms_private.upsert_hymn_browse_item('angels-saints', 'category', 'kidus-gabriel', 20);
select cms_private.upsert_hymn_browse_item('angels-saints', 'category', 'angels', 30);
select cms_private.upsert_hymn_browse_item('angels-saints', 'category', 'saints', 40);
select cms_private.upsert_hymn_browse_item('angels-saints', 'category', 'apostles', 50);
select cms_private.upsert_hymn_browse_item('angels-saints', 'category', 'holy-trinity', 60);
select cms_private.upsert_hymn_browse_item('angels-saints', 'category', 'abune-tekle-haymanot', 70);
select cms_private.upsert_hymn_browse_item('angels-saints', 'category', 'kidus-estifanos', 80);
select cms_private.upsert_hymn_browse_item('angels-saints', 'category', 'cross', 90);

-- Virgin Mary
select cms_private.upsert_hymn_browse_item('virgin-mary', 'category', 'virgin-mary', 10);
select cms_private.upsert_hymn_browse_item('virgin-mary', 'occasion', 'filseta', 20);
select cms_private.upsert_hymn_browse_item('virgin-mary', 'occasion', 'lideta-maryam', 30);
select cms_private.upsert_hymn_browse_item('virgin-mary', 'occasion', 'kidane-mihret', 40);

-- Jesus Christ
select cms_private.upsert_hymn_browse_item('jesus-christ', 'category', 'jesus-christ', 10);
select cms_private.upsert_hymn_browse_item('jesus-christ', 'occasion', 'gena', 20);
select cms_private.upsert_hymn_browse_item('jesus-christ', 'occasion', 'timket', 30);
select cms_private.upsert_hymn_browse_item('jesus-christ', 'occasion', 'hosanna', 40);
select cms_private.upsert_hymn_browse_item('jesus-christ', 'occasion', 'siklet', 50);
select cms_private.upsert_hymn_browse_item('jesus-christ', 'occasion', 'tinsae', 60);
select cms_private.upsert_hymn_browse_item('jesus-christ', 'occasion', 'erget', 70);
select cms_private.upsert_hymn_browse_item('jesus-christ', 'occasion', 'debre-tabor', 80);

-- Repentance & Fasting
select cms_private.upsert_hymn_browse_item('repentance-fasting', 'category', 'repentance', 10);
select cms_private.upsert_hymn_browse_item('repentance-fasting', 'occasion', 'repentance', 20);
select cms_private.upsert_hymn_browse_item('repentance-fasting', 'occasion', 'abiy-tsom', 30);
select cms_private.upsert_hymn_browse_item('repentance-fasting', 'occasion', 'tsome-nineveh', 40);
select cms_private.upsert_hymn_browse_item('repentance-fasting', 'occasion', 'holy-week', 50);

-- English Mezmur (language facet)
select cms_private.upsert_hymn_browse_item('english-mezmur', 'language', 'english', 10, 'English', null);
select cms_private.upsert_hymn_browse_item('english-mezmur', 'language', 'bilingual', 20, 'Bilingual', null);

-- Sacraments & Church Life
select cms_private.upsert_hymn_browse_item('sacraments-church-life', 'occasion', 'wedding', 10);
select cms_private.upsert_hymn_browse_item('sacraments-church-life', 'occasion', 'communion', 20);
select cms_private.upsert_hymn_browse_item('sacraments-church-life', 'occasion', 'baptism', 30);
select cms_private.upsert_hymn_browse_item('sacraments-church-life', 'occasion', 'funeral', 40);
select cms_private.upsert_hymn_browse_item('sacraments-church-life', 'occasion', 'sunday-school', 50);

-- Praise & General
select cms_private.upsert_hymn_browse_item('praise-general', 'category', 'praise-worship', 10);
select cms_private.upsert_hymn_browse_item('praise-general', 'category', 'general', 20);
select cms_private.upsert_hymn_browse_item('praise-general', 'occasion', 'praise', 30);
select cms_private.upsert_hymn_browse_item('praise-general', 'occasion', 'general', 40);
select cms_private.upsert_hymn_browse_item('praise-general', 'occasion', 'short-hymns', 50);
select cms_private.upsert_hymn_browse_item('praise-general', 'occasion', 'sunday-school', 60);

-- Zemari: leave items empty — public UI lists singers dynamically from singers table

-- ---------------------------------------------------------------------------
-- Efficient public views (no N+1)
-- ---------------------------------------------------------------------------
create or replace view public.hymn_browse_groups_public as
select
  g.id,
  g.slug,
  g.title,
  g.title_amharic,
  g.description,
  g.description_amharic,
  g.image_path,
  g.image_alt,
  g.sort_order,
  coalesce(counts.mezmur_count, 0)::int as mezmur_count,
  coalesce(counts.child_count, 0)::int as child_count
from public.hymn_browse_groups g
left join lateral (
  select
    count(distinct mid)::int as mezmur_count,
    count(distinct item_key)::int as child_count
  from (
    select
      i.id::text as item_key,
      case
        when i.item_type = 'occasion' then mol.mezmur_id
        when i.item_type = 'category' then mcat.id
        when i.item_type = 'singer' then msing.id
        when i.item_type = 'language' and lower(coalesce(i.item_slug, '')) = 'english' then meng.id
        when i.item_type = 'language' and lower(coalesce(i.item_slug, '')) = 'bilingual' then mbi.id
        else null
      end as mid
    from public.hymn_browse_group_items i
    left join public.mezmur_occasion_links mol
      on i.item_type = 'occasion'
     and (
       mol.occasion_id = i.item_id
       or mol.occasion_id in (select o.id from public.mezmur_occasions o where o.slug = i.item_slug)
     )
    left join public.mezmur mcat
      on i.item_type = 'category'
     and mcat.status = 'published'
     and (
       mcat.category_id = i.item_id
       or (
         mcat.category is not null
         and left(regexp_replace(lower(trim(mcat.category)), '[^a-z0-9]+', '-', 'g'), 80) = i.item_slug
       )
     )
    left join public.mezmur msing
      on i.item_type = 'singer'
     and msing.status = 'published'
     and msing.singer_id = i.item_id
    left join public.mezmur meng
      on i.item_type = 'language'
     and lower(coalesce(i.item_slug, '')) = 'english'
     and meng.status = 'published'
     and lower(coalesce(meng.language, '')) = 'english'
    left join public.mezmur mbi
      on i.item_type = 'language'
     and lower(coalesce(i.item_slug, '')) = 'bilingual'
     and mbi.status = 'published'
     and lower(coalesce(mbi.language, '')) in ('bilingual', 'both', 'amharic-english')
    where i.browse_group_id = g.id
      and i.status = 'published'
  ) x
  where g.slug <> 'zemari-singers'
) counts on true
where g.status = 'published';

-- Simpler group list without lateral complexity for zemari (singer counts)
create or replace view public.hymn_major_browse_groups as
select
  g.id,
  g.slug,
  g.title,
  g.title_amharic,
  g.description,
  g.description_amharic,
  g.image_path,
  g.image_alt,
  g.sort_order,
  case
    when g.slug = 'zemari-singers' then (
      select count(m.id)::int
      from public.mezmur m
      where m.status = 'published' and m.singer_id is not null
    )
    when g.slug = 'english-mezmur' then (
      select count(m.id)::int
      from public.mezmur m
      where m.status = 'published' and lower(coalesce(m.language, '')) = 'english'
    )
    else coalesce((
      select count(distinct mid)::int from (
        select mol.mezmur_id as mid
        from public.hymn_browse_group_items i
        join public.mezmur_occasions o
          on i.item_type = 'occasion'
         and (o.id = i.item_id or o.slug = i.item_slug)
        join public.mezmur_occasion_links mol on mol.occasion_id = o.id
        join public.mezmur m on m.id = mol.mezmur_id and m.status = 'published'
        where i.browse_group_id = g.id and i.status = 'published'
        union
        select m.id
        from public.hymn_browse_group_items i
        join public.categories c
          on i.item_type = 'category'
         and (c.id = i.item_id or c.slug = i.item_slug)
        join public.mezmur m on m.status = 'published'
         and (
           m.category_id = c.id
           or left(regexp_replace(lower(trim(coalesce(m.category, ''))), '[^a-z0-9]+', '-', 'g'), 80) = c.slug
         )
        where i.browse_group_id = g.id and i.status = 'published'
      ) u
    ), 0)
  end as mezmur_count
from public.hymn_browse_groups g
where g.status = 'published';

create or replace view public.hymn_browse_group_children as
select
  g.id as browse_group_id,
  g.slug as browse_group_slug,
  i.id as item_id_row,
  i.item_type,
  i.item_id,
  i.item_slug,
  coalesce(
    nullif(trim(i.display_title), ''),
    o.name,
    c.name,
    s.name,
    case when i.item_type = 'language' then initcap(replace(coalesce(i.item_slug, ''), '-', ' ')) end,
    i.item_slug,
    'Collection'
  ) as title,
  coalesce(
    nullif(trim(i.display_title_amharic), ''),
    o.name_amharic,
    c.name_amharic,
    s.name_amharic
  ) as title_amharic,
  coalesce(nullif(trim(i.description), ''), o.description, c.description) as description,
  coalesce(i.image_path, o.image_path, c.image_path, s.image_path, s.image_url) as image_path,
  coalesce(i.image_alt, o.image_alt, c.image_alt, s.image_alt) as image_alt,
  i.sort_order,
  case
    when i.item_type = 'occasion' then coalesce((
      select count(*)::int from public.mezmur_occasion_links l
      join public.mezmur m on m.id = l.mezmur_id and m.status = 'published'
      where l.occasion_id = coalesce(i.item_id, o.id)
    ), 0)
    when i.item_type = 'category' then coalesce((
      select count(*)::int from public.mezmur m
      where m.status = 'published'
        and (
          m.category_id = coalesce(i.item_id, c.id)
          or left(regexp_replace(lower(trim(coalesce(m.category, ''))), '[^a-z0-9]+', '-', 'g'), 80)
            = coalesce(i.item_slug, c.slug)
        )
    ), 0)
    when i.item_type = 'singer' then coalesce((
      select count(*)::int from public.mezmur m
      where m.status = 'published' and m.singer_id = coalesce(i.item_id, s.id)
    ), 0)
    when i.item_type = 'language' and lower(coalesce(i.item_slug, '')) = 'english' then (
      select count(*)::int from public.mezmur m
      where m.status = 'published' and lower(coalesce(m.language, '')) = 'english'
    )
    when i.item_type = 'language' then (
      select count(*)::int from public.mezmur m
      where m.status = 'published'
        and lower(coalesce(m.language, '')) in ('bilingual', 'both', 'amharic-english')
    )
    else 0
  end as mezmur_count,
  case
    when i.item_type = 'occasion' then '/practice/occasion/' || coalesce(i.item_slug, o.slug)
    when i.item_type = 'category' then '/practice/category/' || coalesce(i.item_slug, c.slug)
    when i.item_type = 'singer' then '/practice/singer/' || coalesce(i.item_slug, s.slug)
    when i.item_type = 'language' then '/practice?language=' || coalesce(i.item_slug, 'english')
    else '/practice/browse/' || g.slug
  end as href
from public.hymn_browse_group_items i
join public.hymn_browse_groups g on g.id = i.browse_group_id
left join public.mezmur_occasions o
  on i.item_type = 'occasion' and (o.id = i.item_id or o.slug = i.item_slug)
left join public.categories c
  on i.item_type = 'category' and (c.id = i.item_id or c.slug = i.item_slug)
left join public.singers s
  on i.item_type = 'singer' and (s.id = i.item_id or s.slug = i.item_slug)
where i.status = 'published'
  and g.status = 'published';

grant select on public.hymn_browse_groups_public to anon, authenticated;
grant select on public.hymn_major_browse_groups to anon, authenticated;
grant select on public.hymn_browse_group_children to anon, authenticated;

commit;
