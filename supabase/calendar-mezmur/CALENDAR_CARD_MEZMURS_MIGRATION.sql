-- ============================================================================
-- TEWAHEDODAILY: CALENDAR CARD TO MEZMUR RELATIONSHIP TABLE & VERIFIED SEED
-- Migration: 20261026170000_calendar_card_mezmurs_links.sql
--
-- Forward-only, additive, and idempotent.
-- Links calendar cards and commemorations directly to verified published hymns.
-- Provides deterministic ranking, bilingual explanations, and admin review workflow.
-- ============================================================================

BEGIN;

CREATE TABLE IF NOT EXISTS public.calendar_card_mezmurs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  calendar_card_id UUID REFERENCES public.calendar_cards(id) ON DELETE CASCADE,
  calendar_card_slug TEXT NOT NULL,
  event_kind TEXT NOT NULL CHECK (event_kind IN ('observance', 'monthly', 'season', 'fast', 'synaxarium')),
  event_title TEXT NOT NULL,
  event_title_amharic TEXT,
  mezmur_slug TEXT NOT NULL,
  mezmur_title TEXT NOT NULL,
  mezmur_title_amharic TEXT,
  relationship_type TEXT NOT NULL CHECK (relationship_type IN ('exact_commemoration', 'saint_angel', 'feast', 'liturgical_season', 'fasting_occasion', 'thematic')),
  priority INTEGER NOT NULL DEFAULT 1 CHECK (priority >= 1 AND priority <= 5),
  reason_en TEXT NOT NULL,
  reason_am TEXT NOT NULL,
  review_status TEXT NOT NULL DEFAULT 'approved' CHECK (review_status IN ('approved', 'pending_review', 'rejected')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT calendar_card_mezmurs_unique_link UNIQUE (calendar_card_slug, mezmur_slug, relationship_type)
);

CREATE INDEX IF NOT EXISTS idx_calendar_card_mezmurs_card_slug ON public.calendar_card_mezmurs(calendar_card_slug);
CREATE INDEX IF NOT EXISTS idx_calendar_card_mezmurs_mezmur_slug ON public.calendar_card_mezmurs(mezmur_slug);
CREATE INDEX IF NOT EXISTS idx_calendar_card_mezmurs_priority ON public.calendar_card_mezmurs(priority, review_status);

ALTER TABLE public.calendar_card_mezmurs ENABLE ROW LEVEL SECURITY;

GRANT SELECT ON public.calendar_card_mezmurs TO anon, authenticated, service_role;
GRANT INSERT, UPDATE, DELETE ON public.calendar_card_mezmurs TO authenticated;
GRANT ALL ON public.calendar_card_mezmurs TO service_role;

DROP POLICY IF EXISTS calendar_card_mezmurs_public_read ON public.calendar_card_mezmurs;
CREATE POLICY calendar_card_mezmurs_public_read ON public.calendar_card_mezmurs
  FOR SELECT TO anon, authenticated
  USING (review_status = 'approved');

DROP POLICY IF EXISTS calendar_card_mezmurs_staff_all ON public.calendar_card_mezmurs;
CREATE POLICY calendar_card_mezmurs_staff_all ON public.calendar_card_mezmurs
  FOR ALL TO authenticated
  USING (coalesce(public.is_staff(), false))
  WITH CHECK (coalesce(public.is_staff(), false));

-- Insert verified links idempotently
INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '1d5afbd7-0dad-4d2e-b624-698f74a4cd4e'::uuid,
  'observance-enkutatash',
  'observance',
  'Enkutatash / Ethiopian New Year',
  'እንቁጣጣሽ',
  'awde-amet-le-barko',
  'Awde Amet le Barko',
  'ዐውደ ዓመት ለባርኮ',
  'exact_commemoration',
  1,
  'Official liturgical hymn for Enkutatash / New Year (Awde Amet)',
  'ለእንቁጣጣሽ የዐውደ ዓመት መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '1d5afbd7-0dad-4d2e-b624-698f74a4cd4e'::uuid,
  'observance-enkutatash',
  'observance',
  'Enkutatash / Ethiopian New Year',
  'እንቁጣጣሽ',
  'ametun-asalfeh',
  'Ametun Asalfeh',
  'ዓመቱን አሣልፈህ',
  'exact_commemoration',
  1,
  'Hymn of thanksgiving for passing into the new year',
  'ስለ ዓመቱ ፍጻሜ እና አዲስ ጅማሬ ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'cd44f8af-e05d-4efe-80cd-c8f8e6e20b0b'::uuid,
  'observance-meskel',
  'observance',
  'Meskel / Finding of the True Cross',
  'መስቀል',
  'eleni-nigist-haseset-meskelu',
  'Eleni Nigist Haseset Meskelu',
  'ዕሌኒ ንግሥት',
  'exact_commemoration',
  1,
  'Feast hymn commemorating the Finding of the True Cross by Queen Helena',
  'ንግሥት ዕሌኒ መስቀሉን ያገኘችበት መታሰቢያ',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'cd44f8af-e05d-4efe-80cd-c8f8e6e20b0b'::uuid,
  'observance-meskel',
  'observance',
  'Meskel / Finding of the True Cross',
  'መስቀል',
  'meskel-birhane',
  'Meskel Birhane',
  'መስቀል ብርሀነ',
  'exact_commemoration',
  1,
  'Praise hymn exalting the Holy Cross as the light of the faithful',
  'መስቀል ብርሃናችን ነው የሚል የምስጋና መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'cd44f8af-e05d-4efe-80cd-c8f8e6e20b0b'::uuid,
  'observance-meskel',
  'observance',
  'Meskel / Finding of the True Cross',
  'መስቀል',
  'meskelike-yikunene-beza',
  'Meskelike Yikunene Beza',
  'መስቀልከ',
  'exact_commemoration',
  1,
  'Liturgical prayer hymn: May Your Cross be our salvation',
  'መስቀልከ ይኩነነ ቤዛ የሚል የጸሎት መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '2d2b3fca-2640-460b-ac11-2b91c550f50f'::uuid,
  'observance-megabit-meskel',
  'observance',
  'Megabit Meskel',
  NULL,
  'meskel-birhane',
  'Meskel Birhane',
  'መስቀል ብርሀነ',
  'exact_commemoration',
  1,
  'Commemorates the manifestation of the Holy Cross on Megabit 10',
  'የመጋቢት ፲ የመስቀል መታሰቢያ መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '330d35ab-1c1e-4bb8-aca7-a7d0fffd06ff'::uuid,
  'observance-demera',
  'observance',
  'Demera / Eve of Meskel',
  'ደመራ',
  'meskel-abeba-wub-abeba',
  'Meskel Abeba Neh Wub Abeba',
  'መስቀል አበባ ነህ ውብ አበባ',
  'feast',
  2,
  'Eve of Meskel celebration hymn for the Demera gathering',
  'ለደመራ ዋዜማ የቀረበ የምስጋና መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '06fbe4d6-78f6-4c25-a8f5-28519aa7e610'::uuid,
  'observance-gena',
  'observance',
  'Gena / Nativity of Christ',
  'ገና',
  'beza-kulu-alem-yom-tewolede',
  'Beza Kulu Alem Yom Tewolede',
  'ቤዛ ኩሉ ዓለም ዮም ተወልደ',
  'exact_commemoration',
  1,
  'Solemn Nativity hymn: Today the Savior of all the world is born',
  'ቤዛ ኩሉ ዓለም ዮም ተወልደ - የልደት በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '06fbe4d6-78f6-4c25-a8f5-28519aa7e610'::uuid,
  'observance-gena',
  'observance',
  'Gena / Nativity of Christ',
  'ገና',
  'reiywo-nolot',
  'Re''iywo Nolot',
  'ርእይዎ ኖሎት',
  'exact_commemoration',
  1,
  'Nativity Gospel hymn: The Shepherds saw Him in Bethlehem',
  'ርእይዎ ኖሎት - እረኞች ያዩት የገና ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '06fbe4d6-78f6-4c25-a8f5-28519aa7e610'::uuid,
  'observance-gena',
  'observance',
  'Gena / Nativity of Christ',
  'ገና',
  'begol-sekebe-beatsrqt',
  'Begol Sekebe',
  'በጎል ሰከበ',
  'exact_commemoration',
  1,
  'Nativity hymn celebrating Christ born and laid in the manger',
  'በጎል ሰከበ - በረት የተኛበት የልደት መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '06fbe4d6-78f6-4c25-a8f5-28519aa7e610'::uuid,
  'observance-gena',
  'observance',
  'Gena / Nativity of Christ',
  'ገና',
  'eyesus-tewelidu-gena-mezmur-eritrean-orthodox-mezmur-zemari-bereket-tiku',
  'Eyesus tewelidu / / Gena mezmur / Eritrean orthodox mezmur / zemari Bereket Tikue',
  'ኢየሱስ ተወሊዱ',
  'exact_commemoration',
  1,
  'Traditional feast hymn celebrating the Holy Birth of Jesus',
  'ኢየሱስ ተወሊዱ - የጌታችን የልደት በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'f19d0aaa-4837-44ef-bd85-740027cf3cda'::uuid,
  'observance-timket',
  'observance',
  'Timket / Baptism of Christ',
  'ጥምቀት',
  'our-lord-and-king-of-peace',
  'Our Lord and King of Peace',
  NULL,
  'exact_commemoration',
  1,
  'Feast hymn commemorating the Baptism of our Lord Jesus Christ in Jordan',
  'ለጥምቀት በዓል የቀረበ የዮርዳኖስ ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'c89c6eaa-ca1c-4635-b818-83bf11b75647'::uuid,
  'observance-ketera',
  'observance',
  'Ketera / Eve of Timket',
  'ከተራ',
  'our-lord-and-king-of-peace',
  'Our Lord and King of Peace',
  NULL,
  'feast',
  2,
  'Eve of Timket (Ketera) procession to the water',
  'ለከተራ ዋዜማ ወደ ባሕረ ጥምቀት የሚዘመር ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '19b47474-c1db-4bba-9c85-09f161241d25'::uuid,
  'observance-kana-ze-galila',
  'observance',
  'Kana Ze Galila / Wedding at Cana',
  NULL,
  'zemarit-mirtineshi-tilahun-kana-ze-gelila-ye-d-daniel-wendimu-ye-sergi-m',
  'Zemarit Mirtineshi Tilahun//kana Ze Gelila//ye D.daniel Wendimu Ye Sergi Mereha Gibir Lay',
  NULL,
  'exact_commemoration',
  1,
  'Gospel feast hymn for Christ''s first miracle at Cana of Galilee',
  'በቃና ዘገሊላ ጌታችን ውሃውን የወይን ጠጅ ያደረገበት መታሰቢያ',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b98e604a-6ba8-4748-a28d-118be2b9c51f'::uuid,
  'observance-debre-tabor',
  'observance',
  'Debre Tabor / Transfiguration',
  'ደብረ ታቦር',
  'tabor-abera',
  'Tabor Abera',
  'ታቦር አበራ',
  'exact_commemoration',
  1,
  'Feast of the Transfiguration on Mount Tabor (Buhe)',
  'ታቦር አበራ - የደብረ ታቦር (ቡሄ) በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b98e604a-6ba8-4748-a28d-118be2b9c51f'::uuid,
  'observance-debre-tabor',
  'observance',
  'Debre Tabor / Transfiguration',
  'ደብረ ታቦር',
  'aman-beaman-tesebha',
  'Aman be''aman Tesebha',
  'አማን በአማን ተሰብሐ',
  'feast',
  2,
  'Hymn praising Christ transfigured in Divine Glory',
  'በክብረ መለኮት የተገለጠበት ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '164a7c7c-df3b-48e1-9ccc-29195dc2d53a'::uuid,
  'observance-filseta',
  'observance',
  'Filseta / Assumption of Mary',
  'ፍልሰታ',
  'saint-mary-has-ascended',
  'Saint Mary Has Ascended',
  NULL,
  'exact_commemoration',
  1,
  'Feast hymn for the Holy Assumption of Our Lady Virgin Mary (Filseta)',
  'የእመቤታችን የትንሣኤዋ እና ዕርገቷ (ፍልሰታ) መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '164a7c7c-df3b-48e1-9ccc-29195dc2d53a'::uuid,
  'observance-filseta',
  'observance',
  'Filseta / Assumption of Mary',
  'ፍልሰታ',
  'wede-misraq-eyu',
  'Wede Misraq Eyu',
  'ወደ ምስራቅ እዩ',
  'exact_commemoration',
  1,
  'Marian Filseta hymn: Look to the East and see her glory',
  'ወደ ምስራቅ እዩ - የእመቤታችን የፍልሰታ በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '9cf33ac0-6abd-476d-98a6-6ccdac0d06aa'::uuid,
  'observance-maryam-dormition',
  'observance',
  'Dormition of Mary',
  'አስተርዮ ማርያም',
  'dingil-fetariwan',
  'Dingil Fetariwan',
  'ድንግል ፈጣሪዋን',
  'exact_commemoration',
  1,
  'Commemorating the Dormition and resting of Saint Mary (Asteyo Maryam, Tir 21)',
  'የእመቤታችን የእረፍቷ መታሰቢያ (አስተርዮ ማርያም)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b8904b25-0a9a-4e93-a792-bdbdd357eb33'::uuid,
  'observance-maryam-presentation',
  'observance',
  'Presentation of Mary in the Temple',
  'በአታ ለማርያም',
  'azekri-dingil',
  'Azekri Dingil',
  'አዘክሪ ድንግል',
  'exact_commemoration',
  1,
  'Feast of Ba''ata: Entrance of the three-year-old Virgin into the Temple',
  'በአታ ለማርያም - እመቤታችን ወደ ቤተ መቅደስ የገባችበት መታሰቢያ',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '8eab5b75-0361-49f3-81e0-ab6f932d0e1c'::uuid,
  'observance-lideta-maryam',
  'observance',
  'Lideta Maryam / Nativity of Mary',
  'ልደታ ማርያም',
  'akilile-tsige-mariyam',
  'Akilile Tsige Mariyam',
  'አክሊለ ፅጌ ማርያም',
  'exact_commemoration',
  1,
  'Feast of the Nativity of the Blessed Virgin Mary (Lideta Maryam, Ginbot 1 & Meskerem 1)',
  'ልደታ ለማርያም - የእመቤታችን የልደት በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'd53881ca-6716-4793-b5a8-c97e1a73838b'::uuid,
  'observance-qusquam-maryam',
  'observance',
  'Qusquam Maryam',
  'ቁስቋም ማርያም',
  'azekri-dingil',
  'Azekri Dingil',
  'አዘክሪ ድንግል',
  'exact_commemoration',
  1,
  'Commemoration of the Flight into Egypt and refuge at Mount Qusquam',
  'የእመቤታችንና የጌታችን የስደቱ መታሰቢያ (ቁስቋም ማርያም)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b1bd5e60-1279-4c4a-927b-36a3f1ff40d1'::uuid,
  'observance-maryam-flight-egypt',
  'observance',
  'Flight into Egypt',
  NULL,
  'azekri-dingil',
  'Azekri Dingil',
  'አዘክሪ ድንግል',
  'exact_commemoration',
  1,
  'Commemoration of the Flight of the Holy Family into Egypt',
  'የቅድስት ቤተሰብ የስደት መታሰቢያ',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '31b3fd03-5c17-4366-bfca-06d522347222'::uuid,
  'observance-debre-mitmaq',
  'observance',
  'Debre Mitmaq',
  'ደብረ ምጥማቅ',
  'yebrhan-gorf-nat-dingl-enatachn',
  'Yebrhan Gorf Nat Dingl Enatachn',
  'የብርሃን ጎርፍ ናት ድንግል እናታችን',
  'feast',
  1,
  'Apparition of the Holy Virgin Mary at Debre Mitmaq (Ginbot 21)',
  'የእመቤታችን በደብረ ምጥማቅ የመገለጧ በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'eb4c7a6d-d70f-4af5-b5d2-c0bd44c38990'::uuid,
  'observance-kidane-mihret',
  'observance',
  'Kidane Mihret / Covenant of Mercy',
  'ኪዳነ ምሕረት',
  'kidane-mihret-emebet',
  'Kidane Mihret Emebet',
  'ኪዳነ ምሕረት እመቤት',
  'exact_commemoration',
  1,
  'Great Annual Feast of the Covenant of Mercy granted to Saint Mary (Yekatit 16)',
  'ለኪዳነ ምሕረት ዓመታዊ ታላቅ በዓል (የካቲት ፲፮) የቀረበ መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'eb4c7a6d-d70f-4af5-b5d2-c0bd44c38990'::uuid,
  'observance-kidane-mihret',
  'observance',
  'Kidane Mihret / Covenant of Mercy',
  'ኪዳነ ምሕረት',
  'kidane-mihiret-enate',
  'Kidane Mihiret Enate',
  'ኪዳነ ምሕረት እናቴ',
  'exact_commemoration',
  1,
  'Hymn of intercession to Our Lady of the Covenant of Mercy',
  'ኪዳነ ምሕረት እናቴ - አማላጅነቷን የሚያወድስ መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'a554e9e7-5f32-4915-a5b1-4fbaff799ff2'::uuid,
  'observance-michael-hidar',
  'observance',
  'Saint Michael — Hidar',
  'ቅዱስ ሚካኤል',
  'tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe',
  'Tewedaj Yekidus Mikael Mezimurat Liredagn Meta//yeafomiya Eredat Neh//beberehaw Beharuru',
  'ተወዳጅ የቅዱስ ሚካኤል መዝሙራት ሊረዳኝ መጣ//የአፎምያ እረዳት ነህ//በበረሀው በሀሩሩ',
  'exact_commemoration',
  1,
  'Great Annual Feast of Archangel Michael in Hidar (saving Afomia and the faithful)',
  'የኅዳር ሚካኤል ዓመታዊ በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'a554e9e7-5f32-4915-a5b1-4fbaff799ff2'::uuid,
  'observance-michael-hidar',
  'observance',
  'Saint Michael — Hidar',
  'ቅዱስ ሚካኤል',
  'liredan-meta-mikael',
  'Liredan Meta Mikael',
  'ሊረዳን መጣ',
  'exact_commemoration',
  1,
  'Praise hymn: Michael came to our rescue',
  'ሊረዳን መጣ ሚካኤል - የሊቀ መላእክት ቅዱስ ሚካኤል ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'f2b41607-6df2-4a6a-9e0d-85665c90083f'::uuid,
  'observance-michael-sene',
  'observance',
  'Saint Michael — Sene',
  'ቅዱስ ሚካኤል',
  'mar-mikael-libelih',
  'Mar Mikael Libel',
  'ማር ሚካኤል ልበል',
  'exact_commemoration',
  1,
  'Feast of Archangel Michael in Sene (saving Saint John and suffering souls)',
  'የሰኔ ሚካኤል ዓመታዊ በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '2d9cfadf-351d-4017-a11f-b97db04a8339'::uuid,
  'observance-gabriel-tahsas',
  'observance',
  'Saint Gabriel — Tahsas',
  'ቅዱስ ገብርኤል',
  'gebriel-hayal-melake-selam',
  'Gebriel Hayal Melake Selam',
  'ገብርኤል ኃያል መልአከ ሰላም',
  'exact_commemoration',
  1,
  'Great Annual Feast of Archangel Gabriel in Tahsas (delivering the three holy youths from the furnace)',
  'የታኅሣሥ ገብርኤል ዓመታዊ በዓል - ሠለስቱ ደቂቅን ከእሳት ያዳነበት',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '2d9cfadf-351d-4017-a11f-b97db04a8339'::uuid,
  'observance-gabriel-tahsas',
  'observance',
  'Saint Gabriel — Tahsas',
  'ቅዱስ ገብርኤል',
  'yeramaw-gebriel',
  'Yeramaw Le’ul Gebriel',
  'የራማው ልዑል ገብርኤል',
  'exact_commemoration',
  1,
  'Praise hymn to Prince of Rama Archangel Gabriel',
  'የራማው ልዑል ቅዱስ ገብርኤል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'a21b29a1-7ea3-4595-bf1a-03df20310416'::uuid,
  'observance-gabriel-hamle',
  'observance',
  'Saint Gabriel — Hamle',
  'ቅዱስ ገብርኤል',
  'gebriel-hayal-melake-selam',
  'Gebriel Hayal Melake Selam',
  'ገብርኤል ኃያል መልአከ ሰላም',
  'exact_commemoration',
  1,
  'Annual Feast of Archangel Gabriel in Hamle (saving Saint Cyriacus and Julitta)',
  'የሐምሌ ገብርኤል ዓመታዊ በዓል - ቅዱስ ቂርቆስንና ኢየሉጣን ያዳነበት',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '041a15b8-641f-448d-aee6-10cae9102562'::uuid,
  'observance-bisrate-gabriel',
  'observance',
  'Bisrate Gabriel',
  'ብስራተ ገብርኤል',
  'absera-gebriel',
  'Absera Gebriel',
  'አብሠራ ገብርኤል',
  'exact_commemoration',
  1,
  'Feast of the Annunciation: Archangel Gabriel announcing the Good News to the Virgin Mary',
  'አብሠራ ገብርኤል - የብስራት በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '5dc3cfb2-d7a5-472f-9c60-ae3ff75bc625'::uuid,
  'observance-trinity-tir',
  'observance',
  'Holy Trinity — Tir',
  'ቅድስት ሥላሴ',
  'silassen-amesgnu',
  'Silassen Amesgnu',
  'ሥላሴን አመስግኑ',
  'exact_commemoration',
  1,
  'Feast of the Holy Trinity in Tir (commemorating the covenant with Abraham)',
  'የጥር ሥላሴ ዓመታዊ በዓል - ሥላሴን አመስግኑ',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '5dc3cfb2-d7a5-472f-9c60-ae3ff75bc625'::uuid,
  'observance-trinity-tir',
  'observance',
  'Holy Trinity — Tir',
  'ቅድስት ሥላሴ',
  'kibir-lesilase',
  'Kibir Lesilase',
  'ክብር ለሥላሴ',
  'exact_commemoration',
  1,
  'Doxology hymn: Glory to the Father, the Son, and the Holy Spirit',
  'ክብር ለሥላሴ - የምስጋና መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'aed7e953-3e04-4030-99c0-c6440efa20cf'::uuid,
  'observance-george-tir',
  'observance',
  'Saint George — Tir',
  'ቅዱስ ጊዮርጊስ',
  'nu-beegiziabiher-des-yibeleni-dinik-adigolignal-giyorigis-hayal',
  'Nu Beegiziabiher Des Yibeleni, Dinik Adigolignal , Giyorigis Hayal',
  'ኑ በእግዚአብሔር ደስ ይበለን፣ ድንቅ አድጎልኛል ፣ ጊዮርጊስ ሃያል',
  'exact_commemoration',
  1,
  'Commemorating Saint George the Martyr (building of his church and triumph in Tir)',
  'የጥር ቅዱስ ጊዮርጊስ በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '569ea752-3fa1-4739-84e2-e1be7710e055'::uuid,
  'observance-stephen-tir',
  'observance',
  'Saint Stephen the Protomartyr',
  'ቅዱስ እስጢፋኖስ',
  'estifanos-semeat',
  'Estifanos Semeat',
  'እስጢፋኖስ ሰማዕት',
  'exact_commemoration',
  1,
  'Commemoration of Saint Stephen the Protomartyr (Tir 1)',
  'እስጢፋኖስ ሰማዕት - የጥር ፩ መታሰቢያ መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'ec8134b0-4f97-4046-a043-a5f5278712f5'::uuid,
  'observance-tekle-haymanot-birth',
  'observance',
  'Abune Tekle Haymanot — Birth',
  'አቡነ ተክለ ሃይማኖት',
  'le-teklehaimanot-tsadiq',
  'Le-Teklehaimanot Tsadiq',
  'ለተክለሃይማኖት ጻድቅ',
  'exact_commemoration',
  1,
  'Celebrating the Holy Birth of Abune Tekle Haymanot (Hidar 24)',
  'የአቡነ ተክለ ሃይማኖት የልደት በዓል (ኅዳር ፳፬)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'c1cd6bf1-df57-47ed-9eb1-01fda3c301fb'::uuid,
  'observance-tekle-haymanot-departure',
  'observance',
  'Abune Tekle Haymanot — Departure',
  'አቡነ ተክለ ሃይማኖት',
  'amlak-tekle-haymanot',
  'Amlak Tekle Haymanot',
  'አምላክ ተክለ ሀይማኖት',
  'exact_commemoration',
  1,
  'Commemorating the Departure of Abune Tekle Haymanot (Nehase 24)',
  'የአቡነ ተክለ ሃይማኖት የዕረፍት በዓል (ነሐሴ ፳፬)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '665cbccf-7506-40e1-b0c3-d82a945c5dd1'::uuid,
  'observance-gebre-menfes-kidus-tikimt',
  'observance',
  'Abune Gebre Menfes Kidus — Great Feast',
  'አቡነ ገብረ መንፈስ ቅዱስ',
  'gebremenfes-kidus-yealem-birhan',
  'Gebre Menfes Kidus Ye’Alem Birhan Natchew',
  'ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው',
  'exact_commemoration',
  1,
  'Great Annual Feast of Abune Gebre Menfes Kidus (Abo) on Tikimt 5',
  'የአቡነ ገብረ መንፈስ ቅዱስ የጥቅምት ፭ ታላቅ በዓል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '37052d11-fa58-4ee1-8e0c-0edfd36e1af4'::uuid,
  'observance-gebre-menfes-kidus-megabit',
  'observance',
  'Abune Gebre Menfes Kidus — Departure',
  'አቡነ ገብረ መንፈስ ቅዱስ',
  'gebire-menifes-kidus-yealem-birihan-nachew',
  'Gebire Menifes Kidus Yealem Birihan Nachew',
  'ገብረ መንፈስ ቅዱስ የዓለም ብርሃን ናቸው',
  'exact_commemoration',
  1,
  'Commemorating the Departure of Abune Gebre Menfes Kidus on Megabit 5',
  'የአቡነ ገብረ መንፈስ ቅዱስ የመጋቢት ፭ የዕረፍት መታሰቢያ',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'cf7d65a3-6181-484a-9c57-257864ba7d2e'::uuid,
  'observance-yared-ginbot',
  'observance',
  'Saint Yared',
  'ቅዱስ ያሬድ',
  'ye-yared-wub-zema',
  'Ye Yared Wub Zema',
  'የያሬድ ውብ ዜማ',
  'exact_commemoration',
  1,
  'Annual Feast commemorating Saint Yared the Father of Ethiopian Hymnody (Ginbot 11)',
  'የቅዱስ ያሬድ የዜማ አባት ዓመታዊ በዓል (ግንቦት ፲፩)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'cf7d65a3-6181-484a-9c57-257864ba7d2e'::uuid,
  'observance-yared-ginbot',
  'observance',
  'Saint Yared',
  'ቅዱስ ያሬድ',
  'yared-kahenu-zemre',
  'Yared Kahenu zemre',
  'ያሬድ ካህኑ ዘመረ(2)',
  'exact_commemoration',
  1,
  'Hymn: Yared the Priest Sang unto God',
  'ያሬድ ካህኑ ዘመረ - የቅዱስ ያሬድ ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'ba819864-2df2-4f0d-b3cb-39dd32841fb7'::uuid,
  'tsige-season',
  'season',
  'Zemene Tsige / Season of Flower',
  NULL,
  'akilile-tsige-mariyam',
  'Akilile Tsige Mariyam',
  'አክሊለ ፅጌ ማርያም',
  'liturgical_season',
  1,
  'Appointed seasonal Marian hymn for Zemene Tsige (Season of Flowers)',
  'የዘመነ ጽጌ የወቅቱ የእመቤታችን መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '62811ba6-8be4-4375-9a0c-ee681baa3071'::uuid,
  'fast-tsige-fast',
  'fast',
  'Tsige Fast / Fast of the Holy Family',
  NULL,
  'akilile-tsige-mariyam',
  'Akilile Tsige Mariyam',
  'አክሊለ ፅጌ ማርያም',
  'fasting_occasion',
  1,
  'Hymn appointed for the voluntary Tsige Fast commemorating the Flight into Egypt',
  'የጽጌ ጾም የእመቤታችንና የጌታችን የስደቱ መታሰቢያ',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b02e782a-2178-46a5-b8f1-3fc99aab890f'::uuid,
  'great-lent',
  'season',
  'Great Lent',
  NULL,
  'nitsum-tsoma',
  'Nitsum Tsoma',
  'ንጹም ጾመ',
  'liturgical_season',
  1,
  'Liturgical Lent hymn exhorting fasting, prayer, and repentance: Nitsum Tsoma',
  'ንጹም ጾመ - የዓቢይ ጾም የምክርና የንስሐ መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b02e782a-2178-46a5-b8f1-3fc99aab890f'::uuid,
  'great-lent',
  'season',
  'Great Lent',
  NULL,
  'dinik-yeabiy-tsom-mezimur',
  'Dinik Yeabiy Tsom Mezimur',
  'ድንቅ የዓቢይ ጾም መዝሙር',
  'liturgical_season',
  1,
  'Great Lent contemplation hymn on forgiveness and spiritual renewal',
  'ድንቅ የዓቢይ ጾም መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '397cbda2-6390-4602-9a13-b62710d100d2'::uuid,
  'fast-weekly-wednesday-friday',
  'fast',
  'Tsome Dihinet / Wednesday and Friday Fast',
  'ጾመ ድህነት',
  'nitsum-tsoma',
  'Nitsum Tsoma',
  'ንጹም ጾመ',
  'fasting_occasion',
  1,
  'Weekly canonical fast of salvation commemorating Christ''s betrayal and Crucifixion',
  'የረቡዕና ዓርብ ጾመ ድህነት ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '397cbda2-6390-4602-9a13-b62710d100d2'::uuid,
  'fast-weekly-wednesday-friday',
  'fast',
  'Tsome Dihinet / Wednesday and Friday Fast',
  'ጾመ ድህነት',
  'tilin-bemeskelu-gedele',
  'Tilin Bemeskelu Gedele',
  'ጥልን በመስቀሉ ገደለ',
  'fasting_occasion',
  2,
  'Crucifixion contemplation hymn for Wednesday and Friday',
  'ጥልን በመስቀሉ ገደለ - የዕለተ ዓርብ ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '4b757189-8431-4456-9f9c-97364e61823a'::uuid,
  'apostles-fast-period',
  'season',
  'Apostles Fast period',
  NULL,
  'the-holy-apostle',
  'The Holy Apostle',
  NULL,
  'liturgical_season',
  1,
  'Hymn commemorating the Fast and ministry of the Holy Apostles',
  'የጾመ ሐዋርያት መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '9fac6187-3f29-4198-bae1-52cc72a91877'::uuid,
  'holy-week',
  'season',
  'Holy Week / Himamat',
  NULL,
  'weredo-emeskelu',
  'Werido Emeskelu',
  'ወሪዶ እመስቀሉ',
  'liturgical_season',
  1,
  'Holy Week hymn contemplating Christ''s deposition from the Cross',
  'ወሪዶ እመስቀሉ - የሕማማት ሰሞን መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '9fac6187-3f29-4198-bae1-52cc72a91877'::uuid,
  'holy-week',
  'season',
  'Holy Week / Himamat',
  NULL,
  'yesiklet-mezmur',
  'yesiklet mezmur',
  'የአብርሃም አምላክ',
  'liturgical_season',
  1,
  'Good Friday contemplation hymn on the Crucifixion and Passion of our Savior',
  'የስቅለት መዝሙር - የጌታችን መከራና ስቅለት',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'ab404ba8-f8f8-4a45-a387-659f3e8d9f3d'::uuid,
  'heraclius-week',
  'season',
  'Heraclius Week',
  NULL,
  'nitsum-tsoma',
  'Nitsum Tsoma',
  'ንጹም ጾመ',
  'liturgical_season',
  2,
  'Heraclius Week (first week of Lent) preparatory fasting hymn',
  'የጾመ ሕርቃል የመጀመሪያው የጾም ሳምንት መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '9b32300e-8c21-462d-9d9f-ecf38930035e'::uuid,
  'paschal-season',
  'season',
  'Paschal fifty days',
  NULL,
  'kirstos-tensae',
  'Kirstos Tensae',
  'ክርስቶስ ተንስአ',
  'liturgical_season',
  1,
  'Liturgical Paschal hymn: Christ is risen from the dead',
  'ክርስቶስ ተንስአ እሙታን - የትንሣኤ ወቅት መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '9b32300e-8c21-462d-9d9f-ecf38930035e'::uuid,
  'paschal-season',
  'season',
  'Paschal fifty days',
  NULL,
  'wemidrni-tigebir-fasika',
  'Wemidrni Tigebir Fasika',
  'ወምድርኒ ትገብር ፋሲካ',
  'liturgical_season',
  1,
  'Paschal joy hymn: And the earth celebrates Pascha',
  'ወምድርኒ ትገብር ፋሲካ - የትንሣኤ ወቅት ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b120a0ba-a4ee-48c1-b258-eb3643381df2'::uuid,
  'resurrection-period',
  'season',
  'Zemene Tinsae / Resurrection to Ascension',
  NULL,
  'tinsaeke-leele-amene',
  'Tinsaeke Le’ele Amene',
  'ትንሣኤከ ለእለ አመነ',
  'liturgical_season',
  1,
  'Season of Fifty Days hymn: We celebrate Your Holy Resurrection',
  'ትንሣኤከ ለእለ አመነ - የሃምሳው ቀናት ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '4dc842ff-30d4-4ae8-8ee8-3b6726901172'::uuid,
  'bright-week',
  'season',
  'Resurrection Week',
  NULL,
  'enidetenagere-tenesitwal',
  'Enidetenagere Tenesitwal',
  'እንደተናገረ ተነስቷል',
  'liturgical_season',
  1,
  'Bright Week hymn: He has risen as He promised',
  'እንደተናገረ ተነስቷል - የትንሣኤ ሰሞን መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '4b9c0b44-ae60-4724-940f-9481541f5a13'::uuid,
  'filseta-period',
  'season',
  'Filseta period',
  NULL,
  'saint-mary-has-ascended',
  'Saint Mary Has Ascended',
  NULL,
  'liturgical_season',
  1,
  'Appointed hymn for the sixteen days of the Filseta Fast (Nehase 1–16)',
  'የፍልሰታ ጾም የወቅቱ መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'ee9b335d-666f-4e43-8162-cf0fb228baf1'::uuid,
  'advent-sibket',
  'season',
  'Advent / Sibket',
  NULL,
  'reiywo-nolot',
  'Re''iywo Nolot',
  'ርእይዎ ኖሎት',
  'liturgical_season',
  1,
  'Advent proclamation hymn contemplating the coming of the Messiah',
  'የስብከት ወቅት መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '59999441-a2e1-47f8-b84f-65539eaa6def'::uuid,
  'sibket-period',
  'season',
  'Zemene Sibket / Proclamation',
  NULL,
  'reiywo-nolot',
  'Re''iywo Nolot',
  'ርእይዎ ኖሎት',
  'liturgical_season',
  1,
  'Season of Proclamation: The Prophets and Shepherds looking toward Bethlehem',
  'የዘመነ ስብከት የምሥራች መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '06c8cc5d-bf6c-426a-bb98-c1b77beee54f'::uuid,
  'nolawi-period',
  'season',
  'Zemene Nolawi / Good Shepherd',
  NULL,
  'anferatsu-sebea-segel',
  'Anferatsu Seba Segel',
  'አንፈራፁ ሰብአ ሰገል',
  'liturgical_season',
  1,
  'Season of the Good Shepherd: Prophecy and arrival of the True Shepherd',
  'የዘመነ ኖላዊ መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '7a30b8e1-6a23-4c14-b663-13f98fe3dcde'::uuid,
  'astereyo',
  'season',
  'Age of Aster’eyo / Revelation',
  NULL,
  'dingil-fetariwan',
  'Dingil Fetariwan',
  'ድንግል ፈጣሪዋን',
  'liturgical_season',
  2,
  'Season of Revelation (Aster''eyo): Manifestation of the Lord to mankind',
  'የዘመነ አስተርዮ የምስጋና መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '9890caa2-8a34-4f35-aec0-a2380197d575'::uuid,
  'berhan-period',
  'season',
  'Zemene Berhan / Light',
  NULL,
  'meskel-birhane',
  'Meskel Birhane',
  'መስቀል ብርሀነ',
  'liturgical_season',
  2,
  'Zemene Berhan (Season of Light) hymn: Walking in the Divine Light',
  'የዘመነ ብርሃን መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b93558ca-1aa6-45ca-81c7-37232b8fb681'::uuid,
  'monthly-lideta-maryam-monthly',
  'monthly',
  'Lideta Maryam',
  'ልደታ ማርያም',
  'akilile-tsige-mariyam',
  'Akilile Tsige Mariyam',
  'አክሊለ ፅጌ ማርያም',
  'exact_commemoration',
  1,
  'Monthly commemoration of the Nativity of Saint Mary (Lideta Maryam, 1st of month)',
  'የልደታ ማርያም ወርሃዊ መታሰቢያ (፩)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b93558ca-1aa6-45ca-81c7-37232b8fb681'::uuid,
  'monthly-lideta-maryam-monthly',
  'monthly',
  'Lideta Maryam',
  'ልደታ ማርያም',
  'dingil-fetariwan',
  'Dingil Fetariwan',
  'ድንግል ፈጣሪዋን',
  'exact_commemoration',
  1,
  'Marian praise hymn honoring the Mother of Life',
  'የእመቤታችን ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '69dbd7f5-baf6-445e-b7dd-41e4a392d6ea'::uuid,
  'monthly-beata-maryam-monthly',
  'monthly',
  'Presentation of Mary / Beata',
  'በአታለማርያም',
  'azekri-dingil',
  'Azekri Dingil',
  'አዘክሪ ድንግል',
  'exact_commemoration',
  1,
  'Monthly commemoration of the Presentation of Saint Mary in the Temple (Ba''ata, 3rd of month)',
  'የበአታ ለማርያም ወርሃዊ መታሰቢያ (፫)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'c754efe4-64b6-44a3-afef-8106f279198a'::uuid,
  'monthly-gebre-menfes-kidus-monthly',
  'monthly',
  'Abune Gebre Menfes Kidus',
  'አቡነ ገብረ መንፈስ ቅዱስ',
  'gebremenfes-kidus-yealem-birhan',
  'Gebre Menfes Kidus Ye’Alem Birhan Natchew',
  'ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው',
  'exact_commemoration',
  1,
  'Monthly commemoration of Abune Gebre Menfes Kidus (Abo, 5th of month)',
  'የአቡነ ገብረ መንፈስ ቅዱስ ወርሃዊ መታሰቢያ (፭)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'c754efe4-64b6-44a3-afef-8106f279198a'::uuid,
  'monthly-gebre-menfes-kidus-monthly',
  'monthly',
  'Abune Gebre Menfes Kidus',
  'አቡነ ገብረ መንፈስ ቅዱስ',
  'gebire-menifes-kidus-yealem-birihan-nachew',
  'Gebire Menifes Kidus Yealem Birihan Nachew',
  'ገብረ መንፈስ ቅዱስ የዓለም ብርሃን ናቸው',
  'exact_commemoration',
  1,
  'Hymn exalting Saint Gebre Menfes Kidus as a light to the world',
  'ገብረ መንፈስ ቅዱስ የዓለም ብርሃን ናቸው',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '1cfb5b0e-72b9-4b17-9578-a799807a0713'::uuid,
  'monthly-qusquam-maryam-monthly',
  'monthly',
  'Qusquam Maryam',
  'ቁስቋም ማርያም',
  'azekri-dingil',
  'Azekri Dingil',
  'አዘክሪ ድንግል',
  'exact_commemoration',
  1,
  'Monthly commemoration of Mount Qusquam and refuge of the Holy Family (6th of month)',
  'የቁስቋም ማርያም ወርሃዊ መታሰቢያ (፮)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '67214352-6750-4d55-b0a8-be1cffeb030d'::uuid,
  'monthly-jesus-monthly',
  'monthly',
  'Iyyasus / Jesus',
  'ኢየሱስ',
  'eyesus-tewelidu-gena-mezmur-eritrean-orthodox-mezmur-zemari-bereket-tiku',
  'Eyesus tewelidu / / Gena mezmur / Eritrean orthodox mezmur / zemari Bereket Tikue',
  'ኢየሱስ ተወሊዱ',
  'exact_commemoration',
  1,
  'Monthly commemoration of our Lord and Savior Jesus Christ (Iyyasus, 6th of month)',
  'የኢየሱስ ወርሃዊ መታሰቢያ ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'f96f8978-a50f-4bdf-9256-4c9728de1172'::uuid,
  'monthly-trinity-monthly',
  'monthly',
  'Holy Trinity',
  'ቅድስት ሥላሴ',
  'silassen-amesgnu',
  'Silassen Amesgnu',
  'ሥላሴን አመስግኑ',
  'exact_commemoration',
  1,
  'Monthly commemoration of the Holy Trinity (Selassie, 7th of month)',
  'የቅድስት ሥላሴ ወርሃዊ መታሰቢያ (፯)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'f96f8978-a50f-4bdf-9256-4c9728de1172'::uuid,
  'monthly-trinity-monthly',
  'monthly',
  'Holy Trinity',
  'ቅድስት ሥላሴ',
  'kibir-lesilase',
  'Kibir Lesilase',
  'ክብር ለሥላሴ',
  'exact_commemoration',
  1,
  'Doxology: Glory to the Holy Trinity, One in Three and Three in One',
  'ክብር ለሥላሴ - የምስጋና መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'f96f8978-a50f-4bdf-9256-4c9728de1172'::uuid,
  'monthly-trinity-monthly',
  'monthly',
  'Holy Trinity',
  'ቅድስት ሥላሴ',
  'menigisite-silase',
  'Menigisite Silase',
  'መንግስተ ሥላሴ',
  'exact_commemoration',
  1,
  'Praising the eternal kingdom of the Holy Trinity',
  'መንግስተ ሥላሴ - የሥላሴ ክብር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '1349d77e-978b-4878-8a19-622fe28c84e8'::uuid,
  'monthly-cross-monthly',
  'monthly',
  'Holy Cross',
  'መስቀለ ክርስቶስ',
  'meskel-birhane',
  'Meskel Birhane',
  'መስቀል ብርሀነ',
  'exact_commemoration',
  1,
  'Monthly commemoration of the Holy Cross of our Lord Jesus Christ (10th of month)',
  'የመስቀለ ክርስቶስ ወርሃዊ መታሰቢያ (፲)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '1349d77e-978b-4878-8a19-622fe28c84e8'::uuid,
  'monthly-cross-monthly',
  'monthly',
  'Holy Cross',
  'መስቀለ ክርስቶስ',
  'tilin-bemeskelu-gedele',
  'Tilin Bemeskelu Gedele',
  'ጥልን በመስቀሉ ገደለ',
  'exact_commemoration',
  1,
  'Contemplating redemption and salvation through the Holy Cross',
  'ጥልን በመስቀሉ ገደለ - የመስቀል ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '7ebaf865-690d-4fa6-9397-d85828dc58f3'::uuid,
  'monthly-michael-monthly',
  'monthly',
  'Archangel Michael',
  'ቅዱስ ሚካኤል',
  'liredan-meta-mikael',
  'Liredan Meta Mikael',
  'ሊረዳን መጣ',
  'exact_commemoration',
  1,
  'Monthly commemoration of Archangel Michael (12th of month)',
  'የሊቀ መላእክት ቅዱስ ሚካኤል ወርሃዊ መታሰቢያ (፲፪)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '7ebaf865-690d-4fa6-9397-d85828dc58f3'::uuid,
  'monthly-michael-monthly',
  'monthly',
  'Archangel Michael',
  'ቅዱስ ሚካኤል',
  'mar-mikael-libelih',
  'Mar Mikael Libel',
  'ማር ሚካኤል ልበል',
  'exact_commemoration',
  1,
  'Intercession hymn honoring Saint Michael the protector',
  'ማር ሚካኤል - የአማላጅነቱ ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '7ebaf865-690d-4fa6-9397-d85828dc58f3'::uuid,
  'monthly-michael-monthly',
  'monthly',
  'Archangel Michael',
  'ቅዱስ ሚካኤል',
  'tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe',
  'Tewedaj Yekidus Mikael Mezimurat Liredagn Meta//yeafomiya Eredat Neh//beberehaw Beharuru',
  'ተወዳጅ የቅዱስ ሚካኤል መዝሙራት ሊረዳኝ መጣ//የአፎምያ እረዳት ነህ//በበረሀው በሀሩሩ',
  'exact_commemoration',
  1,
  'Hymn commemorating Michael''s swift assistance in times of need',
  'የቅዱስ ሚካኤል ተወዳጅ መዝሙራት',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '48d07ffe-bc2d-46f8-bdde-a6daec2e9072'::uuid,
  'monthly-raphael-monthly',
  'monthly',
  'Archangel Raphael',
  'ቅዱስ ሩፋኤል',
  'rufael-tekebel-tseloten',
  'Rufael Tekebel Tseloten',
  'ሩፋኤል ተቀበል ፀሎቴን',
  'exact_commemoration',
  1,
  'Monthly commemoration of Archangel Raphael the healer and comforter (13th of month)',
  'የቅዱስ ሩፋኤል ወርሃዊ መታሰቢያ (፲፫)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '48d07ffe-bc2d-46f8-bdde-a6daec2e9072'::uuid,
  'monthly-raphael-monthly',
  'monthly',
  'Archangel Raphael',
  'ቅዱስ ሩፋኤል',
  'rufael-abate',
  'Rufael Abate',
  'ሩፋኤል አባቴ',
  'exact_commemoration',
  1,
  'Prayer hymn: Saint Raphael our spiritual father and intercessor',
  'ሩፋኤል አባቴ - የፈዋሹ መልአክ ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '863ece1d-b1ae-4c1a-9da3-6d0af9d0399d'::uuid,
  'monthly-god-father-monthly',
  'monthly',
  'God the Father',
  'እግዚአብሔር አብ',
  'silassen-amesgnu',
  'Silassen Amesgnu',
  'ሥላሴን አመስግኑ',
  'exact_commemoration',
  1,
  'Monthly commemoration of God the Father (Egziabher Ab, 13th of month)',
  'የእግዚአብሔር አብ ወርሃዊ መታሰቢያ (፲፫)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'd276d639-8d4f-420a-bf6d-e7f5d3e85430'::uuid,
  'monthly-aregawi-monthly',
  'monthly',
  'Abune Aregawi',
  'አቡነ አረጋዊ',
  'abunearegawi-zemarit-betselot-asmare',
  'AbuneAregawi Zemarit Betselot Asmare',
  'አቡነአረጋዊ',
  'exact_commemoration',
  1,
  'Monthly commemoration of Abune Aregawi of Debre Damo (14th of month)',
  'የአቡነ አረጋዊ ዘደብረ ዳሞ ወርሃዊ መታሰቢያ (፲፬)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '084690cd-19ee-455c-9aee-123708b9b5e8'::uuid,
  'monthly-cyriacus-julitta-monthly',
  'monthly',
  'Saints Cyriacus and Julitta',
  'ቂርቆስና እየሉጣ',
  'qirqos-iyelutan',
  'Selestun Dekikan',
  'ቂርቆስ ኢየሉጣን',
  'exact_commemoration',
  1,
  'Monthly commemoration of the child martyr Saint Cyriacus and his mother Julitta (15th of month)',
  'የቅዱስ ቂርቆስና እናቱ እየሉጣ ወርሃዊ መታሰቢያ (፲፭)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '52f2ef0e-1c8d-4eb0-8313-eb27bab77457'::uuid,
  'monthly-kidane-mihret-monthly',
  'monthly',
  'Kidane Mihret',
  'ኪዳነ ምሕረት',
  'kidane-mihret-emebet',
  'Kidane Mihret Emebet',
  'ኪዳነ ምሕረት እመቤት',
  'exact_commemoration',
  1,
  'Monthly commemoration of Our Lady of the Covenant of Mercy (Kidane Mihret, 16th of month)',
  'የኪዳነ ምሕረት ወርሃዊ መታሰቢያ (፲፮)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '52f2ef0e-1c8d-4eb0-8313-eb27bab77457'::uuid,
  'monthly-kidane-mihret-monthly',
  'monthly',
  'Kidane Mihret',
  'ኪዳነ ምሕረት',
  'kidane-mihiret-enate',
  'Kidane Mihiret Enate',
  'ኪዳነ ምሕረት እናቴ',
  'exact_commemoration',
  1,
  'Intercession hymn honoring the Covenant of Mercy',
  'ኪዳነ ምሕረት እናቴ - የወርሃዊ መታሰቢያ ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '52f2ef0e-1c8d-4eb0-8313-eb27bab77457'::uuid,
  'monthly-kidane-mihret-monthly',
  'monthly',
  'Kidane Mihret',
  'ኪዳነ ምሕረት',
  'enat-alegn-kidane-mihiret',
  'Enat Alegn Kidane Mihiret',
  'እናት አለኝ - ኪዳነ ምሕረት',
  'exact_commemoration',
  1,
  'Devotional praise: I have a heavenly Mother, Kidane Mihret',
  'እናት አለኝ ኪዳነ ምሕረት',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '2f924065-ec13-4ae4-a82c-c9f361dd2f8b'::uuid,
  'monthly-stephen-monthly',
  'monthly',
  'Saint Stephen',
  'ቅዱስ እስጢፋኖስ',
  'estifanos-semeat',
  'Estifanos Semeat',
  'እስጢፋኖስ ሰማዕት',
  'exact_commemoration',
  1,
  'Monthly commemoration of Saint Stephen the Protomartyr (17th of month)',
  'የቅዱስ እስጢፋኖስ ቀዳሜ ሰማዕት ወርሃዊ መታሰቢያ (፲፯)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'a7097e40-c78b-4863-a099-64df5d7d26df'::uuid,
  'monthly-gabriel-monthly',
  'monthly',
  'Archangel Gabriel',
  'ቅዱስ ገብርኤል',
  'gebriel-hayal-melake-selam',
  'Gebriel Hayal Melake Selam',
  'ገብርኤል ኃያል መልአከ ሰላም',
  'exact_commemoration',
  1,
  'Monthly commemoration of Archangel Gabriel (19th of month)',
  'የሊቀ መላእክት ቅዱስ ገብርኤል ወርሃዊ መታሰቢያ (፲፱)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'a7097e40-c78b-4863-a099-64df5d7d26df'::uuid,
  'monthly-gabriel-monthly',
  'monthly',
  'Archangel Gabriel',
  'ቅዱስ ገብርኤል',
  'yeramaw-gebriel',
  'Yeramaw Le’ul Gebriel',
  'የራማው ልዑል ገብርኤል',
  'exact_commemoration',
  1,
  'Praising Gabriel, Prince of Rama and protector of the saints',
  'የራማው ልዑል ቅዱስ ገብርኤል መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'a7097e40-c78b-4863-a099-64df5d7d26df'::uuid,
  'monthly-gabriel-monthly',
  'monthly',
  'Archangel Gabriel',
  'ቅዱስ ገብርኤል',
  'gebirielin-lakew',
  'Gebirielin Lakew',
  'ገብርኤልን ላከው',
  'exact_commemoration',
  1,
  'Hymn: God sent Archangel Gabriel with glad tidings',
  'ገብርኤልን ላከው - የቅዱስ ገብርኤል ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b6c1d41e-9e67-4879-8a4b-3a62060f1083'::uuid,
  'monthly-maryam-monthly',
  'monthly',
  'Virgin Mary',
  'ቅድስት ማርያም',
  'dingil-fetariwan',
  'Dingil Fetariwan',
  'ድንግል ፈጣሪዋን',
  'exact_commemoration',
  1,
  'Monthly commemoration of the Holy Virgin Mary (21st of month)',
  'የቅድስት ድንግል ማርያም ወርሃዊ መታሰቢያ (፳፩)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b6c1d41e-9e67-4879-8a4b-3a62060f1083'::uuid,
  'monthly-maryam-monthly',
  'monthly',
  'Virgin Mary',
  'ቅድስት ማርያም',
  'azekri-dingil',
  'Azekri Dingil',
  'አዘክሪ ድንግል',
  'exact_commemoration',
  1,
  'Traditional Marian prayer: Remember us, O Holy Virgin',
  'አዘክሪ ድንግል - የእመቤታችን ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'b6c1d41e-9e67-4879-8a4b-3a62060f1083'::uuid,
  'monthly-maryam-monthly',
  'monthly',
  'Virgin Mary',
  'ቅድስት ማርያም',
  'adegnegn-enate-kesega-fetena',
  'Adegnegn Enate Kesega Fetena',
  'አድኝኝ እናቴ ከስጋ ፈተና',
  'exact_commemoration',
  1,
  'Marian intercession prayer for protection and salvation',
  'አድኝኝ እናቴ ከሥጋ ፈተና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'c79ae606-e1cc-48a8-a9d0-a63d6460efdc'::uuid,
  'monthly-maryam-church-monthly',
  'monthly',
  'Church Dedicated to Mary',
  'ሕንፀተ ቤተ ክርስቲያን',
  'dingil-embete-yehiywete-redat',
  'Dingil Embete Yehiywete Redat',
  'ድንግል እመቤቴ',
  'exact_commemoration',
  1,
  'Monthly commemoration of the Consecration of the First Church of Saint Mary (Hinseta Beta Kristiyan)',
  'የሕንፀተ ቤተ ክርስቲያን ወርሃዊ መታሰቢያ (፳፩)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'bf1ff211-309a-4f63-924f-7afd3a10d478'::uuid,
  'monthly-tsedenya-maryam-monthly',
  'monthly',
  'Tsedenya Maryam',
  'ፀደንያ ማርያም',
  'azekri-dingil',
  'Azekri Dingil',
  'አዘክሪ ድንግል',
  'exact_commemoration',
  1,
  'Commemoration of the Miraculous Icon of Saint Mary of Tsedenya',
  'የፀደንያ ማርያም ተአምረኛ ሥዕል መታሰቢያ',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'bfde31de-9064-4c13-a7b3-4459bebc0da4'::uuid,
  'monthly-giorgis-monthly',
  'monthly',
  'Saint George',
  'ቅዱስ ጊዮርጊስ',
  'nu-beegiziabiher-des-yibeleni-dinik-adigolignal-giyorigis-hayal',
  'Nu Beegiziabiher Des Yibeleni, Dinik Adigolignal , Giyorigis Hayal',
  'ኑ በእግዚአብሔር ደስ ይበለን፣ ድንቅ አድጎልኛል ፣ ጊዮርጊስ ሃያል',
  'exact_commemoration',
  1,
  'Monthly commemoration of Saint George the Great Martyr (23rd of month)',
  'የቅዱስ ጊዮርጊስ ሊቀ ሰማዕታት ወርሃዊ መታሰቢያ (፳፫)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '2e886af6-c7ab-4458-9017-e66b2cf7a135'::uuid,
  'monthly-tekle-haymanot-monthly',
  'monthly',
  'Abune Tekle Haymanot',
  'አቡነ ተክለ ሃይማኖት',
  'le-teklehaimanot-tsadiq',
  'Le-Teklehaimanot Tsadiq',
  'ለተክለሃይማኖት ጻድቅ',
  'exact_commemoration',
  1,
  'Monthly commemoration of Abune Tekle Haymanot (24th of month)',
  'የአቡነ ተክለ ሃይማኖት ወርሃዊ መታሰቢያ (፳፬)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '2e886af6-c7ab-4458-9017-e66b2cf7a135'::uuid,
  'monthly-tekle-haymanot-monthly',
  'monthly',
  'Abune Tekle Haymanot',
  'አቡነ ተክለ ሃይማኖት',
  'teklehaymanot-live-mezmur',
  'Teklehaymanot / / Live mezmur',
  'ተክለ ሃይማኖት',
  'exact_commemoration',
  1,
  'Hymn praising the asceticism and prayers of Abune Tekle Haymanot',
  'የአቡነ ተክለ ሃይማኖት ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'e8a889f6-bcc9-437a-ab90-2ca800be2328'::uuid,
  'monthly-passion-monthly',
  'monthly',
  'Medhane Alem / Saviour of the World',
  'መድሐኔአለም',
  'medhanealem-simeh-genana',
  'Medhanealem Simeh Genana',
  'መድኅኔዓለም ስምህ ገናና',
  'exact_commemoration',
  1,
  'Monthly commemoration of Medhane Alem / Savior of the World and the Passion of Christ (27th of month)',
  'የመድኃኔዓለም ወርሃዊ መታሰቢያ (፳፯)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  'e8a889f6-bcc9-437a-ab90-2ca800be2328'::uuid,
  'monthly-passion-monthly',
  'monthly',
  'Medhane Alem / Saviour of the World',
  'መድሐኔአለም',
  'medihanealem-yelem-yemisanew',
  'Medihanealem Yelem Yemisanew',
  'መድኃኔዓለም የለም የሚሳነው',
  'exact_commemoration',
  1,
  'Hymn exalting the boundless mercy and salvation of Medhane Alem',
  'መድኃኔዓለም የለም የሚሳነው - የምስጋና መዝሙር',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '6838c7c9-cf6a-46e3-ba12-388aab7b67d1'::uuid,
  'monthly-emmanuel-monthly',
  'monthly',
  'Emmanuel',
  'አማኑኤል',
  'amanuel-temesgen',
  'Amanuel Temesgen',
  'አማኑኤል ተመስገን',
  'exact_commemoration',
  1,
  'Monthly commemoration of Emmanuel — God with Us (28th of month)',
  'የአማኑኤል ወርሃዊ መታሰቢያ - አማኑኤል ተመስገን (፳፰)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '6838c7c9-cf6a-46e3-ba12-388aab7b67d1'::uuid,
  'monthly-emmanuel-monthly',
  'monthly',
  'Emmanuel',
  'አማኑኤል',
  'nana-amanuel-na-medhanite',
  'Nana Amanuel Na Medhanite',
  'ናና አማኑኤል ና መድኃኒቴ',
  'exact_commemoration',
  1,
  'Prayer hymn: Come, O Emmanuel, our Savior',
  'ናና አማኑኤል ና መድኃኒቴ',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '91feb74a-00b4-4777-a761-48246345a5bd'::uuid,
  'monthly-nativity-monthly',
  'monthly',
  'Ba’ale Wold / Feast of God the Son',
  'በዓለወልድ',
  'beza-kulu-alem-yom-tewolede',
  'Beza Kulu Alem Yom Tewolede',
  'ቤዛ ኩሉ ዓለም ዮም ተወልደ',
  'exact_commemoration',
  1,
  'Monthly commemoration of the Nativity of Christ / Ba''ale Wold (29th of month)',
  'የበዓለ ወልድ ወርሃዊ መታሰቢያ - የልደት ምስጋና (፳፱)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '91feb74a-00b4-4777-a761-48246345a5bd'::uuid,
  'monthly-nativity-monthly',
  'monthly',
  'Ba’ale Wold / Feast of God the Son',
  'በዓለወልድ',
  'amanuel-temesgen',
  'Amanuel Temesgen',
  'አማኑኤል ተመስገን',
  'exact_commemoration',
  1,
  'Praising God the Son Incarnate for our salvation',
  'ለበዓለ ወልድ የቀረበ ምስጋና',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '90e0ca8b-01fd-4442-b314-b38a117e2c28'::uuid,
  'monthly-annunciation-monthly',
  'monthly',
  'Annunciation / Bisrate Gabriel',
  'ብስራተ ገብርኤል',
  'absera-gebriel',
  'Absera Gebriel',
  'አብሠራ ገብርኤል',
  'exact_commemoration',
  1,
  'Monthly commemoration of the Annunciation of the Lord (Bisrate Gabriel, 29th of month)',
  'የብስራተ ገብርኤል ወርሃዊ መታሰቢያ (፳፱)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  '9b3a1314-f0b6-4930-9eb6-04d5ab945275'::uuid,
  'monthly-yared-monthly',
  'monthly',
  'Saint Yared',
  'ቅዱስ ያሬድ',
  'ye-yared-wub-zema',
  'Ye Yared Wub Zema',
  'የያሬድ ውብ ዜማ',
  'exact_commemoration',
  1,
  'Monthly commemoration of Saint Yared the father of Church music',
  'የቅዱስ ያሬድ ወርሃዊ መታሰቢያ (፲፬)',
  'approved'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();

NOTIFY pgrst, 'reload schema';

COMMIT;
