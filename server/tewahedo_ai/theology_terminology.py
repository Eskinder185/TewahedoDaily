"""Approved Ethiopian Orthodox Tewahedo terminology for AI grounding.

This is an editable, reviewable reference — not a claim of formal ecclesiastical
approval. Update here when clergy/catechetical review corrects wording.
"""

from __future__ import annotations

# Unicode escapes keep this file ASCII-safe in transit (same style as amharic_routing).

FIVE_MYSTERIES: list[dict[str, str]] = [
    {
        "key": "trinity",
        "en": "Mystery of the Trinity",
        "am": "\u121d\u1225\u1322\u1228\u0020\u1225\u120b\u1234",
    },
    {
        "key": "incarnation",
        "en": "Mystery of the Incarnation",
        "am": "\u121d\u1225\u1322\u1228\u0020\u1225\u130b\u12cc",
    },
    {
        "key": "baptism",
        "en": "Mystery of Baptism",
        "am": "\u121d\u1225\u1322\u1228\u0020\u1325\u121d\u1240\u1275",
    },
    {
        "key": "eucharist",
        "en": "Mystery of the Eucharist",
        "am": "\u121d\u1225\u1322\u1228\u0020\u1241\u122d\u1263\u1295",
    },
    {
        "key": "resurrection_of_the_dead",
        "en": "Mystery of the Resurrection of the Dead",
        "am": "\u121d\u1225\u1322\u1228\u0020\u1275\u1295\u1223\u12a4\u0020\u1219\u1273\u1295",
    },
]

FORBIDDEN_TRINITY_LABELS: tuple[str, ...] = (
    "\u1245\u12f5\u1235\u12eb\u0020\u120d\u12d1\u120d",
)

RELATED_TERMS: list[dict[str, str]] = [
    {
        "key": "meron",
        "en": "Holy Myron (chrism)",
        "am": "\u1245\u1265\u12d3\u0020\u121c\u122e\u1295",
    },
    {
        "key": "qendil",
        "en": "Oil of the lamp (unction of the sick)",
        "am": "\u1245\u1265\u12d3\u0020\u1240\u1295\u12f2\u120d",
    },
]


def mysteries_prompt_block() -> str:
    lines = [
        "Standard names for the Five Mysteries (\u12a0\u121d\u1235\u1271\u0020\u121d\u1225\u1322\u122b\u1275):",
    ]
    for i, row in enumerate(FIVE_MYSTERIES, start=1):
        lines.append(f"{i}. {row['am']} — {row['en']}")
    lines.append(
        "Never invent alternate Amharic headings for these mysteries "
        "(e.g. do not use malformed labels such as \u1245\u12f5\u1235\u12eb\u0020\u120d\u12d1\u120d)."
    )
    return "\n".join(lines)


def christology_prompt_block() -> str:
    return "\n".join(
        [
            "Christology (Tewahedo / Miaphysite):",
            "- Preserve the Ethiopian Orthodox Tewahedo understanding: one united nature of the "
            "Incarnate Word (full divinity and full humanity united without confusion, change, "
            "division, or separation).",
            "- Do not present Chalcedonian 'two natures after the union' formulations as if they "
            "were Ethiopian Orthodox doctrine.",
            "- Distinguish clearly:",
            "  * Holy Trinity (eternal three Persons, one God) vs Incarnation (the Son became man).",
            "  * Mystery of Baptism (Church sacrament) vs the Baptism of Jesus in the Jordan.",
            "  * Eucharist / Holy Qurban as true Body and Blood — not mere symbolic remembrance.",
            "  * Resurrection of Christ vs the future resurrection of the dead.",
            "  * \u1245\u1265\u12d3\u0020\u121c\u122e\u1295 (Holy Myron) vs \u1245\u1265\u12d3\u0020\u1240\u1295\u12f2\u120d "
            "(oil of the lamp / unction of the sick) — do not conflate them.",
        ]
    )
