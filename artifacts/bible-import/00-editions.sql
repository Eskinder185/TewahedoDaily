-- Generated Bible staging SQL. Run in the order listed in README.md.

SET standard_conforming_strings = on;

BEGIN;

DO $schema$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'bible_verses'
      AND column_name = 'chapter_id' AND is_nullable = 'NO'
  ) OR NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'bible_verses'
      AND column_name = 'section_id' AND is_nullable = 'YES'
  ) THEN
    RAISE EXCEPTION 'Apply both Bible migrations, including direct chapter verses, before importing';
  END IF;
END $schema$;

DO $guard$
BEGIN
  IF EXISTS (
    SELECT 1 FROM public.bible_editions WHERE code IN ('am', 'web') AND is_public
  ) OR EXISTS (
    SELECT 1 FROM public.bible_source_books b
    JOIN public.bible_editions e ON e.id = b.edition_id
    WHERE e.code IN ('am', 'web') AND b.is_public
  ) THEN
    RAISE EXCEPTION 'Refusing to overwrite a published Bible edition or source volume';
  END IF;
END $guard$;

INSERT INTO public.bible_editions (id, code, name, language_code, source_metadata, review_status, is_public)
VALUES
  ('69f25897-a119-5dd1-ab89-7c68d2b14181', 'am', 'Amharic Ethiopian Orthodox source', 'am', '{"sourceDirectory":"data/bible/am"}'::jsonb, 'draft', FALSE),
  ('3b272ca9-9ec9-5371-af86-b8fdcd1a7327', 'web', 'World English Bible', 'en', '{"name":"World English Bible","shortname":"WEB","module":"web","year":"2006","publisher":null,"owner":null,"description":"<h3><strong>World English Bible, 2006</strong></h3>\n\n<p><strong>Digital Bible Society<br />\nPublic Domain</strong></p>\n\n<p><em>The World English Bible</em> (WEB) is a Public Domain (no copyright) Modern English translation of the Holy Bible. That means that you may freely copy it in any form, including electronic and print formats. The World English Bible is based on the American Standard Version of the Holy Bible first published in 1901, the Biblia Hebraica Stutgartensa Old Testament, and the Greek Majority Text New Testament. The companion Deuterocanon/Apocrypha is derived from the Revised Version Apocrypha and the Brenton translation of the Septuagint into English. It is in draft form, and currently being edited for accuracy and readability. The 66 books of the Old and New Testaments are essentially completed, although some proofreading comments are still being accepted when they improve accuracy, readability, and consistency.</p>\n\n<p>&nbsp;</p>\n\n<p>This Bible imported from The Unbound Bible <a href=\"http://unbound.biola.edu/\">http://unbound.biola.edu/</a></p>\n\n<p>&nbsp;</p>\n","lang":"English","lang_short":"en","copyright":0,"copyright_statement":"This Bible is in the Public Domain.","url":null,"citation_limit":0,"restrict":0,"italics":0,"strongs":0,"red_letter":0,"paragraph":0,"official":1,"research":1,"module_version":"6.2.0","audio_structure":null}'::jsonb, 'draft', FALSE)
ON CONFLICT (id) DO UPDATE SET
  code = EXCLUDED.code,
  name = EXCLUDED.name,
  language_code = EXCLUDED.language_code,
  source_metadata = EXCLUDED.source_metadata,
  review_status = EXCLUDED.review_status,
  is_public = EXCLUDED.is_public;

COMMIT;