"""Search Buddy grounding in Church Library passages."""
from __future__ import annotations

from editorial import church_library_grounding as g

HIT = {
    "passage_id": "11111111-1111-1111-1111-111111111111",
    "book_id": "22222222-2222-2222-2222-222222222222",
    "title": "The Faith And Order Of The Church",
    "chapter_reference": "The Sacrament of Baptism",
    "locator_label": "One Baptism · Baptism of Infants",
    "page_start": 19,
    "page_end": 21,
    "excerpt": "Our church teaches that those who have been validly baptized must not be baptized again.",
}


def test_citation_includes_known_pages_only():
    assert g.citation_for(HIT) == (
        "The Faith And Order Of The Church — The Sacrament of Baptism › "
        "One Baptism · Baptism of Infants (pp. 19–21)"
    )
    no_pages = {**HIT, "page_start": None, "page_end": None}
    assert "p." not in g.citation_for(no_pages)
    single = {**HIT, "page_end": 19}
    assert g.citation_for(single).endswith("(p. 19)")


def test_retrieve_dedupes_limits_and_sets_language():
    calls = []

    def search(query, language, limit):
        calls.append((query, language, limit))
        return {"results": [HIT, HIT, {**HIT, "passage_id": "x2"}, {**HIT, "passage_id": "x3"},
                            {**HIT, "passage_id": "x4"}, {**HIT, "passage_id": "x5"}]}

    sources = g.retrieve("ጥምቀት ምንድን ነው?", search)
    assert calls == [("ጥምቀት ምንድን ነው?", "am", g.MAX_LIBRARY_PASSAGES)]
    assert [s["ref"] for s in sources] == ["L1", "L2", "L3", "L4"]
    assert len({s["passage_id"] for s in sources}) == 4
    assert sources[0]["route"] == f"/library/{HIT['book_id']}"


def test_retrieve_failure_is_silent():
    def broken(*_):
        raise RuntimeError("supabase down")

    assert g.retrieve("What is baptism?", broken) == []
    assert g.retrieve(" ", broken) == []


def test_context_block_grounds_or_declares_no_evidence():
    block = g.build_context_block(g.library_sources([HIT]))
    assert "[L1:" in block and "Never invent" in block and HIT["excerpt"] in block
    empty = g.build_context_block([])
    assert empty == g.NO_EVIDENCE_INSTRUCTION
    assert "not yet have enough indexed source evidence" in empty


def test_sources_drop_rows_without_ids():
    assert g.library_sources([{**HIT, "passage_id": None}]) == []
