\set ON_ERROR_STOP on
do $$ declare r record; begin
  select * into r from public.search_public_mezmur('egziabher siraw') limit 1;
  assert r.slug = 'egziabher-siraw' and r.tier = 'title-exact', 'exact title first: ' || coalesce(r.slug,'null');
  select * into r from public.search_public_mezmur('egziabher') order by tier limit 1;
  assert r.slug in ('egziabher-siraw','selam-lek'), 'phrase/lyric match found';
  assert (select count(*) from public.search_public_mezmur('selam lek maryam')) >= 1, 'lyric phrase';
  select * into r from public.search_public_mezmur('egziaber siraw') limit 1;
  assert r.slug = 'egziabher-siraw' and r.tier = 'similar-spelling', 'similar spelling: ' || coalesce(r.slug||r.tier,'null');
  assert (select count(*) from public.search_public_mezmur('secretphrase')) = 0, 'restricted lyrics never match';
  assert (select count(*) from public.search_public_mezmur('draftphrase')) = 0, 'unpublished never match';
  assert (select count(*) from public.search_public_mezmur('deletedphrase')) = 0, 'deleted never match';
  assert (select count(*) from public.search_public_mezmur('x')) = 0, 'single character rejected';
  assert (select count(*) from public.search_public_mezmur('egziabher', 1)) = 1, 'limit honoured';
  raise notice 'SEARCH RPC CHECKS PASSED';
end $$;
