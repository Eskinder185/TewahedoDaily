"""Regression tests for Ethiopian calendar conversion and next-occurrence."""
from __future__ import annotations

from datetime import date

import ethiopian_calendar as eth


def test_oct_19_2026_ethiopian_date():
    e = eth.gregorian_to_ethiopian(date(2026, 10, 19))
    assert e == eth.EthDate(2019, 2, 9)
    assert "Tikimt 9" in e.label()


def test_michael_next_from_oct_19_2026():
    payload = eth.michael_next_answer(date(2026, 10, 19))
    facts = payload["facts"]
    assert facts["found"] is True
    assert facts["monthly"]["gregorian"] == "2026-10-22"
    assert "Tikimt 12, 2019" in facts["monthly"]["ethiopian"]
    assert facts["next_annual"]["gregorian"] == "2026-11-21"
    assert "Hidar 12, 2019" in facts["next_annual"]["ethiopian"]
    assert "September 29" not in payload["answer"]
    assert "Five Mysteries" not in payload["answer"]
    # On-or-after: never past
    assert date.fromisoformat(facts["monthly"]["gregorian"]) >= date(2026, 10, 19)


def test_verified_chat_payload_skips_llm_path_shape():
    out = eth.try_verified_next_commemoration(
        "When is the next Saint Michael commemoration?",
        reference=date(2026, 10, 19),
    )
    assert out is not None
    assert out["calendar_verified"] is True
    assert out["calendar_found"] is True
    assert out["type"] == "ai"
    assert "October 22, 2026" in out["answer"] or "2026-10-22" in out["answer"]


def test_new_year_boundary_2026():
    assert eth.gregorian_to_ethiopian(date(2026, 9, 10)) == eth.EthDate(2018, 13, 5)
    assert eth.gregorian_to_ethiopian(date(2026, 9, 11)) == eth.EthDate(2019, 1, 1)


def test_pagumen_length_and_leap_day():
    assert eth.ethiopian_month_length(2018, 13) == 5
    assert eth.ethiopian_month_length(2019, 13) == 6
    g = eth.ethiopian_to_gregorian(2019, 13, 6)
    assert g == date(2027, 9, 11)
    hit = eth.next_fixed_on_or_after(date(2027, 8, 1), 13, 6)
    assert hit is not None
    assert hit[0] == eth.EthDate(2019, 13, 6)
    assert hit[1] == date(2027, 9, 11)


def test_monthly_day_12_skips_pagumen():
    hit = eth.next_monthly_day_on_or_after(date(2027, 9, 6), 12)
    assert hit is not None
    e, g = hit
    assert e.day == 12
    assert e.month == 1  # Meskerem


def test_amharic_michael_query():
    out = eth.try_verified_next_commemoration(
        "ቅዱስ ሚካኤል ቀጣይ መታሰቢያ መቼ ነው?",
        reference=date(2026, 10, 19),
    )
    assert out is not None
    assert out["calendar_found"] is True
    assert "Tikimt 12" in out["answer"]


def test_abstain_unknown_saint():
    out = eth.try_verified_next_commemoration(
        "When is the next Saint XYZZY feast?",
        reference=date(2026, 10, 19),
    )
    assert out is not None
    assert out["calendar_found"] is False
    assert "will not guess" in out["answer"].lower() or "አልገምትም" in out["answer"]


def test_prophets_fast_next():
    out = eth.try_verified_next_commemoration(
        "When is the next Fast of the Prophets?",
        reference=date(2026, 10, 19),
    )
    assert out is not None
    assert out["calendar_found"] is True
    assert "Hidar 15" in out["answer"] or "fasting" in out["answer"].lower()


def test_on_or_after_same_day():
    payload = eth.next_occurrence_answer(
        "When is the next Saint Michael commemoration?",
        date(2026, 10, 22),
    )
    assert payload["facts"]["monthly"]["gregorian"] == "2026-10-22"


def test_default_timezone_is_ethiopia():
    # Smoke: civil_today accepts Africa/Addis_Ababa
    d = eth.civil_today("Africa/Addis_Ababa")
    assert isinstance(d, date)


def test_loads_eotc_dataset_from_monorepo():
    entries = eth.load_eotc_entries()
    assert len(entries) > 10
    ids = {e.get("id") for e in entries}
    assert "saint-michael-monthly-12" in ids
