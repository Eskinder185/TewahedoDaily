# Bible source change log

**No scripture source files were changed.** `03-fixed-issues.csv` therefore has a header and zero data rows. Every current source SHA-256 matches the pre-audit snapshot in `corrected-source-manifest.json`. There are no added, removed, renumbered, or rewritten verse objects.

## Reviewed examples, preserved unchanged

### Clement 6

- Verse 83, source position `1:83`: one-character text `ፃ`. Text and label preserved; no edition-identified replacement was found.
- Verse 84, source position `1:84`: apparent OCR damage, including a Latin `D` and repeated mixed punctuation. Text preserved because reconstructing the wording would require guessing.
- Verse 86, source position `1:86`: blank. Kept blank pending the exact source transcription.

### Clement 9

- Verses 18–20, positions `1:18`–`1:20`: three consecutive blanks after an incomplete-looking verse 17. Kept blank pending source comparison.

### Didascalia 33

- Verses 152–157 and 226–232, positions `1:152`–`1:157` and `1:226`–`1:232`: thirteen blank source objects. Kept blank; no text was borrowed from another edition.

### Enoch 2:11 and other Latin-letter positions

- Source text includes `Wa` inside an Ethiopic word. All 33 Latin-letter positions are listed in `08-unicode-script-report.csv`; no mechanical replacement was made.

### Psalms 9

- Eighteen labels repeat later in the chapter. Original array order and explicit labels remain intact.

### Song of Songs 6:12–13

- The adjacent JSON verse texts are identical. A published Amharic comparison also repeats the opening phrase, but source identity and full text segmentation remain unverified. Both positions are unchanged.

### WEB Luke 17:36; Acts 8:37, 15:34, 24:7; Romans 16:25

- These five JSON texts remain empty. Official WEB Classic chapter pages show textual-variant markers at those locations. They are recorded as `NO_ISSUE` in this audit.

For all other flagged positions, consult `02-all-anomalies.csv` with neighboring text in `14-anomaly-context.csv`. `04-review-only.csv` contains the unresolved signals and their reasons for non-modification.
