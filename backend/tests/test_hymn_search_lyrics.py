"""GET /api/hymns/search: lyric search must honour public lyric rights and tolerate Ethiopic variants.

No network: supabase_get is replaced by an in-memory fake that records the filters it was given.
"""
import pytest

import main

AM_LYRIC = "ሠላም ለናንተ ይሁን እግዚአብሔር ከእናንተ ጋር"  # stored with the variant letter ሠ


def row(slug, **extra):
    base = {
        "slug": slug, "title": slug, "title_amharic": None, "title_english": None,
        "description": None, "description_amharic": None, "primary_language": "am", "form": "mezmur",
        "lyrics_amharic": None, "lyrics_transliteration": None, "lyrics_english": None,
        "lyrics_geez": None, "lyrics_oromo": None, "search_keywords": None,
        "youtube_url": None, "audio_url": None, "zemari_id": None,
        "status": "published", "rights_status": "owned",
    }
    base.update(extra)
    return base


def fake_supabase(rows, calls):
    async def supabase_get(path, params=None):
        calls.append((path, dict(params or {})))
        if path == "mezmur_data_import":
            return [dict(r) for r in rows]
        return []
    return supabase_get


def test_public_hymn_row_mirrors_the_public_projection():
    restricted = row("r", rights_status="restricted", lyrics_amharic="secret", title="Visible title")
    clean = main.public_hymn_row(restricted)
    assert clean["title"] == "Visible title"
    assert all(clean[f] is None for f in main.HYMN_LYRIC_FIELDS)
    assert restricted["lyrics_amharic"] == "secret", "the caller's row is not mutated"
    assert main.public_hymn_row(row("e", rights_status="external_only")) is None
    owned = row("o", lyrics_amharic="public lyric")
    assert main.public_hymn_row(owned)["lyrics_amharic"] == "public lyric"


def test_ilike_pattern_is_variant_tolerant_and_filter_safe():
    # ሠ and ሰ are the same letter family: both become the single-character wildcard.
    assert main.hymn_ilike_pattern("ሠላም  ለናንተ።") == "_ላም ለናንተ"
    assert main.hymn_ilike_pattern("ሰላም") == "_ላም"
    # PostgREST filter syntax characters and wildcards are removed, never passed through.
    assert main.hymn_ilike_pattern('a,b)(c*d"e%f') == "a b c d e f"
    assert main.hymn_ilike_pattern("።") == ""


@pytest.mark.asyncio
async def test_variant_spelling_finds_the_lyric_and_filters_use_wildcards(monkeypatch):
    calls = []
    monkeypatch.setattr(main, "supabase_get", fake_supabase([row("peace", lyrics_amharic=AM_LYRIC)], calls))
    results = await main.search_hymns("ሰላም ለናንተ", limit=10)  # user typed ሰ, stored text has ሠ
    assert [r["slug"] for r in results] == ["peace"]
    first = calls[0][1]["or"]
    assert "lyrics_amharic.ilike.*_ላም ለናንተ*" in first, first


@pytest.mark.asyncio
async def test_restricted_lyrics_never_match_or_preview(monkeypatch):
    calls = []
    rows = [
        row("restricted-hit", rights_status="restricted", title="Plain title", lyrics_amharic=AM_LYRIC),
        row("external", rights_status="external_only", title="Other", lyrics_amharic=AM_LYRIC),
        row("open", lyrics_amharic=AM_LYRIC),
    ]
    monkeypatch.setattr(main, "supabase_get", fake_supabase(rows, calls))
    results = await main.search_hymns("ሰላም ለናንተ", limit=10)
    slugs = [r["slug"] for r in results]
    assert slugs == ["open"], "restricted lyrics cannot be matched; external_only rows are not searchable"

    # A restricted hymn is still findable by TITLE, but its preview never contains lyrics.
    monkeypatch.setattr(main, "supabase_get", fake_supabase([rows[0]], []))
    by_title = await main.search_hymns("Plain title", limit=10)
    assert [r["slug"] for r in by_title] == ["restricted-hit"]
    assert AM_LYRIC.split()[0] not in (by_title[0]["preview"] or "")


@pytest.mark.asyncio
async def test_unpublished_rows_are_never_returned(monkeypatch):
    rows = [row("draft", status="draft", lyrics_amharic=AM_LYRIC)]
    monkeypatch.setattr(main, "supabase_get", fake_supabase(rows, []))
    assert await main.search_hymns("ሰላም ለናንተ", limit=10) == []


@pytest.mark.asyncio
async def test_token_recovery_searches_every_lyric_column(monkeypatch):
    calls = []
    monkeypatch.setattr(main, "supabase_get", fake_supabase([], calls))
    await main.search_hymns("selam alekum betam", limit=5)
    token_filters = [c[1]["or"] for c in calls if c[0] == "mezmur_data_import" and "limit" in c[1] and c[1]["limit"] == "30"]
    assert token_filters, "token recovery pass ran"
    for column in ("lyrics_amharic", "lyrics_transliteration", "lyrics_english", "lyrics_geez"):
        assert f"{column}.ilike.*" in token_filters[0]
