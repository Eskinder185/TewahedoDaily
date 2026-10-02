-- Prayer educational guides (Learn How to Pray, Order of Prayer, future guides).
-- Additive: does not modify existing prayer book tables.

begin;

create extension if not exists pgcrypto;

create table if not exists public.prayer_guides (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null check (length(trim(title)) > 0),
  title_amharic text,
  summary text,
  summary_amharic text,
  status public.content_status not null default 'draft',
  sort_order integer not null default 0,
  source_title text,
  source_reference text,
  review_status text not null default 'draft'
    check (review_status in ('draft', 'needs_review', 'reviewed')),
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.prayer_guide_sections (
  id uuid primary key default gen_random_uuid(),
  guide_id uuid not null references public.prayer_guides(id) on delete cascade,
  slug text not null check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null check (length(trim(title)) > 0),
  title_amharic text,
  body_english text,
  body_amharic text,
  sort_order integer not null default 0,
  source_reference text,
  review_status text not null default 'draft'
    check (review_status in ('draft', 'needs_review', 'reviewed')),
  review_notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (guide_id, slug)
);

create index if not exists prayer_guides_published_sort_idx
  on public.prayer_guides (sort_order, slug)
  where status = 'published';

create index if not exists prayer_guides_status_idx
  on public.prayer_guides (status, updated_at desc);

create index if not exists prayer_guide_sections_guide_sort_idx
  on public.prayer_guide_sections (guide_id, sort_order, slug);

create index if not exists prayer_guide_sections_review_idx
  on public.prayer_guide_sections (review_status);

drop trigger if exists prayer_guides_set_updated_at on public.prayer_guides;
create trigger prayer_guides_set_updated_at
  before update on public.prayer_guides
  for each row execute function public.set_updated_at();

drop trigger if exists prayer_guide_sections_set_updated_at on public.prayer_guide_sections;
create trigger prayer_guide_sections_set_updated_at
  before update on public.prayer_guide_sections
  for each row execute function public.set_updated_at();

alter table public.prayer_guides enable row level security;
alter table public.prayer_guide_sections enable row level security;

revoke all on public.prayer_guides from public, anon, authenticated;
revoke all on public.prayer_guide_sections from public, anon, authenticated;

grant select on public.prayer_guides, public.prayer_guide_sections to anon, authenticated;
grant insert, update, delete on public.prayer_guides, public.prayer_guide_sections to authenticated;
grant all on public.prayer_guides, public.prayer_guide_sections to service_role;

-- Ensure is_staff() exists for CMS writes (same bootstrap as mezmur save migrations).
do $$
begin
  if to_regprocedure('public.is_staff()') is null then
    execute $fn$
      create function public.is_staff()
      returns boolean
      language sql
      stable
      security definer
      set search_path = public
      as $body$
        select coalesce(
          (select role in ('editor', 'admin', 'super_admin')
           from public.profiles
           where id = auth.uid()),
          false
        );
      $body$;
    $fn$;
    revoke all on function public.is_staff() from public, anon;
    grant execute on function public.is_staff() to authenticated, anon;
  end if;
end $$;

drop policy if exists prayer_guides_public_read on public.prayer_guides;
create policy prayer_guides_public_read
  on public.prayer_guides for select to anon, authenticated
  using (
    status = 'published'
    or coalesce(public.is_staff(), false)
  );

drop policy if exists prayer_guides_staff_write on public.prayer_guides;
create policy prayer_guides_staff_write
  on public.prayer_guides for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists prayer_guide_sections_public_read on public.prayer_guide_sections;
create policy prayer_guide_sections_public_read
  on public.prayer_guide_sections for select to anon, authenticated
  using (
    exists (
      select 1
      from public.prayer_guides g
      where g.id = guide_id
        and (
          g.status = 'published'
          or coalesce(public.is_staff(), false)
        )
    )
  );

drop policy if exists prayer_guide_sections_staff_write on public.prayer_guide_sections;
create policy prayer_guide_sections_staff_write
  on public.prayer_guide_sections for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

commit;
-- Seed prayer guides from data/tewahedo_prayer_resources.csv
-- Idempotent upserts by slug / (guide_id, section slug).
begin;

-- Guide: learn-how-to-pray
insert into public.prayer_guides (
  slug, title, title_amharic, summary, summary_amharic, status, sort_order, source_title, source_reference, review_status, published_at
) values (
  'learn-how-to-pray',
  'Learn How to Pray',
  'áŠ¥áŠ•á‹´á‰µ áˆ˜áŒ¸áˆˆá‹­ áŠ¥áŠ•á‹°áˆšáŒˆá‰£',
  'A practical guide to prayer and preparing for church in the Ethiopian Orthodox Tewahedo tradition.',
  'á‹ˆá‹° á‰¤á‰° áŠ­áˆ­áˆµá‰²á‹«áŠ• áˆˆáˆ˜áˆ”á‹µáŠ“ á‰…á‹³áˆ´ áˆˆáˆ›áˆµá‰€á‹°áˆµ á‹¨áˆšá‹°áˆ¨áŒ‰ áˆµáˆ­áŠ á‰° á‰¤á‰° áŠ­áˆ­áˆµá‰²á‹«áŠ•á¢',
  'published'::public.content_status,
  10,
  'User-provided Amharic text',
  null,
  'needs_review',
  now()
)
on conflict (slug) do update set
  title = excluded.title,
  title_amharic = excluded.title_amharic,
  summary = excluded.summary,
  summary_amharic = excluded.summary_amharic,
  status = excluded.status,
  sort_order = excluded.sort_order,
  source_title = excluded.source_title,
  review_status = excluded.review_status,
  published_at = coalesce(public.prayer_guides.published_at, excluded.published_at),
  updated_at = now();

insert into public.prayer_guide_sections (
  guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes
)
select g.id,
  'preparing',
  'Preparing to Go to Church',
  'áˆˆá‰¤á‰° áŠ­áˆ­áˆµá‰²á‹«áŠ• áˆ˜á‹˜áŒ‹áŒ€á‰µ',
  'When we wake from sleep, we wash our faces, keep ourselves clean, wear white Christian clothing, and go to church.',
  '1.. á‰ áˆ˜áŒ€áˆ˜áˆªá‹«áŠ¨áŠ¥áŠ•á‰…áˆá áˆµáŠ•áŠáˆ³ áŠá‰³á‰½áŠ• á‰³áŒ¥á‰ áŠ• áŠ•á…áˆ…áŠ“á‰½áŠ• áŒ á‰¥á‰€áŠ• áŠ­áˆ­áˆµá‰²á‹«áŠ“á‹Š áˆá‰¥áˆµ áŠáŒ­ áˆˆá‰¥áˆ°áŠ• áˆ˜áˆ”á‹µ::',
  1,
  'User-provided Amharic text',
  'needs_review',
  null
from public.prayer_guides g
where g.slug = 'learn-how-to-pray'
on conflict (guide_id, slug) do update set
  title = excluded.title,
  title_amharic = excluded.title_amharic,
  body_english = excluded.body_english,
  body_amharic = excluded.body_amharic,
  sort_order = excluded.sort_order,
  source_reference = excluded.source_reference,
  review_status = excluded.review_status,
  review_notes = excluded.review_notes,
  updated_at = now();

insert into public.prayer_guide_sections (
  guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes
)
select g.id,
  'grounds',
  'Entering the Church Grounds',
  'á‹ˆá‹° á‰¤á‰° áŠ­áˆ­áˆµá‰²á‹«áŠ• áŒá‰¢ áˆ²á‹°áˆ­áˆ±',
  'When we reach the church grounds, the step we cross is called â€œáˆ˜á‰ƒáˆá‹µáˆ­â€ in the source. We step with our right foot first.',
  '2.. áŠ¨á‰¤á‰° áŠ­áˆ­áˆµá‰²á‹«áŠ• á‰…áŒ¥áˆ­ áŒá‰¢ áˆµáŠ•á‹°áˆ­áˆµ áŠ¥áˆáŠ•áˆ«áˆ˜á‹°á‹ á‹°áˆ¨áŒƒ á‰ á‰¤á‰° áŠ­áˆ­áˆµá‰²á‹«áŠ• áˆ˜á‰ƒáˆá‹µáˆ­ á‹­á‰£áˆ‹áˆ: áŠ¥áˆ±áŠ• áˆµáŠ•áˆ«áˆ˜á‹µ áŠ¥áˆáŠ“áˆµá‰€á‹µáˆ˜á‹ á‰€áŠ áŠ¥áŒáˆ«á‰½áŠ•áŠ• áŠá‹::',
  2,
  'User-provided Amharic text',
  'needs_review',
  'Verify the term áˆ˜á‰ƒáˆá‹µáˆ­ and this step against the original source.'
from public.prayer_guides g
where g.slug = 'learn-how-to-pray'
on conflict (guide_id, slug) do update set
  title = excluded.title,
  title_amharic = excluded.title_amharic,
  body_english = excluded.body_english,
  body_amharic = excluded.body_amharic,
  sort_order = excluded.sort_order,
  source_reference = excluded.source_reference,
  review_status = excluded.review_status,
  review_notes = excluded.review_notes,
  updated_at = now();

insert into public.prayer_guide_sections (
  guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes
)
select g.id,
  'entering',
  'Entering the Church',
  'á‹ˆá‹° á‰¤á‰° áŠ­áˆ­áˆµá‰²á‹«áŠ• áˆ˜áŒá‰£á‰µ',
  'As we enter, we kiss the door.',
  '3.. á‹ˆá‹° á‹áŒ¥ áˆµáŠ•áŒˆá‰£á‰ áˆ©áŠ• áˆ˜áˆ³áˆˆáˆ::',
  3,
  'User-provided Amharic text',
  'needs_review',
  'The phrase á‹ˆá‹° á‹áŒ¥ appears unclear; Amharic preserved verbatim.'
from public.prayer_guides g
where g.slug = 'learn-how-to-pray'
on conflict (guide_id, slug) do update set
  title = excluded.title,
  title_amharic = excluded.title_amharic,
  body_english = excluded.body_english,
  body_amharic = excluded.body_amharic,
  sort_order = excluded.sort_order,
  source_reference = excluded.source_reference,
  review_status = excluded.review_status,
  review_notes = excluded.review_notes,
  updated_at = now();

insert into public.prayer_guide_sections (
  guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes
)
select g.id,
  'sanctuary',
  'At the Entrance of the Sanctuary',
  'á‰ á‰¤á‰° áˆ˜á‰…á‹°áˆ± á‰ áˆ­',
  'When we reach the door of the Bet Mekdes, we bow three times. We make the sign of the Cross three times in the name of the Father, the Son, and the Holy Spirit.

O Church, I greet you with peace, for you are fashioned in the likeness of Jerusalem.',
  '4.. á‰¤á‰° áˆ˜á‰…á‹°áˆ± á‰ áˆ­ áˆµáŠ•á‹°áˆ­áˆµ 3 áŒŠá‹œ áŠ¥á‹¨áˆ°áŒˆá‹µáŠ• áŠ¥áˆáŠ•áˆˆá‹: á‰ áŠ á‰¥ á‰ á‹ˆáˆ á‰ áˆ˜áŠ•áˆáˆµ á‰…á‹±áˆµáˆ áˆµáˆ áŠá‰µáŠ• áˆ¶áˆµá‰µ áŒŠá‹œ á‰ áˆ›áˆ›á‰°á‰¥ á‹ˆá‹­áˆ á‰ áˆ˜á‰£áˆ¨áŠ­ á‰¤á‰° áŠ­áˆ­áˆµá‰²á‹«áŠ• áˆ†á‹­ áˆ°áˆ‹áˆ áŠ¥áˆáˆ»áˆˆáˆ á‰ áŠ¢á‹¨áˆ©áˆ³áˆŒáˆ áŠ áˆáˆ³áˆ á‰°áŒ½áˆáˆ»áˆáŠ“ á‰¥áˆˆáŠ• áŠá‰³á‰½áŠ•áŠ• áˆ¶áˆµá‰µ áŒŠá‹œ á‰£áˆ­áŠ¨áŠ• á‹¨áˆ•áˆŠáŠ“áŒ¸áˆŽá‰µ',
  4,
  'User-provided Amharic text',
  'needs_review',
  'Check possible typing errors including á‰ á‹ˆáˆ and á‰ áˆ›áˆ›á‰°á‰¥; translation is a draft.'
from public.prayer_guides g
where g.slug = 'learn-how-to-pray'
on conflict (guide_id, slug) do update set
  title = excluded.title,
  title_amharic = excluded.title_amharic,
  body_english = excluded.body_english,
  body_amharic = excluded.body_amharic,
  sort_order = excluded.sort_order,
  source_reference = excluded.source_reference,
  review_status = excluded.review_status,
  review_notes = excluded.review_notes,
  updated_at = now();

insert into public.prayer_guide_sections (
  guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes
)
select g.id,
  'thanksgiving',
  'Thanksgiving Prayer',
  'áˆáŒ‹áŠ“',
  'We pray inwardly: We thank You for guarding us from the day we were born until today, for giving us health and life, and for allowing us to see the light of this day.',
  'áˆáŒ‹áŠ“
áŠ¥áŠ•áŒ¸áˆá‹«áˆˆáŠ• áŒ¸áˆŽá‰³á‰½áŠ• áŠ¨á‰°á‹ˆáˆˆá‹µáŠ•á‰ á‰µ áŒ€áˆáˆ® áŠ¥áˆµáŠ¨ á‹›áˆ¬ á‹µáˆ¨áˆµ á‹¨áŒ á‰ á‰€áŠáŠ• á‹¨áˆ˜áŒˆáŠáŠ• áŒ¤áŠ“ á‹¨áˆ°áŒ áŠ•áŠ• áŠ¥áŠ•á‹µáŠ•áŠ–áˆ­ á‹¨á‹›áˆ¬á‹¨á‹‹áŠ• á‰¥áˆ­áˆƒáŠ• áŠ¥áŠ•á‹µáŠ“á‹­ áˆµáˆˆáˆá‰€áŠ­áˆáŠ•::
áŠ¥áŠ“áˆ˜áˆ°áŒáŠ“áˆˆáŠ•::',
  5,
  'User-provided Amharic text',
  'needs_review',
  'Check áˆáŒ‹áŠ“, á‹¨áˆ˜áŒˆáŠáŠ•, and other possible typing errors against the original.'
from public.prayer_guides g
where g.slug = 'learn-how-to-pray'
on conflict (guide_id, slug) do update set
  title = excluded.title,
  title_amharic = excluded.title_amharic,
  body_english = excluded.body_english,
  body_amharic = excluded.body_amharic,
  sort_order = excluded.sort_order,
  source_reference = excluded.source_reference,
  review_status = excluded.review_status,
  review_notes = excluded.review_notes,
  updated_at = now();

insert into public.prayer_guide_sections (
  guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes
)
select g.id,
  'supplication',
  'Supplication Prayer',
  'áˆáˆ˜áŠ“',
  'O God, You have added to my years and kept me in blessing until now. Bless the rest of my days more than those that have passed, and keep me in health. Christ, Savior of the World, who heard my prayer yesterday, guard me from temptation now and keep me in peace.

Amen.',
  'áˆáˆ˜áŠ“
áŠ¥áŒá‹šáŠ á‰¥áˆ”áˆ­ áˆ†á‹­ á‰ áŠ¥á‹µáˆœá‹¨ áˆˆá‹­ áŒ¨áˆáˆ¨áˆ… áŠ¥áˆµáŠ«áˆáŠ• á‰ á‰ áˆ¨áŠ¨á‰µ á‹¨áŒ á‰ á‰€áŠ áŠ áˆáˆ‹áŠ­ á‰€áˆª á‹˜áˆ˜áŠ” áŠ¨áŠ¥áˆµáŠ¨ áŠ áˆáŠ‘ á‹¨á‰ áˆˆáŒ  á‰£áˆ­áŠ­áˆ… á‰ áŒ¤áŠ“ áŠ áŠ‘áˆ¨áŠ: á‰µáˆ‹áŠ•á‰µ áŒ½áŠ¥áˆŽá‰´áŠ• á‹¨áˆ°áˆ›áˆ… áˆ˜á‹µáŠƒáŠ”á‹“áˆˆáˆ áŠ­áˆ­áˆµá‰¶áˆµ áŠ áˆáŠ•áˆ áŠ¨áˆá‰°áŠ“ áŒ á‰¥á‰€áˆ… á‰ áˆ°áˆ‹áˆ áŠ áŠ‘áˆ¨áŠ::
á‹“áˆœáŠ•::',
  6,
  'User-provided Amharic text',
  'needs_review',
  'Check apparent typing errors, especially áŠ¨áŠ¥áˆµáŠ¨ and áŒ½áŠ¥áˆŽá‰´áŠ•; translation is a draft.'
from public.prayer_guides g
where g.slug = 'learn-how-to-pray'
on conflict (guide_id, slug) do update set
  title = excluded.title,
  title_amharic = excluded.title_amharic,
  body_english = excluded.body_english,
  body_amharic = excluded.body_amharic,
  sort_order = excluded.sort_order,
  source_reference = excluded.source_reference,
  review_status = excluded.review_status,
  review_notes = excluded.review_notes,
  updated_at = now();

-- Guide: the-order-of-prayer
insert into public.prayer_guides (
  slug, title, title_amharic, summary, summary_amharic, status, sort_order, source_title, source_reference, review_status, published_at
) values (
  'the-order-of-prayer',
  'The Order of Prayer',
  'á‹¨áŒ¸áˆŽá‰µ áˆ¥áˆ­á‹“á‰µ',
  'Source material on canonical hours, kinds of prayer, prayer practices, litany, and prayer for the dead.',
  null,
  'draft'::public.content_status,
  20,
  'User-provided â€œThe Order of Prayerâ€ attachment',
  null,
  'needs_review',
  null
)
on conflict (slug) do update set
  title = excluded.title,
  title_amharic = excluded.title_amharic,
  summary = excluded.summary,
  summary_amharic = excluded.summary_amharic,
  status = excluded.status,
  sort_order = excluded.sort_order,
  source_title = excluded.source_title,
  review_status = excluded.review_status,
  published_at = coalesce(public.prayer_guides.published_at, excluded.published_at),
  updated_at = now();

insert into public.prayer_guide_sections (
  guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes
)
select g.id,
  'full_source',
  'Full English Source',
  null,
  'THE ORDER OF PRAYER

â€‹

Prayer is a word by which man communicates with his Creator in Faith, thanking and beseeching Him for the forgiveness of his sin. (Fetha Negest 14:528). The basis of prayer is the divine word which runs â€œAsk, and it will be given to you, seek, and you will find, knock and it will be opened to youâ€. (Mt. 7:7).

For prayer, there is a particular time and place. The time during which the clergy and the laity go to church are mornings and evenings also mid days in the fasting season.

â€‹

A. Canonical Hours of Prayer

â€‹

Prayers are said seven times a day: - (Ps. 118:164).

â€‹

a) In the morning

b) At the third hour

c) At noon

d) At the ninth hour

e) At sun set (evening)

f) At bedtime

g) At midnight (Our Lord and Saviour Eyesus Christos born, baptized, rose from the dead and will come again for judgment at midnight)

â€‹

The faithful and the clergy have to go to the church every morning and evening. But in the remaining hours they can pray wherever they are. (Fetha Negest 14; Didas 12).

â€‹

â€‹

B. Kinds of prayers

â€‹

There are three kinds of prayers.

â€‹

a) Private prayer

b) Family prayer

c) Public prayer

a) Private Prayer

â€‹

Private prayer is said at home and at any appropriate place. It is a solemn prayer made to God privately by shutting his room so as not be seen and heard by any one, and lifting his heart to the Creator to be seen and heard by Him alone. (Mt. 6:5-13).

â€‹

b) Family Prayer

â€‹

As the word indicates family prayer is a prayer offered by all the members of a family together. For this the prayer of Cornelius the Centurion will be an example. (Acts 10:2-6).

c) Public Prayer

â€‹

It is a prayer to be said by the clergy and the laity, men and women, old and young gathered together in the church and in all convenient places. We read in the Scriptures that the faithful in the Old Testament used to go to the temple and pray (1 Sam. 1:9-13; Ps. 12:1; Lk. 18:10-14). Also at the time of the New Testament the apostles and their followers used to pray in the upper room and at the house Mariam, St. Markâ€™s mother, which served as Christian gathering. They used also together and pray at the first church of Antioch (Acts 1:14, 25, 3:1, 12:12, 13:1-3)

â€‹

According to this, our Church has laid down rules that the clergy and the laity together praise the Lord in prayer, hymn, liturgy, horology (Saatat).

â€‹

Saatat (áˆ°áŠ á‰³á‰µ - Seatati) is conducted throughout the year in monasteries and big churches, on Sundays and holidays. Saatat is also performed for the dead during the night. For the day time also, there is Saatat. It is said daily at every hour during the time of fast. (Abba Georgiaâ€™ Saatat). Cantillation (Hymn) is a song performed in union by the clergy with prayer sticks (áˆ˜á‰‹áˆšá‹« - Mekwamiya), sistrums (á€áŠ“á…áˆ -TsenatÍŸsili) and drums (áŠ¨á‰ áˆ® - Kebero); the hymn of Lent is sung without sistrums and drums; it is sung with prayer sticks only.

Prayers that are conducted by priests with participation of the laity are:-

â€‹

prayer of the consecration or dedication of a new church
prayer of Baptism

prayer of Ordination and Consecration

prayer of Matrimony

prayer of Litany

prayer for the Dead

prayer of Liturgy

Ethiopian Orthodox Tewahedo Church Liturgical prayer has three parts:

â€‹

1. From â€œO my brother, think of thy sinâ€ upto â€œHow awful this dayâ€ which is the preparatory service.

2. From â€œHow awful is this dayâ€ upto â€œGo forth, Ye catechumenâ€ which is the first part of the Eucharist.

3. After this the main part of the Holy Liturgy which comes after â€œGo forth, Ye catechumenâ€ is said.

â€‹

The procedure for carrying out this is given in detail in the Holy Liturgy and the Fetha Negest Article 12.

The Ethiopian Orthodox Tewahedo Church has fourteen anaphoraâ€™s by which it celebrates the Holy Communion.

These are:

â€‹

The Anaphora of the Apostles

The Anaphora of the Lord

The Anaphora of John, Son of Thunder

The Anaphora of St. Our Holy Mother Virgin Mariam

The Anaphora of The three Hundred

The Anaphora of St. Athanasius

The Anaphora of St. Bassilios

The Anaphora of St. Gregory, Brother of St. Bassilios

The Anaphora of St. Ephiphanius

The Anaphora of St. John Chrysostom

The Anaphora of St. Cyril

The Anaphora of St. Jacob of Serough

The Anaphora of Dioscorus

The Anaphora of St. Gregory Second

The Performance of Private and Public Prayer in Ethiopian Orthodox Tewahedo Church

â€‹

In the time of prayer one has to follow these orders.

â€‹

a) Standing erect on two feet without leaning on a pole or a wall (Ps. 5:3).

b) Girding the loin, wearing clothes down over the shoulders and round the waist. (Lk. 12:35; the Fetha Negest Article 14).

c) Standing up turning the face towards the east without moving to and from and without looking left and right. It is essential to pray stretching the hands and lifting up the heart. (Ps. 133:2; Jn. 11:41).

d) At the beginning and closing of prayer, one has to cross himself with the pointing finger placed in such a way that it makes a cross in relation to the three joined curved fingers. Crossing oneself is done from the forehead downward and from left to right. At the time of crossing it is necessary to remember Our Lord and Saviour Eyesus Christosâ€™s suffering. (Lk. 11:20). Whosoever prays while crossing himself shall say first â€œIn the name of the Father, of the Son, and of the Holy Spirit, One God, I cross my face and all my body in the sign of the crossâ€.

e) Whosoever prays shall say his prayer humbly and silently not to be heard by others except to his ears. (1Sam. 1:3).

f) Whosoever prays shall put all his thoughts before God and neglect worldly thoughts.

g) Whosoever prays should not talk at all with any person interrupting his prayer.

Prayer of Litany

â€‹

It is a prayer which we should pray to God to alter his wrath with mercy, his anger with patience. This prayer is also conducted whenever there is drought, plague, war and when chastisement is manifested. (Num. 16, 46-50; Jon. 3:5-10; Joel 2:12-19; 1Kgs. 8:25-55). Therefore, Our Church teaches that when a particular problem is created the faithful shall beseech God in fast and prayer in every parish church in the morning and evening.

â€‹

Prayer for the Dead

Prayer for the dead is a prayer offered to God that the dead might be released from the bondage of sin. The Church orders that prayer for the dead should be conducted. This prayer enables the deceased to receive forgiveness of sin, mercy and rest for the soul. For the righteous it brings grace upon grace and joyous life. It is through prayer that the dead and the living communicate. â€œThe living pray for the dead and the dead for the living (Enoch 12:34), because their souls are alive. (Mt. 22:31-32; Lk. 20:3739; Barock 3:4). The Holy Apostles have commanded that prayer should be conducted for the dead both in the Church and burial places and offering should be presented for them. For the sake of your brother Christians and martyrs who died in Our Lord and Saviour Eyesus Christos, Gather in the Church without wickedness, bring offerings for them when you take them to the church and the burial places and pray the Psalms of David. (Didasc. Art. 33). The Fetha Negest in its spiritual part affirms what is quoted in Didasc. Art. 22. According to this, our church prays and presents a Psalm of Praise for the dead from the moment of death, up to the laying down in the grave, from home up to the church.

The commemoration for the dead is from the day of death up to a year and beyond.

â€‹

On the day of death

On the third day

On the seventh day

On the twelve day

On the thirtieth day

On the fortieth day

On the eightieth day

In the sixth month

A year after the day of death.

â€‹

The church orders that on these days prayer should be conducted, incense should be burned, offerings should be given, commemoration should be held, and alms should be offered (Fetha Negest Art. 22).

Along with all these the Church prays:-

â€‹

for the sick

for the travelers

for the rain

for the fruit of the earth

for the water of the rivers

for the dead and the living

for the catechumens

for the unity of the church

for the peace of the country and the world

for the leaders and the clergy of the church and the needy

for the immigrants

for the sad and the sorrowful

for the imprisoned

for the transgressors

for the strengthening of faith

for the faithful men and women',
  null,
  1,
  'User-provided â€œThe Order of Prayerâ€ attachment',
  'needs_review',
  'Original English source retained verbatim; Amharic translation not supplied.'
from public.prayer_guides g
where g.slug = 'the-order-of-prayer'
on conflict (guide_id, slug) do update set
  title = excluded.title,
  title_amharic = excluded.title_amharic,
  body_english = excluded.body_english,
  body_amharic = excluded.body_amharic,
  sort_order = excluded.sort_order,
  source_reference = excluded.source_reference,
  review_status = excluded.review_status,
  review_notes = excluded.review_notes,
  updated_at = now();

commit;
