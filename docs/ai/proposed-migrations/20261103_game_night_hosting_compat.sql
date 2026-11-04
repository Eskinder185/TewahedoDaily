-- REVIEW ONLY. Apply AFTER the Game Night base tables exist and BEFORE 20261103_game_night_security.sql.
-- Fixes hosting: the checked-in create_play_room pins search_path=public, so when pgcrypto lives in
-- the `extensions` schema (the Supabase default) gen_random_bytes()/digest() raise
-- "42883 function gen_random_bytes(integer) does not exist" and no room can be created.
-- Only create_play_room is replaced here; join/state/start/submit are replaced by the security proposal.
-- Behaviour is unchanged: authenticated hosts only, 6-hex-character CSPRNG code, only the SHA-256 hash
-- of the code is stored, same settings validation, no table grants.
begin;

do $$
begin
  if to_regclass('public.play_rooms') is null or
     to_regprocedure('public.create_play_room(text,text,integer)') is null then
    raise exception 'Game Night base objects are missing; apply the base migration first (see the runbook)';
  end if;
  if not exists (select 1 from pg_extension where extname='pgcrypto') then
    raise exception 'pgcrypto is not installed';
  end if;
end $$;

create or replace function public.create_play_room(p_category text,p_difficulty text,p_question_count integer)
returns jsonb language plpgsql security definer set search_path=pg_catalog,public,extensions,pg_temp as $$
declare uid uuid:=auth.uid(); code text; rid uuid; tries integer:=0;
begin
  if uid is null then raise exception 'Authentication required' using errcode='42501'; end if;
  if p_difficulty not in ('beginner','growing','challenge') or p_question_count not in (5,10,20) then
    raise exception 'Invalid room settings' using errcode='22023';
  end if;
  loop
    tries:=tries+1; code:=upper(substr(encode(gen_random_bytes(4),'hex'),1,6));
    begin
      insert into public.play_rooms(code_hash,host_user_id,settings)
        values(digest(code,'sha256'),uid,jsonb_build_object(
          'category',left(coalesce(nullif(trim(p_category),''),'All categories'),80),
          'difficulty',p_difficulty,'question_count',p_question_count))
        returning id into rid;
      exit;
    exception when unique_violation then
      if tries>=5 then raise exception 'Unable to allocate room code'; end if;
    end;
  end loop;
  return jsonb_build_object('room_id',rid,'code',code);
end $$;
revoke all on function public.create_play_room(text,text,integer) from public,anon;
grant execute on function public.create_play_room(text,text,integer) to authenticated;

notify pgrst,'reload schema';
-- Review, then COMMIT; ROLLBACK cancels. Rollback after commit: re-run the original create_play_room
-- body saved from the read-only verification output (block 5).
commit;
