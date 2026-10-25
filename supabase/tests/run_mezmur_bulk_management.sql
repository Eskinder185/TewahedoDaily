\set ON_ERROR_STOP on
\ir hymn_trash_schema_baseline.sql
\ir ../migrations/20261024180000_mezmur_two_state_publication_final.sql
\ir ../migrations/20261024220000_hymn_trash_final_repair.sql

create table public.categories (
  slug text primary key, name text not null, name_amharic text, description text, status text default 'published'
);
create table public.mezmur_occasions (
  slug text primary key, name text not null, name_amharic text, description text, status text default 'published'
);
insert into public.categories values ('christ','Christ','ክርስቶስ','Christological','published');
insert into public.mezmur_occasions values ('general','General','አጠቃላይ','General worship','published');

\ir ../migrations/20261024230000_mezmur_bulk_management.sql
\ir ../migrations/20261024230000_mezmur_bulk_management.sql
\ir ../migrations/20261024250000_mezmur_bulk_job_idempotency.sql
\ir ../migrations/20261024250000_mezmur_bulk_job_idempotency.sql
\ir ../migrations/20261024260000_mezmur_bulk_supabase_operations.sql
\ir ../migrations/20261024260000_mezmur_bulk_supabase_operations.sql
\ir ../migrations/20261024270000_mezmur_bulk_schema_compatibility.sql
\ir ../migrations/20261024270000_mezmur_bulk_schema_compatibility.sql
\ir mezmur_bulk_management_test.sql
