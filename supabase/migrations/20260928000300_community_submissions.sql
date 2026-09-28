begin;
create schema if not exists extensions;
create extension if not exists pg_trgm with schema extensions;
create type public.submission_type as enum ('mezmur','correction','prayer','saint','feast','article','other');
create type public.submission_status as enum ('submitted','under_review','needs_changes','approved','rejected','duplicate','converted_to_content');
create sequence cms_private.submission_reference_seq;
create function cms_private.submission_reference() returns text language sql volatile set search_path = '' as $$
 select 'TD-' || extract(year from now())::text || '-' || lpad(n::text,greatest(5,length(n::text)),'0') from (select nextval('cms_private.submission_reference_seq') n) s
$$;
create table public.community_submissions (
 id uuid primary key default gen_random_uuid(),
 public_reference text not null unique default cms_private.submission_reference(),
 submission_type public.submission_type not null,
 title text not null check (length(trim(title)) between 2 and 200), title_amharic text not null default '' check(length(title_amharic)<=200),
 singer_name text not null default '' check(length(singer_name)<=200), youtube_url text not null default '' check(length(youtube_url)<=500),
 lyrics_amharic text not null default '' check(length(lyrics_amharic)<=20000), lyrics_english text not null default '' check(length(lyrics_english)<=20000), lyrics_oromo text not null default '' check(length(lyrics_oromo)<=20000),
 transliteration text not null default '' check(length(transliteration)<=20000), suggested_category text not null default '' check(length(suggested_category)<=200),
 suggested_tags text[] not null default '{}' check(cardinality(suggested_tags)<=20),
 contributor_name text not null check(length(trim(contributor_name)) between 2 and 100),
 contributor_email text not null default '' check(length(contributor_email)<=254), credit_requested boolean not null default false,
 source_notes text not null default '' check(length(source_notes)<=4000), source_reference text not null default '' check(length(source_reference)<=1000),
 admin_notes text not null default '' check(length(admin_notes)<=8000),
 related_content_id uuid references public.mezmur(id) on delete set null,
 related_legacy_key text check(length(related_legacy_key)<=250), related_content_title text check(length(related_content_title)<=200),
 current_page_url text check(length(current_page_url)<=1000),
 correction_type text check(correction_type in ('incorrect_lyrics','missing_lyrics','translation_issue','wrong_singer','broken_youtube_link','wrong_category','spelling_issue','other')),
 suggested_correction text not null default '' check(length(suggested_correction)<=12000), explanation text not null default '' check(length(explanation)<=4000),
 status public.submission_status not null default 'submitted',
 reviewed_by uuid references public.profiles(id) on delete set null, reviewed_at timestamptz,
 created_at timestamptz not null default clock_timestamp(), updated_at timestamptz not null default clock_timestamp(),
 constraint submission_minimum check (
  (submission_type='mezmur' and (youtube_url<>'' or length(trim(lyrics_amharic||lyrics_english||lyrics_oromo))>=10)) or
  (submission_type='correction' and correction_type is not null and length(trim(suggested_correction))>=10 and (related_content_id is not null or related_legacy_key is not null or (related_content_title is not null and current_page_url is not null))) or
  submission_type not in ('mezmur','correction'))
);
create index submissions_queue_idx on public.community_submissions(status,created_at desc);
create index submissions_youtube_idx on public.community_submissions(youtube_url) where youtube_url<>'';
alter table public.community_submissions enable row level security;
revoke all on public.community_submissions from public,anon,authenticated;
grant select on public.community_submissions to authenticated;
grant all on public.community_submissions to service_role;
create policy staff_read_submissions on public.community_submissions for select to authenticated using(cms_private.current_role() in ('editor','admin','super_admin'));
-- Public INSERT is exclusively through the verified Pages endpoint and server-only RPC.
-- No permissive browser INSERT policy: that would bypass Turnstile and rate limits.

create table cms_private.submission_rates (ip_hash text primary key,started_at timestamptz not null,attempts integer not null);
create table cms_private.submission_receipts (
 ip_hash text not null, fingerprint text not null, public_reference text not null,
 created_at timestamptz not null default clock_timestamp(), primary key(ip_hash,fingerprint)
);
create index submission_rates_expiry on cms_private.submission_rates(started_at);
create index submission_receipts_expiry on cms_private.submission_receipts(created_at);
revoke all on cms_private.submission_rates,cms_private.submission_receipts from public,anon,authenticated;

create function public.receive_community_submission(payload jsonb, client_hash text) returns jsonb
language plpgsql security definer set search_path = '' as $$
declare payload_fingerprint text := md5(payload::text); receipt text; attempts integer; saved public.community_submissions;
begin
 if client_hash !~ '^[a-f0-9]{64}$' then raise exception 'Invalid client hash'; end if;
 perform pg_advisory_xact_lock(hashtextextended(client_hash,9813));
 delete from cms_private.submission_receipts where created_at < now()-interval '24 hours';
 delete from cms_private.submission_rates where started_at < now()-interval '24 hours';
 select public_reference into receipt from cms_private.submission_receipts where ip_hash=client_hash and submission_receipts.fingerprint=payload_fingerprint;
 if found then return jsonb_build_object('reference',receipt,'repeated',true); end if;
 insert into cms_private.submission_rates values(client_hash,clock_timestamp(),1)
 on conflict(ip_hash) do update set
 attempts=case when submission_rates.started_at<now()-interval '1 hour' then 1 else submission_rates.attempts+1 end,
 started_at=case when submission_rates.started_at<now()-interval '1 hour' then clock_timestamp() else submission_rates.started_at end
 returning submission_rates.attempts into attempts;
 if attempts>5 then return jsonb_build_object('error','rate_limited'); end if;
 -- A strict allowlist prevents incoming status, reviewer, notes, or IDs from being trusted.
 insert into public.community_submissions(submission_type,title,title_amharic,singer_name,youtube_url,lyrics_amharic,lyrics_english,lyrics_oromo,transliteration,suggested_category,suggested_tags,contributor_name,contributor_email,credit_requested,source_notes,source_reference,related_content_id,related_legacy_key,related_content_title,current_page_url,correction_type,suggested_correction,explanation)
 values((payload->>'submission_type')::public.submission_type,payload->>'title',coalesce(payload->>'title_amharic',''),coalesce(payload->>'singer_name',''),coalesce(payload->>'youtube_url',''),
 coalesce(payload->>'lyrics_amharic',''),coalesce(payload->>'lyrics_english',''),coalesce(payload->>'lyrics_oromo',''),coalesce(payload->>'transliteration',''),coalesce(payload->>'suggested_category',''),
 array(select jsonb_array_elements_text(coalesce(payload->'suggested_tags','[]'))),payload->>'contributor_name',coalesce(payload->>'contributor_email',''),coalesce((payload->>'credit_requested')::boolean,false),
 coalesce(payload->>'source_notes',''),coalesce(payload->>'source_reference',''),(payload->>'related_content_id')::uuid,payload->>'related_legacy_key',payload->>'related_content_title',payload->>'current_page_url',payload->>'correction_type',coalesce(payload->>'suggested_correction',''),coalesce(payload->>'explanation','')) returning * into saved;
 insert into cms_private.submission_receipts(ip_hash,fingerprint,public_reference) values(client_hash,payload_fingerprint,saved.public_reference);
 return jsonb_build_object('reference',saved.public_reference,'repeated',false);
end $$;
revoke all on function public.receive_community_submission(jsonb,text) from public,anon,authenticated;
grant execute on function public.receive_community_submission(jsonb,text) to service_role;

create function public.review_submission(submission_id uuid,new_status public.submission_status,notes text,expected_updated_at timestamptz)
returns public.community_submissions language plpgsql security definer set search_path = '' as $$
declare item public.community_submissions;
begin
 if coalesce(cms_private.current_role() not in ('editor','admin','super_admin'),true) then raise exception 'Review permission required' using errcode='42501'; end if;
 select * into item from public.community_submissions where id=submission_id for update;
 if not found then raise exception 'Submission not found'; end if;
 if item.updated_at is distinct from expected_updated_at then raise exception 'Submission changed. Reload before reviewing.' using errcode='40001'; end if;
 if item.status='converted_to_content' or new_status in ('submitted','converted_to_content') then raise exception 'Invalid review transition'; end if;
 if new_status <> item.status and new_status <> 'under_review' and item.status <> 'under_review' then raise exception 'Start review before deciding'; end if;
 if new_status in ('needs_changes','rejected','duplicate') and length(trim(coalesce(notes,'')))<5 then raise exception 'Add a review note explaining this decision'; end if;
 update public.community_submissions set status=new_status,admin_notes=coalesce(notes,''),reviewed_by=auth.uid(),reviewed_at=clock_timestamp(),updated_at=clock_timestamp() where id=submission_id returning * into item;
 return item;
end $$;
revoke all on function public.review_submission(uuid,public.submission_status,text,timestamptz) from public,anon;
grant execute on function public.review_submission(uuid,public.submission_status,text,timestamptz) to authenticated;

alter table public.mezmur add source_submission_id uuid unique references public.community_submissions(id) on delete restrict,
 add contributor_credit text check(length(contributor_credit)<=100);
create function cms_private.guard_submission_origin() returns trigger language plpgsql security definer set search_path = '' as $$
begin
 if tg_op='UPDATE' then new.source_submission_id:=old.source_submission_id; end if;
 if new.source_submission_id is not null then
  if tg_op='INSERT' then
   if coalesce(cms_private.current_role() not in ('editor','admin','super_admin'),true) then raise exception 'Review permission required' using errcode='42501'; end if;
   if new.status<>'draft' or not exists(select 1 from public.community_submissions where id=new.source_submission_id and submission_type='mezmur' and status='approved') then raise exception 'Only approved submissions can become drafts' using errcode='42501'; end if;
  elsif new.status='published' and old.status not in ('pending_review','published') then raise exception 'Community content requires final review before publishing' using errcode='42501'; end if;
 end if;
 return new;
end $$;
create trigger a_submission_origin before insert or update on public.mezmur for each row execute function cms_private.guard_submission_origin();
create function public.convert_submission(submission_id uuid,expected_updated_at timestamptz,include_credit boolean default false)
returns uuid language plpgsql security definer set search_path = '' as $$
declare item public.community_submissions; content_id uuid;
begin
 if coalesce(cms_private.current_role() not in ('editor','admin','super_admin'),true) then raise exception 'Review permission required' using errcode='42501'; end if;
 select * into item from public.community_submissions where id=submission_id for update;
 if not found then raise exception 'Submission not found'; end if;
 if item.status='converted_to_content' and item.related_content_id is not null then return item.related_content_id; end if;
 if item.status<>'approved' or item.submission_type<>'mezmur' then raise exception 'Approve a mezmur submission before converting'; end if;
 if item.updated_at is distinct from expected_updated_at then raise exception 'Submission changed. Reload before converting.' using errcode='40001'; end if;
 insert into public.mezmur(title,title_amharic,slug,lyrics_amharic,lyrics_english,lyrics_oromo,transliteration,youtube_url,status,source_submission_id,contributor_credit)
 values(item.title,item.title_amharic,lower(item.public_reference),item.lyrics_amharic,item.lyrics_english,item.lyrics_oromo,item.transliteration,item.youtube_url,'draft',item.id,case when include_credit and item.credit_requested then item.contributor_name else null end) returning id into content_id;
 update public.community_submissions set status='converted_to_content',related_content_id=content_id,reviewed_by=auth.uid(),reviewed_at=clock_timestamp(),updated_at=clock_timestamp() where id=item.id;
 return content_id;
end $$;
revoke all on function public.convert_submission(uuid,timestamptz,boolean) from public,anon;
grant execute on function public.convert_submission(uuid,timestamptz,boolean) to authenticated;

create function cms_private.youtube_key(url text) returns text language sql immutable set search_path='' as $$
 select substring(url from '(?:v=|youtu.be/|shorts/|embed/)([A-Za-z0-9_-]{11})')
$$;
create function public.submission_duplicates(submission_id uuid)
returns table(content_id text,source text,reference text,title text,reason text,score real)
language plpgsql security definer set search_path='' as $$
declare item public.community_submissions;
begin
 if coalesce(cms_private.current_role() not in ('editor','admin','super_admin'),true) then raise exception 'Review permission required' using errcode='42501'; end if;
 select * into item from public.community_submissions where id=submission_id;
 return query with candidates as (
  select m.id::text cid,'mezmur'::text src,m.slug ref,m.title t,coalesce(m.title_amharic,'') am,coalesce(s.name,'') singer,coalesce(m.youtube_url,'') yt from public.mezmur m left join public.singers s on s.id=m.singer_id
  union all select c.id::text,'submission',c.public_reference,c.title,c.title_amharic,c.singer_name,c.youtube_url from public.community_submissions c where c.id<>submission_id
  union all select c.key,'legacy',c.slug,c.title,c.transliteration_title,'',coalesce(c.youtube_url,'') from public.chants c where c.form='mezmur'
 ), ranked as (select *,greatest(case when lower(t)=lower(item.title) then 1 else extensions.similarity(lower(t),lower(item.title)) end,case when am<>'' and item.title_amharic<>'' then case when lower(am)=lower(item.title_amharic) then 1 else extensions.similarity(lower(am),lower(item.title_amharic)) end else 0 end) sim,
 (yt<>'' and (yt=item.youtube_url or cms_private.youtube_key(yt)=cms_private.youtube_key(item.youtube_url))) video,
 (singer<>'' and lower(singer)=lower(item.singer_name) and extensions.similarity(lower(t),lower(item.title))>=0.4) singer_match from candidates)
 select cid,src,ref,t,case when video then 'Same YouTube video' when singer_match then 'Same singer and similar title' when am<>'' and item.title_amharic<>'' and (lower(am)=lower(item.title_amharic) or extensions.similarity(lower(am),lower(item.title_amharic))>=0.55) then 'Similar Amharic title' else 'Similar title' end,
 case when video then 1::real else sim end from ranked where video or singer_match or sim>=0.55 order by video desc nulls last,sim desc limit 20;
end $$;
revoke all on function public.submission_duplicates(uuid) from public,anon;
grant execute on function public.submission_duplicates(uuid) to authenticated;
revoke all on function cms_private.guard_submission_origin(),cms_private.youtube_key(text),cms_private.submission_reference() from public,anon,authenticated;
revoke all on sequence cms_private.submission_reference_seq from public,anon,authenticated;
commit;
