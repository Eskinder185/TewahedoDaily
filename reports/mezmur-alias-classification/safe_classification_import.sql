-- Generated from the completed 2,092-row classification output.
-- ADD-ONLY: existing manual/category/occasion relationships are never deleted.
-- DEFAULT IS ROLLBACK. Do not change to COMMIT without explicit owner approval.
begin;
set local lock_timeout = '5s';
set local statement_timeout = '120s';

create temporary table classification_stage(
  import_id uuid not null,
  expected_slug text not null,
  expected_updated_at timestamptz not null,
  relationship_kind text not null check (relationship_kind in ('category','occasion')),
  taxonomy_slug text not null,
  classification_rank integer not null check (classification_rank > 0),
  confidence text not null
) on commit drop;

insert into classification_stage values
('036d2caf-0bf2-4a38-ac6a-b788a09af04e','ante-bicha','2026-10-26 23:00:09.849171+00','category','jesus-christ',1,'HIGH'),
('036d2caf-0bf2-4a38-ac6a-b788a09af04e','ante-bicha','2026-10-26 23:00:09.849171+00','category','praise-worship',2,'HIGH'),
('036d2caf-0bf2-4a38-ac6a-b788a09af04e','ante-bicha','2026-10-26 23:00:09.849171+00','occasion','general',1,'HIGH'),
('04b62b04-4327-48da-9cc0-6bfcfcb7922f','she-is-born-for-us-all','2026-10-26 23:00:34.042939+00','category','virgin-mary',1,'MEDIUM'),
('04b62b04-4327-48da-9cc0-6bfcfcb7922f','she-is-born-for-us-all','2026-10-26 23:00:34.042939+00','category','salvation',2,'MEDIUM'),
('04b62b04-4327-48da-9cc0-6bfcfcb7922f','she-is-born-for-us-all','2026-10-26 23:00:34.042939+00','occasion','general',1,'MEDIUM'),
('062f60c1-528a-4759-9496-c77b9982e31a','mindaye-berhanu-selam-leki','2026-10-26 23:00:30.590331+00','category','virgin-mary',1,'HIGH'),
('062f60c1-528a-4759-9496-c77b9982e31a','mindaye-berhanu-selam-leki','2026-10-26 23:00:30.590331+00','occasion','lideta-maryam',1,'HIGH'),
('096af884-a38d-414c-84f6-843c69db8727','from-the-scorching-flames','2026-10-26 23:00:20.263977+00','category','kidus-gabriel',1,'HIGH'),
('096af884-a38d-414c-84f6-843c69db8727','from-the-scorching-flames','2026-10-26 23:00:20.263977+00','occasion','general',1,'HIGH'),
('0bf979d8-fc99-49d0-ad9c-e533456ac839','according-to-your-mercy','2026-10-26 23:00:09.849171+00','category','jesus-christ',1,'HIGH'),
('0bf979d8-fc99-49d0-ad9c-e533456ac839','according-to-your-mercy','2026-10-26 23:00:09.849171+00','occasion','general',1,'HIGH'),
('0da43b7d-0abb-4939-bf25-c9f165434972','deg-degun-asayen','2026-10-26 23:00:16.4837+00','category','repentance',1,'HIGH'),
('0da43b7d-0abb-4939-bf25-c9f165434972','deg-degun-asayen','2026-10-26 23:00:16.4837+00','occasion','new-year',1,'HIGH'),
('0f249ce7-e9c5-4ed4-8f47-04f2fae36a4a','aklile-nesh','2026-10-26 23:00:09.849171+00','category','virgin-mary',1,'HIGH'),
('0f249ce7-e9c5-4ed4-8f47-04f2fae36a4a','aklile-nesh','2026-10-26 23:00:09.849171+00','occasion','general',1,'HIGH'),
('12d93716-8117-45f7-aafa-c9b2ca970a59','yikuneni','2026-10-26 23:00:40.515162+00','category','virgin-mary',1,'HIGH'),
('12d93716-8117-45f7-aafa-c9b2ca970a59','yikuneni','2026-10-26 23:00:40.515162+00','category','kidus-gabriel',2,'HIGH'),
('12d93716-8117-45f7-aafa-c9b2ca970a59','yikuneni','2026-10-26 23:00:40.515162+00','category','salvation',3,'HIGH'),
('12d93716-8117-45f7-aafa-c9b2ca970a59','yikuneni','2026-10-26 23:00:40.515162+00','occasion','general',1,'HIGH'),
('12dcded7-ba49-498b-9b62-3559752e17e2','kidanki-kone','2026-10-26 23:00:24.276265+00','category','virgin-mary',1,'HIGH'),
('12dcded7-ba49-498b-9b62-3559752e17e2','kidanki-kone','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('15428d8a-b96c-494d-856a-cbd8cc6bfca8','metadel-new','2026-10-26 23:00:30.590331+00','category','virgin-mary',1,'HIGH'),
('15428d8a-b96c-494d-856a-cbd8cc6bfca8','metadel-new','2026-10-26 23:00:30.590331+00','category','salvation',2,'HIGH'),
('15428d8a-b96c-494d-856a-cbd8cc6bfca8','metadel-new','2026-10-26 23:00:30.590331+00','category','jesus-christ',3,'HIGH'),
('15428d8a-b96c-494d-856a-cbd8cc6bfca8','metadel-new','2026-10-26 23:00:30.590331+00','occasion','general',1,'HIGH'),
('1547f98d-e238-4ea2-b4cb-4e12d6e1fbaf','who-else-do-i-have','2026-10-26 23:00:37.215606+00','category','virgin-mary',1,'HIGH'),
('1547f98d-e238-4ea2-b4cb-4e12d6e1fbaf','who-else-do-i-have','2026-10-26 23:00:37.215606+00','category','prayer',2,'HIGH'),
('1547f98d-e238-4ea2-b4cb-4e12d6e1fbaf','who-else-do-i-have','2026-10-26 23:00:37.215606+00','category','saints',3,'HIGH'),
('1547f98d-e238-4ea2-b4cb-4e12d6e1fbaf','who-else-do-i-have','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('15773b58-0af3-4a85-91e8-6299ecb4f0a3','sisemaw-yadekut','2026-10-26 23:00:34.042939+00','category','virgin-mary',1,'HIGH'),
('15773b58-0af3-4a85-91e8-6299ecb4f0a3','sisemaw-yadekut','2026-10-26 23:00:34.042939+00','occasion','general',1,'HIGH'),
('16a6a1b4-12e0-497d-ac05-7b3d7b8b9d55','kidanmhret-emebete','2026-10-26 23:00:24.276265+00','category','virgin-mary',1,'HIGH'),
('16a6a1b4-12e0-497d-ac05-7b3d7b8b9d55','kidanmhret-emebete','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('170082b8-4687-4c20-aba7-f1b4b20d7db9','yegojoye-selam','2026-10-26 23:00:37.215606+00','category','virgin-mary',1,'HIGH'),
('170082b8-4687-4c20-aba7-f1b4b20d7db9','yegojoye-selam','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('17893bf2-e88c-4ede-b295-ceb9fe2f2d83','beabate-bet','2026-10-26 23:00:13.156068+00','category','repentance',1,'MEDIUM'),
('17893bf2-e88c-4ede-b295-ceb9fe2f2d83','beabate-bet','2026-10-26 23:00:13.156068+00','occasion','general',1,'MEDIUM'),
('183f835f-0576-4602-93dd-8ceb1d3d1815','theotokos','2026-10-26 23:00:34.042939+00','category','virgin-mary',1,'HIGH'),
('183f835f-0576-4602-93dd-8ceb1d3d1815','theotokos','2026-10-26 23:00:34.042939+00','category','prophets',2,'HIGH'),
('183f835f-0576-4602-93dd-8ceb1d3d1815','theotokos','2026-10-26 23:00:34.042939+00','occasion','general',1,'HIGH'),
('1a311c5a-b73d-4575-b9ed-c13aeaf6cdd6','fetena-wejeb-bibeza','2026-10-27 11:43:22.59688+00','category','general',1,'MEDIUM'),
('1a311c5a-b73d-4575-b9ed-c13aeaf6cdd6','fetena-wejeb-bibeza','2026-10-27 11:43:22.59688+00','occasion','general',1,'MEDIUM'),
('1b282d00-08f2-47b8-960f-04b0ea6df69a','zemarit-enkusilase-gossa-o-gebriel-o-gebiriel-lyrics-video','2026-10-26 23:00:40.515162+00','category','kidus-gabriel',1,'HIGH'),
('1b282d00-08f2-47b8-960f-04b0ea6df69a','zemarit-enkusilase-gossa-o-gebriel-o-gebiriel-lyrics-video','2026-10-26 23:00:40.515162+00','category','salvation',2,'HIGH'),
('1b282d00-08f2-47b8-960f-04b0ea6df69a','zemarit-enkusilase-gossa-o-gebriel-o-gebiriel-lyrics-video','2026-10-26 23:00:40.515162+00','occasion','general',1,'HIGH'),
('1d48c5ef-573f-450a-9926-e6deb6284578','praise-and-glory','2026-10-27 15:43:25.970529+00','category','praise-worship',1,'HIGH'),
('1d48c5ef-573f-450a-9926-e6deb6284578','praise-and-glory','2026-10-27 15:43:25.970529+00','occasion','general',1,'HIGH'),
('1f3083d6-378f-4718-89e6-c194cd414fe2','begol-sekebe','2026-10-26 23:00:13.156068+00','category','salvation',1,'HIGH'),
('1f3083d6-378f-4718-89e6-c194cd414fe2','begol-sekebe','2026-10-26 23:00:13.156068+00','occasion','general',1,'HIGH'),
('20949368-b5f0-4482-958f-581628cb2d2c','haile-bertate-kebre-moges','2026-10-26 23:00:24.276265+00','category','holy-trinity',1,'HIGH'),
('20949368-b5f0-4482-958f-581628cb2d2c','haile-bertate-kebre-moges','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('20c1fcd3-44c7-4168-9835-4416e0ce276f','come-all-let-us-rejoice','2026-10-26 23:00:16.4837+00','category','jesus-christ',1,'HIGH'),
('20c1fcd3-44c7-4168-9835-4416e0ce276f','come-all-let-us-rejoice','2026-10-26 23:00:16.4837+00','category','praise-worship',2,'HIGH'),
('20c1fcd3-44c7-4168-9835-4416e0ce276f','come-all-let-us-rejoice','2026-10-26 23:00:16.4837+00','occasion','general',1,'HIGH'),
('28887768-61f0-4658-891f-ca4080e67fce','amalaje-zemari-yonas-gebrekidan','2026-10-26 23:00:09.849171+00','category','virgin-mary',1,'HIGH'),
('28887768-61f0-4658-891f-ca4080e67fce','amalaje-zemari-yonas-gebrekidan','2026-10-26 23:00:09.849171+00','occasion','general',1,'HIGH'),
('28b4894a-ccc2-4fd5-aaa2-3727142ebafa','my-strength-and-power','2026-10-26 23:00:30.590331+00','category','holy-trinity',1,'HIGH'),
('28b4894a-ccc2-4fd5-aaa2-3727142ebafa','my-strength-and-power','2026-10-26 23:00:30.590331+00','category','holy-spirit',2,'HIGH'),
('28b4894a-ccc2-4fd5-aaa2-3727142ebafa','my-strength-and-power','2026-10-26 23:00:30.590331+00','occasion','general',1,'HIGH'),
('2ab6c7cc-49e8-46b8-beca-cf64f0df222f','zemarit-marita-hayile-silase-simih-behulu-temesegene','2026-10-26 23:00:40.515162+00','category','praise-worship',1,'MEDIUM'),
('2ab6c7cc-49e8-46b8-beca-cf64f0df222f','zemarit-marita-hayile-silase-simih-behulu-temesegene','2026-10-26 23:00:40.515162+00','occasion','general',1,'MEDIUM'),
('2abedd96-d0c4-4e43-b5e9-e2cb5413701d','tsadqan-burukan','2026-10-27 11:43:23.025887+00','category','jesus-christ',1,'MEDIUM'),
('2abedd96-d0c4-4e43-b5e9-e2cb5413701d','tsadqan-burukan','2026-10-27 11:43:23.025887+00','occasion','general',1,'MEDIUM'),
('2bd78c0e-e483-47df-9759-561a29ec6c66','yene-geta','2026-10-26 23:00:40.515162+00','category','holy-spirit',1,'HIGH'),
('2bd78c0e-e483-47df-9759-561a29ec6c66','yene-geta','2026-10-26 23:00:40.515162+00','occasion','general',1,'HIGH'),
('2cea4796-4ea9-4a65-884d-2bdeecea694f','yalante-geta-desta-mech-ale','2026-10-26 23:00:37.215606+00','category','praise-worship',1,'HIGH'),
('2cea4796-4ea9-4a65-884d-2bdeecea694f','yalante-geta-desta-mech-ale','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('2f0bb4a7-c18e-410a-b0be-a6543382ee39','rufael-abate','2026-10-26 23:00:30.590331+00','category','kidus-raphael',1,'HIGH'),
('2f0bb4a7-c18e-410a-b0be-a6543382ee39','rufael-abate','2026-10-26 23:00:30.590331+00','category','salvation',2,'HIGH'),
('2f0bb4a7-c18e-410a-b0be-a6543382ee39','rufael-abate','2026-10-26 23:00:30.590331+00','occasion','general',1,'HIGH'),
('3026fa64-2480-4dae-8084-ad25419e407e','alete-neh-anbaye','2026-10-26 23:00:09.849171+00','category','repentance',1,'MEDIUM'),
('3026fa64-2480-4dae-8084-ad25419e407e','alete-neh-anbaye','2026-10-26 23:00:09.849171+00','occasion','general',1,'MEDIUM'),
('3100b528-2265-4c66-a06e-4a4fcfa2cef1','mesqel-temerkuzen','2026-10-27 11:43:23.090282+00','category','jesus-christ',1,'HIGH'),
('3100b528-2265-4c66-a06e-4a4fcfa2cef1','mesqel-temerkuzen','2026-10-27 11:43:23.090282+00','occasion','general',1,'HIGH'),
('31aa3dd7-6e14-471b-828b-4e4aac163021','in-that-very-hour','2026-10-26 23:00:24.276265+00','category','jesus-christ',1,'HIGH'),
('31aa3dd7-6e14-471b-828b-4e4aac163021','in-that-very-hour','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('333ca705-9c7d-4ee1-9150-50f62169ea9c','how-marvelous-is-mary','2026-10-26 23:00:24.276265+00','category','virgin-mary',1,'MEDIUM'),
('333ca705-9c7d-4ee1-9150-50f62169ea9c','how-marvelous-is-mary','2026-10-26 23:00:24.276265+00','occasion','general',1,'MEDIUM'),
('39421b13-587f-4cdc-ac51-cea54a9709f3','believe-in-him','2026-10-27 11:43:23.145798+00','category','jesus-christ',1,'HIGH'),
('39421b13-587f-4cdc-ac51-cea54a9709f3','believe-in-him','2026-10-27 11:43:23.145798+00','category','salvation',2,'HIGH'),
('39421b13-587f-4cdc-ac51-cea54a9709f3','believe-in-him','2026-10-27 11:43:23.145798+00','occasion','tinsae',1,'HIGH'),
('39e87db9-7e0c-48c4-95be-8fcb2e36fa53','zemari-abel-egeziabhire-yewedekuten-yanesal','2026-10-26 23:00:40.515162+00','category','general',1,'MEDIUM'),
('39e87db9-7e0c-48c4-95be-8fcb2e36fa53','zemari-abel-egeziabhire-yewedekuten-yanesal','2026-10-26 23:00:40.515162+00','occasion','general',1,'MEDIUM'),
('39eff746-2760-4109-981a-8275ef009c08','di-n-zemari-behayilu-tebeje-adis-yeemebetachin-zimare-yeewinet-mena','2026-10-26 23:00:16.4837+00','category','virgin-mary',1,'HIGH'),
('39eff746-2760-4109-981a-8275ef009c08','di-n-zemari-behayilu-tebeje-adis-yeemebetachin-zimare-yeewinet-mena','2026-10-26 23:00:16.4837+00','occasion','general',1,'HIGH'),
('3b5ee95c-5480-4fe3-adf5-8ca982516e5b','zeawredke-mena','2026-10-26 23:00:40.515162+00','category','kidus-michael',1,'HIGH'),
('3b5ee95c-5480-4fe3-adf5-8ca982516e5b','zeawredke-mena','2026-10-26 23:00:40.515162+00','occasion','general',1,'HIGH'),
('3ea1220e-23ad-4c6b-9e88-22aad542e484','min-biye','2026-10-26 23:00:30.590331+00','category','praise-worship',1,'MEDIUM'),
('3ea1220e-23ad-4c6b-9e88-22aad542e484','min-biye','2026-10-26 23:00:30.590331+00','occasion','general',1,'MEDIUM'),
('4091cc2e-c93c-44dc-85b8-f3c5ca725a1d','truly-with-glory','2026-10-26 23:00:37.215606+00','category','jesus-christ',1,'MEDIUM'),
('4091cc2e-c93c-44dc-85b8-f3c5ca725a1d','truly-with-glory','2026-10-26 23:00:37.215606+00','category','salvation',2,'MEDIUM'),
('4091cc2e-c93c-44dc-85b8-f3c5ca725a1d','truly-with-glory','2026-10-26 23:00:37.215606+00','occasion','tinsae',1,'MEDIUM'),
('41b83c00-7799-4c26-8b41-69757b2e6a29','nikodimos-english-ethiopian-orthodox-tewahedo-hymn','2026-10-27 11:43:23.22859+00','category','jesus-christ',1,'MEDIUM'),
('41b83c00-7799-4c26-8b41-69757b2e6a29','nikodimos-english-ethiopian-orthodox-tewahedo-hymn','2026-10-27 11:43:23.22859+00','occasion','general',1,'MEDIUM'),
('42bc3957-f5f2-4e94-aedc-e5a783295481','emmanuel','2026-10-26 23:00:16.4837+00','category','jesus-christ',1,'HIGH'),
('42bc3957-f5f2-4e94-aedc-e5a783295481','emmanuel','2026-10-26 23:00:16.4837+00','category','cross',2,'HIGH'),
('42bc3957-f5f2-4e94-aedc-e5a783295481','emmanuel','2026-10-26 23:00:16.4837+00','occasion','general',1,'HIGH'),
('430bd026-de2d-4977-b7d6-7f72589db66c','heavenly-gardner-rejoice','2026-10-27 11:43:23.244095+00','category','salvation',1,'HIGH'),
('430bd026-de2d-4977-b7d6-7f72589db66c','heavenly-gardner-rejoice','2026-10-27 11:43:23.244095+00','category','prayer',2,'HIGH'),
('430bd026-de2d-4977-b7d6-7f72589db66c','heavenly-gardner-rejoice','2026-10-27 11:43:23.244095+00','category','cross',3,'HIGH'),
('430bd026-de2d-4977-b7d6-7f72589db66c','heavenly-gardner-rejoice','2026-10-27 11:43:23.244095+00','category','praise-worship',4,'HIGH'),
('430bd026-de2d-4977-b7d6-7f72589db66c','heavenly-gardner-rejoice','2026-10-27 11:43:23.244095+00','occasion','wedding',1,'HIGH'),
('4af82680-7fc3-416d-8043-4f236b4f6539','min-libel','2026-10-26 23:00:30.590331+00','category','jesus-christ',1,'MEDIUM'),
('4af82680-7fc3-416d-8043-4f236b4f6539','min-libel','2026-10-26 23:00:30.590331+00','occasion','general',1,'MEDIUM'),
('4cd7bb3c-e9a6-4777-97ce-57cb90e456f4','until-my-time-comes','2026-10-26 23:00:37.215606+00','category','repentance',1,'HIGH'),
('4cd7bb3c-e9a6-4777-97ce-57cb90e456f4','until-my-time-comes','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('4d93dca4-fc83-4a20-a990-e6e5549dd5e5','god-of-creation','2026-10-27 11:43:23.48458+00','category','praise-worship',1,'MEDIUM'),
('4d93dca4-fc83-4a20-a990-e6e5549dd5e5','god-of-creation','2026-10-27 11:43:23.48458+00','occasion','general',1,'MEDIUM'),
('4d9970a4-f301-48e2-8c2f-9b3790e3fb93','kiristos-waaqako-zemarit-fasika-mekonnen','2026-10-26 23:00:27.651432+00','category','jesus-christ',1,'HIGH'),
('4d9970a4-f301-48e2-8c2f-9b3790e3fb93','kiristos-waaqako-zemarit-fasika-mekonnen','2026-10-26 23:00:27.651432+00','occasion','general',1,'HIGH'),
('4e001eaf-45e4-4a87-93bb-8603e7bdc670','gabriel-the-powerful','2026-10-26 23:00:20.263977+00','category','kidus-gabriel',1,'HIGH'),
('4e001eaf-45e4-4a87-93bb-8603e7bdc670','gabriel-the-powerful','2026-10-26 23:00:20.263977+00','occasion','general',1,'HIGH'),
('50b88f2f-47cf-4f76-9d52-63a8feeb7490','your-love-allured-me','2026-10-26 23:00:40.515162+00','category','salvation',1,'HIGH'),
('50b88f2f-47cf-4f76-9d52-63a8feeb7490','your-love-allured-me','2026-10-26 23:00:40.515162+00','category','praise-worship',2,'HIGH'),
('50b88f2f-47cf-4f76-9d52-63a8feeb7490','your-love-allured-me','2026-10-26 23:00:40.515162+00','occasion','general',1,'HIGH'),
('53798040-0803-450d-ae05-f2c32c33d257','mikurab','2026-10-26 23:00:30.590331+00','category','prayer',1,'HIGH'),
('53798040-0803-450d-ae05-f2c32c33d257','mikurab','2026-10-26 23:00:30.590331+00','occasion','general',1,'HIGH'),
('53b758f3-c24a-4d37-bc28-05d116d80791','the-virgin-gave-birth-to-her-creator','2026-10-26 23:00:34.042939+00','category','virgin-mary',1,'HIGH'),
('53b758f3-c24a-4d37-bc28-05d116d80791','the-virgin-gave-birth-to-her-creator','2026-10-26 23:00:34.042939+00','category','praise-worship',2,'HIGH'),
('53b758f3-c24a-4d37-bc28-05d116d80791','the-virgin-gave-birth-to-her-creator','2026-10-26 23:00:34.042939+00','occasion','gena',1,'HIGH'),
('557224e5-f43b-4cbb-894d-1fb3b175c7c0','with-my-unfitting','2026-10-26 23:00:37.215606+00','category','virgin-mary',1,'HIGH'),
('557224e5-f43b-4cbb-894d-1fb3b175c7c0','with-my-unfitting','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('5713def9-dbcd-4bca-936d-ea5b68e1487d','sobese','2026-10-26 23:00:34.042939+00','category','angels',1,'HIGH'),
('5713def9-dbcd-4bca-936d-ea5b68e1487d','sobese','2026-10-26 23:00:34.042939+00','occasion','general',1,'HIGH'),
('5755dc33-d88c-4bdd-a11d-914c2bf997cd','hale-hale-luya','2026-10-26 23:00:24.276265+00','category','praise-worship',1,'HIGH'),
('5755dc33-d88c-4bdd-a11d-914c2bf997cd','hale-hale-luya','2026-10-26 23:00:24.276265+00','category','jesus-christ',2,'HIGH'),
('5755dc33-d88c-4bdd-a11d-914c2bf997cd','hale-hale-luya','2026-10-26 23:00:24.276265+00','occasion','gena',1,'HIGH'),
('5ac34cdb-f390-40b3-b42d-deba87720c4f','yedenagil-memekiya','2026-10-26 23:00:37.215606+00','category','virgin-mary',1,'MEDIUM'),
('5ac34cdb-f390-40b3-b42d-deba87720c4f','yedenagil-memekiya','2026-10-26 23:00:37.215606+00','occasion','new-year',1,'MEDIUM'),
('5ac34cdb-f390-40b3-b42d-deba87720c4f','yedenagil-memekiya','2026-10-26 23:00:37.215606+00','occasion','communion',2,'MEDIUM'),
('5b259785-3de1-40dd-9ca9-2cb4edd294ad','ascend-our-supplication','2026-10-27 11:43:23.623562+00','category','angels',1,'HIGH'),
('5b259785-3de1-40dd-9ca9-2cb4edd294ad','ascend-our-supplication','2026-10-27 11:43:23.623562+00','category','prayer',2,'HIGH'),
('5b259785-3de1-40dd-9ca9-2cb4edd294ad','ascend-our-supplication','2026-10-27 11:43:23.623562+00','category','kidus-michael',3,'HIGH'),
('5b259785-3de1-40dd-9ca9-2cb4edd294ad','ascend-our-supplication','2026-10-27 11:43:23.623562+00','occasion','general',1,'HIGH'),
('6261d644-917d-4c85-a3df-e4d1146b4f1c','mariyamyene-yene','2026-10-26 23:00:27.651432+00','category','virgin-mary',1,'HIGH'),
('6261d644-917d-4c85-a3df-e4d1146b4f1c','mariyamyene-yene','2026-10-26 23:00:27.651432+00','occasion','general',1,'HIGH'),
('667d20f9-db3c-4142-8626-fc80690623a1','the-almighty-god-is-gracious','2026-10-26 23:00:34.042939+00','category','jesus-christ',1,'MEDIUM'),
('667d20f9-db3c-4142-8626-fc80690623a1','the-almighty-god-is-gracious','2026-10-26 23:00:34.042939+00','occasion','general',1,'MEDIUM'),
('6939522d-5211-4ad9-8fc3-f658f279352e','azekri-dingil','2026-10-26 23:00:13.156068+00','category','saints',1,'MEDIUM'),
('6939522d-5211-4ad9-8fc3-f658f279352e','azekri-dingil','2026-10-26 23:00:13.156068+00','occasion','gena',1,'MEDIUM'),
('700b99b4-eb15-4e08-9bdc-27b5fcbbc701','ante-degu-samrawi','2026-10-27 15:43:26.191086+00','category','jesus-christ',1,'HIGH'),
('700b99b4-eb15-4e08-9bdc-27b5fcbbc701','ante-degu-samrawi','2026-10-27 15:43:26.191086+00','category','salvation',2,'HIGH'),
('700b99b4-eb15-4e08-9bdc-27b5fcbbc701','ante-degu-samrawi','2026-10-27 15:43:26.191086+00','occasion','general',1,'HIGH'),
('7a597c4d-0edc-4472-9508-ce9bd4b448cb','walk-in-the-light-of-god','2026-10-26 23:00:37.215606+00','category','jesus-christ',1,'MEDIUM'),
('7a597c4d-0edc-4472-9508-ce9bd4b448cb','walk-in-the-light-of-god','2026-10-26 23:00:37.215606+00','occasion','general',1,'MEDIUM'),
('7b42d06a-6835-428f-a243-a5f254dc24fe','beza-kwilu','2026-10-26 23:00:13.156068+00','category','jesus-christ',1,'HIGH'),
('7b42d06a-6835-428f-a243-a5f254dc24fe','beza-kwilu','2026-10-26 23:00:13.156068+00','occasion','gena',1,'HIGH'),
('7bb1161f-9e86-4d4d-899e-b86fcb6786dc','mot-new-rehab','2026-10-26 23:00:30.590331+00','category','jesus-christ',1,'HIGH'),
('7bb1161f-9e86-4d4d-899e-b86fcb6786dc','mot-new-rehab','2026-10-26 23:00:30.590331+00','occasion','general',1,'HIGH'),
('7bbde69c-071d-4f36-998a-091210348748','behazene','2026-10-26 23:00:13.156068+00','category','virgin-mary',1,'HIGH'),
('7bbde69c-071d-4f36-998a-091210348748','behazene','2026-10-26 23:00:13.156068+00','occasion','general',1,'HIGH'),
('7c59dae2-e191-486e-b1e6-2e10d0b82321','ya-diha-tetara','2026-10-26 23:00:37.215606+00','category','prayer',1,'MEDIUM'),
('7c59dae2-e191-486e-b1e6-2e10d0b82321','ya-diha-tetara','2026-10-26 23:00:37.215606+00','occasion','general',1,'MEDIUM'),
('7e663857-e455-48d0-8374-6d6d8d0d4acf','begol-begol','2026-10-26 23:00:13.156068+00','category','jesus-christ',1,'MEDIUM'),
('7e663857-e455-48d0-8374-6d6d8d0d4acf','begol-begol','2026-10-26 23:00:13.156068+00','occasion','gena',1,'MEDIUM'),
('7e663857-e455-48d0-8374-6d6d8d0d4acf','begol-begol','2026-10-26 23:00:13.156068+00','occasion','timket',2,'MEDIUM'),
('8107888b-7932-4495-94ee-416917956ead','kiryalayson','2026-10-27 11:43:24.07504+00','category','repentance',1,'MEDIUM'),
('8107888b-7932-4495-94ee-416917956ead','kiryalayson','2026-10-27 11:43:24.07504+00','occasion','general',1,'MEDIUM'),
('89e4011a-d77c-4b79-a12e-3753e52b2d5f','in-your-temple-o-lord','2026-10-26 23:00:24.276265+00','category','general',1,'MEDIUM'),
('89e4011a-d77c-4b79-a12e-3753e52b2d5f','in-your-temple-o-lord','2026-10-26 23:00:24.276265+00','occasion','general',1,'MEDIUM'),
('8ed978b6-64e8-48c1-aebb-82507cb66fa4','i-have-seen-all-i-need','2026-10-26 23:00:24.276265+00','category','jesus-christ',1,'HIGH'),
('8ed978b6-64e8-48c1-aebb-82507cb66fa4','i-have-seen-all-i-need','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('8f94c50a-2f05-4ccb-8982-5535ca8edc71','o-the-archangel','2026-10-26 23:00:30.590331+00','category','kidus-michael',1,'MEDIUM'),
('8f94c50a-2f05-4ccb-8982-5535ca8edc71','o-the-archangel','2026-10-26 23:00:30.590331+00','occasion','general',1,'MEDIUM'),
('94868121-ac0d-485f-93a4-c0bbb79ba186','we-offer-you-glory-and-praise','2026-10-26 23:00:37.215606+00','category','angels',1,'HIGH'),
('94868121-ac0d-485f-93a4-c0bbb79ba186','we-offer-you-glory-and-praise','2026-10-26 23:00:37.215606+00','category','praise-worship',2,'HIGH'),
('94868121-ac0d-485f-93a4-c0bbb79ba186','we-offer-you-glory-and-praise','2026-10-26 23:00:37.215606+00','category','prayer',3,'HIGH'),
('94868121-ac0d-485f-93a4-c0bbb79ba186','we-offer-you-glory-and-praise','2026-10-26 23:00:37.215606+00','occasion','communion',1,'HIGH'),
('95249d7f-ff77-4604-aacb-6311624f9e8b','zemarit-azeb-kebede','2026-10-26 23:00:40.515162+00','category','jesus-christ',1,'MEDIUM'),
('95249d7f-ff77-4604-aacb-6311624f9e8b','zemarit-azeb-kebede','2026-10-26 23:00:40.515162+00','occasion','general',1,'MEDIUM'),
('979f6b1f-693d-4748-9275-b787d14f5066','ametun-asalfeh','2026-10-26 23:00:09.849171+00','category','praise-worship',1,'MEDIUM'),
('979f6b1f-693d-4748-9275-b787d14f5066','ametun-asalfeh','2026-10-26 23:00:09.849171+00','occasion','general',1,'MEDIUM'),
('9b0ae893-996e-4c68-8ed3-cbabbe7a7a1e','hosanna-in-ariyam','2026-10-26 23:00:24.276265+00','category','jesus-christ',1,'MEDIUM'),
('9b0ae893-996e-4c68-8ed3-cbabbe7a7a1e','hosanna-in-ariyam','2026-10-26 23:00:24.276265+00','occasion','hosanna',1,'MEDIUM'),
('9d2542b5-00c4-44a1-8569-91240c0cfd06','aba-abune','2026-10-27 11:43:24.432359+00','category','abune-tekle-haymanot',1,'MEDIUM'),
('9d2542b5-00c4-44a1-8569-91240c0cfd06','aba-abune','2026-10-27 11:43:24.432359+00','occasion','general',1,'MEDIUM'),
('9df02b37-aa32-4064-ae43-bf4070bb989f','yeramaw-liul','2026-10-26 23:00:40.515162+00','category','kidus-gabriel',1,'HIGH'),
('9df02b37-aa32-4064-ae43-bf4070bb989f','yeramaw-liul','2026-10-26 23:00:40.515162+00','occasion','general',1,'HIGH'),
('9f1701c4-f3bf-480b-a0de-80e1cf158a36','the-stars','2026-10-26 23:00:34.042939+00','category','martyrs',1,'HIGH'),
('9f1701c4-f3bf-480b-a0de-80e1cf158a36','the-stars','2026-10-26 23:00:34.042939+00','category','jesus-christ',2,'HIGH'),
('9f1701c4-f3bf-480b-a0de-80e1cf158a36','the-stars','2026-10-26 23:00:34.042939+00','category','kidus-giorgis',3,'HIGH'),
('9f1701c4-f3bf-480b-a0de-80e1cf158a36','the-stars','2026-10-26 23:00:34.042939+00','category','kidus-estifanos-saint-stephen',4,'HIGH'),
('9f1701c4-f3bf-480b-a0de-80e1cf158a36','the-stars','2026-10-26 23:00:34.042939+00','occasion','general',1,'HIGH'),
('9fc60bf7-477a-4804-b353-ea667cc36992','sealu-lene','2026-10-27 11:43:24.470372+00','category','saints',1,'MEDIUM'),
('9fc60bf7-477a-4804-b353-ea667cc36992','sealu-lene','2026-10-27 11:43:24.470372+00','occasion','general',1,'MEDIUM'),
('9fc81bfc-4a65-4ec3-b480-e10a6cc2340b','simalee-hin-jiraadhu','2026-10-27 11:43:24.475812+00','category','virgin-mary',1,'MEDIUM'),
('9fc81bfc-4a65-4ec3-b480-e10a6cc2340b','simalee-hin-jiraadhu','2026-10-27 11:43:24.475812+00','occasion','general',1,'MEDIUM'),
('a0506c6d-c274-4ef5-9e39-3544d08805b3','we-believe','2026-10-26 23:00:37.215606+00','category','holy-spirit',1,'MEDIUM'),
('a0506c6d-c274-4ef5-9e39-3544d08805b3','we-believe','2026-10-26 23:00:37.215606+00','occasion','general',1,'MEDIUM'),
('a2b783a0-59df-4e3f-8ae1-ee8f1e5aa1ea','selam-lekmu','2026-10-27 11:43:24.500784+00','category','jesus-christ',1,'MEDIUM'),
('a2b783a0-59df-4e3f-8ae1-ee8f1e5aa1ea','selam-lekmu','2026-10-27 11:43:24.500784+00','occasion','general',1,'MEDIUM'),
('a32fea58-51ac-45a7-bc58-70b6556af5b0','mesheshegiya-taza','2026-10-27 11:43:24.508893+00','category','salvation',1,'HIGH'),
('a32fea58-51ac-45a7-bc58-70b6556af5b0','mesheshegiya-taza','2026-10-27 11:43:24.508893+00','occasion','general',1,'HIGH'),
('a8cf3360-93e4-49fb-a994-ced43d4b38e3','bo-gize-lekulu','2026-10-26 23:00:13.156068+00','category','praise-worship',1,'MEDIUM'),
('a8cf3360-93e4-49fb-a994-ced43d4b38e3','bo-gize-lekulu','2026-10-26 23:00:13.156068+00','occasion','general',1,'MEDIUM'),
('a8f18395-4409-4060-8f4f-b3307e3e8b06','held-captive-egeziharya-yilma','2026-10-27 11:43:24.585694+00','category','salvation',1,'MEDIUM'),
('a8f18395-4409-4060-8f4f-b3307e3e8b06','held-captive-egeziharya-yilma','2026-10-27 11:43:24.585694+00','occasion','general',1,'MEDIUM'),
('ae9bc345-8234-4a37-9b8e-d924428d42e6','with-his-mercifulness','2026-10-26 23:00:37.215606+00','category','repentance',1,'HIGH'),
('ae9bc345-8234-4a37-9b8e-d924428d42e6','with-his-mercifulness','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('b00ffd52-db96-4b19-8a57-a585893d0a6e','ethiopian-ortodoxtewahido-mezmur-zemary-abel-mekbib-agatami-aydelem','2026-10-26 23:00:20.263977+00','category','jesus-christ',1,'MEDIUM'),
('b00ffd52-db96-4b19-8a57-a585893d0a6e','ethiopian-ortodoxtewahido-mezmur-zemary-abel-mekbib-agatami-aydelem','2026-10-26 23:00:20.263977+00','occasion','general',1,'MEDIUM'),
('b0b80796-56bc-4205-be3f-c1748fcf0646','to-him-who-sits-on-the-throne','2026-10-26 23:00:37.215606+00','category','praise-worship',1,'HIGH'),
('b0b80796-56bc-4205-be3f-c1748fcf0646','to-him-who-sits-on-the-throne','2026-10-26 23:00:37.215606+00','occasion','wedding',1,'HIGH'),
('b719acaa-d527-49b3-b1eb-f639dbb1d3aa','hawaz-tegegn-mezmur','2026-10-26 23:00:24.276265+00','category','jesus-christ',1,'HIGH'),
('b719acaa-d527-49b3-b1eb-f639dbb1d3aa','hawaz-tegegn-mezmur','2026-10-26 23:00:24.276265+00','category','salvation',2,'HIGH'),
('b719acaa-d527-49b3-b1eb-f639dbb1d3aa','hawaz-tegegn-mezmur','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('b78c7f6c-2d46-43aa-a474-ca23894964f5','nation-of-the-cross','2026-10-26 23:00:30.590331+00','category','jesus-christ',1,'HIGH'),
('b78c7f6c-2d46-43aa-a474-ca23894964f5','nation-of-the-cross','2026-10-26 23:00:30.590331+00','category','cross',2,'HIGH'),
('b78c7f6c-2d46-43aa-a474-ca23894964f5','nation-of-the-cross','2026-10-26 23:00:30.590331+00','occasion','general',1,'HIGH'),
('bb1f81b9-9fdf-4bfe-bca1-fba1a2fce2fc','you-who-saved-from-fire','2026-10-26 23:00:40.515162+00','category','kidus-gabriel',1,'MEDIUM'),
('bb1f81b9-9fdf-4bfe-bca1-fba1a2fce2fc','you-who-saved-from-fire','2026-10-26 23:00:40.515162+00','category','martyrs',2,'MEDIUM'),
('bb1f81b9-9fdf-4bfe-bca1-fba1a2fce2fc','you-who-saved-from-fire','2026-10-26 23:00:40.515162+00','occasion','general',1,'MEDIUM'),
('c141b95e-7ffb-46b0-85a8-6f02225125dc','bemesqelu-webeqalu','2026-10-27 11:43:24.95058+00','category','cross',1,'MEDIUM'),
('c141b95e-7ffb-46b0-85a8-6f02225125dc','bemesqelu-webeqalu','2026-10-27 11:43:24.95058+00','occasion','general',1,'MEDIUM'),
('c2629925-af84-407f-a56e-cea359e4c892','agetnibet','2026-10-26 23:00:09.849171+00','category','jesus-christ',1,'HIGH'),
('c2629925-af84-407f-a56e-cea359e4c892','agetnibet','2026-10-26 23:00:09.849171+00','category','cross',2,'HIGH'),
('c2629925-af84-407f-a56e-cea359e4c892','agetnibet','2026-10-26 23:00:09.849171+00','occasion','gena',1,'HIGH'),
('c2f076a6-e29b-40cf-9aa1-9e98e619da02','track','2026-10-26 23:00:37.215606+00','category','jesus-christ',1,'HIGH'),
('c2f076a6-e29b-40cf-9aa1-9e98e619da02','track','2026-10-26 23:00:37.215606+00','category','holy-spirit',2,'HIGH'),
('c2f076a6-e29b-40cf-9aa1-9e98e619da02','track','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('c8b43dbc-958b-4eea-9623-a565ea61c3dd','dej-tenahu-koyiche-kidane-mihiretini','2026-10-26 23:00:16.4837+00','category','virgin-mary',1,'HIGH'),
('c8b43dbc-958b-4eea-9623-a565ea61c3dd','dej-tenahu-koyiche-kidane-mihiretini','2026-10-26 23:00:16.4837+00','category','repentance',2,'HIGH'),
('c8b43dbc-958b-4eea-9623-a565ea61c3dd','dej-tenahu-koyiche-kidane-mihiretini','2026-10-26 23:00:16.4837+00','occasion','kidane-mihret',1,'HIGH'),
('cc6b211a-bc8f-44c8-aae0-a73036b9306a','bezebane-kirub','2026-10-26 23:00:13.156068+00','category','praise-worship',1,'HIGH'),
('cc6b211a-bc8f-44c8-aae0-a73036b9306a','bezebane-kirub','2026-10-26 23:00:13.156068+00','occasion','general',1,'HIGH'),
('ccf49930-c12a-4f9e-9bd2-2d82a858a988','i-have-no-righteous-deeds','2026-10-26 23:00:24.276265+00','category','virgin-mary',1,'HIGH'),
('ccf49930-c12a-4f9e-9bd2-2d82a858a988','i-have-no-righteous-deeds','2026-10-26 23:00:24.276265+00','category','prayer',2,'HIGH'),
('ccf49930-c12a-4f9e-9bd2-2d82a858a988','i-have-no-righteous-deeds','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('cd44352e-a155-4b3f-b8c9-7374fa215509','he-is-praised','2026-10-26 23:00:24.276265+00','category','praise-worship',1,'HIGH'),
('cd44352e-a155-4b3f-b8c9-7374fa215509','he-is-praised','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('cd5b2e99-b3c8-4d9a-b60f-65b5c95cae18','mikael-silew-mikael','2026-10-26 23:00:30.590331+00','category','kidus-michael',1,'HIGH'),
('cd5b2e99-b3c8-4d9a-b60f-65b5c95cae18','mikael-silew-mikael','2026-10-26 23:00:30.590331+00','occasion','general',1,'HIGH'),
('d0a11343-d76b-466c-a834-cd05c8f629ae','gebriel-hayal','2026-10-26 23:00:20.263977+00','category','angels',1,'MEDIUM'),
('d0a11343-d76b-466c-a834-cd05c8f629ae','gebriel-hayal','2026-10-26 23:00:20.263977+00','occasion','general',1,'MEDIUM'),
('d5aca1e6-24ae-4ce8-b079-82b2ee832d8f','keamlak-telkeh','2026-10-27 11:43:25.239398+00','category','salvation',1,'MEDIUM'),
('d5aca1e6-24ae-4ce8-b079-82b2ee832d8f','keamlak-telkeh','2026-10-27 11:43:25.239398+00','occasion','general',1,'MEDIUM'),
('d75feb93-6433-4809-876c-185d53d2ed59','az','2026-10-27 11:43:25.266754+00','category','repentance',1,'MEDIUM'),
('d75feb93-6433-4809-876c-185d53d2ed59','az','2026-10-27 11:43:25.266754+00','occasion','general',1,'MEDIUM'),
('d7bb2a53-49b1-4acd-8607-2097aa465914','saint-mary-has-ascended','2026-10-26 23:00:30.590331+00','category','virgin-mary',1,'HIGH'),
('d7bb2a53-49b1-4acd-8607-2097aa465914','saint-mary-has-ascended','2026-10-26 23:00:30.590331+00','category','angels',2,'HIGH'),
('d7bb2a53-49b1-4acd-8607-2097aa465914','saint-mary-has-ascended','2026-10-26 23:00:30.590331+00','category','jesus-christ',3,'HIGH'),
('d7bb2a53-49b1-4acd-8607-2097aa465914','saint-mary-has-ascended','2026-10-26 23:00:30.590331+00','occasion','tinsae',1,'HIGH'),
('d93a6fb5-45f1-4b62-9c41-aff6ec7b2203','forgive-me-an-english-hymn','2026-10-26 23:00:20.263977+00','category','repentance',1,'HIGH'),
('d93a6fb5-45f1-4b62-9c41-aff6ec7b2203','forgive-me-an-english-hymn','2026-10-26 23:00:20.263977+00','occasion','general',1,'HIGH'),
('d94eb720-6250-4ff0-b8d7-2960aff66bf5','to-mother-mary','2026-10-26 23:00:37.215606+00','category','virgin-mary',1,'HIGH'),
('d94eb720-6250-4ff0-b8d7-2960aff66bf5','to-mother-mary','2026-10-26 23:00:37.215606+00','category','praise-worship',2,'HIGH'),
('d94eb720-6250-4ff0-b8d7-2960aff66bf5','to-mother-mary','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('db346f44-9a68-44d2-b9ec-b17a4a82dc1b','i-called-unto-my-dear-lord','2026-10-26 23:00:24.276265+00','category','praise-worship',1,'MEDIUM'),
('db346f44-9a68-44d2-b9ec-b17a4a82dc1b','i-called-unto-my-dear-lord','2026-10-26 23:00:24.276265+00','occasion','general',1,'MEDIUM'),
('db38f532-41f5-4367-8ef7-fbf80f5f9570','yilal-andebete','2026-10-26 23:00:40.515162+00','category','praise-worship',1,'HIGH'),
('db38f532-41f5-4367-8ef7-fbf80f5f9570','yilal-andebete','2026-10-26 23:00:40.515162+00','occasion','general',1,'HIGH'),
('df6fa259-53e8-4910-9a0b-870647530722','aman-beaman-tesebha','2026-10-26 23:00:09.849171+00','category','jesus-christ',1,'MEDIUM'),
('df6fa259-53e8-4910-9a0b-870647530722','aman-beaman-tesebha','2026-10-26 23:00:09.849171+00','occasion','debre-tabor',1,'MEDIUM'),
('e0cac119-525c-407f-85cf-20d1148c8c0f','cheru-hoy','2026-10-26 23:00:16.4837+00','category','jesus-christ',1,'HIGH'),
('e0cac119-525c-407f-85cf-20d1148c8c0f','cheru-hoy','2026-10-26 23:00:16.4837+00','category','praise-worship',2,'HIGH'),
('e0cac119-525c-407f-85cf-20d1148c8c0f','cheru-hoy','2026-10-26 23:00:16.4837+00','occasion','gena',1,'HIGH'),
('e0f784a6-32a8-464f-9cf7-1a274670cfcd','before-the-most-high','2026-10-26 23:00:13.156068+00','category','praise-worship',1,'HIGH'),
('e0f784a6-32a8-464f-9cf7-1a274670cfcd','before-the-most-high','2026-10-26 23:00:13.156068+00','occasion','general',1,'HIGH'),
('e10b469d-eaf2-4917-b438-402e82af41a4','the-burning-bush','2026-10-27 11:43:25.365713+00','category','virgin-mary',1,'HIGH'),
('e10b469d-eaf2-4917-b438-402e82af41a4','the-burning-bush','2026-10-27 11:43:25.365713+00','occasion','general',1,'HIGH'),
('e13d2ce0-39e8-416d-aba6-3adf6ca28543','i-call-out-your-name','2026-10-26 23:00:24.276265+00','category','virgin-mary',1,'HIGH'),
('e13d2ce0-39e8-416d-aba6-3adf6ca28543','i-call-out-your-name','2026-10-26 23:00:24.276265+00','category','praise-worship',2,'HIGH'),
('e13d2ce0-39e8-416d-aba6-3adf6ca28543','i-call-out-your-name','2026-10-26 23:00:24.276265+00','occasion','wedding',1,'HIGH'),
('e2dedf4d-7394-4427-a1ab-3e05e537de0c','believe-in-the-lord','2026-10-26 23:00:13.156068+00','category','jesus-christ',1,'MEDIUM'),
('e2dedf4d-7394-4427-a1ab-3e05e537de0c','believe-in-the-lord','2026-10-26 23:00:13.156068+00','occasion','general',1,'MEDIUM'),
('e3c30b76-4892-49c5-b983-3e3d46cddb51','covenant-of-mercy','2026-10-26 23:00:16.4837+00','category','virgin-mary',1,'HIGH'),
('e3c30b76-4892-49c5-b983-3e3d46cddb51','covenant-of-mercy','2026-10-26 23:00:16.4837+00','occasion','kidane-mihret',1,'HIGH'),
('e48b1015-9408-4fdb-ba68-5599612387ba','with-his-love-the-lord-rescued-me','2026-10-26 23:00:37.215606+00','category','salvation',1,'HIGH'),
('e48b1015-9408-4fdb-ba68-5599612387ba','with-his-love-the-lord-rescued-me','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('e584793d-2026-4b50-8944-95af578c4a86','lord-it-is-your-grace','2026-10-26 23:00:27.651432+00','category','praise-worship',1,'HIGH'),
('e584793d-2026-4b50-8944-95af578c4a86','lord-it-is-your-grace','2026-10-26 23:00:27.651432+00','category','jesus-christ',2,'HIGH'),
('e584793d-2026-4b50-8944-95af578c4a86','lord-it-is-your-grace','2026-10-26 23:00:27.651432+00','occasion','gena',1,'HIGH'),
('ebc896bf-e2aa-424a-8b39-be7a8fc56c40','the-purest-of-the-pure','2026-10-26 23:00:34.042939+00','category','virgin-mary',1,'HIGH'),
('ebc896bf-e2aa-424a-8b39-be7a8fc56c40','the-purest-of-the-pure','2026-10-26 23:00:34.042939+00','category','prayer',2,'HIGH'),
('ebc896bf-e2aa-424a-8b39-be7a8fc56c40','the-purest-of-the-pure','2026-10-26 23:00:34.042939+00','category','jesus-christ',3,'HIGH'),
('ebc896bf-e2aa-424a-8b39-be7a8fc56c40','the-purest-of-the-pure','2026-10-26 23:00:34.042939+00','category','angels',4,'HIGH'),
('ebc896bf-e2aa-424a-8b39-be7a8fc56c40','the-purest-of-the-pure','2026-10-26 23:00:34.042939+00','category','praise-worship',5,'HIGH'),
('ebc896bf-e2aa-424a-8b39-be7a8fc56c40','the-purest-of-the-pure','2026-10-26 23:00:34.042939+00','occasion','general',1,'HIGH'),
('ec856951-2b37-4503-accc-cdee0d8efb73','ethiopia-zemarit-fantu-welde-kelebanos','2026-10-26 23:00:20.263977+00','category','virgin-mary',1,'HIGH'),
('ec856951-2b37-4503-accc-cdee0d8efb73','ethiopia-zemarit-fantu-welde-kelebanos','2026-10-26 23:00:20.263977+00','occasion','general',1,'HIGH'),
('ed7486fa-df58-49f6-b383-132071f92632','i-found-tranquility','2026-10-26 23:00:24.276265+00','category','repentance',1,'HIGH'),
('ed7486fa-df58-49f6-b383-132071f92632','i-found-tranquility','2026-10-26 23:00:24.276265+00','category','prayer',2,'HIGH'),
('ed7486fa-df58-49f6-b383-132071f92632','i-found-tranquility','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('f07548ed-55dc-4333-8f83-781a7f635723','my-home-is-filled','2026-10-26 23:00:30.590331+00','category','praise-worship',1,'HIGH'),
('f07548ed-55dc-4333-8f83-781a7f635723','my-home-is-filled','2026-10-26 23:00:30.590331+00','occasion','general',1,'HIGH'),
('f0d1e1dc-69f8-4d9e-969b-1050e188fe75','ferahu','2026-10-26 23:00:20.263977+00','category','repentance',1,'HIGH'),
('f0d1e1dc-69f8-4d9e-969b-1050e188fe75','ferahu','2026-10-26 23:00:20.263977+00','occasion','general',1,'HIGH'),
('f1536944-2df2-4c94-873c-2515b756ee8b','bizu-lijoch-alut','2026-10-26 23:00:13.156068+00','category','kidus-michael',1,'HIGH'),
('f1536944-2df2-4c94-873c-2515b756ee8b','bizu-lijoch-alut','2026-10-26 23:00:13.156068+00','occasion','general',1,'HIGH'),
('f605b2ef-d317-44a6-88d6-4830863319e8','go-forth-testify','2026-10-26 23:00:24.276265+00','category','jesus-christ',1,'HIGH'),
('f605b2ef-d317-44a6-88d6-4830863319e8','go-forth-testify','2026-10-26 23:00:24.276265+00','occasion','tinsae',1,'HIGH'),
('f68d5df5-188e-4a56-83f5-750fe244f750','the-old-is-gone','2026-10-26 23:00:34.042939+00','category','jesus-christ',1,'HIGH'),
('f68d5df5-188e-4a56-83f5-750fe244f750','the-old-is-gone','2026-10-26 23:00:34.042939+00','occasion','general',1,'HIGH'),
('f6be786c-2ac1-4c16-bf5e-a275750dde1c','beselam-ni','2026-10-26 23:00:13.156068+00','category','virgin-mary',1,'MEDIUM'),
('f6be786c-2ac1-4c16-bf5e-a275750dde1c','beselam-ni','2026-10-26 23:00:13.156068+00','occasion','general',1,'MEDIUM'),
('fdf841bb-83c7-4e08-afdd-7573a32deebb','yelem-yemisanew','2026-10-26 23:00:37.215606+00','category','jesus-christ',1,'HIGH'),
('fdf841bb-83c7-4e08-afdd-7573a32deebb','yelem-yemisanew','2026-10-26 23:00:37.215606+00','category','repentance',2,'HIGH'),
('fdf841bb-83c7-4e08-afdd-7573a32deebb','yelem-yemisanew','2026-10-26 23:00:37.215606+00','occasion','general',1,'HIGH'),
('fe5de49f-762c-4f05-89e3-8bec92e9265a','he-who-created-you','2026-10-26 23:00:24.276265+00','category','salvation',1,'HIGH'),
('fe5de49f-762c-4f05-89e3-8bec92e9265a','he-who-created-you','2026-10-26 23:00:24.276265+00','occasion','general',1,'HIGH'),
('ffb576fa-0888-4b93-9140-7dd629458bd8','my-benevolent-lord','2026-10-26 23:00:30.590331+00','category','jesus-christ',1,'HIGH'),
('ffb576fa-0888-4b93-9140-7dd629458bd8','my-benevolent-lord','2026-10-26 23:00:30.590331+00','category','praise-worship',2,'HIGH'),
('ffb576fa-0888-4b93-9140-7dd629458bd8','my-benevolent-lord','2026-10-26 23:00:30.590331+00','occasion','general',1,'HIGH'),
('ffccde6f-ee93-4993-b24b-a5e2ec4ac609','zemari-mikiyas-aregawi-bemecheresha-eninesalen-kemutan','2026-10-26 23:00:40.515162+00','category','jesus-christ',1,'MEDIUM'),
('ffccde6f-ee93-4993-b24b-a5e2ec4ac609','zemari-mikiyas-aregawi-bemecheresha-eninesalen-kemutan','2026-10-26 23:00:40.515162+00','category','repentance',2,'MEDIUM'),
('ffccde6f-ee93-4993-b24b-a5e2ec4ac609','zemari-mikiyas-aregawi-bemecheresha-eninesalen-kemutan','2026-10-26 23:00:40.515162+00','occasion','general',1,'MEDIUM');

do $$
declare
  v_category_view_columns text[];
  v_occasion_view_columns text[];
begin
  if to_regclass('public.mezmur_category_links_import') is null
     or to_regclass('public.mezmur_occasion_links_import') is null then
    raise exception 'Canonical Mezmur relationship tables are missing' using errcode='42P01';
  end if;
  if to_regclass('public.mezmur_category_links_public') is null
     or to_regclass('public.mezmur_occasion_links_public') is null then
    raise exception 'Public Mezmur relationship views are missing' using errcode='42P01';
  end if;
  select array_agg(a.attname::text order by a.attnum) into v_category_view_columns
  from pg_attribute a
  where a.attrelid='public.mezmur_category_links_public'::regclass
    and a.attnum>0 and not a.attisdropped;
  select array_agg(a.attname::text order by a.attnum) into v_occasion_view_columns
  from pg_attribute a
  where a.attrelid='public.mezmur_occasion_links_public'::regclass
    and a.attnum>0 and not a.attisdropped;
  if v_category_view_columns is distinct from array['mezmur_import_id','mezmur_id','mezmur_slug','category_slug']::text[]
     or v_occasion_view_columns is distinct from array['mezmur_import_id','mezmur_id','mezmur_slug','occasion_slug']::text[] then
    raise exception 'Refusing to replace unexpected public relationship view contracts' using errcode='55000';
  end if;
  if exists (
    select 1 from (select import_id from classification_stage group by import_id) s
    left join public.mezmur_data_import m on m.import_id=s.import_id
    where m.import_id is null or m.deleted_at is not null
  ) then
    raise exception 'A staged import_id is missing or soft-deleted; no classifications were retained' using errcode='P0002';
  end if;
  if exists (
    select 1 from classification_stage s
    join public.mezmur_data_import m on m.import_id=s.import_id
    where m.slug is distinct from s.expected_slug
       or m.updated_at is distinct from s.expected_updated_at
  ) then
    raise exception 'Slug or updated_at precondition failed; refresh the read-only reconciliation first' using errcode='40001';
  end if;
  if exists (
    select 1 from classification_stage s
    where s.relationship_kind='category'
      and not exists(select 1 from public.categories c where c.slug=s.taxonomy_slug and not coalesce(c.is_archived,false))
  ) then
    raise exception 'A proposed category is not an active canonical taxonomy value' using errcode='23503';
  end if;
  if exists (
    select 1 from classification_stage s
    where s.relationship_kind='occasion'
      and not exists(select 1 from public.mezmur_occasions o where o.slug=s.taxonomy_slug and o.status<>'archived')
  ) then
    raise exception 'A proposed occasion is not an active canonical taxonomy value' using errcode='23503';
  end if;

  -- Keep identity and timestamp preconditions stable for the rest of the
  -- transaction. This does not lock or rewrite unrelated Mezmurs.
  perform 1
  from public.mezmur_data_import m
  join (select distinct import_id from classification_stage) s using (import_id)
  for update of m;
end $$;

-- Keep the existing four-column contracts while making the public projection
-- work for legacy rows whose mezmur_id is null. The UUID remains the link
-- identity. A slug fallback is accepted only when exactly one public row has
-- that normalized slug, so duplicate slugs cannot leak another record's links.
create or replace view public.mezmur_category_links_public
with (security_barrier=true) as
select distinct l.mezmur_import_id,m.mezmur_id,m.slug as mezmur_slug,l.category_slug
from public.mezmur_category_links_import l
join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
where l.mezmur_import_id is not null
  and m.deleted_at is null
  and lower(trim(coalesce(m.status,'')))='published'
  and exists (
    select 1 from public.mezmur_public p
    where (m.mezmur_id is not null and p.mezmur_id=m.mezmur_id)
       or (m.mezmur_id is null
           and lower(trim(p.slug))=lower(trim(m.slug))
           and (select count(*) from public.mezmur_public px
                where lower(trim(px.slug))=lower(trim(m.slug)))=1)
  );

create or replace view public.mezmur_occasion_links_public
with (security_barrier=true) as
select distinct l.mezmur_import_id,m.mezmur_id,m.slug as mezmur_slug,l.occasion_slug
from public.mezmur_occasion_links_import l
join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
where l.mezmur_import_id is not null
  and m.deleted_at is null
  and lower(trim(coalesce(m.status,'')))='published'
  and exists (
    select 1 from public.mezmur_public p
    where (m.mezmur_id is not null and p.mezmur_id=m.mezmur_id)
       or (m.mezmur_id is null
           and lower(trim(p.slug))=lower(trim(m.slug))
           and (select count(*) from public.mezmur_public px
                where lower(trim(px.slug))=lower(trim(m.slug)))=1)
  );

-- Authoritative read-only reconciliation against current relationships.
select s.import_id,s.expected_slug,s.relationship_kind,s.taxonomy_slug,s.classification_rank,
       case when s.relationship_kind='category' then exists(
         select 1 from public.mezmur_category_links_import l
         where l.mezmur_import_id=s.import_id and l.category_slug=s.taxonomy_slug
       ) else exists(
         select 1 from public.mezmur_occasion_links_import l
         where l.mezmur_import_id=s.import_id and l.occasion_slug=s.taxonomy_slug
       ) end as already_present
from classification_stage s
order by s.import_id,s.relationship_kind,s.classification_rank;

-- Apply inside this rollback-default transaction. Primary ordering is recorded
-- using the existing source_category/source_occasion metadata; no new content
-- columns are introduced.
insert into public.mezmur_category_links_import
  (mezmur_import_id,mezmur_slug,category_slug,source_category,confidence)
select s.import_id,s.expected_slug,s.taxonomy_slug,
       case when s.classification_rank=1 then 'lyrics-classifier-primary' else 'lyrics-classifier-secondary' end,
       lower(s.confidence)
from classification_stage s
where s.relationship_kind='category'
on conflict (mezmur_import_id,category_slug) do nothing;

insert into public.mezmur_occasion_links_import
  (mezmur_import_id,mezmur_slug,occasion_slug,source_occasion)
select s.import_id,s.expected_slug,s.taxonomy_slug,
       case when s.classification_rank=1 then 'lyrics-classifier-primary' else 'lyrics-classifier-secondary' end
from classification_stage s
where s.relationship_kind='occasion'
on conflict (mezmur_import_id,occasion_slug) do nothing;

do $$
begin
  if exists (
    select 1 from classification_stage s
    where (s.relationship_kind='category' and not exists(
      select 1 from public.mezmur_category_links_import l
      where l.mezmur_import_id=s.import_id and l.category_slug=s.taxonomy_slug
    )) or (s.relationship_kind='occasion' and not exists(
      select 1 from public.mezmur_occasion_links_import l
      where l.mezmur_import_id=s.import_id and l.occasion_slug=s.taxonomy_slug
    ))
  ) then
    raise exception 'Relationship read-after-write verification failed; transaction will roll back' using errcode='P0001';
  end if;
end $$;

select 'dry_run_complete' result,
       count(distinct import_id) staged_mezmurs,
       count(*) filter(where relationship_kind='category') category_relationships,
       count(*) filter(where relationship_kind='occasion') occasion_relationships
from classification_stage;

rollback;
-- After reviewing the reconciliation output and receiving explicit approval,
-- execute a separately reviewed copy with only the final ROLLBACK changed to COMMIT.
