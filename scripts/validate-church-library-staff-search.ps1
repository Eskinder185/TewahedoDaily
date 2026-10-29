param(
  [Parameter(Mandatory = $true)][string]$HostName,
  [string]$Port = '5432',
  [string]$Database = 'postgres',
  [Parameter(Mandatory = $true)][string]$UserName,
  [string]$Psql = 'C:\Program Files\PostgreSQL\17\bin\psql.exe'
)

$ErrorActionPreference = 'Stop'
$migrationPath = Join-Path $PSScriptRoot '..\supabase\migrations\20261030130000_church_library_staff_private_search.sql'
$migration = Get-Content -Raw -LiteralPath $migrationPath
$body = [regex]::Replace($migration, '(?im)^\s*begin;\s*$', '', 1) -replace '(?im)^\s*commit;\s*$', ''
$tempSql = Join-Path ([System.IO.Path]::GetTempPath()) ('tewahedodaily-church-search-' + [guid]::NewGuid().ToString('N') + '.sql')

$tests = @'

do $test$
declare n bigint;
begin
  select count(*) into n from public.church_library_passages p
  join public.church_library_books b on b.id = p.book_id
  where b.slug in ('five-pillars-of-mystery-am','five-pillars-of-mystery-en','seven-sacraments-baptism-am','seven-sacraments-baptism-en');
  if n <> 570 then raise exception 'Expected 570 unchanged source passages, found %', n; end if;
end
$test$;

select set_config('request.jwt.claims', '{"role":"anon"}', true);
set local role anon;
do $test$
declare n bigint;
begin
  select count(*) into n from public.search_church_library_sections('How many sacraments are there?', 8, 'en');
  if n <> 0 then raise exception 'Anonymous caller saw % private search hits', n; end if;
end
$test$;
reset role;

select p.id::text as staff_uid from public.profiles p
where p.role in ('editor','admin','super_admin')
order by case p.role when 'super_admin' then 0 when 'admin' then 1 else 2 end limit 1 \gset
select set_config('request.jwt.claims', json_build_object('sub', :'staff_uid', 'role', 'authenticated')::text, true);
select public.church_library_search_terms('ሰባቱ ምሥጢራት') as amharic_terms;
select b.slug, b.title, public.church_library_fold_am(b.title) as folded_title
from public.church_library_books b where b.slug = 'seven-sacraments-baptism-am';
set local role authenticated;
select passage_id, book_slug, passage_key, section_key
from public.search_church_library_sections('ሰባቱ ምሥጢራት', 8, 'am');
select passage_id, book_slug, passage_key, section_key
from public.search_church_library_sections('How many sacraments are there?', 8, 'en');
do $test$
declare en_hits bigint; am_hits bigint; bad_citations bigint; unexpected_books bigint;
begin
  if not public.is_staff() then raise exception 'Staff JWT simulation failed'; end if;
  select count(*) into en_hits from public.search_church_library_sections('How many sacraments are there?', 8, 'en');
  select count(*) into am_hits from public.search_church_library_sections('ሰባቱ ምሥጢራት', 8, 'am');
  select count(*) into bad_citations
  from public.search_church_library_sections('Baptism', 8, 'en')
  where passage_id is null or passage_key is null or book_slug is null or section_key is null;
  select count(*) into unexpected_books
  from public.search_church_library_sections('Baptism', 8, 'en')
  where book_slug not in ('five-pillars-of-mystery-am','five-pillars-of-mystery-en','seven-sacraments-baptism-am','seven-sacraments-baptism-en');
  if en_hits = 0 then raise exception 'Staff English private search returned no hits'; end if;
  if am_hits = 0 then raise exception 'Staff Amharic private search returned no hits'; end if;
  if bad_citations <> 0 then raise exception 'Staff search returned % incomplete stable citations', bad_citations; end if;
  if unexpected_books <> 0 then raise exception 'Staff search returned % result(s) from an unexpected book', unexpected_books; end if;
end
$test$;
reset role;

select 'ROLLBACK-ONLY VALIDATION PASSED' as result;
rollback;
'@

try {
  @("\set ON_ERROR_STOP on", 'begin;', $body, $tests) | Set-Content -LiteralPath $tempSql -Encoding utf8
  & $Psql -X -v ON_ERROR_STOP=1 -h $HostName -p $Port -U $UserName -d $Database --file $tempSql
  if ($LASTEXITCODE -ne 0) { throw "psql validation failed with exit code $LASTEXITCODE" }
}
finally {
  Remove-Item -LiteralPath $tempSql -Force -ErrorAction SilentlyContinue
}
