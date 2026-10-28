"""Generate the alias seed SQL (review_status = 'pending') from aliases.py."""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from aliases import TOPICS  # noqa: E402


def lit(s: str) -> str:
    return "'" + s.replace("'", "''") + "'"


def main(out: Path) -> None:
    rows = []
    for t in TOPICS:
        for a in t["aliases"]:
            script = "ethiopic" if re.search(r"[ሀ-፿]", a) else "latin"
            exp = "ARRAY[" + ", ".join(lit(e) for e in t["expansion"]) + "]::text[]"
            note = lit(t["note"]) if t["note"] else "NULL"
            rows.append(f"  ({lit(a)}, {lit(script)}, {lit(t['topic'])}, {exp}, {note})")
    sql = f"""-- ============================================================================
-- CHURCH LIBRARY SEARCH ALIASES — SEED (PROPOSED — REVIEW FIRST)
--
-- Requires PROPOSED_20261028_church_library_multilingual_search.sql.
-- Inserts {len(rows)} Amharic / transliterated aliases as review_status = 'pending'.
-- Pending aliases are IGNORED by search_church_library(). After a reviewer
-- has checked them (see church_faith_and_order_validation.md, "Alias review"),
-- approve them in one statement:
--
--   UPDATE public.church_library_search_aliases
--   SET review_status = 'approved', reviewed_at = now(), updated_at = now()
--   WHERE review_status = 'pending';
--
-- Aliases are search metadata. They are not source text and are never shown
-- to visitors as quotations.
-- ============================================================================
BEGIN;
INSERT INTO public.church_library_search_aliases (alias, script, topic, expansion, theological_note)
VALUES
{",\n".join(rows)}
ON CONFLICT (alias_folded, topic) DO NOTHING;
COMMIT;
"""
    out.write_text(sql, encoding="utf-8")
    print(f"{len(rows)} aliases -> {out}")


if __name__ == "__main__":
    main(Path(sys.argv[1]))
