# Placing the editorial package

`content-review/` is gitignored and **must not** live inside the published monorepo
tree. Keep the package in a private location (for example the original
`tewahedo-ai` checkout) and set `CONTENT_REVIEW_ROOT` / `CONTENT_REVIEW_ZIP`.

If you use a local symlink or absolute path for private evaluation, these must exist:

```text
content-review/Catalog.json
content-review/DATA_FORMAT.md
content-review/QA_Report.json
content-review/SHA256SUMS.txt
content-review/books/{F01,S01,E01,M01,W01}/
content-review/review/
content-review/provenance/
content-review/validation/validate_library.py
```

Optional: `content-review.zip` (companion archive; root folder name may differ).

Environment overrides:

- `CONTENT_REVIEW_ROOT`
- `CONTENT_REVIEW_ZIP`
- `EDITORIAL_APPROVAL_STORE` (default `data/editorial_approvals.json`)
- `ENABLE_EDITORIAL_PREVIEW=1`
- `EDITORIAL_PREVIEW_TOKEN=<secret>` (never commit; never put in `VITE_*`)
