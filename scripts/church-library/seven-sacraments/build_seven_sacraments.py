"""
Build the bilingual Seven Sacraments collection from the two verified sources.

Inputs (authoritative, never rewritten):
  sources/am-original.txt – original Amharic document (one paragraph per line, TOC at top,
                inline review markers 〔ለግምገማ፦ …〕, unreadable-source annex at end)
  sources/en-verified.md  – verified English text (Markdown, sections a–g)

Rules implemented here:
  * every source text line is emitted exactly once, verbatim, except
    - inline editorial review markers (〔…〕), which are removed from the text and
      recorded per paragraph in the manifest,
    - the source table of contents (rebuilt from the headings; listed in the report),
    - the unreadable-source annex (moved to review/, never publishable),
    - pure formatting artifacts in the English (HTML entities, a split bold run).
  * no text is added, translated, summarised or corrected.

Run from the repository root:
  python3 scripts/church-library/seven-sacraments/build_seven_sacraments.py
  python3 scripts/church-library/seven-sacraments/write_reports.py
"""
import hashlib, html, json, os, re, collections

OUT = 'content/church-library/seven-sacraments'
SRC_AM = f'{OUT}/sources/am-original.txt'
SRC_EN = f'{OUT}/sources/en-verified.md'
SUBJECT = 'seven-sacraments'
REVIEW_MARK = re.compile(r'\s*〔[^〕]*〕\s*')

CHAPTERS = [
    # id, number, am heading in source, en key, file stem, en title used in the reference list
    ('SS-001', 1, '1 ምሥጢረ ጥምቀት', 'a', '01-baptism', 'Sacrament of Baptism'),
    ('SS-002', 2, '2 ምሥጢረ ሜሮን', 'b', '02-holy-chrismation', 'Sacrament of Holy Chrismation'),
    ('SS-003', 3, '3 ምሥጢረ ቁርባን', 'c', '03-holy-eucharist', 'Sacrament of the Holy Eucharist'),
    ('SS-004', 4, '4 ምሥጢረ ንስሐ', 'f', '04-repentance', 'Sacrament of Repentance'),
    ('SS-005', 5, '5 ምሥጢረ ክህነት', 'd', '05-holy-orders', 'Sacrament of Holy Orders'),
    ('SS-006', 6, '6 ምሥጢረ ተክሊል', 'e', '06-holy-matrimony', 'Sacrament of Holy Matrimony'),
    ('SS-007', 7, '7 ምሥጢረ ቀንዲል', 'g', '07-unction-of-the-sick', 'Sacrament of Unction of the Sick'),
]

# Ethiopic "chapter፥verse" or Latin "chapter:verse" scripture locators.
REF_ET = re.compile(r'\d+\s*፥\s*\d+')
REF_LAT = re.compile(r'\b\d+\s*:\s*\d+')


def sha(text):
    return hashlib.sha256(text.encode('utf-8')).hexdigest()[:16]


def ref_count(text):
    return len(REF_ET.findall(text)) + len(REF_LAT.findall(text))


def block_type(line):
    if re.match(r'^-\s+\S', line):
        return 'list_item'
    if re.match(r'^\d+\.\s+\S', line):
        return 'list_item'
    if line.startswith('«') and line.rstrip().endswith(('»', '።')) and '»' in line:
        return 'quotation'
    return 'paragraph'


# ---------------------------------------------------------------- Amharic --
def parse_amharic():
    lines = open(SRC_AM, encoding='utf-8').read().split('\n')
    toc_start = lines.index('ማውጫ')
    annex_idx = max(i for i, l in enumerate(lines) if l.strip() == 'አባሪ የማይነበቡ የምንጭ ክፍሎች')
    toc = []
    i = toc_start + 1
    while lines[i].strip() != 'አባሪ የማይነበቡ የምንጭ ክፍሎች':
        if lines[i].strip():
            toc.append(lines[i].strip())
        i += 1
    toc_end = i  # TOC's own annex entry
    toc_set = set(toc)

    accounted = []  # (line_no, disposition)
    for n in range(toc_start, toc_end + 1):
        if lines[n].strip():
            accounted.append((n + 1, 'table_of_contents'))

    # Front matter (before the TOC): title, epigraph, date + review markers.
    front = []
    for n in range(0, toc_start):
        raw = lines[n].strip()
        if not raw:
            continue
        clean = REVIEW_MARK.sub(' ', raw).strip()
        markers = re.findall(r'〔[^〕]*〕', raw)
        if not clean:
            accounted.append((n + 1, 'review_marker_line'))
            front.append({'marker_only': True, 'line': n + 1, 'markers': markers})
            continue
        front.append({'line': n + 1, 'text': clean, 'markers': markers})
        accounted.append((n + 1, 'content'))

    # Body: chapters/sections by exact TOC heading matches.
    units = []  # flat list of dicts: heading / block / marker
    for n in range(toc_end + 1, annex_idx):
        raw = lines[n]
        s = raw.strip()
        if not s:
            continue
        if s in toc_set:
            units.append({'kind': 'heading', 'text': s, 'line': n + 1})
            accounted.append((n + 1, 'heading'))
            continue
        markers = re.findall(r'〔[^〕]*〕', s)
        clean = REVIEW_MARK.sub(' ', s).strip()
        clean = re.sub(r'[ \t]{2,}', ' ', clean)
        if not clean:
            units.append({'kind': 'marker', 'markers': markers, 'line': n + 1})
            accounted.append((n + 1, 'review_marker_line'))
            continue
        units.append({'kind': 'block', 'text': clean, 'line': n + 1, 'markers': markers, 'source': s})
        accounted.append((n + 1, 'content'))

    annex = [l for l in lines[annex_idx:] if l.strip()]
    for n in range(annex_idx, len(lines)):
        if lines[n].strip():
            accounted.append((n + 1, 'unreadable_source_annex'))
    total_nonempty = sum(1 for l in lines if l.strip())
    return {'lines': lines, 'toc': toc, 'front': front, 'units': units, 'annex': annex,
            'accounted': accounted, 'total_nonempty': total_nonempty, 'annex_line': annex_idx + 1}


# ---------------------------------------------------------------- English --
def parse_english():
    text = open(SRC_EN, encoding='utf-8').read()
    lines = text.split('\n')
    units = []
    artifacts = []
    chapter_re = re.compile(r'^\*\*([a-g])\.\s+(.+?)\*\*\s*$')
    for n, raw in enumerate(lines):
        s = raw.strip()
        if not s:
            continue
        fixed = html.unescape(s)
        # A bold run split by an encoded space ("generation **so") → "generation** so".
        fixed2 = re.sub(r'(\S) \*\*(\w)', r'\1** \2', fixed) if '&#x' in s else fixed
        if fixed2 != s:
            artifacts.append({'line': n + 1, 'before': s, 'after': fixed2})
        s = fixed2
        m = chapter_re.match(s)
        if m:
            units.append({'kind': 'chapter', 'key': m.group(1), 'text': m.group(2).strip(), 'line': n + 1, 'source': raw.strip()})
            continue
        if s.startswith('## '):
            units.append({'kind': 'trailing_heading', 'text': s[3:].strip(), 'line': n + 1})
            continue
        bold_heading = re.match(r'^\*\*([^*]+)\*\*$', s)
        if bold_heading and len(s) < 80:
            units.append({'kind': 'heading', 'text': bold_heading.group(1).strip(), 'line': n + 1, 'source': raw.strip()})
            continue
        units.append({'kind': 'block', 'text': s, 'line': n + 1, 'source': raw.strip()})
    total_nonempty = sum(1 for l in lines if l.strip())
    return {'units': units, 'artifacts': artifacts, 'total_nonempty': total_nonempty}


# --------------------------------------------------------------- emitters --
def fm(meta):
    out = ['---']
    for k, v in meta.items():
        if isinstance(v, str):
            out.append(f'{k}: {json.dumps(v, ensure_ascii=False)}')
        elif isinstance(v, bool):
            out.append(f'{k}: {"true" if v else "false"}')
        elif v is None:
            out.append(f'{k}: null')
        else:
            out.append(f'{k}: {v}')
    out.append('---')
    return '\n'.join(out)


def render_block(pid, b):
    text = b['text']
    if b['type'] == 'quotation':
        body = '> ' + text
    else:
        body = text
    return f'<!-- {pid} -->\n{body}'


def write_file(path, meta, title, sections):
    parts = [fm(meta), '', f'# {title} {{#{meta["id"]}}}', '']
    for sec in sections:
        if not sec['blocks'] and sec.get('title') is None:
            continue
        if sec.get('title') is not None:
            level = '###' if sec.get('level', 2) == 3 else '##'
            parts.append(f'{level} {sec["title"]} {{#{sec["id"]}}}')
            parts.append('')
        else:
            parts.append(f'<!-- section {sec["id"]} -->')
            parts.append('')
        for b in sec['blocks']:
            parts.append(render_block(b['id'], b))
            parts.append('')
    os.makedirs(os.path.dirname(path), exist_ok=True)
    open(path, 'w', encoding='utf-8').write('\n'.join(parts).rstrip() + '\n')


def number_blocks(sections):
    for sec in sections:
        for i, b in enumerate(sec['blocks'], 1):
            b['id'] = f'{sec["id"]}-P{i:03d}'


def build():
    am = parse_amharic()
    en = parse_english()
    manifest = {
        'subject': SUBJECT,
        'title': {'am': 'ምሥጢራተ ቤተ ክርስቲያን', 'en': 'The Seven Sacraments'},
        'source_documents': {
            'am': {'file': 'sources/am-original.txt', 'sha256': hashlib.sha256(open(SRC_AM, 'rb').read()).hexdigest(),
                   'nonempty_lines': am['total_nonempty'], 'page_numbers': None,
                   'page_numbers_note': 'The source carries no page numbers; its annex states that its line numbers are not page numbers.'},
            'en': {'file': 'sources/en-verified.md', 'sha256': hashlib.sha256(open(SRC_EN, 'rb').read()).hexdigest(),
                   'nonempty_lines': en['total_nonempty'], 'page_numbers': None},
        },
        'id_convention': 'SS-NNN chapter · SS-NNN-SNNN section · SS-NNN-SNNN-PNNN paragraph. '
                         'Section/paragraph IDs ending in X (e.g. SS-001-X001) are language-specific and have no counterpart.',
        'publication_status': 'draft',
        'chapters': [],
        'alignment_groups': [],
        'unresolved': [],
    }
    issues = []

    # ------------------------------------------------ Amharic structure ------
    am_files = {}
    # introduction: front matter + invocation + headings before chapter 1
    intro_sections = []
    pre = {'id': 'SS-000-S000', 'title': None, 'blocks': []}
    for f in am['front']:
        if f.get('marker_only'):
            continue
        pre['blocks'].append({'text': f['text'], 'type': block_type(f['text']), 'line': f['line'], 'markers': f['markers']})
    chapters = {c[2]: c for c in CHAPTERS}
    cur_chapter = 'intro'
    cur_section = pre
    intro_sections.append(pre)
    am_chapter_sections = collections.OrderedDict({'intro': intro_sections})
    intro_heading_count = 0
    sec_counters = collections.Counter()
    pending_markers = []
    for u in am['units']:
        if u['kind'] == 'heading':
            if u['text'] in chapters:
                cid = chapters[u['text']][0]
                cur_chapter = cid
                lead = {'id': f'{cid}-S000', 'title': None, 'blocks': [], 'line': u['line'], 'chapter_heading': u['text']}
                am_chapter_sections[cid] = [lead]
                cur_section = lead
                continue
            if cur_chapter == 'intro':
                intro_heading_count += 1
                sid = f'SS-000-S{intro_heading_count:03d}'
                cur_section = {'id': sid, 'title': u['text'], 'blocks': [], 'line': u['line']}
                intro_sections.append(cur_section)
                continue
            # numbered subsection "1.3 …" → S003
            m = re.match(r'^(\d+)\.(\d+)\s+(.+)$', u['text'])
            if not m:
                issues.append(f'Unrecognised heading at line {u["line"]}: {u["text"]}')
                continue
            sid = f'{cur_chapter}-S{int(m.group(2)):03d}'
            cur_section = {'id': sid, 'title': u['text'], 'blocks': [], 'line': u['line']}
            am_chapter_sections[cur_chapter].append(cur_section)
            continue
        if u['kind'] == 'marker':
            # Stand-alone marker: attach to the preceding block (or the next one).
            target = cur_section['blocks'][-1] if cur_section['blocks'] else None
            if target:
                target.setdefault('gap_markers', []).extend(u['markers'])
            else:
                pending_markers.extend(u['markers'])
            continue
        b = {'text': u['text'], 'type': block_type(u['text']), 'line': u['line'], 'markers': u['markers']}
        if pending_markers:
            b['gap_markers'] = pending_markers
            pending_markers = []
        cur_section['blocks'].append(b)

    # closing doxology + colophon (last two content lines of chapter 7) → own file
    last = am_chapter_sections['SS-007'][-1]
    closing_texts = ['ወስብሐት ለእግዚአብሔር።', 'በመናገሻ ገነተ ጽጌ ቅዱስ ጊዮርጊስ ቤተ ክርስቲያን ሰንበት ትምህርት ቤት ትምህርት ክፍል ተዘጋጀ።']
    closing = {'id': 'SS-008-S000', 'title': None, 'blocks': []}
    while last['blocks'] and last['blocks'][-1]['text'] in closing_texts:
        closing['blocks'].insert(0, last['blocks'].pop())
    assert [b['text'] for b in closing['blocks']] == closing_texts, closing['blocks']
    am_chapter_sections['SS-008'] = [closing]

    # ------------------------------------------------ English structure ------
    en_sections = collections.OrderedDict()
    key_to_cid = {c[3]: c[0] for c in CHAPTERS}
    en_titles = {}
    en_order = []
    cur = {'id': 'SS-000-X000', 'title': None, 'blocks': []}
    en_sections['intro'] = [cur]
    cur_cid = 'intro'
    trailing = []
    sub_counter = collections.Counter()
    for u in en['units']:
        if u['kind'] == 'chapter':
            cid = key_to_cid[u['key']]
            cur_cid = cid
            en_titles[cid] = u['text']
            en_order.append(cid)
            cur = {'id': f'{cid}-X000', 'title': None, 'blocks': [], 'line': u['line']}
            en_sections[cid] = [cur]
            continue
        if u['kind'] == 'trailing_heading':
            trailing.append(u)
            continue
        if u['kind'] == 'heading':
            sub_counter[cur_cid] += 1
            prefix = 'SS-000' if cur_cid == 'intro' else cur_cid
            cur = {'id': f'{prefix}-X{sub_counter[cur_cid]:03d}', 'title': u['text'], 'blocks': [], 'line': u['line'],
                   'level': 3}
            en_sections[cur_cid].append(cur)
            continue
        cur['blocks'].append({'text': u['text'], 'type': block_type(u['text']), 'line': u['line']})

    # ------------------------------------------------ number + write ---------
    for secs in list(am_chapter_sections.values()) + list(en_sections.values()):
        number_blocks(secs)

    def am_meta(cid, num, title):
        return {'id': cid, 'subject': SUBJECT, 'language': 'am', 'chapter_number': num, 'title': title,
                'source_document': 'sources/am-original.txt', 'translation_status': 'original', 'publication_status': 'draft'}

    def en_meta(cid, num, title, source_title=None):
        meta = {'id': cid, 'subject': SUBJECT, 'language': 'en', 'chapter_number': num, 'title': title,
                'source_document': 'sources/en-verified.md', 'translation_status': 'verified', 'publication_status': 'draft'}
        if source_title:
            meta['source_heading'] = source_title
        return meta

    plan = [('SS-000', 0, '00-introduction', 'intro', 'መግቢያ', 'Introduction')] + \
           [(c[0], c[1], c[4], c[0], c[2].split(' ', 1)[1], c[5]) for c in CHAPTERS] + \
           [('SS-008', 8, '08-closing', 'SS-008', 'ማጠቃለያ', None)]

    report_sections = []
    for cid, num, stem, key, am_title, en_title in plan:
        am_secs = am_chapter_sections.get(key if key != 'intro' else 'intro')
        if cid == 'SS-008':
            am_secs = am_chapter_sections['SS-008']
        am_path = f'{OUT}/am/{stem}.md'
        am_title_display = 'መግቢያ' if cid == 'SS-000' else ('ማጠቃለያ' if cid == 'SS-008' else am_title)
        am_meta_d = am_meta(cid, num, am_title_display)
        if cid == 'SS-000':
            am_meta_d['title_note'] = 'Heading supplied for navigation; the source introduction itself is headed መግቢያ (section SS-000-S001).'
        if cid == 'SS-008':
            am_meta_d['title_note'] = 'Heading supplied for navigation only; the source has no heading for its closing lines.'
        am_heading = next((x.get('chapter_heading') for x in am_secs if x.get('chapter_heading')), am_title_display)
        write_file(am_path, am_meta_d, am_heading, am_secs)

        en_secs = en_sections.get(key) if key in en_sections else None
        en_path = None
        if en_secs is not None:
            en_path = f'{OUT}/en/{stem}.md'
            src_title = en_titles.get(cid)
            # The verified English heading is kept as the title; the reference name is metadata only.
            title = src_title if src_title else 'Introduction'
            meta = en_meta(cid, num, title)
            meta['reference_title'] = en_title
            if cid == 'SS-000':
                meta['title_note'] = 'Heading supplied for navigation only; the English source opens without a heading.'
            write_file(en_path, meta, title, en_secs)

        def sec_summary(secs, lang):
            secs = [x for x in secs if x['blocks'] or x.get('title')]
            return [{'id': s['id'], 'title': s.get('title'), 'paragraphs': len(s['blocks']),
                     'paragraph_ids': [b['id'] for b in s['blocks']],
                     'biblical_references': sum(ref_count(b['text']) for b in s['blocks']),
                     'source_lines': [b['line'] for b in s['blocks']],
                     'review_markers': [{'paragraph': b['id'], 'markers': b.get('markers', []) + b.get('gap_markers', [])}
                                        for b in s['blocks'] if b.get('markers') or b.get('gap_markers')]}
                    for s in secs]

        ch = {'id': cid, 'chapter_number': num, 'title': {'am': am_title_display, 'en': (en_titles.get(cid) or ('Introduction' if cid == 'SS-000' and en_secs is not None else None)), 'en_reference': en_title},
              'files': {'am': am_path.replace(OUT + '/', ''), 'en': en_path.replace(OUT + '/', '') if en_path else None},
              'sections': {'am': sec_summary(am_secs, 'am'), 'en': sec_summary(en_secs, 'en') if en_secs is not None else []}}
        if cid in en_titles:
            ch['en_source_order'] = en_order.index(cid) + 1
        manifest['chapters'].append(ch)

        am_ids = [b['id'] for s in am_secs for b in s['blocks']]
        en_ids = [b['id'] for s in (en_secs or []) for b in s['blocks']]
        manifest['alignment_groups'].append({
            'group': f'{cid}-G', 'level': 'chapter', 'chapter': cid,
            'am_paragraphs': am_ids, 'en_paragraphs': en_ids,
            'alignment': 'chapter' if en_ids else 'amharic_only',
            'note': None if en_ids else 'No English counterpart in the verified English source.'})
        if en_ids:
            manifest['unresolved'].append({
                'chapter': cid,
                'issue': 'Paragraph- and section-level alignment not possible',
                'detail': f'Amharic has {len(am_ids)} paragraphs in {len(am_secs)} sections; the verified English has '
                          f'{len(en_ids)} paragraphs in {len(en_secs)} sections. The English is a separate, shorter text, '
                          'not a paragraph-by-paragraph translation, so only chapter-level alignment is asserted.'})

    # ------------------------------------------------ review annex ----------
    os.makedirs(f'{OUT}/review', exist_ok=True)
    open(f'{OUT}/review/am-unreadable-source-annex.md', 'w', encoding='utf-8').write(
        fm({'subject': SUBJECT, 'language': 'am', 'publication_status': 'not_publishable',
            'purpose': 'Unreadable / incomplete source fragments and their review notes, kept verbatim for reviewers.'})
        + '\n\n' + '\n\n'.join(am['annex']) + '\n')
    open(f'{OUT}/review/source-table-of-contents-am.md', 'w', encoding='utf-8').write(
        fm({'subject': SUBJECT, 'language': 'am', 'publication_status': 'not_publishable',
            'purpose': 'The source table of contents, verbatim. The reader rebuilds navigation from the headings.'})
        + '\n\n' + '\n'.join(f'- {t}' for t in am['toc']) + '\n')

    # ------------------------------------------------ validation -------------
    checks = []

    def check(name, ok, detail=''):
        checks.append({'check': name, 'passed': bool(ok), 'detail': detail})

    out_am_texts = []
    for p in sorted(os.listdir(f'{OUT}/am')):
        out_am_texts.append(open(f'{OUT}/am/{p}', encoding='utf-8').read())
    out_en_texts = []
    for p in sorted(os.listdir(f'{OUT}/en')):
        out_en_texts.append(open(f'{OUT}/en/{p}', encoding='utf-8').read())

    # every Amharic content line present verbatim (minus markers)
    am_blocks = [b for secs in am_chapter_sections.values() for s in secs for b in s['blocks']]
    src_lines = am['lines']
    missing = []
    joined_am = '\n'.join(out_am_texts)
    for n, disp in am['accounted']:
        if disp != 'content':
            continue
        clean = re.sub(r'[ \t]{2,}', ' ', REVIEW_MARK.sub(' ', src_lines[n - 1].strip()).strip())
        if clean not in joined_am:
            missing.append(n)
    check('Amharic: every content line is present verbatim (review markers removed)', not missing,
          f'{len([1 for _, d in am["accounted"] if d == "content"])} content lines checked; missing: {missing[:10]}')
    acc_lines = {n for n, _ in am['accounted']}
    all_nonempty = {i + 1 for i, l in enumerate(src_lines) if l.strip()}
    check('Amharic: every non-empty source line is accounted for', acc_lines == all_nonempty,
          f'{len(all_nonempty)} lines; dispositions: {dict(collections.Counter(d for _, d in am["accounted"]))}')
    am_block_count_once = collections.Counter(b['text'] for b in am_blocks)
    src_content = collections.Counter(re.sub(r'[ \t]{2,}', ' ', REVIEW_MARK.sub(' ', src_lines[n - 1].strip()).strip())
                                      for n, d in am['accounted'] if d == 'content')
    check('Amharic: no paragraph duplicated or dropped (multiset equality)', am_block_count_once == src_content)
    src_refs = sum(ref_count(REVIEW_MARK.sub(' ', src_lines[n - 1])) for n, d in am['accounted'] if d == 'content')
    out_refs = sum(ref_count(b['text']) for b in am_blocks)
    check('Amharic: biblical reference locators unchanged', src_refs == out_refs, f'{src_refs} in source, {out_refs} in output')
    headings_out = [s['title'] for secs in am_chapter_sections.values() for s in secs if s.get('title')] + \
                   [s.get('chapter_heading') for secs in am_chapter_sections.values() for s in secs if s.get('chapter_heading')]
    check('Amharic: every contents heading is present as a heading', set(am['toc']) - {'አባሪ የማይነበቡ የምንጭ ክፍሎች'} <= set(h for h in headings_out if h), f'{len(am["toc"]) - (1 if "አባሪ የማይነበቡ የምንጭ ክፍሎች" in am["toc"] else 0)} headings (+ the annex entry, kept out of the publishable files)')
    src_marker_total = sum(len(re.findall(r'〔[^〕]*〕', l)) for l in src_lines[:am['annex_line'] - 1])
    recorded = sum(len(b.get('markers', [])) + len(b.get('gap_markers', [])) for b in am_blocks) + sum(len(f['markers']) for f in am['front'])
    check('Amharic: every review marker is recorded in the manifest', src_marker_total == recorded, f'{src_marker_total} in source, {recorded} recorded')
    check('Amharic: all seven sacrament chapters present', all(c[0] in am_chapter_sections for c in CHAPTERS))
    check('Amharic: chapter order follows the source', list(am_chapter_sections.keys())[1:8] == [c[0] for c in CHAPTERS])
    check('Publishable Amharic files contain no review markers', not any('〔' in t for t in out_am_texts))

    en_blocks = [b for secs in en_sections.values() for s in secs for b in s['blocks']]
    en_src_lines = open(SRC_EN, encoding='utf-8').read().split('\n')
    joined_en = '\n'.join(out_en_texts)
    en_missing = []
    fixes = {a['line']: a['after'] for a in en['artifacts']}
    for u in en['units']:
        if u['kind'] in ('block',):
            if u['text'] not in joined_en:
                en_missing.append(u['line'])
    check('English: every passage present verbatim (formatting artifacts only)', not en_missing, f'missing lines: {en_missing}')
    en_src_refs = sum(ref_count(html.unescape(l)) for l in en_src_lines)
    en_out_refs = sum(ref_count(b['text']) for b in en_blocks)
    check('English: biblical reference locators unchanged', en_src_refs == en_out_refs, f'{en_src_refs} in source, {en_out_refs} in output')
    check('English: all seven sacrament headings present', len(en_titles) == 7, ', '.join(en_titles.values()))
    ids = [b['id'] for b in am_blocks + en_blocks] + [s['id'] for secs in list(am_chapter_sections.values()) + list(en_sections.values()) for s in secs]
    am_ids_all = [b['id'] for b in am_blocks]; en_ids_all = [b['id'] for b in en_blocks]
    check('IDs unique within each language', len(am_ids_all) == len(set(am_ids_all)) and len(en_ids_all) == len(set(en_ids_all)))
    check('No paragraph ID shared between languages (no unverified alignment)', not (set(am_ids_all) & set(en_ids_all)))
    check('Publishable English files contain no HTML entities', not re.search(r'&#x?[0-9a-f]+;', joined_en, re.I))

    manifest['validation'] = {'status': 'passed' if all(c['passed'] for c in checks) else 'failed', 'checks': checks}
    manifest['counts'] = {
        'am': {'chapters': 7, 'files': len(out_am_texts), 'sections': sum(len(v) for v in am_chapter_sections.values()),
               'paragraphs': len(am_blocks), 'biblical_references': out_refs,
               'review_markers_removed': sum(len(b.get('markers', [])) for b in am_blocks) + sum(len(f['markers']) for f in am['front']),
               'stand_alone_marker_lines': sum(1 for _, d in am['accounted'] if d == 'review_marker_line'),
               'annex_lines_withheld': len(am['annex']), 'toc_lines_rebuilt': len(am['toc']) + 2},
        'en': {'chapters': 7, 'files': len(out_en_texts), 'sections': sum(len(v) for v in en_sections.values()),
               'paragraphs': len(en_blocks), 'biblical_references': en_out_refs,
               'formatting_artifacts_fixed': len(en['artifacts']), 'trailing_headings_without_body': [t['text'] for t in trailing]},
    }
    manifest['english_formatting_fixes'] = en['artifacts']
    manifest['english_trailing_headings'] = [{'line': t['line'], 'text': t['text'],
                                             'note': 'Final heading of the English source with no body text; it introduces a different subject and is not part of the Seven Sacraments chapters.'} for t in trailing]
    manifest['amharic_gaps'] = [
        {'paragraph': b['id'], 'line': b['line'], 'markers': b['gap_markers']}
        for b in am_blocks if b.get('gap_markers')]
    json.dump(manifest, open(f'{OUT}/manifest.json', 'w', encoding='utf-8'), ensure_ascii=False, indent=2)
    return manifest, am, en, am_chapter_sections, en_sections, en_order, en_titles, trailing


if __name__ == '__main__':
    m, am, en, amc, enc, en_order, en_titles, trailing = build()
    print(json.dumps(m['counts'], ensure_ascii=False, indent=1))
    for c in m['validation']['checks']:
        print(('PASS ' if c['passed'] else 'FAIL ') + c['check'], '·', c['detail'])
