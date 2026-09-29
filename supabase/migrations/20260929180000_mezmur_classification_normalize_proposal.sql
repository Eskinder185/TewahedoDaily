-- Optional cleanup for public.mezmur classification values.
-- REVIEW COUNTS BEFORE RUNNING. Does not execute automatically.
-- Inspected live published rows (2026-09-29): values already mostly canonical.
-- Remaining non-filterable noise is primarily literal 'NA' (category ~54, occasion ~197).
--
-- Proposed: leave 'NA' as-is in the database (public UI already hides it).
-- Only normalize known legacy spellings if they reappear.

begin;

-- Occasion legacy aliases → canonical
update public.mezmur
set occasion = 'Tinsae'
where occasion in ('Fasika', 'Fasika / Tinsae', 'fasika', 'tinsae', 'pascha');

update public.mezmur
set occasion = 'Lideta Maryam'
where occasion in ('Lidet le-Maryam', 'Lidet le Maryam', 'lidet-le-maryam');

update public.mezmur
set occasion = 'Debre Tabor'
where occasion in ('debre-tabor', 'Debre-Tabor');

update public.mezmur
set occasion = 'Abiy Tsom'
where occasion in ('abiy-tsom', 'Abiy-Tsom');

update public.mezmur
set occasion = 'Kidane Mihret'
where occasion in ('kidane-mihret', 'kidane-mehret', 'Kidane Mehret');

update public.mezmur
set occasion = 'New Year / Enkutatash'
where occasion in ('new-year', 'New Year', 'enkutatash', 'Enkutatash');

update public.mezmur
set occasion = 'General / Anytime'
where occasion in ('general-worship', 'General Worship', 'general', 'General');

-- Category legacy aliases → canonical (only if old slug values exist)
update public.mezmur
set category = 'Virgin Mary'
where category in ('mary', 'Mary', 'st-mary', 'St. Mary');

update public.mezmur
set category = 'Jesus Christ'
where category in ('christ', 'Christ');

update public.mezmur
set category = 'Praise / Worship'
where category in ('general-worship', 'praise', 'Praise');

update public.mezmur
set category = 'Kidus Gabriel'
where category in ('st-gabriel', 'St. Gabriel', 'qedus-gebriel');

-- Optional: convert literal NA to null so filters/search stay cleaner.
-- Uncomment only after confirming this matches editorial intent:
-- update public.mezmur set category = null where category in ('NA', 'na', 'N/A');
-- update public.mezmur set occasion = null where occasion in ('NA', 'na', 'N/A');

commit;
