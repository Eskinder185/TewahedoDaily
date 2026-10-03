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

INSERT INTO public.bible_canonical_books (id, canonical_number, collection, slug, name_en, name_am, sort_order, source_status)
VALUES
  ('d433353e-57b4-594d-a94a-327024262d3a', 1, 'old', 'genesis', 'Genesis', 'ኦሪት ዘፍጥረት', 1, 'available'),
  ('2e2c43ad-cc07-5c14-a65a-8947d0e8e980', 2, 'old', 'exodus', 'Exodus', 'ኦሪት ዘጸአት', 2, 'available'),
  ('f86271af-1398-5511-a9e9-2d41c8414340', 3, 'old', 'leviticus', 'Leviticus', 'ኦሪት ዘሌዋውያን', 3, 'available'),
  ('a37b1c59-0ee1-53f1-adb9-7e16a10dd8c0', 4, 'old', 'numbers', 'Numbers', 'ኦሪት ዘኍልቍ', 4, 'available'),
  ('06ed538e-d357-55e9-a449-0a5f7f1fad2e', 5, 'old', 'deuteronomy', 'Deuteronomy', 'ኦሪት ዘዳግም', 5, 'available'),
  ('91fa728e-e7f2-560b-a676-d889f69522a6', 6, 'old', 'joshua', 'Joshua', 'መጽሐፈ ኢያሱ', 6, 'available'),
  ('8fe4f5c4-9270-5f4e-a2dd-4d268657e2c7', 7, 'old', 'judges', 'Judges', 'መጽሐፈ መሳፍንት', 7, 'available'),
  ('06461e25-588b-5831-a395-87c2e7df343d', 8, 'old', 'ruth', 'Ruth', 'መጽሐፈ ሩት', 8, 'available'),
  ('b0ae5b72-7a03-558e-a028-4f72c8b57026', 9, 'old', 'samuel', 'Samuel', NULL, 9, 'available'),
  ('83e8396c-72aa-5ee5-a99f-9349779c6935', 10, 'old', 'kings', 'Kings', NULL, 10, 'available'),
  ('a563fc1b-46a4-521e-a13b-709a6e78d388', 11, 'old', 'first-chronicles', 'First Chronicles', 'መጽሐፈ ዜና መዋዕል ቀዳማዊ', 11, 'available'),
  ('a27b35bd-87ae-5d66-a763-30e27625d945', 12, 'old', 'second-chronicles', 'Second Chronicles', 'መጽሐፈ ዜና መዋዕል ካልዕ', 12, 'available'),
  ('bb70e97a-0cce-553a-ae4e-64f25cefcfb2', 13, 'old', 'jubilees', 'Jubilees', 'መጽሐፈ ኩፋሌ', 13, 'available'),
  ('d8f49ded-2fae-529a-ace4-72cd45b6cc21', 14, 'old', 'enoch', 'Enoch', 'መጽሐፈ ሄኖክ', 14, 'available'),
  ('0dc45844-cf80-5848-a270-c64e1123c69f', 15, 'old', 'ezra-nehemiah', 'Ezra and Nehemiah', NULL, 15, 'available'),
  ('048fea12-307b-5ce4-a797-097c2ac46fa7', 16, 'old', 'second-ezra-and-ezra-sutuel', 'Second Ezra and Ezra Sutuel', NULL, 16, 'available'),
  ('22b41b4f-23ed-5c63-ae93-e41ba1effb6e', 17, 'old', 'tobit', 'Tobit', 'መጽሐፈ ጦቢት', 17, 'available'),
  ('d60e599b-ea9b-54f3-a95b-f3201a5ec70d', 18, 'old', 'judith', 'Judith', 'መጽሐፈ ዮዲት', 18, 'available'),
  ('c443aeba-80b2-53df-a57b-61af2518e9d4', 19, 'old', 'esther', 'Esther', 'መጽሐፈ አስቴር', 19, 'available'),
  ('246b20f1-9511-5348-aade-ba1139a5784d', 20, 'old', 'first-meqabyan', 'First Meqabyan', 'መጽሐፈ መቃብያን ቀዳማዊ', 20, 'available'),
  ('042604be-69f0-57de-a7a8-c468e4f73272', 21, 'old', 'second-and-third-meqabyan', 'Second and Third Meqabyan', NULL, 21, 'available'),
  ('9961118c-0f18-5e85-a210-08799c6c343d', 22, 'old', 'job', 'Job', 'መጽሐፈ ኢዮብ', 22, 'available'),
  ('4a37bb29-bd78-56f1-a2dc-ed0d6b0d5e1f', 23, 'old', 'psalms', 'Psalms', 'መዝሙረ ዳዊት', 23, 'available'),
  ('2453a67a-caa3-579d-aa65-11243f99bfd6', 24, 'old', 'proverbs', 'Proverbs', 'መጽሐፈ ምሳሌ', 24, 'available'),
  ('1420e384-f8ec-5024-ad1d-4c168e068d28', 25, 'old', 'tegsats', 'Tegsats (Reproof)', 'መጽሐፈ ተግሣጽ', 25, 'available'),
  ('aa548fcf-d8a3-57b2-af40-1d40b1aa57f0', 26, 'old', 'wisdom', 'Wisdom of Solomon', 'መጽሐፈ ጥበብ', 26, 'available'),
  ('970b87ac-9ac0-57a3-a38f-1760e9757c66', 27, 'old', 'ecclesiastes', 'Ecclesiastes', 'መጽሐፈ መክብብ', 27, 'available'),
  ('f5afd143-65f3-5641-a27a-bd96dbac20f3', 28, 'old', 'song-of-songs', 'Song of Songs', 'መኃልየ መኃልይ ዘሰሎሞን', 28, 'available'),
  ('f30f16cc-136d-5ce1-a926-51754937e61f', 29, 'old', 'isaiah', 'Isaiah', 'ትንቢተ ኢሳይያስ', 29, 'available'),
  ('35f7b564-43ce-5edc-a6eb-4b440a5bd52f', 30, 'old', 'jeremiah-collection', 'Jeremiah Collection', NULL, 30, 'available'),
  ('b3ae4bfe-2cfe-526f-a79a-47e20e422795', 31, 'old', 'ezekiel', 'Ezekiel', 'ትንቢተ ሕዝቅኤል', 31, 'available'),
  ('6265b40f-7887-5557-a2a2-3dcc69839ac5', 32, 'old', 'daniel', 'Daniel', 'ትንቢተ ዳንኤል', 32, 'available'),
  ('cbb34606-6270-5b50-ae86-5e876e0ef341', 33, 'old', 'hosea', 'Hosea', 'ትንቢተ ሆሴዕ', 33, 'available'),
  ('ebd7f76f-1627-5a5f-a894-06e45b0dc3c1', 34, 'old', 'amos', 'Amos', 'ትንቢተ ዓሞጽ', 34, 'available'),
  ('e2072949-f813-5b03-a4a8-e60e35bd60aa', 35, 'old', 'micah', 'Micah', 'ትንቢተ ሚክያስ', 35, 'available'),
  ('36777956-e53e-50cd-a236-8cbe55e0a5e0', 36, 'old', 'joel', 'Joel', 'ትንቢተ ኢዮኤል', 36, 'available'),
  ('8560707f-17a2-59ee-a3c2-65fa67c54f55', 37, 'old', 'obadiah', 'Obadiah', 'ትንቢተ አብድዩ', 37, 'available'),
  ('79cedc8f-e7ba-5bd6-ad24-9a465db1d0ae', 38, 'old', 'jonah', 'Jonah', 'ትንቢተ ዮናስ', 38, 'available'),
  ('1c204a0d-4125-511f-a25c-9fd7f94f1e3a', 39, 'old', 'nahum', 'Nahum', 'ትንቢተ ናሆም', 39, 'available'),
  ('f7351081-af4a-511a-aef2-4624aa07cbbc', 40, 'old', 'habakkuk', 'Habakkuk', 'ትንቢተ ዕንባቆም', 40, 'available'),
  ('2b822402-3231-5d18-a27e-2471fab5db7f', 41, 'old', 'zephaniah', 'Zephaniah', 'ትንቢተ ሶፎንያስ', 41, 'available'),
  ('5af953ec-4adf-5678-a86e-73105b4d746a', 42, 'old', 'haggai', 'Haggai', 'ትንቢተ ሐጌ', 42, 'available'),
  ('8168d61e-570f-56b7-af3b-e8cded26c33b', 43, 'old', 'zechariah', 'Zechariah', 'ትንቢተ ዘካርያስ', 43, 'available'),
  ('14354f6f-dcd7-5bc9-ae78-a607ffae2321', 44, 'old', 'malachi', 'Malachi', 'ትንቢተ ሚልክያስ', 44, 'available'),
  ('14b61bb5-9705-51c8-a4a3-c774b27eea90', 45, 'old', 'sirach', 'Sirach', 'መጽሐፈ ሲራክ', 45, 'available'),
  ('c8feb1a3-5710-5974-a4dd-8e82fefd5176', 46, 'old', 'josephas-son-of-bengorion', 'Josephas, son of Bengorion', NULL, 46, 'missing'),
  ('19b9fbc7-f942-5d88-a4b6-580b903dc450', 1, 'new', 'matthew', 'Matthew', 'የማቴዎስ ወንጌል', 47, 'available'),
  ('ebfd3617-41a2-5a65-aa11-13f7d370d2d8', 2, 'new', 'mark', 'Mark', 'የማርቆስ ወንጌል', 48, 'available'),
  ('c3082cb9-c008-5a6e-a15f-3864f5dd0562', 3, 'new', 'luke', 'Luke', 'የሉቃስ ወንጌል', 49, 'available'),
  ('9b0ed7ca-0095-5508-a514-89b2f6fe4491', 4, 'new', 'john', 'John', 'የዮሐንስ ወንጌል', 50, 'available'),
  ('6f839e53-4cc2-5540-a430-b106350693ae', 5, 'new', 'acts', 'Acts', 'የሐዋርያት ሥራ', 51, 'available'),
  ('3e6d3bbe-206c-580b-ac3c-83f9400d4aaa', 6, 'new', 'romans', 'Romans', 'ወደ ሮሜ ሰዎች', 52, 'available'),
  ('8c267d6b-77fd-5b93-a6e5-41f96b1946c5', 7, 'new', 'first-corinthians', 'First Corinthians', '1ኛ ወደ ቆሮንቶስ ሰዎች', 53, 'available'),
  ('b0948cb1-0de4-5907-ae7d-f555713c8eb8', 8, 'new', 'second-corinthians', 'Second Corinthians', '2ኛ ወደ ቆሮንቶስ ሰዎች', 54, 'available'),
  ('fc4740ab-be62-5c2f-a32d-ab23907ff2b3', 9, 'new', 'galatians', 'Galatians', 'ወደ ገላትያ ሰዎች', 55, 'available'),
  ('9ed84fd6-5f87-54a0-aa36-e482f5c81b32', 10, 'new', 'ephesians', 'Ephesians', 'ወደ ኤፌሶን ሰዎች', 56, 'available'),
  ('8e831ea6-0fea-5450-a434-ea3df3328848', 11, 'new', 'philippians', 'Philippians', 'ወደ ፊልጵስዩስ ሰዎች', 57, 'available'),
  ('e9f0346b-ece0-5b96-a2a4-04f2600beb63', 12, 'new', 'colossians', 'Colossians', 'ወደ ቆላስይስ ሰዎች', 58, 'available'),
  ('fd9d9b5c-bd29-5906-a8d0-ca9c7ffd6726', 13, 'new', 'first-thessalonians', 'First Thessalonians', '1ኛ ወደ ተሰሎንቄ ሰዎች', 59, 'available'),
  ('3ad328e9-9cbf-523b-ae95-facb7162b3f0', 14, 'new', 'second-thessalonians', 'Second Thessalonians', '2ኛ ወደ ተሰሎንቄ ሰዎች', 60, 'available'),
  ('dc767f2f-3949-5f0c-abd6-55226734e746', 15, 'new', 'first-timothy', 'First Timothy', '1ኛ ወደ ጢሞቴዎስ', 61, 'available'),
  ('b3c549dd-0b80-5a82-a580-db51cc5df792', 16, 'new', 'second-timothy', 'Second Timothy', '2ኛ ወደ ጢሞቴዎስ', 62, 'available'),
  ('fdae24b0-b1eb-562a-a092-59d66ceb460c', 17, 'new', 'titus', 'Titus', 'ወደ ቲቶ', 63, 'available'),
  ('17283047-cddc-50f9-aa29-5a40ac1698d7', 18, 'new', 'philemon', 'Philemon', 'ወደ ፊልሞና', 64, 'available'),
  ('cca72622-bd6e-5664-a53d-7fbff66f0763', 19, 'new', 'hebrews', 'Hebrews', 'ወደ ዕብራውያን', 65, 'available'),
  ('c5c94b58-727b-5a61-ab8d-3c5926c79ea1', 20, 'new', 'first-peter', 'First Peter', '1ኛ የጴጥሮስ መልእክት', 66, 'available'),
  ('c746cf90-b952-597a-af59-88a9dc0bb3c2', 21, 'new', 'second-peter', 'Second Peter', '2ኛ የጴጥሮስ መልእክት', 67, 'available'),
  ('79ff4575-46a4-58fc-a7ae-07060d92bb65', 22, 'new', 'first-john', 'First John', '1ኛ የዮሐንስ መልእክት', 68, 'available'),
  ('f1bcfaf3-1f7a-5bc2-a7bf-4f668532d768', 23, 'new', 'second-john', 'Second John', '2ኛ የዮሐንስ መልእክት', 69, 'available'),
  ('75dbd452-0266-5a07-aa79-d51b6be931c7', 24, 'new', 'third-john', 'Third John', '3ኛ የዮሐንስ መልእክት', 70, 'available'),
  ('dc194e93-f1cd-5ff7-a3b0-0a314b87180a', 25, 'new', 'james', 'James', 'የያዕቆን መልእክት', 71, 'available'),
  ('70b46365-d369-59a5-a5d7-d90bb8bde072', 26, 'new', 'jude', 'Jude', 'የይሁዳ መልእክት', 72, 'available'),
  ('a074f860-92cc-5cc5-a398-bf13f62ea22e', 27, 'new', 'revelation', 'Revelation', 'የዮሐንስ ራዕይ', 73, 'available'),
  ('c7404624-cff5-57ae-a911-a28dd8dabfe1', 28, 'new', 'sirate-tsion', 'Sirate Tsion', NULL, 74, 'missing'),
  ('5529345a-2741-5209-ab66-335b22c08998', 29, 'new', 'tizaz', 'Tizaz', NULL, 75, 'missing'),
  ('e9865ac5-dcb5-59de-aa53-8b52773bff64', 30, 'new', 'gitsew', 'Gitsew', NULL, 76, 'missing'),
  ('9bf159c6-2265-518f-a529-0cc602f4c3ff', 31, 'new', 'abtilis', 'Abtilis', NULL, 77, 'missing'),
  ('0afd67e0-b52d-547a-ae74-be5b47937445', 32, 'new', 'first-dominos', 'First Dominos', NULL, 78, 'missing'),
  ('cd0dabcf-d2e8-5792-a03e-2c2ce699bf46', 33, 'new', 'second-dominos', 'Second Dominos', NULL, 79, 'missing'),
  ('5c2f5ac4-7928-5483-ad35-e0791861cf5a', 34, 'new', 'clement', 'Clement', 'መጽሐፈ ቀሌምንጦስ', 80, 'available'),
  ('14954a01-204f-54a3-a761-1f3abee3d0b1', 35, 'new', 'didascalia', 'Didascalia', 'መጽሐፈ ዲድስቅልያ', 81, 'available')
ON CONFLICT (id) DO UPDATE SET
  canonical_number = EXCLUDED.canonical_number,
  collection = EXCLUDED.collection,
  slug = EXCLUDED.slug,
  name_en = EXCLUDED.name_en,
  name_am = EXCLUDED.name_am,
  sort_order = EXCLUDED.sort_order,
  source_status = EXCLUDED.source_status;

COMMIT;