# Liturgy JSON Extraction

Primary source: `englishethiopianliturgy.pdf`, *The Liturgy of the Ethiopian Church*.

This folder stores the PDF extraction as structured data for a future mobile-first liturgy page. Long liturgical wording is preserved as paragraph arrays so the UI can render accordions, tabs, compact readers, and source-aware detail views without becoming one wall of text.

Files:

- `base-structure.json`: stable liturgical framework grouped as Opening, Readings, Anaphora, Communion.
- `anaphoras.json`: the fourteen anaphoras, their full extracted text, source page ranges, occasion notes, and explicit/partial usage rules.
- `reading-pattern.json`: five-reading pattern described by the PDF and notes about getsawe dependency.
- `occasion-rules.json`: source-supported rules and partial rules derived from anaphora occasion notes.
- `communion.json`: invitation, declarations, receiving order, thanksgiving, and closing material extracted from the introduction and repeated paragraphs.
- `metadata.json`: extraction status and manual review notes.

Manual review remains necessary before using this data as a definitive liturgical resolver. The PDF gives many occasion notes, but not a complete daily getsawe table or a complete conflict-priority system for overlapping anaphora rules.
