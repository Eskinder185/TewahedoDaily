# Publication repair plan

1. Run the read-only audit SQL and review both records for the reported slug.
2. Preserve both rows and all relationships. Do not merge or delete them.
3. If they are distinct, assign a reviewed unique slug only to the new record,
   preserving the established URL for the existing record.
4. If they are duplicates, prepare a separate reversible proposal; do not
   automatically merge content or relationships.
5. Apply the UUID publication migration manually after review.
6. Re-run the audit and test a unique draft, the duplicate slug, and repeated
   bulk publication. Production SQL is not executed by this change.
