\set ON_ERROR_STOP on
do $$ begin
  assert (select count(*) from public.categories) = 11, 'two existing + nine new categories: ' || (select count(*) from public.categories);
  assert (select count(*) from public.categories where slug = 'kidist-arsema') = 1, 'existing category not duplicated';
  assert (select name from public.categories where slug = 'kidist-arsema') = 'Kidist Arsema', 'existing row untouched';
  assert (select count(*) from public.mezmur_occasions) = 4, 'one existing + three new occasions';
  assert (select count(*) from public.mezmur_occasions where slug = 'gena') = 1, 'existing occasion untouched';
  assert (select status from public.mezmur_occasions where slug = 'tsige') = 'published', 'new occasion published';
  raise notice 'TAXONOMY PROPOSAL CHECKS PASSED';
end $$;
