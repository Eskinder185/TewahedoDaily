import json, re, collections
OUT = 'content/church-library/seven-sacraments'
m = json.load(open(f'{OUT}/manifest.json', encoding='utf-8'))
ch = m['chapters']


def n_par(c, lang):
    return sum(s['paragraphs'] for s in c['sections'][lang])


def n_ref(c, lang):
    return sum(s['biblical_references'] for s in c['sections'][lang])


# ------------------------------------------------------------ alignment --
a = []
a.append('# Seven Sacraments — alignment report\n')
a.append('Status: **draft, not reviewed**. Nothing here has been published or imported.\n')
a.append('## Summary\n')
a.append('- The Amharic document and the verified English text share the same seven sacraments, so they align **at chapter level**.')
a.append('- They do **not** align paragraph by paragraph. The English is a separate, much shorter text, not a translation of the Amharic document:')
total_am = sum(n_par(c, 'am') for c in ch)
total_en = sum(n_par(c, 'en') for c in ch)
a.append(f'  - Amharic: {total_am} paragraphs in {m["counts"]["am"]["sections"]} sections.')
a.append(f'  - English: {total_en} paragraphs in {m["counts"]["en"]["sections"]} sections.')
a.append('- So no section or paragraph ID is shared between the languages:')
a.append('  - Amharic sections follow the source numbering (`SS-001-S003` is "1.3").')
a.append('  - English sections use `X` IDs (`SS-001-X001`), which mark language-specific content with no counterpart.')
a.append('- Pairing paragraphs would require a translator to judge equivalence, which these rules forbid.\n')
a.append('## Chapter mapping\n')
a.append('| ID | Amharic heading (source) | English heading (verified source) | English position in its source | Amharic ¶ | English ¶ |')
a.append('|---|---|---|---|---:|---:|')
for c in ch:
    en_t = c['title'].get('en') or '— (no English counterpart)'
    pos = c.get('en_source_order', '—' if c['id'] != 'SS-000' else 'opening')
    a.append(f"| {c['id']} | {c['title']['am']} | {en_t} | {pos} | {n_par(c, 'am')} | {n_par(c, 'en')} |")
a.append('')
a.append('## Differences recorded, not changed\n')
a.append('1. **Order:**')
a.append('   - The English source lists Ordination (d), Matrimony (e) and Penance (f).')
a.append('   - The Amharic source lists ምሥጢረ ንስሐ (4), ምሥጢረ ክህነት (5) and ምሥጢረ ተክሊል (6).')
a.append('   - Chapter IDs follow the Amharic order.')
a.append('   - Each English file records its original position (`en_source_order` in the manifest), and the English wording is unchanged.')
a.append('2. **Headings:**')
a.append('   - The English files keep the verified English headings, for example "Confirmation (Myron) (ሚስጥረ ሜሮን)" and "Mystery of Penance (ሚስጥረ ንስሀ)".')
a.append('   - The names in the brief\'s reference list ("Sacrament of Holy Chrismation" and so on) appear only as `reference_title` metadata.')
a.append('   - The English headings\' Amharic glosses ("ሚስጥረ", "ሚስጥረተክሊል", "ንስሀ") are spelled differently from the Amharic source ("ምሥጢረ", "ምሥጢረ ተክሊል", "ንስሐ"). Neither was altered.')
a.append('3. **English closing paragraph:**')
a.append('   - "Each of the Seven Sacraments has its own book of prayer…" is a general statement about all seven sacraments.')
a.append('   - It appears under Unction of the Sick in the source and stays there (`SS-007-X000`).')
a.append('4. **Amharic-only material:** these have no English counterpart, and none is invented:')
a.append('   - the epigraph and the invocation;')
a.append('   - the sections on how mysteries are classified (SS-000-S002 … S005);')
a.append('   - all 71 numbered subsections;')
a.append('   - the closing doxology and the colophon (SS-008).')
a.append('5. **English-only material:**')
a.append('   - "Order of Baptism" (SS-001-X001);')
a.append('   - the three ranks of ordination as separate subsections (SS-005-X001…X003).')
a.append('6. **Trailing heading:**')
a.append('   - The English source ends with "## BELIEFS AND TEACHINGS OF ETHIOPIAN ORTHODOX TEWAHEDO CHURCH", with no body text.')
a.append('   - It introduces another subject, so it is listed here and in the manifest rather than placed in a chapter.\n')
a.append('## Unresolved (needs a bilingual reviewer)\n')
for u in m['unresolved']:
    a.append(f"- **{u['chapter']}** — {u['issue']}: {u['detail']}")
a.append('')
a.append('If a reviewer later confirms that specific Amharic and English paragraphs correspond, add explicit alignment groups to `manifest.json`. Do not reuse IDs for them.')
open(f'{OUT}/alignment-report.md', 'w', encoding='utf-8').write('\n'.join(a) + '\n')

# ---------------------------------------------------------- completeness --
c_ = []
c_.append('# Seven Sacraments — completeness report\n')
v = m['validation']
c_.append(f"Validation: **{v['status'].upper()}** ({sum(x['passed'] for x in v['checks'])}/{len(v['checks'])} automated checks).")
c_.append('This does not mean the original book is complete. See "Known gaps in the source" below.\n')
c_.append('## Sources\n')
for lang, sd in m['source_documents'].items():
    c_.append(f"- **{lang}** `{sd['file']}`")
    c_.append(f"  - sha256 `{sd['sha256'][:16]}…`")
    c_.append(f"  - {sd['nonempty_lines']} non-empty lines")
c_.append(f"- Page numbers: **not available** — {m['source_documents']['am']['page_numbers_note']}\n")
c_.append('## How every Amharic source line was handled\n')
c_.append('| Disposition | Lines |')
c_.append('|---|---:|')
disp = re.search(r"dispositions: (\{.*\})", [x['detail'] for x in v['checks'] if 'accounted' in x['check']][0]).group(1)
for k, n in eval(disp).items():
    label = {'content': 'Content paragraphs (verbatim)', 'heading': 'Headings (verbatim)',
             'table_of_contents': 'Source table of contents (rebuilt from headings; kept in review/)',
             'review_marker_line': 'Lines that held only an editorial review marker (recorded in the manifest)',
             'unreadable_source_annex': 'Unreadable-source annex (kept in review/, not publishable)'}[k]
    c_.append(f'| {label} | {n} |')
c_.append('')
c_.append('## Counts per chapter\n')
c_.append('| ID | Amharic sections | Amharic ¶ | Amharic refs | English sections | English ¶ | English refs |')
c_.append('|---|---:|---:|---:|---:|---:|---:|')
for c in ch:
    c_.append(f"| {c['id']} | {len(c['sections']['am'])} | {n_par(c, 'am')} | {n_ref(c, 'am')} | {len(c['sections']['en'])} | {n_par(c, 'en')} | {n_ref(c, 'en')} |")
ca, ce = m['counts']['am'], m['counts']['en']
c_.append(f"| **Total** | {ca['sections']} | {ca['paragraphs']} | {ca['biblical_references']} | {ce['sections']} | {ce['paragraphs']} | {ce['biblical_references']} |")
c_.append('')
c_.append('"refs" counts scripture locators (chapter፥verse or chapter:verse). The same counts were taken from the sources and the output, and they match.\n')
c_.append('## Automated checks\n')
for x in v['checks']:
    c_.append(f"- {'✅' if x['passed'] else '❌'} {x['check']}" + (f" — {x['detail']}" if x['detail'] else ''))
c_.append('')
c_.append('## What was removed from publishable text (and where it went)\n')
c_.append(f"- **{ca['review_markers_removed']} inline editorial review markers** (〔ለግምገማ፦ ቤ-NN〕):")
c_.append('  - They point to a separate editorial report that was not supplied.')
c_.append('  - Each one is stored against its paragraph ID in `manifest.json` (`review_markers`).')
c_.append(f"- **{ca['stand_alone_marker_lines']} lines that held only a marker:**")
c_.append('  - 2 are in the front matter: the first review note, and the note pointing to annex ቤ-ግ01.')
c_.append('  - 4 are in the body, including the incomplete-phrase note 〔ያልተሟላው ሐረግ፦ አባሪ ቤ-ግ05።〕.')
c_.append('  - They are recorded on the neighbouring paragraph (`amharic_gaps` / `review_markers`).')
c_.append('- **Source table of contents** (80 lines):')
c_.append('  - It is kept verbatim in `review/source-table-of-contents-am.md`.')
c_.append('  - The reader builds its navigation from the headings, which are all present.')
c_.append(f"- **Unreadable-source annex** ({ca['annex_lines_withheld']} lines, fragments ቤ-ግ01–ቤ-ግ05 with their notes):")
c_.append('  - It is kept verbatim in `review/am-unreadable-source-annex.md`, marked not publishable.')
c_.append('  - Its fragments are damaged source text that was deliberately not reconstructed.')
c_.append(f"- **English:** {ce['formatting_artifacts_fixed']} formatting artifact fixed. HTML entities `&#x20;`/`&#x73;` had split a bold run:")
for f in m['english_formatting_fixes']:
    c_.append(f"  - line {f['line']}: `…{f['before'][-60:]}` → `…{f['after'][-60:]}`")
c_.append('')
c_.append('No wording, spelling, scripture reference or numbering was changed. That includes places that look like typing slips in either source; correcting those needs a reviewer.\n')
c_.append('## Known gaps in the source (coverage is NOT complete)\n')
c_.append('- The Amharic source itself marks **5 unreadable or incomplete fragments** (annex ቤ-ግ01–ቤ-ግ05):')
c_.append('  - an illegible preparer line;')
c_.append('  - a disordered Melchizedek passage;')
c_.append('  - an illegible phrase;')
c_.append('  - two garbled thanksgiving points;')
c_.append('  - an unfinished phrase after the washing of the feet.')
c_.append('  - These are not repaired; affected paragraphs are listed under `amharic_gaps` in the manifest.')
c_.append('- Original page numbers are unavailable, so citations use section and paragraph IDs only.')
c_.append('- The 153 editorial review markers cite an editorial report (ቤ-01 … ቤ-36) that is not in the repository. Those review points cannot be checked from here.')
c_.append('- English/Amharic alignment is chapter-level only (see `alignment-report.md`).')
open(f'{OUT}/completeness-report.md', 'w', encoding='utf-8').write('\n'.join(c_) + '\n')
print('ok')
