# Church content workflow

Turns an approved recording, written teaching or announcement into source-linked drafts that a person reviews and approves.
It prepares and tracks. It never publishes, posts, sends or messages anyone.

```
Received → Processed → Needs review → Approved → Published
```

- **Received**: the source and its metadata are recorded (who, when, language, permission, permitted channels).
- **Processed**: a timestamped transcript (recordings) or numbered passages (written sources) exist.
- **Needs review**: a review page lists every point a person must check.
- **Approved**: a named person approved one exact version of a draft. Any later change returns it to review.
- **Published**: a person recorded where an approved version was published. The tool only records this.

## What runs where

| Step | Where it runs | Cost |
|---|---|---|
| Transcription and Amharic→English machine translation | This computer, `faster-whisper` (the engine of the `tanscibe` / Amharic Live project). Models `small` and `large-v3` are already downloaded. | None. Uses CPU unless the GPU's CUDA libraries are installed. |
| Scripture checks | Read-only lookups in the site's own Bible (English WEB and Amharic editions) through the public site database. | None. Needs internet and `.env.local`. |
| Drafts (summary, article, study guide, announcement) | Written by a person or by an assistant, from the drafting packet. If an assistant such as Claude writes them, that is a cloud service under your existing plan. The tool itself calls no model. | Whatever the assistant costs you. |
| Everything else (versions, glossary, review page, approval, export) | This computer. | None. |

All sources, transcripts, drafts and review records are stored in `content-workflow-data/`, which is ignored by git so private
material never reaches the repository. Set `CONTENT_WORKFLOW_DATA` to keep it elsewhere.

## Setup

1. `npm install` (already done for the website).
2. Python with faster-whisper. By default the tool uses `C:/Users/eskew/github/tanscibe/.venv/Scripts/python.exe`.
   To use another one: `CONTENT_WORKFLOW_PYTHON=<path to python>`.
3. The Whisper model must already be downloaded (it is never downloaded silently). To allow a download once:
   `CONTENT_WORKFLOW_ALLOW_DOWNLOAD=1`.
4. `.env.local` with the site's public database address, for Scripture checks.

Check it works: `npm run test:content-workflow`

## Commands

Every command is `npm run cw -- <command> …`.

| Command | What it does |
|---|---|
| `intake --kind recording\|teaching\|event\|notice\|bilingual --file <path> --title "…" [--speaker "…"] [--date YYYY-MM-DD] [--audience "…"] [--language am\|en\|am+en] [--permission confirmed\|unconfirmed\|denied] [--permission-note "who allowed what"] [--recorded-by "you"] [--channels website,telegram] [--sample]` | Records a source. Permission defaults to `unconfirmed`. A `confirmed` permission must say who allowed it and who recorded that. |
| `transcribe <id> [--translate] [--model large-v3] [--chunk-seconds 300]` | Recordings: timestamped transcript, and with `--translate` Whisper's English translation. Works in chunks; if it stops, run it again and it continues. |
| `extract <id>` | Written sources (`.txt`, `.md`): numbered passages `p1, p2, …`. |
| `glossary-apply <id>` | Applies **approved** glossary entries; every change is listed against its segment. |
| `correct <id> --segment s12 --text "…" --by "name" [--note "why"]` | A manual correction as a new version. Earlier versions are kept. |
| `scripture <id> [--add "John 3:16; Psalm 23:1"]` | Finds written references and checks them in both site editions. References spoken out in words are not detected: add them with `--add`. |
| `packet <id>` | Writes `packet.md`: the source with segment ids, flags, and the drafting rules. |
| `draft <id> --type summary\|article\|study-guide\|announcement\|event-page\|clips --file <draft.md> --generator "who wrote it"` | Records a draft version after checking it (see below). |
| `review <id>` | Builds `review/review.html` and `review/review.md`. |
| `decisions <id> --file <decisions.json>` | Records the reviewer's decisions downloaded from the review page. |
| `approve <id> --draft <type> --by "name" --role "role" --evidence "how approval was given"` | Records approval of the current version. Refused while anything is undecided, not accepted, or permission is not confirmed. |
| `export <id>` | Writes `export/preview.html`, per-channel text drafts and `cms-export.json`. Unapproved drafts are marked DRAFT. |
| `mark-published <id> --draft <type> --channel <channel> --url <where> --by "name"` | Records a publication of an approved version on a permitted channel. |
| `status [<id>] [--log]` | State of every item, or one item with its run log. |

## Draft format

A draft is a text file of blocks. The first line of a block says what the block **is**:

```
title-en: Patience in prayer
title-am: በጸሎት መታገሥ
::heading
Patience in prayer
::quote s12 lang=am
(exact words of segment s12, in the source language)
::translation s12
(English translation of s12)
::paraphrase s3-s5
(the speaker's point in other words)
::scripture John 3:16 edition=web
(the exact verse text of that edition; edition=am for the Amharic edition)
::detail p2
(a date, place or name taken from passage p2)
::generated
(wording that is not from the source: framing, study questions, explanation)
```

Checked automatically when a draft is recorded:

- a quotation is word for word what the cited segment says, in the source language;
- every paraphrase, translation and detail cites segments that exist;
- a Scripture block's text equals the verse in the named edition, otherwise it is refused and you flag the reference instead.

Checked by a person in review: whether a paraphrase or translation is faithful, whether generated wording is accurate and
appropriate, and anything touching doctrine (flagged "needs a qualified reviewer").

## Uncertainty

Transcripts carry the speech model's own raw signals. A segment is flagged "listen again" when the model's average
log-probability is low, when it may not be speech, when the output is repetitive, or when single words had low probability.
These are pointers for a listener, not accuracy scores, and an unflagged segment can still be wrong.

## Glossary

`glossary.json` holds preferred spellings and the variants to replace. Only entries with `"status": "approved"` and an
`approvedBy` name are applied. The entries shipped here are proposals.

## Limits

- Recorded audio only. Live captioning stays in the separate Amharic Live tool and would need its own accuracy and delay checks.
- Chunk boundaries can split a sentence across two segments.
- Speaker names are not detected; one speaker is recorded at intake.
- PDF and Word sources must be converted to text first.
- No connection to the website CMS yet: `cms-export.json` is a file for a later import.
- Sample content (`--sample`) can never be approved or published.
