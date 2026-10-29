# Seven Sacraments — alignment report

Status: **draft, not reviewed**. Nothing here has been published or imported.

## Summary

- The Amharic document and the verified English text share the same seven sacraments, so they align **at chapter level**.
- They do **not** align paragraph by paragraph. The English is a separate, much shorter text, not a translation of the Amharic document:
  - Amharic: 556 paragraphs in 80 sections.
  - English: 66 paragraphs in 12 sections.
- So no section or paragraph ID is shared between the languages:
  - Amharic sections follow the source numbering (`SS-001-S003` is "1.3").
  - English sections use `X` IDs (`SS-001-X001`), which mark language-specific content with no counterpart.
- Pairing paragraphs would require a translator to judge equivalence, which these rules forbid.

## Chapter mapping

| ID | Amharic heading (source) | English heading (verified source) | English position in its source | Amharic ¶ | English ¶ |
|---|---|---|---|---:|---:|
| SS-000 | መግቢያ | Introduction | opening | 54 | 9 |
| SS-001 | ምሥጢረ ጥምቀት | Baptism (ሚስጥረ ጥምቀት) | 1 | 101 | 17 |
| SS-002 | ምሥጢረ ሜሮን | Confirmation (Myron) (ሚስጥረ ሜሮን) | 2 | 36 | 2 |
| SS-003 | ምሥጢረ ቁርባን | Holy Communion (ሚስጥረ ቁርባን) | 3 | 85 | 2 |
| SS-004 | ምሥጢረ ንስሐ | Mystery of Penance (ሚስጥረ ንስሀ) | 6 | 65 | 4 |
| SS-005 | ምሥጢረ ክህነት | Ordination (ሚስጥረ ክህነት) | 4 | 89 | 16 |
| SS-006 | ምሥጢረ ተክሊል | Holy Matrimony (ሚስጥረተክሊል) | 5 | 102 | 13 |
| SS-007 | ምሥጢረ ቀንዲል | Unction of the Sick (ሚስጥረ ቀንዲል) | 7 | 22 | 3 |
| SS-008 | ማጠቃለያ | — (no English counterpart) | — | 2 | 0 |

## Differences recorded, not changed

1. **Order:**
   - The English source lists Ordination (d), Matrimony (e) and Penance (f).
   - The Amharic source lists ምሥጢረ ንስሐ (4), ምሥጢረ ክህነት (5) and ምሥጢረ ተክሊል (6).
   - Chapter IDs follow the Amharic order.
   - Each English file records its original position (`en_source_order` in the manifest), and the English wording is unchanged.
2. **Headings:**
   - The English files keep the verified English headings, for example "Confirmation (Myron) (ሚስጥረ ሜሮን)" and "Mystery of Penance (ሚስጥረ ንስሀ)".
   - The names in the brief's reference list ("Sacrament of Holy Chrismation" and so on) appear only as `reference_title` metadata.
   - The English headings' Amharic glosses ("ሚስጥረ", "ሚስጥረተክሊል", "ንስሀ") are spelled differently from the Amharic source ("ምሥጢረ", "ምሥጢረ ተክሊል", "ንስሐ"). Neither was altered.
3. **English closing paragraph:**
   - "Each of the Seven Sacraments has its own book of prayer…" is a general statement about all seven sacraments.
   - It appears under Unction of the Sick in the source and stays there (`SS-007-X000`).
4. **Amharic-only material:** these have no English counterpart, and none is invented:
   - the epigraph and the invocation;
   - the sections on how mysteries are classified (SS-000-S002 … S005);
   - all 71 numbered subsections;
   - the closing doxology and the colophon (SS-008).
5. **English-only material:**
   - "Order of Baptism" (SS-001-X001);
   - the three ranks of ordination as separate subsections (SS-005-X001…X003).
6. **Trailing heading:**
   - The English source ends with "## BELIEFS AND TEACHINGS OF ETHIOPIAN ORTHODOX TEWAHEDO CHURCH", with no body text.
   - It introduces another subject, so it is listed here and in the manifest rather than placed in a chapter.

## Unresolved (needs a bilingual reviewer)

- **SS-000** — Paragraph- and section-level alignment not possible: Amharic has 54 paragraphs in 6 sections; the verified English has 9 paragraphs in 1 sections. The English is a separate, shorter text, not a paragraph-by-paragraph translation, so only chapter-level alignment is asserted.
- **SS-001** — Paragraph- and section-level alignment not possible: Amharic has 101 paragraphs in 12 sections; the verified English has 17 paragraphs in 2 sections. The English is a separate, shorter text, not a paragraph-by-paragraph translation, so only chapter-level alignment is asserted.
- **SS-002** — Paragraph- and section-level alignment not possible: Amharic has 36 paragraphs in 8 sections; the verified English has 2 paragraphs in 1 sections. The English is a separate, shorter text, not a paragraph-by-paragraph translation, so only chapter-level alignment is asserted.
- **SS-003** — Paragraph- and section-level alignment not possible: Amharic has 85 paragraphs in 11 sections; the verified English has 2 paragraphs in 1 sections. The English is a separate, shorter text, not a paragraph-by-paragraph translation, so only chapter-level alignment is asserted.
- **SS-004** — Paragraph- and section-level alignment not possible: Amharic has 65 paragraphs in 10 sections; the verified English has 4 paragraphs in 1 sections. The English is a separate, shorter text, not a paragraph-by-paragraph translation, so only chapter-level alignment is asserted.
- **SS-005** — Paragraph- and section-level alignment not possible: Amharic has 89 paragraphs in 10 sections; the verified English has 16 paragraphs in 4 sections. The English is a separate, shorter text, not a paragraph-by-paragraph translation, so only chapter-level alignment is asserted.
- **SS-006** — Paragraph- and section-level alignment not possible: Amharic has 102 paragraphs in 14 sections; the verified English has 13 paragraphs in 1 sections. The English is a separate, shorter text, not a paragraph-by-paragraph translation, so only chapter-level alignment is asserted.
- **SS-007** — Paragraph- and section-level alignment not possible: Amharic has 22 paragraphs in 8 sections; the verified English has 3 paragraphs in 1 sections. The English is a separate, shorter text, not a paragraph-by-paragraph translation, so only chapter-level alignment is asserted.

If a reviewer later confirms that specific Amharic and English paragraphs correspond, add explicit alignment groups to `manifest.json`. Do not reuse IDs for them.
